// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_41.s
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
   random seed:	818572998
   Jal tlu_multi_mix_2_hwint.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_intr_handlers.s"
#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"

#define H_T1_Reserved_0x9c
#define	SUN_H_T1_Reserved_0x9c \
	saved; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
    nop

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0x0ce98e0886cc73fa, %g1, %g0
	setx 0x7d3a4969e52c94de, %g1, %g1
	setx 0x43b68805db20a213, %g1, %g2
	setx 0x715541fc40726953, %g1, %g3
	setx 0xb5f2452822fe9831, %g1, %g4
	setx 0xe137da5d8ec4cc20, %g1, %g5
	setx 0x5fe38f2335a09ebc, %g1, %g6
	setx 0xe61ef240f4260110, %g1, %g7
	setx 0xe6d3685b0727b36d, %g1, %r16
	setx 0xa3cf74bb77e2c0b7, %g1, %r17
	setx 0x5b07458e76f2e0db, %g1, %r18
	setx 0xc3875e53b5d3487b, %g1, %r19
	setx 0x3b9a656404c5d10c, %g1, %r20
	setx 0x9ddebb54c68e6c41, %g1, %r21
	setx 0x6776dfbd5b033415, %g1, %r22
	setx 0x7b60258be64da6dc, %g1, %r23
	setx 0x086befb298856181, %g1, %r24
	setx 0xd9d62a0617691b92, %g1, %r25
	setx 0xf4ec622bacbd2345, %g1, %r26
	setx 0x7707ed1b27861acb, %g1, %r27
	setx 0xb62c03ca835d5e42, %g1, %r28
	setx 0x54b9a744477255c7, %g1, %r29
	setx 0xdc75d65f495213a2, %g1, %r30
	setx 0x13673340a01cbe4e, %g1, %r31
	save
	setx 0xae171d11913231fd, %g1, %r16
	setx 0xdd607a741627b93f, %g1, %r17
	setx 0x35c70e12c242ff0b, %g1, %r18
	setx 0x71f2849cdc260a79, %g1, %r19
	setx 0x7597037427ff722d, %g1, %r20
	setx 0x8bb266e914bf1e9f, %g1, %r21
	setx 0x3594270f676fbb26, %g1, %r22
	setx 0xfdb0663af420b588, %g1, %r23
	setx 0x85e086ec708a8348, %g1, %r24
	setx 0x8a2fd8e3e8ac82bd, %g1, %r25
	setx 0x582bb058384e70af, %g1, %r26
	setx 0x4a40896da39ce37f, %g1, %r27
	setx 0xc774286062725025, %g1, %r28
	setx 0x7b8b02608a17dc0d, %g1, %r29
	setx 0x182c38b3e869c904, %g1, %r30
	setx 0xbafe142641156ebd, %g1, %r31
	save
	setx 0xeadbf3ea5b23ff9e, %g1, %r16
	setx 0xff5f35fa3f175775, %g1, %r17
	setx 0xbb01caf217733f4f, %g1, %r18
	setx 0x7ad55166577657d3, %g1, %r19
	setx 0x526fe00e37546af2, %g1, %r20
	setx 0x9f56842a4192e5c6, %g1, %r21
	setx 0x685821c4b108f45d, %g1, %r22
	setx 0x72f506ce8bd50545, %g1, %r23
	setx 0x15a0c79c373fcd82, %g1, %r24
	setx 0x1527b78614369eca, %g1, %r25
	setx 0x0597d44e8ba4bb1c, %g1, %r26
	setx 0x1ae6342fa1f1c316, %g1, %r27
	setx 0x9bcf65f54cdb96cb, %g1, %r28
	setx 0x253639c4225ed67a, %g1, %r29
	setx 0x727a58c2a155a252, %g1, %r30
	setx 0x69fc92cb7dc5d3cb, %g1, %r31
	save
	setx 0xd28b758ca9522d93, %g1, %r16
	setx 0xfd6699f97777cc11, %g1, %r17
	setx 0x38c226044d418f53, %g1, %r18
	setx 0x1be8817dcc78a847, %g1, %r19
	setx 0x64985792ddb8edd1, %g1, %r20
	setx 0xa7a9d64a58f036d2, %g1, %r21
	setx 0x23e5d1d0537a5e10, %g1, %r22
	setx 0x3c4435adc65d9a4e, %g1, %r23
	setx 0x204f73db8b86e280, %g1, %r24
	setx 0x083a13307509cd4b, %g1, %r25
	setx 0x7e880d7b7e05372d, %g1, %r26
	setx 0x3209fc03d39c26f8, %g1, %r27
	setx 0x3881fed9c1f17aac, %g1, %r28
	setx 0x4a55b5f5f603274e, %g1, %r29
	setx 0x2baa92f530bbe060, %g1, %r30
	setx 0x044dfe4e6236186a, %g1, %r31
	save
	setx 0x205eece9f3e88a19, %g1, %r16
	setx 0x8bf3ba0af2844b7a, %g1, %r17
	setx 0x819ea5f4d7201b45, %g1, %r18
	setx 0x03b65f31f4c0d932, %g1, %r19
	setx 0xe9c6788217c9b28c, %g1, %r20
	setx 0xe480a00d96225d3f, %g1, %r21
	setx 0xa5bee72a035bbde6, %g1, %r22
	setx 0xb31930f6eb6a5ec9, %g1, %r23
	setx 0xa425cd57cc197711, %g1, %r24
	setx 0xbd5ca3948cb05ccf, %g1, %r25
	setx 0x041f2dbca63d085b, %g1, %r26
	setx 0xfddcc4b19edf413f, %g1, %r27
	setx 0xe6db02b4d298032e, %g1, %r28
	setx 0x0b038fc83d9ee598, %g1, %r29
	setx 0xe8b66a22982121ca, %g1, %r30
	setx 0xb94a83828bf17474, %g1, %r31
	save
	setx 0x703d9aa6aab799a3, %g1, %r16
	setx 0xc4f19632a063acfa, %g1, %r17
	setx 0xe90a64c2a802a925, %g1, %r18
	setx 0x7fb539cb99e61f80, %g1, %r19
	setx 0x380be02610fb864d, %g1, %r20
	setx 0xaf2dc87951f6528e, %g1, %r21
	setx 0x952b11c70e24b075, %g1, %r22
	setx 0x9dcb1a85569eb253, %g1, %r23
	setx 0xcc77e7ac5094dfde, %g1, %r24
	setx 0x0bacea2dda142ec1, %g1, %r25
	setx 0x28bee64fe47a84a7, %g1, %r26
	setx 0x769a46ede2a7d550, %g1, %r27
	setx 0xe6a1c06ad069b3ae, %g1, %r28
	setx 0x8208f944df1c1d7f, %g1, %r29
	setx 0x978eeb6a2eeaca7f, %g1, %r30
	setx 0x7f6c2095a0fd5943, %g1, %r31
	save
	setx 0xea69cae74c1d133f, %g1, %r16
	setx 0x2d99348eca087eec, %g1, %r17
	setx 0x2570726dabd2b980, %g1, %r18
	setx 0x1eff065035936ce6, %g1, %r19
	setx 0x98ba63047ab4825c, %g1, %r20
	setx 0x85ee63c40b4dd039, %g1, %r21
	setx 0x838e522727316ea1, %g1, %r22
	setx 0x20405273c3826891, %g1, %r23
	setx 0x05c1b9bf9da42ee6, %g1, %r24
	setx 0xa583c7bf07228f51, %g1, %r25
	setx 0x6cd2b7a7b6eb4ed2, %g1, %r26
	setx 0x3b55bd1883992e88, %g1, %r27
	setx 0x222759403568e051, %g1, %r28
	setx 0x8311e3704be83670, %g1, %r29
	setx 0x90f2319053070303, %g1, %r30
	setx 0xd2250d78411f218d, %g1, %r31
	save
	setx 0xeea4c500dad43f4a, %g1, %r16
	setx 0x48dea65e03375b27, %g1, %r17
	setx 0xd8d65ca7ae10788c, %g1, %r18
	setx 0xf7597bb08451b86b, %g1, %r19
	setx 0xc87ea8793fe259a6, %g1, %r20
	setx 0x9209f25e0b262d20, %g1, %r21
	setx 0x5d1c53576067d764, %g1, %r22
	setx 0x654ff2c06241acec, %g1, %r23
	setx 0x87ce6ab98ede6292, %g1, %r24
	setx 0x2ccc0daa17fc0495, %g1, %r25
	setx 0x3d3b03186db86624, %g1, %r26
	setx 0xcfb760cbf5cd6de1, %g1, %r27
	setx 0x3a844c982dfe4ea2, %g1, %r28
	setx 0x7b74c47b8b3ae9ba, %g1, %r29
	setx 0x44bcb59d72a63a32, %g1, %r30
	setx 0x8140019842225ba0, %g1, %r31
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
	mov	1, %r12
	.word 0x8f930000  ! 9: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e560b1  ! 10: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e42135  ! 11: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8994e0ed  ! 12: WRPR_TICK_I	wrpr	%r19, 0x00ed, %tick
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 10)
	.word 0xb7e4e015  ! 14: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde460be  ! 17: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e42192  ! 19: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e421cc  ! 20: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbb504000  ! 22: RDPR_TNPC	<illegal instruction>
	.word 0xbfe5e096  ! 23: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e56004  ! 26: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb0b4c000  ! 27: ORNcc_R	orncc 	%r19, %r0, %r24
	.word 0xb7e5216a  ! 28: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e5219c  ! 35: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde5e053  ! 40: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbb7d4400  ! 47: MOVR_R	movre	%r21, %r0, %r29
	.word 0xbde460e0  ! 48: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb2b4617d  ! 49: SUBCcc_I	orncc 	%r17, 0x017d, %r25
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb3e520ed  ! 51: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e4e1ba  ! 56: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbb520000  ! 58: RDPR_PIL	<illegal instruction>
	.word 0x8d95a0f6  ! 62: WRPR_PSTATE_I	wrpr	%r22, 0x00f6, %pstate
	.word 0x8794e1a8  ! 63: WRPR_TT_I	wrpr	%r19, 0x01a8, %tt
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4a04c  ! 65: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde5218f  ! 69: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde4e0fe  ! 72: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe5e019  ! 74: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe4e13d  ! 75: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x9194e06b  ! 81: WRPR_PIL_I	wrpr	%r19, 0x006b, %pil
	.word 0xbfe421cc  ! 84: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe5607f  ! 85: SAVE_I	save	%r21, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xba9c0000  ! 88: XORcc_R	xorcc 	%r16, %r0, %r29
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb5500000  ! 94: RDPR_TPC	<illegal instruction>
	.word 0xb1e5e16d  ! 96: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb53c4000  ! 99: SRA_R	sra 	%r17, %r0, %r26
	.word 0xb350c000  ! 101: RDPR_TT	<illegal instruction>
	.word 0xb9520000  ! 107: RDPR_PIL	<illegal instruction>
	.word 0xb9e56030  ! 111: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb0ac4000  ! 113: ANDNcc_R	andncc 	%r17, %r0, %r24
	.word 0xb5e42117  ! 115: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5a031  ! 118: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbd51c000  ! 119: RDPR_TL	<illegal instruction>
	.word 0xb1e52034  ! 121: SAVE_I	save	%r20, 0x0001, %r24
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 0)
	.word 0xb3e46067  ! 124: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe4e172  ! 127: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3504000  ! 130: RDPR_TNPC	<illegal instruction>
	.word 0xb81ce132  ! 134: XOR_I	xor 	%r19, 0x0132, %r28
	.word 0xb9e56074  ! 140: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e420aa  ! 144: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe4a0b1  ! 151: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb52c3001  ! 156: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xbbe4a032  ! 158: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5518000  ! 159: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e4603e  ! 161: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb551c000  ! 162: RDPR_TL	<illegal instruction>
	.word 0xb3500000  ! 171: RDPR_TPC	<illegal instruction>
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 39)
	.word 0xb5540000  ! 173: RDPR_GL	<illegal instruction>
	.word 0xbbe52049  ! 176: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7520000  ! 179: RDPR_PIL	<illegal instruction>
	.word 0xb1e521f3  ! 182: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe4e194  ! 189: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe461ec  ! 193: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde4e01f  ! 195: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e4a14f  ! 196: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7508000  ! 197: RDPR_TSTATE	<illegal instruction>
	.word 0xbde56115  ! 202: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e5a081  ! 206: SAVE_I	save	%r22, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9194e1b7  ! 211: WRPR_PIL_I	wrpr	%r19, 0x01b7, %pil
	setx	data_start_0, %g1, %r21
	.word 0x8995a111  ! 217: WRPR_TICK_I	wrpr	%r22, 0x0111, %tick
	.word 0xbfe460dd  ! 218: SAVE_I	save	%r17, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1500000  ! 222: RDPR_TPC	<illegal instruction>
	.word 0xb9e5e09a  ! 225: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe4a032  ! 228: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde52158  ! 231: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e56091  ! 232: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe4e096  ! 235: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe4a065  ! 237: SAVE_I	save	%r18, 0x0001, %r29
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb5e4e1a9  ! 240: SAVE_I	save	%r19, 0x0001, %r26
	setx	data_start_3, %g1, %r21
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 2d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5a1c4  ! 247: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb13d0000  ! 249: SRA_R	sra 	%r20, %r0, %r24
	.word 0xbd3ce001  ! 250: SRA_I	sra 	%r19, 0x0001, %r30
	.word 0xbb518000  ! 252: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e5e1de  ! 265: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e5e0b2  ! 269: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e5e15b  ! 270: SAVE_I	save	%r23, 0x0001, %r28
	mov	0, %r12
	.word 0xa1930000  ! 271: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1508000  ! 274: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e5a134  ! 278: SAVE_I	save	%r22, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb83c61b3  ! 284: XNOR_I	xnor 	%r17, 0x01b3, %r28
	.word 0xbd50c000  ! 289: RDPR_TT	<illegal instruction>
	.word 0xbbe4e1ee  ! 293: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbc05c000  ! 294: ADD_R	add 	%r23, %r0, %r30
	.word 0xb9504000  ! 295: RDPR_TNPC	<illegal instruction>
	.word 0xbfe4a1cf  ! 296: SAVE_I	save	%r18, 0x0001, %r31
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 21)
	.word 0xb1e5e18f  ! 300: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde460dd  ! 304: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbb51c000  ! 306: RDPR_TL	<illegal instruction>
	.word 0x8195e136  ! 309: WRPR_TPC_I	wrpr	%r23, 0x0136, %tpc
	.word 0xbf520000  ! 311: RDPR_PIL	<illegal instruction>
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe521fa  ! 313: SAVE_I	save	%r20, 0x0001, %r29
	mov	2, %r12
	.word 0xa1930000  ! 317: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde42156  ! 319: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x919521d4  ! 321: WRPR_PIL_I	wrpr	%r20, 0x01d4, %pil
	.word 0xb7e561b2  ! 328: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x879420f1  ! 329: WRPR_TT_I	wrpr	%r16, 0x00f1, %tt
	.word 0xb7e421af  ! 330: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e5209e  ! 332: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe46091  ! 334: SAVE_I	save	%r17, 0x0001, %r29
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 25)
	.word 0xbfe521a7  ! 336: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8795a071  ! 337: WRPR_TT_I	wrpr	%r22, 0x0071, %tt
	.word 0xb7e5611e  ! 343: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe5a183  ! 346: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbb500000  ! 347: RDPR_TPC	<illegal instruction>
	.word 0xbf520000  ! 351: RDPR_PIL	<illegal instruction>
	.word 0xbc1561a6  ! 352: OR_I	or 	%r21, 0x01a6, %r30
	.word 0xbc05a039  ! 354: ADD_I	add 	%r22, 0x0039, %r30
	.word 0x819421df  ! 357: WRPR_TPC_I	wrpr	%r16, 0x01df, %tpc
	.word 0xb9e5e043  ! 359: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5518000  ! 361: RDPR_PSTATE	<illegal instruction>
	.word 0xba84c000  ! 363: ADDcc_R	addcc 	%r19, %r0, %r29
	.word 0xb1e4e185  ! 364: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe420a6  ! 365: SAVE_I	save	%r16, 0x0001, %r31
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbabd8000  ! 369: XNORcc_R	xnorcc 	%r22, %r0, %r29
	.word 0xb1e5e07c  ! 370: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe5a113  ! 371: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e5e18b  ! 375: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e461d7  ! 381: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x839520a9  ! 385: WRPR_TNPC_I	wrpr	%r20, 0x00a9, %tnpc
	.word 0xb9e4e1a2  ! 391: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe5616e  ! 392: SAVE_I	save	%r21, 0x0001, %r31
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 7)
	.word 0xb634c000  ! 396: ORN_R	orn 	%r19, %r0, %r27
	.word 0x9194a180  ! 401: WRPR_PIL_I	wrpr	%r18, 0x0180, %pil
	.word 0xbde42134  ! 405: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe52150  ! 406: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3e421d4  ! 408: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde4a082  ! 411: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e5a1f5  ! 414: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe5a0e7  ! 416: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e46042  ! 419: SAVE_I	save	%r17, 0x0001, %r26
	mov	1, %r12
	.word 0xa1930000  ! 421: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbf508000  ! 422: RDPR_TSTATE	<illegal instruction>
	.word 0xbc1da0ea  ! 423: XOR_I	xor 	%r22, 0x00ea, %r30
	.word 0xbbe5a12b  ! 428: SAVE_I	save	%r22, 0x0001, %r29
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 6)
	.word 0xbde46165  ! 430: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde46151  ! 432: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e5214e  ! 434: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e4e09d  ! 440: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7341000  ! 441: SRLX_R	srlx	%r16, %r0, %r27
	.word 0xb1e461ef  ! 442: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x899420e6  ! 445: WRPR_TICK_I	wrpr	%r16, 0x00e6, %tick
	.word 0x81956040  ! 446: WRPR_TPC_I	wrpr	%r21, 0x0040, %tpc
	.word 0xbeb40000  ! 447: ORNcc_R	orncc 	%r16, %r0, %r31
	.word 0xbde4e09e  ! 451: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe4a072  ! 452: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e52082  ! 453: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbd3c6001  ! 462: SRA_I	sra 	%r17, 0x0001, %r30
	.word 0x85946049  ! 463: WRPR_TSTATE_I	wrpr	%r17, 0x0049, %tstate
	.word 0x87956063  ! 468: WRPR_TT_I	wrpr	%r21, 0x0063, %tt
	.word 0xba24a1db  ! 471: SUB_I	sub 	%r18, 0x01db, %r29
	.word 0xb3e5e0a1  ! 472: SAVE_I	save	%r23, 0x0001, %r25
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbf51c000  ! 480: RDPR_TL	<illegal instruction>
	.word 0xb3e4a10c  ! 481: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xba3ce0c6  ! 483: XNOR_I	xnor 	%r19, 0x00c6, %r29
	.word 0xb5e5e141  ! 484: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbc0d8000  ! 491: AND_R	and 	%r22, %r0, %r30
	.word 0xb9e4a19c  ! 492: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbf510000  ! 493: RDPR_TICK	<illegal instruction>
	.word 0xb1e56003  ! 494: SAVE_I	save	%r21, 0x0001, %r24
	mov	2, %r12
	.word 0x8f930000  ! 495: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9504000  ! 496: RDPR_TNPC	<illegal instruction>
	setx	data_start_0, %g1, %r16
	setx	data_start_7, %g1, %r20
	.word 0xb4b5e1db  ! 499: SUBCcc_I	orncc 	%r23, 0x01db, %r26
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 7)
	.word 0xb33c2001  ! 506: SRA_I	sra 	%r16, 0x0001, %r25
	setx	0x7dc98c1900000a04, %g1, %r10
	.word 0x839a8000  ! 508: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb2b48000  ! 513: SUBCcc_R	orncc 	%r18, %r0, %r25
	.word 0xb7e461b8  ! 516: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe56001  ! 517: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e5a1a6  ! 518: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe460ec  ! 521: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x81946179  ! 523: WRPR_TPC_I	wrpr	%r17, 0x0179, %tpc
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 27)
	setx	data_start_3, %g1, %r16
	.word 0xbfe461b0  ! 530: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbbe4e0f2  ! 532: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e5e11c  ! 533: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb485e0ce  ! 534: ADDcc_I	addcc 	%r23, 0x00ce, %r26
	.word 0xb9e52160  ! 536: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e4a149  ! 537: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e4a1f8  ! 542: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x919561d3  ! 543: WRPR_PIL_I	wrpr	%r21, 0x01d3, %pil
	.word 0xb5480000  ! 545: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbfe4213b  ! 547: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb834604d  ! 548: ORN_I	orn 	%r17, 0x004d, %r28
	.word 0xbde521d9  ! 550: SAVE_I	save	%r20, 0x0001, %r30
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 1)
	.word 0xba848000  ! 554: ADDcc_R	addcc 	%r18, %r0, %r29
	.word 0xbfe4e142  ! 559: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e4a0c8  ! 563: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbb2c3001  ! 564: SLLX_I	sllx	%r16, 0x0001, %r29
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbfe4a09f  ! 567: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x89942109  ! 569: WRPR_TICK_I	wrpr	%r16, 0x0109, %tick
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 33)
	.word 0xbfe4e014  ! 571: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8d94a1ec  ! 573: WRPR_PSTATE_I	wrpr	%r18, 0x01ec, %pstate
	setx	data_start_6, %g1, %r16
	.word 0xb1e42151  ! 579: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7480000  ! 582: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb3e521ee  ! 584: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb951c000  ! 586: RDPR_TL	<illegal instruction>
	.word 0xb83d8000  ! 587: XNOR_R	xnor 	%r22, %r0, %r28
	.word 0x8d95218e  ! 589: WRPR_PSTATE_I	wrpr	%r20, 0x018e, %pstate
	.word 0xb32d0000  ! 593: SLL_R	sll 	%r20, %r0, %r25
	.word 0xb9e42170  ! 595: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e460c2  ! 596: SAVE_I	save	%r17, 0x0001, %r25
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb7e5612b  ! 599: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e5e15f  ! 600: SAVE_I	save	%r23, 0x0001, %r27
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 24)
	.word 0xb9508000  ! 605: RDPR_TSTATE	<illegal instruction>
	.word 0xb225207e  ! 606: SUB_I	sub 	%r20, 0x007e, %r25
	.word 0xb624e107  ! 610: SUB_I	sub 	%r19, 0x0107, %r27
	.word 0xb3e56047  ! 612: SAVE_I	save	%r21, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e56021  ! 615: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb751c000  ! 616: RDPR_TL	<illegal instruction>
	.word 0xb5e5201d  ! 618: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb28460fa  ! 619: ADDcc_I	addcc 	%r17, 0x00fa, %r25
	.word 0xbfe42005  ! 620: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbac421dc  ! 623: ADDCcc_I	addccc 	%r16, 0x01dc, %r29
	.word 0xb1e52046  ! 624: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbfe52188  ! 628: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbd518000  ! 630: RDPR_PSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r17
	.word 0xbe15c000  ! 633: OR_R	or 	%r23, %r0, %r31
	.word 0xb1e56176  ! 634: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde520c1  ! 637: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbb508000  ! 639: RDPR_TSTATE	<illegal instruction>
	.word 0xb2450000  ! 641: ADDC_R	addc 	%r20, %r0, %r25
	.word 0xb3480000  ! 643: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbde560cc  ! 646: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8194e05d  ! 649: WRPR_TPC_I	wrpr	%r19, 0x005d, %tpc
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 3)
	.word 0x859420d7  ! 653: WRPR_TSTATE_I	wrpr	%r16, 0x00d7, %tstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x5d5a4e9d00005c51, %g1, %r10
	.word 0x819a8000  ! 656: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 2d)
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb5e460f6  ! 663: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe4e156  ! 664: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde5a04e  ! 666: SAVE_I	save	%r22, 0x0001, %r30
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb1504000  ! 669: RDPR_TNPC	<illegal instruction>
	.word 0xb9e46126  ! 671: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e521e6  ! 673: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbf342001  ! 674: SRL_I	srl 	%r16, 0x0001, %r31
	.word 0xb1e5a1d0  ! 676: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbd504000  ! 679: RDPR_TNPC	<illegal instruction>
	.word 0xb3510000  ! 681: RDPR_TICK	<illegal instruction>
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 18)
	.word 0x9195e07a  ! 684: WRPR_PIL_I	wrpr	%r23, 0x007a, %pil
	.word 0xbfe4604c  ! 687: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde4e06a  ! 693: SAVE_I	save	%r19, 0x0001, %r30
	setx	data_start_3, %g1, %r21
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 19)
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbbe4603e  ! 698: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbb51c000  ! 701: RDPR_TL	<illegal instruction>
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb5e4e0eb  ! 705: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e5a17c  ! 706: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbb518000  ! 707: RDPR_PSTATE	<illegal instruction>
	.word 0xbde56157  ! 708: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbebcc000  ! 710: XNORcc_R	xnorcc 	%r19, %r0, %r31
	mov	1, %r12
	.word 0xa1930000  ! 713: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbe5e1ef  ! 714: SAVE_I	save	%r23, 0x0001, %r29
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 16)
	.word 0xb32c5000  ! 720: SLLX_R	sllx	%r17, %r0, %r25
	.word 0xbde5e1c9  ! 721: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8795206b  ! 731: WRPR_TT_I	wrpr	%r20, 0x006b, %tt
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 2)
	.word 0xb614e1ea  ! 736: OR_I	or 	%r19, 0x01ea, %r27
	.word 0xb1e4219f  ! 740: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e5a0a6  ! 742: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe521ed  ! 743: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8d9560b6  ! 744: WRPR_PSTATE_I	wrpr	%r21, 0x00b6, %pstate
	.word 0xb3e560b0  ! 745: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8d9521e2  ! 752: WRPR_PSTATE_I	wrpr	%r20, 0x01e2, %pstate
	.word 0xb53d0000  ! 755: SRA_R	sra 	%r20, %r0, %r26
	.word 0xbde4a0eb  ! 759: SAVE_I	save	%r18, 0x0001, %r30
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbde420d2  ! 762: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e4a145  ! 763: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7540000  ! 765: RDPR_GL	<illegal instruction>
	.word 0x81942023  ! 767: WRPR_TPC_I	wrpr	%r16, 0x0023, %tpc
	.word 0xb9e56004  ! 769: SAVE_I	save	%r21, 0x0001, %r28
	setx	data_start_7, %g1, %r21
	setx	data_start_4, %g1, %r23
	.word 0xb1e4e07c  ! 781: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e46124  ! 783: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e4e084  ! 789: SAVE_I	save	%r19, 0x0001, %r26
	mov	0, %r12
	.word 0xa1930000  ! 790: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe5a173  ! 793: SAVE_I	save	%r22, 0x0001, %r31
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 2)
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 34)
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 20)
	setx	0xe83ef0d200009add, %g1, %r10
	.word 0x819a8000  ! 801: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde46075  ! 803: SAVE_I	save	%r17, 0x0001, %r30
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 0)
	.word 0xb9e5a185  ! 806: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe4a0fb  ! 807: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e4e19a  ! 810: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e52115  ! 811: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 28)
	.word 0xb7e4613a  ! 818: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e4a1f5  ! 819: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e5202b  ! 823: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e4e123  ! 824: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb08ce039  ! 825: ANDcc_I	andcc 	%r19, 0x0039, %r24
	.word 0xbde5a0e4  ! 826: SAVE_I	save	%r22, 0x0001, %r30
	setx	0xcd36152c0000ba43, %g1, %r10
	.word 0x839a8000  ! 827: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e4204e  ! 829: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb41da020  ! 830: XOR_I	xor 	%r22, 0x0020, %r26
	.word 0xb6158000  ! 831: OR_R	or 	%r22, %r0, %r27
	.word 0xbde520f8  ! 837: SAVE_I	save	%r20, 0x0001, %r30
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 34)
	.word 0xbde5603e  ! 845: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8d95a171  ! 846: WRPR_PSTATE_I	wrpr	%r22, 0x0171, %pstate
	.word 0xbbe5602c  ! 847: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x8594e1e3  ! 848: WRPR_TSTATE_I	wrpr	%r19, 0x01e3, %tstate
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 3b)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8594a0fe  ! 853: WRPR_TSTATE_I	wrpr	%r18, 0x00fe, %tstate
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbbe4601e  ! 858: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb37d0400  ! 863: MOVR_R	movre	%r20, %r0, %r25
	.word 0xbd510000  ! 865: RDPR_TICK	<illegal instruction>
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, f)
	.word 0xbbe5a153  ! 868: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e46174  ! 870: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e4601c  ! 871: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e520e5  ! 873: SAVE_I	save	%r20, 0x0001, %r25
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 8)
	.word 0xb1e521e0  ! 876: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe461fc  ! 879: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb750c000  ! 880: RDPR_TT	<illegal instruction>
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 3c)
	.word 0xba242143  ! 891: SUB_I	sub 	%r16, 0x0143, %r29
	setx	0x8a92eeb600001958, %g1, %r10
	.word 0x819a8000  ! 892: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde4a14f  ! 893: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e5e130  ! 899: SAVE_I	save	%r23, 0x0001, %r27
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 17)
	.word 0xbde5e0f4  ! 905: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8395e0b9  ! 906: WRPR_TNPC_I	wrpr	%r23, 0x00b9, %tnpc
	.word 0xb3e5e147  ! 911: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e420db  ! 912: SAVE_I	save	%r16, 0x0001, %r28
	setx	data_start_4, %g1, %r22
	.word 0xb3e4e0f9  ! 919: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e46172  ! 921: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e5e16c  ! 923: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbf518000  ! 927: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e5a0ae  ! 929: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5480000  ! 932: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbde520e3  ! 933: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde4e191  ! 935: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e5609f  ! 937: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e561ad  ! 938: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e521df  ! 939: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb09ca10d  ! 941: XORcc_I	xorcc 	%r18, 0x010d, %r24
	.word 0xb9e5e019  ! 945: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x87946113  ! 946: WRPR_TT_I	wrpr	%r17, 0x0113, %tt
	.word 0xbde4a066  ! 948: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e421ba  ! 951: SAVE_I	save	%r16, 0x0001, %r26
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 1)
	setx	data_start_6, %g1, %r22
	.word 0xb1518000  ! 958: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e42001  ! 961: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbb500000  ! 962: RDPR_TPC	<illegal instruction>
	.word 0xb1508000  ! 970: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e56144  ! 971: SAVE_I	save	%r21, 0x0001, %r27
hwintr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_45), 16, 16)) -> intp(0, 0, 9)
	.word 0xb751c000  ! 976: RDPR_TL	<illegal instruction>
	.word 0xb1510000  ! 977: RDPR_TICK	<illegal instruction>
	.word 0xb3e5e0ee  ! 979: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde5a030  ! 980: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e46184  ! 983: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e4a05f  ! 984: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8d94a1ee  ! 985: WRPR_PSTATE_I	wrpr	%r18, 0x01ee, %pstate
	.word 0xbfe4e1f4  ! 988: SAVE_I	save	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e520b3  ! 991: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e4a057  ! 994: SAVE_I	save	%r18, 0x0001, %r27
	setx	0xab9cf28100000ec6, %g1, %r10
	.word 0x819a8000  ! 995: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde42013  ! 997: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e52164  ! 998: SAVE_I	save	%r20, 0x0001, %r25
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
	.word 0xf0758000  ! 4: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xfa346033  ! 5: STH_I	sth	%r29, [%r17 + 0x0033]
	.word 0xf4248000  ! 8: STW_R	stw	%r26, [%r18 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 9: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x89952010  ! 12: WRPR_TICK_I	wrpr	%r20, 0x0010, %tick
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 24)
	.word 0xb3504000  ! 22: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xb6b58000  ! 27: ORNcc_R	orncc 	%r22, %r0, %r27
	.word 0xf13c2057  ! 30: STDF_I	std	%f24, [0x0057, %r16]
	.word 0xfa2c605b  ! 42: STB_I	stb	%r29, [%r17 + 0x005b]
	.word 0xf0750000  ! 46: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xb77c0400  ! 47: MOVR_R	movre	%r16, %r0, %r27
	.word 0xbab56115  ! 49: SUBCcc_I	orncc 	%r21, 0x0115, %r29
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfc344000  ! 54: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xf2750000  ! 57: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xb5520000  ! 58: RDPR_PIL	<illegal instruction>
	.word 0xf02d8000  ! 61: STB_R	stb	%r24, [%r22 + %r0]
	.word 0x8d94e045  ! 62: WRPR_PSTATE_I	wrpr	%r19, 0x0045, %pstate
	.word 0x879421ae  ! 63: WRPR_TT_I	wrpr	%r16, 0x01ae, %tt
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc3dc000  ! 70: STD_R	std	%r30, [%r23 + %r0]
	.word 0xf874204c  ! 71: STX_I	stx	%r28, [%r16 + 0x004c]
	.word 0xfe2dc000  ! 76: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xfe354000  ! 79: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf73c0000  ! 80: STDF_R	std	%f27, [%r0, %r16]
	.word 0x9195a1ee  ! 81: WRPR_PIL_I	wrpr	%r22, 0x01ee, %pil
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb09d4000  ! 88: XORcc_R	xorcc 	%r21, %r0, %r24
	.word 0xf02d61c3  ! 92: STB_I	stb	%r24, [%r21 + 0x01c3]
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 2f)
	.word 0xb5500000  ! 94: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xbb3c0000  ! 99: SRA_R	sra 	%r16, %r0, %r29
	.word 0xbd50c000  ! 101: RDPR_TT	<illegal instruction>
	.word 0xfe254000  ! 103: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xfe75c000  ! 104: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xfe3dc000  ! 106: STD_R	std	%r31, [%r23 + %r0]
	.word 0xb7520000  ! 107: RDPR_PIL	<illegal instruction>
	.word 0xbeac8000  ! 113: ANDNcc_R	andncc 	%r18, %r0, %r31
	.word 0xbd51c000  ! 119: RDPR_TL	<illegal instruction>
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfd3d4000  ! 123: STDF_R	std	%f30, [%r0, %r21]
	.word 0xf53ca065  ! 125: STDF_I	std	%f26, [0x0065, %r18]
	.word 0xb1504000  ! 130: RDPR_TNPC	<illegal instruction>
	.word 0xb01d207a  ! 134: XOR_I	xor 	%r20, 0x007a, %r24
	.word 0xfe3ce1e1  ! 135: STD_I	std	%r31, [%r19 + 0x01e1]
	.word 0xf8258000  ! 143: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xfe35601d  ! 146: STH_I	sth	%r31, [%r21 + 0x001d]
	.word 0xb12cf001  ! 156: SLLX_I	sllx	%r19, 0x0001, %r24
	.word 0xf035a1ef  ! 157: STH_I	sth	%r24, [%r22 + 0x01ef]
	.word 0xb5518000  ! 159: RDPR_PSTATE	<illegal instruction>
	.word 0xfb3ca19b  ! 160: STDF_I	std	%f29, [0x019b, %r18]
	.word 0xb551c000  ! 162: RDPR_TL	<illegal instruction>
	.word 0xf42d21b1  ! 165: STB_I	stb	%r26, [%r20 + 0x01b1]
	.word 0xf0258000  ! 167: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xf834a1d4  ! 168: STH_I	sth	%r28, [%r18 + 0x01d4]
	.word 0xb7500000  ! 171: RDPR_TPC	<illegal instruction>
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 1d)
	.word 0xb3540000  ! 173: RDPR_GL	<illegal instruction>
	.word 0xfe74a111  ! 174: STX_I	stx	%r31, [%r18 + 0x0111]
	.word 0xfc340000  ! 175: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xf82420b6  ! 178: STW_I	stw	%r28, [%r16 + 0x00b6]
	.word 0xb7520000  ! 179: RDPR_PIL	<illegal instruction>
	.word 0xf13d8000  ! 180: STDF_R	std	%f24, [%r0, %r22]
	.word 0xf53d21fe  ! 181: STDF_I	std	%f26, [0x01fe, %r20]
	.word 0xf6354000  ! 185: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xff3da0d7  ! 191: STDF_I	std	%f31, [0x00d7, %r22]
	.word 0xfe352071  ! 194: STH_I	sth	%r31, [%r20 + 0x0071]
	.word 0xb7508000  ! 197: RDPR_TSTATE	<illegal instruction>
	.word 0xf82d0000  ! 200: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xfe340000  ! 203: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xfa3c206e  ! 204: STD_I	std	%r29, [%r16 + 0x006e]
	.word 0xf2746051  ! 209: STX_I	stx	%r25, [%r17 + 0x0051]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9195e1dc  ! 211: WRPR_PIL_I	wrpr	%r23, 0x01dc, %pil
	.word 0xf4248000  ! 212: STW_R	stw	%r26, [%r18 + %r0]
	setx	data_start_3, %g1, %r21
	.word 0x8995a0a1  ! 217: WRPR_TICK_I	wrpr	%r22, 0x00a1, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf53ce06c  ! 220: STDF_I	std	%f26, [0x006c, %r19]
	.word 0xb7500000  ! 222: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xfa2d2015  ! 224: STB_I	stb	%r29, [%r20 + 0x0015]
	.word 0xf8754000  ! 230: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xf22cc000  ! 236: STB_R	stb	%r25, [%r19 + %r0]
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 33)
	setx	data_start_6, %g1, %r22
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 14)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd3d0000  ! 249: SRA_R	sra 	%r20, %r0, %r30
	.word 0xb73c2001  ! 250: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0xbd518000  ! 252: RDPR_PSTATE	<illegal instruction>
	.word 0xf63d8000  ! 254: STD_R	std	%r27, [%r22 + %r0]
	.word 0xfe244000  ! 262: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xf33de001  ! 263: STDF_I	std	%f25, [0x0001, %r23]
	.word 0xf83ca1aa  ! 266: STD_I	std	%r28, [%r18 + 0x01aa]
	.word 0xf474e03b  ! 267: STX_I	stx	%r26, [%r19 + 0x003b]
	mov	0, %r12
	.word 0xa1930000  ! 271: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe3d61df  ! 272: STD_I	std	%r31, [%r21 + 0x01df]
	.word 0xfe24e0c9  ! 273: STW_I	stw	%r31, [%r19 + 0x00c9]
	.word 0xbd508000  ! 274: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xfc756068  ! 276: STX_I	stx	%r30, [%r21 + 0x0068]
	.word 0xf43d4000  ! 277: STD_R	std	%r26, [%r21 + %r0]
	.word 0xf625e1cc  ! 281: STW_I	stw	%r27, [%r23 + 0x01cc]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb03c60f4  ! 284: XNOR_I	xnor 	%r17, 0x00f4, %r24
	.word 0xf33c602c  ! 286: STDF_I	std	%f25, [0x002c, %r17]
	.word 0xb350c000  ! 289: RDPR_TT	<illegal instruction>
	.word 0xf8356183  ! 290: STH_I	sth	%r28, [%r21 + 0x0183]
	.word 0xb6054000  ! 294: ADD_R	add 	%r21, %r0, %r27
	.word 0xb3504000  ! 295: RDPR_TNPC	<illegal instruction>
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 31)
	.word 0xfa248000  ! 298: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xff3d21c0  ! 299: STDF_I	std	%f31, [0x01c0, %r20]
	.word 0xfe2d218d  ! 303: STB_I	stb	%r31, [%r20 + 0x018d]
	.word 0xf634c000  ! 305: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xb751c000  ! 306: RDPR_TL	<illegal instruction>
	.word 0x8194e1e7  ! 309: WRPR_TPC_I	wrpr	%r19, 0x01e7, %tpc
	.word 0xb1520000  ! 311: RDPR_PIL	rdpr	%pil, %r24
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 2)
	mov	2, %r12
	.word 0xa1930000  ! 317: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe252167  ! 320: STW_I	stw	%r31, [%r20 + 0x0167]
	.word 0x9194a0eb  ! 321: WRPR_PIL_I	wrpr	%r18, 0x00eb, %pil
	.word 0xf63c60dc  ! 323: STD_I	std	%r27, [%r17 + 0x00dc]
	.word 0xfa342064  ! 326: STH_I	sth	%r29, [%r16 + 0x0064]
	.word 0x8794a08b  ! 329: WRPR_TT_I	wrpr	%r18, 0x008b, %tt
	.word 0xf62c615d  ! 333: STB_I	stb	%r27, [%r17 + 0x015d]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 19)
	.word 0x8795a03a  ! 337: WRPR_TT_I	wrpr	%r22, 0x003a, %tt
	.word 0xfc35e058  ! 340: STH_I	sth	%r30, [%r23 + 0x0058]
	.word 0xfe34205b  ! 341: STH_I	sth	%r31, [%r16 + 0x005b]
	.word 0xf6350000  ! 342: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xf03c4000  ! 345: STD_R	std	%r24, [%r17 + %r0]
	.word 0xbd500000  ! 347: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xfc750000  ! 348: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xbf520000  ! 351: RDPR_PIL	<illegal instruction>
	.word 0xb815a094  ! 352: OR_I	or 	%r22, 0x0094, %r28
	.word 0xb204a12c  ! 354: ADD_I	add 	%r18, 0x012c, %r25
	.word 0x81946093  ! 357: WRPR_TPC_I	wrpr	%r17, 0x0093, %tpc
	.word 0xfe3c4000  ! 360: STD_R	std	%r31, [%r17 + %r0]
	.word 0xb7518000  ! 361: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xb2844000  ! 363: ADDcc_R	addcc 	%r17, %r0, %r25
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 17)
	.word 0xf2350000  ! 368: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xbabd0000  ! 369: XNORcc_R	xnorcc 	%r20, %r0, %r29
	.word 0xf42d8000  ! 373: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xf435a1ac  ! 379: STH_I	sth	%r26, [%r22 + 0x01ac]
	.word 0x839421a5  ! 385: WRPR_TNPC_I	wrpr	%r16, 0x01a5, %tnpc
	.word 0xf27561b1  ! 388: STX_I	stx	%r25, [%r21 + 0x01b1]
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 16)
	.word 0xf42d2019  ! 394: STB_I	stb	%r26, [%r20 + 0x0019]
	.word 0xb6344000  ! 396: ORN_R	orn 	%r17, %r0, %r27
	.word 0xfe34c000  ! 399: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xfe3de0e0  ! 400: STD_I	std	%r31, [%r23 + 0x00e0]
	.word 0x9195e00b  ! 401: WRPR_PIL_I	wrpr	%r23, 0x000b, %pil
	.word 0xf73c4000  ! 403: STDF_R	std	%f27, [%r0, %r17]
	.word 0xfe7561e9  ! 409: STX_I	stx	%r31, [%r21 + 0x01e9]
	.word 0xf275c000  ! 418: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xf43d21f7  ! 420: STD_I	std	%r26, [%r20 + 0x01f7]
	mov	1, %r12
	.word 0xa1930000  ! 421: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7508000  ! 422: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xbe1c61bd  ! 423: XOR_I	xor 	%r17, 0x01bd, %r31
	.word 0xf824e17e  ! 424: STW_I	stw	%r28, [%r19 + 0x017e]
	.word 0xff3ce1a8  ! 427: STDF_I	std	%f31, [0x01a8, %r19]
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 33)
	.word 0xf42460ad  ! 436: STW_I	stw	%r26, [%r17 + 0x00ad]
	.word 0xb5341000  ! 441: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xfa3da0f8  ! 444: STD_I	std	%r29, [%r22 + 0x00f8]
	.word 0x8994e12e  ! 445: WRPR_TICK_I	wrpr	%r19, 0x012e, %tick
	.word 0x8195a1df  ! 446: WRPR_TPC_I	wrpr	%r22, 0x01df, %tpc
	.word 0xbab50000  ! 447: ORNcc_R	orncc 	%r20, %r0, %r29
	.word 0xf235c000  ! 450: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xf0740000  ! 457: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xfc3c4000  ! 459: STD_R	std	%r30, [%r17 + %r0]
	.word 0xfe3da0cc  ! 461: STD_I	std	%r31, [%r22 + 0x00cc]
	.word 0xb33c6001  ! 462: SRA_I	sra 	%r17, 0x0001, %r25
	.word 0x8594617a  ! 463: WRPR_TSTATE_I	wrpr	%r17, 0x017a, %tstate
	.word 0xfc2c8000  ! 464: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xf8754000  ! 465: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xfc2d20cc  ! 467: STB_I	stb	%r30, [%r20 + 0x00cc]
	.word 0x8794e1de  ! 468: WRPR_TT_I	wrpr	%r19, 0x01de, %tt
	.word 0xb02561cd  ! 471: SUB_I	sub 	%r21, 0x01cd, %r24
	.word 0xf82c0000  ! 473: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xfe2ce1e8  ! 475: STB_I	stb	%r31, [%r19 + 0x01e8]
	.word 0xfc250000  ! 476: STW_R	stw	%r30, [%r20 + %r0]
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 33)
	.word 0xf22de0e5  ! 479: STB_I	stb	%r25, [%r23 + 0x00e5]
	.word 0xb951c000  ! 480: RDPR_TL	rdpr	%tl, %r28
	.word 0xb43ce152  ! 483: XNOR_I	xnor 	%r19, 0x0152, %r26
	.word 0xf43c8000  ! 485: STD_R	std	%r26, [%r18 + %r0]
	.word 0xb00c0000  ! 491: AND_R	and 	%r16, %r0, %r24
	.word 0xb7510000  ! 493: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 495: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1504000  ! 496: RDPR_TNPC	rdpr	%tnpc, %r24
	setx	data_start_7, %g1, %r19
	setx	data_start_3, %g1, %r19
	.word 0xb2b5215f  ! 499: SUBCcc_I	orncc 	%r20, 0x015f, %r25
	.word 0xf02d6158  ! 501: STB_I	stb	%r24, [%r21 + 0x0158]
	.word 0xfe246004  ! 502: STW_I	stw	%r31, [%r17 + 0x0004]
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, f)
	.word 0xbf3d6001  ! 506: SRA_I	sra 	%r21, 0x0001, %r31
	setx	0x16b216990000b9d1, %g1, %r10
	.word 0x839a8000  ! 508: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa35200a  ! 510: STH_I	sth	%r29, [%r20 + 0x000a]
	.word 0xb4b40000  ! 513: SUBCcc_R	orncc 	%r16, %r0, %r26
	.word 0xf8740000  ! 514: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xfc3cc000  ! 519: STD_R	std	%r30, [%r19 + %r0]
	.word 0xf825c000  ! 522: STW_R	stw	%r28, [%r23 + %r0]
	.word 0x8194a1da  ! 523: WRPR_TPC_I	wrpr	%r18, 0x01da, %tpc
	.word 0xf83460b1  ! 524: STH_I	sth	%r28, [%r17 + 0x00b1]
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, e)
	setx	data_start_1, %g1, %r23
	.word 0xfa3c0000  ! 527: STD_R	std	%r29, [%r16 + %r0]
	.word 0xb0846156  ! 534: ADDcc_I	addcc 	%r17, 0x0156, %r24
	.word 0xf2358000  ! 541: STH_R	sth	%r25, [%r22 + %r0]
	.word 0x9194606f  ! 543: WRPR_PIL_I	wrpr	%r17, 0x006f, %pil
	.word 0xbf480000  ! 545: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbc34a15c  ! 548: ORN_I	orn 	%r18, 0x015c, %r30
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 1)
	.word 0xfc340000  ! 552: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xf475e1ce  ! 553: STX_I	stx	%r26, [%r23 + 0x01ce]
	.word 0xb684c000  ! 554: ADDcc_R	addcc 	%r19, %r0, %r27
	.word 0xf42460ec  ! 555: STW_I	stw	%r26, [%r17 + 0x00ec]
	.word 0xfe35e093  ! 562: STH_I	sth	%r31, [%r23 + 0x0093]
	.word 0xb92d7001  ! 564: SLLX_I	sllx	%r21, 0x0001, %r28
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 22)
	.word 0x8995a05a  ! 569: WRPR_TICK_I	wrpr	%r22, 0x005a, %tick
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 39)
	.word 0xf825e010  ! 572: STW_I	stw	%r28, [%r23 + 0x0010]
	.word 0x8d946102  ! 573: WRPR_PSTATE_I	wrpr	%r17, 0x0102, %pstate
	.word 0xfc758000  ! 574: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xfe34e018  ! 576: STH_I	sth	%r31, [%r19 + 0x0018]
	setx	data_start_3, %g1, %r16
	.word 0xfc2d6090  ! 580: STB_I	stb	%r30, [%r21 + 0x0090]
	.word 0xf4354000  ! 581: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xb5480000  ! 582: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb151c000  ! 586: RDPR_TL	<illegal instruction>
	.word 0xbe3d0000  ! 587: XNOR_R	xnor 	%r20, %r0, %r31
	.word 0x8d9461b0  ! 589: WRPR_PSTATE_I	wrpr	%r17, 0x01b0, %pstate
	.word 0xfe2d8000  ! 591: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xb92d4000  ! 593: SLL_R	sll 	%r21, %r0, %r28
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 2c)
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 15)
	.word 0xb1508000  ! 605: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xb62520a2  ! 606: SUB_I	sub 	%r20, 0x00a2, %r27
	.word 0xf2354000  ! 609: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xb224e02f  ! 610: SUB_I	sub 	%r19, 0x002f, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf675c000  ! 614: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xb751c000  ! 616: RDPR_TL	<illegal instruction>
	.word 0xb485e194  ! 619: ADDcc_I	addcc 	%r23, 0x0194, %r26
	.word 0xfa74a17f  ! 622: STX_I	stx	%r29, [%r18 + 0x017f]
	.word 0xb8c461db  ! 623: ADDCcc_I	addccc 	%r17, 0x01db, %r28
	.word 0xfe748000  ! 625: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xf42ca072  ! 629: STB_I	stb	%r26, [%r18 + 0x0072]
	.word 0xbb518000  ! 630: RDPR_PSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r16
	.word 0xba144000  ! 633: OR_R	or 	%r17, %r0, %r29
	.word 0xf73c8000  ! 635: STDF_R	std	%f27, [%r0, %r18]
	.word 0xbb508000  ! 639: RDPR_TSTATE	<illegal instruction>
	.word 0xb8458000  ! 641: ADDC_R	addc 	%r22, %r0, %r28
	.word 0xb7480000  ! 643: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf82d8000  ! 644: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xf83c0000  ! 647: STD_R	std	%r28, [%r16 + %r0]
	.word 0x8195e1a1  ! 649: WRPR_TPC_I	wrpr	%r23, 0x01a1, %tpc
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 17)
	.word 0x8594a12d  ! 653: WRPR_TSTATE_I	wrpr	%r18, 0x012d, %tstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x62d8ef3800004a06, %g1, %r10
	.word 0x819a8000  ! 656: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe358000  ! 658: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xf23ce1a5  ! 659: STD_I	std	%r25, [%r19 + 0x01a5]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 36)
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, b)
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 17)
	.word 0xb5504000  ! 669: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xf63d8000  ! 670: STD_R	std	%r27, [%r22 + %r0]
	.word 0xbf356001  ! 674: SRL_I	srl 	%r21, 0x0001, %r31
	.word 0xfe246189  ! 678: STW_I	stw	%r31, [%r17 + 0x0189]
	.word 0xb5504000  ! 679: RDPR_TNPC	<illegal instruction>
	.word 0xbf510000  ! 681: RDPR_TICK	<illegal instruction>
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 3d)
	.word 0x9194a0dc  ! 684: WRPR_PIL_I	wrpr	%r18, 0x00dc, %pil
	.word 0xf824e1ed  ! 685: STW_I	stw	%r28, [%r19 + 0x01ed]
	.word 0xf42dc000  ! 686: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xfa35e13b  ! 690: STH_I	sth	%r29, [%r23 + 0x013b]
	setx	data_start_7, %g1, %r17
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 24)
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 19)
	.word 0xfe2dc000  ! 697: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xf2244000  ! 700: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xbd51c000  ! 701: RDPR_TL	rdpr	%tl, %r30
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 1d)
	.word 0xbf518000  ! 707: RDPR_PSTATE	<illegal instruction>
	.word 0xbebc8000  ! 710: XNORcc_R	xnorcc 	%r18, %r0, %r31
	mov	0, %r12
	.word 0xa1930000  ! 713: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 29)
	.word 0xb12d9000  ! 720: SLLX_R	sllx	%r22, %r0, %r24
	.word 0xf73c615e  ! 724: STDF_I	std	%f27, [0x015e, %r17]
	.word 0xf73d209e  ! 729: STDF_I	std	%f27, [0x009e, %r20]
	.word 0xfe2c617f  ! 730: STB_I	stb	%r31, [%r17 + 0x017f]
	.word 0x8794e086  ! 731: WRPR_TT_I	wrpr	%r19, 0x0086, %tt
	.word 0xf93c8000  ! 733: STDF_R	std	%f28, [%r0, %r18]
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 34)
	.word 0xb814e09d  ! 736: OR_I	or 	%r19, 0x009d, %r28
	.word 0x8d95e17a  ! 744: WRPR_PSTATE_I	wrpr	%r23, 0x017a, %pstate
	.word 0xfe24a039  ! 747: STW_I	stw	%r31, [%r18 + 0x0039]
	.word 0xf02c2082  ! 748: STB_I	stb	%r24, [%r16 + 0x0082]
	.word 0xf53c6060  ! 749: STDF_I	std	%f26, [0x0060, %r17]
	.word 0x8d942169  ! 752: WRPR_PSTATE_I	wrpr	%r16, 0x0169, %pstate
	.word 0xf03d0000  ! 753: STD_R	std	%r24, [%r20 + %r0]
	.word 0xb73d8000  ! 755: SRA_R	sra 	%r22, %r0, %r27
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 1d)
	.word 0xb7540000  ! 765: RDPR_GL	rdpr	%-, %r27
	.word 0x819521f6  ! 767: WRPR_TPC_I	wrpr	%r20, 0x01f6, %tpc
	.word 0xf674a195  ! 770: STX_I	stx	%r27, [%r18 + 0x0195]
	.word 0xfb3d8000  ! 771: STDF_R	std	%f29, [%r0, %r22]
	.word 0xfa25c000  ! 772: STW_R	stw	%r29, [%r23 + %r0]
	setx	data_start_7, %g1, %r22
	.word 0xf73d0000  ! 777: STDF_R	std	%f27, [%r0, %r20]
	setx	data_start_4, %g1, %r21
	.word 0xfc2ca06f  ! 787: STB_I	stb	%r30, [%r18 + 0x006f]
	mov	0, %r12
	.word 0xa1930000  ! 790: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf224e0aa  ! 791: STW_I	stw	%r25, [%r19 + 0x00aa]
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, b)
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 30)
	.word 0xfc3560cb  ! 799: STH_I	sth	%r30, [%r21 + 0x00cb]
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 9)
	setx	0xd6dc0ac0000fe98, %g1, %r10
	.word 0x819a8000  ! 801: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf33c8000  ! 805: STDF_R	std	%f25, [%r0, %r18]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 4)
	.word 0xf82da04c  ! 816: STB_I	stb	%r28, [%r22 + 0x004c]
	.word 0xf03c4000  ! 817: STD_R	std	%r24, [%r17 + %r0]
	.word 0xfa24202b  ! 820: STW_I	stw	%r29, [%r16 + 0x002b]
	.word 0xf62d4000  ! 822: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xb68d603e  ! 825: ANDcc_I	andcc 	%r21, 0x003e, %r27
	setx	0x235742c100005b4e, %g1, %r10
	.word 0x839a8000  ! 827: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc34c000  ! 828: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xb41d618e  ! 830: XOR_I	xor 	%r21, 0x018e, %r26
	.word 0xb814c000  ! 831: OR_R	or 	%r19, %r0, %r28
	.word 0xff3c4000  ! 833: STDF_R	std	%f31, [%r0, %r17]
	.word 0xf634a118  ! 838: STH_I	sth	%r27, [%r18 + 0x0118]
	.word 0xf025a1ad  ! 840: STW_I	stw	%r24, [%r22 + 0x01ad]
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, e)
	.word 0xf8240000  ! 844: STW_R	stw	%r28, [%r16 + %r0]
	.word 0x8d94e0ff  ! 846: WRPR_PSTATE_I	wrpr	%r19, 0x00ff, %pstate
	.word 0x8594a071  ! 848: WRPR_TSTATE_I	wrpr	%r18, 0x0071, %tstate
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 3e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8595e0bd  ! 853: WRPR_TSTATE_I	wrpr	%r23, 0x00bd, %tstate
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 9)
	.word 0xb97c0400  ! 863: MOVR_R	movre	%r16, %r0, %r28
	.word 0xf435c000  ! 864: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xb5510000  ! 865: RDPR_TICK	rdpr	%tick, %r26
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 38)
	.word 0xf63ca1b5  ! 867: STD_I	std	%r27, [%r18 + 0x01b5]
	.word 0xf13dc000  ! 869: STDF_R	std	%f24, [%r0, %r23]
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 2)
	.word 0xf035a017  ! 878: STH_I	sth	%r24, [%r22 + 0x0017]
	.word 0xbf50c000  ! 880: RDPR_TT	<illegal instruction>
	.word 0xf22ca10d  ! 882: STB_I	stb	%r25, [%r18 + 0x010d]
	.word 0xff3ce0db  ! 883: STDF_I	std	%f31, [0x00db, %r19]
	.word 0xf02c8000  ! 886: STB_R	stb	%r24, [%r18 + %r0]
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf03c0000  ! 890: STD_R	std	%r24, [%r16 + %r0]
	.word 0xbe2460c1  ! 891: SUB_I	sub 	%r17, 0x00c1, %r31
	setx	0xd6d59f2a0000eb49, %g1, %r10
	.word 0x819a8000  ! 892: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf53d61c5  ! 894: STDF_I	std	%f26, [0x01c5, %r21]
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 35)
	.word 0xfe250000  ! 902: STW_R	stw	%r31, [%r20 + %r0]
	.word 0x839460c7  ! 906: WRPR_TNPC_I	wrpr	%r17, 0x00c7, %tnpc
	.word 0xf83521bb  ! 908: STH_I	sth	%r28, [%r20 + 0x01bb]
	.word 0xfc3dc000  ! 914: STD_R	std	%r30, [%r23 + %r0]
	.word 0xf2240000  ! 917: STW_R	stw	%r25, [%r16 + %r0]
	setx	data_start_1, %g1, %r23
	.word 0xb9518000  ! 927: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xfe25a047  ! 928: STW_I	stw	%r31, [%r22 + 0x0047]
	.word 0xb1480000  ! 932: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf93dc000  ! 934: STDF_R	std	%f28, [%r0, %r23]
	.word 0xf13c4000  ! 936: STDF_R	std	%f24, [%r0, %r17]
	.word 0xbc9c60aa  ! 941: XORcc_I	xorcc 	%r17, 0x00aa, %r30
	.word 0xf074a1b8  ! 942: STX_I	stx	%r24, [%r18 + 0x01b8]
	.word 0xf43ce0ff  ! 944: STD_I	std	%r26, [%r19 + 0x00ff]
	.word 0x8794e0f3  ! 946: WRPR_TT_I	wrpr	%r19, 0x00f3, %tt
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, 1c)
	setx	data_start_7, %g1, %r17
	.word 0xbf518000  ! 958: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf2744000  ! 960: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xb9500000  ! 962: RDPR_TPC	<illegal instruction>
	.word 0xf82de068  ! 963: STB_I	stb	%r28, [%r23 + 0x0068]
	.word 0xf22521ff  ! 964: STW_I	stw	%r25, [%r20 + 0x01ff]
	.word 0xfe3ce009  ! 967: STD_I	std	%r31, [%r19 + 0x0009]
	.word 0xb1508000  ! 970: RDPR_TSTATE	<illegal instruction>
	.word 0xf73ce040  ! 972: STDF_I	std	%f27, [0x0040, %r19]
hwintr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_45), 16, 16)) -> intp(3, 0, 8)
	.word 0xbd51c000  ! 976: RDPR_TL	<illegal instruction>
	.word 0xb5510000  ! 977: RDPR_TICK	<illegal instruction>
	.word 0x8d94e099  ! 985: WRPR_PSTATE_I	wrpr	%r19, 0x0099, %pstate
	.word 0xfa248000  ! 986: STW_R	stw	%r29, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x4e907cfe0000bd07, %g1, %r10
	.word 0x819a8000  ! 995: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
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
	.word 0xf24c4000  ! 2: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xf40ce0b0  ! 6: LDUB_I	ldub	[%r19 + 0x00b0], %r26
	.word 0xff1cc000  ! 7: LDDF_R	ldd	[%r19, %r0], %f31
	mov	2, %r12
	.word 0x8f930000  ! 9: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8995e184  ! 12: WRPR_TICK_I	wrpr	%r23, 0x0184, %tick
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 38)
	.word 0xf81de1bf  ! 15: LDD_I	ldd	[%r23 + 0x01bf], %r28
	.word 0xf00d0000  ! 16: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xfe550000  ! 21: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xb1504000  ! 22: RDPR_TNPC	<illegal instruction>
	.word 0xf20da0c5  ! 25: LDUB_I	ldub	[%r22 + 0x00c5], %r25
	.word 0xb2b44000  ! 27: ORNcc_R	orncc 	%r17, %r0, %r25
	.word 0xfc04a1cc  ! 29: LDUW_I	lduw	[%r18 + 0x01cc], %r30
	.word 0xfc158000  ! 31: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xf6158000  ! 33: LDUH_R	lduh	[%r22 + %r0], %r27
	.word 0xfe544000  ! 36: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xfa0ce061  ! 38: LDUB_I	ldub	[%r19 + 0x0061], %r29
	.word 0xf0050000  ! 44: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xfe454000  ! 45: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xb97d8400  ! 47: MOVR_R	movre	%r22, %r0, %r28
	.word 0xb4b5a123  ! 49: SUBCcc_I	orncc 	%r22, 0x0123, %r26
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf84ca162  ! 55: LDSB_I	ldsb	[%r18 + 0x0162], %r28
	.word 0xb3520000  ! 58: RDPR_PIL	<illegal instruction>
	.word 0xf6542057  ! 59: LDSH_I	ldsh	[%r16 + 0x0057], %r27
	.word 0xf61d0000  ! 60: LDD_R	ldd	[%r20 + %r0], %r27
	.word 0x8d95e00a  ! 62: WRPR_PSTATE_I	wrpr	%r23, 0x000a, %pstate
	.word 0x8795a16a  ! 63: WRPR_TT_I	wrpr	%r22, 0x016a, %tt
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf44d21fa  ! 66: LDSB_I	ldsb	[%r20 + 0x01fa], %r26
	.word 0xf04ca0f8  ! 67: LDSB_I	ldsb	[%r18 + 0x00f8], %r24
	.word 0xf444e138  ! 77: LDSW_I	ldsw	[%r19 + 0x0138], %r26
	.word 0x9195613e  ! 81: WRPR_PIL_I	wrpr	%r21, 0x013e, %pil
	.word 0xf91cc000  ! 83: LDDF_R	ldd	[%r19, %r0], %f28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb09c0000  ! 88: XORcc_R	xorcc 	%r16, %r0, %r24
	.word 0xf51cc000  ! 89: LDDF_R	ldd	[%r19, %r0], %f26
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, e)
	.word 0xb1500000  ! 94: RDPR_TPC	<illegal instruction>
	.word 0xf60d615a  ! 95: LDUB_I	ldub	[%r21 + 0x015a], %r27
	.word 0xb33cc000  ! 99: SRA_R	sra 	%r19, %r0, %r25
	.word 0xf31c4000  ! 100: LDDF_R	ldd	[%r17, %r0], %f25
	.word 0xb950c000  ! 101: RDPR_TT	<illegal instruction>
	.word 0xf214c000  ! 102: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xfe4c20bc  ! 105: LDSB_I	ldsb	[%r16 + 0x00bc], %r31
	.word 0xb3520000  ! 107: RDPR_PIL	<illegal instruction>
	.word 0xf644a197  ! 108: LDSW_I	ldsw	[%r18 + 0x0197], %r27
	.word 0xfc4c4000  ! 109: LDSB_R	ldsb	[%r17 + %r0], %r30
	.word 0xf445216f  ! 112: LDSW_I	ldsw	[%r20 + 0x016f], %r26
	.word 0xb0ac8000  ! 113: ANDNcc_R	andncc 	%r18, %r0, %r24
	.word 0xf2552025  ! 114: LDSH_I	ldsh	[%r20 + 0x0025], %r25
	.word 0xf00cc000  ! 116: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xb751c000  ! 119: RDPR_TL	<illegal instruction>
	.word 0xf4048000  ! 120: LDUW_R	lduw	[%r18 + %r0], %r26
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf654a06b  ! 126: LDSH_I	ldsh	[%r18 + 0x006b], %r27
	.word 0xb5504000  ! 130: RDPR_TNPC	<illegal instruction>
	.word 0xf8144000  ! 132: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xb01ca048  ! 134: XOR_I	xor 	%r18, 0x0048, %r24
	.word 0xf25ce0e8  ! 138: LDX_I	ldx	[%r19 + 0x00e8], %r25
	.word 0xfa5d214b  ! 139: LDX_I	ldx	[%r20 + 0x014b], %r29
	.word 0xf45d6134  ! 141: LDX_I	ldx	[%r21 + 0x0134], %r26
	.word 0xf804e162  ! 142: LDUW_I	lduw	[%r19 + 0x0162], %r28
	.word 0xfe548000  ! 153: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xf00560a4  ! 155: LDUW_I	lduw	[%r21 + 0x00a4], %r24
	.word 0xbd2c7001  ! 156: SLLX_I	sllx	%r17, 0x0001, %r30
	.word 0xbd518000  ! 159: RDPR_PSTATE	<illegal instruction>
	.word 0xb951c000  ! 162: RDPR_TL	<illegal instruction>
	.word 0xf645c000  ! 163: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xf8054000  ! 164: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xfc458000  ! 166: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xfc45c000  ! 169: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xf60c0000  ! 170: LDUB_R	ldub	[%r16 + %r0], %r27
	.word 0xb7500000  ! 171: RDPR_TPC	<illegal instruction>
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 20)
	.word 0xb7540000  ! 173: RDPR_GL	<illegal instruction>
	.word 0xfa55e060  ! 177: LDSH_I	ldsh	[%r23 + 0x0060], %r29
	.word 0xbd520000  ! 179: RDPR_PIL	<illegal instruction>
	.word 0xf644e06b  ! 184: LDSW_I	ldsw	[%r19 + 0x006b], %r27
	.word 0xf85c0000  ! 187: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xbb508000  ! 197: RDPR_TSTATE	<illegal instruction>
	.word 0xf004e1aa  ! 198: LDUW_I	lduw	[%r19 + 0x01aa], %r24
	.word 0xf51dc000  ! 205: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xf64dc000  ! 208: LDSB_R	ldsb	[%r23 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9194e1a6  ! 211: WRPR_PIL_I	wrpr	%r19, 0x01a6, %pil
	.word 0xf04c4000  ! 214: LDSB_R	ldsb	[%r17 + %r0], %r24
	setx	data_start_5, %g1, %r18
	.word 0x8995a108  ! 217: WRPR_TICK_I	wrpr	%r22, 0x0108, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf80da1c8  ! 221: LDUB_I	ldub	[%r22 + 0x01c8], %r28
	.word 0xb7500000  ! 222: RDPR_TPC	<illegal instruction>
	.word 0xf11dc000  ! 226: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0xf05cc000  ! 229: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xf91d0000  ! 234: LDDF_R	ldd	[%r20, %r0], %f28
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 38)
	setx	data_start_5, %g1, %r20
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 22)
	.word 0xf60460ee  ! 244: LDUW_I	lduw	[%r17 + 0x00ee], %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0450000  ! 248: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xbf3c4000  ! 249: SRA_R	sra 	%r17, %r0, %r31
	.word 0xb13c2001  ! 250: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0xb9518000  ! 252: RDPR_PSTATE	<illegal instruction>
	.word 0xfc5d6097  ! 253: LDX_I	ldx	[%r21 + 0x0097], %r30
	.word 0xf8458000  ! 257: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xfc1c608b  ! 259: LDD_I	ldd	[%r17 + 0x008b], %r30
	.word 0xf64d8000  ! 268: LDSB_R	ldsb	[%r22 + %r0], %r27
	mov	2, %r12
	.word 0xa1930000  ! 271: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbf508000  ! 274: RDPR_TSTATE	<illegal instruction>
	.word 0xf4448000  ! 275: LDSW_R	ldsw	[%r18 + %r0], %r26
	.word 0xf6058000  ! 279: LDUW_R	lduw	[%r22 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb83d6130  ! 284: XNOR_I	xnor 	%r21, 0x0130, %r28
	.word 0xf8552012  ! 285: LDSH_I	ldsh	[%r20 + 0x0012], %r28
	.word 0xb150c000  ! 289: RDPR_TT	<illegal instruction>
	.word 0xf65da1d5  ! 291: LDX_I	ldx	[%r22 + 0x01d5], %r27
	.word 0xbe044000  ! 294: ADD_R	add 	%r17, %r0, %r31
	.word 0xbb504000  ! 295: RDPR_TNPC	<illegal instruction>
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 17)
	.word 0xbf51c000  ! 306: RDPR_TL	<illegal instruction>
	.word 0x8194e15c  ! 309: WRPR_TPC_I	wrpr	%r19, 0x015c, %tpc
	.word 0xbf520000  ! 311: RDPR_PIL	<illegal instruction>
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf614a1bd  ! 314: LDUH_I	lduh	[%r18 + 0x01bd], %r27
	.word 0xfd1d0000  ! 315: LDDF_R	ldd	[%r20, %r0], %f30
	mov	2, %r12
	.word 0xa1930000  ! 317: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa146078  ! 318: LDUH_I	lduh	[%r17 + 0x0078], %r29
	.word 0x91952044  ! 321: WRPR_PIL_I	wrpr	%r20, 0x0044, %pil
	.word 0xfc5c8000  ! 322: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xf8052008  ! 324: LDUW_I	lduw	[%r20 + 0x0008], %r28
	.word 0xf44c0000  ! 325: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xfa44c000  ! 327: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0x8795a009  ! 329: WRPR_TT_I	wrpr	%r22, 0x0009, %tt
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 3a)
	.word 0x8794a1a8  ! 337: WRPR_TT_I	wrpr	%r18, 0x01a8, %tt
	.word 0xb7500000  ! 347: RDPR_TPC	<illegal instruction>
	.word 0xf4154000  ! 350: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xbb520000  ! 351: RDPR_PIL	<illegal instruction>
	.word 0xba14e104  ! 352: OR_I	or 	%r19, 0x0104, %r29
	.word 0xb40520a4  ! 354: ADD_I	add 	%r20, 0x00a4, %r26
	.word 0xf04ce11b  ! 355: LDSB_I	ldsb	[%r19 + 0x011b], %r24
	.word 0x81946079  ! 357: WRPR_TPC_I	wrpr	%r17, 0x0079, %tpc
	.word 0xfe148000  ! 358: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xb3518000  ! 361: RDPR_PSTATE	<illegal instruction>
	.word 0xb4840000  ! 363: ADDcc_R	addcc 	%r16, %r0, %r26
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 2f)
	.word 0xb4bc0000  ! 369: XNORcc_R	xnorcc 	%r16, %r0, %r26
	.word 0xf2548000  ! 372: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xfc0de10d  ! 377: LDUB_I	ldub	[%r23 + 0x010d], %r30
	.word 0xf41c21c8  ! 378: LDD_I	ldd	[%r16 + 0x01c8], %r26
	.word 0xfa5d0000  ! 383: LDX_R	ldx	[%r20 + %r0], %r29
	.word 0x8395e083  ! 385: WRPR_TNPC_I	wrpr	%r23, 0x0083, %tnpc
	.word 0xfe1561c6  ! 387: LDUH_I	lduh	[%r21 + 0x01c6], %r31
	.word 0xf60d0000  ! 389: LDUB_R	ldub	[%r20 + %r0], %r27
	.word 0xfc04a1ef  ! 390: LDUW_I	lduw	[%r18 + 0x01ef], %r30
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 3d)
	.word 0xb034c000  ! 396: ORN_R	orn 	%r19, %r0, %r24
	.word 0xf45c6101  ! 397: LDX_I	ldx	[%r17 + 0x0101], %r26
	.word 0x9194e1b2  ! 401: WRPR_PIL_I	wrpr	%r19, 0x01b2, %pil
	.word 0xfe44618a  ! 404: LDSW_I	ldsw	[%r17 + 0x018a], %r31
	.word 0xf25cc000  ! 410: LDX_R	ldx	[%r19 + %r0], %r25
	.word 0xf444a074  ! 412: LDSW_I	ldsw	[%r18 + 0x0074], %r26
	.word 0xfe1de14c  ! 417: LDD_I	ldd	[%r23 + 0x014c], %r31
	mov	0, %r12
	.word 0xa1930000  ! 421: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9508000  ! 422: RDPR_TSTATE	<illegal instruction>
	.word 0xb01d60ae  ! 423: XOR_I	xor 	%r21, 0x00ae, %r24
	.word 0xfe0ce169  ! 426: LDUB_I	ldub	[%r19 + 0x0169], %r31
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 3)
	.word 0xfe54c000  ! 431: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xb1351000  ! 441: SRLX_R	srlx	%r20, %r0, %r24
	.word 0x8994a035  ! 445: WRPR_TICK_I	wrpr	%r18, 0x0035, %tick
	.word 0x81946089  ! 446: WRPR_TPC_I	wrpr	%r17, 0x0089, %tpc
	.word 0xb8b40000  ! 447: ORNcc_R	orncc 	%r16, %r0, %r28
	.word 0xfa15e146  ! 448: LDUH_I	lduh	[%r23 + 0x0146], %r29
	.word 0xfa1c21ce  ! 449: LDD_I	ldd	[%r16 + 0x01ce], %r29
	.word 0xbd3da001  ! 462: SRA_I	sra 	%r22, 0x0001, %r30
	.word 0x8594a0ac  ! 463: WRPR_TSTATE_I	wrpr	%r18, 0x00ac, %tstate
	.word 0x8795e1ee  ! 468: WRPR_TT_I	wrpr	%r23, 0x01ee, %tt
	.word 0xfb1c8000  ! 470: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xb624a103  ! 471: SUB_I	sub 	%r18, 0x0103, %r27
	.word 0xfc552017  ! 474: LDSH_I	ldsh	[%r20 + 0x0017], %r30
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 9)
	.word 0xbd51c000  ! 480: RDPR_TL	<illegal instruction>
	.word 0xb43d60f2  ! 483: XNOR_I	xnor 	%r21, 0x00f2, %r26
	.word 0xfc5c8000  ! 488: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xf84d4000  ! 490: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xb20d4000  ! 491: AND_R	and 	%r21, %r0, %r25
	.word 0xbf510000  ! 493: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 495: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1504000  ! 496: RDPR_TNPC	<illegal instruction>
	setx	data_start_4, %g1, %r19
	setx	data_start_4, %g1, %r21
	.word 0xbab5a0c9  ! 499: SUBCcc_I	orncc 	%r22, 0x00c9, %r29
	.word 0xfe1c60fc  ! 500: LDD_I	ldd	[%r17 + 0x00fc], %r31
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 7)
	.word 0xb13ce001  ! 506: SRA_I	sra 	%r19, 0x0001, %r24
	.word 0xf81c2115  ! 507: LDD_I	ldd	[%r16 + 0x0115], %r28
	setx	0x1883a6a800008cdd, %g1, %r10
	.word 0x839a8000  ! 508: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa544000  ! 509: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xf84d8000  ! 512: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xb0b44000  ! 513: SUBCcc_R	orncc 	%r17, %r0, %r24
	.word 0xfb1c0000  ! 515: LDDF_R	ldd	[%r16, %r0], %f29
	.word 0x8194e0fb  ! 523: WRPR_TPC_I	wrpr	%r19, 0x00fb, %tpc
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 30)
	setx	data_start_0, %g1, %r23
	.word 0xfc0c60f9  ! 528: LDUB_I	ldub	[%r17 + 0x00f9], %r30
	.word 0xfc55a144  ! 529: LDSH_I	ldsh	[%r22 + 0x0144], %r30
	.word 0xb285604b  ! 534: ADDcc_I	addcc 	%r21, 0x004b, %r25
	.word 0xfe140000  ! 538: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0x9194e057  ! 543: WRPR_PIL_I	wrpr	%r19, 0x0057, %pil
	.word 0xb3480000  ! 545: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf845c000  ! 546: LDSW_R	ldsw	[%r23 + %r0], %r28
	.word 0xb434a1eb  ! 548: ORN_I	orn 	%r18, 0x01eb, %r26
	.word 0xf84d4000  ! 549: LDSB_R	ldsb	[%r21 + %r0], %r28
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 10)
	.word 0xb6850000  ! 554: ADDcc_R	addcc 	%r20, %r0, %r27
	.word 0xf614209d  ! 556: LDUH_I	lduh	[%r16 + 0x009d], %r27
	.word 0xfc04a135  ! 560: LDUW_I	lduw	[%r18 + 0x0135], %r30
	.word 0xb72d7001  ! 564: SLLX_I	sllx	%r21, 0x0001, %r27
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 26)
	.word 0x8995e11b  ! 569: WRPR_TICK_I	wrpr	%r23, 0x011b, %tick
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 28)
	.word 0x8d95e02d  ! 573: WRPR_PSTATE_I	wrpr	%r23, 0x002d, %pstate
	setx	data_start_1, %g1, %r16
	.word 0xf01d20bc  ! 578: LDD_I	ldd	[%r20 + 0x00bc], %r24
	.word 0xb9480000  ! 582: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb951c000  ! 586: RDPR_TL	<illegal instruction>
	.word 0xbe3dc000  ! 587: XNOR_R	xnor 	%r23, %r0, %r31
	.word 0xf245a047  ! 588: LDSW_I	ldsw	[%r22 + 0x0047], %r25
	.word 0x8d94e035  ! 589: WRPR_PSTATE_I	wrpr	%r19, 0x0035, %pstate
	.word 0xf31de0c8  ! 590: LDDF_I	ldd	[%r23, 0x00c8], %f25
	.word 0xf85ca19c  ! 592: LDX_I	ldx	[%r18 + 0x019c], %r28
	.word 0xbf2c4000  ! 593: SLL_R	sll 	%r17, %r0, %r31
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 1c)
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, c)
	.word 0xb3508000  ! 605: RDPR_TSTATE	<illegal instruction>
	.word 0xb8246028  ! 606: SUB_I	sub 	%r17, 0x0028, %r28
	.word 0xf51c0000  ! 607: LDDF_R	ldd	[%r16, %r0], %f26
	.word 0xf71d4000  ! 608: LDDF_R	ldd	[%r21, %r0], %f27
	.word 0xbe2420e0  ! 610: SUB_I	sub 	%r16, 0x00e0, %r31
	.word 0xf85d2116  ! 611: LDX_I	ldx	[%r20 + 0x0116], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb751c000  ! 616: RDPR_TL	<illegal instruction>
	.word 0xf61c4000  ! 617: LDD_R	ldd	[%r17 + %r0], %r27
	.word 0xba8420ea  ! 619: ADDcc_I	addcc 	%r16, 0x00ea, %r29
	.word 0xb6c4607e  ! 623: ADDCcc_I	addccc 	%r17, 0x007e, %r27
	.word 0xbd518000  ! 630: RDPR_PSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r20
	.word 0xfa5d214b  ! 632: LDX_I	ldx	[%r20 + 0x014b], %r29
	.word 0xb6144000  ! 633: OR_R	or 	%r17, %r0, %r27
	.word 0xfc0d8000  ! 638: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xb3508000  ! 639: RDPR_TSTATE	<illegal instruction>
	.word 0xbc454000  ! 641: ADDC_R	addc 	%r21, %r0, %r30
	.word 0xfa552108  ! 642: LDSH_I	ldsh	[%r20 + 0x0108], %r29
	.word 0xbf480000  ! 643: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf31ce07e  ! 645: LDDF_I	ldd	[%r19, 0x007e], %f25
	.word 0xfe5cc000  ! 648: LDX_R	ldx	[%r19 + %r0], %r31
	.word 0x81942046  ! 649: WRPR_TPC_I	wrpr	%r16, 0x0046, %tpc
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 3a)
	.word 0x859521c3  ! 653: WRPR_TSTATE_I	wrpr	%r20, 0x01c3, %tstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf64c4000  ! 655: LDSB_R	ldsb	[%r17 + %r0], %r27
	setx	0x39df1ca10000da0f, %g1, %r10
	.word 0x819a8000  ! 656: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf80c616d  ! 657: LDUB_I	ldub	[%r17 + 0x016d], %r28
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 17)
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf21de107  ! 665: LDD_I	ldd	[%r23 + 0x0107], %r25
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 28)
	.word 0xb5504000  ! 669: RDPR_TNPC	<illegal instruction>
	.word 0xfe0c61d0  ! 672: LDUB_I	ldub	[%r17 + 0x01d0], %r31
	.word 0xb335e001  ! 674: SRL_I	srl 	%r23, 0x0001, %r25
	.word 0xfa4d4000  ! 675: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf415a181  ! 677: LDUH_I	lduh	[%r22 + 0x0181], %r26
	.word 0xb1504000  ! 679: RDPR_TNPC	<illegal instruction>
	.word 0xb5510000  ! 681: RDPR_TICK	<illegal instruction>
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 15)
	.word 0x91942194  ! 684: WRPR_PIL_I	wrpr	%r16, 0x0194, %pil
	.word 0xf61d4000  ! 691: LDD_R	ldd	[%r21 + %r0], %r27
	setx	data_start_2, %g1, %r18
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 1a)
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, e)
	.word 0xf8140000  ! 699: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xb151c000  ! 701: RDPR_TL	<illegal instruction>
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf31c8000  ! 703: LDDF_R	ldd	[%r18, %r0], %f25
	.word 0xf21d8000  ! 704: LDD_R	ldd	[%r22 + %r0], %r25
	.word 0xb3518000  ! 707: RDPR_PSTATE	<illegal instruction>
	.word 0xfd1ce176  ! 709: LDDF_I	ldd	[%r19, 0x0176], %f30
	.word 0xbebcc000  ! 710: XNORcc_R	xnorcc 	%r19, %r0, %r31
	mov	0, %r12
	.word 0xa1930000  ! 713: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfc158000  ! 716: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xf845a176  ! 717: LDSW_I	ldsw	[%r22 + 0x0176], %r28
	.word 0xb92d5000  ! 720: SLLX_R	sllx	%r21, %r0, %r28
	.word 0xf045e187  ! 723: LDSW_I	ldsw	[%r23 + 0x0187], %r24
	.word 0xf215e194  ! 725: LDUH_I	lduh	[%r23 + 0x0194], %r25
	.word 0xf64dc000  ! 726: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xfc1c611d  ! 727: LDD_I	ldd	[%r17 + 0x011d], %r30
	.word 0xf60da134  ! 728: LDUB_I	ldub	[%r22 + 0x0134], %r27
	.word 0x879421d8  ! 731: WRPR_TT_I	wrpr	%r16, 0x01d8, %tt
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 28)
	.word 0xbc152094  ! 736: OR_I	or 	%r20, 0x0094, %r30
	.word 0xfa140000  ! 737: LDUH_R	lduh	[%r16 + %r0], %r29
	.word 0xfc5de1cf  ! 739: LDX_I	ldx	[%r23 + 0x01cf], %r30
	.word 0xf854a045  ! 741: LDSH_I	ldsh	[%r18 + 0x0045], %r28
	.word 0x8d95e152  ! 744: WRPR_PSTATE_I	wrpr	%r23, 0x0152, %pstate
	.word 0xf20d21c5  ! 746: LDUB_I	ldub	[%r20 + 0x01c5], %r25
	.word 0x8d94603e  ! 752: WRPR_PSTATE_I	wrpr	%r17, 0x003e, %pstate
	.word 0xfc5561e5  ! 754: LDSH_I	ldsh	[%r21 + 0x01e5], %r30
	.word 0xbb3d4000  ! 755: SRA_R	sra 	%r21, %r0, %r29
	.word 0xf60c8000  ! 756: LDUB_R	ldub	[%r18 + %r0], %r27
	.word 0xf244e1c6  ! 757: LDSW_I	ldsw	[%r19 + 0x01c6], %r25
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 14)
	.word 0xf71d2136  ! 764: LDDF_I	ldd	[%r20, 0x0136], %f27
	.word 0xbb540000  ! 765: RDPR_GL	<illegal instruction>
	.word 0x81942045  ! 767: WRPR_TPC_I	wrpr	%r16, 0x0045, %tpc
	.word 0xfc4c4000  ! 768: LDSB_R	ldsb	[%r17 + %r0], %r30
	setx	data_start_4, %g1, %r18
	.word 0xfa5dc000  ! 774: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xfe452160  ! 776: LDSW_I	ldsw	[%r20 + 0x0160], %r31
	setx	data_start_7, %g1, %r22
	.word 0xfa0d4000  ! 784: LDUB_R	ldub	[%r21 + %r0], %r29
	.word 0xf45520d9  ! 788: LDSH_I	ldsh	[%r20 + 0x00d9], %r26
	mov	0, %r12
	.word 0xa1930000  ! 790: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf65d60da  ! 792: LDX_I	ldx	[%r21 + 0x00da], %r27
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 2)
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf254c000  ! 796: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xf255c000  ! 797: LDSH_R	ldsh	[%r23 + %r0], %r25
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 32)
	setx	0xd6f20d2400007c0a, %g1, %r10
	.word 0x819a8000  ! 801: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf60c2144  ! 802: LDUB_I	ldub	[%r16 + 0x0144], %r27
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 14)
	.word 0xf04dc000  ! 812: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xfc546177  ! 813: LDSH_I	ldsh	[%r17 + 0x0177], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 13)
	.word 0xfc0dc000  ! 821: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xb68d20d5  ! 825: ANDcc_I	andcc 	%r20, 0x00d5, %r27
	setx	0x5aab3e7400004959, %g1, %r10
	.word 0x839a8000  ! 827: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb61ce041  ! 830: XOR_I	xor 	%r19, 0x0041, %r27
	.word 0xbe158000  ! 831: OR_R	or 	%r22, %r0, %r31
	.word 0xfc1d0000  ! 835: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xf01ce069  ! 839: LDD_I	ldd	[%r19 + 0x0069], %r24
	.word 0xf25ca1e9  ! 841: LDX_I	ldx	[%r18 + 0x01e9], %r25
	.word 0xf05dc000  ! 842: LDX_R	ldx	[%r23 + %r0], %r24
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 18)
	.word 0x8d94a0b9  ! 846: WRPR_PSTATE_I	wrpr	%r18, 0x00b9, %pstate
	.word 0x859521d1  ! 848: WRPR_TSTATE_I	wrpr	%r20, 0x01d1, %tstate
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 2a)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf85d61f9  ! 851: LDX_I	ldx	[%r21 + 0x01f9], %r28
	.word 0xf81d0000  ! 852: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0x8594e042  ! 853: WRPR_TSTATE_I	wrpr	%r19, 0x0042, %tstate
	.word 0xf855e1bc  ! 854: LDSH_I	ldsh	[%r23 + 0x01bc], %r28
	.word 0xfe1d0000  ! 855: LDD_R	ldd	[%r20 + %r0], %r31
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 27)
	.word 0xfe05a174  ! 857: LDUW_I	lduw	[%r22 + 0x0174], %r31
	.word 0xf0158000  ! 859: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xfd1d60b1  ! 861: LDDF_I	ldd	[%r21, 0x00b1], %f30
	.word 0xf64d6039  ! 862: LDSB_I	ldsb	[%r21 + 0x0039], %r27
	.word 0xbd7c8400  ! 863: MOVR_R	movre	%r18, %r0, %r30
	.word 0xb5510000  ! 865: RDPR_TICK	<illegal instruction>
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 17)
	.word 0xf6554000  ! 872: LDSH_R	ldsh	[%r21 + %r0], %r27
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, d)
	.word 0xb750c000  ! 880: RDPR_TT	<illegal instruction>
	.word 0xfa45e003  ! 885: LDSW_I	ldsw	[%r23 + 0x0003], %r29
	.word 0xf81de1b3  ! 887: LDD_I	ldd	[%r23 + 0x01b3], %r28
	.word 0xf81da02b  ! 888: LDD_I	ldd	[%r22 + 0x002b], %r28
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 12)
	.word 0xba24a1f7  ! 891: SUB_I	sub 	%r18, 0x01f7, %r29
	setx	0x3f2602f20000afd3, %g1, %r10
	.word 0x819a8000  ! 892: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf0552086  ! 895: LDSH_I	ldsh	[%r20 + 0x0086], %r24
	.word 0xf044e167  ! 897: LDSW_I	ldsw	[%r19 + 0x0167], %r24
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 19)
	.word 0xfa456085  ! 901: LDSW_I	ldsw	[%r21 + 0x0085], %r29
	.word 0xf645614a  ! 903: LDSW_I	ldsw	[%r21 + 0x014a], %r27
	.word 0x8395a165  ! 906: WRPR_TNPC_I	wrpr	%r22, 0x0165, %tnpc
	.word 0xf0450000  ! 916: LDSW_R	ldsw	[%r20 + %r0], %r24
	setx	data_start_7, %g1, %r23
	.word 0xf8148000  ! 924: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xfc4ca14a  ! 925: LDSB_I	ldsb	[%r18 + 0x014a], %r30
	.word 0xfa1d0000  ! 926: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xb7518000  ! 927: RDPR_PSTATE	<illegal instruction>
	.word 0xbb480000  ! 932: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb09c211c  ! 941: XORcc_I	xorcc 	%r16, 0x011c, %r24
	.word 0x8795200f  ! 946: WRPR_TT_I	wrpr	%r20, 0x000f, %tt
	.word 0xf00da152  ! 947: LDUB_I	ldub	[%r22 + 0x0152], %r24
	.word 0xf6150000  ! 954: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xf6146154  ! 955: LDUH_I	lduh	[%r17 + 0x0154], %r27
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 2b)
	setx	data_start_4, %g1, %r19
	.word 0xbf518000  ! 958: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xb3500000  ! 962: RDPR_TPC	<illegal instruction>
	.word 0xf81de08b  ! 965: LDD_I	ldd	[%r23 + 0x008b], %r28
	.word 0xf0054000  ! 968: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xf614e172  ! 969: LDUH_I	lduh	[%r19 + 0x0172], %r27
	.word 0xbf508000  ! 970: RDPR_TSTATE	<illegal instruction>
