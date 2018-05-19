// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_byp_rcc_1.s
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
   random seed:	458679199
   Jal exu_byp_rcc_mulhit.j:	
********************************************************************************/



#define ENABLE_T0_Fp_disabled_0x20
#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:
		wr    %g0, 7, %fprs


! Register init code

	setx 0x7cae38c8a9c6907d, %g1, %g0
	setx 0xfe910c756d380b7d, %g1, %g1
	setx 0xd4de0a1b37ac9b46, %g1, %g2
	setx 0xfb7bc82a267b27b6, %g1, %g3
	setx 0x4a5a1d9cdf70a204, %g1, %g4
	setx 0xf695da6961aef407, %g1, %g5
	setx 0xe450ddb507a9b17e, %g1, %g6
	setx 0xf14f007f125d92a8, %g1, %g7
	setx 0x5ca59d0d58799768, %g1, %r16
	setx 0xcfb5975375e02140, %g1, %r17
	setx 0x39f6f75e7d5c8faa, %g1, %r18
	setx 0x571985d7c1b201e5, %g1, %r19
	setx 0xdb3a857cca8af911, %g1, %r20
	setx 0x57452eb7a06c2291, %g1, %r21
	setx 0xbb8b548938b80b3a, %g1, %r22
	setx 0x725e58b8b4ff38e9, %g1, %r23
	setx 0x772ef26fdcae3e58, %g1, %r24
	setx 0x34958ef1ab3a0f9c, %g1, %r25
	setx 0x68fc6ecf6fd085d7, %g1, %r26
	setx 0x92fe78bf1fd95689, %g1, %r27
	setx 0x60f4de165b7d389b, %g1, %r28
	setx 0x33e306057ef8e42d, %g1, %r29
	setx 0x04882551e40ab96d, %g1, %r30
	setx 0xd0c93f79b729d85b, %g1, %r31
	save
	setx 0x6cc309f7edac9549, %g1, %r16
	setx 0x8f161d041f114ada, %g1, %r17
	setx 0x41a26f58010f74d6, %g1, %r18
	setx 0xb004c55cd144fcea, %g1, %r19
	setx 0xf8091482383894a5, %g1, %r20
	setx 0xc450d8fb99ed585f, %g1, %r21
	setx 0xd42f48d165de5711, %g1, %r22
	setx 0x9fe248540729ee6f, %g1, %r23
	setx 0x927aa021b788cfff, %g1, %r24
	setx 0x8f55149c83b16304, %g1, %r25
	setx 0xf224bb4c4aa0b51a, %g1, %r26
	setx 0x769ef6b84315e02f, %g1, %r27
	setx 0x0763861f4c0060a0, %g1, %r28
	setx 0xa14a8d751dfb0212, %g1, %r29
	setx 0xd9638b8970f592e6, %g1, %r30
	setx 0x02ceac90752dc3a3, %g1, %r31
	restore
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x1
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	setx	t3_data_start_0,%g0, %r1
	add	%r1,0,%r2
	add	%g0,0,%r3
	.word 0xa97cfa33  ! 1: MOVR_I	movneg	%r19, 0x1, %r20
	.word 0x0acd0003  ! 2: BRNZ	brnz  ,pt	%r20,<label_0xd0003>
	.word 0xe4588003  ! 3: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe8588003  ! 4: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa97caf1b  ! 5: MOVR_I	movl	%r18, 0x1, %r20
	.word 0x06c4c002  ! 6: BRLZ	brlz  ,nt	%r19,<label_0x4c002>
	.word 0xe4708003  ! 7: STX_R	stx	%r18, [%r2 + %r3]
	.word 0x2ac48001  ! 8: BRNZ	brnz,a,nt	%r18,<label_0x48001>
	.word 0xe858a058  ! 9: LDX_I	ldx	[%r2 + 0x0058], %r20
	.word 0xa57ce8a2  ! 10: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xe400a090  ! 11: LDUW_I	lduw	[%r2 + 0x0090], %r18
	.word 0xa77c9c12  ! 12: MOVR_R	movvs	%r18, %r18, %r19
	.word 0xe4008003  ! 13: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa97ca7db  ! 14: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa77d0412  ! 15: MOVR_R	move	%r20, %r18, %r19
	.word 0xe4388003  ! 16: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa80cc012  ! 17: AND_R	and 	%r19, %r18, %r20
	.word 0xa40c8012  ! 18: AND_R	and 	%r18, %r18, %r18
	.word 0xe4708003  ! 19: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa57cf8bb  ! 20: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0xa64d0012  ! 21: MULX_R	mulx 	%r20, %r18, %r19
	.word 0xa57d0812  ! 22: MOVR_R	movle	%r20, %r18, %r18
	.word 0xa57caced  ! 23: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57ca80c  ! 24: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xe8188003  ! 25: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xa57c9c13  ! 26: MOVR_R	movvs	%r18, %r19, %r18
	.word 0xa44c8012  ! 27: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xa77ccc13  ! 28: MOVR_R	movl	%r19, %r19, %r19
	.word 0xa57c8412  ! 29: MOVR_R	move	%r18, %r18, %r18
	.word 0xa8150012  ! 30: OR_R	or 	%r20, %r18, %r20
	.word 0xe4708003  ! 31: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa80c8012  ! 32: AND_R	and 	%r18, %r18, %r20
	.word 0xa77cabbd  ! 33: MOVR_I	movle	%r18, 0x1, %r19
	.word 0x02cd0003  ! 34: BRZ	brz  ,pt	%r20,<label_0xd0003>
	.word 0xe4388003  ! 35: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa60c8012  ! 36: AND_R	and 	%r18, %r18, %r19
	.word 0x0ec4c003  ! 37: BRGEZ	brgez  ,nt	%r19,<label_0x4c003>
	.word 0xa57d25f9  ! 38: MOVR_I	move	%r20, 0x1, %r18
	.word 0xa60cc012  ! 39: AND_R	and 	%r19, %r18, %r19
	.word 0xa44cc012  ! 40: MULX_R	mulx 	%r19, %r18, %r18
	.word 0xe470a0d8  ! 41: STX_I	stx	%r18, [%r2 + 0x00d8]
	.word 0xe4588003  ! 42: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe870a038  ! 43: STX_I	stx	%r20, [%r2 + 0x0038]
	.word 0xe870a058  ! 44: STX_I	stx	%r20, [%r2 + 0x0058]
	.word 0xe4408003  ! 45: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa97ced3c  ! 46: MOVR_I	movl	%r19, 0x1, %r20
	.word 0xa77caa21  ! 47: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa44cc012  ! 48: MULX_R	mulx 	%r19, %r18, %r18
	.word 0xe470a048  ! 49: STX_I	stx	%r18, [%r2 + 0x0048]
	.word 0xe440a0b8  ! 50: LDSW_I	ldsw	[%r2 + 0x00b8], %r18
	.word 0xe470a030  ! 51: STX_I	stx	%r18, [%r2 + 0x0030]
	.word 0x0cc50003  ! 52: BRGZ	brgz  ,nt	%r20,<label_0x50003>
	.word 0xe400a008  ! 53: LDUW_I	lduw	[%r2 + 0x0008], %r18
	.word 0xe4588003  ! 54: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x86002048  ! 56: ADD_I	add 	%r0, 0x0048, %r3
	.word 0xa57caa74  ! 57: MOVR_I	movle	%r18, 0x1, %r18
	.word 0x24c4c002  ! 58: BRLEZ	brlez,a,nt	%r19,<label_0x4c002>
	.word 0xa77cabd5  ! 59: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa97d1c12  ! 60: MOVR_R	movvs	%r20, %r18, %r20
	.word 0xa77cb635  ! 61: MOVR_I	movcs	%r18, 0x1, %r19
	.word 0x24c4c003  ! 62: BRLEZ	brlez,a,nt	%r19,<label_0x4c003>
	.word 0xe8008003  ! 63: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe4388003  ! 64: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa804c013  ! 65: ADD_R	add 	%r19, %r19, %r20
	.word 0xa6050012  ! 66: ADD_R	add 	%r20, %r18, %r19
	.word 0xa4048013  ! 67: ADD_R	add 	%r18, %r19, %r18
	.word 0xa77c8c12  ! 68: MOVR_R	movl	%r18, %r18, %r19
	.word 0xa57c8412  ! 69: MOVR_R	move	%r18, %r18, %r18
	.word 0x0acc8002  ! 70: BRNZ	brnz  ,pt	%r18,<label_0xc8002>
	.word 0x0cc48002  ! 71: BRGZ	brgz  ,nt	%r18,<label_0x48002>
	.word 0x86002000  ! 73: ADD_I	add 	%r0, 0x0000, %r3
	.word 0xe458a010  ! 74: LDX_I	ldx	[%r2 + 0x0010], %r18
	.word 0xa414c012  ! 75: OR_R	or 	%r19, %r18, %r18
	.word 0xe8388003  ! 76: STD_R	std	%r20, [%r2 + %r3]
	.word 0xe4188003  ! 77: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xe418a0c0  ! 78: LDD_I	ldd	[%r2 + 0x00c0], %r18
	.word 0x0ac4c002  ! 79: BRNZ	brnz  ,nt	%r19,<label_0x4c002>
	.word 0xa57c8413  ! 80: MOVR_R	move	%r18, %r19, %r18
	.word 0xa604c013  ! 81: ADD_R	add 	%r19, %r19, %r19
	.word 0xa97cf57c  ! 82: MOVR_I	movcs	%r19, 0x1, %r20
	.word 0xa77c9c12  ! 83: MOVR_R	movvs	%r18, %r18, %r19
	.word 0xa8048012  ! 84: ADD_R	add 	%r18, %r18, %r20
	.word 0xe440a0e8  ! 85: LDSW_I	ldsw	[%r2 + 0x00e8], %r18
	.word 0xa44c8013  ! 86: MULX_R	mulx 	%r18, %r19, %r18
	.word 0xe4708003  ! 87: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe400a0a0  ! 88: LDUW_I	lduw	[%r2 + 0x00a0], %r18
	.word 0xa57cee57  ! 89: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xa57d1c12  ! 90: MOVR_R	movvs	%r20, %r18, %r18
	.word 0xa57d3931  ! 91: MOVR_I	movneg	%r20, 0x1, %r18
	.word 0xa77c8412  ! 92: MOVR_R	move	%r18, %r18, %r19
	.word 0xa77cbc1d  ! 93: MOVR_I	movvs	%r18, 0x1, %r19
	.word 0xa57d2f1d  ! 94: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa97c8c12  ! 95: MOVR_R	movl	%r18, %r18, %r20
	.word 0xe4588003  ! 96: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57c9812  ! 97: MOVR_R	movneg	%r18, %r18, %r18
	.word 0xe440a0b0  ! 98: LDSW_I	ldsw	[%r2 + 0x00b0], %r18
	.word 0x84006600  ! 100: ADD_I	add 	%r1, 0x0600, %r2
	.word 0xa97ca76e  ! 101: MOVR_I	move	%r18, 0x1, %r20
	.word 0xe440a0c0  ! 102: LDSW_I	ldsw	[%r2 + 0x00c0], %r18
	.word 0xe870a0e0  ! 103: STX_I	stx	%r20, [%r2 + 0x00e0]
	.word 0xa57d2f7f  ! 104: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa4148013  ! 105: OR_R	or 	%r18, %r19, %r18
	.word 0xa97c8c12  ! 106: MOVR_R	movl	%r18, %r18, %r20
	.word 0x06c50001  ! 107: BRLZ	brlz  ,nt	%r20,<label_0x50001>
	.word 0xe470a0c0  ! 108: STX_I	stx	%r18, [%r2 + 0x00c0]
	.word 0xe4588003  ! 109: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57c8812  ! 110: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa57cc813  ! 111: MOVR_R	movle	%r19, %r19, %r18
	.word 0xa57d0413  ! 112: MOVR_R	move	%r20, %r19, %r18
	.word 0xa57c8412  ! 113: MOVR_R	move	%r18, %r18, %r18
	.word 0xa57d2d7f  ! 114: MOVR_I	movl	%r20, 0x1, %r18
	.word 0x06c4c002  ! 115: BRLZ	brlz  ,nt	%r19,<label_0x4c002>
	.word 0xa57c9812  ! 116: MOVR_R	movneg	%r18, %r18, %r18
	.word 0xa6148012  ! 117: OR_R	or 	%r18, %r18, %r19
	.word 0xa77d1413  ! 118: MOVR_R	movcs	%r20, %r19, %r19
	.word 0xa60cc012  ! 119: AND_R	and 	%r19, %r18, %r19
	.word 0xa40cc012  ! 120: AND_R	and 	%r19, %r18, %r18
	.word 0xa57d1813  ! 121: MOVR_R	movneg	%r20, %r19, %r18
	.word 0xe4408003  ! 122: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa97d258a  ! 123: MOVR_I	move	%r20, 0x1, %r20
	.word 0xa97c8413  ! 124: MOVR_R	move	%r18, %r19, %r20
	.word 0xa77ceb61  ! 125: MOVR_I	movle	%r19, 0x1, %r19
	.word 0xe818a058  ! 126: LDD_I	ldd	[%r2 + 0x0058], %r20
	.word 0xa57ca405  ! 127: MOVR_I	move	%r18, 0x1, %r18
	.word 0xe4708003  ! 128: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe440a068  ! 129: LDSW_I	ldsw	[%r2 + 0x0068], %r18
	.word 0xa57c8c13  ! 130: MOVR_R	movl	%r18, %r19, %r18
	.word 0xa77d0812  ! 131: MOVR_R	movle	%r20, %r18, %r19
	.word 0xa57d0c12  ! 132: MOVR_R	movl	%r20, %r18, %r18
	.word 0xe800a0f8  ! 133: LDUW_I	lduw	[%r2 + 0x00f8], %r20
	.word 0xe818a000  ! 134: LDD_I	ldd	[%r2 + 0x0000], %r20
	.word 0xa97d0813  ! 135: MOVR_R	movle	%r20, %r19, %r20
	.word 0xa424c013  ! 136: SUB_R	sub 	%r19, %r19, %r18
	.word 0xa57d0c12  ! 137: MOVR_R	movl	%r20, %r18, %r18
	.word 0xa57cc413  ! 138: MOVR_R	move	%r19, %r19, %r18
	.word 0xa97ca782  ! 139: MOVR_I	move	%r18, 0x1, %r20
	.word 0x860020b8  ! 141: ADD_I	add 	%r0, 0x00b8, %r3
	.word 0xa97c9812  ! 142: MOVR_R	movneg	%r18, %r18, %r20
	.word 0x860020a8  ! 144: ADD_I	add 	%r0, 0x00a8, %r3
	.word 0xa57c9812  ! 145: MOVR_R	movneg	%r18, %r18, %r18
	.word 0xa57cff6d  ! 146: MOVR_I	movvs	%r19, 0x1, %r18
	.word 0xe8008003  ! 147: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0x0ec48002  ! 148: BRGEZ	brgez  ,nt	%r18,<label_0x48002>
	.word 0xe4588003  ! 149: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa77c9812  ! 150: MOVR_R	movneg	%r18, %r18, %r19
	.word 0xe8188003  ! 151: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xe440a078  ! 152: LDSW_I	ldsw	[%r2 + 0x0078], %r18
	.word 0x86002030  ! 154: ADD_I	add 	%r0, 0x0030, %r3
	.word 0xe470a030  ! 155: STX_I	stx	%r18, [%r2 + 0x0030]
	.word 0xe4008003  ! 156: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa57ca6c9  ! 157: MOVR_I	move	%r18, 0x1, %r18
	.word 0xe840a048  ! 158: LDSW_I	ldsw	[%r2 + 0x0048], %r20
	.word 0xa77ca51d  ! 159: MOVR_I	move	%r18, 0x1, %r19
	.word 0xe4388003  ! 160: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa57cf473  ! 161: MOVR_I	movcs	%r19, 0x1, %r18
	.word 0xa97d0413  ! 162: MOVR_R	move	%r20, %r19, %r20
	.word 0xa77d1412  ! 163: MOVR_R	movcs	%r20, %r18, %r19
	.word 0xe470a0b8  ! 164: STX_I	stx	%r18, [%r2 + 0x00b8]
	.word 0xa57d242f  ! 165: MOVR_I	move	%r20, 0x1, %r18
	.word 0xa57c9c13  ! 166: MOVR_R	movvs	%r18, %r19, %r18
	.word 0x0ec48001  ! 167: BRGEZ	brgez  ,nt	%r18,<label_0x48001>
	.word 0xa57caabd  ! 168: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xe840a018  ! 169: LDSW_I	ldsw	[%r2 + 0x0018], %r20
	.word 0xa77c8c13  ! 170: MOVR_R	movl	%r18, %r19, %r19
	.word 0xa57cac15  ! 171: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa624c013  ! 172: SUB_R	sub 	%r19, %r19, %r19
	.word 0xe440a038  ! 173: LDSW_I	ldsw	[%r2 + 0x0038], %r18
	.word 0x04c48001  ! 174: BRLEZ	brlez  ,nt	%r18,<label_0x48001>
	.word 0xe440a0a8  ! 175: LDSW_I	ldsw	[%r2 + 0x00a8], %r18
	.word 0xa57c9812  ! 176: MOVR_R	movneg	%r18, %r18, %r18
	.word 0xe4708003  ! 177: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa77ca6ae  ! 178: MOVR_I	move	%r18, 0x1, %r19
	.word 0xe418a020  ! 179: LDD_I	ldd	[%r2 + 0x0020], %r18
	.word 0xa57cbf0e  ! 180: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa77ca8bf  ! 181: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa57c9812  ! 182: MOVR_R	movneg	%r18, %r18, %r18
	.word 0xa57ca520  ! 183: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa97c9412  ! 184: MOVR_R	movcs	%r18, %r18, %r20
	.word 0xa57d3e73  ! 185: MOVR_I	movvs	%r20, 0x1, %r18
	.word 0xa4148012  ! 186: OR_R	or 	%r18, %r18, %r18
	.word 0xa414c013  ! 187: OR_R	or 	%r19, %r19, %r18
	.word 0xa77ca6bb  ! 188: MOVR_I	move	%r18, 0x1, %r19
	.word 0xa77c9c12  ! 189: MOVR_R	movvs	%r18, %r18, %r19
	.word 0xa57ca4eb  ! 190: MOVR_I	move	%r18, 0x1, %r18
	.word 0xe470a0a8  ! 191: STX_I	stx	%r18, [%r2 + 0x00a8]
	.word 0xa80c8012  ! 192: AND_R	and 	%r18, %r18, %r20
	.word 0xa77cea21  ! 193: MOVR_I	movle	%r19, 0x1, %r19
	.word 0x86002090  ! 195: ADD_I	add 	%r0, 0x0090, %r3
	.word 0xa57d0c12  ! 196: MOVR_R	movl	%r20, %r18, %r18
	.word 0xa57d39a8  ! 197: MOVR_I	movneg	%r20, 0x1, %r18
	.word 0xa97d0812  ! 198: MOVR_R	movle	%r20, %r18, %r20
	.word 0x0cc48002  ! 199: BRGZ	brgz  ,nt	%r18,<label_0x48002>
	.word 0xa84d0012  ! 200: MULX_R	mulx 	%r20, %r18, %r20
	.word 0xe818a078  ! 201: LDD_I	ldd	[%r2 + 0x0078], %r20
	.word 0xa57c9812  ! 202: MOVR_R	movneg	%r18, %r18, %r18
	.word 0xa57ccc13  ! 203: MOVR_R	movl	%r19, %r19, %r18
	.word 0xa64c8012  ! 204: MULX_R	mulx 	%r18, %r18, %r19
	.word 0xa97c9813  ! 205: MOVR_R	movneg	%r18, %r19, %r20
	.word 0xa97d0813  ! 206: MOVR_R	movle	%r20, %r19, %r20
	.word 0xe4588003  ! 207: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa97c8c12  ! 208: MOVR_R	movl	%r18, %r18, %r20
	.word 0xa57cbe17  ! 209: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa97d3651  ! 210: MOVR_I	movcs	%r20, 0x1, %r20
	.word 0xa77cb831  ! 211: MOVR_I	movneg	%r18, 0x1, %r19
	.word 0x0ecc8002  ! 212: BRGEZ	brgez  ,pt	%r18,<label_0xc8002>
	.word 0xe470a070  ! 213: STX_I	stx	%r18, [%r2 + 0x0070]
	.word 0xa6248012  ! 214: SUB_R	sub 	%r18, %r18, %r19
	.word 0xe4008003  ! 215: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa4248012  ! 216: SUB_R	sub 	%r18, %r18, %r18
	.word 0xa97d1812  ! 217: MOVR_R	movneg	%r20, %r18, %r20
	.word 0xe8588003  ! 218: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe400a0f8  ! 219: LDUW_I	lduw	[%r2 + 0x00f8], %r18
	.word 0xa6248012  ! 220: SUB_R	sub 	%r18, %r18, %r19
	.word 0xa77cebfc  ! 221: MOVR_I	movle	%r19, 0x1, %r19
	.word 0xa57c8812  ! 222: MOVR_R	movle	%r18, %r18, %r18
	.word 0xe4588003  ! 223: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa97d36eb  ! 224: MOVR_I	movcs	%r20, 0x1, %r20
	.word 0x84006900  ! 226: ADD_I	add 	%r1, 0x0900, %r2
	.word 0xe418a0c0  ! 227: LDD_I	ldd	[%r2 + 0x00c0], %r18
	.word 0xa57cd413  ! 228: MOVR_R	movcs	%r19, %r19, %r18
	.word 0x26c50003  ! 229: BRLZ	brlz,a,nt	%r20,<label_0x50003>
	.word 0xa64cc013  ! 230: MULX_R	mulx 	%r19, %r19, %r19
	.word 0xa57cc812  ! 231: MOVR_R	movle	%r19, %r18, %r18
	.word 0xa57caf32  ! 232: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa4048012  ! 233: ADD_R	add 	%r18, %r18, %r18
	.word 0x06cc8001  ! 234: BRLZ	brlz  ,pt	%r18,<label_0xc8001>
	.word 0xa40d0012  ! 235: AND_R	and 	%r20, %r18, %r18
	.word 0xa97cba26  ! 236: MOVR_I	movneg	%r18, 0x1, %r20
	.word 0xa57d2d30  ! 237: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa57d0813  ! 238: MOVR_R	movle	%r20, %r19, %r18
	.word 0x860020f0  ! 240: ADD_I	add 	%r0, 0x00f0, %r3
	.word 0xe8408003  ! 241: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0x84006100  ! 243: ADD_I	add 	%r1, 0x0100, %r2
	.word 0xa97cf4b3  ! 244: MOVR_I	movcs	%r19, 0x1, %r20
	.word 0xe458a0f0  ! 245: LDX_I	ldx	[%r2 + 0x00f0], %r18
	.word 0xa57cd412  ! 246: MOVR_R	movcs	%r19, %r18, %r18
	.word 0xa57cd412  ! 247: MOVR_R	movcs	%r19, %r18, %r18
	.word 0xe400a0c8  ! 248: LDUW_I	lduw	[%r2 + 0x00c8], %r18
	.word 0x2ec50003  ! 249: BRGEZ	brgez,a,nt	%r20,<label_0x50003>
	.word 0xa57cc412  ! 250: MOVR_R	move	%r19, %r18, %r18
	.word 0xa77caf8b  ! 251: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xa57ce5d9  ! 252: MOVR_I	move	%r19, 0x1, %r18
	.word 0x860020e8  ! 254: ADD_I	add 	%r0, 0x00e8, %r3
	.word 0xe440a0c8  ! 255: LDSW_I	ldsw	[%r2 + 0x00c8], %r18
	.word 0xe400a010  ! 256: LDUW_I	lduw	[%r2 + 0x0010], %r18
	.word 0x26c50003  ! 257: BRLZ	brlz,a,nt	%r20,<label_0x50003>
	.word 0xa77c9c13  ! 258: MOVR_R	movvs	%r18, %r19, %r19
	.word 0xa57cadf2  ! 259: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xe400a048  ! 260: LDUW_I	lduw	[%r2 + 0x0048], %r18
	.word 0x0cc48003  ! 261: BRGZ	brgz  ,nt	%r18,<label_0x48003>
	.word 0xa4250013  ! 262: SUB_R	sub 	%r20, %r19, %r18
	.word 0xa57ca9eb  ! 263: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xe4188003  ! 264: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xe8408003  ! 265: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xe418a0d8  ! 266: LDD_I	ldd	[%r2 + 0x00d8], %r18
	.word 0xe4188003  ! 267: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xe418a0c0  ! 268: LDD_I	ldd	[%r2 + 0x00c0], %r18
	.word 0xa57cfb39  ! 269: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0xe4408003  ! 270: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe470a048  ! 271: STX_I	stx	%r18, [%r2 + 0x0048]
	.word 0xe458a0e8  ! 272: LDX_I	ldx	[%r2 + 0x00e8], %r18
	.word 0xa97d2a61  ! 273: MOVR_I	movle	%r20, 0x1, %r20
	.word 0xa97cd812  ! 274: MOVR_R	movneg	%r19, %r18, %r20
	.word 0xa57ce654  ! 275: MOVR_I	move	%r19, 0x1, %r18
	.word 0xa57c9412  ! 276: MOVR_R	movcs	%r18, %r18, %r18
	.word 0xe4708003  ! 277: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa57cbe6e  ! 278: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa57cbc10  ! 279: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xe4708003  ! 280: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa77c8812  ! 281: MOVR_R	movle	%r18, %r18, %r19
	.word 0xe440a018  ! 282: LDSW_I	ldsw	[%r2 + 0x0018], %r18
	.word 0x0ec4c002  ! 283: BRGEZ	brgez  ,nt	%r19,<label_0x4c002>
	.word 0xa4048012  ! 284: ADD_R	add 	%r18, %r18, %r18
	.word 0xa77d1c13  ! 285: MOVR_R	movvs	%r20, %r19, %r19
	.word 0xa4248012  ! 286: SUB_R	sub 	%r18, %r18, %r18
	.word 0xa97c9812  ! 287: MOVR_R	movneg	%r18, %r18, %r20
	.word 0xa57c8412  ! 288: MOVR_R	move	%r18, %r18, %r18
	.word 0xe458a0b0  ! 289: LDX_I	ldx	[%r2 + 0x00b0], %r18
	.word 0xa57cedc7  ! 290: MOVR_I	movl	%r19, 0x1, %r18
	.word 0x86002080  ! 292: ADD_I	add 	%r0, 0x0080, %r3
	.word 0xa57ce4b4  ! 293: MOVR_I	move	%r19, 0x1, %r18
	.word 0x0cc48003  ! 294: BRGZ	brgz  ,nt	%r18,<label_0x48003>
	.word 0xa40c8013  ! 295: AND_R	and 	%r18, %r19, %r18
	.word 0xa6250013  ! 296: SUB_R	sub 	%r20, %r19, %r19
	.word 0x86002068  ! 298: ADD_I	add 	%r0, 0x0068, %r3
	.word 0x04c50003  ! 299: BRLEZ	brlez  ,nt	%r20,<label_0x50003>
	.word 0x0ac48002  ! 300: BRNZ	brnz  ,nt	%r18,<label_0x48002>
	.word 0xe800a020  ! 301: LDUW_I	lduw	[%r2 + 0x0020], %r20
	.word 0xe840a000  ! 302: LDSW_I	ldsw	[%r2 + 0x0000], %r20
	.word 0xa77c8412  ! 303: MOVR_R	move	%r18, %r18, %r19
	.word 0xe858a020  ! 304: LDX_I	ldx	[%r2 + 0x0020], %r20
	.word 0xa57d1412  ! 305: MOVR_R	movcs	%r20, %r18, %r18
	.word 0xa77c8c12  ! 306: MOVR_R	movl	%r18, %r18, %r19
	.word 0xe4008003  ! 307: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa77c9412  ! 308: MOVR_R	movcs	%r18, %r18, %r19
	.word 0xa97cd412  ! 309: MOVR_R	movcs	%r19, %r18, %r20
	.word 0xa6050012  ! 310: ADD_R	add 	%r20, %r18, %r19
	.word 0x06cc8003  ! 311: BRLZ	brlz  ,pt	%r18,<label_0xc8003>
	.word 0x22c50002  ! 312: BRZ	brz,a,nt	%r20,<label_0x50002>
	.word 0xa77ccc12  ! 313: MOVR_R	movl	%r19, %r18, %r19
	.word 0xa57d245c  ! 314: MOVR_I	move	%r20, 0x1, %r18
	.word 0xa57c8412  ! 315: MOVR_R	move	%r18, %r18, %r18
	.word 0x06c50001  ! 316: BRLZ	brlz  ,nt	%r20,<label_0x50001>
	.word 0xe458a030  ! 317: LDX_I	ldx	[%r2 + 0x0030], %r18
	.word 0xa40d0012  ! 318: AND_R	and 	%r20, %r18, %r18
	.word 0x86002010  ! 320: ADD_I	add 	%r0, 0x0010, %r3
	.word 0xa97ce7d5  ! 321: MOVR_I	move	%r19, 0x1, %r20
	.word 0xa77ce869  ! 322: MOVR_I	movle	%r19, 0x1, %r19
	.word 0xa57cec3a  ! 323: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xa57ca47c  ! 324: MOVR_I	move	%r18, 0x1, %r18
	.word 0xe4588003  ! 325: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe8408003  ! 326: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xe870a0c0  ! 327: STX_I	stx	%r20, [%r2 + 0x00c0]
	.word 0xa84cc013  ! 328: MULX_R	mulx 	%r19, %r19, %r20
	.word 0xa40cc012  ! 329: AND_R	and 	%r19, %r18, %r18
	.word 0xa97cc812  ! 330: MOVR_R	movle	%r19, %r18, %r20
	.word 0xa814c013  ! 331: OR_R	or 	%r19, %r19, %r20
	.word 0xa44d0013  ! 332: MULX_R	mulx 	%r20, %r19, %r18
	.word 0xe4008003  ! 333: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe470a020  ! 334: STX_I	stx	%r18, [%r2 + 0x0020]
	.word 0x24c48003  ! 335: BRLEZ	brlez,a,nt	%r18,<label_0x48003>
	.word 0xe840a0f8  ! 336: LDSW_I	ldsw	[%r2 + 0x00f8], %r20
	.word 0xa64c8012  ! 337: MULX_R	mulx 	%r18, %r18, %r19
	.word 0xa57ca423  ! 338: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa40c8012  ! 339: AND_R	and 	%r18, %r18, %r18
	.word 0xa97cdc13  ! 340: MOVR_R	movvs	%r19, %r19, %r20
	.word 0xe4708003  ! 341: STX_R	stx	%r18, [%r2 + %r3]
	.word 0x2ac48003  ! 342: BRNZ	brnz,a,nt	%r18,<label_0x48003>
	.word 0xa8148012  ! 343: OR_R	or 	%r18, %r18, %r20
	.word 0xa57d2418  ! 344: MOVR_I	move	%r20, 0x1, %r18
	.word 0x84006f00  ! 346: ADD_I	add 	%r1, 0x0f00, %r2
	.word 0xe818a048  ! 347: LDD_I	ldd	[%r2 + 0x0048], %r20
	.word 0xe4588003  ! 348: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe400a080  ! 349: LDUW_I	lduw	[%r2 + 0x0080], %r18
	.word 0xa57cbf38  ! 350: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xe418a000  ! 351: LDD_I	ldd	[%r2 + 0x0000], %r18
	.word 0x0cc4c003  ! 352: BRGZ	brgz  ,nt	%r19,<label_0x4c003>
	.word 0xa57cc812  ! 353: MOVR_R	movle	%r19, %r18, %r18
	.word 0xa57ca6fc  ! 354: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa57d3b82  ! 355: MOVR_I	movneg	%r20, 0x1, %r18
	.word 0xa57c8412  ! 356: MOVR_R	move	%r18, %r18, %r18
	.word 0xe470a098  ! 357: STX_I	stx	%r18, [%r2 + 0x0098]
	.word 0x2ac48001  ! 358: BRNZ	brnz,a,nt	%r18,<label_0x48001>
	.word 0xe4708003  ! 359: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe4008003  ! 360: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe470a060  ! 361: STX_I	stx	%r18, [%r2 + 0x0060]
	.word 0xa57c8c12  ! 362: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa57ccc12  ! 363: MOVR_R	movl	%r19, %r18, %r18
	.word 0xa77c8812  ! 364: MOVR_R	movle	%r18, %r18, %r19
	.word 0xa77ca6c0  ! 365: MOVR_I	move	%r18, 0x1, %r19
	.word 0xa60c8012  ! 366: AND_R	and 	%r18, %r18, %r19
	.word 0xa57d0412  ! 367: MOVR_R	move	%r20, %r18, %r18
	.word 0x84006000  ! 369: ADD_I	add 	%r1, 0x0000, %r2
	.word 0x02c48002  ! 370: BRZ	brz  ,nt	%r18,<label_0x48002>
	.word 0xa57cedde  ! 371: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xa57d3619  ! 372: MOVR_I	movcs	%r20, 0x1, %r18
	.word 0xa57cd413  ! 373: MOVR_R	movcs	%r19, %r19, %r18
	.word 0x86002040  ! 375: ADD_I	add 	%r0, 0x0040, %r3
	.word 0xa57cc412  ! 376: MOVR_R	move	%r19, %r18, %r18
	.word 0xa57c8412  ! 377: MOVR_R	move	%r18, %r18, %r18
	.word 0xa77d2463  ! 378: MOVR_I	move	%r20, 0x1, %r19
	.word 0xe4408003  ! 379: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa57d3b84  ! 380: MOVR_I	movneg	%r20, 0x1, %r18
	.word 0xe8408003  ! 381: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xe4408003  ! 382: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe4408003  ! 383: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa77c9812  ! 384: MOVR_R	movneg	%r18, %r18, %r19
	.word 0xa57d2737  ! 385: MOVR_I	move	%r20, 0x1, %r18
	.word 0xa57caa88  ! 386: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa57c8412  ! 387: MOVR_R	move	%r18, %r18, %r18
	.word 0xe840a0c0  ! 388: LDSW_I	ldsw	[%r2 + 0x00c0], %r20
	.word 0xe4588003  ! 389: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe8708003  ! 390: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xe4188003  ! 391: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa97c8412  ! 392: MOVR_R	move	%r18, %r18, %r20
	.word 0xe8188003  ! 393: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xa97c8c12  ! 394: MOVR_R	movl	%r18, %r18, %r20
	.word 0xe458a010  ! 395: LDX_I	ldx	[%r2 + 0x0010], %r18
	.word 0xa77d368f  ! 396: MOVR_I	movcs	%r20, 0x1, %r19
	.word 0xa57cc813  ! 397: MOVR_R	movle	%r19, %r19, %r18
	.word 0xa64cc012  ! 398: MULX_R	mulx 	%r19, %r18, %r19
	.word 0xa4148012  ! 399: OR_R	or 	%r18, %r18, %r18
	.word 0xa57cabf0  ! 400: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xe400a078  ! 401: LDUW_I	lduw	[%r2 + 0x0078], %r18
	.word 0xe4588003  ! 402: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa40c8012  ! 403: AND_R	and 	%r18, %r18, %r18
	.word 0xa77d1c13  ! 404: MOVR_R	movvs	%r20, %r19, %r19
	.word 0x84006a00  ! 406: ADD_I	add 	%r1, 0x0a00, %r2
	.word 0xa57cab37  ! 407: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xe4388003  ! 408: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe8008003  ! 409: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa77d0412  ! 410: MOVR_R	move	%r20, %r18, %r19
	.word 0x06c50002  ! 411: BRLZ	brlz  ,nt	%r20,<label_0x50002>
	.word 0x04cc8001  ! 412: BRLEZ	brlez  ,pt	%r18,<label_0xc8001>
	.word 0x86002058  ! 414: ADD_I	add 	%r0, 0x0058, %r3
	.word 0xa80cc012  ! 415: AND_R	and 	%r19, %r18, %r20
	.word 0x84006e00  ! 417: ADD_I	add 	%r1, 0x0e00, %r2
	.word 0xe8588003  ! 418: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe8008003  ! 419: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe4708003  ! 420: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa57d3d24  ! 421: MOVR_I	movvs	%r20, 0x1, %r18
	.word 0xa77d1c12  ! 422: MOVR_R	movvs	%r20, %r18, %r19
	.word 0xa57ce445  ! 423: MOVR_I	move	%r19, 0x1, %r18
	.word 0xa97cab0a  ! 424: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa77d2d0d  ! 425: MOVR_I	movl	%r20, 0x1, %r19
	.word 0xa8048013  ! 426: ADD_R	add 	%r18, %r19, %r20
	.word 0xa57c9c12  ! 427: MOVR_R	movvs	%r18, %r18, %r18
	.word 0xa57c9413  ! 428: MOVR_R	movcs	%r18, %r19, %r18
	.word 0xa97cfb94  ! 429: MOVR_I	movneg	%r19, 0x1, %r20
	.word 0xa77d2494  ! 430: MOVR_I	move	%r20, 0x1, %r19
	.word 0xa97d0812  ! 431: MOVR_R	movle	%r20, %r18, %r20
	.word 0xe4008003  ! 432: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe8588003  ! 433: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa77c8c12  ! 434: MOVR_R	movl	%r18, %r18, %r19
	.word 0xa97c8812  ! 435: MOVR_R	movle	%r18, %r18, %r20
	.word 0xa77d0412  ! 436: MOVR_R	move	%r20, %r18, %r19
	.word 0x2cc48001  ! 437: BRGZ	brgz,a,nt	%r18,<label_0x48001>
	.word 0x0ec4c002  ! 438: BRGEZ	brgez  ,nt	%r19,<label_0x4c002>
	.word 0xa404c013  ! 439: ADD_R	add 	%r19, %r19, %r18
	.word 0xa6050012  ! 440: ADD_R	add 	%r20, %r18, %r19
	.word 0x0acc8001  ! 441: BRNZ	brnz  ,pt	%r18,<label_0xc8001>
	.word 0xa44d0012  ! 442: MULX_R	mulx 	%r20, %r18, %r18
	.word 0xa57c8c12  ! 443: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa77cbeb6  ! 444: MOVR_I	movvs	%r18, 0x1, %r19
	.word 0xa57cc813  ! 445: MOVR_R	movle	%r19, %r19, %r18
	.word 0xe8588003  ! 446: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa80c8012  ! 447: AND_R	and 	%r18, %r18, %r20
	.word 0xe4708003  ! 448: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa57c8c12  ! 449: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa57cadf3  ! 450: MOVR_I	movl	%r18, 0x1, %r18
	.word 0x26c48001  ! 451: BRLZ	brlz,a,nt	%r18,<label_0x48001>
	.word 0xa57cac49  ! 452: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57d3e6b  ! 453: MOVR_I	movvs	%r20, 0x1, %r18
	.word 0xa97c8412  ! 454: MOVR_R	move	%r18, %r18, %r20
	.word 0xa60cc012  ! 455: AND_R	and 	%r19, %r18, %r19
	.word 0xa97cab73  ! 456: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xe8408003  ! 457: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa57cfb7e  ! 458: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0xa44c8012  ! 459: MULX_R	mulx 	%r18, %r18, %r18
	.word 0x84006b00  ! 461: ADD_I	add 	%r1, 0x0b00, %r2
	.word 0x0ac50002  ! 462: BRNZ	brnz  ,nt	%r20,<label_0x50002>
	.word 0xa57cd412  ! 463: MOVR_R	movcs	%r19, %r18, %r18
	.word 0xa57d0c12  ! 464: MOVR_R	movl	%r20, %r18, %r18
	.word 0x86002010  ! 466: ADD_I	add 	%r0, 0x0010, %r3
	.word 0xa57c8412  ! 467: MOVR_R	move	%r18, %r18, %r18
	.word 0xa84c8012  ! 468: MULX_R	mulx 	%r18, %r18, %r20
	.word 0xa97caf06  ! 469: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa84cc012  ! 470: MULX_R	mulx 	%r19, %r18, %r20
	.word 0xa77cd812  ! 471: MOVR_R	movneg	%r19, %r18, %r19
	.word 0xe4388003  ! 472: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa414c012  ! 473: OR_R	or 	%r19, %r18, %r18
	.word 0xa57ca660  ! 474: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa77d2d3a  ! 475: MOVR_I	movl	%r20, 0x1, %r19
	.word 0xe4588003  ! 476: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57cae15  ! 477: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa6048012  ! 478: ADD_R	add 	%r18, %r18, %r19
	.word 0xa6250013  ! 479: SUB_R	sub 	%r20, %r19, %r19
	.word 0xa804c012  ! 480: ADD_R	add 	%r19, %r18, %r20
	.word 0xa57ceab8  ! 481: MOVR_I	movle	%r19, 0x1, %r18
	.word 0x2cc48002  ! 482: BRGZ	brgz,a,nt	%r18,<label_0x48002>
	.word 0xe800a030  ! 483: LDUW_I	lduw	[%r2 + 0x0030], %r20
	.word 0xa6050012  ! 484: ADD_R	add 	%r20, %r18, %r19
	.word 0xa77c8412  ! 485: MOVR_R	move	%r18, %r18, %r19
	.word 0xa57d1413  ! 486: MOVR_R	movcs	%r20, %r19, %r18
	.word 0xa57cea76  ! 487: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa40c8013  ! 488: AND_R	and 	%r18, %r19, %r18
	.word 0xa44d0012  ! 489: MULX_R	mulx 	%r20, %r18, %r18
	.word 0xe4408003  ! 490: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa77ce4f2  ! 491: MOVR_I	move	%r19, 0x1, %r19
	.word 0xa4048012  ! 492: ADD_R	add 	%r18, %r18, %r18
	.word 0xa4148012  ! 493: OR_R	or 	%r18, %r18, %r18
	.word 0xa57cb96d  ! 494: MOVR_I	movneg	%r18, 0x1, %r18
	.word 0xa57d38f3  ! 495: MOVR_I	movneg	%r20, 0x1, %r18
	.word 0xa97d2aab  ! 496: MOVR_I	movle	%r20, 0x1, %r20
	.word 0xa57d0813  ! 497: MOVR_R	movle	%r20, %r19, %r18
	.word 0xe8708003  ! 498: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa57cab6e  ! 499: MOVR_I	movle	%r18, 0x1, %r18
	.word 0x860020a8  ! 501: ADD_I	add 	%r0, 0x00a8, %r3
	.word 0xe440a028  ! 502: LDSW_I	ldsw	[%r2 + 0x0028], %r18
	.word 0xe470a0d0  ! 503: STX_I	stx	%r18, [%r2 + 0x00d0]
	.word 0xe8188003  ! 504: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xa64cc012  ! 505: MULX_R	mulx 	%r19, %r18, %r19
	.word 0x84006700  ! 507: ADD_I	add 	%r1, 0x0700, %r2
	.word 0xe440a048  ! 508: LDSW_I	ldsw	[%r2 + 0x0048], %r18
	.word 0xe458a038  ! 509: LDX_I	ldx	[%r2 + 0x0038], %r18
	.word 0x0ac4c001  ! 510: BRNZ	brnz  ,nt	%r19,<label_0x4c001>
	.word 0xe4408003  ! 511: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe8708003  ! 512: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xe8008003  ! 513: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa77d2af9  ! 514: MOVR_I	movle	%r20, 0x1, %r19
	.word 0x0ec4c003  ! 515: BRGEZ	brgez  ,nt	%r19,<label_0x4c003>
	.word 0xa77d1c12  ! 516: MOVR_R	movvs	%r20, %r18, %r19
	.word 0xa57cb684  ! 517: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xa64c8012  ! 518: MULX_R	mulx 	%r18, %r18, %r19
	.word 0xa8048012  ! 519: ADD_R	add 	%r18, %r18, %r20
	.word 0xa77d34c6  ! 520: MOVR_I	movcs	%r20, 0x1, %r19
	.word 0xe458a068  ! 521: LDX_I	ldx	[%r2 + 0x0068], %r18
	.word 0xa57d2e6e  ! 522: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa97c8812  ! 523: MOVR_R	movle	%r18, %r18, %r20
	.word 0x86002058  ! 525: ADD_I	add 	%r0, 0x0058, %r3
	.word 0xa97caa0f  ! 526: MOVR_I	movle	%r18, 0x1, %r20
	.word 0x84006b00  ! 528: ADD_I	add 	%r1, 0x0b00, %r2
	.word 0xa57c8412  ! 529: MOVR_R	move	%r18, %r18, %r18
	.word 0xa57cd413  ! 530: MOVR_R	movcs	%r19, %r19, %r18
	.word 0xe440a088  ! 531: LDSW_I	ldsw	[%r2 + 0x0088], %r18
	.word 0xa77cd812  ! 532: MOVR_R	movneg	%r19, %r18, %r19
	.word 0xa8148012  ! 533: OR_R	or 	%r18, %r18, %r20
	.word 0xe4708003  ! 534: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa8248012  ! 535: SUB_R	sub 	%r18, %r18, %r20
	.word 0x860020a0  ! 537: ADD_I	add 	%r0, 0x00a0, %r3
	.word 0xa97cac0d  ! 538: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa97d0413  ! 539: MOVR_R	move	%r20, %r19, %r20
	.word 0xe470a0d8  ! 540: STX_I	stx	%r18, [%r2 + 0x00d8]
	.word 0xe4588003  ! 541: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa4150012  ! 542: OR_R	or 	%r20, %r18, %r18
	.word 0xe4408003  ! 543: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa4150012  ! 544: OR_R	or 	%r20, %r18, %r18
	.word 0xa97c9812  ! 545: MOVR_R	movneg	%r18, %r18, %r20
	.word 0xa97cab6d  ! 546: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa57cdc13  ! 547: MOVR_R	movvs	%r19, %r19, %r18
	.word 0xe4008003  ! 548: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa84c8013  ! 549: MULX_R	mulx 	%r18, %r19, %r20
	.word 0xa57d28e6  ! 550: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xa97c9412  ! 551: MOVR_R	movcs	%r18, %r18, %r20
	.word 0x84006a00  ! 553: ADD_I	add 	%r1, 0x0a00, %r2
	.word 0xe4588003  ! 554: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57cbf2e  ! 555: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa97c8412  ! 556: MOVR_R	move	%r18, %r18, %r20
	.word 0xe440a050  ! 557: LDSW_I	ldsw	[%r2 + 0x0050], %r18
	.word 0x0cc50001  ! 558: BRGZ	brgz  ,nt	%r20,<label_0x50001>
	.word 0xe4008003  ! 559: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa77d1812  ! 560: MOVR_R	movneg	%r20, %r18, %r19
	.word 0xa57c8412  ! 561: MOVR_R	move	%r18, %r18, %r18
	.word 0xe4588003  ! 562: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe4588003  ! 563: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe8388003  ! 564: STD_R	std	%r20, [%r2 + %r3]
	.word 0xa414c012  ! 565: OR_R	or 	%r19, %r18, %r18
	.word 0xe4008003  ! 566: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0x86002040  ! 568: ADD_I	add 	%r0, 0x0040, %r3
	.word 0xa57c8812  ! 569: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa97d3623  ! 570: MOVR_I	movcs	%r20, 0x1, %r20
	.word 0xa6048012  ! 571: ADD_R	add 	%r18, %r18, %r19
	.word 0x860020a8  ! 573: ADD_I	add 	%r0, 0x00a8, %r3
	.word 0xe470a0a8  ! 574: STX_I	stx	%r18, [%r2 + 0x00a8]
	.word 0xa77c8812  ! 575: MOVR_R	movle	%r18, %r18, %r19
	.word 0xa57d0c12  ! 576: MOVR_R	movl	%r20, %r18, %r18
	.word 0x0cc48003  ! 577: BRGZ	brgz  ,nt	%r18,<label_0x48003>
	.word 0x860020c8  ! 579: ADD_I	add 	%r0, 0x00c8, %r3
	.word 0xa77c9812  ! 580: MOVR_R	movneg	%r18, %r18, %r19
	.word 0x84006c00  ! 582: ADD_I	add 	%r1, 0x0c00, %r2
	.word 0xa97caaea  ! 583: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa77caf0d  ! 584: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xa77c9812  ! 585: MOVR_R	movneg	%r18, %r18, %r19
	.word 0xe4008003  ! 586: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0x0ac48003  ! 587: BRNZ	brnz  ,nt	%r18,<label_0x48003>
	.word 0xe4588003  ! 588: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57cbee8  ! 589: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0x84006100  ! 591: ADD_I	add 	%r1, 0x0100, %r2
	.word 0xe4708003  ! 592: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa424c013  ! 593: SUB_R	sub 	%r19, %r19, %r18
	.word 0xa57ca57c  ! 594: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa824c012  ! 595: SUB_R	sub 	%r19, %r18, %r20
	.word 0xa97ca5ea  ! 596: MOVR_I	move	%r18, 0x1, %r20
	.word 0xe4408003  ! 597: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe458a040  ! 598: LDX_I	ldx	[%r2 + 0x0040], %r18
	.word 0xa77ca4c4  ! 599: MOVR_I	move	%r18, 0x1, %r19
	.word 0xa57c8c12  ! 600: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa8148012  ! 601: OR_R	or 	%r18, %r18, %r20
	.word 0x02c48003  ! 602: BRZ	brz  ,nt	%r18,<label_0x48003>
	.word 0xa97ceab0  ! 603: MOVR_I	movle	%r19, 0x1, %r20
	.word 0xa60c8013  ! 604: AND_R	and 	%r18, %r19, %r19
	.word 0xe4408003  ! 605: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0x24c50003  ! 606: BRLEZ	brlez,a,nt	%r20,<label_0x50003>
	.word 0xa414c012  ! 607: OR_R	or 	%r19, %r18, %r18
	.word 0x04ccc001  ! 608: BRLEZ	brlez  ,pt	%r19,<label_0xcc001>
	.word 0xe4408003  ! 609: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe440a038  ! 610: LDSW_I	ldsw	[%r2 + 0x0038], %r18
	.word 0xa77d0c13  ! 611: MOVR_R	movl	%r20, %r19, %r19
	.word 0xa77cb603  ! 612: MOVR_I	movcs	%r18, 0x1, %r19
	.word 0xe400a0a8  ! 613: LDUW_I	lduw	[%r2 + 0x00a8], %r18
	.word 0xe400a0b8  ! 614: LDUW_I	lduw	[%r2 + 0x00b8], %r18
	.word 0xa57cedf9  ! 615: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xe4588003  ! 616: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa97ca7c7  ! 617: MOVR_I	move	%r18, 0x1, %r20
	.word 0x0ec48003  ! 618: BRGEZ	brgez  ,nt	%r18,<label_0x48003>
	.word 0xe4588003  ! 619: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa84cc012  ! 620: MULX_R	mulx 	%r19, %r18, %r20
	.word 0xe418a070  ! 621: LDD_I	ldd	[%r2 + 0x0070], %r18
	.word 0xa57c8c13  ! 622: MOVR_R	movl	%r18, %r19, %r18
	.word 0x84006b00  ! 624: ADD_I	add 	%r1, 0x0b00, %r2
	.word 0xa97c8c12  ! 625: MOVR_R	movl	%r18, %r18, %r20
	.word 0xe470a0e0  ! 626: STX_I	stx	%r18, [%r2 + 0x00e0]
	.word 0xa624c012  ! 627: SUB_R	sub 	%r19, %r18, %r19
	.word 0xa6050012  ! 628: ADD_R	add 	%r20, %r18, %r19
	.word 0xa57ce4a4  ! 629: MOVR_I	move	%r19, 0x1, %r18
	.word 0xe4708003  ! 630: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe4708003  ! 631: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa77ca59c  ! 632: MOVR_I	move	%r18, 0x1, %r19
	.word 0xe4588003  ! 633: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa6148012  ! 634: OR_R	or 	%r18, %r18, %r19
	.word 0xa414c013  ! 635: OR_R	or 	%r19, %r19, %r18
	.word 0xa57c8813  ! 636: MOVR_R	movle	%r18, %r19, %r18
	.word 0xa40d0013  ! 637: AND_R	and 	%r20, %r19, %r18
	.word 0x06c48001  ! 638: BRLZ	brlz  ,nt	%r18,<label_0x48001>
	.word 0xe4408003  ! 639: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe4408003  ! 640: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe8708003  ! 641: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa824c012  ! 642: SUB_R	sub 	%r19, %r18, %r20
	.word 0xa6248012  ! 643: SUB_R	sub 	%r18, %r18, %r19
	.word 0xe800a068  ! 644: LDUW_I	lduw	[%r2 + 0x0068], %r20
	.word 0xa4248012  ! 645: SUB_R	sub 	%r18, %r18, %r18
	.word 0xa97d2cbf  ! 646: MOVR_I	movl	%r20, 0x1, %r20
	.word 0xe8408003  ! 647: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xe840a0d8  ! 648: LDSW_I	ldsw	[%r2 + 0x00d8], %r20
	.word 0xa604c012  ! 649: ADD_R	add 	%r19, %r18, %r19
	.word 0xe800a0e0  ! 650: LDUW_I	lduw	[%r2 + 0x00e0], %r20
	.word 0xe470a0b8  ! 651: STX_I	stx	%r18, [%r2 + 0x00b8]
	.word 0xe4408003  ! 652: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa57cea29  ! 653: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa57cf4c2  ! 654: MOVR_I	movcs	%r19, 0x1, %r18
	.word 0xa97cc412  ! 655: MOVR_R	move	%r19, %r18, %r20
	.word 0xe870a050  ! 656: STX_I	stx	%r20, [%r2 + 0x0050]
	.word 0xa57ca61c  ! 657: MOVR_I	move	%r18, 0x1, %r18
	.word 0xe458a000  ! 658: LDX_I	ldx	[%r2 + 0x0000], %r18
	.word 0xa57d2985  ! 659: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xa57cbe62  ! 660: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xe8408003  ! 661: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa57ca889  ! 662: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xe440a0c8  ! 663: LDSW_I	ldsw	[%r2 + 0x00c8], %r18
	.word 0xe4588003  ! 664: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x26ccc002  ! 665: BRLZ	brlz,a,pt	%r19,<label_0xcc002>
	.word 0xe8588003  ! 666: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa77cbc87  ! 667: MOVR_I	movvs	%r18, 0x1, %r19
	.word 0xa97cb5e0  ! 668: MOVR_I	movcs	%r18, 0x1, %r20
	.word 0x2ec48003  ! 669: BRGEZ	brgez,a,nt	%r18,<label_0x48003>
	.word 0xa97c8412  ! 670: MOVR_R	move	%r18, %r18, %r20
	.word 0xa57c9412  ! 671: MOVR_R	movcs	%r18, %r18, %r18
	.word 0xe870a0a8  ! 672: STX_I	stx	%r20, [%r2 + 0x00a8]
	.word 0xe4408003  ! 673: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe400a098  ! 674: LDUW_I	lduw	[%r2 + 0x0098], %r18
	.word 0xa77cfafe  ! 675: MOVR_I	movneg	%r19, 0x1, %r19
	.word 0xe4388003  ! 676: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa77cab33  ! 677: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa77c8412  ! 678: MOVR_R	move	%r18, %r18, %r19
	.word 0xa57cb5dc  ! 679: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xe4708003  ! 680: STX_R	stx	%r18, [%r2 + %r3]
	.word 0x0cc48001  ! 681: BRGZ	brgz  ,nt	%r18,<label_0x48001>
	.word 0xa624c012  ! 682: SUB_R	sub 	%r19, %r18, %r19
	.word 0xe8388003  ! 683: STD_R	std	%r20, [%r2 + %r3]
	.word 0xa97ce50e  ! 684: MOVR_I	move	%r19, 0x1, %r20
	.word 0xa97ce9c4  ! 685: MOVR_I	movle	%r19, 0x1, %r20
	.word 0xa57d3624  ! 686: MOVR_I	movcs	%r20, 0x1, %r18
	.word 0xe4708003  ! 687: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa77c9c12  ! 688: MOVR_R	movvs	%r18, %r18, %r19
	.word 0xa57c9c12  ! 689: MOVR_R	movvs	%r18, %r18, %r18
	.word 0xe458a0e0  ! 690: LDX_I	ldx	[%r2 + 0x00e0], %r18
	.word 0xa57d2a78  ! 691: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xa77ca8b5  ! 692: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa77d266a  ! 693: MOVR_I	move	%r20, 0x1, %r19
	.word 0xa57c8412  ! 694: MOVR_R	move	%r18, %r18, %r18
	.word 0xa8248012  ! 695: SUB_R	sub 	%r18, %r18, %r20
	.word 0xa57d3f4c  ! 696: MOVR_I	movvs	%r20, 0x1, %r18
	.word 0x84006500  ! 698: ADD_I	add 	%r1, 0x0500, %r2
	.word 0xe8388003  ! 699: STD_R	std	%r20, [%r2 + %r3]
	.word 0xe4008003  ! 700: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe418a010  ! 701: LDD_I	ldd	[%r2 + 0x0010], %r18
	.word 0xa77caf1d  ! 702: MOVR_I	movl	%r18, 0x1, %r19
	.word 0x06cd0002  ! 703: BRLZ	brlz  ,pt	%r20,<label_0xd0002>
	.word 0xe4588003  ! 704: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x86002048  ! 706: ADD_I	add 	%r0, 0x0048, %r3
	.word 0xa77cc812  ! 707: MOVR_R	movle	%r19, %r18, %r19
	.word 0xa57cbc44  ! 708: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa57c8813  ! 709: MOVR_R	movle	%r18, %r19, %r18
	.word 0xa57c9c12  ! 710: MOVR_R	movvs	%r18, %r18, %r18
	.word 0xa57cec09  ! 711: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xe8408003  ! 712: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0x860020f8  ! 714: ADD_I	add 	%r0, 0x00f8, %r3
	.word 0xa77cc412  ! 715: MOVR_R	move	%r19, %r18, %r19
	.word 0xe4008003  ! 716: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe418a050  ! 717: LDD_I	ldd	[%r2 + 0x0050], %r18
	.word 0xe800a008  ! 718: LDUW_I	lduw	[%r2 + 0x0008], %r20
	.word 0xe4708003  ! 719: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa77c8c12  ! 720: MOVR_R	movl	%r18, %r18, %r19
	.word 0x2cc50003  ! 721: BRGZ	brgz,a,nt	%r20,<label_0x50003>
	.word 0xe8008003  ! 722: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe400a0f0  ! 723: LDUW_I	lduw	[%r2 + 0x00f0], %r18
	.word 0xe4188003  ! 724: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa97cbc9e  ! 725: MOVR_I	movvs	%r18, 0x1, %r20
	.word 0xa4148013  ! 726: OR_R	or 	%r18, %r19, %r18
	.word 0xa57cd812  ! 727: MOVR_R	movneg	%r19, %r18, %r18
	.word 0x0cc4c001  ! 728: BRGZ	brgz  ,nt	%r19,<label_0x4c001>
	.word 0xa8250013  ! 729: SUB_R	sub 	%r20, %r19, %r20
	.word 0xe400a018  ! 730: LDUW_I	lduw	[%r2 + 0x0018], %r18
	.word 0xe400a0e0  ! 731: LDUW_I	lduw	[%r2 + 0x00e0], %r18
	.word 0xa4250013  ! 732: SUB_R	sub 	%r20, %r19, %r18
	.word 0xa80cc013  ! 733: AND_R	and 	%r19, %r19, %r20
	.word 0xa64c8012  ! 734: MULX_R	mulx 	%r18, %r18, %r19
	.word 0x86002080  ! 736: ADD_I	add 	%r0, 0x0080, %r3
	.word 0xa57ce4af  ! 737: MOVR_I	move	%r19, 0x1, %r18
	.word 0xa97cadde  ! 738: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa57cb54d  ! 739: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0x0ccc8003  ! 740: BRGZ	brgz  ,pt	%r18,<label_0xc8003>
	.word 0xe418a0b0  ! 741: LDD_I	ldd	[%r2 + 0x00b0], %r18
	.word 0xe4008003  ! 742: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa57cb83e  ! 743: MOVR_I	movneg	%r18, 0x1, %r18
	.word 0xa57cb569  ! 744: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xa57cbbba  ! 745: MOVR_I	movneg	%r18, 0x1, %r18
	.word 0xa97ce529  ! 746: MOVR_I	move	%r19, 0x1, %r20
	.word 0x84006600  ! 748: ADD_I	add 	%r1, 0x0600, %r2
	.word 0xe470a068  ! 749: STX_I	stx	%r18, [%r2 + 0x0068]
	.word 0xa77c8812  ! 750: MOVR_R	movle	%r18, %r18, %r19
	.word 0xa57c9412  ! 751: MOVR_R	movcs	%r18, %r18, %r18
	.word 0xe4708003  ! 752: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe8188003  ! 753: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xe458a0f0  ! 754: LDX_I	ldx	[%r2 + 0x00f0], %r18
	.word 0x06c50003  ! 755: BRLZ	brlz  ,nt	%r20,<label_0x50003>
	.word 0x0ec48001  ! 756: BRGEZ	brgez  ,nt	%r18,<label_0x48001>
	.word 0xe4008003  ! 757: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa57c9413  ! 758: MOVR_R	movcs	%r18, %r19, %r18
	.word 0xe400a040  ! 759: LDUW_I	lduw	[%r2 + 0x0040], %r18
	.word 0xe8588003  ! 760: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe8408003  ! 761: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xe8588003  ! 762: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0x84006800  ! 764: ADD_I	add 	%r1, 0x0800, %r2
	.word 0xa8048012  ! 765: ADD_R	add 	%r18, %r18, %r20
	.word 0xa97ce9f6  ! 766: MOVR_I	movle	%r19, 0x1, %r20
	.word 0x84006600  ! 768: ADD_I	add 	%r1, 0x0600, %r2
	.word 0xe440a0b0  ! 769: LDSW_I	ldsw	[%r2 + 0x00b0], %r18
	.word 0xa77cc412  ! 770: MOVR_R	move	%r19, %r18, %r19
	.word 0xa60c8012  ! 771: AND_R	and 	%r18, %r18, %r19
	.word 0xa57cafa7  ! 772: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa97d0412  ! 773: MOVR_R	move	%r20, %r18, %r20
	.word 0x84006000  ! 775: ADD_I	add 	%r1, 0x0000, %r2
	.word 0xe4408003  ! 776: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa4048012  ! 777: ADD_R	add 	%r18, %r18, %r18
	.word 0xa57d2626  ! 778: MOVR_I	move	%r20, 0x1, %r18
	.word 0xa57caef7  ! 779: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa44cc013  ! 780: MULX_R	mulx 	%r19, %r19, %r18
	.word 0xa77cae1a  ! 781: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xe400a0d0  ! 782: LDUW_I	lduw	[%r2 + 0x00d0], %r18
	.word 0xe870a068  ! 783: STX_I	stx	%r20, [%r2 + 0x0068]
	.word 0xe8588003  ! 784: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa77d2416  ! 785: MOVR_I	move	%r20, 0x1, %r19
	.word 0xe8008003  ! 786: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa84cc013  ! 787: MULX_R	mulx 	%r19, %r19, %r20
	.word 0xa57ca653  ! 788: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa84cc012  ! 789: MULX_R	mulx 	%r19, %r18, %r20
	.word 0xa97cdc13  ! 790: MOVR_R	movvs	%r19, %r19, %r20
	.word 0xa57ce5c1  ! 791: MOVR_I	move	%r19, 0x1, %r18
	.word 0xa97cbbdd  ! 792: MOVR_I	movneg	%r18, 0x1, %r20
	.word 0xe470a048  ! 793: STX_I	stx	%r18, [%r2 + 0x0048]
	.word 0xa77d243f  ! 794: MOVR_I	move	%r20, 0x1, %r19
	.word 0x0accc001  ! 795: BRNZ	brnz  ,pt	%r19,<label_0xcc001>
	.word 0xa57ca897  ! 796: MOVR_I	movle	%r18, 0x1, %r18
	.word 0x84006f00  ! 798: ADD_I	add 	%r1, 0x0f00, %r2
	.word 0xa97cf6a5  ! 799: MOVR_I	movcs	%r19, 0x1, %r20
	.word 0xa97cf80a  ! 800: MOVR_I	movneg	%r19, 0x1, %r20
	.word 0xa77c8c12  ! 801: MOVR_R	movl	%r18, %r18, %r19
	.word 0xa57ca6b4  ! 802: MOVR_I	move	%r18, 0x1, %r18
	.word 0xe8008003  ! 803: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe4588003  ! 804: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe4388003  ! 805: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe4708003  ! 806: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa44c8012  ! 807: MULX_R	mulx 	%r18, %r18, %r18
	.word 0x0ac50002  ! 808: BRNZ	brnz  ,nt	%r20,<label_0x50002>
	.word 0x06c4c003  ! 809: BRLZ	brlz  ,nt	%r19,<label_0x4c003>
	.word 0xe870a068  ! 810: STX_I	stx	%r20, [%r2 + 0x0068]
	.word 0xe440a0a0  ! 811: LDSW_I	ldsw	[%r2 + 0x00a0], %r18
	.word 0xa57cf873  ! 812: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0x26c50003  ! 813: BRLZ	brlz,a,nt	%r20,<label_0x50003>
	.word 0xa57d2910  ! 814: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xa97caaad  ! 815: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa97cf482  ! 816: MOVR_I	movcs	%r19, 0x1, %r20
	.word 0xa97cffec  ! 817: MOVR_I	movvs	%r19, 0x1, %r20
	.word 0xe4188003  ! 818: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa4250012  ! 819: SUB_R	sub 	%r20, %r18, %r18
	.word 0xe4008003  ! 820: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe8408003  ! 821: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa77cb873  ! 822: MOVR_I	movneg	%r18, 0x1, %r19
	.word 0xe400a0d0  ! 823: LDUW_I	lduw	[%r2 + 0x00d0], %r18
	.word 0xe8188003  ! 824: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xa6248012  ! 825: SUB_R	sub 	%r18, %r18, %r19
	.word 0xa57d2423  ! 826: MOVR_I	move	%r20, 0x1, %r18
	.word 0xa4048012  ! 827: ADD_R	add 	%r18, %r18, %r18
	.word 0xe870a030  ! 828: STX_I	stx	%r20, [%r2 + 0x0030]
	.word 0xe458a018  ! 829: LDX_I	ldx	[%r2 + 0x0018], %r18
	.word 0xe4188003  ! 830: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa57cbf24  ! 831: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xe4588003  ! 832: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe858a0c8  ! 833: LDX_I	ldx	[%r2 + 0x00c8], %r20
	.word 0xa4048012  ! 834: ADD_R	add 	%r18, %r18, %r18
	.word 0xa97d0412  ! 835: MOVR_R	move	%r20, %r18, %r20
	.word 0xa97c8412  ! 836: MOVR_R	move	%r18, %r18, %r20
	.word 0xa97c9813  ! 837: MOVR_R	movneg	%r18, %r19, %r20
	.word 0xe458a020  ! 838: LDX_I	ldx	[%r2 + 0x0020], %r18
	.word 0xa57ceaf5  ! 839: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa60c8012  ! 840: AND_R	and 	%r18, %r18, %r19
	.word 0x02c50003  ! 841: BRZ	brz  ,nt	%r20,<label_0x50003>
	.word 0xa57cc812  ! 842: MOVR_R	movle	%r19, %r18, %r18
	.word 0xe8588003  ! 843: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe8008003  ! 844: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa824c012  ! 845: SUB_R	sub 	%r19, %r18, %r20
	.word 0xa57d1812  ! 846: MOVR_R	movneg	%r20, %r18, %r18
	.word 0xe8408003  ! 847: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa64c8013  ! 848: MULX_R	mulx 	%r18, %r19, %r19
	.word 0xa97cf8b5  ! 849: MOVR_I	movneg	%r19, 0x1, %r20
	.word 0xa57c8812  ! 850: MOVR_R	movle	%r18, %r18, %r18
	.word 0x04c50001  ! 851: BRLEZ	brlez  ,nt	%r20,<label_0x50001>
	.word 0xa57cbef1  ! 852: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa57cc412  ! 853: MOVR_R	move	%r19, %r18, %r18
	.word 0x06c48002  ! 854: BRLZ	brlz  ,nt	%r18,<label_0x48002>
	.word 0xa6148013  ! 855: OR_R	or 	%r18, %r19, %r19
	.word 0xa84c8012  ! 856: MULX_R	mulx 	%r18, %r18, %r20
	.word 0x22c48002  ! 857: BRZ	brz,a,nt	%r18,<label_0x48002>
	.word 0xe4588003  ! 858: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe400a0b8  ! 859: LDUW_I	lduw	[%r2 + 0x00b8], %r18
	.word 0xa77ce5ff  ! 860: MOVR_I	move	%r19, 0x1, %r19
	.word 0xe400a020  ! 861: LDUW_I	lduw	[%r2 + 0x0020], %r18
	.word 0xe4408003  ! 862: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa97cd413  ! 863: MOVR_R	movcs	%r19, %r19, %r20
	.word 0xe8708003  ! 864: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa624c013  ! 865: SUB_R	sub 	%r19, %r19, %r19
	.word 0xe4708003  ! 866: STX_R	stx	%r18, [%r2 + %r3]
	.word 0x0ac48003  ! 867: BRNZ	brnz  ,nt	%r18,<label_0x48003>
	.word 0xa77d0812  ! 868: MOVR_R	movle	%r20, %r18, %r19
	.word 0xe4708003  ! 869: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa97caf4a  ! 870: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa57cbce5  ! 871: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa57c8c12  ! 872: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa57c9813  ! 873: MOVR_R	movneg	%r18, %r19, %r18
	.word 0xe818a028  ! 874: LDD_I	ldd	[%r2 + 0x0028], %r20
	.word 0xa57c8c13  ! 875: MOVR_R	movl	%r18, %r19, %r18
	.word 0x86002050  ! 877: ADD_I	add 	%r0, 0x0050, %r3
	.word 0xa97cbb09  ! 878: MOVR_I	movneg	%r18, 0x1, %r20
	.word 0xe8588003  ! 879: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa97c9c13  ! 880: MOVR_R	movvs	%r18, %r19, %r20
	.word 0xe800a098  ! 881: LDUW_I	lduw	[%r2 + 0x0098], %r20
	.word 0xe4408003  ! 882: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa57d2770  ! 883: MOVR_I	move	%r20, 0x1, %r18
	.word 0x84006200  ! 885: ADD_I	add 	%r1, 0x0200, %r2
	.word 0xe4388003  ! 886: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe440a0c0  ! 887: LDSW_I	ldsw	[%r2 + 0x00c0], %r18
	.word 0xe840a070  ! 888: LDSW_I	ldsw	[%r2 + 0x0070], %r20
	.word 0xa97c8c12  ! 889: MOVR_R	movl	%r18, %r18, %r20
	.word 0xe400a0a8  ! 890: LDUW_I	lduw	[%r2 + 0x00a8], %r18
	.word 0xa6048012  ! 891: ADD_R	add 	%r18, %r18, %r19
	.word 0x04cc8002  ! 892: BRLEZ	brlez  ,pt	%r18,<label_0xc8002>
	.word 0xa8150012  ! 893: OR_R	or 	%r20, %r18, %r20
	.word 0x06c4c002  ! 894: BRLZ	brlz  ,nt	%r19,<label_0x4c002>
	.word 0xa97c8c12  ! 895: MOVR_R	movl	%r18, %r18, %r20
	.word 0xa57d0412  ! 896: MOVR_R	move	%r20, %r18, %r18
	.word 0xe400a0f8  ! 897: LDUW_I	lduw	[%r2 + 0x00f8], %r18
	.word 0xe4008003  ! 898: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa4048012  ! 899: ADD_R	add 	%r18, %r18, %r18
	.word 0xe470a038  ! 900: STX_I	stx	%r18, [%r2 + 0x0038]
	.word 0xa4148012  ! 901: OR_R	or 	%r18, %r18, %r18
	.word 0x86002058  ! 903: ADD_I	add 	%r0, 0x0058, %r3
	.word 0xa97ce79a  ! 904: MOVR_I	move	%r19, 0x1, %r20
	.word 0x86002028  ! 906: ADD_I	add 	%r0, 0x0028, %r3
	.word 0xa57d1413  ! 907: MOVR_R	movcs	%r20, %r19, %r18
	.word 0xa57d374f  ! 908: MOVR_I	movcs	%r20, 0x1, %r18
	.word 0xa57d0c12  ! 909: MOVR_R	movl	%r20, %r18, %r18
	.word 0xa44c8012  ! 910: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xe470a020  ! 911: STX_I	stx	%r18, [%r2 + 0x0020]
	.word 0xe400a078  ! 912: LDUW_I	lduw	[%r2 + 0x0078], %r18
	.word 0x84006200  ! 914: ADD_I	add 	%r1, 0x0200, %r2
	.word 0xa4248012  ! 915: SUB_R	sub 	%r18, %r18, %r18
	.word 0xe458a098  ! 916: LDX_I	ldx	[%r2 + 0x0098], %r18
	.word 0xa77ca6ee  ! 917: MOVR_I	move	%r18, 0x1, %r19
	.word 0xa57d3f50  ! 918: MOVR_I	movvs	%r20, 0x1, %r18
	.word 0xa77caeb0  ! 919: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xa97c9c12  ! 920: MOVR_R	movvs	%r18, %r18, %r20
	.word 0x860020d0  ! 922: ADD_I	add 	%r0, 0x00d0, %r3
	.word 0xa77caf83  ! 923: MOVR_I	movl	%r18, 0x1, %r19
	.word 0x2ec48003  ! 924: BRGEZ	brgez,a,nt	%r18,<label_0x48003>
	.word 0xa97d0413  ! 925: MOVR_R	move	%r20, %r19, %r20
	.word 0xa97d0412  ! 926: MOVR_R	move	%r20, %r18, %r20
	.word 0x860020c8  ! 928: ADD_I	add 	%r0, 0x00c8, %r3
	.word 0xa97c8412  ! 929: MOVR_R	move	%r18, %r18, %r20
	.word 0xa57d0c13  ! 930: MOVR_R	movl	%r20, %r19, %r18
	.word 0xa97c8812  ! 931: MOVR_R	movle	%r18, %r18, %r20
	.word 0xe800a098  ! 932: LDUW_I	lduw	[%r2 + 0x0098], %r20
	.word 0xa57c9c12  ! 933: MOVR_R	movvs	%r18, %r18, %r18
	.word 0xa77ca98f  ! 934: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa77c9413  ! 935: MOVR_R	movcs	%r18, %r19, %r19
	.word 0xa44c8012  ! 936: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xa57cc812  ! 937: MOVR_R	movle	%r19, %r18, %r18
	.word 0xa57c8812  ! 938: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa97cb536  ! 939: MOVR_I	movcs	%r18, 0x1, %r20
	.word 0x84006000  ! 941: ADD_I	add 	%r1, 0x0000, %r2
	.word 0xa57c8812  ! 942: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa77d0412  ! 943: MOVR_R	move	%r20, %r18, %r19
	.word 0x0cc48002  ! 944: BRGZ	brgz  ,nt	%r18,<label_0x48002>
	.word 0xa424c013  ! 945: SUB_R	sub 	%r19, %r19, %r18
	.word 0xa97c8412  ! 946: MOVR_R	move	%r18, %r18, %r20
	.word 0xe8008003  ! 947: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe818a058  ! 948: LDD_I	ldd	[%r2 + 0x0058], %r20
	.word 0xa77d0412  ! 949: MOVR_R	move	%r20, %r18, %r19
	.word 0xa4248012  ! 950: SUB_R	sub 	%r18, %r18, %r18
	.word 0x0ccd0002  ! 951: BRGZ	brgz  ,pt	%r20,<label_0xd0002>
	.word 0xa84cc012  ! 952: MULX_R	mulx 	%r19, %r18, %r20
	.word 0xa57c8812  ! 953: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa57ce496  ! 954: MOVR_I	move	%r19, 0x1, %r18
	.word 0xa57d3900  ! 955: MOVR_I	movneg	%r20, 0x1, %r18
	.word 0xa4250012  ! 956: SUB_R	sub 	%r20, %r18, %r18
	.word 0xa57d1812  ! 957: MOVR_R	movneg	%r20, %r18, %r18
	.word 0xe4588003  ! 958: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe4588003  ! 959: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x04ccc003  ! 960: BRLEZ	brlez  ,pt	%r19,<label_0xcc003>
	.word 0xa97c8412  ! 961: MOVR_R	move	%r18, %r18, %r20
	.word 0xa57cd412  ! 962: MOVR_R	movcs	%r19, %r18, %r18
	.word 0xa604c012  ! 963: ADD_R	add 	%r19, %r18, %r19
	.word 0xa77c9813  ! 964: MOVR_R	movneg	%r18, %r19, %r19
	.word 0x2acc8001  ! 965: BRNZ	brnz,a,pt	%r18,<label_0xc8001>
	.word 0xa77d0c13  ! 966: MOVR_R	movl	%r20, %r19, %r19
	.word 0xa57c8413  ! 967: MOVR_R	move	%r18, %r19, %r18
	.word 0x04c50002  ! 968: BRLEZ	brlez  ,nt	%r20,<label_0x50002>
	.word 0xa57c8413  ! 969: MOVR_R	move	%r18, %r19, %r18
	.word 0xa57c8413  ! 970: MOVR_R	move	%r18, %r19, %r18
	.word 0xa77cb8a4  ! 971: MOVR_I	movneg	%r18, 0x1, %r19
	.word 0xe4408003  ! 972: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe458a0e8  ! 973: LDX_I	ldx	[%r2 + 0x00e8], %r18
	.word 0xa97ca7ea  ! 974: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa40cc013  ! 975: AND_R	and 	%r19, %r19, %r18
	.word 0xa97d0412  ! 976: MOVR_R	move	%r20, %r18, %r20
	.word 0xa97cbe16  ! 977: MOVR_I	movvs	%r18, 0x1, %r20
	.word 0xa77cab18  ! 978: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa8248013  ! 979: SUB_R	sub 	%r18, %r19, %r20
	.word 0xe440a0b8  ! 980: LDSW_I	ldsw	[%r2 + 0x00b8], %r18
	.word 0x24c48002  ! 981: BRLEZ	brlez,a,nt	%r18,<label_0x48002>
	.word 0xa57ceb4b  ! 982: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xe8408003  ! 983: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa57d2d01  ! 984: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa57ccc13  ! 985: MOVR_R	movl	%r19, %r19, %r18
	.word 0xe4008003  ! 986: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0x86002090  ! 988: ADD_I	add 	%r0, 0x0090, %r3
	.word 0xa97c8812  ! 989: MOVR_R	movle	%r18, %r18, %r20
	.word 0xa404c013  ! 990: ADD_R	add 	%r19, %r19, %r18
	.word 0xa60c8012  ! 991: AND_R	and 	%r18, %r18, %r19
	.word 0xe4588003  ! 992: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa97c8c12  ! 993: MOVR_R	movl	%r18, %r18, %r20
	.word 0xe4008003  ! 994: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0x84006500  ! 996: ADD_I	add 	%r1, 0x0500, %r2
	.word 0xa57d0813  ! 997: MOVR_R	movle	%r20, %r19, %r18
	.word 0xa6250012  ! 998: SUB_R	sub 	%r20, %r18, %r19
.data
.align	256
t3_data_start_0:
	.xword	0xd5459e88277d92c3
	.xword	0x5fe4192077430044
	.xword	0x3fd5e4a62e87d7d0
	.xword	0xfd4dce8f4134e015
	.xword	0xcd01e83bdfbc5de3
	.xword	0x7ad8e128cd83ea89
	.xword	0xf235ac708235db81
	.xword	0x8392a3dd80772630
	.xword	0x740a80d52ac819ef
	.xword	0xc749a0e1ceccdaa9
	.xword	0xf4c0c32d18454784
	.xword	0xdd104ce712b80b0f
	.xword	0xb3e017529d4f9764
	.xword	0x60b27ae41f0aa556
	.xword	0x80e1193c46322075
	.xword	0x7bc01055963b610e
	.xword	0x5404da1170e8b4a8
	.xword	0x624018bcd4a5af7a
	.xword	0x48c6daee86e6e44e
	.xword	0xe6edb1324be4a600
	.xword	0x0a7e6a47fcb9a5b0
	.xword	0xd04ce10e3874427c
	.xword	0xe542f5e379bf8be1
	.xword	0x858a71542fc52013
	.xword	0x8ef562666d700baa
	.xword	0x5ab161f19a989c1e
	.xword	0x51686fb15964f238
	.xword	0xa5fff4f55262ce78
	.xword	0x7eb76c29651ee427
	.xword	0x20bc8c11f5ff2021
	.xword	0x1390b63b7ad606fb
	.xword	0x218e56d3385d5831
	.xword	0x321db015085201c5
	.xword	0x3bf6f1616a1dd522
	.xword	0xd33434d73106b41a
	.xword	0xfbbd340d13910dae
	.xword	0x1689ccf2f969a59a
	.xword	0x4171e0e24ec9674d
	.xword	0x58aa5bb083d39182
	.xword	0x05ba336f36030ff8
	.xword	0x043896fc4d54699f
	.xword	0x6de7d89daae209bd
	.xword	0xe244634d835a1087
	.xword	0xb7890ef97afcaadd
	.xword	0x730643c8e78e6e1a
	.xword	0x016ccf006184c422
	.xword	0x041493b0771f1a85
	.xword	0x3107697d1ba20bd9
	.xword	0x472e96110eb94039
	.xword	0xc8555717e2ac9e89
	.xword	0x3464a6ccf3c4e0e5
	.xword	0x92e14714a98ea80c
	.xword	0xe66f3269db0b7232
	.xword	0x43020e78e9d01add
	.xword	0xd30f8be2992aed92
	.xword	0xc2ce845c31137078
	.xword	0x0a67e689ccb5ef0c
	.xword	0x7ced7b6d8d93b935
	.xword	0x7e04ae43da7bd7ab
	.xword	0xdfc92b114244bb01
	.xword	0x50d26e856721a653
	.xword	0x78c2c04b0339c4e8
	.xword	0x0aa552b04e658082
	.xword	0xcf4be1108ec28bc0
	.xword	0xfcb074b11b282cdd
	.xword	0x7d4b65f297b5dfc5
	.xword	0x6a9beb09d041964c
	.xword	0xf31ca9905ef53d00
	.xword	0x2f03978bc104f9c4
	.xword	0x942c0fcb41f5f23c
	.xword	0x1746d1fdb46f17e4
	.xword	0xf86e5b25282eb35d
	.xword	0xd05762fcae083d9a
	.xword	0xe0af0180fb2e4708
	.xword	0x18346bfcda024b21
	.xword	0x75ef5b6e84c1e071
	.xword	0xdf6166f0a0ab2262
	.xword	0x6c8c5a27034c5cfc
	.xword	0xea233cd9d5d74e4d
	.xword	0x9935a8aad1ae6a72
	.xword	0x6142d5b1658c7ff0
	.xword	0x6c4496ad7151d990
	.xword	0xd5ca99ff3ec95b4d
	.xword	0x38e29231e5b8b1a0
	.xword	0x6be1ed50c57fd6a8
	.xword	0xc35b7fa72d2da00e
	.xword	0x80da395ee83fd0ad
	.xword	0x78f0b8ff25c3e2fa
	.xword	0xfc8c60c7a03ba112
	.xword	0x1f6f3ca96f41c4fc
	.xword	0xd01b06e24b876bb6
	.xword	0x68c9e55d2cb2532c
	.xword	0x056465292cf2f260
	.xword	0xdfdbd31014910826
	.xword	0x3a47cea47b526830
	.xword	0x151fb5b64a26903a
	.xword	0x91e5f7b062d01263
	.xword	0x2fb70e65bb6e7bcc
	.xword	0x2e2c31a63640dcce
	.xword	0x14a4849620e0f858
	.xword	0xbeaf09c9557f802e
	.xword	0x5b6ce9cc70dccde3
	.xword	0x4a353ecd69f703b9
	.xword	0x68ede054f0bc8f52
	.xword	0x998ff2dbdf23e6ec
	.xword	0xcc10fb745e72fbc7
	.xword	0x9aec99994b70f890
	.xword	0x0f3b202cc10dfd4d
	.xword	0xaeb7da7cbcaa659f
	.xword	0x647624682b60e56b
	.xword	0x876c12f07cda4cbb
	.xword	0x85aad1a3b42f89e7
	.xword	0x8c8428a05e6c9401
	.xword	0x380e511aeb0a97ef
	.xword	0x15e9a5ea412c04ad
	.xword	0x158a33f2f1b00c84
	.xword	0xb97b163afd058418
	.xword	0xc63ebab93c602117
	.xword	0xf80a396f0d2ec5be
	.xword	0x9b22944ac4323e07
	.xword	0x62ab033f58ad5be3
	.xword	0x4930e5906ad161cc
	.xword	0x9bc0dda5b6af4ec1
	.xword	0xbe2475f5e0544516
	.xword	0x72149caa3c9b26a4
	.xword	0x1912d831f06213d4
	.xword	0xc7b1d7a2e141ebd8
	.xword	0x5674685028f091fe
	.xword	0xb04c00d48850b81f
	.xword	0xb516402052c7e27d
	.xword	0x5841082061e61204
	.xword	0xfdd68b8f980c8e91
	.xword	0x0519aad03f5d7c4c
	.xword	0x14ebf77987e4a057
	.xword	0x611a85576b05353f
	.xword	0x2a4bbbba1b9b02af
	.xword	0xdf0abb42e546737c
	.xword	0xc86a401bbb95036c
	.xword	0x2d7b33a20daced0a
	.xword	0xb9bb487f2560e32c
	.xword	0xd0c132bb9804488d
	.xword	0x2ed022ac2e509d96
	.xword	0x733dabce373d536d
	.xword	0x083d2df132ac7374
	.xword	0x13242d0fc60be9c3
	.xword	0xbd05525a350a5963
	.xword	0xf651de8f35102d33
	.xword	0xb2a3c3699da0431e
	.xword	0x00702946bf6aeb32
	.xword	0xcc29f8d521502f69
	.xword	0xaf0e3a1948c4563a
	.xword	0xaa8d951e36503c0c
	.xword	0xe23b2b9ec8233538
	.xword	0x6af08e4f721b36af
	.xword	0xbbea72b6280724cc
	.xword	0xa76b2cfa532038f5
	.xword	0x750d4a1ce48bcadf
	.xword	0xadd4481114531252
	.xword	0x14726437b6960cf4
	.xword	0xd6654f5c47b9fd68
	.xword	0x0f916e08d963805b
	.xword	0x6305a43f50491b09
	.xword	0xdeda5a360d748fa5
	.xword	0x141292a38b34017a
	.xword	0x684b8f5da36e463e
	.xword	0x72681cda1185c150
	.xword	0x1db42ddce4697a5c
	.xword	0xff0ced9e78d41867
	.xword	0x11763615cb4f2314
	.xword	0x6b818d0118a90c56
	.xword	0xfab8ae2db72ee03d
	.xword	0xd63c1edb7dee0e04
	.xword	0xb7b827c214c337f8
	.xword	0x31c3f068ed2744fa
	.xword	0xd81c8ae597ebcf87
	.xword	0xe9652758744dc3c1
	.xword	0x04e385adc8c247d8
	.xword	0x9481babcdadb2f21
	.xword	0xd81cbe9aea7637db
	.xword	0x294017e5c2fc8829
	.xword	0x9b22a7d7ee70c709
	.xword	0x85fc43ceafd048e3
	.xword	0x8a7b89b86675258f
	.xword	0x5603dee988f8c6de
	.xword	0x85f8be68893785f5
	.xword	0xc8c87b17e654b2e9
	.xword	0x842808f0180ddb01
	.xword	0x9bf3cde2bf79ca7c
	.xword	0x5a833ef58204fc59
	.xword	0x3ef49dc7d0257817
	.xword	0x43413d126404cbd6
	.xword	0x5491d74607aa59d0
	.xword	0xccf65522a32480d2
	.xword	0x2baf5564f36c1a87
	.xword	0xca5c5ddc6ebdb840
	.xword	0x40862b77748a5928
	.xword	0x36c72af69cc19370
	.xword	0x98776beaf95afa5a
	.xword	0xd2006a189dd953a6
	.xword	0x5a7bf31f94b6bf00
	.xword	0x6e84c67f4794a408
	.xword	0x30a42f05adf11873
	.xword	0x3fc08cdb72ce5f09
	.xword	0xc51e1425f3147de4
	.xword	0x47a5641435e4474d
	.xword	0x8878a6dc22bfe783
	.xword	0xea3b460f47057539
	.xword	0x633c135d40e3b0ee
	.xword	0xdf20dd686a7acd18
	.xword	0x3d9fbbbb2313a00f
	.xword	0xb10a12a5f6f7e29b
	.xword	0x2f532a631dd51a0c
	.xword	0xf56a73be474cfdda
	.xword	0xdc89098873db0009
	.xword	0x8ac9c5d4d3b6d13d
	.xword	0x2ee68ec6572d0b9b
	.xword	0x986c608d334ab815
	.xword	0xdc43fb1490577b0f
	.xword	0x30ad08434138582a
	.xword	0x8b1d2347a1230899
	.xword	0x80a7540630e8ed47
	.xword	0x9a38f89b272b9f9c
	.xword	0xb98c432208681ce0
	.xword	0xf7b0bcf1b562e225
	.xword	0xb1e05017c4efed87
	.xword	0xf5f146389bdfd90d
	.xword	0x113bfd5648058ca4
	.xword	0xb8ddcdc0b51eeac0
	.xword	0x29e852839572e78e
	.xword	0x593493e7742e980c
	.xword	0x919669b062913fdb
	.xword	0x2473570d0c21f57f
	.xword	0x3e3f15832826e6af
	.xword	0xa47af94402d6ba0b
	.xword	0xe1368ba76fdcc8eb
	.xword	0xa63a62547c75de8f
	.xword	0xd99ee3a8ea903b64
	.xword	0x8d0501417267cc80
	.xword	0xc0cd48699381e776
	.xword	0x834719c550503c63
	.xword	0xbbc722c7c4ec6b8b
	.xword	0x95386d27fcf6778a
	.xword	0xe12935282bd35ed3
	.xword	0xd22461fda325b191
	.xword	0x107a327ca6c3f61d
	.xword	0x6ca22cf8bd4acfbc
	.xword	0x36f5ae3912e6455b
	.xword	0x094d5d9665900933
	.xword	0x6e8da7df8e7b4829
	.xword	0x4d00ee632beb2b1a
	.xword	0xeb9d198873b495de
	.xword	0xcbedba5dd197d838
	.xword	0xffac0392cedb3479
	.xword	0x805d5395357cadca
	.xword	0xaadda68308ca6787
	.xword	0x54395fe57021f182
	.xword	0xb0184e68fb2df53d
	.xword	0x34773cb4bc05c62c
	.xword	0x454237a0d1d71199
	.xword	0x95f220030e3591f7
	.xword	0x8d9d322714c2e511
	.xword	0x595a76d7e34c47e1
	.xword	0x5cd9651dfd32c708
	.xword	0x0f97207e2ba1631e
	.xword	0x3c97560859ccc278
	.xword	0xd6f22b73fdd2f685
	.xword	0x92273f34e003a6af
	.xword	0xff5d4658cccda6ce
	.xword	0x68242bd2ded1c978
	.xword	0xe212c39aa4130b1a
	.xword	0x708cb888b1e6ff2e
	.xword	0xa0b8e9eb15b592d2
	.xword	0x30463ca105eed995
	.xword	0xf42be4d8f4266045
	.xword	0x783cb8b99c13eeab
	.xword	0xa2d65a0d4ef68a1f
	.xword	0xfa7aaaca3262f15f
	.xword	0x22b6284346c64196
	.xword	0xb7a7f82077d93e4c
	.xword	0x23a0529794546004
	.xword	0xd0c83ac61d9384e4
	.xword	0x3e8c87a3db980077
	.xword	0xa8a4bdcddcd93a8d
	.xword	0x689050f4c4055f59
	.xword	0x3d18dda9c5708d3e
	.xword	0x8c09d79ddd2a863c
	.xword	0xce90252c842794d8
	.xword	0x99f1dccb871087d1
	.xword	0x934222837a7be717
	.xword	0x6c9595a9718b4db3
	.xword	0x82aade92ac5e353a
	.xword	0x1de484ab2deaaa4b
	.xword	0x287bb4b2fd5c569c
	.xword	0x212b15dfb674e176
	.xword	0x92dd17f957c281b9
	.xword	0xc1bed6c707fa4158
	.xword	0xbd23a6c994a288f6
	.xword	0x85c97df272f1446a
	.xword	0x437bd0cfedb10f81
	.xword	0x8ae2a67f1c5ef5f6
	.xword	0x44ba867fbe4a8d7a
	.xword	0xa2eacafa6f2f5846
	.xword	0xb469c0c81952dbf3
	.xword	0xec81616b2022fafc
	.xword	0x2dac0bf152624a93
	.xword	0x25e94434f066cb55
	.xword	0xcda6eecdabcf5245
	.xword	0xd1a7634705b8eb0b
	.xword	0x0c730b7dce319b2b
	.xword	0xb5d34641dc73c4a3
	.xword	0xe2fc083cf282182e
	.xword	0x5569ccccaa418884
	.xword	0x9d169faccc24c6df
	.xword	0xb0a2e800d972db4a
	.xword	0x53a5b76c82be55bf
	.xword	0xa80204affb84a5a4
	.xword	0x53eb12fcbd5ca3cb
	.xword	0xb91156e2f1e4513c
	.xword	0x8c4d561e84656d23
	.xword	0xcf53717668a01a1c
	.xword	0xc5e005ce70a3942a
	.xword	0x0abc66c00a031284
	.xword	0xc8ad4732f27b9949
	.xword	0x1e2bae92543fb76d
	.xword	0x9faed14276ee6845
	.xword	0xf05f3404ca6b95da
	.xword	0xaee60bf143bbb70e
	.xword	0xea196a981545f0d7
	.xword	0x496870c29a9f54c2
	.xword	0x427ff0b1613fded7
	.xword	0xa3e507e1d6e1e78c
	.xword	0x6e815e294c67eb36
	.xword	0x20012aed99f55f67
	.xword	0x1e70f7b7cac9cdff
	.xword	0xd6650e50e539568f
	.xword	0xe2da5a979f6be8e1
	.xword	0xcb26909263758fe3
	.xword	0xbbca6dcced599561
	.xword	0xebae1a2dcad2d971
	.xword	0x7b8418eeb382c240
	.xword	0x1dbd2925abf06cb9
	.xword	0x3683da681b5cff73
	.xword	0x01f23b1c1bd76fec
	.xword	0x421d81e13104d43d
	.xword	0x1187d6cf934dbf64
	.xword	0x74abe2c9deb431ce
	.xword	0xaf582e89ca66d337
	.xword	0xdd50139b2181ba55
	.xword	0xd258e1b32e37b8e3
	.xword	0xc0290d9073e8a57b
	.xword	0xfd2b1a35df6cabed
	.xword	0x20c5fbfe47e6166c
	.xword	0xa94548ac8addf327
	.xword	0x88d8afd07e91468a
	.xword	0x964438cd4e400154
	.xword	0x0123e3ba21780beb
	.xword	0x671e7ed38c80afff
	.xword	0x438290825a551d4b
	.xword	0xd812175cf9ff261e
	.xword	0x13c112078bb1839c
	.xword	0xc94813197e50654b
	.xword	0x9519f0d411892cdc
	.xword	0x29e07d509d71a592
	.xword	0x74c3e4627734775b
	.xword	0xe4d5caa772d95602
	.xword	0x907cd0b1796a80e7
	.xword	0xc0cdc26cb33ea88b
	.xword	0x43f934c5050aa886
	.xword	0x3e947a4622ca86a3
	.xword	0xcb4fb3d34b7be102
	.xword	0x1f9a7a1dbaaf9847
	.xword	0x0b834bbe80c303c3
	.xword	0x47904bf818e62a38
	.xword	0x85e6e6937413ebc8
	.xword	0xe564b66e17ba7813
	.xword	0x9cdabba298818ba2
	.xword	0x7ffba150d2c8e755
	.xword	0x0e738a3810ce6a4c
	.xword	0xdc3618098636fde9
	.xword	0x20d00bd4acc08fd1
	.xword	0x8d5629546734a58f
	.xword	0xe9d584b701892b00
	.xword	0x1695432e345dfe49
	.xword	0x15fe2ebc5a07154f
	.xword	0x59abcc894cd01beb
	.xword	0x1b0b85934230f1fd
	.xword	0xfec35f3e2101bd98
	.xword	0xfd160c0b1df9e28e
	.xword	0x2f74d4e2b883708d
	.xword	0x3cacd766ad7f4a2f
	.xword	0xe94a450f3b4c0fd0
	.xword	0xdf6d311ba9aa887f
	.xword	0x5f7017767ef8bca0
	.xword	0xe4c64847926246e7
	.xword	0xd0ad7d122e706e77
	.xword	0x829ee869e67fb62f
	.xword	0x917621d8fc170143
	.xword	0x32094a39af8130d1
	.xword	0x9b31d18f2bb9c9c2
	.xword	0xf0269c1e0ca3936f
	.xword	0xe871661a0b5414be
	.xword	0x7622c24b1682761f
	.xword	0xf48c6454ad7abedb
	.xword	0xd1eff2ea2a2fcecb
	.xword	0x059e6a9c02812f4c
	.xword	0x5d4b529082518252
	.xword	0x37e472481fa5ae42
	.xword	0xe707911f34cb0737
	.xword	0x8ce16c201dd759d8
	.xword	0xdb88550b48d245ab
	.xword	0x66962303634c2827
	.xword	0x6615bcfb30d16f96
	.xword	0x621641ac3352e2b2
	.xword	0xefea1a5ec9c836df
	.xword	0x5e13eacf62ff14e1
	.xword	0x1f8d05844cfaaaae
	.xword	0x7067161a49ceb41c
	.xword	0xa49e760541092ae3
	.xword	0x641e01cf3ed4a7ab
	.xword	0xbc6cb3da63dff815
	.xword	0x8071c6e01add5d9f
	.xword	0x22b55af4aa28ec2d
	.xword	0x4d46f3955487a731
	.xword	0x76b1c21548feda08
	.xword	0xdb8c8f59cb463409
	.xword	0xe9b1c242949fc77b
	.xword	0x2beceafa319de6b7
	.xword	0xca95c2021a456187
	.xword	0xd8e0caf58dfd8958
	.xword	0xddbbf909502b2302
	.xword	0x0ac5a26645a6e435
	.xword	0xf79a1d10c52e763b
	.xword	0xa3344fa8d79d9538
	.xword	0xf0f6c3af8b56cb2d
	.xword	0x577cfe3329999ebc
	.xword	0xe4764e54e1163c63
	.xword	0x8942f5540ec85096
	.xword	0x1bd179f74f3ce3a2
	.xword	0x194230876b859f6e
	.xword	0x68b990df1ad08ecf
	.xword	0x0f8cd796f5b7bb6c
	.xword	0x17b0464b547f4285
	.xword	0x03716132c3625cb8
	.xword	0x1d1f97f4b339a22f
	.xword	0xdcb1c52e650b5d81
	.xword	0xc3c5a6c72691c718
	.xword	0x6e80d22e26abcb5c
	.xword	0x265cab135b191bda
	.xword	0x68b787dd88046cec
	.xword	0x165497116cf2758d
	.xword	0x5dbf3aa278d0513b
	.xword	0x6f153ff6dc0b5c73
	.xword	0x2de008a9bc93e891
	.xword	0xea2fbce6d9764737
	.xword	0x1679b4d363ec6950
	.xword	0xf02c87b442902d69
	.xword	0x55767b63d2c19bdf
	.xword	0x01e6ad60e5aba4c1
	.xword	0x3f37ffdd3e0aed24
	.xword	0x9d8cb5ca50e78420
	.xword	0xf08421262191cdb8
	.xword	0x90e8d1d45629c88c
	.xword	0xf8ba1677276402db
	.xword	0xb12828edffbb20c8
	.xword	0xe0ee4317efa0b8ba
	.xword	0xeffc2e30e421ed6d
	.xword	0x2c4cc60978b15167
	.xword	0x3b54757570ebd84f
	.xword	0x5b2c41cc6b07f6bb
	.xword	0xd253daa787df921d
	.xword	0xf9ddf0dd56fe99f6
	.xword	0xae34569e93e1f8b8
	.xword	0xd6cf653f49f18761
	.xword	0xf8ea491eaf47770a
	.xword	0xe1f3a5498555a3e0
	.xword	0xa0c39d717a439ebe
	.xword	0x23b822371a4d79de
	.xword	0xca2eaf6bbc832d76
	.xword	0x0ad590c47064cb95
	.xword	0xfb2521618760d7e6
	.xword	0x411bd1baa9fb5a4a
	.xword	0x334bd6197d20e1eb
	.xword	0x749ce8d7e4373863
	.xword	0xe84b4f75482c401f
	.xword	0x02672fd60236cdb5
	.xword	0xc18f92b3d297da69
	.xword	0x42163fe2c5cb012b
	.xword	0x657345c5c5b6fef1
	.xword	0x480772d46e7542ff
	.xword	0xcc356f722f84da1c
	.xword	0xd9a16f65a03ec83d
	.xword	0xdf32c015019736c2
	.xword	0x47f1515c8c1de899
	.xword	0x4ea8da89ff47b2e7
	.xword	0xe67edfe0674baae5
	.xword	0x3549485f83e7105f
	.xword	0x5d4149aba2cc6afc
	.xword	0x6b08bf8a143ec3f4
	.xword	0x07dd709b92656d14
	.xword	0x46fcdf7e5c433fc8
	.xword	0x38b5c35937a33387
	.xword	0x90abeafab4af565c
	.xword	0x6a9d94993347f0eb
	.xword	0xaeac9e9261f26b7a
	.xword	0x01961416bf4fa383
	.xword	0x7c53770c93e2922a
	.xword	0x44f16e606e00db13
	.xword	0x9c60ed201b518f76
	.xword	0x3d7b7766eaa895f7
	.xword	0x411148164985d4fe
	.xword	0x82d25be3a9dc1822
	.xword	0x28e541603d23d02f
	.xword	0xa9c28e1842d5d0f7
	.xword	0xfb3bcec7f208a820
	.xword	0x0e1be1d52e42e7a1
	.xword	0x4084cea3c9d7d7c4
	.xword	0x7951b8624bf84f74
	.xword	0xb466fac35dac3ae5
	.xword	0x687b4824a00a126c
	.xword	0x24eade61b7cc5008
	.xword	0x8b0dc1b3989f6a9c
	.xword	0xa294bd727501fb8a
	.xword	0x1e90cecab1a627ed
	.xword	0x086eb6f99f2fa6ae
	.xword	0x494021355ec6ad5f
	.xword	0x4d634faabec5501e
	.xword	0x9dc4a6ad7a2b8e50
	.xword	0xc40a08cb1200468c
	.xword	0xe393cf1ef151b4de
	.xword	0xdc1225bae2927748
	.xword	0x79da6d5f3ce41554
	.xword	0xc3db04336eae1c7a
	.xword	0xe0430eb12b1825fe
	.xword	0xab046f585a915532
	.xword	0x313f13a124994bf7
	.xword	0x0a0b35cf52b8d324
	.xword	0x2e56990594eff340
	.xword	0x54de6bb03aa77771
	.xword	0x728d68536b2cc180
	.xword	0xd415dba0a97ccd1c
	.xword	0xd207b56a6b16fad4
	.xword	0xaf8a922a6a4c554a
	.xword	0xffb6075f83797bf1
	.xword	0x2386f6c62cc656fc
	.xword	0xd6da9b5def751cdd
	.xword	0xfb427faa279e374d
	.xword	0x6a481bdddb1dfce1
	.xword	0x47209af49761a0b1
	.xword	0xb81a9c7ef36f9929
	.xword	0x94d2f969aa0286cc
	.xword	0xbdf10a6314dbed9e
	.xword	0x81bca8cf84f1975d
	.xword	0xadd5fc45f393e994
	.xword	0x1f882ea05d8d6b8d
	.xword	0x49128804128ab0ad
	.xword	0x4b97ee276549e7f3
	.xword	0xe27e648ee28fb6d9
	.xword	0x92bcf3002bf6a731
	.xword	0x382f75437835fb89
	.xword	0x97d037599d3bdda5
	.xword	0xee8647915c5dbcc5
	.xword	0xb23b668c3e86fd3b
	.xword	0xbfd86512ad4e9f0e
	.xword	0x5b3910d7a1fa95d6
	.xword	0xffef714204350a77
	.xword	0xa2efb035b85f3f97
	.xword	0xf1b718c24bf5d37b
	.xword	0xa2f59d0ba0f116b0
	.xword	0x0d2f7ad18b59b46c
	.xword	0x335e20caa449c9c6
	.xword	0x881932a774d786cf
	.xword	0x7d902ccac079f2e7
	.xword	0x45454dcfe6bac66a
	.xword	0xa09db9ebc09fd3c2
	.xword	0x8dd74af3c35b61d1
	.xword	0x8211ca9d3492d072
	.xword	0x21eef8856d420df0
	.xword	0xef82b799b10c2dcd
	.xword	0x205e0ab05fc05969
	.xword	0xd077a78ea366587f
	.xword	0x0d1d1ad8faa9e380
	.xword	0xf8cad2d375cf1586
	.xword	0x1e6fe024f1318edf
	.xword	0x20359f1f2f41313c
	.xword	0x287618e36aa5db38
	.xword	0x10b2d8fa2e90bc2a
	.xword	0x00b058561d35b9c4
	.xword	0xc4c5899d99c5daea
	.xword	0x6e1f14303ff65014
	.xword	0x6d4b649edfdce71b
	.xword	0x2a5e526c864d93ef
	.xword	0x02f5af9510004af9
	.xword	0x752d6c4484c0d400
	.xword	0xee7b2d62753e73e5
	.xword	0xef2fa39af0f46e3e
	.xword	0x4101f33520e9ff73
	.xword	0xbac999ceb72b49c4
	.xword	0xb34dec5f8d4fb859
	.xword	0x68796d1362abf8e5
	.xword	0x604f5000441b17d3
	.xword	0x5860bb34b60dc296
	.xword	0x8aeaab2d0ff3cfc6
	.xword	0x310fa8a6e237f3a7
	.xword	0xdf449e3cf66d370e
	.xword	0x6f61543163091769
	.xword	0x3d92154d2c5965f7
	.xword	0x69044bd3fad7b216
	.xword	0xa7f0e2d091aa3b21
	.xword	0x4284b77653eb39df
	.xword	0x0bcb1696a1b0edf2
	.xword	0xf867a95544a04194
	.xword	0xb4d1042b5660b5ff
	.xword	0x629b91cb235e34dc
	.xword	0x47dc49c89da57ee7
	.xword	0x8cacca23c06cde6e
	.xword	0xb4eb4e49abae34c4
	.xword	0x41eddea2da7dbef7
	.xword	0xcf0bdbc62c734474
	.xword	0xa758c7814cfded75
	.xword	0x505f7d89fa609942
	.xword	0x7f5f46397913535e
	.xword	0x667e066294400a2b
	.xword	0xdbfc00190e700560
	.xword	0x0825ca5323eed85e
	.xword	0x6826d1e939a609a9
	.xword	0xdadf03182dae48a4
	.xword	0x27c766ec80357823
	.xword	0x714f5f96fb49a5ea
	.xword	0x17dc0c557c6ec6cd
	.xword	0x0372e65a8520306f
	.xword	0x792ed180c52b0107
	.xword	0xdd439927e5609382
	.xword	0x73cc378257fc4993
	.xword	0x7c4546e3333d668e
	.xword	0x431091382238b472
	.xword	0x4aa3b58896e021d6
	.xword	0x597ec2b77aa40cbc
	.xword	0x2518ec2d63e139dd
	.xword	0x8d98882033b23d2d
	.xword	0x9bfab8b9ecfd81d5
	.xword	0x6fd0009c18ed85f8
	.xword	0x8e0fb7eaca4aed67
	.xword	0x4968276266b96103
	.xword	0x45df8a2ad339164d
	.xword	0x0c69fbd539074c0c
	.xword	0x73039586b5da3e86
	.xword	0xc16c8a3f64ae2073
	.xword	0xc698affee4e84b3e
	.xword	0x8e4e54a6fa880c52
	.xword	0x8700963cfbb27600
	.xword	0x5e9f6bf5f3ffc17c
	.xword	0x0033f1e8122651e6
	.xword	0x8ad4737e36288dc5
	.xword	0x599d404b377eb676
	.xword	0x2af2bafddc1f650b
	.xword	0xfd42f5c83743e65a
	.xword	0x59260f874a5a51f6
	.xword	0xe7cba1c28d547330
	.xword	0x2f33f1a929fe9fed
	.xword	0xbdd216e363594c8c
	.xword	0x3986e9f5b38dfa68
	.xword	0x0d367d84ea737b50
	.xword	0x4eec9e3405498fb3
	.xword	0xd3bb200885b7c703
	.xword	0x52cf9deb44abb568
	.xword	0xbdcf46d5700b6ee5
	.xword	0xba24f465daf7ac68
	.xword	0x36f3a4ca317c08de
	.xword	0x84cd76f1f6eb86b4
	.xword	0x59e58db6084fa267
	.xword	0x8e8f69c0c720d0c7
	.xword	0x3b8955e89919ebe5
	.xword	0x40bff385d75c98c5
	.xword	0x6329838f2470a74a
	.xword	0x0a6e562b01f34f8f
	.xword	0x1b1599bf3415c25f
	.xword	0x775d2faa6d382d60
	.xword	0xd9d4955cb2e5b329
	.xword	0xf2f0f235e2aa1dbc
	.xword	0xb9cfb8c49e3a6dd9
	.xword	0x40b5ce5de110620c
	.xword	0x55a18e402de90beb
	.xword	0xc0fd1fcfb39c0925
	.xword	0x0488faf426addf87
	.xword	0x404c265424a4e34f
	.xword	0xb5030c57cea408ac
	.xword	0x0d898b48bcc18b54
	.xword	0x51aa8b3493304a6c
	.xword	0xd8d5469a2950075b
	.xword	0xebc8981249d07565
	.xword	0xe387ab32749a1173
	.xword	0xf0a2afc40851880b
	.xword	0xa17c38bb25068b95
	.xword	0x516f019a47c68ed8
	.xword	0x0496498d42717e59
	.xword	0x7f7f5ca47b236b1d
	.xword	0x45908a4bf6994d30
	.xword	0xaf283e0796521cd6
	.xword	0xd6618fbdd4ed1aa4
	.xword	0x692d11358a6b24d4
	.xword	0x33183058cb5dc491
	.xword	0x62f6469ed5685999
	.xword	0x9648de2a065767ed
	.xword	0xa93867a6c5716cd6
	.xword	0xe3db818efa6ac0d8
	.xword	0xb33a1ec49296a11e
	.xword	0xe3da2228dcd2b7bc
	.xword	0xdf415ed551edc9d7
	.xword	0xa7e9fa30aba29980
	.xword	0x97c8790ab2eb3268
	.xword	0xe6bceda4295da105
	.xword	0xd2def72de64f471a
	.xword	0xeeec0cd15aa37f73
	.xword	0xbb20244a4360f97d
	.xword	0x97ff6d7cbd6d3a01
	.xword	0xa59137ad641b6da5
	.xword	0x554da6c1bcc5e120
	.xword	0x270e94555ac7285c
	.xword	0xfb5b1c328e164780
	.xword	0xa747dd2d11e030a8
	.xword	0xb212c5cbab61e6c4
	.xword	0x5dfabff3f83b2cf1
	.xword	0xb0ac6e0c3e78b341
	.xword	0xe75f3b8af8652719
	.xword	0xf29d133e2d877ac0
	.xword	0xdac7cea2c2b38967
	.xword	0x173581a4a306dde1
	.xword	0x0b8203a6f9468e45
	.xword	0x61176ba52935e8c4
	.xword	0x6aa278967b90924f
	.xword	0x4789a8163447faa5
	.xword	0x44babf92aa55ac3a
	.xword	0xce3b1f97c1171a2b
	.xword	0x509f4fe1149172ff
	.xword	0xc3d8edf73543fd5f
	.xword	0x014fddbbd12fc1fa
	.xword	0x1cc28076198ff8ef
	.xword	0x9cf1ba6b7662a9ce
	.xword	0xe78e2293409bd518
	.xword	0x00c7411f223dadd5
	.xword	0xce7eefc6cfbc2fe8
	.xword	0xe50f8e6772851ffd
	.xword	0xf97e972b31aff6d3
	.xword	0x1276b5c716411f19
	.xword	0x5c4cd1e48b767826
	.xword	0xd3396edd4e12813d
	.xword	0xcb568794e3e88c49
	.xword	0xe27dd5bf5cb8a3fd
	.xword	0x4e6e1a41f22975aa
	.xword	0x43bef4bee5f1abde
	.xword	0xf27685674bbfd665
	.xword	0x7db724040b616913
	.xword	0x4d30a734376537a3
	.xword	0x244739cd08df0961
	.xword	0xcffe733bda14b95b
	.xword	0x474ffe7e164eecc6
	.xword	0x520a99e7bb428f56
	.xword	0xcf01fbc51aa3b5c5
	.xword	0x1b5c62eb63207651
	.xword	0x8d44dd5c38fb8be1
	.xword	0x64b70cc6d2053ad6
	.xword	0x5640ab4014eb3fa1
	.xword	0xd0722f04276328a2
	.xword	0xf63a2900d6b12549
	.xword	0xf6a4a65fc4f082d9
	.xword	0x182b6f2ccf01797b
	.xword	0x49e336d5a0c54210
	.xword	0x55c1263851846e42
	.xword	0x4a0f945e263387ec
	.xword	0x360c23e8bf8713b8
	.xword	0x15bc0120949f616d
	.xword	0x271619729d87bedb
	.xword	0x5219e306f395e231
	.xword	0x59c42bd4c7b03511
	.xword	0x2a106609e4def052
	.xword	0x1d099fe5729568b6
	.xword	0xf662ced7f31dd4d9
	.xword	0xb7c87eb9c737bb11
	.xword	0xce4f2a5b22f93508
	.xword	0x45328bd472cc3b77
	.xword	0x438e26a816580580
	.xword	0x255c3f4bdee1ddbe
	.xword	0x85f9f6f9487791fc
	.xword	0x388bda294810b359
	.xword	0xba93c2b0b1f715e8
	.xword	0x2d24e0210092eb69
	.xword	0x24e9290fd6193e1a
	.xword	0x3e46489fcd1160f3
	.xword	0x15a6f521751115ce
	.xword	0x8aae10f2918a9b3b
	.xword	0x809691cc1f05226a
	.xword	0xee9c1370454f8251
	.xword	0x8a3d1bc5c54761fe
	.xword	0x190110f632f2e3f2
	.xword	0x50a04fad69d63104
	.xword	0x42ef8e2e1f8aac1f
	.xword	0x4a91fcfc12f969e3
	.xword	0xe65e3ed3292e46ea
	.xword	0xa9720b8bc478abc2
	.xword	0xa8d9bdf5d3559955
	.xword	0x4882e36c938cd25f
	.xword	0x9a30c7abb776a068
	.xword	0xc7d938c850262089
	.xword	0x63fb547703a26ace
	.xword	0x844e0164ccb4fcf5
	.xword	0x6e43b288374d6cd5
	.xword	0x81a989f4dea5d7c3
	.xword	0x27fc4ea179ec3e5a
	.xword	0xd1179019c60e9587
	.xword	0x558f73b659af753d
	.xword	0x533e6b44852d4c8a
	.xword	0xec8faa1f8bb62570
	.xword	0xaef9cb7918fdff3d
	.xword	0xc933936c92f6c9b0
	.xword	0xbc50c81d9369ce0c
	.xword	0x60c0c7989f6a7a4a
	.xword	0x67ac8f78432aefb6
	.xword	0xd1efa48ae2466755
	.xword	0xd101c3aa24b2bf6b
	.xword	0xb207f29ea1877a06
	.xword	0x9e6f265eebd93735
	.xword	0x466755a1cc1c0449
	.xword	0x094be0097b3bc6fd
	.xword	0x2473a9c8e5e5f93a
	.xword	0xeae6d0842e5038b4
	.xword	0xeb278cf1d243ca7b
	.xword	0x7ce329281e04fabf
	.xword	0xcf87974cacae6cde
	.xword	0x5042d4c073a4c257
	.xword	0x4caaa813645293b9
	.xword	0xb5d4e096516e43ac
	.xword	0x644af5535432d948
	.xword	0xcf4357dc45adf977
	.xword	0xeb07097da9554e3c
	.xword	0xce90e0172a71b93a
	.xword	0x1345063b4abbef18
	.xword	0xe945945395b5b166
	.xword	0x6b5a08aaefd583ff
	.xword	0xf7e120c328a6e1b5
	.xword	0xd6446b22919dd9c7
	.xword	0x88fd2d1615cfb9a2
	.xword	0x345e4e28cac893a0
	.xword	0x211372f3dab26d9f
	.xword	0xfc3072191d7b09fb
	.xword	0xa64c7be9976e50cb
	.xword	0x605aa391ad9e58eb
	.xword	0x8ff22aa31f36d73f
	.xword	0xb9c60977ac3c604d
	.xword	0x30b869fd3bae078f
	.xword	0x9d505cedb5a7c2f2
	.xword	0x8240f630b12178ca
	.xword	0x46fd7d9b301637b0
	.xword	0xd9c2c38f11b571ea
	.xword	0x6be813fe14d4c0b2
	.xword	0xc505fff91fad0a27
	.xword	0x3d54fc1657c4c07d
	.xword	0x162d7edb7a5ed98e
	.xword	0xe4e260cc1b084f0f
	.xword	0x8db38563acc1156d
	.xword	0x7995fbcf06ced6eb
	.xword	0xd745375e62b7464f
	.xword	0x02865d634b6f15f4
	.xword	0x663d87537d0b2947
	.xword	0x0f9091342e16f2da
	.xword	0x5ccd7772327ca615
	.xword	0x29f5fef25a25a69a
	.xword	0x623a45687c62bcf9
	.xword	0xd3a03da9bfe2deea
	.xword	0x8915393fea6365c8
	.xword	0xd8bd508952912d23
	.xword	0xfae46a101661a36b
	.xword	0x064d69012fcdba1b
	.xword	0x9fc84f3da28bf34e
	.xword	0x2cfe772f57e7f50a
	.xword	0xace6538ab5cd0e27
	.xword	0x2832bfeb8b1d26db
	.xword	0xc348eaadb230afdd
	.xword	0x9026e58bef3649cf
	.xword	0x221e78a41ae0b845
	.xword	0xd60a4227c46af995
	.xword	0x029057f030f0b5cb
	.xword	0x12a6a6d440a04430
	.xword	0xa318dee016aaa1cf
	.xword	0xcf2d5325acac5169
	.xword	0x3f7ba243e691a133
	.xword	0x8021183a97906d3c
	.xword	0x4d6af55f2c594801
	.xword	0x0fdfd2bf3e3c32d3
	.xword	0x05ee28ee9a14bb20
	.xword	0x7c38931a668388d5
	.xword	0xc3b1318150fe92e0
	.xword	0x2dbb1141e55477aa
	.xword	0x8fc8c9e147da80bb
	.xword	0xb09c7ebf3cd9c57d
	.xword	0x64c0a92ff56ea471
	.xword	0x0c28b9cabaf2a5fe
	.xword	0x7153ba249e574010
	.xword	0x441595cf7d883ec4
	.xword	0x73d4b9bd3b0375f7
	.xword	0xb302a691623a5ecb
	.xword	0x1ba4ed937d4f1f86
	.xword	0xaae69221d17fb8a6
	.xword	0xdfb2b3c339cbc926
	.xword	0x6c1d0085e4fb2c94
	.xword	0xe25c8ece85189cd3
	.xword	0x853908a16101a6b1
	.xword	0x6e23fe948ddb5c25
	.xword	0xebba8694159889ff
	.xword	0x8bba89193dfb3a7a
	.xword	0x58a97396fb2cea77
	.xword	0xe98a854c90b9b0d8
	.xword	0x82c26f736bd1bfcc
	.xword	0xfc39effd07f9e4a1
	.xword	0x79198a9c566ad6bd
	.xword	0x8a1b76741da4d8a0
	.xword	0xe8273aad48c6bbd2
	.xword	0x0bf6185cce5eb93a
	.xword	0x4fb305c84e105e93
	.xword	0x29b3cce23896f8ca
	.xword	0x3c1ec7e26609f10a
	.xword	0x2d77e6df1d7e6346
	.xword	0xff01839b81bcb119
	.xword	0x922eb764a1c1c22e
	.xword	0xea14cacb75da049e
	.xword	0x03f847965674c504
	.xword	0x6ab93abed4f84418
	.xword	0xce62becb8e7d88d0
	.xword	0x0f9d59ca570d3731
	.xword	0xd6a82f25ed043baa
	.xword	0x6e1e48f2604abbb4
	.xword	0x334fcb814de4e0bf
	.xword	0x9fb4e714b840e0c0
	.xword	0xfc67829e8456cb68
	.xword	0x6588c39c6307c23b
	.xword	0x410c8bab872d255d
	.xword	0x5c4ddee7ac348dce
	.xword	0xa7168e943e1b6b25
	.xword	0x7196b48bbde56608
	.xword	0x18316fd13b842342
	.xword	0x4947adc3259acb06
	.xword	0x073e0e5976387579
	.xword	0xb0e9d9dc6beedd9d
	.xword	0xc6a3f788626bbf73
	.xword	0xdb883f8ab27e3329
	.xword	0x0735303f99a45c15
	.xword	0x7a5dc0af0da20fe6
	.xword	0x93256dbf646abeea
	.xword	0x2c8725abdfe02841
	.xword	0x72ae1abb89bdd249
	.xword	0x308c710804e2b319
	.xword	0xedaf63b2b3c1cc59
	.xword	0x6000a9f45625ebdb
	.xword	0x6e9ddd0a3d018896
	.xword	0xd1d9a5d0f639ade1
	.xword	0xe80911a70ca1ef7d
	.xword	0xa36f2ff7d2fcb282
	.xword	0xee37650cdd5fb121
	.xword	0x8edc06ee6cf2e9b9
	.xword	0x580a3b6d20d43bb2
	.xword	0xb9a0b5658c41d89c
	.xword	0x01fb086cff36c817
	.xword	0x7ef8559a254b9a6a
	.xword	0x528e07c5ebf841ed
	.xword	0x5e149f75704d95c7
	.xword	0xa5711a0eabf4166d
	.xword	0x87eb6be928e1c771
	.xword	0xe8b624a2f621798a
	.xword	0x1b97481cbb95b259
	.xword	0x5af4675f01e7eb98
	.xword	0x7e3c80fc2feaf78c
	.xword	0xad6d4bd4e5d7829c
	.xword	0xcb0ddf51a3c2f960
	.xword	0x72686d374eeee1ed
	.xword	0x8a554206e0abc580
	.xword	0xc34bac2350691266
	.xword	0x5b3d7265d3bc15ac
	.xword	0x71f941178c85c68f
	.xword	0x845de1bf2a7001d6
	.xword	0x7ceeedd5a963c942
	.xword	0x71487b561481f43d
	.xword	0x3ac4010a1e39d882
	.xword	0x8e9af61f3e8ef9b4
	.xword	0x60227f32154f8fac
	.xword	0x5dd6fb000c13ca9e
	.xword	0x6eee343536567ef5
	.xword	0x91e835384320ea06
	.xword	0xeff41273f8b07295
	.xword	0x9c3de4538efbec3a
	.xword	0x6d6e66066c775527
	.xword	0xaf4350e052557870
	.xword	0xac4ec3b44164b6d7
	.xword	0x184c47e5672c7b6f
	.xword	0xc82c2151dbfd3585
	.xword	0xb49e4db38dc13f22
	.xword	0xa2a945baa02fd9cc
	.xword	0x2a5a527be64dfc44
	.xword	0x115e8626b760b2ae
	.xword	0x24f1a7df1aff5f7c
	.xword	0x7f36f47dba697b15
	.xword	0xdf4db4439f332cfb
	.xword	0x9c44dc97d9be835c
	.xword	0xfa6b53e43dc296ad
	.xword	0x5e8d4ec64be21095
	.xword	0xc9d89bdc3d465ddb
	.xword	0xb8bcacc4f59a75f2
	.xword	0x33701946d9233070
	.xword	0x3728107c8a672a29
	.xword	0xd77572a3177ed7a4
	.xword	0x233fa0472a12e7bd
	.xword	0x1bb5b5af4be1c161
	.xword	0xa26e1888b8fd3c59
	.xword	0x963d0d2d532e910e
	.xword	0x63997b22894189c2
	.xword	0x77c23b674a31a40f
	.xword	0x32c8fedeed9c4c6e
	.xword	0xf43baaee4a5bfc08
	.xword	0x17bf8f8c2f127569
	.xword	0x2e6c9b0f7dc75b71
	.xword	0xdc87345f696a81bd
	.xword	0xd0cc157a5e6557b7
	.xword	0x8ab217beb37b9c2f
	.xword	0xc1695a7dfa07a662
	.xword	0xbcec6956dadf5fa6
	.xword	0x24436048ba7f0774
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx	t2_data_start_0,%g0, %r1
	add	%r1,0,%r2
	add	%g0,0,%r3
	.word 0xa57cadf7  ! 1: MOVR_I	movl	%r18, 0x1, %r18
	.word 0x0ac50003  ! 2: BRNZ	brnz  ,nt	%r20,<label_0x50003>
	.word 0xe4588003  ! 3: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe8588003  ! 4: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa57d2cc2  ! 5: MOVR_I	movl	%r20, 0x1, %r18
	.word 0x06c48003  ! 6: BRLZ	brlz  ,nt	%r18,<label_0x48003>
	.word 0xe8708003  ! 7: STX_R	stx	%r20, [%r2 + %r3]
	.word 0x0acc8001  ! 8: BRNZ	brnz  ,pt	%r18,<label_0xc8001>
	.word 0xe458a048  ! 9: LDX_I	ldx	[%r2 + 0x0048], %r18
	.word 0xa57ca4e5  ! 10: MOVR_I	move	%r18, 0x1, %r18
	.word 0xe400a0b0  ! 11: LDUW_I	lduw	[%r2 + 0x00b0], %r18
	.word 0xa77c9412  ! 12: MOVR_R	movcs	%r18, %r18, %r19
	.word 0xe8008003  ! 13: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa57d2e74  ! 14: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa57c9812  ! 15: MOVR_R	movneg	%r18, %r18, %r18
	.word 0xe4388003  ! 16: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa40cc012  ! 17: AND_R	and 	%r19, %r18, %r18
	.word 0xa40c8012  ! 18: AND_R	and 	%r18, %r18, %r18
	.word 0xe8708003  ! 19: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa77d2e62  ! 20: MOVR_I	movl	%r20, 0x1, %r19
	.word 0xa44c8012  ! 21: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xa57c8c12  ! 22: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa57d2e59  ! 23: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa77ca838  ! 24: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xe4188003  ! 25: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa57c8812  ! 26: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa44c8012  ! 27: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xa57c8413  ! 28: MOVR_R	move	%r18, %r19, %r18
	.word 0xa57d0813  ! 29: MOVR_R	movle	%r20, %r19, %r18
	.word 0xa8148012  ! 30: OR_R	or 	%r18, %r18, %r20
	.word 0xe8708003  ! 31: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa80cc012  ! 32: AND_R	and 	%r19, %r18, %r20
	.word 0xa97cef2e  ! 33: MOVR_I	movl	%r19, 0x1, %r20
	.word 0x02c4c003  ! 34: BRZ	brz  ,nt	%r19,<label_0x4c003>
	.word 0xe4388003  ! 35: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa40c8013  ! 36: AND_R	and 	%r18, %r19, %r18
	.word 0x0ec48002  ! 37: BRGEZ	brgez  ,nt	%r18,<label_0x48002>
	.word 0xa77ced54  ! 38: MOVR_I	movl	%r19, 0x1, %r19
	.word 0xa60c8013  ! 39: AND_R	and 	%r18, %r19, %r19
	.word 0xa64d0013  ! 40: MULX_R	mulx 	%r20, %r19, %r19
	.word 0xe870a070  ! 41: STX_I	stx	%r20, [%r2 + 0x0070]
	.word 0xe4588003  ! 42: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe470a090  ! 43: STX_I	stx	%r18, [%r2 + 0x0090]
	.word 0xe470a000  ! 44: STX_I	stx	%r18, [%r2 + 0x0000]
	.word 0xe4408003  ! 45: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa57cee27  ! 46: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xa57ca482  ! 47: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa84d0012  ! 48: MULX_R	mulx 	%r20, %r18, %r20
	.word 0xe470a090  ! 49: STX_I	stx	%r18, [%r2 + 0x0090]
	.word 0xe840a0a8  ! 50: LDSW_I	ldsw	[%r2 + 0x00a8], %r20
	.word 0xe870a0d0  ! 51: STX_I	stx	%r20, [%r2 + 0x00d0]
	.word 0x0ccc8001  ! 52: BRGZ	brgz  ,pt	%r18,<label_0xc8001>
	.word 0xe400a040  ! 53: LDUW_I	lduw	[%r2 + 0x0040], %r18
	.word 0xe4588003  ! 54: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x86002040  ! 56: ADD_I	add 	%r0, 0x0040, %r3
	.word 0xa57ca5b9  ! 57: MOVR_I	move	%r18, 0x1, %r18
	.word 0x04c4c002  ! 58: BRLEZ	brlez  ,nt	%r19,<label_0x4c002>
	.word 0xa57ca8b1  ! 59: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa57d0c12  ! 60: MOVR_R	movl	%r20, %r18, %r18
	.word 0xa77ca405  ! 61: MOVR_I	move	%r18, 0x1, %r19
	.word 0x04c4c001  ! 62: BRLEZ	brlez  ,nt	%r19,<label_0x4c001>
	.word 0xe4008003  ! 63: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe4388003  ! 64: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa804c012  ! 65: ADD_R	add 	%r19, %r18, %r20
	.word 0xa6050013  ! 66: ADD_R	add 	%r20, %r19, %r19
	.word 0xa4050013  ! 67: ADD_R	add 	%r20, %r19, %r18
	.word 0xa57c9412  ! 68: MOVR_R	movcs	%r18, %r18, %r18
	.word 0xa97cc413  ! 69: MOVR_R	move	%r19, %r19, %r20
	.word 0x2acd0001  ! 70: BRNZ	brnz,a,pt	%r20,<label_0xd0001>
	.word 0x0cc48003  ! 71: BRGZ	brgz  ,nt	%r18,<label_0x48003>
	.word 0x860020b0  ! 73: ADD_I	add 	%r0, 0x00b0, %r3
	.word 0xe458a040  ! 74: LDX_I	ldx	[%r2 + 0x0040], %r18
	.word 0xa4148012  ! 75: OR_R	or 	%r18, %r18, %r18
	.word 0xe4388003  ! 76: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe8188003  ! 77: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xe818a000  ! 78: LDD_I	ldd	[%r2 + 0x0000], %r20
	.word 0x2accc002  ! 79: BRNZ	brnz,a,pt	%r19,<label_0xcc002>
	.word 0xa97ccc13  ! 80: MOVR_R	movl	%r19, %r19, %r20
	.word 0xa8048012  ! 81: ADD_R	add 	%r18, %r18, %r20
	.word 0xa97d2c83  ! 82: MOVR_I	movl	%r20, 0x1, %r20
	.word 0xa57ccc12  ! 83: MOVR_R	movl	%r19, %r18, %r18
	.word 0xa4048012  ! 84: ADD_R	add 	%r18, %r18, %r18
	.word 0xe440a058  ! 85: LDSW_I	ldsw	[%r2 + 0x0058], %r18
	.word 0xa44c8012  ! 86: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xe4708003  ! 87: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe400a0e8  ! 88: LDUW_I	lduw	[%r2 + 0x00e8], %r18
	.word 0xa57ce824  ! 89: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa57d0412  ! 90: MOVR_R	move	%r20, %r18, %r18
	.word 0xa57d2d5c  ! 91: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa77cd412  ! 92: MOVR_R	movcs	%r19, %r18, %r19
	.word 0xa97d2bdd  ! 93: MOVR_I	movle	%r20, 0x1, %r20
	.word 0xa57cb7e9  ! 94: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xa77c8413  ! 95: MOVR_R	move	%r18, %r19, %r19
	.word 0xe8588003  ! 96: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa97d0c12  ! 97: MOVR_R	movl	%r20, %r18, %r20
	.word 0xe440a0a8  ! 98: LDSW_I	ldsw	[%r2 + 0x00a8], %r18
	.word 0x84006100  ! 100: ADD_I	add 	%r1, 0x0100, %r2
	.word 0xa57cab08  ! 101: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xe840a010  ! 102: LDSW_I	ldsw	[%r2 + 0x0010], %r20
	.word 0xe870a078  ! 103: STX_I	stx	%r20, [%r2 + 0x0078]
	.word 0xa57cafd0  ! 104: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa8150013  ! 105: OR_R	or 	%r20, %r19, %r20
	.word 0xa97cc412  ! 106: MOVR_R	move	%r19, %r18, %r20
	.word 0x26c50001  ! 107: BRLZ	brlz,a,nt	%r20,<label_0x50001>
	.word 0xe470a0d8  ! 108: STX_I	stx	%r18, [%r2 + 0x00d8]
	.word 0xe4588003  ! 109: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57c9413  ! 110: MOVR_R	movcs	%r18, %r19, %r18
	.word 0xa97d0812  ! 111: MOVR_R	movle	%r20, %r18, %r20
	.word 0xa57cd813  ! 112: MOVR_R	movneg	%r19, %r19, %r18
	.word 0xa57ccc12  ! 113: MOVR_R	movl	%r19, %r18, %r18
	.word 0xa57ca666  ! 114: MOVR_I	move	%r18, 0x1, %r18
	.word 0x26c50003  ! 115: BRLZ	brlz,a,nt	%r20,<label_0x50003>
	.word 0xa57c8813  ! 116: MOVR_R	movle	%r18, %r19, %r18
	.word 0xa4150012  ! 117: OR_R	or 	%r20, %r18, %r18
	.word 0xa57ccc13  ! 118: MOVR_R	movl	%r19, %r19, %r18
	.word 0xa60c8012  ! 119: AND_R	and 	%r18, %r18, %r19
	.word 0xa60c8012  ! 120: AND_R	and 	%r18, %r18, %r19
	.word 0xa97c9813  ! 121: MOVR_R	movneg	%r18, %r19, %r20
	.word 0xe8408003  ! 122: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa57cb8bc  ! 123: MOVR_I	movneg	%r18, 0x1, %r18
	.word 0xa97c9813  ! 124: MOVR_R	movneg	%r18, %r19, %r20
	.word 0xa57d2d06  ! 125: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xe418a0c8  ! 126: LDD_I	ldd	[%r2 + 0x00c8], %r18
	.word 0xa57ce62a  ! 127: MOVR_I	move	%r19, 0x1, %r18
	.word 0xe4708003  ! 128: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe440a028  ! 129: LDSW_I	ldsw	[%r2 + 0x0028], %r18
	.word 0xa57d0412  ! 130: MOVR_R	move	%r20, %r18, %r18
	.word 0xa77c8812  ! 131: MOVR_R	movle	%r18, %r18, %r19
	.word 0xa57ccc12  ! 132: MOVR_R	movl	%r19, %r18, %r18
	.word 0xe400a040  ! 133: LDUW_I	lduw	[%r2 + 0x0040], %r18
	.word 0xe418a050  ! 134: LDD_I	ldd	[%r2 + 0x0050], %r18
	.word 0xa77ccc12  ! 135: MOVR_R	movl	%r19, %r18, %r19
	.word 0xa8248012  ! 136: SUB_R	sub 	%r18, %r18, %r20
	.word 0xa97cdc13  ! 137: MOVR_R	movvs	%r19, %r19, %r20
	.word 0xa57c8812  ! 138: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa97cfaa2  ! 139: MOVR_I	movneg	%r19, 0x1, %r20
	.word 0x86002090  ! 141: ADD_I	add 	%r0, 0x0090, %r3
	.word 0xa77cd812  ! 142: MOVR_R	movneg	%r19, %r18, %r19
	.word 0x860020c0  ! 144: ADD_I	add 	%r0, 0x00c0, %r3
	.word 0xa77c8c12  ! 145: MOVR_R	movl	%r18, %r18, %r19
	.word 0xa57caaf5  ! 146: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xe4008003  ! 147: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0x0ecc8003  ! 148: BRGEZ	brgez  ,pt	%r18,<label_0xc8003>
	.word 0xe8588003  ! 149: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa97c9c13  ! 150: MOVR_R	movvs	%r18, %r19, %r20
	.word 0xe4188003  ! 151: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xe840a060  ! 152: LDSW_I	ldsw	[%r2 + 0x0060], %r20
	.word 0x86002040  ! 154: ADD_I	add 	%r0, 0x0040, %r3
	.word 0xe470a028  ! 155: STX_I	stx	%r18, [%r2 + 0x0028]
	.word 0xe4008003  ! 156: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa97d2ebf  ! 157: MOVR_I	movl	%r20, 0x1, %r20
	.word 0xe440a050  ! 158: LDSW_I	ldsw	[%r2 + 0x0050], %r18
	.word 0xa77ca7df  ! 159: MOVR_I	move	%r18, 0x1, %r19
	.word 0xe8388003  ! 160: STD_R	std	%r20, [%r2 + %r3]
	.word 0xa57caaf5  ! 161: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa97c8c12  ! 162: MOVR_R	movl	%r18, %r18, %r20
	.word 0xa57c8412  ! 163: MOVR_R	move	%r18, %r18, %r18
	.word 0xe870a0d8  ! 164: STX_I	stx	%r20, [%r2 + 0x00d8]
	.word 0xa57cba07  ! 165: MOVR_I	movneg	%r18, 0x1, %r18
	.word 0xa57d0413  ! 166: MOVR_R	move	%r20, %r19, %r18
	.word 0x2ecd0001  ! 167: BRGEZ	brgez,a,pt	%r20,<label_0xd0001>
	.word 0xa57caf15  ! 168: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xe440a050  ! 169: LDSW_I	ldsw	[%r2 + 0x0050], %r18
	.word 0xa57d0812  ! 170: MOVR_R	movle	%r20, %r18, %r18
	.word 0xa77ca96f  ! 171: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa424c013  ! 172: SUB_R	sub 	%r19, %r19, %r18
	.word 0xe440a0c0  ! 173: LDSW_I	ldsw	[%r2 + 0x00c0], %r18
	.word 0x04cd0001  ! 174: BRLEZ	brlez  ,pt	%r20,<label_0xd0001>
	.word 0xe440a008  ! 175: LDSW_I	ldsw	[%r2 + 0x0008], %r18
	.word 0xa97c8413  ! 176: MOVR_R	move	%r18, %r19, %r20
	.word 0xe4708003  ! 177: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa97cadbd  ! 178: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xe418a0d0  ! 179: LDD_I	ldd	[%r2 + 0x00d0], %r18
	.word 0xa57d37fd  ! 180: MOVR_I	movcs	%r20, 0x1, %r18
	.word 0xa57d2cde  ! 181: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa77c8412  ! 182: MOVR_R	move	%r18, %r18, %r19
	.word 0xa57caa3f  ! 183: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa57c8c12  ! 184: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa57cbc61  ! 185: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa6150012  ! 186: OR_R	or 	%r20, %r18, %r19
	.word 0xa414c012  ! 187: OR_R	or 	%r19, %r18, %r18
	.word 0xa77ceade  ! 188: MOVR_I	movle	%r19, 0x1, %r19
	.word 0xa57cc412  ! 189: MOVR_R	move	%r19, %r18, %r18
	.word 0xa97d3bcc  ! 190: MOVR_I	movneg	%r20, 0x1, %r20
	.word 0xe470a070  ! 191: STX_I	stx	%r18, [%r2 + 0x0070]
	.word 0xa60c8012  ! 192: AND_R	and 	%r18, %r18, %r19
	.word 0xa77caccc  ! 193: MOVR_I	movl	%r18, 0x1, %r19
	.word 0x86002048  ! 195: ADD_I	add 	%r0, 0x0048, %r3
	.word 0xa57c8812  ! 196: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa97ca5b6  ! 197: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa57c8413  ! 198: MOVR_R	move	%r18, %r19, %r18
	.word 0x0cc50001  ! 199: BRGZ	brgz  ,nt	%r20,<label_0x50001>
	.word 0xa64cc012  ! 200: MULX_R	mulx 	%r19, %r18, %r19
	.word 0xe418a090  ! 201: LDD_I	ldd	[%r2 + 0x0090], %r18
	.word 0xa97d0413  ! 202: MOVR_R	move	%r20, %r19, %r20
	.word 0xa77cc413  ! 203: MOVR_R	move	%r19, %r19, %r19
	.word 0xa44c8013  ! 204: MULX_R	mulx 	%r18, %r19, %r18
	.word 0xa77c8412  ! 205: MOVR_R	move	%r18, %r18, %r19
	.word 0xa77c9c12  ! 206: MOVR_R	movvs	%r18, %r18, %r19
	.word 0xe4588003  ! 207: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57cc812  ! 208: MOVR_R	movle	%r19, %r18, %r18
	.word 0xa77ca83f  ! 209: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa97ca717  ! 210: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa77ca8d9  ! 211: MOVR_I	movle	%r18, 0x1, %r19
	.word 0x0ec4c002  ! 212: BRGEZ	brgez  ,nt	%r19,<label_0x4c002>
	.word 0xe470a060  ! 213: STX_I	stx	%r18, [%r2 + 0x0060]
	.word 0xa4248013  ! 214: SUB_R	sub 	%r18, %r19, %r18
	.word 0xe8008003  ! 215: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa4250012  ! 216: SUB_R	sub 	%r20, %r18, %r18
	.word 0xa57cdc12  ! 217: MOVR_R	movvs	%r19, %r18, %r18
	.word 0xe4588003  ! 218: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe400a088  ! 219: LDUW_I	lduw	[%r2 + 0x0088], %r18
	.word 0xa824c013  ! 220: SUB_R	sub 	%r19, %r19, %r20
	.word 0xa77ca774  ! 221: MOVR_I	move	%r18, 0x1, %r19
	.word 0xa77c8812  ! 222: MOVR_R	movle	%r18, %r18, %r19
	.word 0xe4588003  ! 223: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa77cfd76  ! 224: MOVR_I	movvs	%r19, 0x1, %r19
	.word 0x84006e00  ! 226: ADD_I	add 	%r1, 0x0e00, %r2
	.word 0xe418a090  ! 227: LDD_I	ldd	[%r2 + 0x0090], %r18
	.word 0xa57d0412  ! 228: MOVR_R	move	%r20, %r18, %r18
	.word 0x06c48002  ! 229: BRLZ	brlz  ,nt	%r18,<label_0x48002>
	.word 0xa64c8013  ! 230: MULX_R	mulx 	%r18, %r19, %r19
	.word 0xa57cd812  ! 231: MOVR_R	movneg	%r19, %r18, %r18
	.word 0xa77cbe5f  ! 232: MOVR_I	movvs	%r18, 0x1, %r19
	.word 0xa604c012  ! 233: ADD_R	add 	%r19, %r18, %r19
	.word 0x06ccc002  ! 234: BRLZ	brlz  ,pt	%r19,<label_0xcc002>
	.word 0xa40cc012  ! 235: AND_R	and 	%r19, %r18, %r18
	.word 0xa57ce72e  ! 236: MOVR_I	move	%r19, 0x1, %r18
	.word 0xa57d2c7f  ! 237: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa57c8c12  ! 238: MOVR_R	movl	%r18, %r18, %r18
	.word 0x86002070  ! 240: ADD_I	add 	%r0, 0x0070, %r3
	.word 0xe4408003  ! 241: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0x84006200  ! 243: ADD_I	add 	%r1, 0x0200, %r2
	.word 0xa97cee1c  ! 244: MOVR_I	movl	%r19, 0x1, %r20
	.word 0xe458a020  ! 245: LDX_I	ldx	[%r2 + 0x0020], %r18
	.word 0xa57d0c13  ! 246: MOVR_R	movl	%r20, %r19, %r18
	.word 0xa77c8412  ! 247: MOVR_R	move	%r18, %r18, %r19
	.word 0xe400a080  ! 248: LDUW_I	lduw	[%r2 + 0x0080], %r18
	.word 0x0ec48003  ! 249: BRGEZ	brgez  ,nt	%r18,<label_0x48003>
	.word 0xa97cc412  ! 250: MOVR_R	move	%r19, %r18, %r20
	.word 0xa97ca6d6  ! 251: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa57cbf7c  ! 252: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0x86002028  ! 254: ADD_I	add 	%r0, 0x0028, %r3
	.word 0xe440a0b0  ! 255: LDSW_I	ldsw	[%r2 + 0x00b0], %r18
	.word 0xe400a090  ! 256: LDUW_I	lduw	[%r2 + 0x0090], %r18
	.word 0x06c48001  ! 257: BRLZ	brlz  ,nt	%r18,<label_0x48001>
	.word 0xa57cc812  ! 258: MOVR_R	movle	%r19, %r18, %r18
	.word 0xa77ca83e  ! 259: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xe800a030  ! 260: LDUW_I	lduw	[%r2 + 0x0030], %r20
	.word 0x0cc50002  ! 261: BRGZ	brgz  ,nt	%r20,<label_0x50002>
	.word 0xa4250013  ! 262: SUB_R	sub 	%r20, %r19, %r18
	.word 0xa57d3986  ! 263: MOVR_I	movneg	%r20, 0x1, %r18
	.word 0xe8188003  ! 264: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xe4408003  ! 265: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe418a058  ! 266: LDD_I	ldd	[%r2 + 0x0058], %r18
	.word 0xe4188003  ! 267: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xe418a078  ! 268: LDD_I	ldd	[%r2 + 0x0078], %r18
	.word 0xa97d3a7c  ! 269: MOVR_I	movneg	%r20, 0x1, %r20
	.word 0xe4408003  ! 270: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe470a020  ! 271: STX_I	stx	%r18, [%r2 + 0x0020]
	.word 0xe858a0c0  ! 272: LDX_I	ldx	[%r2 + 0x00c0], %r20
	.word 0xa97cab38  ! 273: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa57c8812  ! 274: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa57ce961  ! 275: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa57c9c12  ! 276: MOVR_R	movvs	%r18, %r18, %r18
	.word 0xe4708003  ! 277: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa97cee84  ! 278: MOVR_I	movl	%r19, 0x1, %r20
	.word 0xa97ca406  ! 279: MOVR_I	move	%r18, 0x1, %r20
	.word 0xe8708003  ! 280: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa57d0813  ! 281: MOVR_R	movle	%r20, %r19, %r18
	.word 0xe440a020  ! 282: LDSW_I	ldsw	[%r2 + 0x0020], %r18
	.word 0x2ec4c003  ! 283: BRGEZ	brgez,a,nt	%r19,<label_0x4c003>
	.word 0xa804c013  ! 284: ADD_R	add 	%r19, %r19, %r20
	.word 0xa97c8413  ! 285: MOVR_R	move	%r18, %r19, %r20
	.word 0xa6250013  ! 286: SUB_R	sub 	%r20, %r19, %r19
	.word 0xa57d0813  ! 287: MOVR_R	movle	%r20, %r19, %r18
	.word 0xa57cc413  ! 288: MOVR_R	move	%r19, %r19, %r18
	.word 0xe458a0b8  ! 289: LDX_I	ldx	[%r2 + 0x00b8], %r18
	.word 0xa97cee54  ! 290: MOVR_I	movl	%r19, 0x1, %r20
	.word 0x86002020  ! 292: ADD_I	add 	%r0, 0x0020, %r3
	.word 0xa97cadf2  ! 293: MOVR_I	movl	%r18, 0x1, %r20
	.word 0x0ccd0003  ! 294: BRGZ	brgz  ,pt	%r20,<label_0xd0003>
	.word 0xa40d0013  ! 295: AND_R	and 	%r20, %r19, %r18
	.word 0xa8248013  ! 296: SUB_R	sub 	%r18, %r19, %r20
	.word 0x86002058  ! 298: ADD_I	add 	%r0, 0x0058, %r3
	.word 0x04c48003  ! 299: BRLEZ	brlez  ,nt	%r18,<label_0x48003>
	.word 0x2acd0003  ! 300: BRNZ	brnz,a,pt	%r20,<label_0xd0003>
	.word 0xe800a080  ! 301: LDUW_I	lduw	[%r2 + 0x0080], %r20
	.word 0xe440a028  ! 302: LDSW_I	ldsw	[%r2 + 0x0028], %r18
	.word 0xa97c8812  ! 303: MOVR_R	movle	%r18, %r18, %r20
	.word 0xe458a040  ! 304: LDX_I	ldx	[%r2 + 0x0040], %r18
	.word 0xa97c9412  ! 305: MOVR_R	movcs	%r18, %r18, %r20
	.word 0xa77d1413  ! 306: MOVR_R	movcs	%r20, %r19, %r19
	.word 0xe4008003  ! 307: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa97c8c12  ! 308: MOVR_R	movl	%r18, %r18, %r20
	.word 0xa57d0412  ! 309: MOVR_R	move	%r20, %r18, %r18
	.word 0xa604c012  ! 310: ADD_R	add 	%r19, %r18, %r19
	.word 0x06c4c002  ! 311: BRLZ	brlz  ,nt	%r19,<label_0x4c002>
	.word 0x22c48003  ! 312: BRZ	brz,a,nt	%r18,<label_0x48003>
	.word 0xa57c8412  ! 313: MOVR_R	move	%r18, %r18, %r18
	.word 0xa57ce40c  ! 314: MOVR_I	move	%r19, 0x1, %r18
	.word 0xa97d1c12  ! 315: MOVR_R	movvs	%r20, %r18, %r20
	.word 0x06c48003  ! 316: BRLZ	brlz  ,nt	%r18,<label_0x48003>
	.word 0xe858a040  ! 317: LDX_I	ldx	[%r2 + 0x0040], %r20
	.word 0xa60c8013  ! 318: AND_R	and 	%r18, %r19, %r19
	.word 0x86002080  ! 320: ADD_I	add 	%r0, 0x0080, %r3
	.word 0xa57cfa3d  ! 321: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0xa97cabf3  ! 322: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa57cad74  ! 323: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa77d2f9b  ! 324: MOVR_I	movl	%r20, 0x1, %r19
	.word 0xe8588003  ! 325: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe4408003  ! 326: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe470a050  ! 327: STX_I	stx	%r18, [%r2 + 0x0050]
	.word 0xa84c8012  ! 328: MULX_R	mulx 	%r18, %r18, %r20
	.word 0xa60c8012  ! 329: AND_R	and 	%r18, %r18, %r19
	.word 0xa97d1412  ! 330: MOVR_R	movcs	%r20, %r18, %r20
	.word 0xa4150012  ! 331: OR_R	or 	%r20, %r18, %r18
	.word 0xa64cc013  ! 332: MULX_R	mulx 	%r19, %r19, %r19
	.word 0xe4008003  ! 333: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe470a060  ! 334: STX_I	stx	%r18, [%r2 + 0x0060]
	.word 0x04c50002  ! 335: BRLEZ	brlez  ,nt	%r20,<label_0x50002>
	.word 0xe840a0f0  ! 336: LDSW_I	ldsw	[%r2 + 0x00f0], %r20
	.word 0xa64c8012  ! 337: MULX_R	mulx 	%r18, %r18, %r19
	.word 0xa77ce9c5  ! 338: MOVR_I	movle	%r19, 0x1, %r19
	.word 0xa40c8013  ! 339: AND_R	and 	%r18, %r19, %r18
	.word 0xa77c9412  ! 340: MOVR_R	movcs	%r18, %r18, %r19
	.word 0xe4708003  ! 341: STX_R	stx	%r18, [%r2 + %r3]
	.word 0x2ac50002  ! 342: BRNZ	brnz,a,nt	%r20,<label_0x50002>
	.word 0xa4148012  ! 343: OR_R	or 	%r18, %r18, %r18
	.word 0xa77cadfa  ! 344: MOVR_I	movl	%r18, 0x1, %r19
	.word 0x84006600  ! 346: ADD_I	add 	%r1, 0x0600, %r2
	.word 0xe818a0c0  ! 347: LDD_I	ldd	[%r2 + 0x00c0], %r20
	.word 0xe8588003  ! 348: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe800a018  ! 349: LDUW_I	lduw	[%r2 + 0x0018], %r20
	.word 0xa57cab1e  ! 350: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xe418a058  ! 351: LDD_I	ldd	[%r2 + 0x0058], %r18
	.word 0x0cccc003  ! 352: BRGZ	brgz  ,pt	%r19,<label_0xcc003>
	.word 0xa77d0c12  ! 353: MOVR_R	movl	%r20, %r18, %r19
	.word 0xa57d293f  ! 354: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xa77d3fe8  ! 355: MOVR_I	movvs	%r20, 0x1, %r19
	.word 0xa77c9412  ! 356: MOVR_R	movcs	%r18, %r18, %r19
	.word 0xe870a0f8  ! 357: STX_I	stx	%r20, [%r2 + 0x00f8]
	.word 0x0acc8002  ! 358: BRNZ	brnz  ,pt	%r18,<label_0xc8002>
	.word 0xe4708003  ! 359: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe4008003  ! 360: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe470a0b0  ! 361: STX_I	stx	%r18, [%r2 + 0x00b0]
	.word 0xa97c9c13  ! 362: MOVR_R	movvs	%r18, %r19, %r20
	.word 0xa77c8812  ! 363: MOVR_R	movle	%r18, %r18, %r19
	.word 0xa97c9812  ! 364: MOVR_R	movneg	%r18, %r18, %r20
	.word 0xa97d2e01  ! 365: MOVR_I	movl	%r20, 0x1, %r20
	.word 0xa80d0012  ! 366: AND_R	and 	%r20, %r18, %r20
	.word 0xa77c8c13  ! 367: MOVR_R	movl	%r18, %r19, %r19
	.word 0x84006500  ! 369: ADD_I	add 	%r1, 0x0500, %r2
	.word 0x22c50002  ! 370: BRZ	brz,a,nt	%r20,<label_0x50002>
	.word 0xa57cff2d  ! 371: MOVR_I	movvs	%r19, 0x1, %r18
	.word 0xa57cbc5c  ! 372: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa77c8412  ! 373: MOVR_R	move	%r18, %r18, %r19
	.word 0x860020c8  ! 375: ADD_I	add 	%r0, 0x00c8, %r3
	.word 0xa57ccc12  ! 376: MOVR_R	movl	%r19, %r18, %r18
	.word 0xa57c8812  ! 377: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa97cf818  ! 378: MOVR_I	movneg	%r19, 0x1, %r20
	.word 0xe4408003  ! 379: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa77d2a9f  ! 380: MOVR_I	movle	%r20, 0x1, %r19
	.word 0xe4408003  ! 381: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe4408003  ! 382: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe4408003  ! 383: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa57cc812  ! 384: MOVR_R	movle	%r19, %r18, %r18
	.word 0xa97ca99c  ! 385: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa77cfa15  ! 386: MOVR_I	movneg	%r19, 0x1, %r19
	.word 0xa57c8812  ! 387: MOVR_R	movle	%r18, %r18, %r18
	.word 0xe440a058  ! 388: LDSW_I	ldsw	[%r2 + 0x0058], %r18
	.word 0xe8588003  ! 389: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe4708003  ! 390: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe4188003  ! 391: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa97c8412  ! 392: MOVR_R	move	%r18, %r18, %r20
	.word 0xe4188003  ! 393: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa57cd412  ! 394: MOVR_R	movcs	%r19, %r18, %r18
	.word 0xe858a010  ! 395: LDX_I	ldx	[%r2 + 0x0010], %r20
	.word 0xa77ca81b  ! 396: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa57c9412  ! 397: MOVR_R	movcs	%r18, %r18, %r18
	.word 0xa84d0012  ! 398: MULX_R	mulx 	%r20, %r18, %r20
	.word 0xa4148012  ! 399: OR_R	or 	%r18, %r18, %r18
	.word 0xa97cada2  ! 400: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xe400a038  ! 401: LDUW_I	lduw	[%r2 + 0x0038], %r18
	.word 0xe8588003  ! 402: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa80c8012  ! 403: AND_R	and 	%r18, %r18, %r20
	.word 0xa57c8812  ! 404: MOVR_R	movle	%r18, %r18, %r18
	.word 0x84006f00  ! 406: ADD_I	add 	%r1, 0x0f00, %r2
	.word 0xa77d269a  ! 407: MOVR_I	move	%r20, 0x1, %r19
	.word 0xe4388003  ! 408: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe4008003  ! 409: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa57c9c12  ! 410: MOVR_R	movvs	%r18, %r18, %r18
	.word 0x06ccc003  ! 411: BRLZ	brlz  ,pt	%r19,<label_0xcc003>
	.word 0x24c48003  ! 412: BRLEZ	brlez,a,nt	%r18,<label_0x48003>
	.word 0x86002090  ! 414: ADD_I	add 	%r0, 0x0090, %r3
	.word 0xa80d0012  ! 415: AND_R	and 	%r20, %r18, %r20
	.word 0x84006d00  ! 417: ADD_I	add 	%r1, 0x0d00, %r2
	.word 0xe8588003  ! 418: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe8008003  ! 419: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe8708003  ! 420: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa57cafda  ! 421: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa97c8812  ! 422: MOVR_R	movle	%r18, %r18, %r20
	.word 0xa97ca491  ! 423: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa57cbd2f  ! 424: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa57ca83e  ! 425: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa4050012  ! 426: ADD_R	add 	%r20, %r18, %r18
	.word 0xa57c9812  ! 427: MOVR_R	movneg	%r18, %r18, %r18
	.word 0xa77c8c12  ! 428: MOVR_R	movl	%r18, %r18, %r19
	.word 0xa97cae59  ! 429: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa77ce559  ! 430: MOVR_I	move	%r19, 0x1, %r19
	.word 0xa77ccc12  ! 431: MOVR_R	movl	%r19, %r18, %r19
	.word 0xe4008003  ! 432: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe4588003  ! 433: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57cc412  ! 434: MOVR_R	move	%r19, %r18, %r18
	.word 0xa57c9c12  ! 435: MOVR_R	movvs	%r18, %r18, %r18
	.word 0xa57d0812  ! 436: MOVR_R	movle	%r20, %r18, %r18
	.word 0x0cc48002  ! 437: BRGZ	brgz  ,nt	%r18,<label_0x48002>
	.word 0x0ec50002  ! 438: BRGEZ	brgez  ,nt	%r20,<label_0x50002>
	.word 0xa804c013  ! 439: ADD_R	add 	%r19, %r19, %r20
	.word 0xa4048012  ! 440: ADD_R	add 	%r18, %r18, %r18
	.word 0x0ac4c002  ! 441: BRNZ	brnz  ,nt	%r19,<label_0x4c002>
	.word 0xa44c8012  ! 442: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xa97c9413  ! 443: MOVR_R	movcs	%r18, %r19, %r20
	.word 0xa77caa74  ! 444: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa77c8813  ! 445: MOVR_R	movle	%r18, %r19, %r19
	.word 0xe4588003  ! 446: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa40d0012  ! 447: AND_R	and 	%r20, %r18, %r18
	.word 0xe4708003  ! 448: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa77c8812  ! 449: MOVR_R	movle	%r18, %r18, %r19
	.word 0xa57cad40  ! 450: MOVR_I	movl	%r18, 0x1, %r18
	.word 0x06ccc001  ! 451: BRLZ	brlz  ,pt	%r19,<label_0xcc001>
	.word 0xa77ca629  ! 452: MOVR_I	move	%r18, 0x1, %r19
	.word 0xa57cb728  ! 453: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xa77c8813  ! 454: MOVR_R	movle	%r18, %r19, %r19
	.word 0xa80d0012  ! 455: AND_R	and 	%r20, %r18, %r20
	.word 0xa57cb7df  ! 456: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xe4408003  ! 457: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa57cf950  ! 458: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0xa44c8012  ! 459: MULX_R	mulx 	%r18, %r18, %r18
	.word 0x84006300  ! 461: ADD_I	add 	%r1, 0x0300, %r2
	.word 0x0ac48003  ! 462: BRNZ	brnz  ,nt	%r18,<label_0x48003>
	.word 0xa97ccc13  ! 463: MOVR_R	movl	%r19, %r19, %r20
	.word 0xa57cc813  ! 464: MOVR_R	movle	%r19, %r19, %r18
	.word 0x86002000  ! 466: ADD_I	add 	%r0, 0x0000, %r3
	.word 0xa57d0c12  ! 467: MOVR_R	movl	%r20, %r18, %r18
	.word 0xa44c8013  ! 468: MULX_R	mulx 	%r18, %r19, %r18
	.word 0xa57d3924  ! 469: MOVR_I	movneg	%r20, 0x1, %r18
	.word 0xa44c8013  ! 470: MULX_R	mulx 	%r18, %r19, %r18
	.word 0xa57d0812  ! 471: MOVR_R	movle	%r20, %r18, %r18
	.word 0xe8388003  ! 472: STD_R	std	%r20, [%r2 + %r3]
	.word 0xa614c012  ! 473: OR_R	or 	%r19, %r18, %r19
	.word 0xa57ca909  ! 474: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa77d2729  ! 475: MOVR_I	move	%r20, 0x1, %r19
	.word 0xe8588003  ! 476: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa57cbca9  ! 477: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa4050013  ! 478: ADD_R	add 	%r20, %r19, %r18
	.word 0xa4248012  ! 479: SUB_R	sub 	%r18, %r18, %r18
	.word 0xa8048013  ! 480: ADD_R	add 	%r18, %r19, %r20
	.word 0xa57cac84  ! 481: MOVR_I	movl	%r18, 0x1, %r18
	.word 0x0cc4c002  ! 482: BRGZ	brgz  ,nt	%r19,<label_0x4c002>
	.word 0xe400a008  ! 483: LDUW_I	lduw	[%r2 + 0x0008], %r18
	.word 0xa404c012  ! 484: ADD_R	add 	%r19, %r18, %r18
	.word 0xa97c8c12  ! 485: MOVR_R	movl	%r18, %r18, %r20
	.word 0xa57c8c12  ! 486: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa57d2f73  ! 487: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa80d0012  ! 488: AND_R	and 	%r20, %r18, %r20
	.word 0xa84d0013  ! 489: MULX_R	mulx 	%r20, %r19, %r20
	.word 0xe4408003  ! 490: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa97cfe29  ! 491: MOVR_I	movvs	%r19, 0x1, %r20
	.word 0xa4050012  ! 492: ADD_R	add 	%r20, %r18, %r18
	.word 0xa614c012  ! 493: OR_R	or 	%r19, %r18, %r19
	.word 0xa57cebe4  ! 494: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa77cbc5c  ! 495: MOVR_I	movvs	%r18, 0x1, %r19
	.word 0xa97d2cf0  ! 496: MOVR_I	movl	%r20, 0x1, %r20
	.word 0xa97c8812  ! 497: MOVR_R	movle	%r18, %r18, %r20
	.word 0xe4708003  ! 498: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa57ce992  ! 499: MOVR_I	movle	%r19, 0x1, %r18
	.word 0x860020e8  ! 501: ADD_I	add 	%r0, 0x00e8, %r3
	.word 0xe440a078  ! 502: LDSW_I	ldsw	[%r2 + 0x0078], %r18
	.word 0xe870a098  ! 503: STX_I	stx	%r20, [%r2 + 0x0098]
	.word 0xe4188003  ! 504: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa84cc013  ! 505: MULX_R	mulx 	%r19, %r19, %r20
	.word 0x84006f00  ! 507: ADD_I	add 	%r1, 0x0f00, %r2
	.word 0xe440a0a8  ! 508: LDSW_I	ldsw	[%r2 + 0x00a8], %r18
	.word 0xe458a088  ! 509: LDX_I	ldx	[%r2 + 0x0088], %r18
	.word 0x0ac48002  ! 510: BRNZ	brnz  ,nt	%r18,<label_0x48002>
	.word 0xe4408003  ! 511: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe8708003  ! 512: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xe8008003  ! 513: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa77cbe1d  ! 514: MOVR_I	movvs	%r18, 0x1, %r19
	.word 0x2ec50003  ! 515: BRGEZ	brgez,a,nt	%r20,<label_0x50003>
	.word 0xa97d1c13  ! 516: MOVR_R	movvs	%r20, %r19, %r20
	.word 0xa77d27de  ! 517: MOVR_I	move	%r20, 0x1, %r19
	.word 0xa44cc013  ! 518: MULX_R	mulx 	%r19, %r19, %r18
	.word 0xa4050013  ! 519: ADD_R	add 	%r20, %r19, %r18
	.word 0xa97cb84c  ! 520: MOVR_I	movneg	%r18, 0x1, %r20
	.word 0xe858a0e8  ! 521: LDX_I	ldx	[%r2 + 0x00e8], %r20
	.word 0xa97ca845  ! 522: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa77cdc12  ! 523: MOVR_R	movvs	%r19, %r18, %r19
	.word 0x86002090  ! 525: ADD_I	add 	%r0, 0x0090, %r3
	.word 0xa77cae6d  ! 526: MOVR_I	movl	%r18, 0x1, %r19
	.word 0x84006b00  ! 528: ADD_I	add 	%r1, 0x0b00, %r2
	.word 0xa97cc813  ! 529: MOVR_R	movle	%r19, %r19, %r20
	.word 0xa77c8c12  ! 530: MOVR_R	movl	%r18, %r18, %r19
	.word 0xe440a058  ! 531: LDSW_I	ldsw	[%r2 + 0x0058], %r18
	.word 0xa57d1c13  ! 532: MOVR_R	movvs	%r20, %r19, %r18
	.word 0xa4148012  ! 533: OR_R	or 	%r18, %r18, %r18
	.word 0xe4708003  ! 534: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa824c012  ! 535: SUB_R	sub 	%r19, %r18, %r20
	.word 0x86002008  ! 537: ADD_I	add 	%r0, 0x0008, %r3
	.word 0xa57ceeb2  ! 538: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xa57c8412  ! 539: MOVR_R	move	%r18, %r18, %r18
	.word 0xe470a0a8  ! 540: STX_I	stx	%r18, [%r2 + 0x00a8]
	.word 0xe4588003  ! 541: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa8150012  ! 542: OR_R	or 	%r20, %r18, %r20
	.word 0xe8408003  ! 543: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa4148012  ! 544: OR_R	or 	%r18, %r18, %r18
	.word 0xa57c8c12  ! 545: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa57d3499  ! 546: MOVR_I	movcs	%r20, 0x1, %r18
	.word 0xa97ccc12  ! 547: MOVR_R	movl	%r19, %r18, %r20
	.word 0xe4008003  ! 548: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa44d0013  ! 549: MULX_R	mulx 	%r20, %r19, %r18
	.word 0xa97cb4a2  ! 550: MOVR_I	movcs	%r18, 0x1, %r20
	.word 0xa77c8813  ! 551: MOVR_R	movle	%r18, %r19, %r19
	.word 0x84006b00  ! 553: ADD_I	add 	%r1, 0x0b00, %r2
	.word 0xe4588003  ! 554: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa77caa4e  ! 555: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa57d0c13  ! 556: MOVR_R	movl	%r20, %r19, %r18
	.word 0xe840a078  ! 557: LDSW_I	ldsw	[%r2 + 0x0078], %r20
	.word 0x0ccc8003  ! 558: BRGZ	brgz  ,pt	%r18,<label_0xc8003>
	.word 0xe4008003  ! 559: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa57ccc13  ! 560: MOVR_R	movl	%r19, %r19, %r18
	.word 0xa57cdc12  ! 561: MOVR_R	movvs	%r19, %r18, %r18
	.word 0xe8588003  ! 562: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe4588003  ! 563: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe4388003  ! 564: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa8148012  ! 565: OR_R	or 	%r18, %r18, %r20
	.word 0xe4008003  ! 566: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0x86002078  ! 568: ADD_I	add 	%r0, 0x0078, %r3
	.word 0xa77c9413  ! 569: MOVR_R	movcs	%r18, %r19, %r19
	.word 0xa57d39b9  ! 570: MOVR_I	movneg	%r20, 0x1, %r18
	.word 0xa4048013  ! 571: ADD_R	add 	%r18, %r19, %r18
	.word 0x86002038  ! 573: ADD_I	add 	%r0, 0x0038, %r3
	.word 0xe470a050  ! 574: STX_I	stx	%r18, [%r2 + 0x0050]
	.word 0xa57c8812  ! 575: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa97c8813  ! 576: MOVR_R	movle	%r18, %r19, %r20
	.word 0x2cc48003  ! 577: BRGZ	brgz,a,nt	%r18,<label_0x48003>
	.word 0x86002070  ! 579: ADD_I	add 	%r0, 0x0070, %r3
	.word 0xa77c9c12  ! 580: MOVR_R	movvs	%r18, %r18, %r19
	.word 0x84006500  ! 582: ADD_I	add 	%r1, 0x0500, %r2
	.word 0xa77cab46  ! 583: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa97ca763  ! 584: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa77cdc12  ! 585: MOVR_R	movvs	%r19, %r18, %r19
	.word 0xe4008003  ! 586: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0x0ac50002  ! 587: BRNZ	brnz  ,nt	%r20,<label_0x50002>
	.word 0xe4588003  ! 588: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57caf7d  ! 589: MOVR_I	movl	%r18, 0x1, %r18
	.word 0x84006300  ! 591: ADD_I	add 	%r1, 0x0300, %r2
	.word 0xe4708003  ! 592: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa8250012  ! 593: SUB_R	sub 	%r20, %r18, %r20
	.word 0xa97cba94  ! 594: MOVR_I	movneg	%r18, 0x1, %r20
	.word 0xa4248012  ! 595: SUB_R	sub 	%r18, %r18, %r18
	.word 0xa77cedc8  ! 596: MOVR_I	movl	%r19, 0x1, %r19
	.word 0xe4408003  ! 597: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe858a0a8  ! 598: LDX_I	ldx	[%r2 + 0x00a8], %r20
	.word 0xa77ca715  ! 599: MOVR_I	move	%r18, 0x1, %r19
	.word 0xa97d0c12  ! 600: MOVR_R	movl	%r20, %r18, %r20
	.word 0xa4148013  ! 601: OR_R	or 	%r18, %r19, %r18
	.word 0x02c48002  ! 602: BRZ	brz  ,nt	%r18,<label_0x48002>
	.word 0xa77cad80  ! 603: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xa40d0013  ! 604: AND_R	and 	%r20, %r19, %r18
	.word 0xe4408003  ! 605: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0x04ccc002  ! 606: BRLEZ	brlez  ,pt	%r19,<label_0xcc002>
	.word 0xa4150012  ! 607: OR_R	or 	%r20, %r18, %r18
	.word 0x04c50002  ! 608: BRLEZ	brlez  ,nt	%r20,<label_0x50002>
	.word 0xe8408003  ! 609: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xe440a020  ! 610: LDSW_I	ldsw	[%r2 + 0x0020], %r18
	.word 0xa77d0413  ! 611: MOVR_R	move	%r20, %r19, %r19
	.word 0xa57ca461  ! 612: MOVR_I	move	%r18, 0x1, %r18
	.word 0xe400a0e8  ! 613: LDUW_I	lduw	[%r2 + 0x00e8], %r18
	.word 0xe800a000  ! 614: LDUW_I	lduw	[%r2 + 0x0000], %r20
	.word 0xa57ce5a0  ! 615: MOVR_I	move	%r19, 0x1, %r18
	.word 0xe4588003  ! 616: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa77cf62a  ! 617: MOVR_I	movcs	%r19, 0x1, %r19
	.word 0x0ec4c002  ! 618: BRGEZ	brgez  ,nt	%r19,<label_0x4c002>
	.word 0xe4588003  ! 619: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa44c8013  ! 620: MULX_R	mulx 	%r18, %r19, %r18
	.word 0xe418a018  ! 621: LDD_I	ldd	[%r2 + 0x0018], %r18
	.word 0xa57c8812  ! 622: MOVR_R	movle	%r18, %r18, %r18
	.word 0x84006500  ! 624: ADD_I	add 	%r1, 0x0500, %r2
	.word 0xa97d0c12  ! 625: MOVR_R	movl	%r20, %r18, %r20
	.word 0xe870a040  ! 626: STX_I	stx	%r20, [%r2 + 0x0040]
	.word 0xa824c013  ! 627: SUB_R	sub 	%r19, %r19, %r20
	.word 0xa4050012  ! 628: ADD_R	add 	%r20, %r18, %r18
	.word 0xa57d2cf0  ! 629: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xe4708003  ! 630: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe4708003  ! 631: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa57cebe2  ! 632: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xe4588003  ! 633: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa414c012  ! 634: OR_R	or 	%r19, %r18, %r18
	.word 0xa8148012  ! 635: OR_R	or 	%r18, %r18, %r20
	.word 0xa97d0c12  ! 636: MOVR_R	movl	%r20, %r18, %r20
	.word 0xa40cc012  ! 637: AND_R	and 	%r19, %r18, %r18
	.word 0x26c48001  ! 638: BRLZ	brlz,a,nt	%r18,<label_0x48001>
	.word 0xe8408003  ! 639: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xe4408003  ! 640: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe4708003  ! 641: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa424c013  ! 642: SUB_R	sub 	%r19, %r19, %r18
	.word 0xa4248012  ! 643: SUB_R	sub 	%r18, %r18, %r18
	.word 0xe400a048  ! 644: LDUW_I	lduw	[%r2 + 0x0048], %r18
	.word 0xa4250013  ! 645: SUB_R	sub 	%r20, %r19, %r18
	.word 0xa77d2742  ! 646: MOVR_I	move	%r20, 0x1, %r19
	.word 0xe4408003  ! 647: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe840a038  ! 648: LDSW_I	ldsw	[%r2 + 0x0038], %r20
	.word 0xa8050012  ! 649: ADD_R	add 	%r20, %r18, %r20
	.word 0xe400a000  ! 650: LDUW_I	lduw	[%r2 + 0x0000], %r18
	.word 0xe470a008  ! 651: STX_I	stx	%r18, [%r2 + 0x0008]
	.word 0xe4408003  ! 652: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa57cfc93  ! 653: MOVR_I	movvs	%r19, 0x1, %r18
	.word 0xa77d266e  ! 654: MOVR_I	move	%r20, 0x1, %r19
	.word 0xa57c9812  ! 655: MOVR_R	movneg	%r18, %r18, %r18
	.word 0xe470a048  ! 656: STX_I	stx	%r18, [%r2 + 0x0048]
	.word 0xa57ca9ec  ! 657: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xe458a0d8  ! 658: LDX_I	ldx	[%r2 + 0x00d8], %r18
	.word 0xa57d2a4a  ! 659: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xa97cbfa3  ! 660: MOVR_I	movvs	%r18, 0x1, %r20
	.word 0xe4408003  ! 661: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa57cf93c  ! 662: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0xe440a0b0  ! 663: LDSW_I	ldsw	[%r2 + 0x00b0], %r18
	.word 0xe4588003  ! 664: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x26cd0003  ! 665: BRLZ	brlz,a,pt	%r20,<label_0xd0003>
	.word 0xe4588003  ! 666: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa77d2f39  ! 667: MOVR_I	movl	%r20, 0x1, %r19
	.word 0xa57cbfa8  ! 668: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0x2eccc003  ! 669: BRGEZ	brgez,a,pt	%r19,<label_0xcc003>
	.word 0xa57c8c12  ! 670: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa57c8412  ! 671: MOVR_R	move	%r18, %r18, %r18
	.word 0xe470a028  ! 672: STX_I	stx	%r18, [%r2 + 0x0028]
	.word 0xe4408003  ! 673: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe800a088  ! 674: LDUW_I	lduw	[%r2 + 0x0088], %r20
	.word 0xa77d26c1  ! 675: MOVR_I	move	%r20, 0x1, %r19
	.word 0xe4388003  ! 676: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa77cb7c4  ! 677: MOVR_I	movcs	%r18, 0x1, %r19
	.word 0xa57c8812  ! 678: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa57cf537  ! 679: MOVR_I	movcs	%r19, 0x1, %r18
	.word 0xe4708003  ! 680: STX_R	stx	%r18, [%r2 + %r3]
	.word 0x0ccc8003  ! 681: BRGZ	brgz  ,pt	%r18,<label_0xc8003>
	.word 0xa8248012  ! 682: SUB_R	sub 	%r18, %r18, %r20
	.word 0xe8388003  ! 683: STD_R	std	%r20, [%r2 + %r3]
	.word 0xa57caa3d  ! 684: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa77cbe82  ! 685: MOVR_I	movvs	%r18, 0x1, %r19
	.word 0xa57caf74  ! 686: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xe4708003  ! 687: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa77cdc12  ! 688: MOVR_R	movvs	%r19, %r18, %r19
	.word 0xa57cd413  ! 689: MOVR_R	movcs	%r19, %r19, %r18
	.word 0xe858a070  ! 690: LDX_I	ldx	[%r2 + 0x0070], %r20
	.word 0xa57ca6c6  ! 691: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa77ca86f  ! 692: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa57ced0c  ! 693: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xa97d0412  ! 694: MOVR_R	move	%r20, %r18, %r20
	.word 0xa624c012  ! 695: SUB_R	sub 	%r19, %r18, %r19
	.word 0xa57cb468  ! 696: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0x84006000  ! 698: ADD_I	add 	%r1, 0x0000, %r2
	.word 0xe8388003  ! 699: STD_R	std	%r20, [%r2 + %r3]
	.word 0xe4008003  ! 700: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe418a050  ! 701: LDD_I	ldd	[%r2 + 0x0050], %r18
	.word 0xa97caa6c  ! 702: MOVR_I	movle	%r18, 0x1, %r20
	.word 0x06c4c002  ! 703: BRLZ	brlz  ,nt	%r19,<label_0x4c002>
	.word 0xe4588003  ! 704: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x86002028  ! 706: ADD_I	add 	%r0, 0x0028, %r3
	.word 0xa77cc813  ! 707: MOVR_R	movle	%r19, %r19, %r19
	.word 0xa97d2406  ! 708: MOVR_I	move	%r20, 0x1, %r20
	.word 0xa57d1412  ! 709: MOVR_R	movcs	%r20, %r18, %r18
	.word 0xa97d0812  ! 710: MOVR_R	movle	%r20, %r18, %r20
	.word 0xa77ca5d4  ! 711: MOVR_I	move	%r18, 0x1, %r19
	.word 0xe4408003  ! 712: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0x86002088  ! 714: ADD_I	add 	%r0, 0x0088, %r3
	.word 0xa97ccc12  ! 715: MOVR_R	movl	%r19, %r18, %r20
	.word 0xe4008003  ! 716: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe418a060  ! 717: LDD_I	ldd	[%r2 + 0x0060], %r18
	.word 0xe800a090  ! 718: LDUW_I	lduw	[%r2 + 0x0090], %r20
	.word 0xe4708003  ! 719: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa57c9812  ! 720: MOVR_R	movneg	%r18, %r18, %r18
	.word 0x0ccc8003  ! 721: BRGZ	brgz  ,pt	%r18,<label_0xc8003>
	.word 0xe8008003  ! 722: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe400a098  ! 723: LDUW_I	lduw	[%r2 + 0x0098], %r18
	.word 0xe8188003  ! 724: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xa77ca684  ! 725: MOVR_I	move	%r18, 0x1, %r19
	.word 0xa4148012  ! 726: OR_R	or 	%r18, %r18, %r18
	.word 0xa77c9413  ! 727: MOVR_R	movcs	%r18, %r19, %r19
	.word 0x0cc50001  ! 728: BRGZ	brgz  ,nt	%r20,<label_0x50001>
	.word 0xa624c012  ! 729: SUB_R	sub 	%r19, %r18, %r19
	.word 0xe400a0b8  ! 730: LDUW_I	lduw	[%r2 + 0x00b8], %r18
	.word 0xe400a060  ! 731: LDUW_I	lduw	[%r2 + 0x0060], %r18
	.word 0xa6248013  ! 732: SUB_R	sub 	%r18, %r19, %r19
	.word 0xa40c8012  ! 733: AND_R	and 	%r18, %r18, %r18
	.word 0xa44c8012  ! 734: MULX_R	mulx 	%r18, %r18, %r18
	.word 0x86002090  ! 736: ADD_I	add 	%r0, 0x0090, %r3
	.word 0xa77d3653  ! 737: MOVR_I	movcs	%r20, 0x1, %r19
	.word 0xa57ce685  ! 738: MOVR_I	move	%r19, 0x1, %r18
	.word 0xa77ce922  ! 739: MOVR_I	movle	%r19, 0x1, %r19
	.word 0x0cccc002  ! 740: BRGZ	brgz  ,pt	%r19,<label_0xcc002>
	.word 0xe818a000  ! 741: LDD_I	ldd	[%r2 + 0x0000], %r20
	.word 0xe4008003  ! 742: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa57ce5dd  ! 743: MOVR_I	move	%r19, 0x1, %r18
	.word 0xa97cbb9b  ! 744: MOVR_I	movneg	%r18, 0x1, %r20
	.word 0xa57cabfc  ! 745: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa57cad83  ! 746: MOVR_I	movl	%r18, 0x1, %r18
	.word 0x84006f00  ! 748: ADD_I	add 	%r1, 0x0f00, %r2
	.word 0xe470a0f0  ! 749: STX_I	stx	%r18, [%r2 + 0x00f0]
	.word 0xa77d0c12  ! 750: MOVR_R	movl	%r20, %r18, %r19
	.word 0xa97cd412  ! 751: MOVR_R	movcs	%r19, %r18, %r20
	.word 0xe4708003  ! 752: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe8188003  ! 753: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xe858a088  ! 754: LDX_I	ldx	[%r2 + 0x0088], %r20
	.word 0x06c50003  ! 755: BRLZ	brlz  ,nt	%r20,<label_0x50003>
	.word 0x0ec50002  ! 756: BRGEZ	brgez  ,nt	%r20,<label_0x50002>
	.word 0xe8008003  ! 757: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa97d0812  ! 758: MOVR_R	movle	%r20, %r18, %r20
	.word 0xe800a0c8  ! 759: LDUW_I	lduw	[%r2 + 0x00c8], %r20
	.word 0xe8588003  ! 760: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe4408003  ! 761: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe4588003  ! 762: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x84006b00  ! 764: ADD_I	add 	%r1, 0x0b00, %r2
	.word 0xa8048012  ! 765: ADD_R	add 	%r18, %r18, %r20
	.word 0xa97d2fb7  ! 766: MOVR_I	movl	%r20, 0x1, %r20
	.word 0x84006800  ! 768: ADD_I	add 	%r1, 0x0800, %r2
	.word 0xe840a058  ! 769: LDSW_I	ldsw	[%r2 + 0x0058], %r20
	.word 0xa77d0413  ! 770: MOVR_R	move	%r20, %r19, %r19
	.word 0xa40cc013  ! 771: AND_R	and 	%r19, %r19, %r18
	.word 0xa97ce5b5  ! 772: MOVR_I	move	%r19, 0x1, %r20
	.word 0xa97c9812  ! 773: MOVR_R	movneg	%r18, %r18, %r20
	.word 0x84006c00  ! 775: ADD_I	add 	%r1, 0x0c00, %r2
	.word 0xe8408003  ! 776: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa8048013  ! 777: ADD_R	add 	%r18, %r19, %r20
	.word 0xa97cf989  ! 778: MOVR_I	movneg	%r19, 0x1, %r20
	.word 0xa57d3ccd  ! 779: MOVR_I	movvs	%r20, 0x1, %r18
	.word 0xa44d0012  ! 780: MULX_R	mulx 	%r20, %r18, %r18
	.word 0xa57cfad0  ! 781: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0xe800a0b8  ! 782: LDUW_I	lduw	[%r2 + 0x00b8], %r20
	.word 0xe470a018  ! 783: STX_I	stx	%r18, [%r2 + 0x0018]
	.word 0xe8588003  ! 784: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa57cadd9  ! 785: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xe4008003  ! 786: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa44c8013  ! 787: MULX_R	mulx 	%r18, %r19, %r18
	.word 0xa97caa4f  ! 788: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa84c8012  ! 789: MULX_R	mulx 	%r18, %r18, %r20
	.word 0xa57d1813  ! 790: MOVR_R	movneg	%r20, %r19, %r18
	.word 0xa77ceac6  ! 791: MOVR_I	movle	%r19, 0x1, %r19
	.word 0xa57ced66  ! 792: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xe470a010  ! 793: STX_I	stx	%r18, [%r2 + 0x0010]
	.word 0xa77cbdf8  ! 794: MOVR_I	movvs	%r18, 0x1, %r19
	.word 0x0ac48003  ! 795: BRNZ	brnz  ,nt	%r18,<label_0x48003>
	.word 0xa57ca8f7  ! 796: MOVR_I	movle	%r18, 0x1, %r18
	.word 0x84006300  ! 798: ADD_I	add 	%r1, 0x0300, %r2
	.word 0xa57caf72  ! 799: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57cf945  ! 800: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0xa77c8c12  ! 801: MOVR_R	movl	%r18, %r18, %r19
	.word 0xa97cab1f  ! 802: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xe4008003  ! 803: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe4588003  ! 804: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe8388003  ! 805: STD_R	std	%r20, [%r2 + %r3]
	.word 0xe4708003  ! 806: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa44d0012  ! 807: MULX_R	mulx 	%r20, %r18, %r18
	.word 0x0acc8001  ! 808: BRNZ	brnz  ,pt	%r18,<label_0xc8001>
	.word 0x06c50003  ! 809: BRLZ	brlz  ,nt	%r20,<label_0x50003>
	.word 0xe470a050  ! 810: STX_I	stx	%r18, [%r2 + 0x0050]
	.word 0xe840a0a8  ! 811: LDSW_I	ldsw	[%r2 + 0x00a8], %r20
	.word 0xa57d3da3  ! 812: MOVR_I	movvs	%r20, 0x1, %r18
	.word 0x06c48002  ! 813: BRLZ	brlz  ,nt	%r18,<label_0x48002>
	.word 0xa57cb418  ! 814: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xa57cf439  ! 815: MOVR_I	movcs	%r19, 0x1, %r18
	.word 0xa77d3475  ! 816: MOVR_I	movcs	%r20, 0x1, %r19
	.word 0xa77d3493  ! 817: MOVR_I	movcs	%r20, 0x1, %r19
	.word 0xe4188003  ! 818: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa4250012  ! 819: SUB_R	sub 	%r20, %r18, %r18
	.word 0xe8008003  ! 820: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe4408003  ! 821: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa77ceaba  ! 822: MOVR_I	movle	%r19, 0x1, %r19
	.word 0xe800a0e0  ! 823: LDUW_I	lduw	[%r2 + 0x00e0], %r20
	.word 0xe4188003  ! 824: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa4248012  ! 825: SUB_R	sub 	%r18, %r18, %r18
	.word 0xa97ca56e  ! 826: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa4050012  ! 827: ADD_R	add 	%r20, %r18, %r18
	.word 0xe870a0d0  ! 828: STX_I	stx	%r20, [%r2 + 0x00d0]
	.word 0xe458a0c0  ! 829: LDX_I	ldx	[%r2 + 0x00c0], %r18
	.word 0xe8188003  ! 830: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xa57d3f93  ! 831: MOVR_I	movvs	%r20, 0x1, %r18
	.word 0xe8588003  ! 832: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe458a0e8  ! 833: LDX_I	ldx	[%r2 + 0x00e8], %r18
	.word 0xa804c012  ! 834: ADD_R	add 	%r19, %r18, %r20
	.word 0xa77c9413  ! 835: MOVR_R	movcs	%r18, %r19, %r19
	.word 0xa57d1412  ! 836: MOVR_R	movcs	%r20, %r18, %r18
	.word 0xa97cdc13  ! 837: MOVR_R	movvs	%r19, %r19, %r20
	.word 0xe858a028  ! 838: LDX_I	ldx	[%r2 + 0x0028], %r20
	.word 0xa97ca410  ! 839: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa60c8013  ! 840: AND_R	and 	%r18, %r19, %r19
	.word 0x02c48002  ! 841: BRZ	brz  ,nt	%r18,<label_0x48002>
	.word 0xa57d0412  ! 842: MOVR_R	move	%r20, %r18, %r18
	.word 0xe4588003  ! 843: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe4008003  ! 844: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa4248012  ! 845: SUB_R	sub 	%r18, %r18, %r18
	.word 0xa57c9c12  ! 846: MOVR_R	movvs	%r18, %r18, %r18
	.word 0xe4408003  ! 847: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa84c8013  ! 848: MULX_R	mulx 	%r18, %r19, %r20
	.word 0xa57cfd9b  ! 849: MOVR_I	movvs	%r19, 0x1, %r18
	.word 0xa97d0412  ! 850: MOVR_R	move	%r20, %r18, %r20
	.word 0x24c48003  ! 851: BRLEZ	brlez,a,nt	%r18,<label_0x48003>
	.word 0xa57d24f6  ! 852: MOVR_I	move	%r20, 0x1, %r18
	.word 0xa57c8812  ! 853: MOVR_R	movle	%r18, %r18, %r18
	.word 0x26c50001  ! 854: BRLZ	brlz,a,nt	%r20,<label_0x50001>
	.word 0xa4148012  ! 855: OR_R	or 	%r18, %r18, %r18
	.word 0xa44cc012  ! 856: MULX_R	mulx 	%r19, %r18, %r18
	.word 0x02c4c002  ! 857: BRZ	brz  ,nt	%r19,<label_0x4c002>
	.word 0xe4588003  ! 858: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe800a020  ! 859: LDUW_I	lduw	[%r2 + 0x0020], %r20
	.word 0xa97d25f0  ! 860: MOVR_I	move	%r20, 0x1, %r20
	.word 0xe400a038  ! 861: LDUW_I	lduw	[%r2 + 0x0038], %r18
	.word 0xe8408003  ! 862: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa57d0813  ! 863: MOVR_R	movle	%r20, %r19, %r18
	.word 0xe8708003  ! 864: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa8248012  ! 865: SUB_R	sub 	%r18, %r18, %r20
	.word 0xe8708003  ! 866: STX_R	stx	%r20, [%r2 + %r3]
	.word 0x2ac50002  ! 867: BRNZ	brnz,a,nt	%r20,<label_0x50002>
	.word 0xa57c8c12  ! 868: MOVR_R	movl	%r18, %r18, %r18
	.word 0xe4708003  ! 869: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa57caf42  ! 870: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57cf9aa  ! 871: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0xa57c8412  ! 872: MOVR_R	move	%r18, %r18, %r18
	.word 0xa57c8812  ! 873: MOVR_R	movle	%r18, %r18, %r18
	.word 0xe418a0a0  ! 874: LDD_I	ldd	[%r2 + 0x00a0], %r18
	.word 0xa57c9c12  ! 875: MOVR_R	movvs	%r18, %r18, %r18
	.word 0x86002008  ! 877: ADD_I	add 	%r0, 0x0008, %r3
	.word 0xa97ca6c7  ! 878: MOVR_I	move	%r18, 0x1, %r20
	.word 0xe4588003  ! 879: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57c8812  ! 880: MOVR_R	movle	%r18, %r18, %r18
	.word 0xe400a040  ! 881: LDUW_I	lduw	[%r2 + 0x0040], %r18
	.word 0xe4408003  ! 882: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa77ceb2a  ! 883: MOVR_I	movle	%r19, 0x1, %r19
	.word 0x84006a00  ! 885: ADD_I	add 	%r1, 0x0a00, %r2
	.word 0xe4388003  ! 886: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe440a0b0  ! 887: LDSW_I	ldsw	[%r2 + 0x00b0], %r18
	.word 0xe440a018  ! 888: LDSW_I	ldsw	[%r2 + 0x0018], %r18
	.word 0xa57c8413  ! 889: MOVR_R	move	%r18, %r19, %r18
	.word 0xe400a058  ! 890: LDUW_I	lduw	[%r2 + 0x0058], %r18
	.word 0xa404c013  ! 891: ADD_R	add 	%r19, %r19, %r18
	.word 0x04c48002  ! 892: BRLEZ	brlez  ,nt	%r18,<label_0x48002>
	.word 0xa814c013  ! 893: OR_R	or 	%r19, %r19, %r20
	.word 0x26c48002  ! 894: BRLZ	brlz,a,nt	%r18,<label_0x48002>
	.word 0xa57cc812  ! 895: MOVR_R	movle	%r19, %r18, %r18
	.word 0xa77c8812  ! 896: MOVR_R	movle	%r18, %r18, %r19
	.word 0xe800a018  ! 897: LDUW_I	lduw	[%r2 + 0x0018], %r20
	.word 0xe8008003  ! 898: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa4048012  ! 899: ADD_R	add 	%r18, %r18, %r18
	.word 0xe470a0b0  ! 900: STX_I	stx	%r18, [%r2 + 0x00b0]
	.word 0xa6150012  ! 901: OR_R	or 	%r20, %r18, %r19
	.word 0x860020c8  ! 903: ADD_I	add 	%r0, 0x00c8, %r3
	.word 0xa57ca483  ! 904: MOVR_I	move	%r18, 0x1, %r18
	.word 0x86002058  ! 906: ADD_I	add 	%r0, 0x0058, %r3
	.word 0xa97d0413  ! 907: MOVR_R	move	%r20, %r19, %r20
	.word 0xa57d2931  ! 908: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xa57cc413  ! 909: MOVR_R	move	%r19, %r19, %r18
	.word 0xa84c8012  ! 910: MULX_R	mulx 	%r18, %r18, %r20
	.word 0xe470a060  ! 911: STX_I	stx	%r18, [%r2 + 0x0060]
	.word 0xe800a000  ! 912: LDUW_I	lduw	[%r2 + 0x0000], %r20
	.word 0x84006600  ! 914: ADD_I	add 	%r1, 0x0600, %r2
	.word 0xa824c013  ! 915: SUB_R	sub 	%r19, %r19, %r20
	.word 0xe858a000  ! 916: LDX_I	ldx	[%r2 + 0x0000], %r20
	.word 0xa97ce6c4  ! 917: MOVR_I	move	%r19, 0x1, %r20
	.word 0xa57d2719  ! 918: MOVR_I	move	%r20, 0x1, %r18
	.word 0xa57d2b81  ! 919: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xa97d1412  ! 920: MOVR_R	movcs	%r20, %r18, %r20
	.word 0x860020b0  ! 922: ADD_I	add 	%r0, 0x00b0, %r3
	.word 0xa57d25b1  ! 923: MOVR_I	move	%r20, 0x1, %r18
	.word 0x2ecd0002  ! 924: BRGEZ	brgez,a,pt	%r20,<label_0xd0002>
	.word 0xa57cd412  ! 925: MOVR_R	movcs	%r19, %r18, %r18
	.word 0xa77cd812  ! 926: MOVR_R	movneg	%r19, %r18, %r19
	.word 0x860020e8  ! 928: ADD_I	add 	%r0, 0x00e8, %r3
	.word 0xa57c8412  ! 929: MOVR_R	move	%r18, %r18, %r18
	.word 0xa57d0813  ! 930: MOVR_R	movle	%r20, %r19, %r18
	.word 0xa57c8c13  ! 931: MOVR_R	movl	%r18, %r19, %r18
	.word 0xe800a0a8  ! 932: LDUW_I	lduw	[%r2 + 0x00a8], %r20
	.word 0xa57c8412  ! 933: MOVR_R	move	%r18, %r18, %r18
	.word 0xa57ca889  ! 934: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa97cc812  ! 935: MOVR_R	movle	%r19, %r18, %r20
	.word 0xa44cc012  ! 936: MULX_R	mulx 	%r19, %r18, %r18
	.word 0xa57c8c12  ! 937: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa57c8c13  ! 938: MOVR_R	movl	%r18, %r19, %r18
	.word 0xa97d3cfb  ! 939: MOVR_I	movvs	%r20, 0x1, %r20
	.word 0x84006800  ! 941: ADD_I	add 	%r1, 0x0800, %r2
	.word 0xa57c9413  ! 942: MOVR_R	movcs	%r18, %r19, %r18
	.word 0xa97d1412  ! 943: MOVR_R	movcs	%r20, %r18, %r20
	.word 0x0cc48002  ! 944: BRGZ	brgz  ,nt	%r18,<label_0x48002>
	.word 0xa424c012  ! 945: SUB_R	sub 	%r19, %r18, %r18
	.word 0xa57c9813  ! 946: MOVR_R	movneg	%r18, %r19, %r18
	.word 0xe8008003  ! 947: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe418a030  ! 948: LDD_I	ldd	[%r2 + 0x0030], %r18
	.word 0xa97c8413  ! 949: MOVR_R	move	%r18, %r19, %r20
	.word 0xa4248013  ! 950: SUB_R	sub 	%r18, %r19, %r18
	.word 0x0cc48003  ! 951: BRGZ	brgz  ,nt	%r18,<label_0x48003>
	.word 0xa44c8013  ! 952: MULX_R	mulx 	%r18, %r19, %r18
	.word 0xa97c8413  ! 953: MOVR_R	move	%r18, %r19, %r20
	.word 0xa57cf9d1  ! 954: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0xa57d3414  ! 955: MOVR_I	movcs	%r20, 0x1, %r18
	.word 0xa4248013  ! 956: SUB_R	sub 	%r18, %r19, %r18
	.word 0xa77c8813  ! 957: MOVR_R	movle	%r18, %r19, %r19
	.word 0xe4588003  ! 958: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe4588003  ! 959: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x04cc8003  ! 960: BRLEZ	brlez  ,pt	%r18,<label_0xc8003>
	.word 0xa57d0813  ! 961: MOVR_R	movle	%r20, %r19, %r18
	.word 0xa57d0c13  ! 962: MOVR_R	movl	%r20, %r19, %r18
	.word 0xa4048012  ! 963: ADD_R	add 	%r18, %r18, %r18
	.word 0xa57c8413  ! 964: MOVR_R	move	%r18, %r19, %r18
	.word 0x2acc8001  ! 965: BRNZ	brnz,a,pt	%r18,<label_0xc8001>
	.word 0xa57cc812  ! 966: MOVR_R	movle	%r19, %r18, %r18
	.word 0xa77d0c12  ! 967: MOVR_R	movl	%r20, %r18, %r19
	.word 0x04cc8002  ! 968: BRLEZ	brlez  ,pt	%r18,<label_0xc8002>
	.word 0xa57c9c13  ! 969: MOVR_R	movvs	%r18, %r19, %r18
	.word 0xa77c8812  ! 970: MOVR_R	movle	%r18, %r18, %r19
	.word 0xa57d3807  ! 971: MOVR_I	movneg	%r20, 0x1, %r18
	.word 0xe4408003  ! 972: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe458a088  ! 973: LDX_I	ldx	[%r2 + 0x0088], %r18
	.word 0xa97caeb8  ! 974: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa60c8012  ! 975: AND_R	and 	%r18, %r18, %r19
	.word 0xa57d0813  ! 976: MOVR_R	movle	%r20, %r19, %r18
	.word 0xa57cea1a  ! 977: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa57cb5e5  ! 978: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xa8248012  ! 979: SUB_R	sub 	%r18, %r18, %r20
	.word 0xe440a088  ! 980: LDSW_I	ldsw	[%r2 + 0x0088], %r18
	.word 0x24c48001  ! 981: BRLEZ	brlez,a,nt	%r18,<label_0x48001>
	.word 0xa57d2817  ! 982: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xe8408003  ! 983: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa97cb68a  ! 984: MOVR_I	movcs	%r18, 0x1, %r20
	.word 0xa77c8812  ! 985: MOVR_R	movle	%r18, %r18, %r19
	.word 0xe4008003  ! 986: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0x86002080  ! 988: ADD_I	add 	%r0, 0x0080, %r3
	.word 0xa57d0c13  ! 989: MOVR_R	movl	%r20, %r19, %r18
	.word 0xa4050013  ! 990: ADD_R	add 	%r20, %r19, %r18
	.word 0xa40cc013  ! 991: AND_R	and 	%r19, %r19, %r18
	.word 0xe4588003  ! 992: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa77cc412  ! 993: MOVR_R	move	%r19, %r18, %r19
	.word 0xe8008003  ! 994: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0x84006900  ! 996: ADD_I	add 	%r1, 0x0900, %r2
	.word 0xa57cc813  ! 997: MOVR_R	movle	%r19, %r19, %r18
	.word 0xa8250012  ! 998: SUB_R	sub 	%r20, %r18, %r20
.data
.align	256
t2_data_start_0:
	.xword	0x59229ccf9441d85b
	.xword	0x6dc6ffeaa0ae5044
	.xword	0xe954f6945ab275e4
	.xword	0x8b957682aae82d4a
	.xword	0x682f5d420a60fe65
	.xword	0xa5b9126f713f2d2f
	.xword	0xb2fb8780acea35c3
	.xword	0x5139fc649edccf23
	.xword	0x19e2db76557c931b
	.xword	0x53a0aef64a716a0b
	.xword	0x211a5c7d76a3a49f
	.xword	0x30751adf7e8763b5
	.xword	0xbda59042917ad317
	.xword	0x8c6155d73eb5cb83
	.xword	0x9a9c347992af5cf1
	.xword	0x8718f21dc535dbe8
	.xword	0xb88af3bc52c4f221
	.xword	0x1776a7ca0490455a
	.xword	0x54255e01efe5df0c
	.xword	0xbbaf0dbb775ace63
	.xword	0x02933d41d354245d
	.xword	0x87da62d2029c7ee2
	.xword	0x451a808214e4ea4f
	.xword	0x1db99dcf9fe574ba
	.xword	0x4a1650a73dc1ffcf
	.xword	0x2124b4d5dec11ae7
	.xword	0xb3dc830d01829972
	.xword	0xe719d14ba25b015e
	.xword	0x8b4af1a919e27666
	.xword	0xb6607c169a8c8961
	.xword	0xc8dbec69abde234c
	.xword	0xd9ec5df8fe77eaab
	.xword	0x7f2259757ac80bf6
	.xword	0x536494e7e5937c9a
	.xword	0x8df8bc5c58b6142c
	.xword	0x1b04c6ab8fc08ee3
	.xword	0xf6593d1935177249
	.xword	0x86f398262498a543
	.xword	0x39c5ce1bb4ab3616
	.xword	0xecdf7593c1eb3fa7
	.xword	0x973af85903643656
	.xword	0x8bcc76d775dada1f
	.xword	0xf94f9634b2533685
	.xword	0x08283c255e287110
	.xword	0x1e52ab99eb4823da
	.xword	0x47fed01aff8608d3
	.xword	0xc5bf55f78cf03c0e
	.xword	0x6e83d0644b5a3c3c
	.xword	0x12ebcf86d9d03c68
	.xword	0x43c44452161c1f30
	.xword	0xa2b593efe83dc532
	.xword	0xa1c98884162539ec
	.xword	0x309c7187676bda9a
	.xword	0xcbcfe648ed61592f
	.xword	0x27e29fc62970cc00
	.xword	0x781acb87c0358c6f
	.xword	0xd3dfc612cfe81a3b
	.xword	0xda7021c78e59f6fb
	.xword	0x469701047a0d5499
	.xword	0xa5a4f58e7e5f6e19
	.xword	0x9840d49a54149f01
	.xword	0xefd83d0ccc8cd92a
	.xword	0x273c067a4af00c79
	.xword	0x86fcd7124b2991d3
	.xword	0xc60a20888ee750b8
	.xword	0xb0c53ff503a88148
	.xword	0xbd8172ef18ffb3fc
	.xword	0x88820b9c4929902a
	.xword	0x484f6bc16fe113f7
	.xword	0x1cb2dc334699985e
	.xword	0xbf6ef368a7ca81ff
	.xword	0x31ffb484204558d7
	.xword	0x2c3146f529d7690f
	.xword	0x4affb0cf852ec2a2
	.xword	0x7505266620d3cb56
	.xword	0x9d6221335b5534a8
	.xword	0x1bac6f4c3729963f
	.xword	0xdd5b15659fb9106e
	.xword	0x57a8c422265259fd
	.xword	0xc91160477008beee
	.xword	0xa35c2c919146d0cd
	.xword	0x31fe5b7d8aaf294f
	.xword	0x1c88940d1bc61f11
	.xword	0xa170b22532c9335a
	.xword	0xfe6a5c3cec050ee4
	.xword	0xbaa5ad3a3200627a
	.xword	0x086f8ac39c081e27
	.xword	0x74dea923e9af76e8
	.xword	0x6346025067fb66dc
	.xword	0xd25a168834939e80
	.xword	0xbdfe2d54d760bbcb
	.xword	0x32bb5e4784617ee2
	.xword	0x16d3cce3d23b18dd
	.xword	0x3904580bbd9606b3
	.xword	0x082de13178d6a970
	.xword	0xca2d465bf15dc0fa
	.xword	0x205dc6c49e1d1fff
	.xword	0x1f30089c6b201816
	.xword	0x7b18dcd95dd00164
	.xword	0xa0e45e1e67e6acd3
	.xword	0xdb050fa727db80e8
	.xword	0x956a97dc7fb254fe
	.xword	0xd4e6cb49b30731e5
	.xword	0x518c7feed15bff58
	.xword	0xf476fbaa44ef8190
	.xword	0xe3b59c2c0e5473aa
	.xword	0x36a2536544dfa266
	.xword	0x1f81a89fbf3fa9b5
	.xword	0xb1a5a5908c08784c
	.xword	0x65070e626b6b190c
	.xword	0xc6a2ad3528ba7b4b
	.xword	0x53e7e20c3f8b5b8b
	.xword	0x4c4cf75064afa396
	.xword	0xad7bbd359c90da29
	.xword	0xab2dbc277e37cbe7
	.xword	0xd7c979e1070ec077
	.xword	0xd33b89a67f42babe
	.xword	0x007575c0d65af1c3
	.xword	0x9c172ad1edb02975
	.xword	0x845d87a8d98d1826
	.xword	0x44c912d890a9582a
	.xword	0x1c764c7dedf3947e
	.xword	0x785385ebe70e09ec
	.xword	0xe9f3e27e21f5500d
	.xword	0x2f1d8a47ab190371
	.xword	0xfeba9e17cb3a2bdb
	.xword	0xece156092a2bc6d2
	.xword	0x874c5cf8493d56b8
	.xword	0xb6b6b1559d10ce6d
	.xword	0x54640d8d75b3685d
	.xword	0x962da3b56addb4cf
	.xword	0x4ebda688b951a40d
	.xword	0x17eb0e6ae7893c56
	.xword	0x42801e83f25f5986
	.xword	0xb8b78f47b783e3d1
	.xword	0x5b1ab54647fd0789
	.xword	0xa1f9e5194551206b
	.xword	0x6996026743e8c6ae
	.xword	0xcfe84e79b1f35b7d
	.xword	0x7b825cd60a0fd0ef
	.xword	0xdf3a16b3d649993a
	.xword	0x64dae58632737346
	.xword	0x879ab380e5a99789
	.xword	0x3d82b42936806baa
	.xword	0x9cac5a789231e0ec
	.xword	0xf838a17f28606415
	.xword	0xff4ad1af793d6fc3
	.xword	0xe8c159e141df69f1
	.xword	0x397639b74d3f2271
	.xword	0x00132a71de318048
	.xword	0x5c6cc0fee613ce08
	.xword	0xb9e41e3a41e483cc
	.xword	0x30aa9e28afe3d82d
	.xword	0xddbd8fded83ca233
	.xword	0x3271b7e844f44da6
	.xword	0x3a5169e9b49931bb
	.xword	0xa3aee275e22f645f
	.xword	0xf90faa8290eda646
	.xword	0x9f2ba90ebf7f05bb
	.xword	0xfcba95d5fdff6609
	.xword	0x860d5d45e72caa7c
	.xword	0x5f6ef136eb7290a4
	.xword	0xcd5ca21fccbf1092
	.xword	0x761846c05ea1b57b
	.xword	0x45496380b142e25f
	.xword	0xab202be14ef6508f
	.xword	0x65efbbfe2db98fcf
	.xword	0x361c171c242a6b4a
	.xword	0xbe1af589bc520823
	.xword	0x7259dd1087e09d67
	.xword	0x7e81ed11932c2aa8
	.xword	0x78ada7539477be66
	.xword	0x060750a30d45ab08
	.xword	0xbbc9e47f649792de
	.xword	0x25b96713156d1313
	.xword	0xea056aff8256089f
	.xword	0xa2d415465ff3115d
	.xword	0x1868b90963452c66
	.xword	0x7086eaaedcd26a6c
	.xword	0x7a82bd0b8930c1c4
	.xword	0x2db7815f73d6918a
	.xword	0xe23f0fb40eba4e8a
	.xword	0xdb3480172968fe86
	.xword	0xa830c7cf6065a2ae
	.xword	0xaa1012b87700e4cb
	.xword	0x4f2e5402850417e1
	.xword	0x5abce8dd20d23207
	.xword	0x00a4c3d05587fa29
	.xword	0xf52518c9f2673725
	.xword	0xc9317649a32ce7e2
	.xword	0x9017de8b1fb5a54d
	.xword	0x3c5f5d2b55c7bdd6
	.xword	0xf9a0583a868d798a
	.xword	0xb7594882331993bb
	.xword	0x985e36987a368de9
	.xword	0x15dc85cbfb76eba3
	.xword	0xcd91821c843183cc
	.xword	0xf2082d38ce5a7d98
	.xword	0xb5322f91bf70c870
	.xword	0x960258ad14f70006
	.xword	0x0231fd42ba173205
	.xword	0xe4c3a5e3ab7ddc53
	.xword	0xae02228265963dab
	.xword	0x304a53e967fc76ee
	.xword	0xa4e06843d765399c
	.xword	0xdd486e682fa3d872
	.xword	0x34e054d27c5017e1
	.xword	0x2b325d596e7f32bd
	.xword	0x831d017119e47ab1
	.xword	0x06dfeb67100d8cab
	.xword	0x85b7d4c47fd7b53d
	.xword	0xd5e070654dcdddd4
	.xword	0x2d78192e5d23e85d
	.xword	0x661c361e3db3ef50
	.xword	0x9327a757a8979e74
	.xword	0xa0aae417bc90a0af
	.xword	0x80c097f6b7a326cf
	.xword	0x50ac753aa119552b
	.xword	0x2743739ec5698fd6
	.xword	0x2f8af86980ad308b
	.xword	0x075b7fff344c8d53
	.xword	0x5a656ab21ee3fde8
	.xword	0xa1fb988cc949d330
	.xword	0x36fd00430707737a
	.xword	0x060fb809a11161f8
	.xword	0xff8e1626a29af67d
	.xword	0x6b3d6f51bbb6bbae
	.xword	0x0070c2c7e82d3f5d
	.xword	0xee67444ae1f712e7
	.xword	0x61ff50c98d5aa714
	.xword	0xc061dc3ac553e396
	.xword	0x63d43e88e4390fbc
	.xword	0xcaa951c0564eccaa
	.xword	0x7a21fb3c4e3544ef
	.xword	0xc83531db13cf8ffb
	.xword	0x2d2e839c15301029
	.xword	0x049c5276170735ce
	.xword	0x94ff386c885f7760
	.xword	0xfd574dfb02a05339
	.xword	0xda16b8bb1358e554
	.xword	0x1b7a8c9253b4e6e0
	.xword	0x2364fc1efb537369
	.xword	0x3564534441d32f77
	.xword	0x90480891c26724ef
	.xword	0xd9b3b95fea8db24c
	.xword	0x6811d75f87208f1d
	.xword	0x9c644538f10588a9
	.xword	0xe467d5c5800d0712
	.xword	0x2d3a2c83353cba3b
	.xword	0x680411494708cf84
	.xword	0x9a67fbce1704bbc7
	.xword	0x0a4d3607a41d8540
	.xword	0x02f1baea846d6f28
	.xword	0x2fa32ec1a52e4efb
	.xword	0x1cdc803ba319ece9
	.xword	0x35b4ab63347bcc4b
	.xword	0x50d692799db395fa
	.xword	0x070cb7a246b8ec27
	.xword	0x413f2c5eeef31f51
	.xword	0x3d6981c97176f9db
	.xword	0xec14b7ec75e88943
	.xword	0x221d9ecfb6a418e7
	.xword	0x1841b18bd996fe3d
	.xword	0x0ad9104b933ea85d
	.xword	0xf3a00184f2249731
	.xword	0x8df6fa080edb9e50
	.xword	0x8b5aefbb1263937d
	.xword	0x8c33a0fe65a77c52
	.xword	0x229ad412cb9c752f
	.xword	0x8002d6a58e8a25d2
	.xword	0x5a3d5ed4e6e6ab66
	.xword	0x7ab7bb216c0455e3
	.xword	0x016836d82ecc6d12
	.xword	0xda79e1271f40575d
	.xword	0x63a6839402659cbf
	.xword	0x6dab42389f2c6df4
	.xword	0xb02117d730126ab7
	.xword	0x5ccb051cea68a98d
	.xword	0xdd1e47dd6af8c6e9
	.xword	0xb6e999e613015351
	.xword	0xcb88f671bf578a4c
	.xword	0x66371ea8a4929944
	.xword	0xd5586256a585236e
	.xword	0x477b6753e62f861e
	.xword	0x8358728361436934
	.xword	0x96825731c429a1e0
	.xword	0x0cd529bb98110c66
	.xword	0x3add206a11044077
	.xword	0x88d7824f78f430c3
	.xword	0x95cf05f1b55f9da7
	.xword	0x2373bba898a4dea1
	.xword	0x6b204c50f0edb090
	.xword	0x3e0a389d1695cde2
	.xword	0x5e5224c6faf138b2
	.xword	0x9d9d3f9ec4ed6f92
	.xword	0xa407ea3ccf7d54c0
	.xword	0x1c96ab90e6e99873
	.xword	0x1fd34fe09bb71795
	.xword	0xf7fcaf25ae712187
	.xword	0xe93e6a57c825e9c7
	.xword	0xfec9c5f3578236e8
	.xword	0x9171cb3227693a65
	.xword	0x5fce5f0d810b0b4c
	.xword	0x1b6c173b87696442
	.xword	0x240993af23e9beb3
	.xword	0xc766ef5961b9199a
	.xword	0xc78a3424092cddaf
	.xword	0xf64f743ed0d7a59d
	.xword	0x13422e3f92121255
	.xword	0x3a08de8413104527
	.xword	0xb5351055ff328921
	.xword	0x8102f7832a046814
	.xword	0x6f8e9507d2d6d297
	.xword	0xad9aa074a33a8f8d
	.xword	0xc5405c4063a84268
	.xword	0x370ae8cb962ba29e
	.xword	0x654226170dd6bf92
	.xword	0xecb54a44f5fb6f9e
	.xword	0xed261f5bbbf43601
	.xword	0xb1632332492c4bab
	.xword	0x9bc4a1f982b0be46
	.xword	0xa75f4502bf6e068b
	.xword	0x71c66984a2eed5de
	.xword	0x0d5b852abe0f4854
	.xword	0xcdb6b52ba7606f67
	.xword	0x5bbfd205300171bd
	.xword	0xe8e495245d7ba4e7
	.xword	0xfca79e1931440921
	.xword	0xb187fd2c6d692750
	.xword	0x8b24d232ea092da7
	.xword	0x260cd14a2462418d
	.xword	0xeabd05d05982b683
	.xword	0xbc10984b99e8d3ba
	.xword	0x5876ac9c37793c3f
	.xword	0xb9e3758f21681a2d
	.xword	0x74db6bc2f858e562
	.xword	0xdad7b5c4a5323372
	.xword	0x160cca893a839301
	.xword	0x686e55b339f00887
	.xword	0x122e0fe703fc3327
	.xword	0x81c1ef9b77e35917
	.xword	0x8dbb02be60fb985e
	.xword	0x89e628f758eb6416
	.xword	0xd7808c68a392d4e1
	.xword	0xb0668c36aad65e6a
	.xword	0xb7ce433f6615942e
	.xword	0x900570f9ee8f7217
	.xword	0x4212cf29577d620f
	.xword	0xceb45c160f8c9f84
	.xword	0x54ce6a53ff52f013
	.xword	0x517b5f21cfc573d7
	.xword	0x56b9338cc6a23ff9
	.xword	0xdc980b70b73ed6f5
	.xword	0x5b1905239e0faac5
	.xword	0x813d375d43901afc
	.xword	0x232e016e43b3f54f
	.xword	0x85cfbca92001137f
	.xword	0x9037204bb1ba9450
	.xword	0x1c44e98eea3567e7
	.xword	0x5e5eff61cf335a7a
	.xword	0x5243bd61ca4c3dc0
	.xword	0xacc6c01b47b6fafd
	.xword	0x01f7a95193e62f89
	.xword	0xa31d702976080bb6
	.xword	0x165db69895618268
	.xword	0x2b76c0d2b0ce338a
	.xword	0x766302b0f2732e35
	.xword	0x770d39b6153afdff
	.xword	0xfcb881cce231d692
	.xword	0x5dbff0ecfcbc43f2
	.xword	0x04d102808b6d4c08
	.xword	0xb3c84cf7160f56e2
	.xword	0xa9408eb511bbc621
	.xword	0xe7e75a3e4b2ad126
	.xword	0x9b113032257a9bde
	.xword	0xe750bfa3039a8b4c
	.xword	0x6acbd4069d4e9125
	.xword	0xd1666dacb30bec73
	.xword	0xd02930fde7c38c4b
	.xword	0x75ff285009b99451
	.xword	0x1316bd956f2052fb
	.xword	0xc4f230123bbf3018
	.xword	0xf350cf473a6a156f
	.xword	0x787f39c4e316317b
	.xword	0x177d432adcb874b6
	.xword	0x79e9cc89e6b47f68
	.xword	0x678952af7d609d21
	.xword	0x701eafc464a32195
	.xword	0x68ba7f95df76e70a
	.xword	0xa67dcf61b7259a80
	.xword	0x84adcdf2d7cffb22
	.xword	0x18088757d1e6374b
	.xword	0x299630babf54c2c7
	.xword	0x3eb9503ffec0269a
	.xword	0x71859779bac1dd21
	.xword	0x7c5717e12036c494
	.xword	0x609373acb2160fbe
	.xword	0x37fecc2fb3da9814
	.xword	0xc5402751696b8cac
	.xword	0xd73000267cdda935
	.xword	0x475a6517721044b2
	.xword	0xcfc495f412f8748a
	.xword	0xac69ad9661715587
	.xword	0x26b7600ce5ea4d16
	.xword	0xc4b9b942db7c3e14
	.xword	0x91870ba6a169079a
	.xword	0xf56d0a90054d00f7
	.xword	0x0bae10c3d6593694
	.xword	0x5b4e51cc6008189f
	.xword	0x4031a90185b33608
	.xword	0x483392a6092a932a
	.xword	0xd566cc7058ef14a5
	.xword	0xd3081c450c71e25f
	.xword	0x238e12dcdbffa1be
	.xword	0x168e5377a41969cb
	.xword	0xec82e64a121881a3
	.xword	0xf820beef51192cc6
	.xword	0xe77a925e538884f9
	.xword	0x1ed381c321ab0e6b
	.xword	0xf067936a63a18c40
	.xword	0x4261ef7798c15d35
	.xword	0xafaa19136b076d41
	.xword	0x35e6251f0326669a
	.xword	0xdf20489487c2f624
	.xword	0x2b61b2c8b9187e0d
	.xword	0x66c4ab6d8ee737ab
	.xword	0x6e8f8b1fdba66d26
	.xword	0xea526f1a6fce5a9b
	.xword	0xad181647059e2355
	.xword	0xc366cafef55c04b0
	.xword	0x79118e460fdef2e4
	.xword	0xc59af7a3424f544b
	.xword	0x164dcea98b6cacb8
	.xword	0xc2ae83480edf89c7
	.xword	0x011591c02552a218
	.xword	0x354ea1f10fedb817
	.xword	0xd1f4e5080bcfcf24
	.xword	0x834696ef2a76b042
	.xword	0x0684a26687453a4c
	.xword	0x46794b94d5751860
	.xword	0xf78185227710b8cb
	.xword	0xba48e15090e00d3e
	.xword	0x26e79bd2161483af
	.xword	0xa5bfd3c146628b65
	.xword	0x08832fc42d538ce1
	.xword	0x9baa1da4d16eb0be
	.xword	0x34133af3bc5a86c4
	.xword	0xa7e6589cacf77a51
	.xword	0x05b6a12f5f19c746
	.xword	0x0b18390179196871
	.xword	0x0c7b3f87c3696645
	.xword	0x51cef1710928d7e9
	.xword	0x460f32200cf629b2
	.xword	0xa5bf0069d161ace4
	.xword	0xbe7dbda122819fcb
	.xword	0x4d068a6253fc8c1d
	.xword	0x0b9c9b9d0bd9463e
	.xword	0xa6052b77953e75cf
	.xword	0x1dabd6b0cbda127b
	.xword	0xc8145570993335c7
	.xword	0xbbcc531fa35ecf87
	.xword	0xa256a15187d6b828
	.xword	0x088890d8638ca75e
	.xword	0xbd3597c598d76d3f
	.xword	0x3a3d9379f5d6f938
	.xword	0xe946bf99dbec5acb
	.xword	0xd82a8f4fde54b19d
	.xword	0x85d4b7a7e40c4eef
	.xword	0x4b184ade66921c14
	.xword	0x41142b633716aed8
	.xword	0x47276173bced4cf6
	.xword	0x145278eaeb9a42ca
	.xword	0xfd9214e72d1c31cb
	.xword	0x8914ea8b810057d0
	.xword	0x7977ba88033bbb30
	.xword	0x03b171b12bc2f0df
	.xword	0x5db3cfd0b4e69d54
	.xword	0xf5a89bcbc514175c
	.xword	0x38eb40140a9934da
	.xword	0xed80a67be45d5329
	.xword	0xefe110d764ddffe3
	.xword	0x65082564d5151009
	.xword	0x2b98a89f43c7f44d
	.xword	0xa0f15ca766a983eb
	.xword	0x5a648ec17775ff77
	.xword	0xea6796a51cd0d93b
	.xword	0x46d3b229de07adc9
	.xword	0x3b4545dee210d4c3
	.xword	0xa2042b6fb4e41589
	.xword	0xdcd4df6ef01717d6
	.xword	0x8c01ca8ab9831821
	.xword	0x176a43c41e3fc43a
	.xword	0x51ef473294cc8ff2
	.xword	0x2a492b3c483668a1
	.xword	0x5d87f6c7c069a8d2
	.xword	0x45272a07490afc84
	.xword	0xd7e20cfd23ec0afd
	.xword	0xdccd7fb6efc94543
	.xword	0xf6a49b0d0fdeb905
	.xword	0x072378fe1b1906de
	.xword	0xf5f49f8be8583d62
	.xword	0x302662f4462523f2
	.xword	0xe63751849b6e5cda
	.xword	0x940c1a590b05f95c
	.xword	0x9f0391852b9c2733
	.xword	0x4fc714dfbe5f22c1
	.xword	0xcc943c750d2e0448
	.xword	0xfafca7135862db38
	.xword	0x5ddbdd19d478c390
	.xword	0x1350f2ef57b685d6
	.xword	0x16ff5dc7327cebb5
	.xword	0xc1ae4a6f406efcd2
	.xword	0x213d7b69cc7ffea2
	.xword	0x19e629487aafbedf
	.xword	0xae00388b1dac5f56
	.xword	0x0e98c5e0601f7a05
	.xword	0xfba40e155c642686
	.xword	0xa7c1969be75c1195
	.xword	0x0591aea28bcf56d6
	.xword	0x24f529cb5867d93b
	.xword	0x1a3e45199a3d19f0
	.xword	0x983c43e390d85629
	.xword	0xed6db1522cf881c5
	.xword	0x838814189745632f
	.xword	0x1c8f624b05c2b42d
	.xword	0x2d712f38229d0e72
	.xword	0xdb75d99de496a2ba
	.xword	0xca0b48bd5ddf3506
	.xword	0xe46fd90c9df3704f
	.xword	0x484b996eaf6a9639
	.xword	0xb1ea55e951f56385
	.xword	0x7c80486d997aa21c
	.xword	0xffdda4f735cc88af
	.xword	0x32ebbb16b6c48dc2
	.xword	0xf58265035a0aa58d
	.xword	0xb31fac01a6adf288
	.xword	0x7755932a624ae6eb
	.xword	0x78f8762b03eacb4b
	.xword	0xda7f1330ea530928
	.xword	0x2ad962d568acfb38
	.xword	0x4064ded68cb57a06
	.xword	0xb549fa27fdddeea2
	.xword	0x626f52fb01cc3776
	.xword	0xa920392512f828b5
	.xword	0x718729c60daa5a27
	.xword	0x3ef163c4e9e3583d
	.xword	0x812b6da7dc04a807
	.xword	0xc56707d9bdb604a8
	.xword	0x58f5778a9e50e646
	.xword	0x01dd59665280d73b
	.xword	0xc610092f54e8e363
	.xword	0x24a58862586b5bbd
	.xword	0x09f0bd053181e64c
	.xword	0x8c2421833d2c6b1d
	.xword	0x81c0c75e9dbbfa1f
	.xword	0x67d06e386b97e109
	.xword	0xda2750293191a0ef
	.xword	0x84d128a77adcc602
	.xword	0xa81416030c79ec24
	.xword	0x5322577b8ca57e46
	.xword	0x24e5145cb68e34ab
	.xword	0x071513135933302c
	.xword	0x431af93f58cd7c4a
	.xword	0xcf300a10b98731f7
	.xword	0x9a9ace972a7e0928
	.xword	0xae4cb68697293bd6
	.xword	0x80c9402880db1ff1
	.xword	0x2af4844465747f8e
	.xword	0x30fc5aa56cb6714a
	.xword	0x58bf33e907ee818e
	.xword	0x19a61cc8bc2e1939
	.xword	0xe3c25f972d3111f2
	.xword	0x618065ea426be571
	.xword	0x3fc32bfaaf4268e5
	.xword	0x859b28f7329bd142
	.xword	0xeec250811a55c183
	.xword	0xe1a4cf1cc5d59730
	.xword	0xe7109d561dfcd6e3
	.xword	0x3b92e4683178fb3c
	.xword	0x8623afb97b9810e3
	.xword	0x6aaba6a8e79a96db
	.xword	0xd11d13e92a5d20e8
	.xword	0x1183ed0d811c97a9
	.xword	0x873433c54eaa579e
	.xword	0xa78fcd7ba701b13a
	.xword	0x8bedc792900b97b3
	.xword	0xaa5a6c5c069b21ba
	.xword	0xe51d2bd0b6899e00
	.xword	0xabee4ff7d83611b5
	.xword	0x1d09edf919d478ae
	.xword	0x18767bc3cc993267
	.xword	0xa7d644decb3f5fc8
	.xword	0xb63a1a235618a298
	.xword	0x0550ec59fd25cbd7
	.xword	0x9a8feaf390b9d62a
	.xword	0x3e4b3f31084cba50
	.xword	0xff999e3fe1dc5502
	.xword	0xc873264f5643fe05
	.xword	0xfe204d6e848c17ff
	.xword	0x7d2068fec95c45a4
	.xword	0xa952314367cb6ab7
	.xword	0x20c5317511171984
	.xword	0x96f9502b6b79e02f
	.xword	0x1c19e0c7db9b70f2
	.xword	0x74ae71cf95cc6084
	.xword	0xe4cab3d3294d3a89
	.xword	0x20809e970dd1d0b1
	.xword	0xe10fbc7bd4105e86
	.xword	0xf406c622e9d6a019
	.xword	0x882804833c962a58
	.xword	0xb07dd7f3d21d1ae9
	.xword	0xa6453447e3a6d646
	.xword	0x1eae44d2dfe7db77
	.xword	0x4de7c266c63ece3c
	.xword	0xc9b55b09548cf2e7
	.xword	0xfbbf6e3748cd935a
	.xword	0x3ed7fcc8d9378f4e
	.xword	0x353f98e2042b9c82
	.xword	0xd7a26ca90e0f5c4c
	.xword	0x6285e0e82eba0b80
	.xword	0xa939884fcc3f7985
	.xword	0x6837c8177fa871ec
	.xword	0x8f1c7c481807451c
	.xword	0x9099e61e350380de
	.xword	0x46ed69d1ef0e313b
	.xword	0xf3a38953551e20c1
	.xword	0xfd3bfaa07e87bf42
	.xword	0x497049bf8a3c9687
	.xword	0xb8aa2d31ff226bec
	.xword	0xe71f67f9911150dd
	.xword	0xd316cb02f32cd4b8
	.xword	0xd94421544e2ee253
	.xword	0x969d38abdf8a1651
	.xword	0x7c29bce6d31ff4e5
	.xword	0x151f79e478ab5880
	.xword	0xc32888d2042c27fb
	.xword	0x386d6cb434ae34b1
	.xword	0xdd415b2c13ec065f
	.xword	0x5f075b092a928418
	.xword	0xddbd6e5ba70f0b29
	.xword	0xe7eb9417efd6f41a
	.xword	0x0a034d37ef1187f5
	.xword	0xf773c4b8e36f0e0e
	.xword	0x9ef19e8d3c0da1b5
	.xword	0x99f833289f0d04e6
	.xword	0xe740d31cea026302
	.xword	0x6e1ca2ddb20fc81b
	.xword	0xaad4836e4b8c0241
	.xword	0xaf94f1673e78c56b
	.xword	0xa6033bb968ad9120
	.xword	0xb2aaacecf3fde335
	.xword	0x83a6eeb75b8dfb24
	.xword	0x9e59e48ec7f20fda
	.xword	0x4fe8b50a2581e263
	.xword	0x11506b2df47b20c5
	.xword	0xb358ea34333ba1d8
	.xword	0x0663bc99bdd1bcf0
	.xword	0x56f0783de664feeb
	.xword	0xf6fe4a8b7bb27df5
	.xword	0x92fc4c1148d08657
	.xword	0x5ea696ade4e6d5bf
	.xword	0xedd35ea2a61596f8
	.xword	0x5d42095752c9ae0f
	.xword	0xa5d7f0c8108ec48a
	.xword	0xd45c03541be006ca
	.xword	0xe05ddd3351690d0d
	.xword	0x6e9e1de240f19e3c
	.xword	0x8d1e9f907f377023
	.xword	0x294cf3bcb5e06c33
	.xword	0x2adb013fe50941c1
	.xword	0xb809dce7d2638cdf
	.xword	0x109947e71ceada82
	.xword	0xd60cfc42b2e99180
	.xword	0x30d9d5fffd7aa8f6
	.xword	0xb785398b247a4985
	.xword	0x1112a2ccc7317829
	.xword	0x3b78a72f51f8f020
	.xword	0x57f5d181348990aa
	.xword	0x013579c0b164ef2a
	.xword	0xa3a7b9a593c58aba
	.xword	0xceccd1b83c7fc3dc
	.xword	0xe811573287e5dd1b
	.xword	0xcf50fb762c20c951
	.xword	0xe032cabffae366a1
	.xword	0x86ea011af4586abb
	.xword	0x975baa9c97372f87
	.xword	0xb03f356fc9f680f6
	.xword	0xc2ff387adc7fc6d3
	.xword	0x567b93fe7b4e6c4f
	.xword	0xc7870058864c0f66
	.xword	0x423900146dfbacea
	.xword	0xbf37e0a9a3ec0130
	.xword	0xe8aeb573f514b44e
	.xword	0xa4ffd330bd67acb0
	.xword	0x85000f771081b0dc
	.xword	0x4e07c375359e4548
	.xword	0x3bfdf6b8379dee55
	.xword	0xcb3f617c3eca1eaa
	.xword	0xefa34f0d2d8321fb
	.xword	0x10481f5f47659c90
	.xword	0xfdaf55fabec23a5f
	.xword	0x65641f8224d24936
	.xword	0x7b218b4df3c2ee02
	.xword	0x895eb5d88c1d7526
	.xword	0x8390079332a361ba
	.xword	0x766ae6931f1ad6e8
	.xword	0x8d8e65841c14ba3c
	.xword	0xf1a8485a6a994500
	.xword	0xf936c45c55dc28cf
	.xword	0x50467cce2cb69346
	.xword	0x68c257ee4407d3a7
	.xword	0x0f208afdcef58a85
	.xword	0xb87d667cc85e7871
	.xword	0x2bb170670eafbeae
	.xword	0xa653e070a32bd354
	.xword	0x293e0406a69b4074
	.xword	0x3ad166497ef5aa5b
	.xword	0x72a22eedf7f867d6
	.xword	0x570e769c15e1e85c
	.xword	0x5673a98a3769cada
	.xword	0xf1e2d24f9aa32d59
	.xword	0x6f5a831d3508fcb8
	.xword	0x30b7838d7321c938
	.xword	0xdfad9b71e55971cf
	.xword	0xc592b5b201ef66c0
	.xword	0xbf61858fa106b39c
	.xword	0xae1cdbfc790348b9
	.xword	0x2654b1e515dd89ea
	.xword	0xbb5900f6e6ebc33c
	.xword	0x85d4d5607a30ff8c
	.xword	0x2ab7e487f8e9ce3e
	.xword	0xf5327be78e07a036
	.xword	0x50cf245a8776923a
	.xword	0xd329ca54a4e15970
	.xword	0xeffc0e105069313e
	.xword	0x0c52e52c9d1fcbb3
	.xword	0x6f18d3d29e586bba
	.xword	0xfb23a6a757e5fdbd
	.xword	0x4effe4a5c30ef94f
	.xword	0xd10f5bea90d36859
	.xword	0xa19136cbebae0013
	.xword	0x44f47c8f9302a27a
	.xword	0x5cba24337aecbbf8
	.xword	0x008e189ceb962432
	.xword	0x5fba8cdd94780447
	.xword	0x0c279258151987d5
	.xword	0xf3d1133986104df5
	.xword	0x621dfc6bd642d67d
	.xword	0x1b33ba26dd08d772
	.xword	0x83f871c78d54c15e
	.xword	0xeb0c5d9addaed889
	.xword	0x5fb672b161633b72
	.xword	0x267f937ec9c1232c
	.xword	0x0387580c1f53c3a1
	.xword	0xc4fe90e459893379
	.xword	0x9c8bcc56b1a92bb4
	.xword	0x9ae5222ecda3dbab
	.xword	0xcaeebcfcdb2a5bd2
	.xword	0x2adecc2c50047351
	.xword	0xa048dc02c57463e9
	.xword	0x1db4d7a38e0c43d8
	.xword	0x2f285286295c012f
	.xword	0x68e019add242d94a
	.xword	0x91f1f75926bcd548
	.xword	0x3477c311bc9b81e9
	.xword	0xdfc69b520c5feab4
	.xword	0x2c0a875a60ac0627
	.xword	0x95ca359b2aea401f
	.xword	0xc7bc2fa09b70376a
	.xword	0x8c5f14dc1921418b
	.xword	0x3e1dd50ea4beef9f
	.xword	0xe46f394d24bcc965
	.xword	0x893fa42169c0ee84
	.xword	0xd37e3d863640a72b
	.xword	0x9eb8b7f21ced9938
	.xword	0x60ec49dea624ccbf
	.xword	0x0773864e16a9c50a
	.xword	0xed37579a7cc5cfa0
	.xword	0x3073cdf8bb45a069
	.xword	0xdc192510a859c350
	.xword	0xcb598e0d1f5918e3
	.xword	0x873e77fff46e2538
	.xword	0x295a10d77f8440f9
	.xword	0xde45b490c59a643b
	.xword	0x2358b4f4b2f0c0be
	.xword	0xd58fe9aed1cd9712
	.xword	0xd6f9a60a0f8654a0
	.xword	0xfaa5dfae6e8ed885
	.xword	0x4137a4875a8cdcbf
	.xword	0x25e06629b2e0ddf6
	.xword	0xe78061a95eed71a1
	.xword	0x127209f165e517cd
	.xword	0x0deaae409a16efe1
	.xword	0x9778163a902dfcbf
	.xword	0x0e0a8dbe18c7ba74
	.xword	0x12a2789b0beeeae7
	.xword	0xa3f3e0ceea6bba00
	.xword	0xe5099f004e23a485
	.xword	0x22b5be16e10357ec
	.xword	0x15c889e513b2b085
	.xword	0x20b2ca972b047c34
	.xword	0x2821d35d47abb8f0
	.xword	0xfd6cdc1570fcebee
	.xword	0x891f0f0c725a464e
	.xword	0x6315d29c2b7e8ba6
	.xword	0xd9a7875f5e308782
	.xword	0xd2e2483571c4454b
	.xword	0x848f91aed0b8b416
	.xword	0x31508eaf2619d0b1
	.xword	0x0826b3924f4e43cd
	.xword	0x41d708b216fc312e
	.xword	0x40652348a96733bb
	.xword	0x83b4c0c46d174d15
	.xword	0x7bf8f0362f6731ac
	.xword	0x2c2cb5f1a17c501e
	.xword	0x10cc90084caec16c
	.xword	0x9b9034bfd5fa4bd5
	.xword	0x330fcca02aa0951f
	.xword	0x8a61ae309d26fe63
	.xword	0x21744b90d5a7223e
	.xword	0x2c39b8e4150de04f
	.xword	0x2f7dfbc8723914cd
	.xword	0xc3ca8c719051d2e2
	.xword	0x27e0f721985f9cc9
	.xword	0x2b7778c6a33b596f
	.xword	0x40692b88dc4e3ddb
	.xword	0xcbe73b794cd0005d
	.xword	0xc9731c85533d4724
	.xword	0x78d27b6609d81c54
	.xword	0xc646accfdffac31f
	.xword	0x3991ce7c1a1973b9
	.xword	0x9eb627ca12c5b79d
	.xword	0x0aa1955d5015176d
	.xword	0x4dda37923cff237d
	.xword	0x7d8760762cd0ca19
	.xword	0xc7a78434d4261977
	.xword	0x06e7ae36d8d23851
	.xword	0x05b0ca2958b0eb61
	.xword	0x172b28142574f70c
	.xword	0xb27cf985978f9942
	.xword	0x48b54e40500f83ea
	.xword	0x0feb3f7208201270
	.xword	0x0689a17273284eb7
	.xword	0xa0e78bbc0d5a7341
	.xword	0x6337faba401aec76
	.xword	0x4d0b16d36f798ba4
	.xword	0xe30dede3c4e2d8d9
	.xword	0xb41dbc942d77aeab
	.xword	0xa8af09748044689b
	.xword	0x2818b6d7957e8518
	.xword	0xede019758a05c30d
	.xword	0x7a36bab8601474f7
	.xword	0x70ee92eeedb682e3
	.xword	0x0579934a30528603
	.xword	0x809d006b09c9ce08
	.xword	0xa7ea56ac3455d6e3
	.xword	0x09809070be12369e
	.xword	0x0360d269c6dfc6c4
	.xword	0x8d04894bdb0e04fd
	.xword	0x0726d38adc717624
	.xword	0xab6be50c402c53b7
	.xword	0x55e062a71a674bd4
	.xword	0xb2015815a38f7e42
	.xword	0xb3e5f5daef012761
	.xword	0x7c170a47e209c2a5
	.xword	0xac1fbc42def44435
	.xword	0xd96ca150139f920c
	.xword	0x99bf9180a666f8e6
	.xword	0x3015a81212266e5c
	.xword	0xf1894c852d221692
	.xword	0x2ef6f63a5eb7fd12
	.xword	0xddf940329ea373c8
	.xword	0x463100059cd9e55c
	.xword	0xfa2e405238a1862c
	.xword	0xb40c4c8ef698013f
	.xword	0x43ca2d12e4f5a533
	.xword	0x30e0e2287b20949d
	.xword	0x0ddff898e6e39c6d
	.xword	0x66978cf2962fcb35
	.xword	0x70bbca4350979270
	.xword	0x23f1be42acdd56c6
	.xword	0x07b64047ea8f32b8
	.xword	0x553636ab85454c73
	.xword	0xf34f195bd7f14ba0
	.xword	0x8c1f3941fa95a663
	.xword	0x2b366c2894f19fb1
	.xword	0x37ab0cb2e660f438
	.xword	0x3d0b1cbaaa7534c1
	.xword	0xc962e71aaccaa9e6
	.xword	0x40d684ccb0896fef
	.xword	0x7d66c6b6542713ef
	.xword	0x376fc0ec9001c3c5
	.xword	0x1cc499b8652c29bb
	.xword	0x59166b61f3543810
	.xword	0xde9b961b93fb70ec
	.xword	0x517b9e37fcb18fa9
	.xword	0xf76d8455985e335e
	.xword	0x595fcc160de5760e
	.xword	0x73bec80b84573c2a
	.xword	0x3da3b30cccf55bc3
	.xword	0x21275324c324d15f
	.xword	0x28f3604d0163e914
	.xword	0x71430a068ff0e044
	.xword	0xe6d9048f99a9560c
	.xword	0xe404d9885dd8fa19
	.xword	0x20011d9ac8290f42
	.xword	0x8e58f8c8beedae4c
	.xword	0x2a3e9aef0488a698
	.xword	0xfad55918854f95d0
	.xword	0x6677025fd1d709dd
	.xword	0x058a7fb1007192cb
	.xword	0xc1dd0d118bbdfa0f
	.xword	0xa34966cde96ccac4
	.xword	0xd6d175486b9b44b1
	.xword	0x62caad4df5dfb765
	.xword	0xf02acc748c1bf9f6
	.xword	0xb5b676caf0fdab50
	.xword	0x01dd39c646eabb73
	.xword	0xa432ee0bbac25afc
	.xword	0x07db98431b8a2948
	.xword	0x539eef3c2b2c9d43
	.xword	0xb8d7b5c536366361
	.xword	0x3e242532c81b6f5a
	.xword	0x25fff747915d5b56
	.xword	0x5ceaf58f84f86058
	.xword	0x766ff18b572392bb
	.xword	0x651cfe9d1c60f87a
	.xword	0xbd86f69a225d9798
	.xword	0x4a8c7dfe9b0f2e92
	.xword	0xa2bd72fe8064878c
	.xword	0xb0086768f70831f0
	.xword	0xcb6f154ea45ef99e
	.xword	0x223a9d9b1047ec66
	.xword	0x837b4c9c3ec8030f
	.xword	0xff9faf96de745583
	.xword	0x76eb87e49e7d6433
	.xword	0x934911a41bad3948
	.xword	0x0e47b02b0c1b885e
	.xword	0xac69f895476115f5
	.xword	0xae874febf958e5e7
	.xword	0x9d5e5435ce8810e9
	.xword	0xf08de3213045c1ce
	.xword	0x782d6b876edfde58
	.xword	0xda3d88dbcebf24fd
	.xword	0x1721f42236c58bf8
	.xword	0xd1ec151679900003
	.xword	0x4c8c59b999a7bc3b
	.xword	0xf1cf22db9087b72d
	.xword	0x23ea7aed44178312
	.xword	0xa8ebe94674b41e98
	.xword	0xad5e6822cb3c7c37
	.xword	0x7339dec00efe2d03
	.xword	0x54274b37e9d79023
	.xword	0x25b53b91f1b0a557
	.xword	0xc0edeb759cf58028
	.xword	0x13fb8dc7a5a1b525
	.xword	0x8a0213a770ce4d8b
	.xword	0x6c26ae39dc6fbb8e
	.xword	0xad90768fc7b27647
	.xword	0x039231c68d8605db
	.xword	0x5a4dc77a76992688
	.xword	0x16a23bcf7e8f43d9
	.xword	0x3fe68780ad548e81
	.xword	0x0e4b2c0282b33587
	.xword	0x2a2eff9fc799f1a5
	.xword	0xf9bac88cf2c21e4b
	.xword	0x651e8d494f01a5e8
	.xword	0x63c630ec7689f890
	.xword	0xd7f79808401b6a88
	.xword	0x3c07ebb4b94ebb9c
	.xword	0x32f0fdd33cff3023
	.xword	0x2730de47d32e4d82
	.xword	0x8f543e1155d52ed8
	.xword	0x049999a2038d6b79
	.xword	0x5dc4ee0231d27343
	.xword	0x59a3f3de4c950fcc
	.xword	0xee84c7d7ee637bc8
	.xword	0x415edbcb0c726a61
	.xword	0x1ca806dbe28beec0
	.xword	0xf17d450f354c1367
	.xword	0x74dc0d2bb49aa9c1
	.xword	0x1ff40c42c8bcafc1
	.xword	0xadab6068cd28664f
	.xword	0x02ae1812fe08ac64
	.xword	0x3be8f51c33f1118a
	.xword	0xa3b1eb0bcd4a7d13
	.xword	0xa10da74c5247e902
	.xword	0x48a7c5440469679e
	.xword	0xb92a54213c6265bf
	.xword	0x034011d3ff2091e0
	.xword	0xe44d5cbf867b890c
	.xword	0x3796100be9072822
	.xword	0xf45a769426a28c3a
	.xword	0xb35af5b635b48bb4
	.xword	0xcfaf3c350073e983
	.xword	0x2251139ce9389d63
	.xword	0xf6d3e26acc55dcbc
	.xword	0xd107ab19bbf08088
	.xword	0x2b85bbd2631d3041
	.xword	0x780b813580a3811b
	.xword	0x494bd3b3b9c340d9
	.xword	0x4c371021342a2789
	.xword	0x43138c2c35b13869
	.xword	0x3a23784cfe639937
	.xword	0x2aeecfc7a1df64eb
	.xword	0xe83fb46a95eb056d
	.xword	0xa03c1e6666602b5a
	.xword	0x08ee051202c23f55
	.xword	0x406165493e66be35
	.xword	0x2fc1111b00b12aa4
	.xword	0x1dea4094b010a628
	.xword	0xb8e4bb65add91565
	.xword	0x86534f70a6c53389
	.xword	0x61d8343bee4b0787
	.xword	0x470931fb7d1595c0
	.xword	0x948bf8c7744181f0
	.xword	0x3d6598f33b6989dc
	.xword	0x2fefdbc89ea0dd4f
	.xword	0x6e305a08920e099e
	.xword	0x14bdc00123dfa77c
	.xword	0x7a4038f29b02281f
	.xword	0x2bca301596971066
	.xword	0xd73c39474680460c
	.xword	0x4e3ad9aedf62f306
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx	t1_data_start_0,%g0, %r1
	add	%r1,0,%r2
	add	%g0,0,%r3
	.word 0xa57caaa8  ! 1: MOVR_I	movle	%r18, 0x1, %r18
	.word 0x0ac48003  ! 2: BRNZ	brnz  ,nt	%r18,<label_0x48003>
	.word 0xe4588003  ! 3: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe4588003  ! 4: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57cb702  ! 5: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0x06c4c002  ! 6: BRLZ	brlz  ,nt	%r19,<label_0x4c002>
	.word 0xe4708003  ! 7: STX_R	stx	%r18, [%r2 + %r3]
	.word 0x0acd0001  ! 8: BRNZ	brnz  ,pt	%r20,<label_0xd0001>
	.word 0xe458a0b8  ! 9: LDX_I	ldx	[%r2 + 0x00b8], %r18
	.word 0xa57ceedf  ! 10: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xe400a050  ! 11: LDUW_I	lduw	[%r2 + 0x0050], %r18
	.word 0xa97d1c12  ! 12: MOVR_R	movvs	%r20, %r18, %r20
	.word 0xe8008003  ! 13: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa97cbd55  ! 14: MOVR_I	movvs	%r18, 0x1, %r20
	.word 0xa57d0412  ! 15: MOVR_R	move	%r20, %r18, %r18
	.word 0xe8388003  ! 16: STD_R	std	%r20, [%r2 + %r3]
	.word 0xa40cc013  ! 17: AND_R	and 	%r19, %r19, %r18
	.word 0xa40c8012  ! 18: AND_R	and 	%r18, %r18, %r18
	.word 0xe4708003  ! 19: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa77cadf9  ! 20: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xa44cc013  ! 21: MULX_R	mulx 	%r19, %r19, %r18
	.word 0xa97d0c13  ! 22: MOVR_R	movl	%r20, %r19, %r20
	.word 0xa97cbeab  ! 23: MOVR_I	movvs	%r18, 0x1, %r20
	.word 0xa57d2f8d  ! 24: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xe4188003  ! 25: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa57d1813  ! 26: MOVR_R	movneg	%r20, %r19, %r18
	.word 0xa44d0012  ! 27: MULX_R	mulx 	%r20, %r18, %r18
	.word 0xa57c9c12  ! 28: MOVR_R	movvs	%r18, %r18, %r18
	.word 0xa97c9412  ! 29: MOVR_R	movcs	%r18, %r18, %r20
	.word 0xa8148012  ! 30: OR_R	or 	%r18, %r18, %r20
	.word 0xe8708003  ! 31: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa60cc012  ! 32: AND_R	and 	%r19, %r18, %r19
	.word 0xa77cb6b4  ! 33: MOVR_I	movcs	%r18, 0x1, %r19
	.word 0x22ccc001  ! 34: BRZ	brz,a,pt	%r19,<label_0xcc001>
	.word 0xe4388003  ! 35: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa60cc012  ! 36: AND_R	and 	%r19, %r18, %r19
	.word 0x2ecc8002  ! 37: BRGEZ	brgez,a,pt	%r18,<label_0xc8002>
	.word 0xa57d2596  ! 38: MOVR_I	move	%r20, 0x1, %r18
	.word 0xa60c8012  ! 39: AND_R	and 	%r18, %r18, %r19
	.word 0xa44cc013  ! 40: MULX_R	mulx 	%r19, %r19, %r18
	.word 0xe470a000  ! 41: STX_I	stx	%r18, [%r2 + 0x0000]
	.word 0xe4588003  ! 42: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe470a0f8  ! 43: STX_I	stx	%r18, [%r2 + 0x00f8]
	.word 0xe470a060  ! 44: STX_I	stx	%r18, [%r2 + 0x0060]
	.word 0xe4408003  ! 45: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa77cbce1  ! 46: MOVR_I	movvs	%r18, 0x1, %r19
	.word 0xa97cab62  ! 47: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa44c8012  ! 48: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xe470a078  ! 49: STX_I	stx	%r18, [%r2 + 0x0078]
	.word 0xe440a0d8  ! 50: LDSW_I	ldsw	[%r2 + 0x00d8], %r18
	.word 0xe870a0c0  ! 51: STX_I	stx	%r20, [%r2 + 0x00c0]
	.word 0x0cc48003  ! 52: BRGZ	brgz  ,nt	%r18,<label_0x48003>
	.word 0xe400a0e0  ! 53: LDUW_I	lduw	[%r2 + 0x00e0], %r18
	.word 0xe4588003  ! 54: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x86002060  ! 56: ADD_I	add 	%r0, 0x0060, %r3
	.word 0xa57ca89f  ! 57: MOVR_I	movle	%r18, 0x1, %r18
	.word 0x24c50002  ! 58: BRLEZ	brlez,a,nt	%r20,<label_0x50002>
	.word 0xa97ca87f  ! 59: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa57c8c12  ! 60: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa57d3720  ! 61: MOVR_I	movcs	%r20, 0x1, %r18
	.word 0x04cd0002  ! 62: BRLEZ	brlez  ,pt	%r20,<label_0xd0002>
	.word 0xe8008003  ! 63: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe4388003  ! 64: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa4050013  ! 65: ADD_R	add 	%r20, %r19, %r18
	.word 0xa6048013  ! 66: ADD_R	add 	%r18, %r19, %r19
	.word 0xa404c012  ! 67: ADD_R	add 	%r19, %r18, %r18
	.word 0xa97c8413  ! 68: MOVR_R	move	%r18, %r19, %r20
	.word 0xa57c8812  ! 69: MOVR_R	movle	%r18, %r18, %r18
	.word 0x2ac48002  ! 70: BRNZ	brnz,a,nt	%r18,<label_0x48002>
	.word 0x0cccc003  ! 71: BRGZ	brgz  ,pt	%r19,<label_0xcc003>
	.word 0x86002010  ! 73: ADD_I	add 	%r0, 0x0010, %r3
	.word 0xe858a090  ! 74: LDX_I	ldx	[%r2 + 0x0090], %r20
	.word 0xa614c012  ! 75: OR_R	or 	%r19, %r18, %r19
	.word 0xe4388003  ! 76: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe8188003  ! 77: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xe818a070  ! 78: LDD_I	ldd	[%r2 + 0x0070], %r20
	.word 0x2ac48003  ! 79: BRNZ	brnz,a,nt	%r18,<label_0x48003>
	.word 0xa77c9c12  ! 80: MOVR_R	movvs	%r18, %r18, %r19
	.word 0xa4048012  ! 81: ADD_R	add 	%r18, %r18, %r18
	.word 0xa97d3fca  ! 82: MOVR_I	movvs	%r20, 0x1, %r20
	.word 0xa77d1412  ! 83: MOVR_R	movcs	%r20, %r18, %r19
	.word 0xa404c012  ! 84: ADD_R	add 	%r19, %r18, %r18
	.word 0xe440a098  ! 85: LDSW_I	ldsw	[%r2 + 0x0098], %r18
	.word 0xa64d0013  ! 86: MULX_R	mulx 	%r20, %r19, %r19
	.word 0xe4708003  ! 87: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe800a0e8  ! 88: LDUW_I	lduw	[%r2 + 0x00e8], %r20
	.word 0xa97cafff  ! 89: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa77cd812  ! 90: MOVR_R	movneg	%r19, %r18, %r19
	.word 0xa97ca526  ! 91: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa77c8413  ! 92: MOVR_R	move	%r18, %r19, %r19
	.word 0xa57cad3c  ! 93: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57caea5  ! 94: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa77d1c13  ! 95: MOVR_R	movvs	%r20, %r19, %r19
	.word 0xe4588003  ! 96: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa77cc413  ! 97: MOVR_R	move	%r19, %r19, %r19
	.word 0xe440a0c0  ! 98: LDSW_I	ldsw	[%r2 + 0x00c0], %r18
	.word 0x84006000  ! 100: ADD_I	add 	%r1, 0x0000, %r2
	.word 0xa77d29e9  ! 101: MOVR_I	movle	%r20, 0x1, %r19
	.word 0xe440a0f8  ! 102: LDSW_I	ldsw	[%r2 + 0x00f8], %r18
	.word 0xe470a098  ! 103: STX_I	stx	%r18, [%r2 + 0x0098]
	.word 0xa57cff94  ! 104: MOVR_I	movvs	%r19, 0x1, %r18
	.word 0xa614c012  ! 105: OR_R	or 	%r19, %r18, %r19
	.word 0xa57cc812  ! 106: MOVR_R	movle	%r19, %r18, %r18
	.word 0x06c4c001  ! 107: BRLZ	brlz  ,nt	%r19,<label_0x4c001>
	.word 0xe870a010  ! 108: STX_I	stx	%r20, [%r2 + 0x0010]
	.word 0xe4588003  ! 109: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57ccc12  ! 110: MOVR_R	movl	%r19, %r18, %r18
	.word 0xa57c9c12  ! 111: MOVR_R	movvs	%r18, %r18, %r18
	.word 0xa77cc812  ! 112: MOVR_R	movle	%r19, %r18, %r19
	.word 0xa77c9813  ! 113: MOVR_R	movneg	%r18, %r19, %r19
	.word 0xa57ce8b0  ! 114: MOVR_I	movle	%r19, 0x1, %r18
	.word 0x06c50003  ! 115: BRLZ	brlz  ,nt	%r20,<label_0x50003>
	.word 0xa97d0c12  ! 116: MOVR_R	movl	%r20, %r18, %r20
	.word 0xa4148012  ! 117: OR_R	or 	%r18, %r18, %r18
	.word 0xa77d1812  ! 118: MOVR_R	movneg	%r20, %r18, %r19
	.word 0xa80c8012  ! 119: AND_R	and 	%r18, %r18, %r20
	.word 0xa60c8013  ! 120: AND_R	and 	%r18, %r19, %r19
	.word 0xa57c8413  ! 121: MOVR_R	move	%r18, %r19, %r18
	.word 0xe8408003  ! 122: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa77d2d2f  ! 123: MOVR_I	movl	%r20, 0x1, %r19
	.word 0xa57d1c12  ! 124: MOVR_R	movvs	%r20, %r18, %r18
	.word 0xa57cafc9  ! 125: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xe418a068  ! 126: LDD_I	ldd	[%r2 + 0x0068], %r18
	.word 0xa57d2aee  ! 127: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xe8708003  ! 128: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xe840a030  ! 129: LDSW_I	ldsw	[%r2 + 0x0030], %r20
	.word 0xa97cc812  ! 130: MOVR_R	movle	%r19, %r18, %r20
	.word 0xa97d0412  ! 131: MOVR_R	move	%r20, %r18, %r20
	.word 0xa57d1413  ! 132: MOVR_R	movcs	%r20, %r19, %r18
	.word 0xe800a0b8  ! 133: LDUW_I	lduw	[%r2 + 0x00b8], %r20
	.word 0xe418a040  ! 134: LDD_I	ldd	[%r2 + 0x0040], %r18
	.word 0xa97cc812  ! 135: MOVR_R	movle	%r19, %r18, %r20
	.word 0xa4248012  ! 136: SUB_R	sub 	%r18, %r18, %r18
	.word 0xa77d0c12  ! 137: MOVR_R	movl	%r20, %r18, %r19
	.word 0xa77d0813  ! 138: MOVR_R	movle	%r20, %r19, %r19
	.word 0xa77ca6bc  ! 139: MOVR_I	move	%r18, 0x1, %r19
	.word 0x86002028  ! 141: ADD_I	add 	%r0, 0x0028, %r3
	.word 0xa57cc812  ! 142: MOVR_R	movle	%r19, %r18, %r18
	.word 0x86002078  ! 144: ADD_I	add 	%r0, 0x0078, %r3
	.word 0xa97d1412  ! 145: MOVR_R	movcs	%r20, %r18, %r20
	.word 0xa57cbaa1  ! 146: MOVR_I	movneg	%r18, 0x1, %r18
	.word 0xe4008003  ! 147: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0x0ec48001  ! 148: BRGEZ	brgez  ,nt	%r18,<label_0x48001>
	.word 0xe8588003  ! 149: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa57d1812  ! 150: MOVR_R	movneg	%r20, %r18, %r18
	.word 0xe4188003  ! 151: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xe440a058  ! 152: LDSW_I	ldsw	[%r2 + 0x0058], %r18
	.word 0x860020c0  ! 154: ADD_I	add 	%r0, 0x00c0, %r3
	.word 0xe470a028  ! 155: STX_I	stx	%r18, [%r2 + 0x0028]
	.word 0xe4008003  ! 156: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa77d2718  ! 157: MOVR_I	move	%r20, 0x1, %r19
	.word 0xe440a028  ! 158: LDSW_I	ldsw	[%r2 + 0x0028], %r18
	.word 0xa77cad5a  ! 159: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xe4388003  ! 160: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa77d2938  ! 161: MOVR_I	movle	%r20, 0x1, %r19
	.word 0xa97c8812  ! 162: MOVR_R	movle	%r18, %r18, %r20
	.word 0xa97c8c12  ! 163: MOVR_R	movl	%r18, %r18, %r20
	.word 0xe870a0e8  ! 164: STX_I	stx	%r20, [%r2 + 0x00e8]
	.word 0xa57cbfc5  ! 165: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa57cc413  ! 166: MOVR_R	move	%r19, %r19, %r18
	.word 0x0ec48003  ! 167: BRGEZ	brgez  ,nt	%r18,<label_0x48003>
	.word 0xa57cb58a  ! 168: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xe440a090  ! 169: LDSW_I	ldsw	[%r2 + 0x0090], %r18
	.word 0xa57c8c12  ! 170: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa97cfac4  ! 171: MOVR_I	movneg	%r19, 0x1, %r20
	.word 0xa4248012  ! 172: SUB_R	sub 	%r18, %r18, %r18
	.word 0xe840a018  ! 173: LDSW_I	ldsw	[%r2 + 0x0018], %r20
	.word 0x04c48003  ! 174: BRLEZ	brlez  ,nt	%r18,<label_0x48003>
	.word 0xe840a038  ! 175: LDSW_I	ldsw	[%r2 + 0x0038], %r20
	.word 0xa97d1412  ! 176: MOVR_R	movcs	%r20, %r18, %r20
	.word 0xe4708003  ! 177: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa97d3910  ! 178: MOVR_I	movneg	%r20, 0x1, %r20
	.word 0xe418a0e0  ! 179: LDD_I	ldd	[%r2 + 0x00e0], %r18
	.word 0xa97d27db  ! 180: MOVR_I	move	%r20, 0x1, %r20
	.word 0xa97cb998  ! 181: MOVR_I	movneg	%r18, 0x1, %r20
	.word 0xa57cc412  ! 182: MOVR_R	move	%r19, %r18, %r18
	.word 0xa57d2b26  ! 183: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xa97d0812  ! 184: MOVR_R	movle	%r20, %r18, %r20
	.word 0xa57cb5aa  ! 185: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xa4148012  ! 186: OR_R	or 	%r18, %r18, %r18
	.word 0xa814c013  ! 187: OR_R	or 	%r19, %r19, %r20
	.word 0xa57ceaac  ! 188: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa77d1413  ! 189: MOVR_R	movcs	%r20, %r19, %r19
	.word 0xa97ca9e3  ! 190: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xe870a010  ! 191: STX_I	stx	%r20, [%r2 + 0x0010]
	.word 0xa40cc012  ! 192: AND_R	and 	%r19, %r18, %r18
	.word 0xa97cf8d3  ! 193: MOVR_I	movneg	%r19, 0x1, %r20
	.word 0x860020a0  ! 195: ADD_I	add 	%r0, 0x00a0, %r3
	.word 0xa77cdc12  ! 196: MOVR_R	movvs	%r19, %r18, %r19
	.word 0xa57cfa89  ! 197: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0xa57c8412  ! 198: MOVR_R	move	%r18, %r18, %r18
	.word 0x2ccd0001  ! 199: BRGZ	brgz,a,pt	%r20,<label_0xd0001>
	.word 0xa44c8012  ! 200: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xe818a0a8  ! 201: LDD_I	ldd	[%r2 + 0x00a8], %r20
	.word 0xa77d0412  ! 202: MOVR_R	move	%r20, %r18, %r19
	.word 0xa97d0812  ! 203: MOVR_R	movle	%r20, %r18, %r20
	.word 0xa44c8013  ! 204: MULX_R	mulx 	%r18, %r19, %r18
	.word 0xa77d1813  ! 205: MOVR_R	movneg	%r20, %r19, %r19
	.word 0xa97c9812  ! 206: MOVR_R	movneg	%r18, %r18, %r20
	.word 0xe8588003  ! 207: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa97c9813  ! 208: MOVR_R	movneg	%r18, %r19, %r20
	.word 0xa97caf19  ! 209: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa57cb7fa  ! 210: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xa77ca5ad  ! 211: MOVR_I	move	%r18, 0x1, %r19
	.word 0x0eccc002  ! 212: BRGEZ	brgez  ,pt	%r19,<label_0xcc002>
	.word 0xe870a0c8  ! 213: STX_I	stx	%r20, [%r2 + 0x00c8]
	.word 0xa824c012  ! 214: SUB_R	sub 	%r19, %r18, %r20
	.word 0xe4008003  ! 215: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa624c012  ! 216: SUB_R	sub 	%r19, %r18, %r19
	.word 0xa57d0412  ! 217: MOVR_R	move	%r20, %r18, %r18
	.word 0xe4588003  ! 218: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe400a0d0  ! 219: LDUW_I	lduw	[%r2 + 0x00d0], %r18
	.word 0xa4248012  ! 220: SUB_R	sub 	%r18, %r18, %r18
	.word 0xa57caee6  ! 221: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57c8c12  ! 222: MOVR_R	movl	%r18, %r18, %r18
	.word 0xe4588003  ! 223: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa97cedab  ! 224: MOVR_I	movl	%r19, 0x1, %r20
	.word 0x84006900  ! 226: ADD_I	add 	%r1, 0x0900, %r2
	.word 0xe418a050  ! 227: LDD_I	ldd	[%r2 + 0x0050], %r18
	.word 0xa77d1812  ! 228: MOVR_R	movneg	%r20, %r18, %r19
	.word 0x06c48003  ! 229: BRLZ	brlz  ,nt	%r18,<label_0x48003>
	.word 0xa44cc013  ! 230: MULX_R	mulx 	%r19, %r19, %r18
	.word 0xa57c8c12  ! 231: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa97d3cee  ! 232: MOVR_I	movvs	%r20, 0x1, %r20
	.word 0xa4050012  ! 233: ADD_R	add 	%r20, %r18, %r18
	.word 0x26c48001  ! 234: BRLZ	brlz,a,nt	%r18,<label_0x48001>
	.word 0xa60cc012  ! 235: AND_R	and 	%r19, %r18, %r19
	.word 0xa57ca4de  ! 236: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa77d2aba  ! 237: MOVR_I	movle	%r20, 0x1, %r19
	.word 0xa77cc813  ! 238: MOVR_R	movle	%r19, %r19, %r19
	.word 0x860020f0  ! 240: ADD_I	add 	%r0, 0x00f0, %r3
	.word 0xe4408003  ! 241: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0x84006a00  ! 243: ADD_I	add 	%r1, 0x0a00, %r2
	.word 0xa97cb74e  ! 244: MOVR_I	movcs	%r18, 0x1, %r20
	.word 0xe458a0e0  ! 245: LDX_I	ldx	[%r2 + 0x00e0], %r18
	.word 0xa97c9412  ! 246: MOVR_R	movcs	%r18, %r18, %r20
	.word 0xa57ccc13  ! 247: MOVR_R	movl	%r19, %r19, %r18
	.word 0xe800a0c8  ! 248: LDUW_I	lduw	[%r2 + 0x00c8], %r20
	.word 0x0ec4c001  ! 249: BRGEZ	brgez  ,nt	%r19,<label_0x4c001>
	.word 0xa97c8412  ! 250: MOVR_R	move	%r18, %r18, %r20
	.word 0xa57d3941  ! 251: MOVR_I	movneg	%r20, 0x1, %r18
	.word 0xa77cadf2  ! 252: MOVR_I	movl	%r18, 0x1, %r19
	.word 0x860020e8  ! 254: ADD_I	add 	%r0, 0x00e8, %r3
	.word 0xe440a040  ! 255: LDSW_I	ldsw	[%r2 + 0x0040], %r18
	.word 0xe800a038  ! 256: LDUW_I	lduw	[%r2 + 0x0038], %r20
	.word 0x06cc8001  ! 257: BRLZ	brlz  ,pt	%r18,<label_0xc8001>
	.word 0xa57cd812  ! 258: MOVR_R	movneg	%r19, %r18, %r18
	.word 0xa77cec3d  ! 259: MOVR_I	movl	%r19, 0x1, %r19
	.word 0xe400a000  ! 260: LDUW_I	lduw	[%r2 + 0x0000], %r18
	.word 0x0cc50001  ! 261: BRGZ	brgz  ,nt	%r20,<label_0x50001>
	.word 0xa4250012  ! 262: SUB_R	sub 	%r20, %r18, %r18
	.word 0xa97cf7d9  ! 263: MOVR_I	movcs	%r19, 0x1, %r20
	.word 0xe4188003  ! 264: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xe4408003  ! 265: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe418a008  ! 266: LDD_I	ldd	[%r2 + 0x0008], %r18
	.word 0xe4188003  ! 267: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xe418a068  ! 268: LDD_I	ldd	[%r2 + 0x0068], %r18
	.word 0xa57ca8d9  ! 269: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xe4408003  ! 270: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe470a0e8  ! 271: STX_I	stx	%r18, [%r2 + 0x00e8]
	.word 0xe858a038  ! 272: LDX_I	ldx	[%r2 + 0x0038], %r20
	.word 0xa97d2b67  ! 273: MOVR_I	movle	%r20, 0x1, %r20
	.word 0xa57d0813  ! 274: MOVR_R	movle	%r20, %r19, %r18
	.word 0xa57caca8  ! 275: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57c8812  ! 276: MOVR_R	movle	%r18, %r18, %r18
	.word 0xe4708003  ! 277: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa77d2dca  ! 278: MOVR_I	movl	%r20, 0x1, %r19
	.word 0xa77cf69f  ! 279: MOVR_I	movcs	%r19, 0x1, %r19
	.word 0xe4708003  ! 280: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa77cd812  ! 281: MOVR_R	movneg	%r19, %r18, %r19
	.word 0xe440a020  ! 282: LDSW_I	ldsw	[%r2 + 0x0020], %r18
	.word 0x0ec48002  ! 283: BRGEZ	brgez  ,nt	%r18,<label_0x48002>
	.word 0xa404c012  ! 284: ADD_R	add 	%r19, %r18, %r18
	.word 0xa97ccc13  ! 285: MOVR_R	movl	%r19, %r19, %r20
	.word 0xa4250012  ! 286: SUB_R	sub 	%r20, %r18, %r18
	.word 0xa57d0c12  ! 287: MOVR_R	movl	%r20, %r18, %r18
	.word 0xa77c8c12  ! 288: MOVR_R	movl	%r18, %r18, %r19
	.word 0xe858a028  ! 289: LDX_I	ldx	[%r2 + 0x0028], %r20
	.word 0xa97ca50d  ! 290: MOVR_I	move	%r18, 0x1, %r20
	.word 0x860020c0  ! 292: ADD_I	add 	%r0, 0x00c0, %r3
	.word 0xa77ce426  ! 293: MOVR_I	move	%r19, 0x1, %r19
	.word 0x0cc48001  ! 294: BRGZ	brgz  ,nt	%r18,<label_0x48001>
	.word 0xa40cc012  ! 295: AND_R	and 	%r19, %r18, %r18
	.word 0xa4250012  ! 296: SUB_R	sub 	%r20, %r18, %r18
	.word 0x860020e8  ! 298: ADD_I	add 	%r0, 0x00e8, %r3
	.word 0x04c48001  ! 299: BRLEZ	brlez  ,nt	%r18,<label_0x48001>
	.word 0x0ac48001  ! 300: BRNZ	brnz  ,nt	%r18,<label_0x48001>
	.word 0xe400a040  ! 301: LDUW_I	lduw	[%r2 + 0x0040], %r18
	.word 0xe440a098  ! 302: LDSW_I	ldsw	[%r2 + 0x0098], %r18
	.word 0xa57c8c12  ! 303: MOVR_R	movl	%r18, %r18, %r18
	.word 0xe458a000  ! 304: LDX_I	ldx	[%r2 + 0x0000], %r18
	.word 0xa97d0412  ! 305: MOVR_R	move	%r20, %r18, %r20
	.word 0xa97d0413  ! 306: MOVR_R	move	%r20, %r19, %r20
	.word 0xe8008003  ! 307: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa97c9c12  ! 308: MOVR_R	movvs	%r18, %r18, %r20
	.word 0xa57cd813  ! 309: MOVR_R	movneg	%r19, %r19, %r18
	.word 0xa804c013  ! 310: ADD_R	add 	%r19, %r19, %r20
	.word 0x26cc8003  ! 311: BRLZ	brlz,a,pt	%r18,<label_0xc8003>
	.word 0x02ccc003  ! 312: BRZ	brz  ,pt	%r19,<label_0xcc003>
	.word 0xa57c8c12  ! 313: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa57d2c69  ! 314: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa77c8c13  ! 315: MOVR_R	movl	%r18, %r19, %r19
	.word 0x26c48003  ! 316: BRLZ	brlz,a,nt	%r18,<label_0x48003>
	.word 0xe858a0d0  ! 317: LDX_I	ldx	[%r2 + 0x00d0], %r20
	.word 0xa40d0012  ! 318: AND_R	and 	%r20, %r18, %r18
	.word 0x860020f0  ! 320: ADD_I	add 	%r0, 0x00f0, %r3
	.word 0xa57cb47c  ! 321: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xa97caf70  ! 322: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa77d2d61  ! 323: MOVR_I	movl	%r20, 0x1, %r19
	.word 0xa77cafaa  ! 324: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xe4588003  ! 325: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe4408003  ! 326: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe470a048  ! 327: STX_I	stx	%r18, [%r2 + 0x0048]
	.word 0xa64cc012  ! 328: MULX_R	mulx 	%r19, %r18, %r19
	.word 0xa80cc012  ! 329: AND_R	and 	%r19, %r18, %r20
	.word 0xa57c8c13  ! 330: MOVR_R	movl	%r18, %r19, %r18
	.word 0xa8150012  ! 331: OR_R	or 	%r20, %r18, %r20
	.word 0xa44c8012  ! 332: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xe4008003  ! 333: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe470a080  ! 334: STX_I	stx	%r18, [%r2 + 0x0080]
	.word 0x04cc8003  ! 335: BRLEZ	brlez  ,pt	%r18,<label_0xc8003>
	.word 0xe840a058  ! 336: LDSW_I	ldsw	[%r2 + 0x0058], %r20
	.word 0xa44c8013  ! 337: MULX_R	mulx 	%r18, %r19, %r18
	.word 0xa97caf2f  ! 338: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa40c8012  ! 339: AND_R	and 	%r18, %r18, %r18
	.word 0xa57cdc13  ! 340: MOVR_R	movvs	%r19, %r19, %r18
	.word 0xe4708003  ! 341: STX_R	stx	%r18, [%r2 + %r3]
	.word 0x2ac50002  ! 342: BRNZ	brnz,a,nt	%r20,<label_0x50002>
	.word 0xa6150013  ! 343: OR_R	or 	%r20, %r19, %r19
	.word 0xa57ca7be  ! 344: MOVR_I	move	%r18, 0x1, %r18
	.word 0x84006e00  ! 346: ADD_I	add 	%r1, 0x0e00, %r2
	.word 0xe418a078  ! 347: LDD_I	ldd	[%r2 + 0x0078], %r18
	.word 0xe4588003  ! 348: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe400a058  ! 349: LDUW_I	lduw	[%r2 + 0x0058], %r18
	.word 0xa57cbdd5  ! 350: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xe418a048  ! 351: LDD_I	ldd	[%r2 + 0x0048], %r18
	.word 0x2cc4c002  ! 352: BRGZ	brgz,a,nt	%r19,<label_0x4c002>
	.word 0xa77c8412  ! 353: MOVR_R	move	%r18, %r18, %r19
	.word 0xa77cbecb  ! 354: MOVR_I	movvs	%r18, 0x1, %r19
	.word 0xa77d2c21  ! 355: MOVR_I	movl	%r20, 0x1, %r19
	.word 0xa57c8c12  ! 356: MOVR_R	movl	%r18, %r18, %r18
	.word 0xe870a0d0  ! 357: STX_I	stx	%r20, [%r2 + 0x00d0]
	.word 0x0ac50001  ! 358: BRNZ	brnz  ,nt	%r20,<label_0x50001>
	.word 0xe8708003  ! 359: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xe4008003  ! 360: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe870a0a0  ! 361: STX_I	stx	%r20, [%r2 + 0x00a0]
	.word 0xa57c8412  ! 362: MOVR_R	move	%r18, %r18, %r18
	.word 0xa57d0812  ! 363: MOVR_R	movle	%r20, %r18, %r18
	.word 0xa97c9413  ! 364: MOVR_R	movcs	%r18, %r19, %r20
	.word 0xa97ca82c  ! 365: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa60cc013  ! 366: AND_R	and 	%r19, %r19, %r19
	.word 0xa57cc812  ! 367: MOVR_R	movle	%r19, %r18, %r18
	.word 0x84006f00  ! 369: ADD_I	add 	%r1, 0x0f00, %r2
	.word 0x02c48002  ! 370: BRZ	brz  ,nt	%r18,<label_0x48002>
	.word 0xa97cb6a3  ! 371: MOVR_I	movcs	%r18, 0x1, %r20
	.word 0xa97ca780  ! 372: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa57c8813  ! 373: MOVR_R	movle	%r18, %r19, %r18
	.word 0x86002008  ! 375: ADD_I	add 	%r0, 0x0008, %r3
	.word 0xa57c9812  ! 376: MOVR_R	movneg	%r18, %r18, %r18
	.word 0xa57c8413  ! 377: MOVR_R	move	%r18, %r19, %r18
	.word 0xa77cbbdb  ! 378: MOVR_I	movneg	%r18, 0x1, %r19
	.word 0xe4408003  ! 379: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa57d2672  ! 380: MOVR_I	move	%r20, 0x1, %r18
	.word 0xe4408003  ! 381: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe4408003  ! 382: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe4408003  ! 383: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa77cc412  ! 384: MOVR_R	move	%r19, %r18, %r19
	.word 0xa57ca6ea  ! 385: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa77cf7e2  ! 386: MOVR_I	movcs	%r19, 0x1, %r19
	.word 0xa57c8c12  ! 387: MOVR_R	movl	%r18, %r18, %r18
	.word 0xe440a0f0  ! 388: LDSW_I	ldsw	[%r2 + 0x00f0], %r18
	.word 0xe8588003  ! 389: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe8708003  ! 390: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xe4188003  ! 391: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa97c8812  ! 392: MOVR_R	movle	%r18, %r18, %r20
	.word 0xe8188003  ! 393: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xa57d0c12  ! 394: MOVR_R	movl	%r20, %r18, %r18
	.word 0xe858a0a0  ! 395: LDX_I	ldx	[%r2 + 0x00a0], %r20
	.word 0xa97ca572  ! 396: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa57c8412  ! 397: MOVR_R	move	%r18, %r18, %r18
	.word 0xa44d0012  ! 398: MULX_R	mulx 	%r20, %r18, %r18
	.word 0xa414c012  ! 399: OR_R	or 	%r19, %r18, %r18
	.word 0xa57cf44d  ! 400: MOVR_I	movcs	%r19, 0x1, %r18
	.word 0xe400a0b0  ! 401: LDUW_I	lduw	[%r2 + 0x00b0], %r18
	.word 0xe4588003  ! 402: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa60cc012  ! 403: AND_R	and 	%r19, %r18, %r19
	.word 0xa57c8412  ! 404: MOVR_R	move	%r18, %r18, %r18
	.word 0x84006100  ! 406: ADD_I	add 	%r1, 0x0100, %r2
	.word 0xa57ce87b  ! 407: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xe4388003  ! 408: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe4008003  ! 409: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa77cdc12  ! 410: MOVR_R	movvs	%r19, %r18, %r19
	.word 0x06ccc002  ! 411: BRLZ	brlz  ,pt	%r19,<label_0xcc002>
	.word 0x24cd0002  ! 412: BRLEZ	brlez,a,pt	%r20,<label_0xd0002>
	.word 0x86002070  ! 414: ADD_I	add 	%r0, 0x0070, %r3
	.word 0xa40cc012  ! 415: AND_R	and 	%r19, %r18, %r18
	.word 0x84006800  ! 417: ADD_I	add 	%r1, 0x0800, %r2
	.word 0xe8588003  ! 418: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe8008003  ! 419: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe4708003  ! 420: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa77d3812  ! 421: MOVR_I	movneg	%r20, 0x1, %r19
	.word 0xa97c9412  ! 422: MOVR_R	movcs	%r18, %r18, %r20
	.word 0xa57caeb3  ! 423: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa77cfef8  ! 424: MOVR_I	movvs	%r19, 0x1, %r19
	.word 0xa57cbb1f  ! 425: MOVR_I	movneg	%r18, 0x1, %r18
	.word 0xa6048013  ! 426: ADD_R	add 	%r18, %r19, %r19
	.word 0xa57c9c13  ! 427: MOVR_R	movvs	%r18, %r19, %r18
	.word 0xa57c8813  ! 428: MOVR_R	movle	%r18, %r19, %r18
	.word 0xa77cb74e  ! 429: MOVR_I	movcs	%r18, 0x1, %r19
	.word 0xa57cf922  ! 430: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0xa97c8812  ! 431: MOVR_R	movle	%r18, %r18, %r20
	.word 0xe4008003  ! 432: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe8588003  ! 433: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa97cc812  ! 434: MOVR_R	movle	%r19, %r18, %r20
	.word 0xa97c9813  ! 435: MOVR_R	movneg	%r18, %r19, %r20
	.word 0xa57cc412  ! 436: MOVR_R	move	%r19, %r18, %r18
	.word 0x2cc48003  ! 437: BRGZ	brgz,a,nt	%r18,<label_0x48003>
	.word 0x2ec48001  ! 438: BRGEZ	brgez,a,nt	%r18,<label_0x48001>
	.word 0xa8048012  ! 439: ADD_R	add 	%r18, %r18, %r20
	.word 0xa8050012  ! 440: ADD_R	add 	%r20, %r18, %r20
	.word 0x0acc8001  ! 441: BRNZ	brnz  ,pt	%r18,<label_0xc8001>
	.word 0xa44cc013  ! 442: MULX_R	mulx 	%r19, %r19, %r18
	.word 0xa57cc812  ! 443: MOVR_R	movle	%r19, %r18, %r18
	.word 0xa77d28a2  ! 444: MOVR_I	movle	%r20, 0x1, %r19
	.word 0xa97d0412  ! 445: MOVR_R	move	%r20, %r18, %r20
	.word 0xe4588003  ! 446: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa40c8013  ! 447: AND_R	and 	%r18, %r19, %r18
	.word 0xe4708003  ! 448: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa57cc813  ! 449: MOVR_R	movle	%r19, %r19, %r18
	.word 0xa57d3607  ! 450: MOVR_I	movcs	%r20, 0x1, %r18
	.word 0x06c48003  ! 451: BRLZ	brlz  ,nt	%r18,<label_0x48003>
	.word 0xa77cfceb  ! 452: MOVR_I	movvs	%r19, 0x1, %r19
	.word 0xa97cafe4  ! 453: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa77d1413  ! 454: MOVR_R	movcs	%r20, %r19, %r19
	.word 0xa80c8012  ! 455: AND_R	and 	%r18, %r18, %r20
	.word 0xa97d2fc6  ! 456: MOVR_I	movl	%r20, 0x1, %r20
	.word 0xe4408003  ! 457: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa57d3696  ! 458: MOVR_I	movcs	%r20, 0x1, %r18
	.word 0xa44d0012  ! 459: MULX_R	mulx 	%r20, %r18, %r18
	.word 0x84006d00  ! 461: ADD_I	add 	%r1, 0x0d00, %r2
	.word 0x0ac4c003  ! 462: BRNZ	brnz  ,nt	%r19,<label_0x4c003>
	.word 0xa57c8c12  ! 463: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa97cc412  ! 464: MOVR_R	move	%r19, %r18, %r20
	.word 0x86002018  ! 466: ADD_I	add 	%r0, 0x0018, %r3
	.word 0xa57c9812  ! 467: MOVR_R	movneg	%r18, %r18, %r18
	.word 0xa44d0013  ! 468: MULX_R	mulx 	%r20, %r19, %r18
	.word 0xa57ca7db  ! 469: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa44d0012  ! 470: MULX_R	mulx 	%r20, %r18, %r18
	.word 0xa57cdc12  ! 471: MOVR_R	movvs	%r19, %r18, %r18
	.word 0xe4388003  ! 472: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa6148012  ! 473: OR_R	or 	%r18, %r18, %r19
	.word 0xa97d2e38  ! 474: MOVR_I	movl	%r20, 0x1, %r20
	.word 0xa77cb70c  ! 475: MOVR_I	movcs	%r18, 0x1, %r19
	.word 0xe4588003  ! 476: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa97caa26  ! 477: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa8048012  ! 478: ADD_R	add 	%r18, %r18, %r20
	.word 0xa6248012  ! 479: SUB_R	sub 	%r18, %r18, %r19
	.word 0xa8048013  ! 480: ADD_R	add 	%r18, %r19, %r20
	.word 0xa97d3a8a  ! 481: MOVR_I	movneg	%r20, 0x1, %r20
	.word 0x0cc48002  ! 482: BRGZ	brgz  ,nt	%r18,<label_0x48002>
	.word 0xe400a098  ! 483: LDUW_I	lduw	[%r2 + 0x0098], %r18
	.word 0xa8048013  ! 484: ADD_R	add 	%r18, %r19, %r20
	.word 0xa57c8c13  ! 485: MOVR_R	movl	%r18, %r19, %r18
	.word 0xa77c9413  ! 486: MOVR_R	movcs	%r18, %r19, %r19
	.word 0xa97cebdb  ! 487: MOVR_I	movle	%r19, 0x1, %r20
	.word 0xa40cc012  ! 488: AND_R	and 	%r19, %r18, %r18
	.word 0xa44c8013  ! 489: MULX_R	mulx 	%r18, %r19, %r18
	.word 0xe4408003  ! 490: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa57d3aa0  ! 491: MOVR_I	movneg	%r20, 0x1, %r18
	.word 0xa8048012  ! 492: ADD_R	add 	%r18, %r18, %r20
	.word 0xa8148012  ! 493: OR_R	or 	%r18, %r18, %r20
	.word 0xa57d24d1  ! 494: MOVR_I	move	%r20, 0x1, %r18
	.word 0xa57cac1c  ! 495: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57ca9ef  ! 496: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa57c8412  ! 497: MOVR_R	move	%r18, %r18, %r18
	.word 0xe4708003  ! 498: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa77d2b27  ! 499: MOVR_I	movle	%r20, 0x1, %r19
	.word 0x86002030  ! 501: ADD_I	add 	%r0, 0x0030, %r3
	.word 0xe840a0b8  ! 502: LDSW_I	ldsw	[%r2 + 0x00b8], %r20
	.word 0xe470a0e0  ! 503: STX_I	stx	%r18, [%r2 + 0x00e0]
	.word 0xe4188003  ! 504: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa44c8012  ! 505: MULX_R	mulx 	%r18, %r18, %r18
	.word 0x84006a00  ! 507: ADD_I	add 	%r1, 0x0a00, %r2
	.word 0xe440a078  ! 508: LDSW_I	ldsw	[%r2 + 0x0078], %r18
	.word 0xe458a060  ! 509: LDX_I	ldx	[%r2 + 0x0060], %r18
	.word 0x0accc002  ! 510: BRNZ	brnz  ,pt	%r19,<label_0xcc002>
	.word 0xe4408003  ! 511: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe8708003  ! 512: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xe8008003  ! 513: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa97ca75d  ! 514: MOVR_I	move	%r18, 0x1, %r20
	.word 0x0ec48001  ! 515: BRGEZ	brgez  ,nt	%r18,<label_0x48001>
	.word 0xa57c8812  ! 516: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa97ca800  ! 517: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa44d0012  ! 518: MULX_R	mulx 	%r20, %r18, %r18
	.word 0xa4050012  ! 519: ADD_R	add 	%r20, %r18, %r18
	.word 0xa57ce4e2  ! 520: MOVR_I	move	%r19, 0x1, %r18
	.word 0xe458a0a0  ! 521: LDX_I	ldx	[%r2 + 0x00a0], %r18
	.word 0xa57d2dee  ! 522: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa97ccc12  ! 523: MOVR_R	movl	%r19, %r18, %r20
	.word 0x860020b8  ! 525: ADD_I	add 	%r0, 0x00b8, %r3
	.word 0xa77cf74d  ! 526: MOVR_I	movcs	%r19, 0x1, %r19
	.word 0x84006f00  ! 528: ADD_I	add 	%r1, 0x0f00, %r2
	.word 0xa57c8812  ! 529: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa57cd813  ! 530: MOVR_R	movneg	%r19, %r19, %r18
	.word 0xe840a0b8  ! 531: LDSW_I	ldsw	[%r2 + 0x00b8], %r20
	.word 0xa57cd413  ! 532: MOVR_R	movcs	%r19, %r19, %r18
	.word 0xa6150013  ! 533: OR_R	or 	%r20, %r19, %r19
	.word 0xe8708003  ! 534: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa6250012  ! 535: SUB_R	sub 	%r20, %r18, %r19
	.word 0x86002058  ! 537: ADD_I	add 	%r0, 0x0058, %r3
	.word 0xa57ca8ab  ! 538: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa77c8c12  ! 539: MOVR_R	movl	%r18, %r18, %r19
	.word 0xe470a018  ! 540: STX_I	stx	%r18, [%r2 + 0x0018]
	.word 0xe8588003  ! 541: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa6148013  ! 542: OR_R	or 	%r18, %r19, %r19
	.word 0xe8408003  ! 543: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa4150012  ! 544: OR_R	or 	%r20, %r18, %r18
	.word 0xa57d0413  ! 545: MOVR_R	move	%r20, %r19, %r18
	.word 0xa97cae3e  ! 546: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa57cc812  ! 547: MOVR_R	movle	%r19, %r18, %r18
	.word 0xe4008003  ! 548: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa44d0012  ! 549: MULX_R	mulx 	%r20, %r18, %r18
	.word 0xa97ceb48  ! 550: MOVR_I	movle	%r19, 0x1, %r20
	.word 0xa97c8c12  ! 551: MOVR_R	movl	%r18, %r18, %r20
	.word 0x84006900  ! 553: ADD_I	add 	%r1, 0x0900, %r2
	.word 0xe4588003  ! 554: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa77cbb9a  ! 555: MOVR_I	movneg	%r18, 0x1, %r19
	.word 0xa77cc813  ! 556: MOVR_R	movle	%r19, %r19, %r19
	.word 0xe440a048  ! 557: LDSW_I	ldsw	[%r2 + 0x0048], %r18
	.word 0x0cc48003  ! 558: BRGZ	brgz  ,nt	%r18,<label_0x48003>
	.word 0xe8008003  ! 559: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa57cc813  ! 560: MOVR_R	movle	%r19, %r19, %r18
	.word 0xa77c8c13  ! 561: MOVR_R	movl	%r18, %r19, %r19
	.word 0xe4588003  ! 562: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe8588003  ! 563: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe4388003  ! 564: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa4148012  ! 565: OR_R	or 	%r18, %r18, %r18
	.word 0xe4008003  ! 566: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0x86002050  ! 568: ADD_I	add 	%r0, 0x0050, %r3
	.word 0xa77d1c13  ! 569: MOVR_R	movvs	%r20, %r19, %r19
	.word 0xa97ca50c  ! 570: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa4048012  ! 571: ADD_R	add 	%r18, %r18, %r18
	.word 0x86002048  ! 573: ADD_I	add 	%r0, 0x0048, %r3
	.word 0xe470a0b0  ! 574: STX_I	stx	%r18, [%r2 + 0x00b0]
	.word 0xa97c8412  ! 575: MOVR_R	move	%r18, %r18, %r20
	.word 0xa97c8813  ! 576: MOVR_R	movle	%r18, %r19, %r20
	.word 0x0ccc8003  ! 577: BRGZ	brgz  ,pt	%r18,<label_0xc8003>
	.word 0x86002068  ! 579: ADD_I	add 	%r0, 0x0068, %r3
	.word 0xa97d1812  ! 580: MOVR_R	movneg	%r20, %r18, %r20
	.word 0x84006c00  ! 582: ADD_I	add 	%r1, 0x0c00, %r2
	.word 0xa97ca58e  ! 583: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa57cee64  ! 584: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xa77d0412  ! 585: MOVR_R	move	%r20, %r18, %r19
	.word 0xe4008003  ! 586: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0x0acc8003  ! 587: BRNZ	brnz  ,pt	%r18,<label_0xc8003>
	.word 0xe8588003  ! 588: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa57cab14  ! 589: MOVR_I	movle	%r18, 0x1, %r18
	.word 0x84006d00  ! 591: ADD_I	add 	%r1, 0x0d00, %r2
	.word 0xe4708003  ! 592: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa4248013  ! 593: SUB_R	sub 	%r18, %r19, %r18
	.word 0xa97cac47  ! 594: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa6248012  ! 595: SUB_R	sub 	%r18, %r18, %r19
	.word 0xa97ce411  ! 596: MOVR_I	move	%r19, 0x1, %r20
	.word 0xe4408003  ! 597: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe858a030  ! 598: LDX_I	ldx	[%r2 + 0x0030], %r20
	.word 0xa57d2c5b  ! 599: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa77c8c13  ! 600: MOVR_R	movl	%r18, %r19, %r19
	.word 0xa614c012  ! 601: OR_R	or 	%r19, %r18, %r19
	.word 0x02c48003  ! 602: BRZ	brz  ,nt	%r18,<label_0x48003>
	.word 0xa97ce5cb  ! 603: MOVR_I	move	%r19, 0x1, %r20
	.word 0xa60d0013  ! 604: AND_R	and 	%r20, %r19, %r19
	.word 0xe4408003  ! 605: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0x04cd0001  ! 606: BRLEZ	brlez  ,pt	%r20,<label_0xd0001>
	.word 0xa4148012  ! 607: OR_R	or 	%r18, %r18, %r18
	.word 0x24c4c003  ! 608: BRLEZ	brlez,a,nt	%r19,<label_0x4c003>
	.word 0xe8408003  ! 609: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xe440a0f8  ! 610: LDSW_I	ldsw	[%r2 + 0x00f8], %r18
	.word 0xa77d0412  ! 611: MOVR_R	move	%r20, %r18, %r19
	.word 0xa57ca66b  ! 612: MOVR_I	move	%r18, 0x1, %r18
	.word 0xe400a028  ! 613: LDUW_I	lduw	[%r2 + 0x0028], %r18
	.word 0xe400a060  ! 614: LDUW_I	lduw	[%r2 + 0x0060], %r18
	.word 0xa57cbd47  ! 615: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xe8588003  ! 616: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa57ca60a  ! 617: MOVR_I	move	%r18, 0x1, %r18
	.word 0x0ec48002  ! 618: BRGEZ	brgez  ,nt	%r18,<label_0x48002>
	.word 0xe8588003  ! 619: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa84c8012  ! 620: MULX_R	mulx 	%r18, %r18, %r20
	.word 0xe818a018  ! 621: LDD_I	ldd	[%r2 + 0x0018], %r20
	.word 0xa57c8412  ! 622: MOVR_R	move	%r18, %r18, %r18
	.word 0x84006f00  ! 624: ADD_I	add 	%r1, 0x0f00, %r2
	.word 0xa77c9412  ! 625: MOVR_R	movcs	%r18, %r18, %r19
	.word 0xe470a0b0  ! 626: STX_I	stx	%r18, [%r2 + 0x00b0]
	.word 0xa4248013  ! 627: SUB_R	sub 	%r18, %r19, %r18
	.word 0xa4048012  ! 628: ADD_R	add 	%r18, %r18, %r18
	.word 0xa77ce639  ! 629: MOVR_I	move	%r19, 0x1, %r19
	.word 0xe4708003  ! 630: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe4708003  ! 631: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa97caa1f  ! 632: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xe4588003  ! 633: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa4148012  ! 634: OR_R	or 	%r18, %r18, %r18
	.word 0xa6148013  ! 635: OR_R	or 	%r18, %r19, %r19
	.word 0xa77cc812  ! 636: MOVR_R	movle	%r19, %r18, %r19
	.word 0xa40c8013  ! 637: AND_R	and 	%r18, %r19, %r18
	.word 0x26c48002  ! 638: BRLZ	brlz,a,nt	%r18,<label_0x48002>
	.word 0xe4408003  ! 639: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe4408003  ! 640: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe8708003  ! 641: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa8248012  ! 642: SUB_R	sub 	%r18, %r18, %r20
	.word 0xa824c012  ! 643: SUB_R	sub 	%r19, %r18, %r20
	.word 0xe800a020  ! 644: LDUW_I	lduw	[%r2 + 0x0020], %r20
	.word 0xa4248013  ! 645: SUB_R	sub 	%r18, %r19, %r18
	.word 0xa57cffb1  ! 646: MOVR_I	movvs	%r19, 0x1, %r18
	.word 0xe4408003  ! 647: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe440a018  ! 648: LDSW_I	ldsw	[%r2 + 0x0018], %r18
	.word 0xa8050012  ! 649: ADD_R	add 	%r20, %r18, %r20
	.word 0xe400a0c8  ! 650: LDUW_I	lduw	[%r2 + 0x00c8], %r18
	.word 0xe470a0b0  ! 651: STX_I	stx	%r18, [%r2 + 0x00b0]
	.word 0xe4408003  ! 652: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa57d3a2d  ! 653: MOVR_I	movneg	%r20, 0x1, %r18
	.word 0xa57caf1b  ! 654: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa77cd412  ! 655: MOVR_R	movcs	%r19, %r18, %r19
	.word 0xe870a088  ! 656: STX_I	stx	%r20, [%r2 + 0x0088]
	.word 0xa57d240c  ! 657: MOVR_I	move	%r20, 0x1, %r18
	.word 0xe458a0e8  ! 658: LDX_I	ldx	[%r2 + 0x00e8], %r18
	.word 0xa97ca4fe  ! 659: MOVR_I	move	%r18, 0x1, %r20
	.word 0xa77ceac9  ! 660: MOVR_I	movle	%r19, 0x1, %r19
	.word 0xe8408003  ! 661: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa57ca932  ! 662: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xe440a058  ! 663: LDSW_I	ldsw	[%r2 + 0x0058], %r18
	.word 0xe4588003  ! 664: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x06cc8002  ! 665: BRLZ	brlz  ,pt	%r18,<label_0xc8002>
	.word 0xe4588003  ! 666: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa97cb97f  ! 667: MOVR_I	movneg	%r18, 0x1, %r20
	.word 0xa57ca499  ! 668: MOVR_I	move	%r18, 0x1, %r18
	.word 0x0ec48002  ! 669: BRGEZ	brgez  ,nt	%r18,<label_0x48002>
	.word 0xa57c8412  ! 670: MOVR_R	move	%r18, %r18, %r18
	.word 0xa57cdc13  ! 671: MOVR_R	movvs	%r19, %r19, %r18
	.word 0xe470a070  ! 672: STX_I	stx	%r18, [%r2 + 0x0070]
	.word 0xe4408003  ! 673: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe400a0f0  ! 674: LDUW_I	lduw	[%r2 + 0x00f0], %r18
	.word 0xa97d2fbd  ! 675: MOVR_I	movl	%r20, 0x1, %r20
	.word 0xe4388003  ! 676: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa97ce91f  ! 677: MOVR_I	movle	%r19, 0x1, %r20
	.word 0xa57c9412  ! 678: MOVR_R	movcs	%r18, %r18, %r18
	.word 0xa57cb71a  ! 679: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xe4708003  ! 680: STX_R	stx	%r18, [%r2 + %r3]
	.word 0x2cccc003  ! 681: BRGZ	brgz,a,pt	%r19,<label_0xcc003>
	.word 0xa4250012  ! 682: SUB_R	sub 	%r20, %r18, %r18
	.word 0xe4388003  ! 683: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa57d36a1  ! 684: MOVR_I	movcs	%r20, 0x1, %r18
	.word 0xa57cbde5  ! 685: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa77ca4fa  ! 686: MOVR_I	move	%r18, 0x1, %r19
	.word 0xe8708003  ! 687: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa97c8812  ! 688: MOVR_R	movle	%r18, %r18, %r20
	.word 0xa97c8c13  ! 689: MOVR_R	movl	%r18, %r19, %r20
	.word 0xe458a0c8  ! 690: LDX_I	ldx	[%r2 + 0x00c8], %r18
	.word 0xa77ca585  ! 691: MOVR_I	move	%r18, 0x1, %r19
	.word 0xa57ceb7a  ! 692: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa77cef30  ! 693: MOVR_I	movl	%r19, 0x1, %r19
	.word 0xa77c8c13  ! 694: MOVR_R	movl	%r18, %r19, %r19
	.word 0xa4248012  ! 695: SUB_R	sub 	%r18, %r18, %r18
	.word 0xa57d266e  ! 696: MOVR_I	move	%r20, 0x1, %r18
	.word 0x84006e00  ! 698: ADD_I	add 	%r1, 0x0e00, %r2
	.word 0xe4388003  ! 699: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe4008003  ! 700: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe418a058  ! 701: LDD_I	ldd	[%r2 + 0x0058], %r18
	.word 0xa97d2b75  ! 702: MOVR_I	movle	%r20, 0x1, %r20
	.word 0x06c50003  ! 703: BRLZ	brlz  ,nt	%r20,<label_0x50003>
	.word 0xe8588003  ! 704: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0x86002040  ! 706: ADD_I	add 	%r0, 0x0040, %r3
	.word 0xa77d0c12  ! 707: MOVR_R	movl	%r20, %r18, %r19
	.word 0xa77cba10  ! 708: MOVR_I	movneg	%r18, 0x1, %r19
	.word 0xa57c9412  ! 709: MOVR_R	movcs	%r18, %r18, %r18
	.word 0xa57ccc12  ! 710: MOVR_R	movl	%r19, %r18, %r18
	.word 0xa57ceeac  ! 711: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xe8408003  ! 712: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0x860020f8  ! 714: ADD_I	add 	%r0, 0x00f8, %r3
	.word 0xa77d1c12  ! 715: MOVR_R	movvs	%r20, %r18, %r19
	.word 0xe8008003  ! 716: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe818a090  ! 717: LDD_I	ldd	[%r2 + 0x0090], %r20
	.word 0xe800a040  ! 718: LDUW_I	lduw	[%r2 + 0x0040], %r20
	.word 0xe8708003  ! 719: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa77c8412  ! 720: MOVR_R	move	%r18, %r18, %r19
	.word 0x0cc48002  ! 721: BRGZ	brgz  ,nt	%r18,<label_0x48002>
	.word 0xe8008003  ! 722: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe800a0d0  ! 723: LDUW_I	lduw	[%r2 + 0x00d0], %r20
	.word 0xe4188003  ! 724: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa57ca93a  ! 725: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa614c012  ! 726: OR_R	or 	%r19, %r18, %r19
	.word 0xa97c9412  ! 727: MOVR_R	movcs	%r18, %r18, %r20
	.word 0x2cc48002  ! 728: BRGZ	brgz,a,nt	%r18,<label_0x48002>
	.word 0xa4250013  ! 729: SUB_R	sub 	%r20, %r19, %r18
	.word 0xe400a0e8  ! 730: LDUW_I	lduw	[%r2 + 0x00e8], %r18
	.word 0xe400a0c0  ! 731: LDUW_I	lduw	[%r2 + 0x00c0], %r18
	.word 0xa4250013  ! 732: SUB_R	sub 	%r20, %r19, %r18
	.word 0xa40cc012  ! 733: AND_R	and 	%r19, %r18, %r18
	.word 0xa44c8012  ! 734: MULX_R	mulx 	%r18, %r18, %r18
	.word 0x860020d8  ! 736: ADD_I	add 	%r0, 0x00d8, %r3
	.word 0xa77ceed8  ! 737: MOVR_I	movl	%r19, 0x1, %r19
	.word 0xa97cbe5d  ! 738: MOVR_I	movvs	%r18, 0x1, %r20
	.word 0xa57ca97c  ! 739: MOVR_I	movle	%r18, 0x1, %r18
	.word 0x0cc48003  ! 740: BRGZ	brgz  ,nt	%r18,<label_0x48003>
	.word 0xe418a0d0  ! 741: LDD_I	ldd	[%r2 + 0x00d0], %r18
	.word 0xe4008003  ! 742: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa57cfdf0  ! 743: MOVR_I	movvs	%r19, 0x1, %r18
	.word 0xa57ce4d4  ! 744: MOVR_I	move	%r19, 0x1, %r18
	.word 0xa57cfb80  ! 745: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0xa57cf8f0  ! 746: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0x84006400  ! 748: ADD_I	add 	%r1, 0x0400, %r2
	.word 0xe470a0f0  ! 749: STX_I	stx	%r18, [%r2 + 0x00f0]
	.word 0xa57d0812  ! 750: MOVR_R	movle	%r20, %r18, %r18
	.word 0xa57cc412  ! 751: MOVR_R	move	%r19, %r18, %r18
	.word 0xe4708003  ! 752: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe4188003  ! 753: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xe458a078  ! 754: LDX_I	ldx	[%r2 + 0x0078], %r18
	.word 0x06c48002  ! 755: BRLZ	brlz  ,nt	%r18,<label_0x48002>
	.word 0x0ec50001  ! 756: BRGEZ	brgez  ,nt	%r20,<label_0x50001>
	.word 0xe8008003  ! 757: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa57c8812  ! 758: MOVR_R	movle	%r18, %r18, %r18
	.word 0xe400a080  ! 759: LDUW_I	lduw	[%r2 + 0x0080], %r18
	.word 0xe4588003  ! 760: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe8408003  ! 761: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xe4588003  ! 762: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x84006b00  ! 764: ADD_I	add 	%r1, 0x0b00, %r2
	.word 0xa8048012  ! 765: ADD_R	add 	%r18, %r18, %r20
	.word 0xa77cebb1  ! 766: MOVR_I	movle	%r19, 0x1, %r19
	.word 0x84006b00  ! 768: ADD_I	add 	%r1, 0x0b00, %r2
	.word 0xe840a048  ! 769: LDSW_I	ldsw	[%r2 + 0x0048], %r20
	.word 0xa97c8812  ! 770: MOVR_R	movle	%r18, %r18, %r20
	.word 0xa80c8012  ! 771: AND_R	and 	%r18, %r18, %r20
	.word 0xa77cab1f  ! 772: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa97cd412  ! 773: MOVR_R	movcs	%r19, %r18, %r20
	.word 0x84006900  ! 775: ADD_I	add 	%r1, 0x0900, %r2
	.word 0xe8408003  ! 776: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa4050013  ! 777: ADD_R	add 	%r20, %r19, %r18
	.word 0xa77ca9c9  ! 778: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa77cb8d4  ! 779: MOVR_I	movneg	%r18, 0x1, %r19
	.word 0xa64cc012  ! 780: MULX_R	mulx 	%r19, %r18, %r19
	.word 0xa97cb646  ! 781: MOVR_I	movcs	%r18, 0x1, %r20
	.word 0xe800a040  ! 782: LDUW_I	lduw	[%r2 + 0x0040], %r20
	.word 0xe470a068  ! 783: STX_I	stx	%r18, [%r2 + 0x0068]
	.word 0xe4588003  ! 784: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa97cef73  ! 785: MOVR_I	movl	%r19, 0x1, %r20
	.word 0xe4008003  ! 786: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa44cc012  ! 787: MULX_R	mulx 	%r19, %r18, %r18
	.word 0xa97d2dec  ! 788: MOVR_I	movl	%r20, 0x1, %r20
	.word 0xa44c8012  ! 789: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xa57d0413  ! 790: MOVR_R	move	%r20, %r19, %r18
	.word 0xa97d2b95  ! 791: MOVR_I	movle	%r20, 0x1, %r20
	.word 0xa57d2b16  ! 792: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xe470a038  ! 793: STX_I	stx	%r18, [%r2 + 0x0038]
	.word 0xa97ca790  ! 794: MOVR_I	move	%r18, 0x1, %r20
	.word 0x2ac4c002  ! 795: BRNZ	brnz,a,nt	%r19,<label_0x4c002>
	.word 0xa77ced36  ! 796: MOVR_I	movl	%r19, 0x1, %r19
	.word 0x84006c00  ! 798: ADD_I	add 	%r1, 0x0c00, %r2
	.word 0xa57ca72e  ! 799: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa57cae58  ! 800: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57cc812  ! 801: MOVR_R	movle	%r19, %r18, %r18
	.word 0xa97ca6ec  ! 802: MOVR_I	move	%r18, 0x1, %r20
	.word 0xe8008003  ! 803: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe4588003  ! 804: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe4388003  ! 805: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe8708003  ! 806: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa64cc012  ! 807: MULX_R	mulx 	%r19, %r18, %r19
	.word 0x0acc8002  ! 808: BRNZ	brnz  ,pt	%r18,<label_0xc8002>
	.word 0x06cc8002  ! 809: BRLZ	brlz  ,pt	%r18,<label_0xc8002>
	.word 0xe870a000  ! 810: STX_I	stx	%r20, [%r2 + 0x0000]
	.word 0xe440a008  ! 811: LDSW_I	ldsw	[%r2 + 0x0008], %r18
	.word 0xa77cba35  ! 812: MOVR_I	movneg	%r18, 0x1, %r19
	.word 0x06c50002  ! 813: BRLZ	brlz  ,nt	%r20,<label_0x50002>
	.word 0xa57cbccc  ! 814: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa57ca881  ! 815: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa77cbb31  ! 816: MOVR_I	movneg	%r18, 0x1, %r19
	.word 0xa57cecff  ! 817: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xe4188003  ! 818: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa4250012  ! 819: SUB_R	sub 	%r20, %r18, %r18
	.word 0xe4008003  ! 820: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe4408003  ! 821: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa77cac27  ! 822: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xe400a0f8  ! 823: LDUW_I	lduw	[%r2 + 0x00f8], %r18
	.word 0xe4188003  ! 824: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa824c013  ! 825: SUB_R	sub 	%r19, %r19, %r20
	.word 0xa57ce4fc  ! 826: MOVR_I	move	%r19, 0x1, %r18
	.word 0xa6048012  ! 827: ADD_R	add 	%r18, %r18, %r19
	.word 0xe470a040  ! 828: STX_I	stx	%r18, [%r2 + 0x0040]
	.word 0xe458a0c0  ! 829: LDX_I	ldx	[%r2 + 0x00c0], %r18
	.word 0xe8188003  ! 830: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xa97ca608  ! 831: MOVR_I	move	%r18, 0x1, %r20
	.word 0xe4588003  ! 832: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe458a038  ! 833: LDX_I	ldx	[%r2 + 0x0038], %r18
	.word 0xa404c012  ! 834: ADD_R	add 	%r19, %r18, %r18
	.word 0xa77c8412  ! 835: MOVR_R	move	%r18, %r18, %r19
	.word 0xa97c9812  ! 836: MOVR_R	movneg	%r18, %r18, %r20
	.word 0xa57cc812  ! 837: MOVR_R	movle	%r19, %r18, %r18
	.word 0xe458a020  ! 838: LDX_I	ldx	[%r2 + 0x0020], %r18
	.word 0xa57caab4  ! 839: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa60cc012  ! 840: AND_R	and 	%r19, %r18, %r19
	.word 0x22c4c001  ! 841: BRZ	brz,a,nt	%r19,<label_0x4c001>
	.word 0xa77cd412  ! 842: MOVR_R	movcs	%r19, %r18, %r19
	.word 0xe8588003  ! 843: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe4008003  ! 844: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa8248013  ! 845: SUB_R	sub 	%r18, %r19, %r20
	.word 0xa77c9812  ! 846: MOVR_R	movneg	%r18, %r18, %r19
	.word 0xe8408003  ! 847: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa44cc012  ! 848: MULX_R	mulx 	%r19, %r18, %r18
	.word 0xa77d2cd7  ! 849: MOVR_I	movl	%r20, 0x1, %r19
	.word 0xa57ccc12  ! 850: MOVR_R	movl	%r19, %r18, %r18
	.word 0x24c48003  ! 851: BRLEZ	brlez,a,nt	%r18,<label_0x48003>
	.word 0xa97d2caa  ! 852: MOVR_I	movl	%r20, 0x1, %r20
	.word 0xa77d1c12  ! 853: MOVR_R	movvs	%r20, %r18, %r19
	.word 0x06cd0001  ! 854: BRLZ	brlz  ,pt	%r20,<label_0xd0001>
	.word 0xa614c012  ! 855: OR_R	or 	%r19, %r18, %r19
	.word 0xa64c8012  ! 856: MULX_R	mulx 	%r18, %r18, %r19
	.word 0x02cc8002  ! 857: BRZ	brz  ,pt	%r18,<label_0xc8002>
	.word 0xe8588003  ! 858: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe800a0c0  ! 859: LDUW_I	lduw	[%r2 + 0x00c0], %r20
	.word 0xa77ce570  ! 860: MOVR_I	move	%r19, 0x1, %r19
	.word 0xe400a058  ! 861: LDUW_I	lduw	[%r2 + 0x0058], %r18
	.word 0xe8408003  ! 862: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa57c8412  ! 863: MOVR_R	move	%r18, %r18, %r18
	.word 0xe4708003  ! 864: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa8248013  ! 865: SUB_R	sub 	%r18, %r19, %r20
	.word 0xe4708003  ! 866: STX_R	stx	%r18, [%r2 + %r3]
	.word 0x0ac4c001  ! 867: BRNZ	brnz  ,nt	%r19,<label_0x4c001>
	.word 0xa57d1812  ! 868: MOVR_R	movneg	%r20, %r18, %r18
	.word 0xe8708003  ! 869: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa57cafbc  ! 870: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa77d29b5  ! 871: MOVR_I	movle	%r20, 0x1, %r19
	.word 0xa57ccc13  ! 872: MOVR_R	movl	%r19, %r19, %r18
	.word 0xa77c8413  ! 873: MOVR_R	move	%r18, %r19, %r19
	.word 0xe818a0f0  ! 874: LDD_I	ldd	[%r2 + 0x00f0], %r20
	.word 0xa97c8c12  ! 875: MOVR_R	movl	%r18, %r18, %r20
	.word 0x860020d0  ! 877: ADD_I	add 	%r0, 0x00d0, %r3
	.word 0xa57d2eb9  ! 878: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xe8588003  ! 879: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa77cc812  ! 880: MOVR_R	movle	%r19, %r18, %r19
	.word 0xe400a0c0  ! 881: LDUW_I	lduw	[%r2 + 0x00c0], %r18
	.word 0xe4408003  ! 882: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa97cbdfb  ! 883: MOVR_I	movvs	%r18, 0x1, %r20
	.word 0x84006700  ! 885: ADD_I	add 	%r1, 0x0700, %r2
	.word 0xe4388003  ! 886: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe840a078  ! 887: LDSW_I	ldsw	[%r2 + 0x0078], %r20
	.word 0xe440a028  ! 888: LDSW_I	ldsw	[%r2 + 0x0028], %r18
	.word 0xa57d0c12  ! 889: MOVR_R	movl	%r20, %r18, %r18
	.word 0xe800a058  ! 890: LDUW_I	lduw	[%r2 + 0x0058], %r20
	.word 0xa6048012  ! 891: ADD_R	add 	%r18, %r18, %r19
	.word 0x04c50001  ! 892: BRLEZ	brlez  ,nt	%r20,<label_0x50001>
	.word 0xa614c012  ! 893: OR_R	or 	%r19, %r18, %r19
	.word 0x06cc8002  ! 894: BRLZ	brlz  ,pt	%r18,<label_0xc8002>
	.word 0xa57d0812  ! 895: MOVR_R	movle	%r20, %r18, %r18
	.word 0xa77cd412  ! 896: MOVR_R	movcs	%r19, %r18, %r19
	.word 0xe800a0a8  ! 897: LDUW_I	lduw	[%r2 + 0x00a8], %r20
	.word 0xe4008003  ! 898: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa8050012  ! 899: ADD_R	add 	%r20, %r18, %r20
	.word 0xe470a0b0  ! 900: STX_I	stx	%r18, [%r2 + 0x00b0]
	.word 0xa4148013  ! 901: OR_R	or 	%r18, %r19, %r18
	.word 0x86002058  ! 903: ADD_I	add 	%r0, 0x0058, %r3
	.word 0xa57ced4f  ! 904: MOVR_I	movl	%r19, 0x1, %r18
	.word 0x86002078  ! 906: ADD_I	add 	%r0, 0x0078, %r3
	.word 0xa57c8c12  ! 907: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa57ca5aa  ! 908: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa57c8c12  ! 909: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa44c8012  ! 910: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xe470a070  ! 911: STX_I	stx	%r18, [%r2 + 0x0070]
	.word 0xe400a048  ! 912: LDUW_I	lduw	[%r2 + 0x0048], %r18
	.word 0x84006800  ! 914: ADD_I	add 	%r1, 0x0800, %r2
	.word 0xa424c013  ! 915: SUB_R	sub 	%r19, %r19, %r18
	.word 0xe858a098  ! 916: LDX_I	ldx	[%r2 + 0x0098], %r20
	.word 0xa97cba0b  ! 917: MOVR_I	movneg	%r18, 0x1, %r20
	.word 0xa57ca512  ! 918: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa57cbb6f  ! 919: MOVR_I	movneg	%r18, 0x1, %r18
	.word 0xa57c8812  ! 920: MOVR_R	movle	%r18, %r18, %r18
	.word 0x86002050  ! 922: ADD_I	add 	%r0, 0x0050, %r3
	.word 0xa57ca9ab  ! 923: MOVR_I	movle	%r18, 0x1, %r18
	.word 0x2ec48003  ! 924: BRGEZ	brgez,a,nt	%r18,<label_0x48003>
	.word 0xa97c9812  ! 925: MOVR_R	movneg	%r18, %r18, %r20
	.word 0xa77c8c13  ! 926: MOVR_R	movl	%r18, %r19, %r19
	.word 0x860020f8  ! 928: ADD_I	add 	%r0, 0x00f8, %r3
	.word 0xa77d1c13  ! 929: MOVR_R	movvs	%r20, %r19, %r19
	.word 0xa97d0413  ! 930: MOVR_R	move	%r20, %r19, %r20
	.word 0xa77cd413  ! 931: MOVR_R	movcs	%r19, %r19, %r19
	.word 0xe400a088  ! 932: LDUW_I	lduw	[%r2 + 0x0088], %r18
	.word 0xa57ccc13  ! 933: MOVR_R	movl	%r19, %r19, %r18
	.word 0xa57d3df9  ! 934: MOVR_I	movvs	%r20, 0x1, %r18
	.word 0xa57c9412  ! 935: MOVR_R	movcs	%r18, %r18, %r18
	.word 0xa44d0012  ! 936: MULX_R	mulx 	%r20, %r18, %r18
	.word 0xa57c8812  ! 937: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa77cd412  ! 938: MOVR_R	movcs	%r19, %r18, %r19
	.word 0xa57cac0b  ! 939: MOVR_I	movl	%r18, 0x1, %r18
	.word 0x84006500  ! 941: ADD_I	add 	%r1, 0x0500, %r2
	.word 0xa97c9413  ! 942: MOVR_R	movcs	%r18, %r19, %r20
	.word 0xa57c8813  ! 943: MOVR_R	movle	%r18, %r19, %r18
	.word 0x2cc48001  ! 944: BRGZ	brgz,a,nt	%r18,<label_0x48001>
	.word 0xa8248012  ! 945: SUB_R	sub 	%r18, %r18, %r20
	.word 0xa57c8812  ! 946: MOVR_R	movle	%r18, %r18, %r18
	.word 0xe4008003  ! 947: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe418a0d0  ! 948: LDD_I	ldd	[%r2 + 0x00d0], %r18
	.word 0xa77c9812  ! 949: MOVR_R	movneg	%r18, %r18, %r19
	.word 0xa4248012  ! 950: SUB_R	sub 	%r18, %r18, %r18
	.word 0x0cc48003  ! 951: BRGZ	brgz  ,nt	%r18,<label_0x48003>
	.word 0xa44c8012  ! 952: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xa77c8812  ! 953: MOVR_R	movle	%r18, %r18, %r19
	.word 0xa77ca97a  ! 954: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa57caa7d  ! 955: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa4248012  ! 956: SUB_R	sub 	%r18, %r18, %r18
	.word 0xa57cc412  ! 957: MOVR_R	move	%r19, %r18, %r18
	.word 0xe8588003  ! 958: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe8588003  ! 959: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0x24c48001  ! 960: BRLEZ	brlez,a,nt	%r18,<label_0x48001>
	.word 0xa57c9412  ! 961: MOVR_R	movcs	%r18, %r18, %r18
	.word 0xa97cd813  ! 962: MOVR_R	movneg	%r19, %r19, %r20
	.word 0xa4048012  ! 963: ADD_R	add 	%r18, %r18, %r18
	.word 0xa57c9412  ! 964: MOVR_R	movcs	%r18, %r18, %r18
	.word 0x0accc003  ! 965: BRNZ	brnz  ,pt	%r19,<label_0xcc003>
	.word 0xa77c9812  ! 966: MOVR_R	movneg	%r18, %r18, %r19
	.word 0xa57c8812  ! 967: MOVR_R	movle	%r18, %r18, %r18
	.word 0x24c48002  ! 968: BRLEZ	brlez,a,nt	%r18,<label_0x48002>
	.word 0xa57cc413  ! 969: MOVR_R	move	%r19, %r19, %r18
	.word 0xa77d1c12  ! 970: MOVR_R	movvs	%r20, %r18, %r19
	.word 0xa77ca751  ! 971: MOVR_I	move	%r18, 0x1, %r19
	.word 0xe4408003  ! 972: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe458a040  ! 973: LDX_I	ldx	[%r2 + 0x0040], %r18
	.word 0xa57d2c58  ! 974: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa80d0012  ! 975: AND_R	and 	%r20, %r18, %r20
	.word 0xa77c8413  ! 976: MOVR_R	move	%r18, %r19, %r19
	.word 0xa77ca45f  ! 977: MOVR_I	move	%r18, 0x1, %r19
	.word 0xa57cf457  ! 978: MOVR_I	movcs	%r19, 0x1, %r18
	.word 0xa6250012  ! 979: SUB_R	sub 	%r20, %r18, %r19
	.word 0xe840a020  ! 980: LDSW_I	ldsw	[%r2 + 0x0020], %r20
	.word 0x04c4c001  ! 981: BRLEZ	brlez  ,nt	%r19,<label_0x4c001>
	.word 0xa97cbd31  ! 982: MOVR_I	movvs	%r18, 0x1, %r20
	.word 0xe4408003  ! 983: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa77cfded  ! 984: MOVR_I	movvs	%r19, 0x1, %r19
	.word 0xa77d1812  ! 985: MOVR_R	movneg	%r20, %r18, %r19
	.word 0xe8008003  ! 986: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0x86002048  ! 988: ADD_I	add 	%r0, 0x0048, %r3
	.word 0xa57ccc12  ! 989: MOVR_R	movl	%r19, %r18, %r18
	.word 0xa6048012  ! 990: ADD_R	add 	%r18, %r18, %r19
	.word 0xa40c8012  ! 991: AND_R	and 	%r18, %r18, %r18
	.word 0xe8588003  ! 992: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa97cc413  ! 993: MOVR_R	move	%r19, %r19, %r20
	.word 0xe4008003  ! 994: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0x84006400  ! 996: ADD_I	add 	%r1, 0x0400, %r2
	.word 0xa97d0413  ! 997: MOVR_R	move	%r20, %r19, %r20
	.word 0xa624c013  ! 998: SUB_R	sub 	%r19, %r19, %r19
.data
.align	256
t1_data_start_0:
	.xword	0x6495ca3a0fc2728b
	.xword	0xd028b815fd1e3fbb
	.xword	0x2c73db9c4e08a36a
	.xword	0x1d4f6b8e11cd37ce
	.xword	0xa7bb964969de13df
	.xword	0x1373e58234bf5fca
	.xword	0x6de2ce088d7d33c8
	.xword	0x66edfa87c95ee3ba
	.xword	0x3eb5f1572be222f7
	.xword	0xa24894a04840b015
	.xword	0xb8c07fca75114340
	.xword	0x1a2b1a8f7eff4e77
	.xword	0x459895aecc72241e
	.xword	0x67edabf3436c4f82
	.xword	0xb5d352740278ac3a
	.xword	0x9645d62b34d06c73
	.xword	0xe1bcd521c7362037
	.xword	0x130977ecfe2162ce
	.xword	0x27eb674f94b570af
	.xword	0x55f82fdad5f81f08
	.xword	0x19e7f4893a0fb728
	.xword	0x6be450533bfeedf8
	.xword	0x4addcb482a517ebe
	.xword	0x4fc573ae0f225fab
	.xword	0x07829d5096b3e98c
	.xword	0xaf9d03f5427804a1
	.xword	0x6cc1cab6353014ff
	.xword	0xdabfc510486b1201
	.xword	0xd3c984496d1805cf
	.xword	0xe48a54347ac2cf00
	.xword	0x7653aa57be99d37d
	.xword	0x771c496b65f9c815
	.xword	0x21e0931d8f1e7bb7
	.xword	0x1a598c64d114f628
	.xword	0xda35d5c1fd640dfe
	.xword	0xa7f04ec91f8bb8cb
	.xword	0xc60834f3a5fa9183
	.xword	0x09eb1c6ccb186ef1
	.xword	0x994c5db7b28260f0
	.xword	0x4b10bc55e436ea75
	.xword	0x0f6d3b533e76d516
	.xword	0x1ef00f318333b2dd
	.xword	0xa96255d861566496
	.xword	0x7a8f396cd72e80ac
	.xword	0x304a3a5e4229686b
	.xword	0x7ae04e20f6e36703
	.xword	0x1be4d1a6e64050db
	.xword	0xc0f40c8755c13d42
	.xword	0xd867e01c553e1bcf
	.xword	0x86db5af0a126e9ab
	.xword	0x21fb53ae05f180e9
	.xword	0x7acafd0a7f6bb955
	.xword	0x820bada0e1267e08
	.xword	0x8364fe765bae9a34
	.xword	0x94a8a48aea4f56bf
	.xword	0x984001291237ba57
	.xword	0x826e5711c1e515f0
	.xword	0x497a2901ac2fdd84
	.xword	0x269b83d4b54da4ac
	.xword	0xbcc06fc9c9034d12
	.xword	0x07a1c88dd0d90d32
	.xword	0xcd2df25d832a4e90
	.xword	0x744e3c578329b5ab
	.xword	0x9fb0659db65519f6
	.xword	0x655192d7612156f4
	.xword	0xe30d5b85d7622b85
	.xword	0xc335e303bdc34047
	.xword	0x89e1dec9cbf80cd0
	.xword	0x3b81d521c4ce943c
	.xword	0x14bd0f3fe2f8c5d9
	.xword	0xeb042f0d78a09081
	.xword	0x5721e4a2c4bf17dc
	.xword	0x6dd0aa3d359ec3ca
	.xword	0xd9c27221f8b99962
	.xword	0x51ff29c407183d4f
	.xword	0x74cb8942ffe08734
	.xword	0x6cec7145436d924b
	.xword	0x2c10f5c8b301593b
	.xword	0xf3a4a58d8a93df5d
	.xword	0x9630b99fd191215d
	.xword	0xa1997d56236ffa06
	.xword	0x1e1c500d58a42dd8
	.xword	0xae7811b9dce52a67
	.xword	0x526572b8fc5f2339
	.xword	0xc14b98cbd77f5f8c
	.xword	0x43750898d0803326
	.xword	0x1156a40e6448585e
	.xword	0x50c598b0e60d17dc
	.xword	0x24194b477c15c42c
	.xword	0x557916275070e188
	.xword	0x5fb8552339e5c39a
	.xword	0xfdcecf5d9618c15c
	.xword	0x806bb863dee1c9f8
	.xword	0xa9f39e8af0b76ffc
	.xword	0x9a5045fd0d3513dc
	.xword	0x91831e1c05af95eb
	.xword	0x87e52f943c8d7b52
	.xword	0x1f65018859a63d99
	.xword	0x624a7d62a76ddc46
	.xword	0xbb56a643eafff0dc
	.xword	0xc1da25ec8f32bd92
	.xword	0x909d938111973566
	.xword	0x53f8d0178f8d6cda
	.xword	0xc325e21096f98dd4
	.xword	0xf65868fe90840239
	.xword	0xdf588fa95dbd0044
	.xword	0x223251b68b5e5524
	.xword	0x411da95fbeb61921
	.xword	0xa58850120b10a1bc
	.xword	0x33415953eb5a4fed
	.xword	0x6da53115b9be8592
	.xword	0x6fd597d871d68e27
	.xword	0x4d49ae6b048e0989
	.xword	0x62de5407e6a67c09
	.xword	0xad22593efb8e36a5
	.xword	0x0566ac558ca13440
	.xword	0x2081887ef2687bc6
	.xword	0xba0e737d3ec17016
	.xword	0x8ba2dcdbfa6fa46f
	.xword	0xf73207238b2c44e3
	.xword	0xffcf96b7fa875499
	.xword	0x4f55b6033c6957aa
	.xword	0x42891e4c032d1374
	.xword	0x0aa3aea30a0673d5
	.xword	0x6dcb06a8eb45ead3
	.xword	0xefc9556f7d48670a
	.xword	0x14ef61b00fcbda37
	.xword	0xa272bbe2f9cf2960
	.xword	0x5e4a8233c53088fb
	.xword	0xedbf63367437404e
	.xword	0xbb37d24e4c5542ec
	.xword	0x1f65382bb62a50fe
	.xword	0xde923fd7b9d618f2
	.xword	0xd14485a1cbc0485e
	.xword	0xbbde0420afe31c8d
	.xword	0x5bb6f0f239071f0b
	.xword	0xd17cef788ce2c467
	.xword	0xbe4fca32b72e7e92
	.xword	0x0b8ff8ef169b270e
	.xword	0xfbcc3d8f42651280
	.xword	0x9a4290760060f941
	.xword	0x083b72fe50ebff42
	.xword	0x4921d3294e53b3b2
	.xword	0x92df5c90bf720195
	.xword	0xd3501d47fcf6c1bd
	.xword	0x9df9f584e588f556
	.xword	0x3a4f9955755dea3c
	.xword	0x96c226277e19ad52
	.xword	0x1bfbea5c1a83786b
	.xword	0xf47574f9079f3d22
	.xword	0xcd84311d24cd7021
	.xword	0x07d9f283b2ab626d
	.xword	0x7edd11b7db156d4d
	.xword	0x960ed5bc35b077b1
	.xword	0xf635f3aa9702a808
	.xword	0xe9cfcbf80e244f65
	.xword	0xde2e08acbd5ddbc3
	.xword	0x9637cbd83cd926f6
	.xword	0x6b1bfc8c1b733092
	.xword	0x24ce6f6f93404a21
	.xword	0x589c09e23eb23173
	.xword	0xd592a3c698dff851
	.xword	0x8b08e576c5b8eb5c
	.xword	0xe3250943791281e5
	.xword	0x721832711e16e5d3
	.xword	0xda2ac74b3138f854
	.xword	0xf351d0276c764121
	.xword	0x874d2b4ae9580331
	.xword	0x27b42fc798c8093e
	.xword	0xaab0cfd52349191c
	.xword	0x9c3edb4f600ee3ea
	.xword	0x11df2dc6dc80eff9
	.xword	0xf47f322824161662
	.xword	0x733bc522d86c5bcc
	.xword	0xbf916650a13f5155
	.xword	0x11cf91d132f69dda
	.xword	0x79cd9a2ceea58e06
	.xword	0x783d854f3b02090e
	.xword	0x2fdebb08c7abc284
	.xword	0x3148a2023d30f3ed
	.xword	0x52aed6c59981894d
	.xword	0x345c5d6e232fac3f
	.xword	0xd969b357cae13ee1
	.xword	0x3febf03154666703
	.xword	0x4a6291ca5a94932b
	.xword	0x85354d6421a13e42
	.xword	0x69067eb62514057d
	.xword	0x2a3829b2b41fd51b
	.xword	0x2da3f250aa63f2f6
	.xword	0x33961782f6dda873
	.xword	0x1f1c12d4ff8d2ea0
	.xword	0x959447d31a93d4e1
	.xword	0x9deb21c2efeec34a
	.xword	0x02fe239ba167276c
	.xword	0xb2d626e0ec281810
	.xword	0x14b6f19512732f2a
	.xword	0x3a9939698c3cdd2d
	.xword	0x6546f07287fac372
	.xword	0xfbda1efb8199d62e
	.xword	0xc42ec11a7c1d2831
	.xword	0x6c25a79d40ae94fb
	.xword	0xa2bf3be3083eb996
	.xword	0xc1c475e63608d2e7
	.xword	0xbe46e04598926b19
	.xword	0x4aece666a5d41b39
	.xword	0x9eb2ffa0189f5618
	.xword	0x21015ba509dd5bb0
	.xword	0x41ff3f9f938189cb
	.xword	0x6a59190ab7c69cc6
	.xword	0xe22a06ef139789e2
	.xword	0xc227c1cc89464a38
	.xword	0x4c06666d781af2a3
	.xword	0xb59f808f55e1072f
	.xword	0x20cffec20f013588
	.xword	0x211ba9c1c7cb2a04
	.xword	0x7a459b886c93140d
	.xword	0xc436a34aa36fd12e
	.xword	0xde5b047c26755ef0
	.xword	0x19ba7df58802e68d
	.xword	0x951df5d29948a41d
	.xword	0x579d211da6c14217
	.xword	0x7e347092ce3bbeb5
	.xword	0x6511acb233bca396
	.xword	0x1c5730ee4337819a
	.xword	0x6f5bd55d34db3995
	.xword	0x037b54f11c21ec1a
	.xword	0x37ff4ea1501e2a75
	.xword	0x10d7e25ebc81807b
	.xword	0xcaccfca342023d39
	.xword	0xeea2648d88c6ff15
	.xword	0x1a8d5de65110dd40
	.xword	0x48d863cf308f806f
	.xword	0x4eb3fe016db90dd4
	.xword	0x179d9c9ce985235b
	.xword	0x5be4aaf30869ff26
	.xword	0xe8ee5de6efcf139b
	.xword	0x49998e4e555f86ef
	.xword	0x843eedb4c37fb4f7
	.xword	0x544cb61ea9dcbe86
	.xword	0x7e993b4868b67421
	.xword	0x0c7e01ae0ab36ea7
	.xword	0x43f786984b35ee00
	.xword	0xf4056af041a00a70
	.xword	0x20d090a7cd2f9f27
	.xword	0x60e2ccff098d46c7
	.xword	0xe92215a6706a2b27
	.xword	0xb61285a70876d9ca
	.xword	0x5feafb400e36ad99
	.xword	0xf56a0c9f614629d4
	.xword	0x71c01475d3ce5013
	.xword	0xb010898f71175162
	.xword	0x95db914de2b27702
	.xword	0x5b67c6d8ef04017c
	.xword	0x6373c1bcdbb75b34
	.xword	0xc44d23029c7db16e
	.xword	0x0ad5d176add8a136
	.xword	0x14c8c996fa915d09
	.xword	0xf692175a655eccf8
	.xword	0x8264814899512633
	.xword	0x022166265fafeff4
	.xword	0x0eb5a981292a019c
	.xword	0x1ac17b9dfce1f518
	.xword	0x58bf2ef25a14e362
	.xword	0x9468fe5b09184e66
	.xword	0x6aa587bf5560a4b3
	.xword	0xa4f0ad6cd4d9b2d1
	.xword	0xbff128975af7dde4
	.xword	0xdad85b41b96a5b9c
	.xword	0x24a1e5b035fc2b11
	.xword	0xcac31569f5bb904b
	.xword	0x33f611cc256263fa
	.xword	0x03457473ff897247
	.xword	0x05d18c4d6277d156
	.xword	0xed8d2a3045fac3b5
	.xword	0xec105586d6a8f68a
	.xword	0x7f6783f898d08042
	.xword	0x9c866a3059cda21e
	.xword	0x5d8d997635ebfef1
	.xword	0xf6a3d69a255afd96
	.xword	0xfe9a09e779cfebe9
	.xword	0x9b4a3e52355c5e32
	.xword	0xf95a30b7f6859c95
	.xword	0x19db1e8602be482c
	.xword	0x83eafbd50c241b0d
	.xword	0x738de8cc1d7504fb
	.xword	0x418cbe7b97e0158e
	.xword	0x3761566308aa1488
	.xword	0x72b25657905d31b6
	.xword	0x136ecd31282fc6de
	.xword	0xf796fb918a0b74a6
	.xword	0xbc0877e88eba9853
	.xword	0x6eab6db4a69136b3
	.xword	0x6d4a98dabc5c7b39
	.xword	0x75572a7fb23b5b69
	.xword	0x4ac514417cf0d07b
	.xword	0x043a62552273ed33
	.xword	0x6ed09082951717e6
	.xword	0xd004e81cb32ca293
	.xword	0x9ce8c66e7985ede1
	.xword	0x6e5cfec6dbf18691
	.xword	0x770ef7b6900c93a9
	.xword	0x35a5d8a99236443d
	.xword	0x786664f31523e285
	.xword	0x3fa89b646971ad10
	.xword	0xc3fa397726b6f7d4
	.xword	0x37927c4e3f0eba1b
	.xword	0x65df3f10125ff313
	.xword	0xa6aad15082bb04ad
	.xword	0x453c50983aa56238
	.xword	0xaca712e7cc70bded
	.xword	0xdaf25b4bb0520439
	.xword	0x3832922246dbdf70
	.xword	0xbdabd837044213c8
	.xword	0x0d914115c88293dc
	.xword	0xfed65c25de18144d
	.xword	0x8516fa184f89eca7
	.xword	0x9611d913a4df9d49
	.xword	0xfb6e901b5fdb0ecc
	.xword	0x930b0b3cd0552284
	.xword	0xd794ddb567e754c2
	.xword	0x58a873235eeada11
	.xword	0x00b25c7264500dc1
	.xword	0xa22977b9865dbc8f
	.xword	0xf91429591f2bf204
	.xword	0xe3a5255c1d80b2f8
	.xword	0xb30693e1b329e70a
	.xword	0xfd8e1867f57b34de
	.xword	0x53819c7a1b953b75
	.xword	0xd3ae5c351b88eccd
	.xword	0x84d3827776832d8e
	.xword	0x3ae4fc314087759e
	.xword	0x61b577a4da6567fd
	.xword	0x39a2f816cec207e0
	.xword	0xbc48c7ed2d8a65f1
	.xword	0xb7892c967237f153
	.xword	0xfa33a120f98eec06
	.xword	0xa9d82026aa24c586
	.xword	0xd5884e69fc5951b4
	.xword	0xb2c4e4c13b23fbdb
	.xword	0xaeeec361242b9385
	.xword	0x4e3c49498110e9ac
	.xword	0x19d4e049229ed673
	.xword	0x0a1fd00a48f6dfd4
	.xword	0x60ea3e6a4cf844d9
	.xword	0x46d92c9a2624e740
	.xword	0xf17dcfa177ebbb95
	.xword	0x01fc61d1dd053c63
	.xword	0x5ae977e125f14a8c
	.xword	0x080bd357185edf86
	.xword	0x4db37d40c2509b71
	.xword	0x5453025c297116ca
	.xword	0xd1d177d959da72bc
	.xword	0x8a515cd724e19848
	.xword	0x9a3eb536841cd263
	.xword	0x1f7d2b116ce72a6b
	.xword	0xdcfe023712c52f55
	.xword	0xace547a9ff984124
	.xword	0x42d30f4dd101ee30
	.xword	0x387628ee1755cb94
	.xword	0x80dcf77e4cf984ac
	.xword	0x5f56814fbc56ba11
	.xword	0xf32b30a8a8f2a108
	.xword	0x5d127cfa0281b980
	.xword	0x4575373b21b0a24d
	.xword	0x6a12ef6a50fdbd67
	.xword	0xb2f6d068f220ed75
	.xword	0xa3420ffc576d93a3
	.xword	0x58fd48b7789ae71b
	.xword	0xd733d698a010be4b
	.xword	0x23b5401ade3745c0
	.xword	0x7b12053af9c950c5
	.xword	0xbe81153b13f69b87
	.xword	0x53da313a5d50cc53
	.xword	0x8b07e704184fea4b
	.xword	0xeca7dea0ebd49f46
	.xword	0x04c38a08e8d1e459
	.xword	0xb3b846b0e6a717c0
	.xword	0xeb719f36d5a65c14
	.xword	0x92b94a7923e419e6
	.xword	0x7e9b2b59fba6944b
	.xword	0xdcb92bc59340d639
	.xword	0x782b3dea90bc63b8
	.xword	0xfbaaa6c48f62c5c5
	.xword	0xc8f27a36367d582f
	.xword	0xe12ebdea926a2513
	.xword	0xbf0af7f7fbbff9a7
	.xword	0xd784db6627727fde
	.xword	0x2d07ccae995daf9b
	.xword	0xf2f3731eaa31d57d
	.xword	0xa6cc1d7d4d4b593b
	.xword	0x88e12c899aead716
	.xword	0xfc92a0a35b34f20a
	.xword	0xfb3724d68ee1903a
	.xword	0x54290d4d9915422a
	.xword	0xe49e127cd8bb3439
	.xword	0xa2b0fb6742c2b32f
	.xword	0x1cd6a0309d4643da
	.xword	0x433b3045530c63fe
	.xword	0x6caffb531077d670
	.xword	0xb7787aca88135197
	.xword	0x7d75315b70154210
	.xword	0x179d25d872fecc83
	.xword	0x515c09ab3e398211
	.xword	0x80c7f898a38f5ac1
	.xword	0xf96d6e3db820b045
	.xword	0xb770bacd1bf5984b
	.xword	0xf231da83d7bb1b07
	.xword	0x417ca39a52f86521
	.xword	0x9606daf560bd940d
	.xword	0xdf6ba727e39cea44
	.xword	0x77d73042b5bd7779
	.xword	0x3c91647b07484399
	.xword	0x1f819e32621c6931
	.xword	0xefb8ceeaa260022d
	.xword	0x85c21fe82f9aeb48
	.xword	0x83a05fce25487b56
	.xword	0x371c3db10d454a01
	.xword	0x76850a645783fe2c
	.xword	0xb29b395517a0a771
	.xword	0x2ef8ddf2ea03133a
	.xword	0xbed3fad161bbfa1a
	.xword	0xfbefd35d0d62ff83
	.xword	0x646cd8d5b145a472
	.xword	0x7e61f94ba885825d
	.xword	0x69fa8f018f1a7481
	.xword	0xb52af7e9332fb4e7
	.xword	0x05b2ba28663e3aee
	.xword	0x1040b06eae12366a
	.xword	0xbdc164b5c648f0e3
	.xword	0xbe315ed76804a2aa
	.xword	0xb27deb7d47bb4573
	.xword	0x63f74b20a95ae16f
	.xword	0xc99ad8ff782b6cfd
	.xword	0x3a3b221f6745e992
	.xword	0x9962789c5b1141aa
	.xword	0xef4ccfa155e57082
	.xword	0xfe7e6bd0608b5a50
	.xword	0x555132fb665087a2
	.xword	0x1ce67f9e4241bbe6
	.xword	0x54ebcfdd28886619
	.xword	0x149012effc189193
	.xword	0x1933c8d886d14732
	.xword	0x1749df45dd777b21
	.xword	0x352862014e322931
	.xword	0x76af782a0dba9b98
	.xword	0x7fe17dbf0264fa94
	.xword	0x11cd3a08b52cd9fd
	.xword	0x4f32c0162e355704
	.xword	0x0202bc0c5c84fd13
	.xword	0x7bf1aaa80fbc30e4
	.xword	0x19a46f794978532a
	.xword	0x08122cf747bc1f06
	.xword	0x0ecb0f47fd34c537
	.xword	0x0c33a571fb639058
	.xword	0xa01bcb7c498e9993
	.xword	0xe02e952e7a7a5acf
	.xword	0xa57aac057be42915
	.xword	0xe2162b92004baa25
	.xword	0xe802152c4f9d8365
	.xword	0x3fedd62247208246
	.xword	0x1bcb420b04d1471f
	.xword	0x9e01d55905540144
	.xword	0xb07c282d15dc9a35
	.xword	0x4b6d808fdd66c229
	.xword	0x14ce26f4f0c4e4ce
	.xword	0x5b673a09e2aa27e1
	.xword	0x81951306b460d2cc
	.xword	0x72bfec81f99c00c1
	.xword	0xa2480bfa9d1c8e96
	.xword	0x2b56723d7ae61955
	.xword	0xf117358755e3ce81
	.xword	0x681cb3cae12d1f30
	.xword	0xfa4a40fb92e59fed
	.xword	0xb54953d674a4fcbb
	.xword	0xbbbe56d5150c1427
	.xword	0x121b0b36ca1b4b53
	.xword	0xb1ca8f01b029920f
	.xword	0xe984e65b220d0d0e
	.xword	0xdba85db50ba1dea3
	.xword	0xab42bfc47372a0a4
	.xword	0x55a8ba140c98010e
	.xword	0x6636878b8f2707e7
	.xword	0x740ea2198d2cbabf
	.xword	0xbd22afca3ef90037
	.xword	0x9aa5bc9646fe3e83
	.xword	0x320e3f8b7da2f65e
	.xword	0xa43ad0bf71dba656
	.xword	0x2c823cdf80c7e909
	.xword	0xa094ba270f692c82
	.xword	0x55ad713350cd6cfe
	.xword	0xc2606baefecc42ba
	.xword	0x0deb54cb41f463bc
	.xword	0xf89d7ca7c0f5ec03
	.xword	0xe761a2c65d2f8242
	.xword	0x30f91facf7dcd9c7
	.xword	0xfae7860c7fdf54e6
	.xword	0x19e35d746ab6c27d
	.xword	0x8a0633331c8cc13e
	.xword	0x8551864fea39d3d1
	.xword	0x4742b20cb75bbae4
	.xword	0x7a4ffcfa58eeeaf4
	.xword	0x3626b7f582f16637
	.xword	0x8d338d3a44d6e241
	.xword	0x19a4e3efb0b2d466
	.xword	0x1282958c4952c685
	.xword	0xf6bccd8bbfd25b2f
	.xword	0xa4459da543e6830c
	.xword	0xf28f52c3cbe97023
	.xword	0x2aee280cdff7f436
	.xword	0x8f9c949655fe9ff5
	.xword	0x4c286298f80ce8ed
	.xword	0x857ba4bb5db2014b
	.xword	0x6a57855f9a5e67e2
	.xword	0xb5bf6bf35f4a2908
	.xword	0xd0219a20ceb56a3b
	.xword	0x7957d26d3a7387c3
	.xword	0xad32bf8c8c4cdadd
	.xword	0xc8c3fd76937ebe52
	.xword	0x127e8f3af119e0aa
	.xword	0x0638dd00218af337
	.xword	0xbc4d1a2e5795532b
	.xword	0x6fe287cb2bb24623
	.xword	0x38465bcd2c917618
	.xword	0x5dd4721467694862
	.xword	0xb50774c833ec14f9
	.xword	0x109692c5b281634d
	.xword	0xb68f323dfdf5568d
	.xword	0xf6b8f06847659c5c
	.xword	0x875e3e52b4cfce19
	.xword	0xd39f27f6f6b83d29
	.xword	0x542c02814eff2722
	.xword	0xdbc2e7d0a6770a46
	.xword	0x2e85d6efe8cd4987
	.xword	0xab60113545b6e5e1
	.xword	0xf2114b6852ce4e06
	.xword	0xb8ac789d1db98050
	.xword	0x09587c34ac834cfe
	.xword	0xa4633a95255a429e
	.xword	0xab226b578d36e615
	.xword	0xdde4acd4b3e3a2a9
	.xword	0x586b4da7f1f4f75c
	.xword	0x64fc1acb1790a8fc
	.xword	0x6fa1f538c2937be5
	.xword	0x5fad9a01f3f4ba32
	.xword	0x8e442ddff0816935
	.xword	0x705a9bbf5488237e
	.xword	0xf77e86aac938ea49
	.xword	0x995092af1c6c763a
	.xword	0xd54e208df8cdcbe2
	.xword	0xb39b85e00e8b430a
	.xword	0xd0c23c12b5594060
	.xword	0x6001aaacf9fb8246
	.xword	0xea68cc334527d327
	.xword	0x38b9d37d983702d2
	.xword	0xab34dff66ef68e94
	.xword	0xe6c6f27ed0a3f8d2
	.xword	0xa46f3674c00a7dbd
	.xword	0x315b4e8b0cc8e47b
	.xword	0x750eafcdd72de329
	.xword	0x070d4325bc30f6bc
	.xword	0xaacbfdb9b57d8dc1
	.xword	0x22d0116eceadae66
	.xword	0x6293fb6c2feb1660
	.xword	0xfa431279b4c4dbd2
	.xword	0x5b2ecdf362a2a7b8
	.xword	0xa145ac26c2366a10
	.xword	0x4f93479fe9cbcac1
	.xword	0xc3a5196ae3b1a05d
	.xword	0x33ec4b9c8294fecc
	.xword	0xb0d18575ac35b392
	.xword	0xdd260b5ef48d766b
	.xword	0x4d468494c343b901
	.xword	0x38db9bb4f13b60be
	.xword	0x1db24ec1eef40bb5
	.xword	0xe009474db8ea8cf6
	.xword	0x61a229bcc03db352
	.xword	0xb9c8befcff7bc624
	.xword	0x688d8a5be18626df
	.xword	0xb0c965a0d1fc28ca
	.xword	0x044733dc46a3c793
	.xword	0x53b4431eca164890
	.xword	0xf4b014d2bed70e81
	.xword	0x734b16c399d8f655
	.xword	0x42a426f79b9d1302
	.xword	0xaac7dcc116411000
	.xword	0xcadc806e4647f2a7
	.xword	0xb00b32c1986cc265
	.xword	0x30f5a6ed7bbba37c
	.xword	0x2aef9ce089b165d7
	.xword	0x934bf6f8ecc0a01d
	.xword	0x9ebfb2adf40f272c
	.xword	0xb00189a617fe9853
	.xword	0xd2fde02c3954de7e
	.xword	0xc9129c5e16b1f11c
	.xword	0xdbdf620855791f90
	.xword	0xb80eb2141a90c4b2
	.xword	0xb7a4e56a616b5b3b
	.xword	0x869d4ee1b2e2e657
	.xword	0xbace3d6b300daa82
	.xword	0x8be5b1e10f598e57
	.xword	0x7b525565c8ec2122
	.xword	0xddf86a47c1f75ef4
	.xword	0x0094d4b8235d63cc
	.xword	0x80e1a11d3d3d20f1
	.xword	0xa2751e96dd98e73f
	.xword	0x8793025a1122bc70
	.xword	0xfe319c6e92832e6d
	.xword	0xba0eed7a269d48af
	.xword	0x7f620fc18c276390
	.xword	0x790c5c20c308c239
	.xword	0xfaec4fbc01a9cc50
	.xword	0x3da1da6c96c9385c
	.xword	0xd52972bb8c0593ad
	.xword	0xd7e24636e18724a7
	.xword	0x055e78c341420509
	.xword	0xbc0a1c09bf9b1ef9
	.xword	0xa31dd0e89795d533
	.xword	0x35d2ccd1ed54a309
	.xword	0x1d4b0af31e277809
	.xword	0x949cda49916c5656
	.xword	0x94a55e82a73da676
	.xword	0x7be539ecc9aa612b
	.xword	0xab90897cbde716f8
	.xword	0x5ec420998e74bb8b
	.xword	0x5c48a0784ed246cc
	.xword	0xb955e417ac0b848c
	.xword	0x26aeccdc2636c7f7
	.xword	0x14235a72c3501220
	.xword	0x15d71606233b2f73
	.xword	0x174ae6c22391323c
	.xword	0xd66bbe62145a1c6a
	.xword	0x575226b9c0e2ea6e
	.xword	0x864c486dc72be30e
	.xword	0x5a0f1cc7bd40d98e
	.xword	0x0dc191fb14553655
	.xword	0x1fac1afd58e23c54
	.xword	0x4723c8553a3bff23
	.xword	0x1a606a83774ba882
	.xword	0x38df8c7da9acdad2
	.xword	0x304fe34ba95fe266
	.xword	0x1e8a9c895790bb1b
	.xword	0x9b245c1fdcf97263
	.xword	0xce6336d5fb88e7c8
	.xword	0x84ff3b964554552e
	.xword	0x086477745f5dd578
	.xword	0x685fd9afe51a3019
	.xword	0x68913627f4a8980d
	.xword	0xb3709e275375f4e4
	.xword	0xc0075edd471367f4
	.xword	0x7a682b2425540796
	.xword	0x7af6339b25d1cdb6
	.xword	0xd364d6cdda77cbd7
	.xword	0xd0a9b7b74933634b
	.xword	0x2991f74f88551b3b
	.xword	0x502381bde2010d21
	.xword	0x02175fd9cbdf8ba1
	.xword	0x54ec33b68de6bdd4
	.xword	0x9be8c7ddb62149f8
	.xword	0xcf7067fad014735f
	.xword	0x7b88ea96921b64cf
	.xword	0x777e6b3c8824600c
	.xword	0x13b7aeb55a5edbfc
	.xword	0x81cc698a56f68705
	.xword	0xedd08124a6a7a56c
	.xword	0x2c678d7701814165
	.xword	0x74d34fa5087d2896
	.xword	0x772a987bf11c36b7
	.xword	0xadc8f275ff0b06ad
	.xword	0xd6ee2092ce762774
	.xword	0x45b152a508ac5ab5
	.xword	0xdbde5e5fe1bfa33e
	.xword	0xc9504dd3e203cedc
	.xword	0xdc644e91e7a1dcc2
	.xword	0x1c6ccd63f72abc22
	.xword	0xf4df9aa67dd7a331
	.xword	0x46a192d5291baa5a
	.xword	0x7850678a6ae3ca9f
	.xword	0x4642484f765081e5
	.xword	0x5e320b15fc8d4ca6
	.xword	0x537f14c8fd972f1b
	.xword	0xe5f9e9988f7fb3db
	.xword	0x0db9f7e5e0bdcaf2
	.xword	0xf65ba809a2a1bdf0
	.xword	0x49b420d8a673068f
	.xword	0x1eeb5f05272f2b8e
	.xword	0x8bcbd7dbbe29a8e0
	.xword	0x9d4307f4f4aad0d0
	.xword	0xee134da511e43dad
	.xword	0xe376385a84833123
	.xword	0x4639104eb0be6afe
	.xword	0x501330440ce543c1
	.xword	0x0e8a113dc4c7fc28
	.xword	0x12a2a7bb88e0da58
	.xword	0xc6e9ab7e5e995320
	.xword	0xaada2f9be268ee05
	.xword	0x71254ad5ab649349
	.xword	0xde7789f0e7949e2c
	.xword	0xb7ae788bc3128d08
	.xword	0x785fdb72b71d561e
	.xword	0x71e87ad4711e10a5
	.xword	0x90f2ef2e29dca473
	.xword	0x6d485a2e93bcc724
	.xword	0x0912e7bc5c3e1490
	.xword	0xe4e38222aece935c
	.xword	0x56fd3800ae615262
	.xword	0x3610b5d12b9cb230
	.xword	0x926e64f3b492d984
	.xword	0x75b6c6d939238818
	.xword	0x9f73cfd779f056b9
	.xword	0x5501cf831ff88386
	.xword	0x99f168530ac7391c
	.xword	0xf6f9f169d465e5d0
	.xword	0x4a486bbd08d93df0
	.xword	0x5958480b4c842440
	.xword	0xf2d5b59c21ae1e10
	.xword	0xed9acba55eee442d
	.xword	0xb215f10bcb32f992
	.xword	0xa35203a68242432e
	.xword	0x800dfe5c8a65cafb
	.xword	0x103c853328b9873c
	.xword	0xf030d55b6b4d87f0
	.xword	0x196d3f234c9f5aab
	.xword	0xc0125b385fc0bd7f
	.xword	0xeeae44b3e0fc0aec
	.xword	0x6514e7a8b8214665
	.xword	0x108629e3bffb5cd3
	.xword	0xffe92830b06548b4
	.xword	0x465f5b1a286a1ed4
	.xword	0xa8f7a3993bc3225a
	.xword	0x4895b3810351f9c4
	.xword	0xec1fb2edd867040b
	.xword	0x839cbac58baf17bd
	.xword	0xdfed0850f9e69819
	.xword	0xc41184aea3466806
	.xword	0x24923018faf44e32
	.xword	0x1c2ddcd30c4e1388
	.xword	0x6815cd40872bc40c
	.xword	0xe6ff74b37f576a4a
	.xword	0xe323ee5057ba81ca
	.xword	0x625c1eee81e4c2e1
	.xword	0xb2422d7c95e7e841
	.xword	0x5425a3b713627967
	.xword	0x5650d282995b3944
	.xword	0x662a399697b2505c
	.xword	0x5c7dec56f8f0bb28
	.xword	0xe70cb5670d6d13fc
	.xword	0x76914468c739d734
	.xword	0x5e07bc1a69491546
	.xword	0x95db2243b72c9073
	.xword	0x80de96879b59ba03
	.xword	0xda73210ae01fadb5
	.xword	0x825bc5994962d268
	.xword	0xba2a147934002bb7
	.xword	0xf23e238688ed844b
	.xword	0x48f95b41aa65a8e9
	.xword	0xf715cd333370e0e4
	.xword	0x7fe4c901cd511ae4
	.xword	0x0b940dfe6e4da4d9
	.xword	0x2ae02471f86a54e3
	.xword	0xc07637ea97b5f790
	.xword	0x48829b1c5e4d200b
	.xword	0x85bfdcc9cdfebc5c
	.xword	0xecac68d156836e05
	.xword	0x78660c21a8aff017
	.xword	0x080181237e82567c
	.xword	0xa523fc3e241b14c8
	.xword	0xd7c5af8d2fee050a
	.xword	0x5714e5562dbd5edd
	.xword	0x4f48ade2413ba125
	.xword	0xb936a2ec0ed66054
	.xword	0x0e34137167a00c88
	.xword	0xd422dd2e75461a9c
	.xword	0x45e3ac48e3ca874d
	.xword	0x987602f89807abed
	.xword	0xd41c5eaa0ac0f456
	.xword	0x61572fa8943b2eaf
	.xword	0x8811d93e735e9545
	.xword	0x322e4cc6000c4998
	.xword	0xec8320466319d8d2
	.xword	0x23d1f49b053c2307
	.xword	0x3d325707d05e0d7f
	.xword	0xac32c6cbd2a39e35
	.xword	0x178b2c61ebb588d8
	.xword	0x153fdf9b25c4ff48
	.xword	0x6376fd646e59cd7c
	.xword	0xaa3e811c43e05d7e
	.xword	0x6a2d5c0e704e238b
	.xword	0xb691f32ce31b9fda
	.xword	0x0de5615997a7d29c
	.xword	0xe5dd3d50587eeac9
	.xword	0x596191837a785b29
	.xword	0x8b6074c78121a799
	.xword	0x85af5c31e2cf45f0
	.xword	0xa9dc904acb48855f
	.xword	0x67b4acb3d83416a3
	.xword	0x9e56100e7c7d3379
	.xword	0x88dc61e097589bfc
	.xword	0x953c30f23c9e1f85
	.xword	0x6b3bc5d7a813d2e5
	.xword	0xf2a59b2c0f8e4081
	.xword	0x39f1a3a3476c575c
	.xword	0xef4101e90b3047b1
	.xword	0x5d541bf0bc86c8d3
	.xword	0x1f63978fc0a1c766
	.xword	0x4bddd310db511608
	.xword	0x1f20a83a72d2b6ea
	.xword	0xc4f6a453bff3b404
	.xword	0x329c56a5d7c578c7
	.xword	0x54d0799b331f26cc
	.xword	0xc0d8b45c7b639d7e
	.xword	0xc2370699c35416dc
	.xword	0x9c868278ac617b90
	.xword	0x54078dbc23fe4f27
	.xword	0x531356871df89978
	.xword	0xd38142f999f4a63f
	.xword	0x7c457613f2fa94b9
	.xword	0x0df8f38f66b5b408
	.xword	0x88d5d258ee5f4672
	.xword	0x956d5eb029859b44
	.xword	0xc80ca4a526278f1b
	.xword	0x62906ec8263efe99
	.xword	0x0fc64fa4d41009bb
	.xword	0xef503fd6e70190e0
	.xword	0x0a6db7064cd4a4d0
	.xword	0x5a47288f8bc34104
	.xword	0x0a681521e8e7a78b
	.xword	0x2076af7836add7c1
	.xword	0x7780e4a4f78654a2
	.xword	0x199124f706061289
	.xword	0x9fec8e85ba2510ee
	.xword	0x99b488e959ad526d
	.xword	0x1c3951d5c7ebe4e5
	.xword	0x50e6b081698431f7
	.xword	0xc4e7de3922dd5e25
	.xword	0x01d9e64edcf8ca5e
	.xword	0x934a0f0346fd3768
	.xword	0x5ae5b0bf34b8c14a
	.xword	0x34df92c4e7e2d6da
	.xword	0x34c822cec03fdfa8
	.xword	0x8e1af7ca5c21fd1e
	.xword	0xaf50eae1715292af
	.xword	0x4f4d989778d0513b
	.xword	0x1f66578713f1f722
	.xword	0xde2feda7a4ce4978
	.xword	0x7a70821cf5b12590
	.xword	0x95c0b08553be907c
	.xword	0x6c5d127b851d9f88
	.xword	0x3c6f9a93b19e311c
	.xword	0xaa3918ebc506b0c8
	.xword	0xb6de323a4625786c
	.xword	0xc23b3e87e8346158
	.xword	0xaf1fdf6127e3837a
	.xword	0x1f4302f9b67ad265
	.xword	0x3a2f163565de0d1a
	.xword	0x70b5f48e8b2c9b8b
	.xword	0x63fb715eaeca9721
	.xword	0x0b68c94442be7270
	.xword	0x8c8810ac88cd1434
	.xword	0x2864c1364407463f
	.xword	0x168d7cd55bfcae93
	.xword	0x0ad755be05ee501b
	.xword	0x07de2cb3e5630750
	.xword	0x2276a64881fb2f1e
	.xword	0x214b233f9161e92c
	.xword	0xbace7142570e081b
	.xword	0xb73e1d10e7b0ab3a
	.xword	0x95602c2e769c7c15
	.xword	0x63a2ba53df29961f
	.xword	0x34a498cdd51e2b85
	.xword	0x3715664171915cf1
	.xword	0x743a07975e0813ef
	.xword	0xbf0864c4d02b8cc5
	.xword	0xc6d85294040371b6
	.xword	0x7d9e8f8f7a99799c
	.xword	0x3a68668580ac906a
	.xword	0x6f0b1770a904fca6
	.xword	0xf597dbdffda18321
	.xword	0x90174368be902614
	.xword	0xb90e2799a7f06440
	.xword	0x415095e7d0dffa18
	.xword	0x24abedf73dd4bb6d
	.xword	0x307cb7588252e394
	.xword	0xffc5fba689bf293b
	.xword	0xdc5f312a4d6cc03d
	.xword	0x6bb974b397bd8866
	.xword	0xee573e78f990abe2
	.xword	0x1c179c07646a6865
	.xword	0x1e2cb886d46df63c
	.xword	0xeb1bce94b40c90c8
	.xword	0xa58a37af1771ffba
	.xword	0x6fb5ff1e16f6bd70
	.xword	0x79e1142ad2f65b88
	.xword	0x22deda9f270cca0b
	.xword	0x15c4177dd9b1159a
	.xword	0x447806018bf46ef0
	.xword	0x236ab45e22bb39f3
	.xword	0xea6d0bb40ee2a253
	.xword	0x6f6fa418fdf12813
	.xword	0x1018d72997a833e2
	.xword	0x41e162dc66ea1b95
	.xword	0xeec7fd50cb4eeae2
	.xword	0xf1b57073bf82f912
	.xword	0x22817e50ac07e6d2
	.xword	0x1889292149320a76
	.xword	0x171cbf4917c2cedd
	.xword	0x134cfc4d8012e677
	.xword	0x722aebc4dfba828e
	.xword	0x67e8b1c93e458388
	.xword	0xf85778a48233151f
	.xword	0xa588f0b21c3a5467
	.xword	0xb813152ac76281ff
	.xword	0xeaa48701bf9f0cb3
	.xword	0x01edb0f5824054b2
	.xword	0x141b64ec06011d5f
	.xword	0x678eafbd1b947f50
	.xword	0x026e851000ae6567
	.xword	0x7dc56838b644afdd
	.xword	0x293e48abd37ba983
	.xword	0x7d1406f421931002
	.xword	0xfb0ca8ff759dbad1
	.xword	0xb70ae103cd593d13
	.xword	0x7e8c9bcccda49b0b
	.xword	0x8c74bf9f04f87367
	.xword	0xe9ca5c5060b752f0
	.xword	0xfc68510a54dd3c22
	.xword	0xb27f0a91941d990e
	.xword	0x282d104c5ff6b899
	.xword	0x99ca9b3b6ac0fe48
	.xword	0x5484b82d935a6627
	.xword	0x82fee1246182211c
	.xword	0x530a7c8200f33c8f
	.xword	0x00bf23d62441d5c3
	.xword	0xc2754ea6fed13f37
	.xword	0xda8d2f60480487a3
	.xword	0x1dbd3aeb4a816b83
	.xword	0xf7103f28cab9f527
	.xword	0x16912f71ff2b5223
	.xword	0x42f514242d5ed057
	.xword	0xdc24d4a784a23090
	.xword	0x882005f2f09fe71f
	.xword	0x3f299688bb7dde43
	.xword	0x9a9e66b106214c08
	.xword	0x17be7804ca887409
	.xword	0x54f0eb8c6e37f333
	.xword	0xcbabc1a06393da4a
	.xword	0xdc452213474ac3d6
	.xword	0x92b1add9d9c8cea7
	.xword	0x91813af34816ba5c
	.xword	0x578ea20eca16c658
	.xword	0x1b09f281065dcd6b
	.xword	0x0ecff25a19ebaa7b
	.xword	0x12b58695174765a4
	.xword	0x73de2aa57636af90
	.xword	0x5ff63edf4f1d2b51
	.xword	0x55a8a413d8b1d334
	.xword	0x4db87c0fa24f7960
	.xword	0x8a6c3b7d977bfe89
	.xword	0x20aa2c87fec58148
	.xword	0x5aaaa65337872519
	.xword	0x72629c69447c2ab4
	.xword	0xb5733f435491ef5e
	.xword	0x8f19b1c5ebb03d6b
	.xword	0x4cb5e49f48399d92
	.xword	0x837ba51afa8ed4c1
	.xword	0x08caa1215789fa00
	.xword	0xaa27425d7c09df9b
	.xword	0xcadfc63c03f1d6df
	.xword	0x18195b3ce628e60b
	.xword	0xc876ea027a7995e2
	.xword	0x4f6d2d23f4a4edf2
	.xword	0xc768a8ab5f0d6ca2
	.xword	0x1d449b0f51ab7d5a
	.xword	0xdc86910cd5057bf4
	.xword	0x3fa31f9f257d817d
	.xword	0x63dde51e6200e7ae
	.xword	0x4421e45fa68f55b2
	.xword	0xa7a1edf0ada18b29
	.xword	0x4b6df45b31238fa5
	.xword	0x794d6abb8a0933ea
	.xword	0x249cc2ce010fe987
	.xword	0x2df2874a009d1067
	.xword	0xe1131bd80d973dbe
	.xword	0x0e9271adab9e095a
	.xword	0xc759cb8135fc671e
	.xword	0x20c3bc1aac50ac54
	.xword	0x204130caed308290
	.xword	0x6e780be15ded2b88
	.xword	0x584e11fd90e62365
	.xword	0xdaac0f50b2479a28
	.xword	0xc70bc8bceb0b5aa9
	.xword	0x84ccce9b94ab4636
	.xword	0xddbc291f97d75dfc
	.xword	0x99f82d1ab6267a9a
	.xword	0x67a4c95cc076a771
	.xword	0x4f0ba8d76f4c0565
	.xword	0x3c3279b4a91620a6
	.xword	0x60092b784250dcf2
	.xword	0x48192d05cbed6aee
	.xword	0x016804ce5b9dbc48
	.xword	0xe48139ac663f3459
	.xword	0xfa1ebe97fd8a4d42
	.xword	0xedc41a2771c5d05b
	.xword	0x02219e3e6ebd3439
	.xword	0x6572b205be680de0
	.xword	0xd2908b7db09ff8bc
	.xword	0x384b1a7bd31aa82d
	.xword	0x33c25555e18110d9
	.xword	0xf8ee4c66cfa09e2b
	.xword	0x8563f963e53a012f
	.xword	0x1dc441692f5a7153
	.xword	0x560e7bf3d046b5e0
	.xword	0x4924ac179813ec6c
	.xword	0xb3ade151794feedd
	.xword	0xf63e02928f3fbbc0
	.xword	0xbaa4fc19502990b6
	.xword	0xd462fe6d7d69e87f
	.xword	0xd801bb2422a99d35
	.xword	0x93f11a0f23b21647
	.xword	0x6e633193ff0ab14c
	.xword	0x27fa57e898467b95
	.xword	0xc788d1fa3057be24
	.xword	0xb3ff942d3327db46
	.xword	0xb919e48b13e5122a
	.xword	0x8853d2eb6bfa95ef
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx	t0_data_start_0,%g0, %r1
	add	%r1,0,%r2
	add	%g0,0,%r3
	.word 0xa57caf6f  ! 1: MOVR_I	movl	%r18, 0x1, %r18
	.word 0x2ac48001  ! 2: BRNZ	brnz,a,nt	%r18,<label_0x48001>
	.word 0xe4588003  ! 3: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe4588003  ! 4: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57ce86e  ! 5: MOVR_I	movle	%r19, 0x1, %r18
	.word 0x26c50002  ! 6: BRLZ	brlz,a,nt	%r20,<label_0x50002>
	.word 0xe8708003  ! 7: STX_R	stx	%r20, [%r2 + %r3]
	.word 0x0acc8003  ! 8: BRNZ	brnz  ,pt	%r18,<label_0xc8003>
	.word 0xe458a088  ! 9: LDX_I	ldx	[%r2 + 0x0088], %r18
	.word 0xa97cebed  ! 10: MOVR_I	movle	%r19, 0x1, %r20
	.word 0xe800a048  ! 11: LDUW_I	lduw	[%r2 + 0x0048], %r20
	.word 0xa77d0c12  ! 12: MOVR_R	movl	%r20, %r18, %r19
	.word 0xe4008003  ! 13: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa77cbc5b  ! 14: MOVR_I	movvs	%r18, 0x1, %r19
	.word 0xa97c8413  ! 15: MOVR_R	move	%r18, %r19, %r20
	.word 0xe4388003  ! 16: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa40cc012  ! 17: AND_R	and 	%r19, %r18, %r18
	.word 0xa40c8012  ! 18: AND_R	and 	%r18, %r18, %r18
	.word 0xe4708003  ! 19: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa57d2a84  ! 20: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xa64c8012  ! 21: MULX_R	mulx 	%r18, %r18, %r19
	.word 0xa77d0812  ! 22: MOVR_R	movle	%r20, %r18, %r19
	.word 0xa97cb546  ! 23: MOVR_I	movcs	%r18, 0x1, %r20
	.word 0xa57cad45  ! 24: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xe4188003  ! 25: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa97ccc12  ! 26: MOVR_R	movl	%r19, %r18, %r20
	.word 0xa44c8012  ! 27: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xa97c8812  ! 28: MOVR_R	movle	%r18, %r18, %r20
	.word 0xa57d1812  ! 29: MOVR_R	movneg	%r20, %r18, %r18
	.word 0xa6148012  ! 30: OR_R	or 	%r18, %r18, %r19
	.word 0xe8708003  ! 31: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa80c8012  ! 32: AND_R	and 	%r18, %r18, %r20
	.word 0xa57ca607  ! 33: MOVR_I	move	%r18, 0x1, %r18
	.word 0x22cc8001  ! 34: BRZ	brz,a,pt	%r18,<label_0xc8001>
	.word 0xe8388003  ! 35: STD_R	std	%r20, [%r2 + %r3]
	.word 0xa40c8012  ! 36: AND_R	and 	%r18, %r18, %r18
	.word 0x2ec48002  ! 37: BRGEZ	brgez,a,nt	%r18,<label_0x48002>
	.word 0xa57d26a5  ! 38: MOVR_I	move	%r20, 0x1, %r18
	.word 0xa60cc012  ! 39: AND_R	and 	%r19, %r18, %r19
	.word 0xa44c8012  ! 40: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xe870a0e0  ! 41: STX_I	stx	%r20, [%r2 + 0x00e0]
	.word 0xe8588003  ! 42: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe870a030  ! 43: STX_I	stx	%r20, [%r2 + 0x0030]
	.word 0xe470a068  ! 44: STX_I	stx	%r18, [%r2 + 0x0068]
	.word 0xe8408003  ! 45: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa77caa34  ! 46: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa77ca9b1  ! 47: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa84c8012  ! 48: MULX_R	mulx 	%r18, %r18, %r20
	.word 0xe470a010  ! 49: STX_I	stx	%r18, [%r2 + 0x0010]
	.word 0xe440a018  ! 50: LDSW_I	ldsw	[%r2 + 0x0018], %r18
	.word 0xe870a090  ! 51: STX_I	stx	%r20, [%r2 + 0x0090]
	.word 0x0cccc003  ! 52: BRGZ	brgz  ,pt	%r19,<label_0xcc003>
	.word 0xe800a0b8  ! 53: LDUW_I	lduw	[%r2 + 0x00b8], %r20
	.word 0xe8588003  ! 54: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0x860020c8  ! 56: ADD_I	add 	%r0, 0x00c8, %r3
	.word 0xa57ceaef  ! 57: MOVR_I	movle	%r19, 0x1, %r18
	.word 0x04c50002  ! 58: BRLEZ	brlez  ,nt	%r20,<label_0x50002>
	.word 0xa57ce8c4  ! 59: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa57c9813  ! 60: MOVR_R	movneg	%r18, %r19, %r18
	.word 0xa57ca4fe  ! 61: MOVR_I	move	%r18, 0x1, %r18
	.word 0x04cd0003  ! 62: BRLEZ	brlez  ,pt	%r20,<label_0xd0003>
	.word 0xe4008003  ! 63: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe4388003  ! 64: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa6048012  ! 65: ADD_R	add 	%r18, %r18, %r19
	.word 0xa8048013  ! 66: ADD_R	add 	%r18, %r19, %r20
	.word 0xa4048012  ! 67: ADD_R	add 	%r18, %r18, %r18
	.word 0xa57cdc12  ! 68: MOVR_R	movvs	%r19, %r18, %r18
	.word 0xa57cd413  ! 69: MOVR_R	movcs	%r19, %r19, %r18
	.word 0x0ac50003  ! 70: BRNZ	brnz  ,nt	%r20,<label_0x50003>
	.word 0x0cc48001  ! 71: BRGZ	brgz  ,nt	%r18,<label_0x48001>
	.word 0x860020b0  ! 73: ADD_I	add 	%r0, 0x00b0, %r3
	.word 0xe458a098  ! 74: LDX_I	ldx	[%r2 + 0x0098], %r18
	.word 0xa414c012  ! 75: OR_R	or 	%r19, %r18, %r18
	.word 0xe4388003  ! 76: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe8188003  ! 77: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xe418a078  ! 78: LDD_I	ldd	[%r2 + 0x0078], %r18
	.word 0x0ac4c001  ! 79: BRNZ	brnz  ,nt	%r19,<label_0x4c001>
	.word 0xa77d1c13  ! 80: MOVR_R	movvs	%r20, %r19, %r19
	.word 0xa6048012  ! 81: ADD_R	add 	%r18, %r18, %r19
	.word 0xa57ce9c7  ! 82: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa57d1412  ! 83: MOVR_R	movcs	%r20, %r18, %r18
	.word 0xa8050013  ! 84: ADD_R	add 	%r20, %r19, %r20
	.word 0xe840a028  ! 85: LDSW_I	ldsw	[%r2 + 0x0028], %r20
	.word 0xa84c8012  ! 86: MULX_R	mulx 	%r18, %r18, %r20
	.word 0xe8708003  ! 87: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xe800a090  ! 88: LDUW_I	lduw	[%r2 + 0x0090], %r20
	.word 0xa57cfd41  ! 89: MOVR_I	movvs	%r19, 0x1, %r18
	.word 0xa57c9c12  ! 90: MOVR_R	movvs	%r18, %r18, %r18
	.word 0xa77cba5c  ! 91: MOVR_I	movneg	%r18, 0x1, %r19
	.word 0xa77d0412  ! 92: MOVR_R	move	%r20, %r18, %r19
	.word 0xa97cb763  ! 93: MOVR_I	movcs	%r18, 0x1, %r20
	.word 0xa57cb5a8  ! 94: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xa57c8412  ! 95: MOVR_R	move	%r18, %r18, %r18
	.word 0xe4588003  ! 96: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa97c8c12  ! 97: MOVR_R	movl	%r18, %r18, %r20
	.word 0xe440a0d0  ! 98: LDSW_I	ldsw	[%r2 + 0x00d0], %r18
	.word 0x84006e00  ! 100: ADD_I	add 	%r1, 0x0e00, %r2
	.word 0xa57caef5  ! 101: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xe440a018  ! 102: LDSW_I	ldsw	[%r2 + 0x0018], %r18
	.word 0xe470a000  ! 103: STX_I	stx	%r18, [%r2 + 0x0000]
	.word 0xa77ceb30  ! 104: MOVR_I	movle	%r19, 0x1, %r19
	.word 0xa8150013  ! 105: OR_R	or 	%r20, %r19, %r20
	.word 0xa97ccc12  ! 106: MOVR_R	movl	%r19, %r18, %r20
	.word 0x06c48001  ! 107: BRLZ	brlz  ,nt	%r18,<label_0x48001>
	.word 0xe470a0a8  ! 108: STX_I	stx	%r18, [%r2 + 0x00a8]
	.word 0xe8588003  ! 109: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa97c8812  ! 110: MOVR_R	movle	%r18, %r18, %r20
	.word 0xa77d0c12  ! 111: MOVR_R	movl	%r20, %r18, %r19
	.word 0xa57c8412  ! 112: MOVR_R	move	%r18, %r18, %r18
	.word 0xa77d0813  ! 113: MOVR_R	movle	%r20, %r19, %r19
	.word 0xa57cecfd  ! 114: MOVR_I	movl	%r19, 0x1, %r18
	.word 0x06c50003  ! 115: BRLZ	brlz  ,nt	%r20,<label_0x50003>
	.word 0xa57cc412  ! 116: MOVR_R	move	%r19, %r18, %r18
	.word 0xa8148013  ! 117: OR_R	or 	%r18, %r19, %r20
	.word 0xa77c8c13  ! 118: MOVR_R	movl	%r18, %r19, %r19
	.word 0xa40cc012  ! 119: AND_R	and 	%r19, %r18, %r18
	.word 0xa60c8012  ! 120: AND_R	and 	%r18, %r18, %r19
	.word 0xa77c8c12  ! 121: MOVR_R	movl	%r18, %r18, %r19
	.word 0xe4408003  ! 122: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa77ceebc  ! 123: MOVR_I	movl	%r19, 0x1, %r19
	.word 0xa77c8c13  ! 124: MOVR_R	movl	%r18, %r19, %r19
	.word 0xa57ce833  ! 125: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xe418a088  ! 126: LDD_I	ldd	[%r2 + 0x0088], %r18
	.word 0xa77ce6aa  ! 127: MOVR_I	move	%r19, 0x1, %r19
	.word 0xe4708003  ! 128: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe840a058  ! 129: LDSW_I	ldsw	[%r2 + 0x0058], %r20
	.word 0xa57cc812  ! 130: MOVR_R	movle	%r19, %r18, %r18
	.word 0xa77cd812  ! 131: MOVR_R	movneg	%r19, %r18, %r19
	.word 0xa77c8413  ! 132: MOVR_R	move	%r18, %r19, %r19
	.word 0xe400a048  ! 133: LDUW_I	lduw	[%r2 + 0x0048], %r18
	.word 0xe818a038  ! 134: LDD_I	ldd	[%r2 + 0x0038], %r20
	.word 0xa57c8412  ! 135: MOVR_R	move	%r18, %r18, %r18
	.word 0xa4250013  ! 136: SUB_R	sub 	%r20, %r19, %r18
	.word 0xa97c9c12  ! 137: MOVR_R	movvs	%r18, %r18, %r20
	.word 0xa77d0412  ! 138: MOVR_R	move	%r20, %r18, %r19
	.word 0xa77cae3c  ! 139: MOVR_I	movl	%r18, 0x1, %r19
	.word 0x860020f8  ! 141: ADD_I	add 	%r0, 0x00f8, %r3
	.word 0xa97d0812  ! 142: MOVR_R	movle	%r20, %r18, %r20
	.word 0x86002098  ! 144: ADD_I	add 	%r0, 0x0098, %r3
	.word 0xa77c8c12  ! 145: MOVR_R	movl	%r18, %r18, %r19
	.word 0xa97ca4f8  ! 146: MOVR_I	move	%r18, 0x1, %r20
	.word 0xe4008003  ! 147: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0x2ec4c002  ! 148: BRGEZ	brgez,a,nt	%r19,<label_0x4c002>
	.word 0xe4588003  ! 149: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57c8412  ! 150: MOVR_R	move	%r18, %r18, %r18
	.word 0xe8188003  ! 151: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xe840a098  ! 152: LDSW_I	ldsw	[%r2 + 0x0098], %r20
	.word 0x86002048  ! 154: ADD_I	add 	%r0, 0x0048, %r3
	.word 0xe870a0b0  ! 155: STX_I	stx	%r20, [%r2 + 0x00b0]
	.word 0xe4008003  ! 156: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa57cafa4  ! 157: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xe440a048  ! 158: LDSW_I	ldsw	[%r2 + 0x0048], %r18
	.word 0xa57ca604  ! 159: MOVR_I	move	%r18, 0x1, %r18
	.word 0xe4388003  ! 160: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa97cae7b  ! 161: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa97ccc13  ! 162: MOVR_R	movl	%r19, %r19, %r20
	.word 0xa97cd812  ! 163: MOVR_R	movneg	%r19, %r18, %r20
	.word 0xe470a0e8  ! 164: STX_I	stx	%r18, [%r2 + 0x00e8]
	.word 0xa57cad19  ! 165: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa97c8c12  ! 166: MOVR_R	movl	%r18, %r18, %r20
	.word 0x2ec48003  ! 167: BRGEZ	brgez,a,nt	%r18,<label_0x48003>
	.word 0xa97d3d38  ! 168: MOVR_I	movvs	%r20, 0x1, %r20
	.word 0xe440a068  ! 169: LDSW_I	ldsw	[%r2 + 0x0068], %r18
	.word 0xa97d1c13  ! 170: MOVR_R	movvs	%r20, %r19, %r20
	.word 0xa57caa25  ! 171: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa8250012  ! 172: SUB_R	sub 	%r20, %r18, %r20
	.word 0xe440a098  ! 173: LDSW_I	ldsw	[%r2 + 0x0098], %r18
	.word 0x24c48002  ! 174: BRLEZ	brlez,a,nt	%r18,<label_0x48002>
	.word 0xe840a048  ! 175: LDSW_I	ldsw	[%r2 + 0x0048], %r20
	.word 0xa57c8c12  ! 176: MOVR_R	movl	%r18, %r18, %r18
	.word 0xe4708003  ! 177: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa57ceca2  ! 178: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xe418a060  ! 179: LDD_I	ldd	[%r2 + 0x0060], %r18
	.word 0xa57ca45a  ! 180: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa57d282d  ! 181: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xa57cd413  ! 182: MOVR_R	movcs	%r19, %r19, %r18
	.word 0xa77d2f9e  ! 183: MOVR_I	movl	%r20, 0x1, %r19
	.word 0xa57c8812  ! 184: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa97caa8b  ! 185: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa4150012  ! 186: OR_R	or 	%r20, %r18, %r18
	.word 0xa8148012  ! 187: OR_R	or 	%r18, %r18, %r20
	.word 0xa57cb42b  ! 188: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xa97cd413  ! 189: MOVR_R	movcs	%r19, %r19, %r20
	.word 0xa97cb611  ! 190: MOVR_I	movcs	%r18, 0x1, %r20
	.word 0xe870a0b0  ! 191: STX_I	stx	%r20, [%r2 + 0x00b0]
	.word 0xa60cc013  ! 192: AND_R	and 	%r19, %r19, %r19
	.word 0xa77cac60  ! 193: MOVR_I	movl	%r18, 0x1, %r19
	.word 0x860020d0  ! 195: ADD_I	add 	%r0, 0x00d0, %r3
	.word 0xa97c9812  ! 196: MOVR_R	movneg	%r18, %r18, %r20
	.word 0xa97d34e5  ! 197: MOVR_I	movcs	%r20, 0x1, %r20
	.word 0xa57c9c12  ! 198: MOVR_R	movvs	%r18, %r18, %r18
	.word 0x2cc50001  ! 199: BRGZ	brgz,a,nt	%r20,<label_0x50001>
	.word 0xa44c8013  ! 200: MULX_R	mulx 	%r18, %r19, %r18
	.word 0xe818a0d0  ! 201: LDD_I	ldd	[%r2 + 0x00d0], %r20
	.word 0xa57c8812  ! 202: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa57c8812  ! 203: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa44c8012  ! 204: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xa97d1c12  ! 205: MOVR_R	movvs	%r20, %r18, %r20
	.word 0xa77cd412  ! 206: MOVR_R	movcs	%r19, %r18, %r19
	.word 0xe8588003  ! 207: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa77c8c13  ! 208: MOVR_R	movl	%r18, %r19, %r19
	.word 0xa97d2620  ! 209: MOVR_I	move	%r20, 0x1, %r20
	.word 0xa57cef38  ! 210: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xa57cb973  ! 211: MOVR_I	movneg	%r18, 0x1, %r18
	.word 0x2ec48001  ! 212: BRGEZ	brgez,a,nt	%r18,<label_0x48001>
	.word 0xe470a0e8  ! 213: STX_I	stx	%r18, [%r2 + 0x00e8]
	.word 0xa424c013  ! 214: SUB_R	sub 	%r19, %r19, %r18
	.word 0xe4008003  ! 215: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa424c013  ! 216: SUB_R	sub 	%r19, %r19, %r18
	.word 0xa57cc412  ! 217: MOVR_R	move	%r19, %r18, %r18
	.word 0xe8588003  ! 218: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe400a070  ! 219: LDUW_I	lduw	[%r2 + 0x0070], %r18
	.word 0xa8248012  ! 220: SUB_R	sub 	%r18, %r18, %r20
	.word 0xa97cf590  ! 221: MOVR_I	movcs	%r19, 0x1, %r20
	.word 0xa77c9412  ! 222: MOVR_R	movcs	%r18, %r18, %r19
	.word 0xe4588003  ! 223: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57d3b3f  ! 224: MOVR_I	movneg	%r20, 0x1, %r18
	.word 0x84006d00  ! 226: ADD_I	add 	%r1, 0x0d00, %r2
	.word 0xe818a0f0  ! 227: LDD_I	ldd	[%r2 + 0x00f0], %r20
	.word 0xa57c9412  ! 228: MOVR_R	movcs	%r18, %r18, %r18
	.word 0x06c4c003  ! 229: BRLZ	brlz  ,nt	%r19,<label_0x4c003>
	.word 0xa84cc012  ! 230: MULX_R	mulx 	%r19, %r18, %r20
	.word 0xa57c8413  ! 231: MOVR_R	move	%r18, %r19, %r18
	.word 0xa57caa6d  ! 232: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa6048012  ! 233: ADD_R	add 	%r18, %r18, %r19
	.word 0x06c50001  ! 234: BRLZ	brlz  ,nt	%r20,<label_0x50001>
	.word 0xa40c8013  ! 235: AND_R	and 	%r18, %r19, %r18
	.word 0xa57d36e9  ! 236: MOVR_I	movcs	%r20, 0x1, %r18
	.word 0xa57d2e60  ! 237: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa57c8812  ! 238: MOVR_R	movle	%r18, %r18, %r18
	.word 0x860020e0  ! 240: ADD_I	add 	%r0, 0x00e0, %r3
	.word 0xe4408003  ! 241: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0x84006000  ! 243: ADD_I	add 	%r1, 0x0000, %r2
	.word 0xa97cabdb  ! 244: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xe458a098  ! 245: LDX_I	ldx	[%r2 + 0x0098], %r18
	.word 0xa57c9412  ! 246: MOVR_R	movcs	%r18, %r18, %r18
	.word 0xa57cd812  ! 247: MOVR_R	movneg	%r19, %r18, %r18
	.word 0xe400a0e0  ! 248: LDUW_I	lduw	[%r2 + 0x00e0], %r18
	.word 0x0ec50001  ! 249: BRGEZ	brgez  ,nt	%r20,<label_0x50001>
	.word 0xa57c8813  ! 250: MOVR_R	movle	%r18, %r19, %r18
	.word 0xa77d2754  ! 251: MOVR_I	move	%r20, 0x1, %r19
	.word 0xa97d2781  ! 252: MOVR_I	move	%r20, 0x1, %r20
	.word 0x86002080  ! 254: ADD_I	add 	%r0, 0x0080, %r3
	.word 0xe840a0c0  ! 255: LDSW_I	ldsw	[%r2 + 0x00c0], %r20
	.word 0xe400a028  ! 256: LDUW_I	lduw	[%r2 + 0x0028], %r18
	.word 0x26ccc002  ! 257: BRLZ	brlz,a,pt	%r19,<label_0xcc002>
	.word 0xa77d0812  ! 258: MOVR_R	movle	%r20, %r18, %r19
	.word 0xa57d2c16  ! 259: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xe400a010  ! 260: LDUW_I	lduw	[%r2 + 0x0010], %r18
	.word 0x0cc48001  ! 261: BRGZ	brgz  ,nt	%r18,<label_0x48001>
	.word 0xa4248012  ! 262: SUB_R	sub 	%r18, %r18, %r18
	.word 0xa57d2662  ! 263: MOVR_I	move	%r20, 0x1, %r18
	.word 0xe8188003  ! 264: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xe8408003  ! 265: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xe418a038  ! 266: LDD_I	ldd	[%r2 + 0x0038], %r18
	.word 0xe8188003  ! 267: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xe418a0b8  ! 268: LDD_I	ldd	[%r2 + 0x00b8], %r18
	.word 0xa57d3cb1  ! 269: MOVR_I	movvs	%r20, 0x1, %r18
	.word 0xe4408003  ! 270: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe470a0c0  ! 271: STX_I	stx	%r18, [%r2 + 0x00c0]
	.word 0xe458a098  ! 272: LDX_I	ldx	[%r2 + 0x0098], %r18
	.word 0xa77ca4c7  ! 273: MOVR_I	move	%r18, 0x1, %r19
	.word 0xa77c9412  ! 274: MOVR_R	movcs	%r18, %r18, %r19
	.word 0xa97cf9f0  ! 275: MOVR_I	movneg	%r19, 0x1, %r20
	.word 0xa57c8c13  ! 276: MOVR_R	movl	%r18, %r19, %r18
	.word 0xe4708003  ! 277: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa57caeab  ! 278: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57d2c9f  ! 279: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xe8708003  ! 280: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa57c8412  ! 281: MOVR_R	move	%r18, %r18, %r18
	.word 0xe440a060  ! 282: LDSW_I	ldsw	[%r2 + 0x0060], %r18
	.word 0x0ec50003  ! 283: BRGEZ	brgez  ,nt	%r20,<label_0x50003>
	.word 0xa8048012  ! 284: ADD_R	add 	%r18, %r18, %r20
	.word 0xa97c9412  ! 285: MOVR_R	movcs	%r18, %r18, %r20
	.word 0xa6248012  ! 286: SUB_R	sub 	%r18, %r18, %r19
	.word 0xa77c8c12  ! 287: MOVR_R	movl	%r18, %r18, %r19
	.word 0xa97cd813  ! 288: MOVR_R	movneg	%r19, %r19, %r20
	.word 0xe458a0b0  ! 289: LDX_I	ldx	[%r2 + 0x00b0], %r18
	.word 0xa57d2857  ! 290: MOVR_I	movle	%r20, 0x1, %r18
	.word 0x86002018  ! 292: ADD_I	add 	%r0, 0x0018, %r3
	.word 0xa77d2765  ! 293: MOVR_I	move	%r20, 0x1, %r19
	.word 0x0cccc002  ! 294: BRGZ	brgz  ,pt	%r19,<label_0xcc002>
	.word 0xa40d0012  ! 295: AND_R	and 	%r20, %r18, %r18
	.word 0xa8250012  ! 296: SUB_R	sub 	%r20, %r18, %r20
	.word 0x86002038  ! 298: ADD_I	add 	%r0, 0x0038, %r3
	.word 0x24c4c001  ! 299: BRLEZ	brlez,a,nt	%r19,<label_0x4c001>
	.word 0x0acc8003  ! 300: BRNZ	brnz  ,pt	%r18,<label_0xc8003>
	.word 0xe400a018  ! 301: LDUW_I	lduw	[%r2 + 0x0018], %r18
	.word 0xe840a028  ! 302: LDSW_I	ldsw	[%r2 + 0x0028], %r20
	.word 0xa97c8813  ! 303: MOVR_R	movle	%r18, %r19, %r20
	.word 0xe858a098  ! 304: LDX_I	ldx	[%r2 + 0x0098], %r20
	.word 0xa57ccc13  ! 305: MOVR_R	movl	%r19, %r19, %r18
	.word 0xa57ccc12  ! 306: MOVR_R	movl	%r19, %r18, %r18
	.word 0xe8008003  ! 307: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa57c8813  ! 308: MOVR_R	movle	%r18, %r19, %r18
	.word 0xa57cd412  ! 309: MOVR_R	movcs	%r19, %r18, %r18
	.word 0xa8048012  ! 310: ADD_R	add 	%r18, %r18, %r20
	.word 0x06cd0003  ! 311: BRLZ	brlz  ,pt	%r20,<label_0xd0003>
	.word 0x22c4c001  ! 312: BRZ	brz,a,nt	%r19,<label_0x4c001>
	.word 0xa57c8c13  ! 313: MOVR_R	movl	%r18, %r19, %r18
	.word 0xa97ce826  ! 314: MOVR_I	movle	%r19, 0x1, %r20
	.word 0xa77c8813  ! 315: MOVR_R	movle	%r18, %r19, %r19
	.word 0x06c50002  ! 316: BRLZ	brlz  ,nt	%r20,<label_0x50002>
	.word 0xe458a040  ! 317: LDX_I	ldx	[%r2 + 0x0040], %r18
	.word 0xa60c8012  ! 318: AND_R	and 	%r18, %r18, %r19
	.word 0x860020a0  ! 320: ADD_I	add 	%r0, 0x00a0, %r3
	.word 0xa57cacd9  ! 321: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57cbe4c  ! 322: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa77cad24  ! 323: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xa57d3658  ! 324: MOVR_I	movcs	%r20, 0x1, %r18
	.word 0xe4588003  ! 325: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe4408003  ! 326: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe470a050  ! 327: STX_I	stx	%r18, [%r2 + 0x0050]
	.word 0xa44c8013  ! 328: MULX_R	mulx 	%r18, %r19, %r18
	.word 0xa80c8013  ! 329: AND_R	and 	%r18, %r19, %r20
	.word 0xa57c8812  ! 330: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa4148012  ! 331: OR_R	or 	%r18, %r18, %r18
	.word 0xa44c8012  ! 332: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xe4008003  ! 333: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe870a088  ! 334: STX_I	stx	%r20, [%r2 + 0x0088]
	.word 0x24cc8001  ! 335: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0xe840a0b0  ! 336: LDSW_I	ldsw	[%r2 + 0x00b0], %r20
	.word 0xa84c8012  ! 337: MULX_R	mulx 	%r18, %r18, %r20
	.word 0xa77ca9f6  ! 338: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa80c8013  ! 339: AND_R	and 	%r18, %r19, %r20
	.word 0xa57ccc13  ! 340: MOVR_R	movl	%r19, %r19, %r18
	.word 0xe8708003  ! 341: STX_R	stx	%r20, [%r2 + %r3]
	.word 0x0ac50001  ! 342: BRNZ	brnz  ,nt	%r20,<label_0x50001>
	.word 0xa614c012  ! 343: OR_R	or 	%r19, %r18, %r19
	.word 0xa77cfd6c  ! 344: MOVR_I	movvs	%r19, 0x1, %r19
	.word 0x84006100  ! 346: ADD_I	add 	%r1, 0x0100, %r2
	.word 0xe418a058  ! 347: LDD_I	ldd	[%r2 + 0x0058], %r18
	.word 0xe8588003  ! 348: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe800a020  ! 349: LDUW_I	lduw	[%r2 + 0x0020], %r20
	.word 0xa57caef4  ! 350: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xe418a0a8  ! 351: LDD_I	ldd	[%r2 + 0x00a8], %r18
	.word 0x2cc48001  ! 352: BRGZ	brgz,a,nt	%r18,<label_0x48001>
	.word 0xa77c8412  ! 353: MOVR_R	move	%r18, %r18, %r19
	.word 0xa57ca758  ! 354: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa77d27d4  ! 355: MOVR_I	move	%r20, 0x1, %r19
	.word 0xa57cc412  ! 356: MOVR_R	move	%r19, %r18, %r18
	.word 0xe470a090  ! 357: STX_I	stx	%r18, [%r2 + 0x0090]
	.word 0x0ac50002  ! 358: BRNZ	brnz  ,nt	%r20,<label_0x50002>
	.word 0xe4708003  ! 359: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe8008003  ! 360: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe470a070  ! 361: STX_I	stx	%r18, [%r2 + 0x0070]
	.word 0xa57d0c13  ! 362: MOVR_R	movl	%r20, %r19, %r18
	.word 0xa77c9812  ! 363: MOVR_R	movneg	%r18, %r18, %r19
	.word 0xa77d1412  ! 364: MOVR_R	movcs	%r20, %r18, %r19
	.word 0xa97d3e35  ! 365: MOVR_I	movvs	%r20, 0x1, %r20
	.word 0xa40d0012  ! 366: AND_R	and 	%r20, %r18, %r18
	.word 0xa97cc412  ! 367: MOVR_R	move	%r19, %r18, %r20
	.word 0x84006e00  ! 369: ADD_I	add 	%r1, 0x0e00, %r2
	.word 0x02c50003  ! 370: BRZ	brz  ,nt	%r20,<label_0x50003>
	.word 0xa57d3c50  ! 371: MOVR_I	movvs	%r20, 0x1, %r18
	.word 0xa77cf927  ! 372: MOVR_I	movneg	%r19, 0x1, %r19
	.word 0xa97c8412  ! 373: MOVR_R	move	%r18, %r18, %r20
	.word 0x860020d0  ! 375: ADD_I	add 	%r0, 0x00d0, %r3
	.word 0xa57d0c12  ! 376: MOVR_R	movl	%r20, %r18, %r18
	.word 0xa57d1c13  ! 377: MOVR_R	movvs	%r20, %r19, %r18
	.word 0xa97caa40  ! 378: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xe4408003  ! 379: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa77caf2b  ! 380: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xe4408003  ! 381: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe4408003  ! 382: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe4408003  ! 383: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa97d0c12  ! 384: MOVR_R	movl	%r20, %r18, %r20
	.word 0xa57d2885  ! 385: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xa57d2f95  ! 386: MOVR_I	movl	%r20, 0x1, %r18
	.word 0xa57c9412  ! 387: MOVR_R	movcs	%r18, %r18, %r18
	.word 0xe440a0a0  ! 388: LDSW_I	ldsw	[%r2 + 0x00a0], %r18
	.word 0xe8588003  ! 389: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe8708003  ! 390: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xe8188003  ! 391: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xa57d0413  ! 392: MOVR_R	move	%r20, %r19, %r18
	.word 0xe8188003  ! 393: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xa77d1413  ! 394: MOVR_R	movcs	%r20, %r19, %r19
	.word 0xe458a088  ! 395: LDX_I	ldx	[%r2 + 0x0088], %r18
	.word 0xa57ceaa1  ! 396: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa57cc412  ! 397: MOVR_R	move	%r19, %r18, %r18
	.word 0xa64c8012  ! 398: MULX_R	mulx 	%r18, %r18, %r19
	.word 0xa4150012  ! 399: OR_R	or 	%r20, %r18, %r18
	.word 0xa77d2fa6  ! 400: MOVR_I	movl	%r20, 0x1, %r19
	.word 0xe400a030  ! 401: LDUW_I	lduw	[%r2 + 0x0030], %r18
	.word 0xe8588003  ! 402: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa40cc012  ! 403: AND_R	and 	%r19, %r18, %r18
	.word 0xa57cc413  ! 404: MOVR_R	move	%r19, %r19, %r18
	.word 0x84006000  ! 406: ADD_I	add 	%r1, 0x0000, %r2
	.word 0xa57ce9b7  ! 407: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xe4388003  ! 408: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe8008003  ! 409: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa57c9813  ! 410: MOVR_R	movneg	%r18, %r19, %r18
	.word 0x26c50002  ! 411: BRLZ	brlz,a,nt	%r20,<label_0x50002>
	.word 0x04cc8003  ! 412: BRLEZ	brlez  ,pt	%r18,<label_0xc8003>
	.word 0x860020f0  ! 414: ADD_I	add 	%r0, 0x00f0, %r3
	.word 0xa80cc012  ! 415: AND_R	and 	%r19, %r18, %r20
	.word 0x84006900  ! 417: ADD_I	add 	%r1, 0x0900, %r2
	.word 0xe8588003  ! 418: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe8008003  ! 419: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe4708003  ! 420: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa97d2d5f  ! 421: MOVR_I	movl	%r20, 0x1, %r20
	.word 0xa57cc812  ! 422: MOVR_R	movle	%r19, %r18, %r18
	.word 0xa57ca86e  ! 423: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa77cad86  ! 424: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xa57cef96  ! 425: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xa404c013  ! 426: ADD_R	add 	%r19, %r19, %r18
	.word 0xa57c8812  ! 427: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa57c8812  ! 428: MOVR_R	movle	%r18, %r18, %r18
	.word 0xa57ca791  ! 429: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa77cea0a  ! 430: MOVR_I	movle	%r19, 0x1, %r19
	.word 0xa57cc812  ! 431: MOVR_R	movle	%r19, %r18, %r18
	.word 0xe8008003  ! 432: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe4588003  ! 433: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa77c8413  ! 434: MOVR_R	move	%r18, %r19, %r19
	.word 0xa97d0412  ! 435: MOVR_R	move	%r20, %r18, %r20
	.word 0xa57cc412  ! 436: MOVR_R	move	%r19, %r18, %r18
	.word 0x0cc48003  ! 437: BRGZ	brgz  ,nt	%r18,<label_0x48003>
	.word 0x0ec48002  ! 438: BRGEZ	brgez  ,nt	%r18,<label_0x48002>
	.word 0xa804c012  ! 439: ADD_R	add 	%r19, %r18, %r20
	.word 0xa4048012  ! 440: ADD_R	add 	%r18, %r18, %r18
	.word 0x0acd0003  ! 441: BRNZ	brnz  ,pt	%r20,<label_0xd0003>
	.word 0xa64cc012  ! 442: MULX_R	mulx 	%r19, %r18, %r19
	.word 0xa57c8813  ! 443: MOVR_R	movle	%r18, %r19, %r18
	.word 0xa57cedad  ! 444: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xa57d0413  ! 445: MOVR_R	move	%r20, %r19, %r18
	.word 0xe8588003  ! 446: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa80c8012  ! 447: AND_R	and 	%r18, %r18, %r20
	.word 0xe8708003  ! 448: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa57c9412  ! 449: MOVR_R	movcs	%r18, %r18, %r18
	.word 0xa77cbcea  ! 450: MOVR_I	movvs	%r18, 0x1, %r19
	.word 0x06c48002  ! 451: BRLZ	brlz  ,nt	%r18,<label_0x48002>
	.word 0xa77cb913  ! 452: MOVR_I	movneg	%r18, 0x1, %r19
	.word 0xa97d2e52  ! 453: MOVR_I	movl	%r20, 0x1, %r20
	.word 0xa77c9412  ! 454: MOVR_R	movcs	%r18, %r18, %r19
	.word 0xa40d0013  ! 455: AND_R	and 	%r20, %r19, %r18
	.word 0xa57cafb9  ! 456: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xe8408003  ! 457: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa57cbce5  ! 458: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa44cc012  ! 459: MULX_R	mulx 	%r19, %r18, %r18
	.word 0x84006d00  ! 461: ADD_I	add 	%r1, 0x0d00, %r2
	.word 0x0acc8002  ! 462: BRNZ	brnz  ,pt	%r18,<label_0xc8002>
	.word 0xa77c9812  ! 463: MOVR_R	movneg	%r18, %r18, %r19
	.word 0xa57c9413  ! 464: MOVR_R	movcs	%r18, %r19, %r18
	.word 0x860020b8  ! 466: ADD_I	add 	%r0, 0x00b8, %r3
	.word 0xa57cd812  ! 467: MOVR_R	movneg	%r19, %r18, %r18
	.word 0xa64cc013  ! 468: MULX_R	mulx 	%r19, %r19, %r19
	.word 0xa77d3569  ! 469: MOVR_I	movcs	%r20, 0x1, %r19
	.word 0xa44c8012  ! 470: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xa77d0c13  ! 471: MOVR_R	movl	%r20, %r19, %r19
	.word 0xe4388003  ! 472: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa4148012  ! 473: OR_R	or 	%r18, %r18, %r18
	.word 0xa77cec69  ! 474: MOVR_I	movl	%r19, 0x1, %r19
	.word 0xa57cb8bd  ! 475: MOVR_I	movneg	%r18, 0x1, %r18
	.word 0xe4588003  ! 476: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57cac83  ! 477: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa604c012  ! 478: ADD_R	add 	%r19, %r18, %r19
	.word 0xa424c012  ! 479: SUB_R	sub 	%r19, %r18, %r18
	.word 0xa8048013  ! 480: ADD_R	add 	%r18, %r19, %r20
	.word 0xa97caa94  ! 481: MOVR_I	movle	%r18, 0x1, %r20
	.word 0x0cccc003  ! 482: BRGZ	brgz  ,pt	%r19,<label_0xcc003>
	.word 0xe400a0e8  ! 483: LDUW_I	lduw	[%r2 + 0x00e8], %r18
	.word 0xa604c012  ! 484: ADD_R	add 	%r19, %r18, %r19
	.word 0xa57cd413  ! 485: MOVR_R	movcs	%r19, %r19, %r18
	.word 0xa77cd812  ! 486: MOVR_R	movneg	%r19, %r18, %r19
	.word 0xa57cada3  ! 487: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa80cc013  ! 488: AND_R	and 	%r19, %r19, %r20
	.word 0xa84c8013  ! 489: MULX_R	mulx 	%r18, %r19, %r20
	.word 0xe8408003  ! 490: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa77d259b  ! 491: MOVR_I	move	%r20, 0x1, %r19
	.word 0xa4048013  ! 492: ADD_R	add 	%r18, %r19, %r18
	.word 0xa414c012  ! 493: OR_R	or 	%r19, %r18, %r18
	.word 0xa97cada7  ! 494: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa57cbc0e  ! 495: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa57cbe1e  ! 496: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa97c8412  ! 497: MOVR_R	move	%r18, %r18, %r20
	.word 0xe8708003  ! 498: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa97d291e  ! 499: MOVR_I	movle	%r20, 0x1, %r20
	.word 0x86002020  ! 501: ADD_I	add 	%r0, 0x0020, %r3
	.word 0xe840a0f8  ! 502: LDSW_I	ldsw	[%r2 + 0x00f8], %r20
	.word 0xe870a070  ! 503: STX_I	stx	%r20, [%r2 + 0x0070]
	.word 0xe4188003  ! 504: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa84c8012  ! 505: MULX_R	mulx 	%r18, %r18, %r20
	.word 0x84006b00  ! 507: ADD_I	add 	%r1, 0x0b00, %r2
	.word 0xe440a078  ! 508: LDSW_I	ldsw	[%r2 + 0x0078], %r18
	.word 0xe858a0b0  ! 509: LDX_I	ldx	[%r2 + 0x00b0], %r20
	.word 0x2ac4c002  ! 510: BRNZ	brnz,a,nt	%r19,<label_0x4c002>
	.word 0xe4408003  ! 511: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe4708003  ! 512: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe4008003  ! 513: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa97cbc49  ! 514: MOVR_I	movvs	%r18, 0x1, %r20
	.word 0x2ecd0002  ! 515: BRGEZ	brgez,a,pt	%r20,<label_0xd0002>
	.word 0xa57cc413  ! 516: MOVR_R	move	%r19, %r19, %r18
	.word 0xa57ceb61  ! 517: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa44c8013  ! 518: MULX_R	mulx 	%r18, %r19, %r18
	.word 0xa8050012  ! 519: ADD_R	add 	%r20, %r18, %r20
	.word 0xa77d3553  ! 520: MOVR_I	movcs	%r20, 0x1, %r19
	.word 0xe858a080  ! 521: LDX_I	ldx	[%r2 + 0x0080], %r20
	.word 0xa77caf14  ! 522: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xa57c8813  ! 523: MOVR_R	movle	%r18, %r19, %r18
	.word 0x86002010  ! 525: ADD_I	add 	%r0, 0x0010, %r3
	.word 0xa57d282e  ! 526: MOVR_I	movle	%r20, 0x1, %r18
	.word 0x84006d00  ! 528: ADD_I	add 	%r1, 0x0d00, %r2
	.word 0xa77cc412  ! 529: MOVR_R	move	%r19, %r18, %r19
	.word 0xa97d1c12  ! 530: MOVR_R	movvs	%r20, %r18, %r20
	.word 0xe440a0a8  ! 531: LDSW_I	ldsw	[%r2 + 0x00a8], %r18
	.word 0xa97c9c12  ! 532: MOVR_R	movvs	%r18, %r18, %r20
	.word 0xa4148013  ! 533: OR_R	or 	%r18, %r19, %r18
	.word 0xe8708003  ! 534: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa824c013  ! 535: SUB_R	sub 	%r19, %r19, %r20
	.word 0x86002068  ! 537: ADD_I	add 	%r0, 0x0068, %r3
	.word 0xa77d26dd  ! 538: MOVR_I	move	%r20, 0x1, %r19
	.word 0xa57cc413  ! 539: MOVR_R	move	%r19, %r19, %r18
	.word 0xe470a020  ! 540: STX_I	stx	%r18, [%r2 + 0x0020]
	.word 0xe8588003  ! 541: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa814c012  ! 542: OR_R	or 	%r19, %r18, %r20
	.word 0xe4408003  ! 543: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa6148012  ! 544: OR_R	or 	%r18, %r18, %r19
	.word 0xa57d0412  ! 545: MOVR_R	move	%r20, %r18, %r18
	.word 0xa97caa5b  ! 546: MOVR_I	movle	%r18, 0x1, %r20
	.word 0xa97c9813  ! 547: MOVR_R	movneg	%r18, %r19, %r20
	.word 0xe4008003  ! 548: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa84cc012  ! 549: MULX_R	mulx 	%r19, %r18, %r20
	.word 0xa77d34e9  ! 550: MOVR_I	movcs	%r20, 0x1, %r19
	.word 0xa57cc412  ! 551: MOVR_R	move	%r19, %r18, %r18
	.word 0x84006500  ! 553: ADD_I	add 	%r1, 0x0500, %r2
	.word 0xe4588003  ! 554: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57cebad  ! 555: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa57d0c12  ! 556: MOVR_R	movl	%r20, %r18, %r18
	.word 0xe440a078  ! 557: LDSW_I	ldsw	[%r2 + 0x0078], %r18
	.word 0x2cc48003  ! 558: BRGZ	brgz,a,nt	%r18,<label_0x48003>
	.word 0xe4008003  ! 559: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa77d0812  ! 560: MOVR_R	movle	%r20, %r18, %r19
	.word 0xa97d0c12  ! 561: MOVR_R	movl	%r20, %r18, %r20
	.word 0xe8588003  ! 562: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe4588003  ! 563: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe4388003  ! 564: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa6150012  ! 565: OR_R	or 	%r20, %r18, %r19
	.word 0xe4008003  ! 566: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0x860020b8  ! 568: ADD_I	add 	%r0, 0x00b8, %r3
	.word 0xa77c9413  ! 569: MOVR_R	movcs	%r18, %r19, %r19
	.word 0xa57cf7d3  ! 570: MOVR_I	movcs	%r19, 0x1, %r18
	.word 0xa8050013  ! 571: ADD_R	add 	%r20, %r19, %r20
	.word 0x86002070  ! 573: ADD_I	add 	%r0, 0x0070, %r3
	.word 0xe470a060  ! 574: STX_I	stx	%r18, [%r2 + 0x0060]
	.word 0xa57c8412  ! 575: MOVR_R	move	%r18, %r18, %r18
	.word 0xa57cc412  ! 576: MOVR_R	move	%r19, %r18, %r18
	.word 0x0cc50001  ! 577: BRGZ	brgz  ,nt	%r20,<label_0x50001>
	.word 0x86002068  ! 579: ADD_I	add 	%r0, 0x0068, %r3
	.word 0xa57ccc13  ! 580: MOVR_R	movl	%r19, %r19, %r18
	.word 0x84006500  ! 582: ADD_I	add 	%r1, 0x0500, %r2
	.word 0xa57ca76a  ! 583: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa77cacd9  ! 584: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xa77d0c12  ! 585: MOVR_R	movl	%r20, %r18, %r19
	.word 0xe8008003  ! 586: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0x2ac48001  ! 587: BRNZ	brnz,a,nt	%r18,<label_0x48001>
	.word 0xe4588003  ! 588: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa97cb680  ! 589: MOVR_I	movcs	%r18, 0x1, %r20
	.word 0x84006300  ! 591: ADD_I	add 	%r1, 0x0300, %r2
	.word 0xe8708003  ! 592: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa424c012  ! 593: SUB_R	sub 	%r19, %r18, %r18
	.word 0xa57cb6e5  ! 594: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xa4248012  ! 595: SUB_R	sub 	%r18, %r18, %r18
	.word 0xa97cb9b5  ! 596: MOVR_I	movneg	%r18, 0x1, %r20
	.word 0xe4408003  ! 597: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe858a0a8  ! 598: LDX_I	ldx	[%r2 + 0x00a8], %r20
	.word 0xa57cbd70  ! 599: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa57ccc13  ! 600: MOVR_R	movl	%r19, %r19, %r18
	.word 0xa6148013  ! 601: OR_R	or 	%r18, %r19, %r19
	.word 0x02c50003  ! 602: BRZ	brz  ,nt	%r20,<label_0x50003>
	.word 0xa97d25c5  ! 603: MOVR_I	move	%r20, 0x1, %r20
	.word 0xa80d0012  ! 604: AND_R	and 	%r20, %r18, %r20
	.word 0xe8408003  ! 605: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0x24cc8003  ! 606: BRLEZ	brlez,a,pt	%r18,<label_0xc8003>
	.word 0xa8148012  ! 607: OR_R	or 	%r18, %r18, %r20
	.word 0x04c48003  ! 608: BRLEZ	brlez  ,nt	%r18,<label_0x48003>
	.word 0xe4408003  ! 609: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe440a058  ! 610: LDSW_I	ldsw	[%r2 + 0x0058], %r18
	.word 0xa57c9812  ! 611: MOVR_R	movneg	%r18, %r18, %r18
	.word 0xa97cb812  ! 612: MOVR_I	movneg	%r18, 0x1, %r20
	.word 0xe400a048  ! 613: LDUW_I	lduw	[%r2 + 0x0048], %r18
	.word 0xe400a0d8  ! 614: LDUW_I	lduw	[%r2 + 0x00d8], %r18
	.word 0xa77d2db7  ! 615: MOVR_I	movl	%r20, 0x1, %r19
	.word 0xe8588003  ! 616: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xa57cab84  ! 617: MOVR_I	movle	%r18, 0x1, %r18
	.word 0x2ec48003  ! 618: BRGEZ	brgez,a,nt	%r18,<label_0x48003>
	.word 0xe4588003  ! 619: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa44c8012  ! 620: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xe418a080  ! 621: LDD_I	ldd	[%r2 + 0x0080], %r18
	.word 0xa57cc812  ! 622: MOVR_R	movle	%r19, %r18, %r18
	.word 0x84006000  ! 624: ADD_I	add 	%r1, 0x0000, %r2
	.word 0xa57d0813  ! 625: MOVR_R	movle	%r20, %r19, %r18
	.word 0xe470a080  ! 626: STX_I	stx	%r18, [%r2 + 0x0080]
	.word 0xa624c012  ! 627: SUB_R	sub 	%r19, %r18, %r19
	.word 0xa6048012  ! 628: ADD_R	add 	%r18, %r18, %r19
	.word 0xa77cb762  ! 629: MOVR_I	movcs	%r18, 0x1, %r19
	.word 0xe8708003  ! 630: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xe4708003  ! 631: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa57cbd5f  ! 632: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xe4588003  ! 633: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa414c013  ! 634: OR_R	or 	%r19, %r19, %r18
	.word 0xa4150012  ! 635: OR_R	or 	%r20, %r18, %r18
	.word 0xa57d0413  ! 636: MOVR_R	move	%r20, %r19, %r18
	.word 0xa40cc012  ! 637: AND_R	and 	%r19, %r18, %r18
	.word 0x26c48003  ! 638: BRLZ	brlz,a,nt	%r18,<label_0x48003>
	.word 0xe4408003  ! 639: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe8408003  ! 640: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xe4708003  ! 641: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa4250012  ! 642: SUB_R	sub 	%r20, %r18, %r18
	.word 0xa4250012  ! 643: SUB_R	sub 	%r20, %r18, %r18
	.word 0xe400a0a0  ! 644: LDUW_I	lduw	[%r2 + 0x00a0], %r18
	.word 0xa424c012  ! 645: SUB_R	sub 	%r19, %r18, %r18
	.word 0xa77cf899  ! 646: MOVR_I	movneg	%r19, 0x1, %r19
	.word 0xe4408003  ! 647: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe840a0e0  ! 648: LDSW_I	ldsw	[%r2 + 0x00e0], %r20
	.word 0xa8048012  ! 649: ADD_R	add 	%r18, %r18, %r20
	.word 0xe800a050  ! 650: LDUW_I	lduw	[%r2 + 0x0050], %r20
	.word 0xe470a020  ! 651: STX_I	stx	%r18, [%r2 + 0x0020]
	.word 0xe8408003  ! 652: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa77ca5dd  ! 653: MOVR_I	move	%r18, 0x1, %r19
	.word 0xa77cac70  ! 654: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xa57c9c13  ! 655: MOVR_R	movvs	%r18, %r19, %r18
	.word 0xe870a068  ! 656: STX_I	stx	%r20, [%r2 + 0x0068]
	.word 0xa97d2d6b  ! 657: MOVR_I	movl	%r20, 0x1, %r20
	.word 0xe458a090  ! 658: LDX_I	ldx	[%r2 + 0x0090], %r18
	.word 0xa57caead  ! 659: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa77cec34  ! 660: MOVR_I	movl	%r19, 0x1, %r19
	.word 0xe8408003  ! 661: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa57cf827  ! 662: MOVR_I	movneg	%r19, 0x1, %r18
	.word 0xe840a0f8  ! 663: LDSW_I	ldsw	[%r2 + 0x00f8], %r20
	.word 0xe4588003  ! 664: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x06c48002  ! 665: BRLZ	brlz  ,nt	%r18,<label_0x48002>
	.word 0xe4588003  ! 666: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57d25ee  ! 667: MOVR_I	move	%r20, 0x1, %r18
	.word 0xa97ce59c  ! 668: MOVR_I	move	%r19, 0x1, %r20
	.word 0x0ecc8003  ! 669: BRGEZ	brgez  ,pt	%r18,<label_0xc8003>
	.word 0xa57d0413  ! 670: MOVR_R	move	%r20, %r19, %r18
	.word 0xa57c9412  ! 671: MOVR_R	movcs	%r18, %r18, %r18
	.word 0xe470a050  ! 672: STX_I	stx	%r18, [%r2 + 0x0050]
	.word 0xe8408003  ! 673: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xe400a068  ! 674: LDUW_I	lduw	[%r2 + 0x0068], %r18
	.word 0xa77cecc6  ! 675: MOVR_I	movl	%r19, 0x1, %r19
	.word 0xe4388003  ! 676: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa77cad1f  ! 677: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xa97d1812  ! 678: MOVR_R	movneg	%r20, %r18, %r20
	.word 0xa57d3e82  ! 679: MOVR_I	movvs	%r20, 0x1, %r18
	.word 0xe8708003  ! 680: STX_R	stx	%r20, [%r2 + %r3]
	.word 0x2cc48003  ! 681: BRGZ	brgz,a,nt	%r18,<label_0x48003>
	.word 0xa6248013  ! 682: SUB_R	sub 	%r18, %r19, %r19
	.word 0xe4388003  ! 683: STD_R	std	%r18, [%r2 + %r3]
	.word 0xa77ceec6  ! 684: MOVR_I	movl	%r19, 0x1, %r19
	.word 0xa77ca801  ! 685: MOVR_I	movle	%r18, 0x1, %r19
	.word 0xa57cf4b2  ! 686: MOVR_I	movcs	%r19, 0x1, %r18
	.word 0xe4708003  ! 687: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa77cc812  ! 688: MOVR_R	movle	%r19, %r18, %r19
	.word 0xa57c9c13  ! 689: MOVR_R	movvs	%r18, %r19, %r18
	.word 0xe458a070  ! 690: LDX_I	ldx	[%r2 + 0x0070], %r18
	.word 0xa77cbf4a  ! 691: MOVR_I	movvs	%r18, 0x1, %r19
	.word 0xa57cbfcd  ! 692: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0xa77ce79e  ! 693: MOVR_I	move	%r19, 0x1, %r19
	.word 0xa77d0c12  ! 694: MOVR_R	movl	%r20, %r18, %r19
	.word 0xa8248012  ! 695: SUB_R	sub 	%r18, %r18, %r20
	.word 0xa77d25f5  ! 696: MOVR_I	move	%r20, 0x1, %r19
	.word 0x84006200  ! 698: ADD_I	add 	%r1, 0x0200, %r2
	.word 0xe4388003  ! 699: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe4008003  ! 700: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe818a0b8  ! 701: LDD_I	ldd	[%r2 + 0x00b8], %r20
	.word 0xa57d29ec  ! 702: MOVR_I	movle	%r20, 0x1, %r18
	.word 0x06c48002  ! 703: BRLZ	brlz  ,nt	%r18,<label_0x48002>
	.word 0xe4588003  ! 704: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x860020f8  ! 706: ADD_I	add 	%r0, 0x00f8, %r3
	.word 0xa57d0413  ! 707: MOVR_R	move	%r20, %r19, %r18
	.word 0xa77cf7d2  ! 708: MOVR_I	movcs	%r19, 0x1, %r19
	.word 0xa77c8412  ! 709: MOVR_R	move	%r18, %r18, %r19
	.word 0xa77c8812  ! 710: MOVR_R	movle	%r18, %r18, %r19
	.word 0xa57d298b  ! 711: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xe4408003  ! 712: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0x86002040  ! 714: ADD_I	add 	%r0, 0x0040, %r3
	.word 0xa57cc412  ! 715: MOVR_R	move	%r19, %r18, %r18
	.word 0xe4008003  ! 716: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe818a068  ! 717: LDD_I	ldd	[%r2 + 0x0068], %r20
	.word 0xe400a020  ! 718: LDUW_I	lduw	[%r2 + 0x0020], %r18
	.word 0xe8708003  ! 719: STX_R	stx	%r20, [%r2 + %r3]
	.word 0xa57c8c12  ! 720: MOVR_R	movl	%r18, %r18, %r18
	.word 0x0cc50003  ! 721: BRGZ	brgz  ,nt	%r20,<label_0x50003>
	.word 0xe8008003  ! 722: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe400a0e8  ! 723: LDUW_I	lduw	[%r2 + 0x00e8], %r18
	.word 0xe4188003  ! 724: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa97d2755  ! 725: MOVR_I	move	%r20, 0x1, %r20
	.word 0xa8148012  ! 726: OR_R	or 	%r18, %r18, %r20
	.word 0xa57c8413  ! 727: MOVR_R	move	%r18, %r19, %r18
	.word 0x0cc50002  ! 728: BRGZ	brgz  ,nt	%r20,<label_0x50002>
	.word 0xa824c012  ! 729: SUB_R	sub 	%r19, %r18, %r20
	.word 0xe800a060  ! 730: LDUW_I	lduw	[%r2 + 0x0060], %r20
	.word 0xe800a038  ! 731: LDUW_I	lduw	[%r2 + 0x0038], %r20
	.word 0xa424c012  ! 732: SUB_R	sub 	%r19, %r18, %r18
	.word 0xa60c8012  ! 733: AND_R	and 	%r18, %r18, %r19
	.word 0xa84d0012  ! 734: MULX_R	mulx 	%r20, %r18, %r20
	.word 0x860020b8  ! 736: ADD_I	add 	%r0, 0x00b8, %r3
	.word 0xa57ca52e  ! 737: MOVR_I	move	%r18, 0x1, %r18
	.word 0xa57d3c52  ! 738: MOVR_I	movvs	%r20, 0x1, %r18
	.word 0xa57d37aa  ! 739: MOVR_I	movcs	%r20, 0x1, %r18
	.word 0x2cc50003  ! 740: BRGZ	brgz,a,nt	%r20,<label_0x50003>
	.word 0xe418a010  ! 741: LDD_I	ldd	[%r2 + 0x0010], %r18
	.word 0xe8008003  ! 742: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa77ce605  ! 743: MOVR_I	move	%r19, 0x1, %r19
	.word 0xa57d273e  ! 744: MOVR_I	move	%r20, 0x1, %r18
	.word 0xa77d2b68  ! 745: MOVR_I	movle	%r20, 0x1, %r19
	.word 0xa57ce7d0  ! 746: MOVR_I	move	%r19, 0x1, %r18
	.word 0x84006a00  ! 748: ADD_I	add 	%r1, 0x0a00, %r2
	.word 0xe470a040  ! 749: STX_I	stx	%r18, [%r2 + 0x0040]
	.word 0xa57d0c12  ! 750: MOVR_R	movl	%r20, %r18, %r18
	.word 0xa57d0c12  ! 751: MOVR_R	movl	%r20, %r18, %r18
	.word 0xe4708003  ! 752: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xe4188003  ! 753: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xe458a0b8  ! 754: LDX_I	ldx	[%r2 + 0x00b8], %r18
	.word 0x26c48002  ! 755: BRLZ	brlz,a,nt	%r18,<label_0x48002>
	.word 0x2ec50003  ! 756: BRGEZ	brgez,a,nt	%r20,<label_0x50003>
	.word 0xe4008003  ! 757: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa77c8412  ! 758: MOVR_R	move	%r18, %r18, %r19
	.word 0xe800a0f0  ! 759: LDUW_I	lduw	[%r2 + 0x00f0], %r20
	.word 0xe4588003  ! 760: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe4408003  ! 761: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xe4588003  ! 762: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x84006700  ! 764: ADD_I	add 	%r1, 0x0700, %r2
	.word 0xa604c012  ! 765: ADD_R	add 	%r19, %r18, %r19
	.word 0xa97ca634  ! 766: MOVR_I	move	%r18, 0x1, %r20
	.word 0x84006f00  ! 768: ADD_I	add 	%r1, 0x0f00, %r2
	.word 0xe440a000  ! 769: LDSW_I	ldsw	[%r2 + 0x0000], %r18
	.word 0xa97c8813  ! 770: MOVR_R	movle	%r18, %r19, %r20
	.word 0xa40d0012  ! 771: AND_R	and 	%r20, %r18, %r18
	.word 0xa57ceaf4  ! 772: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xa97cc412  ! 773: MOVR_R	move	%r19, %r18, %r20
	.word 0x84006a00  ! 775: ADD_I	add 	%r1, 0x0a00, %r2
	.word 0xe4408003  ! 776: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa4050012  ! 777: ADD_R	add 	%r20, %r18, %r18
	.word 0xa97cec09  ! 778: MOVR_I	movl	%r19, 0x1, %r20
	.word 0xa97d3c5a  ! 779: MOVR_I	movvs	%r20, 0x1, %r20
	.word 0xa84d0013  ! 780: MULX_R	mulx 	%r20, %r19, %r20
	.word 0xa57ceff7  ! 781: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xe400a0d0  ! 782: LDUW_I	lduw	[%r2 + 0x00d0], %r18
	.word 0xe470a088  ! 783: STX_I	stx	%r18, [%r2 + 0x0088]
	.word 0xe4588003  ! 784: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa77cf77a  ! 785: MOVR_I	movcs	%r19, 0x1, %r19
	.word 0xe4008003  ! 786: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xa44c8012  ! 787: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xa57cb586  ! 788: MOVR_I	movcs	%r18, 0x1, %r18
	.word 0xa44d0012  ! 789: MULX_R	mulx 	%r20, %r18, %r18
	.word 0xa97c8c12  ! 790: MOVR_R	movl	%r18, %r18, %r20
	.word 0xa57caf9d  ! 791: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57cf713  ! 792: MOVR_I	movcs	%r19, 0x1, %r18
	.word 0xe870a0f8  ! 793: STX_I	stx	%r20, [%r2 + 0x00f8]
	.word 0xa57caba4  ! 794: MOVR_I	movle	%r18, 0x1, %r18
	.word 0x0ac50002  ! 795: BRNZ	brnz  ,nt	%r20,<label_0x50002>
	.word 0xa77ce6d6  ! 796: MOVR_I	move	%r19, 0x1, %r19
	.word 0x84006d00  ! 798: ADD_I	add 	%r1, 0x0d00, %r2
	.word 0xa57caee4  ! 799: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57cad8e  ! 800: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa97d0812  ! 801: MOVR_R	movle	%r20, %r18, %r20
	.word 0xa97cbac1  ! 802: MOVR_I	movneg	%r18, 0x1, %r20
	.word 0xe4008003  ! 803: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe4588003  ! 804: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe8388003  ! 805: STD_R	std	%r20, [%r2 + %r3]
	.word 0xe4708003  ! 806: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa84cc012  ! 807: MULX_R	mulx 	%r19, %r18, %r20
	.word 0x2acc8003  ! 808: BRNZ	brnz,a,pt	%r18,<label_0xc8003>
	.word 0x26c4c003  ! 809: BRLZ	brlz,a,nt	%r19,<label_0x4c003>
	.word 0xe470a0b8  ! 810: STX_I	stx	%r18, [%r2 + 0x00b8]
	.word 0xe840a028  ! 811: LDSW_I	ldsw	[%r2 + 0x0028], %r20
	.word 0xa57cbc29  ! 812: MOVR_I	movvs	%r18, 0x1, %r18
	.word 0x26c50001  ! 813: BRLZ	brlz,a,nt	%r20,<label_0x50001>
	.word 0xa97d3a43  ! 814: MOVR_I	movneg	%r20, 0x1, %r20
	.word 0xa57d27b1  ! 815: MOVR_I	move	%r20, 0x1, %r18
	.word 0xa57caf5f  ! 816: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa97ca456  ! 817: MOVR_I	move	%r18, 0x1, %r20
	.word 0xe4188003  ! 818: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa424c012  ! 819: SUB_R	sub 	%r19, %r18, %r18
	.word 0xe8008003  ! 820: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xe4408003  ! 821: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa57cab15  ! 822: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xe400a040  ! 823: LDUW_I	lduw	[%r2 + 0x0040], %r18
	.word 0xe8188003  ! 824: LDD_R	ldd	[%r2 + %r3], %r20
	.word 0xa824c012  ! 825: SUB_R	sub 	%r19, %r18, %r20
	.word 0xa77cf972  ! 826: MOVR_I	movneg	%r19, 0x1, %r19
	.word 0xa404c012  ! 827: ADD_R	add 	%r19, %r18, %r18
	.word 0xe470a078  ! 828: STX_I	stx	%r18, [%r2 + 0x0078]
	.word 0xe458a050  ! 829: LDX_I	ldx	[%r2 + 0x0050], %r18
	.word 0xe4188003  ! 830: LDD_R	ldd	[%r2 + %r3], %r18
	.word 0xa57d2a66  ! 831: MOVR_I	movle	%r20, 0x1, %r18
	.word 0xe4588003  ! 832: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe458a080  ! 833: LDX_I	ldx	[%r2 + 0x0080], %r18
	.word 0xa8050012  ! 834: ADD_R	add 	%r20, %r18, %r20
	.word 0xa77c8412  ! 835: MOVR_R	move	%r18, %r18, %r19
	.word 0xa77c8812  ! 836: MOVR_R	movle	%r18, %r18, %r19
	.word 0xa57d0c13  ! 837: MOVR_R	movl	%r20, %r19, %r18
	.word 0xe458a050  ! 838: LDX_I	ldx	[%r2 + 0x0050], %r18
	.word 0xa97cad53  ! 839: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa40c8012  ! 840: AND_R	and 	%r18, %r18, %r18
	.word 0x02ccc002  ! 841: BRZ	brz  ,pt	%r19,<label_0xcc002>
	.word 0xa77c8812  ! 842: MOVR_R	movle	%r18, %r18, %r19
	.word 0xe8588003  ! 843: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe8008003  ! 844: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa4248013  ! 845: SUB_R	sub 	%r18, %r19, %r18
	.word 0xa57cc413  ! 846: MOVR_R	move	%r19, %r19, %r18
	.word 0xe4408003  ! 847: LDSW_R	ldsw	[%r2 + %r3], %r18
	.word 0xa44c8012  ! 848: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xa77cac2e  ! 849: MOVR_I	movl	%r18, 0x1, %r19
	.word 0xa77d0812  ! 850: MOVR_R	movle	%r20, %r18, %r19
	.word 0x24cc8001  ! 851: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0xa57cedf3  ! 852: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xa57c9812  ! 853: MOVR_R	movneg	%r18, %r18, %r18
	.word 0x06c48001  ! 854: BRLZ	brlz  ,nt	%r18,<label_0x48001>
	.word 0xa4150012  ! 855: OR_R	or 	%r20, %r18, %r18
	.word 0xa44cc013  ! 856: MULX_R	mulx 	%r19, %r19, %r18
	.word 0x02cd0003  ! 857: BRZ	brz  ,pt	%r20,<label_0xd0003>
	.word 0xe4588003  ! 858: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xe400a000  ! 859: LDUW_I	lduw	[%r2 + 0x0000], %r18
	.word 0xa57caacd  ! 860: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xe400a048  ! 861: LDUW_I	lduw	[%r2 + 0x0048], %r18
	.word 0xe8408003  ! 862: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa77cd813  ! 863: MOVR_R	movneg	%r19, %r19, %r19
	.word 0xe4708003  ! 864: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa8248012  ! 865: SUB_R	sub 	%r18, %r18, %r20
	.word 0xe4708003  ! 866: STX_R	stx	%r18, [%r2 + %r3]
	.word 0x0ac4c002  ! 867: BRNZ	brnz  ,nt	%r19,<label_0x4c002>
	.word 0xa97c8413  ! 868: MOVR_R	move	%r18, %r19, %r20
	.word 0xe4708003  ! 869: STX_R	stx	%r18, [%r2 + %r3]
	.word 0xa57cacd2  ! 870: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57cacd1  ! 871: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57cc412  ! 872: MOVR_R	move	%r19, %r18, %r18
	.word 0xa57c8c12  ! 873: MOVR_R	movl	%r18, %r18, %r18
	.word 0xe418a058  ! 874: LDD_I	ldd	[%r2 + 0x0058], %r18
	.word 0xa97c8412  ! 875: MOVR_R	move	%r18, %r18, %r20
	.word 0x86002028  ! 877: ADD_I	add 	%r0, 0x0028, %r3
	.word 0xa57d2737  ! 878: MOVR_I	move	%r20, 0x1, %r18
	.word 0xe4588003  ! 879: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57c8c12  ! 880: MOVR_R	movl	%r18, %r18, %r18
	.word 0xe400a070  ! 881: LDUW_I	lduw	[%r2 + 0x0070], %r18
	.word 0xe8408003  ! 882: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa57ca551  ! 883: MOVR_I	move	%r18, 0x1, %r18
	.word 0x84006800  ! 885: ADD_I	add 	%r1, 0x0800, %r2
	.word 0xe4388003  ! 886: STD_R	std	%r18, [%r2 + %r3]
	.word 0xe440a0e0  ! 887: LDSW_I	ldsw	[%r2 + 0x00e0], %r18
	.word 0xe440a080  ! 888: LDSW_I	ldsw	[%r2 + 0x0080], %r18
	.word 0xa57c8812  ! 889: MOVR_R	movle	%r18, %r18, %r18
	.word 0xe800a028  ! 890: LDUW_I	lduw	[%r2 + 0x0028], %r20
	.word 0xa4048012  ! 891: ADD_R	add 	%r18, %r18, %r18
	.word 0x04c48003  ! 892: BRLEZ	brlez  ,nt	%r18,<label_0x48003>
	.word 0xa8150012  ! 893: OR_R	or 	%r20, %r18, %r20
	.word 0x26cc8002  ! 894: BRLZ	brlz,a,pt	%r18,<label_0xc8002>
	.word 0xa57d0c12  ! 895: MOVR_R	movl	%r20, %r18, %r18
	.word 0xa77c9812  ! 896: MOVR_R	movneg	%r18, %r18, %r19
	.word 0xe400a0b0  ! 897: LDUW_I	lduw	[%r2 + 0x00b0], %r18
	.word 0xe8008003  ! 898: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0xa6048012  ! 899: ADD_R	add 	%r18, %r18, %r19
	.word 0xe470a0b8  ! 900: STX_I	stx	%r18, [%r2 + 0x00b8]
	.word 0xa4148012  ! 901: OR_R	or 	%r18, %r18, %r18
	.word 0x860020f0  ! 903: ADD_I	add 	%r0, 0x00f0, %r3
	.word 0xa57cee0b  ! 904: MOVR_I	movl	%r19, 0x1, %r18
	.word 0x860020e8  ! 906: ADD_I	add 	%r0, 0x00e8, %r3
	.word 0xa97d0c12  ! 907: MOVR_R	movl	%r20, %r18, %r20
	.word 0xa97ceb35  ! 908: MOVR_I	movle	%r19, 0x1, %r20
	.word 0xa97d0812  ! 909: MOVR_R	movle	%r20, %r18, %r20
	.word 0xa44d0012  ! 910: MULX_R	mulx 	%r20, %r18, %r18
	.word 0xe870a0b8  ! 911: STX_I	stx	%r20, [%r2 + 0x00b8]
	.word 0xe400a0f0  ! 912: LDUW_I	lduw	[%r2 + 0x00f0], %r18
	.word 0x84006400  ! 914: ADD_I	add 	%r1, 0x0400, %r2
	.word 0xa4250012  ! 915: SUB_R	sub 	%r20, %r18, %r18
	.word 0xe858a0a0  ! 916: LDX_I	ldx	[%r2 + 0x00a0], %r20
	.word 0xa97cac6a  ! 917: MOVR_I	movl	%r18, 0x1, %r20
	.word 0xa97cf779  ! 918: MOVR_I	movcs	%r19, 0x1, %r20
	.word 0xa97d2e40  ! 919: MOVR_I	movl	%r20, 0x1, %r20
	.word 0xa97c8c12  ! 920: MOVR_R	movl	%r18, %r18, %r20
	.word 0x86002098  ! 922: ADD_I	add 	%r0, 0x0098, %r3
	.word 0xa57d2a35  ! 923: MOVR_I	movle	%r20, 0x1, %r18
	.word 0x2ec50003  ! 924: BRGEZ	brgez,a,nt	%r20,<label_0x50003>
	.word 0xa57c8c12  ! 925: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa57c8c12  ! 926: MOVR_R	movl	%r18, %r18, %r18
	.word 0x86002018  ! 928: ADD_I	add 	%r0, 0x0018, %r3
	.word 0xa57d0412  ! 929: MOVR_R	move	%r20, %r18, %r18
	.word 0xa57c9c13  ! 930: MOVR_R	movvs	%r18, %r19, %r18
	.word 0xa77d0813  ! 931: MOVR_R	movle	%r20, %r19, %r19
	.word 0xe400a040  ! 932: LDUW_I	lduw	[%r2 + 0x0040], %r18
	.word 0xa97d1c12  ! 933: MOVR_R	movvs	%r20, %r18, %r20
	.word 0xa77d2ddf  ! 934: MOVR_I	movl	%r20, 0x1, %r19
	.word 0xa57cdc13  ! 935: MOVR_R	movvs	%r19, %r19, %r18
	.word 0xa44c8012  ! 936: MULX_R	mulx 	%r18, %r18, %r18
	.word 0xa57ccc12  ! 937: MOVR_R	movl	%r19, %r18, %r18
	.word 0xa77d1412  ! 938: MOVR_R	movcs	%r20, %r18, %r19
	.word 0xa77d2516  ! 939: MOVR_I	move	%r20, 0x1, %r19
	.word 0x84006e00  ! 941: ADD_I	add 	%r1, 0x0e00, %r2
	.word 0xa57c8c13  ! 942: MOVR_R	movl	%r18, %r19, %r18
	.word 0xa97c8c13  ! 943: MOVR_R	movl	%r18, %r19, %r20
	.word 0x0cc48001  ! 944: BRGZ	brgz  ,nt	%r18,<label_0x48001>
	.word 0xa624c013  ! 945: SUB_R	sub 	%r19, %r19, %r19
	.word 0xa57d0c12  ! 946: MOVR_R	movl	%r20, %r18, %r18
	.word 0xe4008003  ! 947: LDUW_R	lduw	[%r2 + %r3], %r18
	.word 0xe418a078  ! 948: LDD_I	ldd	[%r2 + 0x0078], %r18
	.word 0xa57c8412  ! 949: MOVR_R	move	%r18, %r18, %r18
	.word 0xa424c012  ! 950: SUB_R	sub 	%r19, %r18, %r18
	.word 0x0cc50001  ! 951: BRGZ	brgz  ,nt	%r20,<label_0x50001>
	.word 0xa44cc013  ! 952: MULX_R	mulx 	%r19, %r19, %r18
	.word 0xa77c9412  ! 953: MOVR_R	movcs	%r18, %r18, %r19
	.word 0xa97d3a04  ! 954: MOVR_I	movneg	%r20, 0x1, %r20
	.word 0xa57cee66  ! 955: MOVR_I	movl	%r19, 0x1, %r18
	.word 0xa4248012  ! 956: SUB_R	sub 	%r18, %r18, %r18
	.word 0xa97c8812  ! 957: MOVR_R	movle	%r18, %r18, %r20
	.word 0xe8588003  ! 958: LDX_R	ldx	[%r2 + %r3], %r20
	.word 0xe4588003  ! 959: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0x24c50003  ! 960: BRLEZ	brlez,a,nt	%r20,<label_0x50003>
	.word 0xa57c8c12  ! 961: MOVR_R	movl	%r18, %r18, %r18
	.word 0xa57d0412  ! 962: MOVR_R	move	%r20, %r18, %r18
	.word 0xa4048013  ! 963: ADD_R	add 	%r18, %r19, %r18
	.word 0xa57cd812  ! 964: MOVR_R	movneg	%r19, %r18, %r18
	.word 0x0acc8003  ! 965: BRNZ	brnz  ,pt	%r18,<label_0xc8003>
	.word 0xa57cc413  ! 966: MOVR_R	move	%r19, %r19, %r18
	.word 0xa57d0413  ! 967: MOVR_R	move	%r20, %r19, %r18
	.word 0x04c50001  ! 968: BRLEZ	brlez  ,nt	%r20,<label_0x50001>
	.word 0xa97c8c12  ! 969: MOVR_R	movl	%r18, %r18, %r20
	.word 0xa97cc412  ! 970: MOVR_R	move	%r19, %r18, %r20
	.word 0xa57ce6ec  ! 971: MOVR_I	move	%r19, 0x1, %r18
	.word 0xe8408003  ! 972: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xe458a0b0  ! 973: LDX_I	ldx	[%r2 + 0x00b0], %r18
	.word 0xa57ca9e9  ! 974: MOVR_I	movle	%r18, 0x1, %r18
	.word 0xa60d0012  ! 975: AND_R	and 	%r20, %r18, %r19
	.word 0xa77c9c12  ! 976: MOVR_R	movvs	%r18, %r18, %r19
	.word 0xa77cbf1e  ! 977: MOVR_I	movvs	%r18, 0x1, %r19
	.word 0xa57caec3  ! 978: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa8248013  ! 979: SUB_R	sub 	%r18, %r19, %r20
	.word 0xe840a0f8  ! 980: LDSW_I	ldsw	[%r2 + 0x00f8], %r20
	.word 0x04cd0001  ! 981: BRLEZ	brlez  ,pt	%r20,<label_0xd0001>
	.word 0xa57ce899  ! 982: MOVR_I	movle	%r19, 0x1, %r18
	.word 0xe8408003  ! 983: LDSW_R	ldsw	[%r2 + %r3], %r20
	.word 0xa57cac09  ! 984: MOVR_I	movl	%r18, 0x1, %r18
	.word 0xa57cc813  ! 985: MOVR_R	movle	%r19, %r19, %r18
	.word 0xe8008003  ! 986: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0x86002038  ! 988: ADD_I	add 	%r0, 0x0038, %r3
	.word 0xa57d0412  ! 989: MOVR_R	move	%r20, %r18, %r18
	.word 0xa4048013  ! 990: ADD_R	add 	%r18, %r19, %r18
	.word 0xa60d0012  ! 991: AND_R	and 	%r20, %r18, %r19
	.word 0xe4588003  ! 992: LDX_R	ldx	[%r2 + %r3], %r18
	.word 0xa57d1813  ! 993: MOVR_R	movneg	%r20, %r19, %r18
	.word 0xe8008003  ! 994: LDUW_R	lduw	[%r2 + %r3], %r20
	.word 0x84006200  ! 996: ADD_I	add 	%r1, 0x0200, %r2
	.word 0xa57cd412  ! 997: MOVR_R	movcs	%r19, %r18, %r18
	.word 0xa424c013  ! 998: SUB_R	sub 	%r19, %r19, %r18
.data
.align	256
t0_data_start_0:
	.xword	0x17ed251bf6864ee6
	.xword	0x51bc30e967abd5d6
	.xword	0x093187aad94d5ad6
	.xword	0x882552a1e2bb9290
	.xword	0x6abc2f7021fddc6b
	.xword	0xc832829694141433
	.xword	0xa0da82ec365d663e
	.xword	0xf3c2768bb8dad859
	.xword	0x43ccd9dd97d2aa6a
	.xword	0xfb92814de55ecc01
	.xword	0x4b91e880d350b343
	.xword	0xcb90837374811a95
	.xword	0xb54aaf7968d0319f
	.xword	0xcb0bdb364dbc3208
	.xword	0xf74f41be52e30662
	.xword	0x8f3992bad19ad52d
	.xword	0xbdfdf8e5bb9bcdaa
	.xword	0xf619928becfe0130
	.xword	0x860ee72bbc1ff616
	.xword	0x69bf351471c32136
	.xword	0x15b37c04f76d47a6
	.xword	0xa2b7dcfca85ad1bf
	.xword	0x962dc99e28cf7aa2
	.xword	0xe0424a40a6142295
	.xword	0xd29421b610ec3a00
	.xword	0xdd1939a00f653806
	.xword	0x42a97b584bd7da2d
	.xword	0x6043d7077428f088
	.xword	0xdf9a430e6ec2b4fb
	.xword	0xeba5c45c050857a5
	.xword	0x557ba0d674d3838d
	.xword	0x997a1b20ce60e199
	.xword	0xad5b82a8a471ad6a
	.xword	0xb3e1083c463df694
	.xword	0x3e3ff9f33cf06c4f
	.xword	0x732ac61844482020
	.xword	0x8c1c120df99d1d63
	.xword	0xc1012e303c4f221a
	.xword	0x8605388e1e155437
	.xword	0x33b2867d4b978670
	.xword	0x763cc820dd6475b8
	.xword	0xa770fd6d9b8efcd1
	.xword	0xbf1bda8e48ac72a2
	.xword	0x829136ca60137ca8
	.xword	0xb7360fbee82a7957
	.xword	0xa3673fe639e87417
	.xword	0xb0cced40a55b51ef
	.xword	0x1a1f67a6157df284
	.xword	0xf1a62fff4dd6ddbb
	.xword	0x23bca0c42b98d2d0
	.xword	0xab78f1fdb26d1c39
	.xword	0xb482d5e20a19418f
	.xword	0x375f02595bde5c53
	.xword	0xd345f15b464ecdaa
	.xword	0xe7c2897afec74f43
	.xword	0x26d3ecf4adcc46df
	.xword	0x593a6be75753a6d7
	.xword	0x3b5b82ea22e951ed
	.xword	0x07b56c88a431bc13
	.xword	0x3882de09a72a4a9b
	.xword	0x184c80958fb0b540
	.xword	0xf1b8933f9df1b333
	.xword	0x6942f32e1584b49e
	.xword	0xd29cd816dbaf46dc
	.xword	0xcc41e469903f09ba
	.xword	0x14766efb6030797d
	.xword	0x756482ea963ccf2b
	.xword	0xd330842e95dc265b
	.xword	0xd6837e6096b1594f
	.xword	0x496546ab6174c98b
	.xword	0xc7ac816f56edc4dd
	.xword	0xd6f8231c90e00e3b
	.xword	0x38f73cc9b6829162
	.xword	0x829cc88f2312647e
	.xword	0x3bdfaf2d9ed3b43c
	.xword	0x95e422b5ce63e5e9
	.xword	0x6f90729b715fe9d8
	.xword	0x80f3378e3be37855
	.xword	0xacb51e3847775881
	.xword	0x0286cc921b701288
	.xword	0x07f44a6fcad09f1d
	.xword	0x4ad2d25097cd7803
	.xword	0xc37defbff9adb244
	.xword	0xe45036447bd1311e
	.xword	0xcf9a77d99684fb1c
	.xword	0xd501b5647e52bc81
	.xword	0x4e025d58dff019eb
	.xword	0x8f4b19f2538903bc
	.xword	0xd17ec5e66c7535d2
	.xword	0xf075daa106480355
	.xword	0x7c5c645fb13309c5
	.xword	0xf105f8efdf3bb644
	.xword	0x3c2f47081895ab42
	.xword	0x194cc6d10722fc1d
	.xword	0x5527ec49e1c6a260
	.xword	0x81ff94065f906611
	.xword	0x923dbd30946c7a98
	.xword	0x89644f97d4a99124
	.xword	0xa2664a2c56785d9d
	.xword	0x7dee150c7fb6a673
	.xword	0xeeab33f594525927
	.xword	0x3f62d8db41753d1a
	.xword	0xb01f3d4c487aac0d
	.xword	0x32958f989b7c8827
	.xword	0x601a87c769ac5c42
	.xword	0xa54d3a779cbf265c
	.xword	0x1bd3611e55dcc4f8
	.xword	0xefc76e06d45af835
	.xword	0x5d0098d949f4e952
	.xword	0x7b98396706906e6d
	.xword	0x4630682832eab3fe
	.xword	0x2fa036b5387b9898
	.xword	0x56941ef49df7c9b5
	.xword	0xf285fbfceb4fd7b8
	.xword	0xe0abfb16881d5f00
	.xword	0xdc62964a29726a0f
	.xword	0x29fbab5c952eb85e
	.xword	0x106d30b9d580a7a1
	.xword	0x5a297bd1659d4b1d
	.xword	0x7e8cfd757ad0025c
	.xword	0x1d0f810d83256483
	.xword	0xe98e493fd74cb2e1
	.xword	0x2c2ed7191535805e
	.xword	0x51d9c9b8610b4b73
	.xword	0x54411f763f2abc17
	.xword	0x1c34cff86b6098b9
	.xword	0xd260ac14df4fee4e
	.xword	0x4a776915e3830a79
	.xword	0x406ccfa77a8d300a
	.xword	0x0ab1e2cec793fa8a
	.xword	0xa32c474928c93357
	.xword	0xa7a9ea05cec7beff
	.xword	0xce34156b925e30f7
	.xword	0x96df43bb23e2a161
	.xword	0xef405249ed4f6f62
	.xword	0x783d656b63b24e7a
	.xword	0xebefd8efe35650a0
	.xword	0xc4e9db628e6381fd
	.xword	0x33df12c8d268f663
	.xword	0xf9bbfcf178ff266e
	.xword	0x8ca5ffc8c42ebd79
	.xword	0x72c37b8d9def2e9b
	.xword	0x506cc79321894527
	.xword	0x0ec254f2be854d96
	.xword	0x3650ff5363a83f2c
	.xword	0xbe0739862a6df4da
	.xword	0x011ffac7594c2ba9
	.xword	0xdf39ad031fc00f5e
	.xword	0x9c796a62e17a4aad
	.xword	0x9c6f25b96fc0e6ec
	.xword	0x7aadf74dff72c136
	.xword	0x65f7497d02b33aca
	.xword	0x81429f2ec5a5f650
	.xword	0xc6435b11a78b149c
	.xword	0x4cd931708ff7e77b
	.xword	0x4ddbcf86b9091b7f
	.xword	0xa3c6e948b457b6a2
	.xword	0x38c7c4fdc84b53d7
	.xword	0x3a6e93334673e6ba
	.xword	0xcae3f0cb46b14cce
	.xword	0xca6b64a86edcccd1
	.xword	0x44bacea7c8d00627
	.xword	0x4ac6e800f873f5aa
	.xword	0x6f06c00858acee32
	.xword	0x8ab2f554e4cd94de
	.xword	0xc127fac841e779f1
	.xword	0xb924864f819c4d11
	.xword	0x7de7a2bae036695c
	.xword	0x8723e70a180f5cc8
	.xword	0xe996b6fb972020a9
	.xword	0xc164b942b7e6abe6
	.xword	0x2686a2f51ed265d9
	.xword	0x1543e426d5d43075
	.xword	0xd63bcea880ebaae4
	.xword	0x09e9dbb5a63aa54e
	.xword	0x26e658201bc1c601
	.xword	0xf8e532145552ed7d
	.xword	0x9c927b9499a6ffa6
	.xword	0x4d93d36495c74066
	.xword	0xc72a6841b6bb4376
	.xword	0xd5f5d444a39d1cb6
	.xword	0x0a7b1837c2578afa
	.xword	0xee843dcbe1deeabd
	.xword	0xed2271f7f2ceee55
	.xword	0x3fb7d6228958e088
	.xword	0x8dddc6df121c0373
	.xword	0xe44cebd44594418d
	.xword	0x9a5d221fc4b93aff
	.xword	0xb1018e287cfdb225
	.xword	0xb22d7cdd11ad6182
	.xword	0x543401e0c84d4a75
	.xword	0xc7424654d84de8e9
	.xword	0xa9a249e16243a177
	.xword	0x54310d475582cf3e
	.xword	0x690dce54515751c2
	.xword	0xc94f011a8c563062
	.xword	0x9bb911d223f59628
	.xword	0x019f77ed153936d9
	.xword	0x05896a25cc48c310
	.xword	0x63f87b6f51b7d977
	.xword	0x5f5f24d3374a005d
	.xword	0x8fde1cf481b46608
	.xword	0x104d01e6f54d6672
	.xword	0xa915eb8179269455
	.xword	0xd20de6354e11acb3
	.xword	0xcf729849c9af0427
	.xword	0xbe3386caf371b603
	.xword	0xa211c4efc0c7b2c0
	.xword	0x4c938f0614414a01
	.xword	0xae706334d836be58
	.xword	0x35d0fe18539ad884
	.xword	0x1705a809a3b034cb
	.xword	0x1661058953ccd2f8
	.xword	0xf27e5e4bbe29fb21
	.xword	0xe29cbe2bd7c8c5c7
	.xword	0x4565e8815e299648
	.xword	0x4cabc32b2d84e652
	.xword	0x4edf8058c917e870
	.xword	0x9a3bb6b3d24f2701
	.xword	0xd3da6decb7a83726
	.xword	0xf29ed772b5900a4a
	.xword	0xb2dcd9c9dbb79eb2
	.xword	0xf7b4aae5f4ab2b3f
	.xword	0xca1cf21ee3185a5d
	.xword	0xf7bdbd5bfe0cf389
	.xword	0xab396b78f4fa3132
	.xword	0xbedf0391f86adc99
	.xword	0x21044dbb3bc18732
	.xword	0xd7a4027852a4f023
	.xword	0x1acdf5f9648a9d82
	.xword	0xba8589ff266bb2cf
	.xword	0xc4ca97a7e0448195
	.xword	0xcb8f30e716ec3071
	.xword	0x99839abd3bf2d96c
	.xword	0xc247a079ccd61a7a
	.xword	0x5e2d1361afd6eedf
	.xword	0x1b8711e78bb7b432
	.xword	0xafbee39e5bfb859e
	.xword	0xfe3889d154805b25
	.xword	0x60f8dd1576f51e5d
	.xword	0x4957d6052052d929
	.xword	0x675c2a4754560d6f
	.xword	0x436339e390419b6b
	.xword	0xdec7bda7abd90edd
	.xword	0xab551676d1c79041
	.xword	0x154d98f0c356aa28
	.xword	0xdfed7df0bdcfe7c6
	.xword	0x5efdc15577271dd2
	.xword	0x6276ad8bab05eab3
	.xword	0x190dc4fc5d3f52cd
	.xword	0x5e74160c615f432d
	.xword	0x7a9492794cc9054c
	.xword	0xaa7d1568b38fcb6c
	.xword	0xca50635254f93bf6
	.xword	0xe4dc8fd70bb0bf2d
	.xword	0x1c37d12251ffe8c9
	.xword	0x182d1ea7402b6366
	.xword	0x498c84ac7ff9ef18
	.xword	0xa55d83ad3f691b82
	.xword	0x4fc9a125f112c7dd
	.xword	0xe71236f3f787c691
	.xword	0xe5c854b1e323285d
	.xword	0x71a0e578034ce29e
	.xword	0x60ec0fd475a1326f
	.xword	0x8e080782cc5cad99
	.xword	0xb5ef08a04179e902
	.xword	0xba67ae82f3a11ec5
	.xword	0xfa30553b96282658
	.xword	0x3a691f3fc741140c
	.xword	0xb0327a3ebab0e41f
	.xword	0xbf87ff8924dd11b4
	.xword	0x287c31b025b914c0
	.xword	0xf284c9b03716266f
	.xword	0xa1d0e643d30ff4ef
	.xword	0x1457dda791d03538
	.xword	0x91a443fb51588bc1
	.xword	0x3962b61b6b53f1b3
	.xword	0x1bcfd54b9ce514f3
	.xword	0x3cc16998524cc59b
	.xword	0x7552da73fbac5839
	.xword	0x68999797bccbaabc
	.xword	0x8043c29a32dc2da8
	.xword	0x9f410584a4a7ec94
	.xword	0xec17b3d66e7c8fc0
	.xword	0xd85963e695549538
	.xword	0x9b0663390dfeee7e
	.xword	0xa632f3c0cdd4cc51
	.xword	0x828ab7b807c03141
	.xword	0x34e236a8b63c5539
	.xword	0x69b0e8365a54c3ed
	.xword	0x3f770d61265045af
	.xword	0xf9a7f30df0be85f6
	.xword	0xd7fe1fb77a12b064
	.xword	0xcd78b78d776b296c
	.xword	0x18adac53a11455a5
	.xword	0x3158b51c09eb5bc7
	.xword	0xb6e4f405ffa6b57b
	.xword	0x043be658868da2ab
	.xword	0x964accabaa225f91
	.xword	0x06bcfde58ae95630
	.xword	0x7e7b0a39a30ce526
	.xword	0x1a39b9c272f60991
	.xword	0x0be709f2220bfdd2
	.xword	0x29f1040a68982240
	.xword	0xd21a2b1d26ed1af9
	.xword	0x9b751a11afcc196a
	.xword	0x510142d78e0aafc0
	.xword	0x16cdba4038b25343
	.xword	0xed1eac50b74e927a
	.xword	0x50994fd47b71c86b
	.xword	0xe79dd8816fc44698
	.xword	0xbecdb78a2a33208a
	.xword	0x1cc15745afbed288
	.xword	0x8b3d47669d8073b9
	.xword	0x6b80f4715af3393e
	.xword	0x9951826500c47129
	.xword	0x18978f0c510bf0c6
	.xword	0xc2dea1543c6c3714
	.xword	0x7ae548a083c3258f
	.xword	0x4624adcc1f177857
	.xword	0x3253a8ec0b2ece3f
	.xword	0x2991fbce80c6c604
	.xword	0xf442b8b743980402
	.xword	0x4f094e0fd7694a95
	.xword	0x25bb7dc4146cf751
	.xword	0xca60959ff103c53f
	.xword	0xdf69b20e349347ce
	.xword	0xb629992b8ab741e6
	.xword	0xdd7420602c1f8a95
	.xword	0x8908887dfe5a38d4
	.xword	0xdcf610ffe864ca6e
	.xword	0x0fb78b0f6d275f18
	.xword	0x7e1d92a009574970
	.xword	0x7fdcb95c456699e9
	.xword	0xe1570d98bf6f0118
	.xword	0xe1ba7a4758be989c
	.xword	0xde79b9ba5848414a
	.xword	0xa3bdbb9fd0bd66c0
	.xword	0x6d3366c1cea8a0bb
	.xword	0x5d0a74987e100339
	.xword	0xbbac48e0991a5b61
	.xword	0x4f549583923c431b
	.xword	0xb0a698baef01a0e3
	.xword	0x2eb97ebc0135665b
	.xword	0x7890157dfd047594
	.xword	0x4d3c8b62b5874ebf
	.xword	0x615db620a8797589
	.xword	0xf16898b50b945c9c
	.xword	0x4eda5a7f2d284a24
	.xword	0xbfdcf486be1ff3fa
	.xword	0xe138eeeb75c93c11
	.xword	0xd02013376b64eb5a
	.xword	0xe9380b831d4dca95
	.xword	0xacbb35b7b56d659f
	.xword	0x57cbfb93b0d84f03
	.xword	0xc2b0fec8c04bd713
	.xword	0xab09ff9278eadc09
	.xword	0x3ce3aa0883c600ea
	.xword	0xf90adf61f7c06fea
	.xword	0x434d54ba166eaf85
	.xword	0xf64022547d7fceb6
	.xword	0x33ede8d20531c2ee
	.xword	0x679ca1179d820897
	.xword	0xfc5f5864e5dc0f57
	.xword	0x28b642b816576864
	.xword	0xbf230e305d9ac48b
	.xword	0x8baf76d5e89c89a0
	.xword	0xc8d817353733a70d
	.xword	0xf8317274c5fea660
	.xword	0xa16919fc42899c3b
	.xword	0x669abbc2d5f1a9a0
	.xword	0xf02965dee1018c7d
	.xword	0x33a54250606ccffe
	.xword	0x44b4c5a2060c5bf8
	.xword	0xa426187087a113ab
	.xword	0x1707f834c02e1218
	.xword	0xc4822dd5695b4b03
	.xword	0xa9739218e34c04e2
	.xword	0xe40d4cdea0cbefe0
	.xword	0xeea8f515048ee4f9
	.xword	0xa7821ac8cb158588
	.xword	0x6071a84aad20eeba
	.xword	0x6c739c12a3526f2d
	.xword	0xc5c525d584b91b1e
	.xword	0xf89f1fdf894d83d3
	.xword	0xae7165ebb1e03f05
	.xword	0xa7f3045f84bd299b
	.xword	0xba8ea66bf00d5cc0
	.xword	0x4af95a320a7152af
	.xword	0x6e48f6bb46a8d657
	.xword	0xc0b8905916e06e6d
	.xword	0x143b8bd9845d21bf
	.xword	0xb2d39a582816818a
	.xword	0x38018f4e864678c4
	.xword	0x56167f83c04eb0ea
	.xword	0xe96c976a3030023c
	.xword	0x6940feeb8bd8f16a
	.xword	0xaaab54b7d641ebac
	.xword	0x99af07ec7bdfba4e
	.xword	0xbd5f70b088b23e0d
	.xword	0xe551e7025391f762
	.xword	0xa01fc9bc527e6816
	.xword	0xb4216cedf9a2e51e
	.xword	0x6fb5b8efde99640d
	.xword	0xfa6e2e4a2fc963ce
	.xword	0xdec4795c06e504b4
	.xword	0x8bd6d983821bdeaa
	.xword	0x1261830ab0e75fe0
	.xword	0x5f8b406c9322691f
	.xword	0x9910415880eae9ba
	.xword	0xc430d99901298afb
	.xword	0xe6d548163e35ead0
	.xword	0x6bed27e96a555ef1
	.xword	0xaed20280c6e97cc2
	.xword	0xb03882ef789faba4
	.xword	0x59f38bde223e1080
	.xword	0xae484afa9d4d43a4
	.xword	0x3ce822fff68538bc
	.xword	0x393e6cde0642455e
	.xword	0x8a308f7f9f640551
	.xword	0x2a0244bc72efa009
	.xword	0x1a9206725c29cb55
	.xword	0x138e9edb5bf49a8d
	.xword	0x606ff47325ff1eb8
	.xword	0x146c3674a9f011e7
	.xword	0x15bcf69c2f856a01
	.xword	0xb9f4933945f0d0b4
	.xword	0xe0b39b6a3d89087e
	.xword	0x456260d23e00f0cc
	.xword	0xa2dd2c23267db7aa
	.xword	0x0589b429e1ae12b3
	.xword	0x6b6817bd8c2cccba
	.xword	0xf47f73831d9b5763
	.xword	0x8a4e36107dac8145
	.xword	0x93acdb280ed6c4b6
	.xword	0x14e491369ef78bc8
	.xword	0xe2e8dd640dfbb77d
	.xword	0xb1f7582018f7ab39
	.xword	0x553d0178a4472a42
	.xword	0x868105e84c100fe8
	.xword	0x37f7ae58dcd306c2
	.xword	0x7ae715ef730666ea
	.xword	0xbdee7dfd91c2fb1e
	.xword	0x510b86d561c424b0
	.xword	0xeed676d58e6f6cad
	.xword	0xc76b423c34acb60d
	.xword	0xf41ebcc6fdaf8561
	.xword	0x46f8b1cba21a0e61
	.xword	0x3fe9eb64cc2e5247
	.xword	0x80b2d814f03c37f6
	.xword	0xc14ebae38ec29968
	.xword	0xe4dd01f59cbffc09
	.xword	0x471b88f878b5471a
	.xword	0x8b63f7376008d10b
	.xword	0xe7134c2bace7c946
	.xword	0xda683c431b33e6f0
	.xword	0x3ced6f1ecf4caabb
	.xword	0x4d428ad0966eb8f1
	.xword	0x957ddd03bc482682
	.xword	0x76ccccdc6187acac
	.xword	0xfe64fce12f99e9a6
	.xword	0x63b349b5d33c56f2
	.xword	0x959e05867dfc2d52
	.xword	0xac8d513df641520b
	.xword	0x6a69f7756716c90e
	.xword	0xd4577851935bb539
	.xword	0x7d57ab58342e5cde
	.xword	0xc07020f79c091932
	.xword	0x4a86a479335caa82
	.xword	0x9668deea40224d4b
	.xword	0xbd7fdd04fb91175b
	.xword	0x24646b27dffd2892
	.xword	0xcee7efc7681617be
	.xword	0x6b5c5850b0f131c3
	.xword	0x81e63efb66b8e77a
	.xword	0xb072eb2a7f6dfd23
	.xword	0xc988c4e29a7114aa
	.xword	0x25f12cc54591fc7c
	.xword	0x927ca5861fb1e306
	.xword	0xfc45eaa29478b1b2
	.xword	0x6f59271f4ffb439e
	.xword	0x322f5a8d49b3a9ac
	.xword	0xe78fc9ca3ac7aa14
	.xword	0xeaee739911443b48
	.xword	0x728e0526b8b4d1bf
	.xword	0xe780d8fceea62610
	.xword	0x6ffe8514c9accace
	.xword	0x6beda15caa233ce1
	.xword	0x94a3d1e6ca392969
	.xword	0xe23d4da9de8fa855
	.xword	0x177b635c556a32ab
	.xword	0x4f028067ad92c115
	.xword	0x8803d5c415d8b051
	.xword	0xde188008cdb07f32
	.xword	0x738428ad40013d69
	.xword	0xc6601a0564f4870b
	.xword	0x638c433817af6369
	.xword	0x2d3ecc751ffeaa62
	.xword	0x579d291c0e980ddf
	.xword	0xe4e19cef3003b295
	.xword	0xe40f95acfe474cd8
	.xword	0x3db7c035c4956b8a
	.xword	0x94771d1276e2f9cf
	.xword	0xaed178a2f67bbbad
	.xword	0xa08ab885f628d3a8
	.xword	0x9957cdb6a2618d21
	.xword	0x5f03389da47c7179
	.xword	0x1fa497124b7a60fc
	.xword	0x113ffbd3a74a6285
	.xword	0x08d8a8c168b776ba
	.xword	0x64bae055cbc60d64
	.xword	0xf10fa64e1759d060
	.xword	0x4bddc6e5875578bc
	.xword	0x92a457deaab6daa6
	.xword	0xe90552f308349f7b
	.xword	0xa3aaaee065901d3f
	.xword	0x7999039af7b54b67
	.xword	0xa89971d3daddd4f7
	.xword	0xf356a9916dfe910f
	.xword	0x5947e7c69c939259
	.xword	0x82c739e02aa17025
	.xword	0x1e6b707ff95764bb
	.xword	0xeaf9b3dc9536561e
	.xword	0xb793fa66a41aa8b2
	.xword	0xc3b4b30f7de29a50
	.xword	0xe9f106f87ab1af92
	.xword	0x2a98dda36818a2d8
	.xword	0x8e0046cc32882a6f
	.xword	0xe03936ac1b69d9b8
	.xword	0x180a9e8cf4d9cccd
	.xword	0x423b663e1b36e7d6
	.xword	0x295f2db9de0f1adc
	.xword	0x1f718ff098df1bd6
	.xword	0x7b325688936b62d4
	.xword	0xa053f772ecad65c7
	.xword	0xaf27dabce9ad1e0e
	.xword	0x4cd6d73c12273325
	.xword	0xe6fa83fc87dcea88
	.xword	0x0f5b54a7173c04fb
	.xword	0x3fcb9c31c80278c3
	.xword	0x88cd9ba71ce837f6
	.xword	0x59135d29974d728b
	.xword	0xcd6d00519f789ccf
	.xword	0xb61ca9a123fa026b
	.xword	0x01054fa4e24e252a
	.xword	0x653cfb5d2ae7c42e
	.xword	0x852dc83af996cdb7
	.xword	0x1126c288776a5915
	.xword	0x303a3b894b36f521
	.xword	0xfc630953a0e2f7ed
	.xword	0x3dd21015bec34a40
	.xword	0x8fd0fc6a9edb786b
	.xword	0x812c6f4d6f4cc9de
	.xword	0x903123b2426fe900
	.xword	0x9f845b441422347d
	.xword	0x58d9746c41ecd0b6
	.xword	0x7700f40a4c7c23e1
	.xword	0xdabc9c761c8b5522
	.xword	0x0eeb5b73292fc11c
	.xword	0x2dedadc2840ca367
	.xword	0xb9b4b1517a10ccf9
	.xword	0xb93fa78d0cee1d2d
	.xword	0x17f723ecf5f4a04f
	.xword	0x985381475ee6d563
	.xword	0x079945726ca5d170
	.xword	0x6c7a4a66f90bd03b
	.xword	0x1c8ee705df334a2e
	.xword	0xb2e1385c259f8eb8
	.xword	0x1fee8345c209a65e
	.xword	0x65125a8157091f02
	.xword	0xa127f54fc8514f53
	.xword	0xc452da6f798840c8
	.xword	0xe0e7c25a116f9b96
	.xword	0xcfbc7867d40590fe
	.xword	0x3033eeca6d959f1b
	.xword	0x7a48f6234137ccbe
	.xword	0x013d266483c3de25
	.xword	0xb88825bb0e65cbd3
	.xword	0x0843654ea0c6ea5a
	.xword	0x34acf3b14e9ff9e2
	.xword	0xe66875e89161a649
	.xword	0xd40b923a3f60a3d3
	.xword	0xcd294fd8e8137296
	.xword	0x0ee14a5ca43dac3d
	.xword	0x1a3e212dcb883122
	.xword	0x4d0cafb319fbfe53
	.xword	0xb8cf2a8acacba5b1
	.xword	0xae67418652137af5
	.xword	0x4fbb9261887dd59c
	.xword	0x6d825cb1cd7b792b
	.xword	0xe0c44e1b600fee3c
	.xword	0x546b0bcf625ca6bc
	.xword	0x76f009837a92ec53
	.xword	0x44fd43acf4e0ec45
	.xword	0x32431fa7a583da3e
	.xword	0x20a605799221364d
	.xword	0x2a6e1bfa0b04bb8c
	.xword	0xf4d79b55f919a814
	.xword	0x0b35b6dcebb94e8c
	.xword	0x9b0e3779aa234fb3
	.xword	0x28b4c9ef8a6572f0
	.xword	0xb99476c19646c4aa
	.xword	0xea6f30407e4e5101
	.xword	0x682fac286c677c53
	.xword	0x2e49bb9ce4e15548
	.xword	0x2ecbde6e291ba6ba
	.xword	0x3fbcab1e05484b8f
	.xword	0xf08a3aaa7002c59c
	.xword	0xca6ee6233cfc4978
	.xword	0xb42e402c9880e92a
	.xword	0x378c44ad1e41926a
	.xword	0x12f386cfbd3759f0
	.xword	0xf22ac2e8f7b4f405
	.xword	0xdc98352582e923fe
	.xword	0xb9f4956b61710d46
	.xword	0xab67614a2c95f177
	.xword	0xd805f1c0a7486a45
	.xword	0xd484d416df03acf1
	.xword	0x65811426cc5a4e61
	.xword	0xe8d534d793a2e07f
	.xword	0xe8a31a8a30cd733d
	.xword	0x8ea45f8ebf41d6ef
	.xword	0xf86082876179cbb1
	.xword	0xc41b1094e4595973
	.xword	0xd166766aaac0ca0a
	.xword	0x1fe8272170d2407d
	.xword	0x2305dfbb411be93c
	.xword	0xd176c994a4a4ba4d
	.xword	0x232f8a65e621d2b6
	.xword	0x06920348d718a657
	.xword	0x80104261b747f827
	.xword	0x6e28e8cf6c2fecfc
	.xword	0x41a8864ce1a3daa9
	.xword	0xa6dfc08860a21e4e
	.xword	0x7654ddbeb5d4120b
	.xword	0x1feb7a8f09918ae8
	.xword	0xc7197be622840ab5
	.xword	0xae924453822d0d7c
	.xword	0x37e7aff122e5e15c
	.xword	0x3a0de335d7412a87
	.xword	0x59f893230e7d2ac0
	.xword	0x6dea5795da2d74ff
	.xword	0x32db8493240a0616
	.xword	0x63ee743121e4570a
	.xword	0x4a05d64f3d6d89c9
	.xword	0x06ff446bda5fe72b
	.xword	0x331f60d2d8062512
	.xword	0x6789cf8dcc72173d
	.xword	0xba9a4085aa47643c
	.xword	0x5a1aa08fe1710b8d
	.xword	0xbb4c3d97ea47bd17
	.xword	0x772e21ecdc4603f4
	.xword	0xbcc6a1eb4d6829a1
	.xword	0x525342b1b22877ae
	.xword	0x2f7a6bacf61684e5
	.xword	0xb6325eb2bd83b06f
	.xword	0x7a14449d84c23960
	.xword	0xb93261c10a4e6afd
	.xword	0xf528190352462573
	.xword	0xeb9821524756e1ab
	.xword	0x4ee090add147db90
	.xword	0x2007139e20ef81e6
	.xword	0xb4b4b97af367d24e
	.xword	0x36e9b33b37395f03
	.xword	0x5b487bf2ebaf9b75
	.xword	0xa868e0e61f27e47d
	.xword	0x402f3cc648fd2845
	.xword	0x0c71ff4db6482fd1
	.xword	0x640e3433a6d34a40
	.xword	0xe4dae93a3b9107d3
	.xword	0x976b889ed1af95c8
	.xword	0xd08ef1618946963a
	.xword	0x84e1d4e028e965fc
	.xword	0x4bbd4c655e680795
	.xword	0x8fa6c0ad6bb7036e
	.xword	0x7f6b70cbc6077aaf
	.xword	0xe8b0c83555366016
	.xword	0xd3b892e9f7694bf4
	.xword	0x99d96068eb4f182d
	.xword	0xe8b7787d055f9c22
	.xword	0xf380744f572de8b7
	.xword	0x38b90c0ad3e7d323
	.xword	0xf8bd0b81573a9119
	.xword	0x5e33cd5c062853c5
	.xword	0x74f3c95e0ef71524
	.xword	0x4e5e1ca4bacb098a
	.xword	0x93acd926d0d5a2d5
	.xword	0x7328db1c1732f884
	.xword	0x7cbe5f128730f8c6
	.xword	0x3975af425f76e393
	.xword	0xc8410292e3794830
	.xword	0xfba2dc38b2bbc6f7
	.xword	0xf046083e59f16d4a
	.xword	0x04dc84c6d591879d
	.xword	0xc49b2fd200226a62
	.xword	0xffd4937c52889108
	.xword	0x2ba498050881fbe7
	.xword	0x6d03630be8cfc421
	.xword	0xeecde4031c10b6c0
	.xword	0x5db90f67cc1b19fb
	.xword	0x62976adec298272a
	.xword	0x97ddc4a7bc127da4
	.xword	0xcbe8521528f57820
	.xword	0x046fe3829b451546
	.xword	0xefb615701808039d
	.xword	0x01b0a0146696fbaa
	.xword	0x8632178433a0bc7b
	.xword	0x59f782ce056f13ed
	.xword	0xc7822241da51595a
	.xword	0xa5c5ffb3c2deb316
	.xword	0x9b8f561decd4efc6
	.xword	0x4a9cc38a1f16e243
	.xword	0xbce4f4e02bb1ad0f
	.xword	0x25d1cb1add6b3683
	.xword	0xb130691aca4f8ab8
	.xword	0x3caa048b209938b3
	.xword	0x2ae5066aad4ac55c
	.xword	0x0fb44d29c0b4980a
	.xword	0xce2144b6ea5d1869
	.xword	0x14e3953acb87dd31
	.xword	0x4e5e8b3e09df10e4
	.xword	0xc64ea4c8754acbe5
	.xword	0x1959fcbb0c16fe58
	.xword	0x895652f2814e5b74
	.xword	0xcb0e4353441e5c15
	.xword	0x09a34227da21d595
	.xword	0x5198a39f37ac807c
	.xword	0x81e77fe24a4f382c
	.xword	0xa19255c942ba730b
	.xword	0x96cc5a672d04a02f
	.xword	0xb079888e2a0254d7
	.xword	0x591f610d7b58e75f
	.xword	0x75c84375fe90f3cb
	.xword	0x003f113f215381a8
	.xword	0x6af99532b35ad444
	.xword	0xa0fbaafe6b8a4e72
	.xword	0x92a2c83899597d89
	.xword	0xcc88aeade7aae8d5
	.xword	0xf9596994007adaf2
	.xword	0x790ac73f453835e9
	.xword	0x3341d80cb5179181
	.xword	0xc9368a5b8c78eaa7
	.xword	0x3261b31e002d6532
	.xword	0xc858a8f2d500394d
	.xword	0x336a2f4ca4100fef
	.xword	0x5c2a04d1aface582
	.xword	0x8cee33da6a1bf360
	.xword	0x1ee53bba4656141a
	.xword	0x637c2c344432153a
	.xword	0x80a5272147cc3515
	.xword	0xd3e764eaf9080cbc
	.xword	0xa16452418db18925
	.xword	0x8cddc3e144390829
	.xword	0x4150af6807bf73df
	.xword	0xea386916192e78fb
	.xword	0xcee28403c787b784
	.xword	0x927b1f1ad25c4b74
	.xword	0xcf7607c478b28fcf
	.xword	0xc63b9cca4289c00e
	.xword	0x52caddc277bb16bc
	.xword	0xd66932a07c24ea96
	.xword	0x5d6379ad5aaee37e
	.xword	0x8a32b7d0b3448bc2
	.xword	0xc7c99a607cde7e24
	.xword	0x19c57952513626a5
	.xword	0x88f9e79fd46d80d2
	.xword	0x62d1a30f3155ba91
	.xword	0x0391112732bd5b59
	.xword	0x058d69b93b7e0b45
	.xword	0xc50c6a43a0b40175
	.xword	0xab3b74ff27b415ae
	.xword	0xd683328a07762d4a
	.xword	0x441e5ca363313f40
	.xword	0x022a474d78ccbdaf
	.xword	0x573e198805614935
	.xword	0xa5a9768c89ac8066
	.xword	0xd3912f22b9448be1
	.xword	0x24701c6b3617c50d
	.xword	0xe2e2311fd97aefaa
	.xword	0xc867bc96e814bacf
	.xword	0x7851aea634c6bce6
	.xword	0x0426324a0876d2b9
	.xword	0xc7bb4795b3423c62
	.xword	0x5df831619e8db444
	.xword	0xfd9a37ab1e33d5a9
	.xword	0x0f8eb3bb29e8422a
	.xword	0x5c9e9d04872d420e
	.xword	0x031840b3a93d3559
	.xword	0x900bd32e42654a64
	.xword	0xee0ed2fd4496596c
	.xword	0x98cac22af21ab03a
	.xword	0x0834ac5dcf500258
	.xword	0x392fdfe00a2df2f6
	.xword	0x9ed81a05dda7411a
	.xword	0x71332cf2fd4a5107
	.xword	0xe1a537c4f291d17b
	.xword	0x76cf827c88977fca
	.xword	0xc4384edaa60fbe9f
	.xword	0xfda4aae3b4551170
	.xword	0x3b1dd09361fe66ac
	.xword	0xc0c1da8326156ee3
	.xword	0x09a9998f2b3bcca4
	.xword	0x33210c76a9ea62d7
	.xword	0xd6e682f7439f5b16
	.xword	0x46abe7cb697592de
	.xword	0xdfbc36b4f0974c1c
	.xword	0x68b15bb977605bf6
	.xword	0xb391a33d3fbf9bce
	.xword	0x54e23adccc916606
	.xword	0x6058f4da759f62a9
	.xword	0xc319f09c0f50f540
	.xword	0x2d49e21f097f19e6
	.xword	0xa742fe2a75d51896
	.xword	0xfd782ed85e2f317f
	.xword	0x0abd9a70cfd069e0
	.xword	0x20d49f8b2978443e
	.xword	0x6f8c90d81f866e60
	.xword	0x36201186aceee6a4
	.xword	0x57f8a4bd7057dc1c
	.xword	0x8bd8ae5082102ce5
	.xword	0x96a158857888e862
	.xword	0x04f290daae975fce
	.xword	0xf322e1606abb3975
	.xword	0xdd6191bb7ac7ddcf
	.xword	0xbc87098c4e8c591a
	.xword	0x2dfce07d60a59f03
	.xword	0xd5096672c6d732a4
	.xword	0xddc99b967e60fceb
	.xword	0xfd44d8aefb7e99b3
	.xword	0x3c59feb40145001c
	.xword	0xc32dc2e2135b0b90
	.xword	0x6bdf6b1a8454d63d
	.xword	0x57e4de2e40c0ed99
	.xword	0x32a095adfe0cc98a
	.xword	0x9709e24b6c14d155
	.xword	0x5fe61c526242fb70
	.xword	0xf3173be741289120
	.xword	0x912169e7c5649d3c
	.xword	0x35705257065d1cde
	.xword	0xa77db66e1a62fc92
	.xword	0x58732e1f5fc909e3
	.xword	0x6ffcf9c4b160c1fb
	.xword	0xf1e083d58d69c9dd
	.xword	0x5ed3dbd86195b490
	.xword	0xae2fbe257ae007fe
	.xword	0x381f39f4f8b859b1
	.xword	0x6992794aedef1d3a
	.xword	0xad9752b8530d8233
	.xword	0x3cead7e210788740
	.xword	0x3f035a5d0e91b69b
	.xword	0xf4b47af6e82f7693
	.xword	0xf299fadb330d82d2
	.xword	0xea54ecb2ca38436e
	.xword	0xee3ae6955eb96de2
	.xword	0x4a36094a9d473182
	.xword	0x8fee03c01db7b93b
	.xword	0xbee8c422998dfb45
	.xword	0x9439bb2d8e5b5977
	.xword	0x46f43ebca091fe16
	.xword	0x02d21dbc91527c16
	.xword	0x17ce3e8875ff7d0d
	.xword	0xa122b739fe6a0543
	.xword	0x60e722477eaca4ff
	.xword	0x5bd55f129b363165
	.xword	0xeaeec711f09a299a
	.xword	0xa475507c3d1e825c
	.xword	0x36bf8971a9ce4b3a
	.xword	0x9ee9764ea2cb9fab
	.xword	0x7118a98d7e60d51a
	.xword	0x0b86b9fb8eff17b3
	.xword	0x98308fde8115f960
	.xword	0xae6b9dd8bd01d618
	.xword	0x0e6a2996b6d863f2
	.xword	0x76c43e14b029fdd9
	.xword	0xa7c63d0c602eea75
	.xword	0xd033db1daeed1de9
	.xword	0x13eb06f7a15a9595
	.xword	0xd6013ed78840dd41
	.xword	0x06524f31caccfc74
	.xword	0xb5c37ea1cef54a1c
	.xword	0xc4c3f5e65d758e8f
	.xword	0x792b779d9ad36d1c
	.xword	0xf03de7da398995ce
	.xword	0xc90d946462afadf5
	.xword	0x84e795f8b27eb635
	.xword	0x426178507a4c73d5
	.xword	0xc8ce844fd5aa47a8
	.xword	0x9e7553a3114c38b9
	.xword	0xdb77fa67f2558044
	.xword	0x84dcd3f43a7786b9
	.xword	0xcb0f49aa54fc8da8
	.xword	0x61711242273e80b8
	.xword	0x1bdfe2153e40632d
	.xword	0x0927151bf99446b6
	.xword	0x851f786e0021d1c0
	.xword	0xcb4b94c0667e3efe
	.xword	0x6852a25c08619bdd
	.xword	0x801586a72551646a
	.xword	0x6cc4eed3b02f6e8e
	.xword	0x6ae67f322b61b128
	.xword	0xbfdf15778044c2f3
	.xword	0xb35f690c77fe1483
	.xword	0xec9f782e4571eb6a
	.xword	0x9ff37627ecf1e7f1
	.xword	0x2ebc45aef16d9d87
	.xword	0x00d27d5800dc2a61
	.xword	0xe5d104701fdfecf8
	.xword	0x2f9ad9941f392aa7
	.xword	0x804bd9c30510b1d2
	.xword	0xbfb53b5066b8946f
	.xword	0x28b02e68293526a8
	.xword	0x0549af7eef0e3298
	.xword	0xe1e3a3838c63d9ca
	.xword	0xc5df9d0506262cd5
	.xword	0x0685499ce3db8a1f
	.xword	0x79d55cc2abeaa575
	.xword	0x05fcb3b7319b4df9
	.xword	0xc0ffe027d8bf44a8
	.xword	0x2d68abd32b332068
	.xword	0x5d6c40d4f8ded572
	.xword	0xcfa6c59c09095e77
	.xword	0x3db4c1199a4614ee
	.xword	0x170af0c5672f568d
	.xword	0x86ac7dfbae423356
	.xword	0xf0ab868eb85a3259
	.xword	0x7be01a640ae4de85
	.xword	0x2ece76b66109bc53
	.xword	0x1af7e50c72ee6aca
	.xword	0x9a68de67022d9f5c
	.xword	0x47ce0cb695da0f30
	.xword	0x4bc274f6af7f3e12
	.xword	0x25b2a79413836c04
	.xword	0xd33ec1e424d4126f
	.xword	0x1c7c72d4cd805621
	.xword	0x34147bf12d04bc0d
	.xword	0x3160507f0f192763
	.xword	0x6716425410736ba3
	.xword	0x164fb3756571e41c
	.xword	0xeaa512dd149737e6
	.xword	0xd0c529e05e02045c
	.xword	0xf34e7fcc100c13fd
	.xword	0x8228f990af734940
	.xword	0x2af765e4b6caf8a7
	.xword	0x85a328584ea59ea8
	.xword	0x8d35a0dfeece4bd6
	.xword	0xdf442e38bbb34bc6
	.xword	0x94bb27648406fcb0
	.xword	0x9be8c6493fa4acd2
	.xword	0xc37e2c3888ff9560
	.xword	0xcaaae4c9192b7a06
	.xword	0x3526277ed8209b9f
	.xword	0x83b313906e37e6ba
	.xword	0x7c1489af4ab5d1a7
	.xword	0xc2d067f4e1601393
	.xword	0x6bb5fd4499876773
	.xword	0xd9325f484c9b4251
	.xword	0xfe34f7fea5c3b82f
	.xword	0x17e3d0c1c5539ff5
	.xword	0x1e057e0974e79c8f
	.xword	0x601c344a12734f03
	.xword	0x4fc23e4754bd960a
	.xword	0x5929d12a0a25504c
	.xword	0x684501581daa336f
	.xword	0x09b0e2d7d8befdef
	.xword	0x4c1ec0c814439daf
	.xword	0x42567092ab7a5be5
	.xword	0xddb64951c058888e
	.xword	0xcb585e4910d9fe9c
	.xword	0x3e29b26c659bfbba
	.xword	0xd46bbbc820237484
	.xword	0x089a572136271862
	.xword	0x9ade6f9606da76a4
	.xword	0xdff91d7e05a3fab3
	.xword	0x842c51643ec62c23
	.xword	0x172806f36487d045
	.xword	0x53670b68819abd58
	.xword	0x7128d710410e0b7c
	.xword	0x8e21594a336d0340
	.xword	0x561c3ce5f94d530c
	.xword	0x04a56008c0f879ff
	.xword	0xf99236e243f0b041
	.xword	0x38333acc0abeea6d
	.xword	0x1b1bcbabbdaa4c48
	.xword	0x15c606601bae67c8
	.xword	0x4aea930f6ba3722e
	.xword	0x5821d7722ac2747a
	.xword	0xdd063f87219defdc
	.xword	0x335c1ae98e89c863
	.xword	0x9b060f24a7583e62
	.xword	0xfcc52dfdb5160596
	.xword	0xbf976ef6fe9c670d
	.xword	0x74e823fa94975f4f
	.xword	0xc9a281937b94f71a
	.xword	0xb8c2392e7f6d1ae7
	.xword	0x0912a733ebbed5ca
	.xword	0x3d679e43a0363dc6
	.xword	0xad476ce6a660f651
	.xword	0xc7edbd73b6a68890
	.xword	0x5fae09ccc3415682
	.xword	0xdc061356d9f55e8c
	.xword	0xf773d26c105a0439
	.xword	0x8ca1c6cff9d64d3d
	.xword	0x086377500eb55e56
	.xword	0xdde10dbdea48c92f
	.xword	0x73a9b00fa455adc0
	.xword	0xfa5b55df7ba4a628
	.xword	0x242b57aa32be7fda
	.xword	0x37f8d9ff88a4f67c
	.xword	0x37799aeeb06474a4
	.xword	0x1e612ee2d106fabf
	.xword	0x1c6856da8f52c4eb
	.xword	0x09cccec04d936085
	.xword	0x43b6f6e8ccdf3785
	.xword	0x7450e4ea592386b3
	.xword	0x16bf094e58763a08
	.xword	0xfb4a7857e7acfa18
	.xword	0x51ad1aa19801813e
	.xword	0xb46fdc0e37d3a50a
	.xword	0xd0c3ad164b175f71
	.xword	0x961e4a956c76be05
	.xword	0xe559913f30ffb08b
	.xword	0x17751dc686a441ea
	.xword	0x1fa3de0adfeaa6a8
	.xword	0xbf772bbb8137eddf
.text

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 0, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 0, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 0, 16, 16)) -> intp(3, 1, 1)



.text
		ta      T_GOOD_TRAP


#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#     IJ_bind_thread_group("diag.j", 31, th0, 0x01);
!!#     IJ_bind_thread_group("diag.j", 32, th1, 0x02);
!!#     IJ_bind_thread_group("diag.j", 33, th2, 0x04);
!!#     IJ_bind_thread_group("diag.j", 34, th3, 0x08);
!!#     IJ_bind_thread_group("diag.j", 35, th_all, 0x0f);
!!# 
!!# 	IJ_set_rvar("diag.j", 39, wt_ldst, 	"{5}");
!!# 	IJ_set_rvar("diag.j", 40, wt_ldst_ptrs, "{1}");
!!# 	IJ_set_rvar("diag.j", 41, wt_ldd_std,	"{1}");
!!# 	IJ_set_rvar("diag.j", 42, wt_rcc, 	"{10}");
!!# 	IJ_set_rvar("diag.j", 43, wt_misc, 	"{3}");
!!# 
!!# 	IJ_set_rvar("diag.j", 45, wt_mov, 	"{10}");
!!# 	IJ_set_rvar("diag.j", 46, wt_br, 	"{2}");
!!# 
!!# 	IJ_set_rvar("diag.j", 51, init_64,		"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!# 	IJ_set_ropr_fld("diag.j", 56, ijdefault, Ft_Rs1, 	"{18,19,20}");		
!!# 	IJ_set_ropr_fld("diag.j", 57, ijdefault, Ft_Rs2, 	"{18,19}");
!!# 	IJ_set_ropr_fld("diag.j", 58, ijdefault, Ft_Rd,  	"{18,19,20}");
!!# 	IJ_set_ropr_fld("diag.j", 59, ijdefault, Ft_Simm13,	"13'hrrrr");
!!# 	IJ_set_ropr_fld("diag.j", 60, ijdefault, Ft_D16,  	"{1..3}");	// BR
!!# 	IJ_set_ropr_fld("diag.j", 61, ijdefault, Ft_P,	"{0,1}");
!!# 	IJ_set_ropr_fld("diag.j", 62, ijdefault, Ft_A,  	"{0,1}");
!!# 	IJ_set_ropr_fld("diag.j", 63, ijdefault, Ft_Rcond_f2, "{1..3, 5..7}"); // BR
!!# 	IJ_set_ropr_fld("diag.j", 64, ijdefault, Ft_Rcond_f34,"{1..3, 5..7}"); // MOV
!!# 	IJ_set_ropr_fld("diag.j", 65, ijdefault, Ft_Simm10,  	"10'hrrr");	// MOVI
!!# 
!!# 	IJ_set_ropr_fld("diag.j", 67, op_ldst, Ft_Rs1, "{2}");		
!!# 	IJ_set_ropr_fld("diag.j", 68, op_ldst, Ft_Rs2, "{3}");		
!!# 	IJ_set_ropr_fld("diag.j", 69, op_ldst, Ft_Rd,  "{18,20}");		
!!# 	IJ_set_ropr_fld("diag.j", 70, op_ldst, Ft_Simm13, "13'b0_0000_rrrr_r000"); 
!!# 
!!# 	IJ_set_ropr_fld("diag.j", 72, op_ldst_r1, Ft_Rs1, "{1}");		
!!# 	IJ_set_ropr_fld("diag.j", 73, op_ldst_r1, Ft_Rs2, "{0}");		
!!# 	IJ_set_ropr_fld("diag.j", 74, op_ldst_r1, Ft_Rd,  "{2}");		
!!# 	IJ_set_ropr_fld("diag.j", 75, op_ldst_r1, Ft_Simm13, "13'b0_rrrr_0000_0000"); 
!!# 
!!# 	IJ_set_ropr_fld("diag.j", 77, op_ldst_r2, Ft_Rs1, "{0}");		
!!# 	IJ_set_ropr_fld("diag.j", 78, op_ldst_r2, Ft_Rs2, "{0}");		
!!# 	IJ_set_ropr_fld("diag.j", 79, op_ldst_r2, Ft_Rd,  "{3}");		
!!# 	IJ_set_ropr_fld("diag.j", 80, op_ldst_r2, Ft_Simm13, "13'b0_0000_rrrr_r000");
!!# 
!!# 	IJ_init_regs_by_setx ("diag.j", 85, th0, 2, 1, init_64);
!!# 
!!# 	IJ_th_fork_group("diag.j", 87, th_all);
!!# 
!!# 	IJ_printf("diag.j", 89, th_all, "\tsetx\tt%y_data_start_0,%%g0, %%r1\n");
!!# 	IJ_printf("diag.j", 90, th_all, "\tadd\t%%r1,0,%%r2\n");
!!# 	IJ_printf("diag.j", 91, th_all, "\tadd\t%%g0,0,%%r3\n");
!!# 
!!# 	return 0;
!!# }
!!# 
!!# 
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!# 	IJ_printf ("diag.j", 102, th_all, ".data\n.align\t256\nt%y_data_start_0:\n");
!!# 	int i;
!!# 
!!# 	for (i= 0; i < 1024; i++) 
!!# 	{	
!!# 		IJ_printf ("diag.j", 107, th_all, "\t.xword\t0x%016llrx\n", init_64);
!!# 	}
!!# 	IJ_printf ("diag.j", 109, th_all, ".text\n");
!!# 	IJ_th_join("diag.j", 110,0xff);
!!# 	IJ_th_start ("diag.j", 111,Seq_Start, NULL, 0);
!!# 
!!# 	return 0;
!!# }
!!# 
!!# 
!!# 
!!# %%
!!# %%section map
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!#               {
!!#                IJ_generate ("diag.j", 157, th_all, $2);
!!#               };
!!# 
!!# inst_type:	rcc	    %rvar  wt_rcc |
!!# 		ldst	    %rvar  wt_ldst |
!!# 		ldd_std   %rvar  wt_ldd_std |
!!#             misc	    %rvar  wt_misc |
!!# 		ldst_ptrs %rvar  wt_ldst_ptrs;
!!# 
!!# rcc:		op_mov	%rvar  wt_mov |
!!# 		op_br	%rvar  wt_br;
!!# 
!!# ldst:		ldst_inst %ropr	 op_ldst ;
!!# ldd_std:	tLDD_I %ropr  op_ldst |
!!# 		tLDD_R %ropr  op_ldst |
!!# 		tSTD_R %ropr  op_ldst ;
!!# 
!!# ldst_ptrs:	d0 tADD_I %ropr  op_ldst_r1 {$$=$2}|
!!# 		d1 tADD_I %ropr  op_ldst_r2 {$$=$2};
!!# 
!!# d0:		mDUMMY0;
!!# d1:		mDUMMY1;
!!# 
!!# misc:       tADD_R | tSUB_R | tMULX_R | tAND_R | tOR_R;
!!# 
!!# ldst_inst:	tLDSW_R | tLDSW_I |
!!# 		tLDUW_R | tLDUW_I |
!!# 		tLDX_R  | tLDX_I  |
!!# 		tSTX_R  | tSTX_I ;
!!# 
!!# op_mov:		tMOVR_R  | tMOVR_I;
!!# 
!!# op_br:		tBRZ | tBRLEZ | tBRLZ | tBRNZ | tBRGZ | tBRGEZ;
!!# 
!!# 
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif
