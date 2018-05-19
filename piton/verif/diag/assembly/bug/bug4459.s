// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug4459.s
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
   random seed:	762969970
   Jal divd_mrbw.j:	
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
        setx  0x0000000000000c80, %g1, %r9
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
        setx  0x09e5d9ffbefdaa6a, %g1, %r0
        setx  0x2483af217744634c, %g1, %r1
        setx  0x097ef83e410eccca, %g1, %r2
        setx  0x780b24a5cd32bb65, %g1, %r3
        setx  0x3ec00c590f9bfd5c, %g1, %r4
        setx  0xafd135a02df1f141, %g1, %r5
        setx  0x555892c5e9a2e487, %g1, %r6
        setx  0xc532c318d825a229, %g1, %r7
        setx  0x9133b56fded416a1, %g1, %r10
        setx  0x3b62a972a711e8d5, %g1, %r11
        setx  0xa422cf25ed5d4768, %g1, %r12
        setx  0x001a8ad42edc8437, %g1, %r13
        setx  0xa12384c6fd6d0fff, %g1, %r14
        setx  0xc9b47974fa335d8c, %g1, %r15
        setx  0xa68e5316cf9852ac, %g1, %r16
        setx  0xd2e49b6269bb8ad8, %g1, %r17
        setx  0xc14c76a26bb5fbe0, %g1, %r18
        setx  0xb3d91206070b2729, %g1, %r19
        setx  0xb08a9e10a72cec9d, %g1, %r20
        setx  0x40998f3464141c1c, %g1, %r21
        setx  0x41f056ea9b97d7ef, %g1, %r22
        setx  0xc84709a4acb952b8, %g1, %r23
        setx  0x23536cd465c77012, %g1, %r24
        setx  0x21d03ea1f5853327, %g1, %r25
        setx  0x9862138a8a286392, %g1, %r26
        setx  0xb76ea8e2f4f5958e, %g1, %r27
        setx  0x28951e2af1e824d4, %g1, %r28
        setx  0x86b89574f6c7b5d7, %g1, %r29
        setx  0xabcf312955e3ab9a, %g1, %r30
        setx  0xccc95032c66ccc7a, %g1, %r31
	.word 0xcc2a0009  ! 15: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc2120009  ! 15: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0xab2a2001  ! 15: SLL_I	sll 	%r8, 0x0001, %r21
	.word 0x89321009  ! 15: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x8caa2cd8  ! 15: ANDNcc_I	andncc 	%r8, 0x0cd8, %r6
	.word 0x8e6a289c  ! 15: UDIVX_I	udivx 	%r8, 0x089c, %r7
	.word 0xdf220009  ! 24: STF_R	st	%f15, [%r9, %r8]
	.word 0xc2420009  ! 24: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0xa2b22170  ! 24: SUBCcc_I	orncc 	%r8, 0x0170, %r17
	.word 0x842a0009  ! 24: ANDN_R	andn 	%r8, %r9, %r2
	.word 0x85641809  ! 24: MOVcc_R	<illegal instruction>
	.word 0x84722ce0  ! 24: UDIV_I	udiv 	%r8, 0x0ce0, %r2
	.word 0xd8220009  ! 30: STW_R	stw	%r12, [%r8 + %r9]
	.word 0xde4a0009  ! 30: LDSB_R	ldsb	[%r8 + %r9], %r15
	.word 0x880a0009  ! 30: AND_R	and 	%r8, %r9, %r4
	.word 0x892a3001  ! 30: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0xa5782401  ! 30: MOVR_I	move	%r0, 0x1, %r18
	.word 0x836a269c  ! 30: SDIVX_I	sdivx	%r8, 0x069c, %r1
	.word 0xc93a0009  ! 37: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe60a0009  ! 37: LDUB_R	ldub	[%r8 + %r9], %r19
	.word 0x9f320009  ! 37: SRL_R	srl 	%r8, %r9, %r15
	.word 0x8e922354  ! 37: ORcc_I	orcc 	%r8, 0x0354, %r7
	.word 0x8f320009  ! 37: SRL_R	srl 	%r8, %r9, %r7
	.word 0x82fa28bc  ! 37: SDIVcc_I	sdivcc 	%r8, 0x08bc, %r1
	.word 0xed220009  ! 45: STF_R	st	%f22, [%r9, %r8]
	.word 0xc40a0009  ! 45: LDUB_R	ldub	[%r8 + %r9], %r2
	.word 0x84b20009  ! 45: ORNcc_R	orncc 	%r8, %r9, %r2
	.word 0x8c422590  ! 45: ADDC_I	addc 	%r8, 0x0590, %r6
	.word 0x820a0009  ! 45: AND_R	and 	%r8, %r9, %r1
	.word 0xb6720009  ! 45: UDIV_R	udiv 	%r8, %r9, %r27
	.word 0xcd220009  ! 54: STF_R	st	%f6, [%r9, %r8]
	.word 0xd41a0009  ! 54: LDD_R	ldd	[%r8 + %r9], %r10
	.word 0xb0b20009  ! 54: ORNcc_R	orncc 	%r8, %r9, %r24
	.word 0x8632298c  ! 54: ORN_I	orn 	%r8, 0x098c, %r3
	.word 0x8c422000  ! 54: ADDC_I	addc 	%r8, 0x0000, %r6
	.word 0x836a0009  ! 54: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0xee320009  ! 61: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xc24a0009  ! 61: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0x8e92268c  ! 61: ORcc_I	orcc 	%r8, 0x068c, %r7
	.word 0x9c822570  ! 61: ADDcc_I	addcc 	%r8, 0x0570, %r14
	.word 0x832a3001  ! 61: SLLX_I	sllx	%r8, 0x0001, %r1
	.word 0x84fa0009  ! 61: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xcc320009  ! 67: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xf65a0009  ! 67: LDX_R	ldx	[%r8 + %r9], %r27
	.word 0x889a2830  ! 67: XORcc_I	xorcc 	%r8, 0x0830, %r4
	.word 0x862a0009  ! 67: ANDN_R	andn 	%r8, %r9, %r3
	.word 0x98322538  ! 67: ORN_I	orn 	%r8, 0x0538, %r12
	.word 0x9a6a0009  ! 67: UDIVX_R	udivx 	%r8, %r9, %r13
	.word 0xef3a0009  ! 73: STDF_R	std	%f23, [%r9, %r8]
	.word 0xc41a0009  ! 73: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x9b2a0009  ! 73: SLL_R	sll 	%r8, %r9, %r13
	.word 0x8d3a1009  ! 73: SRAX_R	srax	%r8, %r9, %r6
	.word 0xbe220009  ! 73: SUB_R	sub 	%r8, %r9, %r31
	.word 0x8a720009  ! 73: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0x0
	.word 0xc62a0009  ! 81: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe85a0009  ! 81: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0xab321009  ! 81: SRLX_R	srlx	%r8, %r9, %r21
	.word 0xb32a3001  ! 81: SLLX_I	sllx	%r8, 0x0001, %r25
	.word 0x8a9a20d0  ! 81: XORcc_I	xorcc 	%r8, 0x00d0, %r5
	.word 0x8a7a2758  ! 81: SDIV_I	sdiv 	%r8, 0x0758, %r5
	.word 0xc4320009  ! 87: STH_R	sth	%r2, [%r8 + %r9]
	.word 0xd6520009  ! 87: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0x8aa22ca4  ! 87: SUBcc_I	subcc 	%r8, 0x0ca4, %r5
	.word 0x848a2e4c  ! 87: ANDcc_I	andcc 	%r8, 0x0e4c, %r2
	.word 0x8b2a1009  ! 87: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x9ef22de0  ! 87: UDIVcc_I	udivcc 	%r8, 0x0de0, %r15
	.word 0xcf3a0009  ! 95: STDF_R	std	%f7, [%r9, %r8]
	.word 0xce5a0009  ! 95: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8ac20009  ! 95: ADDCcc_R	addccc 	%r8, %r9, %r5
	.word 0x98322d3c  ! 95: SUBC_I	orn 	%r8, 0x0d3c, %r12
	.word 0xbcaa2000  ! 95: ANDNcc_I	andncc 	%r8, 0x0000, %r30
	.word 0x896a2d94  ! 95: SDIVX_I	sdivx	%r8, 0x0d94, %r4
	.word 0xc33a0009  ! 102: STDF_R	std	%f1, [%r9, %r8]
	.word 0xc8420009  ! 102: LDSW_R	ldsw	[%r8 + %r9], %r4
	.word 0x992a3001  ! 102: SLLX_I	sllx	%r8, 0x0001, %r12
	.word 0x8e020009  ! 102: ADD_R	add 	%r8, %r9, %r7
	.word 0x86422d98  ! 102: ADDC_I	addc 	%r8, 0x0d98, %r3
	.word 0x8c720009  ! 102: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xc22a0009  ! 108: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xdc520009  ! 108: LDSH_R	ldsh	[%r8 + %r9], %r14
	.word 0x89641809  ! 108: MOVcc_R	<illegal instruction>
	.word 0x86222fac  ! 108: SUB_I	sub 	%r8, 0x0fac, %r3
	.word 0x8cc20009  ! 108: ADDCcc_R	addccc 	%r8, %r9, %r6
	.word 0x88f2235c  ! 108: UDIVcc_I	udivcc 	%r8, 0x035c, %r4
	.word 0xed220009  ! 114: STF_R	st	%f22, [%r9, %r8]
	.word 0xc8120009  ! 114: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x969a0009  ! 114: XORcc_R	xorcc 	%r8, %r9, %r11
	.word 0x840a26bc  ! 114: AND_I	and 	%r8, 0x06bc, %r2
	.word 0xb09a28dc  ! 114: XORcc_I	xorcc 	%r8, 0x08dc, %r24
	.word 0x8e7a0009  ! 114: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xc6720009  ! 123: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xd6520009  ! 123: LDSH_R	ldsh	[%r8 + %r9], %r11
	.word 0xab3a3001  ! 123: SRAX_I	srax	%r8, 0x0001, %r21
	.word 0x83320009  ! 123: SRL_R	srl 	%r8, %r9, %r1
	.word 0x822226e8  ! 123: SUB_I	sub 	%r8, 0x06e8, %r1
	.word 0x84fa0009  ! 123: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xce220009  ! 130: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 130: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x869a21a8  ! 130: XORcc_I	xorcc 	%r8, 0x01a8, %r3
	.word 0xb92a0009  ! 130: SLL_R	sll 	%r8, %r9, %r28
	.word 0x8a122e34  ! 130: OR_I	or 	%r8, 0x0e34, %r5
	.word 0x88f20009  ! 130: UDIVcc_R	udivcc 	%r8, %r9, %r4
	.word 0xca720009  ! 136: STX_R	stx	%r5, [%r8 + %r9]
	.word 0xca420009  ! 136: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x892a3001  ! 136: SLLX_I	sllx	%r8, 0x0001, %r4
	.word 0xb0a229dc  ! 136: SUBcc_I	subcc 	%r8, 0x09dc, %r24
	.word 0x86aa0009  ! 136: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x88fa2f30  ! 136: SDIVcc_I	sdivcc 	%r8, 0x0f30, %r4
	.word 0xce320009  ! 142: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xce020009  ! 142: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8b782401  ! 142: MOVR_I	move	%r0, 0x401, %r5
	.word 0xb5320009  ! 142: SRL_R	srl 	%r8, %r9, %r26
	.word 0x943a0009  ! 142: XNOR_R	xnor 	%r8, %r9, %r10
	.word 0xb6f20009  ! 142: UDIVcc_R	udivcc 	%r8, %r9, %r27
	.word 0xf82a0009  ! 148: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xc85a0009  ! 148: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xaf2a2001  ! 148: SLL_I	sll 	%r8, 0x0001, %r23
	.word 0x8b2a2001  ! 148: SLL_I	sll 	%r8, 0x0001, %r5
	.word 0x8e9a2c90  ! 148: XORcc_I	xorcc 	%r8, 0x0c90, %r7
	.word 0x82f20009  ! 148: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xdc220009  ! 154: STW_R	stw	%r14, [%r8 + %r9]
	.word 0xc4520009  ! 154: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x89323001  ! 154: SRLX_I	srlx	%r8, 0x0001, %r4
	.word 0x86322bdc  ! 154: ORN_I	orn 	%r8, 0x0bdc, %r3
	.word 0x9c1a0009  ! 154: XOR_R	xor 	%r8, %r9, %r14
	.word 0x8cf225d8  ! 154: UDIVcc_I	udivcc 	%r8, 0x05d8, %r6
	.word 0xc82a0009  ! 162: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xca020009  ! 162: LDUW_R	lduw	[%r8 + %r9], %r5
	.word 0x820a2234  ! 162: AND_I	and 	%r8, 0x0234, %r1
	.word 0x86b22934  ! 162: SUBCcc_I	orncc 	%r8, 0x0934, %r3
	.word 0x8a420009  ! 162: ADDC_R	addc 	%r8, %r9, %r5
	.word 0x86fa0009  ! 162: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0xcd3a0009  ! 168: STDF_R	std	%f6, [%r9, %r8]
	.word 0xc4420009  ! 168: LDSW_R	ldsw	[%r8 + %r9], %r2
	.word 0xb08a0009  ! 168: ANDcc_R	andcc 	%r8, %r9, %r24
	.word 0x849a28d4  ! 168: XORcc_I	xorcc 	%r8, 0x08d4, %r2
	.word 0xae220009  ! 168: SUB_R	sub 	%r8, %r9, %r23
	.word 0x8f6a21ec  ! 168: SDIVX_I	sdivx	%r8, 0x01ec, %r7
	.word 0xe8220009  ! 175: STW_R	stw	%r20, [%r8 + %r9]
	.word 0xce020009  ! 175: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8e322c8c  ! 175: SUBC_I	orn 	%r8, 0x0c8c, %r7
	.word 0x873a1009  ! 175: SRAX_R	srax	%r8, %r9, %r3
	.word 0x84220009  ! 175: SUB_R	sub 	%r8, %r9, %r2
	.word 0x8efa2ed8  ! 175: SDIVcc_I	sdivcc 	%r8, 0x0ed8, %r7
	.word 0xea320009  ! 181: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xfc420009  ! 181: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x83643801  ! 181: MOVcc_I	<illegal instruction>
	.word 0xa8aa0009  ! 181: ANDNcc_R	andncc 	%r8, %r9, %r20
	.word 0x848a0009  ! 181: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0x8cfa0009  ! 181: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xf6320009  ! 187: STH_R	sth	%r27, [%r8 + %r9]
	.word 0xc6120009  ! 187: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x86ba2808  ! 187: XNORcc_I	xnorcc 	%r8, 0x0808, %r3
	.word 0x9cc22e94  ! 187: ADDCcc_I	addccc 	%r8, 0x0e94, %r14
	.word 0x8e8223ec  ! 187: ADDcc_I	addcc 	%r8, 0x03ec, %r7
	.word 0x8c7a2d60  ! 187: SDIV_I	sdiv 	%r8, 0x0d60, %r6
	.word 0xc4720009  ! 194: STX_R	stx	%r2, [%r8 + %r9]
	.word 0xc85a0009  ! 194: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x983229a0  ! 194: ORN_I	orn 	%r8, 0x09a0, %r12
	.word 0x86b20009  ! 194: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0x84822504  ! 194: ADDcc_I	addcc 	%r8, 0x0504, %r2
	.word 0x8a722b58  ! 194: UDIV_I	udiv 	%r8, 0x0b58, %r5
	.word 0xcb3a0009  ! 200: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc41a0009  ! 200: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x8ea20009  ! 200: SUBcc_R	subcc 	%r8, %r9, %r7
	.word 0x853a2001  ! 200: SRA_I	sra 	%r8, 0x0001, %r2
	.word 0xa4320009  ! 200: SUBC_R	orn 	%r8, %r9, %r18
	.word 0x827226ac  ! 200: UDIV_I	udiv 	%r8, 0x06ac, %r1
	.word 0xc6320009  ! 206: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc41a0009  ! 206: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0x98b2281c  ! 206: SUBCcc_I	orncc 	%r8, 0x081c, %r12
	.word 0x852a3001  ! 206: SLLX_I	sllx	%r8, 0x0001, %r2
	.word 0x8f2a3001  ! 206: SLLX_I	sllx	%r8, 0x0001, %r7
	.word 0x86f22e34  ! 206: UDIVcc_I	udivcc 	%r8, 0x0e34, %r3
	.word 0xc9220009  ! 212: STF_R	st	%f4, [%r9, %r8]
	.word 0xfc1a0009  ! 212: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xaf2a3001  ! 212: SLLX_I	sllx	%r8, 0x0001, %r23
	.word 0x82020009  ! 212: ADD_R	add 	%r8, %r9, %r1
	.word 0x9f641809  ! 212: MOVcc_R	<illegal instruction>
	.word 0x847a2410  ! 212: SDIV_I	sdiv 	%r8, 0x0410, %r2
	.word 0xcb220009  ! 218: STF_R	st	%f5, [%r9, %r8]
	.word 0xe44a0009  ! 218: LDSB_R	ldsb	[%r8 + %r9], %r18
	.word 0xb1780409  ! 218: MOVR_R	move	%r0, %r9, %r24
	.word 0x87322001  ! 218: SRL_I	srl 	%r8, 0x0001, %r3
	.word 0x83641809  ! 218: MOVcc_R	<illegal instruction>
	.word 0xb26a2398  ! 218: UDIVX_I	udivx 	%r8, 0x0398, %r25
	.word 0xe2220009  ! 226: STW_R	stw	%r17, [%r8 + %r9]
	.word 0xf44a0009  ! 226: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0xa7782401  ! 226: MOVR_I	move	%r0, 0x401, %r19
	.word 0x8c020009  ! 226: ADD_R	add 	%r8, %r9, %r6
	.word 0x8c8a0009  ! 226: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0x86f20009  ! 226: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0xc8220009  ! 232: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xf64a0009  ! 232: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0xa3320009  ! 232: SRL_R	srl 	%r8, %r9, %r17
	.word 0xac4224e4  ! 232: ADDC_I	addc 	%r8, 0x04e4, %r22
	.word 0xa8aa0009  ! 232: ANDNcc_R	andncc 	%r8, %r9, %r20
	.word 0x8f6a2088  ! 232: SDIVX_I	sdivx	%r8, 0x0088, %r7
	.word 0x0
	.word 0xea2a0009  ! 242: STB_R	stb	%r21, [%r8 + %r9]
	.word 0xc2420009  ! 242: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x853a1009  ! 242: SRAX_R	srax	%r8, %r9, %r2
	.word 0xb53a1009  ! 242: SRAX_R	srax	%r8, %r9, %r26
	.word 0x852a0009  ! 242: SLL_R	sll 	%r8, %r9, %r2
	.word 0x8a7a2d9c  ! 242: SDIV_I	sdiv 	%r8, 0x0d9c, %r5
	.word 0xce320009  ! 248: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xf01a0009  ! 248: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x832a1009  ! 248: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x8e422528  ! 248: ADDC_I	addc 	%r8, 0x0528, %r7
	.word 0x8e922e64  ! 248: ORcc_I	orcc 	%r8, 0x0e64, %r7
	.word 0x8c6a2b20  ! 248: UDIVX_I	udivx 	%r8, 0x0b20, %r6
	.word 0xcd220009  ! 255: STF_R	st	%f6, [%r9, %r8]
	.word 0xe85a0009  ! 255: LDX_R	ldx	[%r8 + %r9], %r20
	.word 0x9ab20009  ! 255: SUBCcc_R	orncc 	%r8, %r9, %r13
	.word 0x88020009  ! 255: ADD_R	add 	%r8, %r9, %r4
	.word 0x8b2a1009  ! 255: SLLX_R	sllx	%r8, %r9, %r5
	.word 0x987a0009  ! 255: SDIV_R	sdiv 	%r8, %r9, %r12
	.word 0xc2320009  ! 262: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xf64a0009  ! 262: LDSB_R	ldsb	[%r8 + %r9], %r27
	.word 0x860a2a44  ! 262: AND_I	and 	%r8, 0x0a44, %r3
	.word 0x84c20009  ! 262: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x873a0009  ! 262: SRA_R	sra 	%r8, %r9, %r3
	.word 0x8ef223e4  ! 262: UDIVcc_I	udivcc 	%r8, 0x03e4, %r7
	.word 0x0
	.word 0xc2320009  ! 269: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc2420009  ! 269: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x9f321009  ! 269: SRLX_R	srlx	%r8, %r9, %r15
	.word 0x9cba0009  ! 269: XNORcc_R	xnorcc 	%r8, %r9, %r14
	.word 0x9c8a0009  ! 269: ANDcc_R	andcc 	%r8, %r9, %r14
	.word 0x8cf20009  ! 269: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xc53a0009  ! 278: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf44a0009  ! 278: LDSB_R	ldsb	[%r8 + %r9], %r26
	.word 0x840a286c  ! 278: AND_I	and 	%r8, 0x086c, %r2
	.word 0x863a258c  ! 278: XNOR_I	xnor 	%r8, 0x058c, %r3
	.word 0x8a3a257c  ! 278: XNOR_I	xnor 	%r8, 0x057c, %r5
	.word 0xbcf20009  ! 278: UDIVcc_R	udivcc 	%r8, %r9, %r30
	.word 0xec320009  ! 285: STH_R	sth	%r22, [%r8 + %r9]
	.word 0xf41a0009  ! 285: LDD_R	ldd	[%r8 + %r9], %r26
	.word 0x8a122c58  ! 285: OR_I	or 	%r8, 0x0c58, %r5
	.word 0x861a0009  ! 285: XOR_R	xor 	%r8, %r9, %r3
	.word 0x8482258c  ! 285: ADDcc_I	addcc 	%r8, 0x058c, %r2
	.word 0x8c6a2cec  ! 285: UDIVX_I	udivx 	%r8, 0x0cec, %r6
	.word 0xfe320009  ! 294: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xca4a0009  ! 294: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x948a0009  ! 294: ANDcc_R	andcc 	%r8, %r9, %r10
	.word 0xb1782401  ! 294: MOVR_I	move	%r0, 0x9, %r24
	.word 0x88c22f24  ! 294: ADDCcc_I	addccc 	%r8, 0x0f24, %r4
	.word 0x84722610  ! 294: UDIV_I	udiv 	%r8, 0x0610, %r2
	.word 0xc4220009  ! 300: STW_R	stw	%r2, [%r8 + %r9]
	.word 0xfe0a0009  ! 300: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0x873a1009  ! 300: SRAX_R	srax	%r8, %r9, %r3
	.word 0x873a1009  ! 300: SRAX_R	srax	%r8, %r9, %r3
	.word 0x8832275c  ! 300: ORN_I	orn 	%r8, 0x075c, %r4
	.word 0xb2720009  ! 300: UDIV_R	udiv 	%r8, %r9, %r25
	.word 0xc5220009  ! 306: STF_R	st	%f2, [%r9, %r8]
	.word 0xde420009  ! 306: LDSW_R	ldsw	[%r8 + %r9], %r15
	.word 0x8c0a25c0  ! 306: AND_I	and 	%r8, 0x05c0, %r6
	.word 0x9e8a0009  ! 306: ANDcc_R	andcc 	%r8, %r9, %r15
	.word 0x9e320009  ! 306: SUBC_R	orn 	%r8, %r9, %r15
	.word 0x88f22688  ! 306: UDIVcc_I	udivcc 	%r8, 0x0688, %r4
	.word 0xf82a0009  ! 314: STB_R	stb	%r28, [%r8 + %r9]
	.word 0xce4a0009  ! 314: LDSB_R	ldsb	[%r8 + %r9], %r7
	.word 0x85782401  ! 314: MOVR_I	move	%r0, 0x401, %r2
	.word 0x893a1009  ! 314: SRAX_R	srax	%r8, %r9, %r4
	.word 0x8e120009  ! 314: OR_R	or 	%r8, %r9, %r7
	.word 0xb46a0009  ! 314: UDIVX_R	udivx 	%r8, %r9, %r26
	.word 0xca220009  ! 320: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc120009  ! 320: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x9a022e28  ! 320: ADD_I	add 	%r8, 0x0e28, %r13
	.word 0x88a20009  ! 320: SUBcc_R	subcc 	%r8, %r9, %r4
	.word 0xa68a2174  ! 320: ANDcc_I	andcc 	%r8, 0x0174, %r19
	.word 0xae7a0009  ! 320: SDIV_R	sdiv 	%r8, %r9, %r23
	.word 0xc42a0009  ! 326: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc2520009  ! 326: LDSH_R	ldsh	[%r8 + %r9], %r1
	.word 0x85643801  ! 326: MOVcc_I	<illegal instruction>
	.word 0x8a120009  ! 326: OR_R	or 	%r8, %r9, %r5
	.word 0x828a22b4  ! 326: ANDcc_I	andcc 	%r8, 0x02b4, %r1
	.word 0x86f22110  ! 326: UDIVcc_I	udivcc 	%r8, 0x0110, %r3
	.word 0xdb220009  ! 332: STF_R	st	%f13, [%r9, %r8]
	.word 0xea4a0009  ! 332: LDSB_R	ldsb	[%r8 + %r9], %r21
	.word 0x8c8a0009  ! 332: ANDcc_R	andcc 	%r8, %r9, %r6
	.word 0x83321009  ! 332: SRLX_R	srlx	%r8, %r9, %r1
	.word 0x8cb22be0  ! 332: ORNcc_I	orncc 	%r8, 0x0be0, %r6
	.word 0xa27a0009  ! 332: SDIV_R	sdiv 	%r8, %r9, %r17
	.word 0xcc2a0009  ! 340: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xec4a0009  ! 340: LDSB_R	ldsb	[%r8 + %r9], %r22
	.word 0xbf321009  ! 340: SRLX_R	srlx	%r8, %r9, %r31
	.word 0x85323001  ! 340: SRLX_I	srlx	%r8, 0x0001, %r2
	.word 0x9a2a2670  ! 340: ANDN_I	andn 	%r8, 0x0670, %r13
	.word 0x856a2be0  ! 340: SDIVX_I	sdivx	%r8, 0x0be0, %r2
	.word 0xc42a0009  ! 346: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xcc5a0009  ! 346: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x832a2001  ! 346: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0x8f3a0009  ! 346: SRA_R	sra 	%r8, %r9, %r7
	.word 0x8b643801  ! 346: MOVcc_I	<illegal instruction>
	.word 0x846a2aa4  ! 346: UDIVX_I	udivx 	%r8, 0x0aa4, %r2
	.word 0xec220009  ! 355: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xd64a0009  ! 355: LDSB_R	ldsb	[%r8 + %r9], %r11
	.word 0x8aa22b54  ! 355: SUBcc_I	subcc 	%r8, 0x0b54, %r5
	.word 0x84ba0009  ! 355: XNORcc_R	xnorcc 	%r8, %r9, %r2
	.word 0x88b20009  ! 355: SUBCcc_R	orncc 	%r8, %r9, %r4
	.word 0x856a0009  ! 355: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xe4220009  ! 366: STW_R	stw	%r18, [%r8 + %r9]
	.word 0xc41a0009  ! 366: LDD_R	ldd	[%r8 + %r9], %r2
	.word 0xa89a23cc  ! 366: XORcc_I	xorcc 	%r8, 0x03cc, %r20
	.word 0x89780409  ! 366: MOVR_R	move	%r0, %r9, %r4
	.word 0x8a1a0009  ! 366: XOR_R	xor 	%r8, %r9, %r5
	.word 0x896a2750  ! 366: SDIVX_I	sdivx	%r8, 0x0750, %r4
	.word 0xc62a0009  ! 372: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe24a0009  ! 372: LDSB_R	ldsb	[%r8 + %r9], %r17
	.word 0xbf3a3001  ! 372: SRAX_I	srax	%r8, 0x0001, %r31
	.word 0x832a2001  ! 372: SLL_I	sll 	%r8, 0x0001, %r1
	.word 0xb89a0009  ! 372: XORcc_R	xorcc 	%r8, %r9, %r28
	.word 0x88720009  ! 372: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xc33a0009  ! 379: STDF_R	std	%f1, [%r9, %r8]
	.word 0xfc0a0009  ! 379: LDUB_R	ldub	[%r8 + %r9], %r30
	.word 0x8b643801  ! 379: MOVcc_I	<illegal instruction>
	.word 0xbe2a0009  ! 379: ANDN_R	andn 	%r8, %r9, %r31
	.word 0x8b641809  ! 379: MOVcc_R	<illegal instruction>
	.word 0x827a0009  ! 379: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0xc22a0009  ! 385: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xf25a0009  ! 385: LDX_R	ldx	[%r8 + %r9], %r25
	.word 0x82420009  ! 385: ADDC_R	addc 	%r8, %r9, %r1
	.word 0x86aa0009  ! 385: ANDNcc_R	andncc 	%r8, %r9, %r3
	.word 0x8a122fe8  ! 385: OR_I	or 	%r8, 0x0fe8, %r5
	.word 0x88720009  ! 385: UDIV_R	udiv 	%r8, %r9, %r4
	.word 0xcc2a0009  ! 391: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 391: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x993a1009  ! 391: SRAX_R	srax	%r8, %r9, %r12
	.word 0xb69a0009  ! 391: XORcc_R	xorcc 	%r8, %r9, %r27
	.word 0x892a2001  ! 391: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0x8e720009  ! 391: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc2320009  ! 397: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc4020009  ! 397: LDUW_R	lduw	[%r8 + %r9], %r2
	.word 0xb8ba2b10  ! 397: XNORcc_I	xnorcc 	%r8, 0x0b10, %r28
	.word 0x8eb227e8  ! 397: SUBCcc_I	orncc 	%r8, 0x07e8, %r7
	.word 0x893a3001  ! 397: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0xacfa0009  ! 397: SDIVcc_R	sdivcc 	%r8, %r9, %r22
	.word 0xc6320009  ! 404: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xc65a0009  ! 404: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0xbf320009  ! 404: SRL_R	srl 	%r8, %r9, %r31
	.word 0x94a20009  ! 404: SUBcc_R	subcc 	%r8, %r9, %r10
	.word 0x8e220009  ! 404: SUB_R	sub 	%r8, %r9, %r7
	.word 0x827a2fa0  ! 404: SDIV_I	sdiv 	%r8, 0x0fa0, %r1
	.word 0xca220009  ! 410: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 410: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x8cb20009  ! 410: ORNcc_R	orncc 	%r8, %r9, %r6
	.word 0xa53a2001  ! 410: SRA_I	sra 	%r8, 0x0001, %r18
	.word 0x829a0009  ! 410: XORcc_R	xorcc 	%r8, %r9, %r1
	.word 0xa47a0009  ! 410: SDIV_R	sdiv 	%r8, %r9, %r18
	.word 0xc5220009  ! 417: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc5a0009  ! 417: LDX_R	ldx	[%r8 + %r9], %r6
	.word 0x8e2a0009  ! 417: ANDN_R	andn 	%r8, %r9, %r7
	.word 0xb1641809  ! 417: MOVcc_R	<illegal instruction>
	.word 0x8c122198  ! 417: OR_I	or 	%r8, 0x0198, %r6
	.word 0xae6a0009  ! 417: UDIVX_R	udivx 	%r8, %r9, %r23
	.word 0xc3220009  ! 423: STF_R	st	%f1, [%r9, %r8]
	.word 0xc4520009  ! 423: LDSH_R	ldsh	[%r8 + %r9], %r2
	.word 0x82320009  ! 423: ORN_R	orn 	%r8, %r9, %r1
	.word 0x8e8229c8  ! 423: ADDcc_I	addcc 	%r8, 0x09c8, %r7
	.word 0x8f641809  ! 423: MOVcc_R	<illegal instruction>
	.word 0x876a0009  ! 423: SDIVX_R	sdivx	%r8, %r9, %r3
	.word 0x0
	.word 0xca2a0009  ! 430: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 430: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8e1a204c  ! 430: XOR_I	xor 	%r8, 0x004c, %r7
	.word 0x832a3001  ! 430: SLLX_I	sllx	%r8, 0x0001, %r1
	.word 0xb41a2420  ! 430: XOR_I	xor 	%r8, 0x0420, %r26
	.word 0x8cfa2874  ! 430: SDIVcc_I	sdivcc 	%r8, 0x0874, %r6
	.word 0xc53a0009  ! 437: STDF_R	std	%f2, [%r9, %r8]
	.word 0xf45a0009  ! 437: LDX_R	ldx	[%r8 + %r9], %r26
	.word 0x96ba0009  ! 437: XNORcc_R	xnorcc 	%r8, %r9, %r11
	.word 0x8a320009  ! 437: ORN_R	orn 	%r8, %r9, %r5
	.word 0x97643801  ! 437: MOVcc_I	<illegal instruction>
	.word 0x86f22730  ! 437: UDIVcc_I	udivcc 	%r8, 0x0730, %r3
	.word 0xc82a0009  ! 443: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc8120009  ! 443: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0x8a220009  ! 443: SUB_R	sub 	%r8, %r9, %r5
	.word 0x868a295c  ! 443: ANDcc_I	andcc 	%r8, 0x095c, %r3
	.word 0xb5782401  ! 443: MOVR_I	move	%r0, 0x540, %r26
	.word 0xb07a0009  ! 443: SDIV_R	sdiv 	%r8, %r9, %r24
	.word 0xd6320009  ! 451: STH_R	sth	%r11, [%r8 + %r9]
	.word 0xc2120009  ! 451: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x86820009  ! 451: ADDcc_R	addcc 	%r8, %r9, %r3
	.word 0x8c322b14  ! 451: SUBC_I	orn 	%r8, 0x0b14, %r6
	.word 0x86c20009  ! 451: ADDCcc_R	addccc 	%r8, %r9, %r3
	.word 0x86f22014  ! 451: UDIVcc_I	udivcc 	%r8, 0x0014, %r3
	.word 0xcd3a0009  ! 457: STDF_R	std	%f6, [%r9, %r8]
	.word 0xfa020009  ! 457: LDUW_R	lduw	[%r8 + %r9], %r29
	.word 0x86320009  ! 457: ORN_R	orn 	%r8, %r9, %r3
	.word 0xb8b20009  ! 457: ORNcc_R	orncc 	%r8, %r9, %r28
	.word 0x84120009  ! 457: OR_R	or 	%r8, %r9, %r2
	.word 0xb56a2498  ! 457: SDIVX_I	sdivx	%r8, 0x0498, %r26
	.word 0xc22a0009  ! 463: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xc01a0009  ! 463: LDD_R	ldd	[%r8 + %r9], %r0
	.word 0x823a298c  ! 463: XNOR_I	xnor 	%r8, 0x098c, %r1
	.word 0x8d3a2001  ! 463: SRA_I	sra 	%r8, 0x0001, %r6
	.word 0x9e0a2d60  ! 463: AND_I	and 	%r8, 0x0d60, %r15
	.word 0x836a0009  ! 463: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x0
	.word 0xf5220009  ! 473: STF_R	st	%f26, [%r9, %r8]
	.word 0xc45a0009  ! 473: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0x873a1009  ! 473: SRAX_R	srax	%r8, %r9, %r3
	.word 0x8f321009  ! 473: SRLX_R	srlx	%r8, %r9, %r7
	.word 0x842a0009  ! 473: ANDN_R	andn 	%r8, %r9, %r2
	.word 0x836a2b68  ! 473: SDIVX_I	sdivx	%r8, 0x0b68, %r1
	.word 0xe62a0009  ! 481: STB_R	stb	%r19, [%r8 + %r9]
	.word 0xc8120009  ! 481: LDUH_R	lduh	[%r8 + %r9], %r4
	.word 0xa82a0009  ! 481: ANDN_R	andn 	%r8, %r9, %r20
	.word 0x848a2d34  ! 481: ANDcc_I	andcc 	%r8, 0x0d34, %r2
	.word 0x88a22410  ! 481: SUBcc_I	subcc 	%r8, 0x0410, %r4
	.word 0x846a2dfc  ! 481: UDIVX_I	udivx 	%r8, 0x0dfc, %r2
	.word 0xc62a0009  ! 487: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xce020009  ! 487: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x86022600  ! 487: ADD_I	add 	%r8, 0x0600, %r3
	.word 0x82120009  ! 487: OR_R	or 	%r8, %r9, %r1
	.word 0x8d2a0009  ! 487: SLL_R	sll 	%r8, %r9, %r6
	.word 0x8efa2a90  ! 487: SDIVcc_I	sdivcc 	%r8, 0x0a90, %r7
	.word 0xca2a0009  ! 493: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xda0a0009  ! 493: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0x868a0009  ! 493: ANDcc_R	andcc 	%r8, %r9, %r3
	.word 0xb03a0009  ! 493: XNOR_R	xnor 	%r8, %r9, %r24
	.word 0x98922ebc  ! 493: ORcc_I	orcc 	%r8, 0x0ebc, %r12
	.word 0x8efa0009  ! 493: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0xfb220009  ! 499: STF_R	st	%f29, [%r9, %r8]
	.word 0xc80a0009  ! 499: LDUB_R	ldub	[%r8 + %r9], %r4
	.word 0x8caa2880  ! 499: ANDNcc_I	andncc 	%r8, 0x0880, %r6
	.word 0x85782401  ! 499: MOVR_I	move	%r0, 0xdb8, %r2
	.word 0xad3a1009  ! 499: SRAX_R	srax	%r8, %r9, %r22
	.word 0x887a2e84  ! 499: SDIV_I	sdiv 	%r8, 0x0e84, %r4
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000c80, %g1, %r9
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
        setx  0x09e5d9ffbefdaa6a, %g1, %r0
        setx  0x2483af217744634c, %g1, %r1
        setx  0x097ef83e410eccca, %g1, %r2
        setx  0x780b24a5cd32bb65, %g1, %r3
        setx  0x3ec00c590f9bfd5c, %g1, %r4
        setx  0xafd135a02df1f141, %g1, %r5
        setx  0x555892c5e9a2e487, %g1, %r6
        setx  0xc532c318d825a229, %g1, %r7
        setx  0x9133b56fded416a1, %g1, %r10
        setx  0x3b62a972a711e8d5, %g1, %r11
        setx  0xa422cf25ed5d4768, %g1, %r12
        setx  0x001a8ad42edc8437, %g1, %r13
        setx  0xa12384c6fd6d0fff, %g1, %r14
        setx  0xc9b47974fa335d8c, %g1, %r15
        setx  0xa68e5316cf9852ac, %g1, %r16
        setx  0xd2e49b6269bb8ad8, %g1, %r17
        setx  0xc14c76a26bb5fbe0, %g1, %r18
        setx  0xb3d91206070b2729, %g1, %r19
        setx  0xb08a9e10a72cec9d, %g1, %r20
        setx  0x40998f3464141c1c, %g1, %r21
        setx  0x41f056ea9b97d7ef, %g1, %r22
        setx  0xc84709a4acb952b8, %g1, %r23
        setx  0x23536cd465c77012, %g1, %r24
        setx  0x21d03ea1f5853327, %g1, %r25
        setx  0x9862138a8a286392, %g1, %r26
        setx  0xb76ea8e2f4f5958e, %g1, %r27
        setx  0x28951e2af1e824d4, %g1, %r28
        setx  0x86b89574f6c7b5d7, %g1, %r29
        setx  0xabcf312955e3ab9a, %g1, %r30
        setx  0xccc95032c66ccc7a, %g1, %r31
	.word 0x8e720009  ! 5: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xa4f20009  ! 6: UDIVcc_R	udivcc 	%r8, %r9, %r18
	.word 0x866a27b0  ! 7: UDIVX_I	udivx 	%r8, 0x07b0, %r3
	.word 0x896a2834  ! 8: SDIVX_I	sdivx	%r8, 0x0834, %r4
	.word 0x84fa2df4  ! 9: SDIVcc_I	sdivcc 	%r8, 0x0df4, %r2
	.word 0x82fa0009  ! 16: SDIVcc_R	sdivcc 	%r8, %r9, %r1
	.word 0x94722fc0  ! 17: UDIV_I	udiv 	%r8, 0x0fc0, %r10
	.word 0x887a0009  ! 18: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0x9ef226c4  ! 31: UDIVcc_I	udivcc 	%r8, 0x06c4, %r15
	.word 0x8c7a0009  ! 38: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x8c720009  ! 39: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0xbc722330  ! 46: UDIV_I	udiv 	%r8, 0x0330, %r30
	.word 0xb6f22f98  ! 47: UDIVcc_I	udivcc 	%r8, 0x0f98, %r27
	.word 0x86722574  ! 48: UDIV_I	udiv 	%r8, 0x0574, %r3
	.word 0x8e7a0009  ! 55: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x0
	.word 0x86720009  ! 75: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x867a0009  ! 88: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x946a2300  ! 89: UDIVX_I	udivx 	%r8, 0x0300, %r10
	.word 0xa0f20009  ! 96: UDIVcc_R	udivcc 	%r8, %r9, %r16
	.word 0x84f22560  ! 115: UDIVcc_I	udivcc 	%r8, 0x0560, %r2
	.word 0x84fa2e60  ! 116: SDIVcc_I	sdivcc 	%r8, 0x0e60, %r2
	.word 0x8afa0009  ! 117: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xbb6a0009  ! 124: SDIVX_R	sdivx	%r8, %r9, %r29
	.word 0xa56a2374  ! 155: SDIVX_I	sdivx	%r8, 0x0374, %r18
	.word 0x8872239c  ! 156: UDIV_I	udiv 	%r8, 0x039c, %r4
	.word 0xb6f20009  ! 169: UDIVcc_R	udivcc 	%r8, %r9, %r27
	.word 0x8e7a0009  ! 188: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0x867a2af0  ! 219: SDIV_I	sdiv 	%r8, 0x0af0, %r3
	.word 0x88fa0009  ! 220: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0x8c7a2178  ! 233: SDIV_I	sdiv 	%r8, 0x0178, %r6
	.word 0x0
	.word 0x836a0009  ! 235: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x9efa0009  ! 236: SDIVcc_R	sdivcc 	%r8, %r9, %r15
	.word 0x94722248  ! 249: UDIV_I	udiv 	%r8, 0x0248, %r10
	.word 0x94fa0009  ! 256: SDIVcc_R	sdivcc 	%r8, %r9, %r10
	.word 0x0
	.word 0xaefa2d10  ! 270: SDIVcc_I	sdivcc 	%r8, 0x0d10, %r23
	.word 0x826a0009  ! 271: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xb86a0009  ! 272: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0x82f22c40  ! 279: UDIVcc_I	udivcc 	%r8, 0x0c40, %r1
	.word 0x8cfa0009  ! 286: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x836a2fcc  ! 287: SDIVX_I	sdivx	%r8, 0x0fcc, %r1
	.word 0x88722680  ! 288: UDIV_I	udiv 	%r8, 0x0680, %r4
	.word 0x866a297c  ! 307: UDIVX_I	udivx 	%r8, 0x097c, %r3
	.word 0x826a0009  ! 308: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xaef22c4c  ! 333: UDIVcc_I	udivcc 	%r8, 0x0c4c, %r23
	.word 0x996a0009  ! 334: SDIVX_R	sdivx	%r8, %r9, %r12
	.word 0x9c72244c  ! 347: UDIV_I	udiv 	%r8, 0x044c, %r14
	.word 0x8af228d0  ! 348: UDIVcc_I	udivcc 	%r8, 0x08d0, %r5
	.word 0xa8fa0009  ! 349: SDIVcc_R	sdivcc 	%r8, %r9, %r20
	.word 0xa0fa0009  ! 356: SDIVcc_R	sdivcc 	%r8, %r9, %r16
	.word 0xbe722dc8  ! 357: UDIV_I	udiv 	%r8, 0x0dc8, %r31
	.word 0xba7222bc  ! 358: UDIV_I	udiv 	%r8, 0x02bc, %r29
	.word 0x8d6a2a4c  ! 359: SDIVX_I	sdivx	%r8, 0x0a4c, %r6
	.word 0xacfa0009  ! 360: SDIVcc_R	sdivcc 	%r8, %r9, %r22
	.word 0x84722dcc  ! 373: UDIV_I	udiv 	%r8, 0x0dcc, %r2
	.word 0x8b6a28b4  ! 398: SDIVX_I	sdivx	%r8, 0x08b4, %r5
	.word 0x86fa0009  ! 411: SDIVcc_R	sdivcc 	%r8, %r9, %r3
	.word 0x0
	.word 0x86720009  ! 431: UDIV_R	udiv 	%r8, %r9, %r3
	.word 0x82f20009  ! 444: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0x8efa21cc  ! 445: SDIVcc_I	sdivcc 	%r8, 0x01cc, %r7
	.word 0x827a0009  ! 464: SDIV_R	sdiv 	%r8, %r9, %r1
	.word 0x8b6a22c4  ! 465: SDIVX_I	sdivx	%r8, 0x02c4, %r5
	.word 0x0
	.word 0x866a2650  ! 467: UDIVX_I	udivx 	%r8, 0x0650, %r3
	.word 0x84f20009  ! 474: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0x9af20009  ! 475: UDIVcc_R	udivcc 	%r8, %r9, %r13
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000c80, %g1, %r9
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
        setx  0x09e5d9ffbefdaa6a, %g1, %r0
        setx  0x2483af217744634c, %g1, %r1
        setx  0x097ef83e410eccca, %g1, %r2
        setx  0x780b24a5cd32bb65, %g1, %r3
        setx  0x3ec00c590f9bfd5c, %g1, %r4
        setx  0xafd135a02df1f141, %g1, %r5
        setx  0x555892c5e9a2e487, %g1, %r6
        setx  0xc532c318d825a229, %g1, %r7
        setx  0x9133b56fded416a1, %g1, %r10
        setx  0x3b62a972a711e8d5, %g1, %r11
        setx  0xa422cf25ed5d4768, %g1, %r12
        setx  0x001a8ad42edc8437, %g1, %r13
        setx  0xa12384c6fd6d0fff, %g1, %r14
        setx  0xc9b47974fa335d8c, %g1, %r15
        setx  0xa68e5316cf9852ac, %g1, %r16
        setx  0xd2e49b6269bb8ad8, %g1, %r17
        setx  0xc14c76a26bb5fbe0, %g1, %r18
        setx  0xb3d91206070b2729, %g1, %r19
        setx  0xb08a9e10a72cec9d, %g1, %r20
        setx  0x40998f3464141c1c, %g1, %r21
        setx  0x41f056ea9b97d7ef, %g1, %r22
        setx  0xc84709a4acb952b8, %g1, %r23
        setx  0x23536cd465c77012, %g1, %r24
        setx  0x21d03ea1f5853327, %g1, %r25
        setx  0x9862138a8a286392, %g1, %r26
        setx  0xb76ea8e2f4f5958e, %g1, %r27
        setx  0x28951e2af1e824d4, %g1, %r28
        setx  0x86b89574f6c7b5d7, %g1, %r29
        setx  0xabcf312955e3ab9a, %g1, %r30
        setx  0xccc95032c66ccc7a, %g1, %r31
	.word 0xc42a0009  ! 15: STB_R	stb	%r2, [%r8 + %r9]
	.word 0xc6120009  ! 15: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x892a2001  ! 15: SLL_I	sll 	%r8, 0x0001, %r4
	.word 0x8d321009  ! 15: SRLX_R	srlx	%r8, %r9, %r6
	.word 0x8caa2fa8  ! 15: ANDNcc_I	andncc 	%r8, 0x0fa8, %r6
	.word 0x846a2e8c  ! 15: UDIVX_I	udivx 	%r8, 0x0e8c, %r2
	.word 0xe9220009  ! 24: STF_R	st	%f20, [%r9, %r8]
	.word 0xc2420009  ! 24: LDSW_R	ldsw	[%r8 + %r9], %r1
	.word 0x8cb22cb0  ! 24: SUBCcc_I	orncc 	%r8, 0x0cb0, %r6
	.word 0x9c2a0009  ! 24: ANDN_R	andn 	%r8, %r9, %r14
	.word 0x85641809  ! 24: MOVcc_R	<illegal instruction>
	.word 0x9e722e64  ! 24: UDIV_I	udiv 	%r8, 0x0e64, %r15
	.word 0xca220009  ! 30: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc24a0009  ! 30: LDSB_R	ldsb	[%r8 + %r9], %r1
	.word 0xb80a0009  ! 30: AND_R	and 	%r8, %r9, %r28
	.word 0x8f2a3001  ! 30: SLLX_I	sllx	%r8, 0x0001, %r7
	.word 0xa5782401  ! 30: MOVR_I	move	%r0, 0x1, %r18
	.word 0x976a2d50  ! 30: SDIVX_I	sdivx	%r8, 0x0d50, %r11
	.word 0xcb3a0009  ! 37: STDF_R	std	%f5, [%r9, %r8]
	.word 0xda0a0009  ! 37: LDUB_R	ldub	[%r8 + %r9], %r13
	.word 0x8f320009  ! 37: SRL_R	srl 	%r8, %r9, %r7
	.word 0xba922fbc  ! 37: ORcc_I	orcc 	%r8, 0x0fbc, %r29
	.word 0x87320009  ! 37: SRL_R	srl 	%r8, %r9, %r3
	.word 0x8afa2340  ! 37: SDIVcc_I	sdivcc 	%r8, 0x0340, %r5
	.word 0xc5220009  ! 45: STF_R	st	%f2, [%r9, %r8]
	.word 0xcc0a0009  ! 45: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x82b20009  ! 45: ORNcc_R	orncc 	%r8, %r9, %r1
	.word 0x8c422a9c  ! 45: ADDC_I	addc 	%r8, 0x0a9c, %r6
	.word 0xa00a0009  ! 45: AND_R	and 	%r8, %r9, %r16
	.word 0x8e720009  ! 45: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc3220009  ! 54: STF_R	st	%f1, [%r9, %r8]
	.word 0xc81a0009  ! 54: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x88b20009  ! 54: ORNcc_R	orncc 	%r8, %r9, %r4
	.word 0x8e322d7c  ! 54: ORN_I	orn 	%r8, 0x0d7c, %r7
	.word 0x9e422d78  ! 54: ADDC_I	addc 	%r8, 0x0d78, %r15
	.word 0x896a0009  ! 54: SDIVX_R	sdivx	%r8, %r9, %r4
	.word 0xdc320009  ! 61: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xca4a0009  ! 61: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x8e9229b4  ! 61: ORcc_I	orcc 	%r8, 0x09b4, %r7
	.word 0x8c8227b0  ! 61: ADDcc_I	addcc 	%r8, 0x07b0, %r6
	.word 0x8b2a3001  ! 61: SLLX_I	sllx	%r8, 0x0001, %r5
	.word 0xaafa0009  ! 61: SDIVcc_R	sdivcc 	%r8, %r9, %r21
	.word 0xca320009  ! 67: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xca5a0009  ! 67: LDX_R	ldx	[%r8 + %r9], %r5
	.word 0xb29a2eb0  ! 67: XORcc_I	xorcc 	%r8, 0x0eb0, %r25
	.word 0x8a2a0009  ! 67: ANDN_R	andn 	%r8, %r9, %r5
	.word 0xba3227b4  ! 67: ORN_I	orn 	%r8, 0x07b4, %r29
	.word 0x886a0009  ! 67: UDIVX_R	udivx 	%r8, %r9, %r4
	.word 0xc93a0009  ! 73: STDF_R	std	%f4, [%r9, %r8]
	.word 0xe81a0009  ! 73: LDD_R	ldd	[%r8 + %r9], %r20
	.word 0x892a0009  ! 73: SLL_R	sll 	%r8, %r9, %r4
	.word 0x853a1009  ! 73: SRAX_R	srax	%r8, %r9, %r2
	.word 0xae220009  ! 73: SUB_R	sub 	%r8, %r9, %r23
	.word 0x8c720009  ! 73: UDIV_R	udiv 	%r8, %r9, %r6
	.word 0x0
	.word 0xe02a0009  ! 81: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xda5a0009  ! 81: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x85321009  ! 81: SRLX_R	srlx	%r8, %r9, %r2
	.word 0x9f2a3001  ! 81: SLLX_I	sllx	%r8, 0x0001, %r15
	.word 0x889a2cf4  ! 81: XORcc_I	xorcc 	%r8, 0x0cf4, %r4
	.word 0xa07a2da4  ! 81: SDIV_I	sdiv 	%r8, 0x0da4, %r16
	.word 0xcc320009  ! 87: STH_R	sth	%r6, [%r8 + %r9]
	.word 0xca520009  ! 87: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x82a220bc  ! 87: SUBcc_I	subcc 	%r8, 0x00bc, %r1
	.word 0xae8a20dc  ! 87: ANDcc_I	andcc 	%r8, 0x00dc, %r23
	.word 0xb92a1009  ! 87: SLLX_R	sllx	%r8, %r9, %r28
	.word 0x94f22f08  ! 87: UDIVcc_I	udivcc 	%r8, 0x0f08, %r10
	.word 0xd93a0009  ! 95: STDF_R	std	%f12, [%r9, %r8]
	.word 0xee5a0009  ! 95: LDX_R	ldx	[%r8 + %r9], %r23
	.word 0xa8c20009  ! 95: ADDCcc_R	addccc 	%r8, %r9, %r20
	.word 0x84322144  ! 95: SUBC_I	orn 	%r8, 0x0144, %r2
	.word 0x88aa2a14  ! 95: ANDNcc_I	andncc 	%r8, 0x0a14, %r4
	.word 0x9b6a2fe4  ! 95: SDIVX_I	sdivx	%r8, 0x0fe4, %r13
	.word 0xc53a0009  ! 102: STDF_R	std	%f2, [%r9, %r8]
	.word 0xca420009  ! 102: LDSW_R	ldsw	[%r8 + %r9], %r5
	.word 0x872a3001  ! 102: SLLX_I	sllx	%r8, 0x0001, %r3
	.word 0x84020009  ! 102: ADD_R	add 	%r8, %r9, %r2
	.word 0xb0422aec  ! 102: ADDC_I	addc 	%r8, 0x0aec, %r24
	.word 0x82720009  ! 102: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0xdc2a0009  ! 108: STB_R	stb	%r14, [%r8 + %r9]
	.word 0xca520009  ! 108: LDSH_R	ldsh	[%r8 + %r9], %r5
	.word 0x8f641809  ! 108: MOVcc_R	<illegal instruction>
	.word 0x8422273c  ! 108: SUB_I	sub 	%r8, 0x073c, %r2
	.word 0x84c20009  ! 108: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x8ef22044  ! 108: UDIVcc_I	udivcc 	%r8, 0x0044, %r7
	.word 0xc3220009  ! 114: STF_R	st	%f1, [%r9, %r8]
	.word 0xd8120009  ! 114: LDUH_R	lduh	[%r8 + %r9], %r12
	.word 0x849a0009  ! 114: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x840a2c24  ! 114: AND_I	and 	%r8, 0x0c24, %r2
	.word 0x869a2648  ! 114: XORcc_I	xorcc 	%r8, 0x0648, %r3
	.word 0x887a0009  ! 114: SDIV_R	sdiv 	%r8, %r9, %r4
	.word 0xc6720009  ! 123: STX_R	stx	%r3, [%r8 + %r9]
	.word 0xc6520009  ! 123: LDSH_R	ldsh	[%r8 + %r9], %r3
	.word 0x833a3001  ! 123: SRAX_I	srax	%r8, 0x0001, %r1
	.word 0x97320009  ! 123: SRL_R	srl 	%r8, %r9, %r11
	.word 0x8a22269c  ! 123: SUB_I	sub 	%r8, 0x069c, %r5
	.word 0xaafa0009  ! 123: SDIVcc_R	sdivcc 	%r8, %r9, %r21
	.word 0xc6220009  ! 130: STW_R	stw	%r3, [%r8 + %r9]
	.word 0xda5a0009  ! 130: LDX_R	ldx	[%r8 + %r9], %r13
	.word 0x869a24b8  ! 130: XORcc_I	xorcc 	%r8, 0x04b8, %r3
	.word 0x832a0009  ! 130: SLL_R	sll 	%r8, %r9, %r1
	.word 0x84122c6c  ! 130: OR_I	or 	%r8, 0x0c6c, %r2
	.word 0x8cf20009  ! 130: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xe8720009  ! 136: STX_R	stx	%r20, [%r8 + %r9]
	.word 0xe8420009  ! 136: LDSW_R	ldsw	[%r8 + %r9], %r20
	.word 0xaf2a3001  ! 136: SLLX_I	sllx	%r8, 0x0001, %r23
	.word 0x84a22170  ! 136: SUBcc_I	subcc 	%r8, 0x0170, %r2
	.word 0x8aaa0009  ! 136: ANDNcc_R	andncc 	%r8, %r9, %r5
	.word 0xaafa2c14  ! 136: SDIVcc_I	sdivcc 	%r8, 0x0c14, %r21
	.word 0xce320009  ! 142: STH_R	sth	%r7, [%r8 + %r9]
	.word 0xd4020009  ! 142: LDUW_R	lduw	[%r8 + %r9], %r10
	.word 0x85782401  ! 142: MOVR_I	move	%r0, 0x401, %r2
	.word 0xa5320009  ! 142: SRL_R	srl 	%r8, %r9, %r18
	.word 0xb63a0009  ! 142: XNOR_R	xnor 	%r8, %r9, %r27
	.word 0x9cf20009  ! 142: UDIVcc_R	udivcc 	%r8, %r9, %r14
	.word 0xc22a0009  ! 148: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xe25a0009  ! 148: LDX_R	ldx	[%r8 + %r9], %r17
	.word 0x872a2001  ! 148: SLL_I	sll 	%r8, 0x0001, %r3
	.word 0x852a2001  ! 148: SLL_I	sll 	%r8, 0x0001, %r2
	.word 0x829a2228  ! 148: XORcc_I	xorcc 	%r8, 0x0228, %r1
	.word 0x98f20009  ! 148: UDIVcc_R	udivcc 	%r8, %r9, %r12
	.word 0xf2220009  ! 154: STW_R	stw	%r25, [%r8 + %r9]
	.word 0xea520009  ! 154: LDSH_R	ldsh	[%r8 + %r9], %r21
	.word 0xb7323001  ! 154: SRLX_I	srlx	%r8, 0x0001, %r27
	.word 0x8232206c  ! 154: ORN_I	orn 	%r8, 0x006c, %r1
	.word 0x8e1a0009  ! 154: XOR_R	xor 	%r8, %r9, %r7
	.word 0x86f228d0  ! 154: UDIVcc_I	udivcc 	%r8, 0x08d0, %r3
	.word 0xcc2a0009  ! 162: STB_R	stb	%r6, [%r8 + %r9]
	.word 0xce020009  ! 162: LDUW_R	lduw	[%r8 + %r9], %r7
	.word 0x8e0a2350  ! 162: AND_I	and 	%r8, 0x0350, %r7
	.word 0xa6b220e8  ! 162: SUBCcc_I	orncc 	%r8, 0x00e8, %r19
	.word 0x86420009  ! 162: ADDC_R	addc 	%r8, %r9, %r3
	.word 0x84fa0009  ! 162: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xcb3a0009  ! 168: STDF_R	std	%f5, [%r9, %r8]
	.word 0xcc420009  ! 168: LDSW_R	ldsw	[%r8 + %r9], %r6
	.word 0x848a0009  ! 168: ANDcc_R	andcc 	%r8, %r9, %r2
	.word 0x889a2ec0  ! 168: XORcc_I	xorcc 	%r8, 0x0ec0, %r4
	.word 0x84220009  ! 168: SUB_R	sub 	%r8, %r9, %r2
	.word 0x8d6a2a70  ! 168: SDIVX_I	sdivx	%r8, 0x0a70, %r6
	.word 0xc8220009  ! 175: STW_R	stw	%r4, [%r8 + %r9]
	.word 0xe8020009  ! 175: LDUW_R	lduw	[%r8 + %r9], %r20
	.word 0xae322040  ! 175: SUBC_I	orn 	%r8, 0x0040, %r23
	.word 0x8d3a1009  ! 175: SRAX_R	srax	%r8, %r9, %r6
	.word 0xb4220009  ! 175: SUB_R	sub 	%r8, %r9, %r26
	.word 0xa4fa2b9c  ! 175: SDIVcc_I	sdivcc 	%r8, 0x0b9c, %r18
	.word 0xc6320009  ! 181: STH_R	sth	%r3, [%r8 + %r9]
	.word 0xe6420009  ! 181: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x85643801  ! 181: MOVcc_I	<illegal instruction>
	.word 0x8caa0009  ! 181: ANDNcc_R	andncc 	%r8, %r9, %r6
	.word 0x8e8a0009  ! 181: ANDcc_R	andcc 	%r8, %r9, %r7
	.word 0xa8fa0009  ! 181: SDIVcc_R	sdivcc 	%r8, %r9, %r20
	.word 0xdc320009  ! 187: STH_R	sth	%r14, [%r8 + %r9]
	.word 0xc2120009  ! 187: LDUH_R	lduh	[%r8 + %r9], %r1
	.word 0x8aba2bfc  ! 187: XNORcc_I	xnorcc 	%r8, 0x0bfc, %r5
	.word 0xb4c224c4  ! 187: ADDCcc_I	addccc 	%r8, 0x04c4, %r26
	.word 0xa0822b9c  ! 187: ADDcc_I	addcc 	%r8, 0x0b9c, %r16
	.word 0xb07a2e48  ! 187: SDIV_I	sdiv 	%r8, 0x0e48, %r24
	.word 0xcc720009  ! 194: STX_R	stx	%r6, [%r8 + %r9]
	.word 0xc85a0009  ! 194: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0xb8322570  ! 194: ORN_I	orn 	%r8, 0x0570, %r28
	.word 0x82b20009  ! 194: ORNcc_R	orncc 	%r8, %r9, %r1
	.word 0x9a822460  ! 194: ADDcc_I	addcc 	%r8, 0x0460, %r13
	.word 0x8672224c  ! 194: UDIV_I	udiv 	%r8, 0x024c, %r3
	.word 0xf93a0009  ! 200: STDF_R	std	%f28, [%r9, %r8]
	.word 0xcc1a0009  ! 200: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0xbea20009  ! 200: SUBcc_R	subcc 	%r8, %r9, %r31
	.word 0xab3a2001  ! 200: SRA_I	sra 	%r8, 0x0001, %r21
	.word 0xb8320009  ! 200: SUBC_R	orn 	%r8, %r9, %r28
	.word 0x847229f8  ! 200: UDIV_I	udiv 	%r8, 0x09f8, %r2
	.word 0xee320009  ! 206: STH_R	sth	%r23, [%r8 + %r9]
	.word 0xe41a0009  ! 206: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x84b22f5c  ! 206: SUBCcc_I	orncc 	%r8, 0x0f5c, %r2
	.word 0x8f2a3001  ! 206: SLLX_I	sllx	%r8, 0x0001, %r7
	.word 0x952a3001  ! 206: SLLX_I	sllx	%r8, 0x0001, %r10
	.word 0x8af226d0  ! 206: UDIVcc_I	udivcc 	%r8, 0x06d0, %r5
	.word 0xcd220009  ! 212: STF_R	st	%f6, [%r9, %r8]
	.word 0xf01a0009  ! 212: LDD_R	ldd	[%r8 + %r9], %r24
	.word 0x8b2a3001  ! 212: SLLX_I	sllx	%r8, 0x0001, %r5
	.word 0x86020009  ! 212: ADD_R	add 	%r8, %r9, %r3
	.word 0x89641809  ! 212: MOVcc_R	<illegal instruction>
	.word 0x8e7a2874  ! 212: SDIV_I	sdiv 	%r8, 0x0874, %r7
	.word 0xc7220009  ! 218: STF_R	st	%f3, [%r9, %r8]
	.word 0xca4a0009  ! 218: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x87780409  ! 218: MOVR_R	move	%r0, %r9, %r3
	.word 0xa1322001  ! 218: SRL_I	srl 	%r8, 0x0001, %r16
	.word 0x9f641809  ! 218: MOVcc_R	<illegal instruction>
	.word 0x846a2328  ! 218: UDIVX_I	udivx 	%r8, 0x0328, %r2
	.word 0xc2220009  ! 226: STW_R	stw	%r1, [%r8 + %r9]
	.word 0xc84a0009  ! 226: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x87782401  ! 226: MOVR_I	move	%r0, 0x401, %r3
	.word 0x88020009  ! 226: ADD_R	add 	%r8, %r9, %r4
	.word 0x9a8a0009  ! 226: ANDcc_R	andcc 	%r8, %r9, %r13
	.word 0x82f20009  ! 226: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xce220009  ! 232: STW_R	stw	%r7, [%r8 + %r9]
	.word 0xc84a0009  ! 232: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0xa7320009  ! 232: SRL_R	srl 	%r8, %r9, %r19
	.word 0xa6422cf4  ! 232: ADDC_I	addc 	%r8, 0x0cf4, %r19
	.word 0x88aa0009  ! 232: ANDNcc_R	andncc 	%r8, %r9, %r4
	.word 0x896a2d8c  ! 232: SDIVX_I	sdivx	%r8, 0x0d8c, %r4
	.word 0x0
	.word 0xe82a0009  ! 242: STB_R	stb	%r20, [%r8 + %r9]
	.word 0xfc420009  ! 242: LDSW_R	ldsw	[%r8 + %r9], %r30
	.word 0x8d3a1009  ! 242: SRAX_R	srax	%r8, %r9, %r6
	.word 0x853a1009  ! 242: SRAX_R	srax	%r8, %r9, %r2
	.word 0x8d2a0009  ! 242: SLL_R	sll 	%r8, %r9, %r6
	.word 0x827a25b8  ! 242: SDIV_I	sdiv 	%r8, 0x05b8, %r1
	.word 0xc2320009  ! 248: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xe41a0009  ! 248: LDD_R	ldd	[%r8 + %r9], %r18
	.word 0x872a1009  ! 248: SLLX_R	sllx	%r8, %r9, %r3
	.word 0x8e422340  ! 248: ADDC_I	addc 	%r8, 0x0340, %r7
	.word 0x8692219c  ! 248: ORcc_I	orcc 	%r8, 0x019c, %r3
	.word 0xa06a23ac  ! 248: UDIVX_I	udivx 	%r8, 0x03ac, %r16
	.word 0xc7220009  ! 255: STF_R	st	%f3, [%r9, %r8]
	.word 0xc65a0009  ! 255: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x84b20009  ! 255: SUBCcc_R	orncc 	%r8, %r9, %r2
	.word 0xa8020009  ! 255: ADD_R	add 	%r8, %r9, %r20
	.word 0x832a1009  ! 255: SLLX_R	sllx	%r8, %r9, %r1
	.word 0x867a0009  ! 255: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0xc8320009  ! 262: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xe64a0009  ! 262: LDSB_R	ldsb	[%r8 + %r9], %r19
	.word 0xb60a24c8  ! 262: AND_I	and 	%r8, 0x04c8, %r27
	.word 0x84c20009  ! 262: ADDCcc_R	addccc 	%r8, %r9, %r2
	.word 0x833a0009  ! 262: SRA_R	sra 	%r8, %r9, %r1
	.word 0x8ef22784  ! 262: UDIVcc_I	udivcc 	%r8, 0x0784, %r7
	.word 0x0
	.word 0xca320009  ! 269: STH_R	sth	%r5, [%r8 + %r9]
	.word 0xfa420009  ! 269: LDSW_R	ldsw	[%r8 + %r9], %r29
	.word 0x89321009  ! 269: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x8cba0009  ! 269: XNORcc_R	xnorcc 	%r8, %r9, %r6
	.word 0xb08a0009  ! 269: ANDcc_R	andcc 	%r8, %r9, %r24
	.word 0x82f20009  ! 269: UDIVcc_R	udivcc 	%r8, %r9, %r1
	.word 0xcb3a0009  ! 278: STDF_R	std	%f5, [%r9, %r8]
	.word 0xc84a0009  ! 278: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x820a2464  ! 278: AND_I	and 	%r8, 0x0464, %r1
	.word 0x883a2790  ! 278: XNOR_I	xnor 	%r8, 0x0790, %r4
	.word 0xb43a20bc  ! 278: XNOR_I	xnor 	%r8, 0x00bc, %r26
	.word 0x8cf20009  ! 278: UDIVcc_R	udivcc 	%r8, %r9, %r6
	.word 0xf8320009  ! 285: STH_R	sth	%r28, [%r8 + %r9]
	.word 0xc81a0009  ! 285: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x881225b8  ! 285: OR_I	or 	%r8, 0x05b8, %r4
	.word 0xa41a0009  ! 285: XOR_R	xor 	%r8, %r9, %r18
	.word 0x848224ac  ! 285: ADDcc_I	addcc 	%r8, 0x04ac, %r2
	.word 0x866a2710  ! 285: UDIVX_I	udivx 	%r8, 0x0710, %r3
	.word 0xea320009  ! 294: STH_R	sth	%r21, [%r8 + %r9]
	.word 0xcc4a0009  ! 294: LDSB_R	ldsb	[%r8 + %r9], %r6
	.word 0x888a0009  ! 294: ANDcc_R	andcc 	%r8, %r9, %r4
	.word 0x95782401  ! 294: MOVR_I	move	%r0, 0x9, %r10
	.word 0x8ec223d0  ! 294: ADDCcc_I	addccc 	%r8, 0x03d0, %r7
	.word 0x94722584  ! 294: UDIV_I	udiv 	%r8, 0x0584, %r10
	.word 0xd4220009  ! 300: STW_R	stw	%r10, [%r8 + %r9]
	.word 0xcc0a0009  ! 300: LDUB_R	ldub	[%r8 + %r9], %r6
	.word 0x8f3a1009  ! 300: SRAX_R	srax	%r8, %r9, %r7
	.word 0x833a1009  ! 300: SRAX_R	srax	%r8, %r9, %r1
	.word 0xac322788  ! 300: ORN_I	orn 	%r8, 0x0788, %r22
	.word 0x8e720009  ! 300: UDIV_R	udiv 	%r8, %r9, %r7
	.word 0xc9220009  ! 306: STF_R	st	%f4, [%r9, %r8]
	.word 0xe6420009  ! 306: LDSW_R	ldsw	[%r8 + %r9], %r19
	.word 0x840a2564  ! 306: AND_I	and 	%r8, 0x0564, %r2
	.word 0x8a8a0009  ! 306: ANDcc_R	andcc 	%r8, %r9, %r5
	.word 0x96320009  ! 306: SUBC_R	orn 	%r8, %r9, %r11
	.word 0xb8f22618  ! 306: UDIVcc_I	udivcc 	%r8, 0x0618, %r28
	.word 0xca2a0009  ! 314: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xda4a0009  ! 314: LDSB_R	ldsb	[%r8 + %r9], %r13
	.word 0x89782401  ! 314: MOVR_I	move	%r0, 0x401, %r4
	.word 0xaf3a1009  ! 314: SRAX_R	srax	%r8, %r9, %r23
	.word 0x8c120009  ! 314: OR_R	or 	%r8, %r9, %r6
	.word 0x866a0009  ! 314: UDIVX_R	udivx 	%r8, %r9, %r3
	.word 0xcc220009  ! 320: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xca120009  ! 320: LDUH_R	lduh	[%r8 + %r9], %r5
	.word 0xbe022038  ! 320: ADD_I	add 	%r8, 0x0038, %r31
	.word 0x8ca20009  ! 320: SUBcc_R	subcc 	%r8, %r9, %r6
	.word 0x888a2d50  ! 320: ANDcc_I	andcc 	%r8, 0x0d50, %r4
	.word 0x8a7a0009  ! 320: SDIV_R	sdiv 	%r8, %r9, %r5
	.word 0xe02a0009  ! 326: STB_R	stb	%r16, [%r8 + %r9]
	.word 0xd4520009  ! 326: LDSH_R	ldsh	[%r8 + %r9], %r10
	.word 0xa7643801  ! 326: MOVcc_I	<illegal instruction>
	.word 0x8e120009  ! 326: OR_R	or 	%r8, %r9, %r7
	.word 0x9e8a2150  ! 326: ANDcc_I	andcc 	%r8, 0x0150, %r15
	.word 0xb6f222b4  ! 326: UDIVcc_I	udivcc 	%r8, 0x02b4, %r27
	.word 0xcf220009  ! 332: STF_R	st	%f7, [%r9, %r8]
	.word 0xca4a0009  ! 332: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0xae8a0009  ! 332: ANDcc_R	andcc 	%r8, %r9, %r23
	.word 0x89321009  ! 332: SRLX_R	srlx	%r8, %r9, %r4
	.word 0x86b22888  ! 332: ORNcc_I	orncc 	%r8, 0x0888, %r3
	.word 0xb27a0009  ! 332: SDIV_R	sdiv 	%r8, %r9, %r25
	.word 0xca2a0009  ! 340: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xc64a0009  ! 340: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8f321009  ! 340: SRLX_R	srlx	%r8, %r9, %r7
	.word 0x8d323001  ! 340: SRLX_I	srlx	%r8, 0x0001, %r6
	.word 0xa62a2e0c  ! 340: ANDN_I	andn 	%r8, 0x0e0c, %r19
	.word 0x896a24e8  ! 340: SDIVX_I	sdivx	%r8, 0x04e8, %r4
	.word 0xc62a0009  ! 346: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xe45a0009  ! 346: LDX_R	ldx	[%r8 + %r9], %r18
	.word 0xbf2a2001  ! 346: SLL_I	sll 	%r8, 0x0001, %r31
	.word 0x893a0009  ! 346: SRA_R	sra 	%r8, %r9, %r4
	.word 0xb5643801  ! 346: MOVcc_I	<illegal instruction>
	.word 0x866a20dc  ! 346: UDIVX_I	udivx 	%r8, 0x00dc, %r3
	.word 0xca220009  ! 355: STW_R	stw	%r5, [%r8 + %r9]
	.word 0xc84a0009  ! 355: LDSB_R	ldsb	[%r8 + %r9], %r4
	.word 0x8ca22a8c  ! 355: SUBcc_I	subcc 	%r8, 0x0a8c, %r6
	.word 0x96ba0009  ! 355: XNORcc_R	xnorcc 	%r8, %r9, %r11
	.word 0x8cb20009  ! 355: SUBCcc_R	orncc 	%r8, %r9, %r6
	.word 0x8f6a0009  ! 355: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0xcc220009  ! 366: STW_R	stw	%r6, [%r8 + %r9]
	.word 0xfc1a0009  ! 366: LDD_R	ldd	[%r8 + %r9], %r30
	.word 0xa29a256c  ! 366: XORcc_I	xorcc 	%r8, 0x056c, %r17
	.word 0x83780409  ! 366: MOVR_R	move	%r0, %r9, %r1
	.word 0xb61a0009  ! 366: XOR_R	xor 	%r8, %r9, %r27
	.word 0x8b6a2ce0  ! 366: SDIVX_I	sdivx	%r8, 0x0ce0, %r5
	.word 0xc82a0009  ! 372: STB_R	stb	%r4, [%r8 + %r9]
	.word 0xc64a0009  ! 372: LDSB_R	ldsb	[%r8 + %r9], %r3
	.word 0x8f3a3001  ! 372: SRAX_I	srax	%r8, 0x0001, %r7
	.word 0xb52a2001  ! 372: SLL_I	sll 	%r8, 0x0001, %r26
	.word 0xb09a0009  ! 372: XORcc_R	xorcc 	%r8, %r9, %r24
	.word 0xa2720009  ! 372: UDIV_R	udiv 	%r8, %r9, %r17
	.word 0xfb3a0009  ! 379: STDF_R	std	%f29, [%r9, %r8]
	.word 0xc20a0009  ! 379: LDUB_R	ldub	[%r8 + %r9], %r1
	.word 0x9b643801  ! 379: MOVcc_I	<illegal instruction>
	.word 0x822a0009  ! 379: ANDN_R	andn 	%r8, %r9, %r1
	.word 0x8b641809  ! 379: MOVcc_R	<illegal instruction>
	.word 0xa07a0009  ! 379: SDIV_R	sdiv 	%r8, %r9, %r16
	.word 0xca2a0009  ! 385: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xce5a0009  ! 385: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x8c420009  ! 385: ADDC_R	addc 	%r8, %r9, %r6
	.word 0x96aa0009  ! 385: ANDNcc_R	andncc 	%r8, %r9, %r11
	.word 0x9a122044  ! 385: OR_I	or 	%r8, 0x0044, %r13
	.word 0xa8720009  ! 385: UDIV_R	udiv 	%r8, %r9, %r20
	.word 0xce2a0009  ! 391: STB_R	stb	%r7, [%r8 + %r9]
	.word 0xc65a0009  ! 391: LDX_R	ldx	[%r8 + %r9], %r3
	.word 0x833a1009  ! 391: SRAX_R	srax	%r8, %r9, %r1
	.word 0x889a0009  ! 391: XORcc_R	xorcc 	%r8, %r9, %r4
	.word 0x9b2a2001  ! 391: SLL_I	sll 	%r8, 0x0001, %r13
	.word 0xbc720009  ! 391: UDIV_R	udiv 	%r8, %r9, %r30
	.word 0xc2320009  ! 397: STH_R	sth	%r1, [%r8 + %r9]
	.word 0xc8020009  ! 397: LDUW_R	lduw	[%r8 + %r9], %r4
	.word 0x8aba28d4  ! 397: XNORcc_I	xnorcc 	%r8, 0x08d4, %r5
	.word 0x82b224e4  ! 397: SUBCcc_I	orncc 	%r8, 0x04e4, %r1
	.word 0x893a3001  ! 397: SRAX_I	srax	%r8, 0x0001, %r4
	.word 0x94fa0009  ! 397: SDIVcc_R	sdivcc 	%r8, %r9, %r10
	.word 0xc8320009  ! 404: STH_R	sth	%r4, [%r8 + %r9]
	.word 0xf05a0009  ! 404: LDX_R	ldx	[%r8 + %r9], %r24
	.word 0x8b320009  ! 404: SRL_R	srl 	%r8, %r9, %r5
	.word 0x84a20009  ! 404: SUBcc_R	subcc 	%r8, %r9, %r2
	.word 0x8e220009  ! 404: SUB_R	sub 	%r8, %r9, %r7
	.word 0x827a2350  ! 404: SDIV_I	sdiv 	%r8, 0x0350, %r1
	.word 0xec220009  ! 410: STW_R	stw	%r22, [%r8 + %r9]
	.word 0xc81a0009  ! 410: LDD_R	ldd	[%r8 + %r9], %r4
	.word 0x8eb20009  ! 410: ORNcc_R	orncc 	%r8, %r9, %r7
	.word 0x8b3a2001  ! 410: SRA_I	sra 	%r8, 0x0001, %r5
	.word 0x849a0009  ! 410: XORcc_R	xorcc 	%r8, %r9, %r2
	.word 0x8e7a0009  ! 410: SDIV_R	sdiv 	%r8, %r9, %r7
	.word 0xcb220009  ! 417: STF_R	st	%f5, [%r9, %r8]
	.word 0xc45a0009  ! 417: LDX_R	ldx	[%r8 + %r9], %r2
	.word 0xae2a0009  ! 417: ANDN_R	andn 	%r8, %r9, %r23
	.word 0xb3641809  ! 417: MOVcc_R	<illegal instruction>
	.word 0xa01223d0  ! 417: OR_I	or 	%r8, 0x03d0, %r16
	.word 0x826a0009  ! 417: UDIVX_R	udivx 	%r8, %r9, %r1
	.word 0xc3220009  ! 423: STF_R	st	%f1, [%r9, %r8]
	.word 0xee520009  ! 423: LDSH_R	ldsh	[%r8 + %r9], %r23
	.word 0x88320009  ! 423: ORN_R	orn 	%r8, %r9, %r4
	.word 0x82822b60  ! 423: ADDcc_I	addcc 	%r8, 0x0b60, %r1
	.word 0x9f641809  ! 423: MOVcc_R	<illegal instruction>
	.word 0x8d6a0009  ! 423: SDIVX_R	sdivx	%r8, %r9, %r6
	.word 0x0
	.word 0xc22a0009  ! 430: STB_R	stb	%r1, [%r8 + %r9]
	.word 0xca4a0009  ! 430: LDSB_R	ldsb	[%r8 + %r9], %r5
	.word 0x881a29ac  ! 430: XOR_I	xor 	%r8, 0x09ac, %r4
	.word 0xb92a3001  ! 430: SLLX_I	sllx	%r8, 0x0001, %r28
	.word 0x8a1a2a3c  ! 430: XOR_I	xor 	%r8, 0x0a3c, %r5
	.word 0xb6fa2784  ! 430: SDIVcc_I	sdivcc 	%r8, 0x0784, %r27
	.word 0xe73a0009  ! 437: STDF_R	std	%f19, [%r9, %r8]
	.word 0xce5a0009  ! 437: LDX_R	ldx	[%r8 + %r9], %r7
	.word 0x82ba0009  ! 437: XNORcc_R	xnorcc 	%r8, %r9, %r1
	.word 0xa2320009  ! 437: ORN_R	orn 	%r8, %r9, %r17
	.word 0xa3643801  ! 437: MOVcc_I	<illegal instruction>
	.word 0x84f22d64  ! 437: UDIVcc_I	udivcc 	%r8, 0x0d64, %r2
	.word 0xd62a0009  ! 443: STB_R	stb	%r11, [%r8 + %r9]
	.word 0xcc120009  ! 443: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x88220009  ! 443: SUB_R	sub 	%r8, %r9, %r4
	.word 0x868a2540  ! 443: ANDcc_I	andcc 	%r8, 0x0540, %r3
	.word 0x97782401  ! 443: MOVR_I	move	%r0, 0x540, %r11
	.word 0xb47a0009  ! 443: SDIV_R	sdiv 	%r8, %r9, %r26
	.word 0xfe320009  ! 451: STH_R	sth	%r31, [%r8 + %r9]
	.word 0xc6120009  ! 451: LDUH_R	lduh	[%r8 + %r9], %r3
	.word 0x88820009  ! 451: ADDcc_R	addcc 	%r8, %r9, %r4
	.word 0xbc322db8  ! 451: SUBC_I	orn 	%r8, 0x0db8, %r30
	.word 0x86c20009  ! 451: ADDCcc_R	addccc 	%r8, %r9, %r3
	.word 0x98f22288  ! 451: UDIVcc_I	udivcc 	%r8, 0x0288, %r12
	.word 0xf33a0009  ! 457: STDF_R	std	%f25, [%r9, %r8]
	.word 0xe0020009  ! 457: LDUW_R	lduw	[%r8 + %r9], %r16
	.word 0x84320009  ! 457: ORN_R	orn 	%r8, %r9, %r2
	.word 0x86b20009  ! 457: ORNcc_R	orncc 	%r8, %r9, %r3
	.word 0x9a120009  ! 457: OR_R	or 	%r8, %r9, %r13
	.word 0x856a2ed0  ! 457: SDIVX_I	sdivx	%r8, 0x0ed0, %r2
	.word 0xca2a0009  ! 463: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xcc1a0009  ! 463: LDD_R	ldd	[%r8 + %r9], %r6
	.word 0x883a2c90  ! 463: XNOR_I	xnor 	%r8, 0x0c90, %r4
	.word 0x873a2001  ! 463: SRA_I	sra 	%r8, 0x0001, %r3
	.word 0xa00a22cc  ! 463: AND_I	and 	%r8, 0x02cc, %r16
	.word 0x856a0009  ! 463: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0x0
	.word 0xc7220009  ! 473: STF_R	st	%f3, [%r9, %r8]
	.word 0xc85a0009  ! 473: LDX_R	ldx	[%r8 + %r9], %r4
	.word 0x853a1009  ! 473: SRAX_R	srax	%r8, %r9, %r2
	.word 0x83321009  ! 473: SRLX_R	srlx	%r8, %r9, %r1
	.word 0x882a0009  ! 473: ANDN_R	andn 	%r8, %r9, %r4
	.word 0x856a24f0  ! 473: SDIVX_I	sdivx	%r8, 0x04f0, %r2
	.word 0xf02a0009  ! 481: STB_R	stb	%r24, [%r8 + %r9]
	.word 0xcc120009  ! 481: LDUH_R	lduh	[%r8 + %r9], %r6
	.word 0x8c2a0009  ! 481: ANDN_R	andn 	%r8, %r9, %r6
	.word 0x868a2ca8  ! 481: ANDcc_I	andcc 	%r8, 0x0ca8, %r3
	.word 0x8ca227ec  ! 481: SUBcc_I	subcc 	%r8, 0x07ec, %r6
	.word 0x866a2a18  ! 481: UDIVX_I	udivx 	%r8, 0x0a18, %r3
	.word 0xca2a0009  ! 487: STB_R	stb	%r5, [%r8 + %r9]
	.word 0xd6020009  ! 487: LDUW_R	lduw	[%r8 + %r9], %r11
	.word 0x8e022af0  ! 487: ADD_I	add 	%r8, 0x0af0, %r7
	.word 0x86120009  ! 487: OR_R	or 	%r8, %r9, %r3
	.word 0x872a0009  ! 487: SLL_R	sll 	%r8, %r9, %r3
	.word 0x82fa2cbc  ! 487: SDIVcc_I	sdivcc 	%r8, 0x0cbc, %r1
	.word 0xc62a0009  ! 493: STB_R	stb	%r3, [%r8 + %r9]
	.word 0xfe0a0009  ! 493: LDUB_R	ldub	[%r8 + %r9], %r31
	.word 0x8a8a0009  ! 493: ANDcc_R	andcc 	%r8, %r9, %r5
	.word 0x8e3a0009  ! 493: XNOR_R	xnor 	%r8, %r9, %r7
	.word 0xb89226c0  ! 493: ORcc_I	orcc 	%r8, 0x06c0, %r28
	.word 0x8afa0009  ! 493: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0xc9220009  ! 499: STF_R	st	%f4, [%r9, %r8]
	.word 0xca0a0009  ! 499: LDUB_R	ldub	[%r8 + %r9], %r5
	.word 0x88aa2db8  ! 499: ANDNcc_I	andncc 	%r8, 0x0db8, %r4
	.word 0xa9782401  ! 499: MOVR_I	move	%r0, 0xdb8, %r20
	.word 0xbf3a1009  ! 499: SRAX_R	srax	%r8, %r9, %r31
	.word 0x847a2cb4  ! 499: SDIV_I	sdiv 	%r8, 0x0cb4, %r2
	nop
	nop
	nop
        ta      T_GOOD_TRAP