hwintr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_45), 16, 16)) -> intp(2, 0, 29)
	.word 0xb551c000  ! 976: RDPR_TL	<illegal instruction>
	.word 0xb3510000  ! 977: RDPR_TICK	<illegal instruction>
	.word 0xfe4d4000  ! 978: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xfa0de0d7  ! 982: LDUB_I	ldub	[%r23 + 0x00d7], %r29
	.word 0x8d94e069  ! 985: WRPR_PSTATE_I	wrpr	%r19, 0x0069, %pstate
	.word 0xf05d4000  ! 987: LDX_R	ldx	[%r21 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	0x9ff0c08200004f4e, %g1, %r10
	.word 0x819a8000  ! 995: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbda00520  ! 1: FSQRTs	fsqrt	
	.word 0xb3a84820  ! 3: FMOVE	fmovs	%fcc1, %f0, %f25
	mov	0, %r12
	.word 0x8f930000  ! 9: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x899521b4  ! 12: WRPR_TICK_I	wrpr	%r20, 0x01b4, %tick
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 17)
	.word 0xb1aa8820  ! 18: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb1504000  ! 22: RDPR_TNPC	<illegal instruction>
	.word 0xb1a40960  ! 24: FMULq	dis not found

	.word 0xb6b54000  ! 27: ORNcc_R	orncc 	%r21, %r0, %r27
	.word 0xb1a00540  ! 32: FSQRTd	fsqrt	
	.word 0xb1a449e0  ! 34: FDIVq	dis not found

	.word 0xbfa549c0  ! 37: FDIVd	fdivd	%f52, %f0, %f62
	.word 0xb5ab8820  ! 39: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a81420  ! 41: FMOVRNZ	dis not found

	.word 0xb1a00540  ! 43: FSQRTd	fsqrt	
	.word 0xb77d8400  ! 47: MOVR_R	movre	%r22, %r0, %r27
	.word 0xbcb5612c  ! 49: SUBCcc_I	orncc 	%r21, 0x012c, %r30
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 25)
	.word 0xbda88820  ! 52: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a84820  ! 53: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb7520000  ! 58: RDPR_PIL	<illegal instruction>
	.word 0x8d9561c2  ! 62: WRPR_PSTATE_I	wrpr	%r21, 0x01c2, %pstate
	.word 0x8794a1da  ! 63: WRPR_TT_I	wrpr	%r18, 0x01da, %tt
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbaa0820  ! 68: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb7a40820  ! 73: FADDs	fadds	%f16, %f0, %f27
	.word 0xb7aa4820  ! 78: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0x91942099  ! 81: WRPR_PIL_I	wrpr	%r16, 0x0099, %pil
	.word 0xb1a00540  ! 82: FSQRTd	fsqrt	
	.word 0xbba4c820  ! 86: FADDs	fadds	%f19, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb09c4000  ! 88: XORcc_R	xorcc 	%r17, %r0, %r24
	.word 0xbda488a0  ! 90: FSUBs	fsubs	%f18, %f0, %f30
	.word 0xbda58920  ! 91: FMULs	fmuls	%f22, %f0, %f30
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 25)
	.word 0xb9500000  ! 94: RDPR_TPC	<illegal instruction>
	.word 0xbba80820  ! 97: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb3aa0820  ! 98: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb93c0000  ! 99: SRA_R	sra 	%r16, %r0, %r28
	.word 0xbd50c000  ! 101: RDPR_TT	<illegal instruction>
	.word 0xbd520000  ! 107: RDPR_PIL	<illegal instruction>
	.word 0xb1a588a0  ! 110: FSUBs	fsubs	%f22, %f0, %f24
	.word 0xb6ad0000  ! 113: ANDNcc_R	andncc 	%r20, %r0, %r27
	.word 0xb1a4c9a0  ! 117: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xb151c000  ! 119: RDPR_TL	<illegal instruction>
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 34)
	.word 0xb3a48840  ! 128: FADDd	faddd	%f18, %f0, %f56
	.word 0xb9a489e0  ! 129: FDIVq	dis not found

	.word 0xb3504000  ! 130: RDPR_TNPC	<illegal instruction>
	.word 0xb7a408a0  ! 131: FSUBs	fsubs	%f16, %f0, %f27
	.word 0xbba90820  ! 133: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb01ce032  ! 134: XOR_I	xor 	%r19, 0x0032, %r24
	.word 0xbda00560  ! 136: FSQRTq	fsqrt	
	.word 0xb3a408c0  ! 137: FSUBd	fsubd	%f16, %f0, %f56
	.word 0xbba44820  ! 145: FADDs	fadds	%f17, %f0, %f29
	.word 0xb1a9c820  ! 147: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a488e0  ! 148: FSUBq	dis not found

	.word 0xbfa4c8e0  ! 149: FSUBq	dis not found

	.word 0xb3a48840  ! 150: FADDd	faddd	%f18, %f0, %f56
	.word 0xbfaa8820  ! 152: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbbaa0820  ! 154: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb32db001  ! 156: SLLX_I	sllx	%r22, 0x0001, %r25
	.word 0xbb518000  ! 159: RDPR_PSTATE	<illegal instruction>
	.word 0xb151c000  ! 162: RDPR_TL	<illegal instruction>
	.word 0xb1500000  ! 171: RDPR_TPC	<illegal instruction>
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 25)
	.word 0xbf540000  ! 173: RDPR_GL	<illegal instruction>
	.word 0xb5520000  ! 179: RDPR_PIL	<illegal instruction>
	.word 0xb3ab4820  ! 183: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb9a4c960  ! 186: FMULq	dis not found

	.word 0xbbab8820  ! 188: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a48840  ! 190: FADDd	faddd	%f18, %f0, %f24
	.word 0xb5a449e0  ! 192: FDIVq	dis not found

	.word 0xb3508000  ! 197: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a90820  ! 199: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb9aa4820  ! 201: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a98820  ! 207: FMOVNEG	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9194e0d5  ! 211: WRPR_PIL_I	wrpr	%r19, 0x00d5, %pil
	.word 0xb1a80820  ! 213: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbfa80420  ! 215: FMOVRZ	dis not found

	setx	data_start_6, %g1, %r16
	.word 0x8995a16b  ! 217: WRPR_TICK_I	wrpr	%r22, 0x016b, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7500000  ! 222: RDPR_TPC	<illegal instruction>
	.word 0xb1a90820  ! 223: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb7a81820  ! 227: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb5a81420  ! 233: FMOVRNZ	dis not found

	.word 0xbbaac820  ! 238: FMOVGE	fmovs	%fcc1, %f0, %f29
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb1aac820  ! 241: FMOVGE	fmovs	%fcc1, %f0, %f24
	setx	data_start_1, %g1, %r22
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 30)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1ab4820  ! 246: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbf3dc000  ! 249: SRA_R	sra 	%r23, %r0, %r31
	.word 0xb13da001  ! 250: SRA_I	sra 	%r22, 0x0001, %r24
	.word 0xb1a81c20  ! 251: FMOVRGEZ	dis not found

	.word 0xb3518000  ! 252: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a548a0  ! 255: FSUBs	fsubs	%f21, %f0, %f27
	.word 0xbfa5c920  ! 256: FMULs	fmuls	%f23, %f0, %f31
	.word 0xb1a409e0  ! 258: FDIVq	dis not found

	.word 0xb9a80820  ! 260: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbda81c20  ! 261: FMOVRGEZ	dis not found

	.word 0xb3a548a0  ! 264: FSUBs	fsubs	%f21, %f0, %f25
	mov	2, %r12
	.word 0xa1930000  ! 271: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9508000  ! 274: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a81420  ! 280: FMOVRNZ	dis not found

	.word 0xb5a448c0  ! 282: FSUBd	fsubd	%f48, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc3ce069  ! 284: XNOR_I	xnor 	%r19, 0x0069, %r30
	.word 0xb9a90820  ! 287: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbba00520  ! 288: FSQRTs	fsqrt	
	.word 0xb750c000  ! 289: RDPR_TT	<illegal instruction>
	.word 0xb3ab4820  ! 292: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xba050000  ! 294: ADD_R	add 	%r20, %r0, %r29
	.word 0xbb504000  ! 295: RDPR_TNPC	<illegal instruction>
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9a58940  ! 301: FMULd	fmuld	%f22, %f0, %f28
	.word 0xb9a488c0  ! 302: FSUBd	fsubd	%f18, %f0, %f28
	.word 0xb551c000  ! 306: RDPR_TL	<illegal instruction>
	.word 0xb3a548e0  ! 307: FSUBq	dis not found

	.word 0xbda50940  ! 308: FMULd	fmuld	%f20, %f0, %f30
	.word 0x8194611d  ! 309: WRPR_TPC_I	wrpr	%r17, 0x011d, %tpc
	.word 0xb5a98820  ! 310: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb5520000  ! 311: RDPR_PIL	<illegal instruction>
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 32)
	.word 0xbfa94820  ! 316: FMOVCS	fmovs	%fcc1, %f0, %f31
	mov	1, %r12
	.word 0xa1930000  ! 317: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x9195e057  ! 321: WRPR_PIL_I	wrpr	%r23, 0x0057, %pil
	.word 0x8794e010  ! 329: WRPR_TT_I	wrpr	%r19, 0x0010, %tt
	.word 0xb9a80820  ! 331: FMOVN	fmovs	%fcc1, %f0, %f28
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 3a)
	.word 0x8795e027  ! 337: WRPR_TT_I	wrpr	%r23, 0x0027, %tt
	.word 0xb7a4c9c0  ! 338: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xb1aa4820  ! 339: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a54820  ! 344: FADDs	fadds	%f21, %f0, %f24
	.word 0xbf500000  ! 347: RDPR_TPC	<illegal instruction>
	.word 0xb1a00020  ! 349: FMOVs	fmovs	%f0, %f24
	.word 0xbb520000  ! 351: RDPR_PIL	<illegal instruction>
	.word 0xbc15207f  ! 352: OR_I	or 	%r20, 0x007f, %r30
	.word 0xb7a488a0  ! 353: FSUBs	fsubs	%f18, %f0, %f27
	.word 0xb405a1a4  ! 354: ADD_I	add 	%r22, 0x01a4, %r26
	.word 0xb7a80820  ! 356: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0x81946174  ! 357: WRPR_TPC_I	wrpr	%r17, 0x0174, %tpc
	.word 0xb5518000  ! 361: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a84820  ! 362: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb084c000  ! 363: ADDcc_R	addcc 	%r19, %r0, %r24
	.word 0xbda58940  ! 366: FMULd	fmuld	%f22, %f0, %f30
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 3)
	.word 0xb6bd4000  ! 369: XNORcc_R	xnorcc 	%r21, %r0, %r27
	.word 0xb3a9c820  ! 374: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a489a0  ! 376: FDIVs	fdivs	%f18, %f0, %f24
	.word 0xb1a9c820  ! 380: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a84820  ! 382: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb1ab0820  ! 384: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0x83942041  ! 385: WRPR_TNPC_I	wrpr	%r16, 0x0041, %tnpc
	.word 0xbfa58860  ! 386: FADDq	dis not found

hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 25)
	.word 0xb9a40960  ! 395: FMULq	dis not found

	.word 0xbc350000  ! 396: ORN_R	orn 	%r20, %r0, %r30
	.word 0xb1a549c0  ! 398: FDIVd	fdivd	%f52, %f0, %f24
	.word 0x919520da  ! 401: WRPR_PIL_I	wrpr	%r20, 0x00da, %pil
	.word 0xbda509e0  ! 402: FDIVq	dis not found

	.word 0xb5a81c20  ! 407: FMOVRGEZ	dis not found

	.word 0xbba54960  ! 413: FMULq	dis not found

	.word 0xbba80420  ! 415: FMOVRZ	dis not found

	mov	0, %r12
	.word 0xa1930000  ! 421: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9508000  ! 422: RDPR_TSTATE	<illegal instruction>
	.word 0xbc1c61f5  ! 423: XOR_I	xor 	%r17, 0x01f5, %r30
	.word 0xbfa488c0  ! 425: FSUBd	fsubd	%f18, %f0, %f62
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb7a448a0  ! 433: FSUBs	fsubs	%f17, %f0, %f27
	.word 0xbfa00040  ! 435: FMOVd	fmovd	%f0, %f62
	.word 0xb1a8c820  ! 437: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb5a00540  ! 438: FSQRTd	fsqrt	
	.word 0xbfa80820  ! 439: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb7349000  ! 441: SRLX_R	srlx	%r18, %r0, %r27
	.word 0xb3a50840  ! 443: FADDd	faddd	%f20, %f0, %f56
	.word 0x8995a0f0  ! 445: WRPR_TICK_I	wrpr	%r22, 0x00f0, %tick
	.word 0x81956144  ! 446: WRPR_TPC_I	wrpr	%r21, 0x0144, %tpc
	.word 0xb4b4c000  ! 447: ORNcc_R	orncc 	%r19, %r0, %r26
	.word 0xb1a5c860  ! 454: FADDq	dis not found

	.word 0xb7a408c0  ! 455: FSUBd	fsubd	%f16, %f0, %f58
	.word 0xb7a5c840  ! 456: FADDd	faddd	%f54, %f0, %f58
	.word 0xbfa80820  ! 458: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbba88820  ! 460: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb73ce001  ! 462: SRA_I	sra 	%r19, 0x0001, %r27
	.word 0x8594e1d6  ! 463: WRPR_TSTATE_I	wrpr	%r19, 0x01d6, %tstate
	.word 0xb7a58920  ! 466: FMULs	fmuls	%f22, %f0, %f27
	.word 0x8794a0ad  ! 468: WRPR_TT_I	wrpr	%r18, 0x00ad, %tt
	.word 0xb5a509a0  ! 469: FDIVs	fdivs	%f20, %f0, %f26
	.word 0xb225a02a  ! 471: SUB_I	sub 	%r22, 0x002a, %r25
	.word 0xb3aa8820  ! 477: FMOVG	fmovs	%fcc1, %f0, %f25
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 37)
	.word 0xb151c000  ! 480: RDPR_TL	<illegal instruction>
	.word 0xb7a81420  ! 482: FMOVRNZ	dis not found

	.word 0xb83d603a  ! 483: XNOR_I	xnor 	%r21, 0x003a, %r28
	.word 0xb5a408a0  ! 486: FSUBs	fsubs	%f16, %f0, %f26
	.word 0xb1a81420  ! 487: FMOVRNZ	dis not found

	.word 0xb5a54860  ! 489: FADDq	dis not found

	.word 0xb80c0000  ! 491: AND_R	and 	%r16, %r0, %r28
	.word 0xb3510000  ! 493: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 495: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbb504000  ! 496: RDPR_TNPC	<illegal instruction>
	setx	data_start_3, %g1, %r17
	setx	data_start_3, %g1, %r20
	.word 0xb2b56055  ! 499: SUBCcc_I	orncc 	%r21, 0x0055, %r25
	.word 0xb5abc820  ! 503: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb9a81c20  ! 504: FMOVRGEZ	dis not found

hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 30)
	.word 0xb53d6001  ! 506: SRA_I	sra 	%r21, 0x0001, %r26
	setx	0x57738edc0000394e, %g1, %r10
	.word 0x839a8000  ! 508: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a81420  ! 511: FMOVRNZ	dis not found

	.word 0xb2b5c000  ! 513: SUBCcc_R	orncc 	%r23, %r0, %r25
	.word 0xbfa9c820  ! 520: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0x819461fc  ! 523: WRPR_TPC_I	wrpr	%r17, 0x01fc, %tpc
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 22)
	setx	data_start_7, %g1, %r19
	.word 0xbba5c9a0  ! 531: FDIVs	fdivs	%f23, %f0, %f29
	.word 0xb085e1b1  ! 534: ADDcc_I	addcc 	%r23, 0x01b1, %r24
	.word 0xbba80820  ! 535: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbda548e0  ! 539: FSUBq	dis not found

	.word 0xb5a9c820  ! 540: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0x9195e18c  ! 543: WRPR_PIL_I	wrpr	%r23, 0x018c, %pil
	.word 0xbfa44820  ! 544: FADDs	fadds	%f17, %f0, %f31
	.word 0xb3480000  ! 545: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb634e03c  ! 548: ORN_I	orn 	%r19, 0x003c, %r27
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, f)
	.word 0xba844000  ! 554: ADDcc_R	addcc 	%r17, %r0, %r29
	.word 0xbda409e0  ! 557: FDIVq	dis not found

	.word 0xb9abc820  ! 558: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbba58860  ! 561: FADDq	dis not found

	.word 0xbf2d3001  ! 564: SLLX_I	sllx	%r20, 0x0001, %r31
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb9ab8820  ! 566: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb7a58960  ! 568: FMULq	dis not found

	.word 0x899421a4  ! 569: WRPR_TICK_I	wrpr	%r16, 0x01a4, %tick
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 2e)
	.word 0x8d95219f  ! 573: WRPR_PSTATE_I	wrpr	%r20, 0x019f, %pstate
	.word 0xbba80820  ! 575: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	setx	data_start_1, %g1, %r19
	.word 0xb3480000  ! 582: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb9aa0820  ! 583: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbfa81c20  ! 585: FMOVRGEZ	dis not found

	.word 0xb151c000  ! 586: RDPR_TL	<illegal instruction>
	.word 0xb23c4000  ! 587: XNOR_R	xnor 	%r17, %r0, %r25
	.word 0x8d94a05a  ! 589: WRPR_PSTATE_I	wrpr	%r18, 0x005a, %pstate
	.word 0xb12d4000  ! 593: SLL_R	sll 	%r21, %r0, %r24
	.word 0xb1a00560  ! 594: FSQRTq	fsqrt	
	.word 0xb1a588c0  ! 597: FSUBd	fsubd	%f22, %f0, %f24
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbbabc820  ! 601: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbba549c0  ! 602: FDIVd	fdivd	%f52, %f0, %f60
	.word 0xb9a5c960  ! 603: FMULq	dis not found

hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 18)
	.word 0xb5508000  ! 605: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xbc256177  ! 606: SUB_I	sub 	%r21, 0x0177, %r30
	.word 0xb624a0b3  ! 610: SUB_I	sub 	%r18, 0x00b3, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb351c000  ! 616: RDPR_TL	<illegal instruction>
	.word 0xba84a18b  ! 619: ADDcc_I	addcc 	%r18, 0x018b, %r29
	.word 0xb9a90820  ! 621: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbac420b0  ! 623: ADDCcc_I	addccc 	%r16, 0x00b0, %r29
	.word 0xb3a00540  ! 626: FSQRTd	fsqrt	
	.word 0xb7a48860  ! 627: FADDq	dis not found

	.word 0xbd518000  ! 630: RDPR_PSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r16
	.word 0xb2148000  ! 633: OR_R	or 	%r18, %r0, %r25
	.word 0xb5a81820  ! 636: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb9508000  ! 639: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a40920  ! 640: FMULs	fmuls	%f16, %f0, %f24
	.word 0xb0450000  ! 641: ADDC_R	addc 	%r20, %r0, %r24
	.word 0xb3480000  ! 643: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8195a021  ! 649: WRPR_TPC_I	wrpr	%r22, 0x0021, %tpc
	.word 0xb1a48860  ! 650: FADDq	dis not found

	.word 0xb5a94820  ! 651: FMOVCS	fmovs	%fcc1, %f0, %f26
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 18)
	.word 0x85952102  ! 653: WRPR_TSTATE_I	wrpr	%r20, 0x0102, %tstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x901090bb00006c12, %g1, %r10
	.word 0x819a8000  ! 656: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 32)
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 0)
	.word 0xb5a00540  ! 662: FSQRTd	fsqrt	
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 29)
	.word 0xbfa44860  ! 668: FADDq	dis not found

	.word 0xb3504000  ! 669: RDPR_TNPC	<illegal instruction>
	.word 0xb935a001  ! 674: SRL_I	srl 	%r22, 0x0001, %r28
	.word 0xb7504000  ! 679: RDPR_TNPC	<illegal instruction>
	.word 0xbfa81c20  ! 680: FMOVRGEZ	dis not found

	.word 0xbd510000  ! 681: RDPR_TICK	<illegal instruction>
	.word 0xb9a81820  ! 682: FMOVRGZ	fmovs	%fcc3, %f0, %f28
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 24)
	.word 0x9195605f  ! 684: WRPR_PIL_I	wrpr	%r21, 0x005f, %pil
	.word 0xb3a489e0  ! 688: FDIVq	dis not found

	.word 0xbba548a0  ! 689: FSUBs	fsubs	%f21, %f0, %f29
	.word 0xbba40920  ! 692: FMULs	fmuls	%f16, %f0, %f29
	setx	data_start_5, %g1, %r21
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 1a)
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 23)
	.word 0xb951c000  ! 701: RDPR_TL	<illegal instruction>
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb7518000  ! 707: RDPR_PSTATE	<illegal instruction>
	.word 0xb4bd4000  ! 710: XNORcc_R	xnorcc 	%r21, %r0, %r26
	.word 0xb9aa4820  ! 711: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbda00540  ! 712: FSQRTd	fsqrt	
	mov	1, %r12
	.word 0xa1930000  ! 713: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 27)
	.word 0xb5a88820  ! 718: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb3abc820  ! 719: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xbf2d1000  ! 720: SLLX_R	sllx	%r20, %r0, %r31
	.word 0xb9a81c20  ! 722: FMOVRGEZ	dis not found

	.word 0x879561ee  ! 731: WRPR_TT_I	wrpr	%r21, 0x01ee, %tt
	.word 0xbfa48960  ! 732: FMULq	dis not found

	.word 0xb1aa4820  ! 734: FMOVNE	fmovs	%fcc1, %f0, %f24
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, f)
	.word 0xbc15e18b  ! 736: OR_I	or 	%r23, 0x018b, %r30
	.word 0xb5a50920  ! 738: FMULs	fmuls	%f20, %f0, %f26
	.word 0x8d9521ab  ! 744: WRPR_PSTATE_I	wrpr	%r20, 0x01ab, %pstate
	.word 0xbda00040  ! 750: FMOVd	fmovd	%f0, %f30
	.word 0xbba80420  ! 751: FMOVRZ	dis not found

	.word 0x8d95a00b  ! 752: WRPR_PSTATE_I	wrpr	%r22, 0x000b, %pstate
	.word 0xb13cc000  ! 755: SRA_R	sra 	%r19, %r0, %r24
	.word 0xb7a94820  ! 758: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a88820  ! 760: FMOVLE	fmovs	%fcc1, %f0, %f26
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 28)
	.word 0xbf540000  ! 765: RDPR_GL	<illegal instruction>
	.word 0xbba489a0  ! 766: FDIVs	fdivs	%f18, %f0, %f29
	.word 0x8195e11a  ! 767: WRPR_TPC_I	wrpr	%r23, 0x011a, %tpc
	setx	data_start_6, %g1, %r17
	.word 0xbda5c820  ! 775: FADDs	fadds	%f23, %f0, %f30
	.word 0xb3a40860  ! 778: FADDq	dis not found

	.word 0xb5a00040  ! 779: FMOVd	fmovd	%f0, %f26
	setx	data_start_3, %g1, %r22
	.word 0xb9aa4820  ! 782: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a98820  ! 785: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbba44940  ! 786: FMULd	fmuld	%f48, %f0, %f60
	mov	1, %r12
	.word 0xa1930000  ! 790: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 28)
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 13)
	.word 0xb3a508a0  ! 798: FSUBs	fsubs	%f20, %f0, %f25
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 3a)
	setx	0x7e16484d00007ed3, %g1, %r10
	.word 0x819a8000  ! 801: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 17)
	.word 0xb7a00520  ! 808: FSQRTs	fsqrt	
	.word 0xb9a9c820  ! 809: FMOVVS	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 1)
	.word 0xba8c603f  ! 825: ANDcc_I	andcc 	%r17, 0x003f, %r29
	setx	0x556f4af50000eacc, %g1, %r10
	.word 0x839a8000  ! 827: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb61c60cc  ! 830: XOR_I	xor 	%r17, 0x00cc, %r27
	.word 0xba150000  ! 831: OR_R	or 	%r20, %r0, %r29
	.word 0xbba58920  ! 832: FMULs	fmuls	%f22, %f0, %f29
	.word 0xbfa80820  ! 834: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb1a5c8e0  ! 836: FSUBq	dis not found

hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 15)
	.word 0x8d946050  ! 846: WRPR_PSTATE_I	wrpr	%r17, 0x0050, %pstate
	.word 0x85956109  ! 848: WRPR_TSTATE_I	wrpr	%r21, 0x0109, %tstate
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 14)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8594a001  ! 853: WRPR_TSTATE_I	wrpr	%r18, 0x0001, %tstate
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 10)
	.word 0xbdabc820  ! 860: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb97d4400  ! 863: MOVR_R	movre	%r21, %r0, %r28
	.word 0xbf510000  ! 865: RDPR_TICK	<illegal instruction>
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbba81820  ! 874: FMOVRGZ	fmovs	%fcc3, %f0, %f29
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 15)
	.word 0xb7a508c0  ! 877: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xb750c000  ! 880: RDPR_TT	<illegal instruction>
	.word 0xb1a4c9a0  ! 881: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xbfab0820  ! 884: FMOVGU	fmovs	%fcc1, %f0, %f31
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 13)
	.word 0xb025e095  ! 891: SUB_I	sub 	%r23, 0x0095, %r24
	setx	0x5fa6c36c0000bd8b, %g1, %r10
	.word 0x819a8000  ! 892: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbda90820  ! 896: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbba549e0  ! 898: FDIVq	dis not found

hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb5a81820  ! 904: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0x839421ce  ! 906: WRPR_TNPC_I	wrpr	%r16, 0x01ce, %tnpc
	.word 0xb1a489c0  ! 907: FDIVd	fdivd	%f18, %f0, %f24
	.word 0xbda509a0  ! 909: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xb3ab4820  ! 910: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbdab8820  ! 913: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a489e0  ! 915: FDIVq	dis not found

	setx	data_start_3, %g1, %r23
	.word 0xb9a00540  ! 920: FSQRTd	fsqrt	
	.word 0xbda80820  ! 922: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb9518000  ! 927: RDPR_PSTATE	<illegal instruction>
	.word 0xb3a40940  ! 930: FMULd	fmuld	%f16, %f0, %f56
	.word 0xb5a8c820  ! 931: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb5480000  ! 932: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb5a81420  ! 940: FMOVRNZ	dis not found

	.word 0xba9c61c4  ! 941: XORcc_I	xorcc 	%r17, 0x01c4, %r29
	.word 0xb7a81c20  ! 943: FMOVRGEZ	dis not found

	.word 0x87946164  ! 946: WRPR_TT_I	wrpr	%r17, 0x0164, %tt
	.word 0xb1aa8820  ! 949: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbfa588e0  ! 950: FSUBq	dis not found

	.word 0xb5a5c9c0  ! 952: FDIVd	fdivd	%f54, %f0, %f26
	.word 0xbda409c0  ! 953: FDIVd	fdivd	%f16, %f0, %f30
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 8)
	setx	data_start_2, %g1, %r16
	.word 0xb7518000  ! 958: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xb9a4c8e0  ! 959: FSUBq	dis not found

	.word 0xbb500000  ! 962: RDPR_TPC	<illegal instruction>
	.word 0xb7a94820  ! 966: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbb508000  ! 970: RDPR_TSTATE	<illegal instruction>
hwintr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_45), 16, 16)) -> intp(1, 0, 6)
	.word 0xb9abc820  ! 974: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb1a4c820  ! 975: FADDs	fadds	%f19, %f0, %f24
	.word 0xbb51c000  ! 976: RDPR_TL	<illegal instruction>
	.word 0xb9510000  ! 977: RDPR_TICK	<illegal instruction>
	.word 0xb3a48820  ! 981: FADDs	fadds	%f18, %f0, %f25
	.word 0x8d95a194  ! 985: WRPR_PSTATE_I	wrpr	%r22, 0x0194, %pstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a449e0  ! 990: FDIVq	dis not found

	.word 0xb7aa8820  ! 992: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbfa48940  ! 993: FMULd	fmuld	%f18, %f0, %f62
	setx	0x4cdf77a600008a4d, %g1, %r10
	.word 0x819a8000  ! 995: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3a80820  ! 996: FMOVN	fmovs	%fcc1, %f0, %f25

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

	.xword	0x554dfa104165aaae
	.xword	0x08d5900a8b596919
	.xword	0x19913b7fe958d0ad
	.xword	0x12b7400e768212dd
	.xword	0x149ec856bd73b85a
	.xword	0xd665386f75b47d51
	.xword	0x3479080b320f1bd8
	.xword	0x708e4a6ee870c268
	.xword	0x80b66a519604958a
	.xword	0xbfbb7b954fc0c73f
	.xword	0x43d1ad1139c7d107
	.xword	0x768ccb546a579850
	.xword	0xd21316bb27571156
	.xword	0x37d8e37ef6f6b113
	.xword	0x218eaef9c14c6a66
	.xword	0x3acdb18a06770890
	.xword	0xad98ca17a2192ced
	.xword	0x3a3ef8a37922969c
	.xword	0xfcbb9b177aee4841
	.xword	0x9b9b0793d49e538a
	.xword	0x2c95919ecd23ca49
	.xword	0xd10834f8d498acd4
	.xword	0x4331d77b21982c77
	.xword	0x33a2844689fe237a
	.xword	0x5319aa2b92c69f87
	.xword	0x4a2e24a64f849319
	.xword	0xc8d3c0d4c6036cfe
	.xword	0x41948c59809024ef
	.xword	0x1837f441948d2b2d
	.xword	0x63b06ae8c07bd359
	.xword	0x08cded1a980f17ab
	.xword	0x6fd94d7b724c8a00
	.xword	0xda9273f6bb54d464
	.xword	0x8765896002ac0e19
	.xword	0x649d22a6a0c0ebd0
	.xword	0x66dde153e0140d62
	.xword	0x7bf552614e92b2ee
	.xword	0x445ec9162cc3d549
	.xword	0x4272be058ed1cc2e
	.xword	0x67d846aee5fadd75
	.xword	0xc6f13e25d831d18c
	.xword	0xdc1a51d630986fce
	.xword	0xcedae91b96881ee5
	.xword	0x1e4e232fd4304c1d
	.xword	0xa91a4a4bf4b3dfe5
	.xword	0x8c4d01edeae927f8
	.xword	0xfb5c7609054a626d
	.xword	0x7a5416fe395426dc
	.xword	0x5416d34c39451efa
	.xword	0x21fd7337e7e246bb
	.xword	0xf9ed567a9b165e9d
	.xword	0x338e31f4183911db
	.xword	0x6f28f21aa708fa22
	.xword	0x78ec6ecfc569004b
	.xword	0x1181cc35fcae7b2a
	.xword	0xd3f81a29d23966f3
	.xword	0xf0cfc85097cff065
	.xword	0xa1aa24ddcd02a9a0
	.xword	0x25e9dc27104722ec
	.xword	0xdf309980b79ab9c0
	.xword	0x8693e5f205c7b03f
	.xword	0xd157957cfb9b74e0
	.xword	0x60a9784d89d34e21
	.xword	0x0f7d8c85c654f729
	.xword	0x378d303cb54094f8
	.xword	0x358e315fcd36dce6
	.xword	0x992d350bcf30b6db
	.xword	0xcdf41c0f286c29e7
	.xword	0xa90990e65711d017
	.xword	0x43f923a6ee756d05
	.xword	0xa520c849bbffff79
	.xword	0xcc8ca4387b978ba6
	.xword	0xc39e7aeeab0148e0
	.xword	0x3b373ea8329efbf9
	.xword	0xe03bec9e8710a7a7
	.xword	0xdf5fcb1a80b9131a
	.xword	0xe14403c52819a154
	.xword	0x445e5c58ad02e26f
	.xword	0x6257ed6a7469cd80
	.xword	0x7287b6d5cbeaf78f
	.xword	0xf0292f367d0fc57b
	.xword	0xa876414a38b52678
	.xword	0x1722ca7846ec1382
	.xword	0x4f0ab80c6ed1d02d
	.xword	0x026748597370abfe
	.xword	0xe81608e871876d71
	.xword	0x16a5542a4b81c7db
	.xword	0x7ee2aee1237cbf6a
	.xword	0x6ee3f79f0139bb3d
	.xword	0x1e677c6a1d06c4c6
	.xword	0xc5629ebb911b4dd6
	.xword	0x0f4aca401893b898
	.xword	0x04af2c8a6c84826b
	.xword	0x0f7e24f3592ff341
	.xword	0x74aa331ffbe69f15
	.xword	0x69ff8381e02a144a
	.xword	0xefcc27292e5dc7da
	.xword	0x53313a6f8f5fc69a
	.xword	0x760fb6aae2637841
	.xword	0x47d7acd96c2e0c2a
	.xword	0x804a4852221ca19a
	.xword	0xfc176292b0b6c57f
	.xword	0x78d1faee3efdaf56
	.xword	0x5491fbffbda839e4
	.xword	0x822510f9cdc62bb7
	.xword	0x7a2f6f1844ec8636
	.xword	0xaf69c8bf4b6e687d
	.xword	0x0156104c32c454af
	.xword	0x50f2da96d4eefc7e
	.xword	0xe83bb0c01bce4df6
	.xword	0xbe047b2596b65e97
	.xword	0x39184550dba49175
	.xword	0x3e8e6a04b43f2a0d
	.xword	0xc207ac0439069a04
	.xword	0x93dd5b7818b8ceb7
	.xword	0x5a7e92841b95a902
	.xword	0x313258b156ea79e9
	.xword	0x1db61dd9d6b59d6b
	.xword	0x776611a7bf774794
	.xword	0xdae290f4e8aa8aa8
	.xword	0x25c478542b3eb702
	.xword	0xbb97d7c4953747f8
	.xword	0x915dd2716afc2afe
	.xword	0xe7a5f341d0183813
	.xword	0xd76f99e346a8a199
	.xword	0xb83017d6fbfcb708
	.xword	0xdaeae40d0ae82ac6
	.xword	0xbe7675af23f582cc
	.xword	0x8fcd83f45c934b1e
	.xword	0xd2fc3639d0079b32
	.xword	0x53fb1560196fb986
	.xword	0xf2c3cf97004d8e5e
	.xword	0x9d852db24d68c9f7
	.xword	0x0a8b662728985a4b
	.xword	0x9e6b75e3b45c31ed
	.xword	0xd15cabf8a9f5eabf
	.xword	0xfebf64bf5d182834
	.xword	0x0b15f1c889410750
	.xword	0xb53f58dfce11e6ca
	.xword	0x0cfaaeb507ec05df
	.xword	0xa276f81dbf5af261
	.xword	0x20fe94776124cbde
	.xword	0xbfca00ad89a2508f
	.xword	0x910354e8d8e2c715
	.xword	0xf6240a82e648fa92
	.xword	0x43ac3b91daf0d436
	.xword	0x66aa2dcf21e1ac51
	.xword	0xc01f6cba9058a58f
	.xword	0x63daf318fba3d082
	.xword	0xef5c4bcfb843ec3f
	.xword	0x2784fcc9f9702432
	.xword	0xc7148484d7f656e1
	.xword	0x367c9cd1438936fb
	.xword	0x9dbdd7d1133ae805
	.xword	0xd1c605d2832a3fe0
	.xword	0xdbe83f946c7b2091
	.xword	0x473454b547157d79
	.xword	0xb6705356df042585
	.xword	0xba293dd5f014ed36
	.xword	0xf9b16d543b785329
	.xword	0xab55be9cfd6cc409
	.xword	0xf6cb101b6850cf06
	.xword	0x7e45f30745302012
	.xword	0x81d0e22d7eebcaf0
	.xword	0x474c61cb899bd2b8
	.xword	0xf61ea5f13c3ddbc9
	.xword	0xbfd6e9308cc46d80
	.xword	0xe26dc47159ebb59f
	.xword	0x3ba25ccc0ae128ab
	.xword	0x723a70b70b680a05
	.xword	0x19217955f54c9df7
	.xword	0x7edf25b02e84891b
	.xword	0xa116b435135a200c
	.xword	0x9fb49d9e0a880bca
	.xword	0xc0e15dbf553b47b7
	.xword	0xacafa17c03b3993c
	.xword	0xb6f45c4792e476f7
	.xword	0xf56cb77bc7d338bf
	.xword	0x2cf872d466f873ac
	.xword	0xe97e6819be5de8b4
	.xword	0x2351e319a4ec18e7
	.xword	0x131e282fc4a4d11c
	.xword	0x22051ff094d03588
	.xword	0x629b7c78c3d37a80
	.xword	0xe1117fa14bb05d38
	.xword	0xe2869051df7953a6
	.xword	0x15b340e9b2cdf02e
	.xword	0xb1e72a3e76012e1d
	.xword	0xe31cec83534a7c4a
	.xword	0x07e6af7024fdfab0
	.xword	0x3e38ebc1def458b9
	.xword	0xecf12c0eb924e546
	.xword	0x860e5fa4effbf88f
	.xword	0xb92f1a9a0a261810
	.xword	0x434e92cda4c0b2d3
	.xword	0x67da02b578baee15
	.xword	0x46a356ffdd7eebd2
	.xword	0x197ee938b4796722
	.xword	0x22263a427f905dc0
	.xword	0xf843029b436fbe39
	.xword	0xa4d3cf23f72998f5
	.xword	0xeeda0f875b11229f
	.xword	0xd0222a147e2af823
	.xword	0x7af7bf0614ae0d27
	.xword	0x53ce08dbba49bb8c
	.xword	0xfea20ecb6005b1fd
	.xword	0x9421f22bcba9170f
	.xword	0x2e725e39681c3243
	.xword	0x51b97ea4dbb2f3d0
	.xword	0x98d0e2c79c444fef
	.xword	0xddeea83efa54627b
	.xword	0x34b10c3ba1c457b3
	.xword	0x00718750c1708199
	.xword	0x3d6e959cc6c018a7
	.xword	0xe39e61a63a9f31e4
	.xword	0xaf40c7f9d6e2ea41
	.xword	0xbecf842029fe3e37
	.xword	0x50b30f678b5987a6
	.xword	0x897693b678d9e17d
	.xword	0xf00cc45e6a3a0467
	.xword	0x5e9ceeef46e0a310
	.xword	0x130d6c475d31652a
	.xword	0x2312e510c8322cc4
	.xword	0xdd06b99e28cf6101
	.xword	0xbbf015196bf14c78
	.xword	0xd3dcf5b576c537d9
	.xword	0x7ac2239d4aaf741f
	.xword	0x2feb05de10307873
	.xword	0x28378226dba725b8
	.xword	0x11957bd1a8e52fed
	.xword	0x07fcaae52fdb6923
	.xword	0x736b2d7abf42fb70
	.xword	0xee91dd8f6d528470
	.xword	0x396b19352fa2f06b
	.xword	0x40247108c75cc353
	.xword	0xee19602631da344d
	.xword	0x43a49a1f105c0334
	.xword	0xa7388ad7cb8fbf44
	.xword	0xbc7787b585d0ad6c
	.xword	0xe04bdb43455d3d5b
	.xword	0xcd5bdc4c872c6c72
	.xword	0xe18b5c731a985906
	.xword	0xe4d7159cd11b9c96
	.xword	0x597aab15ca748fef
	.xword	0x6ae2096d62b2f05f
	.xword	0x136acd5dc11ea519
	.xword	0x1f31040e3370befa
	.xword	0x827d24bb954f374f
	.xword	0xa9388c598e9ebbff
	.xword	0xa360c2fb083592a8
	.xword	0x56c2f80c52a1127d
	.xword	0xffa7d150061efe03
	.xword	0xe1757244c0537ab6
	.xword	0xbcda98e020d1f23a
	.xword	0x55cc77218d8269c3
	.xword	0xf38c9c9d0fd525d7
	.align 0x2000
	.data
