// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_14.s
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
   random seed:	404052734
   Jal tlu_multi_mix_2_hwint.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_intr_handlers.s"
#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0xe8b7bdbc2c0060fa, %g1, %g0
	setx 0x4ac7cebda79f398e, %g1, %g1
	setx 0x9d2dec05ecd95c97, %g1, %g2
	setx 0x5dca17dcbf0e4657, %g1, %g3
	setx 0xc3a9356cf52d2809, %g1, %g4
	setx 0x19cf68fdbecd3dfc, %g1, %g5
	setx 0x4268f24b43663734, %g1, %g6
	setx 0xca9111ccf4b8f480, %g1, %g7
	setx 0x3dc4eab7464c8605, %g1, %r16
	setx 0x8cfe5fcb2486d283, %g1, %r17
	setx 0x9fd314febce0f85f, %g1, %r18
	setx 0x5f631b87477479c7, %g1, %r19
	setx 0x9ad8510c533731e8, %g1, %r20
	setx 0x223822c44f6f9c15, %g1, %r21
	setx 0xb9185c51f2ed83bd, %g1, %r22
	setx 0x0178506b2747692c, %g1, %r23
	setx 0xff1e6d5263b38301, %g1, %r24
	setx 0xa9c8c50634be8eae, %g1, %r25
	setx 0xa503107f0bbb1b85, %g1, %r26
	setx 0xc61c910f86650f7b, %g1, %r27
	setx 0x4dd62f32a1bcddd2, %g1, %r28
	setx 0x1204f0d04f7eebd3, %g1, %r29
	setx 0xf3b02483f988777e, %g1, %r30
	setx 0x72324a7050188e62, %g1, %r31
	save
	setx 0x4c5c9991725e365d, %g1, %r16
	setx 0xd26d6f1c6eeb305f, %g1, %r17
	setx 0xcef4c71e08f2d7d3, %g1, %r18
	setx 0x638532446d4fbc21, %g1, %r19
	setx 0xb6289d385ea3a261, %g1, %r20
	setx 0x9f43409174c238d7, %g1, %r21
	setx 0x0dd410e73f2b5e96, %g1, %r22
	setx 0xfc70a3e6b6a0f4f4, %g1, %r23
	setx 0xbc9e9ec8da4f6258, %g1, %r24
	setx 0x6ec8faabc828fe25, %g1, %r25
	setx 0x60347ae04f3aa39f, %g1, %r26
	setx 0xad744f4de2f8c49f, %g1, %r27
	setx 0x5428b0489827e959, %g1, %r28
	setx 0x8abaeca079ca18b9, %g1, %r29
	setx 0xf51c5f17ba31473c, %g1, %r30
	setx 0x7532923e33d0083d, %g1, %r31
	save
	setx 0xac1c7476c08ee3d6, %g1, %r16
	setx 0xc244857a95d87a79, %g1, %r17
	setx 0x67562e52193ccbaf, %g1, %r18
	setx 0x54c2e242ffc66a3b, %g1, %r19
	setx 0x5f7e5bda2dec3b2a, %g1, %r20
	setx 0x452e506674f5b3d6, %g1, %r21
	setx 0x6f420c708a122f8d, %g1, %r22
	setx 0x55b086c2374233e5, %g1, %r23
	setx 0x1841d2f0ea1afa16, %g1, %r24
	setx 0x91791c0ea5967f26, %g1, %r25
	setx 0x3746b1f230eeab34, %g1, %r26
	setx 0x4ab05bcf4eddd38e, %g1, %r27
	setx 0x97dfacad03e3736b, %g1, %r28
	setx 0xbff405c4c0ed98d6, %g1, %r29
	setx 0x53ea3fe22673b47a, %g1, %r30
	setx 0x13a4e09b9a34459f, %g1, %r31
	save
	setx 0x0373c61cac0a4fa3, %g1, %r16
	setx 0xa3e6bb1d035e369d, %g1, %r17
	setx 0x730d9f389b644c6b, %g1, %r18
	setx 0x78b70549635a5eff, %g1, %r19
	setx 0x4fb7dd864f7e6bf5, %g1, %r20
	setx 0x52f566ae98ea94ae, %g1, %r21
	setx 0xf131e6d88d8ee47c, %g1, %r22
	setx 0xf4492ff9c1915d32, %g1, %r23
	setx 0x605a27930fff39a4, %g1, %r24
	setx 0xc2811b5c788df7d7, %g1, %r25
	setx 0xce42870b035b2331, %g1, %r26
	setx 0xf236f497b5d07898, %g1, %r27
	setx 0x817c54e1473438c8, %g1, %r28
	setx 0x0a3dfbf552a118c6, %g1, %r29
	setx 0xeacee509f9f6777c, %g1, %r30
	setx 0xfa9dbbfeef1e3a32, %g1, %r31
	save
	setx 0x215d555dc7cfdc81, %g1, %r16
	setx 0x13b99da27d49c29e, %g1, %r17
	setx 0x6b806d0c88396c31, %g1, %r18
	setx 0xbf35d3816a5a50ca, %g1, %r19
	setx 0x5dfe7d8ea051626c, %g1, %r20
	setx 0xeb3a8c85285d88e3, %g1, %r21
	setx 0x1bde1c2abb20806a, %g1, %r22
	setx 0x1c35d226cc4a0ded, %g1, %r23
	setx 0xa3c1d3af23c2f731, %g1, %r24
	setx 0x6cd434a845db5bef, %g1, %r25
	setx 0x1fb70938cf31c107, %g1, %r26
	setx 0x7819a7112336120b, %g1, %r27
	setx 0xf380b8ec8d205c52, %g1, %r28
	setx 0xc85020fca17f5f5c, %g1, %r29
	setx 0x19324bfea1ebf0e2, %g1, %r30
	setx 0x1cd1552a27dd438c, %g1, %r31
	save
	setx 0x0218373a61f59593, %g1, %r16
	setx 0x6b1fbabe7fc1b99a, %g1, %r17
	setx 0x0fbeaa1e1906ca55, %g1, %r18
	setx 0x07631b1335cb59ac, %g1, %r19
	setx 0xfcba4aa2f5c5e5ed, %g1, %r20
	setx 0x0ddc78a1cfd93b7e, %g1, %r21
	setx 0xcf46682f168f1d55, %g1, %r22
	setx 0x6c018db990e2bc47, %g1, %r23
	setx 0x170a3a54f4fba05e, %g1, %r24
	setx 0x73638a0918434d49, %g1, %r25
	setx 0x42301be38598f61b, %g1, %r26
	setx 0x0c28ecfdb9a56e90, %g1, %r27
	setx 0xdabf97aa259a9942, %g1, %r28
	setx 0xe13b88c4bc4982ab, %g1, %r29
	setx 0x17e162dae6451b47, %g1, %r30
	setx 0x664c66a1d9e6b553, %g1, %r31
	save
	setx 0x7bfecb7b59a86917, %g1, %r16
	setx 0x7647629e4dd01218, %g1, %r17
	setx 0x30ff63fddb1c22c4, %g1, %r18
	setx 0x99671fd8d80a232e, %g1, %r19
	setx 0x58af7b0c5d3d0950, %g1, %r20
	setx 0x414fd7fcdcf68fe5, %g1, %r21
	setx 0x53bc128fed406b15, %g1, %r22
	setx 0x24513ecba0e81e35, %g1, %r23
	setx 0x5caca9b3a7f4256a, %g1, %r24
	setx 0x3e12466f78aee441, %g1, %r25
	setx 0xbb869ac3b71ff24e, %g1, %r26
	setx 0xba6722f0e856be3c, %g1, %r27
	setx 0x7cb982185038f325, %g1, %r28
	setx 0x62d8dfe8da11f7b4, %g1, %r29
	setx 0x3e4ba6502408b967, %g1, %r30
	setx 0x9d7a0a6423c34201, %g1, %r31
	save
	setx 0x17dde358a50eb34e, %g1, %r16
	setx 0xc2b2526641521303, %g1, %r17
	setx 0x4de3332b9e84a764, %g1, %r18
	setx 0xa805a428df0cf49b, %g1, %r19
	setx 0xa05b2a25d8b266a2, %g1, %r20
	setx 0x022a8c4660d0860c, %g1, %r21
	setx 0x7cf60c17e22b96c8, %g1, %r22
	setx 0xd2a0d51c70787cd0, %g1, %r23
	setx 0xb930c899ef174926, %g1, %r24
	setx 0xc601eb92a36cde05, %g1, %r25
	setx 0x04a2b8e4f844ca44, %g1, %r26
	setx 0x87048eff3577f0e9, %g1, %r27
	setx 0x67647a98530d2556, %g1, %r28
	setx 0xf8465bbb54d3a386, %g1, %r29
	setx 0x7bddf46d3a7514f2, %g1, %r30
	setx 0x6f951ae4d27f9d48, %g1, %r31
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
	.word 0xb9e4a03b  ! 1: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e4e1a2  ! 5: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e4e0ba  ! 6: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x8995a080  ! 8: WRPR_TICK_I	wrpr	%r22, 0x0080, %tick
	.word 0xbd50c000  ! 11: RDPR_TT	<illegal instruction>
	setx	data_start_1, %g1, %r20
	.word 0xb9e4a07a  ! 18: SAVE_I	save	%r18, 0x0001, %r28
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 37)
	.word 0xb5e42166  ! 20: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe5a030  ! 21: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe421ec  ! 22: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x81956161  ! 23: WRPR_TPC_I	wrpr	%r21, 0x0161, %tpc
	.word 0x8395e147  ! 25: WRPR_TNPC_I	wrpr	%r23, 0x0147, %tnpc
	.word 0xb5e4207d  ! 26: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb37d2401  ! 27: MOVR_I	movre	%r20, 0x1, %r25
	.word 0xba85c000  ! 29: ADDcc_R	addcc 	%r23, %r0, %r29
	.word 0xbbe52014  ! 31: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbcc5c000  ! 32: ADDCcc_R	addccc 	%r23, %r0, %r30
	.word 0xbfe5214a  ! 33: SAVE_I	save	%r20, 0x0001, %r31
	setx	data_start_4, %g1, %r22
	.word 0xbcc5c000  ! 38: ADDCcc_R	addccc 	%r23, %r0, %r30
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 20)
	mov	0, %r12
	.word 0x8f930000  ! 49: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8795a05a  ! 51: WRPR_TT_I	wrpr	%r22, 0x005a, %tt
	.word 0xb5e4a09f  ! 52: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe5e1c6  ! 54: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e4a1d8  ! 63: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbe9d8000  ! 65: XORcc_R	xorcc 	%r22, %r0, %r31
	.word 0xbbe5e1a9  ! 68: SAVE_I	save	%r23, 0x0001, %r29
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 36)
	.word 0xbde4608e  ! 73: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9500000  ! 75: RDPR_TPC	<illegal instruction>
	.word 0xb7e46068  ! 76: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb89d4000  ! 77: XORcc_R	xorcc 	%r21, %r0, %r28
	.word 0xbbe521b6  ! 78: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde5e041  ! 79: SAVE_I	save	%r23, 0x0001, %r30
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 3)
	.word 0xb3e5e1f8  ! 82: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbc8c6030  ! 86: ANDcc_I	andcc 	%r17, 0x0030, %r30
	setx	0x47c0db6e00002e83, %g1, %r10
	.word 0x819a8000  ! 87: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb951c000  ! 95: RDPR_TL	<illegal instruction>
	.word 0xbe3c0000  ! 97: XNOR_R	xnor 	%r16, %r0, %r31
	.word 0xb1518000  ! 98: RDPR_PSTATE	<illegal instruction>
	.word 0xbc358000  ! 102: ORN_R	orn 	%r22, %r0, %r30
	.word 0x85942025  ! 103: WRPR_TSTATE_I	wrpr	%r16, 0x0025, %tstate
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 29)
	.word 0xb1e5a1a9  ! 107: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x9194e1c7  ! 113: WRPR_PIL_I	wrpr	%r19, 0x01c7, %pil
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 23)
	.word 0xb0b44000  ! 115: ORNcc_R	orncc 	%r17, %r0, %r24
	.word 0xb9e5602f  ! 116: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e4a163  ! 117: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e5e1eb  ! 120: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x839521de  ! 121: WRPR_TNPC_I	wrpr	%r20, 0x01de, %tnpc
	.word 0xb034a18e  ! 126: SUBC_I	orn 	%r18, 0x018e, %r24
	.word 0xbbe5a166  ! 131: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e4a1a7  ! 134: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e5a104  ! 135: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbf508000  ! 136: RDPR_TSTATE	<illegal instruction>
	.word 0x8794204e  ! 137: WRPR_TT_I	wrpr	%r16, 0x004e, %tt
	.word 0xbea40000  ! 138: SUBcc_R	subcc 	%r16, %r0, %r31
	.word 0xbfe560dc  ! 140: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e46009  ! 141: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e5204e  ! 147: SAVE_I	save	%r20, 0x0001, %r25
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 7)
	.word 0xb9500000  ! 151: RDPR_TPC	<illegal instruction>
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 31)
	.word 0xbfe5a180  ! 157: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e4618b  ! 171: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbd508000  ! 172: RDPR_TSTATE	<illegal instruction>
	.word 0xb52dc000  ! 173: SLL_R	sll 	%r23, %r0, %r26
	.word 0xb9e46079  ! 176: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e56006  ! 177: SAVE_I	save	%r21, 0x0001, %r25
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 22)
	.word 0xbfe561b8  ! 186: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e5603b  ! 190: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e5a032  ! 193: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e520d9  ! 194: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe46183  ! 195: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8394a118  ! 196: WRPR_TNPC_I	wrpr	%r18, 0x0118, %tnpc
	mov	2, %r12
	.word 0x8f930000  ! 197: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e5e168  ! 199: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e46015  ! 202: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x8395a068  ! 203: WRPR_TNPC_I	wrpr	%r22, 0x0068, %tnpc
	.word 0xb1e4e1c9  ! 205: SAVE_I	save	%r19, 0x0001, %r24
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 9)
	.word 0xb9504000  ! 212: RDPR_TNPC	<illegal instruction>
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 3)
	.word 0xbd540000  ! 217: RDPR_GL	<illegal instruction>
	.word 0xbde5e071  ! 218: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbf508000  ! 220: RDPR_TSTATE	<illegal instruction>
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbc3561d9  ! 229: SUBC_I	orn 	%r21, 0x01d9, %r30
	.word 0xb5e46192  ! 230: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e42109  ! 233: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e52036  ! 235: SAVE_I	save	%r20, 0x0001, %r24
	setx	data_start_4, %g1, %r19
	mov	2, %r12
	.word 0x8f930000  ! 238: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x65bac0f500001cd4, %g1, %r10
	.word 0x839a8000  ! 239: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e4e038  ! 246: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e42001  ! 248: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbf510000  ! 249: RDPR_TICK	<illegal instruction>
	.word 0xb1518000  ! 256: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe42068  ! 260: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e5606e  ! 263: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe52027  ! 264: SAVE_I	save	%r20, 0x0001, %r31
	mov	0, %r12
	.word 0x8f930000  ! 265: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e5a1b5  ! 266: SAVE_I	save	%r22, 0x0001, %r24
	setx	data_start_5, %g1, %r18
	setx	data_start_3, %g1, %r21
	setx	0xc6e4b2eb0000dcd4, %g1, %r10
	.word 0x839a8000  ! 270: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb29560b5  ! 271: ORcc_I	orcc 	%r21, 0x00b5, %r25
	.word 0xb3504000  ! 273: RDPR_TNPC	<illegal instruction>
	.word 0xb7480000  ! 274: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb9e4e099  ! 275: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe460fd  ! 277: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e4a0ab  ! 279: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e521d9  ! 280: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e5613e  ! 283: SAVE_I	save	%r21, 0x0001, %r25
	mov	2, %r12
	.word 0xa1930000  ! 288: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb504000  ! 290: RDPR_TNPC	<illegal instruction>
	.word 0xbb510000  ! 291: RDPR_TICK	<illegal instruction>
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 33)
	setx	0xf62876020000fa49, %g1, %r10
	.word 0x819a8000  ! 293: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d94e1cb  ! 298: WRPR_PSTATE_I	wrpr	%r19, 0x01cb, %pstate
	.word 0x8595a04c  ! 309: WRPR_TSTATE_I	wrpr	%r22, 0x004c, %tstate
	.word 0xb534e001  ! 312: SRL_I	srl 	%r19, 0x0001, %r26
	.word 0xb1510000  ! 316: RDPR_TICK	<illegal instruction>
	.word 0xbbe4e16d  ! 317: SAVE_I	save	%r19, 0x0001, %r29
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb3e5609f  ! 319: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e5a066  ! 324: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e5e0bb  ! 327: SAVE_I	save	%r23, 0x0001, %r27
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 6)
	.word 0x85956139  ! 330: WRPR_TSTATE_I	wrpr	%r21, 0x0139, %tstate
	.word 0xbbe4a091  ! 333: SAVE_I	save	%r18, 0x0001, %r29
	mov	2, %r12
	.word 0xa1930000  ! 336: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb351c000  ! 337: RDPR_TL	<illegal instruction>
	.word 0xb89460ea  ! 338: ORcc_I	orcc 	%r17, 0x00ea, %r28
	.word 0x8395e072  ! 344: WRPR_TNPC_I	wrpr	%r23, 0x0072, %tnpc
	.word 0xb7e4e0bf  ! 345: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e420be  ! 352: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3504000  ! 355: RDPR_TNPC	<illegal instruction>
	.word 0xbf7d4400  ! 360: MOVR_R	movre	%r21, %r0, %r31
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 24)
	.word 0xb7e4a13f  ! 363: SAVE_I	save	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8794e1ec  ! 369: WRPR_TT_I	wrpr	%r19, 0x01ec, %tt
	mov	0, %r12
	.word 0xa1930000  ! 371: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbe461de  ! 372: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8394a0fc  ! 374: WRPR_TNPC_I	wrpr	%r18, 0x00fc, %tnpc
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 36)
	.word 0xb1e5a139  ! 377: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb42ce033  ! 380: ANDN_I	andn 	%r19, 0x0033, %r26
	.word 0xb3e5e0c9  ! 384: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e421b2  ! 387: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e4e03b  ! 388: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e5a0e4  ! 391: SAVE_I	save	%r22, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x839461f7  ! 405: WRPR_TNPC_I	wrpr	%r17, 0x01f7, %tnpc
	.word 0xbfe56163  ! 406: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e421c0  ! 407: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbb51c000  ! 410: RDPR_TL	<illegal instruction>
	.word 0xb5e4a1a6  ! 411: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe5e0f3  ! 413: SAVE_I	save	%r23, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e460d0  ! 417: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e5a077  ! 422: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e52023  ! 423: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xba9560bb  ! 424: ORcc_I	orcc 	%r21, 0x00bb, %r29
	mov	2, %r12
	.word 0x8f930000  ! 427: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7e5a015  ! 429: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde42193  ! 432: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e5e05f  ! 434: SAVE_I	save	%r23, 0x0001, %r25
	setx	0x129dfdcb0000bcd4, %g1, %r10
	.word 0x839a8000  ! 435: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e420e8  ! 439: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x5fa5a4b40000d991, %g1, %r10
	.word 0x839a8000  ! 443: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5540000  ! 444: RDPR_GL	<illegal instruction>
	.word 0xbfe560b6  ! 445: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x81956165  ! 446: WRPR_TPC_I	wrpr	%r21, 0x0165, %tpc
	.word 0xbde5e02f  ! 447: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e4e0c4  ! 452: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e52037  ! 454: SAVE_I	save	%r20, 0x0001, %r24
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 3)
	.word 0xbde521f4  ! 456: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde4a057  ! 461: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e4e109  ! 463: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb8bce06d  ! 465: XNORcc_I	xnorcc 	%r19, 0x006d, %r28
	.word 0xb73c0000  ! 467: SRA_R	sra 	%r16, %r0, %r27
	.word 0xb3e42049  ! 468: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e5e013  ! 474: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde560f2  ! 476: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1504000  ! 479: RDPR_TNPC	<illegal instruction>
	.word 0xba348000  ! 482: ORN_R	orn 	%r18, %r0, %r29
	.word 0xb3e521c1  ! 484: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3500000  ! 486: RDPR_TPC	<illegal instruction>
	.word 0xbbe5e19c  ! 489: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e4607a  ! 497: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde421e2  ! 499: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbb518000  ! 503: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e42063  ! 504: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e520eb  ! 505: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x87952086  ! 508: WRPR_TT_I	wrpr	%r20, 0x0086, %tt
	.word 0xbde5a1fb  ! 511: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe421c7  ! 512: SAVE_I	save	%r16, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 17)
	setx	0x7d4707cf00002855, %g1, %r10
	.word 0x819a8000  ! 517: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1518000  ! 518: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e46016  ! 519: SAVE_I	save	%r17, 0x0001, %r26
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 37)
	.word 0xbde4a1cf  ! 521: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe421a0  ! 523: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbf51c000  ! 526: RDPR_TL	<illegal instruction>
	.word 0x9195a164  ! 527: WRPR_PIL_I	wrpr	%r22, 0x0164, %pil
	.word 0xbd520000  ! 528: RDPR_PIL	<illegal instruction>
	.word 0x8594e0e7  ! 530: WRPR_TSTATE_I	wrpr	%r19, 0x00e7, %tstate
	.word 0xb6c42011  ! 532: ADDCcc_I	addccc 	%r16, 0x0011, %r27
	.word 0xbde461af  ! 534: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x712e76710000ee0e, %g1, %r10
	.word 0x839a8000  ! 540: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 39)
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 35)
	.word 0xbbe4e020  ! 552: SAVE_I	save	%r19, 0x0001, %r29
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 28)
	.word 0xb9e5e07d  ! 554: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x89946142  ! 555: WRPR_TICK_I	wrpr	%r17, 0x0142, %tick
	.word 0xb9e4e169  ! 556: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e5e16d  ! 557: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e5e089  ! 558: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e5e1ae  ! 559: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe5e027  ! 562: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb4054000  ! 565: ADD_R	add 	%r21, %r0, %r26
	.word 0xb550c000  ! 570: RDPR_TT	<illegal instruction>
	.word 0xb1e52065  ! 574: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e5a0d7  ! 575: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe4a045  ! 579: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e5a058  ! 580: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5518000  ! 581: RDPR_PSTATE	<illegal instruction>
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 34)
	.word 0xbaa52060  ! 583: SUBcc_I	subcc 	%r20, 0x0060, %r29
	.word 0xbde5a0da  ! 587: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde4a00c  ! 590: SAVE_I	save	%r18, 0x0001, %r30
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 24)
	.word 0xb9e56185  ! 599: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e420cb  ! 600: SAVE_I	save	%r16, 0x0001, %r28
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 22)
	.word 0xb3e46011  ! 602: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe520c4  ! 603: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe460f2  ! 604: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e4211d  ! 605: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e4e1a1  ! 606: SAVE_I	save	%r19, 0x0001, %r24
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 15)
	.word 0xb5e42070  ! 612: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e4e13a  ! 614: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbb51c000  ! 617: RDPR_TL	<illegal instruction>
	.word 0xb9e52002  ! 621: SAVE_I	save	%r20, 0x0001, %r28
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 33)
	.word 0x8995e043  ! 624: WRPR_TICK_I	wrpr	%r23, 0x0043, %tick
	.word 0x89956187  ! 625: WRPR_TICK_I	wrpr	%r21, 0x0187, %tick
	.word 0xbbe4e09b  ! 626: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8195a08d  ! 630: WRPR_TPC_I	wrpr	%r22, 0x008d, %tpc
	.word 0xb1518000  ! 631: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e4213e  ! 636: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbc94e1b0  ! 637: ORcc_I	orcc 	%r19, 0x01b0, %r30
	.word 0xbfe52095  ! 639: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7500000  ! 645: RDPR_TPC	<illegal instruction>
	setx	0x284917cc0000d9d8, %g1, %r10
	.word 0x819a8000  ! 646: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb234e137  ! 651: ORN_I	orn 	%r19, 0x0137, %r25
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbbe4e1f7  ! 655: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb32c2001  ! 656: SLL_I	sll 	%r16, 0x0001, %r25
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 24)
	.word 0xbfe56176  ! 660: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1500000  ! 664: RDPR_TPC	<illegal instruction>
	.word 0xbf518000  ! 665: RDPR_PSTATE	<illegal instruction>
	.word 0x879460bd  ! 667: WRPR_TT_I	wrpr	%r17, 0x00bd, %tt
	.word 0xb7e560ab  ! 669: SAVE_I	save	%r21, 0x0001, %r27
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 33)
	.word 0x8395a1ae  ! 675: WRPR_TNPC_I	wrpr	%r22, 0x01ae, %tnpc
	.word 0xb7e4e029  ! 677: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe5a087  ! 678: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde4a09b  ! 680: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde4a0ff  ! 683: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb8350000  ! 686: ORN_R	orn 	%r20, %r0, %r28
	.word 0xb351c000  ! 687: RDPR_TL	<illegal instruction>
	setx	data_start_5, %g1, %r16
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbfe5a083  ! 696: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e46046  ! 698: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 11)
	.word 0xb7e4a1fe  ! 707: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e56139  ! 708: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe4e116  ! 709: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e421ec  ! 711: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e561af  ! 713: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e561ec  ! 714: SAVE_I	save	%r21, 0x0001, %r26
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 21)
	.word 0xb1e5e180  ! 716: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe46160  ! 717: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3540000  ! 718: RDPR_GL	<illegal instruction>
	.word 0xbbe5200a  ! 720: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x879420c0  ! 722: WRPR_TT_I	wrpr	%r16, 0x00c0, %tt
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, f)
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb5480000  ! 730: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbde4a11f  ! 736: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e52042  ! 738: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbc1ce016  ! 739: XOR_I	xor 	%r19, 0x0016, %r30
	.word 0xb3e5614b  ! 742: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1510000  ! 743: RDPR_TICK	<illegal instruction>
	.word 0xb751c000  ! 744: RDPR_TL	<illegal instruction>
	.word 0xb7e421e5  ! 747: SAVE_I	save	%r16, 0x0001, %r27
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbde5a160  ! 753: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe560b2  ! 755: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e5a0e4  ! 756: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe5a0bd  ! 758: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe46030  ! 763: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xba84e0ee  ! 764: ADDcc_I	addcc 	%r19, 0x00ee, %r29
	.word 0x899561bb  ! 768: WRPR_TICK_I	wrpr	%r21, 0x01bb, %tick
	.word 0xb1e4a012  ! 769: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb6a56136  ! 771: SUBcc_I	subcc 	%r21, 0x0136, %r27
	.word 0xb3e4a013  ! 772: SAVE_I	save	%r18, 0x0001, %r25
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 9)
	.word 0xb3e4605b  ! 777: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e4a0b6  ! 780: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe52103  ! 781: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3520000  ! 783: RDPR_PIL	<illegal instruction>
	setx	data_start_6, %g1, %r22
	.word 0xb21ca1f5  ! 786: XOR_I	xor 	%r18, 0x01f5, %r25
	.word 0xb7e52062  ! 792: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe4a008  ! 798: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8394a075  ! 799: WRPR_TNPC_I	wrpr	%r18, 0x0075, %tnpc
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 4)
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 30)
	.word 0xb5e5e04f  ! 808: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9500000  ! 809: RDPR_TPC	<illegal instruction>
	.word 0xb80521c8  ! 810: ADD_I	add 	%r20, 0x01c8, %r28
	setx	data_start_0, %g1, %r21
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 7)
	.word 0xb1e52149  ! 817: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde5a14a  ! 819: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x89946122  ! 822: WRPR_TICK_I	wrpr	%r17, 0x0122, %tick
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 6)
	.word 0xbb480000  ! 827: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb7e56169  ! 828: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x8d95e1f2  ! 829: WRPR_PSTATE_I	wrpr	%r23, 0x01f2, %pstate
	.word 0xbd3c5000  ! 831: SRAX_R	srax	%r17, %r0, %r30
	.word 0xb2040000  ! 835: ADD_R	add 	%r16, %r0, %r25
	.word 0xb9508000  ! 836: RDPR_TSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r16
	.word 0x8995610b  ! 840: WRPR_TICK_I	wrpr	%r21, 0x010b, %tick
	.word 0xbbe4e197  ! 841: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9500000  ! 842: RDPR_TPC	<illegal instruction>
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 22)
	.word 0xb1e520cf  ! 845: SAVE_I	save	%r20, 0x0001, %r24
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 11)
	.word 0xb93d2001  ! 848: SRA_I	sra 	%r20, 0x0001, %r28
	.word 0xb3e5a1e6  ! 849: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e56061  ! 851: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb57d2401  ! 854: MOVR_I	movre	%r20, 0x1, %r26
	.word 0x8395a157  ! 856: WRPR_TNPC_I	wrpr	%r22, 0x0157, %tnpc
	.word 0xbcc4619d  ! 860: ADDCcc_I	addccc 	%r17, 0x019d, %r30
	.word 0xbde4e030  ! 862: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe4e102  ! 863: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8195e112  ! 864: WRPR_TPC_I	wrpr	%r23, 0x0112, %tpc
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 21)
	.word 0xb5500000  ! 869: RDPR_TPC	<illegal instruction>
	.word 0x8995a03d  ! 870: WRPR_TICK_I	wrpr	%r22, 0x003d, %tick
	.word 0x8194a177  ! 873: WRPR_TPC_I	wrpr	%r18, 0x0177, %tpc
	.word 0xb3358000  ! 875: SRL_R	srl 	%r22, %r0, %r25
	.word 0xbca42136  ! 876: SUBcc_I	subcc 	%r16, 0x0136, %r30
	.word 0xb9e5a053  ! 880: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e4e0a9  ! 883: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde561f6  ! 884: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb234e04e  ! 885: ORN_I	orn 	%r19, 0x004e, %r25
	.word 0xb1e521a6  ! 889: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb550c000  ! 891: RDPR_TT	<illegal instruction>
	.word 0xbd2d9000  ! 892: SLLX_R	sllx	%r22, %r0, %r30
