// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3071.s
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
   random seed:	656677246
   Jal stb_raw_1.j:	
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
        setx  0x0000000000000190, %g1, %r9
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
        setx  0x115b0098157ff7fe, %g1, %r0
        setx  0xc8b07de733822de4, %g1, %r1
        setx  0x2327dc83b2b026b2, %g1, %r2
        setx  0xd098c1b50de6cab8, %g1, %r3
        setx  0x5dab43227c79a0fa, %g1, %r4
        setx  0x4f2459fd98ed83ef, %g1, %r5
        setx  0x4eb68f61d0776678, %g1, %r6
        setx  0x8fc0903a86db2199, %g1, %r7
        setx  0x9b77c7fbe0e7a76f, %g1, %r10
        setx  0x48cb7016644f44f1, %g1, %r11
        setx  0x3bd862634611a50d, %g1, %r12
        setx  0xa0e5dc3cc8f0d4c3, %g1, %r13
        setx  0x9754f46fc7434946, %g1, %r14
        setx  0x4960b36c6c425cd1, %g1, %r15
        setx  0x76fdef084afce78d, %g1, %r16
        setx  0x7023583c9f876a0e, %g1, %r17
        setx  0x5d597816fb0b54e6, %g1, %r18
        setx  0x11d461644c6a8a44, %g1, %r19
        setx  0xcabea804502c7bd2, %g1, %r20
        setx  0x5d454e4437951a79, %g1, %r21
        setx  0xcae97248c8f64719, %g1, %r22
        setx  0xc42c6218caa3647e, %g1, %r23
        setx  0x1a29cf3e3a349577, %g1, %r24
        setx  0xa7eabde8e9d5f36c, %g1, %r25
        setx  0x135af54cb25e018c, %g1, %r26
        setx  0x56c4f3f50fc7d7c5, %g1, %r27
        setx  0xd6d409440e34b484, %g1, %r28
        setx  0xe30c241e0b14ce32, %g1, %r29
        setx  0x494cea00c93f140e, %g1, %r30
        setx  0x85bc61f4c1c4373f, %g1, %r31
	.word 0xf6720009  ! 3: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc44a0009  ! 3: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x0ec20001  ! 3: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xc6320009  ! 6: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc0a0009  ! 6: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 6: STBAR	stbar
	.word 0xc93a0009  ! 9: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc5020009  ! 9: LDF_R	ld	[%r8, %r9], %f2
	.word 0x0a800001  ! 9: BCS	bcs  	<label_0x1>
	.word 0xc6320009  ! 12: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc4a0009  ! 12: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x865a24c4  ! 12: SMUL_I	smul 	%r8, 0x04c4, %r3
	.word 0xc6720009  ! 15: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf7020009  ! 15: LDF_R	ld	[%r8, %r9], %f27
	.word 0xc3ea2f1c  ! 15: PREFETCHA_I	prefetcha	[%r8, + 0x0f1c] %asi, #one_read
	.word 0xc8220009  ! 18: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 18: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x2a800001  ! 18: BCS	bcs,a	<label_0x1>
	.word 0xfd3a0009  ! 21: STDF_R	std	%f30, [%r9, %r8]
	.word 0xfa5a0009  ! 21: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc36a0009  ! 21: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8220009  ! 24: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc31a0009  ! 24: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x26800002  ! 24: BL	bl,a	<label_0x2>
	.word 0xc82a0009  ! 27: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xd64a0009  ! 27: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xcc5a2ee8  ! 27: LDX_I	ldx	[%r8 + 0x0ee8], %r6
	.word 0xcf3a0009  ! 30: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc84a0009  ! 30: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x89a20829  ! 30: FADDs	fadds	%f8, %f9, %f4
	.word 0xcd3a0009  ! 33: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc41a0009  ! 33: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xf4ca1009  ! 33: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r26
	.word 0xce720009  ! 36: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xd65a0009  ! 36: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc2aa1009  ! 36: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 39: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc520009  ! 39: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea2c34  ! 39: PREFETCHA_I	prefetcha	[%r8, + 0x0c34] %asi, #one_read
	.word 0xe13a0009  ! 42: STDF_R	std	%f16, [%r9, %r8]
	.word 0xcd020009  ! 42: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143e041  ! 42: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xda320009  ! 45: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc24a0009  ! 45: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a2ce4  ! 45: PREFETCH_I	prefetch	[%r8 + 0x0ce4], #one_read
	.word 0xc53a0009  ! 48: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc25a0009  ! 48: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x856a0009  ! 48: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xc53a0009  ! 51: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8020009  ! 51: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x88520009  ! 51: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xf0720009  ! 54: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc41a0009  ! 54: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 54: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc53a0009  ! 57: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce520009  ! 57: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8da20929  ! 57: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc3220009  ! 60: STF_R	st	%f1, [%r9, %r8]
	.word 0xc01a0009  ! 60: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xa6fa0009  ! 60: SDIVcc_R	sdivcc 	%r8, %r9, %r19
	.word 0xc2320009  ! 63: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe3020009  ! 63: LDF_R	ld	[%r8, %r9], %f17
	.word 0xc3ea2df0  ! 63: PREFETCHA_I	prefetcha	[%r8, + 0x0df0] %asi, #one_read
	.word 0xce2a0009  ! 66: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca0a0009  ! 66: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xeeda24a0  ! 66: LDXA_I	ldxa	[%r8, + 0x04a0] %asi, %r23
	.word 0xc4220009  ! 69: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc0a0009  ! 69: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 69: STBAR	stbar
	.word 0xea320009  ! 72: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc41a0009  ! 72: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x06800002  ! 72: BL	bl  	<label_0x2>
	.word 0xce320009  ! 75: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 75: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x9d220009  ! 75: MULScc_R	mulscc 	%r8, %r9, %r14
	.word 0xfc2a0009  ! 78: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xde0a0009  ! 78: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xce422df0  ! 78: LDSW_I	ldsw	[%r8 + 0x0df0], %r7
	.word 0xc4220009  ! 81: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca5a0009  ! 81: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143c000  ! 81: STBAR	stbar
	.word 0xec720009  ! 84: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc4120009  ! 84: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xcd3a2bd0  ! 84: STDF_I	std	%f6, [0x0bd0, %r8]
	.word 0xc7220009  ! 87: STF_R	st	%f3, [%r9, %r8]
	.word 0xc9020009  ! 87: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143e000  ! 87: MEMBAR	membar	
	.word 0xcc320009  ! 90: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 90: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xdfe21009  ! 90: CASA_I	casa	[%r8] 0x80, %r9, %r15
	.word 0xe02a0009  ! 93: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xf65a0009  ! 93: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xce420009  ! 93: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xce320009  ! 96: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 96: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc4aa1009  ! 96: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 99: STF_R	st	%f7, [%r9, %r8]
	.word 0xc40a0009  ! 99: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x0cca0001  ! 99: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc62a0009  ! 102: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc91a0009  ! 102: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcaf21009  ! 102: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 105: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce120009  ! 105: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xa9a208a9  ! 105: FSUBs	fsubs	%f8, %f9, %f20
	.word 0xcc2a0009  ! 108: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcf1a0009  ! 108: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xf8ba1009  ! 108: STDA_R	stda	%r28, [%r8 + %r9] 0x80
	.word 0xda320009  ! 111: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xe65a0009  ! 111: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xc4da1009  ! 111: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xc6220009  ! 114: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 114: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc36a2fd4  ! 114: PREFETCH_I	prefetch	[%r8 + 0x0fd4], #one_read
	.word 0xcb220009  ! 117: STF_R	st	%f5, [%r9, %r8]
	.word 0xe9020009  ! 117: LDF_R	ld	[%r8, %r9], %f20
	.word 0xe8ca1009  ! 117: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r20
	.word 0xf2720009  ! 120: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xca020009  ! 120: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xce020009  ! 120: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc9220009  ! 123: STF_R	st	%f4, [%r9, %r8]
	.word 0xe41a0009  ! 123: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x8143c000  ! 123: STBAR	stbar
	.word 0xfc320009  ! 126: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc2120009  ! 126: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc6da2d20  ! 126: LDXA_I	ldxa	[%r8, + 0x0d20] %asi, %r3
	.word 0xc2220009  ! 129: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 129: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x9eda203c  ! 129: SMULcc_I	smulcc 	%r8, 0x003c, %r15
	.word 0xe8320009  ! 132: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xda0a0009  ! 132: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0x8143e019  ! 132: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xcf220009  ! 135: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc120009  ! 135: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc8522e70  ! 135: LDSH_I	ldsh	[%r8 + 0x0e70], %r4
	.word 0xe13a0009  ! 138: STDF_R	std	%f16, [%r9, %r8]
	.word 0xcc1a0009  ! 138: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea208c  ! 138: PREFETCHA_I	prefetcha	[%r8, + 0x008c] %asi, #one_read
	.word 0xcc720009  ! 141: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe3020009  ! 141: LDF_R	ld	[%r8, %r9], %f17
	.word 0x2e800001  ! 141: BVS	bvs,a	<label_0x1>
	.word 0xc2220009  ! 144: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcd020009  ! 144: LDF_R	ld	[%r8, %r9], %f6
	.word 0xe2fa1009  ! 144: SWAPA_R	swapa	%r17, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 147: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf41a0009  ! 147: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0x866a23dc  ! 147: UDIVX_I	udivx 	%r8, 0x03dc, %r3
	.word 0xc33a0009  ! 150: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce4a0009  ! 150: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143e033  ! 150: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xc33a0009  ! 153: STDF_R	std	%f1, [%r9, %r8]
	.word 0xea420009  ! 153: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0x8143e01c  ! 153: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xc93a0009  ! 156: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfa520009  ! 156: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x8143c000  ! 156: STBAR	stbar
	.word 0xcb220009  ! 159: STF_R	st	%f5, [%r9, %r8]
	.word 0xcd1a0009  ! 159: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc65a0009  ! 159: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc4320009  ! 162: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf8520009  ! 162: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xc5e21009  ! 162: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xf0320009  ! 165: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xcc020009  ! 165: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xceda26a8  ! 165: LDXA_I	ldxa	[%r8, + 0x06a8] %asi, %r7
	.word 0xc7220009  ! 168: STF_R	st	%f3, [%r9, %r8]
	.word 0xc3020009  ! 168: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143c000  ! 168: STBAR	stbar
	.word 0xe82a0009  ! 171: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xfc1a0009  ! 171: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xdec21009  ! 171: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r15
	.word 0xcb220009  ! 174: STF_R	st	%f5, [%r9, %r8]
	.word 0xc65a0009  ! 174: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x28800002  ! 174: BLEU	bleu,a	<label_0x2>
	.word 0xc4720009  ! 177: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc5020009  ! 177: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc91a0009  ! 177: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xf8320009  ! 180: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc44a0009  ! 180: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8b222838  ! 180: MULScc_I	mulscc 	%r8, 0x0838, %r5
	.word 0xcc320009  ! 183: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc120009  ! 183: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xf4520009  ! 183: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xc8720009  ! 186: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc31a0009  ! 186: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xafa208a9  ! 186: FSUBs	fsubs	%f8, %f9, %f23
	.word 0xe02a0009  ! 189: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc2520009  ! 189: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 189: STBAR	stbar
	.word 0xc2320009  ! 192: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf3020009  ! 192: LDF_R	ld	[%r8, %r9], %f25
	.word 0xc27a0009  ! 192: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xc8220009  ! 195: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe2120009  ! 195: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0x22800001  ! 195: BE	be,a	<label_0x1>
	.word 0xca320009  ! 198: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe44a0009  ! 198: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xcc7a0009  ! 198: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xc8320009  ! 201: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 201: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xa0da0009  ! 201: SMULcc_R	smulcc 	%r8, %r9, %r16
	.word 0xc8320009  ! 204: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 204: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x06c20001  ! 204: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xf3220009  ! 207: STF_R	st	%f25, [%r9, %r8]
	.word 0xc2120009  ! 207: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x30800001  ! 207: BA	ba,a	<label_0x1>
	.word 0xce220009  ! 210: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcf1a0009  ! 210: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc8a21009  ! 210: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xe0720009  ! 213: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xda420009  ! 213: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xc3ea1009  ! 213: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4220009  ! 216: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca0a0009  ! 216: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8a7a0009  ! 216: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xde320009  ! 219: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xef1a0009  ! 219: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0x8143c000  ! 219: STBAR	stbar
	.word 0xc9220009  ! 222: STF_R	st	%f4, [%r9, %r8]
	.word 0xce5a0009  ! 222: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcb020009  ! 222: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc8720009  ! 225: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce020009  ! 225: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x98722598  ! 225: UDIV_I	udiv 	%r8, 0x0598, %r12
	.word 0xc33a0009  ! 228: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc45a0009  ! 228: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xcb3a2d70  ! 228: STDF_I	std	%f5, [0x0d70, %r8]
	.word 0xc2220009  ! 231: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 231: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8f6a0009  ! 231: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xcc320009  ! 234: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 234: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xe0822028  ! 234: LDUWA_I	lduwa	[%r8, + 0x0028] %asi, %r16
	.word 0xcc2a0009  ! 237: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 237: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143e06d  ! 237: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc6220009  ! 240: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 240: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc3ea2ad8  ! 240: PREFETCHA_I	prefetcha	[%r8, + 0x0ad8] %asi, #one_read
	.word 0xfe2a0009  ! 243: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xce5a0009  ! 243: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea266c  ! 243: PREFETCHA_I	prefetcha	[%r8, + 0x066c] %asi, #one_read
	.word 0xe2320009  ! 246: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xca020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xca4a2450  ! 246: LDSB_I	ldsb	[%r8 + 0x0450], %r5
	.word 0xcc2a0009  ! 249: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xde0a0009  ! 249: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x89222e18  ! 249: MULScc_I	mulscc 	%r8, 0x0e18, %r4
	.word 0xc2720009  ! 252: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xda4a0009  ! 252: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x99a20829  ! 252: FADDs	fadds	%f8, %f9, %f12
	.word 0xfa2a0009  ! 255: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xf44a0009  ! 255: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0x8143e04e  ! 255: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xf0720009  ! 258: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xfa4a0009  ! 258: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xee0a0009  ! 258: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xe13a0009  ! 261: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc8520009  ! 261: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc60a29e4  ! 261: LDUB_I	ldub	[%r8 + 0x09e4], %r3
	.word 0xc2320009  ! 264: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 264: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xd68223e4  ! 264: LDUWA_I	lduwa	[%r8, + 0x03e4] %asi, %r11
	.word 0xc2720009  ! 267: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe20a0009  ! 267: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x865a2920  ! 267: SMUL_I	smul 	%r8, 0x0920, %r3
	.word 0xe4320009  ! 270: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xe5020009  ! 270: LDF_R	ld	[%r8, %r9], %f18
	.word 0xe2ea1009  ! 270: LDSTUBA_R	ldstuba	%r17, [%r8 + %r9] 0x80
	.word 0xed220009  ! 273: STF_R	st	%f22, [%r9, %r8]
	.word 0xf41a0009  ! 273: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0x8143c000  ! 273: STBAR	stbar
	.word 0xec220009  ! 276: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc5020009  ! 276: LDF_R	ld	[%r8, %r9], %f2
	.word 0xccaa2060  ! 276: STBA_I	stba	%r6, [%r8 + 0x0060] %asi
	.word 0xdb3a0009  ! 279: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc01a0009  ! 279: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc3ea1009  ! 279: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca320009  ! 282: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce420009  ! 282: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x2ac20001  ! 282: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xc22a0009  ! 285: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6520009  ! 285: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x987a0009  ! 285: SDIV_R	sdiv 	%r8, %r9, %r12
	.word 0xc6320009  ! 288: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xfa0a0009  ! 288: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xe2fa213c  ! 288: SWAPA_I	swapa	%r17, [%r8 + 0x013c] %asi
	.word 0xcb3a0009  ! 291: STDF_R	std	%f5, [%r9, %r8]
	.word 0xeb020009  ! 291: LDF_R	ld	[%r8, %r9], %f21
	.word 0xcf220009  ! 291: STF_R	st	%f7, [%r9, %r8]
	.word 0xc8720009  ! 294: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc020009  ! 294: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xa8520009  ! 294: UMUL_R	umul 	%r8, %r9, %r20
	.word 0xc53a0009  ! 297: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca520009  ! 297: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x2a800002  ! 297: BCS	bcs,a	<label_0x2>
	.word 0xe9220009  ! 300: STF_R	st	%f20, [%r9, %r8]
	.word 0xcc420009  ! 300: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xe00a0009  ! 300: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xca2a0009  ! 303: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce520009  ! 303: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8afa27e8  ! 303: SDIVcc_I	sdivcc 	%r8, 0x07e8, %r5
	.word 0xe2220009  ! 306: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc6520009  ! 306: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xa8da0009  ! 306: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0xc2220009  ! 309: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc91a0009  ! 309: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xe4f21009  ! 309: STXA_R	stxa	%r18, [%r8 + %r9] 0x80
	.word 0xf2720009  ! 312: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xe11a0009  ! 312: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xcc9a1009  ! 312: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xca2a0009  ! 315: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xdf1a0009  ! 315: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xeff21009  ! 315: CASXA_I	casxa	[%r8] 0x80, %r9, %r23
	.word 0xc8320009  ! 318: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc80a0009  ! 318: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xec7a0009  ! 318: SWAP_R	swap	%r22, [%r8 + %r9]
	.word 0xc4320009  ! 321: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc31a0009  ! 321: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8ad2200c  ! 321: UMULcc_I	umulcc 	%r8, 0x000c, %r5
	.word 0xc33a0009  ! 324: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc41a0009  ! 324: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x82f20009  ! 324: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xee220009  ! 327: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xe4420009  ! 327: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc49a2af0  ! 327: LDDA_I	ldda	[%r8, + 0x0af0] %asi, %r2
	.word 0xe53a0009  ! 330: STDF_R	std	%f18, [%r9, %r8]
	.word 0xce0a0009  ! 330: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x85a209a9  ! 330: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc62a0009  ! 333: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc4020009  ! 333: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc2ca1009  ! 333: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xe2320009  ! 336: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xf2520009  ! 336: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xb36a27e4  ! 336: SDIVX_I	sdivx	%r8, 0x07e4, %r25
	.word 0xc33a0009  ! 339: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe2520009  ! 339: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xbfa209a9  ! 339: FDIVs	fdivs	%f8, %f9, %f31
	.word 0xc73a0009  ! 342: STDF_R	std	%f3, [%r9, %r8]
	.word 0xec1a0009  ! 342: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x26c20001  ! 342: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xf7220009  ! 345: STF_R	st	%f27, [%r9, %r8]
	.word 0xf8520009  ! 345: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xca4a2930  ! 345: LDSB_I	ldsb	[%r8 + 0x0930], %r5
	.word 0xc5220009  ! 348: STF_R	st	%f2, [%r9, %r8]
	.word 0xf01a0009  ! 348: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0xc3220009  ! 351: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc420009  ! 351: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x824a20c8  ! 351: MULX_I	mulx 	%r8, 0x00c8, %r1
	.word 0xd8220009  ! 354: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xfe4a0009  ! 354: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xc3ea286c  ! 354: PREFETCHA_I	prefetcha	[%r8, + 0x086c] %asi, #one_read
	.word 0xcb220009  ! 357: STF_R	st	%f5, [%r9, %r8]
	.word 0xdc520009  ! 357: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x8c4a0009  ! 357: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xc9220009  ! 360: STF_R	st	%f4, [%r9, %r8]
	.word 0xeb1a0009  ! 360: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xc6821009  ! 360: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xe62a0009  ! 363: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xf2520009  ! 363: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xc8ba29c0  ! 363: STDA_I	stda	%r4, [%r8 + 0x09c0] %asi
	.word 0xc5220009  ! 366: STF_R	st	%f2, [%r9, %r8]
	.word 0xc5020009  ! 366: LDF_R	ld	[%r8, %r9], %f2
	.word 0x2c800002  ! 366: BNEG	bneg,a	<label_0x2>
	.word 0xcb220009  ! 369: STF_R	st	%f5, [%r9, %r8]
	.word 0xc91a0009  ! 369: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x36800001  ! 369: BGE	bge,a	<label_0x1>
	.word 0xca2a0009  ! 372: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc44a0009  ! 372: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a27c8  ! 372: PREFETCH_I	prefetch	[%r8 + 0x07c8], #one_read
	.word 0xc82a0009  ! 375: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 375: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc41a2c20  ! 375: LDD_I	ldd	[%r8 + 0x0c20], %r2
	.word 0xcd3a0009  ! 378: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc31a0009  ! 378: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x88520009  ! 378: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xf5220009  ! 381: STF_R	st	%f26, [%r9, %r8]
	.word 0xca4a0009  ! 381: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e067  ! 381: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xd93a0009  ! 384: STDF_R	std	%f12, [%r9, %r8]
	.word 0xfe520009  ! 384: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xc44a0009  ! 384: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc73a0009  ! 387: STDF_R	std	%f3, [%r9, %r8]
	.word 0xdc4a0009  ! 387: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xc36a2cb8  ! 387: PREFETCH_I	prefetch	[%r8 + 0x0cb8], #one_read
	.word 0xc4720009  ! 390: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 390: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x89a208a9  ! 390: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xd6220009  ! 393: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc8520009  ! 393: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143e04b  ! 393: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xc42a0009  ! 396: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc4520009  ! 396: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 396: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xee2a0009  ! 399: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xe31a0009  ! 399: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0x85a20829  ! 399: FADDs	fadds	%f8, %f9, %f2
	.word 0xc73a0009  ! 402: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfb1a0009  ! 402: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0x9c7222d4  ! 402: UDIV_I	udiv 	%r8, 0x02d4, %r14
	.word 0xce720009  ! 405: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xda520009  ! 405: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xc4c22a54  ! 405: LDSWA_I	ldswa	[%r8, + 0x0a54] %asi, %r2
	.word 0xc8320009  ! 408: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf6520009  ! 408: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xca8a1009  ! 408: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xcc320009  ! 411: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc41a0009  ! 411: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc2922480  ! 411: LDUHA_I	lduha	[%r8, + 0x0480] %asi, %r1
	.word 0xe4320009  ! 414: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xcc020009  ! 414: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x24ca0001  ! 414: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xcc720009  ! 417: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca120009  ! 417: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8d220009  ! 417: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc53a0009  ! 420: STDF_R	std	%f2, [%r9, %r8]
	.word 0xed020009  ! 420: LDF_R	ld	[%r8, %r9], %f22
	.word 0xc3ea1009  ! 420: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe8720009  ! 423: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xec0a0009  ! 423: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xcf222348  ! 423: STF_I	st	%f7, [0x0348, %r8]
	.word 0xfe720009  ! 426: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc41a0009  ! 426: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143e06f  ! 426: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xcf220009  ! 429: STF_R	st	%f7, [%r9, %r8]
	.word 0xf0420009  ! 429: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xce7a0009  ! 429: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xc8720009  ! 432: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc5020009  ! 432: LDF_R	ld	[%r8, %r9], %f2
	.word 0xbafa2b00  ! 432: SDIVcc_I	sdivcc 	%r8, 0x0b00, %r29
	.word 0xc53a0009  ! 435: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc4520009  ! 435: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x87a20929  ! 435: FMULs	fmuls	%f8, %f9, %f3
	.word 0xe8320009  ! 438: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc6420009  ! 438: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xceb2286c  ! 438: STHA_I	stha	%r7, [%r8 + 0x086c] %asi
	.word 0xf62a0009  ! 441: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xfe4a0009  ! 441: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xdcba2698  ! 441: STDA_I	stda	%r14, [%r8 + 0x0698] %asi
	.word 0xc2320009  ! 444: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd9020009  ! 444: LDF_R	ld	[%r8, %r9], %f12
	.word 0xccf21009  ! 444: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xcb220009  ! 447: STF_R	st	%f5, [%r9, %r8]
	.word 0xc65a0009  ! 447: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x0a800002  ! 447: BCS	bcs  	<label_0x2>
	.word 0xcc2a0009  ! 450: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe2420009  ! 450: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0x0e800002  ! 450: BVS	bvs  	<label_0x2>
	.word 0xc8220009  ! 453: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca420009  ! 453: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xccfa2688  ! 453: SWAPA_I	swapa	%r6, [%r8 + 0x0688] %asi
	.word 0xe2220009  ! 456: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xf6020009  ! 456: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0x14800001  ! 456: BG	bg  	<label_0x1>
	.word 0xc5220009  ! 459: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc0a0009  ! 459: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x2e800001  ! 459: BVS	bvs,a	<label_0x1>
	.word 0xce320009  ! 462: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf40a0009  ! 462: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xc65a0009  ! 462: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xfa2a0009  ! 465: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xf8020009  ! 465: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xa05a21dc  ! 465: SMUL_I	smul 	%r8, 0x01dc, %r16
	.word 0xc2320009  ! 468: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe2420009  ! 468: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xc2522188  ! 468: LDSH_I	ldsh	[%r8 + 0x0188], %r1
	.word 0xc62a0009  ! 471: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca120009  ! 471: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x26ca0001  ! 471: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xc8720009  ! 474: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe5020009  ! 474: LDF_R	ld	[%r8, %r9], %f18
	.word 0xcaa21009  ! 474: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xca720009  ! 477: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc0a0009  ! 477: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc91a0009  ! 477: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xf0220009  ! 480: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xcc1a0009  ! 480: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xdab21009  ! 480: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 483: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xda420009  ! 483: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x12800002  ! 483: BNE	bne  	<label_0x2>
	.word 0xe42a0009  ! 486: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc31a0009  ! 486: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x1a800001  ! 486: BCC	bcc  	<label_0x1>
	.word 0xe6720009  ! 489: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xe4020009  ! 489: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0x02ca0001  ! 489: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xe82a0009  ! 492: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc71a0009  ! 492: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc01a2778  ! 492: LDD_I	ldd	[%r8 + 0x0778], %r0
	.word 0xc9220009  ! 495: STF_R	st	%f4, [%r9, %r8]
	.word 0xe7020009  ! 495: LDF_R	ld	[%r8, %r9], %f19
	.word 0x8143c000  ! 495: STBAR	stbar
	.word 0xc4220009  ! 498: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 498: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc2b22c9c  ! 498: STHA_I	stha	%r1, [%r8 + 0x0c9c] %asi
	.word 0xc22a0009  ! 501: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xec520009  ! 501: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xf7022c78  ! 501: LDF_I	ld	[%r8, 0x0c78], %f27
	.word 0xc7220009  ! 504: STF_R	st	%f3, [%r9, %r8]
	.word 0xca0a0009  ! 504: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xe2a22214  ! 504: STWA_I	stwa	%r17, [%r8 + 0x0214] %asi
	.word 0xce220009  ! 507: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 507: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x82d22224  ! 507: UMULcc_I	umulcc 	%r8, 0x0224, %r1
	.word 0xc2220009  ! 510: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc81a0009  ! 510: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 510: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc53a0009  ! 513: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca420009  ! 513: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143e035  ! 513: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xe73a0009  ! 516: STDF_R	std	%f19, [%r9, %r8]
	.word 0xca120009  ! 516: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcc9a1009  ! 516: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xda2a0009  ! 519: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xd6020009  ! 519: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc8ea2284  ! 519: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0284] %asi
	.word 0xca320009  ! 522: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 522: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc5222d1c  ! 522: STF_I	st	%f2, [0x0d1c, %r8]
	.word 0xc7220009  ! 525: STF_R	st	%f3, [%r9, %r8]
	.word 0xca520009  ! 525: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xfcaa1009  ! 525: STBA_R	stba	%r30, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 528: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xd8020009  ! 528: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xc3ea2420  ! 528: PREFETCHA_I	prefetcha	[%r8, + 0x0420] %asi, #one_read
	.word 0xca2a0009  ! 531: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 531: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xccaa1009  ! 531: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xfe220009  ! 534: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xdc120009  ! 534: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xc8ea2b9c  ! 534: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0b9c] %asi
	.word 0xea320009  ! 537: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xce020009  ! 537: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcc821009  ! 537: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r6
	.word 0xe0220009  ! 540: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xf80a0009  ! 540: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xc36a0009  ! 540: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce2a0009  ! 543: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 543: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc89a2a18  ! 543: LDDA_I	ldda	[%r8, + 0x0a18] %asi, %r4
	.word 0xcb220009  ! 546: STF_R	st	%f5, [%r9, %r8]
	.word 0xca5a0009  ! 546: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xfa020009  ! 546: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xcb220009  ! 549: STF_R	st	%f5, [%r9, %r8]
	.word 0xc7020009  ! 549: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc8ba2010  ! 549: STDA_I	stda	%r4, [%r8 + 0x0010] %asi
	.word 0xd9220009  ! 552: STF_R	st	%f12, [%r9, %r8]
	.word 0xc51a0009  ! 552: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc2821009  ! 552: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xc3220009  ! 555: STF_R	st	%f1, [%r9, %r8]
	.word 0xfe5a0009  ! 555: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xcb3a2a50  ! 555: STDF_I	std	%f5, [0x0a50, %r8]
	.word 0xe93a0009  ! 558: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc20a0009  ! 558: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc2020009  ! 558: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcc2a0009  ! 561: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe80a0009  ! 561: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xcc120009  ! 561: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xd8220009  ! 564: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc8420009  ! 564: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 564: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd7220009  ! 567: STF_R	st	%f11, [%r9, %r8]
	.word 0xfe0a0009  ! 567: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xcd222fd4  ! 567: STF_I	st	%f6, [0x0fd4, %r8]
	.word 0xf02a0009  ! 570: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xce520009  ! 570: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x885a0009  ! 570: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xc2320009  ! 573: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc24a0009  ! 573: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x30800001  ! 573: BA	ba,a	<label_0x1>
	.word 0xc5220009  ! 576: STF_R	st	%f2, [%r9, %r8]
	.word 0xc25a0009  ! 576: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 576: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8320009  ! 579: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xd6020009  ! 579: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc6120009  ! 579: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xdc220009  ! 582: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc81a0009  ! 582: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x2a800001  ! 582: BCS	bcs,a	<label_0x1>
	.word 0xf3220009  ! 585: STF_R	st	%f25, [%r9, %r8]
	.word 0xc2120009  ! 585: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x14800002  ! 585: BG	bg  	<label_0x2>
	.word 0xcc320009  ! 588: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 588: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcff22009  ! 588: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc3220009  ! 591: STF_R	st	%f1, [%r9, %r8]
	.word 0xd8520009  ! 591: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xc8ba1009  ! 591: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xca720009  ! 594: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc420009  ! 594: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143e005  ! 594: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0xde320009  ! 597: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xce4a0009  ! 597: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc93a2860  ! 597: STDF_I	std	%f4, [0x0860, %r8]
	.word 0xf2320009  ! 600: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xe6420009  ! 600: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xd93a0009  ! 600: STDF_R	std	%f12, [%r9, %r8]
	.word 0xce220009  ! 603: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 603: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xce6a0009  ! 603: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xcf220009  ! 606: STF_R	st	%f7, [%r9, %r8]
	.word 0xf8420009  ! 606: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xcc0a0009  ! 606: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc82a0009  ! 609: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc020009  ! 609: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc2ca1009  ! 609: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xcc220009  ! 612: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 612: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x87222d00  ! 612: MULScc_I	mulscc 	%r8, 0x0d00, %r3
	.word 0xfa320009  ! 615: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc80a0009  ! 615: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3ea2b94  ! 615: PREFETCHA_I	prefetcha	[%r8, + 0x0b94] %asi, #one_read
	.word 0xcd220009  ! 618: STF_R	st	%f6, [%r9, %r8]
	.word 0xca4a0009  ! 618: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x89a208a9  ! 618: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xce320009  ! 621: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 621: LDF_R	ld	[%r8, %r9], %f2
	.word 0xccf21009  ! 621: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xd6220009  ! 624: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc80a0009  ! 624: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x984a0009  ! 624: MULX_R	mulx 	%r8, %r9, %r12
	.word 0xc4220009  ! 627: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc7020009  ! 627: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e02d  ! 627: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xe13a0009  ! 630: STDF_R	std	%f16, [%r9, %r8]
	.word 0xf5020009  ! 630: LDF_R	ld	[%r8, %r9], %f26
	.word 0xc8ba1009  ! 630: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xca320009  ! 633: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 633: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea27e0  ! 633: PREFETCHA_I	prefetcha	[%r8, + 0x07e0] %asi, #one_read
	.word 0xd7220009  ! 636: STF_R	st	%f11, [%r9, %r8]
	.word 0xcf020009  ! 636: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc3ea2db4  ! 636: PREFETCHA_I	prefetcha	[%r8, + 0x0db4] %asi, #one_read
	.word 0xcc720009  ! 639: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca5a0009  ! 639: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc4020009  ! 639: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xcc320009  ! 642: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc80a0009  ! 642: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xec6a2ed8  ! 642: LDSTUB_I	ldstub	%r22, [%r8 + 0x0ed8]
	.word 0xca720009  ! 645: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 645: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8a5a0009  ! 645: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xcc720009  ! 648: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfd020009  ! 648: LDF_R	ld	[%r8, %r9], %f30
	.word 0xce4a0009  ! 648: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xe0220009  ! 651: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc64a0009  ! 651: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x96520009  ! 651: UMUL_R	umul 	%r8, %r9, %r11
	.word 0xc2720009  ! 654: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 654: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xf8fa1009  ! 654: SWAPA_R	swapa	%r28, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 657: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe0520009  ! 657: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xcc5a2448  ! 657: LDX_I	ldx	[%r8 + 0x0448], %r6
	.word 0xc73a0009  ! 660: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc520009  ! 660: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8c5a0009  ! 660: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xfe220009  ! 663: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc8020009  ! 663: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x85a209a9  ! 663: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xfe720009  ! 666: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xd6520009  ! 666: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0x22800001  ! 666: BE	be,a	<label_0x1>
	.word 0xca220009  ! 669: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca420009  ! 669: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xca0a0009  ! 669: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xca220009  ! 672: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce420009  ! 672: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8143c000  ! 672: STBAR	stbar
	.word 0xc2320009  ! 675: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc81a0009  ! 675: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x1e800001  ! 675: BVC	bvc  	<label_0x1>
	.word 0xfb220009  ! 678: STF_R	st	%f29, [%r9, %r8]
	.word 0xf65a0009  ! 678: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xccca1009  ! 678: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xc8320009  ! 681: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc84a0009  ! 681: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x12800002  ! 681: BNE	bne  	<label_0x2>
	.word 0xef3a0009  ! 684: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc81a0009  ! 684: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8c4a2d50  ! 684: MULX_I	mulx 	%r8, 0x0d50, %r6
	.word 0xeb3a0009  ! 687: STDF_R	std	%f21, [%r9, %r8]
	.word 0xea0a0009  ! 687: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xe8d21009  ! 687: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r20
	.word 0xeb3a0009  ! 690: STDF_R	std	%f21, [%r9, %r8]
	.word 0xce020009  ! 690: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc4c229c0  ! 690: LDSWA_I	ldswa	[%r8, + 0x09c0] %asi, %r2
	.word 0xcf220009  ! 693: STF_R	st	%f7, [%r9, %r8]
	.word 0xce5a0009  ! 693: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x83a208a9  ! 693: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xcb3a0009  ! 696: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcb020009  ! 696: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc36a24ec  ! 696: PREFETCH_I	prefetch	[%r8 + 0x04ec], #one_read
	.word 0xca220009  ! 699: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce020009  ! 699: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xa24a2034  ! 699: MULX_I	mulx 	%r8, 0x0034, %r17
	.word 0xca720009  ! 702: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 702: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc4122580  ! 702: LDUH_I	lduh	[%r8 + 0x0580], %r2
	.word 0xfe2a0009  ! 705: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc80a0009  ! 705: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8da20829  ! 705: FADDs	fadds	%f8, %f9, %f6
	.word 0xe62a0009  ! 708: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xcc020009  ! 708: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc36a2fb0  ! 708: PREFETCH_I	prefetch	[%r8 + 0x0fb0], #one_read
	.word 0xc6220009  ! 711: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc5020009  ! 711: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc8ea2d4c  ! 711: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0d4c] %asi
	.word 0xcc320009  ! 714: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce420009  ! 714: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x0c800001  ! 714: BNEG	bneg  	<label_0x1>
	.word 0xc8720009  ! 717: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xec120009  ! 717: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xcc7a2cc0  ! 717: SWAP_I	swap	%r6, [%r8 + 0x0cc0]
	.word 0xc9220009  ! 720: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4420009  ! 720: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 720: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe4320009  ! 723: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc7020009  ! 723: LDF_R	ld	[%r8, %r9], %f3
	.word 0xe2b22af4  ! 723: STHA_I	stha	%r17, [%r8 + 0x0af4] %asi
	.word 0xc3220009  ! 726: STF_R	st	%f1, [%r9, %r8]
	.word 0xca0a0009  ! 726: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 726: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4320009  ! 729: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc84a0009  ! 729: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xcd3a2560  ! 729: STDF_I	std	%f6, [0x0560, %r8]
	.word 0xe6720009  ! 732: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xfc420009  ! 732: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xc36a0009  ! 732: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc9220009  ! 735: STF_R	st	%f4, [%r9, %r8]
	.word 0xc6520009  ! 735: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8e6a21c0  ! 735: UDIVX_I	udivx 	%r8, 0x01c0, %r7
	.word 0xcf3a0009  ! 738: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2420009  ! 738: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc53a2990  ! 738: STDF_I	std	%f2, [0x0990, %r8]
	.word 0xf2720009  ! 741: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xca4a0009  ! 741: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc0ba1009  ! 741: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 744: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfe120009  ! 744: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0x865a266c  ! 744: SMUL_I	smul 	%r8, 0x066c, %r3
	.word 0xc3220009  ! 747: STF_R	st	%f1, [%r9, %r8]
	.word 0xc25a0009  ! 747: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 747: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc53a0009  ! 750: STDF_R	std	%f2, [%r9, %r8]
	.word 0xfc420009  ! 750: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xcec22e20  ! 750: LDSWA_I	ldswa	[%r8, + 0x0e20] %asi, %r7
	.word 0xc5220009  ! 753: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8420009  ! 753: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcec21009  ! 753: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xf62a0009  ! 756: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xcb1a0009  ! 756: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143e07d  ! 756: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc62a0009  ! 759: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 759: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 759: STBAR	stbar
	.word 0xe4320009  ! 762: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xe4020009  ! 762: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0x89a208a9  ! 762: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc6320009  ! 765: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 765: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc8ea2e34  ! 765: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0e34] %asi
	.word 0xc73a0009  ! 768: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcd020009  ! 768: LDF_R	ld	[%r8, %r9], %f6
	.word 0x87a208a9  ! 768: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc42a0009  ! 771: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce020009  ! 771: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xbe7a0009  ! 771: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0xe8220009  ! 774: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xe41a0009  ! 774: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xce0a0009  ! 774: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc62a0009  ! 777: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xd85a0009  ! 777: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xa4da2e4c  ! 777: SMULcc_I	smulcc 	%r8, 0x0e4c, %r18
	.word 0xd82a0009  ! 780: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xce0a0009  ! 780: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x83a209a9  ! 780: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xfb220009  ! 783: STF_R	st	%f29, [%r9, %r8]
	.word 0xcf020009  ! 783: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc3ea2180  ! 783: PREFETCHA_I	prefetcha	[%r8, + 0x0180] %asi, #one_read
	.word 0xc33a0009  ! 786: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf2420009  ! 786: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x87a208a9  ! 786: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc33a0009  ! 789: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc40a0009  ! 789: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 789: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc320009  ! 792: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca420009  ! 792: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc4922354  ! 792: LDUHA_I	lduha	[%r8, + 0x0354] %asi, %r2
	.word 0xcf3a0009  ! 795: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc71a0009  ! 795: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x86da0009  ! 795: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xfc220009  ! 798: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc01a0009  ! 798: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8a5a2724  ! 798: SMUL_I	smul 	%r8, 0x0724, %r5
	.word 0xc22a0009  ! 801: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc4520009  ! 801: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc80228c8  ! 801: LDUW_I	lduw	[%r8 + 0x08c8], %r4
	.word 0xc8220009  ! 804: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 804: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xe2821009  ! 804: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r17
	.word 0xce720009  ! 807: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 807: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8cd20009  ! 807: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xc53a0009  ! 810: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc3020009  ! 810: LDF_R	ld	[%r8, %r9], %f1
	.word 0xb8f22a08  ! 810: UDIVcc_I	udivcc 	%r8, 0x0a08, %r28
	.word 0xce220009  ! 813: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc2420009  ! 813: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3ea2400  ! 813: PREFETCHA_I	prefetcha	[%r8, + 0x0400] %asi, #one_read
	.word 0xc62a0009  ! 816: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc20a0009  ! 816: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x02800001  ! 816: BE	be  	<label_0x1>
	.word 0xf0720009  ! 819: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xca520009  ! 819: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x2e800001  ! 819: BVS	bvs,a	<label_0x1>
	.word 0xc8720009  ! 822: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfc0a0009  ! 822: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xd6f225e8  ! 822: STXA_I	stxa	%r11, [%r8 + 0x05e8] %asi
	.word 0xc82a0009  ! 825: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 825: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcff22009  ! 825: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc62a0009  ! 828: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcb1a0009  ! 828: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x9cda0009  ! 828: SMULcc_R	smulcc 	%r8, %r9, %r14
	.word 0xc7220009  ! 831: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4020009  ! 831: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8143e01b  ! 831: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0xcb3a0009  ! 834: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc40a0009  ! 834: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x34800001  ! 834: BG	bg,a	<label_0x1>
	.word 0xc2220009  ! 837: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 837: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x867a0009  ! 837: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xfe220009  ! 840: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc81a0009  ! 840: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 840: STBAR	stbar
	.word 0xee320009  ! 843: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xf0120009  ! 843: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0x8143e03f  ! 843: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xce2a0009  ! 846: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfe0a0009  ! 846: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xcc6a0009  ! 846: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xc33a0009  ! 849: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc41a0009  ! 849: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x26800002  ! 849: BL	bl,a	<label_0x2>
	.word 0xc3220009  ! 852: STF_R	st	%f1, [%r9, %r8]
	.word 0xfc520009  ! 852: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x96522c94  ! 852: UMUL_I	umul 	%r8, 0x0c94, %r11
	.word 0xc9220009  ! 855: STF_R	st	%f4, [%r9, %r8]
	.word 0xfc120009  ! 855: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xada209a9  ! 855: FDIVs	fdivs	%f8, %f9, %f22
	.word 0xe2220009  ! 858: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xfa520009  ! 858: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xb66a0009  ! 858: UDIVX_R	udivx 	%r8, %r9, %r27
	.word 0xc5220009  ! 861: STF_R	st	%f2, [%r9, %r8]
	.word 0xce020009  ! 861: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc6da24b8  ! 861: LDXA_I	ldxa	[%r8, + 0x04b8] %asi, %r3
	.word 0xf1220009  ! 864: STF_R	st	%f24, [%r9, %r8]
	.word 0xc40a0009  ! 864: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xf6aa1009  ! 864: STBA_R	stba	%r27, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 867: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfa4a0009  ! 867: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xc3ea1009  ! 867: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe8220009  ! 870: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc45a0009  ! 870: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x2eca0001  ! 870: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc8720009  ! 873: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 873: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8a4a2dfc  ! 873: MULX_I	mulx 	%r8, 0x0dfc, %r5
	.word 0xce220009  ! 876: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcb020009  ! 876: LDF_R	ld	[%r8, %r9], %f5
	.word 0x14800002  ! 876: BG	bg  	<label_0x2>
	.word 0xc6220009  ! 879: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc31a0009  ! 879: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x89a209a9  ! 879: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc2720009  ! 882: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 882: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc36a0009  ! 882: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcf220009  ! 885: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2420009  ! 885: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc9f21009  ! 885: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xdc720009  ! 888: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xce5a0009  ! 888: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc4a22204  ! 888: STWA_I	stwa	%r2, [%r8 + 0x0204] %asi
	.word 0xc6320009  ! 891: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 891: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143e04c  ! 891: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xc8720009  ! 894: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xdc1a0009  ! 894: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc36a28f0  ! 894: PREFETCH_I	prefetch	[%r8 + 0x08f0], #one_read
	.word 0xca2a0009  ! 897: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 897: LDF_R	ld	[%r8, %r9], %f1
	.word 0xeeea27c4  ! 897: LDSTUBA_I	ldstuba	%r23, [%r8 + 0x07c4] %asi
	.word 0xc6220009  ! 900: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe2420009  ! 900: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xceea1009  ! 900: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 903: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc45a0009  ! 903: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc60a22fc  ! 903: LDUB_I	ldub	[%r8 + 0x02fc], %r3
	.word 0xc42a0009  ! 906: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 906: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143e03e  ! 906: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xe4220009  ! 909: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc41a0009  ! 909: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xac520009  ! 909: UMUL_R	umul 	%r8, %r9, %r22
	.word 0xcb3a0009  ! 912: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc71a0009  ! 912: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc4d21009  ! 912: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r2
	.word 0xdf220009  ! 915: STF_R	st	%f15, [%r9, %r8]
	.word 0xda020009  ! 915: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0x24ca0001  ! 915: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc8220009  ! 918: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 918: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143e07b  ! 918: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcc720009  ! 921: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xee520009  ! 921: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xf73a2770  ! 921: STDF_I	std	%f27, [0x0770, %r8]
	.word 0xc4220009  ! 924: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc71a0009  ! 924: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x865228a8  ! 924: UMUL_I	umul 	%r8, 0x08a8, %r3
	.word 0xf8220009  ! 927: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xcc1a0009  ! 927: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 927: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2220009  ! 930: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 930: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xfaa228e0  ! 930: STWA_I	stwa	%r29, [%r8 + 0x08e0] %asi
	.word 0xcc220009  ! 933: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc84a0009  ! 933: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 933: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb3a0009  ! 936: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc51a0009  ! 936: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x88f224a4  ! 936: UDIVcc_I	udivcc 	%r8, 0x04a4, %r4
	.word 0xc2220009  ! 939: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc6520009  ! 939: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x885a20b4  ! 939: SMUL_I	smul 	%r8, 0x00b4, %r4
	.word 0xcc320009  ! 942: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe6120009  ! 942: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xf47a236c  ! 942: SWAP_I	swap	%r26, [%r8 + 0x036c]
	.word 0xde2a0009  ! 945: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xfa4a0009  ! 945: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xc25a2608  ! 945: LDX_I	ldx	[%r8 + 0x0608], %r1
	.word 0xcd3a0009  ! 948: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce0a0009  ! 948: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x2eca0001  ! 948: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc6220009  ! 951: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc25a0009  ! 951: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xa2da0009  ! 951: SMULcc_R	smulcc 	%r8, %r9, %r17
	.word 0xce720009  ! 954: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 954: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc2ea1009  ! 954: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xca720009  ! 957: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc6120009  ! 957: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc84a29e0  ! 957: LDSB_I	ldsb	[%r8 + 0x09e0], %r4
	.word 0xeb220009  ! 960: STF_R	st	%f21, [%r9, %r8]
	.word 0xca5a0009  ! 960: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc2b21009  ! 960: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xed3a0009  ! 963: STDF_R	std	%f22, [%r9, %r8]
	.word 0xe65a0009  ! 963: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xccfa21b8  ! 963: SWAPA_I	swapa	%r6, [%r8 + 0x01b8] %asi
	.word 0xfa2a0009  ! 966: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xd9020009  ! 966: LDF_R	ld	[%r8, %r9], %f12
	.word 0x867a0009  ! 966: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xec320009  ! 969: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc8120009  ! 969: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 969: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdf220009  ! 972: STF_R	st	%f15, [%r9, %r8]
	.word 0xc60a0009  ! 972: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea27f0  ! 972: PREFETCHA_I	prefetcha	[%r8, + 0x07f0] %asi, #one_read
	.word 0xc4220009  ! 975: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc65a0009  ! 975: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8ba209a9  ! 975: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc6320009  ! 978: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc84a0009  ! 978: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8143c000  ! 978: STBAR	stbar
	.word 0xe3220009  ! 981: STF_R	st	%f17, [%r9, %r8]
	.word 0xe4520009  ! 981: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xda8a1009  ! 981: LDUBA_R	lduba	[%r8, %r9] 0x80, %r13
	.word 0xea720009  ! 984: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xca5a0009  ! 984: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x2a800001  ! 984: BCS	bcs,a	<label_0x1>
	.word 0xce320009  ! 987: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 987: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcc922e3c  ! 987: LDUHA_I	lduha	[%r8, + 0x0e3c] %asi, %r6
	.word 0xce2a0009  ! 990: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 990: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8d220009  ! 990: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xf3220009  ! 993: STF_R	st	%f25, [%r9, %r8]
	.word 0xca5a0009  ! 993: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143e043  ! 993: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xc82a0009  ! 996: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca520009  ! 996: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x24c20001  ! 996: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc7220009  ! 999: STF_R	st	%f3, [%r9, %r8]
	.word 0xf2420009  ! 999: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xc3ea1009  ! 999: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb220009  ! 1002: STF_R	st	%f5, [%r9, %r8]
	.word 0xce020009  ! 1002: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x24800001  ! 1002: BLE	ble,a	<label_0x1>
	.word 0xcd3a0009  ! 1005: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcf020009  ! 1005: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc4f22978  ! 1005: STXA_I	stxa	%r2, [%r8 + 0x0978] %asi
	.word 0xfe2a0009  ! 1008: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc45a0009  ! 1008: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x10800002  ! 1008: BA	ba  	<label_0x2>
	.word 0xe2720009  ! 1011: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xcc520009  ! 1011: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8cd20009  ! 1011: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xe93a0009  ! 1014: STDF_R	std	%f20, [%r9, %r8]
	.word 0xde020009  ! 1014: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xc7220009  ! 1014: STF_R	st	%f3, [%r9, %r8]
	.word 0xcd3a0009  ! 1017: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcb1a0009  ! 1017: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x12800001  ! 1017: BNE	bne  	<label_0x1>
	.word 0xc4220009  ! 1020: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca0a0009  ! 1020: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xceaa2aec  ! 1020: STBA_I	stba	%r7, [%r8 + 0x0aec] %asi
	.word 0xcc220009  ! 1023: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc5a0009  ! 1023: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xff220009  ! 1023: STF_R	st	%f31, [%r9, %r8]
	.word 0xfc2a0009  ! 1026: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xec1a0009  ! 1026: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x8e5a0009  ! 1026: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xc8720009  ! 1029: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce120009  ! 1029: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc8921009  ! 1029: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xdc2a0009  ! 1032: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc2420009  ! 1032: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xf6da1009  ! 1032: LDXA_R	ldxa	[%r8, %r9] 0x80, %r27
	.word 0xc62a0009  ! 1035: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 1035: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc8aa1009  ! 1035: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xfe220009  ! 1038: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xf84a0009  ! 1038: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x8c720009  ! 1038: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xfa320009  ! 1041: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xf4420009  ! 1041: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc36a0009  ! 1041: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb3a0009  ! 1044: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc80a0009  ! 1044: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xcafa2d78  ! 1044: SWAPA_I	swapa	%r5, [%r8 + 0x0d78] %asi
	.word 0xc73a0009  ! 1047: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc0a0009  ! 1047: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xb3222b38  ! 1047: MULScc_I	mulscc 	%r8, 0x0b38, %r25
	.word 0xcf220009  ! 1050: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc020009  ! 1050: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcd1a2110  ! 1050: LDDF_I	ldd	[%r8, 0x0110], %f6
	.word 0xdd3a0009  ! 1053: STDF_R	std	%f14, [%r9, %r8]
	.word 0xce0a0009  ! 1053: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xdf222b3c  ! 1053: STF_I	st	%f15, [0x0b3c, %r8]
	.word 0xfa220009  ! 1056: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xf4420009  ! 1056: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc2a21009  ! 1056: STWA_R	stwa	%r1, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 1059: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca520009  ! 1059: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e071  ! 1059: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xca220009  ! 1062: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca520009  ! 1062: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8143e040  ! 1062: MEMBAR	membar	#Sync 
	.word 0xca2a0009  ! 1065: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc20a0009  ! 1065: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc322232c  ! 1065: STF_I	st	%f1, [0x032c, %r8]
	.word 0xe9220009  ! 1068: STF_R	st	%f20, [%r9, %r8]
	.word 0xc60a0009  ! 1068: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xdf222e4c  ! 1068: STF_I	st	%f15, [0x0e4c, %r8]
	.word 0xdc2a0009  ! 1071: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc91a0009  ! 1071: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc9f21009  ! 1071: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xf2220009  ! 1074: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xcc420009  ! 1074: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcac21009  ! 1074: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xca320009  ! 1077: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc85a0009  ! 1077: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x88d20009  ! 1077: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xf8220009  ! 1080: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xce5a0009  ! 1080: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xfaa21009  ! 1080: STWA_R	stwa	%r29, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 1083: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 1083: LDF_R	ld	[%r8, %r9], %f3
	.word 0xec1a0009  ! 1083: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc2720009  ! 1086: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc2420009  ! 1086: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xe06a2438  ! 1086: LDSTUB_I	ldstub	%r16, [%r8 + 0x0438]
	.word 0xcb220009  ! 1089: STF_R	st	%f5, [%r9, %r8]
	.word 0xc24a0009  ! 1089: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8cfa0009  ! 1089: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xc6720009  ! 1092: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf8020009  ! 1092: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0x8143c000  ! 1092: STBAR	stbar
	.word 0xc7220009  ! 1095: STF_R	st	%f3, [%r9, %r8]
	.word 0xf64a0009  ! 1095: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x8143c000  ! 1095: STBAR	stbar
	.word 0xc7220009  ! 1098: STF_R	st	%f3, [%r9, %r8]
	.word 0xc44a0009  ! 1098: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8fa20829  ! 1098: FADDs	fadds	%f8, %f9, %f7
	.word 0xc93a0009  ! 1101: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce5a0009  ! 1101: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc8fa2e04  ! 1101: SWAPA_I	swapa	%r4, [%r8 + 0x0e04] %asi
	.word 0xc4320009  ! 1104: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca020009  ! 1104: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xceca1009  ! 1104: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xec2a0009  ! 1107: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xcc020009  ! 1107: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xf2822d98  ! 1107: LDUWA_I	lduwa	[%r8, + 0x0d98] %asi, %r25
	.word 0xc3220009  ! 1110: STF_R	st	%f1, [%r9, %r8]
	.word 0xc81a0009  ! 1110: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x00800001  ! 1110: BN	bn  	<label_0x1>
	.word 0xe93a0009  ! 1113: STDF_R	std	%f20, [%r9, %r8]
	.word 0xe4520009  ! 1113: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x3a800001  ! 1113: BCC	bcc,a	<label_0x1>
	.word 0xfc2a0009  ! 1116: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xce520009  ! 1116: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x22800001  ! 1116: BE	be,a	<label_0x1>
	.word 0xc73a0009  ! 1119: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcd020009  ! 1119: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8a6a0009  ! 1119: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc6220009  ! 1122: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf1020009  ! 1122: LDF_R	ld	[%r8, %r9], %f24
	.word 0x8143c000  ! 1122: STBAR	stbar
	.word 0xf7220009  ! 1125: STF_R	st	%f27, [%r9, %r8]
	.word 0xca120009  ! 1125: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc4ba1009  ! 1125: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xec220009  ! 1128: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc40a0009  ! 1128: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc3ea23e8  ! 1128: PREFETCHA_I	prefetcha	[%r8, + 0x03e8] %asi, #one_read
	.word 0xce220009  ! 1131: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe6120009  ! 1131: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x8143c000  ! 1131: STBAR	stbar
	.word 0xc4320009  ! 1134: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf85a0009  ! 1134: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xa9a209a9  ! 1134: FDIVs	fdivs	%f8, %f9, %f20
	.word 0xc3220009  ! 1137: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc120009  ! 1137: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1137: STBAR	stbar
	.word 0xc4220009  ! 1140: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 1140: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8143e07f  ! 1140: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc22a0009  ! 1143: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca420009  ! 1143: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143e037  ! 1143: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xee720009  ! 1146: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xc81a0009  ! 1146: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xaa522d14  ! 1146: UMUL_I	umul 	%r8, 0x0d14, %r21
	.word 0xc4220009  ! 1149: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xdc4a0009  ! 1149: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xcf22285c  ! 1149: STF_I	st	%f7, [0x085c, %r8]
	.word 0xcf3a0009  ! 1152: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc4120009  ! 1152: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc4ba2578  ! 1152: STDA_I	stda	%r2, [%r8 + 0x0578] %asi
	.word 0xc93a0009  ! 1155: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce4a0009  ! 1155: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x2eca0001  ! 1155: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xd6220009  ! 1158: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xcc420009  ! 1158: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x82fa0009  ! 1158: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xf6320009  ! 1161: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xec0a0009  ! 1161: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xc09a1009  ! 1161: LDDA_R	ldda	[%r8, %r9] 0x80, %r0
	.word 0xd82a0009  ! 1164: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xc60a0009  ! 1164: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xf6f22658  ! 1164: STXA_I	stxa	%r27, [%r8 + 0x0658] %asi
	.word 0xea220009  ! 1167: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xfd020009  ! 1167: LDF_R	ld	[%r8, %r9], %f30
	.word 0x8143c000  ! 1167: STBAR	stbar
	.word 0xe4220009  ! 1170: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xef020009  ! 1170: LDF_R	ld	[%r8, %r9], %f23
	.word 0x1a800002  ! 1170: BCC	bcc  	<label_0x2>
	.word 0xf53a0009  ! 1173: STDF_R	std	%f26, [%r9, %r8]
	.word 0xe81a0009  ! 1173: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x8143c000  ! 1173: STBAR	stbar
	.word 0xd62a0009  ! 1176: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc8420009  ! 1176: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc09a2460  ! 1176: LDDA_I	ldda	[%r8, + 0x0460] %asi, %r0
	.word 0xc8720009  ! 1179: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 1179: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc64a0009  ! 1179: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xf8320009  ! 1182: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xcf020009  ! 1182: LDF_R	ld	[%r8, %r9], %f7
	.word 0xe5f21009  ! 1182: CASXA_I	casxa	[%r8] 0x80, %r9, %r18
	.word 0xf5220009  ! 1185: STF_R	st	%f26, [%r9, %r8]
	.word 0xce020009  ! 1185: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xe09220ec  ! 1185: LDUHA_I	lduha	[%r8, + 0x00ec] %asi, %r16
	.word 0xf82a0009  ! 1188: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xde020009  ! 1188: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x87a209a9  ! 1188: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xdf3a0009  ! 1191: STDF_R	std	%f15, [%r9, %r8]
	.word 0xc20a0009  ! 1191: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc8fa233c  ! 1191: SWAPA_I	swapa	%r4, [%r8 + 0x033c] %asi
	.word 0xc7220009  ! 1194: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6120009  ! 1194: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc8b220d0  ! 1194: STHA_I	stha	%r4, [%r8 + 0x00d0] %asi
	.word 0xc5220009  ! 1197: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc420009  ! 1197: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xceb21009  ! 1197: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 1200: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca0a0009  ! 1200: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xfe821009  ! 1200: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r31
	.word 0xc2720009  ! 1203: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe91a0009  ! 1203: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0x86720009  ! 1203: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xcd220009  ! 1206: STF_R	st	%f6, [%r9, %r8]
	.word 0xc2120009  ! 1206: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x84d20009  ! 1206: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xcb220009  ! 1209: STF_R	st	%f5, [%r9, %r8]
	.word 0xc40a0009  ! 1209: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8e6a2270  ! 1209: UDIVX_I	udivx 	%r8, 0x0270, %r7
	.word 0xe8320009  ! 1212: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xec420009  ! 1212: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xc4ba1009  ! 1212: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 1215: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc7020009  ! 1215: LDF_R	ld	[%r8, %r9], %f3
	.word 0xb4720009  ! 1215: UDIV_R	udiv 	%r8, %r9, %r26
	.word 0xcd3a0009  ! 1218: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc45a0009  ! 1218: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x1a800001  ! 1218: BCC	bcc  	<label_0x1>
	.word 0xcc320009  ! 1221: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe6020009  ! 1221: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xc36a2a8c  ! 1221: PREFETCH_I	prefetch	[%r8 + 0x0a8c], #one_read
	.word 0xf02a0009  ! 1224: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xdc0a0009  ! 1224: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xf8f227d8  ! 1224: STXA_I	stxa	%r28, [%r8 + 0x07d8] %asi
	.word 0xe22a0009  ! 1227: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xf2120009  ! 1227: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xc8aa1009  ! 1227: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 1230: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf24a0009  ! 1230: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0x8143e05a  ! 1230: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xd62a0009  ! 1233: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc4520009  ! 1233: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xe47a0009  ! 1233: SWAP_R	swap	%r18, [%r8 + %r9]
	.word 0xc8320009  ! 1236: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 1236: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x89a208a9  ! 1236: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xc33a0009  ! 1239: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2020009  ! 1239: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xf07a0009  ! 1239: SWAP_R	swap	%r24, [%r8 + %r9]
	.word 0xc9220009  ! 1242: STF_R	st	%f4, [%r9, %r8]
	.word 0xc01a0009  ! 1242: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x02800002  ! 1242: BE	be  	<label_0x2>
	.word 0xc3220009  ! 1245: STF_R	st	%f1, [%r9, %r8]
	.word 0xd71a0009  ! 1245: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0x0cca0001  ! 1245: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xcd3a0009  ! 1248: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc2420009  ! 1248: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xa36a0009  ! 1248: SDIVX_R	sdivx	%r8, %r9, %r17
	.word 0xc93a0009  ! 1251: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc71a0009  ! 1251: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcaaa2048  ! 1251: STBA_I	stba	%r5, [%r8 + 0x0048] %asi
	.word 0xc4220009  ! 1254: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca120009  ! 1254: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc36a273c  ! 1254: PREFETCH_I	prefetch	[%r8 + 0x073c], #one_read
	.word 0xc6320009  ! 1257: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 1257: LDF_R	ld	[%r8, %r9], %f3
	.word 0x30800002  ! 1257: BA	ba,a	<label_0x2>
	.word 0xc2220009  ! 1260: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xda5a0009  ! 1260: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xea7a2018  ! 1260: SWAP_I	swap	%r21, [%r8 + 0x0018]
	.word 0xc22a0009  ! 1263: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe0020009  ! 1263: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xca921009  ! 1263: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xca720009  ! 1266: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcf020009  ! 1266: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc9220009  ! 1266: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2220009  ! 1269: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc8120009  ! 1269: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xacfa0009  ! 1269: SDIVcc_R	sdivcc 	%r8, %r9, %r22
	.word 0xf0320009  ! 1272: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc44a0009  ! 1272: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xfeb21009  ! 1272: STHA_R	stha	%r31, [%r8 + %r9] 0x80
	.word 0xe6220009  ! 1275: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc7020009  ! 1275: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc91a2490  ! 1275: LDDF_I	ldd	[%r8, 0x0490], %f4
	.word 0xf5220009  ! 1278: STF_R	st	%f26, [%r9, %r8]
	.word 0xdc120009  ! 1278: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0x06ca0001  ! 1278: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc93a0009  ! 1281: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc01a0009  ! 1281: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xf09a1009  ! 1281: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0xc4220009  ! 1284: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcf1a0009  ! 1284: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xca7a0009  ! 1284: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xc4320009  ! 1287: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf01a0009  ! 1287: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x10800002  ! 1287: BA	ba  	<label_0x2>
	.word 0xcc720009  ! 1290: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 1290: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc2b22d68  ! 1290: STHA_I	stha	%r1, [%r8 + 0x0d68] %asi
	.word 0xeb3a0009  ! 1293: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc81a0009  ! 1293: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3222a4c  ! 1293: STF_I	st	%f1, [0x0a4c, %r8]
	.word 0xdc320009  ! 1296: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc41a0009  ! 1296: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x86fa2b90  ! 1296: SDIVcc_I	sdivcc 	%r8, 0x0b90, %r3
	.word 0xc8320009  ! 1299: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 1299: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x3e800001  ! 1299: BVC	bvc,a	<label_0x1>
	.word 0xf73a0009  ! 1302: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc45a0009  ! 1302: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x9fa208a9  ! 1302: FSUBs	fsubs	%f8, %f9, %f15
	.word 0xea320009  ! 1305: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xf1020009  ! 1305: LDF_R	ld	[%r8, %r9], %f24
	.word 0xc36a0009  ! 1305: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe02a0009  ! 1308: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc65a0009  ! 1308: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x88d22390  ! 1308: UMULcc_I	umulcc 	%r8, 0x0390, %r4
	.word 0xcc2a0009  ! 1311: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce520009  ! 1311: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xdafa1009  ! 1311: SWAPA_R	swapa	%r13, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 1314: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc40a0009  ! 1314: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x1c800001  ! 1314: BPOS	bpos  	<label_0x1>
	.word 0xf8320009  ! 1317: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xca420009  ! 1317: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x0a800001  ! 1317: BCS	bcs  	<label_0x1>
	.word 0xc7220009  ! 1320: STF_R	st	%f3, [%r9, %r8]
	.word 0xec1a0009  ! 1320: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x12800001  ! 1320: BNE	bne  	<label_0x1>
	.word 0xcc220009  ! 1323: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc8020009  ! 1323: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xee6a0009  ! 1323: LDSTUB_R	ldstub	%r23, [%r8 + %r9]
	.word 0xc3220009  ! 1326: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc1a0009  ! 1326: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x845a2e24  ! 1326: SMUL_I	smul 	%r8, 0x0e24, %r2
	.word 0xca720009  ! 1329: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc7020009  ! 1329: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e06a  ! 1329: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc6720009  ! 1332: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcd1a0009  ! 1332: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xf13a0009  ! 1332: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc8220009  ! 1335: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc24a0009  ! 1335: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc8f21009  ! 1335: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 1338: STF_R	st	%f6, [%r9, %r8]
	.word 0xce0a0009  ! 1338: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xdc9a1009  ! 1338: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0xcd3a0009  ! 1341: STDF_R	std	%f6, [%r9, %r8]
	.word 0xee4a0009  ! 1341: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0x8143e07d  ! 1341: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc2720009  ! 1344: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xec520009  ! 1344: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xc6020009  ! 1344: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc62a0009  ! 1347: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 1347: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xcab21009  ! 1347: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc9220009  ! 1350: STF_R	st	%f4, [%r9, %r8]
	.word 0xf05a0009  ! 1350: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xecd22d6c  ! 1350: LDSHA_I	ldsha	[%r8, + 0x0d6c] %asi, %r22
	.word 0xde320009  ! 1353: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc40a0009  ! 1353: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xdf222e88  ! 1353: STF_I	st	%f15, [0x0e88, %r8]
	.word 0xed220009  ! 1356: STF_R	st	%f22, [%r9, %r8]
	.word 0xc6420009  ! 1356: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x9e72295c  ! 1356: UDIV_I	udiv 	%r8, 0x095c, %r15
	.word 0xc2220009  ! 1359: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc120009  ! 1359: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc48a1009  ! 1359: LDUBA_R	lduba	[%r8, %r9] 0x80, %r2
	.word 0xfe320009  ! 1362: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xde420009  ! 1362: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xc8b22c60  ! 1362: STHA_I	stha	%r4, [%r8 + 0x0c60] %asi
	.word 0xda720009  ! 1365: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xcd1a0009  ! 1365: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x9e6a0009  ! 1365: UDIVX_R	udivx 	%r8, %r9, %r15
	.word 0xcc720009  ! 1368: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 1368: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc47a0009  ! 1368: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xfe320009  ! 1371: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc6420009  ! 1371: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcbe22009  ! 1371: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xeb3a0009  ! 1374: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc84a0009  ! 1374: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a2574  ! 1374: PREFETCH_I	prefetch	[%r8 + 0x0574], #one_read
	.word 0xc73a0009  ! 1377: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf41a0009  ! 1377: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xfe420009  ! 1377: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xc6720009  ! 1380: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf6020009  ! 1380: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xe2ca2260  ! 1380: LDSBA_I	ldsba	[%r8, + 0x0260] %asi, %r17
	.word 0xcf220009  ! 1383: STF_R	st	%f7, [%r9, %r8]
	.word 0xc4020009  ! 1383: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8143e051  ! 1383: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xc6320009  ! 1386: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4020009  ! 1386: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 1386: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca320009  ! 1389: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 1389: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xaba20829  ! 1389: FADDs	fadds	%f8, %f9, %f21
	.word 0xcc220009  ! 1392: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc60a0009  ! 1392: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1392: STBAR	stbar
	.word 0xe62a0009  ! 1395: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc44a0009  ! 1395: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xccfa26f4  ! 1395: SWAPA_I	swapa	%r6, [%r8 + 0x06f4] %asi
	.word 0xec320009  ! 1398: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xfc0a0009  ! 1398: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xc68a1009  ! 1398: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xc33a0009  ! 1401: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc60a0009  ! 1401: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8ad20009  ! 1401: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc2720009  ! 1404: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 1404: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcefa2864  ! 1404: SWAPA_I	swapa	%r7, [%r8 + 0x0864] %asi
	.word 0xd6320009  ! 1407: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc5020009  ! 1407: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc45a0009  ! 1407: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xf0320009  ! 1410: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xf2020009  ! 1410: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x8143e01a  ! 1410: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xc82a0009  ! 1413: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 1413: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xbe720009  ! 1413: UDIV_R	udiv 	%r8, %r9, %r31
	.word 0xc4720009  ! 1416: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf6520009  ! 1416: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0x8fa20929  ! 1416: FMULs	fmuls	%f8, %f9, %f7
	.word 0xdc2a0009  ! 1419: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xcd020009  ! 1419: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143e020  ! 1419: MEMBAR	membar	#MemIssue 
	.word 0xc9220009  ! 1422: STF_R	st	%f4, [%r9, %r8]
	.word 0xc31a0009  ! 1422: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xce822e20  ! 1422: LDUWA_I	lduwa	[%r8, + 0x0e20] %asi, %r7
	.word 0xf5220009  ! 1425: STF_R	st	%f26, [%r9, %r8]
	.word 0xcb1a0009  ! 1425: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc01a0009  ! 1425: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc6320009  ! 1428: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 1428: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143e049  ! 1428: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xe73a0009  ! 1431: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc8520009  ! 1431: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc3ea26cc  ! 1431: PREFETCHA_I	prefetcha	[%r8, + 0x06cc] %asi, #one_read
	.word 0xcb3a0009  ! 1434: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc6120009  ! 1434: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xbba209a9  ! 1434: FDIVs	fdivs	%f8, %f9, %f29
	.word 0xcb3a0009  ! 1437: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc31a0009  ! 1437: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8fa208a9  ! 1437: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xe0720009  ! 1440: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xca0a0009  ! 1440: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x887a0009  ! 1440: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xf0320009  ! 1443: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xfa120009  ! 1443: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xc36a0009  ! 1443: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcf220009  ! 1446: STF_R	st	%f7, [%r9, %r8]
	.word 0xc85a0009  ! 1446: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1446: STBAR	stbar
	.word 0xcc2a0009  ! 1449: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc4120009  ! 1449: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc45a20f8  ! 1449: LDX_I	ldx	[%r8 + 0x00f8], %r2
	.word 0xc2320009  ! 1452: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 1452: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 1452: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd3a0009  ! 1455: STDF_R	std	%f6, [%r9, %r8]
	.word 0xd85a0009  ! 1455: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x0ec20001  ! 1455: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xc22a0009  ! 1458: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcf020009  ! 1458: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc8ea210c  ! 1458: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x010c] %asi
	.word 0xe13a0009  ! 1461: STDF_R	std	%f16, [%r9, %r8]
	.word 0xf05a0009  ! 1461: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x8143c000  ! 1461: STBAR	stbar
	.word 0xd9220009  ! 1464: STF_R	st	%f12, [%r9, %r8]
	.word 0xda4a0009  ! 1464: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc3ea1009  ! 1464: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc7220009  ! 1467: STF_R	st	%f3, [%r9, %r8]
	.word 0xc64a0009  ! 1467: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x89a20829  ! 1467: FADDs	fadds	%f8, %f9, %f4
	.word 0xe2720009  ! 1470: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc44a0009  ! 1470: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x88720009  ! 1470: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xcd3a0009  ! 1473: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc4020009  ! 1473: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 1473: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc7220009  ! 1476: STF_R	st	%f3, [%r9, %r8]
	.word 0xc44a0009  ! 1476: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc80a0009  ! 1476: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc93a0009  ! 1479: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce120009  ! 1479: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xb04a0009  ! 1479: MULX_R	mulx 	%r8, %r9, %r24
	.word 0xe2220009  ! 1482: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xfa520009  ! 1482: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc8821009  ! 1482: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xc2220009  ! 1485: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 1485: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xca821009  ! 1485: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xc33a0009  ! 1488: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe01a0009  ! 1488: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x8143e058  ! 1488: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xc9220009  ! 1491: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2520009  ! 1491: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xccea1009  ! 1491: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 1494: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe0420009  ! 1494: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xc6fa1009  ! 1494: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 1497: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 1497: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xeeb22974  ! 1497: STHA_I	stha	%r23, [%r8 + 0x0974] %asi
	.word 0xfd3a0009  ! 1500: STDF_R	std	%f30, [%r9, %r8]
	.word 0xf64a0009  ! 1500: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xe93a2be0  ! 1500: STDF_I	std	%f20, [0x0be0, %r8]
	.word 0xca320009  ! 1503: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe41a0009  ! 1503: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xe41a2660  ! 1503: LDD_I	ldd	[%r8 + 0x0660], %r18
	.word 0xf0320009  ! 1506: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc8420009  ! 1506: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc9220009  ! 1506: STF_R	st	%f4, [%r9, %r8]
	.word 0xcb3a0009  ! 1509: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc3020009  ! 1509: LDF_R	ld	[%r8, %r9], %f1
	.word 0x87a208a9  ! 1509: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xdb220009  ! 1512: STF_R	st	%f13, [%r9, %r8]
	.word 0xec020009  ! 1512: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xcea21009  ! 1512: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xca320009  ! 1515: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xeb020009  ! 1515: LDF_R	ld	[%r8, %r9], %f21
	.word 0xc3ea1009  ! 1515: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2720009  ! 1518: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 1518: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xf47a0009  ! 1518: SWAP_R	swap	%r26, [%r8 + %r9]
	.word 0xf13a0009  ! 1521: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc81a0009  ! 1521: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1521: STBAR	stbar
	.word 0xcc720009  ! 1524: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 1524: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xdafa1009  ! 1524: SWAPA_R	swapa	%r13, [%r8 + %r9] 0x80
	.word 0xe0720009  ! 1527: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xcf020009  ! 1527: LDF_R	ld	[%r8, %r9], %f7
	.word 0x06800002  ! 1527: BL	bl  	<label_0x2>
	.word 0xc9220009  ! 1530: STF_R	st	%f4, [%r9, %r8]
	.word 0xc65a0009  ! 1530: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xce020009  ! 1530: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xca220009  ! 1533: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 1533: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8e7a0009  ! 1533: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xdb3a0009  ! 1536: STDF_R	std	%f13, [%r9, %r8]
	.word 0xdf1a0009  ! 1536: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xc3ea2650  ! 1536: PREFETCHA_I	prefetcha	[%r8, + 0x0650] %asi, #one_read
	.word 0xe0320009  ! 1539: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc2020009  ! 1539: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x885a0009  ! 1539: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xca320009  ! 1542: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 1542: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x88da29f4  ! 1542: SMULcc_I	smulcc 	%r8, 0x09f4, %r4
	.word 0xfe220009  ! 1545: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xdb1a0009  ! 1545: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0x3a800002  ! 1545: BCC	bcc,a	<label_0x2>
	.word 0xc2320009  ! 1548: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xec4a0009  ! 1548: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc3e21009  ! 1548: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xfe720009  ! 1551: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xfe520009  ! 1551: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0x18800001  ! 1551: BGU	bgu  	<label_0x1>
	.word 0xc2220009  ! 1554: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf00a0009  ! 1554: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0x896a23ec  ! 1554: SDIVX_I	sdivx	%r8, 0x03ec, %r4
	.word 0xcb220009  ! 1557: STF_R	st	%f5, [%r9, %r8]
	.word 0xc64a0009  ! 1557: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcc522610  ! 1557: LDSH_I	ldsh	[%r8 + 0x0610], %r6
	.word 0xc73a0009  ! 1560: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca020009  ! 1560: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x14800001  ! 1560: BG	bg  	<label_0x1>
	.word 0xc3220009  ! 1563: STF_R	st	%f1, [%r9, %r8]
	.word 0xf60a0009  ! 1563: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0x8143c000  ! 1563: STBAR	stbar
	.word 0xf13a0009  ! 1566: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc4020009  ! 1566: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x24800001  ! 1566: BLE	ble,a	<label_0x1>
	.word 0xc8320009  ! 1569: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf0520009  ! 1569: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x8d220009  ! 1569: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xdb220009  ! 1572: STF_R	st	%f13, [%r9, %r8]
	.word 0xc6020009  ! 1572: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc8fa2178  ! 1572: SWAPA_I	swapa	%r4, [%r8 + 0x0178] %asi
	.word 0xce720009  ! 1575: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc6120009  ! 1575: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 1575: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf5220009  ! 1578: STF_R	st	%f26, [%r9, %r8]
	.word 0xe6520009  ! 1578: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xc3ea1009  ! 1578: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xed220009  ! 1581: STF_R	st	%f22, [%r9, %r8]
	.word 0xec1a0009  ! 1581: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x86fa0009  ! 1581: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xcc320009  ! 1584: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 1584: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8a5a0009  ! 1584: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xc8220009  ! 1587: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe45a0009  ! 1587: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xc3ea1009  ! 1587: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce2a0009  ! 1590: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6520009  ! 1590: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea2cd8  ! 1590: PREFETCHA_I	prefetcha	[%r8, + 0x0cd8] %asi, #one_read
	.word 0xf9220009  ! 1593: STF_R	st	%f28, [%r9, %r8]
	.word 0xdc1a0009  ! 1593: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc46a251c  ! 1593: LDSTUB_I	ldstub	%r2, [%r8 + 0x051c]
	.word 0xcf220009  ! 1596: STF_R	st	%f7, [%r9, %r8]
	.word 0xee420009  ! 1596: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xd60a2238  ! 1596: LDUB_I	ldub	[%r8 + 0x0238], %r11
	.word 0xc22a0009  ! 1599: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfc4a0009  ! 1599: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0x22ca0001  ! 1599: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xc2220009  ! 1602: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 1602: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc36a23e4  ! 1602: PREFETCH_I	prefetch	[%r8 + 0x03e4], #one_read
	.word 0xc6720009  ! 1605: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc2420009  ! 1605: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc36a276c  ! 1605: PREFETCH_I	prefetch	[%r8 + 0x076c], #one_read
	.word 0xdb220009  ! 1608: STF_R	st	%f13, [%r9, %r8]
	.word 0xcb1a0009  ! 1608: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143e074  ! 1608: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xd9220009  ! 1611: STF_R	st	%f12, [%r9, %r8]
	.word 0xf3020009  ! 1611: LDF_R	ld	[%r8, %r9], %f25
	.word 0xc3f22009  ! 1611: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xcd220009  ! 1614: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6420009  ! 1614: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea20a8  ! 1614: PREFETCHA_I	prefetcha	[%r8, + 0x00a8] %asi, #one_read
	.word 0xcf3a0009  ! 1617: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca420009  ! 1617: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xf0ca1009  ! 1617: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r24
	.word 0xca220009  ! 1620: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe85a0009  ! 1620: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xc36a244c  ! 1620: PREFETCH_I	prefetch	[%r8 + 0x044c], #one_read
	.word 0xec320009  ! 1623: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xcc1a0009  ! 1623: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8c4a2040  ! 1623: MULX_I	mulx 	%r8, 0x0040, %r6
	.word 0xd82a0009  ! 1626: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xf2520009  ! 1626: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x2c800002  ! 1626: BNEG	bneg,a	<label_0x2>
	.word 0xc2720009  ! 1629: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 1629: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x34800001  ! 1629: BG	bg,a	<label_0x1>
	.word 0xf5220009  ! 1632: STF_R	st	%f26, [%r9, %r8]
	.word 0xcc4a0009  ! 1632: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xca4a2cd0  ! 1632: LDSB_I	ldsb	[%r8 + 0x0cd0], %r5
	.word 0xcd220009  ! 1635: STF_R	st	%f6, [%r9, %r8]
	.word 0xc51a0009  ! 1635: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc36a0009  ! 1635: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc320009  ! 1638: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xd81a0009  ! 1638: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xc6f229a0  ! 1638: STXA_I	stxa	%r3, [%r8 + 0x09a0] %asi
	.word 0xea320009  ! 1641: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xfa520009  ! 1641: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x02ca0001  ! 1641: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xc93a0009  ! 1644: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc60a0009  ! 1644: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc7220009  ! 1644: STF_R	st	%f3, [%r9, %r8]
	.word 0xda320009  ! 1647: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xc8420009  ! 1647: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 1647: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6220009  ! 1650: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe04a0009  ! 1650: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0x8143c000  ! 1650: STBAR	stbar
	.word 0xca2a0009  ! 1653: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc31a0009  ! 1653: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc3f21009  ! 1653: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xd8220009  ! 1656: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc6520009  ! 1656: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea28f0  ! 1656: PREFETCHA_I	prefetcha	[%r8, + 0x08f0] %asi, #one_read
	.word 0xcf3a0009  ! 1659: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc8120009  ! 1659: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc8921009  ! 1659: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xec2a0009  ! 1662: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xe31a0009  ! 1662: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xca5a2520  ! 1662: LDX_I	ldx	[%r8 + 0x0520], %r5
	.word 0xc2220009  ! 1665: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 1665: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xd6921009  ! 1665: LDUHA_R	lduha	[%r8, %r9] 0x80, %r11
	.word 0xcb3a0009  ! 1668: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfc520009  ! 1668: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x82fa0009  ! 1668: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xc8720009  ! 1671: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4520009  ! 1671: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc4b22070  ! 1671: STHA_I	stha	%r2, [%r8 + 0x0070] %asi
	.word 0xca320009  ! 1674: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc65a0009  ! 1674: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8b6a0009  ! 1674: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xc8220009  ! 1677: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc20a0009  ! 1677: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcf1a2a68  ! 1677: LDDF_I	ldd	[%r8, 0x0a68], %f7
	.word 0xc7220009  ! 1680: STF_R	st	%f3, [%r9, %r8]
	.word 0xc85a0009  ! 1680: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1680: STBAR	stbar
	.word 0xce320009  ! 1683: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xfe420009  ! 1683: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xc3ea275c  ! 1683: PREFETCHA_I	prefetcha	[%r8, + 0x075c] %asi, #one_read
	.word 0xce220009  ! 1686: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe81a0009  ! 1686: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xa6da275c  ! 1686: SMULcc_I	smulcc 	%r8, 0x075c, %r19
	.word 0xcc720009  ! 1689: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc01a0009  ! 1689: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x825a2650  ! 1689: SMUL_I	smul 	%r8, 0x0650, %r1
	.word 0xcc720009  ! 1692: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc31a0009  ! 1692: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8a4a21b8  ! 1692: MULX_I	mulx 	%r8, 0x01b8, %r5
	.word 0xc33a0009  ! 1695: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce5a0009  ! 1695: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc6fa2838  ! 1695: SWAPA_I	swapa	%r3, [%r8 + 0x0838] %asi
	.word 0xf4220009  ! 1698: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xcd020009  ! 1698: LDF_R	ld	[%r8, %r9], %f6
	.word 0xaad20009  ! 1698: UMULcc_R	umulcc 	%r8, %r9, %r21
	.word 0xe73a0009  ! 1701: STDF_R	std	%f19, [%r9, %r8]
	.word 0xf2420009  ! 1701: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xf9f22009  ! 1701: CASXA_R	casxa	[%r8]%asi, %r9, %r28
	.word 0xda320009  ! 1704: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xcb1a0009  ! 1704: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc3ea1009  ! 1704: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca320009  ! 1707: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc31a0009  ! 1707: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc46a0009  ! 1707: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xfc2a0009  ! 1710: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xca5a0009  ! 1710: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x06c20001  ! 1710: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xe0720009  ! 1713: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc9020009  ! 1713: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea22e8  ! 1713: PREFETCHA_I	prefetcha	[%r8, + 0x02e8] %asi, #one_read
	.word 0xc4220009  ! 1716: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc2020009  ! 1716: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x3e800001  ! 1716: BVC	bvc,a	<label_0x1>
	.word 0xc8720009  ! 1719: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfa020009  ! 1719: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xc36a0009  ! 1719: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe0320009  ! 1722: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xcd1a0009  ! 1722: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143c000  ! 1722: STBAR	stbar
	.word 0xe0320009  ! 1725: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc2020009  ! 1725: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xe8ba2760  ! 1725: STDA_I	stda	%r20, [%r8 + 0x0760] %asi
	.word 0xca720009  ! 1728: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc44a0009  ! 1728: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143e00b  ! 1728: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore 
	.word 0xd8720009  ! 1731: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xc8020009  ! 1731: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8ba208a9  ! 1731: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xcf220009  ! 1734: STF_R	st	%f7, [%r9, %r8]
	.word 0xc41a0009  ! 1734: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc36a2f28  ! 1734: PREFETCH_I	prefetch	[%r8 + 0x0f28], #one_read
	.word 0xc3220009  ! 1737: STF_R	st	%f1, [%r9, %r8]
	.word 0xcb1a0009  ! 1737: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x89a209a9  ! 1737: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xe6320009  ! 1740: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc65a0009  ! 1740: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143e00e  ! 1740: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xfa220009  ! 1743: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc6520009  ! 1743: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x40000001  ! 1743: CALL	call	disp30_1
	.word 0xc22a0009  ! 1746: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xea420009  ! 1746: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc70228e0  ! 1746: LDF_I	ld	[%r8, 0x08e0], %f3
	.word 0xf2320009  ! 1749: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xcc5a0009  ! 1749: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc47a0009  ! 1749: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xee720009  ! 1752: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xe3020009  ! 1752: LDF_R	ld	[%r8, %r9], %f17
	.word 0xc8022294  ! 1752: LDUW_I	lduw	[%r8 + 0x0294], %r4
	.word 0xc8720009  ! 1755: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 1755: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcf3a2b98  ! 1755: STDF_I	std	%f7, [0x0b98, %r8]
	.word 0xcc2a0009  ! 1758: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf64a0009  ! 1758: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x856a0009  ! 1758: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xf0720009  ! 1761: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc8420009  ! 1761: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcef21009  ! 1761: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 1764: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc4020009  ! 1764: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8143e06c  ! 1764: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xdd3a0009  ! 1767: STDF_R	std	%f14, [%r9, %r8]
	.word 0xc41a0009  ! 1767: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x83a20829  ! 1767: FADDs	fadds	%f8, %f9, %f1
	.word 0xc73a0009  ! 1770: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcf1a0009  ! 1770: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xfcfa1009  ! 1770: SWAPA_R	swapa	%r30, [%r8 + %r9] 0x80
	.word 0xf6720009  ! 1773: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc8520009  ! 1773: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 1773: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdb220009  ! 1776: STF_R	st	%f13, [%r9, %r8]
	.word 0xc85a0009  ! 1776: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xee8a22d8  ! 1776: LDUBA_I	lduba	[%r8, + 0x02d8] %asi, %r23
	.word 0xe8220009  ! 1779: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xea020009  ! 1779: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xe00a20e4  ! 1779: LDUB_I	ldub	[%r8 + 0x00e4], %r16
	.word 0xcc320009  ! 1782: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc1a0009  ! 1782: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea2110  ! 1782: PREFETCHA_I	prefetcha	[%r8, + 0x0110] %asi, #one_read
	.word 0xc93a0009  ! 1785: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe20a0009  ! 1785: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x8143c000  ! 1785: STBAR	stbar
	.word 0xc4720009  ! 1788: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 1788: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcc8a2048  ! 1788: LDUBA_I	lduba	[%r8, + 0x0048] %asi, %r6
	.word 0xc82a0009  ! 1791: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca120009  ! 1791: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 1791: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf0720009  ! 1794: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc8520009  ! 1794: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xdd3a0009  ! 1794: STDF_R	std	%f14, [%r9, %r8]
	.word 0xcb3a0009  ! 1797: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcd1a0009  ! 1797: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x86520009  ! 1797: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xe8320009  ! 1800: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xcc1a0009  ! 1800: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1800: STBAR	stbar
	.word 0xeb220009  ! 1803: STF_R	st	%f21, [%r9, %r8]
	.word 0xc6120009  ! 1803: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xf0ba1009  ! 1803: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 1806: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc8420009  ! 1806: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcaf22db8  ! 1806: STXA_I	stxa	%r5, [%r8 + 0x0db8] %asi
	.word 0xce720009  ! 1809: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe80a0009  ! 1809: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0x04800001  ! 1809: BLE	ble  	<label_0x1>
	.word 0xc22a0009  ! 1812: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc81a0009  ! 1812: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xa4da0009  ! 1812: SMULcc_R	smulcc 	%r8, %r9, %r18
	.word 0xc62a0009  ! 1815: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc4120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xdab21009  ! 1815: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 1818: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 1818: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x12800001  ! 1818: BNE	bne  	<label_0x1>
	.word 0xfc720009  ! 1821: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xe2520009  ! 1821: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xfcaa1009  ! 1821: STBA_R	stba	%r30, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 1824: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfd1a0009  ! 1824: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xc36a0009  ! 1824: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc22a0009  ! 1827: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc9020009  ! 1827: LDF_R	ld	[%r8, %r9], %f4
	.word 0x88722f80  ! 1827: UDIV_I	udiv 	%r8, 0x0f80, %r4
	.word 0xc2320009  ! 1830: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf2020009  ! 1830: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xec6a0009  ! 1830: LDSTUB_R	ldstub	%r22, [%r8 + %r9]
	.word 0xce2a0009  ! 1833: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 1833: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8f222a48  ! 1833: MULScc_I	mulscc 	%r8, 0x0a48, %r7
	.word 0xc6220009  ! 1836: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf20a0009  ! 1836: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x8fa20829  ! 1836: FADDs	fadds	%f8, %f9, %f7
	.word 0xde220009  ! 1839: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xe6420009  ! 1839: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x89222524  ! 1839: MULScc_I	mulscc 	%r8, 0x0524, %r4
	.word 0xcf220009  ! 1842: STF_R	st	%f7, [%r9, %r8]
	.word 0xc71a0009  ! 1842: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcca22214  ! 1842: STWA_I	stwa	%r6, [%r8 + 0x0214] %asi
	.word 0xcf220009  ! 1845: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc1a0009  ! 1845: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xada209a9  ! 1845: FDIVs	fdivs	%f8, %f9, %f22
	.word 0xc2220009  ! 1848: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 1848: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8ba20929  ! 1848: FMULs	fmuls	%f8, %f9, %f5
	.word 0xca2a0009  ! 1851: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc25a0009  ! 1851: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xe7f22009  ! 1851: CASXA_R	casxa	[%r8]%asi, %r9, %r19
	.word 0xc6220009  ! 1854: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xea420009  ! 1854: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc8fa21f4  ! 1854: SWAPA_I	swapa	%r4, [%r8 + 0x01f4] %asi
	.word 0xd82a0009  ! 1857: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xe71a0009  ! 1857: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x82720009  ! 1857: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc5220009  ! 1860: STF_R	st	%f2, [%r9, %r8]
	.word 0xe2020009  ! 1860: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xc6422144  ! 1860: LDSW_I	ldsw	[%r8 + 0x0144], %r3
	.word 0xc22a0009  ! 1863: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6020009  ! 1863: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8e4a27cc  ! 1863: MULX_I	mulx 	%r8, 0x07cc, %r7
	.word 0xcb3a0009  ! 1866: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf81a0009  ! 1866: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x02800001  ! 1866: BE	be  	<label_0x1>
	.word 0xce320009  ! 1869: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe2020009  ! 1869: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xcc4a2160  ! 1869: LDSB_I	ldsb	[%r8 + 0x0160], %r6
	.word 0xf73a0009  ! 1872: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc80a0009  ! 1872: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x0ac20001  ! 1872: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xc6220009  ! 1875: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 1875: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xd8120009  ! 1875: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xea2a0009  ! 1878: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc2120009  ! 1878: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc36a219c  ! 1878: PREFETCH_I	prefetch	[%r8 + 0x019c], #one_read
	.word 0xcb220009  ! 1881: STF_R	st	%f5, [%r9, %r8]
	.word 0xe31a0009  ! 1881: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0x8eda2120  ! 1881: SMULcc_I	smulcc 	%r8, 0x0120, %r7
	.word 0xc93a0009  ! 1884: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfe4a0009  ! 1884: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xc8da2e60  ! 1884: LDXA_I	ldxa	[%r8, + 0x0e60] %asi, %r4
	.word 0xed3a0009  ! 1887: STDF_R	std	%f22, [%r9, %r8]
	.word 0xfd020009  ! 1887: LDF_R	ld	[%r8, %r9], %f30
	.word 0x8143e031  ! 1887: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xc33a0009  ! 1890: STDF_R	std	%f1, [%r9, %r8]
	.word 0xdf1a0009  ! 1890: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xdef21009  ! 1890: STXA_R	stxa	%r15, [%r8 + %r9] 0x80
	.word 0xfa2a0009  ! 1893: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xca5a0009  ! 1893: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc36a2d40  ! 1893: PREFETCH_I	prefetch	[%r8 + 0x0d40], #one_read
	.word 0xfd3a0009  ! 1896: STDF_R	std	%f30, [%r9, %r8]
	.word 0xcc120009  ! 1896: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1896: STBAR	stbar
	.word 0xe0220009  ! 1899: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc80a0009  ! 1899: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 1899: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc2a0009  ! 1902: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca520009  ! 1902: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8d6a0009  ! 1902: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xda220009  ! 1905: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc71a0009  ! 1905: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xa76a0009  ! 1905: SDIVX_R	sdivx	%r8, %r9, %r19
	.word 0xc93a0009  ! 1908: STDF_R	std	%f4, [%r9, %r8]
	.word 0xd8020009  ! 1908: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xdeb222dc  ! 1908: STHA_I	stha	%r15, [%r8 + 0x02dc] %asi
	.word 0xed220009  ! 1911: STF_R	st	%f22, [%r9, %r8]
	.word 0xca020009  ! 1911: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xf6122f18  ! 1911: LDUH_I	lduh	[%r8 + 0x0f18], %r27
	.word 0xce320009  ! 1914: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcb020009  ! 1914: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc89a2170  ! 1914: LDDA_I	ldda	[%r8, + 0x0170] %asi, %r4
	.word 0xce720009  ! 1917: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xd60a0009  ! 1917: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xc36a0009  ! 1917: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2720009  ! 1920: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcd020009  ! 1920: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8cda2d00  ! 1920: SMULcc_I	smulcc 	%r8, 0x0d00, %r6
	.word 0xe6320009  ! 1923: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc81a0009  ! 1923: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xb5220009  ! 1923: MULScc_R	mulscc 	%r8, %r9, %r26
	.word 0xcc720009  ! 1926: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc1a0009  ! 1926: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xf8ca2f98  ! 1926: LDSBA_I	ldsba	[%r8, + 0x0f98] %asi, %r28
	.word 0xc2220009  ! 1929: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc6420009  ! 1929: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8ada0009  ! 1929: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xc2720009  ! 1932: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xda120009  ! 1932: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xcf3a0009  ! 1932: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc93a0009  ! 1935: STDF_R	std	%f4, [%r9, %r8]
	.word 0xec520009  ! 1935: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xe4b21009  ! 1935: STHA_R	stha	%r18, [%r8 + %r9] 0x80
	.word 0xce220009  ! 1938: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf80a0009  ! 1938: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xdaa22aa4  ! 1938: STWA_I	stwa	%r13, [%r8 + 0x0aa4] %asi
	.word 0xc4720009  ! 1941: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 1941: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc2a22c14  ! 1941: STWA_I	stwa	%r1, [%r8 + 0x0c14] %asi
	.word 0xf8320009  ! 1944: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc2120009  ! 1944: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143e066  ! 1944: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc6220009  ! 1947: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe4520009  ! 1947: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xd6420009  ! 1947: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xc53a0009  ! 1950: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca4a0009  ! 1950: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xce122fcc  ! 1950: LDUH_I	lduh	[%r8 + 0x0fcc], %r7
	.word 0xc53a0009  ! 1953: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca420009  ! 1953: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x2eca0001  ! 1953: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc82a0009  ! 1956: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc45a0009  ! 1956: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc7220009  ! 1956: STF_R	st	%f3, [%r9, %r8]
	.word 0xf73a0009  ! 1959: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc4120009  ! 1959: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8af22e74  ! 1959: UDIVcc_I	udivcc 	%r8, 0x0e74, %r5
	.word 0xc8320009  ! 1962: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xdb1a0009  ! 1962: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0x8cda0009  ! 1962: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xc8720009  ! 1965: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe44a0009  ! 1965: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xc6f21009  ! 1965: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xe6220009  ! 1968: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xcb1a0009  ! 1968: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xeed223b4  ! 1968: LDSHA_I	ldsha	[%r8, + 0x03b4] %asi, %r23
	.word 0xe8220009  ! 1971: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc9020009  ! 1971: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc8f21009  ! 1971: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 1974: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xec420009  ! 1974: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x8143e033  ! 1974: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xc6320009  ! 1977: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf9020009  ! 1977: LDF_R	ld	[%r8, %r9], %f28
	.word 0xc2ca27c0  ! 1977: LDSBA_I	ldsba	[%r8, + 0x07c0] %asi, %r1
	.word 0xfd3a0009  ! 1980: STDF_R	std	%f30, [%r9, %r8]
	.word 0xd41a0009  ! 1980: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xc3ea1009  ! 1980: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc53a0009  ! 1983: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc40a0009  ! 1983: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143e036  ! 1983: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xfa220009  ! 1986: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc8420009  ! 1986: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1986: STBAR	stbar
	.word 0xc33a0009  ! 1989: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcb1a0009  ! 1989: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xef220009  ! 1989: STF_R	st	%f23, [%r9, %r8]
	.word 0xc3220009  ! 1992: STF_R	st	%f1, [%r9, %r8]
	.word 0xc2520009  ! 1992: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc68224bc  ! 1992: LDUWA_I	lduwa	[%r8, + 0x04bc] %asi, %r3
	.word 0xc5220009  ! 1995: STF_R	st	%f2, [%r9, %r8]
	.word 0xc2020009  ! 1995: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xba520009  ! 1995: UMUL_R	umul 	%r8, %r9, %r29
	.word 0xc7220009  ! 1998: STF_R	st	%f3, [%r9, %r8]
	.word 0xce0a0009  ! 1998: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xcaa22444  ! 1998: STWA_I	stwa	%r5, [%r8 + 0x0444] %asi
	.word 0xc62a0009  ! 2001: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce020009  ! 2001: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xdcc21009  ! 2001: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r14
	.word 0xdc2a0009  ! 2004: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc5020009  ! 2004: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143c000  ! 2004: STBAR	stbar
	.word 0xc6720009  ! 2007: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc25a0009  ! 2007: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcefa1009  ! 2007: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xe82a0009  ! 2010: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xe6120009  ! 2010: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x867a0009  ! 2010: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc6320009  ! 2013: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc2520009  ! 2013: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8cf22450  ! 2013: UDIVcc_I	udivcc 	%r8, 0x0450, %r6
	.word 0xeb3a0009  ! 2016: STDF_R	std	%f21, [%r9, %r8]
	.word 0xcb020009  ! 2016: LDF_R	ld	[%r8, %r9], %f5
	.word 0xee7a2f48  ! 2016: SWAP_I	swap	%r23, [%r8 + 0x0f48]
	.word 0xce2a0009  ! 2019: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc4a0009  ! 2019: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143e006  ! 2019: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xcc220009  ! 2022: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca420009  ! 2022: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc8d21009  ! 2022: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xc3220009  ! 2025: STF_R	st	%f1, [%r9, %r8]
	.word 0xcf1a0009  ! 2025: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xfac22e40  ! 2025: LDSWA_I	ldswa	[%r8, + 0x0e40] %asi, %r29
	.word 0xf9220009  ! 2028: STF_R	st	%f28, [%r9, %r8]
	.word 0xcc420009  ! 2028: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143e002  ! 2028: MEMBAR	membar	#StoreLoad 
	.word 0xd9220009  ! 2031: STF_R	st	%f12, [%r9, %r8]
	.word 0xe71a0009  ! 2031: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc3ea1009  ! 2031: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4320009  ! 2034: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 2034: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x2aca0001  ! 2034: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc93a0009  ! 2037: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe20a0009  ! 2037: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x8c6a23fc  ! 2037: UDIVX_I	udivx 	%r8, 0x03fc, %r6
	.word 0xc2720009  ! 2040: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcd020009  ! 2040: LDF_R	ld	[%r8, %r9], %f6
	.word 0x86520009  ! 2040: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc2320009  ! 2043: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 2043: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xceb21009  ! 2043: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 2046: STDF_R	std	%f7, [%r9, %r8]
	.word 0xd8020009  ! 2046: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xcd3a0009  ! 2046: STDF_R	std	%f6, [%r9, %r8]
	.word 0xdc720009  ! 2049: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc4420009  ! 2049: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xccaa2404  ! 2049: STBA_I	stba	%r6, [%r8 + 0x0404] %asi
	.word 0xf0220009  ! 2052: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xfc520009  ! 2052: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xca422e74  ! 2052: LDSW_I	ldsw	[%r8 + 0x0e74], %r5
	.word 0xc6320009  ! 2055: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 2055: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xa44a0009  ! 2055: MULX_R	mulx 	%r8, %r9, %r18
	.word 0xe93a0009  ! 2058: STDF_R	std	%f20, [%r9, %r8]
	.word 0xca0a0009  ! 2058: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc36a2ea4  ! 2058: PREFETCH_I	prefetch	[%r8 + 0x0ea4], #one_read
	.word 0xc9220009  ! 2061: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc020009  ! 2061: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x38800001  ! 2061: BGU	bgu,a	<label_0x1>
	.word 0xfd3a0009  ! 2064: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc4120009  ! 2064: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xcea222dc  ! 2064: STWA_I	stwa	%r7, [%r8 + 0x02dc] %asi
	.word 0xcb220009  ! 2067: STF_R	st	%f5, [%r9, %r8]
	.word 0xe00a0009  ! 2067: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xdff22009  ! 2067: CASXA_R	casxa	[%r8]%asi, %r9, %r15
	.word 0xc8720009  ! 2070: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcd1a0009  ! 2070: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc9220009  ! 2070: STF_R	st	%f4, [%r9, %r8]
	.word 0xc22a0009  ! 2073: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xff1a0009  ! 2073: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x996a234c  ! 2073: SDIVX_I	sdivx	%r8, 0x034c, %r12
	.word 0xe22a0009  ! 2076: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc9020009  ! 2076: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcd1a0009  ! 2076: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xdb3a0009  ! 2079: STDF_R	std	%f13, [%r9, %r8]
	.word 0xd64a0009  ! 2079: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xc86a2050  ! 2079: LDSTUB_I	ldstub	%r4, [%r8 + 0x0050]
	.word 0xce220009  ! 2082: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc85a0009  ! 2082: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x04800001  ! 2082: BLE	ble  	<label_0x1>
	.word 0xe4320009  ! 2085: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xce4a0009  ! 2085: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc2a22208  ! 2085: STWA_I	stwa	%r1, [%r8 + 0x0208] %asi
	.word 0xc4720009  ! 2088: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcd020009  ! 2088: LDF_R	ld	[%r8, %r9], %f6
	.word 0x88d22ce0  ! 2088: UMULcc_I	umulcc 	%r8, 0x0ce0, %r4
	.word 0xda320009  ! 2091: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xed020009  ! 2091: LDF_R	ld	[%r8, %r9], %f22
	.word 0x8143c000  ! 2091: STBAR	stbar
	.word 0xe82a0009  ! 2094: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xce0a0009  ! 2094: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc36a239c  ! 2094: PREFETCH_I	prefetch	[%r8 + 0x039c], #one_read
	.word 0xca2a0009  ! 2097: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc020009  ! 2097: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcde22009  ! 2097: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xc8720009  ! 2100: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 2100: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8c6a2498  ! 2100: UDIVX_I	udivx 	%r8, 0x0498, %r6
	.word 0xd6320009  ! 2103: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc8520009  ! 2103: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2103: STBAR	stbar
	.word 0xf13a0009  ! 2106: STDF_R	std	%f24, [%r9, %r8]
	.word 0xde520009  ! 2106: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xc6020009  ! 2106: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xce2a0009  ! 2109: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 2109: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x2a800001  ! 2109: BCS	bcs,a	<label_0x1>
	.word 0xe73a0009  ! 2112: STDF_R	std	%f19, [%r9, %r8]
	.word 0xe5020009  ! 2112: LDF_R	ld	[%r8, %r9], %f18
	.word 0x8143e072  ! 2112: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc2320009  ! 2115: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca4a0009  ! 2115: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x85a20829  ! 2115: FADDs	fadds	%f8, %f9, %f2
	.word 0xc82a0009  ! 2118: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf6120009  ! 2118: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0x2eca0001  ! 2118: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xc4320009  ! 2121: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf4420009  ! 2121: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xb84a2b94  ! 2121: MULX_I	mulx 	%r8, 0x0b94, %r28
	.word 0xc6320009  ! 2124: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca0a0009  ! 2124: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xcb3a0009  ! 2124: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc22a0009  ! 2127: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xde520009  ! 2127: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x846a0009  ! 2127: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc4220009  ! 2130: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca520009  ! 2130: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8af20009  ! 2130: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xcc220009  ! 2133: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xff1a0009  ! 2133: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x24800002  ! 2133: BLE	ble,a	<label_0x2>
	.word 0xc6720009  ! 2136: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc4420009  ! 2136: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xccf22860  ! 2136: STXA_I	stxa	%r6, [%r8 + 0x0860] %asi
	.word 0xc73a0009  ! 2139: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe2520009  ! 2139: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0x8143c000  ! 2139: STBAR	stbar
	.word 0xed220009  ! 2142: STF_R	st	%f22, [%r9, %r8]
	.word 0xce120009  ! 2142: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcaca1009  ! 2142: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc8320009  ! 2145: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 2145: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143e022  ! 2145: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xe0320009  ! 2148: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc84a0009  ! 2148: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc4ba1009  ! 2148: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xe2320009  ! 2151: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc65a0009  ! 2151: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc3ea2088  ! 2151: PREFETCHA_I	prefetcha	[%r8, + 0x0088] %asi, #one_read
	.word 0xc2220009  ! 2154: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 2154: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc8a21009  ! 2154: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xda720009  ! 2157: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xd91a0009  ! 2157: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xc36a2eac  ! 2157: PREFETCH_I	prefetch	[%r8 + 0x0eac], #one_read
	.word 0xc8320009  ! 2160: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 2160: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143e05e  ! 2160: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc73a0009  ! 2163: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc81a0009  ! 2163: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xe6f22e00  ! 2163: STXA_I	stxa	%r19, [%r8 + 0x0e00] %asi
	.word 0xc8720009  ! 2166: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe8020009  ! 2166: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc7f22009  ! 2166: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xfd3a0009  ! 2169: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc8020009  ! 2169: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8ed20009  ! 2169: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xca720009  ! 2172: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 2172: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc2821009  ! 2172: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xcc220009  ! 2175: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 2175: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143e023  ! 2175: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xc2720009  ! 2178: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcb1a0009  ! 2178: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x9e522390  ! 2178: UMUL_I	umul 	%r8, 0x0390, %r15
	.word 0xc8320009  ! 2181: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2020009  ! 2181: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xf01a0009  ! 2181: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xca220009  ! 2184: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xfd020009  ! 2184: LDF_R	ld	[%r8, %r9], %f30
	.word 0xebe22009  ! 2184: CASA_R	casa	[%r8] %asi, %r9, %r21
	.word 0xc22a0009  ! 2187: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce020009  ! 2187: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x85a208a9  ! 2187: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xe3220009  ! 2190: STF_R	st	%f17, [%r9, %r8]
	.word 0xf81a0009  ! 2190: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x8e7a0009  ! 2190: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xff3a0009  ! 2193: STDF_R	std	%f31, [%r9, %r8]
	.word 0xd65a0009  ! 2193: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xfc9a29f0  ! 2193: LDDA_I	ldda	[%r8, + 0x09f0] %asi, %r30
	.word 0xd6320009  ! 2196: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc7020009  ! 2196: LDF_R	ld	[%r8, %r9], %f3
	.word 0xe8122430  ! 2196: LDUH_I	lduh	[%r8 + 0x0430], %r20
	.word 0xcc220009  ! 2199: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf84a0009  ! 2199: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xc3ea2acc  ! 2199: PREFETCHA_I	prefetcha	[%r8, + 0x0acc] %asi, #one_read
	.word 0xde220009  ! 2202: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xce520009  ! 2202: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8cd225b4  ! 2202: UMULcc_I	umulcc 	%r8, 0x05b4, %r6
	.word 0xce2a0009  ! 2205: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc20a0009  ! 2205: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc36a2f5c  ! 2205: PREFETCH_I	prefetch	[%r8 + 0x0f5c], #one_read
	.word 0xd7220009  ! 2208: STF_R	st	%f11, [%r9, %r8]
	.word 0xc71a0009  ! 2208: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcb220009  ! 2208: STF_R	st	%f5, [%r9, %r8]
	.word 0xe93a0009  ! 2211: STDF_R	std	%f20, [%r9, %r8]
	.word 0xcf1a0009  ! 2211: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc2520009  ! 2211: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xe42a0009  ! 2214: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xfa0a0009  ! 2214: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x3c800001  ! 2214: BPOS	bpos,a	<label_0x1>
	.word 0xe53a0009  ! 2217: STDF_R	std	%f18, [%r9, %r8]
	.word 0xcc520009  ! 2217: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xbc5a0009  ! 2217: SMUL_R	smul 	%r8, %r9, %r30
	.word 0xd73a0009  ! 2220: STDF_R	std	%f11, [%r9, %r8]
	.word 0xfa0a0009  ! 2220: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x8143e049  ! 2220: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xcb3a0009  ! 2223: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc420009  ! 2223: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x89a20929  ! 2223: FMULs	fmuls	%f8, %f9, %f4
	.word 0xe13a0009  ! 2226: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc80a0009  ! 2226: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xcbe22009  ! 2226: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xca320009  ! 2229: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce120009  ! 2229: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcac21009  ! 2229: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xca2a0009  ! 2232: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca5a0009  ! 2232: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc26a2894  ! 2232: LDSTUB_I	ldstub	%r1, [%r8 + 0x0894]
	.word 0xf62a0009  ! 2235: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xca020009  ! 2235: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc20a0009  ! 2235: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcf3a0009  ! 2238: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca420009  ! 2238: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 2238: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc3220009  ! 2241: STF_R	st	%f1, [%r9, %r8]
	.word 0xc2520009  ! 2241: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8c4a2ff4  ! 2241: MULX_I	mulx 	%r8, 0x0ff4, %r6
	.word 0xf1220009  ! 2244: STF_R	st	%f24, [%r9, %r8]
	.word 0xe64a0009  ! 2244: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x0e800001  ! 2244: BVS	bvs  	<label_0x1>
	.word 0xcc320009  ! 2247: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 2247: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x2a800002  ! 2247: BCS	bcs,a	<label_0x2>
	.word 0xfc2a0009  ! 2250: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xd6020009  ! 2250: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc4a21009  ! 2250: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xca320009  ! 2253: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 2253: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc49a1009  ! 2253: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xec2a0009  ! 2256: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xca420009  ! 2256: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x06800001  ! 2256: BL	bl  	<label_0x1>
	.word 0xce220009  ! 2259: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcd1a0009  ! 2259: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc3ea21d4  ! 2259: PREFETCHA_I	prefetcha	[%r8, + 0x01d4] %asi, #one_read
	.word 0xce2a0009  ! 2262: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6520009  ! 2262: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xbb6a27a4  ! 2262: SDIVX_I	sdivx	%r8, 0x07a4, %r29
	.word 0xe93a0009  ! 2265: STDF_R	std	%f20, [%r9, %r8]
	.word 0xcd020009  ! 2265: LDF_R	ld	[%r8, %r9], %f6
	.word 0xcc0a2350  ! 2265: LDUB_I	ldub	[%r8 + 0x0350], %r6
	.word 0xce720009  ! 2268: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc91a0009  ! 2268: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xa66a0009  ! 2268: UDIVX_R	udivx 	%r8, %r9, %r19
	.word 0xcc720009  ! 2271: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xd7020009  ! 2271: LDF_R	ld	[%r8, %r9], %f11
	.word 0xc92225c4  ! 2271: STF_I	st	%f4, [0x05c4, %r8]
	.word 0xe22a0009  ! 2274: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xce420009  ! 2274: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x845a224c  ! 2274: SMUL_I	smul 	%r8, 0x024c, %r2
	.word 0xe0720009  ! 2277: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xe60a0009  ! 2277: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xc89a1009  ! 2277: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xe4320009  ! 2280: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc5020009  ! 2280: LDF_R	ld	[%r8, %r9], %f2
	.word 0x04800001  ! 2280: BLE	ble  	<label_0x1>
	.word 0xdc720009  ! 2283: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc8420009  ! 2283: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc4ba2a18  ! 2283: STDA_I	stda	%r2, [%r8 + 0x0a18] %asi
	.word 0xf0320009  ! 2286: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xca0a0009  ! 2286: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xccf21009  ! 2286: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 2289: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf4420009  ! 2289: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xccd21009  ! 2289: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xc4320009  ! 2292: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca0a0009  ! 2292: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xb16a27ac  ! 2292: SDIVX_I	sdivx	%r8, 0x07ac, %r24
	.word 0xc8320009  ! 2295: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4520009  ! 2295: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xe2ca29d8  ! 2295: LDSBA_I	ldsba	[%r8, + 0x09d8] %asi, %r17
	.word 0xe02a0009  ! 2298: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xde120009  ! 2298: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0x8143c000  ! 2298: STBAR	stbar
	.word 0xc2220009  ! 2301: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf1020009  ! 2301: LDF_R	ld	[%r8, %r9], %f24
	.word 0xc3ea1009  ! 2301: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe02a0009  ! 2304: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xcc5a0009  ! 2304: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143e014  ! 2304: MEMBAR	membar	#LoadStore | #Lookaside 
	.word 0xc2720009  ! 2307: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 2307: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x9cfa227c  ! 2307: SDIVcc_I	sdivcc 	%r8, 0x027c, %r14
	.word 0xca320009  ! 2310: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 2310: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc8c21009  ! 2310: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc6220009  ! 2313: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcd020009  ! 2313: LDF_R	ld	[%r8, %r9], %f6
	.word 0xed220009  ! 2313: STF_R	st	%f22, [%r9, %r8]
	.word 0xec320009  ! 2316: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xe25a0009  ! 2316: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xc67a2674  ! 2316: SWAP_I	swap	%r3, [%r8 + 0x0674]
	.word 0xcc320009  ! 2319: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc01a0009  ! 2319: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8143c000  ! 2319: STBAR	stbar
	.word 0xeb3a0009  ! 2322: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc2020009  ! 2322: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x06800002  ! 2322: BL	bl  	<label_0x2>
	.word 0xf5220009  ! 2325: STF_R	st	%f26, [%r9, %r8]
	.word 0xfe4a0009  ! 2325: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xc5022364  ! 2325: LDF_I	ld	[%r8, 0x0364], %f2
	.word 0xc6320009  ! 2328: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca0a0009  ! 2328: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x2e800001  ! 2328: BVS	bvs,a	<label_0x1>
	.word 0xe8320009  ! 2331: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xce420009  ! 2331: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xde522418  ! 2331: LDSH_I	ldsh	[%r8 + 0x0418], %r15
	.word 0xc8320009  ! 2334: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca420009  ! 2334: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8b6a27f4  ! 2334: SDIVX_I	sdivx	%r8, 0x07f4, %r5
	.word 0xc22a0009  ! 2337: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf25a0009  ! 2337: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xfcb21009  ! 2337: STHA_R	stha	%r30, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 2340: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2020009  ! 2340: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc6a22e28  ! 2340: STWA_I	stwa	%r3, [%r8 + 0x0e28] %asi
	.word 0xc4320009  ! 2343: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xec0a0009  ! 2343: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x9fa20829  ! 2343: FADDs	fadds	%f8, %f9, %f15
	.word 0xdf3a0009  ! 2346: STDF_R	std	%f15, [%r9, %r8]
	.word 0xe8120009  ! 2346: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0x8e5a0009  ! 2346: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xd9220009  ! 2349: STF_R	st	%f12, [%r9, %r8]
	.word 0xe7020009  ! 2349: LDF_R	ld	[%r8, %r9], %f19
	.word 0xe11a2a78  ! 2349: LDDF_I	ldd	[%r8, 0x0a78], %f16
	.word 0xca220009  ! 2352: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf6420009  ! 2352: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xc0ba1009  ! 2352: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 2355: STF_R	st	%f7, [%r9, %r8]
	.word 0xc81a0009  ! 2355: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 2355: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce320009  ! 2358: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xee5a0009  ! 2358: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0x8143c000  ! 2358: STBAR	stbar
	.word 0xe93a0009  ! 2361: STDF_R	std	%f20, [%r9, %r8]
	.word 0xce5a0009  ! 2361: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8afa0009  ! 2361: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xe02a0009  ! 2364: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xca020009  ! 2364: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xb64a2c48  ! 2364: MULX_I	mulx 	%r8, 0x0c48, %r27
	.word 0xc8320009  ! 2367: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xd6020009  ! 2367: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xc6821009  ! 2367: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xf8320009  ! 2370: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xca420009  ! 2370: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcde21009  ! 2370: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xc6320009  ! 2373: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca4a0009  ! 2373: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x04c20001  ! 2373: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xfe320009  ! 2376: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xe60a0009  ! 2376: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x2ac20001  ! 2376: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xcc220009  ! 2379: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 2379: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x3e800002  ! 2379: BVC	bvc,a	<label_0x2>
	.word 0xe02a0009  ! 2382: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc91a0009  ! 2382: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x14800001  ! 2382: BG	bg  	<label_0x1>
	.word 0xcb3a0009  ! 2385: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcd1a0009  ! 2385: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xd93a2270  ! 2385: STDF_I	std	%f12, [0x0270, %r8]
	.word 0xf0720009  ! 2388: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc3020009  ! 2388: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc2b22294  ! 2388: STHA_I	stha	%r1, [%r8 + 0x0294] %asi
	.word 0xf4220009  ! 2391: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc8120009  ! 2391: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xec0a0009  ! 2391: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xdb220009  ! 2394: STF_R	st	%f13, [%r9, %r8]
	.word 0xca4a0009  ! 2394: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8e5a0009  ! 2394: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xce320009  ! 2397: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce5a0009  ! 2397: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc26a0009  ! 2397: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xc73a0009  ! 2400: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc25a0009  ! 2400: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xfcb22e10  ! 2400: STHA_I	stha	%r30, [%r8 + 0x0e10] %asi
	.word 0xce2a0009  ! 2403: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce120009  ! 2403: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x98fa2750  ! 2403: SDIVcc_I	sdivcc 	%r8, 0x0750, %r12
	.word 0xc3220009  ! 2406: STF_R	st	%f1, [%r9, %r8]
	.word 0xcf020009  ! 2406: LDF_R	ld	[%r8, %r9], %f7
	.word 0x845a0009  ! 2406: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xc7220009  ! 2409: STF_R	st	%f3, [%r9, %r8]
	.word 0xe6020009  ! 2409: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xed22215c  ! 2409: STF_I	st	%f22, [0x015c, %r8]
	.word 0xce720009  ! 2412: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 2412: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2412: STBAR	stbar
	.word 0xdb3a0009  ! 2415: STDF_R	std	%f13, [%r9, %r8]
	.word 0xce420009  ! 2415: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc36a23c4  ! 2415: PREFETCH_I	prefetch	[%r8 + 0x03c4], #one_read
	.word 0xf0220009  ! 2418: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xe0020009  ! 2418: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xc6ca1009  ! 2418: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xc8320009  ! 2421: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xdc1a0009  ! 2421: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x88fa0009  ! 2421: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xce2a0009  ! 2424: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc2020009  ! 2424: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x0cca0001  ! 2424: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc2720009  ! 2427: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce120009  ! 2427: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143e077  ! 2427: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc4320009  ! 2430: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc4520009  ! 2430: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x84722c98  ! 2430: UDIV_I	udiv 	%r8, 0x0c98, %r2
	.word 0xe9220009  ! 2433: STF_R	st	%f20, [%r9, %r8]
	.word 0xe20a0009  ! 2433: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xf6aa2348  ! 2433: STBA_I	stba	%r27, [%r8 + 0x0348] %asi
	.word 0xda220009  ! 2436: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xce4a0009  ! 2436: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8a7a22c0  ! 2436: SDIV_I	sdiv 	%r8, 0x02c0, %r5
	.word 0xcf3a0009  ! 2439: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc80a0009  ! 2439: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x40000002  ! 2439: CALL	call	disp30_2
	.word 0xc33a0009  ! 2442: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4420009  ! 2442: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc65a2280  ! 2442: LDX_I	ldx	[%r8 + 0x0280], %r3
	.word 0xc9220009  ! 2445: STF_R	st	%f4, [%r9, %r8]
	.word 0xc41a0009  ! 2445: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc8c21009  ! 2445: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc22a0009  ! 2448: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc0a0009  ! 2448: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x9c4a0009  ! 2448: MULX_R	mulx 	%r8, %r9, %r14
	.word 0xca220009  ! 2451: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 2451: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xe0da1009  ! 2451: LDXA_R	ldxa	[%r8, %r9] 0x80, %r16
	.word 0xe0220009  ! 2454: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xf2020009  ! 2454: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xc91a2638  ! 2454: LDDF_I	ldd	[%r8, 0x0638], %f4
	.word 0xc62a0009  ! 2457: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe4120009  ! 2457: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xc09a1009  ! 2457: LDDA_R	ldda	[%r8, %r9] 0x80, %r0
	.word 0xe0320009  ! 2460: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xdc0a0009  ! 2460: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xc6fa1009  ! 2460: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 2463: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc5020009  ! 2463: LDF_R	ld	[%r8, %r9], %f2
	.word 0xcef22610  ! 2463: STXA_I	stxa	%r7, [%r8 + 0x0610] %asi
	.word 0xc2320009  ! 2466: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc7020009  ! 2466: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc8b21009  ! 2466: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xee2a0009  ! 2469: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xcb020009  ! 2469: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143c000  ! 2469: STBAR	stbar
	.word 0xc7220009  ! 2472: STF_R	st	%f3, [%r9, %r8]
	.word 0xc51a0009  ! 2472: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x89a20929  ! 2472: FMULs	fmuls	%f8, %f9, %f4
	.word 0xca2a0009  ! 2475: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd8520009  ! 2475: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xfa921009  ! 2475: LDUHA_R	lduha	[%r8, %r9] 0x80, %r29
	.word 0xc62a0009  ! 2478: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 2478: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xca7a0009  ! 2478: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xc42a0009  ! 2481: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc1a0009  ! 2481: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x83222668  ! 2481: MULScc_I	mulscc 	%r8, 0x0668, %r1
	.word 0xe8320009  ! 2484: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc8520009  ! 2484: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x84720009  ! 2484: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xce320009  ! 2487: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc81a0009  ! 2487: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xceea2288  ! 2487: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0288] %asi
	.word 0xc73a0009  ! 2490: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe81a0009  ! 2490: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xeeca22f8  ! 2490: LDSBA_I	ldsba	[%r8, + 0x02f8] %asi, %r23
	.word 0xc8720009  ! 2493: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce520009  ! 2493: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8cda2a64  ! 2493: SMULcc_I	smulcc 	%r8, 0x0a64, %r6
	.word 0xcf220009  ! 2496: STF_R	st	%f7, [%r9, %r8]
	.word 0xce5a0009  ! 2496: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143e064  ! 2496: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xdf3a0009  ! 2499: STDF_R	std	%f15, [%r9, %r8]
	.word 0xc2420009  ! 2499: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xce7a0009  ! 2499: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xec720009  ! 2502: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc24a0009  ! 2502: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x86f22c7c  ! 2502: UDIVcc_I	udivcc 	%r8, 0x0c7c, %r3
	.word 0xc8220009  ! 2505: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc45a0009  ! 2505: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2505: STBAR	stbar
	.word 0xc4220009  ! 2508: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xea420009  ! 2508: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xdb1a0009  ! 2508: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xcd3a0009  ! 2511: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe2120009  ! 2511: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xc3ea1009  ! 2511: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xef3a0009  ! 2514: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc01a0009  ! 2514: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xb07a2e6c  ! 2514: SDIV_I	sdiv 	%r8, 0x0e6c, %r24
	.word 0xe6320009  ! 2517: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xd60a0009  ! 2517: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0x85220009  ! 2517: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xfa320009  ! 2520: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xf0520009  ! 2520: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xc51a0009  ! 2520: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc4220009  ! 2523: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xee0a0009  ! 2523: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xee0a0009  ! 2523: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xcb220009  ! 2526: STF_R	st	%f5, [%r9, %r8]
	.word 0xc9020009  ! 2526: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143e054  ! 2526: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xdc720009  ! 2529: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xe0120009  ! 2529: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xc68a2718  ! 2529: LDUBA_I	lduba	[%r8, + 0x0718] %asi, %r3
	.word 0xf4220009  ! 2532: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc3020009  ! 2532: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc36a0009  ! 2532: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd62a0009  ! 2535: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xcd020009  ! 2535: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc2fa1009  ! 2535: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xed220009  ! 2538: STF_R	st	%f22, [%r9, %r8]
	.word 0xce520009  ! 2538: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc8da23d0  ! 2538: LDXA_I	ldxa	[%r8, + 0x03d0] %asi, %r4
	.word 0xfa720009  ! 2541: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xde120009  ! 2541: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc24a2fbc  ! 2541: LDSB_I	ldsb	[%r8 + 0x0fbc], %r1
	.word 0xdc2a0009  ! 2544: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc4020009  ! 2544: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 2544: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf4220009  ! 2547: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc4020009  ! 2547: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc91a0009  ! 2547: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcc220009  ! 2550: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcf020009  ! 2550: LDF_R	ld	[%r8, %r9], %f7
	.word 0xa3a209a9  ! 2550: FDIVs	fdivs	%f8, %f9, %f17
	.word 0xe6320009  ! 2553: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xe7020009  ! 2553: LDF_R	ld	[%r8, %r9], %f19
	.word 0xeeaa1009  ! 2553: STBA_R	stba	%r23, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 2556: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 2556: LDF_R	ld	[%r8, %r9], %f3
	.word 0xf27a0009  ! 2556: SWAP_R	swap	%r25, [%r8 + %r9]
	.word 0xfc220009  ! 2559: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xe71a0009  ! 2559: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xc2520009  ! 2559: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc2220009  ! 2562: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 2562: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3ea2e10  ! 2562: PREFETCHA_I	prefetcha	[%r8, + 0x0e10] %asi, #one_read
	.word 0xf82a0009  ! 2565: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc3020009  ! 2565: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e07e  ! 2565: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xe9220009  ! 2568: STF_R	st	%f20, [%r9, %r8]
	.word 0xce520009  ! 2568: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 2568: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdc2a0009  ! 2571: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xe00a0009  ! 2571: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xc3ea2b6c  ! 2571: PREFETCHA_I	prefetcha	[%r8, + 0x0b6c] %asi, #one_read
	.word 0xc8320009  ! 2574: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce520009  ! 2574: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc36a21f8  ! 2574: PREFETCH_I	prefetch	[%r8 + 0x01f8], #one_read
	.word 0xc6720009  ! 2577: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca4a0009  ! 2577: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcc1a0009  ! 2577: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xcc720009  ! 2580: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc25a0009  ! 2580: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc8120009  ! 2580: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xec320009  ! 2583: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xe0520009  ! 2583: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x8ada28a4  ! 2583: SMULcc_I	smulcc 	%r8, 0x08a4, %r5
	.word 0xcf3a0009  ! 2586: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca5a0009  ! 2586: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143e008  ! 2586: MEMBAR	membar	#StoreStore 
	.word 0xce220009  ! 2589: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc20a0009  ! 2589: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xdff21009  ! 2589: CASXA_I	casxa	[%r8] 0x80, %r9, %r15
	.word 0xce220009  ! 2592: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 2592: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xd6020009  ! 2592: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xec2a0009  ! 2595: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xe91a0009  ! 2595: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0x3c800001  ! 2595: BPOS	bpos,a	<label_0x1>
	.word 0xe73a0009  ! 2598: STDF_R	std	%f19, [%r9, %r8]
	.word 0xf20a0009  ! 2598: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x8c720009  ! 2598: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xca320009  ! 2601: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf44a0009  ! 2601: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xc3ea1009  ! 2601: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca2a0009  ! 2604: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 2604: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc87a2c28  ! 2604: SWAP_I	swap	%r4, [%r8 + 0x0c28]
	.word 0xc33a0009  ! 2607: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4520009  ! 2607: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8e4a0009  ! 2607: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xc2320009  ! 2610: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2420009  ! 2610: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xeca21009  ! 2610: STWA_R	stwa	%r22, [%r8 + %r9] 0x80
	.word 0xf8720009  ! 2613: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xfe0a0009  ! 2613: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0x3e800001  ! 2613: BVC	bvc,a	<label_0x1>
	.word 0xce720009  ! 2616: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 2616: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xdc02295c  ! 2616: LDUW_I	lduw	[%r8 + 0x095c], %r14
	.word 0xc42a0009  ! 2619: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf2420009  ! 2619: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xc6ca29bc  ! 2619: LDSBA_I	ldsba	[%r8, + 0x09bc] %asi, %r3
	.word 0xf1220009  ! 2622: STF_R	st	%f24, [%r9, %r8]
	.word 0xce120009  ! 2622: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 2622: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc42a0009  ! 2625: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 2625: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc9020009  ! 2625: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcc720009  ! 2628: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce420009  ! 2628: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xce8a1009  ! 2628: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xc2720009  ! 2631: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc4520009  ! 2631: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc3ea2734  ! 2631: PREFETCHA_I	prefetcha	[%r8, + 0x0734] %asi, #one_read
	.word 0xc8320009  ! 2634: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xea420009  ! 2634: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc73a0009  ! 2634: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca720009  ! 2637: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd8520009  ! 2637: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xcd3a2cd0  ! 2637: STDF_I	std	%f6, [0x0cd0, %r8]
	.word 0xcb220009  ! 2640: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc4a0009  ! 2640: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143e030  ! 2640: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xe9220009  ! 2643: STF_R	st	%f20, [%r9, %r8]
	.word 0xed1a0009  ! 2643: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xf46a0009  ! 2643: LDSTUB_R	ldstub	%r26, [%r8 + %r9]
	.word 0xc2320009  ! 2646: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf80a0009  ! 2646: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x864a2f18  ! 2646: MULX_I	mulx 	%r8, 0x0f18, %r3
	.word 0xf2320009  ! 2649: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xec020009  ! 2649: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8d6a2458  ! 2649: SDIVX_I	sdivx	%r8, 0x0458, %r6
	.word 0xcb220009  ! 2652: STF_R	st	%f5, [%r9, %r8]
	.word 0xf4420009  ! 2652: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xced22fa0  ! 2652: LDSHA_I	ldsha	[%r8, + 0x0fa0] %asi, %r7
	.word 0xc5220009  ! 2655: STF_R	st	%f2, [%r9, %r8]
	.word 0xc2120009  ! 2655: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xa8da0009  ! 2655: SMULcc_R	smulcc 	%r8, %r9, %r20
	.word 0xcc2a0009  ! 2658: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 2658: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc4b225a8  ! 2658: STHA_I	stha	%r2, [%r8 + 0x05a8] %asi
	.word 0xc7220009  ! 2661: STF_R	st	%f3, [%r9, %r8]
	.word 0xf8020009  ! 2661: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xceaa1009  ! 2661: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xfb3a0009  ! 2664: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc5020009  ! 2664: LDF_R	ld	[%r8, %r9], %f2
	.word 0xfcca1009  ! 2664: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r30
	.word 0xf5220009  ! 2667: STF_R	st	%f26, [%r9, %r8]
	.word 0xc45a0009  ! 2667: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x02c20001  ! 2667: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xcc220009  ! 2670: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xda020009  ! 2670: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xc36a2338  ! 2670: PREFETCH_I	prefetch	[%r8 + 0x0338], #one_read
	.word 0xf0220009  ! 2673: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc6420009  ! 2673: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8d2223c8  ! 2673: MULScc_I	mulscc 	%r8, 0x03c8, %r6
	.word 0xcd3a0009  ! 2676: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc2120009  ! 2676: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xfc1a0009  ! 2676: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xf6720009  ! 2679: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xcd020009  ! 2679: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8ada0009  ! 2679: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xc8720009  ! 2682: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 2682: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xce8a2ebc  ! 2682: LDUBA_I	lduba	[%r8, + 0x0ebc] %asi, %r7
	.word 0xfe220009  ! 2685: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc6120009  ! 2685: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8143c000  ! 2685: STBAR	stbar
	.word 0xc33a0009  ! 2688: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4520009  ! 2688: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xb1a208a9  ! 2688: FSUBs	fsubs	%f8, %f9, %f24
	.word 0xe7220009  ! 2691: STF_R	st	%f19, [%r9, %r8]
	.word 0xf65a0009  ! 2691: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xa7a208a9  ! 2691: FSUBs	fsubs	%f8, %f9, %f19
	.word 0xc3220009  ! 2694: STF_R	st	%f1, [%r9, %r8]
	.word 0xc81a0009  ! 2694: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2694: STBAR	stbar
	.word 0xcf220009  ! 2697: STF_R	st	%f7, [%r9, %r8]
	.word 0xf1020009  ! 2697: LDF_R	ld	[%r8, %r9], %f24
	.word 0x8143e01c  ! 2697: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xee720009  ! 2700: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xe01a0009  ! 2700: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xc3ea2b8c  ! 2700: PREFETCHA_I	prefetcha	[%r8, + 0x0b8c] %asi, #one_read
	.word 0xc93a0009  ! 2703: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe5020009  ! 2703: LDF_R	ld	[%r8, %r9], %f18
	.word 0xc6520009  ! 2703: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xca220009  ! 2706: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4120009  ! 2706: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea2b2c  ! 2706: PREFETCHA_I	prefetcha	[%r8, + 0x0b2c] %asi, #one_read
	.word 0xc22a0009  ! 2709: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfa5a0009  ! 2709: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xa5222700  ! 2709: MULScc_I	mulscc 	%r8, 0x0700, %r18
	.word 0xc22a0009  ! 2712: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6520009  ! 2712: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xce7a22f4  ! 2712: SWAP_I	swap	%r7, [%r8 + 0x02f4]
	.word 0xf02a0009  ! 2715: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xfb1a0009  ! 2715: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0x8143e05b  ! 2715: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc42a0009  ! 2718: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd6520009  ! 2718: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0x9afa2d04  ! 2718: SDIVcc_I	sdivcc 	%r8, 0x0d04, %r13
	.word 0xcf3a0009  ! 2721: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca5a0009  ! 2721: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xca02286c  ! 2721: LDUW_I	lduw	[%r8 + 0x086c], %r5
	.word 0xec2a0009  ! 2724: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc2420009  ! 2724: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 2724: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc62a0009  ! 2727: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xda120009  ! 2727: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xcf220009  ! 2727: STF_R	st	%f7, [%r9, %r8]
	.word 0xc62a0009  ! 2730: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc25a0009  ! 2730: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x856a0009  ! 2730: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xce220009  ! 2733: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xdc0a0009  ! 2733: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xb5a209a9  ! 2733: FDIVs	fdivs	%f8, %f9, %f26
	.word 0xc3220009  ! 2736: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc1a0009  ! 2736: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc91a0009  ! 2736: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xf42a0009  ! 2739: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xdc1a0009  ! 2739: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xf49a2968  ! 2739: LDDA_I	ldda	[%r8, + 0x0968] %asi, %r26
	.word 0xe9220009  ! 2742: STF_R	st	%f20, [%r9, %r8]
	.word 0xe64a0009  ! 2742: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x32800001  ! 2742: BNE	bne,a	<label_0x1>
	.word 0xc7220009  ! 2745: STF_R	st	%f3, [%r9, %r8]
	.word 0xc8420009  ! 2745: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcc7a0009  ! 2745: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xce220009  ! 2748: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc2420009  ! 2748: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x2c800001  ! 2748: BNEG	bneg,a	<label_0x1>
	.word 0xca720009  ! 2751: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc8520009  ! 2751: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xcff22009  ! 2751: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xe2320009  ! 2754: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xca120009  ! 2754: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8afa0009  ! 2754: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc6720009  ! 2757: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc71a0009  ! 2757: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xddf22009  ! 2757: CASXA_R	casxa	[%r8]%asi, %r9, %r14
	.word 0xc62a0009  ! 2760: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 2760: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xcef21009  ! 2760: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 2763: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce020009  ! 2763: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc49a1009  ! 2763: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc93a0009  ! 2766: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc84a0009  ! 2766: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xb44a2b3c  ! 2766: MULX_I	mulx 	%r8, 0x0b3c, %r26
	.word 0xc22a0009  ! 2769: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe44a0009  ! 2769: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0x8af22944  ! 2769: UDIVcc_I	udivcc 	%r8, 0x0944, %r5
	.word 0xc82a0009  ! 2772: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfb020009  ! 2772: LDF_R	ld	[%r8, %r9], %f29
	.word 0x86f222fc  ! 2772: UDIVcc_I	udivcc 	%r8, 0x02fc, %r3
	.word 0xf1220009  ! 2775: STF_R	st	%f24, [%r9, %r8]
	.word 0xfd1a0009  ! 2775: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x40000001  ! 2775: CALL	call	disp30_1
	.word 0xe02a0009  ! 2778: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc2020009  ! 2778: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x3c800002  ! 2778: BPOS	bpos,a	<label_0x2>
	.word 0xc4720009  ! 2781: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcf1a0009  ! 2781: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x88722020  ! 2781: UDIV_I	udiv 	%r8, 0x0020, %r4
	.word 0xc8220009  ! 2784: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 2784: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc4ba2108  ! 2784: STDA_I	stda	%r2, [%r8 + 0x0108] %asi
	.word 0xce720009  ! 2787: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4020009  ! 2787: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xa27a0009  ! 2787: SDIV_R	sdiv 	%r8, %r9, %r17
	.word 0xc5220009  ! 2790: STF_R	st	%f2, [%r9, %r8]
	.word 0xc91a0009  ! 2790: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xccba1009  ! 2790: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 2793: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca020009  ! 2793: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8ba208a9  ! 2793: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xcb220009  ! 2796: STF_R	st	%f5, [%r9, %r8]
	.word 0xe8420009  ! 2796: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xaad222c0  ! 2796: UMULcc_I	umulcc 	%r8, 0x02c0, %r21
	.word 0xc7220009  ! 2799: STF_R	st	%f3, [%r9, %r8]
	.word 0xcf1a0009  ! 2799: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xccea1009  ! 2799: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xf13a0009  ! 2802: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc40a0009  ! 2802: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc80a2464  ! 2802: LDUB_I	ldub	[%r8 + 0x0464], %r4
	.word 0xc8320009  ! 2805: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xdc5a0009  ! 2805: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0x8c520009  ! 2805: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xe0720009  ! 2808: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xcc1a0009  ! 2808: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143e045  ! 2808: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xd6220009  ! 2811: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc81a0009  ! 2811: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xce4a0009  ! 2811: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc73a0009  ! 2814: STDF_R	std	%f3, [%r9, %r8]
	.word 0xda020009  ! 2814: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0x2cca0001  ! 2814: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc6320009  ! 2817: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf0520009  ! 2817: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xc2aa1009  ! 2817: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xc33a0009  ! 2820: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc6120009  ! 2820: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x83220009  ! 2820: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xcf3a0009  ! 2823: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca4a0009  ! 2823: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 2823: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe22a0009  ! 2826: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xe85a0009  ! 2826: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0x8143c000  ! 2826: STBAR	stbar
	.word 0xc7220009  ! 2829: STF_R	st	%f3, [%r9, %r8]
	.word 0xda5a0009  ! 2829: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x8c4a2b68  ! 2829: MULX_I	mulx 	%r8, 0x0b68, %r6
	.word 0xc53a0009  ! 2832: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcf020009  ! 2832: LDF_R	ld	[%r8, %r9], %f7
	.word 0x83222b60  ! 2832: MULScc_I	mulscc 	%r8, 0x0b60, %r1
	.word 0xe33a0009  ! 2835: STDF_R	std	%f17, [%r9, %r8]
	.word 0xdf020009  ! 2835: LDF_R	ld	[%r8, %r9], %f15
	.word 0x84da2cd4  ! 2835: SMULcc_I	smulcc 	%r8, 0x0cd4, %r2
	.word 0xc33a0009  ! 2838: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce520009  ! 2838: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x14800001  ! 2838: BG	bg  	<label_0x1>
	.word 0xc33a0009  ! 2841: STDF_R	std	%f1, [%r9, %r8]
	.word 0xee5a0009  ! 2841: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xb3a208a9  ! 2841: FSUBs	fsubs	%f8, %f9, %f25
	.word 0xfa320009  ! 2844: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc64a0009  ! 2844: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc52220ec  ! 2844: STF_I	st	%f2, [0x00ec, %r8]
	.word 0xf1220009  ! 2847: STF_R	st	%f24, [%r9, %r8]
	.word 0xfd020009  ! 2847: LDF_R	ld	[%r8, %r9], %f30
	.word 0x8143e07f  ! 2847: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcd3a0009  ! 2850: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf65a0009  ! 2850: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0x0e800001  ! 2850: BVS	bvs  	<label_0x1>
	.word 0xf8720009  ! 2853: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc40a0009  ! 2853: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x2c800001  ! 2853: BNEG	bneg,a	<label_0x1>
	.word 0xc62a0009  ! 2856: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe44a0009  ! 2856: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0x0aca0001  ! 2856: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xf8720009  ! 2859: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc4420009  ! 2859: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x3e800001  ! 2859: BVC	bvc,a	<label_0x1>
	.word 0xcc320009  ! 2862: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc41a0009  ! 2862: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xb2fa0009  ! 2862: SDIVcc_R	sdivcc 	%r8, %r9, %r25
	.word 0xf0720009  ! 2865: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xee520009  ! 2865: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x1e800001  ! 2865: BVC	bvc  	<label_0x1>
	.word 0xf9220009  ! 2868: STF_R	st	%f28, [%r9, %r8]
	.word 0xd41a0009  ! 2868: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0x18800001  ! 2868: BGU	bgu  	<label_0x1>
	.word 0xdb3a0009  ! 2871: STDF_R	std	%f13, [%r9, %r8]
	.word 0xca520009  ! 2871: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xf4420009  ! 2871: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc3220009  ! 2874: STF_R	st	%f1, [%r9, %r8]
	.word 0xca5a0009  ! 2874: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8fa20929  ! 2874: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc73a0009  ! 2877: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc020009  ! 2877: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc64a2ec4  ! 2877: LDSB_I	ldsb	[%r8 + 0x0ec4], %r3
	.word 0xe2220009  ! 2880: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xe85a0009  ! 2880: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0x866a2b8c  ! 2880: UDIVX_I	udivx 	%r8, 0x0b8c, %r3
	.word 0xcf3a0009  ! 2883: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2120009  ! 2883: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xaa6a242c  ! 2883: UDIVX_I	udivx 	%r8, 0x042c, %r21
	.word 0xc42a0009  ! 2886: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 2886: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xf7222680  ! 2886: STF_I	st	%f27, [0x0680, %r8]
	.word 0xc93a0009  ! 2889: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2520009  ! 2889: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcd1a2ad0  ! 2889: LDDF_I	ldd	[%r8, 0x0ad0], %f6
	.word 0xc93a0009  ! 2892: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcf1a0009  ! 2892: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc8ba2110  ! 2892: STDA_I	stda	%r4, [%r8 + 0x0110] %asi
	.word 0xc2220009  ! 2895: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 2895: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xdeb22658  ! 2895: STHA_I	stha	%r15, [%r8 + 0x0658] %asi
	.word 0xc22a0009  ! 2898: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xdd1a0009  ! 2898: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xbcf20009  ! 2898: UDIVcc_R	udivcc 	%r8, %r9, %r30
	.word 0xc4720009  ! 2901: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf8520009  ! 2901: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0x16800002  ! 2901: BGE	bge  	<label_0x2>
	.word 0xcc220009  ! 2904: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca4a0009  ! 2904: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x86fa2d3c  ! 2904: SDIVcc_I	sdivcc 	%r8, 0x0d3c, %r3
	.word 0xc4220009  ! 2907: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xfe4a0009  ! 2907: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xc36a0009  ! 2907: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xda2a0009  ! 2910: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc8420009  ! 2910: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc9020009  ! 2910: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc9220009  ! 2913: STF_R	st	%f4, [%r9, %r8]
	.word 0xce5a0009  ! 2913: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x24ca0001  ! 2913: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc6720009  ! 2916: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 2916: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x82da2724  ! 2916: SMULcc_I	smulcc 	%r8, 0x0724, %r1
	.word 0xc42a0009  ! 2919: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd6020009  ! 2919: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x8143e049  ! 2919: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xc22a0009  ! 2922: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf2420009  ! 2922: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xc3ea1009  ! 2922: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd220009  ! 2925: STF_R	st	%f6, [%r9, %r8]
	.word 0xcb1a0009  ! 2925: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8da20929  ! 2925: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc82a0009  ! 2928: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 2928: LDF_R	ld	[%r8, %r9], %f4
	.word 0xa0722b48  ! 2928: UDIV_I	udiv 	%r8, 0x0b48, %r16
	.word 0xcc2a0009  ! 2931: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 2931: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 2931: STBAR	stbar
	.word 0xc22a0009  ! 2934: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe6520009  ! 2934: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0x02800001  ! 2934: BE	be  	<label_0x1>
	.word 0xc2220009  ! 2937: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 2937: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc2ea226c  ! 2937: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x026c] %asi
	.word 0xd6220009  ! 2940: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc4120009  ! 2940: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2940: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xea220009  ! 2943: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xf64a0009  ! 2943: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x896a0009  ! 2943: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xcc220009  ! 2946: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xeb020009  ! 2946: LDF_R	ld	[%r8, %r9], %f21
	.word 0x8e520009  ! 2946: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xc6220009  ! 2949: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 2949: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xe41a23d8  ! 2949: LDD_I	ldd	[%r8 + 0x03d8], %r18
	.word 0xc2720009  ! 2952: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcf020009  ! 2952: LDF_R	ld	[%r8, %r9], %f7
	.word 0x3a800002  ! 2952: BCC	bcc,a	<label_0x2>
	.word 0xd8320009  ! 2955: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xce020009  ! 2955: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x18800001  ! 2955: BGU	bgu  	<label_0x1>
	.word 0xfd220009  ! 2958: STF_R	st	%f30, [%r9, %r8]
	.word 0xc2020009  ! 2958: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8eda2e5c  ! 2958: SMULcc_I	smulcc 	%r8, 0x0e5c, %r7
	.word 0xc8220009  ! 2961: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6420009  ! 2961: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x84fa28e4  ! 2961: SDIVcc_I	sdivcc 	%r8, 0x08e4, %r2
	.word 0xce220009  ! 2964: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf24a0009  ! 2964: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xa1a20929  ! 2964: FMULs	fmuls	%f8, %f9, %f16
	.word 0xde220009  ! 2967: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc8420009  ! 2967: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 2967: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe13a0009  ! 2970: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc8020009  ! 2970: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 2970: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd73a0009  ! 2973: STDF_R	std	%f11, [%r9, %r8]
	.word 0xcc1a0009  ! 2973: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x9e720009  ! 2973: UDIV_R	udiv 	%r8, %r9, %r15
	.word 0xc8220009  ! 2976: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcf1a0009  ! 2976: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x38800001  ! 2976: BGU	bgu,a	<label_0x1>
	.word 0xcc2a0009  ! 2979: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xea120009  ! 2979: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xdcf21009  ! 2979: STXA_R	stxa	%r14, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 2982: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcd020009  ! 2982: LDF_R	ld	[%r8, %r9], %f6
	.word 0x30800001  ! 2982: BA	ba,a	<label_0x1>
	.word 0xc73a0009  ! 2985: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc2420009  ! 2985: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xce8a1009  ! 2985: LDUBA_R	lduba	[%r8, %r9] 0x80, %r7
	.word 0xcf3a0009  ! 2988: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfc420009  ! 2988: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xdef21009  ! 2988: STXA_R	stxa	%r15, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 2991: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf4120009  ! 2991: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0x8ad22c94  ! 2991: UMULcc_I	umulcc 	%r8, 0x0c94, %r5
	.word 0xce720009  ! 2994: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 2994: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x836a2eec  ! 2994: SDIVX_I	sdivx	%r8, 0x0eec, %r1
	.word 0xc6720009  ! 2997: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc64a0009  ! 2997: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc6b21009  ! 2997: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xfe220009  ! 3000: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xca5a0009  ! 3000: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x827a0009  ! 3000: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc82a0009  ! 3003: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce420009  ! 3003: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xdc5a2e28  ! 3003: LDX_I	ldx	[%r8 + 0x0e28], %r14
	.word 0xc73a0009  ! 3006: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc24a0009  ! 3006: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc6f21009  ! 3006: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 3009: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce120009  ! 3009: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xe67a2228  ! 3009: SWAP_I	swap	%r19, [%r8 + 0x0228]
	.word 0xe4220009  ! 3012: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc41a0009  ! 3012: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc65a2038  ! 3012: LDX_I	ldx	[%r8 + 0x0038], %r3
	.word 0xc7220009  ! 3015: STF_R	st	%f3, [%r9, %r8]
	.word 0xca4a0009  ! 3015: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8f220009  ! 3015: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xcc220009  ! 3018: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xee120009  ! 3018: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xfc9a1009  ! 3018: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xc93a0009  ! 3021: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf8520009  ! 3021: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0x14800001  ! 3021: BG	bg  	<label_0x1>
	.word 0xc62a0009  ! 3024: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 3024: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x866a0009  ! 3024: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xca220009  ! 3027: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc5020009  ! 3027: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 3027: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3220009  ! 3030: STF_R	st	%f1, [%r9, %r8]
	.word 0xcf1a0009  ! 3030: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc36a0009  ! 3030: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca320009  ! 3033: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc2520009  ! 3033: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcca21009  ! 3033: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xce220009  ! 3036: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 3036: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xe6a21009  ! 3036: STWA_R	stwa	%r19, [%r8 + %r9] 0x80
	.word 0xce720009  ! 3039: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf81a0009  ! 3039: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xcb022014  ! 3039: LDF_I	ld	[%r8, 0x0014], %f5
	.word 0xc6720009  ! 3042: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xfa520009  ! 3042: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x8143e032  ! 3042: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xc6720009  ! 3045: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc64a0009  ! 3045: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143e033  ! 3045: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xce220009  ! 3048: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf44a0009  ! 3048: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0x9f220009  ! 3048: MULScc_R	mulscc 	%r8, %r9, %r15
	.word 0xca220009  ! 3051: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf4120009  ! 3051: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xca7a2ad4  ! 3051: SWAP_I	swap	%r5, [%r8 + 0x0ad4]
	.word 0xcc320009  ! 3054: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc520009  ! 3054: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x9e7a0009  ! 3054: SDIV_R	sdiv 	%r8, %r9, %r15
	.word 0xcd3a0009  ! 3057: STDF_R	std	%f6, [%r9, %r8]
	.word 0xee420009  ! 3057: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xc6b21009  ! 3057: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 3060: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 3060: LDF_R	ld	[%r8, %r9], %f4
	.word 0x88720009  ! 3060: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc8220009  ! 3063: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca520009  ! 3063: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc60a0009  ! 3063: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xd93a0009  ! 3066: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc4520009  ! 3066: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc36a263c  ! 3066: PREFETCH_I	prefetch	[%r8 + 0x063c], #one_read
	.word 0xc2320009  ! 3069: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc120009  ! 3069: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xf4ea1009  ! 3069: LDSTUBA_R	ldstuba	%r26, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 3072: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc65a0009  ! 3072: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc64a0009  ! 3072: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xca320009  ! 3075: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe2420009  ! 3075: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xdf020009  ! 3075: LDF_R	ld	[%r8, %r9], %f15
	.word 0xc5220009  ! 3078: STF_R	st	%f2, [%r9, %r8]
	.word 0xcb020009  ! 3078: LDF_R	ld	[%r8, %r9], %f5
	.word 0x00800002  ! 3078: BN	bn  	<label_0x2>
	.word 0xe3220009  ! 3081: STF_R	st	%f17, [%r9, %r8]
	.word 0xec420009  ! 3081: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x8143e00e  ! 3081: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xcf3a0009  ! 3084: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc4a0009  ! 3084: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xf93a0009  ! 3084: STDF_R	std	%f28, [%r9, %r8]
	.word 0xf13a0009  ! 3087: STDF_R	std	%f24, [%r9, %r8]
	.word 0xd6020009  ! 3087: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x2cc20001  ! 3087: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xcd220009  ! 3090: STF_R	st	%f6, [%r9, %r8]
	.word 0xc2420009  ! 3090: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 3090: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 3093: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf25a0009  ! 3093: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xdcaa1009  ! 3093: STBA_R	stba	%r14, [%r8 + %r9] 0x80
	.word 0xc33a0009  ! 3096: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4420009  ! 3096: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a244c  ! 3096: PREFETCH_I	prefetch	[%r8 + 0x044c], #one_read
	.word 0xce720009  ! 3099: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 3099: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcaaa2690  ! 3099: STBA_I	stba	%r5, [%r8 + 0x0690] %asi
	.word 0xc8720009  ! 3102: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8420009  ! 3102: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3102: STBAR	stbar
	.word 0xff3a0009  ! 3105: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc9020009  ! 3105: LDF_R	ld	[%r8, %r9], %f4
	.word 0x9c520009  ! 3105: UMUL_R	umul 	%r8, %r9, %r14
	.word 0xd8220009  ! 3108: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xcc0a0009  ! 3108: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x88da2b6c  ! 3108: SMULcc_I	smulcc 	%r8, 0x0b6c, %r4
	.word 0xcf3a0009  ! 3111: STDF_R	std	%f7, [%r9, %r8]
	.word 0xdf1a0009  ! 3111: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xc36a2578  ! 3111: PREFETCH_I	prefetch	[%r8 + 0x0578], #one_read
	.word 0xcb220009  ! 3114: STF_R	st	%f5, [%r9, %r8]
	.word 0xd71a0009  ! 3114: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xc8422a00  ! 3114: LDSW_I	ldsw	[%r8 + 0x0a00], %r4
	.word 0xdb3a0009  ! 3117: STDF_R	std	%f13, [%r9, %r8]
	.word 0xdc020009  ! 3117: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xc36a244c  ! 3117: PREFETCH_I	prefetch	[%r8 + 0x044c], #one_read
	.word 0xca220009  ! 3120: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8420009  ! 3120: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xa26a0009  ! 3120: UDIVX_R	udivx 	%r8, %r9, %r17
	.word 0xcc2a0009  ! 3123: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce420009  ! 3123: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xfd220009  ! 3123: STF_R	st	%f30, [%r9, %r8]
	.word 0xc22a0009  ! 3126: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xd6020009  ! 3126: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x827a2cc0  ! 3126: SDIV_I	sdiv 	%r8, 0x0cc0, %r1
	.word 0xcc220009  ! 3129: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xdc0a0009  ! 3129: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0x8143e049  ! 3129: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0xcc320009  ! 3132: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 3132: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xd8022cc0  ! 3132: LDUW_I	lduw	[%r8 + 0x0cc0], %r12
	.word 0xcf3a0009  ! 3135: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcf1a0009  ! 3135: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143c000  ! 3135: STBAR	stbar
	.word 0xc6220009  ! 3138: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf1020009  ! 3138: LDF_R	ld	[%r8, %r9], %f24
	.word 0xb4720009  ! 3138: UDIV_R	udiv 	%r8, %r9, %r26
	.word 0xc93a0009  ! 3141: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc81a0009  ! 3141: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc2122de8  ! 3141: LDUH_I	lduh	[%r8 + 0x0de8], %r1
	.word 0xc82a0009  ! 3144: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 3144: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xdcf21009  ! 3144: STXA_R	stxa	%r14, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 3147: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe41a0009  ! 3147: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xce4a2eb8  ! 3147: LDSB_I	ldsb	[%r8 + 0x0eb8], %r7
	.word 0xc4720009  ! 3150: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 3150: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xe89a1009  ! 3150: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xc6720009  ! 3153: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca0a0009  ! 3153: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xfd3a2d40  ! 3153: STDF_I	std	%f30, [0x0d40, %r8]
	.word 0xca220009  ! 3156: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc2520009  ! 3156: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcd1a0009  ! 3156: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xeb3a0009  ! 3159: STDF_R	std	%f21, [%r9, %r8]
	.word 0xcc420009  ! 3159: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc41a0009  ! 3159: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xce220009  ! 3162: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 3162: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xda7a2040  ! 3162: SWAP_I	swap	%r13, [%r8 + 0x0040]
	.word 0xcc2a0009  ! 3165: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc6120009  ! 3165: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x02ca0001  ! 3165: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xf2320009  ! 3168: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xf4520009  ! 3168: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xc93a0009  ! 3168: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc6720009  ! 3171: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf2020009  ! 3171: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x04800001  ! 3171: BLE	ble  	<label_0x1>
	.word 0xce220009  ! 3174: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca120009  ! 3174: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3174: STBAR	stbar
	.word 0xcc2a0009  ! 3177: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 3177: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc36a2354  ! 3177: PREFETCH_I	prefetch	[%r8 + 0x0354], #one_read
	.word 0xc33a0009  ! 3180: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc0a0009  ! 3180: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xf13a0009  ! 3180: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc42a0009  ! 3183: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc2120009  ! 3183: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8a6a0009  ! 3183: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xca320009  ! 3186: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 3186: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc3ea2708  ! 3186: PREFETCHA_I	prefetcha	[%r8, + 0x0708] %asi, #one_read
	.word 0xdd220009  ! 3189: STF_R	st	%f14, [%r9, %r8]
	.word 0xf84a0009  ! 3189: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x8143c000  ! 3189: STBAR	stbar
	.word 0xce320009  ! 3192: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe3020009  ! 3192: LDF_R	ld	[%r8, %r9], %f17
	.word 0xcdf22009  ! 3192: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xf4220009  ! 3195: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xca020009  ! 3195: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x0e800001  ! 3195: BVS	bvs  	<label_0x1>
	.word 0xe1220009  ! 3198: STF_R	st	%f16, [%r9, %r8]
	.word 0xcc420009  ! 3198: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xe5022560  ! 3198: LDF_I	ld	[%r8, 0x0560], %f18
	.word 0xc8320009  ! 3201: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 3201: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xbef20009  ! 3201: UDIVcc_R	udivcc 	%r8, %r9, %r31
	.word 0xc82a0009  ! 3204: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xde5a0009  ! 3204: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0x1e800001  ! 3204: BVC	bvc  	<label_0x1>
	.word 0xc53a0009  ! 3207: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc64a0009  ! 3207: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xceda1009  ! 3207: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xcd3a0009  ! 3210: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca0a0009  ! 3210: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143e006  ! 3210: MEMBAR	membar	#StoreLoad | #LoadStore 
	.word 0xcc320009  ! 3213: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe04a0009  ! 3213: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xc3ea2478  ! 3213: PREFETCHA_I	prefetcha	[%r8, + 0x0478] %asi, #one_read
	.word 0xcf220009  ! 3216: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc4a0009  ! 3216: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x0cc20001  ! 3216: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xec320009  ! 3219: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xcc1a0009  ! 3219: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xe67a0009  ! 3219: SWAP_R	swap	%r19, [%r8 + %r9]
	.word 0xe3220009  ! 3222: STF_R	st	%f17, [%r9, %r8]
	.word 0xcc1a0009  ! 3222: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143c000  ! 3222: STBAR	stbar
	.word 0xcf220009  ! 3225: STF_R	st	%f7, [%r9, %r8]
	.word 0xc31a0009  ! 3225: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x34800002  ! 3225: BG	bg,a	<label_0x2>
	.word 0xc2720009  ! 3228: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe25a0009  ! 3228: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x22800001  ! 3228: BE	be,a	<label_0x1>
	.word 0xc7220009  ! 3231: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6020009  ! 3231: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcaea1009  ! 3231: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xd73a0009  ! 3234: STDF_R	std	%f11, [%r9, %r8]
	.word 0xce520009  ! 3234: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x1c800002  ! 3234: BPOS	bpos  	<label_0x2>
	.word 0xf73a0009  ! 3237: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc7020009  ! 3237: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143c000  ! 3237: STBAR	stbar
	.word 0xc8720009  ! 3240: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf8020009  ! 3240: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xd6b21009  ! 3240: STHA_R	stha	%r11, [%r8 + %r9] 0x80
	.word 0xca720009  ! 3243: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc5a0009  ! 3243: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x30800002  ! 3243: BA	ba,a	<label_0x2>
	.word 0xe8320009  ! 3246: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xce420009  ! 3246: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xe2b21009  ! 3246: STHA_R	stha	%r17, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 3249: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfc1a0009  ! 3249: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc3ea2e70  ! 3249: PREFETCHA_I	prefetcha	[%r8, + 0x0e70] %asi, #one_read
	.word 0xe0220009  ! 3252: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xf0520009  ! 3252: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x8ef2267c  ! 3252: UDIVcc_I	udivcc 	%r8, 0x067c, %r7
	.word 0xe13a0009  ! 3255: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc3020009  ! 3255: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc36a2674  ! 3255: PREFETCH_I	prefetch	[%r8 + 0x0674], #one_read
	.word 0xcc720009  ! 3258: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc4120009  ! 3258: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc45a0009  ! 3258: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc2720009  ! 3261: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce120009  ! 3261: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8a6a2d14  ! 3261: UDIVX_I	udivx 	%r8, 0x0d14, %r5
	.word 0xce320009  ! 3264: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xec420009  ! 3264: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x8a5a270c  ! 3264: SMUL_I	smul 	%r8, 0x070c, %r5
	.word 0xca2a0009  ! 3267: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc5a0009  ! 3267: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xd8b22c4c  ! 3267: STHA_I	stha	%r12, [%r8 + 0x0c4c] %asi
	.word 0xcd220009  ! 3270: STF_R	st	%f6, [%r9, %r8]
	.word 0xde520009  ! 3270: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xf9220009  ! 3270: STF_R	st	%f28, [%r9, %r8]
	.word 0xc82a0009  ! 3273: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe01a0009  ! 3273: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xcdf22009  ! 3273: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc8720009  ! 3276: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf81a0009  ! 3276: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xccca2ba0  ! 3276: LDSBA_I	ldsba	[%r8, + 0x0ba0] %asi, %r6
	.word 0xfe320009  ! 3279: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xee4a0009  ! 3279: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xf7220009  ! 3279: STF_R	st	%f27, [%r9, %r8]
	.word 0xcf220009  ! 3282: STF_R	st	%f7, [%r9, %r8]
	.word 0xce020009  ! 3282: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xe2f21009  ! 3282: STXA_R	stxa	%r17, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 3285: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xdc4a0009  ! 3285: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xcb1a0009  ! 3285: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xfe2a0009  ! 3288: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xf8520009  ! 3288: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xfde21009  ! 3288: CASA_I	casa	[%r8] 0x80, %r9, %r30
	.word 0xca320009  ! 3291: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 3291: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xa3a209a9  ! 3291: FDIVs	fdivs	%f8, %f9, %f17
	.word 0xf0720009  ! 3294: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc85a0009  ! 3294: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143e03c  ! 3294: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xce320009  ! 3297: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xfa0a0009  ! 3297: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x3c800002  ! 3297: BPOS	bpos,a	<label_0x2>
	.word 0xde720009  ! 3300: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc6420009  ! 3300: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xb27a2870  ! 3300: SDIV_I	sdiv 	%r8, 0x0870, %r25
	.word 0xc6320009  ! 3303: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8020009  ! 3303: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc3ea2004  ! 3303: PREFETCHA_I	prefetcha	[%r8, + 0x0004] %asi, #one_read
	.word 0xc2320009  ! 3306: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xfa4a0009  ! 3306: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xeafa23bc  ! 3306: SWAPA_I	swapa	%r21, [%r8 + 0x03bc] %asi
	.word 0xc5220009  ! 3309: STF_R	st	%f2, [%r9, %r8]
	.word 0xe8520009  ! 3309: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xcf3a2a80  ! 3309: STDF_I	std	%f7, [0x0a80, %r8]
	.word 0xe4720009  ! 3312: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc5020009  ! 3312: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8c520009  ! 3312: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xca720009  ! 3315: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 3315: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8e7a2584  ! 3315: SDIV_I	sdiv 	%r8, 0x0584, %r7
	.word 0xc62a0009  ! 3318: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcf1a0009  ! 3318: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x825a0009  ! 3318: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc6720009  ! 3321: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xfe420009  ! 3321: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xecba1009  ! 3321: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xee720009  ! 3324: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xcc4a0009  ! 3324: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcf02209c  ! 3324: LDF_I	ld	[%r8, 0x009c], %f7
	.word 0xc3220009  ! 3327: STF_R	st	%f1, [%r9, %r8]
	.word 0xfc1a0009  ! 3327: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc71a0009  ! 3327: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xe02a0009  ! 3330: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc8120009  ! 3330: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc2a22198  ! 3330: STWA_I	stwa	%r1, [%r8 + 0x0198] %asi
	.word 0xee320009  ! 3333: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc84a0009  ! 3333: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xf08a1009  ! 3333: LDUBA_R	lduba	[%r8, %r9] 0x80, %r24
	.word 0xdf3a0009  ! 3336: STDF_R	std	%f15, [%r9, %r8]
	.word 0xcc5a0009  ! 3336: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc36a2710  ! 3336: PREFETCH_I	prefetch	[%r8 + 0x0710], #one_read
	.word 0xca220009  ! 3339: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc020009  ! 3339: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcbe22009  ! 3339: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xe2220009  ! 3342: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc4420009  ! 3342: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xcef21009  ! 3342: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 3345: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc5a0009  ! 3345: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xfa120009  ! 3345: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xca720009  ! 3348: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca520009  ! 3348: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xdeaa1009  ! 3348: STBA_R	stba	%r15, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 3351: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 3351: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8ef20009  ! 3351: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xf53a0009  ! 3354: STDF_R	std	%f26, [%r9, %r8]
	.word 0xe4520009  ! 3354: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x8ba20829  ! 3354: FADDs	fadds	%f8, %f9, %f5
	.word 0xda220009  ! 3357: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc64a0009  ! 3357: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 3357: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce320009  ! 3360: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc2520009  ! 3360: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x24c20001  ! 3360: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc6220009  ! 3363: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 3363: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xe11a0009  ! 3363: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xcc2a0009  ! 3366: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcd020009  ! 3366: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc26a0009  ! 3366: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xcd3a0009  ! 3369: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc80a0009  ! 3369: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 3369: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc62a0009  ! 3372: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 3372: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc8ea2354  ! 3372: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0354] %asi
	.word 0xce220009  ! 3375: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd6120009  ! 3375: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0x99a209a9  ! 3375: FDIVs	fdivs	%f8, %f9, %f12
	.word 0xc3220009  ! 3378: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4120009  ! 3378: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xccda1009  ! 3378: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xec220009  ! 3381: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xca420009  ! 3381: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3381: STBAR	stbar
	.word 0xc4320009  ! 3384: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe6420009  ! 3384: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x1c800002  ! 3384: BPOS	bpos  	<label_0x2>
	.word 0xc2720009  ! 3387: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xee020009  ! 3387: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0x24800001  ! 3387: BLE	ble,a	<label_0x1>
	.word 0xca320009  ! 3390: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc0a0009  ! 3390: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc9e21009  ! 3390: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xc4720009  ! 3393: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf8520009  ! 3393: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xc36a0009  ! 3393: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8220009  ! 3396: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd71a0009  ! 3396: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xc6520009  ! 3396: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcc320009  ! 3399: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe64a0009  ! 3399: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc9f22009  ! 3399: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xc2220009  ! 3402: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 3402: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143c000  ! 3402: STBAR	stbar
	.word 0xcc720009  ! 3405: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xea0a0009  ! 3405: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xc2520009  ! 3405: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc9220009  ! 3408: STF_R	st	%f4, [%r9, %r8]
	.word 0xca4a0009  ! 3408: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc51a0009  ! 3408: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xd7220009  ! 3411: STF_R	st	%f11, [%r9, %r8]
	.word 0xe5020009  ! 3411: LDF_R	ld	[%r8, %r9], %f18
	.word 0xc36a2d58  ! 3411: PREFETCH_I	prefetch	[%r8 + 0x0d58], #one_read
	.word 0xe2720009  ! 3414: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc65a0009  ! 3414: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc41a2140  ! 3414: LDD_I	ldd	[%r8 + 0x0140], %r2
	.word 0xe82a0009  ! 3417: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc44a0009  ! 3417: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xf47a2a48  ! 3417: SWAP_I	swap	%r26, [%r8 + 0x0a48]
	.word 0xcd220009  ! 3420: STF_R	st	%f6, [%r9, %r8]
	.word 0xc41a0009  ! 3420: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcbe22009  ! 3420: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xed220009  ! 3423: STF_R	st	%f22, [%r9, %r8]
	.word 0xc3020009  ! 3423: LDF_R	ld	[%r8, %r9], %f1
	.word 0xe7f22009  ! 3423: CASXA_R	casxa	[%r8]%asi, %r9, %r19
	.word 0xc73a0009  ! 3426: STDF_R	std	%f3, [%r9, %r8]
	.word 0xee0a0009  ! 3426: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xc3ea2330  ! 3426: PREFETCHA_I	prefetcha	[%r8, + 0x0330] %asi, #one_read
	.word 0xc73a0009  ! 3429: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd7020009  ! 3429: LDF_R	ld	[%r8, %r9], %f11
	.word 0x85a209a9  ! 3429: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xcc720009  ! 3432: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc6120009  ! 3432: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x98720009  ! 3432: UDIV_R	udiv 	%r8, %r9, %r12
	.word 0xc8320009  ! 3435: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xfc1a0009  ! 3435: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xf81a2768  ! 3435: LDD_I	ldd	[%r8 + 0x0768], %r28
	.word 0xcc2a0009  ! 3438: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 3438: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcf3a2978  ! 3438: STDF_I	std	%f7, [0x0978, %r8]
	.word 0xd82a0009  ! 3441: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xd8520009  ! 3441: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0x10800001  ! 3441: BA	ba  	<label_0x1>
	.word 0xcc2a0009  ! 3444: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xd8420009  ! 3444: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xfca22988  ! 3444: STWA_I	stwa	%r30, [%r8 + 0x0988] %asi
	.word 0xc7220009  ! 3447: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc520009  ! 3447: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3020009  ! 3447: LDF_R	ld	[%r8, %r9], %f1
	.word 0xe4220009  ! 3450: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc81a0009  ! 3450: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc36a27d4  ! 3450: PREFETCH_I	prefetch	[%r8 + 0x07d4], #one_read
	.word 0xfe320009  ! 3453: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xcc120009  ! 3453: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x04c20001  ! 3453: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc4720009  ! 3456: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc45a0009  ! 3456: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xec9a2b68  ! 3456: LDDA_I	ldda	[%r8, + 0x0b68] %asi, %r22
	.word 0xc2220009  ! 3459: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xfc1a0009  ! 3459: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xcbf22009  ! 3459: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xc2720009  ! 3462: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 3462: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8da20929  ! 3462: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc3220009  ! 3465: STF_R	st	%f1, [%r9, %r8]
	.word 0xc65a0009  ! 3465: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xdab21009  ! 3465: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 3468: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca020009  ! 3468: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc41a2458  ! 3468: LDD_I	ldd	[%r8 + 0x0458], %r2
	.word 0xcc2a0009  ! 3471: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xee520009  ! 3471: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xc2fa1009  ! 3471: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 3474: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd6420009  ! 3474: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xc89a1009  ! 3474: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc33a0009  ! 3477: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc8120009  ! 3477: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xa8d20009  ! 3477: UMULcc_R	umulcc 	%r8, %r9, %r20
	.word 0xca2a0009  ! 3480: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc7020009  ! 3480: LDF_R	ld	[%r8, %r9], %f3
	.word 0xcbe22009  ! 3480: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xda320009  ! 3483: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xca120009  ! 3483: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcaaa224c  ! 3483: STBA_I	stba	%r5, [%r8 + 0x024c] %asi
	.word 0xc4320009  ! 3486: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc25a0009  ! 3486: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x02c20001  ! 3486: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xd62a0009  ! 3489: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xce0a0009  ! 3489: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xbc6a0009  ! 3489: UDIVX_R	udivx 	%r8, %r9, %r30
	.word 0xc7220009  ! 3492: STF_R	st	%f3, [%r9, %r8]
	.word 0xd6520009  ! 3492: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xc8aa1009  ! 3492: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 3495: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6120009  ! 3495: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xce6a0009  ! 3495: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xcf3a0009  ! 3498: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfa4a0009  ! 3498: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xc4ca2bec  ! 3498: LDSBA_I	ldsba	[%r8, + 0x0bec] %asi, %r2
	.word 0xce220009  ! 3501: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 3501: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3501: STBAR	stbar
	.word 0xc6320009  ! 3504: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 3504: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xdada2108  ! 3504: LDXA_I	ldxa	[%r8, + 0x0108] %asi, %r13
	.word 0xca720009  ! 3507: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd6520009  ! 3507: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xc44a240c  ! 3507: LDSB_I	ldsb	[%r8 + 0x040c], %r2
	.word 0xd6320009  ! 3510: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xdc1a0009  ! 3510: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x30800001  ! 3510: BA	ba,a	<label_0x1>
	.word 0xe0320009  ! 3513: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xdc4a0009  ! 3513: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0x26c20001  ! 3513: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc6320009  ! 3516: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc3020009  ! 3516: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3ea27cc  ! 3516: PREFETCHA_I	prefetcha	[%r8, + 0x07cc] %asi, #one_read
	.word 0xe4320009  ! 3519: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc6020009  ! 3519: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x867a0009  ! 3519: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xda2a0009  ! 3522: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xca020009  ! 3522: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xe8ba2158  ! 3522: STDA_I	stda	%r20, [%r8 + 0x0158] %asi
	.word 0xc4720009  ! 3525: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc2120009  ! 3525: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xa44a0009  ! 3525: MULX_R	mulx 	%r8, %r9, %r18
	.word 0xed220009  ! 3528: STF_R	st	%f22, [%r9, %r8]
	.word 0xc2020009  ! 3528: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8143e055  ! 3528: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc4320009  ! 3531: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca420009  ! 3531: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x26800001  ! 3531: BL	bl,a	<label_0x1>
	.word 0xfe720009  ! 3534: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xce020009  ! 3534: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 3534: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 3537: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf8120009  ! 3537: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xfd3a2320  ! 3537: STDF_I	std	%f30, [0x0320, %r8]
	.word 0xc42a0009  ! 3540: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca4a0009  ! 3540: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xfbf21009  ! 3540: CASXA_I	casxa	[%r8] 0x80, %r9, %r29
	.word 0xc8320009  ! 3543: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcf020009  ! 3543: LDF_R	ld	[%r8, %r9], %f7
	.word 0x28800001  ! 3543: BLEU	bleu,a	<label_0x1>
	.word 0xc73a0009  ! 3546: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc1a0009  ! 3546: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc2c21009  ! 3546: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xfc220009  ! 3549: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc8420009  ! 3549: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xdd3a0009  ! 3549: STDF_R	std	%f14, [%r9, %r8]
	.word 0xc53a0009  ! 3552: STDF_R	std	%f2, [%r9, %r8]
	.word 0xde120009  ! 3552: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc7e22009  ! 3552: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xc2220009  ! 3555: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf81a0009  ! 3555: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x8143c000  ! 3555: STBAR	stbar
	.word 0xea320009  ! 3558: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xce020009  ! 3558: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc36a2f8c  ! 3558: PREFETCH_I	prefetch	[%r8 + 0x0f8c], #one_read
	.word 0xcc720009  ! 3561: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf4420009  ! 3561: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xb0722f68  ! 3561: UDIV_I	udiv 	%r8, 0x0f68, %r24
	.word 0xcd220009  ! 3564: STF_R	st	%f6, [%r9, %r8]
	.word 0xda5a0009  ! 3564: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xc36a0009  ! 3564: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe82a0009  ! 3567: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xed020009  ! 3567: LDF_R	ld	[%r8, %r9], %f22
	.word 0xc2aa2aac  ! 3567: STBA_I	stba	%r1, [%r8 + 0x0aac] %asi
	.word 0xca320009  ! 3570: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe6520009  ! 3570: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xeab21009  ! 3570: STHA_R	stha	%r21, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 3573: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xdb020009  ! 3573: LDF_R	ld	[%r8, %r9], %f13
	.word 0xbba209a9  ! 3573: FDIVs	fdivs	%f8, %f9, %f29
	.word 0xc6320009  ! 3576: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 3576: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143e06f  ! 3576: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc2320009  ! 3579: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 3579: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8a5a2b44  ! 3579: SMUL_I	smul 	%r8, 0x0b44, %r5
	.word 0xf6720009  ! 3582: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xca0a0009  ! 3582: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xcaaa28bc  ! 3582: STBA_I	stba	%r5, [%r8 + 0x08bc] %asi
	.word 0xc42a0009  ! 3585: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc2020009  ! 3585: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xb96a274c  ! 3585: SDIVX_I	sdivx	%r8, 0x074c, %r28
	.word 0xf93a0009  ! 3588: STDF_R	std	%f28, [%r9, %r8]
	.word 0xca420009  ! 3588: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x0c800001  ! 3588: BNEG	bneg  	<label_0x1>
	.word 0xce220009  ! 3591: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 3591: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143e07e  ! 3591: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc53a0009  ! 3594: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc91a0009  ! 3594: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcab21009  ! 3594: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 3597: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc0a0009  ! 3597: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x0e800002  ! 3597: BVS	bvs  	<label_0x2>
	.word 0xd9220009  ! 3600: STF_R	st	%f12, [%r9, %r8]
	.word 0xce5a0009  ! 3600: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea22f8  ! 3600: PREFETCHA_I	prefetcha	[%r8, + 0x02f8] %asi, #one_read
	.word 0xc2720009  ! 3603: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 3603: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xdde21009  ! 3603: CASA_I	casa	[%r8] 0x80, %r9, %r14
	.word 0xce320009  ! 3606: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcb1a0009  ! 3606: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc49226f4  ! 3606: LDUHA_I	lduha	[%r8, + 0x06f4] %asi, %r2
	.word 0xc6220009  ! 3609: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc4a0009  ! 3609: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xccca1009  ! 3609: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xec2a0009  ! 3612: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc8120009  ! 3612: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x99a20829  ! 3612: FADDs	fadds	%f8, %f9, %f12
	.word 0xcc2a0009  ! 3615: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 3615: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143c000  ! 3615: STBAR	stbar
	.word 0xcf3a0009  ! 3618: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf6020009  ! 3618: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xe0ba2978  ! 3618: STDA_I	stda	%r16, [%r8 + 0x0978] %asi
	.word 0xdb220009  ! 3621: STF_R	st	%f13, [%r9, %r8]
	.word 0xcc120009  ! 3621: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143e048  ! 3621: MEMBAR	membar	#StoreStore | #Sync 
	.word 0xc93a0009  ! 3624: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2020009  ! 3624: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc3ea2b78  ! 3624: PREFETCHA_I	prefetcha	[%r8, + 0x0b78] %asi, #one_read
	.word 0xf4320009  ! 3627: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xfa4a0009  ! 3627: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xc8da2518  ! 3627: LDXA_I	ldxa	[%r8, + 0x0518] %asi, %r4
	.word 0xc33a0009  ! 3630: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf65a0009  ! 3630: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xc3ea2b84  ! 3630: PREFETCHA_I	prefetcha	[%r8, + 0x0b84] %asi, #one_read
	.word 0xc6320009  ! 3633: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 3633: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8da20929  ! 3633: FMULs	fmuls	%f8, %f9, %f6
	.word 0xf5220009  ! 3636: STF_R	st	%f26, [%r9, %r8]
	.word 0xce4a0009  ! 3636: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a2fcc  ! 3636: PREFETCH_I	prefetch	[%r8 + 0x0fcc], #one_read
	.word 0xce720009  ! 3639: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 3639: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8b222058  ! 3639: MULScc_I	mulscc 	%r8, 0x0058, %r5
	.word 0xce720009  ! 3642: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc81a0009  ! 3642: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xfb1a2548  ! 3642: LDDF_I	ldd	[%r8, 0x0548], %f29
	.word 0xc6720009  ! 3645: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 3645: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x85a209a9  ! 3645: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc9220009  ! 3648: STF_R	st	%f4, [%r9, %r8]
	.word 0xda4a0009  ! 3648: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x8c4a2228  ! 3648: MULX_I	mulx 	%r8, 0x0228, %r6
	.word 0xe33a0009  ! 3651: STDF_R	std	%f17, [%r9, %r8]
	.word 0xec1a0009  ! 3651: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xaba208a9  ! 3651: FSUBs	fsubs	%f8, %f9, %f21
	.word 0xc5220009  ! 3654: STF_R	st	%f2, [%r9, %r8]
	.word 0xfa520009  ! 3654: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc4ca28e4  ! 3654: LDSBA_I	ldsba	[%r8, + 0x08e4] %asi, %r2
	.word 0xc8220009  ! 3657: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe51a0009  ! 3657: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0xc8b21009  ! 3657: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 3660: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc71a0009  ! 3660: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc36a0009  ! 3660: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce720009  ! 3663: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 3663: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xecf21009  ! 3663: STXA_R	stxa	%r22, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 3666: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc2520009  ! 3666: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc33a2100  ! 3666: STDF_I	std	%f1, [0x0100, %r8]
	.word 0xca220009  ! 3669: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce120009  ! 3669: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcc1a2750  ! 3669: LDD_I	ldd	[%r8 + 0x0750], %r6
	.word 0xcd3a0009  ! 3672: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6420009  ! 3672: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea245c  ! 3672: PREFETCHA_I	prefetcha	[%r8, + 0x045c] %asi, #one_read
	.word 0xcb220009  ! 3675: STF_R	st	%f5, [%r9, %r8]
	.word 0xc91a0009  ! 3675: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc2a2290c  ! 3675: STWA_I	stwa	%r1, [%r8 + 0x090c] %asi
	.word 0xcc2a0009  ! 3678: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc41a0009  ! 3678: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3678: STBAR	stbar
	.word 0xcd3a0009  ! 3681: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc64a0009  ! 3681: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xceda1009  ! 3681: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xce320009  ! 3684: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 3684: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xf6c22f58  ! 3684: LDSWA_I	ldswa	[%r8, + 0x0f58] %asi, %r27
	.word 0xcf220009  ! 3687: STF_R	st	%f7, [%r9, %r8]
	.word 0xc6420009  ! 3687: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc87a0009  ! 3687: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xe5220009  ! 3690: STF_R	st	%f18, [%r9, %r8]
	.word 0xc01a0009  ! 3690: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc4ca2794  ! 3690: LDSBA_I	ldsba	[%r8, + 0x0794] %asi, %r2
	.word 0xcc2a0009  ! 3693: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 3693: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xda7a0009  ! 3693: SWAP_R	swap	%r13, [%r8 + %r9]
	.word 0xc3220009  ! 3696: STF_R	st	%f1, [%r9, %r8]
	.word 0xfc5a0009  ! 3696: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xc36a0009  ! 3696: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2320009  ! 3699: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd81a0009  ! 3699: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xceda1009  ! 3699: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xcb3a0009  ! 3702: STDF_R	std	%f5, [%r9, %r8]
	.word 0xff1a0009  ! 3702: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xc3ea2a10  ! 3702: PREFETCHA_I	prefetcha	[%r8, + 0x0a10] %asi, #one_read
	.word 0xcd220009  ! 3705: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc520009  ! 3705: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc68a2da4  ! 3705: LDUBA_I	lduba	[%r8, + 0x0da4] %asi, %r3
	.word 0xc2320009  ! 3708: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd6420009  ! 3708: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xe6822208  ! 3708: LDUWA_I	lduwa	[%r8, + 0x0208] %asi, %r19
	.word 0xce720009  ! 3711: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 3711: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcca21009  ! 3711: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xf4220009  ! 3714: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xce120009  ! 3714: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xccba2608  ! 3714: STDA_I	stda	%r6, [%r8 + 0x0608] %asi
	.word 0xf0320009  ! 3717: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xca0a0009  ! 3717: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x87a20929  ! 3717: FMULs	fmuls	%f8, %f9, %f3
	.word 0xe8220009  ! 3720: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc6520009  ! 3720: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xce8a2fb4  ! 3720: LDUBA_I	lduba	[%r8, + 0x0fb4] %asi, %r7
	.word 0xc2220009  ! 3723: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe80a0009  ! 3723: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0x85a208a9  ! 3723: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc5220009  ! 3726: STF_R	st	%f2, [%r9, %r8]
	.word 0xf31a0009  ! 3726: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x856a0009  ! 3726: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xcb220009  ! 3729: STF_R	st	%f5, [%r9, %r8]
	.word 0xc2520009  ! 3729: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc36a2be4  ! 3729: PREFETCH_I	prefetch	[%r8 + 0x0be4], #one_read
	.word 0xea220009  ! 3732: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xf81a0009  ! 3732: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc6020009  ! 3732: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xfd3a0009  ! 3735: STDF_R	std	%f30, [%r9, %r8]
	.word 0xcc020009  ! 3735: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 3735: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xee720009  ! 3738: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xc64a0009  ! 3738: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x30800002  ! 3738: BA	ba,a	<label_0x2>
	.word 0xff220009  ! 3741: STF_R	st	%f31, [%r9, %r8]
	.word 0xea4a0009  ! 3741: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xc0ba2100  ! 3741: STDA_I	stda	%r0, [%r8 + 0x0100] %asi
	.word 0xcf3a0009  ! 3744: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc6520009  ! 3744: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc6da1009  ! 3744: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xee220009  ! 3747: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc6420009  ! 3747: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xfd2229ac  ! 3747: STF_I	st	%f30, [0x09ac, %r8]
	.word 0xca2a0009  ! 3750: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc4a0009  ! 3750: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc4a22670  ! 3750: STWA_I	stwa	%r2, [%r8 + 0x0670] %asi
	.word 0xc3220009  ! 3753: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc0a0009  ! 3753: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xf8922b00  ! 3753: LDUHA_I	lduha	[%r8, + 0x0b00] %asi, %r28
	.word 0xe3220009  ! 3756: STF_R	st	%f17, [%r9, %r8]
	.word 0xfc020009  ! 3756: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0x86d20009  ! 3756: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xf4220009  ! 3759: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xe05a0009  ! 3759: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xcc020009  ! 3759: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcd3a0009  ! 3762: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce520009  ! 3762: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xba522e1c  ! 3762: UMUL_I	umul 	%r8, 0x0e1c, %r29
	.word 0xf2320009  ! 3765: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc65a0009  ! 3765: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc4da2140  ! 3765: LDXA_I	ldxa	[%r8, + 0x0140] %asi, %r2
	.word 0xc5220009  ! 3768: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6520009  ! 3768: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc36a2020  ! 3768: PREFETCH_I	prefetch	[%r8 + 0x0020], #one_read
	.word 0xc33a0009  ! 3771: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc5020009  ! 3771: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143e071  ! 3771: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xe93a0009  ! 3774: STDF_R	std	%f20, [%r9, %r8]
	.word 0xf41a0009  ! 3774: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0x3e800001  ! 3774: BVC	bvc,a	<label_0x1>
	.word 0xc4220009  ! 3777: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc25a0009  ! 3777: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc36a2b3c  ! 3777: PREFETCH_I	prefetch	[%r8 + 0x0b3c], #one_read
	.word 0xc8320009  ! 3780: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xec120009  ! 3780: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xae720009  ! 3780: UDIV_R	udiv 	%r8, %r9, %r23
	.word 0xc4320009  ! 3783: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc65a0009  ! 3783: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x06ca0001  ! 3783: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc8720009  ! 3786: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc25a0009  ! 3786: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc09a2140  ! 3786: LDDA_I	ldda	[%r8, + 0x0140] %asi, %r0
	.word 0xca320009  ! 3789: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 3789: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc53a2ee8  ! 3789: STDF_I	std	%f2, [0x0ee8, %r8]
	.word 0xc93a0009  ! 3792: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca520009  ! 3792: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xf8ca1009  ! 3792: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r28
	.word 0xf2720009  ! 3795: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc2020009  ! 3795: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc3ea2cc0  ! 3795: PREFETCHA_I	prefetcha	[%r8, + 0x0cc0] %asi, #one_read
	.word 0xe0320009  ! 3798: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc8420009  ! 3798: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcaaa1009  ! 3798: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 3801: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe60a0009  ! 3801: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x8143e02d  ! 3801: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc4320009  ! 3804: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc2520009  ! 3804: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xdea22a10  ! 3804: STWA_I	stwa	%r15, [%r8 + 0x0a10] %asi
	.word 0xde220009  ! 3807: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xf0020009  ! 3807: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xe0aa1009  ! 3807: STBA_R	stba	%r16, [%r8 + %r9] 0x80
	.word 0xe8320009  ! 3810: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xe40a0009  ! 3810: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xceea1009  ! 3810: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc7220009  ! 3813: STF_R	st	%f3, [%r9, %r8]
	.word 0xd8520009  ! 3813: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xeada1009  ! 3813: LDXA_R	ldxa	[%r8, %r9] 0x80, %r21
	.word 0xeb220009  ! 3816: STF_R	st	%f21, [%r9, %r8]
	.word 0xc9020009  ! 3816: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8f6a2a38  ! 3816: SDIVX_I	sdivx	%r8, 0x0a38, %r7
	.word 0xc6320009  ! 3819: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe4420009  ! 3819: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc3f22009  ! 3819: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xc73a0009  ! 3822: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf2520009  ! 3822: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x82520009  ! 3822: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xd62a0009  ! 3825: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xcc1a0009  ! 3825: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x85a209a9  ! 3825: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc22a0009  ! 3828: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 3828: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc4f21009  ! 3828: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 3831: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4520009  ! 3831: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3831: STBAR	stbar
	.word 0xf2220009  ! 3834: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xcc420009  ! 3834: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x1a800002  ! 3834: BCC	bcc  	<label_0x2>
	.word 0xfc320009  ! 3837: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc8520009  ! 3837: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x06c20001  ! 3837: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc5220009  ! 3840: STF_R	st	%f2, [%r9, %r8]
	.word 0xe8120009  ! 3840: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xafa20929  ! 3840: FMULs	fmuls	%f8, %f9, %f23
	.word 0xc2720009  ! 3843: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xed1a0009  ! 3843: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0x885a2c28  ! 3843: SMUL_I	smul 	%r8, 0x0c28, %r4
	.word 0xf9220009  ! 3846: STF_R	st	%f28, [%r9, %r8]
	.word 0xc8120009  ! 3846: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc53a2238  ! 3846: STDF_I	std	%f2, [0x0238, %r8]
	.word 0xca320009  ! 3849: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 3849: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc60a0009  ! 3849: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xf5220009  ! 3852: STF_R	st	%f26, [%r9, %r8]
	.word 0xe9020009  ! 3852: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc3ea1009  ! 3852: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc42a0009  ! 3855: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 3855: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xab220009  ! 3855: MULScc_R	mulscc 	%r8, %r9, %r21
	.word 0xc9220009  ! 3858: STF_R	st	%f4, [%r9, %r8]
	.word 0xca4a0009  ! 3858: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xceb21009  ! 3858: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xdc320009  ! 3861: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xcc020009  ! 3861: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc8822b70  ! 3861: LDUWA_I	lduwa	[%r8, + 0x0b70] %asi, %r4
	.word 0xca720009  ! 3864: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc020009  ! 3864: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x86720009  ! 3864: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xca220009  ! 3867: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 3867: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcada1009  ! 3867: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xc22a0009  ! 3870: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 3870: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc8ba2b38  ! 3870: STDA_I	stda	%r4, [%r8 + 0x0b38] %asi
	.word 0xe0720009  ! 3873: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc4520009  ! 3873: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x2cc20001  ! 3873: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc2320009  ! 3876: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca420009  ! 3876: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xfcf21009  ! 3876: STXA_R	stxa	%r30, [%r8 + %r9] 0x80
	.word 0xd6320009  ! 3879: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xf0420009  ! 3879: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0x84da0009  ! 3879: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xce220009  ! 3882: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcf020009  ! 3882: LDF_R	ld	[%r8, %r9], %f7
	.word 0x9a7a27e0  ! 3882: SDIV_I	sdiv 	%r8, 0x07e0, %r13
	.word 0xf8220009  ! 3885: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xec020009  ! 3885: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xcbf22009  ! 3885: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xc4220009  ! 3888: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe60a0009  ! 3888: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x8143e017  ! 3888: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc6320009  ! 3891: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd84a0009  ! 3891: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xdc1a0009  ! 3891: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xcb3a0009  ! 3894: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce5a0009  ! 3894: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcbe22009  ! 3894: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xc42a0009  ! 3897: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe8420009  ! 3897: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xc84a26f8  ! 3897: LDSB_I	ldsb	[%r8 + 0x06f8], %r4
	.word 0xc9220009  ! 3900: STF_R	st	%f4, [%r9, %r8]
	.word 0xc41a0009  ! 3900: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc2f21009  ! 3900: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xfa320009  ! 3903: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc6520009  ! 3903: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143e01a  ! 3903: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xc6720009  ! 3906: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xee420009  ! 3906: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0x8143c000  ! 3906: STBAR	stbar
	.word 0xd6220009  ! 3909: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xda0a0009  ! 3909: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0x84520009  ! 3909: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc2720009  ! 3912: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 3912: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc8fa1009  ! 3912: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 3915: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce120009  ! 3915: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc6ea1009  ! 3915: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 3918: STF_R	st	%f6, [%r9, %r8]
	.word 0xf3020009  ! 3918: LDF_R	ld	[%r8, %r9], %f25
	.word 0xd8aa29cc  ! 3918: STBA_I	stba	%r12, [%r8 + 0x09cc] %asi
	.word 0xda320009  ! 3921: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xf6120009  ! 3921: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xc8b22f28  ! 3921: STHA_I	stha	%r4, [%r8 + 0x0f28] %asi
	.word 0xf8320009  ! 3924: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xcf1a0009  ! 3924: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xcc6a2ca0  ! 3924: LDSTUB_I	ldstub	%r6, [%r8 + 0x0ca0]
	.word 0xc4720009  ! 3927: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc40a0009  ! 3927: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xb86a0009  ! 3927: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0xcc2a0009  ! 3930: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 3930: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xada20829  ! 3930: FADDs	fadds	%f8, %f9, %f22
	.word 0xd8320009  ! 3933: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xfa0a0009  ! 3933: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xc3ea20d0  ! 3933: PREFETCHA_I	prefetcha	[%r8, + 0x00d0] %asi, #one_read
	.word 0xc82a0009  ! 3936: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc5020009  ! 3936: LDF_R	ld	[%r8, %r9], %f2
	.word 0xce8a2278  ! 3936: LDUBA_I	lduba	[%r8, + 0x0278] %asi, %r7
	.word 0xe3220009  ! 3939: STF_R	st	%f17, [%r9, %r8]
	.word 0xce120009  ! 3939: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xb8d228c0  ! 3939: UMULcc_I	umulcc 	%r8, 0x08c0, %r28
	.word 0xc8220009  ! 3942: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 3942: LDF_R	ld	[%r8, %r9], %f6
	.word 0xf4520009  ! 3942: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xcc2a0009  ! 3945: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf91a0009  ! 3945: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x26ca0001  ! 3945: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xc9220009  ! 3948: STF_R	st	%f4, [%r9, %r8]
	.word 0xf31a0009  ! 3948: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x87220009  ! 3948: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xff3a0009  ! 3951: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc8120009  ! 3951: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc64a2618  ! 3951: LDSB_I	ldsb	[%r8 + 0x0618], %r3
	.word 0xf4220009  ! 3954: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xf2520009  ! 3954: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xa8720009  ! 3954: UDIV_R	udiv 	%r8, %r9, %r20
	.word 0xcc720009  ! 3957: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf05a0009  ! 3957: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xcc8a2f1c  ! 3957: LDUBA_I	lduba	[%r8, + 0x0f1c] %asi, %r6
	.word 0xce220009  ! 3960: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc5a0009  ! 3960: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143e06a  ! 3960: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xcc720009  ! 3963: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf4020009  ! 3963: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xc6b21009  ! 3963: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 3966: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6520009  ! 3966: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8d220009  ! 3966: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc42a0009  ! 3969: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xdc1a0009  ! 3969: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x98f20009  ! 3969: UDIVcc_R	udivcc 	%r8, %r9, %r12
	.word 0xda720009  ! 3972: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc8020009  ! 3972: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x89220009  ! 3972: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc8320009  ! 3975: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xec4a0009  ! 3975: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xf8b21009  ! 3975: STHA_R	stha	%r28, [%r8 + %r9] 0x80
	.word 0xca220009  ! 3978: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca420009  ! 3978: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x85a208a9  ! 3978: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xcc720009  ! 3981: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce420009  ! 3981: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x26ca0001  ! 3981: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xc82a0009  ! 3984: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca420009  ! 3984: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xe89a2700  ! 3984: LDDA_I	ldda	[%r8, + 0x0700] %asi, %r20
	.word 0xee220009  ! 3987: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc6020009  ! 3987: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc8a22c88  ! 3987: STWA_I	stwa	%r4, [%r8 + 0x0c88] %asi
	.word 0xca220009  ! 3990: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xfa520009  ! 3990: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xce520009  ! 3990: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xf53a0009  ! 3993: STDF_R	std	%f26, [%r9, %r8]
	.word 0xcc1a0009  ! 3993: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8fa20929  ! 3993: FMULs	fmuls	%f8, %f9, %f7
	.word 0xcc720009  ! 3996: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 3996: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x84da0009  ! 3996: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xe4720009  ! 3999: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xca420009  ! 3999: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3ea2530  ! 3999: PREFETCHA_I	prefetcha	[%r8, + 0x0530] %asi, #one_read
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000190, %g1, %r9
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
        setx  0x115b0098157ff7fe, %g1, %r0
        setx  0xc8b07de733822de4, %g1, %r1
        setx  0x2327dc83b2b026b2, %g1, %r2
        setx  0xd098c1b50de6cab8, %g1, %r3
        setx  0x5dab43227c79a0fa, %g1, %r4
        setx  0x4f2459fd98ed83ef, %g1, %r5
        setx  0x4eb68f61d0776678, %g1, %r6
        setx  0x8fc0903a86db2199, %g1, %r7
        setx  0x9b77c7fbe0e7a76f, %g1, %r10
        setx  0x48cb7016644f44f1, %g1, %r11
        setx  0x3bd862634611a50d, %g1, %r12
        setx  0xa0e5dc3cc8f0d4c3, %g1, %r13
        setx  0x9754f46fc7434946, %g1, %r14
        setx  0x4960b36c6c425cd1, %g1, %r15
        setx  0x76fdef084afce78d, %g1, %r16
        setx  0x7023583c9f876a0e, %g1, %r17
        setx  0x5d597816fb0b54e6, %g1, %r18
        setx  0x11d461644c6a8a44, %g1, %r19
        setx  0xcabea804502c7bd2, %g1, %r20
        setx  0x5d454e4437951a79, %g1, %r21
        setx  0xcae97248c8f64719, %g1, %r22
        setx  0xc42c6218caa3647e, %g1, %r23
        setx  0x1a29cf3e3a349577, %g1, %r24
        setx  0xa7eabde8e9d5f36c, %g1, %r25
        setx  0x135af54cb25e018c, %g1, %r26
        setx  0x56c4f3f50fc7d7c5, %g1, %r27
        setx  0xd6d409440e34b484, %g1, %r28
        setx  0xe30c241e0b14ce32, %g1, %r29
        setx  0x494cea00c93f140e, %g1, %r30
        setx  0x85bc61f4c1c4373f, %g1, %r31
	.word 0xea720009  ! 3: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xf84a0009  ! 3: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x0ec20001  ! 3: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xc4320009  ! 6: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce0a0009  ! 6: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8143c000  ! 6: STBAR	stbar
	.word 0xc33a0009  ! 9: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcd020009  ! 9: LDF_R	ld	[%r8, %r9], %f6
	.word 0x0a800001  ! 9: BCS	bcs  	<label_0x1>
	.word 0xc8320009  ! 12: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc84a0009  ! 12: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8e5a2874  ! 12: SMUL_I	smul 	%r8, 0x0874, %r7
	.word 0xc4720009  ! 15: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe7020009  ! 15: LDF_R	ld	[%r8, %r9], %f19
	.word 0xc3ea27d0  ! 15: PREFETCHA_I	prefetcha	[%r8, + 0x07d0] %asi, #one_read
	.word 0xc8220009  ! 18: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfe420009  ! 18: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x0a800002  ! 18: BCS	bcs  	<label_0x2>
	.word 0xc93a0009  ! 21: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc65a0009  ! 21: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 21: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe4220009  ! 24: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc91a0009  ! 24: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x26800001  ! 24: BL	bl,a	<label_0x1>
	.word 0xca2a0009  ! 27: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf44a0009  ! 27: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xc45a2eb0  ! 27: LDX_I	ldx	[%r8 + 0x0eb0], %r2
	.word 0xc93a0009  ! 30: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc84a0009  ! 30: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8ba20829  ! 30: FADDs	fadds	%f8, %f9, %f5
	.word 0xc73a0009  ! 33: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc81a0009  ! 33: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcaca1009  ! 33: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xe6720009  ! 36: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xd65a0009  ! 36: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc4aa1009  ! 36: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 39: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8520009  ! 39: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc3ea2314  ! 39: PREFETCHA_I	prefetcha	[%r8, + 0x0314] %asi, #one_read
	.word 0xc73a0009  ! 42: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc7020009  ! 42: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e019  ! 42: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xc8320009  ! 45: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc44a0009  ! 45: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a2c9c  ! 45: PREFETCH_I	prefetch	[%r8 + 0x0c9c], #one_read
	.word 0xc33a0009  ! 48: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc85a0009  ! 48: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x896a0009  ! 48: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xdd3a0009  ! 51: STDF_R	std	%f14, [%r9, %r8]
	.word 0xc2020009  ! 51: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x88520009  ! 51: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xca720009  ! 54: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 54: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 54: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf3a0009  ! 57: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc4520009  ! 57: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8da20929  ! 57: FMULs	fmuls	%f8, %f9, %f6
	.word 0xe3220009  ! 60: STF_R	st	%f17, [%r9, %r8]
	.word 0xc81a0009  ! 60: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8efa0009  ! 60: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xf0320009  ! 63: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xcf020009  ! 63: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc3ea2080  ! 63: PREFETCHA_I	prefetcha	[%r8, + 0x0080] %asi, #one_read
	.word 0xfa2a0009  ! 66: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xca0a0009  ! 66: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xceda21c0  ! 66: LDXA_I	ldxa	[%r8, + 0x01c0] %asi, %r7
	.word 0xea220009  ! 69: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc80a0009  ! 69: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143c000  ! 69: STBAR	stbar
	.word 0xc2320009  ! 72: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 72: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x26800002  ! 72: BL	bl,a	<label_0x2>
	.word 0xce320009  ! 75: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce5a0009  ! 75: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xa3220009  ! 75: MULScc_R	mulscc 	%r8, %r9, %r17
	.word 0xc22a0009  ! 78: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 78: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc24226d4  ! 78: LDSW_I	ldsw	[%r8 + 0x06d4], %r1
	.word 0xcc220009  ! 81: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xdc5a0009  ! 81: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0x8143c000  ! 81: STBAR	stbar
	.word 0xc6720009  ! 84: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xde120009  ! 84: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc33a2718  ! 84: STDF_I	std	%f1, [0x0718, %r8]
	.word 0xdf220009  ! 87: STF_R	st	%f15, [%r9, %r8]
	.word 0xc3020009  ! 87: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e04a  ! 87: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xf6320009  ! 90: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xfc120009  ! 90: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xcbe21009  ! 90: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xea2a0009  ! 93: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xca5a0009  ! 93: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc6420009  ! 93: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xca320009  ! 96: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfb020009  ! 96: LDF_R	ld	[%r8, %r9], %f29
	.word 0xd8aa1009  ! 96: STBA_R	stba	%r12, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 99: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc0a0009  ! 99: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x2cc20001  ! 99: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xca2a0009  ! 102: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xdd1a0009  ! 102: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xcaf21009  ! 102: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 105: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc6120009  ! 105: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xbda208a9  ! 105: FSUBs	fsubs	%f8, %f9, %f30
	.word 0xea2a0009  ! 108: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xfb1a0009  ! 108: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xdcba1009  ! 108: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 111: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xee5a0009  ! 111: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xccda1009  ! 111: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xc6220009  ! 114: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xec0a0009  ! 114: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xc36a2608  ! 114: PREFETCH_I	prefetch	[%r8 + 0x0608], #one_read
	.word 0xdf220009  ! 117: STF_R	st	%f15, [%r9, %r8]
	.word 0xc9020009  ! 117: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcaca1009  ! 117: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc4720009  ! 120: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4020009  ! 120: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xe4020009  ! 120: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xe1220009  ! 123: STF_R	st	%f16, [%r9, %r8]
	.word 0xc41a0009  ! 123: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 123: STBAR	stbar
	.word 0xc2320009  ! 126: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc120009  ! 126: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xccda2a30  ! 126: LDXA_I	ldxa	[%r8, + 0x0a30] %asi, %r6
	.word 0xc8220009  ! 129: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc01a0009  ! 129: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8eda2a28  ! 129: SMULcc_I	smulcc 	%r8, 0x0a28, %r7
	.word 0xcc320009  ! 132: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 132: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143e000  ! 132: MEMBAR	membar	
	.word 0xcb220009  ! 135: STF_R	st	%f5, [%r9, %r8]
	.word 0xf4120009  ! 135: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xc2522998  ! 135: LDSH_I	ldsh	[%r8 + 0x0998], %r1
	.word 0xcd3a0009  ! 138: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf81a0009  ! 138: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc3ea2e18  ! 138: PREFETCHA_I	prefetcha	[%r8, + 0x0e18] %asi, #one_read
	.word 0xc2720009  ! 141: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc5020009  ! 141: LDF_R	ld	[%r8, %r9], %f2
	.word 0x2e800001  ! 141: BVS	bvs,a	<label_0x1>
	.word 0xc6220009  ! 144: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xeb020009  ! 144: LDF_R	ld	[%r8, %r9], %f21
	.word 0xccfa1009  ! 144: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 147: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xdc1a0009  ! 147: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x8a6a259c  ! 147: UDIVX_I	udivx 	%r8, 0x059c, %r5
	.word 0xc73a0009  ! 150: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc64a0009  ! 150: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143e038  ! 150: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xc73a0009  ! 153: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc8420009  ! 153: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143e04c  ! 153: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xcd3a0009  ! 156: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe0520009  ! 156: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x8143c000  ! 156: STBAR	stbar
	.word 0xcb220009  ! 159: STF_R	st	%f5, [%r9, %r8]
	.word 0xc91a0009  ! 159: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc25a0009  ! 159: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xca320009  ! 162: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 162: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xefe21009  ! 162: CASA_I	casa	[%r8] 0x80, %r9, %r23
	.word 0xca320009  ! 165: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce020009  ! 165: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc4da2558  ! 165: LDXA_I	ldxa	[%r8, + 0x0558] %asi, %r2
	.word 0xff220009  ! 168: STF_R	st	%f31, [%r9, %r8]
	.word 0xc5020009  ! 168: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143c000  ! 168: STBAR	stbar
	.word 0xec2a0009  ! 171: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc81a0009  ! 171: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcec21009  ! 171: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r7
	.word 0xed220009  ! 174: STF_R	st	%f22, [%r9, %r8]
	.word 0xca5a0009  ! 174: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x08800001  ! 174: BLEU	bleu  	<label_0x1>
	.word 0xce720009  ! 177: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc7020009  ! 177: LDF_R	ld	[%r8, %r9], %f3
	.word 0xcf1a0009  ! 177: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc8320009  ! 180: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 180: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xa9222c04  ! 180: MULScc_I	mulscc 	%r8, 0x0c04, %r20
	.word 0xc2320009  ! 183: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc6120009  ! 183: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc2520009  ! 183: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc8720009  ! 186: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe71a0009  ! 186: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xa3a208a9  ! 186: FSUBs	fsubs	%f8, %f9, %f17
	.word 0xde2a0009  ! 189: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc2520009  ! 189: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 189: STBAR	stbar
	.word 0xc2320009  ! 192: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf5020009  ! 192: LDF_R	ld	[%r8, %r9], %f26
	.word 0xc27a0009  ! 192: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xce220009  ! 195: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce120009  ! 195: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x02800002  ! 195: BE	be  	<label_0x2>
	.word 0xf8320009  ! 198: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc24a0009  ! 198: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc67a0009  ! 198: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc4320009  ! 201: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 201: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8eda0009  ! 201: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xce320009  ! 204: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf2520009  ! 204: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x06ca0001  ! 204: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xcf220009  ! 207: STF_R	st	%f7, [%r9, %r8]
	.word 0xc6120009  ! 207: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x10800001  ! 207: BA	ba  	<label_0x1>
	.word 0xe4220009  ! 210: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xcb1a0009  ! 210: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc6a21009  ! 210: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 213: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 213: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 213: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2220009  ! 216: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 216: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x9a7a0009  ! 216: SDIV_R	sdiv 	%r8, %r9, %r13
	.word 0xe6320009  ! 219: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xeb1a0009  ! 219: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0x8143c000  ! 219: STBAR	stbar
	.word 0xe5220009  ! 222: STF_R	st	%f18, [%r9, %r8]
	.word 0xce5a0009  ! 222: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xe3020009  ! 222: LDF_R	ld	[%r8, %r9], %f17
	.word 0xc6720009  ! 225: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca020009  ! 225: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x82722e6c  ! 225: UDIV_I	udiv 	%r8, 0x0e6c, %r1
	.word 0xc33a0009  ! 228: STDF_R	std	%f1, [%r9, %r8]
	.word 0xca5a0009  ! 228: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc53a2788  ! 228: STDF_I	std	%f2, [0x0788, %r8]
	.word 0xc6220009  ! 231: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc20a0009  ! 231: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x896a0009  ! 231: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xce320009  ! 234: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xfc5a0009  ! 234: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xcc822e2c  ! 234: LDUWA_I	lduwa	[%r8, + 0x0e2c] %asi, %r6
	.word 0xc42a0009  ! 237: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 237: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143e030  ! 237: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xc2220009  ! 240: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc24a0009  ! 240: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3ea20b8  ! 240: PREFETCHA_I	prefetcha	[%r8, + 0x00b8] %asi, #one_read
	.word 0xc22a0009  ! 243: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 243: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea2d20  ! 243: PREFETCHA_I	prefetcha	[%r8, + 0x0d20] %asi, #one_read
	.word 0xf2320009  ! 246: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xfa020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xc24a2b98  ! 246: LDSB_I	ldsb	[%r8 + 0x0b98], %r1
	.word 0xc22a0009  ! 249: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 249: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x83222dec  ! 249: MULScc_I	mulscc 	%r8, 0x0dec, %r1
	.word 0xe4720009  ! 252: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xe84a0009  ! 252: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xb5a20829  ! 252: FADDs	fadds	%f8, %f9, %f26
	.word 0xc42a0009  ! 255: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc64a0009  ! 255: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143e05c  ! 255: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xc2720009  ! 258: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe24a0009  ! 258: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xc20a0009  ! 258: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcd3a0009  ! 261: STDF_R	std	%f6, [%r9, %r8]
	.word 0xea520009  ! 261: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xcc0a27f0  ! 261: LDUB_I	ldub	[%r8 + 0x07f0], %r6
	.word 0xf0320009  ! 264: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xcc5a0009  ! 264: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xec822604  ! 264: LDUWA_I	lduwa	[%r8, + 0x0604] %asi, %r22
	.word 0xea720009  ! 267: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc80a0009  ! 267: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xae5a2bc8  ! 267: SMUL_I	smul 	%r8, 0x0bc8, %r23
	.word 0xc2320009  ! 270: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcf020009  ! 270: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc8ea1009  ! 270: LDSTUBA_R	ldstuba	%r4, [%r8 + %r9] 0x80
	.word 0xc9220009  ! 273: STF_R	st	%f4, [%r9, %r8]
	.word 0xc41a0009  ! 273: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 273: STBAR	stbar
	.word 0xcc220009  ! 276: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc3020009  ! 276: LDF_R	ld	[%r8, %r9], %f1
	.word 0xfeaa281c  ! 276: STBA_I	stba	%r31, [%r8 + 0x081c] %asi
	.word 0xdd3a0009  ! 279: STDF_R	std	%f14, [%r9, %r8]
	.word 0xcc1a0009  ! 279: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 279: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4320009  ! 282: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 282: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x0ac20001  ! 282: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xc22a0009  ! 285: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 285: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xb87a0009  ! 285: SDIV_R	sdiv 	%r8, %r9, %r28
	.word 0xe2320009  ! 288: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xe20a0009  ! 288: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xccfa26e4  ! 288: SWAPA_I	swapa	%r6, [%r8 + 0x06e4] %asi
	.word 0xc73a0009  ! 291: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcf020009  ! 291: LDF_R	ld	[%r8, %r9], %f7
	.word 0xf5220009  ! 291: STF_R	st	%f26, [%r9, %r8]
	.word 0xc6720009  ! 294: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 294: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xac520009  ! 294: UMUL_R	umul 	%r8, %r9, %r22
	.word 0xc73a0009  ! 297: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc8520009  ! 297: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x2a800001  ! 297: BCS	bcs,a	<label_0x1>
	.word 0xcb220009  ! 300: STF_R	st	%f5, [%r9, %r8]
	.word 0xfe420009  ! 300: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xfa0a0009  ! 300: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xc42a0009  ! 303: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf2520009  ! 303: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x88fa2338  ! 303: SDIVcc_I	sdivcc 	%r8, 0x0338, %r4
	.word 0xc6220009  ! 306: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfa520009  ! 306: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x86da0009  ! 306: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xe2220009  ! 309: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc71a0009  ! 309: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcaf21009  ! 309: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 312: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe11a0009  ! 312: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xc49a1009  ! 312: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xec2a0009  ! 315: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc31a0009  ! 315: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xfff21009  ! 315: CASXA_I	casxa	[%r8] 0x80, %r9, %r31
	.word 0xda320009  ! 318: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xd80a0009  ! 318: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xc87a0009  ! 318: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xf2320009  ! 321: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc91a0009  ! 321: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x84d224bc  ! 321: UMULcc_I	umulcc 	%r8, 0x04bc, %r2
	.word 0xcd3a0009  ! 324: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe41a0009  ! 324: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x8ef20009  ! 324: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xfa220009  ! 327: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xcc420009  ! 327: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcc9a2578  ! 327: LDDA_I	ldda	[%r8, + 0x0578] %asi, %r6
	.word 0xe13a0009  ! 330: STDF_R	std	%f16, [%r9, %r8]
	.word 0xe40a0009  ! 330: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x89a209a9  ! 330: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc62a0009  ! 333: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc6020009  ! 333: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcaca1009  ! 333: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc6320009  ! 336: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce520009  ! 336: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8f6a2484  ! 336: SDIVX_I	sdivx	%r8, 0x0484, %r7
	.word 0xc33a0009  ! 339: STDF_R	std	%f1, [%r9, %r8]
	.word 0xee520009  ! 339: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x8fa209a9  ! 339: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xe13a0009  ! 342: STDF_R	std	%f16, [%r9, %r8]
	.word 0xcc1a0009  ! 342: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x06ca0001  ! 342: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc5220009  ! 345: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6520009  ! 345: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xce4a2b10  ! 345: LDSB_I	ldsb	[%r8 + 0x0b10], %r7
	.word 0xc3220009  ! 348: STF_R	st	%f1, [%r9, %r8]
	.word 0xe81a0009  ! 348: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0xff220009  ! 351: STF_R	st	%f31, [%r9, %r8]
	.word 0xce420009  ! 351: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x824a2c3c  ! 351: MULX_I	mulx 	%r8, 0x0c3c, %r1
	.word 0xcc220009  ! 354: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce4a0009  ! 354: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc3ea2f48  ! 354: PREFETCHA_I	prefetcha	[%r8, + 0x0f48] %asi, #one_read
	.word 0xdf220009  ! 357: STF_R	st	%f15, [%r9, %r8]
	.word 0xc6520009  ! 357: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8e4a0009  ! 357: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xdf220009  ! 360: STF_R	st	%f15, [%r9, %r8]
	.word 0xfd1a0009  ! 360: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xf4821009  ! 360: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r26
	.word 0xc82a0009  ! 363: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 363: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xf8ba2598  ! 363: STDA_I	stda	%r28, [%r8 + 0x0598] %asi
	.word 0xff220009  ! 366: STF_R	st	%f31, [%r9, %r8]
	.word 0xdf020009  ! 366: LDF_R	ld	[%r8, %r9], %f15
	.word 0x2c800001  ! 366: BNEG	bneg,a	<label_0x1>
	.word 0xcb220009  ! 369: STF_R	st	%f5, [%r9, %r8]
	.word 0xcb1a0009  ! 369: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x16800002  ! 369: BGE	bge  	<label_0x2>
	.word 0xce2a0009  ! 372: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 372: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc36a2b34  ! 372: PREFETCH_I	prefetch	[%r8 + 0x0b34], #one_read
	.word 0xe42a0009  ! 375: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xcb020009  ! 375: LDF_R	ld	[%r8, %r9], %f5
	.word 0xdc1a2680  ! 375: LDD_I	ldd	[%r8 + 0x0680], %r14
	.word 0xcd3a0009  ! 378: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf11a0009  ! 378: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0x88520009  ! 378: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xff220009  ! 381: STF_R	st	%f31, [%r9, %r8]
	.word 0xf64a0009  ! 381: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x8143e042  ! 381: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xcd3a0009  ! 384: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe2520009  ! 384: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xd64a0009  ! 384: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xc93a0009  ! 387: STDF_R	std	%f4, [%r9, %r8]
	.word 0xee4a0009  ! 387: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xc36a2638  ! 387: PREFETCH_I	prefetch	[%r8 + 0x0638], #one_read
	.word 0xc6720009  ! 390: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc01a0009  ! 390: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8fa208a9  ! 390: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xd8220009  ! 393: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xe8520009  ! 393: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x8143e051  ! 393: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xc82a0009  ! 396: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 396: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 396: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc22a0009  ! 399: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcf1a0009  ! 399: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8ba20829  ! 399: FADDs	fadds	%f8, %f9, %f5
	.word 0xf73a0009  ! 402: STDF_R	std	%f27, [%r9, %r8]
	.word 0xcd1a0009  ! 402: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x9e722528  ! 402: UDIV_I	udiv 	%r8, 0x0528, %r15
	.word 0xc8720009  ! 405: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xd6520009  ! 405: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xd6c22da4  ! 405: LDSWA_I	ldswa	[%r8, + 0x0da4] %asi, %r11
	.word 0xc6320009  ! 408: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce520009  ! 408: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc28a1009  ! 408: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xc6320009  ! 411: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 411: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc2922410  ! 411: LDUHA_I	lduha	[%r8, + 0x0410] %asi, %r1
	.word 0xc2320009  ! 414: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf4020009  ! 414: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x24c20001  ! 414: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xec720009  ! 417: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc8120009  ! 417: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xa9220009  ! 417: MULScc_R	mulscc 	%r8, %r9, %r20
	.word 0xe53a0009  ! 420: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc9020009  ! 420: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea1009  ! 420: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe6720009  ! 423: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc60a0009  ! 423: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3222e0c  ! 423: STF_I	st	%f1, [0x0e0c, %r8]
	.word 0xe0720009  ! 426: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc81a0009  ! 426: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143e04b  ! 426: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xc7220009  ! 429: STF_R	st	%f3, [%r9, %r8]
	.word 0xee420009  ! 429: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xc67a0009  ! 429: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xec720009  ! 432: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xf3020009  ! 432: LDF_R	ld	[%r8, %r9], %f25
	.word 0xaefa2804  ! 432: SDIVcc_I	sdivcc 	%r8, 0x0804, %r23
	.word 0xdf3a0009  ! 435: STDF_R	std	%f15, [%r9, %r8]
	.word 0xcc520009  ! 435: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8fa20929  ! 435: FMULs	fmuls	%f8, %f9, %f7
	.word 0xca320009  ! 438: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfc420009  ! 438: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xf8b226c0  ! 438: STHA_I	stha	%r28, [%r8 + 0x06c0] %asi
	.word 0xc62a0009  ! 441: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe44a0009  ! 441: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xc8ba2df8  ! 441: STDA_I	stda	%r4, [%r8 + 0x0df8] %asi
	.word 0xda320009  ! 444: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xf5020009  ! 444: LDF_R	ld	[%r8, %r9], %f26
	.word 0xc8f21009  ! 444: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc9220009  ! 447: STF_R	st	%f4, [%r9, %r8]
	.word 0xc45a0009  ! 447: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x0a800002  ! 447: BCS	bcs  	<label_0x2>
	.word 0xc62a0009  ! 450: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xfc420009  ! 450: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x0e800001  ! 450: BVS	bvs  	<label_0x1>
	.word 0xde220009  ! 453: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xe8420009  ! 453: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xf6fa2fa0  ! 453: SWAPA_I	swapa	%r27, [%r8 + 0x0fa0] %asi
	.word 0xce220009  ! 456: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 456: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x14800002  ! 456: BG	bg  	<label_0x2>
	.word 0xed220009  ! 459: STF_R	st	%f22, [%r9, %r8]
	.word 0xc20a0009  ! 459: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x2e800001  ! 459: BVS	bvs,a	<label_0x1>
	.word 0xc2320009  ! 462: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 462: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc85a0009  ! 462: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xde2a0009  ! 465: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xcc020009  ! 465: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xbe5a24b4  ! 465: SMUL_I	smul 	%r8, 0x04b4, %r31
	.word 0xca320009  ! 468: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf2420009  ! 468: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xcc522a90  ! 468: LDSH_I	ldsh	[%r8 + 0x0a90], %r6
	.word 0xce2a0009  ! 471: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 471: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x06c20001  ! 471: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc4720009  ! 474: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xff020009  ! 474: LDF_R	ld	[%r8, %r9], %f31
	.word 0xc8a21009  ! 474: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 477: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 477: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc91a0009  ! 477: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xce220009  ! 480: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfc1a0009  ! 480: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc6b21009  ! 480: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xfa320009  ! 483: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xcc420009  ! 483: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x12800002  ! 483: BNE	bne  	<label_0x2>
	.word 0xc42a0009  ! 486: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcb1a0009  ! 486: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x1a800002  ! 486: BCC	bcc  	<label_0x2>
	.word 0xe2720009  ! 489: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xf4020009  ! 489: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x02ca0001  ! 489: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xf42a0009  ! 492: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xc71a0009  ! 492: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xf41a2478  ! 492: LDD_I	ldd	[%r8 + 0x0478], %r26
	.word 0xcf220009  ! 495: STF_R	st	%f7, [%r9, %r8]
	.word 0xc7020009  ! 495: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143c000  ! 495: STBAR	stbar
	.word 0xc6220009  ! 498: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca5a0009  ! 498: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc6b22294  ! 498: STHA_I	stha	%r3, [%r8 + 0x0294] %asi
	.word 0xc42a0009  ! 501: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc4520009  ! 501: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xf7022a54  ! 501: LDF_I	ld	[%r8, 0x0a54], %f27
	.word 0xc5220009  ! 504: STF_R	st	%f2, [%r9, %r8]
	.word 0xc40a0009  ! 504: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc8a228c8  ! 504: STWA_I	stwa	%r4, [%r8 + 0x08c8] %asi
	.word 0xce220009  ! 507: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 507: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xa8d2224c  ! 507: UMULcc_I	umulcc 	%r8, 0x024c, %r20
	.word 0xc8220009  ! 510: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xdc1a0009  ! 510: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc3ea1009  ! 510: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdd3a0009  ! 513: STDF_R	std	%f14, [%r9, %r8]
	.word 0xce420009  ! 513: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8143e03d  ! 513: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc53a0009  ! 516: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca120009  ! 516: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xf09a1009  ! 516: LDDA_R	ldda	[%r8, %r9] 0x80, %r24
	.word 0xca2a0009  ! 519: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xfe020009  ! 519: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xeeea2fe4  ! 519: LDSTUBA_I	ldstuba	%r23, [%r8 + 0x0fe4] %asi
	.word 0xca320009  ! 522: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc31a0009  ! 522: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc9222324  ! 522: STF_I	st	%f4, [0x0324, %r8]
	.word 0xc7220009  ! 525: STF_R	st	%f3, [%r9, %r8]
	.word 0xe0520009  ! 525: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xcaaa1009  ! 525: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 528: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca020009  ! 528: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc3ea2454  ! 528: PREFETCHA_I	prefetcha	[%r8, + 0x0454] %asi, #one_read
	.word 0xca2a0009  ! 531: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 531: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xeaaa1009  ! 531: STBA_R	stba	%r21, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 534: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd8120009  ! 534: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xceea25b0  ! 534: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x05b0] %asi
	.word 0xc8320009  ! 537: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 537: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xce821009  ! 537: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xd8220009  ! 540: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xf00a0009  ! 540: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xc36a0009  ! 540: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe82a0009  ! 543: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xcf020009  ! 543: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc49a2028  ! 543: LDDA_I	ldda	[%r8, + 0x0028] %asi, %r2
	.word 0xeb220009  ! 546: STF_R	st	%f21, [%r9, %r8]
	.word 0xee5a0009  ! 546: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xc2020009  ! 546: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc9220009  ! 549: STF_R	st	%f4, [%r9, %r8]
	.word 0xd9020009  ! 549: LDF_R	ld	[%r8, %r9], %f12
	.word 0xccba2f88  ! 549: STDA_I	stda	%r6, [%r8 + 0x0f88] %asi
	.word 0xf9220009  ! 552: STF_R	st	%f28, [%r9, %r8]
	.word 0xc51a0009  ! 552: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc8821009  ! 552: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xcf220009  ! 555: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc5a0009  ! 555: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc73a22e8  ! 555: STDF_I	std	%f3, [0x02e8, %r8]
	.word 0xc33a0009  ! 558: STDF_R	std	%f1, [%r9, %r8]
	.word 0xde0a0009  ! 558: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xc2020009  ! 558: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc22a0009  ! 561: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xd80a0009  ! 561: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xc8120009  ! 561: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc4220009  ! 564: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xd8420009  ! 564: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xc3ea1009  ! 564: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb220009  ! 567: STF_R	st	%f5, [%r9, %r8]
	.word 0xca0a0009  ! 567: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xdd222d08  ! 567: STF_I	st	%f14, [0x0d08, %r8]
	.word 0xc42a0009  ! 570: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd6520009  ! 570: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xaa5a0009  ! 570: SMUL_R	smul 	%r8, %r9, %r21
	.word 0xce320009  ! 573: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc4a0009  ! 573: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x10800001  ! 573: BA	ba  	<label_0x1>
	.word 0xc3220009  ! 576: STF_R	st	%f1, [%r9, %r8]
	.word 0xc45a0009  ! 576: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 576: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce320009  ! 579: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xda020009  ! 579: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xfe120009  ! 579: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xc2220009  ! 582: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf81a0009  ! 582: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x2a800001  ! 582: BCS	bcs,a	<label_0x1>
	.word 0xc3220009  ! 585: STF_R	st	%f1, [%r9, %r8]
	.word 0xe6120009  ! 585: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x34800002  ! 585: BG	bg,a	<label_0x2>
	.word 0xcc320009  ! 588: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 588: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xe1f22009  ! 588: CASXA_R	casxa	[%r8]%asi, %r9, %r16
	.word 0xc7220009  ! 591: STF_R	st	%f3, [%r9, %r8]
	.word 0xc8520009  ! 591: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xecba1009  ! 591: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xca720009  ! 594: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd6420009  ! 594: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0x8143e01a  ! 594: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside 
	.word 0xc8320009  ! 597: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf44a0009  ! 597: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xc53a2978  ! 597: STDF_I	std	%f2, [0x0978, %r8]
	.word 0xec320009  ! 600: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xe6420009  ! 600: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xf13a0009  ! 600: STDF_R	std	%f24, [%r9, %r8]
	.word 0xce220009  ! 603: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd6420009  ! 603: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xe66a0009  ! 603: LDSTUB_R	ldstub	%r19, [%r8 + %r9]
	.word 0xcd220009  ! 606: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6420009  ! 606: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xfe0a0009  ! 606: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xfc2a0009  ! 609: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc4020009  ! 609: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc8ca1009  ! 609: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xc2220009  ! 612: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce120009  ! 612: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8f222a88  ! 612: MULScc_I	mulscc 	%r8, 0x0a88, %r7
	.word 0xc6320009  ! 615: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 615: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc3ea2e7c  ! 615: PREFETCHA_I	prefetcha	[%r8, + 0x0e7c] %asi, #one_read
	.word 0xff220009  ! 618: STF_R	st	%f31, [%r9, %r8]
	.word 0xce4a0009  ! 618: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xbfa208a9  ! 618: FSUBs	fsubs	%f8, %f9, %f31
	.word 0xca320009  ! 621: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc9020009  ! 621: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcaf21009  ! 621: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 624: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 624: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8a4a0009  ! 624: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xcc220009  ! 627: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf5020009  ! 627: LDF_R	ld	[%r8, %r9], %f26
	.word 0x8143e07e  ! 627: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc53a0009  ! 630: STDF_R	std	%f2, [%r9, %r8]
	.word 0xfd020009  ! 630: LDF_R	ld	[%r8, %r9], %f30
	.word 0xc8ba1009  ! 630: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xe0320009  ! 633: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xde4a0009  ! 633: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xc3ea2524  ! 633: PREFETCHA_I	prefetcha	[%r8, + 0x0524] %asi, #one_read
	.word 0xcf220009  ! 636: STF_R	st	%f7, [%r9, %r8]
	.word 0xfd020009  ! 636: LDF_R	ld	[%r8, %r9], %f30
	.word 0xc3ea2928  ! 636: PREFETCHA_I	prefetcha	[%r8, + 0x0928] %asi, #one_read
	.word 0xc4720009  ! 639: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 639: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xce020009  ! 639: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc6320009  ! 642: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 642: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xf86a2ff8  ! 642: LDSTUB_I	ldstub	%r28, [%r8 + 0x0ff8]
	.word 0xc4720009  ! 645: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc71a0009  ! 645: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x825a0009  ! 645: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xdc720009  ! 648: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc3020009  ! 648: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc84a0009  ! 648: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xce220009  ! 651: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xee4a0009  ! 651: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0x8e520009  ! 651: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xc6720009  ! 654: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf81a0009  ! 654: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc6fa1009  ! 654: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 657: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc2520009  ! 657: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xda5a2998  ! 657: LDX_I	ldx	[%r8 + 0x0998], %r13
	.word 0xdd3a0009  ! 660: STDF_R	std	%f14, [%r9, %r8]
	.word 0xf4520009  ! 660: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xae5a0009  ! 660: SMUL_R	smul 	%r8, %r9, %r23
	.word 0xc4220009  ! 663: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce020009  ! 663: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8ba209a9  ! 663: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xec720009  ! 666: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc2520009  ! 666: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x22800002  ! 666: BE	be,a	<label_0x2>
	.word 0xe6220009  ! 669: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc6420009  ! 669: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xce0a0009  ! 669: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xe6220009  ! 672: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xe0420009  ! 672: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x8143c000  ! 672: STBAR	stbar
	.word 0xf6320009  ! 675: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc41a0009  ! 675: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x3e800001  ! 675: BVC	bvc,a	<label_0x1>
	.word 0xf1220009  ! 678: STF_R	st	%f24, [%r9, %r8]
	.word 0xc45a0009  ! 678: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xceca1009  ! 678: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xcc320009  ! 681: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 681: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x12800001  ! 681: BNE	bne  	<label_0x1>
	.word 0xc53a0009  ! 684: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe81a0009  ! 684: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x8e4a20e4  ! 684: MULX_I	mulx 	%r8, 0x00e4, %r7
	.word 0xe33a0009  ! 687: STDF_R	std	%f17, [%r9, %r8]
	.word 0xca0a0009  ! 687: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xccd21009  ! 687: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xc53a0009  ! 690: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc020009  ! 690: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc4c22138  ! 690: LDSWA_I	ldswa	[%r8, + 0x0138] %asi, %r2
	.word 0xc9220009  ! 693: STF_R	st	%f4, [%r9, %r8]
	.word 0xe05a0009  ! 693: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xb3a208a9  ! 693: FSUBs	fsubs	%f8, %f9, %f25
	.word 0xc93a0009  ! 696: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc5020009  ! 696: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc36a2f6c  ! 696: PREFETCH_I	prefetch	[%r8 + 0x0f6c], #one_read
	.word 0xde220009  ! 699: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xce020009  ! 699: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x824a2c48  ! 699: MULX_I	mulx 	%r8, 0x0c48, %r1
	.word 0xea720009  ! 702: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc20a0009  ! 702: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xf0122140  ! 702: LDUH_I	lduh	[%r8 + 0x0140], %r24
	.word 0xc22a0009  ! 705: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe60a0009  ! 705: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x97a20829  ! 705: FADDs	fadds	%f8, %f9, %f11
	.word 0xc62a0009  ! 708: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xd8020009  ! 708: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xc36a2808  ! 708: PREFETCH_I	prefetch	[%r8 + 0x0808], #one_read
	.word 0xc8220009  ! 711: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xff020009  ! 711: LDF_R	ld	[%r8, %r9], %f31
	.word 0xccea23e4  ! 711: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x03e4] %asi
	.word 0xe6320009  ! 714: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xf4420009  ! 714: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0x2c800001  ! 714: BNEG	bneg,a	<label_0x1>
	.word 0xc4720009  ! 717: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc2120009  ! 717: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc87a2b28  ! 717: SWAP_I	swap	%r4, [%r8 + 0x0b28]
	.word 0xed220009  ! 720: STF_R	st	%f22, [%r9, %r8]
	.word 0xc2420009  ! 720: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 720: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe0320009  ! 723: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xcb020009  ! 723: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc4b22e78  ! 723: STHA_I	stha	%r2, [%r8 + 0x0e78] %asi
	.word 0xdb220009  ! 726: STF_R	st	%f13, [%r9, %r8]
	.word 0xcc0a0009  ! 726: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 726: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4320009  ! 729: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 729: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xd73a23a0  ! 729: STDF_I	std	%f11, [0x03a0, %r8]
	.word 0xee720009  ! 732: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xc6420009  ! 732: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 732: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdd220009  ! 735: STF_R	st	%f14, [%r9, %r8]
	.word 0xe6520009  ! 735: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0x986a2a0c  ! 735: UDIVX_I	udivx 	%r8, 0x0a0c, %r12
	.word 0xfb3a0009  ! 738: STDF_R	std	%f29, [%r9, %r8]
	.word 0xda420009  ! 738: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xe73a2f40  ! 738: STDF_I	std	%f19, [0x0f40, %r8]
	.word 0xf2720009  ! 741: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xe24a0009  ! 741: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xe0ba1009  ! 741: STDA_R	stda	%r16, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 744: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce120009  ! 744: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xa85a2e40  ! 744: SMUL_I	smul 	%r8, 0x0e40, %r20
	.word 0xf3220009  ! 747: STF_R	st	%f25, [%r9, %r8]
	.word 0xde5a0009  ! 747: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc36a0009  ! 747: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc33a0009  ! 750: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf6420009  ! 750: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xeac22da0  ! 750: LDSWA_I	ldswa	[%r8, + 0x0da0] %asi, %r21
	.word 0xc9220009  ! 753: STF_R	st	%f4, [%r9, %r8]
	.word 0xca420009  ! 753: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc8c21009  ! 753: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xe22a0009  ! 756: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc31a0009  ! 756: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143e03c  ! 756: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xe02a0009  ! 759: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc01a0009  ! 759: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8143c000  ! 759: STBAR	stbar
	.word 0xca320009  ! 762: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf2020009  ! 762: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x9ba208a9  ! 762: FSUBs	fsubs	%f8, %f9, %f13
	.word 0xfc320009  ! 765: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xe8420009  ! 765: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xc4ea217c  ! 765: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x017c] %asi
	.word 0xc93a0009  ! 768: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcb020009  ! 768: LDF_R	ld	[%r8, %r9], %f5
	.word 0x87a208a9  ! 768: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xf82a0009  ! 771: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc6020009  ! 771: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x887a0009  ! 771: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xea220009  ! 774: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc81a0009  ! 774: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xca0a0009  ! 774: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc82a0009  ! 777: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc25a0009  ! 777: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x86da29f8  ! 777: SMULcc_I	smulcc 	%r8, 0x09f8, %r3
	.word 0xc22a0009  ! 780: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 780: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x9da209a9  ! 780: FDIVs	fdivs	%f8, %f9, %f14
	.word 0xcb220009  ! 783: STF_R	st	%f5, [%r9, %r8]
	.word 0xfd020009  ! 783: LDF_R	ld	[%r8, %r9], %f30
	.word 0xc3ea2a44  ! 783: PREFETCHA_I	prefetcha	[%r8, + 0x0a44] %asi, #one_read
	.word 0xcd3a0009  ! 786: STDF_R	std	%f6, [%r9, %r8]
	.word 0xec420009  ! 786: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x8ba208a9  ! 786: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc93a0009  ! 789: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf60a0009  ! 789: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xc36a0009  ! 789: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc320009  ! 792: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce420009  ! 792: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xda922b84  ! 792: LDUHA_I	lduha	[%r8, + 0x0b84] %asi, %r13
	.word 0xf53a0009  ! 795: STDF_R	std	%f26, [%r9, %r8]
	.word 0xcf1a0009  ! 795: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xbcda0009  ! 795: SMULcc_R	smulcc 	%r8, %r9, %r30
	.word 0xcc220009  ! 798: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc1a0009  ! 798: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x9e5a28d8  ! 798: SMUL_I	smul 	%r8, 0x08d8, %r15
	.word 0xca2a0009  ! 801: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc2520009  ! 801: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xe2022508  ! 801: LDUW_I	lduw	[%r8 + 0x0508], %r17
	.word 0xc4220009  ! 804: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc40a0009  ! 804: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xf2821009  ! 804: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r25
	.word 0xea720009  ! 807: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc01a0009  ! 807: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8ed20009  ! 807: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xcd3a0009  ! 810: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe1020009  ! 810: LDF_R	ld	[%r8, %r9], %f16
	.word 0x8af222d8  ! 810: UDIVcc_I	udivcc 	%r8, 0x02d8, %r5
	.word 0xc8220009  ! 813: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe2420009  ! 813: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xc3ea2308  ! 813: PREFETCHA_I	prefetcha	[%r8, + 0x0308] %asi, #one_read
	.word 0xf02a0009  ! 816: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xe80a0009  ! 816: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0x02800002  ! 816: BE	be  	<label_0x2>
	.word 0xc6720009  ! 819: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 819: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x2e800001  ! 819: BVS	bvs,a	<label_0x1>
	.word 0xf0720009  ! 822: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xca0a0009  ! 822: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xdaf22668  ! 822: STXA_I	stxa	%r13, [%r8 + 0x0668] %asi
	.word 0xc42a0009  ! 825: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 825: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc9f22009  ! 825: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xf62a0009  ! 828: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc51a0009  ! 828: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xaada0009  ! 828: SMULcc_R	smulcc 	%r8, %r9, %r21
	.word 0xcd220009  ! 831: STF_R	st	%f6, [%r9, %r8]
	.word 0xc8020009  ! 831: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8143e00f  ! 831: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0xc73a0009  ! 834: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe80a0009  ! 834: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0x34800001  ! 834: BG	bg,a	<label_0x1>
	.word 0xc4220009  ! 837: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe00a0009  ! 837: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xbc7a0009  ! 837: SDIV_R	sdiv 	%r8, %r9, %r30
	.word 0xca220009  ! 840: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 840: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 840: STBAR	stbar
	.word 0xf4320009  ! 843: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc2120009  ! 843: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143e054  ! 843: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xc82a0009  ! 846: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc20a0009  ! 846: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xca6a0009  ! 846: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xcb3a0009  ! 849: STDF_R	std	%f5, [%r9, %r8]
	.word 0xd81a0009  ! 849: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x06800001  ! 849: BL	bl  	<label_0x1>
	.word 0xc9220009  ! 852: STF_R	st	%f4, [%r9, %r8]
	.word 0xe6520009  ! 852: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0x86522e60  ! 852: UMUL_I	umul 	%r8, 0x0e60, %r3
	.word 0xfb220009  ! 855: STF_R	st	%f29, [%r9, %r8]
	.word 0xca120009  ! 855: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x87a209a9  ! 855: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xce220009  ! 858: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc8520009  ! 858: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x866a0009  ! 858: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc7220009  ! 861: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4020009  ! 861: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xceda2c58  ! 861: LDXA_I	ldxa	[%r8, + 0x0c58] %asi, %r7
	.word 0xcf220009  ! 864: STF_R	st	%f7, [%r9, %r8]
	.word 0xe80a0009  ! 864: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xccaa1009  ! 864: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xd6220009  ! 867: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xcc4a0009  ! 867: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 867: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2220009  ! 870: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xee5a0009  ! 870: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0x2ec20001  ! 870: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xf8720009  ! 873: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc24a0009  ! 873: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x884a24ec  ! 873: MULX_I	mulx 	%r8, 0x04ec, %r4
	.word 0xca220009  ! 876: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcf020009  ! 876: LDF_R	ld	[%r8, %r9], %f7
	.word 0x34800001  ! 876: BG	bg,a	<label_0x1>
	.word 0xde220009  ! 879: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xeb1a0009  ! 879: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0x8ba209a9  ! 879: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc6720009  ! 882: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe31a0009  ! 882: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xc36a0009  ! 882: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc9220009  ! 885: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc420009  ! 885: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcff21009  ! 885: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xe6720009  ! 888: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xce5a0009  ! 888: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xfea22560  ! 888: STWA_I	stwa	%r31, [%r8 + 0x0560] %asi
	.word 0xcc320009  ! 891: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 891: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e024  ! 891: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xcc720009  ! 894: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf81a0009  ! 894: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc36a2ba8  ! 894: PREFETCH_I	prefetch	[%r8 + 0x0ba8], #one_read
	.word 0xf82a0009  ! 897: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xf1020009  ! 897: LDF_R	ld	[%r8, %r9], %f24
	.word 0xc4ea22c4  ! 897: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x02c4] %asi
	.word 0xc4220009  ! 900: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xfe420009  ! 900: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xdcea1009  ! 900: LDSTUBA_R	ldstuba	%r14, [%r8 + %r9] 0x80
	.word 0xd62a0009  ! 903: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xcc5a0009  ! 903: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xca0a2208  ! 903: LDUB_I	ldub	[%r8 + 0x0208], %r5
	.word 0xcc2a0009  ! 906: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 906: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143e050  ! 906: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xca220009  ! 909: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 909: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8a520009  ! 909: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc33a0009  ! 912: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcb1a0009  ! 912: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xccd21009  ! 912: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xcf220009  ! 915: STF_R	st	%f7, [%r9, %r8]
	.word 0xc6020009  ! 915: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x24ca0001  ! 915: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xcc220009  ! 918: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xda420009  ! 918: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x8143e07d  ! 918: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xe2720009  ! 921: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc8520009  ! 921: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xe73a20f0  ! 921: STDF_I	std	%f19, [0x00f0, %r8]
	.word 0xe8220009  ! 924: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc31a0009  ! 924: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xa8522850  ! 924: UMUL_I	umul 	%r8, 0x0850, %r20
	.word 0xc4220009  ! 927: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe81a0009  ! 927: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xc36a0009  ! 927: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 930: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 930: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xeaa22a78  ! 930: STWA_I	stwa	%r21, [%r8 + 0x0a78] %asi
	.word 0xe6220009  ! 933: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc24a0009  ! 933: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 933: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcf3a0009  ! 936: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc91a0009  ! 936: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xa0f2209c  ! 936: UDIVcc_I	udivcc 	%r8, 0x009c, %r16
	.word 0xc2220009  ! 939: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca520009  ! 939: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x885a23b8  ! 939: SMUL_I	smul 	%r8, 0x03b8, %r4
	.word 0xc8320009  ! 942: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc6120009  ! 942: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xd67a2890  ! 942: SWAP_I	swap	%r11, [%r8 + 0x0890]
	.word 0xc62a0009  ! 945: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe64a0009  ! 945: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xcc5a2cb0  ! 945: LDX_I	ldx	[%r8 + 0x0cb0], %r6
	.word 0xc33a0009  ! 948: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc0a0009  ! 948: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x2eca0001  ! 948: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xcc220009  ! 951: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca5a0009  ! 951: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8eda0009  ! 951: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xcc720009  ! 954: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 954: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc2ea1009  ! 954: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xce720009  ! 957: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 957: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc64a2dbc  ! 957: LDSB_I	ldsb	[%r8 + 0x0dbc], %r3
	.word 0xc7220009  ! 960: STF_R	st	%f3, [%r9, %r8]
	.word 0xce5a0009  ! 960: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xccb21009  ! 960: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 963: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce5a0009  ! 963: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc4fa2534  ! 963: SWAPA_I	swapa	%r2, [%r8 + 0x0534] %asi
	.word 0xdc2a0009  ! 966: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xdf020009  ! 966: LDF_R	ld	[%r8, %r9], %f15
	.word 0x847a0009  ! 966: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xc8320009  ! 969: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xd6120009  ! 969: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xc36a0009  ! 969: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc7220009  ! 972: STF_R	st	%f3, [%r9, %r8]
	.word 0xc40a0009  ! 972: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc3ea2fd0  ! 972: PREFETCHA_I	prefetcha	[%r8, + 0x0fd0] %asi, #one_read
	.word 0xc2220009  ! 975: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc25a0009  ! 975: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xa7a209a9  ! 975: FDIVs	fdivs	%f8, %f9, %f19
	.word 0xc8320009  ! 978: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc24a0009  ! 978: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143c000  ! 978: STBAR	stbar
	.word 0xcf220009  ! 981: STF_R	st	%f7, [%r9, %r8]
	.word 0xd8520009  ! 981: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xea8a1009  ! 981: LDUBA_R	lduba	[%r8, %r9] 0x80, %r21
	.word 0xcc720009  ! 984: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfe5a0009  ! 984: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0x0a800002  ! 984: BCS	bcs  	<label_0x2>
	.word 0xdc320009  ! 987: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xe01a0009  ! 987: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xec922b2c  ! 987: LDUHA_I	lduha	[%r8, + 0x0b2c] %asi, %r22
	.word 0xca2a0009  ! 990: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 990: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x9b220009  ! 990: MULScc_R	mulscc 	%r8, %r9, %r13
	.word 0xc9220009  ! 993: STF_R	st	%f4, [%r9, %r8]
	.word 0xc85a0009  ! 993: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143e024  ! 993: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xca2a0009  ! 996: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce520009  ! 996: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x04ca0001  ! 996: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xcf220009  ! 999: STF_R	st	%f7, [%r9, %r8]
	.word 0xd8420009  ! 999: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xc3ea1009  ! 999: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc7220009  ! 1002: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6020009  ! 1002: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x24800001  ! 1002: BLE	ble,a	<label_0x1>
	.word 0xcb3a0009  ! 1005: STDF_R	std	%f5, [%r9, %r8]
	.word 0xed020009  ! 1005: LDF_R	ld	[%r8, %r9], %f22
	.word 0xc2f22ed8  ! 1005: STXA_I	stxa	%r1, [%r8 + 0x0ed8] %asi
	.word 0xca2a0009  ! 1008: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf65a0009  ! 1008: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0x10800001  ! 1008: BA	ba  	<label_0x1>
	.word 0xca720009  ! 1011: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc520009  ! 1011: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8ed20009  ! 1011: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xef3a0009  ! 1014: STDF_R	std	%f23, [%r9, %r8]
	.word 0xee020009  ! 1014: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xc7220009  ! 1014: STF_R	st	%f3, [%r9, %r8]
	.word 0xcd3a0009  ! 1017: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf71a0009  ! 1017: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0x12800001  ! 1017: BNE	bne  	<label_0x1>
	.word 0xcc220009  ! 1020: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc60a0009  ! 1020: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xe2aa2de4  ! 1020: STBA_I	stba	%r17, [%r8 + 0x0de4] %asi
	.word 0xcc220009  ! 1023: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca5a0009  ! 1023: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc9220009  ! 1023: STF_R	st	%f4, [%r9, %r8]
	.word 0xda2a0009  ! 1026: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc41a0009  ! 1026: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x9a5a0009  ! 1026: SMUL_R	smul 	%r8, %r9, %r13
	.word 0xc4720009  ! 1029: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc6120009  ! 1029: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc2921009  ! 1029: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xc62a0009  ! 1032: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca420009  ! 1032: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc2da1009  ! 1032: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc22a0009  ! 1035: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xdd020009  ! 1035: LDF_R	ld	[%r8, %r9], %f14
	.word 0xf4aa1009  ! 1035: STBA_R	stba	%r26, [%r8 + %r9] 0x80
	.word 0xce220009  ! 1038: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc64a0009  ! 1038: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8c720009  ! 1038: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xcc320009  ! 1041: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf2420009  ! 1041: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xc36a0009  ! 1041: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc53a0009  ! 1044: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc60a0009  ! 1044: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcefa2b2c  ! 1044: SWAPA_I	swapa	%r7, [%r8 + 0x0b2c] %asi
	.word 0xc73a0009  ! 1047: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc0a0009  ! 1047: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x83222f44  ! 1047: MULScc_I	mulscc 	%r8, 0x0f44, %r1
	.word 0xcb220009  ! 1050: STF_R	st	%f5, [%r9, %r8]
	.word 0xca020009  ! 1050: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc71a29e0  ! 1050: LDDF_I	ldd	[%r8, 0x09e0], %f3
	.word 0xc73a0009  ! 1053: STDF_R	std	%f3, [%r9, %r8]
	.word 0xdc0a0009  ! 1053: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xf9222934  ! 1053: STF_I	st	%f28, [0x0934, %r8]
	.word 0xce220009  ! 1056: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 1056: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xd6a21009  ! 1056: STWA_R	stwa	%r11, [%r8 + %r9] 0x80
	.word 0xf4720009  ! 1059: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xec520009  ! 1059: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0x8143e05f  ! 1059: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xce220009  ! 1062: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xea520009  ! 1062: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0x8143e038  ! 1062: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xf22a0009  ! 1065: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xcc0a0009  ! 1065: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xeb222b84  ! 1065: STF_I	st	%f21, [0x0b84, %r8]
	.word 0xcf220009  ! 1068: STF_R	st	%f7, [%r9, %r8]
	.word 0xc80a0009  ! 1068: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc32227b0  ! 1068: STF_I	st	%f1, [0x07b0, %r8]
	.word 0xce2a0009  ! 1071: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcb1a0009  ! 1071: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xd7f21009  ! 1071: CASXA_I	casxa	[%r8] 0x80, %r9, %r11
	.word 0xca220009  ! 1074: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 1074: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc2c21009  ! 1074: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xfe320009  ! 1077: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xda5a0009  ! 1077: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xb8d20009  ! 1077: UMULcc_R	umulcc 	%r8, %r9, %r28
	.word 0xdc220009  ! 1080: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc25a0009  ! 1080: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xfca21009  ! 1080: STWA_R	stwa	%r30, [%r8 + %r9] 0x80
	.word 0xfc220009  ! 1083: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc7020009  ! 1083: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc81a0009  ! 1083: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xce720009  ! 1086: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xce420009  ! 1086: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xe26a2044  ! 1086: LDSTUB_I	ldstub	%r17, [%r8 + 0x0044]
	.word 0xef220009  ! 1089: STF_R	st	%f23, [%r9, %r8]
	.word 0xfc4a0009  ! 1089: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0x82fa0009  ! 1089: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xde720009  ! 1092: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xce020009  ! 1092: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143c000  ! 1092: STBAR	stbar
	.word 0xcf220009  ! 1095: STF_R	st	%f7, [%r9, %r8]
	.word 0xc24a0009  ! 1095: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1095: STBAR	stbar
	.word 0xcd220009  ! 1098: STF_R	st	%f6, [%r9, %r8]
	.word 0xe64a0009  ! 1098: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x87a20829  ! 1098: FADDs	fadds	%f8, %f9, %f3
	.word 0xc53a0009  ! 1101: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca5a0009  ! 1101: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xcefa2000  ! 1101: SWAPA_I	swapa	%r7, [%r8 + 0x0000] %asi
	.word 0xc2320009  ! 1104: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xfa020009  ! 1104: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xc4ca1009  ! 1104: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xc42a0009  ! 1107: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 1107: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcc822b20  ! 1107: LDUWA_I	lduwa	[%r8, + 0x0b20] %asi, %r6
	.word 0xcb220009  ! 1110: STF_R	st	%f5, [%r9, %r8]
	.word 0xc41a0009  ! 1110: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x00800002  ! 1110: BN	bn  	<label_0x2>
	.word 0xcd3a0009  ! 1113: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6520009  ! 1113: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x3a800001  ! 1113: BCC	bcc,a	<label_0x1>
	.word 0xd82a0009  ! 1116: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xca520009  ! 1116: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x02800001  ! 1116: BE	be  	<label_0x1>
	.word 0xfd3a0009  ! 1119: STDF_R	std	%f30, [%r9, %r8]
	.word 0xcd020009  ! 1119: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8c6a0009  ! 1119: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xdc220009  ! 1122: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc5020009  ! 1122: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143c000  ! 1122: STBAR	stbar
	.word 0xcb220009  ! 1125: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8120009  ! 1125: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc4ba1009  ! 1125: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xee220009  ! 1128: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc20a0009  ! 1128: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3ea2a94  ! 1128: PREFETCHA_I	prefetcha	[%r8, + 0x0a94] %asi, #one_read
	.word 0xf4220009  ! 1131: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xde120009  ! 1131: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0x8143c000  ! 1131: STBAR	stbar
	.word 0xc2320009  ! 1134: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce5a0009  ! 1134: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xb9a209a9  ! 1134: FDIVs	fdivs	%f8, %f9, %f28
	.word 0xff220009  ! 1137: STF_R	st	%f31, [%r9, %r8]
	.word 0xca120009  ! 1137: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1137: STBAR	stbar
	.word 0xc8220009  ! 1140: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca420009  ! 1140: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143e011  ! 1140: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xca2a0009  ! 1143: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 1143: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8143e068  ! 1143: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xca720009  ! 1146: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 1146: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x86522814  ! 1146: UMUL_I	umul 	%r8, 0x0814, %r3
	.word 0xf6220009  ! 1149: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xce4a0009  ! 1149: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc3222434  ! 1149: STF_I	st	%f1, [0x0434, %r8]
	.word 0xcb3a0009  ! 1152: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc4120009  ! 1152: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc8ba2a18  ! 1152: STDA_I	stda	%r4, [%r8 + 0x0a18] %asi
	.word 0xc73a0009  ! 1155: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc64a0009  ! 1155: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x0eca0001  ! 1155: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc8220009  ! 1158: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfc420009  ! 1158: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xa8fa0009  ! 1158: SDIVcc_R	sdivcc 	%r8, %r9, %r20
	.word 0xe0320009  ! 1161: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xce0a0009  ! 1161: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xf89a1009  ! 1161: LDDA_R	ldda	[%r8, %r9] 0x80, %r28
	.word 0xfc2a0009  ! 1164: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc20a0009  ! 1164: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xdaf22080  ! 1164: STXA_I	stxa	%r13, [%r8 + 0x0080] %asi
	.word 0xd6220009  ! 1167: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc9020009  ! 1167: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143c000  ! 1167: STBAR	stbar
	.word 0xce220009  ! 1170: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc7020009  ! 1170: LDF_R	ld	[%r8, %r9], %f3
	.word 0x1a800001  ! 1170: BCC	bcc  	<label_0x1>
	.word 0xcf3a0009  ! 1173: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe41a0009  ! 1173: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x8143c000  ! 1173: STBAR	stbar
	.word 0xf42a0009  ! 1176: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xf4420009  ! 1176: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xd49a2fb0  ! 1176: LDDA_I	ldda	[%r8, + 0x0fb0] %asi, %r10
	.word 0xcc720009  ! 1179: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xdd020009  ! 1179: LDF_R	ld	[%r8, %r9], %f14
	.word 0xc44a0009  ! 1179: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xf2320009  ! 1182: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc9020009  ! 1182: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc7f21009  ! 1182: CASXA_I	casxa	[%r8] 0x80, %r9, %r3
	.word 0xf7220009  ! 1185: STF_R	st	%f27, [%r9, %r8]
	.word 0xde020009  ! 1185: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xe0922964  ! 1185: LDUHA_I	lduha	[%r8, + 0x0964] %asi, %r16
	.word 0xc22a0009  ! 1188: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfc020009  ! 1188: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0x8fa209a9  ! 1188: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc53a0009  ! 1191: STDF_R	std	%f2, [%r9, %r8]
	.word 0xd60a0009  ! 1191: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xcefa242c  ! 1191: SWAPA_I	swapa	%r7, [%r8 + 0x042c] %asi
	.word 0xc9220009  ! 1194: STF_R	st	%f4, [%r9, %r8]
	.word 0xde120009  ! 1194: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc8b2232c  ! 1194: STHA_I	stha	%r4, [%r8 + 0x032c] %asi
	.word 0xc3220009  ! 1197: STF_R	st	%f1, [%r9, %r8]
	.word 0xee420009  ! 1197: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xe0b21009  ! 1197: STHA_R	stha	%r16, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 1200: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xda0a0009  ! 1200: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xc4821009  ! 1200: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xcc720009  ! 1203: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfd1a0009  ! 1203: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x8e720009  ! 1203: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xdb220009  ! 1206: STF_R	st	%f13, [%r9, %r8]
	.word 0xc6120009  ! 1206: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xaed20009  ! 1206: UMULcc_R	umulcc 	%r8, %r9, %r23
	.word 0xcb220009  ! 1209: STF_R	st	%f5, [%r9, %r8]
	.word 0xce0a0009  ! 1209: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8e6a2a70  ! 1209: UDIVX_I	udivx 	%r8, 0x0a70, %r7
	.word 0xf0320009  ! 1212: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xca420009  ! 1212: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xccba1009  ! 1212: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 1215: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcb020009  ! 1215: LDF_R	ld	[%r8, %r9], %f5
	.word 0x88720009  ! 1215: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc53a0009  ! 1218: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc85a0009  ! 1218: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x1a800001  ! 1218: BCC	bcc  	<label_0x1>
	.word 0xc2320009  ! 1221: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2020009  ! 1221: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc36a20a4  ! 1221: PREFETCH_I	prefetch	[%r8 + 0x00a4], #one_read
	.word 0xe42a0009  ! 1224: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xfe0a0009  ! 1224: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0xcef22348  ! 1224: STXA_I	stxa	%r7, [%r8 + 0x0348] %asi
	.word 0xde2a0009  ! 1227: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xf0120009  ! 1227: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0xc6aa1009  ! 1227: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xe0220009  ! 1230: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xe64a0009  ! 1230: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x8143e02b  ! 1230: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xe62a0009  ! 1233: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc6520009  ! 1233: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xde7a0009  ! 1233: SWAP_R	swap	%r15, [%r8 + %r9]
	.word 0xcc320009  ! 1236: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf4520009  ! 1236: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x85a208a9  ! 1236: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc53a0009  ! 1239: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf8020009  ! 1239: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xf47a0009  ! 1239: SWAP_R	swap	%r26, [%r8 + %r9]
	.word 0xcb220009  ! 1242: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc1a0009  ! 1242: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x02800001  ! 1242: BE	be  	<label_0x1>
	.word 0xff220009  ! 1245: STF_R	st	%f31, [%r9, %r8]
	.word 0xdf1a0009  ! 1245: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x0cc20001  ! 1245: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xdb3a0009  ! 1248: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc2420009  ! 1248: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8f6a0009  ! 1248: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc53a0009  ! 1251: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc31a0009  ! 1251: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc4aa2600  ! 1251: STBA_I	stba	%r2, [%r8 + 0x0600] %asi
	.word 0xce220009  ! 1254: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 1254: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc36a2f70  ! 1254: PREFETCH_I	prefetch	[%r8 + 0x0f70], #one_read
	.word 0xfc320009  ! 1257: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc3020009  ! 1257: LDF_R	ld	[%r8, %r9], %f1
	.word 0x10800001  ! 1257: BA	ba  	<label_0x1>
	.word 0xec220009  ! 1260: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc25a0009  ! 1260: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc87a2a3c  ! 1260: SWAP_I	swap	%r4, [%r8 + 0x0a3c]
	.word 0xc62a0009  ! 1263: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce020009  ! 1263: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xce921009  ! 1263: LDUHA_R	lduha	[%r8, %r9] 0x80, %r7
	.word 0xee720009  ! 1266: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xc5020009  ! 1266: LDF_R	ld	[%r8, %r9], %f2
	.word 0xcf220009  ! 1266: STF_R	st	%f7, [%r9, %r8]
	.word 0xce220009  ! 1269: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce120009  ! 1269: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x84fa0009  ! 1269: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc8320009  ! 1272: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 1272: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc8b21009  ! 1272: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xce220009  ! 1275: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc3020009  ! 1275: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc71a25f0  ! 1275: LDDF_I	ldd	[%r8, 0x05f0], %f3
	.word 0xcd220009  ! 1278: STF_R	st	%f6, [%r9, %r8]
	.word 0xca120009  ! 1278: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x26ca0001  ! 1278: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xf53a0009  ! 1281: STDF_R	std	%f26, [%r9, %r8]
	.word 0xcc1a0009  ! 1281: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc09a1009  ! 1281: LDDA_R	ldda	[%r8, %r9] 0x80, %r0
	.word 0xce220009  ! 1284: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcf1a0009  ! 1284: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc47a0009  ! 1284: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xc2320009  ! 1287: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe41a0009  ! 1287: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x30800002  ! 1287: BA	ba,a	<label_0x2>
	.word 0xc6720009  ! 1290: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 1290: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc4b22da4  ! 1290: STHA_I	stha	%r2, [%r8 + 0x0da4] %asi
	.word 0xfd3a0009  ! 1293: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc81a0009  ! 1293: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcb22275c  ! 1293: STF_I	st	%f5, [0x075c, %r8]
	.word 0xc8320009  ! 1296: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe01a0009  ! 1296: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x84fa2928  ! 1296: SDIVcc_I	sdivcc 	%r8, 0x0928, %r2
	.word 0xc8320009  ! 1299: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf45a0009  ! 1299: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x1e800002  ! 1299: BVC	bvc  	<label_0x2>
	.word 0xfb3a0009  ! 1302: STDF_R	std	%f29, [%r9, %r8]
	.word 0xea5a0009  ! 1302: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xa7a208a9  ! 1302: FSUBs	fsubs	%f8, %f9, %f19
	.word 0xc6320009  ! 1305: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe9020009  ! 1305: LDF_R	ld	[%r8, %r9], %f20
	.word 0xc36a0009  ! 1305: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce2a0009  ! 1308: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc25a0009  ! 1308: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x88d223ac  ! 1308: UMULcc_I	umulcc 	%r8, 0x03ac, %r4
	.word 0xf62a0009  ! 1311: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xe2520009  ! 1311: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xc8fa1009  ! 1311: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 1314: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc20a0009  ! 1314: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x1c800001  ! 1314: BPOS	bpos  	<label_0x1>
	.word 0xf6320009  ! 1317: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xee420009  ! 1317: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0x0a800001  ! 1317: BCS	bcs  	<label_0x1>
	.word 0xf1220009  ! 1320: STF_R	st	%f24, [%r9, %r8]
	.word 0xc01a0009  ! 1320: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x12800001  ! 1320: BNE	bne  	<label_0x1>
	.word 0xca220009  ! 1323: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc020009  ! 1323: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xce6a0009  ! 1323: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xcf220009  ! 1326: STF_R	st	%f7, [%r9, %r8]
	.word 0xc01a0009  ! 1326: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x825a2bac  ! 1326: SMUL_I	smul 	%r8, 0x0bac, %r1
	.word 0xc6720009  ! 1329: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcd020009  ! 1329: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143e061  ! 1329: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xca720009  ! 1332: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 1332: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xfb3a0009  ! 1332: STDF_R	std	%f29, [%r9, %r8]
	.word 0xf2220009  ! 1335: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xde4a0009  ! 1335: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xcaf21009  ! 1335: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc3220009  ! 1338: STF_R	st	%f1, [%r9, %r8]
	.word 0xce0a0009  ! 1338: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xe89a1009  ! 1338: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xfd3a0009  ! 1341: STDF_R	std	%f30, [%r9, %r8]
	.word 0xf64a0009  ! 1341: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x8143e011  ! 1341: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc4720009  ! 1344: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc8520009  ! 1344: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xf8020009  ! 1344: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xca2a0009  ! 1347: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xee0a0009  ! 1347: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xf2b21009  ! 1347: STHA_R	stha	%r25, [%r8 + %r9] 0x80
	.word 0xff220009  ! 1350: STF_R	st	%f31, [%r9, %r8]
	.word 0xfa5a0009  ! 1350: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xccd22c30  ! 1350: LDSHA_I	ldsha	[%r8, + 0x0c30] %asi, %r6
	.word 0xc4320009  ! 1353: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf60a0009  ! 1353: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xc72225c8  ! 1353: STF_I	st	%f3, [0x05c8, %r8]
	.word 0xfd220009  ! 1356: STF_R	st	%f30, [%r9, %r8]
	.word 0xf8420009  ! 1356: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0x8a722ab0  ! 1356: UDIV_I	udiv 	%r8, 0x0ab0, %r5
	.word 0xfc220009  ! 1359: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xe8120009  ! 1359: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xd68a1009  ! 1359: LDUBA_R	lduba	[%r8, %r9] 0x80, %r11
	.word 0xc6320009  ! 1362: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4420009  ! 1362: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc4b22bc4  ! 1362: STHA_I	stha	%r2, [%r8 + 0x0bc4] %asi
	.word 0xf6720009  ! 1365: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xcf1a0009  ! 1365: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x846a0009  ! 1365: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xc6720009  ! 1368: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf1020009  ! 1368: LDF_R	ld	[%r8, %r9], %f24
	.word 0xc87a0009  ! 1368: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xca320009  ! 1371: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca420009  ! 1371: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xd7e22009  ! 1371: CASA_R	casa	[%r8] %asi, %r9, %r11
	.word 0xcd3a0009  ! 1374: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce4a0009  ! 1374: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a2310  ! 1374: PREFETCH_I	prefetch	[%r8 + 0x0310], #one_read
	.word 0xcf3a0009  ! 1377: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc41a0009  ! 1377: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc4420009  ! 1377: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xca720009  ! 1380: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc6020009  ! 1380: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc6ca2888  ! 1380: LDSBA_I	ldsba	[%r8, + 0x0888] %asi, %r3
	.word 0xe3220009  ! 1383: STF_R	st	%f17, [%r9, %r8]
	.word 0xc4020009  ! 1383: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8143e060  ! 1383: MEMBAR	membar	#MemIssue | #Sync 
	.word 0xfa320009  ! 1386: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xce020009  ! 1386: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 1386: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc320009  ! 1389: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xea420009  ! 1389: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xb9a20829  ! 1389: FADDs	fadds	%f8, %f9, %f28
	.word 0xce220009  ! 1392: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 1392: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1392: STBAR	stbar
	.word 0xce2a0009  ! 1395: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe64a0009  ! 1395: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc2fa2108  ! 1395: SWAPA_I	swapa	%r1, [%r8 + 0x0108] %asi
	.word 0xce320009  ! 1398: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf40a0009  ! 1398: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xc28a1009  ! 1398: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0xeb3a0009  ! 1401: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc60a0009  ! 1401: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8ed20009  ! 1401: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc8720009  ! 1404: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc91a0009  ! 1404: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcafa2500  ! 1404: SWAPA_I	swapa	%r5, [%r8 + 0x0500] %asi
	.word 0xca320009  ! 1407: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfb020009  ! 1407: LDF_R	ld	[%r8, %r9], %f29
	.word 0xca5a0009  ! 1407: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xce320009  ! 1410: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce020009  ! 1410: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143e00e  ! 1410: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore 
	.word 0xc62a0009  ! 1413: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 1413: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xa8720009  ! 1413: UDIV_R	udiv 	%r8, %r9, %r20
	.word 0xcc720009  ! 1416: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc8520009  ! 1416: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8da20929  ! 1416: FMULs	fmuls	%f8, %f9, %f6
	.word 0xce2a0009  ! 1419: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 1419: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143e004  ! 1419: MEMBAR	membar	#LoadStore 
	.word 0xf3220009  ! 1422: STF_R	st	%f25, [%r9, %r8]
	.word 0xdb1a0009  ! 1422: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xc2822220  ! 1422: LDUWA_I	lduwa	[%r8, + 0x0220] %asi, %r1
	.word 0xc3220009  ! 1425: STF_R	st	%f1, [%r9, %r8]
	.word 0xcf1a0009  ! 1425: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xe41a0009  ! 1425: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xcc320009  ! 1428: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4020009  ! 1428: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8143e021  ! 1428: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xcf3a0009  ! 1431: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf2520009  ! 1431: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xc3ea21b0  ! 1431: PREFETCHA_I	prefetcha	[%r8, + 0x01b0] %asi, #one_read
	.word 0xe33a0009  ! 1434: STDF_R	std	%f17, [%r9, %r8]
	.word 0xcc120009  ! 1434: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8ba209a9  ! 1434: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc53a0009  ! 1437: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc31a0009  ! 1437: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xa5a208a9  ! 1437: FSUBs	fsubs	%f8, %f9, %f18
	.word 0xcc720009  ! 1440: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 1440: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x827a0009  ! 1440: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc6320009  ! 1443: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 1443: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 1443: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdd220009  ! 1446: STF_R	st	%f14, [%r9, %r8]
	.word 0xc65a0009  ! 1446: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1446: STBAR	stbar
	.word 0xca2a0009  ! 1449: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc8120009  ! 1449: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcc5a2910  ! 1449: LDX_I	ldx	[%r8 + 0x0910], %r6
	.word 0xca320009  ! 1452: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 1452: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 1452: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf13a0009  ! 1455: STDF_R	std	%f24, [%r9, %r8]
	.word 0xcc5a0009  ! 1455: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x2ec20001  ! 1455: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xca2a0009  ! 1458: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd9020009  ! 1458: LDF_R	ld	[%r8, %r9], %f12
	.word 0xf2ea23a8  ! 1458: LDSTUBA_I	ldstuba	%r25, [%r8 + 0x03a8] %asi
	.word 0xc93a0009  ! 1461: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc45a0009  ! 1461: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1461: STBAR	stbar
	.word 0xcf220009  ! 1464: STF_R	st	%f7, [%r9, %r8]
	.word 0xf44a0009  ! 1464: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xc3ea1009  ! 1464: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe1220009  ! 1467: STF_R	st	%f16, [%r9, %r8]
	.word 0xf44a0009  ! 1467: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0x8da20829  ! 1467: FADDs	fadds	%f8, %f9, %f6
	.word 0xca720009  ! 1470: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 1470: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8a720009  ! 1470: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xc33a0009  ! 1473: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc020009  ! 1473: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 1473: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfb220009  ! 1476: STF_R	st	%f29, [%r9, %r8]
	.word 0xf24a0009  ! 1476: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xdc0a0009  ! 1476: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xc93a0009  ! 1479: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc120009  ! 1479: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8c4a0009  ! 1479: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xc8220009  ! 1482: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 1482: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xca821009  ! 1482: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xe8220009  ! 1485: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc20a0009  ! 1485: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xca821009  ! 1485: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xe93a0009  ! 1488: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc41a0009  ! 1488: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143e06a  ! 1488: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xd9220009  ! 1491: STF_R	st	%f12, [%r9, %r8]
	.word 0xfe520009  ! 1491: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xceea1009  ! 1491: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xce220009  ! 1494: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xee420009  ! 1494: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xc6fa1009  ! 1494: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 1497: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc6120009  ! 1497: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc8b22598  ! 1497: STHA_I	stha	%r4, [%r8 + 0x0598] %asi
	.word 0xe13a0009  ! 1500: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc64a0009  ! 1500: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcd3a2da8  ! 1500: STDF_I	std	%f6, [0x0da8, %r8]
	.word 0xf8320009  ! 1503: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xfc1a0009  ! 1503: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xcc1a2308  ! 1503: LDD_I	ldd	[%r8 + 0x0308], %r6
	.word 0xfe320009  ! 1506: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xdc420009  ! 1506: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xc7220009  ! 1506: STF_R	st	%f3, [%r9, %r8]
	.word 0xc93a0009  ! 1509: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcd020009  ! 1509: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8ba208a9  ! 1509: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xed220009  ! 1512: STF_R	st	%f22, [%r9, %r8]
	.word 0xc8020009  ! 1512: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc8a21009  ! 1512: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xd6320009  ! 1515: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc7020009  ! 1515: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc3ea1009  ! 1515: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xec720009  ! 1518: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc01a0009  ! 1518: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc27a0009  ! 1518: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xfd3a0009  ! 1521: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc41a0009  ! 1521: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1521: STBAR	stbar
	.word 0xc2720009  ! 1524: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 1524: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xccfa1009  ! 1524: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 1527: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc7020009  ! 1527: LDF_R	ld	[%r8, %r9], %f3
	.word 0x06800001  ! 1527: BL	bl  	<label_0x1>
	.word 0xdd220009  ! 1530: STF_R	st	%f14, [%r9, %r8]
	.word 0xe85a0009  ! 1530: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xc6020009  ! 1530: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xfe220009  ! 1533: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xcc4a0009  ! 1533: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xb67a0009  ! 1533: SDIV_R	sdiv 	%r8, %r9, %r27
	.word 0xc93a0009  ! 1536: STDF_R	std	%f4, [%r9, %r8]
	.word 0xdd1a0009  ! 1536: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xc3ea2fb8  ! 1536: PREFETCHA_I	prefetcha	[%r8, + 0x0fb8] %asi, #one_read
	.word 0xf8320009  ! 1539: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc4020009  ! 1539: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x825a0009  ! 1539: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xd8320009  ! 1542: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xfc1a0009  ! 1542: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x88da24c4  ! 1542: SMULcc_I	smulcc 	%r8, 0x04c4, %r4
	.word 0xc4220009  ! 1545: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xff1a0009  ! 1545: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0x3a800002  ! 1545: BCC	bcc,a	<label_0x2>
	.word 0xce320009  ! 1548: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc24a0009  ! 1548: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc5e21009  ! 1548: CASA_I	casa	[%r8] 0x80, %r9, %r2
	.word 0xc4720009  ! 1551: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4520009  ! 1551: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x38800001  ! 1551: BGU	bgu,a	<label_0x1>
	.word 0xcc220009  ! 1554: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc60a0009  ! 1554: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xaf6a2004  ! 1554: SDIVX_I	sdivx	%r8, 0x0004, %r23
	.word 0xc5220009  ! 1557: STF_R	st	%f2, [%r9, %r8]
	.word 0xc84a0009  ! 1557: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xe05228c8  ! 1557: LDSH_I	ldsh	[%r8 + 0x08c8], %r16
	.word 0xc93a0009  ! 1560: STDF_R	std	%f4, [%r9, %r8]
	.word 0xda020009  ! 1560: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0x14800002  ! 1560: BG	bg  	<label_0x2>
	.word 0xc5220009  ! 1563: STF_R	st	%f2, [%r9, %r8]
	.word 0xc60a0009  ! 1563: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1563: STBAR	stbar
	.word 0xf73a0009  ! 1566: STDF_R	std	%f27, [%r9, %r8]
	.word 0xca020009  ! 1566: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x04800002  ! 1566: BLE	ble  	<label_0x2>
	.word 0xde320009  ! 1569: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xcc520009  ! 1569: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xad220009  ! 1569: MULScc_R	mulscc 	%r8, %r9, %r22
	.word 0xcd220009  ! 1572: STF_R	st	%f6, [%r9, %r8]
	.word 0xc4020009  ! 1572: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc6fa25c0  ! 1572: SWAPA_I	swapa	%r3, [%r8 + 0x05c0] %asi
	.word 0xc2720009  ! 1575: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc4120009  ! 1575: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 1575: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9220009  ! 1578: STF_R	st	%f4, [%r9, %r8]
	.word 0xc6520009  ! 1578: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 1578: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf220009  ! 1581: STF_R	st	%f7, [%r9, %r8]
	.word 0xc81a0009  ! 1581: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8efa0009  ! 1581: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xc2320009  ! 1584: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc01a0009  ! 1584: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x825a0009  ! 1584: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc4220009  ! 1587: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 1587: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 1587: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc82a0009  ! 1590: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfe520009  ! 1590: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xc3ea29b8  ! 1590: PREFETCHA_I	prefetcha	[%r8, + 0x09b8] %asi, #one_read
	.word 0xeb220009  ! 1593: STF_R	st	%f21, [%r9, %r8]
	.word 0xc41a0009  ! 1593: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xca6a2d3c  ! 1593: LDSTUB_I	ldstub	%r5, [%r8 + 0x0d3c]
	.word 0xc3220009  ! 1596: STF_R	st	%f1, [%r9, %r8]
	.word 0xc6420009  ! 1596: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xf80a2938  ! 1596: LDUB_I	ldub	[%r8 + 0x0938], %r28
	.word 0xee2a0009  ! 1599: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xcc4a0009  ! 1599: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x02ca0001  ! 1599: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xf8220009  ! 1602: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xca0a0009  ! 1602: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc36a200c  ! 1602: PREFETCH_I	prefetch	[%r8 + 0x000c], #one_read
	.word 0xe2720009  ! 1605: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xce420009  ! 1605: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc36a2e08  ! 1605: PREFETCH_I	prefetch	[%r8 + 0x0e08], #one_read
	.word 0xe1220009  ! 1608: STF_R	st	%f16, [%r9, %r8]
	.word 0xcf1a0009  ! 1608: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143e007  ! 1608: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xf7220009  ! 1611: STF_R	st	%f27, [%r9, %r8]
	.word 0xc5020009  ! 1611: LDF_R	ld	[%r8, %r9], %f2
	.word 0xe9f22009  ! 1611: CASXA_R	casxa	[%r8]%asi, %r9, %r20
	.word 0xc3220009  ! 1614: STF_R	st	%f1, [%r9, %r8]
	.word 0xfa420009  ! 1614: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xc3ea2e1c  ! 1614: PREFETCHA_I	prefetcha	[%r8, + 0x0e1c] %asi, #one_read
	.word 0xc53a0009  ! 1617: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc4420009  ! 1617: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc2ca1009  ! 1617: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xfc220009  ! 1620: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xe05a0009  ! 1620: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xc36a28fc  ! 1620: PREFETCH_I	prefetch	[%r8 + 0x08fc], #one_read
	.word 0xc6320009  ! 1623: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 1623: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8c4a2e08  ! 1623: MULX_I	mulx 	%r8, 0x0e08, %r6
	.word 0xfa2a0009  ! 1626: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc6520009  ! 1626: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x2c800001  ! 1626: BNEG	bneg,a	<label_0x1>
	.word 0xcc720009  ! 1629: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe40a0009  ! 1629: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x14800001  ! 1629: BG	bg  	<label_0x1>
	.word 0xc5220009  ! 1632: STF_R	st	%f2, [%r9, %r8]
	.word 0xce4a0009  ! 1632: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xe64a2e7c  ! 1632: LDSB_I	ldsb	[%r8 + 0x0e7c], %r19
	.word 0xc7220009  ! 1635: STF_R	st	%f3, [%r9, %r8]
	.word 0xc71a0009  ! 1635: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc36a0009  ! 1635: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6320009  ! 1638: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf41a0009  ! 1638: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xf8f22730  ! 1638: STXA_I	stxa	%r28, [%r8 + 0x0730] %asi
	.word 0xce320009  ! 1641: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4520009  ! 1641: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x22c20001  ! 1641: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xcb3a0009  ! 1644: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc40a0009  ! 1644: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcd220009  ! 1644: STF_R	st	%f6, [%r9, %r8]
	.word 0xf4320009  ! 1647: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc6420009  ! 1647: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 1647: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 1650: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc64a0009  ! 1650: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1650: STBAR	stbar
	.word 0xca2a0009  ! 1653: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 1653: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xe3f21009  ! 1653: CASXA_I	casxa	[%r8] 0x80, %r9, %r17
	.word 0xcc220009  ! 1656: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfa520009  ! 1656: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc3ea2a68  ! 1656: PREFETCHA_I	prefetcha	[%r8, + 0x0a68] %asi, #one_read
	.word 0xcd3a0009  ! 1659: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6120009  ! 1659: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xde921009  ! 1659: LDUHA_R	lduha	[%r8, %r9] 0x80, %r15
	.word 0xcc2a0009  ! 1662: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe11a0009  ! 1662: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xca5a25d0  ! 1662: LDX_I	ldx	[%r8 + 0x05d0], %r5
	.word 0xf2220009  ! 1665: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xe8420009  ! 1665: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xc4921009  ! 1665: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xd73a0009  ! 1668: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc2520009  ! 1668: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x84fa0009  ! 1668: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xca720009  ! 1671: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 1671: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xf2b22d94  ! 1671: STHA_I	stha	%r25, [%r8 + 0x0d94] %asi
	.word 0xca320009  ! 1674: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc85a0009  ! 1674: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8b6a0009  ! 1674: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xcc220009  ! 1677: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe00a0009  ! 1677: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xed1a2488  ! 1677: LDDF_I	ldd	[%r8, 0x0488], %f22
	.word 0xc7220009  ! 1680: STF_R	st	%f3, [%r9, %r8]
	.word 0xc65a0009  ! 1680: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1680: STBAR	stbar
	.word 0xe2320009  ! 1683: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xde420009  ! 1683: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xc3ea2190  ! 1683: PREFETCHA_I	prefetcha	[%r8, + 0x0190] %asi, #one_read
	.word 0xc2220009  ! 1686: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xec1a0009  ! 1686: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xa4da29e4  ! 1686: SMULcc_I	smulcc 	%r8, 0x09e4, %r18
	.word 0xc4720009  ! 1689: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 1689: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x885a208c  ! 1689: SMUL_I	smul 	%r8, 0x008c, %r4
	.word 0xca720009  ! 1692: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 1692: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xbe4a25f8  ! 1692: MULX_I	mulx 	%r8, 0x05f8, %r31
	.word 0xc53a0009  ! 1695: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc65a0009  ! 1695: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xccfa2424  ! 1695: SWAPA_I	swapa	%r6, [%r8 + 0x0424] %asi
	.word 0xda220009  ! 1698: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc7020009  ! 1698: LDF_R	ld	[%r8, %r9], %f3
	.word 0x88d20009  ! 1698: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xcf3a0009  ! 1701: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf6420009  ! 1701: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xc3f22009  ! 1701: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xce320009  ! 1704: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 1704: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc3ea1009  ! 1704: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2320009  ! 1707: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xdf1a0009  ! 1707: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xc66a0009  ! 1707: LDSTUB_R	ldstub	%r3, [%r8 + %r9]
	.word 0xc82a0009  ! 1710: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc65a0009  ! 1710: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x06ca0001  ! 1710: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc4720009  ! 1713: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcf020009  ! 1713: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc3ea2cb8  ! 1713: PREFETCHA_I	prefetcha	[%r8, + 0x0cb8] %asi, #one_read
	.word 0xce220009  ! 1716: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4020009  ! 1716: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x3e800002  ! 1716: BVC	bvc,a	<label_0x2>
	.word 0xc6720009  ! 1719: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xfc020009  ! 1719: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xc36a0009  ! 1719: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca320009  ! 1722: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcf1a0009  ! 1722: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143c000  ! 1722: STBAR	stbar
	.word 0xca320009  ! 1725: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 1725: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xdcba2330  ! 1725: STDA_I	stda	%r14, [%r8 + 0x0330] %asi
	.word 0xcc720009  ! 1728: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 1728: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143e027  ! 1728: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xca720009  ! 1731: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 1731: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x83a208a9  ! 1731: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xf9220009  ! 1734: STF_R	st	%f28, [%r9, %r8]
	.word 0xc41a0009  ! 1734: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc36a262c  ! 1734: PREFETCH_I	prefetch	[%r8 + 0x062c], #one_read
	.word 0xcd220009  ! 1737: STF_R	st	%f6, [%r9, %r8]
	.word 0xcf1a0009  ! 1737: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8fa209a9  ! 1737: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xfc320009  ! 1740: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc65a0009  ! 1740: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143e070  ! 1740: MEMBAR	membar	#Lookaside | #MemIssue | #Sync 
	.word 0xc4220009  ! 1743: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xdc520009  ! 1743: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x40000001  ! 1743: CALL	call	disp30_1
	.word 0xf62a0009  ! 1746: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc8420009  ! 1746: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc70222f0  ! 1746: LDF_I	ld	[%r8, 0x02f0], %f3
	.word 0xf8320009  ! 1749: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xd85a0009  ! 1749: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xc87a0009  ! 1749: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xcc720009  ! 1752: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 1752: LDF_R	ld	[%r8, %r9], %f4
	.word 0xe8022fdc  ! 1752: LDUW_I	lduw	[%r8 + 0x0fdc], %r20
	.word 0xce720009  ! 1755: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc81a0009  ! 1755: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcd3a2d20  ! 1755: STDF_I	std	%f6, [0x0d20, %r8]
	.word 0xce2a0009  ! 1758: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 1758: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xbd6a0009  ! 1758: SDIVX_R	sdivx	%r8, %r9, %r30
	.word 0xd6720009  ! 1761: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc8420009  ! 1761: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe8f21009  ! 1761: STXA_R	stxa	%r20, [%r8 + %r9] 0x80
	.word 0xca320009  ! 1764: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc8020009  ! 1764: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8143e01c  ! 1764: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xc53a0009  ! 1767: STDF_R	std	%f2, [%r9, %r8]
	.word 0xfc1a0009  ! 1767: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x89a20829  ! 1767: FADDs	fadds	%f8, %f9, %f4
	.word 0xf53a0009  ! 1770: STDF_R	std	%f26, [%r9, %r8]
	.word 0xcf1a0009  ! 1770: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc2fa1009  ! 1770: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xf6720009  ! 1773: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc4520009  ! 1773: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 1773: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc5220009  ! 1776: STF_R	st	%f2, [%r9, %r8]
	.word 0xca5a0009  ! 1776: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc28a2428  ! 1776: LDUBA_I	lduba	[%r8, + 0x0428] %asi, %r1
	.word 0xc4220009  ! 1779: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe2020009  ! 1779: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xe40a2204  ! 1779: LDUB_I	ldub	[%r8 + 0x0204], %r18
	.word 0xd8320009  ! 1782: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xe41a0009  ! 1782: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc3ea25ec  ! 1782: PREFETCHA_I	prefetcha	[%r8, + 0x05ec] %asi, #one_read
	.word 0xcd3a0009  ! 1785: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf60a0009  ! 1785: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0x8143c000  ! 1785: STBAR	stbar
	.word 0xc8720009  ! 1788: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 1788: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc68a252c  ! 1788: LDUBA_I	lduba	[%r8, + 0x052c] %asi, %r3
	.word 0xc82a0009  ! 1791: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xda120009  ! 1791: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xc36a0009  ! 1791: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc720009  ! 1794: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf6520009  ! 1794: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xc93a0009  ! 1794: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcb3a0009  ! 1797: STDF_R	std	%f5, [%r9, %r8]
	.word 0xed1a0009  ! 1797: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0x84520009  ! 1797: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xc8320009  ! 1800: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 1800: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1800: STBAR	stbar
	.word 0xcb220009  ! 1803: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8120009  ! 1803: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc0ba1009  ! 1803: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 1806: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xec420009  ! 1806: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xc4f22b20  ! 1806: STXA_I	stxa	%r2, [%r8 + 0x0b20] %asi
	.word 0xc6720009  ! 1809: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe80a0009  ! 1809: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0x04800002  ! 1809: BLE	ble  	<label_0x2>
	.word 0xfe2a0009  ! 1812: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc01a0009  ! 1812: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x88da0009  ! 1812: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xc22a0009  ! 1815: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfa120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xc2b21009  ! 1815: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xda2a0009  ! 1818: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc8520009  ! 1818: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x12800001  ! 1818: BNE	bne  	<label_0x1>
	.word 0xc4720009  ! 1821: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce520009  ! 1821: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc6aa1009  ! 1821: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 1824: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc51a0009  ! 1824: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc36a0009  ! 1824: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca2a0009  ! 1827: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc7020009  ! 1827: LDF_R	ld	[%r8, %r9], %f3
	.word 0x82722f70  ! 1827: UDIV_I	udiv 	%r8, 0x0f70, %r1
	.word 0xc6320009  ! 1830: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc2020009  ! 1830: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc46a0009  ! 1830: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xe82a0009  ! 1833: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc84a0009  ! 1833: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8d222f58  ! 1833: MULScc_I	mulscc 	%r8, 0x0f58, %r6
	.word 0xcc220009  ! 1836: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 1836: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x89a20829  ! 1836: FADDs	fadds	%f8, %f9, %f4
	.word 0xc4220009  ! 1839: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce420009  ! 1839: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x87222fe8  ! 1839: MULScc_I	mulscc 	%r8, 0x0fe8, %r3
	.word 0xdf220009  ! 1842: STF_R	st	%f15, [%r9, %r8]
	.word 0xcf1a0009  ! 1842: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc4a22294  ! 1842: STWA_I	stwa	%r2, [%r8 + 0x0294] %asi
	.word 0xc5220009  ! 1845: STF_R	st	%f2, [%r9, %r8]
	.word 0xc81a0009  ! 1845: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xa5a209a9  ! 1845: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xdc220009  ! 1848: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xf85a0009  ! 1848: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0x85a20929  ! 1848: FMULs	fmuls	%f8, %f9, %f2
	.word 0xec2a0009  ! 1851: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xfa5a0009  ! 1851: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc9f22009  ! 1851: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xfa220009  ! 1854: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xcc420009  ! 1854: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcefa25d8  ! 1854: SWAPA_I	swapa	%r7, [%r8 + 0x05d8] %asi
	.word 0xc62a0009  ! 1857: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc71a0009  ! 1857: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x88720009  ! 1857: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xcd220009  ! 1860: STF_R	st	%f6, [%r9, %r8]
	.word 0xc4020009  ! 1860: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc84221a8  ! 1860: LDSW_I	ldsw	[%r8 + 0x01a8], %r4
	.word 0xcc2a0009  ! 1863: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 1863: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xba4a20b0  ! 1863: MULX_I	mulx 	%r8, 0x00b0, %r29
	.word 0xc33a0009  ! 1866: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc01a0009  ! 1866: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x22800002  ! 1866: BE	be,a	<label_0x2>
	.word 0xcc320009  ! 1869: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xd6020009  ! 1869: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0xec4a2918  ! 1869: LDSB_I	ldsb	[%r8 + 0x0918], %r22
	.word 0xcd3a0009  ! 1872: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca0a0009  ! 1872: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x0aca0001  ! 1872: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xc4220009  ! 1875: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 1875: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xec120009  ! 1875: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xc62a0009  ! 1878: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc6120009  ! 1878: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc36a2578  ! 1878: PREFETCH_I	prefetch	[%r8 + 0x0578], #one_read
	.word 0xf7220009  ! 1881: STF_R	st	%f27, [%r9, %r8]
	.word 0xdb1a0009  ! 1881: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xaada2310  ! 1881: SMULcc_I	smulcc 	%r8, 0x0310, %r21
	.word 0xcb3a0009  ! 1884: STDF_R	std	%f5, [%r9, %r8]
	.word 0xda4a0009  ! 1884: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xeeda2798  ! 1884: LDXA_I	ldxa	[%r8, + 0x0798] %asi, %r23
	.word 0xc93a0009  ! 1887: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcb020009  ! 1887: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143e012  ! 1887: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xf53a0009  ! 1890: STDF_R	std	%f26, [%r9, %r8]
	.word 0xcd1a0009  ! 1890: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xccf21009  ! 1890: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc62a0009  ! 1893: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc65a0009  ! 1893: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc36a2490  ! 1893: PREFETCH_I	prefetch	[%r8 + 0x0490], #one_read
	.word 0xc53a0009  ! 1896: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe0120009  ! 1896: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0x8143c000  ! 1896: STBAR	stbar
	.word 0xc2220009  ! 1899: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 1899: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 1899: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc82a0009  ! 1902: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 1902: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x836a0009  ! 1902: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xcc220009  ! 1905: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfb1a0009  ! 1905: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0x8d6a0009  ! 1905: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc33a0009  ! 1908: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf6020009  ! 1908: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xf0b22338  ! 1908: STHA_I	stha	%r24, [%r8 + 0x0338] %asi
	.word 0xc7220009  ! 1911: STF_R	st	%f3, [%r9, %r8]
	.word 0xc2020009  ! 1911: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc41220f4  ! 1911: LDUH_I	lduh	[%r8 + 0x00f4], %r2
	.word 0xdc320009  ! 1914: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc3020009  ! 1914: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcc9a27d0  ! 1914: LDDA_I	ldda	[%r8, + 0x07d0] %asi, %r6
	.word 0xc6720009  ! 1917: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 1917: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 1917: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf2720009  ! 1920: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xed020009  ! 1920: LDF_R	ld	[%r8, %r9], %f22
	.word 0x88da2540  ! 1920: SMULcc_I	smulcc 	%r8, 0x0540, %r4
	.word 0xde320009  ! 1923: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc81a0009  ! 1923: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x87220009  ! 1923: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xfe720009  ! 1926: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc01a0009  ! 1926: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc4ca2528  ! 1926: LDSBA_I	ldsba	[%r8, + 0x0528] %asi, %r2
	.word 0xc2220009  ! 1929: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc8420009  ! 1929: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x84da0009  ! 1929: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xf2720009  ! 1932: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc8120009  ! 1932: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc73a0009  ! 1932: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf53a0009  ! 1935: STDF_R	std	%f26, [%r9, %r8]
	.word 0xfc520009  ! 1935: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xdcb21009  ! 1935: STHA_R	stha	%r14, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 1938: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc80a0009  ! 1938: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc8a222fc  ! 1938: STWA_I	stwa	%r4, [%r8 + 0x02fc] %asi
	.word 0xee720009  ! 1941: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xcb1a0009  ! 1941: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcea22f50  ! 1941: STWA_I	stwa	%r7, [%r8 + 0x0f50] %asi
	.word 0xcc320009  ! 1944: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc6120009  ! 1944: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8143e043  ! 1944: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xec220009  ! 1947: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xce520009  ! 1947: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc4420009  ! 1947: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc93a0009  ! 1950: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf64a0009  ! 1950: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xce122470  ! 1950: LDUH_I	lduh	[%r8 + 0x0470], %r7
	.word 0xc93a0009  ! 1953: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc420009  ! 1953: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x0eca0001  ! 1953: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc82a0009  ! 1956: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca5a0009  ! 1956: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xe7220009  ! 1956: STF_R	st	%f19, [%r9, %r8]
	.word 0xc73a0009  ! 1959: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc8120009  ! 1959: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xb2f2210c  ! 1959: UDIVcc_I	udivcc 	%r8, 0x010c, %r25
	.word 0xc8320009  ! 1962: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc31a0009  ! 1962: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x82da0009  ! 1962: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc8720009  ! 1965: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc24a0009  ! 1965: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc6f21009  ! 1965: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 1968: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 1968: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xd8d22480  ! 1968: LDSHA_I	ldsha	[%r8, + 0x0480] %asi, %r12
	.word 0xc4220009  ! 1971: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xd9020009  ! 1971: LDF_R	ld	[%r8, %r9], %f12
	.word 0xeef21009  ! 1971: STXA_R	stxa	%r23, [%r8 + %r9] 0x80
	.word 0xf0720009  ! 1974: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xcc420009  ! 1974: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143e06e  ! 1974: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xcc320009  ! 1977: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc7020009  ! 1977: LDF_R	ld	[%r8, %r9], %f3
	.word 0xccca2960  ! 1977: LDSBA_I	ldsba	[%r8, + 0x0960] %asi, %r6
	.word 0xc73a0009  ! 1980: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc1a0009  ! 1980: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 1980: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc93a0009  ! 1983: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc60a0009  ! 1983: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8143e058  ! 1983: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xd6220009  ! 1986: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc4420009  ! 1986: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1986: STBAR	stbar
	.word 0xe33a0009  ! 1989: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc51a0009  ! 1989: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xcf220009  ! 1989: STF_R	st	%f7, [%r9, %r8]
	.word 0xc9220009  ! 1992: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc520009  ! 1992: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc28225d0  ! 1992: LDUWA_I	lduwa	[%r8, + 0x05d0] %asi, %r1
	.word 0xc5220009  ! 1995: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4020009  ! 1995: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8a520009  ! 1995: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xd7220009  ! 1998: STF_R	st	%f11, [%r9, %r8]
	.word 0xda0a0009  ! 1998: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xc4a22b7c  ! 1998: STWA_I	stwa	%r2, [%r8 + 0x0b7c] %asi
	.word 0xc62a0009  ! 2001: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 2001: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xccc21009  ! 2001: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r6
	.word 0xce2a0009  ! 2004: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xff020009  ! 2004: LDF_R	ld	[%r8, %r9], %f31
	.word 0x8143c000  ! 2004: STBAR	stbar
	.word 0xc4720009  ! 2007: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 2007: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xd6fa1009  ! 2007: SWAPA_R	swapa	%r11, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 2010: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca120009  ! 2010: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8a7a0009  ! 2010: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xdc320009  ! 2013: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xe8520009  ! 2013: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x9cf2218c  ! 2013: UDIVcc_I	udivcc 	%r8, 0x018c, %r14
	.word 0xc93a0009  ! 2016: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc7020009  ! 2016: LDF_R	ld	[%r8, %r9], %f3
	.word 0xf67a27a8  ! 2016: SWAP_I	swap	%r27, [%r8 + 0x07a8]
	.word 0xec2a0009  ! 2019: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xca4a0009  ! 2019: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e001  ! 2019: MEMBAR	membar	#LoadLoad 
	.word 0xce220009  ! 2022: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf2420009  ! 2022: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xc2d21009  ! 2022: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xc5220009  ! 2025: STF_R	st	%f2, [%r9, %r8]
	.word 0xf11a0009  ! 2025: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xc8c22664  ! 2025: LDSWA_I	ldswa	[%r8, + 0x0664] %asi, %r4
	.word 0xc5220009  ! 2028: STF_R	st	%f2, [%r9, %r8]
	.word 0xce420009  ! 2028: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8143e022  ! 2028: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xf5220009  ! 2031: STF_R	st	%f26, [%r9, %r8]
	.word 0xcb1a0009  ! 2031: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc3ea1009  ! 2031: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6320009  ! 2034: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 2034: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x0ac20001  ! 2034: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xc53a0009  ! 2037: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf60a0009  ! 2037: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xb86a2504  ! 2037: UDIVX_I	udivx 	%r8, 0x0504, %r28
	.word 0xc8720009  ! 2040: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf7020009  ! 2040: LDF_R	ld	[%r8, %r9], %f27
	.word 0x88520009  ! 2040: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xca320009  ! 2043: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 2043: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc2b21009  ! 2043: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 2046: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe8020009  ! 2046: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc53a0009  ! 2046: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8720009  ! 2049: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 2049: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcaaa2b00  ! 2049: STBA_I	stba	%r5, [%r8 + 0x0b00] %asi
	.word 0xc2220009  ! 2052: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xdc520009  ! 2052: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0xca422990  ! 2052: LDSW_I	ldsw	[%r8 + 0x0990], %r5
	.word 0xc6320009  ! 2055: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 2055: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x9c4a0009  ! 2055: MULX_R	mulx 	%r8, %r9, %r14
	.word 0xc93a0009  ! 2058: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc40a0009  ! 2058: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc36a26bc  ! 2058: PREFETCH_I	prefetch	[%r8 + 0x06bc], #one_read
	.word 0xcf220009  ! 2061: STF_R	st	%f7, [%r9, %r8]
	.word 0xc8020009  ! 2061: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x18800001  ! 2061: BGU	bgu  	<label_0x1>
	.word 0xcd3a0009  ! 2064: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc4120009  ! 2064: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc4a22858  ! 2064: STWA_I	stwa	%r2, [%r8 + 0x0858] %asi
	.word 0xcf220009  ! 2067: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc0a0009  ! 2067: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc9f22009  ! 2067: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xce720009  ! 2070: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcd1a0009  ! 2070: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xcf220009  ! 2070: STF_R	st	%f7, [%r9, %r8]
	.word 0xc82a0009  ! 2073: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcd1a0009  ! 2073: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xab6a2734  ! 2073: SDIVX_I	sdivx	%r8, 0x0734, %r21
	.word 0xc82a0009  ! 2076: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 2076: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcb1a0009  ! 2076: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc73a0009  ! 2079: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca4a0009  ! 2079: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xde6a25e8  ! 2079: LDSTUB_I	ldstub	%r15, [%r8 + 0x05e8]
	.word 0xd6220009  ! 2082: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xca5a0009  ! 2082: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x04800001  ! 2082: BLE	ble  	<label_0x1>
	.word 0xfa320009  ! 2085: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xe44a0009  ! 2085: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xe8a22928  ! 2085: STWA_I	stwa	%r20, [%r8 + 0x0928] %asi
	.word 0xc2720009  ! 2088: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xff020009  ! 2088: LDF_R	ld	[%r8, %r9], %f31
	.word 0x86d22f9c  ! 2088: UMULcc_I	umulcc 	%r8, 0x0f9c, %r3
	.word 0xc6320009  ! 2091: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcb020009  ! 2091: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143c000  ! 2091: STBAR	stbar
	.word 0xca2a0009  ! 2094: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc20a0009  ! 2094: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc36a2098  ! 2094: PREFETCH_I	prefetch	[%r8 + 0x0098], #one_read
	.word 0xe22a0009  ! 2097: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xcc020009  ! 2097: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc3e22009  ! 2097: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xd6720009  ! 2100: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xcf020009  ! 2100: LDF_R	ld	[%r8, %r9], %f7
	.word 0x866a22f0  ! 2100: UDIVX_I	udivx 	%r8, 0x02f0, %r3
	.word 0xc4320009  ! 2103: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 2103: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2103: STBAR	stbar
	.word 0xc33a0009  ! 2106: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4520009  ! 2106: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xd8020009  ! 2106: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xc42a0009  ! 2109: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xdc1a0009  ! 2109: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x2a800001  ! 2109: BCS	bcs,a	<label_0x1>
	.word 0xcf3a0009  ! 2112: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfb020009  ! 2112: LDF_R	ld	[%r8, %r9], %f29
	.word 0x8143e024  ! 2112: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xe2320009  ! 2115: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xce4a0009  ! 2115: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xafa20829  ! 2115: FADDs	fadds	%f8, %f9, %f23
	.word 0xce2a0009  ! 2118: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 2118: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x2ec20001  ! 2118: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xc4320009  ! 2121: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca420009  ! 2121: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8c4a2b7c  ! 2121: MULX_I	mulx 	%r8, 0x0b7c, %r6
	.word 0xcc320009  ! 2124: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc60a0009  ! 2124: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xdf3a0009  ! 2124: STDF_R	std	%f15, [%r9, %r8]
	.word 0xce2a0009  ! 2127: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfc520009  ! 2127: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x866a0009  ! 2127: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc6220009  ! 2130: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf2520009  ! 2130: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x9af20009  ! 2130: UDIVcc_R	udivcc 	%r8, %r9, %r13
	.word 0xc2220009  ! 2133: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xeb1a0009  ! 2133: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0x04800001  ! 2133: BLE	ble  	<label_0x1>
	.word 0xea720009  ! 2136: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc8420009  ! 2136: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc2f22ce0  ! 2136: STXA_I	stxa	%r1, [%r8 + 0x0ce0] %asi
	.word 0xcf3a0009  ! 2139: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc520009  ! 2139: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2139: STBAR	stbar
	.word 0xe7220009  ! 2142: STF_R	st	%f19, [%r9, %r8]
	.word 0xd8120009  ! 2142: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xc6ca1009  ! 2142: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xf8320009  ! 2145: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xf24a0009  ! 2145: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0x8143e063  ! 2145: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue | #Sync 
	.word 0xfc320009  ! 2148: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc44a0009  ! 2148: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xdcba1009  ! 2148: STDA_R	stda	%r14, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 2151: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf85a0009  ! 2151: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xc3ea2d68  ! 2151: PREFETCHA_I	prefetcha	[%r8, + 0x0d68] %asi, #one_read
	.word 0xd6220009  ! 2154: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xe6520009  ! 2154: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xcca21009  ! 2154: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 2157: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf31a0009  ! 2157: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0xc36a2c98  ! 2157: PREFETCH_I	prefetch	[%r8 + 0x0c98], #one_read
	.word 0xc2320009  ! 2160: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe01a0009  ! 2160: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x8143e026  ! 2160: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xcf3a0009  ! 2163: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc1a0009  ! 2163: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc2f22a18  ! 2163: STXA_I	stxa	%r1, [%r8 + 0x0a18] %asi
	.word 0xc8720009  ! 2166: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce020009  ! 2166: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcdf22009  ! 2166: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xe53a0009  ! 2169: STDF_R	std	%f18, [%r9, %r8]
	.word 0xca020009  ! 2169: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8ed20009  ! 2169: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc4720009  ! 2172: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe40a0009  ! 2172: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xc2821009  ! 2172: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xc8220009  ! 2175: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 2175: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143e01c  ! 2175: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xc8720009  ! 2178: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc71a0009  ! 2178: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x82522b7c  ! 2178: UMUL_I	umul 	%r8, 0x0b7c, %r1
	.word 0xe8320009  ! 2181: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xca020009  ! 2181: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xf81a0009  ! 2181: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xd6220009  ! 2184: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc9020009  ! 2184: LDF_R	ld	[%r8, %r9], %f4
	.word 0xfde22009  ! 2184: CASA_R	casa	[%r8] %asi, %r9, %r30
	.word 0xcc2a0009  ! 2187: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc4020009  ! 2187: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x85a208a9  ! 2187: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xcb220009  ! 2190: STF_R	st	%f5, [%r9, %r8]
	.word 0xc41a0009  ! 2190: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x887a0009  ! 2190: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xf93a0009  ! 2193: STDF_R	std	%f28, [%r9, %r8]
	.word 0xc45a0009  ! 2193: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xe09a2e88  ! 2193: LDDA_I	ldda	[%r8, + 0x0e88] %asi, %r16
	.word 0xce320009  ! 2196: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 2196: LDF_R	ld	[%r8, %r9], %f6
	.word 0xcc1229a8  ! 2196: LDUH_I	lduh	[%r8 + 0x09a8], %r6
	.word 0xc6220009  ! 2199: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf04a0009  ! 2199: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xc3ea28fc  ! 2199: PREFETCHA_I	prefetcha	[%r8, + 0x08fc] %asi, #one_read
	.word 0xf2220009  ! 2202: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xce520009  ! 2202: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xbad22610  ! 2202: UMULcc_I	umulcc 	%r8, 0x0610, %r29
	.word 0xc82a0009  ! 2205: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc20a0009  ! 2205: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc36a2cd0  ! 2205: PREFETCH_I	prefetch	[%r8 + 0x0cd0], #one_read
	.word 0xcb220009  ! 2208: STF_R	st	%f5, [%r9, %r8]
	.word 0xc51a0009  ! 2208: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc3220009  ! 2208: STF_R	st	%f1, [%r9, %r8]
	.word 0xc73a0009  ! 2211: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc51a0009  ! 2211: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xe6520009  ! 2211: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xc22a0009  ! 2214: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 2214: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x1c800001  ! 2214: BPOS	bpos  	<label_0x1>
	.word 0xcb3a0009  ! 2217: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe2520009  ! 2217: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0x845a0009  ! 2217: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xc53a0009  ! 2220: STDF_R	std	%f2, [%r9, %r8]
	.word 0xea0a0009  ! 2220: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0x8143e06b  ! 2220: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xcf3a0009  ! 2223: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc8420009  ! 2223: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x89a20929  ! 2223: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc93a0009  ! 2226: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce0a0009  ! 2226: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc9e22009  ! 2226: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xec320009  ! 2229: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc6120009  ! 2229: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc8c21009  ! 2229: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc82a0009  ! 2232: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc65a0009  ! 2232: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcc6a2590  ! 2232: LDSTUB_I	ldstub	%r6, [%r8 + 0x0590]
	.word 0xfa2a0009  ! 2235: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xec020009  ! 2235: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xc60a0009  ! 2235: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc73a0009  ! 2238: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc420009  ! 2238: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 2238: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc5220009  ! 2241: STF_R	st	%f2, [%r9, %r8]
	.word 0xc2520009  ! 2241: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x864a28b0  ! 2241: MULX_I	mulx 	%r8, 0x08b0, %r3
	.word 0xe3220009  ! 2244: STF_R	st	%f17, [%r9, %r8]
	.word 0xfe4a0009  ! 2244: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0x2e800002  ! 2244: BVS	bvs,a	<label_0x2>
	.word 0xe0320009  ! 2247: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xfc1a0009  ! 2247: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x0a800001  ! 2247: BCS	bcs  	<label_0x1>
	.word 0xc82a0009  ! 2250: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce020009  ! 2250: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcaa21009  ! 2250: STWA_R	stwa	%r5, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 2253: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf8020009  ! 2253: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xc49a1009  ! 2253: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xce2a0009  ! 2256: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc420009  ! 2256: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x06800001  ! 2256: BL	bl  	<label_0x1>
	.word 0xde220009  ! 2259: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xdd1a0009  ! 2259: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xc3ea2cc4  ! 2259: PREFETCHA_I	prefetcha	[%r8, + 0x0cc4] %asi, #one_read
	.word 0xce2a0009  ! 2262: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc2520009  ! 2262: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8f6a2bd0  ! 2262: SDIVX_I	sdivx	%r8, 0x0bd0, %r7
	.word 0xf33a0009  ! 2265: STDF_R	std	%f25, [%r9, %r8]
	.word 0xcd020009  ! 2265: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc80a2fb4  ! 2265: LDUB_I	ldub	[%r8 + 0x0fb4], %r4
	.word 0xe8720009  ! 2268: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xe71a0009  ! 2268: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0x8a6a0009  ! 2268: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xc8720009  ! 2271: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xdf020009  ! 2271: LDF_R	ld	[%r8, %r9], %f15
	.word 0xcf222c2c  ! 2271: STF_I	st	%f7, [0x0c2c, %r8]
	.word 0xc42a0009  ! 2274: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 2274: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x9a5a2e14  ! 2274: SMUL_I	smul 	%r8, 0x0e14, %r13
	.word 0xce720009  ! 2277: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xfc0a0009  ! 2277: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xc89a1009  ! 2277: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xe4320009  ! 2280: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc7020009  ! 2280: LDF_R	ld	[%r8, %r9], %f3
	.word 0x04800001  ! 2280: BLE	ble  	<label_0x1>
	.word 0xfc720009  ! 2283: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc2420009  ! 2283: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xd4ba2d28  ! 2283: STDA_I	stda	%r10, [%r8 + 0x0d28] %asi
	.word 0xf6320009  ! 2286: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xca0a0009  ! 2286: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc6f21009  ! 2286: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 2289: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc420009  ! 2289: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc6d21009  ! 2289: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r3
	.word 0xfe320009  ! 2292: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xda0a0009  ! 2292: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0x836a2a1c  ! 2292: SDIVX_I	sdivx	%r8, 0x0a1c, %r1
	.word 0xc4320009  ! 2295: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 2295: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xfcca2c60  ! 2295: LDSBA_I	ldsba	[%r8, + 0x0c60] %asi, %r30
	.word 0xda2a0009  ! 2298: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc4120009  ! 2298: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2298: STBAR	stbar
	.word 0xe6220009  ! 2301: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xe3020009  ! 2301: LDF_R	ld	[%r8, %r9], %f17
	.word 0xc3ea1009  ! 2301: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc42a0009  ! 2304: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xda5a0009  ! 2304: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x8143e064  ! 2304: MEMBAR	membar	#LoadStore | #MemIssue | #Sync 
	.word 0xec720009  ! 2307: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc40a0009  ! 2307: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x86fa20d4  ! 2307: SDIVcc_I	sdivcc 	%r8, 0x00d4, %r3
	.word 0xcc320009  ! 2310: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 2310: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xfac21009  ! 2310: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r29
	.word 0xce220009  ! 2313: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf5020009  ! 2313: LDF_R	ld	[%r8, %r9], %f26
	.word 0xc5220009  ! 2313: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6320009  ! 2316: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce5a0009  ! 2316: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcc7a26e4  ! 2316: SWAP_I	swap	%r6, [%r8 + 0x06e4]
	.word 0xe8320009  ! 2319: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc81a0009  ! 2319: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2319: STBAR	stbar
	.word 0xc73a0009  ! 2322: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc020009  ! 2322: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x26800002  ! 2322: BL	bl,a	<label_0x2>
	.word 0xf3220009  ! 2325: STF_R	st	%f25, [%r9, %r8]
	.word 0xc64a0009  ! 2325: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc5022f2c  ! 2325: LDF_I	ld	[%r8, 0x0f2c], %f2
	.word 0xce320009  ! 2328: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xdc0a0009  ! 2328: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0x0e800002  ! 2328: BVS	bvs  	<label_0x2>
	.word 0xc6320009  ! 2331: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 2331: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc2522550  ! 2331: LDSH_I	ldsh	[%r8 + 0x0550], %r1
	.word 0xf0320009  ! 2334: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xce420009  ! 2334: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8b6a2c68  ! 2334: SDIVX_I	sdivx	%r8, 0x0c68, %r5
	.word 0xf82a0009  ! 2337: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xce5a0009  ! 2337: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcab21009  ! 2337: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 2340: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2020009  ! 2340: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xdaa22388  ! 2340: STWA_I	stwa	%r13, [%r8 + 0x0388] %asi
	.word 0xc4320009  ! 2343: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc80a0009  ! 2343: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x83a20829  ! 2343: FADDs	fadds	%f8, %f9, %f1
	.word 0xc53a0009  ! 2346: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe2120009  ! 2346: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0x885a0009  ! 2346: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xc9220009  ! 2349: STF_R	st	%f4, [%r9, %r8]
	.word 0xc9020009  ! 2349: LDF_R	ld	[%r8, %r9], %f4
	.word 0xcb1a2478  ! 2349: LDDF_I	ldd	[%r8, 0x0478], %f5
	.word 0xcc220009  ! 2352: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe6420009  ! 2352: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xf0ba1009  ! 2352: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xc7220009  ! 2355: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc1a0009  ! 2355: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 2355: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce320009  ! 2358: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc85a0009  ! 2358: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2358: STBAR	stbar
	.word 0xd93a0009  ! 2361: STDF_R	std	%f12, [%r9, %r8]
	.word 0xce5a0009  ! 2361: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8afa0009  ! 2361: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc22a0009  ! 2364: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc2020009  ! 2364: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8a4a2784  ! 2364: MULX_I	mulx 	%r8, 0x0784, %r5
	.word 0xf6320009  ! 2367: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc4020009  ! 2367: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xec821009  ! 2367: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r22
	.word 0xce320009  ! 2370: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc420009  ! 2370: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xdde21009  ! 2370: CASA_I	casa	[%r8] 0x80, %r9, %r14
	.word 0xc2320009  ! 2373: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 2373: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x24c20001  ! 2373: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xce320009  ! 2376: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 2376: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x2ac20001  ! 2376: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xc8220009  ! 2379: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc44a0009  ! 2379: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x3e800001  ! 2379: BVC	bvc,a	<label_0x1>
	.word 0xc22a0009  ! 2382: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe91a0009  ! 2382: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0x34800001  ! 2382: BG	bg,a	<label_0x1>
	.word 0xed3a0009  ! 2385: STDF_R	std	%f22, [%r9, %r8]
	.word 0xcb1a0009  ! 2385: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc73a23e0  ! 2385: STDF_I	std	%f3, [0x03e0, %r8]
	.word 0xc8720009  ! 2388: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 2388: LDF_R	ld	[%r8, %r9], %f4
	.word 0xe4b22a40  ! 2388: STHA_I	stha	%r18, [%r8 + 0x0a40] %asi
	.word 0xc6220009  ! 2391: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca120009  ! 2391: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc80a0009  ! 2391: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc7220009  ! 2394: STF_R	st	%f3, [%r9, %r8]
	.word 0xe84a0009  ! 2394: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0x8c5a0009  ! 2394: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc2320009  ! 2397: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe85a0009  ! 2397: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xca6a0009  ! 2397: LDSTUB_R	ldstub	%r5, [%r8 + %r9]
	.word 0xcd3a0009  ! 2400: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf85a0009  ! 2400: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xccb22aa4  ! 2400: STHA_I	stha	%r6, [%r8 + 0x0aa4] %asi
	.word 0xea2a0009  ! 2403: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xe4120009  ! 2403: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xa2fa24e0  ! 2403: SDIVcc_I	sdivcc 	%r8, 0x04e0, %r17
	.word 0xc7220009  ! 2406: STF_R	st	%f3, [%r9, %r8]
	.word 0xc7020009  ! 2406: LDF_R	ld	[%r8, %r9], %f3
	.word 0xb25a0009  ! 2406: SMUL_R	smul 	%r8, %r9, %r25
	.word 0xcf220009  ! 2409: STF_R	st	%f7, [%r9, %r8]
	.word 0xca020009  ! 2409: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xd9222380  ! 2409: STF_I	st	%f12, [0x0380, %r8]
	.word 0xc2720009  ! 2412: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc01a0009  ! 2412: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8143c000  ! 2412: STBAR	stbar
	.word 0xcd3a0009  ! 2415: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe6420009  ! 2415: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xc36a2c60  ! 2415: PREFETCH_I	prefetch	[%r8 + 0x0c60], #one_read
	.word 0xc8220009  ! 2418: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc4020009  ! 2418: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xcaca1009  ! 2418: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xca320009  ! 2421: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xdc1a0009  ! 2421: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x8cfa0009  ! 2421: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xdc2a0009  ! 2424: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xcc020009  ! 2424: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x0cc20001  ! 2424: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xc6720009  ! 2427: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 2427: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143e012  ! 2427: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xc6320009  ! 2430: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce520009  ! 2430: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xbe722784  ! 2430: UDIV_I	udiv 	%r8, 0x0784, %r31
	.word 0xcb220009  ! 2433: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc0a0009  ! 2433: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xdaaa272c  ! 2433: STBA_I	stba	%r13, [%r8 + 0x072c] %asi
	.word 0xcc220009  ! 2436: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc84a0009  ! 2436: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8e7a2c40  ! 2436: SDIV_I	sdiv 	%r8, 0x0c40, %r7
	.word 0xc33a0009  ! 2439: STDF_R	std	%f1, [%r9, %r8]
	.word 0xd80a0009  ! 2439: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0x40000001  ! 2439: CALL	call	disp30_1
	.word 0xe73a0009  ! 2442: STDF_R	std	%f19, [%r9, %r8]
	.word 0xca420009  ! 2442: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc85a20e0  ! 2442: LDX_I	ldx	[%r8 + 0x00e0], %r4
	.word 0xd7220009  ! 2445: STF_R	st	%f11, [%r9, %r8]
	.word 0xc41a0009  ! 2445: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc6c21009  ! 2445: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xce2a0009  ! 2448: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf80a0009  ! 2448: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x8e4a0009  ! 2448: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xde220009  ! 2451: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc51a0009  ! 2451: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xd8da1009  ! 2451: LDXA_R	ldxa	[%r8, %r9] 0x80, %r12
	.word 0xe8220009  ! 2454: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xde020009  ! 2454: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xc51a2248  ! 2454: LDDF_I	ldd	[%r8, 0x0248], %f2
	.word 0xce2a0009  ! 2457: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce120009  ! 2457: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc89a1009  ! 2457: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xca320009  ! 2460: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 2460: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xe8fa1009  ! 2460: SWAPA_R	swapa	%r20, [%r8 + %r9] 0x80
	.word 0xea720009  ! 2463: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc3020009  ! 2463: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcaf22da0  ! 2463: STXA_I	stxa	%r5, [%r8 + 0x0da0] %asi
	.word 0xc4320009  ! 2466: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc5020009  ! 2466: LDF_R	ld	[%r8, %r9], %f2
	.word 0xf2b21009  ! 2466: STHA_R	stha	%r25, [%r8 + %r9] 0x80
	.word 0xfe2a0009  ! 2469: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xe5020009  ! 2469: LDF_R	ld	[%r8, %r9], %f18
	.word 0x8143c000  ! 2469: STBAR	stbar
	.word 0xcf220009  ! 2472: STF_R	st	%f7, [%r9, %r8]
	.word 0xcb1a0009  ! 2472: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xa5a20929  ! 2472: FMULs	fmuls	%f8, %f9, %f18
	.word 0xca2a0009  ! 2475: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf6520009  ! 2475: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xc8921009  ! 2475: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xc82a0009  ! 2478: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc85a0009  ! 2478: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xe87a0009  ! 2478: SWAP_R	swap	%r20, [%r8 + %r9]
	.word 0xe62a0009  ! 2481: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc81a0009  ! 2481: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xb5222824  ! 2481: MULScc_I	mulscc 	%r8, 0x0824, %r26
	.word 0xc8320009  ! 2484: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf8520009  ! 2484: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0x8c720009  ! 2484: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xcc320009  ! 2487: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc1a0009  ! 2487: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xceea2180  ! 2487: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0180] %asi
	.word 0xc53a0009  ! 2490: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc1a0009  ! 2490: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xcaca22d4  ! 2490: LDSBA_I	ldsba	[%r8, + 0x02d4] %asi, %r5
	.word 0xc2720009  ! 2493: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xea520009  ! 2493: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0x82da231c  ! 2493: SMULcc_I	smulcc 	%r8, 0x031c, %r1
	.word 0xcf220009  ! 2496: STF_R	st	%f7, [%r9, %r8]
	.word 0xc45a0009  ! 2496: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143e047  ! 2496: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xc93a0009  ! 2499: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf4420009  ! 2499: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc27a0009  ! 2499: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xc6720009  ! 2502: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 2502: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x86f223b8  ! 2502: UDIVcc_I	udivcc 	%r8, 0x03b8, %r3
	.word 0xca220009  ! 2505: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca5a0009  ! 2505: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8143c000  ! 2505: STBAR	stbar
	.word 0xe4220009  ! 2508: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc8420009  ! 2508: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc31a0009  ! 2508: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc73a0009  ! 2511: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4120009  ! 2511: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2511: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc73a0009  ! 2514: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf81a0009  ! 2514: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xbe7a2498  ! 2514: SDIV_I	sdiv 	%r8, 0x0498, %r31
	.word 0xcc320009  ! 2517: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf00a0009  ! 2517: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0x83220009  ! 2517: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xce320009  ! 2520: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xfe520009  ! 2520: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xcb1a0009  ! 2520: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xe6220009  ! 2523: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc40a0009  ! 2523: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc20a0009  ! 2523: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcb220009  ! 2526: STF_R	st	%f5, [%r9, %r8]
	.word 0xdf020009  ! 2526: LDF_R	ld	[%r8, %r9], %f15
	.word 0x8143e05c  ! 2526: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xce720009  ! 2529: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf8120009  ! 2529: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xde8a250c  ! 2529: LDUBA_I	lduba	[%r8, + 0x050c] %asi, %r15
	.word 0xc8220009  ! 2532: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 2532: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc36a0009  ! 2532: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce2a0009  ! 2535: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf5020009  ! 2535: LDF_R	ld	[%r8, %r9], %f26
	.word 0xd8fa1009  ! 2535: SWAPA_R	swapa	%r12, [%r8 + %r9] 0x80
	.word 0xdf220009  ! 2538: STF_R	st	%f15, [%r9, %r8]
	.word 0xfc520009  ! 2538: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xcada2218  ! 2538: LDXA_I	ldxa	[%r8, + 0x0218] %asi, %r5
	.word 0xce720009  ! 2541: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe4120009  ! 2541: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xc24a2db8  ! 2541: LDSB_I	ldsb	[%r8 + 0x0db8], %r1
	.word 0xc82a0009  ! 2544: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 2544: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 2544: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf0220009  ! 2547: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc6020009  ! 2547: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc31a0009  ! 2547: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xca220009  ! 2550: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 2550: LDF_R	ld	[%r8, %r9], %f1
	.word 0x83a209a9  ! 2550: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc6320009  ! 2553: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc7020009  ! 2553: LDF_R	ld	[%r8, %r9], %f3
	.word 0xf2aa1009  ! 2553: STBA_R	stba	%r25, [%r8 + %r9] 0x80
	.word 0xe8720009  ! 2556: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc3020009  ! 2556: LDF_R	ld	[%r8, %r9], %f1
	.word 0xce7a0009  ! 2556: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xec220009  ! 2559: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc51a0009  ! 2559: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xce520009  ! 2559: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcc220009  ! 2562: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfa0a0009  ! 2562: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xc3ea2098  ! 2562: PREFETCHA_I	prefetcha	[%r8, + 0x0098] %asi, #one_read
	.word 0xfe2a0009  ! 2565: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xdb020009  ! 2565: LDF_R	ld	[%r8, %r9], %f13
	.word 0x8143e023  ! 2565: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xc5220009  ! 2568: STF_R	st	%f2, [%r9, %r8]
	.word 0xfe520009  ! 2568: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xc36a0009  ! 2568: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe42a0009  ! 2571: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc60a0009  ! 2571: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea26f4  ! 2571: PREFETCHA_I	prefetcha	[%r8, + 0x06f4] %asi, #one_read
	.word 0xe4320009  ! 2574: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc8520009  ! 2574: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc36a2500  ! 2574: PREFETCH_I	prefetch	[%r8 + 0x0500], #one_read
	.word 0xc4720009  ! 2577: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe64a0009  ! 2577: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc81a0009  ! 2577: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xce720009  ! 2580: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 2580: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc8120009  ! 2580: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xca320009  ! 2583: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca520009  ! 2583: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8ada2fd8  ! 2583: SMULcc_I	smulcc 	%r8, 0x0fd8, %r5
	.word 0xc93a0009  ! 2586: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfa5a0009  ! 2586: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x8143e06b  ! 2586: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc2220009  ! 2589: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 2589: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xdff21009  ! 2589: CASXA_I	casxa	[%r8] 0x80, %r9, %r15
	.word 0xce220009  ! 2592: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 2592: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xca020009  ! 2592: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xde2a0009  ! 2595: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xe11a0009  ! 2595: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0x3c800001  ! 2595: BPOS	bpos,a	<label_0x1>
	.word 0xc53a0009  ! 2598: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce0a0009  ! 2598: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x84720009  ! 2598: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xcc320009  ! 2601: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf24a0009  ! 2601: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xc3ea1009  ! 2601: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc42a0009  ! 2604: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc71a0009  ! 2604: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xfa7a2be8  ! 2604: SWAP_I	swap	%r29, [%r8 + 0x0be8]
	.word 0xc33a0009  ! 2607: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf4520009  ! 2607: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x8e4a0009  ! 2607: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xce320009  ! 2610: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf8420009  ! 2610: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xc4a21009  ! 2610: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 2613: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce0a0009  ! 2613: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x3e800001  ! 2613: BVC	bvc,a	<label_0x1>
	.word 0xc8720009  ! 2616: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4020009  ! 2616: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc4022aec  ! 2616: LDUW_I	lduw	[%r8 + 0x0aec], %r2
	.word 0xd82a0009  ! 2619: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xce420009  ! 2619: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc4ca24b4  ! 2619: LDSBA_I	ldsba	[%r8, + 0x04b4] %asi, %r2
	.word 0xc7220009  ! 2622: STF_R	st	%f3, [%r9, %r8]
	.word 0xca120009  ! 2622: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 2622: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xea2a0009  ! 2625: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xfa420009  ! 2625: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xc9020009  ! 2625: LDF_R	ld	[%r8, %r9], %f4
	.word 0xfe720009  ! 2628: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xce420009  ! 2628: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xf08a1009  ! 2628: LDUBA_R	lduba	[%r8, %r9] 0x80, %r24
	.word 0xc6720009  ! 2631: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 2631: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc3ea2eb0  ! 2631: PREFETCHA_I	prefetcha	[%r8, + 0x0eb0] %asi, #one_read
	.word 0xc2320009  ! 2634: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce420009  ! 2634: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xf73a0009  ! 2634: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc8720009  ! 2637: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xea520009  ! 2637: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xc53a27c8  ! 2637: STDF_I	std	%f2, [0x07c8, %r8]
	.word 0xc7220009  ! 2640: STF_R	st	%f3, [%r9, %r8]
	.word 0xc64a0009  ! 2640: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143e04f  ! 2640: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc7220009  ! 2643: STF_R	st	%f3, [%r9, %r8]
	.word 0xeb1a0009  ! 2643: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xce6a0009  ! 2643: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xce320009  ! 2646: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf20a0009  ! 2646: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xa64a277c  ! 2646: MULX_I	mulx 	%r8, 0x077c, %r19
	.word 0xc4320009  ! 2649: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 2649: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8b6a29a8  ! 2649: SDIVX_I	sdivx	%r8, 0x09a8, %r5
	.word 0xc7220009  ! 2652: STF_R	st	%f3, [%r9, %r8]
	.word 0xce420009  ! 2652: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc6d2217c  ! 2652: LDSHA_I	ldsha	[%r8, + 0x017c] %asi, %r3
	.word 0xc7220009  ! 2655: STF_R	st	%f3, [%r9, %r8]
	.word 0xc2120009  ! 2655: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8eda0009  ! 2655: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xd82a0009  ! 2658: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xc8120009  ! 2658: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc6b22198  ! 2658: STHA_I	stha	%r3, [%r8 + 0x0198] %asi
	.word 0xe5220009  ! 2661: STF_R	st	%f18, [%r9, %r8]
	.word 0xe8020009  ! 2661: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xe4aa1009  ! 2661: STBA_R	stba	%r18, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 2664: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcd020009  ! 2664: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc4ca1009  ! 2664: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r2
	.word 0xef220009  ! 2667: STF_R	st	%f23, [%r9, %r8]
	.word 0xec5a0009  ! 2667: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0x02c20001  ! 2667: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xd8220009  ! 2670: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xc4020009  ! 2670: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc36a2060  ! 2670: PREFETCH_I	prefetch	[%r8 + 0x0060], #one_read
	.word 0xc8220009  ! 2673: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 2673: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x87222d00  ! 2673: MULScc_I	mulscc 	%r8, 0x0d00, %r3
	.word 0xf93a0009  ! 2676: STDF_R	std	%f28, [%r9, %r8]
	.word 0xce120009  ! 2676: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcc1a0009  ! 2676: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xce720009  ! 2679: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf5020009  ! 2679: LDF_R	ld	[%r8, %r9], %f26
	.word 0xbcda0009  ! 2679: SMULcc_R	smulcc 	%r8, %r9, %r30
	.word 0xc4720009  ! 2682: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 2682: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xce8a2610  ! 2682: LDUBA_I	lduba	[%r8, + 0x0610] %asi, %r7
	.word 0xc8220009  ! 2685: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xda120009  ! 2685: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x8143c000  ! 2685: STBAR	stbar
	.word 0xc93a0009  ! 2688: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc2520009  ! 2688: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8fa208a9  ! 2688: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xdf220009  ! 2691: STF_R	st	%f15, [%r9, %r8]
	.word 0xd65a0009  ! 2691: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0x85a208a9  ! 2691: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xf9220009  ! 2694: STF_R	st	%f28, [%r9, %r8]
	.word 0xc81a0009  ! 2694: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2694: STBAR	stbar
	.word 0xcd220009  ! 2697: STF_R	st	%f6, [%r9, %r8]
	.word 0xc3020009  ! 2697: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e000  ! 2697: MEMBAR	membar	
	.word 0xc6720009  ! 2700: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 2700: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea2cf0  ! 2700: PREFETCHA_I	prefetcha	[%r8, + 0x0cf0] %asi, #one_read
	.word 0xc33a0009  ! 2703: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf7020009  ! 2703: LDF_R	ld	[%r8, %r9], %f27
	.word 0xc2520009  ! 2703: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcc220009  ! 2706: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 2706: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc3ea2b28  ! 2706: PREFETCHA_I	prefetcha	[%r8, + 0x0b28] %asi, #one_read
	.word 0xc22a0009  ! 2709: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf85a0009  ! 2709: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xa7222a7c  ! 2709: MULScc_I	mulscc 	%r8, 0x0a7c, %r19
	.word 0xf62a0009  ! 2712: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xca520009  ! 2712: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xce7a2410  ! 2712: SWAP_I	swap	%r7, [%r8 + 0x0410]
	.word 0xc42a0009  ! 2715: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc31a0009  ! 2715: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8143e074  ! 2715: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xec2a0009  ! 2718: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xc6520009  ! 2718: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xbefa214c  ! 2718: SDIVcc_I	sdivcc 	%r8, 0x014c, %r31
	.word 0xcf3a0009  ! 2721: STDF_R	std	%f7, [%r9, %r8]
	.word 0xee5a0009  ! 2721: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xc60225c0  ! 2721: LDUW_I	lduw	[%r8 + 0x05c0], %r3
	.word 0xca2a0009  ! 2724: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd8420009  ! 2724: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xc3ea1009  ! 2724: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc62a0009  ! 2727: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca120009  ! 2727: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcd220009  ! 2727: STF_R	st	%f6, [%r9, %r8]
	.word 0xee2a0009  ! 2730: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xe45a0009  ! 2730: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xa96a0009  ! 2730: SDIVX_R	sdivx	%r8, %r9, %r20
	.word 0xc2220009  ! 2733: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 2733: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x85a209a9  ! 2733: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc7220009  ! 2736: STF_R	st	%f3, [%r9, %r8]
	.word 0xe81a0009  ! 2736: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xc71a0009  ! 2736: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc22a0009  ! 2739: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 2739: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xd89a2798  ! 2739: LDDA_I	ldda	[%r8, + 0x0798] %asi, %r12
	.word 0xc7220009  ! 2742: STF_R	st	%f3, [%r9, %r8]
	.word 0xc64a0009  ! 2742: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x32800001  ! 2742: BNE	bne,a	<label_0x1>
	.word 0xcf220009  ! 2745: STF_R	st	%f7, [%r9, %r8]
	.word 0xe4420009  ! 2745: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xce7a0009  ! 2745: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xee220009  ! 2748: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xf6420009  ! 2748: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x2c800001  ! 2748: BNEG	bneg,a	<label_0x1>
	.word 0xcc720009  ! 2751: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf4520009  ! 2751: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xc7f22009  ! 2751: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xce320009  ! 2754: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe4120009  ! 2754: LDUH_R	lduh	[%r8 + %r9], %r18
	.word 0xa4fa0009  ! 2754: SDIVcc_R	sdivcc 	%r8, %r9, %r18
	.word 0xc4720009  ! 2757: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcb1a0009  ! 2757: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcff22009  ! 2757: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xe22a0009  ! 2760: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xcc1a0009  ! 2760: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xccf21009  ! 2760: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xde720009  ! 2763: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xcc020009  ! 2763: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc89a1009  ! 2763: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xf93a0009  ! 2766: STDF_R	std	%f28, [%r9, %r8]
	.word 0xc44a0009  ! 2766: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8c4a2988  ! 2766: MULX_I	mulx 	%r8, 0x0988, %r6
	.word 0xe82a0009  ! 2769: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xf84a0009  ! 2769: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x82f22fe0  ! 2769: UDIVcc_I	udivcc 	%r8, 0x0fe0, %r1
	.word 0xce2a0009  ! 2772: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 2772: LDF_R	ld	[%r8, %r9], %f2
	.word 0x88f221d8  ! 2772: UDIVcc_I	udivcc 	%r8, 0x01d8, %r4
	.word 0xc5220009  ! 2775: STF_R	st	%f2, [%r9, %r8]
	.word 0xcb1a0009  ! 2775: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x40000001  ! 2775: CALL	call	disp30_1
	.word 0xea2a0009  ! 2778: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc4020009  ! 2778: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x3c800002  ! 2778: BPOS	bpos,a	<label_0x2>
	.word 0xda720009  ! 2781: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc31a0009  ! 2781: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xa47221f4  ! 2781: UDIV_I	udiv 	%r8, 0x01f4, %r18
	.word 0xf4220009  ! 2784: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xcb020009  ! 2784: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc8ba25e8  ! 2784: STDA_I	stda	%r4, [%r8 + 0x05e8] %asi
	.word 0xf4720009  ! 2787: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xcc020009  ! 2787: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x827a0009  ! 2787: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xcf220009  ! 2790: STF_R	st	%f7, [%r9, %r8]
	.word 0xfb1a0009  ! 2790: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xc8ba1009  ! 2790: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 2793: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe2020009  ! 2793: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0x83a208a9  ! 2793: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc3220009  ! 2796: STF_R	st	%f1, [%r9, %r8]
	.word 0xc2420009  ! 2796: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x86d22da0  ! 2796: UMULcc_I	umulcc 	%r8, 0x0da0, %r3
	.word 0xc5220009  ! 2799: STF_R	st	%f2, [%r9, %r8]
	.word 0xc91a0009  ! 2799: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xd6ea1009  ! 2799: LDSTUBA_R	ldstuba	%r11, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 2802: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfc0a0009  ! 2802: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xd60a2194  ! 2802: LDUB_I	ldub	[%r8 + 0x0194], %r11
	.word 0xca320009  ! 2805: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc85a0009  ! 2805: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8a520009  ! 2805: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc6720009  ! 2808: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 2808: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143e011  ! 2808: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xcc220009  ! 2811: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 2811: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcc4a0009  ! 2811: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcd3a0009  ! 2814: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce020009  ! 2814: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x2cc20001  ! 2814: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xcc320009  ! 2817: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf8520009  ! 2817: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xc4aa1009  ! 2817: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 2820: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc120009  ! 2820: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x85220009  ! 2820: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc33a0009  ! 2823: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc4a0009  ! 2823: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 2823: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xee2a0009  ! 2826: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xea5a0009  ! 2826: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x8143c000  ! 2826: STBAR	stbar
	.word 0xc5220009  ! 2829: STF_R	st	%f2, [%r9, %r8]
	.word 0xc45a0009  ! 2829: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x844a24ec  ! 2829: MULX_I	mulx 	%r8, 0x04ec, %r2
	.word 0xc53a0009  ! 2832: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc5020009  ! 2832: LDF_R	ld	[%r8, %r9], %f2
	.word 0x85222cf4  ! 2832: MULScc_I	mulscc 	%r8, 0x0cf4, %r2
	.word 0xc33a0009  ! 2835: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfb020009  ! 2835: LDF_R	ld	[%r8, %r9], %f29
	.word 0xaada2fb4  ! 2835: SMULcc_I	smulcc 	%r8, 0x0fb4, %r21
	.word 0xcf3a0009  ! 2838: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca520009  ! 2838: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x34800001  ! 2838: BG	bg,a	<label_0x1>
	.word 0xc33a0009  ! 2841: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc85a0009  ! 2841: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8da208a9  ! 2841: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xca320009  ! 2844: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 2844: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xcf22230c  ! 2844: STF_I	st	%f7, [0x030c, %r8]
	.word 0xcf220009  ! 2847: STF_R	st	%f7, [%r9, %r8]
	.word 0xcd020009  ! 2847: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143e028  ! 2847: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0xcb3a0009  ! 2850: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc65a0009  ! 2850: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x0e800002  ! 2850: BVS	bvs  	<label_0x2>
	.word 0xea720009  ! 2853: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc20a0009  ! 2853: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x2c800002  ! 2853: BNEG	bneg,a	<label_0x2>
	.word 0xcc2a0009  ! 2856: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfa4a0009  ! 2856: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0x0ac20001  ! 2856: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xe0720009  ! 2859: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xde420009  ! 2859: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0x1e800001  ! 2859: BVC	bvc  	<label_0x1>
	.word 0xce320009  ! 2862: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe01a0009  ! 2862: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x86fa0009  ! 2862: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xce720009  ! 2865: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xd6520009  ! 2865: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0x1e800001  ! 2865: BVC	bvc  	<label_0x1>
	.word 0xc3220009  ! 2868: STF_R	st	%f1, [%r9, %r8]
	.word 0xc41a0009  ! 2868: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x18800001  ! 2868: BGU	bgu  	<label_0x1>
	.word 0xc53a0009  ! 2871: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8520009  ! 2871: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xce420009  ! 2871: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xf7220009  ! 2874: STF_R	st	%f27, [%r9, %r8]
	.word 0xc85a0009  ! 2874: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8ba20929  ! 2874: FMULs	fmuls	%f8, %f9, %f5
	.word 0xcb3a0009  ! 2877: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf6020009  ! 2877: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xc24a26c8  ! 2877: LDSB_I	ldsb	[%r8 + 0x06c8], %r1
	.word 0xec220009  ! 2880: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xee5a0009  ! 2880: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xb86a2848  ! 2880: UDIVX_I	udivx 	%r8, 0x0848, %r28
	.word 0xc93a0009  ! 2883: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc4120009  ! 2883: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8c6a2e14  ! 2883: UDIVX_I	udivx 	%r8, 0x0e14, %r6
	.word 0xc42a0009  ! 2886: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xfe020009  ! 2886: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xc3222d80  ! 2886: STF_I	st	%f1, [0x0d80, %r8]
	.word 0xeb3a0009  ! 2889: STDF_R	std	%f21, [%r9, %r8]
	.word 0xde520009  ! 2889: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xcd1a2970  ! 2889: LDDF_I	ldd	[%r8, 0x0970], %f6
	.word 0xd93a0009  ! 2892: STDF_R	std	%f12, [%r9, %r8]
	.word 0xcd1a0009  ! 2892: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xccba2348  ! 2892: STDA_I	stda	%r6, [%r8 + 0x0348] %asi
	.word 0xcc220009  ! 2895: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 2895: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xeab22044  ! 2895: STHA_I	stha	%r21, [%r8 + 0x0044] %asi
	.word 0xdc2a0009  ! 2898: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc91a0009  ! 2898: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xacf20009  ! 2898: UDIVcc_R	udivcc 	%r8, %r9, %r22
	.word 0xf2720009  ! 2901: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc6520009  ! 2901: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x36800001  ! 2901: BGE	bge,a	<label_0x1>
	.word 0xce220009  ! 2904: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 2904: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x86fa2288  ! 2904: SDIVcc_I	sdivcc 	%r8, 0x0288, %r3
	.word 0xc4220009  ! 2907: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc44a0009  ! 2907: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 2907: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc42a0009  ! 2910: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf2420009  ! 2910: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xc5020009  ! 2910: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc7220009  ! 2913: STF_R	st	%f3, [%r9, %r8]
	.word 0xc25a0009  ! 2913: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x04ca0001  ! 2913: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xfe720009  ! 2916: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xcc1a0009  ! 2916: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xbeda2058  ! 2916: SMULcc_I	smulcc 	%r8, 0x0058, %r31
	.word 0xce2a0009  ! 2919: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 2919: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143e002  ! 2919: MEMBAR	membar	#StoreLoad 
	.word 0xcc2a0009  ! 2922: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf6420009  ! 2922: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xc3ea1009  ! 2922: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdb220009  ! 2925: STF_R	st	%f13, [%r9, %r8]
	.word 0xc51a0009  ! 2925: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x89a20929  ! 2925: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc42a0009  ! 2928: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xfb020009  ! 2928: LDF_R	ld	[%r8, %r9], %f29
	.word 0x84722974  ! 2928: UDIV_I	udiv 	%r8, 0x0974, %r2
	.word 0xc22a0009  ! 2931: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 2931: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2931: STBAR	stbar
	.word 0xca2a0009  ! 2934: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc520009  ! 2934: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x02800001  ! 2934: BE	be  	<label_0x1>
	.word 0xe8220009  ! 2937: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xf4120009  ! 2937: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xceea2d58  ! 2937: LDSTUBA_I	ldstuba	%r7, [%r8 + 0x0d58] %asi
	.word 0xf6220009  ! 2940: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xc6120009  ! 2940: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 2940: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8220009  ! 2943: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfa4a0009  ! 2943: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0x8f6a0009  ! 2943: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xc2220009  ! 2946: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xe5020009  ! 2946: LDF_R	ld	[%r8, %r9], %f18
	.word 0x88520009  ! 2946: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xce220009  ! 2949: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc0a0009  ! 2949: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xd41a2598  ! 2949: LDD_I	ldd	[%r8 + 0x0598], %r10
	.word 0xc8720009  ! 2952: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 2952: LDF_R	ld	[%r8, %r9], %f6
	.word 0x1a800001  ! 2952: BCC	bcc  	<label_0x1>
	.word 0xce320009  ! 2955: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca020009  ! 2955: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x18800001  ! 2955: BGU	bgu  	<label_0x1>
	.word 0xc5220009  ! 2958: STF_R	st	%f2, [%r9, %r8]
	.word 0xf0020009  ! 2958: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xa6da28d4  ! 2958: SMULcc_I	smulcc 	%r8, 0x08d4, %r19
	.word 0xe8220009  ! 2961: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc4420009  ! 2961: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xaefa2bcc  ! 2961: SDIVcc_I	sdivcc 	%r8, 0x0bcc, %r23
	.word 0xcc220009  ! 2964: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 2964: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8fa20929  ! 2964: FMULs	fmuls	%f8, %f9, %f7
	.word 0xde220009  ! 2967: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc4420009  ! 2967: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 2967: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb3a0009  ! 2970: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc020009  ! 2970: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 2970: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfd3a0009  ! 2973: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc81a0009  ! 2973: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xb6720009  ! 2973: UDIV_R	udiv 	%r8, %r9, %r27
	.word 0xc2220009  ! 2976: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xef1a0009  ! 2976: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0x18800002  ! 2976: BGU	bgu  	<label_0x2>
	.word 0xc62a0009  ! 2979: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf4120009  ! 2979: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xc8f21009  ! 2979: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 2982: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc5020009  ! 2982: LDF_R	ld	[%r8, %r9], %f2
	.word 0x10800002  ! 2982: BA	ba  	<label_0x2>
	.word 0xe53a0009  ! 2985: STDF_R	std	%f18, [%r9, %r8]
	.word 0xfe420009  ! 2985: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xfc8a1009  ! 2985: LDUBA_R	lduba	[%r8, %r9] 0x80, %r30
	.word 0xc73a0009  ! 2988: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4420009  ! 2988: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc6f21009  ! 2988: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xca220009  ! 2991: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xd8120009  ! 2991: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0x8ad22890  ! 2991: UMULcc_I	umulcc 	%r8, 0x0890, %r5
	.word 0xee720009  ! 2994: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xc8120009  ! 2994: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8f6a24d0  ! 2994: SDIVX_I	sdivx	%r8, 0x04d0, %r7
	.word 0xca720009  ! 2997: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xce4a0009  ! 2997: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xf0b21009  ! 2997: STHA_R	stha	%r24, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 3000: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc5a0009  ! 3000: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8e7a0009  ! 3000: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xf02a0009  ! 3003: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc2420009  ! 3003: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcc5a2b90  ! 3003: LDX_I	ldx	[%r8 + 0x0b90], %r6
	.word 0xc33a0009  ! 3006: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc4a0009  ! 3006: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xdaf21009  ! 3006: STXA_R	stxa	%r13, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 3009: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf8120009  ! 3009: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xc87a27ec  ! 3009: SWAP_I	swap	%r4, [%r8 + 0x07ec]
	.word 0xf0220009  ! 3012: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc01a0009  ! 3012: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xf45a2288  ! 3012: LDX_I	ldx	[%r8 + 0x0288], %r26
	.word 0xc5220009  ! 3015: STF_R	st	%f2, [%r9, %r8]
	.word 0xfc4a0009  ! 3015: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xaf220009  ! 3015: MULScc_R	mulscc 	%r8, %r9, %r23
	.word 0xcc220009  ! 3018: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 3018: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc89a1009  ! 3018: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc33a0009  ! 3021: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe6520009  ! 3021: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0x14800001  ! 3021: BG	bg  	<label_0x1>
	.word 0xcc2a0009  ! 3024: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfe520009  ! 3024: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0x846a0009  ! 3024: UDIVX_R	udivx 	%r8, %r9, %r2
	.word 0xf2220009  ! 3027: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc9020009  ! 3027: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea1009  ! 3027: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9220009  ! 3030: STF_R	st	%f4, [%r9, %r8]
	.word 0xdb1a0009  ! 3030: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xc36a0009  ! 3030: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdc320009  ! 3033: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xcc520009  ! 3033: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xf6a21009  ! 3033: STWA_R	stwa	%r27, [%r8 + %r9] 0x80
	.word 0xec220009  ! 3036: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xca420009  ! 3036: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc8a21009  ! 3036: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 3039: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc01a0009  ! 3039: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xcb022850  ! 3039: LDF_I	ld	[%r8, 0x0850], %f5
	.word 0xce720009  ! 3042: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xec520009  ! 3042: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0x8143e03c  ! 3042: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xce720009  ! 3045: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc24a0009  ! 3045: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143e019  ! 3045: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xce220009  ! 3048: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 3048: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x89220009  ! 3048: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xce220009  ! 3051: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xde120009  ! 3051: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xc67a2154  ! 3051: SWAP_I	swap	%r3, [%r8 + 0x0154]
	.word 0xcc320009  ! 3054: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc520009  ! 3054: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x867a0009  ! 3054: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xcf3a0009  ! 3057: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc8420009  ! 3057: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xceb21009  ! 3057: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 3060: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc3020009  ! 3060: LDF_R	ld	[%r8, %r9], %f1
	.word 0x82720009  ! 3060: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc6220009  ! 3063: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 3063: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xca0a0009  ! 3063: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc73a0009  ! 3066: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd6520009  ! 3066: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xc36a2fb8  ! 3066: PREFETCH_I	prefetch	[%r8 + 0x0fb8], #one_read
	.word 0xc8320009  ! 3069: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc2120009  ! 3069: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xceea1009  ! 3069: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xff3a0009  ! 3072: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc85a0009  ! 3072: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xf24a0009  ! 3072: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xce320009  ! 3075: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xd8420009  ! 3075: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xc7020009  ! 3075: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc7220009  ! 3078: STF_R	st	%f3, [%r9, %r8]
	.word 0xfb020009  ! 3078: LDF_R	ld	[%r8, %r9], %f29
	.word 0x20800001  ! 3078: BN	bn,a	<label_0x1>
	.word 0xc5220009  ! 3081: STF_R	st	%f2, [%r9, %r8]
	.word 0xca420009  ! 3081: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143e017  ! 3081: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside 
	.word 0xc53a0009  ! 3084: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc24a0009  ! 3084: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xd73a0009  ! 3084: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc53a0009  ! 3087: STDF_R	std	%f2, [%r9, %r8]
	.word 0xda020009  ! 3087: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0x0cc20001  ! 3087: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xc5220009  ! 3090: STF_R	st	%f2, [%r9, %r8]
	.word 0xce420009  ! 3090: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 3090: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf4220009  ! 3093: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc25a0009  ! 3093: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xdeaa1009  ! 3093: STBA_R	stba	%r15, [%r8 + %r9] 0x80
	.word 0xe73a0009  ! 3096: STDF_R	std	%f19, [%r9, %r8]
	.word 0xce420009  ! 3096: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc36a2248  ! 3096: PREFETCH_I	prefetch	[%r8 + 0x0248], #one_read
	.word 0xc4720009  ! 3099: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf4120009  ! 3099: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xc2aa2644  ! 3099: STBA_I	stba	%r1, [%r8 + 0x0644] %asi
	.word 0xce720009  ! 3102: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe6420009  ! 3102: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x8143c000  ! 3102: STBAR	stbar
	.word 0xc93a0009  ! 3105: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc7020009  ! 3105: LDF_R	ld	[%r8, %r9], %f3
	.word 0x86520009  ! 3105: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc6220009  ! 3108: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 3108: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xaeda2278  ! 3108: SMULcc_I	smulcc 	%r8, 0x0278, %r23
	.word 0xed3a0009  ! 3111: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc51a0009  ! 3111: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc36a2fa0  ! 3111: PREFETCH_I	prefetch	[%r8 + 0x0fa0], #one_read
	.word 0xcb220009  ! 3114: STF_R	st	%f5, [%r9, %r8]
	.word 0xc91a0009  ! 3114: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc44223dc  ! 3114: LDSW_I	ldsw	[%r8 + 0x03dc], %r2
	.word 0xc93a0009  ! 3117: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc8020009  ! 3117: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc36a29d4  ! 3117: PREFETCH_I	prefetch	[%r8 + 0x09d4], #one_read
	.word 0xcc220009  ! 3120: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xea420009  ! 3120: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xae6a0009  ! 3120: UDIVX_R	udivx 	%r8, %r9, %r23
	.word 0xd82a0009  ! 3123: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xce420009  ! 3123: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xfb220009  ! 3123: STF_R	st	%f29, [%r9, %r8]
	.word 0xce2a0009  ! 3126: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe8020009  ! 3126: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xb47a27c8  ! 3126: SDIV_I	sdiv 	%r8, 0x07c8, %r26
	.word 0xce220009  ! 3129: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc0a0009  ! 3129: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143e07e  ! 3129: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xe2320009  ! 3132: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xce4a0009  ! 3132: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc8022de0  ! 3132: LDUW_I	lduw	[%r8 + 0x0de0], %r4
	.word 0xf33a0009  ! 3135: STDF_R	std	%f25, [%r9, %r8]
	.word 0xd91a0009  ! 3135: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0x8143c000  ! 3135: STBAR	stbar
	.word 0xca220009  ! 3138: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcb020009  ! 3138: LDF_R	ld	[%r8, %r9], %f5
	.word 0xb4720009  ! 3138: UDIV_R	udiv 	%r8, %r9, %r26
	.word 0xc93a0009  ! 3141: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc41a0009  ! 3141: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xca122334  ! 3141: LDUH_I	lduh	[%r8 + 0x0334], %r5
	.word 0xc22a0009  ! 3144: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 3144: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc4f21009  ! 3144: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 3147: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xd41a0009  ! 3147: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xe04a2a80  ! 3147: LDSB_I	ldsb	[%r8 + 0x0a80], %r16
	.word 0xf0720009  ! 3150: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc6020009  ! 3150: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xe89a1009  ! 3150: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xc2720009  ! 3153: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 3153: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc93a2f20  ! 3153: STDF_I	std	%f4, [0x0f20, %r8]
	.word 0xd6220009  ! 3156: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xca520009  ! 3156: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc71a0009  ! 3156: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xf13a0009  ! 3159: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc4420009  ! 3159: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xcc1a0009  ! 3159: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc2220009  ! 3162: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce5a0009  ! 3162: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc27a2d10  ! 3162: SWAP_I	swap	%r1, [%r8 + 0x0d10]
	.word 0xc62a0009  ! 3165: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf8120009  ! 3165: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0x02ca0001  ! 3165: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xcc320009  ! 3168: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe6520009  ! 3168: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xc53a0009  ! 3168: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca720009  ! 3171: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd6020009  ! 3171: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x24800001  ! 3171: BLE	ble,a	<label_0x1>
	.word 0xda220009  ! 3174: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc4120009  ! 3174: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3174: STBAR	stbar
	.word 0xc82a0009  ! 3177: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca5a0009  ! 3177: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc36a2f9c  ! 3177: PREFETCH_I	prefetch	[%r8 + 0x0f9c], #one_read
	.word 0xcd3a0009  ! 3180: STDF_R	std	%f6, [%r9, %r8]
	.word 0xee0a0009  ! 3180: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xc33a0009  ! 3180: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce2a0009  ! 3183: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc8120009  ! 3183: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8c6a0009  ! 3183: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xc4320009  ! 3186: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf51a0009  ! 3186: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xc3ea28dc  ! 3186: PREFETCHA_I	prefetcha	[%r8, + 0x08dc] %asi, #one_read
	.word 0xef220009  ! 3189: STF_R	st	%f23, [%r9, %r8]
	.word 0xf64a0009  ! 3189: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x8143c000  ! 3189: STBAR	stbar
	.word 0xf6320009  ! 3192: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xcf020009  ! 3192: LDF_R	ld	[%r8, %r9], %f7
	.word 0xf7f22009  ! 3192: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0xcc220009  ! 3195: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc4020009  ! 3195: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x2e800001  ! 3195: BVS	bvs,a	<label_0x1>
	.word 0xcf220009  ! 3198: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2420009  ! 3198: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xdd022088  ! 3198: LDF_I	ld	[%r8, 0x0088], %f14
	.word 0xc8320009  ! 3201: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc85a0009  ! 3201: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8af20009  ! 3201: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0xe62a0009  ! 3204: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc85a0009  ! 3204: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x3e800001  ! 3204: BVC	bvc,a	<label_0x1>
	.word 0xcd3a0009  ! 3207: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc24a0009  ! 3207: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xceda1009  ! 3207: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0xe93a0009  ! 3210: STDF_R	std	%f20, [%r9, %r8]
	.word 0xcc0a0009  ! 3210: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143e01c  ! 3210: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside 
	.word 0xf8320009  ! 3213: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xf44a0009  ! 3213: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xc3ea224c  ! 3213: PREFETCHA_I	prefetcha	[%r8, + 0x024c] %asi, #one_read
	.word 0xcf220009  ! 3216: STF_R	st	%f7, [%r9, %r8]
	.word 0xc44a0009  ! 3216: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x2cca0001  ! 3216: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc8320009  ! 3219: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 3219: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc27a0009  ! 3219: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xcf220009  ! 3222: STF_R	st	%f7, [%r9, %r8]
	.word 0xc81a0009  ! 3222: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3222: STBAR	stbar
	.word 0xcd220009  ! 3225: STF_R	st	%f6, [%r9, %r8]
	.word 0xcf1a0009  ! 3225: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x14800001  ! 3225: BG	bg  	<label_0x1>
	.word 0xde720009  ! 3228: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xf65a0009  ! 3228: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0x02800002  ! 3228: BE	be  	<label_0x2>
	.word 0xcf220009  ! 3231: STF_R	st	%f7, [%r9, %r8]
	.word 0xc2020009  ! 3231: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc4ea1009  ! 3231: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 3234: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce520009  ! 3234: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x3c800001  ! 3234: BPOS	bpos,a	<label_0x1>
	.word 0xcd3a0009  ! 3237: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe7020009  ! 3237: LDF_R	ld	[%r8, %r9], %f19
	.word 0x8143c000  ! 3237: STBAR	stbar
	.word 0xca720009  ! 3240: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 3240: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc4b21009  ! 3240: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xf4720009  ! 3243: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc45a0009  ! 3243: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x30800001  ! 3243: BA	ba,a	<label_0x1>
	.word 0xc6320009  ! 3246: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce420009  ! 3246: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc8b21009  ! 3246: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 3249: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 3249: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea2954  ! 3249: PREFETCHA_I	prefetcha	[%r8, + 0x0954] %asi, #one_read
	.word 0xc6220009  ! 3252: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 3252: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x88f2270c  ! 3252: UDIVcc_I	udivcc 	%r8, 0x070c, %r4
	.word 0xe13a0009  ! 3255: STDF_R	std	%f16, [%r9, %r8]
	.word 0xd7020009  ! 3255: LDF_R	ld	[%r8, %r9], %f11
	.word 0xc36a2704  ! 3255: PREFETCH_I	prefetch	[%r8 + 0x0704], #one_read
	.word 0xec720009  ! 3258: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xce120009  ! 3258: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc25a0009  ! 3258: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc2720009  ! 3261: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xec120009  ! 3261: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xaa6a2a14  ! 3261: UDIVX_I	udivx 	%r8, 0x0a14, %r21
	.word 0xc2320009  ! 3264: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 3264: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8c5a29a4  ! 3264: SMUL_I	smul 	%r8, 0x09a4, %r6
	.word 0xc42a0009  ! 3267: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc45a0009  ! 3267: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xf8b22794  ! 3267: STHA_I	stha	%r28, [%r8 + 0x0794] %asi
	.word 0xc5220009  ! 3270: STF_R	st	%f2, [%r9, %r8]
	.word 0xc2520009  ! 3270: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc3220009  ! 3270: STF_R	st	%f1, [%r9, %r8]
	.word 0xc82a0009  ! 3273: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 3273: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xe5f22009  ! 3273: CASXA_R	casxa	[%r8]%asi, %r9, %r18
	.word 0xce720009  ! 3276: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe41a0009  ! 3276: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xcaca2f88  ! 3276: LDSBA_I	ldsba	[%r8, + 0x0f88] %asi, %r5
	.word 0xd8320009  ! 3279: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xcc4a0009  ! 3279: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xdf220009  ! 3279: STF_R	st	%f15, [%r9, %r8]
	.word 0xc3220009  ! 3282: STF_R	st	%f1, [%r9, %r8]
	.word 0xc2020009  ! 3282: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc2f21009  ! 3282: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 3285: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe64a0009  ! 3285: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xcb1a0009  ! 3285: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcc2a0009  ! 3288: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce520009  ! 3288: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcbe21009  ! 3288: CASA_I	casa	[%r8] 0x80, %r9, %r5
	.word 0xcc320009  ! 3291: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfc420009  ! 3291: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xbfa209a9  ! 3291: FDIVs	fdivs	%f8, %f9, %f31
	.word 0xc4720009  ! 3294: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xda5a0009  ! 3294: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x8143e030  ! 3294: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xcc320009  ! 3297: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 3297: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x3c800001  ! 3297: BPOS	bpos,a	<label_0x1>
	.word 0xca720009  ! 3300: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 3300: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xae7a2e40  ! 3300: SDIV_I	sdiv 	%r8, 0x0e40, %r23
	.word 0xc4320009  ! 3303: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc6020009  ! 3303: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc3ea2120  ! 3303: PREFETCHA_I	prefetcha	[%r8, + 0x0120] %asi, #one_read
	.word 0xc4320009  ! 3306: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 3306: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcafa2a70  ! 3306: SWAPA_I	swapa	%r5, [%r8 + 0x0a70] %asi
	.word 0xc3220009  ! 3309: STF_R	st	%f1, [%r9, %r8]
	.word 0xc2520009  ! 3309: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc53a29b8  ! 3309: STDF_I	std	%f2, [0x09b8, %r8]
	.word 0xcc720009  ! 3312: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf5020009  ! 3312: LDF_R	ld	[%r8, %r9], %f26
	.word 0x86520009  ! 3312: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xf4720009  ! 3315: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xfa020009  ! 3315: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x827a2be4  ! 3315: SDIV_I	sdiv 	%r8, 0x0be4, %r1
	.word 0xca2a0009  ! 3318: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc91a0009  ! 3318: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8a5a0009  ! 3318: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xca720009  ! 3321: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc420009  ! 3321: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc8ba1009  ! 3321: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xea720009  ! 3324: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xee4a0009  ! 3324: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xd9022ffc  ! 3324: LDF_I	ld	[%r8, 0x0ffc], %f12
	.word 0xfd220009  ! 3327: STF_R	st	%f30, [%r9, %r8]
	.word 0xfc1a0009  ! 3327: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xf91a0009  ! 3327: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0xcc2a0009  ! 3330: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc4120009  ! 3330: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc6a22624  ! 3330: STWA_I	stwa	%r3, [%r8 + 0x0624] %asi
	.word 0xc8320009  ! 3333: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca4a0009  ! 3333: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc68a1009  ! 3333: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xc73a0009  ! 3336: STDF_R	std	%f3, [%r9, %r8]
	.word 0xda5a0009  ! 3336: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xc36a21b8  ! 3336: PREFETCH_I	prefetch	[%r8 + 0x01b8], #one_read
	.word 0xfa220009  ! 3339: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xdc020009  ! 3339: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xcbe22009  ! 3339: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xe6220009  ! 3342: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc2420009  ! 3342: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcaf21009  ! 3342: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xca720009  ! 3345: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xee5a0009  ! 3345: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xf8120009  ! 3345: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xc4720009  ! 3348: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce520009  ! 3348: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xf2aa1009  ! 3348: STBA_R	stba	%r25, [%r8 + %r9] 0x80
	.word 0xec220009  ! 3351: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xf4020009  ! 3351: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x9ef20009  ! 3351: UDIVcc_R	udivcc 	%r8, %r9, %r15
	.word 0xc33a0009  ! 3354: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc6520009  ! 3354: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xbda20829  ! 3354: FADDs	fadds	%f8, %f9, %f30
	.word 0xce220009  ! 3357: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc24a0009  ! 3357: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 3357: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4320009  ! 3360: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 3360: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x24c20001  ! 3360: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc2220009  ! 3363: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca4a0009  ! 3363: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcf1a0009  ! 3363: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc22a0009  ! 3366: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe9020009  ! 3366: LDF_R	ld	[%r8, %r9], %f20
	.word 0xcc6a0009  ! 3366: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xc73a0009  ! 3369: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc20a0009  ! 3369: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 3369: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe02a0009  ! 3372: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc60a0009  ! 3372: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xccea28dc  ! 3372: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x08dc] %asi
	.word 0xca220009  ! 3375: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xec120009  ! 3375: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0x8fa209a9  ! 3375: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xc9220009  ! 3378: STF_R	st	%f4, [%r9, %r8]
	.word 0xc8120009  ! 3378: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc2da1009  ! 3378: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc4220009  ! 3381: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca420009  ! 3381: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3381: STBAR	stbar
	.word 0xcc320009  ! 3384: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc8420009  ! 3384: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x1c800001  ! 3384: BPOS	bpos  	<label_0x1>
	.word 0xe0720009  ! 3387: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc8020009  ! 3387: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x04800002  ! 3387: BLE	ble  	<label_0x2>
	.word 0xc4320009  ! 3390: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc0a0009  ! 3390: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xcfe21009  ! 3390: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xdc720009  ! 3393: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xf4520009  ! 3393: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xc36a0009  ! 3393: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf4220009  ! 3396: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xcd1a0009  ! 3396: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc8520009  ! 3396: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xce320009  ! 3399: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe04a0009  ! 3399: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xc7f22009  ! 3399: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xd6220009  ! 3402: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc81a0009  ! 3402: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3402: STBAR	stbar
	.word 0xea720009  ! 3405: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc20a0009  ! 3405: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xca520009  ! 3405: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc5220009  ! 3408: STF_R	st	%f2, [%r9, %r8]
	.word 0xee4a0009  ! 3408: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xf31a0009  ! 3408: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0xcf220009  ! 3411: STF_R	st	%f7, [%r9, %r8]
	.word 0xc5020009  ! 3411: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc36a2da8  ! 3411: PREFETCH_I	prefetch	[%r8 + 0x0da8], #one_read
	.word 0xce720009  ! 3414: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf85a0009  ! 3414: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xc01a2698  ! 3414: LDD_I	ldd	[%r8 + 0x0698], %r0
	.word 0xce2a0009  ! 3417: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcc4a0009  ! 3417: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xca7a24a0  ! 3417: SWAP_I	swap	%r5, [%r8 + 0x04a0]
	.word 0xc3220009  ! 3420: STF_R	st	%f1, [%r9, %r8]
	.word 0xc01a0009  ! 3420: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc7e22009  ! 3420: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xe5220009  ! 3423: STF_R	st	%f18, [%r9, %r8]
	.word 0xc7020009  ! 3423: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc5f22009  ! 3423: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc73a0009  ! 3426: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc40a0009  ! 3426: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc3ea2e70  ! 3426: PREFETCHA_I	prefetcha	[%r8, + 0x0e70] %asi, #one_read
	.word 0xcb3a0009  ! 3429: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc9020009  ! 3429: LDF_R	ld	[%r8, %r9], %f4
	.word 0xa5a209a9  ! 3429: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xc2720009  ! 3432: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc4120009  ! 3432: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8a720009  ! 3432: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xc8320009  ! 3435: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 3435: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc41a2218  ! 3435: LDD_I	ldd	[%r8 + 0x0218], %r2
	.word 0xce2a0009  ! 3438: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 3438: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xdf3a25c8  ! 3438: STDF_I	std	%f15, [0x05c8, %r8]
	.word 0xc82a0009  ! 3441: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce520009  ! 3441: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x30800001  ! 3441: BA	ba,a	<label_0x1>
	.word 0xc62a0009  ! 3444: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 3444: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcaa22eec  ! 3444: STWA_I	stwa	%r5, [%r8 + 0x0eec] %asi
	.word 0xc5220009  ! 3447: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8520009  ! 3447: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xfd020009  ! 3447: LDF_R	ld	[%r8, %r9], %f30
	.word 0xc2220009  ! 3450: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 3450: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc36a2404  ! 3450: PREFETCH_I	prefetch	[%r8 + 0x0404], #one_read
	.word 0xce320009  ! 3453: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc6120009  ! 3453: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x24ca0001  ! 3453: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc4720009  ! 3456: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 3456: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcc9a2808  ! 3456: LDDA_I	ldda	[%r8, + 0x0808] %asi, %r6
	.word 0xf8220009  ! 3459: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc41a0009  ! 3459: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xe3f22009  ! 3459: CASXA_R	casxa	[%r8]%asi, %r9, %r17
	.word 0xcc720009  ! 3462: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe44a0009  ! 3462: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xa1a20929  ! 3462: FMULs	fmuls	%f8, %f9, %f16
	.word 0xcf220009  ! 3465: STF_R	st	%f7, [%r9, %r8]
	.word 0xc45a0009  ! 3465: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc6b21009  ! 3465: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 3468: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc2020009  ! 3468: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcc1a2718  ! 3468: LDD_I	ldd	[%r8 + 0x0718], %r6
	.word 0xc82a0009  ! 3471: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 3471: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xfefa1009  ! 3471: SWAPA_R	swapa	%r31, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 3474: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc420009  ! 3474: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xdc9a1009  ! 3474: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0xcf3a0009  ! 3477: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca120009  ! 3477: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8cd20009  ! 3477: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xce2a0009  ! 3480: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd7020009  ! 3480: LDF_R	ld	[%r8, %r9], %f11
	.word 0xf3e22009  ! 3480: CASA_R	casa	[%r8] %asi, %r9, %r25
	.word 0xfc320009  ! 3483: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xe2120009  ! 3483: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xc8aa2a64  ! 3483: STBA_I	stba	%r4, [%r8 + 0x0a64] %asi
	.word 0xc4320009  ! 3486: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 3486: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x02ca0001  ! 3486: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xf22a0009  ! 3489: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xca0a0009  ! 3489: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xb46a0009  ! 3489: UDIVX_R	udivx 	%r8, %r9, %r26
	.word 0xff220009  ! 3492: STF_R	st	%f31, [%r9, %r8]
	.word 0xc2520009  ! 3492: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xceaa1009  ! 3492: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xca320009  ! 3495: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce120009  ! 3495: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xe66a0009  ! 3495: LDSTUB_R	ldstub	%r19, [%r8 + %r9]
	.word 0xf13a0009  ! 3498: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc64a0009  ! 3498: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc6ca2d34  ! 3498: LDSBA_I	ldsba	[%r8, + 0x0d34] %asi, %r3
	.word 0xc8220009  ! 3501: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8420009  ! 3501: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3501: STBAR	stbar
	.word 0xce320009  ! 3504: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc4a0009  ! 3504: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xccda2a68  ! 3504: LDXA_I	ldxa	[%r8, + 0x0a68] %asi, %r6
	.word 0xc6720009  ! 3507: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 3507: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xcc4a239c  ! 3507: LDSB_I	ldsb	[%r8 + 0x039c], %r6
	.word 0xce320009  ! 3510: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc01a0009  ! 3510: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x10800001  ! 3510: BA	ba  	<label_0x1>
	.word 0xc6320009  ! 3513: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc64a0009  ! 3513: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x06ca0001  ! 3513: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xca320009  ! 3516: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xe7020009  ! 3516: LDF_R	ld	[%r8, %r9], %f19
	.word 0xc3ea2940  ! 3516: PREFETCHA_I	prefetcha	[%r8, + 0x0940] %asi, #one_read
	.word 0xda320009  ! 3519: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xf2020009  ! 3519: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xbc7a0009  ! 3519: SDIV_R	sdiv 	%r8, %r9, %r30
	.word 0xc82a0009  ! 3522: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca020009  ! 3522: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc8ba2d68  ! 3522: STDA_I	stda	%r4, [%r8 + 0x0d68] %asi
	.word 0xca720009  ! 3525: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe0120009  ! 3525: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xb64a0009  ! 3525: MULX_R	mulx 	%r8, %r9, %r27
	.word 0xf3220009  ! 3528: STF_R	st	%f25, [%r9, %r8]
	.word 0xea020009  ! 3528: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0x8143e06d  ! 3528: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xc8320009  ! 3531: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xee420009  ! 3531: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0x06800002  ! 3531: BL	bl  	<label_0x2>
	.word 0xdc720009  ! 3534: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc6020009  ! 3534: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 3534: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6220009  ! 3537: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 3537: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xf73a2000  ! 3537: STDF_I	std	%f27, [0x0000, %r8]
	.word 0xe42a0009  ! 3540: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xca4a0009  ! 3540: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcdf21009  ! 3540: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xce320009  ! 3543: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcf020009  ! 3543: LDF_R	ld	[%r8, %r9], %f7
	.word 0x28800001  ! 3543: BLEU	bleu,a	<label_0x1>
	.word 0xfb3a0009  ! 3546: STDF_R	std	%f29, [%r9, %r8]
	.word 0xf41a0009  ! 3546: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xdcc21009  ! 3546: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r14
	.word 0xce220009  ! 3549: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc420009  ! 3549: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xe33a0009  ! 3549: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc73a0009  ! 3552: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf2120009  ! 3552: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0xcde22009  ! 3552: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xcc220009  ! 3555: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xd81a0009  ! 3555: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x8143c000  ! 3555: STBAR	stbar
	.word 0xca320009  ! 3558: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc020009  ! 3558: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc36a2d40  ! 3558: PREFETCH_I	prefetch	[%r8 + 0x0d40], #one_read
	.word 0xfe720009  ! 3561: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xce420009  ! 3561: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x88722f5c  ! 3561: UDIV_I	udiv 	%r8, 0x0f5c, %r4
	.word 0xeb220009  ! 3564: STF_R	st	%f21, [%r9, %r8]
	.word 0xda5a0009  ! 3564: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xc36a0009  ! 3564: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc82a0009  ! 3567: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 3567: LDF_R	ld	[%r8, %r9], %f1
	.word 0xfcaa2c34  ! 3567: STBA_I	stba	%r30, [%r8 + 0x0c34] %asi
	.word 0xc8320009  ! 3570: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 3570: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcab21009  ! 3570: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xee320009  ! 3573: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xcd020009  ! 3573: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8ba209a9  ! 3573: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xe4320009  ! 3576: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xda520009  ! 3576: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0x8143e062  ! 3576: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xec320009  ! 3579: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xe8420009  ! 3579: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xba5a2ec4  ! 3579: SMUL_I	smul 	%r8, 0x0ec4, %r29
	.word 0xcc720009  ! 3582: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xce0a0009  ! 3582: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xceaa24a0  ! 3582: STBA_I	stba	%r7, [%r8 + 0x04a0] %asi
	.word 0xca2a0009  ! 3585: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf2020009  ! 3585: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x8d6a2a38  ! 3585: SDIVX_I	sdivx	%r8, 0x0a38, %r6
	.word 0xc73a0009  ! 3588: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf0420009  ! 3588: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0x0c800001  ! 3588: BNEG	bneg  	<label_0x1>
	.word 0xc2220009  ! 3591: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcb020009  ! 3591: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143e045  ! 3591: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xcb3a0009  ! 3594: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcd1a0009  ! 3594: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc2b21009  ! 3594: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xf73a0009  ! 3597: STDF_R	std	%f27, [%r9, %r8]
	.word 0xce0a0009  ! 3597: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x0e800002  ! 3597: BVS	bvs  	<label_0x2>
	.word 0xc3220009  ! 3600: STF_R	st	%f1, [%r9, %r8]
	.word 0xc85a0009  ! 3600: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea22f0  ! 3600: PREFETCHA_I	prefetcha	[%r8, + 0x02f0] %asi, #one_read
	.word 0xe6720009  ! 3603: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xd65a0009  ! 3603: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xcfe21009  ! 3603: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xcc320009  ! 3606: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc71a0009  ! 3606: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc89221d4  ! 3606: LDUHA_I	lduha	[%r8, + 0x01d4] %asi, %r4
	.word 0xf8220009  ! 3609: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xca4a0009  ! 3609: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc6ca1009  ! 3609: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xc82a0009  ! 3612: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca120009  ! 3612: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x89a20829  ! 3612: FADDs	fadds	%f8, %f9, %f4
	.word 0xf42a0009  ! 3615: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xe11a0009  ! 3615: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0x8143c000  ! 3615: STBAR	stbar
	.word 0xcf3a0009  ! 3618: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2020009  ! 3618: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc4ba2530  ! 3618: STDA_I	stda	%r2, [%r8 + 0x0530] %asi
	.word 0xc5220009  ! 3621: STF_R	st	%f2, [%r9, %r8]
	.word 0xce120009  ! 3621: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143e03a  ! 3621: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc53a0009  ! 3624: STDF_R	std	%f2, [%r9, %r8]
	.word 0xce020009  ! 3624: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc3ea26d0  ! 3624: PREFETCHA_I	prefetcha	[%r8, + 0x06d0] %asi, #one_read
	.word 0xc8320009  ! 3627: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xde4a0009  ! 3627: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xc6da2b98  ! 3627: LDXA_I	ldxa	[%r8, + 0x0b98] %asi, %r3
	.word 0xef3a0009  ! 3630: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc85a0009  ! 3630: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3ea2280  ! 3630: PREFETCHA_I	prefetcha	[%r8, + 0x0280] %asi, #one_read
	.word 0xc6320009  ! 3633: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 3633: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xb1a20929  ! 3633: FMULs	fmuls	%f8, %f9, %f24
	.word 0xd7220009  ! 3636: STF_R	st	%f11, [%r9, %r8]
	.word 0xc24a0009  ! 3636: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a2500  ! 3636: PREFETCH_I	prefetch	[%r8 + 0x0500], #one_read
	.word 0xe8720009  ! 3639: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xd91a0009  ! 3639: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xa5222304  ! 3639: MULScc_I	mulscc 	%r8, 0x0304, %r18
	.word 0xe2720009  ! 3642: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xcc1a0009  ! 3642: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xf51a2418  ! 3642: LDDF_I	ldd	[%r8, 0x0418], %f26
	.word 0xc6720009  ! 3645: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xf2520009  ! 3645: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x8da209a9  ! 3645: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc3220009  ! 3648: STF_R	st	%f1, [%r9, %r8]
	.word 0xc24a0009  ! 3648: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x884a2fd0  ! 3648: MULX_I	mulx 	%r8, 0x0fd0, %r4
	.word 0xcb3a0009  ! 3651: STDF_R	std	%f5, [%r9, %r8]
	.word 0xd81a0009  ! 3651: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x85a208a9  ! 3651: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc3220009  ! 3654: STF_R	st	%f1, [%r9, %r8]
	.word 0xca520009  ! 3654: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc2ca2680  ! 3654: LDSBA_I	ldsba	[%r8, + 0x0680] %asi, %r1
	.word 0xce220009  ! 3657: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc31a0009  ! 3657: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcab21009  ! 3657: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 3660: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe51a0009  ! 3660: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0xc36a0009  ! 3660: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4720009  ! 3663: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc0a0009  ! 3663: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xccf21009  ! 3663: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 3666: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca520009  ! 3666: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xdd3a2808  ! 3666: STDF_I	std	%f14, [0x0808, %r8]
	.word 0xea220009  ! 3669: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xe0120009  ! 3669: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xf41a2770  ! 3669: LDD_I	ldd	[%r8 + 0x0770], %r26
	.word 0xcb3a0009  ! 3672: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc420009  ! 3672: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc3ea20f0  ! 3672: PREFETCHA_I	prefetcha	[%r8, + 0x00f0] %asi, #one_read
	.word 0xc9220009  ! 3675: STF_R	st	%f4, [%r9, %r8]
	.word 0xe31a0009  ! 3675: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xc2a22c78  ! 3675: STWA_I	stwa	%r1, [%r8 + 0x0c78] %asi
	.word 0xce2a0009  ! 3678: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 3678: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3678: STBAR	stbar
	.word 0xcb3a0009  ! 3681: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc64a0009  ! 3681: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xdcda1009  ! 3681: LDXA_R	ldxa	[%r8, %r9] 0x80, %r14
	.word 0xfc320009  ! 3684: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xca4a0009  ! 3684: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcec22dac  ! 3684: LDSWA_I	ldswa	[%r8, + 0x0dac] %asi, %r7
	.word 0xcb220009  ! 3687: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4420009  ! 3687: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc27a0009  ! 3687: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xcd220009  ! 3690: STF_R	st	%f6, [%r9, %r8]
	.word 0xc81a0009  ! 3690: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc8ca28f0  ! 3690: LDSBA_I	ldsba	[%r8, + 0x08f0] %asi, %r4
	.word 0xe02a0009  ! 3693: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xd6120009  ! 3693: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xde7a0009  ! 3693: SWAP_R	swap	%r15, [%r8 + %r9]
	.word 0xcf220009  ! 3696: STF_R	st	%f7, [%r9, %r8]
	.word 0xfe5a0009  ! 3696: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xc36a0009  ! 3696: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca320009  ! 3699: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 3699: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc4da1009  ! 3699: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xeb3a0009  ! 3702: STDF_R	std	%f21, [%r9, %r8]
	.word 0xcb1a0009  ! 3702: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc3ea267c  ! 3702: PREFETCHA_I	prefetcha	[%r8, + 0x067c] %asi, #one_read
	.word 0xc5220009  ! 3705: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc520009  ! 3705: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xfa8a2f94  ! 3705: LDUBA_I	lduba	[%r8, + 0x0f94] %asi, %r29
	.word 0xc2320009  ! 3708: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf2420009  ! 3708: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xf8822e68  ! 3708: LDUWA_I	lduwa	[%r8, + 0x0e68] %asi, %r28
	.word 0xdc720009  ! 3711: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xcc020009  ! 3711: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xf8a21009  ! 3711: STWA_R	stwa	%r28, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 3714: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xee120009  ! 3714: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xc8ba2f08  ! 3714: STDA_I	stda	%r4, [%r8 + 0x0f08] %asi
	.word 0xcc320009  ! 3717: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce0a0009  ! 3717: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x87a20929  ! 3717: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc6220009  ! 3720: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc520009  ! 3720: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc88a2f10  ! 3720: LDUBA_I	lduba	[%r8, + 0x0f10] %asi, %r4
	.word 0xf6220009  ! 3723: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xc80a0009  ! 3723: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x85a208a9  ! 3723: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc3220009  ! 3726: STF_R	st	%f1, [%r9, %r8]
	.word 0xf11a0009  ! 3726: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0x8b6a0009  ! 3726: SDIVX_R	sdivx	%r8, %r9, %r5
	.word 0xc9220009  ! 3729: STF_R	st	%f4, [%r9, %r8]
	.word 0xca520009  ! 3729: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc36a28ec  ! 3729: PREFETCH_I	prefetch	[%r8 + 0x08ec], #one_read
	.word 0xc8220009  ! 3732: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 3732: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xce020009  ! 3732: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xdd3a0009  ! 3735: STDF_R	std	%f14, [%r9, %r8]
	.word 0xe0020009  ! 3735: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xc36a0009  ! 3735: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6720009  ! 3738: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc4a0009  ! 3738: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x30800002  ! 3738: BA	ba,a	<label_0x2>
	.word 0xc9220009  ! 3741: STF_R	st	%f4, [%r9, %r8]
	.word 0xc64a0009  ! 3741: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc4ba2080  ! 3741: STDA_I	stda	%r2, [%r8 + 0x0080] %asi
	.word 0xd93a0009  ! 3744: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc6520009  ! 3744: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc8da1009  ! 3744: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xc6220009  ! 3747: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca420009  ! 3747: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xf3222724  ! 3747: STF_I	st	%f25, [0x0724, %r8]
	.word 0xc22a0009  ! 3750: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe24a0009  ! 3750: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xcaa22acc  ! 3750: STWA_I	stwa	%r5, [%r8 + 0x0acc] %asi
	.word 0xcb220009  ! 3753: STF_R	st	%f5, [%r9, %r8]
	.word 0xc20a0009  ! 3753: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcc922900  ! 3753: LDUHA_I	lduha	[%r8, + 0x0900] %asi, %r6
	.word 0xc3220009  ! 3756: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc020009  ! 3756: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8ad20009  ! 3756: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xca220009  ! 3759: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc65a0009  ! 3759: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xec020009  ! 3759: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xdb3a0009  ! 3762: STDF_R	std	%f13, [%r9, %r8]
	.word 0xcc520009  ! 3762: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xb2522870  ! 3762: UMUL_I	umul 	%r8, 0x0870, %r25
	.word 0xc2320009  ! 3765: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 3765: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc6da2cf8  ! 3765: LDXA_I	ldxa	[%r8, + 0x0cf8] %asi, %r3
	.word 0xc9220009  ! 3768: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4520009  ! 3768: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc36a2d88  ! 3768: PREFETCH_I	prefetch	[%r8 + 0x0d88], #one_read
	.word 0xfb3a0009  ! 3771: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc3020009  ! 3771: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e035  ! 3771: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xcb3a0009  ! 3774: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc81a0009  ! 3774: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x1e800001  ! 3774: BVC	bvc  	<label_0x1>
	.word 0xf2220009  ! 3777: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xf25a0009  ! 3777: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xc36a23d0  ! 3777: PREFETCH_I	prefetch	[%r8 + 0x03d0], #one_read
	.word 0xc6320009  ! 3780: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4120009  ! 3780: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8a720009  ! 3780: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xc8320009  ! 3783: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xda5a0009  ! 3783: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x06ca0001  ! 3783: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xc6720009  ! 3786: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca5a0009  ! 3786: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc89a22c8  ! 3786: LDDA_I	ldda	[%r8, + 0x02c8] %asi, %r4
	.word 0xc6320009  ! 3789: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce4a0009  ! 3789: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xeb3a2b28  ! 3789: STDF_I	std	%f21, [0x0b28, %r8]
	.word 0xe73a0009  ! 3792: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc4520009  ! 3792: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xecca1009  ! 3792: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r22
	.word 0xc2720009  ! 3795: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe2020009  ! 3795: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xc3ea24c0  ! 3795: PREFETCHA_I	prefetcha	[%r8, + 0x04c0] %asi, #one_read
	.word 0xc2320009  ! 3798: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca420009  ! 3798: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xccaa1009  ! 3798: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 3801: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc20a0009  ! 3801: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143e02d  ! 3801: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc4320009  ! 3804: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xfc520009  ! 3804: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xc8a22b8c  ! 3804: STWA_I	stwa	%r4, [%r8 + 0x0b8c] %asi
	.word 0xe8220009  ! 3807: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc2020009  ! 3807: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc8aa1009  ! 3807: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 3810: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 3810: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xf8ea1009  ! 3810: LDSTUBA_R	ldstuba	%r28, [%r8 + %r9] 0x80
	.word 0xfb220009  ! 3813: STF_R	st	%f29, [%r9, %r8]
	.word 0xce520009  ! 3813: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc4da1009  ! 3813: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xcd220009  ! 3816: STF_R	st	%f6, [%r9, %r8]
	.word 0xfd020009  ! 3816: LDF_R	ld	[%r8, %r9], %f30
	.word 0xb96a2a1c  ! 3816: SDIVX_I	sdivx	%r8, 0x0a1c, %r28
	.word 0xec320009  ! 3819: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xca420009  ! 3819: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xd9f22009  ! 3819: CASXA_R	casxa	[%r8]%asi, %r9, %r12
	.word 0xc73a0009  ! 3822: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc2520009  ! 3822: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8c520009  ! 3822: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc62a0009  ! 3825: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xec1a0009  ! 3825: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xada209a9  ! 3825: FDIVs	fdivs	%f8, %f9, %f22
	.word 0xc22a0009  ! 3828: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 3828: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xe0f21009  ! 3828: STXA_R	stxa	%r16, [%r8 + %r9] 0x80
	.word 0xdc320009  ! 3831: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc4520009  ! 3831: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3831: STBAR	stbar
	.word 0xcc220009  ! 3834: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca420009  ! 3834: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x1a800001  ! 3834: BCC	bcc  	<label_0x1>
	.word 0xf8320009  ! 3837: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc2520009  ! 3837: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x06c20001  ! 3837: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc9220009  ! 3840: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4120009  ! 3840: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xbba20929  ! 3840: FMULs	fmuls	%f8, %f9, %f29
	.word 0xf6720009  ! 3843: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xef1a0009  ! 3843: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0xac5a2b10  ! 3843: SMUL_I	smul 	%r8, 0x0b10, %r22
	.word 0xc5220009  ! 3846: STF_R	st	%f2, [%r9, %r8]
	.word 0xd8120009  ! 3846: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xdb3a2a20  ! 3846: STDF_I	std	%f13, [0x0a20, %r8]
	.word 0xca320009  ! 3849: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 3849: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcc0a0009  ! 3849: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc7220009  ! 3852: STF_R	st	%f3, [%r9, %r8]
	.word 0xc7020009  ! 3852: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc3ea1009  ! 3852: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc62a0009  ! 3855: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc65a0009  ! 3855: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8b220009  ! 3855: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xc9220009  ! 3858: STF_R	st	%f4, [%r9, %r8]
	.word 0xea4a0009  ! 3858: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0xc4b21009  ! 3858: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xce320009  ! 3861: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 3861: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xe2822b30  ! 3861: LDUWA_I	lduwa	[%r8, + 0x0b30] %asi, %r17
	.word 0xcc720009  ! 3864: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xda020009  ! 3864: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0x84720009  ! 3864: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc4220009  ! 3867: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 3867: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc2da1009  ! 3867: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xce2a0009  ! 3870: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 3870: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xccba26d0  ! 3870: STDA_I	stda	%r6, [%r8 + 0x06d0] %asi
	.word 0xc6720009  ! 3873: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe8520009  ! 3873: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x2cca0001  ! 3873: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc8320009  ! 3876: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe0420009  ! 3876: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xc2f21009  ! 3876: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xda320009  ! 3879: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xcc420009  ! 3879: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x9ada0009  ! 3879: SMULcc_R	smulcc 	%r8, %r9, %r13
	.word 0xce220009  ! 3882: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 3882: LDF_R	ld	[%r8, %r9], %f4
	.word 0xbc7a2c4c  ! 3882: SDIV_I	sdiv 	%r8, 0x0c4c, %r30
	.word 0xc6220009  ! 3885: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xca020009  ! 3885: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xfff22009  ! 3885: CASXA_R	casxa	[%r8]%asi, %r9, %r31
	.word 0xdc220009  ! 3888: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xce0a0009  ! 3888: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8143e062  ! 3888: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
	.word 0xc4320009  ! 3891: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca4a0009  ! 3891: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xd41a0009  ! 3891: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xcb3a0009  ! 3894: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc45a0009  ! 3894: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xcbe22009  ! 3894: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xc62a0009  ! 3897: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc6420009  ! 3897: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xe04a2a38  ! 3897: LDSB_I	ldsb	[%r8 + 0x0a38], %r16
	.word 0xc3220009  ! 3900: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc1a0009  ! 3900: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc8f21009  ! 3900: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xca320009  ! 3903: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6520009  ! 3903: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143e07f  ! 3903: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc8720009  ! 3906: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf4420009  ! 3906: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0x8143c000  ! 3906: STBAR	stbar
	.word 0xee220009  ! 3909: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xf20a0009  ! 3909: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x98520009  ! 3909: UMUL_R	umul 	%r8, %r9, %r12
	.word 0xe6720009  ! 3912: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xf01a0009  ! 3912: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xc8fa1009  ! 3912: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 3915: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4120009  ! 3915: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xf8ea1009  ! 3915: LDSTUBA_R	ldstuba	%r28, [%r8 + %r9] 0x80
	.word 0xc7220009  ! 3918: STF_R	st	%f3, [%r9, %r8]
	.word 0xdb020009  ! 3918: LDF_R	ld	[%r8, %r9], %f13
	.word 0xc8aa25b4  ! 3918: STBA_I	stba	%r4, [%r8 + 0x05b4] %asi
	.word 0xe6320009  ! 3921: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc6120009  ! 3921: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xecb22be0  ! 3921: STHA_I	stha	%r22, [%r8 + 0x0be0] %asi
	.word 0xcc320009  ! 3924: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc31a0009  ! 3924: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xca6a2be4  ! 3924: LDSTUB_I	ldstub	%r5, [%r8 + 0x0be4]
	.word 0xce720009  ! 3927: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe00a0009  ! 3927: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0x886a0009  ! 3927: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc82a0009  ! 3930: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe00a0009  ! 3930: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0x87a20829  ! 3930: FADDs	fadds	%f8, %f9, %f3
	.word 0xfa320009  ! 3933: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc20a0009  ! 3933: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3ea2620  ! 3933: PREFETCHA_I	prefetcha	[%r8, + 0x0620] %asi, #one_read
	.word 0xca2a0009  ! 3936: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc5020009  ! 3936: LDF_R	ld	[%r8, %r9], %f2
	.word 0xe48a2398  ! 3936: LDUBA_I	lduba	[%r8, + 0x0398] %asi, %r18
	.word 0xff220009  ! 3939: STF_R	st	%f31, [%r9, %r8]
	.word 0xc6120009  ! 3939: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x9ad22198  ! 3939: UMULcc_I	umulcc 	%r8, 0x0198, %r13
	.word 0xfa220009  ! 3942: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc3020009  ! 3942: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc2520009  ! 3942: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xe62a0009  ! 3945: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xcd1a0009  ! 3945: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x26ca0001  ! 3945: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xcd220009  ! 3948: STF_R	st	%f6, [%r9, %r8]
	.word 0xcb1a0009  ! 3948: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xa3220009  ! 3948: MULScc_R	mulscc 	%r8, %r9, %r17
	.word 0xd93a0009  ! 3951: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc2120009  ! 3951: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc44a20d4  ! 3951: LDSB_I	ldsb	[%r8 + 0x00d4], %r2
	.word 0xcc220009  ! 3954: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc6520009  ! 3954: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x88720009  ! 3954: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xf8720009  ! 3957: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc85a0009  ! 3957: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xf88a25a8  ! 3957: LDUBA_I	lduba	[%r8, + 0x05a8] %asi, %r28
	.word 0xce220009  ! 3960: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe05a0009  ! 3960: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x8143e03c  ! 3960: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xf8720009  ! 3963: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc8020009  ! 3963: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc8b21009  ! 3963: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 3966: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf6520009  ! 3966: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0x8d220009  ! 3966: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc22a0009  ! 3969: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc81a0009  ! 3969: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8ef20009  ! 3969: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xcc720009  ! 3972: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc2020009  ! 3972: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xa1220009  ! 3972: MULScc_R	mulscc 	%r8, %r9, %r16
	.word 0xe2320009  ! 3975: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xca4a0009  ! 3975: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc8b21009  ! 3975: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 3978: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2420009  ! 3978: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8da208a9  ! 3978: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xcc720009  ! 3981: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc4420009  ! 3981: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x26ca0001  ! 3981: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xc62a0009  ! 3984: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xec420009  ! 3984: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xdc9a2198  ! 3984: LDDA_I	ldda	[%r8, + 0x0198] %asi, %r14
	.word 0xc2220009  ! 3987: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2020009  ! 3987: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xe6a22424  ! 3987: STWA_I	stwa	%r19, [%r8 + 0x0424] %asi
	.word 0xc4220009  ! 3990: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca520009  ! 3990: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xfe520009  ! 3990: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xc53a0009  ! 3993: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc81a0009  ! 3993: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x87a20929  ! 3993: FMULs	fmuls	%f8, %f9, %f3
	.word 0xcc720009  ! 3996: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc80a0009  ! 3996: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8eda0009  ! 3996: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xd6720009  ! 3999: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc8420009  ! 3999: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc3ea2ccc  ! 3999: PREFETCHA_I	prefetcha	[%r8, + 0x0ccc] %asi, #one_read
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000190, %g1, %r9
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
        setx  0x115b0098157ff7fe, %g1, %r0
        setx  0xc8b07de733822de4, %g1, %r1
        setx  0x2327dc83b2b026b2, %g1, %r2
        setx  0xd098c1b50de6cab8, %g1, %r3
        setx  0x5dab43227c79a0fa, %g1, %r4
        setx  0x4f2459fd98ed83ef, %g1, %r5
        setx  0x4eb68f61d0776678, %g1, %r6
        setx  0x8fc0903a86db2199, %g1, %r7
        setx  0x9b77c7fbe0e7a76f, %g1, %r10
        setx  0x48cb7016644f44f1, %g1, %r11
        setx  0x3bd862634611a50d, %g1, %r12
        setx  0xa0e5dc3cc8f0d4c3, %g1, %r13
        setx  0x9754f46fc7434946, %g1, %r14
        setx  0x4960b36c6c425cd1, %g1, %r15
        setx  0x76fdef084afce78d, %g1, %r16
        setx  0x7023583c9f876a0e, %g1, %r17
        setx  0x5d597816fb0b54e6, %g1, %r18
        setx  0x11d461644c6a8a44, %g1, %r19
        setx  0xcabea804502c7bd2, %g1, %r20
        setx  0x5d454e4437951a79, %g1, %r21
        setx  0xcae97248c8f64719, %g1, %r22
        setx  0xc42c6218caa3647e, %g1, %r23
        setx  0x1a29cf3e3a349577, %g1, %r24
        setx  0xa7eabde8e9d5f36c, %g1, %r25
        setx  0x135af54cb25e018c, %g1, %r26
        setx  0x56c4f3f50fc7d7c5, %g1, %r27
        setx  0xd6d409440e34b484, %g1, %r28
        setx  0xe30c241e0b14ce32, %g1, %r29
        setx  0x494cea00c93f140e, %g1, %r30
        setx  0x85bc61f4c1c4373f, %g1, %r31
	.word 0xca720009  ! 3: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 3: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x0eca0001  ! 3: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc6320009  ! 6: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd80a0009  ! 6: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0x8143c000  ! 6: STBAR	stbar
	.word 0xc33a0009  ! 9: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc7020009  ! 9: LDF_R	ld	[%r8, %r9], %f3
	.word 0x2a800001  ! 9: BCS	bcs,a	<label_0x1>
	.word 0xc2320009  ! 12: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 12: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x845a24c0  ! 12: SMUL_I	smul 	%r8, 0x04c0, %r2
	.word 0xc6720009  ! 15: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 15: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc3ea2460  ! 15: PREFETCHA_I	prefetcha	[%r8, + 0x0460] %asi, #one_read
	.word 0xe8220009  ! 18: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc6420009  ! 18: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x2a800001  ! 18: BCS	bcs,a	<label_0x1>
	.word 0xcb3a0009  ! 21: STDF_R	std	%f5, [%r9, %r8]
	.word 0xca5a0009  ! 21: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 21: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc220009  ! 24: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc31a0009  ! 24: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x26800001  ! 24: BL	bl,a	<label_0x1>
	.word 0xe02a0009  ! 27: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xfc4a0009  ! 27: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xd65a26b0  ! 27: LDX_I	ldx	[%r8 + 0x06b0], %r11
	.word 0xc73a0009  ! 30: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc84a0009  ! 30: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x89a20829  ! 30: FADDs	fadds	%f8, %f9, %f4
	.word 0xcd3a0009  ! 33: STDF_R	std	%f6, [%r9, %r8]
	.word 0xec1a0009  ! 33: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xd8ca1009  ! 33: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r12
	.word 0xe4720009  ! 36: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc65a0009  ! 36: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc2aa1009  ! 36: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xef3a0009  ! 39: STDF_R	std	%f23, [%r9, %r8]
	.word 0xee520009  ! 39: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xc3ea2f2c  ! 39: PREFETCHA_I	prefetcha	[%r8, + 0x0f2c] %asi, #one_read
	.word 0xc33a0009  ! 42: STDF_R	std	%f1, [%r9, %r8]
	.word 0xef020009  ! 42: LDF_R	ld	[%r8, %r9], %f23
	.word 0x8143e075  ! 42: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcc320009  ! 45: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 45: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc36a2160  ! 45: PREFETCH_I	prefetch	[%r8 + 0x0160], #one_read
	.word 0xd73a0009  ! 48: STDF_R	std	%f11, [%r9, %r8]
	.word 0xfa5a0009  ! 48: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x8d6a0009  ! 48: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xcf3a0009  ! 51: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc6020009  ! 51: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x88520009  ! 51: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xe6720009  ! 54: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc81a0009  ! 54: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 54: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf13a0009  ! 57: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc6520009  ! 57: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8da20929  ! 57: FMULs	fmuls	%f8, %f9, %f6
	.word 0xe3220009  ! 60: STF_R	st	%f17, [%r9, %r8]
	.word 0xf01a0009  ! 60: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xacfa0009  ! 60: SDIVcc_R	sdivcc 	%r8, %r9, %r22
	.word 0xc2320009  ! 63: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe7020009  ! 63: LDF_R	ld	[%r8, %r9], %f19
	.word 0xc3ea2f78  ! 63: PREFETCHA_I	prefetcha	[%r8, + 0x0f78] %asi, #one_read
	.word 0xc62a0009  ! 66: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 66: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc8da2ae0  ! 66: LDXA_I	ldxa	[%r8, + 0x0ae0] %asi, %r4
	.word 0xc6220009  ! 69: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc0a0009  ! 69: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 69: STBAR	stbar
	.word 0xe8320009  ! 72: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xf01a0009  ! 72: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x26800001  ! 72: BL	bl,a	<label_0x1>
	.word 0xce320009  ! 75: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc25a0009  ! 75: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8d220009  ! 75: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xce2a0009  ! 78: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf60a0009  ! 78: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xcc422564  ! 78: LDSW_I	ldsw	[%r8 + 0x0564], %r6
	.word 0xce220009  ! 81: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 81: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8143c000  ! 81: STBAR	stbar
	.word 0xca720009  ! 84: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc2120009  ! 84: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xcb3a20e0  ! 84: STDF_I	std	%f5, [0x00e0, %r8]
	.word 0xc3220009  ! 87: STF_R	st	%f1, [%r9, %r8]
	.word 0xc3020009  ! 87: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e046  ! 87: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xcc320009  ! 90: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfc120009  ! 90: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xc7e21009  ! 90: CASA_I	casa	[%r8] 0x80, %r9, %r3
	.word 0xfc2a0009  ! 93: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xda5a0009  ! 93: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xcc420009  ! 93: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc6320009  ! 96: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 96: LDF_R	ld	[%r8, %r9], %f7
	.word 0xccaa1009  ! 96: STBA_R	stba	%r6, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 99: STF_R	st	%f6, [%r9, %r8]
	.word 0xec0a0009  ! 99: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x2cc20001  ! 99: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc22a0009  ! 102: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfb1a0009  ! 102: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xc6f21009  ! 102: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xea220009  ! 105: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xfa120009  ! 105: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0x8da208a9  ! 105: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xdc2a0009  ! 108: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xd91a0009  ! 108: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xf0ba1009  ! 108: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xee320009  ! 111: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xdc5a0009  ! 111: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xc4da1009  ! 111: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xcc220009  ! 114: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe20a0009  ! 114: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0xc36a2ff0  ! 114: PREFETCH_I	prefetch	[%r8 + 0x0ff0], #one_read
	.word 0xcf220009  ! 117: STF_R	st	%f7, [%r9, %r8]
	.word 0xd7020009  ! 117: LDF_R	ld	[%r8, %r9], %f11
	.word 0xeaca1009  ! 117: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r21
	.word 0xc2720009  ! 120: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xea020009  ! 120: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xc2020009  ! 120: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xfd220009  ! 123: STF_R	st	%f30, [%r9, %r8]
	.word 0xc41a0009  ! 123: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 123: STBAR	stbar
	.word 0xfc320009  ! 126: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc8120009  ! 126: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc6da2618  ! 126: LDXA_I	ldxa	[%r8, + 0x0618] %asi, %r3
	.word 0xfc220009  ! 129: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xf01a0009  ! 129: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xb4da26a4  ! 129: SMULcc_I	smulcc 	%r8, 0x06a4, %r26
	.word 0xcc320009  ! 132: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfc0a0009  ! 132: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0x8143e039  ! 132: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc3220009  ! 135: STF_R	st	%f1, [%r9, %r8]
	.word 0xfc120009  ! 135: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xc45222e0  ! 135: LDSH_I	ldsh	[%r8 + 0x02e0], %r2
	.word 0xcf3a0009  ! 138: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc81a0009  ! 138: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea28e4  ! 138: PREFETCHA_I	prefetcha	[%r8, + 0x08e4] %asi, #one_read
	.word 0xc8720009  ! 141: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xff020009  ! 141: LDF_R	ld	[%r8, %r9], %f31
	.word 0x0e800001  ! 141: BVS	bvs  	<label_0x1>
	.word 0xca220009  ! 144: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 144: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc8fa1009  ! 144: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 147: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 147: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x886a2a60  ! 147: UDIVX_I	udivx 	%r8, 0x0a60, %r4
	.word 0xc73a0009  ! 150: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe24a0009  ! 150: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x8143e005  ! 150: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0xdb3a0009  ! 153: STDF_R	std	%f13, [%r9, %r8]
	.word 0xfa420009  ! 153: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0x8143e073  ! 153: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc33a0009  ! 156: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4520009  ! 156: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 156: STBAR	stbar
	.word 0xcb220009  ! 159: STF_R	st	%f5, [%r9, %r8]
	.word 0xed1a0009  ! 159: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xe85a0009  ! 159: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xce320009  ! 162: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce520009  ! 162: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcde21009  ! 162: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xca320009  ! 165: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce020009  ! 165: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xfada21f0  ! 165: LDXA_I	ldxa	[%r8, + 0x01f0] %asi, %r29
	.word 0xcd220009  ! 168: STF_R	st	%f6, [%r9, %r8]
	.word 0xef020009  ! 168: LDF_R	ld	[%r8, %r9], %f23
	.word 0x8143c000  ! 168: STBAR	stbar
	.word 0xc22a0009  ! 171: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xec1a0009  ! 171: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc2c21009  ! 171: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0xef220009  ! 174: STF_R	st	%f23, [%r9, %r8]
	.word 0xc85a0009  ! 174: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x28800002  ! 174: BLEU	bleu,a	<label_0x2>
	.word 0xe8720009  ! 177: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xcf020009  ! 177: LDF_R	ld	[%r8, %r9], %f7
	.word 0xd91a0009  ! 177: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xca320009  ! 180: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce4a0009  ! 180: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8b22212c  ! 180: MULScc_I	mulscc 	%r8, 0x012c, %r5
	.word 0xcc320009  ! 183: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc120009  ! 183: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xfa520009  ! 183: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xcc720009  ! 186: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc71a0009  ! 186: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xbda208a9  ! 186: FSUBs	fsubs	%f8, %f9, %f30
	.word 0xe42a0009  ! 189: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xf4520009  ! 189: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x8143c000  ! 189: STBAR	stbar
	.word 0xca320009  ! 192: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcd020009  ! 192: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc67a0009  ! 192: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc2220009  ! 195: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf2120009  ! 195: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x22800002  ! 195: BE	be,a	<label_0x2>
	.word 0xe4320009  ! 198: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc44a0009  ! 198: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc87a0009  ! 198: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xca320009  ! 201: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 201: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x86da0009  ! 201: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0xf6320009  ! 204: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xf4520009  ! 204: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x06ca0001  ! 204: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xe5220009  ! 207: STF_R	st	%f18, [%r9, %r8]
	.word 0xca120009  ! 207: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x30800001  ! 207: BA	ba,a	<label_0x1>
	.word 0xe2220009  ! 210: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc71a0009  ! 210: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcca21009  ! 210: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xf4720009  ! 213: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xce420009  ! 213: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 213: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe2220009  ! 216: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc40a0009  ! 216: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x847a0009  ! 216: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0xe6320009  ! 219: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xed1a0009  ! 219: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0x8143c000  ! 219: STBAR	stbar
	.word 0xc5220009  ! 222: STF_R	st	%f2, [%r9, %r8]
	.word 0xc25a0009  ! 222: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xd7020009  ! 222: LDF_R	ld	[%r8, %r9], %f11
	.word 0xc8720009  ! 225: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4020009  ! 225: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x887229a8  ! 225: UDIV_I	udiv 	%r8, 0x09a8, %r4
	.word 0xcd3a0009  ! 228: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca5a0009  ! 228: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xd73a2328  ! 228: STDF_I	std	%f11, [0x0328, %r8]
	.word 0xc4220009  ! 231: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xee0a0009  ! 231: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x8d6a0009  ! 231: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xcc320009  ! 234: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfe5a0009  ! 234: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xf4822db8  ! 234: LDUWA_I	lduwa	[%r8, + 0x0db8] %asi, %r26
	.word 0xcc2a0009  ! 237: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcf1a0009  ! 237: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143e02c  ! 237: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xe6220009  ! 240: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xd64a0009  ! 240: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xc3ea2298  ! 240: PREFETCHA_I	prefetcha	[%r8, + 0x0298] %asi, #one_read
	.word 0xee2a0009  ! 243: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xfa5a0009  ! 243: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc3ea2b80  ! 243: PREFETCHA_I	prefetcha	[%r8, + 0x0b80] %asi, #one_read
	.word 0xc4320009  ! 246: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc84a2698  ! 246: LDSB_I	ldsb	[%r8 + 0x0698], %r4
	.word 0xcc2a0009  ! 249: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xde0a0009  ! 249: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xa7222bc8  ! 249: MULScc_I	mulscc 	%r8, 0x0bc8, %r19
	.word 0xc2720009  ! 252: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 252: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x85a20829  ! 252: FADDs	fadds	%f8, %f9, %f2
	.word 0xc82a0009  ! 255: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc44a0009  ! 255: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143e04e  ! 255: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc4720009  ! 258: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc44a0009  ! 258: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xfc0a0009  ! 258: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xdd3a0009  ! 261: STDF_R	std	%f14, [%r9, %r8]
	.word 0xcc520009  ! 261: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc20a2b44  ! 261: LDUB_I	ldub	[%r8 + 0x0b44], %r1
	.word 0xfc320009  ! 264: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xd65a0009  ! 264: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xd6822f9c  ! 264: LDUWA_I	lduwa	[%r8, + 0x0f9c] %asi, %r11
	.word 0xf4720009  ! 267: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc40a0009  ! 267: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xbc5a2098  ! 267: SMUL_I	smul 	%r8, 0x0098, %r30
	.word 0xca320009  ! 270: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcb020009  ! 270: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc2ea1009  ! 270: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xd9220009  ! 273: STF_R	st	%f12, [%r9, %r8]
	.word 0xdc1a0009  ! 273: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x8143c000  ! 273: STBAR	stbar
	.word 0xf4220009  ! 276: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xdb020009  ! 276: LDF_R	ld	[%r8, %r9], %f13
	.word 0xc4aa24c0  ! 276: STBA_I	stba	%r2, [%r8 + 0x04c0] %asi
	.word 0xfd3a0009  ! 279: STDF_R	std	%f30, [%r9, %r8]
	.word 0xd81a0009  ! 279: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xc3ea1009  ! 279: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca320009  ! 282: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce420009  ! 282: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x2ac20001  ! 282: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xc62a0009  ! 285: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xfe520009  ! 285: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0x867a0009  ! 285: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xce320009  ! 288: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce0a0009  ! 288: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc2fa2b34  ! 288: SWAPA_I	swapa	%r1, [%r8 + 0x0b34] %asi
	.word 0xdd3a0009  ! 291: STDF_R	std	%f14, [%r9, %r8]
	.word 0xef020009  ! 291: LDF_R	ld	[%r8, %r9], %f23
	.word 0xd9220009  ! 291: STF_R	st	%f12, [%r9, %r8]
	.word 0xf4720009  ! 294: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xf6020009  ! 294: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0x8e520009  ! 294: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xe93a0009  ! 297: STDF_R	std	%f20, [%r9, %r8]
	.word 0xd8520009  ! 297: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0x0a800001  ! 297: BCS	bcs  	<label_0x1>
	.word 0xcf220009  ! 300: STF_R	st	%f7, [%r9, %r8]
	.word 0xf2420009  ! 300: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xc40a0009  ! 300: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc82a0009  ! 303: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf4520009  ! 303: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x8cfa210c  ! 303: SDIVcc_I	sdivcc 	%r8, 0x010c, %r6
	.word 0xf6220009  ! 306: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xe0520009  ! 306: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x84da0009  ! 306: SMULcc_R	smulcc 	%r8, %r9, %r2
	.word 0xce220009  ! 309: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xdb1a0009  ! 309: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0xc2f21009  ! 309: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 312: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcf1a0009  ! 312: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xe49a1009  ! 312: LDDA_R	ldda	[%r8, %r9] 0x80, %r18
	.word 0xe82a0009  ! 315: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xcd1a0009  ! 315: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc5f21009  ! 315: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xca320009  ! 318: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xec0a0009  ! 318: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0xce7a0009  ! 318: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xda320009  ! 321: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xcf1a0009  ! 321: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8cd224dc  ! 321: UMULcc_I	umulcc 	%r8, 0x04dc, %r6
	.word 0xc33a0009  ! 324: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc41a0009  ! 324: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xa6f20009  ! 324: UDIVcc_R	udivcc 	%r8, %r9, %r19
	.word 0xf8220009  ! 327: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xca420009  ! 327: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc09a2200  ! 327: LDDA_I	ldda	[%r8, + 0x0200] %asi, %r0
	.word 0xc73a0009  ! 330: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca0a0009  ! 330: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8ba209a9  ! 330: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xf42a0009  ! 333: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xe6020009  ! 333: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xeeca1009  ! 333: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r23
	.word 0xc2320009  ! 336: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 336: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xbd6a2ff4  ! 336: SDIVX_I	sdivx	%r8, 0x0ff4, %r30
	.word 0xe13a0009  ! 339: STDF_R	std	%f16, [%r9, %r8]
	.word 0xec520009  ! 339: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0x8ba209a9  ! 339: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xcd3a0009  ! 342: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc41a0009  ! 342: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x26ca0001  ! 342: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xcf220009  ! 345: STF_R	st	%f7, [%r9, %r8]
	.word 0xfa520009  ! 345: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xcc4a27cc  ! 345: LDSB_I	ldsb	[%r8 + 0x07cc], %r6
	.word 0xef220009  ! 348: STF_R	st	%f23, [%r9, %r8]
	.word 0xc81a0009  ! 348: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0xcd220009  ! 351: STF_R	st	%f6, [%r9, %r8]
	.word 0xce420009  ! 351: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x884a2870  ! 351: MULX_I	mulx 	%r8, 0x0870, %r4
	.word 0xe6220009  ! 354: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc64a0009  ! 354: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3ea2428  ! 354: PREFETCHA_I	prefetcha	[%r8, + 0x0428] %asi, #one_read
	.word 0xe1220009  ! 357: STF_R	st	%f16, [%r9, %r8]
	.word 0xee520009  ! 357: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x864a0009  ! 357: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xc3220009  ! 360: STF_R	st	%f1, [%r9, %r8]
	.word 0xe31a0009  ! 360: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xde821009  ! 360: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r15
	.word 0xc22a0009  ! 363: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca520009  ! 363: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc8ba24f0  ! 363: STDA_I	stda	%r4, [%r8 + 0x04f0] %asi
	.word 0xed220009  ! 366: STF_R	st	%f22, [%r9, %r8]
	.word 0xc3020009  ! 366: LDF_R	ld	[%r8, %r9], %f1
	.word 0x2c800001  ! 366: BNEG	bneg,a	<label_0x1>
	.word 0xdd220009  ! 369: STF_R	st	%f14, [%r9, %r8]
	.word 0xcd1a0009  ! 369: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x36800001  ! 369: BGE	bge,a	<label_0x1>
	.word 0xc82a0009  ! 372: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe64a0009  ! 372: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xc36a2450  ! 372: PREFETCH_I	prefetch	[%r8 + 0x0450], #one_read
	.word 0xc42a0009  ! 375: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xfd020009  ! 375: LDF_R	ld	[%r8, %r9], %f30
	.word 0xc01a2170  ! 375: LDD_I	ldd	[%r8 + 0x0170], %r0
	.word 0xc73a0009  ! 378: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc91a0009  ! 378: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x98520009  ! 378: UMUL_R	umul 	%r8, %r9, %r12
	.word 0xc9220009  ! 381: STF_R	st	%f4, [%r9, %r8]
	.word 0xce4a0009  ! 381: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143e044  ! 381: MEMBAR	membar	#LoadStore | #Sync 
	.word 0xcb3a0009  ! 384: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf8520009  ! 384: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xc84a0009  ! 384: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc73a0009  ! 387: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf64a0009  ! 387: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xc36a2f2c  ! 387: PREFETCH_I	prefetch	[%r8 + 0x0f2c], #one_read
	.word 0xcc720009  ! 390: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 390: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xa1a208a9  ! 390: FSUBs	fsubs	%f8, %f9, %f16
	.word 0xf6220009  ! 393: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xc4520009  ! 393: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143e022  ! 393: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xc22a0009  ! 396: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc8520009  ! 396: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 396: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc42a0009  ! 399: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 399: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8fa20829  ! 399: FADDs	fadds	%f8, %f9, %f7
	.word 0xc33a0009  ! 402: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc91a0009  ! 402: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x86722064  ! 402: UDIV_I	udiv 	%r8, 0x0064, %r3
	.word 0xc8720009  ! 405: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 405: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xccc2299c  ! 405: LDSWA_I	ldswa	[%r8, + 0x099c] %asi, %r6
	.word 0xe8320009  ! 408: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xca520009  ! 408: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc68a1009  ! 408: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xec320009  ! 411: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc41a0009  ! 411: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xcc92254c  ! 411: LDUHA_I	lduha	[%r8, + 0x054c] %asi, %r6
	.word 0xce320009  ! 414: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf2020009  ! 414: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x04c20001  ! 414: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xc2720009  ! 417: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8120009  ! 417: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xab220009  ! 417: MULScc_R	mulscc 	%r8, %r9, %r21
	.word 0xcb3a0009  ! 420: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcb020009  ! 420: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc3ea1009  ! 420: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2720009  ! 423: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 423: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc7222280  ! 423: STF_I	st	%f3, [0x0280, %r8]
	.word 0xda720009  ! 426: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc81a0009  ! 426: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143e046  ! 426: MEMBAR	membar	#StoreLoad | #LoadStore | #Sync 
	.word 0xc5220009  ! 429: STF_R	st	%f2, [%r9, %r8]
	.word 0xd6420009  ! 429: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xe07a0009  ! 429: SWAP_R	swap	%r16, [%r8 + %r9]
	.word 0xc2720009  ! 432: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcf020009  ! 432: LDF_R	ld	[%r8, %r9], %f7
	.word 0xa2fa2238  ! 432: SDIVcc_I	sdivcc 	%r8, 0x0238, %r17
	.word 0xd93a0009  ! 435: STDF_R	std	%f12, [%r9, %r8]
	.word 0xce520009  ! 435: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x89a20929  ! 435: FMULs	fmuls	%f8, %f9, %f4
	.word 0xc4320009  ! 438: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce420009  ! 438: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xe2b22130  ! 438: STHA_I	stha	%r17, [%r8 + 0x0130] %asi
	.word 0xee2a0009  ! 441: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xce4a0009  ! 441: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xccba2250  ! 441: STDA_I	stda	%r6, [%r8 + 0x0250] %asi
	.word 0xc8320009  ! 444: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 444: LDF_R	ld	[%r8, %r9], %f4
	.word 0xfaf21009  ! 444: STXA_R	stxa	%r29, [%r8 + %r9] 0x80
	.word 0xeb220009  ! 447: STF_R	st	%f21, [%r9, %r8]
	.word 0xcc5a0009  ! 447: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x0a800002  ! 447: BCS	bcs  	<label_0x2>
	.word 0xd62a0009  ! 450: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xf6420009  ! 450: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x2e800001  ! 450: BVS	bvs,a	<label_0x1>
	.word 0xde220009  ! 453: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xca420009  ! 453: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xfafa2b5c  ! 453: SWAPA_I	swapa	%r29, [%r8 + 0x0b5c] %asi
	.word 0xc2220009  ! 456: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc4020009  ! 456: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x14800001  ! 456: BG	bg  	<label_0x1>
	.word 0xc9220009  ! 459: STF_R	st	%f4, [%r9, %r8]
	.word 0xc40a0009  ! 459: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x2e800001  ! 459: BVS	bvs,a	<label_0x1>
	.word 0xc2320009  ! 462: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 462: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xf45a0009  ! 462: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0xce2a0009  ! 465: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe0020009  ! 465: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x8c5a2f24  ! 465: SMUL_I	smul 	%r8, 0x0f24, %r6
	.word 0xcc320009  ! 468: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe0420009  ! 468: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xcc5221d0  ! 468: LDSH_I	ldsh	[%r8 + 0x01d0], %r6
	.word 0xe02a0009  ! 471: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xcc120009  ! 471: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x06c20001  ! 471: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xe6720009  ! 474: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xcd020009  ! 474: LDF_R	ld	[%r8, %r9], %f6
	.word 0xe8a21009  ! 474: STWA_R	stwa	%r20, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 477: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce0a0009  ! 477: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xf11a0009  ! 477: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xce220009  ! 480: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf81a0009  ! 480: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xceb21009  ! 480: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xee320009  ! 483: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xd8420009  ! 483: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x32800002  ! 483: BNE	bne,a	<label_0x2>
	.word 0xc22a0009  ! 486: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 486: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x1a800001  ! 486: BCC	bcc  	<label_0x1>
	.word 0xda720009  ! 489: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xca020009  ! 489: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x22c20001  ! 489: BRZ	brz,a,nt	%8,<label_0x20001>
	.word 0xf82a0009  ! 492: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc31a0009  ! 492: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xf81a2238  ! 492: LDD_I	ldd	[%r8 + 0x0238], %r28
	.word 0xc9220009  ! 495: STF_R	st	%f4, [%r9, %r8]
	.word 0xc9020009  ! 495: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143c000  ! 495: STBAR	stbar
	.word 0xca220009  ! 498: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc25a0009  ! 498: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xccb22dbc  ! 498: STHA_I	stha	%r6, [%r8 + 0x0dbc] %asi
	.word 0xca2a0009  ! 501: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc8520009  ! 501: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc7022180  ! 501: LDF_I	ld	[%r8, 0x0180], %f3
	.word 0xc7220009  ! 504: STF_R	st	%f3, [%r9, %r8]
	.word 0xc80a0009  ! 504: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xf4a220f0  ! 504: STWA_I	stwa	%r26, [%r8 + 0x00f0] %asi
	.word 0xc6220009  ! 507: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 507: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8ad22e5c  ! 507: UMULcc_I	umulcc 	%r8, 0x0e5c, %r5
	.word 0xc2220009  ! 510: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xec1a0009  ! 510: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc3ea1009  ! 510: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd3a0009  ! 513: STDF_R	std	%f6, [%r9, %r8]
	.word 0xf2420009  ! 513: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x8143e054  ! 513: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xc73a0009  ! 516: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc120009  ! 516: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcc9a1009  ! 516: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xc22a0009  ! 519: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce020009  ! 519: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xf4ea2d50  ! 519: LDSTUBA_I	ldstuba	%r26, [%r8 + 0x0d50] %asi
	.word 0xc4320009  ! 522: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc91a0009  ! 522: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc32224f8  ! 522: STF_I	st	%f1, [0x04f8, %r8]
	.word 0xc5220009  ! 525: STF_R	st	%f2, [%r9, %r8]
	.word 0xca520009  ! 525: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xceaa1009  ! 525: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xdc320009  ! 528: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xf0020009  ! 528: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xc3ea2820  ! 528: PREFETCHA_I	prefetcha	[%r8, + 0x0820] %asi, #one_read
	.word 0xfa2a0009  ! 531: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xd81a0009  ! 531: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xfcaa1009  ! 531: STBA_R	stba	%r30, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 534: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc120009  ! 534: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc4ea2ec4  ! 534: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0ec4] %asi
	.word 0xde320009  ! 537: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc6020009  ! 537: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4821009  ! 537: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xc8220009  ! 540: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xee0a0009  ! 540: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xc36a0009  ! 540: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc42a0009  ! 543: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xed020009  ! 543: LDF_R	ld	[%r8, %r9], %f22
	.word 0xf89a2d30  ! 543: LDDA_I	ldda	[%r8, + 0x0d30] %asi, %r28
	.word 0xe1220009  ! 546: STF_R	st	%f16, [%r9, %r8]
	.word 0xcc5a0009  ! 546: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xea020009  ! 546: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xcf220009  ! 549: STF_R	st	%f7, [%r9, %r8]
	.word 0xcd020009  ! 549: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc0ba2818  ! 549: STDA_I	stda	%r0, [%r8 + 0x0818] %asi
	.word 0xd7220009  ! 552: STF_R	st	%f11, [%r9, %r8]
	.word 0xcd1a0009  ! 552: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xf6821009  ! 552: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r27
	.word 0xc5220009  ! 555: STF_R	st	%f2, [%r9, %r8]
	.word 0xce5a0009  ! 555: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcd3a2c70  ! 555: STDF_I	std	%f6, [0x0c70, %r8]
	.word 0xef3a0009  ! 558: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc80a0009  ! 558: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xf6020009  ! 558: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xc82a0009  ! 561: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xda0a0009  ! 561: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0xc8120009  ! 561: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xf2220009  ! 564: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xce420009  ! 564: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 564: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd220009  ! 567: STF_R	st	%f6, [%r9, %r8]
	.word 0xca0a0009  ! 567: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xcf222138  ! 567: STF_I	st	%f7, [0x0138, %r8]
	.word 0xc22a0009  ! 570: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6520009  ! 570: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8c5a0009  ! 570: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc8320009  ! 573: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca4a0009  ! 573: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x30800002  ! 573: BA	ba,a	<label_0x2>
	.word 0xc9220009  ! 576: STF_R	st	%f4, [%r9, %r8]
	.word 0xca5a0009  ! 576: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 576: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf0320009  ! 579: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xce020009  ! 579: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xf8120009  ! 579: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xc8220009  ! 582: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 582: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x0a800001  ! 582: BCS	bcs  	<label_0x1>
	.word 0xcd220009  ! 585: STF_R	st	%f6, [%r9, %r8]
	.word 0xec120009  ! 585: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0x34800001  ! 585: BG	bg,a	<label_0x1>
	.word 0xee320009  ! 588: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xf24a0009  ! 588: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xc3f22009  ! 588: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xc7220009  ! 591: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc520009  ! 591: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xf4ba1009  ! 591: STDA_R	stda	%r26, [%r8 + %r9] 0x80
	.word 0xe2720009  ! 594: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xd6420009  ! 594: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0x8143e00d  ! 594: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore 
	.word 0xce320009  ! 597: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc4a0009  ! 597: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc73a21b8  ! 597: STDF_I	std	%f3, [0x01b8, %r8]
	.word 0xc8320009  ! 600: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe2420009  ! 600: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xc73a0009  ! 600: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4220009  ! 603: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 603: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xe86a0009  ! 603: LDSTUB_R	ldstub	%r20, [%r8 + %r9]
	.word 0xcf220009  ! 606: STF_R	st	%f7, [%r9, %r8]
	.word 0xec420009  ! 606: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xea0a0009  ! 606: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xea2a0009  ! 609: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc2020009  ! 609: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc2ca1009  ! 609: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xc6220009  ! 612: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf6120009  ! 612: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0x8f2221d0  ! 612: MULScc_I	mulscc 	%r8, 0x01d0, %r7
	.word 0xc8320009  ! 615: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe00a0009  ! 615: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xc3ea2da4  ! 615: PREFETCHA_I	prefetcha	[%r8, + 0x0da4] %asi, #one_read
	.word 0xc9220009  ! 618: STF_R	st	%f4, [%r9, %r8]
	.word 0xec4a0009  ! 618: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xada208a9  ! 618: FSUBs	fsubs	%f8, %f9, %f22
	.word 0xc6320009  ! 621: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcb020009  ! 621: LDF_R	ld	[%r8, %r9], %f5
	.word 0xeef21009  ! 621: STXA_R	stxa	%r23, [%r8 + %r9] 0x80
	.word 0xe2220009  ! 624: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xce0a0009  ! 624: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x864a0009  ! 624: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xc6220009  ! 627: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc3020009  ! 627: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e02a  ! 627: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xc53a0009  ! 630: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcb020009  ! 630: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc8ba1009  ! 630: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 633: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc84a0009  ! 633: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc3ea2d20  ! 633: PREFETCHA_I	prefetcha	[%r8, + 0x0d20] %asi, #one_read
	.word 0xe3220009  ! 636: STF_R	st	%f17, [%r9, %r8]
	.word 0xf9020009  ! 636: LDF_R	ld	[%r8, %r9], %f28
	.word 0xc3ea2b30  ! 636: PREFETCHA_I	prefetcha	[%r8, + 0x0b30] %asi, #one_read
	.word 0xc4720009  ! 639: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca5a0009  ! 639: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc8020009  ! 639: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc2320009  ! 642: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xfc0a0009  ! 642: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0xd66a2eb0  ! 642: LDSTUB_I	ldstub	%r11, [%r8 + 0x0eb0]
	.word 0xca720009  ! 645: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe71a0009  ! 645: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xb85a0009  ! 645: SMUL_R	smul 	%r8, %r9, %r28
	.word 0xf8720009  ! 648: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xcf020009  ! 648: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc44a0009  ! 648: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xce220009  ! 651: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xda4a0009  ! 651: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xac520009  ! 651: UMUL_R	umul 	%r8, %r9, %r22
	.word 0xf2720009  ! 654: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc81a0009  ! 654: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xccfa1009  ! 654: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xde220009  ! 657: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc2520009  ! 657: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xca5a2f10  ! 657: LDX_I	ldx	[%r8 + 0x0f10], %r5
	.word 0xcf3a0009  ! 660: STDF_R	std	%f7, [%r9, %r8]
	.word 0xd6520009  ! 660: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xb45a0009  ! 660: SMUL_R	smul 	%r8, %r9, %r26
	.word 0xc8220009  ! 663: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe6020009  ! 663: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0x97a209a9  ! 663: FDIVs	fdivs	%f8, %f9, %f11
	.word 0xc4720009  ! 666: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc8520009  ! 666: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x02800001  ! 666: BE	be  	<label_0x1>
	.word 0xc8220009  ! 669: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca420009  ! 669: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xe60a0009  ! 669: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xca220009  ! 672: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf0420009  ! 672: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0x8143c000  ! 672: STBAR	stbar
	.word 0xca320009  ! 675: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 675: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x1e800001  ! 675: BVC	bvc  	<label_0x1>
	.word 0xe1220009  ! 678: STF_R	st	%f16, [%r9, %r8]
	.word 0xe25a0009  ! 678: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xd6ca1009  ! 678: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r11
	.word 0xc2320009  ! 681: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf84a0009  ! 681: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x12800001  ! 681: BNE	bne  	<label_0x1>
	.word 0xc53a0009  ! 684: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc41a0009  ! 684: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x864a25cc  ! 684: MULX_I	mulx 	%r8, 0x05cc, %r3
	.word 0xf53a0009  ! 687: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc40a0009  ! 687: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc8d21009  ! 687: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r4
	.word 0xe73a0009  ! 690: STDF_R	std	%f19, [%r9, %r8]
	.word 0xee020009  ! 690: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xe2c22b34  ! 690: LDSWA_I	ldswa	[%r8, + 0x0b34] %asi, %r17
	.word 0xf7220009  ! 693: STF_R	st	%f27, [%r9, %r8]
	.word 0xce5a0009  ! 693: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xa7a208a9  ! 693: FSUBs	fsubs	%f8, %f9, %f19
	.word 0xcb3a0009  ! 696: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe1020009  ! 696: LDF_R	ld	[%r8, %r9], %f16
	.word 0xc36a29f0  ! 696: PREFETCH_I	prefetch	[%r8 + 0x09f0], #one_read
	.word 0xc6220009  ! 699: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 699: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xa84a2738  ! 699: MULX_I	mulx 	%r8, 0x0738, %r20
	.word 0xca720009  ! 702: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc0a0009  ! 702: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc6122f40  ! 702: LDUH_I	lduh	[%r8 + 0x0f40], %r3
	.word 0xce2a0009  ! 705: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 705: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xbfa20829  ! 705: FADDs	fadds	%f8, %f9, %f31
	.word 0xf22a0009  ! 708: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xe6020009  ! 708: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xc36a23bc  ! 708: PREFETCH_I	prefetch	[%r8 + 0x03bc], #one_read
	.word 0xcc220009  ! 711: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 711: LDF_R	ld	[%r8, %r9], %f4
	.word 0xd6ea26d8  ! 711: LDSTUBA_I	ldstuba	%r11, [%r8 + 0x06d8] %asi
	.word 0xce320009  ! 714: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 714: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x0c800002  ! 714: BNEG	bneg  	<label_0x2>
	.word 0xc4720009  ! 717: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc2120009  ! 717: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc47a2594  ! 717: SWAP_I	swap	%r2, [%r8 + 0x0594]
	.word 0xff220009  ! 720: STF_R	st	%f31, [%r9, %r8]
	.word 0xc4420009  ! 720: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 720: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce320009  ! 723: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 723: LDF_R	ld	[%r8, %r9], %f4
	.word 0xccb223b4  ! 723: STHA_I	stha	%r6, [%r8 + 0x03b4] %asi
	.word 0xc7220009  ! 726: STF_R	st	%f3, [%r9, %r8]
	.word 0xc60a0009  ! 726: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 726: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4320009  ! 729: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xfa4a0009  ! 729: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xfd3a2ae8  ! 729: STDF_I	std	%f30, [0x0ae8, %r8]
	.word 0xc4720009  ! 732: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc6420009  ! 732: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 732: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc5220009  ! 735: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8520009  ! 735: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8a6a24d0  ! 735: UDIVX_I	udivx 	%r8, 0x04d0, %r5
	.word 0xd93a0009  ! 738: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc6420009  ! 738: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xdf3a2ee8  ! 738: STDF_I	std	%f15, [0x0ee8, %r8]
	.word 0xc4720009  ! 741: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca4a0009  ! 741: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc4ba1009  ! 741: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 744: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 744: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8c5a218c  ! 744: SMUL_I	smul 	%r8, 0x018c, %r6
	.word 0xc5220009  ! 747: STF_R	st	%f2, [%r9, %r8]
	.word 0xc25a0009  ! 747: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 747: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcf3a0009  ! 750: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce420009  ! 750: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc2c22180  ! 750: LDSWA_I	ldswa	[%r8, + 0x0180] %asi, %r1
	.word 0xc7220009  ! 753: STF_R	st	%f3, [%r9, %r8]
	.word 0xce420009  ! 753: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xdcc21009  ! 753: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r14
	.word 0xcc2a0009  ! 756: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 756: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143e031  ! 756: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xde2a0009  ! 759: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xe01a0009  ! 759: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x8143c000  ! 759: STBAR	stbar
	.word 0xc2320009  ! 762: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4020009  ! 762: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8da208a9  ! 762: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xe2320009  ! 765: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xda420009  ! 765: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xeaea2528  ! 765: LDSTUBA_I	ldstuba	%r21, [%r8 + 0x0528] %asi
	.word 0xc73a0009  ! 768: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf9020009  ! 768: LDF_R	ld	[%r8, %r9], %f28
	.word 0x87a208a9  ! 768: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xcc2a0009  ! 771: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc2020009  ! 771: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x827a0009  ! 771: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc8220009  ! 774: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xdc1a0009  ! 774: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xf20a0009  ! 774: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xca2a0009  ! 777: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe45a0009  ! 777: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xa4da2b6c  ! 777: SMULcc_I	smulcc 	%r8, 0x0b6c, %r18
	.word 0xda2a0009  ! 780: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc60a0009  ! 780: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x89a209a9  ! 780: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc5220009  ! 783: STF_R	st	%f2, [%r9, %r8]
	.word 0xcd020009  ! 783: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea2030  ! 783: PREFETCHA_I	prefetcha	[%r8, + 0x0030] %asi, #one_read
	.word 0xcd3a0009  ! 786: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca420009  ! 786: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x85a208a9  ! 786: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xc93a0009  ! 789: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc40a0009  ! 789: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 789: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca320009  ! 792: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc2420009  ! 792: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xd89225c0  ! 792: LDUHA_I	lduha	[%r8, + 0x05c0] %asi, %r12
	.word 0xc93a0009  ! 795: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcf1a0009  ! 795: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xa0da0009  ! 795: SMULcc_R	smulcc 	%r8, %r9, %r16
	.word 0xcc220009  ! 798: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc1a0009  ! 798: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x845a2a24  ! 798: SMUL_I	smul 	%r8, 0x0a24, %r2
	.word 0xf62a0009  ! 801: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xce520009  ! 801: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc802258c  ! 801: LDUW_I	lduw	[%r8 + 0x058c], %r4
	.word 0xce220009  ! 804: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc20a0009  ! 804: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc6821009  ! 804: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0xcc720009  ! 807: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 807: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xa0d20009  ! 807: UMULcc_R	umulcc 	%r8, %r9, %r16
	.word 0xef3a0009  ! 810: STDF_R	std	%f23, [%r9, %r8]
	.word 0xcd020009  ! 810: LDF_R	ld	[%r8, %r9], %f6
	.word 0x84f2253c  ! 810: UDIVcc_I	udivcc 	%r8, 0x053c, %r2
	.word 0xe2220009  ! 813: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xce420009  ! 813: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3ea2c78  ! 813: PREFETCHA_I	prefetcha	[%r8, + 0x0c78] %asi, #one_read
	.word 0xd62a0009  ! 816: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc20a0009  ! 816: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x22800002  ! 816: BE	be,a	<label_0x2>
	.word 0xcc720009  ! 819: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca520009  ! 819: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x2e800002  ! 819: BVS	bvs,a	<label_0x2>
	.word 0xc6720009  ! 822: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc20a0009  ! 822: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcaf22b00  ! 822: STXA_I	stxa	%r5, [%r8 + 0x0b00] %asi
	.word 0xec2a0009  ! 825: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xfc1a0009  ! 825: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc5f22009  ! 825: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xcc2a0009  ! 828: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcb1a0009  ! 828: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xa2da0009  ! 828: SMULcc_R	smulcc 	%r8, %r9, %r17
	.word 0xc3220009  ! 831: STF_R	st	%f1, [%r9, %r8]
	.word 0xfa020009  ! 831: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x8143e047  ! 831: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xc53a0009  ! 834: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc60a0009  ! 834: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x14800002  ! 834: BG	bg  	<label_0x2>
	.word 0xc2220009  ! 837: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 837: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8a7a0009  ! 837: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xc8220009  ! 840: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 840: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 840: STBAR	stbar
	.word 0xce320009  ! 843: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 843: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143e04d  ! 843: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc22a0009  ! 846: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc0a0009  ! 846: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc46a0009  ! 846: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xcd3a0009  ! 849: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc81a0009  ! 849: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x26800001  ! 849: BL	bl,a	<label_0x1>
	.word 0xc9220009  ! 852: STF_R	st	%f4, [%r9, %r8]
	.word 0xe0520009  ! 852: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x88522e30  ! 852: UMUL_I	umul 	%r8, 0x0e30, %r4
	.word 0xc5220009  ! 855: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc120009  ! 855: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8ba209a9  ! 855: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc2220009  ! 858: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 858: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8e6a0009  ! 858: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0xcd220009  ! 861: STF_R	st	%f6, [%r9, %r8]
	.word 0xfc020009  ! 861: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xceda2828  ! 861: LDXA_I	ldxa	[%r8, + 0x0828] %asi, %r7
	.word 0xc9220009  ! 864: STF_R	st	%f4, [%r9, %r8]
	.word 0xce0a0009  ! 864: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xceaa1009  ! 864: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 867: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca4a0009  ! 867: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 867: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca220009  ! 870: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe45a0009  ! 870: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0x0ec20001  ! 870: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xc4720009  ! 873: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca4a0009  ! 873: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x884a2090  ! 873: MULX_I	mulx 	%r8, 0x0090, %r4
	.word 0xc6220009  ! 876: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcb020009  ! 876: LDF_R	ld	[%r8, %r9], %f5
	.word 0x34800001  ! 876: BG	bg,a	<label_0x1>
	.word 0xfc220009  ! 879: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc51a0009  ! 879: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x85a209a9  ! 879: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xca720009  ! 882: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 882: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc36a0009  ! 882: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc5220009  ! 885: STF_R	st	%f2, [%r9, %r8]
	.word 0xce420009  ! 885: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcbf21009  ! 885: CASXA_I	casxa	[%r8] 0x80, %r9, %r5
	.word 0xc4720009  ! 888: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca5a0009  ! 888: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xcca22c70  ! 888: STWA_I	stwa	%r6, [%r8 + 0x0c70] %asi
	.word 0xe0320009  ! 891: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc3020009  ! 891: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e073  ! 891: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xdc720009  ! 894: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc01a0009  ! 894: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc36a22e8  ! 894: PREFETCH_I	prefetch	[%r8 + 0x02e8], #one_read
	.word 0xda2a0009  ! 897: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xcf020009  ! 897: LDF_R	ld	[%r8, %r9], %f7
	.word 0xd8ea2a54  ! 897: LDSTUBA_I	ldstuba	%r12, [%r8 + 0x0a54] %asi
	.word 0xe2220009  ! 900: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc6420009  ! 900: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xceea1009  ! 900: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 903: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xec5a0009  ! 903: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xfa0a2c38  ! 903: LDUB_I	ldub	[%r8 + 0x0c38], %r29
	.word 0xcc2a0009  ! 906: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 906: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8143e078  ! 906: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xca220009  ! 909: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 909: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x82520009  ! 909: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xf13a0009  ! 912: STDF_R	std	%f24, [%r9, %r8]
	.word 0xcd1a0009  ! 912: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xfcd21009  ! 912: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r30
	.word 0xc7220009  ! 915: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4020009  ! 915: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x24c20001  ! 915: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc8220009  ! 918: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xde420009  ! 918: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0x8143e00f  ! 918: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore 
	.word 0xf8720009  ! 921: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc6520009  ! 921: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc33a2d70  ! 921: STDF_I	std	%f1, [0x0d70, %r8]
	.word 0xfe220009  ! 924: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xd91a0009  ! 924: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xb4522c3c  ! 924: UMUL_I	umul 	%r8, 0x0c3c, %r26
	.word 0xf2220009  ! 927: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xe01a0009  ! 927: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xc36a0009  ! 927: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4220009  ! 930: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc45a0009  ! 930: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xd6a22fac  ! 930: STWA_I	stwa	%r11, [%r8 + 0x0fac] %asi
	.word 0xc2220009  ! 933: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 933: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 933: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc33a0009  ! 936: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcd1a0009  ! 936: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x86f22c00  ! 936: UDIVcc_I	udivcc 	%r8, 0x0c00, %r3
	.word 0xf0220009  ! 939: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xe2520009  ! 939: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0x8c5a21f4  ! 939: SMUL_I	smul 	%r8, 0x01f4, %r6
	.word 0xcc320009  ! 942: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xee120009  ! 942: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xc67a256c  ! 942: SWAP_I	swap	%r3, [%r8 + 0x056c]
	.word 0xce2a0009  ! 945: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc64a0009  ! 945: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xe25a2b78  ! 945: LDX_I	ldx	[%r8 + 0x0b78], %r17
	.word 0xf13a0009  ! 948: STDF_R	std	%f24, [%r9, %r8]
	.word 0xca0a0009  ! 948: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x2ec20001  ! 948: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xc8220009  ! 951: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc65a0009  ! 951: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8cda0009  ! 951: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xe4720009  ! 954: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xcc4a0009  ! 954: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xceea1009  ! 954: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xca720009  ! 957: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc8120009  ! 957: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc44a2b74  ! 957: LDSB_I	ldsb	[%r8 + 0x0b74], %r2
	.word 0xd7220009  ! 960: STF_R	st	%f11, [%r9, %r8]
	.word 0xc65a0009  ! 960: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc6b21009  ! 960: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 963: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe25a0009  ! 963: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xcafa2710  ! 963: SWAPA_I	swapa	%r5, [%r8 + 0x0710] %asi
	.word 0xc22a0009  ! 966: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc3020009  ! 966: LDF_R	ld	[%r8, %r9], %f1
	.word 0xbc7a0009  ! 966: SDIV_R	sdiv 	%r8, %r9, %r30
	.word 0xcc320009  ! 969: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf8120009  ! 969: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xc36a0009  ! 969: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc9220009  ! 972: STF_R	st	%f4, [%r9, %r8]
	.word 0xf40a0009  ! 972: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xc3ea2e30  ! 972: PREFETCHA_I	prefetcha	[%r8, + 0x0e30] %asi, #one_read
	.word 0xca220009  ! 975: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce5a0009  ! 975: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xb3a209a9  ! 975: FDIVs	fdivs	%f8, %f9, %f25
	.word 0xc8320009  ! 978: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce4a0009  ! 978: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143c000  ! 978: STBAR	stbar
	.word 0xdd220009  ! 981: STF_R	st	%f14, [%r9, %r8]
	.word 0xc6520009  ! 981: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcc8a1009  ! 981: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xcc720009  ! 984: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 984: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x0a800002  ! 984: BCS	bcs  	<label_0x2>
	.word 0xc2320009  ! 987: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 987: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xca922394  ! 987: LDUHA_I	lduha	[%r8, + 0x0394] %asi, %r5
	.word 0xcc2a0009  ! 990: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xed1a0009  ! 990: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xb7220009  ! 990: MULScc_R	mulscc 	%r8, %r9, %r27
	.word 0xdd220009  ! 993: STF_R	st	%f14, [%r9, %r8]
	.word 0xe25a0009  ! 993: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x8143e02b  ! 993: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xc42a0009  ! 996: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc6520009  ! 996: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x24ca0001  ! 996: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xeb220009  ! 999: STF_R	st	%f21, [%r9, %r8]
	.word 0xde420009  ! 999: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xc3ea1009  ! 999: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3220009  ! 1002: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4020009  ! 1002: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x04800001  ! 1002: BLE	ble  	<label_0x1>
	.word 0xcf3a0009  ! 1005: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcf020009  ! 1005: LDF_R	ld	[%r8, %r9], %f7
	.word 0xcaf225a8  ! 1005: STXA_I	stxa	%r5, [%r8 + 0x05a8] %asi
	.word 0xd82a0009  ! 1008: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xf05a0009  ! 1008: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x30800002  ! 1008: BA	ba,a	<label_0x2>
	.word 0xc4720009  ! 1011: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc520009  ! 1011: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x84d20009  ! 1011: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xcb3a0009  ! 1014: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc4020009  ! 1014: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc9220009  ! 1014: STF_R	st	%f4, [%r9, %r8]
	.word 0xed3a0009  ! 1017: STDF_R	std	%f22, [%r9, %r8]
	.word 0xef1a0009  ! 1017: LDDF_R	ldd	[%r8, %r9], %f23
	.word 0x32800001  ! 1017: BNE	bne,a	<label_0x1>
	.word 0xf4220009  ! 1020: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc20a0009  ! 1020: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xf2aa269c  ! 1020: STBA_I	stba	%r25, [%r8 + 0x069c] %asi
	.word 0xca220009  ! 1023: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce5a0009  ! 1023: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3220009  ! 1023: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc2a0009  ! 1026: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe81a0009  ! 1026: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x8c5a0009  ! 1026: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc4720009  ! 1029: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe8120009  ! 1029: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xc8921009  ! 1029: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xc62a0009  ! 1032: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe6420009  ! 1032: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xf6da1009  ! 1032: LDXA_R	ldxa	[%r8, %r9] 0x80, %r27
	.word 0xca2a0009  ! 1035: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc5020009  ! 1035: LDF_R	ld	[%r8, %r9], %f2
	.word 0xceaa1009  ! 1035: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 1038: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 1038: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x86720009  ! 1038: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xd8320009  ! 1041: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc6420009  ! 1041: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 1041: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc33a0009  ! 1044: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce0a0009  ! 1044: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xcafa2fd4  ! 1044: SWAPA_I	swapa	%r5, [%r8 + 0x0fd4] %asi
	.word 0xe73a0009  ! 1047: STDF_R	std	%f19, [%r9, %r8]
	.word 0xcc0a0009  ! 1047: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8f222dc8  ! 1047: MULScc_I	mulscc 	%r8, 0x0dc8, %r7
	.word 0xc9220009  ! 1050: STF_R	st	%f4, [%r9, %r8]
	.word 0xca020009  ! 1050: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcb1a21b8  ! 1050: LDDF_I	ldd	[%r8, 0x01b8], %f5
	.word 0xc73a0009  ! 1053: STDF_R	std	%f3, [%r9, %r8]
	.word 0xea0a0009  ! 1053: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xcd2226e8  ! 1053: STF_I	st	%f6, [0x06e8, %r8]
	.word 0xe0220009  ! 1056: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc8420009  ! 1056: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe6a21009  ! 1056: STWA_R	stwa	%r19, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 1059: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc6520009  ! 1059: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143e022  ! 1059: MEMBAR	membar	#StoreLoad | #MemIssue 
	.word 0xcc220009  ! 1062: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc8520009  ! 1062: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8143e073  ! 1062: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xc22a0009  ! 1065: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf40a0009  ! 1065: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xc72228d4  ! 1065: STF_I	st	%f3, [0x08d4, %r8]
	.word 0xf5220009  ! 1068: STF_R	st	%f26, [%r9, %r8]
	.word 0xd60a0009  ! 1068: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xff222598  ! 1068: STF_I	st	%f31, [0x0598, %r8]
	.word 0xc22a0009  ! 1071: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc91a0009  ! 1071: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcdf21009  ! 1071: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xcc220009  ! 1074: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca420009  ! 1074: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc8c21009  ! 1074: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc6320009  ! 1077: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 1077: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x88d20009  ! 1077: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xc8220009  ! 1080: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 1080: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc6a21009  ! 1080: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 1083: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcd020009  ! 1083: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc01a0009  ! 1083: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xcc720009  ! 1086: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc2420009  ! 1086: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xe66a2ee8  ! 1086: LDSTUB_I	ldstub	%r19, [%r8 + 0x0ee8]
	.word 0xc9220009  ! 1089: STF_R	st	%f4, [%r9, %r8]
	.word 0xc84a0009  ! 1089: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x84fa0009  ! 1089: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xf4720009  ! 1092: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xce020009  ! 1092: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143c000  ! 1092: STBAR	stbar
	.word 0xf1220009  ! 1095: STF_R	st	%f24, [%r9, %r8]
	.word 0xca4a0009  ! 1095: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1095: STBAR	stbar
	.word 0xcd220009  ! 1098: STF_R	st	%f6, [%r9, %r8]
	.word 0xce4a0009  ! 1098: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x99a20829  ! 1098: FADDs	fadds	%f8, %f9, %f12
	.word 0xc93a0009  ! 1101: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc5a0009  ! 1101: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xccfa283c  ! 1101: SWAPA_I	swapa	%r6, [%r8 + 0x083c] %asi
	.word 0xfa320009  ! 1104: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xec020009  ! 1104: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xc2ca1009  ! 1104: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xcc2a0009  ! 1107: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8020009  ! 1107: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc2822b10  ! 1107: LDUWA_I	lduwa	[%r8, + 0x0b10] %asi, %r1
	.word 0xc7220009  ! 1110: STF_R	st	%f3, [%r9, %r8]
	.word 0xc41a0009  ! 1110: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x20800001  ! 1110: BN	bn,a	<label_0x1>
	.word 0xc93a0009  ! 1113: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc6520009  ! 1113: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x3a800001  ! 1113: BCC	bcc,a	<label_0x1>
	.word 0xfc2a0009  ! 1116: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xea520009  ! 1116: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0x02800001  ! 1116: BE	be  	<label_0x1>
	.word 0xc93a0009  ! 1119: STDF_R	std	%f4, [%r9, %r8]
	.word 0xfd020009  ! 1119: LDF_R	ld	[%r8, %r9], %f30
	.word 0x866a0009  ! 1119: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xc4220009  ! 1122: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc9020009  ! 1122: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143c000  ! 1122: STBAR	stbar
	.word 0xe3220009  ! 1125: STF_R	st	%f17, [%r9, %r8]
	.word 0xc2120009  ! 1125: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc8ba1009  ! 1125: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 1128: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 1128: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc3ea2e14  ! 1128: PREFETCHA_I	prefetcha	[%r8, + 0x0e14] %asi, #one_read
	.word 0xc2220009  ! 1131: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc4120009  ! 1131: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1131: STBAR	stbar
	.word 0xca320009  ! 1134: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc65a0009  ! 1134: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8fa209a9  ! 1134: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xcb220009  ! 1137: STF_R	st	%f5, [%r9, %r8]
	.word 0xca120009  ! 1137: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1137: STBAR	stbar
	.word 0xe6220009  ! 1140: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xe2420009  ! 1140: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0x8143e050  ! 1140: MEMBAR	membar	#Lookaside | #Sync 
	.word 0xec2a0009  ! 1143: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xca420009  ! 1143: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143e054  ! 1143: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0xf4720009  ! 1146: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc81a0009  ! 1146: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x885227f4  ! 1146: UMUL_I	umul 	%r8, 0x07f4, %r4
	.word 0xc8220009  ! 1149: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 1149: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3222f3c  ! 1149: STF_I	st	%f1, [0x0f3c, %r8]
	.word 0xf73a0009  ! 1152: STDF_R	std	%f27, [%r9, %r8]
	.word 0xcc120009  ! 1152: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xd4ba2ad0  ! 1152: STDA_I	stda	%r10, [%r8 + 0x0ad0] %asi
	.word 0xd93a0009  ! 1155: STDF_R	std	%f12, [%r9, %r8]
	.word 0xcc4a0009  ! 1155: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x0ec20001  ! 1155: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xcc220009  ! 1158: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe2420009  ! 1158: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0x8efa0009  ! 1158: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xe8320009  ! 1161: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc60a0009  ! 1161: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc49a1009  ! 1161: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc82a0009  ! 1164: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce0a0009  ! 1164: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xdcf22c98  ! 1164: STXA_I	stxa	%r14, [%r8 + 0x0c98] %asi
	.word 0xf0220009  ! 1167: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xcb020009  ! 1167: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143c000  ! 1167: STBAR	stbar
	.word 0xfe220009  ! 1170: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc7020009  ! 1170: LDF_R	ld	[%r8, %r9], %f3
	.word 0x1a800002  ! 1170: BCC	bcc  	<label_0x2>
	.word 0xc73a0009  ! 1173: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd81a0009  ! 1173: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x8143c000  ! 1173: STBAR	stbar
	.word 0xc42a0009  ! 1176: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xd6420009  ! 1176: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xf89a2e80  ! 1176: LDDA_I	ldda	[%r8, + 0x0e80] %asi, %r28
	.word 0xe8720009  ! 1179: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc7020009  ! 1179: LDF_R	ld	[%r8, %r9], %f3
	.word 0xde4a0009  ! 1179: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xf8320009  ! 1182: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc5020009  ! 1182: LDF_R	ld	[%r8, %r9], %f2
	.word 0xe3f21009  ! 1182: CASXA_I	casxa	[%r8] 0x80, %r9, %r17
	.word 0xe5220009  ! 1185: STF_R	st	%f18, [%r9, %r8]
	.word 0xdc020009  ! 1185: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xc89227a4  ! 1185: LDUHA_I	lduha	[%r8, + 0x07a4] %asi, %r4
	.word 0xf22a0009  ! 1188: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc8020009  ! 1188: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8fa209a9  ! 1188: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xf73a0009  ! 1191: STDF_R	std	%f27, [%r9, %r8]
	.word 0xdc0a0009  ! 1191: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xecfa26b4  ! 1191: SWAPA_I	swapa	%r22, [%r8 + 0x06b4] %asi
	.word 0xe1220009  ! 1194: STF_R	st	%f16, [%r9, %r8]
	.word 0xd6120009  ! 1194: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xfab22ab8  ! 1194: STHA_I	stha	%r29, [%r8 + 0x0ab8] %asi
	.word 0xf7220009  ! 1197: STF_R	st	%f27, [%r9, %r8]
	.word 0xc2420009  ! 1197: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xf8b21009  ! 1197: STHA_R	stha	%r28, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 1200: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf60a0009  ! 1200: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xce821009  ! 1200: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xc2720009  ! 1203: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc91a0009  ! 1203: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8e720009  ! 1203: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xcb220009  ! 1206: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4120009  ! 1206: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x9ad20009  ! 1206: UMULcc_R	umulcc 	%r8, %r9, %r13
	.word 0xf3220009  ! 1209: STF_R	st	%f25, [%r9, %r8]
	.word 0xde0a0009  ! 1209: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x826a2118  ! 1209: UDIVX_I	udivx 	%r8, 0x0118, %r1
	.word 0xce320009  ! 1212: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce420009  ! 1212: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc8ba1009  ! 1212: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xc62a0009  ! 1215: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 1215: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8e720009  ! 1215: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xcf3a0009  ! 1218: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe65a0009  ! 1218: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x1a800001  ! 1218: BCC	bcc  	<label_0x1>
	.word 0xfe320009  ! 1221: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xcc020009  ! 1221: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc36a2184  ! 1221: PREFETCH_I	prefetch	[%r8 + 0x0184], #one_read
	.word 0xcc2a0009  ! 1224: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xea0a0009  ! 1224: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xcaf226a8  ! 1224: STXA_I	stxa	%r5, [%r8 + 0x06a8] %asi
	.word 0xcc2a0009  ! 1227: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe8120009  ! 1227: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xc6aa1009  ! 1227: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 1230: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 1230: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143e04a  ! 1230: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xce2a0009  ! 1233: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce520009  ! 1233: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xde7a0009  ! 1233: SWAP_R	swap	%r15, [%r8 + %r9]
	.word 0xc4320009  ! 1236: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf4520009  ! 1236: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xb1a208a9  ! 1236: FSUBs	fsubs	%f8, %f9, %f24
	.word 0xcf3a0009  ! 1239: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2020009  ! 1239: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcc7a0009  ! 1239: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xcd220009  ! 1242: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc1a0009  ! 1242: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x22800002  ! 1242: BE	be,a	<label_0x2>
	.word 0xc9220009  ! 1245: STF_R	st	%f4, [%r9, %r8]
	.word 0xcd1a0009  ! 1245: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x0cca0001  ! 1245: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xc93a0009  ! 1248: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc6420009  ! 1248: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x856a0009  ! 1248: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xc33a0009  ! 1251: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe31a0009  ! 1251: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xfaaa2354  ! 1251: STBA_I	stba	%r29, [%r8 + 0x0354] %asi
	.word 0xca220009  ! 1254: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4120009  ! 1254: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc36a2ee4  ! 1254: PREFETCH_I	prefetch	[%r8 + 0x0ee4], #one_read
	.word 0xe0320009  ! 1257: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xe5020009  ! 1257: LDF_R	ld	[%r8, %r9], %f18
	.word 0x30800001  ! 1257: BA	ba,a	<label_0x1>
	.word 0xc8220009  ! 1260: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xec5a0009  ! 1260: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xee7a2294  ! 1260: SWAP_I	swap	%r23, [%r8 + 0x0294]
	.word 0xc62a0009  ! 1263: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc2020009  ! 1263: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc2921009  ! 1263: LDUHA_R	lduha	[%r8, %r9] 0x80, %r1
	.word 0xca720009  ! 1266: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xd7020009  ! 1266: LDF_R	ld	[%r8, %r9], %f11
	.word 0xc9220009  ! 1266: STF_R	st	%f4, [%r9, %r8]
	.word 0xf6220009  ! 1269: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xca120009  ! 1269: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x82fa0009  ! 1269: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xdc320009  ! 1272: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xca4a0009  ! 1272: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xecb21009  ! 1272: STHA_R	stha	%r22, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 1275: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc7020009  ! 1275: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc71a2950  ! 1275: LDDF_I	ldd	[%r8, 0x0950], %f3
	.word 0xd7220009  ! 1278: STF_R	st	%f11, [%r9, %r8]
	.word 0xc6120009  ! 1278: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x26ca0001  ! 1278: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xe73a0009  ! 1281: STDF_R	std	%f19, [%r9, %r8]
	.word 0xd81a0009  ! 1281: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xcc9a1009  ! 1281: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xc8220009  ! 1284: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc51a0009  ! 1284: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc87a0009  ! 1284: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xce320009  ! 1287: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc01a0009  ! 1287: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x30800002  ! 1287: BA	ba,a	<label_0x2>
	.word 0xf4720009  ! 1290: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc81a0009  ! 1290: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xf0b22564  ! 1290: STHA_I	stha	%r24, [%r8 + 0x0564] %asi
	.word 0xf33a0009  ! 1293: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc81a0009  ! 1293: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xcb222194  ! 1293: STF_I	st	%f5, [0x0194, %r8]
	.word 0xf4320009  ! 1296: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xcc1a0009  ! 1296: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x98fa2af0  ! 1296: SDIVcc_I	sdivcc 	%r8, 0x0af0, %r12
	.word 0xce320009  ! 1299: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 1299: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x3e800001  ! 1299: BVC	bvc,a	<label_0x1>
	.word 0xcb3a0009  ! 1302: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc5a0009  ! 1302: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x9ba208a9  ! 1302: FSUBs	fsubs	%f8, %f9, %f13
	.word 0xc8320009  ! 1305: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 1305: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc36a0009  ! 1305: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc82a0009  ! 1308: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc5a0009  ! 1308: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x86d226b0  ! 1308: UMULcc_I	umulcc 	%r8, 0x06b0, %r3
	.word 0xe82a0009  ! 1311: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xf6520009  ! 1311: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xccfa1009  ! 1311: SWAPA_R	swapa	%r6, [%r8 + %r9] 0x80
	.word 0xef3a0009  ! 1314: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc20a0009  ! 1314: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x1c800001  ! 1314: BPOS	bpos  	<label_0x1>
	.word 0xdc320009  ! 1317: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xce420009  ! 1317: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x2a800002  ! 1317: BCS	bcs,a	<label_0x2>
	.word 0xfd220009  ! 1320: STF_R	st	%f30, [%r9, %r8]
	.word 0xe41a0009  ! 1320: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x12800001  ! 1320: BNE	bne  	<label_0x1>
	.word 0xf6220009  ! 1323: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xc2020009  ! 1323: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xe66a0009  ! 1323: LDSTUB_R	ldstub	%r19, [%r8 + %r9]
	.word 0xd7220009  ! 1326: STF_R	st	%f11, [%r9, %r8]
	.word 0xf01a0009  ! 1326: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x8a5a2a34  ! 1326: SMUL_I	smul 	%r8, 0x0a34, %r5
	.word 0xc6720009  ! 1329: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 1329: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143e047  ! 1329: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xc6720009  ! 1332: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc71a0009  ! 1332: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xcd3a0009  ! 1332: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6220009  ! 1335: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc44a0009  ! 1335: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xdef21009  ! 1335: STXA_R	stxa	%r15, [%r8 + %r9] 0x80
	.word 0xcb220009  ! 1338: STF_R	st	%f5, [%r9, %r8]
	.word 0xc40a0009  ! 1338: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xec9a1009  ! 1338: LDDA_R	ldda	[%r8, %r9] 0x80, %r22
	.word 0xed3a0009  ! 1341: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc44a0009  ! 1341: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143e02a  ! 1341: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xcc720009  ! 1344: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca520009  ! 1344: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc4020009  ! 1344: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xce2a0009  ! 1347: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xea0a0009  ! 1347: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xd6b21009  ! 1347: STHA_R	stha	%r11, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 1350: STF_R	st	%f2, [%r9, %r8]
	.word 0xc45a0009  ! 1350: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc4d22114  ! 1350: LDSHA_I	ldsha	[%r8, + 0x0114] %asi, %r2
	.word 0xec320009  ! 1353: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc20a0009  ! 1353: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcb222a34  ! 1353: STF_I	st	%f5, [0x0a34, %r8]
	.word 0xcd220009  ! 1356: STF_R	st	%f6, [%r9, %r8]
	.word 0xce420009  ! 1356: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xbe722484  ! 1356: UDIV_I	udiv 	%r8, 0x0484, %r31
	.word 0xcc220009  ! 1359: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xec120009  ! 1359: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xc88a1009  ! 1359: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xd8320009  ! 1362: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xf4420009  ! 1362: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xdeb227dc  ! 1362: STHA_I	stha	%r15, [%r8 + 0x07dc] %asi
	.word 0xf6720009  ! 1365: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xcb1a0009  ! 1365: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xac6a0009  ! 1365: UDIVX_R	udivx 	%r8, %r9, %r22
	.word 0xce720009  ! 1368: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 1368: LDF_R	ld	[%r8, %r9], %f2
	.word 0xca7a0009  ! 1368: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xcc320009  ! 1371: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe4420009  ! 1371: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc3e22009  ! 1371: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xe73a0009  ! 1374: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc24a0009  ! 1374: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc36a2318  ! 1374: PREFETCH_I	prefetch	[%r8 + 0x0318], #one_read
	.word 0xc53a0009  ! 1377: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc81a0009  ! 1377: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc8420009  ! 1377: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xda720009  ! 1380: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc4020009  ! 1380: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xceca2028  ! 1380: LDSBA_I	ldsba	[%r8, + 0x0028] %asi, %r7
	.word 0xc5220009  ! 1383: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6020009  ! 1383: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143e019  ! 1383: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
	.word 0xc2320009  ! 1386: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe4020009  ! 1386: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xc3ea1009  ! 1386: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2320009  ! 1389: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce420009  ! 1389: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xbda20829  ! 1389: FADDs	fadds	%f8, %f9, %f30
	.word 0xce220009  ! 1392: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc20a0009  ! 1392: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1392: STBAR	stbar
	.word 0xce2a0009  ! 1395: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe04a0009  ! 1395: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xc6fa2110  ! 1395: SWAPA_I	swapa	%r3, [%r8 + 0x0110] %asi
	.word 0xc2320009  ! 1398: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 1398: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xec8a1009  ! 1398: LDUBA_R	lduba	[%r8, %r9] 0x80, %r22
	.word 0xc53a0009  ! 1401: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca0a0009  ! 1401: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xbad20009  ! 1401: UMULcc_R	umulcc 	%r8, %r9, %r29
	.word 0xcc720009  ! 1404: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfd1a0009  ! 1404: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xfcfa2c20  ! 1404: SWAPA_I	swapa	%r30, [%r8 + 0x0c20] %asi
	.word 0xc8320009  ! 1407: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc7020009  ! 1407: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc25a0009  ! 1407: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xce320009  ! 1410: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 1410: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143e074  ! 1410: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcc2a0009  ! 1413: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xde0a0009  ! 1413: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x82720009  ! 1413: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xda720009  ! 1416: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xde520009  ! 1416: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x99a20929  ! 1416: FMULs	fmuls	%f8, %f9, %f12
	.word 0xe82a0009  ! 1419: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xdb020009  ! 1419: LDF_R	ld	[%r8, %r9], %f13
	.word 0x8143e023  ! 1419: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xd9220009  ! 1422: STF_R	st	%f12, [%r9, %r8]
	.word 0xcf1a0009  ! 1422: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc6822568  ! 1422: LDUWA_I	lduwa	[%r8, + 0x0568] %asi, %r3
	.word 0xc3220009  ! 1425: STF_R	st	%f1, [%r9, %r8]
	.word 0xe91a0009  ! 1425: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xc81a0009  ! 1425: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xfe320009  ! 1428: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xf2020009  ! 1428: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x8143e003  ! 1428: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xeb3a0009  ! 1431: STDF_R	std	%f21, [%r9, %r8]
	.word 0xea520009  ! 1431: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xc3ea2788  ! 1431: PREFETCHA_I	prefetcha	[%r8, + 0x0788] %asi, #one_read
	.word 0xcd3a0009  ! 1434: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc2120009  ! 1434: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xbfa209a9  ! 1434: FDIVs	fdivs	%f8, %f9, %f31
	.word 0xc53a0009  ! 1437: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc51a0009  ! 1437: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x99a208a9  ! 1437: FSUBs	fsubs	%f8, %f9, %f12
	.word 0xc2720009  ! 1440: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe00a0009  ! 1440: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0x827a0009  ! 1440: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xe8320009  ! 1443: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xf8120009  ! 1443: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xc36a0009  ! 1443: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdf220009  ! 1446: STF_R	st	%f15, [%r9, %r8]
	.word 0xc65a0009  ! 1446: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1446: STBAR	stbar
	.word 0xc22a0009  ! 1449: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca120009  ! 1449: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xfa5a2380  ! 1449: LDX_I	ldx	[%r8 + 0x0380], %r29
	.word 0xca320009  ! 1452: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 1452: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 1452: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc53a0009  ! 1455: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc25a0009  ! 1455: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x0eca0001  ! 1455: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xc82a0009  ! 1458: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcf020009  ! 1458: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc8ea2180  ! 1458: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0180] %asi
	.word 0xc93a0009  ! 1461: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc65a0009  ! 1461: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1461: STBAR	stbar
	.word 0xc3220009  ! 1464: STF_R	st	%f1, [%r9, %r8]
	.word 0xf44a0009  ! 1464: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xc3ea1009  ! 1464: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xeb220009  ! 1467: STF_R	st	%f21, [%r9, %r8]
	.word 0xe04a0009  ! 1467: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xa9a20829  ! 1467: FADDs	fadds	%f8, %f9, %f20
	.word 0xce720009  ! 1470: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc24a0009  ! 1470: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8a720009  ! 1470: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xcd3a0009  ! 1473: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc2020009  ! 1473: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 1473: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xed220009  ! 1476: STF_R	st	%f22, [%r9, %r8]
	.word 0xc64a0009  ! 1476: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xca0a0009  ! 1476: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc53a0009  ! 1479: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc6120009  ! 1479: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8e4a0009  ! 1479: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xc8220009  ! 1482: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 1482: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc4821009  ! 1482: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xe6220009  ! 1485: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xcc0a0009  ! 1485: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc8821009  ! 1485: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r4
	.word 0xe13a0009  ! 1488: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc41a0009  ! 1488: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143e079  ! 1488: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc9220009  ! 1491: STF_R	st	%f4, [%r9, %r8]
	.word 0xe4520009  ! 1491: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xceea1009  ! 1491: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xca220009  ! 1494: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce420009  ! 1494: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xfafa1009  ! 1494: SWAPA_R	swapa	%r29, [%r8 + %r9] 0x80
	.word 0xd6320009  ! 1497: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xcc120009  ! 1497: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xe0b22044  ! 1497: STHA_I	stha	%r16, [%r8 + 0x0044] %asi
	.word 0xc33a0009  ! 1500: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce4a0009  ! 1500: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc33a25d8  ! 1500: STDF_I	std	%f1, [0x05d8, %r8]
	.word 0xec320009  ! 1503: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xcc1a0009  ! 1503: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc81a2908  ! 1503: LDD_I	ldd	[%r8 + 0x0908], %r4
	.word 0xe4320009  ! 1506: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xce420009  ! 1506: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcd220009  ! 1506: STF_R	st	%f6, [%r9, %r8]
	.word 0xe33a0009  ! 1509: STDF_R	std	%f17, [%r9, %r8]
	.word 0xcd020009  ! 1509: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8fa208a9  ! 1509: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xed220009  ! 1512: STF_R	st	%f22, [%r9, %r8]
	.word 0xfa020009  ! 1512: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xc6a21009  ! 1512: STWA_R	stwa	%r3, [%r8 + %r9] 0x80
	.word 0xf8320009  ! 1515: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xcb020009  ! 1515: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc3ea1009  ! 1515: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xdc720009  ! 1518: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xcc1a0009  ! 1518: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xca7a0009  ! 1518: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xf13a0009  ! 1521: STDF_R	std	%f24, [%r9, %r8]
	.word 0xf01a0009  ! 1521: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x8143c000  ! 1521: STBAR	stbar
	.word 0xce720009  ! 1524: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 1524: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xcefa1009  ! 1524: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xde720009  ! 1527: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc5020009  ! 1527: LDF_R	ld	[%r8, %r9], %f2
	.word 0x06800002  ! 1527: BL	bl  	<label_0x2>
	.word 0xcd220009  ! 1530: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc5a0009  ! 1530: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc2020009  ! 1530: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xce220009  ! 1533: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfa4a0009  ! 1533: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0x887a0009  ! 1533: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xfd3a0009  ! 1536: STDF_R	std	%f30, [%r9, %r8]
	.word 0xcd1a0009  ! 1536: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc3ea2428  ! 1536: PREFETCHA_I	prefetcha	[%r8, + 0x0428] %asi, #one_read
	.word 0xc2320009  ! 1539: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca020009  ! 1539: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8a5a0009  ! 1539: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xf6320009  ! 1542: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xcc1a0009  ! 1542: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8cda2528  ! 1542: SMULcc_I	smulcc 	%r8, 0x0528, %r6
	.word 0xcc220009  ! 1545: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcd1a0009  ! 1545: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x1a800001  ! 1545: BCC	bcc  	<label_0x1>
	.word 0xcc320009  ! 1548: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 1548: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc3e21009  ! 1548: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xe2720009  ! 1551: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xcc520009  ! 1551: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x38800001  ! 1551: BGU	bgu,a	<label_0x1>
	.word 0xcc220009  ! 1554: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xea0a0009  ! 1554: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xbb6a28d4  ! 1554: SDIVX_I	sdivx	%r8, 0x08d4, %r29
	.word 0xf5220009  ! 1557: STF_R	st	%f26, [%r9, %r8]
	.word 0xca4a0009  ! 1557: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc6522a9c  ! 1557: LDSH_I	ldsh	[%r8 + 0x0a9c], %r3
	.word 0xc73a0009  ! 1560: STDF_R	std	%f3, [%r9, %r8]
	.word 0xde020009  ! 1560: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x14800002  ! 1560: BG	bg  	<label_0x2>
	.word 0xfd220009  ! 1563: STF_R	st	%f30, [%r9, %r8]
	.word 0xcc0a0009  ! 1563: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1563: STBAR	stbar
	.word 0xf53a0009  ! 1566: STDF_R	std	%f26, [%r9, %r8]
	.word 0xf2020009  ! 1566: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0x24800002  ! 1566: BLE	ble,a	<label_0x2>
	.word 0xc4320009  ! 1569: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe8520009  ! 1569: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xa1220009  ! 1569: MULScc_R	mulscc 	%r8, %r9, %r16
	.word 0xc7220009  ! 1572: STF_R	st	%f3, [%r9, %r8]
	.word 0xc8020009  ! 1572: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc6fa2a24  ! 1572: SWAPA_I	swapa	%r3, [%r8 + 0x0a24] %asi
	.word 0xc4720009  ! 1575: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4120009  ! 1575: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 1575: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc3220009  ! 1578: STF_R	st	%f1, [%r9, %r8]
	.word 0xee520009  ! 1578: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0xc3ea1009  ! 1578: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc9220009  ! 1581: STF_R	st	%f4, [%r9, %r8]
	.word 0xc81a0009  ! 1581: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xbafa0009  ! 1581: SDIVcc_R	sdivcc 	%r8, %r9, %r29
	.word 0xc6320009  ! 1584: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf81a0009  ! 1584: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x8e5a0009  ! 1584: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xc6220009  ! 1587: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xea5a0009  ! 1587: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xc3ea1009  ! 1587: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfc2a0009  ! 1590: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc2520009  ! 1590: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc3ea262c  ! 1590: PREFETCHA_I	prefetcha	[%r8, + 0x062c] %asi, #one_read
	.word 0xcb220009  ! 1593: STF_R	st	%f5, [%r9, %r8]
	.word 0xdc1a0009  ! 1593: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xea6a2210  ! 1593: LDSTUB_I	ldstub	%r21, [%r8 + 0x0210]
	.word 0xcb220009  ! 1596: STF_R	st	%f5, [%r9, %r8]
	.word 0xd8420009  ! 1596: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0xe20a2f0c  ! 1596: LDUB_I	ldub	[%r8 + 0x0f0c], %r17
	.word 0xce2a0009  ! 1599: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 1599: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x22ca0001  ! 1599: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xca220009  ! 1602: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 1602: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc36a2a30  ! 1602: PREFETCH_I	prefetch	[%r8 + 0x0a30], #one_read
	.word 0xce720009  ! 1605: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 1605: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a2148  ! 1605: PREFETCH_I	prefetch	[%r8 + 0x0148], #one_read
	.word 0xcd220009  ! 1608: STF_R	st	%f6, [%r9, %r8]
	.word 0xdf1a0009  ! 1608: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x8143e01b  ! 1608: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside 
	.word 0xf1220009  ! 1611: STF_R	st	%f24, [%r9, %r8]
	.word 0xeb020009  ! 1611: LDF_R	ld	[%r8, %r9], %f21
	.word 0xcdf22009  ! 1611: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xcb220009  ! 1614: STF_R	st	%f5, [%r9, %r8]
	.word 0xc6420009  ! 1614: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea275c  ! 1614: PREFETCHA_I	prefetcha	[%r8, + 0x075c] %asi, #one_read
	.word 0xef3a0009  ! 1617: STDF_R	std	%f23, [%r9, %r8]
	.word 0xce420009  ! 1617: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc8ca1009  ! 1617: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r4
	.word 0xc8220009  ! 1620: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xda5a0009  ! 1620: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xc36a2968  ! 1620: PREFETCH_I	prefetch	[%r8 + 0x0968], #one_read
	.word 0xc8320009  ! 1623: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 1623: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x884a2550  ! 1623: MULX_I	mulx 	%r8, 0x0550, %r4
	.word 0xca2a0009  ! 1626: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce520009  ! 1626: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x0c800001  ! 1626: BNEG	bneg  	<label_0x1>
	.word 0xda720009  ! 1629: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xf40a0009  ! 1629: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0x34800001  ! 1629: BG	bg,a	<label_0x1>
	.word 0xc3220009  ! 1632: STF_R	st	%f1, [%r9, %r8]
	.word 0xc44a0009  ! 1632: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xca4a2ddc  ! 1632: LDSB_I	ldsb	[%r8 + 0x0ddc], %r5
	.word 0xf3220009  ! 1635: STF_R	st	%f25, [%r9, %r8]
	.word 0xf71a0009  ! 1635: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xc36a0009  ! 1635: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdc320009  ! 1638: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xcc1a0009  ! 1638: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xccf226e0  ! 1638: STXA_I	stxa	%r6, [%r8 + 0x06e0] %asi
	.word 0xe4320009  ! 1641: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xfe520009  ! 1641: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0x02ca0001  ! 1641: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xcf3a0009  ! 1644: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc20a0009  ! 1644: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xed220009  ! 1644: STF_R	st	%f22, [%r9, %r8]
	.word 0xce320009  ! 1647: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf8420009  ! 1647: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0xc36a0009  ! 1647: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4220009  ! 1650: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 1650: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1650: STBAR	stbar
	.word 0xca2a0009  ! 1653: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xfb1a0009  ! 1653: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xf5f21009  ! 1653: CASXA_I	casxa	[%r8] 0x80, %r9, %r26
	.word 0xc4220009  ! 1656: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc4520009  ! 1656: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc3ea2cb8  ! 1656: PREFETCHA_I	prefetcha	[%r8, + 0x0cb8] %asi, #one_read
	.word 0xcd3a0009  ! 1659: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6120009  ! 1659: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xe2921009  ! 1659: LDUHA_R	lduha	[%r8, %r9] 0x80, %r17
	.word 0xc22a0009  ! 1662: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe51a0009  ! 1662: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0xce5a2a00  ! 1662: LDX_I	ldx	[%r8 + 0x0a00], %r7
	.word 0xce220009  ! 1665: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca420009  ! 1665: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc8921009  ! 1665: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xc73a0009  ! 1668: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc520009  ! 1668: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8cfa0009  ! 1668: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xc8720009  ! 1671: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca520009  ! 1671: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xe4b228f8  ! 1671: STHA_I	stha	%r18, [%r8 + 0x08f8] %asi
	.word 0xf2320009  ! 1674: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc65a0009  ! 1674: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x876a0009  ! 1674: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xce220009  ! 1677: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfa0a0009  ! 1677: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xfd1a2650  ! 1677: LDDF_I	ldd	[%r8, 0x0650], %f30
	.word 0xc3220009  ! 1680: STF_R	st	%f1, [%r9, %r8]
	.word 0xce5a0009  ! 1680: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143c000  ! 1680: STBAR	stbar
	.word 0xcc320009  ! 1683: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe6420009  ! 1683: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xc3ea229c  ! 1683: PREFETCHA_I	prefetcha	[%r8, + 0x029c] %asi, #one_read
	.word 0xc4220009  ! 1686: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe41a0009  ! 1686: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x84da2e94  ! 1686: SMULcc_I	smulcc 	%r8, 0x0e94, %r2
	.word 0xec720009  ! 1689: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xfc1a0009  ! 1689: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x8e5a2688  ! 1689: SMUL_I	smul 	%r8, 0x0688, %r7
	.word 0xc2720009  ! 1692: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 1692: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xb24a2624  ! 1692: MULX_I	mulx 	%r8, 0x0624, %r25
	.word 0xc33a0009  ! 1695: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc65a0009  ! 1695: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xeafa2878  ! 1695: SWAPA_I	swapa	%r21, [%r8 + 0x0878] %asi
	.word 0xce220009  ! 1698: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcb020009  ! 1698: LDF_R	ld	[%r8, %r9], %f5
	.word 0x82d20009  ! 1698: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xff3a0009  ! 1701: STDF_R	std	%f31, [%r9, %r8]
	.word 0xe2420009  ! 1701: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xcff22009  ! 1701: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xcc320009  ! 1704: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc51a0009  ! 1704: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 1704: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf0320009  ! 1707: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xe31a0009  ! 1707: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xce6a0009  ! 1707: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xca2a0009  ! 1710: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe05a0009  ! 1710: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0x06ca0001  ! 1710: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xfa720009  ! 1713: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xed020009  ! 1713: LDF_R	ld	[%r8, %r9], %f22
	.word 0xc3ea25e8  ! 1713: PREFETCHA_I	prefetcha	[%r8, + 0x05e8] %asi, #one_read
	.word 0xf2220009  ! 1716: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xca020009  ! 1716: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x1e800001  ! 1716: BVC	bvc  	<label_0x1>
	.word 0xe8720009  ! 1719: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xca020009  ! 1719: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 1719: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc320009  ! 1722: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcf1a0009  ! 1722: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143c000  ! 1722: STBAR	stbar
	.word 0xc2320009  ! 1725: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc020009  ! 1725: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc8ba2be8  ! 1725: STDA_I	stda	%r4, [%r8 + 0x0be8] %asi
	.word 0xc6720009  ! 1728: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe64a0009  ! 1728: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0x8143e05f  ! 1728: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xe2720009  ! 1731: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xca020009  ! 1731: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x83a208a9  ! 1731: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc5220009  ! 1734: STF_R	st	%f2, [%r9, %r8]
	.word 0xdc1a0009  ! 1734: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc36a2bd8  ! 1734: PREFETCH_I	prefetch	[%r8 + 0x0bd8], #one_read
	.word 0xdd220009  ! 1737: STF_R	st	%f14, [%r9, %r8]
	.word 0xeb1a0009  ! 1737: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0x85a209a9  ! 1737: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xc8320009  ! 1740: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc65a0009  ! 1740: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143e05a  ! 1740: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc8220009  ! 1743: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 1743: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x40000001  ! 1743: CALL	call	disp30_1
	.word 0xf42a0009  ! 1746: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xec420009  ! 1746: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xc902224c  ! 1746: LDF_I	ld	[%r8, 0x024c], %f4
	.word 0xc4320009  ! 1749: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca5a0009  ! 1749: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xdc7a0009  ! 1749: SWAP_R	swap	%r14, [%r8 + %r9]
	.word 0xc6720009  ! 1752: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc5020009  ! 1752: LDF_R	ld	[%r8, %r9], %f2
	.word 0xe40225d8  ! 1752: LDUW_I	lduw	[%r8 + 0x05d8], %r18
	.word 0xde720009  ! 1755: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xcc1a0009  ! 1755: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xcd3a2048  ! 1755: STDF_I	std	%f6, [0x0048, %r8]
	.word 0xc42a0009  ! 1758: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf44a0009  ! 1758: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0x8f6a0009  ! 1758: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xd6720009  ! 1761: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc2420009  ! 1761: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xfef21009  ! 1761: STXA_R	stxa	%r31, [%r8 + %r9] 0x80
	.word 0xf6320009  ! 1764: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xfe020009  ! 1764: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x8143e07b  ! 1764: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcd3a0009  ! 1767: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe01a0009  ! 1767: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x9fa20829  ! 1767: FADDs	fadds	%f8, %f9, %f15
	.word 0xd93a0009  ! 1770: STDF_R	std	%f12, [%r9, %r8]
	.word 0xfd1a0009  ! 1770: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xc2fa1009  ! 1770: SWAPA_R	swapa	%r1, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 1773: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4520009  ! 1773: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 1773: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe7220009  ! 1776: STF_R	st	%f19, [%r9, %r8]
	.word 0xf65a0009  ! 1776: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0xc48a2328  ! 1776: LDUBA_I	lduba	[%r8, + 0x0328] %asi, %r2
	.word 0xc6220009  ! 1779: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xdc020009  ! 1779: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xc60a2dd0  ! 1779: LDUB_I	ldub	[%r8 + 0x0dd0], %r3
	.word 0xc2320009  ! 1782: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 1782: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea2108  ! 1782: PREFETCHA_I	prefetcha	[%r8, + 0x0108] %asi, #one_read
	.word 0xfd3a0009  ! 1785: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc20a0009  ! 1785: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1785: STBAR	stbar
	.word 0xc6720009  ! 1788: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 1788: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc88a2f94  ! 1788: LDUBA_I	lduba	[%r8, + 0x0f94] %asi, %r4
	.word 0xc22a0009  ! 1791: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc120009  ! 1791: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 1791: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce720009  ! 1794: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xd8520009  ! 1794: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0xed3a0009  ! 1794: STDF_R	std	%f22, [%r9, %r8]
	.word 0xf53a0009  ! 1797: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc91a0009  ! 1797: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xa6520009  ! 1797: UMUL_R	umul 	%r8, %r9, %r19
	.word 0xf0320009  ! 1800: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc41a0009  ! 1800: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1800: STBAR	stbar
	.word 0xcf220009  ! 1803: STF_R	st	%f7, [%r9, %r8]
	.word 0xde120009  ! 1803: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xccba1009  ! 1803: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 1806: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6420009  ! 1806: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xf2f228e0  ! 1806: STXA_I	stxa	%r25, [%r8 + 0x08e0] %asi
	.word 0xcc720009  ! 1809: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xde0a0009  ! 1809: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x04800001  ! 1809: BLE	ble  	<label_0x1>
	.word 0xc82a0009  ! 1812: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf01a0009  ! 1812: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x8ada0009  ! 1812: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xce2a0009  ! 1815: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xda120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xf0b21009  ! 1815: STHA_R	stha	%r24, [%r8 + %r9] 0x80
	.word 0xe22a0009  ! 1818: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xf2520009  ! 1818: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x12800002  ! 1818: BNE	bne  	<label_0x2>
	.word 0xe4720009  ! 1821: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xf6520009  ! 1821: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0xc4aa1009  ! 1821: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xc62a0009  ! 1824: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc51a0009  ! 1824: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc36a0009  ! 1824: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce2a0009  ! 1827: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 1827: LDF_R	ld	[%r8, %r9], %f4
	.word 0xa8722364  ! 1827: UDIV_I	udiv 	%r8, 0x0364, %r20
	.word 0xe8320009  ! 1830: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xe0020009  ! 1830: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xe06a0009  ! 1830: LDSTUB_R	ldstub	%r16, [%r8 + %r9]
	.word 0xf02a0009  ! 1833: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc24a0009  ! 1833: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x87222534  ! 1833: MULScc_I	mulscc 	%r8, 0x0534, %r3
	.word 0xc2220009  ! 1836: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 1836: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xb7a20829  ! 1836: FADDs	fadds	%f8, %f9, %f27
	.word 0xc8220009  ! 1839: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe6420009  ! 1839: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x8f222310  ! 1839: MULScc_I	mulscc 	%r8, 0x0310, %r7
	.word 0xcd220009  ! 1842: STF_R	st	%f6, [%r9, %r8]
	.word 0xcf1a0009  ! 1842: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xf6a229ac  ! 1842: STWA_I	stwa	%r27, [%r8 + 0x09ac] %asi
	.word 0xc3220009  ! 1845: STF_R	st	%f1, [%r9, %r8]
	.word 0xc81a0009  ! 1845: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8da209a9  ! 1845: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xce220009  ! 1848: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce5a0009  ! 1848: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8da20929  ! 1848: FMULs	fmuls	%f8, %f9, %f6
	.word 0xcc2a0009  ! 1851: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 1851: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc3f22009  ! 1851: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xe8220009  ! 1854: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xce420009  ! 1854: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc6fa2ef0  ! 1854: SWAPA_I	swapa	%r3, [%r8 + 0x0ef0] %asi
	.word 0xfc2a0009  ! 1857: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc91a0009  ! 1857: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x84720009  ! 1857: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc3220009  ! 1860: STF_R	st	%f1, [%r9, %r8]
	.word 0xf6020009  ! 1860: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xc84220a4  ! 1860: LDSW_I	ldsw	[%r8 + 0x00a4], %r4
	.word 0xc62a0009  ! 1863: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc4020009  ! 1863: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x884a28cc  ! 1863: MULX_I	mulx 	%r8, 0x08cc, %r4
	.word 0xcd3a0009  ! 1866: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc41a0009  ! 1866: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x22800002  ! 1866: BE	be,a	<label_0x2>
	.word 0xfc320009  ! 1869: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xe2020009  ! 1869: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xca4a23b4  ! 1869: LDSB_I	ldsb	[%r8 + 0x03b4], %r5
	.word 0xcb3a0009  ! 1872: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf20a0009  ! 1872: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x2ac20001  ! 1872: BRNZ	brnz,a,nt	%8,<label_0x20001>
	.word 0xee220009  ! 1875: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xe81a0009  ! 1875: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xc8120009  ! 1875: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xcc2a0009  ! 1878: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc120009  ! 1878: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc36a2ef0  ! 1878: PREFETCH_I	prefetch	[%r8 + 0x0ef0], #one_read
	.word 0xe9220009  ! 1881: STF_R	st	%f20, [%r9, %r8]
	.word 0xcb1a0009  ! 1881: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xb0da25b8  ! 1881: SMULcc_I	smulcc 	%r8, 0x05b8, %r24
	.word 0xcf3a0009  ! 1884: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc44a0009  ! 1884: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc6da2dc8  ! 1884: LDXA_I	ldxa	[%r8, + 0x0dc8] %asi, %r3
	.word 0xcf3a0009  ! 1887: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcd020009  ! 1887: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8143e077  ! 1887: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xfd3a0009  ! 1890: STDF_R	std	%f30, [%r9, %r8]
	.word 0xcb1a0009  ! 1890: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xccf21009  ! 1890: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 1893: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xdc5a0009  ! 1893: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0xc36a2748  ! 1893: PREFETCH_I	prefetch	[%r8 + 0x0748], #one_read
	.word 0xe73a0009  ! 1896: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc4120009  ! 1896: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1896: STBAR	stbar
	.word 0xc6220009  ! 1899: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 1899: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 1899: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc62a0009  ! 1902: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xfe520009  ! 1902: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0x8d6a0009  ! 1902: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xc6220009  ! 1905: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcf1a0009  ! 1905: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x996a0009  ! 1905: SDIVX_R	sdivx	%r8, %r9, %r12
	.word 0xc53a0009  ! 1908: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca020009  ! 1908: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xdab223fc  ! 1908: STHA_I	stha	%r13, [%r8 + 0x03fc] %asi
	.word 0xdb220009  ! 1911: STF_R	st	%f13, [%r9, %r8]
	.word 0xc8020009  ! 1911: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xca1225f4  ! 1911: LDUH_I	lduh	[%r8 + 0x05f4], %r5
	.word 0xce320009  ! 1914: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 1914: LDF_R	ld	[%r8, %r9], %f6
	.word 0xfc9a2a38  ! 1914: LDDA_I	ldda	[%r8, + 0x0a38] %asi, %r30
	.word 0xce720009  ! 1917: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xd60a0009  ! 1917: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xc36a0009  ! 1917: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce720009  ! 1920: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xff020009  ! 1920: LDF_R	ld	[%r8, %r9], %f31
	.word 0x84da2cf4  ! 1920: SMULcc_I	smulcc 	%r8, 0x0cf4, %r2
	.word 0xc4320009  ! 1923: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 1923: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8d220009  ! 1923: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xca720009  ! 1926: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf01a0009  ! 1926: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xceca2234  ! 1926: LDSBA_I	ldsba	[%r8, + 0x0234] %asi, %r7
	.word 0xcc220009  ! 1929: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc4420009  ! 1929: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8ada0009  ! 1929: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xe8720009  ! 1932: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc6120009  ! 1932: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc33a0009  ! 1932: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf33a0009  ! 1935: STDF_R	std	%f25, [%r9, %r8]
	.word 0xe6520009  ! 1935: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xc6b21009  ! 1935: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xca220009  ! 1938: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 1938: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xcea22dd4  ! 1938: STWA_I	stwa	%r7, [%r8 + 0x0dd4] %asi
	.word 0xf4720009  ! 1941: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xcb1a0009  ! 1941: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcaa22d50  ! 1941: STWA_I	stwa	%r5, [%r8 + 0x0d50] %asi
	.word 0xc8320009  ! 1944: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe0120009  ! 1944: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0x8143e02f  ! 1944: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc6220009  ! 1947: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 1947: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xf0420009  ! 1947: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xc33a0009  ! 1950: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe24a0009  ! 1950: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xc6122354  ! 1950: LDUH_I	lduh	[%r8 + 0x0354], %r3
	.word 0xcb3a0009  ! 1953: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfc420009  ! 1953: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x0eca0001  ! 1953: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xf42a0009  ! 1956: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xf05a0009  ! 1956: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xd9220009  ! 1956: STF_R	st	%f12, [%r9, %r8]
	.word 0xcf3a0009  ! 1959: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc120009  ! 1959: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8ef229d0  ! 1959: UDIVcc_I	udivcc 	%r8, 0x09d0, %r7
	.word 0xc2320009  ! 1962: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc91a0009  ! 1962: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x96da0009  ! 1962: SMULcc_R	smulcc 	%r8, %r9, %r11
	.word 0xc6720009  ! 1965: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xfc4a0009  ! 1965: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xcaf21009  ! 1965: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xf6220009  ! 1968: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xdf1a0009  ! 1968: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0xced223b4  ! 1968: LDSHA_I	ldsha	[%r8, + 0x03b4] %asi, %r7
	.word 0xc6220009  ! 1971: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf9020009  ! 1971: LDF_R	ld	[%r8, %r9], %f28
	.word 0xf4f21009  ! 1971: STXA_R	stxa	%r26, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 1974: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 1974: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143e051  ! 1974: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xec320009  ! 1977: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xcf020009  ! 1977: LDF_R	ld	[%r8, %r9], %f7
	.word 0xdaca2458  ! 1977: LDSBA_I	ldsba	[%r8, + 0x0458] %asi, %r13
	.word 0xc73a0009  ! 1980: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc81a0009  ! 1980: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 1980: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xeb3a0009  ! 1983: STDF_R	std	%f21, [%r9, %r8]
	.word 0xf20a0009  ! 1983: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0x8143e042  ! 1983: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xce220009  ! 1986: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 1986: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1986: STBAR	stbar
	.word 0xc73a0009  ! 1989: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe11a0009  ! 1989: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xc7220009  ! 1989: STF_R	st	%f3, [%r9, %r8]
	.word 0xfd220009  ! 1992: STF_R	st	%f30, [%r9, %r8]
	.word 0xc6520009  ! 1992: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xce822640  ! 1992: LDUWA_I	lduwa	[%r8, + 0x0640] %asi, %r7
	.word 0xc9220009  ! 1995: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4020009  ! 1995: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x82520009  ! 1995: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xcf220009  ! 1998: STF_R	st	%f7, [%r9, %r8]
	.word 0xf20a0009  ! 1998: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xe8a22df8  ! 1998: STWA_I	stwa	%r20, [%r8 + 0x0df8] %asi
	.word 0xe82a0009  ! 2001: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc6020009  ! 2001: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4c21009  ! 2001: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xcc2a0009  ! 2004: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf9020009  ! 2004: LDF_R	ld	[%r8, %r9], %f28
	.word 0x8143c000  ! 2004: STBAR	stbar
	.word 0xcc720009  ! 2007: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xde5a0009  ! 2007: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xf6fa1009  ! 2007: SWAPA_R	swapa	%r27, [%r8 + %r9] 0x80
	.word 0xca2a0009  ! 2010: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc2120009  ! 2010: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xae7a0009  ! 2010: SDIV_R	sdiv 	%r8, %r9, %r23
	.word 0xc6320009  ! 2013: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xfa520009  ! 2013: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x84f224a8  ! 2013: UDIVcc_I	udivcc 	%r8, 0x04a8, %r2
	.word 0xcf3a0009  ! 2016: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc5020009  ! 2016: LDF_R	ld	[%r8, %r9], %f2
	.word 0xca7a2a78  ! 2016: SWAP_I	swap	%r5, [%r8 + 0x0a78]
	.word 0xc62a0009  ! 2019: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc4a0009  ! 2019: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143e02a  ! 2019: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xcc220009  ! 2022: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xee420009  ! 2022: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xced21009  ! 2022: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xcb220009  ! 2025: STF_R	st	%f5, [%r9, %r8]
	.word 0xc91a0009  ! 2025: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xf6c226c4  ! 2025: LDSWA_I	ldswa	[%r8, + 0x06c4] %asi, %r27
	.word 0xdd220009  ! 2028: STF_R	st	%f14, [%r9, %r8]
	.word 0xc4420009  ! 2028: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8143e043  ! 2028: MEMBAR	membar	#LoadLoad | #StoreLoad | #Sync 
	.word 0xc9220009  ! 2031: STF_R	st	%f4, [%r9, %r8]
	.word 0xc51a0009  ! 2031: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 2031: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xce320009  ! 2034: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf8520009  ! 2034: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0x0aca0001  ! 2034: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xd93a0009  ! 2037: STDF_R	std	%f12, [%r9, %r8]
	.word 0xde0a0009  ! 2037: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x8c6a2d64  ! 2037: UDIVX_I	udivx 	%r8, 0x0d64, %r6
	.word 0xc8720009  ! 2040: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 2040: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8e520009  ! 2040: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xcc320009  ! 2043: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 2043: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc8b21009  ! 2043: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xef3a0009  ! 2046: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc2020009  ! 2046: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc73a0009  ! 2046: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce720009  ! 2049: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 2049: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xccaa2ba8  ! 2049: STBA_I	stba	%r6, [%r8 + 0x0ba8] %asi
	.word 0xcc220009  ! 2052: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe6520009  ! 2052: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xde422590  ! 2052: LDSW_I	ldsw	[%r8 + 0x0590], %r15
	.word 0xc6320009  ! 2055: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd81a0009  ! 2055: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xae4a0009  ! 2055: MULX_R	mulx 	%r8, %r9, %r23
	.word 0xcb3a0009  ! 2058: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce0a0009  ! 2058: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc36a2870  ! 2058: PREFETCH_I	prefetch	[%r8 + 0x0870], #one_read
	.word 0xe5220009  ! 2061: STF_R	st	%f18, [%r9, %r8]
	.word 0xe0020009  ! 2061: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x18800001  ! 2061: BGU	bgu  	<label_0x1>
	.word 0xc93a0009  ! 2064: STDF_R	std	%f4, [%r9, %r8]
	.word 0xec120009  ! 2064: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xc2a22658  ! 2064: STWA_I	stwa	%r1, [%r8 + 0x0658] %asi
	.word 0xcb220009  ! 2067: STF_R	st	%f5, [%r9, %r8]
	.word 0xf20a0009  ! 2067: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xc3f22009  ! 2067: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xc8720009  ! 2070: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcd1a0009  ! 2070: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xcd220009  ! 2070: STF_R	st	%f6, [%r9, %r8]
	.word 0xf62a0009  ! 2073: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xfd1a0009  ! 2073: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0x896a2400  ! 2073: SDIVX_I	sdivx	%r8, 0x0400, %r4
	.word 0xde2a0009  ! 2076: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc5020009  ! 2076: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc71a0009  ! 2076: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xe33a0009  ! 2079: STDF_R	std	%f17, [%r9, %r8]
	.word 0xce4a0009  ! 2079: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xec6a214c  ! 2079: LDSTUB_I	ldstub	%r22, [%r8 + 0x014c]
	.word 0xc4220009  ! 2082: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc25a0009  ! 2082: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x04800002  ! 2082: BLE	ble  	<label_0x2>
	.word 0xf4320009  ! 2085: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc44a0009  ! 2085: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc2a2230c  ! 2085: STWA_I	stwa	%r1, [%r8 + 0x030c] %asi
	.word 0xec720009  ! 2088: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xfd020009  ! 2088: LDF_R	ld	[%r8, %r9], %f30
	.word 0x8cd22494  ! 2088: UMULcc_I	umulcc 	%r8, 0x0494, %r6
	.word 0xcc320009  ! 2091: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcf020009  ! 2091: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143c000  ! 2091: STBAR	stbar
	.word 0xc82a0009  ! 2094: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xd80a0009  ! 2094: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xc36a2830  ! 2094: PREFETCH_I	prefetch	[%r8 + 0x0830], #one_read
	.word 0xe22a0009  ! 2097: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc6020009  ! 2097: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc5e22009  ! 2097: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xc4720009  ! 2100: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xd7020009  ! 2100: LDF_R	ld	[%r8, %r9], %f11
	.word 0x8a6a2968  ! 2100: UDIVX_I	udivx 	%r8, 0x0968, %r5
	.word 0xcc320009  ! 2103: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe4520009  ! 2103: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x8143c000  ! 2103: STBAR	stbar
	.word 0xc73a0009  ! 2106: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce520009  ! 2106: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc2020009  ! 2106: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xe22a0009  ! 2109: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc81a0009  ! 2109: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x2a800001  ! 2109: BCS	bcs,a	<label_0x1>
	.word 0xcf3a0009  ! 2112: STDF_R	std	%f7, [%r9, %r8]
	.word 0xff020009  ! 2112: LDF_R	ld	[%r8, %r9], %f31
	.word 0x8143e066  ! 2112: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xfe320009  ! 2115: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xe44a0009  ! 2115: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0x85a20829  ! 2115: FADDs	fadds	%f8, %f9, %f2
	.word 0xce2a0009  ! 2118: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc2120009  ! 2118: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x2ec20001  ! 2118: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xec320009  ! 2121: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xee420009  ! 2121: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0x964a24f0  ! 2121: MULX_I	mulx 	%r8, 0x04f0, %r11
	.word 0xd8320009  ! 2124: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc80a0009  ! 2124: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc33a0009  ! 2124: STDF_R	std	%f1, [%r9, %r8]
	.word 0xea2a0009  ! 2127: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xe0520009  ! 2127: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xa66a0009  ! 2127: UDIVX_R	udivx 	%r8, %r9, %r19
	.word 0xcc220009  ! 2130: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfc520009  ! 2130: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x84f20009  ! 2130: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc4220009  ! 2133: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc31a0009  ! 2133: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x04800001  ! 2133: BLE	ble  	<label_0x1>
	.word 0xca720009  ! 2136: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf2420009  ! 2136: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xf2f22e30  ! 2136: STXA_I	stxa	%r25, [%r8 + 0x0e30] %asi
	.word 0xcb3a0009  ! 2139: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfa520009  ! 2139: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x8143c000  ! 2139: STBAR	stbar
	.word 0xe5220009  ! 2142: STF_R	st	%f18, [%r9, %r8]
	.word 0xfa120009  ! 2142: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xcaca1009  ! 2142: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xce320009  ! 2145: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xdc4a0009  ! 2145: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0x8143e07f  ! 2145: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc2320009  ! 2148: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc44a0009  ! 2148: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xccba1009  ! 2148: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 2151: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe65a0009  ! 2151: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xc3ea217c  ! 2151: PREFETCHA_I	prefetcha	[%r8, + 0x017c] %asi, #one_read
	.word 0xc8220009  ! 2154: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc520009  ! 2154: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xd8a21009  ! 2154: STWA_R	stwa	%r12, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 2157: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf51a0009  ! 2157: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xc36a2218  ! 2157: PREFETCH_I	prefetch	[%r8 + 0x0218], #one_read
	.word 0xce320009  ! 2160: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xdc1a0009  ! 2160: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0x8143e003  ! 2160: MEMBAR	membar	#LoadLoad | #StoreLoad 
	.word 0xe33a0009  ! 2163: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc41a0009  ! 2163: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc2f22288  ! 2163: STXA_I	stxa	%r1, [%r8 + 0x0288] %asi
	.word 0xc8720009  ! 2166: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 2166: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc5f22009  ! 2166: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xf93a0009  ! 2169: STDF_R	std	%f28, [%r9, %r8]
	.word 0xe0020009  ! 2169: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xbcd20009  ! 2169: UMULcc_R	umulcc 	%r8, %r9, %r30
	.word 0xf4720009  ! 2172: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xe40a0009  ! 2172: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xce821009  ! 2172: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xc8220009  ! 2175: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfc0a0009  ! 2175: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0x8143e041  ! 2175: MEMBAR	membar	#LoadLoad | #Sync 
	.word 0xd6720009  ! 2178: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc51a0009  ! 2178: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x865226d4  ! 2178: UMUL_I	umul 	%r8, 0x06d4, %r3
	.word 0xea320009  ! 2181: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xf8020009  ! 2181: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xe81a0009  ! 2181: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xf4220009  ! 2184: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xf5020009  ! 2184: LDF_R	ld	[%r8, %r9], %f26
	.word 0xcde22009  ! 2184: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xea2a0009  ! 2187: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc2020009  ! 2187: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xb7a208a9  ! 2187: FSUBs	fsubs	%f8, %f9, %f27
	.word 0xc5220009  ! 2190: STF_R	st	%f2, [%r9, %r8]
	.word 0xc81a0009  ! 2190: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8e7a0009  ! 2190: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc93a0009  ! 2193: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc45a0009  ! 2193: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xfc9a2b60  ! 2193: LDDA_I	ldda	[%r8, + 0x0b60] %asi, %r30
	.word 0xc6320009  ! 2196: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xdf020009  ! 2196: LDF_R	ld	[%r8, %r9], %f15
	.word 0xca122c18  ! 2196: LDUH_I	lduh	[%r8 + 0x0c18], %r5
	.word 0xcc220009  ! 2199: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca4a0009  ! 2199: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc3ea2c48  ! 2199: PREFETCHA_I	prefetcha	[%r8, + 0x0c48] %asi, #one_read
	.word 0xca220009  ! 2202: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xdc520009  ! 2202: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x82d2238c  ! 2202: UMULcc_I	umulcc 	%r8, 0x038c, %r1
	.word 0xcc2a0009  ! 2205: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 2205: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc36a2898  ! 2205: PREFETCH_I	prefetch	[%r8 + 0x0898], #one_read
	.word 0xc3220009  ! 2208: STF_R	st	%f1, [%r9, %r8]
	.word 0xcb1a0009  ! 2208: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xef220009  ! 2208: STF_R	st	%f23, [%r9, %r8]
	.word 0xcd3a0009  ! 2211: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcf1a0009  ! 2211: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc8520009  ! 2211: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc22a0009  ! 2214: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xee0a0009  ! 2214: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x1c800001  ! 2214: BPOS	bpos  	<label_0x1>
	.word 0xeb3a0009  ! 2217: STDF_R	std	%f21, [%r9, %r8]
	.word 0xfc520009  ! 2217: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x885a0009  ! 2217: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xc73a0009  ! 2220: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc0a0009  ! 2220: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143e05b  ! 2220: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc33a0009  ! 2223: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf4420009  ! 2223: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xa1a20929  ! 2223: FMULs	fmuls	%f8, %f9, %f16
	.word 0xc73a0009  ! 2226: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf00a0009  ! 2226: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xc3e22009  ! 2226: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xca320009  ! 2229: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce120009  ! 2229: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcac21009  ! 2229: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r5
	.word 0xc82a0009  ! 2232: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc25a0009  ! 2232: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xca6a20ec  ! 2232: LDSTUB_I	ldstub	%r5, [%r8 + 0x00ec]
	.word 0xf82a0009  ! 2235: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xcc020009  ! 2235: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc80a0009  ! 2235: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc93a0009  ! 2238: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce420009  ! 2238: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 2238: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc3220009  ! 2241: STF_R	st	%f1, [%r9, %r8]
	.word 0xec520009  ! 2241: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0x864a2688  ! 2241: MULX_I	mulx 	%r8, 0x0688, %r3
	.word 0xcd220009  ! 2244: STF_R	st	%f6, [%r9, %r8]
	.word 0xc64a0009  ! 2244: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x2e800002  ! 2244: BVS	bvs,a	<label_0x2>
	.word 0xc2320009  ! 2247: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 2247: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x0a800001  ! 2247: BCS	bcs  	<label_0x1>
	.word 0xe02a0009  ! 2250: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc6020009  ! 2250: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc8a21009  ! 2250: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xdc320009  ! 2253: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc8020009  ! 2253: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xfc9a1009  ! 2253: LDDA_R	ldda	[%r8, %r9] 0x80, %r30
	.word 0xee2a0009  ! 2256: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xcc420009  ! 2256: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x06800001  ! 2256: BL	bl  	<label_0x1>
	.word 0xc8220009  ! 2259: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xed1a0009  ! 2259: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xc3ea2834  ! 2259: PREFETCHA_I	prefetcha	[%r8, + 0x0834] %asi, #one_read
	.word 0xc82a0009  ! 2262: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2520009  ! 2262: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x856a20ec  ! 2262: SDIVX_I	sdivx	%r8, 0x00ec, %r2
	.word 0xed3a0009  ! 2265: STDF_R	std	%f22, [%r9, %r8]
	.word 0xcd020009  ! 2265: LDF_R	ld	[%r8, %r9], %f6
	.word 0xcc0a2f70  ! 2265: LDUB_I	ldub	[%r8 + 0x0f70], %r6
	.word 0xdc720009  ! 2268: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc31a0009  ! 2268: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8a6a0009  ! 2268: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xf2720009  ! 2271: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xcb020009  ! 2271: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc522269c  ! 2271: STF_I	st	%f2, [0x069c, %r8]
	.word 0xee2a0009  ! 2274: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xc2420009  ! 2274: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8e5a2e8c  ! 2274: SMUL_I	smul 	%r8, 0x0e8c, %r7
	.word 0xd6720009  ! 2277: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xcc0a0009  ! 2277: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc89a1009  ! 2277: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc8320009  ! 2280: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe5020009  ! 2280: LDF_R	ld	[%r8, %r9], %f18
	.word 0x04800002  ! 2280: BLE	ble  	<label_0x2>
	.word 0xc8720009  ! 2283: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe6420009  ! 2283: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xc4ba2668  ! 2283: STDA_I	stda	%r2, [%r8 + 0x0668] %asi
	.word 0xc4320009  ! 2286: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc80a0009  ! 2286: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc6f21009  ! 2286: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 2289: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc2420009  ! 2289: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcad21009  ! 2289: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xc8320009  ! 2292: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc60a0009  ! 2292: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8d6a2a2c  ! 2292: SDIVX_I	sdivx	%r8, 0x0a2c, %r6
	.word 0xc6320009  ! 2295: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 2295: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xceca21f8  ! 2295: LDSBA_I	ldsba	[%r8, + 0x01f8] %asi, %r7
	.word 0xe22a0009  ! 2298: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc4120009  ! 2298: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2298: STBAR	stbar
	.word 0xce220009  ! 2301: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 2301: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 2301: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc2a0009  ! 2304: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xd85a0009  ! 2304: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x8143e05c  ! 2304: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0xe2720009  ! 2307: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xf20a0009  ! 2307: LDUB_R	ldub	[%r8 + %r9], %r25
	.word 0xa8fa2a60  ! 2307: SDIVcc_I	sdivcc 	%r8, 0x0a60, %r20
	.word 0xce320009  ! 2310: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc2520009  ! 2310: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc8c21009  ! 2310: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xcc220009  ! 2313: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcf020009  ! 2313: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc5220009  ! 2313: STF_R	st	%f2, [%r9, %r8]
	.word 0xfa320009  ! 2316: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xce5a0009  ! 2316: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc27a2228  ! 2316: SWAP_I	swap	%r1, [%r8 + 0x0228]
	.word 0xc8320009  ! 2319: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 2319: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2319: STBAR	stbar
	.word 0xc53a0009  ! 2322: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf4020009  ! 2322: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0x26800001  ! 2322: BL	bl,a	<label_0x1>
	.word 0xd9220009  ! 2325: STF_R	st	%f12, [%r9, %r8]
	.word 0xc44a0009  ! 2325: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc70226e0  ! 2325: LDF_I	ld	[%r8, 0x06e0], %f3
	.word 0xca320009  ! 2328: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc20a0009  ! 2328: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x2e800001  ! 2328: BVS	bvs,a	<label_0x1>
	.word 0xe2320009  ! 2331: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xd6420009  ! 2331: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xca522dd4  ! 2331: LDSH_I	ldsh	[%r8 + 0x0dd4], %r5
	.word 0xc4320009  ! 2334: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca420009  ! 2334: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xb96a2ab0  ! 2334: SDIVX_I	sdivx	%r8, 0x0ab0, %r28
	.word 0xc22a0009  ! 2337: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 2337: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xdab21009  ! 2337: STHA_R	stha	%r13, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 2340: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc2020009  ! 2340: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcca229d0  ! 2340: STWA_I	stwa	%r6, [%r8 + 0x09d0] %asi
	.word 0xcc320009  ! 2343: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc80a0009  ! 2343: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x83a20829  ! 2343: FADDs	fadds	%f8, %f9, %f1
	.word 0xcb3a0009  ! 2346: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf4120009  ! 2346: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0x825a0009  ! 2346: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc3220009  ! 2349: STF_R	st	%f1, [%r9, %r8]
	.word 0xff020009  ! 2349: LDF_R	ld	[%r8, %r9], %f31
	.word 0xf71a25e0  ! 2349: LDDF_I	ldd	[%r8, 0x05e0], %f27
	.word 0xc8220009  ! 2352: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce420009  ! 2352: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc4ba1009  ! 2352: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xcb220009  ! 2355: STF_R	st	%f5, [%r9, %r8]
	.word 0xfc1a0009  ! 2355: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc3ea1009  ! 2355: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc320009  ! 2358: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce5a0009  ! 2358: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143c000  ! 2358: STBAR	stbar
	.word 0xdd3a0009  ! 2361: STDF_R	std	%f14, [%r9, %r8]
	.word 0xc45a0009  ! 2361: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xbafa0009  ! 2361: SDIVcc_R	sdivcc 	%r8, %r9, %r29
	.word 0xc82a0009  ! 2364: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2020009  ! 2364: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8c4a2220  ! 2364: MULX_I	mulx 	%r8, 0x0220, %r6
	.word 0xcc320009  ! 2367: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce020009  ! 2367: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc4821009  ! 2367: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xc8320009  ! 2370: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce420009  ! 2370: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xe9e21009  ! 2370: CASA_I	casa	[%r8] 0x80, %r9, %r20
	.word 0xc8320009  ! 2373: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe44a0009  ! 2373: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0x04c20001  ! 2373: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xf8320009  ! 2376: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc60a0009  ! 2376: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x0ac20001  ! 2376: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xca220009  ! 2379: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf84a0009  ! 2379: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x3e800001  ! 2379: BVC	bvc,a	<label_0x1>
	.word 0xc62a0009  ! 2382: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcf1a0009  ! 2382: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x14800001  ! 2382: BG	bg  	<label_0x1>
	.word 0xfd3a0009  ! 2385: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc51a0009  ! 2385: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc33a26d8  ! 2385: STDF_I	std	%f1, [0x06d8, %r8]
	.word 0xce720009  ! 2388: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcb020009  ! 2388: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc6b22228  ! 2388: STHA_I	stha	%r3, [%r8 + 0x0228] %asi
	.word 0xee220009  ! 2391: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc6120009  ! 2391: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xce0a0009  ! 2391: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc7220009  ! 2394: STF_R	st	%f3, [%r9, %r8]
	.word 0xfc4a0009  ! 2394: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0x8a5a0009  ! 2394: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xe0320009  ! 2397: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc25a0009  ! 2397: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xce6a0009  ! 2397: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xc73a0009  ! 2400: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfe5a0009  ! 2400: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xc2b22cd8  ! 2400: STHA_I	stha	%r1, [%r8 + 0x0cd8] %asi
	.word 0xee2a0009  ! 2403: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xe6120009  ! 2403: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0x88fa242c  ! 2403: SDIVcc_I	sdivcc 	%r8, 0x042c, %r4
	.word 0xe9220009  ! 2406: STF_R	st	%f20, [%r9, %r8]
	.word 0xe9020009  ! 2406: LDF_R	ld	[%r8, %r9], %f20
	.word 0x8c5a0009  ! 2406: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc3220009  ! 2409: STF_R	st	%f1, [%r9, %r8]
	.word 0xc2020009  ! 2409: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcb222d0c  ! 2409: STF_I	st	%f5, [0x0d0c, %r8]
	.word 0xca720009  ! 2412: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc01a0009  ! 2412: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8143c000  ! 2412: STBAR	stbar
	.word 0xc33a0009  ! 2415: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc6420009  ! 2415: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a22f0  ! 2415: PREFETCH_I	prefetch	[%r8 + 0x02f0], #one_read
	.word 0xc4220009  ! 2418: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca020009  ! 2418: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcaca1009  ! 2418: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r5
	.word 0xc2320009  ! 2421: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xfc1a0009  ! 2421: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x82fa0009  ! 2421: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xc62a0009  ! 2424: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca020009  ! 2424: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x2cc20001  ! 2424: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc4720009  ! 2427: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xda120009  ! 2427: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x8143e073  ! 2427: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xcc320009  ! 2430: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc6520009  ! 2430: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x88722960  ! 2430: UDIV_I	udiv 	%r8, 0x0960, %r4
	.word 0xf5220009  ! 2433: STF_R	st	%f26, [%r9, %r8]
	.word 0xc80a0009  ! 2433: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xceaa2ba4  ! 2433: STBA_I	stba	%r7, [%r8 + 0x0ba4] %asi
	.word 0xc6220009  ! 2436: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe24a0009  ! 2436: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xba7a2010  ! 2436: SDIV_I	sdiv 	%r8, 0x0010, %r29
	.word 0xc93a0009  ! 2439: STDF_R	std	%f4, [%r9, %r8]
	.word 0xde0a0009  ! 2439: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0x40000002  ! 2439: CALL	call	disp30_2
	.word 0xc53a0009  ! 2442: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf6420009  ! 2442: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xc25a2830  ! 2442: LDX_I	ldx	[%r8 + 0x0830], %r1
	.word 0xf9220009  ! 2445: STF_R	st	%f28, [%r9, %r8]
	.word 0xec1a0009  ! 2445: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc4c21009  ! 2445: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xc22a0009  ! 2448: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 2448: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x844a0009  ! 2448: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xce220009  ! 2451: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc51a0009  ! 2451: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xcada1009  ! 2451: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xee220009  ! 2454: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc6020009  ! 2454: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xd91a24c8  ! 2454: LDDF_I	ldd	[%r8, 0x04c8], %f12
	.word 0xe62a0009  ! 2457: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xe8120009  ! 2457: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0xcc9a1009  ! 2457: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xc4320009  ! 2460: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc40a0009  ! 2460: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc8fa1009  ! 2460: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 2463: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xfb020009  ! 2463: LDF_R	ld	[%r8, %r9], %f29
	.word 0xccf225f0  ! 2463: STXA_I	stxa	%r6, [%r8 + 0x05f0] %asi
	.word 0xe8320009  ! 2466: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xf5020009  ! 2466: LDF_R	ld	[%r8, %r9], %f26
	.word 0xdcb21009  ! 2466: STHA_R	stha	%r14, [%r8 + %r9] 0x80
	.word 0xdc2a0009  ! 2469: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc3020009  ! 2469: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143c000  ! 2469: STBAR	stbar
	.word 0xcd220009  ! 2472: STF_R	st	%f6, [%r9, %r8]
	.word 0xc71a0009  ! 2472: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x89a20929  ! 2472: FMULs	fmuls	%f8, %f9, %f4
	.word 0xe02a0009  ! 2475: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc4520009  ! 2475: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xe2921009  ! 2475: LDUHA_R	lduha	[%r8, %r9] 0x80, %r17
	.word 0xc82a0009  ! 2478: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc25a0009  ! 2478: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc27a0009  ! 2478: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xca2a0009  ! 2481: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 2481: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x83222420  ! 2481: MULScc_I	mulscc 	%r8, 0x0420, %r1
	.word 0xd6320009  ! 2484: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xd8520009  ! 2484: LDSH_R	ldsh	[%r8 + %r9], %r12
	.word 0x82720009  ! 2484: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xc8320009  ! 2487: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xd41a0009  ! 2487: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xc8ea2c20  ! 2487: LDSTUBA_I	ldstuba	%r4, [%r8 + 0x0c20] %asi
	.word 0xc33a0009  ! 2490: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc01a0009  ! 2490: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc6ca20d8  ! 2490: LDSBA_I	ldsba	[%r8, + 0x00d8] %asi, %r3
	.word 0xcc720009  ! 2493: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 2493: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xb6da2c80  ! 2493: SMULcc_I	smulcc 	%r8, 0x0c80, %r27
	.word 0xcd220009  ! 2496: STF_R	st	%f6, [%r9, %r8]
	.word 0xe65a0009  ! 2496: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x8143e069  ! 2496: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xc33a0009  ! 2499: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe0420009  ! 2499: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xc87a0009  ! 2499: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xc6720009  ! 2502: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xec4a0009  ! 2502: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xbcf227ec  ! 2502: UDIVcc_I	udivcc 	%r8, 0x07ec, %r30
	.word 0xc8220009  ! 2505: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd85a0009  ! 2505: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x8143c000  ! 2505: STBAR	stbar
	.word 0xc8220009  ! 2508: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce420009  ! 2508: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc91a0009  ! 2508: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xff3a0009  ! 2511: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc4120009  ! 2511: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2511: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcd3a0009  ! 2514: STDF_R	std	%f6, [%r9, %r8]
	.word 0xd81a0009  ! 2514: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x8a7a2b00  ! 2514: SDIV_I	sdiv 	%r8, 0x0b00, %r5
	.word 0xca320009  ! 2517: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc80a0009  ! 2517: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x89220009  ! 2517: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xfa320009  ! 2520: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xcc520009  ! 2520: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc71a0009  ! 2520: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xfc220009  ! 2523: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xca0a0009  ! 2523: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc60a0009  ! 2523: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc5220009  ! 2526: STF_R	st	%f2, [%r9, %r8]
	.word 0xcb020009  ! 2526: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143e018  ! 2526: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xc8720009  ! 2529: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4120009  ! 2529: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xf28a2a04  ! 2529: LDUBA_I	lduba	[%r8, + 0x0a04] %asi, %r25
	.word 0xc6220009  ! 2532: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 2532: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc36a0009  ! 2532: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xd82a0009  ! 2535: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xe3020009  ! 2535: LDF_R	ld	[%r8, %r9], %f17
	.word 0xc6fa1009  ! 2535: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xcf220009  ! 2538: STF_R	st	%f7, [%r9, %r8]
	.word 0xda520009  ! 2538: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xc4da2f00  ! 2538: LDXA_I	ldxa	[%r8, + 0x0f00] %asi, %r2
	.word 0xfc720009  ! 2541: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xcc120009  ! 2541: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xca4a2814  ! 2541: LDSB_I	ldsb	[%r8 + 0x0814], %r5
	.word 0xc82a0009  ! 2544: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfe020009  ! 2544: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xc36a0009  ! 2544: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6220009  ! 2547: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 2547: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc71a0009  ! 2547: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc8220009  ! 2550: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 2550: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8da209a9  ! 2550: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xe4320009  ! 2553: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc9020009  ! 2553: LDF_R	ld	[%r8, %r9], %f4
	.word 0xeaaa1009  ! 2553: STBA_R	stba	%r21, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 2556: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xdb020009  ! 2556: LDF_R	ld	[%r8, %r9], %f13
	.word 0xe07a0009  ! 2556: SWAP_R	swap	%r16, [%r8 + %r9]
	.word 0xe6220009  ! 2559: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xe71a0009  ! 2559: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xce520009  ! 2559: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc2220009  ! 2562: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce0a0009  ! 2562: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc3ea25f0  ! 2562: PREFETCHA_I	prefetcha	[%r8, + 0x05f0] %asi, #one_read
	.word 0xc82a0009  ! 2565: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc7020009  ! 2565: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e071  ! 2565: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xcd220009  ! 2568: STF_R	st	%f6, [%r9, %r8]
	.word 0xfa520009  ! 2568: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xc36a0009  ! 2568: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce2a0009  ! 2571: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc80a0009  ! 2571: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3ea2958  ! 2571: PREFETCHA_I	prefetcha	[%r8, + 0x0958] %asi, #one_read
	.word 0xdc320009  ! 2574: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc8520009  ! 2574: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc36a29ac  ! 2574: PREFETCH_I	prefetch	[%r8 + 0x09ac], #one_read
	.word 0xf4720009  ! 2577: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xe44a0009  ! 2577: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xf81a0009  ! 2577: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc2720009  ! 2580: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 2580: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xce120009  ! 2580: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc8320009  ! 2583: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe2520009  ! 2583: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0x88da2f68  ! 2583: SMULcc_I	smulcc 	%r8, 0x0f68, %r4
	.word 0xd73a0009  ! 2586: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc85a0009  ! 2586: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143e077  ! 2586: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xea220009  ! 2589: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc40a0009  ! 2589: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xdff21009  ! 2589: CASXA_I	casxa	[%r8] 0x80, %r9, %r15
	.word 0xca220009  ! 2592: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4120009  ! 2592: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xce020009  ! 2592: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xca2a0009  ! 2595: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe51a0009  ! 2595: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0x1c800002  ! 2595: BPOS	bpos  	<label_0x2>
	.word 0xc93a0009  ! 2598: STDF_R	std	%f4, [%r9, %r8]
	.word 0xd80a0009  ! 2598: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0x8a720009  ! 2598: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xda320009  ! 2601: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xf84a0009  ! 2601: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0xc3ea1009  ! 2601: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca2a0009  ! 2604: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 2604: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xe87a2cf8  ! 2604: SWAP_I	swap	%r20, [%r8 + 0x0cf8]
	.word 0xcd3a0009  ! 2607: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe4520009  ! 2607: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x9a4a0009  ! 2607: MULX_R	mulx 	%r8, %r9, %r13
	.word 0xce320009  ! 2610: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca420009  ! 2610: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcea21009  ! 2610: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xf8720009  ! 2613: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xce0a0009  ! 2613: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x3e800001  ! 2613: BVC	bvc,a	<label_0x1>
	.word 0xc4720009  ! 2616: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xea020009  ! 2616: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xfa022da4  ! 2616: LDUW_I	lduw	[%r8 + 0x0da4], %r29
	.word 0xcc2a0009  ! 2619: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc2420009  ! 2619: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc8ca26dc  ! 2619: LDSBA_I	ldsba	[%r8, + 0x06dc] %asi, %r4
	.word 0xcd220009  ! 2622: STF_R	st	%f6, [%r9, %r8]
	.word 0xc2120009  ! 2622: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 2622: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe82a0009  ! 2625: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xfe420009  ! 2625: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0xcb020009  ! 2625: LDF_R	ld	[%r8, %r9], %f5
	.word 0xf6720009  ! 2628: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xcc420009  ! 2628: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xea8a1009  ! 2628: LDUBA_R	lduba	[%r8, %r9] 0x80, %r21
	.word 0xc2720009  ! 2631: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 2631: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc3ea27a8  ! 2631: PREFETCHA_I	prefetcha	[%r8, + 0x07a8] %asi, #one_read
	.word 0xc6320009  ! 2634: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 2634: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc73a0009  ! 2634: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfc720009  ! 2637: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xe6520009  ! 2637: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xc53a2860  ! 2637: STDF_I	std	%f2, [0x0860, %r8]
	.word 0xcd220009  ! 2640: STF_R	st	%f6, [%r9, %r8]
	.word 0xc44a0009  ! 2640: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8143e06e  ! 2640: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xf3220009  ! 2643: STF_R	st	%f25, [%r9, %r8]
	.word 0xf51a0009  ! 2643: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xc46a0009  ! 2643: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xcc320009  ! 2646: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 2646: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x864a2adc  ! 2646: MULX_I	mulx 	%r8, 0x0adc, %r3
	.word 0xe8320009  ! 2649: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xd8020009  ! 2649: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0x896a2210  ! 2649: SDIVX_I	sdivx	%r8, 0x0210, %r4
	.word 0xd7220009  ! 2652: STF_R	st	%f11, [%r9, %r8]
	.word 0xe0420009  ! 2652: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xcad22964  ! 2652: LDSHA_I	ldsha	[%r8, + 0x0964] %asi, %r5
	.word 0xf1220009  ! 2655: STF_R	st	%f24, [%r9, %r8]
	.word 0xcc120009  ! 2655: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xbeda0009  ! 2655: SMULcc_R	smulcc 	%r8, %r9, %r31
	.word 0xc42a0009  ! 2658: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc120009  ! 2658: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xccb22cf4  ! 2658: STHA_I	stha	%r6, [%r8 + 0x0cf4] %asi
	.word 0xdb220009  ! 2661: STF_R	st	%f13, [%r9, %r8]
	.word 0xca020009  ! 2661: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xfcaa1009  ! 2661: STBA_R	stba	%r30, [%r8 + %r9] 0x80
	.word 0xe33a0009  ! 2664: STDF_R	std	%f17, [%r9, %r8]
	.word 0xcf020009  ! 2664: LDF_R	ld	[%r8, %r9], %f7
	.word 0xfaca1009  ! 2664: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r29
	.word 0xf7220009  ! 2667: STF_R	st	%f27, [%r9, %r8]
	.word 0xc45a0009  ! 2667: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x02ca0001  ! 2667: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xca220009  ! 2670: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xd8020009  ! 2670: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xc36a23f4  ! 2670: PREFETCH_I	prefetch	[%r8 + 0x03f4], #one_read
	.word 0xc4220009  ! 2673: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xec420009  ! 2673: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x87222c44  ! 2673: MULScc_I	mulscc 	%r8, 0x0c44, %r3
	.word 0xf53a0009  ! 2676: STDF_R	std	%f26, [%r9, %r8]
	.word 0xc4120009  ! 2676: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc41a0009  ! 2676: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xde720009  ! 2679: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xed020009  ! 2679: LDF_R	ld	[%r8, %r9], %f22
	.word 0x8ada0009  ! 2679: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xcc720009  ! 2682: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xde020009  ! 2682: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xc48a23bc  ! 2682: LDUBA_I	lduba	[%r8, + 0x03bc] %asi, %r2
	.word 0xce220009  ! 2685: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce120009  ! 2685: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 2685: STBAR	stbar
	.word 0xdd3a0009  ! 2688: STDF_R	std	%f14, [%r9, %r8]
	.word 0xfa520009  ! 2688: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x83a208a9  ! 2688: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc7220009  ! 2691: STF_R	st	%f3, [%r9, %r8]
	.word 0xea5a0009  ! 2691: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x83a208a9  ! 2691: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xc7220009  ! 2694: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc1a0009  ! 2694: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2694: STBAR	stbar
	.word 0xcb220009  ! 2697: STF_R	st	%f5, [%r9, %r8]
	.word 0xc7020009  ! 2697: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e01e  ! 2697: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc8720009  ! 2700: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 2700: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea26a4  ! 2700: PREFETCHA_I	prefetcha	[%r8, + 0x06a4] %asi, #one_read
	.word 0xf73a0009  ! 2703: STDF_R	std	%f27, [%r9, %r8]
	.word 0xdb020009  ! 2703: LDF_R	ld	[%r8, %r9], %f13
	.word 0xfa520009  ! 2703: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xe4220009  ! 2706: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xd8120009  ! 2706: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xc3ea2304  ! 2706: PREFETCHA_I	prefetcha	[%r8, + 0x0304] %asi, #one_read
	.word 0xe62a0009  ! 2709: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xce5a0009  ! 2709: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x89222af8  ! 2709: MULScc_I	mulscc 	%r8, 0x0af8, %r4
	.word 0xd62a0009  ! 2712: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xc2520009  ! 2712: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcc7a2e8c  ! 2712: SWAP_I	swap	%r6, [%r8 + 0x0e8c]
	.word 0xe62a0009  ! 2715: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xcd1a0009  ! 2715: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143e077  ! 2715: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xca2a0009  ! 2718: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca520009  ! 2718: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xb8fa2664  ! 2718: SDIVcc_I	sdivcc 	%r8, 0x0664, %r28
	.word 0xf13a0009  ! 2721: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc25a0009  ! 2721: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xda0227b4  ! 2721: LDUW_I	lduw	[%r8 + 0x07b4], %r13
	.word 0xc62a0009  ! 2724: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce420009  ! 2724: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 2724: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc22a0009  ! 2727: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce120009  ! 2727: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xe7220009  ! 2727: STF_R	st	%f19, [%r9, %r8]
	.word 0xcc2a0009  ! 2730: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xfe5a0009  ! 2730: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0x836a0009  ! 2730: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xce220009  ! 2733: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe20a0009  ! 2733: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x89a209a9  ! 2733: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc7220009  ! 2736: STF_R	st	%f3, [%r9, %r8]
	.word 0xc81a0009  ! 2736: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xf31a0009  ! 2736: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0xca2a0009  ! 2739: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd81a0009  ! 2739: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xc49a2630  ! 2739: LDDA_I	ldda	[%r8, + 0x0630] %asi, %r2
	.word 0xd7220009  ! 2742: STF_R	st	%f11, [%r9, %r8]
	.word 0xe44a0009  ! 2742: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0x32800001  ! 2742: BNE	bne,a	<label_0x1>
	.word 0xf3220009  ! 2745: STF_R	st	%f25, [%r9, %r8]
	.word 0xcc420009  ! 2745: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xca7a0009  ! 2745: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xcc220009  ! 2748: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xf6420009  ! 2748: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x0c800001  ! 2748: BNEG	bneg  	<label_0x1>
	.word 0xe0720009  ! 2751: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc8520009  ! 2751: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xf9f22009  ! 2751: CASXA_R	casxa	[%r8]%asi, %r9, %r28
	.word 0xde320009  ! 2754: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc2120009  ! 2754: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x86fa0009  ! 2754: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xdc720009  ! 2757: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xdd1a0009  ! 2757: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xc9f22009  ! 2757: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xcc2a0009  ! 2760: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc41a0009  ! 2760: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc2f21009  ! 2760: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 2763: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce020009  ! 2763: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xdc9a1009  ! 2763: LDDA_R	ldda	[%r8, %r9] 0x80, %r14
	.word 0xc93a0009  ! 2766: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf64a0009  ! 2766: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xa04a2818  ! 2766: MULX_I	mulx 	%r8, 0x0818, %r16
	.word 0xf22a0009  ! 2769: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xce4a0009  ! 2769: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8ef220f8  ! 2769: UDIVcc_I	udivcc 	%r8, 0x00f8, %r7
	.word 0xc22a0009  ! 2772: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc5020009  ! 2772: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8af22b3c  ! 2772: UDIVcc_I	udivcc 	%r8, 0x0b3c, %r5
	.word 0xc7220009  ! 2775: STF_R	st	%f3, [%r9, %r8]
	.word 0xc71a0009  ! 2775: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x40000001  ! 2775: CALL	call	disp30_1
	.word 0xe22a0009  ! 2778: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xe0020009  ! 2778: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x3c800001  ! 2778: BPOS	bpos,a	<label_0x1>
	.word 0xec720009  ! 2781: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xeb1a0009  ! 2781: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xa4722b48  ! 2781: UDIV_I	udiv 	%r8, 0x0b48, %r18
	.word 0xca220009  ! 2784: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc9020009  ! 2784: LDF_R	ld	[%r8, %r9], %f4
	.word 0xccba2180  ! 2784: STDA_I	stda	%r6, [%r8 + 0x0180] %asi
	.word 0xc8720009  ! 2787: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfc020009  ! 2787: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0x867a0009  ! 2787: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xef220009  ! 2790: STF_R	st	%f23, [%r9, %r8]
	.word 0xed1a0009  ! 2790: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0xe4ba1009  ! 2790: STDA_R	stda	%r18, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 2793: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc020009  ! 2793: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8fa208a9  ! 2793: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc9220009  ! 2796: STF_R	st	%f4, [%r9, %r8]
	.word 0xda420009  ! 2796: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0x8cd22264  ! 2796: UMULcc_I	umulcc 	%r8, 0x0264, %r6
	.word 0xcf220009  ! 2799: STF_R	st	%f7, [%r9, %r8]
	.word 0xe71a0009  ! 2799: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xfaea1009  ! 2799: LDSTUBA_R	ldstuba	%r29, [%r8 + %r9] 0x80
	.word 0xe73a0009  ! 2802: STDF_R	std	%f19, [%r9, %r8]
	.word 0xe60a0009  ! 2802: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xc40a2a50  ! 2802: LDUB_I	ldub	[%r8 + 0x0a50], %r2
	.word 0xc8320009  ! 2805: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc25a0009  ! 2805: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x9c520009  ! 2805: UMUL_R	umul 	%r8, %r9, %r14
	.word 0xc6720009  ! 2808: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 2808: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143e077  ! 2808: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc6220009  ! 2811: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 2811: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xca4a0009  ! 2811: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcf3a0009  ! 2814: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc020009  ! 2814: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x2cc20001  ! 2814: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xc2320009  ! 2817: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4520009  ! 2817: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc2aa1009  ! 2817: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 2820: STDF_R	std	%f3, [%r9, %r8]
	.word 0xfa120009  ! 2820: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0x83220009  ! 2820: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xc33a0009  ! 2823: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc44a0009  ! 2823: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2823: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc22a0009  ! 2826: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 2826: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 2826: STBAR	stbar
	.word 0xc5220009  ! 2829: STF_R	st	%f2, [%r9, %r8]
	.word 0xc45a0009  ! 2829: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x8e4a23ac  ! 2829: MULX_I	mulx 	%r8, 0x03ac, %r7
	.word 0xff3a0009  ! 2832: STDF_R	std	%f31, [%r9, %r8]
	.word 0xcb020009  ! 2832: LDF_R	ld	[%r8, %r9], %f5
	.word 0xa1222f20  ! 2832: MULScc_I	mulscc 	%r8, 0x0f20, %r16
	.word 0xc33a0009  ! 2835: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc3020009  ! 2835: LDF_R	ld	[%r8, %r9], %f1
	.word 0xa8da2ca4  ! 2835: SMULcc_I	smulcc 	%r8, 0x0ca4, %r20
	.word 0xfb3a0009  ! 2838: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc6520009  ! 2838: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x34800001  ! 2838: BG	bg,a	<label_0x1>
	.word 0xc73a0009  ! 2841: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc5a0009  ! 2841: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8da208a9  ! 2841: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xfa320009  ! 2844: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xf64a0009  ! 2844: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xcb2221e0  ! 2844: STF_I	st	%f5, [0x01e0, %r8]
	.word 0xc5220009  ! 2847: STF_R	st	%f2, [%r9, %r8]
	.word 0xc3020009  ! 2847: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e024  ! 2847: MEMBAR	membar	#LoadStore | #MemIssue 
	.word 0xc93a0009  ! 2850: STDF_R	std	%f4, [%r9, %r8]
	.word 0xea5a0009  ! 2850: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x0e800002  ! 2850: BVS	bvs  	<label_0x2>
	.word 0xe0720009  ! 2853: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc40a0009  ! 2853: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x0c800001  ! 2853: BNEG	bneg  	<label_0x1>
	.word 0xfa2a0009  ! 2856: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xe24a0009  ! 2856: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x0aca0001  ! 2856: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xf2720009  ! 2859: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc2420009  ! 2859: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x1e800002  ! 2859: BVC	bvc  	<label_0x2>
	.word 0xc8320009  ! 2862: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc01a0009  ! 2862: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x86fa0009  ! 2862: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xe0720009  ! 2865: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xcc520009  ! 2865: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x1e800001  ! 2865: BVC	bvc  	<label_0x1>
	.word 0xcb220009  ! 2868: STF_R	st	%f5, [%r9, %r8]
	.word 0xe41a0009  ! 2868: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x38800001  ! 2868: BGU	bgu,a	<label_0x1>
	.word 0xdf3a0009  ! 2871: STDF_R	std	%f15, [%r9, %r8]
	.word 0xe0520009  ! 2871: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xca420009  ! 2871: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc7220009  ! 2874: STF_R	st	%f3, [%r9, %r8]
	.word 0xc45a0009  ! 2874: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xb3a20929  ! 2874: FMULs	fmuls	%f8, %f9, %f25
	.word 0xc33a0009  ! 2877: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce020009  ! 2877: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xde4a2eac  ! 2877: LDSB_I	ldsb	[%r8 + 0x0eac], %r15
	.word 0xc2220009  ! 2880: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc45a0009  ! 2880: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xae6a2f10  ! 2880: UDIVX_I	udivx 	%r8, 0x0f10, %r23
	.word 0xfd3a0009  ! 2883: STDF_R	std	%f30, [%r9, %r8]
	.word 0xfe120009  ! 2883: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0x846a2140  ! 2883: UDIVX_I	udivx 	%r8, 0x0140, %r2
	.word 0xe62a0009  ! 2886: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xce020009  ! 2886: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xf1222460  ! 2886: STF_I	st	%f24, [0x0460, %r8]
	.word 0xfd3a0009  ! 2889: STDF_R	std	%f30, [%r9, %r8]
	.word 0xcc520009  ! 2889: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc91a28f0  ! 2889: LDDF_I	ldd	[%r8, 0x08f0], %f4
	.word 0xc53a0009  ! 2892: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcb1a0009  ! 2892: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xd8ba20c8  ! 2892: STDA_I	stda	%r12, [%r8 + 0x00c8] %asi
	.word 0xdc220009  ! 2895: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc24a0009  ! 2895: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc4b22afc  ! 2895: STHA_I	stha	%r2, [%r8 + 0x0afc] %asi
	.word 0xf22a0009  ! 2898: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xcd1a0009  ! 2898: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xa6f20009  ! 2898: UDIVcc_R	udivcc 	%r8, %r9, %r19
	.word 0xc6720009  ! 2901: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8520009  ! 2901: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x16800001  ! 2901: BGE	bge  	<label_0x1>
	.word 0xcc220009  ! 2904: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 2904: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8afa2d7c  ! 2904: SDIVcc_I	sdivcc 	%r8, 0x0d7c, %r5
	.word 0xde220009  ! 2907: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xce4a0009  ! 2907: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 2907: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xda2a0009  ! 2910: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xca420009  ! 2910: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcf020009  ! 2910: LDF_R	ld	[%r8, %r9], %f7
	.word 0xf3220009  ! 2913: STF_R	st	%f25, [%r9, %r8]
	.word 0xca5a0009  ! 2913: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x24c20001  ! 2913: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc6720009  ! 2916: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe81a0009  ! 2916: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x82da254c  ! 2916: SMULcc_I	smulcc 	%r8, 0x054c, %r1
	.word 0xc82a0009  ! 2919: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca020009  ! 2919: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143e05b  ! 2919: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc22a0009  ! 2922: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce420009  ! 2922: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 2922: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf220009  ! 2925: STF_R	st	%f7, [%r9, %r8]
	.word 0xc91a0009  ! 2925: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x8da20929  ! 2925: FMULs	fmuls	%f8, %f9, %f6
	.word 0xf02a0009  ! 2928: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xdb020009  ! 2928: LDF_R	ld	[%r8, %r9], %f13
	.word 0x9872246c  ! 2928: UDIV_I	udiv 	%r8, 0x046c, %r12
	.word 0xca2a0009  ! 2931: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc4a0009  ! 2931: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2931: STBAR	stbar
	.word 0xc62a0009  ! 2934: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xd6520009  ! 2934: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0x02800002  ! 2934: BE	be  	<label_0x2>
	.word 0xce220009  ! 2937: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xea120009  ! 2937: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xcaea2eb4  ! 2937: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0eb4] %asi
	.word 0xc2220009  ! 2940: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf6120009  ! 2940: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xc3ea1009  ! 2940: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xda220009  ! 2943: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc84a0009  ! 2943: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8d6a0009  ! 2943: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xf0220009  ! 2946: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xcd020009  ! 2946: LDF_R	ld	[%r8, %r9], %f6
	.word 0x86520009  ! 2946: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc6220009  ! 2949: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 2949: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xcc1a2348  ! 2949: LDD_I	ldd	[%r8 + 0x0348], %r6
	.word 0xca720009  ! 2952: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xeb020009  ! 2952: LDF_R	ld	[%r8, %r9], %f21
	.word 0x3a800002  ! 2952: BCC	bcc,a	<label_0x2>
	.word 0xca320009  ! 2955: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf8020009  ! 2955: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0x18800002  ! 2955: BGU	bgu  	<label_0x2>
	.word 0xf1220009  ! 2958: STF_R	st	%f24, [%r9, %r8]
	.word 0xc6020009  ! 2958: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8ada21ec  ! 2958: SMULcc_I	smulcc 	%r8, 0x01ec, %r5
	.word 0xf8220009  ! 2961: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xca420009  ! 2961: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x82fa2178  ! 2961: SDIVcc_I	sdivcc 	%r8, 0x0178, %r1
	.word 0xc8220009  ! 2964: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc4a0009  ! 2964: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8da20929  ! 2964: FMULs	fmuls	%f8, %f9, %f6
	.word 0xcc220009  ! 2967: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc420009  ! 2967: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 2967: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc73a0009  ! 2970: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc2020009  ! 2970: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 2970: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc73a0009  ! 2973: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd81a0009  ! 2973: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x84720009  ! 2973: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc6220009  ! 2976: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xdf1a0009  ! 2976: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x38800001  ! 2976: BGU	bgu,a	<label_0x1>
	.word 0xc42a0009  ! 2979: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce120009  ! 2979: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xc6f21009  ! 2979: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 2982: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe7020009  ! 2982: LDF_R	ld	[%r8, %r9], %f19
	.word 0x30800001  ! 2982: BA	ba,a	<label_0x1>
	.word 0xc33a0009  ! 2985: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc420009  ! 2985: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xd68a1009  ! 2985: LDUBA_R	lduba	[%r8, %r9] 0x80, %r11
	.word 0xc33a0009  ! 2988: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf4420009  ! 2988: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xcef21009  ! 2988: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 2991: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc2120009  ! 2991: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8ed22df4  ! 2991: UMULcc_I	umulcc 	%r8, 0x0df4, %r7
	.word 0xcc720009  ! 2994: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 2994: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xb56a2658  ! 2994: SDIVX_I	sdivx	%r8, 0x0658, %r26
	.word 0xc6720009  ! 2997: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xdc4a0009  ! 2997: LDSB_R	ldsb	[%r8 + %r9], %r14
	.word 0xeeb21009  ! 2997: STHA_R	stha	%r23, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 3000: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc65a0009  ! 3000: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x867a0009  ! 3000: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xdc2a0009  ! 3003: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xdc420009  ! 3003: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xfa5a2290  ! 3003: LDX_I	ldx	[%r8 + 0x0290], %r29
	.word 0xdd3a0009  ! 3006: STDF_R	std	%f14, [%r9, %r8]
	.word 0xf04a0009  ! 3006: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xdcf21009  ! 3006: STXA_R	stxa	%r14, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 3009: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce120009  ! 3009: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xfe7a2248  ! 3009: SWAP_I	swap	%r31, [%r8 + 0x0248]
	.word 0xc4220009  ! 3012: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 3012: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc85a2e60  ! 3012: LDX_I	ldx	[%r8 + 0x0e60], %r4
	.word 0xc5220009  ! 3015: STF_R	st	%f2, [%r9, %r8]
	.word 0xfe4a0009  ! 3015: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0x85220009  ! 3015: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xea220009  ! 3018: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc6120009  ! 3018: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcc9a1009  ! 3018: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xe53a0009  ! 3021: STDF_R	std	%f18, [%r9, %r8]
	.word 0xee520009  ! 3021: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x34800001  ! 3021: BG	bg,a	<label_0x1>
	.word 0xe22a0009  ! 3024: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xf2520009  ! 3024: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x826a0009  ! 3024: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xe6220009  ! 3027: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xfb020009  ! 3027: LDF_R	ld	[%r8, %r9], %f29
	.word 0xc3ea1009  ! 3027: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe1220009  ! 3030: STF_R	st	%f16, [%r9, %r8]
	.word 0xc71a0009  ! 3030: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc36a0009  ! 3030: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe4320009  ! 3033: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc4520009  ! 3033: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc8a21009  ! 3033: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 3036: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc4420009  ! 3036: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xcea21009  ! 3036: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xde720009  ! 3039: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xcc1a0009  ! 3039: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xdb0220d0  ! 3039: LDF_I	ld	[%r8, 0x00d0], %f13
	.word 0xc8720009  ! 3042: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfc520009  ! 3042: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x8143e077  ! 3042: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcc720009  ! 3045: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 3045: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143e066  ! 3045: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xc2220009  ! 3048: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xde4a0009  ! 3048: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0x89220009  ! 3048: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc4220009  ! 3051: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc120009  ! 3051: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xfc7a2320  ! 3051: SWAP_I	swap	%r30, [%r8 + 0x0320]
	.word 0xc8320009  ! 3054: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xfe520009  ! 3054: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xaa7a0009  ! 3054: SDIV_R	sdiv 	%r8, %r9, %r21
	.word 0xc33a0009  ! 3057: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc8420009  ! 3057: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe0b21009  ! 3057: STHA_R	stha	%r16, [%r8 + %r9] 0x80
	.word 0xca720009  ! 3060: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf1020009  ! 3060: LDF_R	ld	[%r8, %r9], %f24
	.word 0x8a720009  ! 3060: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xcc220009  ! 3063: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 3063: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc20a0009  ! 3063: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc53a0009  ! 3066: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc4520009  ! 3066: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc36a2f14  ! 3066: PREFETCH_I	prefetch	[%r8 + 0x0f14], #one_read
	.word 0xc4320009  ! 3069: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc6120009  ! 3069: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xccea1009  ! 3069: LDSTUBA_R	ldstuba	%r6, [%r8 + %r9] 0x80
	.word 0xc33a0009  ! 3072: STDF_R	std	%f1, [%r9, %r8]
	.word 0xd85a0009  ! 3072: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xf44a0009  ! 3072: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xe6320009  ! 3075: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xca420009  ! 3075: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xe1020009  ! 3075: LDF_R	ld	[%r8, %r9], %f16
	.word 0xcd220009  ! 3078: STF_R	st	%f6, [%r9, %r8]
	.word 0xcf020009  ! 3078: LDF_R	ld	[%r8, %r9], %f7
	.word 0x20800002  ! 3078: BN	bn,a	<label_0x2>
	.word 0xc3220009  ! 3081: STF_R	st	%f1, [%r9, %r8]
	.word 0xc8420009  ! 3081: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143e03a  ! 3081: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc33a0009  ! 3084: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc24a0009  ! 3084: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xf73a0009  ! 3084: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc33a0009  ! 3087: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2020009  ! 3087: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x2cc20001  ! 3087: BRGZ	brgz,a,nt	%8,<label_0x20001>
	.word 0xe9220009  ! 3090: STF_R	st	%f20, [%r9, %r8]
	.word 0xc2420009  ! 3090: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 3090: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcc220009  ! 3093: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 3093: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xe0aa1009  ! 3093: STBA_R	stba	%r16, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 3096: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce420009  ! 3096: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc36a230c  ! 3096: PREFETCH_I	prefetch	[%r8 + 0x030c], #one_read
	.word 0xde720009  ! 3099: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc4120009  ! 3099: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xf6aa2fec  ! 3099: STBA_I	stba	%r27, [%r8 + 0x0fec] %asi
	.word 0xc4720009  ! 3102: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 3102: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3102: STBAR	stbar
	.word 0xc53a0009  ! 3105: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe5020009  ! 3105: LDF_R	ld	[%r8, %r9], %f18
	.word 0x8e520009  ! 3105: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xee220009  ! 3108: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xda0a0009  ! 3108: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0x84da2dc0  ! 3108: SMULcc_I	smulcc 	%r8, 0x0dc0, %r2
	.word 0xd93a0009  ! 3111: STDF_R	std	%f12, [%r9, %r8]
	.word 0xcd1a0009  ! 3111: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc36a2298  ! 3111: PREFETCH_I	prefetch	[%r8 + 0x0298], #one_read
	.word 0xc7220009  ! 3114: STF_R	st	%f3, [%r9, %r8]
	.word 0xc51a0009  ! 3114: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xe6422ed8  ! 3114: LDSW_I	ldsw	[%r8 + 0x0ed8], %r19
	.word 0xf13a0009  ! 3117: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc6020009  ! 3117: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc36a2ec4  ! 3117: PREFETCH_I	prefetch	[%r8 + 0x0ec4], #one_read
	.word 0xc8220009  ! 3120: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc2420009  ! 3120: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x826a0009  ! 3120: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xd62a0009  ! 3123: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xe6420009  ! 3123: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xe7220009  ! 3123: STF_R	st	%f19, [%r9, %r8]
	.word 0xca2a0009  ! 3126: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xdc020009  ! 3126: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xb67a2e94  ! 3126: SDIV_I	sdiv 	%r8, 0x0e94, %r27
	.word 0xc6220009  ! 3129: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 3129: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8143e045  ! 3129: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xc8320009  ! 3132: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc44a0009  ! 3132: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xe2022210  ! 3132: LDUW_I	lduw	[%r8 + 0x0210], %r17
	.word 0xd93a0009  ! 3135: STDF_R	std	%f12, [%r9, %r8]
	.word 0xed1a0009  ! 3135: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0x8143c000  ! 3135: STBAR	stbar
	.word 0xc8220009  ! 3138: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf7020009  ! 3138: LDF_R	ld	[%r8, %r9], %f27
	.word 0x84720009  ! 3138: UDIV_R	udiv 	%r8, %r9, %r2
	.word 0xc93a0009  ! 3141: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc1a0009  ! 3141: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc212274c  ! 3141: LDUH_I	lduh	[%r8 + 0x074c], %r1
	.word 0xc62a0009  ! 3144: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 3144: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xfef21009  ! 3144: STXA_R	stxa	%r31, [%r8 + %r9] 0x80
	.word 0xf8720009  ! 3147: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xf01a0009  ! 3147: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xc44a27f0  ! 3147: LDSB_I	ldsb	[%r8 + 0x07f0], %r2
	.word 0xca720009  ! 3150: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc6020009  ! 3150: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc09a1009  ! 3150: LDDA_R	ldda	[%r8, %r9] 0x80, %r0
	.word 0xc2720009  ! 3153: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc40a0009  ! 3153: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc33a22f8  ! 3153: STDF_I	std	%f1, [0x02f8, %r8]
	.word 0xea220009  ! 3156: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xf4520009  ! 3156: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xe91a0009  ! 3156: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xe53a0009  ! 3159: STDF_R	std	%f18, [%r9, %r8]
	.word 0xc2420009  ! 3159: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xf81a0009  ! 3159: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xca220009  ! 3162: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 3162: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc47a2e1c  ! 3162: SWAP_I	swap	%r2, [%r8 + 0x0e1c]
	.word 0xcc2a0009  ! 3165: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 3165: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x02ca0001  ! 3165: BRZ	brz  ,pt	%8,<label_0xa0001>
	.word 0xce320009  ! 3168: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf0520009  ! 3168: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xc53a0009  ! 3168: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe8720009  ! 3171: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xce020009  ! 3171: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x04800002  ! 3171: BLE	ble  	<label_0x2>
	.word 0xf8220009  ! 3174: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xf0120009  ! 3174: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0x8143c000  ! 3174: STBAR	stbar
	.word 0xc62a0009  ! 3177: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 3177: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc36a253c  ! 3177: PREFETCH_I	prefetch	[%r8 + 0x053c], #one_read
	.word 0xdf3a0009  ! 3180: STDF_R	std	%f15, [%r9, %r8]
	.word 0xf60a0009  ! 3180: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xc33a0009  ! 3180: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc22a0009  ! 3183: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6120009  ! 3183: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x826a0009  ! 3183: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc4320009  ! 3186: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf51a0009  ! 3186: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xc3ea2c14  ! 3186: PREFETCHA_I	prefetcha	[%r8, + 0x0c14] %asi, #one_read
	.word 0xf5220009  ! 3189: STF_R	st	%f26, [%r9, %r8]
	.word 0xc64a0009  ! 3189: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 3189: STBAR	stbar
	.word 0xca320009  ! 3192: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf1020009  ! 3192: LDF_R	ld	[%r8, %r9], %f24
	.word 0xc7f22009  ! 3192: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xc2220009  ! 3195: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce020009  ! 3195: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x0e800002  ! 3195: BVS	bvs  	<label_0x2>
	.word 0xcd220009  ! 3198: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6420009  ! 3198: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc5022000  ! 3198: LDF_I	ld	[%r8, 0x0000], %f2
	.word 0xcc320009  ! 3201: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc65a0009  ! 3201: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x84f20009  ! 3201: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xc82a0009  ! 3204: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca5a0009  ! 3204: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x3e800001  ! 3204: BVC	bvc,a	<label_0x1>
	.word 0xe93a0009  ! 3207: STDF_R	std	%f20, [%r9, %r8]
	.word 0xfc4a0009  ! 3207: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xc8da1009  ! 3207: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0xc33a0009  ! 3210: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc80a0009  ! 3210: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143e035  ! 3210: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xce320009  ! 3213: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe04a0009  ! 3213: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xc3ea2610  ! 3213: PREFETCHA_I	prefetcha	[%r8, + 0x0610] %asi, #one_read
	.word 0xc5220009  ! 3216: STF_R	st	%f2, [%r9, %r8]
	.word 0xc44a0009  ! 3216: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x2cca0001  ! 3216: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xce320009  ! 3219: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc01a0009  ! 3219: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xd87a0009  ! 3219: SWAP_R	swap	%r12, [%r8 + %r9]
	.word 0xdd220009  ! 3222: STF_R	st	%f14, [%r9, %r8]
	.word 0xc81a0009  ! 3222: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3222: STBAR	stbar
	.word 0xcf220009  ! 3225: STF_R	st	%f7, [%r9, %r8]
	.word 0xc31a0009  ! 3225: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x34800001  ! 3225: BG	bg,a	<label_0x1>
	.word 0xf6720009  ! 3228: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc25a0009  ! 3228: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x22800002  ! 3228: BE	be,a	<label_0x2>
	.word 0xcb220009  ! 3231: STF_R	st	%f5, [%r9, %r8]
	.word 0xc6020009  ! 3231: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xe6ea1009  ! 3231: LDSTUBA_R	ldstuba	%r19, [%r8 + %r9] 0x80
	.word 0xe73a0009  ! 3234: STDF_R	std	%f19, [%r9, %r8]
	.word 0xf8520009  ! 3234: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0x3c800002  ! 3234: BPOS	bpos,a	<label_0x2>
	.word 0xcf3a0009  ! 3237: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcb020009  ! 3237: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143c000  ! 3237: STBAR	stbar
	.word 0xc8720009  ! 3240: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc6020009  ! 3240: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc8b21009  ! 3240: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xe2720009  ! 3243: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xde5a0009  ! 3243: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0x10800001  ! 3243: BA	ba  	<label_0x1>
	.word 0xe0320009  ! 3246: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xdc420009  ! 3246: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xdeb21009  ! 3246: STHA_R	stha	%r15, [%r8 + %r9] 0x80
	.word 0xf22a0009  ! 3249: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc81a0009  ! 3249: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea2f2c  ! 3249: PREFETCHA_I	prefetcha	[%r8, + 0x0f2c] %asi, #one_read
	.word 0xc8220009  ! 3252: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 3252: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x88f22784  ! 3252: UDIVcc_I	udivcc 	%r8, 0x0784, %r4
	.word 0xc33a0009  ! 3255: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf5020009  ! 3255: LDF_R	ld	[%r8, %r9], %f26
	.word 0xc36a2ee4  ! 3255: PREFETCH_I	prefetch	[%r8 + 0x0ee4], #one_read
	.word 0xc2720009  ! 3258: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xd8120009  ! 3258: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xfe5a0009  ! 3258: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xc2720009  ! 3261: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc6120009  ! 3261: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8e6a218c  ! 3261: UDIVX_I	udivx 	%r8, 0x018c, %r7
	.word 0xe8320009  ! 3264: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xf6420009  ! 3264: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0x825a2148  ! 3264: SMUL_I	smul 	%r8, 0x0148, %r1
	.word 0xfc2a0009  ! 3267: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xe25a0009  ! 3267: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xc4b22e18  ! 3267: STHA_I	stha	%r2, [%r8 + 0x0e18] %asi
	.word 0xf1220009  ! 3270: STF_R	st	%f24, [%r9, %r8]
	.word 0xc2520009  ! 3270: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc3220009  ! 3270: STF_R	st	%f1, [%r9, %r8]
	.word 0xc82a0009  ! 3273: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc01a0009  ! 3273: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc3f22009  ! 3273: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xc2720009  ! 3276: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 3276: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc6ca2f8c  ! 3276: LDSBA_I	ldsba	[%r8, + 0x0f8c] %asi, %r3
	.word 0xc4320009  ! 3279: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf04a0009  ! 3279: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0xcd220009  ! 3279: STF_R	st	%f6, [%r9, %r8]
	.word 0xcd220009  ! 3282: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc020009  ! 3282: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc6f21009  ! 3282: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 3285: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 3285: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xf91a0009  ! 3285: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0xc62a0009  ! 3288: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca520009  ! 3288: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xede21009  ! 3288: CASA_I	casa	[%r8] 0x80, %r9, %r22
	.word 0xc6320009  ! 3291: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6420009  ! 3291: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x83a209a9  ! 3291: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xea720009  ! 3294: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc85a0009  ! 3294: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143e037  ! 3294: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xc6320009  ! 3297: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 3297: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x1c800002  ! 3297: BPOS	bpos  	<label_0x2>
	.word 0xe2720009  ! 3300: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xca420009  ! 3300: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8c7a2448  ! 3300: SDIV_I	sdiv 	%r8, 0x0448, %r6
	.word 0xc6320009  ! 3303: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc6020009  ! 3303: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc3ea287c  ! 3303: PREFETCHA_I	prefetcha	[%r8, + 0x087c] %asi, #one_read
	.word 0xc6320009  ! 3306: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd64a0009  ! 3306: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xc4fa2c4c  ! 3306: SWAPA_I	swapa	%r2, [%r8 + 0x0c4c] %asi
	.word 0xed220009  ! 3309: STF_R	st	%f22, [%r9, %r8]
	.word 0xc6520009  ! 3309: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc33a2b48  ! 3309: STDF_I	std	%f1, [0x0b48, %r8]
	.word 0xca720009  ! 3312: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcd020009  ! 3312: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8e520009  ! 3312: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xfc720009  ! 3315: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc6020009  ! 3315: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8e7a2d88  ! 3315: SDIV_I	sdiv 	%r8, 0x0d88, %r7
	.word 0xc22a0009  ! 3318: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcd1a0009  ! 3318: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8c5a0009  ! 3318: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc8720009  ! 3321: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce420009  ! 3321: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xecba1009  ! 3321: STDA_R	stda	%r22, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 3324: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc4a0009  ! 3324: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xdd022578  ! 3324: LDF_I	ld	[%r8, 0x0578], %f14
	.word 0xc9220009  ! 3327: STF_R	st	%f4, [%r9, %r8]
	.word 0xd81a0009  ! 3327: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xc31a0009  ! 3327: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xca2a0009  ! 3330: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc8120009  ! 3330: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xdca22c94  ! 3330: STWA_I	stwa	%r14, [%r8 + 0x0c94] %asi
	.word 0xcc320009  ! 3333: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfc4a0009  ! 3333: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xf48a1009  ! 3333: LDUBA_R	lduba	[%r8, %r9] 0x80, %r26
	.word 0xc33a0009  ! 3336: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc25a0009  ! 3336: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc36a224c  ! 3336: PREFETCH_I	prefetch	[%r8 + 0x024c], #one_read
	.word 0xd8220009  ! 3339: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xee020009  ! 3339: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xcde22009  ! 3339: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xc6220009  ! 3342: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc6420009  ! 3342: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xcef21009  ! 3342: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xca720009  ! 3345: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc85a0009  ! 3345: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xea120009  ! 3345: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xcc720009  ! 3348: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc2520009  ! 3348: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xf2aa1009  ! 3348: STBA_R	stba	%r25, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 3351: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc8020009  ! 3351: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x9cf20009  ! 3351: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0xc53a0009  ! 3354: STDF_R	std	%f2, [%r9, %r8]
	.word 0xfe520009  ! 3354: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0x89a20829  ! 3354: FADDs	fadds	%f8, %f9, %f4
	.word 0xca220009  ! 3357: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xd84a0009  ! 3357: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xc36a0009  ! 3357: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca320009  ! 3360: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca520009  ! 3360: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x24c20001  ! 3360: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xca220009  ! 3363: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 3363: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcf1a0009  ! 3363: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc62a0009  ! 3366: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xeb020009  ! 3366: LDF_R	ld	[%r8, %r9], %f21
	.word 0xd66a0009  ! 3366: LDSTUB_R	ldstub	%r11, [%r8 + %r9]
	.word 0xcb3a0009  ! 3369: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc40a0009  ! 3369: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 3369: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce2a0009  ! 3372: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc20a0009  ! 3372: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc2ea2ddc  ! 3372: LDSTUBA_I	ldstuba	%r1, [%r8 + 0x0ddc] %asi
	.word 0xca220009  ! 3375: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc120009  ! 3375: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x89a209a9  ! 3375: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xc5220009  ! 3378: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4120009  ! 3378: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xe8da1009  ! 3378: LDXA_R	ldxa	[%r8, %r9] 0x80, %r20
	.word 0xca220009  ! 3381: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xea420009  ! 3381: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0x8143c000  ! 3381: STBAR	stbar
	.word 0xca320009  ! 3384: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc2420009  ! 3384: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x3c800001  ! 3384: BPOS	bpos,a	<label_0x1>
	.word 0xf6720009  ! 3387: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xe0020009  ! 3387: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x24800002  ! 3387: BLE	ble,a	<label_0x2>
	.word 0xcc320009  ! 3390: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 3390: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc3e21009  ! 3390: CASA_I	casa	[%r8] 0x80, %r9, %r1
	.word 0xe8720009  ! 3393: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xc8520009  ! 3393: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 3393: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 3396: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf11a0009  ! 3396: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xcc520009  ! 3396: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc8320009  ! 3399: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 3399: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcdf22009  ! 3399: CASXA_R	casxa	[%r8]%asi, %r9, %r6
	.word 0xc6220009  ! 3402: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 3402: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3402: STBAR	stbar
	.word 0xc6720009  ! 3405: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xce0a0009  ! 3405: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xce520009  ! 3405: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcf220009  ! 3408: STF_R	st	%f7, [%r9, %r8]
	.word 0xc24a0009  ! 3408: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xf11a0009  ! 3408: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xcb220009  ! 3411: STF_R	st	%f5, [%r9, %r8]
	.word 0xc9020009  ! 3411: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc36a2b58  ! 3411: PREFETCH_I	prefetch	[%r8 + 0x0b58], #one_read
	.word 0xc2720009  ! 3414: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xe65a0009  ! 3414: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0xf41a2688  ! 3414: LDD_I	ldd	[%r8 + 0x0688], %r26
	.word 0xc62a0009  ! 3417: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc64a0009  ! 3417: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xca7a2eec  ! 3417: SWAP_I	swap	%r5, [%r8 + 0x0eec]
	.word 0xff220009  ! 3420: STF_R	st	%f31, [%r9, %r8]
	.word 0xc81a0009  ! 3420: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc7e22009  ! 3420: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xe1220009  ! 3423: STF_R	st	%f16, [%r9, %r8]
	.word 0xc9020009  ! 3423: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc7f22009  ! 3423: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xc73a0009  ! 3426: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc0a0009  ! 3426: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc3ea2d1c  ! 3426: PREFETCHA_I	prefetcha	[%r8, + 0x0d1c] %asi, #one_read
	.word 0xfd3a0009  ! 3429: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc3020009  ! 3429: LDF_R	ld	[%r8, %r9], %f1
	.word 0x89a209a9  ! 3429: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xec720009  ! 3432: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc2120009  ! 3432: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8e720009  ! 3432: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc6320009  ! 3435: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc01a0009  ! 3435: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xcc1a2678  ! 3435: LDD_I	ldd	[%r8 + 0x0678], %r6
	.word 0xc42a0009  ! 3438: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc65a0009  ! 3438: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc93a2728  ! 3438: STDF_I	std	%f4, [0x0728, %r8]
	.word 0xca2a0009  ! 3441: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce520009  ! 3441: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x30800002  ! 3441: BA	ba,a	<label_0x2>
	.word 0xde2a0009  ! 3444: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc8420009  ! 3444: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc6a22ae4  ! 3444: STWA_I	stwa	%r3, [%r8 + 0x0ae4] %asi
	.word 0xc7220009  ! 3447: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4520009  ! 3447: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc9020009  ! 3447: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc8220009  ! 3450: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 3450: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc36a2174  ! 3450: PREFETCH_I	prefetch	[%r8 + 0x0174], #one_read
	.word 0xc8320009  ! 3453: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce120009  ! 3453: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x24ca0001  ! 3453: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xce720009  ! 3456: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 3456: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc89a2720  ! 3456: LDDA_I	ldda	[%r8, + 0x0720] %asi, %r4
	.word 0xca220009  ! 3459: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 3459: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc7f22009  ! 3459: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xde720009  ! 3462: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xce4a0009  ! 3462: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xa7a20929  ! 3462: FMULs	fmuls	%f8, %f9, %f19
	.word 0xcb220009  ! 3465: STF_R	st	%f5, [%r9, %r8]
	.word 0xc45a0009  ! 3465: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc4b21009  ! 3465: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xda720009  ! 3468: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xee020009  ! 3468: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xc01a2308  ! 3468: LDD_I	ldd	[%r8 + 0x0308], %r0
	.word 0xc62a0009  ! 3471: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xde520009  ! 3471: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xc4fa1009  ! 3471: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xc8320009  ! 3474: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xee420009  ! 3474: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xf49a1009  ! 3474: LDDA_R	ldda	[%r8, %r9] 0x80, %r26
	.word 0xeb3a0009  ! 3477: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc4120009  ! 3477: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x82d20009  ! 3477: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xce2a0009  ! 3480: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc7020009  ! 3480: LDF_R	ld	[%r8, %r9], %f3
	.word 0xcbe22009  ! 3480: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xc8320009  ! 3483: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe2120009  ! 3483: LDUH_R	lduh	[%r8 + %r9], %r17
	.word 0xc4aa2260  ! 3483: STBA_I	stba	%r2, [%r8 + 0x0260] %asi
	.word 0xce320009  ! 3486: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 3486: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x02c20001  ! 3486: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xca2a0009  ! 3489: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xfa0a0009  ! 3489: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0x886a0009  ! 3489: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xf3220009  ! 3492: STF_R	st	%f25, [%r9, %r8]
	.word 0xfc520009  ! 3492: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0xceaa1009  ! 3492: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 3495: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xca120009  ! 3495: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xfa6a0009  ! 3495: LDSTUB_R	ldstub	%r29, [%r8 + %r9]
	.word 0xc33a0009  ! 3498: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf64a0009  ! 3498: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xc6ca2288  ! 3498: LDSBA_I	ldsba	[%r8, + 0x0288] %asi, %r3
	.word 0xc4220009  ! 3501: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe8420009  ! 3501: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0x8143c000  ! 3501: STBAR	stbar
	.word 0xca320009  ! 3504: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf24a0009  ! 3504: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xccda2bc0  ! 3504: LDXA_I	ldxa	[%r8, + 0x0bc0] %asi, %r6
	.word 0xce720009  ! 3507: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc2520009  ! 3507: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcc4a2b58  ! 3507: LDSB_I	ldsb	[%r8 + 0x0b58], %r6
	.word 0xc2320009  ! 3510: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe81a0009  ! 3510: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x10800001  ! 3510: BA	ba  	<label_0x1>
	.word 0xc2320009  ! 3513: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xd84a0009  ! 3513: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0x06c20001  ! 3513: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xcc320009  ! 3516: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcd020009  ! 3516: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea24b4  ! 3516: PREFETCHA_I	prefetcha	[%r8, + 0x04b4] %asi, #one_read
	.word 0xce320009  ! 3519: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf8020009  ! 3519: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0x827a0009  ! 3519: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xce2a0009  ! 3522: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc4020009  ! 3522: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc0ba2578  ! 3522: STDA_I	stda	%r0, [%r8 + 0x0578] %asi
	.word 0xc6720009  ! 3525: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc8120009  ! 3525: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x844a0009  ! 3525: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xc5220009  ! 3528: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc020009  ! 3528: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143e018  ! 3528: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xe4320009  ! 3531: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xf0420009  ! 3531: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0x06800002  ! 3531: BL	bl  	<label_0x2>
	.word 0xc8720009  ! 3534: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xe2020009  ! 3534: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xc36a0009  ! 3534: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc6220009  ! 3537: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc6120009  ! 3537: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xe93a2f88  ! 3537: STDF_I	std	%f20, [0x0f88, %r8]
	.word 0xfc2a0009  ! 3540: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xd84a0009  ! 3540: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xc3f21009  ! 3540: CASXA_I	casxa	[%r8] 0x80, %r9, %r1
	.word 0xc8320009  ! 3543: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 3543: LDF_R	ld	[%r8, %r9], %f6
	.word 0x28800002  ! 3543: BLEU	bleu,a	<label_0x2>
	.word 0xcf3a0009  ! 3546: STDF_R	std	%f7, [%r9, %r8]
	.word 0xd41a0009  ! 3546: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xc4c21009  ! 3546: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xc6220009  ! 3549: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xce420009  ! 3549: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcf3a0009  ! 3549: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfb3a0009  ! 3552: STDF_R	std	%f29, [%r9, %r8]
	.word 0xce120009  ! 3552: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcde22009  ! 3552: CASA_R	casa	[%r8] %asi, %r9, %r6
	.word 0xee220009  ! 3555: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc41a0009  ! 3555: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3555: STBAR	stbar
	.word 0xe0320009  ! 3558: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xe2020009  ! 3558: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xc36a23c4  ! 3558: PREFETCH_I	prefetch	[%r8 + 0x03c4], #one_read
	.word 0xc4720009  ! 3561: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf0420009  ! 3561: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xaa722184  ! 3561: UDIV_I	udiv 	%r8, 0x0184, %r21
	.word 0xc3220009  ! 3564: STF_R	st	%f1, [%r9, %r8]
	.word 0xc85a0009  ! 3564: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 3564: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca2a0009  ! 3567: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc9020009  ! 3567: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc6aa2ed4  ! 3567: STBA_I	stba	%r3, [%r8 + 0x0ed4] %asi
	.word 0xec320009  ! 3570: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xca520009  ! 3570: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc8b21009  ! 3570: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xce320009  ! 3573: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc5020009  ! 3573: LDF_R	ld	[%r8, %r9], %f2
	.word 0x9da209a9  ! 3573: FDIVs	fdivs	%f8, %f9, %f14
	.word 0xde320009  ! 3576: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xf8520009  ! 3576: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0x8143e012  ! 3576: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xee320009  ! 3579: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc8420009  ! 3579: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8e5a2224  ! 3579: SMUL_I	smul 	%r8, 0x0224, %r7
	.word 0xc6720009  ! 3582: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc0a0009  ! 3582: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xcaaa2fd0  ! 3582: STBA_I	stba	%r5, [%r8 + 0x0fd0] %asi
	.word 0xce2a0009  ! 3585: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce020009  ! 3585: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8d6a285c  ! 3585: SDIVX_I	sdivx	%r8, 0x085c, %r6
	.word 0xc53a0009  ! 3588: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc4420009  ! 3588: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x2c800002  ! 3588: BNEG	bneg,a	<label_0x2>
	.word 0xc6220009  ! 3591: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xef020009  ! 3591: LDF_R	ld	[%r8, %r9], %f23
	.word 0x8143e061  ! 3591: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xc93a0009  ! 3594: STDF_R	std	%f4, [%r9, %r8]
	.word 0xd91a0009  ! 3594: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xc4b21009  ! 3594: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 3597: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe80a0009  ! 3597: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0x0e800001  ! 3597: BVS	bvs  	<label_0x1>
	.word 0xcb220009  ! 3600: STF_R	st	%f5, [%r9, %r8]
	.word 0xce5a0009  ! 3600: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea2df8  ! 3600: PREFETCHA_I	prefetcha	[%r8, + 0x0df8] %asi, #one_read
	.word 0xf8720009  ! 3603: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc65a0009  ! 3603: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xe5e21009  ! 3603: CASA_I	casa	[%r8] 0x80, %r9, %r18
	.word 0xfe320009  ! 3606: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xcf1a0009  ! 3606: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xc69226e8  ! 3606: LDUHA_I	lduha	[%r8, + 0x06e8] %asi, %r3
	.word 0xcc220009  ! 3609: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc4a0009  ! 3609: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xd6ca1009  ! 3609: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r11
	.word 0xc62a0009  ! 3612: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca120009  ! 3612: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xada20829  ! 3612: FADDs	fadds	%f8, %f9, %f22
	.word 0xc82a0009  ! 3615: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xed1a0009  ! 3615: LDDF_R	ldd	[%r8, %r9], %f22
	.word 0x8143c000  ! 3615: STBAR	stbar
	.word 0xed3a0009  ! 3618: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc8020009  ! 3618: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xfcba2590  ! 3618: STDA_I	stda	%r30, [%r8 + 0x0590] %asi
	.word 0xc3220009  ! 3621: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc120009  ! 3621: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143e06f  ! 3621: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xe93a0009  ! 3624: STDF_R	std	%f20, [%r9, %r8]
	.word 0xce020009  ! 3624: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc3ea287c  ! 3624: PREFETCHA_I	prefetcha	[%r8, + 0x087c] %asi, #one_read
	.word 0xce320009  ! 3627: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc64a0009  ! 3627: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc6da2698  ! 3627: LDXA_I	ldxa	[%r8, + 0x0698] %asi, %r3
	.word 0xf73a0009  ! 3630: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc45a0009  ! 3630: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc3ea292c  ! 3630: PREFETCHA_I	prefetcha	[%r8, + 0x092c] %asi, #one_read
	.word 0xc8320009  ! 3633: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf40a0009  ! 3633: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0x8fa20929  ! 3633: FMULs	fmuls	%f8, %f9, %f7
	.word 0xef220009  ! 3636: STF_R	st	%f23, [%r9, %r8]
	.word 0xcc4a0009  ! 3636: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc36a2860  ! 3636: PREFETCH_I	prefetch	[%r8 + 0x0860], #one_read
	.word 0xc4720009  ! 3639: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc31a0009  ! 3639: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x87222ca0  ! 3639: MULScc_I	mulscc 	%r8, 0x0ca0, %r3
	.word 0xf8720009  ! 3642: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc01a0009  ! 3642: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc51a2a20  ! 3642: LDDF_I	ldd	[%r8, 0x0a20], %f2
	.word 0xc2720009  ! 3645: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xec520009  ! 3645: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0x83a209a9  ! 3645: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xc5220009  ! 3648: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc4a0009  ! 3648: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x844a21cc  ! 3648: MULX_I	mulx 	%r8, 0x01cc, %r2
	.word 0xc33a0009  ! 3651: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc41a0009  ! 3651: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8da208a9  ! 3651: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xf3220009  ! 3654: STF_R	st	%f25, [%r9, %r8]
	.word 0xce520009  ! 3654: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc4ca23fc  ! 3654: LDSBA_I	ldsba	[%r8, + 0x03fc] %asi, %r2
	.word 0xc8220009  ! 3657: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc51a0009  ! 3657: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc6b21009  ! 3657: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xe4720009  ! 3660: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xcb1a0009  ! 3660: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc36a0009  ! 3660: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe2720009  ! 3663: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xe40a0009  ! 3663: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xcaf21009  ! 3663: STXA_R	stxa	%r5, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 3666: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc4520009  ! 3666: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc33a2778  ! 3666: STDF_I	std	%f1, [0x0778, %r8]
	.word 0xce220009  ! 3669: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xda120009  ! 3669: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xcc1a2070  ! 3669: LDD_I	ldd	[%r8 + 0x0070], %r6
	.word 0xc93a0009  ! 3672: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc6420009  ! 3672: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc3ea28a4  ! 3672: PREFETCHA_I	prefetcha	[%r8, + 0x08a4] %asi, #one_read
	.word 0xcd220009  ! 3675: STF_R	st	%f6, [%r9, %r8]
	.word 0xc31a0009  ! 3675: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xcaa22e7c  ! 3675: STWA_I	stwa	%r5, [%r8 + 0x0e7c] %asi
	.word 0xc62a0009  ! 3678: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xfc1a0009  ! 3678: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x8143c000  ! 3678: STBAR	stbar
	.word 0xc73a0009  ! 3681: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc64a0009  ! 3681: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcada1009  ! 3681: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xfa320009  ! 3684: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xce4a0009  ! 3684: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcac22bc8  ! 3684: LDSWA_I	ldswa	[%r8, + 0x0bc8] %asi, %r5
	.word 0xcf220009  ! 3687: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc420009  ! 3687: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc47a0009  ! 3687: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xe1220009  ! 3690: STF_R	st	%f16, [%r9, %r8]
	.word 0xe41a0009  ! 3690: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xfeca2374  ! 3690: LDSBA_I	ldsba	[%r8, + 0x0374] %asi, %r31
	.word 0xc62a0009  ! 3693: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc2120009  ! 3693: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc87a0009  ! 3693: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xc7220009  ! 3696: STF_R	st	%f3, [%r9, %r8]
	.word 0xfa5a0009  ! 3696: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xc36a0009  ! 3696: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc4320009  ! 3699: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xfc1a0009  ! 3699: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc2da1009  ! 3699: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xd73a0009  ! 3702: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc51a0009  ! 3702: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc3ea22a0  ! 3702: PREFETCHA_I	prefetcha	[%r8, + 0x02a0] %asi, #one_read
	.word 0xcd220009  ! 3705: STF_R	st	%f6, [%r9, %r8]
	.word 0xce520009  ! 3705: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcc8a2e5c  ! 3705: LDUBA_I	lduba	[%r8, + 0x0e5c] %asi, %r6
	.word 0xce320009  ! 3708: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc420009  ! 3708: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcc822f64  ! 3708: LDUWA_I	lduwa	[%r8, + 0x0f64] %asi, %r6
	.word 0xc8720009  ! 3711: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xec020009  ! 3711: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xcca21009  ! 3711: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 3714: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc4120009  ! 3714: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xe4ba2ba8  ! 3714: STDA_I	stda	%r18, [%r8 + 0x0ba8] %asi
	.word 0xce320009  ! 3717: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca0a0009  ! 3717: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xb7a20929  ! 3717: FMULs	fmuls	%f8, %f9, %f27
	.word 0xca220009  ! 3720: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca520009  ! 3720: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc28a2b00  ! 3720: LDUBA_I	lduba	[%r8, + 0x0b00] %asi, %r1
	.word 0xc4220009  ! 3723: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc0a0009  ! 3723: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xaba208a9  ! 3723: FSUBs	fsubs	%f8, %f9, %f21
	.word 0xc7220009  ! 3726: STF_R	st	%f3, [%r9, %r8]
	.word 0xe51a0009  ! 3726: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0x856a0009  ! 3726: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xcf220009  ! 3729: STF_R	st	%f7, [%r9, %r8]
	.word 0xf2520009  ! 3729: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xc36a20b4  ! 3729: PREFETCH_I	prefetch	[%r8 + 0x00b4], #one_read
	.word 0xf6220009  ! 3732: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xcc1a0009  ! 3732: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xe6020009  ! 3732: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xd93a0009  ! 3735: STDF_R	std	%f12, [%r9, %r8]
	.word 0xee020009  ! 3735: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xc36a0009  ! 3735: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe2720009  ! 3738: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xec4a0009  ! 3738: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x30800001  ! 3738: BA	ba,a	<label_0x1>
	.word 0xc3220009  ! 3741: STF_R	st	%f1, [%r9, %r8]
	.word 0xc64a0009  ! 3741: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc0ba2820  ! 3741: STDA_I	stda	%r0, [%r8 + 0x0820] %asi
	.word 0xfb3a0009  ! 3744: STDF_R	std	%f29, [%r9, %r8]
	.word 0xf8520009  ! 3744: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xc2da1009  ! 3744: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc8220009  ! 3747: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8420009  ! 3747: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcd222f48  ! 3747: STF_I	st	%f6, [0x0f48, %r8]
	.word 0xcc2a0009  ! 3750: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf24a0009  ! 3750: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xcaa2231c  ! 3750: STWA_I	stwa	%r5, [%r8 + 0x031c] %asi
	.word 0xc9220009  ! 3753: STF_R	st	%f4, [%r9, %r8]
	.word 0xc20a0009  ! 3753: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc4922134  ! 3753: LDUHA_I	lduha	[%r8, + 0x0134] %asi, %r2
	.word 0xcd220009  ! 3756: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6020009  ! 3756: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xb0d20009  ! 3756: UMULcc_R	umulcc 	%r8, %r9, %r24
	.word 0xe0220009  ! 3759: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc25a0009  ! 3759: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xda020009  ! 3759: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xcf3a0009  ! 3762: STDF_R	std	%f7, [%r9, %r8]
	.word 0xdc520009  ! 3762: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x8e522768  ! 3762: UMUL_I	umul 	%r8, 0x0768, %r7
	.word 0xc2320009  ! 3765: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 3765: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc8da27a8  ! 3765: LDXA_I	ldxa	[%r8, + 0x07a8] %asi, %r4
	.word 0xdd220009  ! 3768: STF_R	st	%f14, [%r9, %r8]
	.word 0xce520009  ! 3768: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc36a26f0  ! 3768: PREFETCH_I	prefetch	[%r8 + 0x06f0], #one_read
	.word 0xfb3a0009  ! 3771: STDF_R	std	%f29, [%r9, %r8]
	.word 0xcf020009  ! 3771: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143e005  ! 3771: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0xf13a0009  ! 3774: STDF_R	std	%f24, [%r9, %r8]
	.word 0xc81a0009  ! 3774: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x3e800001  ! 3774: BVC	bvc,a	<label_0x1>
	.word 0xca220009  ! 3777: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc65a0009  ! 3777: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc36a2a8c  ! 3777: PREFETCH_I	prefetch	[%r8 + 0x0a8c], #one_read
	.word 0xea320009  ! 3780: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc8120009  ! 3780: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8a720009  ! 3780: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xf2320009  ! 3783: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xe65a0009  ! 3783: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x26c20001  ! 3783: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xf4720009  ! 3786: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xc45a0009  ! 3786: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc89a21b0  ! 3786: LDDA_I	ldda	[%r8, + 0x01b0] %asi, %r4
	.word 0xca320009  ! 3789: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfc4a0009  ! 3789: LDSB_R	ldsb	[%r8 + %r9], %r30
	.word 0xc33a27c0  ! 3789: STDF_I	std	%f1, [0x07c0, %r8]
	.word 0xf93a0009  ! 3792: STDF_R	std	%f28, [%r9, %r8]
	.word 0xc6520009  ! 3792: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xf0ca1009  ! 3792: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r24
	.word 0xc8720009  ! 3795: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8020009  ! 3795: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc3ea2bb8  ! 3795: PREFETCHA_I	prefetcha	[%r8, + 0x0bb8] %asi, #one_read
	.word 0xc4320009  ! 3798: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce420009  ! 3798: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xceaa1009  ! 3798: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xcd3a0009  ! 3801: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe20a0009  ! 3801: LDUB_R	ldub	[%r8 + %r9], %r17
	.word 0x8143e04d  ! 3801: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xce320009  ! 3804: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce520009  ! 3804: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xcca22aa0  ! 3804: STWA_I	stwa	%r6, [%r8 + 0x0aa0] %asi
	.word 0xf8220009  ! 3807: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xd8020009  ! 3807: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xc4aa1009  ! 3807: STBA_R	stba	%r2, [%r8 + %r9] 0x80
	.word 0xca320009  ! 3810: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca0a0009  ! 3810: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xfcea1009  ! 3810: LDSTUBA_R	ldstuba	%r30, [%r8 + %r9] 0x80
	.word 0xd7220009  ! 3813: STF_R	st	%f11, [%r9, %r8]
	.word 0xcc520009  ! 3813: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xccda1009  ! 3813: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xf1220009  ! 3816: STF_R	st	%f24, [%r9, %r8]
	.word 0xc7020009  ! 3816: LDF_R	ld	[%r8, %r9], %f3
	.word 0xb36a2f44  ! 3816: SDIVX_I	sdivx	%r8, 0x0f44, %r25
	.word 0xdc320009  ! 3819: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc4420009  ! 3819: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xfdf22009  ! 3819: CASXA_R	casxa	[%r8]%asi, %r9, %r30
	.word 0xcd3a0009  ! 3822: STDF_R	std	%f6, [%r9, %r8]
	.word 0xde520009  ! 3822: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x86520009  ! 3822: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xe02a0009  ! 3825: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc01a0009  ! 3825: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8ba209a9  ! 3825: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xca2a0009  ! 3828: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xea420009  ! 3828: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xc8f21009  ! 3828: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 3831: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc6520009  ! 3831: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8143c000  ! 3831: STBAR	stbar
	.word 0xc4220009  ! 3834: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf4420009  ! 3834: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0x3a800001  ! 3834: BCC	bcc,a	<label_0x1>
	.word 0xcc320009  ! 3837: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe8520009  ! 3837: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x26c20001  ! 3837: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc7220009  ! 3840: STF_R	st	%f3, [%r9, %r8]
	.word 0xf2120009  ! 3840: LDUH_R	lduh	[%r8 + %r9], %r25
	.word 0x83a20929  ! 3840: FMULs	fmuls	%f8, %f9, %f1
	.word 0xd8720009  ! 3843: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xc31a0009  ! 3843: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x885a2ffc  ! 3843: SMUL_I	smul 	%r8, 0x0ffc, %r4
	.word 0xc7220009  ! 3846: STF_R	st	%f3, [%r9, %r8]
	.word 0xc6120009  ! 3846: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xf53a2438  ! 3846: STDF_I	std	%f26, [0x0438, %r8]
	.word 0xce320009  ! 3849: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xfc1a0009  ! 3849: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xc40a0009  ! 3849: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc9220009  ! 3852: STF_R	st	%f4, [%r9, %r8]
	.word 0xcb020009  ! 3852: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc3ea1009  ! 3852: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xde2a0009  ! 3855: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xcc5a0009  ! 3855: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x89220009  ! 3855: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xff220009  ! 3858: STF_R	st	%f31, [%r9, %r8]
	.word 0xc44a0009  ! 3858: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xcab21009  ! 3858: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 3861: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce020009  ! 3861: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc482238c  ! 3861: LDUWA_I	lduwa	[%r8, + 0x038c] %asi, %r2
	.word 0xf2720009  ! 3864: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc2020009  ! 3864: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x86720009  ! 3864: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0xc4220009  ! 3867: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 3867: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xf2da1009  ! 3867: LDXA_R	ldxa	[%r8, %r9] 0x80, %r25
	.word 0xf42a0009  ! 3870: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xcd1a0009  ! 3870: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc8ba2f48  ! 3870: STDA_I	stda	%r4, [%r8 + 0x0f48] %asi
	.word 0xd6720009  ! 3873: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc6520009  ! 3873: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x0cc20001  ! 3873: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xfe320009  ! 3876: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xca420009  ! 3876: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xccf21009  ! 3876: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xfe320009  ! 3879: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xfc420009  ! 3879: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x8eda0009  ! 3879: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xce220009  ! 3882: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd7020009  ! 3882: LDF_R	ld	[%r8, %r9], %f11
	.word 0xa67a26f0  ! 3882: SDIV_I	sdiv 	%r8, 0x06f0, %r19
	.word 0xc6220009  ! 3885: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 3885: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xcff22009  ! 3885: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xc8220009  ! 3888: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc20a0009  ! 3888: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143e061  ! 3888: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xdc320009  ! 3891: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xcc4a0009  ! 3891: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc81a0009  ! 3891: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc73a0009  ! 3894: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc65a0009  ! 3894: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc9e22009  ! 3894: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xce2a0009  ! 3897: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe0420009  ! 3897: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xf64a2bfc  ! 3897: LDSB_I	ldsb	[%r8 + 0x0bfc], %r27
	.word 0xc5220009  ! 3900: STF_R	st	%f2, [%r9, %r8]
	.word 0xc81a0009  ! 3900: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc6f21009  ! 3900: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xca320009  ! 3903: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf0520009  ! 3903: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x8143e02f  ! 3903: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xc6720009  ! 3906: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca420009  ! 3906: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3906: STBAR	stbar
	.word 0xc6220009  ! 3909: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xee0a0009  ! 3909: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xb0520009  ! 3909: UMUL_R	umul 	%r8, %r9, %r24
	.word 0xe6720009  ! 3912: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xcc1a0009  ! 3912: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc8fa1009  ! 3912: SWAPA_R	swapa	%r4, [%r8 + %r9] 0x80
	.word 0xe8320009  ! 3915: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xcc120009  ! 3915: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xceea1009  ! 3915: LDSTUBA_R	ldstuba	%r7, [%r8 + %r9] 0x80
	.word 0xe5220009  ! 3918: STF_R	st	%f18, [%r9, %r8]
	.word 0xc9020009  ! 3918: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc8aa2ff8  ! 3918: STBA_I	stba	%r4, [%r8 + 0x0ff8] %asi
	.word 0xc4320009  ! 3921: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xee120009  ! 3921: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0xecb227e8  ! 3921: STHA_I	stha	%r22, [%r8 + 0x07e8] %asi
	.word 0xcc320009  ! 3924: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf51a0009  ! 3924: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xca6a2204  ! 3924: LDSTUB_I	ldstub	%r5, [%r8 + 0x0204]
	.word 0xf0720009  ! 3927: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xde0a0009  ! 3927: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xa06a0009  ! 3927: UDIVX_R	udivx 	%r8, %r9, %r16
	.word 0xde2a0009  ! 3930: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc60a0009  ! 3930: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8da20829  ! 3930: FADDs	fadds	%f8, %f9, %f6
	.word 0xcc320009  ! 3933: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce0a0009  ! 3933: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc3ea2278  ! 3933: PREFETCHA_I	prefetcha	[%r8, + 0x0278] %asi, #one_read
	.word 0xca2a0009  ! 3936: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcb020009  ! 3936: LDF_R	ld	[%r8, %r9], %f5
	.word 0xca8a2e48  ! 3936: LDUBA_I	lduba	[%r8, + 0x0e48] %asi, %r5
	.word 0xe7220009  ! 3939: STF_R	st	%f19, [%r9, %r8]
	.word 0xc6120009  ! 3939: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8ed22838  ! 3939: UMULcc_I	umulcc 	%r8, 0x0838, %r7
	.word 0xc6220009  ! 3942: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcd020009  ! 3942: LDF_R	ld	[%r8, %r9], %f6
	.word 0xd6520009  ! 3942: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xc42a0009  ! 3945: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf91a0009  ! 3945: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x26ca0001  ! 3945: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xd7220009  ! 3948: STF_R	st	%f11, [%r9, %r8]
	.word 0xcb1a0009  ! 3948: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x9d220009  ! 3948: MULScc_R	mulscc 	%r8, %r9, %r14
	.word 0xc93a0009  ! 3951: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcc120009  ! 3951: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcc4a294c  ! 3951: LDSB_I	ldsb	[%r8 + 0x094c], %r6
	.word 0xcc220009  ! 3954: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe8520009  ! 3954: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x8a720009  ! 3954: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xca720009  ! 3957: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc5a0009  ! 3957: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xe88a282c  ! 3957: LDUBA_I	lduba	[%r8, + 0x082c] %asi, %r20
	.word 0xf4220009  ! 3960: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc65a0009  ! 3960: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143e01e  ! 3960: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc2720009  ! 3963: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc2020009  ! 3963: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc6b21009  ! 3963: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 3966: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xde520009  ! 3966: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x87220009  ! 3966: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xdc2a0009  ! 3969: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xe01a0009  ! 3969: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x86f20009  ! 3969: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xce720009  ! 3972: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xce020009  ! 3972: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x89220009  ! 3972: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xd6320009  ! 3975: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xda4a0009  ! 3975: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0xc2b21009  ! 3975: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 3978: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc8420009  ! 3978: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8da208a9  ! 3978: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xec720009  ! 3981: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc4420009  ! 3981: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x06c20001  ! 3981: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc22a0009  ! 3984: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc420009  ! 3984: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc89a2580  ! 3984: LDDA_I	ldda	[%r8, + 0x0580] %asi, %r4
	.word 0xcc220009  ! 3987: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 3987: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xfca22584  ! 3987: STWA_I	stwa	%r30, [%r8 + 0x0584] %asi
	.word 0xcc220009  ! 3990: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc8520009  ! 3990: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xce520009  ! 3990: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc53a0009  ! 3993: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc41a0009  ! 3993: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8fa20929  ! 3993: FMULs	fmuls	%f8, %f9, %f7
	.word 0xce720009  ! 3996: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xee0a0009  ! 3996: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xa0da0009  ! 3996: SMULcc_R	smulcc 	%r8, %r9, %r16
	.word 0xf4720009  ! 3999: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xcc420009  ! 3999: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc3ea2484  ! 3999: PREFETCHA_I	prefetcha	[%r8, + 0x0484] %asi, #one_read
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000190, %g1, %r9
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
        setx  0x115b0098157ff7fe, %g1, %r0
        setx  0xc8b07de733822de4, %g1, %r1
        setx  0x2327dc83b2b026b2, %g1, %r2
        setx  0xd098c1b50de6cab8, %g1, %r3
        setx  0x5dab43227c79a0fa, %g1, %r4
        setx  0x4f2459fd98ed83ef, %g1, %r5
        setx  0x4eb68f61d0776678, %g1, %r6
        setx  0x8fc0903a86db2199, %g1, %r7
        setx  0x9b77c7fbe0e7a76f, %g1, %r10
        setx  0x48cb7016644f44f1, %g1, %r11
        setx  0x3bd862634611a50d, %g1, %r12
        setx  0xa0e5dc3cc8f0d4c3, %g1, %r13
        setx  0x9754f46fc7434946, %g1, %r14
        setx  0x4960b36c6c425cd1, %g1, %r15
        setx  0x76fdef084afce78d, %g1, %r16
        setx  0x7023583c9f876a0e, %g1, %r17
        setx  0x5d597816fb0b54e6, %g1, %r18
        setx  0x11d461644c6a8a44, %g1, %r19
        setx  0xcabea804502c7bd2, %g1, %r20
        setx  0x5d454e4437951a79, %g1, %r21
        setx  0xcae97248c8f64719, %g1, %r22
        setx  0xc42c6218caa3647e, %g1, %r23
        setx  0x1a29cf3e3a349577, %g1, %r24
        setx  0xa7eabde8e9d5f36c, %g1, %r25
        setx  0x135af54cb25e018c, %g1, %r26
        setx  0x56c4f3f50fc7d7c5, %g1, %r27
        setx  0xd6d409440e34b484, %g1, %r28
        setx  0xe30c241e0b14ce32, %g1, %r29
        setx  0x494cea00c93f140e, %g1, %r30
        setx  0x85bc61f4c1c4373f, %g1, %r31
	.word 0xea720009  ! 3: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xcc4a0009  ! 3: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x2eca0001  ! 3: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xe0320009  ! 6: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc20a0009  ! 6: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143c000  ! 6: STBAR	stbar
	.word 0xcf3a0009  ! 9: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcb020009  ! 9: LDF_R	ld	[%r8, %r9], %f5
	.word 0x2a800001  ! 9: BCS	bcs,a	<label_0x1>
	.word 0xc6320009  ! 12: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xfa4a0009  ! 12: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xa45a2100  ! 12: SMUL_I	smul 	%r8, 0x0100, %r18
	.word 0xc4720009  ! 15: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcb020009  ! 15: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc3ea2534  ! 15: PREFETCHA_I	prefetcha	[%r8, + 0x0534] %asi, #one_read
	.word 0xc2220009  ! 18: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca420009  ! 18: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x0a800002  ! 18: BCS	bcs  	<label_0x2>
	.word 0xc73a0009  ! 21: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce5a0009  ! 21: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 21: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce220009  ! 24: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc91a0009  ! 24: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x26800001  ! 24: BL	bl,a	<label_0x1>
	.word 0xce2a0009  ! 27: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 27: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc65a2f78  ! 27: LDX_I	ldx	[%r8 + 0x0f78], %r3
	.word 0xfb3a0009  ! 30: STDF_R	std	%f29, [%r9, %r8]
	.word 0xca4a0009  ! 30: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x87a20829  ! 30: FADDs	fadds	%f8, %f9, %f3
	.word 0xd93a0009  ! 33: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc41a0009  ! 33: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xceca1009  ! 33: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xee720009  ! 36: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xc65a0009  ! 36: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xcaaa1009  ! 36: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xcb3a0009  ! 39: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf4520009  ! 39: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xc3ea2bb8  ! 39: PREFETCHA_I	prefetcha	[%r8, + 0x0bb8] %asi, #one_read
	.word 0xc73a0009  ! 42: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe3020009  ! 42: LDF_R	ld	[%r8, %r9], %f17
	.word 0x8143e032  ! 42: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xc4320009  ! 45: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf44a0009  ! 45: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xc36a2f9c  ! 45: PREFETCH_I	prefetch	[%r8 + 0x0f9c], #one_read
	.word 0xd93a0009  ! 48: STDF_R	std	%f12, [%r9, %r8]
	.word 0xfa5a0009  ! 48: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xbf6a0009  ! 48: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0xc53a0009  ! 51: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca020009  ! 51: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xb0520009  ! 51: UMUL_R	umul 	%r8, %r9, %r24
	.word 0xf4720009  ! 54: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xf81a0009  ! 54: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc3ea1009  ! 54: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc93a0009  ! 57: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce520009  ! 57: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8fa20929  ! 57: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc7220009  ! 60: STF_R	st	%f3, [%r9, %r8]
	.word 0xec1a0009  ! 60: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x8afa0009  ! 60: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xf2320009  ! 63: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xe5020009  ! 63: LDF_R	ld	[%r8, %r9], %f18
	.word 0xc3ea2aa8  ! 63: PREFETCHA_I	prefetcha	[%r8, + 0x0aa8] %asi, #one_read
	.word 0xc22a0009  ! 66: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc20a0009  ! 66: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xccda2180  ! 66: LDXA_I	ldxa	[%r8, + 0x0180] %asi, %r6
	.word 0xc4220009  ! 69: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 69: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x8143c000  ! 69: STBAR	stbar
	.word 0xce320009  ! 72: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xec1a0009  ! 72: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x26800002  ! 72: BL	bl,a	<label_0x2>
	.word 0xda320009  ! 75: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xf85a0009  ! 75: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0x83220009  ! 75: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xc42a0009  ! 78: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce0a0009  ! 78: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc2422964  ! 78: LDSW_I	ldsw	[%r8 + 0x0964], %r1
	.word 0xc4220009  ! 81: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 81: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x8143c000  ! 81: STBAR	stbar
	.word 0xc8720009  ! 84: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc6120009  ! 84: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcb3a2330  ! 84: STDF_I	std	%f5, [0x0330, %r8]
	.word 0xcb220009  ! 87: STF_R	st	%f5, [%r9, %r8]
	.word 0xcb020009  ! 87: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143e02c  ! 87: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xcc320009  ! 90: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce120009  ! 90: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xd7e21009  ! 90: CASA_I	casa	[%r8] 0x80, %r9, %r11
	.word 0xc42a0009  ! 93: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 93: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xec420009  ! 93: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xca320009  ! 96: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfb020009  ! 96: LDF_R	ld	[%r8, %r9], %f29
	.word 0xdeaa1009  ! 96: STBA_R	stba	%r15, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 99: STF_R	st	%f6, [%r9, %r8]
	.word 0xc60a0009  ! 99: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x0cc20001  ! 99: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xc82a0009  ! 102: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xd71a0009  ! 102: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xc6f21009  ! 102: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xf2220009  ! 105: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xf4120009  ! 105: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0x83a208a9  ! 105: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xce2a0009  ! 108: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc51a0009  ! 108: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc0ba1009  ! 108: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xda320009  ! 111: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xfc5a0009  ! 111: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xe8da1009  ! 111: LDXA_R	ldxa	[%r8, %r9] 0x80, %r20
	.word 0xc2220009  ! 114: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc60a0009  ! 114: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc36a2ac0  ! 114: PREFETCH_I	prefetch	[%r8 + 0x0ac0], #one_read
	.word 0xcb220009  ! 117: STF_R	st	%f5, [%r9, %r8]
	.word 0xe5020009  ! 117: LDF_R	ld	[%r8, %r9], %f18
	.word 0xc6ca1009  ! 117: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xce720009  ! 120: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 120: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xcc020009  ! 120: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xf7220009  ! 123: STF_R	st	%f27, [%r9, %r8]
	.word 0xe81a0009  ! 123: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x8143c000  ! 123: STBAR	stbar
	.word 0xc4320009  ! 126: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc120009  ! 126: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcada2d78  ! 126: LDXA_I	ldxa	[%r8, + 0x0d78] %asi, %r5
	.word 0xc6220009  ! 129: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe41a0009  ! 129: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x9ada2544  ! 129: SMULcc_I	smulcc 	%r8, 0x0544, %r13
	.word 0xc6320009  ! 132: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe40a0009  ! 132: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x8143e047  ! 132: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xcb220009  ! 135: STF_R	st	%f5, [%r9, %r8]
	.word 0xce120009  ! 135: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xcc522838  ! 135: LDSH_I	ldsh	[%r8 + 0x0838], %r6
	.word 0xe73a0009  ! 138: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc01a0009  ! 138: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc3ea2454  ! 138: PREFETCHA_I	prefetcha	[%r8, + 0x0454] %asi, #one_read
	.word 0xca720009  ! 141: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xfb020009  ! 141: LDF_R	ld	[%r8, %r9], %f29
	.word 0x0e800001  ! 141: BVS	bvs  	<label_0x1>
	.word 0xc2220009  ! 144: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc3020009  ! 144: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcafa1009  ! 144: SWAPA_R	swapa	%r5, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 147: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf81a0009  ! 147: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x8c6a2244  ! 147: UDIVX_I	udivx 	%r8, 0x0244, %r6
	.word 0xf73a0009  ! 150: STDF_R	std	%f27, [%r9, %r8]
	.word 0xec4a0009  ! 150: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x8143e075  ! 150: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc73a0009  ! 153: STDF_R	std	%f3, [%r9, %r8]
	.word 0xec420009  ! 153: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x8143e03c  ! 153: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc93a0009  ! 156: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce520009  ! 156: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 156: STBAR	stbar
	.word 0xf1220009  ! 159: STF_R	st	%f24, [%r9, %r8]
	.word 0xcb1a0009  ! 159: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xde5a0009  ! 159: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xf8320009  ! 162: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc8520009  ! 162: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xcfe21009  ! 162: CASA_I	casa	[%r8] 0x80, %r9, %r7
	.word 0xee320009  ! 165: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc4020009  ! 165: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc6da2648  ! 165: LDXA_I	ldxa	[%r8, + 0x0648] %asi, %r3
	.word 0xcb220009  ! 168: STF_R	st	%f5, [%r9, %r8]
	.word 0xc7020009  ! 168: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143c000  ! 168: STBAR	stbar
	.word 0xf02a0009  ! 171: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc81a0009  ! 171: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xf2c21009  ! 171: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r25
	.word 0xcf220009  ! 174: STF_R	st	%f7, [%r9, %r8]
	.word 0xc45a0009  ! 174: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x08800002  ! 174: BLEU	bleu  	<label_0x2>
	.word 0xce720009  ! 177: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe7020009  ! 177: LDF_R	ld	[%r8, %r9], %f19
	.word 0xc91a0009  ! 177: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc2320009  ! 180: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 180: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8d22233c  ! 180: MULScc_I	mulscc 	%r8, 0x033c, %r6
	.word 0xe2320009  ! 183: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xca120009  ! 183: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xce520009  ! 183: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xce720009  ! 186: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcf1a0009  ! 186: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8da208a9  ! 186: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xde2a0009  ! 189: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xc4520009  ! 189: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143c000  ! 189: STBAR	stbar
	.word 0xe4320009  ! 192: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xcb020009  ! 192: LDF_R	ld	[%r8, %r9], %f5
	.word 0xce7a0009  ! 192: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xf2220009  ! 195: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xc8120009  ! 195: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x02800002  ! 195: BE	be  	<label_0x2>
	.word 0xc2320009  ! 198: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 198: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xcc7a0009  ! 198: SWAP_R	swap	%r6, [%r8 + %r9]
	.word 0xc6320009  ! 201: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 201: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xb4da0009  ! 201: SMULcc_R	smulcc 	%r8, %r9, %r26
	.word 0xcc320009  ! 204: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc2520009  ! 204: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x26c20001  ! 204: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc5220009  ! 207: STF_R	st	%f2, [%r9, %r8]
	.word 0xe8120009  ! 207: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0x10800002  ! 207: BA	ba  	<label_0x2>
	.word 0xc8220009  ! 210: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xdd1a0009  ! 210: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xcca21009  ! 210: STWA_R	stwa	%r6, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 213: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca420009  ! 213: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 213: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4220009  ! 216: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc0a0009  ! 216: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8c7a0009  ! 216: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xc2320009  ! 219: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf91a0009  ! 219: LDDF_R	ldd	[%r8, %r9], %f28
	.word 0x8143c000  ! 219: STBAR	stbar
	.word 0xfd220009  ! 222: STF_R	st	%f30, [%r9, %r8]
	.word 0xc25a0009  ! 222: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xcf020009  ! 222: LDF_R	ld	[%r8, %r9], %f7
	.word 0xca720009  ! 225: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc8020009  ! 225: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x82722a2c  ! 225: UDIV_I	udiv 	%r8, 0x0a2c, %r1
	.word 0xe93a0009  ! 228: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc65a0009  ! 228: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc53a2518  ! 228: STDF_I	std	%f2, [0x0518, %r8]
	.word 0xd6220009  ! 231: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xe40a0009  ! 231: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x856a0009  ! 231: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xf6320009  ! 234: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xe85a0009  ! 234: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xc8822a54  ! 234: LDUWA_I	lduwa	[%r8, + 0x0a54] %asi, %r4
	.word 0xc42a0009  ! 237: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 237: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8143e051  ! 237: MEMBAR	membar	#LoadLoad | #Lookaside | #Sync 
	.word 0xda220009  ! 240: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xcc4a0009  ! 240: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc3ea2124  ! 240: PREFETCHA_I	prefetcha	[%r8, + 0x0124] %asi, #one_read
	.word 0xf62a0009  ! 243: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc45a0009  ! 243: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc3ea2ed4  ! 243: PREFETCHA_I	prefetcha	[%r8, + 0x0ed4] %asi, #one_read
	.word 0xe0320009  ! 246: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xf8020009  ! 246: LDUW_R	lduw	[%r8 + %r9], %r28
	.word 0xc64a2790  ! 246: LDSB_I	ldsb	[%r8 + 0x0790], %r3
	.word 0xd62a0009  ! 249: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xca0a0009  ! 249: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x83222900  ! 249: MULScc_I	mulscc 	%r8, 0x0900, %r1
	.word 0xc2720009  ! 252: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 252: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8ba20829  ! 252: FADDs	fadds	%f8, %f9, %f5
	.word 0xc42a0009  ! 255: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce4a0009  ! 255: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143e068  ! 255: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xcc720009  ! 258: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf24a0009  ! 258: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xc20a0009  ! 258: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc93a0009  ! 261: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc4520009  ! 261: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xd80a2fd4  ! 261: LDUB_I	ldub	[%r8 + 0x0fd4], %r12
	.word 0xf2320009  ! 264: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xec5a0009  ! 264: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0xfe822668  ! 264: LDUWA_I	lduwa	[%r8, + 0x0668] %asi, %r31
	.word 0xf8720009  ! 267: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xf80a0009  ! 267: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x8e5a23cc  ! 267: SMUL_I	smul 	%r8, 0x03cc, %r7
	.word 0xc8320009  ! 270: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc3020009  ! 270: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc4ea1009  ! 270: LDSTUBA_R	ldstuba	%r2, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 273: STF_R	st	%f2, [%r9, %r8]
	.word 0xc41a0009  ! 273: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 273: STBAR	stbar
	.word 0xc4220009  ! 276: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xd9020009  ! 276: LDF_R	ld	[%r8, %r9], %f12
	.word 0xceaa260c  ! 276: STBA_I	stba	%r7, [%r8 + 0x060c] %asi
	.word 0xcd3a0009  ! 279: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc1a0009  ! 279: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 279: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xda320009  ! 282: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xde420009  ! 282: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0x2aca0001  ! 282: BRNZ	brnz,a,pt	%8,<label_0xa0001>
	.word 0xc82a0009  ! 285: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 285: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8c7a0009  ! 285: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xca320009  ! 288: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc0a0009  ! 288: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xccfa2428  ! 288: SWAPA_I	swapa	%r6, [%r8 + 0x0428] %asi
	.word 0xe73a0009  ! 291: STDF_R	std	%f19, [%r9, %r8]
	.word 0xff020009  ! 291: LDF_R	ld	[%r8, %r9], %f31
	.word 0xc5220009  ! 291: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6720009  ! 294: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc6020009  ! 294: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8c520009  ! 294: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc33a0009  ! 297: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfc520009  ! 297: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x0a800001  ! 297: BCS	bcs  	<label_0x1>
	.word 0xc7220009  ! 300: STF_R	st	%f3, [%r9, %r8]
	.word 0xfa420009  ! 300: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xee0a0009  ! 300: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0xc42a0009  ! 303: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc8520009  ! 303: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8efa2460  ! 303: SDIVcc_I	sdivcc 	%r8, 0x0460, %r7
	.word 0xc4220009  ! 306: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xec520009  ! 306: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0x8ada0009  ! 306: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xcc220009  ! 309: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xdd1a0009  ! 309: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xccf21009  ! 309: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 312: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcd1a0009  ! 312: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xcc9a1009  ! 312: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xcc2a0009  ! 315: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf71a0009  ! 315: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xcff21009  ! 315: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xd8320009  ! 318: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xcc0a0009  ! 318: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xca7a0009  ! 318: SWAP_R	swap	%r5, [%r8 + %r9]
	.word 0xce320009  ! 321: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcd1a0009  ! 321: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x8ad22ef0  ! 321: UMULcc_I	umulcc 	%r8, 0x0ef0, %r5
	.word 0xcd3a0009  ! 324: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe81a0009  ! 324: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x88f20009  ! 324: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xca220009  ! 327: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc420009  ! 327: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xcc9a2cc0  ! 327: LDDA_I	ldda	[%r8, + 0x0cc0] %asi, %r6
	.word 0xcb3a0009  ! 330: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce0a0009  ! 330: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xa5a209a9  ! 330: FDIVs	fdivs	%f8, %f9, %f18
	.word 0xc62a0009  ! 333: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf2020009  ! 333: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xc2ca1009  ! 333: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xc4320009  ! 336: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xca520009  ! 336: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x836a2aa0  ! 336: SDIVX_I	sdivx	%r8, 0x0aa0, %r1
	.word 0xc33a0009  ! 339: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce520009  ! 339: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8da209a9  ! 339: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc33a0009  ! 342: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc81a0009  ! 342: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x06ca0001  ! 342: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xed220009  ! 345: STF_R	st	%f22, [%r9, %r8]
	.word 0xc6520009  ! 345: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xe84a2970  ! 345: LDSB_I	ldsb	[%r8 + 0x0970], %r20
	.word 0xfd220009  ! 348: STF_R	st	%f30, [%r9, %r8]
	.word 0xc01a0009  ! 348: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8143c000  ! 348: STBAR	stbar
	.word 0xcb220009  ! 351: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc420009  ! 351: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8e4a21c8  ! 351: MULX_I	mulx 	%r8, 0x01c8, %r7
	.word 0xf8220009  ! 354: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xfe4a0009  ! 354: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xc3ea2a38  ! 354: PREFETCHA_I	prefetcha	[%r8, + 0x0a38] %asi, #one_read
	.word 0xe1220009  ! 357: STF_R	st	%f16, [%r9, %r8]
	.word 0xce520009  ! 357: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8a4a0009  ! 357: MULX_R	mulx 	%r8, %r9, %r5
	.word 0xcd220009  ! 360: STF_R	st	%f6, [%r9, %r8]
	.word 0xc51a0009  ! 360: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xfa821009  ! 360: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r29
	.word 0xc22a0009  ! 363: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xce520009  ! 363: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc4ba2c58  ! 363: STDA_I	stda	%r2, [%r8 + 0x0c58] %asi
	.word 0xc3220009  ! 366: STF_R	st	%f1, [%r9, %r8]
	.word 0xef020009  ! 366: LDF_R	ld	[%r8, %r9], %f23
	.word 0x0c800001  ! 366: BNEG	bneg  	<label_0x1>
	.word 0xcb220009  ! 369: STF_R	st	%f5, [%r9, %r8]
	.word 0xf31a0009  ! 369: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x16800002  ! 369: BGE	bge  	<label_0x2>
	.word 0xc62a0009  ! 372: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc44a0009  ! 372: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc36a227c  ! 372: PREFETCH_I	prefetch	[%r8 + 0x027c], #one_read
	.word 0xde2a0009  ! 375: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xcf020009  ! 375: LDF_R	ld	[%r8, %r9], %f7
	.word 0xe01a2120  ! 375: LDD_I	ldd	[%r8 + 0x0120], %r16
	.word 0xcb3a0009  ! 378: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc31a0009  ! 378: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x8a520009  ! 378: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xeb220009  ! 381: STF_R	st	%f21, [%r9, %r8]
	.word 0xc24a0009  ! 381: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143e03b  ! 381: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xcd3a0009  ! 384: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe8520009  ! 384: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xce4a0009  ! 384: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xcf3a0009  ! 387: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc4a0009  ! 387: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc36a2d28  ! 387: PREFETCH_I	prefetch	[%r8 + 0x0d28], #one_read
	.word 0xf6720009  ! 390: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc41a0009  ! 390: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xbda208a9  ! 390: FSUBs	fsubs	%f8, %f9, %f30
	.word 0xcc220009  ! 393: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe8520009  ! 393: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x8143e06f  ! 393: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #MemIssue | #Sync 
	.word 0xca2a0009  ! 396: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xda520009  ! 396: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xc3ea1009  ! 396: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc82a0009  ! 399: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcd1a0009  ! 399: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x83a20829  ! 399: FADDs	fadds	%f8, %f9, %f1
	.word 0xc73a0009  ! 402: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcb1a0009  ! 402: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xba7220e0  ! 402: UDIV_I	udiv 	%r8, 0x00e0, %r29
	.word 0xc4720009  ! 405: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xde520009  ! 405: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xc6c22f00  ! 405: LDSWA_I	ldswa	[%r8, + 0x0f00] %asi, %r3
	.word 0xce320009  ! 408: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce520009  ! 408: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xca8a1009  ! 408: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xc6320009  ! 411: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 411: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xce922e60  ! 411: LDUHA_I	lduha	[%r8, + 0x0e60] %asi, %r7
	.word 0xcc320009  ! 414: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc020009  ! 414: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x24ca0001  ! 414: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc8720009  ! 417: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8120009  ! 417: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x89220009  ! 417: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xcd3a0009  ! 420: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc5020009  ! 420: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 420: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc720009  ! 423: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc20a0009  ! 423: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xfd22288c  ! 423: STF_I	st	%f30, [0x088c, %r8]
	.word 0xc8720009  ! 426: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 426: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143e023  ! 426: MEMBAR	membar	#LoadLoad | #StoreLoad | #MemIssue 
	.word 0xf9220009  ! 429: STF_R	st	%f28, [%r9, %r8]
	.word 0xdc420009  ! 429: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xc47a0009  ! 429: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xda720009  ! 432: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xe1020009  ! 432: LDF_R	ld	[%r8, %r9], %f16
	.word 0x88fa2730  ! 432: SDIVcc_I	sdivcc 	%r8, 0x0730, %r4
	.word 0xc53a0009  ! 435: STDF_R	std	%f2, [%r9, %r8]
	.word 0xe2520009  ! 435: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0x8fa20929  ! 435: FMULs	fmuls	%f8, %f9, %f7
	.word 0xf8320009  ! 438: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xe4420009  ! 438: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc6b22570  ! 438: STHA_I	stha	%r3, [%r8 + 0x0570] %asi
	.word 0xc62a0009  ! 441: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xee4a0009  ! 441: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0xc8ba2cc8  ! 441: STDA_I	stda	%r4, [%r8 + 0x0cc8] %asi
	.word 0xca320009  ! 444: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcd020009  ! 444: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc4f21009  ! 444: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xf3220009  ! 447: STF_R	st	%f25, [%r9, %r8]
	.word 0xe65a0009  ! 447: LDX_R	ldx	[%r8 + %r9], %r19
	.word 0x0a800001  ! 447: BCS	bcs  	<label_0x1>
	.word 0xce2a0009  ! 450: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xec420009  ! 450: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0x2e800001  ! 450: BVS	bvs,a	<label_0x1>
	.word 0xc4220009  ! 453: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca420009  ! 453: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcefa2abc  ! 453: SWAPA_I	swapa	%r7, [%r8 + 0x0abc] %asi
	.word 0xce220009  ! 456: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 456: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x34800001  ! 456: BG	bg,a	<label_0x1>
	.word 0xf3220009  ! 459: STF_R	st	%f25, [%r9, %r8]
	.word 0xe80a0009  ! 459: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0x0e800001  ! 459: BVS	bvs  	<label_0x1>
	.word 0xf0320009  ! 462: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xcc0a0009  ! 462: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xce5a0009  ! 462: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xce2a0009  ! 465: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc8020009  ! 465: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8e5a24e4  ! 465: SMUL_I	smul 	%r8, 0x04e4, %r7
	.word 0xf6320009  ! 468: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xcc420009  ! 468: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc2522eb0  ! 468: LDSH_I	ldsh	[%r8 + 0x0eb0], %r1
	.word 0xc22a0009  ! 471: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca120009  ! 471: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x26ca0001  ! 471: BRLZ	brlz,a,pt	%8,<label_0xa0001>
	.word 0xf6720009  ! 474: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xcb020009  ! 474: LDF_R	ld	[%r8, %r9], %f5
	.word 0xf2a21009  ! 474: STWA_R	stwa	%r25, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 477: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 477: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xf51a0009  ! 477: LDDF_R	ldd	[%r8, %r9], %f26
	.word 0xce220009  ! 480: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd81a0009  ! 480: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xcab21009  ! 480: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 483: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4420009  ! 483: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x32800002  ! 483: BNE	bne,a	<label_0x2>
	.word 0xe02a0009  ! 486: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xe11a0009  ! 486: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0x3a800001  ! 486: BCC	bcc,a	<label_0x1>
	.word 0xc8720009  ! 489: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4020009  ! 489: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x02c20001  ! 489: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xce2a0009  ! 492: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc31a0009  ! 492: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc81a2528  ! 492: LDD_I	ldd	[%r8 + 0x0528], %r4
	.word 0xf3220009  ! 495: STF_R	st	%f25, [%r9, %r8]
	.word 0xc3020009  ! 495: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143c000  ! 495: STBAR	stbar
	.word 0xca220009  ! 498: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc65a0009  ! 498: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc6b22524  ! 498: STHA_I	stha	%r3, [%r8 + 0x0524] %asi
	.word 0xec2a0009  ! 501: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xca520009  ! 501: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc70225d8  ! 501: LDF_I	ld	[%r8, 0x05d8], %f3
	.word 0xd7220009  ! 504: STF_R	st	%f11, [%r9, %r8]
	.word 0xca0a0009  ! 504: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xdaa22fb4  ! 504: STWA_I	stwa	%r13, [%r8 + 0x0fb4] %asi
	.word 0xc4220009  ! 507: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 507: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xb0d22078  ! 507: UMULcc_I	umulcc 	%r8, 0x0078, %r24
	.word 0xd8220009  ! 510: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xe81a0009  ! 510: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xc3ea1009  ! 510: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xf13a0009  ! 513: STDF_R	std	%f24, [%r9, %r8]
	.word 0xcc420009  ! 513: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143e02e  ! 513: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xf33a0009  ! 516: STDF_R	std	%f25, [%r9, %r8]
	.word 0xea120009  ! 516: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xc49a1009  ! 516: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xce2a0009  ! 519: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 519: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc4ea2e58  ! 519: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0e58] %asi
	.word 0xce320009  ! 522: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe31a0009  ! 522: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0xc3222cc0  ! 522: STF_I	st	%f1, [0x0cc0, %r8]
	.word 0xdd220009  ! 525: STF_R	st	%f14, [%r9, %r8]
	.word 0xf2520009  ! 525: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xc2aa1009  ! 525: STBA_R	stba	%r1, [%r8 + %r9] 0x80
	.word 0xf8320009  ! 528: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc6020009  ! 528: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc3ea23b8  ! 528: PREFETCHA_I	prefetcha	[%r8, + 0x03b8] %asi, #one_read
	.word 0xee2a0009  ! 531: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xdc1a0009  ! 531: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc8aa1009  ! 531: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xf2220009  ! 534: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xd8120009  ! 534: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0xc4ea246c  ! 534: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x046c] %asi
	.word 0xc4320009  ! 537: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc8020009  ! 537: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xce821009  ! 537: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r7
	.word 0xc4220009  ! 540: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 540: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc36a0009  ! 540: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe82a0009  ! 543: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc3020009  ! 543: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc89a2040  ! 543: LDDA_I	ldda	[%r8, + 0x0040] %asi, %r4
	.word 0xcb220009  ! 546: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc5a0009  ! 546: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc4020009  ! 546: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xeb220009  ! 549: STF_R	st	%f21, [%r9, %r8]
	.word 0xd7020009  ! 549: LDF_R	ld	[%r8, %r9], %f11
	.word 0xccba2a78  ! 549: STDA_I	stda	%r6, [%r8 + 0x0a78] %asi
	.word 0xf7220009  ! 552: STF_R	st	%f27, [%r9, %r8]
	.word 0xc71a0009  ! 552: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xe4821009  ! 552: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r18
	.word 0xc7220009  ! 555: STF_R	st	%f3, [%r9, %r8]
	.word 0xc85a0009  ! 555: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xe93a2a08  ! 555: STDF_I	std	%f20, [0x0a08, %r8]
	.word 0xc73a0009  ! 558: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce0a0009  ! 558: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xf0020009  ! 558: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xc82a0009  ! 561: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce0a0009  ! 561: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc2120009  ! 561: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xde220009  ! 564: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xcc420009  ! 564: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc3ea1009  ! 564: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc7220009  ! 567: STF_R	st	%f3, [%r9, %r8]
	.word 0xe40a0009  ! 567: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xfd222780  ! 567: STF_I	st	%f30, [0x0780, %r8]
	.word 0xc82a0009  ! 570: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2520009  ! 570: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8c5a0009  ! 570: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc2320009  ! 573: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 573: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x30800001  ! 573: BA	ba,a	<label_0x1>
	.word 0xc7220009  ! 576: STF_R	st	%f3, [%r9, %r8]
	.word 0xde5a0009  ! 576: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xc3ea1009  ! 576: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc2320009  ! 579: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xda020009  ! 579: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xc8120009  ! 579: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc6220009  ! 582: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 582: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x0a800001  ! 582: BCS	bcs  	<label_0x1>
	.word 0xcd220009  ! 585: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc120009  ! 585: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x34800001  ! 585: BG	bg,a	<label_0x1>
	.word 0xcc320009  ! 588: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc44a0009  ! 588: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xf9f22009  ! 588: CASXA_R	casxa	[%r8]%asi, %r9, %r28
	.word 0xfd220009  ! 591: STF_R	st	%f30, [%r9, %r8]
	.word 0xce520009  ! 591: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc0ba1009  ! 591: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xc4720009  ! 594: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xd8420009  ! 594: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x8143e076  ! 594: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc4320009  ! 597: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc4a0009  ! 597: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xcb3a25d8  ! 597: STDF_I	std	%f5, [0x05d8, %r8]
	.word 0xfe320009  ! 600: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xce420009  ! 600: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc53a0009  ! 600: STDF_R	std	%f2, [%r9, %r8]
	.word 0xfc220009  ! 603: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc6420009  ! 603: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc46a0009  ! 603: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xc9220009  ! 606: STF_R	st	%f4, [%r9, %r8]
	.word 0xc2420009  ! 606: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc20a0009  ! 606: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xea2a0009  ! 609: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xca020009  ! 609: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc6ca1009  ! 609: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r3
	.word 0xca220009  ! 612: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xca120009  ! 612: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x852228f8  ! 612: MULScc_I	mulscc 	%r8, 0x08f8, %r2
	.word 0xf6320009  ! 615: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc20a0009  ! 615: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3ea23f4  ! 615: PREFETCHA_I	prefetcha	[%r8, + 0x03f4] %asi, #one_read
	.word 0xc3220009  ! 618: STF_R	st	%f1, [%r9, %r8]
	.word 0xc64a0009  ! 618: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xafa208a9  ! 618: FSUBs	fsubs	%f8, %f9, %f23
	.word 0xcc320009  ! 621: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xdd020009  ! 621: LDF_R	ld	[%r8, %r9], %f14
	.word 0xc8f21009  ! 621: STXA_R	stxa	%r4, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 624: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xd60a0009  ! 624: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xa64a0009  ! 624: MULX_R	mulx 	%r8, %r9, %r19
	.word 0xe8220009  ! 627: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc5020009  ! 627: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143e027  ! 627: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue 
	.word 0xdf3a0009  ! 630: STDF_R	std	%f15, [%r9, %r8]
	.word 0xc7020009  ! 630: LDF_R	ld	[%r8, %r9], %f3
	.word 0xccba1009  ! 630: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xe4320009  ! 633: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xf64a0009  ! 633: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xc3ea2ebc  ! 633: PREFETCHA_I	prefetcha	[%r8, + 0x0ebc] %asi, #one_read
	.word 0xc5220009  ! 636: STF_R	st	%f2, [%r9, %r8]
	.word 0xed020009  ! 636: LDF_R	ld	[%r8, %r9], %f22
	.word 0xc3ea2480  ! 636: PREFETCHA_I	prefetcha	[%r8, + 0x0480] %asi, #one_read
	.word 0xc6720009  ! 639: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe05a0009  ! 639: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xc8020009  ! 639: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xca320009  ! 642: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc60a0009  ! 642: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcc6a2270  ! 642: LDSTUB_I	ldstub	%r6, [%r8 + 0x0270]
	.word 0xc4720009  ! 645: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcb1a0009  ! 645: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x965a0009  ! 645: SMUL_R	smul 	%r8, %r9, %r11
	.word 0xda720009  ! 648: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xe7020009  ! 648: LDF_R	ld	[%r8, %r9], %f19
	.word 0xc44a0009  ! 648: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xca220009  ! 651: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce4a0009  ! 651: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8e520009  ! 651: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xce720009  ! 654: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc1a0009  ! 654: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xdcfa1009  ! 654: SWAPA_R	swapa	%r14, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 657: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 657: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcc5a25a8  ! 657: LDX_I	ldx	[%r8 + 0x05a8], %r6
	.word 0xf13a0009  ! 660: STDF_R	std	%f24, [%r9, %r8]
	.word 0xec520009  ! 660: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0x865a0009  ! 660: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xca220009  ! 663: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4020009  ! 663: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8da209a9  ! 663: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xdc720009  ! 666: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc8520009  ! 666: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x22800001  ! 666: BE	be,a	<label_0x1>
	.word 0xf8220009  ! 669: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xc4420009  ! 669: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xd60a0009  ! 669: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0xc6220009  ! 672: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf8420009  ! 672: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0x8143c000  ! 672: STBAR	stbar
	.word 0xca320009  ! 675: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 675: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x3e800001  ! 675: BVC	bvc,a	<label_0x1>
	.word 0xc3220009  ! 678: STF_R	st	%f1, [%r9, %r8]
	.word 0xfa5a0009  ! 678: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xceca1009  ! 678: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r7
	.word 0xc2320009  ! 681: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce4a0009  ! 681: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x12800001  ! 681: BNE	bne  	<label_0x1>
	.word 0xc53a0009  ! 684: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc81a0009  ! 684: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xa24a25b0  ! 684: MULX_I	mulx 	%r8, 0x05b0, %r17
	.word 0xe93a0009  ! 687: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc40a0009  ! 687: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc2d21009  ! 687: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0xc33a0009  ! 690: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfa020009  ! 690: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xfcc22884  ! 690: LDSWA_I	ldswa	[%r8, + 0x0884] %asi, %r30
	.word 0xcb220009  ! 693: STF_R	st	%f5, [%r9, %r8]
	.word 0xc65a0009  ! 693: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xbfa208a9  ! 693: FSUBs	fsubs	%f8, %f9, %f31
	.word 0xcf3a0009  ! 696: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe1020009  ! 696: LDF_R	ld	[%r8, %r9], %f16
	.word 0xc36a26cc  ! 696: PREFETCH_I	prefetch	[%r8 + 0x06cc], #one_read
	.word 0xc2220009  ! 699: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca020009  ! 699: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8c4a237c  ! 699: MULX_I	mulx 	%r8, 0x037c, %r6
	.word 0xcc720009  ! 702: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe80a0009  ! 702: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xe2122394  ! 702: LDUH_I	lduh	[%r8 + 0x0394], %r17
	.word 0xe02a0009  ! 705: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xcc0a0009  ! 705: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x89a20829  ! 705: FADDs	fadds	%f8, %f9, %f4
	.word 0xc42a0009  ! 708: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf6020009  ! 708: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xc36a21ac  ! 708: PREFETCH_I	prefetch	[%r8 + 0x01ac], #one_read
	.word 0xfa220009  ! 711: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xcf020009  ! 711: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc4ea2ef0  ! 711: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0ef0] %asi
	.word 0xf8320009  ! 714: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xe0420009  ! 714: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x0c800001  ! 714: BNEG	bneg  	<label_0x1>
	.word 0xc4720009  ! 717: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca120009  ! 717: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xd67a24bc  ! 717: SWAP_I	swap	%r11, [%r8 + 0x04bc]
	.word 0xc5220009  ! 720: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc420009  ! 720: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 720: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce320009  ! 723: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xdf020009  ! 723: LDF_R	ld	[%r8, %r9], %f15
	.word 0xc4b22b50  ! 723: STHA_I	stha	%r2, [%r8 + 0x0b50] %asi
	.word 0xc5220009  ! 726: STF_R	st	%f2, [%r9, %r8]
	.word 0xf00a0009  ! 726: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xc3ea1009  ! 726: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfc320009  ! 729: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xca4a0009  ! 729: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xe53a2c10  ! 729: STDF_I	std	%f18, [0x0c10, %r8]
	.word 0xc4720009  ! 732: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 732: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 732: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc5220009  ! 735: STF_R	st	%f2, [%r9, %r8]
	.word 0xc4520009  ! 735: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8a6a2e9c  ! 735: UDIVX_I	udivx 	%r8, 0x0e9c, %r5
	.word 0xcb3a0009  ! 738: STDF_R	std	%f5, [%r9, %r8]
	.word 0xda420009  ! 738: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xcd3a2eb8  ! 738: STDF_I	std	%f6, [0x0eb8, %r8]
	.word 0xfe720009  ! 741: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xce4a0009  ! 741: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc8ba1009  ! 741: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xf22a0009  ! 744: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc2120009  ! 744: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xac5a28f0  ! 744: SMUL_I	smul 	%r8, 0x08f0, %r22
	.word 0xcb220009  ! 747: STF_R	st	%f5, [%r9, %r8]
	.word 0xda5a0009  ! 747: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xc36a0009  ! 747: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcb3a0009  ! 750: STDF_R	std	%f5, [%r9, %r8]
	.word 0xf6420009  ! 750: LDSW_R	ldsw	[%r8 + %r9], %r27
	.word 0xccc22d50  ! 750: LDSWA_I	ldswa	[%r8, + 0x0d50] %asi, %r6
	.word 0xc7220009  ! 753: STF_R	st	%f3, [%r9, %r8]
	.word 0xe6420009  ! 753: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xc6c21009  ! 753: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xc22a0009  ! 756: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe51a0009  ! 756: LDDF_R	ldd	[%r8, %r9], %f18
	.word 0x8143e07c  ! 756: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xcc2a0009  ! 759: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc01a0009  ! 759: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8143c000  ! 759: STBAR	stbar
	.word 0xc4320009  ! 762: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xec020009  ! 762: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8fa208a9  ! 762: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc2320009  ! 765: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xee420009  ! 765: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xfaea270c  ! 765: LDSTUBA_I	ldstuba	%r29, [%r8 + 0x070c] %asi
	.word 0xf33a0009  ! 768: STDF_R	std	%f25, [%r9, %r8]
	.word 0xf3020009  ! 768: LDF_R	ld	[%r8, %r9], %f25
	.word 0x9fa208a9  ! 768: FSUBs	fsubs	%f8, %f9, %f15
	.word 0xce2a0009  ! 771: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc8020009  ! 771: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x887a0009  ! 771: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xce220009  ! 774: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf81a0009  ! 774: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xce0a0009  ! 774: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc42a0009  ! 777: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe85a0009  ! 777: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0x8eda2fb8  ! 777: SMULcc_I	smulcc 	%r8, 0x0fb8, %r7
	.word 0xf02a0009  ! 780: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xe80a0009  ! 780: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xa7a209a9  ! 780: FDIVs	fdivs	%f8, %f9, %f19
	.word 0xe1220009  ! 783: STF_R	st	%f16, [%r9, %r8]
	.word 0xfd020009  ! 783: LDF_R	ld	[%r8, %r9], %f30
	.word 0xc3ea287c  ! 783: PREFETCHA_I	prefetcha	[%r8, + 0x087c] %asi, #one_read
	.word 0xc73a0009  ! 786: STDF_R	std	%f3, [%r9, %r8]
	.word 0xdc420009  ! 786: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x8da208a9  ! 786: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xd73a0009  ! 789: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc80a0009  ! 789: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 789: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xda320009  ! 792: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xdc420009  ! 792: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xda92249c  ! 792: LDUHA_I	lduha	[%r8, + 0x049c] %asi, %r13
	.word 0xcd3a0009  ! 795: STDF_R	std	%f6, [%r9, %r8]
	.word 0xdf1a0009  ! 795: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x88da0009  ! 795: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xca220009  ! 798: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 798: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x845a2b50  ! 798: SMUL_I	smul 	%r8, 0x0b50, %r2
	.word 0xc42a0009  ! 801: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf8520009  ! 801: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0xc4022d30  ! 801: LDUW_I	lduw	[%r8 + 0x0d30], %r2
	.word 0xce220009  ! 804: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf60a0009  ! 804: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xca821009  ! 804: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xc8720009  ! 807: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc81a0009  ! 807: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xb4d20009  ! 807: UMULcc_R	umulcc 	%r8, %r9, %r26
	.word 0xf93a0009  ! 810: STDF_R	std	%f28, [%r9, %r8]
	.word 0xef020009  ! 810: LDF_R	ld	[%r8, %r9], %f23
	.word 0xbcf22bd8  ! 810: UDIVcc_I	udivcc 	%r8, 0x0bd8, %r30
	.word 0xce220009  ! 813: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc420009  ! 813: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc3ea2158  ! 813: PREFETCHA_I	prefetcha	[%r8, + 0x0158] %asi, #one_read
	.word 0xcc2a0009  ! 816: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 816: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x22800001  ! 816: BE	be,a	<label_0x1>
	.word 0xf4720009  ! 819: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xdc520009  ! 819: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x2e800001  ! 819: BVS	bvs,a	<label_0x1>
	.word 0xca720009  ! 822: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf00a0009  ! 822: LDUB_R	ldub	[%r8 + %r9], %r24
	.word 0xc2f22d30  ! 822: STXA_I	stxa	%r1, [%r8 + 0x0d30] %asi
	.word 0xca2a0009  ! 825: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 825: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc5f22009  ! 825: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xc62a0009  ! 828: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc51a0009  ! 828: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8ada0009  ! 828: SMULcc_R	smulcc 	%r8, %r9, %r5
	.word 0xcd220009  ! 831: STF_R	st	%f6, [%r9, %r8]
	.word 0xfe020009  ! 831: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x8143e071  ! 831: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xcd3a0009  ! 834: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc20a0009  ! 834: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x14800001  ! 834: BG	bg  	<label_0x1>
	.word 0xc6220009  ! 837: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf60a0009  ! 837: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0x887a0009  ! 837: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xe8220009  ! 840: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xe41a0009  ! 840: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x8143c000  ! 840: STBAR	stbar
	.word 0xfa320009  ! 843: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xca120009  ! 843: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143e077  ! 843: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xea2a0009  ! 846: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xce0a0009  ! 846: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xcc6a0009  ! 846: LDSTUB_R	ldstub	%r6, [%r8 + %r9]
	.word 0xcf3a0009  ! 849: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc41a0009  ! 849: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x26800001  ! 849: BL	bl,a	<label_0x1>
	.word 0xc3220009  ! 852: STF_R	st	%f1, [%r9, %r8]
	.word 0xde520009  ! 852: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x8652221c  ! 852: UMUL_I	umul 	%r8, 0x021c, %r3
	.word 0xcb220009  ! 855: STF_R	st	%f5, [%r9, %r8]
	.word 0xc8120009  ! 855: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xafa209a9  ! 855: FDIVs	fdivs	%f8, %f9, %f23
	.word 0xc2220009  ! 858: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc6520009  ! 858: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xaa6a0009  ! 858: UDIVX_R	udivx 	%r8, %r9, %r21
	.word 0xc3220009  ! 861: STF_R	st	%f1, [%r9, %r8]
	.word 0xca020009  ! 861: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xceda2178  ! 861: LDXA_I	ldxa	[%r8, + 0x0178] %asi, %r7
	.word 0xc3220009  ! 864: STF_R	st	%f1, [%r9, %r8]
	.word 0xdc0a0009  ! 864: LDUB_R	ldub	[%r8 + %r9], %r14
	.word 0xceaa1009  ! 864: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xd6220009  ! 867: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xca4a0009  ! 867: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 867: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8220009  ! 870: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca5a0009  ! 870: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x2eca0001  ! 870: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xcc720009  ! 873: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc84a0009  ! 873: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8a4a2b20  ! 873: MULX_I	mulx 	%r8, 0x0b20, %r5
	.word 0xca220009  ! 876: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcf020009  ! 876: LDF_R	ld	[%r8, %r9], %f7
	.word 0x34800002  ! 876: BG	bg,a	<label_0x2>
	.word 0xc6220009  ! 879: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xeb1a0009  ! 879: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0x8fa209a9  ! 879: FDIVs	fdivs	%f8, %f9, %f7
	.word 0xca720009  ! 882: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf11a0009  ! 882: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0xc36a0009  ! 882: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc3220009  ! 885: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc420009  ! 885: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xf5f21009  ! 885: CASXA_I	casxa	[%r8] 0x80, %r9, %r26
	.word 0xcc720009  ! 888: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc45a0009  ! 888: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xe0a2206c  ! 888: STWA_I	stwa	%r16, [%r8 + 0x006c] %asi
	.word 0xcc320009  ! 891: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcf020009  ! 891: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143e071  ! 891: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xe4720009  ! 894: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc41a0009  ! 894: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc36a2ca4  ! 894: PREFETCH_I	prefetch	[%r8 + 0x0ca4], #one_read
	.word 0xc82a0009  ! 897: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 897: LDF_R	ld	[%r8, %r9], %f5
	.word 0xcaea2c7c  ! 897: LDSTUBA_I	ldstuba	%r5, [%r8 + 0x0c7c] %asi
	.word 0xcc220009  ! 900: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca420009  ! 900: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc6ea1009  ! 900: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xe22a0009  ! 903: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc85a0009  ! 903: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xc20a28a0  ! 903: LDUB_I	ldub	[%r8 + 0x08a0], %r1
	.word 0xc22a0009  ! 906: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf11a0009  ! 906: LDDF_R	ldd	[%r8, %r9], %f24
	.word 0x8143e004  ! 906: MEMBAR	membar	#LoadStore 
	.word 0xf4220009  ! 909: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xfc1a0009  ! 909: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x8a520009  ! 909: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc33a0009  ! 912: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcb1a0009  ! 912: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xecd21009  ! 912: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r22
	.word 0xc3220009  ! 915: STF_R	st	%f1, [%r9, %r8]
	.word 0xde020009  ! 915: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0x24ca0001  ! 915: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xc8220009  ! 918: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe8420009  ! 918: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0x8143e008  ! 918: MEMBAR	membar	#StoreStore 
	.word 0xcc720009  ! 921: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc2520009  ! 921: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xfd3a28b0  ! 921: STDF_I	std	%f30, [0x08b0, %r8]
	.word 0xc2220009  ! 924: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc51a0009  ! 924: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x84522140  ! 924: UMUL_I	umul 	%r8, 0x0140, %r2
	.word 0xce220009  ! 927: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf81a0009  ! 927: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc36a0009  ! 927: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfe220009  ! 930: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xfa5a0009  ! 930: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0xcca22554  ! 930: STWA_I	stwa	%r6, [%r8 + 0x0554] %asi
	.word 0xda220009  ! 933: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xcc4a0009  ! 933: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 933: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf33a0009  ! 936: STDF_R	std	%f25, [%r9, %r8]
	.word 0xc91a0009  ! 936: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xbaf221c4  ! 936: UDIVcc_I	udivcc 	%r8, 0x01c4, %r29
	.word 0xcc220009  ! 939: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfa520009  ! 939: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0xb85a2938  ! 939: SMUL_I	smul 	%r8, 0x0938, %r28
	.word 0xce320009  ! 942: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc6120009  ! 942: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xca7a2f1c  ! 942: SWAP_I	swap	%r5, [%r8 + 0x0f1c]
	.word 0xc82a0009  ! 945: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xde4a0009  ! 945: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xc25a20d8  ! 945: LDX_I	ldx	[%r8 + 0x00d8], %r1
	.word 0xcf3a0009  ! 948: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce0a0009  ! 948: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x0ec20001  ! 948: BRGEZ	brgez  ,nt	%8,<label_0x20001>
	.word 0xce220009  ! 951: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce5a0009  ! 951: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x88da0009  ! 951: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xc2720009  ! 954: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 954: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc6ea1009  ! 954: LDSTUBA_R	ldstuba	%r3, [%r8 + %r9] 0x80
	.word 0xce720009  ! 957: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe6120009  ! 957: LDUH_R	lduh	[%r8 + %r9], %r19
	.word 0xc64a29e0  ! 957: LDSB_I	ldsb	[%r8 + 0x09e0], %r3
	.word 0xcb220009  ! 960: STF_R	st	%f5, [%r9, %r8]
	.word 0xee5a0009  ! 960: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xc2b21009  ! 960: STHA_R	stha	%r1, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 963: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd85a0009  ! 963: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0xcafa227c  ! 963: SWAPA_I	swapa	%r5, [%r8 + 0x027c] %asi
	.word 0xce2a0009  ! 966: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfb020009  ! 966: LDF_R	ld	[%r8, %r9], %f29
	.word 0x8c7a0009  ! 966: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xe0320009  ! 969: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xc2120009  ! 969: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 969: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf1220009  ! 972: STF_R	st	%f24, [%r9, %r8]
	.word 0xca0a0009  ! 972: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc3ea2814  ! 972: PREFETCHA_I	prefetcha	[%r8, + 0x0814] %asi, #one_read
	.word 0xf8220009  ! 975: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xd65a0009  ! 975: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xa1a209a9  ! 975: FDIVs	fdivs	%f8, %f9, %f16
	.word 0xce320009  ! 978: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf24a0009  ! 978: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0x8143c000  ! 978: STBAR	stbar
	.word 0xd7220009  ! 981: STF_R	st	%f11, [%r9, %r8]
	.word 0xc6520009  ! 981: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcc8a1009  ! 981: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xc4720009  ! 984: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 984: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x2a800001  ! 984: BCS	bcs,a	<label_0x1>
	.word 0xc4320009  ! 987: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 987: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xdc922bc4  ! 987: LDUHA_I	lduha	[%r8, + 0x0bc4] %asi, %r14
	.word 0xce2a0009  ! 990: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc51a0009  ! 990: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xa3220009  ! 990: MULScc_R	mulscc 	%r8, %r9, %r17
	.word 0xc9220009  ! 993: STF_R	st	%f4, [%r9, %r8]
	.word 0xce5a0009  ! 993: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143e01e  ! 993: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xee2a0009  ! 996: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xce520009  ! 996: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x24c20001  ! 996: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xc5220009  ! 999: STF_R	st	%f2, [%r9, %r8]
	.word 0xc2420009  ! 999: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 999: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc7220009  ! 1002: STF_R	st	%f3, [%r9, %r8]
	.word 0xca020009  ! 1002: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x04800001  ! 1002: BLE	ble  	<label_0x1>
	.word 0xc33a0009  ! 1005: STDF_R	std	%f1, [%r9, %r8]
	.word 0xed020009  ! 1005: LDF_R	ld	[%r8, %r9], %f22
	.word 0xc4f226f8  ! 1005: STXA_I	stxa	%r2, [%r8 + 0x06f8] %asi
	.word 0xce2a0009  ! 1008: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xfe5a0009  ! 1008: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0x10800001  ! 1008: BA	ba  	<label_0x1>
	.word 0xf0720009  ! 1011: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc4520009  ! 1011: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x88d20009  ! 1011: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0xcb3a0009  ! 1014: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfc020009  ! 1014: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xf1220009  ! 1014: STF_R	st	%f24, [%r9, %r8]
	.word 0xcb3a0009  ! 1017: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc51a0009  ! 1017: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x32800001  ! 1017: BNE	bne,a	<label_0x1>
	.word 0xcc220009  ! 1020: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xde0a0009  ! 1020: LDUB_R	ldub	[%r8 + %r9], %r15
	.word 0xc2aa2420  ! 1020: STBA_I	stba	%r1, [%r8 + 0x0420] %asi
	.word 0xc6220009  ! 1023: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc25a0009  ! 1023: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc5220009  ! 1023: STF_R	st	%f2, [%r9, %r8]
	.word 0xc62a0009  ! 1026: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf81a0009  ! 1026: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x825a0009  ! 1026: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xe0720009  ! 1029: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc6120009  ! 1029: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc4921009  ! 1029: LDUHA_R	lduha	[%r8, %r9] 0x80, %r2
	.word 0xfc2a0009  ! 1032: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc6420009  ! 1032: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xe8da1009  ! 1032: LDXA_R	ldxa	[%r8, %r9] 0x80, %r20
	.word 0xce2a0009  ! 1035: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc9020009  ! 1035: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc8aa1009  ! 1035: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xe0220009  ! 1038: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xce4a0009  ! 1038: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xbc720009  ! 1038: UDIV_R	udiv 	%r8, %r9, %r30
	.word 0xfa320009  ! 1041: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xce420009  ! 1041: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc36a0009  ! 1041: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc93a0009  ! 1044: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc60a0009  ! 1044: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xf8fa29a4  ! 1044: SWAPA_I	swapa	%r28, [%r8 + 0x09a4] %asi
	.word 0xf33a0009  ! 1047: STDF_R	std	%f25, [%r9, %r8]
	.word 0xf40a0009  ! 1047: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0x8922212c  ! 1047: MULScc_I	mulscc 	%r8, 0x012c, %r4
	.word 0xf7220009  ! 1050: STF_R	st	%f27, [%r9, %r8]
	.word 0xde020009  ! 1050: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xd71a2370  ! 1050: LDDF_I	ldd	[%r8, 0x0370], %f11
	.word 0xc73a0009  ! 1053: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce0a0009  ! 1053: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc7222a9c  ! 1053: STF_I	st	%f3, [0x0a9c, %r8]
	.word 0xee220009  ! 1056: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xe6420009  ! 1056: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xdaa21009  ! 1056: STWA_R	stwa	%r13, [%r8 + %r9] 0x80
	.word 0xca720009  ! 1059: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc2520009  ! 1059: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8143e04a  ! 1059: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xca220009  ! 1062: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 1062: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143e03b  ! 1062: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xc82a0009  ! 1065: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfa0a0009  ! 1065: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xe3222e60  ! 1065: STF_I	st	%f17, [0x0e60, %r8]
	.word 0xc5220009  ! 1068: STF_R	st	%f2, [%r9, %r8]
	.word 0xea0a0009  ! 1068: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xc3222074  ! 1068: STF_I	st	%f1, [0x0074, %r8]
	.word 0xc82a0009  ! 1071: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcd1a0009  ! 1071: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc9f21009  ! 1071: CASXA_I	casxa	[%r8] 0x80, %r9, %r4
	.word 0xc4220009  ! 1074: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf0420009  ! 1074: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xc8c21009  ! 1074: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xc8320009  ! 1077: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 1077: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x82d20009  ! 1077: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xe8220009  ! 1080: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xca5a0009  ! 1080: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xe0a21009  ! 1080: STWA_R	stwa	%r16, [%r8 + %r9] 0x80
	.word 0xc6220009  ! 1083: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcf020009  ! 1083: LDF_R	ld	[%r8, %r9], %f7
	.word 0xe81a0009  ! 1083: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xd8720009  ! 1086: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xe0420009  ! 1086: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xe66a2990  ! 1086: LDSTUB_I	ldstub	%r19, [%r8 + 0x0990]
	.word 0xcd220009  ! 1089: STF_R	st	%f6, [%r9, %r8]
	.word 0xc44a0009  ! 1089: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xacfa0009  ! 1089: SDIVcc_R	sdivcc 	%r8, %r9, %r22
	.word 0xca720009  ! 1092: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xce020009  ! 1092: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143c000  ! 1092: STBAR	stbar
	.word 0xc3220009  ! 1095: STF_R	st	%f1, [%r9, %r8]
	.word 0xca4a0009  ! 1095: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1095: STBAR	stbar
	.word 0xff220009  ! 1098: STF_R	st	%f31, [%r9, %r8]
	.word 0xc44a0009  ! 1098: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x85a20829  ! 1098: FADDs	fadds	%f8, %f9, %f2
	.word 0xcf3a0009  ! 1101: STDF_R	std	%f7, [%r9, %r8]
	.word 0xf05a0009  ! 1101: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xccfa220c  ! 1101: SWAPA_I	swapa	%r6, [%r8 + 0x020c] %asi
	.word 0xea320009  ! 1104: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xc6020009  ! 1104: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc2ca1009  ! 1104: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xf42a0009  ! 1107: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xe0020009  ! 1107: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xce822ba0  ! 1107: LDUWA_I	lduwa	[%r8, + 0x0ba0] %asi, %r7
	.word 0xe5220009  ! 1110: STF_R	st	%f18, [%r9, %r8]
	.word 0xc81a0009  ! 1110: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x20800001  ! 1110: BN	bn,a	<label_0x1>
	.word 0xc53a0009  ! 1113: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc6520009  ! 1113: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x1a800001  ! 1113: BCC	bcc  	<label_0x1>
	.word 0xc22a0009  ! 1116: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc4520009  ! 1116: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x22800002  ! 1116: BE	be,a	<label_0x2>
	.word 0xc73a0009  ! 1119: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc7020009  ! 1119: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8a6a0009  ! 1119: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xe6220009  ! 1122: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc3020009  ! 1122: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143c000  ! 1122: STBAR	stbar
	.word 0xcd220009  ! 1125: STF_R	st	%f6, [%r9, %r8]
	.word 0xf4120009  ! 1125: LDUH_R	lduh	[%r8 + %r9], %r26
	.word 0xc0ba1009  ! 1125: STDA_R	stda	%r0, [%r8 + %r9] 0x80
	.word 0xca220009  ! 1128: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe00a0009  ! 1128: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0xc3ea2f24  ! 1128: PREFETCHA_I	prefetcha	[%r8, + 0x0f24] %asi, #one_read
	.word 0xc6220009  ! 1131: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc2120009  ! 1131: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8143c000  ! 1131: STBAR	stbar
	.word 0xe4320009  ! 1134: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xf25a0009  ! 1134: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0x97a209a9  ! 1134: FDIVs	fdivs	%f8, %f9, %f11
	.word 0xcf220009  ! 1137: STF_R	st	%f7, [%r9, %r8]
	.word 0xce120009  ! 1137: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 1137: STBAR	stbar
	.word 0xc6220009  ! 1140: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc420009  ! 1140: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143e015  ! 1140: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside 
	.word 0xee2a0009  ! 1143: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xf2420009  ! 1143: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x8143e025  ! 1143: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xea720009  ! 1146: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xcc1a0009  ! 1146: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xb8522f88  ! 1146: UMUL_I	umul 	%r8, 0x0f88, %r28
	.word 0xcc220009  ! 1149: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfa4a0009  ! 1149: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xc9222e38  ! 1149: STF_I	st	%f4, [0x0e38, %r8]
	.word 0xcd3a0009  ! 1152: STDF_R	std	%f6, [%r9, %r8]
	.word 0xea120009  ! 1152: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xe8ba2ea8  ! 1152: STDA_I	stda	%r20, [%r8 + 0x0ea8] %asi
	.word 0xe73a0009  ! 1155: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc44a0009  ! 1155: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x2eca0001  ! 1155: BRGEZ	brgez,a,pt	%8,<label_0xa0001>
	.word 0xfc220009  ! 1158: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xfe420009  ! 1158: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x8afa0009  ! 1158: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xde320009  ! 1161: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc60a0009  ! 1161: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcc9a1009  ! 1161: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xce2a0009  ! 1164: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc60a0009  ! 1164: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc2f221b0  ! 1164: STXA_I	stxa	%r1, [%r8 + 0x01b0] %asi
	.word 0xf2220009  ! 1167: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xcf020009  ! 1167: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143c000  ! 1167: STBAR	stbar
	.word 0xe8220009  ! 1170: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xcd020009  ! 1170: LDF_R	ld	[%r8, %r9], %f6
	.word 0x3a800002  ! 1170: BCC	bcc,a	<label_0x2>
	.word 0xc33a0009  ! 1173: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc81a0009  ! 1173: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 1173: STBAR	stbar
	.word 0xc82a0009  ! 1176: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc420009  ! 1176: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc09a2650  ! 1176: LDDA_I	ldda	[%r8, + 0x0650] %asi, %r0
	.word 0xd8720009  ! 1179: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xc5020009  ! 1179: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc84a0009  ! 1179: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xce320009  ! 1182: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 1182: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc5f21009  ! 1182: CASXA_I	casxa	[%r8] 0x80, %r9, %r2
	.word 0xcd220009  ! 1185: STF_R	st	%f6, [%r9, %r8]
	.word 0xc6020009  ! 1185: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xca922ce0  ! 1185: LDUHA_I	lduha	[%r8, + 0x0ce0] %asi, %r5
	.word 0xe62a0009  ! 1188: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xcc020009  ! 1188: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x89a209a9  ! 1188: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xcd3a0009  ! 1191: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe80a0009  ! 1191: LDUB_R	ldub	[%r8 + %r9], %r20
	.word 0xc4fa2480  ! 1191: SWAPA_I	swapa	%r2, [%r8 + 0x0480] %asi
	.word 0xcd220009  ! 1194: STF_R	st	%f6, [%r9, %r8]
	.word 0xfc120009  ! 1194: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xc4b229b8  ! 1194: STHA_I	stha	%r2, [%r8 + 0x09b8] %asi
	.word 0xcb220009  ! 1197: STF_R	st	%f5, [%r9, %r8]
	.word 0xf4420009  ! 1197: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc8b21009  ! 1197: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xc6320009  ! 1200: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd80a0009  ! 1200: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xc2821009  ! 1200: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0xde720009  ! 1203: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc71a0009  ! 1203: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8c720009  ! 1203: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xcd220009  ! 1206: STF_R	st	%f6, [%r9, %r8]
	.word 0xd8120009  ! 1206: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0x84d20009  ! 1206: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0xcd220009  ! 1209: STF_R	st	%f6, [%r9, %r8]
	.word 0xc60a0009  ! 1209: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x846a24e0  ! 1209: UDIVX_I	udivx 	%r8, 0x04e0, %r2
	.word 0xf2320009  ! 1212: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc2420009  ! 1212: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc4ba1009  ! 1212: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xcc2a0009  ! 1215: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcd020009  ! 1215: LDF_R	ld	[%r8, %r9], %f6
	.word 0xb0720009  ! 1215: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0xe53a0009  ! 1218: STDF_R	std	%f18, [%r9, %r8]
	.word 0xde5a0009  ! 1218: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0x1a800002  ! 1218: BCC	bcc  	<label_0x2>
	.word 0xf6320009  ! 1221: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc2020009  ! 1221: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc36a2c34  ! 1221: PREFETCH_I	prefetch	[%r8 + 0x0c34], #one_read
	.word 0xcc2a0009  ! 1224: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 1224: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xcaf22f38  ! 1224: STXA_I	stxa	%r5, [%r8 + 0x0f38] %asi
	.word 0xf62a0009  ! 1227: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc6120009  ! 1227: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xfeaa1009  ! 1227: STBA_R	stba	%r31, [%r8 + %r9] 0x80
	.word 0xc4220009  ! 1230: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf04a0009  ! 1230: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0x8143e04b  ! 1230: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Sync 
	.word 0xc82a0009  ! 1233: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xf0520009  ! 1233: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0xf87a0009  ! 1233: SWAP_R	swap	%r28, [%r8 + %r9]
	.word 0xcc320009  ! 1236: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xda520009  ! 1236: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xa7a208a9  ! 1236: FSUBs	fsubs	%f8, %f9, %f19
	.word 0xcd3a0009  ! 1239: STDF_R	std	%f6, [%r9, %r8]
	.word 0xfe020009  ! 1239: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xce7a0009  ! 1239: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xed220009  ! 1242: STF_R	st	%f22, [%r9, %r8]
	.word 0xc41a0009  ! 1242: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x22800001  ! 1242: BE	be,a	<label_0x1>
	.word 0xcb220009  ! 1245: STF_R	st	%f5, [%r9, %r8]
	.word 0xc71a0009  ! 1245: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x0cc20001  ! 1245: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xef3a0009  ! 1248: STDF_R	std	%f23, [%r9, %r8]
	.word 0xdc420009  ! 1248: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0x896a0009  ! 1248: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xdf3a0009  ! 1251: STDF_R	std	%f15, [%r9, %r8]
	.word 0xcd1a0009  ! 1251: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xc2aa22a0  ! 1251: STBA_I	stba	%r1, [%r8 + 0x02a0] %asi
	.word 0xec220009  ! 1254: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc6120009  ! 1254: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc36a274c  ! 1254: PREFETCH_I	prefetch	[%r8 + 0x074c], #one_read
	.word 0xcc320009  ! 1257: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xff020009  ! 1257: LDF_R	ld	[%r8, %r9], %f31
	.word 0x10800001  ! 1257: BA	ba  	<label_0x1>
	.word 0xc4220009  ! 1260: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xde5a0009  ! 1260: LDX_R	ldx	[%r8 + %r9], %r15
	.word 0xce7a26a0  ! 1260: SWAP_I	swap	%r7, [%r8 + 0x06a0]
	.word 0xca2a0009  ! 1263: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc6020009  ! 1263: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xca921009  ! 1263: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xc2720009  ! 1266: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcb020009  ! 1266: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc7220009  ! 1266: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4220009  ! 1269: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc4120009  ! 1269: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x82fa0009  ! 1269: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0xce320009  ! 1272: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc64a0009  ! 1272: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xcab21009  ! 1272: STHA_R	stha	%r5, [%r8 + %r9] 0x80
	.word 0xc8220009  ! 1275: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcd020009  ! 1275: LDF_R	ld	[%r8, %r9], %f6
	.word 0xcf1a2e60  ! 1275: LDDF_I	ldd	[%r8, 0x0e60], %f7
	.word 0xc5220009  ! 1278: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8120009  ! 1278: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x26c20001  ! 1278: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc73a0009  ! 1281: STDF_R	std	%f3, [%r9, %r8]
	.word 0xdc1a0009  ! 1281: LDD_R	ldd	[%r8 + %r9], %r14
	.word 0xc89a1009  ! 1281: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xe6220009  ! 1284: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc71a0009  ! 1284: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc67a0009  ! 1284: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xce320009  ! 1287: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc41a0009  ! 1287: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x10800001  ! 1287: BA	ba  	<label_0x1>
	.word 0xc4720009  ! 1290: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 1290: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xf2b22dc8  ! 1290: STHA_I	stha	%r25, [%r8 + 0x0dc8] %asi
	.word 0xcd3a0009  ! 1293: STDF_R	std	%f6, [%r9, %r8]
	.word 0xec1a0009  ! 1293: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc7222958  ! 1293: STF_I	st	%f3, [0x0958, %r8]
	.word 0xca320009  ! 1296: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xd81a0009  ! 1296: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x84fa20f4  ! 1296: SDIVcc_I	sdivcc 	%r8, 0x00f4, %r2
	.word 0xc2320009  ! 1299: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf45a0009  ! 1299: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x3e800002  ! 1299: BVC	bvc,a	<label_0x2>
	.word 0xc53a0009  ! 1302: STDF_R	std	%f2, [%r9, %r8]
	.word 0xda5a0009  ! 1302: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x8fa208a9  ! 1302: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xf4320009  ! 1305: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc7020009  ! 1305: LDF_R	ld	[%r8, %r9], %f3
	.word 0xc36a0009  ! 1305: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfa2a0009  ! 1308: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc65a0009  ! 1308: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8ad22a48  ! 1308: UMULcc_I	umulcc 	%r8, 0x0a48, %r5
	.word 0xc22a0009  ! 1311: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc8520009  ! 1311: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xe2fa1009  ! 1311: SWAPA_R	swapa	%r17, [%r8 + %r9] 0x80
	.word 0xeb3a0009  ! 1314: STDF_R	std	%f21, [%r9, %r8]
	.word 0xf40a0009  ! 1314: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0x1c800001  ! 1314: BPOS	bpos  	<label_0x1>
	.word 0xfc320009  ! 1317: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc8420009  ! 1317: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x2a800001  ! 1317: BCS	bcs,a	<label_0x1>
	.word 0xe7220009  ! 1320: STF_R	st	%f19, [%r9, %r8]
	.word 0xf41a0009  ! 1320: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0x12800001  ! 1320: BNE	bne  	<label_0x1>
	.word 0xc6220009  ! 1323: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc2020009  ! 1323: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xd66a0009  ! 1323: LDSTUB_R	ldstub	%r11, [%r8 + %r9]
	.word 0xcb220009  ! 1326: STF_R	st	%f5, [%r9, %r8]
	.word 0xc81a0009  ! 1326: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8e5a2f34  ! 1326: SMUL_I	smul 	%r8, 0x0f34, %r7
	.word 0xcc720009  ! 1329: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc9020009  ! 1329: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143e073  ! 1329: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xca720009  ! 1332: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 1332: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc93a0009  ! 1332: STDF_R	std	%f4, [%r9, %r8]
	.word 0xee220009  ! 1335: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc64a0009  ! 1335: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xdaf21009  ! 1335: STXA_R	stxa	%r13, [%r8 + %r9] 0x80
	.word 0xe7220009  ! 1338: STF_R	st	%f19, [%r9, %r8]
	.word 0xca0a0009  ! 1338: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xd89a1009  ! 1338: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0xcb3a0009  ! 1341: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce4a0009  ! 1341: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8143e026  ! 1341: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xf0720009  ! 1344: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc4520009  ! 1344: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xfc020009  ! 1344: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xc82a0009  ! 1347: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 1347: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xceb21009  ! 1347: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xeb220009  ! 1350: STF_R	st	%f21, [%r9, %r8]
	.word 0xc25a0009  ! 1350: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc6d2242c  ! 1350: LDSHA_I	ldsha	[%r8, + 0x042c] %asi, %r3
	.word 0xc2320009  ! 1353: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc80a0009  ! 1353: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc722234c  ! 1353: STF_I	st	%f3, [0x034c, %r8]
	.word 0xf3220009  ! 1356: STF_R	st	%f25, [%r9, %r8]
	.word 0xc6420009  ! 1356: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x8a722750  ! 1356: UDIV_I	udiv 	%r8, 0x0750, %r5
	.word 0xc4220009  ! 1359: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf6120009  ! 1359: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xca8a1009  ! 1359: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0xcc320009  ! 1362: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4420009  ! 1362: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc2b22cc4  ! 1362: STHA_I	stha	%r1, [%r8 + 0x0cc4] %asi
	.word 0xce720009  ! 1365: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xfb1a0009  ! 1365: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0x8a6a0009  ! 1365: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xea720009  ! 1368: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc9020009  ! 1368: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc87a0009  ! 1368: SWAP_R	swap	%r4, [%r8 + %r9]
	.word 0xde320009  ! 1371: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xe0420009  ! 1371: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xc7e22009  ! 1371: CASA_R	casa	[%r8] %asi, %r9, %r3
	.word 0xf53a0009  ! 1374: STDF_R	std	%f26, [%r9, %r8]
	.word 0xde4a0009  ! 1374: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xc36a23d8  ! 1374: PREFETCH_I	prefetch	[%r8 + 0x03d8], #one_read
	.word 0xcf3a0009  ! 1377: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe01a0009  ! 1377: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xf4420009  ! 1377: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc2720009  ! 1380: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xca020009  ! 1380: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xdaca2474  ! 1380: LDSBA_I	ldsba	[%r8, + 0x0474] %asi, %r13
	.word 0xf1220009  ! 1383: STF_R	st	%f24, [%r9, %r8]
	.word 0xdc020009  ! 1383: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x8143e07f  ! 1383: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc6320009  ! 1386: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xfe020009  ! 1386: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xc3ea1009  ! 1386: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6320009  ! 1389: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd6420009  ! 1389: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0x87a20829  ! 1389: FADDs	fadds	%f8, %f9, %f3
	.word 0xc2220009  ! 1392: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xca0a0009  ! 1392: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1392: STBAR	stbar
	.word 0xc82a0009  ! 1395: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca4a0009  ! 1395: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcefa2fb8  ! 1395: SWAPA_I	swapa	%r7, [%r8 + 0x0fb8] %asi
	.word 0xc6320009  ! 1398: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd80a0009  ! 1398: LDUB_R	ldub	[%r8 + %r9], %r12
	.word 0xf28a1009  ! 1398: LDUBA_R	lduba	[%r8, %r9] 0x80, %r25
	.word 0xcb3a0009  ! 1401: STDF_R	std	%f5, [%r9, %r8]
	.word 0xea0a0009  ! 1401: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0x86d20009  ! 1401: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xcc720009  ! 1404: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf71a0009  ! 1404: LDDF_R	ldd	[%r8, %r9], %f27
	.word 0xecfa217c  ! 1404: SWAPA_I	swapa	%r22, [%r8 + 0x017c] %asi
	.word 0xc8320009  ! 1407: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc9020009  ! 1407: LDF_R	ld	[%r8, %r9], %f4
	.word 0xce5a0009  ! 1407: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xcc320009  ! 1410: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca020009  ! 1410: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8143e045  ! 1410: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xee2a0009  ! 1413: STB_R	stb	%r23, [%r8 + %r9]
	.word 0xcc0a0009  ! 1413: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x9e720009  ! 1413: UDIV_R	udiv 	%r8, %r9, %r15
	.word 0xc2720009  ! 1416: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8520009  ! 1416: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x89a20929  ! 1416: FMULs	fmuls	%f8, %f9, %f4
	.word 0xea2a0009  ! 1419: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc9020009  ! 1419: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143e012  ! 1419: MEMBAR	membar	#StoreLoad | #Lookaside 
	.word 0xc9220009  ! 1422: STF_R	st	%f4, [%r9, %r8]
	.word 0xc91a0009  ! 1422: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcc822510  ! 1422: LDUWA_I	lduwa	[%r8, + 0x0510] %asi, %r6
	.word 0xcd220009  ! 1425: STF_R	st	%f6, [%r9, %r8]
	.word 0xcb1a0009  ! 1425: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xe41a0009  ! 1425: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc2320009  ! 1428: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc020009  ! 1428: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8143e018  ! 1428: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xdb3a0009  ! 1431: STDF_R	std	%f13, [%r9, %r8]
	.word 0xcc520009  ! 1431: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea2e88  ! 1431: PREFETCHA_I	prefetcha	[%r8, + 0x0e88] %asi, #one_read
	.word 0xcb3a0009  ! 1434: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc4120009  ! 1434: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x9da209a9  ! 1434: FDIVs	fdivs	%f8, %f9, %f14
	.word 0xc73a0009  ! 1437: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcb1a0009  ! 1437: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x99a208a9  ! 1437: FSUBs	fsubs	%f8, %f9, %f12
	.word 0xc8720009  ! 1440: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf60a0009  ! 1440: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0x8c7a0009  ! 1440: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0xca320009  ! 1443: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfa120009  ! 1443: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0xc36a0009  ! 1443: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcf220009  ! 1446: STF_R	st	%f7, [%r9, %r8]
	.word 0xce5a0009  ! 1446: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143c000  ! 1446: STBAR	stbar
	.word 0xcc2a0009  ! 1449: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 1449: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xcc5a2b60  ! 1449: LDX_I	ldx	[%r8 + 0x0b60], %r6
	.word 0xcc320009  ! 1452: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xe41a0009  ! 1452: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0xc3ea1009  ! 1452: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf3a0009  ! 1455: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc65a0009  ! 1455: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x0eca0001  ! 1455: BRGEZ	brgez  ,pt	%8,<label_0xa0001>
	.word 0xcc2a0009  ! 1458: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcb020009  ! 1458: LDF_R	ld	[%r8, %r9], %f5
	.word 0xccea2158  ! 1458: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x0158] %asi
	.word 0xc93a0009  ! 1461: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc65a0009  ! 1461: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1461: STBAR	stbar
	.word 0xc7220009  ! 1464: STF_R	st	%f3, [%r9, %r8]
	.word 0xc64a0009  ! 1464: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3ea1009  ! 1464: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcb220009  ! 1467: STF_R	st	%f5, [%r9, %r8]
	.word 0xc84a0009  ! 1467: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8ba20829  ! 1467: FADDs	fadds	%f8, %f9, %f5
	.word 0xc2720009  ! 1470: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xfe4a0009  ! 1470: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xb0720009  ! 1470: UDIV_R	udiv 	%r8, %r9, %r24
	.word 0xc93a0009  ! 1473: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc8020009  ! 1473: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 1473: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc3220009  ! 1476: STF_R	st	%f1, [%r9, %r8]
	.word 0xc44a0009  ! 1476: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xcc0a0009  ! 1476: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc73a0009  ! 1479: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc4120009  ! 1479: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x884a0009  ! 1479: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xda220009  ! 1482: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc2520009  ! 1482: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xca821009  ! 1482: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r5
	.word 0xc4220009  ! 1485: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xce0a0009  ! 1485: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xd6821009  ! 1485: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r11
	.word 0xd73a0009  ! 1488: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc41a0009  ! 1488: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143e01f  ! 1488: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xc7220009  ! 1491: STF_R	st	%f3, [%r9, %r8]
	.word 0xca520009  ! 1491: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc2ea1009  ! 1491: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xe2220009  ! 1494: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc8420009  ! 1494: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcefa1009  ! 1494: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xce320009  ! 1497: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 1497: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc2b22830  ! 1497: STHA_I	stha	%r1, [%r8 + 0x0830] %asi
	.word 0xf33a0009  ! 1500: STDF_R	std	%f25, [%r9, %r8]
	.word 0xca4a0009  ! 1500: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc33a2e10  ! 1500: STDF_I	std	%f1, [0x0e10, %r8]
	.word 0xca320009  ! 1503: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 1503: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xe81a2e20  ! 1503: LDD_I	ldd	[%r8 + 0x0e20], %r20
	.word 0xd6320009  ! 1506: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xce420009  ! 1506: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3220009  ! 1506: STF_R	st	%f1, [%r9, %r8]
	.word 0xcb3a0009  ! 1509: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfd020009  ! 1509: LDF_R	ld	[%r8, %r9], %f30
	.word 0x87a208a9  ! 1509: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xdd220009  ! 1512: STF_R	st	%f14, [%r9, %r8]
	.word 0xc2020009  ! 1512: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcea21009  ! 1512: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xfe320009  ! 1515: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc5020009  ! 1515: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc3ea1009  ! 1515: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc8720009  ! 1518: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xfc1a0009  ! 1518: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xce7a0009  ! 1518: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xc33a0009  ! 1521: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc1a0009  ! 1521: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1521: STBAR	stbar
	.word 0xca720009  ! 1524: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe84a0009  ! 1524: LDSB_R	ldsb	[%r8 + %r9], %r20
	.word 0xf4fa1009  ! 1524: SWAPA_R	swapa	%r26, [%r8 + %r9] 0x80
	.word 0xf6720009  ! 1527: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xd7020009  ! 1527: LDF_R	ld	[%r8, %r9], %f11
	.word 0x26800002  ! 1527: BL	bl,a	<label_0x2>
	.word 0xcf220009  ! 1530: STF_R	st	%f7, [%r9, %r8]
	.word 0xe25a0009  ! 1530: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xfa020009  ! 1530: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xc2220009  ! 1533: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 1533: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x887a0009  ! 1533: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xed3a0009  ! 1536: STDF_R	std	%f22, [%r9, %r8]
	.word 0xff1a0009  ! 1536: LDDF_R	ldd	[%r8, %r9], %f31
	.word 0xc3ea2574  ! 1536: PREFETCHA_I	prefetcha	[%r8, + 0x0574] %asi, #one_read
	.word 0xc4320009  ! 1539: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xde020009  ! 1539: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xb45a0009  ! 1539: SMUL_R	smul 	%r8, %r9, %r26
	.word 0xe4320009  ! 1542: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc81a0009  ! 1542: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xb4da2c28  ! 1542: SMULcc_I	smulcc 	%r8, 0x0c28, %r26
	.word 0xca220009  ! 1545: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 1545: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x1a800002  ! 1545: BCC	bcc  	<label_0x2>
	.word 0xc6320009  ! 1548: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xfa4a0009  ! 1548: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xc9e21009  ! 1548: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xf0720009  ! 1551: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xde520009  ! 1551: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x18800001  ! 1551: BGU	bgu  	<label_0x1>
	.word 0xe4220009  ! 1554: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xcc0a0009  ! 1554: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x896a2a3c  ! 1554: SDIVX_I	sdivx	%r8, 0x0a3c, %r4
	.word 0xc9220009  ! 1557: STF_R	st	%f4, [%r9, %r8]
	.word 0xc24a0009  ! 1557: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc65225a8  ! 1557: LDSH_I	ldsh	[%r8 + 0x05a8], %r3
	.word 0xeb3a0009  ! 1560: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc4020009  ! 1560: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x34800001  ! 1560: BG	bg,a	<label_0x1>
	.word 0xcf220009  ! 1563: STF_R	st	%f7, [%r9, %r8]
	.word 0xe00a0009  ! 1563: LDUB_R	ldub	[%r8 + %r9], %r16
	.word 0x8143c000  ! 1563: STBAR	stbar
	.word 0xcd3a0009  ! 1566: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc2020009  ! 1566: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x04800002  ! 1566: BLE	ble  	<label_0x2>
	.word 0xca320009  ! 1569: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6520009  ! 1569: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8f220009  ! 1569: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0xc5220009  ! 1572: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc020009  ! 1572: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc4fa2650  ! 1572: SWAPA_I	swapa	%r2, [%r8 + 0x0650] %asi
	.word 0xca720009  ! 1575: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc8120009  ! 1575: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 1575: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc7220009  ! 1578: STF_R	st	%f3, [%r9, %r8]
	.word 0xc2520009  ! 1578: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 1578: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc5220009  ! 1581: STF_R	st	%f2, [%r9, %r8]
	.word 0xc41a0009  ! 1581: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8cfa0009  ! 1581: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xc4320009  ! 1584: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe01a0009  ! 1584: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xa65a0009  ! 1584: SMUL_R	smul 	%r8, %r9, %r19
	.word 0xde220009  ! 1587: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xca5a0009  ! 1587: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc3ea1009  ! 1587: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc22a0009  ! 1590: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 1590: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc3ea234c  ! 1590: PREFETCHA_I	prefetcha	[%r8, + 0x034c] %asi, #one_read
	.word 0xf1220009  ! 1593: STF_R	st	%f24, [%r9, %r8]
	.word 0xc81a0009  ! 1593: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc46a2230  ! 1593: LDSTUB_I	ldstub	%r2, [%r8 + 0x0230]
	.word 0xeb220009  ! 1596: STF_R	st	%f21, [%r9, %r8]
	.word 0xce420009  ! 1596: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc80a2fb8  ! 1596: LDUB_I	ldub	[%r8 + 0x0fb8], %r4
	.word 0xc42a0009  ! 1599: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf24a0009  ! 1599: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0x02c20001  ! 1599: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xd6220009  ! 1602: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc20a0009  ! 1602: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc36a2bf0  ! 1602: PREFETCH_I	prefetch	[%r8 + 0x0bf0], #one_read
	.word 0xce720009  ! 1605: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc6420009  ! 1605: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc36a2a90  ! 1605: PREFETCH_I	prefetch	[%r8 + 0x0a90], #one_read
	.word 0xcd220009  ! 1608: STF_R	st	%f6, [%r9, %r8]
	.word 0xcb1a0009  ! 1608: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143e037  ! 1608: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xcf220009  ! 1611: STF_R	st	%f7, [%r9, %r8]
	.word 0xc7020009  ! 1611: LDF_R	ld	[%r8, %r9], %f3
	.word 0xf3f22009  ! 1611: CASXA_R	casxa	[%r8]%asi, %r9, %r25
	.word 0xc9220009  ! 1614: STF_R	st	%f4, [%r9, %r8]
	.word 0xe6420009  ! 1614: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0xc3ea2e08  ! 1614: PREFETCHA_I	prefetcha	[%r8, + 0x0e08] %asi, #one_read
	.word 0xe73a0009  ! 1617: STDF_R	std	%f19, [%r9, %r8]
	.word 0xda420009  ! 1617: LDSW_R	ldsw	[%r8 + %r9], %r13
	.word 0xfaca1009  ! 1617: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r29
	.word 0xca220009  ! 1620: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc25a0009  ! 1620: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc36a23b4  ! 1620: PREFETCH_I	prefetch	[%r8 + 0x03b4], #one_read
	.word 0xe0320009  ! 1623: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xcc1a0009  ! 1623: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x964a2cf4  ! 1623: MULX_I	mulx 	%r8, 0x0cf4, %r11
	.word 0xc22a0009  ! 1626: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xee520009  ! 1626: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x0c800001  ! 1626: BNEG	bneg  	<label_0x1>
	.word 0xc6720009  ! 1629: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca0a0009  ! 1629: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x14800001  ! 1629: BG	bg  	<label_0x1>
	.word 0xe1220009  ! 1632: STF_R	st	%f16, [%r9, %r8]
	.word 0xc64a0009  ! 1632: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xce4a2fbc  ! 1632: LDSB_I	ldsb	[%r8 + 0x0fbc], %r7
	.word 0xf5220009  ! 1635: STF_R	st	%f26, [%r9, %r8]
	.word 0xc91a0009  ! 1635: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc36a0009  ! 1635: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2320009  ! 1638: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe01a0009  ! 1638: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0xccf22600  ! 1638: STXA_I	stxa	%r6, [%r8 + 0x0600] %asi
	.word 0xe8320009  ! 1641: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xe0520009  ! 1641: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0x22ca0001  ! 1641: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xcf3a0009  ! 1644: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcc0a0009  ! 1644: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc5220009  ! 1644: STF_R	st	%f2, [%r9, %r8]
	.word 0xe6320009  ! 1647: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xf4420009  ! 1647: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc36a0009  ! 1647: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2220009  ! 1650: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 1650: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143c000  ! 1650: STBAR	stbar
	.word 0xe62a0009  ! 1653: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xe91a0009  ! 1653: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xfdf21009  ! 1653: CASXA_I	casxa	[%r8] 0x80, %r9, %r30
	.word 0xca220009  ! 1656: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf2520009  ! 1656: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0xc3ea2eec  ! 1656: PREFETCHA_I	prefetcha	[%r8, + 0x0eec] %asi, #one_read
	.word 0xc33a0009  ! 1659: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc6120009  ! 1659: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xf8921009  ! 1659: LDUHA_R	lduha	[%r8, %r9] 0x80, %r28
	.word 0xc42a0009  ! 1662: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcf1a0009  ! 1662: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xca5a2d30  ! 1662: LDX_I	ldx	[%r8 + 0x0d30], %r5
	.word 0xc4220009  ! 1665: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc2420009  ! 1665: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcc921009  ! 1665: LDUHA_R	lduha	[%r8, %r9] 0x80, %r6
	.word 0xcb3a0009  ! 1668: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce520009  ! 1668: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8cfa0009  ! 1668: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xce720009  ! 1671: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcc520009  ! 1671: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xf6b22cbc  ! 1671: STHA_I	stha	%r27, [%r8 + 0x0cbc] %asi
	.word 0xe6320009  ! 1674: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xc25a0009  ! 1674: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x876a0009  ! 1674: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xc6220009  ! 1677: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe40a0009  ! 1677: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xc71a25c8  ! 1677: LDDF_I	ldd	[%r8, 0x05c8], %f3
	.word 0xf9220009  ! 1680: STF_R	st	%f28, [%r9, %r8]
	.word 0xc65a0009  ! 1680: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1680: STBAR	stbar
	.word 0xc4320009  ! 1683: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xfa420009  ! 1683: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0xc3ea2bb8  ! 1683: PREFETCHA_I	prefetcha	[%r8, + 0x0bb8] %asi, #one_read
	.word 0xce220009  ! 1686: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe01a0009  ! 1686: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x88da2598  ! 1686: SMULcc_I	smulcc 	%r8, 0x0598, %r4
	.word 0xc8720009  ! 1689: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xec1a0009  ! 1689: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x8e5a2e0c  ! 1689: SMUL_I	smul 	%r8, 0x0e0c, %r7
	.word 0xc2720009  ! 1692: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 1692: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x844a2ba4  ! 1692: MULX_I	mulx 	%r8, 0x0ba4, %r2
	.word 0xe93a0009  ! 1695: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc85a0009  ! 1695: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xdefa26b8  ! 1695: SWAPA_I	swapa	%r15, [%r8 + 0x06b8] %asi
	.word 0xf2220009  ! 1698: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xed020009  ! 1698: LDF_R	ld	[%r8, %r9], %f22
	.word 0x8cd20009  ! 1698: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xc53a0009  ! 1701: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc420009  ! 1701: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc3f22009  ! 1701: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xcc320009  ! 1704: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfb1a0009  ! 1704: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xc3ea1009  ! 1704: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4320009  ! 1707: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcb1a0009  ! 1707: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xe46a0009  ! 1707: LDSTUB_R	ldstub	%r18, [%r8 + %r9]
	.word 0xcc2a0009  ! 1710: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf05a0009  ! 1710: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x26c20001  ! 1710: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xce720009  ! 1713: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 1713: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea2238  ! 1713: PREFETCHA_I	prefetcha	[%r8, + 0x0238] %asi, #one_read
	.word 0xc6220009  ! 1716: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 1716: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x3e800001  ! 1716: BVC	bvc,a	<label_0x1>
	.word 0xc8720009  ! 1719: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc020009  ! 1719: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 1719: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca320009  ! 1722: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc71a0009  ! 1722: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0x8143c000  ! 1722: STBAR	stbar
	.word 0xc2320009  ! 1725: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 1725: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc4ba2d78  ! 1725: STDA_I	stda	%r2, [%r8 + 0x0d78] %asi
	.word 0xd8720009  ! 1728: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xca4a0009  ! 1728: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143e026  ! 1728: MEMBAR	membar	#StoreLoad | #LoadStore | #MemIssue 
	.word 0xc6720009  ! 1731: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc020009  ! 1731: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xbfa208a9  ! 1731: FSUBs	fsubs	%f8, %f9, %f31
	.word 0xc9220009  ! 1734: STF_R	st	%f4, [%r9, %r8]
	.word 0xf41a0009  ! 1734: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xc36a2cac  ! 1734: PREFETCH_I	prefetch	[%r8 + 0x0cac], #one_read
	.word 0xcb220009  ! 1737: STF_R	st	%f5, [%r9, %r8]
	.word 0xc31a0009  ! 1737: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x87a209a9  ! 1737: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xe4320009  ! 1740: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xdc5a0009  ! 1740: LDX_R	ldx	[%r8 + %r9], %r14
	.word 0x8143e04e  ! 1740: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xc6220009  ! 1743: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe8520009  ! 1743: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0x40000001  ! 1743: CALL	call	disp30_1
	.word 0xc62a0009  ! 1746: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce420009  ! 1746: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xdd02241c  ! 1746: LDF_I	ld	[%r8, 0x041c], %f14
	.word 0xc6320009  ! 1749: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xd65a0009  ! 1749: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xe27a0009  ! 1749: SWAP_R	swap	%r17, [%r8 + %r9]
	.word 0xde720009  ! 1752: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xdf020009  ! 1752: LDF_R	ld	[%r8, %r9], %f15
	.word 0xc8022e3c  ! 1752: LDUW_I	lduw	[%r8 + 0x0e3c], %r4
	.word 0xe8720009  ! 1755: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xd81a0009  ! 1755: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xf13a2d10  ! 1755: STDF_I	std	%f24, [0x0d10, %r8]
	.word 0xc42a0009  ! 1758: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf64a0009  ! 1758: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x876a0009  ! 1758: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0xca720009  ! 1761: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xde420009  ! 1761: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xcef21009  ! 1761: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 1764: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 1764: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8143e04a  ! 1764: MEMBAR	membar	#StoreLoad | #StoreStore | #Sync 
	.word 0xe73a0009  ! 1767: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc81a0009  ! 1767: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8ba20829  ! 1767: FADDs	fadds	%f8, %f9, %f5
	.word 0xe33a0009  ! 1770: STDF_R	std	%f17, [%r9, %r8]
	.word 0xc91a0009  ! 1770: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xf8fa1009  ! 1770: SWAPA_R	swapa	%r28, [%r8 + %r9] 0x80
	.word 0xe8720009  ! 1773: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xde520009  ! 1773: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xc36a0009  ! 1773: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe9220009  ! 1776: STF_R	st	%f20, [%r9, %r8]
	.word 0xc45a0009  ! 1776: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc28a2a04  ! 1776: LDUBA_I	lduba	[%r8, + 0x0a04] %asi, %r1
	.word 0xce220009  ! 1779: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfa020009  ! 1779: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0xfa0a2d08  ! 1779: LDUB_I	ldub	[%r8 + 0x0d08], %r29
	.word 0xde320009  ! 1782: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc81a0009  ! 1782: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc3ea222c  ! 1782: PREFETCHA_I	prefetcha	[%r8, + 0x022c] %asi, #one_read
	.word 0xc73a0009  ! 1785: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc60a0009  ! 1785: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8143c000  ! 1785: STBAR	stbar
	.word 0xca720009  ! 1788: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 1788: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xce8a21c8  ! 1788: LDUBA_I	lduba	[%r8, + 0x01c8] %asi, %r7
	.word 0xc62a0009  ! 1791: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 1791: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 1791: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc2720009  ! 1794: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 1794: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xd73a0009  ! 1794: STDF_R	std	%f11, [%r9, %r8]
	.word 0xc93a0009  ! 1797: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcd1a0009  ! 1797: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x86520009  ! 1797: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xfe320009  ! 1800: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc41a0009  ! 1800: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 1800: STBAR	stbar
	.word 0xd7220009  ! 1803: STF_R	st	%f11, [%r9, %r8]
	.word 0xfe120009  ! 1803: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xccba1009  ! 1803: STDA_R	stda	%r6, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 1806: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca420009  ! 1806: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xdaf22438  ! 1806: STXA_I	stxa	%r13, [%r8 + 0x0438] %asi
	.word 0xf6720009  ! 1809: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xda0a0009  ! 1809: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0x24800001  ! 1809: BLE	ble,a	<label_0x1>
	.word 0xcc2a0009  ! 1812: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf81a0009  ! 1812: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x8cda0009  ! 1812: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0xe82a0009  ! 1815: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc2120009  ! 1815: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xe6b21009  ! 1815: STHA_R	stha	%r19, [%r8 + %r9] 0x80
	.word 0xc62a0009  ! 1818: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca520009  ! 1818: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x32800002  ! 1818: BNE	bne,a	<label_0x2>
	.word 0xc6720009  ! 1821: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 1821: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xeeaa1009  ! 1821: STBA_R	stba	%r23, [%r8 + %r9] 0x80
	.word 0xf22a0009  ! 1824: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc71a0009  ! 1824: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc36a0009  ! 1824: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc82a0009  ! 1827: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xd7020009  ! 1827: LDF_R	ld	[%r8, %r9], %f11
	.word 0x84722370  ! 1827: UDIV_I	udiv 	%r8, 0x0370, %r2
	.word 0xc2320009  ! 1830: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 1830: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xc46a0009  ! 1830: LDSTUB_R	ldstub	%r2, [%r8 + %r9]
	.word 0xca2a0009  ! 1833: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd84a0009  ! 1833: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0x8d2222f8  ! 1833: MULScc_I	mulscc 	%r8, 0x02f8, %r6
	.word 0xc4220009  ! 1836: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xec0a0009  ! 1836: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x8ba20829  ! 1836: FADDs	fadds	%f8, %f9, %f5
	.word 0xce220009  ! 1839: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 1839: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x87222164  ! 1839: MULScc_I	mulscc 	%r8, 0x0164, %r3
	.word 0xc5220009  ! 1842: STF_R	st	%f2, [%r9, %r8]
	.word 0xeb1a0009  ! 1842: LDDF_R	ldd	[%r8, %r9], %f21
	.word 0xeaa22990  ! 1842: STWA_I	stwa	%r21, [%r8 + 0x0990] %asi
	.word 0xed220009  ! 1845: STF_R	st	%f22, [%r9, %r8]
	.word 0xf01a0009  ! 1845: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0xb3a209a9  ! 1845: FDIVs	fdivs	%f8, %f9, %f25
	.word 0xce220009  ! 1848: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 1848: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xb9a20929  ! 1848: FMULs	fmuls	%f8, %f9, %f28
	.word 0xcc2a0009  ! 1851: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 1851: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xcbf22009  ! 1851: CASXA_R	casxa	[%r8]%asi, %r9, %r5
	.word 0xcc220009  ! 1854: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce420009  ! 1854: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc6fa221c  ! 1854: SWAPA_I	swapa	%r3, [%r8 + 0x021c] %asi
	.word 0xce2a0009  ! 1857: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc71a0009  ! 1857: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xa8720009  ! 1857: UDIV_R	udiv 	%r8, %r9, %r20
	.word 0xc5220009  ! 1860: STF_R	st	%f2, [%r9, %r8]
	.word 0xc6020009  ! 1860: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc44226ec  ! 1860: LDSW_I	ldsw	[%r8 + 0x06ec], %r2
	.word 0xcc2a0009  ! 1863: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe0020009  ! 1863: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x824a29c0  ! 1863: MULX_I	mulx 	%r8, 0x09c0, %r1
	.word 0xcd3a0009  ! 1866: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc1a0009  ! 1866: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x02800001  ! 1866: BE	be  	<label_0x1>
	.word 0xc6320009  ! 1869: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce020009  ! 1869: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc84a2d24  ! 1869: LDSB_I	ldsb	[%r8 + 0x0d24], %r4
	.word 0xc53a0009  ! 1872: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc20a0009  ! 1872: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x0aca0001  ! 1872: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xca220009  ! 1875: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc41a0009  ! 1875: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xfe120009  ! 1875: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xda2a0009  ! 1878: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xc8120009  ! 1878: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xc36a24f8  ! 1878: PREFETCH_I	prefetch	[%r8 + 0x04f8], #one_read
	.word 0xcd220009  ! 1881: STF_R	st	%f6, [%r9, %r8]
	.word 0xfb1a0009  ! 1881: LDDF_R	ldd	[%r8, %r9], %f29
	.word 0xa8da22f4  ! 1881: SMULcc_I	smulcc 	%r8, 0x02f4, %r20
	.word 0xcd3a0009  ! 1884: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcc4a0009  ! 1884: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xf2da2c90  ! 1884: LDXA_I	ldxa	[%r8, + 0x0c90] %asi, %r25
	.word 0xcf3a0009  ! 1887: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc3020009  ! 1887: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e02c  ! 1887: MEMBAR	membar	#LoadStore | #StoreStore | #MemIssue 
	.word 0xf73a0009  ! 1890: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc71a0009  ! 1890: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xeef21009  ! 1890: STXA_R	stxa	%r23, [%r8 + %r9] 0x80
	.word 0xc22a0009  ! 1893: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca5a0009  ! 1893: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc36a2814  ! 1893: PREFETCH_I	prefetch	[%r8 + 0x0814], #one_read
	.word 0xe33a0009  ! 1896: STDF_R	std	%f17, [%r9, %r8]
	.word 0xca120009  ! 1896: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8143c000  ! 1896: STBAR	stbar
	.word 0xee220009  ! 1899: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc80a0009  ! 1899: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc3ea1009  ! 1899: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca2a0009  ! 1902: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf6520009  ! 1902: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0x8d6a0009  ! 1902: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0xde220009  ! 1905: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xcb1a0009  ! 1905: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xa36a0009  ! 1905: SDIVX_R	sdivx	%r8, %r9, %r17
	.word 0xc33a0009  ! 1908: STDF_R	std	%f1, [%r9, %r8]
	.word 0xea020009  ! 1908: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xdab22320  ! 1908: STHA_I	stha	%r13, [%r8 + 0x0320] %asi
	.word 0xfd220009  ! 1911: STF_R	st	%f30, [%r9, %r8]
	.word 0xc6020009  ! 1911: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xfa122560  ! 1911: LDUH_I	lduh	[%r8 + 0x0560], %r29
	.word 0xc2320009  ! 1914: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc9020009  ! 1914: LDF_R	ld	[%r8, %r9], %f4
	.word 0xf49a2400  ! 1914: LDDA_I	ldda	[%r8, + 0x0400] %asi, %r26
	.word 0xca720009  ! 1917: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf80a0009  ! 1917: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0xc36a0009  ! 1917: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe4720009  ! 1920: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc5020009  ! 1920: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8cda22dc  ! 1920: SMULcc_I	smulcc 	%r8, 0x02dc, %r6
	.word 0xea320009  ! 1923: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xcc1a0009  ! 1923: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8d220009  ! 1923: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xfc720009  ! 1926: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc01a0009  ! 1926: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xdeca2ca4  ! 1926: LDSBA_I	ldsba	[%r8, + 0x0ca4] %asi, %r15
	.word 0xe8220009  ! 1929: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xce420009  ! 1929: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x82da0009  ! 1929: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xc2720009  ! 1932: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xda120009  ! 1932: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xcd3a0009  ! 1932: STDF_R	std	%f6, [%r9, %r8]
	.word 0xff3a0009  ! 1935: STDF_R	std	%f31, [%r9, %r8]
	.word 0xca520009  ! 1935: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xe4b21009  ! 1935: STHA_R	stha	%r18, [%r8 + %r9] 0x80
	.word 0xd6220009  ! 1938: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xc80a0009  ! 1938: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xdea221e0  ! 1938: STWA_I	stwa	%r15, [%r8 + 0x01e0] %asi
	.word 0xc4720009  ! 1941: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcb1a0009  ! 1941: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xf8a2265c  ! 1941: STWA_I	stwa	%r28, [%r8 + 0x065c] %asi
	.word 0xc8320009  ! 1944: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc8120009  ! 1944: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8143e075  ! 1944: MEMBAR	membar	#LoadLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
	.word 0xce220009  ! 1947: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe4520009  ! 1947: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xca420009  ! 1947: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xdf3a0009  ! 1950: STDF_R	std	%f15, [%r9, %r8]
	.word 0xe04a0009  ! 1950: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xc8122bb0  ! 1950: LDUH_I	lduh	[%r8 + 0x0bb0], %r4
	.word 0xe93a0009  ! 1953: STDF_R	std	%f20, [%r9, %r8]
	.word 0xc6420009  ! 1953: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x2ec20001  ! 1953: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xcc2a0009  ! 1956: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xe05a0009  ! 1956: LDX_R	ldx	[%r8 + %r9], %r16
	.word 0xe1220009  ! 1956: STF_R	st	%f16, [%r9, %r8]
	.word 0xcd3a0009  ! 1959: STDF_R	std	%f6, [%r9, %r8]
	.word 0xec120009  ! 1959: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xb6f225e0  ! 1959: UDIVcc_I	udivcc 	%r8, 0x05e0, %r27
	.word 0xdc320009  ! 1962: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xcb1a0009  ! 1962: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xacda0009  ! 1962: SMULcc_R	smulcc 	%r8, %r9, %r22
	.word 0xca720009  ! 1965: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xe04a0009  ! 1965: LDSB_R	ldsb	[%r8 + %r9], %r16
	.word 0xf6f21009  ! 1965: STXA_R	stxa	%r27, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 1968: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfd1a0009  ! 1968: LDDF_R	ldd	[%r8, %r9], %f30
	.word 0xc4d22e0c  ! 1968: LDSHA_I	ldsha	[%r8, + 0x0e0c] %asi, %r2
	.word 0xfa220009  ! 1971: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xf5020009  ! 1971: LDF_R	ld	[%r8, %r9], %f26
	.word 0xeef21009  ! 1971: STXA_R	stxa	%r23, [%r8 + %r9] 0x80
	.word 0xcc720009  ! 1974: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc8420009  ! 1974: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8143e07d  ! 1974: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf2320009  ! 1977: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc5020009  ! 1977: LDF_R	ld	[%r8, %r9], %f2
	.word 0xc2ca2bec  ! 1977: LDSBA_I	ldsba	[%r8, + 0x0bec] %asi, %r1
	.word 0xc93a0009  ! 1980: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc41a0009  ! 1980: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 1980: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc33a0009  ! 1983: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc0a0009  ! 1983: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143e02a  ! 1983: MEMBAR	membar	#StoreLoad | #StoreStore | #MemIssue 
	.word 0xcc220009  ! 1986: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce420009  ! 1986: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8143c000  ! 1986: STBAR	stbar
	.word 0xc73a0009  ! 1989: STDF_R	std	%f3, [%r9, %r8]
	.word 0xd91a0009  ! 1989: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xe1220009  ! 1989: STF_R	st	%f16, [%r9, %r8]
	.word 0xfb220009  ! 1992: STF_R	st	%f29, [%r9, %r8]
	.word 0xc2520009  ! 1992: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xe482251c  ! 1992: LDUWA_I	lduwa	[%r8, + 0x051c] %asi, %r18
	.word 0xcd220009  ! 1995: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc020009  ! 1995: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x82520009  ! 1995: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xcf220009  ! 1998: STF_R	st	%f7, [%r9, %r8]
	.word 0xc60a0009  ! 1998: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xfaa22a78  ! 1998: STWA_I	stwa	%r29, [%r8 + 0x0a78] %asi
	.word 0xe42a0009  ! 2001: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xe0020009  ! 2001: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0xc6c21009  ! 2001: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r3
	.word 0xfe2a0009  ! 2004: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xcb020009  ! 2004: LDF_R	ld	[%r8, %r9], %f5
	.word 0x8143c000  ! 2004: STBAR	stbar
	.word 0xe2720009  ! 2007: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xce5a0009  ! 2007: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc6fa1009  ! 2007: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xd82a0009  ! 2010: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xc4120009  ! 2010: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xbe7a0009  ! 2010: SDIV_R	sdiv 	%r8, %r9, %r31
	.word 0xe2320009  ! 2013: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xcc520009  ! 2013: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xa4f228e0  ! 2013: UDIVcc_I	udivcc 	%r8, 0x08e0, %r18
	.word 0xcd3a0009  ! 2016: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc9020009  ! 2016: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc87a2664  ! 2016: SWAP_I	swap	%r4, [%r8 + 0x0664]
	.word 0xd62a0009  ! 2019: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xe44a0009  ! 2019: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0x8143e078  ! 2019: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xf6220009  ! 2022: STW_R	stw	%r27, [%r8 + %r9]
	.word 0xc4420009  ! 2022: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xccd21009  ! 2022: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xcd220009  ! 2025: STF_R	st	%f6, [%r9, %r8]
	.word 0xdd1a0009  ! 2025: LDDF_R	ldd	[%r8, %r9], %f14
	.word 0xc2c22a9c  ! 2025: LDSWA_I	ldswa	[%r8, + 0x0a9c] %asi, %r1
	.word 0xc9220009  ! 2028: STF_R	st	%f4, [%r9, %r8]
	.word 0xe0420009  ! 2028: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x8143e068  ! 2028: MEMBAR	membar	#StoreStore | #MemIssue | #Sync 
	.word 0xcd220009  ! 2031: STF_R	st	%f6, [%r9, %r8]
	.word 0xc31a0009  ! 2031: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc3ea1009  ! 2031: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc6320009  ! 2034: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xda520009  ! 2034: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0x0ac20001  ! 2034: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xdd3a0009  ! 2037: STDF_R	std	%f14, [%r9, %r8]
	.word 0xc80a0009  ! 2037: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xbc6a293c  ! 2037: UDIVX_I	udivx 	%r8, 0x093c, %r30
	.word 0xce720009  ! 2040: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xcb020009  ! 2040: LDF_R	ld	[%r8, %r9], %f5
	.word 0xb4520009  ! 2040: UMUL_R	umul 	%r8, %r9, %r26
	.word 0xf8320009  ! 2043: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xfc1a0009  ! 2043: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xe4b21009  ! 2043: STHA_R	stha	%r18, [%r8 + %r9] 0x80
	.word 0xf73a0009  ! 2046: STDF_R	std	%f27, [%r9, %r8]
	.word 0xf2020009  ! 2046: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xef3a0009  ! 2046: STDF_R	std	%f23, [%r9, %r8]
	.word 0xce720009  ! 2049: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xf2420009  ! 2049: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xc6aa2fd0  ! 2049: STBA_I	stba	%r3, [%r8 + 0x0fd0] %asi
	.word 0xc8220009  ! 2052: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf4520009  ! 2052: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0xc2422b28  ! 2052: LDSW_I	ldsw	[%r8 + 0x0b28], %r1
	.word 0xee320009  ! 2055: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc81a0009  ! 2055: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x824a0009  ! 2055: MULX_R	mulx 	%r8, %r9, %r1
	.word 0xcb3a0009  ! 2058: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe40a0009  ! 2058: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xc36a2928  ! 2058: PREFETCH_I	prefetch	[%r8 + 0x0928], #one_read
	.word 0xc7220009  ! 2061: STF_R	st	%f3, [%r9, %r8]
	.word 0xdc020009  ! 2061: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0x18800002  ! 2061: BGU	bgu  	<label_0x2>
	.word 0xcb3a0009  ! 2064: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc120009  ! 2064: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xe4a22f64  ! 2064: STWA_I	stwa	%r18, [%r8 + 0x0f64] %asi
	.word 0xf3220009  ! 2067: STF_R	st	%f25, [%r9, %r8]
	.word 0xc80a0009  ! 2067: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xc7f22009  ! 2067: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xca720009  ! 2070: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcb1a0009  ! 2070: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xe9220009  ! 2070: STF_R	st	%f20, [%r9, %r8]
	.word 0xf22a0009  ! 2073: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xcf1a0009  ! 2073: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8f6a2af4  ! 2073: SDIVX_I	sdivx	%r8, 0x0af4, %r7
	.word 0xf02a0009  ! 2076: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xcf020009  ! 2076: LDF_R	ld	[%r8, %r9], %f7
	.word 0xcb1a0009  ! 2076: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc73a0009  ! 2079: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca4a0009  ! 2079: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xdc6a2afc  ! 2079: LDSTUB_I	ldstub	%r14, [%r8 + 0x0afc]
	.word 0xc6220009  ! 2082: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc85a0009  ! 2082: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x04800001  ! 2082: BLE	ble  	<label_0x1>
	.word 0xd8320009  ! 2085: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xec4a0009  ! 2085: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xe6a22a10  ! 2085: STWA_I	stwa	%r19, [%r8 + 0x0a10] %asi
	.word 0xc2720009  ! 2088: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc9020009  ! 2088: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8cd22094  ! 2088: UMULcc_I	umulcc 	%r8, 0x0094, %r6
	.word 0xc6320009  ! 2091: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc9020009  ! 2091: LDF_R	ld	[%r8, %r9], %f4
	.word 0x8143c000  ! 2091: STBAR	stbar
	.word 0xc82a0009  ! 2094: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca0a0009  ! 2094: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0xc36a2014  ! 2094: PREFETCH_I	prefetch	[%r8 + 0x0014], #one_read
	.word 0xd82a0009  ! 2097: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xca020009  ! 2097: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc3e22009  ! 2097: CASA_R	casa	[%r8] %asi, %r9, %r1
	.word 0xc8720009  ! 2100: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcb020009  ! 2100: LDF_R	ld	[%r8, %r9], %f5
	.word 0xa86a2fe8  ! 2100: UDIVX_I	udivx 	%r8, 0x0fe8, %r20
	.word 0xe6320009  ! 2103: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xce520009  ! 2103: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 2103: STBAR	stbar
	.word 0xc33a0009  ! 2106: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4520009  ! 2106: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xce020009  ! 2106: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc42a0009  ! 2109: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 2109: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x0a800002  ! 2109: BCS	bcs  	<label_0x2>
	.word 0xf73a0009  ! 2112: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc7020009  ! 2112: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e029  ! 2112: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xc2320009  ! 2115: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xec4a0009  ! 2115: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0x85a20829  ! 2115: FADDs	fadds	%f8, %f9, %f2
	.word 0xce2a0009  ! 2118: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc6120009  ! 2118: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x2ec20001  ! 2118: BRGEZ	brgez,a,nt	%8,<label_0x20001>
	.word 0xc8320009  ! 2121: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca420009  ! 2121: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8a4a2b5c  ! 2121: MULX_I	mulx 	%r8, 0x0b5c, %r5
	.word 0xc4320009  ! 2124: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc60a0009  ! 2124: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xdb3a0009  ! 2124: STDF_R	std	%f13, [%r9, %r8]
	.word 0xd62a0009  ! 2127: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xe8520009  ! 2127: LDSH_R	ldsh	[%r8 + %r9], %r20
	.word 0xb86a0009  ! 2127: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0xc2220009  ! 2130: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 2130: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8ef20009  ! 2130: UDIVcc_R	udivcc 	%r8, %r9, %r7
	.word 0xf8220009  ! 2133: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xe31a0009  ! 2133: LDDF_R	ldd	[%r8, %r9], %f17
	.word 0x24800001  ! 2133: BLE	ble,a	<label_0x1>
	.word 0xda720009  ! 2136: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xc2420009  ! 2136: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xc4f22c88  ! 2136: STXA_I	stxa	%r2, [%r8 + 0x0c88] %asi
	.word 0xcd3a0009  ! 2139: STDF_R	std	%f6, [%r9, %r8]
	.word 0xde520009  ! 2139: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x8143c000  ! 2139: STBAR	stbar
	.word 0xf7220009  ! 2142: STF_R	st	%f27, [%r9, %r8]
	.word 0xc4120009  ! 2142: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xe2ca1009  ! 2142: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r17
	.word 0xe0320009  ! 2145: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xf84a0009  ! 2145: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x8143e02b  ! 2145: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue 
	.word 0xc8320009  ! 2148: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xec4a0009  ! 2148: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xfcba1009  ! 2148: STDA_R	stda	%r30, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 2151: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf85a0009  ! 2151: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0xc3ea27dc  ! 2151: PREFETCHA_I	prefetcha	[%r8, + 0x07dc] %asi, #one_read
	.word 0xfe220009  ! 2154: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xe0520009  ! 2154: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xc8a21009  ! 2154: STWA_R	stwa	%r4, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 2157: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xd91a0009  ! 2157: LDDF_R	ldd	[%r8, %r9], %f12
	.word 0xc36a2718  ! 2157: PREFETCH_I	prefetch	[%r8 + 0x0718], #one_read
	.word 0xf2320009  ! 2160: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xc41a0009  ! 2160: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143e038  ! 2160: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xff3a0009  ! 2163: STDF_R	std	%f31, [%r9, %r8]
	.word 0xc41a0009  ! 2163: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc4f22c00  ! 2163: STXA_I	stxa	%r2, [%r8 + 0x0c00] %asi
	.word 0xc8720009  ! 2166: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xdc020009  ! 2166: LDUW_R	lduw	[%r8 + %r9], %r14
	.word 0xcff22009  ! 2166: CASXA_R	casxa	[%r8]%asi, %r9, %r7
	.word 0xcf3a0009  ! 2169: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfe020009  ! 2169: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xa2d20009  ! 2169: UMULcc_R	umulcc 	%r8, %r9, %r17
	.word 0xf6720009  ! 2172: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xe40a0009  ! 2172: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xc4821009  ! 2172: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xcc220009  ! 2175: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 2175: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8143e067  ! 2175: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #MemIssue | #Sync 
	.word 0xf6720009  ! 2178: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc51a0009  ! 2178: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xaa522614  ! 2178: UMUL_I	umul 	%r8, 0x0614, %r21
	.word 0xce320009  ! 2181: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce020009  ! 2181: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcc1a0009  ! 2181: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xd8220009  ! 2184: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xfb020009  ! 2184: LDF_R	ld	[%r8, %r9], %f29
	.word 0xc5e22009  ! 2184: CASA_R	casa	[%r8] %asi, %r9, %r2
	.word 0xc82a0009  ! 2187: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2020009  ! 2187: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xbfa208a9  ! 2187: FSUBs	fsubs	%f8, %f9, %f31
	.word 0xcd220009  ! 2190: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc1a0009  ! 2190: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xac7a0009  ! 2190: SDIV_R	sdiv 	%r8, %r9, %r22
	.word 0xc53a0009  ! 2193: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc65a0009  ! 2193: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc49a2fc8  ! 2193: LDDA_I	ldda	[%r8, + 0x0fc8] %asi, %r2
	.word 0xce320009  ! 2196: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xd7020009  ! 2196: LDF_R	ld	[%r8, %r9], %f11
	.word 0xc6122280  ! 2196: LDUH_I	lduh	[%r8 + 0x0280], %r3
	.word 0xea220009  ! 2199: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xcc4a0009  ! 2199: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xc3ea2364  ! 2199: PREFETCHA_I	prefetcha	[%r8, + 0x0364] %asi, #one_read
	.word 0xc8220009  ! 2202: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 2202: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x88d22bcc  ! 2202: UMULcc_I	umulcc 	%r8, 0x0bcc, %r4
	.word 0xf42a0009  ! 2205: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xce0a0009  ! 2205: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc36a2420  ! 2205: PREFETCH_I	prefetch	[%r8 + 0x0420], #one_read
	.word 0xc5220009  ! 2208: STF_R	st	%f2, [%r9, %r8]
	.word 0xc51a0009  ! 2208: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xcd220009  ! 2208: STF_R	st	%f6, [%r9, %r8]
	.word 0xe93a0009  ! 2211: STDF_R	std	%f20, [%r9, %r8]
	.word 0xcb1a0009  ! 2211: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xcc520009  ! 2211: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcc2a0009  ! 2214: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc40a0009  ! 2214: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x1c800001  ! 2214: BPOS	bpos  	<label_0x1>
	.word 0xcd3a0009  ! 2217: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc6520009  ! 2217: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x8e5a0009  ! 2217: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xc93a0009  ! 2220: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc80a0009  ! 2220: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143e07d  ! 2220: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xe33a0009  ! 2223: STDF_R	std	%f17, [%r9, %r8]
	.word 0xee420009  ! 2223: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xaba20929  ! 2223: FMULs	fmuls	%f8, %f9, %f21
	.word 0xc73a0009  ! 2226: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc80a0009  ! 2226: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xfde22009  ! 2226: CASA_R	casa	[%r8] %asi, %r9, %r30
	.word 0xe8320009  ! 2229: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xec120009  ! 2229: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0xc4c21009  ! 2229: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xce2a0009  ! 2232: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe25a0009  ! 2232: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xe66a2a5c  ! 2232: LDSTUB_I	ldstub	%r19, [%r8 + 0x0a5c]
	.word 0xcc2a0009  ! 2235: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf0020009  ! 2235: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xcc0a0009  ! 2235: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xdd3a0009  ! 2238: STDF_R	std	%f14, [%r9, %r8]
	.word 0xc4420009  ! 2238: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc36a0009  ! 2238: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc7220009  ! 2241: STF_R	st	%f3, [%r9, %r8]
	.word 0xe6520009  ! 2241: LDSH_R	ldsh	[%r8 + %r9], %r19
	.word 0xb84a27bc  ! 2241: MULX_I	mulx 	%r8, 0x07bc, %r28
	.word 0xcd220009  ! 2244: STF_R	st	%f6, [%r9, %r8]
	.word 0xcc4a0009  ! 2244: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x2e800001  ! 2244: BVS	bvs,a	<label_0x1>
	.word 0xc8320009  ! 2247: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 2247: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x2a800001  ! 2247: BCS	bcs,a	<label_0x1>
	.word 0xf42a0009  ! 2250: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xc2020009  ! 2250: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc4a21009  ! 2250: STWA_R	stwa	%r2, [%r8 + %r9] 0x80
	.word 0xd8320009  ! 2253: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xd8020009  ! 2253: LDUW_R	lduw	[%r8 + %r9], %r12
	.word 0xc49a1009  ! 2253: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xfe2a0009  ! 2256: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xf8420009  ! 2256: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0x06800001  ! 2256: BL	bl  	<label_0x1>
	.word 0xcc220009  ! 2259: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc71a0009  ! 2259: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc3ea25cc  ! 2259: PREFETCHA_I	prefetcha	[%r8, + 0x05cc] %asi, #one_read
	.word 0xe22a0009  ! 2262: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xce520009  ! 2262: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xbb6a2a18  ! 2262: SDIVX_I	sdivx	%r8, 0x0a18, %r29
	.word 0xe93a0009  ! 2265: STDF_R	std	%f20, [%r9, %r8]
	.word 0xcd020009  ! 2265: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc80a25f0  ! 2265: LDUB_I	ldub	[%r8 + 0x05f0], %r4
	.word 0xc6720009  ! 2268: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc91a0009  ! 2268: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x886a0009  ! 2268: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc8720009  ! 2271: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc7020009  ! 2271: LDF_R	ld	[%r8, %r9], %f3
	.word 0xfb222f3c  ! 2271: STF_I	st	%f29, [0x0f3c, %r8]
	.word 0xde2a0009  ! 2274: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xf8420009  ! 2274: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0x8e5a2f98  ! 2274: SMUL_I	smul 	%r8, 0x0f98, %r7
	.word 0xc4720009  ! 2277: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xce0a0009  ! 2277: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xe89a1009  ! 2277: LDDA_R	ldda	[%r8, %r9] 0x80, %r20
	.word 0xd8320009  ! 2280: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xe9020009  ! 2280: LDF_R	ld	[%r8, %r9], %f20
	.word 0x04800001  ! 2280: BLE	ble  	<label_0x1>
	.word 0xc6720009  ! 2283: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xe4420009  ! 2283: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xc8ba2140  ! 2283: STDA_I	stda	%r4, [%r8 + 0x0140] %asi
	.word 0xe4320009  ! 2286: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xcc0a0009  ! 2286: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc6f21009  ! 2286: STXA_R	stxa	%r3, [%r8 + %r9] 0x80
	.word 0xce2a0009  ! 2289: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce420009  ! 2289: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcad21009  ! 2289: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0xc8320009  ! 2292: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc40a0009  ! 2292: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xbf6a2c98  ! 2292: SDIVX_I	sdivx	%r8, 0x0c98, %r31
	.word 0xca320009  ! 2295: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce520009  ! 2295: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xccca2940  ! 2295: LDSBA_I	ldsba	[%r8, + 0x0940] %asi, %r6
	.word 0xda2a0009  ! 2298: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xf8120009  ! 2298: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0x8143c000  ! 2298: STBAR	stbar
	.word 0xe0220009  ! 2301: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc3020009  ! 2301: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3ea1009  ! 2301: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc42a0009  ! 2304: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe25a0009  ! 2304: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x8143e047  ! 2304: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xc4720009  ! 2307: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc80a0009  ! 2307: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xb4fa2228  ! 2307: SDIVcc_I	sdivcc 	%r8, 0x0228, %r26
	.word 0xe2320009  ! 2310: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xca520009  ! 2310: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc4c21009  ! 2310: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r2
	.word 0xfe220009  ! 2313: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xfd020009  ! 2313: LDF_R	ld	[%r8, %r9], %f30
	.word 0xdd220009  ! 2313: STF_R	st	%f14, [%r9, %r8]
	.word 0xce320009  ! 2316: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc45a0009  ! 2316: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xce7a28fc  ! 2316: SWAP_I	swap	%r7, [%r8 + 0x08fc]
	.word 0xc8320009  ! 2319: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf41a0009  ! 2319: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0x8143c000  ! 2319: STBAR	stbar
	.word 0xcd3a0009  ! 2322: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe2020009  ! 2322: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0x26800001  ! 2322: BL	bl,a	<label_0x1>
	.word 0xcb220009  ! 2325: STF_R	st	%f5, [%r9, %r8]
	.word 0xd84a0009  ! 2325: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xc50225ac  ! 2325: LDF_I	ld	[%r8, 0x05ac], %f2
	.word 0xce320009  ! 2328: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xec0a0009  ! 2328: LDUB_R	ldub	[%r8 + %r9], %r22
	.word 0x0e800002  ! 2328: BVS	bvs  	<label_0x2>
	.word 0xe6320009  ! 2331: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xcc420009  ! 2331: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc6522560  ! 2331: LDSH_I	ldsh	[%r8 + 0x0560], %r3
	.word 0xc8320009  ! 2334: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xca420009  ! 2334: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8b6a230c  ! 2334: SDIVX_I	sdivx	%r8, 0x030c, %r5
	.word 0xf62a0009  ! 2337: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xc65a0009  ! 2337: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xc6b21009  ! 2337: STHA_R	stha	%r3, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 2340: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xce020009  ! 2340: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc2a22768  ! 2340: STWA_I	stwa	%r1, [%r8 + 0x0768] %asi
	.word 0xcc320009  ! 2343: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xfe0a0009  ! 2343: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0x8ba20829  ! 2343: FADDs	fadds	%f8, %f9, %f5
	.word 0xfd3a0009  ! 2346: STDF_R	std	%f30, [%r9, %r8]
	.word 0xce120009  ! 2346: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8e5a0009  ! 2346: SMUL_R	smul 	%r8, %r9, %r7
	.word 0xcd220009  ! 2349: STF_R	st	%f6, [%r9, %r8]
	.word 0xe1020009  ! 2349: LDF_R	ld	[%r8, %r9], %f16
	.word 0xc51a21a0  ! 2349: LDDF_I	ldd	[%r8, 0x01a0], %f2
	.word 0xe0220009  ! 2352: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xcc420009  ! 2352: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc4ba1009  ! 2352: STDA_R	stda	%r2, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 2355: STF_R	st	%f6, [%r9, %r8]
	.word 0xc41a0009  ! 2355: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2355: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xc4320009  ! 2358: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xce5a0009  ! 2358: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8143c000  ! 2358: STBAR	stbar
	.word 0xc93a0009  ! 2361: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca5a0009  ! 2361: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x86fa0009  ! 2361: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xec2a0009  ! 2364: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xca020009  ! 2364: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x844a2834  ! 2364: MULX_I	mulx 	%r8, 0x0834, %r2
	.word 0xcc320009  ! 2367: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4020009  ! 2367: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc4821009  ! 2367: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0xce320009  ! 2370: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 2370: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xe7e21009  ! 2370: CASA_I	casa	[%r8] 0x80, %r9, %r19
	.word 0xc2320009  ! 2373: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc64a0009  ! 2373: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x04ca0001  ! 2373: BRLEZ	brlez  ,pt	%8,<label_0xa0001>
	.word 0xca320009  ! 2376: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc80a0009  ! 2376: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x0aca0001  ! 2376: BRNZ	brnz  ,pt	%8,<label_0xa0001>
	.word 0xe4220009  ! 2379: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xcc4a0009  ! 2379: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x3e800001  ! 2379: BVC	bvc,a	<label_0x1>
	.word 0xc62a0009  ! 2382: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcf1a0009  ! 2382: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x14800002  ! 2382: BG	bg  	<label_0x2>
	.word 0xc73a0009  ! 2385: STDF_R	std	%f3, [%r9, %r8]
	.word 0xe91a0009  ! 2385: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xcf3a28c8  ! 2385: STDF_I	std	%f7, [0x08c8, %r8]
	.word 0xc2720009  ! 2388: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcb020009  ! 2388: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc6b22988  ! 2388: STHA_I	stha	%r3, [%r8 + 0x0988] %asi
	.word 0xc2220009  ! 2391: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc2120009  ! 2391: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc40a0009  ! 2391: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xcf220009  ! 2394: STF_R	st	%f7, [%r9, %r8]
	.word 0xc24a0009  ! 2394: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x9e5a0009  ! 2394: SMUL_R	smul 	%r8, %r9, %r15
	.word 0xc8320009  ! 2397: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf25a0009  ! 2397: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xe26a0009  ! 2397: LDSTUB_R	ldstub	%r17, [%r8 + %r9]
	.word 0xc33a0009  ! 2400: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc5a0009  ! 2400: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xc4b22c34  ! 2400: STHA_I	stha	%r2, [%r8 + 0x0c34] %asi
	.word 0xca2a0009  ! 2403: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc2120009  ! 2403: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x88fa21e4  ! 2403: SDIVcc_I	sdivcc 	%r8, 0x01e4, %r4
	.word 0xfd220009  ! 2406: STF_R	st	%f30, [%r9, %r8]
	.word 0xc9020009  ! 2406: LDF_R	ld	[%r8, %r9], %f4
	.word 0x825a0009  ! 2406: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xed220009  ! 2409: STF_R	st	%f22, [%r9, %r8]
	.word 0xec020009  ! 2409: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xc32226f8  ! 2409: STF_I	st	%f1, [0x06f8, %r8]
	.word 0xfe720009  ! 2412: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xc01a0009  ! 2412: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8143c000  ! 2412: STBAR	stbar
	.word 0xeb3a0009  ! 2415: STDF_R	std	%f21, [%r9, %r8]
	.word 0xfc420009  ! 2415: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0xc36a29b0  ! 2415: PREFETCH_I	prefetch	[%r8 + 0x09b0], #one_read
	.word 0xce220009  ! 2418: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc020009  ! 2418: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xdcca1009  ! 2418: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r14
	.word 0xfe320009  ! 2421: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xfc1a0009  ! 2421: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x8cfa0009  ! 2421: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xca2a0009  ! 2424: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc2020009  ! 2424: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x2cca0001  ! 2424: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xdc720009  ! 2427: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xce120009  ! 2427: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8143e02d  ! 2427: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xf6320009  ! 2430: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc6520009  ! 2430: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x88722d30  ! 2430: UDIV_I	udiv 	%r8, 0x0d30, %r4
	.word 0xf7220009  ! 2433: STF_R	st	%f27, [%r9, %r8]
	.word 0xc20a0009  ! 2433: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc2aa2d80  ! 2433: STBA_I	stba	%r1, [%r8 + 0x0d80] %asi
	.word 0xcc220009  ! 2436: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 2436: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xa47a2208  ! 2436: SDIV_I	sdiv 	%r8, 0x0208, %r18
	.word 0xcd3a0009  ! 2439: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc40a0009  ! 2439: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x40000002  ! 2439: CALL	call	disp30_2
	.word 0xff3a0009  ! 2442: STDF_R	std	%f31, [%r9, %r8]
	.word 0xe0420009  ! 2442: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xc85a27d8  ! 2442: LDX_I	ldx	[%r8 + 0x07d8], %r4
	.word 0xcd220009  ! 2445: STF_R	st	%f6, [%r9, %r8]
	.word 0xc81a0009  ! 2445: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xdac21009  ! 2445: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r13
	.word 0xf62a0009  ! 2448: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xee0a0009  ! 2448: LDUB_R	ldub	[%r8 + %r9], %r23
	.word 0x8e4a0009  ! 2448: MULX_R	mulx 	%r8, %r9, %r7
	.word 0xf4220009  ! 2451: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xc51a0009  ! 2451: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc4da1009  ! 2451: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0xc8220009  ! 2454: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce020009  ! 2454: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xcf1a26a8  ! 2454: LDDF_I	ldd	[%r8, 0x06a8], %f7
	.word 0xca2a0009  ! 2457: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc6120009  ! 2457: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc89a1009  ! 2457: LDDA_R	ldda	[%r8, %r9] 0x80, %r4
	.word 0xc8320009  ! 2460: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 2460: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc6fa1009  ! 2460: SWAPA_R	swapa	%r3, [%r8 + %r9] 0x80
	.word 0xdc720009  ! 2463: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc7020009  ! 2463: LDF_R	ld	[%r8, %r9], %f3
	.word 0xcef22958  ! 2463: STXA_I	stxa	%r7, [%r8 + 0x0958] %asi
	.word 0xc8320009  ! 2466: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xcf020009  ! 2466: LDF_R	ld	[%r8, %r9], %f7
	.word 0xe0b21009  ! 2466: STHA_R	stha	%r16, [%r8 + %r9] 0x80
	.word 0xc82a0009  ! 2469: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xfd020009  ! 2469: LDF_R	ld	[%r8, %r9], %f30
	.word 0x8143c000  ! 2469: STBAR	stbar
	.word 0xc7220009  ! 2472: STF_R	st	%f3, [%r9, %r8]
	.word 0xc91a0009  ! 2472: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0x85a20929  ! 2472: FMULs	fmuls	%f8, %f9, %f2
	.word 0xcc2a0009  ! 2475: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca520009  ! 2475: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc8921009  ! 2475: LDUHA_R	lduha	[%r8, %r9] 0x80, %r4
	.word 0xcc2a0009  ! 2478: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 2478: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xce7a0009  ! 2478: SWAP_R	swap	%r7, [%r8 + %r9]
	.word 0xc22a0009  ! 2481: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc41a0009  ! 2481: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x89222770  ! 2481: MULScc_I	mulscc 	%r8, 0x0770, %r4
	.word 0xf0320009  ! 2484: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xce520009  ! 2484: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8a720009  ! 2484: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xfa320009  ! 2487: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc41a0009  ! 2487: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc4ea2da0  ! 2487: LDSTUBA_I	ldstuba	%r2, [%r8 + 0x0da0] %asi
	.word 0xcf3a0009  ! 2490: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe81a0009  ! 2490: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0xfcca2b14  ! 2490: LDSBA_I	ldsba	[%r8, + 0x0b14] %asi, %r30
	.word 0xf6720009  ! 2493: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc6520009  ! 2493: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x84da25b0  ! 2493: SMULcc_I	smulcc 	%r8, 0x05b0, %r2
	.word 0xc7220009  ! 2496: STF_R	st	%f3, [%r9, %r8]
	.word 0xcc5a0009  ! 2496: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143e058  ! 2496: MEMBAR	membar	#StoreStore | #Lookaside | #Sync 
	.word 0xc53a0009  ! 2499: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8420009  ! 2499: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xc27a0009  ! 2499: SWAP_R	swap	%r1, [%r8 + %r9]
	.word 0xc2720009  ! 2502: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc4a0009  ! 2502: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8ef22980  ! 2502: UDIVcc_I	udivcc 	%r8, 0x0980, %r7
	.word 0xce220009  ! 2505: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xec5a0009  ! 2505: LDX_R	ldx	[%r8 + %r9], %r22
	.word 0x8143c000  ! 2505: STBAR	stbar
	.word 0xcc220009  ! 2508: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce420009  ! 2508: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xcd1a0009  ! 2508: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xcf3a0009  ! 2511: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2120009  ! 2511: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 2511: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xd93a0009  ! 2514: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc81a0009  ! 2514: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x847a2aec  ! 2514: SDIV_I	sdiv 	%r8, 0x0aec, %r2
	.word 0xcc320009  ! 2517: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 2517: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x83220009  ! 2517: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xce320009  ! 2520: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xcc520009  ! 2520: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xe91a0009  ! 2520: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xfe220009  ! 2523: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xcc0a0009  ! 2523: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xe60a0009  ! 2523: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0xc3220009  ! 2526: STF_R	st	%f1, [%r9, %r8]
	.word 0xc5020009  ! 2526: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143e018  ! 2526: MEMBAR	membar	#StoreStore | #Lookaside 
	.word 0xf0720009  ! 2529: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc6120009  ! 2529: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xc28a2dd0  ! 2529: LDUBA_I	lduba	[%r8, + 0x0dd0] %asi, %r1
	.word 0xfe220009  ! 2532: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc9020009  ! 2532: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc36a0009  ! 2532: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xdc2a0009  ! 2535: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xd9020009  ! 2535: LDF_R	ld	[%r8, %r9], %f12
	.word 0xf4fa1009  ! 2535: SWAPA_R	swapa	%r26, [%r8 + %r9] 0x80
	.word 0xcd220009  ! 2538: STF_R	st	%f6, [%r9, %r8]
	.word 0xc2520009  ! 2538: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xc2da2b90  ! 2538: LDXA_I	ldxa	[%r8, + 0x0b90] %asi, %r1
	.word 0xcc720009  ! 2541: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfc120009  ! 2541: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xc44a28b0  ! 2541: LDSB_I	ldsb	[%r8 + 0x08b0], %r2
	.word 0xc82a0009  ! 2544: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xec020009  ! 2544: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xc36a0009  ! 2544: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca220009  ! 2547: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc020009  ! 2547: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc91a0009  ! 2547: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xec220009  ! 2550: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc3020009  ! 2550: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8da209a9  ! 2550: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xec320009  ! 2553: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc3020009  ! 2553: LDF_R	ld	[%r8, %r9], %f1
	.word 0xcaaa1009  ! 2553: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xe8720009  ! 2556: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xdb020009  ! 2556: LDF_R	ld	[%r8, %r9], %f13
	.word 0xf67a0009  ! 2556: SWAP_R	swap	%r27, [%r8 + %r9]
	.word 0xc4220009  ! 2559: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xe11a0009  ! 2559: LDDF_R	ldd	[%r8, %r9], %f16
	.word 0xec520009  ! 2559: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xe6220009  ! 2562: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xcc0a0009  ! 2562: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xc3ea2d44  ! 2562: PREFETCHA_I	prefetcha	[%r8, + 0x0d44] %asi, #one_read
	.word 0xe82a0009  ! 2565: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xc3020009  ! 2565: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8143e03b  ! 2565: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xed220009  ! 2568: STF_R	st	%f22, [%r9, %r8]
	.word 0xc8520009  ! 2568: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 2568: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc42a0009  ! 2571: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 2571: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xc3ea24e4  ! 2571: PREFETCHA_I	prefetcha	[%r8, + 0x04e4] %asi, #one_read
	.word 0xce320009  ! 2574: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xec520009  ! 2574: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xc36a23e8  ! 2574: PREFETCH_I	prefetch	[%r8 + 0x03e8], #one_read
	.word 0xce720009  ! 2577: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc44a0009  ! 2577: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc01a0009  ! 2577: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xca720009  ! 2580: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 2580: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xdc120009  ! 2580: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xf4320009  ! 2583: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xde520009  ! 2583: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0x86da2a20  ! 2583: SMULcc_I	smulcc 	%r8, 0x0a20, %r3
	.word 0xcf3a0009  ! 2586: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc65a0009  ! 2586: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143e040  ! 2586: MEMBAR	membar	#Sync 
	.word 0xc2220009  ! 2589: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xea0a0009  ! 2589: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xcff21009  ! 2589: CASXA_I	casxa	[%r8] 0x80, %r9, %r7
	.word 0xca220009  ! 2592: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe0120009  ! 2592: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xda020009  ! 2592: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xce2a0009  ! 2595: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xdf1a0009  ! 2595: LDDF_R	ldd	[%r8, %r9], %f15
	.word 0x1c800001  ! 2595: BPOS	bpos  	<label_0x1>
	.word 0xd93a0009  ! 2598: STDF_R	std	%f12, [%r9, %r8]
	.word 0xce0a0009  ! 2598: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xa2720009  ! 2598: UDIV_R	udiv 	%r8, %r9, %r17
	.word 0xfc320009  ! 2601: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xde4a0009  ! 2601: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xc3ea1009  ! 2601: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe62a0009  ! 2604: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc91a0009  ! 2604: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xe07a24b0  ! 2604: SWAP_I	swap	%r16, [%r8 + 0x04b0]
	.word 0xe73a0009  ! 2607: STDF_R	std	%f19, [%r9, %r8]
	.word 0xe2520009  ! 2607: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0x9c4a0009  ! 2607: MULX_R	mulx 	%r8, %r9, %r14
	.word 0xcc320009  ! 2610: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca420009  ! 2610: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xfea21009  ! 2610: STWA_R	stwa	%r31, [%r8 + %r9] 0x80
	.word 0xde720009  ! 2613: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xe40a0009  ! 2613: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x1e800001  ! 2613: BVC	bvc  	<label_0x1>
	.word 0xcc720009  ! 2616: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xee020009  ! 2616: LDUW_R	lduw	[%r8 + %r9], %r23
	.word 0xe4022dbc  ! 2616: LDUW_I	lduw	[%r8 + 0x0dbc], %r18
	.word 0xf42a0009  ! 2619: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xe4420009  ! 2619: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xd8ca25cc  ! 2619: LDSBA_I	ldsba	[%r8, + 0x05cc] %asi, %r12
	.word 0xc5220009  ! 2622: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc120009  ! 2622: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 2622: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc62a0009  ! 2625: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc2420009  ! 2625: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xcb020009  ! 2625: LDF_R	ld	[%r8, %r9], %f5
	.word 0xca720009  ! 2628: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xde420009  ! 2628: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0xcc8a1009  ! 2628: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0xcc720009  ! 2631: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc4520009  ! 2631: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc3ea27d8  ! 2631: PREFETCHA_I	prefetcha	[%r8, + 0x07d8] %asi, #one_read
	.word 0xc6320009  ! 2634: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xca420009  ! 2634: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcd3a0009  ! 2634: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc2720009  ! 2637: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc2520009  ! 2637: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xe93a2770  ! 2637: STDF_I	std	%f20, [0x0770, %r8]
	.word 0xc9220009  ! 2640: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc4a0009  ! 2640: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8143e045  ! 2640: MEMBAR	membar	#LoadLoad | #LoadStore | #Sync 
	.word 0xc9220009  ! 2643: STF_R	st	%f4, [%r9, %r8]
	.word 0xe91a0009  ! 2643: LDDF_R	ldd	[%r8, %r9], %f20
	.word 0xc26a0009  ! 2643: LDSTUB_R	ldstub	%r1, [%r8 + %r9]
	.word 0xd8320009  ! 2646: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc40a0009  ! 2646: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xb44a2f24  ! 2646: MULX_I	mulx 	%r8, 0x0f24, %r26
	.word 0xc8320009  ! 2649: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce020009  ! 2649: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x856a2aac  ! 2649: SDIVX_I	sdivx	%r8, 0x0aac, %r2
	.word 0xe5220009  ! 2652: STF_R	st	%f18, [%r9, %r8]
	.word 0xca420009  ! 2652: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xcad229b8  ! 2652: LDSHA_I	ldsha	[%r8, + 0x09b8] %asi, %r5
	.word 0xcf220009  ! 2655: STF_R	st	%f7, [%r9, %r8]
	.word 0xca120009  ! 2655: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x9ada0009  ! 2655: SMULcc_R	smulcc 	%r8, %r9, %r13
	.word 0xc22a0009  ! 2658: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe0120009  ! 2658: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0xceb22a78  ! 2658: STHA_I	stha	%r7, [%r8 + 0x0a78] %asi
	.word 0xc9220009  ! 2661: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4020009  ! 2661: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xc6aa1009  ! 2661: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 2664: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf7020009  ! 2664: LDF_R	ld	[%r8, %r9], %f27
	.word 0xc2ca1009  ! 2664: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r1
	.word 0xcd220009  ! 2667: STF_R	st	%f6, [%r9, %r8]
	.word 0xc25a0009  ! 2667: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x22ca0001  ! 2667: BRZ	brz,a,pt	%8,<label_0xa0001>
	.word 0xee220009  ! 2670: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xce020009  ! 2670: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xc36a2f60  ! 2670: PREFETCH_I	prefetch	[%r8 + 0x0f60], #one_read
	.word 0xea220009  ! 2673: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xc8420009  ! 2673: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x8f22226c  ! 2673: MULScc_I	mulscc 	%r8, 0x026c, %r7
	.word 0xf13a0009  ! 2676: STDF_R	std	%f24, [%r9, %r8]
	.word 0xdc120009  ! 2676: LDUH_R	lduh	[%r8 + %r9], %r14
	.word 0xc81a0009  ! 2676: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xf8720009  ! 2679: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc7020009  ! 2679: LDF_R	ld	[%r8, %r9], %f3
	.word 0xbcda0009  ! 2679: SMULcc_R	smulcc 	%r8, %r9, %r30
	.word 0xc4720009  ! 2682: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xe2020009  ! 2682: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xc88a273c  ! 2682: LDUBA_I	lduba	[%r8, + 0x073c] %asi, %r4
	.word 0xce220009  ! 2685: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc120009  ! 2685: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8143c000  ! 2685: STBAR	stbar
	.word 0xf73a0009  ! 2688: STDF_R	std	%f27, [%r9, %r8]
	.word 0xca520009  ! 2688: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x83a208a9  ! 2688: FSUBs	fsubs	%f8, %f9, %f1
	.word 0xcf220009  ! 2691: STF_R	st	%f7, [%r9, %r8]
	.word 0xca5a0009  ! 2691: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8fa208a9  ! 2691: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xe9220009  ! 2694: STF_R	st	%f20, [%r9, %r8]
	.word 0xc41a0009  ! 2694: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8143c000  ! 2694: STBAR	stbar
	.word 0xc7220009  ! 2697: STF_R	st	%f3, [%r9, %r8]
	.word 0xc5020009  ! 2697: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8143e007  ! 2697: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore 
	.word 0xf2720009  ! 2700: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xcc1a0009  ! 2700: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc3ea2180  ! 2700: PREFETCHA_I	prefetcha	[%r8, + 0x0180] %asi, #one_read
	.word 0xf73a0009  ! 2703: STDF_R	std	%f27, [%r9, %r8]
	.word 0xe7020009  ! 2703: LDF_R	ld	[%r8, %r9], %f19
	.word 0xc6520009  ! 2703: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xde220009  ! 2706: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc2120009  ! 2706: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc3ea2480  ! 2706: PREFETCHA_I	prefetcha	[%r8, + 0x0480] %asi, #one_read
	.word 0xc82a0009  ! 2709: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xe85a0009  ! 2709: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0x852228c8  ! 2709: MULScc_I	mulscc 	%r8, 0x08c8, %r2
	.word 0xd62a0009  ! 2712: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xda520009  ! 2712: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xcc7a2860  ! 2712: SWAP_I	swap	%r6, [%r8 + 0x0860]
	.word 0xce2a0009  ! 2715: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xf31a0009  ! 2715: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x8143e052  ! 2715: MEMBAR	membar	#StoreLoad | #Lookaside | #Sync 
	.word 0xcc2a0009  ! 2718: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca520009  ! 2718: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xb4fa21a0  ! 2718: SDIVcc_I	sdivcc 	%r8, 0x01a0, %r26
	.word 0xcb3a0009  ! 2721: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc45a0009  ! 2721: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xc6022628  ! 2721: LDUW_I	lduw	[%r8 + 0x0628], %r3
	.word 0xc82a0009  ! 2724: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce420009  ! 2724: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc3ea1009  ! 2724: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xe22a0009  ! 2727: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc2120009  ! 2727: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc7220009  ! 2727: STF_R	st	%f3, [%r9, %r8]
	.word 0xc62a0009  ! 2730: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf05a0009  ! 2730: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x9f6a0009  ! 2730: SDIVX_R	sdivx	%r8, %r9, %r15
	.word 0xf8220009  ! 2733: STW_R	stw	%r28, [%r8 + %r9]
	.word 0xcc0a0009  ! 2733: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xa9a209a9  ! 2733: FDIVs	fdivs	%f8, %f9, %f20
	.word 0xcf220009  ! 2736: STF_R	st	%f7, [%r9, %r8]
	.word 0xc81a0009  ! 2736: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc51a0009  ! 2736: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xce2a0009  ! 2739: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc81a0009  ! 2739: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xd89a2878  ! 2739: LDDA_I	ldda	[%r8, + 0x0878] %asi, %r12
	.word 0xc3220009  ! 2742: STF_R	st	%f1, [%r9, %r8]
	.word 0xc24a0009  ! 2742: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x12800001  ! 2742: BNE	bne  	<label_0x1>
	.word 0xf9220009  ! 2745: STF_R	st	%f28, [%r9, %r8]
	.word 0xc6420009  ! 2745: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc67a0009  ! 2745: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xe6220009  ! 2748: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xe6420009  ! 2748: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x2c800002  ! 2748: BNEG	bneg,a	<label_0x2>
	.word 0xec720009  ! 2751: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xca520009  ! 2751: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc3f22009  ! 2751: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xce320009  ! 2754: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xec120009  ! 2754: LDUH_R	lduh	[%r8 + %r9], %r22
	.word 0x86fa0009  ! 2754: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xf6720009  ! 2757: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xc51a0009  ! 2757: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc3f22009  ! 2757: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xc82a0009  ! 2760: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 2760: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xe2f21009  ! 2760: STXA_R	stxa	%r17, [%r8 + %r9] 0x80
	.word 0xd6720009  ! 2763: STX_R	stx	%r11, [%r8 + %r9]
	.word 0xc2020009  ! 2763: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xd89a1009  ! 2763: LDDA_R	ldda	[%r8, %r9] 0x80, %r12
	.word 0xc53a0009  ! 2766: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf04a0009  ! 2766: LDSB_R	ldsb	[%r8 + %r9], %r24
	.word 0x824a23bc  ! 2766: MULX_I	mulx 	%r8, 0x03bc, %r1
	.word 0xe22a0009  ! 2769: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc84a0009  ! 2769: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xb4f22374  ! 2769: UDIVcc_I	udivcc 	%r8, 0x0374, %r26
	.word 0xca2a0009  ! 2772: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc3020009  ! 2772: LDF_R	ld	[%r8, %r9], %f1
	.word 0x86f2234c  ! 2772: UDIVcc_I	udivcc 	%r8, 0x034c, %r3
	.word 0xef220009  ! 2775: STF_R	st	%f23, [%r9, %r8]
	.word 0xcd1a0009  ! 2775: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x40000002  ! 2775: CALL	call	disp30_2
	.word 0xca2a0009  ! 2778: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc8020009  ! 2778: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x3c800002  ! 2778: BPOS	bpos,a	<label_0x2>
	.word 0xde720009  ! 2781: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xcd1a0009  ! 2781: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x827222dc  ! 2781: UDIV_I	udiv 	%r8, 0x02dc, %r1
	.word 0xca220009  ! 2784: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc5020009  ! 2784: LDF_R	ld	[%r8, %r9], %f2
	.word 0xf8ba29a0  ! 2784: STDA_I	stda	%r28, [%r8 + 0x09a0] %asi
	.word 0xf6720009  ! 2787: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xd6020009  ! 2787: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x8e7a0009  ! 2787: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xcb220009  ! 2790: STF_R	st	%f5, [%r9, %r8]
	.word 0xcd1a0009  ! 2790: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xf0ba1009  ! 2790: STDA_R	stda	%r24, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 2793: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca020009  ! 2793: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xa1a208a9  ! 2793: FSUBs	fsubs	%f8, %f9, %f16
	.word 0xcf220009  ! 2796: STF_R	st	%f7, [%r9, %r8]
	.word 0xce420009  ! 2796: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x9ed2209c  ! 2796: UMULcc_I	umulcc 	%r8, 0x009c, %r15
	.word 0xc5220009  ! 2799: STF_R	st	%f2, [%r9, %r8]
	.word 0xd71a0009  ! 2799: LDDF_R	ldd	[%r8, %r9], %f11
	.word 0xe8ea1009  ! 2799: LDSTUBA_R	ldstuba	%r20, [%r8 + %r9] 0x80
	.word 0xc73a0009  ! 2802: STDF_R	std	%f3, [%r9, %r8]
	.word 0xc60a0009  ! 2802: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xc20a2194  ! 2802: LDUB_I	ldub	[%r8 + 0x0194], %r1
	.word 0xce320009  ! 2805: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca5a0009  ! 2805: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x82520009  ! 2805: UMUL_R	umul 	%r8, %r9, %r1
	.word 0xe6720009  ! 2808: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xec1a0009  ! 2808: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0x8143e038  ! 2808: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xc6220009  ! 2811: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc81a0009  ! 2811: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xce4a0009  ! 2811: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc33a0009  ! 2814: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc4020009  ! 2814: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x2cca0001  ! 2814: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xc4320009  ! 2817: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe4520009  ! 2817: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xc8aa1009  ! 2817: STBA_R	stba	%r4, [%r8 + %r9] 0x80
	.word 0xf73a0009  ! 2820: STDF_R	std	%f27, [%r9, %r8]
	.word 0xc2120009  ! 2820: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8d220009  ! 2820: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xc93a0009  ! 2823: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc44a0009  ! 2823: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2823: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcc2a0009  ! 2826: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xf85a0009  ! 2826: LDX_R	ldx	[%r8 + %r9], %r28
	.word 0x8143c000  ! 2826: STBAR	stbar
	.word 0xc5220009  ! 2829: STF_R	st	%f2, [%r9, %r8]
	.word 0xca5a0009  ! 2829: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8c4a2978  ! 2829: MULX_I	mulx 	%r8, 0x0978, %r6
	.word 0xc33a0009  ! 2832: STDF_R	std	%f1, [%r9, %r8]
	.word 0xe9020009  ! 2832: LDF_R	ld	[%r8, %r9], %f20
	.word 0x8d222750  ! 2832: MULScc_I	mulscc 	%r8, 0x0750, %r6
	.word 0xc93a0009  ! 2835: STDF_R	std	%f4, [%r9, %r8]
	.word 0xff020009  ! 2835: LDF_R	ld	[%r8, %r9], %f31
	.word 0x8cda2bf8  ! 2835: SMULcc_I	smulcc 	%r8, 0x0bf8, %r6
	.word 0xc53a0009  ! 2838: STDF_R	std	%f2, [%r9, %r8]
	.word 0xda520009  ! 2838: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0x14800001  ! 2838: BG	bg  	<label_0x1>
	.word 0xcb3a0009  ! 2841: STDF_R	std	%f5, [%r9, %r8]
	.word 0xce5a0009  ! 2841: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8ba208a9  ! 2841: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xcc320009  ! 2844: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc64a0009  ! 2844: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xc3222de0  ! 2844: STF_I	st	%f1, [0x0de0, %r8]
	.word 0xf3220009  ! 2847: STF_R	st	%f25, [%r9, %r8]
	.word 0xf5020009  ! 2847: LDF_R	ld	[%r8, %r9], %f26
	.word 0x8143e05a  ! 2847: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xc33a0009  ! 2850: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfc5a0009  ! 2850: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0x0e800001  ! 2850: BVS	bvs  	<label_0x1>
	.word 0xf2720009  ! 2853: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xf60a0009  ! 2853: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0x0c800001  ! 2853: BNEG	bneg  	<label_0x1>
	.word 0xc42a0009  ! 2856: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe24a0009  ! 2856: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x0ac20001  ! 2856: BRNZ	brnz  ,nt	%8,<label_0x20001>
	.word 0xfe720009  ! 2859: STX_R	stx	%r31, [%r8 + %r9]
	.word 0xe4420009  ! 2859: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0x1e800001  ! 2859: BVC	bvc  	<label_0x1>
	.word 0xf8320009  ! 2862: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc01a0009  ! 2862: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x84fa0009  ! 2862: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xc6720009  ! 2865: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xfc520009  ! 2865: LDSH_R	ldsh	[%r8 + %r9], %r30
	.word 0x3e800001  ! 2865: BVC	bvc,a	<label_0x1>
	.word 0xc7220009  ! 2868: STF_R	st	%f3, [%r9, %r8]
	.word 0xc41a0009  ! 2868: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x18800002  ! 2868: BGU	bgu  	<label_0x2>
	.word 0xc33a0009  ! 2871: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcc520009  ! 2871: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xee420009  ! 2871: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xe7220009  ! 2874: STF_R	st	%f19, [%r9, %r8]
	.word 0xee5a0009  ! 2874: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0x83a20929  ! 2874: FMULs	fmuls	%f8, %f9, %f1
	.word 0xc33a0009  ! 2877: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf4020009  ! 2877: LDUW_R	lduw	[%r8 + %r9], %r26
	.word 0xd84a2760  ! 2877: LDSB_I	ldsb	[%r8 + 0x0760], %r12
	.word 0xfc220009  ! 2880: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xda5a0009  ! 2880: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x826a2cfc  ! 2880: UDIVX_I	udivx 	%r8, 0x0cfc, %r1
	.word 0xc33a0009  ! 2883: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc2120009  ! 2883: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xaa6a2ea8  ! 2883: UDIVX_I	udivx 	%r8, 0x0ea8, %r21
	.word 0xc42a0009  ! 2886: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf2020009  ! 2886: LDUW_R	lduw	[%r8 + %r9], %r25
	.word 0xc9222640  ! 2886: STF_I	st	%f4, [0x0640, %r8]
	.word 0xe53a0009  ! 2889: STDF_R	std	%f18, [%r9, %r8]
	.word 0xce520009  ! 2889: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc71a2508  ! 2889: LDDF_I	ldd	[%r8, 0x0508], %f3
	.word 0xc93a0009  ! 2892: STDF_R	std	%f4, [%r9, %r8]
	.word 0xc31a0009  ! 2892: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xccba28f8  ! 2892: STDA_I	stda	%r6, [%r8 + 0x08f8] %asi
	.word 0xc2220009  ! 2895: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xd64a0009  ! 2895: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0xc2b229e8  ! 2895: STHA_I	stha	%r1, [%r8 + 0x09e8] %asi
	.word 0xe02a0009  ! 2898: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xf31a0009  ! 2898: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x8cf20009  ! 2898: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc8720009  ! 2901: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 2901: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x36800001  ! 2901: BGE	bge,a	<label_0x1>
	.word 0xf4220009  ! 2904: STW_R	stw	%r26, [%r8 + %r9]
	.word 0xca4a0009  ! 2904: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xbcfa2bb8  ! 2904: SDIVcc_I	sdivcc 	%r8, 0x0bb8, %r30
	.word 0xcc220009  ! 2907: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca4a0009  ! 2907: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc36a0009  ! 2907: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc22a0009  ! 2910: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc6420009  ! 2910: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc9020009  ! 2910: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc9220009  ! 2913: STF_R	st	%f4, [%r9, %r8]
	.word 0xd85a0009  ! 2913: LDX_R	ldx	[%r8 + %r9], %r12
	.word 0x24c20001  ! 2913: BRLEZ	brlez,a,nt	%8,<label_0x20001>
	.word 0xca720009  ! 2916: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xf81a0009  ! 2916: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x82da2954  ! 2916: SMULcc_I	smulcc 	%r8, 0x0954, %r1
	.word 0xe22a0009  ! 2919: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xc4020009  ! 2919: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x8143e06b  ! 2919: MEMBAR	membar	#LoadLoad | #StoreLoad | #StoreStore | #MemIssue | #Sync 
	.word 0xe42a0009  ! 2922: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xc4420009  ! 2922: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc3ea1009  ! 2922: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xcf220009  ! 2925: STF_R	st	%f7, [%r9, %r8]
	.word 0xcf1a0009  ! 2925: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x85a20929  ! 2925: FMULs	fmuls	%f8, %f9, %f2
	.word 0xce2a0009  ! 2928: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xcf020009  ! 2928: LDF_R	ld	[%r8, %r9], %f7
	.word 0xaa722f40  ! 2928: UDIV_I	udiv 	%r8, 0x0f40, %r21
	.word 0xce2a0009  ! 2931: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 2931: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8143c000  ! 2931: STBAR	stbar
	.word 0xf02a0009  ! 2934: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xce520009  ! 2934: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x02800001  ! 2934: BE	be  	<label_0x1>
	.word 0xce220009  ! 2937: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6120009  ! 2937: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xccea22e4  ! 2937: LDSTUBA_I	ldstuba	%r6, [%r8 + 0x02e4] %asi
	.word 0xfa220009  ! 2940: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc2120009  ! 2940: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xc3ea1009  ! 2940: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xca220009  ! 2943: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xce4a0009  ! 2943: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x836a0009  ! 2943: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xcc220009  ! 2946: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcb020009  ! 2946: LDF_R	ld	[%r8, %r9], %f5
	.word 0xa6520009  ! 2946: UMUL_R	umul 	%r8, %r9, %r19
	.word 0xec220009  ! 2949: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc60a0009  ! 2949: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xf81a26f0  ! 2949: LDD_I	ldd	[%r8 + 0x06f0], %r28
	.word 0xde720009  ! 2952: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xfb020009  ! 2952: LDF_R	ld	[%r8, %r9], %f29
	.word 0x3a800001  ! 2952: BCC	bcc,a	<label_0x1>
	.word 0xcc320009  ! 2955: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce020009  ! 2955: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x18800001  ! 2955: BGU	bgu  	<label_0x1>
	.word 0xc9220009  ! 2958: STF_R	st	%f4, [%r9, %r8]
	.word 0xca020009  ! 2958: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x8cda2020  ! 2958: SMULcc_I	smulcc 	%r8, 0x0020, %r6
	.word 0xcc220009  ! 2961: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe4420009  ! 2961: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0xa8fa259c  ! 2961: SDIVcc_I	sdivcc 	%r8, 0x059c, %r20
	.word 0xcc220009  ! 2964: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc84a0009  ! 2964: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8fa20929  ! 2964: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc8220009  ! 2967: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf0420009  ! 2967: LDSW_R	ldsw	[%r8 + %r9], %r24
	.word 0xc36a0009  ! 2967: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xcf3a0009  ! 2970: STDF_R	std	%f7, [%r9, %r8]
	.word 0xe6020009  ! 2970: LDUW_R	lduw	[%r8 + %r9], %r19
	.word 0xc36a0009  ! 2970: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xef3a0009  ! 2973: STDF_R	std	%f23, [%r9, %r8]
	.word 0xd81a0009  ! 2973: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x9e720009  ! 2973: UDIV_R	udiv 	%r8, %r9, %r15
	.word 0xce220009  ! 2976: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf31a0009  ! 2976: LDDF_R	ldd	[%r8, %r9], %f25
	.word 0x38800001  ! 2976: BGU	bgu,a	<label_0x1>
	.word 0xe82a0009  ! 2979: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xea120009  ! 2979: LDUH_R	lduh	[%r8 + %r9], %r21
	.word 0xc4f21009  ! 2979: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xc2720009  ! 2982: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc9020009  ! 2982: LDF_R	ld	[%r8, %r9], %f4
	.word 0x10800001  ! 2982: BA	ba  	<label_0x1>
	.word 0xcb3a0009  ! 2985: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc6420009  ! 2985: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xc88a1009  ! 2985: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xd73a0009  ! 2988: STDF_R	std	%f11, [%r9, %r8]
	.word 0xec420009  ! 2988: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xf6f21009  ! 2988: STXA_R	stxa	%r27, [%r8 + %r9] 0x80
	.word 0xca220009  ! 2991: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xe8120009  ! 2991: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0x88d223b4  ! 2991: UMULcc_I	umulcc 	%r8, 0x03b4, %r4
	.word 0xfa720009  ! 2994: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc4120009  ! 2994: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xaf6a25a8  ! 2994: SDIVX_I	sdivx	%r8, 0x05a8, %r23
	.word 0xcc720009  ! 2997: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 2997: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xccb21009  ! 2997: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc2220009  ! 3000: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xf05a0009  ! 3000: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x8e7a0009  ! 3000: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xca2a0009  ! 3003: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xf4420009  ! 3003: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc45a2930  ! 3003: LDX_I	ldx	[%r8 + 0x0930], %r2
	.word 0xcf3a0009  ! 3006: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca4a0009  ! 3006: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc2f21009  ! 3006: STXA_R	stxa	%r1, [%r8 + %r9] 0x80
	.word 0xcc320009  ! 3009: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4120009  ! 3009: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xe07a203c  ! 3009: SWAP_I	swap	%r16, [%r8 + 0x003c]
	.word 0xca220009  ! 3012: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 3012: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xe65a22f8  ! 3012: LDX_I	ldx	[%r8 + 0x02f8], %r19
	.word 0xcb220009  ! 3015: STF_R	st	%f5, [%r9, %r8]
	.word 0xe24a0009  ! 3015: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x87220009  ! 3015: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xcc220009  ! 3018: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xda120009  ! 3018: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0xc49a1009  ! 3018: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xc93a0009  ! 3021: STDF_R	std	%f4, [%r9, %r8]
	.word 0xca520009  ! 3021: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x14800002  ! 3021: BG	bg  	<label_0x2>
	.word 0xc62a0009  ! 3024: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca520009  ! 3024: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x886a0009  ! 3024: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xce220009  ! 3027: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcd020009  ! 3027: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc3ea1009  ! 3027: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xeb220009  ! 3030: STF_R	st	%f21, [%r9, %r8]
	.word 0xc51a0009  ! 3030: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc36a0009  ! 3030: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xce320009  ! 3033: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe0520009  ! 3033: LDSH_R	ldsh	[%r8 + %r9], %r16
	.word 0xcea21009  ! 3033: STWA_R	stwa	%r7, [%r8 + %r9] 0x80
	.word 0xcc220009  ! 3036: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xce420009  ! 3036: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xeaa21009  ! 3036: STWA_R	stwa	%r21, [%r8 + %r9] 0x80
	.word 0xe4720009  ! 3039: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc01a0009  ! 3039: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc30229c8  ! 3039: LDF_I	ld	[%r8, 0x09c8], %f1
	.word 0xe4720009  ! 3042: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xce520009  ! 3042: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8143e032  ! 3042: MEMBAR	membar	#StoreLoad | #Lookaside | #MemIssue 
	.word 0xc2720009  ! 3045: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc24a0009  ! 3045: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8143e07d  ! 3045: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0xc6220009  ! 3048: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xc44a0009  ! 3048: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x8d220009  ! 3048: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xca220009  ! 3051: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc8120009  ! 3051: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xee7a2790  ! 3051: SWAP_I	swap	%r23, [%r8 + 0x0790]
	.word 0xc4320009  ! 3054: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc4520009  ! 3054: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8a7a0009  ! 3054: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xc73a0009  ! 3057: STDF_R	std	%f3, [%r9, %r8]
	.word 0xce420009  ! 3057: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xceb21009  ! 3057: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xf8720009  ! 3060: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc3020009  ! 3060: LDF_R	ld	[%r8, %r9], %f1
	.word 0xb6720009  ! 3060: UDIV_R	udiv 	%r8, %r9, %r27
	.word 0xda220009  ! 3063: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xfe520009  ! 3063: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xce0a0009  ! 3063: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xef3a0009  ! 3066: STDF_R	std	%f23, [%r9, %r8]
	.word 0xec520009  ! 3066: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xc36a2658  ! 3066: PREFETCH_I	prefetch	[%r8 + 0x0658], #one_read
	.word 0xfa320009  ! 3069: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xc6120009  ! 3069: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xcaea1009  ! 3069: LDSTUBA_R	ldstuba	%r5, [%r8 + %r9] 0x80
	.word 0xc93a0009  ! 3072: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf05a0009  ! 3072: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xd84a0009  ! 3072: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0xce320009  ! 3075: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc8420009  ! 3075: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcf020009  ! 3075: LDF_R	ld	[%r8, %r9], %f7
	.word 0xc5220009  ! 3078: STF_R	st	%f2, [%r9, %r8]
	.word 0xcf020009  ! 3078: LDF_R	ld	[%r8, %r9], %f7
	.word 0x00800001  ! 3078: BN	bn  	<label_0x1>
	.word 0xdf220009  ! 3081: STF_R	st	%f15, [%r9, %r8]
	.word 0xce420009  ! 3081: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8143e02e  ! 3081: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #MemIssue 
	.word 0xcf3a0009  ! 3084: STDF_R	std	%f7, [%r9, %r8]
	.word 0xca4a0009  ! 3084: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcf3a0009  ! 3084: STDF_R	std	%f7, [%r9, %r8]
	.word 0xcd3a0009  ! 3087: STDF_R	std	%f6, [%r9, %r8]
	.word 0xe8020009  ! 3087: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0x2cca0001  ! 3087: BRGZ	brgz,a,pt	%8,<label_0xa0001>
	.word 0xfd220009  ! 3090: STF_R	st	%f30, [%r9, %r8]
	.word 0xcc420009  ! 3090: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 3090: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xca220009  ! 3093: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc5a0009  ! 3093: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xd8aa1009  ! 3093: STBA_R	stba	%r12, [%r8 + %r9] 0x80
	.word 0xff3a0009  ! 3096: STDF_R	std	%f31, [%r9, %r8]
	.word 0xec420009  ! 3096: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xc36a2fe4  ! 3096: PREFETCH_I	prefetch	[%r8 + 0x0fe4], #one_read
	.word 0xc4720009  ! 3099: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xde120009  ! 3099: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xccaa2074  ! 3099: STBA_I	stba	%r6, [%r8 + 0x0074] %asi
	.word 0xc6720009  ! 3102: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc420009  ! 3102: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8143c000  ! 3102: STBAR	stbar
	.word 0xe13a0009  ! 3105: STDF_R	std	%f16, [%r9, %r8]
	.word 0xc3020009  ! 3105: LDF_R	ld	[%r8, %r9], %f1
	.word 0x88520009  ! 3105: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc6220009  ! 3108: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xf40a0009  ! 3108: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0x88da2bfc  ! 3108: SMULcc_I	smulcc 	%r8, 0x0bfc, %r4
	.word 0xcd3a0009  ! 3111: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc71a0009  ! 3111: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xc36a234c  ! 3111: PREFETCH_I	prefetch	[%r8 + 0x034c], #one_read
	.word 0xf5220009  ! 3114: STF_R	st	%f26, [%r9, %r8]
	.word 0xc91a0009  ! 3114: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xc8422690  ! 3114: LDSW_I	ldsw	[%r8 + 0x0690], %r4
	.word 0xe33a0009  ! 3117: STDF_R	std	%f17, [%r9, %r8]
	.word 0xca020009  ! 3117: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xc36a24ac  ! 3117: PREFETCH_I	prefetch	[%r8 + 0x04ac], #one_read
	.word 0xde220009  ! 3120: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xc2420009  ! 3120: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8a6a0009  ! 3120: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0xec2a0009  ! 3123: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xe2420009  ! 3123: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xc5220009  ! 3123: STF_R	st	%f2, [%r9, %r8]
	.word 0xc62a0009  ! 3126: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc2020009  ! 3126: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x9e7a2eb4  ! 3126: SDIV_I	sdiv 	%r8, 0x0eb4, %r15
	.word 0xe2220009  ! 3129: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xca0a0009  ! 3129: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8143e01d  ! 3129: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xcc320009  ! 3132: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 3132: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xd80226c8  ! 3132: LDUW_I	lduw	[%r8 + 0x06c8], %r12
	.word 0xcd3a0009  ! 3135: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcf1a0009  ! 3135: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x8143c000  ! 3135: STBAR	stbar
	.word 0xfe220009  ! 3138: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xc5020009  ! 3138: LDF_R	ld	[%r8, %r9], %f2
	.word 0xae720009  ! 3138: UDIV_R	udiv 	%r8, %r9, %r23
	.word 0xc53a0009  ! 3141: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc1a0009  ! 3141: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc21221a0  ! 3141: LDUH_I	lduh	[%r8 + 0x01a0], %r1
	.word 0xe02a0009  ! 3144: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc41a0009  ! 3144: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xdcf21009  ! 3144: STXA_R	stxa	%r14, [%r8 + %r9] 0x80
	.word 0xdc720009  ! 3147: STX_R	stx	%r14, [%r8 + %r9]
	.word 0xc81a0009  ! 3147: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc84a2b3c  ! 3147: LDSB_I	ldsb	[%r8 + 0x0b3c], %r4
	.word 0xc6720009  ! 3150: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xca020009  ! 3150: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcc9a1009  ! 3150: LDDA_R	ldda	[%r8, %r9] 0x80, %r6
	.word 0xc4720009  ! 3153: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 3153: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0xcb3a2d60  ! 3153: STDF_I	std	%f5, [0x0d60, %r8]
	.word 0xca220009  ! 3156: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 3156: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcb1a0009  ! 3156: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc53a0009  ! 3159: STDF_R	std	%f2, [%r9, %r8]
	.word 0xc8420009  ! 3159: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0xcc1a0009  ! 3159: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc2220009  ! 3162: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xce5a0009  ! 3162: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xde7a2d80  ! 3162: SWAP_I	swap	%r15, [%r8 + 0x0d80]
	.word 0xcc2a0009  ! 3165: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8120009  ! 3165: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x02c20001  ! 3165: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xc6320009  ! 3168: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc2520009  ! 3168: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcf3a0009  ! 3168: STDF_R	std	%f7, [%r9, %r8]
	.word 0xfa720009  ! 3171: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc6020009  ! 3171: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x04800001  ! 3171: BLE	ble  	<label_0x1>
	.word 0xcc220009  ! 3174: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xe0120009  ! 3174: LDUH_R	lduh	[%r8 + %r9], %r16
	.word 0x8143c000  ! 3174: STBAR	stbar
	.word 0xce2a0009  ! 3177: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc25a0009  ! 3177: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc36a2484  ! 3177: PREFETCH_I	prefetch	[%r8 + 0x0484], #one_read
	.word 0xcf3a0009  ! 3180: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc60a0009  ! 3180: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xcf3a0009  ! 3180: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc62a0009  ! 3183: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 3183: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8c6a0009  ! 3183: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0xc8320009  ! 3186: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc31a0009  ! 3186: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xc3ea2820  ! 3186: PREFETCHA_I	prefetcha	[%r8, + 0x0820] %asi, #one_read
	.word 0xc7220009  ! 3189: STF_R	st	%f3, [%r9, %r8]
	.word 0xc64a0009  ! 3189: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8143c000  ! 3189: STBAR	stbar
	.word 0xcc320009  ! 3192: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcd020009  ! 3192: LDF_R	ld	[%r8, %r9], %f6
	.word 0xc7f22009  ! 3192: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xca220009  ! 3195: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc6020009  ! 3195: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x0e800002  ! 3195: BVS	bvs  	<label_0x2>
	.word 0xcd220009  ! 3198: STF_R	st	%f6, [%r9, %r8]
	.word 0xca420009  ! 3198: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xdd02215c  ! 3198: LDF_I	ld	[%r8, 0x015c], %f14
	.word 0xce320009  ! 3201: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc25a0009  ! 3201: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x96f20009  ! 3201: UDIVcc_R	udivcc 	%r8, %r9, %r11
	.word 0xca2a0009  ! 3204: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xe25a0009  ! 3204: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x1e800002  ! 3204: BVC	bvc  	<label_0x2>
	.word 0xcd3a0009  ! 3207: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc84a0009  ! 3207: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xe0da1009  ! 3207: LDXA_R	ldxa	[%r8, %r9] 0x80, %r16
	.word 0xc93a0009  ! 3210: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce0a0009  ! 3210: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8143e029  ! 3210: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0xc6320009  ! 3213: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xf64a0009  ! 3213: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xc3ea2584  ! 3213: PREFETCHA_I	prefetcha	[%r8, + 0x0584] %asi, #one_read
	.word 0xe3220009  ! 3216: STF_R	st	%f17, [%r9, %r8]
	.word 0xcc4a0009  ! 3216: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x0cc20001  ! 3216: BRGZ	brgz  ,nt	%8,<label_0x20001>
	.word 0xec320009  ! 3219: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xc01a0009  ! 3219: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc67a0009  ! 3219: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xc7220009  ! 3222: STF_R	st	%f3, [%r9, %r8]
	.word 0xe01a0009  ! 3222: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x8143c000  ! 3222: STBAR	stbar
	.word 0xcb220009  ! 3225: STF_R	st	%f5, [%r9, %r8]
	.word 0xdb1a0009  ! 3225: LDDF_R	ldd	[%r8, %r9], %f13
	.word 0x34800001  ! 3225: BG	bg,a	<label_0x1>
	.word 0xc8720009  ! 3228: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce5a0009  ! 3228: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x22800001  ! 3228: BE	be,a	<label_0x1>
	.word 0xc7220009  ! 3231: STF_R	st	%f3, [%r9, %r8]
	.word 0xfc020009  ! 3231: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xdaea1009  ! 3231: LDSTUBA_R	ldstuba	%r13, [%r8 + %r9] 0x80
	.word 0xcf3a0009  ! 3234: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2520009  ! 3234: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x1c800002  ! 3234: BPOS	bpos  	<label_0x2>
	.word 0xcd3a0009  ! 3237: STDF_R	std	%f6, [%r9, %r8]
	.word 0xcf020009  ! 3237: LDF_R	ld	[%r8, %r9], %f7
	.word 0x8143c000  ! 3237: STBAR	stbar
	.word 0xee720009  ! 3240: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xcc020009  ! 3240: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc4b21009  ! 3240: STHA_R	stha	%r2, [%r8 + %r9] 0x80
	.word 0xc6720009  ! 3243: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc45a0009  ! 3243: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x30800001  ! 3243: BA	ba,a	<label_0x1>
	.word 0xc2320009  ! 3246: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc420009  ! 3246: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xceb21009  ! 3246: STHA_R	stha	%r7, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 3249: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf81a0009  ! 3249: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0xc3ea26e4  ! 3249: PREFETCHA_I	prefetcha	[%r8, + 0x06e4] %asi, #one_read
	.word 0xce220009  ! 3252: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf6520009  ! 3252: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0x9af22840  ! 3252: UDIVcc_I	udivcc 	%r8, 0x0840, %r13
	.word 0xcf3a0009  ! 3255: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc9020009  ! 3255: LDF_R	ld	[%r8, %r9], %f4
	.word 0xc36a2650  ! 3255: PREFETCH_I	prefetch	[%r8 + 0x0650], #one_read
	.word 0xf4720009  ! 3258: STX_R	stx	%r26, [%r8 + %r9]
	.word 0xcc120009  ! 3258: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xcc5a0009  ! 3258: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xca720009  ! 3261: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xce120009  ! 3261: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x8e6a2ef8  ! 3261: UDIVX_I	udivx 	%r8, 0x0ef8, %r7
	.word 0xc2320009  ! 3264: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc8420009  ! 3264: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x885a28b0  ! 3264: SMUL_I	smul 	%r8, 0x08b0, %r4
	.word 0xca2a0009  ! 3267: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc85a0009  ! 3267: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xeeb228d4  ! 3267: STHA_I	stha	%r23, [%r8 + 0x08d4] %asi
	.word 0xf9220009  ! 3270: STF_R	st	%f28, [%r9, %r8]
	.word 0xde520009  ! 3270: LDSH_R	ldsh	[%r8 + %r9], %r15
	.word 0xcd220009  ! 3270: STF_R	st	%f6, [%r9, %r8]
	.word 0xc42a0009  ! 3273: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xec1a0009  ! 3273: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc9f22009  ! 3273: CASXA_R	casxa	[%r8]%asi, %r9, %r4
	.word 0xc8720009  ! 3276: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc41a0009  ! 3276: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xe0ca2304  ! 3276: LDSBA_I	ldsba	[%r8, + 0x0304] %asi, %r16
	.word 0xce320009  ! 3279: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 3279: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xfd220009  ! 3279: STF_R	st	%f30, [%r9, %r8]
	.word 0xf5220009  ! 3282: STF_R	st	%f26, [%r9, %r8]
	.word 0xf6020009  ! 3282: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xcef21009  ! 3282: STXA_R	stxa	%r7, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 3285: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc44a0009  ! 3285: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc51a0009  ! 3285: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xce2a0009  ! 3288: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xe2520009  ! 3288: LDSH_R	ldsh	[%r8 + %r9], %r17
	.word 0xcde21009  ! 3288: CASA_I	casa	[%r8] 0x80, %r9, %r6
	.word 0xf8320009  ! 3291: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc2420009  ! 3291: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8ba209a9  ! 3291: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xe0720009  ! 3294: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xcc5a0009  ! 3294: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8143e034  ! 3294: MEMBAR	membar	#LoadStore | #Lookaside | #MemIssue 
	.word 0xe4320009  ! 3297: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xfe0a0009  ! 3297: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0x1c800001  ! 3297: BPOS	bpos  	<label_0x1>
	.word 0xcc720009  ! 3300: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc6420009  ! 3300: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xac7a2d94  ! 3300: SDIV_I	sdiv 	%r8, 0x0d94, %r22
	.word 0xc8320009  ! 3303: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe8020009  ! 3303: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xc3ea2ca8  ! 3303: PREFETCHA_I	prefetcha	[%r8, + 0x0ca8] %asi, #one_read
	.word 0xde320009  ! 3306: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xc44a0009  ! 3306: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xd8fa2368  ! 3306: SWAPA_I	swapa	%r12, [%r8 + 0x0368] %asi
	.word 0xcd220009  ! 3309: STF_R	st	%f6, [%r9, %r8]
	.word 0xca520009  ! 3309: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xfd3a2b30  ! 3309: STDF_I	std	%f30, [0x0b30, %r8]
	.word 0xc8720009  ! 3312: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc5020009  ! 3312: LDF_R	ld	[%r8, %r9], %f2
	.word 0x8c520009  ! 3312: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc2720009  ! 3315: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 3315: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8e7a2e14  ! 3315: SDIV_I	sdiv 	%r8, 0x0e14, %r7
	.word 0xce2a0009  ! 3318: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc51a0009  ! 3318: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0x8c5a0009  ! 3318: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xce720009  ! 3321: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xe0420009  ! 3321: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0xc8ba1009  ! 3321: STDA_R	stda	%r4, [%r8 + %r9] 0x80
	.word 0xf2720009  ! 3324: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xec4a0009  ! 3324: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xc70224d0  ! 3324: LDF_I	ld	[%r8, 0x04d0], %f3
	.word 0xcb220009  ! 3327: STF_R	st	%f5, [%r9, %r8]
	.word 0xec1a0009  ! 3327: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xc51a0009  ! 3327: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xe42a0009  ! 3330: STB_R	stb	%r18, [%r8 + %r9]
	.word 0xf0120009  ! 3330: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0xc8a22c4c  ! 3330: STWA_I	stwa	%r4, [%r8 + 0x0c4c] %asi
	.word 0xce320009  ! 3333: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc24a0009  ! 3333: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xc68a1009  ! 3333: LDUBA_R	lduba	[%r8, %r9] 0x80, %r3
	.word 0xc33a0009  ! 3336: STDF_R	std	%f1, [%r9, %r8]
	.word 0xee5a0009  ! 3336: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xc36a2678  ! 3336: PREFETCH_I	prefetch	[%r8 + 0x0678], #one_read
	.word 0xce220009  ! 3339: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc6020009  ! 3339: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xc9e22009  ! 3339: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xee220009  ! 3342: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xe8420009  ! 3342: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xf8f21009  ! 3342: STXA_R	stxa	%r28, [%r8 + %r9] 0x80
	.word 0xe6720009  ! 3345: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xca5a0009  ! 3345: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xf0120009  ! 3345: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0xc4720009  ! 3348: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca520009  ! 3348: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc6aa1009  ! 3348: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xce220009  ! 3351: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfe020009  ! 3351: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0x84f20009  ! 3351: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xf53a0009  ! 3354: STDF_R	std	%f26, [%r9, %r8]
	.word 0xce520009  ! 3354: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x89a20829  ! 3354: FADDs	fadds	%f8, %f9, %f4
	.word 0xcc220009  ! 3357: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc84a0009  ! 3357: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xc36a0009  ! 3357: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf2320009  ! 3360: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xf2520009  ! 3360: LDSH_R	ldsh	[%r8 + %r9], %r25
	.word 0x04c20001  ! 3360: BRLEZ	brlez  ,nt	%8,<label_0x20001>
	.word 0xce220009  ! 3363: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xca4a0009  ! 3363: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc71a0009  ! 3363: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xda2a0009  ! 3366: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xfb020009  ! 3366: LDF_R	ld	[%r8, %r9], %f29
	.word 0xce6a0009  ! 3366: LDSTUB_R	ldstub	%r7, [%r8 + %r9]
	.word 0xfd3a0009  ! 3369: STDF_R	std	%f30, [%r9, %r8]
	.word 0xf60a0009  ! 3369: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0xc36a0009  ! 3369: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe02a0009  ! 3372: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xc60a0009  ! 3372: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xf0ea2340  ! 3372: LDSTUBA_I	ldstuba	%r24, [%r8 + 0x0340] %asi
	.word 0xce220009  ! 3375: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xce120009  ! 3375: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x85a209a9  ! 3375: FDIVs	fdivs	%f8, %f9, %f2
	.word 0xcd220009  ! 3378: STF_R	st	%f6, [%r9, %r8]
	.word 0xce120009  ! 3378: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xccda1009  ! 3378: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xc4220009  ! 3381: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xf8420009  ! 3381: LDSW_R	ldsw	[%r8 + %r9], %r28
	.word 0x8143c000  ! 3381: STBAR	stbar
	.word 0xca320009  ! 3384: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 3384: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x3c800002  ! 3384: BPOS	bpos,a	<label_0x2>
	.word 0xc8720009  ! 3387: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc4020009  ! 3387: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0x24800001  ! 3387: BLE	ble,a	<label_0x1>
	.word 0xf4320009  ! 3390: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xea0a0009  ! 3390: LDUB_R	ldub	[%r8 + %r9], %r21
	.word 0xc9e21009  ! 3390: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xf8720009  ! 3393: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xcc520009  ! 3393: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xc36a0009  ! 3393: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf0220009  ! 3396: STW_R	stw	%r24, [%r8 + %r9]
	.word 0xc71a0009  ! 3396: LDDF_R	ldd	[%r8, %r9], %f3
	.word 0xda520009  ! 3396: LDSH_R	ldsh	[%r8 + %r9], %r13
	.word 0xfe320009  ! 3399: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc64a0009  ! 3399: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xfff22009  ! 3399: CASXA_R	casxa	[%r8]%asi, %r9, %r31
	.word 0xca220009  ! 3402: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xf01a0009  ! 3402: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x8143c000  ! 3402: STBAR	stbar
	.word 0xcc720009  ! 3405: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xfa0a0009  ! 3405: LDUB_R	ldub	[%r8 + %r9], %r29
	.word 0xcc520009  ! 3405: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xcd220009  ! 3408: STF_R	st	%f6, [%r9, %r8]
	.word 0xc44a0009  ! 3408: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xc91a0009  ! 3408: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xcd220009  ! 3411: STF_R	st	%f6, [%r9, %r8]
	.word 0xcb020009  ! 3411: LDF_R	ld	[%r8, %r9], %f5
	.word 0xc36a2cd8  ! 3411: PREFETCH_I	prefetch	[%r8 + 0x0cd8], #one_read
	.word 0xca720009  ! 3414: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc25a0009  ! 3414: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc81a2760  ! 3414: LDD_I	ldd	[%r8 + 0x0760], %r4
	.word 0xca2a0009  ! 3417: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xca4a0009  ! 3417: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xe87a2728  ! 3417: SWAP_I	swap	%r20, [%r8 + 0x0728]
	.word 0xc7220009  ! 3420: STF_R	st	%f3, [%r9, %r8]
	.word 0xec1a0009  ! 3420: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xcfe22009  ! 3420: CASA_R	casa	[%r8] %asi, %r9, %r7
	.word 0xc5220009  ! 3423: STF_R	st	%f2, [%r9, %r8]
	.word 0xcd020009  ! 3423: LDF_R	ld	[%r8, %r9], %f6
	.word 0xf7f22009  ! 3423: CASXA_R	casxa	[%r8]%asi, %r9, %r27
	.word 0xfb3a0009  ! 3426: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc40a0009  ! 3426: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xc3ea2b28  ! 3426: PREFETCHA_I	prefetcha	[%r8, + 0x0b28] %asi, #one_read
	.word 0xfb3a0009  ! 3429: STDF_R	std	%f29, [%r9, %r8]
	.word 0xcd020009  ! 3429: LDF_R	ld	[%r8, %r9], %f6
	.word 0x9fa209a9  ! 3429: FDIVs	fdivs	%f8, %f9, %f15
	.word 0xcc720009  ! 3432: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc6120009  ! 3432: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x9e720009  ! 3432: UDIV_R	udiv 	%r8, %r9, %r15
	.word 0xce320009  ! 3435: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf41a0009  ! 3435: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0xc01a2298  ! 3435: LDD_I	ldd	[%r8 + 0x0298], %r0
	.word 0xc82a0009  ! 3438: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc25a0009  ! 3438: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xc93a2a18  ! 3438: STDF_I	std	%f4, [0x0a18, %r8]
	.word 0xc42a0009  ! 3441: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xf4520009  ! 3441: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x10800001  ! 3441: BA	ba  	<label_0x1>
	.word 0xc62a0009  ! 3444: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce420009  ! 3444: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xc4a227e0  ! 3444: STWA_I	stwa	%r2, [%r8 + 0x07e0] %asi
	.word 0xc3220009  ! 3447: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4520009  ! 3447: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcd020009  ! 3447: LDF_R	ld	[%r8, %r9], %f6
	.word 0xfc220009  ! 3450: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc01a0009  ! 3450: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc36a2f74  ! 3450: PREFETCH_I	prefetch	[%r8 + 0x0f74], #one_read
	.word 0xcc320009  ! 3453: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xce120009  ! 3453: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0x24ca0001  ! 3453: BRLEZ	brlez,a,pt	%8,<label_0xa0001>
	.word 0xcc720009  ! 3456: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf05a0009  ! 3456: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0xc49a28e8  ! 3456: LDDA_I	ldda	[%r8, + 0x08e8] %asi, %r2
	.word 0xca220009  ! 3459: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 3459: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc5f22009  ! 3459: CASXA_R	casxa	[%r8]%asi, %r9, %r2
	.word 0xf8720009  ! 3462: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xce4a0009  ! 3462: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xa9a20929  ! 3462: FMULs	fmuls	%f8, %f9, %f20
	.word 0xcf220009  ! 3465: STF_R	st	%f7, [%r9, %r8]
	.word 0xc85a0009  ! 3465: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xccb21009  ! 3465: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xc8720009  ! 3468: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc2020009  ! 3468: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xcc1a23e0  ! 3468: LDD_I	ldd	[%r8 + 0x03e0], %r6
	.word 0xc82a0009  ! 3471: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc6520009  ! 3471: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xcefa1009  ! 3471: SWAPA_R	swapa	%r7, [%r8 + %r9] 0x80
	.word 0xc2320009  ! 3474: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4420009  ! 3474: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc49a1009  ! 3474: LDDA_R	ldda	[%r8, %r9] 0x80, %r2
	.word 0xe33a0009  ! 3477: STDF_R	std	%f17, [%r9, %r8]
	.word 0xfa120009  ! 3477: LDUH_R	lduh	[%r8 + %r9], %r29
	.word 0x8cd20009  ! 3477: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xc22a0009  ! 3480: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xdf020009  ! 3480: LDF_R	ld	[%r8, %r9], %f15
	.word 0xcbe22009  ! 3480: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xce320009  ! 3483: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xca120009  ! 3483: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcaaa2a48  ! 3483: STBA_I	stba	%r5, [%r8 + 0x0a48] %asi
	.word 0xc8320009  ! 3486: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xea5a0009  ! 3486: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x02c20001  ! 3486: BRZ	brz  ,nt	%8,<label_0x20001>
	.word 0xca2a0009  ! 3489: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 3489: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x866a0009  ! 3489: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xcd220009  ! 3492: STF_R	st	%f6, [%r9, %r8]
	.word 0xe4520009  ! 3492: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0xceaa1009  ! 3492: STBA_R	stba	%r7, [%r8 + %r9] 0x80
	.word 0xca320009  ! 3495: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc6120009  ! 3495: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0xf86a0009  ! 3495: LDSTUB_R	ldstub	%r28, [%r8 + %r9]
	.word 0xcd3a0009  ! 3498: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca4a0009  ! 3498: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xc6ca21e4  ! 3498: LDSBA_I	ldsba	[%r8, + 0x01e4] %asi, %r3
	.word 0xcc220009  ! 3501: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca420009  ! 3501: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8143c000  ! 3501: STBAR	stbar
	.word 0xf8320009  ! 3504: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc84a0009  ! 3504: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xf0da2968  ! 3504: LDXA_I	ldxa	[%r8, + 0x0968] %asi, %r24
	.word 0xc2720009  ! 3507: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 3507: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0xce4a23c8  ! 3507: LDSB_I	ldsb	[%r8 + 0x03c8], %r7
	.word 0xdc320009  ! 3510: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc81a0009  ! 3510: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x10800002  ! 3510: BA	ba  	<label_0x2>
	.word 0xc4320009  ! 3513: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc84a0009  ! 3513: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x26c20001  ! 3513: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc8320009  ! 3516: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf9020009  ! 3516: LDF_R	ld	[%r8, %r9], %f28
	.word 0xc3ea248c  ! 3516: PREFETCHA_I	prefetcha	[%r8, + 0x048c] %asi, #one_read
	.word 0xe4320009  ! 3519: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xca020009  ! 3519: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x9c7a0009  ! 3519: SDIV_R	sdiv 	%r8, %r9, %r14
	.word 0xca2a0009  ! 3522: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xec020009  ! 3522: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0xccba2c98  ! 3522: STDA_I	stda	%r6, [%r8 + 0x0c98] %asi
	.word 0xcc720009  ! 3525: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcc120009  ! 3525: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x884a0009  ! 3525: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xc5220009  ! 3528: STF_R	st	%f2, [%r9, %r8]
	.word 0xce020009  ! 3528: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8143e008  ! 3528: MEMBAR	membar	#StoreStore 
	.word 0xca320009  ! 3531: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4420009  ! 3531: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x26800002  ! 3531: BL	bl,a	<label_0x2>
	.word 0xcc720009  ! 3534: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xe2020009  ! 3534: LDUW_R	lduw	[%r8 + %r9], %r17
	.word 0xc36a0009  ! 3534: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc8220009  ! 3537: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xca120009  ! 3537: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xcf3a24a0  ! 3537: STDF_I	std	%f7, [0x04a0, %r8]
	.word 0xcc2a0009  ! 3540: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xca4a0009  ! 3540: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xcdf21009  ! 3540: CASXA_I	casxa	[%r8] 0x80, %r9, %r6
	.word 0xf6320009  ! 3543: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xe5020009  ! 3543: LDF_R	ld	[%r8, %r9], %f18
	.word 0x28800002  ! 3543: BLEU	bleu,a	<label_0x2>
	.word 0xcb3a0009  ! 3546: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc01a0009  ! 3546: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc8c21009  ! 3546: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r4
	.word 0xe2220009  ! 3549: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc2420009  ! 3549: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xd73a0009  ! 3549: STDF_R	std	%f11, [%r9, %r8]
	.word 0xdd3a0009  ! 3552: STDF_R	std	%f14, [%r9, %r8]
	.word 0xc4120009  ! 3552: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xcbe22009  ! 3552: CASA_R	casa	[%r8] %asi, %r9, %r5
	.word 0xee220009  ! 3555: STW_R	stw	%r23, [%r8 + %r9]
	.word 0xc81a0009  ! 3555: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8143c000  ! 3555: STBAR	stbar
	.word 0xc2320009  ! 3558: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xde020009  ! 3558: LDUW_R	lduw	[%r8 + %r9], %r15
	.word 0xc36a2ee8  ! 3558: PREFETCH_I	prefetch	[%r8 + 0x0ee8], #one_read
	.word 0xe0720009  ! 3561: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xea420009  ! 3561: LDSW_R	ldsw	[%r8 + %r9], %r21
	.word 0xa8722078  ! 3561: UDIV_I	udiv 	%r8, 0x0078, %r20
	.word 0xc9220009  ! 3564: STF_R	st	%f4, [%r9, %r8]
	.word 0xd65a0009  ! 3564: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc36a0009  ! 3564: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xc62a0009  ! 3567: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xff020009  ! 3567: LDF_R	ld	[%r8, %r9], %f31
	.word 0xc6aa2828  ! 3567: STBA_I	stba	%r3, [%r8 + 0x0828] %asi
	.word 0xc6320009  ! 3570: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc4520009  ! 3570: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc8b21009  ! 3570: STHA_R	stha	%r4, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 3573: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcd020009  ! 3573: LDF_R	ld	[%r8, %r9], %f6
	.word 0xbda209a9  ! 3573: FDIVs	fdivs	%f8, %f9, %f30
	.word 0xc8320009  ! 3576: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4520009  ! 3576: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8143e025  ! 3576: MEMBAR	membar	#LoadLoad | #LoadStore | #MemIssue 
	.word 0xc4320009  ! 3579: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc4420009  ! 3579: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x965a2900  ! 3579: SMUL_I	smul 	%r8, 0x0900, %r11
	.word 0xe2720009  ! 3582: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc80a0009  ! 3582: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xfaaa2dd0  ! 3582: STBA_I	stba	%r29, [%r8 + 0x0dd0] %asi
	.word 0xd62a0009  ! 3585: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xcc020009  ! 3585: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x836a268c  ! 3585: SDIVX_I	sdivx	%r8, 0x068c, %r1
	.word 0xef3a0009  ! 3588: STDF_R	std	%f23, [%r9, %r8]
	.word 0xd8420009  ! 3588: LDSW_R	ldsw	[%r8 + %r9], %r12
	.word 0x0c800001  ! 3588: BNEG	bneg  	<label_0x1>
	.word 0xfc220009  ! 3591: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xe1020009  ! 3591: LDF_R	ld	[%r8, %r9], %f16
	.word 0x8143e061  ! 3591: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xc93a0009  ! 3594: STDF_R	std	%f4, [%r9, %r8]
	.word 0xcf1a0009  ! 3594: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xfab21009  ! 3594: STHA_R	stha	%r29, [%r8 + %r9] 0x80
	.word 0xc53a0009  ! 3597: STDF_R	std	%f2, [%r9, %r8]
	.word 0xcc0a0009  ! 3597: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x2e800001  ! 3597: BVS	bvs,a	<label_0x1>
	.word 0xc9220009  ! 3600: STF_R	st	%f4, [%r9, %r8]
	.word 0xf25a0009  ! 3600: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0xc3ea2994  ! 3600: PREFETCHA_I	prefetcha	[%r8, + 0x0994] %asi, #one_read
	.word 0xea720009  ! 3603: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xce5a0009  ! 3603: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc9e21009  ! 3603: CASA_I	casa	[%r8] 0x80, %r9, %r4
	.word 0xf0320009  ! 3606: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc31a0009  ! 3606: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0xca9226f0  ! 3606: LDUHA_I	lduha	[%r8, + 0x06f0] %asi, %r5
	.word 0xca220009  ! 3609: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc4a0009  ! 3609: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0xccca1009  ! 3609: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r6
	.word 0xfa2a0009  ! 3612: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xda120009  ! 3612: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x8da20829  ! 3612: FADDs	fadds	%f8, %f9, %f6
	.word 0xda2a0009  ! 3615: STB_R	stb	%r13, [%r8 + %r9]
	.word 0xcb1a0009  ! 3615: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x8143c000  ! 3615: STBAR	stbar
	.word 0xf33a0009  ! 3618: STDF_R	std	%f25, [%r9, %r8]
	.word 0xfc020009  ! 3618: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xccba2ea8  ! 3618: STDA_I	stda	%r6, [%r8 + 0x0ea8] %asi
	.word 0xc9220009  ! 3621: STF_R	st	%f4, [%r9, %r8]
	.word 0xc4120009  ! 3621: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8143e031  ! 3621: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xcb3a0009  ! 3624: STDF_R	std	%f5, [%r9, %r8]
	.word 0xea020009  ! 3624: LDUW_R	lduw	[%r8 + %r9], %r21
	.word 0xc3ea20ac  ! 3624: PREFETCHA_I	prefetcha	[%r8, + 0x00ac] %asi, #one_read
	.word 0xce320009  ! 3627: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 3627: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xe4da2340  ! 3627: LDXA_I	ldxa	[%r8, + 0x0340] %asi, %r18
	.word 0xcf3a0009  ! 3630: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce5a0009  ! 3630: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xc3ea25c4  ! 3630: PREFETCHA_I	prefetcha	[%r8, + 0x05c4] %asi, #one_read
	.word 0xc6320009  ! 3633: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc40a0009  ! 3633: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8da20929  ! 3633: FMULs	fmuls	%f8, %f9, %f6
	.word 0xc3220009  ! 3636: STF_R	st	%f1, [%r9, %r8]
	.word 0xce4a0009  ! 3636: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc36a223c  ! 3636: PREFETCH_I	prefetch	[%r8 + 0x023c], #one_read
	.word 0xe0720009  ! 3639: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xcf1a0009  ! 3639: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xa522286c  ! 3639: MULScc_I	mulscc 	%r8, 0x086c, %r18
	.word 0xc8720009  ! 3642: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc01a0009  ! 3642: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xc31a28a0  ! 3642: LDDF_I	ldd	[%r8, 0x08a0], %f1
	.word 0xc2720009  ! 3645: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf6520009  ! 3645: LDSH_R	ldsh	[%r8 + %r9], %r27
	.word 0x8ba209a9  ! 3645: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xcb220009  ! 3648: STF_R	st	%f5, [%r9, %r8]
	.word 0xc64a0009  ! 3648: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x864a2f44  ! 3648: MULX_I	mulx 	%r8, 0x0f44, %r3
	.word 0xf33a0009  ! 3651: STDF_R	std	%f25, [%r9, %r8]
	.word 0xe41a0009  ! 3651: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x89a208a9  ! 3651: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xcb220009  ! 3654: STF_R	st	%f5, [%r9, %r8]
	.word 0xc4520009  ! 3654: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xc4ca2ff4  ! 3654: LDSBA_I	ldsba	[%r8, + 0x0ff4] %asi, %r2
	.word 0xca220009  ! 3657: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcd1a0009  ! 3657: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xfeb21009  ! 3657: STHA_R	stha	%r31, [%r8 + %r9] 0x80
	.word 0xca720009  ! 3660: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc51a0009  ! 3660: LDDF_R	ldd	[%r8, %r9], %f2
	.word 0xc36a0009  ! 3660: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xfc720009  ! 3663: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc60a0009  ! 3663: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xd6f21009  ! 3663: STXA_R	stxa	%r11, [%r8 + %r9] 0x80
	.word 0xd93a0009  ! 3666: STDF_R	std	%f12, [%r9, %r8]
	.word 0xc4520009  ! 3666: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xcb3a2d88  ! 3666: STDF_I	std	%f5, [0x0d88, %r8]
	.word 0xc8220009  ! 3669: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfc120009  ! 3669: LDUH_R	lduh	[%r8 + %r9], %r30
	.word 0xc81a2518  ! 3669: LDD_I	ldd	[%r8 + 0x0518], %r4
	.word 0xc73a0009  ! 3672: STDF_R	std	%f3, [%r9, %r8]
	.word 0xca420009  ! 3672: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xc3ea28dc  ! 3672: PREFETCHA_I	prefetcha	[%r8, + 0x08dc] %asi, #one_read
	.word 0xc5220009  ! 3675: STF_R	st	%f2, [%r9, %r8]
	.word 0xcd1a0009  ! 3675: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0xcaa22fc0  ! 3675: STWA_I	stwa	%r5, [%r8 + 0x0fc0] %asi
	.word 0xf62a0009  ! 3678: STB_R	stb	%r27, [%r8 + %r9]
	.word 0xd81a0009  ! 3678: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x8143c000  ! 3678: STBAR	stbar
	.word 0xc33a0009  ! 3681: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce4a0009  ! 3681: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc6da1009  ! 3681: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xce320009  ! 3684: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc24a0009  ! 3684: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xe6c22e44  ! 3684: LDSWA_I	ldswa	[%r8, + 0x0e44] %asi, %r19
	.word 0xcf220009  ! 3687: STF_R	st	%f7, [%r9, %r8]
	.word 0xc4420009  ! 3687: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xc67a0009  ! 3687: SWAP_R	swap	%r3, [%r8 + %r9]
	.word 0xfd220009  ! 3690: STF_R	st	%f30, [%r9, %r8]
	.word 0xc81a0009  ! 3690: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xceca2c24  ! 3690: LDSBA_I	ldsba	[%r8, + 0x0c24] %asi, %r7
	.word 0xce2a0009  ! 3693: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd6120009  ! 3693: LDUH_R	lduh	[%r8 + %r9], %r11
	.word 0xc47a0009  ! 3693: SWAP_R	swap	%r2, [%r8 + %r9]
	.word 0xc3220009  ! 3696: STF_R	st	%f1, [%r9, %r8]
	.word 0xd65a0009  ! 3696: LDX_R	ldx	[%r8 + %r9], %r11
	.word 0xc36a0009  ! 3696: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xf0320009  ! 3699: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xc01a0009  ! 3699: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xccda1009  ! 3699: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0xc33a0009  ! 3702: STDF_R	std	%f1, [%r9, %r8]
	.word 0xcb1a0009  ! 3702: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xc3ea2448  ! 3702: PREFETCHA_I	prefetcha	[%r8, + 0x0448] %asi, #one_read
	.word 0xc3220009  ! 3705: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4520009  ! 3705: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0xe08a2114  ! 3705: LDUBA_I	lduba	[%r8, + 0x0114] %asi, %r16
	.word 0xf2320009  ! 3708: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xcc420009  ! 3708: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xc28221dc  ! 3708: LDUWA_I	lduwa	[%r8, + 0x01dc] %asi, %r1
	.word 0xca720009  ! 3711: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc8020009  ! 3711: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0xfea21009  ! 3711: STWA_R	stwa	%r31, [%r8 + %r9] 0x80
	.word 0xce220009  ! 3714: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf6120009  ! 3714: LDUH_R	lduh	[%r8 + %r9], %r27
	.word 0xc8ba2338  ! 3714: STDA_I	stda	%r4, [%r8 + 0x0338] %asi
	.word 0xca320009  ! 3717: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xcc0a0009  ! 3717: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x83a20929  ! 3717: FMULs	fmuls	%f8, %f9, %f1
	.word 0xc4220009  ! 3720: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc2520009  ! 3720: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xe28a2e2c  ! 3720: LDUBA_I	lduba	[%r8, + 0x0e2c] %asi, %r17
	.word 0xc4220009  ! 3723: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 3723: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x85a208a9  ! 3723: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xcd220009  ! 3726: STF_R	st	%f6, [%r9, %r8]
	.word 0xcf1a0009  ! 3726: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0x896a0009  ! 3726: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xcf220009  ! 3729: STF_R	st	%f7, [%r9, %r8]
	.word 0xc6520009  ! 3729: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xc36a2c88  ! 3729: PREFETCH_I	prefetch	[%r8 + 0x0c88], #one_read
	.word 0xfa220009  ! 3732: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xec1a0009  ! 3732: LDD_R	ldd	[%r8 + %r9], %r22
	.word 0xca020009  ! 3732: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xcb3a0009  ! 3735: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc2020009  ! 3735: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xc36a0009  ! 3735: PREFETCH_R	prefetch	[%r8 + %r9], #one_read
	.word 0xe4720009  ! 3738: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xcc4a0009  ! 3738: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x10800001  ! 3738: BA	ba  	<label_0x1>
	.word 0xe1220009  ! 3741: STF_R	st	%f16, [%r9, %r8]
	.word 0xfe4a0009  ! 3741: LDSB_R	ldsb	[%r8 + %r9], %r31
	.word 0xc4ba29e0  ! 3741: STDA_I	stda	%r2, [%r8 + 0x09e0] %asi
	.word 0xc93a0009  ! 3744: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce520009  ! 3744: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xc6da1009  ! 3744: LDXA_R	ldxa	[%r8, %r9] 0x80, %r3
	.word 0xcc220009  ! 3747: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xee420009  ! 3747: LDSW_R	ldsw	[%r8 + %r9], %r23
	.word 0xc32222d8  ! 3747: STF_I	st	%f1, [0x02d8, %r8]
	.word 0xce2a0009  ! 3750: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 3750: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0xc4a228b0  ! 3750: STWA_I	stwa	%r2, [%r8 + 0x08b0] %asi
	.word 0xf5220009  ! 3753: STF_R	st	%f26, [%r9, %r8]
	.word 0xc60a0009  ! 3753: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0xf0922840  ! 3753: LDUHA_I	lduha	[%r8, + 0x0840] %asi, %r24
	.word 0xcf220009  ! 3756: STF_R	st	%f7, [%r9, %r8]
	.word 0xcc020009  ! 3756: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8cd20009  ! 3756: UMULcc_R	umulcc 	%r8, %r9, %r6
	.word 0xc2220009  ! 3759: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc85a0009  ! 3759: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xda020009  ! 3759: LDUW_R	lduw	[%r8 + %r9], %r13
	.word 0xd73a0009  ! 3762: STDF_R	std	%f11, [%r9, %r8]
	.word 0xdc520009  ! 3762: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x8c522534  ! 3762: UMUL_I	umul 	%r8, 0x0534, %r6
	.word 0xc6320009  ! 3765: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xce5a0009  ! 3765: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xfada2038  ! 3765: LDXA_I	ldxa	[%r8, + 0x0038] %asi, %r29
	.word 0xf1220009  ! 3768: STF_R	st	%f24, [%r9, %r8]
	.word 0xec520009  ! 3768: LDSH_R	ldsh	[%r8 + %r9], %r22
	.word 0xc36a2490  ! 3768: PREFETCH_I	prefetch	[%r8 + 0x0490], #one_read
	.word 0xcd3a0009  ! 3771: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc7020009  ! 3771: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8143e038  ! 3771: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0xed3a0009  ! 3774: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc81a0009  ! 3774: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x1e800001  ! 3774: BVC	bvc  	<label_0x1>
	.word 0xca220009  ! 3777: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xea5a0009  ! 3777: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0xc36a21e4  ! 3777: PREFETCH_I	prefetch	[%r8 + 0x01e4], #one_read
	.word 0xf8320009  ! 3780: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc6120009  ! 3780: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8e720009  ! 3780: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc2320009  ! 3783: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xfa5a0009  ! 3783: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x26c20001  ! 3783: BRLZ	brlz,a,nt	%8,<label_0x20001>
	.word 0xc6720009  ! 3786: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc5a0009  ! 3786: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xf09a2860  ! 3786: LDDA_I	ldda	[%r8, + 0x0860] %asi, %r24
	.word 0xce320009  ! 3789: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xde4a0009  ! 3789: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0xcd3a2e88  ! 3789: STDF_I	std	%f6, [0x0e88, %r8]
	.word 0xcd3a0009  ! 3792: STDF_R	std	%f6, [%r9, %r8]
	.word 0xce520009  ! 3792: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0xfcca1009  ! 3792: LDSBA_R	ldsba	[%r8, %r9] 0x80, %r30
	.word 0xf8720009  ! 3795: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xcc020009  ! 3795: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xc3ea2c94  ! 3795: PREFETCHA_I	prefetcha	[%r8, + 0x0c94] %asi, #one_read
	.word 0xe6320009  ! 3798: STH_R	sth	%r19, [%r8 + %r9]
	.word 0xe2420009  ! 3798: LDSW_R	ldsw	[%r8 + %r9], %r17
	.word 0xc6aa1009  ! 3798: STBA_R	stba	%r3, [%r8 + %r9] 0x80
	.word 0xdf3a0009  ! 3801: STDF_R	std	%f15, [%r9, %r8]
	.word 0xf80a0009  ! 3801: LDUB_R	ldub	[%r8 + %r9], %r28
	.word 0x8143e056  ! 3801: MEMBAR	membar	#StoreLoad | #LoadStore | #Lookaside | #Sync 
	.word 0xc8320009  ! 3804: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 3804: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xcca226d0  ! 3804: STWA_I	stwa	%r6, [%r8 + 0x06d0] %asi
	.word 0xce220009  ! 3807: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xe4020009  ! 3807: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xcaaa1009  ! 3807: STBA_R	stba	%r5, [%r8 + %r9] 0x80
	.word 0xd8320009  ! 3810: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc40a0009  ! 3810: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0xe6ea1009  ! 3810: LDSTUBA_R	ldstuba	%r19, [%r8 + %r9] 0x80
	.word 0xed220009  ! 3813: STF_R	st	%f22, [%r9, %r8]
	.word 0xc2520009  ! 3813: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xcada1009  ! 3813: LDXA_R	ldxa	[%r8, %r9] 0x80, %r5
	.word 0xc5220009  ! 3816: STF_R	st	%f2, [%r9, %r8]
	.word 0xcd020009  ! 3816: LDF_R	ld	[%r8, %r9], %f6
	.word 0xb56a2d6c  ! 3816: SDIVX_I	sdivx	%r8, 0x0d6c, %r26
	.word 0xe8320009  ! 3819: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xf2420009  ! 3819: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xc3f22009  ! 3819: CASXA_R	casxa	[%r8]%asi, %r9, %r1
	.word 0xe13a0009  ! 3822: STDF_R	std	%f16, [%r9, %r8]
	.word 0xf0520009  ! 3822: LDSH_R	ldsh	[%r8 + %r9], %r24
	.word 0x88520009  ! 3822: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xca2a0009  ! 3825: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc81a0009  ! 3825: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xb3a209a9  ! 3825: FDIVs	fdivs	%f8, %f9, %f25
	.word 0xca2a0009  ! 3828: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd6420009  ! 3828: LDSW_R	ldsw	[%r8 + %r9], %r11
	.word 0xccf21009  ! 3828: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xd8320009  ! 3831: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xce520009  ! 3831: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x8143c000  ! 3831: STBAR	stbar
	.word 0xcc220009  ! 3834: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc6420009  ! 3834: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x3a800001  ! 3834: BCC	bcc,a	<label_0x1>
	.word 0xc4320009  ! 3837: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf8520009  ! 3837: LDSH_R	ldsh	[%r8 + %r9], %r28
	.word 0x06ca0001  ! 3837: BRLZ	brlz  ,pt	%8,<label_0xa0001>
	.word 0xfb220009  ! 3840: STF_R	st	%f29, [%r9, %r8]
	.word 0xe8120009  ! 3840: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0x89a20929  ! 3840: FMULs	fmuls	%f8, %f9, %f4
	.word 0xcc720009  ! 3843: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xcb1a0009  ! 3843: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x825a25c4  ! 3843: SMUL_I	smul 	%r8, 0x05c4, %r1
	.word 0xc9220009  ! 3846: STF_R	st	%f4, [%r9, %r8]
	.word 0xce120009  ! 3846: LDUH_R	lduh	[%r8 + %r9], %r7
	.word 0xfd3a2408  ! 3846: STDF_I	std	%f30, [0x0408, %r8]
	.word 0xe2320009  ! 3849: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc81a0009  ! 3849: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xe40a0009  ! 3849: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xc3220009  ! 3852: STF_R	st	%f1, [%r9, %r8]
	.word 0xc3020009  ! 3852: LDF_R	ld	[%r8, %r9], %f1
	.word 0xc3ea1009  ! 3852: PREFETCHA_R	prefetcha	[%r8, %r9] 0x80, #one_read
	.word 0xfa2a0009  ! 3855: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc65a0009  ! 3855: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8d220009  ! 3855: MULScc_R	mulscc 	%r8, %r9, %r6
	.word 0xcd220009  ! 3858: STF_R	st	%f6, [%r9, %r8]
	.word 0xc64a0009  ! 3858: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0xfcb21009  ! 3858: STHA_R	stha	%r30, [%r8 + %r9] 0x80
	.word 0xc4320009  ! 3861: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc020009  ! 3861: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0xf28229a4  ! 3861: LDUWA_I	lduwa	[%r8, + 0x09a4] %asi, %r25
	.word 0xca720009  ! 3864: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc8020009  ! 3864: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8e720009  ! 3864: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xcc220009  ! 3867: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc81a0009  ! 3867: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0xc2da1009  ! 3867: LDXA_R	ldxa	[%r8, %r9] 0x80, %r1
	.word 0xc42a0009  ! 3870: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc91a0009  ! 3870: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xfcba2798  ! 3870: STDA_I	stda	%r30, [%r8 + 0x0798] %asi
	.word 0xc8720009  ! 3873: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce520009  ! 3873: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x0cca0001  ! 3873: BRGZ	brgz  ,pt	%8,<label_0xa0001>
	.word 0xdc320009  ! 3876: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xcc420009  ! 3876: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0xccf21009  ! 3876: STXA_R	stxa	%r6, [%r8 + %r9] 0x80
	.word 0xe2320009  ! 3879: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc4420009  ! 3879: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8eda0009  ! 3879: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xce220009  ! 3882: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xf3020009  ! 3882: LDF_R	ld	[%r8, %r9], %f25
	.word 0x8a7a24cc  ! 3882: SDIV_I	sdiv 	%r8, 0x04cc, %r5
	.word 0xc8220009  ! 3885: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe4020009  ! 3885: LDUW_R	lduw	[%r8 + %r9], %r18
	.word 0xc7f22009  ! 3885: CASXA_R	casxa	[%r8]%asi, %r9, %r3
	.word 0xca220009  ! 3888: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc80a0009  ! 3888: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8143e033  ! 3888: MEMBAR	membar	#LoadLoad | #StoreLoad | #Lookaside | #MemIssue 
	.word 0xe0320009  ! 3891: STH_R	sth	%r16, [%r8 + %r9]
	.word 0xf64a0009  ! 3891: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xc41a0009  ! 3891: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xed3a0009  ! 3894: STDF_R	std	%f22, [%r9, %r8]
	.word 0xca5a0009  ! 3894: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xc9e22009  ! 3894: CASA_R	casa	[%r8] %asi, %r9, %r4
	.word 0xc62a0009  ! 3897: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xf4420009  ! 3897: LDSW_R	ldsw	[%r8 + %r9], %r26
	.word 0xc44a2d70  ! 3897: LDSB_I	ldsb	[%r8 + 0x0d70], %r2
	.word 0xc7220009  ! 3900: STF_R	st	%f3, [%r9, %r8]
	.word 0xc41a0009  ! 3900: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xc4f21009  ! 3900: STXA_R	stxa	%r2, [%r8 + %r9] 0x80
	.word 0xf0320009  ! 3903: STH_R	sth	%r24, [%r8 + %r9]
	.word 0xcc520009  ! 3903: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8143e01e  ! 3903: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Lookaside 
	.word 0xea720009  ! 3906: STX_R	stx	%r21, [%r8 + %r9]
	.word 0xc4420009  ! 3906: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x8143c000  ! 3906: STBAR	stbar
	.word 0xca220009  ! 3909: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc40a0009  ! 3909: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x88520009  ! 3909: UMUL_R	umul 	%r8, %r9, %r4
	.word 0xc4720009  ! 3912: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xcc1a0009  ! 3912: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xc4fa1009  ! 3912: SWAPA_R	swapa	%r2, [%r8 + %r9] 0x80
	.word 0xce320009  ! 3915: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 3915: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xc2ea1009  ! 3915: LDSTUBA_R	ldstuba	%r1, [%r8 + %r9] 0x80
	.word 0xc5220009  ! 3918: STF_R	st	%f2, [%r9, %r8]
	.word 0xdd020009  ! 3918: LDF_R	ld	[%r8, %r9], %f14
	.word 0xccaa2ce4  ! 3918: STBA_I	stba	%r6, [%r8 + 0x0ce4] %asi
	.word 0xee320009  ! 3921: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xcc120009  ! 3921: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0xf4b229a0  ! 3921: STHA_I	stha	%r26, [%r8 + 0x09a0] %asi
	.word 0xda320009  ! 3924: STH_R	sth	%r13, [%r8 + %r9]
	.word 0xe71a0009  ! 3924: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xee6a2858  ! 3924: LDSTUB_I	ldstub	%r23, [%r8 + 0x0858]
	.word 0xc4720009  ! 3927: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc20a0009  ! 3927: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x826a0009  ! 3927: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc62a0009  ! 3930: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe40a0009  ! 3930: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xa1a20829  ! 3930: FADDs	fadds	%f8, %f9, %f16
	.word 0xca320009  ! 3933: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 3933: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0xc3ea2bbc  ! 3933: PREFETCHA_I	prefetcha	[%r8, + 0x0bbc] %asi, #one_read
	.word 0xcc2a0009  ! 3936: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcf020009  ! 3936: LDF_R	ld	[%r8, %r9], %f7
	.word 0xce8a2f38  ! 3936: LDUBA_I	lduba	[%r8, + 0x0f38] %asi, %r7
	.word 0xdf220009  ! 3939: STF_R	st	%f15, [%r9, %r8]
	.word 0xc2120009  ! 3939: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x96d224f4  ! 3939: UMULcc_I	umulcc 	%r8, 0x04f4, %r11
	.word 0xf2220009  ! 3942: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xe3020009  ! 3942: LDF_R	ld	[%r8, %r9], %f17
	.word 0xc2520009  ! 3942: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0xea2a0009  ! 3945: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc31a0009  ! 3945: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x06c20001  ! 3945: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xcb220009  ! 3948: STF_R	st	%f5, [%r9, %r8]
	.word 0xe71a0009  ! 3948: LDDF_R	ldd	[%r8, %r9], %f19
	.word 0xab220009  ! 3948: MULScc_R	mulscc 	%r8, %r9, %r21
	.word 0xcb3a0009  ! 3951: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfe120009  ! 3951: LDUH_R	lduh	[%r8 + %r9], %r31
	.word 0xc84a23a4  ! 3951: LDSB_I	ldsb	[%r8 + 0x03a4], %r4
	.word 0xc6220009  ! 3954: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xe4520009  ! 3954: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x88720009  ! 3954: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc2720009  ! 3957: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xc25a0009  ! 3957: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xe28a203c  ! 3957: LDUBA_I	lduba	[%r8, + 0x003c] %asi, %r17
	.word 0xe8220009  ! 3960: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xc65a0009  ! 3960: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8143e04e  ! 3960: MEMBAR	membar	#StoreLoad | #LoadStore | #StoreStore | #Sync 
	.word 0xca720009  ! 3963: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca020009  ! 3963: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0xeab21009  ! 3963: STHA_R	stha	%r21, [%r8 + %r9] 0x80
	.word 0xc42a0009  ! 3966: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xca520009  ! 3966: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x85220009  ! 3966: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xc42a0009  ! 3969: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc41a0009  ! 3969: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x86f20009  ! 3969: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xe0720009  ! 3972: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xc6020009  ! 3972: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0xbf220009  ! 3972: MULScc_R	mulscc 	%r8, %r9, %r31
	.word 0xce320009  ! 3975: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 3975: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xccb21009  ! 3975: STHA_R	stha	%r6, [%r8 + %r9] 0x80
	.word 0xe0220009  ! 3978: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xce420009  ! 3978: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0x8da208a9  ! 3978: FSUBs	fsubs	%f8, %f9, %f6
	.word 0xca720009  ! 3981: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc6420009  ! 3981: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0x06c20001  ! 3981: BRLZ	brlz  ,nt	%8,<label_0x20001>
	.word 0xc62a0009  ! 3984: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc6420009  ! 3984: LDSW_R	ldsw	[%r8 + %r9], %r3
	.word 0xe49a2468  ! 3984: LDDA_I	ldda	[%r8, + 0x0468] %asi, %r18
	.word 0xde220009  ! 3987: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xf6020009  ! 3987: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0xc4a2203c  ! 3987: STWA_I	stwa	%r2, [%r8 + 0x003c] %asi
	.word 0xc2220009  ! 3990: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xea520009  ! 3990: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xca520009  ! 3990: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0xc33a0009  ! 3993: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc41a0009  ! 3993: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x85a20929  ! 3993: FMULs	fmuls	%f8, %f9, %f2
	.word 0xc2720009  ! 3996: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xfc0a0009  ! 3996: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0x8eda0009  ! 3996: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc4720009  ! 3999: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xdc420009  ! 3999: LDSW_R	ldsw	[%r8 + %r9], %r14
	.word 0xc3ea2aa0  ! 3999: PREFETCHA_I	prefetcha	[%r8, + 0x0aa0] %asi, #one_read
        ta      T_GOOD_TRAP

.data
	.word  0xe1c0bf0a,0x2a700f87,0x5718877a,0xf3acad61
	.word  0x7b87cd4b,0xc459272d,0x96ac6201,0x0f3f753c
	.word  0xb75641e1,0xd9524602,0x7573a873,0x09015b00
	.word  0xbcd657ab,0xf7132a33,0x61245ccf,0x001a13ed
	.word  0x3fc82097,0x7310254e,0xf12e411c,0xf745db6e
	.word  0x0211b1b9,0x0d1d1aef,0x88a6f12d,0x40b19420
	.word  0x9f9137c8,0x8c9bc4fa,0x2b058db7,0xb97df2a3
	.word  0x0e945806,0x9aacf5f6,0x3b401aff,0xb4a85b2a
	.word  0x1d5152c7,0x7f0e84f0,0x5e1ae42e,0x93160224
	.word  0x36848de0,0x2ec617c0,0x07145f22,0xed211f6f
	.word  0x2eac6d2c,0x4ce3353a,0xaf58001c,0x33cf0a71
	.word  0x6c461e5d,0x3e9ed78f,0xdcc550fa,0xcbbcbe8e
	.word  0x2e800e26,0x6038ace9,0x37cebe10,0xfbe0e767
	.word  0x36bf2b9b,0x2f1e854c,0xd61de447,0x3c4f1406
	.word  0x200e68e7,0x75e19186,0x8836f9d5,0x1b14adcb
	.word  0x09b787b4,0xe38b57b0,0xe353c0a5,0x12ac6c05
	.word  0xd6061bc7,0xf0fafd97,0xe341caac,0x0b343ad4
	.word  0x9ae1323c,0x371a16cb,0x919f1dd6,0xdc304780
	.word  0x1ef8f277,0x59661e36,0xa8d47ec3,0x20ff67fe
	.word  0x1ac7d735,0xf7a19607,0x247b858c,0x2a877830
	.word  0x95643455,0x225b8e11,0x73875044,0xe679922c
	.word  0x4aff0752,0x564b241f,0xd990cfee,0x52f37ebf
	.word  0x060bed85,0xb64e807b,0x7e00eeb2,0x51fcc5e1
	.word  0xc4c1d213,0xfb353743,0x9273c660,0x446924a2
	.word  0x8b30b191,0x3222b89e,0xc2a3d65f,0x5e0bbb5e
	.word  0x84e6a2f0,0xb929e1a1,0xbfd2dbf8,0xeb5d4afc
	.word  0x2102e257,0x50584d67,0xc9c8f845,0xc55ef2b4
	.word  0xd14ca988,0x1dfd2c9d,0xa44c49a5,0xd8357660
	.word  0xe2264920,0x98e28a9f,0x53c297c8,0x6dc56c6e
	.word  0x9d7a9779,0x6f4f0257,0x625432b7,0x3bd1503d
	.word  0xbf9cc036,0x137c7edf,0x993564b9,0xa2316c52
	.word  0x2bcaf48d,0x6bf2b9bb,0xee70321a,0x804fb9bc
	.word  0x72b934d6,0x3541e230,0x428379e5,0xc30129e5
	.word  0xb545e0b0,0xfe014155,0x11db07e6,0x6562f0b2
	.word  0x8969db29,0x37b4ed0e,0xee7cbf2d,0xe3d49617
	.word  0x0871a796,0x306221e2,0x6e485b39,0xb56bd7df
	.word  0xb834ad1c,0xd2ce3230,0xc5ad6a5d,0xbad4f778
	.word  0xb6ea0d30,0x0294857f,0x99e53646,0x4db61f37
	.word  0xeb8487ee,0x0bd34b58,0x887926c3,0x353f6672
	.word  0x9ac1be13,0xdbd3df98,0x6a9aab97,0x1d92dc0b
	.word  0xfe258f63,0xe0a7da98,0x63761961,0xcd1dd680
	.word  0x42117f46,0x902b2b49,0x2dca96f3,0x04c034b2
	.word  0x37a1da9d,0x0e437a53,0x9ffba1de,0xb7fb328c
	.word  0x0a474945,0xfd43fa4a,0xbe17694e,0x24588f0d
	.word  0xe3d10da3,0x09864c2a,0x1a31745d,0x264242ad
	.word  0x175cea2f,0x24ed126c,0x9ba0f1ef,0xf00e9bf8
	.word  0x3a46e646,0x99a2da4b,0x36efca6c,0x04751656
	.word  0x69a8719c,0x7ec39c3e,0x3e18b5cc,0x1a7ab20c
	.word  0xa1f110fa,0xcc5b848d,0x280c579a,0x6612775e
	.word  0x6666dacc,0x56b95bec,0xf75d89e2,0xff948ab4
	.word  0x8d1d787e,0x09181caf,0x516839f1,0xa379f007
	.word  0xdce3fbd4,0x1a11b484,0x227b06c9,0x8d52cc23
	.word  0x5b7390ea,0x68a50a90,0xa6c863aa,0xc568b5cc
	.word  0xf3f094eb,0x54f58dda,0xcbdc980f,0xc2b35253
	.word  0x37b357bb,0x241e80e3,0x03f617d8,0x5a7b56fd
	.word  0x28e759a5,0x35ecf1ae,0x57b6298c,0x905205e0
	.word  0xb48de5a5,0xdde1510f,0x198ad0b6,0x9d1dd6f5
	.word  0xf97a4c73,0x38e980a3,0x7df22f41,0x3f5afe03
	.word  0xce95e75f,0x6be3027c,0x8ce2ee98,0x87cffc4f
	.word  0x1883e274,0xb7089a50,0x624b66f2,0xd227ee41
	.word  0x7a4defd8,0xfd100392,0x408f7243,0xa81d21eb
	.word  0xaac975c3,0x0ed80d9b,0x708889e5,0x4948b2bb
	.word  0x3d1c244c,0x81217017,0x85330818,0x1c5add10
	.word  0xfd6f4e99,0x6291175b,0x7c349905,0x225a2924
	.word  0xb56f6142,0x3aa8fd69,0x92d84a98,0x14901042
	.word  0x322a39c6,0x8ae0b96d,0x2e2a71e8,0xbf11c1c8
	.word  0x83f36354,0xfdfd8175,0x95f05b9a,0x7a5ceb30
	.word  0x9103c951,0x9f33fb3b,0x234e05c4,0x4b2da02e
	.word  0x9d99c31a,0xac4b2b34,0xdfe767c7,0xb05505a1
	.word  0xbf11d5e9,0xfbb1e34e,0xe6931599,0x8eccf0d4
	.word  0x1977e9b0,0xcd6e6d4d,0xb75ebdea,0x23c8287d
	.word  0x84e9495c,0x8b6e2392,0xd837c68a,0x4dd1cf71
	.word  0x9d8d922b,0x46f8b422,0x56f63693,0x5b70848f
	.word  0x6a712dc3,0xc9334d26,0xdbcd8d70,0x082f9015
	.word  0xf6840aa3,0x42cea2be,0xda9355db,0x5644be3c
	.word  0xb35546fc,0xb2ce1160,0xd41c460e,0x27be227a
	.word  0x3f78e6ba,0x455ea85f,0x0c873bbb,0x11583c63
	.word  0xe78ad7d5,0x7638cad5,0x692b1113,0xb37d9989
	.word  0xffd331e4,0xd385c57f,0xffa2b50f,0x6184565b
	.word  0xcd379857,0x808a5187,0x4138b842,0xbe10dca0
	.word  0x3d9a35ff,0xe6510c2f,0x8d4050b7,0x1c19ada4
	.word  0xbdc36786,0x3cdb9244,0xb770de5e,0x154d8312
	.word  0xf2227edb,0x45138860,0x9db9bda3,0xa15c06eb
	.word  0xba8c95c4,0xc92b5a93,0x90712ce5,0xd820ce30
	.word  0x2a7b302e,0xdf701f90,0xe4008c26,0xc2750cac
	.word  0x99736faa,0x7243a8a5,0x838c80c7,0xc40a6204
	.word  0xa2a19571,0x3c642406,0x9cc0bf98,0xcd08636f
	.word  0xfe6d989f,0xb8a92125,0x67248498,0xc335058a
	.word  0xedc35021,0x32830708,0xdd215aa1,0x7e86a551
	.word  0x20e9c226,0xf21e3858,0x67853b36,0x7aa35b34
	.word  0xef1002cb,0xbd17f3a9,0x69d1b062,0xb9a1d67f
	.word  0xb1c1f3a5,0xd0e897ee,0x480bcec4,0x694becd5
	.word  0x9b147f79,0x23eaea0a,0xc738a26d,0x43ded7db
	.word  0x078a839b,0x80abd89b,0x4eea6dc6,0x820cc892
	.word  0x7dac2f1d,0xbea96016,0x6a7273c2,0x482455d5
	.word  0xe8f64c06,0x01cdc078,0xb19217c9,0x1afd4c6b
	.word  0xfd5defb7,0xbe0b7c80,0xb35eb386,0x9a8f7386
	.word  0x1b5a67bc,0xc05a1d1d,0xd98b61a6,0xf02e4d66
	.word  0x75b31960,0xf6dd30ff,0xc7432330,0xfde98d14
	.word  0x85eebdc3,0x77305311,0xea187636,0x6cba3695
	.word  0x2d123a10,0x24f18403,0x7bf7c15e,0x7a1871d5
	.word  0x595c0231,0x686d147e,0x18855a3c,0x79738539
	.word  0x82bf1641,0x78c06ca7,0x1dcbe777,0x37011a70
	.word  0xa0b44e1f,0x54c3fca0,0x7b5bfa43,0x101ac2d0
	.word  0x6244bc03,0xa16f3780,0xbd4f0d9e,0x54505fcf
	.word  0xaa62b518,0xcd5a3c63,0xfa1fc5b4,0xa9776a39
	.word  0x6fc82a49,0x803ae517,0xb531241d,0x7886fc50
	.word  0xede44599,0xb8496018,0x5a2c5a67,0xdac8fc5e
	.word  0xe14f2f61,0x435ff99a,0x90e979aa,0x3efda9b7
	.word  0x2d073e78,0xfff645f6,0x282c9115,0xc78406d6
	.word  0xd04781af,0xc91aa4ef,0xe3235430,0x16e35ba5
	.word  0xb0043f27,0x04cf9546,0x138c068a,0xdaffeb16
	.word  0xf6e3b6a5,0x678a0975,0xe8f3b6c6,0x4b5476c7
	.word  0x271e3f6d,0x940adca1,0xd36e2cc3,0x1b00d777
	.word  0xd06045ea,0x1988cd4f,0xd63879c0,0xe37a334a
	.word  0x3d8b212f,0xe27c58ca,0xe8512d59,0xf818ce39
	.word  0x70c32883,0xe354d1db,0x3d9d2a0b,0x71e04af2
	.word  0xb3caa1ca,0x4ea169c5,0x36b3fc94,0x47cf593d
	.word  0xd3042a39,0xd70f9efa,0xf9beb992,0x9668b31a
	.word  0x7c28cea4,0xefaf7085,0x81498bf3,0x7e92f9d4
	.word  0xfc854309,0x7674bfde,0x4c8a7e44,0xe0d0837f
	.word  0x517952f3,0x51ff78e7,0xf20a7dfd,0x017df86f
	.word  0xc19eb591,0xeba5beb1,0x4e73663a,0x8f1249cf
	.word  0xd3744c83,0x45f99840,0xb4b6e015,0xaa4bd5bd
	.word  0x4f32622d,0x91afb48d,0x9480e341,0xb5e7a6af
	.word  0xa0821dd9,0xd2c8d5ab,0x05d4be21,0x859ac613
	.word  0x92153b79,0x984b5f45,0x76a4d27d,0x8a5314fe
	.word  0x7b41ec28,0xf4d7379c,0xe68a8f4e,0x380e172a
	.word  0xdb8cd260,0x351e6ee7,0xce4cf0a7,0xf8c52bed
	.word  0x90baf55b,0x4b5ecd18,0x9e375044,0xbaeb1b68
	.word  0x75107cae,0x58cf2444,0xb30b436f,0x2e5c92ab
	.word  0xb694368f,0xa237b5c6,0xf9a73c95,0xe6812e51
	.word  0x74db30a7,0x419b2441,0x78ea66fc,0x41c9ede8
	.word  0x6f7051e9,0xa55193c2,0x06d06fe1,0x8bed19d0
	.word  0xa0ce2282,0xa81ad749,0x7015d162,0x3f83b770
	.word  0x337d53f9,0x605aa83b,0xda6334d9,0xa5f34d24
	.word  0x2966c00b,0x52380dae,0x067d3e31,0xbe5bae53
	.word  0xe517072c,0xf276d17a,0xf5bbf811,0xa54422e5
	.word  0x1b097462,0x3f532977,0x99d47d88,0x5b2f9748
	.word  0xe902277b,0x3617e807,0x5e656972,0x9bc58155
	.word  0x787f6314,0x55612c4f,0xfc13ed35,0x83024893
	.word  0x587a2037,0xd1559c8d,0x1cc13214,0x9446ff42
	.word  0x276fa76d,0x0dab3794,0x59c7d804,0xbb5d7cee
	.word  0xecbfee28,0xd13e6a57,0xa13c20c2,0xccdd9149
	.word  0x428a5332,0xb59a2d73,0xccb04dec,0x6fa5ddb1
	.word  0x86d2ed9e,0x3486e7b0,0xa81bd15d,0x9b0d0cf0
	.word  0x05ff9bce,0x479223e8,0xc2289be0,0xc208ad9b
	.word  0x8a36d974,0xa6763b4c,0x570a124a,0x34f1799e
	.word  0x88c098be,0x0770535e,0x62ef38de,0x86003bda
	.word  0x29d8f9e6,0xee477545,0xca1ea997,0xc79a393a
	.word  0xc97f631b,0xa7ddc878,0x4cb4d064,0x75232026
	.word  0xc567bbe6,0x56974bab,0x98e61159,0xa4e0b69b
	.word  0x4e6ed62b,0xdd2a9204,0xd4cca883,0xdf2daf1c
	.word  0xe4bd0107,0x68097693,0x9652b28f,0xc55a4788
	.word  0xb6ae1485,0x270f3b9a,0xa1c70439,0x3e6be6f1
	.word  0x31a3a376,0x5a2e9650,0x277e656e,0xd415ad10
	.word  0xb40ff2cb,0xfbf47ec1,0x12ad006e,0xa452b48a
	.word  0x925bfdaf,0xc3b1db94,0x4a792655,0x734a60b2
	.word  0x79bed404,0x220ff51f,0x6be340d2,0x9db83099
	.word  0x177a0616,0x7d315517,0x558554bf,0x12cdf5e9
	.word  0xcb5a05ea,0xa770bd59,0xdbf33414,0x6fc6b086
	.word  0xece20ceb,0xe7901655,0xdc42c7ea,0xdca46a70
	.word  0xf8e3a4e8,0xe3e294f5,0xa557658d,0x037aa368
	.word  0xcbe3474b,0x82b5852a,0xfcb0a5d7,0xf9d20ea1
	.word  0x48f365fa,0xaa4b3fe0,0xc4d09dfb,0xeaab7fad
	.word  0xa19eacc6,0x7eed59e4,0xe7c73817,0x01d26564
	.word  0xe2de6019,0x92e4cb54,0x47b5fed6,0xa33bafe5
	.word  0x7c9a245a,0x273d78c0,0x974d4f2d,0xaa6a822f
	.word  0x0c54cf0f,0x716a1c93,0x03efd7ed,0xe0c30813
	.word  0xa20624cc,0xac7a745b,0x4a998551,0xf7154726
	.word  0x6375dda6,0x240fc2a0,0xd8c944d3,0x942f343a
	.word  0x314d4a08,0x9b1b7147,0x7f1c43bb,0xd7c7f11f
	.word  0x5b25607b,0xb0f53b9b,0xa238bce5,0xfc66d467
	.word  0x02155ddc,0x0d515f51,0x5095a2a3,0x89dfe5c8
	.word  0xcbcec5c4,0x4640982b,0xe0e09ba2,0x5a220a8d
	.word  0x450b1010,0xba3de08a,0x541202ff,0x38642a42
	.word  0x5e64445f,0x97a30683,0xe3afcd05,0xf9b21b10
	.word  0x1c473db5,0xa19c7523,0x1f949b1d,0x7f52eef5
	.word  0x5d435def,0x3b87761c,0xbd6800a3,0x3248bdd2
	.word  0xeac9857b,0xff62b355,0x790d6311,0x56297a4f
	.word  0x504cc0f0,0xf53f2cf3,0x592b2a94,0x2411df95
	.word  0xbfac5363,0x6238050a,0x3f0cf2b9,0x79ddfae1
	.word  0xe3b66d57,0xa17a4d34,0xbaee10af,0xeeeec96a
	.word  0xcf43c603,0x0b749881,0x8ec2deba,0xea3b37ca
	.word  0x4967b453,0xb2e35c36,0xbdf3b4ab,0x4f9ea6bd
	.word  0x6afd5af1,0x9b014928,0xebd5e665,0x8fcdd848
	.word  0x9e7a5624,0x16e7558b,0x0b775134,0xf7fbbab8
	.word  0xf7f0e5c7,0xee5d0ba8,0x73512016,0xeb479a7a
	.word  0xf74f0a6a,0x4662da63,0x34c0ae53,0xa242d5f7
	.word  0x5c146809,0x084fbd48,0x28375d70,0xd2be73b9
	.word  0x5dd90956,0x2b4733cc,0x29c75f9c,0x480aac81
	.word  0x7c0d7db2,0x8e91df70,0x99d899f8,0x4398ea7e
	.word  0x663a6ca7,0xcea28a91,0x2742ef95,0xe079a3a1
	.word  0x448b1df3,0xa5ce3e6b,0x5b66303e,0x3e1f21b2
	.word  0xc060f6f6,0x72579dca,0x2a95f89f,0xe2ab8fcb
	.word  0xa9e7e3a6,0x24b58bfa,0xf33a45a3,0xb1987ed3
	.word  0x7bb3c413,0xb392721b,0x83d3372f,0x1bb957bb
	.word  0xbf0816a1,0xee8e8c20,0x225ddb60,0x85e5dbe0
	.word  0xc80aa212,0xe5ec9635,0xc4662363,0x644ec102
	.word  0xd7cb4f81,0x58735f87,0x690f3ebf,0x3b9a2ee5
	.word  0x6a1031a5,0x7dba4c65,0x0f775340,0x8206cb24
	.word  0x02b22606,0x287785fa,0x5173e1da,0x19be4d16
	.word  0x7cbc4e11,0x5953338b,0x311076a2,0xd87a9c49
	.word  0x3213db19,0x54fe0b31,0x1522ac91,0x5d0425b1
	.word  0x7d8034d1,0x850481be,0xae7412ec,0xeddc7309
	.word  0x7d1187b9,0x081ded54,0x3a7ae258,0x81be9765
	.word  0x0b92261a,0xbdb24b5c,0x7ec5c69f,0xd9c65a27
	.word  0x54c54344,0xbf7775f5,0x538fefc2,0xda628c2c
	.word  0xc1820676,0xfb1381d9,0xb0012b0c,0x62a31b5a
	.word  0x8098e7be,0xc24e019f,0x350894f0,0xcfb3cd17
	.word  0xab8e54b6,0x8c386ede,0xa02bfe71,0x7c617ee4
	.word  0x98c2944f,0x71c028e5,0x7e9ee6bb,0x4f0f9a41
	.word  0x6d6198ab,0xecc2ecd9,0x6c11d906,0xc2ec94a0
	.word  0xb5e82bff,0x1af23a46,0x82a87408,0xd8e4d864
	.word  0x258576f3,0xb05b48c6,0x8e77d49b,0x9692eb3a
	.word  0x80855a15,0x87cfe978,0x24d654f5,0xec593945
	.word  0xde682463,0xfb9dc1bd,0xccc58ec7,0xb46d34b2
	.word  0x7e56e1ba,0xd0674ca0,0x47bb9a42,0xda514ea7
	.word  0x70a18b0b,0x3ac14232,0x4fd8e5a8,0xed3d4e37
	.word  0x7f2d943e,0xebabc846,0xbab09d42,0xb9a68b0c
	.word  0xe3a1aed8,0x78d2d052,0x1742d637,0x85660f96
	.word  0x9c1492ad,0xf9ca7ba8,0xbb015f59,0x62fc02df
	.word  0xf8671f1f,0x4b569b4c,0x2c4166f8,0xb4c1a19a
	.word  0x354d7484,0x76fbb45c,0x645f9a64,0xd2358891
	.word  0xf6f8ae11,0x71e88f67,0x5b92a392,0x4fc62cc6
	.word  0x23c75bd8,0xb41dab05,0x9561e448,0xb7ea8559
	.word  0x7e8dcb68,0x0ab5db9d,0xd5bad20f,0xb0d9e56f
	.word  0x95a661be,0x7dbe7d26,0x0655d0e7,0xd8d74803
	.word  0x9c0d2c7f,0xa89a0bbe,0x825d3578,0x6ea7c929
	.word  0x8779824b,0xfd199f6f,0xf4e5faf1,0x8f787ec8
	.word  0x5f1a8c45,0x53055616,0x3a16b0eb,0x8ff90cb6
	.word  0x17bb756f,0x2bc7cf6e,0x98f98977,0x6f693cce
	.word  0x4d5ee8a0,0x6c19825f,0x8b8e311a,0x70821180
	.word  0x28275ff3,0xbd89aff4,0x3fdbd69f,0xf9411fa7
	.word  0x1ea2f8d1,0x9591beff,0x956ecaee,0x5bc430f6
	.word  0xf1f697df,0xc4e0874e,0x56944c6d,0x33a5a0bf
	.word  0xbf7cbc52,0xb037ed2d,0x8ae45ec5,0xa791bf30
	.word  0xd68ef742,0x94bc15b8,0x6c71e5ee,0x8bc14534
	.word  0x3137dab1,0xd75978b9,0x168a7718,0xc8aeeebb
	.word  0x7c73b7eb,0x6d4abadd,0xea7b98f6,0x6c5af71a
	.word  0xe9212f85,0x2370438b,0xcf3d48d9,0xe18fd7c4
	.word  0x1cf7907f,0x004cfb9d,0xaf024ce0,0x96f6f7a8
	.word  0xc58648c6,0xdbaf7237,0xae7372c1,0x97f0e875
	.word  0x2bc7cf27,0xe81e20c5,0x23e7e8ca,0x53840744
	.word  0xe36b0e18,0x8c704006,0x63336573,0xe4e4d4bb
	.word  0xaffd0d9b,0x2ef9a507,0xfb655ee6,0x98a1353c
	.word  0x634cffbf,0x8160c2a3,0x1f341d97,0xb276bf9a
	.word  0x9c2dc09c,0x49f58e8e,0xe85e7682,0xfa6f220b
	.word  0xd8a8ed66,0x920dcd49,0xa84f5324,0xea98315e
	.word  0xdce602d8,0xd63f4c66,0x655d6e0b,0xad2ebfbf
	.word  0x7f85b1a0,0x88e6e35c,0xefaa2fe0,0xece50f38
	.word  0xe35516dc,0x3486d678,0x672f865d,0xdf759bda
	.word  0x442e335b,0x4bcee411,0x31680dbd,0x31532ee8
	.word  0xb37e15cc,0x1af6998f,0x62905be2,0x4939920b
	.word  0x12b4f6ae,0x8b2d38ba,0x44339f7a,0x57c2c976
	.word  0xcc90c98f,0x4164fc0f,0xdca5ffbf,0x5f346872

!!# /************************************************************
!!# *
!!# * File:         stb_raw_1.j
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
!!# inst_type: store_r load_r lop
!!# {
!!#    IJ_generate_va ("th", $1, $2, $3, NULL);
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
!! Rule   1 (line  115), Count:  4000  inst_block           -> inst_type 
!! Rule   2 (line  116), Count:  4000  inst_block           -> inst_block inst_type 
!! Rule   3 (line  119), Count:  4000  inst_type            -> store_r load_r lop 
!! Rule   4 (line  125), Count:   127  lop                  -> mul 
!! Rule   5 (line  125), Count:   111  lop                  -> div 
!! Rule   6 (line  125), Count:   126  lop                  -> fpop 
!! Rule   7 (line  125), Count:   134  lop                  -> load 
!! Rule   8 (line  125), Count:   123  lop                  -> asi_load 
!! Rule   9 (line  125), Count:   142  lop                  -> asi_st 
!! Rule  10 (line  125), Count:   151  lop                  -> br 
!! Rule  11 (line  125), Count:   135  lop                  -> membar 
!! Rule  12 (line  125), Count:   122  lop                  -> atomic 
!! Rule  13 (line  125), Count:   152  lop                  -> prefetch 
!! Rule  14 (line  128), Count:   212  store_r              -> tSTB_R 
!! Rule  15 (line  128), Count:   251  store_r              -> tSTH_R 
!! Rule  16 (line  128), Count:   227  store_r              -> tSTW_R 
!! Rule  17 (line  128), Count:   203  store_r              -> tSTX_R 
!! Rule  18 (line  128), Count:   213  store_r              -> tSTF_R 
!! Rule  19 (line  128), Count:   222  store_r              -> tSTDF_R 
!! Rule  20 (line  131), Count:   129  load_r               -> tLDSB_R 
!! Rule  21 (line  131), Count:   151  load_r               -> tLDSH_R 
!! Rule  22 (line  131), Count:   151  load_r               -> tLDSW_R 
!! Rule  23 (line  131), Count:   140  load_r               -> tLDUB_R 
!! Rule  24 (line  131), Count:   110  load_r               -> tLDUH_R 
!! Rule  25 (line  131), Count:   131  load_r               -> tLDUW_R 
!! Rule  26 (line  131), Count:   123  load_r               -> tLDX_R 
!! Rule  27 (line  131), Count:   134  load_r               -> tLDD_R 
!! Rule  28 (line  131), Count:   137  load_r               -> tLDF_R 
!! Rule  29 (line  131), Count:   118  load_r               -> tLDDF_R 
!! Rule  30 (line  134), Count:    57  fpop                 -> st_fp 
!! Rule  31 (line  134), Count:    68  fpop                 -> arith_fp 
!! Rule  32 (line  137), Count:     6  mul                  -> tMULX_R 
!! Rule  33 (line  137), Count:    13  mul                  -> tMULX_I 
!! Rule  34 (line  137), Count:    13  mul                  -> tUMUL_R 
!! Rule  35 (line  137), Count:     4  mul                  -> tUMUL_I 
!! Rule  36 (line  137), Count:    10  mul                  -> tSMUL_R 
!! Rule  37 (line  137), Count:    11  mul                  -> tSMUL_I 
!! Rule  38 (line  137), Count:     8  mul                  -> tUMULcc_R 
!! Rule  39 (line  137), Count:     7  mul                  -> tUMULcc_I 
!! Rule  40 (line  137), Count:    11  mul                  -> tSMULcc_R 
!! Rule  41 (line  137), Count:    11  mul                  -> tSMULcc_I 
!! Rule  42 (line  137), Count:    12  mul                  -> tMULScc_R 
!! Rule  43 (line  137), Count:    10  mul                  -> tMULScc_I 
!! Rule  44 (line  140), Count:     7  div                  -> tUDIV_I 
!! Rule  45 (line  140), Count:    14  div                  -> tUDIV_R 
!! Rule  46 (line  140), Count:     5  div                  -> tSDIV_I 
!! Rule  47 (line  140), Count:    12  div                  -> tSDIV_R 
!! Rule  48 (line  140), Count:     9  div                  -> tSDIVX_R 
!! Rule  49 (line  140), Count:     9  div                  -> tSDIVX_I 
!! Rule  50 (line  140), Count:     9  div                  -> tUDIVX_R 
!! Rule  51 (line  140), Count:     7  div                  -> tUDIVX_I 
!! Rule  52 (line  140), Count:     7  div                  -> tUDIVcc_I 
!! Rule  53 (line  140), Count:     5  div                  -> tUDIVcc_R 
!! Rule  54 (line  140), Count:     7  div                  -> tSDIVcc_I 
!! Rule  55 (line  140), Count:     9  div                  -> tSDIVcc_R 
!! Rule  56 (line  143), Count:     4  load                 -> tLDSB_R 
!! Rule  57 (line  143), Count:    10  load                 -> tLDSB_I 
!! Rule  58 (line  143), Count:     7  load                 -> tLDSH_R 
!! Rule  59 (line  143), Count:     3  load                 -> tLDSH_I 
!! Rule  60 (line  143), Count:     3  load                 -> tLDSW_R 
!! Rule  61 (line  143), Count:     3  load                 -> tLDSW_I 
!! Rule  62 (line  143), Count:    10  load                 -> tLDUB_R 
!! Rule  63 (line  143), Count:     5  load                 -> tLDUB_I 
!! Rule  64 (line  143), Count:     4  load                 -> tLDUH_R 
!! Rule  65 (line  143), Count:     4  load                 -> tLDUH_I 
!! Rule  66 (line  143), Count:     9  load                 -> tLDUW_R 
!! Rule  67 (line  143), Count:     4  load                 -> tLDUW_I 
!! Rule  68 (line  143), Count:     3  load                 -> tLDX_R 
!! Rule  69 (line  143), Count:     7  load                 -> tLDX_I 
!! Rule  70 (line  143), Count:     6  load                 -> tLDD_R 
!! Rule  71 (line  143), Count:     7  load                 -> tLDD_I 
!! Rule  72 (line  143), Count:     5  load                 -> tLDF_I 
!! Rule  73 (line  143), Count:     4  load                 -> tLDF_R 
!! Rule  74 (line  143), Count:     6  load                 -> tLDDF_I 
!! Rule  75 (line  143), Count:    11  load                 -> tLDDF_R 
!! Rule  76 (line  146), Count:    11  asi_load             -> tLDSBA_R 
!! Rule  77 (line  146), Count:     9  asi_load             -> tLDSBA_I 
!! Rule  78 (line  146), Count:     3  asi_load             -> tLDSHA_R 
!! Rule  79 (line  146), Count:     2  asi_load             -> tLDSHA_I 
!! Rule  80 (line  146), Count:     7  asi_load             -> tLDSWA_R 
!! Rule  81 (line  146), Count:     4  asi_load             -> tLDSWA_I 
!! Rule  82 (line  146), Count:     6  asi_load             -> tLDUBA_R 
!! Rule  83 (line  146), Count:     7  asi_load             -> tLDUBA_I 
!! Rule  84 (line  146), Count:     4  asi_load             -> tLDUHA_R 
!! Rule  85 (line  146), Count:     5  asi_load             -> tLDUHA_I 
!! Rule  86 (line  146), Count:     8  asi_load             -> tLDUWA_R 
!! Rule  87 (line  146), Count:     6  asi_load             -> tLDUWA_I 
!! Rule  88 (line  146), Count:     9  asi_load             -> tLDXA_R 
!! Rule  89 (line  146), Count:     8  asi_load             -> tLDXA_I 
!! Rule  90 (line  146), Count:    11  asi_load             -> tLDDA_R 
!! Rule  91 (line  146), Count:     8  asi_load             -> tLDDA_I 
!! Rule  92 (line  149), Count:    15  asi_st               -> tSTBA_R 
!! Rule  93 (line  149), Count:     9  asi_st               -> tSTBA_I 
!! Rule  94 (line  149), Count:    20  asi_st               -> tSTHA_R 
!! Rule  95 (line  149), Count:    14  asi_st               -> tSTHA_I 
!! Rule  96 (line  149), Count:    10  asi_st               -> tSTWA_R 
!! Rule  97 (line  149), Count:    15  asi_st               -> tSTWA_I 
!! Rule  98 (line  149), Count:    20  asi_st               -> tSTXA_R 
!! Rule  99 (line  149), Count:     8  asi_st               -> tSTXA_I 
!! Rule 100 (line  149), Count:    10  asi_st               -> tSTDA_R 
!! Rule 101 (line  149), Count:    12  asi_st               -> tSTDA_I 
!! Rule 102 (line  152), Count:     9  br                   -> tBA 
!! Rule 103 (line  152), Count:     1  br                   -> tBN 
!! Rule 104 (line  152), Count:     5  br                   -> tBNE 
!! Rule 105 (line  152), Count:     7  br                   -> tBE 
!! Rule 106 (line  152), Count:     9  br                   -> tBG 
!! Rule 107 (line  152), Count:     7  br                   -> tBLE 
!! Rule 108 (line  152), Count:     1  br                   -> tBGE 
!! Rule 109 (line  152), Count:     6  br                   -> tBL 
!! Rule 110 (line  152), Count:     4  br                   -> tBGU 
!! Rule 111 (line  152), Count:     1  br                   -> tBLEU 
!! Rule 112 (line  153), Count:     6  br                   -> tBCC 
!! Rule 113 (line  153), Count:     8  br                   -> tBCS 
!! Rule 114 (line  153), Count:     6  br                   -> tBPOS 
!! Rule 115 (line  153), Count:     5  br                   -> tBNEG 
!! Rule 116 (line  153), Count:     8  br                   -> tBVC 
!! Rule 117 (line  153), Count:     8  br                   -> tBVS 
!! Rule 118 (line  153), Count:     5  br                   -> tBRZ 
!! Rule 119 (line  153), Count:     6  br                   -> tBRLEZ 
!! Rule 120 (line  154), Count:     9  br                   -> tBRLZ 
!! Rule 121 (line  154), Count:     4  br                   -> tBRNZ 
!! Rule 122 (line  154), Count:     6  br                   -> tBRGZ 
!! Rule 123 (line  154), Count:     6  br                   -> tBRGEZ 
!! Rule 124 (line  154), Count:     2  br                   -> tCALL 
!! Rule 125 (line  157), Count:    73  membar               -> tMEMBAR 
!! Rule 126 (line  157), Count:    61  membar               -> tSTBAR 
!! Rule 127 (line  160), Count:     8  atomic               -> tCASA_R 
!! Rule 128 (line  160), Count:     6  atomic               -> tCASA_I 
!! Rule 129 (line  160), Count:    15  atomic               -> tCASXA_R 
!! Rule 130 (line  160), Count:     6  atomic               -> tCASXA_I 
!! Rule 131 (line  160), Count:     8  atomic               -> tLDSTUBA_I 
!! Rule 132 (line  160), Count:     5  atomic               -> tLDSTUB_I 
!! Rule 133 (line  160), Count:     8  atomic               -> tLDSTUB_R 
!! Rule 134 (line  160), Count:     8  atomic               -> tLDSTUBA_R 
!! Rule 135 (line  160), Count:    10  atomic               -> tSWAP_I 
!! Rule 136 (line  160), Count:    16  atomic               -> tSWAP_R 
!! Rule 137 (line  160), Count:    11  atomic               -> tSWAPA_I 
!! Rule 138 (line  160), Count:    10  atomic               -> tSWAPA_R 
!! Rule 139 (line  163), Count:    14  st_fp                -> tSTF_R 
!! Rule 140 (line  163), Count:    13  st_fp                -> tSTF_I 
!! Rule 141 (line  163), Count:    17  st_fp                -> tSTDF_I 
!! Rule 142 (line  163), Count:    10  st_fp                -> tSTDF_R 
!! Rule 143 (line  166), Count:    13  arith_fp             -> tFADDs 
!! Rule 144 (line  166), Count:    20  arith_fp             -> tFSUBs 
!! Rule 145 (line  166), Count:    13  arith_fp             -> tFMULs 
!! Rule 146 (line  166), Count:    19  arith_fp             -> tFDIVs 
!! Rule 147 (line  169), Count:    36  prefetch             -> tPREFETCH_I 
!! Rule 148 (line  169), Count:    38  prefetch             -> tPREFETCH_R 
!! Rule 149 (line  169), Count:    44  prefetch             -> tPREFETCHA_I 
!! 
!!   257: Token tSTB_R	Count = 213
!!   258: Token tSTH_R	Count = 252
!!   259: Token tSTW_R	Count = 228
!!   260: Token tSTX_R	Count = 204
!!   261: Token tSTF_R	Count = 229
!!   262: Token tSTDF_R	Count = 234
!!   263: Token tLDSB_R	Count = 135
!!   264: Token tLDSH_R	Count = 160
!!   265: Token tLDSW_R	Count = 156
!!   266: Token tLDUB_R	Count = 152
!!   267: Token tLDUH_R	Count = 116
!!   268: Token tLDUW_R	Count = 142
!!   269: Token tLDX_R	Count = 128
!!   270: Token tLDD_R	Count = 142
!!   271: Token tLDF_R	Count = 143
!!   272: Token tLDDF_R	Count = 131
!!   273: Token tMULX_R	Count = 7
!!   274: Token tMULX_I	Count = 14
!!   275: Token tUMUL_R	Count = 14
!!   276: Token tUMUL_I	Count = 5
!!   277: Token tSMUL_R	Count = 11
!!   278: Token tSMUL_I	Count = 12
!!   279: Token tUMULcc_R	Count = 9
!!   280: Token tUMULcc_I	Count = 8
!!   281: Token tSMULcc_R	Count = 12
!!   282: Token tSMULcc_I	Count = 12
!!   283: Token tMULScc_R	Count = 13
!!   284: Token tMULScc_I	Count = 11
!!   285: Token tUDIV_I	Count = 8
!!   286: Token tUDIV_R	Count = 15
!!   287: Token tSDIV_I	Count = 6
!!   288: Token tSDIV_R	Count = 13
!!   289: Token tSDIVX_R	Count = 10
!!   290: Token tSDIVX_I	Count = 10
!!   291: Token tUDIVX_R	Count = 10
!!   292: Token tUDIVX_I	Count = 8
!!   293: Token tUDIVcc_I	Count = 8
!!   294: Token tUDIVcc_R	Count = 6
!!   295: Token tSDIVcc_I	Count = 8
!!   296: Token tSDIVcc_R	Count = 10
!!   297: Token tLDSB_I	Count = 11
!!   298: Token tLDSH_I	Count = 4
!!   299: Token tLDSW_I	Count = 4
!!   300: Token tLDUB_I	Count = 6
!!   301: Token tLDUH_I	Count = 5
!!   302: Token tLDUW_I	Count = 5
!!   303: Token tLDX_I	Count = 8
!!   304: Token tLDD_I	Count = 8
!!   305: Token tLDF_I	Count = 6
!!   306: Token tLDDF_I	Count = 7
!!   307: Token tLDSBA_R	Count = 12
!!   308: Token tLDSBA_I	Count = 10
!!   309: Token tLDSHA_R	Count = 4
!!   310: Token tLDSHA_I	Count = 3
!!   311: Token tLDSWA_R	Count = 8
!!   312: Token tLDSWA_I	Count = 5
!!   313: Token tLDUBA_R	Count = 7
!!   314: Token tLDUBA_I	Count = 8
!!   315: Token tLDUHA_R	Count = 5
!!   316: Token tLDUHA_I	Count = 6
!!   317: Token tLDUWA_R	Count = 9
!!   318: Token tLDUWA_I	Count = 7
!!   319: Token tLDXA_R	Count = 10
!!   320: Token tLDXA_I	Count = 9
!!   321: Token tLDDA_R	Count = 12
!!   322: Token tLDDA_I	Count = 9
!!   323: Token tSTBA_R	Count = 16
!!   324: Token tSTBA_I	Count = 10
!!   325: Token tSTHA_R	Count = 21
!!   326: Token tSTHA_I	Count = 15
!!   327: Token tSTWA_R	Count = 11
!!   328: Token tSTWA_I	Count = 16
!!   329: Token tSTXA_R	Count = 21
!!   330: Token tSTXA_I	Count = 9
!!   331: Token tSTDA_R	Count = 11
!!   332: Token tSTDA_I	Count = 13
!!   333: Token tBA	Count = 10
!!   334: Token tBN	Count = 2
!!   335: Token tBNE	Count = 6
!!   336: Token tBE	Count = 8
!!   337: Token tBG	Count = 10
!!   338: Token tBLE	Count = 8
!!   339: Token tBGE	Count = 2
!!   340: Token tBL	Count = 7
!!   341: Token tBGU	Count = 5
!!   342: Token tBLEU	Count = 2
!!   343: Token tBCC	Count = 7
!!   344: Token tBCS	Count = 9
!!   345: Token tBPOS	Count = 7
!!   346: Token tBNEG	Count = 6
!!   347: Token tBVC	Count = 9
!!   348: Token tBVS	Count = 9
!!   349: Token tBRZ	Count = 6
!!   350: Token tBRLEZ	Count = 7
!!   351: Token tBRLZ	Count = 10
!!   352: Token tBRNZ	Count = 5
!!   353: Token tBRGZ	Count = 7
!!   354: Token tBRGEZ	Count = 7
!!   355: Token tCALL	Count = 3
!!   356: Token tMEMBAR	Count = 74
!!   357: Token tSTBAR	Count = 62
!!   358: Token tCASA_R	Count = 9
!!   359: Token tCASA_I	Count = 7
!!   360: Token tCASXA_R	Count = 16
!!   361: Token tCASXA_I	Count = 7
!!   362: Token tLDSTUBA_I	Count = 9
!!   363: Token tLDSTUB_I	Count = 6
!!   364: Token tLDSTUB_R	Count = 9
!!   365: Token tLDSTUBA_R	Count = 9
!!   366: Token tSWAP_I	Count = 11
!!   367: Token tSWAP_R	Count = 17
!!   368: Token tSWAPA_I	Count = 12
!!   369: Token tSWAPA_R	Count = 11
!!   370: Token tSTF_I	Count = 14
!!   371: Token tSTDF_I	Count = 18
!!   372: Token tFADDs	Count = 14
!!   373: Token tFSUBs	Count = 21
!!   374: Token tFMULs	Count = 14
!!   375: Token tFDIVs	Count = 20
!!   376: Token tPREFETCH_I	Count = 37
!!   377: Token tPREFETCH_R	Count = 39
!!   378: Token tPREFETCHA_I	Count = 45
!!   379: Token tPREFETCHA_R	Count = 32
!! 
!! 
!! +++ finish +++

