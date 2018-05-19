// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3752.s
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
   random seed:	173309326
   Jal muld_mrbw.j:	
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
        setx  0x0000000000000220, %g1, %r9
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
        setx  0x66002053aea40d92, %g1, %r0
        setx  0x1ebd25c5dc96eac8, %g1, %r1
        setx  0xfcd340124bb86dba, %g1, %r2
        setx  0x97459a5dc59562a7, %g1, %r3
        setx  0x145d864130900688, %g1, %r4
        setx  0xf8de68326dc18e79, %g1, %r5
        setx  0xec336aa37695c74f, %g1, %r6
        setx  0x0c1764becf512611, %g1, %r7
        setx  0x72ca2973aaa9927d, %g1, %r10
        setx  0x6bd07274716c1a2b, %g1, %r11
        setx  0xdc91782763f33f6e, %g1, %r12
        setx  0xabb1290c1b943649, %g1, %r13
        setx  0x28e9bfa048e5e935, %g1, %r14
        setx  0x833c5adc2a8418a6, %g1, %r15
        setx  0xdec92c16d22755de, %g1, %r16
        setx  0xd2d256bcd35339d4, %g1, %r17
        setx  0xe559847c2bfde76a, %g1, %r18
        setx  0xd773222c53ca25b9, %g1, %r19
        setx  0x57844128f3924ea9, %g1, %r20
        setx  0x0d4b08c83211db16, %g1, %r21
        setx  0xb528c2ce22f36c57, %g1, %r22
        setx  0xec814bb802b1ac5c, %g1, %r23
        setx  0x228f6fece6687484, %g1, %r24
        setx  0xe22e5365910af72d, %g1, %r25
        setx  0xfaf2105c2d35d01c, %g1, %r26
        setx  0xdfbbebce2c31e6e2, %g1, %r27
        setx  0xfe8010481a0c8306, %g1, %r28
        setx  0x86e677f4b134425f, %g1, %r29
        setx  0x5fb58223fcb8fcee, %g1, %r30
        setx  0xb17fd95a081dbd4a, %g1, %r31
	.word 0xc4320009  ! 11: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xcc420009  ! 11: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x983a0009  ! 11: XNOR_R	xnor 	%r8, %r9, %r12
	.word 0x86422824  ! 11: ADDC_I	addc 	%r8, 0x0824, %r3
	.word 0x8eaa0009  ! 11: ANDNcc_R	andncc 	%r8, %r9, %r7
	.word 0xa852259c  ! 11: UMUL_I	umul 	%r8, 0x059c, %r20
	.word 0xc42a0009  ! 17: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe40a0009  ! 17: LDUB_R	ldub	[%r8 + %r9], %r18
	.word 0xba122390  ! 17: OR_I	or 	%r8, 0x0390, %r29
	.word 0x84120009  ! 17: OR_R	or 	%r8, %r9, %r2
	.word 0x84aa0009  ! 17: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0x86da0009  ! 17: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0x0
	.word 0xc82a0009  ! 28: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc65a0009  ! 28: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x8c120009  ! 28: OR_R	or 	%r8, %r9, %r6
	.word 0xb20a2d1c  ! 28: AND_I	and 	%r8, 0x0d1c, %r25
	.word 0x84a229f0  ! 28: SUBcc_I	subcc 	%r8, 0x09f0, %r2
	.word 0x885a0009  ! 28: SMUL_R	smul 	%r8, %r9, %r4
	.word 0xc82a0009  ! 35: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xd60a0009  ! 35: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0x85322001  ! 35: SRL_I	srl 	%r8, 0x0001, %r2
	.word 0xb4922eac  ! 35: ORcc_I	orcc 	%r8, 0x0eac, %r26
	.word 0x84022854  ! 35: ADD_I	add 	%r8, 0x0854, %r2
	.word 0x86d20009  ! 35: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xc6220009  ! 42: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xfe420009  ! 42: LDSW_R	ldsw	[%r8 + %r9], %r31
	.word 0x8f3a2001  ! 42: SRA_I	sra 	%r8, 0x0001, %r7
	.word 0xa13a0009  ! 42: SRA_R	sra 	%r8, %r9, %r16
	.word 0x861a29f4  ! 42: XOR_I	xor 	%r8, 0x09f4, %r3
	.word 0x8eda0009  ! 42: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xde220009  ! 51: STW_R	stw	%r15, [%r8 + %r9]
	.word 0xe24a0009  ! 51: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0x9b321009  ! 51: SRLX_R	srlx	%r8, %r9, %r13
	.word 0x88b2256c  ! 51: ORNcc_I	orncc 	%r8, 0x056c, %r4
	.word 0x82aa0009  ! 51: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x825a0009  ! 51: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc4220009  ! 57: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xc81a0009  ! 57: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8d643801  ! 57: MOVcc_I	<illegal instruction>
	.word 0x8b3a0009  ! 57: SRA_R	sra 	%r8, %r9, %r5
	.word 0x8d643801  ! 57: MOVcc_I	<illegal instruction>
	.word 0xa8d20009  ! 57: UMULcc_R	umulcc 	%r8, %r9, %r20
	.word 0xc2720009  ! 65: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xf65a0009  ! 65: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0x85643801  ! 65: MOVcc_I	<illegal instruction>
	.word 0x82b22d4c  ! 65: SUBCcc_I	orncc 	%r8, 0x0d4c, %r1
	.word 0x8b3a1009  ! 65: SRAX_R	srax	%r8, %r9, %r5
	.word 0xa45227e0  ! 65: UMUL_I	umul 	%r8, 0x07e0, %r18
	.word 0xed3a0009  ! 73: STDF_R	std	%f22, [%r9, %r8]
	.word 0xc2120009  ! 73: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8a1a0009  ! 73: XOR_R	xor 	%r8, %r9, %r5
	.word 0xb1782401  ! 73: MOVR_I	move	%r0, 0x9, %r24
	.word 0x82ba0009  ! 73: XNORcc_R	xnorcc 	%r8, %r9, %r1
	.word 0x832229c8  ! 73: MULScc_I	mulscc 	%r8, 0x09c8, %r1
	.word 0xc93a0009  ! 80: STDF_R	std	%f4, [%r9, %r8]
	.word 0xf60a0009  ! 80: LDUB_R	ldub	[%r8 + %r9], %r27
	.word 0x89641809  ! 80: MOVcc_R	<illegal instruction>
	.word 0xa81a0009  ! 80: XOR_R	xor 	%r8, %r9, %r20
	.word 0x8aa20009  ! 80: SUBcc_R	subcc 	%r8, %r9, %r5
	.word 0xbd220009  ! 80: MULScc_R	mulscc 	%r8, %r9, %r30
	.word 0x0
	.word 0xec320009  ! 90: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xe81a0009  ! 90: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x848a0009  ! 90: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0x82820009  ! 90: ADDcc_R	addcc 	%r8, %r9, %r1
	.word 0x84320009  ! 90: SUBC_R	orn 	%r8, %r9, %r2
	.word 0x825a0009  ! 90: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc4220009  ! 96: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xca4a0009  ! 96: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x828226e0  ! 96: ADDcc_I	addcc 	%r8, 0x06e0, %r1
	.word 0x88322264  ! 96: ORN_I	orn 	%r8, 0x0264, %r4
	.word 0x8e9a2ed4  ! 96: XORcc_I	xorcc 	%r8, 0x0ed4, %r7
	.word 0x865a0009  ! 96: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xfc320009  ! 102: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xda120009  ! 102: LDUH_R	lduh	[%r8 + %r9], %r13
	.word 0x8842245c  ! 102: ADDC_I	addc 	%r8, 0x045c, %r4
	.word 0x943a2008  ! 102: XNOR_I	xnor 	%r8, 0x0008, %r10
	.word 0x8f2a2001  ! 102: SLL_I	sll 	%r8, 0x0001, %r7
	.word 0x865a0009  ! 102: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xca720009  ! 108: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc01a0009  ! 108: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x849a0009  ! 108: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x89782401  ! 108: MOVR_I	move	%r0, 0x9, %r4
	.word 0x821a2c94  ! 108: XOR_I	xor 	%r8, 0x0c94, %r1
	.word 0x9a5a2d88  ! 108: SMUL_I	smul 	%r8, 0x0d88, %r13
	.word 0xcd3a0009  ! 114: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca5a0009  ! 114: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x86322704  ! 114: SUBC_I	orn 	%r8, 0x0704, %r3
	.word 0x9a1a0009  ! 114: XOR_R	xor 	%r8, %r9, %r13
	.word 0x8b2a2001  ! 114: SLL_I	sll 	%r8, 0x0001, %r5
	.word 0x844a0009  ! 114: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xc8320009  ! 120: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xee5a0009  ! 120: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xa2ba26cc  ! 120: XNORcc_I	xnorcc 	%r8, 0x06cc, %r17
	.word 0xa3782401  ! 120: MOVR_I	move	%r0, 0xfffffef0, %r17
	.word 0x9f3a3001  ! 120: SRAX_I	srax	%r8, 0x0001, %r15
	.word 0xa32225bc  ! 120: MULScc_I	mulscc 	%r8, 0x05bc, %r17
	.word 0xce220009  ! 127: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc40a0009  ! 127: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x8c820009  ! 127: ADDcc_R	addcc 	%r8, %r9, %r6
	.word 0x8eb20009  ! 127: ORNcc_R	orncc 	%r8, %r9, %r7
	.word 0x8ea22da4  ! 127: SUBcc_I	subcc 	%r8, 0x0da4, %r7
	.word 0x8c5a2da4  ! 127: SMUL_I	smul 	%r8, 0x0da4, %r6
	.word 0xfa220009  ! 133: STW_R	stw	%r29, [%r8 + %r9]
	.word 0xc84a0009  ! 133: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x94b20009  ! 133: SUBCcc_R	orncc 	%r8, %r9, %r10
	.word 0xb6120009  ! 133: OR_R	or 	%r8, %r9, %r27
	.word 0x843224a4  ! 133: SUBC_I	orn 	%r8, 0x04a4, %r2
	.word 0xa0d20009  ! 133: UMULcc_R	umulcc 	%r8, %r9, %r16
	.word 0x0
	.word 0xc42a0009  ! 145: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc64a0009  ! 145: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8c922d68  ! 145: ORcc_I	orcc 	%r8, 0x0d68, %r6
	.word 0x860a0009  ! 145: AND_R	and 	%r8, %r9, %r3
	.word 0xb80a0009  ! 145: AND_R	and 	%r8, %r9, %r28
	.word 0x8c520009  ! 145: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc42a0009  ! 152: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc1a0009  ! 152: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xb6a20009  ! 152: SUBcc_R	subcc 	%r8, %r9, %r27
	.word 0x83322001  ! 152: SRL_I	srl 	%r8, 0x0001, %r1
	.word 0xad3a2001  ! 152: SRA_I	sra 	%r8, 0x0001, %r22
	.word 0x945a0009  ! 152: SMUL_R	smul 	%r8, %r9, %r10
	.word 0xcb3a0009  ! 159: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc2020009  ! 159: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0x8a3a0009  ! 159: XNOR_R	xnor 	%r8, %r9, %r5
	.word 0xb6aa0009  ! 159: ANDNcc_R	andncc 	%r8, %r9, %r27
	.word 0x8a2a0009  ! 159: ANDN_R	andn 	%r8, %r9, %r5
	.word 0x844a0009  ! 159: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xc6720009  ! 165: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 165: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x9b322001  ! 165: SRL_I	srl 	%r8, 0x0001, %r13
	.word 0xa61a0009  ! 165: XOR_R	xor 	%r8, %r9, %r19
	.word 0x862a2ee4  ! 165: ANDN_I	andn 	%r8, 0x0ee4, %r3
	.word 0x88d22020  ! 165: UMULcc_I	umulcc 	%r8, 0x0020, %r4
	.word 0xcc2a0009  ! 173: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce420009  ! 173: LDSW_R	ldsw	[%r8 + %r9], %r7
	.word 0xb61a0009  ! 173: XOR_R	xor 	%r8, %r9, %r27
	.word 0xa6420009  ! 173: ADDC_R	addc 	%r8, %r9, %r19
	.word 0x8ab223a0  ! 173: SUBCcc_I	orncc 	%r8, 0x03a0, %r5
	.word 0xb4d22c08  ! 173: UMULcc_I	umulcc 	%r8, 0x0c08, %r26
	.word 0xcd220009  ! 181: STF_R	st	%f6, [%r9, %r8]
	.word 0xc01a0009  ! 181: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x89782401  ! 181: MOVR_I	move	%r0, 0x401, %r4
	.word 0x88222250  ! 181: SUB_I	sub 	%r8, 0x0250, %r4
	.word 0x83643801  ! 181: MOVcc_I	<illegal instruction>
	.word 0xa6520009  ! 181: UMUL_R	umul 	%r8, %r9, %r19
	.word 0xeb220009  ! 188: STF_R	st	%f21, [%r9, %r8]
	.word 0xc8120009  ! 188: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xb2322c5c  ! 188: ORN_I	orn 	%r8, 0x0c5c, %r25
	.word 0xb232277c  ! 188: SUBC_I	orn 	%r8, 0x077c, %r25
	.word 0x8b3a3001  ! 188: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x8b220009  ! 188: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0xe02a0009  ! 195: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xcc1a0009  ! 195: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xa022214c  ! 195: SUB_I	sub 	%r8, 0x014c, %r16
	.word 0x893a3001  ! 195: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0xbc9a0009  ! 195: XORcc_R	xorcc 	%r8, %r9, %r30
	.word 0x89220009  ! 195: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xcb3a0009  ! 201: STDF_R	std	%f5, [%r9, %r8]
	.word 0xd44a0009  ! 201: LDSB_R	ldsb	[%r8 + %r9], %r10
	.word 0x84320009  ! 201: SUBC_R	orn 	%r8, %r9, %r2
	.word 0x892a2001  ! 201: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0xa33a3001  ! 201: SRAX_I	srax	%r8, 0x0001, %r17
	.word 0x88522af4  ! 201: UMUL_I	umul 	%r8, 0x0af4, %r4
	.word 0xce220009  ! 207: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xd64a0009  ! 207: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x9b2a0009  ! 207: SLL_R	sll 	%r8, %r9, %r13
	.word 0xb42a0009  ! 207: ANDN_R	andn 	%r8, %r9, %r26
	.word 0x8eb20009  ! 207: SUBCcc_R	orncc 	%r8, %r9, %r7
	.word 0xb24a0009  ! 207: MULX_R	mulx 	%r8, %r9, %r25
	.word 0xcc320009  ! 213: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xde120009  ! 213: LDUH_R	lduh	[%r8 + %r9], %r15
	.word 0xb69a0009  ! 213: XORcc_R	xorcc 	%r8, %r9, %r27
	.word 0xbb2a0009  ! 213: SLL_R	sll 	%r8, %r9, %r29
	.word 0x89782401  ! 213: MOVR_I	move	%r0, 0x9, %r4
	.word 0x8ada210c  ! 213: SMULcc_I	smulcc 	%r8, 0x010c, %r5
	.word 0xe4320009  ! 223: STH_R	sth	%r18, [%r8 + %r9]
	.word 0xe4420009  ! 223: LDSW_R	ldsw	[%r8 + %r9], %r18
	.word 0x892a0009  ! 223: SLL_R	sll 	%r8, %r9, %r4
	.word 0xa6c227b4  ! 223: ADDCcc_I	addccc 	%r8, 0x07b4, %r19
	.word 0x8e9a0009  ! 223: XORcc_R	xorcc 	%r8, %r9, %r7
	.word 0x8c4a2b5c  ! 223: MULX_I	mulx 	%r8, 0x0b5c, %r6
	.word 0xc8720009  ! 229: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xca420009  ! 229: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x83782401  ! 229: MOVR_I	move	%r0, 0x401, %r1
	.word 0x8b641809  ! 229: MOVcc_R	<illegal instruction>
	.word 0x893a3001  ! 229: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0xa4522c1c  ! 229: UMUL_I	umul 	%r8, 0x0c1c, %r18
	.word 0xc8720009  ! 235: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xcc020009  ! 235: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x8c8a0009  ! 235: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0x86122bac  ! 235: OR_I	or 	%r8, 0x0bac, %r3
	.word 0xb93a1009  ! 235: SRAX_R	srax	%r8, %r9, %r28
	.word 0x85220009  ! 235: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xec320009  ! 241: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xca4a0009  ! 241: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x9f2a2001  ! 241: SLL_I	sll 	%r8, 0x0001, %r15
	.word 0x8a922d0c  ! 241: ORcc_I	orcc 	%r8, 0x0d0c, %r5
	.word 0x8e9229f0  ! 241: ORcc_I	orcc 	%r8, 0x09f0, %r7
	.word 0xb0d227fc  ! 241: UMULcc_I	umulcc 	%r8, 0x07fc, %r24
	.word 0xcb3a0009  ! 247: STDF_R	std	%f5, [%r9, %r8]
	.word 0xfc5a0009  ! 247: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xa4322298  ! 247: ORN_I	orn 	%r8, 0x0298, %r18
	.word 0x88a22304  ! 247: SUBcc_I	subcc 	%r8, 0x0304, %r4
	.word 0xba4229c0  ! 247: ADDC_I	addc 	%r8, 0x09c0, %r29
	.word 0x8cd22f30  ! 247: UMULcc_I	umulcc 	%r8, 0x0f30, %r6
	.word 0xc8220009  ! 253: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xcc020009  ! 253: LDUW_R	lduw	[%r8 + %r9], %r6
	.word 0x9aba0009  ! 253: XNORcc_R	xnorcc 	%r8, %r9, %r13
	.word 0x849a26a0  ! 253: XORcc_I	xorcc 	%r8, 0x06a0, %r2
	.word 0x89780409  ! 253: MOVR_R	move	%r0, %r9, %r4
	.word 0x8e5a2a58  ! 253: SMUL_I	smul 	%r8, 0x0a58, %r7
	.word 0xca320009  ! 259: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc2120009  ! 259: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8c322864  ! 259: SUBC_I	orn 	%r8, 0x0864, %r6
	.word 0x88aa0009  ! 259: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0x82ba0009  ! 259: XNORcc_R	xnorcc 	%r8, %r9, %r1
	.word 0xac5a2d7c  ! 259: SMUL_I	smul 	%r8, 0x0d7c, %r22
	.word 0xf2320009  ! 267: STH_R	sth	%r25, [%r8 + %r9]
	.word 0xf0120009  ! 267: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0x8c920009  ! 267: ORcc_R	orcc 	%r8, %r9, %r6
	.word 0x88022d80  ! 267: ADD_I	add 	%r8, 0x0d80, %r4
	.word 0x8e322bb0  ! 267: SUBC_I	orn 	%r8, 0x0bb0, %r7
	.word 0x8a5a0009  ! 267: SMUL_R	smul 	%r8, %r9, %r5
	.word 0xcc220009  ! 274: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xcc520009  ! 274: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x9e020009  ! 274: ADD_R	add 	%r8, %r9, %r15
	.word 0x88ba0009  ! 274: XNORcc_R	xnorcc 	%r8, %r9, %r4
	.word 0x8e8a28e8  ! 274: ANDcc_I	andcc 	%r8, 0x08e8, %r7
	.word 0x845a27b8  ! 274: SMUL_I	smul 	%r8, 0x07b8, %r2
	.word 0xfc320009  ! 280: STH_R	sth	%r30, [%r8 + %r9]
	.word 0xc81a0009  ! 280: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x83643801  ! 280: MOVcc_I	<illegal instruction>
	.word 0x86822494  ! 280: ADDcc_I	addcc 	%r8, 0x0494, %r3
	.word 0x883a0009  ! 280: XNOR_R	xnor 	%r8, %r9, %r4
	.word 0x84d223e4  ! 280: UMULcc_I	umulcc 	%r8, 0x03e4, %r2
	.word 0xc7220009  ! 286: STF_R	st	%f3, [%r9, %r8]
	.word 0xca420009  ! 286: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8c0a0009  ! 286: AND_R	and 	%r8, %r9, %r6
	.word 0x8caa2744  ! 286: ANDNcc_I	andncc 	%r8, 0x0744, %r6
	.word 0x8e320009  ! 286: ORN_R	orn 	%r8, %r9, %r7
	.word 0x8a520009  ! 286: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xe4720009  ! 293: STX_R	stx	%r18, [%r8 + %r9]
	.word 0xc25a0009  ! 293: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0x8a8a0009  ! 293: ANDcc_R	andcc 	%r8, %r9, %r5
	.word 0x8c320009  ! 293: SUBC_R	orn 	%r8, %r9, %r6
	.word 0x84220009  ! 293: SUB_R	sub 	%r8, %r9, %r2
	.word 0x8cd22130  ! 293: UMULcc_I	umulcc 	%r8, 0x0130, %r6
	.word 0x0
	.word 0xeb3a0009  ! 301: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc01a0009  ! 301: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x87641809  ! 301: MOVcc_R	<illegal instruction>
	.word 0xae1a2484  ! 301: XOR_I	xor 	%r8, 0x0484, %r23
	.word 0xa5643801  ! 301: MOVcc_I	<illegal instruction>
	.word 0x8c520009  ! 301: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xfd220009  ! 308: STF_R	st	%f30, [%r9, %r8]
	.word 0xe25a0009  ! 308: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0xbc922318  ! 308: ORcc_I	orcc 	%r8, 0x0318, %r30
	.word 0x843a2e30  ! 308: XNOR_I	xnor 	%r8, 0x0e30, %r2
	.word 0xbb3a0009  ! 308: SRA_R	sra 	%r8, %r9, %r29
	.word 0xb64a2788  ! 308: MULX_I	mulx 	%r8, 0x0788, %r27
	.word 0xe1220009  ! 314: STF_R	st	%f16, [%r9, %r8]
	.word 0xe81a0009  ! 314: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x8c020009  ! 314: ADD_R	add 	%r8, %r9, %r6
	.word 0x8f3a1009  ! 314: SRAX_R	srax	%r8, %r9, %r7
	.word 0x86822180  ! 314: ADDcc_I	addcc 	%r8, 0x0180, %r3
	.word 0x864a21cc  ! 314: MULX_I	mulx 	%r8, 0x01cc, %r3
	.word 0xca220009  ! 322: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc2520009  ! 322: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x8aba212c  ! 322: XNORcc_I	xnorcc 	%r8, 0x012c, %r5
	.word 0x8e9a2ad8  ! 322: XORcc_I	xorcc 	%r8, 0x0ad8, %r7
	.word 0x8c22208c  ! 322: SUB_I	sub 	%r8, 0x008c, %r6
	.word 0xaed226e4  ! 322: UMULcc_I	umulcc 	%r8, 0x06e4, %r23
	.word 0xc4720009  ! 329: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xea5a0009  ! 329: LDX_R	ldx	[%r8 + %r9], %r21
	.word 0x94320009  ! 329: ORN_R	orn 	%r8, %r9, %r10
	.word 0x962a0009  ! 329: ANDN_R	andn 	%r8, %r9, %r11
	.word 0x8b2a3001  ! 329: SLLX_I	sllx	%r8, 0x0001, %r5
	.word 0x86d20009  ! 329: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xd93a0009  ! 335: STDF_R	std	%f12, [%r9, %r8]
	.word 0xfc1a0009  ! 335: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0x86922418  ! 335: ORcc_I	orcc 	%r8, 0x0418, %r3
	.word 0x83321009  ! 335: SRLX_R	srlx	%r8, %r9, %r1
	.word 0x8a1a0009  ! 335: XOR_R	xor 	%r8, %r9, %r5
	.word 0x82da25d4  ! 335: SMULcc_I	smulcc 	%r8, 0x05d4, %r1
	.word 0xfd3a0009  ! 342: STDF_R	std	%f30, [%r9, %r8]
	.word 0xc81a0009  ! 342: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x9a22242c  ! 342: SUB_I	sub 	%r8, 0x042c, %r13
	.word 0xbe922f04  ! 342: ORcc_I	orcc 	%r8, 0x0f04, %r31
	.word 0x8ab20009  ! 342: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0x865a0009  ! 342: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x0
	.word 0xf02a0009  ! 352: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xce520009  ! 352: LDSH_R	ldsh	[%r8 + %r9], %r7
	.word 0x889a2b58  ! 352: XORcc_I	xorcc 	%r8, 0x0b58, %r4
	.word 0x8ab20009  ! 352: SUBCcc_R	orncc 	%r8, %r9, %r5
	.word 0xac0a0009  ! 352: AND_R	and 	%r8, %r9, %r22
	.word 0xa4da0009  ! 352: SMULcc_R	smulcc 	%r8, %r9, %r18
	.word 0xcd3a0009  ! 358: STDF_R	std	%f6, [%r9, %r8]
	.word 0xca420009  ! 358: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x8b322001  ! 358: SRL_I	srl 	%r8, 0x0001, %r5
	.word 0x8c020009  ! 358: ADD_R	add 	%r8, %r9, %r6
	.word 0x8ec20009  ! 358: ADDCcc_R	addccc 	%r8, %r9, %r7
	.word 0x98d22f2c  ! 358: UMULcc_I	umulcc 	%r8, 0x0f2c, %r12
	.word 0xca320009  ! 364: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc2120009  ! 364: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xb0422e38  ! 364: ADDC_I	addc 	%r8, 0x0e38, %r24
	.word 0x98020009  ! 364: ADD_R	add 	%r8, %r9, %r12
	.word 0x869a2490  ! 364: XORcc_I	xorcc 	%r8, 0x0490, %r3
	.word 0x8eda0009  ! 364: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc2320009  ! 370: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xcc1a0009  ! 370: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x868a25bc  ! 370: ANDcc_I	andcc 	%r8, 0x05bc, %r3
	.word 0x8a9a0009  ! 370: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x82c225d8  ! 370: ADDCcc_I	addccc 	%r8, 0x05d8, %r1
	.word 0xa05a2cec  ! 370: SMUL_I	smul 	%r8, 0x0cec, %r16
	.word 0xca720009  ! 376: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca420009  ! 376: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0xb6322c38  ! 376: ORN_I	orn 	%r8, 0x0c38, %r27
	.word 0x8a822898  ! 376: ADDcc_I	addcc 	%r8, 0x0898, %r5
	.word 0x88322a9c  ! 376: ORN_I	orn 	%r8, 0x0a9c, %r4
	.word 0xaf222a18  ! 376: MULScc_I	mulscc 	%r8, 0x0a18, %r23
	.word 0xc42a0009  ! 382: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc6120009  ! 382: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x8232214c  ! 382: ORN_I	orn 	%r8, 0x014c, %r1
	.word 0x841a2850  ! 382: XOR_I	xor 	%r8, 0x0850, %r2
	.word 0x8ec227bc  ! 382: ADDCcc_I	addccc 	%r8, 0x07bc, %r7
	.word 0x8ed20009  ! 382: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xc82a0009  ! 388: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xce0a0009  ! 388: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8cb22db0  ! 388: ORNcc_I	orncc 	%r8, 0x0db0, %r6
	.word 0xbe2a0009  ! 388: ANDN_R	andn 	%r8, %r9, %r31
	.word 0x8f3a0009  ! 388: SRA_R	sra 	%r8, %r9, %r7
	.word 0x82d20009  ! 388: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xc33a0009  ! 397: STDF_R	std	%f1, [%r9, %r8]
	.word 0xec020009  ! 397: LDUW_R	lduw	[%r8 + %r9], %r22
	.word 0x8a3a22b0  ! 397: XNOR_I	xnor 	%r8, 0x02b0, %r5
	.word 0xaa9a0009  ! 397: XORcc_R	xorcc 	%r8, %r9, %r21
	.word 0x84c22790  ! 397: ADDCcc_I	addccc 	%r8, 0x0790, %r2
	.word 0x88da22d0  ! 397: SMULcc_I	smulcc 	%r8, 0x02d0, %r4
	.word 0xe3220009  ! 403: STF_R	st	%f17, [%r9, %r8]
	.word 0xca0a0009  ! 403: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x8a322174  ! 403: ORN_I	orn 	%r8, 0x0174, %r5
	.word 0x8f322001  ! 403: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0x86c22e28  ! 403: ADDCcc_I	addccc 	%r8, 0x0e28, %r3
	.word 0x885229d4  ! 403: UMUL_I	umul 	%r8, 0x09d4, %r4
	.word 0xca320009  ! 411: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xce0a0009  ! 411: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8cb20009  ! 411: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0x84aa0009  ! 411: ANDNcc_R	andncc 	%r8, %r9, %r2
	.word 0xb8b22cbc  ! 411: SUBCcc_I	orncc 	%r8, 0x0cbc, %r28
	.word 0x84520009  ! 411: UMUL_R	umul 	%r8, %r9, %r2
	.word 0xed220009  ! 417: STF_R	st	%f22, [%r9, %r8]
	.word 0xe8120009  ! 417: LDUH_R	lduh	[%r8 + %r9], %r20
	.word 0x84aa21bc  ! 417: ANDNcc_I	andncc 	%r8, 0x01bc, %r2
	.word 0x8e422b58  ! 417: ADDC_I	addc 	%r8, 0x0b58, %r7
	.word 0x8b3a3001  ! 417: SRAX_I	srax	%r8, 0x0001, %r5
	.word 0x885a2efc  ! 417: SMUL_I	smul 	%r8, 0x0efc, %r4
	.word 0xc2720009  ! 423: STX_R	stx	%r1, [%r8 + %r9]
	.word 0xcc520009  ! 423: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8d2a1009  ! 423: SLLX_R	sllx	%r8, %r9, %r6
	.word 0x829221b8  ! 423: ORcc_I	orcc 	%r8, 0x01b8, %r1
	.word 0xa4822de4  ! 423: ADDcc_I	addcc 	%r8, 0x0de4, %r18
	.word 0x82522d3c  ! 423: UMUL_I	umul 	%r8, 0x0d3c, %r1
	.word 0xce2a0009  ! 431: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xdc520009  ! 431: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x84920009  ! 431: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0x892a1009  ! 431: SLLX_R	sllx	%r8, %r9, %r4
	.word 0x8b780409  ! 431: MOVR_R	move	%r0, %r9, %r5
	.word 0x82da0009  ! 431: SMULcc_R	smulcc 	%r8, %r9, %r1
	.word 0xca720009  ! 437: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xc45a0009  ! 437: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xb72a3001  ! 437: SLLX_I	sllx	%r8, 0x0001, %r27
	.word 0x8d2a0009  ! 437: SLL_R	sll 	%r8, %r9, %r6
	.word 0xb80a0009  ! 437: AND_R	and 	%r8, %r9, %r28
	.word 0x87220009  ! 437: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0xcf220009  ! 445: STF_R	st	%f7, [%r9, %r8]
	.word 0xc25a0009  ! 445: LDX_R	ldx	[%r8 + %r9], %r1
	.word 0xa4ba2330  ! 445: XNORcc_I	xnorcc 	%r8, 0x0330, %r18
	.word 0x883a2648  ! 445: XNOR_I	xnor 	%r8, 0x0648, %r4
	.word 0x8e0a2438  ! 445: AND_I	and 	%r8, 0x0438, %r7
	.word 0x94d20009  ! 445: UMULcc_R	umulcc 	%r8, %r9, %r10
	.word 0xc62a0009  ! 451: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc44a0009  ! 451: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0xb3641809  ! 451: MOVcc_R	<illegal instruction>
	.word 0x8b641809  ! 451: MOVcc_R	<illegal instruction>
	.word 0xad322001  ! 451: SRL_I	srl 	%r8, 0x0001, %r22
	.word 0x9c5a0009  ! 451: SMUL_R	smul 	%r8, %r9, %r14
	.word 0xf22a0009  ! 458: STB_R	stb	%r25, [%r8 + %r9]
	.word 0xe4520009  ! 458: LDSH_R	ldsh	[%r8 + %r9], %r18
	.word 0x849a2af8  ! 458: XORcc_I	xorcc 	%r8, 0x0af8, %r2
	.word 0x8a920009  ! 458: ORcc_R	orcc 	%r8, %r9, %r5
	.word 0x8a2228e4  ! 458: SUB_I	sub 	%r8, 0x08e4, %r5
	.word 0x8a522aa8  ! 458: UMUL_I	umul 	%r8, 0x0aa8, %r5
	.word 0xc4220009  ! 464: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xcc0a0009  ! 464: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8a220009  ! 464: SUB_R	sub 	%r8, %r9, %r5
	.word 0xb00a0009  ! 464: AND_R	and 	%r8, %r9, %r24
	.word 0x840a2d50  ! 464: AND_I	and 	%r8, 0x0d50, %r2
	.word 0x8c4a0009  ! 464: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xe2720009  ! 470: STX_R	stx	%r17, [%r8 + %r9]
	.word 0xdc520009  ! 470: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x872a1009  ! 470: SLLX_R	sllx	%r8, %r9, %r3
	.word 0x8c822c58  ! 470: ADDcc_I	addcc 	%r8, 0x0c58, %r6
	.word 0x86b225e4  ! 470: SUBCcc_I	orncc 	%r8, 0x05e4, %r3
	.word 0x82da2b80  ! 470: SMULcc_I	smulcc 	%r8, 0x0b80, %r1
	.word 0xc62a0009  ! 476: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe01a0009  ! 476: LDD_R	ldd	[%r8 + %r9], %r16
	.word 0x8e020009  ! 476: ADD_R	add 	%r8, %r9, %r7
	.word 0x82922850  ! 476: ORcc_I	orcc 	%r8, 0x0850, %r1
	.word 0xb6420009  ! 476: ADDC_R	addc 	%r8, %r9, %r27
	.word 0x85222268  ! 476: MULScc_I	mulscc 	%r8, 0x0268, %r2
	.word 0x0
	.word 0xc62a0009  ! 483: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xca520009  ! 483: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8c8a2f98  ! 483: ANDcc_I	andcc 	%r8, 0x0f98, %r6
	.word 0x8eb22510  ! 483: ORNcc_I	orncc 	%r8, 0x0510, %r7
	.word 0x823a2584  ! 483: XNOR_I	xnor 	%r8, 0x0584, %r1
	.word 0x825a2d40  ! 483: SMUL_I	smul 	%r8, 0x0d40, %r1
	.word 0xcc2a0009  ! 489: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xcc0a0009  ! 489: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xb5780409  ! 489: MOVR_R	move	%r0, %r9, %r26
	.word 0x8a120009  ! 489: OR_R	or 	%r8, %r9, %r5
	.word 0xae822c2c  ! 489: ADDcc_I	addcc 	%r8, 0x0c2c, %r23
	.word 0x84d22a60  ! 489: UMULcc_I	umulcc 	%r8, 0x0a60, %r2
	.word 0xc3220009  ! 495: STF_R	st	%f1, [%r9, %r8]
	.word 0xce4a0009  ! 495: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x98b228e0  ! 495: ORNcc_I	orncc 	%r8, 0x08e0, %r12
	.word 0xa6220009  ! 495: SUB_R	sub 	%r8, %r9, %r19
	.word 0x8c42281c  ! 495: ADDC_I	addc 	%r8, 0x081c, %r6
	.word 0x8b220009  ! 495: MULScc_R	mulscc 	%r8, %r9, %r5
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000220, %g1, %r9
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
        setx  0x66002053aea40d92, %g1, %r0
        setx  0x1ebd25c5dc96eac8, %g1, %r1
        setx  0xfcd340124bb86dba, %g1, %r2
        setx  0x97459a5dc59562a7, %g1, %r3
        setx  0x145d864130900688, %g1, %r4
        setx  0xf8de68326dc18e79, %g1, %r5
        setx  0xec336aa37695c74f, %g1, %r6
        setx  0x0c1764becf512611, %g1, %r7
        setx  0x72ca2973aaa9927d, %g1, %r10
        setx  0x6bd07274716c1a2b, %g1, %r11
        setx  0xdc91782763f33f6e, %g1, %r12
        setx  0xabb1290c1b943649, %g1, %r13
        setx  0x28e9bfa048e5e935, %g1, %r14
        setx  0x833c5adc2a8418a6, %g1, %r15
        setx  0xdec92c16d22755de, %g1, %r16
        setx  0xd2d256bcd35339d4, %g1, %r17
        setx  0xe559847c2bfde76a, %g1, %r18
        setx  0xd773222c53ca25b9, %g1, %r19
        setx  0x57844128f3924ea9, %g1, %r20
        setx  0x0d4b08c83211db16, %g1, %r21
        setx  0xb528c2ce22f36c57, %g1, %r22
        setx  0xec814bb802b1ac5c, %g1, %r23
        setx  0x228f6fece6687484, %g1, %r24
        setx  0xe22e5365910af72d, %g1, %r25
        setx  0xfaf2105c2d35d01c, %g1, %r26
        setx  0xdfbbebce2c31e6e2, %g1, %r27
        setx  0xfe8010481a0c8306, %g1, %r28
        setx  0x86e677f4b134425f, %g1, %r29
        setx  0x5fb58223fcb8fcee, %g1, %r30
        setx  0xb17fd95a081dbd4a, %g1, %r31
	.word 0x864a29c0  ! 5: MULX_I	mulx 	%r8, 0x09c0, %r3
	.word 0xa4da2660  ! 18: SMULcc_I	smulcc 	%r8, 0x0660, %r18
	.word 0x0
	.word 0x9e522c88  ! 20: UMUL_I	umul 	%r8, 0x0c88, %r15
	.word 0x83220009  ! 21: MULScc_R	mulscc 	%r8, %r9, %r1
	.word 0xba522bc8  ! 22: UMUL_I	umul 	%r8, 0x0bc8, %r29
	.word 0xaf220009  ! 29: MULScc_R	mulscc 	%r8, %r9, %r23
	.word 0x88520009  ! 36: UMUL_R	umul 	%r8, %r9, %r4
	.word 0x86d20009  ! 43: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0xbada0009  ! 44: SMULcc_R	smulcc 	%r8, %r9, %r29
	.word 0x884a0009  ! 45: MULX_R	mulx 	%r8, %r9, %r4
	.word 0x82520009  ! 58: UMUL_R	umul 	%r8, %r9, %r1
	.word 0x8f220009  ! 59: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x88da0009  ! 66: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0xa8da22a0  ! 67: SMULcc_I	smulcc 	%r8, 0x02a0, %r20
	.word 0xb4d20009  ! 74: UMULcc_R	umulcc 	%r8, %r9, %r26
	.word 0x85220009  ! 81: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0x885a25f4  ! 82: SMUL_I	smul 	%r8, 0x05f4, %r4
	.word 0x0
	.word 0x845a228c  ! 84: SMUL_I	smul 	%r8, 0x028c, %r2
	.word 0x865224c0  ! 121: UMUL_I	umul 	%r8, 0x04c0, %r3
	.word 0xaf220009  ! 134: MULScc_R	mulscc 	%r8, %r9, %r23
	.word 0x8e5a2230  ! 135: SMUL_I	smul 	%r8, 0x0230, %r7
	.word 0x0
	.word 0xb04a26d4  ! 137: MULX_I	mulx 	%r8, 0x06d4, %r24
	.word 0x885229b0  ! 138: UMUL_I	umul 	%r8, 0x09b0, %r4
	.word 0x8a5a2254  ! 139: SMUL_I	smul 	%r8, 0x0254, %r5
	.word 0x82d2234c  ! 146: UMULcc_I	umulcc 	%r8, 0x034c, %r1
	.word 0xb2522434  ! 153: UMUL_I	umul 	%r8, 0x0434, %r25
	.word 0x88d20009  ! 166: UMULcc_R	umulcc 	%r8, %r9, %r4
	.word 0x8c4a2938  ! 167: MULX_I	mulx 	%r8, 0x0938, %r6
	.word 0x86d20009  ! 174: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0x9c4a0009  ! 175: MULX_R	mulx 	%r8, %r9, %r14
	.word 0x864a2400  ! 182: MULX_I	mulx 	%r8, 0x0400, %r3
	.word 0x8f222ea4  ! 189: MULScc_I	mulscc 	%r8, 0x0ea4, %r7
	.word 0xad222bcc  ! 214: MULScc_I	mulscc 	%r8, 0x0bcc, %r22
	.word 0xa4da26dc  ! 215: SMULcc_I	smulcc 	%r8, 0x06dc, %r18
	.word 0x985a0009  ! 216: SMUL_R	smul 	%r8, %r9, %r12
	.word 0xb1222fc8  ! 217: MULScc_I	mulscc 	%r8, 0x0fc8, %r24
	.word 0x9ada276c  ! 260: SMULcc_I	smulcc 	%r8, 0x076c, %r13
	.word 0xba5a0009  ! 261: SMUL_R	smul 	%r8, %r9, %r29
	.word 0x845a0009  ! 268: SMUL_R	smul 	%r8, %r9, %r2
	.word 0x8cda0009  ! 287: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0x0
	.word 0x98d22d9c  ! 295: UMULcc_I	umulcc 	%r8, 0x0d9c, %r12
	.word 0xb1220009  ! 302: MULScc_R	mulscc 	%r8, %r9, %r24
	.word 0xb05a0009  ! 315: SMUL_R	smul 	%r8, %r9, %r24
	.word 0x86da269c  ! 316: SMULcc_I	smulcc 	%r8, 0x069c, %r3
	.word 0xa2da0009  ! 323: SMULcc_R	smulcc 	%r8, %r9, %r17
	.word 0x88d220bc  ! 336: UMULcc_I	umulcc 	%r8, 0x00bc, %r4
	.word 0x0
	.word 0xa8520009  ! 344: UMUL_R	umul 	%r8, %r9, %r20
	.word 0x82da2788  ! 345: SMULcc_I	smulcc 	%r8, 0x0788, %r1
	.word 0x964a0009  ! 346: MULX_R	mulx 	%r8, %r9, %r11
	.word 0x87220009  ! 389: MULScc_R	mulscc 	%r8, %r9, %r3
	.word 0x825a22c4  ! 390: SMUL_I	smul 	%r8, 0x02c4, %r1
	.word 0x88da0009  ! 391: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0x8f220009  ! 404: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x8ad20009  ! 405: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0x985225c8  ! 424: UMUL_I	umul 	%r8, 0x05c8, %r12
	.word 0xb0520009  ! 425: UMUL_R	umul 	%r8, %r9, %r24
	.word 0xb0da0009  ! 438: SMULcc_R	smulcc 	%r8, %r9, %r24
	.word 0x824a20c4  ! 439: MULX_I	mulx 	%r8, 0x00c4, %r1
	.word 0xbb222350  ! 452: MULScc_I	mulscc 	%r8, 0x0350, %r29
	.word 0x0
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000220, %g1, %r9
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
        setx  0x66002053aea40d92, %g1, %r0
        setx  0x1ebd25c5dc96eac8, %g1, %r1
        setx  0xfcd340124bb86dba, %g1, %r2
        setx  0x97459a5dc59562a7, %g1, %r3
        setx  0x145d864130900688, %g1, %r4
        setx  0xf8de68326dc18e79, %g1, %r5
        setx  0xec336aa37695c74f, %g1, %r6
        setx  0x0c1764becf512611, %g1, %r7
        setx  0x72ca2973aaa9927d, %g1, %r10
        setx  0x6bd07274716c1a2b, %g1, %r11
        setx  0xdc91782763f33f6e, %g1, %r12
        setx  0xabb1290c1b943649, %g1, %r13
        setx  0x28e9bfa048e5e935, %g1, %r14
        setx  0x833c5adc2a8418a6, %g1, %r15
        setx  0xdec92c16d22755de, %g1, %r16
        setx  0xd2d256bcd35339d4, %g1, %r17
        setx  0xe559847c2bfde76a, %g1, %r18
        setx  0xd773222c53ca25b9, %g1, %r19
        setx  0x57844128f3924ea9, %g1, %r20
        setx  0x0d4b08c83211db16, %g1, %r21
        setx  0xb528c2ce22f36c57, %g1, %r22
        setx  0xec814bb802b1ac5c, %g1, %r23
        setx  0x228f6fece6687484, %g1, %r24
        setx  0xe22e5365910af72d, %g1, %r25
        setx  0xfaf2105c2d35d01c, %g1, %r26
        setx  0xdfbbebce2c31e6e2, %g1, %r27
        setx  0xfe8010481a0c8306, %g1, %r28
        setx  0x86e677f4b134425f, %g1, %r29
        setx  0x5fb58223fcb8fcee, %g1, %r30
        setx  0xb17fd95a081dbd4a, %g1, %r31
	.word 0xce320009  ! 11: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4420009  ! 11: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0x9a3a0009  ! 11: XNOR_R	xnor 	%r8, %r9, %r13
	.word 0x88422d18  ! 11: ADDC_I	addc 	%r8, 0x0d18, %r4
	.word 0x8caa0009  ! 11: ANDNcc_R	andncc 	%r8, %r9, %r6
	.word 0x825221c4  ! 11: UMUL_I	umul 	%r8, 0x01c4, %r1
	.word 0xf02a0009  ! 17: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xcc0a0009  ! 17: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0xa61224bc  ! 17: OR_I	or 	%r8, 0x04bc, %r19
	.word 0x88120009  ! 17: OR_R	or 	%r8, %r9, %r4
	.word 0xbaaa0009  ! 17: ANDNcc_R	andncc 	%r8, %r9, %r29
	.word 0x88da0009  ! 17: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0x0
	.word 0xfe2a0009  ! 28: STB_R	stb	%r31, [%r8 + %r9]
	.word 0xf65a0009  ! 28: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0x8a120009  ! 28: OR_R	or 	%r8, %r9, %r5
	.word 0x860a26c4  ! 28: AND_I	and 	%r8, 0x06c4, %r3
	.word 0x88a22afc  ! 28: SUBcc_I	subcc 	%r8, 0x0afc, %r4
	.word 0x825a0009  ! 28: SMUL_R	smul 	%r8, %r9, %r1
	.word 0xc42a0009  ! 35: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xce0a0009  ! 35: LDUB_R	ldub	[%r8 + %r9], %r7
	.word 0x8f322001  ! 35: SRL_I	srl 	%r8, 0x0001, %r7
	.word 0x82922774  ! 35: ORcc_I	orcc 	%r8, 0x0774, %r1
	.word 0x86022760  ! 35: ADD_I	add 	%r8, 0x0760, %r3
	.word 0x8ed20009  ! 35: UMULcc_R	umulcc 	%r8, %r9, %r7
	.word 0xcc220009  ! 42: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xc2420009  ! 42: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8d3a2001  ! 42: SRA_I	sra 	%r8, 0x0001, %r6
	.word 0x833a0009  ! 42: SRA_R	sra 	%r8, %r9, %r1
	.word 0x8c1a2eb8  ! 42: XOR_I	xor 	%r8, 0x0eb8, %r6
	.word 0xb8da0009  ! 42: SMULcc_R	smulcc 	%r8, %r9, %r28
	.word 0xfc220009  ! 51: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xd84a0009  ! 51: LDSB_R	ldsb	[%r8 + %r9], %r12
	.word 0x8b321009  ! 51: SRLX_R	srlx	%r8, %r9, %r5
	.word 0x8cb22f8c  ! 51: ORNcc_I	orncc 	%r8, 0x0f8c, %r6
	.word 0x82aa0009  ! 51: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x9e5a0009  ! 51: SMUL_R	smul 	%r8, %r9, %r15
	.word 0xe0220009  ! 57: STW_R	stw	%r16, [%r8 + %r9]
	.word 0xc81a0009  ! 57: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8b643801  ! 57: MOVcc_I	<illegal instruction>
	.word 0xa53a0009  ! 57: SRA_R	sra 	%r8, %r9, %r18
	.word 0x95643801  ! 57: MOVcc_I	<illegal instruction>
	.word 0xb2d20009  ! 57: UMULcc_R	umulcc 	%r8, %r9, %r25
	.word 0xc4720009  ! 65: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc65a0009  ! 65: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xb3643801  ! 65: MOVcc_I	<illegal instruction>
	.word 0x82b226fc  ! 65: SUBCcc_I	orncc 	%r8, 0x06fc, %r1
	.word 0x8d3a1009  ! 65: SRAX_R	srax	%r8, %r9, %r6
	.word 0x825222e0  ! 65: UMUL_I	umul 	%r8, 0x02e0, %r1
	.word 0xc33a0009  ! 73: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf0120009  ! 73: LDUH_R	lduh	[%r8 + %r9], %r24
	.word 0x8e1a0009  ! 73: XOR_R	xor 	%r8, %r9, %r7
	.word 0x8b782401  ! 73: MOVR_I	move	%r0, 0x9, %r5
	.word 0xa8ba0009  ! 73: XNORcc_R	xnorcc 	%r8, %r9, %r20
	.word 0x83222484  ! 73: MULScc_I	mulscc 	%r8, 0x0484, %r1
	.word 0xdb3a0009  ! 80: STDF_R	std	%f13, [%r9, %r8]
	.word 0xc80a0009  ! 80: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x87641809  ! 80: MOVcc_R	<illegal instruction>
	.word 0x821a0009  ! 80: XOR_R	xor 	%r8, %r9, %r1
	.word 0x84a20009  ! 80: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0xa7220009  ! 80: MULScc_R	mulscc 	%r8, %r9, %r19
	.word 0x0
	.word 0xcc320009  ! 90: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc01a0009  ! 90: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x8e8a0009  ! 90: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0x9a820009  ! 90: ADDcc_R	addcc 	%r8, %r9, %r13
	.word 0x8c320009  ! 90: SUBC_R	orn 	%r8, %r9, %r6
	.word 0x865a0009  ! 90: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xc8220009  ! 96: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc44a0009  ! 96: LDSB_R	ldsb	[%r8 + %r9], %r2
	.word 0x86822210  ! 96: ADDcc_I	addcc 	%r8, 0x0210, %r3
	.word 0x86322740  ! 96: ORN_I	orn 	%r8, 0x0740, %r3
	.word 0x869a2298  ! 96: XORcc_I	xorcc 	%r8, 0x0298, %r3
	.word 0xa85a0009  ! 96: SMUL_R	smul 	%r8, %r9, %r20
	.word 0xc4320009  ! 102: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xee120009  ! 102: LDUH_R	lduh	[%r8 + %r9], %r23
	.word 0x8c422b3c  ! 102: ADDC_I	addc 	%r8, 0x0b3c, %r6
	.word 0x823a25d0  ! 102: XNOR_I	xnor 	%r8, 0x05d0, %r1
	.word 0x892a2001  ! 102: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0xac5a0009  ! 102: SMUL_R	smul 	%r8, %r9, %r22
	.word 0xc6720009  ! 108: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc01a0009  ! 108: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x869a0009  ! 108: XORcc_R	xorcc 	%r8, %r9, %r3
	.word 0x8d782401  ! 108: MOVR_I	move	%r0, 0x9, %r6
	.word 0xae1a2f64  ! 108: XOR_I	xor 	%r8, 0x0f64, %r23
	.word 0x845a2530  ! 108: SMUL_I	smul 	%r8, 0x0530, %r2
	.word 0xf73a0009  ! 114: STDF_R	std	%f27, [%r9, %r8]
	.word 0xf65a0009  ! 114: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0x8e3229a8  ! 114: SUBC_I	orn 	%r8, 0x09a8, %r7
	.word 0x8c1a0009  ! 114: XOR_R	xor 	%r8, %r9, %r6
	.word 0x8d2a2001  ! 114: SLL_I	sll 	%r8, 0x0001, %r6
	.word 0x884a0009  ! 114: MULX_R	mulx 	%r8, %r9, %r4
	.word 0xca320009  ! 120: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc65a0009  ! 120: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x9eba2ef0  ! 120: XNORcc_I	xnorcc 	%r8, 0x0ef0, %r15
	.word 0x83782401  ! 120: MOVR_I	move	%r0, 0xfffffef0, %r1
	.word 0x8f3a3001  ! 120: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0x8d222600  ! 120: MULScc_I	mulscc 	%r8, 0x0600, %r6
	.word 0xe2220009  ! 127: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xd60a0009  ! 127: LDUB_R	ldub	[%r8 + %r9], %r11
	.word 0x96820009  ! 127: ADDcc_R	addcc 	%r8, %r9, %r11
	.word 0x8ab20009  ! 127: ORNcc_R	orncc 	%r8, %r9, %r5
	.word 0x8ea22d00  ! 127: SUBcc_I	subcc 	%r8, 0x0d00, %r7
	.word 0x825a2d1c  ! 127: SMUL_I	smul 	%r8, 0x0d1c, %r1
	.word 0xfc220009  ! 133: STW_R	stw	%r30, [%r8 + %r9]
	.word 0xf24a0009  ! 133: LDSB_R	ldsb	[%r8 + %r9], %r25
	.word 0xa2b20009  ! 133: SUBCcc_R	orncc 	%r8, %r9, %r17
	.word 0xa2120009  ! 133: OR_R	or 	%r8, %r9, %r17
	.word 0x8e3228b4  ! 133: SUBC_I	orn 	%r8, 0x08b4, %r7
	.word 0xb0d20009  ! 133: UMULcc_R	umulcc 	%r8, %r9, %r24
	.word 0x0
	.word 0xe82a0009  ! 145: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xcc4a0009  ! 145: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x8c922da8  ! 145: ORcc_I	orcc 	%r8, 0x0da8, %r6
	.word 0x960a0009  ! 145: AND_R	and 	%r8, %r9, %r11
	.word 0xae0a0009  ! 145: AND_R	and 	%r8, %r9, %r23
	.word 0x8c520009  ! 145: UMUL_R	umul 	%r8, %r9, %r6
	.word 0xc82a0009  ! 152: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc1a0009  ! 152: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x88a20009  ! 152: SUBcc_R	subcc 	%r8, %r9, %r4
	.word 0x8d322001  ! 152: SRL_I	srl 	%r8, 0x0001, %r6
	.word 0x833a2001  ! 152: SRA_I	sra 	%r8, 0x0001, %r1
	.word 0x8c5a0009  ! 152: SMUL_R	smul 	%r8, %r9, %r6
	.word 0xc73a0009  ! 159: STDF_R	std	%f3, [%r9, %r8]
	.word 0xf6020009  ! 159: LDUW_R	lduw	[%r8 + %r9], %r27
	.word 0x8c3a0009  ! 159: XNOR_R	xnor 	%r8, %r9, %r6
	.word 0x8aaa0009  ! 159: ANDNcc_R	andncc 	%r8, %r9, %r5
	.word 0xa62a0009  ! 159: ANDN_R	andn 	%r8, %r9, %r19
	.word 0x8c4a0009  ! 159: MULX_R	mulx 	%r8, %r9, %r6
	.word 0xf8720009  ! 165: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xc4120009  ! 165: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0xad322001  ! 165: SRL_I	srl 	%r8, 0x0001, %r22
	.word 0x861a0009  ! 165: XOR_R	xor 	%r8, %r9, %r3
	.word 0xac2a21d4  ! 165: ANDN_I	andn 	%r8, 0x01d4, %r22
	.word 0x88d22334  ! 165: UMULcc_I	umulcc 	%r8, 0x0334, %r4
	.word 0xde2a0009  ! 173: STB_R	stb	%r15, [%r8 + %r9]
	.word 0xec420009  ! 173: LDSW_R	ldsw	[%r8 + %r9], %r22
	.word 0xbc1a0009  ! 173: XOR_R	xor 	%r8, %r9, %r30
	.word 0x8e420009  ! 173: ADDC_R	addc 	%r8, %r9, %r7
	.word 0x84b228ac  ! 173: SUBCcc_I	orncc 	%r8, 0x08ac, %r2
	.word 0x86d22d60  ! 173: UMULcc_I	umulcc 	%r8, 0x0d60, %r3
	.word 0xcb220009  ! 181: STF_R	st	%f5, [%r9, %r8]
	.word 0xcc1a0009  ! 181: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x85782401  ! 181: MOVR_I	move	%r0, 0x401, %r2
	.word 0x8a222b18  ! 181: SUB_I	sub 	%r8, 0x0b18, %r5
	.word 0x89643801  ! 181: MOVcc_I	<illegal instruction>
	.word 0x8e520009  ! 181: UMUL_R	umul 	%r8, %r9, %r7
	.word 0xd9220009  ! 188: STF_R	st	%f12, [%r9, %r8]
	.word 0xc2120009  ! 188: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x84322ae0  ! 188: ORN_I	orn 	%r8, 0x0ae0, %r2
	.word 0x86322a1c  ! 188: SUBC_I	orn 	%r8, 0x0a1c, %r3
	.word 0x833a3001  ! 188: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0xaf220009  ! 188: MULScc_R	mulscc 	%r8, %r9, %r23
	.word 0xce2a0009  ! 195: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xd81a0009  ! 195: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0xba2223c0  ! 195: SUB_I	sub 	%r8, 0x03c0, %r29
	.word 0x9d3a3001  ! 195: SRAX_I	srax	%r8, 0x0001, %r14
	.word 0xb49a0009  ! 195: XORcc_R	xorcc 	%r8, %r9, %r26
	.word 0xa5220009  ! 195: MULScc_R	mulscc 	%r8, %r9, %r18
	.word 0xc33a0009  ! 201: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc64a0009  ! 201: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x9a320009  ! 201: SUBC_R	orn 	%r8, %r9, %r13
	.word 0xab2a2001  ! 201: SLL_I	sll 	%r8, 0x0001, %r21
	.word 0x9d3a3001  ! 201: SRAX_I	srax	%r8, 0x0001, %r14
	.word 0x8e522d48  ! 201: UMUL_I	umul 	%r8, 0x0d48, %r7
	.word 0xea220009  ! 207: STW_R	stw	%r21, [%r8 + %r9]
	.word 0xee4a0009  ! 207: LDSB_R	ldsb	[%r8 + %r9], %r23
	.word 0x8b2a0009  ! 207: SLL_R	sll 	%r8, %r9, %r5
	.word 0xae2a0009  ! 207: ANDN_R	andn 	%r8, %r9, %r23
	.word 0x8cb20009  ! 207: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x864a0009  ! 207: MULX_R	mulx 	%r8, %r9, %r3
	.word 0xca320009  ! 213: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xc4120009  ! 213: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x9c9a0009  ! 213: XORcc_R	xorcc 	%r8, %r9, %r14
	.word 0xb72a0009  ! 213: SLL_R	sll 	%r8, %r9, %r27
	.word 0x83782401  ! 213: MOVR_I	move	%r0, 0x9, %r1
	.word 0x8ada27b4  ! 213: SMULcc_I	smulcc 	%r8, 0x07b4, %r5
	.word 0xe8320009  ! 223: STH_R	sth	%r20, [%r8 + %r9]
	.word 0xc4420009  ! 223: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xa92a0009  ! 223: SLL_R	sll 	%r8, %r9, %r20
	.word 0xbcc22e4c  ! 223: ADDCcc_I	addccc 	%r8, 0x0e4c, %r30
	.word 0x889a0009  ! 223: XORcc_R	xorcc 	%r8, %r9, %r4
	.word 0x884a2028  ! 223: MULX_I	mulx 	%r8, 0x0028, %r4
	.word 0xf8720009  ! 229: STX_R	stx	%r28, [%r8 + %r9]
	.word 0xf2420009  ! 229: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0xad782401  ! 229: MOVR_I	move	%r0, 0x401, %r22
	.word 0x89641809  ! 229: MOVcc_R	<illegal instruction>
	.word 0x893a3001  ! 229: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0xbc5224e4  ! 229: UMUL_I	umul 	%r8, 0x04e4, %r30
	.word 0xfa720009  ! 235: STX_R	stx	%r29, [%r8 + %r9]
	.word 0xc8020009  ! 235: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x828a0009  ! 235: ANDcc_R	andcc 	%r8, %r9, %r1
	.word 0x8c1223f8  ! 235: OR_I	or 	%r8, 0x03f8, %r6
	.word 0x873a1009  ! 235: SRAX_R	srax	%r8, %r9, %r3
	.word 0x85220009  ! 235: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0xcc320009  ! 241: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xc24a0009  ! 241: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x832a2001  ! 241: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0x8a9225e0  ! 241: ORcc_I	orcc 	%r8, 0x05e0, %r5
	.word 0x8e922a20  ! 241: ORcc_I	orcc 	%r8, 0x0a20, %r7
	.word 0x8ad22538  ! 241: UMULcc_I	umulcc 	%r8, 0x0538, %r5
	.word 0xc33a0009  ! 247: STDF_R	std	%f1, [%r9, %r8]
	.word 0xce5a0009  ! 247: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0xa8322bc4  ! 247: ORN_I	orn 	%r8, 0x0bc4, %r20
	.word 0xa4a22770  ! 247: SUBcc_I	subcc 	%r8, 0x0770, %r18
	.word 0x8a422000  ! 247: ADDC_I	addc 	%r8, 0x0000, %r5
	.word 0x84d22458  ! 247: UMULcc_I	umulcc 	%r8, 0x0458, %r2
	.word 0xe6220009  ! 253: STW_R	stw	%r19, [%r8 + %r9]
	.word 0xc2020009  ! 253: LDUW_R	lduw	[%r8 + %r9], %r1
	.word 0xb4ba0009  ! 253: XNORcc_R	xnorcc 	%r8, %r9, %r26
	.word 0x889a240c  ! 253: XORcc_I	xorcc 	%r8, 0x040c, %r4
	.word 0x89780409  ! 253: MOVR_R	move	%r0, %r9, %r4
	.word 0x885a2df4  ! 253: SMUL_I	smul 	%r8, 0x0df4, %r4
	.word 0xc6320009  ! 259: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xcc120009  ! 259: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x88322144  ! 259: SUBC_I	orn 	%r8, 0x0144, %r4
	.word 0x88aa0009  ! 259: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0x8cba0009  ! 259: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0xa05a2988  ! 259: SMUL_I	smul 	%r8, 0x0988, %r16
	.word 0xce320009  ! 267: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xc4120009  ! 267: LDUH_R	lduh	[%r8 + %r9], %r2
	.word 0x8c920009  ! 267: ORcc_R	orcc 	%r8, %r9, %r6
	.word 0x8a022988  ! 267: ADD_I	add 	%r8, 0x0988, %r5
	.word 0x84322328  ! 267: SUBC_I	orn 	%r8, 0x0328, %r2
	.word 0x845a0009  ! 267: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xc8220009  ! 274: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xc8520009  ! 274: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0x82020009  ! 274: ADD_R	add 	%r8, %r9, %r1
	.word 0x84ba0009  ! 274: XNORcc_R	xnorcc 	%r8, %r9, %r2
	.word 0x8e8a27d8  ! 274: ANDcc_I	andcc 	%r8, 0x07d8, %r7
	.word 0x8c5a27a8  ! 274: SMUL_I	smul 	%r8, 0x07a8, %r6
	.word 0xc2320009  ! 280: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf81a0009  ! 280: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x9d643801  ! 280: MOVcc_I	<illegal instruction>
	.word 0x8682256c  ! 280: ADDcc_I	addcc 	%r8, 0x056c, %r3
	.word 0x8c3a0009  ! 280: XNOR_R	xnor 	%r8, %r9, %r6
	.word 0xb6d224e0  ! 280: UMULcc_I	umulcc 	%r8, 0x04e0, %r27
	.word 0xed220009  ! 286: STF_R	st	%f22, [%r9, %r8]
	.word 0xf2420009  ! 286: LDSW_R	ldsw	[%r8 + %r9], %r25
	.word 0x8a0a0009  ! 286: AND_R	and 	%r8, %r9, %r5
	.word 0xbeaa22c0  ! 286: ANDNcc_I	andncc 	%r8, 0x02c0, %r31
	.word 0xaa320009  ! 286: ORN_R	orn 	%r8, %r9, %r21
	.word 0x8a520009  ! 286: UMUL_R	umul 	%r8, %r9, %r5
	.word 0xc4720009  ! 293: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xca5a0009  ! 293: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0x8a8a0009  ! 293: ANDcc_R	andcc 	%r8, %r9, %r5
	.word 0x86320009  ! 293: SUBC_R	orn 	%r8, %r9, %r3
	.word 0x86220009  ! 293: SUB_R	sub 	%r8, %r9, %r3
	.word 0x8ad22410  ! 293: UMULcc_I	umulcc 	%r8, 0x0410, %r5
	.word 0x0
	.word 0xeb3a0009  ! 301: STDF_R	std	%f21, [%r9, %r8]
	.word 0xc01a0009  ! 301: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0xa1641809  ! 301: MOVcc_R	<illegal instruction>
	.word 0x8e1a2d9c  ! 301: XOR_I	xor 	%r8, 0x0d9c, %r7
	.word 0x89643801  ! 301: MOVcc_I	<illegal instruction>
	.word 0x86520009  ! 301: UMUL_R	umul 	%r8, %r9, %r3
	.word 0xc7220009  ! 308: STF_R	st	%f3, [%r9, %r8]
	.word 0xfe5a0009  ! 308: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0x94922314  ! 308: ORcc_I	orcc 	%r8, 0x0314, %r10
	.word 0xbc3a2f28  ! 308: XNOR_I	xnor 	%r8, 0x0f28, %r30
	.word 0x8b3a0009  ! 308: SRA_R	sra 	%r8, %r9, %r5
	.word 0x824a2de4  ! 308: MULX_I	mulx 	%r8, 0x0de4, %r1
	.word 0xc3220009  ! 314: STF_R	st	%f1, [%r9, %r8]
	.word 0xcc1a0009  ! 314: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xb4020009  ! 314: ADD_R	add 	%r8, %r9, %r26
	.word 0x8f3a1009  ! 314: SRAX_R	srax	%r8, %r9, %r7
	.word 0xba822b38  ! 314: ADDcc_I	addcc 	%r8, 0x0b38, %r29
	.word 0xa24a2290  ! 314: MULX_I	mulx 	%r8, 0x0290, %r17
	.word 0xda220009  ! 322: STW_R	stw	%r13, [%r8 + %r9]
	.word 0xcc520009  ! 322: LDSH_R	ldsh	[%r8 + %r9], %r6
	.word 0x8eba2e20  ! 322: XNORcc_I	xnorcc 	%r8, 0x0e20, %r7
	.word 0x8a9a2950  ! 322: XORcc_I	xorcc 	%r8, 0x0950, %r5
	.word 0x96222798  ! 322: SUB_I	sub 	%r8, 0x0798, %r11
	.word 0x88d224d8  ! 322: UMULcc_I	umulcc 	%r8, 0x04d8, %r4
	.word 0xe8720009  ! 329: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xce5a0009  ! 329: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x88320009  ! 329: ORN_R	orn 	%r8, %r9, %r4
	.word 0x862a0009  ! 329: ANDN_R	andn 	%r8, %r9, %r3
	.word 0x972a3001  ! 329: SLLX_I	sllx	%r8, 0x0001, %r11
	.word 0x8ad20009  ! 329: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xdf3a0009  ! 335: STDF_R	std	%f15, [%r9, %r8]
	.word 0xd81a0009  ! 335: LDD_R	ldd	[%r8 + %r9], %r12
	.word 0x8a9221d0  ! 335: ORcc_I	orcc 	%r8, 0x01d0, %r5
	.word 0x83321009  ! 335: SRLX_R	srlx	%r8, %r9, %r1
	.word 0x841a0009  ! 335: XOR_R	xor 	%r8, %r9, %r2
	.word 0x8eda2420  ! 335: SMULcc_I	smulcc 	%r8, 0x0420, %r7
	.word 0xc33a0009  ! 342: STDF_R	std	%f1, [%r9, %r8]
	.word 0xf81a0009  ! 342: LDD_R	ldd	[%r8 + %r9], %r28
	.word 0x8822289c  ! 342: SUB_I	sub 	%r8, 0x089c, %r4
	.word 0xa6922510  ! 342: ORcc_I	orcc 	%r8, 0x0510, %r19
	.word 0x82b20009  ! 342: SUBCcc_R	orncc 	%r8, %r9, %r1
	.word 0x945a0009  ! 342: SMUL_R	smul 	%r8, %r9, %r10
	.word 0x0
	.word 0xc82a0009  ! 352: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc2520009  ! 352: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x829a2128  ! 352: XORcc_I	xorcc 	%r8, 0x0128, %r1
	.word 0x8cb20009  ! 352: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x840a0009  ! 352: AND_R	and 	%r8, %r9, %r2
	.word 0xbeda0009  ! 352: SMULcc_R	smulcc 	%r8, %r9, %r31
	.word 0xcb3a0009  ! 358: STDF_R	std	%f5, [%r9, %r8]
	.word 0xe6420009  ! 358: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x99322001  ! 358: SRL_I	srl 	%r8, 0x0001, %r12
	.word 0x98020009  ! 358: ADD_R	add 	%r8, %r9, %r12
	.word 0x86c20009  ! 358: ADDCcc_R	addccc 	%r8, %r9, %r3
	.word 0x9ed22a94  ! 358: UMULcc_I	umulcc 	%r8, 0x0a94, %r15
	.word 0xd6320009  ! 364: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xca120009  ! 364: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0x964226b8  ! 364: ADDC_I	addc 	%r8, 0x06b8, %r11
	.word 0x82020009  ! 364: ADD_R	add 	%r8, %r9, %r1
	.word 0x8a9a2c04  ! 364: XORcc_I	xorcc 	%r8, 0x0c04, %r5
	.word 0xbeda0009  ! 364: SMULcc_R	smulcc 	%r8, %r9, %r31
	.word 0xd8320009  ! 370: STH_R	sth	%r12, [%r8 + %r9]
	.word 0xc41a0009  ! 370: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8a8a2710  ! 370: ANDcc_I	andcc 	%r8, 0x0710, %r5
	.word 0x8a9a0009  ! 370: XORcc_R	xorcc 	%r8, %r9, %r5
	.word 0x88c22804  ! 370: ADDCcc_I	addccc 	%r8, 0x0804, %r4
	.word 0xa25a22d4  ! 370: SMUL_I	smul 	%r8, 0x02d4, %r17
	.word 0xca720009  ! 376: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xcc420009  ! 376: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x8a322080  ! 376: ORN_I	orn 	%r8, 0x0080, %r5
	.word 0x8a82264c  ! 376: ADDcc_I	addcc 	%r8, 0x064c, %r5
	.word 0x9c3222cc  ! 376: ORN_I	orn 	%r8, 0x02cc, %r14
	.word 0x8b222090  ! 376: MULScc_I	mulscc 	%r8, 0x0090, %r5
	.word 0xc42a0009  ! 382: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc2120009  ! 382: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8632282c  ! 382: ORN_I	orn 	%r8, 0x082c, %r3
	.word 0x8e1a2c90  ! 382: XOR_I	xor 	%r8, 0x0c90, %r7
	.word 0x86c22ab4  ! 382: ADDCcc_I	addccc 	%r8, 0x0ab4, %r3
	.word 0x8ad20009  ! 382: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xc82a0009  ! 388: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xcc0a0009  ! 388: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x94b22754  ! 388: ORNcc_I	orncc 	%r8, 0x0754, %r10
	.word 0x8a2a0009  ! 388: ANDN_R	andn 	%r8, %r9, %r5
	.word 0xad3a0009  ! 388: SRA_R	sra 	%r8, %r9, %r22
	.word 0x8ad20009  ! 388: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xe73a0009  ! 397: STDF_R	std	%f19, [%r9, %r8]
	.word 0xc4020009  ! 397: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xaa3a27fc  ! 397: XNOR_I	xnor 	%r8, 0x07fc, %r21
	.word 0x829a0009  ! 397: XORcc_R	xorcc 	%r8, %r9, %r1
	.word 0x88c227d4  ! 397: ADDCcc_I	addccc 	%r8, 0x07d4, %r4
	.word 0x8eda21b8  ! 397: SMULcc_I	smulcc 	%r8, 0x01b8, %r7
	.word 0xcd220009  ! 403: STF_R	st	%f6, [%r9, %r8]
	.word 0xc80a0009  ! 403: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x823222d0  ! 403: ORN_I	orn 	%r8, 0x02d0, %r1
	.word 0xb1322001  ! 403: SRL_I	srl 	%r8, 0x0001, %r24
	.word 0x8ac227dc  ! 403: ADDCcc_I	addccc 	%r8, 0x07dc, %r5
	.word 0x88522538  ! 403: UMUL_I	umul 	%r8, 0x0538, %r4
	.word 0xc6320009  ! 411: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc20a0009  ! 411: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x82b20009  ! 411: ORNcc_R	orncc 	%r8, %r9, %r1
	.word 0x82aa0009  ! 411: ANDNcc_R	andncc 	%r8, %r9, %r1
	.word 0x86b22b88  ! 411: SUBCcc_I	orncc 	%r8, 0x0b88, %r3
	.word 0xac520009  ! 411: UMUL_R	umul 	%r8, %r9, %r22
	.word 0xcb220009  ! 417: STF_R	st	%f5, [%r9, %r8]
	.word 0xd4120009  ! 417: LDUH_R	lduh	[%r8 + %r9], %r10
	.word 0xb4aa24b0  ! 417: ANDNcc_I	andncc 	%r8, 0x04b0, %r26
	.word 0x98422f30  ! 417: ADDC_I	addc 	%r8, 0x0f30, %r12
	.word 0x833a3001  ! 417: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0xb85a2f18  ! 417: SMUL_I	smul 	%r8, 0x0f18, %r28
	.word 0xcc720009  ! 423: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xf4520009  ! 423: LDSH_R	ldsh	[%r8 + %r9], %r26
	.word 0x8b2a1009  ! 423: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x8a92256c  ! 423: ORcc_I	orcc 	%r8, 0x056c, %r5
	.word 0x8c822638  ! 423: ADDcc_I	addcc 	%r8, 0x0638, %r6
	.word 0xaa52290c  ! 423: UMUL_I	umul 	%r8, 0x090c, %r21
	.word 0xfa2a0009  ! 431: STB_R	stb	%r29, [%r8 + %r9]
	.word 0xc2520009  ! 431: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x88920009  ! 431: ORcc_R	orcc 	%r8, %r9, %r4
	.word 0x892a1009  ! 431: SLLX_R	sllx	%r8, %r9, %r4
	.word 0xbd780409  ! 431: MOVR_R	move	%r0, %r9, %r30
	.word 0x8eda0009  ! 431: SMULcc_R	smulcc 	%r8, %r9, %r7
	.word 0xc8720009  ! 437: STX_R	stx	%r4, [%r8 + %r9]
	.word 0xc45a0009  ! 437: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x872a3001  ! 437: SLLX_I	sllx	%r8, 0x0001, %r3
	.word 0xa12a0009  ! 437: SLL_R	sll 	%r8, %r9, %r16
	.word 0x8c0a0009  ! 437: AND_R	and 	%r8, %r9, %r6
	.word 0x89220009  ! 437: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xc9220009  ! 445: STF_R	st	%f4, [%r9, %r8]
	.word 0xcc5a0009  ! 445: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0xbeba2490  ! 445: XNORcc_I	xnorcc 	%r8, 0x0490, %r31
	.word 0x843a2aec  ! 445: XNOR_I	xnor 	%r8, 0x0aec, %r2
	.word 0x840a27f4  ! 445: AND_I	and 	%r8, 0x07f4, %r2
	.word 0x8ad20009  ! 445: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0xce2a0009  ! 451: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xce4a0009  ! 451: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x8f641809  ! 451: MOVcc_R	<illegal instruction>
	.word 0x8d641809  ! 451: MOVcc_R	<illegal instruction>
	.word 0xa1322001  ! 451: SRL_I	srl 	%r8, 0x0001, %r16
	.word 0xa65a0009  ! 451: SMUL_R	smul 	%r8, %r9, %r19
	.word 0xcc2a0009  ! 458: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc8520009  ! 458: LDSH_R	ldsh	[%r8 + %r9], %r4
	.word 0xa69a2c20  ! 458: XORcc_I	xorcc 	%r8, 0x0c20, %r19
	.word 0x84920009  ! 458: ORcc_R	orcc 	%r8, %r9, %r2
	.word 0x8e2222c8  ! 458: SUB_I	sub 	%r8, 0x02c8, %r7
	.word 0x8e5220a8  ! 458: UMUL_I	umul 	%r8, 0x00a8, %r7
	.word 0xe4220009  ! 464: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xca0a0009  ! 464: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x84220009  ! 464: SUB_R	sub 	%r8, %r9, %r2
	.word 0xa00a0009  ! 464: AND_R	and 	%r8, %r9, %r16
	.word 0x860a2048  ! 464: AND_I	and 	%r8, 0x0048, %r3
	.word 0x844a0009  ! 464: MULX_R	mulx 	%r8, %r9, %r2
	.word 0xde720009  ! 470: STX_R	stx	%r15, [%r8 + %r9]
	.word 0xc6520009  ! 470: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0xb32a1009  ! 470: SLLX_R	sllx	%r8, %r9, %r25
	.word 0x88822e38  ! 470: ADDcc_I	addcc 	%r8, 0x0e38, %r4
	.word 0x8ab22ddc  ! 470: SUBCcc_I	orncc 	%r8, 0x0ddc, %r5
	.word 0x88da2eac  ! 470: SMULcc_I	smulcc 	%r8, 0x0eac, %r4
	.word 0xc42a0009  ! 476: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xe81a0009  ! 476: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x82020009  ! 476: ADD_R	add 	%r8, %r9, %r1
	.word 0x8c922380  ! 476: ORcc_I	orcc 	%r8, 0x0380, %r6
	.word 0xa2420009  ! 476: ADDC_R	addc 	%r8, %r9, %r17
	.word 0x85222f30  ! 476: MULScc_I	mulscc 	%r8, 0x0f30, %r2
	.word 0x0
	.word 0xec2a0009  ! 483: STB_R	stb	%r22, [%r8 + %r9]
	.word 0xee520009  ! 483: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x988a27f0  ! 483: ANDcc_I	andcc 	%r8, 0x07f0, %r12
	.word 0x82b22250  ! 483: ORNcc_I	orncc 	%r8, 0x0250, %r1
	.word 0x9e3a2a6c  ! 483: XNOR_I	xnor 	%r8, 0x0a6c, %r15
	.word 0x825a2694  ! 483: SMUL_I	smul 	%r8, 0x0694, %r1
	.word 0xc62a0009  ! 489: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xc80a0009  ! 489: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0xb9780409  ! 489: MOVR_R	move	%r0, %r9, %r28
	.word 0xa0120009  ! 489: OR_R	or 	%r8, %r9, %r16
	.word 0x8c8227dc  ! 489: ADDcc_I	addcc 	%r8, 0x07dc, %r6
	.word 0x88d22620  ! 489: UMULcc_I	umulcc 	%r8, 0x0620, %r4
	.word 0xc9220009  ! 495: STF_R	st	%f4, [%r9, %r8]
	.word 0xf84a0009  ! 495: LDSB_R	ldsb	[%r8 + %r9], %r28
	.word 0x86b22edc  ! 495: ORNcc_I	orncc 	%r8, 0x0edc, %r3
	.word 0x9e220009  ! 495: SUB_R	sub 	%r8, %r9, %r15
	.word 0x94422bac  ! 495: ADDC_I	addc 	%r8, 0x0bac, %r10
	.word 0x89220009  ! 495: MULScc_R	mulscc 	%r8, %r9, %r4
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000220, %g1, %r9
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
        setx  0x66002053aea40d92, %g1, %r0
        setx  0x1ebd25c5dc96eac8, %g1, %r1
        setx  0xfcd340124bb86dba, %g1, %r2
        setx  0x97459a5dc59562a7, %g1, %r3
        setx  0x145d864130900688, %g1, %r4
        setx  0xf8de68326dc18e79, %g1, %r5
        setx  0xec336aa37695c74f, %g1, %r6
        setx  0x0c1764becf512611, %g1, %r7
        setx  0x72ca2973aaa9927d, %g1, %r10
        setx  0x6bd07274716c1a2b, %g1, %r11
        setx  0xdc91782763f33f6e, %g1, %r12
        setx  0xabb1290c1b943649, %g1, %r13
        setx  0x28e9bfa048e5e935, %g1, %r14
        setx  0x833c5adc2a8418a6, %g1, %r15
        setx  0xdec92c16d22755de, %g1, %r16
        setx  0xd2d256bcd35339d4, %g1, %r17
        setx  0xe559847c2bfde76a, %g1, %r18
        setx  0xd773222c53ca25b9, %g1, %r19
        setx  0x57844128f3924ea9, %g1, %r20
        setx  0x0d4b08c83211db16, %g1, %r21
        setx  0xb528c2ce22f36c57, %g1, %r22
        setx  0xec814bb802b1ac5c, %g1, %r23
        setx  0x228f6fece6687484, %g1, %r24
        setx  0xe22e5365910af72d, %g1, %r25
        setx  0xfaf2105c2d35d01c, %g1, %r26
        setx  0xdfbbebce2c31e6e2, %g1, %r27
        setx  0xfe8010481a0c8306, %g1, %r28
        setx  0x86e677f4b134425f, %g1, %r29
        setx  0x5fb58223fcb8fcee, %g1, %r30
        setx  0xb17fd95a081dbd4a, %g1, %r31
	.word 0x8e4a28a8  ! 5: MULX_I	mulx 	%r8, 0x08a8, %r7
	.word 0x88da2ca4  ! 18: SMULcc_I	smulcc 	%r8, 0x0ca4, %r4
	.word 0x0
	.word 0x84522584  ! 20: UMUL_I	umul 	%r8, 0x0584, %r2
	.word 0x89220009  ! 21: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0x9c5225ac  ! 22: UMUL_I	umul 	%r8, 0x05ac, %r14
	.word 0x8f220009  ! 29: MULScc_R	mulscc 	%r8, %r9, %r7
	.word 0x88520009  ! 36: UMUL_R	umul 	%r8, %r9, %r4
	.word 0x84d20009  ! 43: UMULcc_R	umulcc 	%r8, %r9, %r2
	.word 0x8cda0009  ! 44: SMULcc_R	smulcc 	%r8, %r9, %r6
	.word 0x824a0009  ! 45: MULX_R	mulx 	%r8, %r9, %r1
	.word 0x82520009  ! 58: UMUL_R	umul 	%r8, %r9, %r1
	.word 0x89220009  ! 59: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0xb2da0009  ! 66: SMULcc_R	smulcc 	%r8, %r9, %r25
	.word 0xa2da2b58  ! 67: SMULcc_I	smulcc 	%r8, 0x0b58, %r17
	.word 0x82d20009  ! 74: UMULcc_R	umulcc 	%r8, %r9, %r1
	.word 0xbb220009  ! 81: MULScc_R	mulscc 	%r8, %r9, %r29
	.word 0x8e5a2774  ! 82: SMUL_I	smul 	%r8, 0x0774, %r7
	.word 0x0
	.word 0x845a29b8  ! 84: SMUL_I	smul 	%r8, 0x09b8, %r2
	.word 0x84522458  ! 121: UMUL_I	umul 	%r8, 0x0458, %r2
	.word 0x85220009  ! 134: MULScc_R	mulscc 	%r8, %r9, %r2
	.word 0x885a2598  ! 135: SMUL_I	smul 	%r8, 0x0598, %r4
	.word 0x0
	.word 0x884a296c  ! 137: MULX_I	mulx 	%r8, 0x096c, %r4
	.word 0x8e5221e0  ! 138: UMUL_I	umul 	%r8, 0x01e0, %r7
	.word 0x945a22f0  ! 139: SMUL_I	smul 	%r8, 0x02f0, %r10
	.word 0x84d22598  ! 146: UMULcc_I	umulcc 	%r8, 0x0598, %r2
	.word 0x8a5227c8  ! 153: UMUL_I	umul 	%r8, 0x07c8, %r5
	.word 0x86d20009  ! 166: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0x844a20e8  ! 167: MULX_I	mulx 	%r8, 0x00e8, %r2
	.word 0x8ad20009  ! 174: UMULcc_R	umulcc 	%r8, %r9, %r5
	.word 0x884a0009  ! 175: MULX_R	mulx 	%r8, %r9, %r4
	.word 0x8a4a2070  ! 182: MULX_I	mulx 	%r8, 0x0070, %r5
	.word 0x852226b0  ! 189: MULScc_I	mulscc 	%r8, 0x06b0, %r2
	.word 0x87222cf4  ! 214: MULScc_I	mulscc 	%r8, 0x0cf4, %r3
	.word 0x8ada2330  ! 215: SMULcc_I	smulcc 	%r8, 0x0330, %r5
	.word 0x865a0009  ! 216: SMUL_R	smul 	%r8, %r9, %r3
	.word 0x8d22262c  ! 217: MULScc_I	mulscc 	%r8, 0x062c, %r6
	.word 0x9ada2920  ! 260: SMULcc_I	smulcc 	%r8, 0x0920, %r13
	.word 0x8c5a0009  ! 261: SMUL_R	smul 	%r8, %r9, %r6
	.word 0x845a0009  ! 268: SMUL_R	smul 	%r8, %r9, %r2
	.word 0xaeda0009  ! 287: SMULcc_R	smulcc 	%r8, %r9, %r23
	.word 0x0
	.word 0x94d220e0  ! 295: UMULcc_I	umulcc 	%r8, 0x00e0, %r10
	.word 0x89220009  ! 302: MULScc_R	mulscc 	%r8, %r9, %r4
	.word 0x865a0009  ! 315: SMUL_R	smul 	%r8, %r9, %r3
	.word 0xaada291c  ! 316: SMULcc_I	smulcc 	%r8, 0x091c, %r21
	.word 0x86da0009  ! 323: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0x8ed22020  ! 336: UMULcc_I	umulcc 	%r8, 0x0020, %r7
	.word 0x0
	.word 0x94520009  ! 344: UMUL_R	umul 	%r8, %r9, %r10
	.word 0xa0da2938  ! 345: SMULcc_I	smulcc 	%r8, 0x0938, %r16
	.word 0xa84a0009  ! 346: MULX_R	mulx 	%r8, %r9, %r20
	.word 0x8b220009  ! 389: MULScc_R	mulscc 	%r8, %r9, %r5
	.word 0x865a2c48  ! 390: SMUL_I	smul 	%r8, 0x0c48, %r3
	.word 0xbada0009  ! 391: SMULcc_R	smulcc 	%r8, %r9, %r29
	.word 0xa9220009  ! 404: MULScc_R	mulscc 	%r8, %r9, %r20
	.word 0x86d20009  ! 405: UMULcc_R	umulcc 	%r8, %r9, %r3
	.word 0x84522c68  ! 424: UMUL_I	umul 	%r8, 0x0c68, %r2
	.word 0x8a520009  ! 425: UMUL_R	umul 	%r8, %r9, %r5
	.word 0x88da0009  ! 438: SMULcc_R	smulcc 	%r8, %r9, %r4
	.word 0x864a2390  ! 439: MULX_I	mulx 	%r8, 0x0390, %r3
	.word 0x9f222a6c  ! 452: MULScc_I	mulscc 	%r8, 0x0a6c, %r15
	.word 0x0
	nop
	nop
	nop
        ta      T_GOOD_TRAP

