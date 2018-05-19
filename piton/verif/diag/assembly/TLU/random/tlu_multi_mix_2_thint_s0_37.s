// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_37.s
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
   random seed:	501325742
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

	setx 0x975c4fc4fe6ccafa, %g1, %g0
	setx 0xacaa2785e85e0aae, %g1, %g1
	setx 0xdae7ab576e09e21c, %g1, %g2
	setx 0xae1dd14b2f0a7ad4, %g1, %g3
	setx 0xb939fcdcc84d38bd, %g1, %g4
	setx 0x6989d5081b65205b, %g1, %g5
	setx 0x3dbd5aa697254b84, %g1, %g6
	setx 0x688044b07b4f7a6f, %g1, %g7
	setx 0xc5b159a6dd15626b, %g1, %r16
	setx 0xebe6b5a16844a15e, %g1, %r17
	setx 0x543fd2dd2916178f, %g1, %r18
	setx 0xc403da00462a033c, %g1, %r19
	setx 0xad2dc5f860b3e624, %g1, %r20
	setx 0xc4708e75853dba59, %g1, %r21
	setx 0x2f55e8948dea952b, %g1, %r22
	setx 0x97066d25d1f84292, %g1, %r23
	setx 0x73243be7170af506, %g1, %r24
	setx 0x747116c0309ae647, %g1, %r25
	setx 0x7824915decc346f7, %g1, %r26
	setx 0xc36dc48ba3540ac2, %g1, %r27
	setx 0xf19d22e99acb1968, %g1, %r28
	setx 0x97761a1c9877b0eb, %g1, %r29
	setx 0x3daa2978d6262810, %g1, %r30
	setx 0xf3aadcb300eba891, %g1, %r31
	save
	setx 0x3957aaee6399b92c, %g1, %r16
	setx 0x8aaa94af91f708d6, %g1, %r17
	setx 0xb7f24ef039e33ff4, %g1, %r18
	setx 0xab5061bea2aa3580, %g1, %r19
	setx 0xcc1cfce452c495a1, %g1, %r20
	setx 0xaa7d1b72147a1af7, %g1, %r21
	setx 0xe1f4b94d02b1d2be, %g1, %r22
	setx 0xf78346a6256a8d20, %g1, %r23
	setx 0x39641de5fddaeb7b, %g1, %r24
	setx 0xba7358f0ca2fc210, %g1, %r25
	setx 0xb2a8f3c05d1d470d, %g1, %r26
	setx 0x94b8c9ae9e176ef8, %g1, %r27
	setx 0x442f6a6eec366c20, %g1, %r28
	setx 0x033bec7044a896ff, %g1, %r29
	setx 0x1f14d21f45af38ae, %g1, %r30
	setx 0x2bf5bf47d3021eae, %g1, %r31
	save
	setx 0x1d5918f7c9bbf07a, %g1, %r16
	setx 0xf85af81381f7cf12, %g1, %r17
	setx 0xca45ed9d0452a3fa, %g1, %r18
	setx 0x228fa101ae789a12, %g1, %r19
	setx 0x005e10ec228b4dfe, %g1, %r20
	setx 0x481cc2a7f33ac6e8, %g1, %r21
	setx 0x2dad3dcde40dfe0a, %g1, %r22
	setx 0x91cd8b8449a12b78, %g1, %r23
	setx 0xe30e9c95d1c1f33e, %g1, %r24
	setx 0xfb730ac7b68ae35a, %g1, %r25
	setx 0xae15a159cf71b68f, %g1, %r26
	setx 0x995c6b0c61f4ebbd, %g1, %r27
	setx 0x1786cd8f3bedf1c4, %g1, %r28
	setx 0xc9a263dbcc594ea2, %g1, %r29
	setx 0xa45ff941498ae9fb, %g1, %r30
	setx 0x21f4f05d085c737c, %g1, %r31
	save
	setx 0x6b607c28e4cde065, %g1, %r16
	setx 0x61c4d4d830450700, %g1, %r17
	setx 0x6d5d91506194d681, %g1, %r18
	setx 0x0ecfbd431c4a1d0e, %g1, %r19
	setx 0xa8df495f84329496, %g1, %r20
	setx 0x7ede055511642ce8, %g1, %r21
	setx 0x6150756b34bcfef1, %g1, %r22
	setx 0xfb6071ead1410e43, %g1, %r23
	setx 0x1ea5fdc87b23f554, %g1, %r24
	setx 0x0518dd8b50b220eb, %g1, %r25
	setx 0xf71dac1b0ffdb51f, %g1, %r26
	setx 0x11cf9f91e47afc31, %g1, %r27
	setx 0x87939e3001aec7f5, %g1, %r28
	setx 0x2ca1ac46f8128f11, %g1, %r29
	setx 0x821138ab634e39de, %g1, %r30
	setx 0xf3d1d90743b7df45, %g1, %r31
	save
	setx 0x7d1a70ab8fc19bb2, %g1, %r16
	setx 0xcfd3c3e7e485273c, %g1, %r17
	setx 0x8ad7d0cd106eeea1, %g1, %r18
	setx 0x5917642fd2e7bbc6, %g1, %r19
	setx 0x775a6485cc3df7b5, %g1, %r20
	setx 0xd2d2b9396a2f7e2a, %g1, %r21
	setx 0xc79c901de9dff546, %g1, %r22
	setx 0xef93440c0f46fadf, %g1, %r23
	setx 0x68481cd405eb2c90, %g1, %r24
	setx 0x1618d8a2e4f3b3d0, %g1, %r25
	setx 0xbf3464bed1b1e7d1, %g1, %r26
	setx 0xdc4a34186066489c, %g1, %r27
	setx 0xe05e852e3f96e584, %g1, %r28
	setx 0x8e790bf7f43b4bd6, %g1, %r29
	setx 0xe6e27924b8b6513a, %g1, %r30
	setx 0xd05f88c0aaa7cb82, %g1, %r31
	save
	setx 0x8cc818e5dd9a6b76, %g1, %r16
	setx 0xf410f69328be6ef6, %g1, %r17
	setx 0x1657d15c4e9b9203, %g1, %r18
	setx 0x94170ec802e614ba, %g1, %r19
	setx 0x5ee09e2c96d26511, %g1, %r20
	setx 0xddc5eb13c537841f, %g1, %r21
	setx 0xb2809ba9a00a1381, %g1, %r22
	setx 0x26236f6b6cc86884, %g1, %r23
	setx 0x1e6d8ac4027570a1, %g1, %r24
	setx 0xa95819157b47316b, %g1, %r25
	setx 0xb843f88ae2a26e9d, %g1, %r26
	setx 0xb46ae9635a95572a, %g1, %r27
	setx 0x6836c31c0795c9c4, %g1, %r28
	setx 0x0b0b28386062b73a, %g1, %r29
	setx 0x3f85ac076572a9d9, %g1, %r30
	setx 0x15820eeca5527723, %g1, %r31
	save
	setx 0x17c713cbfa26703e, %g1, %r16
	setx 0xe048d7aef84c0d1d, %g1, %r17
	setx 0x60aaa81582b4cc28, %g1, %r18
	setx 0xc9b03ce36de6eb7c, %g1, %r19
	setx 0x847c75781d77ec2c, %g1, %r20
	setx 0x3fb37d60a1b82b1f, %g1, %r21
	setx 0xf5a398268a66e69b, %g1, %r22
	setx 0x80d18f43a57cedfb, %g1, %r23
	setx 0x7e5a31fbea4e320f, %g1, %r24
	setx 0x3f05eda65b35de9b, %g1, %r25
	setx 0x6d278ea756870660, %g1, %r26
	setx 0xc07ecbb57d0b9c08, %g1, %r27
	setx 0x96edb257596a5518, %g1, %r28
	setx 0x2fb61b7c394f48d0, %g1, %r29
	setx 0xe6fb84424032151c, %g1, %r30
	setx 0x2e535bd59ef85148, %g1, %r31
	save
	setx 0xd4e96172f88e32d6, %g1, %r16
	setx 0x873a6b9f3494dcd3, %g1, %r17
	setx 0x1c4b21739ab60558, %g1, %r18
	setx 0xf1b0c995558314fd, %g1, %r19
	setx 0x133ab6d31cc00676, %g1, %r20
	setx 0x826c4b27007d8f97, %g1, %r21
	setx 0xbbc013c03a3ee9f4, %g1, %r22
	setx 0x8445bc54e2cd14d9, %g1, %r23
	setx 0x8212f023be899f22, %g1, %r24
	setx 0x0b621f377217687c, %g1, %r25
	setx 0x4a3924eab210a6c7, %g1, %r26
	setx 0x3218ad6459f37998, %g1, %r27
	setx 0x31d309a23d29f63b, %g1, %r28
	setx 0x3d169ed06dd57ecd, %g1, %r29
	setx 0x82bd54e067c01e5c, %g1, %r30
	setx 0x0713535d48ac328c, %g1, %r31
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
	.word 0xb5e5a03f  ! 2: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e4e00c  ! 3: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbd352001  ! 4: SRL_I	srl 	%r20, 0x0001, %r30
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e048  ! 11: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb80c61c7  ! 15: AND_I	and 	%r17, 0x01c7, %r28
	.word 0xb9e421b0  ! 17: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e56022  ! 21: SAVE_I	save	%r21, 0x0001, %r28
	mov	0x308, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a103  ! 25: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb0b54000  ! 26: ORNcc_R	orncc 	%r21, %r0, %r24
	.word 0x81942047  ! 28: WRPR_TPC_I	wrpr	%r16, 0x0047, %tpc
	.word 0xb7510000  ! 31: RDPR_TICK	<illegal instruction>
	.word 0xb5e521b5  ! 33: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb844e197  ! 34: ADDC_I	addc 	%r19, 0x0197, %r28
	.word 0xb1e5e1ba  ! 36: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e521a5  ! 40: SAVE_I	save	%r20, 0x0001, %r25
	setx	data_start_1, %g1, %r20
	.word 0xb7e4609e  ! 42: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e4a185  ! 50: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e4a144  ! 51: SAVE_I	save	%r18, 0x0001, %r24
	mov	2, %r12
	.word 0xa1930000  ! 55: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1641800  ! 59: MOVcc_R	<illegal instruction>
	.word 0xb1e5203a  ! 60: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde520de  ! 62: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde4a0ac  ! 65: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x85942194  ! 67: WRPR_TSTATE_I	wrpr	%r16, 0x0194, %tstate
	.word 0xb9e4a160  ! 68: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe4217c  ! 69: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb025a153  ! 73: SUB_I	sub 	%r22, 0x0153, %r24
	.word 0xb3518000  ! 74: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e42084  ! 76: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x819421bf  ! 80: WRPR_TPC_I	wrpr	%r16, 0x01bf, %tpc
	.word 0xb5e5608f  ! 81: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e5a1ef  ! 86: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e42095  ! 97: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7508000  ! 98: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e4e008  ! 101: SAVE_I	save	%r19, 0x0001, %r27
	mov	1, %r12
	.word 0x8f930000  ! 108: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x899421a1  ! 116: WRPR_TICK_I	wrpr	%r16, 0x01a1, %tick
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3dd000  ! 121: SRAX_R	srax	%r23, %r0, %r30
	.word 0xb7e5e115  ! 122: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb035a0d8  ! 124: ORN_I	orn 	%r22, 0x00d8, %r24
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e09a  ! 131: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe5e054  ! 133: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x59531d9800006d5a, %g1, %r10
	.word 0x839a8000  ! 134: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 139: RDPR_TT	<illegal instruction>
	.word 0xbbe5e1ed  ! 146: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e5e118  ! 149: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e4a1ad  ! 151: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e46053  ! 153: SAVE_I	save	%r17, 0x0001, %r26
	mov	2, %r12
	.word 0xa1930000  ! 156: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb150c000  ! 157: RDPR_TT	<illegal instruction>
	.word 0x8995e1f7  ! 160: WRPR_TICK_I	wrpr	%r23, 0x01f7, %tick
	.word 0xb5e4e0f4  ! 161: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e461bd  ! 162: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e5e189  ! 163: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e5217a  ! 164: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x9d3609f100005f59, %g1, %r10
	.word 0x839a8000  ! 165: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xe9f861ce0000db11, %g1, %r10
	.word 0x819a8000  ! 166: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3e521e6  ! 178: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e46045  ! 181: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe52128  ! 183: SAVE_I	save	%r20, 0x0001, %r31
	mov	0x3a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a1bf  ! 188: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x1120521700007f03, %g1, %r10
	.word 0x819a8000  ! 189: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe46121  ! 191: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x9195e124  ! 194: WRPR_PIL_I	wrpr	%r23, 0x0124, %pil
	mov	0x2d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe421f6  ! 197: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e52122  ! 199: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x8594600f  ! 201: WRPR_TSTATE_I	wrpr	%r17, 0x000f, %tstate
	setx	data_start_0, %g1, %r22
	.word 0xb89d6009  ! 207: XORcc_I	xorcc 	%r21, 0x0009, %r28
	.word 0xbde4e060  ! 210: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x9194a01e  ! 212: WRPR_PIL_I	wrpr	%r18, 0x001e, %pil
	.word 0xbf2cb001  ! 222: SLLX_I	sllx	%r18, 0x0001, %r31
	.word 0xb33cc000  ! 223: SRA_R	sra 	%r19, %r0, %r25
	.word 0xb1e4e1b0  ! 224: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3510000  ! 229: RDPR_TICK	<illegal instruction>
	.word 0xbde521a3  ! 231: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e5e0dc  ! 237: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e421ff  ! 238: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe52084  ! 239: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb634214d  ! 241: ORN_I	orn 	%r16, 0x014d, %r27
	.word 0xb9e42107  ! 247: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8d95201d  ! 248: WRPR_PSTATE_I	wrpr	%r20, 0x001d, %pstate
	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r16
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde460e5  ! 255: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e5a11e  ! 256: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7e4a094  ! 259: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e4205f  ! 262: SAVE_I	save	%r16, 0x0001, %r28
	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1bb  ! 268: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb4958000  ! 269: ORcc_R	orcc 	%r22, %r0, %r26
	.word 0xb7e5a0c9  ! 275: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3e4214e  ! 276: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x81942074  ! 277: WRPR_TPC_I	wrpr	%r16, 0x0074, %tpc
	.word 0x8595e1f6  ! 278: WRPR_TSTATE_I	wrpr	%r23, 0x01f6, %tstate
	.word 0xb7518000  ! 279: RDPR_PSTATE	<illegal instruction>
	.word 0xb9480000  ! 281: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xba140000  ! 282: OR_R	or 	%r16, %r0, %r29
	.word 0xb5e52077  ! 283: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e5e1b9  ! 285: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x91952010  ! 287: WRPR_PIL_I	wrpr	%r20, 0x0010, %pil
	.word 0xb7e420c0  ! 291: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8394e198  ! 292: WRPR_TNPC_I	wrpr	%r19, 0x0198, %tnpc
	.word 0xbbe4e0f5  ! 293: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb02c0000  ! 294: ANDN_R	andn 	%r16, %r0, %r24
	.word 0xb9e42083  ! 296: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5e4e113  ! 297: SAVE_I	save	%r19, 0x0001, %r26
	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3d5000  ! 299: SRAX_R	srax	%r21, %r0, %r31
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a103  ! 308: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5480000  ! 311: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb7e4200b  ! 313: SAVE_I	save	%r16, 0x0001, %r27
	setx	0xd9376c6000002fcf, %g1, %r10
	.word 0x839a8000  ! 314: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x109, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 319: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e56160  ! 321: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x899460b1  ! 323: WRPR_TICK_I	wrpr	%r17, 0x00b1, %tick
	.word 0xb1e5606a  ! 324: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e4e189  ! 326: SAVE_I	save	%r19, 0x0001, %r26
	setx	data_start_5, %g1, %r23
	.word 0xbbe5e0ad  ! 333: SAVE_I	save	%r23, 0x0001, %r29
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 339: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e56103  ! 342: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5a0c9  ! 343: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe5e063  ! 345: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e560d7  ! 350: SAVE_I	save	%r21, 0x0001, %r25
	mov	0, %r12
	.word 0xa1930000  ! 351: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbe5a0b4  ! 352: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb8c521fe  ! 353: ADDCcc_I	addccc 	%r20, 0x01fe, %r28
	.word 0xbf50c000  ! 354: RDPR_TT	<illegal instruction>
	.word 0xbde4e006  ! 359: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x919521d5  ! 361: WRPR_PIL_I	wrpr	%r20, 0x01d5, %pil
	.word 0xbde5a1eb  ! 363: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8194a0e8  ! 365: WRPR_TPC_I	wrpr	%r18, 0x00e8, %tpc
	mov	1, %r12
	.word 0xa1930000  ! 366: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3540000  ! 371: RDPR_GL	<illegal instruction>
	.word 0xb9e4e1a3  ! 372: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe5e0bc  ! 374: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e4a195  ! 376: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e560cd  ! 384: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x731603230000a8de, %g1, %r10
	.word 0x819a8000  ! 385: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbf3db001  ! 388: SRAX_I	srax	%r22, 0x0001, %r31
	.word 0xb7e5615f  ! 391: SAVE_I	save	%r21, 0x0001, %r27
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42062  ! 396: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e4613c  ! 397: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e4602a  ! 398: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1500000  ! 399: RDPR_TPC	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 401: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1e4e117  ! 402: SAVE_I	save	%r19, 0x0001, %r24
	mov	0x17, %o0
	ta	T_SEND_THRD_INTR
	setx	0x107b9f6800006a48, %g1, %r10
	.word 0x839a8000  ! 409: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9500000  ! 411: RDPR_TPC	<illegal instruction>
	.word 0xb3e5e06b  ! 416: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8195a0fe  ! 422: WRPR_TPC_I	wrpr	%r22, 0x00fe, %tpc
	.word 0xb1480000  ! 423: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb1504000  ! 424: RDPR_TNPC	<illegal instruction>
	.word 0xb751c000  ! 427: RDPR_TL	<illegal instruction>
	.word 0x8d95211b  ! 428: WRPR_PSTATE_I	wrpr	%r20, 0x011b, %pstate
	.word 0x9195a145  ! 430: WRPR_PIL_I	wrpr	%r22, 0x0145, %pil
	.word 0xb1e420f3  ! 432: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde4a0a5  ! 433: SAVE_I	save	%r18, 0x0001, %r30
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 437: RDPR_TL	<illegal instruction>
	.word 0xb950c000  ! 441: RDPR_TT	<illegal instruction>
	.word 0xb5e4609c  ! 442: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x9194a1be  ! 444: WRPR_PIL_I	wrpr	%r18, 0x01be, %pil
	.word 0xbbe4e173  ! 446: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x5d4e351900006fcd, %g1, %r10
	.word 0x839a8000  ! 453: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4e023  ! 459: SAVE_I	save	%r19, 0x0001, %r30
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9351000  ! 465: SRLX_R	srlx	%r20, %r0, %r28
	mov	0, %r12
	.word 0xa1930000  ! 466: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3e4a177  ! 468: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe4a054  ! 471: SAVE_I	save	%r18, 0x0001, %r29
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 473: RDPR_TNPC	<illegal instruction>
	setx	data_start_0, %g1, %r21
	.word 0xbf34e001  ! 478: SRL_I	srl 	%r19, 0x0001, %r31
	.word 0xb7e46088  ! 481: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8394a092  ! 484: WRPR_TNPC_I	wrpr	%r18, 0x0092, %tnpc
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194607e  ! 491: WRPR_TPC_I	wrpr	%r17, 0x007e, %tpc
	.word 0xb4450000  ! 494: ADDC_R	addc 	%r20, %r0, %r26
	.word 0xb1e5a065  ! 496: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8d952010  ! 497: WRPR_PSTATE_I	wrpr	%r20, 0x0010, %pstate
	.word 0xbde421b0  ! 499: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9510000  ! 502: RDPR_TICK	<illegal instruction>
	.word 0xbb344000  ! 505: SRL_R	srl 	%r17, %r0, %r29
	.word 0xbde4a0fd  ! 506: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe56110  ! 507: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe4e042  ! 511: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e420d5  ! 514: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e5a180  ! 515: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7510000  ! 517: RDPR_TICK	<illegal instruction>
	.word 0xb1520000  ! 520: RDPR_PIL	<illegal instruction>
	.word 0xbfe5a1a0  ! 522: SAVE_I	save	%r22, 0x0001, %r31
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 527: MOVcc_I	<illegal instruction>
	.word 0xb5e56059  ! 530: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e42038  ! 532: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe460e3  ! 534: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x919520ce  ! 535: WRPR_PIL_I	wrpr	%r20, 0x00ce, %pil
	.word 0xb1e4e0c9  ! 537: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8394e0c7  ! 539: WRPR_TNPC_I	wrpr	%r19, 0x00c7, %tnpc
	.word 0x81956154  ! 543: WRPR_TPC_I	wrpr	%r21, 0x0154, %tpc
	.word 0xbc346036  ! 546: SUBC_I	orn 	%r17, 0x0036, %r30
	.word 0xbde5a162  ! 548: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe5615b  ! 549: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbc45c000  ! 550: ADDC_R	addc 	%r23, %r0, %r30
	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe520ff  ! 553: SAVE_I	save	%r20, 0x0001, %r31
	mov	1, %r12
	.word 0xa1930000  ! 554: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e1d9  ! 569: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe5606e  ! 571: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x63289fdb0000dc0a, %g1, %r10
	.word 0x819a8000  ! 572: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbbe420e8  ! 575: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8595e03d  ! 576: WRPR_TSTATE_I	wrpr	%r23, 0x003d, %tstate
	.word 0xbbe52163  ! 577: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbe3560ed  ! 578: ORN_I	orn 	%r21, 0x00ed, %r31
	.word 0xb7e5e149  ! 583: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e5a0d3  ! 584: SAVE_I	save	%r22, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x30e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e1c5  ! 594: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9510000  ! 595: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 599: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e461d1  ! 603: SAVE_I	save	%r17, 0x0001, %r26
	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a105  ! 616: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e5218b  ! 617: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe4a1f5  ! 619: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbf480000  ! 622: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb0a520ed  ! 623: SUBcc_I	subcc 	%r20, 0x00ed, %r24
	.word 0xbbe4a1b6  ! 628: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e5e1bb  ! 630: SAVE_I	save	%r23, 0x0001, %r28
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r20
	.word 0xbfe4a15d  ! 635: SAVE_I	save	%r18, 0x0001, %r31
	setx	data_start_6, %g1, %r20
	.word 0xb9e4e1ef  ! 639: SAVE_I	save	%r19, 0x0001, %r28
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb518000  ! 647: RDPR_PSTATE	<illegal instruction>
	.word 0xb5540000  ! 652: RDPR_GL	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 654: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb37c4400  ! 656: MOVR_R	movre	%r17, %r0, %r25
	.word 0xb1e5a1b4  ! 657: SAVE_I	save	%r22, 0x0001, %r24
	mov	0x311, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a076  ! 664: SAVE_I	save	%r18, 0x0001, %r24
	setx	data_start_4, %g1, %r23
	.word 0xbde52156  ! 669: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e5a016  ! 671: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e5e038  ! 673: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e4a14c  ! 674: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbf51c000  ! 677: RDPR_TL	<illegal instruction>
	.word 0xb5e4a069  ! 679: SAVE_I	save	%r18, 0x0001, %r26
	mov	0, %r12
	.word 0xa1930000  ! 681: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e421b4  ! 689: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e4e196  ! 690: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9e46145  ! 691: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbf500000  ! 694: RDPR_TPC	<illegal instruction>
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5207c  ! 697: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x879521a2  ! 700: WRPR_TT_I	wrpr	%r20, 0x01a2, %tt
	.word 0xb5e4608f  ! 701: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e46057  ! 702: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e5a025  ! 703: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb6b4c000  ! 705: SUBCcc_R	orncc 	%r19, %r0, %r27
	.word 0x8395e10f  ! 706: WRPR_TNPC_I	wrpr	%r23, 0x010f, %tnpc
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 713: RDPR_TNPC	<illegal instruction>
	.word 0xb5e4a08a  ! 716: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e5e135  ! 719: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbcb40000  ! 721: SUBCcc_R	orncc 	%r16, %r0, %r30
	.word 0xb3348000  ! 725: SRL_R	srl 	%r18, %r0, %r25
	.word 0xb3e560d9  ! 732: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe5a18d  ! 733: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x8995a0e3  ! 742: WRPR_TICK_I	wrpr	%r22, 0x00e3, %tick
	.word 0x8d95a0c9  ! 745: WRPR_PSTATE_I	wrpr	%r22, 0x00c9, %pstate
	mov	1, %r12
	.word 0x8f930000  ! 752: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_1, %g1, %r19
	.word 0xbbe421eb  ! 755: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e4a1d0  ! 757: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe4e039  ! 758: SAVE_I	save	%r19, 0x0001, %r29
	setx	data_start_6, %g1, %r18
	.word 0xb9e5e141  ! 763: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7480000  ! 769: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb1e4a128  ! 770: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x859420e5  ! 774: WRPR_TSTATE_I	wrpr	%r16, 0x00e5, %tstate
	.word 0xb1504000  ! 778: RDPR_TNPC	<illegal instruction>
	.word 0xb3e560c8  ! 783: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e52163  ! 784: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe42186  ! 786: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde5e018  ! 792: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbd480000  ! 797: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbbe52069  ! 798: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e46066  ! 799: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e46022  ! 800: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e46043  ! 804: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e460ea  ! 806: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e46169  ! 807: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbd508000  ! 808: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e52047  ! 809: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe421f1  ! 810: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e46017  ! 813: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe4e173  ! 814: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e4a0ac  ! 815: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e4a166  ! 816: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8394e145  ! 817: WRPR_TNPC_I	wrpr	%r19, 0x0145, %tnpc
	.word 0xb9e5e1d6  ! 819: SAVE_I	save	%r23, 0x0001, %r28
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7508000  ! 824: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e5a166  ! 826: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x899460b1  ! 830: WRPR_TICK_I	wrpr	%r17, 0x00b1, %tick
	.word 0xbbe4204a  ! 831: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8594608a  ! 832: WRPR_TSTATE_I	wrpr	%r17, 0x008a, %tstate
	.word 0xbde5a091  ! 837: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e421c6  ! 838: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e4e12c  ! 840: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbe95a1d7  ! 842: ORcc_I	orcc 	%r22, 0x01d7, %r31
	setx	0xf4bc124c0000df8f, %g1, %r10
	.word 0x819a8000  ! 847: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9e5e1d0  ! 848: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe4608f  ! 851: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbf480000  ! 852: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbde4617c  ! 855: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbe2da18a  ! 857: ANDN_I	andn 	%r22, 0x018a, %r31
	.word 0xb5e42052  ! 859: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e4e04b  ! 861: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbd343001  ! 862: SRLX_I	srlx	%r16, 0x0001, %r30
	.word 0xb151c000  ! 863: RDPR_TL	<illegal instruction>
	.word 0xbb50c000  ! 866: RDPR_TT	<illegal instruction>
	.word 0xb7e561b3  ! 867: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x9cc0ca70000ec10, %g1, %r10
	.word 0x819a8000  ! 868: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x22b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3ca069  ! 884: XNOR_I	xnor 	%r18, 0x0069, %r29
	.word 0xb5e4a19f  ! 885: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e46033  ! 886: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x8195e11a  ! 887: WRPR_TPC_I	wrpr	%r23, 0x011a, %tpc
	.word 0xb23d0000  ! 896: XNOR_R	xnor 	%r20, %r0, %r25
	.word 0xb604c000  ! 897: ADD_R	add 	%r19, %r0, %r27
	.word 0xb684601b  ! 898: ADDcc_I	addcc 	%r17, 0x001b, %r27
	.word 0xb5e5e020  ! 900: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8d95a087  ! 902: WRPR_PSTATE_I	wrpr	%r22, 0x0087, %pstate
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e1d6  ! 904: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbbe4e1e7  ! 906: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x66d7591f00009f49, %g1, %r10
	.word 0x839a8000  ! 908: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbf518000  ! 911: RDPR_PSTATE	<illegal instruction>
	.word 0xbb51c000  ! 913: RDPR_TL	<illegal instruction>
	.word 0x8195a05e  ! 916: WRPR_TPC_I	wrpr	%r22, 0x005e, %tpc
	.word 0xb7e5e09b  ! 918: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e521e3  ! 920: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e4e175  ! 922: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e56013  ! 923: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb0bdc000  ! 925: XNORcc_R	xnorcc 	%r23, %r0, %r24
	.word 0xb1e42052  ! 929: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e42189  ! 932: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e561e7  ! 935: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbf2c7001  ! 936: SLLX_I	sllx	%r17, 0x0001, %r31
	.word 0xb1e4a038  ! 939: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbd50c000  ! 940: RDPR_TT	<illegal instruction>
	.word 0xb5e5e19e  ! 944: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb4348000  ! 946: ORN_R	orn 	%r18, %r0, %r26
	mov	0x328, %o0
	ta	T_SEND_THRD_INTR
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 951: RDPR_GL	<illegal instruction>
	.word 0xb3e42085  ! 952: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e521d9  ! 955: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb751c000  ! 957: RDPR_TL	<illegal instruction>
	.word 0x81942048  ! 958: WRPR_TPC_I	wrpr	%r16, 0x0048, %tpc
	mov	2, %r12
	.word 0xa1930000  ! 959: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3510000  ! 961: RDPR_TICK	<illegal instruction>
	.word 0xb3e5606b  ! 964: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb751c000  ! 965: RDPR_TL	<illegal instruction>
	.word 0xb7480000  ! 966: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb17da401  ! 969: MOVR_I	movre	%r22, 0x1, %r24
	.word 0x8994a0d8  ! 974: WRPR_TICK_I	wrpr	%r18, 0x00d8, %tick
	.word 0xb3510000  ! 975: RDPR_TICK	<illegal instruction>
	.word 0xbbe4619e  ! 980: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x919460cb  ! 983: WRPR_PIL_I	wrpr	%r17, 0x00cb, %pil
	.word 0xb5e461ff  ! 987: SAVE_I	save	%r17, 0x0001, %r26
	setx	data_start_7, %g1, %r17
	setx	data_start_6, %g1, %r17
	.word 0xb7e42040  ! 998: SAVE_I	save	%r16, 0x0001, %r27
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
	.word 0xfd3d0000  ! 1: STDF_R	std	%f30, [%r0, %r20]
	.word 0xbd342001  ! 4: SRL_I	srl 	%r16, 0x0001, %r30
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62ce097  ! 7: STB_I	stb	%r27, [%r19 + 0x0097]
	.word 0xfe2de0d6  ! 8: STB_I	stb	%r31, [%r23 + 0x00d6]
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf025a153  ! 14: STW_I	stw	%r24, [%r22 + 0x0153]
	.word 0xb60d204c  ! 15: AND_I	and 	%r20, 0x004c, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa35c000  ! 20: STH_R	sth	%r29, [%r23 + %r0]
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe240000  ! 23: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xb6b54000  ! 26: ORNcc_R	orncc 	%r21, %r0, %r27
	.word 0xf23c0000  ! 27: STD_R	std	%r25, [%r16 + %r0]
	.word 0x8194a0e5  ! 28: WRPR_TPC_I	wrpr	%r18, 0x00e5, %tpc
	.word 0xb1510000  ! 31: RDPR_TICK	rdpr	%tick, %r24
	.word 0xb245e1ae  ! 34: ADDC_I	addc 	%r23, 0x01ae, %r25
	.word 0xf73c0000  ! 35: STDF_R	std	%f27, [%r0, %r16]
	.word 0xfd3dc000  ! 38: STDF_R	std	%f30, [%r0, %r23]
	setx	data_start_3, %g1, %r21
	.word 0xfc3c211d  ! 43: STD_I	std	%r30, [%r16 + 0x011d]
	.word 0xf025e0bc  ! 46: STW_I	stw	%r24, [%r23 + 0x00bc]
	.word 0xf2756038  ! 47: STX_I	stx	%r25, [%r21 + 0x0038]
	.word 0xf474a02c  ! 52: STX_I	stx	%r26, [%r18 + 0x002c]
	mov	2, %r12
	.word 0xa1930000  ! 55: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbd641800  ! 59: MOVcc_R	<illegal instruction>
	.word 0xf4756069  ! 66: STX_I	stx	%r26, [%r21 + 0x0069]
	.word 0x859520b5  ! 67: WRPR_TSTATE_I	wrpr	%r20, 0x00b5, %tstate
	.word 0xff3d0000  ! 71: STDF_R	std	%f31, [%r0, %r20]
	.word 0xb625e145  ! 73: SUB_I	sub 	%r23, 0x0145, %r27
	.word 0xb1518000  ! 74: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xfc24c000  ! 75: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xf8754000  ! 77: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xfb3d20ab  ! 78: STDF_I	std	%f29, [0x00ab, %r20]
	.word 0x8195a011  ! 80: WRPR_TPC_I	wrpr	%r22, 0x0011, %tpc
	.word 0xfc24a1da  ! 82: STW_I	stw	%r30, [%r18 + 0x01da]
	.word 0xf33c205a  ! 83: STDF_I	std	%f25, [0x005a, %r16]
	.word 0xfc34a16d  ! 85: STH_I	sth	%r30, [%r18 + 0x016d]
	.word 0xf22da0c2  ! 87: STB_I	stb	%r25, [%r22 + 0x00c2]
	.word 0xf03d20f0  ! 92: STD_I	std	%r24, [%r20 + 0x00f0]
	.word 0xfe24a188  ! 94: STW_I	stw	%r31, [%r18 + 0x0188]
	.word 0xf425e03d  ! 95: STW_I	stw	%r26, [%r23 + 0x003d]
	.word 0xb3508000  ! 98: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xf13cc000  ! 100: STDF_R	std	%f24, [%r0, %r19]
	.word 0xf93ca074  ! 104: STDF_I	std	%f28, [0x0074, %r18]
	.word 0xf634a0ff  ! 106: STH_I	sth	%r27, [%r18 + 0x00ff]
	.word 0xfe356153  ! 107: STH_I	sth	%r31, [%r21 + 0x0153]
	mov	1, %r12
	.word 0x8f930000  ! 108: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf074a0ed  ! 112: STX_I	stx	%r24, [%r18 + 0x00ed]
	.word 0xf22c605a  ! 115: STB_I	stb	%r25, [%r17 + 0x005a]
	.word 0x89942043  ! 116: WRPR_TICK_I	wrpr	%r16, 0x0043, %tick
	mov	0x238, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa250000  ! 119: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xfc35a1b6  ! 120: STH_I	sth	%r30, [%r22 + 0x01b6]
	.word 0xbd3c9000  ! 121: SRAX_R	srax	%r18, %r0, %r30
	.word 0xbc352135  ! 124: ORN_I	orn 	%r20, 0x0135, %r30
	.word 0xf6254000  ! 125: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xf23c4000  ! 126: STD_R	std	%r25, [%r17 + %r0]
	mov	0x26, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82460e2  ! 130: STW_I	stw	%r28, [%r17 + 0x00e2]
	.word 0xf8246182  ! 132: STW_I	stw	%r28, [%r17 + 0x0182]
	setx	0x4006664f00001d01, %g1, %r10
	.word 0x839a8000  ! 134: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x22d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 139: RDPR_TT	rdpr	%tt, %r28
	.word 0xf53d8000  ! 141: STDF_R	std	%f26, [%r0, %r22]
	.word 0xfc74207f  ! 142: STX_I	stx	%r30, [%r16 + 0x007f]
	.word 0xff3dc000  ! 147: STDF_R	std	%f31, [%r0, %r23]
	.word 0xf0342139  ! 148: STH_I	sth	%r24, [%r16 + 0x0139]
	.word 0xf424a154  ! 150: STW_I	stw	%r26, [%r18 + 0x0154]
	.word 0xf23ca1df  ! 155: STD_I	std	%r25, [%r18 + 0x01df]
	mov	0, %r12
	.word 0xa1930000  ! 156: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb50c000  ! 157: RDPR_TT	rdpr	%tt, %r29
	.word 0xf674a1d3  ! 159: STX_I	stx	%r27, [%r18 + 0x01d3]
	.word 0x8995608c  ! 160: WRPR_TICK_I	wrpr	%r21, 0x008c, %tick
	setx	0xe524400800003ad8, %g1, %r10
	.word 0x839a8000  ! 165: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xebee1e3400006d0e, %g1, %r10
	.word 0x819a8000  ! 166: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf33c60f0  ! 168: STDF_I	std	%f25, [0x00f0, %r17]
	.word 0xfe3c8000  ! 172: STD_R	std	%r31, [%r18 + %r0]
	.word 0xfe75a008  ! 175: STX_I	stx	%r31, [%r22 + 0x0008]
	.word 0xf33d6163  ! 179: STDF_I	std	%f25, [0x0163, %r21]
	.word 0xf53de06f  ! 180: STDF_I	std	%f26, [0x006f, %r23]
	.word 0xf33d6016  ! 182: STDF_I	std	%f25, [0x0016, %r21]
	mov	0x22b, %o0
	ta	T_SEND_THRD_INTR
	setx	0x5569d9750000ba07, %g1, %r10
	.word 0x819a8000  ! 189: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9195e113  ! 194: WRPR_PIL_I	wrpr	%r23, 0x0113, %pil
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595a108  ! 201: WRPR_TSTATE_I	wrpr	%r22, 0x0108, %tstate
	setx	data_start_7, %g1, %r18
	.word 0xf33de016  ! 204: STDF_I	std	%f25, [0x0016, %r23]
	.word 0xb69ca0cc  ! 207: XORcc_I	xorcc 	%r18, 0x00cc, %r27
	.word 0x9194203a  ! 212: WRPR_PIL_I	wrpr	%r16, 0x003a, %pil
	.word 0xfa356081  ! 213: STH_I	sth	%r29, [%r21 + 0x0081]
	.word 0xfc74e151  ! 218: STX_I	stx	%r30, [%r19 + 0x0151]
	.word 0xf424a049  ! 219: STW_I	stw	%r26, [%r18 + 0x0049]
	.word 0xfe358000  ! 220: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xbf2d7001  ! 222: SLLX_I	sllx	%r21, 0x0001, %r31
	.word 0xb13d0000  ! 223: SRA_R	sra 	%r20, %r0, %r24
	.word 0xb5510000  ! 229: RDPR_TICK	rdpr	%tick, %r26
	.word 0xf33ce02f  ! 234: STDF_I	std	%f25, [0x002f, %r19]
	.word 0xf82da1db  ! 236: STB_I	stb	%r28, [%r22 + 0x01db]
	.word 0xb034a092  ! 241: ORN_I	orn 	%r18, 0x0092, %r24
	.word 0x8d9560f6  ! 248: WRPR_PSTATE_I	wrpr	%r21, 0x00f6, %pstate
	mov	0x228, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	mov	0x311, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6254000  ! 261: STW_R	stw	%r27, [%r21 + %r0]
	mov	0x30c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba958000  ! 269: ORcc_R	orcc 	%r22, %r0, %r29
	.word 0xf22cc000  ! 270: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xf6350000  ! 273: STH_R	sth	%r27, [%r20 + %r0]
	.word 0x819420ce  ! 277: WRPR_TPC_I	wrpr	%r16, 0x00ce, %tpc
	.word 0x85942160  ! 278: WRPR_TSTATE_I	wrpr	%r16, 0x0160, %tstate
	.word 0xbf518000  ! 279: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xb7480000  ! 281: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb8158000  ! 282: OR_R	or 	%r22, %r0, %r28
	.word 0xf8248000  ! 284: STW_R	stw	%r28, [%r18 + %r0]
	.word 0x9195610b  ! 287: WRPR_PIL_I	wrpr	%r21, 0x010b, %pil
	.word 0xf02cc000  ! 290: STB_R	stb	%r24, [%r19 + %r0]
	.word 0x8395e0fe  ! 292: WRPR_TNPC_I	wrpr	%r23, 0x00fe, %tnpc
	.word 0xbc2d8000  ! 294: ANDN_R	andn 	%r22, %r0, %r30
	.word 0xfc75a014  ! 295: STX_I	stx	%r30, [%r22 + 0x0014]
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3c1000  ! 299: SRAX_R	srax	%r16, %r0, %r31
	.word 0xfa3521b9  ! 300: STH_I	sth	%r29, [%r20 + 0x01b9]
	mov	0x109, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63d609f  ! 304: STD_I	std	%r27, [%r21 + 0x009f]
	.word 0xfa754000  ! 306: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xfc35c000  ! 309: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xbd480000  ! 311: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0xffb3db4900006c44, %g1, %r10
	.word 0x839a8000  ! 314: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf23d211f  ! 317: STD_I	std	%r25, [%r20 + 0x011f]
	mov	1, %r12
	.word 0x8f930000  ! 319: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8995a17c  ! 323: WRPR_TICK_I	wrpr	%r22, 0x017c, %tick
	.word 0xfe2d608b  ! 327: STB_I	stb	%r31, [%r21 + 0x008b]
	setx	data_start_1, %g1, %r19
	.word 0xfe24a029  ! 330: STW_I	stw	%r31, [%r18 + 0x0029]
	.word 0xfa25202f  ! 334: STW_I	stw	%r29, [%r20 + 0x002f]
	.word 0xf8344000  ! 336: STH_R	sth	%r28, [%r17 + %r0]
	mov	0x228, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 339: RDPR_TSTATE	rdpr	%tstate, %r30
	mov	1, %r12
	.word 0xa1930000  ! 351: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbec5a01a  ! 353: ADDCcc_I	addccc 	%r22, 0x001a, %r31
	.word 0xb150c000  ! 354: RDPR_TT	rdpr	%tt, %r24
	.word 0xf13da11d  ! 355: STDF_I	std	%f24, [0x011d, %r22]
	.word 0x9194a105  ! 361: WRPR_PIL_I	wrpr	%r18, 0x0105, %pil
	.word 0x8195e1b8  ! 365: WRPR_TPC_I	wrpr	%r23, 0x01b8, %tpc
	mov	2, %r12
	.word 0xa1930000  ! 366: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa3c4000  ! 370: STD_R	std	%r29, [%r17 + %r0]
	.word 0xbd540000  ! 371: RDPR_GL	rdpr	%-, %r30
	.word 0xfc2d0000  ! 377: STB_R	stb	%r30, [%r20 + %r0]
	setx	0xc91f115d0000ba41, %g1, %r10
	.word 0x819a8000  ! 385: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb53df001  ! 388: SRAX_I	srax	%r23, 0x0001, %r26
	.word 0xf8356046  ! 389: STH_I	sth	%r28, [%r21 + 0x0046]
	.word 0xf2350000  ! 390: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xfc3d4000  ! 394: STD_R	std	%r30, [%r21 + %r0]
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 399: RDPR_TPC	rdpr	%tpc, %r25
	mov	0, %r12
	.word 0xa1930000  ! 401: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3c8000  ! 404: STDF_R	std	%f31, [%r0, %r18]
	.word 0xfc344000  ! 405: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xfa35e0eb  ! 406: STH_I	sth	%r29, [%r23 + 0x00eb]
	setx	0xb7cea22c00005ccd, %g1, %r10
	.word 0x839a8000  ! 409: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9500000  ! 411: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xfc35e07b  ! 419: STH_I	sth	%r30, [%r23 + 0x007b]
	.word 0xf62cc000  ! 420: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xfa2d8000  ! 421: STB_R	stb	%r29, [%r22 + %r0]
	.word 0x81956182  ! 422: WRPR_TPC_I	wrpr	%r21, 0x0182, %tpc
	.word 0xbd480000  ! 423: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb3504000  ! 424: RDPR_TNPC	<illegal instruction>
	.word 0xbb51c000  ! 427: RDPR_TL	<illegal instruction>
	.word 0x8d94605c  ! 428: WRPR_PSTATE_I	wrpr	%r17, 0x005c, %pstate
	.word 0xf13d8000  ! 429: STDF_R	std	%f24, [%r0, %r22]
	.word 0x9194a1bd  ! 430: WRPR_PIL_I	wrpr	%r18, 0x01bd, %pil
	.word 0xfe3dc000  ! 434: STD_R	std	%r31, [%r23 + %r0]
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 437: RDPR_TL	rdpr	%tl, %r24
	.word 0xf0240000  ! 438: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf8754000  ! 440: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xbd50c000  ! 441: RDPR_TT	<illegal instruction>
	.word 0xf2258000  ! 443: STW_R	stw	%r25, [%r22 + %r0]
	.word 0x9195e197  ! 444: WRPR_PIL_I	wrpr	%r23, 0x0197, %pil
	.word 0xf8354000  ! 445: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xfc2c8000  ! 447: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xf2248000  ! 452: STW_R	stw	%r25, [%r18 + %r0]
	setx	0x1a56ea11000089cd, %g1, %r10
	.word 0x839a8000  ! 453: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf63c0000  ! 460: STD_R	std	%r27, [%r16 + %r0]
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6740000  ! 464: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xb1341000  ! 465: SRLX_R	srlx	%r16, %r0, %r24
	mov	1, %r12
	.word 0xa1930000  ! 466: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 473: RDPR_TNPC	rdpr	%tnpc, %r25
	setx	data_start_7, %g1, %r18
	.word 0xf73c4000  ! 476: STDF_R	std	%f27, [%r0, %r17]
	.word 0xbd342001  ! 478: SRL_I	srl 	%r16, 0x0001, %r30
	.word 0xfe340000  ! 479: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xfe240000  ! 480: STW_R	stw	%r31, [%r16 + %r0]
	.word 0x83942187  ! 484: WRPR_TNPC_I	wrpr	%r16, 0x0187, %tnpc
	.word 0xf73dc000  ! 487: STDF_R	std	%f27, [%r0, %r23]
	mov	0x110, %o0
	ta	T_SEND_THRD_INTR
	mov	0x224, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc254000  ! 490: STW_R	stw	%r30, [%r21 + %r0]
	.word 0x8194a1e5  ! 491: WRPR_TPC_I	wrpr	%r18, 0x01e5, %tpc
	.word 0xf22c8000  ! 492: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xb8450000  ! 494: ADDC_R	addc 	%r20, %r0, %r28
	.word 0x8d9420e1  ! 497: WRPR_PSTATE_I	wrpr	%r16, 0x00e1, %pstate
	.word 0xb5510000  ! 502: RDPR_TICK	rdpr	%tick, %r26
	.word 0xbd358000  ! 505: SRL_R	srl 	%r22, %r0, %r30
	.word 0xfc2ce145  ! 508: STB_I	stb	%r30, [%r19 + 0x0145]
	.word 0xf63561cf  ! 516: STH_I	sth	%r27, [%r21 + 0x01cf]
	.word 0xb7510000  ! 517: RDPR_TICK	<illegal instruction>
	.word 0xf2250000  ! 518: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xb1520000  ! 520: RDPR_PIL	<illegal instruction>
	.word 0xfc746024  ! 521: STX_I	stx	%r30, [%r17 + 0x0024]
	.word 0xfe258000  ! 523: STW_R	stw	%r31, [%r22 + %r0]
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 527: MOVcc_I	<illegal instruction>
	.word 0xfd3ca1b8  ! 531: STDF_I	std	%f30, [0x01b8, %r18]
	.word 0xfe34c000  ! 533: STH_R	sth	%r31, [%r19 + %r0]
	.word 0x9195e16b  ! 535: WRPR_PIL_I	wrpr	%r23, 0x016b, %pil
	.word 0xfe748000  ! 536: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xf02ca108  ! 538: STB_I	stb	%r24, [%r18 + 0x0108]
	.word 0x839461ea  ! 539: WRPR_TNPC_I	wrpr	%r17, 0x01ea, %tnpc
	.word 0xfb3dc000  ! 542: STDF_R	std	%f29, [%r0, %r23]
	.word 0x81942141  ! 543: WRPR_TPC_I	wrpr	%r16, 0x0141, %tpc
	.word 0xf02d6007  ! 544: STB_I	stb	%r24, [%r21 + 0x0007]
	.word 0xb634e03f  ! 546: SUBC_I	orn 	%r19, 0x003f, %r27
	.word 0xba444000  ! 550: ADDC_R	addc 	%r17, %r0, %r29
	.word 0xff3dc000  ! 551: STDF_R	std	%f31, [%r0, %r23]
	mov	0x12b, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0xa1930000  ! 554: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf6744000  ! 555: STX_R	stx	%r27, [%r17 + %r0]
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75e05c  ! 561: STX_I	stx	%r29, [%r23 + 0x005c]
	.word 0xf074c000  ! 562: STX_R	stx	%r24, [%r19 + %r0]
	setx	0xd495743300001a90, %g1, %r10
	.word 0x819a8000  ! 572: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8595e133  ! 576: WRPR_TSTATE_I	wrpr	%r23, 0x0133, %tstate
	.word 0xb634e1c2  ! 578: ORN_I	orn 	%r19, 0x01c2, %r27
	.word 0xfe35a188  ! 579: STH_I	sth	%r31, [%r22 + 0x0188]
	.word 0xfc348000  ! 581: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xfa756039  ! 585: STX_I	stx	%r29, [%r21 + 0x0039]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf834a06e  ! 591: STH_I	sth	%r28, [%r18 + 0x006e]
	.word 0xbb510000  ! 595: RDPR_TICK	rdpr	%tick, %r29
	.word 0xfd3d8000  ! 596: STDF_R	std	%f30, [%r0, %r22]
	mov	1, %r12
	.word 0x8f930000  ! 599: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf875a0ab  ! 601: STX_I	stx	%r28, [%r22 + 0x00ab]
	mov	0x23f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2254000  ! 612: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xf4248000  ! 613: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xfa34a04f  ! 614: STH_I	sth	%r29, [%r18 + 0x004f]
	.word 0xfe3cc000  ! 618: STD_R	std	%r31, [%r19 + %r0]
	.word 0xfa35a0cc  ! 620: STH_I	sth	%r29, [%r22 + 0x00cc]
	.word 0xf834c000  ! 621: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xb5480000  ! 622: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb6a52095  ! 623: SUBcc_I	subcc 	%r20, 0x0095, %r27
	.word 0xfa344000  ! 624: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf42d8000  ! 631: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xfd3d4000  ! 632: STDF_R	std	%f30, [%r0, %r21]
	mov	0x10b, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r16
	.word 0xf625a059  ! 637: STW_I	stw	%r27, [%r22 + 0x0059]
	setx	data_start_1, %g1, %r20
	.word 0xf635c000  ! 640: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xff3de062  ! 641: STDF_I	std	%f31, [0x0062, %r23]
	mov	0x10b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfd3ce16a  ! 643: STDF_I	std	%f30, [0x016a, %r19]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9518000  ! 647: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xf874a1d4  ! 650: STX_I	stx	%r28, [%r18 + 0x01d4]
	.word 0xbf540000  ! 652: RDPR_GL	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 654: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf83c4000  ! 655: STD_R	std	%r28, [%r17 + %r0]
	.word 0xb17c0400  ! 656: MOVR_R	movre	%r16, %r0, %r24
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63dc000  ! 662: STD_R	std	%r27, [%r23 + %r0]
	.word 0xf235c000  ! 667: STH_R	sth	%r25, [%r23 + %r0]
	setx	data_start_3, %g1, %r23
	.word 0xb951c000  ! 677: RDPR_TL	rdpr	%tl, %r28
	mov	0, %r12
	.word 0xa1930000  ! 681: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf224a040  ! 682: STW_I	stw	%r25, [%r18 + 0x0040]
	.word 0xf475203b  ! 692: STX_I	stx	%r26, [%r20 + 0x003b]
	.word 0xf4744000  ! 693: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xbd500000  ! 694: RDPR_TPC	rdpr	%tpc, %r30
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf13d60db  ! 698: STDF_I	std	%f24, [0x00db, %r21]
	.word 0xfe3ca147  ! 699: STD_I	std	%r31, [%r18 + 0x0147]
	.word 0x879520e1  ! 700: WRPR_TT_I	wrpr	%r20, 0x00e1, %tt
	.word 0xf62d8000  ! 704: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xb8b4c000  ! 705: SUBCcc_R	orncc 	%r19, %r0, %r28
	.word 0x8395a1f4  ! 706: WRPR_TNPC_I	wrpr	%r22, 0x01f4, %tnpc
	mov	0x304, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 713: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xb0b44000  ! 721: SUBCcc_R	orncc 	%r17, %r0, %r24
	.word 0xf22d21e0  ! 724: STB_I	stb	%r25, [%r20 + 0x01e0]
	.word 0xbb358000  ! 725: SRL_R	srl 	%r22, %r0, %r29
	.word 0xf03ce145  ! 736: STD_I	std	%r24, [%r19 + 0x0145]
	.word 0xfa758000  ! 739: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xfe246078  ! 741: STW_I	stw	%r31, [%r17 + 0x0078]
	.word 0x8994e09e  ! 742: WRPR_TICK_I	wrpr	%r19, 0x009e, %tick
	.word 0xf63d8000  ! 743: STD_R	std	%r27, [%r22 + %r0]
	.word 0x8d95e0d5  ! 745: WRPR_PSTATE_I	wrpr	%r23, 0x00d5, %pstate
	.word 0xf22d0000  ! 746: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xfa2d4000  ! 747: STB_R	stb	%r29, [%r21 + %r0]
	mov	0, %r12
	.word 0x8f930000  ! 752: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_3, %g1, %r21
	.word 0xf8744000  ! 759: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xfe746045  ! 761: STX_I	stx	%r31, [%r17 + 0x0045]
	setx	data_start_5, %g1, %r23
	.word 0xf43d20d7  ! 765: STD_I	std	%r26, [%r20 + 0x00d7]
	.word 0xf6758000  ! 766: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xfe244000  ! 768: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xbf480000  ! 769: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x8594a0d5  ! 774: WRPR_TSTATE_I	wrpr	%r18, 0x00d5, %tstate
	.word 0xb9504000  ! 778: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xf73cc000  ! 785: STDF_R	std	%f27, [%r0, %r19]
	.word 0xf27460de  ! 790: STX_I	stx	%r25, [%r17 + 0x00de]
	.word 0xf2758000  ! 791: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xf53cc000  ! 796: STDF_R	std	%f26, [%r0, %r19]
	.word 0xbd480000  ! 797: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfa2d8000  ! 801: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xfc74e089  ! 805: STX_I	stx	%r30, [%r19 + 0x0089]
	.word 0xbf508000  ! 808: RDPR_TSTATE	<illegal instruction>
	.word 0x839461dc  ! 817: WRPR_TNPC_I	wrpr	%r17, 0x01dc, %tnpc
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434c000  ! 822: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xfa2521af  ! 823: STW_I	stw	%r29, [%r20 + 0x01af]
	.word 0xbb508000  ! 824: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf82ca092  ! 825: STB_I	stb	%r28, [%r18 + 0x0092]
	.word 0x8994a048  ! 830: WRPR_TICK_I	wrpr	%r18, 0x0048, %tick
	.word 0x8594e1fc  ! 832: WRPR_TSTATE_I	wrpr	%r19, 0x01fc, %tstate
	.word 0xfc2c60f0  ! 834: STB_I	stb	%r30, [%r17 + 0x00f0]
	.word 0xf53de1ed  ! 836: STDF_I	std	%f26, [0x01ed, %r23]
	.word 0xf23dc000  ! 841: STD_R	std	%r25, [%r23 + %r0]
	.word 0xb4946011  ! 842: ORcc_I	orcc 	%r17, 0x0011, %r26
	setx	0x74d35e2600006c4d, %g1, %r10
	.word 0x819a8000  ! 847: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1480000  ! 852: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf624c000  ! 854: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xb62ca120  ! 857: ANDN_I	andn 	%r18, 0x0120, %r27
	.word 0xbd343001  ! 862: SRLX_I	srlx	%r16, 0x0001, %r30
	.word 0xb351c000  ! 863: RDPR_TL	rdpr	%tl, %r25
	.word 0xf13ce197  ! 864: STDF_I	std	%f24, [0x0197, %r19]
	.word 0xb150c000  ! 866: RDPR_TT	<illegal instruction>
	setx	0x3965f9340000a898, %g1, %r10
	.word 0x819a8000  ! 868: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf62d4000  ! 870: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xfe358000  ! 872: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xf22c60b1  ! 874: STB_I	stb	%r25, [%r17 + 0x00b1]
	.word 0xfd3d4000  ! 875: STDF_R	std	%f30, [%r0, %r21]
	mov	0x115, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0240000  ! 878: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf83d0000  ! 879: STD_R	std	%r28, [%r20 + %r0]
	.word 0xfa358000  ! 880: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xf4350000  ! 882: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xf23ce0b6  ! 883: STD_I	std	%r25, [%r19 + 0x00b6]
	.word 0xb43ca0bf  ! 884: XNOR_I	xnor 	%r18, 0x00bf, %r26
	.word 0x819561ae  ! 887: WRPR_TPC_I	wrpr	%r21, 0x01ae, %tpc
	.word 0xf22ca0dc  ! 888: STB_I	stb	%r25, [%r18 + 0x00dc]
	.word 0xfc2ca0c2  ! 891: STB_I	stb	%r30, [%r18 + 0x00c2]
	.word 0xf03d215a  ! 893: STD_I	std	%r24, [%r20 + 0x015a]
	.word 0xf82c4000  ! 894: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xb83d8000  ! 896: XNOR_R	xnor 	%r22, %r0, %r28
	.word 0xbc054000  ! 897: ADD_R	add 	%r21, %r0, %r30
	.word 0xbc84e15b  ! 898: ADDcc_I	addcc 	%r19, 0x015b, %r30
	.word 0xf43c8000  ! 899: STD_R	std	%r26, [%r18 + %r0]
	.word 0x8d95600f  ! 902: WRPR_PSTATE_I	wrpr	%r21, 0x000f, %pstate
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c0000  ! 905: STB_R	stb	%r31, [%r16 + %r0]
	setx	0x4167f6220000bd0f, %g1, %r10
	.word 0x839a8000  ! 908: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf2742131  ! 909: STX_I	stx	%r25, [%r16 + 0x0131]
	.word 0xbd518000  ! 911: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xf62de1e4  ! 912: STB_I	stb	%r27, [%r23 + 0x01e4]
	.word 0xbd51c000  ! 913: RDPR_TL	<illegal instruction>
	.word 0x81942037  ! 916: WRPR_TPC_I	wrpr	%r16, 0x0037, %tpc
	.word 0xf875211d  ! 919: STX_I	stx	%r28, [%r20 + 0x011d]
	.word 0xb2bc8000  ! 925: XNORcc_R	xnorcc 	%r18, %r0, %r25
	.word 0xf875c000  ! 927: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xf874a188  ! 934: STX_I	stx	%r28, [%r18 + 0x0188]
	.word 0xb92c7001  ! 936: SLLX_I	sllx	%r17, 0x0001, %r28
	.word 0xf23c0000  ! 937: STD_R	std	%r25, [%r16 + %r0]
	.word 0xf07560c7  ! 938: STX_I	stx	%r24, [%r21 + 0x00c7]
	.word 0xbf50c000  ! 940: RDPR_TT	rdpr	%tt, %r31
	.word 0xf8746013  ! 945: STX_I	stx	%r28, [%r17 + 0x0013]
	.word 0xba340000  ! 946: ORN_R	orn 	%r16, %r0, %r29
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	mov	0x3c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 951: RDPR_GL	<illegal instruction>
	.word 0xf82c4000  ! 953: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xf02dc000  ! 954: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xb751c000  ! 957: RDPR_TL	<illegal instruction>
	.word 0x819560f9  ! 958: WRPR_TPC_I	wrpr	%r21, 0x00f9, %tpc
	mov	0, %r12
	.word 0xa1930000  ! 959: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbf510000  ! 961: RDPR_TICK	rdpr	%tick, %r31
	.word 0xf4758000  ! 962: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xbf51c000  ! 965: RDPR_TL	<illegal instruction>
	.word 0xbf480000  ! 966: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbb7de401  ! 969: MOVR_I	movre	%r23, 0x1, %r29
	.word 0xf53de048  ! 972: STDF_I	std	%f26, [0x0048, %r23]
	.word 0x8994609e  ! 974: WRPR_TICK_I	wrpr	%r17, 0x009e, %tick
	.word 0xb7510000  ! 975: RDPR_TICK	rdpr	%tick, %r27
	.word 0x919521bc  ! 983: WRPR_PIL_I	wrpr	%r20, 0x01bc, %pil
	.word 0xf42d606e  ! 984: STB_I	stb	%r26, [%r21 + 0x006e]
	.word 0xf4758000  ! 990: STX_R	stx	%r26, [%r22 + %r0]
	setx	data_start_1, %g1, %r17
	.word 0xfc3d602e  ! 994: STD_I	std	%r30, [%r21 + 0x002e]
	setx	data_start_4, %g1, %r23
	.word 0xf42c4000  ! 997: STB_R	stb	%r26, [%r17 + %r0]
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
	.word 0xb1342001  ! 4: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0xfe5420dd  ! 5: LDSH_I	ldsh	[%r16 + 0x00dd], %r31
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85de082  ! 9: LDX_I	ldx	[%r23 + 0x0082], %r28
	mov	0x10e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0da01d  ! 13: LDUB_I	ldub	[%r22 + 0x001d], %r31
	.word 0xba0de0b3  ! 15: AND_I	and 	%r23, 0x00b3, %r29
	.word 0xf8444000  ! 16: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xfd1da137  ! 18: LDDF_I	ldd	[%r22, 0x0137], %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x305, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b5c000  ! 26: ORNcc_R	orncc 	%r23, %r0, %r28
	.word 0x8195213f  ! 28: WRPR_TPC_I	wrpr	%r20, 0x013f, %tpc
	.word 0xf44c4000  ! 29: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xfa0c6043  ! 30: LDUB_I	ldub	[%r17 + 0x0043], %r29
	.word 0xb7510000  ! 31: RDPR_TICK	<illegal instruction>
	.word 0xfc54600c  ! 32: LDSH_I	ldsh	[%r17 + 0x000c], %r30
	.word 0xba45e1ab  ! 34: ADDC_I	addc 	%r23, 0x01ab, %r29
	setx	data_start_6, %g1, %r20
	.word 0xfe14609f  ! 48: LDUH_I	lduh	[%r17 + 0x009f], %r31
	.word 0xf0542157  ! 49: LDSH_I	ldsh	[%r16 + 0x0157], %r24
	mov	0, %r12
	.word 0xa1930000  ! 55: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf41da1a2  ! 57: LDD_I	ldd	[%r22 + 0x01a2], %r26
	.word 0xbb641800  ! 59: MOVcc_R	<illegal instruction>
	.word 0xfc45c000  ! 61: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xfe55607c  ! 64: LDSH_I	ldsh	[%r21 + 0x007c], %r31
	.word 0x8594e037  ! 67: WRPR_TSTATE_I	wrpr	%r19, 0x0037, %tstate
	.word 0xb0246096  ! 73: SUB_I	sub 	%r17, 0x0096, %r24
	.word 0xbf518000  ! 74: RDPR_PSTATE	<illegal instruction>
	.word 0xfc0dc000  ! 79: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0x8195200f  ! 80: WRPR_TPC_I	wrpr	%r20, 0x000f, %tpc
	.word 0xf44c4000  ! 84: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xf91c2156  ! 89: LDDF_I	ldd	[%r16, 0x0156], %f28
	.word 0xf6040000  ! 90: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xfc5dc000  ! 96: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xbf508000  ! 98: RDPR_TSTATE	<illegal instruction>
	.word 0xf6158000  ! 102: LDUH_R	lduh	[%r22 + %r0], %r27
	.word 0xf0558000  ! 103: LDSH_R	ldsh	[%r22 + %r0], %r24
	mov	0, %r12
	.word 0x8f930000  ! 108: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc0c8000  ! 109: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0x8995205e  ! 116: WRPR_TICK_I	wrpr	%r20, 0x005e, %tick
	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24c209c  ! 118: LDSB_I	ldsb	[%r16 + 0x009c], %r25
	.word 0xb53cd000  ! 121: SRAX_R	srax	%r19, %r0, %r26
	.word 0xf00c604b  ! 123: LDUB_I	ldub	[%r17 + 0x004b], %r24
	.word 0xbc346070  ! 124: ORN_I	orn 	%r17, 0x0070, %r30
	mov	0x114, %o0
	ta	T_SEND_THRD_INTR
	setx	0x8d1014ea00009ada, %g1, %r10
	.word 0x839a8000  ! 134: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x106, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf444c000  ! 136: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xfc1c0000  ! 137: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xb750c000  ! 139: RDPR_TT	<illegal instruction>
	.word 0xfe5d4000  ! 152: LDX_R	ldx	[%r21 + %r0], %r31
	mov	0, %r12
	.word 0xa1930000  ! 156: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb950c000  ! 157: RDPR_TT	<illegal instruction>
	.word 0xf2054000  ! 158: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0x8994e1e0  ! 160: WRPR_TICK_I	wrpr	%r19, 0x01e0, %tick
	setx	0xca38b7a50000dc0d, %g1, %r10
	.word 0x839a8000  ! 165: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xb1fbb0430000dd9a, %g1, %r10
	.word 0x819a8000  ! 166: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf204a153  ! 169: LDUW_I	lduw	[%r18 + 0x0153], %r25
	.word 0xf41c0000  ! 173: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xf00cc000  ! 174: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xf214608a  ! 177: LDUH_I	lduh	[%r17 + 0x008a], %r25
	mov	0x218, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64d0000  ! 186: LDSB_R	ldsb	[%r20 + %r0], %r27
	setx	0x7734120c0000ae93, %g1, %r10
	.word 0x819a8000  ! 189: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf4454000  ! 192: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0x9195e09b  ! 194: WRPR_PIL_I	wrpr	%r23, 0x009b, %pil
	mov	0x23, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf204a014  ! 198: LDUW_I	lduw	[%r18 + 0x0014], %r25
	.word 0x859420c1  ! 201: WRPR_TSTATE_I	wrpr	%r16, 0x00c1, %tstate
	setx	data_start_3, %g1, %r23
	.word 0xf05da0df  ! 203: LDX_I	ldx	[%r22 + 0x00df], %r24
	.word 0xbc9ca146  ! 207: XORcc_I	xorcc 	%r18, 0x0146, %r30
	.word 0x919460b8  ! 212: WRPR_PIL_I	wrpr	%r17, 0x00b8, %pil
	.word 0xf01cc000  ! 214: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xf00de086  ! 215: LDUB_I	ldub	[%r23 + 0x0086], %r24
	.word 0xff1c6106  ! 217: LDDF_I	ldd	[%r17, 0x0106], %f31
	.word 0xfa554000  ! 221: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xbd2c3001  ! 222: SLLX_I	sllx	%r16, 0x0001, %r30
	.word 0xbd3c8000  ! 223: SRA_R	sra 	%r18, %r0, %r30
	.word 0xf2142164  ! 225: LDUH_I	lduh	[%r16 + 0x0164], %r25
	.word 0xfd1ca1c6  ! 228: LDDF_I	ldd	[%r18, 0x01c6], %f30
	.word 0xbb510000  ! 229: RDPR_TICK	<illegal instruction>
	.word 0xf61420fd  ! 233: LDUH_I	lduh	[%r16 + 0x00fd], %r27
	.word 0xf814a13c  ! 235: LDUH_I	lduh	[%r18 + 0x013c], %r28
	.word 0xbe34a142  ! 241: ORN_I	orn 	%r18, 0x0142, %r31
	.word 0xf255e185  ! 244: LDSH_I	ldsh	[%r23 + 0x0185], %r25
	.word 0xf6042140  ! 246: LDUW_I	lduw	[%r16 + 0x0140], %r27
	.word 0x8d94612d  ! 248: WRPR_PSTATE_I	wrpr	%r17, 0x012d, %pstate
	.word 0xf454200f  ! 250: LDSH_I	ldsh	[%r16 + 0x000f], %r26
	mov	0x3d, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r18
	mov	0x112, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf61ca0c3  ! 254: LDD_I	ldd	[%r18 + 0x00c3], %r27
	.word 0xf21da0e8  ! 258: LDD_I	ldd	[%r22 + 0x00e8], %r25
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa54e005  ! 266: LDSH_I	ldsh	[%r19 + 0x0005], %r29
	.word 0xf2058000  ! 267: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xbe958000  ! 269: ORcc_R	orcc 	%r22, %r0, %r31
	.word 0xf80c8000  ! 271: LDUB_R	ldub	[%r18 + %r0], %r28
	.word 0x8195a10b  ! 277: WRPR_TPC_I	wrpr	%r22, 0x010b, %tpc
	.word 0x8594e0a1  ! 278: WRPR_TSTATE_I	wrpr	%r19, 0x00a1, %tstate
	.word 0xb9518000  ! 279: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xfa5421df  ! 280: LDSH_I	ldsh	[%r16 + 0x01df], %r29
	.word 0xbb480000  ! 281: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb8150000  ! 282: OR_R	or 	%r20, %r0, %r28
	.word 0xfa0c6078  ! 286: LDUB_I	ldub	[%r17 + 0x0078], %r29
	.word 0x9194e11e  ! 287: WRPR_PIL_I	wrpr	%r19, 0x011e, %pil
	.word 0x839520c5  ! 292: WRPR_TNPC_I	wrpr	%r20, 0x00c5, %tnpc
	.word 0xbc2c8000  ! 294: ANDN_R	andn 	%r18, %r0, %r30
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3c1000  ! 299: SRAX_R	srax	%r16, %r0, %r29
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe454000  ! 303: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xfb1d4000  ! 305: LDDF_R	ldd	[%r21, %r0], %f29
	.word 0xf80c600c  ! 307: LDUB_I	ldub	[%r17 + 0x000c], %r28
	.word 0xb1480000  ! 311: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf41d6075  ! 312: LDD_I	ldd	[%r21 + 0x0075], %r26
	setx	0x6a5eb10c00001880, %g1, %r10
	.word 0x839a8000  ! 314: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4ce00b  ! 316: LDSB_I	ldsb	[%r19 + 0x000b], %r29
	.word 0xf25d0000  ! 318: LDX_R	ldx	[%r20 + %r0], %r25
	mov	1, %r12
	.word 0x8f930000  ! 319: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf215212e  ! 322: LDUH_I	lduh	[%r20 + 0x012e], %r25
	.word 0x899561a3  ! 323: WRPR_TICK_I	wrpr	%r21, 0x01a3, %tick
	.word 0xf2140000  ! 325: LDUH_R	lduh	[%r16 + %r0], %r25
	setx	data_start_1, %g1, %r19
	.word 0xf41c8000  ! 329: LDD_R	ldd	[%r18 + %r0], %r26
	.word 0xfe158000  ! 331: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0xf81520c9  ! 332: LDUH_I	lduh	[%r20 + 0x00c9], %r28
	.word 0xf0554000  ! 335: LDSH_R	ldsh	[%r21 + %r0], %r24
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 339: RDPR_TSTATE	<illegal instruction>
	.word 0xf65520cf  ! 346: LDSH_I	ldsh	[%r20 + 0x00cf], %r27
	.word 0xfe5d61bb  ! 349: LDX_I	ldx	[%r21 + 0x01bb], %r31
	mov	1, %r12
	.word 0xa1930000  ! 351: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb4c52055  ! 353: ADDCcc_I	addccc 	%r20, 0x0055, %r26
	.word 0xb150c000  ! 354: RDPR_TT	<illegal instruction>
	.word 0xf65da029  ! 357: LDX_I	ldx	[%r22 + 0x0029], %r27
	.word 0xfa05e183  ! 360: LDUW_I	lduw	[%r23 + 0x0183], %r29
	.word 0x9194e0de  ! 361: WRPR_PIL_I	wrpr	%r19, 0x00de, %pil
	.word 0x8194a0d9  ! 365: WRPR_TPC_I	wrpr	%r18, 0x00d9, %tpc
	mov	1, %r12
	.word 0xa1930000  ! 366: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc1c0000  ! 367: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xfe14c000  ! 368: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xbd540000  ! 371: RDPR_GL	<illegal instruction>
	.word 0xfe156160  ! 373: LDUH_I	lduh	[%r21 + 0x0160], %r31
	.word 0xfe1de05b  ! 375: LDD_I	ldd	[%r23 + 0x005b], %r31
	.word 0xfa554000  ! 378: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xf21c0000  ! 381: LDD_R	ldd	[%r16 + %r0], %r25
	.word 0xfc4d6179  ! 383: LDSB_I	ldsb	[%r21 + 0x0179], %r30
	setx	0x96b2df4700004ad0, %g1, %r10
	.word 0x819a8000  ! 385: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf605a163  ! 386: LDUW_I	lduw	[%r22 + 0x0163], %r27
	.word 0xfd1c6002  ! 387: LDDF_I	ldd	[%r17, 0x0002], %f30
	.word 0xb93cb001  ! 388: SRAX_I	srax	%r18, 0x0001, %r28
	.word 0xfe0de087  ! 393: LDUB_I	ldub	[%r23 + 0x0087], %r31
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 399: RDPR_TPC	<illegal instruction>
	.word 0xfc0da195  ! 400: LDUB_I	ldub	[%r22 + 0x0195], %r30
	mov	0, %r12
	.word 0xa1930000  ! 401: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5d8000  ! 407: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xf2550000  ! 408: LDSH_R	ldsh	[%r20 + %r0], %r25
	setx	0x91006150000acc0, %g1, %r10
	.word 0x839a8000  ! 409: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbf500000  ! 411: RDPR_TPC	<illegal instruction>
	.word 0xfe54c000  ! 412: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xf45de060  ! 414: LDX_I	ldx	[%r23 + 0x0060], %r26
	.word 0xfc5c4000  ! 418: LDX_R	ldx	[%r17 + %r0], %r30
	.word 0x819460b1  ! 422: WRPR_TPC_I	wrpr	%r17, 0x00b1, %tpc
	.word 0xb1480000  ! 423: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbb504000  ! 424: RDPR_TNPC	<illegal instruction>
	.word 0xf805e03c  ! 425: LDUW_I	lduw	[%r23 + 0x003c], %r28
	.word 0xbb51c000  ! 427: RDPR_TL	<illegal instruction>
	.word 0x8d94a13e  ! 428: WRPR_PSTATE_I	wrpr	%r18, 0x013e, %pstate
	.word 0x9194a177  ! 430: WRPR_PIL_I	wrpr	%r18, 0x0177, %pil
	mov	0x234, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 437: RDPR_TL	<illegal instruction>
	.word 0xb350c000  ! 441: RDPR_TT	<illegal instruction>
	.word 0x9194a0ae  ! 444: WRPR_PIL_I	wrpr	%r18, 0x00ae, %pil
	.word 0xfa058000  ! 448: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xfa4c0000  ! 449: LDSB_R	ldsb	[%r16 + %r0], %r29
	.word 0xfc044000  ! 450: LDUW_R	lduw	[%r17 + %r0], %r30
	setx	0xa10f27790000991e, %g1, %r10
	.word 0x839a8000  ! 453: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf91d60d5  ! 455: LDDF_I	ldd	[%r21, 0x00d5], %f28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe158000  ! 461: LDUH_R	lduh	[%r22 + %r0], %r31
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40d4000  ! 463: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xb334d000  ! 465: SRLX_R	srlx	%r19, %r0, %r25
	mov	0, %r12
	.word 0xa1930000  ! 466: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf2146089  ! 467: LDUH_I	lduh	[%r17 + 0x0089], %r25
	mov	0x21f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 473: RDPR_TNPC	<illegal instruction>
	.word 0xf40c200f  ! 474: LDUB_I	ldub	[%r16 + 0x000f], %r26
	setx	data_start_0, %g1, %r23
	.word 0xb7342001  ! 478: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xf21d8000  ! 482: LDD_R	ldd	[%r22 + %r0], %r25
	.word 0xf6548000  ! 483: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0x8395a01b  ! 484: WRPR_TNPC_I	wrpr	%r22, 0x001b, %tnpc
	.word 0xfc1ca189  ! 485: LDD_I	ldd	[%r18 + 0x0189], %r30
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	.word 0x81946109  ! 491: WRPR_TPC_I	wrpr	%r17, 0x0109, %tpc
	.word 0xf64c6054  ! 493: LDSB_I	ldsb	[%r17 + 0x0054], %r27
	.word 0xb0450000  ! 494: ADDC_R	addc 	%r20, %r0, %r24
	.word 0x8d95218c  ! 497: WRPR_PSTATE_I	wrpr	%r20, 0x018c, %pstate
	.word 0xf2442134  ! 500: LDSW_I	ldsw	[%r16 + 0x0134], %r25
	.word 0xb9510000  ! 502: RDPR_TICK	<illegal instruction>
	.word 0xf0044000  ! 503: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xbb344000  ! 505: SRL_R	srl 	%r17, %r0, %r29
	.word 0xf71d0000  ! 510: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xb1510000  ! 517: RDPR_TICK	<illegal instruction>
	.word 0xbd520000  ! 520: RDPR_PIL	<illegal instruction>
	mov	0x28, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0d2193  ! 525: LDUB_I	ldub	[%r20 + 0x0193], %r29
	.word 0xbb643801  ! 527: MOVcc_I	<illegal instruction>
	.word 0xf71d2174  ! 528: LDDF_I	ldd	[%r20, 0x0174], %f27
	.word 0xfe1c60bb  ! 529: LDD_I	ldd	[%r17 + 0x00bb], %r31
	.word 0x9194e0fe  ! 535: WRPR_PIL_I	wrpr	%r19, 0x00fe, %pil
	.word 0x8395a108  ! 539: WRPR_TNPC_I	wrpr	%r22, 0x0108, %tnpc
	.word 0xf05d8000  ! 540: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0xfa05a04b  ! 541: LDUW_I	lduw	[%r22 + 0x004b], %r29
	.word 0x8194a0e6  ! 543: WRPR_TPC_I	wrpr	%r18, 0x00e6, %tpc
	.word 0xb035216b  ! 546: SUBC_I	orn 	%r20, 0x016b, %r24
	.word 0xf04c0000  ! 547: LDSB_R	ldsb	[%r16 + %r0], %r24
	.word 0xbc450000  ! 550: ADDC_R	addc 	%r20, %r0, %r30
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0xa1930000  ! 554: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf41c4000  ! 556: LDD_R	ldd	[%r17 + %r0], %r26
	.word 0xf2440000  ! 557: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xf8552107  ! 558: LDSH_I	ldsh	[%r20 + 0x0107], %r28
	mov	0x321, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c0000  ! 564: LDSB_R	ldsb	[%r16 + %r0], %r29
	.word 0xf01d8000  ! 566: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xfe442035  ! 567: LDSW_I	ldsw	[%r16 + 0x0035], %r31
	.word 0xf60dc000  ! 570: LDUB_R	ldub	[%r23 + %r0], %r27
	setx	0xaeca21d700005b47, %g1, %r10
	.word 0x819a8000  ! 572: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf05ce173  ! 573: LDX_I	ldx	[%r19 + 0x0173], %r24
	.word 0xf91d607b  ! 574: LDDF_I	ldd	[%r21, 0x007b], %f28
	.word 0x85956099  ! 576: WRPR_TSTATE_I	wrpr	%r21, 0x0099, %tstate
	.word 0xb03521d6  ! 578: ORN_I	orn 	%r20, 0x01d6, %r24
	.word 0xfe4560e8  ! 580: LDSW_I	ldsw	[%r21 + 0x00e8], %r31
	.word 0xf804a163  ! 582: LDUW_I	lduw	[%r18 + 0x0163], %r28
	.word 0xf85c8000  ! 586: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xfc558000  ! 588: LDSH_R	ldsh	[%r22 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5ce030  ! 593: LDX_I	ldx	[%r19 + 0x0030], %r31
	.word 0xbb510000  ! 595: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 599: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xff1c2056  ! 600: LDDF_I	ldd	[%r16, 0x0056], %f31
	.word 0xf4540000  ! 602: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xf41d2142  ! 604: LDD_I	ldd	[%r20 + 0x0142], %r26
	.word 0xf05c60c1  ! 605: LDX_I	ldx	[%r17 + 0x00c1], %r24
	.word 0xf64cc000  ! 607: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xf414a14b  ! 608: LDUH_I	lduh	[%r18 + 0x014b], %r26
	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa45a0e4  ! 610: LDSW_I	ldsw	[%r22 + 0x00e4], %r29
	.word 0xf8144000  ! 611: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xf20c4000  ! 615: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0xb5480000  ! 622: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb4a52065  ! 623: SUBcc_I	subcc 	%r20, 0x0065, %r26
	.word 0xfe1560ae  ! 625: LDUH_I	lduh	[%r21 + 0x00ae], %r31
	.word 0xf01521f7  ! 626: LDUH_I	lduh	[%r20 + 0x01f7], %r24
	.word 0xf8548000  ! 629: LDSH_R	ldsh	[%r18 + %r0], %r28
	mov	0x301, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	setx	data_start_5, %g1, %r16
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5d6165  ! 644: LDX_I	ldx	[%r21 + 0x0165], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7518000  ! 647: RDPR_PSTATE	<illegal instruction>
	.word 0xf8454000  ! 648: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xf40c2121  ! 649: LDUB_I	ldub	[%r16 + 0x0121], %r26
	.word 0xfa040000  ! 651: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xb9540000  ! 652: RDPR_GL	<illegal instruction>
	.word 0xf01c60d0  ! 653: LDD_I	ldd	[%r17 + 0x00d0], %r24
	mov	1, %r12
	.word 0x8f930000  ! 654: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbd7d0400  ! 656: MOVR_R	movre	%r20, %r0, %r30
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5c0000  ! 660: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xf84420f7  ! 661: LDSW_I	ldsw	[%r16 + 0x00f7], %r28
	.word 0xfa5c0000  ! 663: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xfc5de1c3  ! 665: LDX_I	ldx	[%r23 + 0x01c3], %r30
	setx	data_start_5, %g1, %r19
	.word 0xf015c000  ! 676: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xbb51c000  ! 677: RDPR_TL	<illegal instruction>
	.word 0xf31c2084  ! 678: LDDF_I	ldd	[%r16, 0x0084], %f25
	mov	2, %r12
	.word 0xa1930000  ! 681: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa1c8000  ! 685: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0xfe1d8000  ! 687: LDD_R	ldd	[%r22 + %r0], %r31
	.word 0xf00d8000  ! 688: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0xbb500000  ! 694: RDPR_TPC	<illegal instruction>
	mov	0x320, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879420a3  ! 700: WRPR_TT_I	wrpr	%r16, 0x00a3, %tt
	.word 0xbeb4c000  ! 705: SUBCcc_R	orncc 	%r19, %r0, %r31
	.word 0x8394e03b  ! 706: WRPR_TNPC_I	wrpr	%r19, 0x003b, %tnpc
	mov	0x119, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf214602c  ! 709: LDUH_I	lduh	[%r17 + 0x002c], %r25
	.word 0xfb1c4000  ! 711: LDDF_R	ldd	[%r17, %r0], %f29
	.word 0xf45d0000  ! 712: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0xbd504000  ! 713: RDPR_TNPC	<illegal instruction>
	.word 0xf4050000  ! 718: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xbab50000  ! 721: SUBCcc_R	orncc 	%r20, %r0, %r29
	.word 0xf455a02f  ! 722: LDSH_I	ldsh	[%r22 + 0x002f], %r26
	.word 0xb1358000  ! 725: SRL_R	srl 	%r22, %r0, %r24
	.word 0xfc448000  ! 726: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xf25d20b6  ! 728: LDX_I	ldx	[%r20 + 0x00b6], %r25
	.word 0xf31d6032  ! 730: LDDF_I	ldd	[%r21, 0x0032], %f25
	.word 0xf4058000  ! 731: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xf80d61e6  ! 734: LDUB_I	ldub	[%r21 + 0x01e6], %r28
	.word 0x89946012  ! 742: WRPR_TICK_I	wrpr	%r17, 0x0012, %tick
	.word 0x8d94a1bf  ! 745: WRPR_PSTATE_I	wrpr	%r18, 0x01bf, %pstate
	.word 0xf00ce0be  ! 749: LDUB_I	ldub	[%r19 + 0x00be], %r24
	mov	1, %r12
	.word 0x8f930000  ! 752: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_3, %g1, %r20
	.word 0xf24da07b  ! 760: LDSB_I	ldsb	[%r22 + 0x007b], %r25
	setx	data_start_4, %g1, %r16
	.word 0xfa05c000  ! 764: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0xfc55c000  ! 767: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xbb480000  ! 769: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x8594e013  ! 774: WRPR_TSTATE_I	wrpr	%r19, 0x0013, %tstate
	.word 0xf655c000  ! 775: LDSH_R	ldsh	[%r23 + %r0], %r27
	.word 0xfe150000  ! 776: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xb5504000  ! 778: RDPR_TNPC	<illegal instruction>
	.word 0xfe1c0000  ! 789: LDD_R	ldd	[%r16 + %r0], %r31
	.word 0xf614e1e3  ! 793: LDUH_I	lduh	[%r19 + 0x01e3], %r27
	.word 0xb9480000  ! 797: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf91c61e7  ! 803: LDDF_I	ldd	[%r17, 0x01e7], %f28
	.word 0xbd508000  ! 808: RDPR_TSTATE	<illegal instruction>
	.word 0xfa5d20eb  ! 811: LDX_I	ldx	[%r20 + 0x00eb], %r29
	.word 0xf6556080  ! 812: LDSH_I	ldsh	[%r21 + 0x0080], %r27
	.word 0x8395e1d1  ! 817: WRPR_TNPC_I	wrpr	%r23, 0x01d1, %tnpc
	.word 0xfa14c000  ! 818: LDUH_R	lduh	[%r19 + %r0], %r29
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05d4000  ! 821: LDX_R	ldx	[%r21 + %r0], %r24
	.word 0xb9508000  ! 824: RDPR_TSTATE	<illegal instruction>
	.word 0xfc14a198  ! 828: LDUH_I	lduh	[%r18 + 0x0198], %r30
	.word 0x8995215c  ! 830: WRPR_TICK_I	wrpr	%r20, 0x015c, %tick
	.word 0x859460e2  ! 832: WRPR_TSTATE_I	wrpr	%r17, 0x00e2, %tstate
	.word 0xf24dc000  ! 833: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xfc158000  ! 835: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xbc956198  ! 842: ORcc_I	orcc 	%r21, 0x0198, %r30
	.word 0xf005c000  ! 846: LDUW_R	lduw	[%r23 + %r0], %r24
	setx	0x8b4b2f230000b849, %g1, %r10
	.word 0x819a8000  ! 847: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5480000  ! 852: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf415e06c  ! 853: LDUH_I	lduh	[%r23 + 0x006c], %r26
	.word 0xb82da0e1  ! 857: ANDN_I	andn 	%r22, 0x00e1, %r28
	.word 0xfa142107  ! 860: LDUH_I	lduh	[%r16 + 0x0107], %r29
	.word 0xbf34f001  ! 862: SRLX_I	srlx	%r19, 0x0001, %r31
	.word 0xb351c000  ! 863: RDPR_TL	<illegal instruction>
	.word 0xfa1d4000  ! 865: LDD_R	ldd	[%r21 + %r0], %r29
	.word 0xb750c000  ! 866: RDPR_TT	<illegal instruction>
	setx	0xa16c1a330000dad6, %g1, %r10
	.word 0x819a8000  ! 868: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc4d0000  ! 869: LDSB_R	ldsb	[%r20 + %r0], %r30
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3de05b  ! 884: XNOR_I	xnor 	%r23, 0x005b, %r31
	.word 0x81952024  ! 887: WRPR_TPC_I	wrpr	%r20, 0x0024, %tpc
	.word 0xf64c4000  ! 889: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xf6148000  ! 892: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xf244215b  ! 895: LDSW_I	ldsw	[%r16 + 0x015b], %r25
	.word 0xbe3d8000  ! 896: XNOR_R	xnor 	%r22, %r0, %r31
	.word 0xbc054000  ! 897: ADD_R	add 	%r21, %r0, %r30
	.word 0xb6846180  ! 898: ADDcc_I	addcc 	%r17, 0x0180, %r27
	.word 0x8d956154  ! 902: WRPR_PSTATE_I	wrpr	%r21, 0x0154, %pstate
	mov	0x21f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4dc000  ! 907: LDSB_R	ldsb	[%r23 + %r0], %r31
	setx	0x4d236d170000fe46, %g1, %r10
	.word 0x839a8000  ! 908: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc05e082  ! 910: LDUW_I	lduw	[%r23 + 0x0082], %r30
	.word 0xb9518000  ! 911: RDPR_PSTATE	<illegal instruction>
	.word 0xb151c000  ! 913: RDPR_TL	<illegal instruction>
	.word 0xfa44e0b3  ! 914: LDSW_I	ldsw	[%r19 + 0x00b3], %r29
	.word 0xf204e143  ! 915: LDUW_I	lduw	[%r19 + 0x0143], %r25
	.word 0x81956156  ! 916: WRPR_TPC_I	wrpr	%r21, 0x0156, %tpc
	.word 0xfc0d607f  ! 924: LDUB_I	ldub	[%r21 + 0x007f], %r30
	.word 0xbabc0000  ! 925: XNORcc_R	xnorcc 	%r16, %r0, %r29
	.word 0xfe55c000  ! 926: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xf71d0000  ! 928: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xf214a089  ! 930: LDUH_I	lduh	[%r18 + 0x0089], %r25
	.word 0xfa5cc000  ! 933: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xb32db001  ! 936: SLLX_I	sllx	%r22, 0x0001, %r25
	.word 0xbd50c000  ! 940: RDPR_TT	rdpr	%tt, %r30
	.word 0xb8350000  ! 946: ORN_R	orn 	%r20, %r0, %r28
	.word 0xfa5c4000  ! 947: LDX_R	ldx	[%r17 + %r0], %r29
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20dc000  ! 949: LDUB_R	ldub	[%r23 + %r0], %r25
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 951: RDPR_GL	<illegal instruction>
	.word 0xf64d8000  ! 956: LDSB_R	ldsb	[%r22 + %r0], %r27
	.word 0xb751c000  ! 957: RDPR_TL	<illegal instruction>
	.word 0x819461b2  ! 958: WRPR_TPC_I	wrpr	%r17, 0x01b2, %tpc
	mov	0, %r12
	.word 0xa1930000  ! 959: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbd510000  ! 961: RDPR_TICK	rdpr	%tick, %r30
	.word 0xf61c208c  ! 963: LDD_I	ldd	[%r16 + 0x008c], %r27
	.word 0xbb51c000  ! 965: RDPR_TL	<illegal instruction>
	.word 0xbf480000  ! 966: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf2054000  ! 967: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xb97ce401  ! 969: MOVR_I	movre	%r19, 0x1, %r28
	.word 0xfe0ca051  ! 971: LDUB_I	ldub	[%r18 + 0x0051], %r31
	.word 0x8994a111  ! 974: WRPR_TICK_I	wrpr	%r18, 0x0111, %tick
	.word 0xbf510000  ! 975: RDPR_TICK	<illegal instruction>
	.word 0xf445202e  ! 976: LDSW_I	ldsw	[%r20 + 0x002e], %r26
	.word 0xf6558000  ! 979: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0x9194e0cc  ! 983: WRPR_PIL_I	wrpr	%r19, 0x00cc, %pil
	.word 0xf00d8000  ! 985: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0xfa4c20b7  ! 986: LDSB_I	ldsb	[%r16 + 0x00b7], %r29
	.word 0xf45c8000  ! 988: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xf244a04a  ! 991: LDSW_I	ldsw	[%r18 + 0x004a], %r25
	setx	data_start_2, %g1, %r21
	.word 0xfc548000  ! 993: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xf71d4000  ! 995: LDDF_R	ldd	[%r21, %r0], %f27
	setx	data_start_7, %g1, %r17
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbf34e001  ! 4: SRL_I	srl 	%r19, 0x0001, %r31
	mov	0x221, %o0
	ta	T_SEND_THRD_INTR
	mov	0x110, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81c20  ! 12: FMOVRGEZ	dis not found

	.word 0xb20de022  ! 15: AND_I	and 	%r23, 0x0022, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x238, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 24: FMOVRGEZ	dis not found

	.word 0xbab40000  ! 26: ORNcc_R	orncc 	%r16, %r0, %r29
	.word 0x819460c3  ! 28: WRPR_TPC_I	wrpr	%r17, 0x00c3, %tpc
	.word 0xb1510000  ! 31: RDPR_TICK	<illegal instruction>
	.word 0xbe44e03f  ! 34: ADDC_I	addc 	%r19, 0x003f, %r31
	.word 0xb7ab4820  ! 37: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbda80420  ! 39: FMOVRZ	dis not found

	setx	data_start_7, %g1, %r20
	.word 0xb3a98820  ! 44: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb5abc820  ! 45: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb1a58840  ! 53: FADDd	faddd	%f22, %f0, %f24
	.word 0xb1a58820  ! 54: FADDs	fadds	%f22, %f0, %f24
	mov	1, %r12
	.word 0xa1930000  ! 55: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5a00560  ! 56: FSQRTq	fsqrt	
	.word 0xbba00560  ! 58: FSQRTq	fsqrt	
	.word 0xbd641800  ! 59: MOVcc_R	<illegal instruction>
	.word 0xb1a54940  ! 63: FMULd	fmuld	%f52, %f0, %f24
	.word 0x8595a11f  ! 67: WRPR_TSTATE_I	wrpr	%r22, 0x011f, %tstate
	.word 0xbfa00520  ! 70: FSQRTs	fsqrt	
	.word 0xbda4c8c0  ! 72: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xbe2560c3  ! 73: SUB_I	sub 	%r21, 0x00c3, %r31
	.word 0xbf518000  ! 74: RDPR_PSTATE	<illegal instruction>
	.word 0x81942192  ! 80: WRPR_TPC_I	wrpr	%r16, 0x0192, %tpc
	.word 0xb7a589a0  ! 88: FDIVs	fdivs	%f22, %f0, %f27
	.word 0xbda00040  ! 91: FMOVd	fmovd	%f0, %f30
	.word 0xbda50820  ! 93: FADDs	fadds	%f20, %f0, %f30
	.word 0xb5508000  ! 98: RDPR_TSTATE	<illegal instruction>
	.word 0xbba588c0  ! 99: FSUBd	fsubd	%f22, %f0, %f60
	.word 0xb1a4c960  ! 105: FMULq	dis not found

	mov	0, %r12
	.word 0x8f930000  ! 108: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3a549a0  ! 110: FDIVs	fdivs	%f21, %f0, %f25
	.word 0xb7aa0820  ! 111: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbba00520  ! 113: FSQRTs	fsqrt	
	.word 0xbba00520  ! 114: FSQRTs	fsqrt	
	.word 0x8995a1c3  ! 116: WRPR_TICK_I	wrpr	%r22, 0x01c3, %tick
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3d9000  ! 121: SRAX_R	srax	%r22, %r0, %r31
	.word 0xb43560e4  ! 124: ORN_I	orn 	%r21, 0x00e4, %r26
	.word 0xbfa449e0  ! 127: FDIVq	dis not found

	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 129: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	setx	0xdf63d7220000cc92, %g1, %r10
	.word 0x839a8000  ! 134: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x30b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 138: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb150c000  ! 139: RDPR_TT	<illegal instruction>
	.word 0xb9ab0820  ! 140: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb5a98820  ! 143: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb9a448e0  ! 144: FSUBq	dis not found

	.word 0xb9a4c820  ! 145: FADDs	fadds	%f19, %f0, %f28
	.word 0xbda00040  ! 154: FMOVd	fmovd	%f0, %f30
	mov	1, %r12
	.word 0xa1930000  ! 156: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb350c000  ! 157: RDPR_TT	<illegal instruction>
	.word 0x899560b2  ! 160: WRPR_TICK_I	wrpr	%r21, 0x00b2, %tick
	setx	0x1919d82a00004806, %g1, %r10
	.word 0x839a8000  ! 165: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xa88fccfd0000fb9a, %g1, %r10
	.word 0x819a8000  ! 166: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa90820  ! 167: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbfabc820  ! 170: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb3a94820  ! 171: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbda40920  ! 176: FMULs	fmuls	%f16, %f0, %f30
	.word 0xb1a94820  ! 184: FMOVCS	fmovs	%fcc1, %f0, %f24
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00040  ! 187: FMOVd	fmovd	%f0, %f28
	setx	0xd58edf8000000ac0, %g1, %r10
	.word 0x819a8000  ! 189: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba84820  ! 190: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbba00560  ! 193: FSQRTq	fsqrt	
	.word 0x9195e015  ! 194: WRPR_PIL_I	wrpr	%r23, 0x0015, %pil
	.word 0xbdaa8820  ! 195: FMOVG	fmovs	%fcc1, %f0, %f30
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbabc820  ! 200: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0x8594e1f7  ! 201: WRPR_TSTATE_I	wrpr	%r19, 0x01f7, %tstate
	setx	data_start_0, %g1, %r17
	.word 0xbda00520  ! 205: FSQRTs	fsqrt	
	.word 0xb1a88820  ! 206: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb49d203d  ! 207: XORcc_I	xorcc 	%r20, 0x003d, %r26
	.word 0xbda448c0  ! 208: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xb7a58840  ! 209: FADDd	faddd	%f22, %f0, %f58
	.word 0xbfab0820  ! 211: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0x9194e036  ! 212: WRPR_PIL_I	wrpr	%r19, 0x0036, %pil
	.word 0xbba50860  ! 216: FADDq	dis not found

	.word 0xbd2cf001  ! 222: SLLX_I	sllx	%r19, 0x0001, %r30
	.word 0xbb3d8000  ! 223: SRA_R	sra 	%r22, %r0, %r29
	.word 0xb3a00540  ! 226: FSQRTd	fsqrt	
	.word 0xb1a44840  ! 227: FADDd	faddd	%f48, %f0, %f24
	.word 0xbd510000  ! 229: RDPR_TICK	<illegal instruction>
	.word 0xb9a508e0  ! 230: FSUBq	dis not found

	.word 0xb9a8c820  ! 232: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb5a5c820  ! 240: FADDs	fadds	%f23, %f0, %f26
	.word 0xb635a1a1  ! 241: ORN_I	orn 	%r22, 0x01a1, %r27
	.word 0xb5a54860  ! 242: FADDq	dis not found

	.word 0xb3a449e0  ! 243: FDIVq	dis not found

	.word 0xb1a81420  ! 245: FMOVRNZ	dis not found

	.word 0x8d9460e8  ! 248: WRPR_PSTATE_I	wrpr	%r17, 0x00e8, %pstate
	.word 0xb3a00560  ! 249: FSQRTq	fsqrt	
	mov	0x32d, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r22
	mov	0x21f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 257: FSQRTq	fsqrt	
	.word 0xbda40920  ! 260: FMULs	fmuls	%f16, %f0, %f30
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 264: FMOVRGEZ	dis not found

	.word 0xb3a81820  ! 265: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb4940000  ! 269: ORcc_R	orcc 	%r16, %r0, %r26
	.word 0xbda50940  ! 272: FMULd	fmuld	%f20, %f0, %f30
	.word 0xbda81420  ! 274: FMOVRNZ	dis not found

	.word 0x8195a064  ! 277: WRPR_TPC_I	wrpr	%r22, 0x0064, %tpc
	.word 0x85956125  ! 278: WRPR_TSTATE_I	wrpr	%r21, 0x0125, %tstate
	.word 0xb5518000  ! 279: RDPR_PSTATE	<illegal instruction>
	.word 0xbd480000  ! 281: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb2154000  ! 282: OR_R	or 	%r21, %r0, %r25
	.word 0x9195a158  ! 287: WRPR_PIL_I	wrpr	%r22, 0x0158, %pil
	.word 0xb5a409e0  ! 288: FDIVq	dis not found

	.word 0xb3a80420  ! 289: FMOVRZ	dis not found

	.word 0x8395e147  ! 292: WRPR_TNPC_I	wrpr	%r23, 0x0147, %tnpc
	.word 0xb02d4000  ! 294: ANDN_R	andn 	%r21, %r0, %r24
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3c9000  ! 299: SRAX_R	srax	%r18, %r0, %r29
	.word 0xb5a4c9e0  ! 301: FDIVq	dis not found

	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa44920  ! 310: FMULs	fmuls	%f17, %f0, %f31
	.word 0xbb480000  ! 311: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	0xc771077b00008e9c, %g1, %r10
	.word 0x839a8000  ! 314: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 319: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9a588a0  ! 320: FSUBs	fsubs	%f22, %f0, %f28
	.word 0x8994605f  ! 323: WRPR_TICK_I	wrpr	%r17, 0x005f, %tick
	setx	data_start_4, %g1, %r16
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c8a0  ! 338: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xbf508000  ! 339: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a58960  ! 340: FMULq	dis not found

	.word 0xbfabc820  ! 341: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb7aa0820  ! 344: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb5a00520  ! 347: FSQRTs	fsqrt	
	.word 0xb5aa0820  ! 348: FMOVA	fmovs	%fcc1, %f0, %f26
	mov	1, %r12
	.word 0xa1930000  ! 351: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbcc46156  ! 353: ADDCcc_I	addccc 	%r17, 0x0156, %r30
	.word 0xb350c000  ! 354: RDPR_TT	<illegal instruction>
	.word 0xbda448c0  ! 356: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xb3a00020  ! 358: FMOVs	fmovs	%f0, %f25
	.word 0x91952187  ! 361: WRPR_PIL_I	wrpr	%r20, 0x0187, %pil
	.word 0xb7aac820  ! 362: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a8c820  ! 364: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0x8195e121  ! 365: WRPR_TPC_I	wrpr	%r23, 0x0121, %tpc
	mov	0, %r12
	.word 0xa1930000  ! 366: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1a80820  ! 369: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb1540000  ! 371: RDPR_GL	<illegal instruction>
	.word 0xb3a4c9c0  ! 379: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xbba80420  ! 380: FMOVRZ	dis not found

	.word 0xb7a489a0  ! 382: FDIVs	fdivs	%f18, %f0, %f27
	setx	0x40f505de0000d99b, %g1, %r10
	.word 0x819a8000  ! 385: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbd3df001  ! 388: SRAX_I	srax	%r23, 0x0001, %r30
	.word 0xb1a00520  ! 392: FSQRTs	fsqrt	
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 399: RDPR_TPC	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 401: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x220, %o0
	ta	T_SEND_THRD_INTR
	setx	0x5bca745b0000fa1d, %g1, %r10
	.word 0x839a8000  ! 409: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbda00560  ! 410: FSQRTq	fsqrt	
	.word 0xb3500000  ! 411: RDPR_TPC	<illegal instruction>
	.word 0xb7a00560  ! 413: FSQRTq	fsqrt	
	.word 0xb3a80820  ! 415: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb1a9c820  ! 417: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0x8194a16c  ! 422: WRPR_TPC_I	wrpr	%r18, 0x016c, %tpc
	.word 0xb1480000  ! 423: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb7504000  ! 424: RDPR_TNPC	<illegal instruction>
	.word 0xbfa00560  ! 426: FSQRTq	fsqrt	
	.word 0xbd51c000  ! 427: RDPR_TL	<illegal instruction>
	.word 0x8d9461c5  ! 428: WRPR_PSTATE_I	wrpr	%r17, 0x01c5, %pstate
	.word 0x91942156  ! 430: WRPR_PIL_I	wrpr	%r16, 0x0156, %pil
	.word 0xb9a5c960  ! 431: FMULq	dis not found

	.word 0xbda54820  ! 435: FADDs	fadds	%f21, %f0, %f30
	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 437: RDPR_TL	<illegal instruction>
	.word 0xb5a84820  ! 439: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb350c000  ! 441: RDPR_TT	<illegal instruction>
	.word 0x919521a2  ! 444: WRPR_PIL_I	wrpr	%r20, 0x01a2, %pil
	.word 0xbfabc820  ! 451: FMOVVC	fmovs	%fcc1, %f0, %f31
	setx	0xda84d65500003b92, %g1, %r10
	.word 0x839a8000  ! 453: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1abc820  ! 454: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbba9c820  ! 456: FMOVVS	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9345000  ! 465: SRLX_R	srlx	%r17, %r0, %r28
	mov	1, %r12
	.word 0xa1930000  ! 466: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda4c840  ! 469: FADDd	faddd	%f50, %f0, %f30
	.word 0xbfa80820  ! 470: FMOVN	fmovs	%fcc1, %f0, %f31
	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 473: RDPR_TNPC	<illegal instruction>
	setx	data_start_3, %g1, %r23
	.word 0xb9aa4820  ! 477: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbd352001  ! 478: SRL_I	srl 	%r20, 0x0001, %r30
	.word 0x839461cd  ! 484: WRPR_TNPC_I	wrpr	%r17, 0x01cd, %tnpc
	.word 0xb3abc820  ! 486: FMOVVC	fmovs	%fcc1, %f0, %f25
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x132, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194611f  ! 491: WRPR_TPC_I	wrpr	%r17, 0x011f, %tpc
	.word 0xbe444000  ! 494: ADDC_R	addc 	%r17, %r0, %r31
	.word 0xbdaa4820  ! 495: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0x8d95207b  ! 497: WRPR_PSTATE_I	wrpr	%r20, 0x007b, %pstate
	.word 0xb7ab8820  ! 498: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a90820  ! 501: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb9510000  ! 502: RDPR_TICK	<illegal instruction>
	.word 0xbda81c20  ! 504: FMOVRGEZ	dis not found

	.word 0xb334c000  ! 505: SRL_R	srl 	%r19, %r0, %r25
	.word 0xb3a588c0  ! 509: FSUBd	fsubd	%f22, %f0, %f56
	.word 0xbba90820  ! 512: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb5aac820  ! 513: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb3510000  ! 517: RDPR_TICK	<illegal instruction>
	.word 0xb9a489a0  ! 519: FDIVs	fdivs	%f18, %f0, %f28
	.word 0xbb520000  ! 520: RDPR_PIL	<illegal instruction>
	mov	0x11d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a44820  ! 526: FADDs	fadds	%f17, %f0, %f27
	.word 0xb9643801  ! 527: MOVcc_I	<illegal instruction>
	.word 0x91942107  ! 535: WRPR_PIL_I	wrpr	%r16, 0x0107, %pil
	.word 0x8395e068  ! 539: WRPR_TNPC_I	wrpr	%r23, 0x0068, %tnpc
	.word 0x8195e06f  ! 543: WRPR_TPC_I	wrpr	%r23, 0x006f, %tpc
	.word 0xbba54940  ! 545: FMULd	fmuld	%f52, %f0, %f60
	.word 0xbc3420f9  ! 546: SUBC_I	orn 	%r16, 0x00f9, %r30
	.word 0xba45c000  ! 550: ADDC_R	addc 	%r23, %r0, %r29
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0xa1930000  ! 554: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7aac820  ! 559: FMOVGE	fmovs	%fcc1, %f0, %f27
	mov	0x12, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 563: FSQRTq	fsqrt	
	.word 0xb5a5c860  ! 565: FADDq	dis not found

	.word 0xbfaa8820  ! 568: FMOVG	fmovs	%fcc1, %f0, %f31
	setx	0x1cb9724500000e59, %g1, %r10
	.word 0x819a8000  ! 572: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x859560c0  ! 576: WRPR_TSTATE_I	wrpr	%r21, 0x00c0, %tstate
	.word 0xb635a151  ! 578: ORN_I	orn 	%r22, 0x0151, %r27
	.word 0xb5a4c9a0  ! 587: FDIVs	fdivs	%f19, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x23a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 592: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbb510000  ! 595: RDPR_TICK	<illegal instruction>
	.word 0xbfa48820  ! 597: FADDs	fadds	%f18, %f0, %f31
	.word 0xb5a4c8c0  ! 598: FSUBd	fsubd	%f50, %f0, %f26
	mov	0, %r12
	.word 0x8f930000  ! 599: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfa48860  ! 606: FADDq	dis not found

	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 622: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb4a521c3  ! 623: SUBcc_I	subcc 	%r20, 0x01c3, %r26
	.word 0xb1a488e0  ! 627: FSUBq	dis not found

	mov	0x211, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	.word 0xb5a80820  ! 636: FMOVN	fmovs	%fcc1, %f0, %f26
	setx	data_start_5, %g1, %r20
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9aa0820  ! 646: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb9518000  ! 647: RDPR_PSTATE	<illegal instruction>
	.word 0xb1540000  ! 652: RDPR_GL	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 654: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbb7cc400  ! 656: MOVR_R	movre	%r19, %r0, %r29
	mov	0x33d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 659: FSQRTd	fsqrt	
	.word 0xbfa00540  ! 666: FSQRTd	fsqrt	
	setx	data_start_2, %g1, %r23
	.word 0xb5ab0820  ! 670: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb1a4c8e0  ! 672: FSUBq	dis not found

	.word 0xb5a50820  ! 675: FADDs	fadds	%f20, %f0, %f26
	.word 0xb751c000  ! 677: RDPR_TL	<illegal instruction>
	.word 0xb9a81820  ! 680: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	mov	1, %r12
	.word 0xa1930000  ! 681: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbba81c20  ! 683: FMOVRGEZ	dis not found

	.word 0xbfa4c940  ! 684: FMULd	fmuld	%f50, %f0, %f62
	.word 0xb5a81420  ! 686: FMOVRNZ	dis not found

	.word 0xb3500000  ! 694: RDPR_TPC	<illegal instruction>
	.word 0xb5a8c820  ! 695: FMOVL	fmovs	%fcc1, %f0, %f26
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87946119  ! 700: WRPR_TT_I	wrpr	%r17, 0x0119, %tt
	.word 0xb2b44000  ! 705: SUBCcc_R	orncc 	%r17, %r0, %r25
	.word 0x8395a078  ! 706: WRPR_TNPC_I	wrpr	%r22, 0x0078, %tnpc
	mov	0x11d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 708: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb7a00020  ! 710: FMOVs	fmovs	%f0, %f27
	.word 0xbf504000  ! 713: RDPR_TNPC	<illegal instruction>
	.word 0xb9a4c9a0  ! 714: FDIVs	fdivs	%f19, %f0, %f28
	.word 0xb1a54820  ! 715: FADDs	fadds	%f21, %f0, %f24
	.word 0xb9a44860  ! 717: FADDq	dis not found

	.word 0xb5a4c8c0  ! 720: FSUBd	fsubd	%f50, %f0, %f26
	.word 0xbcb58000  ! 721: SUBCcc_R	orncc 	%r22, %r0, %r30
	.word 0xbda48820  ! 723: FADDs	fadds	%f18, %f0, %f30
	.word 0xb1354000  ! 725: SRL_R	srl 	%r21, %r0, %r24
	.word 0xbdaa0820  ! 727: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb3a8c820  ! 729: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb7a00540  ! 735: FSQRTd	fsqrt	
	.word 0xb9a58860  ! 737: FADDq	dis not found

	.word 0xb5a589e0  ! 738: FDIVq	dis not found

	.word 0xb7a90820  ! 740: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0x8995207b  ! 742: WRPR_TICK_I	wrpr	%r20, 0x007b, %tick
	.word 0xb7a98820  ! 744: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0x8d94a10b  ! 745: WRPR_PSTATE_I	wrpr	%r18, 0x010b, %pstate
	.word 0xb5a80c20  ! 748: FMOVRLZ	dis not found

	.word 0xbba448a0  ! 750: FSUBs	fsubs	%f17, %f0, %f29
	.word 0xb1a8c820  ! 751: FMOVL	fmovs	%fcc1, %f0, %f24
	mov	0, %r12
	.word 0x8f930000  ! 752: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_6, %g1, %r21
	.word 0xb1a9c820  ! 754: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbba80820  ! 756: FMOVN	fmovs	%fcc1, %f0, %f29
	setx	data_start_2, %g1, %r19
	.word 0xb3480000  ! 769: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbda00020  ! 771: FMOVs	fmovs	%f0, %f30
	.word 0xb3a5c940  ! 772: FMULd	fmuld	%f54, %f0, %f56
	.word 0xb3abc820  ! 773: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0x85952001  ! 774: WRPR_TSTATE_I	wrpr	%r20, 0x0001, %tstate
	.word 0xb5a5c9c0  ! 777: FDIVd	fdivd	%f54, %f0, %f26
	.word 0xbb504000  ! 778: RDPR_TNPC	<illegal instruction>
	.word 0xbfa00520  ! 779: FSQRTs	fsqrt	
	.word 0xbba508e0  ! 780: FSUBq	dis not found

	.word 0xb7aac820  ! 781: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a50940  ! 782: FMULd	fmuld	%f20, %f0, %f58
	.word 0xbfa98820  ! 787: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbfabc820  ! 788: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb5a00020  ! 794: FMOVs	fmovs	%f0, %f26
	.word 0xb9aa4820  ! 795: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbb480000  ! 797: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbfa00520  ! 802: FSQRTs	fsqrt	
	.word 0xb9508000  ! 808: RDPR_TSTATE	<illegal instruction>
	.word 0x8395a17b  ! 817: WRPR_TNPC_I	wrpr	%r22, 0x017b, %tnpc
	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 824: RDPR_TSTATE	<illegal instruction>
	.word 0xbba00020  ! 827: FMOVs	fmovs	%f0, %f29
	.word 0xbfa00540  ! 829: FSQRTd	fsqrt	
	.word 0x899560d6  ! 830: WRPR_TICK_I	wrpr	%r21, 0x00d6, %tick
	.word 0x85946128  ! 832: WRPR_TSTATE_I	wrpr	%r17, 0x0128, %tstate
	.word 0xb7a588a0  ! 839: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb294e01b  ! 842: ORcc_I	orcc 	%r19, 0x001b, %r25
	.word 0xbfa58920  ! 843: FMULs	fmuls	%f22, %f0, %f31
	.word 0xbda8c820  ! 844: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb7a80820  ! 845: FMOVN	fmovs	%fcc1, %f0, %f27
	setx	0x1c89b2d900000c4c, %g1, %r10
	.word 0x819a8000  ! 847: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7aa4820  ! 849: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a00020  ! 850: FMOVs	fmovs	%f0, %f27
	.word 0xbf480000  ! 852: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb3ab8820  ! 856: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb82d219a  ! 857: ANDN_I	andn 	%r20, 0x019a, %r28
	.word 0xb1a00520  ! 858: FSQRTs	fsqrt	
	.word 0xb3353001  ! 862: SRLX_I	srlx	%r20, 0x0001, %r25
	.word 0xb751c000  ! 863: RDPR_TL	<illegal instruction>
	.word 0xbd50c000  ! 866: RDPR_TT	<illegal instruction>
	setx	0xcd57a06b0000c906, %g1, %r10
	.word 0x819a8000  ! 868: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba80420  ! 871: FMOVRZ	dis not found

	.word 0xb1a81820  ! 873: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb3a5c9a0  ! 876: FDIVs	fdivs	%f23, %f0, %f25
	mov	0x10e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa4820  ! 881: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb23c61de  ! 884: XNOR_I	xnor 	%r17, 0x01de, %r25
	.word 0x819460eb  ! 887: WRPR_TPC_I	wrpr	%r17, 0x00eb, %tpc
	.word 0xb9a9c820  ! 890: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb63d8000  ! 896: XNOR_R	xnor 	%r22, %r0, %r27
	.word 0xb6044000  ! 897: ADD_R	add 	%r17, %r0, %r27
	.word 0xb285a164  ! 898: ADDcc_I	addcc 	%r22, 0x0164, %r25
	.word 0xbba81820  ! 901: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0x8d94202f  ! 902: WRPR_PSTATE_I	wrpr	%r16, 0x002f, %pstate
	mov	0x301, %o0
	ta	T_SEND_THRD_INTR
	setx	0xe40c8ce900003f0b, %g1, %r10
	.word 0x839a8000  ! 908: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb518000  ! 911: RDPR_PSTATE	<illegal instruction>
	.word 0xbf51c000  ! 913: RDPR_TL	<illegal instruction>
	.word 0x819460b2  ! 916: WRPR_TPC_I	wrpr	%r17, 0x00b2, %tpc
	.word 0xb5a58940  ! 917: FMULd	fmuld	%f22, %f0, %f26
	.word 0xb9ab8820  ! 921: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb6bd8000  ! 925: XNORcc_R	xnorcc 	%r22, %r0, %r27
	.word 0xb5a90820  ! 931: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb52d3001  ! 936: SLLX_I	sllx	%r20, 0x0001, %r26
	.word 0xbb50c000  ! 940: RDPR_TT	<illegal instruction>
	.word 0xb5aac820  ! 941: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa44940  ! 942: FMULd	fmuld	%f48, %f0, %f62
	.word 0xbba84820  ! 943: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xba340000  ! 946: ORN_R	orn 	%r16, %r0, %r29
	mov	0x21b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x119, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 951: RDPR_GL	<illegal instruction>
	.word 0xb551c000  ! 957: RDPR_TL	<illegal instruction>
	.word 0x81952022  ! 958: WRPR_TPC_I	wrpr	%r20, 0x0022, %tpc
	mov	2, %r12
	.word 0xa1930000  ! 959: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1a489c0  ! 960: FDIVd	fdivd	%f18, %f0, %f24
	.word 0xb1510000  ! 961: RDPR_TICK	<illegal instruction>
	.word 0xb551c000  ! 965: RDPR_TL	<illegal instruction>
	.word 0xb3480000  ! 966: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbfa00020  ! 968: FMOVs	fmovs	%f0, %f31
	.word 0xb77da401  ! 969: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xb7a00520  ! 970: FSQRTs	fsqrt	
	.word 0xb7a81820  ! 973: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0x899561b9  ! 974: WRPR_TICK_I	wrpr	%r21, 0x01b9, %tick
	.word 0xb1510000  ! 975: RDPR_TICK	<illegal instruction>
	.word 0xb3a50920  ! 977: FMULs	fmuls	%f20, %f0, %f25
	.word 0xb1a98820  ! 978: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb7a80820  ! 981: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbba81820  ! 982: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0x919520f1  ! 983: WRPR_PIL_I	wrpr	%r20, 0x00f1, %pil
	.word 0xb5a94820  ! 989: FMOVCS	fmovs	%fcc1, %f0, %f26
	setx	data_start_7, %g1, %r16
	setx	data_start_3, %g1, %r22

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

	.xword	0x8bb7373513084360
	.xword	0x71a3ef6fe89fc9f0
	.xword	0xf1e44028c46c67b8
	.xword	0x87eaeb167e1d54fd
	.xword	0x4f421c48d8a0ca48
	.xword	0xe4f4fa70483d1f56
	.xword	0x56eb0909ff9d2bfd
	.xword	0x040f93d154df31b7
	.xword	0x563625217d25fa6a
	.xword	0x7a4430720c9f2767
	.xword	0xfa56d3cf58a34bc0
	.xword	0x2ebc0a0fee2b8116
	.xword	0xf05f7424b5bd7053
	.xword	0x29e6ae930f1ad5e3
	.xword	0x1e412c3294f34fa9
	.xword	0x581c9f42ae8f80ed
	.xword	0x1b4f85ce2e1b1e17
	.xword	0xde2fd3e5cac6814e
	.xword	0x013e1aa95d8faeb9
	.xword	0xbbc8542763971dc6
	.xword	0x1943fb7392a61e8a
	.xword	0x05b0b555fcf1d5b6
	.xword	0x2e74035e1ede080f
	.xword	0x4ff40d2f61c2a3d5
	.xword	0x56e60017a730788c
	.xword	0xc806c8f6627e212b
	.xword	0xfc5eb5c0ca8f25a0
	.xword	0x87d09d9059a7f162
	.xword	0x8fed1b80b3ee3264
	.xword	0x2b3670cd5bfb9d71
	.xword	0x4333c274f7c42a78
	.xword	0xe610c8fe9ffb2448
	.xword	0x44ee5f952586b734
	.xword	0x768e467eaa711578
	.xword	0x34634e3276c52b84
	.xword	0xfe7747675167e219
	.xword	0x2cd9c93d050d5f15
	.xword	0x836dbbb460244f7f
	.xword	0x05e9842fd8668e38
	.xword	0x6c43a71916c579dc
	.xword	0x30ba64a26d2fd0a4
	.xword	0x627d4f1a6148464d
	.xword	0xb345d4916c90b319
	.xword	0xc3b6561c8e1f7ce7
	.xword	0xdb1b1f40d2e05a0a
	.xword	0x8dec3442d406ccad
	.xword	0xc61eb2d7b9ae9a03
	.xword	0xb01e796d9bfde154
	.xword	0x825bf7970dda8549
	.xword	0x6f0540bebb81d7c4
	.xword	0xbe9d01c0ab1b59e7
	.xword	0x4b821eee6f3cc3ce
	.xword	0xf18134fb88f65c4f
	.xword	0x6f580996f7e8994f
	.xword	0x088263811a4fb624
	.xword	0x6585da3a31a64973
	.xword	0x3dbcec574e27fb08
	.xword	0xae9664eb79ef152b
	.xword	0x9f604a84db7d8fa1
	.xword	0x4e09cdfe1bc93b89
	.xword	0x952351fdb4ea6d2f
	.xword	0x67998dc3074056cd
	.xword	0x4a393e8ed348fdc8
	.xword	0x6db6e2846ac7ee72
	.xword	0x42c4049bb966ba01
	.xword	0xb4c0c1d888949ca7
	.xword	0x8bcabb2e8b87bbf2
	.xword	0xed15942126bc658c
	.xword	0x2b8789a478f547fb
	.xword	0x510525d0aa21efe5
	.xword	0xc7990210d3c08f10
	.xword	0x3d4b62f816af6a3d
	.xword	0x8dfc3b349cf46571
	.xword	0x4f27df2abb1fa51a
	.xword	0xa80164a70bec421c
	.xword	0xd0a1a398b15ee329
	.xword	0x38232aad63e08c2a
	.xword	0x8111e3faeb770821
	.xword	0x39ec9187e596edb0
	.xword	0x6a23c53eb5979730
	.xword	0x728e9ac9a4579153
	.xword	0xb0c7749cab94460f
	.xword	0x2c0888db31b8268d
	.xword	0xbb765a73163443fb
	.xword	0x1744a5f385f4c7a5
	.xword	0x308586a4b0f8c648
	.xword	0x56fdd1f553833fe1
	.xword	0x599a4a906b55a7e8
	.xword	0x0abafc8d6db90cd7
	.xword	0xa5320635732ba82d
	.xword	0x5fdab105f2ce82c0
	.xword	0x98599b2bd516eddd
	.xword	0xbb0a110cfbde829e
	.xword	0xc22f5e50751dd6e7
	.xword	0x94628eaa68f1630c
	.xword	0xc455efaae4f950bf
	.xword	0xb59bbeeb480ee44b
	.xword	0xe10297086a69ad04
	.xword	0xd5f05070627c9935
	.xword	0xe64d0fd049fcb939
	.xword	0xdf7e4f808a0503ff
	.xword	0x4fff7662fc8e7780
	.xword	0x49ffb3947afd0a74
	.xword	0xeb41c7e6863e2fbd
	.xword	0x85645b00a26bbce1
	.xword	0x4bf820b37079bf79
	.xword	0xfd5126e475727ebe
	.xword	0x9a26d3909a17f567
	.xword	0x8a33573587e767e8
	.xword	0x221be9840cee7309
	.xword	0x2cff281d587795a6
	.xword	0x66f0d58dc319af34
	.xword	0x87930779c25397c2
	.xword	0xb1e17308a0609e2d
	.xword	0x4d396551181c3de5
	.xword	0x4ba6055ab6c6ff03
	.xword	0xc7b8642cf1f7f48c
	.xword	0x22cf3079e1f848f2
	.xword	0xdbe02120c0dfd4b7
	.xword	0x041ace4e16e228bb
	.xword	0xd77dd415af07929b
	.xword	0x651726ce632b70b4
	.xword	0xd20085a10b0d4daa
	.xword	0x080e0a56f60e1d33
	.xword	0x94e445acf29f0d27
	.xword	0x349f39a454849c2b
	.xword	0x7c9b5e419435ee75
	.xword	0x297ca9686e8edf94
	.xword	0x16242cc4c1864223
	.xword	0xc04a424d8560bfea
	.xword	0x092a02e926f4f45b
	.xword	0xb249062719094af0
	.xword	0xbe3663351aed8e98
	.xword	0x23538825c48a65de
	.xword	0x0ae492315c0b5031
	.xword	0x4ac1621b35f2fdd4
	.xword	0xbdb954652f60a28b
	.xword	0x05054a70f98f7006
	.xword	0xda668ac0ef94d2f2
	.xword	0x1c8f2ac07aad300f
	.xword	0x0e072dfaa1fbed9b
	.xword	0x86ba934e2424fcb0
	.xword	0x12a88237819bbd3a
	.xword	0x945ec73fbe8c45c1
	.xword	0x78bdac9b79bcf781
	.xword	0x411dadf3bc8d3e35
	.xword	0x473f46d004a1bbe6
	.xword	0xf328945a61362916
	.xword	0x29a03a171b61ccb9
	.xword	0x37f925428ef524d9
	.xword	0x102dd86955ec4ee6
	.xword	0x3a714fb9678d6cbb
	.xword	0x022a0105b1f182c9
	.xword	0xb72981fb34ca01b8
	.xword	0x0383fda5ef463db6
	.xword	0x1431d61084913eb7
	.xword	0x5513566008439577
	.xword	0x3d74ee62a6f3eec1
	.xword	0x93b20094af713b77
	.xword	0xbc6eb846ce6bdae8
	.xword	0x38c29529c69e53fb
	.xword	0x59d358afa168cf7c
	.xword	0xb1104d252ba96bb9
	.xword	0xb6b2cfbf30ed12ed
	.xword	0xdd0a1a4494ab2799
	.xword	0x62e17f712b32d3e6
	.xword	0x20c5504b7cb16bb3
	.xword	0x9d47492f8bf6fef9
	.xword	0x26ba90ae81f0bc4b
	.xword	0xad32d763eb1177f0
	.xword	0xce9178a4e6d2220c
	.xword	0x074d14076741a780
	.xword	0xe65a8bdf8bd73e34
	.xword	0x3e091fc02708fc29
	.xword	0x0432de8565761ead
	.xword	0xa3cf75177dea8461
	.xword	0xed4b76998198f07a
	.xword	0x1843394935c0292e
	.xword	0x2de1551cabcc55b0
	.xword	0x626cd3ae84ddc8a9
	.xword	0x47a3fc9a75310fe3
	.xword	0x5613dbfbbb79163d
	.xword	0x74482302f49a9a11
	.xword	0xa3231268d40e8044
	.xword	0x8faf8c3be343d293
	.xword	0xd0acd7813cfcad89
	.xword	0x91fc3c19e5b82195
	.xword	0x478a48f7d845ef67
	.xword	0xa92d50537efded48
	.xword	0xb3bcc5e1f81c025d
	.xword	0x1e5046468003a7f1
	.xword	0x8e30b28202288440
	.xword	0x5441a2590baf1327
	.xword	0x278491db3261be88
	.xword	0x611335bf340c278c
	.xword	0xaec3ea17a1acdc35
	.xword	0xc25b429c83ef9582
	.xword	0x41249670df362d9d
	.xword	0x18d8a3a3d186c243
	.xword	0x5407026906eddcde
	.xword	0xcf9ad916c41ab4f9
	.xword	0x8e66ff0ad740444b
	.xword	0xdff8c5b8d9365617
	.xword	0x22ddceec9bfe2b6a
	.xword	0xe38fad883ea3650f
	.xword	0x1de9014f88672e94
	.xword	0x3e89ea4119d88da0
	.xword	0x5abff570cdc622f2
	.xword	0xa9cea09370623f56
	.xword	0x55b27deb33b969ef
	.xword	0x4e506938cee77e22
	.xword	0xb35535404c4943ad
	.xword	0x5d49b0c9d82c5533
	.xword	0xbc06bece68997239
	.xword	0x2339b8dbba05c6e2
	.xword	0xdea4b1a8b484560f
	.xword	0xd16a81adb901e34c
	.xword	0xc532b1bef90a47d3
	.xword	0x05107d6ae7ee7d0d
	.xword	0x357ee01ef6d7b732
	.xword	0x979325928417c0fe
	.xword	0xe51bcf274147110c
	.xword	0x39fb47f32f5c1cd4
	.xword	0x58dc2874fab8e44b
	.xword	0x49148ccca8efbd64
	.xword	0xe907c2630aac6d86
	.xword	0xa9a3efd77e88b663
	.xword	0xe8b73ea6c42931b2
	.xword	0x876c749cdfa5b8ad
	.xword	0x9057ba92664a8d69
	.xword	0x91fd86cf45972d66
	.xword	0x00511f932547ff8f
	.xword	0x0ba2bf0a0614ff99
	.xword	0x713bf7ef66223c17
	.xword	0x3ae1393993068839
	.xword	0x8206bfb96c09503a
	.xword	0xe4d84967f6f0b459
	.xword	0x2231c8826b2798cb
	.xword	0x979031695c28e716
	.xword	0x4fad51420e6bfd8e
	.xword	0x1467141c406a35d5
	.xword	0xae86c5acc99072a9
	.xword	0xdbc3b164dbefb27a
	.xword	0x830fb4724f2c1fed
	.xword	0xca30302a38400ae1
	.xword	0xefc8b72bda32535c
	.xword	0x6a926a7d3d3a3419
	.xword	0xe4fa90c3f8474bcd
	.xword	0xcb8f823174eec973
	.xword	0x91f7f681244cf657
	.xword	0x905869f4df7dcd11
	.xword	0x9c7aedf7391d07cf
	.xword	0xe13ac8b2bc35aad7
	.xword	0x5a46dcb34ebb25e4
	.xword	0xc63de9fa9e433271
	.xword	0xa4ef6107f3cf2265
	.align 0x2000
	.data
data_start_1:

	.xword	0x7324963a220ae211
	.xword	0xf4b4b9faf8eebb6d
	.xword	0xeaf6ed6e69e948b8
	.xword	0x6bd6b448619c6673
	.xword	0x0a08aeced4926ac7
	.xword	0x7199f55824c76fe8
	.xword	0x1cd1526f0ac08173
	.xword	0xe26d96cef625f773
	.xword	0xd1aa3f043bd074fe
	.xword	0xf0854f0384d5230d
	.xword	0xbaf2f2fe9a680150
	.xword	0xfe6362d35fc72cca
	.xword	0x42f8eea0cd4179b0
	.xword	0x547d2f570fa67fa1
	.xword	0x57296dafb8e070eb
	.xword	0x8b86f646f73a55b2
	.xword	0x68453216836d88f3
	.xword	0x9c81f1472b0e1ac9
	.xword	0xb24ace653df88c3e
	.xword	0x75638ab58e4bd509
	.xword	0x6af96f6b2da6f43a
	.xword	0xe6f5aca071961c1a
	.xword	0x261446d2b75ce0db
	.xword	0x0f541bf4485dfe2b
	.xword	0x5f3918ec935e9b9e
	.xword	0xcb7d782823b3af40
	.xword	0x5a78bb0b9b9e4f1d
	.xword	0xb2f4f8d8188f4b79
	.xword	0x8396ed7b204aba82
	.xword	0x3b5816fb66b7f7b3
	.xword	0x82b5463de4928705
	.xword	0xb326d69175a4471c
	.xword	0xb9439e5632d6646b
	.xword	0xfd346213b99cdb56
	.xword	0xc984485dabc38108
	.xword	0xaa27202f367655d9
	.xword	0x735f9e5cc4715182
	.xword	0x268dfbcbbb0596dc
	.xword	0xf48871441b5b3a80
	.xword	0xe4b38c8c0f3ad6f7
	.xword	0x1b0fe4a857ca10fb
	.xword	0x533ad861bb7df9c9
	.xword	0x85c813af507befbc
	.xword	0xbbf5e6eb46beb337
	.xword	0x1b2e3b8144f878de
	.xword	0x00be240b47de4132
	.xword	0xfa12b8a83c89eee9
	.xword	0x1091fab18369d689
	.xword	0x6a4cfaa639e12355
	.xword	0x5acd6f7a05b2c747
	.xword	0x0eaad468c2044c45
	.xword	0x9eb1a9428305b0d1
	.xword	0x2690b5cf33d48f65
	.xword	0x1ed9dd3e4d51c7f9
	.xword	0xb969d8d3d8c979d2
	.xword	0xb254304cc9b8be39
	.xword	0xcfd1c6ec813fefe1
	.xword	0x2a291838c0d41a26
	.xword	0x68851ee715973cce
	.xword	0xb9e53d959922be93
	.xword	0x19fc7f2fdf4e6d2b
	.xword	0x94c437cab00b8582
	.xword	0xa5dc2c5f719a4761
	.xword	0xd505b3bcea3b25e0
	.xword	0x695ec22e05f98786
	.xword	0xe9b5423d9a28c03f
	.xword	0x0f91547d9b8dbb83
	.xword	0x3e0c3ee945928ec6
	.xword	0x91e75d6d1d223f03
	.xword	0x89c8620fad99d92d
	.xword	0x03aa56bb7238295c
	.xword	0xc90694b6cb3072c6
	.xword	0xd6f7d7a2793c62b2
	.xword	0xd4120f691dde8fd3
	.xword	0xbe56bf11d0fd5fc4
	.xword	0xe861fdfc188b07b4
	.xword	0x587f199c8771b87e
	.xword	0xecc56b97704dbd1f
	.xword	0xa0aab94f952401ac
	.xword	0x4526008f83b38c10
	.xword	0x9e2523d06e1051eb
	.xword	0xb40bb547ba9fdb2c
	.xword	0x4bc3571f845ceae8
	.xword	0x50f6f3fd1fb287af
	.xword	0x242be57056c26169
	.xword	0x713b4e318bcc33ae
	.xword	0x4a12061d96374c1b
	.xword	0x2eea518b49393290
	.xword	0x0fd2529bc1b22980
	.xword	0xd0e5b5ce9ca4a733
	.xword	0x772b02f576b0f83c
	.xword	0xdff230c9279ad955
	.xword	0xf43a5926bd7532af
	.xword	0x12a9c7208239e414
	.xword	0xb523ed5b5a6a9129
	.xword	0x301d94eedc9a5740
	.xword	0x0a89ea9757b1f5fe
	.xword	0x5040398e7724098a
	.xword	0x91c49eb9dd1152f4
	.xword	0x9514979304612aff
	.xword	0x0e1dfb38aab940ac
	.xword	0xda593459a75557ed
	.xword	0x22c6ffbee42c30b8
	.xword	0xe8b7052917505f67
	.xword	0x0ed01c208ad189b2
	.xword	0x86c89f02056bc793
	.xword	0x4eaa37e6ea0641dd
	.xword	0xc3cbf69b335e0934
	.xword	0xbf8beda34d24970f
	.xword	0x0f0fce69dd549fa1
	.xword	0x88d5a7be870b1967
	.xword	0x9911531e3c428c70
	.xword	0x1db878c4f7fb35df
	.xword	0x2ec592a6f6fbdde6
	.xword	0xe94a79e4579c8d62
	.xword	0xa3d2b93530d91871
	.xword	0xc64259f43cfb9aa5
	.xword	0x81289c7697324564
	.xword	0x39b965db5d346898
	.xword	0xe7abe8a560a3745c
	.xword	0xd96a2fc869cb72dd
	.xword	0xd8d76029ea357c8e
	.xword	0x0e376d0e594259d8
	.xword	0x3ebf4dfeff87adae
	.xword	0x46ea9d646263533c
	.xword	0x61be6155fff57bce
	.xword	0x375aa56a7ceebca5
	.xword	0xc6e557199b561080
	.xword	0xbc68dbc96e41ba17
	.xword	0x80cbb5737bef3133
	.xword	0xd7c66db1c8fed1cc
	.xword	0x3b96f2b721dcf72b
	.xword	0xfa4e20449dc7ad8f
	.xword	0x1bb07b521551a4e3
	.xword	0xf330c70cf0fb4737
	.xword	0x355b477a1f6bb595
	.xword	0x9a09d15e3ed270c8
	.xword	0x5bd33047f5b8292f
	.xword	0x09228468b5f1c7fd
	.xword	0x46744db79bc95567
	.xword	0x56117432a09d9913
	.xword	0xe305aef02e7b70f9
	.xword	0x0efa7f87edc9e7d3
	.xword	0xdad47bb81d7ec1eb
	.xword	0x50428e86da856b84
	.xword	0xfab90fb918de2051
	.xword	0xc73ca077f4cc0425
	.xword	0x8436eed43390eb20
	.xword	0x78fcdfed74cf84f6
	.xword	0x025d54a20fe731a2
	.xword	0xbbe68b03167f8194
	.xword	0xd024e21104fc67a7
	.xword	0x9ffdb3de88df1fd2
	.xword	0x56903dfe16066d2c
	.xword	0x02f10b5e1d16d79f
	.xword	0x1a85b8eb771111eb
	.xword	0x8ac730156467dc73
	.xword	0xce37e7bd1b681e57
	.xword	0xfbb009ea38c1c59d
	.xword	0xb5bd7f294aaac573
	.xword	0xc50e72c07341854a
	.xword	0xf722abf7a19a47d1
	.xword	0x9b049fc58686a3f5
	.xword	0xfb2d2b78767d43e5
	.xword	0x42a7c45ca8e2171b
	.xword	0xfad02114e405cc7b
	.xword	0x0baacd047536fb2a
	.xword	0x4ebc7d29dc0ba353
	.xword	0x46ba4094088aac42
	.xword	0x49e170a21556ad52
	.xword	0x91da901b612fbd1c
	.xword	0xafc065fe21466445
	.xword	0xaa15329026f424a1
	.xword	0xcec49d10c2211c64
	.xword	0x7efe56e1e3a1b188
	.xword	0x2e0249b2774dc8bb
	.xword	0xe998eff3cc5a0c35
	.xword	0x7e16a809dbf88b86
	.xword	0xb716254903b1d362
	.xword	0x3ee5dc0d72a3b7b7
	.xword	0xef1918d50fa0c755
	.xword	0xd88d925745f0ebf8
	.xword	0x5305d7c6bb55ce09
	.xword	0x976a195e1cb5f7c1
	.xword	0xe056d2bc3843f800
	.xword	0x459e7c44f4b745b9
	.xword	0x7c6a834a4746b526
	.xword	0xfdb3b29bc2f1deb1
	.xword	0x30febf625bd26cc4
	.xword	0xdaba700b8a3faeb9
	.xword	0x00ba19f6995344cb
	.xword	0x2dcaa8a61aea11fa
	.xword	0xfba0aa0bfb1bbd8f
	.xword	0xd1cec68bb74fffd1
	.xword	0x1ead62b70a77554f
	.xword	0x2b66f0a0c17d71d5
	.xword	0x21464ad2dc6c06dd
	.xword	0xa2435e053d6c710f
	.xword	0x479e5065287ca0a9
	.xword	0x0beea669ab5ec426
	.xword	0x1625ecf9710a5e3b
	.xword	0xa41a33927f6493fc
	.xword	0x5b140ba701f45956
	.xword	0x11015672fe9b0d1f
	.xword	0x955148864fb508b9
	.xword	0xa4b50eda9d7ca16c
	.xword	0x3ee1af5e2a519e27
	.xword	0x3a5e3ef55ea4d002
	.xword	0xf66b59088fc39520
	.xword	0xb18186d8882f59cc
	.xword	0x2a4b6d843916375c
	.xword	0xb4e33442e2c4e973
	.xword	0x09211a33cb8ca701
	.xword	0x329c9b94b5789648
	.xword	0x89a7d2ae8b7b7fcf
	.xword	0xd10257a15ffa26a2
	.xword	0x4f80672cc11d2d08
	.xword	0x371cf7056c90fb85
	.xword	0x7425c6bac412e558
	.xword	0x87787b9ba173fc0a
	.xword	0xc51b10ce7ea610fb
	.xword	0x4eac4246473c88d5
	.xword	0x387c005293743758
	.xword	0x19dbd16a7ac52cbd
	.xword	0x4bb499476b7c804d
	.xword	0x41772bb183187ef0
	.xword	0x469f3154075db37c
	.xword	0xfc5a0d0797a05478
	.xword	0x97348987e26887d1
	.xword	0x60609ecadb5397f5
	.xword	0xe802b0c5fc503c87
	.xword	0x4d802df63127ad7d
	.xword	0x76f5cc8ab7e6aee7
	.xword	0xdda232120a647dcc
	.xword	0xa3da40298bd9adc6
	.xword	0x3d6137ae7dab451b
	.xword	0x771413f561f7e3ff
	.xword	0x9512375c80ff3aa3
	.xword	0x535500e18ea527b4
	.xword	0xf2c3cddb0426e85f
	.xword	0x5682de525c4486aa
	.xword	0x6b7d64904dabdb4c
	.xword	0xe41ff4f572c64306
	.xword	0x649219895969a151
	.xword	0x27fa4b794132b1ae
	.xword	0x10b6cba37c548d32
	.xword	0x2ad2339dbd13ea65
	.xword	0x041906e58218cfe1
	.xword	0x50fbb78e23540cd2
	.xword	0xa591d0223d88f65a
	.xword	0x04e2f729f40e4cb4
	.xword	0xc5f4907c98bd514a
	.xword	0x0bd39b4fe7807015
	.xword	0xf77b2299ba750040
	.xword	0xc78543b366d4f007
	.xword	0x720e699cc4581ded
	.align 0x4000
	.data
data_start_2:

	.xword	0x2237b2f8544b600d
	.xword	0x05249d8025604533
	.xword	0x604c65fb77d8cbe3
	.xword	0x4eab43b265f3fc61
	.xword	0x32fb08aa7469827b
	.xword	0x9f3ab9ef196faa43
	.xword	0x500f085a4d4a759a
	.xword	0x88fa71617db4c019
	.xword	0x34ca2f75313964fa
	.xword	0x7c309777ec191e98
	.xword	0x2e913b34a8da2afc
	.xword	0x84ea985ee818835f
	.xword	0x64805b7578ab5e67
	.xword	0xc658eb8e0b2d1b92
	.xword	0x9e9c262bacb6e8ad
	.xword	0xa69bc661ffae5771
	.xword	0x2484a94ca1e96f17
	.xword	0x7c66a07140f77b72
	.xword	0x54c498dd35d94f6b
	.xword	0x17a2348ae1b51aac
	.xword	0x44f6c70e6378b1df
	.xword	0xf34eb3464b2b37c2
	.xword	0x07355231ecf9c0f8
	.xword	0xe7a96e770225c71d
	.xword	0x79fbadba1e68230d
	.xword	0x1c7ebcfbd561e890
	.xword	0x2da6b02cddc43bcd
	.xword	0x25c4893a5d31d67f
	.xword	0x1c68ba8694a0abb1
	.xword	0x2e9bfa83b5841e49
	.xword	0xc2734d0e9b41bf37
	.xword	0xf104b3a0e25558ea
	.xword	0x642fd593f73e349f
	.xword	0xff090b4336cd4995
	.xword	0x5c67ac74ee099161
	.xword	0xe50dc416672aacd1
	.xword	0x0757ff43b7f7fece
	.xword	0x5a8c5aa9628384ff
	.xword	0x4e72837f0c866735
	.xword	0xa05c2a1a3b42d5be
	.xword	0x61f7f0107fb2c599
	.xword	0x69cc6beb8e359271
	.xword	0x13a6168a2456fcc7
	.xword	0x1116d038f74c5cb8
	.xword	0x61bf42defc006229
	.xword	0x214f7398479def31
	.xword	0x7fc69c77aa4e7bbe
	.xword	0x9c137034b13fe714
	.xword	0xb1a04d9166c51804
	.xword	0x6bb314d876a2ae28
	.xword	0x4a17d0134c06386e
	.xword	0x9981fb425a496f82
	.xword	0xb45a02ad866639ed
	.xword	0x8ce51b867f0978ff
	.xword	0xacc698938ec99183
	.xword	0x8a9873bea449ba95
	.xword	0xb41424a7fda4f75c
	.xword	0x806e165bb518ace0
	.xword	0x234bda9b914dac80
	.xword	0xf5752f34c68d775d
	.xword	0x82102a9f95c41329
	.xword	0x313371a99680a1a3
	.xword	0xb857bf81fa8bbd70
	.xword	0x17d97d11f4ce07d3
	.xword	0x98894c8c008ff924
	.xword	0x3a671b6b56668fbf
	.xword	0x9c346c09533aa948
	.xword	0x87ec31c0c9de34a5
	.xword	0x843b15de7d8eea5b
	.xword	0x463c779380936e04
	.xword	0xdc5ed2da3a848efe
	.xword	0x138d01c1f56ef23a
	.xword	0x309abebad44a367b
	.xword	0x62e44f63516014a2
	.xword	0xc4f9defcde00046a
	.xword	0x1ec93753cdfede2d
	.xword	0xad0ecd517fc468bf
	.xword	0x694da5a5d31ce854
	.xword	0xbe38f17f66997ad7
	.xword	0xa3d44f79cb4d23e0
	.xword	0x6f797ff9cb07fb56
	.xword	0x1bdf1ca09cfaa53c
	.xword	0xca0c9b316bd7de70
	.xword	0xae85c09bb1108912
	.xword	0x0539fddd0468ddb1
	.xword	0x6a18f72bf38a96c1
	.xword	0x2fc1c72a1b9d1a38
	.xword	0x4e6896df06912a5b
	.xword	0x3fad96b722de4f83
	.xword	0x573acc65f5f3def6
	.xword	0xfe24b97e6ea62fa4
	.xword	0x3ebd6d2b16d795a9
	.xword	0x96e6ad7267d8dbaf
	.xword	0x0876cd249cab6f7c
	.xword	0x7a3ff207f0b4d6e7
	.xword	0x6b3b98ee896d8c14
	.xword	0x7c5ce1f137938669
	.xword	0x9a860e6e76302813
	.xword	0x6deec93e090617a2
	.xword	0x77c210f5c1b077a3
	.xword	0xf423697cfb30ade4
	.xword	0xe198dfb9aa76188c
	.xword	0x4d53dc71c6a436c7
	.xword	0x1ae5356b2b9ebce2
	.xword	0x662709957decf599
	.xword	0xc66f547dfb4e8f81
	.xword	0xa485ef035b7632ee
	.xword	0x23d1ecb8b4da6110
	.xword	0xde49f30113b3993a
	.xword	0x5e12124eee4cd35b
	.xword	0x685fc74d6f730805
	.xword	0x40f337defa7fb344
	.xword	0xd08a6654f16e7b73
	.xword	0x0d7a5f4aebab9046
	.xword	0x4d727adc73eef645
	.xword	0xdb5367b142c4b607
	.xword	0x96450016918ff07b
	.xword	0x8c242aa62413bcea
	.xword	0xc5859cc9d7c129d1
	.xword	0xf2d0a68b5ccca28f
	.xword	0x9c763ad7051c56f6
	.xword	0x6bca5546eca7e925
	.xword	0x359c1c004375153f
	.xword	0xd7a8d7a07ed3c212
	.xword	0x23f757e27caeaf14
	.xword	0xef42ba050bc6e104
	.xword	0xdf6f2c8183f568e8
	.xword	0x74e268868b5c7180
	.xword	0x54d64799bd183f6b
	.xword	0x7d9590e00ca3c0cb
	.xword	0xbd402560f1f666ae
	.xword	0x8c93196732d4845b
	.xword	0xca730c791c33c111
	.xword	0x7d97d11a679727ae
	.xword	0x53dca6eb87705ddf
	.xword	0xd7cb725894302479
	.xword	0x887756ff7c56e1b0
	.xword	0x9c8d01c83d5ce42b
	.xword	0x556b2b5a0d6f7773
	.xword	0x7337c3c6d89d1b7b
	.xword	0xc34ff5686742fb9f
	.xword	0x21bb27ddf6b04853
	.xword	0x748c70383d905258
	.xword	0x290a3ed6ce0462f2
	.xword	0x722a5118ff63ee4d
	.xword	0xd41e4aa09f9254c9
	.xword	0x5e7cad954f749318
	.xword	0x3bfbcb4aec00ee55
	.xword	0xe97a344b17e97338
	.xword	0xa289564fbc49235c
	.xword	0x3897b2ab44d8720b
	.xword	0x4f607e9dfea7a173
	.xword	0xd8404d186850f95b
	.xword	0xa400badf56892468
	.xword	0xff9b83be14bd4185
	.xword	0xd7b1a00240a9adc1
	.xword	0x82be261ef99318d2
	.xword	0x1cc54f24caa09fe3
	.xword	0x6f84f566f8c45c8e
	.xword	0x967933f00583ca6f
	.xword	0xd771e5707bee0c93
	.xword	0x32a735d943016a3a
	.xword	0xdd7187a2e1a95f32
	.xword	0x7517c4d9d9bfeced
	.xword	0x9408907e40fb0a13
	.xword	0xcc8a8a8197e5d7df
	.xword	0x437fd0ccf5108d87
	.xword	0xa81f17189a905bc6
	.xword	0x4bfdbf8bbddca45e
	.xword	0xdb49f40a4bca2ae8
	.xword	0x3f03864ee84e9bcf
	.xword	0x94e8fc2906f55753
	.xword	0xe1b9ed6505c65b2b
	.xword	0x8bf60b12f6601a59
	.xword	0x55d99c53b9c5dc5e
	.xword	0x0e34909fda04454d
	.xword	0x01f8dfea204c8172
	.xword	0xa15204945dad90da
	.xword	0x994a3b762c5321cb
	.xword	0x389015f40c0f10e5
	.xword	0x82a97ac77df49cb3
	.xword	0x857c19cd8cd36a72
	.xword	0x58b12f127de5aad0
	.xword	0x2b1b58f9b6990e6b
	.xword	0x6c174847760cb81b
	.xword	0x1ed4db415ab225e4
	.xword	0xd4ce37f285102be2
	.xword	0x21aa90fb6ee6790c
	.xword	0xb6f1178fc70bcea0
	.xword	0xf7584d9ca78c69ad
	.xword	0xb41da4a7eb43df39
	.xword	0x6a841391d67732c1
	.xword	0xef5401c0a2f6bc69
	.xword	0x76b2f31730760794
	.xword	0x61c6e50c743f6929
	.xword	0x3997ddd03bc1620f
	.xword	0x2568f138c24ba7b3
	.xword	0x789e1caec9e872fd
	.xword	0x1514fc62ebbe3327
	.xword	0xb8c9d7795169b982
	.xword	0xf0d81cce4ff0bd6e
	.xword	0x1ac75d85e9b2b028
	.xword	0xb4d5223b8937c34b
	.xword	0x0082a73aa964652e
	.xword	0x3d16dbc9b431b034
	.xword	0x35eb87b0d24d4aa9
	.xword	0x096f9512bb9d08d9
	.xword	0xa82877fcdae2e192
	.xword	0xa5f4a128ff07142a
	.xword	0x2b30709af004560a
	.xword	0x1e81b90d1236a007
	.xword	0xaf7d465353703f83
	.xword	0xd383e61aee28cf50
	.xword	0x70c9c3d993518e62
	.xword	0x1cf537217a9fd2ec
	.xword	0x160502c583727d97
	.xword	0x2b1c415fbde31142
	.xword	0xd0d2245e89744db0
	.xword	0xb09b74aa3cd4dfa0
	.xword	0x4a53f7d8a299906f
	.xword	0x2bfc223ef216ebb2
	.xword	0xaf576a884ae121d1
	.xword	0x50b51ab572c077a5
	.xword	0xc860392151a8ade7
	.xword	0x04bedddcc3e3555a
	.xword	0x9734cb4d4bd2fa2a
	.xword	0x308afff71d44503a
	.xword	0x59bc5daea0119c9c
	.xword	0xd24f7ea51456f105
	.xword	0xa07a446c25ba931a
	.xword	0x2fa6d1b55cdc5c6e
	.xword	0x204a8732caa93e32
	.xword	0xfb7025b079792a8a
	.xword	0x97bb4650adc1f6f3
	.xword	0xde1900a9e647c12d
	.xword	0x2acf0318dadde796
	.xword	0x5f6e24820f169151
	.xword	0xbdfaa0689d526a31
	.xword	0x78909d68cc9208cb
	.xword	0xe67ee99e90cf396e
	.xword	0xe967bbaf3cfeef2f
	.xword	0x0c0fc4de7734fa17
	.xword	0x7895f102d326dbbc
	.xword	0xb76c9ef793865fdb
	.xword	0x183feb82c0e7520f
	.xword	0x86db2f44804dbe3a
	.xword	0x1014605d0f696ffb
	.xword	0x22b88966306f9dbf
	.xword	0x3523cd66089ede87
	.xword	0x5f42c35a637aa4dc
	.xword	0x4d0cf413488ff425
	.xword	0xe97b890fc4892a26
	.xword	0xc482ff149f3f40d6
	.xword	0xc402d3ebb318cb07
	.xword	0x457de216edd22e07
	.xword	0xe56d5ed42897cd1e
	.align 0x8000
	.data
data_start_3:

	.xword	0xb2aa97a880f841af
	.xword	0x7b24092c1faa8f9d
	.xword	0x31a35826fc9b4c2d
	.xword	0xc9ce606b839c40b1
	.xword	0x45156462ebde0166
	.xword	0x59a8e4011b044a18
	.xword	0x622686a3495e2985
	.xword	0xa439ad4be452dd49
	.xword	0x79f1613a18f074f5
	.xword	0x8a255865a17e8270
	.xword	0xd5d10fcb6c93c27b
	.xword	0xd10027006b136298
	.xword	0xd02b7bd69560b56e
	.xword	0x19f46f3466f2177f
	.xword	0x74f0cdf392e96b02
	.xword	0x0ead65951724226a
	.xword	0xbc9f51634bba7aa6
	.xword	0x7c234fac4cb7e6b1
	.xword	0x26d47e843b211102
	.xword	0x2e3dd90b92e240bb
	.xword	0x2aa5678b595a93eb
	.xword	0x1adaf0dbac87942d
	.xword	0xb3a61787428aeebf
	.xword	0x5ed673edaebec30d
	.xword	0x68614bfbd933b546
	.xword	0xc26fa52cd0c7f34e
	.xword	0xaf3e9d9bcadb2f6e
	.xword	0xdcb3c2d3ca157d67
	.xword	0x6a36fa86ed4e5456
	.xword	0x0dce8b3359a6e2ce
	.xword	0x09427799936f8717
	.xword	0xc748f77387540b80
	.xword	0xe9fa86ce143a5b30
	.xword	0xab870252b49de8f5
	.xword	0x5e1903cd5781d9a1
	.xword	0xcabe96001bef3412
	.xword	0xe9cde32560ae3358
	.xword	0x06234f9a989d8b6c
	.xword	0x9b32f46ecc847ddf
	.xword	0xb08c7a18eb407202
	.xword	0xcbd2b4fe2f0ebba5
	.xword	0x5f4a0e9853387503
	.xword	0x94cefba22d8ab716
	.xword	0x3c80ac69c586c205
	.xword	0x02d7261f9e843214
	.xword	0xfad6fcd92511b796
	.xword	0x58eb18591fcabc7b
	.xword	0x8cc51579f2ba0e7a
	.xword	0xeb00af6535ada0c5
	.xword	0x1cea6449a65360cd
	.xword	0x536faad38c0f3f9f
	.xword	0xdccfff58357e7638
	.xword	0x1bfe83816c5c36ce
	.xword	0x955b7f5d37d3581c
	.xword	0x3df2363ff90c95f2
	.xword	0xa02f5c633ee2aa33
	.xword	0xb523936a319eafb3
	.xword	0x93bfa78d3c4830de
	.xword	0x7f9ab64cb05d61b7
	.xword	0x2829d7193213af23
	.xword	0x1bbff1a28388fa86
	.xword	0xaeb0ee14fe3ba477
	.xword	0x315bab0c703e9b78
	.xword	0xc061096278909130
	.xword	0xef71c0999d99585a
	.xword	0xa101895fd105fd5f
	.xword	0x1a9472580c3ba727
	.xword	0x74e128ceec3c56db
	.xword	0xe0a1951427c170a0
	.xword	0x9d84e3da748f66dc
	.xword	0x8037a80f963dc03a
	.xword	0xbd74e2c50ed46429
	.xword	0xec2d7d0831456269
	.xword	0x3aed64bb8f27959b
	.xword	0x7ef28d4c08f9a2cb
	.xword	0xa63b40aaf693dadc
	.xword	0x2d8d4d2c978dc870
	.xword	0x45bda2f9196cd7f8
	.xword	0xd8d5960c06af58c0
	.xword	0x16a067be9800c7a0
	.xword	0x9f2cc805f607c5d4
	.xword	0xf2c3e484ed57573a
	.xword	0x7ef583123ed7d2f8
	.xword	0xe32b62d4a0cfef70
	.xword	0x4a51815f2da5f2d6
	.xword	0x7356d43a375eae43
	.xword	0x193b0e4b041560e0
	.xword	0x263b9f2bba70fb5d
	.xword	0x49fe1562a258cc34
	.xword	0xe2fb94f01d60c564
	.xword	0xbe68132d3b2fe1f9
	.xword	0xeb25eda5212fe05a
	.xword	0x75adf788ce0ce64a
	.xword	0x5938b3b0b5deafd6
	.xword	0xaac7bf0add3a362e
	.xword	0x2f6a703b991bddf1
	.xword	0x012a67ed35a124a6
	.xword	0x5844c4a9a5c7cb2c
	.xword	0xf742dad1f47b3f26
	.xword	0x1cd99d7ad3d78d59
	.xword	0x9b5be81334877146
	.xword	0x9598c8ba84e49f47
	.xword	0xcd090b9b5cf4a220
	.xword	0x329bef074a1018ec
	.xword	0xd5df019e04273bde
	.xword	0x18b36e107eaf36c3
	.xword	0x7b03f43a90e9c95b
	.xword	0x6df368d18a2a1458
	.xword	0xf435e257f3fa3867
	.xword	0x507390bba98c5380
	.xword	0x8e491dec07a36bc7
	.xword	0x61e75d19d99c2a43
	.xword	0x61cdc9ea07770624
	.xword	0x0dc2c4b1502efb58
	.xword	0xa25a92dfa11061bd
	.xword	0x574cd7d1ddcc467f
	.xword	0x00c107582d14ec6a
	.xword	0xf3fb4c216fc4d133
	.xword	0x932ae710376f1c66
	.xword	0x1e34961bfd1cf422
	.xword	0xfa27ad56adc5177a
	.xword	0x8b02efbd3f71fad7
	.xword	0x2f333db5b4a50680
	.xword	0x3e5c9c11f202b1d9
	.xword	0x3ebfb45e15837fd4
	.xword	0x68750c88004f60dd
	.xword	0xa071325eec62564f
	.xword	0x1fdf6cbc1a855840
	.xword	0xa737770829879d8d
	.xword	0x8eb7951110b88926
	.xword	0x1e682e0eeacf15d1
	.xword	0xc5392d36eed881dd
	.xword	0x3fedb0055818f3aa
	.xword	0xdc3924ac0ace8000
	.xword	0xaaa72796153e6214
	.xword	0xe0d77a9466c7955f
	.xword	0x7b8288a65c539247
	.xword	0x30c192a41c78b984
	.xword	0x59c3b64be19d13bd
	.xword	0xfcaacd36d52a5042
	.xword	0x5d93b1b8f047d8a1
	.xword	0x4cae8ceb8032c04b
	.xword	0x1a645fb2728b420b
	.xword	0x168d215ab4fff867
	.xword	0xea3a6f9e157485fa
	.xword	0x63a15103e606ebb0
	.xword	0x99b6511f86a017ec
	.xword	0x4a8a9a6a69bd9c6b
	.xword	0x834f72f055fbce57
	.xword	0x55d20cc665440bcd
	.xword	0x84bcf843c7948a16
	.xword	0xe2ebbe76628c37b1
	.xword	0x04b5635c12af724f
	.xword	0xd62dcea3f5067fd6
	.xword	0xc35a3849d1766674
	.xword	0xd8a6d18cf6fdffc5
	.xword	0x275ca1e0b62f4100
	.xword	0x6552e3c925d92679
	.xword	0x3f9789268d018217
	.xword	0xbd52890204819e9c
	.xword	0x2cd3731a70cbbb7c
	.xword	0x0f450aab1a53997c
	.xword	0xbdebf11b8bb36ea6
	.xword	0xe32b945caba7630e
	.xword	0xa73517d22689c257
	.xword	0x49f646e96d34fc73
	.xword	0xd21e2e267154292f
	.xword	0xf6c5016e05de7847
	.xword	0xcfe819dc4673fd4f
	.xword	0x9a4177a8299657a7
	.xword	0x6533cb77fc48ba28
	.xword	0x78221e3c3264a50d
	.xword	0xdbfcddbb680586df
	.xword	0x2793c10bfc5e1a70
	.xword	0x7827300d229ad8a7
	.xword	0x9d3c4c874ad93137
	.xword	0x0b371e2df6ca3813
	.xword	0x8c9443949814f289
	.xword	0xfebf3b6d338a4931
	.xword	0xf485c31873ff7ca4
	.xword	0x82954382df6fe956
	.xword	0xf8e0801be4bbb233
	.xword	0x22c9def589df644f
	.xword	0x9285936d526a9f06
	.xword	0xab3e4b2d8263f07a
	.xword	0x8f53732bdc4b99eb
	.xword	0x6308a710f6b72d62
	.xword	0x0d7e05368113e910
	.xword	0x47efafd2cb8d7e06
	.xword	0xda990612fc7aa68f
	.xword	0xcbff16cb671d9bf1
	.xword	0xd7a93a2efc757d33
	.xword	0xfe0a20f758168904
	.xword	0x2401941411912af4
	.xword	0x23eacaf9d791e5de
	.xword	0x2d7795579ee793f3
	.xword	0x01f513a4188ac836
	.xword	0x9c90afb137eaeca5
	.xword	0x758bd842d48b8bb9
	.xword	0xdf25e1311c30ab92
	.xword	0x50c105c2249ccf30
	.xword	0x04cf18babacdeae4
	.xword	0xed617cda84874bb0
	.xword	0xfabb6a662a021316
	.xword	0xb19b0733755a540e
	.xword	0xded88ae1cdb402a6
	.xword	0xfd69306ca8165629
	.xword	0x57b4027f4d324cd2
	.xword	0xb0923148498d3489
	.xword	0xf9c1158ba71cd601
	.xword	0x25e8acf0fc1c180d
	.xword	0x2356cf13b51d6380
	.xword	0x09f7652ac08b51f7
	.xword	0x7526be595081f81f
	.xword	0xd156258f388e8f6f
	.xword	0xbf24efe678179cfe
	.xword	0x2f8aa24db2f5833c
	.xword	0xf52d9d23d0f9bd76
	.xword	0x090845b3f24dd8c5
	.xword	0x6c353ab8f3c18923
	.xword	0xda9ce9252c3204d0
	.xword	0x379f9962a7ea8c1d
	.xword	0xefcf9e187757efe1
	.xword	0xa4d6f3efa4f13094
	.xword	0x772c6acb69facba4
	.xword	0xad4bc598693dceda
	.xword	0x4553ee96243e11eb
	.xword	0x18c7196d98960117
	.xword	0x139534949f9e484f
	.xword	0xcd06e65d9f4ac39a
	.xword	0x8a5a90b5c5d30901
	.xword	0xffae4e641fba24a8
	.xword	0xfbe8b27fc6113d06
	.xword	0x81e8962f9c983b57
	.xword	0xb745d5f7e9e7ce4c
	.xword	0xca9a0fa4220c65f2
	.xword	0x97702a69913f98f8
	.xword	0x524d6bdc9b435657
	.xword	0x7a8e4bb109a18a34
	.xword	0xb5797e5d445635a4
	.xword	0xee4d056d3435ff18
	.xword	0xc330ad494c0feb84
	.xword	0xe8ae234af702b2f2
	.xword	0xfeddff249e06531b
	.xword	0xdde874f7fb66f5d8
	.xword	0x6bd5a82784047495
	.xword	0x1ae4c7940567e6ab
	.xword	0x3b02acdddfb155ab
	.xword	0xbd09c1e62494d4ed
	.xword	0xa45caaff6b78bda1
	.xword	0xeec6545c423eeca3
	.xword	0x7b54bb9d85332b89
	.xword	0x3deda0657bbc9ca4
	.xword	0x871f224c57933aff
	.xword	0x77583e12896cc368
	.xword	0xaf9717365369f6a7
	.align 0x10000
	.data
data_start_4:

	.xword	0xa5b1286b0a7e28a1
	.xword	0x9f350cd57bab20bf
	.xword	0x4c751b214f3e3d90
	.xword	0x9f7aa1f11f28c3b9
	.xword	0x065af52501e91bcf
	.xword	0xd347227ee7acee01
	.xword	0xc4b26c8a3f6d6726
	.xword	0x9615ff6e866aca1e
	.xword	0xf5eb7a8b30cf1817
	.xword	0xe436f4f25c1f358f
	.xword	0x2c847753646f1bdb
	.xword	0xf2f7d90ddf7845df
	.xword	0x0ad59e585758889d
	.xword	0xbe12504815f2385e
	.xword	0x01467c602644b4f9
	.xword	0xca8eac06ca150e80
	.xword	0x0bce593456edccd0
	.xword	0x5e872d29e857df7b
	.xword	0xc21c6cbcb05bb03b
	.xword	0x0e963c7c488d1bd2
	.xword	0x8d80c612140acd81
	.xword	0x96186fb617966758
	.xword	0x996eb62e1b1e861b
	.xword	0x898c84d7abecccab
	.xword	0x66ff13b0345ea934
	.xword	0xb949788a2a7650c2
	.xword	0x05fc472959ebc6dd
	.xword	0x6d9fb0475321d9cc
	.xword	0xcc30fbd983404be0
	.xword	0x60872474db0757d2
	.xword	0x6d0d38310fdd126c
	.xword	0x7fbea7d0aaf7f9b6
	.xword	0x6431fa4d2b8e0222
	.xword	0x4683859af775e3c6
	.xword	0x2ae62655eaea4729
	.xword	0x1230a015033b0c7b
	.xword	0x0efc3c7ffe13b439
	.xword	0xa1b2184a7ed2abfa
	.xword	0x94c563857bb807af
	.xword	0x1d442873669fceba
	.xword	0x0045cc498794023d
	.xword	0x83f4381a9a56a7f8
	.xword	0x3c0c968186a2498b
	.xword	0x2ff97ed38d4425ea
	.xword	0x12e279ecb87ba07c
	.xword	0x7b89473ac8c5f9b6
	.xword	0x79316e12040aa8a8
	.xword	0x1862526df6c4a4ae
	.xword	0x5b173c873d22885d
	.xword	0xf67601223a77aedb
	.xword	0x393e93de15317e5d
	.xword	0x46c15f64c11cb0bb
	.xword	0xb6dc0592cbe0a86a
	.xword	0xbeb350c4624eb9d3
	.xword	0x65dd80e40c21ecf0
	.xword	0x561955902d969671
	.xword	0x6cac800d10a2e650
	.xword	0x86c04a833da724a3
	.xword	0x1acceff38bfe048d
	.xword	0xc93bddcaa21aed64
	.xword	0x32f9357d2f1fdc69
	.xword	0x0931d9d676daeb99
	.xword	0x72200b69629d8587
	.xword	0xa8bcd46ac4c0d2dc
	.xword	0xa7aaea079772a00c
	.xword	0xb3edfa32e8853451
	.xword	0x7de1701a30e1d4de
	.xword	0xd26059a25d7326bc
	.xword	0x76aae169290f8adb
	.xword	0xa1e5daaf68a78544
	.xword	0x02cb71da32924789
	.xword	0x92fb7b4da7d70b4f
	.xword	0x444fb6501dfeff03
	.xword	0x8e17ac2ffc7e5014
	.xword	0x1d38ec15411bcd25
	.xword	0x77aa28128f784c55
	.xword	0xf8c5cf646292d75a
	.xword	0x91fac290ffc17282
	.xword	0xc4936b2953f5dac9
	.xword	0x01c76a56582e29a2
	.xword	0x67d798c70371d6ec
	.xword	0x5a232c278c2268f5
	.xword	0xeba7c23e47095fa4
	.xword	0x5e18b5b2e617efeb
	.xword	0x6fff04f2c4c516cc
	.xword	0x0073490ffa2a7368
	.xword	0x39ab29c5053afd60
	.xword	0x5477cf870cce7e23
	.xword	0x39e65ef4a3a2f5c5
	.xword	0x09fc5cd94adf9c33
	.xword	0x4750395ed2480335
	.xword	0x86a347387d977a41
	.xword	0x08de3a29c60b64e5
	.xword	0x0e95b4e4a9fba23d
	.xword	0x0bd662ca1cb11181
	.xword	0x0115d5beee03f5d1
	.xword	0xc445819b44bd42eb
	.xword	0xe36b58b814df2047
	.xword	0x91180b8dc0b90056
	.xword	0x057903e01dd7e763
	.xword	0x459b0a44cc9ad6b1
	.xword	0x5bcfeab13d034991
	.xword	0x8e162c72252c96e3
	.xword	0x2e0097ce349415cb
	.xword	0xfa01c94d8a91f4f4
	.xword	0x326cad1423586c91
	.xword	0x8833334b3a75dbfe
	.xword	0x6533f482833aed86
	.xword	0x9d518142d777f64f
	.xword	0x5e774b6f1ef6c58a
	.xword	0xd4b9044841b7387e
	.xword	0x28be6e1c51208a63
	.xword	0xcccf8d01f8cad395
	.xword	0xe5c68bab7bcb1a7b
	.xword	0xef01092f04bf2d25
	.xword	0xb1a972fc6a750ef1
	.xword	0x2879b39a8c608307
	.xword	0xa65fc6e0a0daf3b3
	.xword	0x133971476490178d
	.xword	0x018e122d6ca14283
	.xword	0x382cfa84349f0ee8
	.xword	0x43eb591c0fa2f6c4
	.xword	0x1e40d9982760da32
	.xword	0xa7a84c6335c75bfb
	.xword	0xb225fa019cfdb9c4
	.xword	0x776bee8e00f80c7b
	.xword	0x50498016c6cb0a1e
	.xword	0x513e30dc45a8bfd6
	.xword	0x417f152720c10513
	.xword	0x3b8a662b2558e7da
	.xword	0x0c01e06a65ed9877
	.xword	0x0206ecbd59df05cf
	.xword	0xa42fffede71c90b5
	.xword	0x57b4cb2451a903ce
	.xword	0x5481733f4eaa015f
	.xword	0x5e0d52e86c4baa68
	.xword	0xbefde1b4cd0ffd41
	.xword	0x281b89b197aad140
	.xword	0xc89b3c0e5aee7931
	.xword	0x0634f1b3226f143a
	.xword	0xaa9a137e67ac0f39
	.xword	0xb0e6d260457d2e1a
	.xword	0x42e35f3311b7028b
	.xword	0xaaa3ece1bb657115
	.xword	0x2dc2894aea109b21
	.xword	0x9a910ef1663e3d18
	.xword	0x944e5246cdd118e9
	.xword	0xc9b0c97563ebbbe7
	.xword	0x35589e47526f0fe1
	.xword	0x344aa3a741689677
	.xword	0xab64d85ae3b89113
	.xword	0x8f42b121352e560a
	.xword	0x64b6e3923a14c006
	.xword	0x29807116d55e15ef
	.xword	0xd0a22b3b1a05cee7
	.xword	0x3d184680c231c7a4
	.xword	0x1c8723229b328d9e
	.xword	0xf9f73b52d9689fb7
	.xword	0x40623b2397244a6e
	.xword	0x83d24bf9d55881db
	.xword	0xe3260deec5f690cc
	.xword	0x0c654b78d7a0f11e
	.xword	0xb9bd750e0c420d59
	.xword	0xbcc87bbc96f26161
	.xword	0x476e533bca29d35a
	.xword	0xd421f4c62cd410e3
	.xword	0x33c32b4fe1c2e2d6
	.xword	0xfce9fac72d9f8a86
	.xword	0xdca645032979e07d
	.xword	0x2c621bbccc47add8
	.xword	0x1c66a95460bfccec
	.xword	0x81478214d8794f7a
	.xword	0x977bfa67e2e1c2db
	.xword	0x981296b547667603
	.xword	0x422014991337bcb7
	.xword	0xac648f5cf529f57b
	.xword	0x452fe4b728921499
	.xword	0xf1f6d45c8772e798
	.xword	0x63b1c3997c9636c3
	.xword	0x68c44f6b11b6ecc5
	.xword	0x02bb0bf92e271163
	.xword	0x826d7d889d381d5a
	.xword	0x1f15474e2b4baef2
	.xword	0xe73a814a4f4334b1
	.xword	0x36af1c430bc46ae5
	.xword	0xe989be32657dba00
	.xword	0x1cf86eeb0afd09ce
	.xword	0xc73252d01351a7c2
	.xword	0xc95356792531e61b
	.xword	0xe2021e490b555fb0
	.xword	0xe6590dac3d49b331
	.xword	0x7b7006a8b98a6c4d
	.xword	0x8b367f2904c3aab2
	.xword	0xf00c0615937e444e
	.xword	0x3f21c1b81610d3a2
	.xword	0x79596d04226eb54e
	.xword	0x9f8a7ce0fa81aa53
	.xword	0x4763d7be12d3e48e
	.xword	0x5db88bcb0c0e1056
	.xword	0x407d10b8e4eba535
	.xword	0xdf270c7922f7def8
	.xword	0x88d8f3ba141b7e29
	.xword	0x45f493c6fa452929
	.xword	0xfcec79d9b3e6b34d
	.xword	0x3fea3a00210693fe
	.xword	0x7245a24f2a1c615c
	.xword	0x47ad9d4ca9959c0b
	.xword	0x622549f90cbb0aa3
	.xword	0x17f6674be42dd4c5
	.xword	0xd8ebacf94fa4ab0e
	.xword	0x18be8eba232e4c2e
	.xword	0xff3d2f82f1f80a90
	.xword	0x04b265e5acbddf2e
	.xword	0x3a4262771aad3654
	.xword	0xbb2c3c029ac8df72
	.xword	0xad90b8722d4a0ebc
	.xword	0x4650f5a2e530a5d0
	.xword	0x10a4b14fdc148594
	.xword	0xb2a4b7a2b7f93d01
	.xword	0xa41eb0495beaee82
	.xword	0xdbfe18048edb9de7
	.xword	0x7e459259185065d6
	.xword	0x4447ba877f2df959
	.xword	0xa280e208a37f72f9
	.xword	0x9c1705b6c75cd40b
	.xword	0xf6935478aa579d25
	.xword	0x6ecd8614f7776484
	.xword	0xe830027029b9138c
	.xword	0x4f18dd1eba9a0f61
	.xword	0x47a0393059a55990
	.xword	0xbdd5949b42dbabb4
	.xword	0x0a520f4b3fa20b16
	.xword	0x6dbbf8e02d7c809b
	.xword	0x424c6c12c0fbc765
	.xword	0xed767287f87ac5cf
	.xword	0xbd56f65f0545f1c8
	.xword	0xef2c1894be30725b
	.xword	0x6d3e0d0f46bc5cf9
	.xword	0xb326c836fade96f8
	.xword	0x285681d289361364
	.xword	0x3f267e70d2403e94
	.xword	0x0cb2df18f9e56c6b
	.xword	0x02604126e1fc3a5d
	.xword	0x229ca8a9c0c5399b
	.xword	0x599cc7cf56ea0cba
	.xword	0x05988d0a8b06139e
	.xword	0xf7d3a071b3e2b5bd
	.xword	0x78242a8063374063
	.xword	0x9fde2f4193976632
	.xword	0xcda9b503fc385b6f
	.xword	0xcf87eee276f026a1
	.xword	0x5115e37c2c266c7c
	.xword	0x57d807a3413cd01c
	.xword	0x88a3d27e8bb6490a
	.xword	0x18fa135942d7ce82
	.xword	0xf6ccf4b09ee87d5a
	.align 0x20000
	.data
data_start_5:

	.xword	0xb7c894f43e6e340c
	.xword	0xc9533ab94b43d117
	.xword	0xcd716ac3c6aea84e
	.xword	0x4f3dfa244262f493
	.xword	0x77ce79471a8232e8
	.xword	0xb127f194d4ecfb0c
	.xword	0x0b6cf4b3565b4324
	.xword	0x5634ed456e39472b
	.xword	0x1e1e3c32d67e976b
	.xword	0xb783077a2dc1b685
	.xword	0x54dbe37e6fcb4ff7
	.xword	0x67fccad15a554106
	.xword	0x52926fde161c4dcc
	.xword	0x897bd758102e05f4
	.xword	0x9ee1fd53c29b7e83
	.xword	0xe1bf57c50f41ea90
	.xword	0xa4e5db4f7ae70c77
	.xword	0x40128a75b2406c3b
	.xword	0x14f5f1277ddd8dde
	.xword	0xa0231ac3c8534b18
	.xword	0xd4f38005512da41e
	.xword	0x819610184a66a3f8
	.xword	0x33835e0734c0d43f
	.xword	0xb6753d667d26beff
	.xword	0xd12fd18295ca9c30
	.xword	0x05adcfeed429539a
	.xword	0xfd2333be3f051561
	.xword	0x0538d87b4a9bbcb7
	.xword	0x995f4a5d5c1012ab
	.xword	0x1973061ac253933f
	.xword	0xd0c85d459e36da27
	.xword	0x7136bac5ca39edda
	.xword	0x5a776277f797f41c
	.xword	0x10cc131ce60d4510
	.xword	0x48ef39ca1a47f354
	.xword	0xc543e10ad3442f7c
	.xword	0x00ff7316de6f3418
	.xword	0x75afc0cfc572176d
	.xword	0xfdc8bf9629c65eef
	.xword	0x9e8a621f95b54ea3
	.xword	0x6ed58c3c47f757cb
	.xword	0x50fcd893cfeb224b
	.xword	0x623c17591e2439d3
	.xword	0x9827da4d8e0934dc
	.xword	0x18df6161872fdcba
	.xword	0x4ff65f602d3d17ff
	.xword	0x96eaabc423ccf127
	.xword	0xdd74a4d2ef5e0fe4
	.xword	0xc51f3d78bc85772f
	.xword	0x862f3c42461c284c
	.xword	0xe2b8698ce3586fad
	.xword	0x0e6c634b18dd488e
	.xword	0xf0bc3e8031b15db4
	.xword	0xfca028abc085170d
	.xword	0x874d00682fa2189e
	.xword	0x921904730d1397a8
	.xword	0xc7280e34ba6e582e
	.xword	0x4702ed071ea9c1e9
	.xword	0x6e4e39866845ea6a
	.xword	0xaea43d905266f0fe
	.xword	0x959bd7f1824027da
	.xword	0x3d3775c34d2f3ce3
	.xword	0x06804bd47ab2476b
	.xword	0x2b7c8b8247d241b7
	.xword	0xc67b7a9f8c9daa0a
	.xword	0x6353606404db9721
	.xword	0xc07a37c8b2d5eb4f
	.xword	0x57c231ab0493ecee
	.xword	0x40361ec378e490f2
	.xword	0x64ac05f7008e4c62
	.xword	0xeef4db2e875e54ef
	.xword	0x7b319ee64398c013
	.xword	0xdf4a8f81c1d8b8e1
	.xword	0x95d06d7c5f69420f
	.xword	0xea63d0b82f267f49
	.xword	0x6eab9d02ff2d5192
	.xword	0x0f7bd8f096c06f37
	.xword	0x5c335a1b5e9cca97
	.xword	0x9ba305731b7a0b14
	.xword	0x1edfaf27d1474d01
	.xword	0xc81cc9ac6a6a9997
	.xword	0x0ecc8427719c5fa3
	.xword	0xb75c959f8cafb352
	.xword	0x3f828c7b8c49f51c
	.xword	0x44bd786f7efbf496
	.xword	0xf5608535c28b377e
	.xword	0xd8a5f1e61284b88a
	.xword	0x39273f0b36aa802a
	.xword	0x480e192e69efdb41
	.xword	0x6be0170f0be9366a
	.xword	0xb39fadb6991da587
	.xword	0xd27255f0f33a5ca4
	.xword	0xb3028b778a335ac3
	.xword	0x6de6ee357ba8e64c
	.xword	0x16878d992efef93f
	.xword	0x3019d3a552f40516
	.xword	0x5c40e4d67d1a3281
	.xword	0x9225881667c54922
	.xword	0x9607089c16f34647
	.xword	0xb05f208e365be7f0
	.xword	0x4c2b87959305b1b9
	.xword	0x6156849b0efb1cb3
	.xword	0x24f46ec9db8c18ea
	.xword	0x57ab05a0db966c82
	.xword	0xca301a0cc1fd11b6
	.xword	0xd24531dde3d5476e
	.xword	0x001e2f9d2c8334bc
	.xword	0x6eb7562b9ac3b70b
	.xword	0x1bd33af1b4b0e711
	.xword	0xc58f8c929fb5eee1
	.xword	0x7c0c399874614dae
	.xword	0x7731a5a0cf5b9b82
	.xword	0x47c24ad5636ea0d4
	.xword	0x3efe82197f4e8ec5
	.xword	0xe657652dc5851b13
	.xword	0x0ef16b7c92b57b63
	.xword	0x2e5e1f055291954b
	.xword	0x0187086d0353fa5b
	.xword	0xb34c5c9e6588cb02
	.xword	0x8c957a1a4a608502
	.xword	0x3687b05a1081706e
	.xword	0x88daef3d99dc0d10
	.xword	0x3efe386e1992c860
	.xword	0x0a60102f957a607f
	.xword	0x95ddc952e90e6589
	.xword	0x77d74cc1023e78e9
	.xword	0xc1aaa7b607dfcf7f
	.xword	0xc91ad43c23f1cc95
	.xword	0x539bf9270b85b6ea
	.xword	0xab7a8e036ebd217e
	.xword	0x472fc0bf30cb47e1
	.xword	0xe98d4cc205f9f5e6
	.xword	0x354a07fc33fc9a87
	.xword	0x1b90910369cf1267
	.xword	0xdbd09b35909f47da
	.xword	0xeb34a6a6b7719f09
	.xword	0x4e07a1a527f2490e
	.xword	0x36e2c362c04c2073
	.xword	0x3c218a79c2d16f83
	.xword	0x400ff26f26cbaeda
	.xword	0x18e1ba121a74b78c
	.xword	0x08ba9974ba873721
	.xword	0x0c07c8bd087b3747
	.xword	0x6fddbee9eefbc830
	.xword	0xbad46721238d914c
	.xword	0xd0fa3127a4f7ee4a
	.xword	0xf8f799598de29764
	.xword	0x2ef5d9393305f57c
	.xword	0x2e8097b2c3e94432
	.xword	0x2b862a3d297fddc0
	.xword	0x646f4cb9f4cd4094
	.xword	0xc02ee951ce7a03f5
	.xword	0xeff1a23c2554349c
	.xword	0x098e52a3be01bc4c
	.xword	0x41ba94cef09d0f20
	.xword	0x31f084e0245382c3
	.xword	0x0b6a36b638cddc3d
	.xword	0x89fdf3b5585efed0
	.xword	0x5795327266e4121e
	.xword	0x15201724d88a5140
	.xword	0xfe266a2a6287eb2b
	.xword	0x5adb3dd0d8e9c279
	.xword	0xbecefa005494e9e0
	.xword	0x18897c7fccf5e807
	.xword	0x4cd57dced7fadb19
	.xword	0x8735b8c79c3ef4c8
	.xword	0x1dc0d895f17a8b26
	.xword	0x85e376c530f67236
	.xword	0x3f6049278ce753a2
	.xword	0xd08f773f3056a431
	.xword	0xf089fb598cde1e26
	.xword	0xf24f9786b8ec36a0
	.xword	0x640381af989fb826
	.xword	0xfe66fc613345b82f
	.xword	0xa3c8a03c6d1a8581
	.xword	0x8c90563c0f86a457
	.xword	0x3f4972ce822a81bf
	.xword	0xb8ec364150e3dc7e
	.xword	0x8faae7926707a6a3
	.xword	0xeb201c527af435ba
	.xword	0x32de5014fc14d66a
	.xword	0xdbb3650cbbd1f2ce
	.xword	0xd34a12b7e876b8c0
	.xword	0x683c8caa753d67be
	.xword	0xb0dfc49cf4f92882
	.xword	0x706c94630a819b2a
	.xword	0x9a378a47ed8292e2
	.xword	0xc47cc6e54e233fa5
	.xword	0xf3ea481c7bee006a
	.xword	0x1ccf7b6513486958
	.xword	0x0f34ed9f8dbe3eb4
	.xword	0x22f3c368d8492a98
	.xword	0x82ed1e8d170700c5
	.xword	0xb519a4219406c8fd
	.xword	0xfb25d1f3535804c5
	.xword	0xed55ef4764189b59
	.xword	0x713fbfb4dea09173
	.xword	0x8abd4260571d8ee7
	.xword	0xb833b8626d9e0717
	.xword	0x1d6415fb8f88272d
	.xword	0xf6ce34e6363af716
	.xword	0x8547e9da7056178b
	.xword	0x8379ef104d6b7a5a
	.xword	0x956508c82b3e26ed
	.xword	0x4b535d46445e939c
	.xword	0xb734c74dfa6d4dac
	.xword	0x9d3975805db7a611
	.xword	0x37f8066f0d011b94
	.xword	0x02d75d7da5c60db7
	.xword	0xbae63d1e763780c7
	.xword	0x7276bfdae235129c
	.xword	0x57978d8b895c23a0
	.xword	0x3ab475b72cb11f99
	.xword	0xe0211080e93232d8
	.xword	0xe33854d0dbbb05f3
	.xword	0x09a46d6e8d0825ea
	.xword	0x562523db2e008406
	.xword	0x0c989518d033cb8a
	.xword	0x70836f5dbc13c91e
	.xword	0x4a8c998860e92f24
	.xword	0x30272e032a549207
	.xword	0xc83d9d7d9523ea7d
	.xword	0x64816b6cb74cf8ef
	.xword	0x1ceabb0c487bc52f
	.xword	0x80295b6de236438e
	.xword	0x0ba93cf25e3156bb
	.xword	0x92624b8db558d448
	.xword	0x0f82fe4e49daffdf
	.xword	0x3f6508c5e196a2cd
	.xword	0xc549738380893f3c
	.xword	0xf26e49b68054e4fe
	.xword	0xa320a8ae9e20551b
	.xword	0x032a73d5f5ebe7db
	.xword	0xac9791343fd2a410
	.xword	0x7c111eb2e7309a03
	.xword	0x951d5982e6beae18
	.xword	0xe5afa4f68962c19e
	.xword	0xb9219ea7958bb686
	.xword	0xfb5bcaa91cb2ba5c
	.xword	0xc8f9ac3c0fc6ecc3
	.xword	0xae5dffe495297706
	.xword	0x2433c18033322631
	.xword	0xef2b5d4251338f1b
	.xword	0x9235f890b4ad1d78
	.xword	0x368fd13334286c4f
	.xword	0x436635e8f69ec568
	.xword	0xf0141a1a1ee02b7c
	.xword	0x2df38e07ff11a5e1
	.xword	0xc1a512127421a46a
	.xword	0xbb772eada7b9f89d
	.xword	0xedc920272595747f
	.xword	0x90c2e336e6e503bd
	.xword	0x81a6fd95de6eeadd
	.xword	0xb7434bc778666911
	.xword	0x5c4cdbcf6e6004b1
	.xword	0x30e38dc85aac0819
	.align 0x40000
	.data
data_start_6:

	.xword	0xff4c25e5574726af
	.xword	0x270e589fa2c5a2de
	.xword	0xb7b2e85311f09e8c
	.xword	0xeb2e37cb9b09f07f
	.xword	0x31ccfb0d5f912b50
	.xword	0xf0c86d6528e5a71e
	.xword	0x97c4ce80129e564c
	.xword	0x89ea1e33978cb3e5
	.xword	0x731281de922846e8
	.xword	0x41d4791ab306623d
	.xword	0x8153835efb80da0e
	.xword	0x228c22c7b01d309a
	.xword	0xe300d6784d8a48b0
	.xword	0xfa23d0b4f9a4648d
	.xword	0xce7976f3ee34427b
	.xword	0xdfed923b7a0429fa
	.xword	0x915cbd4fe402d188
	.xword	0x50fb4d35361744e8
	.xword	0xfa8cc15f9d2aef57
	.xword	0x33c2532935a2fb19
	.xword	0xab79f1159c5e27a9
	.xword	0x74c7ddc89e64d6c7
	.xword	0xe59dd2077229a4db
	.xword	0xb17bd749749b57a8
	.xword	0x5ef68f544100ba96
	.xword	0x546239d7a38633b5
	.xword	0xee1aa655aac6cdd2
	.xword	0xf4987c69f85073b6
	.xword	0x272e8e2ccb941c6b
	.xword	0x787729f959098a41
	.xword	0x636e702865ff264f
	.xword	0xbf7b67d971cb0598
	.xword	0xe6c5b5cc6762dda1
	.xword	0x88bea7a48758397b
	.xword	0x25092491aec02593
	.xword	0x89d90d68edb79312
	.xword	0x625e46ce424e183e
	.xword	0xdb8119af08cff6d0
	.xword	0x53d503cb69f14d10
	.xword	0xb6a41444aea733ad
	.xword	0xc2cd2d6e531691cc
	.xword	0x773eb86e8d4bd3c6
	.xword	0x8d2194d699f5fb3c
	.xword	0xf2a26eb05d6ee558
	.xword	0x8c3d1c0a8080d65b
	.xword	0x1bd909c921f6613c
	.xword	0x093f5b1a067d3691
	.xword	0x179845d4c318ff32
	.xword	0x46fcbe28089a215f
	.xword	0x25970769be08eb48
	.xword	0x487414a4d08e64c2
	.xword	0x9a02444fcd4fdbca
	.xword	0xe83797cb2dde2d9f
	.xword	0x2c00dab84de11be7
	.xword	0x4ff0c460fb771c9c
	.xword	0x5e7cbe6602e727c4
	.xword	0x4b931660471190ba
	.xword	0xa889c424d64ec361
	.xword	0xd54a836eb6e35fc4
	.xword	0xce0912bad07e892a
	.xword	0x89e79c22d0613946
	.xword	0xb5b70a78f10881c5
	.xword	0x4e2395d6c08894b1
	.xword	0xf2c5dba7bda87a5a
	.xword	0xd49fbda6a58c9b9a
	.xword	0x774574de9f21d611
	.xword	0x5e11a782e386fb42
	.xword	0x34b0663519f0a99d
	.xword	0xdef09c39148fe203
	.xword	0xa88acf1defa7b6ed
	.xword	0x5ce52f4a611a7071
	.xword	0x0bcd7d45b371221b
	.xword	0x866d56bcc6f80229
	.xword	0xc8edef13dea4f5b4
	.xword	0x3a9e94197af10553
	.xword	0x06ba97758dd79866
	.xword	0x9360dfe135956311
	.xword	0xea514b9b93e1a1a2
	.xword	0x92d5375fc6659ea0
	.xword	0x91ce6dac7dbc48dc
	.xword	0x8a7c28fc6301745e
	.xword	0x4b2cbc45e16cbc96
	.xword	0x8914ed1d4b2e184d
	.xword	0x9bf559d4257c19e8
	.xword	0x44a73f14824256fb
	.xword	0x022f79b0744049c9
	.xword	0xe0be0ea623029d1a
	.xword	0xab7a80c7dd5de391
	.xword	0x7caca93eaf72b31b
	.xword	0x51e991c44fcc57d8
	.xword	0x882de7f07617047c
	.xword	0xb58c73d309fb5b66
	.xword	0x6cf327c5927e80be
	.xword	0xd2bd623599fb71b6
	.xword	0x0e98068ce6e50f72
	.xword	0x99361e096373b763
	.xword	0xf9ff587b0dc6e8f8
	.xword	0xb9f156fd85d583f3
	.xword	0x4789e22b36d6568d
	.xword	0x08c39f93b8eb7e09
	.xword	0x8f38559832b17569
	.xword	0xae4c353e77adb3bf
	.xword	0x0becb041b65ae748
	.xword	0xf6dcc965c36758f9
	.xword	0xcb4bcff3b86218bd
	.xword	0x60fc313d8b94b8c0
	.xword	0x2dbe44f1141e8c71
	.xword	0x316a377160189b6e
	.xword	0x089b1a70a4682469
	.xword	0x3cf5e8e6ee04a1b6
	.xword	0x16c018253c73dd39
	.xword	0xb33da228bb895719
	.xword	0x420293ab5d4f6b07
	.xword	0x6b1652c0bcaa7ab3
	.xword	0x72b0a0d8a014071d
	.xword	0xd608ea5162c98230
	.xword	0x29d97cd42c5efb7f
	.xword	0xca7c40de163b0130
	.xword	0x9d0f2fe8c9f34d65
	.xword	0x050d9bd2b4e5c144
	.xword	0x9bbeceefa2d4a425
	.xword	0x24d1d44788aac380
	.xword	0x17784e8e1fcb5f92
	.xword	0x7d2bd8e2ae0a0bb5
	.xword	0xa6a8c2b9aff73374
	.xword	0x2f17c2b71abb98c8
	.xword	0x79a2bf73ecdefaf8
	.xword	0xcd42c066ba0c7e26
	.xword	0x6d463a44086f45c5
	.xword	0x4dfff6c204a57e18
	.xword	0x47c95b737d217d4b
	.xword	0xae4f812a5c1d4c26
	.xword	0x95709f4270965ee4
	.xword	0x120e0bd9b25c84c1
	.xword	0x55515774e648a5c8
	.xword	0xd7213b26c880cc19
	.xword	0x27a83b5fcf02a64d
	.xword	0xf57c0a9b996af521
	.xword	0x026fc74130eb9b01
	.xword	0xd4bf222b48585acb
	.xword	0x0f260fc99fb2adc7
	.xword	0x679d40fd2d054888
	.xword	0xf67db25e8af11d79
	.xword	0xddd266c681dee1c5
	.xword	0xc541f24de9d36bfe
	.xword	0x8ff1c410102ee2ba
	.xword	0xbf3181facb94c4c0
	.xword	0x5c1db631d3bb249a
	.xword	0x843ccf75a5249ed0
	.xword	0x2ce85b7a83077b58
	.xword	0x11dd2cb17cfa25ae
	.xword	0xed4afc5962a23d30
	.xword	0x29cf98e2c1b4aea2
	.xword	0x641e52495cce8539
	.xword	0x1916be8f3fb34963
	.xword	0xdfa1d186370b2c0e
	.xword	0xcd7d95857f7dd902
	.xword	0x469deb0fba93cdd5
	.xword	0xefe82a7c1ef44284
	.xword	0x6e44ed34d95169f7
	.xword	0x131f540872b15575
	.xword	0xa6f2e979dd51d775
	.xword	0x4354a9ded99a5494
	.xword	0x9a4feb56dae9d3b7
	.xword	0x37c6527c4d07a8c4
	.xword	0xae41a1d9f88d1c88
	.xword	0x3f4c372f56f5b5e0
	.xword	0x56200568c82ed076
	.xword	0xf3a4bfed1befb0aa
	.xword	0xfbf580ba91231398
	.xword	0xf3419f39372fe904
	.xword	0x1ef7575bf0c11d3e
	.xword	0x678f25b691258fc8
	.xword	0x1c5298be1139c2de
	.xword	0xdd8264fffa58ea5d
	.xword	0x995d4aea309396a9
	.xword	0xb175beba3e9c126b
	.xword	0xff9d28e507239e6e
	.xword	0x5a81c8d5a08a000e
	.xword	0x9da3dee3562d635d
	.xword	0x11b7f69f1e8b1f2d
	.xword	0xa6ca406b21a383e4
	.xword	0x4fd32d4fad27c6d2
	.xword	0xc01087de59519a8f
	.xword	0x9234506dd1e4eb4a
	.xword	0xf33955f32788400f
	.xword	0xa365f773be07ab75
	.xword	0xf0633837c33cddbc
	.xword	0xfb183fbbe4bf9d27
	.xword	0xa173a31f9bf5fb41
	.xword	0xf57ec2c25068d4f1
	.xword	0x29d4d636ca40540c
	.xword	0x9a0f3db98ffb646e
	.xword	0x24407b2ca230bb7a
	.xword	0x70b1a64e4971802b
	.xword	0xbf6e0ec95063ee42
	.xword	0x8b4afaabd57dab52
	.xword	0xd84000540f11fe3b
	.xword	0xd0a8ddd023e20d4c
	.xword	0x1ae26c8ff1dea34c
	.xword	0xe673e1f7dda0c572
	.xword	0x7db120d256ea5874
	.xword	0xec43416799ac65bc
	.xword	0x617d92404400a506
	.xword	0x8b0101116c4a7101
	.xword	0x0e8d725ce2cbc532
	.xword	0xfd777006a579739b
	.xword	0xb8f930d6082e2121
	.xword	0x4f253e65d00f3a03
	.xword	0x0922c1c80ee8840a
	.xword	0x93eac55eb7cfcc3b
	.xword	0xd98f8e791b1f6048
	.xword	0xf15fe818d48dfe86
	.xword	0x93d6a70b7adfc9e0
	.xword	0x66a8e5cd74fbbf25
	.xword	0xd7a4345687edf802
	.xword	0xdc3d49e272ebb85f
	.xword	0x57b758adc942484d
	.xword	0xabb08f6eb4d362eb
	.xword	0xbf8fa7618d6eadce
	.xword	0x7d7a312dea6b6a09
	.xword	0x7390593ddcd12bcb
	.xword	0x510ea987a1b1e8c6
	.xword	0xe8d60d957d2ba248
	.xword	0x4d9625e28a4b8d9f
	.xword	0x57bd975593c361fa
	.xword	0x9111c81df7298ee0
	.xword	0x89b0e635dd866799
	.xword	0x90a0c375232bbf86
	.xword	0xc4339b02580559b0
	.xword	0x0286fe6389d42d67
	.xword	0x2134b2f15bcf8fd7
	.xword	0x26a0bcb7be42b873
	.xword	0x64d2fe517634fbe4
	.xword	0xbce4bd820fad859e
	.xword	0x45bca490d6fd5d50
	.xword	0xa4f18a382c35a493
	.xword	0x743e40aa2895f3fa
	.xword	0x521c9b8e9477c613
	.xword	0x3b716d4af227a540
	.xword	0xb39d445d3b6abee6
	.xword	0x43121a19db0e7a3d
	.xword	0x4901b810741d0d2f
	.xword	0x3cad36f68259a61d
	.xword	0x3ebfd7d2dda0152d
	.xword	0xafbdb49c827bb944
	.xword	0x1babfa033a9b9622
	.xword	0x9e85099b5aff5b43
	.xword	0x60a40ec0f4ca7998
	.xword	0x9d745ed9f623888a
	.xword	0x482ff4f6a1863795
	.xword	0xf9d69119f5d35771
	.xword	0x761034d21e4a66c0
	.xword	0xd8086ea4b99702ba
	.xword	0x3b590e60e499a982
	.xword	0x3e970674818907ed
	.align 0x80000
	.data
data_start_7:

	.xword	0x992750f86d23865c
	.xword	0x6353ebeabbf38bdb
	.xword	0xab51c0046e5a7dda
	.xword	0xf5ec55749691661c
	.xword	0xfd35b35720635f5a
	.xword	0x06b66fcf6e0228ec
	.xword	0x518d1dba4f5acbb2
	.xword	0x813b30793703f3e9
	.xword	0x4126d5f24c9ab78c
	.xword	0x69ad684f63656f68
	.xword	0xbffb0b676b693a64
	.xword	0x0089247a6c3b8d26
	.xword	0xfb130861f24eef0d
	.xword	0xd69bb1057ed2deda
	.xword	0x82f45cfaea8473ae
	.xword	0x32841a55cef2e0c3
	.xword	0xeb5054e9486f3369
	.xword	0x7ae8031736af2b0f
	.xword	0x6a7e2cb5f52209d8
	.xword	0x6499b048510f5d80
	.xword	0x8d41135f0603b260
	.xword	0x66c2161b53ea708b
	.xword	0x614a66553c69093b
	.xword	0x7b66e7b7d7217ce6
	.xword	0x01459f4b6086bef6
	.xword	0x10e6c4a836ba839b
	.xword	0xe1a0e941176c30d0
	.xword	0x64907a56c1d35f14
	.xword	0x7101f6079b2def0c
	.xword	0x9cb39737fe98bc81
	.xword	0x799a72d32498994b
	.xword	0x950f9b17c18e8fc4
	.xword	0xf65e7d3df3d32eb8
	.xword	0x8d8e7b276c242561
	.xword	0xcf39601623f6b91b
	.xword	0xa81f71de77fd765f
	.xword	0x4253580b963da67d
	.xword	0xbf69ff7ca540840a
	.xword	0x3d57e73ecaa9fff9
	.xword	0x8b6520981d6e8992
	.xword	0xe40af0dceba8609f
	.xword	0xcc245d38e0a56c42
	.xword	0x6fe6693e02484317
	.xword	0xe5079a26827b2d14
	.xword	0xb13fae51aa278546
	.xword	0x99894f523498d5cc
	.xword	0xb1a48b8e34a949a0
	.xword	0xd8a40b1e59ca491b
	.xword	0xb7c8ebb8e47fe499
	.xword	0xdb8ce6d78389600c
	.xword	0x0a8f4f3762d97fd9
	.xword	0x65671a6cf35fbb10
	.xword	0x4079f69367b2db29
	.xword	0x95595b719a47e8d8
	.xword	0x0cca6d5969376fed
	.xword	0xc1438b2145a9bd8e
	.xword	0x8dbb210bfd60d3e2
	.xword	0x6f3d5681d05e5265
	.xword	0x58a89ea0b41b8aca
	.xword	0x3526bf2288bf5a99
	.xword	0x1ab3bf84bc0d5030
	.xword	0xafb6517b841b2f91
	.xword	0x107e279aa3cd2aea
	.xword	0x98d58013a9bfd1c4
	.xword	0x50c7c58cc06b33de
	.xword	0x93861f57fb4ebded
	.xword	0x5cdbcb0ae67ce6cd
	.xword	0xdd84a2e874853d90
	.xword	0x0edac658fdc920ac
	.xword	0x89fdeb3a29bf118b
	.xword	0xd027d0bd60c0fb22
	.xword	0xd93ec5eaf0609add
	.xword	0x5fe73abda361b6fb
	.xword	0x34832243f81e64d5
	.xword	0xab9ba0aa70264479
	.xword	0x2d4592d265f82f3b
	.xword	0x1427b88e96b9998d
	.xword	0xf485759a1d058e1a
	.xword	0x26a7e0dc814ee45c
	.xword	0x894928c239b7affa
	.xword	0xcfe792a1ff1cf790
	.xword	0x31e22133c7b245d3
	.xword	0xdf331e7139e4757b
	.xword	0x56a470e2b467728f
	.xword	0x2eceec1c8ba71fcf
	.xword	0x5395c4b518964496
	.xword	0xad1648f29299cc55
	.xword	0xb25b67a7f3308323
	.xword	0x1023c8c62783dc83
	.xword	0x11a89c6f5b42b483
	.xword	0x4934b3979fb6f08d
	.xword	0xc6b250647d2dcdb4
	.xword	0x667552c89d67d292
	.xword	0xd3f6e1d939a0e7eb
	.xword	0xbc72838723755eaf
	.xword	0x7d86aca21d5e1502
	.xword	0x3022067e7cdd94c8
	.xword	0x77fd4d9d90089303
	.xword	0xdb43e7b5637b5010
	.xword	0x27da488f9f865a2c
	.xword	0x2d806b45df2f72fa
	.xword	0x9631524cb5b59cff
	.xword	0xbd46a9161c95f172
	.xword	0x9665193f402770cd
	.xword	0x0fc5306ece1a0b11
	.xword	0x755e6a71732e9fd3
	.xword	0x588deb27d8349a83
	.xword	0x0bf24053596231b4
	.xword	0x61ccbef91bf86db7
	.xword	0x20eae04b7a125261
	.xword	0x0f11af06f263ed1d
	.xword	0x5fd3e456ee698f3b
	.xword	0x1b5e4a7699c62b13
	.xword	0x74f18ea5da1c4953
	.xword	0x3724578112414b0f
	.xword	0x362142bfaff311ce
	.xword	0x4cfa92a30d09b7ee
	.xword	0xd830c6a312ddcb66
	.xword	0x4f92cf124ff1ead6
	.xword	0xb1844e8fcd8de4e9
	.xword	0x224ca97ceb6d0de6
	.xword	0x8728b01518e658e2
	.xword	0x0e1d52ac4dfeb86e
	.xword	0xbbd2207c2054275a
	.xword	0x5896b81d9aeb3478
	.xword	0xedfc777bc0f713db
	.xword	0x2109fca351ec7a09
	.xword	0x599af003ceb907ba
	.xword	0x7177a34a5eba5f4d
	.xword	0xcf81195d6eb8db7b
	.xword	0x7558e40f4f2baa00
	.xword	0x5008e7f3c1bbcebb
	.xword	0xc0c3a314548682c1
	.xword	0x1a71de705a043764
	.xword	0xad3b549a475ae2b5
	.xword	0xca56091c7cec60fb
	.xword	0x462e615ff6902ef5
	.xword	0x4d5dcd7340e2e3c1
	.xword	0x029472305405b5fc
	.xword	0xbf801e023031d92a
	.xword	0xd265b80a7454978f
	.xword	0x1626654c594ea49c
	.xword	0x5a32761ab4467058
	.xword	0x6b0480f5ebeec6c5
	.xword	0x24ab91060ab175d7
	.xword	0x94bb9ce5f1640cc9
	.xword	0xaaa184e9b1451f61
	.xword	0x9951c0e6f046fd41
	.xword	0x017dba1d2f040dec
	.xword	0xe221114b70875c04
	.xword	0x7d53033ca31bf3a7
	.xword	0xca60883b5db87e8b
	.xword	0x97867e636fe6d2c7
	.xword	0x6fe83cb318634b7a
	.xword	0xe1d37e8e7406512b
	.xword	0xb50624b3d60b2d87
	.xword	0x33bb392d1d814c8a
	.xword	0x2bcd0acc7e8d53a7
	.xword	0x997ae94ab2d5a264
	.xword	0x9b3452044e516f2d
	.xword	0xd8d0a077dbc281d1
	.xword	0xee65be6bc81f7477
	.xword	0x8c8769338fc5d434
	.xword	0x3d91897ae957d440
	.xword	0x13788f0a29da012c
	.xword	0x0a8f9889e5bd260f
	.xword	0x43ac3442b1a527c6
	.xword	0x5f718b1d85a70ad6
	.xword	0x433f3aea3fba23f3
	.xword	0xa13912f1d81f3758
	.xword	0xf18b9b224935b508
	.xword	0x0f8115f68bd74717
	.xword	0x663fc5adffabe01f
	.xword	0xcec2cb13fb7f319c
	.xword	0xcd5e4ec20ee247db
	.xword	0x76fad5af7abbffcf
	.xword	0x13e8e3d15e4fd274
	.xword	0x08e976a1efb265fb
	.xword	0x51bd5021d9bab14d
	.xword	0x6c33a5a43175ffae
	.xword	0x98328d78003842fd
	.xword	0x34575127b3075e37
	.xword	0x1934806c2d0d72fd
	.xword	0x4bdc73df1780bf7b
	.xword	0xf4dd3ffac05d385c
	.xword	0x926c82369c90cdb4
	.xword	0x76d640038918533a
	.xword	0xd1e0a6160918b923
	.xword	0x0ffefee609433120
	.xword	0xbb8a994c6a8941ee
	.xword	0x5817d2e1b54898a7
	.xword	0xb8a3ff6da24e2a7e
	.xword	0xc59d5f1d2bdca27f
	.xword	0x7d927b3196b49cfd
	.xword	0x661355ff85e2590e
	.xword	0xcd6d0cad77c09202
	.xword	0x4eb833dbd0459066
	.xword	0x4389246a27e2c989
	.xword	0xd3da958052d06490
	.xword	0x842f4c4d4546c76d
	.xword	0xe53031d1316ace59
	.xword	0x809b111716308aaf
	.xword	0xe157deb24a644a7e
	.xword	0xa4a023cc5cde836e
	.xword	0xb091c84eab592cd2
	.xword	0x15ee6b5e7d37584f
	.xword	0x4a49f26ceb6380ce
	.xword	0x4ed81fab9190a095
	.xword	0xbed0c697bf808559
	.xword	0xde90bb66128ca2f4
	.xword	0x274415ab821d2e17
	.xword	0xe2a3b96ba54de0ca
	.xword	0x7a96b9be8bb360c1
	.xword	0xab8033c2a625599c
	.xword	0x8d9639eb0098dc8c
	.xword	0xd36d96e456b4b40f
	.xword	0xe13790a8d96f6b6b
	.xword	0x0f00efa74d287105
	.xword	0xdbb34c7054c99037
	.xword	0x455505aa9df82111
	.xword	0xdfa12bfed353d49d
	.xword	0xce8cecbc5b7e2cb4
	.xword	0x434f91ea01c28068
	.xword	0x143f2c72f2a0d802
	.xword	0xdd9168da208a8bef
	.xword	0x393f6bc4f9f26a4b
	.xword	0xf797fd9c038c661a
	.xword	0x12861dd85c20c80e
	.xword	0xb354172dd00ba43a
	.xword	0x22e3ccd310b9012a
	.xword	0x397a943e11d74f21
	.xword	0x00ce2ebf6b22e6ce
	.xword	0xa8e0870bd34ecbc0
	.xword	0x96e7731d75f9b2fd
	.xword	0x5db442f4b57760e8
	.xword	0x536a1daed2b265c7
	.xword	0x1f22cbd17580861b
	.xword	0x64b008b155954a95
	.xword	0xbaed15ced5397948
	.xword	0x1f1a264178677c5b
	.xword	0x614833ae142d09b6
	.xword	0xa878f20136044431
	.xword	0xfb069ce8000b2c5a
	.xword	0xc8e2f1fd0376fd2e
	.xword	0xed626f85202fbca4
	.xword	0xc89f406b356cb41a
	.xword	0xb2ee0ecdca7419de
	.xword	0xef1319ce6b0bc4c2
	.xword	0x9d7c2b463618e497
	.xword	0x7f71892b357350f3
	.xword	0xf2cb182fd3720601
	.xword	0x3cc08efd470831fa
	.xword	0x499ea5422784d6b4
	.xword	0x13740d520946922e
	.xword	0x2e4e0d96648b7b37
	.xword	0x9aa0131d8ffcf4f2



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