th_main_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r8
        setx  0x0000000000000c80, %g1, %r9
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
        setx  0x09e5d9ffbefdaa6a, %g1, %r0
        setx  0x2483af217744634c, %g1, %r1
        setx  0x097ef83e410eccca, %g1, %r2
        setx  0x780b24a5cd32bb65, %g1, %r3
        setx  0x3ec00c590f9bfd5c, %g1, %r4
        setx  0xafd135a02df1f141, %g1, %r5
        setx  0x555892c5e9a2e487, %g1, %r6
        setx  0xc532c318d825a229, %g1, %r7
        setx  0x9133b56fded416a1, %g1, %r10
        setx  0x3b62a972a711e8d5, %g1, %r11
        setx  0xa422cf25ed5d4768, %g1, %r12
        setx  0x001a8ad42edc8437, %g1, %r13
        setx  0xa12384c6fd6d0fff, %g1, %r14
        setx  0xc9b47974fa335d8c, %g1, %r15
        setx  0xa68e5316cf9852ac, %g1, %r16
        setx  0xd2e49b6269bb8ad8, %g1, %r17
        setx  0xc14c76a26bb5fbe0, %g1, %r18
        setx  0xb3d91206070b2729, %g1, %r19
        setx  0xb08a9e10a72cec9d, %g1, %r20
        setx  0x40998f3464141c1c, %g1, %r21
        setx  0x41f056ea9b97d7ef, %g1, %r22
        setx  0xc84709a4acb952b8, %g1, %r23
        setx  0x23536cd465c77012, %g1, %r24
        setx  0x21d03ea1f5853327, %g1, %r25
        setx  0x9862138a8a286392, %g1, %r26
        setx  0xb76ea8e2f4f5958e, %g1, %r27
        setx  0x28951e2af1e824d4, %g1, %r28
        setx  0x86b89574f6c7b5d7, %g1, %r29
        setx  0xabcf312955e3ab9a, %g1, %r30
        setx  0xccc95032c66ccc7a, %g1, %r31
	.word 0xaa720009  ! 5: UDIV_R	udiv 	%r8, %r9, %r21
	.word 0x8af20009  ! 6: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0x866a2e14  ! 7: UDIVX_I	udivx 	%r8, 0x0e14, %r3
	.word 0x856a21a8  ! 8: SDIVX_I	sdivx	%r8, 0x01a8, %r2
	.word 0x84fa267c  ! 9: SDIVcc_I	sdivcc 	%r8, 0x067c, %r2
	.word 0x8cfa0009  ! 16: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0xbe7224dc  ! 17: UDIV_I	udiv 	%r8, 0x04dc, %r31
	.word 0x847a0009  ! 18: SDIV_R	sdiv 	%r8, %r9, %r2
	.word 0x82f22674  ! 31: UDIVcc_I	udivcc 	%r8, 0x0674, %r1
	.word 0x867a0009  ! 38: SDIV_R	sdiv 	%r8, %r9, %r3
	.word 0x8a720009  ! 39: UDIV_R	udiv 	%r8, %r9, %r5
	.word 0xba72272c  ! 46: UDIV_I	udiv 	%r8, 0x072c, %r29
	.word 0x86f221ec  ! 47: UDIVcc_I	udivcc 	%r8, 0x01ec, %r3
	.word 0x84722460  ! 48: UDIV_I	udiv 	%r8, 0x0460, %r2
	.word 0xb87a0009  ! 55: SDIV_R	sdiv 	%r8, %r9, %r28
	.word 0x0
	.word 0x9c720009  ! 75: UDIV_R	udiv 	%r8, %r9, %r14
	.word 0xb47a0009  ! 88: SDIV_R	sdiv 	%r8, %r9, %r26
	.word 0x886a2844  ! 89: UDIVX_I	udivx 	%r8, 0x0844, %r4
	.word 0x8af20009  ! 96: UDIVcc_R	udivcc 	%r8, %r9, %r5
	.word 0x9ef2239c  ! 115: UDIVcc_I	udivcc 	%r8, 0x039c, %r15
	.word 0x8cfa2578  ! 116: SDIVcc_I	sdivcc 	%r8, 0x0578, %r6
	.word 0x8afa0009  ! 117: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x856a0009  ! 124: SDIVX_R	sdivx	%r8, %r9, %r2
	.word 0xb16a249c  ! 155: SDIVX_I	sdivx	%r8, 0x049c, %r24
	.word 0x827222a4  ! 156: UDIV_I	udiv 	%r8, 0x02a4, %r1
	.word 0x94f20009  ! 169: UDIVcc_R	udivcc 	%r8, %r9, %r10
	.word 0xb47a0009  ! 188: SDIV_R	sdiv 	%r8, %r9, %r26
	.word 0x8e7a2a94  ! 219: SDIV_I	sdiv 	%r8, 0x0a94, %r7
	.word 0xa2fa0009  ! 220: SDIVcc_R	sdivcc 	%r8, %r9, %r17
	.word 0xbe7a2acc  ! 233: SDIV_I	sdiv 	%r8, 0x0acc, %r31
	.word 0x0
	.word 0x8f6a0009  ! 235: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x84fa0009  ! 236: SDIVcc_R	sdivcc 	%r8, %r9, %r2
	.word 0xae722ec8  ! 249: UDIV_I	udiv 	%r8, 0x0ec8, %r23
	.word 0x8efa0009  ! 256: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x0
	.word 0xb0fa230c  ! 270: SDIVcc_I	sdivcc 	%r8, 0x030c, %r24
	.word 0x8c6a0009  ! 271: UDIVX_R	udivx 	%r8, %r9, %r6
	.word 0x8a6a0009  ! 272: UDIVX_R	udivx 	%r8, %r9, %r5
	.word 0x84f220c8  ! 279: UDIVcc_I	udivcc 	%r8, 0x00c8, %r2
	.word 0x8cfa0009  ! 286: SDIVcc_R	sdivcc 	%r8, %r9, %r6
	.word 0x896a281c  ! 287: SDIVX_I	sdivx	%r8, 0x081c, %r4
	.word 0xac722240  ! 288: UDIV_I	udiv 	%r8, 0x0240, %r22
	.word 0x9c6a2444  ! 307: UDIVX_I	udivx 	%r8, 0x0444, %r14
	.word 0x8e6a0009  ! 308: UDIVX_R	udivx 	%r8, %r9, %r7
	.word 0x84f2257c  ! 333: UDIVcc_I	udivcc 	%r8, 0x057c, %r2
	.word 0x836a0009  ! 334: SDIVX_R	sdivx	%r8, %r9, %r1
	.word 0x88722cc4  ! 347: UDIV_I	udiv 	%r8, 0x0cc4, %r4
	.word 0xbaf22864  ! 348: UDIVcc_I	udivcc 	%r8, 0x0864, %r29
	.word 0x8efa0009  ! 349: SDIVcc_R	sdivcc 	%r8, %r9, %r7
	.word 0x8afa0009  ! 356: SDIVcc_R	sdivcc 	%r8, %r9, %r5
	.word 0x8a7221cc  ! 357: UDIV_I	udiv 	%r8, 0x01cc, %r5
	.word 0x8672249c  ! 358: UDIV_I	udiv 	%r8, 0x049c, %r3
	.word 0x976a2604  ! 359: SDIVX_I	sdivx	%r8, 0x0604, %r11
	.word 0x88fa0009  ! 360: SDIVcc_R	sdivcc 	%r8, %r9, %r4
	.word 0xb272281c  ! 373: UDIV_I	udiv 	%r8, 0x081c, %r25
	.word 0x9f6a21a4  ! 398: SDIVX_I	sdivx	%r8, 0x01a4, %r15
	.word 0xb4fa0009  ! 411: SDIVcc_R	sdivcc 	%r8, %r9, %r26
	.word 0x0
	.word 0x82720009  ! 431: UDIV_R	udiv 	%r8, %r9, %r1
	.word 0x84f20009  ! 444: UDIVcc_R	udivcc 	%r8, %r9, %r2
	.word 0xbcfa2624  ! 445: SDIVcc_I	sdivcc 	%r8, 0x0624, %r30
	.word 0x8c7a0009  ! 464: SDIV_R	sdiv 	%r8, %r9, %r6
	.word 0x876a23e0  ! 465: SDIVX_I	sdivx	%r8, 0x03e0, %r3
	.word 0x0
	.word 0x826a2e60  ! 467: UDIVX_I	udivx 	%r8, 0x0e60, %r1
	.word 0x86f20009  ! 474: UDIVcc_R	udivcc 	%r8, %r9, %r3
	.word 0x8cf20009  ! 475: UDIVcc_R	udivcc 	%r8, %r9, %r6
	nop
	nop
	nop
        ta      T_GOOD_TRAP