.data
	.word  0xad5dc581,0x2a12b563,0xca18de0d,0xa8cc3731
	.word  0xbfb4c1bc,0x44991391,0xcb821f0a,0x342477f3
	.word  0xa2bc2f68,0x82975e3b,0x89f51293,0x45b0d2d7
	.word  0x81e8ac85,0xba4def6f,0x78919626,0x2a6ce8ec
	.word  0x10ca4c26,0x93bd38f1,0xbc8ec667,0xfd3283ed
	.word  0xb2997d70,0xd32db968,0x973de36a,0xd3352e7f
	.word  0x26c02b53,0xc02f6b66,0xe9593896,0xb7e0fa4f
	.word  0xe948b27a,0xa1333627,0xe17d2738,0x0066854e
	.word  0x75274a7c,0x46464078,0x9b889be0,0xfde7e40a
	.word  0x8fd7e637,0xd1ec7c54,0x9d58dc22,0xe2978e2c
	.word  0xe1658079,0xcfc322a5,0xa18beea7,0x8e7c5efa
	.word  0x3f8dd1ee,0x9b97e736,0x2cbc1f79,0xf2344a18
	.word  0x4e01992f,0x911703b3,0x7285ffc4,0x652b23bf
	.word  0x37e8568e,0x1c21c5ff,0xe8ba1d96,0x041cf27d
	.word  0x49f5e543,0xc37663d4,0xb94d03d8,0x5763b5fd
	.word  0x9332dc05,0x5a9508f7,0xe37ba22f,0x57194e64
	.word  0xe17c188c,0x95ec16c4,0x0c6762fb,0xde81b0c6
	.word  0xed4147a0,0xce101f7f,0xe42d0146,0x51fc122b
	.word  0x38c2e11e,0x2d512e2d,0x7dfa32af,0x1e04135c
	.word  0x847f7ac8,0x993ef80d,0x0f3b7109,0x242bc0b4
	.word  0xf01c1acc,0x63ddbc12,0x17d5ed17,0x0a160316
	.word  0x4f9c9597,0xe8ad74cd,0x3f31185b,0x38b4ad62
	.word  0x98ece4b9,0x47d067bb,0x2d0c9afb,0x15a47868
	.word  0x0dd2419a,0xbe184e91,0x2e4b9c8e,0x386eca1f
	.word  0x51d3f386,0xe8b85af0,0x33407651,0x0f1ad530
	.word  0x6db277f4,0x6f273147,0xf2960d57,0x493d771d
	.word  0xea6bc61c,0xda59c710,0x65544815,0x6bbf5235
	.word  0x17799ab0,0x475ad300,0xfd44595f,0x834b0a18
	.word  0x5a623a6e,0xd9b624c1,0x8132d2cf,0x2867c22f
	.word  0xb8ade53d,0x7ec4c01e,0x5444f5c7,0x6d6958f1
	.word  0x344f2292,0x2f81a43d,0xb9c911eb,0x60eee6c2
	.word  0x75104acc,0x465db1f6,0x20fbb6d8,0xbb0e3c5d
	.word  0x0a7ad8a5,0xd4838b08,0x1709af15,0x80e78eee
	.word  0x83ae07aa,0x7b3fcbf9,0x78136e9e,0x4aad7fdd
	.word  0x6a23327f,0x88c9989e,0xe439dc22,0xef4722f1
	.word  0x30c649f7,0xbad5d53c,0xdb752098,0x59836605
	.word  0xfcfae7d0,0xf67b9a90,0xa31968cf,0x5cab68fe
	.word  0x36b9b5cf,0x30a28096,0x9d01b9c8,0x39930a9b
	.word  0x3576536a,0x0e7a5863,0x900ca528,0xb27a9e7f
	.word  0x5ef651ab,0x25ec4feb,0x15b918d8,0xffe8cdd1
	.word  0x3a6ef910,0x8084e136,0xc0bf6821,0xb376e1db
	.word  0x0e9eefa2,0x4e4aa2b5,0x02dc40db,0xb9ed3356
	.word  0x6c3163dc,0x8e64b47d,0xd56662ba,0xdc639236
	.word  0x226ae835,0xb8cbfffb,0x5460422a,0xb25e8d9d
	.word  0xa59d3d25,0x14f4707f,0xdc8ad5a4,0x538d212f
	.word  0x84865a40,0x080f964e,0xc337b4f3,0xd360ce7c
	.word  0x110cfefe,0xd3803954,0xbd1f21c6,0xbb9fcbb4
	.word  0x2c9d15dc,0x083e0c52,0x0ea18375,0xadd2d45a
	.word  0x406644e6,0x58f01cfc,0x6d593874,0x7a29842a
	.word  0x1a74c69c,0x851687de,0x7f4a09ff,0x15792d39
	.word  0x84e6e4df,0x29b1a2e4,0xe78ede44,0xcf9e2459
	.word  0xb5fc2f5b,0x100f0aca,0x62fba510,0x1f31ea2a
	.word  0x24b5edfc,0x9adea7d3,0x29e697fa,0x80334fd7
	.word  0xd4c20b73,0x52b32993,0xd1bd22db,0x6ad0a1e0
	.word  0xa96318dd,0xeb6e2e75,0xcfd9c1be,0xfcb2ae1c
	.word  0x7c0804c8,0x5fcd788d,0x5aa7ccbf,0xab79cc86
	.word  0x3f09058d,0x93fddb2b,0xea3b750b,0x02224961
	.word  0x0229028b,0x76612c77,0x543e5994,0xbc382fa8
	.word  0x95b41547,0x3c28a1ac,0x4668d3d0,0xdeb01422
	.word  0xeb66b2b9,0x6f4d17a8,0x1e3845b2,0x3f11e04b
	.word  0xbe30fca3,0x0de6e053,0x8915a23b,0x1419450d
	.word  0xdc249d43,0xd9d65354,0x2deece97,0x4007ea50
	.word  0x31b85308,0x77041859,0x0f3bded3,0x85d074e5
	.word  0xcb7d278c,0xd70c8d9a,0x0dd1d799,0x4b569398
	.word  0x57dc1162,0x0ad94eee,0xccba088d,0xd69b16b0
	.word  0x8f99f8f8,0x31f676fc,0xf963fb7d,0x9716f2a2
	.word  0xe95a2c40,0x438982a9,0x69b0f553,0xf07ed95c
	.word  0x948c13f6,0x576910e2,0x8ed9cfa4,0x69ce75a7
	.word  0xd508a079,0x98afec39,0xfc4ccc26,0x7c0c00f9
	.word  0x0ede83fc,0xd836abe8,0x579bd4f5,0x01345fda
	.word  0x9b338145,0x158191bc,0xa0ba5a52,0x92c23d0a
	.word  0xa08423b9,0xd0c4182b,0x175b9852,0xd1d31bdb
	.word  0x6b5aed17,0x37835d83,0x693d1cf6,0x911ad198
	.word  0x7a9d811d,0x1ebbe08b,0x90793bbe,0x5264cec3
	.word  0x4dedcffc,0x1dcdb624,0x264f9a20,0xe80b1016
	.word  0xb1c041ca,0x1f06bc3a,0xfedbe847,0xc949f523
	.word  0x7186b643,0x73cb41c5,0x41b598dd,0xbf955ddb
	.word  0x75df98e1,0xaa7441e4,0x3bf6e4c7,0x897df96f
	.word  0xdcc91f2b,0xba95fbdf,0x0620b357,0x5216a93a
	.word  0xa19c72b8,0x57d1495f,0x32033c4f,0xe3121087
	.word  0x184a4994,0xb55541f6,0xe32510bc,0x4fb74786
	.word  0xc3866c7a,0x91e85183,0x31ff6350,0x0abeac3b
	.word  0xf7ba159b,0xa0cec5b4,0x02c00a23,0x6346e545
	.word  0xe63970d0,0x0fbc2536,0x7b25a118,0xe4f94e46
	.word  0x7680c804,0xbbc2e55a,0x4d04b92d,0x118c7867
	.word  0x328dc5c4,0x488a7151,0x04f9f256,0x0a206f68
	.word  0xcb7191c7,0x75df39ff,0xb122d64d,0xdb45fba8
	.word  0xf4f95f4a,0xb83b4d49,0x553c7fb8,0xd6ad50a1
	.word  0x3f0f8089,0x804cbede,0xee87d2e0,0xc86cdf46
	.word  0x8da1ef14,0xe0d188c3,0xa361e431,0xf68b6232
	.word  0x4b1a3ca7,0x893055ed,0xd8a8183e,0x192d033c
	.word  0xb83b8785,0x6f6cc2f1,0xd4e8b812,0xf7ea0075
	.word  0x3360d2e3,0xfa4c553b,0xaf9e6813,0x8e4a141e
	.word  0x7e6841f2,0x6f2bbea5,0xf2ce284e,0xb4f8214a
	.word  0x94a8fa3d,0xa9d71736,0xf1aac9e0,0x5395dcf1
	.word  0x277c8db3,0xa34ead4f,0x7fbf9ff8,0xfc0bccf6
	.word  0x491e3fe6,0xa48b4b6c,0x738406dd,0x0c6a0a36
	.word  0x8a3bcc9e,0xdff42e48,0xbbdd74ef,0x8a8fcd40
	.word  0x594a18b4,0x67d27013,0xec150b59,0x05fd3296
	.word  0xd5d1598d,0x8441acf0,0x1e28f1fb,0x64cf37ae
	.word  0x6a591a95,0x56742561,0x518e03e6,0x886145bc
	.word  0x9ef479b1,0x15d08df1,0x45b88b5f,0x2f1032f7
	.word  0x7333e050,0x8df81f1f,0xea1b6088,0x4def999b
	.word  0x3224bb48,0x546ed573,0x5ea07b48,0x57049c06
	.word  0x29f29faf,0xb6edd640,0xb6dc2afb,0x7444d13c
	.word  0x6e8e8be9,0x8ea36501,0x58184fcf,0xffc8c07d
	.word  0xacb5cdf8,0x79cecc39,0x75c848f8,0xd7c9e8b7
	.word  0x90bbd9ae,0xae931469,0xed064afa,0x05be6f0a
	.word  0xa2676dbf,0xd39a6460,0xb52e8406,0xba414505
	.word  0x3c68fede,0xa50feb37,0x9e2c93cf,0x85631208
	.word  0x76dba84d,0xd608d61f,0xbb859f56,0xc8ddf16a
	.word  0x2ec4e65e,0xbc4aba1d,0x2b17e92d,0xa536720e
	.word  0xf85525c7,0x4b3e770d,0x2276f2c1,0x0b84e793
	.word  0x4641140f,0x19872592,0x210d21af,0x1a3ec4c0
	.word  0x02913fa2,0x8e9b325f,0xcc1436ca,0x5ac55dc1
	.word  0xe0822cd1,0x05534813,0x6b4602b3,0xd012ed9b
	.word  0xab27d4ba,0x5ba3bcf2,0xabed8a85,0xdd7f9e44
	.word  0x1190964d,0x60bd9a69,0xeefd6172,0x571e878a
	.word  0x85707c82,0x1bbac67c,0x011480fd,0x79f34463
	.word  0xbdf14994,0x1b4bc209,0x3d24b716,0x47c30154
	.word  0x696f393f,0xb90b66db,0xbcb9e177,0x529f4df5
	.word  0xedbb857f,0xede952e1,0x96270649,0x351113d2
	.word  0xb2c0991f,0x5d2e48cb,0x201bbc30,0x98a1794d
	.word  0xd6e3ef55,0xe98b21d5,0x3014ec95,0xfda46271
	.word  0x10ed37ff,0xcab07f41,0xdc35e37b,0xb0c893e1
	.word  0x56e369fb,0x6c82c581,0x63d14f9d,0xc839873d
	.word  0xe0702c2e,0xb457ee18,0x34bab99c,0x2d31a37e
	.word  0x01a254aa,0x2092dc68,0xff2b52f7,0x35bd9257
	.word  0xbd518e5d,0xb4877cfb,0x5d8cee30,0xe2449f64
	.word  0xd5ece9b8,0xcdbec00e,0x6b1cb9cc,0x70ee21df
	.word  0x3cb8dbd3,0xb2714fc7,0xe2e5144e,0xa58b2ad5
	.word  0x525d21d1,0xe6c44c37,0x83791961,0x7b4647ac
	.word  0x6e694fe0,0x3ea2b939,0x88505c92,0x71777f11
	.word  0x7c779f28,0xb95df4ea,0x69fc25d9,0xcfddad1a
	.word  0x30aa48a8,0x857a85b9,0x678747f3,0xf001f381
	.word  0x63d008ec,0x54987173,0x774748e6,0xdb73ffc9
	.word  0x997cf57b,0xccdc930c,0xce8f47d2,0x92807e69
	.word  0x9f040ce5,0xf3bcdad2,0x6a1a766f,0xc533cb70
	.word  0x8b6d86e0,0xb45fc76b,0xd29d318f,0x08478b5a
	.word  0xdefe73a5,0xe6de8f2c,0x80d077b7,0x2c96efad
	.word  0xc3069c6b,0xb624e9df,0x5ecae6b5,0x375260d4
	.word  0x2eaae0e2,0xee756e25,0xa3baeeec,0xedacf92c
	.word  0xa9ec14b6,0xc2b12ba8,0x051676e7,0xa6bff7e2
	.word  0x74af3c61,0xc9ae7b7a,0x2c6535db,0x38105afc
	.word  0xf003d649,0xbe0fd9ae,0x65cfa9a8,0x72bf1ba5
	.word  0x6957dc70,0xe10706de,0x6abd48a8,0x58082a48
	.word  0xe00ead8b,0x16d518cc,0x247a8f9c,0x0d7f87ca
	.word  0x12ea44ae,0x674cf606,0xb94bf906,0x45d03b16
	.word  0x911af3ca,0x71e84a66,0xf098203d,0x2bd09377
	.word  0x491459a2,0x588f1dab,0x69cf87c0,0xe35322f4
	.word  0x190d9826,0x0181c37e,0x54a6660b,0x46021fb1
	.word  0x6ad0ca7b,0xc60f9593,0x741b64fc,0xe82a5beb
	.word  0xff9c6a64,0xd86bda97,0x5c576e63,0xd2aa4387
	.word  0x38381be8,0x3f04a765,0x87af81ba,0x36aea479
	.word  0x7ca7c089,0xd456a0c6,0xa37883c0,0xd7f59c56
	.word  0x689653f8,0x237f5b23,0x3cc26eb1,0x4bf587d6
	.word  0x35899a72,0xdc2f15a7,0xd2ea5b3c,0xc5de96e5
	.word  0xb4ddca8a,0xe18c9694,0xfa9382bf,0x141adf8a
	.word  0xe29f8ee1,0x433d5bc6,0xb93a7e47,0xd00815c7
	.word  0x0b7eea51,0xba73d162,0xba4861b9,0x9c587644
	.word  0x73adc23e,0x79640ecb,0xa628a7cd,0xe94c0ef2
	.word  0x9dc10d30,0x23c7e710,0xf164963d,0x2cb62645
	.word  0x452767f0,0xbc45bbf3,0x0aca7e0a,0x4fb1c947
	.word  0x4d09f8f1,0xcb67d4fa,0x682b16a8,0xe084d6f3
	.word  0x284dad45,0x2e68eca6,0x63ddb0cc,0x224cadd7
	.word  0x9ea67504,0x7952df41,0x0eed0a1c,0xdca1b52e
	.word  0x8c49dccd,0xcf820002,0xed671fd0,0x9884587d
	.word  0x13e7ffaf,0x35fccd3f,0xfa3bef73,0xc53d7635
	.word  0x49975ff3,0x23052434,0x0b5c2d8b,0x96371a01
	.word  0xd98904b6,0xf0e5f53e,0x53536cd8,0xa3f43b9b
	.word  0x21b4482a,0x6864ae10,0x14229fcf,0xaf10907b
	.word  0x44f7da47,0x47611e0b,0xbe10b453,0x4b9e9185
	.word  0x73331427,0x6e5ca8bc,0x333b6bc1,0xb3c96803
	.word  0xf5c6a9d0,0x3314d35c,0xb21fbcf3,0x25489f82
	.word  0x464488dd,0x536905a8,0x5a67ff4a,0xf515d0bf
	.word  0x279c026a,0xff2074cf,0x849d946b,0x0c67055d
	.word  0x3e765d68,0x4c747aad,0x9ed9a38b,0xad393465
	.word  0x5e816425,0xf8de6bff,0xe80610fc,0xdaf5c2b3
	.word  0x9d3bed8a,0x874a6263,0xe9b8cf15,0xd4afef11
	.word  0xa7c733e7,0xc0436818,0x0820e3d3,0x6bfd085c
	.word  0x05ad77ad,0xcd5be543,0x13d791e2,0x49a7c329
	.word  0x5b364609,0xb80992f7,0xc2693a84,0xfaabaee7
	.word  0x1988aa02,0x51806583,0x8ee484a9,0x8a22d59a
	.word  0xdb428bba,0x69d023f3,0x5547a9be,0xd3582b93
	.word  0x071a8f05,0x19ea74b1,0xd5662d58,0xf03942ad
	.word  0xa724f4d8,0x9ba85ec4,0x32413ba3,0xd423c03c
	.word  0xa6677b90,0xfe24210f,0x9e081390,0x00e6ebf6
	.word  0xd86ef20a,0xe78d7872,0xbedaf84b,0x5a93aaab
	.word  0x8604c7af,0x6fb797d9,0x99f10730,0x72d44bd0
	.word  0xf3d0d1b9,0x4eb7046e,0x527375c4,0xeaafa484
	.word  0x9fb07ca9,0xcadfa862,0x214b0ea8,0x59d0db00
	.word  0x6be1c06e,0xee2370e7,0x67651971,0xbdbbf6bd
	.word  0xd31196b1,0xa48684d3,0x1787361b,0x4fa79a0e
	.word  0x1392e4d2,0x4b94ea5e,0xf6ca31b2,0x68054167
	.word  0x38d4134b,0xddb55366,0x5dd31b22,0x4ba14983
	.word  0x41320e4b,0xcd7fa823,0xf1df1e93,0x397b7cff
	.word  0x2ec41aeb,0x4ca5ab01,0x03c603b0,0xa98fe6b0
	.word  0x79764898,0x90a8465a,0x2983749d,0xf72eb5f3
	.word  0x2377726a,0x6f044501,0xfbc445bf,0xcbb24907
	.word  0x37a15ca5,0x0b21d74d,0xf3f027d5,0x210a1320
	.word  0x44b2236c,0xeaa28326,0xf9390aea,0x01598682
	.word  0xc6c1da3e,0x6c0808b9,0x8161320b,0xfb69cfba
	.word  0x2a740ab1,0x2614d651,0x0823ed09,0x57c4e3a1
	.word  0xfe94e529,0x8d3aed41,0xd68e75ae,0x8b6c83b4
	.word  0x066c7259,0x1b6971a9,0xc7d5f02c,0xdeff6620
	.word  0x263539cd,0xd06928aa,0x236d5a44,0x76597eef
	.word  0x6c8e40a7,0x383657b4,0xa3c8e53d,0x5548d952
	.word  0xa5c74064,0x68a2657e,0xe8ffc2a9,0x3d693ecc
	.word  0xd28ccbb2,0xb2d87bde,0xea780f47,0x3e74bd00
	.word  0x4180c6af,0x0a8b484e,0xfb5c5306,0xf187c7a1
	.word  0x8142c994,0x1815888f,0x532df565,0x79140193
	.word  0x84f59851,0xc562a96b,0x2270c3a9,0x860c5546
	.word  0x49c2ae50,0xb6fcde57,0x4c56140e,0x624381f0
	.word  0xe318880c,0xed712dd3,0x42a8572e,0x04e535f3
	.word  0x57b0450a,0x433d1b85,0x74235da0,0x9615011d
	.word  0x59e9ebad,0xc1cedc1b,0xd8b1edc5,0x83aca2e7
	.word  0x113db76a,0xac98caca,0xcc7982e0,0x089c69a2
	.word  0x7e5b035f,0x247908e3,0x101ae362,0xde285bc0
	.word  0x2b1fa87f,0xcfbdb98e,0x62b44b16,0xd6f5926a
	.word  0xc753944c,0x1880efa8,0x47afccea,0x335e99d7
	.word  0x565ce71e,0x5fbd571d,0x077a6990,0x517470a9
	.word  0xb78e726f,0x6343025f,0x4ccf0ba4,0xe233afd8
	.word  0x8150fb7a,0x32d297d4,0xe380f5a4,0x1f124fcc
	.word  0x49667b49,0x111fea01,0xa743e84f,0x81719b52
	.word  0x49e44e06,0xf506b8f0,0x21d10a85,0x29904070
	.word  0xada1df29,0xeb20be58,0x0e0b39fd,0xfdb77897
	.word  0x9de4598f,0xcc9b774e,0x5a85a036,0xcd7810d7
	.word  0x42d020d3,0x986a5b57,0xa606992e,0x1b2893e0
	.word  0x90cc6751,0x6fd72443,0x6563a1d7,0xcf9ba809
	.word  0xe8abc5d0,0x94e43345,0x993ca2ee,0xa50fa8b3
	.word  0xec2d6556,0x29868d2f,0xece4db1e,0xee956e8f
	.word  0x9d660a9e,0x296d3118,0x6bb8ac47,0x559a156a
	.word  0x7d002f80,0x75148d0b,0xa1fca41c,0xc385cf7f
	.word  0x0ef8037f,0x79dc68a9,0x1c05d267,0x5afad0b6
	.word  0x018927ce,0xdc06f217,0xf67a74c6,0x231e1555
	.word  0x851e07df,0x467e2bba,0x301dabcd,0xd6b81dfd
	.word  0x4775c6d0,0x3b265aca,0xdbe74758,0xec1eae06
	.word  0xb43c551c,0xaca7f799,0xa42afc69,0x5e7f05b0
	.word  0x81f9cd13,0x4076cd1b,0xd0dd0a9d,0xfebe676e
	.word  0x3f008252,0xa5da8b2d,0x8cd1f823,0xd501c711
	.word  0xfbeb5194,0xa76e8f7f,0x37096ba5,0xacf96e48
	.word  0xea372bf0,0xec918226,0x832df597,0xe36e3d01
	.word  0xf73b6d7d,0xb98c39cf,0x3b026aed,0xa3e0ef72
	.word  0x06102864,0x8a9c6cb0,0x3b504b56,0x494da3c3
	.word  0xb4ca01ab,0xe737592b,0x6ebaa16f,0xd4dcf40e
	.word  0x3f8f5904,0x8c640d67,0xd43a4fc3,0x27107937
	.word  0xd9f0fad2,0xb869134c,0x19136336,0x5282ccc2
	.word  0xe1d93733,0xb745fc66,0xfab16a11,0x8bce083c
	.word  0x1b42f09e,0x859a7108,0x315809a6,0xd7823be3
	.word  0x9876b71f,0xdf4069b0,0xf32a57a4,0x2a468b08
	.word  0xf432f5f0,0x42477a5c,0xf96f98a8,0x20ab67a5
	.word  0x66d73352,0x82628beb,0x1dfc3049,0x7dea0f75
	.word  0xa6d3b698,0x93c92c6c,0xc5fc9b8f,0x1271801a
	.word  0xa19942c3,0x50a757ae,0x82b98c92,0xb6f3617a
	.word  0x5c8720d6,0xe9c40bdf,0xb2e5760f,0x287a7f27
	.word  0x3c26cd32,0xa5f03239,0x337d53f3,0x930b917e