hwintr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_45), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb1e42076  ! 900: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe56033  ! 901: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e4a15b  ! 906: SAVE_I	save	%r18, 0x0001, %r26
	setx	data_start_1, %g1, %r17
	.word 0xb7e4219d  ! 912: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbf358000  ! 914: SRL_R	srl 	%r22, %r0, %r31
	setx	data_start_6, %g1, %r17
	mov	2, %r12
	.word 0xa1930000  ! 918: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbe42189  ! 919: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb750c000  ! 925: RDPR_TT	<illegal instruction>
	.word 0xb3e46042  ! 926: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb08c0000  ! 927: ANDcc_R	andcc 	%r16, %r0, %r24
	.word 0xb9520000  ! 929: RDPR_PIL	<illegal instruction>
hwintr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_46), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb094c000  ! 934: ORcc_R	orcc 	%r19, %r0, %r24
	.word 0xb695c000  ! 935: ORcc_R	orcc 	%r23, %r0, %r27
	.word 0xb7e4e17d  ! 936: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1520000  ! 942: RDPR_PIL	<illegal instruction>
	.word 0x9195e1f4  ! 944: WRPR_PIL_I	wrpr	%r23, 0x01f4, %pil
	.word 0xb9e4e121  ! 947: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe5600b  ! 950: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb2444000  ! 952: ADDC_R	addc 	%r17, %r0, %r25
	.word 0xbbe5611f  ! 954: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe46132  ! 957: SAVE_I	save	%r17, 0x0001, %r29
hwintr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_47), 16, 16)) -> intp(0, 0, 28)
	.word 0xb0b44000  ! 960: ORNcc_R	orncc 	%r17, %r0, %r24
	.word 0xb7e4218d  ! 961: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x2169836700009a81, %g1, %r10
	.word 0x839a8000  ! 963: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_48), 16, 16)) -> intp(0, 0, 13)
	.word 0xbf510000  ! 967: RDPR_TICK	<illegal instruction>
	.word 0xba9de13d  ! 969: XORcc_I	xorcc 	%r23, 0x013d, %r29
	setx	data_start_7, %g1, %r18
hwintr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_49), 16, 16)) -> intp(0, 0, 36)
	.word 0xbfe46087  ! 981: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e5e0e7  ! 984: SAVE_I	save	%r23, 0x0001, %r25
hwintr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_50), 16, 16)) -> intp(0, 0, 6)
	.word 0xb7e521a5  ! 987: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1504000  ! 988: RDPR_TNPC	<illegal instruction>
	.word 0xbb2d7001  ! 995: SLLX_I	sllx	%r21, 0x0001, %r29
hwintr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_51), 16, 16)) -> intp(0, 0, 24)
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
	.word 0xfe2d21d1  ! 2: STB_I	stb	%r31, [%r20 + 0x01d1]
	.word 0xf33d4000  ! 4: STDF_R	std	%f25, [%r0, %r21]
	.word 0x8995e1cc  ! 8: WRPR_TICK_I	wrpr	%r23, 0x01cc, %tick
	.word 0xf02c6126  ! 9: STB_I	stb	%r24, [%r17 + 0x0126]
	.word 0xb950c000  ! 11: RDPR_TT	rdpr	%tt, %r28
	setx	data_start_6, %g1, %r20
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 8)
	.word 0x819421eb  ! 23: WRPR_TPC_I	wrpr	%r16, 0x01eb, %tpc
	.word 0xf0240000  ! 24: STW_R	stw	%r24, [%r16 + %r0]
	.word 0x8394e000  ! 25: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb77de401  ! 27: MOVR_I	movre	%r23, 0x1, %r27
	.word 0xb6850000  ! 29: ADDcc_R	addcc 	%r20, %r0, %r27
	.word 0xf53de166  ! 30: STDF_I	std	%f26, [0x0166, %r23]
	.word 0xb8c40000  ! 32: ADDCcc_R	addccc 	%r16, %r0, %r28
	.word 0xf225a14c  ! 35: STW_I	stw	%r25, [%r22 + 0x014c]
	setx	data_start_3, %g1, %r16
	.word 0xbcc44000  ! 38: ADDCcc_R	addccc 	%r17, %r0, %r30
	.word 0xf6358000  ! 39: STH_R	sth	%r27, [%r22 + %r0]
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 14)
	.word 0xf225a10c  ! 44: STW_I	stw	%r25, [%r22 + 0x010c]
	.word 0xf02d4000  ! 48: STB_R	stb	%r24, [%r21 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 49: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8795603d  ! 51: WRPR_TT_I	wrpr	%r21, 0x003d, %tt
	.word 0xf13ce0d5  ! 62: STDF_I	std	%f24, [0x00d5, %r19]
	.word 0xfe3d0000  ! 64: STD_R	std	%r31, [%r20 + %r0]
	.word 0xb69d0000  ! 65: XORcc_R	xorcc 	%r20, %r0, %r27
	.word 0xf0740000  ! 66: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xfa3cc000  ! 67: STD_R	std	%r29, [%r19 + %r0]
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 3a)
	.word 0xb9500000  ! 75: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xbc9c0000  ! 77: XORcc_R	xorcc 	%r16, %r0, %r30
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, d)
	.word 0xf13d201c  ! 81: STDF_I	std	%f24, [0x001c, %r20]
	.word 0xb48da09e  ! 86: ANDcc_I	andcc 	%r22, 0x009e, %r26
	setx	0x72b1f01500007ac1, %g1, %r10
	.word 0x819a8000  ! 87: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf83cc000  ! 93: STD_R	std	%r28, [%r19 + %r0]
	.word 0xfc344000  ! 94: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xbb51c000  ! 95: RDPR_TL	rdpr	%tl, %r29
	.word 0xb63d4000  ! 97: XNOR_R	xnor 	%r21, %r0, %r27
	.word 0xb1518000  ! 98: RDPR_PSTATE	<illegal instruction>
	.word 0xb8340000  ! 102: ORN_R	orn 	%r16, %r0, %r28
	.word 0x8594208c  ! 103: WRPR_TSTATE_I	wrpr	%r16, 0x008c, %tstate
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 0)
	.word 0xf03d0000  ! 106: STD_R	std	%r24, [%r20 + %r0]
	.word 0xf23ce0ae  ! 109: STD_I	std	%r25, [%r19 + 0x00ae]
	.word 0xf53d20fd  ! 111: STDF_I	std	%f26, [0x00fd, %r20]
	.word 0x9195e059  ! 113: WRPR_PIL_I	wrpr	%r23, 0x0059, %pil
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, c)
	.word 0xbeb58000  ! 115: ORNcc_R	orncc 	%r22, %r0, %r31
	.word 0x83946117  ! 121: WRPR_TNPC_I	wrpr	%r17, 0x0117, %tnpc
	.word 0xfa3ca16f  ! 125: STD_I	std	%r29, [%r18 + 0x016f]
	.word 0xba346198  ! 126: SUBC_I	orn 	%r17, 0x0198, %r29
	.word 0xfa2dc000  ! 127: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xfc2da120  ! 129: STB_I	stb	%r30, [%r22 + 0x0120]
	.word 0xff3ca0cc  ! 130: STDF_I	std	%f31, [0x00cc, %r18]
	.word 0xbb508000  ! 136: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0x87956121  ! 137: WRPR_TT_I	wrpr	%r21, 0x0121, %tt
	.word 0xbca48000  ! 138: SUBcc_R	subcc 	%r18, %r0, %r30
	.word 0xf0254000  ! 139: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xf13dc000  ! 142: STDF_R	std	%f24, [%r0, %r23]
	.word 0xf0758000  ! 148: STX_R	stx	%r24, [%r22 + %r0]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 12)
	.word 0xfb3d20f6  ! 150: STDF_I	std	%f29, [0x00f6, %r20]
	.word 0xb5500000  ! 151: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xf43cc000  ! 153: STD_R	std	%r26, [%r19 + %r0]
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfd3d21b9  ! 155: STDF_I	std	%f30, [0x01b9, %r20]
	.word 0xfe352101  ! 156: STH_I	sth	%r31, [%r20 + 0x0101]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf63c0000  ! 165: STD_R	std	%r27, [%r16 + %r0]
	.word 0xfa3ce1fc  ! 170: STD_I	std	%r29, [%r19 + 0x01fc]
	.word 0xbf508000  ! 172: RDPR_TSTATE	<illegal instruction>
	.word 0xb92cc000  ! 173: SLL_R	sll 	%r19, %r0, %r28
	.word 0xf4758000  ! 180: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf635c000  ! 182: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xf6754000  ! 183: STX_R	stx	%r27, [%r21 + %r0]
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 1a)
	.word 0x8394a073  ! 196: WRPR_TNPC_I	wrpr	%r18, 0x0073, %tnpc
	mov	2, %r12
	.word 0x8f930000  ! 197: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf634616d  ! 198: STH_I	sth	%r27, [%r17 + 0x016d]
	.word 0xfc2d0000  ! 200: STB_R	stb	%r30, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8395a068  ! 203: WRPR_TNPC_I	wrpr	%r22, 0x0068, %tnpc
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf225a17e  ! 207: STW_I	stw	%r25, [%r22 + 0x017e]
	.word 0xfa2c60f9  ! 209: STB_I	stb	%r29, [%r17 + 0x00f9]
	.word 0xfe35c000  ! 211: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xb3504000  ! 212: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xf43c4000  ! 214: STD_R	std	%r26, [%r17 + %r0]
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 19)
	.word 0xb3540000  ! 217: RDPR_GL	<illegal instruction>
	.word 0xb7508000  ! 220: RDPR_TSTATE	<illegal instruction>
	.word 0xfc3d60d4  ! 224: STD_I	std	%r30, [%r21 + 0x00d4]
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 17)
	.word 0xf22ce1cd  ! 227: STB_I	stb	%r25, [%r19 + 0x01cd]
	.word 0xbe35a1e9  ! 229: SUBC_I	orn 	%r22, 0x01e9, %r31
	.word 0xf4248000  ! 232: STW_R	stw	%r26, [%r18 + %r0]
	setx	data_start_1, %g1, %r16
	.word 0xf424618d  ! 237: STW_I	stw	%r26, [%r17 + 0x018d]
	mov	1, %r12
	.word 0x8f930000  ! 238: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x2818114700003cc8, %g1, %r10
	.word 0x839a8000  ! 239: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf6244000  ! 241: STW_R	stw	%r27, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5510000  ! 249: RDPR_TICK	rdpr	%tick, %r26
	.word 0xfe35a103  ! 252: STH_I	sth	%r31, [%r22 + 0x0103]
	.word 0xfd3cc000  ! 254: STDF_R	std	%f30, [%r0, %r19]
	.word 0xbb518000  ! 256: RDPR_PSTATE	<illegal instruction>
	.word 0xfc34a1ff  ! 257: STH_I	sth	%r30, [%r18 + 0x01ff]
	.word 0xf47461e7  ! 261: STX_I	stx	%r26, [%r17 + 0x01e7]
	.word 0xf034a084  ! 262: STH_I	sth	%r24, [%r18 + 0x0084]
	mov	2, %r12
	.word 0x8f930000  ! 265: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf4244000  ! 267: STW_R	stw	%r26, [%r17 + %r0]
	setx	data_start_2, %g1, %r16
	setx	data_start_6, %g1, %r22
	setx	0xd515df650000af5d, %g1, %r10
	.word 0x839a8000  ! 270: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb295a060  ! 271: ORcc_I	orcc 	%r22, 0x0060, %r25
	.word 0xf23c4000  ! 272: STD_R	std	%r25, [%r17 + %r0]
	.word 0xb5504000  ! 273: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xbb480000  ! 274: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf43ca054  ! 278: STD_I	std	%r26, [%r18 + 0x0054]
	.word 0xfc3ca140  ! 286: STD_I	std	%r30, [%r18 + 0x0140]
	.word 0xfe35611e  ! 287: STH_I	sth	%r31, [%r21 + 0x011e]
	mov	0, %r12
	.word 0xa1930000  ! 288: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5504000  ! 290: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xb3510000  ! 291: RDPR_TICK	<illegal instruction>
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, e)
	setx	0x71d5d3d000006c82, %g1, %r10
	.word 0x819a8000  ! 293: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfb3c206b  ! 296: STDF_I	std	%f29, [0x006b, %r16]
	.word 0x8d94e0dc  ! 298: WRPR_PSTATE_I	wrpr	%r19, 0x00dc, %pstate
	.word 0xf47460b0  ! 299: STX_I	stx	%r26, [%r17 + 0x00b0]
	.word 0xf03c8000  ! 303: STD_R	std	%r24, [%r18 + %r0]
	.word 0xf8340000  ! 308: STH_R	sth	%r28, [%r16 + %r0]
	.word 0x8594a0ec  ! 309: WRPR_TSTATE_I	wrpr	%r18, 0x00ec, %tstate
	.word 0xfc3de0f9  ! 311: STD_I	std	%r30, [%r23 + 0x00f9]
	.word 0xbd346001  ! 312: SRL_I	srl 	%r17, 0x0001, %r30
	.word 0xf2254000  ! 313: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xb3510000  ! 316: RDPR_TICK	rdpr	%tick, %r25
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf82de087  ! 323: STB_I	stb	%r28, [%r23 + 0x0087]
	.word 0xfb3d0000  ! 326: STDF_R	std	%f29, [%r0, %r20]
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 5)
	.word 0x8594206c  ! 330: WRPR_TSTATE_I	wrpr	%r16, 0x006c, %tstate
	mov	1, %r12
	.word 0xa1930000  ! 336: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb951c000  ! 337: RDPR_TL	rdpr	%tl, %r28
	.word 0xb694e10c  ! 338: ORcc_I	orcc 	%r19, 0x010c, %r27
	.word 0xf63d0000  ! 340: STD_R	std	%r27, [%r20 + %r0]
	.word 0xf6248000  ! 342: STW_R	stw	%r27, [%r18 + %r0]
	.word 0x8394a069  ! 344: WRPR_TNPC_I	wrpr	%r18, 0x0069, %tnpc
	.word 0xfe3d609a  ! 348: STD_I	std	%r31, [%r21 + 0x009a]
	.word 0xf23d6177  ! 349: STD_I	std	%r25, [%r21 + 0x0177]
	.word 0xfc7521f4  ! 350: STX_I	stx	%r30, [%r20 + 0x01f4]
	.word 0xf0348000  ! 354: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xbd504000  ! 355: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xf02c60c2  ! 359: STB_I	stb	%r24, [%r17 + 0x00c2]
	.word 0xb97d8400  ! 360: MOVR_R	movre	%r22, %r0, %r28
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 24)
	.word 0xff3d2194  ! 364: STDF_I	std	%f31, [0x0194, %r20]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2748000  ! 368: STX_R	stx	%r25, [%r18 + %r0]
	.word 0x8795609c  ! 369: WRPR_TT_I	wrpr	%r21, 0x009c, %tt
	mov	1, %r12
	.word 0xa1930000  ! 371: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf275a0bb  ! 373: STX_I	stx	%r25, [%r22 + 0x00bb]
	.word 0x839460aa  ! 374: WRPR_TNPC_I	wrpr	%r17, 0x00aa, %tnpc
	.word 0xfd3c0000  ! 375: STDF_R	std	%f30, [%r0, %r16]
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 2a)
	.word 0xb02d2147  ! 380: ANDN_I	andn 	%r20, 0x0147, %r24
	.word 0xf33c0000  ! 382: STDF_R	std	%f25, [%r0, %r16]
	.word 0xf33c4000  ! 383: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf63dc000  ! 386: STD_R	std	%r27, [%r23 + %r0]
	.word 0xfe244000  ! 389: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xfd3c0000  ! 396: STDF_R	std	%f30, [%r0, %r16]
	.word 0xf42ce15b  ! 398: STB_I	stb	%r26, [%r19 + 0x015b]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x83956113  ! 405: WRPR_TNPC_I	wrpr	%r21, 0x0113, %tnpc
	.word 0xfe34c000  ! 408: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xb151c000  ! 410: RDPR_TL	rdpr	%tl, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc2c0000  ! 415: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xfc34c000  ! 418: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xf674e1d6  ! 419: STX_I	stx	%r27, [%r19 + 0x01d6]
	.word 0xb495212c  ! 424: ORcc_I	orcc 	%r20, 0x012c, %r26
	mov	1, %r12
	.word 0x8f930000  ! 427: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf33ce0ac  ! 430: STDF_I	std	%f25, [0x00ac, %r19]
	setx	0xba60979300007f85, %g1, %r10
	.word 0x839a8000  ! 435: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf2340000  ! 436: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xf82ca145  ! 437: STB_I	stb	%r28, [%r18 + 0x0145]
	.word 0xf87461d6  ! 440: STX_I	stx	%r28, [%r17 + 0x01d6]
	.word 0xf73c0000  ! 441: STDF_R	std	%f27, [%r0, %r16]
	setx	0x531ab9600001d08, %g1, %r10
	.word 0x839a8000  ! 443: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd540000  ! 444: RDPR_GL	rdpr	%-, %r30
	.word 0x8195a0a2  ! 446: WRPR_TPC_I	wrpr	%r22, 0x00a2, %tpc
	.word 0xfc3c21f2  ! 448: STD_I	std	%r30, [%r16 + 0x01f2]
	.word 0xf0758000  ! 449: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xfc758000  ! 453: STX_R	stx	%r30, [%r22 + %r0]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 33)
	.word 0xff3ca120  ! 457: STDF_I	std	%f31, [0x0120, %r18]
	.word 0xf835c000  ! 464: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xbcbce1f6  ! 465: XNORcc_I	xnorcc 	%r19, 0x01f6, %r30
	.word 0xb73c0000  ! 467: SRA_R	sra 	%r16, %r0, %r27
	.word 0xf22421dc  ! 471: STW_I	stw	%r25, [%r16 + 0x01dc]
	.word 0xf2340000  ! 477: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xbf504000  ! 479: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf8746121  ! 481: STX_I	stx	%r28, [%r17 + 0x0121]
	.word 0xb8340000  ! 482: ORN_R	orn 	%r16, %r0, %r28
	.word 0xb5500000  ! 486: RDPR_TPC	<illegal instruction>
	.word 0xf025c000  ! 488: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xff3d4000  ! 494: STDF_R	std	%f31, [%r0, %r21]
	.word 0xfc2c619f  ! 496: STB_I	stb	%r30, [%r17 + 0x019f]
	.word 0xb1518000  ! 503: RDPR_PSTATE	<illegal instruction>
	.word 0xf0248000  ! 506: STW_R	stw	%r24, [%r18 + %r0]
	.word 0x879521e6  ! 508: WRPR_TT_I	wrpr	%r20, 0x01e6, %tt
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 2c)
	setx	0x84a0c0aa00000e54, %g1, %r10
	.word 0x819a8000  ! 517: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3518000  ! 518: RDPR_PSTATE	rdpr	%pstate, %r25
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 2)
	.word 0xf62d0000  ! 522: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xb951c000  ! 526: RDPR_TL	<illegal instruction>
	.word 0x9195e1a2  ! 527: WRPR_PIL_I	wrpr	%r23, 0x01a2, %pil
	.word 0xbb520000  ! 528: RDPR_PIL	rdpr	%pil, %r29
	.word 0x859420b7  ! 530: WRPR_TSTATE_I	wrpr	%r16, 0x00b7, %tstate
	.word 0xff3d2008  ! 531: STDF_I	std	%f31, [0x0008, %r20]
	.word 0xb0c4e18f  ! 532: ADDCcc_I	addccc 	%r19, 0x018f, %r24
	.word 0xf62c8000  ! 533: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xfa750000  ! 538: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xf03c8000  ! 539: STD_R	std	%r24, [%r18 + %r0]
	setx	0x331d45b0000ef41, %g1, %r10
	.word 0x839a8000  ! 540: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc248000  ! 541: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xfa3de1e2  ! 545: STD_I	std	%r29, [%r23 + 0x01e2]
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 14)
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf33c4000  ! 551: STDF_R	std	%f25, [%r0, %r17]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 24)
	.word 0x89952005  ! 555: WRPR_TICK_I	wrpr	%r20, 0x0005, %tick
	.word 0xfc2ca08d  ! 560: STB_I	stb	%r30, [%r18 + 0x008d]
	.word 0xbe050000  ! 565: ADD_R	add 	%r20, %r0, %r31
	.word 0xbf50c000  ! 570: RDPR_TT	rdpr	%tt, %r31
	.word 0xf6746063  ! 572: STX_I	stx	%r27, [%r17 + 0x0063]
	.word 0xfe346143  ! 573: STH_I	sth	%r31, [%r17 + 0x0143]
	.word 0xbd518000  ! 581: RDPR_PSTATE	<illegal instruction>
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, f)
	.word 0xb8a4604b  ! 583: SUBcc_I	subcc 	%r17, 0x004b, %r28
	.word 0xf874e11a  ! 585: STX_I	stx	%r28, [%r19 + 0x011a]
	.word 0xfe244000  ! 594: STW_R	stw	%r31, [%r17 + %r0]
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 12)
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 21)
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 10)
	.word 0xbf51c000  ! 617: RDPR_TL	<illegal instruction>
	.word 0xf674e147  ! 620: STX_I	stx	%r27, [%r19 + 0x0147]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 39)
	.word 0x899421a5  ! 624: WRPR_TICK_I	wrpr	%r16, 0x01a5, %tick
	.word 0x8994e1fc  ! 625: WRPR_TICK_I	wrpr	%r19, 0x01fc, %tick
	.word 0xfc2c0000  ! 627: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xfa7561b9  ! 629: STX_I	stx	%r29, [%r21 + 0x01b9]
	.word 0x8195e11f  ! 630: WRPR_TPC_I	wrpr	%r23, 0x011f, %tpc
	.word 0xbf518000  ! 631: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xb69560f5  ! 637: ORcc_I	orcc 	%r21, 0x00f5, %r27
	.word 0xfc75c000  ! 638: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xf53da00c  ! 640: STDF_I	std	%f26, [0x000c, %r22]
	.word 0xbb500000  ! 645: RDPR_TPC	<illegal instruction>
	setx	0x23234cbf0000de92, %g1, %r10
	.word 0x819a8000  ! 646: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb035611e  ! 651: ORN_I	orn 	%r21, 0x011e, %r24
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 22)
	.word 0xb52c2001  ! 656: SLL_I	sll 	%r16, 0x0001, %r26
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, c)
	.word 0xfc74a0bc  ! 659: STX_I	stx	%r30, [%r18 + 0x00bc]
	.word 0xfe256036  ! 663: STW_I	stw	%r31, [%r21 + 0x0036]
	.word 0xb3500000  ! 664: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xb9518000  ! 665: RDPR_PSTATE	<illegal instruction>
	.word 0x8795e158  ! 667: WRPR_TT_I	wrpr	%r23, 0x0158, %tt
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 15)
	.word 0xfe75a1e5  ! 674: STX_I	stx	%r31, [%r22 + 0x01e5]
	.word 0x839560b9  ! 675: WRPR_TNPC_I	wrpr	%r21, 0x00b9, %tnpc
	.word 0xf23d4000  ! 676: STD_R	std	%r25, [%r21 + %r0]
	.word 0xb2344000  ! 686: ORN_R	orn 	%r17, %r0, %r25
	.word 0xbb51c000  ! 687: RDPR_TL	rdpr	%tl, %r29
	setx	data_start_0, %g1, %r19
	.word 0xf624c000  ! 691: STW_R	stw	%r27, [%r19 + %r0]
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf82420f5  ! 695: STW_I	stw	%r28, [%r16 + 0x00f5]
	.word 0xf53d8000  ! 697: STDF_R	std	%f26, [%r0, %r22]
	.word 0xf23d2113  ! 702: STD_I	std	%r25, [%r20 + 0x0113]
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 9)
	.word 0xf275c000  ! 705: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xf475a008  ! 710: STX_I	stx	%r26, [%r22 + 0x0008]
	.word 0xf02c0000  ! 712: STB_R	stb	%r24, [%r16 + %r0]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 24)
	.word 0xbb540000  ! 718: RDPR_GL	<illegal instruction>
	.word 0xf82c60ca  ! 719: STB_I	stb	%r28, [%r17 + 0x00ca]
	.word 0x87946035  ! 722: WRPR_TT_I	wrpr	%r17, 0x0035, %tt
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 9)
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 20)
	.word 0xf4748000  ! 725: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xf8242199  ! 727: STW_I	stw	%r28, [%r16 + 0x0199]
	.word 0xfa24a042  ! 728: STW_I	stw	%r29, [%r18 + 0x0042]
	.word 0xbb480000  ! 730: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfa24e066  ! 731: STW_I	stw	%r29, [%r19 + 0x0066]
	.word 0xf73de12e  ! 732: STDF_I	std	%f27, [0x012e, %r23]
	.word 0xf62c8000  ! 734: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xfa35c000  ! 737: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xbe1d2147  ! 739: XOR_I	xor 	%r20, 0x0147, %r31
	.word 0xf224e10c  ! 740: STW_I	stw	%r25, [%r19 + 0x010c]
	.word 0xbb510000  ! 743: RDPR_TICK	<illegal instruction>
	.word 0xb951c000  ! 744: RDPR_TL	<illegal instruction>
	.word 0xfa750000  ! 745: STX_R	stx	%r29, [%r20 + %r0]
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 38)
	.word 0xff3d61d4  ! 752: STDF_I	std	%f31, [0x01d4, %r21]
	.word 0xf2752026  ! 754: STX_I	stx	%r25, [%r20 + 0x0026]
	.word 0xf8742056  ! 757: STX_I	stx	%r28, [%r16 + 0x0056]
	.word 0xf635c000  ! 762: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xb884e1a0  ! 764: ADDcc_I	addcc 	%r19, 0x01a0, %r28
	.word 0x8995e0db  ! 768: WRPR_TICK_I	wrpr	%r23, 0x00db, %tick
	.word 0xf025e11e  ! 770: STW_I	stw	%r24, [%r23 + 0x011e]
	.word 0xb0a461d0  ! 771: SUBcc_I	subcc 	%r17, 0x01d0, %r24
	.word 0xfc248000  ! 773: STW_R	stw	%r30, [%r18 + %r0]
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb7520000  ! 783: RDPR_PIL	rdpr	%pil, %r27
	.word 0xf22c605c  ! 784: STB_I	stb	%r25, [%r17 + 0x005c]
	setx	data_start_1, %g1, %r17
	.word 0xb21d61c7  ! 786: XOR_I	xor 	%r21, 0x01c7, %r25
	.word 0xf02c6087  ! 787: STB_I	stb	%r24, [%r17 + 0x0087]
	.word 0xfc758000  ! 788: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xfa2ca1fb  ! 790: STB_I	stb	%r29, [%r18 + 0x01fb]
	.word 0xf23c8000  ! 794: STD_R	std	%r25, [%r18 + %r0]
	.word 0xfc34e1b8  ! 796: STH_I	sth	%r30, [%r19 + 0x01b8]
	.word 0x8395e014  ! 799: WRPR_TNPC_I	wrpr	%r23, 0x0014, %tnpc
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 1b)
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, f)
	.word 0xfe35c000  ! 807: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xb3500000  ! 809: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xbc05a0e0  ! 810: ADD_I	add 	%r22, 0x00e0, %r30
	.word 0xfc342104  ! 811: STH_I	sth	%r30, [%r16 + 0x0104]
	setx	data_start_3, %g1, %r17
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf274c000  ! 815: STX_R	stx	%r25, [%r19 + %r0]
	.word 0x8995e175  ! 822: WRPR_TICK_I	wrpr	%r23, 0x0175, %tick
	.word 0xf6750000  ! 825: STX_R	stx	%r27, [%r20 + %r0]
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 2a)
	.word 0xb7480000  ! 827: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x8d9560b8  ! 829: WRPR_PSTATE_I	wrpr	%r21, 0x00b8, %pstate
	.word 0xfa2ca0e4  ! 830: STB_I	stb	%r29, [%r18 + 0x00e4]
	.word 0xb53d5000  ! 831: SRAX_R	srax	%r21, %r0, %r26
	.word 0xfd3c20b0  ! 832: STDF_I	std	%f30, [0x00b0, %r16]
	.word 0xfa75a090  ! 833: STX_I	stx	%r29, [%r22 + 0x0090]
	.word 0xbe05c000  ! 835: ADD_R	add 	%r23, %r0, %r31
	.word 0xb9508000  ! 836: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf2754000  ! 837: STX_R	stx	%r25, [%r21 + %r0]
	setx	data_start_0, %g1, %r16
	.word 0x8995a17c  ! 840: WRPR_TICK_I	wrpr	%r22, 0x017c, %tick
	.word 0xbb500000  ! 842: RDPR_TPC	rdpr	%tpc, %r29
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 7)
	.word 0xfc340000  ! 846: STH_R	sth	%r30, [%r16 + %r0]
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, b)
	.word 0xb13d6001  ! 848: SRA_I	sra 	%r21, 0x0001, %r24
	.word 0xf6246103  ! 850: STW_I	stw	%r27, [%r17 + 0x0103]
	.word 0xfe3c0000  ! 852: STD_R	std	%r31, [%r16 + %r0]
	.word 0xff3d4000  ! 853: STDF_R	std	%f31, [%r0, %r21]
	.word 0xbd7d6401  ! 854: MOVR_I	movre	%r21, 0x1, %r30
	.word 0xf035e05c  ! 855: STH_I	sth	%r24, [%r23 + 0x005c]
	.word 0x8394604c  ! 856: WRPR_TNPC_I	wrpr	%r17, 0x004c, %tnpc
	.word 0xb8c4a19e  ! 860: ADDCcc_I	addccc 	%r18, 0x019e, %r28
	.word 0xf075c000  ! 861: STX_R	stx	%r24, [%r23 + %r0]
	.word 0x819420a3  ! 864: WRPR_TPC_I	wrpr	%r16, 0x00a3, %tpc
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf874c000  ! 866: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf53d2153  ! 867: STDF_I	std	%f26, [0x0153, %r20]
	.word 0xb1500000  ! 869: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x8995a106  ! 870: WRPR_TICK_I	wrpr	%r22, 0x0106, %tick
	.word 0x8194619f  ! 873: WRPR_TPC_I	wrpr	%r17, 0x019f, %tpc
	.word 0xff3c8000  ! 874: STDF_R	std	%f31, [%r0, %r18]
	.word 0xb535c000  ! 875: SRL_R	srl 	%r23, %r0, %r26
	.word 0xb6a5e090  ! 876: SUBcc_I	subcc 	%r23, 0x0090, %r27
	.word 0xfe2c0000  ! 877: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xf83ce11a  ! 879: STD_I	std	%r28, [%r19 + 0x011a]
	.word 0xb834a1da  ! 885: ORN_I	orn 	%r18, 0x01da, %r28
	.word 0xbb50c000  ! 891: RDPR_TT	rdpr	%tt, %r29
	.word 0xb72cd000  ! 892: SLLX_R	sllx	%r19, %r0, %r27