.data
	.word  0x3ca497f9,0x2d76b1b9,0xf7ede815,0x4bdf931d
	.word  0xee2aaedc,0x5f4b69a5,0x88732f5c,0xfe226813
	.word  0x3be04892,0x86614437,0xeab15dab,0x0933ac49
	.word  0x821f48cb,0x4efce545,0x9dbe075c,0x99d634c8
	.word  0xf0bb1e84,0x1770f64f,0xb2942395,0x094e9f3d
	.word  0xcc14cce4,0x4fb00d40,0x77bbee66,0xa0e88e41
	.word  0x2739e30f,0x26ce2c5e,0x4353cc5e,0xf6c4273b
	.word  0xad520d26,0xc50285af,0xc3716aba,0xeabd2156
	.word  0x08b1109a,0x40f30aee,0x5e58cc98,0x09860284
	.word  0x44b0db39,0x464e883e,0x8f0c31f4,0x1f5fc790
	.word  0x59ddb1ab,0x75ae526f,0x61c3881d,0xf7811f7a
	.word  0x13f34046,0x9ea33e52,0xce4036bd,0x29ddc5ea
	.word  0x802f9431,0xae1d4789,0x024b75f2,0x6dec663d
	.word  0x243dede0,0xc02ef5d5,0xe864b47a,0x02948387
	.word  0xdd72e9f1,0x5ee8700c,0x82cc3ad2,0x07d5da3b
	.word  0x76561e05,0x69db2f63,0x5d6bd8ad,0x6a1cfb02
	.word  0x64a26e12,0x3f68ccd6,0xf5dcae27,0x5aaf3ba2
	.word  0x3c93d1f8,0x186b2cb1,0x4805cd5a,0xd8709b65
	.word  0xd8513a56,0x74261a3b,0xb77d34c9,0x6f594028
	.word  0x9905acde,0x0e646813,0x7234143f,0xc7140a10
	.word  0x80e7ecc4,0x51a1d162,0xa45d4c45,0xbc909598
	.word  0x5f0c606d,0x5b8e0aef,0x55aa8463,0xdfb7ff2e
	.word  0x09cb3c9f,0x6f3da0a5,0xceb6f6e9,0x2cb74d1a
	.word  0xd6364970,0x85420ad1,0x1a1c73aa,0xfa2a558f
	.word  0x3a442a00,0x8a355b70,0x384a473d,0x6ddcbf2e
	.word  0xbf5ca382,0x90dc1a2b,0x8939060b,0x3f8515c3
	.word  0x571752a6,0xd09e1522,0xb4481a63,0xe80c63f1
	.word  0x624d981c,0xeeabc0c8,0x0e2489cf,0x8f4f0a44
	.word  0xd9aebbae,0xa6c5a73b,0xed1bf03d,0xe11d225d
	.word  0x3846c63d,0xeec37ad8,0x60abe559,0x5689864f
	.word  0xb2df3d62,0x36e9ae09,0xe57ce877,0x6dd9295c
	.word  0xa69284f0,0xe335f6ee,0x8b29a5e2,0x7fb3e5db
	.word  0x2a88ee95,0xf1207f3e,0x8e6d2ee5,0x93cd8320
	.word  0x4ef45078,0xf7359165,0xb0f838e2,0xabece031
	.word  0x8e05d5b9,0x245a4fd0,0x8903e0d2,0xeaa00ccf
	.word  0xd8193ccd,0x71a577a4,0x4941b5f2,0xfe35993f
	.word  0x288046b6,0x931b5738,0x5ba70093,0x82cc2a34
	.word  0x0345276d,0x5738cbf8,0x25399644,0x446782b9
	.word  0x9ab1af38,0xe3438987,0x319dd3a4,0x1f887439
	.word  0x9dc13ec3,0x9ed8a01d,0x38169588,0x045d4a8d
	.word  0xfd74cb2c,0x2cd2767a,0x27fd7d37,0x6a157645
	.word  0x7c4fb67e,0xa3d74eeb,0x0f04672d,0x26be5044
	.word  0x3d4c55b0,0xec729fe3,0x67baf57e,0x5efdbdf0
	.word  0xf5ba7b6f,0x9aa16259,0x7e310faa,0x359e6ead
	.word  0x128cd433,0x64d071f3,0xc904f402,0xc451d6bf
	.word  0xdaff5c02,0xef5503c0,0x670b908d,0x6111fea0
	.word  0xac199258,0x56d31472,0x889cddd8,0x2261a336
	.word  0xff87ef90,0x86c68188,0x846efbf7,0xe52a72ea
	.word  0xc0ebc538,0x1046fb90,0xf7ba53be,0x53789bec
	.word  0xe7a4df16,0x248c2846,0x8a679e4b,0x649c61bb
	.word  0xea06f665,0x6749bdc0,0x6587b8f4,0x48cc8855
	.word  0x455f65d1,0x857a2cc2,0x6c53c530,0xb872550a
	.word  0x36c0c000,0x0837353d,0xa9420302,0x6b5a5031
	.word  0x6261836b,0xaa869259,0xb8d810e9,0x82ecfbba
	.word  0x212841d5,0xab7a3a49,0x2139381a,0xd5634318
	.word  0x867d5f42,0xfc04e4f7,0x9eb6fa0b,0x144cbb12
	.word  0xbd5ddcbb,0x8d717711,0x6a5daa35,0xf8a3baf9
	.word  0xad4ac25d,0x88342d0d,0xb8fc60da,0x5ec8f0bc
	.word  0x3e4c0975,0x29f8b94a,0x45cb66f0,0x56289ece
	.word  0xae08b3bf,0xc994dcfc,0x218aac7a,0xc9cbc0fd
	.word  0x893ba961,0x0b898357,0xc9dfc853,0x477f4be7
	.word  0xb805fdc5,0x29a2ebbe,0xc7d76f37,0x094a576e
	.word  0x2f8d6496,0x767a7b29,0x087afc21,0xf435c03d
	.word  0x72a4d5f6,0x37254838,0x7fe77655,0x9d292b98
	.word  0x2584e6aa,0xe57cddf8,0xb020b835,0xe130076a
	.word  0x0edc5de4,0xacb26e46,0x8b08c8af,0x2ac3133c
	.word  0xa79e0a44,0xa553305f,0x36052019,0x429e36ea
	.word  0x56218ef8,0xe7f1b7dc,0xe67e48e8,0x9e709f6f
	.word  0xfc0b4bd7,0xde30502d,0x55382e4c,0x937477c1
	.word  0x7a9dfbf6,0x6afc9366,0x206eb74f,0x7b21b176
	.word  0x22f7205f,0xfaff3684,0xfdccb522,0xc84c21ea
	.word  0x911f541b,0x93313eab,0x6609aa3e,0x73e055fd
	.word  0x5d416c29,0x4a89e553,0xf61db12a,0xa2196bd2
	.word  0x79159d2f,0x6dbcb6b5,0x6e09de7e,0xd7963a55
	.word  0x2b2289ac,0x23c3ae1e,0x12280a90,0x8d872808
	.word  0x508a75b6,0x83a128da,0xf12dedf1,0x76c9ec6d
	.word  0xcd03ec0b,0xa42bb069,0xb646e12f,0x354248bd
	.word  0x13df7a67,0x5e4d97e4,0x54846521,0x458fbcb7
	.word  0x5782492f,0xf4dcbe31,0xbb0cad4b,0xc9dfa538
	.word  0xc4889ba6,0x97d911b7,0x46dcb607,0x646b3bab
	.word  0x6e140140,0x8086055a,0x7d0b7262,0x5acbd460
	.word  0x93ffab14,0x30a1c5a5,0x0e1fedbc,0x34fa2089
	.word  0xac044967,0x78fbcce8,0x468c9367,0x80c33e2d
	.word  0x543c2bc8,0x7c9f69c0,0xf9633d0a,0x13ecb17e
	.word  0xdb60c3aa,0x42a03ca6,0x1df22dff,0x2a3aa8ff
	.word  0x256c25f4,0x7c975219,0x5b211ca2,0x3868c4dc
	.word  0xdd73dcad,0xd1b17dd7,0x6e9c3c67,0x65f9a58c
	.word  0x8bbb325a,0x99af1033,0xe5e27c0c,0xd58c2a21
	.word  0xaf190467,0x241cf35c,0x037d8aea,0x1d835e6a
	.word  0x5104b24c,0x26b7d7f1,0x3162403b,0xe29ebb46
	.word  0x6d4ee7a9,0xa710d44f,0x6c0e31aa,0xe627d58a
	.word  0x9b971991,0x20a7109f,0xee094404,0xc498bd27
	.word  0xafd78bfd,0xfeeb4863,0x9d4449a1,0x92f58c1c
	.word  0x2b82106a,0x01b9fbef,0xf47d5ff4,0x6041309c
	.word  0xbf827697,0x276a3662,0x4b8dfc12,0x1bf4da53
	.word  0x81786195,0x6130e38d,0x1e0056b6,0xd66e96da
	.word  0x16e326ae,0x47c421e0,0x73c510ad,0x78d3cab2
	.word  0x6d0f2ecc,0xf01078d2,0x4bb85f0b,0x54676d94
	.word  0x973906ac,0x49b47087,0x87c0d55b,0xfd6eb92e
	.word  0xb2a25d9b,0x74b3f828,0xfb452c89,0x6e5035fa
	.word  0xf3c3fb45,0xcf25564d,0xb53025f0,0x6e5ba65c
	.word  0x8a62695f,0xb0df552d,0x7c775dbd,0xe0d99097
	.word  0xbe0cec88,0xb4ef915f,0x6e150402,0x47b03221
	.word  0x7d07a4b6,0x8313e787,0x4389e56a,0xcc3a2f90
	.word  0x76cf1d17,0x93839422,0x11bd49b1,0x5673e0ce
	.word  0x507950d5,0xd531c55f,0x1af9f44d,0x365ac135
	.word  0x59926a52,0x7985e9e1,0x459b49d0,0xcf2cd123
	.word  0xe0eb29e2,0xe9e9a07b,0x9362fe92,0x8fac86d2
	.word  0x0b8cfeb1,0xb159c3b2,0x22e246aa,0xc99a20e1
	.word  0x3399af50,0x7c618aa1,0x6f5eef97,0x36317036
	.word  0x959a6467,0xe1ef1785,0x3f05c3ba,0x30b9a7b2
	.word  0x17b8d660,0xd95a09a3,0x63601ecb,0xebcf1030
	.word  0x80ac4207,0x86f3ace5,0x35179969,0x52943e5f
	.word  0xbf539acd,0x0a14954c,0x1218f8f7,0x76ac3840
	.word  0x15703b38,0xf346c0cb,0x32bea9ca,0x70bc5833
	.word  0x4d12afc7,0xe3e6982f,0x93a3e7a9,0xf6ccd197
	.word  0x908baabc,0x39706744,0x73aa1c15,0xc23707d8
	.word  0x02c448f9,0xf89cba15,0xdaf0a160,0x92c24b58
	.word  0x1193748c,0xa3d4eea2,0x7387b803,0xe6c48267
	.word  0x926937e4,0x2509fc49,0x3855fa74,0x4dae6af8
	.word  0xcafb140f,0xf145f2d5,0x939c593b,0x6ee09c43
	.word  0x6ac8cfdb,0xead36215,0x3dee3a97,0x164d5188
	.word  0xed65aa93,0x6ea23b8d,0x0922267c,0x318cf533
	.word  0xa705b3ab,0x389cb65f,0x644d7eff,0xda354d65
	.word  0x45fc3ab3,0x08a7aacb,0x4f229067,0x7c149d91
	.word  0x28fd1cb5,0xde7c3a5b,0x2407df63,0x90c3984d
	.word  0xbceb27fa,0x69866474,0xcd6c4d1c,0x90837942
	.word  0x91e79c0a,0xc7b1703a,0x6da2331b,0xe21826c3
	.word  0x30a0eae9,0xf92fac83,0x7b230446,0xcd9da21c
	.word  0x0df64ecc,0xd55214a6,0x8c689d9e,0x05b8e543
	.word  0x2d97a2ad,0x319913c5,0x22628aa0,0x195c4a05
	.word  0x3ca09eb1,0xe741bffb,0x0886c7b9,0x34e27ef8
	.word  0xfb5782ee,0x406c1525,0x6f9577a6,0xbbc536c5
	.word  0x0f00ff46,0x4191aa84,0xf4eff19d,0x5805c1f0
	.word  0xfbcbeb86,0x0c5aa729,0x8d2d58b1,0xb0bd777b
	.word  0xba296c0e,0x6ffccbe5,0x868e2a24,0xe0374dff
	.word  0x05a20f75,0x20d6f144,0xbcc96ae8,0x44459e2f
	.word  0x69626f65,0x204b02a6,0x4968c5fd,0xf119f7da
	.word  0xd4b85606,0x389e0d87,0x235d05e1,0xb92f2664
	.word  0xbe9a1991,0xbb9a0682,0x49b9f149,0xdfde3d23
	.word  0x3333f201,0xb685c9e9,0x839e6d9f,0x4e9b2404
	.word  0x4a23933a,0x49f13ac3,0xd9a25372,0xebd8cda6
	.word  0x210ad570,0xe0d89308,0x375ff913,0xe99cb16a
	.word  0xd469b077,0xef5e131c,0xc6159d75,0x49603a98
	.word  0xf2742ff7,0xc51d8a7a,0x5dce08b6,0x85859697
	.word  0x04ed1d90,0x0b3c1e42,0xfcd5b7f8,0xc3aa8592
	.word  0xe0cd13e7,0x370c59c2,0x94b05eb0,0x06f0a3ea
	.word  0x1c2fbc82,0x5b231bf0,0xb1e29ec0,0x99edd514
	.word  0x5dc3b8ae,0x63fac786,0x99da8733,0xa69fd67f
	.word  0x9d1fa6d4,0x67b80bef,0x590c9292,0x462dd578
	.word  0xb980a226,0x9d261c8c,0x926adc23,0xe0ce6047
	.word  0x063a71c3,0x4f8b166d,0x63383f72,0x4f4202d5
	.word  0xfcbda9d6,0xc5cbbe5b,0x995f8c6f,0x55d26e95
	.word  0x9605ceb0,0xcb1b890d,0x4fa98872,0x26844a29
	.word  0x441ff127,0x94789aba,0x7e3c0944,0x1db88ce8
	.word  0xa7a33db2,0xca2cdf59,0xc285b5c5,0x0745e9c8
	.word  0x1bbbc984,0x135ea9b5,0x0c835226,0xf7761819
	.word  0x0b346b20,0x5e106110,0x55556647,0x65c29c10
	.word  0xc224d443,0x27f08292,0xfc7a7cb3,0x60a7e459
	.word  0x7f31766b,0x320691f0,0x46c29c11,0x4e18b158
	.word  0xca5bcb74,0x1beb04c3,0x3c14e6fb,0x363bf924
	.word  0xd59e1500,0x4479fa1a,0xfea089bf,0x3bfbba43
	.word  0x222ae63a,0x4477c78d,0x57b0dc82,0x3a13f243
	.word  0xa7c2047d,0x466445ba,0x61a9526a,0x028dac21
	.word  0xd9095adb,0x6f6f70de,0xb2fd4fb6,0x7b81d527
	.word  0xf619b02c,0xc3d5d49b,0x10e1fdbe,0x20c12414
	.word  0xf50b2bc7,0x3daec464,0x680b32b4,0xa0c3d2a9
	.word  0x12f8598f,0xf543a12b,0xc165f39b,0x9dff3c37
	.word  0x0fbd665b,0x7e0efb4e,0x20725997,0x2c23354d
	.word  0xf9a5a5fa,0x1b31cb8c,0x3dc7b046,0x157e5fdd
	.word  0x4293bece,0x880166ba,0x47c37f21,0x9bd503cb
	.word  0xcb829209,0x5f19ead7,0xbaedc3f1,0x86a2af9d
	.word  0xa6986a97,0x2d355324,0x1ae68c85,0x2fdf6efb
	.word  0xac006402,0x96b070aa,0x5c107a0d,0xbaf9d2ba
	.word  0xcc470cd1,0x39cdd666,0x1145f59a,0xe88da2af
	.word  0x07086674,0x4307a18b,0xc68e5505,0x3a1344a3
	.word  0x4b4fd146,0x0c2eecfb,0xe0189ae5,0x82197957
	.word  0x2a27ce19,0xc7a11263,0x2f309bc4,0x59874f97
	.word  0xb4c90230,0xdb2f964d,0x25e2ad65,0x059f5011
	.word  0x21201b4d,0x7ebd76e2,0x1d174c0b,0xbca89a1e
	.word  0xa47e93f3,0x6edbbefb,0xc27d5fa8,0x126f9a65
	.word  0xf2c77743,0xa9c0b81f,0x6cdf4830,0x4784fd45
	.word  0xc06baf98,0xf9df96a3,0x1b48bbd3,0xcb03e7e2
	.word  0xb6c2a47e,0xd760171b,0xdaaccb50,0xf9674b35
	.word  0xed5ee04f,0x33f298a1,0xe4ece494,0x19764faf
	.word  0xabd28a94,0x64f763cc,0xee1bcae9,0xd0d47fee
	.word  0x8d5a2816,0x51c8c2f1,0x72c4e222,0xedd5812e
	.word  0x60a44dbe,0xbb3edfdc,0xed473615,0x1aa8eae9
	.word  0x1927a7cd,0x8ecee7cd,0x0985640a,0x3bf71438
	.word  0x72bc4eb9,0xdc0ecd1c,0x942d24f2,0x024cc9ee
	.word  0xc3159973,0x73352b16,0x8bc0430e,0xc511f6f2
	.word  0x45589732,0xdf544d97,0x81946d19,0x93b5ada7
	.word  0x6b53a015,0x9626805b,0x26c43e4f,0x2e564a5a
	.word  0x27f97d3a,0x95ce9e08,0xaada151c,0xbd457b61
	.word  0xbb33166b,0x3087dbf6,0x368c2ae4,0x71d5951b
	.word  0x1b73a001,0x0a3036cf,0xcceeeac1,0xc4047953
	.word  0xd39fc797,0xeee9ae79,0x0e0640b4,0x8256c5dc
	.word  0x9ad9635e,0x23205e7c,0xfd41d387,0x0afa6c77
	.word  0x604ccf84,0x0abc52e1,0xe2a40d15,0x5aeba9e1
	.word  0x1bcda595,0x346450e7,0xd69bc761,0x41a31f58
	.word  0x11449b2e,0x8eea1fde,0x318c064e,0x1d3569a4
	.word  0x489591f8,0xa5c02da3,0xa196a8ab,0x0ff75f68
	.word  0x914b05a3,0x753696ef,0xf6c113a7,0x96c8835d
	.word  0xaca76857,0x867efd3d,0x87bdeb4a,0x039f9a6e
	.word  0x15dad985,0x08764d8d,0x9f860b62,0x3e87ed2a
	.word  0x31198df7,0x2bb7611e,0x8aab1116,0xb46d13e3
	.word  0x764ce107,0xf3dd6af0,0x8f46b1ff,0x452d6bee
	.word  0x653648a2,0x8cb88070,0x4479362d,0x1e085e7c
	.word  0x3d7e7ae8,0xd4124256,0xc7ac22a9,0xd50e4bf4
	.word  0x452d78ed,0x3067fa6c,0x54042268,0xf0f99bcd
	.word  0x6e736748,0xf3f4e11f,0x10a23305,0x95b022e9
	.word  0x135aca75,0xe2a70c5b,0x4620ba45,0x5247bdd6
	.word  0x28d805ec,0xf4a1b22d,0x78fcc690,0x3108a052
	.word  0x2409d9e6,0x487fc49b,0x01825158,0x9d66d0f9
	.word  0xe45256de,0x31a0c249,0x8780aa3a,0x400babd7
	.word  0x25bba0a7,0x9e87aa51,0xd3e73e1f,0x593501af
	.word  0xccb54010,0xa45ea666,0x1e584c70,0x98b527fa
	.word  0x8501e9dd,0x40ac0499,0x122ccece,0x5f468b66
	.word  0xe99f9041,0xb56a25ca,0x27e570ca,0xedf6cde4
	.word  0x7aeea9bc,0x0f7eb4b4,0x559f7578,0x071603ef
	.word  0xe46ab730,0xba1e79d9,0x75ab3ba2,0x978997cd
	.word  0x5126b79b,0xa46a822f,0x6aa7d6fa,0x015d4590
	.word  0xd9c79462,0x74689180,0x1b68f506,0x3059ba76
	.word  0x4593c427,0x34745025,0x78995749,0xb33edec2
	.word  0x8ac1de36,0x09070cf6,0x2e8523e5,0xff6646c2
	.word  0xb2c16ac5,0xe8a336c4,0xab6c3a85,0x171c2ea9
	.word  0x66cde9d7,0x47411e4a,0x1933d9d2,0xf3c27bc3
	.word  0xe9071e67,0xb4ae41dd,0x9f25f7d2,0xc6447792
	.word  0xf5531b33,0x7c7ee171,0xa4daeb19,0xb8aa92cf
	.word  0xb67dc042,0x65c4d405,0x9e48b92c,0x12f75ab5
	.word  0x3b542a1e,0x55d7eaff,0x66c0e0da,0xd0b6793d
	.word  0x296f7172,0x5c0e51ae,0x0bc98631,0xda9efa8e
	.word  0xeccfd180,0x6e7140b9,0xe360f9d6,0xb142f197
	.word  0x12acba9d,0x68626c87,0x7710aef1,0x478ec790
	.word  0xd7ccd1a4,0xac50eaf5,0x8d026a54,0x4e2a5eb7
	.word  0x61937227,0x3d09c304,0xab0e6e55,0x95d644e3
	.word  0xa002ff68,0xb84662bc,0x1508f560,0xb8c9689c
	.word  0x6f71d5e6,0x45d4b013,0x7057053d,0xeef76556
	.word  0x8ddb51f9,0x684d0b9f,0x7ce3702d,0xb7f0f164
	.word  0x3f3dee70,0xe9715e87,0xb94f4009,0x28e7498f
	.word  0xcd3f5d08,0xfcdcd03f,0x6c18e517,0x94f10422
	.word  0x486962f2,0x391afc3e,0xe06888ff,0x33355191
	.word  0xf6bcfc0f,0xded29449,0x562e1627,0x7172c864
	.word  0xfc606d9c,0x8423d196,0xf185b502,0xcfaeb00f
	.word  0x3c53020f,0x92015867,0x107dce79,0x5d3c1788
	.word  0x1b0a7376,0x562ba1e1,0x10c91d2b,0xf24c5eaf
	.word  0xe20c6cf0,0xc1b844c0,0xcda382f8,0x486f2f52
	.word  0xa0d0825d,0x72bcd226,0xe2372acb,0xf5d6092a
	.word  0xa809ea4e,0x813a3d34,0x0bff2e16,0x892b4769
	.word  0xc8a38447,0xf69d8bac,0xa94e85ae,0xf74f3702
	.word  0xcd93ca4e,0xe633117c,0xe8a11e94,0x5db7bfbf
	.word  0xb6464b20,0x80732b9f,0x5641ed8f,0xaa8f0ff3
	.word  0x70e9aa7c,0x2255ffd4,0x4e28cd8f,0x29af3ad0
	.word  0xcd307521,0x883fb1ee,0xbc0c5108,0xd6e027fa
	.word  0x8be52bbe,0xb2eb55d3,0x9b10a08f,0xcc5cdc19
	.word  0x778dd182,0x05511fef,0x57feac8b,0xf34c744a

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
!!#   IJ_set_rvar (divd_wt, "{10}");
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
!!# inst_type: stb_raw_alu_alu_alu_div %rvar mrbw_wt
!!# 	   | ill_inst %rvar ill_wt
!!#            | div %rvar divd_wt 
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
!!# stb_raw_alu_alu_alu_div: store load alu alu alu div
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
!!# div: tUDIV_I | tUDIV_R | tSDIV_I | tSDIV_R | tSDIVX_R | tSDIVX_I | tUDIVX_R | tUDIVX_I | tUDIVcc_I | tUDIVcc_R | tSDIVcc_I | tSDIVcc_R
!!# ;
!! Token Generation Statistics
!! ---------------------------------
!! 
!! Rule   1 (line  112), Count:   499  inst_block           -> inst_type 
!! Rule   2 (line  113), Count:   499  inst_block           -> inst_block inst_type 
!! Rule   3 (line  116), Count:   358  inst_type            -> stb_raw_alu_alu_alu_div 
!! Rule   4 (line  117), Count:     4  inst_type            -> ill_inst 
!! Rule   5 (line  118), Count:   135  inst_type            -> div 
!! Rule   6 (line  124), Count:     4  ill_inst             -> mMETA0 
!! Rule   7 (line  130), Count:   358  stb_raw_alu_alu_alu_div -> store load alu alu alu div 
!! Rule   8 (line  136), Count:    19  store                -> tSTB_R 
!! Rule   9 (line  136), Count:    14  store                -> tSTH_R 
!! Rule  10 (line  136), Count:    10  store                -> tSTW_R 
!! Rule  11 (line  136), Count:     2  store                -> tSTX_R 
!! Rule  12 (line  136), Count:    12  store                -> tSTF_R 
!! Rule  13 (line  136), Count:     9  store                -> tSTDF_R 
!! Rule  14 (line  139), Count:    13  load                 -> tLDSB_R 
!! Rule  15 (line  139), Count:     5  load                 -> tLDSH_R 
!! Rule  16 (line  139), Count:     8  load                 -> tLDSW_R 
!! Rule  17 (line  139), Count:     5  load                 -> tLDUB_R 
!! Rule  18 (line  139), Count:     6  load                 -> tLDUH_R 
!! Rule  19 (line  139), Count:     5  load                 -> tLDUW_R 
!! Rule  20 (line  139), Count:    13  load                 -> tLDX_R 
!! Rule  21 (line  139), Count:     9  load                 -> tLDD_R 
!! Rule  22 (line  142), Count:     3  alu                  -> tADD_R 
!! Rule  23 (line  142), Count:     1  alu                  -> tADD_I 
!! Rule  24 (line  142), Count:     0  alu                  -> tADDcc_R 
!! Rule  25 (line  142), Count:     4  alu                  -> tADDcc_I 
!! Rule  26 (line  142), Count:     1  alu                  -> tADDC_R 
!! Rule  27 (line  142), Count:     4  alu                  -> tADDC_I 
!! Rule  28 (line  142), Count:     3  alu                  -> tADDCcc_R 
!! Rule  29 (line  142), Count:     2  alu                  -> tADDCcc_I 
!! Rule  30 (line  142), Count:     1  alu                  -> tAND_R 
!! Rule  31 (line  142), Count:     5  alu                  -> tAND_I 
!! Rule  32 (line  142), Count:     7  alu                  -> tANDcc_R 
!! Rule  33 (line  142), Count:     4  alu                  -> tANDcc_I 
!! Rule  34 (line  142), Count:     5  alu                  -> tANDN_R 
!! Rule  35 (line  142), Count:     0  alu                  -> tANDN_I 
!! Rule  36 (line  142), Count:     3  alu                  -> tANDNcc_R 
!! Rule  37 (line  142), Count:     2  alu                  -> tANDNcc_I 
!! Rule  38 (line  142), Count:     4  alu                  -> tOR_R 
!! Rule  39 (line  142), Count:     3  alu                  -> tOR_I 
!! Rule  41 (line  142), Count:     3  alu                  -> tORcc_I 
!! Rule  42 (line  142), Count:     2  alu                  -> tORN_R 
!! Rule  43 (line  142), Count:     4  alu                  -> tORN_I 
!! Rule  44 (line  142), Count:     4  alu                  -> tORNcc_R 
!! Rule  45 (line  142), Count:     0  alu                  -> tORNcc_I 
!! Rule  46 (line  142), Count:     2  alu                  -> tXOR_R 
!! Rule  47 (line  142), Count:     1  alu                  -> tXOR_I 
!! Rule  48 (line  142), Count:     3  alu                  -> tXORcc_R 
!! Rule  49 (line  142), Count:     6  alu                  -> tXORcc_I 
!! Rule  50 (line  142), Count:     1  alu                  -> tXNOR_R 
!! Rule  51 (line  142), Count:     2  alu                  -> tXNOR_I 
!! Rule  52 (line  142), Count:     2  alu                  -> tXNORcc_R 
!! Rule  53 (line  142), Count:     1  alu                  -> tXNORcc_I 
!! Rule  54 (line  142), Count:     6  alu                  -> tMOVcc_R 
!! Rule  55 (line  142), Count:     4  alu                  -> tMOVcc_I 
!! Rule  56 (line  142), Count:     1  alu                  -> tMOVR_R 
!! Rule  57 (line  142), Count:     6  alu                  -> tMOVR_I 
!! Rule  58 (line  142), Count:     3  alu                  -> tSLL_R 
!! Rule  59 (line  142), Count:     5  alu                  -> tSLL_I 
!! Rule  60 (line  142), Count:     5  alu                  -> tSRL_R 
!! Rule  61 (line  142), Count:     0  alu                  -> tSRL_I 
!! Rule  62 (line  142), Count:     1  alu                  -> tSRA_R 
!! Rule  63 (line  142), Count:     2  alu                  -> tSRA_I 
!! Rule  64 (line  142), Count:     2  alu                  -> tSLLX_R 
!! Rule  65 (line  142), Count:     8  alu                  -> tSLLX_I 
!! Rule  66 (line  142), Count:     5  alu                  -> tSRLX_R 
!! Rule  67 (line  142), Count:     1  alu                  -> tSRLX_I 
!! Rule  68 (line  142), Count:     9  alu                  -> tSRAX_R 
!! Rule  69 (line  142), Count:     2  alu                  -> tSRAX_I 
!! Rule  70 (line  142), Count:     4  alu                  -> tSUB_R 
!! Rule  71 (line  142), Count:     1  alu                  -> tSUB_I 
!! Rule  72 (line  142), Count:     2  alu                  -> tSUBcc_R 
!! Rule  73 (line  142), Count:     3  alu                  -> tSUBcc_I 
!! Rule  74 (line  142), Count:     1  alu                  -> tSUBC_R 
!! Rule  75 (line  142), Count:     2  alu                  -> tSUBC_I 
!! Rule  76 (line  142), Count:     1  alu                  -> tSUBCcc_R 
!! Rule  78 (line  142), Count:     3  alu                  -> tSUBCcc_I 
!! Rule  79 (line  145), Count:    13  div                  -> tUDIV_I 
!! Rule  80 (line  145), Count:    10  div                  -> tUDIV_R 
!! Rule  81 (line  145), Count:     7  div                  -> tSDIV_I 
!! Rule  82 (line  145), Count:    12  div                  -> tSDIV_R 
!! Rule  83 (line  145), Count:     7  div                  -> tSDIVX_R 
!! Rule  84 (line  145), Count:    13  div                  -> tSDIVX_I 
!! Rule  85 (line  145), Count:     5  div                  -> tUDIVX_R 
!! Rule  86 (line  145), Count:     9  div                  -> tUDIVX_I 
!! Rule  87 (line  145), Count:    14  div                  -> tUDIVcc_I 
!! Rule  88 (line  145), Count:    11  div                  -> tUDIVcc_R 
!! Rule  89 (line  145), Count:     8  div                  -> tSDIVcc_I 
!! 
!!   257: Token mMETA0	Count = 5
!!   258: Token tSTB_R	Count = 20
!!   259: Token tSTH_R	Count = 15
!!   260: Token tSTW_R	Count = 11
!!   261: Token tSTX_R	Count = 3
!!   262: Token tSTF_R	Count = 13
!!   263: Token tSTDF_R	Count = 10
!!   264: Token tLDSB_R	Count = 14
!!   265: Token tLDSH_R	Count = 6
!!   266: Token tLDSW_R	Count = 9
!!   267: Token tLDUB_R	Count = 6
!!   268: Token tLDUH_R	Count = 7
!!   269: Token tLDUW_R	Count = 6
!!   270: Token tLDX_R	Count = 14
!!   271: Token tLDD_R	Count = 10
!!   272: Token tADD_R	Count = 4
!!   273: Token tADD_I	Count = 2
!!   274: Token tADDcc_R	Count = 1
!!   275: Token tADDcc_I	Count = 5
!!   276: Token tADDC_R	Count = 2
!!   277: Token tADDC_I	Count = 5
!!   278: Token tADDCcc_R	Count = 4
!!   279: Token tADDCcc_I	Count = 3
!!   280: Token tAND_R	Count = 2
!!   281: Token tAND_I	Count = 6
!!   282: Token tANDcc_R	Count = 8
!!   283: Token tANDcc_I	Count = 5
!!   284: Token tANDN_R	Count = 6
!!   285: Token tANDN_I	Count = 1
!!   286: Token tANDNcc_R	Count = 4
!!   287: Token tANDNcc_I	Count = 3
!!   288: Token tOR_R	Count = 5
!!   289: Token tOR_I	Count = 4
!!   290: Token tORcc_R	Count = 0
!!   291: Token tORcc_I	Count = 4
!!   292: Token tORN_R	Count = 3
!!   293: Token tORN_I	Count = 5
!!   294: Token tORNcc_R	Count = 5
!!   295: Token tORNcc_I	Count = 1
!!   296: Token tXOR_R	Count = 3
!!   297: Token tXOR_I	Count = 2
!!   298: Token tXORcc_R	Count = 4
!!   299: Token tXORcc_I	Count = 7
!!   300: Token tXNOR_R	Count = 2
!!   301: Token tXNOR_I	Count = 3
!!   302: Token tXNORcc_R	Count = 3
!!   303: Token tXNORcc_I	Count = 2
!!   304: Token tMOVcc_R	Count = 7
!!   305: Token tMOVcc_I	Count = 5
!!   306: Token tMOVR_R	Count = 2
!!   307: Token tMOVR_I	Count = 7
!!   308: Token tSLL_R	Count = 4
!!   309: Token tSLL_I	Count = 6
!!   310: Token tSRL_R	Count = 6
!!   311: Token tSRL_I	Count = 1
!!   312: Token tSRA_R	Count = 2
!!   313: Token tSRA_I	Count = 3
!!   314: Token tSLLX_R	Count = 3
!!   315: Token tSLLX_I	Count = 9
!!   316: Token tSRLX_R	Count = 6
!!   317: Token tSRLX_I	Count = 2
!!   318: Token tSRAX_R	Count = 10
!!   319: Token tSRAX_I	Count = 3
!!   320: Token tSUB_R	Count = 5
!!   321: Token tSUB_I	Count = 2
!!   322: Token tSUBcc_R	Count = 3
!!   323: Token tSUBcc_I	Count = 4
!!   324: Token tSUBC_R	Count = 2
!!   325: Token tSUBC_I	Count = 3
!!   326: Token tSUBCcc_R	Count = 2
!!   327: Token tSUBCcc_I	Count = 4
!!   328: Token tUDIV_I	Count = 14
!!   329: Token tUDIV_R	Count = 11
!!   330: Token tSDIV_I	Count = 8
!!   331: Token tSDIV_R	Count = 13
!!   332: Token tSDIVX_R	Count = 8
!!   333: Token tSDIVX_I	Count = 14
!!   334: Token tUDIVX_R	Count = 6
!!   335: Token tUDIVX_I	Count = 10
!!   336: Token tUDIVcc_I	Count = 15
!!   337: Token tUDIVcc_R	Count = 12
!!   338: Token tSDIVcc_I	Count = 9
!!   339: Token tSDIVcc_R	Count = 16
!! 
!! 
!! +++ finish +++