data_start_1:

	.xword	0x5feac59966f9ade5
	.xword	0xeeb2696ae6444af6
	.xword	0xbe0a222e662b4f2d
	.xword	0xf3655ef0483c1a88
	.xword	0xa263e1696aca123f
	.xword	0x915ddf478731717d
	.xword	0x6941bb3526824f64
	.xword	0x200089017a8eb8b6
	.xword	0x32d61deca98c9c27
	.xword	0x648adf636af93ae9
	.xword	0xfe580049edebbd46
	.xword	0x4c28b045204d303e
	.xword	0xf5d84c0760b818c0
	.xword	0xc9bea01c526e30c0
	.xword	0xea6ce4dde9e43d50
	.xword	0xa1da20e9f9404401
	.xword	0x0b8f37c4936ca80a
	.xword	0xc2ec1bbb8573d821
	.xword	0x1d184aacb1f716d5
	.xword	0x0451c96057a9e032
	.xword	0x5dcf3cbd5d8db380
	.xword	0x382d2c42a136f5c9
	.xword	0x7a94ff396d9462e4
	.xword	0xe1102ccf85e09aee
	.xword	0x47ed2e6e2c23100b
	.xword	0x0b14682d6755b6ab
	.xword	0x68f5fba7c72eaac9
	.xword	0x14a62b63522e82cc
	.xword	0x5f75277aef07a440
	.xword	0xfd7820077cf1b7da
	.xword	0x206d6d904780f424
	.xword	0x92626ba4832b0a4b
	.xword	0xe3e287baf91e2215
	.xword	0xd10772ded9ccb2bc
	.xword	0x69b0a03314dc39db
	.xword	0x87905a5e27d7d056
	.xword	0x6d29ea79d279919f
	.xword	0x7f88ea6f851ce7b3
	.xword	0xc41f09fdc7d7c2e5
	.xword	0x177dc1ae52ca784a
	.xword	0xcdf730ab74e0f6ca
	.xword	0x6e4354b8410dce97
	.xword	0xd72e996fdebe507c
	.xword	0xf9f000d995997227
	.xword	0x0dfd81faf25d7a70
	.xword	0x28aeab9e7c420158
	.xword	0xcf9be5701b40a59c
	.xword	0x704c619cfe7963c0
	.xword	0x6b8e49e31f2f70cb
	.xword	0xb46b385cef9d3335
	.xword	0xe1d9858a6c25e78d
	.xword	0x34f0a2377334a69b
	.xword	0x1f78613aa1750f70
	.xword	0x47a4a8a9c2e59f23
	.xword	0xc4ebc9d5f6f8e516
	.xword	0x929fdabe8860c39c
	.xword	0xa5b54ca30384d9d2
	.xword	0x0d360bf51724c003
	.xword	0x8dfcc43359e5bda7
	.xword	0x9c0d1c5dd791dfff
	.xword	0xd6eab4ce4dfe59d8
	.xword	0xdb6480f1d2249977
	.xword	0x49d117d776595f3e
	.xword	0x1a5e68e638f2c11d
	.xword	0x1a2b51daf79e9e15
	.xword	0xe020f3d98078f8c6
	.xword	0x76d4efc5fbc0a591
	.xword	0xdc61537aa3706f52
	.xword	0xac26bb91ff669d38
	.xword	0xfc5ab2e5f8611a7b
	.xword	0x157b55281ee101c1
	.xword	0xbda71139033701aa
	.xword	0xa8b573216817b881
	.xword	0x62cffd8792d7523d
	.xword	0xcd852a839ab9c174
	.xword	0x6a929f85e283f633
	.xword	0x5dc5c87bf1aec114
	.xword	0x1eb6ac67dd3ede0d
	.xword	0x0d6965a42fcdbc11
	.xword	0x0b13cb3d69d642b8
	.xword	0xbf2754f9e844e220
	.xword	0x42b9a35d8f0f2608
	.xword	0xd65390e5930cf91e
	.xword	0x57692810a4bebab4
	.xword	0x05c79cb368e1f524
	.xword	0x205c9ea37376d188
	.xword	0xc52d0a3cc9f55558
	.xword	0x156d020736535de4
	.xword	0x92fe02a3ce3c584c
	.xword	0x23658062615d7d69
	.xword	0x896a9011c34b17df
	.xword	0xddd37a44ae139475
	.xword	0x007897e6d178cb20
	.xword	0x0198daf040294c64
	.xword	0x0475a9f186b532d0
	.xword	0x5705b28b2e875f29
	.xword	0xc6a20db62e66efaa
	.xword	0xac3941fb240b4e98
	.xword	0x319c049d36d737dc
	.xword	0x94bb87ca9b5da0e5
	.xword	0x98fd43ed1fd7ccce
	.xword	0xbaede36a9a8df27f
	.xword	0x5a3666da0056a592
	.xword	0x3cb321e3b0a87752
	.xword	0x97e7210f356d12bd
	.xword	0xc7434536c6eb97cb
	.xword	0xf4fead98dda2d81f
	.xword	0xed7e57edafd32a7a
	.xword	0x7cebcc9965e691e3
	.xword	0xba204f22c604e6d6
	.xword	0x02bd6a6f8a6482a4
	.xword	0xef367c4dfebc02a7
	.xword	0x4c1876e4b24fa558
	.xword	0xd0edead79896d4ac
	.xword	0x7b2d336a9a251352
	.xword	0x35f464d893335737
	.xword	0xa3a9f565f858cbd2
	.xword	0x1cd09f46a5a04712
	.xword	0x71e4c4e8427c29e8
	.xword	0x8b3d4244f8cd4a80
	.xword	0x89b16eaf40edf55a
	.xword	0xb67edfbfee9e1235
	.xword	0xa19b7a05d02be7da
	.xword	0xf09e1ca805e693e7
	.xword	0x44b1314b57e2211b
	.xword	0xd83511a2f80cdd93
	.xword	0x48f9aeb631d5bc61
	.xword	0x8256b2c94fa25092
	.xword	0xe0b21d4909d04c10
	.xword	0x397fe1e5a080c9a3
	.xword	0xf70710536cc3e746
	.xword	0xd9962785eb597bb4
	.xword	0x168993b542ba5209
	.xword	0x0b10ca2ddbdfe7fd
	.xword	0xcf57e7fdc8ec85d5
	.xword	0x1538937ed8acc353
	.xword	0x2c0dfa69d8c58922
	.xword	0xaf292191f1b892a8
	.xword	0xafeb5112df9eb298
	.xword	0x41319e328f524bb9
	.xword	0x7eeef1bbf6b3a342
	.xword	0x655e5c5fa310da40
	.xword	0xb89b4532f8b0b0a5
	.xword	0xb475fb8d9f78af6b
	.xword	0xd5556b943b874376
	.xword	0xbea21f62b604570f
	.xword	0x206ef7fbf6f25fa8
	.xword	0xdba2b23bd50a1c26
	.xword	0x4639bf9200125efe
	.xword	0xf874895fab98eb49
	.xword	0x9d05c0a122124741
	.xword	0xed582798865345a2
	.xword	0x3d7dcd36d0e87d67
	.xword	0xdf09befe350368d0
	.xword	0x40c56657e6dbb846
	.xword	0x212611208b2345c0
	.xword	0xc39964c44b3a3e71
	.xword	0x9893d6ea458c6031
	.xword	0x2ede5a7707c1f9af
	.xword	0xf9e1c96867b7c2a8
	.xword	0xd5d3ad08b9e2130c
	.xword	0x85f868136598617c
	.xword	0x23c166f8dcb9b13b
	.xword	0x6a253c58a5f932b8
	.xword	0xf4276d83d0984266
	.xword	0x0bace0e530986d5c
	.xword	0x30f70b72d1288c39
	.xword	0x300d7787311927f1
	.xword	0x0dc5032cc06fc2ef
	.xword	0x4ad2d5e89e11e39a
	.xword	0x2a88aaf7eb997833
	.xword	0x5b0c736424a351e8
	.xword	0x32f5eef54e5c8e84
	.xword	0xe22246534eee37c3
	.xword	0x1e9577fc11258cde
	.xword	0x17e818411df64188
	.xword	0x46c82bd8527899dc
	.xword	0xc217c702b6e05d66
	.xword	0x354178b60b34e357
	.xword	0x789b1108b5b0e038
	.xword	0xbf773dcfe4826085
	.xword	0x6412ac3070528985
	.xword	0xd9b81a4928848a48
	.xword	0x9fd0d210ccec0631
	.xword	0xa58b0acb05d5c21f
	.xword	0x4683a25ed94b2e77
	.xword	0xff9d4ea7580db200
	.xword	0xe925786173743554
	.xword	0x714c6c0c2aa7704e
	.xword	0x4f6e2b4fd1c5edca
	.xword	0xb113bb714addff4a
	.xword	0xa1dd442728aab587
	.xword	0x32434f08b9945905
	.xword	0x54d1490bc6764d8c
	.xword	0x769a856225137a5d
	.xword	0x33962a8ec97ae83d
	.xword	0x9f674a91631b9729
	.xword	0x3042dd996f5b5dd6
	.xword	0xe9173148b55fba14
	.xword	0xcca8f82c54bfec68
	.xword	0x494ffa70b723032a
	.xword	0xa489edd51aca6b55
	.xword	0x6cf35946e8598f9e
	.xword	0x880487cc86e87586
	.xword	0xc91d4f96fa60a8df
	.xword	0xc9a05b48af31a110
	.xword	0xb79c0d8633012402
	.xword	0xc5cece09baa7b01f
	.xword	0xd2541d04a9e274fb
	.xword	0x3053c4933d356864
	.xword	0xf90d64f3a8608d6c
	.xword	0x0f52c84c9b92a764
	.xword	0x90ff3b6395476ab7
	.xword	0x72b3c18b2ec112e6
	.xword	0xf441ab871a989257
	.xword	0x46acf6cb8a4f52c5
	.xword	0xb816794df5f05717
	.xword	0x8365e6e4af8ae8bf
	.xword	0xfb5380533de284a3
	.xword	0xb6ae432dd973b1d2
	.xword	0x01a25d3f33c801dd
	.xword	0x85bf1f97c153395f
	.xword	0x79f97e75f9e09d1e
	.xword	0x8696d31341ee79af
	.xword	0x368fe767673ffc9e
	.xword	0xb3b9a2a0c820cc88
	.xword	0x26f6d5559039ab89
	.xword	0x0895df99ce5072de
	.xword	0x44590bb0b29f29f0
	.xword	0xa7933eaa256182d6
	.xword	0x40b4d24612485f31
	.xword	0x0887f8e8e95b0d3c
	.xword	0xc878837b30472930
	.xword	0x896943066056a054
	.xword	0x83346b24204021fe
	.xword	0x9132e04fc656fb72
	.xword	0xab1a6c03844d5546
	.xword	0x8fcc942369324383
	.xword	0x7f160d0368e37038
	.xword	0xd656992593bdfc48
	.xword	0x36d0e31beef56eda
	.xword	0xb6e4a6961703cd69
	.xword	0xc8f2ce55fedee39e
	.xword	0x08cbd05d946b9ca6
	.xword	0x6faa1b4156c1a667
	.xword	0x06d77ef73cc1e9a0
	.xword	0x359681f7340f867d
	.xword	0x322bc73e4e148b2f
	.xword	0x0b6ceb73dd6a7a4d
	.xword	0x80759ec6b2289da3
	.xword	0xe12f711a3656261f
	.xword	0x1c4be6706d95e927
	.xword	0xad8979a1fce7e5f4
	.xword	0x81bbc78dda085a43
	.xword	0xfd10db104d11fced
	.xword	0xb1b327e8e891e4b1
	.align 0x4000
	.data
data_start_2:

	.xword	0x1eb7f59f54faf4c6
	.xword	0x3f4c5449e06de3c0
	.xword	0x79724c3a52eb9e03
	.xword	0xcd44c78e59759533
	.xword	0x33308fff597988cf
	.xword	0x934730218c939efc
	.xword	0xf48c20441d1faa15
	.xword	0x6afca4f59551a83d
	.xword	0x5e196309071982a7
	.xword	0x2b54c310e3da0522
	.xword	0x2b7369254a2518d4
	.xword	0xc9e21ce2942a34eb
	.xword	0xe2a36db1d1a5e4f2
	.xword	0x3ff117a8a17fa36d
	.xword	0x8189cdc90577de0c
	.xword	0xc0db252fd78e505f
	.xword	0x936eb63ede957e17
	.xword	0x2e022fe36a8d5554
	.xword	0xfdf5f5ed90001571
	.xword	0x28d9aa37b11c9cef
	.xword	0x2a3715f1dd3cb481
	.xword	0x712f7409ab22b53f
	.xword	0x84661f3bfc369f8f
	.xword	0x313e8665e7971895
	.xword	0x5dc2826e2a78f54d
	.xword	0xf42966a32a218724
	.xword	0xc4aeed74de81684e
	.xword	0x58b57b8a6abfc11c
	.xword	0xb53d05ff4bd914e5
	.xword	0xffb13af9a1bf70e7
	.xword	0x83f963c81283009a
	.xword	0xf041a837ccdcea97
	.xword	0x26b65b32e9ce3b2a
	.xword	0x9fc238f0441206cc
	.xword	0xd25a89b8b07c05a0
	.xword	0x24edacd0c0bb5d20
	.xword	0x5fe7377f5a2eb7d0
	.xword	0x43e655a1fbd200c5
	.xword	0xf5e101c43e77bb45
	.xword	0xf34b5d9798633996
	.xword	0x6cc6097e97b186e8
	.xword	0x9b2d848ca37587a3
	.xword	0xaba698e19bebb0a4
	.xword	0x8ad57284708c1845
	.xword	0xc06bdf4a296f5839
	.xword	0xaafea3032b43e3c4
	.xword	0xf71647a5806c1513
	.xword	0xe68a2b0cf9e9192f
	.xword	0xa2e70805d7767088
	.xword	0xbae48c1510f266fe
	.xword	0x65c2f354660ef568
	.xword	0xadfc1ea421aa3a18
	.xword	0xd647b0e8d115ce3d
	.xword	0xde6cd751e762ab85
	.xword	0x0d1a3ab14eba99bd
	.xword	0xcd31bc3bfe34cb74
	.xword	0x178f4585f0e761aa
	.xword	0xd74fe34702303aa4
	.xword	0x48c06e8c751e8ad0
	.xword	0xc0ca214ec59552aa
	.xword	0x751303eba0c972ea
	.xword	0xce086da3b6c1f5b3
	.xword	0x2492e4a7bcc9d3f8
	.xword	0xcf554f8c9990e336
	.xword	0x73af89074eb2b1da
	.xword	0x9475224ac38d46db
	.xword	0x67b28a08f1ca9303
	.xword	0x3ad22a6650af84a4
	.xword	0x3f233fcd34e3d4f2
	.xword	0xd8c59e7acc205510
	.xword	0x9cb90e32b0043b0f
	.xword	0xebebcc097d8b361a
	.xword	0x9877c0b5dfc7b02d
	.xword	0x67bc690e0c688ccb
	.xword	0x0c6970e2a48cd495
	.xword	0x19c575dce6140d95
	.xword	0x95000e9e21053100
	.xword	0x8a14234944a90ea1
	.xword	0x0a75281c9bc9b5d2
	.xword	0xd44a953301cc3c00
	.xword	0x9a115759a091b1a5
	.xword	0xdce8083da4078a60
	.xword	0x8f7b13fb425a5a63
	.xword	0x83e6cfbf3e055dfb
	.xword	0x44b329f5a36b3204
	.xword	0x5b18c307e9354c22
	.xword	0xb17173531dad5681
	.xword	0x9e42c9ba9e12aeda
	.xword	0x5afe029515125f04
	.xword	0x0e957ceeb5bc378c
	.xword	0x6e7c285031a67462
	.xword	0x2daba294432d37fe
	.xword	0xadc9dc5f9c47ec2d
	.xword	0x6193e2fb3be9080e
	.xword	0x17fd2f2e1634bfc5
	.xword	0x8dfeedadb8474103
	.xword	0x562ee7d1094f8626
	.xword	0x1e0514a7dc35978c
	.xword	0x2aef49b25e60d20b
	.xword	0xbcb653efff25955e
	.xword	0xc7a16404a299f275
	.xword	0x091324cbf105c184
	.xword	0xe6138f9eafb2c784
	.xword	0x06febbd476bb6fb2
	.xword	0xdc0f32cd37567e4b
	.xword	0x7d73811d34807c44
	.xword	0x311fcbeca62b80ea
	.xword	0xd07abcf51a6065b6
	.xword	0x7cd198d7ac05abd3
	.xword	0x56fbec119b5a6e61
	.xword	0x3bb477c5204fe4aa
	.xword	0x31b244e74a0fef74
	.xword	0x1e23b6b6200c45db
	.xword	0x22cab9770747bc4c
	.xword	0xe24181059926d44e
	.xword	0xb3837ba1ee9c5702
	.xword	0x3eb26add4f3c4f34
	.xword	0x215e7cea74739cc9
	.xword	0x8d59bc8fe3b6289e
	.xword	0xcabdcbf911fe466e
	.xword	0xa81eace2c65254ac
	.xword	0xd23f4c8161536039
	.xword	0x565cd52116008a06
	.xword	0x4de574ebc3740d08
	.xword	0xe8d19250578b65bc
	.xword	0x6d9d37613190a213
	.xword	0xde3910dd2eb68d50
	.xword	0xb2f5620aa81ae4f8
	.xword	0x1f267324d191ee74
	.xword	0xdbd7662403adf6af
	.xword	0xdb8040d8f7c33ea5
	.xword	0x7c4de166dc137277
	.xword	0x2b70388ef7ba7948
	.xword	0xa5650ad5e0e16d3b
	.xword	0x866a03ff8d328c9e
	.xword	0xcf618cdf3f8b3880
	.xword	0x15fd0f81b7a38cdc
	.xword	0x4b284bc09046808b
	.xword	0xe8dc93bc1552975a
	.xword	0x13637564a65d167b
	.xword	0x3163ee71f9b9e93a
	.xword	0x72066ab1aad0f92d
	.xword	0x4ad2d2eb61341b41
	.xword	0x074184b00f7b2505
	.xword	0x3f57d693391c1b42
	.xword	0x62a1a6fc93cdeff9
	.xword	0xb88270a7425101f9
	.xword	0x8aafd5f43d179e2c
	.xword	0xf32bdb7db0e74e3b
	.xword	0x8ffe7fbfa2dfada9
	.xword	0x503667880c9ae9f4
	.xword	0xb79814e20fbbcf64
	.xword	0xe6748906a64013fa
	.xword	0xd60190174055394a
	.xword	0xf68f8c8a4bf02742
	.xword	0x4b440de2a2ac3396
	.xword	0x205c6a31da9187aa
	.xword	0x4e528aef0599f9e1
	.xword	0xd074319c35b23073
	.xword	0x1a241ac311ee6e99
	.xword	0xbdea635c9d76ceda
	.xword	0x4b44dbeeec64707b
	.xword	0xe01517d4c890dcdb
	.xword	0x629dc050c3b0032c
	.xword	0xd7c6767215fe7635
	.xword	0x7491a0911dc28982
	.xword	0xa697b13db59e5eae
	.xword	0xe665a578715b61e6
	.xword	0x9c9463dbd399d15c
	.xword	0x7b759c9bf1fc9b2f
	.xword	0x84b2b88a399b220d
	.xword	0x8c08050c29cad609
	.xword	0x8575c80d47bac939
	.xword	0x765e87a76e75aad8
	.xword	0x91b6d5f023ce6791
	.xword	0xfec882f7d5147165
	.xword	0x88e9cbd88e74287e
	.xword	0x4aeec049984cae9c
	.xword	0x3182ddc3c46ffad3
	.xword	0x2ecf9cfee366871f
	.xword	0x552d1b6ba9f782f1
	.xword	0x7a6567fc15566e72
	.xword	0x0a2217a40753db31
	.xword	0x9760d753d8faba5e
	.xword	0xe02ba6d28d2aacaa
	.xword	0xa61b0595d28c677b
	.xword	0xeb579d317f4ebfc3
	.xword	0x0abf4176275a191f
	.xword	0xba2c78ac9c5520bc
	.xword	0xde4145c62059aa60
	.xword	0x26c7b4a700c5d23e
	.xword	0xf00439a5a8a66744
	.xword	0x6cb7005c61e1972f
	.xword	0x8a5608e7f097c342
	.xword	0xb4b2a15ae09a47c8
	.xword	0x3e9b6e0564cb5619
	.xword	0x58960e67430e6dfc
	.xword	0xbdedda2bca4145df
	.xword	0x7fab723ad305bf94
	.xword	0x333ba3a988e080ef
	.xword	0x67373e472c8c5147
	.xword	0x70057ae27e3bf99f
	.xword	0x755261b976350be8
	.xword	0xd96436e3ebb1094d
	.xword	0xd733d71e6c29052a
	.xword	0xe02fb514edf7bb7d
	.xword	0xde6010d4a7bddf83
	.xword	0x03b7f3a01e890383
	.xword	0x690821482f9a11fe
	.xword	0x249c28a39cee22b7
	.xword	0xb7c9eecf0fa05742
	.xword	0xea9b8c8a07f75d36
	.xword	0x6726a013592fc822
	.xword	0x9c8ebc810441776b
	.xword	0x0bd1ad5eab3a4664
	.xword	0xb3864a57cd85e0b9
	.xword	0xe9ca709de5178e5e
	.xword	0xc33996ec0106e44e
	.xword	0x304b298361a624b8
	.xword	0xe9f862c73ae4ad67
	.xword	0x31b8298727b22cb6
	.xword	0x26c68fa3a17da8a8
	.xword	0x9a74714f1b478092
	.xword	0xa9784b94175fd12c
	.xword	0xcfb5190aef7f29d7
	.xword	0x3c8473516caea703
	.xword	0x499546919d776c39
	.xword	0xb1b2908cab15a810
	.xword	0xcc20bad5cc4d2293
	.xword	0xff0a1be4deb5d5de
	.xword	0xb66f458c3b43437e
	.xword	0x4cb9819f44e55d6a
	.xword	0xdc049cdf26d0fd3b
	.xword	0x8bd6d4f7103c740c
	.xword	0xb3be78b8d135a4e4
	.xword	0x18fc4f21707dfb7c
	.xword	0xf2d1f2d1c1705c94
	.xword	0xf40a093ee3c78c1c
	.xword	0x1c4b89bb52e40e72
	.xword	0x1bece60a0cd080c4
	.xword	0x2ebe64870c41630c
	.xword	0x02b5e72b78f1d3a1
	.xword	0x1b02348aaa0e5b65
	.xword	0x768accf24a70198d
	.xword	0x3953af4d9ec91609
	.xword	0x326a835b59ad173b
	.xword	0x274c7a679e26754d
	.xword	0x430a92c3a88bbaf7
	.xword	0x86a83a16f7a2dfde
	.xword	0x4926dc7a7f8a241b
	.xword	0x3ddf38b4411ec767
	.xword	0x41c25f63b5bb425c
	.xword	0xeb2a1c23760e5f47
	.xword	0xe5b9ff2f659f031b
	.xword	0x0bcd79cd0f81f1f7
	.xword	0x64218b8e53036fe0
	.align 0x8000
	.data