hwintr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_45), 16, 16)) -> intp(3, 0, 15)
	.word 0xfe3ce0e2  ! 896: STD_I	std	%r31, [%r19 + 0x00e2]
	.word 0xf2348000  ! 897: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xff3d60c1  ! 902: STDF_I	std	%f31, [0x00c1, %r21]
	.word 0xf23da033  ! 905: STD_I	std	%r25, [%r22 + 0x0033]
	setx	data_start_5, %g1, %r22
	.word 0xb1354000  ! 914: SRL_R	srl 	%r21, %r0, %r24
	setx	data_start_6, %g1, %r23
	mov	2, %r12
	.word 0xa1930000  ! 918: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfd3d61d1  ! 922: STDF_I	std	%f30, [0x01d1, %r21]
	.word 0xbf50c000  ! 925: RDPR_TT	rdpr	%tt, %r31
	.word 0xb48c8000  ! 927: ANDcc_R	andcc 	%r18, %r0, %r26
	.word 0xb1520000  ! 929: RDPR_PIL	<illegal instruction>
	.word 0xfc3ce0d1  ! 930: STD_I	std	%r30, [%r19 + 0x00d1]
	.word 0xf33ca1ba  ! 932: STDF_I	std	%f25, [0x01ba, %r18]
hwintr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_46), 16, 16)) -> intp(3, 0, 28)
	.word 0xb8948000  ! 934: ORcc_R	orcc 	%r18, %r0, %r28
	.word 0xb0948000  ! 935: ORcc_R	orcc 	%r18, %r0, %r24
	.word 0xff3c0000  ! 937: STDF_R	std	%f31, [%r0, %r16]
	.word 0xf875a1ba  ! 938: STX_I	stx	%r28, [%r22 + 0x01ba]
	.word 0xf02460b0  ! 939: STW_I	stw	%r24, [%r17 + 0x00b0]
	.word 0xbd520000  ! 942: RDPR_PIL	<illegal instruction>
	.word 0xfb3ce102  ! 943: STDF_I	std	%f29, [0x0102, %r19]
	.word 0x9194a111  ! 944: WRPR_PIL_I	wrpr	%r18, 0x0111, %pil
	.word 0xf73d2010  ! 945: STDF_I	std	%f27, [0x0010, %r20]
	.word 0xf22d2176  ! 951: STB_I	stb	%r25, [%r20 + 0x0176]
	.word 0xbc454000  ! 952: ADDC_R	addc 	%r21, %r0, %r30
	.word 0xf03de080  ! 955: STD_I	std	%r24, [%r23 + 0x0080]
hwintr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_47), 16, 16)) -> intp(3, 0, 19)
	.word 0xb2b50000  ! 960: ORNcc_R	orncc 	%r20, %r0, %r25
	setx	0x2e1733090000b90e, %g1, %r10
	.word 0x839a8000  ! 963: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_48), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf4754000  ! 966: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xb1510000  ! 967: RDPR_TICK	rdpr	%tick, %r24
	.word 0xb09da078  ! 969: XORcc_I	xorcc 	%r22, 0x0078, %r24
	.word 0xf62c8000  ! 971: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xfe3c0000  ! 972: STD_R	std	%r31, [%r16 + %r0]
	setx	data_start_0, %g1, %r21
	.word 0xfc350000  ! 975: STH_R	sth	%r30, [%r20 + %r0]
hwintr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_49), 16, 16)) -> intp(3, 0, 39)
	.word 0xf4344000  ! 980: STH_R	sth	%r26, [%r17 + %r0]
hwintr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_50), 16, 16)) -> intp(3, 0, 25)
	.word 0xbb504000  ! 988: RDPR_TNPC	<illegal instruction>
	.word 0xf02d8000  ! 989: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xfa2c2057  ! 991: STB_I	stb	%r29, [%r16 + 0x0057]
	.word 0xf4258000  ! 992: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xb92d3001  ! 995: SLLX_I	sllx	%r20, 0x0001, %r28
hwintr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_51), 16, 16)) -> intp(3, 0, 28)
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
	.word 0xf8056004  ! 3: LDUW_I	lduw	[%r21 + 0x0004], %r28
	.word 0x8994e05e  ! 8: WRPR_TICK_I	wrpr	%r19, 0x005e, %tick
	.word 0xf4442058  ! 10: LDSW_I	ldsw	[%r16 + 0x0058], %r26
	.word 0xb750c000  ! 11: RDPR_TT	<illegal instruction>
	.word 0xfc0d6184  ! 12: LDUB_I	ldub	[%r21 + 0x0184], %r30
	.word 0xfe0d4000  ! 13: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xf255611e  ! 15: LDSH_I	ldsh	[%r21 + 0x011e], %r25
	setx	data_start_6, %g1, %r16
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 20)
	.word 0x819521e2  ! 23: WRPR_TPC_I	wrpr	%r20, 0x01e2, %tpc
	.word 0x8395e1f3  ! 25: WRPR_TNPC_I	wrpr	%r23, 0x01f3, %tnpc
	.word 0xb37d6401  ! 27: MOVR_I	movre	%r21, 0x1, %r25
	.word 0xbe854000  ! 29: ADDcc_R	addcc 	%r21, %r0, %r31
	.word 0xb0c4c000  ! 32: ADDCcc_R	addccc 	%r19, %r0, %r24
	setx	data_start_3, %g1, %r16
	.word 0xf04520fb  ! 37: LDSW_I	ldsw	[%r20 + 0x00fb], %r24
	.word 0xb8c5c000  ! 38: ADDCcc_R	addccc 	%r23, %r0, %r28
	.word 0xf605a136  ! 40: LDUW_I	lduw	[%r22 + 0x0136], %r27
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 14)
	.word 0xf11ca0ff  ! 45: LDDF_I	ldd	[%r18, 0x00ff], %f24
	.word 0xf6144000  ! 46: LDUH_R	lduh	[%r17 + %r0], %r27
	mov	0, %r12
	.word 0x8f930000  ! 49: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x879421b9  ! 51: WRPR_TT_I	wrpr	%r16, 0x01b9, %tt
	.word 0xf60de034  ! 55: LDUB_I	ldub	[%r23 + 0x0034], %r27
	.word 0xf41c6040  ! 57: LDD_I	ldd	[%r17 + 0x0040], %r26
	.word 0xbc9cc000  ! 65: XORcc_R	xorcc 	%r19, %r0, %r30
	.word 0xfc5c610b  ! 69: LDX_I	ldx	[%r17 + 0x010b], %r30
	.word 0xf40ce0b7  ! 70: LDUB_I	ldub	[%r19 + 0x00b7], %r26
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf6440000  ! 74: LDSW_R	ldsw	[%r16 + %r0], %r27
	.word 0xb9500000  ! 75: RDPR_TPC	<illegal instruction>
	.word 0xb09d0000  ! 77: XORcc_R	xorcc 	%r20, %r0, %r24
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 31)
	.word 0xf815a1b1  ! 84: LDUH_I	lduh	[%r22 + 0x01b1], %r28
	.word 0xb68d60ae  ! 86: ANDcc_I	andcc 	%r21, 0x00ae, %r27
	setx	0x57e1e6750000ea94, %g1, %r10
	.word 0x819a8000  ! 87: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf8458000  ! 89: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xf41d4000  ! 90: LDD_R	ldd	[%r21 + %r0], %r26
	.word 0xb951c000  ! 95: RDPR_TL	<illegal instruction>
	.word 0xba3cc000  ! 97: XNOR_R	xnor 	%r19, %r0, %r29
	.word 0xbd518000  ! 98: RDPR_PSTATE	<illegal instruction>
	.word 0xfc0c2101  ! 99: LDUB_I	ldub	[%r16 + 0x0101], %r30
	.word 0xf2448000  ! 101: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xb4354000  ! 102: ORN_R	orn 	%r21, %r0, %r26
	.word 0x8595e15f  ! 103: WRPR_TSTATE_I	wrpr	%r23, 0x015f, %tstate
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 34)
	.word 0xf00d618c  ! 108: LDUB_I	ldub	[%r21 + 0x018c], %r24
	.word 0xf2548000  ! 110: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xfe14e0c4  ! 112: LDUH_I	lduh	[%r19 + 0x00c4], %r31
	.word 0x9194e1aa  ! 113: WRPR_PIL_I	wrpr	%r19, 0x01aa, %pil
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, b)
	.word 0xbcb5c000  ! 115: ORNcc_R	orncc 	%r23, %r0, %r30
	.word 0xf71d60d3  ! 118: LDDF_I	ldd	[%r21, 0x00d3], %f27
	.word 0xf4056081  ! 119: LDUW_I	lduw	[%r21 + 0x0081], %r26
	.word 0x839520fa  ! 121: WRPR_TNPC_I	wrpr	%r20, 0x00fa, %tnpc
	.word 0xf2450000  ! 124: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xb834e161  ! 126: SUBC_I	orn 	%r19, 0x0161, %r28
	.word 0xf005204b  ! 132: LDUW_I	lduw	[%r20 + 0x004b], %r24
	.word 0xfa552026  ! 133: LDSH_I	ldsh	[%r20 + 0x0026], %r29
	.word 0xbd508000  ! 136: RDPR_TSTATE	<illegal instruction>
	.word 0x87952034  ! 137: WRPR_TT_I	wrpr	%r20, 0x0034, %tt
	.word 0xb0a4c000  ! 138: SUBcc_R	subcc 	%r19, %r0, %r24
	.word 0xf204c000  ! 143: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xf60460a6  ! 145: LDUW_I	lduw	[%r17 + 0x00a6], %r27
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 17)
	.word 0xbb500000  ! 151: RDPR_TPC	<illegal instruction>
	.word 0xf44d0000  ! 152: LDSB_R	ldsb	[%r20 + %r0], %r26
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfc154000  ! 158: LDUH_R	lduh	[%r21 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf644e055  ! 161: LDSW_I	ldsw	[%r19 + 0x0055], %r27
	.word 0xf855e031  ! 162: LDSH_I	ldsh	[%r23 + 0x0031], %r28
	.word 0xf805c000  ! 168: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xb5508000  ! 172: RDPR_TSTATE	<illegal instruction>
	.word 0xb12c4000  ! 173: SLL_R	sll 	%r17, %r0, %r24
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 15)
	.word 0xfe5d4000  ! 188: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xff1d0000  ! 189: LDDF_R	ldd	[%r20, %r0], %f31
	.word 0xf40d8000  ! 191: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0x8395e180  ! 196: WRPR_TNPC_I	wrpr	%r23, 0x0180, %tnpc
	mov	1, %r12
	.word 0x8f930000  ! 197: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x839520e7  ! 203: WRPR_TNPC_I	wrpr	%r20, 0x00e7, %tnpc
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 34)
	.word 0xf85c8000  ! 208: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xf45ca1a9  ! 210: LDX_I	ldx	[%r18 + 0x01a9], %r26
	.word 0xb9504000  ! 212: RDPR_TNPC	<illegal instruction>
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 38)
	.word 0xfc5c4000  ! 216: LDX_R	ldx	[%r17 + %r0], %r30
	.word 0xb9540000  ! 217: RDPR_GL	<illegal instruction>
	.word 0xb7508000  ! 220: RDPR_TSTATE	<illegal instruction>
	.word 0xf65c2016  ! 222: LDX_I	ldx	[%r16 + 0x0016], %r27
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 2e)
	.word 0xb6356043  ! 229: SUBC_I	orn 	%r21, 0x0043, %r27
	.word 0xfc55200c  ! 231: LDSH_I	ldsh	[%r20 + 0x000c], %r30
	.word 0xf61dc000  ! 234: LDD_R	ldd	[%r23 + %r0], %r27
	setx	data_start_2, %g1, %r23
	mov	1, %r12
	.word 0x8f930000  ! 238: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xe9f3855a0000ddcf, %g1, %r10
	.word 0x839a8000  ! 239: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1510000  ! 249: RDPR_TICK	<illegal instruction>
	.word 0xf11d60f9  ! 250: LDDF_I	ldd	[%r21, 0x00f9], %f24
	.word 0xb7518000  ! 256: RDPR_PSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 265: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_5, %g1, %r22
	setx	data_start_1, %g1, %r20
	setx	0x83a94770000039d1, %g1, %r10
	.word 0x839a8000  ! 270: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbc946003  ! 271: ORcc_I	orcc 	%r17, 0x0003, %r30
	.word 0xbf504000  ! 273: RDPR_TNPC	<illegal instruction>
	.word 0xb9480000  ! 274: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfa0c61ac  ! 276: LDUB_I	ldub	[%r17 + 0x01ac], %r29
	.word 0xfe04e0c0  ! 285: LDUW_I	lduw	[%r19 + 0x00c0], %r31
	mov	1, %r12
	.word 0xa1930000  ! 288: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb504000  ! 290: RDPR_TNPC	<illegal instruction>
	.word 0xb9510000  ! 291: RDPR_TICK	<illegal instruction>
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 3d)
	setx	0xb1e1ce9400000814, %g1, %r10
	.word 0x819a8000  ! 293: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc15a051  ! 294: LDUH_I	lduh	[%r22 + 0x0051], %r30
	.word 0xfe1d0000  ! 295: LDD_R	ldd	[%r20 + %r0], %r31
	.word 0x8d94604d  ! 298: WRPR_PSTATE_I	wrpr	%r17, 0x004d, %pstate
	.word 0xf20c0000  ! 302: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xf84d21d9  ! 305: LDSB_I	ldsb	[%r20 + 0x01d9], %r28
	.word 0xf11ce1d9  ! 306: LDDF_I	ldd	[%r19, 0x01d9], %f24
	.word 0x8594e14c  ! 309: WRPR_TSTATE_I	wrpr	%r19, 0x014c, %tstate
	.word 0xf04d8000  ! 310: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xb3356001  ! 312: SRL_I	srl 	%r21, 0x0001, %r25
	.word 0xb1510000  ! 316: RDPR_TICK	<illegal instruction>
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 16)
	.word 0xfe0561c1  ! 320: LDUW_I	lduw	[%r21 + 0x01c1], %r31
	.word 0xfe5c8000  ! 322: LDX_R	ldx	[%r18 + %r0], %r31
	.word 0xf2058000  ! 325: LDUW_R	lduw	[%r22 + %r0], %r25
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf81dc000  ! 329: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0x8594a0c9  ! 330: WRPR_TSTATE_I	wrpr	%r18, 0x00c9, %tstate
	.word 0xf44cc000  ! 331: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xf81dc000  ! 335: LDD_R	ldd	[%r23 + %r0], %r28
	mov	2, %r12
	.word 0xa1930000  ! 336: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb751c000  ! 337: RDPR_TL	<illegal instruction>
	.word 0xb694a1cc  ! 338: ORcc_I	orcc 	%r18, 0x01cc, %r27
	.word 0xf4144000  ! 339: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xfe158000  ! 343: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0x839561ca  ! 344: WRPR_TNPC_I	wrpr	%r21, 0x01ca, %tnpc
	.word 0xfc1d210a  ! 346: LDD_I	ldd	[%r20 + 0x010a], %r30
	.word 0xf8558000  ! 347: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xf05ce0bc  ! 351: LDX_I	ldx	[%r19 + 0x00bc], %r24
	.word 0xf45d4000  ! 353: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xb3504000  ! 355: RDPR_TNPC	<illegal instruction>
	.word 0xf80420b4  ! 356: LDUW_I	lduw	[%r16 + 0x00b4], %r28
	.word 0xf25ca011  ! 358: LDX_I	ldx	[%r18 + 0x0011], %r25
	.word 0xbb7d8400  ! 360: MOVR_R	movre	%r22, %r0, %r29
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, c)
	.word 0xf41c6059  ! 362: LDD_I	ldd	[%r17 + 0x0059], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa0d6025  ! 367: LDUB_I	ldub	[%r21 + 0x0025], %r29
	.word 0x879460e7  ! 369: WRPR_TT_I	wrpr	%r17, 0x00e7, %tt
	.word 0xf81da123  ! 370: LDD_I	ldd	[%r22 + 0x0123], %r28
	mov	0, %r12
	.word 0xa1930000  ! 371: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x83952029  ! 374: WRPR_TNPC_I	wrpr	%r20, 0x0029, %tnpc
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, b)
	.word 0xf84d4000  ! 378: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xb82d6030  ! 380: ANDN_I	andn 	%r21, 0x0030, %r28
	.word 0xf2448000  ! 390: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xfc556108  ! 393: LDSH_I	ldsh	[%r21 + 0x0108], %r30
	.word 0xf91ce0aa  ! 395: LDDF_I	ldd	[%r19, 0x00aa], %f28
	.word 0xf845c000  ! 397: LDSW_R	ldsw	[%r23 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf84d4000  ! 401: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xfe140000  ! 402: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0xf45d611f  ! 403: LDX_I	ldx	[%r21 + 0x011f], %r26
	.word 0x8395e156  ! 405: WRPR_TNPC_I	wrpr	%r23, 0x0156, %tnpc
	.word 0xf21c6120  ! 409: LDD_I	ldd	[%r17 + 0x0120], %r25
	.word 0xb151c000  ! 410: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf65cc000  ! 420: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xbe952091  ! 424: ORcc_I	orcc 	%r20, 0x0091, %r31
	.word 0xf204c000  ! 426: LDUW_R	lduw	[%r19 + %r0], %r25
	mov	1, %r12
	.word 0x8f930000  ! 427: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf415c000  ! 428: LDUH_R	lduh	[%r23 + %r0], %r26
	setx	0x6236b76f0000cf95, %g1, %r10
	.word 0x839a8000  ! 435: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf20c60b8  ! 442: LDUB_I	ldub	[%r17 + 0x00b8], %r25
	setx	0x212584ff0000b81c, %g1, %r10
	.word 0x839a8000  ! 443: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb540000  ! 444: RDPR_GL	<illegal instruction>
	.word 0x819460e7  ! 446: WRPR_TPC_I	wrpr	%r17, 0x00e7, %tpc
	.word 0xfe54a0a5  ! 450: LDSH_I	ldsh	[%r18 + 0x00a5], %r31
	.word 0xf91d6180  ! 451: LDDF_I	ldd	[%r21, 0x0180], %f28
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 38)
	.word 0xf31d4000  ! 459: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xf91ce066  ! 462: LDDF_I	ldd	[%r19, 0x0066], %f28
	.word 0xbebde0e1  ! 465: XNORcc_I	xnorcc 	%r23, 0x00e1, %r31
	.word 0xb53c4000  ! 467: SRA_R	sra 	%r17, %r0, %r26
	.word 0xff1c8000  ! 470: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xfa0c8000  ! 473: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xf00d21db  ! 478: LDUB_I	ldub	[%r20 + 0x01db], %r24
	.word 0xbd504000  ! 479: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xfc54c000  ! 480: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xb235c000  ! 482: ORN_R	orn 	%r23, %r0, %r25
	.word 0xbf500000  ! 486: RDPR_TPC	<illegal instruction>
	.word 0xf85c0000  ! 490: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xfc54c000  ! 493: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xfa544000  ! 495: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xf81521d0  ! 498: LDUH_I	lduh	[%r20 + 0x01d0], %r28
	.word 0xfe540000  ! 500: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xfa148000  ! 501: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xb1518000  ! 503: RDPR_PSTATE	<illegal instruction>
	.word 0xfc1ce11f  ! 507: LDD_I	ldd	[%r19 + 0x011f], %r30
	.word 0x8794a0f3  ! 508: WRPR_TT_I	wrpr	%r18, 0x00f3, %tt
	.word 0xf6540000  ! 513: LDSH_R	ldsh	[%r16 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 2c)
	setx	0x9188eddb0000bb5d, %g1, %r10
	.word 0x819a8000  ! 517: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7518000  ! 518: RDPR_PSTATE	<illegal instruction>
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfe0de09b  ! 525: LDUB_I	ldub	[%r23 + 0x009b], %r31
	.word 0xb351c000  ! 526: RDPR_TL	<illegal instruction>
	.word 0x919460e5  ! 527: WRPR_PIL_I	wrpr	%r17, 0x00e5, %pil
	.word 0xb3520000  ! 528: RDPR_PIL	<illegal instruction>
	.word 0xfe54c000  ! 529: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0x8594e096  ! 530: WRPR_TSTATE_I	wrpr	%r19, 0x0096, %tstate
	.word 0xb4c4a1a1  ! 532: ADDCcc_I	addccc 	%r18, 0x01a1, %r26
	.word 0xf2550000  ! 535: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xf60d6193  ! 536: LDUB_I	ldub	[%r21 + 0x0193], %r27
	.word 0xf44dc000  ! 537: LDSB_R	ldsb	[%r23 + %r0], %r26
	setx	0x4fcf139200000955, %g1, %r10
	.word 0x839a8000  ! 540: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf4548000  ! 542: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xf815e029  ! 546: LDUH_I	lduh	[%r23 + 0x0029], %r28
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 24)
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 3e)
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 9)
	.word 0x8995a141  ! 555: WRPR_TICK_I	wrpr	%r22, 0x0141, %tick
	.word 0xfc450000  ! 564: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xb0058000  ! 565: ADD_R	add 	%r22, %r0, %r24
	.word 0xf454e190  ! 567: LDSH_I	ldsh	[%r19 + 0x0190], %r26
	.word 0xb950c000  ! 570: RDPR_TT	rdpr	%tt, %r28
	.word 0xf25de07d  ! 576: LDX_I	ldx	[%r23 + 0x007d], %r25
	.word 0xf854c000  ! 577: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xb1518000  ! 581: RDPR_PSTATE	<illegal instruction>
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, f)
	.word 0xbea4a017  ! 583: SUBcc_I	subcc 	%r18, 0x0017, %r31
	.word 0xf8150000  ! 586: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xfa5d4000  ! 592: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xfc058000  ! 593: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xf4542064  ! 595: LDSH_I	ldsh	[%r16 + 0x0064], %r26
	.word 0xf615e088  ! 596: LDUH_I	lduh	[%r23 + 0x0088], %r27
	.word 0xf0558000  ! 597: LDSH_R	ldsh	[%r22 + %r0], %r24
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 2d)
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 23)
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf6454000  ! 609: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xfe052039  ! 610: LDUW_I	lduw	[%r20 + 0x0039], %r31
	.word 0xfa5c61af  ! 611: LDX_I	ldx	[%r17 + 0x01af], %r29
	.word 0xf00c60ce  ! 613: LDUB_I	ldub	[%r17 + 0x00ce], %r24
	.word 0xbd51c000  ! 617: RDPR_TL	<illegal instruction>
	.word 0xf65da1cb  ! 618: LDX_I	ldx	[%r22 + 0x01cb], %r27
	.word 0xfe1c8000  ! 619: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xf24560eb  ! 622: LDSW_I	ldsw	[%r21 + 0x00eb], %r25
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, d)
	.word 0x89946119  ! 624: WRPR_TICK_I	wrpr	%r17, 0x0119, %tick
	.word 0x8995617d  ! 625: WRPR_TICK_I	wrpr	%r21, 0x017d, %tick
	.word 0x8195a043  ! 630: WRPR_TPC_I	wrpr	%r22, 0x0043, %tpc
	.word 0xb9518000  ! 631: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xf8550000  ! 632: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xf8158000  ! 635: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xb0956041  ! 637: ORcc_I	orcc 	%r21, 0x0041, %r24
	.word 0xf04521aa  ! 641: LDSW_I	ldsw	[%r20 + 0x01aa], %r24
	.word 0xfe0d8000  ! 642: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xf25de09c  ! 644: LDX_I	ldx	[%r23 + 0x009c], %r25
	.word 0xb3500000  ! 645: RDPR_TPC	<illegal instruction>
	setx	0x910ad6ad00007f17, %g1, %r10
	.word 0x819a8000  ! 646: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf84d61f6  ! 649: LDSB_I	ldsb	[%r21 + 0x01f6], %r28
	.word 0xf44c2155  ! 650: LDSB_I	ldsb	[%r16 + 0x0155], %r26
	.word 0xb634216e  ! 651: ORN_I	orn 	%r16, 0x016e, %r27
	.word 0xf00d4000  ! 652: LDUB_R	ldub	[%r21 + %r0], %r24
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 35)
	.word 0xb12d2001  ! 656: SLL_I	sll 	%r20, 0x0001, %r24
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 35)
	.word 0xf855a0a2  ! 662: LDSH_I	ldsh	[%r22 + 0x00a2], %r28
	.word 0xb3500000  ! 664: RDPR_TPC	<illegal instruction>
	.word 0xb3518000  ! 665: RDPR_PSTATE	<illegal instruction>
	.word 0xfa4da1b0  ! 666: LDSB_I	ldsb	[%r22 + 0x01b0], %r29
	.word 0x87952103  ! 667: WRPR_TT_I	wrpr	%r20, 0x0103, %tt
	.word 0xfe144000  ! 668: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xfb1d8000  ! 670: LDDF_R	ldd	[%r22, %r0], %f29
	.word 0xf244a076  ! 672: LDSW_I	ldsw	[%r18 + 0x0076], %r25
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 17)
	.word 0x839461d4  ! 675: WRPR_TNPC_I	wrpr	%r17, 0x01d4, %tnpc
	.word 0xf61da182  ! 679: LDD_I	ldd	[%r22 + 0x0182], %r27
	.word 0xfa4da017  ! 682: LDSB_I	ldsb	[%r22 + 0x0017], %r29
	.word 0xf45c2097  ! 684: LDX_I	ldx	[%r16 + 0x0097], %r26
	.word 0xf61de1c2  ! 685: LDD_I	ldd	[%r23 + 0x01c2], %r27
	.word 0xb2348000  ! 686: ORN_R	orn 	%r18, %r0, %r25
	.word 0xb151c000  ! 687: RDPR_TL	<illegal instruction>
	setx	data_start_3, %g1, %r16
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 24)
	.word 0xf614e01e  ! 693: LDUH_I	lduh	[%r19 + 0x001e], %r27
	.word 0xf21c8000  ! 694: LDD_R	ldd	[%r18 + %r0], %r25
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 17)
	.word 0xf24da0a9  ! 706: LDSB_I	ldsb	[%r22 + 0x00a9], %r25
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 23)
	.word 0xbb540000  ! 718: RDPR_GL	<illegal instruction>
	.word 0xf6146168  ! 721: LDUH_I	lduh	[%r17 + 0x0168], %r27
	.word 0x8795e06c  ! 722: WRPR_TT_I	wrpr	%r23, 0x006c, %tt
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, a)
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 31)
	.word 0xf51c4000  ! 729: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0xb7480000  ! 730: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfa14a17d  ! 733: LDUH_I	lduh	[%r18 + 0x017d], %r29
	.word 0xfc4460d2  ! 735: LDSW_I	ldsw	[%r17 + 0x00d2], %r30
	.word 0xb81c20f0  ! 739: XOR_I	xor 	%r16, 0x00f0, %r28
	.word 0xb5510000  ! 743: RDPR_TICK	<illegal instruction>
	.word 0xbd51c000  ! 744: RDPR_TL	<illegal instruction>
	.word 0xfc550000  ! 746: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xfa1da1b3  ! 748: LDD_I	ldd	[%r22 + 0x01b3], %r29
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 22)
	.word 0xf845a0f0  ! 759: LDSW_I	ldsw	[%r22 + 0x00f0], %r28
	.word 0xbe8561cd  ! 764: ADDcc_I	addcc 	%r21, 0x01cd, %r31
	.word 0x8995e199  ! 768: WRPR_TICK_I	wrpr	%r23, 0x0199, %tick
	.word 0xbaa5a1cf  ! 771: SUBcc_I	subcc 	%r22, 0x01cf, %r29
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfa0d4000  ! 775: LDUB_R	ldub	[%r21 + %r0], %r29
	.word 0xf65c4000  ! 776: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xf65560cc  ! 778: LDSH_I	ldsh	[%r21 + 0x00cc], %r27
	.word 0xf00c60db  ! 782: LDUB_I	ldub	[%r17 + 0x00db], %r24
	.word 0xbd520000  ! 783: RDPR_PIL	<illegal instruction>
	setx	data_start_3, %g1, %r19
	.word 0xb41d20ab  ! 786: XOR_I	xor 	%r20, 0x00ab, %r26
	.word 0xf11c4000  ! 789: LDDF_R	ldd	[%r17, %r0], %f24
	.word 0xf00561a8  ! 795: LDUW_I	lduw	[%r21 + 0x01a8], %r24
	.word 0xfd1c20cf  ! 797: LDDF_I	ldd	[%r16, 0x00cf], %f30
	.word 0x8395a06d  ! 799: WRPR_TNPC_I	wrpr	%r22, 0x006d, %tnpc
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, d)
	.word 0xfc0521c3  ! 802: LDUW_I	lduw	[%r20 + 0x01c3], %r30
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 2c)
	.word 0xbd500000  ! 809: RDPR_TPC	<illegal instruction>
	.word 0xb805a092  ! 810: ADD_I	add 	%r22, 0x0092, %r28
	setx	data_start_5, %g1, %r17
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 29)
	.word 0xf645a068  ! 816: LDSW_I	ldsw	[%r22 + 0x0068], %r27
	.word 0xf51d0000  ! 820: LDDF_R	ldd	[%r20, %r0], %f26
	.word 0xf245e165  ! 821: LDSW_I	ldsw	[%r23 + 0x0165], %r25
	.word 0x899521fa  ! 822: WRPR_TICK_I	wrpr	%r20, 0x01fa, %tick
	.word 0xfe440000  ! 823: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xfc44e01b  ! 824: LDSW_I	ldsw	[%r19 + 0x001b], %r30
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 14)
	.word 0xb1480000  ! 827: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x8d94a092  ! 829: WRPR_PSTATE_I	wrpr	%r18, 0x0092, %pstate
	.word 0xbb3d9000  ! 831: SRAX_R	srax	%r22, %r0, %r29
	.word 0xfc558000  ! 834: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xb6040000  ! 835: ADD_R	add 	%r16, %r0, %r27
	.word 0xbd508000  ! 836: RDPR_TSTATE	<illegal instruction>
	.word 0xfb1c20f8  ! 838: LDDF_I	ldd	[%r16, 0x00f8], %f29
	setx	data_start_3, %g1, %r23
	.word 0x89956180  ! 840: WRPR_TICK_I	wrpr	%r21, 0x0180, %tick
	.word 0xbd500000  ! 842: RDPR_TPC	<illegal instruction>
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, a)
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 8)
	.word 0xbd3ca001  ! 848: SRA_I	sra 	%r18, 0x0001, %r30
	.word 0xbf7ce401  ! 854: MOVR_I	movre	%r19, 0x1, %r31
	.word 0x8394619d  ! 856: WRPR_TNPC_I	wrpr	%r17, 0x019d, %tnpc
	.word 0xf2140000  ! 858: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xf805602f  ! 859: LDUW_I	lduw	[%r21 + 0x002f], %r28
	.word 0xb8c421ac  ! 860: ADDCcc_I	addccc 	%r16, 0x01ac, %r28
	.word 0x819520f4  ! 864: WRPR_TPC_I	wrpr	%r20, 0x00f4, %tpc
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf255e080  ! 868: LDSH_I	ldsh	[%r23 + 0x0080], %r25
	.word 0xbd500000  ! 869: RDPR_TPC	<illegal instruction>
	.word 0x8995e0e9  ! 870: WRPR_TICK_I	wrpr	%r23, 0x00e9, %tick
	.word 0x8195e142  ! 873: WRPR_TPC_I	wrpr	%r23, 0x0142, %tpc
	.word 0xb9348000  ! 875: SRL_R	srl 	%r18, %r0, %r28
	.word 0xb8a5200b  ! 876: SUBcc_I	subcc 	%r20, 0x000b, %r28
	.word 0xf61c0000  ! 882: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xb435e190  ! 885: ORN_I	orn 	%r23, 0x0190, %r26
	.word 0xf2048000  ! 887: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0xb950c000  ! 891: RDPR_TT	<illegal instruction>
	.word 0xbd2d5000  ! 892: SLLX_R	sllx	%r21, %r0, %r30
	.word 0xfc4dc000  ! 894: LDSB_R	ldsb	[%r23 + %r0], %r30
