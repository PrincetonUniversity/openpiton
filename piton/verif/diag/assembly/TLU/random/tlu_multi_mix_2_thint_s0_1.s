// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_1.s
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
   random seed:	518061707
   Jal tlu_multi_mix_2_thint.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_intr_handlers.s"
#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"

#define H_T0_Privileged_opcode_0x11
#define My_T0_Privileged_opcode_0x11 \
        rdpr    %tpc, %g1; \
        rdpr    %tnpc, %g2; \
        rdpr    %tstate, %g3; \
        rdpr    %gl, %g4; \
        rdpr    %tl, %g5; \
        rdhpr   %htstate, %g6; \
        nop; \
        done

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0x47b571bb439bb29a, %g1, %g0
	setx 0xa6d294c9d090f4e4, %g1, %g1
	setx 0xf3aec4a65eb8a690, %g1, %g2
	setx 0xb1817d83b99206b9, %g1, %g3
	setx 0xcac8dd7bd40736a1, %g1, %g4
	setx 0xebb3ae9dd20d8652, %g1, %g5
	setx 0xe2f26c213c5f72b4, %g1, %g6
	setx 0x9c9f7e9e1011684d, %g1, %g7
	setx 0x4b5766bfe81156d9, %g1, %r16
	setx 0xe424729ed3f85564, %g1, %r17
	setx 0x3351bf168c03e972, %g1, %r18
	setx 0xa1605c05e0bea79b, %g1, %r19
	setx 0xc87ab5d3e07410de, %g1, %r20
	setx 0xb65949eb7f4f0d3d, %g1, %r21
	setx 0x824564c7828f383f, %g1, %r22
	setx 0xef0a7352e514d7c6, %g1, %r23
	setx 0x84ccc6f0b06701e6, %g1, %r24
	setx 0x9f98966d91c3e6e2, %g1, %r25
	setx 0x5ed991a7b030a88a, %g1, %r26
	setx 0x7cbc45cdbf9bb781, %g1, %r27
	setx 0x74b367b82abae66c, %g1, %r28
	setx 0x0d66d63c20f80d15, %g1, %r29
	setx 0xa9fa45e7fb3a673a, %g1, %r30
	setx 0x39591438f3f89c61, %g1, %r31
	save
	setx 0xb92bf611045eb4c3, %g1, %r16
	setx 0x65ebfce6b477f817, %g1, %r17
	setx 0x44254cd0cc075347, %g1, %r18
	setx 0x6a18ebeb77bbb88e, %g1, %r19
	setx 0x0541e3e6a634d310, %g1, %r20
	setx 0x0ed5416d05094780, %g1, %r21
	setx 0xbfb45efd7645080f, %g1, %r22
	setx 0xfd291a5ba43e593f, %g1, %r23
	setx 0xbfbb7c5639d7e296, %g1, %r24
	setx 0x4eded8588752aaaf, %g1, %r25
	setx 0x1f141fbae709a719, %g1, %r26
	setx 0xd7223866f614363f, %g1, %r27
	setx 0xff1ef7f69fb470e0, %g1, %r28
	setx 0xf9ae65140f5f6e19, %g1, %r29
	setx 0x288f9991c5cedc7f, %g1, %r30
	setx 0x0edcf59c72ebf976, %g1, %r31
	save
	setx 0x7cbfb49ee22810aa, %g1, %r16
	setx 0x24e160244ddc19ae, %g1, %r17
	setx 0xe27eae64876b9369, %g1, %r18
	setx 0x943edd9611525aeb, %g1, %r19
	setx 0xbe3dff91a0bf23a0, %g1, %r20
	setx 0x97683549db90a65d, %g1, %r21
	setx 0xd5e682eb7906dab1, %g1, %r22
	setx 0x5ee9bf6235217cec, %g1, %r23
	setx 0x010ab4f9519d1ea1, %g1, %r24
	setx 0x6fcc7ac48fa0f964, %g1, %r25
	setx 0x99879cc052cba9db, %g1, %r26
	setx 0xae242611b4e56a3e, %g1, %r27
	setx 0x57fffab7fb303304, %g1, %r28
	setx 0x324480918d235e4e, %g1, %r29
	setx 0x013eee87ea901e99, %g1, %r30
	setx 0x2e646243c4015a5e, %g1, %r31
	save
	setx 0x90fda6a91346b64f, %g1, %r16
	setx 0x407dbf3fdd959640, %g1, %r17
	setx 0x7ed43912ebfd7642, %g1, %r18
	setx 0xd1f8e6c4c8fac409, %g1, %r19
	setx 0xd28c79a493228120, %g1, %r20
	setx 0x94661bfb67c0afa3, %g1, %r21
	setx 0x207f3dd92be76026, %g1, %r22
	setx 0x91ba4b2545cf8a08, %g1, %r23
	setx 0x078bf123be2b6678, %g1, %r24
	setx 0x4d611c59371bfb79, %g1, %r25
	setx 0x4d091ffa7a8de363, %g1, %r26
	setx 0x472eb82602b1dfc4, %g1, %r27
	setx 0x0829e663f50ec33d, %g1, %r28
	setx 0x710025980fc2926d, %g1, %r29
	setx 0x268300f0a79e1d10, %g1, %r30
	setx 0x5e25bd7a38de4379, %g1, %r31
	save
	setx 0x71694d99d77c131b, %g1, %r16
	setx 0x819ccf6d15687a2d, %g1, %r17
	setx 0x2c611b55c0d4af17, %g1, %r18
	setx 0x0fd7852e53b6b6a6, %g1, %r19
	setx 0xd8c43126aeef44aa, %g1, %r20
	setx 0x9b497024d53d024a, %g1, %r21
	setx 0x7f2486e9cc852a8c, %g1, %r22
	setx 0xbd5755ef7039ac70, %g1, %r23
	setx 0xc2241719556b134f, %g1, %r24
	setx 0xd862c573e1a0ac7b, %g1, %r25
	setx 0x29f5ef6dccbe8cf5, %g1, %r26
	setx 0x4ef31908ea32c951, %g1, %r27
	setx 0xf6a60096f3f7e033, %g1, %r28
	setx 0x98315477bf0101cd, %g1, %r29
	setx 0x74d1756e8b5666a9, %g1, %r30
	setx 0x439968152cf5b8fd, %g1, %r31
	save
	setx 0x4eaa29c74a852fbe, %g1, %r16
	setx 0xa83bd819f027d195, %g1, %r17
	setx 0xd5b6ca45bb143ad2, %g1, %r18
	setx 0x1e2553f2a472b18d, %g1, %r19
	setx 0x35a0e67cd6f0f694, %g1, %r20
	setx 0x22dff2532ad33bae, %g1, %r21
	setx 0x7e6e298c5e415a81, %g1, %r22
	setx 0x9e6c44b8a3244bff, %g1, %r23
	setx 0xef9bb9e83e59b78f, %g1, %r24
	setx 0x1182d6ef024318b6, %g1, %r25
	setx 0x75b87678e118571f, %g1, %r26
	setx 0x6ff437131d8516da, %g1, %r27
	setx 0xd698bf7161e7c4cc, %g1, %r28
	setx 0x41211358e1e01d4c, %g1, %r29
	setx 0x5b8ed4680e9fb111, %g1, %r30
	setx 0xb2f2bd75002dbe9b, %g1, %r31
	save
	setx 0x6fcf72d44ee72b48, %g1, %r16
	setx 0x584fdf6f006c0d9b, %g1, %r17
	setx 0xfcbf15b638523ad3, %g1, %r18
	setx 0x1ace56bb27c7a18f, %g1, %r19
	setx 0x3371e35183c32769, %g1, %r20
	setx 0x74aee21f1433c4be, %g1, %r21
	setx 0x4a8bf9f536cb1bc0, %g1, %r22
	setx 0xb52c39c3350751eb, %g1, %r23
	setx 0x380c7510ebccf455, %g1, %r24
	setx 0x1f8651973b6df049, %g1, %r25
	setx 0xcdb413e276ab1871, %g1, %r26
	setx 0x08864b8f073da939, %g1, %r27
	setx 0xb8a57230a6c81d0d, %g1, %r28
	setx 0xc3c318d7a5255f38, %g1, %r29
	setx 0x454338292319fdc8, %g1, %r30
	setx 0x323e2d2db7e802f1, %g1, %r31
	save
	setx 0x612441c4eca7c1bd, %g1, %r16
	setx 0xf27a7b6591541181, %g1, %r17
	setx 0x1464ea7839a4dc25, %g1, %r18
	setx 0x119cddc8c67180ee, %g1, %r19
	setx 0xa15f4ff66ae72951, %g1, %r20
	setx 0x14bdbaab79336cf7, %g1, %r21
	setx 0x6d58bdde38b66e7b, %g1, %r22
	setx 0xa6870f12d0a1646d, %g1, %r23
	setx 0x0bbfd2cdb3f9e859, %g1, %r24
	setx 0x17bf25617d47a691, %g1, %r25
	setx 0x74fd6630f562fd27, %g1, %r26
	setx 0xc15a5a288182cb20, %g1, %r27
	setx 0xb5fd4dd44805bb4b, %g1, %r28
	setx 0x2539a2f823f040d7, %g1, %r29
	setx 0xaca20890140e40b4, %g1, %r30
	setx 0xb5e15e03f153f771, %g1, %r31
	ta	%icc, T_CHANGE_HPRIV
	wr	%g0, 4, %fprs
	setx	data_start_0, %r1, %g7
	ldd	[%g7+0], %f0
	ldd	[%g7+8], %f2
	ldd	[%g7+16], %f4
	ldd	[%g7+24], %f6
	ldd	[%g7+32], %f8
	ldd	[%g7+40], %f10
	ldd	[%g7+48], %f12
	ldd	[%g7+56], %f14
	ldd	[%g7+64], %f16
	ldd	[%g7+72], %f18
	ldd	[%g7+80], %f20
	ldd	[%g7+88], %f22
	ldd	[%g7+96], %f24
	ldd	[%g7+104], %f26
	ldd	[%g7+112], %f28
	ldd	[%g7+120], %f30
	ldd	[%g7+128], %f32
	ldd	[%g7+136], %f34
	ldd	[%g7+144], %f36
	ldd	[%g7+152], %f38
	ldd	[%g7+160], %f40
	ldd	[%g7+168], %f42
	ldd	[%g7+176], %f44
	ldd	[%g7+184], %f46
	ldd	[%g7+192], %f48
	ldd	[%g7+200], %f50
	ldd	[%g7+208], %f52
	ldd	[%g7+216], %f54
	ldd	[%g7+224], %f56
	ldd	[%g7+232], %f58
	ldd	[%g7+240], %f60
	ldd	[%g7+248], %f62
	setx	fsr_data, %r1, %g7
	stx	%fsr, [%g7]
	ldx	[%g7], %g4
	setx	%hi(0x0f000000), %g1, %g3
	or	%g4, %g3, %g4
	stx	%g4, [%g7]
	ldx	[%g7], %fsr
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	mov	0x237, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 12: RDPR_PSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r21
	.word 0x8d94a189  ! 18: WRPR_PSTATE_I	wrpr	%r18, 0x0189, %pstate
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0350000  ! 25: SUBC_R	orn 	%r20, %r0, %r24
	.word 0xbfe4e008  ! 26: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe5e076  ! 29: SAVE_I	save	%r23, 0x0001, %r31
	mov	0x215, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a062  ! 34: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbf540000  ! 39: RDPR_GL	<illegal instruction>
	.word 0xb7e4202c  ! 41: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e5a100  ! 42: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb035c000  ! 44: SUBC_R	orn 	%r23, %r0, %r24
	.word 0xbd3c0000  ! 47: SRA_R	sra 	%r16, %r0, %r30
	.word 0xb7e4611b  ! 54: SAVE_I	save	%r17, 0x0001, %r27
	setx	data_start_0, %g1, %r21
	.word 0x8794611a  ! 60: WRPR_TT_I	wrpr	%r17, 0x011a, %tt
	.word 0xb1e421de  ! 63: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe5606f  ! 70: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e4e085  ! 75: SAVE_I	save	%r19, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0xf3bf49ae00003dd9, %g1, %r10
	.word 0x819a8000  ! 80: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_7, %g1, %r16
	.word 0xb3e461cc  ! 82: SAVE_I	save	%r17, 0x0001, %r25
	mov	0x38, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5210b  ! 87: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe52178  ! 89: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xba9ca02c  ! 90: XORcc_I	xorcc 	%r18, 0x002c, %r29
	mov	0x10b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a079  ! 92: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb0b48000  ! 104: ORNcc_R	orncc 	%r18, %r0, %r24
	.word 0xb1e5a0ce  ! 106: SAVE_I	save	%r22, 0x0001, %r24
	setx	data_start_2, %g1, %r19
	.word 0xb1e5a181  ! 109: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbb480000  ! 112: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb3e521a1  ! 113: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e5a18c  ! 115: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbc2421e8  ! 118: SUB_I	sub 	%r16, 0x01e8, %r30
	.word 0xbde4610d  ! 121: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbcc44000  ! 125: ADDCcc_R	addccc 	%r17, %r0, %r30
	.word 0xb5e4a12a  ! 126: SAVE_I	save	%r18, 0x0001, %r26
	setx	0x9f5356b30000f9db, %g1, %r10
	.word 0x839a8000  ! 127: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7540000  ! 129: RDPR_GL	<illegal instruction>
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e045  ! 131: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbf641800  ! 132: MOVcc_R	<illegal instruction>
	.word 0xb7e4e0b1  ! 134: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe5e145  ! 135: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e4e1b2  ! 136: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde4a0f9  ! 139: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e4614b  ! 140: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e5e1eb  ! 141: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe4e085  ! 144: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4e168  ! 146: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e42167  ! 149: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7350000  ! 152: SRL_R	srl 	%r20, %r0, %r27
	.word 0xbd343001  ! 153: SRLX_I	srlx	%r16, 0x0001, %r30
	.word 0xb5e5212f  ! 155: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb425e022  ! 158: SUB_I	sub 	%r23, 0x0022, %r26
	.word 0xb7520000  ! 159: RDPR_PIL	<illegal instruction>
	.word 0xb5e5218c  ! 161: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x85942159  ! 163: WRPR_TSTATE_I	wrpr	%r16, 0x0159, %tstate
	.word 0x899420aa  ! 166: WRPR_TICK_I	wrpr	%r16, 0x00aa, %tick
	.word 0xb3e4a069  ! 168: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb845e14d  ! 170: ADDC_I	addc 	%r23, 0x014d, %r28
	setx	data_start_2, %g1, %r22
	.word 0xb9e5e174  ! 175: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe5e0db  ! 176: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e42097  ! 180: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e46193  ! 182: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7504000  ! 187: RDPR_TNPC	<illegal instruction>
	.word 0xbfe4a0c9  ! 191: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3500000  ! 192: RDPR_TPC	<illegal instruction>
	.word 0xb9e461c8  ! 195: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb02ce101  ! 198: ANDN_I	andn 	%r19, 0x0101, %r24
	.word 0xb3e4a019  ! 200: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e560a4  ! 201: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbb480000  ! 204: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_3, %g1, %r21
	.word 0xbb510000  ! 209: RDPR_TICK	<illegal instruction>
	.word 0xb550c000  ! 213: RDPR_TT	<illegal instruction>
	.word 0xb0c4a08d  ! 214: ADDCcc_I	addccc 	%r18, 0x008d, %r24
	.word 0xbfe5e123  ! 219: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe4601e  ! 222: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbbe4206e  ! 223: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e4e076  ! 229: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e5a0b0  ! 230: SAVE_I	save	%r22, 0x0001, %r26
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a1d1  ! 235: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e5a1ad  ! 236: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e4e174  ! 243: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb751c000  ! 245: RDPR_TL	<illegal instruction>
	.word 0xb5e5e0d1  ! 251: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe4606c  ! 255: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e420f8  ! 260: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe5e14a  ! 265: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e5a038  ! 267: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e42151  ! 268: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbb2c7001  ! 270: SLLX_I	sllx	%r17, 0x0001, %r29
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87952154  ! 272: WRPR_TT_I	wrpr	%r20, 0x0154, %tt
	.word 0xb1e4a07f  ! 274: SAVE_I	save	%r18, 0x0001, %r24
	setx	data_start_4, %g1, %r19
	.word 0xb1e5e053  ! 281: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e5e185  ! 290: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe5604e  ! 291: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbb500000  ! 292: RDPR_TPC	<illegal instruction>
	.word 0xbde4e05b  ! 293: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3510000  ! 296: RDPR_TICK	<illegal instruction>
	.word 0xbf510000  ! 297: RDPR_TICK	<illegal instruction>
	.word 0xb9504000  ! 303: RDPR_TNPC	<illegal instruction>
	.word 0xb5e5a1b3  ! 304: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e5a067  ! 305: SAVE_I	save	%r22, 0x0001, %r26
	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 312: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e4214c  ! 315: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde52128  ! 319: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5518000  ! 321: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_2, %g1, %r22
	.word 0xbde4a13d  ! 332: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5520000  ! 333: RDPR_PIL	<illegal instruction>
	.word 0xb1e5e1ce  ! 335: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb8442049  ! 337: ADDC_I	addc 	%r16, 0x0049, %r28
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbe25a158  ! 343: SUB_I	sub 	%r22, 0x0158, %r31
	.word 0xbde421bb  ! 345: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbb520000  ! 346: RDPR_PIL	<illegal instruction>
	.word 0xbbe5a0a7  ! 347: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb4a40000  ! 348: SUBcc_R	subcc 	%r16, %r0, %r26
	.word 0x8194e08b  ! 349: WRPR_TPC_I	wrpr	%r19, 0x008b, %tpc
	.word 0xbb480000  ! 350: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	mov	0x11d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 360: RDPR_TSTATE	<illegal instruction>
	.word 0x859420e8  ! 361: WRPR_TSTATE_I	wrpr	%r16, 0x00e8, %tstate
	.word 0xbb3d1000  ! 364: SRAX_R	srax	%r20, %r0, %r29
	.word 0x8195217a  ! 366: WRPR_TPC_I	wrpr	%r20, 0x017a, %tpc
	.word 0xbfe42156  ! 371: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb551c000  ! 374: RDPR_TL	<illegal instruction>
	.word 0xbfe4e014  ! 376: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e52062  ! 377: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8d94616f  ! 378: WRPR_PSTATE_I	wrpr	%r17, 0x016f, %pstate
	setx	0xb3cac2f60000485f, %g1, %r10
	.word 0x819a8000  ! 379: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8795a08c  ! 380: WRPR_TT_I	wrpr	%r22, 0x008c, %tt
	.word 0xb3480000  ! 382: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	mov	0x38, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e56067  ! 385: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e5a028  ! 387: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde460b5  ! 388: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8d9560b7  ! 389: WRPR_PSTATE_I	wrpr	%r21, 0x00b7, %pstate
	.word 0xbbe421c3  ! 391: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe4e14f  ! 392: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8d94e073  ! 394: WRPR_PSTATE_I	wrpr	%r19, 0x0073, %pstate
	.word 0x9194e059  ! 396: WRPR_PIL_I	wrpr	%r19, 0x0059, %pil
	.word 0xb3e5200e  ! 402: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8d94a11c  ! 403: WRPR_PSTATE_I	wrpr	%r18, 0x011c, %pstate
	.word 0xb7508000  ! 405: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4e01b  ! 411: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe5e0f3  ! 414: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x8995e183  ! 415: WRPR_TICK_I	wrpr	%r23, 0x0183, %tick
	setx	data_start_5, %g1, %r22
	.word 0xb7e561ad  ! 422: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x8d9521c4  ! 426: WRPR_PSTATE_I	wrpr	%r20, 0x01c4, %pstate
	.word 0xbe346162  ! 428: SUBC_I	orn 	%r17, 0x0162, %r31
	setx	data_start_4, %g1, %r20
	setx	data_start_1, %g1, %r16
	.word 0xb7e521a5  ! 439: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5508000  ! 441: RDPR_TSTATE	<illegal instruction>
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e044  ! 447: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e5e1d0  ! 448: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe4a045  ! 452: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e420e5  ! 456: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0, %r12
	.word 0xa1930000  ! 460: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x20d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e1fb  ! 464: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbcb52136  ! 467: SUBCcc_I	orncc 	%r20, 0x0136, %r30
	.word 0xb1e4e17c  ! 470: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbb508000  ! 471: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e4e145  ! 472: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde420ae  ! 473: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e5e1ea  ! 474: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8d946014  ! 478: WRPR_PSTATE_I	wrpr	%r17, 0x0014, %pstate
	.word 0xb5e4604e  ! 479: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xba456063  ! 481: ADDC_I	addc 	%r21, 0x0063, %r29
	.word 0xb9e420c2  ! 482: SAVE_I	save	%r16, 0x0001, %r28
	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e521f7  ! 495: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb53ce001  ! 496: SRA_I	sra 	%r19, 0x0001, %r26
	mov	0x239, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e094  ! 500: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbb480000  ! 501: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb7e520aa  ! 504: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e46017  ! 506: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbf518000  ! 507: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e52159  ! 510: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x3da9bf9900008edc, %g1, %r10
	.word 0x839a8000  ! 512: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e52043  ! 513: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e46151  ! 515: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e52066  ! 516: SAVE_I	save	%r20, 0x0001, %r27
	mov	2, %r12
	.word 0x8f930000  ! 519: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x85946050  ! 520: WRPR_TSTATE_I	wrpr	%r17, 0x0050, %tstate
	setx	0x60c0ef2a0000c996, %g1, %r10
	.word 0x839a8000  ! 521: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e5a005  ! 523: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe52025  ! 524: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe560e2  ! 525: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x9194a023  ! 526: WRPR_PIL_I	wrpr	%r18, 0x0023, %pil
	.word 0xbb508000  ! 529: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xb92c7001  ! 531: SLLX_I	sllx	%r17, 0x0001, %r28
	.word 0xb734f001  ! 533: SRLX_I	srlx	%r19, 0x0001, %r27
	.word 0xb3e4a0b9  ! 535: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe4a179  ! 539: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde4a156  ! 541: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8794e060  ! 551: WRPR_TT_I	wrpr	%r19, 0x0060, %tt
	.word 0xb7e5e145  ! 552: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e5e144  ! 553: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e5219a  ! 555: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb21d2145  ! 570: XOR_I	xor 	%r20, 0x0145, %r25
	mov	0, %r12
	.word 0x8f930000  ! 571: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3e4217e  ! 574: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x8195a137  ! 575: WRPR_TPC_I	wrpr	%r22, 0x0137, %tpc
	setx	0x32bdf2690000ee4a, %g1, %r10
	.word 0x819a8000  ! 578: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594e117  ! 580: WRPR_TSTATE_I	wrpr	%r19, 0x0117, %tstate
	.word 0xbbe4a165  ! 581: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbf3cb001  ! 583: SRAX_I	srax	%r18, 0x0001, %r31
	mov	0x102, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4211b  ! 589: SAVE_I	save	%r16, 0x0001, %r28
	setx	data_start_0, %g1, %r17
	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0ee  ! 595: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe42060  ! 596: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe5200b  ! 597: SAVE_I	save	%r20, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8794608c  ! 603: WRPR_TT_I	wrpr	%r17, 0x008c, %tt
	.word 0xbde42144  ! 606: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde4a12b  ! 608: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xba8421d0  ! 609: ADDcc_I	addcc 	%r16, 0x01d0, %r29
	.word 0xbf2c9000  ! 610: SLLX_R	sllx	%r18, %r0, %r31
	.word 0xb1e5e1ae  ! 612: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde460c1  ! 614: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb73c4000  ! 615: SRA_R	sra 	%r17, %r0, %r27
	setx	data_start_3, %g1, %r19
	.word 0xb40c4000  ! 619: AND_R	and 	%r17, %r0, %r26
	.word 0xbde560be  ! 622: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e521ab  ! 624: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde5a11b  ! 625: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3504000  ! 629: RDPR_TNPC	<illegal instruction>
	mov	0x32, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e52012  ! 636: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb17d2401  ! 644: MOVR_I	movre	%r20, 0x1, %r24
	.word 0xbb504000  ! 646: RDPR_TNPC	<illegal instruction>
	.word 0x81956190  ! 647: WRPR_TPC_I	wrpr	%r21, 0x0190, %tpc
	.word 0xbde4e167  ! 648: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x89956012  ! 650: WRPR_TICK_I	wrpr	%r21, 0x0012, %tick
	.word 0xb1e5e019  ! 651: SAVE_I	save	%r23, 0x0001, %r24
	setx	data_start_4, %g1, %r22
	.word 0xbde4a126  ! 654: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe4e066  ! 657: SAVE_I	save	%r19, 0x0001, %r31
	mov	0x32b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c40000  ! 661: ADDCcc_R	addccc 	%r16, %r0, %r28
	.word 0xb5e4215a  ! 665: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe561a1  ! 669: SAVE_I	save	%r21, 0x0001, %r31
	setx	data_start_1, %g1, %r20
	.word 0xbfe42134  ! 672: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e5a120  ! 674: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e4218c  ! 676: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e461e9  ! 679: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe5a142  ! 680: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e4a079  ! 681: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5a00e  ! 684: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde46011  ! 685: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e5a10f  ! 688: SAVE_I	save	%r22, 0x0001, %r26
	mov	0x314, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e12d  ! 693: SAVE_I	save	%r19, 0x0001, %r30
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e103  ! 695: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x879460de  ! 696: WRPR_TT_I	wrpr	%r17, 0x00de, %tt
	.word 0xbfe4a06b  ! 700: SAVE_I	save	%r18, 0x0001, %r31
	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03d4000  ! 707: XNOR_R	xnor 	%r21, %r0, %r24
	mov	0x33e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 712: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb7e5e1fb  ! 713: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x8d95e19e  ! 718: WRPR_PSTATE_I	wrpr	%r23, 0x019e, %pstate
	.word 0x8794e1cc  ! 720: WRPR_TT_I	wrpr	%r19, 0x01cc, %tt
	mov	0xd, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e42028  ! 723: SAVE_I	save	%r16, 0x0001, %r26
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 732: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8595a0ed  ! 734: WRPR_TSTATE_I	wrpr	%r22, 0x00ed, %tstate
	.word 0xb224c000  ! 735: SUB_R	sub 	%r19, %r0, %r25
	mov	0x31a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42128  ! 737: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e52133  ! 740: SAVE_I	save	%r20, 0x0001, %r27
	mov	0x38, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794a17e  ! 749: WRPR_TT_I	wrpr	%r18, 0x017e, %tt
	.word 0xb7e42019  ! 753: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7508000  ! 756: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe521b9  ! 757: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8194602e  ! 762: WRPR_TPC_I	wrpr	%r17, 0x002e, %tpc
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87952003  ! 764: WRPR_TT_I	wrpr	%r20, 0x0003, %tt
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795e13f  ! 773: WRPR_TT_I	wrpr	%r23, 0x013f, %tt
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e014  ! 777: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e521dc  ! 779: SAVE_I	save	%r20, 0x0001, %r26
	setx	data_start_1, %g1, %r17
	.word 0xbfe460c3  ! 782: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e5a0af  ! 786: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb6b44000  ! 787: SUBCcc_R	orncc 	%r17, %r0, %r27
	.word 0xb9e46124  ! 788: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e5e0d6  ! 791: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e4e0fe  ! 800: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1500000  ! 805: RDPR_TPC	<illegal instruction>
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 821: RDPR_TPC	<illegal instruction>
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e123  ! 828: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e460b1  ! 829: SAVE_I	save	%r17, 0x0001, %r28
	mov	0x312, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46036  ! 832: SAVE_I	save	%r17, 0x0001, %r26
	mov	0x104, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a114  ! 840: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8794a019  ! 842: WRPR_TT_I	wrpr	%r18, 0x0019, %tt
	.word 0xbf510000  ! 843: RDPR_TICK	<illegal instruction>
	.word 0xbfe521da  ! 844: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5540000  ! 845: RDPR_GL	<illegal instruction>
	.word 0xb7e5e1cd  ! 846: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb4348000  ! 848: ORN_R	orn 	%r18, %r0, %r26
	.word 0xb9518000  ! 849: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e5e0ad  ! 850: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e4a1dd  ! 853: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e4e10f  ! 856: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e5e1e0  ! 859: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb42d213f  ! 860: ANDN_I	andn 	%r20, 0x013f, %r26
	.word 0xbb500000  ! 861: RDPR_TPC	<illegal instruction>
	.word 0xb2248000  ! 863: SUB_R	sub 	%r18, %r0, %r25
	.word 0x8394a186  ! 864: WRPR_TNPC_I	wrpr	%r18, 0x0186, %tnpc
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8d2167  ! 867: ANDcc_I	andcc 	%r20, 0x0167, %r30
	.word 0xb5e560dd  ! 868: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x59eabcd90000ba8b, %g1, %r10
	.word 0x839a8000  ! 871: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7e4a100  ! 874: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe521fd  ! 876: SAVE_I	save	%r20, 0x0001, %r29
	mov	0x200, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e52023  ! 880: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e4e19a  ! 883: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e560c0  ! 887: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe5a072  ! 890: SAVE_I	save	%r22, 0x0001, %r31
	mov	0x139, %o0
	ta	T_SEND_THRD_INTR
	mov	0x23d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x89956110  ! 895: WRPR_TICK_I	wrpr	%r21, 0x0110, %tick
	.word 0xbbe5a0a6  ! 899: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7500000  ! 900: RDPR_TPC	<illegal instruction>
	.word 0xbd500000  ! 902: RDPR_TPC	<illegal instruction>
	.word 0xb8b54000  ! 903: SUBCcc_R	orncc 	%r21, %r0, %r28
	.word 0xb5508000  ! 906: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e52002  ! 907: SAVE_I	save	%r20, 0x0001, %r24
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 915: RDPR_PSTATE	<illegal instruction>
	.word 0x91952062  ! 917: WRPR_PIL_I	wrpr	%r20, 0x0062, %pil
	.word 0xbb520000  ! 918: RDPR_PIL	<illegal instruction>
	.word 0xb751c000  ! 919: RDPR_TL	<illegal instruction>
	mov	0x211, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 924: RDPR_TL	<illegal instruction>
	.word 0xbfe4a055  ! 925: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e42038  ! 927: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e4618b  ! 928: SAVE_I	save	%r17, 0x0001, %r27
	mov	0x139, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a107  ! 932: SAVE_I	save	%r22, 0x0001, %r30
	mov	2, %r12
	.word 0x8f930000  ! 934: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5520000  ! 936: RDPR_PIL	<illegal instruction>
	.word 0xb9e521cc  ! 937: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb4aca0a0  ! 939: ANDNcc_I	andncc 	%r18, 0x00a0, %r26
	.word 0xbbe561be  ! 941: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe5e054  ! 945: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbe3cc000  ! 947: XNOR_R	xnor 	%r19, %r0, %r31
	.word 0xbbe4e0d5  ! 948: SAVE_I	save	%r19, 0x0001, %r29
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r17
	.word 0xbbe5205e  ! 957: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e4a08c  ! 960: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e42121  ! 961: SAVE_I	save	%r16, 0x0001, %r24
	mov	0xd, %o0
	ta	T_SEND_THRD_INTR
	setx	0xf13fafe60000bf0d, %g1, %r10
	.word 0x819a8000  ! 964: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x899521ea  ! 966: WRPR_TICK_I	wrpr	%r20, 0x01ea, %tick
	.word 0xbbe5e0b3  ! 972: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e52034  ! 973: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e460be  ! 974: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e4613d  ! 977: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbd540000  ! 982: RDPR_GL	<illegal instruction>
	.word 0xbbe4601b  ! 988: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb40cc000  ! 991: AND_R	and 	%r19, %r0, %r26
	.word 0xbfe42004  ! 992: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8595e0c8  ! 993: WRPR_TSTATE_I	wrpr	%r23, 0x00c8, %tstate
	.word 0xb1e4a09b  ! 994: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe560f2  ! 997: SAVE_I	save	%r21, 0x0001, %r31
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx	data_start_0, %g1, %r16
	setx	data_start_1, %g1, %r17
	setx	data_start_2, %g1, %r18
	setx	data_start_3, %g1, %r19
	setx	data_start_4, %g1, %r20
	setx	data_start_5, %g1, %r21
	setx	data_start_6, %g1, %r22
	setx	data_start_7, %g1, %r23
	mov	0x22a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb3d2023  ! 2: STDF_I	std	%f29, [0x0023, %r20]
	.word 0xfc74e1bb  ! 3: STX_I	stx	%r30, [%r19 + 0x01bb]
	.word 0xf8250000  ! 5: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf13da03d  ! 6: STDF_I	std	%f24, [0x003d, %r22]
	.word 0xf0240000  ! 7: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xfa354000  ! 9: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf63460d7  ! 11: STH_I	sth	%r27, [%r17 + 0x00d7]
	.word 0xbb518000  ! 12: RDPR_PSTATE	rdpr	%pstate, %r29
	setx	data_start_7, %g1, %r20
	.word 0x8d94205f  ! 18: WRPR_PSTATE_I	wrpr	%r16, 0x005f, %pstate
	.word 0xf03c4000  ! 19: STD_R	std	%r24, [%r17 + %r0]
	.word 0xf874613b  ! 21: STX_I	stx	%r28, [%r17 + 0x013b]
	.word 0xfe344000  ! 22: STH_R	sth	%r31, [%r17 + %r0]
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb834c000  ! 25: SUBC_R	orn 	%r19, %r0, %r28
	.word 0xf33da054  ! 27: STDF_I	std	%f25, [0x0054, %r22]
	.word 0xff3cc000  ! 28: STDF_R	std	%f31, [%r0, %r19]
	.word 0xff3c614c  ! 31: STDF_I	std	%f31, [0x014c, %r17]
	mov	0x10e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d6155  ! 37: STB_I	stb	%r29, [%r21 + 0x0155]
	.word 0xf42d60a8  ! 38: STB_I	stb	%r26, [%r21 + 0x00a8]
	.word 0xbf540000  ! 39: RDPR_GL	rdpr	%-, %r31
	.word 0xb4350000  ! 44: SUBC_R	orn 	%r20, %r0, %r26
	.word 0xbf3d4000  ! 47: SRA_R	sra 	%r21, %r0, %r31
	.word 0xfb3c4000  ! 48: STDF_R	std	%f29, [%r0, %r17]
	.word 0xff3da114  ! 49: STDF_I	std	%f31, [0x0114, %r22]
	.word 0xf93cc000  ! 53: STDF_R	std	%f28, [%r0, %r19]
	.word 0xfa35c000  ! 56: STH_R	sth	%r29, [%r23 + %r0]
	setx	data_start_6, %g1, %r18
	.word 0xfd3d4000  ! 59: STDF_R	std	%f30, [%r0, %r21]
	.word 0x87952096  ! 60: WRPR_TT_I	wrpr	%r20, 0x0096, %tt
	.word 0xf23420fa  ! 61: STH_I	sth	%r25, [%r16 + 0x00fa]
	.word 0xfa2d20a4  ! 64: STB_I	stb	%r29, [%r20 + 0x00a4]
	.word 0xf8240000  ! 67: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xf6248000  ! 72: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xfc758000  ! 73: STX_R	stx	%r30, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf274e0dc  ! 77: STX_I	stx	%r25, [%r19 + 0x00dc]
	.word 0xf13cc000  ! 79: STDF_R	std	%f24, [%r0, %r19]
	setx	0x275eb32700007e95, %g1, %r10
	.word 0x819a8000  ! 80: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_1, %g1, %r22
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d0000  ! 85: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xf6740000  ! 86: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xf2254000  ! 88: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xbc9de0b5  ! 90: XORcc_I	xorcc 	%r23, 0x00b5, %r30
	mov	0x129, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22ca136  ! 95: STB_I	stb	%r25, [%r18 + 0x0136]
	.word 0xf23c6075  ! 97: STD_I	std	%r25, [%r17 + 0x0075]
	.word 0xf53cc000  ! 100: STDF_R	std	%f26, [%r0, %r19]
	.word 0xbcb54000  ! 104: ORNcc_R	orncc 	%r21, %r0, %r30
	.word 0xf4740000  ! 107: STX_R	stx	%r26, [%r16 + %r0]
	setx	data_start_5, %g1, %r23
	.word 0xb5480000  ! 112: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf425c000  ! 114: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xf33d0000  ! 116: STDF_R	std	%f25, [%r0, %r20]
	.word 0xfc24e14b  ! 117: STW_I	stw	%r30, [%r19 + 0x014b]
	.word 0xb624e1ea  ! 118: SUB_I	sub 	%r19, 0x01ea, %r27
	.word 0xfa7420ff  ! 123: STX_I	stx	%r29, [%r16 + 0x00ff]
	.word 0xbcc40000  ! 125: ADDCcc_R	addccc 	%r16, %r0, %r30
	setx	0xcef2f2cc000078dc, %g1, %r10
	.word 0x839a8000  ! 127: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf624a06a  ! 128: STW_I	stw	%r27, [%r18 + 0x006a]
	.word 0xb7540000  ! 129: RDPR_GL	rdpr	%-, %r27
	mov	0x108, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1641800  ! 132: MOVcc_R	<illegal instruction>
	.word 0xfc3dc000  ! 151: STD_R	std	%r30, [%r23 + %r0]
	.word 0xb5344000  ! 152: SRL_R	srl 	%r17, %r0, %r26
	.word 0xb7347001  ! 153: SRLX_I	srlx	%r17, 0x0001, %r27
	.word 0xb62460c2  ! 158: SUB_I	sub 	%r17, 0x00c2, %r27
	.word 0xb7520000  ! 159: RDPR_PIL	<illegal instruction>
	.word 0xf73ca1d4  ! 160: STDF_I	std	%f27, [0x01d4, %r18]
	.word 0x85942006  ! 163: WRPR_TSTATE_I	wrpr	%r16, 0x0006, %tstate
	.word 0x8994a185  ! 166: WRPR_TICK_I	wrpr	%r18, 0x0185, %tick
	.word 0xbe44e08a  ! 170: ADDC_I	addc 	%r19, 0x008a, %r31
	.word 0xf03c8000  ! 171: STD_R	std	%r24, [%r18 + %r0]
	.word 0xf43cc000  ! 172: STD_R	std	%r26, [%r19 + %r0]
	setx	data_start_3, %g1, %r22
	.word 0xf2342097  ! 177: STH_I	sth	%r25, [%r16 + 0x0097]
	.word 0xf675211e  ! 178: STX_I	stx	%r27, [%r20 + 0x011e]
	.word 0xff3d0000  ! 183: STDF_R	std	%f31, [%r0, %r20]
	.word 0xb1504000  ! 187: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xf234c000  ! 188: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xf224213f  ! 189: STW_I	stw	%r25, [%r16 + 0x013f]
	.word 0xb5500000  ! 192: RDPR_TPC	<illegal instruction>
	.word 0xf6744000  ! 193: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xf73d4000  ! 196: STDF_R	std	%f27, [%r0, %r21]
	.word 0xb02c6186  ! 198: ANDN_I	andn 	%r17, 0x0186, %r24
	.word 0xf4244000  ! 199: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xb5480000  ! 204: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfe2dc000  ! 205: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xf42c8000  ! 206: STB_R	stb	%r26, [%r18 + %r0]
	setx	data_start_2, %g1, %r21
	.word 0xf23cc000  ! 208: STD_R	std	%r25, [%r19 + %r0]
	.word 0xb1510000  ! 209: RDPR_TICK	<illegal instruction>
	.word 0xf6748000  ! 211: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xf074e049  ! 212: STX_I	stx	%r24, [%r19 + 0x0049]
	.word 0xb950c000  ! 213: RDPR_TT	<illegal instruction>
	.word 0xbcc4e0e9  ! 214: ADDCcc_I	addccc 	%r19, 0x00e9, %r30
	.word 0xf93c602c  ! 217: STDF_I	std	%f28, [0x002c, %r17]
	.word 0xfa3c2087  ! 218: STD_I	std	%r29, [%r16 + 0x0087]
	.word 0xf0254000  ! 221: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xf82d0000  ! 224: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xfd3de0c2  ! 225: STDF_I	std	%f30, [0x00c2, %r23]
	.word 0xf874e1bf  ! 228: STX_I	stx	%r28, [%r19 + 0x01bf]
	.word 0xfc344000  ! 231: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xf43560ad  ! 232: STH_I	sth	%r26, [%r21 + 0x00ad]
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634c000  ! 240: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xfb3da15f  ! 244: STDF_I	std	%f29, [0x015f, %r22]
	.word 0xbd51c000  ! 245: RDPR_TL	<illegal instruction>
	.word 0xfa756066  ! 247: STX_I	stx	%r29, [%r21 + 0x0066]
	.word 0xf13da0f7  ! 249: STDF_I	std	%f24, [0x00f7, %r22]
	.word 0xfa3cc000  ! 254: STD_R	std	%r29, [%r19 + %r0]
	.word 0xf43cc000  ! 257: STD_R	std	%r26, [%r19 + %r0]
	.word 0xf6754000  ! 259: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf82dc000  ! 263: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xfe2c4000  ! 264: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xfa3de1d8  ! 266: STD_I	std	%r29, [%r23 + 0x01d8]
	.word 0xb92c7001  ! 270: SLLX_I	sllx	%r17, 0x0001, %r28
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795e0d7  ! 272: WRPR_TT_I	wrpr	%r23, 0x00d7, %tt
	setx	data_start_5, %g1, %r20
	.word 0xf42d4000  ! 280: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xf93ca0a4  ! 282: STDF_I	std	%f28, [0x00a4, %r18]
	.word 0xfa3cc000  ! 286: STD_R	std	%r29, [%r19 + %r0]
	.word 0xfa348000  ! 287: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xf03c20b4  ! 288: STD_I	std	%r24, [%r16 + 0x00b4]
	.word 0xb7500000  ! 292: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xfe34e0b0  ! 295: STH_I	sth	%r31, [%r19 + 0x00b0]
	.word 0xbb510000  ! 296: RDPR_TICK	<illegal instruction>
	.word 0xb5510000  ! 297: RDPR_TICK	<illegal instruction>
	.word 0xf62c4000  ! 299: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xfa34c000  ! 300: STH_R	sth	%r29, [%r19 + %r0]
	.word 0xb7504000  ! 303: RDPR_TNPC	<illegal instruction>
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03c2061  ! 308: STD_I	std	%r24, [%r16 + 0x0061]
	.word 0xfc25a0db  ! 311: STW_I	stw	%r30, [%r22 + 0x00db]
	.word 0xb9508000  ! 312: RDPR_TSTATE	<illegal instruction>
	.word 0xf23c8000  ! 318: STD_R	std	%r25, [%r18 + %r0]
	.word 0xb1518000  ! 321: RDPR_PSTATE	<illegal instruction>
	.word 0xf53ce180  ! 322: STDF_I	std	%f26, [0x0180, %r19]
	.word 0xf63d2111  ! 323: STD_I	std	%r27, [%r20 + 0x0111]
	.word 0xf62d4000  ! 327: STB_R	stb	%r27, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_7, %g1, %r21
	.word 0xfe358000  ! 331: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xbd520000  ! 333: RDPR_PIL	<illegal instruction>
	.word 0xf22c20df  ! 334: STB_I	stb	%r25, [%r16 + 0x00df]
	.word 0xb244e0c6  ! 337: ADDC_I	addc 	%r19, 0x00c6, %r25
	.word 0xfe344000  ! 339: STH_R	sth	%r31, [%r17 + %r0]
	mov	0x21b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8258000  ! 341: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xbf480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbc2420ed  ! 343: SUB_I	sub 	%r16, 0x00ed, %r30
	.word 0xbb520000  ! 346: RDPR_PIL	<illegal instruction>
	.word 0xb0a54000  ! 348: SUBcc_R	subcc 	%r21, %r0, %r24
	.word 0x8195215b  ! 349: WRPR_TPC_I	wrpr	%r20, 0x015b, %tpc
	.word 0xb1480000  ! 350: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfa3de171  ! 352: STD_I	std	%r29, [%r23 + 0x0171]
	.word 0xf825e13a  ! 353: STW_I	stw	%r28, [%r23 + 0x013a]
	.word 0xf22da03a  ! 355: STB_I	stb	%r25, [%r22 + 0x003a]
	.word 0xfc34c000  ! 357: STH_R	sth	%r30, [%r19 + %r0]
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 360: RDPR_TSTATE	<illegal instruction>
	.word 0x8595213a  ! 361: WRPR_TSTATE_I	wrpr	%r20, 0x013a, %tstate
	.word 0xbf3c5000  ! 364: SRAX_R	srax	%r17, %r0, %r31
	.word 0x8194a094  ! 366: WRPR_TPC_I	wrpr	%r18, 0x0094, %tpc
	.word 0xfd3d8000  ! 367: STDF_R	std	%f30, [%r0, %r22]
	.word 0xb351c000  ! 374: RDPR_TL	rdpr	%tl, %r25
	.word 0x8d9561c9  ! 378: WRPR_PSTATE_I	wrpr	%r21, 0x01c9, %pstate
	setx	0x8dee6e3200006f1b, %g1, %r10
	.word 0x819a8000  ! 379: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8794a139  ! 380: WRPR_TT_I	wrpr	%r18, 0x0139, %tt
	.word 0xb1480000  ! 382: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d95a1d4  ! 389: WRPR_PSTATE_I	wrpr	%r22, 0x01d4, %pstate
	.word 0x8d946019  ! 394: WRPR_PSTATE_I	wrpr	%r17, 0x0019, %pstate
	.word 0x919420e1  ! 396: WRPR_PIL_I	wrpr	%r16, 0x00e1, %pil
	.word 0xf33da037  ! 399: STDF_I	std	%f25, [0x0037, %r22]
	.word 0xf33da13e  ! 401: STDF_I	std	%f25, [0x013e, %r22]
	.word 0x8d94a109  ! 403: WRPR_PSTATE_I	wrpr	%r18, 0x0109, %pstate
	.word 0xf22c0000  ! 404: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xb9508000  ! 405: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xfc2dc000  ! 409: STB_R	stb	%r30, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8995e149  ! 415: WRPR_TICK_I	wrpr	%r23, 0x0149, %tick
	setx	data_start_1, %g1, %r20
	.word 0xf6350000  ! 423: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xf4748000  ! 424: STX_R	stx	%r26, [%r18 + %r0]
	.word 0x8d95a1bc  ! 426: WRPR_PSTATE_I	wrpr	%r22, 0x01bc, %pstate
	.word 0xf075614e  ! 427: STX_I	stx	%r24, [%r21 + 0x014e]
	.word 0xb8342031  ! 428: SUBC_I	orn 	%r16, 0x0031, %r28
	setx	data_start_2, %g1, %r20
	.word 0xf8256173  ! 430: STW_I	stw	%r28, [%r21 + 0x0173]
	setx	data_start_1, %g1, %r23
	.word 0xf62da109  ! 435: STB_I	stb	%r27, [%r22 + 0x0109]
	.word 0xbf508000  ! 441: RDPR_TSTATE	rdpr	%tstate, %r31
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634c000  ! 449: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xfe2d8000  ! 455: STB_R	stb	%r31, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0, %r12
	.word 0xa1930000  ! 460: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03d0000  ! 465: STD_R	std	%r24, [%r20 + %r0]
	.word 0xbeb4a1c8  ! 467: SUBCcc_I	orncc 	%r18, 0x01c8, %r31
	.word 0xb5508000  ! 471: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x8d942074  ! 478: WRPR_PSTATE_I	wrpr	%r16, 0x0074, %pstate
	.word 0xf025e0ff  ! 480: STW_I	stw	%r24, [%r23 + 0x00ff]
	.word 0xb0452031  ! 481: ADDC_I	addc 	%r20, 0x0031, %r24
	.word 0xf4250000  ! 483: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xf8244000  ! 484: STW_R	stw	%r28, [%r17 + %r0]
	mov	0x12b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6750000  ! 487: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xf23d4000  ! 491: STD_R	std	%r25, [%r21 + %r0]
	.word 0xb53d2001  ! 496: SRA_I	sra 	%r20, 0x0001, %r26
	.word 0xf33cc000  ! 497: STDF_R	std	%f25, [%r0, %r19]
	mov	0xb, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 501: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb1518000  ! 507: RDPR_PSTATE	<illegal instruction>
	.word 0xf625c000  ! 508: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xf23dc000  ! 509: STD_R	std	%r25, [%r23 + %r0]
	.word 0xf4354000  ! 511: STH_R	sth	%r26, [%r21 + %r0]
	setx	0x7ec7ff310000bb11, %g1, %r10
	.word 0x839a8000  ! 512: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf63dc000  ! 514: STD_R	std	%r27, [%r23 + %r0]
	mov	2, %r12
	.word 0x8f930000  ! 519: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x859461d4  ! 520: WRPR_TSTATE_I	wrpr	%r17, 0x01d4, %tstate
	setx	0xf756de870000f908, %g1, %r10
	.word 0x839a8000  ! 521: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x9195e009  ! 526: WRPR_PIL_I	wrpr	%r23, 0x0009, %pil
	.word 0xf6352141  ! 528: STH_I	sth	%r27, [%r20 + 0x0141]
	.word 0xbf508000  ! 529: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xbf2df001  ! 531: SLLX_I	sllx	%r23, 0x0001, %r31
	.word 0xb9343001  ! 533: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0xfe2c8000  ! 534: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xfd3d6012  ! 536: STDF_I	std	%f30, [0x0012, %r21]
	.word 0xf02ca118  ! 537: STB_I	stb	%r24, [%r18 + 0x0118]
	.word 0xf53d0000  ! 538: STDF_R	std	%f26, [%r0, %r20]
	.word 0xf675c000  ! 542: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf0356139  ! 543: STH_I	sth	%r24, [%r21 + 0x0139]
	.word 0xf73d211c  ! 544: STDF_I	std	%f27, [0x011c, %r20]
	.word 0xf22ca0d3  ! 545: STB_I	stb	%r25, [%r18 + 0x00d3]
	.word 0xf63d6123  ! 546: STD_I	std	%r27, [%r21 + 0x0123]
	.word 0xf03520ca  ! 547: STH_I	sth	%r24, [%r20 + 0x00ca]
	.word 0xf43c61b8  ! 549: STD_I	std	%r26, [%r17 + 0x01b8]
	.word 0x8794e0c3  ! 551: WRPR_TT_I	wrpr	%r19, 0x00c3, %tt
	.word 0xf4754000  ! 556: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xf834c000  ! 558: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xf474c000  ! 564: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xf13c0000  ! 565: STDF_R	std	%f24, [%r0, %r16]
	.word 0xfa3cc000  ! 568: STD_R	std	%r29, [%r19 + %r0]
	.word 0xbc1ca1a9  ! 570: XOR_I	xor 	%r18, 0x01a9, %r30
	mov	2, %r12
	.word 0x8f930000  ! 571: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8195e10f  ! 575: WRPR_TPC_I	wrpr	%r23, 0x010f, %tpc
	setx	0x39963ddf0000ea07, %g1, %r10
	.word 0x819a8000  ! 578: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0x859520b5  ! 580: WRPR_TSTATE_I	wrpr	%r20, 0x00b5, %tstate
	.word 0xb13cf001  ! 583: SRAX_I	srax	%r19, 0x0001, %r24
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d8000  ! 590: STB_R	stb	%r27, [%r22 + %r0]
	setx	data_start_5, %g1, %r17
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02de1d3  ! 594: STB_I	stb	%r24, [%r23 + 0x01d3]
	.word 0xfa3cc000  ! 600: STD_R	std	%r29, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8795a1af  ! 603: WRPR_TT_I	wrpr	%r22, 0x01af, %tt
	.word 0xf035e11a  ! 604: STH_I	sth	%r24, [%r23 + 0x011a]
	.word 0xb684205c  ! 609: ADDcc_I	addcc 	%r16, 0x005c, %r27
	.word 0xb92d9000  ! 610: SLLX_R	sllx	%r22, %r0, %r28
	.word 0xbd3c0000  ! 615: SRA_R	sra 	%r16, %r0, %r30
	setx	data_start_2, %g1, %r20
	.word 0xf425c000  ! 617: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xf13c0000  ! 618: STDF_R	std	%f24, [%r0, %r16]
	.word 0xbc0d0000  ! 619: AND_R	and 	%r20, %r0, %r30
	.word 0xfa2da0c6  ! 620: STB_I	stb	%r29, [%r22 + 0x00c6]
	.word 0xf63d6023  ! 621: STD_I	std	%r27, [%r21 + 0x0023]
	.word 0xf47561b4  ! 623: STX_I	stx	%r26, [%r21 + 0x01b4]
	.word 0xb1504000  ! 629: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xf13da0c2  ! 631: STDF_I	std	%f24, [0x00c2, %r22]
	mov	0x23, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4744000  ! 634: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xf63d0000  ! 635: STD_R	std	%r27, [%r20 + %r0]
	.word 0xfa340000  ! 638: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xf2240000  ! 641: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xfc744000  ! 642: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xb97c2401  ! 644: MOVR_I	movre	%r16, 0x1, %r28
	.word 0xfc74a066  ! 645: STX_I	stx	%r30, [%r18 + 0x0066]
	.word 0xbd504000  ! 646: RDPR_TNPC	<illegal instruction>
	.word 0x81946024  ! 647: WRPR_TPC_I	wrpr	%r17, 0x0024, %tpc
	.word 0x8994e00f  ! 650: WRPR_TICK_I	wrpr	%r19, 0x000f, %tick
	setx	data_start_5, %g1, %r18
	mov	0x3e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf33d61c8  ! 660: STDF_I	std	%f25, [0x01c8, %r21]
	.word 0xb4c48000  ! 661: ADDCcc_R	addccc 	%r18, %r0, %r26
	.word 0xf075c000  ! 664: STX_R	stx	%r24, [%r23 + %r0]
	setx	data_start_0, %g1, %r20
	.word 0xf024e175  ! 673: STW_I	stw	%r24, [%r19 + 0x0175]
	.word 0xf6740000  ! 677: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xfa3dc000  ! 686: STD_R	std	%r29, [%r23 + %r0]
	.word 0xfa3d20f5  ! 689: STD_I	std	%r29, [%r20 + 0x00f5]
	.word 0xfa2de065  ! 691: STB_I	stb	%r29, [%r23 + 0x0065]
	mov	0x34, %o0
	ta	T_SEND_THRD_INTR
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87952009  ! 696: WRPR_TT_I	wrpr	%r20, 0x0009, %tt
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3c21b0  ! 703: STD_I	std	%r31, [%r16 + 0x01b0]
	.word 0xf83d615c  ! 704: STD_I	std	%r28, [%r21 + 0x015c]
	.word 0xb63c4000  ! 707: XNOR_R	xnor 	%r17, %r0, %r27
	.word 0xf834c000  ! 708: STH_R	sth	%r28, [%r19 + %r0]
	mov	0x5, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf93d4000  ! 711: STDF_R	std	%f28, [%r0, %r21]
	.word 0xb3480000  ! 712: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfc340000  ! 715: STH_R	sth	%r30, [%r16 + %r0]
	.word 0x8d94614a  ! 718: WRPR_PSTATE_I	wrpr	%r17, 0x014a, %pstate
	.word 0x8794614b  ! 720: WRPR_TT_I	wrpr	%r17, 0x014b, %tt
	mov	0x2a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c8000  ! 727: STB_R	stb	%r24, [%r18 + %r0]
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 732: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfa758000  ! 733: STX_R	stx	%r29, [%r22 + %r0]
	.word 0x8595e06f  ! 734: WRPR_TSTATE_I	wrpr	%r23, 0x006f, %tstate
	.word 0xb0250000  ! 735: SUB_R	sub 	%r20, %r0, %r24
	mov	0x233, %o0
	ta	T_SEND_THRD_INTR
	mov	0x320, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3c4000  ! 747: STD_R	std	%r29, [%r17 + %r0]
	.word 0xf6750000  ! 748: STX_R	stx	%r27, [%r20 + %r0]
	.word 0x8795e1d6  ! 749: WRPR_TT_I	wrpr	%r23, 0x01d6, %tt
	.word 0xf02cc000  ! 751: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xb1508000  ! 756: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x8195e192  ! 762: WRPR_TPC_I	wrpr	%r23, 0x0192, %tpc
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794e054  ! 764: WRPR_TT_I	wrpr	%r19, 0x0054, %tt
	mov	0x219, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d60d1  ! 772: STB_I	stb	%r24, [%r21 + 0x00d1]
	.word 0x8795a0e1  ! 773: WRPR_TT_I	wrpr	%r22, 0x00e1, %tt
	.word 0xff3d4000  ! 774: STDF_R	std	%f31, [%r0, %r21]
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r19
	.word 0xf03de063  ! 784: STD_I	std	%r24, [%r23 + 0x0063]
	.word 0xb6b44000  ! 787: SUBCcc_R	orncc 	%r17, %r0, %r27
	.word 0xf13c2183  ! 789: STDF_I	std	%f24, [0x0183, %r16]
	.word 0xfa2520c4  ! 792: STW_I	stw	%r29, [%r20 + 0x00c4]
	.word 0xf22c61e9  ! 801: STB_I	stb	%r25, [%r17 + 0x01e9]
	.word 0xb5500000  ! 805: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xfe3cc000  ! 806: STD_R	std	%r31, [%r19 + %r0]
	.word 0xfe358000  ! 810: STH_R	sth	%r31, [%r22 + %r0]
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35a1d1  ! 817: STH_I	sth	%r29, [%r22 + 0x01d1]
	.word 0xfa3da1ca  ! 818: STD_I	std	%r29, [%r22 + 0x01ca]
	.word 0xf93c0000  ! 819: STDF_R	std	%f28, [%r0, %r16]
	.word 0xf13d6160  ! 820: STDF_I	std	%f24, [0x0160, %r21]
	.word 0xbf500000  ! 821: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf425c000  ! 823: STW_R	stw	%r26, [%r23 + %r0]
	mov	0x308, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25c000  ! 830: STW_R	stw	%r31, [%r23 + %r0]
	mov	0x23, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf23dc000  ! 833: STD_R	std	%r25, [%r23 + %r0]
	.word 0xf13de156  ! 834: STDF_I	std	%f24, [0x0156, %r23]
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879461a0  ! 842: WRPR_TT_I	wrpr	%r17, 0x01a0, %tt
	.word 0xb1510000  ! 843: RDPR_TICK	rdpr	%tick, %r24
	.word 0xb3540000  ! 845: RDPR_GL	<illegal instruction>
	.word 0xb6350000  ! 848: ORN_R	orn 	%r20, %r0, %r27
	.word 0xb5518000  ! 849: RDPR_PSTATE	<illegal instruction>
	.word 0xfe256054  ! 854: STW_I	stw	%r31, [%r21 + 0x0054]
	.word 0xf22d2095  ! 858: STB_I	stb	%r25, [%r20 + 0x0095]
	.word 0xbc2c21df  ! 860: ANDN_I	andn 	%r16, 0x01df, %r30
	.word 0xbb500000  ! 861: RDPR_TPC	<illegal instruction>
	.word 0xf6244000  ! 862: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xb0248000  ! 863: SUB_R	sub 	%r18, %r0, %r24
	.word 0x839520b5  ! 864: WRPR_TNPC_I	wrpr	%r20, 0x00b5, %tnpc
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68c60c9  ! 867: ANDcc_I	andcc 	%r17, 0x00c9, %r27
	.word 0xf2754000  ! 870: STX_R	stx	%r25, [%r21 + %r0]
	setx	0xbd37d4310000290c, %g1, %r10
	.word 0x839a8000  ! 871: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf82ca078  ! 873: STB_I	stb	%r28, [%r18 + 0x0078]
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994a123  ! 895: WRPR_TICK_I	wrpr	%r18, 0x0123, %tick
	.word 0xf13cc000  ! 896: STDF_R	std	%f24, [%r0, %r19]
	.word 0xb3500000  ! 900: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xbf500000  ! 902: RDPR_TPC	<illegal instruction>
	.word 0xb6b4c000  ! 903: SUBCcc_R	orncc 	%r19, %r0, %r27
	.word 0xfa2da0b7  ! 904: STB_I	stb	%r29, [%r22 + 0x00b7]
	.word 0xb9508000  ! 906: RDPR_TSTATE	<illegal instruction>
	.word 0xfc34a0c0  ! 908: STH_I	sth	%r30, [%r18 + 0x00c0]
	mov	0x239, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 915: RDPR_PSTATE	<illegal instruction>
	.word 0x9194219a  ! 917: WRPR_PIL_I	wrpr	%r16, 0x019a, %pil
	.word 0xb7520000  ! 918: RDPR_PIL	rdpr	%pil, %r27
	.word 0xbb51c000  ! 919: RDPR_TL	<illegal instruction>
	mov	0x23d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 924: RDPR_TL	<illegal instruction>
	.word 0xff3d0000  ! 929: STDF_R	std	%f31, [%r0, %r20]
	mov	0x17, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 934: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbd520000  ! 936: RDPR_PIL	rdpr	%pil, %r30
	.word 0xb6ada188  ! 939: ANDNcc_I	andncc 	%r22, 0x0188, %r27
	.word 0xfe24c000  ! 940: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf63d6031  ! 944: STD_I	std	%r27, [%r21 + 0x0031]
	.word 0xb43dc000  ! 947: XNOR_R	xnor 	%r23, %r0, %r26
	.word 0xf82d8000  ! 951: STB_R	stb	%r28, [%r22 + %r0]
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6758000  ! 954: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xf73cc000  ! 955: STDF_R	std	%f27, [%r0, %r19]
	setx	data_start_7, %g1, %r23
	.word 0xf434a1f1  ! 958: STH_I	sth	%r26, [%r18 + 0x01f1]
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	setx	0x7ae9c9750000db55, %g1, %r10
	.word 0x819a8000  ! 964: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc3d60e8  ! 965: STD_I	std	%r30, [%r21 + 0x00e8]
	.word 0x8994a160  ! 966: WRPR_TICK_I	wrpr	%r18, 0x0160, %tick
	.word 0xfe74c000  ! 969: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xf02c6095  ! 970: STB_I	stb	%r24, [%r17 + 0x0095]
	.word 0xf33dc000  ! 976: STDF_R	std	%f25, [%r0, %r23]
	.word 0xf13ce1fe  ! 979: STDF_I	std	%f24, [0x01fe, %r19]
	.word 0xf93c8000  ! 980: STDF_R	std	%f28, [%r0, %r18]
	.word 0xb1540000  ! 982: RDPR_GL	rdpr	%-, %r24
	.word 0xf22c0000  ! 984: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xf82c215e  ! 985: STB_I	stb	%r28, [%r16 + 0x015e]
	.word 0xfa74a02a  ! 989: STX_I	stx	%r29, [%r18 + 0x002a]
	.word 0xbe0d8000  ! 991: AND_R	and 	%r22, %r0, %r31
	.word 0x8594a04c  ! 993: WRPR_TSTATE_I	wrpr	%r18, 0x004c, %tstate
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx	data_start_0, %g1, %r16
	setx	data_start_1, %g1, %r17
	setx	data_start_2, %g1, %r18
	setx	data_start_3, %g1, %r19
	setx	data_start_4, %g1, %r20
	setx	data_start_5, %g1, %r21
	setx	data_start_6, %g1, %r22
	setx	data_start_7, %g1, %r23
	mov	0x8, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d4000  ! 4: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xfc546182  ! 8: LDSH_I	ldsh	[%r17 + 0x0182], %r30
	.word 0xbf518000  ! 12: RDPR_PSTATE	<illegal instruction>
	setx	data_start_2, %g1, %r22
	.word 0xf11da141  ! 17: LDDF_I	ldd	[%r22, 0x0141], %f24
	.word 0x8d94a1f9  ! 18: WRPR_PSTATE_I	wrpr	%r18, 0x01f9, %pstate
	.word 0xf4548000  ! 23: LDSH_R	ldsh	[%r18 + %r0], %r26
	mov	0x2a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0350000  ! 25: SUBC_R	orn 	%r20, %r0, %r24
	.word 0xf24c205c  ! 30: LDSB_I	ldsb	[%r16 + 0x005c], %r25
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5ce1e0  ! 33: LDX_I	ldx	[%r19 + 0x01e0], %r31
	.word 0xf6158000  ! 35: LDUH_R	lduh	[%r22 + %r0], %r27
	.word 0xb9540000  ! 39: RDPR_GL	rdpr	%-, %r28
	.word 0xf055a0c4  ! 43: LDSH_I	ldsh	[%r22 + 0x00c4], %r24
	.word 0xb035c000  ! 44: SUBC_R	orn 	%r23, %r0, %r24
	.word 0xf05c0000  ! 45: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xb73dc000  ! 47: SRA_R	sra 	%r23, %r0, %r27
	.word 0xfd1d4000  ! 50: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xfa04a044  ! 52: LDUW_I	lduw	[%r18 + 0x0044], %r29
	.word 0xf85c20e1  ! 55: LDX_I	ldx	[%r16 + 0x00e1], %r28
	.word 0xf41dc000  ! 57: LDD_R	ldd	[%r23 + %r0], %r26
	setx	data_start_7, %g1, %r21
	.word 0x8795e0d1  ! 60: WRPR_TT_I	wrpr	%r23, 0x00d1, %tt
	.word 0xfa5d61e2  ! 66: LDX_I	ldx	[%r21 + 0x01e2], %r29
	.word 0xf2056044  ! 69: LDUW_I	lduw	[%r21 + 0x0044], %r25
	.word 0xfa0cc000  ! 71: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xfa05e0fd  ! 74: LDUW_I	lduw	[%r23 + 0x00fd], %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x1d97675d0000d840, %g1, %r10
	.word 0x819a8000  ! 80: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_0, %g1, %r21
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9c6083  ! 90: XORcc_I	xorcc 	%r17, 0x0083, %r30
	mov	0x220, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf71c2056  ! 94: LDDF_I	ldd	[%r16, 0x0056], %f27
	.word 0xf41c4000  ! 98: LDD_R	ldd	[%r17 + %r0], %r26
	.word 0xf055c000  ! 99: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0xb8b44000  ! 104: ORNcc_R	orncc 	%r17, %r0, %r28
	setx	data_start_7, %g1, %r21
	.word 0xfe1c4000  ! 110: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xfe4521f1  ! 111: LDSW_I	ldsw	[%r20 + 0x01f1], %r31
	.word 0xb5480000  ! 112: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbc24e05d  ! 118: SUB_I	sub 	%r19, 0x005d, %r30
	.word 0xb6c5c000  ! 125: ADDCcc_R	addccc 	%r23, %r0, %r27
	setx	0x6a26f1310000a816, %g1, %r10
	.word 0x839a8000  ! 127: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb540000  ! 129: RDPR_GL	<illegal instruction>
	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 132: MOVcc_R	<illegal instruction>
	.word 0xf80c8000  ! 133: LDUB_R	ldub	[%r18 + %r0], %r28
	.word 0xf51c0000  ! 137: LDDF_R	ldd	[%r16, %r0], %f26
	.word 0xf2554000  ! 142: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xf4156093  ! 147: LDUH_I	lduh	[%r21 + 0x0093], %r26
	.word 0xb9340000  ! 152: SRL_R	srl 	%r16, %r0, %r28
	.word 0xbd34b001  ! 153: SRLX_I	srlx	%r18, 0x0001, %r30
	.word 0xfb1c8000  ! 157: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xbc2421a5  ! 158: SUB_I	sub 	%r16, 0x01a5, %r30
	.word 0xb3520000  ! 159: RDPR_PIL	<illegal instruction>
	.word 0x8595e0d4  ! 163: WRPR_TSTATE_I	wrpr	%r23, 0x00d4, %tstate
	.word 0xfc5460ba  ! 165: LDSH_I	ldsh	[%r17 + 0x00ba], %r30
	.word 0x899460a1  ! 166: WRPR_TICK_I	wrpr	%r17, 0x00a1, %tick
	.word 0xfe1c8000  ! 169: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xb44520dc  ! 170: ADDC_I	addc 	%r20, 0x00dc, %r26
	.word 0xfe44e127  ! 173: LDSW_I	ldsw	[%r19 + 0x0127], %r31
	setx	data_start_2, %g1, %r18
	.word 0xfa5de1f0  ! 186: LDX_I	ldx	[%r23 + 0x01f0], %r29
	.word 0xb5504000  ! 187: RDPR_TNPC	<illegal instruction>
	.word 0xb7500000  ! 192: RDPR_TPC	<illegal instruction>
	.word 0xfa4c4000  ! 197: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xb22ca079  ! 198: ANDN_I	andn 	%r18, 0x0079, %r25
	.word 0xfc1ca0b0  ! 202: LDD_I	ldd	[%r18 + 0x00b0], %r30
	.word 0xfe552102  ! 203: LDSH_I	ldsh	[%r20 + 0x0102], %r31
	.word 0xbf480000  ! 204: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	data_start_3, %g1, %r20
	.word 0xb1510000  ! 209: RDPR_TICK	<illegal instruction>
	.word 0xf2144000  ! 210: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xb550c000  ! 213: RDPR_TT	<illegal instruction>
	.word 0xb0c420e1  ! 214: ADDCcc_I	addccc 	%r16, 0x00e1, %r24
	.word 0xfc5c21d7  ! 216: LDX_I	ldx	[%r16 + 0x01d7], %r30
	.word 0xf20c4000  ! 227: LDUB_R	ldub	[%r17 + %r0], %r25
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0556188  ! 237: LDSH_I	ldsh	[%r21 + 0x0188], %r24
	.word 0xf6448000  ! 238: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0xfe5d0000  ! 241: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xb951c000  ! 245: RDPR_TL	<illegal instruction>
	.word 0xfa5521bf  ! 248: LDSH_I	ldsh	[%r20 + 0x01bf], %r29
	.word 0xf41521a4  ! 250: LDUH_I	lduh	[%r20 + 0x01a4], %r26
	.word 0xf25560ad  ! 261: LDSH_I	ldsh	[%r21 + 0x00ad], %r25
	.word 0xf8458000  ! 262: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xfa5d8000  ! 269: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xb72df001  ! 270: SLLX_I	sllx	%r23, 0x0001, %r27
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879420d8  ! 272: WRPR_TT_I	wrpr	%r16, 0x00d8, %tt
	.word 0xf51d8000  ! 273: LDDF_R	ldd	[%r22, %r0], %f26
	setx	data_start_1, %g1, %r19
	.word 0xfe0c8000  ! 277: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xf04560f3  ! 278: LDSW_I	ldsw	[%r21 + 0x00f3], %r24
	.word 0xfc140000  ! 279: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xf0446038  ! 284: LDSW_I	ldsw	[%r17 + 0x0038], %r24
	.word 0xfd1c0000  ! 285: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0xbd500000  ! 292: RDPR_TPC	<illegal instruction>
	.word 0xf11c61eb  ! 294: LDDF_I	ldd	[%r17, 0x01eb], %f24
	.word 0xbb510000  ! 296: RDPR_TICK	<illegal instruction>
	.word 0xbf510000  ! 297: RDPR_TICK	<illegal instruction>
	.word 0xfa54a055  ! 301: LDSH_I	ldsh	[%r18 + 0x0055], %r29
	.word 0xfa1dc000  ! 302: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xbd504000  ! 303: RDPR_TNPC	<illegal instruction>
	mov	0x206, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04cc000  ! 307: LDSB_R	ldsb	[%r19 + %r0], %r24
	.word 0xfa0d8000  ! 309: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xf05c8000  ! 310: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0xbf508000  ! 312: RDPR_TSTATE	<illegal instruction>
	.word 0xf40c4000  ! 316: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xbd518000  ! 321: RDPR_PSTATE	<illegal instruction>
	.word 0xfa540000  ! 325: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xf40d6074  ! 326: LDUB_I	ldub	[%r21 + 0x0074], %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf91c0000  ! 329: LDDF_R	ldd	[%r16, %r0], %f28
	setx	data_start_2, %g1, %r19
	.word 0xbb520000  ! 333: RDPR_PIL	<illegal instruction>
	.word 0xfc1520de  ! 336: LDUH_I	lduh	[%r20 + 0x00de], %r30
	.word 0xb044e198  ! 337: ADDC_I	addc 	%r19, 0x0198, %r24
	.word 0xf91c4000  ! 338: LDDF_R	ldd	[%r17, %r0], %f28
	mov	0x302, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbe24e1b8  ! 343: SUB_I	sub 	%r19, 0x01b8, %r31
	.word 0xbb520000  ! 346: RDPR_PIL	<illegal instruction>
	.word 0xbea48000  ! 348: SUBcc_R	subcc 	%r18, %r0, %r31
	.word 0x8194a058  ! 349: WRPR_TPC_I	wrpr	%r18, 0x0058, %tpc
	.word 0xb3480000  ! 350: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfc546057  ! 356: LDSH_I	ldsh	[%r17 + 0x0057], %r30
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 360: RDPR_TSTATE	<illegal instruction>
	.word 0x8594e02c  ! 361: WRPR_TSTATE_I	wrpr	%r19, 0x002c, %tstate
	.word 0xbb3c1000  ! 364: SRAX_R	srax	%r16, %r0, %r29
	.word 0xf4454000  ! 365: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0x81942010  ! 366: WRPR_TPC_I	wrpr	%r16, 0x0010, %tpc
	.word 0xf404c000  ! 370: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xb551c000  ! 374: RDPR_TL	<illegal instruction>
	.word 0x8d94a040  ! 378: WRPR_PSTATE_I	wrpr	%r18, 0x0040, %pstate
	setx	0xd7007aec00007b56, %g1, %r10
	.word 0x819a8000  ! 379: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8794616f  ! 380: WRPR_TT_I	wrpr	%r17, 0x016f, %tt
	.word 0xf60ca02e  ! 381: LDUB_I	ldub	[%r18 + 0x002e], %r27
	.word 0xbb480000  ! 382: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	mov	0x329, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60da08a  ! 386: LDUB_I	ldub	[%r22 + 0x008a], %r27
	.word 0x8d9460f0  ! 389: WRPR_PSTATE_I	wrpr	%r17, 0x00f0, %pstate
	.word 0xfe4d4000  ! 393: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0x8d95e14e  ! 394: WRPR_PSTATE_I	wrpr	%r23, 0x014e, %pstate
	.word 0x9194e1f1  ! 396: WRPR_PIL_I	wrpr	%r19, 0x01f1, %pil
	.word 0xfe148000  ! 397: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xf05c2184  ! 400: LDX_I	ldx	[%r16 + 0x0184], %r24
	.word 0x8d95e1a2  ! 403: WRPR_PSTATE_I	wrpr	%r23, 0x01a2, %pstate
	.word 0xbf508000  ! 405: RDPR_TSTATE	<illegal instruction>
	.word 0xf45d60de  ! 408: LDX_I	ldx	[%r21 + 0x00de], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf055e17a  ! 412: LDSH_I	ldsh	[%r23 + 0x017a], %r24
	.word 0x8994601d  ! 415: WRPR_TICK_I	wrpr	%r17, 0x001d, %tick
	.word 0xfa54c000  ! 416: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xfb1ce08f  ! 417: LDDF_I	ldd	[%r19, 0x008f], %f29
	.word 0xf01c21e6  ! 419: LDD_I	ldd	[%r16 + 0x01e6], %r24
	setx	data_start_5, %g1, %r17
	.word 0xf055e145  ! 421: LDSH_I	ldsh	[%r23 + 0x0145], %r24
	.word 0x8d9460a8  ! 426: WRPR_PSTATE_I	wrpr	%r17, 0x00a8, %pstate
	.word 0xbe35e0c9  ! 428: SUBC_I	orn 	%r23, 0x00c9, %r31
	setx	data_start_5, %g1, %r21
	setx	data_start_4, %g1, %r23
	.word 0xf45c4000  ! 433: LDX_R	ldx	[%r17 + %r0], %r26
	.word 0xf0440000  ! 434: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xfa4d4000  ! 438: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xb3508000  ! 441: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xf31ce19a  ! 444: LDDF_I	ldd	[%r19, 0x019a], %f25
	mov	0x32a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60ce088  ! 450: LDUB_I	ldub	[%r19 + 0x0088], %r27
	.word 0xfc05c000  ! 454: LDUW_R	lduw	[%r23 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	1, %r12
	.word 0xa1930000  ! 460: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf60d4000  ! 461: LDUB_R	ldub	[%r21 + %r0], %r27
	mov	0x337, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b5a0ae  ! 467: SUBCcc_I	orncc 	%r22, 0x00ae, %r28
	.word 0xbf508000  ! 471: RDPR_TSTATE	<illegal instruction>
	.word 0xfe5ce1c3  ! 476: LDX_I	ldx	[%r19 + 0x01c3], %r31
	.word 0xfa5c4000  ! 477: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0x8d952176  ! 478: WRPR_PSTATE_I	wrpr	%r20, 0x0176, %pstate
	.word 0xb244a094  ! 481: ADDC_I	addc 	%r18, 0x0094, %r25
	mov	0x304, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa1d600b  ! 486: LDD_I	ldd	[%r21 + 0x000b], %r29
	.word 0xfa158000  ! 490: LDUH_R	lduh	[%r22 + %r0], %r29
	.word 0xf854a15b  ! 493: LDSH_I	ldsh	[%r18 + 0x015b], %r28
	.word 0xfc0d21c6  ! 494: LDUB_I	ldub	[%r20 + 0x01c6], %r30
	.word 0xbf3d2001  ! 496: SRA_I	sra 	%r20, 0x0001, %r31
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 501: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfc046197  ! 503: LDUW_I	lduw	[%r17 + 0x0197], %r30
	.word 0xbb518000  ! 507: RDPR_PSTATE	<illegal instruction>
	setx	0xb60834100007d13, %g1, %r10
	.word 0x839a8000  ! 512: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf60ca030  ! 517: LDUB_I	ldub	[%r18 + 0x0030], %r27
	.word 0xf04c217f  ! 518: LDSB_I	ldsb	[%r16 + 0x017f], %r24
	mov	0, %r12
	.word 0x8f930000  ! 519: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8594e0bf  ! 520: WRPR_TSTATE_I	wrpr	%r19, 0x00bf, %tstate
	setx	0x142ce2510000bc81, %g1, %r10
	.word 0x839a8000  ! 521: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x919521b5  ! 526: WRPR_PIL_I	wrpr	%r20, 0x01b5, %pil
	.word 0xfc1dc000  ! 527: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0xbf508000  ! 529: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xfe1de1f4  ! 530: LDD_I	ldd	[%r23 + 0x01f4], %r31
	.word 0xb72db001  ! 531: SLLX_I	sllx	%r22, 0x0001, %r27
	.word 0xb7357001  ! 533: SRLX_I	srlx	%r21, 0x0001, %r27
	.word 0xf2554000  ! 540: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0x8794e1ce  ! 551: WRPR_TT_I	wrpr	%r19, 0x01ce, %tt
	.word 0xf05d8000  ! 554: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0xf85c4000  ! 560: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xf61cc000  ! 562: LDD_R	ldd	[%r19 + %r0], %r27
	.word 0xfc45e01d  ! 563: LDSW_I	ldsw	[%r23 + 0x001d], %r30
	.word 0xf00d0000  ! 566: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xfe5da09b  ! 569: LDX_I	ldx	[%r22 + 0x009b], %r31
	.word 0xb41da19e  ! 570: XOR_I	xor 	%r22, 0x019e, %r26
	mov	0, %r12
	.word 0x8f930000  ! 571: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xff1ca1ac  ! 572: LDDF_I	ldd	[%r18, 0x01ac], %f31
	.word 0x8194e0aa  ! 575: WRPR_TPC_I	wrpr	%r19, 0x00aa, %tpc
	.word 0xf8048000  ! 576: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xf51c60b7  ! 577: LDDF_I	ldd	[%r17, 0x00b7], %f26
	setx	0x4242ee430000db41, %g1, %r10
	.word 0x819a8000  ! 578: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594e103  ! 580: WRPR_TSTATE_I	wrpr	%r19, 0x0103, %tstate
	.word 0xf41c0000  ! 582: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xb93cb001  ! 583: SRAX_I	srax	%r18, 0x0001, %r28
	.word 0xfd1c207e  ! 584: LDDF_I	ldd	[%r16, 0x007e], %f30
	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf815c000  ! 586: LDUH_R	lduh	[%r23 + %r0], %r28
	.word 0xf40c2177  ! 588: LDUB_I	ldub	[%r16 + 0x0177], %r26
	setx	data_start_0, %g1, %r23
	mov	0x10, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2052119  ! 593: LDUW_I	lduw	[%r20 + 0x0119], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x879520c1  ! 603: WRPR_TT_I	wrpr	%r20, 0x00c1, %tt
	.word 0xf71d617b  ! 605: LDDF_I	ldd	[%r21, 0x017b], %f27
	.word 0xb684e0ae  ! 609: ADDcc_I	addcc 	%r19, 0x00ae, %r27
	.word 0xb92c9000  ! 610: SLLX_R	sllx	%r18, %r0, %r28
	.word 0xfc4d2058  ! 611: LDSB_I	ldsb	[%r20 + 0x0058], %r30
	.word 0xb73d4000  ! 615: SRA_R	sra 	%r21, %r0, %r27
	setx	data_start_0, %g1, %r22
	.word 0xb40d0000  ! 619: AND_R	and 	%r20, %r0, %r26
	.word 0xb1504000  ! 629: RDPR_TNPC	<illegal instruction>
	.word 0xfa1c20b5  ! 632: LDD_I	ldd	[%r16 + 0x00b5], %r29
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa1ce1a2  ! 643: LDD_I	ldd	[%r19 + 0x01a2], %r29
	.word 0xb37ca401  ! 644: MOVR_I	movre	%r18, 0x1, %r25
	.word 0xb1504000  ! 646: RDPR_TNPC	<illegal instruction>
	.word 0x8194613f  ! 647: WRPR_TPC_I	wrpr	%r17, 0x013f, %tpc
	.word 0x8994a0d5  ! 650: WRPR_TICK_I	wrpr	%r18, 0x00d5, %tick
	setx	data_start_2, %g1, %r20
	mov	0x1e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf814c000  ! 659: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xbac50000  ! 661: ADDCcc_R	addccc 	%r20, %r0, %r29
	.word 0xf4554000  ! 663: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xf0056149  ! 667: LDUW_I	lduw	[%r21 + 0x0149], %r24
	setx	data_start_4, %g1, %r20
	.word 0xf405c000  ! 675: LDUW_R	lduw	[%r23 + %r0], %r26
	.word 0xf40d0000  ! 682: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xf60de16c  ! 683: LDUB_I	ldub	[%r23 + 0x016c], %r27
	.word 0xfb1d61bc  ! 690: LDDF_I	ldd	[%r21, 0x01bc], %f29
	mov	0x137, %o0
	ta	T_SEND_THRD_INTR
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795e02f  ! 696: WRPR_TT_I	wrpr	%r23, 0x002f, %tt
	.word 0xf045a05b  ! 697: LDSW_I	ldsw	[%r22 + 0x005b], %r24
	.word 0xf45cc000  ! 701: LDX_R	ldx	[%r19 + %r0], %r26
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44d8000  ! 705: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xf60561e3  ! 706: LDUW_I	lduw	[%r21 + 0x01e3], %r27
	.word 0xbe3cc000  ! 707: XNOR_R	xnor 	%r19, %r0, %r31
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 712: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf81d0000  ! 714: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0xfa05c000  ! 716: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0x8d9521b9  ! 718: WRPR_PSTATE_I	wrpr	%r20, 0x01b9, %pstate
	.word 0xf00d8000  ! 719: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0x8795e12a  ! 720: WRPR_TT_I	wrpr	%r23, 0x012a, %tt
	mov	0x305, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf81d8000  ! 725: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xf64c0000  ! 729: LDSB_R	ldsb	[%r16 + %r0], %r27
	mov	0x10, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf41c8000  ! 731: LDD_R	ldd	[%r18 + %r0], %r26
	.word 0xb5480000  ! 732: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x859460d8  ! 734: WRPR_TSTATE_I	wrpr	%r17, 0x00d8, %tstate
	.word 0xb8244000  ! 735: SUB_R	sub 	%r17, %r0, %r28
	mov	0x23f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4d21bc  ! 741: LDSB_I	ldsb	[%r20 + 0x01bc], %r29
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe05e032  ! 744: LDUW_I	lduw	[%r23 + 0x0032], %r31
	.word 0x879520cd  ! 749: WRPR_TT_I	wrpr	%r20, 0x00cd, %tt
	.word 0xfa4560f6  ! 752: LDSW_I	ldsw	[%r21 + 0x00f6], %r29
	.word 0xb5508000  ! 756: RDPR_TSTATE	<illegal instruction>
	.word 0xf41ce18d  ! 758: LDD_I	ldd	[%r19 + 0x018d], %r26
	.word 0xf0458000  ! 759: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xf65ca144  ! 761: LDX_I	ldx	[%r18 + 0x0144], %r27
	.word 0x8195a1a6  ! 762: WRPR_TPC_I	wrpr	%r22, 0x01a6, %tpc
	mov	0x20d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794e103  ! 764: WRPR_TT_I	wrpr	%r19, 0x0103, %tt
	.word 0xf04c6013  ! 766: LDSB_I	ldsb	[%r17 + 0x0013], %r24
	.word 0xf605c000  ! 767: LDUW_R	lduw	[%r23 + %r0], %r27
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87946138  ! 773: WRPR_TT_I	wrpr	%r17, 0x0138, %tt
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05d0000  ! 778: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xfc1c4000  ! 780: LDD_R	ldd	[%r17 + %r0], %r30
	setx	data_start_2, %g1, %r16
	.word 0xbcb58000  ! 787: SUBCcc_R	orncc 	%r22, %r0, %r30
	.word 0xf654a0cc  ! 790: LDSH_I	ldsh	[%r18 + 0x00cc], %r27
	.word 0xfa5de111  ! 795: LDX_I	ldx	[%r23 + 0x0111], %r29
	.word 0xfe0c4000  ! 797: LDUB_R	ldub	[%r17 + %r0], %r31
	.word 0xf61cc000  ! 803: LDD_R	ldd	[%r19 + %r0], %r27
	.word 0xfe550000  ! 804: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xb9500000  ! 805: RDPR_TPC	<illegal instruction>
	.word 0xf204e1f9  ! 807: LDUW_I	lduw	[%r19 + 0x01f9], %r25
	.word 0xf84d6157  ! 809: LDSB_I	ldsb	[%r21 + 0x0157], %r28
	.word 0xf25c4000  ! 812: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xf4150000  ! 813: LDUH_R	lduh	[%r20 + %r0], %r26
	mov	0x129, %o0
	ta	T_SEND_THRD_INTR
	mov	0x223, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c8000  ! 816: LDSB_R	ldsb	[%r18 + %r0], %r29
	.word 0xbb500000  ! 821: RDPR_TPC	rdpr	%tpc, %r29
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf11da128  ! 825: LDDF_I	ldd	[%r22, 0x0128], %f24
	.word 0xf41c0000  ! 826: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xf31ce1e2  ! 827: LDDF_I	ldd	[%r19, 0x01e2], %f25
	mov	0x1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf804e126  ! 835: LDUW_I	lduw	[%r19 + 0x0126], %r28
	.word 0xfa0c207d  ! 836: LDUB_I	ldub	[%r16 + 0x007d], %r29
	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf415a045  ! 838: LDUH_I	lduh	[%r22 + 0x0045], %r26
	.word 0xf25c8000  ! 839: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xfc55a0db  ! 841: LDSH_I	ldsh	[%r22 + 0x00db], %r30
	.word 0x8795a1d4  ! 842: WRPR_TT_I	wrpr	%r22, 0x01d4, %tt
	.word 0xb1510000  ! 843: RDPR_TICK	<illegal instruction>
	.word 0xbb540000  ! 845: RDPR_GL	<illegal instruction>
	.word 0xbc344000  ! 848: ORN_R	orn 	%r17, %r0, %r30
	.word 0xb5518000  ! 849: RDPR_PSTATE	<illegal instruction>
	.word 0xfc4ce0ca  ! 852: LDSB_I	ldsb	[%r19 + 0x00ca], %r30
	.word 0xf804c000  ! 857: LDUW_R	lduw	[%r19 + %r0], %r28
	.word 0xb02ce06d  ! 860: ANDN_I	andn 	%r19, 0x006d, %r24
	.word 0xb1500000  ! 861: RDPR_TPC	<illegal instruction>
	.word 0xb024c000  ! 863: SUB_R	sub 	%r19, %r0, %r24
	.word 0x839460d6  ! 864: WRPR_TNPC_I	wrpr	%r17, 0x00d6, %tnpc
	.word 0xfc55a1c9  ! 865: LDSH_I	ldsh	[%r22 + 0x01c9], %r30
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68d6184  ! 867: ANDcc_I	andcc 	%r21, 0x0184, %r27
	.word 0xf0540000  ! 869: LDSH_R	ldsh	[%r16 + %r0], %r24
	setx	0xd1e464cc0000b9d9, %g1, %r10
	.word 0x839a8000  ! 871: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf25d4000  ! 875: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xf4554000  ! 877: LDSH_R	ldsh	[%r21 + %r0], %r26
	mov	0x129, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85da0c2  ! 881: LDX_I	ldx	[%r22 + 0x00c2], %r28
	.word 0xfe0d8000  ! 884: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xf81d20bc  ! 888: LDD_I	ldd	[%r20 + 0x00bc], %r28
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00da094  ! 893: LDUB_I	ldub	[%r22 + 0x0094], %r24
	.word 0x89956077  ! 895: WRPR_TICK_I	wrpr	%r21, 0x0077, %tick
	.word 0xb5500000  ! 900: RDPR_TPC	<illegal instruction>
	.word 0xbd500000  ! 902: RDPR_TPC	<illegal instruction>
	.word 0xb0b5c000  ! 903: SUBCcc_R	orncc 	%r23, %r0, %r24
	.word 0xb3508000  ! 906: RDPR_TSTATE	<illegal instruction>
	.word 0xf84dc000  ! 909: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xf11c2157  ! 912: LDDF_I	ldd	[%r16, 0x0157], %f24
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 915: RDPR_PSTATE	<illegal instruction>
	.word 0x9195e137  ! 917: WRPR_PIL_I	wrpr	%r23, 0x0137, %pil
	.word 0xb3520000  ! 918: RDPR_PIL	<illegal instruction>
	.word 0xb151c000  ! 919: RDPR_TL	<illegal instruction>
	.word 0xfa1d8000  ! 920: LDD_R	ldd	[%r22 + %r0], %r29
	.word 0xf4140000  ! 921: LDUH_R	lduh	[%r16 + %r0], %r26
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa448000  ! 923: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xb351c000  ! 924: RDPR_TL	<illegal instruction>
	.word 0xf205a0ab  ! 926: LDUW_I	lduw	[%r22 + 0x00ab], %r25
	.word 0xf24d4000  ! 930: LDSB_R	ldsb	[%r21 + %r0], %r25
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 934: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc5c8000  ! 935: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xb7520000  ! 936: RDPR_PIL	<illegal instruction>
	.word 0xfa448000  ! 938: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xb8ac2062  ! 939: ANDNcc_I	andncc 	%r16, 0x0062, %r28
	.word 0xf64520b4  ! 942: LDSW_I	ldsw	[%r20 + 0x00b4], %r27
	.word 0xfe4d204f  ! 946: LDSB_I	ldsb	[%r20 + 0x004f], %r31
	.word 0xb03c4000  ! 947: XNOR_R	xnor 	%r17, %r0, %r24
	.word 0xf604c000  ! 952: LDUW_R	lduw	[%r19 + %r0], %r27
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r18
	mov	0x236, %o0
	ta	T_SEND_THRD_INTR
	setx	0xe6260f690000f907, %g1, %r10
	.word 0x819a8000  ! 964: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8995611b  ! 966: WRPR_TICK_I	wrpr	%r21, 0x011b, %tick
	.word 0xf6054000  ! 967: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xfc1d8000  ! 968: LDD_R	ldd	[%r22 + %r0], %r30
	.word 0xf055c000  ! 971: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0xbb540000  ! 982: RDPR_GL	<illegal instruction>
	.word 0xf05d6194  ! 983: LDX_I	ldx	[%r21 + 0x0194], %r24
	.word 0xfa15a04f  ! 987: LDUH_I	lduh	[%r22 + 0x004f], %r29
	.word 0xb80cc000  ! 991: AND_R	and 	%r19, %r0, %r28
	.word 0x8595215a  ! 993: WRPR_TSTATE_I	wrpr	%r20, 0x015a, %tstate
	.word 0xf65d0000  ! 995: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xf60c0000  ! 996: LDUB_R	ldub	[%r16 + %r0], %r27
	.word 0xfe548000  ! 998: LDSH_R	ldsh	[%r18 + %r0], %r31
	mov	0x37, %o0
	ta	T_SEND_THRD_INTR
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	mov	0x22a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 10: FMOVRZ	dis not found

	.word 0xb3518000  ! 12: RDPR_PSTATE	<illegal instruction>
	.word 0xb9ab0820  ! 13: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb1ab0820  ! 14: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbda88820  ! 15: FMOVLE	fmovs	%fcc1, %f0, %f30
	setx	data_start_2, %g1, %r23
	.word 0x8d9460b8  ! 18: WRPR_PSTATE_I	wrpr	%r17, 0x00b8, %pstate
	.word 0xb1a54840  ! 20: FADDd	faddd	%f52, %f0, %f24
	mov	0x18, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4350000  ! 25: SUBC_R	orn 	%r20, %r0, %r26
	mov	0x220, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab4820  ! 36: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbb540000  ! 39: RDPR_GL	<illegal instruction>
	.word 0xb5a00560  ! 40: FSQRTq	fsqrt	
	.word 0xb8340000  ! 44: SUBC_R	orn 	%r16, %r0, %r28
	.word 0xbda9c820  ! 46: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbd3d8000  ! 47: SRA_R	sra 	%r22, %r0, %r30
	.word 0xbda80820  ! 51: FMOVN	fmovs	%fcc1, %f0, %f30
	setx	data_start_2, %g1, %r20
	.word 0x8794218d  ! 60: WRPR_TT_I	wrpr	%r16, 0x018d, %tt
	.word 0xbda4c820  ! 62: FADDs	fadds	%f19, %f0, %f30
	.word 0xbfa48940  ! 65: FMULd	fmuld	%f18, %f0, %f62
	.word 0xbfa80820  ! 68: FMOVN	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a00020  ! 78: FMOVs	fmovs	%f0, %f25
	setx	0x3413614500005f80, %g1, %r10
	.word 0x819a8000  ! 80: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_0, %g1, %r16
	.word 0xb9a449a0  ! 83: FDIVs	fdivs	%f17, %f0, %f28
	mov	0x309, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89d21aa  ! 90: XORcc_I	xorcc 	%r20, 0x01aa, %r28
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00520  ! 93: FSQRTs	fsqrt	
	.word 0xb9a81820  ! 96: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb5a00560  ! 101: FSQRTq	fsqrt	
	.word 0xbfa80820  ! 102: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb5a54840  ! 103: FADDd	faddd	%f52, %f0, %f26
	.word 0xbab40000  ! 104: ORNcc_R	orncc 	%r16, %r0, %r29
	.word 0xb5a40820  ! 105: FADDs	fadds	%f16, %f0, %f26
	setx	data_start_6, %g1, %r22
	.word 0xbd480000  ! 112: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb2246150  ! 118: SUB_I	sub 	%r17, 0x0150, %r25
	.word 0xb9a44840  ! 119: FADDd	faddd	%f48, %f0, %f28
	.word 0xbba5c8a0  ! 120: FSUBs	fsubs	%f23, %f0, %f29
	.word 0xbdab8820  ! 122: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbba80820  ! 124: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbcc54000  ! 125: ADDCcc_R	addccc 	%r21, %r0, %r30
	setx	0x5713800900002880, %g1, %r10
	.word 0x839a8000  ! 127: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbf540000  ! 129: RDPR_GL	<illegal instruction>
	mov	0x4, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9641800  ! 132: MOVcc_R	<illegal instruction>
	.word 0xb7a84820  ! 138: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a489a0  ! 143: FDIVs	fdivs	%f18, %f0, %f25
	.word 0xbfa48860  ! 145: FADDq	dis not found

	.word 0xb1a98820  ! 148: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb1a8c820  ! 150: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbb348000  ! 152: SRL_R	srl 	%r18, %r0, %r29
	.word 0xb3357001  ! 153: SRLX_I	srlx	%r21, 0x0001, %r25
	.word 0xb1a00520  ! 154: FSQRTs	fsqrt	
	.word 0xbda589e0  ! 156: FDIVq	dis not found

	.word 0xba25a17d  ! 158: SUB_I	sub 	%r22, 0x017d, %r29
	.word 0xb9520000  ! 159: RDPR_PIL	<illegal instruction>
	.word 0xb7aa0820  ! 162: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0x8595211f  ! 163: WRPR_TSTATE_I	wrpr	%r20, 0x011f, %tstate
	.word 0xbda589a0  ! 164: FDIVs	fdivs	%f22, %f0, %f30
	.word 0x89956061  ! 166: WRPR_TICK_I	wrpr	%r21, 0x0061, %tick
	.word 0xb9a508a0  ! 167: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xbc4420e9  ! 170: ADDC_I	addc 	%r16, 0x00e9, %r30
	setx	data_start_7, %g1, %r22
	.word 0xb3a44860  ! 179: FADDq	dis not found

	.word 0xbda54840  ! 181: FADDd	faddd	%f52, %f0, %f30
	.word 0xbba81420  ! 184: FMOVRNZ	dis not found

	.word 0xb5a4c9c0  ! 185: FDIVd	fdivd	%f50, %f0, %f26
	.word 0xb5504000  ! 187: RDPR_TNPC	<illegal instruction>
	.word 0xb5ab4820  ! 190: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbf500000  ! 192: RDPR_TPC	<illegal instruction>
	.word 0xb3a40860  ! 194: FADDq	dis not found

	.word 0xbc2ca197  ! 198: ANDN_I	andn 	%r18, 0x0197, %r30
	.word 0xb7480000  ! 204: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	data_start_3, %g1, %r22
	.word 0xbb510000  ! 209: RDPR_TICK	<illegal instruction>
	.word 0xbf50c000  ! 213: RDPR_TT	<illegal instruction>
	.word 0xbec42038  ! 214: ADDCcc_I	addccc 	%r16, 0x0038, %r31
	.word 0xbfa448a0  ! 215: FSUBs	fsubs	%f17, %f0, %f31
	.word 0xb1a54920  ! 220: FMULs	fmuls	%f21, %f0, %f24
	.word 0xbdab0820  ! 226: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb7a54920  ! 233: FMULs	fmuls	%f21, %f0, %f27
	mov	0x2d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba409a0  ! 239: FDIVs	fdivs	%f16, %f0, %f29
	.word 0xbda00540  ! 242: FSQRTd	fsqrt	
	.word 0xbf51c000  ! 245: RDPR_TL	<illegal instruction>
	.word 0xbfa80c20  ! 246: FMOVRLZ	dis not found

	.word 0xb5a80420  ! 252: FMOVRZ	dis not found

	.word 0xb5a84820  ! 253: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a549c0  ! 256: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xb5a58820  ! 258: FADDs	fadds	%f22, %f0, %f26
	.word 0xb32d7001  ! 270: SLLX_I	sllx	%r21, 0x0001, %r25
	mov	0x214, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879521df  ! 272: WRPR_TT_I	wrpr	%r20, 0x01df, %tt
	setx	data_start_1, %g1, %r20
	.word 0xb9a488e0  ! 276: FSUBq	dis not found

	.word 0xb9a409c0  ! 283: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xb1a40960  ! 289: FMULq	dis not found

	.word 0xb3500000  ! 292: RDPR_TPC	<illegal instruction>
	.word 0xb7510000  ! 296: RDPR_TICK	<illegal instruction>
	.word 0xb7510000  ! 297: RDPR_TICK	<illegal instruction>
	.word 0xb9a9c820  ! 298: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb9504000  ! 303: RDPR_TNPC	<illegal instruction>
	mov	0x11d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 312: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a54840  ! 313: FADDd	faddd	%f52, %f0, %f56
	.word 0xbda509e0  ! 314: FDIVq	dis not found

	.word 0xb5aa4820  ! 317: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbbab4820  ! 320: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb3518000  ! 321: RDPR_PSTATE	<illegal instruction>
	.word 0xbba548e0  ! 324: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_6, %g1, %r17
	.word 0xb7520000  ! 333: RDPR_PIL	<illegal instruction>
	.word 0xb244e190  ! 337: ADDC_I	addc 	%r19, 0x0190, %r25
	mov	0x217, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb825e187  ! 343: SUB_I	sub 	%r23, 0x0187, %r28
	.word 0xbda548c0  ! 344: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xb1520000  ! 346: RDPR_PIL	<illegal instruction>
	.word 0xb4a5c000  ! 348: SUBcc_R	subcc 	%r23, %r0, %r26
	.word 0x81952005  ! 349: WRPR_TPC_I	wrpr	%r20, 0x0005, %tpc
	.word 0xb3480000  ! 350: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbfa81420  ! 351: FMOVRNZ	dis not found

	.word 0xbda80820  ! 354: FMOVN	fmovs	%fcc1, %f0, %f30
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a409c0  ! 359: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xb1508000  ! 360: RDPR_TSTATE	<illegal instruction>
	.word 0x859561ed  ! 361: WRPR_TSTATE_I	wrpr	%r21, 0x01ed, %tstate
	.word 0xb9a00020  ! 362: FMOVs	fmovs	%f0, %f28
	.word 0xb1a80c20  ! 363: FMOVRLZ	dis not found

	.word 0xb53d5000  ! 364: SRAX_R	srax	%r21, %r0, %r26
	.word 0x8194a04e  ! 366: WRPR_TPC_I	wrpr	%r18, 0x004e, %tpc
	.word 0xb3a8c820  ! 368: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb1a80c20  ! 369: FMOVRLZ	dis not found

	.word 0xbba88820  ! 372: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a589a0  ! 373: FDIVs	fdivs	%f22, %f0, %f28
	.word 0xbd51c000  ! 374: RDPR_TL	<illegal instruction>
	.word 0xb5a5c860  ! 375: FADDq	dis not found

	.word 0x8d95e076  ! 378: WRPR_PSTATE_I	wrpr	%r23, 0x0076, %pstate
	setx	0xc48e00e600004f1f, %g1, %r10
	.word 0x819a8000  ! 379: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x879561e4  ! 380: WRPR_TT_I	wrpr	%r21, 0x01e4, %tt
	.word 0xbf480000  ! 382: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbda589c0  ! 383: FDIVd	fdivd	%f22, %f0, %f30
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d95a0e4  ! 389: WRPR_PSTATE_I	wrpr	%r22, 0x00e4, %pstate
	.word 0xb1a80c20  ! 390: FMOVRLZ	dis not found

	.word 0x8d94a0ca  ! 394: WRPR_PSTATE_I	wrpr	%r18, 0x00ca, %pstate
	.word 0xb3ab4820  ! 395: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0x9195e043  ! 396: WRPR_PIL_I	wrpr	%r23, 0x0043, %pil
	.word 0xb9a54820  ! 398: FADDs	fadds	%f21, %f0, %f28
	.word 0x8d94e1d6  ! 403: WRPR_PSTATE_I	wrpr	%r19, 0x01d6, %pstate
	.word 0xb3508000  ! 405: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a00520  ! 406: FSQRTs	fsqrt	
	.word 0xbda81c20  ! 407: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfaa4820  ! 413: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0x8995a058  ! 415: WRPR_TICK_I	wrpr	%r22, 0x0058, %tick
	.word 0xb9a81420  ! 418: FMOVRNZ	dis not found

	setx	data_start_0, %g1, %r16
	.word 0xb7a00560  ! 425: FSQRTq	fsqrt	
	.word 0x8d95204c  ! 426: WRPR_PSTATE_I	wrpr	%r20, 0x004c, %pstate
	.word 0xb434a168  ! 428: SUBC_I	orn 	%r18, 0x0168, %r26
	setx	data_start_0, %g1, %r23
	.word 0xb5a40840  ! 431: FADDd	faddd	%f16, %f0, %f26
	setx	data_start_5, %g1, %r17
	.word 0xbfa408e0  ! 436: FSUBq	dis not found

	.word 0xbba90820  ! 437: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbba00040  ! 440: FMOVd	fmovd	%f0, %f60
	.word 0xb3508000  ! 441: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a00040  ! 442: FMOVd	fmovd	%f0, %f58
	.word 0xbfa448a0  ! 443: FSUBs	fsubs	%f17, %f0, %f31
	.word 0xbbaa4820  ! 445: FMOVNE	fmovs	%fcc1, %f0, %f29
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80c20  ! 451: FMOVRLZ	dis not found

	.word 0xb7a94820  ! 453: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a48840  ! 457: FADDd	faddd	%f18, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa81c20  ! 459: FMOVRGEZ	dis not found

	mov	2, %r12
	.word 0xa1930000  ! 460: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab4820  ! 463: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb3a58940  ! 466: FMULd	fmuld	%f22, %f0, %f56
	.word 0xb6b5a053  ! 467: SUBCcc_I	orncc 	%r22, 0x0053, %r27
	.word 0xbda5c860  ! 468: FADDq	dis not found

	.word 0xb3a5c820  ! 469: FADDs	fadds	%f23, %f0, %f25
	.word 0xbb508000  ! 471: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a00560  ! 475: FSQRTq	fsqrt	
	.word 0x8d94603f  ! 478: WRPR_PSTATE_I	wrpr	%r17, 0x003f, %pstate
	.word 0xba45a0ca  ! 481: ADDC_I	addc 	%r22, 0x00ca, %r29
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 488: FMOVRNZ	dis not found

	.word 0xbda48840  ! 489: FADDd	faddd	%f18, %f0, %f30
	.word 0xbfa80c20  ! 492: FMOVRLZ	dis not found

	.word 0xb33d2001  ! 496: SRA_I	sra 	%r20, 0x0001, %r25
	.word 0xb5a549e0  ! 498: FDIVq	dis not found

	mov	0x138, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 501: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbfa489e0  ! 502: FDIVq	dis not found

	.word 0xb9a00540  ! 505: FSQRTd	fsqrt	
	.word 0xb1518000  ! 507: RDPR_PSTATE	<illegal instruction>
	setx	0x2c17401500009f50, %g1, %r10
	.word 0x839a8000  ! 512: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	1, %r12
	.word 0x8f930000  ! 519: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8595611b  ! 520: WRPR_TSTATE_I	wrpr	%r21, 0x011b, %tstate
	setx	0x99b2498800009f1e, %g1, %r10
	.word 0x839a8000  ! 521: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3a4c9a0  ! 522: FDIVs	fdivs	%f19, %f0, %f25
	.word 0x91956123  ! 526: WRPR_PIL_I	wrpr	%r21, 0x0123, %pil
	.word 0xbf508000  ! 529: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xbb2c3001  ! 531: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xb5a88820  ! 532: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb934f001  ! 533: SRLX_I	srlx	%r19, 0x0001, %r28
	.word 0xbfa54920  ! 548: FMULs	fmuls	%f21, %f0, %f31
	.word 0xb9a408c0  ! 550: FSUBd	fsubd	%f16, %f0, %f28
	.word 0x8794e09f  ! 551: WRPR_TT_I	wrpr	%r19, 0x009f, %tt
	.word 0xbda5c9e0  ! 557: FDIVq	dis not found

	.word 0xb1a50920  ! 559: FMULs	fmuls	%f20, %f0, %f24
	.word 0xbba50840  ! 561: FADDd	faddd	%f20, %f0, %f60
	.word 0xb7a00540  ! 567: FSQRTd	fsqrt	
	.word 0xba1da0dd  ! 570: XOR_I	xor 	%r22, 0x00dd, %r29
	mov	1, %r12
	.word 0x8f930000  ! 571: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbba4c9e0  ! 573: FDIVq	dis not found

	.word 0x81942018  ! 575: WRPR_TPC_I	wrpr	%r16, 0x0018, %tpc
	setx	0xba1a817b000038c6, %g1, %r10
	.word 0x819a8000  ! 578: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x311, %o0
	ta	T_SEND_THRD_INTR
	.word 0x85942027  ! 580: WRPR_TSTATE_I	wrpr	%r16, 0x0027, %tstate
	.word 0xbd3d3001  ! 583: SRAX_I	srax	%r20, 0x0001, %r30
	mov	0x209, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 587: FMOVPOS	fmovs	%fcc1, %f0, %f29
	setx	data_start_5, %g1, %r22
	mov	0x21b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a54860  ! 598: FADDq	dis not found

	.word 0xb7a8c820  ! 599: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb7ab0820  ! 601: FMOVGU	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8795e007  ! 603: WRPR_TT_I	wrpr	%r23, 0x0007, %tt
	.word 0xb7a5c9e0  ! 607: FDIVq	dis not found

	.word 0xba85e1fd  ! 609: ADDcc_I	addcc 	%r23, 0x01fd, %r29
	.word 0xbb2d9000  ! 610: SLLX_R	sllx	%r22, %r0, %r29
	.word 0xb3ab8820  ! 613: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb33c8000  ! 615: SRA_R	sra 	%r18, %r0, %r25
	setx	data_start_2, %g1, %r21
	.word 0xba0c4000  ! 619: AND_R	and 	%r17, %r0, %r29
	.word 0xbfaa0820  ! 626: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbfa81820  ! 627: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb9a00560  ! 628: FSQRTq	fsqrt	
	.word 0xb7504000  ! 629: RDPR_TNPC	<illegal instruction>
	.word 0xbba449c0  ! 630: FDIVd	fdivd	%f48, %f0, %f60
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a489a0  ! 637: FDIVs	fdivs	%f18, %f0, %f28
	.word 0xb3a00020  ! 639: FMOVs	fmovs	%f0, %f25
	.word 0xbfa58920  ! 640: FMULs	fmuls	%f22, %f0, %f31
	.word 0xb17c6401  ! 644: MOVR_I	movre	%r17, 0x1, %r24
	.word 0xbb504000  ! 646: RDPR_TNPC	<illegal instruction>
	.word 0x8194a095  ! 647: WRPR_TPC_I	wrpr	%r18, 0x0095, %tpc
	.word 0xb3a40940  ! 649: FMULd	fmuld	%f16, %f0, %f56
	.word 0x8994a059  ! 650: WRPR_TICK_I	wrpr	%r18, 0x0059, %tick
	.word 0xb9ab0820  ! 652: FMOVGU	fmovs	%fcc1, %f0, %f28
	setx	data_start_4, %g1, %r23
	.word 0xb3a44940  ! 655: FMULd	fmuld	%f48, %f0, %f56
	.word 0xbfa00540  ! 656: FSQRTd	fsqrt	
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c54000  ! 661: ADDCcc_R	addccc 	%r21, %r0, %r27
	.word 0xb7a00520  ! 662: FSQRTs	fsqrt	
	.word 0xb3a8c820  ! 666: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbba90820  ! 668: FMOVLEU	fmovs	%fcc1, %f0, %f29
	setx	data_start_7, %g1, %r17
	.word 0xb5a548c0  ! 671: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xbfa8c820  ! 678: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb3a80820  ! 687: FMOVN	fmovs	%fcc1, %f0, %f25
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87946170  ! 696: WRPR_TT_I	wrpr	%r17, 0x0170, %tt
	.word 0xb5aa0820  ! 698: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb7a98820  ! 699: FMOVNEG	fmovs	%fcc1, %f0, %f27
	mov	0x7, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63d0000  ! 707: XNOR_R	xnor 	%r20, %r0, %r27
	.word 0xbda80420  ! 709: FMOVRZ	dis not found

	mov	0x236, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 712: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbfaac820  ! 717: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0x8d94e04b  ! 718: WRPR_PSTATE_I	wrpr	%r19, 0x004b, %pstate
	.word 0x8794a090  ! 720: WRPR_TT_I	wrpr	%r18, 0x0090, %tt
	.word 0xb5a509c0  ! 721: FDIVd	fdivd	%f20, %f0, %f26
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a449e0  ! 724: FDIVq	dis not found

	.word 0xbfaa0820  ! 726: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb7a4c9c0  ! 728: FDIVd	fdivd	%f50, %f0, %f58
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 732: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x85952140  ! 734: WRPR_TSTATE_I	wrpr	%r20, 0x0140, %tstate
	.word 0xbe25c000  ! 735: SUB_R	sub 	%r23, %r0, %r31
	mov	0x225, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a84820  ! 738: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a00520  ! 739: FSQRTs	fsqrt	
	mov	0x13e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa8820  ! 743: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb3a00020  ! 745: FMOVs	fmovs	%f0, %f25
	.word 0xb5a588e0  ! 746: FSUBq	dis not found

	.word 0x8795a097  ! 749: WRPR_TT_I	wrpr	%r22, 0x0097, %tt
	.word 0xbda5c9c0  ! 750: FDIVd	fdivd	%f54, %f0, %f30
	.word 0xb5a84820  ! 754: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb1a80820  ! 755: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb3508000  ! 756: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a00560  ! 760: FSQRTq	fsqrt	
	.word 0x819461e0  ! 762: WRPR_TPC_I	wrpr	%r17, 0x01e0, %tpc
	mov	0x102, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794e1fe  ! 764: WRPR_TT_I	wrpr	%r19, 0x01fe, %tt
	.word 0xbfa5c820  ! 765: FADDs	fadds	%f23, %f0, %f31
	.word 0xb3a508c0  ! 768: FSUBd	fsubd	%f20, %f0, %f56
	mov	0x39, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48960  ! 770: FMULq	dis not found

	.word 0xb9a489a0  ! 771: FDIVs	fdivs	%f18, %f0, %f28
	.word 0x879520d4  ! 773: WRPR_TT_I	wrpr	%r20, 0x00d4, %tt
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab0820  ! 776: FMOVGU	fmovs	%fcc1, %f0, %f29
	setx	data_start_2, %g1, %r20
	.word 0xb1a549e0  ! 783: FDIVq	dis not found

	.word 0xb5a00020  ! 785: FMOVs	fmovs	%f0, %f26
	.word 0xb6b48000  ! 787: SUBCcc_R	orncc 	%r18, %r0, %r27
	.word 0xbfaa4820  ! 793: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a80420  ! 794: FMOVRZ	dis not found

	.word 0xbda00560  ! 796: FSQRTq	fsqrt	
	.word 0xb1a81820  ! 798: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb3aa0820  ! 799: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbba58840  ! 802: FADDd	faddd	%f22, %f0, %f60
	.word 0xb9500000  ! 805: RDPR_TPC	<illegal instruction>
	.word 0xbbaa8820  ! 808: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbfa00520  ! 811: FSQRTs	fsqrt	
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 821: RDPR_TPC	<illegal instruction>
	.word 0xb7abc820  ! 822: FMOVVC	fmovs	%fcc1, %f0, %f27
	mov	0x109, %o0
	ta	T_SEND_THRD_INTR
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x237, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794616f  ! 842: WRPR_TT_I	wrpr	%r17, 0x016f, %tt
	.word 0xb7510000  ! 843: RDPR_TICK	<illegal instruction>
	.word 0xb7540000  ! 845: RDPR_GL	<illegal instruction>
	.word 0xb5a80820  ! 847: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbe358000  ! 848: ORN_R	orn 	%r22, %r0, %r31
	.word 0xbb518000  ! 849: RDPR_PSTATE	<illegal instruction>
	.word 0xb7ab0820  ! 851: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbbabc820  ! 855: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb82ce055  ! 860: ANDN_I	andn 	%r19, 0x0055, %r28
	.word 0xb1500000  ! 861: RDPR_TPC	<illegal instruction>
	.word 0xb6244000  ! 863: SUB_R	sub 	%r17, %r0, %r27
	.word 0x8394a02c  ! 864: WRPR_TNPC_I	wrpr	%r18, 0x002c, %tnpc
	mov	0x223, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68ce193  ! 867: ANDcc_I	andcc 	%r19, 0x0193, %r27
	setx	0x9567ec5600000c57, %g1, %r10
	.word 0x839a8000  ! 871: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a98820  ! 872: FMOVNEG	fmovs	%fcc1, %f0, %f27
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 879: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbba94820  ! 882: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb5a00040  ! 885: FMOVd	fmovd	%f0, %f26
	.word 0xb7aa8820  ! 886: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb3ab4820  ! 889: FMOVCC	fmovs	%fcc1, %f0, %f25
	mov	0xb, %o0
	ta	T_SEND_THRD_INTR
	mov	0x2b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 894: FMOVRGEZ	dis not found

	.word 0x899420dc  ! 895: WRPR_TICK_I	wrpr	%r16, 0x00dc, %tick
	.word 0xb3a40920  ! 897: FMULs	fmuls	%f16, %f0, %f25
	.word 0xbda40840  ! 898: FADDd	faddd	%f16, %f0, %f30
	.word 0xb1500000  ! 900: RDPR_TPC	<illegal instruction>
	.word 0xb3a80c20  ! 901: FMOVRLZ	dis not found

	.word 0xb1500000  ! 902: RDPR_TPC	<illegal instruction>
	.word 0xbeb40000  ! 903: SUBCcc_R	orncc 	%r16, %r0, %r31
	.word 0xb9a00560  ! 905: FSQRTq	fsqrt	
	.word 0xb5508000  ! 906: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a00560  ! 910: FSQRTq	fsqrt	
	.word 0xbba549c0  ! 911: FDIVd	fdivd	%f52, %f0, %f60
	.word 0xb5a44940  ! 913: FMULd	fmuld	%f48, %f0, %f26
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 915: RDPR_PSTATE	<illegal instruction>
	.word 0xbda489c0  ! 916: FDIVd	fdivd	%f18, %f0, %f30
	.word 0x919520bf  ! 917: WRPR_PIL_I	wrpr	%r20, 0x00bf, %pil
	.word 0xb7520000  ! 918: RDPR_PIL	<illegal instruction>
	.word 0xb751c000  ! 919: RDPR_TL	<illegal instruction>
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 924: RDPR_TL	<illegal instruction>
	mov	0x32, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 933: FSQRTs	fsqrt	
	mov	2, %r12
	.word 0x8f930000  ! 934: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5520000  ! 936: RDPR_PIL	<illegal instruction>
	.word 0xb8ade165  ! 939: ANDNcc_I	andncc 	%r23, 0x0165, %r28
	.word 0xb7a58920  ! 943: FMULs	fmuls	%f22, %f0, %f27
	.word 0xbc3dc000  ! 947: XNOR_R	xnor 	%r23, %r0, %r30
	.word 0xbfaac820  ! 949: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbfaa4820  ! 950: FMOVNE	fmovs	%fcc1, %f0, %f31
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	.word 0xb5a00040  ! 959: FMOVd	fmovd	%f0, %f26
	mov	0x106, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48960  ! 963: FMULq	dis not found

	setx	0x3545dae100006901, %g1, %r10
	.word 0x819a8000  ! 964: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x89952099  ! 966: WRPR_TICK_I	wrpr	%r20, 0x0099, %tick
	.word 0xb5a80420  ! 975: FMOVRZ	dis not found

	.word 0xb3a448c0  ! 978: FSUBd	fsubd	%f48, %f0, %f56
	.word 0xbda00040  ! 981: FMOVd	fmovd	%f0, %f30
	.word 0xb9540000  ! 982: RDPR_GL	<illegal instruction>
	.word 0xbba81420  ! 986: FMOVRNZ	dis not found

	.word 0xb7a80420  ! 990: FMOVRZ	dis not found

	.word 0xbc0dc000  ! 991: AND_R	and 	%r23, %r0, %r30
	.word 0x859421ec  ! 993: WRPR_TSTATE_I	wrpr	%r16, 0x01ec, %tstate
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
fsr_data:

	.xword	0x0000000000000000
	.align 0x1000
	.data
data_start_0:

	.xword	0xba3f9dbd70e2152d
	.xword	0x7f21dabf5e6bc5d4
	.xword	0xa53d24fe488e9c80
	.xword	0x5c2029f47a382d3f
	.xword	0x49266733ce51e1dc
	.xword	0xb0f2b3b5315b010f
	.xword	0x0dc77e8d4373ba10
	.xword	0xb2d3efee84802df3
	.xword	0xd1af55cc50a06f45
	.xword	0xbab84401a760820d
	.xword	0x12ee12d63ebd93a2
	.xword	0x951e44ca628f35bb
	.xword	0x2a8d8d7c5bf2bdaf
	.xword	0x930b68c04b14d0c9
	.xword	0xd3d3d6fbf5af29d3
	.xword	0x2bf9b170752bce27
	.xword	0x7cea4a62fcb2fb42
	.xword	0x7480d5c47b6c818a
	.xword	0x0dad431612b8eec8
	.xword	0x7aeef6c5a0e65039
	.xword	0x5d8caa83a482cbec
	.xword	0x0d61bf59eef6c3fa
	.xword	0xef0f65c34ec5f053
	.xword	0xfd5bb289fbc453d8
	.xword	0x915e0a92bee8b523
	.xword	0x78bcb06ce049ea7a
	.xword	0xdfc461b7ed02f4cb
	.xword	0xab9dd922ea13ee8e
	.xword	0x0a3203ab4dba3245
	.xword	0x6a6a07635a5615e7
	.xword	0x794526e5001772e2
	.xword	0x5b6c73f9a73e3d51
	.xword	0x3faa766ed1b93b04
	.xword	0x08257323f6eada31
	.xword	0x53b3683c7ff2952d
	.xword	0x0273b716fd645750
	.xword	0x8ada49157ee81d37
	.xword	0xf47e04b74139ad1b
	.xword	0xff45fa124c9d9508
	.xword	0x15729e81c743194c
	.xword	0x21aaa9d78294e245
	.xword	0xd83ae8882c4b01eb
	.xword	0xa24e0120f3c02820
	.xword	0x256b2bb74b883652
	.xword	0x8f0404a866988674
	.xword	0x4902736a5a976a3e
	.xword	0x7effbb82575d3d74
	.xword	0x4c9d9f34860e5f65
	.xword	0x5fc57d1cc2e21717
	.xword	0x1b3422d3b51df1c2
	.xword	0x0ef8d68db50b2b02
	.xword	0x14a6e95995aa0353
	.xword	0x8f6b5ccf9719d8cc
	.xword	0xdf2b98796e3c0e02
	.xword	0xbf73378c442b7c46
	.xword	0x1ed8bd44078e6744
	.xword	0x949b5c3d4997f45c
	.xword	0x3b434260910a9796
	.xword	0x2b87915f2f3b4ea9
	.xword	0x3efbc1e192df85e7
	.xword	0x9c55b38764570df3
	.xword	0x408acc829d2886cc
	.xword	0xda023bfe3a513ca9
	.xword	0xc0f15fd791c10b16
	.xword	0x58151edf64405fa8
	.xword	0x2c3d09be70d067a6
	.xword	0xb795890c426eba55
	.xword	0x9e5335736b5ba172
	.xword	0x49d5fba7e0a5ef86
	.xword	0x4abc8ace7983beef
	.xword	0x780f04837d00b43f
	.xword	0x2c821c51ef0705a1
	.xword	0x370fbde9e0818661
	.xword	0xbcdc8e8859099f61
	.xword	0xa6ddd13001e0d6d9
	.xword	0x27cd3ba373197a3c
	.xword	0x2d0fae995a8022fc
	.xword	0xc6c9a0a437619f5e
	.xword	0x37854294e5e77433
	.xword	0x6a770dab7e4b0c1a
	.xword	0xa990e4a705c2f62f
	.xword	0x8675d8f929f2f9dd
	.xword	0xcf837151784d6e12
	.xword	0x7650737c7420e3bf
	.xword	0xf84f4367c5935811
	.xword	0xa5d0e07415045216
	.xword	0x8f5df10ac2506f1d
	.xword	0x4c77e502de922626
	.xword	0x0dd4371903208b64
	.xword	0x3c120330b4f0f48c
	.xword	0x75a16a3c078bfbaf
	.xword	0xdbd745d71472ca29
	.xword	0x8f39f1445941ee2b
	.xword	0x25d0a71edd8d03b9
	.xword	0x21e2aa1db5c7bc9c
	.xword	0x0f596fdc2d70407d
	.xword	0x7c3bcdfa9dff8fd5
	.xword	0xbe9ccb0d07cb8ec9
	.xword	0xc6d2de5483213b91
	.xword	0x6038f915f629d802
	.xword	0x53075a131cb31132
	.xword	0x951f2e1d22c91aba
	.xword	0x5fd720d90ca73597
	.xword	0x442708627d6e958b
	.xword	0x10786a3d7d3ed290
	.xword	0xcb35624beca87d82
	.xword	0x99f492c778f3e850
	.xword	0xc5a031811d0670bf
	.xword	0x74e5a723e5047460
	.xword	0xc93476dd38cdd047
	.xword	0x17db5f286fac2039
	.xword	0xb380727ef3a343fd
	.xword	0x49f1e7b0a16d3f3e
	.xword	0xbcadac04d52fdf1f
	.xword	0xcd5ac22ea5f1d656
	.xword	0xc002926cef86cf73
	.xword	0x74d4b772e966ed7c
	.xword	0x37f09a514f2c67e2
	.xword	0x999829ad6d316cdd
	.xword	0xc4a95f7026402fe6
	.xword	0xc0741c2d931d839f
	.xword	0xaf936bbc79e0afd5
	.xword	0xfcaf7727f3af8a27
	.xword	0x0b769db87efd275b
	.xword	0xdef33a916ab636ad
	.xword	0x09444ce57667f125
	.xword	0x4aca3f80c1763dc7
	.xword	0x1afab6e39c7dad1b
	.xword	0x5324a2391c42c99c
	.xword	0x0bfb18b1260617b2
	.xword	0xde2f3bf184b42f81
	.xword	0x8719a2b42a0d54e9
	.xword	0xa1d873ad18851f46
	.xword	0x0cdef02e997dfbf6
	.xword	0x481c84ea8bf0afcc
	.xword	0x5d53a468c4a9e1a7
	.xword	0x804c48719766b021
	.xword	0xf911361ecd5bf7c8
	.xword	0xb068c79652a502ff
	.xword	0x0ccbb6bef6f50919
	.xword	0x63b86769d52d7344
	.xword	0x77a45f3403a514d2
	.xword	0x7f31e3a8124dc99a
	.xword	0x31cb63d7e6e558ce
	.xword	0x33527ed2e61ae41f
	.xword	0x7e86f2a123c7cdeb
	.xword	0xbb3cd51e114254c3
	.xword	0xbbca79d94a7bed00
	.xword	0x24ed82a9700b07fa
	.xword	0x9bdb02191c145673
	.xword	0xd556457257a49ab9
	.xword	0xe826f9a5d9019f3d
	.xword	0xce1d658392e6ac5a
	.xword	0x4ea5978deeae4167
	.xword	0xd564dbff6dbf058b
	.xword	0x98242d1c6aa73c3a
	.xword	0xeafcf5ceed171c83
	.xword	0xa740bbc3ab0231b6
	.xword	0x93fed37aa49930e2
	.xword	0x8a2a810a00162710
	.xword	0xe49a8c70399dd73b
	.xword	0x4d91a1f962275e3a
	.xword	0xd9de91b528c282e2
	.xword	0xc9b253a48120b510
	.xword	0x18d992eb00fb8aba
	.xword	0x09954eefd9267bf5
	.xword	0x5da4118bbcca1247
	.xword	0x61a35cd33365dad2
	.xword	0x6ba2ae70a5496547
	.xword	0xdf70e9ce56b59594
	.xword	0xef94667215fbb288
	.xword	0xba1659fe3856670a
	.xword	0xe08067286522ba14
	.xword	0x62aee34a14336a20
	.xword	0x11aff6a2b31f2d88
	.xword	0x99c3eaf59691d561
	.xword	0xd0c9a22a64c17e6a
	.xword	0x556aecb888d4b89e
	.xword	0xafc880fd1b3be6e1
	.xword	0x8da169b50f770284
	.xword	0xaef227f2ee941309
	.xword	0x011838cb7fe49e9e
	.xword	0xc14c8ad9350ad2e4
	.xword	0x877a9a37d54d4ae4
	.xword	0x549fdd4bb38a6633
	.xword	0x2a204f6e8141be76
	.xword	0xb4b0acc485a83653
	.xword	0xa19626d7a7d6aeea
	.xword	0x29c6fcba3dcab1b2
	.xword	0xeccfa119b405d708
	.xword	0x9a8b223e85bb1dc0
	.xword	0x101b2e6be4cb0b9e
	.xword	0x0a6e3c41c33d5a0c
	.xword	0x3c82b6bb7c259d09
	.xword	0x85a94abf94a7dfb8
	.xword	0x0929c46289c061f1
	.xword	0x90f2845cec7addbb
	.xword	0x788f3f833e4fd0e4
	.xword	0x992c902651b0cde6
	.xword	0x23132222cf52ce18
	.xword	0xaaab5da8d026fce9
	.xword	0xd019f8467d7e832b
	.xword	0x0e6d456e711b1537
	.xword	0xd2d8302b2c32a246
	.xword	0xda0a19b3b5f2b76a
	.xword	0x3d456a95c307704e
	.xword	0xd289772a4435d018
	.xword	0xf1d89f0f68b1cf26
	.xword	0x02b5cb8839a0115b
	.xword	0x7ceba5c75a595426
	.xword	0xdc8fc6842e38a0f0
	.xword	0xb5d09c0f42c81e1e
	.xword	0xb114caa59cd6d3b4
	.xword	0x5bec4d4827e7535a
	.xword	0x92f3ffeb5625f111
	.xword	0x517db4805d7b8107
	.xword	0x9d06921c36984328
	.xword	0x9c9e8f3c181ac96f
	.xword	0x3e5cfbdb3d9c88da
	.xword	0xa160b4f18937b851
	.xword	0x62e57b641659b945
	.xword	0xf7fe44450c781322
	.xword	0xbf5001da36c055c2
	.xword	0x4e79bea3e994c375
	.xword	0xf5d7af68fe5aad53
	.xword	0x4962f913936ddbce
	.xword	0x5f22bdfc27945127
	.xword	0xd9b0afe62fcba89d
	.xword	0xb5f3edbf06ea157d
	.xword	0xe9d98f2c64ac52a5
	.xword	0xefe85280f21167f7
	.xword	0xbf90f13bd5b1cfb8
	.xword	0x5262ff1ee17d6636
	.xword	0xb923cedce4733665
	.xword	0xa0d699ca0cf5360a
	.xword	0xe3c3f0abd9fb1aad
	.xword	0xf7c23b4f621ec3e0
	.xword	0x7f526e39dffb5903
	.xword	0xdedc1fe3f2b8a84c
	.xword	0xaf1931ec68a6308a
	.xword	0x30039ea0c07ec1d3
	.xword	0xdf8be5d5c90780b7
	.xword	0x5b9a90bd788aa689
	.xword	0xe8433ed829ec9cee
	.xword	0xd5ea95f9d53e68ac
	.xword	0x29ac4fd2c535c28d
	.xword	0xa678984d87017e5c
	.xword	0x7f93469d386a6cb3
	.xword	0x434863bc7cdb0115
	.xword	0xabef1ecb3ae2d2f8
	.xword	0xa6769daf1fa66cf3
	.xword	0x7a73be42bfcda42e
	.xword	0xb7faf00abaa33b67
	.xword	0x77a57a67f624c686
	.xword	0x644b1ca69c37abf1
	.xword	0xd434a75c019db4de
	.align 0x2000
	.data
data_start_1:

	.xword	0x550972461a88e345
	.xword	0x240b1610d1bc889e
	.xword	0x537a57c958818aed
	.xword	0xe33914cffd10ea4b
	.xword	0x8d85a186fe744ec3
	.xword	0x8c4c6dcf38da5178
	.xword	0xf0eea4f7952a5197
	.xword	0x14d33a553ec23f01
	.xword	0x857101d9fceea473
	.xword	0x203fc54bbf3638b5
	.xword	0x5c3f4fbb5f472379
	.xword	0x2f9136f62f91769b
	.xword	0x23c865b51dc1d844
	.xword	0x5ad8d9ce5b3d9636
	.xword	0x91240e50de70a51e
	.xword	0x135908a10b721c74
	.xword	0x6cbcab84f520fa1b
	.xword	0x4a22c1c2122ef679
	.xword	0xf6597f9ca8164c1a
	.xword	0x66da5aaaa3954e07
	.xword	0xe036f6d13494ad9a
	.xword	0xdbe8eb4a9ac27945
	.xword	0xb08fcbcc5bd9b8b5
	.xword	0x1ab176a232036968
	.xword	0xa4c97117cbae1ead
	.xword	0x317e2b82efa0ff1d
	.xword	0x0c8d99a02e7af336
	.xword	0xc323e598a8673033
	.xword	0xe962604ddec8ddab
	.xword	0x981a85f7b1034630
	.xword	0xf704c8a17a8dfe71
	.xword	0xf8ea4ce59bdf1529
	.xword	0xcc2b383faaa4d501
	.xword	0x2a1ff55bed8754a4
	.xword	0x3ce5a887a8cb1099
	.xword	0x98d72930cbe414e6
	.xword	0x78e11f51cdbfd2ae
	.xword	0xd0120751e6cecf19
	.xword	0xc13591447b2589c4
	.xword	0xfe9df21bdac127ad
	.xword	0xf02c1df363845c08
	.xword	0x5b003b14ffa08a66
	.xword	0xca7b76397f93a6ff
	.xword	0x1f9e2c5abb7c1546
	.xword	0x60e94153f6ea726c
	.xword	0x1d8aa00bf4fc914a
	.xword	0x3fcc81d86bf8f79b
	.xword	0xc40d8dc16601f5f2
	.xword	0x7cd7099d7e0a9b63
	.xword	0xa6def90940016a43
	.xword	0x5a93bb618671eeab
	.xword	0xe488cf96cb6bb7be
	.xword	0x52aab898c1384362
	.xword	0x0f1e855b53caebe0
	.xword	0x89d1dc1dac62c688
	.xword	0xf3cdc77e39b43f82
	.xword	0x3d89b3dbdd3aaa97
	.xword	0x6d0af445747eb834
	.xword	0xff105c73d3770360
	.xword	0x99de2a06c9d1856a
	.xword	0x26cdf10e8cd8be59
	.xword	0x6b157c38c96e4f16
	.xword	0x7ee01335e4d5f904
	.xword	0x157631fc7dc22e5b
	.xword	0x7619d4def8114438
	.xword	0xe48c86721aa4cc21
	.xword	0xc79145607dafff35
	.xword	0xe3a994c06528b88d
	.xword	0x1cc4f3af31c8f08d
	.xword	0xabf8a195513333ed
	.xword	0x93955d0272c6bc5e
	.xword	0xf100cb190d71c885
	.xword	0x3259f4ad8157c32a
	.xword	0x0a02a13ef47d2333
	.xword	0x7c851f758ceb9eb0
	.xword	0x0ec9aeb1580dab5e
	.xword	0x91e7115c64a0ad35
	.xword	0xabf29eef1513053c
	.xword	0x2ae47acab61c741c
	.xword	0xbf0230f04d9c1e94
	.xword	0xa5e52316edb78d3d
	.xword	0x0c6839c5902cb589
	.xword	0xfc6a2a8b531d8ec9
	.xword	0x23fff454f480d5fa
	.xword	0x9c9e75a52ed2c5f7
	.xword	0x32a5b879d1c02daf
	.xword	0xee175a55cf15d102
	.xword	0xfc9f2631e229d516
	.xword	0xfc2f657520fa72b7
	.xword	0x294471b518a7362e
	.xword	0x6a99a8c7bbb4d84b
	.xword	0x84a76ba8ebda479c
	.xword	0x85de906f8ed88863
	.xword	0x4a50bac7bd660c19
	.xword	0x392eeb39a60e6e19
	.xword	0xe5ecefdacfa6158a
	.xword	0x5f8f700e30899636
	.xword	0x69fa2d741dd4ed18
	.xword	0x5c7fdd0c1e91a1d5
	.xword	0x4b8540e415a50c0b
	.xword	0xbd2a47eafd116fc7
	.xword	0x4ed548a2d751344f
	.xword	0xa3ddc16715cdb604
	.xword	0x1aa435bbdf5f85eb
	.xword	0x6ae3f87d0e29f0e0
	.xword	0xbd66e72feaa20358
	.xword	0xa5d41af5f71cbe23
	.xword	0xdd21cfceffffe4d7
	.xword	0xc9f424672ee93f7b
	.xword	0x9a289354fdc8c6fd
	.xword	0x809daa4b06438448
	.xword	0x3dc8bea1f44f9df9
	.xword	0xe5540238c2e547a4
	.xword	0xf30061729753028f
	.xword	0x143845278a1b14a3
	.xword	0x8da03de2fb231bd5
	.xword	0x144ae9c2b584d298
	.xword	0x6570f58f85ed2449
	.xword	0xb3174a0848af2595
	.xword	0xb180aa827c426493
	.xword	0xb4bbf2eaa3be95c8
	.xword	0x85a9ccbb2e7bf280
	.xword	0x64f2e86de13d246b
	.xword	0xa0699381848b0b8e
	.xword	0xb0b3b1d9d70484f5
	.xword	0x91245b4533b89f6f
	.xword	0x17d905999db0c9a3
	.xword	0xa1f1a6c3ba5322f0
	.xword	0xc800048994b3dd1e
	.xword	0xdcb31e35efd29476
	.xword	0x965c04fce8d030f6
	.xword	0x51a725d41991a189
	.xword	0x38f211a10befb44b
	.xword	0xf388ae2ca6117ec8
	.xword	0x84db77f3bcaeb29d
	.xword	0x250f4533c166f30c
	.xword	0x8f51909cd5d9a7a5
	.xword	0x9fc60f1a0719224e
	.xword	0x9b966e6eaa0f0950
	.xword	0x9ea0d0a4dcfcfc1f
	.xword	0xc745d76c733b69e7
	.xword	0xd446bd640dd5c447
	.xword	0xf0c3ec42266a49fa
	.xword	0xd92208a3c6909fcd
	.xword	0xfc48ef98de4155b6
	.xword	0x581f046c6faadb89
	.xword	0x8386d1b85cc264a1
	.xword	0x10423d4f2fcb83eb
	.xword	0x6aeeaabf5f3b82d8
	.xword	0xab450a3ce103d126
	.xword	0x1d1203481649d598
	.xword	0x8fc94719042a7a8a
	.xword	0x5366121bc790d8d5
	.xword	0x667a40a0467a5126
	.xword	0xc85046662109d318
	.xword	0xfae8552d5561cf7d
	.xword	0x149525ecc6db9fff
	.xword	0xddc34a8cc075faa7
	.xword	0xb0c7e045a0d9c981
	.xword	0x30cb00660bb0c580
	.xword	0xfcda1f6b71508dc8
	.xword	0x60367eda1c458ef6
	.xword	0xb606edc53483c5ac
	.xword	0x50d76559f4625a1a
	.xword	0x68cdde6dc4f61340
	.xword	0x8d9afc2dcbeb6fe1
	.xword	0x9c94d6f9780ae595
	.xword	0xb809329377ab39ad
	.xword	0x3c6c37db3e12103b
	.xword	0x2327d627b1b88aab
	.xword	0xe8acaaa19eb7fdca
	.xword	0xdeed9d1fa21acc30
	.xword	0xeafe8c1712b594b8
	.xword	0xd0bf88deb75ecbe7
	.xword	0x7f713431d7bb0854
	.xword	0x39123b0a06ca9d96
	.xword	0x0a537f44c8363bab
	.xword	0x08bfa98ec08feb4c
	.xword	0x064d4a59cc849a0b
	.xword	0x089b9d1719286366
	.xword	0x04bad38a627bc737
	.xword	0xa30245c5b929c3dc
	.xword	0x3d00a49248b1f8df
	.xword	0xa7c14574c1698910
	.xword	0xfd87bb14602314d2
	.xword	0x37d4fce8678b2858
	.xword	0xe7cad4112b58cac5
	.xword	0x93a72207bb32f08e
	.xword	0x64499e3f8a1f624a
	.xword	0xaae76b4f0b0091b8
	.xword	0x8bdab1e1cde00a7e
	.xword	0x376ba0ae0e917894
	.xword	0x934436fef4288e62
	.xword	0xa19c354545330c05
	.xword	0x305e554d8458f10f
	.xword	0x40f484a3bd54273c
	.xword	0xc38a30ffe0341e31
	.xword	0x6d5cdf4de4edc46b
	.xword	0x3d498d19ef1aedc8
	.xword	0x2043033e228e3f41
	.xword	0x3d94f76794e4155f
	.xword	0x6a67dfc16342a52f
	.xword	0x543063d5aa29a632
	.xword	0xd09ff39a38400783
	.xword	0x854e7b77f0451695
	.xword	0x41628e181b487981
	.xword	0x66e5b40f58c05512
	.xword	0xc3042c0810b11a86
	.xword	0x08480143a76cdfb2
	.xword	0xa435a504bb0093f2
	.xword	0x48ea861c19c056b5
	.xword	0x649f9b4f4607f767
	.xword	0x2719cc878d186f57
	.xword	0x840ff235ccde62a7
	.xword	0x43dcd1427a08d69f
	.xword	0xe466004c1193c108
	.xword	0xc91db017ce82fd59
	.xword	0xe48036eb2dd9007e
	.xword	0xe5550524244d2213
	.xword	0x77ea94cba99b225c
	.xword	0xacd53081cbd2f24a
	.xword	0x37dd08ab0c5b583f
	.xword	0x43785cd38bb787fd
	.xword	0x908ba3585ee403b2
	.xword	0x9ca153110d401d9c
	.xword	0x0767687bb487cebd
	.xword	0x2201452aba429af5
	.xword	0xe58c9b24a34e9cac
	.xword	0x8e2da8bea8c53c06
	.xword	0x8e68502e120b0c96
	.xword	0x3f73f148c6a2ccf7
	.xword	0x04bc5ed475c5a2f8
	.xword	0x9d82c8a59e844f2f
	.xword	0x89e6eb31d27d8616
	.xword	0x873a54b025834ffd
	.xword	0x97916cb5fdcb7eeb
	.xword	0xa87a66168a562949
	.xword	0x220ed8d84240c329
	.xword	0xf291713e6e87e63d
	.xword	0x22995c757c8bacdd
	.xword	0x4f1bc8b81f669eb8
	.xword	0x3186f018a6da0abb
	.xword	0xf86d53d950d6928a
	.xword	0xdfd1b4af00602732
	.xword	0x5e6f080b9848366a
	.xword	0x086e82bfe63121d6
	.xword	0x8525b737b9a44675
	.xword	0x3db30992b9e607fe
	.xword	0x12b24c21e568f2fc
	.xword	0x37396359c2cae785
	.xword	0xdf7f283a582d9530
	.xword	0x5cd388e35b6c5a32
	.xword	0x029287afd7349d6b
	.xword	0xbc94162c38b39892
	.xword	0xba919e57faba1bff
	.xword	0xd8c3885b42ee5b98
	.align 0x4000
	.data
data_start_2:

	.xword	0xbf6475904a6faac7
	.xword	0x2ed19fb454b23773
	.xword	0x83d146e6b22abe6b
	.xword	0xaa327034a3f1eb14
	.xword	0x6d6f7f8fd3d14a69
	.xword	0x9c52c4543c6b3dbd
	.xword	0xd9e639b03b17ff05
	.xword	0x3e4702e292a37ea3
	.xword	0x6d73a7282a8c3565
	.xword	0x7c45ba6ea82c85d2
	.xword	0x87923389bd65f8b0
	.xword	0xbaa114e8de6a8d07
	.xword	0xb23af6c35e755de9
	.xword	0x3fa739ce14903687
	.xword	0x04bcb531e4654b7e
	.xword	0x162ef0d4e27ded67
	.xword	0xaf6b8d3681752c4b
	.xword	0x20d418aa8a61c718
	.xword	0x66fec2314023f2f9
	.xword	0xa4f1692b7954a129
	.xword	0x1cba0a6a3976b742
	.xword	0xd5225faab6446ff9
	.xword	0xc90da25530d06e35
	.xword	0x1ddc3e4ab886856e
	.xword	0x232d28f5bc9acf8f
	.xword	0xfdd42d37538af04c
	.xword	0x9dc4c80bf94be5bd
	.xword	0x78456d718a92ebea
	.xword	0x361e1ae9e4d37659
	.xword	0x01fabea5de679097
	.xword	0x4ce863e880ad958d
	.xword	0xf24fe03e3eb23bb9
	.xword	0x4e9ca7eac433032e
	.xword	0xf077124d6a09c83e
	.xword	0xee92e3e9bfb46653
	.xword	0x27464c2554872722
	.xword	0x1d12251874606fb6
	.xword	0x31bb64f254daafde
	.xword	0x96b30c8a9db8417e
	.xword	0x5ce14c5f512c995c
	.xword	0x77b4e6e24af1d5f0
	.xword	0x996141422b1c15b3
	.xword	0x9f97e2ea96e298b8
	.xword	0x6e3c076afb96f46d
	.xword	0x487e87ab41f3ecb8
	.xword	0x48a0ca41135a58c2
	.xword	0xb248d0cc36d65810
	.xword	0x3b69c28891913ceb
	.xword	0xbade901cd896d916
	.xword	0x44b72b4f8ae8a8ac
	.xword	0xbc07b9c2978d115a
	.xword	0x7a26bda1ecaba265
	.xword	0x160a22761d15eb5d
	.xword	0x3efef1e5d5b63f0a
	.xword	0xc6f85a2c4f803870
	.xword	0xb3118ca323d8b9c1
	.xword	0x4a6935ac6a790cb3
	.xword	0x10d5f69550eab8b8
	.xword	0xd9e19d21d8a902d1
	.xword	0xf851e25b1acb4169
	.xword	0x1dc6754316dd21f1
	.xword	0x87cd03f197701eb5
	.xword	0x57610f9e10b730a4
	.xword	0x1781992edfbecb41
	.xword	0x23d82fc51f656496
	.xword	0x173a6d6227bc3bbc
	.xword	0x1ebccaf58618a8cf
	.xword	0xf49ea23592f88f16
	.xword	0xc4aa6ebac38d1169
	.xword	0x896308892c272d3f
	.xword	0xaef89bc6f8e83979
	.xword	0xbe66b9d2aa5e6420
	.xword	0xf8211f917cf63130
	.xword	0xd3c7a8277e4ec46a
	.xword	0x5a70d2308c7ed9c6
	.xword	0x9fa4bc3af418ee45
	.xword	0x667dcda0101e9b31
	.xword	0x68a51a0ac6c4277e
	.xword	0x7564aa18b212a57d
	.xword	0x9d57c4b7d5617536
	.xword	0x54555952ec28a76d
	.xword	0x476899bf57a50c82
	.xword	0xe71c8876067c8a8f
	.xword	0x620b7f16ceb113c4
	.xword	0xd76b3c495e000993
	.xword	0x282e3456597f6b0c
	.xword	0x3eb88c09ed5839e7
	.xword	0x81ea595c02eb0e7f
	.xword	0x730045e1a8c7201d
	.xword	0x3d3ecc8907b7301f
	.xword	0x4283865fa8ac2e15
	.xword	0x02383fd5e4d46f4a
	.xword	0x7cab9a2396834838
	.xword	0xe9cc51c5e89975fc
	.xword	0x0bdaca7dcfbb4d56
	.xword	0xf856af9db50a89ce
	.xword	0x90c5825258be258b
	.xword	0x3a19cf2232f55076
	.xword	0x0be31a39a20aa924
	.xword	0x2759e7c255394fb8
	.xword	0x5b4165577b35482e
	.xword	0x81725fa5155230f0
	.xword	0x629a2513dfed5553
	.xword	0x11d8eccf9c9ebf03
	.xword	0x08b6581d2651581a
	.xword	0xc968ab28a296fd33
	.xword	0x2e34baac1747e21f
	.xword	0xd3828dd597c583a9
	.xword	0xf1bc807914249cf3
	.xword	0x98b6f73552fa59e4
	.xword	0x81398718478bd45e
	.xword	0x127a0fbc6fcac45e
	.xword	0xd1603427e808f838
	.xword	0x2c07e8b17757a9b8
	.xword	0x73d61f30ba62a07b
	.xword	0x0ef59deafa68801d
	.xword	0x913c2fd5422480d2
	.xword	0xc90c2d35bbb38f61
	.xword	0x644b6335d5f94420
	.xword	0x9f4585b871c69117
	.xword	0x924980930d0e474d
	.xword	0xda0bb2539acdc23f
	.xword	0xe42519c5d94533fd
	.xword	0xd134775251cd4354
	.xword	0xb7cf6cb3af7680f6
	.xword	0xda7be369afb83f1b
	.xword	0x260f25beb3f7a862
	.xword	0x83331fc00d77542a
	.xword	0x481ea556e5e2c657
	.xword	0xb1d6154f12ea422c
	.xword	0xc6b082002e542c25
	.xword	0xf652a95050694926
	.xword	0x41a2a2570895651a
	.xword	0x9b35a03ff3077462
	.xword	0x9998add412534196
	.xword	0x1729dd4f6883ca0c
	.xword	0x6b4d53e0f1c57c45
	.xword	0xbdadde7cd68dccd7
	.xword	0xcf7b1aab9818e6ac
	.xword	0x8fe2c5b0db9d9e6a
	.xword	0xb4b155baff061ab2
	.xword	0xf69772d02e96a242
	.xword	0xc2d32a33b8307180
	.xword	0xa5befd7988e59ee8
	.xword	0x94c3883aa57576d0
	.xword	0xbae35bfad61daefc
	.xword	0x8a86fef669e72682
	.xword	0xf44aa2a712af90f1
	.xword	0xfac71c9c30eac4e3
	.xword	0x79d3a7060eac75bb
	.xword	0x12c8b4f4ef815af9
	.xword	0xa94073e0e919896f
	.xword	0xb590db0d2d682182
	.xword	0x97ef3f3bcd0d6c07
	.xword	0xebff39c5cd74ed1b
	.xword	0xbaeb69755c0197bc
	.xword	0x18e6d3338d1b8ef8
	.xword	0x7dc6674246d10103
	.xword	0xfc646cf427ea8e20
	.xword	0xb4aad11f3c48ab47
	.xword	0x3e890791c0c039d4
	.xword	0x99d5db6c299fb868
	.xword	0x6452af8ea527083e
	.xword	0x809fd8e50a5939c9
	.xword	0xef18fed5bbc37750
	.xword	0x21bb3b70f61bf5d1
	.xword	0xfea1898bfc127277
	.xword	0xe7881d20bdaaa0d7
	.xword	0x16a3a1dcc721fe86
	.xword	0x02cf2bb722999e61
	.xword	0x24f030d5b156b481
	.xword	0xc985e668f072dd89
	.xword	0xb5d0d16db431f0a6
	.xword	0xfff43029b7ab9ff9
	.xword	0x824d89f3db0bf890
	.xword	0x1450a0ed2a9c88e6
	.xword	0x79fd7f558cf9dbc0
	.xword	0x4917830fd1f3eddc
	.xword	0x5406ef12e4919860
	.xword	0x34f05ae5b0b712d1
	.xword	0x7f1ae7d99095cabc
	.xword	0x1754f60dfa262681
	.xword	0xea8b28c468a9ab1a
	.xword	0x64fce9a12e7d3093
	.xword	0x27f8d037937dc208
	.xword	0xcaed511dbff875f6
	.xword	0x1cd049e4a4514de2
	.xword	0xa4a798ec848836ef
	.xword	0x0fd577791c656097
	.xword	0x3c032af187bf8b7c
	.xword	0xa8a21b19fd3e6afa
	.xword	0x45dc4469562d5c4d
	.xword	0x248996846d541f0f
	.xword	0x0a89f35d94bf2c28
	.xword	0x3feb608327601abf
	.xword	0x88157fadc927b22c
	.xword	0x878715ccf6a51990
	.xword	0x6a1f886ec9e39cdf
	.xword	0x653232c8fc568083
	.xword	0x8d9eff58e6b2b3cb
	.xword	0x7dd3dfd6c7f67a5f
	.xword	0x22530c37d1dca575
	.xword	0xd5c86848f863f73e
	.xword	0xb639876cf8c8aeae
	.xword	0x8d1c8dde8cc0ce76
	.xword	0x3fdcb7c981bb96ed
	.xword	0x99c8684771f2b79c
	.xword	0x8e354314fc7ab19a
	.xword	0x0bf5eaaba6bcefd8
	.xword	0xaac26702de8d69b8
	.xword	0x1c9b597c91260ef5
	.xword	0x11524dc71afaf696
	.xword	0x628aefd876c0d155
	.xword	0x7466f2300b7bd548
	.xword	0x1c0cc3cd727aadb5
	.xword	0x9b49f0383f302c6c
	.xword	0xf787321883784665
	.xword	0xec976478c3c42c02
	.xword	0x57ee11568acb1675
	.xword	0xb6e6cc46210e9469
	.xword	0x34fc1eb8308bbb5d
	.xword	0xdc3cf9890f5f0eb6
	.xword	0x7e49228f87c5c468
	.xword	0xd6e47af80b425e08
	.xword	0xc2a0b02c883f29d8
	.xword	0xc9b14cc2731590a8
	.xword	0x1a2b4425d7d1a184
	.xword	0x854b8b4605f7a700
	.xword	0xd0f57516ec5699d5
	.xword	0x278ee31112fa4e23
	.xword	0xf32fbdfdb23f2828
	.xword	0x6aa2f10f1bb01356
	.xword	0x1ae4dc22e7f28aa9
	.xword	0xbe1c8211c30361e7
	.xword	0xd43f78dfc2952276
	.xword	0x01549a2d019cc2cd
	.xword	0x8eb658405ab77aa9
	.xword	0xb9f2da27b241e1f8
	.xword	0xbeb56544a487ae70
	.xword	0x17b605c49230088e
	.xword	0x30af5c64de2c799e
	.xword	0xdebf8cc2dd6e4195
	.xword	0x1c5467f9a90cf556
	.xword	0x12a72a82636254af
	.xword	0xa4e4109285d97995
	.xword	0xc1a4dfc890a4401e
	.xword	0x8b0963501af67050
	.xword	0x4349342a578de907
	.xword	0xa715ffabeddd2d79
	.xword	0x70459814e43e2efa
	.xword	0xd004221d62622e7a
	.xword	0x7afa6e0bbc2d7ca4
	.xword	0x926245f3a38a28b1
	.xword	0x26025ba0582aa4ae
	.xword	0x6c70bb504be2ddc5
	.xword	0x9203d0133ef26c87
	.align 0x8000
	.data
data_start_3:

	.xword	0xd2f34f6c0a54fcbd
	.xword	0xb08f48c661d6fe18
	.xword	0xad860cb6e82dac4b
	.xword	0xaa44ea344d7d3db2
	.xword	0xdb27fd1347c3b60e
	.xword	0x1c6169c432fb3e1b
	.xword	0x4b74a0d71781691c
	.xword	0x39df512c613da434
	.xword	0xf3f4342cb490feaf
	.xword	0x88c65c1703224c63
	.xword	0x29a75735f76ade33
	.xword	0x9bb7ca53801f1355
	.xword	0x531e47d0c36fc4f2
	.xword	0x777ad456f52f4d52
	.xword	0x2bd6a04d4621fd8c
	.xword	0xb462c59e8eb46484
	.xword	0x3981cb3b1e743aaa
	.xword	0x3b15b08988634e62
	.xword	0xabb6673ce5451611
	.xword	0x1d28fbabd67b035f
	.xword	0x0f20149e08222977
	.xword	0xe8d12e6526c725c9
	.xword	0x9c762c3fdbb71180
	.xword	0x9358724d69643af7
	.xword	0x754ec3522caf5f8d
	.xword	0x7a9a2422996b4f1f
	.xword	0x04805ab8899521cd
	.xword	0x973a0ea6f0e6d411
	.xword	0x43c3130651917ce2
	.xword	0x03482ef29eddefd6
	.xword	0xad2f70c71f088e54
	.xword	0x93a6c7af1a34567a
	.xword	0x2190bd4fd7325a53
	.xword	0xd417f64cbe1915dc
	.xword	0xf15f37c4a8fc0e41
	.xword	0x1a5525e9771d197e
	.xword	0x2e1962fa6fcbbc59
	.xword	0xbd4a5dfbb7bad6a5
	.xword	0x31e6f3c09f4812aa
	.xword	0xe8c3e9828da6d303
	.xword	0xa3cbe2a28d8c71a4
	.xword	0x44a80888013509b8
	.xword	0xd258e48ec88ba3d6
	.xword	0xb56cee488bd8b630
	.xword	0x9003397048648066
	.xword	0xccc2743b720c5c01
	.xword	0x8dc406f52ab84dab
	.xword	0x53845a856eeb9a65
	.xword	0x42b7f5908b66fd08
	.xword	0x5e76520949299ac9
	.xword	0xdf2505bff0338a05
	.xword	0x9ddae16174c6351c
	.xword	0x06cae25766467b1f
	.xword	0xe2476d4afa36a110
	.xword	0xa903aab2c8f8aebf
	.xword	0x167b1b411266d98f
	.xword	0xa690148b74f2622e
	.xword	0x4cca87aed649cbe3
	.xword	0x1ab12bf8cdf00506
	.xword	0x22607e516669fab3
	.xword	0x2fb8eb6a408589e9
	.xword	0x09f445fe382266ff
	.xword	0xdb93f0d2959c7596
	.xword	0x68c45a22342e5a87
	.xword	0x5b3864489562ab1a
	.xword	0x45ac87921cccd589
	.xword	0xd17680b8182ebe41
	.xword	0xa497a1a7a00250c1
	.xword	0xbe31f557ab570121
	.xword	0xbcdabd65886a5d1d
	.xword	0x31d5e9e9dc05dee6
	.xword	0xc9d07b81bf007f7b
	.xword	0x5d863d3cdb445048
	.xword	0xe5a1df42788fc404
	.xword	0x5d4412ab163594ba
	.xword	0x096a9fcd730cf901
	.xword	0x90492dd401589a1b
	.xword	0x92d14520352a4f43
	.xword	0xbbb3d7bd9dfbad44
	.xword	0x751bf80c1f61ef0e
	.xword	0xe743154a588e36b6
	.xword	0xc233b2a6e92fe3ec
	.xword	0x45620a56152b83e6
	.xword	0xbd4075aa77ca5d29
	.xword	0x394911850390f122
	.xword	0xd576e8881af9c0f4
	.xword	0x4225f1b79764ae1e
	.xword	0xb0b2c616c9fa72bb
	.xword	0x640816739ec97ec5
	.xword	0x4ecaed9d930416aa
	.xword	0x5688d4eca6473131
	.xword	0x86a05340052b17a2
	.xword	0x5f164e4a6a197533
	.xword	0x08fff48765de9cc7
	.xword	0x545860a552e35077
	.xword	0xf1cc85d0b94abc7a
	.xword	0x804410700bb00c4a
	.xword	0xecd43f095d5a20bf
	.xword	0x75e71484f47628f6
	.xword	0xec65ef70bf994376
	.xword	0x4f8855e3aba5611e
	.xword	0x7ede76e51c5472c5
	.xword	0x56c07421985e78b3
	.xword	0xd89220d9e80a368d
	.xword	0xdae214bed64342bb
	.xword	0x1e56b3909bb48f3e
	.xword	0x2f0bcd91f0f52e24
	.xword	0x1e1c7c6d5f5c5388
	.xword	0x1175198565a98e92
	.xword	0xc8a153d386f539c8
	.xword	0xd78d7564c83d5bd0
	.xword	0x55c6500c4a7f5c8c
	.xword	0xefbb70f2e8a77f1d
	.xword	0x1c49e345f8dc0e18
	.xword	0x2d789c9d4c4d1d88
	.xword	0xe2f5b0d818932591
	.xword	0xd9d219332f31bed9
	.xword	0x492f8e0bc6a45cfc
	.xword	0x3dd334b647551683
	.xword	0xfee898ef25a9ade7
	.xword	0x20f9571cf349e130
	.xword	0xe8320c2a7d52482e
	.xword	0x800472bfa588af2b
	.xword	0x822335f90034c453
	.xword	0x204946e88255d6ac
	.xword	0x4ef6bff09a83d6d5
	.xword	0xc1c5ecc15d192b99
	.xword	0x846f03db2377b83c
	.xword	0xf8fced6a408c8ec1
	.xword	0x79bbd6366cee8b1a
	.xword	0x60b96b7799dd63ee
	.xword	0x0091bea97d2297f4
	.xword	0x41578a08d6e40e99
	.xword	0xb08659cfbde0e2ed
	.xword	0x84e6065713f5010b
	.xword	0xa08846a7b8740af0
	.xword	0x95950dda16e68aa7
	.xword	0xfe691816c894f05a
	.xword	0x418f4306b61d31af
	.xword	0xfd257244fb50feaf
	.xword	0x97f48245ae80ffa2
	.xword	0xa41488b0bad033fe
	.xword	0x98acc0fbef1187e1
	.xword	0x91fdfb2d022e7373
	.xword	0x3466abf09875fb9e
	.xword	0x62264e4d38714f79
	.xword	0xc33ee5634b1672e0
	.xword	0xd73b400d6e1a1424
	.xword	0x00d01598ebc7c4d4
	.xword	0x49d5c76979cd5036
	.xword	0xc06281785cb95973
	.xword	0xc579171a5dfe7920
	.xword	0xfc26c1e2ab38cc0a
	.xword	0x68e4eb17d24c75e8
	.xword	0x38fac576bce752ee
	.xword	0x0abba9afe225e121
	.xword	0x0022297baf174776
	.xword	0xbfa2616b127ea8ae
	.xword	0xb0f654707526fc07
	.xword	0xc3a182fbeaa69fbb
	.xword	0xc4441f028162b1b0
	.xword	0x3ef1722ec705008c
	.xword	0x81211ab72feaa609
	.xword	0xd3468c3c5569d18d
	.xword	0x372777a856ba0c05
	.xword	0x89168cace6ddf81d
	.xword	0x0f1d956663ed1854
	.xword	0xa048646df7d4d3e9
	.xword	0xe9a3fb5657177805
	.xword	0x0beca1f90ba757ae
	.xword	0xd5342340fac935e7
	.xword	0x2b63c8193a5bb309
	.xword	0x6955bd561791a059
	.xword	0xa824d24ff5acea67
	.xword	0xdba8f21869510c80
	.xword	0x4856a0287eb58023
	.xword	0x2eb5f331208d9d44
	.xword	0x416972109a6f6bbe
	.xword	0xe602f49b48b23a18
	.xword	0x2d61f1411d3f68e7
	.xword	0xff3f3045f3aac49c
	.xword	0x5934312938eb1017
	.xword	0x82e48367a53ee28b
	.xword	0x2f9365adc3642343
	.xword	0x45c17bb093c128ec
	.xword	0x0fd7b7d905ba1c02
	.xword	0x03cc86fbd6ac88c0
	.xword	0xf5e8e349e298ef34
	.xword	0x4945583466fae445
	.xword	0xb569f193aa452296
	.xword	0x00f283e298d52451
	.xword	0xa7b11265f6cdda7b
	.xword	0xc8550e6f06882e20
	.xword	0xa207f71acc478804
	.xword	0xdd89bc14e8476352
	.xword	0x4bcfd564ebbaf338
	.xword	0x087e998742a1f7dd
	.xword	0x7b5f2d25be6fe29b
	.xword	0x9143e1c8f8151c7f
	.xword	0xec3afac81c6e141c
	.xword	0x993a512a2e01072d
	.xword	0x8a44b2b7e9c8ceff
	.xword	0x5dab92dc1c78e3bf
	.xword	0xc04b009a94d34c8e
	.xword	0x6d1256cde2643c09
	.xword	0x5aa1d2cdc7196ae1
	.xword	0xf7367de615c9c630
	.xword	0x77cf7aae90b58a31
	.xword	0x6ca7db47d582d3d9
	.xword	0x0c8d1d78cd20fc5c
	.xword	0xfc5f393dd3b28836
	.xword	0xf1bf2e8bdf952e26
	.xword	0x239f56911932a6e3
	.xword	0xe9459d2341605a54
	.xword	0x6f0c6f1c9e5baa70
	.xword	0x88b879ec9f8ba889
	.xword	0xbe8ed7edae955f8a
	.xword	0xee59506a3506b16c
	.xword	0x24cb5145c822709f
	.xword	0xa8c2b4b5024205cd
	.xword	0xd0232013500f2a03
	.xword	0x54c067da36dc732e
	.xword	0xb09cbd01484394fe
	.xword	0x6ef19958f5328577
	.xword	0x6e54421134401a1a
	.xword	0x38ff317f225ebfc7
	.xword	0x0541950516ef0022
	.xword	0xe5061499c7d9a4ab
	.xword	0xc4d8a670ee46a8e0
	.xword	0xeac24a4b098a09c2
	.xword	0xf849238004a0dd46
	.xword	0x06e6233d2882a050
	.xword	0x642964d0d382240f
	.xword	0xe538ee8f79b52f54
	.xword	0xa074b717fbf31120
	.xword	0x049cca7c97d8ac99
	.xword	0x08924af9c2b05f7b
	.xword	0x89b02eb88b77f545
	.xword	0xaa2279d5953175b7
	.xword	0xb680bdaca7d53c05
	.xword	0xd79bf609b4c98ef9
	.xword	0x2c8910cab6fd28a8
	.xword	0x6d880d092ea2b083
	.xword	0x0293a66cc0d5d005
	.xword	0x608379aca759d7be
	.xword	0x4c994f4914aba48e
	.xword	0x2b3587b5bc2e9fd9
	.xword	0xbae66c9bbb0188d7
	.xword	0x424bbc23c4408a11
	.xword	0xc61dc13f57c2d1d1
	.xword	0x49bd756ddf1ef3b0
	.xword	0x8234b46a0b37f7b7
	.xword	0x2961954ff62536cc
	.xword	0xd37d4a9055e7c052
	.xword	0xeb545ea5475f9967
	.xword	0x53cfa742bbdf0db7
	.align 0x10000
	.data
data_start_4:

	.xword	0x432ec46962a5fceb
	.xword	0x3942e0ed619ecccd
	.xword	0xff91cac2dbc2379a
	.xword	0x517e4f22a2532baa
	.xword	0x9c8a02bc4a656921
	.xword	0x0621e5b276e50a38
	.xword	0x33ca013473935aaf
	.xword	0xfcc1e4a348849333
	.xword	0x26013a274bace14f
	.xword	0x8070a0b8138e4e70
	.xword	0xa1700bd11a342241
	.xword	0x68a009c5400f0798
	.xword	0x44c539de524df310
	.xword	0xb66c5271dbb48454
	.xword	0xa6b6fcf7028271fc
	.xword	0xbdc1ed33afa94dd9
	.xword	0xac6552ca7e8c8477
	.xword	0x8c9504b59536d41e
	.xword	0x892917a6c211fe29
	.xword	0xc9f45a8c9d627eb8
	.xword	0x4cc64be2d9d279e4
	.xword	0xb438d91165f8397b
	.xword	0x399465719488ed5f
	.xword	0x664516dfc545b5f7
	.xword	0x7209479dccc276e8
	.xword	0x0625aafac08a57d1
	.xword	0x4d7dd86cdb1753cf
	.xword	0xad4b9de5face7250
	.xword	0xeede0fb7e3f32e16
	.xword	0xaa221a3b5dbe0624
	.xword	0x1ca50a0f3671ffb1
	.xword	0xabdfcd8cdc6a3427
	.xword	0x3272f05104e0eeaf
	.xword	0xe15f5172fadcdbf5
	.xword	0x97698a10aa301608
	.xword	0xba00a25d24bdef2c
	.xword	0xdbf2f5e2b13144a5
	.xword	0x2bbed8cb37298aad
	.xword	0x60b29a652ff7edab
	.xword	0xfe15dda2eee5c949
	.xword	0xe7c0cdb72e89cd5b
	.xword	0xca0c9b4e2a61234a
	.xword	0x0fc6536b1e413850
	.xword	0x33e79301a0446a7d
	.xword	0x32dd42f829a33d5f
	.xword	0xaac98a4cc67a1d17
	.xword	0x5c3184a47661f6db
	.xword	0xabd927c36d01cc8e
	.xword	0x514b4d00065aa657
	.xword	0x85fa3004db80b17b
	.xword	0x2f1a3e90d2b607dc
	.xword	0x52aeb5879ac356aa
	.xword	0x6599b43122adf969
	.xword	0x4b635ec8a384fd05
	.xword	0x9bedd1c035cb0462
	.xword	0xeb947d0c0d9851b9
	.xword	0x293686054b0ae7ef
	.xword	0x761c562bb3d36509
	.xword	0x3266e922eaedeb3c
	.xword	0xb755f43f93b61881
	.xword	0x33e91b1154ac9b72
	.xword	0x4bfa4c14a1638aab
	.xword	0x69f179c5747d6f81
	.xword	0x805f651150bc6782
	.xword	0x27dd7082ece7e76b
	.xword	0xe44dd064a799f2aa
	.xword	0x59321702a509a3ec
	.xword	0x2576387a9ade391c
	.xword	0x9f9ac3b1a6b42501
	.xword	0x5282cc42a749a627
	.xword	0x367ad0326b98f800
	.xword	0xa315fe6493663402
	.xword	0x2022582f0afd5204
	.xword	0x5e322868ac4dc4a9
	.xword	0x608fe40734fff41c
	.xword	0x1f86ee6255cb468b
	.xword	0xce80c1eaacc496cf
	.xword	0x89f835cdeafb6dea
	.xword	0xe01fe9a78e253e28
	.xword	0x6fe5d3d9d9db2a41
	.xword	0x34aca82705c7b9e9
	.xword	0x3794569f1aa3c6b0
	.xword	0xada7c15ed493bd7b
	.xword	0x442e2b4843506593
	.xword	0x52f45e75377499af
	.xword	0x23eda503ef7da851
	.xword	0x5d3354dfc22dd294
	.xword	0x1531e2edc898b6f7
	.xword	0x3e68f35be6b96170
	.xword	0x011aaa0c2e26552a
	.xword	0xad7099db477e9f6f
	.xword	0xd45a628350ef3d0f
	.xword	0xa98b7ed75c80d3b9
	.xword	0x805ed48f8b00a7d9
	.xword	0x26c5235024ac5629
	.xword	0xae9764b35eacdc9e
	.xword	0x43ab0a09ba3deb9e
	.xword	0x2717eccdcb0b5078
	.xword	0xdcd55acbf7387afa
	.xword	0x0094200410abbfd1
	.xword	0x36854038477e2f77
	.xword	0xcb855ec547af24a6
	.xword	0x3d2f9d51d557d79e
	.xword	0x9462bf154e7a9599
	.xword	0x5b9729f7cac6af62
	.xword	0xbb49e4ef3a8ef672
	.xword	0xb534243c43a78063
	.xword	0x976312219d04e9ab
	.xword	0xbec82f4cbd081a8a
	.xword	0x9ce5f0fca2435322
	.xword	0x84061b472f59b5b1
	.xword	0x84e3daf8794c811a
	.xword	0xc920e36b23637012
	.xword	0x0c3126c402e6ecd4
	.xword	0xeb90589a7805d282
	.xword	0x0145fe01d8829618
	.xword	0x73603c05ca8bdd36
	.xword	0xa944b3165915ff07
	.xword	0xf3ee6b11bb39db75
	.xword	0x7affab14870a4498
	.xword	0xe72beaf5d400d81c
	.xword	0x7f0a2087b6334d63
	.xword	0x2fc9f3d3d645b153
	.xword	0xb35bc802160fd801
	.xword	0x6c9f40811af72329
	.xword	0x8e2d33200d794825
	.xword	0xb716a737cca7edac
	.xword	0x744f4910704c809f
	.xword	0xa62aedcc156d108a
	.xword	0x433bb30692ab79f5
	.xword	0xecd4de46b0fd7ea7
	.xword	0x810799e11fb5e610
	.xword	0xf248d220d66ba34e
	.xword	0x14e5f2141a2f0108
	.xword	0xb185beb4aa996f65
	.xword	0x92c433f589302226
	.xword	0x5777d68cc7dc1276
	.xword	0x6919a4e9ea32a173
	.xword	0x44069722b7ae88c3
	.xword	0xcbb166785287b010
	.xword	0xcd31c65210a26568
	.xword	0x3ae8269ba1c6e26d
	.xword	0x5f638a260960dc5f
	.xword	0xbefae75fdb7bbcd5
	.xword	0x291cb5722559c993
	.xword	0x2f4849f49977d18d
	.xword	0x58fef52730378dc0
	.xword	0xed404d92383e3f10
	.xword	0x089e79a1ae21e34c
	.xword	0x8617d5912d7160b6
	.xword	0xace708b972e5b5c5
	.xword	0xcf8be4d720916c02
	.xword	0xa1c5db72c1acdd03
	.xword	0x4622cd00bcf9027f
	.xword	0xd3e556f2f6330ec2
	.xword	0xf8ff0b1d8427f980
	.xword	0x01c4456021015b32
	.xword	0x30149fba517c2ee6
	.xword	0x568ec107ba4b7062
	.xword	0x81fcfcfdc5fb20ee
	.xword	0x794d0b8e7aa8349c
	.xword	0xf7cfe55c53fbee98
	.xword	0xa897cfe9cec3d9dc
	.xword	0x1aeffd23ce881908
	.xword	0x5ad74a2c3101c322
	.xword	0x26c44be312c3af7d
	.xword	0x19ddf7d6ef808abc
	.xword	0x8d68dba076ae910a
	.xword	0x5581aa96d20cf0d4
	.xword	0x127f598229c13bee
	.xword	0xd551e94d5a0ee3d4
	.xword	0x8f5c711f0ab89ff1
	.xword	0x64cfed814d9d1b1f
	.xword	0x9fb08467686ef498
	.xword	0x6768276db639ac3a
	.xword	0xd7dd9ac6394685a1
	.xword	0x60781836971065f1
	.xword	0x89a6ff2b1b3befa5
	.xword	0x86ab4a9425479757
	.xword	0x66ef2477593ef4fe
	.xword	0xb33867b620318b9f
	.xword	0x3b61c6055172a392
	.xword	0x31f9f6d91014d35e
	.xword	0x79f6d6a1410c74b9
	.xword	0xddd513a2935d873e
	.xword	0x311d4f78d1f5fa0f
	.xword	0xab7f95e81ee954e1
	.xword	0xa4c80f7a907fbaa3
	.xword	0xc796970099f26cd8
	.xword	0x6f9e965e8d01c130
	.xword	0x985c9681cff525b8
	.xword	0x3e461855ac8b7d6a
	.xword	0x87c68fdbd3076749
	.xword	0x301b86696718815f
	.xword	0x552b5a726d772e2a
	.xword	0x49ba08a357c05b81
	.xword	0x448072e104652657
	.xword	0xac83f1e19f8c3087
	.xword	0x5f8f38f5aef4da62
	.xword	0x08968f21b492bdb0
	.xword	0xb73550853ce4fa27
	.xword	0x6c7c2dc62e959cc5
	.xword	0x9f32c70712f24b31
	.xword	0xb32fdbbb84b97dfe
	.xword	0xe9641d9f7a1cc929
	.xword	0x84f4eeeaa1bff68d
	.xword	0x3395ed55393d698b
	.xword	0x5685cec84cd22d14
	.xword	0x2009eb0d37512b88
	.xword	0x82f0cf55e09d33dc
	.xword	0x14af77387f4f692d
	.xword	0xf1dd5f606cb363c5
	.xword	0x42ab44d344d980d5
	.xword	0x3ff140d3230a55f5
	.xword	0x81e83595f5ff16cb
	.xword	0x08604bbb69ada6a9
	.xword	0xf55b683e2511d9aa
	.xword	0x058d5524e3ca5cee
	.xword	0x2b9c4ee22371002b
	.xword	0xaf55881850490d80
	.xword	0x63f08dc8e469bf20
	.xword	0xb635a701f3f247a3
	.xword	0x59842dcb0709cbd1
	.xword	0xaf3a29fffe7c9a77
	.xword	0xcfa4c575b7e8c11c
	.xword	0xa3e6b1aa1b4a2a13
	.xword	0x18aa0c7c5c97de43
	.xword	0x317f6e60d666147b
	.xword	0xf8d0d67c5c39962e
	.xword	0xf6a1c812bdfc22ea
	.xword	0x7f31b428a3fc080c
	.xword	0xb7be42df700bef0a
	.xword	0xdcbe87a75682702c
	.xword	0xf944010e9e0e6ebb
	.xword	0xd4d32a859ee28d85
	.xword	0x3fcd8d9f45be709a
	.xword	0x1f4e9b57d459daed
	.xword	0x72ccc6c709f7b13b
	.xword	0x8d9e526f23ca0658
	.xword	0x057afad013e59849
	.xword	0x8383eb6f644633a0
	.xword	0xd52b9a8f96e227b4
	.xword	0x1b5aa510c0898632
	.xword	0x3edfb1af414c84ca
	.xword	0x0e3ed9f6f40d4d01
	.xword	0x51d57ee0fb9b15bc
	.xword	0x1be0573ab74e89f6
	.xword	0x46a4133e4ae67e01
	.xword	0x653fe9d747416858
	.xword	0x3d09809cfb94ff83
	.xword	0x6896da8445c9ce98
	.xword	0x00dd0aaf4631a45f
	.xword	0x00f05ba6843c5ba0
	.xword	0x0ebdc7ddf031d9b7
	.xword	0x599540fb68a69151
	.xword	0xa88713d5d6a43561
	.align 0x20000
	.data
data_start_5:

	.xword	0xb2a12301fc86513c
	.xword	0x50f6bb58808fcffc
	.xword	0xe624374c86c5e461
	.xword	0x4b73c524ba2e47ec
	.xword	0xdba1fe974837f104
	.xword	0x6b04038ac84c4331
	.xword	0x9555205bd17672ae
	.xword	0x3af6bbcafac020ad
	.xword	0xa2729f8b9cb6490f
	.xword	0x0748c60ef8a5d9a0
	.xword	0xf766b6c566ba1191
	.xword	0x781f039aec84b98c
	.xword	0xa6456a172ef8627b
	.xword	0xff0c36a5207acc10
	.xword	0x6d04397224a4d7db
	.xword	0xe6955473a735a658
	.xword	0x172f2c57389b4306
	.xword	0xe2720e2219f2cb57
	.xword	0x885139190f934304
	.xword	0x38308cd4100e6aca
	.xword	0x4519a835286970b7
	.xword	0xf850555f62c475df
	.xword	0x0caa93f80658941b
	.xword	0xbdc81b775839ce6c
	.xword	0x498fe9c364da5b0d
	.xword	0xba2a83ab680afe58
	.xword	0x4b1b7cb8f8f86e06
	.xword	0x13caa7e9bbc50c46
	.xword	0x06e6e65d6bae826d
	.xword	0xf7e4c8cd476186d5
	.xword	0x9db02c034eb5b867
	.xword	0x83a4c426a3a229a9
	.xword	0x79c35cf249ced7ce
	.xword	0xb938170e3d55ff21
	.xword	0x4a83b5eaf362fc47
	.xword	0xdb56e28b6f547346
	.xword	0x1353ec433ee1615f
	.xword	0x8c2893d42362c999
	.xword	0xd19f01c6b9c56244
	.xword	0xe512e2c21a6896cc
	.xword	0x164afb2a2082d548
	.xword	0x2ac90f7f5750ac43
	.xword	0x53fbe4d5477fa9f2
	.xword	0x63bfd58f43b884c3
	.xword	0x5f0ca4a4ca291fe2
	.xword	0x0c534ca1c91f9ef5
	.xword	0x76fbd853b9921aae
	.xword	0xdc03449040f0d957
	.xword	0x2ecd70a65812bd2e
	.xword	0xb3e55ed61cfc543c
	.xword	0xfb9cc52e027dcec8
	.xword	0x17d18eacfb86f8fe
	.xword	0xaf67c0da7393b154
	.xword	0x7a10a571728c754d
	.xword	0xbb6158a3e764d500
	.xword	0x55868f6cfaa04479
	.xword	0xd1fbfee7e2e599e8
	.xword	0xaf35922c2ab61fea
	.xword	0xe9c643627a37bce7
	.xword	0x7684f49cc8ed9af2
	.xword	0xf7011d00adecb3f4
	.xword	0x8efdb400e44699d8
	.xword	0xc2b5a04980dc2a56
	.xword	0x58de86498a934b53
	.xword	0xc75f32c121e81812
	.xword	0x0faeb0e0a264407e
	.xword	0xd3935674252efc46
	.xword	0xac4f32a6df35c67c
	.xword	0x598cbb511ff8da81
	.xword	0x3740d1962621cf43
	.xword	0xaad7691be5455069
	.xword	0x6adc263811781e01
	.xword	0xf25a97b104d5c6f3
	.xword	0x11337292ea49ab4f
	.xword	0x8d862acfc039ca66
	.xword	0x6d905868416aa616
	.xword	0x4789b1466798a2f2
	.xword	0xff124f3dc7c37800
	.xword	0x3ef6671517bb8cde
	.xword	0x2225942f7ed8655c
	.xword	0x9c3a9a5bc5157d5c
	.xword	0xc2e2e52bd5a89fc2
	.xword	0x21f317336fec5f9d
	.xword	0x12aced99d15ca505
	.xword	0xf8013ed13df24b87
	.xword	0x09a5145497e8a1e5
	.xword	0x7a3f5abbe59bf056
	.xword	0x349beeb44fa78c59
	.xword	0x7eb0e07164a05d4f
	.xword	0x25a100754b28e0a4
	.xword	0x0879919e785460fd
	.xword	0x6b4c8dbe290a509e
	.xword	0xc0a9e2ed283d06b7
	.xword	0x7f0a0ecf586b80e3
	.xword	0xd7d343e9c4ac64f8
	.xword	0xe0a32c41bf81f59e
	.xword	0x80585ee7173cdfd3
	.xword	0x1e6a6577e81a2d91
	.xword	0x8711433f0d96bd56
	.xword	0x930152bffb70e65e
	.xword	0xaf8c61a991004441
	.xword	0xf1c414c39c3ebb77
	.xword	0xd23e296f020b3db0
	.xword	0x4e8e46bc02f77422
	.xword	0x3811e0bb249a4bea
	.xword	0x9d05107a76dc11ea
	.xword	0xd530aba1aefb5c20
	.xword	0xc192856677bc7832
	.xword	0xe7524910e8688b48
	.xword	0xb25283fc0cfa2b73
	.xword	0xa645b6d0a184da66
	.xword	0xcf8e66a3639d68c7
	.xword	0x1b1fe6d1e8f45bf8
	.xword	0x135524096d880ca8
	.xword	0x85b47bcf013e0535
	.xword	0x240f1be2685bb3ba
	.xword	0x2fbb0afec22453b4
	.xword	0xbd7642d51c9b6177
	.xword	0x0417783fc839c260
	.xword	0xb8c5fc283a64c88a
	.xword	0x50447c30213aa90d
	.xword	0x1f1926090f050927
	.xword	0x0db9668f5524fd3f
	.xword	0xd418546aaa6face8
	.xword	0x1e1355a9022f710c
	.xword	0x47c6df4f78682ee8
	.xword	0x2010f204dd720b06
	.xword	0xe7a604b631d31aa1
	.xword	0x1534486cb209729b
	.xword	0x7caebfdfb3d6428d
	.xword	0x13749a1c81bc0ef2
	.xword	0x553c0a4c66b45e45
	.xword	0x3c989f1b8d02e73a
	.xword	0xdc2d3603599cc208
	.xword	0xe4d4ad4670467b0e
	.xword	0x60331e03adc572e4
	.xword	0x8ac7ffe449765fc6
	.xword	0x602f3d7112fb825a
	.xword	0xbaa27dbf3aa5db7d
	.xword	0x85806deefe476534
	.xword	0x38e876f6619f2f2d
	.xword	0x5ea067c6776637d9
	.xword	0xfde116f9478c3411
	.xword	0x2541b471a9f41a31
	.xword	0x18386b9fd0097698
	.xword	0x23389bb52fdf91ef
	.xword	0xb0b83c80a9f63847
	.xword	0xc44d3c8067f9ca26
	.xword	0x2479e08aace9b26c
	.xword	0x3498be65fdcb7b2f
	.xword	0x841cf2d783dc7f30
	.xword	0x68ccdf5f47d539c3
	.xword	0x240e57647ec49b1d
	.xword	0xa9a198d39f616dd8
	.xword	0x16e657579dec6c0f
	.xword	0x62411ecb54db9a70
	.xword	0xd5770f9127c1820d
	.xword	0x02647af049a91cbd
	.xword	0x3dcb4caffefc7f4b
	.xword	0xeb648543960b550f
	.xword	0x1a5a4f4778ad5459
	.xword	0x32443ce64108a2a5
	.xword	0x078da499e6918fc0
	.xword	0x29c2cedd8f18acb6
	.xword	0xdc5460e20ccac9d7
	.xword	0xa13316228e6e0067
	.xword	0x8b6b74b2d69256ba
	.xword	0xce538460171d63e7
	.xword	0x18786a01b607960d
	.xword	0x98cfdea3c24ae6a3
	.xword	0x7a76892544fb26c7
	.xword	0x769c20dcb87edc47
	.xword	0x48afb87fce041a4f
	.xword	0x728fd97839e937d9
	.xword	0x3d2c8ff4bda7bf43
	.xword	0x5ded3970b8b30894
	.xword	0xfc32eea3c9aab5df
	.xword	0xc180e9a2521d43bc
	.xword	0xbbe8d3ff843d331b
	.xword	0x8d59675632f7afce
	.xword	0xea601d7343ad6060
	.xword	0x6ab31e50167fe3dd
	.xword	0x38f9305dcf9b1ed2
	.xword	0xc3759fe5a8c0815a
	.xword	0xaa3bc083436c2c8a
	.xword	0xfc8235360cc93f9d
	.xword	0x789c4acf879855f2
	.xword	0xb01647d4fcdaecc3
	.xword	0x8195c5e86f5f0d89
	.xword	0x44e8773be5149b16
	.xword	0xfd508cb9b0e24a8e
	.xword	0x9fdf52f4b10e45f9
	.xword	0x05dfc799897a8991
	.xword	0xfdc580230235255f
	.xword	0x3179c450e93ad385
	.xword	0xacf7e3573be362b7
	.xword	0xd7a48c690531841e
	.xword	0xa396d6d1ecf51811
	.xword	0xd47488d0b61cf01f
	.xword	0x68b5df2fd228af16
	.xword	0xf96571cfd1f96f8f
	.xword	0xdbdebe6234e0ba42
	.xword	0x5b52ea6d24bca591
	.xword	0x094c1faba1f6df95
	.xword	0x751319cf7dca5405
	.xword	0x9eed57a3826b8a49
	.xword	0x966023c9946346a8
	.xword	0xef6433d1769c9c69
	.xword	0x0e43b9acfeae7cd0
	.xword	0x100b616f7c8916b4
	.xword	0x5686a197be37b431
	.xword	0xcc2655c4e75d0cbd
	.xword	0xf134023d2085d648
	.xword	0xc9c05e0a0031a50a
	.xword	0x39a1da854b53dd4a
	.xword	0x9eb19f2c823c3e78
	.xword	0x25b94e537abf4137
	.xword	0x8a74a6047e732fb7
	.xword	0xb1b5cee90ee225f9
	.xword	0xde228be60d9100db
	.xword	0xc4d1c3d8ad5f13fc
	.xword	0x1c15dfbb882c2479
	.xword	0xabc086e1e7767592
	.xword	0x71b4bd7a3b5cc92f
	.xword	0x7d15e8d689109ee0
	.xword	0x161d020a6bd2ba25
	.xword	0x74a4ce46f3aff0d6
	.xword	0x4187353f17628d8f
	.xword	0x8d3fb69dfc018230
	.xword	0xcf9181899489d378
	.xword	0x52c94dd690dcf050
	.xword	0xdf998937882f585e
	.xword	0x0f62604e3a4060bd
	.xword	0xad7640c90e6c45d7
	.xword	0xc3e5ae62dd6ddf58
	.xword	0x4ebd011259cf10ce
	.xword	0xaf2ae29c3bcd5c71
	.xword	0x5bb760afafe9fdf9
	.xword	0x02976af9300fc6f3
	.xword	0x4f4da87510a4099c
	.xword	0xf15a1acc7f2c8258
	.xword	0x2222708fa472b869
	.xword	0x35337d2d875d792a
	.xword	0x77fd0cbef9efedbd
	.xword	0x7142683c958fbfde
	.xword	0xe52e7d700d64af7a
	.xword	0x36a7966eaca3fd7a
	.xword	0x7789e971ffc841fc
	.xword	0xab007b725ee2abcf
	.xword	0x4b501f4c7fb44ed2
	.xword	0x899bdab5c4ccadc1
	.xword	0xc46a1e1be69c37a0
	.xword	0x6a2de649cedcdfec
	.xword	0x58d74eb6d1003991
	.xword	0x47b3cbe49c33ddf5
	.xword	0x1052185bca371ed7
	.align 0x40000
	.data
data_start_6:

	.xword	0x796cf0b69e13a58a
	.xword	0x544324de8c6751cb
	.xword	0xf9731e31fee54dc6
	.xword	0x7059b4500f02ba2f
	.xword	0xbe180a1bdf8e744f
	.xword	0x9eb349b465acc95e
	.xword	0x6b142a395462a44f
	.xword	0x6de1962bda1be4aa
	.xword	0x0cb17067c7e0529d
	.xword	0xd563aa4b0a08a51d
	.xword	0x1d3283e3fc79f937
	.xword	0xaf5bcbdbfb4dfda2
	.xword	0x53a4c514cd4d9930
	.xword	0x9f72456040d8cde6
	.xword	0x6e0536ac473e61b1
	.xword	0xfb8248e05e65a551
	.xword	0x42e59655739454ac
	.xword	0xe9ec37075a9f8ed3
	.xword	0xf2df130b3a830e81
	.xword	0x0d7aaa50725692ee
	.xword	0xf2ec9ba9787a12cd
	.xword	0xc671e5a46008e59e
	.xword	0x25393ca213037613
	.xword	0x96eb625cfe99be69
	.xword	0x3c633490b7005675
	.xword	0x78cdce6318767582
	.xword	0xf38d12292a9b3613
	.xword	0xd0d20f7518b115ae
	.xword	0x1c013f1e275ba57d
	.xword	0x78e2c610915cb96b
	.xword	0x64a79031169aafc7
	.xword	0xe6b34723c67d5ec4
	.xword	0x1e867fe3f89740d7
	.xword	0x9a09589af1205214
	.xword	0x89225bdb74398bf9
	.xword	0xb7042b2b602b1281
	.xword	0x39c947f7ca636367
	.xword	0xc4ca6d101b302ef9
	.xword	0xf170ca375dadb4c1
	.xword	0x2e3df782b0496726
	.xword	0x63d24f77b4d688aa
	.xword	0x168278df5bd46219
	.xword	0x3b3333f4779e726d
	.xword	0x88e18efb66537d42
	.xword	0x5cba9818155ee67a
	.xword	0xa8c3a9260c9c7975
	.xword	0xb33f746015b84339
	.xword	0xd6b8a053dac77cfc
	.xword	0x4ad108727a2e43e6
	.xword	0x8023e33dabd80481
	.xword	0xae18b8e990b4ef5c
	.xword	0x41c4b15a11665a9e
	.xword	0x761a8076ec7b2990
	.xword	0x16290100abb0508c
	.xword	0x9da348b1cdeedaf5
	.xword	0xd13e08660e3adfe9
	.xword	0xf96982d004786d53
	.xword	0x43b013532656ef03
	.xword	0xd85ffbfc460a96d9
	.xword	0x605c3475b110c367
	.xword	0xed93db07ec270229
	.xword	0x609d0e076ef5987b
	.xword	0xd36795952baa2117
	.xword	0xfa753395fdb7d35e
	.xword	0x07dc82b82bd94df3
	.xword	0xf0d5f36a49763017
	.xword	0xa03976c826438687
	.xword	0x98b08b9ac1b61a69
	.xword	0x2135f4bb5adbcd11
	.xword	0x65c2366161ab0edb
	.xword	0x6dfec267365d0e19
	.xword	0xca4ad65db3e24c87
	.xword	0x20bc3733fa1ff3b8
	.xword	0xc147e6931a188485
	.xword	0x61036677554f93ac
	.xword	0x765385c12160c123
	.xword	0x5074f36f1dcc3695
	.xword	0xed16731c06ee1d71
	.xword	0x603217b8c6bb0164
	.xword	0x39b1fcd2b903b0a8
	.xword	0xbf23e3e088ab5d2e
	.xword	0x94e5f4bc62d2baf4
	.xword	0x22c9d7379b6fe603
	.xword	0xdee1207531a9fc40
	.xword	0x0b91e22f4dbff60f
	.xword	0x0b812506acd5a05e
	.xword	0x4dbbd1cf08ca8202
	.xword	0xc8f71c3519cfa75e
	.xword	0xe0543e581b8c6c17
	.xword	0x5399fbfce582dce6
	.xword	0x2806a7c9c0740004
	.xword	0x4fa086d00d63b726
	.xword	0x3a559d04de0d7ded
	.xword	0x0cc26f6086c3e850
	.xword	0x8407d726b05fd94a
	.xword	0x90a393a9a54a9ff7
	.xword	0xf742e1bc9fe55cd3
	.xword	0x392c1c6012a9f3d9
	.xword	0x61d868f1f413851c
	.xword	0xc6f58f1729a2b103
	.xword	0x5787ea1692676637
	.xword	0xbe0c1a3cc1dbc2f3
	.xword	0x52f489cb04e8ad87
	.xword	0x44d51c940f430403
	.xword	0x668044b2aafd2fa6
	.xword	0x0c2b4c46e75b4892
	.xword	0x9d8d2b42cb7cd41e
	.xword	0x0914a02812a8c15d
	.xword	0xb9514e2c14d47658
	.xword	0xe146ba922742bc0f
	.xword	0x955a6d60ca17aa16
	.xword	0x70ce167ce0d1f94b
	.xword	0x642b410084b2aa46
	.xword	0x1bb870efefd572cb
	.xword	0xbbd03068567a8d48
	.xword	0x48a1b297ec89d059
	.xword	0x05ab9627bf54447f
	.xword	0x4372865dfc708bfa
	.xword	0xec9355ab44d8baca
	.xword	0x656581070bdd8d08
	.xword	0x4d6f4944da3d20d9
	.xword	0xcc7e0919ebe0d08a
	.xword	0x67414ba0c533cefc
	.xword	0x369298d715270bc7
	.xword	0x9b4efc0935041c78
	.xword	0xb946c911273cdab7
	.xword	0xd9ed2ace738bec0e
	.xword	0x5dd76da3b19d33a0
	.xword	0x21be0849662cb912
	.xword	0x9be18dabe8c1a363
	.xword	0x02686b4fc98551dd
	.xword	0x338bd235ddf04291
	.xword	0x112930e472a00d8f
	.xword	0xd3fd00b83f003b5a
	.xword	0x6ce18611ed20a307
	.xword	0xe36a384251aee820
	.xword	0x7210f56ab62842ee
	.xword	0x37d8b75c6e691c7d
	.xword	0xad7149647df54996
	.xword	0x970536dab03dec34
	.xword	0xa6a0b414c1699433
	.xword	0x4ab0428dcdc6a755
	.xword	0xfe8e77b8a71aa1c8
	.xword	0x6bf61af350faf8a1
	.xword	0x815083591e0a84f7
	.xword	0xf747b2e943ec8748
	.xword	0xeb455eee5699a565
	.xword	0x7efb629fdff8a030
	.xword	0x42d3a461e2feffe1
	.xword	0xba5d8416047d613c
	.xword	0x94bebfdd49597e17
	.xword	0x0787abb71c69f77c
	.xword	0xd0923120a99ec99d
	.xword	0x515c4e779a175df4
	.xword	0x7be2cb81710d927a
	.xword	0xac05166d79bcee6c
	.xword	0x69f4c80707d9b84e
	.xword	0x1d3ced5305db81a3
	.xword	0xa17c762f4133f049
	.xword	0xe751e5365d40a26c
	.xword	0x25ed863e29ca265e
	.xword	0x56e8eb20675e834f
	.xword	0xb869ecf7bf0f9caf
	.xword	0x100f84e180148058
	.xword	0xa272078ad0ec455a
	.xword	0xfcfde7ec855bf985
	.xword	0xee4ead952c28351c
	.xword	0x887e50334d4bc333
	.xword	0x9ed042839f1a3dbf
	.xword	0x2271c9a4e0a18a57
	.xword	0x9ebf5f672b89fc43
	.xword	0xbb142291b8baf5f4
	.xword	0x9cbdcd23ef3708d9
	.xword	0x51d0d808c0f45ced
	.xword	0xc3cdcef7f77097d1
	.xword	0x96aee4ac5a50e328
	.xword	0x0132e4b3030a6575
	.xword	0x4df20eda8fa93315
	.xword	0xca63634f27b211b1
	.xword	0xf713d8f7aa9c41ae
	.xword	0x60f4ca977ec3a033
	.xword	0x7baae98b8a64385b
	.xword	0x75a792e49e0bc922
	.xword	0xd2f5583293aac394
	.xword	0xd4c9ab399572d894
	.xword	0x179f0b4cfa1c1ca6
	.xword	0x6cb31e9ea22ebba7
	.xword	0xfb1c4d3e5fadd846
	.xword	0xd7843b388af11db6
	.xword	0xc493e1343f9c7915
	.xword	0x61a85a28147f3fb3
	.xword	0xe2e69e2b5e64d081
	.xword	0xd9db4d5c77b500cf
	.xword	0x066775188c31c215
	.xword	0x45c5d4a0adbb26a0
	.xword	0x7b71ea069016fb8f
	.xword	0x542f5a2d2097bb4a
	.xword	0x8df2ea4cd776f4c4
	.xword	0x8352aec4ad50a9b7
	.xword	0x10ff06c04d579b8f
	.xword	0xe420fe7136c83095
	.xword	0x7630b0aee74d608a
	.xword	0xa929d078a5e52e2b
	.xword	0x99d8e0e7fce29864
	.xword	0x49a3c2cf3bb1a2c4
	.xword	0x4380fa74ee62e6f5
	.xword	0xd70dcbabdedc499b
	.xword	0x5e6f101a313a8f19
	.xword	0xeb2ad2f815e0978e
	.xword	0x910deda13b4bf20c
	.xword	0xfa0bd51e022835fc
	.xword	0x3d66203d3a66b30d
	.xword	0xd93309d4aa0317f7
	.xword	0xd4f8962f5ff0913a
	.xword	0x06adbb532f883be0
	.xword	0x1bad0d038a114b68
	.xword	0x5c1ea65403d75b02
	.xword	0xa5e00a60dce0d65d
	.xword	0xa4806814f40a9c15
	.xword	0x412a71f3c9094870
	.xword	0xfbe247aeb4a7a9c4
	.xword	0xf58daad569776f5b
	.xword	0x28923b03736602c5
	.xword	0xbc161855351245cd
	.xword	0x252a7dfc1e9756b2
	.xword	0xf3afa44fea2e926c
	.xword	0x67d27dcd38d87d4b
	.xword	0x1cc24f4f6526fdd3
	.xword	0x5c80e5c5f57657cd
	.xword	0xd6ba61f8a8e91e2b
	.xword	0x0d89fcc841e4f452
	.xword	0xb032250d9e324598
	.xword	0x59469988d2f4bde7
	.xword	0x58b15bda54df9a80
	.xword	0x349a1372c8c7c5ff
	.xword	0xfd599d9d30fa2124
	.xword	0x488e31399e4d12cd
	.xword	0xe0704530a123e1b5
	.xword	0x2e4ff3091d1f406a
	.xword	0x69d5f752b712e8d1
	.xword	0x458487b4eafff34e
	.xword	0xcd314242d8493369
	.xword	0x06304099e10ab39b
	.xword	0x2c4bbe445e859199
	.xword	0xf7a9fbef6d8b6773
	.xword	0x3e2e6c2d7646da78
	.xword	0x18a3f010c39d1c72
	.xword	0x06f1d12f36b143e9
	.xword	0xe6135f98c807f6fa
	.xword	0x64a3493e5b67ce49
	.xword	0x3679fea9b7de8652
	.xword	0xec9526aaff174e71
	.xword	0xbaa600d93686080a
	.xword	0xe3f1b3401af461cf
	.xword	0x7b0020bbaf75ffe4
	.xword	0x4867f05835519147
	.align 0x80000
	.data
data_start_7:

	.xword	0xeede375222e98cae
	.xword	0x7d71386c5f241e69
	.xword	0x9c70048295367471
	.xword	0x8ba1b4131aa73741
	.xword	0x57bc639e0ed6d9bb
	.xword	0xcf4e41e8574a48ab
	.xword	0x2e85cc2a9970e626
	.xword	0x776a0c7c2d286a52
	.xword	0x97aa0c47946fb4ff
	.xword	0x6c73ea82bd5c8529
	.xword	0xd21fbd6b336c4342
	.xword	0xfd5d470acd615e10
	.xword	0x8f61909c548c05bb
	.xword	0x797fb44131b024bf
	.xword	0x67d98ad1850e8783
	.xword	0x4590da47dfaba8a9
	.xword	0x21ef7294cecfc0cf
	.xword	0xb1fc5372742c6c72
	.xword	0xe7aadb09c9096835
	.xword	0xe204c0023b9076d2
	.xword	0xd0ac51581cde09c6
	.xword	0xb62ffa9841c584cb
	.xword	0x90f62bb2c3073667
	.xword	0x1b05a86ced1cb9df
	.xword	0xeb52ba4c11fc7e8b
	.xword	0xc4028d0457814157
	.xword	0x73e2e5f6da7d1a51
	.xword	0x6c312c6cedb59b6c
	.xword	0xd168592600eeaf0d
	.xword	0xd1092b2121848f09
	.xword	0x2f6bd632127c3daa
	.xword	0xd5f34cdbddcbb51f
	.xword	0x7f8a70a31c6c46bd
	.xword	0x6630abf09438e6e2
	.xword	0x58753660f06e8a23
	.xword	0xfad1c04f17365981
	.xword	0xbcddef1a1c604f4e
	.xword	0xac41499e228a23af
	.xword	0xe8a0a6a5d9ca2d39
	.xword	0xfb9d2c049ef4c224
	.xword	0xa19375108fd5baee
	.xword	0xc10b3f25c1e66808
	.xword	0xf5b8037c8d193c4b
	.xword	0x2c5003041ccaa510
	.xword	0xe03db41b98bc79f0
	.xword	0x3cf437c71b59b843
	.xword	0xf71a1e435c2ffd33
	.xword	0x367b9d5c6b28aed0
	.xword	0x86fa313dbea6c547
	.xword	0x6d6a1e26063eff96
	.xword	0x466c01298c2a713a
	.xword	0xfd8dcbba4e17b556
	.xword	0xe039eb3030aec00a
	.xword	0x1a2143d9a9bc6284
	.xword	0x3c09e49c3ecad807
	.xword	0x486558cb9132bf4b
	.xword	0xd51f00731c8e7685
	.xword	0xb52a83fb54d59935
	.xword	0x7b96d2a241cfaa4e
	.xword	0xbb5dff7e4a179266
	.xword	0x8da28a3b1cc1764c
	.xword	0x9433d29d03a655bd
	.xword	0x33260c22665138a3
	.xword	0x5c56f27b72e0d3d2
	.xword	0xeedda190a07b2d97
	.xword	0xfc1e11b3870a5b19
	.xword	0x6abd587821b74557
	.xword	0xe8ec603644819366
	.xword	0x46ede200b259ec5f
	.xword	0x8d949251b6062565
	.xword	0x3ee9ff6a39841f00
	.xword	0xdd82622a71ee7a11
	.xword	0x10c5fda28fc82b07
	.xword	0xef9468da3cede45b
	.xword	0x9c6814cc29c32dfc
	.xword	0x40c3d6cf648d03ce
	.xword	0x703de77a39acaefb
	.xword	0x6d84fd16f4992441
	.xword	0xfbd4bb89977da680
	.xword	0xfc984899922bcb25
	.xword	0xafea0af1a154abb5
	.xword	0x037c9adf8f187433
	.xword	0x38cc43157ca113a0
	.xword	0x0e6fc35776006b6d
	.xword	0x24e7f9d9523a6f43
	.xword	0xf599d85e334c190a
	.xword	0x42138372ee5c877a
	.xword	0x8066a22e2fce6950
	.xword	0x7811f6b0ffbb95a0
	.xword	0xb6fe046f158840ed
	.xword	0x59d2a669794ed92f
	.xword	0x35900b30b85ca170
	.xword	0x6a6dda9cd322a4ea
	.xword	0x2229b1b857d6f8ae
	.xword	0x50e55223f59aa200
	.xword	0xe683e996e0639ff5
	.xword	0x4a60d43e953b92e2
	.xword	0xb12b1bf0c2a03afa
	.xword	0xec2b3f342b47147d
	.xword	0xc0621bbddfe2c129
	.xword	0x9d287f728ffe42f2
	.xword	0xc80ae032985e0aed
	.xword	0x0915dd335de4d959
	.xword	0xfcc890d03360a283
	.xword	0xb17c3e717d0f8109
	.xword	0x84a2c43b01d831ba
	.xword	0xd2df6145835574fb
	.xword	0xef0e699f0c317676
	.xword	0x003e1e3b5a2d82dc
	.xword	0x5aa2422b8010a8d9
	.xword	0x22a7d4bb80508e31
	.xword	0x079b8349e384c99c
	.xword	0x302788b457bd4874
	.xword	0x86e739e280c36d79
	.xword	0xb42f4223905c66bb
	.xword	0x32dabdd8452db17d
	.xword	0xc05e2396de286b5a
	.xword	0x3f2bab4165b2a25f
	.xword	0x67f6930b377edd7f
	.xword	0x3def738fdb514123
	.xword	0x35d51c3123ee4317
	.xword	0x9b316670118bbeab
	.xword	0xc3d9c1e008bf5c65
	.xword	0xa0150bb27027e0cb
	.xword	0xc07d32fd3ead0ca5
	.xword	0x97b7450f0eccf342
	.xword	0x441154bc6ac67530
	.xword	0x6a03b3ddf5221d4a
	.xword	0x1008df41f4cf016a
	.xword	0xd3384e1408f8ea7f
	.xword	0xdf2d604917b2758a
	.xword	0x51f8995a6ac00f64
	.xword	0x1f6f3d8e2b1a6f96
	.xword	0x1609ac8d5ddeb8da
	.xword	0xe7c171fd53954f00
	.xword	0x426895a0de50f1e2
	.xword	0x6736d5b9b462438e
	.xword	0x2385a9b38124f823
	.xword	0xaaaca4605b40a2bb
	.xword	0x1a403268d2984833
	.xword	0x1d70f9ca8ec9ea5c
	.xword	0x9ae07da72530bf40
	.xword	0xca60375f960f5990
	.xword	0xb88bb301514031ed
	.xword	0xccea5432b773db73
	.xword	0xb482ab30aa2db1d0
	.xword	0x142852053ca5310b
	.xword	0x757c9cc69fd5553f
	.xword	0x8b6743cfd554d778
	.xword	0x789eb9774be2ebbe
	.xword	0x6c39d90497633f17
	.xword	0x66edd1c57b50833a
	.xword	0x0096a8241bbb1eae
	.xword	0x346a4558e8cdbd98
	.xword	0x913cb9a7da19998e
	.xword	0xee373c237f06df92
	.xword	0x580d24177c09e464
	.xword	0x9a292d1dc351027e
	.xword	0xb609d6efaececc0b
	.xword	0x116168f29f38a1c9
	.xword	0x3989909894a3d097
	.xword	0x2600a753f1993ea6
	.xword	0xef6063ad2e224d30
	.xword	0x6aeefa9885bda38e
	.xword	0x2f7b722bb57ae61c
	.xword	0x43859b0bef31a920
	.xword	0x7ef2745f4b999322
	.xword	0xae1266a6abd311ab
	.xword	0x29eaa30973ab4bf8
	.xword	0xbb8faad17ef74cc5
	.xword	0x8dff48b2c30f4fcd
	.xword	0x95009aa9b82b8966
	.xword	0x425e259b08b0dcbf
	.xword	0x7e9649b826a30334
	.xword	0xfcd398b617c78415
	.xword	0xdd555510372caa75
	.xword	0x48f6cceef7ada7f4
	.xword	0x90326a58fc29f594
	.xword	0x86e8729d84340450
	.xword	0xd2883ef97d5ba026
	.xword	0xd82aab06d2c6087b
	.xword	0x45a383514cf5afe1
	.xword	0x71bab7aff42ddd22
	.xword	0xfa88f2b8687aa1d5
	.xword	0xead2cacc62864d07
	.xword	0x2259828ab833c155
	.xword	0xd5216396c7167b9c
	.xword	0x20e86593ea99bc82
	.xword	0x592d13a5dfb64d6d
	.xword	0x329878154822ba31
	.xword	0x86e2758ad6365f72
	.xword	0xbd4f59f9593c4582
	.xword	0x72602958755efe2f
	.xword	0x52547474a23184ca
	.xword	0x36de13340110879b
	.xword	0xc74e7c14d5f0e267
	.xword	0x33f712b8db5a9c9d
	.xword	0x73e4d2349bf8f95d
	.xword	0x69c4b38cbac0b881
	.xword	0x1d21d5ca736158c6
	.xword	0x3145f5d903378273
	.xword	0x607bbbff104c69c3
	.xword	0x7570136093004c5e
	.xword	0x4b76abea294b222a
	.xword	0x21ca308c0fc4ba62
	.xword	0xf292092a886efb7e
	.xword	0x56ed774c8b352054
	.xword	0xa74986ad786c2eab
	.xword	0xb6f8be6685a2b349
	.xword	0x89ca20fc0014810a
	.xword	0xaaff5dac90951ec9
	.xword	0x02ee95a08bfc5d13
	.xword	0xb47b0363b9088fc6
	.xword	0x1e80b4db42878eef
	.xword	0x50f2c9615cc14186
	.xword	0xb3b7b128ca1a8838
	.xword	0x85797a38605413fb
	.xword	0x0ea717678fb66ac8
	.xword	0xbd8289cc88760daf
	.xword	0x8908160872bf366a
	.xword	0x7b9a36c0f511382a
	.xword	0x0ed112a35d4575de
	.xword	0xc24ed2ea6589a7bf
	.xword	0x2d906a249ccc410b
	.xword	0x59356a925c635b4c
	.xword	0x744b29d04029bc1c
	.xword	0x53b0b306d1f991df
	.xword	0x8a4bb549592d4947
	.xword	0x82d79140790ada1f
	.xword	0xce7cbcdeedaedae2
	.xword	0x1462562aee84dc09
	.xword	0xa82cf70f51f48634
	.xword	0xc580e3be6f5afaaa
	.xword	0x96064eb38d83f815
	.xword	0x4ac5549f00fff44d
	.xword	0x98685618b46f969f
	.xword	0x710078469b1bfaad
	.xword	0x17870dbc9ef7d373
	.xword	0xbcf8abed6b12a424
	.xword	0x9839956b8a3f3179
	.xword	0xb9af7827aa4bc0fa
	.xword	0xcc745511cc4a08f1
	.xword	0x8d9e6f62e12459f2
	.xword	0x2eb18e616e306bff
	.xword	0xd21431fe71d99193
	.xword	0xcc0da19c1b5d6b93
	.xword	0x149bcd7de7558725
	.xword	0x1ecfddf8d7d3084e
	.xword	0xe828a2493f4ac66f
	.xword	0x4f4146ea132608bd
	.xword	0xbf320605304e3f9e
	.xword	0xc7ff4d493f9496f5
	.xword	0x5cc790c2cdecb64c
	.xword	0x9cf41a4152caeb91
	.xword	0x600c6b11eb29e4e2
	.xword	0xb096a2a191d80a8d



	.text
	ta	T_GOOD_TRAP

#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   int i, j;
!!#   int loop_cnt = 0;
!!# 
!!# 
!!# 
!!# my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data);
!!# 
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_bind_thread_group("diag.j", 34, th_all,  0xf);
!!#   IJ_bind_thread_group("diag.j", 35, th_0,    0x1);
!!#   IJ_bind_thread_group("diag.j", 36, th_1,    0x2);
!!#   IJ_bind_thread_group("diag.j", 37, th_2,    0x4);
!!#   IJ_bind_thread_group("diag.j", 38, th_3,    0x8);
!!#   IJ_bind_thread_group("diag.j", 39, th_2_3,  0xc);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 41,"{16}" );
!!#   IJ_set_rvar ("diag.j", 42, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 43, Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_rvar ("diag.j", 45, Rv_thrdint_param, 
!!#                "46'{0},"     // RSVD0 
!!# 	       "2'brr,"      // Type
!!#                "3'b000,"     // RSVD1 
!!#                "5'brrrrr,"   // THREAD 
!!#                "2'b00,"      // RSVD2
!!#                "6'brr rrrr"  // VECTOR 
!!#               );
!!#   IJ_set_rvar ("diag.j", 53, Rv_ma_cntl, "12'b0001 r100 0000");
!!# 
!!#   // Random data pattern
!!#   IJ_set_rvar ("diag.j", 56, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   // IO HW interrupt vector
!!#   IJ_set_rvar ("diag.j", 59, Rv_intr_vect, "10'brr 00rr rrrr");
!!# 
!!#   // ldst memory address
!!#   IJ_set_rvar ("diag.j", 62, Rv_data_sec, "{0..7}");
!!#   IJ_set_rvar ("diag.j", 63, Rv_ldst_var, "{16..23}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 65, ijdefault, Ft_Rs1, "{16..23}");
!!#   IJ_set_ropr_fld ("diag.j", 66, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 67, ijdefault, Ft_Simm13, "13'b0 000r rrrr rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 68, ijdefault, Ft_Rd, "{24..31}");
!!# 
!!#   // HPSTATE/HTSTATE write data
!!#   IJ_set_rvar ("diag.j", 71, Rv_hpstate, "48'hrrrr rrrr rrrr," "16'brrrr 1rrr rr0r rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 72, Rop_hpstate_rs1, Ft_Rs1, "{10}");
!!#   IJ_set_rvar ("diag.j", 73, Rv_tl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 74, Rop_tl_rs1, Ft_Rs1, "{12}");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 76, th_all, 8, 0, Rv_rand64);
!!# 
!!#   // Floating point register initializaation
!!#   IJ_printf ("diag.j", 79, th_all, "\tta\t%%icc, T_CHANGE_HPRIV\n");
!!#   IJ_printf ("diag.j", 80, th_all, "\twr\t%%g0, 4, %%fprs\n");
!!#   IJ_printf ("diag.j", 81, th_all, "\tsetx\tdata_start_0, %%r1, %%g7\n");
!!#   for (i = 0; i < 32; i++) {
!!# 	IJ_printf  ("diag.j", 83, th_all,"\tldd\t[%%g7+%d], %%f%d\n", (i*8), (i*2));
!!#   }
!!#   IJ_printf ("diag.j", 85, th_all, "\tsetx\tfsr_data, %%r1, %%g7\n");
!!#   IJ_printf ("diag.j", 86, th_all, "\tstx\t%%fsr, [%%g7]\n");
!!#   IJ_printf ("diag.j", 87, th_all, "\tldx\t[%%g7], %%g4\n");
!!#   IJ_printf ("diag.j", 88, th_all, "\tsetx\t%%hi(0x0f000000), %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 89, th_all, "\tor\t%%g4, %%g3, %%g4\n");
!!#   IJ_printf ("diag.j", 90, th_all, "\tstx\t%%g4, [%%g7]\n");
!!#   IJ_printf ("diag.j", 91, th_all, "\tldx\t[%%g7], %%fsr\n");
!!# 
!!#   IJ_th_fork("diag.j", 94,0x2, 0x4, 0x8, -1);;
!!# 
!!#      // Initialize Rs1 (va) for threads 2, 3
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 98, th_2_3, "\tsetx\tdata_start_%d, %%g1, %%r%d\n", i, (16+i));
!!#   }
!!# 
!!#   return 0;
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_th_join("diag.j", 105,0xf);
!!#   IJ_th_start ("diag.j", 106,Seq_Start, NULL, 1);
!!# 
!!#   IJ_printf ("diag.j", 108, th_all, "\t.data\nfsr_data:\n\n");
!!#   IJ_printf  ("diag.j", 109, th_all,"\t.xword\t0x0000000000000000\n");
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 111, th_all, "\t.align 0x%x\n", (1<<(i+12)));
!!#     IJ_printf ("diag.j", 112, th_all, "\t.data\ndata_start_%d:\n\n", i);
!!#     for (j = 0; j < 256; j++) {
!!# 	IJ_printf  ("diag.j", 114, th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!# }
!!# 
!!# %%
!!# %%section map
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# inst_block: inst_type
!!# 	    | inst_block inst_type
!!# ;
!!# 
!!# inst_type: 
!!# 	comm_inst
!!# 	{
!!# 	  IJ_generate ("diag.j", 163, th_all, $1);
!!# 	}
!!# 	| spill_trap 
!!# 	{
!!# 		IJ_generate ("diag.j", 167, th_0, $1);
!!# 	}
!!# 	| fp_all 
!!# 	{
!!# 		IJ_generate ("diag.j", 171, th_1, $1);
!!# 	}
!!# 	| load 
!!# 	{
!!# 		IJ_generate ("diag.j", 175, th_2, $1);
!!# 	}
!!# 	| store
!!# 	{
!!# 		IJ_generate ("diag.j", 179, th_3, $1);
!!# 	}
!!# 	| set_va %rvar  Rv_low_wt
!!# 	{
!!# 		IJ_generate ("diag.j", 183, th_2_3, $1);
!!# 	}
!!# 	| write_hpstate %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_generate ("diag.j", 187, th_all, $1);
!!# 	}
!!# ;
!!# 
!!# comm_inst:
!!# 	hw_intr
!!# 	| write_priv_asr
!!# 	| read_priv_asr
!!# 	| alu
!!# 	| spu_rsrv_illgl %rvar  Rv_low_wt
!!# 	| cntx_demap %rvar  Rv_low_wt
!!# ;
!!# 
!!# set_va: mSET_VA
!!# 	{
!!# 	  IJ_printf ("diag.j", 202, th_all, "\tsetx\tdata_start_%rd, %%g1, %%r%rd\n", Rv_data_sec, Rv_ldst_var);
!!#         } ;
!!# 
!!# write_hpstate:
!!# 	tWRHPR_HPSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 208, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
!!#         }
!!# 	| tWRHPR_HTSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 212, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
!!#         }
!!# ;
!!# 
!!# write_priv_asr:
!!# 	tWRPR_PSTATE_I
!!# 	| tWRPR_TPC_I 
!!# 	| tWRPR_TNPC_I 
!!# 	| tWRPR_TSTATE_I 
!!# 	| tWRPR_TT_I
!!# 	| tWRPR_TICK_I
!!# 	| tWRPR_TL_R %ropr  Rop_tl_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 225, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_GL_R %ropr  Rop_tl_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 229, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_PIL_I
!!# ;
!!# 
!!# read_priv_asr: 
!!# 	tRDPR_PSTATE
!!# 	| tRDHPR_HPSTATE
!!# 	| tRDPR_TPC 
!!# 	| tRDPR_TNPC 
!!# 	| tRDPR_TSTATE 
!!# 	| tRDPR_TT
!!# 	| tRDPR_TICK
!!# 	| tRDPR_TL
!!# 	| tRDPR_GL
!!# 	| tRDPR_PIL
!!# ;
!!# 
!!# load:	
!!# 	tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R | tLDD_R 
!!# 	| tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I | tLDD_I
!!# 	| tLDDF_I | tLDDF_R
!!# ;
!!# 
!!# store:
!!# 	tSTB_R | tSTH_R | tSTW_R | tSTX_R | tSTD_R | tSTB_I | tSTH_I 
!!# 	| tSTW_I | tSTX_I | tSTD_I 
!!# 	| tSTDF_I | tSTDF_R
!!# ;
!!# 
!!# fp_all:	fp_arith | fmov
!!# ;
!!# 
!!# fp_arith:
!!# 	tFADDs | tFADDd | tFADDq | tFSUBs | tFSUBd | tFSUBq | tFMULs | tFMULd | 
!!# 	tFMULq | tFDIVs | tFDIVd | tFDIVq | tFSQRTs | tFSQRTd | tFSQRTq
!!# ;
!!# 
!!# fmov:	tFMOVs | tFMOVd | tFMOVRLEZ | tFMOVRLZ | tFMOVRNZ | tFMOVRGZ | 
!!# 	tFMOVRGEZ | tFMOVA  | tFMOVN   | tFMOVNE  | tFMOVE   | tFMOVG  | 
!!# 	tFMOVLE | tFMOVGE | tFMOVL   | tFMOVGU  | tFMOVLEU | tFMOVCC | 
!!# 	tFMOVCS | tFMOVPOS | tFMOVNEG | tFMOVVC | tFMOVVS  | tFMOVRZ
!!# ;
!!# 
!!# spill_trap:
!!# 	tSAVE_I
!!# ;
!!# 
!!# cntx_demap: itlb_demap | dtlb_demap
!!# ;
!!# 
!!# itlb_demap: mIDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 283, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 284, th_all, "\tmov\t0, %%g1\n");
!!#           IJ_printf ("diag.j", 285, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 286, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 287, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	};
!!# 
!!# dtlb_demap: mDDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 292, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 293, th_all, "\tmov\t8, %%g1\n");
!!#           IJ_printf ("diag.j", 294, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 295, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 296, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           IJ_printf ("diag.j", 297, th_all, "\tflush\n");
!!# 	};
!!# 
!!# alu:	tADD_R | tADD_I | tADDcc_R | tADDcc_I | tADDC_R | tADDC_I | tADDCcc_R | tADDCcc_I 
!!# 	| tSUB_R | tSUB_I | tSUBcc_R | tSUBcc_I | tSUBC_R | tSUBC_I | tSUBCcc_R | tSUBCcc_I 
!!# 	| tAND_R | tAND_I | tANDcc_R | tANDcc_I | tANDN_R | tANDN_I | tANDNcc_R 
!!# 	| tANDNcc_I | tOR_R | tOR_I | tORcc_R | tORcc_I | tORN_R | tORN_I | tORNcc_R | tORNcc_I 
!!# 	| tXOR_R | tXOR_I | tXORcc_R | tXORcc_I | tXNOR_R | tXNOR_I | tXNORcc_R | tXNORcc_I 
!!# 	| tMOVR_R | tMOVR_I | tMOVcc_R | tMOVcc_I | tSRL_R | tSRL_I | tSRA_R | tSRA_I | tSRLX_R 
!!# 	| tSRLX_I | tSRAX_R | tSRAX_I | tSLL_R | tSLL_I | tSLLX_R | tSLLX_I
!!# ;
!!# 
!!# spu_rsrv_illgl: mSPU_ILLGL
!!# 	{
!!# 	  IJ_printf ("diag.j", 311, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 312, th_all, "\tmov\t0x80, %%g1\n");
!!# 	  IJ_printf ("diag.j", 313, th_all, "\tmov\t0x%rx, %%g2\n", Rv_ma_cntl);
!!# 	  IJ_printf ("diag.j", 314, th_all, "\tstxa\t%%g2, [%%g1] 0x40\n");
!!# 	  IJ_printf ("diag.j", 315, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#         }
!!# ;
!!# hw_intr:
!!# 	mHWINTR %rvar  Rv_low_wt
!!#         {
!!#           IJ_printf ("diag.j", 321, th_all, "\tmov\t0x%rx, %%o0\n", Rv_intr_vect);
!!#           IJ_printf ("diag.j", 322, th_all, "\tta\tT_SEND_THRD_INTR\n");
!!#         }
!!# ;
!!# 
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif
