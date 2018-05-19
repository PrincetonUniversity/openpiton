// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug4461.s
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
   random seed:	927124023
   Jal fpod_mrbw.j:	
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
        setx  0x00000000000004c0, %g1, %r9
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
        setx  0xa6100c66f1d09390, %g1, %r0
        setx  0x03e1ab7ccb7d4a41, %g1, %r1
        setx  0xea522a7d73431726, %g1, %r2
        setx  0x4552766fca9986a6, %g1, %r3
        setx  0x19d4897f3eaac7c5, %g1, %r4
        setx  0x346acb1e238e5edb, %g1, %r5
        setx  0x8913caacff829a7d, %g1, %r6
        setx  0x88bc6c74dcb8088f, %g1, %r7
        setx  0x408715e273f89186, %g1, %r10
        setx  0x59120c9b558a216d, %g1, %r11
        setx  0xe7fb0dcfe9d5e3cd, %g1, %r12
        setx  0xed9be76ed4a89455, %g1, %r13
        setx  0xe9fc842a55370e27, %g1, %r14
        setx  0x2c17cb92442519f8, %g1, %r15
        setx  0xddf593ae7338f179, %g1, %r16
        setx  0xc7043fa696701005, %g1, %r17
        setx  0x68b49c16a3848cd7, %g1, %r18
        setx  0x6518be62335b4835, %g1, %r19
        setx  0x6a97ad0a46c66e3e, %g1, %r20
        setx  0x249af9fbbeb0e648, %g1, %r21
        setx  0xf857a2f5c40914dd, %g1, %r22
        setx  0x5faad253fbc98a83, %g1, %r23
        setx  0xaeb08a0ec855f188, %g1, %r24
        setx  0x0edfea44b453962b, %g1, %r25
        setx  0x53fa5e187cc5c642, %g1, %r26
        setx  0x0471d61b29481c35, %g1, %r27
        setx  0xe8dd37417cdc403a, %g1, %r28
        setx  0xbf245e4c31bb8d1d, %g1, %r29
        setx  0x32a16445250723a1, %g1, %r30
        setx  0x04a750f05bb971de, %g1, %r31
	.word 0xce720009  ! 7: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xd482285c  ! 7: LDUWA_I	lduwa	[%r8, + 0x085c] %asi, %r10
	.word 0x8b3a3001  ! 7: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x8cba2b30  ! 7: XNORcc_I	xnorcc 	%r8, 0x0b30, %r6
	.word 0xa4c20009  ! 7: ADDCcc_R	addccc 	%r8, %r9, %r18
	.word 0x89a208a9  ! 7: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xec220009  ! 13: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xda5a0009  ! 13: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0xb2320009  ! 13: ORN_R	orn 	%r8, %r9, %r25
	.word 0x8f321009  ! 13: SRLX_R	srlx	%r8, %r9, %r7
	.word 0xb2322308  ! 13: SUBC_I	orn 	%r8, 0x0308, %r25
	.word 0xc5222a84  ! 13: STF_I	st	%f2, [0x0a84, %r8]
	.word 0xf42a0009  ! 19: STB_R	stb	%r26, [%r8 + %r9]
	.word 0xc09a2c58  ! 19: LDDA_I	ldda	[%r8, + 0x0c58] %asi, %r0
	.word 0x872a2001  ! 19: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0xba0a0009  ! 19: AND_R	and 	%r8, %r9, %r29
	.word 0x8c220009  ! 19: SUB_R	sub 	%r8, %r9, %r6
	.word 0xbda209a9  ! 19: FDIVs	fdivs	%f8, %f9, %f30
	.word 0xe6720009  ! 29: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xcf020009  ! 29: LDF_R	ld	[%r8, %r9], %f7
	.word 0x85321009  ! 29: SRLX_R	srlx	%r8, %r9, %r2
	.word 0x853a2001  ! 29: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0x8b321009  ! 29: SRLX_R	srlx	%r8, %r9, %r5
	.word 0xeb222e9c  ! 29: STF_I	st	%f21, [0x0e9c, %r8]
	.word 0xf6720009  ! 35: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xf81224bc  ! 35: LDUH_I	lduh	[%r8 + 0x04bc], %r28
	.word 0x8d323001  ! 35: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x9e120009  ! 35: OR_R	or 	%r8, %r9, %r15
	.word 0x8e4225d4  ! 35: ADDC_I	addc 	%r8, 0x05d4, %r7
	.word 0x8ba20849  ! 35: FADDd	faddd	%f8, %f40, %f36
	.word 0xc6320009  ! 42: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc24a0009  ! 42: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xac1a2578  ! 42: XOR_I	xor 	%r8, 0x0578, %r22
	.word 0x8c920009  ! 42: ORcc_R	orcc 	%r8, %r9, %r6
	.word 0x9a0a0009  ! 42: AND_R	and 	%r8, %r9, %r13
	.word 0xcf222578  ! 42: STF_I	st	%f7, [0x0578, %r8]
	.word 0xc6320009  ! 48: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc60a0009  ! 48: LDUB_R	ldub	[%r8 + %r9], %r3
	.word 0x8e220009  ! 48: SUB_R	sub 	%r8, %r9, %r7
	.word 0x89322001  ! 48: SRL_I	srl 	%r8, 0x0001, %r4
	.word 0xbc3a0009  ! 48: XNOR_R	xnor 	%r8, %r9, %r30
	.word 0xe1220009  ! 48: STF_R	st	%f16, [%r9, %r8]
	.word 0xd82a0009  ! 55: STB_R	stb	%r12, [%r8 + %r9]
	.word 0xc2c21009  ! 55: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r1
	.word 0x989a26e4  ! 55: XORcc_I	xorcc 	%r8, 0x06e4, %r12
	.word 0x832a0009  ! 55: SLL_R	sll 	%r8, %r9, %r1
	.word 0x86022828  ! 55: ADD_I	add 	%r8, 0x0828, %r3
	.word 0xe73a0009  ! 55: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc22a0009  ! 61: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xfa5a0009  ! 61: LDX_R	ldx	[%r8 + %r9], %r29
	.word 0x85320009  ! 61: SRL_R	srl 	%r8, %r9, %r2
	.word 0x893a3001  ! 61: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0x89323001  ! 61: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0xc5220009  ! 61: STF_R	st	%f2, [%r9, %r8]
	.word 0xca220009  ! 68: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc4520009  ! 68: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x8eb20009  ! 68: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0x873a1009  ! 68: SRAX_R	srax	%r8, %r9, %r3
	.word 0xb13a1009  ! 68: SRAX_R	srax	%r8, %r9, %r24
	.word 0xa9a208c9  ! 68: FSUBd	fsubd	%f8, %f40, %f20
	.word 0xde320009  ! 74: STH_R	sth	%r15, [%r8 + %r9]
	.word 0xcb1a0009  ! 74: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0x9eba0009  ! 74: XNORcc_R	xnorcc 	%r8, %r9, %r15
	.word 0xb8ba23d0  ! 74: XNORcc_I	xnorcc 	%r8, 0x03d0, %r28
	.word 0x888a2508  ! 74: ANDcc_I	andcc 	%r8, 0x0508, %r4
	.word 0xc73a0009  ! 74: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf2220009  ! 82: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xca8a2a14  ! 82: LDUBA_I	lduba	[%r8, + 0x0a14] %asi, %r5
	.word 0x821a2804  ! 82: XOR_I	xor 	%r8, 0x0804, %r1
	.word 0xb8122eb0  ! 82: OR_I	or 	%r8, 0x0eb0, %r28
	.word 0x83323001  ! 82: SRLX_I	srlx	%r8, 0x0001, %r1
	.word 0xafa20849  ! 82: FADDd	faddd	%f8, %f40, %f54
	.word 0xce720009  ! 90: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 90: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xb48a0009  ! 90: ANDcc_R	andcc 	%r8, %r9, %r26
	.word 0xa12a2001  ! 90: SLL_I	sll 	%r8, 0x0001, %r16
	.word 0x9d2a1009  ! 90: SLLX_R	sllx	%r8, %r9, %r14
	.word 0x89a208c9  ! 90: FSUBd	fsubd	%f8, %f40, %f4
	.word 0xe62a0009  ! 96: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xcf1a0009  ! 96: LDDF_R	ldd	[%r8, %r9], %f7
	.word 0xa33a0009  ! 96: SRA_R	sra 	%r8, %r9, %r17
	.word 0x8b2a1009  ! 96: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x8632247c  ! 96: ORN_I	orn 	%r8, 0x047c, %r3
	.word 0xcd3a2c98  ! 96: STDF_I	std	%f6, [0x0c98, %r8]
	.word 0xce220009  ! 102: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xcc520009  ! 102: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8b323001  ! 102: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0x8a022d04  ! 102: ADD_I	add 	%r8, 0x0d04, %r5
	.word 0x893a2001  ! 102: SRA_I	sra 	%r8, 0x0001, %r4
	.word 0x85a20949  ! 102: FMULd	fmuld	%f8, %f40, %f2
	.word 0xce720009  ! 110: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xfad21009  ! 110: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r29
	.word 0xae020009  ! 110: ADD_R	add 	%r8, %r9, %r23
	.word 0x8c322430  ! 110: ORN_I	orn 	%r8, 0x0430, %r6
	.word 0x892a2001  ! 110: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0x85a209c9  ! 110: FDIVd	fdivd	%f8, %f40, %f2
	.word 0xde720009  ! 118: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xf6922424  ! 118: LDUHA_I	lduha	[%r8, + 0x0424] %asi, %r27
	.word 0x82420009  ! 118: ADDC_R	addc 	%r8, %r9, %r1
	.word 0x82322a30  ! 118: SUBC_I	orn 	%r8, 0x0a30, %r1
	.word 0x973a3001  ! 118: SRAX_I	srax	%r8, 0x0001, %r11
	.word 0xdb3a2630  ! 118: STDF_I	std	%f13, [0x0630, %r8]
	.word 0xc4320009  ! 124: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcd020009  ! 124: LDF_R	ld	[%r8, %r9], %f6
	.word 0x892a2001  ! 124: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0x9e920009  ! 124: ORcc_R	orcc 	%r8, %r9, %r15
	.word 0x892a1009  ! 124: SLLX_R	sllx	%r8, %r9, %r4
	.word 0xef3a0009  ! 124: STDF_R	std	%f23, [%r9, %r8]
	.word 0xf8320009  ! 131: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xcb1a0009  ! 131: LDDF_R	ldd	[%r8, %r9], %f5
	.word 0xb7320009  ! 131: SRL_R	srl 	%r8, %r9, %r27
	.word 0x868a0009  ! 131: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0x8a320009  ! 131: SUBC_R	orn 	%r8, %r9, %r5
	.word 0xbfa208c9  ! 131: FSUBd	fsubd	%f8, %f40, %f62
	.word 0xc8320009  ! 137: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xc4522908  ! 137: LDSH_I	ldsh	[%r8 + 0x0908], %r2
	.word 0x8cba0009  ! 137: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0x8e2a2890  ! 137: ANDN_I	andn 	%r8, 0x0890, %r7
	.word 0x8c2a0009  ! 137: ANDN_R	andn 	%r8, %r9, %r6
	.word 0xa7a209a9  ! 137: FDIVs	fdivs	%f8, %f9, %f19
	.word 0xc2720009  ! 145: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf4c22f40  ! 145: LDSWA_I	ldswa	[%r8, + 0x0f40] %asi, %r26
	.word 0xbb782401  ! 145: MOVR_I	move	%r0, 0x401, %r29
	.word 0x888a264c  ! 145: ANDcc_I	andcc 	%r8, 0x064c, %r4
	.word 0x8b643801  ! 145: MOVcc_I	<illegal instruction>
	.word 0xc3222478  ! 145: STF_I	st	%f1, [0x0478, %r8]
	.word 0xc82a0009  ! 151: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca822bc8  ! 151: LDUWA_I	lduwa	[%r8, + 0x0bc8] %asi, %r5
	.word 0x862a2f54  ! 151: ANDN_I	andn 	%r8, 0x0f54, %r3
	.word 0x8ca22040  ! 151: SUBcc_I	subcc 	%r8, 0x0040, %r6
	.word 0x8f3a3001  ! 151: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0xb7a209a9  ! 151: FDIVs	fdivs	%f8, %f9, %f27
	.word 0xf02a0009  ! 158: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xccd21009  ! 158: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xaa920009  ! 158: ORcc_R	orcc 	%r8, %r9, %r21
	.word 0xb72a3001  ! 158: SLLX_I	sllx	%r8, 0x0001, %r27
	.word 0xb8820009  ! 158: ADDcc_R	addcc 	%r8, %r9, %r28
	.word 0x87a209c9  ! 158: FDIVd	fdivd	%f8, %f40, %f34
	.word 0xd42a0009  ! 166: STB_R	stb	%r10, [%r8 + %r9]
	.word 0xcb020009  ! 166: LDF_R	ld	[%r8, %r9], %f5
	.word 0x84320009  ! 166: ORN_R	orn 	%r8, %r9, %r2
	.word 0x8c1a0009  ! 166: XOR_R	xor 	%r8, %r9, %r6
	.word 0x8b320009  ! 166: SRL_R	srl 	%r8, %r9, %r5
	.word 0xcd222908  ! 166: STF_I	st	%f6, [0x0908, %r8]
	.word 0xe0720009  ! 173: STX_R	stx	%r16, [%r8 + %r9]
	.word 0xf4822e70  ! 173: LDUWA_I	lduwa	[%r8, + 0x0e70] %asi, %r26
	.word 0x86b2295c  ! 173: SUBCcc_I	orncc 	%r8, 0x095c, %r3
	.word 0xa8020009  ! 173: ADD_R	add 	%r8, %r9, %r20
	.word 0x87782401  ! 173: MOVR_I	move	%r0, 0x9, %r3
	.word 0x87a20829  ! 173: FADDs	fadds	%f8, %f9, %f3
	.word 0xc4720009  ! 180: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xd6da1009  ! 180: LDXA_R	ldxa	[%r8, %r9] 0x80, %r11
	.word 0xb0322a68  ! 180: SUBC_I	orn 	%r8, 0x0a68, %r24
	.word 0x8ec22b4c  ! 180: ADDCcc_I	addccc 	%r8, 0x0b4c, %r7
	.word 0x8a920009  ! 180: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0x85a20829  ! 180: FADDs	fadds	%f8, %f9, %f2
	.word 0xc2320009  ! 186: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xced21009  ! 186: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r7
	.word 0xaa422280  ! 186: ADDC_I	addc 	%r8, 0x0280, %r21
	.word 0x852a0009  ! 186: SLL_R	sll 	%r8, %r9, %r2
	.word 0x892a2001  ! 186: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0xc53a2ea0  ! 186: STDF_I	std	%f2, [0x0ea0, %r8]
	.word 0xd8720009  ! 195: STX_R	stx	%r12, [%r8 + %r9]
	.word 0xc88a1009  ! 195: LDUBA_R	lduba	[%r8, %r9] 0x80, %r4
	.word 0xa7320009  ! 195: SRL_R	srl 	%r8, %r9, %r19
	.word 0xb8b22f34  ! 195: ORNcc_I	orncc 	%r8, 0x0f34, %r28
	.word 0x941a2800  ! 195: XOR_I	xor 	%r8, 0x0800, %r10
	.word 0x89a20929  ! 195: FMULs	fmuls	%f8, %f9, %f4
	.word 0xe4320009  ! 201: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xc2420009  ! 201: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8d323001  ! 201: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x82320009  ! 201: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x8c0a2fb4  ! 201: AND_I	and 	%r8, 0x0fb4, %r6
	.word 0x83a209c9  ! 201: FDIVd	fdivd	%f8, %f40, %f32
	.word 0xf8720009  ! 207: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xcc4220b0  ! 207: LDSW_I	ldsw	[%r8 + 0x00b0], %r6
	.word 0x84aa27a8  ! 207: ANDNcc_I	andncc 	%r8, 0x07a8, %r2
	.word 0x888221bc  ! 207: ADDcc_I	addcc 	%r8, 0x01bc, %r4
	.word 0x8a922cbc  ! 207: ORcc_I	orcc 	%r8, 0x0cbc, %r5
	.word 0xff222000  ! 207: STF_I	st	%f31, [0x0000, %r8]
	.word 0xce320009  ! 213: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe21221f0  ! 213: LDUH_I	lduh	[%r8 + 0x01f0], %r17
	.word 0x8c9a0009  ! 213: XORcc_R	xorcc 	%r8, %r9, %r6
	.word 0x88b20009  ! 213: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x96ba259c  ! 213: XNORcc_I	xnorcc 	%r8, 0x059c, %r11
	.word 0x8da20929  ! 213: FMULs	fmuls	%f8, %f9, %f6
	.word 0xda220009  ! 220: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc3020009  ! 220: LDF_R	ld	[%r8, %r9], %f1
	.word 0x863220a0  ! 220: SUBC_I	orn 	%r8, 0x00a0, %r3
	.word 0x85643801  ! 220: MOVcc_I	<illegal instruction>
	.word 0x86022eac  ! 220: ADD_I	add 	%r8, 0x0eac, %r3
	.word 0xcd222ce0  ! 220: STF_I	st	%f6, [0x0ce0, %r8]
	.word 0xc2720009  ! 226: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcb020009  ! 226: LDF_R	ld	[%r8, %r9], %f5
	.word 0x86b20009  ! 226: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0x95641809  ! 226: MOVcc_R	<illegal instruction>
	.word 0x8d320009  ! 226: SRL_R	srl 	%r8, %r9, %r6
	.word 0xe73a0009  ! 226: STDF_R	std	%f19, [%r9, %r8]
	.word 0xd6220009  ! 234: STW_R	stw	%r11, [%r8 + %r9]
	.word 0xd85a28e8  ! 234: LDX_I	ldx	[%r8 + 0x08e8], %r12
	.word 0x9e322dac  ! 234: SUBC_I	orn 	%r8, 0x0dac, %r15
	.word 0x8c2223a8  ! 234: SUB_I	sub 	%r8, 0x03a8, %r6
	.word 0x8e1a0009  ! 234: XOR_R	xor 	%r8, %r9, %r7
	.word 0x85a209c9  ! 234: FDIVd	fdivd	%f8, %f40, %f2
	.word 0xde2a0009  ! 243: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xea821009  ! 243: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r21
	.word 0x86320009  ! 243: ORN_R	orn 	%r8, %r9, %r3
	.word 0x8ab20009  ! 243: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x86822610  ! 243: ADDcc_I	addcc 	%r8, 0x0610, %r3
	.word 0xb9a20829  ! 243: FADDs	fadds	%f8, %f9, %f28
	.word 0xf6320009  ! 250: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc2520009  ! 250: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x98aa2eb8  ! 250: ANDNcc_I	andncc 	%r8, 0x0eb8, %r12
	.word 0x83780409  ! 250: MOVR_R	move	%r0, %r9, %r1
	.word 0x83322001  ! 250: SRL_I	srl 	%r8, 0x0001, %r1
	.word 0xc93a2b28  ! 250: STDF_I	std	%f4, [0x0b28, %r8]
	.word 0xc42a0009  ! 258: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc09a2e38  ! 258: LDDA_I	ldda	[%r8, + 0x0e38] %asi, %r0
	.word 0xbc822c58  ! 258: ADDcc_I	addcc 	%r8, 0x0c58, %r30
	.word 0x8f3a2001  ! 258: SRA_I	sra 	%r8, 0x0001, %r7
	.word 0xa72a0009  ! 258: SLL_R	sll 	%r8, %r9, %r19
	.word 0x9ba20849  ! 258: FADDd	faddd	%f8, %f40, %f44
	.word 0xe2720009  ! 265: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xc4da1009  ! 265: LDXA_R	ldxa	[%r8, %r9] 0x80, %r2
	.word 0x822a0009  ! 265: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x8c022dc0  ! 265: ADD_I	add 	%r8, 0x0dc0, %r6
	.word 0x85320009  ! 265: SRL_R	srl 	%r8, %r9, %r2
	.word 0x83a209c9  ! 265: FDIVd	fdivd	%f8, %f40, %f32
	.word 0xc62a0009  ! 272: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xcc1a0009  ! 272: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x85641809  ! 272: MOVcc_R	<illegal instruction>
	.word 0x892a3001  ! 272: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0x881a0009  ! 272: XOR_R	xor 	%r8, %r9, %r4
	.word 0xcf3a0009  ! 272: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc4220009  ! 279: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca420009  ! 279: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x89321009  ! 279: SRLX_R	srlx	%r8, %r9, %r4
	.word 0xb6aa0009  ! 279: ANDNcc_R	andncc 	%r8, %r9, %r27
	.word 0x85322001  ! 279: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0xc73a26a8  ! 279: STDF_I	std	%f3, [0x06a8, %r8]
	.word 0xee720009  ! 286: STX_R	stx	%r23, [%r8 + %r9]
	.word 0xc4821009  ! 286: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r2
	.word 0x88aa2fe4  ! 286: ANDNcc_I	andncc 	%r8, 0x0fe4, %r4
	.word 0x8c1a2e70  ! 286: XOR_I	xor 	%r8, 0x0e70, %r6
	.word 0xb8220009  ! 286: SUB_R	sub 	%r8, %r9, %r28
	.word 0x9da20929  ! 286: FMULs	fmuls	%f8, %f9, %f14
	.word 0xde720009  ! 292: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xcd020009  ! 292: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8a820009  ! 292: ADDcc_R	addcc 	%r8, %r9, %r5
	.word 0x84920009  ! 292: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0x853a3001  ! 292: SRAX_I	srax	%r8, 0x0001, %r2
	.word 0x87a208c9  ! 292: FSUBd	fsubd	%f8, %f40, %f34
	.word 0xe02a0009  ! 298: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xcc1a2a90  ! 298: LDD_I	ldd	[%r8 + 0x0a90], %r6
	.word 0x8d780409  ! 298: MOVR_R	move	%r0, %r9, %r6
	.word 0x881a0009  ! 298: XOR_R	xor 	%r8, %r9, %r4
	.word 0x893a0009  ! 298: SRA_R	sra 	%r8, %r9, %r4
	.word 0xf53a2c98  ! 298: STDF_I	std	%f26, [0x0c98, %r8]
	.word 0xe2320009  ! 308: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xc81a2f28  ! 308: LDD_I	ldd	[%r8 + 0x0f28], %r4
	.word 0x82422384  ! 308: ADDC_I	addc 	%r8, 0x0384, %r1
	.word 0x840a2af4  ! 308: AND_I	and 	%r8, 0x0af4, %r2
	.word 0x988a0009  ! 308: ANDcc_R	andcc 	%r8, %r9, %r12
	.word 0x87a208a9  ! 308: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc2220009  ! 314: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc25a2088  ! 314: LDX_I	ldx	[%r8 + 0x0088], %r1
	.word 0x82020009  ! 314: ADD_R	add 	%r8, %r9, %r1
	.word 0x88a20009  ! 314: SUBcc_R	subcc 	%r8, %r9, %r4
	.word 0x8a322ad8  ! 314: ORN_I	orn 	%r8, 0x0ad8, %r5
	.word 0x89a20849  ! 314: FADDd	faddd	%f8, %f40, %f4
	.word 0xca720009  ! 321: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc8a1009  ! 321: LDUBA_R	lduba	[%r8, %r9] 0x80, %r6
	.word 0x849a2b88  ! 321: XORcc_I	xorcc 	%r8, 0x0b88, %r2
	.word 0x8d780409  ! 321: MOVR_R	move	%r0, %r9, %r6
	.word 0x8a8a0009  ! 321: ANDcc_R	andcc 	%r8, %r9, %r5
	.word 0x8fa20829  ! 321: FADDs	fadds	%f8, %f9, %f7
	.word 0xfa320009  ! 327: STH_R	sth	%r29, [%r8 + %r9]
	.word 0xf6ca2a1c  ! 327: LDSBA_I	ldsba	[%r8, + 0x0a1c] %asi, %r27
	.word 0x941a25b0  ! 327: XOR_I	xor 	%r8, 0x05b0, %r10
	.word 0xb8320009  ! 327: SUBC_R	orn 	%r8, %r9, %r28
	.word 0x84a20009  ! 327: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0xdf220009  ! 327: STF_R	st	%f15, [%r9, %r8]
	.word 0xce320009  ! 333: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xe40a0009  ! 333: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0x821a2674  ! 333: XOR_I	xor 	%r8, 0x0674, %r1
	.word 0x863a0009  ! 333: XNOR_R	xnor 	%r8, %r9, %r3
	.word 0x8e320009  ! 333: SUBC_R	orn 	%r8, %r9, %r7
	.word 0x89a20949  ! 333: FMULd	fmuld	%f8, %f40, %f4
	.word 0xce320009  ! 339: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce4a2400  ! 339: LDSB_I	ldsb	[%r8 + 0x0400], %r7
	.word 0xbcb20009  ! 339: SUBCcc_R	orncc 	%r8, %r9, %r30
	.word 0x8b780409  ! 339: MOVR_R	move	%r0, %r9, %r5
	.word 0x9ab22a44  ! 339: SUBCcc_I	orncc 	%r8, 0x0a44, %r13
	.word 0xcd222c44  ! 339: STF_I	st	%f6, [0x0c44, %r8]
	.word 0xc4720009  ! 346: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xf4022fc0  ! 346: LDUW_I	lduw	[%r8 + 0x0fc0], %r26
	.word 0x952a2001  ! 346: SLL_I	sll 	%r8, 0x0001, %r10
	.word 0x8ab22b60  ! 346: SUBCcc_I	orncc 	%r8, 0x0b60, %r5
	.word 0x961a0009  ! 346: XOR_R	xor 	%r8, %r9, %r11
	.word 0xf9220009  ! 346: STF_R	st	%f28, [%r9, %r8]
	.word 0x0
	.word 0xc2220009  ! 353: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xea422020  ! 353: LDSW_I	ldsw	[%r8 + 0x0020], %r21
	.word 0x88920009  ! 353: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0x8eaa2bc8  ! 353: ANDNcc_I	andncc 	%r8, 0x0bc8, %r7
	.word 0xa63a0009  ! 353: XNOR_R	xnor 	%r8, %r9, %r19
	.word 0xc53a0009  ! 353: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf4320009  ! 361: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xf8122308  ! 361: LDUH_I	lduh	[%r8 + 0x0308], %r28
	.word 0x82c20009  ! 361: ADDCcc_R	addccc 	%r8, %r9, %r1
	.word 0x8eba0009  ! 361: XNORcc_R	xnorcc 	%r8, %r9, %r7
	.word 0x86820009  ! 361: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x87a20829  ! 361: FADDs	fadds	%f8, %f9, %f3
	.word 0xfa220009  ! 367: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc8520009  ! 367: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x84920009  ! 367: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0x88c22878  ! 367: ADDCcc_I	addccc 	%r8, 0x0878, %r4
	.word 0x8e9a27e0  ! 367: XORcc_I	xorcc 	%r8, 0x07e0, %r7
	.word 0xc93a0009  ! 367: STDF_R	std	%f4, [%r9, %r8]
	.word 0xce220009  ! 375: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xfada1009  ! 375: LDXA_R	ldxa	[%r8, %r9] 0x80, %r29
	.word 0xbac222f0  ! 375: ADDCcc_I	addccc 	%r8, 0x02f0, %r29
	.word 0xa4b220cc  ! 375: ORNcc_I	orncc 	%r8, 0x00cc, %r18
	.word 0xaeb20009  ! 375: SUBCcc_R	orncc 	%r8, %r9, %r23
	.word 0x89a208c9  ! 375: FSUBd	fsubd	%f8, %f40, %f4
	.word 0xf82a0009  ! 382: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xf20a23c4  ! 382: LDUB_I	ldub	[%r8 + 0x03c4], %r25
	.word 0x87641809  ! 382: MOVcc_R	<illegal instruction>
	.word 0x88b22cb4  ! 382: SUBCcc_I	orncc 	%r8, 0x0cb4, %r4
	.word 0xa2ba2e64  ! 382: XNORcc_I	xnorcc 	%r8, 0x0e64, %r17
	.word 0x8ba20929  ! 382: FMULs	fmuls	%f8, %f9, %f5
	.word 0x0
	.word 0xec720009  ! 390: STX_R	stx	%r22, [%r8 + %r9]
	.word 0xc6022aa8  ! 390: LDUW_I	lduw	[%r8 + 0x0aa8], %r3
	.word 0xba320009  ! 390: ORN_R	orn 	%r8, %r9, %r29
	.word 0x82b20009  ! 390: ORNcc_R	orncc 	%r8, %r9, %r1
	.word 0xb2b22ae0  ! 390: SUBCcc_I	orncc 	%r8, 0x0ae0, %r25
	.word 0xd5220009  ! 390: STF_R	st	%f10, [%r9, %r8]
	.word 0x0
	.word 0xc4320009  ! 400: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc45228b8  ! 400: LDSH_I	ldsh	[%r8 + 0x08b8], %r2
	.word 0xa2120009  ! 400: OR_R	or 	%r8, %r9, %r17
	.word 0x9f3a0009  ! 400: SRA_R	sra 	%r8, %r9, %r15
	.word 0xad3a2001  ! 400: SRA_I	sra 	%r8, 0x0001, %r22
	.word 0x8da20849  ! 400: FADDd	faddd	%f8, %f40, %f6
	.word 0xfe320009  ! 406: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc45a0009  ! 406: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xbf3a3001  ! 406: SRAX_I	srax	%r8, 0x0001, %r31
	.word 0x8e3a23f8  ! 406: XNOR_I	xnor 	%r8, 0x03f8, %r7
	.word 0x8c320009  ! 406: SUBC_R	orn 	%r8, %r9, %r6
	.word 0xc7220009  ! 406: STF_R	st	%f3, [%r9, %r8]
	.word 0xc4720009  ! 412: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc6821009  ! 412: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r3
	.word 0x8f3a0009  ! 412: SRA_R	sra 	%r8, %r9, %r7
	.word 0x88322854  ! 412: SUBC_I	orn 	%r8, 0x0854, %r4
	.word 0x8f2a2001  ! 412: SLL_I	sll 	%r8, 0x0001, %r7
	.word 0xc322266c  ! 412: STF_I	st	%f1, [0x066c, %r8]
	.word 0xca320009  ! 418: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc80a2560  ! 418: LDUB_I	ldub	[%r8 + 0x0560], %r4
	.word 0x8c2a0009  ! 418: ANDN_R	andn 	%r8, %r9, %r6
	.word 0x86ba2940  ! 418: XNORcc_I	xnorcc 	%r8, 0x0940, %r3
	.word 0x8ac20009  ! 418: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0x9ba20849  ! 418: FADDd	faddd	%f8, %f40, %f44
	.word 0x0
	.word 0xc2320009  ! 427: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xceda1009  ! 427: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0x83782401  ! 427: MOVR_I	move	%r0, 0x401, %r1
	.word 0x8a420009  ! 427: ADDC_R	addc 	%r8, %r9, %r5
	.word 0x8e322680  ! 427: ORN_I	orn 	%r8, 0x0680, %r7
	.word 0x8da209a9  ! 427: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xcc220009  ! 436: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc6020009  ! 436: LDUW_R	lduw	[%r8 + %r9], %r3
	.word 0x8a320009  ! 436: SUBC_R	orn 	%r8, %r9, %r5
	.word 0x8eba0009  ! 436: XNORcc_R	xnorcc 	%r8, %r9, %r7
	.word 0x893a1009  ! 436: SRAX_R	srax	%r8, %r9, %r4
	.word 0xfd222a98  ! 436: STF_I	st	%f30, [0x0a98, %r8]
	.word 0xc8220009  ! 443: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xce020009  ! 443: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0xb72a2001  ! 443: SLL_I	sll 	%r8, 0x0001, %r27
	.word 0x8f323001  ! 443: SRLX_I	srlx	%r8, 0x0001, %r7
	.word 0x8e820009  ! 443: ADDcc_R	addcc 	%r8, %r9, %r7
	.word 0xcf220009  ! 443: STF_R	st	%f7, [%r9, %r8]
	.word 0xc22a0009  ! 451: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca921009  ! 451: LDUHA_R	lduha	[%r8, %r9] 0x80, %r5
	.word 0xab3a1009  ! 451: SRAX_R	srax	%r8, %r9, %r21
	.word 0x8c322828  ! 451: ORN_I	orn 	%r8, 0x0828, %r6
	.word 0x82ba2be0  ! 451: XNORcc_I	xnorcc 	%r8, 0x0be0, %r1
	.word 0x9ba209c9  ! 451: FDIVd	fdivd	%f8, %f40, %f44
	.word 0xe8220009  ! 457: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xcad21009  ! 457: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r5
	.word 0x87320009  ! 457: SRL_R	srl 	%r8, %r9, %r3
	.word 0x84a22bfc  ! 457: SUBcc_I	subcc 	%r8, 0x0bfc, %r2
	.word 0xa2920009  ! 457: ORcc_R	orcc 	%r8, %r9, %r17
	.word 0x8ba208c9  ! 457: FSUBd	fsubd	%f8, %f40, %f36
	.word 0xc6320009  ! 463: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc68223a8  ! 463: LDUWA_I	lduwa	[%r8, + 0x03a8] %asi, %r3
	.word 0x86a20009  ! 463: SUBcc_R	subcc 	%r8, %r9, %r3
	.word 0x84822f0c  ! 463: ADDcc_I	addcc 	%r8, 0x0f0c, %r2
	.word 0xae8a0009  ! 463: ANDcc_R	andcc 	%r8, %r9, %r23
	.word 0x8da20849  ! 463: FADDd	faddd	%f8, %f40, %f6
	.word 0xfc2a0009  ! 469: STB_R	stb	%r30, [%r8 + %r9]
	.word 0xc85a2620  ! 469: LDX_I	ldx	[%r8 + 0x0620], %r4
	.word 0x8a320009  ! 469: SUBC_R	orn 	%r8, %r9, %r5
	.word 0x8a3a0009  ! 469: XNOR_R	xnor 	%r8, %r9, %r5
	.word 0x8f3a3001  ! 469: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0x99a209c9  ! 469: FDIVd	fdivd	%f8, %f40, %f12
	.word 0xc82a0009  ! 477: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc5020009  ! 477: LDF_R	ld	[%r8, %r9], %f2
	.word 0x83320009  ! 477: SRL_R	srl 	%r8, %r9, %r1
	.word 0x98b22cc8  ! 477: ORNcc_I	orncc 	%r8, 0x0cc8, %r12
	.word 0xb82a2a50  ! 477: ANDN_I	andn 	%r8, 0x0a50, %r28
	.word 0xc3222800  ! 477: STF_I	st	%f1, [0x0800, %r8]
	.word 0xf2720009  ! 485: STX_R	stx	%r25, [%r8 + %r9]
	.word 0xc2020009  ! 485: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8a8221f0  ! 485: ADDcc_I	addcc 	%r8, 0x01f0, %r5
	.word 0x8a0229e8  ! 485: ADD_I	add 	%r8, 0x09e8, %r5
	.word 0xa9323001  ! 485: SRLX_I	srlx	%r8, 0x0001, %r20
	.word 0x87a208c9  ! 485: FSUBd	fsubd	%f8, %f40, %f34
	.word 0xce320009  ! 491: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc20227fc  ! 491: LDUW_I	lduw	[%r8 + 0x07fc], %r1
	.word 0x8aa20009  ! 491: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0x86a224b0  ! 491: SUBcc_I	subcc 	%r8, 0x04b0, %r3
	.word 0xae8a248c  ! 491: ANDcc_I	andcc 	%r8, 0x048c, %r23
	.word 0x83a20829  ! 491: FADDs	fadds	%f8, %f9, %f1
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x00000000000004c0, %g1, %r9
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
        setx  0xa6100c66f1d09390, %g1, %r0
        setx  0x03e1ab7ccb7d4a41, %g1, %r1
        setx  0xea522a7d73431726, %g1, %r2
        setx  0x4552766fca9986a6, %g1, %r3
        setx  0x19d4897f3eaac7c5, %g1, %r4
        setx  0x346acb1e238e5edb, %g1, %r5
        setx  0x8913caacff829a7d, %g1, %r6
        setx  0x88bc6c74dcb8088f, %g1, %r7
        setx  0x408715e273f89186, %g1, %r10
        setx  0x59120c9b558a216d, %g1, %r11
        setx  0xe7fb0dcfe9d5e3cd, %g1, %r12
        setx  0xed9be76ed4a89455, %g1, %r13
        setx  0xe9fc842a55370e27, %g1, %r14
        setx  0x2c17cb92442519f8, %g1, %r15
        setx  0xddf593ae7338f179, %g1, %r16
        setx  0xc7043fa696701005, %g1, %r17
        setx  0x68b49c16a3848cd7, %g1, %r18
        setx  0x6518be62335b4835, %g1, %r19
        setx  0x6a97ad0a46c66e3e, %g1, %r20
        setx  0x249af9fbbeb0e648, %g1, %r21
        setx  0xf857a2f5c40914dd, %g1, %r22
        setx  0x5faad253fbc98a83, %g1, %r23
        setx  0xaeb08a0ec855f188, %g1, %r24
        setx  0x0edfea44b453962b, %g1, %r25
        setx  0x53fa5e187cc5c642, %g1, %r26
        setx  0x0471d61b29481c35, %g1, %r27
        setx  0xe8dd37417cdc403a, %g1, %r28
        setx  0xbf245e4c31bb8d1d, %g1, %r29
        setx  0x32a16445250723a1, %g1, %r30
        setx  0x04a750f05bb971de, %g1, %r31
	.word 0xe1220009  ! 2: STF_R	st	%f16, [%r9, %r8]
	.word 0x83a209a9  ! 20: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x87a208c9  ! 21: FSUBd	fsubd	%f8, %f40, %f34
	.word 0x8ba20849  ! 22: FADDd	faddd	%f8, %f40, %f36
	.word 0xf1220009  ! 24: STF_R	st	%f24, [%r9, %r8]
	.word 0x85a20929  ! 36: FMULs	fmuls	%f8, %f9, %f2
	.word 0xcb222564  ! 49: STF_I	st	%f5, [0x0564, %r8]
	.word 0xc52220b0  ! 62: STF_I	st	%f2, [0x00b0, %r8]
	.word 0xcf222194  ! 75: STF_I	st	%f7, [0x0194, %r8]
	.word 0x87a209c9  ! 76: FDIVd	fdivd	%f8, %f40, %f34
	.word 0x8da20949  ! 83: FMULd	fmuld	%f8, %f40, %f6
	.word 0xcf220009  ! 85: STF_R	st	%f7, [%r9, %r8]
	.word 0xb1a208a9  ! 103: FSUBs	fsubs	%f8, %f9, %f24
	.word 0xc7220009  ! 105: STF_R	st	%f3, [%r9, %r8]
	.word 0xa7a20949  ! 111: FMULd	fmuld	%f8, %f40, %f50
	.word 0xc3220009  ! 113: STF_R	st	%f1, [%r9, %r8]
	.word 0x83a209a9  ! 125: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x89a20829  ! 138: FADDs	fadds	%f8, %f9, %f4
	.word 0xc73a0009  ! 140: STDF_R	std	%f3, [%r9, %r8]
	.word 0x8da20849  ! 152: FADDd	faddd	%f8, %f40, %f6
	.word 0x85a20829  ! 159: FADDs	fadds	%f8, %f9, %f2
	.word 0xb9a209a9  ! 160: FDIVs	fdivs	%f8, %f9, %f28
	.word 0xc5220009  ! 168: STF_R	st	%f2, [%r9, %r8]
	.word 0xc7220009  ! 175: STF_R	st	%f3, [%r9, %r8]
	.word 0xc52225e4  ! 187: STF_I	st	%f2, [0x05e4, %r8]
	.word 0xafa20949  ! 188: FMULd	fmuld	%f8, %f40, %f54
	.word 0xa1a20929  ! 189: FMULs	fmuls	%f8, %f9, %f16
	.word 0x95a20949  ! 214: FMULd	fmuld	%f8, %f40, %f10
	.word 0x8da20929  ! 227: FMULs	fmuls	%f8, %f9, %f6
	.word 0x83a20949  ! 228: FMULd	fmuld	%f8, %f40, %f32
	.word 0x8da208c9  ! 235: FSUBd	fsubd	%f8, %f40, %f6
	.word 0xcf3a23b8  ! 236: STDF_I	std	%f7, [0x03b8, %r8]
	.word 0xb5a208c9  ! 237: FSUBd	fsubd	%f8, %f40, %f26
	.word 0x97a20849  ! 244: FADDd	faddd	%f8, %f40, %f42
	.word 0xada20829  ! 251: FADDs	fadds	%f8, %f9, %f22
	.word 0x8da20949  ! 252: FMULd	fmuld	%f8, %f40, %f6
	.word 0xc5220009  ! 260: STF_R	st	%f2, [%r9, %r8]
	.word 0x85a208a9  ! 266: FSUBs	fsubs	%f8, %f9, %f2
	.word 0xf33a2ab0  ! 273: STDF_I	std	%f25, [0x0ab0, %r8]
	.word 0xc33a0009  ! 281: STDF_R	std	%f1, [%r9, %r8]
	.word 0x83a209a9  ! 299: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x83a209a9  ! 300: FDIVs	fdivs	%f8, %f9, %f1
	.word 0xaba209c9  ! 301: FDIVd	fdivd	%f8, %f40, %f52
	.word 0x89a20829  ! 302: FADDs	fadds	%f8, %f9, %f4
	.word 0xc93a0009  ! 316: STDF_R	std	%f4, [%r9, %r8]
	.word 0x83a20849  ! 340: FADDd	faddd	%f8, %f40, %f32
	.word 0x0
	.word 0x8ba20929  ! 354: FMULs	fmuls	%f8, %f9, %f5
	.word 0xc33a2fa0  ! 355: STDF_I	std	%f1, [0x0fa0, %r8]
	.word 0x87a208a9  ! 368: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc3222d80  ! 369: STF_I	st	%f1, [0x0d80, %r8]
	.word 0x83a209a9  ! 376: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x0
	.word 0xcf220009  ! 385: STF_R	st	%f7, [%r9, %r8]
	.word 0x8da209a9  ! 391: FDIVs	fdivs	%f8, %f9, %f6
	.word 0xc73a2c40  ! 392: STDF_I	std	%f3, [0x0c40, %r8]
	.word 0xbfa20849  ! 393: FADDd	faddd	%f8, %f40, %f62
	.word 0x0
	.word 0x8ba208c9  ! 419: FSUBd	fsubd	%f8, %f40, %f36
	.word 0xbba208c9  ! 420: FSUBd	fsubd	%f8, %f40, %f60
	.word 0x0
	.word 0x8ba20949  ! 428: FMULd	fmuld	%f8, %f40, %f36
	.word 0x83a20929  ! 429: FMULs	fmuls	%f8, %f9, %f1
	.word 0x8fa20849  ! 430: FADDd	faddd	%f8, %f40, %f38
	.word 0x85a20949  ! 437: FMULd	fmuld	%f8, %f40, %f2
	.word 0x9ba20949  ! 444: FMULd	fmuld	%f8, %f40, %f44
	.word 0xdd222358  ! 445: STF_I	st	%f14, [0x0358, %r8]
	.word 0x8ba20829  ! 470: FADDs	fadds	%f8, %f9, %f5
	.word 0x8fa209a9  ! 471: FDIVs	fdivs	%f8, %f9, %f7
	.word 0x8da208c9  ! 478: FSUBd	fsubd	%f8, %f40, %f6
	.word 0xc7220009  ! 480: STF_R	st	%f3, [%r9, %r8]
	.word 0xb7a208c9  ! 492: FSUBd	fsubd	%f8, %f40, %f58
	.word 0x87a20949  ! 493: FMULd	fmuld	%f8, %f40, %f34
	.word 0xcf3a24a0  ! 494: STDF_I	std	%f7, [0x04a0, %r8]
	.word 0x8fa208c9  ! 495: FSUBd	fsubd	%f8, %f40, %f38
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x00000000000004c0, %g1, %r9
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
        setx  0xa6100c66f1d09390, %g1, %r0
        setx  0x03e1ab7ccb7d4a41, %g1, %r1
        setx  0xea522a7d73431726, %g1, %r2
        setx  0x4552766fca9986a6, %g1, %r3
        setx  0x19d4897f3eaac7c5, %g1, %r4
        setx  0x346acb1e238e5edb, %g1, %r5
        setx  0x8913caacff829a7d, %g1, %r6
        setx  0x88bc6c74dcb8088f, %g1, %r7
        setx  0x408715e273f89186, %g1, %r10
        setx  0x59120c9b558a216d, %g1, %r11
        setx  0xe7fb0dcfe9d5e3cd, %g1, %r12
        setx  0xed9be76ed4a89455, %g1, %r13
        setx  0xe9fc842a55370e27, %g1, %r14
        setx  0x2c17cb92442519f8, %g1, %r15
        setx  0xddf593ae7338f179, %g1, %r16
        setx  0xc7043fa696701005, %g1, %r17
        setx  0x68b49c16a3848cd7, %g1, %r18
        setx  0x6518be62335b4835, %g1, %r19
        setx  0x6a97ad0a46c66e3e, %g1, %r20
        setx  0x249af9fbbeb0e648, %g1, %r21
        setx  0xf857a2f5c40914dd, %g1, %r22
        setx  0x5faad253fbc98a83, %g1, %r23
        setx  0xaeb08a0ec855f188, %g1, %r24
        setx  0x0edfea44b453962b, %g1, %r25
        setx  0x53fa5e187cc5c642, %g1, %r26
        setx  0x0471d61b29481c35, %g1, %r27
        setx  0xe8dd37417cdc403a, %g1, %r28
        setx  0xbf245e4c31bb8d1d, %g1, %r29
        setx  0x32a16445250723a1, %g1, %r30
        setx  0x04a750f05bb971de, %g1, %r31
	.word 0xf6720009  ! 7: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xf4822444  ! 7: LDUWA_I	lduwa	[%r8, + 0x0444] %asi, %r26
	.word 0x8b3a3001  ! 7: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x82ba2300  ! 7: XNORcc_I	xnorcc 	%r8, 0x0300, %r1
	.word 0x8ec20009  ! 7: ADDCcc_R	addccc 	%r8, %r9, %r7
	.word 0x89a208a9  ! 7: FSUBs	fsubs	%f8, %f9, %f4
	.word 0xfe220009  ! 13: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xca5a0009  ! 13: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8c320009  ! 13: ORN_R	orn 	%r8, %r9, %r6
	.word 0x85321009  ! 13: SRLX_R	srlx	%r8, %r9, %r2
	.word 0x82322694  ! 13: SUBC_I	orn 	%r8, 0x0694, %r1
	.word 0xc32224dc  ! 13: STF_I	st	%f1, [0x04dc, %r8]
	.word 0xf22a0009  ! 19: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xc09a22d8  ! 19: LDDA_I	ldda	[%r8, + 0x02d8] %asi, %r0
	.word 0x8d2a2001  ! 19: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0x8a0a0009  ! 19: AND_R	and 	%r8, %r9, %r5
	.word 0xb8220009  ! 19: SUB_R	sub 	%r8, %r9, %r28
	.word 0xbda209a9  ! 19: FDIVs	fdivs	%f8, %f9, %f30
	.word 0xc8720009  ! 29: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xff020009  ! 29: LDF_R	ld	[%r8, %r9], %f31
	.word 0x87321009  ! 29: SRLX_R	srlx	%r8, %r9, %r3
	.word 0x8b3a2001  ! 29: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x99321009  ! 29: SRLX_R	srlx	%r8, %r9, %r12
	.word 0xcd222860  ! 29: STF_I	st	%f6, [0x0860, %r8]
	.word 0xca720009  ! 35: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xec122cb8  ! 35: LDUH_I	lduh	[%r8 + 0x0cb8], %r22
	.word 0x9d323001  ! 35: SRLX_I	srlx	%r8, 0x0001, %r14
	.word 0x8c120009  ! 35: OR_R	or 	%r8, %r9, %r6
	.word 0xa8422268  ! 35: ADDC_I	addc 	%r8, 0x0268, %r20
	.word 0x83a20849  ! 35: FADDd	faddd	%f8, %f40, %f32
	.word 0xf4320009  ! 42: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xce4a0009  ! 42: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x841a23e8  ! 42: XOR_I	xor 	%r8, 0x03e8, %r2
	.word 0x82920009  ! 42: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0x940a0009  ! 42: AND_R	and 	%r8, %r9, %r10
	.word 0xe9222e7c  ! 42: STF_I	st	%f20, [0x0e7c, %r8]
	.word 0xca320009  ! 48: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 48: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8a220009  ! 48: SUB_R	sub 	%r8, %r9, %r5
	.word 0x8b322001  ! 48: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x883a0009  ! 48: XNOR_R	xnor 	%r8, %r9, %r4
	.word 0xc5220009  ! 48: STF_R	st	%f2, [%r9, %r8]
	.word 0xce2a0009  ! 55: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xdcc21009  ! 55: LDSWA_R	ldswa	[%r8, %r9] 0x80, %r14
	.word 0x869a210c  ! 55: XORcc_I	xorcc 	%r8, 0x010c, %r3
	.word 0x972a0009  ! 55: SLL_R	sll 	%r8, %r9, %r11
	.word 0x84022800  ! 55: ADD_I	add 	%r8, 0x0800, %r2
	.word 0xcf3a0009  ! 55: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc22a0009  ! 61: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc5a0009  ! 61: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x89320009  ! 61: SRL_R	srl 	%r8, %r9, %r4
	.word 0x9f3a3001  ! 61: SRAX_I	srax	%r8, 0x0001, %r15
	.word 0x9b323001  ! 61: SRLX_I	srlx	%r8, 0x0001, %r13
	.word 0xc5220009  ! 61: STF_R	st	%f2, [%r9, %r8]
	.word 0xc8220009  ! 68: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 68: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xbab20009  ! 68: SUBCcc_R	orncc 	%r8, %r9, %r29
	.word 0x8f3a1009  ! 68: SRAX_R	srax	%r8, %r9, %r7
	.word 0x8d3a1009  ! 68: SRAX_R	srax	%r8, %r9, %r6
	.word 0x9da208c9  ! 68: FSUBd	fsubd	%f8, %f40, %f14
	.word 0xc6320009  ! 74: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc91a0009  ! 74: LDDF_R	ldd	[%r8, %r9], %f4
	.word 0xaaba0009  ! 74: XNORcc_R	xnorcc 	%r8, %r9, %r21
	.word 0x8aba2930  ! 74: XNORcc_I	xnorcc 	%r8, 0x0930, %r5
	.word 0x868a208c  ! 74: ANDcc_I	andcc 	%r8, 0x008c, %r3
	.word 0xf93a0009  ! 74: STDF_R	std	%f28, [%r9, %r8]
	.word 0xc2220009  ! 82: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc48a24fc  ! 82: LDUBA_I	lduba	[%r8, + 0x04fc] %asi, %r2
	.word 0xa61a22fc  ! 82: XOR_I	xor 	%r8, 0x02fc, %r19
	.word 0x86122428  ! 82: OR_I	or 	%r8, 0x0428, %r3
	.word 0x87323001  ! 82: SRLX_I	srlx	%r8, 0x0001, %r3
	.word 0x87a20849  ! 82: FADDd	faddd	%f8, %f40, %f34
	.word 0xe8720009  ! 90: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xca120009  ! 90: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x8a8a0009  ! 90: ANDcc_R	andcc 	%r8, %r9, %r5
	.word 0x852a2001  ! 90: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x852a1009  ! 90: SLLX_R	sllx	%r8, %r9, %r2
	.word 0x8da208c9  ! 90: FSUBd	fsubd	%f8, %f40, %f6
	.word 0xd42a0009  ! 96: STB_R	stb	%r10, [%r8 + %r9]
	.word 0xcd1a0009  ! 96: LDDF_R	ldd	[%r8, %r9], %f6
	.word 0x873a0009  ! 96: SRA_R	sra 	%r8, %r9, %r3
	.word 0xb92a1009  ! 96: SLLX_R	sllx	%r8, %r9, %r28
	.word 0x8c322410  ! 96: ORN_I	orn 	%r8, 0x0410, %r6
	.word 0xfd3a2330  ! 96: STDF_I	std	%f30, [0x0330, %r8]
	.word 0xfe220009  ! 102: STW_R	stw	%r31, [%r8 + %r9]
	.word 0xfa520009  ! 102: LDSH_R	ldsh	[%r8 + %r9], %r29
	.word 0x8d323001  ! 102: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0x9c02278c  ! 102: ADD_I	add 	%r8, 0x078c, %r14
	.word 0x893a2001  ! 102: SRA_I	sra 	%r8, 0x0001, %r4
	.word 0x83a20949  ! 102: FMULd	fmuld	%f8, %f40, %f32
	.word 0xf6720009  ! 110: STX_R	stx	%r27, [%r8 + %r9]
	.word 0xfcd21009  ! 110: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r30
	.word 0xb4020009  ! 110: ADD_R	add 	%r8, %r9, %r26
	.word 0x8a3225c0  ! 110: ORN_I	orn 	%r8, 0x05c0, %r5
	.word 0x832a2001  ! 110: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0xa7a209c9  ! 110: FDIVd	fdivd	%f8, %f40, %f50
	.word 0xcc720009  ! 118: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf2922648  ! 118: LDUHA_I	lduha	[%r8, + 0x0648] %asi, %r25
	.word 0x88420009  ! 118: ADDC_R	addc 	%r8, %r9, %r4
	.word 0x8a322e14  ! 118: SUBC_I	orn 	%r8, 0x0e14, %r5
	.word 0x833a3001  ! 118: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0xef3a24f8  ! 118: STDF_I	std	%f23, [0x04f8, %r8]
	.word 0xf4320009  ! 124: STH_R	sth	%r26, [%r8 + %r9]
	.word 0xc3020009  ! 124: LDF_R	ld	[%r8, %r9], %f1
	.word 0x8b2a2001  ! 124: SLL_I	sll 	%r8, 0x0001, %r5
	.word 0xbe920009  ! 124: ORcc_R	orcc 	%r8, %r9, %r31
	.word 0x9d2a1009  ! 124: SLLX_R	sllx	%r8, %r9, %r14
	.word 0xcf3a0009  ! 124: STDF_R	std	%f7, [%r9, %r8]
	.word 0xc2320009  ! 131: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc31a0009  ! 131: LDDF_R	ldd	[%r8, %r9], %f1
	.word 0x85320009  ! 131: SRL_R	srl 	%r8, %r9, %r2
	.word 0x8e8a0009  ! 131: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0x84320009  ! 131: SUBC_R	orn 	%r8, %r9, %r2
	.word 0x83a208c9  ! 131: FSUBd	fsubd	%f8, %f40, %f32
	.word 0xcc320009  ! 137: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xcc522e74  ! 137: LDSH_I	ldsh	[%r8 + 0x0e74], %r6
	.word 0xb2ba0009  ! 137: XNORcc_R	xnorcc 	%r8, %r9, %r25
	.word 0x8a2a2b30  ! 137: ANDN_I	andn 	%r8, 0x0b30, %r5
	.word 0x8a2a0009  ! 137: ANDN_R	andn 	%r8, %r9, %r5
	.word 0x89a209a9  ! 137: FDIVs	fdivs	%f8, %f9, %f4
	.word 0xca720009  ! 145: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc2c221a8  ! 145: LDSWA_I	ldswa	[%r8, + 0x01a8] %asi, %r1
	.word 0xa5782401  ! 145: MOVR_I	move	%r0, 0xffffff00, %r18
	.word 0x8a8a29f8  ! 145: ANDcc_I	andcc 	%r8, 0x09f8, %r5
	.word 0xaf643801  ! 145: MOVcc_I	<illegal instruction>
	.word 0xf922270c  ! 145: STF_I	st	%f28, [0x070c, %r8]
	.word 0xc22a0009  ! 151: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xcc822908  ! 151: LDUWA_I	lduwa	[%r8, + 0x0908] %asi, %r6
	.word 0x842a2220  ! 151: ANDN_I	andn 	%r8, 0x0220, %r2
	.word 0x8aa223a8  ! 151: SUBcc_I	subcc 	%r8, 0x03a8, %r5
	.word 0x8f3a3001  ! 151: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0x8ba209a9  ! 151: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xc82a0009  ! 158: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xccd21009  ! 158: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r6
	.word 0xa0920009  ! 158: ORcc_R	orcc 	%r8, %r9, %r16
	.word 0x8d2a3001  ! 158: SLLX_I	sllx	%r8, 0x0001, %r6
	.word 0x86820009  ! 158: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x8fa209c9  ! 158: FDIVd	fdivd	%f8, %f40, %f38
	.word 0xf02a0009  ! 166: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xcb020009  ! 166: LDF_R	ld	[%r8, %r9], %f5
	.word 0x84320009  ! 166: ORN_R	orn 	%r8, %r9, %r2
	.word 0x821a0009  ! 166: XOR_R	xor 	%r8, %r9, %r1
	.word 0xab320009  ! 166: SRL_R	srl 	%r8, %r9, %r21
	.word 0xcf222fbc  ! 166: STF_I	st	%f7, [0x0fbc, %r8]
	.word 0xde720009  ! 173: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc8822ddc  ! 173: LDUWA_I	lduwa	[%r8, + 0x0ddc] %asi, %r4
	.word 0xacb227b8  ! 173: SUBCcc_I	orncc 	%r8, 0x07b8, %r22
	.word 0x86020009  ! 173: ADD_R	add 	%r8, %r9, %r3
	.word 0x83782401  ! 173: MOVR_I	move	%r0, 0xffffff00, %r1
	.word 0xa3a20829  ! 173: FADDs	fadds	%f8, %f9, %f17
	.word 0xcc720009  ! 180: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xeada1009  ! 180: LDXA_R	ldxa	[%r8, %r9] 0x80, %r21
	.word 0xb2322bc0  ! 180: SUBC_I	orn 	%r8, 0x0bc0, %r25
	.word 0xbcc22334  ! 180: ADDCcc_I	addccc 	%r8, 0x0334, %r30
	.word 0xbe920009  ! 180: ORcc_R	orcc 	%r8, %r9, %r31
	.word 0x87a20829  ! 180: FADDs	fadds	%f8, %f9, %f3
	.word 0xd8320009  ! 186: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xf0d21009  ! 186: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r24
	.word 0x88422610  ! 186: ADDC_I	addc 	%r8, 0x0610, %r4
	.word 0x832a0009  ! 186: SLL_R	sll 	%r8, %r9, %r1
	.word 0x872a2001  ! 186: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0xeb3a2e50  ! 186: STDF_I	std	%f21, [0x0e50, %r8]
	.word 0xfa720009  ! 195: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc28a1009  ! 195: LDUBA_R	lduba	[%r8, %r9] 0x80, %r1
	.word 0x89320009  ! 195: SRL_R	srl 	%r8, %r9, %r4
	.word 0x8eb22cdc  ! 195: ORNcc_I	orncc 	%r8, 0x0cdc, %r7
	.word 0x841a2638  ! 195: XOR_I	xor 	%r8, 0x0638, %r2
	.word 0x8fa20929  ! 195: FMULs	fmuls	%f8, %f9, %f7
	.word 0xc4320009  ! 201: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xe0420009  ! 201: LDSW_R	ldsw	[%r8 + %r9], %r16
	.word 0x8b323001  ! 201: SRLX_I	srlx	%r8, 0x0001, %r5
	.word 0x8c320009  ! 201: SUBC_R	orn 	%r8, %r9, %r6
	.word 0x820a22a4  ! 201: AND_I	and 	%r8, 0x02a4, %r1
	.word 0x83a209c9  ! 201: FDIVd	fdivd	%f8, %f40, %f32
	.word 0xe6720009  ! 207: STX_R	stx	%r19, [%r8 + %r9]
	.word 0xc4422874  ! 207: LDSW_I	ldsw	[%r8 + 0x0874], %r2
	.word 0x8eaa2e78  ! 207: ANDNcc_I	andncc 	%r8, 0x0e78, %r7
	.word 0x82822798  ! 207: ADDcc_I	addcc 	%r8, 0x0798, %r1
	.word 0xba92235c  ! 207: ORcc_I	orcc 	%r8, 0x035c, %r29
	.word 0xff222f18  ! 207: STF_I	st	%f31, [0x0f18, %r8]
	.word 0xcc320009  ! 213: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc4122568  ! 213: LDUH_I	lduh	[%r8 + 0x0568], %r2
	.word 0xba9a0009  ! 213: XORcc_R	xorcc 	%r8, %r9, %r29
	.word 0x88b20009  ! 213: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x88ba22b4  ! 213: XNORcc_I	xnorcc 	%r8, 0x02b4, %r4
	.word 0x8ba20929  ! 213: FMULs	fmuls	%f8, %f9, %f5
	.word 0xfc220009  ! 220: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xc7020009  ! 220: LDF_R	ld	[%r8, %r9], %f3
	.word 0x8e322130  ! 220: SUBC_I	orn 	%r8, 0x0130, %r7
	.word 0x87643801  ! 220: MOVcc_I	<illegal instruction>
	.word 0x860222f8  ! 220: ADD_I	add 	%r8, 0x02f8, %r3
	.word 0xc5222b08  ! 220: STF_I	st	%f2, [0x0b08, %r8]
	.word 0xca720009  ! 226: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcd020009  ! 226: LDF_R	ld	[%r8, %r9], %f6
	.word 0x8cb20009  ! 226: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x87641809  ! 226: MOVcc_R	<illegal instruction>
	.word 0x8f320009  ! 226: SRL_R	srl 	%r8, %r9, %r7
	.word 0xc73a0009  ! 226: STDF_R	std	%f3, [%r9, %r8]
	.word 0xcc220009  ! 234: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc85a2328  ! 234: LDX_I	ldx	[%r8 + 0x0328], %r4
	.word 0x8c3225a8  ! 234: SUBC_I	orn 	%r8, 0x05a8, %r6
	.word 0xa82225e0  ! 234: SUB_I	sub 	%r8, 0x05e0, %r20
	.word 0x8e1a0009  ! 234: XOR_R	xor 	%r8, %r9, %r7
	.word 0x8fa209c9  ! 234: FDIVd	fdivd	%f8, %f40, %f38
	.word 0xc82a0009  ! 243: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xde821009  ! 243: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r15
	.word 0x8a320009  ! 243: ORN_R	orn 	%r8, %r9, %r5
	.word 0xa6b20009  ! 243: ORNcc_R	orncc 	%r8, %r9, %r19
	.word 0x8c822dc8  ! 243: ADDcc_I	addcc 	%r8, 0x0dc8, %r6
	.word 0x8da20829  ! 243: FADDs	fadds	%f8, %f9, %f6
	.word 0xca320009  ! 250: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xdc520009  ! 250: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x88aa2a84  ! 250: ANDNcc_I	andncc 	%r8, 0x0a84, %r4
	.word 0x9f780409  ! 250: MOVR_R	move	%r0, %r9, %r15
	.word 0x8b322001  ! 250: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0xcf3a2f08  ! 250: STDF_I	std	%f7, [0x0f08, %r8]
	.word 0xe22a0009  ! 258: STB_R	stb	%r17, [%r8 + %r9]
	.word 0xcc9a2820  ! 258: LDDA_I	ldda	[%r8, + 0x0820] %asi, %r6
	.word 0x848222f4  ! 258: ADDcc_I	addcc 	%r8, 0x02f4, %r2
	.word 0x873a2001  ! 258: SRA_I	sra 	%r8, 0x0001, %r3
	.word 0x972a0009  ! 258: SLL_R	sll 	%r8, %r9, %r11
	.word 0x8ba20849  ! 258: FADDd	faddd	%f8, %f40, %f36
	.word 0xc4720009  ! 265: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xccda1009  ! 265: LDXA_R	ldxa	[%r8, %r9] 0x80, %r6
	.word 0x822a0009  ! 265: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x84022ff4  ! 265: ADD_I	add 	%r8, 0x0ff4, %r2
	.word 0x97320009  ! 265: SRL_R	srl 	%r8, %r9, %r11
	.word 0xa5a209c9  ! 265: FDIVd	fdivd	%f8, %f40, %f18
	.word 0xc82a0009  ! 272: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc01a0009  ! 272: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x83641809  ! 272: MOVcc_R	<illegal instruction>
	.word 0x8b2a3001  ! 272: SLLX_I	sllx	%r8, 0x0001, %r5
	.word 0x8e1a0009  ! 272: XOR_R	xor 	%r8, %r9, %r7
	.word 0xd53a0009  ! 272: STDF_R	std	%f10, [%r9, %r8]
	.word 0xc8220009  ! 279: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xfe420009  ! 279: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x89321009  ! 279: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x8caa0009  ! 279: ANDNcc_R	andncc 	%r8, %r9, %r6
	.word 0x8b322001  ! 279: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0xcb3a2fb8  ! 279: STDF_I	std	%f5, [0x0fb8, %r8]
	.word 0xc4720009  ! 286: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xd6821009  ! 286: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r11
	.word 0x88aa2dbc  ! 286: ANDNcc_I	andncc 	%r8, 0x0dbc, %r4
	.word 0x961a2290  ! 286: XOR_I	xor 	%r8, 0x0290, %r11
	.word 0x8c220009  ! 286: SUB_R	sub 	%r8, %r9, %r6
	.word 0x87a20929  ! 286: FMULs	fmuls	%f8, %f9, %f3
	.word 0xc8720009  ! 292: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xf1020009  ! 292: LDF_R	ld	[%r8, %r9], %f24
	.word 0x82820009  ! 292: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x84920009  ! 292: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0x893a3001  ! 292: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0x83a208c9  ! 292: FSUBd	fsubd	%f8, %f40, %f32
	.word 0xdc2a0009  ! 298: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xc81a2f58  ! 298: LDD_I	ldd	[%r8 + 0x0f58], %r4
	.word 0x9d780409  ! 298: MOVR_R	move	%r0, %r9, %r14
	.word 0xaa1a0009  ! 298: XOR_R	xor 	%r8, %r9, %r21
	.word 0x8d3a0009  ! 298: SRA_R	sra 	%r8, %r9, %r6
	.word 0xf13a22a8  ! 298: STDF_I	std	%f24, [0x02a8, %r8]
	.word 0xc6320009  ! 308: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc41a2278  ! 308: LDD_I	ldd	[%r8 + 0x0278], %r2
	.word 0x8c4229f8  ! 308: ADDC_I	addc 	%r8, 0x09f8, %r6
	.word 0x8a0a2568  ! 308: AND_I	and 	%r8, 0x0568, %r5
	.word 0xb88a0009  ! 308: ANDcc_R	andcc 	%r8, %r9, %r28
	.word 0x8fa208a9  ! 308: FSUBs	fsubs	%f8, %f9, %f7
	.word 0xc4220009  ! 314: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc25a2228  ! 314: LDX_I	ldx	[%r8 + 0x0228], %r1
	.word 0x82020009  ! 314: ADD_R	add 	%r8, %r9, %r1
	.word 0xb8a20009  ! 314: SUBcc_R	subcc 	%r8, %r9, %r28
	.word 0x8e3223e8  ! 314: ORN_I	orn 	%r8, 0x03e8, %r7
	.word 0x8ba20849  ! 314: FADDd	faddd	%f8, %f40, %f36
	.word 0xce720009  ! 321: STX_R	stx	%r7, [%r8 + %r9]
	.word 0xca8a1009  ! 321: LDUBA_R	lduba	[%r8, %r9] 0x80, %r5
	.word 0x8a9a2884  ! 321: XORcc_I	xorcc 	%r8, 0x0884, %r5
	.word 0x8f780409  ! 321: MOVR_R	move	%r0, %r9, %r7
	.word 0x9c8a0009  ! 321: ANDcc_R	andcc 	%r8, %r9, %r14
	.word 0x97a20829  ! 321: FADDs	fadds	%f8, %f9, %f11
	.word 0xce320009  ! 327: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4ca25c4  ! 327: LDSBA_I	ldsba	[%r8, + 0x05c4] %asi, %r2
	.word 0x841a25ac  ! 327: XOR_I	xor 	%r8, 0x05ac, %r2
	.word 0x8a320009  ! 327: SUBC_R	orn 	%r8, %r9, %r5
	.word 0x8aa20009  ! 327: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0xc9220009  ! 327: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc320009  ! 333: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca0a0009  ! 333: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x841a2a70  ! 333: XOR_I	xor 	%r8, 0x0a70, %r2
	.word 0xa63a0009  ! 333: XNOR_R	xnor 	%r8, %r9, %r19
	.word 0x9e320009  ! 333: SUBC_R	orn 	%r8, %r9, %r15
	.word 0x8ba20949  ! 333: FMULd	fmuld	%f8, %f40, %f36
	.word 0xce320009  ! 339: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc84a27dc  ! 339: LDSB_I	ldsb	[%r8 + 0x07dc], %r4
	.word 0x8ab20009  ! 339: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x85780409  ! 339: MOVR_R	move	%r0, %r9, %r2
	.word 0xbab22090  ! 339: SUBCcc_I	orncc 	%r8, 0x0090, %r29
	.word 0xc9222dac  ! 339: STF_I	st	%f4, [0x0dac, %r8]
	.word 0xc8720009  ! 346: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xce0225b4  ! 346: LDUW_I	lduw	[%r8 + 0x05b4], %r7
	.word 0x8b2a2001  ! 346: SLL_I	sll 	%r8, 0x0001, %r5
	.word 0x84b22e74  ! 346: SUBCcc_I	orncc 	%r8, 0x0e74, %r2
	.word 0x8a1a0009  ! 346: XOR_R	xor 	%r8, %r9, %r5
	.word 0xcf220009  ! 346: STF_R	st	%f7, [%r9, %r8]
	.word 0x0
	.word 0xd8220009  ! 353: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xca422a04  ! 353: LDSW_I	ldsw	[%r8 + 0x0a04], %r5
	.word 0x84920009  ! 353: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0x8eaa2100  ! 353: ANDNcc_I	andncc 	%r8, 0x0100, %r7
	.word 0x843a0009  ! 353: XNOR_R	xnor 	%r8, %r9, %r2
	.word 0xcd3a0009  ! 353: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc8320009  ! 361: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xce122728  ! 361: LDUH_I	lduh	[%r8 + 0x0728], %r7
	.word 0x8cc20009  ! 361: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0x8cba0009  ! 361: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0x88820009  ! 361: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0x83a20829  ! 361: FADDs	fadds	%f8, %f9, %f1
	.word 0xce220009  ! 367: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc8520009  ! 367: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x8e920009  ! 367: ORcc_R	orcc 	%r8, %r9, %r7
	.word 0xaac22088  ! 367: ADDCcc_I	addccc 	%r8, 0x0088, %r21
	.word 0xa69a21c8  ! 367: XORcc_I	xorcc 	%r8, 0x01c8, %r19
	.word 0xf33a0009  ! 367: STDF_R	std	%f25, [%r9, %r8]
	.word 0xda220009  ! 375: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xc8da1009  ! 375: LDXA_R	ldxa	[%r8, %r9] 0x80, %r4
	.word 0x86c22cd4  ! 375: ADDCcc_I	addccc 	%r8, 0x0cd4, %r3
	.word 0x84b22548  ! 375: ORNcc_I	orncc 	%r8, 0x0548, %r2
	.word 0x82b20009  ! 375: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x8da208c9  ! 375: FSUBd	fsubd	%f8, %f40, %f6
	.word 0xf02a0009  ! 382: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xc80a259c  ! 382: LDUB_I	ldub	[%r8 + 0x059c], %r4
	.word 0x95641809  ! 382: MOVcc_R	<illegal instruction>
	.word 0xaeb227e0  ! 382: SUBCcc_I	orncc 	%r8, 0x07e0, %r23
	.word 0x86ba2f3c  ! 382: XNORcc_I	xnorcc 	%r8, 0x0f3c, %r3
	.word 0x83a20929  ! 382: FMULs	fmuls	%f8, %f9, %f1
	.word 0x0
	.word 0xfc720009  ! 390: STX_R	stx	%r30, [%r8 + %r9]
	.word 0xc8022364  ! 390: LDUW_I	lduw	[%r8 + 0x0364], %r4
	.word 0x82320009  ! 390: ORN_R	orn 	%r8, %r9, %r1
	.word 0x86b20009  ! 390: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0xb2b22fb4  ! 390: SUBCcc_I	orncc 	%r8, 0x0fb4, %r25
	.word 0xd7220009  ! 390: STF_R	st	%f11, [%r9, %r8]
	.word 0x0
	.word 0xe8320009  ! 400: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc6522bb0  ! 400: LDSH_I	ldsh	[%r8 + 0x0bb0], %r3
	.word 0x84120009  ! 400: OR_R	or 	%r8, %r9, %r2
	.word 0x8f3a0009  ! 400: SRA_R	sra 	%r8, %r9, %r7
	.word 0xa73a2001  ! 400: SRA_I	sra 	%r8, 0x0001, %r19
	.word 0x87a20849  ! 400: FADDd	faddd	%f8, %f40, %f34
	.word 0xc4320009  ! 406: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xf45a0009  ! 406: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x833a3001  ! 406: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0xb63a2f5c  ! 406: XNOR_I	xnor 	%r8, 0x0f5c, %r27
	.word 0xa2320009  ! 406: SUBC_R	orn 	%r8, %r9, %r17
	.word 0xcd220009  ! 406: STF_R	st	%f6, [%r9, %r8]
	.word 0xf0720009  ! 412: STX_R	stx	%r24, [%r8 + %r9]
	.word 0xc2821009  ! 412: LDUWA_R	lduwa	[%r8, %r9] 0x80, %r1
	.word 0x8f3a0009  ! 412: SRA_R	sra 	%r8, %r9, %r7
	.word 0xa6322f80  ! 412: SUBC_I	orn 	%r8, 0x0f80, %r19
	.word 0x832a2001  ! 412: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0xf322209c  ! 412: STF_I	st	%f25, [0x009c, %r8]
	.word 0xca320009  ! 418: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xf40a20c4  ! 418: LDUB_I	ldub	[%r8 + 0x00c4], %r26
	.word 0xac2a0009  ! 418: ANDN_R	andn 	%r8, %r9, %r22
	.word 0x8eba238c  ! 418: XNORcc_I	xnorcc 	%r8, 0x038c, %r7
	.word 0x8cc20009  ! 418: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0x8ba20849  ! 418: FADDd	faddd	%f8, %f40, %f36
	.word 0x0
	.word 0xe2320009  ! 427: STH_R	sth	%r17, [%r8 + %r9]
	.word 0xceda1009  ! 427: LDXA_R	ldxa	[%r8, %r9] 0x80, %r7
	.word 0x8b782401  ! 427: MOVR_I	move	%r0, 0x401, %r5
	.word 0x84420009  ! 427: ADDC_R	addc 	%r8, %r9, %r2
	.word 0x96322d74  ! 427: ORN_I	orn 	%r8, 0x0d74, %r11
	.word 0x8ba209a9  ! 427: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xe2220009  ! 436: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xc8020009  ! 436: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x82320009  ! 436: SUBC_R	orn 	%r8, %r9, %r1
	.word 0x84ba0009  ! 436: XNORcc_R	xnorcc 	%r8, %r9, %r2
	.word 0xbf3a1009  ! 436: SRAX_R	srax	%r8, %r9, %r31
	.word 0xc3222e60  ! 436: STF_I	st	%f1, [0x0e60, %r8]
	.word 0xcc220009  ! 443: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc2020009  ! 443: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x892a2001  ! 443: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0xbf323001  ! 443: SRLX_I	srlx	%r8, 0x0001, %r31
	.word 0x82820009  ! 443: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0xcb220009  ! 443: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc2a0009  ! 451: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc6921009  ! 451: LDUHA_R	lduha	[%r8, %r9] 0x80, %r3
	.word 0x8f3a1009  ! 451: SRAX_R	srax	%r8, %r9, %r7
	.word 0x823226a0  ! 451: ORN_I	orn 	%r8, 0x06a0, %r1
	.word 0x94ba2ca4  ! 451: XNORcc_I	xnorcc 	%r8, 0x0ca4, %r10
	.word 0x85a209c9  ! 451: FDIVd	fdivd	%f8, %f40, %f2
	.word 0xfa220009  ! 457: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc2d21009  ! 457: LDSHA_R	ldsha	[%r8, %r9] 0x80, %r1
	.word 0x8b320009  ! 457: SRL_R	srl 	%r8, %r9, %r5
	.word 0x88a22260  ! 457: SUBcc_I	subcc 	%r8, 0x0260, %r4
	.word 0x82920009  ! 457: ORcc_R	orcc 	%r8, %r9, %r1
	.word 0x87a208c9  ! 457: FSUBd	fsubd	%f8, %f40, %f34
	.word 0xc4320009  ! 463: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xc28223a8  ! 463: LDUWA_I	lduwa	[%r8, + 0x03a8] %asi, %r1
	.word 0x8aa20009  ! 463: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0xa8822868  ! 463: ADDcc_I	addcc 	%r8, 0x0868, %r20
	.word 0x828a0009  ! 463: ANDcc_R	andcc 	%r8, %r9, %r1
	.word 0x85a20849  ! 463: FADDd	faddd	%f8, %f40, %f2
	.word 0xc62a0009  ! 469: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce5a2060  ! 469: LDX_I	ldx	[%r8 + 0x0060], %r7
	.word 0x88320009  ! 469: SUBC_R	orn 	%r8, %r9, %r4
	.word 0xb43a0009  ! 469: XNOR_R	xnor 	%r8, %r9, %r26
	.word 0x853a3001  ! 469: SRAX_I	srax	%r8, 0x0001, %r2
	.word 0x83a209c9  ! 469: FDIVd	fdivd	%f8, %f40, %f32
	.word 0xfe2a0009  ! 477: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xc9020009  ! 477: LDF_R	ld	[%r8, %r9], %f4
	.word 0xb5320009  ! 477: SRL_R	srl 	%r8, %r9, %r26
	.word 0x8eb225d8  ! 477: ORNcc_I	orncc 	%r8, 0x05d8, %r7
	.word 0xb62a2550  ! 477: ANDN_I	andn 	%r8, 0x0550, %r27
	.word 0xc9222848  ! 477: STF_I	st	%f4, [0x0848, %r8]
	.word 0xda720009  ! 485: STX_R	stx	%r13, [%r8 + %r9]
	.word 0xcc020009  ! 485: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x82822a40  ! 485: ADDcc_I	addcc 	%r8, 0x0a40, %r1
	.word 0x84022bc0  ! 485: ADD_I	add 	%r8, 0x0bc0, %r2
	.word 0x85323001  ! 485: SRLX_I	srlx	%r8, 0x0001, %r2
	.word 0x99a208c9  ! 485: FSUBd	fsubd	%f8, %f40, %f12
	.word 0xc8320009  ! 491: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf8022cf8  ! 491: LDUW_I	lduw	[%r8 + 0x0cf8], %r28
	.word 0x8ca20009  ! 491: SUBcc_R	subcc 	%r8, %r9, %r6
	.word 0x9ea22f7c  ! 491: SUBcc_I	subcc 	%r8, 0x0f7c, %r15
	.word 0x9e8a2e98  ! 491: ANDcc_I	andcc 	%r8, 0x0e98, %r15
	.word 0x8fa20829  ! 491: FADDs	fadds	%f8, %f9, %f7
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x00000000000004c0, %g1, %r9
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
        setx  0xa6100c66f1d09390, %g1, %r0
        setx  0x03e1ab7ccb7d4a41, %g1, %r1
        setx  0xea522a7d73431726, %g1, %r2
        setx  0x4552766fca9986a6, %g1, %r3
        setx  0x19d4897f3eaac7c5, %g1, %r4
        setx  0x346acb1e238e5edb, %g1, %r5
        setx  0x8913caacff829a7d, %g1, %r6
        setx  0x88bc6c74dcb8088f, %g1, %r7
        setx  0x408715e273f89186, %g1, %r10
        setx  0x59120c9b558a216d, %g1, %r11
        setx  0xe7fb0dcfe9d5e3cd, %g1, %r12
        setx  0xed9be76ed4a89455, %g1, %r13
        setx  0xe9fc842a55370e27, %g1, %r14
        setx  0x2c17cb92442519f8, %g1, %r15
        setx  0xddf593ae7338f179, %g1, %r16
        setx  0xc7043fa696701005, %g1, %r17
        setx  0x68b49c16a3848cd7, %g1, %r18
        setx  0x6518be62335b4835, %g1, %r19
        setx  0x6a97ad0a46c66e3e, %g1, %r20
        setx  0x249af9fbbeb0e648, %g1, %r21
        setx  0xf857a2f5c40914dd, %g1, %r22
        setx  0x5faad253fbc98a83, %g1, %r23
        setx  0xaeb08a0ec855f188, %g1, %r24
        setx  0x0edfea44b453962b, %g1, %r25
        setx  0x53fa5e187cc5c642, %g1, %r26
        setx  0x0471d61b29481c35, %g1, %r27
        setx  0xe8dd37417cdc403a, %g1, %r28
        setx  0xbf245e4c31bb8d1d, %g1, %r29
        setx  0x32a16445250723a1, %g1, %r30
        setx  0x04a750f05bb971de, %g1, %r31
	.word 0xcd220009  ! 2: STF_R	st	%f6, [%r9, %r8]
	.word 0x87a209a9  ! 20: FDIVs	fdivs	%f8, %f9, %f3
	.word 0xada208c9  ! 21: FSUBd	fsubd	%f8, %f40, %f22
	.word 0xaba20849  ! 22: FADDd	faddd	%f8, %f40, %f52
	.word 0xcd220009  ! 24: STF_R	st	%f6, [%r9, %r8]
	.word 0x87a20929  ! 36: FMULs	fmuls	%f8, %f9, %f3
	.word 0xe1222a94  ! 49: STF_I	st	%f16, [0x0a94, %r8]
	.word 0xcf2227a4  ! 62: STF_I	st	%f7, [0x07a4, %r8]
	.word 0xc3222e54  ! 75: STF_I	st	%f1, [0x0e54, %r8]
	.word 0xbba209c9  ! 76: FDIVd	fdivd	%f8, %f40, %f60
	.word 0x8da20949  ! 83: FMULd	fmuld	%f8, %f40, %f6
	.word 0xcf220009  ! 85: STF_R	st	%f7, [%r9, %r8]
	.word 0x97a208a9  ! 103: FSUBs	fsubs	%f8, %f9, %f11
	.word 0xeb220009  ! 105: STF_R	st	%f21, [%r9, %r8]
	.word 0x8da20949  ! 111: FMULd	fmuld	%f8, %f40, %f6
	.word 0xcf220009  ! 113: STF_R	st	%f7, [%r9, %r8]
	.word 0x87a209a9  ! 125: FDIVs	fdivs	%f8, %f9, %f3
	.word 0x89a20829  ! 138: FADDs	fadds	%f8, %f9, %f4
	.word 0xc53a0009  ! 140: STDF_R	std	%f2, [%r9, %r8]
	.word 0x83a20849  ! 152: FADDd	faddd	%f8, %f40, %f32
	.word 0x97a20829  ! 159: FADDs	fadds	%f8, %f9, %f11
	.word 0x8ba209a9  ! 160: FDIVs	fdivs	%f8, %f9, %f5
	.word 0xe9220009  ! 168: STF_R	st	%f20, [%r9, %r8]
	.word 0xc5220009  ! 175: STF_R	st	%f2, [%r9, %r8]
	.word 0xc3222258  ! 187: STF_I	st	%f1, [0x0258, %r8]
	.word 0x87a20949  ! 188: FMULd	fmuld	%f8, %f40, %f34
	.word 0x8fa20929  ! 189: FMULs	fmuls	%f8, %f9, %f7
	.word 0xb1a20949  ! 214: FMULd	fmuld	%f8, %f40, %f24
	.word 0x85a20929  ! 227: FMULs	fmuls	%f8, %f9, %f2
	.word 0x8da20949  ! 228: FMULd	fmuld	%f8, %f40, %f6
	.word 0x99a208c9  ! 235: FSUBd	fsubd	%f8, %f40, %f12
	.word 0xc73a2610  ! 236: STDF_I	std	%f3, [0x0610, %r8]
	.word 0xa5a208c9  ! 237: FSUBd	fsubd	%f8, %f40, %f18
	.word 0x8ba20849  ! 244: FADDd	faddd	%f8, %f40, %f36
	.word 0x8ba20829  ! 251: FADDs	fadds	%f8, %f9, %f5
	.word 0x8fa20949  ! 252: FMULd	fmuld	%f8, %f40, %f38
	.word 0xd9220009  ! 260: STF_R	st	%f12, [%r9, %r8]
	.word 0x87a208a9  ! 266: FSUBs	fsubs	%f8, %f9, %f3
	.word 0xc93a2ec8  ! 273: STDF_I	std	%f4, [0x0ec8, %r8]
	.word 0xcd3a0009  ! 281: STDF_R	std	%f6, [%r9, %r8]
	.word 0x8da209a9  ! 299: FDIVs	fdivs	%f8, %f9, %f6
	.word 0x83a209a9  ! 300: FDIVs	fdivs	%f8, %f9, %f1
	.word 0x87a209c9  ! 301: FDIVd	fdivd	%f8, %f40, %f34
	.word 0xafa20829  ! 302: FADDs	fadds	%f8, %f9, %f23
	.word 0xc73a0009  ! 316: STDF_R	std	%f3, [%r9, %r8]
	.word 0xaba20849  ! 340: FADDd	faddd	%f8, %f40, %f52
	.word 0x0
	.word 0x83a20929  ! 354: FMULs	fmuls	%f8, %f9, %f1
	.word 0xcb3a2cb0  ! 355: STDF_I	std	%f5, [0x0cb0, %r8]
	.word 0x8ba208a9  ! 368: FSUBs	fsubs	%f8, %f9, %f5
	.word 0xc3222e2c  ! 369: STF_I	st	%f1, [0x0e2c, %r8]
	.word 0x85a209a9  ! 376: FDIVs	fdivs	%f8, %f9, %f2
	.word 0x0
	.word 0xfb220009  ! 385: STF_R	st	%f29, [%r9, %r8]
	.word 0xbfa209a9  ! 391: FDIVs	fdivs	%f8, %f9, %f31
	.word 0xe73a2c20  ! 392: STDF_I	std	%f19, [0x0c20, %r8]
	.word 0xbfa20849  ! 393: FADDd	faddd	%f8, %f40, %f62
	.word 0x0
	.word 0x8fa208c9  ! 419: FSUBd	fsubd	%f8, %f40, %f38
	.word 0xa7a208c9  ! 420: FSUBd	fsubd	%f8, %f40, %f50
	.word 0x0
	.word 0xbba20949  ! 428: FMULd	fmuld	%f8, %f40, %f60
	.word 0x8fa20929  ! 429: FMULs	fmuls	%f8, %f9, %f7
	.word 0x83a20849  ! 430: FADDd	faddd	%f8, %f40, %f32
	.word 0xbba20949  ! 437: FMULd	fmuld	%f8, %f40, %f60
	.word 0xa5a20949  ! 444: FMULd	fmuld	%f8, %f40, %f18
	.word 0xc92220e4  ! 445: STF_I	st	%f4, [0x00e4, %r8]
	.word 0x8ba20829  ! 470: FADDs	fadds	%f8, %f9, %f5
	.word 0x9ba209a9  ! 471: FDIVs	fdivs	%f8, %f9, %f13
	.word 0x89a208c9  ! 478: FSUBd	fsubd	%f8, %f40, %f4
	.word 0xcd220009  ! 480: STF_R	st	%f6, [%r9, %r8]
	.word 0x8fa208c9  ! 492: FSUBd	fsubd	%f8, %f40, %f38
	.word 0xa5a20949  ! 493: FMULd	fmuld	%f8, %f40, %f18
	.word 0xc53a2b98  ! 494: STDF_I	std	%f2, [0x0b98, %r8]
	.word 0x8fa208c9  ! 495: FSUBd	fsubd	%f8, %f40, %f38
	nop
	nop
	nop
        ta      T_GOOD_TRAP