hwintr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_45), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfc1d0000  ! 898: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xf8052177  ! 899: LDUW_I	lduw	[%r20 + 0x0177], %r28
	.word 0xf6456070  ! 903: LDSW_I	ldsw	[%r21 + 0x0070], %r27
	.word 0xf254e1b4  ! 904: LDSH_I	ldsh	[%r19 + 0x01b4], %r25
	.word 0xf4058000  ! 907: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xfe456167  ! 909: LDSW_I	ldsw	[%r21 + 0x0167], %r31
	setx	data_start_7, %g1, %r21
	.word 0xf61c4000  ! 911: LDD_R	ldd	[%r17 + %r0], %r27
	.word 0xb334c000  ! 914: SRL_R	srl 	%r19, %r0, %r25
	.word 0xf2142119  ! 915: LDUH_I	lduh	[%r16 + 0x0119], %r25
	.word 0xf91d617e  ! 916: LDDF_I	ldd	[%r21, 0x017e], %f28
	setx	data_start_6, %g1, %r18
	mov	1, %r12
	.word 0xa1930000  ! 918: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe4d0000  ! 923: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xf00d4000  ! 924: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xbf50c000  ! 925: RDPR_TT	rdpr	%tt, %r31
	.word 0xbe8c8000  ! 927: ANDcc_R	andcc 	%r18, %r0, %r31
	.word 0xb7520000  ! 929: RDPR_PIL	<illegal instruction>
hwintr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_46), 16, 16)) -> intp(2, 0, 3c)
	.word 0xba95c000  ! 934: ORcc_R	orcc 	%r23, %r0, %r29
	.word 0xb294c000  ! 935: ORcc_R	orcc 	%r19, %r0, %r25
	.word 0xfc0c8000  ! 940: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xbb520000  ! 942: RDPR_PIL	<illegal instruction>
	.word 0x9194a12c  ! 944: WRPR_PIL_I	wrpr	%r18, 0x012c, %pil
	.word 0xfe4c204f  ! 948: LDSB_I	ldsb	[%r16 + 0x004f], %r31
	.word 0xfe55a03b  ! 949: LDSH_I	ldsh	[%r22 + 0x003b], %r31
	.word 0xb8450000  ! 952: ADDC_R	addc 	%r20, %r0, %r28
	.word 0xf84d4000  ! 953: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xf044e1b1  ! 958: LDSW_I	ldsw	[%r19 + 0x01b1], %r24
hwintr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_47), 16, 16)) -> intp(2, 0, 1e)
	.word 0xbab54000  ! 960: ORNcc_R	orncc 	%r21, %r0, %r29
	setx	0x4aeaeccc00007e44, %g1, %r10
	.word 0x839a8000  ! 963: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_48), 16, 16)) -> intp(2, 0, 3d)
	.word 0xb9510000  ! 967: RDPR_TICK	<illegal instruction>
	.word 0xf40d0000  ! 968: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xb89ce198  ! 969: XORcc_I	xorcc 	%r19, 0x0198, %r28
	.word 0xf40d4000  ! 970: LDUB_R	ldub	[%r21 + %r0], %r26
	setx	data_start_3, %g1, %r17
	.word 0xf6454000  ! 976: LDSW_R	ldsw	[%r21 + %r0], %r27
hwintr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_49), 16, 16)) -> intp(2, 0, 20)
	.word 0xf80d4000  ! 982: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xf8544000  ! 983: LDSH_R	ldsh	[%r17 + %r0], %r28
hwintr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_50), 16, 16)) -> intp(2, 0, 1e)
	.word 0xb9504000  ! 988: RDPR_TNPC	<illegal instruction>
	.word 0xfe05e1c9  ! 993: LDUW_I	lduw	[%r23 + 0x01c9], %r31
	.word 0xbf2cb001  ! 995: SLLX_I	sllx	%r18, 0x0001, %r31
	.word 0xf6546057  ! 997: LDSH_I	ldsh	[%r17 + 0x0057], %r27
hwintr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_51), 16, 16)) -> intp(2, 0, 14)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbda88820  ! 7: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0x8994a069  ! 8: WRPR_TICK_I	wrpr	%r18, 0x0069, %tick
	.word 0xb950c000  ! 11: RDPR_TT	<illegal instruction>
	.word 0xbfa94820  ! 14: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb5a84820  ! 16: FMOVE	fmovs	%fcc1, %f0, %f26
	setx	data_start_4, %g1, %r22
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 7)
	.word 0x81942103  ! 23: WRPR_TPC_I	wrpr	%r16, 0x0103, %tpc
	.word 0x8394a00e  ! 25: WRPR_TNPC_I	wrpr	%r18, 0x000e, %tnpc
	.word 0xbd7de401  ! 27: MOVR_I	movre	%r23, 0x1, %r30
	.word 0xb1a00040  ! 28: FMOVd	fmovd	%f0, %f24
	.word 0xba844000  ! 29: ADDcc_R	addcc 	%r17, %r0, %r29
	.word 0xb4c58000  ! 32: ADDCcc_R	addccc 	%r22, %r0, %r26
	.word 0xbda48940  ! 34: FMULd	fmuld	%f18, %f0, %f30
	setx	data_start_0, %g1, %r19
	.word 0xbec5c000  ! 38: ADDCcc_R	addccc 	%r23, %r0, %r31
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 13)
	.word 0xb3a81420  ! 42: FMOVRNZ	dis not found

	.word 0xb7a48840  ! 43: FADDd	faddd	%f18, %f0, %f58
	.word 0xbba80c20  ! 47: FMOVRLZ	dis not found

	mov	1, %r12
	.word 0x8f930000  ! 49: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5a50840  ! 50: FADDd	faddd	%f20, %f0, %f26
	.word 0x87942113  ! 51: WRPR_TT_I	wrpr	%r16, 0x0113, %tt
	.word 0xbda84820  ! 53: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a9c820  ! 56: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb9ab0820  ! 58: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbfa98820  ! 59: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb9a409e0  ! 60: FDIVq	dis not found

	.word 0xbfa588e0  ! 61: FSUBq	dis not found

	.word 0xbe9c0000  ! 65: XORcc_R	xorcc 	%r16, %r0, %r31
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb7a98820  ! 72: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb9500000  ! 75: RDPR_TPC	<illegal instruction>
	.word 0xbc9c4000  ! 77: XORcc_R	xorcc 	%r17, %r0, %r30
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9aa8820  ! 83: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbdab0820  ! 85: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb08da057  ! 86: ANDcc_I	andcc 	%r22, 0x0057, %r24
	setx	0x9791c15f000069d4, %g1, %r10
	.word 0x819a8000  ! 87: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3ab0820  ! 88: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb9a48840  ! 91: FADDd	faddd	%f18, %f0, %f28
	.word 0xbba94820  ! 92: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb951c000  ! 95: RDPR_TL	<illegal instruction>
	.word 0xb7a50860  ! 96: FADDq	dis not found

	.word 0xb43d4000  ! 97: XNOR_R	xnor 	%r21, %r0, %r26
	.word 0xb1518000  ! 98: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa4c9e0  ! 100: FDIVq	dis not found

	.word 0xb6348000  ! 102: ORN_R	orn 	%r18, %r0, %r27
	.word 0x85942170  ! 103: WRPR_TSTATE_I	wrpr	%r16, 0x0170, %tstate
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 8)
	.word 0xb7a00540  ! 105: FSQRTd	fsqrt	
	.word 0x919461ce  ! 113: WRPR_PIL_I	wrpr	%r17, 0x01ce, %pil
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb6b4c000  ! 115: ORNcc_R	orncc 	%r19, %r0, %r27
	.word 0x83956172  ! 121: WRPR_TNPC_I	wrpr	%r21, 0x0172, %tnpc
	.word 0xb1a00540  ! 122: FSQRTd	fsqrt	
	.word 0xb9a00540  ! 123: FSQRTd	fsqrt	
	.word 0xb63560d9  ! 126: SUBC_I	orn 	%r21, 0x00d9, %r27
	.word 0xb1a94820  ! 128: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbd508000  ! 136: RDPR_TSTATE	<illegal instruction>
	.word 0x87956059  ! 137: WRPR_TT_I	wrpr	%r21, 0x0059, %tt
	.word 0xb6a44000  ! 138: SUBcc_R	subcc 	%r17, %r0, %r27
	.word 0xb3a488c0  ! 144: FSUBd	fsubd	%f18, %f0, %f56
	.word 0xb9a00560  ! 146: FSQRTq	fsqrt	
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 18)
	.word 0xbb500000  ! 151: RDPR_TPC	<illegal instruction>
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 35)
	.word 0xb3a508c0  ! 159: FSUBd	fsubd	%f20, %f0, %f56
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a548a0  ! 163: FSUBs	fsubs	%f21, %f0, %f27
	.word 0xb5a4c840  ! 164: FADDd	faddd	%f50, %f0, %f26
	.word 0xbda58940  ! 166: FMULd	fmuld	%f22, %f0, %f30
	.word 0xb5a00040  ! 167: FMOVd	fmovd	%f0, %f26
	.word 0xb3a5c860  ! 169: FADDq	dis not found

	.word 0xb9508000  ! 172: RDPR_TSTATE	<illegal instruction>
	.word 0xbf2c8000  ! 173: SLL_R	sll 	%r18, %r0, %r31
	.word 0xb5a48960  ! 174: FMULq	dis not found

	.word 0xb5a44840  ! 175: FADDd	faddd	%f48, %f0, %f26
	.word 0xbfa00560  ! 178: FSQRTq	fsqrt	
	.word 0xb7ab0820  ! 179: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbdaa0820  ! 181: FMOVA	fmovs	%fcc1, %f0, %f30
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 14)
	.word 0xbda98820  ! 185: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbda9c820  ! 187: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbfaac820  ! 192: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0x839420e9  ! 196: WRPR_TNPC_I	wrpr	%r16, 0x00e9, %tnpc
	mov	0, %r12
	.word 0x8f930000  ! 197: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8394e180  ! 203: WRPR_TNPC_I	wrpr	%r19, 0x0180, %tnpc
	.word 0xbda588e0  ! 204: FSUBq	dis not found

hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 11)
	.word 0xbf504000  ! 212: RDPR_TNPC	<illegal instruction>
	.word 0xbfa81c20  ! 213: FMOVRGEZ	dis not found

hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1540000  ! 217: RDPR_GL	<illegal instruction>
	.word 0xbda00540  ! 219: FSQRTd	fsqrt	
	.word 0xbd508000  ! 220: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a80820  ! 221: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb5a508a0  ! 223: FSUBs	fsubs	%f20, %f0, %f26
	.word 0xbda81c20  ! 225: FMOVRGEZ	dis not found

hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 13)
	.word 0xb9a81c20  ! 228: FMOVRGEZ	dis not found

	.word 0xbc35a04a  ! 229: SUBC_I	orn 	%r22, 0x004a, %r30
	setx	data_start_0, %g1, %r17
	mov	2, %r12
	.word 0x8f930000  ! 238: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x56fdd7c90000d903, %g1, %r10
	.word 0x839a8000  ! 239: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5aac820  ! 240: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb1a40820  ! 242: FADDs	fadds	%f16, %f0, %f24
	.word 0xb5abc820  ! 243: FMOVVC	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa00020  ! 245: FMOVs	fmovs	%f0, %f31
	.word 0xb3a48940  ! 247: FMULd	fmuld	%f18, %f0, %f56
	.word 0xbb510000  ! 249: RDPR_TICK	<illegal instruction>
	.word 0xb9a48860  ! 251: FADDq	dis not found

	.word 0xb3a81c20  ! 253: FMOVRGEZ	dis not found

	.word 0xb7a5c8c0  ! 255: FSUBd	fsubd	%f54, %f0, %f58
	.word 0xbd518000  ! 256: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a4c9a0  ! 258: FDIVs	fdivs	%f19, %f0, %f28
	.word 0xbba84820  ! 259: FMOVE	fmovs	%fcc1, %f0, %f29
	mov	1, %r12
	.word 0x8f930000  ! 265: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_0, %g1, %r23
	setx	data_start_6, %g1, %r20
	setx	0x639800ac00005f9c, %g1, %r10
	.word 0x839a8000  ! 270: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbe95a162  ! 271: ORcc_I	orcc 	%r22, 0x0162, %r31
	.word 0xb9504000  ! 273: RDPR_TNPC	<illegal instruction>
	.word 0xb1480000  ! 274: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbba48920  ! 281: FMULs	fmuls	%f18, %f0, %f29
	.word 0xb3a00040  ! 282: FMOVd	fmovd	%f0, %f56
	.word 0xb3a00560  ! 284: FSQRTq	fsqrt	
	mov	0, %r12
	.word 0xa1930000  ! 288: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5a48920  ! 289: FMULs	fmuls	%f18, %f0, %f26
	.word 0xb3504000  ! 290: RDPR_TNPC	<illegal instruction>
	.word 0xbb510000  ! 291: RDPR_TICK	<illegal instruction>
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 22)
	setx	0x3fbdaeb900007c15, %g1, %r10
	.word 0x819a8000  ! 293: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5a80820  ! 297: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0x8d94a198  ! 298: WRPR_PSTATE_I	wrpr	%r18, 0x0198, %pstate
	.word 0xbda9c820  ! 300: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbfa58960  ! 301: FMULq	dis not found

	.word 0xb7a48840  ! 304: FADDd	faddd	%f18, %f0, %f58
	.word 0xb9ab8820  ! 307: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0x8594e0d9  ! 309: WRPR_TSTATE_I	wrpr	%r19, 0x00d9, %tstate
	.word 0xb5356001  ! 312: SRL_I	srl 	%r21, 0x0001, %r26
	.word 0xb7a4c920  ! 314: FMULs	fmuls	%f19, %f0, %f27
	.word 0xbfa50940  ! 315: FMULd	fmuld	%f20, %f0, %f62
	.word 0xbb510000  ! 316: RDPR_TICK	<illegal instruction>
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 38)
	.word 0xb7aa0820  ! 321: FMOVA	fmovs	%fcc1, %f0, %f27
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 12)
	.word 0x8595a060  ! 330: WRPR_TSTATE_I	wrpr	%r22, 0x0060, %tstate
	.word 0xbba5c920  ! 332: FMULs	fmuls	%f23, %f0, %f29
	.word 0xb9a80c20  ! 334: FMOVRLZ	dis not found

	mov	2, %r12
	.word 0xa1930000  ! 336: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb951c000  ! 337: RDPR_TL	<illegal instruction>
	.word 0xbc956124  ! 338: ORcc_I	orcc 	%r21, 0x0124, %r30
	.word 0xb3a54960  ! 341: FMULq	dis not found

	.word 0x83956068  ! 344: WRPR_TNPC_I	wrpr	%r21, 0x0068, %tnpc
	.word 0xb1504000  ! 355: RDPR_TNPC	<illegal instruction>
	.word 0xb5a50940  ! 357: FMULd	fmuld	%f20, %f0, %f26
	.word 0xbf7d8400  ! 360: MOVR_R	movre	%r22, %r0, %r31
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a81820  ! 366: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0x8795e17f  ! 369: WRPR_TT_I	wrpr	%r23, 0x017f, %tt
	mov	0, %r12
	.word 0xa1930000  ! 371: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x83942089  ! 374: WRPR_TNPC_I	wrpr	%r16, 0x0089, %tnpc
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, a)
	.word 0xb5a588a0  ! 379: FSUBs	fsubs	%f22, %f0, %f26
	.word 0xb82d20d3  ! 380: ANDN_I	andn 	%r20, 0x00d3, %r28
	.word 0xb3a48820  ! 381: FADDs	fadds	%f18, %f0, %f25
	.word 0xbbab0820  ! 385: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb1a81420  ! 392: FMOVRNZ	dis not found

	.word 0xb7a80820  ! 394: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb9aac820  ! 399: FMOVGE	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a98820  ! 404: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0x8395a114  ! 405: WRPR_TNPC_I	wrpr	%r22, 0x0114, %tnpc
	.word 0xb551c000  ! 410: RDPR_TL	<illegal instruction>
	.word 0xb5a80820  ! 412: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda548e0  ! 416: FSUBq	dis not found

	.word 0xb9a54860  ! 421: FADDq	dis not found

	.word 0xbe94e10f  ! 424: ORcc_I	orcc 	%r19, 0x010f, %r31
	.word 0xb3a40860  ! 425: FADDq	dis not found

	mov	1, %r12
	.word 0x8f930000  ! 427: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5a84820  ! 431: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa90820  ! 433: FMOVLEU	fmovs	%fcc1, %f0, %f31
	setx	0x1a073e1d00004951, %g1, %r10
	.word 0x839a8000  ! 435: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9a00520  ! 438: FSQRTs	fsqrt	
	setx	0xa1b7a90000005d92, %g1, %r10
	.word 0x839a8000  ! 443: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7540000  ! 444: RDPR_GL	<illegal instruction>
	.word 0x8195a0dc  ! 446: WRPR_TPC_I	wrpr	%r22, 0x00dc, %tpc
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 25)
	.word 0xb1a90820  ! 458: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb1a80820  ! 460: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb8bda199  ! 465: XNORcc_I	xnorcc 	%r22, 0x0199, %r28
	.word 0xbfa44860  ! 466: FADDq	dis not found

	.word 0xbb3cc000  ! 467: SRA_R	sra 	%r19, %r0, %r29
	.word 0xb7abc820  ! 469: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb1aa8820  ! 472: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb5a448c0  ! 475: FSUBd	fsubd	%f48, %f0, %f26
	.word 0xbb504000  ! 479: RDPR_TNPC	<illegal instruction>
	.word 0xb635c000  ! 482: ORN_R	orn 	%r23, %r0, %r27
	.word 0xbba9c820  ! 483: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb5a88820  ! 485: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbd500000  ! 486: RDPR_TPC	<illegal instruction>
	.word 0xb5a40820  ! 487: FADDs	fadds	%f16, %f0, %f26
	.word 0xb1a508a0  ! 491: FSUBs	fsubs	%f20, %f0, %f24
	.word 0xbba50960  ! 492: FMULq	dis not found

	.word 0xb5aa0820  ! 502: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbd518000  ! 503: RDPR_PSTATE	<illegal instruction>
	.word 0x8794a10a  ! 508: WRPR_TT_I	wrpr	%r18, 0x010a, %tt
	.word 0xb1a88820  ! 509: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbba81420  ! 510: FMOVRNZ	dis not found

	.word 0xb1a5c840  ! 514: FADDd	faddd	%f54, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, d)
	setx	0x9cff10700000ec4a, %g1, %r10
	.word 0x819a8000  ! 517: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbd518000  ! 518: RDPR_PSTATE	<illegal instruction>
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 38)
	.word 0xb3a94820  ! 524: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbd51c000  ! 526: RDPR_TL	<illegal instruction>
	.word 0x919561f6  ! 527: WRPR_PIL_I	wrpr	%r21, 0x01f6, %pil
	.word 0xb1520000  ! 528: RDPR_PIL	<illegal instruction>
	.word 0x85956017  ! 530: WRPR_TSTATE_I	wrpr	%r21, 0x0017, %tstate
	.word 0xbec52197  ! 532: ADDCcc_I	addccc 	%r20, 0x0197, %r31
	setx	0x745f72ab00003e04, %g1, %r10
	.word 0x839a8000  ! 540: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3a489a0  ! 543: FDIVs	fdivs	%f18, %f0, %f25
	.word 0xb3ab0820  ! 544: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a4c820  ! 547: FADDs	fadds	%f19, %f0, %f25
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 1)
	.word 0xbbaa8820  ! 549: FMOVG	fmovs	%fcc1, %f0, %f29
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 14)
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 1c)
	.word 0x8994e1ea  ! 555: WRPR_TICK_I	wrpr	%r19, 0x01ea, %tick
	.word 0xb3a58920  ! 561: FMULs	fmuls	%f22, %f0, %f25
	.word 0xbbabc820  ! 563: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbc058000  ! 565: ADD_R	add 	%r22, %r0, %r30
	.word 0xb1a80820  ! 566: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbda8c820  ! 568: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb3a8c820  ! 569: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb750c000  ! 570: RDPR_TT	<illegal instruction>
	.word 0xb9a509c0  ! 571: FDIVd	fdivd	%f20, %f0, %f28
	.word 0xbfab4820  ! 578: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb1518000  ! 581: RDPR_PSTATE	<illegal instruction>
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 13)
	.word 0xbca4e18c  ! 583: SUBcc_I	subcc 	%r19, 0x018c, %r30
	.word 0xb3a00540  ! 584: FSQRTd	fsqrt	
	.word 0xb9a81420  ! 588: FMOVRNZ	dis not found

	.word 0xb3a48840  ! 589: FADDd	faddd	%f18, %f0, %f56
	.word 0xb1ab0820  ! 591: FMOVGU	fmovs	%fcc1, %f0, %f24
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 6)
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 36)
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 16)
	.word 0xbba00520  ! 608: FSQRTs	fsqrt	
	.word 0xb1a408a0  ! 615: FSUBs	fsubs	%f16, %f0, %f24
	.word 0xb3a88820  ! 616: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb351c000  ! 617: RDPR_TL	<illegal instruction>
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 38)
	.word 0x8994e1ae  ! 624: WRPR_TICK_I	wrpr	%r19, 0x01ae, %tick
	.word 0x899420ac  ! 625: WRPR_TICK_I	wrpr	%r16, 0x00ac, %tick
	.word 0xb1abc820  ! 628: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0x8195614e  ! 630: WRPR_TPC_I	wrpr	%r21, 0x014e, %tpc
	.word 0xb1518000  ! 631: RDPR_PSTATE	<illegal instruction>
	.word 0xbbaa8820  ! 633: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb3a81c20  ! 634: FMOVRGEZ	dis not found

	.word 0xb094e0d4  ! 637: ORcc_I	orcc 	%r19, 0x00d4, %r24
	.word 0xbfa00560  ! 643: FSQRTq	fsqrt	
	.word 0xb3500000  ! 645: RDPR_TPC	<illegal instruction>
	setx	0xec5bf4e10000be5c, %g1, %r10
	.word 0x819a8000  ! 646: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a4c9e0  ! 647: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc35e180  ! 651: ORN_I	orn 	%r23, 0x0180, %r30
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7a81820  ! 654: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbb2de001  ! 656: SLL_I	sll 	%r23, 0x0001, %r29
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 30)
	.word 0xbda8c820  ! 658: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb9a5c8a0  ! 661: FSUBs	fsubs	%f23, %f0, %f28
	.word 0xbd500000  ! 664: RDPR_TPC	<illegal instruction>
	.word 0xb5518000  ! 665: RDPR_PSTATE	<illegal instruction>
	.word 0x879460ea  ! 667: WRPR_TT_I	wrpr	%r17, 0x00ea, %tt
	.word 0xbda00540  ! 671: FSQRTd	fsqrt	
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 3)
	.word 0x8395e1fa  ! 675: WRPR_TNPC_I	wrpr	%r23, 0x01fa, %tnpc
	.word 0xbbaa0820  ! 681: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb4354000  ! 686: ORN_R	orn 	%r21, %r0, %r26
	.word 0xbb51c000  ! 687: RDPR_TL	<illegal instruction>
	setx	data_start_7, %g1, %r16
	.word 0xbda409a0  ! 689: FDIVs	fdivs	%f16, %f0, %f30
	.word 0xbfa54860  ! 690: FADDq	dis not found

hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 19)
	.word 0xb9a44820  ! 699: FADDs	fadds	%f17, %f0, %f28
	.word 0xb5ab0820  ! 700: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb5aac820  ! 701: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a548c0  ! 703: FSUBd	fsubd	%f52, %f0, %f28
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 1c)
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 25)
	.word 0xbd540000  ! 718: RDPR_GL	<illegal instruction>
	.word 0x8794e197  ! 722: WRPR_TT_I	wrpr	%r19, 0x0197, %tt
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 18)
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 30)
	.word 0xb5aa0820  ! 726: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbb480000  ! 730: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb01da0e7  ! 739: XOR_I	xor 	%r22, 0x00e7, %r24
	.word 0xb3a88820  ! 741: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb5510000  ! 743: RDPR_TICK	<illegal instruction>
	.word 0xb751c000  ! 744: RDPR_TL	<illegal instruction>
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb1a81820  ! 750: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbdaa0820  ! 751: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb3a44860  ! 760: FADDq	dis not found

	.word 0xbbaa8820  ! 761: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb485e171  ! 764: ADDcc_I	addcc 	%r23, 0x0171, %r26
	.word 0xb7a9c820  ! 765: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a8c820  ! 766: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb7aa8820  ! 767: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0x8995e079  ! 768: WRPR_TICK_I	wrpr	%r23, 0x0079, %tick
	.word 0xbea52180  ! 771: SUBcc_I	subcc 	%r20, 0x0180, %r31
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 23)
	.word 0xb9a84820  ! 779: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb7520000  ! 783: RDPR_PIL	<illegal instruction>
	setx	data_start_7, %g1, %r20
	.word 0xb41c60d9  ! 786: XOR_I	xor 	%r17, 0x00d9, %r26
	.word 0xbfa81c20  ! 791: FMOVRGEZ	dis not found

	.word 0xb5a80820  ! 793: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0x839561fd  ! 799: WRPR_TNPC_I	wrpr	%r21, 0x01fd, %tnpc
	.word 0xbba509a0  ! 800: FDIVs	fdivs	%f20, %f0, %f29
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 33)
	.word 0xbba5c8c0  ! 803: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xb3a00560  ! 804: FSQRTq	fsqrt	
	.word 0xb3a409e0  ! 805: FDIVq	dis not found

hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 39)
	.word 0xb5500000  ! 809: RDPR_TPC	<illegal instruction>
	.word 0xbe04e1ba  ! 810: ADD_I	add 	%r19, 0x01ba, %r31
	setx	data_start_1, %g1, %r16
	.word 0xb5a81420  ! 813: FMOVRNZ	dis not found

hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb5a5c8e0  ! 818: FSUBq	dis not found

	.word 0x8995205a  ! 822: WRPR_TICK_I	wrpr	%r20, 0x005a, %tick
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 7)
	.word 0xb9480000  ! 827: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x8d95e0eb  ! 829: WRPR_PSTATE_I	wrpr	%r23, 0x00eb, %pstate
	.word 0xbf3c9000  ! 831: SRAX_R	srax	%r18, %r0, %r31
	.word 0xba044000  ! 835: ADD_R	add 	%r17, %r0, %r29
	.word 0xbd508000  ! 836: RDPR_TSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r22
	.word 0x8995a127  ! 840: WRPR_TICK_I	wrpr	%r22, 0x0127, %tick
	.word 0xbd500000  ! 842: RDPR_TPC	<illegal instruction>
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb3a81820  ! 844: FMOVRGZ	fmovs	%fcc3, %f0, %f25
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 20)
	.word 0xbb3d2001  ! 848: SRA_I	sra 	%r20, 0x0001, %r29
	.word 0xb97da401  ! 854: MOVR_I	movre	%r22, 0x1, %r28
	.word 0x8395616d  ! 856: WRPR_TNPC_I	wrpr	%r21, 0x016d, %tnpc
	.word 0xb9a80c20  ! 857: FMOVRLZ	dis not found

	.word 0xbcc5a0b5  ! 860: ADDCcc_I	addccc 	%r22, 0x00b5, %r30
	.word 0x8195e10d  ! 864: WRPR_TPC_I	wrpr	%r23, 0x010d, %tpc
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb3500000  ! 869: RDPR_TPC	<illegal instruction>
	.word 0x8995e0a8  ! 870: WRPR_TICK_I	wrpr	%r23, 0x00a8, %tick
	.word 0xbdaa8820  ! 871: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb3a80820  ! 872: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0x8195614a  ! 873: WRPR_TPC_I	wrpr	%r21, 0x014a, %tpc
	.word 0xbf344000  ! 875: SRL_R	srl 	%r17, %r0, %r31
	.word 0xbca5e0b4  ! 876: SUBcc_I	subcc 	%r23, 0x00b4, %r30
	.word 0xb5ab0820  ! 878: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb7a588c0  ! 881: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xbe3460aa  ! 885: ORN_I	orn 	%r17, 0x00aa, %r31
	.word 0xbfa409a0  ! 886: FDIVs	fdivs	%f16, %f0, %f31
	.word 0xb5a90820  ! 888: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbda58920  ! 890: FMULs	fmuls	%f22, %f0, %f30
	.word 0xb750c000  ! 891: RDPR_TT	<illegal instruction>
	.word 0xb72c5000  ! 892: SLLX_R	sllx	%r17, %r0, %r27
	.word 0xb3aa0820  ! 893: FMOVA	fmovs	%fcc1, %f0, %f25
hwintr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_45), 16, 16)) -> intp(1, 0, d)
	.word 0xbda84820  ! 908: FMOVE	fmovs	%fcc1, %f0, %f30
	setx	data_start_0, %g1, %r16
	.word 0xb7abc820  ! 913: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb7354000  ! 914: SRL_R	srl 	%r21, %r0, %r27
	setx	data_start_3, %g1, %r16
	mov	0, %r12
	.word 0xa1930000  ! 918: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda9c820  ! 920: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a54820  ! 921: FADDs	fadds	%f21, %f0, %f24
	.word 0xb150c000  ! 925: RDPR_TT	rdpr	%tt, %r24
	.word 0xbe8c0000  ! 927: ANDcc_R	andcc 	%r16, %r0, %r31
	.word 0xb9a9c820  ! 928: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb9520000  ! 929: RDPR_PIL	<illegal instruction>
	.word 0xb5a88820  ! 931: FMOVLE	fmovs	%fcc1, %f0, %f26
hwintr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_46), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb0948000  ! 934: ORcc_R	orcc 	%r18, %r0, %r24
	.word 0xb6940000  ! 935: ORcc_R	orcc 	%r16, %r0, %r27
	.word 0xb1ab8820  ! 941: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbf520000  ! 942: RDPR_PIL	<illegal instruction>
	.word 0x919461da  ! 944: WRPR_PIL_I	wrpr	%r17, 0x01da, %pil
	.word 0xbfa84820  ! 946: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbe450000  ! 952: ADDC_R	addc 	%r20, %r0, %r31
	.word 0xb3a5c840  ! 956: FADDd	faddd	%f54, %f0, %f56
hwintr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_47), 16, 16)) -> intp(1, 0, 7)
	.word 0xb2b4c000  ! 960: ORNcc_R	orncc 	%r19, %r0, %r25
	.word 0xb5ab4820  ! 962: FMOVCC	fmovs	%fcc1, %f0, %f26
	setx	0xb07f129800003e0c, %g1, %r10
	.word 0x839a8000  ! 963: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_48), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbba00560  ! 965: FSQRTq	fsqrt	
	.word 0xbb510000  ! 967: RDPR_TICK	<illegal instruction>
	.word 0xb49d60da  ! 969: XORcc_I	xorcc 	%r21, 0x00da, %r26
	.word 0xb1a408c0  ! 973: FSUBd	fsubd	%f16, %f0, %f24
	setx	data_start_1, %g1, %r18
	.word 0xb1ab4820  ! 977: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbda589e0  ! 978: FDIVq	dis not found

hwintr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_49), 16, 16)) -> intp(1, 0, 28)
hwintr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_50), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7ab8820  ! 986: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb1504000  ! 988: RDPR_TNPC	<illegal instruction>
	.word 0xbba548c0  ! 990: FSUBd	fsubd	%f52, %f0, %f60
	.word 0xbba48940  ! 994: FMULd	fmuld	%f18, %f0, %f60
	.word 0xb52c3001  ! 995: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xb5a58960  ! 996: FMULq	dis not found

hwintr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_51), 16, 16)) -> intp(1, 0, 9)

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

	.xword	0xf09850d0582c6fda
	.xword	0x35f1184276afc159
	.xword	0x48cc18629942e455
	.xword	0x7b71f28e70cfb4a7
	.xword	0x0789cb5563e1abd6
	.xword	0xc727e1f9695839f9
	.xword	0xca90bf6784c31d6e
	.xword	0x0e0a42bb11769f5a
	.xword	0xa7fb6c6d083e8b66
	.xword	0x7920c8d61f38462f
	.xword	0xc0b57edff0a2db4d
	.xword	0x782c852730f83874
	.xword	0xc3ffc0a6ac283583
	.xword	0x8ce8c2286115d848
	.xword	0x68200f88834b7f1a
	.xword	0x1cfa92b85e34686c
	.xword	0x07779d65393d5b09
	.xword	0xf7dad9e4dd255da8
	.xword	0x6a88c2c637636710
	.xword	0xe6703ead6a9784d4
	.xword	0x734200c694c9e278
	.xword	0xe90b2d12d4057d84
	.xword	0x3e97980ff8874b29
	.xword	0xbd1b8a35877fc14d
	.xword	0xdf934fec075d12af
	.xword	0xe4d2ab8f1236d7c0
	.xword	0x609106e176c31cac
	.xword	0x7059cc9a56dc51e4
	.xword	0xefff4792fe2d5285
	.xword	0x98442b3966780649
	.xword	0xe5a6abb4169a6eaf
	.xword	0x3a1d69207c4b7272
	.xword	0xc052d9d2c83aa76d
	.xword	0xf10eac8f1cbf6b6b
	.xword	0xa23685551204e614
	.xword	0x6cc472e7b206d3a9
	.xword	0x7b9e085e00abc0cc
	.xword	0x35c64728b828d187
	.xword	0x4ec96bae3b3716c6
	.xword	0xb73071db19de561f
	.xword	0x3f70b7d6161ed5a7
	.xword	0x7da91021c3679ddc
	.xword	0x2866759a172b595b
	.xword	0xcf145de73d399c88
	.xword	0x04e6b903e7499683
	.xword	0x5f18cd146f6eaeb9
	.xword	0x0156820e19f6cba1
	.xword	0x8ec9a35de9337e1f
	.xword	0xf6aa2a538f35530d
	.xword	0xb1ce02a60aaeb908
	.xword	0xb7aaa274c87fae92
	.xword	0xec5a7feb2c802e61
	.xword	0xcc2b28b06cbd4e57
	.xword	0x7241ca2efe2911e2
	.xword	0x04b2adb11dc30994
	.xword	0x74a187846b9e5ad3
	.xword	0x2db59a608fd4771d
	.xword	0x9ef235d80ad7f9a8
	.xword	0xf83bfc589a720f95
	.xword	0x854b0ac4fc013231
	.xword	0xe1a3c37ada74550a
	.xword	0xc077518f5afce4ac
	.xword	0xc4b46eb053f26791
	.xword	0x4abc46dd45a345d2
	.xword	0x2a9346c2b200ba59
	.xword	0xa480633faab527a8
	.xword	0x3ffaa05e1eb12118
	.xword	0x861954890a2101a3
	.xword	0x50e4df2c79af79ff
	.xword	0xd7db95bbe468464d
	.xword	0x13b1c1e34f48ed5b
	.xword	0xc5d7c213e8893b8d
	.xword	0x90438a7409cf9e38
	.xword	0x2e42ba05f5177bc1
	.xword	0x2c0c53d0ad1e23e0
	.xword	0x66e2d9a575ebbf17
	.xword	0xa1902a9d99ecdddd
	.xword	0x2e8db915f82224e0
	.xword	0xe8f109bbeed47cad
	.xword	0x7b8311f495c1609e
	.xword	0xcc44c9d0bbb732d7
	.xword	0xf0b8cb524d4932ec
	.xword	0x1f961c2afebb544f
	.xword	0x14726c8ba796642b
	.xword	0x0db90b90aaa88664
	.xword	0x1a1bbe585089ba8d
	.xword	0x00972cf0c3ee2179
	.xword	0x318d686003228c5f
	.xword	0xcf4d2f32f6b48da0
	.xword	0xa120e5e4c763dd8c
	.xword	0x79384b76064a1035
	.xword	0x63ec96503812b841
	.xword	0x8cbd0ecb050dff59
	.xword	0xc56c0c943ee403be
	.xword	0xc59a32587fbfdbef
	.xword	0x7b6ba42d18d69458
	.xword	0x09bb7bac026ec519
	.xword	0x7cff0d85bc423b56
	.xword	0xa67a8e558ad3b914
	.xword	0xcd6c2ad184f2a932
	.xword	0x2f8a0cd088e9c56d
	.xword	0x9b2d6fb9b90c2b45
	.xword	0x5fdde5c243ed258b
	.xword	0xe8b1b0443b6170d4
	.xword	0x097912018f1fd852
	.xword	0x1eb7f3387083eb0f
	.xword	0xdfad2f8e37b71e6b
	.xword	0x016f6d1de21378e3
	.xword	0x894c511ee9cf0774
	.xword	0xad00f1390ebe67b2
	.xword	0xab0e8e0e3b45f083
	.xword	0x37516c7cf6cc2b5f
	.xword	0xabffbcecb3f9802b
	.xword	0x07da4ac170d84b0d
	.xword	0x0685da60c1fb03f4
	.xword	0x169808fc63b55bdb
	.xword	0x26da2d155c6fab82
	.xword	0xc41987b163f4911b
	.xword	0x8952ceff15f92fb0
	.xword	0x6d31919dcc326dd0
	.xword	0x00fb0e4d98f60cce
	.xword	0x828477f996bfc401
	.xword	0x87311383efead1bc
	.xword	0xc07d1c355a18dc13
	.xword	0xb5f8ead0398f7fa6
	.xword	0x356d5010d2ee2d9a
	.xword	0x00e0e9584efcf74f
	.xword	0x4ace4dea383e6963
	.xword	0xabff837e4ce85a70
	.xword	0xf46413a7e01d85b2
	.xword	0x2b2772977f7012f1
	.xword	0x509d446b05859959
	.xword	0xa91327f3af682865
	.xword	0xb6bb4260182c59d6
	.xword	0xf21aced2eb7d8cb6
	.xword	0xd81603f7a11326e9
	.xword	0x8651ba020bee6901
	.xword	0xcb5e4f4193209cfe
	.xword	0xa04a7c8972697953
	.xword	0x008e586db7f88771
	.xword	0xf9678373ec749cd8
	.xword	0x74e8977d44164896
	.xword	0xebf46e589e594667
	.xword	0x0150cc20582f9e37
	.xword	0xa1aab242abdf8279
	.xword	0xec5e40748a6d5c1f
	.xword	0xf8b67f2e6f62b360
	.xword	0xb9382459ba64576b
	.xword	0x6a63f9ef69d3673c
	.xword	0x753148d53dbc1d41
	.xword	0xf878e8f77974c5ed
	.xword	0x471664f4dc0de9d1
	.xword	0x46687d51d0f9e456
	.xword	0xc05571eb41930503
	.xword	0x42b737ff729d71b9
	.xword	0xcedd82ae4e9e47ab
	.xword	0x905d84e3989eea78
	.xword	0xfa04962c1be321c4
	.xword	0x015826ef0b78d278
	.xword	0x07278d7ff067805c
	.xword	0x341593e074969eb9
	.xword	0xf3420e4579b14f0d
	.xword	0xf68bb8775efa3b91
	.xword	0x64df2cc91a63869a
	.xword	0xddc017c93b1bc92e
	.xword	0x210127c43d271330
	.xword	0x618f06265ac6cb29
	.xword	0x2af5615a8169101b
	.xword	0xfdfb16b384b780ad
	.xword	0x9297025283cd2571
	.xword	0x1e92f2d8a6ccdeb4
	.xword	0x0795b1eb89b94db3
	.xword	0xfdcbf249ca718c09
	.xword	0xec0e8c89e3a80175
	.xword	0xfe8762ff0ce445a7
	.xword	0xc71683933212bbe0
	.xword	0x8f13e3d91d4c3c5d
	.xword	0x5afd5bde05f516a1
	.xword	0xabfa8b92cfbb2798
	.xword	0x7b174cb9ffc6e29f
	.xword	0xbc4fc193878fe280
	.xword	0x3d38ea9f488d5864
	.xword	0x2e0af1ff40ec7ea5
	.xword	0x741fe0bcfdcf4a02
	.xword	0x3cc3cb282ad2ae85
	.xword	0x9fb42953f900d0ab
	.xword	0xab0f88f19da9b87e
	.xword	0x463d5a16d4fbf411
	.xword	0x11d205daaba45c53
	.xword	0xf0cc2fa8fde622ff
	.xword	0x0f59033c0b0c6d4a
	.xword	0x412473e89e1a9abf
	.xword	0x601b825f0d601bdc
	.xword	0xece2e1a147104498
	.xword	0x64055aa0b5444d02
	.xword	0x6f9feb13671c04a6
	.xword	0xd281ee53b9cd94a7
	.xword	0xbc157d280286eb6a
	.xword	0xf6c4ee0808365635
	.xword	0x9fa6544189cbeb3b
	.xword	0xe28c362e45cf2871
	.xword	0x477d173bcf3d170a
	.xword	0xd77149408b2ed317
	.xword	0x83f12acd6b367c94
	.xword	0xf5605ae67236eb1b
	.xword	0x4c4f6942ae16e875
	.xword	0xb612782ee7078422
	.xword	0x7c50211a6cb3793e
	.xword	0x39015a3f8a494044
	.xword	0xcebc7d03e32ee8c4
	.xword	0xafa88d04e2d84a7b
	.xword	0x626fce5c82ceec54
	.xword	0x33ef2f4387a7c75e
	.xword	0xd85f914fe9b1acfb
	.xword	0x551ca26e1ee31422
	.xword	0xcddc3f048f43f595
	.xword	0x6b2e798abe0916b1
	.xword	0xfa1b3a4fcd744e36
	.xword	0x237151c3cb529d67
	.xword	0x88dfd5f20217b5a1
	.xword	0x25f71a779bbca21f
	.xword	0x007c12193799d931
	.xword	0xfaaf83f910d14c52
	.xword	0x2ff7f7af615fcc29
	.xword	0x12211b1a6f04c7d3
	.xword	0x30428fb9f44a6636
	.xword	0x036ff3d2f3d2ea76
	.xword	0xaa15e4fc1d19820d
	.xword	0x0675d15c8d3ccfb1
	.xword	0x0a488e7c00bbf37a
	.xword	0x4e2cbf42b16979e5
	.xword	0xa9b73482d0b64739
	.xword	0x86d7601b377694e4
	.xword	0x3dcef65d20395859
	.xword	0xe67a4aebfe4b50a5
	.xword	0x2965ae110a43648b
	.xword	0x54b954a1f8ef09bf
	.xword	0x2847f47c86d48f09
	.xword	0x3a7b1d5751610717
	.xword	0xafa961222d935ab7
	.xword	0xbb07a35b98fd6d64
	.xword	0x75b37c8270e1c459
	.xword	0x2d21502742a57f7d
	.xword	0x02160c4a51902439
	.xword	0x632a256afc5ddbdd
	.xword	0xc56f52c6139fec68
	.xword	0x810b5968d70638f3
	.xword	0x68ccca7e12be334f
	.xword	0x6dd72a50769a4940
	.xword	0xe59eab77ffae41cb
	.xword	0x396e9686b8b3ddd3
	.xword	0xc4b29764d1231076
	.xword	0x43c4d4a3c6deb1c5
	.xword	0xc59d9306fa1f7548
	.xword	0xcae557e3da12bc52
	.xword	0x4d17a590f144e030
	.align 0x2000
	.data