!!# /************************************************************
!!# *
!!# * File:         muls0.j
!!# *
!!# * Description:  Contention for mulider with stb raw and
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
!!#   IJ_set_rvar (muld_wt, "{10}");
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
!!# inst_type: stb_raw_alu_alu_alu_mul %rvar mrbw_wt
!!# 	   | ill_inst %rvar ill_wt
!!#            | mul %rvar muld_wt 
!!# {
!!#    IJ_generate ("th1:3", $1);
!!# }
!!# ;
!!# 
!!# ill_inst: mMETA0
!!# {
!!#    IJ_printf ("th", "\t.word 0x0\n");
!!# }
!!# ;
!!# 
!!# stb_raw_alu_alu_alu_mul: store load alu alu alu mul
!!# {
!!#    IJ_generate_va ("th0:2", $1, $2, $3, $4, $5, $6, NULL);
!!# }
!!# ;
!!# 
!!# store: tSTB_R | tSTH_R | tSTW_R | tSTX_R | tSTF_R | tSTDF_R
!!# ;
!!# 
!!# load: tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R | tLDD_R
!!# ;
!!# 
!!# alu: tADD_R | tADD_I | tADDcc_R | tADDcc_I | tADDC_R | tADDC_I | tADDCcc_R | tADDCcc_I | tAND_R | tAND_I | tANDcc_R | tANDcc_I | tANDN_R | tANDN_I | tANDNcc_R | tANDNcc_I | tOR_R | tOR_I | tORcc_R | tORcc_I | tORN_R | tORN_I | tORNcc_R | tORNcc_I | tXOR_R | tXOR_I | tXORcc_R | tXORcc_I | tXNOR_R | tXNOR_I | tXNORcc_R | tXNORcc_I | tMOVcc_R | tMOVcc_I | tMOVR_R | tMOVR_I | tSLL_R | tSLL_I | tSRL_R | tSRL_I | tSRA_R | tSRA_I | tSLLX_R | tSLLX_I | tSRLX_R | tSRLX_I | tSRAX_R | tSRAX_I | tSUB_R | tSUB_I | tSUBcc_R | tSUBcc_I | tSUBC_R | tSUBC_I | tSUBCcc_R | tSUBCcc_R | tSUBCcc_I
!!# ;
!!# 
!!# mul: tMULX_R | tMULX_I | tUMUL_R | tUMUL_I | tSMUL_R | tSMUL_I | tUMULcc_R | tUMULcc_I | tSMULcc_R | tSMULcc_I | tMULScc_R | tMULScc_I
!!# ;
!!# 
!! Token Generation Statistics
!! ---------------------------------
!! 
!! Rule   1 (line  112), Count:   500  inst_block           -> inst_type 
!! Rule   2 (line  113), Count:   500  inst_block           -> inst_block inst_type 
!! Rule   3 (line  116), Count:   363  inst_type            -> stb_raw_alu_alu_alu_mul 
!! Rule   4 (line  117), Count:     5  inst_type            -> ill_inst 
!! Rule   5 (line  118), Count:   130  inst_type            -> mul 
!! Rule   6 (line  124), Count:     5  ill_inst             -> mMETA0 
!! Rule   7 (line  130), Count:   363  stb_raw_alu_alu_alu_mul -> store load alu alu alu mul 
!! Rule   8 (line  136), Count:    15  store                -> tSTB_R 
!! Rule   9 (line  136), Count:    12  store                -> tSTH_R 
!! Rule  10 (line  136), Count:    11  store                -> tSTW_R 
!! Rule  11 (line  136), Count:    11  store                -> tSTX_R 
!! Rule  12 (line  136), Count:     8  store                -> tSTF_R 
!! Rule  13 (line  136), Count:    10  store                -> tSTDF_R 
!! Rule  14 (line  139), Count:     8  load                 -> tLDSB_R 
!! Rule  15 (line  139), Count:     7  load                 -> tLDSH_R 
!! Rule  16 (line  139), Count:     7  load                 -> tLDSW_R 
!! Rule  17 (line  139), Count:     8  load                 -> tLDUB_R 
!! Rule  18 (line  139), Count:     9  load                 -> tLDUH_R 
!! Rule  19 (line  139), Count:     3  load                 -> tLDUW_R 
!! Rule  20 (line  139), Count:    10  load                 -> tLDX_R 
!! Rule  21 (line  139), Count:    13  load                 -> tLDD_R 
!! Rule  22 (line  142), Count:     4  alu                  -> tADD_R 
!! Rule  23 (line  142), Count:     1  alu                  -> tADD_I 
!! Rule  24 (line  142), Count:     1  alu                  -> tADDcc_R 
!! Rule  25 (line  142), Count:     6  alu                  -> tADDcc_I 
!! Rule  26 (line  142), Count:     1  alu                  -> tADDC_R 
!! Rule  27 (line  142), Count:     5  alu                  -> tADDC_I 
!! Rule  28 (line  142), Count:     0  alu                  -> tADDCcc_R 
!! Rule  29 (line  142), Count:     4  alu                  -> tADDCcc_I 
!! Rule  30 (line  142), Count:     5  alu                  -> tAND_R 
!! Rule  31 (line  142), Count:     2  alu                  -> tAND_I 
!! Rule  32 (line  142), Count:     2  alu                  -> tANDcc_R 
!! Rule  33 (line  142), Count:     3  alu                  -> tANDcc_I 
!! Rule  34 (line  142), Count:     3  alu                  -> tANDN_R 
!! Rule  35 (line  142), Count:     0  alu                  -> tANDN_I 
!! Rule  36 (line  142), Count:     5  alu                  -> tANDNcc_R 
!! Rule  37 (line  142), Count:     1  alu                  -> tANDNcc_I 
!! Rule  38 (line  142), Count:     3  alu                  -> tOR_R 
!! Rule  39 (line  142), Count:     2  alu                  -> tOR_I 
!! Rule  40 (line  142), Count:     2  alu                  -> tORcc_R 
!! Rule  41 (line  142), Count:     9  alu                  -> tORcc_I 
!! Rule  42 (line  142), Count:     1  alu                  -> tORN_R 
!! Rule  43 (line  142), Count:     7  alu                  -> tORN_I 
!! Rule  44 (line  142), Count:     1  alu                  -> tORNcc_R 
!! Rule  45 (line  142), Count:     3  alu                  -> tORNcc_I 
!! Rule  46 (line  142), Count:     5  alu                  -> tXOR_R 
!! Rule  47 (line  142), Count:     3  alu                  -> tXOR_I 
!! Rule  48 (line  142), Count:     5  alu                  -> tXORcc_R 
!! Rule  49 (line  142), Count:     5  alu                  -> tXORcc_I 
!! Rule  50 (line  142), Count:     2  alu                  -> tXNOR_R 
!! Rule  51 (line  142), Count:     4  alu                  -> tXNOR_I 
!! Rule  52 (line  142), Count:     3  alu                  -> tXNORcc_R 
!! Rule  53 (line  142), Count:     2  alu                  -> tXNORcc_I 
!! Rule  54 (line  142), Count:     4  alu                  -> tMOVcc_R 
!! Rule  55 (line  142), Count:     5  alu                  -> tMOVcc_I 
!! Rule  56 (line  142), Count:     2  alu                  -> tMOVR_R 
!! Rule  57 (line  142), Count:     5  alu                  -> tMOVR_I 
!! Rule  58 (line  142), Count:     3  alu                  -> tSLL_R 
!! Rule  59 (line  142), Count:     3  alu                  -> tSLL_I 
!! Rule  61 (line  142), Count:     5  alu                  -> tSRL_I 
!! Rule  62 (line  142), Count:     3  alu                  -> tSRA_R 
!! Rule  63 (line  142), Count:     1  alu                  -> tSRA_I 
!! Rule  64 (line  142), Count:     2  alu                  -> tSLLX_R 
!! Rule  65 (line  142), Count:     1  alu                  -> tSLLX_I 
!! Rule  66 (line  142), Count:     1  alu                  -> tSRLX_R 
!! Rule  68 (line  142), Count:     2  alu                  -> tSRAX_R 
!! Rule  69 (line  142), Count:     5  alu                  -> tSRAX_I 
!! Rule  70 (line  142), Count:     2  alu                  -> tSUB_R 
!! Rule  71 (line  142), Count:     4  alu                  -> tSUB_I 
!! Rule  72 (line  142), Count:     1  alu                  -> tSUBcc_R 
!! Rule  73 (line  142), Count:     2  alu                  -> tSUBcc_I 
!! Rule  74 (line  142), Count:     2  alu                  -> tSUBC_R 
!! Rule  75 (line  142), Count:     5  alu                  -> tSUBC_I 
!! Rule  76 (line  142), Count:     3  alu                  -> tSUBCcc_R 
!! Rule  78 (line  142), Count:     3  alu                  -> tSUBCcc_I 
!! Rule  79 (line  145), Count:     6  mul                  -> tMULX_R 
!! Rule  80 (line  145), Count:     7  mul                  -> tMULX_I 
!! Rule  81 (line  145), Count:     8  mul                  -> tUMUL_R 
!! Rule  82 (line  145), Count:    12  mul                  -> tUMUL_I 
!! Rule  83 (line  145), Count:    12  mul                  -> tSMUL_R 
!! Rule  84 (line  145), Count:    12  mul                  -> tSMUL_I 
!! Rule  85 (line  145), Count:    11  mul                  -> tUMULcc_R 
!! Rule  86 (line  145), Count:    11  mul                  -> tUMULcc_I 
!! Rule  87 (line  145), Count:    10  mul                  -> tSMULcc_R 
!! Rule  88 (line  145), Count:    10  mul                  -> tSMULcc_I 
!! Rule  89 (line  145), Count:    13  mul                  -> tMULScc_R 
!! 
!!   257: Token mMETA0	Count = 6
!!   258: Token tSTB_R	Count = 16
!!   259: Token tSTH_R	Count = 13
!!   260: Token tSTW_R	Count = 12
!!   261: Token tSTX_R	Count = 12
!!   262: Token tSTF_R	Count = 9
!!   263: Token tSTDF_R	Count = 11
!!   264: Token tLDSB_R	Count = 9
!!   265: Token tLDSH_R	Count = 8
!!   266: Token tLDSW_R	Count = 8
!!   267: Token tLDUB_R	Count = 9
!!   268: Token tLDUH_R	Count = 10
!!   269: Token tLDUW_R	Count = 4
!!   270: Token tLDX_R	Count = 11
!!   271: Token tLDD_R	Count = 14
!!   272: Token tADD_R	Count = 5
!!   273: Token tADD_I	Count = 2
!!   274: Token tADDcc_R	Count = 2
!!   275: Token tADDcc_I	Count = 7
!!   276: Token tADDC_R	Count = 2
!!   277: Token tADDC_I	Count = 6
!!   278: Token tADDCcc_R	Count = 1
!!   279: Token tADDCcc_I	Count = 5
!!   280: Token tAND_R	Count = 6
!!   281: Token tAND_I	Count = 3
!!   282: Token tANDcc_R	Count = 3
!!   283: Token tANDcc_I	Count = 4
!!   284: Token tANDN_R	Count = 4
!!   285: Token tANDN_I	Count = 1
!!   286: Token tANDNcc_R	Count = 6
!!   287: Token tANDNcc_I	Count = 2
!!   288: Token tOR_R	Count = 4
!!   289: Token tOR_I	Count = 3
!!   290: Token tORcc_R	Count = 3
!!   291: Token tORcc_I	Count = 10
!!   292: Token tORN_R	Count = 2
!!   293: Token tORN_I	Count = 8
!!   294: Token tORNcc_R	Count = 2
!!   295: Token tORNcc_I	Count = 4
!!   296: Token tXOR_R	Count = 6
!!   297: Token tXOR_I	Count = 4
!!   298: Token tXORcc_R	Count = 6
!!   299: Token tXORcc_I	Count = 6
!!   300: Token tXNOR_R	Count = 3
!!   301: Token tXNOR_I	Count = 5
!!   302: Token tXNORcc_R	Count = 4
!!   303: Token tXNORcc_I	Count = 3
!!   304: Token tMOVcc_R	Count = 5
!!   305: Token tMOVcc_I	Count = 6
!!   306: Token tMOVR_R	Count = 3
!!   307: Token tMOVR_I	Count = 6
!!   308: Token tSLL_R	Count = 4
!!   309: Token tSLL_I	Count = 4
!!   310: Token tSRL_R	Count = 0
!!   311: Token tSRL_I	Count = 6
!!   312: Token tSRA_R	Count = 4
!!   313: Token tSRA_I	Count = 2
!!   314: Token tSLLX_R	Count = 3
!!   315: Token tSLLX_I	Count = 2
!!   316: Token tSRLX_R	Count = 2
!!   317: Token tSRLX_I	Count = 0
!!   318: Token tSRAX_R	Count = 3
!!   319: Token tSRAX_I	Count = 6
!!   320: Token tSUB_R	Count = 3
!!   321: Token tSUB_I	Count = 5
!!   322: Token tSUBcc_R	Count = 2
!!   323: Token tSUBcc_I	Count = 3
!!   324: Token tSUBC_R	Count = 3
!!   325: Token tSUBC_I	Count = 6
!!   326: Token tSUBCcc_R	Count = 4
!!   327: Token tSUBCcc_I	Count = 4
!!   328: Token tMULX_R	Count = 7
!!   329: Token tMULX_I	Count = 8
!!   330: Token tUMUL_R	Count = 9
!!   331: Token tUMUL_I	Count = 13
!!   332: Token tSMUL_R	Count = 13
!!   333: Token tSMUL_I	Count = 13
!!   334: Token tUMULcc_R	Count = 12
!!   335: Token tUMULcc_I	Count = 12
!!   336: Token tSMULcc_R	Count = 11
!!   337: Token tSMULcc_I	Count = 11
!!   338: Token tMULScc_R	Count = 14
!!   339: Token tMULScc_I	Count = 8
!! 
!! 
!! +++ finish +++