data_start_3:

	.xword	0x6dfc20317140013b
	.xword	0x05e5d46a3b528a40
	.xword	0xefcd706ab9f3b290
	.xword	0xdfc3fdb78b77e226
	.xword	0x28d1d37d662a18b1
	.xword	0x2dff6fe75d4fa8b2
	.xword	0x5ca92b663321704a
	.xword	0xbf0728cce6bd105b
	.xword	0xb2148dcb0488fc44
	.xword	0x2e047e9350a9b0fa
	.xword	0x1db0a7a4614eb199
	.xword	0x9a1d92da047320ef
	.xword	0x7c706a0037b682bd
	.xword	0x46d4e8045549e226
	.xword	0x2ec269d12b557412
	.xword	0x16770fcd2f093afc
	.xword	0x76468965cec2cf37
	.xword	0x3571b0c5552684f1
	.xword	0x3abf8d8044f330bb
	.xword	0xa1918b6533669366
	.xword	0x91a39dab8fa3e8a0
	.xword	0x5e02564f238aeec5
	.xword	0x90b34bf50896da6e
	.xword	0x8bc2d3d7b75534d1
	.xword	0x8258387a2f7b7d4a
	.xword	0xe493f57a355e1fe8
	.xword	0x3f2c5f5801697535
	.xword	0x8fa7b38f06412ef7
	.xword	0xb8ed5b62e501ef73
	.xword	0xbbacfac8c6641ab3
	.xword	0xc177a05d0562a5c3
	.xword	0x4b239411aa55dc6d
	.xword	0x034bea2a2c2b7f48
	.xword	0xed5add7e60fa295c
	.xword	0xd74b6fa2831ea339
	.xword	0x86ebeb63e2a5ae9c
	.xword	0xfe2cffb7611e1fe9
	.xword	0xb10d4824033073c8
	.xword	0xd3592b2273fe2ca2
	.xword	0x5c1d8c749eec5d1f
	.xword	0x625e8c8b70c90326
	.xword	0x5c230a9ec981e345
	.xword	0xcd45e280a6dbb23c
	.xword	0xb9bd36fce3aaafcd
	.xword	0xd89c81b3494d1751
	.xword	0x6c3b7efe29775808
	.xword	0x3bee6e19005351d6
	.xword	0x71725bb90bf50277
	.xword	0xedebc9d3eb032216
	.xword	0x9bab38be775ddd8b
	.xword	0x5e8fa8da0d24b9ba
	.xword	0xf76343bea2722581
	.xword	0x5c5fa848517e5d94
	.xword	0x29d378256b18ee93
	.xword	0x4af647b24b45a1de
	.xword	0x07a37d8acc0ff10e
	.xword	0xdbcf613251d9f4dd
	.xword	0xf92b894e48b6cdba
	.xword	0xb274c777eb3c1f0f
	.xword	0x77f184e9bb05f205
	.xword	0x89241d6603fa4973
	.xword	0x8025a39591d53a9e
	.xword	0x2cd92e2986282377
	.xword	0x56b743375a702ebd
	.xword	0x22d14692f7f4ba01
	.xword	0xb583e1b7692444db
	.xword	0x66f18d93c0ee023a
	.xword	0x08e0e34824139f80
	.xword	0xc717c337e3b86eaf
	.xword	0xcefc5433a6400d65
	.xword	0xd7a472d6307b7f79
	.xword	0x04efdf8be5ea54c3
	.xword	0x677196b3437e8250
	.xword	0x2a2fa5f778928be7
	.xword	0x7022201c3e1307f5
	.xword	0x78b2bf3d8b89414d
	.xword	0x4fb91142c65a3834
	.xword	0xfbf5f9626e7f8d99
	.xword	0x424dd03bb0bab4bc
	.xword	0x10eb6fdf56876885
	.xword	0x19c2fb6a7b644931
	.xword	0x3354ca070b527384
	.xword	0xe295873528216b40
	.xword	0x59df0ea54be299bf
	.xword	0x60e4c9693b77d9ff
	.xword	0xd52a5386f1392a8d
	.xword	0x2a87d4b4531630b8
	.xword	0x1a6bb6e915289854
	.xword	0x669b75dd659e10a3
	.xword	0x23ee1dada977b500
	.xword	0xddfa641c82f73d2f
	.xword	0x9c541e6b2fd360d0
	.xword	0x1a503e38b9a82cf4
	.xword	0x3f2dda227e0de2df
	.xword	0x00fff8e75bbb26bd
	.xword	0x3b2d753ab0661ab6
	.xword	0x2dc1150e1003f539
	.xword	0x120b6fb627c5c13a
	.xword	0x054e5d79f5eae1b4
	.xword	0x7aae230acbbc2e33
	.xword	0xb13aeaef17010a15
	.xword	0xa592b103216aef62
	.xword	0x51d97f79fe1d86ca
	.xword	0x6a431d133903af95
	.xword	0xc95e86ad30248026
	.xword	0x047012ae37528537
	.xword	0x69a36c0adf43d9a3
	.xword	0x94f9e95e37d0db50
	.xword	0x55758d371d4a2660
	.xword	0xbd6eb55ee1602584
	.xword	0x47f93b967334b0d2
	.xword	0x3bc287f38af3801d
	.xword	0x1cb02564c581a9ac
	.xword	0x9c52f91013755a0e
	.xword	0xf39bee4db69398e0
	.xword	0xb06b340517a5dc1d
	.xword	0x60c2047e28a9fc19
	.xword	0x399c665ca9fef756
	.xword	0xe8e1609412e7d47a
	.xword	0x7824573b2c6a4a0d
	.xword	0x4c4fd6e21d871dad
	.xword	0x89499cb51cce37a0
	.xword	0x97569b9773f603e6
	.xword	0xd894933a7fa802da
	.xword	0x5a83dc3951575f6b
	.xword	0x9f792a30900d8272
	.xword	0xb957e50aa06a307c
	.xword	0xfa715a136babf02a
	.xword	0x6ecdde02b8e4b16a
	.xword	0x3fbb0939f1b7abcf
	.xword	0x03874721323cfc38
	.xword	0x99f78a43bb471df7
	.xword	0xc9a5f504115820c0
	.xword	0xb6c43df64afbcb16
	.xword	0xe3b80320fdf2ab79
	.xword	0xc4699d8a71a7ad34
	.xword	0xc1a5b117cd445e64
	.xword	0xa7cbdf1737e9e6d8
	.xword	0x451740bec8aeaf55
	.xword	0x5b05f0bfc25dbb89
	.xword	0xeacc310768734ff1
	.xword	0x755f5152fcff5b93
	.xword	0xbc907c23adebd77b
	.xword	0x346485b8e7c6f90c
	.xword	0xdde8f9d8cd589e15
	.xword	0x6c3b6ffe255d4b9a
	.xword	0x3a7b1e1731476475
	.xword	0xae277c3733501e7e
	.xword	0xfba5121b59f64bec
	.xword	0xc122c9f8cc44c20f
	.xword	0x4c37c03832fe1949
	.xword	0x789ad6fed328eef2
	.xword	0x2add9cb1fb4ec93d
	.xword	0x4fdf3725f87e7d29
	.xword	0xfcb80fe7d886b523
	.xword	0x59b29f67a7b7c426
	.xword	0x38b43dac01744dac
	.xword	0xceee0d7c5b058e47
	.xword	0x02df3d802102fe5a
	.xword	0x49811664b7b763f0
	.xword	0x710f1ae4729e3c01
	.xword	0x3bdcdc58c33b5c2c
	.xword	0x66f2497ae3131cbe
	.xword	0xfc7c56ecdc27b445
	.xword	0x22c358785d033aed
	.xword	0x659de44640a59800
	.xword	0x4f403fbf18c487a6
	.xword	0x1e796a003fdb0bb3
	.xword	0x6e2cb815cf640b6f
	.xword	0x1796917019cdd0a4
	.xword	0xb0660d982f9c0fa0
	.xword	0x4908c23d0caa5e3d
	.xword	0x53ee73ea872fbb25
	.xword	0x4840fcd6d36bf9a8
	.xword	0x06f839d67720483d
	.xword	0xef50bc6a03956aa3
	.xword	0x7d188a7569fa473e
	.xword	0xdea11776ee2e5900
	.xword	0xf6b37d042031dbe6
	.xword	0x6241489a13c76477
	.xword	0x2e6ebc4da4c3babd
	.xword	0xe19c182af6a0fa19
	.xword	0x5bf05b5779633486
	.xword	0x657e023818b5b0fe
	.xword	0x3534d4d4d361e46f
	.xword	0x3a3fb00261fef526
	.xword	0x87b6c83b787f2551
	.xword	0x668c5a4f39df6b8b
	.xword	0x50ea6a4450d6aad6
	.xword	0x9f62dbb756feaf57
	.xword	0x7d6bd1bcdc2eca11
	.xword	0xbcbc0d2359dd7f74
	.xword	0x64d9ee47d9343178
	.xword	0xfc374720bdef1aea
	.xword	0x0c438100a517cf74
	.xword	0x472517150bb247cd
	.xword	0x26b8189b766020a2
	.xword	0xe19a1f7aeb7f804b
	.xword	0xc4354c2fa36dc554
	.xword	0xfebc2e6ee86f137e
	.xword	0x74997f125f4c1bf8
	.xword	0x04e720ea1c48feb5
	.xword	0x71b179fb01a64964
	.xword	0x508ea2c4257bddae
	.xword	0x49b8da05c5629b06
	.xword	0x1b7a38e8e1bb8fd2
	.xword	0x555adf5d88b60d4b
	.xword	0x6eb5bf6365fb7338
	.xword	0x0d047b7048bb07b2
	.xword	0xe6e584c91aff831b
	.xword	0x6b5ee53ad7195d59
	.xword	0x29b3219dd8594cb4
	.xword	0xc61dcaddbe1b254c
	.xword	0x3c83b0a2fab6ca50
	.xword	0x3422c73400f30eee
	.xword	0x03f71898b3c80f50
	.xword	0x7a06cb3bc6a2d80a
	.xword	0x2379781bec920ec9
	.xword	0x7dbc597c7ea1110c
	.xword	0x25f047d19b39de46
	.xword	0x67aad56a0bf36254
	.xword	0x1c5d010184715223
	.xword	0x5671930b9151d18d
	.xword	0xa8df01cfc2af4de0
	.xword	0xebea0d5781fe9163
	.xword	0x307817ce17bb5600
	.xword	0xf5b45ae81b928a94
	.xword	0x32de8d74240c377e
	.xword	0xa24987973ca50c1e
	.xword	0x4d6c8b470190fbe4
	.xword	0x402a51f12b2f9473
	.xword	0x6e54efaeaaf6fc42
	.xword	0xe0188d3df7ce5e63
	.xword	0xade1f1a33de23027
	.xword	0xf1b98b62eeb5e527
	.xword	0xd548badcb331da7a
	.xword	0x29ecae19e25151a9
	.xword	0xc663202068a3300a
	.xword	0x6ee452b9e69defea
	.xword	0xfdc2461357ce5808
	.xword	0xaf156c9461cbe6d4
	.xword	0x1b6c39fceccc1692
	.xword	0x02125c948315467f
	.xword	0xa107158627c84235
	.xword	0xcdf5ff9663765753
	.xword	0x7dffa9732fa3132b
	.xword	0xc95cff0beea28139
	.xword	0x6194765fdf93d4b7
	.xword	0xac45771769c119c6
	.xword	0x7232a46f60a27332
	.xword	0x2255184b4ef620fb
	.xword	0x174ca9d4b0b10352
	.xword	0x44a0e40d0b25a844
	.xword	0x68edf5473252629e
	.xword	0x1971d338a6b367e5
	.xword	0xea3a503fb4860371
	.align 0x10000
	.data
data_start_4:

	.xword	0x16ead3eb5bbe0f4c
	.xword	0xd8ba5f970de685ac
	.xword	0xd0f18c8909d81892
	.xword	0x766308951ab8f067
	.xword	0xdbfc19f40e442d9d
	.xword	0xcbd22ff678fa95a0
	.xword	0xd63c6fe7d93c2e11
	.xword	0x4fd7fe979a42dc60
	.xword	0x8c16ac9644206d1c
	.xword	0x60b33f327f52f8a4
	.xword	0x381430cb9425826b
	.xword	0xcfe2716e5160dc21
	.xword	0x5bf7df2451f1ff3d
	.xword	0x0305160ef39ae2f6
	.xword	0xce1fae333f09bb4d
	.xword	0x41cc8ff17ad29379
	.xword	0xabcfd757418b7328
	.xword	0x11953d4ca83b3e3c
	.xword	0x09338628166cdddf
	.xword	0x325b3d464fcd9f15
	.xword	0x85a48e9b0f21c807
	.xword	0xbc44096246fd1fba
	.xword	0xd127f3c15480ce6d
	.xword	0x2867ce798d66bc0b
	.xword	0x3bceeedaf67ea460
	.xword	0xb6195f78ee0d5bd7
	.xword	0x38e6bfe052d96c90
	.xword	0x15c5169c49f9b40e
	.xword	0x85b28ee65f9b1303
	.xword	0x0d05bbb666c8f874
	.xword	0x5bd7117a1cd2299c
	.xword	0xff7de219818324aa
	.xword	0x2743a80ad9938431
	.xword	0x24032fedf323caee
	.xword	0xa95ec181db8ba43f
	.xword	0x33845c21568cd0f1
	.xword	0x7aae8200af1c90e9
	.xword	0x873418076d1ef6d3
	.xword	0xd145ce6b7e81f871
	.xword	0xe2517d0b04d6496e
	.xword	0xc9476d0699b804d8
	.xword	0x5c36efcc2f393059
	.xword	0x1f495a8e47586a60
	.xword	0xb5f768797c93db90
	.xword	0xee8f7e671ea07030
	.xword	0x01b8c64c858358ce
	.xword	0x3af1d4a1a421be68
	.xword	0x5de9ee49ab7b24fe
	.xword	0x6d9cb014fdcf7aa9
	.xword	0x32f2baeccda2715d
	.xword	0xbefc53ea00b9faf6
	.xword	0xd0675ea3ee19c21f
	.xword	0xb1e7ceabc6ad042d
	.xword	0x4af2d9cfddabe005
	.xword	0xbe3653dedbdbea52
	.xword	0x4934d7096f96c520
	.xword	0xaff6ac2401b451f5
	.xword	0x89ef201240993798
	.xword	0xb2a676cb9659e75d
	.xword	0x39b3e458478cfdeb
	.xword	0xf644f86e50e8af28
	.xword	0x1d6dd700b4773d03
	.xword	0x359887075003a194
	.xword	0xfcd7c5387cdcbd23
	.xword	0x3e9ea55cb7e32f70
	.xword	0xc02a055436fa588a
	.xword	0xada5cd5893b0a431
	.xword	0xc89c6c22f531fb74
	.xword	0xdad4cfe3fbfe3863
	.xword	0x1d70d8c848bd49e6
	.xword	0xb6007a718458d496
	.xword	0x2ee27b977c74ed10
	.xword	0x5a901c73ad6d91ab
	.xword	0x50caa3f55f6103c5
	.xword	0x286f7ef1a25e368f
	.xword	0xfd7f1257e221861b
	.xword	0x2245517924aaf3ec
	.xword	0xc7f81554e9ee55c1
	.xword	0xe57eee4b5152da99
	.xword	0xfe1c9d442e368378
	.xword	0x6486df67714f4d12
	.xword	0xfebac8a1fd2a81dc
	.xword	0xb9ac1ce34a37d292
	.xword	0x1b47c4d82d73119f
	.xword	0xa14f165528a6dbe4
	.xword	0x0e22ea83b0db9ff0
	.xword	0xb0906fe1de39cf57
	.xword	0x96c79882382d780e
	.xword	0xbb0c35da0ced0644
	.xword	0x35a6358b727b858a
	.xword	0xdc7bccef07c96704
	.xword	0x01e60eaf271cd76b
	.xword	0xd6eb19ff09525ff2
	.xword	0x5b0fd1f1f2ae0d8e
	.xword	0x1f8c62da64a61f1a
	.xword	0xfeabb7895e90de2a
	.xword	0xc1b02d0481300f59
	.xword	0x7338423ce6eac205
	.xword	0x85c4af2b30b91a38
	.xword	0x947d256b99288d84
	.xword	0xbf293846ee2ef31b
	.xword	0xb9b1a1696770d81f
	.xword	0x91155758bc7b40bf
	.xword	0xcfed7047a3bcfbfb
	.xword	0x85edc17fdf8672df
	.xword	0xaa5ee30cf0892850
	.xword	0xaae35c568f1216b9
	.xword	0x33654d4d54d50cc3
	.xword	0x326d947089d304d2
	.xword	0xe602415483bbee4d
	.xword	0xeb4c69be6b4cf074
	.xword	0xa7a14c304026b17a
	.xword	0x5e2c06ca916e0995
	.xword	0xaaa452f21d9e138a
	.xword	0x2972d7fe77f89e13
	.xword	0x61139b912d6bd951
	.xword	0xe5583e871f502bc1
	.xword	0xccf984b533d7469f
	.xword	0x39a83b9ecedff7b2
	.xword	0xb2efe1372cb05eb2
	.xword	0xe0d1d6a624b7bc7a
	.xword	0x21569b25e84ed9ed
	.xword	0x5c352110c1827f2e
	.xword	0xb02e4baf449847e5
	.xword	0x659a136233227cb5
	.xword	0x616a284c3cff3adc
	.xword	0xcc8b4cc20d057866
	.xword	0xdc1136282e7fab2f
	.xword	0x7c764866ba3ad11f
	.xword	0x46938ec9c754e624
	.xword	0x941a1157c910abcb
	.xword	0xdce36fd9a45988de
	.xword	0x27749a67b958cb73
	.xword	0x2b7ab3f64e7dca45
	.xword	0xfdc98b6b058aef1e
	.xword	0x742c1e0c052504ef
	.xword	0xe8b26b19e861646e
	.xword	0xda6485a8227d8d86
	.xword	0x3f4aa79fb4e329f8
	.xword	0x2bdfec6d56196e32
	.xword	0x26cac174462e639a
	.xword	0x608275b1d0d6200c
	.xword	0xbf21cced968c74fd
	.xword	0x4a0694e76d473fda
	.xword	0x87f5d7685c9a0213
	.xword	0x9b3bf3d4f6162e83
	.xword	0x5adc832d7cd36758
	.xword	0x1a835672fdd14fcd
	.xword	0xde8c34e8865514bf
	.xword	0x905612839d480329
	.xword	0x79a01e1cd400b80b
	.xword	0xf0e2db49119ea9a9
	.xword	0x9c98139faf3594c3
	.xword	0xab691a23c7ca0787
	.xword	0x061b40e0e2d79da9
	.xword	0xb628e389354415bb
	.xword	0x304b956d00ffce9e
	.xword	0x88ee2e3e395d4f33
	.xword	0xa405ac72a9a6e464
	.xword	0x92ca2f45798975f5
	.xword	0xfa64e69e5d6a4ea5
	.xword	0xb2ea5b20b4e9658a
	.xword	0xe22ba7ed1b6aff79
	.xword	0x60b0e9a8c613d324
	.xword	0x943ef3ffb7f14c57
	.xword	0xad51501402bda985
	.xword	0x3fbea64478e52282
	.xword	0x2d86ff089c79bc77
	.xword	0xc868e587ae6fc66e
	.xword	0x1021ea9167b83a11
	.xword	0xe5cecfdb2b70aa44
	.xword	0x6b99f5ad718740ca
	.xword	0x732b807d262e201a
	.xword	0x9bd3d33583f736b1
	.xword	0x8c169519d03cb2aa
	.xword	0x7194d8b59745b930
	.xword	0x97431db1c7404ad0
	.xword	0x02ddfed7dd19eaa8
	.xword	0xa07b510bdb3149f2
	.xword	0x32005ef272cf236b
	.xword	0x61bc209f921454f3
	.xword	0xedced1e5698c8f75
	.xword	0x26be9fed03f3a350
	.xword	0xceb8b7cfe08e5ec5
	.xword	0xe2a01d7764185af1
	.xword	0x746e6f4c6494de60
	.xword	0xc04d920dae81b6c9
	.xword	0x495dcbce6570c2f4
	.xword	0x36c517f633c5e3f4
	.xword	0x71951ef328f6cdca
	.xword	0x0d6b253a74e8d7bc
	.xword	0xcc384ebe9b5dd981
	.xword	0x5d1c0533f613c315
	.xword	0x8a24d5d56292acf0
	.xword	0x7d07fd7f902e9f63
	.xword	0xd23f95c56d9fa00e
	.xword	0x0af45a2dba1d92d4
	.xword	0xf888556b1728f12a
	.xword	0x89ce74e3fc3e6633
	.xword	0xfcbace71dcce901d
	.xword	0x14be852fe5fc1fcd
	.xword	0x9ba6936026352a9c
	.xword	0xd896963c912fd08c
	.xword	0x9069de925c4967b2
	.xword	0x6469595b8d3a8c61
	.xword	0xd3176010eb3539a8
	.xword	0x0815dd5b4e0d74b6
	.xword	0x443642faccc8535a
	.xword	0xea99de82c60bba7f
	.xword	0x58d27fa75498baff
	.xword	0xfab158e2105f04e9
	.xword	0xaad0b6630604ccad
	.xword	0xa3fd14cb938b0615
	.xword	0x5c937119b7b54e18
	.xword	0x42a42666061c0c33
	.xword	0xb3795cbb732c124a
	.xword	0x49a18180f04d30ca
	.xword	0x57a23e11a17496ae
	.xword	0x1b9c8d74ee81117a
	.xword	0xfe3bc3d50e3390ca
	.xword	0xfadb947ea13b05e3
	.xword	0x143a59e5c813a786
	.xword	0x0e1feaee5b6d30fa
	.xword	0x2976753f4fd153ce
	.xword	0x68e254e171b78821
	.xword	0xf40d343161edcce2
	.xword	0xfc045c3019831b97
	.xword	0x0dbcdfa1de184d58
	.xword	0xf0137a3ba431504c
	.xword	0x7c2e8ced2d2a0fb3
	.xword	0xb481385358c6848d
	.xword	0x3791f65b222d44ce
	.xword	0xc503a11aff530271
	.xword	0xbdc55ec23ca5a71c
	.xword	0xae9db8d304320a1b
	.xword	0xc7fb79ef77920713
	.xword	0xcdc381b897b36138
	.xword	0xe886099615084d1c
	.xword	0x866436f7174437e4
	.xword	0x4fbdcf2665552da7
	.xword	0x5cfccebfbcb8d7a8
	.xword	0x82a2b290ff946fb4
	.xword	0xeee86e92936edf3a
	.xword	0xfb073d49bbb8e2e2
	.xword	0x5d98b7e5d426785c
	.xword	0xc4a1e3f26a34fa17
	.xword	0xf0b9034b10bce243
	.xword	0xeda9ecaa0421e429
	.xword	0x4bdecfe202036d3d
	.xword	0x770dc8b9053849a4
	.xword	0xdd217c2041782293
	.xword	0x03a27268e70bed87
	.xword	0x78a8bb6608146c3f
	.xword	0xc2348d7fff561c30
	.xword	0x7f9f9f6b56c4b8fb
	.xword	0x9bf640eb11055fc5
	.align 0x20000
	.data
data_start_5:

	.xword	0xa930c13b2f3a30a1
	.xword	0xb761c7bd432c77d4
	.xword	0xcc6f6fd0491f50cd
	.xword	0x889c705ba830feb9
	.xword	0x1e276bcdf6a7c83b
	.xword	0x1ad1b27fa17b79d3
	.xword	0x71b5c8f69a7dce7f
	.xword	0x3d09563202d92f50
	.xword	0xa5666985a1310285
	.xword	0x9bd56f817e7bcaaf
	.xword	0x4c05b8e89079d48e
	.xword	0x96011912f2c6e07b
	.xword	0x538eb22af4fa9430
	.xword	0x5fab7d1f1e72d330
	.xword	0xf85d9af847ca27b4
	.xword	0x787cfed1d82adab9
	.xword	0x7e0d3ce551f09345
	.xword	0xade3514e1d5a211f
	.xword	0x3bb1e142bfbddd6f
	.xword	0xb4fe80662ab7b063
	.xword	0xc05ed752082be8fc
	.xword	0x1b7abb8705b06387
	.xword	0xede7671610a0d403
	.xword	0x98e8244ab5b9bd4c
	.xword	0x14e6a721904e1005
	.xword	0x445e64a076b43c67
	.xword	0xcea2c7f5760fabfd
	.xword	0xe52b1a35a78707a7
	.xword	0x473ee3d114ecf490
	.xword	0x3c29d2a2c8b66487
	.xword	0x8974f894b48e0e7c
	.xword	0x1eccdefb6ce9b400
	.xword	0x791e0ba3a7c9dd8a
	.xword	0xa62cdadde645ecef
	.xword	0xdf0bab2e10e0f061
	.xword	0x595647ee508a12a0
	.xword	0x45b5d604214f7b2d
	.xword	0x603641c6e93c3fed
	.xword	0xa3dc099800152ad4
	.xword	0x2860b746d2a8a369
	.xword	0xf95a383046d34362
	.xword	0x267659e46aaa8aa2
	.xword	0x55451524e412c290
	.xword	0xe6d85771f3dc37b4
	.xword	0xa4ace72a2fa7f19f
	.xword	0xf539da67ed013b82
	.xword	0x9b19e1869492b6dc
	.xword	0xe71b2e5927da79d9
	.xword	0x66e262a5024e4136
	.xword	0x2a0012232e0a9e60
	.xword	0x4eb6975d2fae1330
	.xword	0xd6bf39d4c6ced6c7
	.xword	0x00396cb872e92e79
	.xword	0xa57184cddc6a8352
	.xword	0x22b04bfcb1e97290
	.xword	0x21ac2bcc3f614b17
	.xword	0x3d8129ee8340964f
	.xword	0xe2234d13c5275e98
	.xword	0x3a4a7151c8340152
	.xword	0x2a3b2c675a77d956
	.xword	0x2a536a9891b5c441
	.xword	0xa9facf97344d39bd
	.xword	0x24cad5e5a8359466
	.xword	0x868d8eb8074d6f17
	.xword	0x84bf201cc0171e7a
	.xword	0x9104dbf04e0f1fad
	.xword	0x293cdcd73072f533
	.xword	0x8e6ff349a967c444
	.xword	0x67c327d78ede1581
	.xword	0xffc404da61a2a5fc
	.xword	0x7700082a0b71c8f5
	.xword	0x878ed9b97913190d
	.xword	0x1cb1aaa7ceee36ee
	.xword	0x64aa2fa628e66db8
	.xword	0x6de7e36323a1f01b
	.xword	0x8bfc2075924619c0
	.xword	0x54785980d2a5e771
	.xword	0xb516a978dc05683b
	.xword	0x7f7fcc269ca2abb4
	.xword	0xb956c0aae5cbeecd
	.xword	0xbca221a2a8227314
	.xword	0x6e8463b87979ee6e
	.xword	0x6938877bbe675aa4
	.xword	0xc0f01bead12ac7ef
	.xword	0x74e39353006d13a5
	.xword	0x446903bc46681c53
	.xword	0x5070cae45ffabe1b
	.xword	0x6318aaa892cfe1e5
	.xword	0xaf6e57abc926b1ea
	.xword	0x8377dba389c47cac
	.xword	0x6054d4a986e912a4
	.xword	0xfacbf42bf6c9f45e
	.xword	0x650d348a10016c8f
	.xword	0x393a6dbcf79e2df4
	.xword	0x236ddf2ca7355a24
	.xword	0x6e0762dfa271f284
	.xword	0x20cffcc8cee06b54
	.xword	0x334fcce762b52138
	.xword	0x46361a9b8ba25158
	.xword	0xd90569d25074f29b
	.xword	0xcd78441c5e37b31a
	.xword	0x7aa78bd2f6eec6b8
	.xword	0x6d34ca70075dab58
	.xword	0xac933e1bc4fa644e
	.xword	0x73f4987be7c4aef8
	.xword	0x572a85ac4f7ba0bd
	.xword	0x162104d22247c4b1
	.xword	0x85ef8c3562df8cf1
	.xword	0x244617e39d5514e3
	.xword	0xe3076a0f71ea7051
	.xword	0xec6dc67331cbe159
	.xword	0xebec5a43705c4e4f
	.xword	0x569c794afad30ab4
	.xword	0x99f9a9e0e1dab5a6
	.xword	0x3d93ee04c4769ca4
	.xword	0xb79bec0c30f77a45
	.xword	0xb0bfe12088f53cd1
	.xword	0x785d9bc86b66a728
	.xword	0x0aafb725a6cba4a2
	.xword	0x81a2ea83ffa4dfc1
	.xword	0x7a5472ffd172ff31
	.xword	0x0cb65e7fed9b03d9
	.xword	0x3e5d6823c554a7c7
	.xword	0x1cd8cf6763bfac06
	.xword	0x0c2ec844de82e1bf
	.xword	0x9a7eb1f62ec77b62
	.xword	0x4b5e582be8b9cb4b
	.xword	0xef2e0ba7ed1cbc8a
	.xword	0x0e570724eea41461
	.xword	0x61da2cd3daf628e8
	.xword	0xfb582d8c09324561
	.xword	0xeb881ffde1d62221
	.xword	0xa7a9017e2d003524
	.xword	0x2141c6b4ac723088
	.xword	0xe4035559a4f4272d
	.xword	0x17534ff61f7c8b38
	.xword	0x172c1ef81126abf3
	.xword	0x8453124accc3e7a8
	.xword	0x378c5a91476a46d4
	.xword	0x05bb1952c3b8e0fd
	.xword	0xf02444f6ed492cca
	.xword	0x37979ebe88bfc25d
	.xword	0xc327088bc848ac0b
	.xword	0x92144fb740be2def
	.xword	0xe1aaaacb54b992bc
	.xword	0xbc19aad67fe9a27a
	.xword	0x77f1c1551da3a5f4
	.xword	0x9a9c943f2aaf5865
	.xword	0x112c7d7ef7ddc7ae
	.xword	0xd669ca3e49ad57dd
	.xword	0xc48d8ba2ce831ea2
	.xword	0xf857ac9f2b3dd4da
	.xword	0x172346334ed0ab9e
	.xword	0x33b276b1c1fef07d
	.xword	0x6e1850ab72407d16
	.xword	0xb7c53e35251f0084
	.xword	0x2c2d0cee99005cde
	.xword	0xbcd4429752553123
	.xword	0xefda24c713e608eb
	.xword	0x46791f7877b77ef9
	.xword	0x8d6fcbb17cb793fb
	.xword	0x46769b7b43976796
	.xword	0x45bf1cc318e3f37a
	.xword	0x3613940eeb80d422
	.xword	0x2a987c343a06bce4
	.xword	0x3e7a359e784ce988
	.xword	0xb3861d5ae61871ff
	.xword	0x25808ace7d9f3c0c
	.xword	0xf77408a656f0c302
	.xword	0x354dd78d66e447e2
	.xword	0x37d4d16e94ec8dc9
	.xword	0xb6d8e523428e5306
	.xword	0xd828437c8d15b086
	.xword	0xa20635bb78913983
	.xword	0xe8490ef4b82664b4
	.xword	0xbb13cdf31cf59061
	.xword	0xf736af269e725e88
	.xword	0xadb19a4919be7a48
	.xword	0x7a7fc23684f5befd
	.xword	0x00a278f3a2cb43a5
	.xword	0x18dff6b430ce1d6d
	.xword	0xe555219518e7a513
	.xword	0xf4d787afa03fdbec
	.xword	0x5b77815ec906af1d
	.xword	0xbf3d35a6d22b7929
	.xword	0x27d2ea3eefabae18
	.xword	0x4505640abbbdb808
	.xword	0x1a676b88616c0fb0
	.xword	0x5edf01ab678d9138
	.xword	0xc7ffd1f9835a429d
	.xword	0x00118b694b12fc09
	.xword	0x10da03063c7edf89
	.xword	0x685d2ac60269fe5a
	.xword	0xfb6a23100c92bbb7
	.xword	0x22ab1ce93cc9782f
	.xword	0x0d74c097e7210942
	.xword	0xc867af379320f514
	.xword	0xf9726ceb9a5ac8a5
	.xword	0x5d339167b94bab43
	.xword	0x652cadc6daa59d36
	.xword	0xc6318bb66dd23fd2
	.xword	0x13720e66df9ecd10
	.xword	0x22de18d4d113d488
	.xword	0x9973a8d0d60d22b3
	.xword	0x4d38b9ebec7ad769
	.xword	0x97c6eb9943fd39ec
	.xword	0xd23242f9177a78ef
	.xword	0x85f4f89b3f4ff3c5
	.xword	0xf3ca52f9680e5c58
	.xword	0x9c95a9d6e2311f34
	.xword	0x7bdb70ce0bda6e87
	.xword	0x7d1107b5a21e7817
	.xword	0xb144289a2f683ef8
	.xword	0x37a7a1dbdc53dbc0
	.xword	0xfb01d7d74156e299
	.xword	0xb9ef36564160da29
	.xword	0xf301752985fb3141
	.xword	0xcbb51c7ecc757770
	.xword	0xfc6153734a85c8eb
	.xword	0x587311fbf428d93f
	.xword	0x61d7ee228bb15bc8
	.xword	0xba167dbc3ed056fa
	.xword	0x176075294a1287b6
	.xword	0x4828f863fa882c66
	.xword	0xf5bd0bc8ce0a423f
	.xword	0xcafb30fc883f94dc
	.xword	0xea92592afb7c0f82
	.xword	0xc355c338a3077c91
	.xword	0x050ecc68ca21f8af
	.xword	0xa8b9d946eb554065
	.xword	0x28ac1cd870188272
	.xword	0xa9405c4826bfa574
	.xword	0xf3bf4aedec9242e9
	.xword	0x4a6fd204226e78fe
	.xword	0x46701540c8a5efda
	.xword	0xe5a1a9b84b8102b9
	.xword	0xed69c6c711a503b6
	.xword	0xe268a7d5b9b1ce11
	.xword	0x7a7de2700401b8aa
	.xword	0xa912f2d635e0fdde
	.xword	0x52e55d74408fb9bb
	.xword	0xd51c53bf7c176743
	.xword	0x3c5a9725b8095845
	.xword	0xbfeb4268c2453355
	.xword	0xc7c3547300121c51
	.xword	0x16f550b1f3d4ced1
	.xword	0x98cc0b68415c1584
	.xword	0xcd906172c10ea61b
	.xword	0xcc71323aa5bad4d4
	.xword	0xf825a86a948300d2
	.xword	0xae835b6954a5fafb
	.xword	0xde8a147a590cdea1
	.xword	0x6c1331b4b9fc0ea9
	.xword	0x96dd4dbeba45059b
	.xword	0xf83a5c5ba82d9c6c
	.xword	0x244394f9812d6ed3
	.align 0x40000
	.data