data_start_1:

	.xword	0xf03efb9fa9f9a001
	.xword	0x21af3e172513aaab
	.xword	0x50a536a6c0d91aea
	.xword	0x27f1245658e65c43
	.xword	0xd7ebf9c74f82f561
	.xword	0x59c07ec5bc6f2a66
	.xword	0xf86244ddc4b34481
	.xword	0x7e8bee13c0eb6e5a
	.xword	0x006a093037e7579a
	.xword	0x04c918daf821fbcb
	.xword	0x48c304c496430623
	.xword	0x0e5a6aa4a4d02b4e
	.xword	0xe7eb7cd0db9f7f90
	.xword	0x518338bb57beb8fd
	.xword	0x4f8714e8bc767939
	.xword	0x7cc00e8b9190b842
	.xword	0x19a3ee03c80366bb
	.xword	0x3f9fbf952d6ab775
	.xword	0xbeaaf311e603c08c
	.xword	0x6ee4dea697e172b3
	.xword	0xfbab3bb35cb66e0e
	.xword	0x3830330db5b2e0a8
	.xword	0x258ca50fb9746581
	.xword	0x5ffd592426da8c3a
	.xword	0x46669ccbf9ffd904
	.xword	0xe902e694782bf0d8
	.xword	0x7ffbd794deb249c7
	.xword	0xffdb50e075a78fb3
	.xword	0x2bd73dc9f4eb5511
	.xword	0x81aac1875d9796c4
	.xword	0x861285e3fa75834f
	.xword	0xaccdd691af4efbd6
	.xword	0x715dabc3dcba9c0a
	.xword	0x96e400f8350d2a29
	.xword	0x3efa3c194672eb09
	.xword	0x49ee82e67286a735
	.xword	0xa0ec1bf2e8b89caf
	.xword	0x36ed39c0128e76c5
	.xword	0x7e41b66a8fb7bf49
	.xword	0xdd032e773d23b875
	.xword	0xd48eb06e75e3ebb1
	.xword	0xbc5fafc3985a7dfa
	.xword	0x930e74dc71bcc8d9
	.xword	0xb68d37446b338701
	.xword	0x0c2aa890fc5f178e
	.xword	0x4d3647c7a7d81bc6
	.xword	0x5a7b83f56dd79343
	.xword	0xd4dc977f0b26d643
	.xword	0xea4bf7e26327ca22
	.xword	0xe2e981077b6d36c9
	.xword	0xd232e17c0408c138
	.xword	0x2dba633efde5878e
	.xword	0x20d054755f7f0ee7
	.xword	0xe616af55cc035c13
	.xword	0xdfc9f981908c83ae
	.xword	0x31e3b12556ff5e0b
	.xword	0xf91347c7ca1309c5
	.xword	0x90024f5bde0ba0e4
	.xword	0x1a1ec55e4121ebe6
	.xword	0xb26e828a228c145a
	.xword	0x4945cee1f3f1bceb
	.xword	0xbcea50512983464c
	.xword	0xca1da7ac69835394
	.xword	0xf6bd3e5c3353b0c6
	.xword	0x48caff476e0eabcf
	.xword	0xb72e92975b4d97f4
	.xword	0x41b96647f8c870c0
	.xword	0x04b70288f61c661b
	.xword	0x72ddce970b50fdd4
	.xword	0x09ae3d8708872648
	.xword	0x2f70882532a82187
	.xword	0x58f6f9301935fa51
	.xword	0x32dbbaf13633d1e6
	.xword	0x127c02e50b6a2a03
	.xword	0x53cf646b26a15258
	.xword	0xc24e47fbba8a3650
	.xword	0xf74d59d6140e97eb
	.xword	0x2aea6e1d0321a5ec
	.xword	0x784ab979c8793f15
	.xword	0x069c721e0b271467
	.xword	0xd1b5390889a1ce64
	.xword	0xf10f38cb9f8d96f9
	.xword	0xbc94582ef5dbacf0
	.xword	0x80bf4f272ab456f6
	.xword	0x73c89c16a622d5f2
	.xword	0x2a9a11698ff6c8ac
	.xword	0x8e3a9bb35962d75f
	.xword	0x25fe773873d31b24
	.xword	0x705410a98b6816f5
	.xword	0x02a45406044fcce8
	.xword	0xf96c05696ee0341f
	.xword	0x749c50909a4cac5a
	.xword	0x5e2c81ca03ed114b
	.xword	0x97799a9efbd478d5
	.xword	0xdc16f54b536e09c4
	.xword	0x52f271f32c4dc08f
	.xword	0xbb007f89f9f0cc41
	.xword	0xd1925946811309e7
	.xword	0x1820755e00701160
	.xword	0x067f5d7c3c9b7de7
	.xword	0x23220ece30206cae
	.xword	0x6cf1cf4c58e2dc8a
	.xword	0xa5c237edfe7b7831
	.xword	0x49e19cccae200f9d
	.xword	0xeacd1ec6db1dfd7c
	.xword	0xb326eb4bb2258df0
	.xword	0xa922116db553e574
	.xword	0x2d189de8e7cb7b6d
	.xword	0x3775a07920cab7be
	.xword	0x98a7c696b4099130
	.xword	0x605cd0cebdbe7ebe
	.xword	0x784a0c14375517e4
	.xword	0x3ac1d3cd550be3fe
	.xword	0x9042b5e254b0b41d
	.xword	0xba9b8d29e2390bd8
	.xword	0x5fa0c641ff9b6cdf
	.xword	0x256fe0f385488db3
	.xword	0x66a9d2992d765ecc
	.xword	0x574e882774f6f63b
	.xword	0xb35117ccb771ad57
	.xword	0x4d4163daac0aa27b
	.xword	0xd07c11bc082a618f
	.xword	0x111ce37aac4f3cc5
	.xword	0x47ab55eea7c124d0
	.xword	0x55acde5ffeea7667
	.xword	0x27469ae02e83c55d
	.xword	0xf5a63047e56f2937
	.xword	0xea99f85277e9d5cb
	.xword	0x88630b50899311a1
	.xword	0x8433e7977ebf0053
	.xword	0x50270d907db92f13
	.xword	0xf6f595f6d897140c
	.xword	0x2eb1faa9c4c05989
	.xword	0x82b24c7700550cdd
	.xword	0xb118f33cb2280740
	.xword	0x0581aad51c577c6e
	.xword	0xc75c4692aff0bf9a
	.xword	0xa6b2ba7b068bf24c
	.xword	0x61000c11d5688edf
	.xword	0xdf51d5d6bacf162a
	.xword	0x782f35b6af6ba5dc
	.xword	0xbbfce16e0a7df23f
	.xword	0x31c2de4bc18a585b
	.xword	0xb37bf1d5f0b78a93
	.xword	0x75f3d3c5fd29b57f
	.xword	0xdcf010f2dccbc0ed
	.xword	0x2be33eb14e42ca23
	.xword	0xe1418c589fd67fd2
	.xword	0xe80aecb73c352a09
	.xword	0xa8acefb5f0631cc5
	.xword	0x386318f808117ced
	.xword	0x46c585d43e5abc23
	.xword	0x053bab8c89936fa3
	.xword	0x19db6ad499ef4c42
	.xword	0xb79dac6949990213
	.xword	0x8ca21d24818a0b3a
	.xword	0x491aa1fa524eac42
	.xword	0xd6465a73cb2e2db4
	.xword	0x96d85f4ebb5abecd
	.xword	0x435425d039ed2389
	.xword	0xd607e418606d3fcc
	.xword	0x61302c01406e3f48
	.xword	0x918958aabffbfb33
	.xword	0x96d67b539e94a64d
	.xword	0x550b2751964ec55e
	.xword	0xdc4bb7c1f01f4dca
	.xword	0x784cc28500034ba7
	.xword	0x087a479d63a3acbd
	.xword	0xb4e1517746c43a20
	.xword	0x4f65d176f5a8c5b1
	.xword	0x9a71cd6ebbe17bf1
	.xword	0xfadc1714f53be120
	.xword	0xa980ee8c4011e601
	.xword	0x8a22d2aa83a3316e
	.xword	0x4375c4abe8ed2fb1
	.xword	0x026212621e45013c
	.xword	0x44c02873394cccd9
	.xword	0xe73d1d9668788543
	.xword	0x98c0eb76ece103b2
	.xword	0xf63d76330f2a1f67
	.xword	0x2846d1338f40c5d9
	.xword	0xe8aab8c72f076eff
	.xword	0xe4b610387dce5a5d
	.xword	0x8cc06f6a4817a125
	.xword	0x067756756409a437
	.xword	0x8011a2657a3b12f1
	.xword	0x5af5d1a171824536
	.xword	0x856ee559ba15228b
	.xword	0x5d07a302c4476d4c
	.xword	0xf996e38f98c01a2e
	.xword	0x628dbc9a5febc5df
	.xword	0xed5d195e17e3c039
	.xword	0xeb1f8b024c7bb574
	.xword	0x064db87ea0c3c507
	.xword	0x2ed61695cec83ca2
	.xword	0xd07905c8a16a5380
	.xword	0x9d0812d0c5060614
	.xword	0xea4b8c144ac8ecf4
	.xword	0xd1b8f8a2915d2fdb
	.xword	0x443401db61fffac1
	.xword	0x099cd6fc858454b0
	.xword	0x99e7019ecbbdac9f
	.xword	0xad7105c9d73436ea
	.xword	0xac4eb6b471e794c0
	.xword	0x40d83cd5f8d9840d
	.xword	0xe023d93a73937ac0
	.xword	0xd28bd273d280728a
	.xword	0x09981c6e99cc53eb
	.xword	0x0db5013e2d4f1eb5
	.xword	0xd05ce612dcaf7730
	.xword	0xedae000aa9954e2d
	.xword	0x4fcacd473cfa321d
	.xword	0x3db02ab109532668
	.xword	0xb0f4811cb8afd82c
	.xword	0x35ea7177a9fd5358
	.xword	0x43d8711fcc4590d1
	.xword	0xc560738a809bb13d
	.xword	0xc4435eb55ea97c7f
	.xword	0x1916d46e1582ebed
	.xword	0xd683baf259b2cfa7
	.xword	0xe095ba2a510b334c
	.xword	0x8a127c99ecd29956
	.xword	0x766e1646ff0cc27b
	.xword	0x6675dc5d373991f7
	.xword	0x30577f6c9eca9e9b
	.xword	0x3a1af88113381e44
	.xword	0x4ec87773399a816f
	.xword	0xcbe1b6423284b56a
	.xword	0xa24f3ca87e7ac814
	.xword	0xc15883556d04c1c6
	.xword	0x06f1c1e90e8ad4d9
	.xword	0xd16fa889484b2896
	.xword	0x720b3a7342ef9d32
	.xword	0x32803ea55fc8dcfd
	.xword	0x95642695c2761879
	.xword	0xa7a41226c69ae31a
	.xword	0x79677342571437ca
	.xword	0x135706b9416ed664
	.xword	0x3079f4f4da4d36a2
	.xword	0x04325a7fb6fa4d8d
	.xword	0xf8e5b1a1d633d908
	.xword	0x79f400136679806f
	.xword	0x884306e452709815
	.xword	0x2804e708d431c16d
	.xword	0xbca10e10d3a54bc3
	.xword	0x18c396e326d2d1eb
	.xword	0x69c8d0e26a3edd79
	.xword	0x222b53925a2bdac3
	.xword	0x08c71b4f14393c63
	.xword	0x4bb0465a323d0b5a
	.xword	0x083fb58119c692c1
	.xword	0xa5eebb9dc56a4992
	.xword	0x9992c54ffd75d6e8
	.xword	0x1db8673cf6a19a2c
	.xword	0x12d2420e6162835f
	.xword	0x26ec3585ca357c7f
	.align 0x4000
	.data
data_start_2:

	.xword	0xef7102661ee394da
	.xword	0xa3468c9b6e1913ad
	.xword	0x7b488df92566bc31
	.xword	0xe75fa204cee1ebf7
	.xword	0xd4f06541d8e229f2
	.xword	0x51fe540d871dcda3
	.xword	0xe453fe826b9e529c
	.xword	0xf8c4afb6cc3ee6c7
	.xword	0x77766f3e24e6deca
	.xword	0xaf5062c98ce658e0
	.xword	0x7f4f64b7e8c346bd
	.xword	0x1947cb5a4183ac2d
	.xword	0xb86bacc38869e018
	.xword	0x13674c1cb43977fd
	.xword	0x48fbb632425dbcaf
	.xword	0xb52b590e050c6bf1
	.xword	0x6367fb530d105171
	.xword	0xe97fb73653afb897
	.xword	0x9d0ba110a5f1e992
	.xword	0x426b816b1fc827cf
	.xword	0xc197d21b11bea075
	.xword	0x10e76d14bb99efe1
	.xword	0xa6f27bfe828ec479
	.xword	0x8de3cc13e1bd6556
	.xword	0x76c806817d25a6df
	.xword	0xe50499bf55be81ed
	.xword	0x118be71a27d94276
	.xword	0x32038ca03ad83329
	.xword	0x69b69b73c3ef7811
	.xword	0x677cf152b116165f
	.xword	0x98f09e88ee907d08
	.xword	0x79c89636242c2c19
	.xword	0x9951d4388f646cd9
	.xword	0xd95b6a271b044d46
	.xword	0x2c7827e4b32d2474
	.xword	0xa316d6f10b9ab244
	.xword	0x63c83f6878130608
	.xword	0xa5b6f19b6e0cee9e
	.xword	0x03a6fe827cf310ea
	.xword	0xc29e702de8e0001d
	.xword	0x290ddc76789852ff
	.xword	0x9c70c253e34c908b
	.xword	0xbcb2324e442dd1fd
	.xword	0xca44102fb0fc93d4
	.xword	0xe122a063bf9a2ca8
	.xword	0x8516b3c3fc6d3778
	.xword	0xae73803455e62e35
	.xword	0x866668af35ff7e99
	.xword	0x26fe6999d98f2793
	.xword	0x0dee57f1525daef0
	.xword	0xeef3875988f95953
	.xword	0x92976abc70298c74
	.xword	0xebff9d33e9a599ef
	.xword	0x77c8c8518d6cdd70
	.xword	0xef1a649081a05cd5
	.xword	0xcec02a76d1bac9d3
	.xword	0xc1ae397351bc897c
	.xword	0x0bce46c227ec04b6
	.xword	0xb8531ca135220302
	.xword	0xf632be3a23485843
	.xword	0xb1083493de2e3572
	.xword	0xde83a6bc9f9d38fa
	.xword	0x2684ba2b051d8a65
	.xword	0x39348da9c34c76df
	.xword	0x5d50d61544af5d64
	.xword	0x4b28e68f897acfff
	.xword	0xfcb4ac2169b120e8
	.xword	0x0b16e031b0e86f46
	.xword	0x347aa9b81150b58c
	.xword	0x65cca879f1bb2130
	.xword	0x62b8fc13985043d2
	.xword	0xa6628485b6f534f1
	.xword	0x36173ab31ec4e449
	.xword	0x088d8242a20eb4b8
	.xword	0x9239976f6ada175b
	.xword	0xc9e6268f9411a453
	.xword	0xebe66ebd515fa28e
	.xword	0x1166e7aef76fe3d4
	.xword	0x952eac2b15b986a1
	.xword	0x0425178acc737b3f
	.xword	0xd0afebfc63f90894
	.xword	0x6090000ff33795c7
	.xword	0x5da5d7969eed136c
	.xword	0x80613511106d9fa9
	.xword	0x3e2625a6be047873
	.xword	0x2b527f3ef212a6aa
	.xword	0xf2f617a597ccb9b3
	.xword	0xdfb9618447ef2254
	.xword	0xc553ac295eaa0dbc
	.xword	0x176c4259c0b3f46f
	.xword	0xb63208ab3201a782
	.xword	0x08f1146d76d5ef41
	.xword	0x5786db2db1cba521
	.xword	0xaf8faf13f4687a5e
	.xword	0x24731268dd8e1d98
	.xword	0x45e9a7d11cd6f342
	.xword	0x960bce2e1163fc03
	.xword	0xee262275f9d7efc5
	.xword	0x19c2bbfe42373914
	.xword	0xf7cfd324b4ca0e6b
	.xword	0xed7b1fdaf280715e
	.xword	0x838745040dee92c5
	.xword	0x5c4ce6914fe2bdc7
	.xword	0xc8cd7226b362eadb
	.xword	0x4057caa60275794a
	.xword	0x5dce35f9a1980861
	.xword	0xea7f5653ff01e97f
	.xword	0xab2b1c87e3e9adde
	.xword	0x2528162e0df8039d
	.xword	0x674a7c900151fb77
	.xword	0xb8ea0aa08636e0fa
	.xword	0x0c07ea12d01d0b14
	.xword	0xd900286dce7c58a4
	.xword	0x43aa4c6151c0ff18
	.xword	0x23f6b72e808d4490
	.xword	0xf3ca42f1db57957b
	.xword	0xe82c2e50417c1b03
	.xword	0x37770c701b05e416
	.xword	0x9a8dda77d8dfdf6b
	.xword	0x62c31679ec6985f1
	.xword	0x51c3690207ef4d4e
	.xword	0x92d5edb3f2cf356f
	.xword	0x616cd0605d4fdff1
	.xword	0x2382cf87a25d8f78
	.xword	0xecc9ed10b9094adb
	.xword	0xc50c3b42f6863a4b
	.xword	0xcb6b0b7e25b64b03
	.xword	0x65ecd44007e0e357
	.xword	0x2e4dd6bde4365edb
	.xword	0x5f4a83586662a0e0
	.xword	0x45218ace647f8202
	.xword	0xbbfc9ad0256d4ec5
	.xword	0x2ba00f381f049219
	.xword	0x446020cdee555ab0
	.xword	0xe49440128502b555
	.xword	0x3d668713fc731140
	.xword	0xa54a54c70342a23c
	.xword	0x6435200bc831c5e3
	.xword	0xbda8066d73ea139b
	.xword	0x11ba78e84e0e3ec3
	.xword	0xe076d06fe13b29c8
	.xword	0xed28fd6e24a1090d
	.xword	0xc6b104426b333aa1
	.xword	0x53211526e106f17a
	.xword	0xa9f9841cf63624b3
	.xword	0xa884349e9bd84ef6
	.xword	0xf5d0c440418abb3f
	.xword	0x566bc5408c615c03
	.xword	0xf9a0f1e1fbd15a9a
	.xword	0x5566688aeb10c7b2
	.xword	0x2d1617c9afd7572d
	.xword	0x8c37ff26024ad463
	.xword	0x4a46fe99efe781af
	.xword	0x6c942e24d96fdf4f
	.xword	0x3d39fd486af73166
	.xword	0xd85cffd3d70a8946
	.xword	0x459b6f1235521f70
	.xword	0xa712143607d19fe7
	.xword	0x38affce98c882473
	.xword	0xb8719205408d0f63
	.xword	0x3db126fa747675f1
	.xword	0xe432a763cc16073e
	.xword	0xf5f6023f21c9e345
	.xword	0x1821f1da6cea1c82
	.xword	0xad8b451c8894627a
	.xword	0x69c69ee6b7584673
	.xword	0x8906c5746c649195
	.xword	0x25f293a7152e6a8b
	.xword	0x2c0ec73d5e3a58ca
	.xword	0xdbb4cb92f4d4a658
	.xword	0x313f2c493c995a2b
	.xword	0xdce7e80718bc15ab
	.xword	0xbc867081953c4a64
	.xword	0x430003c25c7bf412
	.xword	0x9e2d9e03982d6fe4
	.xword	0x29308b8f948e3658
	.xword	0xb00d60bcc7b16c25
	.xword	0xb429ed4f6390c0d1
	.xword	0x95a130b9adeeae59
	.xword	0xa9bdbd082fd83df1
	.xword	0xc13f75172cff603c
	.xword	0xb123931c0f3cd351
	.xword	0x5a93f750963573b7
	.xword	0x9cfb1c400b043d7b
	.xword	0xcd87ecee09baf76d
	.xword	0x6eb3875a2b310607
	.xword	0x2bdef6f1cd795472
	.xword	0xd062b2f678a6ccd6
	.xword	0xd4007715199e3e48
	.xword	0x5ddb59eb89af1b03
	.xword	0x937024d2e7979106
	.xword	0xc381c7093958326c
	.xword	0x148bd1083d893f41
	.xword	0xe6e1346238378de9
	.xword	0xcc93f094f2496262
	.xword	0x9de0c200cd150f82
	.xword	0xc1a1490a7240107a
	.xword	0x47c065ed5ed1f80f
	.xword	0x8d36299be930625b
	.xword	0x5c1bef8208b56908
	.xword	0x650b6ae94537cde2
	.xword	0xa7ab5641df69a05c
	.xword	0xc840223dd66611ef
	.xword	0xc5363bf7547aae8a
	.xword	0xdc259bbea89fe310
	.xword	0x6e274e427f63a268
	.xword	0xd1105648d87c7427
	.xword	0xf2be0e36fea8619a
	.xword	0x1e3c79b0f9056fe1
	.xword	0xee9e46ed04950bbd
	.xword	0x53ddea810d27000f
	.xword	0x205317bc7535cc52
	.xword	0xc697b2052979950a
	.xword	0x8c5607bf35b055f2
	.xword	0x2afa1d36ae954c04
	.xword	0x3578497d8dc2cf45
	.xword	0xbe9a022c9bfe31ca
	.xword	0xb148710dd62fe956
	.xword	0x1d16936a0f6db832
	.xword	0x8b0e340075e6d0c2
	.xword	0xd2d429b039d705cb
	.xword	0x88d9835915091dd5
	.xword	0x689affe867bc4176
	.xword	0x00f63baa33b81fe9
	.xword	0x384e765043ca7381
	.xword	0x1d7866903c1c28b3
	.xword	0xe81c626e43035fe6
	.xword	0xd06a427f469918ff
	.xword	0xfffd1396aa5abddf
	.xword	0x32cbc6f2b61fc864
	.xword	0xcc1d94b7c8a929e3
	.xword	0xde2d069abd563647
	.xword	0x328f5c0c3ddcfa42
	.xword	0xbdf99475d1b160db
	.xword	0x7b204d2690f81017
	.xword	0xb9cb58360ffd4fa7
	.xword	0x17b839fa3e31bb5c
	.xword	0x97561ab34b4588f5
	.xword	0xd3c006173acad62e
	.xword	0xce5980a472594a3e
	.xword	0xf6199afbfe2be5ff
	.xword	0x423a38de9c7464f7
	.xword	0x2319b2dc0754afc6
	.xword	0x2312c8503b2cff9f
	.xword	0x6cb244cc3f5339ed
	.xword	0x53490cae76d442bd
	.xword	0xd35b71e35af36461
	.xword	0x43969e22507c6526
	.xword	0x14c4ba99a2639580
	.xword	0x5c795a9bb0df5e1d
	.xword	0xd3821c6b9e813721
	.xword	0xb374e8ea4f6196c5
	.xword	0xfe10473d4875cf18
	.xword	0x383e91d31644011b
	.xword	0x25a856f804e68d58
	.xword	0x6208feb6ede94b06
	.align 0x8000
	.data