.data
	.word  0xee09fb47,0x92236d60,0x28b41227,0x81c880b4
	.word  0x1c557544,0x4512afbe,0xcb07312f,0xf57eff3b
	.word  0x4b7cbd4a,0xc00afcea,0xd81aef19,0x30c9376b
	.word  0x184754f6,0x60f653b5,0x67e5748b,0x58f6af9b
	.word  0xe080342e,0xdc926ca9,0x78466433,0x1b79bee1
	.word  0x9d270fc5,0x1c9309a6,0xeb357941,0x90407398
	.word  0x152b3ef2,0xbf08e2dc,0x222f1d00,0xac783282
	.word  0xf7117e9d,0xb4fc8429,0x1a8094d1,0xc72e48b0
	.word  0x8945c08c,0x8133b966,0x78241396,0x2b53c020
	.word  0xb2a982f7,0x7c1cbfbf,0xde080be6,0x354dc93d
	.word  0xe29d1e05,0x0c7e09cf,0xe5df7acc,0xc2c4f91a
	.word  0x80e086ac,0xa8e37c25,0x37aa1e92,0xcff2d26c
	.word  0x5b121b40,0x157a4c91,0x46823cc8,0xd91ebc8f
	.word  0x3bdbd0e2,0xd0e302a4,0xcb2494f7,0x6988c12f
	.word  0xa0fa2656,0x23690862,0x0d7556a6,0x860db415
	.word  0xe197e185,0xbe7076ea,0xbb7178d7,0xd24d7a53
	.word  0xf4b8602d,0xf1b6f389,0xcb4f65d6,0xc950d315
	.word  0x43197cee,0x17eda3e3,0x09dc56fb,0xe861a1e9
	.word  0x78b4ab4c,0x29f39960,0xf96013b5,0x06dcd01f
	.word  0x04867a95,0x6bb5750e,0x82b5b13f,0xb84fe6db
	.word  0x03e4cb4a,0x6c051136,0x3e53725a,0xdd6e91e7
	.word  0x15461da4,0x1d6fbb4d,0x711d3d2d,0x4149e4e5
	.word  0x4f2d604a,0x3c0014ae,0x993a47df,0x71ac1b3d
	.word  0x46f9f247,0x5a949421,0x773a8fa5,0xe13a2dbb
	.word  0xb553e1e5,0x553d0250,0x47adf4d4,0xa6723b28
	.word  0xdf868df0,0x9bb320d8,0xbabcb59c,0xb591078f
	.word  0x509b85f6,0x00671275,0xfccd22c0,0xd69fd554
	.word  0x0819d1b3,0x5410f452,0xa557c57b,0xd3233563
	.word  0x19197bb6,0xf41cb4d8,0xbf2a6c23,0xd7c69a9b
	.word  0x30107235,0x67bbf924,0xbb24aaf4,0x83efb921
	.word  0x99a1973e,0x98af1248,0xb7518e46,0xd5baf919
	.word  0xddd9e5fd,0xef6f4dac,0x04166bfb,0xbee4e065
	.word  0xe9c4e469,0x9c76e64e,0x14346589,0xb480773b
	.word  0x45316ace,0x76a89064,0x03305167,0x5ed6c27a
	.word  0xd31dd705,0x2b9411c2,0x52a559de,0xe6f9ce81
	.word  0x18f9d075,0x8f33d936,0x6c11c897,0x43b183f3
	.word  0x31d74a12,0x828645ca,0x075e1330,0x875f83eb
	.word  0xd96c33fe,0xeb8627ee,0x85839fb7,0xd8dfa9b3
	.word  0x315133e5,0xedeb21d4,0xc88e8fb7,0xe75aaadd
	.word  0xead66f81,0x351786f0,0xe0ac2bac,0x07192118
	.word  0xe7b1d3f7,0x64895737,0x9bd4f82f,0xd1f8ccae
	.word  0xdf7bff11,0xe674a5fb,0x384b5e2f,0xd208e561
	.word  0x4967cbe9,0xae9a17c7,0x7b78053b,0x891501f4
	.word  0xf4d49bf4,0x4b567c6a,0xd00813ca,0xb870d5b9
	.word  0xb6e1abc8,0xad05192c,0xaeb4b7f3,0x995cf493
	.word  0xa025aae1,0x26d0dc83,0x7b0fa24a,0xc009ebbd
	.word  0x20e4a664,0x60bea92c,0xbf09e083,0xbb5452f4
	.word  0xe35bcab9,0x21e9c3df,0xaafff94d,0x3fabcc2e
	.word  0xb7b8dbcb,0x00cceac1,0x8cc33ff7,0xa306a1b3
	.word  0x8fa14daa,0xfc708e98,0x852451f2,0x2e509112
	.word  0xf7b758a8,0x35a8f953,0xa6e31ef8,0x624e2950
	.word  0x7fc3f998,0x7bb0f500,0x2d655d88,0x72d566fa
	.word  0x83c956dd,0x71bf53e6,0xcb48aca4,0xf00a9bb6
	.word  0xb95f8fd1,0xdad2ef4d,0xd02621be,0x29894dde
	.word  0x2811d023,0x9b1683f2,0x081f8815,0x874e3683
	.word  0x3dd3e83f,0x41a0193f,0x5d2256a2,0xdf3e4e79
	.word  0x14281da9,0x83eeaf9d,0x4270f4ae,0xd300bd67
	.word  0x1d359cff,0x50d9b8a4,0x5692a9f5,0x98727ef5
	.word  0x48fde19a,0x1d6b41ac,0xde0e1158,0xc01c21ed
	.word  0xd6285bda,0xfcc1ef0d,0xc6a2085c,0x9fbce27f
	.word  0xa328b4fb,0x030d7864,0x9648fcf1,0x7bc5c1fc
	.word  0xa1852a7c,0x1741131f,0xf43abe57,0x48de1978
	.word  0xe6eb3133,0xd6d0d3dd,0x6f14daf7,0xd45e15b3
	.word  0xad65898f,0x7740474a,0xe5b6b7a0,0x2bb7e2e0
	.word  0x85d722cc,0x0e759060,0x8714664f,0x26fcf41e
	.word  0xdfb3efa3,0xed8757af,0x78662f79,0x71406f50
	.word  0xa3a88579,0x98f94bf7,0x3e908714,0x1529c21f
	.word  0xbd96ebc7,0x57feba80,0x12f3b5a5,0xf9fc52d1
	.word  0x8207b1c8,0xc77fb226,0x96bae3f0,0x2105c05b
	.word  0xe214b36a,0xf18db48f,0xb004c84b,0x3b773349
	.word  0x73307c64,0xac21758e,0x2306dcf6,0xeb7d5ce2
	.word  0x32e03c01,0x171868cb,0xaeb7a8d5,0x3659603b
	.word  0x785c5113,0x0ef21307,0x3be51b53,0xa6178b1e
	.word  0x6185f1a1,0x8b697d45,0xfe895106,0x65643d1f
	.word  0xfc7b2aa8,0x1673f39a,0xa6358c34,0x7cbe6472
	.word  0xdca983bd,0xcd738a8a,0xa70f08a9,0x5a18f44d
	.word  0x0b27e66d,0x88b10bb6,0x88594392,0xfbc518bc
	.word  0x925b1873,0xce4e6a6c,0x281c2c0e,0x2a7271e1
	.word  0x9f64459c,0xdf2db50b,0x36b3af64,0x32fde3a9
	.word  0x52795683,0x90993d5d,0x6afd0a15,0xaf14aa30
	.word  0x97e1d20f,0x61e0c6e7,0x8b049ed5,0x6d7fa265
	.word  0x58ac9508,0x5cb9a3fb,0xe72de2c3,0x721680af
	.word  0x8d632d16,0xd9599979,0x6cc3a10c,0x352f1b67
	.word  0x1209c29e,0xe212fb21,0xc3356a1c,0x4496cdfc
	.word  0x966108b5,0xa18c2b65,0xb84becda,0x09800335
	.word  0x59322290,0xebe767fb,0x0f7acfb9,0x5b4a2b75
	.word  0x39596420,0x950bfdad,0xff820cc3,0x6d9d6bc9
	.word  0x64fd306e,0x61d071a3,0xc050272d,0xf459f801
	.word  0x8cee1f40,0xc53473fd,0xc353bb3b,0xa4f63687
	.word  0xa948bd62,0x1bf16e66,0x7195f464,0x69ec6e8f
	.word  0x03023bf8,0x2d00437d,0x751d93d1,0xea2f0237
	.word  0xaab72720,0x32abb31c,0xd1d4d926,0x06cda5f2
	.word  0x8b6f24ba,0xacc421c5,0xa5bbad06,0x75e7fce6
	.word  0xbc23dde8,0x15222358,0x3b5fe1c8,0x4d5c9c97
	.word  0x0a3a38fb,0xec675319,0xefb509b5,0x8e081372
	.word  0x40983c4c,0x95b28987,0x90b36410,0x02f195cf
	.word  0x43ec21c0,0x8e392c99,0xdd28a859,0x5f62c7bd
	.word  0x398a4cb9,0x6cf122fa,0x1e6747c6,0x346742a5
	.word  0x50b0f73a,0x9f0c3720,0x675712b2,0x36d776b4
	.word  0x21ab83f1,0x658ae9a6,0xe08e5906,0x99fbf4f1
	.word  0x61ca3421,0x6f8a220c,0x01d56b29,0xad98166c
	.word  0x1c9bdcbd,0x94579028,0x35e66476,0xeba48867
	.word  0x9c2e745e,0x1e9efaaf,0x2bea13e6,0x4aa90eec
	.word  0x5347cfab,0x3042dfb8,0x051f1281,0xae7adba9
	.word  0x75ae80d9,0xa51ad5a0,0x3b21bed0,0xaf800809
	.word  0xf5eeb334,0x6e5993a1,0x63d8a456,0x95ba9ccb
	.word  0x8875fd46,0x64134ea3,0x737643e6,0xff0955c2
	.word  0xbd398e2b,0x7c8f8c66,0xaa7cd300,0x2a1fb8d4
	.word  0x0e92e5ac,0x7883445c,0x1d064dc7,0xfac6e95c
	.word  0x458bf412,0x02c3c5b2,0xfc4be669,0xa1ad2594
	.word  0xcc86324b,0x8de2cfa9,0x591b3bc7,0x978a48b4
	.word  0x408e8bee,0x9f52c46e,0xe2421d75,0xabe7e3ff
	.word  0x5963ef97,0x4486033b,0x2004ca2b,0x24d33c16
	.word  0x121d368e,0x9ddb0158,0x9f155c59,0x5665c458
	.word  0xcc534308,0xb0a00752,0x4e6ae46a,0xb3d21dce
	.word  0x02f3d9d6,0xbf6d8dc2,0xe898d599,0x9f4c5402
	.word  0xfaf8fb6a,0xe6ab42be,0xae13e4e1,0x9e2f8f99
	.word  0x1f8bd9d8,0xd3962e24,0x0c4c1dde,0xdd963f2e
	.word  0x355a33bd,0x6bcc676d,0xb160b767,0x3c33f17c
	.word  0x96061c70,0x3268ac99,0xe8202fad,0x3fe35c0d
	.word  0xd95d6f3b,0x7c737f69,0x5b15cc18,0x96d47681
	.word  0x6006cabe,0xcacd643e,0xe011d365,0x520d4788
	.word  0x26018254,0xfe9fa64b,0x9f81e9eb,0xdadcd84f
	.word  0x51be4e1a,0x0d800458,0x64ff5777,0x54f23e46
	.word  0x6c01bb5c,0x76cd6354,0x6b6e5e16,0xace89b05
	.word  0x359e223a,0x133a1388,0x139f4507,0xdee97f89
	.word  0x542e8dd1,0x11c01ff7,0xb301a5fc,0x2325e007
	.word  0x639f5f3a,0x32c86975,0x7ba0baa0,0x77178f62
	.word  0x08530840,0xec309305,0x8b9aa33d,0x4d7652ba
	.word  0xab78cadd,0x6092764c,0x96641918,0x30593248
	.word  0xeeeecd22,0xffca38b6,0x2126a54b,0xa6ae79f1
	.word  0x9f5c8039,0x80dffe98,0xb8813db7,0xce5b39ef
	.word  0xaadf82b3,0x9a0fb5ac,0x3a31d51f,0x0ca40196
	.word  0x3dadbf07,0xbca447f1,0xf94e3ea2,0xfc2d1bf8
	.word  0x237f79b8,0x7813fb2d,0x2a454c6a,0x5039ac40
	.word  0x276b93cd,0x74f1d430,0x2cb99375,0xae2c749e
	.word  0x91e17571,0xf8bef3e2,0x7f7ac110,0xd275a883
	.word  0x614c02c5,0x5a01e9b7,0xc2342663,0x7c43efe2
	.word  0x4a7d3642,0xb951301a,0x62c82584,0xc65aac5c
	.word  0xa9808cb0,0xb06fdc89,0x6da3ad0b,0x5ff15493
	.word  0x5d196389,0x5b003611,0xa64f8297,0xdafef828
	.word  0x2adc7c38,0x8995a15d,0xba1218d5,0x6fd7ccc2
	.word  0xf906b1bd,0x6e586d00,0x66e0f722,0xd99e5b84
	.word  0xfc30042f,0xb619e68b,0xba4f4529,0xcb19ca43
	.word  0x321fb35d,0x4d9fc951,0x87e7dfd3,0x8c363e71
	.word  0xc9375468,0x4359801f,0x3641365c,0xfe1eee93
	.word  0x9e983122,0x9b4e3b92,0xe3726231,0x98879e7a
	.word  0x566f2c23,0xc5c8bbf1,0xda8310a5,0x81bf791d
	.word  0x2604245b,0x60d304a6,0x6847d963,0xdc06f141
	.word  0xa1fc7f7e,0xd75c880c,0x67f188b4,0x03a3c605
	.word  0xd4c4d966,0x2ae56692,0x464d5b51,0x4e07aeae
	.word  0x52b2d7a5,0x1c102a52,0xf0302ea2,0x67f5cc7e
	.word  0x13ca8ed0,0x763c0878,0x60fdd796,0x40a53d2a
	.word  0x7d87b8f2,0x9cdaf8f7,0xae305ce0,0x9c61cf9d
	.word  0xde398f00,0x5283293b,0x21ab9e31,0xaea4e953
	.word  0x0fb9cbc7,0xedc367d0,0xe097e146,0x6cfd67b2
	.word  0x1054d4a7,0xb063ceba,0xe9bca9de,0xbf772d12
	.word  0x5b56a040,0x1e485d23,0xff9fe649,0xeffb7853
	.word  0x18dbd852,0x44214389,0xeddf7d2a,0x401dc644
	.word  0x6236e93f,0x0dd83cfe,0xd7d78dc7,0xa88ea439
	.word  0x27e3ec7b,0x2661d1e1,0xb580fab0,0x83709eb6
	.word  0x8df7cd1c,0xc8c69183,0xfb47403e,0x70fc7fc4
	.word  0xb728255b,0xdc3fbef9,0x5bd0cf08,0xc645794e
	.word  0x47c80c64,0xfb8d7d12,0x91a4e638,0x43c86b6f
	.word  0xe8f10472,0x48e055d4,0x7419c83e,0xb4488f5b
	.word  0x257a756e,0x5d4df32f,0xd96a3abd,0x52db99f0
	.word  0xd7a5d6e4,0x1fd69c4b,0x58b637c9,0xfaf6c020
	.word  0x48e278e7,0x72e3b0c2,0xda7297c5,0xada786e5
	.word  0xf2d85abd,0x94a3924b,0x04526196,0x6ba79aa4
	.word  0x366046b7,0x94d5caa2,0x15a438e4,0xe32102c4
	.word  0x46072bbb,0x5eae8d9a,0x4a03eb84,0x9195659f
	.word  0x761c5e0f,0x133450a6,0xe3d1611a,0x5bd439eb
	.word  0xc95e420b,0x4dfb7f26,0x717850da,0xa5fd03d9
	.word  0xc94273ac,0xedb298d7,0x6df9c649,0x26e30e68
	.word  0xac6a720a,0xaf2c901f,0x4c2a76ce,0xbde20be3
	.word  0x1e532084,0xe7d3982e,0x9f891052,0x7f999a5f
	.word  0x6c07f7df,0xd7086449,0x9352dcd1,0x06bc6261
	.word  0xa429aa5a,0xcf100f48,0x49d6aa4e,0x96788194
	.word  0xb2cf55ec,0xa1b08d15,0x55144839,0x00360dd9
	.word  0x53eebdd9,0xe1520a92,0xfc2394b9,0x0ed121e4
	.word  0x7d1240a6,0x8ee4cb51,0x448ed79c,0x14d71f40
	.word  0xaade4c47,0x5ed86601,0xd8abc667,0x6f84897f
	.word  0xc2ee6210,0x0eee0853,0xeeb000e3,0xc2bd20b4
	.word  0x65019523,0xa54d05fd,0xe78979fa,0x5683e353
	.word  0xc0dfa8af,0xda6a4b75,0x014367ff,0x02f15605
	.word  0xb46fe2df,0xe04dcc46,0x3c3ac965,0xf92b87a0
	.word  0x00a14a9a,0x61fa7760,0xe2b2a96d,0x32f5006c
	.word  0x371f9e37,0x058ae814,0x201d810d,0x56014663
	.word  0x1255b93e,0x4e1d8cc6,0x79678bd7,0x22097322
	.word  0x9a5ef799,0xe80e64f1,0x8eb5d0d0,0xbb97bbd7
	.word  0x5d78474c,0xce9830cf,0x133c3ce1,0x06daa32d
	.word  0xdbae8def,0xcd5178fb,0x152d2823,0x89089547
	.word  0xbabdb10a,0x919d2115,0x4cd14a98,0x06fd7ca1
	.word  0x033a31ac,0x329416a9,0xc3a0c64d,0x33cd9fbe
	.word  0xe585af5b,0x9f7d090a,0x8909374b,0x14738d09
	.word  0x1f46be20,0xa5b8793e,0x71e642ee,0xeaac0314
	.word  0x69ddee16,0x177cd757,0x98cc5959,0x45eabcdb
	.word  0x4923d7ba,0x79a03633,0xcd4cd518,0xab2c0d0c
	.word  0x15ee19d8,0xa262b911,0xa9f66cfd,0x75a84fad
	.word  0x84428229,0xc17c8d23,0x2125ab38,0x244610ce
	.word  0x5f09e59d,0x16da12cc,0x0208da8b,0xfad23f5b
	.word  0xb6ca745d,0xbd79b854,0xe2d7fc2b,0xc7ec6896
	.word  0x93392aee,0xb6fde361,0x6e1a1010,0xf3d348a8
	.word  0x6dfcc844,0xef654b00,0x1b236e65,0xb5c9e81a
	.word  0x2411023c,0xe8fbc9ea,0x61326629,0x3a727b02
	.word  0xd30d5cc7,0x24f3264f,0x7d22a408,0xc8567a5c
	.word  0x4c3084ff,0x60d6e3d3,0x1f3ba3ad,0xe7a06911
	.word  0x689c6504,0x9c99656a,0x068ceb1a,0xe0a634f8
	.word  0xe84f052f,0x9fa50154,0x0dd4de00,0x33c08e95
	.word  0x8dc59b5f,0x8b8b301e,0x594e0f2e,0x0b15dcb4
	.word  0xcfb39341,0xbce81593,0xb9bfe555,0x64ac2e20
	.word  0x52ae423a,0x64a52447,0xaafb4fa8,0x9d8d1baa
	.word  0x0eeb33f7,0x76f59e8c,0x1d2c9ebf,0x038cef41
	.word  0xea0641c3,0x65b242dd,0x32a94011,0xfc86ac35
	.word  0xe1cab8d7,0x0b1a27ae,0xf43e4456,0x8b1009a4
	.word  0xba738d64,0x5a5e1e78,0x0f8a050c,0xa819de99
	.word  0x1be94413,0x857dd959,0x5c151ffc,0xed800958
	.word  0x662812af,0x76a320a8,0x3c7de60d,0x7d8866c2
	.word  0xb5567917,0x8f8e8115,0x1f199ad3,0x7d386b20
	.word  0xc3e80d20,0x8b29d10b,0x3be160ee,0x2160e435
	.word  0x4bb55d53,0xeb060f54,0x694c1f84,0x67600db2
	.word  0x790800e2,0x8e41a513,0x341d473a,0x9c4b120e
	.word  0x4c2d0214,0x9798e397,0xa9974b4c,0xd29936bf
	.word  0x8422d641,0x39fec4b2,0x331737ad,0xeebf4f2e
	.word  0xd82bbb52,0xd34af179,0x2080b33d,0x74d63dbc
	.word  0xa4c39ea0,0x1006bac3,0xa6a5200f,0x945c69b3
	.word  0xb40221d1,0xc38aa5b5,0x0b06607d,0x38b68a2a
	.word  0x4155cde8,0x75658d41,0x73844507,0x8b894644
	.word  0xf608a71a,0x8fa299a6,0x71031fe7,0x7fd236da
	.word  0x74bf25dd,0x48a9c0b5,0xad1359e6,0xa9ee60cc
	.word  0x448f4428,0x1bb81933,0xb62f54f5,0x97615be3
	.word  0x53295d43,0xd83d3a5d,0x52a7db09,0x597120d3
	.word  0xfbecd0c0,0x00c2f906,0x34f76e2b,0x8eb734c5
	.word  0xada306af,0xa236b858,0x67f1c381,0x88da879c
	.word  0x61735d33,0x290ca4b6,0x03977c8a,0x971aa36e
	.word  0x2e5f38f9,0xe880543d,0xdc39aee7,0xa1d5574e
	.word  0xf253990e,0x632daaaf,0x4e9257a2,0xde380063
	.word  0xaf944576,0xe0440150,0xa486f89e,0x3bea45e9
	.word  0x7195c05c,0x1d88de4c,0xd12f5319,0x8ed1a39b
	.word  0x623a2a32,0x6275393c,0x6d14223d,0xc273d101
	.word  0x9b6cace1,0x3243f66f,0xc1f316da,0x446bfca6
	.word  0x23d42688,0x2bef2ac4,0x5560d779,0x20a2e39d
	.word  0xb3bd9dc2,0x245e58be,0x28c7a5d4,0xc7c0664e
	.word  0x33353ee2,0x8944bb41,0x12779d21,0x74307e86
	.word  0xc4619cfc,0x15d3e962,0xfaf4e3f2,0xc8028825
	.word  0xdfc667f1,0xd78453fd,0x9c8f6bd5,0x5f31941d
	.word  0x01d0e9b2,0x2177a791,0xd15bf3a7,0xd35cd03e
	.word  0x5c60ab1e,0xdfe448f6,0x5885eb60,0x13e6bb5f
	.word  0x7e28548a,0xc6f59af3,0xf290890a,0xb1ba118c
	.word  0xd868cde9,0xde8f1567,0xbf301946,0x8557453e
	.word  0xb120c628,0x17315c8c,0xbd787f83,0x57b37094
	.word  0x9928a22e,0xabf5b1f0,0x562b720a,0x8d9434bc
	.word  0xc363c7a1,0x39163b86,0xc8dc8d4f,0x3ebbd878
	.word  0x299595a3,0xcb2c0346,0x36e7cce7,0x53e0009a
	.word  0xfb8e7b20,0x4590ba4c,0x08c139af,0x3e1c052c
	.word  0x4a77b29e,0x0b917def,0x868ceef1,0x0544cf69