data_start_6:

	.xword	0xea6124cb24cf00ff
	.xword	0x85ddfa5fcfe41ecd
	.xword	0x516ca4fed24d89b6
	.xword	0x4c9bbecbde042424
	.xword	0xf7c88d3e9cfbd4ad
	.xword	0x9c285d3efb0b2451
	.xword	0x06eef06aa093f8d1
	.xword	0x3966f31cc9611c21
	.xword	0xaea3826a0832fb71
	.xword	0xbac5a9faf2c4bbd0
	.xword	0xe0a96f4287ba8c4c
	.xword	0x5a938a5a7d79256b
	.xword	0x7b0d5eb5ee6620b7
	.xword	0xc117e022adedb55e
	.xword	0x2251ee78bf64f67c
	.xword	0x3ee25b180b6b5269
	.xword	0xb96d76384600301b
	.xword	0x1e9c852d33b0a282
	.xword	0xc40338811553f344
	.xword	0xb0802215fb283199
	.xword	0xca1ea2052c979f2a
	.xword	0x3e013a4b4574f6dd
	.xword	0xae0fea1778bf39f5
	.xword	0x57b53befd0133b71
	.xword	0xf2acf6453e450e10
	.xword	0xeb9b3366f56c2150
	.xword	0x78e9d61fd466bb69
	.xword	0x755e2bd2e91862a0
	.xword	0x405b27918dc7fd2e
	.xword	0x9240be5080bd72e3
	.xword	0xa9e04bfc110ccd35
	.xword	0x6aa66a1504432eb4
	.xword	0x1da0ac6cb2893d23
	.xword	0xc210c553e3ce74ca
	.xword	0x42307fe72bb5153c
	.xword	0x9796402cb5ae6146
	.xword	0x5b1dd988bead36b6
	.xword	0x6b61eae5557bceef
	.xword	0xd691eb0019d4538c
	.xword	0xce8afa0b66b33440
	.xword	0xd7e50cbe9ed2ef61
	.xword	0x9f7c01eac10b465d
	.xword	0xaf4afc22d8c4aef8
	.xword	0x5943d91627408d3b
	.xword	0x136b87a8920c6ffb
	.xword	0x31bf0fe329b67f14
	.xword	0xfa912069a256def3
	.xword	0x15f18c5bdb4b1538
	.xword	0x96aeafabc228ba53
	.xword	0x90c97aa64bd429cf
	.xword	0x1c415cc3161b31f4
	.xword	0xd6c9d1e00448b259
	.xword	0xb199eb4f94ebe37c
	.xword	0x29614465ee75edab
	.xword	0x39f54c6c7ad249ad
	.xword	0xa271728ea5b2e83c
	.xword	0x367997ab1f58d5d1
	.xword	0x4ac6f67f14596c88
	.xword	0x6d5b986c82cfdaee
	.xword	0xd39a729f00bafbf2
	.xword	0x5ea5e1b8d7c83142
	.xword	0x74fd4266deb9d1c6
	.xword	0xd64950be873bd510
	.xword	0xe0a55944ad8cfb0e
	.xword	0xdec8ed773f51c9ff
	.xword	0xbe6538ca66f24382
	.xword	0x5216517981cd3073
	.xword	0xfecb3d63d2594c18
	.xword	0xc1c3b4b88e9bdccf
	.xword	0xa61c1997af5f9b0f
	.xword	0xf25b15f03d2e2d4f
	.xword	0x4e6d5690d7895286
	.xword	0xbede1e11032bfbf2
	.xword	0x084d4256d334d5ce
	.xword	0x38eae1cdd5b29fec
	.xword	0x96b074dfe9fa68de
	.xword	0x732c95eddbae847c
	.xword	0xb5a62a3953969335
	.xword	0xe3355a2108b967c3
	.xword	0x35bbab19d2477ccd
	.xword	0xd6ac551d300e88bb
	.xword	0xd6be9f9bfd356600
	.xword	0x96f4670ea92cdb7c
	.xword	0xbfd38ccc8807a492
	.xword	0x515e47e315d33206
	.xword	0xb4af2bacb1bddaee
	.xword	0x94e9a2d66c97446e
	.xword	0x8cc3dddccfbf195d
	.xword	0xc7c2a0152229890c
	.xword	0x24050304efd97a94
	.xword	0xc5b90ea59a64902c
	.xword	0xf75d62e22c579243
	.xword	0x5308a6c296698f22
	.xword	0xe0b11cf404346ff4
	.xword	0x1032d1954f391d84
	.xword	0x3950329346bc5ec4
	.xword	0x2acc281a0b055637
	.xword	0x9499e7806b90dd9a
	.xword	0xa46c9848a3b3ca10
	.xword	0x628bc14f8318017d
	.xword	0xfb29fa591182b079
	.xword	0xf5655bd9885f6333
	.xword	0xed93df0bbab3f5d3
	.xword	0x880374d7a48cf3bb
	.xword	0x88599c4cda7c343e
	.xword	0xfaf1424a5751fc4c
	.xword	0x322728e991e70158
	.xword	0x08e12d2e22af4cb9
	.xword	0xaa8864168d220208
	.xword	0x86fff483461da86a
	.xword	0x6b3bb1a53e3d37eb
	.xword	0x6997359704d9e0cb
	.xword	0x38a28d588c122230
	.xword	0xb5726c4d300db672
	.xword	0x5d8d46971a881d66
	.xword	0xfd2156b771a6fa23
	.xword	0x16b98f4282b1adec
	.xword	0xa14c777671e56cb4
	.xword	0x356f851418ffe644
	.xword	0x4e85dba4e948cf40
	.xword	0xb936e881025b8418
	.xword	0x0a3147384dce4cdf
	.xword	0xd68a9816b96bea14
	.xword	0x08a21094f62af781
	.xword	0x9c989198a09510ce
	.xword	0x9cfb79fb3af58d7e
	.xword	0x6d9871543de4055d
	.xword	0x966c1691407fbe1f
	.xword	0x92a23b12eb4a6cc8
	.xword	0x7c4b47bff68f9735
	.xword	0x708ec940c1fd213b
	.xword	0x3a53743a92b140a6
	.xword	0xdadb1be2f625e039
	.xword	0x67668a8b087ecfdd
	.xword	0xbdb04b5f3dd4a5de
	.xword	0xa6a0eebc97a5b734
	.xword	0xb2bd9e5c181c0b60
	.xword	0x0f41723ee5e3daf8
	.xword	0xd8ddd5395c3396c0
	.xword	0xaefb8308f173f07f
	.xword	0x89289d9a158d83f8
	.xword	0x6bb264a6f3d06138
	.xword	0xfb96691188a1d263
	.xword	0x0b36be15bdcb174f
	.xword	0x0276d96e1e6ec33c
	.xword	0xaba8f6928b90e12d
	.xword	0x47326cd5d5a83745
	.xword	0x6fffe40ac3f89c7b
	.xword	0xb780bad9acdbd8aa
	.xword	0x16ae93ff094b8d58
	.xword	0xafaa6b1168f70d76
	.xword	0x925256491f66c680
	.xword	0x22ca6e0f2b2a633e
	.xword	0x44cb79d9656a64e6
	.xword	0x981905108407a4cf
	.xword	0x7d3dba73576b6614
	.xword	0x53d16e0ab43f4d05
	.xword	0x52889ff14158e511
	.xword	0xaa9a377eb2c8abcc
	.xword	0xbfdd4d48e59423f1
	.xword	0x3db58c40c12b00fc
	.xword	0x14ced89e7d2530b0
	.xword	0x69dfef92852eca09
	.xword	0xab2c76d5eff2e861
	.xword	0x00cc4f10bdf28098
	.xword	0xd998b8cf9dcb0e63
	.xword	0x85622a05764bf8ee
	.xword	0xd20f516a82b72029
	.xword	0xdc0a3eed9faee222
	.xword	0x4402341b14be6c2b
	.xword	0x2bef8b40683db6ec
	.xword	0xf38c43381e0f1643
	.xword	0x82d939ba9737de61
	.xword	0x259a16c23babf41e
	.xword	0x5a945f0e13e226f3
	.xword	0x8e7a5bbe3acf5f6c
	.xword	0x61e4ab0335e3fc01
	.xword	0x34a257583e274322
	.xword	0x7b327ecf3383df32
	.xword	0xd9e678a5d9a63847
	.xword	0xba6b3819f7cb82a1
	.xword	0x034a19b9b6a6170b
	.xword	0x524501bfa6610f74
	.xword	0xd86a9a14470f3d70
	.xword	0xf0bb7b45d319eaa4
	.xword	0x2212ec11b4b57079
	.xword	0xc4d38694a23b9ce5
	.xword	0x89a7e399d1adcf9a
	.xword	0x1bcb502eff54718b
	.xword	0x72628bc1b73bc7fb
	.xword	0xe3ba01a634c7974b
	.xword	0x45f83a1d572a35f7
	.xword	0xd9d7a06503a3fb40
	.xword	0xcd958f2b2a2446fe
	.xword	0x7006222fe5ecd604
	.xword	0x8b8d1101f8af866a
	.xword	0x97415df066334ce9
	.xword	0x0a0df92bc1b1b653
	.xword	0xfa619a68210f3411
	.xword	0xb865466df987974b
	.xword	0x73387c00e5d55d19
	.xword	0x40425071abb0daa9
	.xword	0x1dd2143470ecb3c0
	.xword	0x00c1e17248439b27
	.xword	0xdb7192d94cc1a388
	.xword	0xedf9509ccb3c6eee
	.xword	0x9d061ff0f94175dd
	.xword	0xfcd5bfd4bb200cf8
	.xword	0xaae0a37a335d4b6d
	.xword	0xf16165a148afaca7
	.xword	0x384f71d4c3eff681
	.xword	0xa250e15f22d061b0
	.xword	0x1728066293a0384a
	.xword	0x59ddfde07fe1931a
	.xword	0x28ea792947b882ec
	.xword	0x2db251145d1686fc
	.xword	0xc167d4edd41d7a63
	.xword	0x1b0fbce104ac62d3
	.xword	0xc6b486856e561579
	.xword	0xcad0dd0d384c87ee
	.xword	0xce8581c7136698ab
	.xword	0x9bf497239a26503f
	.xword	0x30d6cd186685503f
	.xword	0xae64485556a2e296
	.xword	0x54d09d79a8edad42
	.xword	0x6763a5c202e4c80e
	.xword	0xe366c60ad7ca9fc6
	.xword	0x765ee348203f961a
	.xword	0xf768940262e2fb9c
	.xword	0x633a19d8415a794e
	.xword	0xb03063b010f31a39
	.xword	0x95b317fab03a0b15
	.xword	0x94d88eb0897dc649
	.xword	0xbf0d730a193f4a91
	.xword	0x185c2e7d1abd2ae4
	.xword	0x9bfd23ebd5915e92
	.xword	0x2534132a39ebf6e7
	.xword	0x466f82ea280f54d2
	.xword	0xf57a66f5320c1c59
	.xword	0x368a8de4434b17cb
	.xword	0xfd3051ab9e89680a
	.xword	0x0d40882da63c7351
	.xword	0x413fe3bd959054b3
	.xword	0x5be08e24c945c9f4
	.xword	0x6c1ef9a34c04aa89
	.xword	0x4d623f881713d68d
	.xword	0x228e464c9c78a8c0
	.xword	0x8688f3b851176de5
	.xword	0xad82ea628b44b7a0
	.xword	0xf5c660fe3c474961
	.xword	0x296a429c9c4e2945
	.xword	0x3666f1749686d5bd
	.xword	0xc4b7960ad810db69
	.xword	0x40c6b1d83022de65
	.xword	0xdd579c4699c1b132
	.xword	0x6b8d658515751ff7
	.align 0x80000
	.data
data_start_7:

	.xword	0xedd537d57a9d2866
	.xword	0x90575307f0a68ac4
	.xword	0x580f210e5c02b3c3
	.xword	0xfe60f7fed261298e
	.xword	0x073877793090ef11
	.xword	0x6f7cd499811fd2f9
	.xword	0x5d46f4d09aa8b409
	.xword	0x90f8f066df23251b
	.xword	0x73690ab394563ecb
	.xword	0xb86cb4da3f51f8a8
	.xword	0x2ba2620f2b3b6e54
	.xword	0x4faafe2de2f37231
	.xword	0xfe8cf5e4e8f1a9f7
	.xword	0x4b948e0f39a08fd1
	.xword	0xf22d75294d857d06
	.xword	0xe83d9c4d3bea023e
	.xword	0x534c82a0ffaca07d
	.xword	0x35f33ca6f9af83da
	.xword	0x9729b92a359a7084
	.xword	0x69a18a33e5c1eaee
	.xword	0x906dba8edab699a9
	.xword	0x8db0b292dda4b173
	.xword	0xffea39978cdec32a
	.xword	0xd8447ae84c02f452
	.xword	0x93ae796027afa818
	.xword	0x5382864217964877
	.xword	0x744b6c74f42de205
	.xword	0xd84270fcaee76d7c
	.xword	0xf4e70886b48cf4a0
	.xword	0xf67a33e9db700e89
	.xword	0xb1928ed28e56ede5
	.xword	0x2a1b36c7b66f416b
	.xword	0x501b6c196b6b0009
	.xword	0x647d07dfce5bbd3a
	.xword	0x69a5db42ff0000ec
	.xword	0x2ec8e59385aae09f
	.xword	0xf51415c84bc47d20
	.xword	0xe7d0a17a28d809c0
	.xword	0x408aa3109fd8abf1
	.xword	0xaf59b7fd836ba6c2
	.xword	0xcdc83daee2657af0
	.xword	0x214bc67318a9f069
	.xword	0xe05ecc15cb06b6ab
	.xword	0xebb697db53d81291
	.xword	0xa674cba2cef9a9f6
	.xword	0x6eb9d77582eb8e76
	.xword	0x375b690f053faaa2
	.xword	0x7772b19e177782f7
	.xword	0x5257c5d03ab5e20c
	.xword	0xe3a5a33be1f3fe55
	.xword	0x4cb02a9e04f8520d
	.xword	0x55b4cb2ca8e29152
	.xword	0xd80fc21dd508f395
	.xword	0x73dcd8e6e315ca14
	.xword	0x1d1ce2b49718f52a
	.xword	0x0a087bdb36e16563
	.xword	0xa9c79faf3eff0f5c
	.xword	0x5b022d733113fb06
	.xword	0xc8b4d9a8996c1151
	.xword	0xe7f47e7222d440e9
	.xword	0xd715b9207a2e10be
	.xword	0xfe204b3b0edafde5
	.xword	0x3f2a1bf210a26c62
	.xword	0xf5fe98a352c4a04b
	.xword	0x98e751ecf1fc6433
	.xword	0x23584502768d87ef
	.xword	0xebbca24560baf887
	.xword	0x8a218f0f9a93a9b7
	.xword	0x65fba625057f4084
	.xword	0x67118fa5bef29e63
	.xword	0xbf2b3b24b3d5674d
	.xword	0x2e1585ee85d93bcb
	.xword	0xa985a88b59e032f6
	.xword	0xae26c044a398a816
	.xword	0x8a93f34a1a4a820f
	.xword	0xc674550de601a3f2
	.xword	0xc7cb34d90c6ac11e
	.xword	0x3ded72044f381523
	.xword	0x2c5805be1d663900
	.xword	0x6ab5cca21147d2e7
	.xword	0x68864d09c499b1f8
	.xword	0x384e333815f4e122
	.xword	0x75488fafc9b1c031
	.xword	0x104979f26a68f5f5
	.xword	0xbd388354bfbdabc8
	.xword	0x92f9a0b275871e1d
	.xword	0x598bc648c5c045b0
	.xword	0x54c03dd68a3a77a9
	.xword	0xf4f83ee153bc9728
	.xword	0x45905fc08b279922
	.xword	0x8f7045ec960ba47a
	.xword	0x0c0ec40c1537603a
	.xword	0x52e8494ed934566e
	.xword	0x729fdfd1511637fb
	.xword	0xa745b626af60c384
	.xword	0x97d35d226f70024c
	.xword	0x1d072cc3d6b45934
	.xword	0xae5db381ef65114f
	.xword	0xb4488a9b6de75293
	.xword	0xfd1abb54cd8e24b6
	.xword	0x29427820a714c938
	.xword	0xbb4b64584fb171d6
	.xword	0xa19824b34d05db16
	.xword	0xbc6744e384566a75
	.xword	0xb776f44208eb6f5e
	.xword	0x0784a4a22dfe6d71
	.xword	0x3ac16dabe030c863
	.xword	0x457b87b81af08963
	.xword	0x09ce498cad5ddef1
	.xword	0x97e54db812ca6c9b
	.xword	0x612563f5d877751a
	.xword	0x47f8bf476082bb8a
	.xword	0xdf3fd44ca13fc15f
	.xword	0x93a97df4ef25697f
	.xword	0xdf1f95493c118691
	.xword	0x23129a1feeb6e339
	.xword	0x776f523fb7442da2
	.xword	0x3aa4c5059cce23f0
	.xword	0x6b569faabbc92d0f
	.xword	0x6f28b879a571d045
	.xword	0x2c78804670d02548
	.xword	0x192d331fb3d228d4
	.xword	0xa4db14c6d42f5c17
	.xword	0xa215fe2fb470effc
	.xword	0x557fe574e2f90f19
	.xword	0x0de34e2637fec2e8
	.xword	0x6e82e3885b37c667
	.xword	0xb746af241a49d7fd
	.xword	0xf077775354be157c
	.xword	0x8b267bb559f3d3f2
	.xword	0x26f0c0a02296412b
	.xword	0xa70fd3e10851e727
	.xword	0x691ede688cbcdfca
	.xword	0x0d37dfe54bdd7c7e
	.xword	0x42c4f084dadd2064
	.xword	0xb60119d1732f9e58
	.xword	0xc2f283b643a62bc6
	.xword	0xeab23cf21504aa3a
	.xword	0x2f508e41261b34bc
	.xword	0xc21c1506733ec344
	.xword	0x8316c4454e13579e
	.xword	0xd5c865b06b522f6a
	.xword	0x3e583e6d4af724d1
	.xword	0xaf0f6982d0e12a91
	.xword	0x09d0c4ace8a9e23e
	.xword	0x0349a56a859855ad
	.xword	0xf912ef05f7e25b1c
	.xword	0xf48155d19837712d
	.xword	0x77055768f2e665fb
	.xword	0x4cfcf758cb483480
	.xword	0x3c122e6b748132d5
	.xword	0x4cca633a3ed91c3c
	.xword	0xd56ea5e96db9f00e
	.xword	0x34c97beb83f2df80
	.xword	0xf1199a19e372529e
	.xword	0x4bf0d401b22be224
	.xword	0x6a568957556d07bc
	.xword	0x9f9c48e1fb9519c9
	.xword	0x60a21776c5b3e274
	.xword	0xef08821070981b53
	.xword	0x97443d52a47aa7e2
	.xword	0xc92329442523a2d8
	.xword	0x404279ebf3aa75be
	.xword	0xdccbd33f0df68db6
	.xword	0xb593b39b7240bddf
	.xword	0x8220e58366f2f154
	.xword	0x8195754ebce0f6de
	.xword	0x1bf835c5a3422366
	.xword	0xb7220dc7b8fb60f7
	.xword	0x35554f2b623177bc
	.xword	0xd61b141388c4d2df
	.xword	0xd35906ad1826afd5
	.xword	0xa455f144443406ce
	.xword	0x8255941eeae6cffb
	.xword	0xc90b26275b3defba
	.xword	0xa6b655e7303a0613
	.xword	0x6decbc666b599318
	.xword	0x8cbebec842a2979d
	.xword	0x891da5ab051d77e5
	.xword	0x74a077cc2adc393a
	.xword	0x1a8e8ea45a1b1c64
	.xword	0xff672fc6d8f7087d
	.xword	0x70b04b6716340e0d
	.xword	0x9a0e543a3ffe25d7
	.xword	0x0f3a57010ffa5321
	.xword	0xf192395905142caf
	.xword	0x9d803bef48cf6089
	.xword	0x00e416cf07bdd279
	.xword	0x32b63980d5628ad8
	.xword	0xd03fac57667d963b
	.xword	0x1ab4151d9e4abd4b
	.xword	0x818d461d1a722e64
	.xword	0xb82584a3e8c2cfea
	.xword	0x02fb1d47555dd72b
	.xword	0x250bf7cbceadabd8
	.xword	0xdfe6ee67dcf13f77
	.xword	0x5b98cfbe3da65b5b
	.xword	0xffe7e7de1cad7816
	.xword	0xc634ddf6c95705db
	.xword	0xe7e4a30a07145cd6
	.xword	0x18dbe5f54e8340d6
	.xword	0x4d4af4c6e0297029
	.xword	0x741a182a50a92d1b
	.xword	0x38a25ae259212b90
	.xword	0xb1dce92a7b8f6ef7
	.xword	0x9e0293e8f3749f1c
	.xword	0xcb98180f8bef530b
	.xword	0x8658634111ef927c
	.xword	0xee2384c6e69448c3
	.xword	0x346a338d6b0b03be
	.xword	0x77c1098344e006bd
	.xword	0x04eef2fcf4cb0823
	.xword	0x27aa26f321ce9e3c
	.xword	0x560c3bc57c6dff44
	.xword	0xbb8cd1ace2958fc4
	.xword	0xd080ec25a6e3b9e7
	.xword	0x3193ac8f5693cd2d
	.xword	0x0ee1f45d92f96414
	.xword	0x26a045c9c4c2f9ea
	.xword	0x3ac4e024dcc94250
	.xword	0x820f965a79850c7f
	.xword	0xa879ba4b7fef3e1c
	.xword	0xf9236ae040703826
	.xword	0xcc1d82a0e7ebd279
	.xword	0x02a86b19a647d1ae
	.xword	0xd4f5c60f3d72b6d8
	.xword	0xfcbc89c507745c1c
	.xword	0x002c56e94f851801
	.xword	0x97ccbc75fb4dc8ff
	.xword	0xe82dc1c412d14475
	.xword	0x804442642655909b
	.xword	0x02e74baf818e4fa9
	.xword	0xeccd1793622342d3
	.xword	0xecaf68c73f31dfd8
	.xword	0x7176f95e5c15990b
	.xword	0x1d97bdef7198cf68
	.xword	0x0c090b07068b5bd5
	.xword	0x7042571edde35794
	.xword	0x9f8ac1af26896910
	.xword	0xa3ea4024916b2fd3
	.xword	0x3e695e119012fb64
	.xword	0xe3bcc825b9ea6771
	.xword	0x896ff6fb60b777a6
	.xword	0x2bfdb8089488351d
	.xword	0x1ffaa9509c9ecfc8
	.xword	0x2272f144e8d046e8
	.xword	0x2eb382fbf584cd36
	.xword	0x141557f6063902da
	.xword	0x20f2aae28189a7d1
	.xword	0xd2bfc1ab6eb8786a
	.xword	0x1b50036c490c8959
	.xword	0x8c851bf83e1dcfa1
	.xword	0x63d1a3878c10d2a1
	.xword	0x2847728f74552a04
	.xword	0x9e1943ec35d86b90
	.xword	0x585a178ff41201f6



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