data_start_3:

	.xword	0xb2e4809c973c59af
	.xword	0x09b64c0395f1ef32
	.xword	0x922e5a1d9cfc7662
	.xword	0x3e30128bd8badac6
	.xword	0x724ca25c392f6aa1
	.xword	0x320930d4d4477f92
	.xword	0xfc91b46b903f2ed3
	.xword	0x663b42e36ee4423b
	.xword	0x07565b3b1c7bb615
	.xword	0xa820be1ff1e7eb97
	.xword	0x63d68a6de7010c4d
	.xword	0x03b0a6b335ba0716
	.xword	0x7a6fb6bc42039696
	.xword	0xf7f12d0bef8c3bce
	.xword	0xf796851b20f9ddc7
	.xword	0x86d5a1dea5961ca6
	.xword	0x3fac29cba950fb3e
	.xword	0x5ad69c9920bc8f9f
	.xword	0x3c0f123be2cda9f8
	.xword	0xa0d1ad9e281611f0
	.xword	0x0768286219d533c5
	.xword	0xcee8fc0dd1db41b9
	.xword	0xfd917e00045134ba
	.xword	0x6b598b3d15a1cc90
	.xword	0x33e1bc6ab0beebfc
	.xword	0x4632f1a620482be7
	.xword	0xe65d89085a399142
	.xword	0x10a51a7e017b9fc5
	.xword	0x9495b51843e633fb
	.xword	0xd488f94a8b4d170e
	.xword	0x4a88a57150b9f35d
	.xword	0x1b53c8271800049c
	.xword	0xd20c2ad1847e57ee
	.xword	0xa1164109e69367ab
	.xword	0xbf32be4136cf83ea
	.xword	0x54bbfec59529ed3d
	.xword	0x18ce6d71f8ecda25
	.xword	0x3869455322d9e7d7
	.xword	0xfaa22e38e16036e0
	.xword	0xf1925cd92916b1be
	.xword	0x07b292ada8b2b094
	.xword	0x65978057a5cac882
	.xword	0x45f920bb9a7c8ecb
	.xword	0x497c1a2a134e4d2b
	.xword	0xc385cdcdddefb21e
	.xword	0x5b89105c1a996627
	.xword	0x456cd0e1d163339b
	.xword	0x47870022d737daae
	.xword	0xc52ca9ec1714029f
	.xword	0xe58309949a5d24f8
	.xword	0x981fe7b262709a60
	.xword	0x01da34a988dcd2d2
	.xword	0xb185bd979368176f
	.xword	0x0c3b2450ac684ac7
	.xword	0xd9d3c876abd1875b
	.xword	0x686571bc48126c70
	.xword	0xf1d1f2ba228e3fe4
	.xword	0x59c97d7fa94882f2
	.xword	0x329376bd0386cad9
	.xword	0xf76ba4b09f10a091
	.xword	0x11a34683aa0debc3
	.xword	0x4b2e678cfa073373
	.xword	0xdfbfb91288b80afc
	.xword	0xb11e7d543fad79d8
	.xword	0xc701617957053c48
	.xword	0x7a8daea4df7343d8
	.xword	0xfa98f2bec985f978
	.xword	0x0356894508bae88c
	.xword	0xba05ff4c5bdab2ba
	.xword	0xf6593dea9604bdd0
	.xword	0x7110111c3a03f6c0
	.xword	0x01c56fe713d8b0f6
	.xword	0xef53a2fa038d1c4b
	.xword	0xa5c0d31378646420
	.xword	0x6301dddba7acd14d
	.xword	0xa93c721a9965037c
	.xword	0x594d8ee06d5c5ebc
	.xword	0x9980a75dd6aad631
	.xword	0x22a01acd3f64f93a
	.xword	0x333f6ff81d2383f2
	.xword	0x249ae45064319bd6
	.xword	0xa3f97042d9f8b296
	.xword	0x3ca41ff395058a89
	.xword	0xbc8e5745b3c9eb06
	.xword	0x5391baa9b0f010fc
	.xword	0x8c79a4698692977e
	.xword	0x505783e2fb8b5ef1
	.xword	0x80d93cc30f94a8be
	.xword	0x6c4b438a34a88667
	.xword	0x078b31ebb38bae90
	.xword	0xc60eab2fdce84f9c
	.xword	0x893261ee63ebe496
	.xword	0x160bd9e86ee17433
	.xword	0x7fb523e24e588cb3
	.xword	0x09fc65e9e5046d40
	.xword	0xd852a2af33a1f187
	.xword	0x6de8193ba5f90008
	.xword	0xd8c6544c05c81dcf
	.xword	0x8421163138f3cebb
	.xword	0x779c3ada0387d86c
	.xword	0x7d86b401cbc429a8
	.xword	0xb2fafc4f5c57658d
	.xword	0xc3502449494baf47
	.xword	0xbb4ee110a634764a
	.xword	0x125657b9489c00bb
	.xword	0xf0865c583ff6e7f6
	.xword	0x82ada30b18690d82
	.xword	0xadb91ea62c9be15a
	.xword	0x8ebff945d72b5f2f
	.xword	0x8925cc556256b858
	.xword	0x1e4b27994f382141
	.xword	0x341f47bee98a9bac
	.xword	0x9dbe94d8dc43fbdd
	.xword	0x10b3ceae9073c567
	.xword	0xae30b364a6573420
	.xword	0xb9c7a1b07ae26c35
	.xword	0x0e6bc4f9f944d59e
	.xword	0xbe78099ed01aa739
	.xword	0x197a39b66501cbdd
	.xword	0xca5ebe4d893a553a
	.xword	0x4129f3c4a189acd8
	.xword	0xd34046eeebb4436c
	.xword	0x12568a3c5c651da7
	.xword	0xc38ac706b28431df
	.xword	0x52386abc2f409794
	.xword	0x88e8cf43a35f4555
	.xword	0x8c5d433edb307b72
	.xword	0xc15b6630b9958d61
	.xword	0x7ec756d3f57f47cb
	.xword	0x1e0969829ba078c3
	.xword	0x52698e0a318d9807
	.xword	0x7c537cb6059a60d2
	.xword	0x6ceb469b2f54dac0
	.xword	0xfc02bdb7198955bc
	.xword	0xcc6a9c5a1d7331d3
	.xword	0xb3fc75d8eeab9b77
	.xword	0xb20cdc0e26969945
	.xword	0x132133633d605326
	.xword	0xef103f9662dac5d9
	.xword	0x26903cbcd40934e7
	.xword	0xd5064a1324f483fe
	.xword	0x215d1c016f9fc884
	.xword	0x7b577ee4dc9543bd
	.xword	0xcca34cc07178ad40
	.xword	0x975baa4981ad01f9
	.xword	0xc5f71596568b9a5f
	.xword	0x62a6c15a1e77030c
	.xword	0xc22f718a57e4ce7c
	.xword	0x4b1b9c7391ed168c
	.xword	0x7e7fd43bee7942e6
	.xword	0x196b804c52ee955e
	.xword	0x479ee1d26b900ddf
	.xword	0x43750e9114124363
	.xword	0x33dc8ee67554d5cf
	.xword	0x2fe98916fa2f2fe7
	.xword	0xcbd780341833a20f
	.xword	0xaee964b076d7419f
	.xword	0x7bb0eda72a27a470
	.xword	0x48f294440548190d
	.xword	0x6a991da3ba37b68f
	.xword	0xde7d848b5a0b1160
	.xword	0x9dc7d28d4aabbed7
	.xword	0xec06d797af8f4eaf
	.xword	0xd76e32e56a4667cb
	.xword	0x87f325f4818a8089
	.xword	0x5b0cd9351f338889
	.xword	0x83e77f30c246fc04
	.xword	0x4ae77cfa2b50a296
	.xword	0x5d30f493a1232ecb
	.xword	0x06c45fdd33f4a69f
	.xword	0x37e08925700c6726
	.xword	0x6dab91c567ecee8a
	.xword	0x0038ddcb8c33c1ab
	.xword	0x36eb79a8776857ca
	.xword	0x78d3f5462e0f4048
	.xword	0x1f0987ba5cba2a96
	.xword	0x22790e925910b847
	.xword	0xd97b5cdbb57323f1
	.xword	0x72b891b6098cc40b
	.xword	0x11a238573889aa14
	.xword	0x896fb99c1af63b6c
	.xword	0xf6b281d9f7c0beae
	.xword	0x3d154cdf1ce648a3
	.xword	0xd1aadfecd57c225e
	.xword	0x50eb7591d1db202d
	.xword	0xb807fcba2b23f239
	.xword	0x05335eb95bf22982
	.xword	0xb69f55badcfd3740
	.xword	0xc3a9970244aa4a2c
	.xword	0x9c71c10a77553998
	.xword	0x5dd72fee3209cef6
	.xword	0x1abea93349a35e9e
	.xword	0xd5e2c189668ad1de
	.xword	0xca731cfc195dd589
	.xword	0xe8b2525fb8cfdc82
	.xword	0xf8af64f01f0ce781
	.xword	0x486862eb4998d701
	.xword	0x6c8daca0d9e4df25
	.xword	0x851deb73442c3080
	.xword	0x84dc4a92448ba4d7
	.xword	0xc705d7d993465ca7
	.xword	0x56424fdf6fab4197
	.xword	0x53c14696aeb661ee
	.xword	0xac26348de267321c
	.xword	0x7e282f9bab198ce6
	.xword	0xf91d512b9450509d
	.xword	0xaafed730f1dd607b
	.xword	0x8a141bada0484b18
	.xword	0xdbff150affca5095
	.xword	0x7644f4a800a892b1
	.xword	0x5ede046f1dfee994
	.xword	0x80c0bb3ba01615b4
	.xword	0xcd58f768926f297a
	.xword	0xba60539e81c92afb
	.xword	0x938d22ed6fa1b34f
	.xword	0xc1d4a21c9bd9444f
	.xword	0x83556f85b8923c52
	.xword	0xe22dd8bdd77d0191
	.xword	0xd0ffd12403e73af0
	.xword	0x33a8dc9721a8cc6e
	.xword	0x62b2bb1fe044414f
	.xword	0x9d0b3e271e9b56b4
	.xword	0x92fc6bfcaa07613a
	.xword	0x9c364d59bc893168
	.xword	0xc5c8c6c4ac8191b7
	.xword	0x34c112612e3790ec
	.xword	0xde409f6dbeecc634
	.xword	0x79a2b9f53f29bc60
	.xword	0x79b58eb1c3e6461c
	.xword	0x8fe0f56a5f0aef52
	.xword	0xe09e484cd5acd08b
	.xword	0x7d0619e73e35c8f8
	.xword	0xafce590fd4f5f51d
	.xword	0x75457654a7ea78f3
	.xword	0xd278d50558284c5b
	.xword	0xf516778e4110255d
	.xword	0x57baa8c70182c801
	.xword	0xa48a56bc6699131b
	.xword	0xd09cbaa5d43d96a9
	.xword	0xa24cbf1d6137e384
	.xword	0x7527f8fc135a8107
	.xword	0x3b2faed239280b70
	.xword	0x0f2e9b8eb1185e27
	.xword	0xb8a278a3200ecfa1
	.xword	0xe37c63fd1620fff7
	.xword	0x7fb15f991826e780
	.xword	0xc36c2891d848be21
	.xword	0x8fd0d4dd49aa56e7
	.xword	0x285f8756aa3a54c1
	.xword	0xb69931faac85e82e
	.xword	0xc32dedd660aa45c6
	.xword	0xdbd037fba924060f
	.xword	0x799c60cad1bc8ccf
	.xword	0x057f607bc69c16f3
	.xword	0x4fd3fecd1395c41f
	.xword	0xb50729e017ccca35
	.align 0x10000
	.data
data_start_4:

	.xword	0xcce2b828c03b7b86
	.xword	0x08a6e678ca9eb0d9
	.xword	0x735d8e2e1c243dd8
	.xword	0xb49eb2ecd1049278
	.xword	0xdc4ebb11e3247adb
	.xword	0x767c537c4f99b35b
	.xword	0x3567731c23a7a3aa
	.xword	0x83107cb2e69cc0f1
	.xword	0x8be4ab369639f958
	.xword	0x115b71c62f55e283
	.xword	0x693ce4773bd9ac43
	.xword	0xa5aa97c0476c8a24
	.xword	0xb93d7042a237eeda
	.xword	0x3e05e349c28696fd
	.xword	0x912997f77edefa84
	.xword	0xdc259d4193492938
	.xword	0x6ede3eacb35f45ba
	.xword	0x203b8dd97f3b33a4
	.xword	0xc883da0097ba19ee
	.xword	0x066a18c55e481d82
	.xword	0x5c8cadb29512a1f6
	.xword	0x6c9925153c94bbd9
	.xword	0x3692ddbda4b516a3
	.xword	0xcab69007a97c7f61
	.xword	0x8660201af63492f2
	.xword	0xc4e5ca9dc5fc661f
	.xword	0x7929005336d23402
	.xword	0x9691bbe98af709cd
	.xword	0xdd6a374a28022a48
	.xword	0xef56d701f40ab783
	.xword	0xcaea8acb08e4387a
	.xword	0xd18aebd4cc3f6edc
	.xword	0x94f3ec622324801e
	.xword	0xdc0fd1d2cad102a8
	.xword	0xcd25b9651a1238be
	.xword	0x2946afef5e695e45
	.xword	0x90237192af638223
	.xword	0xa92037ded7ca6e65
	.xword	0x42bb7bec67bf0123
	.xword	0x20ed10bab4c5d112
	.xword	0x7f59e7ac779c3223
	.xword	0xb50e6b5c423fa978
	.xword	0xd5c39728a7d27481
	.xword	0x8abc8bcd16b3ebe0
	.xword	0xa53ad813b608336b
	.xword	0x373f8beb299dc84d
	.xword	0xc88a2e5a7bf60c04
	.xword	0x1244f40d1775dc19
	.xword	0x33c3bd1603cfb971
	.xword	0xa3696949ff7354c7
	.xword	0x91427a02e81eb724
	.xword	0x8105e4a7a67d7c5c
	.xword	0x03c0f81ae8e95e19
	.xword	0x6d606a9216bc1d36
	.xword	0x3f425ecab4d68e24
	.xword	0x321f57f15465012b
	.xword	0xe436663f4e86db94
	.xword	0xa37d21ba6f49c509
	.xword	0x6644e785738a07af
	.xword	0xab40ec68c1994f43
	.xword	0xfdd5d20fb0fb863c
	.xword	0xde024ead9ff6109d
	.xword	0x898b438a3a982165
	.xword	0x08ac37cc0dfe8452
	.xword	0x59abe1f84b795fa2
	.xword	0x1bebaab9957ab3f1
	.xword	0x024b448eac99372a
	.xword	0x51b366070eebf304
	.xword	0xf661a49ffff18045
	.xword	0x00d9ad66d7cb5cfc
	.xword	0x58c56bea3c704ac3
	.xword	0x2f1719c2c39918fc
	.xword	0xfd03904742731910
	.xword	0xf36f99ad163d3eb0
	.xword	0x5d9bca37f4ffd2bb
	.xword	0x54738894e2fd29ad
	.xword	0x4555fcf97178cf83
	.xword	0x441e062eb502ece5
	.xword	0xf3907e186de6e549
	.xword	0xec6c835930d4c585
	.xword	0xe663bd4465a52685
	.xword	0x06535ac2d4184a79
	.xword	0x59819686108ae211
	.xword	0xda4509c34d2d8fd3
	.xword	0xdeb9e9586748119f
	.xword	0xf65d1045ac31ad5e
	.xword	0x9fcde6384a03e22b
	.xword	0x8d558e447f41f529
	.xword	0x5a977471f5356399
	.xword	0x0d84bc829444c7cb
	.xword	0xbc401be65e33c613
	.xword	0x78c0574591450884
	.xword	0x4a24029c5f4b5fd9
	.xword	0x98811debb193485e
	.xword	0xac12a10abfc5f366
	.xword	0x964e2e0ace9224c7
	.xword	0xd1aa1a9f4ba0792a
	.xword	0x40e1c950b53956fe
	.xword	0x815c4dcc974c02c3
	.xword	0x5358bca18c6ac815
	.xword	0xc8cdcdbb6044e833
	.xword	0x8e688817ef758965
	.xword	0xbca5897459400fb9
	.xword	0xcbe217c264c207ff
	.xword	0xb07268a0a6afd353
	.xword	0xd3367d372105ec85
	.xword	0x548ee2b500d33b6b
	.xword	0x2a70ab4c1e5dcb98
	.xword	0xdebe66dc4b03d5d4
	.xword	0xc1a861b836730ff2
	.xword	0x439c152b9483eabb
	.xword	0x682c96996017062c
	.xword	0x83090886d8092dbb
	.xword	0x88b9d79684c729e6
	.xword	0xb6846e24b45c52be
	.xword	0xff4d2397faca326b
	.xword	0xd350c11bde72a7ea
	.xword	0xdcbf207aa99079df
	.xword	0x844df9ed61ff5ff7
	.xword	0x899baefdf9c459ad
	.xword	0x3a8919b4eabf9d9e
	.xword	0x0009c2c763655727
	.xword	0x3e4dbd68a8a88a38
	.xword	0xa42c4134d5ccb6a1
	.xword	0xf2defc69301e2eb8
	.xword	0x13e5269ee09795c9
	.xword	0xf34e6b13159cd372
	.xword	0x35fa67d64e884401
	.xword	0x85895780f2644c72
	.xword	0xad75ddcb285831e3
	.xword	0xee9949f15a15ef3d
	.xword	0x70fcc192f51cb801
	.xword	0x26eeb2b91b1616c8
	.xword	0x4f62baaec0820fd9
	.xword	0x07c522e57d35b27f
	.xword	0x425a9487db9ad409
	.xword	0x3bd4df6f0360cc7f
	.xword	0x3fd00c5aff301523
	.xword	0x4161d261308303ea
	.xword	0x31a71dda5b3396ce
	.xword	0x95038b5e9486e7a7
	.xword	0x9f843d1329934f17
	.xword	0xdc830390b009b61c
	.xword	0xdb4b0fba7b53410e
	.xword	0x71ded1d257c31e37
	.xword	0x557a072362930d5e
	.xword	0x0ab88bf10e8869d3
	.xword	0x552ab87676861bc4
	.xword	0x1a31f0d8ce70d2b6
	.xword	0x37a8be7e83fe1b39
	.xword	0x032bd014d057c639
	.xword	0xea55be03b7e5c06a
	.xword	0x0560d2be797deab3
	.xword	0x25857047ca671e8e
	.xword	0x60f7f5cf713ff58e
	.xword	0x7d3fdd530a69de85
	.xword	0x80d9f13c345e5ec8
	.xword	0x68496d4c84305bd4
	.xword	0x849982d4dc923762
	.xword	0xa4c53d2f34845153
	.xword	0x63d31f8d75681ed3
	.xword	0xf997a5b962ea652f
	.xword	0x22a737d4fa6a41fb
	.xword	0x8da54e5f9579ec91
	.xword	0x67daf0a48ef72388
	.xword	0x8045e581720be113
	.xword	0x51a3fac381215a75
	.xword	0xe13006596ca1ed2b
	.xword	0x2ee934e806ce44a2
	.xword	0xf7ab37e66e8fdc72
	.xword	0x4240325aa1d86ae9
	.xword	0x2eeeb9630dd5cc6d
	.xword	0xfd0afd1286e57550
	.xword	0x1591775bebe55e86
	.xword	0x96bcbde83b06fa32
	.xword	0x0e66f001b9892053
	.xword	0x6b6a85e9b062a2a0
	.xword	0xc899943490d4e5f1
	.xword	0x93520b2078b6f09d
	.xword	0xbe6246595110f17a
	.xword	0x9e0093755312a3a6
	.xword	0x8c542998ab0685da
	.xword	0x1711eabc081ec6c6
	.xword	0x03f506f0e7cc18ab
	.xword	0x3e433b1e0f30107e
	.xword	0xeedaf74b02b7262e
	.xword	0xe2243288b1df441d
	.xword	0xa0dd8ca9487beec8
	.xword	0xb0f551f2983115b1
	.xword	0xd311020e7ab1c231
	.xword	0xbd326d114e3b10c5
	.xword	0xf2660e60f2e5a8f6
	.xword	0x30f636df6612796c
	.xword	0xeb2af0fc44b17c6b
	.xword	0xfc1dc4c16b2100a3
	.xword	0x7e31b79b9472df35
	.xword	0x42e4bb6957189ace
	.xword	0x7c4eb9fa3ec38fae
	.xword	0x423081f2bffed3e8
	.xword	0x4608c1550a160f7e
	.xword	0xf51267eff186978c
	.xword	0x9dd9971a6112fa2a
	.xword	0xede0dee2d1f13754
	.xword	0xcac9e922c76f1e88
	.xword	0xe3ead5f7b08388f4
	.xword	0x793f3522bf026621
	.xword	0x1e430579fffc1072
	.xword	0x9aaa248c4cef54e7
	.xword	0xc7ff70898e8d5836
	.xword	0xc294eca7d6ad5259
	.xword	0xaf34b500a7b76461
	.xword	0x162f1e9e077231db
	.xword	0x492a64284cd2a035
	.xword	0x6acd953c47021b24
	.xword	0xb37722b0e173dcb4
	.xword	0x38989556389d3249
	.xword	0xbfb539b0340db378
	.xword	0x431c3ee3ff3dec04
	.xword	0x6abf5a3bb549e766
	.xword	0x911ea790ed9fa50b
	.xword	0x589d89b22e357c0d
	.xword	0xd5e995af399bbd1f
	.xword	0x78695ba7dd5eed68
	.xword	0x1c4c5ef45d4b9183
	.xword	0xc15c621fc65af581
	.xword	0x746ca2569a455278
	.xword	0x328f74021d747114
	.xword	0x8d2c14e05c039c1c
	.xword	0xea6248c8330de4b3
	.xword	0xc19529f658a17b45
	.xword	0xf07792f9f7797423
	.xword	0x5a5e172705a70c7a
	.xword	0x170d267a94778fe6
	.xword	0x08dc69c9d11bc065
	.xword	0x8f8f9700f463be3b
	.xword	0xb7391d7114b8922a
	.xword	0x7d48fbcbb84b6787
	.xword	0xc0e1c0ea69bb0499
	.xword	0x750980b4fc322074
	.xword	0x079040fbfe7c1b04
	.xword	0xc93f1486e3ce5292
	.xword	0xa1a012993cdf78b2
	.xword	0x2e5a54185f612baa
	.xword	0xca4d7aa4013deb74
	.xword	0x9c1eeb99a36118ef
	.xword	0x8d16b29b8d66ee56
	.xword	0x807447b44e524413
	.xword	0x7c88091f6a9758c0
	.xword	0x6f7cf73c8f0eaabc
	.xword	0x2e5a59737e3e78dc
	.xword	0xd9ee4d25ba8d1c2b
	.xword	0x1e2798fa1614cb7b
	.xword	0xf13be5ea2fe54e1d
	.xword	0x00f71cbe2839166f
	.xword	0x91966109307847de
	.xword	0x5eefce26fcb98fec
	.align 0x20000
	.data
data_start_5:

	.xword	0xd14763e89fe728c4
	.xword	0xa9651d43192e338b
	.xword	0xd85cb2cd81be4fe0
	.xword	0x86e22947802aed57
	.xword	0x86709205e9e647fb
	.xword	0x0cfbd53708956cb6
	.xword	0x0cc8d6630931b350
	.xword	0xe64114a51be5b636
	.xword	0x74bcd6c050f11b68
	.xword	0xa7e1c34f0cf93e27
	.xword	0x15297076ad0dc427
	.xword	0x3511885a05aa67b8
	.xword	0x810da826497ab18a
	.xword	0x662a6366e4fef059
	.xword	0x40a8d98baf924d1f
	.xword	0xd0d814d56414b623
	.xword	0x3e65892acbfc2ed7
	.xword	0xe1edfa854caf392f
	.xword	0x402c218ddcbd0d3a
	.xword	0xe3d72a7f0ce1bed4
	.xword	0x9eba7e2455ae4068
	.xword	0xa71dafa2c3891884
	.xword	0x4253b37a0b0a8374
	.xword	0x555985ae26305ff8
	.xword	0x4df4a60f9d42ff7d
	.xword	0x193c339e5c621f47
	.xword	0x4348a967417448ab
	.xword	0x5806d79c111a1423
	.xword	0x9bbf1223f03d80fb
	.xword	0x2f4588698b57562b
	.xword	0x9e9a0525e3c3328c
	.xword	0x7fc61a695f6c8342
	.xword	0x95e18ca0f24dda67
	.xword	0x6d0653eceb916227
	.xword	0x7eea347ac7d79b64
	.xword	0xdb7089a86f251be7
	.xword	0x4ee4b6f20bd882cc
	.xword	0x2cb68bb4b93ddbcd
	.xword	0x74ade613f801e46e
	.xword	0xf2cf46286deadcb4
	.xword	0xc035feebef8c2135
	.xword	0x850482b8f766cdce
	.xword	0x444848638dbc3a08
	.xword	0x074d879cf920db36
	.xword	0x4fdfa807b69d7999
	.xword	0xcba1ffce348251fa
	.xword	0xef619778966a936e
	.xword	0x02f3f7e1868e9352
	.xword	0x2db2c453c2db4733
	.xword	0x2d4c9af4b20b69f3
	.xword	0x1340a38a625837ef
	.xword	0xf66bdbdf0e269b32
	.xword	0x99c79244eb2bc899
	.xword	0xee86a9d0de05836f
	.xword	0xd2915efbb235240e
	.xword	0x8b8dd77bffb77c1a
	.xword	0xf5a517cf2e760ee2
	.xword	0xfcdc7546d950b08f
	.xword	0x65400f3ec24977d3
	.xword	0xfdb78f9999033181
	.xword	0x1387de74e2aab397
	.xword	0xb40081d8f983fcf1
	.xword	0xad6c6ffa1ee10c1a
	.xword	0xb27fc880acd0e877
	.xword	0xcf4c482bdde2d137
	.xword	0xd3356a73d3def92c
	.xword	0x15b16387cd2a14e1
	.xword	0xb1603b5c8f3fcd6f
	.xword	0xd68a14df1ba70f63
	.xword	0x977e896f9ae2b45a
	.xword	0xfd4bfd0bf57de3cc
	.xword	0x34bcfe97b9bd4206
	.xword	0xe7b32abd20f27306
	.xword	0x383717661209c742
	.xword	0x7e8161e3032bad52
	.xword	0x6ee88f3e051ca5a9
	.xword	0xdc604dbf0b54ada2
	.xword	0xb918dc4694cc878f
	.xword	0x2ada17e03d019cd4
	.xword	0x2f52b1474a9377d3
	.xword	0x14467385df744e3c
	.xword	0xc073cef1a9095a17
	.xword	0x72455e0dee79cef6
	.xword	0x70edf75628be3491
	.xword	0x31c7696e5a39e5da
	.xword	0xe96550ec421b1b6f
	.xword	0x0ec8ca2e09192d28
	.xword	0x0e4fd105f8cbda21
	.xword	0x48a802738669587b
	.xword	0x767fa1c96787c6c2
	.xword	0x0637ac3000e27a9a
	.xword	0xcff3e59c839c1046
	.xword	0x70144f7ddfe2ee16
	.xword	0x631bdd75b4b87544
	.xword	0x62cd551366fd1e4b
	.xword	0x55dab631136940a1
	.xword	0xf59c1972862e2271
	.xword	0x11647170246d9e7e
	.xword	0x6cb4ceb8fef5d87a
	.xword	0x299b3e3dce62779c
	.xword	0x35c4cd41d757e63d
	.xword	0x6e773005dbdc062b
	.xword	0x59d0e21ce3dc15fb
	.xword	0xfb2f35edbb4d2c0b
	.xword	0x4fc8528da79b4683
	.xword	0xad4b23aeea0dbcba
	.xword	0xe2e10822cd039ffa
	.xword	0xb5fdc4f2a722fdfe
	.xword	0x77dbdf2dda99f0a8
	.xword	0x2744915e264a56c0
	.xword	0x99b5135759261007
	.xword	0x4ef9100a60b3c569
	.xword	0x1f56ccf96e1ee509
	.xword	0xf022f0367c26d8e7
	.xword	0xdaa6222cb29ec5ad
	.xword	0x20e298a7d057cc32
	.xword	0x158b3d030fc9c91e
	.xword	0xdad8c9af99b52779
	.xword	0x235e2f92f0c59dbe
	.xword	0xf8d135c4464d0b1f
	.xword	0x1b137e8b7a7f6d07
	.xword	0x3ecef8555e751c02
	.xword	0xf4b3aff60a39cac9
	.xword	0x8bd9285d80bd662e
	.xword	0xce29fcc277a03673
	.xword	0xe28aa44914ebef93
	.xword	0x268d8e470509bfca
	.xword	0x5102492ac980c9ec
	.xword	0x8b989a3c12ba22b1
	.xword	0xb5cc850d47d768cf
	.xword	0x8d8e2881638560a0
	.xword	0x84a981c9096f3bec
	.xword	0x0235a9ff9ddfc30a
	.xword	0xeef29c61d42386fc
	.xword	0x4d9da239455c2d64
	.xword	0x4e06a7c2e868b9ca
	.xword	0x653db88582537610
	.xword	0x530849798c4fc80c
	.xword	0x14e1ed61b1ef4a45
	.xword	0xa445725461c137cc
	.xword	0x06d91bfb7638eda4
	.xword	0x58c027864bbe8990
	.xword	0x07224ee0cb23ab3b
	.xword	0x6d7487bea2a1c16d
	.xword	0x49475c259d4b4990
	.xword	0x109d4d2a9ecba00e
	.xword	0xc80d293456ccb218
	.xword	0xc2193142f509dec3
	.xword	0xab3f8210c1bae8e1
	.xword	0xd543f5d8f9a7d570
	.xword	0xe077e117f38e156f
	.xword	0x76aa5c169052a349
	.xword	0xc2c64a1fe6380788
	.xword	0x49dbc41d3a88f48e
	.xword	0x2c6b00152e95960e
	.xword	0x444276a7bd09b992
	.xword	0x1c2e0e473634b241
	.xword	0x754d20b99e7bbdbe
	.xword	0xce71e956fa2e32b8
	.xword	0x76223f7f39b2e276
	.xword	0xf5f809011e640657
	.xword	0xd559b36448115131
	.xword	0xa19e5ddcdee4024f
	.xword	0xb76a143e4f1755ff
	.xword	0xd9f916d10186847e
	.xword	0xb228f302f227b4d3
	.xword	0x97a0ced297e9eff2
	.xword	0x53fb25fcb67639c2
	.xword	0xb22820d4bbcad536
	.xword	0xc5cbf307226021c8
	.xword	0x66c617b277318726
	.xword	0x0528c2049dfbe212
	.xword	0x1685b89bfff0287a
	.xword	0xf299490fffbba472
	.xword	0x2d997be5cb60f845
	.xword	0xd45c1fac0e298b9a
	.xword	0xb47ec6751994b898
	.xword	0x1c73f1dfac4fbd4c
	.xword	0x30cc7e301a12fe58
	.xword	0x47d20a35820bd175
	.xword	0x1f27d879bed14835
	.xword	0xb41ab6a3a9a82465
	.xword	0x48d187dfdc07b9c1
	.xword	0xcd545c2c837ea803
	.xword	0x14422e78d864bbc7
	.xword	0xba9a907a6fdc2ca7
	.xword	0x8f4df2c330c8639d
	.xword	0x0d8da5d6414e01f6
	.xword	0x2846462aa29932a3
	.xword	0xa403d968fff8862a
	.xword	0x2c5e98b02107eb65
	.xword	0x0e856a2669aa48b4
	.xword	0x108875b5572e91cc
	.xword	0x394146a084d62de9
	.xword	0xb8d00a97858344e4
	.xword	0x801b910d84f23fbf
	.xword	0x334f164616621487
	.xword	0x02a552ba0aac5f3c
	.xword	0xeb07a61b70d63d90
	.xword	0x142f3fd7cc11df61
	.xword	0x6a1b24e0878671a8
	.xword	0xdfa8ff08d2107d83
	.xword	0x54ae425e9a2eaa42
	.xword	0x9e84148be30caf9e
	.xword	0xf532c6186f5b2f5a
	.xword	0x028394cd23ef91ae
	.xword	0xb09829180e55f5fc
	.xword	0x26bcb7e34006d98f
	.xword	0xd5627b6d72d64465
	.xword	0x5926574439833237
	.xword	0x9a8c8ebc09c2ee77
	.xword	0xd0a99bcd52cc5fbe
	.xword	0x260f521a5add84ab
	.xword	0x5ad177bd463b1738
	.xword	0xc3585ebe64eb4dbf
	.xword	0x35d7ec45109ad61d
	.xword	0x188c351bb58061dc
	.xword	0x337c3a06ca7731de
	.xword	0x6352e3569041a2bb
	.xword	0x3c26c3a53131fc53
	.xword	0xe8a86734f070c858
	.xword	0x0fb570b280b12d4b
	.xword	0x3b27c01291caf758
	.xword	0x55433a6e9d8c3b8e
	.xword	0x8e0745ff91619e96
	.xword	0x43c6bcf103b2e00c
	.xword	0xf31ab424d09aa61b
	.xword	0xae5d3e84aaa5567e
	.xword	0xa490cea094ed3501
	.xword	0xf887898ad1e7618b
	.xword	0x15bca4082436eaf8
	.xword	0x65136de3b3d3011f
	.xword	0xf34065e081c43f38
	.xword	0x42846eca9f6813d4
	.xword	0x0ace3e5f956cd9c1
	.xword	0xc65c983248cbf792
	.xword	0x4873d62541e076fd
	.xword	0x5b87cd77f8fd94bf
	.xword	0x5a50bede798ea05d
	.xword	0x3e4882b5c693e245
	.xword	0x32c28d77960088f1
	.xword	0xf9d64517f7433e61
	.xword	0xbcbdde70eddf96d1
	.xword	0x66ae51cd77beedd7
	.xword	0xc854ae57e79df2be
	.xword	0xfadfe78b61de850c
	.xword	0xef9477b3e63755b7
	.xword	0xfb8cef3ddbcaeed8
	.xword	0x4732d17562f0bc0e
	.xword	0xbb3787a01f7dcb6c
	.xword	0xc0d4ae3387e49905
	.xword	0xee9fa33e72b36370
	.xword	0x57d3a22aa78af66d
	.xword	0x8a9bfd6e5aa53866
	.xword	0xb913734fe8ea3baa
	.xword	0x6cb6aed8e35bb748
	.align 0x40000
	.data