!!# /************************************************************
!!# *
!!# * File:         divs0.j
!!# *
!!# * Description:  Contention for divider with stb raw and
!!# * 		Contention in the delay slot
!!# *
!!# **************************************************************/
!!# 
!!# --c_declarations
!!# 
!!#   int i;
!!#   int burst_cnt;
!!# 
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
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rd, "{1..7, 10..31}"); 
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
!!#   IJ_set_rvar (mrbw_wt, "{15}");
!!#   IJ_set_rvar (fpop_wt, "{10}");
!!#   IJ_set_rvar (ill_wt, "{1}");
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
!!# inst_type: stb_raw_alu_alu_alu_fpop %rvar mrbw_wt
!!# 	   | ill_inst %rvar ill_wt
!!#            | fpop %rvar fpop_wt 
!!# {
!!#    IJ_generate ("th1:3", $1);
!!# }
!!# 
!!# ;
!!# 
!!# ill_inst: mMETA0
!!# {
!!#    IJ_printf ("th", "\t.word 0x0\n");
!!# }
!!# ;
!!# 
!!# stb_raw_alu_alu_alu_fpop: store load alu alu alu fpop
!!# {
!!#    IJ_generate_va ("th0:2", $1, $2, $3, $4, $5, $6, NULL);
!!# }
!!# ;
!!# 
!!# load: load_r | load_i | asi_load
!!# ;
!!# 
!!# load_i: tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I | tLDD_I 
!!# ;
!!# 
!!# asi_load: tLDSBA_R | tLDSBA_I | tLDSHA_R | tLDSHA_I | tLDSWA_R | tLDSWA_I | tLDUBA_R | tLDUBA_I | tLDUHA_R | tLDUHA_I | tLDUWA_R | tLDUWA_I | tLDXA_R | tLDXA_I | tLDDA_R | tLDDA_I 
!!# ;
!!# 
!!# store: tSTB_R | tSTH_R | tSTW_R | tSTX_R | tSTF_R | tSTDF_R
!!# ;
!!# 
!!# load_r: tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R | tLDD_R | tLDF_R | tLDDF_R
!!# ;
!!# 
!!# alu: tADD_R | tADD_I | tADDcc_R | tADDcc_I | tADDC_R | tADDC_I | tADDCcc_R | tADDCcc_I | tAND_R | tAND_I | tANDcc_R | tANDcc_I | tANDN_R | tANDN_I | tANDNcc_R | tANDNcc_I | tOR_R | tOR_I | tORcc_R | tORcc_I | tORN_R | tORN_I | tORNcc_R | tORNcc_I | tXOR_R | tXOR_I | tXORcc_R | tXORcc_I | tXNOR_R | tXNOR_I | tXNORcc_R | tXNORcc_I | tMOVcc_R | tMOVcc_I | tMOVR_R | tMOVR_I | tSLL_R | tSLL_I | tSRL_R | tSRL_I | tSRA_R | tSRA_I | tSLLX_R | tSLLX_I | tSRLX_R | tSRLX_I | tSRAX_R | tSRAX_I | tSUB_R | tSUB_I | tSUBcc_R | tSUBcc_I | tSUBC_R | tSUBC_I | tSUBCcc_R | tSUBCcc_R | tSUBCcc_I
!!# ;
!!# 
!!# fpop: tSTF_R | tSTF_I | tSTDF_I | tSTDF_R | tFADDs | tFSUBs | tFMULs | tFDIVs | tFADDd | tFSUBd | tFMULd | tFDIVd
!!# ;
!! Token Generation Statistics
!! ---------------------------------
!! 
!! Rule   1 (line  116), Count:   487  inst_block           -> inst_type 
!! Rule   2 (line  117), Count:   487  inst_block           -> inst_block inst_type 
!! Rule   3 (line  120), Count:   354  inst_type            -> stb_raw_alu_alu_alu_fpop 
!! Rule   4 (line  121), Count:     3  inst_type            -> ill_inst 
!! Rule   5 (line  122), Count:   128  inst_type            -> fpop 
!! Rule   6 (line  129), Count:     3  ill_inst             -> mMETA0 
!! Rule   7 (line  135), Count:   354  stb_raw_alu_alu_alu_fpop -> store load alu alu alu fpop 
!! Rule   8 (line  141), Count:    27  load                 -> load_r 
!! Rule   9 (line  141), Count:    17  load                 -> load_i 
!! Rule  10 (line  141), Count:    24  load                 -> asi_load 
!! Rule  11 (line  144), Count:     0  load_i               -> tLDSB_I 
!! Rule  12 (line  144), Count:     1  load_i               -> tLDSH_I 
!! Rule  13 (line  144), Count:     1  load_i               -> tLDSW_I 
!! Rule  14 (line  144), Count:     1  load_i               -> tLDUB_I 
!! Rule  15 (line  144), Count:     2  load_i               -> tLDUH_I 
!! Rule  16 (line  144), Count:     2  load_i               -> tLDUW_I 
!! Rule  17 (line  144), Count:     2  load_i               -> tLDX_I 
!! Rule  18 (line  144), Count:     1  load_i               -> tLDD_I 
!! Rule  20 (line  147), Count:     0  asi_load             -> tLDSBA_I 
!! Rule  21 (line  147), Count:     3  asi_load             -> tLDSHA_R 
!! Rule  23 (line  147), Count:     0  asi_load             -> tLDSWA_R 
!! Rule  24 (line  147), Count:     0  asi_load             -> tLDSWA_I 
!! Rule  25 (line  147), Count:     1  asi_load             -> tLDUBA_R 
!! Rule  26 (line  147), Count:     0  asi_load             -> tLDUBA_I 
!! Rule  27 (line  147), Count:     0  asi_load             -> tLDUHA_R 
!! Rule  28 (line  147), Count:     0  asi_load             -> tLDUHA_I 
!! Rule  29 (line  147), Count:     2  asi_load             -> tLDUWA_R 
!! Rule  30 (line  147), Count:     3  asi_load             -> tLDUWA_I 
!! Rule  31 (line  147), Count:     3  asi_load             -> tLDXA_R 
!! Rule  34 (line  147), Count:     1  asi_load             -> tLDDA_I 
!! Rule  35 (line  150), Count:    14  store                -> tSTB_R 
!! Rule  36 (line  150), Count:    20  store                -> tSTH_R 
!! Rule  37 (line  150), Count:    14  store                -> tSTW_R 
!! Rule  38 (line  150), Count:    19  store                -> tSTX_R 
!! Rule  41 (line  153), Count:     1  load_r               -> tLDSB_R 
!! Rule  42 (line  153), Count:     3  load_r               -> tLDSH_R 
!! Rule  43 (line  153), Count:     1  load_r               -> tLDSW_R 
!! Rule  44 (line  153), Count:     1  load_r               -> tLDUB_R 
!! Rule  45 (line  153), Count:     0  load_r               -> tLDUH_R 
!! Rule  46 (line  153), Count:     2  load_r               -> tLDUW_R 
!! Rule  47 (line  153), Count:     2  load_r               -> tLDX_R 
!! Rule  48 (line  153), Count:     0  load_r               -> tLDD_R 
!! Rule  49 (line  153), Count:     6  load_r               -> tLDF_R 
!! Rule  50 (line  153), Count:     2  load_r               -> tLDDF_R 
!! Rule  51 (line  156), Count:     2  alu                  -> tADD_R 
!! Rule  52 (line  156), Count:     4  alu                  -> tADD_I 
!! Rule  53 (line  156), Count:     3  alu                  -> tADDcc_R 
!! Rule  54 (line  156), Count:     4  alu                  -> tADDcc_I 
!! Rule  55 (line  156), Count:     1  alu                  -> tADDC_R 
!! Rule  56 (line  156), Count:     2  alu                  -> tADDC_I 
!! Rule  57 (line  156), Count:     2  alu                  -> tADDCcc_R 
!! Rule  58 (line  156), Count:     2  alu                  -> tADDCcc_I 
!! Rule  59 (line  156), Count:     1  alu                  -> tAND_R 
!! Rule  60 (line  156), Count:     1  alu                  -> tAND_I 
!! Rule  61 (line  156), Count:     4  alu                  -> tANDcc_R 
!! Rule  62 (line  156), Count:     2  alu                  -> tANDcc_I 
!! Rule  63 (line  156), Count:     2  alu                  -> tANDN_R 
!! Rule  64 (line  156), Count:     3  alu                  -> tANDN_I 
!! Rule  65 (line  156), Count:     0  alu                  -> tANDNcc_R 
!! Rule  66 (line  156), Count:     3  alu                  -> tANDNcc_I 
!! Rule  67 (line  156), Count:     1  alu                  -> tOR_R 
!! Rule  68 (line  156), Count:     0  alu                  -> tOR_I 
!! Rule  69 (line  156), Count:     7  alu                  -> tORcc_R 
!! Rule  70 (line  156), Count:     0  alu                  -> tORcc_I 
!! Rule  71 (line  156), Count:     3  alu                  -> tORN_R 
!! Rule  72 (line  156), Count:     4  alu                  -> tORN_I 
!! Rule  73 (line  156), Count:     2  alu                  -> tORNcc_R 
!! Rule  74 (line  156), Count:     2  alu                  -> tORNcc_I 
!! Rule  75 (line  156), Count:     4  alu                  -> tXOR_R 
!! Rule  76 (line  156), Count:     5  alu                  -> tXOR_I 
!! Rule  77 (line  156), Count:     0  alu                  -> tXORcc_R 
!! Rule  78 (line  156), Count:     2  alu                  -> tXORcc_I 
!! Rule  79 (line  156), Count:     3  alu                  -> tXNOR_R 
!! Rule  80 (line  156), Count:     0  alu                  -> tXNOR_I 
!! Rule  81 (line  156), Count:     3  alu                  -> tXNORcc_R 
!! Rule  82 (line  156), Count:     5  alu                  -> tXNORcc_I 
!! Rule  83 (line  156), Count:     2  alu                  -> tMOVcc_R 
!! Rule  84 (line  156), Count:     1  alu                  -> tMOVcc_I 
!! Rule  85 (line  156), Count:     4  alu                  -> tMOVR_R 
!! Rule  86 (line  156), Count:     2  alu                  -> tMOVR_I 
!! Rule  87 (line  156), Count:     2  alu                  -> tSLL_R 
!! Rule  88 (line  156), Count:     7  alu                  -> tSLL_I 
!! Rule  89 (line  156), Count:     7  alu                  -> tSRL_R 
!! Rule  90 (line  156), Count:     2  alu                  -> tSRL_I 
!! Rule  91 (line  156), Count:     3  alu                  -> tSRA_R 
!! Rule  92 (line  156), Count:     3  alu                  -> tSRA_I 
!! Rule  93 (line  156), Count:     2  alu                  -> tSLLX_R 
!! Rule  94 (line  156), Count:     1  alu                  -> tSLLX_I 
!! Rule  95 (line  156), Count:     4  alu                  -> tSRLX_R 
!! Rule  96 (line  156), Count:     6  alu                  -> tSRLX_I 
!! Rule  97 (line  156), Count:     3  alu                  -> tSRAX_R 
!! Rule  98 (line  156), Count:     6  alu                  -> tSRAX_I 
!! Rule  99 (line  156), Count:     2  alu                  -> tSUB_R 
!! Rule 100 (line  156), Count:     0  alu                  -> tSUB_I 
!! Rule 101 (line  156), Count:     3  alu                  -> tSUBcc_R 
!! Rule 102 (line  156), Count:     2  alu                  -> tSUBcc_I 
!! Rule 103 (line  156), Count:     6  alu                  -> tSUBC_R 
!! Rule 104 (line  156), Count:     5  alu                  -> tSUBC_I 
!! Rule 105 (line  156), Count:     3  alu                  -> tSUBCcc_R 
!! Rule 107 (line  156), Count:     4  alu                  -> tSUBCcc_I 
!! Rule 108 (line  159), Count:     6  fpop                 -> tSTF_R 
!! Rule 109 (line  159), Count:    16  fpop                 -> tSTF_I 
!! Rule 110 (line  159), Count:    10  fpop                 -> tSTDF_I 
!! Rule 111 (line  159), Count:     7  fpop                 -> tSTDF_R 
!! Rule 112 (line  159), Count:    10  fpop                 -> tFADDs 
!! Rule 113 (line  159), Count:     4  fpop                 -> tFSUBs 
!! Rule 114 (line  159), Count:     8  fpop                 -> tFMULs 
!! Rule 115 (line  159), Count:    11  fpop                 -> tFDIVs 
!! Rule 116 (line  159), Count:    12  fpop                 -> tFADDd 
!! Rule 117 (line  159), Count:    14  fpop                 -> tFSUBd 
!! Rule 118 (line  159), Count:    11  fpop                 -> tFMULd 
!! 
!!   257: Token mMETA0	Count = 4
!!   258: Token tLDSB_I	Count = 1
!!   259: Token tLDSH_I	Count = 2
!!   260: Token tLDSW_I	Count = 2
!!   261: Token tLDUB_I	Count = 2
!!   262: Token tLDUH_I	Count = 3
!!   263: Token tLDUW_I	Count = 3
!!   264: Token tLDX_I	Count = 3
!!   265: Token tLDD_I	Count = 2
!!   266: Token tLDSBA_R	Count = 0
!!   267: Token tLDSBA_I	Count = 1
!!   268: Token tLDSHA_R	Count = 4
!!   269: Token tLDSHA_I	Count = 0
!!   270: Token tLDSWA_R	Count = 1
!!   271: Token tLDSWA_I	Count = 1
!!   272: Token tLDUBA_R	Count = 2
!!   273: Token tLDUBA_I	Count = 1
!!   274: Token tLDUHA_R	Count = 1
!!   275: Token tLDUHA_I	Count = 1
!!   276: Token tLDUWA_R	Count = 3
!!   277: Token tLDUWA_I	Count = 4
!!   278: Token tLDXA_R	Count = 4
!!   279: Token tLDXA_I	Count = 0
!!   280: Token tLDDA_R	Count = 0
!!   281: Token tLDDA_I	Count = 2
!!   282: Token tSTB_R	Count = 15
!!   283: Token tSTH_R	Count = 21
!!   284: Token tSTW_R	Count = 15
!!   285: Token tSTX_R	Count = 20
!!   286: Token tSTF_R	Count = 17
!!   287: Token tSTDF_R	Count = 11
!!   288: Token tLDSB_R	Count = 2
!!   289: Token tLDSH_R	Count = 4
!!   290: Token tLDSW_R	Count = 2
!!   291: Token tLDUB_R	Count = 2
!!   292: Token tLDUH_R	Count = 1
!!   293: Token tLDUW_R	Count = 3
!!   294: Token tLDX_R	Count = 3
!!   295: Token tLDD_R	Count = 1
!!   296: Token tLDF_R	Count = 7
!!   297: Token tLDDF_R	Count = 3
!!   298: Token tADD_R	Count = 3
!!   299: Token tADD_I	Count = 5
!!   300: Token tADDcc_R	Count = 4
!!   301: Token tADDcc_I	Count = 5
!!   302: Token tADDC_R	Count = 2
!!   303: Token tADDC_I	Count = 3
!!   304: Token tADDCcc_R	Count = 3
!!   305: Token tADDCcc_I	Count = 3
!!   306: Token tAND_R	Count = 2
!!   307: Token tAND_I	Count = 2
!!   308: Token tANDcc_R	Count = 5
!!   309: Token tANDcc_I	Count = 3
!!   310: Token tANDN_R	Count = 3
!!   311: Token tANDN_I	Count = 4
!!   312: Token tANDNcc_R	Count = 1
!!   313: Token tANDNcc_I	Count = 4
!!   314: Token tOR_R	Count = 2
!!   315: Token tOR_I	Count = 1
!!   316: Token tORcc_R	Count = 8
!!   317: Token tORcc_I	Count = 1
!!   318: Token tORN_R	Count = 4
!!   319: Token tORN_I	Count = 5
!!   320: Token tORNcc_R	Count = 3
!!   321: Token tORNcc_I	Count = 3
!!   322: Token tXOR_R	Count = 5
!!   323: Token tXOR_I	Count = 6
!!   324: Token tXORcc_R	Count = 1
!!   325: Token tXORcc_I	Count = 3
!!   326: Token tXNOR_R	Count = 4
!!   327: Token tXNOR_I	Count = 1
!!   328: Token tXNORcc_R	Count = 4
!!   329: Token tXNORcc_I	Count = 6
!!   330: Token tMOVcc_R	Count = 3
!!   331: Token tMOVcc_I	Count = 2
!!   332: Token tMOVR_R	Count = 5
!!   333: Token tMOVR_I	Count = 3
!!   334: Token tSLL_R	Count = 3
!!   335: Token tSLL_I	Count = 8
!!   336: Token tSRL_R	Count = 8
!!   337: Token tSRL_I	Count = 3
!!   338: Token tSRA_R	Count = 4
!!   339: Token tSRA_I	Count = 4
!!   340: Token tSLLX_R	Count = 3
!!   341: Token tSLLX_I	Count = 2
!!   342: Token tSRLX_R	Count = 5
!!   343: Token tSRLX_I	Count = 7
!!   344: Token tSRAX_R	Count = 4
!!   345: Token tSRAX_I	Count = 7
!!   346: Token tSUB_R	Count = 3
!!   347: Token tSUB_I	Count = 1
!!   348: Token tSUBcc_R	Count = 4
!!   349: Token tSUBcc_I	Count = 3
!!   350: Token tSUBC_R	Count = 7
!!   351: Token tSUBC_I	Count = 6
!!   352: Token tSUBCcc_R	Count = 4
!!   353: Token tSUBCcc_I	Count = 5
!!   354: Token tSTF_I	Count = 17
!!   355: Token tSTDF_I	Count = 11
!!   356: Token tFADDs	Count = 11
!!   357: Token tFSUBs	Count = 5
!!   358: Token tFMULs	Count = 9
!!   359: Token tFDIVs	Count = 12
!!   360: Token tFADDd	Count = 13
!!   361: Token tFSUBd	Count = 15
!!   362: Token tFMULd	Count = 12
!!   363: Token tFDIVd	Count = 9
!! 
!! 
!! +++ finish +++