data_start_6:

	.xword	0x953823f49071083d
	.xword	0xb64a171352e2238b
	.xword	0xbe0306db74aa6eba
	.xword	0x84c0aaaf04f33118
	.xword	0x66e8687d3645b328
	.xword	0x4de8b54fcf2f62e7
	.xword	0xc6bb3d91a659a099
	.xword	0x8217a3ad396df189
	.xword	0xcf4d31583847313f
	.xword	0xebdb544f00450003
	.xword	0xb4355869096a7720
	.xword	0x5200c4445925170e
	.xword	0x6afcd21fc995102d
	.xword	0xf0144b055780a6da
	.xword	0xca5eeb618b44c1f6
	.xword	0x8f9c656cfa837bdb
	.xword	0x1e5ab1c92ab9f179
	.xword	0xc835d4188a76349f
	.xword	0x195eaac1c0285018
	.xword	0x3a0949bc6c459009
	.xword	0x0ab387f48c366343
	.xword	0xafd39711e965f82b
	.xword	0x079b7588679132b2
	.xword	0xef02ab6ecaa64d2e
	.xword	0x0c86931f1cd10968
	.xword	0x5e619deb4d761d28
	.xword	0x526fb52463741485
	.xword	0x6a75784e06565934
	.xword	0x07a94dcea134cc66
	.xword	0x4e1bcb0ec5fa9c0c
	.xword	0x6ec67008bb0777d8
	.xword	0x90c6163a6308201b
	.xword	0xe21e3f898911a58c
	.xword	0x26ae06c2b57b4c91
	.xword	0xd1566a6c8a110cf2
	.xword	0xf57ef9700822bb1f
	.xword	0xe35285d1b94726b8
	.xword	0xcb732fc4f649d652
	.xword	0x60a1b5b75aa0b51a
	.xword	0x8fa8ce3b61d35927
	.xword	0x5986ddd8dafc52d7
	.xword	0x4838d318b92c3c5c
	.xword	0xcf6d838e91182514
	.xword	0xc74ba3d8d47b0272
	.xword	0x3c188efca5825551
	.xword	0xca73c75edfdc667c
	.xword	0x0a016f5ab5d9d14a
	.xword	0x6760ae6a5f103b86
	.xword	0xdec2cf302ac73aed
	.xword	0xd38c967eacad3129
	.xword	0x152c406f4ca7af32
	.xword	0x79424aee45a7466a
	.xword	0x4c303e461d840ee9
	.xword	0x087c827acca39852
	.xword	0xd57490ddfac54325
	.xword	0x85d47e318b7c4d0b
	.xword	0x686168053c640d65
	.xword	0x60e013520822c241
	.xword	0x1297e43d778932b3
	.xword	0xc9dbaf14825d4649
	.xword	0xda25c693158cbf3c
	.xword	0x5ceea9f126134593
	.xword	0xb1624d6518eb651e
	.xword	0xac931bb965f3b751
	.xword	0xdbb25a33e6d2cfaa
	.xword	0xfd422487850f2af0
	.xword	0xe1cc1cdcb0f76154
	.xword	0x849a9ef47f78eede
	.xword	0x5cbf282509a9fa5e
	.xword	0xace7cbedf09cf41d
	.xword	0x8011804c65a12078
	.xword	0xffb91accd327a513
	.xword	0xb366caf83c043e11
	.xword	0x05f03bd61fa2167a
	.xword	0x44fb168fc82e9019
	.xword	0x0aab3246b9a98f1b
	.xword	0x28bb7f947e567f88
	.xword	0x8e91fd40a231c2a4
	.xword	0xd7017b332c0afd5e
	.xword	0xbdf5b5ad223720b6
	.xword	0x1252c7c5d520ab86
	.xword	0x64b31f0c61e0389a
	.xword	0xbdf438794bf5a423
	.xword	0xdb02e7f33352f5b8
	.xword	0x922b609d4eec76bb
	.xword	0x8987c53b5b6561bd
	.xword	0xd5d96a03cdf087e9
	.xword	0x1ad68f801c926e09
	.xword	0x7be24efe7df210bf
	.xword	0xc34365a12ba19fd0
	.xword	0x0ac3c635fe114201
	.xword	0xe4af44a385326055
	.xword	0x57186ae5d9b88d38
	.xword	0xad57789908dbaec1
	.xword	0x67aab5b9139b8fee
	.xword	0x1f349c0046d11339
	.xword	0x4c355c9e5af83096
	.xword	0x96f8fff5412b50b1
	.xword	0x1dc33e3861fd8041
	.xword	0x0bee639325f8091f
	.xword	0xcb4e1138029c7d7b
	.xword	0xbc390630b3ec1295
	.xword	0xd9c1ab51e0b387b0
	.xword	0x6398d4fc7c9e2187
	.xword	0x22525aee48ccda60
	.xword	0x357ce44872ef42f5
	.xword	0xb2006e32222aed8c
	.xword	0x4b6b99ef96460a4d
	.xword	0xb9f68fe734cfe7d8
	.xword	0xf21930ae51d357d2
	.xword	0x2f51ad4a2ebb98ad
	.xword	0x46c03d71d3c70f24
	.xword	0xb000fdb7a6d8be58
	.xword	0x89697bb3e75984e0
	.xword	0x61e2cc96bcc87ebe
	.xword	0x5fafc60497a2484d
	.xword	0x9ad81c023d13ed60
	.xword	0x4ff10ff34953bf63
	.xword	0x43f4d9e2d766b36e
	.xword	0x4fb9be5a9fa12a2c
	.xword	0x1c2c18c9b3cae431
	.xword	0xda193624a42bc2b0
	.xword	0xd3805fce9f878f31
	.xword	0x00b22c1f4110e165
	.xword	0x9793e83b45015fb9
	.xword	0xb84e99315dff84e9
	.xword	0x46632ddb99300e13
	.xword	0xba807b01f12d81cf
	.xword	0xe2b5a4251a058fa8
	.xword	0x1623fd6ea7a3ecc1
	.xword	0x21b0a35e4555e6bd
	.xword	0x26e72625aff3f336
	.xword	0xcbda1018daca851a
	.xword	0x036333e225716950
	.xword	0x6acc1521dd18e14a
	.xword	0x102afb05a4441e40
	.xword	0xc2c170b28bb54fa8
	.xword	0x2a9669799e904c36
	.xword	0x12fa7169f65fd430
	.xword	0x3669992206f8b792
	.xword	0xccced64193f9a4f1
	.xword	0xe9fe120f5cc8af13
	.xword	0x943a7996887afdf6
	.xword	0x321233fd0ac87ab2
	.xword	0x66cee6c754617995
	.xword	0xa60e544c93b5a1c4
	.xword	0x393120640fa78d0f
	.xword	0xcec03d0020618da5
	.xword	0x33dc02617c9b2465
	.xword	0xb71dbaf6ef2f2434
	.xword	0xae641e864786989f
	.xword	0x2985b6fc331d209c
	.xword	0x25d470410162db40
	.xword	0xad09d9ff2b5b54b0
	.xword	0xf38db930a325ea5e
	.xword	0x16e4d95d6fc7b402
	.xword	0x35e823826731a950
	.xword	0x0eea1a094067bae4
	.xword	0xa9e26cdbaa726e06
	.xword	0xfdef1a06048a62e8
	.xword	0xb371f7ae7705760e
	.xword	0x375cb5c77ae62f0d
	.xword	0x5b4d461a1bdf9111
	.xword	0x1931c45a86a39913
	.xword	0x307b3ec57940eeae
	.xword	0x03c0b495893badee
	.xword	0xf5758d038e68f6c5
	.xword	0x94fc84f71ba45575
	.xword	0x12e5370ba63cb4cc
	.xword	0xddbd9547572bba2a
	.xword	0x4ccf77eeec3da087
	.xword	0xc66c9b7dacefe72a
	.xword	0x55f333fb7144640f
	.xword	0xb39fad0b9b7b7f25
	.xword	0x79e4b56f2501b98c
	.xword	0x8be4c29bfbea8c77
	.xword	0x1ed9c9dfbf17d911
	.xword	0x986c425a97175939
	.xword	0xd27a67867c619424
	.xword	0xf34217c98eac237e
	.xword	0xa79e7ddc1782d2da
	.xword	0x58c9396e38bea49b
	.xword	0x7c5e1369b428776a
	.xword	0x4686b013e6de87d2
	.xword	0x262dd84cfab0a723
	.xword	0x79ff88f8acc8eab4
	.xword	0x25c3592776877b64
	.xword	0xf61ba0872a35f912
	.xword	0x3bf2e1023ac7b774
	.xword	0x3324c35fce8eab3c
	.xword	0xdeb6bfb8d90bd006
	.xword	0x492d85e133bc7851
	.xword	0x6012460418d32a72
	.xword	0x965821460aaf3363
	.xword	0x0f25017ebd1c3031
	.xword	0x3ada3285e5ffa7cb
	.xword	0xa04f1dd030f80d7a
	.xword	0x868cca1e49b6a90b
	.xword	0xfdd9143955045648
	.xword	0x0556f410a4ae645e
	.xword	0xdd07184b988afcc0
	.xword	0x4405197541fc11d5
	.xword	0x5d929596ed2eb4ea
	.xword	0x3dd6d442aecb8877
	.xword	0x5d5487ed351a359d
	.xword	0x9e9f1296cab3184b
	.xword	0xb56c5d197c593b26
	.xword	0x5b05fb6d6b9e6af1
	.xword	0x08767fc5d9cb9f03
	.xword	0x3f644ed7adbc7f36
	.xword	0xd7f0eb8da15c1f98
	.xword	0x087a5582f340a567
	.xword	0x5a129f4d04561172
	.xword	0x61bafe0da409c1c8
	.xword	0x90a542055e596cd1
	.xword	0x1d9d0b55fd1d5646
	.xword	0x49355efaf0266468
	.xword	0x5bee2e0386e3ed3f
	.xword	0x30071f89a4a125a7
	.xword	0x229c8527584b0973
	.xword	0x39c1f8f187da573c
	.xword	0xc14c9b92dafddb76
	.xword	0x8b89e9c0e1a65b70
	.xword	0xcce8d8b02598d543
	.xword	0x4f8eed82a6d01b6a
	.xword	0x9e13a3b63404f5f3
	.xword	0x98f770022acefca8
	.xword	0x7e4b89bd3cc97dee
	.xword	0xbf54a1298c6b718d
	.xword	0xe3e786c8d2b1d8ef
	.xword	0xf264e886a109482d
	.xword	0xac49ce8a67ea74bd
	.xword	0x432d14e48fc4fe04
	.xword	0xa7360ab31094760a
	.xword	0x6e22005b16311a53
	.xword	0x1380556803bdde00
	.xword	0xbf01ff4994b4690a
	.xword	0xc1652c66ebb302c5
	.xword	0x2af1714161e74401
	.xword	0xd0b30a62999cd018
	.xword	0xdcb3b33caf685172
	.xword	0xb166ea98d843b6c2
	.xword	0x4821e0a4564d45f5
	.xword	0x64537a60fd8deaa4
	.xword	0xf4935cfa64a2ab73
	.xword	0xed5bd6ec65830a8a
	.xword	0x164a36b4df0c510c
	.xword	0x44720217ce7eb82a
	.xword	0xa70db2f7c1160b74
	.xword	0xb9d51a5a2593852a
	.xword	0x9fe030b1ea82a219
	.xword	0x203ec8727c31c664
	.xword	0xffbf2b87490cf520
	.xword	0x26a2a2376ecdc4d4
	.xword	0xbb9eeb0a3bcb0656
	.xword	0xf72b0e2177ff1805
	.align 0x80000
	.data
data_start_7:

	.xword	0xc2f218ddbea66322
	.xword	0xf8385a6a3c2d3cc6
	.xword	0x2365730d6cd45ac3
	.xword	0xa95a25f9a44c5839
	.xword	0xe4b015f7d0b3b0b7
	.xword	0xf08d9b5d725d64a0
	.xword	0x2fec7c58d81a31c0
	.xword	0xed51ccff0f26b750
	.xword	0xea0c7ff3d28cb59b
	.xword	0x8075aa5dffdfed0b
	.xword	0x703ce71f0718ab6e
	.xword	0x48181be3ff72509e
	.xword	0xe7e7eae0fd6fd1fb
	.xword	0x4b52056186b25200
	.xword	0xa7d5f0f626b522a4
	.xword	0xe5ad3657f215b074
	.xword	0x28bef24fefa57b59
	.xword	0xf0fe36ab2a69cc93
	.xword	0x9759b51fd21fad54
	.xword	0x7cb64965d56a75c0
	.xword	0x695573e7c6c300b1
	.xword	0xce9a8856d473ef53
	.xword	0x865f64f622988c9f
	.xword	0xdc9adb3b30cb160d
	.xword	0x4bc9fa54596b93ca
	.xword	0xe53f1d066b5f00f9
	.xword	0x8c9a00f806a2d4ea
	.xword	0x0be36094279c399f
	.xword	0x85c45258801d911a
	.xword	0xd2a87d1650f0ff87
	.xword	0x094c0f4655cb9a54
	.xword	0x2faa5ca12571ae06
	.xword	0x8105e11a29884994
	.xword	0xf1357e6eca0220d8
	.xword	0x56935d660ef5f90b
	.xword	0x49188ab8c06cd4e1
	.xword	0x46be3937bbfe4ee4
	.xword	0xcdbcab4fbcd5c9e9
	.xword	0x073c3e04bc465480
	.xword	0x586dbe9b0fbd8871
	.xword	0x7adb5111fd3320a0
	.xword	0xe57b80c1c7051f25
	.xword	0x52eab1e90d145f9e
	.xword	0x36f2fe33d02a7d02
	.xword	0x82efa0f9d4592aed
	.xword	0xe50a20e87fa9e692
	.xword	0xbef4c63a26d69ba1
	.xword	0x6099548406feb330
	.xword	0xc14cb003c1071ed9
	.xword	0x8dd905c2ace06dba
	.xword	0x920e0d6b3fb689b4
	.xword	0x239c7bf4e37cd826
	.xword	0x9051546f19839e5d
	.xword	0x755e793a02a91d45
	.xword	0x61f4d988682b54e0
	.xword	0x3f439f38739196d4
	.xword	0x9533a8226da9dbcb
	.xword	0xeb953cc5723ccdf2
	.xword	0xb4ed71a299f39585
	.xword	0x6420d3d50c27ebdb
	.xword	0x80f6ef63541d696d
	.xword	0x52c3c89ab54b3fe9
	.xword	0x7e02a0ead100d903
	.xword	0xbb80ca9efc298d65
	.xword	0x4a14be0203a0e2e2
	.xword	0x7356b424482c0874
	.xword	0xaeffe5525489502a
	.xword	0xaa426b01a160f4e8
	.xword	0xd876ade383d4e3e3
	.xword	0x5c82cbf9627ddab3
	.xword	0x874391325f9f73f7
	.xword	0x95c45104d02b1ba7
	.xword	0xcb5b097d88b0a1c6
	.xword	0x9301bcca13ea3db5
	.xword	0x4fbf436765b366bb
	.xword	0x0e34961e1f327e53
	.xword	0x5bf73027864dca63
	.xword	0x473728affbb84bcd
	.xword	0x7729fb4ce820ca94
	.xword	0x468412480301643a
	.xword	0xe60321d1d2188a53
	.xword	0xd2aea7af4cbac45f
	.xword	0x635903ea0431a21a
	.xword	0xef6727ae3cf592c8
	.xword	0xd3b38e6d5aae2ed3
	.xword	0x68aea10d9d81f458
	.xword	0xae5b2e67ce87855c
	.xword	0x7c6bb38d46c893a2
	.xword	0x07c7151cf25a138f
	.xword	0x2bdf88be48586f82
	.xword	0x38b984777d7f3f25
	.xword	0x4f84dc7e69583c01
	.xword	0x79b9cf31e71cdf1b
	.xword	0x8a14e4870b5381ab
	.xword	0x3cc2b193873f115c
	.xword	0xe685ef5184c0ae77
	.xword	0xd514612bfb753ee9
	.xword	0x1efe4a0e2096d31d
	.xword	0x41a68086c89fea4b
	.xword	0x61240ace9125658b
	.xword	0x8c0926ed0918e603
	.xword	0x85cf0321b92aeabf
	.xword	0xcf498a4783196b2e
	.xword	0x20d72f0b89c3154e
	.xword	0xef3292eb76c96986
	.xword	0xc565d3aa81d0674e
	.xword	0xb17559df976133f1
	.xword	0xfc22d29453532826
	.xword	0x6a02ec3de33676d2
	.xword	0xe758fdb4815ad086
	.xword	0x585b831445523f7a
	.xword	0xb916175d1dd65e58
	.xword	0x5eda15b3e8ae63b3
	.xword	0x02ca0ddbb9103c19
	.xword	0x25bd7c23b096aa02
	.xword	0x4ecb3c7ab792b2cd
	.xword	0x5ca34ffd5dcfe0cb
	.xword	0x1a181de7d1e27908
	.xword	0x81cf086359a7b08b
	.xword	0x2495444c6b550a99
	.xword	0xd2d4caa82a78c174
	.xword	0xfa794d424cb0ad95
	.xword	0x6b95e90494623753
	.xword	0xb7305147f45e7ca5
	.xword	0xb0126d1b68958e31
	.xword	0x2763bbd8bb4302ac
	.xword	0x5efbb5622bd50e0a
	.xword	0xff8244ea1eaea437
	.xword	0xd238f14cfb6b4494
	.xword	0xa194df4af97031e8
	.xword	0x63626c6ddfd7955d
	.xword	0x3479320670b25907
	.xword	0x5554faad585ddd11
	.xword	0x92c087f1ca952bd1
	.xword	0x320e105e75748939
	.xword	0x2eb19d6d63f1c63c
	.xword	0xf3b866f3be829ac4
	.xword	0xce39a7acf15a7217
	.xword	0x106b265b3624c03b
	.xword	0x505625e3de4a06c7
	.xword	0x3c13672b18f857f2
	.xword	0x42d7e4aea3c437e3
	.xword	0x42ebb87b37392f87
	.xword	0x0a644cd5c47080a2
	.xword	0x404dea0499a96017
	.xword	0x7b7ec202dc5243e4
	.xword	0xd8ab5cccb64c6e65
	.xword	0x917f524fe83f9289
	.xword	0x19e6d3db94939faf
	.xword	0x05e2b8d320f0a10c
	.xword	0x022173ba2c646ba0
	.xword	0x753255c2137e24fc
	.xword	0xe550ff8936b055d7
	.xword	0x16ee46f206720626
	.xword	0xe6aea76d9954fbbe
	.xword	0x8ff0ef3235d5bda3
	.xword	0x5fccb6e15f323bb0
	.xword	0x54b30bda1f46d768
	.xword	0x257b94c6aa1e5737
	.xword	0xa5d158c5068dd67f
	.xword	0x604b6433c25c4bbc
	.xword	0xaa313e625a488973
	.xword	0xd7551fa7ecdf4737
	.xword	0xdf02dde183689c0c
	.xword	0x8d4cec81fc6a5293
	.xword	0xf29c92413e86624d
	.xword	0x99b3e204af86a43e
	.xword	0x1f5795f0014673c5
	.xword	0xacab2d2faffa54ff
	.xword	0x6ccd98fccbeb894d
	.xword	0x8fc2a6ef42e810ab
	.xword	0xb573af4ab8307bcc
	.xword	0x31c703161f3dbbcc
	.xword	0x0a5f4a9b87d63d52
	.xword	0x716997a6313afdcb
	.xword	0x553307d65c9d4898
	.xword	0x2e17866c4ced2736
	.xword	0x0d799169c85c83c7
	.xword	0xc72cf6dda7e5ae36
	.xword	0x61c818353ea05fa7
	.xword	0xca17fb915199c1a5
	.xword	0x66301367c4ab4076
	.xword	0x626353f57ee543fa
	.xword	0x6a4cd0ebe6dfc776
	.xword	0xc5f0817a61ba58b9
	.xword	0xe4f51748d663b520
	.xword	0x5bed89adc4af108d
	.xword	0x155a88f91297c611
	.xword	0x95b33e6fe5406e37
	.xword	0x279c20e2fb7d188e
	.xword	0x0c2fba4483ce299e
	.xword	0xf4295ebe2168cb5a
	.xword	0x45d8cb762c0baf5f
	.xword	0xc0e1da84a831460e
	.xword	0xa3c220db1c87f6d5
	.xword	0x30908c67a90b8e61
	.xword	0x2a212ace77555d6c
	.xword	0x87dfbe3352c98917
	.xword	0xf1dd36f31d040b52
	.xword	0xa23d171e81a57ac9
	.xword	0x78abede2c6bcde0c
	.xword	0x07416c53c814a95c
	.xword	0xa4dcecbc1d7fb067
	.xword	0x90b17ca840e222fb
	.xword	0xa0425c1f9e8cc8b5
	.xword	0x349cf13016776d07
	.xword	0x88d721c2ca10adf9
	.xword	0x6ecbbf4e8e17060d
	.xword	0x970784fc9072e96c
	.xword	0x72cfdf8263ec5c00
	.xword	0x632b83127032427a
	.xword	0x504eed929515739f
	.xword	0x3800917cc582a733
	.xword	0xc5c74284f5183502
	.xword	0x21027e70cd9f883e
	.xword	0xb0d5b9b5394c344a
	.xword	0x223fc5d3a8431112
	.xword	0x34901eeef8297999
	.xword	0xd73feeff5f9498d6
	.xword	0x56659543bd74fa30
	.xword	0xdbb258551220dfdd
	.xword	0xcc9e229c1c9344b0
	.xword	0x8a1be15618454d07
	.xword	0xe90d22d1ddee22a3
	.xword	0x5259c1397a434725
	.xword	0xdf11baae8d30bbc0
	.xword	0xaa3d40e960e910e3
	.xword	0xc1876b46f86d40fe
	.xword	0x43a9add903a90b59
	.xword	0x2e17d0984c7c15ea
	.xword	0x7c26e71de20092a6
	.xword	0x6f44d4edacd032f4
	.xword	0x66827c8b10e9ae12
	.xword	0xefd7a52d6762ca66
	.xword	0x96db30f6296c50d2
	.xword	0x72f387e6a6a15467
	.xword	0x650e43f3063a874b
	.xword	0x81023bc7badc4241
	.xword	0xd594ff1d59026d22
	.xword	0xca85c972175d64ac
	.xword	0xafd2c542913e8086
	.xword	0x3a022106e97e2a27
	.xword	0x7c4f0755acabbda2
	.xword	0xc1a14123f990e978
	.xword	0x1fd505b8fc067100
	.xword	0xf3064a86a84b9a65
	.xword	0xdb95bbd57633d88c
	.xword	0x792ee013e4abdf8e
	.xword	0xb32eb8eb6cb08f07
	.xword	0xa837750537ce9fd5
	.xword	0x5702726489cb1681
	.xword	0x730016f004684629
	.xword	0x342801262bc053d0
	.xword	0x5990f140d14a71ab
	.xword	0x8c8c65acfde53f3b
	.xword	0x848f9c8c5e0b59f1



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
!!#   IJ_set_rvar ("diag.j", 59, Rv_intr_vect, "6'brr rrrr");
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
!!# 	  IJ_generate ("diag.j", 152, th_all, $1);
!!# 	}
!!# 	| spill_trap 
!!# 	{
!!# 		IJ_generate ("diag.j", 156, th_0, $1);
!!# 	}
!!# 	| fp_all 
!!# 	{
!!# 		IJ_generate ("diag.j", 160, th_1, $1);
!!# 	}
!!# 	| load 
!!# 	{
!!# 		IJ_generate ("diag.j", 164, th_2, $1);
!!# 	}
!!# 	| store
!!# 	{
!!# 		IJ_generate ("diag.j", 168, th_3, $1);
!!# 	}
!!# 	| set_va %rvar  Rv_low_wt
!!# 	{
!!# 		IJ_generate ("diag.j", 172, th_2_3, $1);
!!# 	}
!!# 	| write_hpstate %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_generate ("diag.j", 176, th_all, $1);
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
!!# 	  IJ_printf ("diag.j", 191, th_all, "\tsetx\tdata_start_%rd, %%g1, %%r%rd\n", Rv_data_sec, Rv_ldst_var);
!!#         } ;
!!# 
!!# write_hpstate:
!!# 	tWRHPR_HPSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 197, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
!!#         }
!!# 	| tWRHPR_HTSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 201, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
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
!!# 	  IJ_printf ("diag.j", 214, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_GL_R %ropr  Rop_tl_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 218, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
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
!!#           IJ_printf ("diag.j", 272, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 273, th_all, "\tmov\t0, %%g1\n");
!!#           IJ_printf ("diag.j", 274, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 275, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 276, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	};
!!# 
!!# dtlb_demap: mDDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 281, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 282, th_all, "\tmov\t8, %%g1\n");
!!#           IJ_printf ("diag.j", 283, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 284, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 285, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           IJ_printf ("diag.j", 286, th_all, "\tflush\n");
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
!!# 	  IJ_printf ("diag.j", 300, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 301, th_all, "\tmov\t0x80, %%g1\n");
!!# 	  IJ_printf ("diag.j", 302, th_all, "\tmov\t0x%rx, %%g2\n", Rv_ma_cntl);
!!# 	  IJ_printf ("diag.j", 303, th_all, "\tstxa\t%%g2, [%%g1] 0x40\n");
!!# 	  IJ_printf ("diag.j", 304, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#         }
!!# ;
!!# hw_intr:
!!# 	mHWINT
!!#         {
!!#           IJ_printf ("diag.j", 310, th_all, "hwintr_%y_%d:\n", loop_cnt);
!!#           IJ_printf ("diag.j", 311, th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.hwintr_%y_%d), 16, 16)) -> intp(%y, 0, %rx)\n", loop_cnt, Rv_intr_vect);
!!#           loop_cnt++;
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
