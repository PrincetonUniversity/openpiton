// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_87.s
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
   random seed:	870284673
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

	setx 0x2e7a37d40a99aada, %g1, %g0
	setx 0xf1f46c7ad7f07e28, %g1, %g1
	setx 0x7b2f4c08692fb6f8, %g1, %g2
	setx 0xaf19b7cca201cc96, %g1, %g3
	setx 0xda0ee0841b133079, %g1, %g4
	setx 0x7793fb639b79ccb4, %g1, %g5
	setx 0xab7553eb69ec491b, %g1, %g6
	setx 0x83c00a99f0c11128, %g1, %g7
	setx 0x6f328a7d7e5bc4ad, %g1, %r16
	setx 0xa78d8bab9732f598, %g1, %r17
	setx 0xf5fc85dbaf14dd63, %g1, %r18
	setx 0x4e1726fb137596dd, %g1, %r19
	setx 0x08a317c43ffbd0aa, %g1, %r20
	setx 0xb92b0a5fd2562fee, %g1, %r21
	setx 0x454bffb1a909fb27, %g1, %r22
	setx 0x5a285e4f33420e4e, %g1, %r23
	setx 0x33b62535f144a766, %g1, %r24
	setx 0x114041ead3b1f133, %g1, %r25
	setx 0x9121e8eaaa3d612b, %g1, %r26
	setx 0x052e4059501ac0f3, %g1, %r27
	setx 0x92f3a2c125b49f8b, %g1, %r28
	setx 0xa066e2ecb21fc2ea, %g1, %r29
	setx 0x44a4b6622033d386, %g1, %r30
	setx 0x93bd895e1e977201, %g1, %r31
	save
	setx 0xb10c701bce40bb65, %g1, %r16
	setx 0xfc40dd881a1218fe, %g1, %r17
	setx 0xd34e9ed07cbc5fb1, %g1, %r18
	setx 0xe2129de8a362d44b, %g1, %r19
	setx 0x76a6484b4ea03052, %g1, %r20
	setx 0xfa58d07efd36883e, %g1, %r21
	setx 0xf92248c6305f94e6, %g1, %r22
	setx 0x1e9fc0f1060600ea, %g1, %r23
	setx 0x3a35f72b4ab93160, %g1, %r24
	setx 0xc901bd382829b491, %g1, %r25
	setx 0xe01aa38650c2b331, %g1, %r26
	setx 0x90588d167adca231, %g1, %r27
	setx 0x8d26cfd6ec5d17f0, %g1, %r28
	setx 0x01022bac5113dc8e, %g1, %r29
	setx 0xd19e77e6f76db52d, %g1, %r30
	setx 0x8606a02b42ed6d1d, %g1, %r31
	save
	setx 0x4ac89e79a22c44ca, %g1, %r16
	setx 0xb3f1e9e21c111046, %g1, %r17
	setx 0x372dac961d42f024, %g1, %r18
	setx 0x29fc300c521252e2, %g1, %r19
	setx 0x50ce55074e9b4543, %g1, %r20
	setx 0x8fe86ff5f0d0699c, %g1, %r21
	setx 0x14441218f39d9d6a, %g1, %r22
	setx 0xfcff687648a9a38d, %g1, %r23
	setx 0x8dc5dae1627c883b, %g1, %r24
	setx 0xdbe5007a712a1269, %g1, %r25
	setx 0xfd98ca72f5a4d923, %g1, %r26
	setx 0x1bdee7aeb7b353bc, %g1, %r27
	setx 0xc0e24b9e88b03e84, %g1, %r28
	setx 0xcb6d25cccf6d63c6, %g1, %r29
	setx 0x86aa5334462f053d, %g1, %r30
	setx 0xba71a2ce1264b82a, %g1, %r31
	save
	setx 0x63e5bda0a98203d4, %g1, %r16
	setx 0xa092b03a007c4e09, %g1, %r17
	setx 0x8fae3f6efc7014a9, %g1, %r18
	setx 0x7ce58e8b7465dd6a, %g1, %r19
	setx 0x088d72c1142509b5, %g1, %r20
	setx 0x191d3bd6da1f559d, %g1, %r21
	setx 0x8dfb97b64ec1e3b5, %g1, %r22
	setx 0xbf79ec4f7e05b6fe, %g1, %r23
	setx 0x6df0d45dbbab95a7, %g1, %r24
	setx 0xd3177b467146e77d, %g1, %r25
	setx 0xedc64805efaee1e4, %g1, %r26
	setx 0xfb93102cb3fee03e, %g1, %r27
	setx 0xca60ef5d9a1b6f3d, %g1, %r28
	setx 0x44e5ad64e4a37bbe, %g1, %r29
	setx 0xe5ebb65f2ecd138c, %g1, %r30
	setx 0x19338b34bb3c436a, %g1, %r31
	save
	setx 0x6c6c7dc45936c8f9, %g1, %r16
	setx 0x6ddb3311a3b0fa0b, %g1, %r17
	setx 0x4c3ae6ae9f9d2e7b, %g1, %r18
	setx 0x46340730efcb4a6d, %g1, %r19
	setx 0x7acdb56d7b7332d0, %g1, %r20
	setx 0x370e9f3567e3a38a, %g1, %r21
	setx 0x2f1ec1e1c0f1c9d0, %g1, %r22
	setx 0xf26acf297b35b53e, %g1, %r23
	setx 0xee455f7698a23a58, %g1, %r24
	setx 0xedbca5e8f9e3144e, %g1, %r25
	setx 0xf6fe3c288278ee6d, %g1, %r26
	setx 0xc56fcd583d191327, %g1, %r27
	setx 0xd2503f2d21af18ac, %g1, %r28
	setx 0x316f2490ffb6f958, %g1, %r29
	setx 0xa6c3f72155f23d0b, %g1, %r30
	setx 0x6ce2026b0ace1cde, %g1, %r31
	save
	setx 0xe528713a958c3ec5, %g1, %r16
	setx 0x1e3f206de0dada40, %g1, %r17
	setx 0xc0e0a763b7c253b4, %g1, %r18
	setx 0x9e94737e1ec89000, %g1, %r19
	setx 0xc47786435d10be9e, %g1, %r20
	setx 0x2a1446933c9253b0, %g1, %r21
	setx 0x6346fc5f2a8c45ca, %g1, %r22
	setx 0xda4da8fef668d5c9, %g1, %r23
	setx 0xd736d3f0684c508a, %g1, %r24
	setx 0x2d33a96bd2c767f7, %g1, %r25
	setx 0x1bcd710c4fc91ecb, %g1, %r26
	setx 0x971ace3394eac10a, %g1, %r27
	setx 0xa146fa47807a97cc, %g1, %r28
	setx 0x9c66ec4111f69878, %g1, %r29
	setx 0xd168645f29205c98, %g1, %r30
	setx 0x09151c0a5ae8b034, %g1, %r31
	save
	setx 0xcdef4d99b8472d54, %g1, %r16
	setx 0xaea73cadb3fbe5af, %g1, %r17
	setx 0x7d538974d32410ad, %g1, %r18
	setx 0xf2bd892b838c9329, %g1, %r19
	setx 0xd8a26c9890e3207f, %g1, %r20
	setx 0xe5e68da826ae3f50, %g1, %r21
	setx 0xa40c0557ccd59636, %g1, %r22
	setx 0x7fd1f21c6a5e9524, %g1, %r23
	setx 0xb7d2570f9d85f5f9, %g1, %r24
	setx 0x8ee4401e160d2234, %g1, %r25
	setx 0x21518f532d6206bf, %g1, %r26
	setx 0x254ae28b48423137, %g1, %r27
	setx 0x35e450350f033cf3, %g1, %r28
	setx 0xdaab9b9828dd77e8, %g1, %r29
	setx 0x435a8aeb00620367, %g1, %r30
	setx 0x4e88ecd4838f136f, %g1, %r31
	save
	setx 0xf2c5e9700757228f, %g1, %r16
	setx 0x8c4d8912b2a2d90e, %g1, %r17
	setx 0x9e1cdd1e3c16c0ab, %g1, %r18
	setx 0xf61bf962ea929145, %g1, %r19
	setx 0x3ae44c89f850e0ab, %g1, %r20
	setx 0x189d4e53e8f6ee47, %g1, %r21
	setx 0x7d87361b66d86526, %g1, %r22
	setx 0xb3ad310671d37fd5, %g1, %r23
	setx 0x1110fa62aa04da8b, %g1, %r24
	setx 0x15848c9df478e2d0, %g1, %r25
	setx 0xb122ec4d0d9d0330, %g1, %r26
	setx 0xbc84caa08ac2b260, %g1, %r27
	setx 0xf5bd61007a69343b, %g1, %r28
	setx 0x6a27a5386eb044c3, %g1, %r29
	setx 0x923b760720d0e6bb, %g1, %r30
	setx 0x375b6747c4a46830, %g1, %r31
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
	.word 0x91946186  ! 1: WRPR_PIL_I	wrpr	%r17, 0x0186, %pil
	.word 0xb895c000  ! 3: ORcc_R	orcc 	%r23, %r0, %r28
	setx	0x81aee37a0000dd91, %g1, %r10
	.word 0x819a8000  ! 4: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x87956132  ! 6: WRPR_TT_I	wrpr	%r21, 0x0132, %tt
	setx	0xe0a8215f000018c2, %g1, %r10
	.word 0x819a8000  ! 9: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde56113  ! 10: SAVE_I	save	%r21, 0x0001, %r30
	mov	0, %r12
	.word 0x8f930000  ! 12: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9540000  ! 13: RDPR_GL	<illegal instruction>
	mov	0x7, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a128  ! 18: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbd3c0000  ! 22: SRA_R	sra 	%r16, %r0, %r30
	.word 0xb9e52131  ! 23: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e4e0d8  ! 26: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_0, %g1, %r18
	.word 0xbfe46196  ! 28: SAVE_I	save	%r17, 0x0001, %r31
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 31: RDPR_PSTATE	<illegal instruction>
	.word 0xbde4e017  ! 32: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e520b3  ! 35: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb0c5a14e  ! 39: ADDCcc_I	addccc 	%r22, 0x014e, %r24
	setx	data_start_6, %g1, %r20
	.word 0x8194e1e4  ! 44: WRPR_TPC_I	wrpr	%r19, 0x01e4, %tpc
	.word 0xbf540000  ! 46: RDPR_GL	<illegal instruction>
	.word 0xb5540000  ! 51: RDPR_GL	<illegal instruction>
	.word 0x8995a0ba  ! 55: WRPR_TICK_I	wrpr	%r22, 0x00ba, %tick
	.word 0xb3508000  ! 61: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e5215d  ! 62: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e5a06d  ! 63: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e42180  ! 64: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e560ca  ! 65: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e561d9  ! 67: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e4a0e1  ! 68: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e42009  ! 69: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e56191  ! 70: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde5a1fd  ! 74: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbe848000  ! 76: ADDcc_R	addcc 	%r18, %r0, %r31
	.word 0xb350c000  ! 83: RDPR_TT	<illegal instruction>
	.word 0xbf504000  ! 85: RDPR_TNPC	<illegal instruction>
	.word 0xbde52126  ! 88: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x5e438e1a00007f45, %g1, %r10
	.word 0x819a8000  ! 89: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x859420ce  ! 95: WRPR_TSTATE_I	wrpr	%r16, 0x00ce, %tstate
	.word 0xbbe4a070  ! 96: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbe9da0e7  ! 101: XORcc_I	xorcc 	%r22, 0x00e7, %r31
	mov	0x208, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e1f1  ! 103: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7510000  ! 106: RDPR_TICK	<illegal instruction>
	.word 0xb2bda051  ! 107: XNORcc_I	xnorcc 	%r22, 0x0051, %r25
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a17e  ! 114: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x9d0488ec0000bb8e, %g1, %r10
	.word 0x819a8000  ! 115: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xbcc0990f00008810, %g1, %r10
	.word 0x819a8000  ! 116: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9e5e11d  ! 118: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde4a02f  ! 123: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e5e199  ! 127: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e4e188  ! 131: SAVE_I	save	%r19, 0x0001, %r26
	mov	0, %r12
	.word 0xa1930000  ! 132: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9e461ca  ! 133: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb950c000  ! 134: RDPR_TT	<illegal instruction>
	.word 0xb7e4211c  ! 136: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe5605e  ! 138: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e56042  ! 140: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb48da139  ! 147: ANDcc_I	andcc 	%r22, 0x0139, %r26
	.word 0xb5e4a0d8  ! 149: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe4e199  ! 150: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbb504000  ! 151: RDPR_TNPC	<illegal instruction>
	.word 0xbbe521c8  ! 153: SAVE_I	save	%r20, 0x0001, %r29
	mov	2, %r12
	.word 0xa1930000  ! 155: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb751c000  ! 157: RDPR_TL	<illegal instruction>
	.word 0xb7e4212e  ! 166: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e4e0ec  ! 167: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e5616d  ! 171: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e4a1e5  ! 172: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e560f5  ! 173: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbb508000  ! 176: RDPR_TSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r23
	.word 0xb1e420f7  ! 183: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e52118  ! 186: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb33cb001  ! 189: SRAX_I	srax	%r18, 0x0001, %r25
	.word 0xb9e52029  ! 190: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e4e0b7  ! 191: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e5218b  ! 192: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbf2db001  ! 194: SLLX_I	sllx	%r22, 0x0001, %r31
	.word 0xbc44a038  ! 196: ADDC_I	addc 	%r18, 0x0038, %r30
	.word 0xbfe42073  ! 198: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e56068  ! 199: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5510000  ! 201: RDPR_TICK	<illegal instruction>
	.word 0xb5e4a018  ! 202: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e46167  ! 207: SAVE_I	save	%r17, 0x0001, %r27
	mov	0x221, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e420c5  ! 212: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe4e1ef  ! 214: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe4a12b  ! 219: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8d94e032  ! 223: WRPR_PSTATE_I	wrpr	%r19, 0x0032, %pstate
	mov	0x33f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb694a136  ! 227: ORcc_I	orcc 	%r18, 0x0136, %r27
	.word 0xbb50c000  ! 230: RDPR_TT	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 234: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3e4e0d4  ! 235: SAVE_I	save	%r19, 0x0001, %r25
	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e172  ! 237: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e5e095  ! 238: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e4a053  ! 240: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x899561ff  ! 245: WRPR_TICK_I	wrpr	%r21, 0x01ff, %tick
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e520c1  ! 255: SAVE_I	save	%r20, 0x0001, %r28
	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x230, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e07d  ! 261: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e460b6  ! 265: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbd504000  ! 266: RDPR_TNPC	<illegal instruction>
	.word 0xbfe46121  ! 267: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbbe42119  ! 268: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5643801  ! 271: MOVcc_I	<illegal instruction>
	.word 0xb5e460b2  ! 273: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e421d9  ! 274: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe4a19f  ! 275: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde4e0eb  ! 277: SAVE_I	save	%r19, 0x0001, %r30
	mov	0x109, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e006  ! 279: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e4614e  ! 280: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb235e13a  ! 283: ORN_I	orn 	%r23, 0x013a, %r25
	.word 0xb1e461d7  ! 287: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e5218a  ! 288: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3504000  ! 293: RDPR_TNPC	<illegal instruction>
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 295: RDPR_TL	<illegal instruction>
	.word 0xb3e5202f  ! 296: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e5e174  ! 298: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e4a01b  ! 299: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e5204b  ! 300: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e5a06d  ! 304: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbd504000  ! 306: RDPR_TNPC	<illegal instruction>
	setx	data_start_2, %g1, %r16
	.word 0xb5540000  ! 315: RDPR_GL	<illegal instruction>
	.word 0xb3510000  ! 316: RDPR_TICK	<illegal instruction>
	.word 0xb5500000  ! 317: RDPR_TPC	<illegal instruction>
	.word 0x8d952106  ! 318: WRPR_PSTATE_I	wrpr	%r20, 0x0106, %pstate
	.word 0xb6ace178  ! 319: ANDNcc_I	andncc 	%r19, 0x0178, %r27
	mov	0x109, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a09f  ! 324: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x859421c7  ! 325: WRPR_TSTATE_I	wrpr	%r16, 0x01c7, %tstate
	.word 0xb9e4e059  ! 327: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x879561f5  ! 331: WRPR_TT_I	wrpr	%r21, 0x01f5, %tt
	.word 0xb5504000  ! 332: RDPR_TNPC	<illegal instruction>
	.word 0xb5540000  ! 333: RDPR_GL	<illegal instruction>
	.word 0xbfe5e10e  ! 338: SAVE_I	save	%r23, 0x0001, %r31
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 346: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x9195a0c4  ! 348: WRPR_PIL_I	wrpr	%r22, 0x00c4, %pil
	.word 0xb5520000  ! 349: RDPR_PIL	<illegal instruction>
	.word 0xbde56145  ! 350: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e56153  ! 353: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbf504000  ! 356: RDPR_TNPC	<illegal instruction>
	.word 0xb7e4215d  ! 358: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e4a062  ! 361: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e5a1fb  ! 362: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde421e9  ! 365: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e5a121  ! 366: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x89956162  ! 372: WRPR_TICK_I	wrpr	%r21, 0x0162, %tick
	.word 0xbde52094  ! 373: SAVE_I	save	%r20, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e42126  ! 377: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbc1de084  ! 378: XOR_I	xor 	%r23, 0x0084, %r30
	.word 0xbfe52139  ! 380: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5518000  ! 382: RDPR_PSTATE	<illegal instruction>
	setx	0x5f092f4d00001d40, %g1, %r10
	.word 0x839a8000  ! 385: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e521a9  ! 386: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe4a1ee  ! 387: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e4e0db  ! 394: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1540000  ! 395: RDPR_GL	<illegal instruction>
	.word 0xb9e4a1e6  ! 396: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe5e122  ! 397: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb2bc8000  ! 398: XNORcc_R	xnorcc 	%r18, %r0, %r25
	.word 0xb9e4210f  ! 399: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8194e135  ! 402: WRPR_TPC_I	wrpr	%r19, 0x0135, %tpc
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5219b  ! 408: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e5e0a7  ! 410: SAVE_I	save	%r23, 0x0001, %r26
	setx	0xa78c97760000188e, %g1, %r10
	.word 0x819a8000  ! 411: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb20dc000  ! 414: AND_R	and 	%r23, %r0, %r25
	.word 0xbbe4e1a7  ! 416: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe5a135  ! 417: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e460df  ! 421: SAVE_I	save	%r17, 0x0001, %r24
	setx	0xfb4638ce00001852, %g1, %r10
	.word 0x819a8000  ! 423: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbf50c000  ! 424: RDPR_TT	<illegal instruction>
	.word 0xb7e5a0a1  ! 426: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb42ca0ef  ! 427: ANDN_I	andn 	%r18, 0x00ef, %r26
	.word 0xb9e520e5  ! 430: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9520000  ! 431: RDPR_PIL	<illegal instruction>
	.word 0xb1e5a062  ! 435: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e5609b  ! 437: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb0248000  ! 438: SUB_R	sub 	%r18, %r0, %r24
	.word 0xb9e46113  ! 439: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e5601d  ! 440: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x859461fb  ! 442: WRPR_TSTATE_I	wrpr	%r17, 0x01fb, %tstate
	.word 0xb7e5614c  ! 445: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe521e0  ! 448: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e52081  ! 456: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8595a0c1  ! 457: WRPR_TSTATE_I	wrpr	%r22, 0x00c1, %tstate
	.word 0xbeb40000  ! 458: SUBCcc_R	orncc 	%r16, %r0, %r31
	.word 0x839461d1  ! 463: WRPR_TNPC_I	wrpr	%r17, 0x01d1, %tnpc
	setx	data_start_2, %g1, %r21
	.word 0xb5e5613b  ! 469: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbf349000  ! 470: SRLX_R	srlx	%r18, %r0, %r31
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a059  ! 475: SAVE_I	save	%r18, 0x0001, %r30
	mov	0x135, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7510000  ! 477: RDPR_TICK	<illegal instruction>
	.word 0xbfe4e01a  ! 479: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb63c61a8  ! 481: XNOR_I	xnor 	%r17, 0x01a8, %r27
	.word 0xbfe42036  ! 482: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8394e020  ! 484: WRPR_TNPC_I	wrpr	%r19, 0x0020, %tnpc
	.word 0xbd508000  ! 485: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e561f8  ! 488: SAVE_I	save	%r21, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e4a0fd  ! 500: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe4a077  ! 501: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb6c50000  ! 505: ADDCcc_R	addccc 	%r20, %r0, %r27
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 509: RDPR_TT	<illegal instruction>
	.word 0x8794e02f  ! 511: WRPR_TT_I	wrpr	%r19, 0x002f, %tt
	.word 0xb3e4a019  ! 519: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x839521b4  ! 524: WRPR_TNPC_I	wrpr	%r20, 0x01b4, %tnpc
	.word 0xbde46189  ! 525: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8d95602b  ! 526: WRPR_PSTATE_I	wrpr	%r21, 0x002b, %pstate
	.word 0xbfe4e0c0  ! 530: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e4e1de  ! 532: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x89952110  ! 534: WRPR_TICK_I	wrpr	%r20, 0x0110, %tick
	.word 0xb5e52138  ! 536: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe46096  ! 540: SAVE_I	save	%r17, 0x0001, %r29
	mov	1, %r12
	.word 0xa1930000  ! 542: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x302, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a1c0  ! 550: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1518000  ! 552: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e5219a  ! 554: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe5213b  ! 559: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x919521af  ! 564: WRPR_PIL_I	wrpr	%r20, 0x01af, %pil
	.word 0xb5e5603d  ! 567: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5205b  ! 570: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde4a144  ! 573: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde4e055  ! 576: SAVE_I	save	%r19, 0x0001, %r30
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e46181  ! 578: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e460ae  ! 579: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde4e0ea  ! 580: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e4e14b  ! 582: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5500000  ! 586: RDPR_TPC	<illegal instruction>
	.word 0x85956043  ! 590: WRPR_TSTATE_I	wrpr	%r21, 0x0043, %tstate
	setx	0xcd83189300006c05, %g1, %r10
	.word 0x839a8000  ! 591: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd504000  ! 593: RDPR_TNPC	<illegal instruction>
	.word 0xbfe4a11d  ! 595: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x81956047  ! 598: WRPR_TPC_I	wrpr	%r21, 0x0047, %tpc
	.word 0x8395e084  ! 600: WRPR_TNPC_I	wrpr	%r23, 0x0084, %tnpc
	.word 0xb1e5213d  ! 602: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb20d0000  ! 605: AND_R	and 	%r20, %r0, %r25
	.word 0xbde5e142  ! 607: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe52040  ! 608: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9504000  ! 613: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 616: RDPR_TSTATE	<illegal instruction>
	.word 0xb551c000  ! 617: RDPR_TL	<illegal instruction>
	.word 0xbbe5a19f  ! 619: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5500000  ! 623: RDPR_TPC	<illegal instruction>
	.word 0xbbe42127  ! 625: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbf50c000  ! 629: RDPR_TT	<illegal instruction>
	.word 0xbfe4200e  ! 630: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb635a0e4  ! 632: ORN_I	orn 	%r22, 0x00e4, %r27
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879520d2  ! 636: WRPR_TT_I	wrpr	%r20, 0x00d2, %tt
	setx	0xe5daea7f00008cd3, %g1, %r10
	.word 0x819a8000  ! 638: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e4e041  ! 640: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e560f8  ! 644: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb4ac60e3  ! 645: ANDNcc_I	andncc 	%r17, 0x00e3, %r26
	.word 0xb3e5e066  ! 647: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e4a15c  ! 649: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x9195e087  ! 650: WRPR_PIL_I	wrpr	%r23, 0x0087, %pil
	mov	0x109, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a0a1  ! 656: SAVE_I	save	%r18, 0x0001, %r24
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e42135  ! 660: SAVE_I	save	%r16, 0x0001, %r25
	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994e047  ! 671: WRPR_TICK_I	wrpr	%r19, 0x0047, %tick
	.word 0xb7e52176  ! 672: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5a157  ! 673: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3504000  ! 675: RDPR_TNPC	<illegal instruction>
	.word 0xb1e4217f  ! 678: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e5a0d5  ! 679: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e460fc  ! 683: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe4e06a  ! 686: SAVE_I	save	%r19, 0x0001, %r31
	mov	0, %r12
	.word 0x8f930000  ! 689: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe4e064  ! 696: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8994e1df  ! 697: WRPR_TICK_I	wrpr	%r19, 0x01df, %tick
	mov	2, %r12
	.word 0x8f930000  ! 698: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3518000  ! 700: RDPR_PSTATE	<illegal instruction>
	.word 0xb5518000  ! 701: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e4a08c  ! 702: SAVE_I	save	%r18, 0x0001, %r27
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194a017  ! 707: WRPR_PIL_I	wrpr	%r18, 0x0017, %pil
	.word 0xb1e4a15c  ! 708: SAVE_I	save	%r18, 0x0001, %r24
	setx	0xa93e531b00005918, %g1, %r10
	.word 0x819a8000  ! 711: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e4603e  ! 712: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde46106  ! 713: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8d95e173  ! 714: WRPR_PSTATE_I	wrpr	%r23, 0x0173, %pstate
	.word 0xbfe56177  ! 716: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe561a8  ! 719: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde4e1b6  ! 720: SAVE_I	save	%r19, 0x0001, %r30
	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e0c0  ! 726: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e5e0f6  ! 728: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e5603a  ! 733: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e4e12e  ! 737: SAVE_I	save	%r19, 0x0001, %r28
	setx	0xa92c1c120000bb4b, %g1, %r10
	.word 0x819a8000  ! 738: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde4a136  ! 741: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb551c000  ! 743: RDPR_TL	<illegal instruction>
	.word 0xb8bd0000  ! 745: XNORcc_R	xnorcc 	%r20, %r0, %r28
	.word 0xbb508000  ! 746: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e4a0f9  ! 747: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e4a15d  ! 750: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e4e159  ! 754: SAVE_I	save	%r19, 0x0001, %r25
	mov	0, %r12
	.word 0xa1930000  ! 758: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3e46060  ! 759: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e5e1d1  ! 766: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8595e106  ! 769: WRPR_TSTATE_I	wrpr	%r23, 0x0106, %tstate
	mov	0x314, %o0
	ta	T_SEND_THRD_INTR
	.word 0x859460d5  ! 772: WRPR_TSTATE_I	wrpr	%r17, 0x00d5, %tstate
	setx	0xa155a63e00001ace, %g1, %r10
	.word 0x839a8000  ! 773: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfe4e159  ! 774: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e420b8  ! 775: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e5e060  ! 776: SAVE_I	save	%r23, 0x0001, %r27
	mov	0x119, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e42079  ! 779: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe5e1f3  ! 781: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e4a0dc  ! 782: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e520f6  ! 783: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e5e002  ! 784: SAVE_I	save	%r23, 0x0001, %r27
	mov	1, %r12
	.word 0x8f930000  ! 785: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbde4a1bc  ! 787: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e521e0  ! 788: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x91952192  ! 791: WRPR_PIL_I	wrpr	%r20, 0x0192, %pil
	.word 0x8394e06d  ! 792: WRPR_TNPC_I	wrpr	%r19, 0x006d, %tnpc
	.word 0xbfe46088  ! 793: SAVE_I	save	%r17, 0x0001, %r31
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0852034  ! 797: ADDcc_I	addcc 	%r20, 0x0034, %r24
	.word 0xb9e5a0d4  ! 799: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbf510000  ! 800: RDPR_TICK	<illegal instruction>
	.word 0x8794218d  ! 801: WRPR_TT_I	wrpr	%r16, 0x018d, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x81942187  ! 804: WRPR_TPC_I	wrpr	%r16, 0x0187, %tpc
	.word 0xb7641800  ! 807: MOVcc_R	<illegal instruction>
	.word 0xb3e5a001  ! 808: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e46133  ! 810: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbf510000  ! 811: RDPR_TICK	<illegal instruction>
	.word 0xb29d21a0  ! 812: XORcc_I	xorcc 	%r20, 0x01a0, %r25
	.word 0xbde46014  ! 815: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe4205a  ! 818: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8394a153  ! 821: WRPR_TNPC_I	wrpr	%r18, 0x0153, %tnpc
	mov	0x200, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e05f  ! 824: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e56032  ! 826: SAVE_I	save	%r21, 0x0001, %r27
	mov	0x8, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r19
	mov	2, %r12
	.word 0xa1930000  ! 837: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x218, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe560e9  ! 843: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbd51c000  ! 846: RDPR_TL	<illegal instruction>
	.word 0xb1e56033  ! 853: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde460b2  ! 855: SAVE_I	save	%r17, 0x0001, %r30
	mov	0, %r12
	.word 0x8f930000  ! 858: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8995e07c  ! 859: WRPR_TICK_I	wrpr	%r23, 0x007c, %tick
	.word 0xb3e4a1f1  ! 864: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb615a19e  ! 867: OR_I	or 	%r22, 0x019e, %r27
	.word 0xbf510000  ! 868: RDPR_TICK	<illegal instruction>
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40420eb  ! 874: ADD_I	add 	%r16, 0x00eb, %r26
	.word 0xb1e56149  ! 875: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x62c9db6600001d80, %g1, %r10
	.word 0x819a8000  ! 877: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xf2fa9e9c0000cc01, %g1, %r10
	.word 0x819a8000  ! 879: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e5e103  ! 880: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb6850000  ! 883: ADDcc_R	addcc 	%r20, %r0, %r27
	.word 0xb3510000  ! 886: RDPR_TICK	<illegal instruction>
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	mov	0x38, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e1c6  ! 892: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb8ad8000  ! 895: ANDNcc_R	andncc 	%r22, %r0, %r28
	.word 0xb3e5a14a  ! 898: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbe840000  ! 903: ADDcc_R	addcc 	%r16, %r0, %r31
	mov	0, %r12
	.word 0x8f930000  ! 906: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4619f  ! 908: SAVE_I	save	%r17, 0x0001, %r27
	setx	data_start_7, %g1, %r21
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	setx	0xc6c09cfc00000a87, %g1, %r10
	.word 0x819a8000  ! 917: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb51c000  ! 919: RDPR_TL	<illegal instruction>
	.word 0xb9e46012  ! 923: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7643801  ! 926: MOVcc_I	<illegal instruction>
	.word 0xb5e52033  ! 930: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e5a109  ! 931: SAVE_I	save	%r22, 0x0001, %r28
	mov	2, %r12
	.word 0xa1930000  ! 932: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb83d8000  ! 935: XNOR_R	xnor 	%r22, %r0, %r28
	setx	0x2e8da17900009c43, %g1, %r10
	.word 0x839a8000  ! 936: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd480000  ! 937: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	mov	2, %r12
	.word 0x8f930000  ! 939: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe520ce  ! 940: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x89952119  ! 942: WRPR_TICK_I	wrpr	%r20, 0x0119, %tick
	.word 0xb5e5a0c2  ! 944: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb28521ac  ! 945: ADDcc_I	addcc 	%r20, 0x01ac, %r25
	.word 0xbde5e0d4  ! 948: SAVE_I	save	%r23, 0x0001, %r30
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62d60bd  ! 952: ANDN_I	andn 	%r21, 0x00bd, %r27
	.word 0xb951c000  ! 957: RDPR_TL	<illegal instruction>
	.word 0xbb50c000  ! 958: RDPR_TT	<illegal instruction>
	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a48000  ! 965: SUBcc_R	subcc 	%r18, %r0, %r26
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a024  ! 970: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e521d3  ! 975: SAVE_I	save	%r20, 0x0001, %r26
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r19
	.word 0x8d9561cd  ! 984: WRPR_PSTATE_I	wrpr	%r21, 0x01cd, %pstate
	.word 0xb3e4e020  ! 989: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8595e118  ! 992: WRPR_TSTATE_I	wrpr	%r23, 0x0118, %tstate
	mov	0x39, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e1c5  ! 994: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x9194a01c  ! 996: WRPR_PIL_I	wrpr	%r18, 0x001c, %pil
	.word 0x8595213b  ! 997: WRPR_TSTATE_I	wrpr	%r20, 0x013b, %tstate
	.word 0xb9540000  ! 998: RDPR_GL	<illegal instruction>
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
	.word 0x9194a1eb  ! 1: WRPR_PIL_I	wrpr	%r18, 0x01eb, %pil
	.word 0xbc958000  ! 3: ORcc_R	orcc 	%r22, %r0, %r30
	setx	0x5adb386e0000bb9d, %g1, %r10
	.word 0x819a8000  ! 4: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8795203d  ! 6: WRPR_TT_I	wrpr	%r20, 0x003d, %tt
	.word 0xfc754000  ! 7: STX_R	stx	%r30, [%r21 + %r0]
	setx	0x6baf8e7500006b8f, %g1, %r10
	.word 0x819a8000  ! 9: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	1, %r12
	.word 0x8f930000  ! 12: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf540000  ! 13: RDPR_GL	rdpr	%-, %r31
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03c0000  ! 17: STD_R	std	%r24, [%r16 + %r0]
	.word 0xb93cc000  ! 22: SRA_R	sra 	%r19, %r0, %r28
	.word 0xfa244000  ! 25: STW_R	stw	%r29, [%r17 + %r0]
	setx	data_start_1, %g1, %r16
	mov	0x216, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 31: RDPR_PSTATE	<illegal instruction>
	.word 0xf83ce1fd  ! 34: STD_I	std	%r28, [%r19 + 0x01fd]
	.word 0xf53c0000  ! 36: STDF_R	std	%f26, [%r0, %r16]
	.word 0xf83cc000  ! 38: STD_R	std	%r28, [%r19 + %r0]
	.word 0xb8c4a021  ! 39: ADDCcc_I	addccc 	%r18, 0x0021, %r28
	.word 0xf22c0000  ! 40: STB_R	stb	%r25, [%r16 + %r0]
	setx	data_start_4, %g1, %r19
	.word 0x819421d7  ! 44: WRPR_TPC_I	wrpr	%r16, 0x01d7, %tpc
	.word 0xf82421e5  ! 45: STW_I	stw	%r28, [%r16 + 0x01e5]
	.word 0xbf540000  ! 46: RDPR_GL	rdpr	%-, %r31
	.word 0xf2350000  ! 47: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xf6758000  ! 49: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xbf540000  ! 51: RDPR_GL	<illegal instruction>
	.word 0xf275a006  ! 53: STX_I	stx	%r25, [%r22 + 0x0006]
	.word 0x899420af  ! 55: WRPR_TICK_I	wrpr	%r16, 0x00af, %tick
	.word 0xf824c000  ! 57: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xfb3d0000  ! 60: STDF_R	std	%f29, [%r0, %r20]
	.word 0xbd508000  ! 61: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xb884c000  ! 76: ADDcc_R	addcc 	%r19, %r0, %r28
	.word 0xf03dc000  ! 78: STD_R	std	%r24, [%r23 + %r0]
	.word 0xf235a11b  ! 79: STH_I	sth	%r25, [%r22 + 0x011b]
	.word 0xf23c0000  ! 80: STD_R	std	%r25, [%r16 + %r0]
	.word 0xfd3ce1b4  ! 81: STDF_I	std	%f30, [0x01b4, %r19]
	.word 0xbf50c000  ! 83: RDPR_TT	<illegal instruction>
	.word 0xb1504000  ! 85: RDPR_TNPC	<illegal instruction>
	.word 0xfe3c4000  ! 86: STD_R	std	%r31, [%r17 + %r0]
	setx	0x677dcac2000099cf, %g1, %r10
	.word 0x819a8000  ! 89: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc3c0000  ! 90: STD_R	std	%r30, [%r16 + %r0]
	.word 0x85952073  ! 95: WRPR_TSTATE_I	wrpr	%r20, 0x0073, %tstate
	.word 0xf22c4000  ! 98: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xb09ce101  ! 101: XORcc_I	xorcc 	%r19, 0x0101, %r24
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 106: RDPR_TICK	rdpr	%tick, %r30
	.word 0xbabda040  ! 107: XNORcc_I	xnorcc 	%r22, 0x0040, %r29
	.word 0xf2354000  ! 111: STH_R	sth	%r25, [%r21 + %r0]
	mov	0x230, %o0
	ta	T_SEND_THRD_INTR
	setx	0xded0f0710000cd54, %g1, %r10
	.word 0x819a8000  ! 115: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x8258c2af00003b95, %g1, %r10
	.word 0x819a8000  ! 116: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa748000  ! 117: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xf634e00d  ! 120: STH_I	sth	%r27, [%r19 + 0x000d]
	.word 0xf93d21df  ! 124: STDF_I	std	%f28, [0x01df, %r20]
	.word 0xf875c000  ! 125: STX_R	stx	%r28, [%r23 + %r0]
	mov	1, %r12
	.word 0xa1930000  ! 132: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbf50c000  ! 134: RDPR_TT	rdpr	%tt, %r31
	.word 0xfd3cc000  ! 139: STDF_R	std	%f30, [%r0, %r19]
	.word 0xf93c0000  ! 145: STDF_R	std	%f28, [%r0, %r16]
	.word 0xb88de17a  ! 147: ANDcc_I	andcc 	%r23, 0x017a, %r28
	.word 0xfc3521a2  ! 148: STH_I	sth	%r30, [%r20 + 0x01a2]
	.word 0xb3504000  ! 151: RDPR_TNPC	<illegal instruction>
	.word 0xf0744000  ! 152: STX_R	stx	%r24, [%r17 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 155: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb951c000  ! 157: RDPR_TL	rdpr	%tl, %r28
	.word 0xf03460c6  ! 158: STH_I	sth	%r24, [%r17 + 0x00c6]
	.word 0xf47520cf  ! 159: STX_I	stx	%r26, [%r20 + 0x00cf]
	.word 0xf425a0a7  ! 162: STW_I	stw	%r26, [%r22 + 0x00a7]
	.word 0xbd508000  ! 176: RDPR_TSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r17
	.word 0xf43ca1c5  ! 178: STD_I	std	%r26, [%r18 + 0x01c5]
	.word 0xf63c207b  ! 180: STD_I	std	%r27, [%r16 + 0x007b]
	.word 0xf275603d  ! 184: STX_I	stx	%r25, [%r21 + 0x003d]
	.word 0xfc340000  ! 188: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xb93cb001  ! 189: SRAX_I	srax	%r18, 0x0001, %r28
	.word 0xfc74e179  ! 193: STX_I	stx	%r30, [%r19 + 0x0179]
	.word 0xb92db001  ! 194: SLLX_I	sllx	%r22, 0x0001, %r28
	.word 0xba4460db  ! 196: ADDC_I	addc 	%r17, 0x00db, %r29
	.word 0xb5510000  ! 201: RDPR_TICK	<illegal instruction>
	.word 0xfa25202b  ! 203: STW_I	stw	%r29, [%r20 + 0x002b]
	.word 0xfa3de1ed  ! 206: STD_I	std	%r29, [%r23 + 0x01ed]
	mov	0x115, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf474e1df  ! 213: STX_I	stx	%r26, [%r19 + 0x01df]
	.word 0xf6748000  ! 215: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xf22ca195  ! 216: STB_I	stb	%r25, [%r18 + 0x0195]
	.word 0xfa2d8000  ! 217: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xfe250000  ! 222: STW_R	stw	%r31, [%r20 + %r0]
	.word 0x8d95208d  ! 223: WRPR_PSTATE_I	wrpr	%r20, 0x008d, %pstate
	mov	0x13a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2de048  ! 226: STB_I	stb	%r30, [%r23 + 0x0048]
	.word 0xbc956152  ! 227: ORcc_I	orcc 	%r21, 0x0152, %r30
	.word 0xf424e185  ! 228: STW_I	stw	%r26, [%r19 + 0x0185]
	.word 0xb350c000  ! 230: RDPR_TT	rdpr	%tt, %r25
	.word 0xf675e0d4  ! 233: STX_I	stx	%r27, [%r23 + 0x00d4]
	mov	2, %r12
	.word 0xa1930000  ! 234: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25c000  ! 243: STW_R	stw	%r30, [%r23 + %r0]
	.word 0x899420f6  ! 245: WRPR_TICK_I	wrpr	%r16, 0x00f6, %tick
	.word 0xf0250000  ! 247: STW_R	stw	%r24, [%r20 + %r0]
	mov	0x22b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x3c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2520d2  ! 254: STW_I	stw	%r31, [%r20 + 0x00d2]
	mov	0x214, %o0
	ta	T_SEND_THRD_INTR
	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf874a013  ! 260: STX_I	stx	%r28, [%r18 + 0x0013]
	.word 0xfc25e1a9  ! 264: STW_I	stw	%r30, [%r23 + 0x01a9]
	.word 0xbb504000  ! 266: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xfa3da007  ! 269: STD_I	std	%r29, [%r22 + 0x0007]
	.word 0xb9643801  ! 271: MOVcc_I	<illegal instruction>
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23561f1  ! 283: ORN_I	orn 	%r21, 0x01f1, %r25
	.word 0xff3c4000  ! 291: STDF_R	std	%f31, [%r0, %r17]
	.word 0xbf504000  ! 293: RDPR_TNPC	<illegal instruction>
	mov	0x12d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 295: RDPR_TL	<illegal instruction>
	.word 0xfe3d8000  ! 303: STD_R	std	%r31, [%r22 + %r0]
	.word 0xfe750000  ! 305: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xb7504000  ! 306: RDPR_TNPC	<illegal instruction>
	.word 0xfc3da1a7  ! 307: STD_I	std	%r30, [%r22 + 0x01a7]
	.word 0xf02421fb  ! 309: STW_I	stw	%r24, [%r16 + 0x01fb]
	.word 0xfd3d60a8  ! 310: STDF_I	std	%f30, [0x00a8, %r21]
	setx	data_start_6, %g1, %r19
	.word 0xf63ca025  ! 313: STD_I	std	%r27, [%r18 + 0x0025]
	.word 0xbf540000  ! 315: RDPR_GL	<illegal instruction>
	.word 0xb9510000  ! 316: RDPR_TICK	<illegal instruction>
	.word 0xb9500000  ! 317: RDPR_TPC	<illegal instruction>
	.word 0x8d95603b  ! 318: WRPR_PSTATE_I	wrpr	%r21, 0x003b, %pstate
	.word 0xb0ace157  ! 319: ANDNcc_I	andncc 	%r19, 0x0157, %r24
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595e034  ! 325: WRPR_TSTATE_I	wrpr	%r23, 0x0034, %tstate
	.word 0x8794613f  ! 331: WRPR_TT_I	wrpr	%r17, 0x013f, %tt
	.word 0xb7504000  ! 332: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xbd540000  ! 333: RDPR_GL	<illegal instruction>
	.word 0xf025c000  ! 334: STW_R	stw	%r24, [%r23 + %r0]
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf834e088  ! 342: STH_I	sth	%r28, [%r19 + 0x0088]
	.word 0xfd3dc000  ! 345: STDF_R	std	%f30, [%r0, %r23]
	.word 0xb9480000  ! 346: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x9194e1c9  ! 348: WRPR_PIL_I	wrpr	%r19, 0x01c9, %pil
	.word 0xbd520000  ! 349: RDPR_PIL	rdpr	%pil, %r30
	.word 0xf2240000  ! 354: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xb9504000  ! 356: RDPR_TNPC	<illegal instruction>
	.word 0xf82c4000  ! 357: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xfc246184  ! 370: STW_I	stw	%r30, [%r17 + 0x0184]
	.word 0x89946016  ! 372: WRPR_TICK_I	wrpr	%r17, 0x0016, %tick
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb01d2065  ! 378: XOR_I	xor 	%r20, 0x0065, %r24
	.word 0xb9518000  ! 382: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xf73de155  ! 383: STDF_I	std	%f27, [0x0155, %r23]
	setx	0x71f979b20000cf53, %g1, %r10
	.word 0x839a8000  ! 385: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf33c0000  ! 390: STDF_R	std	%f25, [%r0, %r16]
	.word 0xf83d8000  ! 393: STD_R	std	%r28, [%r22 + %r0]
	.word 0xbf540000  ! 395: RDPR_GL	rdpr	%-, %r31
	.word 0xbebc8000  ! 398: XNORcc_R	xnorcc 	%r18, %r0, %r31
	.word 0x8195a119  ! 402: WRPR_TPC_I	wrpr	%r22, 0x0119, %tpc
	.word 0xfc2d4000  ! 403: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xfa2d21db  ! 404: STB_I	stb	%r29, [%r20 + 0x01db]
	.word 0xfa258000  ! 405: STW_R	stw	%r29, [%r22 + %r0]
	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	setx	0xd63030db00006f19, %g1, %r10
	.word 0x819a8000  ! 411: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb60c4000  ! 414: AND_R	and 	%r17, %r0, %r27
	.word 0xf635c000  ! 415: STH_R	sth	%r27, [%r23 + %r0]
	setx	0xbcc94b1400007c1d, %g1, %r10
	.word 0x819a8000  ! 423: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbd50c000  ! 424: RDPR_TT	rdpr	%tt, %r30
	.word 0xf475c000  ! 425: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xb62d6107  ! 427: ANDN_I	andn 	%r21, 0x0107, %r27
	.word 0xbb520000  ! 431: RDPR_PIL	<illegal instruction>
	.word 0xfa75c000  ! 433: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xbe24c000  ! 438: SUB_R	sub 	%r19, %r0, %r31
	.word 0x8594614b  ! 442: WRPR_TSTATE_I	wrpr	%r17, 0x014b, %tstate
	.word 0xfc3d8000  ! 447: STD_R	std	%r30, [%r22 + %r0]
	.word 0xfe754000  ! 449: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xfe35c000  ! 452: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xf8744000  ! 455: STX_R	stx	%r28, [%r17 + %r0]
	.word 0x8594e1cb  ! 457: WRPR_TSTATE_I	wrpr	%r19, 0x01cb, %tstate
	.word 0xbab50000  ! 458: SUBCcc_R	orncc 	%r20, %r0, %r29
	.word 0xfa340000  ! 459: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xf63561a2  ! 461: STH_I	sth	%r27, [%r21 + 0x01a2]
	.word 0x8394611d  ! 463: WRPR_TNPC_I	wrpr	%r17, 0x011d, %tnpc
	.word 0xf87421d3  ! 465: STX_I	stx	%r28, [%r16 + 0x01d3]
	.word 0xf42d2128  ! 466: STB_I	stb	%r26, [%r20 + 0x0128]
	setx	data_start_2, %g1, %r18
	.word 0xb534d000  ! 470: SRLX_R	srlx	%r19, %r0, %r26
	.word 0xf4350000  ! 472: STH_R	sth	%r26, [%r20 + %r0]
	mov	0x137, %o0
	ta	T_SEND_THRD_INTR
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 477: RDPR_TICK	rdpr	%tick, %r29
	.word 0xfa346144  ! 478: STH_I	sth	%r29, [%r17 + 0x0144]
	.word 0xb23ce11b  ! 481: XNOR_I	xnor 	%r19, 0x011b, %r25
	.word 0x8395a000  ! 484: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb5508000  ! 485: RDPR_TSTATE	rdpr	%tstate, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0348000  ! 490: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xfa742186  ! 491: STX_I	stx	%r29, [%r16 + 0x0186]
	.word 0xf33dc000  ! 493: STDF_R	std	%f25, [%r0, %r23]
	.word 0xfb3c61dc  ! 497: STDF_I	std	%f29, [0x01dc, %r17]
	.word 0xf03c61e7  ! 498: STD_I	std	%r24, [%r17 + 0x01e7]
	.word 0xf6358000  ! 504: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xb2c58000  ! 505: ADDCcc_R	addccc 	%r22, %r0, %r25
	.word 0xf23561ee  ! 506: STH_I	sth	%r25, [%r21 + 0x01ee]
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 509: RDPR_TT	<illegal instruction>
	.word 0xf13c4000  ! 510: STDF_R	std	%f24, [%r0, %r17]
	.word 0x879420f3  ! 511: WRPR_TT_I	wrpr	%r16, 0x00f3, %tt
	.word 0xf435a0bb  ! 518: STH_I	sth	%r26, [%r22 + 0x00bb]
	.word 0x8394e1d6  ! 524: WRPR_TNPC_I	wrpr	%r19, 0x01d6, %tnpc
	.word 0x8d94e0ea  ! 526: WRPR_PSTATE_I	wrpr	%r19, 0x00ea, %pstate
	.word 0xfe2c8000  ! 527: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xfc3de020  ! 528: STD_I	std	%r30, [%r23 + 0x0020]
	.word 0x8995e045  ! 534: WRPR_TICK_I	wrpr	%r23, 0x0045, %tick
	.word 0xf02ca066  ! 539: STB_I	stb	%r24, [%r18 + 0x0066]
	mov	2, %r12
	.word 0xa1930000  ! 542: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf63dc000  ! 547: STD_R	std	%r27, [%r23 + %r0]
	mov	0x17, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 552: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xf62c4000  ! 561: STB_R	stb	%r27, [%r17 + %r0]
	.word 0x91956084  ! 564: WRPR_PIL_I	wrpr	%r21, 0x0084, %pil
	.word 0xfe3d8000  ! 565: STD_R	std	%r31, [%r22 + %r0]
	.word 0xf235c000  ! 566: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xfb3ca116  ! 568: STDF_I	std	%f29, [0x0116, %r18]
	.word 0xf42d4000  ! 569: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xfa3d4000  ! 571: STD_R	std	%r29, [%r21 + %r0]
	.word 0xf33c612d  ! 572: STDF_I	std	%f25, [0x012d, %r17]
	mov	0x339, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf13d4000  ! 584: STDF_R	std	%f24, [%r0, %r21]
	.word 0xfe3c2011  ! 585: STD_I	std	%r31, [%r16 + 0x0011]
	.word 0xbb500000  ! 586: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xf42421f6  ! 588: STW_I	stw	%r26, [%r16 + 0x01f6]
	.word 0x8595e01d  ! 590: WRPR_TSTATE_I	wrpr	%r23, 0x001d, %tstate
	setx	0x6651b95500004d5d, %g1, %r10
	.word 0x839a8000  ! 591: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7504000  ! 593: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8194210d  ! 598: WRPR_TPC_I	wrpr	%r16, 0x010d, %tpc
	.word 0xf824c000  ! 599: STW_R	stw	%r28, [%r19 + %r0]
	.word 0x83946086  ! 600: WRPR_TNPC_I	wrpr	%r17, 0x0086, %tnpc
	.word 0xb40c4000  ! 605: AND_R	and 	%r17, %r0, %r26
	.word 0xfa7421d2  ! 609: STX_I	stx	%r29, [%r16 + 0x01d2]
	.word 0xfa2d4000  ! 612: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xb1504000  ! 613: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xbd508000  ! 616: RDPR_TSTATE	<illegal instruction>
	.word 0xb751c000  ! 617: RDPR_TL	<illegal instruction>
	.word 0xfe3c8000  ! 620: STD_R	std	%r31, [%r18 + %r0]
	.word 0xb9500000  ! 623: RDPR_TPC	<illegal instruction>
	.word 0xb150c000  ! 629: RDPR_TT	<illegal instruction>
	.word 0xbc352157  ! 632: ORN_I	orn 	%r20, 0x0157, %r30
	.word 0xf235a122  ! 634: STH_I	sth	%r25, [%r22 + 0x0122]
	mov	0x105, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794e10c  ! 636: WRPR_TT_I	wrpr	%r19, 0x010c, %tt
	setx	0x219b6c720000cedc, %g1, %r10
	.word 0x819a8000  ! 638: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb8aca14d  ! 645: ANDNcc_I	andncc 	%r18, 0x014d, %r28
	.word 0x91952143  ! 650: WRPR_PIL_I	wrpr	%r20, 0x0143, %pil
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfd3ce1fe  ! 655: STDF_I	std	%f30, [0x01fe, %r19]
	.word 0xf2358000  ! 657: STH_R	sth	%r25, [%r22 + %r0]
	mov	0x206, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3c20e3  ! 659: STDF_I	std	%f31, [0x00e3, %r16]
	mov	0x22a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434e092  ! 667: STH_I	sth	%r26, [%r19 + 0x0092]
	.word 0xfc24a188  ! 669: STW_I	stw	%r30, [%r18 + 0x0188]
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8995a036  ! 671: WRPR_TICK_I	wrpr	%r22, 0x0036, %tick
	.word 0xfc74e0a7  ! 674: STX_I	stx	%r30, [%r19 + 0x00a7]
	.word 0xb5504000  ! 675: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xfc742008  ! 676: STX_I	stx	%r30, [%r16 + 0x0008]
	.word 0xfb3c0000  ! 677: STDF_R	std	%f29, [%r0, %r16]
	.word 0xf224e033  ! 681: STW_I	stw	%r25, [%r19 + 0x0033]
	.word 0xff3c4000  ! 682: STDF_R	std	%f31, [%r0, %r17]
	.word 0xf624c000  ! 684: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xf02da106  ! 687: STB_I	stb	%r24, [%r22 + 0x0106]
	mov	1, %r12
	.word 0x8f930000  ! 689: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x89952107  ! 697: WRPR_TICK_I	wrpr	%r20, 0x0107, %tick
	mov	0, %r12
	.word 0x8f930000  ! 698: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf4246151  ! 699: STW_I	stw	%r26, [%r17 + 0x0151]
	.word 0xbf518000  ! 700: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xb1518000  ! 701: RDPR_PSTATE	<illegal instruction>
	.word 0xf0740000  ! 703: STX_R	stx	%r24, [%r16 + %r0]
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c8000  ! 705: STB_R	stb	%r29, [%r18 + %r0]
	.word 0x91946119  ! 707: WRPR_PIL_I	wrpr	%r17, 0x0119, %pil
	.word 0xfc7520ee  ! 709: STX_I	stx	%r30, [%r20 + 0x00ee]
	setx	0x5c79a07f00000b51, %g1, %r10
	.word 0x819a8000  ! 711: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d95a0af  ! 714: WRPR_PSTATE_I	wrpr	%r22, 0x00af, %pstate
	mov	0x32b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75a00a  ! 731: STX_I	stx	%r29, [%r22 + 0x000a]
	.word 0xf2752136  ! 734: STX_I	stx	%r25, [%r20 + 0x0136]
	.word 0xf8344000  ! 736: STH_R	sth	%r28, [%r17 + %r0]
	setx	0x36ae9b2b0000ccdb, %g1, %r10
	.word 0x819a8000  ! 738: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb751c000  ! 743: RDPR_TL	rdpr	%tl, %r27
	.word 0xbabc8000  ! 745: XNORcc_R	xnorcc 	%r18, %r0, %r29
	.word 0xb5508000  ! 746: RDPR_TSTATE	<illegal instruction>
	.word 0xfa2c0000  ! 748: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xf43d4000  ! 751: STD_R	std	%r26, [%r21 + %r0]
	.word 0xfe25c000  ! 753: STW_R	stw	%r31, [%r23 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 758: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa352158  ! 760: STH_I	sth	%r29, [%r20 + 0x0158]
	.word 0xfa3c61ec  ! 761: STD_I	std	%r29, [%r17 + 0x01ec]
	.word 0xfa74e0c3  ! 768: STX_I	stx	%r29, [%r19 + 0x00c3]
	.word 0x859461d7  ! 769: WRPR_TSTATE_I	wrpr	%r17, 0x01d7, %tstate
	mov	0x129, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594e034  ! 772: WRPR_TSTATE_I	wrpr	%r19, 0x0034, %tstate
	setx	0x768379210000bb07, %g1, %r10
	.word 0x839a8000  ! 773: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x12b, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 785: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc7561d6  ! 790: STX_I	stx	%r30, [%r21 + 0x01d6]
	.word 0x9195a00f  ! 791: WRPR_PIL_I	wrpr	%r22, 0x000f, %pil
	.word 0x8394e1b7  ! 792: WRPR_TNPC_I	wrpr	%r19, 0x01b7, %tnpc
	.word 0xf22c2108  ! 794: STB_I	stb	%r25, [%r16 + 0x0108]
	mov	0x309, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb484e06a  ! 797: ADDcc_I	addcc 	%r19, 0x006a, %r26
	.word 0xf22c6153  ! 798: STB_I	stb	%r25, [%r17 + 0x0153]
	.word 0xb7510000  ! 800: RDPR_TICK	rdpr	%tick, %r27
	.word 0x87952051  ! 801: WRPR_TT_I	wrpr	%r20, 0x0051, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf675c000  ! 803: STX_R	stx	%r27, [%r23 + %r0]
	.word 0x81946065  ! 804: WRPR_TPC_I	wrpr	%r17, 0x0065, %tpc
	.word 0xf53d215e  ! 806: STDF_I	std	%f26, [0x015e, %r20]
	.word 0xb5641800  ! 807: MOVcc_R	<illegal instruction>
	.word 0xb3510000  ! 811: RDPR_TICK	rdpr	%tick, %r25
	.word 0xb89d611a  ! 812: XORcc_I	xorcc 	%r21, 0x011a, %r28
	.word 0xf6358000  ! 813: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf33d21f2  ! 816: STDF_I	std	%f25, [0x01f2, %r20]
	.word 0xf8258000  ! 819: STW_R	stw	%r28, [%r22 + %r0]
	.word 0x839521b5  ! 821: WRPR_TNPC_I	wrpr	%r20, 0x01b5, %tnpc
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2258000  ! 828: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf43d8000  ! 829: STD_R	std	%r26, [%r22 + %r0]
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	.word 0xf33c21db  ! 834: STDF_I	std	%f25, [0x01db, %r16]
	.word 0xf024a133  ! 836: STW_I	stw	%r24, [%r18 + 0x0133]
	mov	1, %r12
	.word 0xa1930000  ! 837: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfb3d610c  ! 839: STDF_I	std	%f29, [0x010c, %r21]
	mov	0x12f, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe3c0000  ! 844: STD_R	std	%r31, [%r16 + %r0]
	.word 0xb351c000  ! 846: RDPR_TL	rdpr	%tl, %r25
	.word 0xf4258000  ! 847: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xfc3d4000  ! 848: STD_R	std	%r30, [%r21 + %r0]
	.word 0xf22d2096  ! 850: STB_I	stb	%r25, [%r20 + 0x0096]
	.word 0xfe25609e  ! 852: STW_I	stw	%r31, [%r21 + 0x009e]
	mov	0, %r12
	.word 0x8f930000  ! 858: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x899420f8  ! 859: WRPR_TICK_I	wrpr	%r16, 0x00f8, %tick
	.word 0xf074a1e1  ! 865: STX_I	stx	%r24, [%r18 + 0x01e1]
	.word 0xb214a1b9  ! 867: OR_I	or 	%r18, 0x01b9, %r25
	.word 0xbd510000  ! 868: RDPR_TICK	rdpr	%tick, %r30
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe750000  ! 871: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf0356037  ! 873: STH_I	sth	%r24, [%r21 + 0x0037]
	.word 0xb80461a5  ! 874: ADD_I	add 	%r17, 0x01a5, %r28
	.word 0xf834a08a  ! 876: STH_I	sth	%r28, [%r18 + 0x008a]
	setx	0xd4c3c49d0000afc7, %g1, %r10
	.word 0x819a8000  ! 877: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xff82209c00001ac3, %g1, %r10
	.word 0x819a8000  ! 879: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf53c6017  ! 881: STDF_I	std	%f26, [0x0017, %r17]
	.word 0xff3d4000  ! 882: STDF_R	std	%f31, [%r0, %r21]
	.word 0xb8850000  ! 883: ADDcc_R	addcc 	%r20, %r0, %r28
	.word 0xf82c8000  ! 884: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xbd510000  ! 886: RDPR_TICK	rdpr	%tick, %r30
	.word 0xf2258000  ! 887: STW_R	stw	%r25, [%r22 + %r0]
	mov	0x206, %o0
	ta	T_SEND_THRD_INTR
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8ad4000  ! 895: ANDNcc_R	andncc 	%r21, %r0, %r28
	.word 0xb0840000  ! 903: ADDcc_R	addcc 	%r16, %r0, %r24
	mov	1, %r12
	.word 0x8f930000  ! 906: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x23a, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r16
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	setx	0xe1940ee900003e07, %g1, %r10
	.word 0x819a8000  ! 917: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb51c000  ! 919: RDPR_TL	rdpr	%tl, %r29
	.word 0xf73d0000  ! 921: STDF_R	std	%f27, [%r0, %r20]
	.word 0xf225c000  ! 924: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xbf643801  ! 926: MOVcc_I	<illegal instruction>
	.word 0xf42c0000  ! 928: STB_R	stb	%r26, [%r16 + %r0]
	mov	1, %r12
	.word 0xa1930000  ! 932: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf63c4000  ! 934: STD_R	std	%r27, [%r17 + %r0]
	.word 0xb23c0000  ! 935: XNOR_R	xnor 	%r16, %r0, %r25
	setx	0x397bcfdf0000fe85, %g1, %r10
	.word 0x839a8000  ! 936: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1480000  ! 937: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	1, %r12
	.word 0x8f930000  ! 939: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8994618f  ! 942: WRPR_TICK_I	wrpr	%r17, 0x018f, %tick
	.word 0xfe35e170  ! 943: STH_I	sth	%r31, [%r23 + 0x0170]
	.word 0xbe8520d6  ! 945: ADDcc_I	addcc 	%r20, 0x00d6, %r31
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4750000  ! 951: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xb42c202b  ! 952: ANDN_I	andn 	%r16, 0x002b, %r26
	.word 0xfc25a12a  ! 956: STW_I	stw	%r30, [%r22 + 0x012a]
	.word 0xb151c000  ! 957: RDPR_TL	rdpr	%tl, %r24
	.word 0xb550c000  ! 958: RDPR_TT	<illegal instruction>
	.word 0xfa25c000  ! 960: STW_R	stw	%r29, [%r23 + %r0]
	mov	0x31d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a54000  ! 965: SUBcc_R	subcc 	%r21, %r0, %r27
	mov	0x20a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf474a069  ! 967: STX_I	stx	%r26, [%r18 + 0x0069]
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r23
	.word 0xf82cc000  ! 982: STB_R	stb	%r28, [%r19 + %r0]
	.word 0x8d95e1f5  ! 984: WRPR_PSTATE_I	wrpr	%r23, 0x01f5, %pstate
	.word 0xf93d0000  ! 985: STDF_R	std	%f28, [%r0, %r20]
	.word 0xfa756123  ! 987: STX_I	stx	%r29, [%r21 + 0x0123]
	.word 0x859460f4  ! 992: WRPR_TSTATE_I	wrpr	%r17, 0x00f4, %tstate
	mov	0x3e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x919561b3  ! 996: WRPR_PIL_I	wrpr	%r21, 0x01b3, %pil
	.word 0x8594a0a6  ! 997: WRPR_TSTATE_I	wrpr	%r18, 0x00a6, %tstate
	.word 0xbf540000  ! 998: RDPR_GL	rdpr	%-, %r31
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
	.word 0x9194e1a4  ! 1: WRPR_PIL_I	wrpr	%r19, 0x01a4, %pil
	.word 0xb8950000  ! 3: ORcc_R	orcc 	%r20, %r0, %r28
	setx	0xdeecf3360000c8de, %g1, %r10
	.word 0x819a8000  ! 4: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x879521ff  ! 6: WRPR_TT_I	wrpr	%r20, 0x01ff, %tt
	.word 0xf05460fc  ! 8: LDSH_I	ldsh	[%r17 + 0x00fc], %r24
	setx	0x32fe44f80000bd92, %g1, %r10
	.word 0x819a8000  ! 9: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf71c2197  ! 11: LDDF_I	ldd	[%r16, 0x0197], %f27
	mov	0, %r12
	.word 0x8f930000  ! 12: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7540000  ! 13: RDPR_GL	rdpr	%-, %r27
	.word 0xf2058000  ! 14: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xf805e08e  ! 15: LDUW_I	lduw	[%r23 + 0x008e], %r28
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf01c0000  ! 19: LDD_R	ldd	[%r16 + %r0], %r24
	.word 0xb73c0000  ! 22: SRA_R	sra 	%r16, %r0, %r27
	.word 0xf11ca159  ! 24: LDDF_I	ldd	[%r18, 0x0159], %f24
	setx	data_start_1, %g1, %r21
	.word 0xf01d2134  ! 29: LDD_I	ldd	[%r20 + 0x0134], %r24
	mov	0x3f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 31: RDPR_PSTATE	<illegal instruction>
	.word 0xb8c5617d  ! 39: ADDCcc_I	addccc 	%r21, 0x017d, %r28
	.word 0xfe054000  ! 41: LDUW_R	lduw	[%r21 + %r0], %r31
	setx	data_start_6, %g1, %r18
	.word 0x8195e094  ! 44: WRPR_TPC_I	wrpr	%r23, 0x0094, %tpc
	.word 0xb5540000  ! 46: RDPR_GL	rdpr	%-, %r26
	.word 0xf8040000  ! 48: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xb3540000  ! 51: RDPR_GL	<illegal instruction>
	.word 0xfe556139  ! 54: LDSH_I	ldsh	[%r21 + 0x0139], %r31
	.word 0x89956103  ! 55: WRPR_TICK_I	wrpr	%r21, 0x0103, %tick
	.word 0xbd508000  ! 61: RDPR_TSTATE	<illegal instruction>
	.word 0xfc150000  ! 71: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xf61c20c0  ! 72: LDD_I	ldd	[%r16 + 0x00c0], %r27
	.word 0xfc05a1cd  ! 75: LDUW_I	lduw	[%r22 + 0x01cd], %r30
	.word 0xb8850000  ! 76: ADDcc_R	addcc 	%r20, %r0, %r28
	.word 0xfe4d8000  ! 77: LDSB_R	ldsb	[%r22 + %r0], %r31
	.word 0xbb50c000  ! 83: RDPR_TT	<illegal instruction>
	.word 0xb1504000  ! 85: RDPR_TNPC	<illegal instruction>
	setx	0x1185975500005b87, %g1, %r10
	.word 0x819a8000  ! 89: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf40ca18b  ! 91: LDUB_I	ldub	[%r18 + 0x018b], %r26
	.word 0xf20da17d  ! 92: LDUB_I	ldub	[%r22 + 0x017d], %r25
	.word 0xf44c4000  ! 93: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0x859420b7  ! 95: WRPR_TSTATE_I	wrpr	%r16, 0x00b7, %tstate
	.word 0xfe45e181  ! 97: LDSW_I	ldsw	[%r23 + 0x0181], %r31
	.word 0xfc054000  ! 100: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xb09d61d2  ! 101: XORcc_I	xorcc 	%r21, 0x01d2, %r24
	mov	0x13d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 106: RDPR_TICK	<illegal instruction>
	.word 0xb2bda1f2  ! 107: XNORcc_I	xnorcc 	%r22, 0x01f2, %r25
	.word 0xf44d8000  ! 108: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xf60c8000  ! 110: LDUB_R	ldub	[%r18 + %r0], %r27
	.word 0xf21421f9  ! 112: LDUH_I	lduh	[%r16 + 0x01f9], %r25
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	setx	0x80a795800003887, %g1, %r10
	.word 0x819a8000  ! 115: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xb34dc3b80000df90, %g1, %r10
	.word 0x819a8000  ! 116: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc55604a  ! 122: LDSH_I	ldsh	[%r21 + 0x004a], %r30
	.word 0xf91c0000  ! 128: LDDF_R	ldd	[%r16, %r0], %f28
	.word 0xf00c4000  ! 130: LDUB_R	ldub	[%r17 + %r0], %r24
	mov	2, %r12
	.word 0xa1930000  ! 132: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb950c000  ! 134: RDPR_TT	rdpr	%tt, %r28
	.word 0xfe0cc000  ! 137: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xfe4da0b2  ! 142: LDSB_I	ldsb	[%r22 + 0x00b2], %r31
	.word 0xf6444000  ! 144: LDSW_R	ldsw	[%r17 + %r0], %r27
	.word 0xf65c4000  ! 146: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xb08da02b  ! 147: ANDcc_I	andcc 	%r22, 0x002b, %r24
	.word 0xb9504000  ! 151: RDPR_TNPC	<illegal instruction>
	.word 0xf6458000  ! 154: LDSW_R	ldsw	[%r22 + %r0], %r27
	mov	1, %r12
	.word 0xa1930000  ! 155: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb151c000  ! 157: RDPR_TL	<illegal instruction>
	.word 0xfa0d8000  ! 163: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xfc05c000  ! 164: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xfd1ca040  ! 174: LDDF_I	ldd	[%r18, 0x0040], %f30
	.word 0xf25d8000  ! 175: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xbd508000  ! 176: RDPR_TSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r17
	.word 0xf4044000  ! 179: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0xf51c8000  ! 181: LDDF_R	ldd	[%r18, %r0], %f26
	.word 0xf81521e4  ! 187: LDUH_I	lduh	[%r20 + 0x01e4], %r28
	.word 0xbb3cb001  ! 189: SRAX_I	srax	%r18, 0x0001, %r29
	.word 0xbd2d7001  ! 194: SLLX_I	sllx	%r21, 0x0001, %r30
	.word 0xf01461e6  ! 195: LDUH_I	lduh	[%r17 + 0x01e6], %r24
	.word 0xbc446168  ! 196: ADDC_I	addc 	%r17, 0x0168, %r30
	.word 0xf91c4000  ! 200: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0xb3510000  ! 201: RDPR_TICK	<illegal instruction>
	.word 0xf4140000  ! 208: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xfc1c2027  ! 210: LDD_I	ldd	[%r16 + 0x0027], %r30
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa454000  ! 218: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xf25dc000  ! 221: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0x8d946150  ! 223: WRPR_PSTATE_I	wrpr	%r17, 0x0150, %pstate
	mov	0x1a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb494a0f6  ! 227: ORcc_I	orcc 	%r18, 0x00f6, %r26
	.word 0xfd1c0000  ! 229: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0xbb50c000  ! 230: RDPR_TT	<illegal instruction>
	.word 0xfe0ce075  ! 232: LDUB_I	ldub	[%r19 + 0x0075], %r31
	mov	0, %r12
	.word 0xa1930000  ! 234: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0548000  ! 239: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xfe0da17c  ! 241: LDUB_I	ldub	[%r22 + 0x017c], %r31
	.word 0xf8158000  ! 242: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0x89952025  ! 245: WRPR_TICK_I	wrpr	%r20, 0x0025, %tick
	.word 0xfa4d4000  ! 246: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf61ce094  ! 248: LDD_I	ldd	[%r19 + 0x0094], %r27
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	mov	0x10b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf215a16e  ! 256: LDUH_I	lduh	[%r22 + 0x016e], %r25
	mov	0x33e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0cc000  ! 262: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xbd504000  ! 266: RDPR_TNPC	<illegal instruction>
	.word 0xb9643801  ! 271: MOVcc_I	<illegal instruction>
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25420d0  ! 282: LDSH_I	ldsh	[%r16 + 0x00d0], %r25
	.word 0xb435e12a  ! 283: ORN_I	orn 	%r23, 0x012a, %r26
	.word 0xfa14e0f1  ! 290: LDUH_I	lduh	[%r19 + 0x00f1], %r29
	.word 0xfa54c000  ! 292: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xbf504000  ! 293: RDPR_TNPC	<illegal instruction>
	mov	0x208, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 295: RDPR_TL	<illegal instruction>
	.word 0xbd504000  ! 306: RDPR_TNPC	<illegal instruction>
	.word 0xf845616f  ! 308: LDSW_I	ldsw	[%r21 + 0x016f], %r28
	setx	data_start_7, %g1, %r18
	.word 0xb5540000  ! 315: RDPR_GL	<illegal instruction>
	.word 0xb7510000  ! 316: RDPR_TICK	<illegal instruction>
	.word 0xb3500000  ! 317: RDPR_TPC	<illegal instruction>
	.word 0x8d95610f  ! 318: WRPR_PSTATE_I	wrpr	%r21, 0x010f, %pstate
	.word 0xbaad21f8  ! 319: ANDNcc_I	andncc 	%r20, 0x01f8, %r29
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c8000  ! 322: LDUB_R	ldub	[%r18 + %r0], %r27
	.word 0xf215c000  ! 323: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0x8595e1d8  ! 325: WRPR_TSTATE_I	wrpr	%r23, 0x01d8, %tstate
	.word 0xf24c204d  ! 326: LDSB_I	ldsb	[%r16 + 0x004d], %r25
	.word 0x8795a097  ! 331: WRPR_TT_I	wrpr	%r22, 0x0097, %tt
	.word 0xbb504000  ! 332: RDPR_TNPC	<illegal instruction>
	.word 0xb5540000  ! 333: RDPR_GL	<illegal instruction>
	.word 0xf6454000  ! 335: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xf65d4000  ! 339: LDX_R	ldx	[%r21 + %r0], %r27
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf71dc000  ! 341: LDDF_R	ldd	[%r23, %r0], %f27
	.word 0xbd480000  ! 346: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x919461d0  ! 348: WRPR_PIL_I	wrpr	%r17, 0x01d0, %pil
	.word 0xbd520000  ! 349: RDPR_PIL	<illegal instruction>
	.word 0xfa1c4000  ! 351: LDD_R	ldd	[%r17 + %r0], %r29
	.word 0xfe0d21b3  ! 355: LDUB_I	ldub	[%r20 + 0x01b3], %r31
	.word 0xbd504000  ! 356: RDPR_TNPC	<illegal instruction>
	.word 0xf05c4000  ! 359: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0xf455c000  ! 363: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0xf40cc000  ! 369: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0x899560dc  ! 372: WRPR_TICK_I	wrpr	%r21, 0x00dc, %tick
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb01de058  ! 378: XOR_I	xor 	%r23, 0x0058, %r24
	.word 0xf005207a  ! 379: LDUW_I	lduw	[%r20 + 0x007a], %r24
	.word 0xfe1d0000  ! 381: LDD_R	ldd	[%r20 + %r0], %r31
	.word 0xb1518000  ! 382: RDPR_PSTATE	<illegal instruction>
	.word 0xfe04a0d2  ! 384: LDUW_I	lduw	[%r18 + 0x00d2], %r31
	setx	0xa1ac4ed000003a1f, %g1, %r10
	.word 0x839a8000  ! 385: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc5461bf  ! 388: LDSH_I	ldsh	[%r17 + 0x01bf], %r30
	.word 0xfb1ca023  ! 391: LDDF_I	ldd	[%r18, 0x0023], %f29
	.word 0xbf540000  ! 395: RDPR_GL	rdpr	%-, %r31
	.word 0xb8bcc000  ! 398: XNORcc_R	xnorcc 	%r19, %r0, %r28
	.word 0xfb1ce121  ! 401: LDDF_I	ldd	[%r19, 0x0121], %f29
	.word 0x8195e085  ! 402: WRPR_TPC_I	wrpr	%r23, 0x0085, %tpc
	mov	0x3f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44d615c  ! 407: LDSB_I	ldsb	[%r21 + 0x015c], %r26
	.word 0xf0144000  ! 409: LDUH_R	lduh	[%r17 + %r0], %r24
	setx	0x1ff593f000003cce, %g1, %r10
	.word 0x819a8000  ! 411: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe0421ea  ! 412: LDUW_I	lduw	[%r16 + 0x01ea], %r31
	.word 0xba0dc000  ! 414: AND_R	and 	%r23, %r0, %r29
	setx	0x8c63983a00001f82, %g1, %r10
	.word 0x819a8000  ! 423: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb50c000  ! 424: RDPR_TT	<illegal instruction>
	.word 0xb22c214e  ! 427: ANDN_I	andn 	%r16, 0x014e, %r25
	.word 0xf61ca024  ! 429: LDD_I	ldd	[%r18 + 0x0024], %r27
	.word 0xbb520000  ! 431: RDPR_PIL	<illegal instruction>
	.word 0xf91cc000  ! 432: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0xf91cc000  ! 436: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0xb8240000  ! 438: SUB_R	sub 	%r16, %r0, %r28
	.word 0xfa55e0ca  ! 441: LDSH_I	ldsh	[%r23 + 0x00ca], %r29
	.word 0x8594e0f3  ! 442: WRPR_TSTATE_I	wrpr	%r19, 0x00f3, %tstate
	.word 0xfd1de156  ! 443: LDDF_I	ldd	[%r23, 0x0156], %f30
	.word 0xf64520f5  ! 444: LDSW_I	ldsw	[%r20 + 0x00f5], %r27
	.word 0xf044a0df  ! 446: LDSW_I	ldsw	[%r18 + 0x00df], %r24
	.word 0xfc15c000  ! 454: LDUH_R	lduh	[%r23 + %r0], %r30
	.word 0x8594202d  ! 457: WRPR_TSTATE_I	wrpr	%r16, 0x002d, %tstate
	.word 0xbcb4c000  ! 458: SUBCcc_R	orncc 	%r19, %r0, %r30
	.word 0xf60d0000  ! 460: LDUB_R	ldub	[%r20 + %r0], %r27
	.word 0x8395603b  ! 463: WRPR_TNPC_I	wrpr	%r21, 0x003b, %tnpc
	setx	data_start_5, %g1, %r18
	.word 0xb7355000  ! 470: SRLX_R	srlx	%r21, %r0, %r27
	.word 0xfa5ca0ef  ! 471: LDX_I	ldx	[%r18 + 0x00ef], %r29
	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 477: RDPR_TICK	<illegal instruction>
	.word 0xb43ca193  ! 481: XNOR_I	xnor 	%r18, 0x0193, %r26
	.word 0xf71c0000  ! 483: LDDF_R	ldd	[%r16, %r0], %f27
	.word 0x8394614c  ! 484: WRPR_TNPC_I	wrpr	%r17, 0x014c, %tnpc
	.word 0xb7508000  ! 485: RDPR_TSTATE	<illegal instruction>
	.word 0xf21420be  ! 487: LDUH_I	lduh	[%r16 + 0x00be], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf6544000  ! 492: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xfc5c8000  ! 494: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xf25d60c4  ! 499: LDX_I	ldx	[%r21 + 0x00c4], %r25
	.word 0xfe1d0000  ! 503: LDD_R	ldd	[%r20 + %r0], %r31
	.word 0xbec4c000  ! 505: ADDCcc_R	addccc 	%r19, %r0, %r31
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 509: RDPR_TT	<illegal instruction>
	.word 0x879421fb  ! 511: WRPR_TT_I	wrpr	%r16, 0x01fb, %tt
	.word 0xf31d2001  ! 512: LDDF_I	ldd	[%r20, 0x0001], %f25
	.word 0xf41c4000  ! 513: LDD_R	ldd	[%r17 + %r0], %r26
	.word 0xfc5d2017  ! 515: LDX_I	ldx	[%r20 + 0x0017], %r30
	.word 0xf6546082  ! 520: LDSH_I	ldsh	[%r17 + 0x0082], %r27
	.word 0xfc5c21ae  ! 521: LDX_I	ldx	[%r16 + 0x01ae], %r30
	.word 0xfc1d61d2  ! 523: LDD_I	ldd	[%r21 + 0x01d2], %r30
	.word 0x8394216b  ! 524: WRPR_TNPC_I	wrpr	%r16, 0x016b, %tnpc
	.word 0x8d9460ef  ! 526: WRPR_PSTATE_I	wrpr	%r17, 0x00ef, %pstate
	.word 0xfe0c4000  ! 529: LDUB_R	ldub	[%r17 + %r0], %r31
	.word 0xf65d4000  ! 533: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0x8995208f  ! 534: WRPR_TICK_I	wrpr	%r20, 0x008f, %tick
	.word 0xf25da1f9  ! 535: LDX_I	ldx	[%r22 + 0x01f9], %r25
	.word 0xf60ca0b5  ! 537: LDUB_I	ldub	[%r18 + 0x00b5], %r27
	.word 0xf044c000  ! 541: LDSW_R	ldsw	[%r19 + %r0], %r24
	mov	1, %r12
	.word 0xa1930000  ! 542: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf815e04a  ! 545: LDUH_I	lduh	[%r23 + 0x004a], %r28
	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00cc000  ! 551: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xb1518000  ! 552: RDPR_PSTATE	<illegal instruction>
	.word 0xf40d8000  ! 553: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xfc44616d  ! 556: LDSW_I	ldsw	[%r17 + 0x016d], %r30
	.word 0xf21d6074  ! 562: LDD_I	ldd	[%r21 + 0x0074], %r25
	.word 0xf6550000  ! 563: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0x9194619e  ! 564: WRPR_PIL_I	wrpr	%r17, 0x019e, %pil
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf11d0000  ! 581: LDDF_R	ldd	[%r20, %r0], %f24
	.word 0xf40da17e  ! 583: LDUB_I	ldub	[%r22 + 0x017e], %r26
	.word 0xb3500000  ! 586: RDPR_TPC	<illegal instruction>
	.word 0xf64d610e  ! 589: LDSB_I	ldsb	[%r21 + 0x010e], %r27
	.word 0x8594e024  ! 590: WRPR_TSTATE_I	wrpr	%r19, 0x0024, %tstate
	setx	0x3f381fa20000ce56, %g1, %r10
	.word 0x839a8000  ! 591: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe5da1a8  ! 592: LDX_I	ldx	[%r22 + 0x01a8], %r31
	.word 0xb7504000  ! 593: RDPR_TNPC	<illegal instruction>
	.word 0xf8050000  ! 596: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0x819420c5  ! 598: WRPR_TPC_I	wrpr	%r16, 0x00c5, %tpc
	.word 0x839520e1  ! 600: WRPR_TNPC_I	wrpr	%r20, 0x00e1, %tnpc
	.word 0xf01c4000  ! 601: LDD_R	ldd	[%r17 + %r0], %r24
	.word 0xfc4de19f  ! 603: LDSB_I	ldsb	[%r23 + 0x019f], %r30
	.word 0xb00dc000  ! 605: AND_R	and 	%r23, %r0, %r24
	.word 0xfe144000  ! 611: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xbb504000  ! 613: RDPR_TNPC	<illegal instruction>
	.word 0xf21cc000  ! 614: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0xbd508000  ! 616: RDPR_TSTATE	<illegal instruction>
	.word 0xb951c000  ! 617: RDPR_TL	<illegal instruction>
	.word 0xf20c0000  ! 622: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xbb500000  ! 623: RDPR_TPC	<illegal instruction>
	.word 0xf81c616b  ! 626: LDD_I	ldd	[%r17 + 0x016b], %r28
	.word 0xf71c21f4  ! 628: LDDF_I	ldd	[%r16, 0x01f4], %f27
	.word 0xbb50c000  ! 629: RDPR_TT	<illegal instruction>
	.word 0xf0048000  ! 631: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xb835e101  ! 632: ORN_I	orn 	%r23, 0x0101, %r28
	.word 0xfe554000  ! 633: LDSH_R	ldsh	[%r21 + %r0], %r31
	mov	0x32f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795a1b0  ! 636: WRPR_TT_I	wrpr	%r22, 0x01b0, %tt
	setx	0xac3e5f2900000b8a, %g1, %r10
	.word 0x819a8000  ! 638: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc1da09f  ! 641: LDD_I	ldd	[%r22 + 0x009f], %r30
	.word 0xf455c000  ! 642: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0xb8ac60e8  ! 645: ANDNcc_I	andncc 	%r17, 0x00e8, %r28
	.word 0xfc4c21e9  ! 646: LDSB_I	ldsb	[%r16 + 0x01e9], %r30
	.word 0xfa054000  ! 648: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0x9194e14b  ! 650: WRPR_PIL_I	wrpr	%r19, 0x014b, %pil
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa440000  ! 653: LDSW_R	ldsw	[%r16 + %r0], %r29
	mov	0x121, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf004c000  ! 664: LDUW_R	lduw	[%r19 + %r0], %r24
	mov	0x37, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf21cc000  ! 666: LDD_R	ldd	[%r19 + %r0], %r25
	mov	0x30b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994e0f8  ! 671: WRPR_TICK_I	wrpr	%r19, 0x00f8, %tick
	.word 0xb3504000  ! 675: RDPR_TNPC	<illegal instruction>
	.word 0xf454a002  ! 680: LDSH_I	ldsh	[%r18 + 0x0002], %r26
	.word 0xf454a1b0  ! 685: LDSH_I	ldsh	[%r18 + 0x01b0], %r26
	.word 0xfc0d8000  ! 688: LDUB_R	ldub	[%r22 + %r0], %r30
	mov	2, %r12
	.word 0x8f930000  ! 689: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc55c000  ! 690: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xf25560f0  ! 691: LDSH_I	ldsh	[%r21 + 0x00f0], %r25
	.word 0x899560ce  ! 697: WRPR_TICK_I	wrpr	%r21, 0x00ce, %tick
	mov	0, %r12
	.word 0x8f930000  ! 698: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbd518000  ! 700: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xb5518000  ! 701: RDPR_PSTATE	<illegal instruction>
	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195a1a2  ! 707: WRPR_PIL_I	wrpr	%r22, 0x01a2, %pil
	setx	0xd9e9bdf100002d54, %g1, %r10
	.word 0x819a8000  ! 711: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d95217d  ! 714: WRPR_PSTATE_I	wrpr	%r20, 0x017d, %pstate
	.word 0xfc55a0ba  ! 723: LDSH_I	ldsh	[%r22 + 0x00ba], %r30
	.word 0xf81d8000  ! 724: LDD_R	ldd	[%r22 + %r0], %r28
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2052184  ! 727: LDUW_I	lduw	[%r20 + 0x0184], %r25
	.word 0xf005c000  ! 729: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xf6152152  ! 730: LDUH_I	lduh	[%r20 + 0x0152], %r27
	.word 0xfc148000  ! 735: LDUH_R	lduh	[%r18 + %r0], %r30
	setx	0xeb7e87d0000ce4b, %g1, %r10
	.word 0x819a8000  ! 738: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc5d2133  ! 739: LDX_I	ldx	[%r20 + 0x0133], %r30
	.word 0xf31dc000  ! 740: LDDF_R	ldd	[%r23, %r0], %f25
	.word 0xf2150000  ! 742: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0xb951c000  ! 743: RDPR_TL	<illegal instruction>
	.word 0xf65dc000  ! 744: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xb6bc4000  ! 745: XNORcc_R	xnorcc 	%r17, %r0, %r27
	.word 0xb5508000  ! 746: RDPR_TSTATE	<illegal instruction>
	.word 0xf84d0000  ! 749: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0xfe0c4000  ! 752: LDUB_R	ldub	[%r17 + %r0], %r31
	.word 0xf0448000  ! 755: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0xfc550000  ! 756: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xf054a1cb  ! 757: LDSH_I	ldsh	[%r18 + 0x01cb], %r24
	mov	2, %r12
	.word 0xa1930000  ! 758: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf44de0bf  ! 762: LDSB_I	ldsb	[%r23 + 0x00bf], %r26
	.word 0xf60c8000  ! 763: LDUB_R	ldub	[%r18 + %r0], %r27
	.word 0xf044c000  ! 765: LDSW_R	ldsw	[%r19 + %r0], %r24
	.word 0x8594a0dd  ! 769: WRPR_TSTATE_I	wrpr	%r18, 0x00dd, %tstate
	.word 0xf8548000  ! 770: LDSH_R	ldsh	[%r18 + %r0], %r28
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595e1cd  ! 772: WRPR_TSTATE_I	wrpr	%r23, 0x01cd, %tstate
	setx	0x361861f300004b05, %g1, %r10
	.word 0x839a8000  ! 773: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x39, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c4000  ! 778: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xfe550000  ! 780: LDSH_R	ldsh	[%r20 + %r0], %r31
	mov	0, %r12
	.word 0x8f930000  ! 785: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf85421f2  ! 786: LDSH_I	ldsh	[%r16 + 0x01f2], %r28
	.word 0xfc5d8000  ! 789: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0x919520be  ! 791: WRPR_PIL_I	wrpr	%r20, 0x00be, %pil
	.word 0x839521a6  ! 792: WRPR_TNPC_I	wrpr	%r20, 0x01a6, %tnpc
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba85215e  ! 797: ADDcc_I	addcc 	%r20, 0x015e, %r29
	.word 0xb5510000  ! 800: RDPR_TICK	<illegal instruction>
	.word 0x879521e6  ! 801: WRPR_TT_I	wrpr	%r20, 0x01e6, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8195e1c9  ! 804: WRPR_TPC_I	wrpr	%r23, 0x01c9, %tpc
	.word 0xb7641800  ! 807: MOVcc_R	<illegal instruction>
	.word 0xb3510000  ! 811: RDPR_TICK	<illegal instruction>
	.word 0xb09d2060  ! 812: XORcc_I	xorcc 	%r20, 0x0060, %r24
	.word 0xf0544000  ! 814: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0xfe5de05f  ! 820: LDX_I	ldx	[%r23 + 0x005f], %r31
	.word 0x839520c6  ! 821: WRPR_TNPC_I	wrpr	%r20, 0x00c6, %tnpc
	mov	0x22b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf31de01a  ! 827: LDDF_I	ldd	[%r23, 0x001a], %f25
	mov	0x32d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4d4000  ! 831: LDSB_R	ldsb	[%r21 + %r0], %r29
	setx	data_start_4, %g1, %r16
	.word 0xf61c602c  ! 835: LDD_I	ldd	[%r17 + 0x002c], %r27
	mov	1, %r12
	.word 0xa1930000  ! 837: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa140000  ! 838: LDUH_R	lduh	[%r16 + %r0], %r29
	mov	0x21c, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe1460a0  ! 845: LDUH_I	lduh	[%r17 + 0x00a0], %r31
	.word 0xbf51c000  ! 846: RDPR_TL	<illegal instruction>
	.word 0xfa550000  ! 849: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xf80d21a5  ! 854: LDUB_I	ldub	[%r20 + 0x01a5], %r28
	.word 0xf014c000  ! 856: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xf8442007  ! 857: LDSW_I	ldsw	[%r16 + 0x0007], %r28
	mov	0, %r12
	.word 0x8f930000  ! 858: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x899521f6  ! 859: WRPR_TICK_I	wrpr	%r20, 0x01f6, %tick
	.word 0xf0146156  ! 860: LDUH_I	lduh	[%r17 + 0x0156], %r24
	.word 0xf4058000  ! 862: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xfa150000  ! 863: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xb014e0ec  ! 867: OR_I	or 	%r19, 0x00ec, %r24
	.word 0xb7510000  ! 868: RDPR_TICK	<illegal instruction>
	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa1c0000  ! 872: LDD_R	ldd	[%r16 + %r0], %r29
	.word 0xbe0560b9  ! 874: ADD_I	add 	%r21, 0x00b9, %r31
	setx	0x2dfe3a100000cb95, %g1, %r10
	.word 0x819a8000  ! 877: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x278fd9b20000ac57, %g1, %r10
	.word 0x819a8000  ! 879: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb8848000  ! 883: ADDcc_R	addcc 	%r18, %r0, %r28
	.word 0xbb510000  ! 886: RDPR_TICK	<illegal instruction>
	.word 0xfa5420c3  ! 888: LDSH_I	ldsh	[%r16 + 0x00c3], %r29
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0cc000  ! 890: LDUB_R	ldub	[%r19 + %r0], %r29
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80d4000  ! 893: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xbcac0000  ! 895: ANDNcc_R	andncc 	%r16, %r0, %r30
	.word 0xff1c0000  ! 896: LDDF_R	ldd	[%r16, %r0], %f31
	.word 0xf31c0000  ! 899: LDDF_R	ldd	[%r16, %r0], %f25
	.word 0xf454e14f  ! 901: LDSH_I	ldsh	[%r19 + 0x014f], %r26
	.word 0xbc854000  ! 903: ADDcc_R	addcc 	%r21, %r0, %r30
	.word 0xf60c4000  ! 905: LDUB_R	ldub	[%r17 + %r0], %r27
	mov	0, %r12
	.word 0x8f930000  ! 906: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc450000  ! 909: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xf11d0000  ! 910: LDDF_R	ldd	[%r20, %r0], %f24
	setx	data_start_5, %g1, %r19
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	setx	0x216fe0d80000ea83, %g1, %r10
	.word 0x819a8000  ! 917: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb51c000  ! 919: RDPR_TL	<illegal instruction>
	.word 0xf80d20da  ! 920: LDUB_I	ldub	[%r20 + 0x00da], %r28
	.word 0xfa1da04c  ! 922: LDD_I	ldd	[%r22 + 0x004c], %r29
	.word 0xb9643801  ! 926: MOVcc_I	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 932: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe5c4000  ! 933: LDX_R	ldx	[%r17 + %r0], %r31
	.word 0xbc3cc000  ! 935: XNOR_R	xnor 	%r19, %r0, %r30
	setx	0x85b5d4310000de1b, %g1, %r10
	.word 0x839a8000  ! 936: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5480000  ! 937: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	mov	2, %r12
	.word 0x8f930000  ! 939: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf0440000  ! 941: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0x8994a0bd  ! 942: WRPR_TICK_I	wrpr	%r18, 0x00bd, %tick
	.word 0xb085213a  ! 945: ADDcc_I	addcc 	%r20, 0x013a, %r24
	.word 0xfd1c0000  ! 946: LDDF_R	ldd	[%r16, %r0], %f30
	mov	0x7, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02ca0d2  ! 952: ANDN_I	andn 	%r18, 0x00d2, %r24
	.word 0xf00c4000  ! 954: LDUB_R	ldub	[%r17 + %r0], %r24
	.word 0xf004206c  ! 955: LDUW_I	lduw	[%r16 + 0x006c], %r24
	.word 0xb951c000  ! 957: RDPR_TL	<illegal instruction>
	.word 0xb550c000  ! 958: RDPR_TT	<illegal instruction>
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5dc000  ! 962: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xf65d0000  ! 963: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xf91dc000  ! 964: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xb0a58000  ! 965: SUBcc_R	subcc 	%r22, %r0, %r24
	mov	0x125, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf41d60e9  ! 969: LDD_I	ldd	[%r21 + 0x00e9], %r26
	.word 0xfa444000  ! 971: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xf615e017  ! 973: LDUH_I	lduh	[%r23 + 0x0017], %r27
	.word 0xf80c6110  ! 974: LDUB_I	ldub	[%r17 + 0x0110], %r28
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb1d6053  ! 978: LDDF_I	ldd	[%r21, 0x0053], %f29
	setx	data_start_5, %g1, %r21
	.word 0xf44d8000  ! 980: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xf85ce0ae  ! 981: LDX_I	ldx	[%r19 + 0x00ae], %r28
	.word 0xf00ca005  ! 983: LDUB_I	ldub	[%r18 + 0x0005], %r24
	.word 0x8d94e190  ! 984: WRPR_PSTATE_I	wrpr	%r19, 0x0190, %pstate
	.word 0xff1ce0db  ! 988: LDDF_I	ldd	[%r19, 0x00db], %f31
	.word 0xfe144000  ! 990: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xf85da09b  ! 991: LDX_I	ldx	[%r22 + 0x009b], %r28
	.word 0x85952130  ! 992: WRPR_TSTATE_I	wrpr	%r20, 0x0130, %tstate
	mov	0x10e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194a19d  ! 996: WRPR_PIL_I	wrpr	%r18, 0x019d, %pil
	.word 0x8594a16a  ! 997: WRPR_TSTATE_I	wrpr	%r18, 0x016a, %tstate
	.word 0xbb540000  ! 998: RDPR_GL	rdpr	%-, %r29
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0x9194e19c  ! 1: WRPR_PIL_I	wrpr	%r19, 0x019c, %pil
	.word 0xb7a40920  ! 2: FMULs	fmuls	%f16, %f0, %f27
	.word 0xbc95c000  ! 3: ORcc_R	orcc 	%r23, %r0, %r30
	setx	0xbfb43c8a00002855, %g1, %r10
	.word 0x819a8000  ! 4: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5a54940  ! 5: FMULd	fmuld	%f52, %f0, %f26
	.word 0x879520f2  ! 6: WRPR_TT_I	wrpr	%r20, 0x00f2, %tt
	setx	0x64c07dbf0000e809, %g1, %r10
	.word 0x819a8000  ! 9: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0, %r12
	.word 0x8f930000  ! 12: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3540000  ! 13: RDPR_GL	<illegal instruction>
	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a40840  ! 20: FADDd	faddd	%f16, %f0, %f28
	.word 0xb3ab8820  ! 21: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb13d8000  ! 22: SRA_R	sra 	%r22, %r0, %r24
	setx	data_start_6, %g1, %r16
	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 31: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa81420  ! 33: FMOVRNZ	dis not found

	.word 0xb3a488a0  ! 37: FSUBs	fsubs	%f18, %f0, %f25
	.word 0xb8c4e1a0  ! 39: ADDCcc_I	addccc 	%r19, 0x01a0, %r28
	.word 0xb7a98820  ! 42: FMOVNEG	fmovs	%fcc1, %f0, %f27
	setx	data_start_4, %g1, %r18
	.word 0x819560b9  ! 44: WRPR_TPC_I	wrpr	%r21, 0x00b9, %tpc
	.word 0xb9540000  ! 46: RDPR_GL	<illegal instruction>
	.word 0xb9aac820  ! 50: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb9540000  ! 51: RDPR_GL	<illegal instruction>
	.word 0xb1aa0820  ! 52: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0x8994e156  ! 55: WRPR_TICK_I	wrpr	%r19, 0x0156, %tick
	.word 0xb9a80820  ! 56: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb1a548e0  ! 58: FSUBq	dis not found

	.word 0xb5a00540  ! 59: FSQRTd	fsqrt	
	.word 0xb7508000  ! 61: RDPR_TSTATE	<illegal instruction>
	.word 0xbba449c0  ! 66: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xbda5c8e0  ! 73: FSUBq	dis not found

	.word 0xb284c000  ! 76: ADDcc_R	addcc 	%r19, %r0, %r25
	.word 0xb3a408e0  ! 82: FSUBq	dis not found

	.word 0xb150c000  ! 83: RDPR_TT	<illegal instruction>
	.word 0xb7a81c20  ! 84: FMOVRGEZ	dis not found

	.word 0xb1504000  ! 85: RDPR_TNPC	<illegal instruction>
	.word 0xb3a81420  ! 87: FMOVRNZ	dis not found

	setx	0xfab4402a000039d6, %g1, %r10
	.word 0x819a8000  ! 89: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba00020  ! 94: FMOVs	fmovs	%f0, %f29
	.word 0x85956020  ! 95: WRPR_TSTATE_I	wrpr	%r21, 0x0020, %tstate
	.word 0xbfa00540  ! 99: FSQRTd	fsqrt	
	.word 0xb89ca140  ! 101: XORcc_I	xorcc 	%r18, 0x0140, %r28
	mov	0x132, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 104: FSQRTd	fsqrt	
	.word 0xb1a80420  ! 105: FMOVRZ	dis not found

	.word 0xb7510000  ! 106: RDPR_TICK	<illegal instruction>
	.word 0xb2bc6025  ! 107: XNORcc_I	xnorcc 	%r17, 0x0025, %r25
	.word 0xb3aa4820  ! 109: FMOVNE	fmovs	%fcc1, %f0, %f25
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	setx	0x7dc94f9000006a4c, %g1, %r10
	.word 0x819a8000  ! 115: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xa7fb2be30000ca9a, %g1, %r10
	.word 0x819a8000  ! 116: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba58860  ! 119: FADDq	dis not found

	.word 0xb9a98820  ! 121: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbfa48960  ! 126: FMULq	dis not found

	.word 0xb1a489c0  ! 129: FDIVd	fdivd	%f18, %f0, %f24
	mov	1, %r12
	.word 0xa1930000  ! 132: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb150c000  ! 134: RDPR_TT	<illegal instruction>
	.word 0xb1a548e0  ! 135: FSUBq	dis not found

	.word 0xb3a58940  ! 141: FMULd	fmuld	%f22, %f0, %f56
	.word 0xb9a408c0  ! 143: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xb08d20b6  ! 147: ANDcc_I	andcc 	%r20, 0x00b6, %r24
	.word 0xbf504000  ! 151: RDPR_TNPC	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 155: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3a00040  ! 156: FMOVd	fmovd	%f0, %f56
	.word 0xb351c000  ! 157: RDPR_TL	<illegal instruction>
	.word 0xb5ab0820  ! 160: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb5a00040  ! 161: FMOVd	fmovd	%f0, %f26
	.word 0xbba40960  ! 165: FMULq	dis not found

	.word 0xbda5c920  ! 168: FMULs	fmuls	%f23, %f0, %f30
	.word 0xb5a84820  ! 169: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a00520  ! 170: FSQRTs	fsqrt	
	.word 0xb1508000  ! 176: RDPR_TSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r19
	.word 0xb5a00040  ! 182: FMOVd	fmovd	%f0, %f26
	.word 0xb9a50920  ! 185: FMULs	fmuls	%f20, %f0, %f28
	.word 0xb73cf001  ! 189: SRAX_I	srax	%r19, 0x0001, %r27
	.word 0xbd2d3001  ! 194: SLLX_I	sllx	%r20, 0x0001, %r30
	.word 0xb6456133  ! 196: ADDC_I	addc 	%r21, 0x0133, %r27
	.word 0xbba00560  ! 197: FSQRTq	fsqrt	
	.word 0xbd510000  ! 201: RDPR_TICK	<illegal instruction>
	.word 0xbda94820  ! 204: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a00560  ! 205: FSQRTq	fsqrt	
	.word 0xb1a00040  ! 209: FMOVd	fmovd	%f0, %f24
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a489a0  ! 220: FDIVs	fdivs	%f18, %f0, %f27
	.word 0x8d95a11d  ! 223: WRPR_PSTATE_I	wrpr	%r22, 0x011d, %pstate
	.word 0xbba00520  ! 224: FSQRTs	fsqrt	
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb694e0c1  ! 227: ORcc_I	orcc 	%r19, 0x00c1, %r27
	.word 0xb550c000  ! 230: RDPR_TT	<illegal instruction>
	.word 0xb7a5c9e0  ! 231: FDIVq	dis not found

	mov	1, %r12
	.word 0xa1930000  ! 234: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x329, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a94820  ! 244: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0x8995605c  ! 245: WRPR_TICK_I	wrpr	%r21, 0x005c, %tick
	.word 0xb5a88820  ! 249: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a00040  ! 250: FMOVd	fmovd	%f0, %f26
	.word 0xb3abc820  ! 251: FMOVVC	fmovs	%fcc1, %f0, %f25
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	mov	0x316, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 257: FSQRTd	fsqrt	
	mov	0x121, %o0
	ta	T_SEND_THRD_INTR
	mov	0x217, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 263: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb7504000  ! 266: RDPR_TNPC	<illegal instruction>
	.word 0xb5a448e0  ! 270: FSUBq	dis not found

	.word 0xb5643801  ! 271: MOVcc_I	<illegal instruction>
	.word 0xb7a488a0  ! 272: FSUBs	fsubs	%f18, %f0, %f27
	.word 0xb5a5c8e0  ! 276: FSUBq	dis not found

	mov	0x300, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba409a0  ! 281: FDIVs	fdivs	%f16, %f0, %f29
	.word 0xb4346115  ! 283: ORN_I	orn 	%r17, 0x0115, %r26
	.word 0xb5a80420  ! 284: FMOVRZ	dis not found

	.word 0xbfa548e0  ! 285: FSUBq	dis not found

	.word 0xb9a90820  ! 286: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb5aa8820  ! 289: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbd504000  ! 293: RDPR_TNPC	<illegal instruction>
	mov	0x139, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 295: RDPR_TL	<illegal instruction>
	.word 0xbba448a0  ! 297: FSUBs	fsubs	%f17, %f0, %f29
	.word 0xbfa98820  ! 301: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb1ab0820  ! 302: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb5504000  ! 306: RDPR_TNPC	<illegal instruction>
	.word 0xb9a94820  ! 311: FMOVCS	fmovs	%fcc1, %f0, %f28
	setx	data_start_4, %g1, %r17
	.word 0xbda50940  ! 314: FMULd	fmuld	%f20, %f0, %f30
	.word 0xb3540000  ! 315: RDPR_GL	<illegal instruction>
	.word 0xb9510000  ! 316: RDPR_TICK	<illegal instruction>
	.word 0xbf500000  ! 317: RDPR_TPC	<illegal instruction>
	.word 0x8d94e14d  ! 318: WRPR_PSTATE_I	wrpr	%r19, 0x014d, %pstate
	.word 0xbead210b  ! 319: ANDNcc_I	andncc 	%r20, 0x010b, %r31
	.word 0xbda589c0  ! 320: FDIVd	fdivd	%f22, %f0, %f30
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595a15e  ! 325: WRPR_TSTATE_I	wrpr	%r22, 0x015e, %tstate
	.word 0xb3aa4820  ! 328: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa508c0  ! 329: FSUBd	fsubd	%f20, %f0, %f62
	.word 0xbdaa8820  ! 330: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0x87956147  ! 331: WRPR_TT_I	wrpr	%r21, 0x0147, %tt
	.word 0xbf504000  ! 332: RDPR_TNPC	<illegal instruction>
	.word 0xbb540000  ! 333: RDPR_GL	<illegal instruction>
	.word 0xbba80820  ! 336: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbba58940  ! 337: FMULd	fmuld	%f22, %f0, %f60
	mov	0x9, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 343: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a449a0  ! 344: FDIVs	fdivs	%f17, %f0, %f28
	.word 0xbd480000  ! 346: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb9a40860  ! 347: FADDq	dis not found

	.word 0x91952105  ! 348: WRPR_PIL_I	wrpr	%r20, 0x0105, %pil
	.word 0xb3520000  ! 349: RDPR_PIL	<illegal instruction>
	.word 0xbfa00560  ! 352: FSQRTq	fsqrt	
	.word 0xb7504000  ! 356: RDPR_TNPC	<illegal instruction>
	.word 0xbbab8820  ! 360: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbfa94820  ! 364: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb1ab0820  ! 367: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb1a5c8c0  ! 368: FSUBd	fsubd	%f54, %f0, %f24
	.word 0xb5a50860  ! 371: FADDq	dis not found

	.word 0x8995207c  ! 372: WRPR_TICK_I	wrpr	%r20, 0x007c, %tick
	.word 0xbbaac820  ! 374: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb1a90820  ! 375: FMOVLEU	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xba1de0a0  ! 378: XOR_I	xor 	%r23, 0x00a0, %r29
	.word 0xb5518000  ! 382: RDPR_PSTATE	<illegal instruction>
	setx	0x6311ebe60000fc97, %g1, %r10
	.word 0x839a8000  ! 385: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbda00520  ! 389: FSQRTs	fsqrt	
	.word 0xb3a54840  ! 392: FADDd	faddd	%f52, %f0, %f56
	.word 0xb3540000  ! 395: RDPR_GL	rdpr	%-, %r25
	.word 0xb6bc0000  ! 398: XNORcc_R	xnorcc 	%r16, %r0, %r27
	.word 0xb3ab0820  ! 400: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0x8194e05a  ! 402: WRPR_TPC_I	wrpr	%r19, 0x005a, %tpc
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	setx	0x38cacd9900002e0c, %g1, %r10
	.word 0x819a8000  ! 411: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a81c20  ! 413: FMOVRGEZ	dis not found

	.word 0xb20d0000  ! 414: AND_R	and 	%r20, %r0, %r25
	.word 0xb5ab8820  ! 418: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbfa00540  ! 419: FSQRTd	fsqrt	
	.word 0xb3a81820  ! 420: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb1a84820  ! 422: FMOVE	fmovs	%fcc1, %f0, %f24
	setx	0xace6c9570000aa91, %g1, %r10
	.word 0x819a8000  ! 423: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb150c000  ! 424: RDPR_TT	<illegal instruction>
	.word 0xb22ca0eb  ! 427: ANDN_I	andn 	%r18, 0x00eb, %r25
	.word 0xb3aa4820  ! 428: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb9520000  ! 431: RDPR_PIL	<illegal instruction>
	.word 0xb9abc820  ! 434: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbc25c000  ! 438: SUB_R	sub 	%r23, %r0, %r30
	.word 0x8594217a  ! 442: WRPR_TSTATE_I	wrpr	%r16, 0x017a, %tstate
	.word 0xbba8c820  ! 450: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb7a81420  ! 451: FMOVRNZ	dis not found

	.word 0xbdaa0820  ! 453: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0x859461da  ! 457: WRPR_TSTATE_I	wrpr	%r17, 0x01da, %tstate
	.word 0xbcb4c000  ! 458: SUBCcc_R	orncc 	%r19, %r0, %r30
	.word 0xb7a548a0  ! 462: FSUBs	fsubs	%f21, %f0, %f27
	.word 0x83956024  ! 463: WRPR_TNPC_I	wrpr	%r21, 0x0024, %tnpc
	.word 0xb9a54840  ! 464: FADDd	faddd	%f52, %f0, %f28
	setx	data_start_5, %g1, %r16
	.word 0xb1a84820  ! 468: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb7341000  ! 470: SRLX_R	srlx	%r16, %r0, %r27
	.word 0xb1ab0820  ! 473: FMOVGU	fmovs	%fcc1, %f0, %f24
	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 477: RDPR_TICK	<illegal instruction>
	.word 0xb1a9c820  ! 480: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbc3d606d  ! 481: XNOR_I	xnor 	%r21, 0x006d, %r30
	.word 0x8395a0ec  ! 484: WRPR_TNPC_I	wrpr	%r22, 0x00ec, %tnpc
	.word 0xbd508000  ! 485: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a81c20  ! 486: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a94820  ! 495: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbba84820  ! 496: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a90820  ! 502: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbac4c000  ! 505: ADDCcc_R	addccc 	%r19, %r0, %r29
	.word 0xbba80c20  ! 507: FMOVRLZ	dis not found

	mov	0x320, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 509: RDPR_TT	<illegal instruction>
	.word 0x87946190  ! 511: WRPR_TT_I	wrpr	%r17, 0x0190, %tt
	.word 0xb1a8c820  ! 514: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbda4c960  ! 516: FMULq	dis not found

	.word 0xbda44860  ! 517: FADDq	dis not found

	.word 0xb3a4c920  ! 522: FMULs	fmuls	%f19, %f0, %f25
	.word 0x839420b2  ! 524: WRPR_TNPC_I	wrpr	%r16, 0x00b2, %tnpc
	.word 0x8d95e0d1  ! 526: WRPR_PSTATE_I	wrpr	%r23, 0x00d1, %pstate
	.word 0xb5a00520  ! 531: FSQRTs	fsqrt	
	.word 0x899460c3  ! 534: WRPR_TICK_I	wrpr	%r17, 0x00c3, %tick
	.word 0xb7a44840  ! 538: FADDd	faddd	%f48, %f0, %f58
	mov	2, %r12
	.word 0xa1930000  ! 542: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfa48940  ! 543: FMULd	fmuld	%f18, %f0, %f62
	.word 0xbbabc820  ! 544: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb1a4c920  ! 546: FMULs	fmuls	%f19, %f0, %f24
	.word 0xb1a00540  ! 548: FSQRTd	fsqrt	
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 552: RDPR_PSTATE	<illegal instruction>
	.word 0xb1aa4820  ! 555: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbfa4c9e0  ! 557: FDIVq	dis not found

	.word 0xb9a81c20  ! 558: FMOVRGEZ	dis not found

	.word 0xbda80c20  ! 560: FMOVRLZ	dis not found

	.word 0x9194a0c0  ! 564: WRPR_PIL_I	wrpr	%r18, 0x00c0, %pil
	.word 0xb7a40920  ! 574: FMULs	fmuls	%f16, %f0, %f27
	.word 0xb9a80820  ! 575: FMOVN	fmovs	%fcc1, %f0, %f28
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 586: RDPR_TPC	<illegal instruction>
	.word 0xb5a549c0  ! 587: FDIVd	fdivd	%f52, %f0, %f26
	.word 0x859560be  ! 590: WRPR_TSTATE_I	wrpr	%r21, 0x00be, %tstate
	setx	0x9377388d00008f00, %g1, %r10
	.word 0x839a8000  ! 591: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd504000  ! 593: RDPR_TNPC	<illegal instruction>
	.word 0xb5a80820  ! 594: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbba00560  ! 597: FSQRTq	fsqrt	
	.word 0x819420c4  ! 598: WRPR_TPC_I	wrpr	%r16, 0x00c4, %tpc
	.word 0x8395e19f  ! 600: WRPR_TNPC_I	wrpr	%r23, 0x019f, %tnpc
	.word 0xbba58920  ! 604: FMULs	fmuls	%f22, %f0, %f29
	.word 0xb00cc000  ! 605: AND_R	and 	%r19, %r0, %r24
	.word 0xb5a5c840  ! 606: FADDd	faddd	%f54, %f0, %f26
	.word 0xbda44960  ! 610: FMULq	dis not found

	.word 0xbb504000  ! 613: RDPR_TNPC	<illegal instruction>
	.word 0xb5ab0820  ! 615: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbf508000  ! 616: RDPR_TSTATE	<illegal instruction>
	.word 0xb951c000  ! 617: RDPR_TL	<illegal instruction>
	.word 0xbfa98820  ! 618: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb9a589e0  ! 621: FDIVq	dis not found

	.word 0xbd500000  ! 623: RDPR_TPC	<illegal instruction>
	.word 0xbba00540  ! 624: FSQRTd	fsqrt	
	.word 0xb9a80c20  ! 627: FMOVRLZ	dis not found

	.word 0xb950c000  ! 629: RDPR_TT	<illegal instruction>
	.word 0xb835e1c8  ! 632: ORN_I	orn 	%r23, 0x01c8, %r28
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795215a  ! 636: WRPR_TT_I	wrpr	%r20, 0x015a, %tt
	.word 0xb3a00520  ! 637: FSQRTs	fsqrt	
	setx	0x12fe31aa00007e02, %g1, %r10
	.word 0x819a8000  ! 638: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5a54860  ! 639: FADDq	dis not found

	.word 0xb3a8c820  ! 643: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbaade0a3  ! 645: ANDNcc_I	andncc 	%r23, 0x00a3, %r29
	.word 0x91946137  ! 650: WRPR_PIL_I	wrpr	%r17, 0x0137, %pil
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c960  ! 652: FMULq	dis not found

	.word 0xbba81c20  ! 654: FMOVRGEZ	dis not found

	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab0820  ! 661: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb3a449e0  ! 662: FDIVq	dis not found

	.word 0xb9ab4820  ! 663: FMOVCC	fmovs	%fcc1, %f0, %f28
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 668: FMOVL	fmovs	%fcc1, %f0, %f31
	mov	0x324, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8995e1ac  ! 671: WRPR_TICK_I	wrpr	%r23, 0x01ac, %tick
	.word 0xb1504000  ! 675: RDPR_TNPC	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 689: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3a4c820  ! 692: FADDs	fadds	%f19, %f0, %f25
	.word 0xbfa81420  ! 693: FMOVRNZ	dis not found

	.word 0xb5a50940  ! 694: FMULd	fmuld	%f20, %f0, %f26
	.word 0xb3aa4820  ! 695: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0x8995206b  ! 697: WRPR_TICK_I	wrpr	%r20, 0x006b, %tick
	mov	2, %r12
	.word 0x8f930000  ! 698: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9518000  ! 700: RDPR_PSTATE	<illegal instruction>
	.word 0xbb518000  ! 701: RDPR_PSTATE	<illegal instruction>
	mov	0x30, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa4820  ! 706: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0x91942111  ! 707: WRPR_PIL_I	wrpr	%r16, 0x0111, %pil
	.word 0xb9ab4820  ! 710: FMOVCC	fmovs	%fcc1, %f0, %f28
	setx	0xa4f25d350000be19, %g1, %r10
	.word 0x819a8000  ! 711: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d94e0d8  ! 714: WRPR_PSTATE_I	wrpr	%r19, 0x00d8, %pstate
	.word 0xbfaa0820  ! 715: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb9a509e0  ! 717: FDIVq	dis not found

	.word 0xb5a548c0  ! 718: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xb3a88820  ! 721: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a509a0  ! 722: FDIVs	fdivs	%f20, %f0, %f27
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 732: FMOVVC	fmovs	%fcc1, %f0, %f31
	setx	0x89813f6a00002a05, %g1, %r10
	.word 0x819a8000  ! 738: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb951c000  ! 743: RDPR_TL	<illegal instruction>
	.word 0xb6bd0000  ! 745: XNORcc_R	xnorcc 	%r20, %r0, %r27
	.word 0xbd508000  ! 746: RDPR_TSTATE	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 758: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1a80420  ! 764: FMOVRZ	dis not found

	.word 0xb5a5c860  ! 767: FADDq	dis not found

	.word 0x8595e08c  ! 769: WRPR_TSTATE_I	wrpr	%r23, 0x008c, %tstate
	mov	0x309, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595205a  ! 772: WRPR_TSTATE_I	wrpr	%r20, 0x005a, %tstate
	setx	0x3ff726b300009b49, %g1, %r10
	.word 0x839a8000  ! 773: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x2b, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 785: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x9195a142  ! 791: WRPR_PIL_I	wrpr	%r22, 0x0142, %pil
	.word 0x8394212c  ! 792: WRPR_TNPC_I	wrpr	%r16, 0x012c, %tnpc
	mov	0x330, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 796: FSQRTq	fsqrt	
	.word 0xba852155  ! 797: ADDcc_I	addcc 	%r20, 0x0155, %r29
	.word 0xbb510000  ! 800: RDPR_TICK	<illegal instruction>
	.word 0x8794a133  ! 801: WRPR_TT_I	wrpr	%r18, 0x0133, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x81942048  ! 804: WRPR_TPC_I	wrpr	%r16, 0x0048, %tpc
	.word 0xb9a509a0  ! 805: FDIVs	fdivs	%f20, %f0, %f28
	.word 0xb3641800  ! 807: MOVcc_R	<illegal instruction>
	.word 0xbfa589c0  ! 809: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xb1510000  ! 811: RDPR_TICK	<illegal instruction>
	.word 0xb29c2113  ! 812: XORcc_I	xorcc 	%r16, 0x0113, %r25
	.word 0xb7abc820  ! 817: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0x8395e095  ! 821: WRPR_TNPC_I	wrpr	%r23, 0x0095, %tnpc
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba50920  ! 823: FMULs	fmuls	%f20, %f0, %f29
	.word 0xbda80420  ! 825: FMOVRZ	dis not found

	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	.word 0xbda84820  ! 833: FMOVE	fmovs	%fcc1, %f0, %f30
	mov	1, %r12
	.word 0xa1930000  ! 837: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x9, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 841: FMOVLE	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd51c000  ! 846: RDPR_TL	<illegal instruction>
	.word 0xbfab8820  ! 851: FMOVPOS	fmovs	%fcc1, %f0, %f31
	mov	2, %r12
	.word 0x8f930000  ! 858: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8995e19b  ! 859: WRPR_TICK_I	wrpr	%r23, 0x019b, %tick
	.word 0xb1a00020  ! 861: FMOVs	fmovs	%f0, %f24
	.word 0xb5a489e0  ! 866: FDIVq	dis not found

	.word 0xb015a1d2  ! 867: OR_I	or 	%r22, 0x01d2, %r24
	.word 0xb3510000  ! 868: RDPR_TICK	<illegal instruction>
	.word 0xbbaac820  ! 869: FMOVGE	fmovs	%fcc1, %f0, %f29
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb005a125  ! 874: ADD_I	add 	%r22, 0x0125, %r24
	setx	0x2d637acf00006a44, %g1, %r10
	.word 0x819a8000  ! 877: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3a5c8e0  ! 878: FSUBq	dis not found

	setx	0x4e7b138c00009a9c, %g1, %r10
	.word 0x819a8000  ! 879: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb085c000  ! 883: ADDcc_R	addcc 	%r23, %r0, %r24
	.word 0xb7a9c820  ! 885: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbd510000  ! 886: RDPR_TICK	<illegal instruction>
	mov	0x39, %o0
	ta	T_SEND_THRD_INTR
	mov	0x309, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 894: FMOVRZ	dis not found

	.word 0xb8adc000  ! 895: ANDNcc_R	andncc 	%r23, %r0, %r28
	.word 0xb5a448e0  ! 897: FSUBq	dis not found

	.word 0xbfaac820  ! 900: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb7a81420  ! 902: FMOVRNZ	dis not found

	.word 0xb2840000  ! 903: ADDcc_R	addcc 	%r16, %r0, %r25
	.word 0xbda548e0  ! 904: FSUBq	dis not found

	mov	1, %r12
	.word 0x8f930000  ! 906: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r22
	.word 0xb1a5c9a0  ! 912: FDIVs	fdivs	%f23, %f0, %f24
	.word 0xb3a58960  ! 913: FMULq	dis not found

	.word 0xbda489c0  ! 914: FDIVd	fdivd	%f18, %f0, %f30
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 916: FSQRTq	fsqrt	
	setx	0x71af6dab00003a8d, %g1, %r10
	.word 0x819a8000  ! 917: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3a80c20  ! 918: FMOVRLZ	dis not found

	.word 0xb351c000  ! 919: RDPR_TL	<illegal instruction>
	.word 0xb5aa8820  ! 925: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb3643801  ! 926: MOVcc_I	<illegal instruction>
	.word 0xbda88820  ! 927: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb5ab0820  ! 929: FMOVGU	fmovs	%fcc1, %f0, %f26
	mov	1, %r12
	.word 0xa1930000  ! 932: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb83dc000  ! 935: XNOR_R	xnor 	%r23, %r0, %r28
	setx	0x515d8a6f0000ff18, %g1, %r10
	.word 0x839a8000  ! 936: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1480000  ! 937: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb1aa8820  ! 938: FMOVG	fmovs	%fcc1, %f0, %f24
	mov	2, %r12
	.word 0x8f930000  ! 939: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8994e151  ! 942: WRPR_TICK_I	wrpr	%r19, 0x0151, %tick
	.word 0xbe856169  ! 945: ADDcc_I	addcc 	%r21, 0x0169, %r31
	.word 0xb5a81c20  ! 947: FMOVRGEZ	dis not found

	mov	0x21, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 950: FSQRTs	fsqrt	
	.word 0xb62ca0fc  ! 952: ANDN_I	andn 	%r18, 0x00fc, %r27
	.word 0xb9a588c0  ! 953: FSUBd	fsubd	%f22, %f0, %f28
	.word 0xb751c000  ! 957: RDPR_TL	<illegal instruction>
	.word 0xbd50c000  ! 958: RDPR_TT	<illegal instruction>
	.word 0xb3a54820  ! 959: FADDs	fadds	%f21, %f0, %f25
	mov	0x32a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0a40000  ! 965: SUBcc_R	subcc 	%r16, %r0, %r24
	mov	0x31f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda50940  ! 968: FMULd	fmuld	%f20, %f0, %f30
	.word 0xb7a40820  ! 972: FADDs	fadds	%f16, %f0, %f27
	mov	0x32b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a549c0  ! 977: FDIVd	fdivd	%f52, %f0, %f26
	setx	data_start_5, %g1, %r18
	.word 0x8d94207c  ! 984: WRPR_PSTATE_I	wrpr	%r16, 0x007c, %pstate
	.word 0xbba00520  ! 986: FSQRTs	fsqrt	
	.word 0x85956008  ! 992: WRPR_TSTATE_I	wrpr	%r21, 0x0008, %tstate
	mov	0x11a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c9e0  ! 995: FDIVq	dis not found

	.word 0x9195213c  ! 996: WRPR_PIL_I	wrpr	%r20, 0x013c, %pil
	.word 0x8594e18f  ! 997: WRPR_TSTATE_I	wrpr	%r19, 0x018f, %tstate
	.word 0xbd540000  ! 998: RDPR_GL	<illegal instruction>

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

	.xword	0x5c73a65d0261d133
	.xword	0x7edac20c52dbcdc6
	.xword	0xa4e47d188ceb4782
	.xword	0x862b8b0078f655dc
	.xword	0x12dba27d0f4e3561
	.xword	0xcbb1920ec4b901d1
	.xword	0x463322a58de8ba8c
	.xword	0x2a7c32becfee87f0
	.xword	0x4d4c8a616442a2a8
	.xword	0xce4bc608aeb9cf17
	.xword	0x1a7f2394c9ff6426
	.xword	0xb7ce429de19d930f
	.xword	0x759696ee6342a762
	.xword	0xd316ae4c3d9951ed
	.xword	0xb72965e385b5dc34
	.xword	0xafb23eb47e58de93
	.xword	0x3b450ff8322425d2
	.xword	0xc8bff06cd1dee50e
	.xword	0x5bc5da55b842d84b
	.xword	0xc81aef95956f42ee
	.xword	0x955b31c5a6e7efc0
	.xword	0x6be04e706208703e
	.xword	0x6069a54ced100b6a
	.xword	0x63ba955e7776b52d
	.xword	0x8d9ab17aed904539
	.xword	0xe78f37cedeedb211
	.xword	0xe0d0a2000f1b817b
	.xword	0xc8894193bbc5ed88
	.xword	0x9f55c1bbb83757d2
	.xword	0x2e1b010aa1ab095d
	.xword	0x528c6d0fc0a9c115
	.xword	0x5201e46206e90dc3
	.xword	0xcfc29d48a348ca84
	.xword	0x3652aac356173583
	.xword	0x9b2fcc6bac4b49ae
	.xword	0x1f579e3798a50523
	.xword	0x3a305ff02c0a10c5
	.xword	0x62de4d6931e61b08
	.xword	0xa627359b030c5054
	.xword	0x75144ce260626fc6
	.xword	0xafb0a0a1fd96baca
	.xword	0x0bf160a9dcf78d4f
	.xword	0x323c6114e85d2b69
	.xword	0x6aae86d42b18f31f
	.xword	0xde6d92203cfed44e
	.xword	0xf9147dd05812d9b0
	.xword	0x01521d46cfa124c1
	.xword	0xd917dcd62c5db182
	.xword	0xae0a12b12a7e4e64
	.xword	0x72d374119fb678b0
	.xword	0x175a9193e4e4cc90
	.xword	0x2e1ff47b1ebbaaf4
	.xword	0xa2270f09f4f24fe4
	.xword	0xccb17912c2a025c5
	.xword	0x4c0bade88367a98b
	.xword	0x12c758c8427ea470
	.xword	0xa12c9e8d154d6d01
	.xword	0xea6c3824492bf2ba
	.xword	0xe60d8b8be326b808
	.xword	0x6887fae0a78dc86b
	.xword	0xd6e22cda5dabd781
	.xword	0x871d0a1816d3868b
	.xword	0x2b3ff7c3a3022684
	.xword	0xe4565c1689689560
	.xword	0xba629a072c1e9213
	.xword	0x3a0c357f6852e977
	.xword	0xdabf7898d7fc7820
	.xword	0x443721bf96a67500
	.xword	0xbcd6880cb2bfa021
	.xword	0x6a611cf9c6ec98c0
	.xword	0x9f37affdb72b4c91
	.xword	0xd7257839f11ab869
	.xword	0xb5269ed8099a8dbe
	.xword	0x098641230652e7c8
	.xword	0x9505b69da53a74ed
	.xword	0x77c7b590e1ec75ad
	.xword	0xae64953ada6aeb44
	.xword	0x670814251f3838cb
	.xword	0xe76a663ccec8b4e3
	.xword	0x167e0cfc8bc0f8f9
	.xword	0xffcbc42e8685b7be
	.xword	0xd90ee3505c63f814
	.xword	0xd423b60dbd7a8aef
	.xword	0xfd29edda50d54f95
	.xword	0x182393bf3c0fa814
	.xword	0x4d6df855351efc3a
	.xword	0x728a9ae821f4cacf
	.xword	0x5966340928f3891a
	.xword	0x68f6bf717111a100
	.xword	0x3dbdf08cfb4a45b8
	.xword	0x74859f1ff158e51c
	.xword	0x04024cd18476b4f6
	.xword	0xe9f7e19afc191b56
	.xword	0x801cd6533be7c48e
	.xword	0x25ea43898550557a
	.xword	0x518f4c54506f0bca
	.xword	0xc7c21a32357690ee
	.xword	0xa042c999d926afcc
	.xword	0x4a887cb5657ee465
	.xword	0x25868d9828227867
	.xword	0x1d34064b1ad4fa14
	.xword	0x6db2846643972804
	.xword	0x1f43ee5d559d184f
	.xword	0xe7a1d2c13f1389c0
	.xword	0x2d8de43eda82b0d6
	.xword	0x7b6fba3bbd73045c
	.xword	0x266fb5aab1adb30c
	.xword	0x65d79b4b8a082ea9
	.xword	0x9c22227026e7b483
	.xword	0xf0bbfcaf951b5ff1
	.xword	0x191dbc642c472c29
	.xword	0x968c562b111ba02d
	.xword	0xb0e77efd0a33265d
	.xword	0x9c5c293265c18dcd
	.xword	0x63ffbc3312e811c8
	.xword	0x64a2293c075745c6
	.xword	0xf7a4631622847998
	.xword	0x416a097330efe39c
	.xword	0x98407645ce52caaf
	.xword	0x2713134fa4b93db2
	.xword	0xdda50071c77d9bc2
	.xword	0x461e013a9f28c2e2
	.xword	0x0b7ca86ef8c95e2b
	.xword	0xef9bf7e02f874d60
	.xword	0xbb6f7d68568e4574
	.xword	0x51a90bbaf3cba7d0
	.xword	0xb634df10b304a65c
	.xword	0x208103cb8c716c39
	.xword	0xfc82c8fa2b86bbcf
	.xword	0x3f3e2c6b42cfa960
	.xword	0x71f7d46bb0de5261
	.xword	0x4434c106b1099a1d
	.xword	0x7d5f43d33918f9c5
	.xword	0xce64e0be37ea5b21
	.xword	0x31d7c51e39fcf1c3
	.xword	0xb9c39ca64ceb66cb
	.xword	0xd5da1159752022e6
	.xword	0x1213dfb095da99a2
	.xword	0x1a7e6591363cf25f
	.xword	0x6d5482c9894f5787
	.xword	0xb5485c67d9375463
	.xword	0xaa01af4bfd1769a8
	.xword	0x706532184df13b8b
	.xword	0xa464c9ed05ae4619
	.xword	0x2ce2e083fa5dadae
	.xword	0x7ad32622885428f5
	.xword	0xecd07d1043d93c1a
	.xword	0x18b07de05b97b2f7
	.xword	0x21d150875e6bf6a1
	.xword	0x0800be56f578a8ad
	.xword	0x9879f84b38c73c53
	.xword	0xa0d0505b3e4ba933
	.xword	0x2371da3639a867b9
	.xword	0x5df2761046e0c4a8
	.xword	0x726ca6a4a70fb2a2
	.xword	0xf278bee677a7dad7
	.xword	0xa83d03bf8226658a
	.xword	0x506a2bc495818db0
	.xword	0xbb3daee716646c35
	.xword	0x04c7e0c3cda39c2a
	.xword	0xc0aedce1e361f1e9
	.xword	0xd63b7701c6e6c87e
	.xword	0x21b3a280af6f5f1f
	.xword	0xe96a55b7d1ccbb81
	.xword	0x38fc4ea2a3e8988b
	.xword	0xccf65f318e907563
	.xword	0xae65de591b9d11d3
	.xword	0x72a9215b6d9e9fca
	.xword	0x5fb3a9e365a5ac06
	.xword	0x455f5f70e436b4bc
	.xword	0xe87c70b8617ec842
	.xword	0xcac64d9fb006634c
	.xword	0x25f960887dca53cf
	.xword	0xbb837b8f7ab9ee1a
	.xword	0x1aabc3c581b3a159
	.xword	0x902183908c87e0a4
	.xword	0x2c4d9ef1c5958dbe
	.xword	0xe8b59e63e3fc954c
	.xword	0xb308a15bb0d81dbe
	.xword	0x8b3ea46f6768a3fb
	.xword	0x248352dff859a6d7
	.xword	0xaf5a22c09410d6d1
	.xword	0x5fce591631cf1a89
	.xword	0xe69919eeac56482e
	.xword	0x63726990f33da043
	.xword	0x7df4cb380a425b31
	.xword	0x619cd43c99855fb6
	.xword	0x0f3597279f54defb
	.xword	0x897fa35c05510d25
	.xword	0x3b04c650a9e9ea05
	.xword	0x3429c2660217a294
	.xword	0x6454e5ebbd1184b9
	.xword	0x7aa8d0b8ef0d24a4
	.xword	0x007cd2d631cd7eb8
	.xword	0x7dc196182320b522
	.xword	0x420ab77290d7fe0d
	.xword	0xb5abf55dd18ca7fb
	.xword	0xf287e72222a85807
	.xword	0x4f655a851c2a7f07
	.xword	0x246072fa252125ea
	.xword	0x9d6d19d091ea862b
	.xword	0xbbcfeca35010cd6e
	.xword	0xf5b6611b4b747006
	.xword	0x0e7a3933fcc15ab3
	.xword	0x1d281553531c4b45
	.xword	0x416cc07d3aa10c4c
	.xword	0x81b2d2f87f17e8e0
	.xword	0x6eaa959582205370
	.xword	0xf020a95d3a339773
	.xword	0xf8ab9a71276af3df
	.xword	0xeaac07ed6015a60e
	.xword	0x86936b12ef5e9ada
	.xword	0x3f252bb2ed293b71
	.xword	0x037703ba3c8d79cb
	.xword	0xa2fa055aac03f033
	.xword	0x9c7e97384c652fc6
	.xword	0xaa7653d2d532777f
	.xword	0x0ca6ee34f9b75932
	.xword	0x0db44932bb04051e
	.xword	0xc5a69c43d2d5688b
	.xword	0xb4627194196331b3
	.xword	0xcb045f704d622f9e
	.xword	0x93f1234df73e30a2
	.xword	0x45a3fad1c6c29597
	.xword	0xf850956c017729eb
	.xword	0x86fa3a1891d6fac4
	.xword	0x2cb57b2a8483ffd6
	.xword	0x0a8af1e7c4184298
	.xword	0x95d781f1c0d1945b
	.xword	0x190ecadc3d22035e
	.xword	0x228eeaa258f4c354
	.xword	0xa520355bfc7fe602
	.xword	0x8ee9ff770924759e
	.xword	0xf5fa253f49b64d27
	.xword	0xaa9511adf93cc52c
	.xword	0x900b0dca8c326904
	.xword	0xdf9b6401d40691e4
	.xword	0x5d2597d5deed64f8
	.xword	0x10d0191d4a0f0c57
	.xword	0xa513da38949dd0e3
	.xword	0xfe9a79e038a77c9b
	.xword	0xd98e587b2d028b40
	.xword	0x26bbfa8aa1a5f5bb
	.xword	0x3b3cc6d12a56f40a
	.xword	0xddf2c46f3af1f89c
	.xword	0x756ceaf837538a4c
	.xword	0xe7841e0b2eb32586
	.xword	0xce2318e54d494f9e
	.xword	0x5ecd70ab8d5a1e51
	.xword	0x8ddc75fa6f142f42
	.xword	0x2c229e75cdfcc653
	.xword	0x3b665aba48ab2677
	.xword	0x17f6c52882435f1f
	.xword	0x3bf9f08f0672bc06
	.xword	0x7b4afa3e52a62f6d
	.xword	0x20e3b76ab99b6c4f
	.align 0x2000
	.data
data_start_1:

	.xword	0x378dd09d07bfb65b
	.xword	0x29139262d5888490
	.xword	0xf499a27351c0b176
	.xword	0x3768edbb4401805f
	.xword	0xe99906027b6d3864
	.xword	0x9e195c589db2a2de
	.xword	0x04ce3a9f94a5567b
	.xword	0xde0477c4922073dc
	.xword	0x67831628c2c8fccc
	.xword	0x81007d3e79738665
	.xword	0xb53c45e7f89b92e0
	.xword	0x58d6721d0f1c3842
	.xword	0x2836c07cee7c09cb
	.xword	0xef637dce15c016a4
	.xword	0xa115c65ecbfc181a
	.xword	0xaf2cfae7752d251c
	.xword	0x6b1f69f780ceb0ce
	.xword	0xe81bc1ce9f6a0442
	.xword	0x3de5bc2376bd0488
	.xword	0x6bc0716ddf3addf5
	.xword	0xa6155826f6b0da0d
	.xword	0xb85a48d1bad4e773
	.xword	0x7598d89de30bb505
	.xword	0xbdefce9007bad413
	.xword	0xb62c60403dfa7f45
	.xword	0x9d481d0ba02ac863
	.xword	0x0624f161d508ee20
	.xword	0xefc8670b7113f105
	.xword	0x29178c3d52db2c30
	.xword	0x40be4085a1f2f5ea
	.xword	0x138bd0e32d8e7b68
	.xword	0x62f22e2cdf0883a3
	.xword	0x968014604212cb0b
	.xword	0x7957237676527d81
	.xword	0xa5856acd94fb3909
	.xword	0x73538a4d72ea2358
	.xword	0x3dfb508254948474
	.xword	0x452c5f5e3d335b06
	.xword	0x0ca1d7c700d5f100
	.xword	0xebc14c15ca074a6d
	.xword	0xa4a8d49ad28c6a88
	.xword	0x8a1718d017712840
	.xword	0x11383064cb00299d
	.xword	0x8dc4b286401aed5b
	.xword	0x465ad39aff50876a
	.xword	0xd6445dc92be4f003
	.xword	0xbc46ae6823655946
	.xword	0x5b77eefe4a6007b5
	.xword	0x70973e847a5abc3d
	.xword	0x085e60f4774bf122
	.xword	0xd179f5873c2da716
	.xword	0x14127f6da429f02a
	.xword	0x94b0a423589c79fc
	.xword	0xfc1db16ebb544b9d
	.xword	0x6a780a680eeee50b
	.xword	0x22177ba168a6587e
	.xword	0x6b6340ef46ebd346
	.xword	0xff75d47bd6283ae4
	.xword	0xf020b5992c98863d
	.xword	0x297d9a554fdcd20e
	.xword	0xcc5b8f91fca6d4e9
	.xword	0x98c68bad538c974d
	.xword	0xc401fe09e1d0a339
	.xword	0x2f776fecee3532d7
	.xword	0xd0103b440cbc8c21
	.xword	0xda8390d3a1a0f1f9
	.xword	0xdf411d197d4b8c32
	.xword	0x11f9abc8b99a92e9
	.xword	0xaf59ea8a8de80636
	.xword	0x07364dc1ef5b82fe
	.xword	0x5439ee6e033abdff
	.xword	0x5150dea670aeeaec
	.xword	0x3eecf01891230175
	.xword	0xcd9ef31cfcbfb55e
	.xword	0x3159a82a5aa2a6aa
	.xword	0x89a86cdf57c9f9a3
	.xword	0x676d61961fbd2b94
	.xword	0xf6f5e267d0644013
	.xword	0x7f0006d03dc70196
	.xword	0x647c6621c691b846
	.xword	0x06fc4640b9d79b39
	.xword	0x72675ea2e1d54701
	.xword	0xb5d689263618b7e7
	.xword	0xc0045c80a9a1d9f5
	.xword	0x0741c3bcd200d25e
	.xword	0x951dc9caf0dca5c1
	.xword	0x93ede1c600c0adc6
	.xword	0x71608dc0c2eeeb2d
	.xword	0x4b1e1e30061ab364
	.xword	0x5c2c3739321223eb
	.xword	0x1e2ffc67701e29a9
	.xword	0xb830d5697ece5e41
	.xword	0xc12e5f1d0987913e
	.xword	0xe5fcaf52252000c3
	.xword	0xea7a61a642edabf2
	.xword	0x746061544b2cef7c
	.xword	0x89484a626c8fa12e
	.xword	0x024718d714d1f398
	.xword	0xe30b18c6da3e9fc2
	.xword	0x1364a7969af4da0f
	.xword	0xcf6967637a88253d
	.xword	0x86b7aea18e3cb42c
	.xword	0x46cd91720cd783af
	.xword	0x31be8a1fbf9b8695
	.xword	0x377acb957f11b983
	.xword	0x11ed62f7d12256bf
	.xword	0x43931284b80880ae
	.xword	0x0b62a12727dbac6d
	.xword	0x4ae773d7631a3d14
	.xword	0x9153a2ee2b81792a
	.xword	0x0bc7c0785f792c6c
	.xword	0xe54c9d0dc7ef19f0
	.xword	0xb1c320c6492f50c7
	.xword	0x5a14b838d13a4de4
	.xword	0x257b73d81245346a
	.xword	0xbb67e795d8ba7286
	.xword	0xc2fa9ac7c22a0258
	.xword	0xbaba554249812866
	.xword	0x04fe0457d1f18bc1
	.xword	0xfedb9928c4c696ab
	.xword	0xd692807fe0b2238d
	.xword	0xb777d4da26bbd733
	.xword	0x8b6d9fdead990145
	.xword	0x37a5fd1c499ecc9c
	.xword	0x90f10b048f53540c
	.xword	0x21e06b1fec6f99b0
	.xword	0x53e86f2ed4dac324
	.xword	0x0c9aa94351ad7051
	.xword	0xd359eaa5582e040c
	.xword	0x1b5cfb19d859c61e
	.xword	0x541fdfa97c374d5d
	.xword	0x15c4b6e8d9435591
	.xword	0x27b2fb7eebe37c72
	.xword	0x5f97078a1b115bc6
	.xword	0x3335662f72a69ad7
	.xword	0x72bff5a49004123a
	.xword	0x964141ecdb539054
	.xword	0xeb1c3d977eeebf82
	.xword	0x8097a0b783f5acb9
	.xword	0x5662802afd061f90
	.xword	0x130acc424dce6305
	.xword	0x50ab5fed346a325f
	.xword	0xed28283c75ead4a9
	.xword	0xc7c4b8e269c0333b
	.xword	0xb90f182c7175cb63
	.xword	0x3f6356b2622dc08c
	.xword	0x5ad4b42512e14529
	.xword	0xfce3aee25f45ded3
	.xword	0x0f25eb51fef46ad0
	.xword	0x779794c3837f9a5a
	.xword	0xbda107a418165ce5
	.xword	0x7210214ddf1664d9
	.xword	0xcabae0582be9614b
	.xword	0xb14ca00a701ab998
	.xword	0xec6f5a7a3a32367a
	.xword	0xec69eadb0ee49164
	.xword	0xeeb4fde0abaea754
	.xword	0x9f8fab0ec03664f7
	.xword	0x1a8ec51b6b7a4905
	.xword	0x1e28c07f12658eff
	.xword	0x83a04eaff6298ad0
	.xword	0x5c89162db5572713
	.xword	0x3661cfd6d6cc0357
	.xword	0xa51fed1296a238c6
	.xword	0x6d7c93a81f7ea9dd
	.xword	0x40920edd4002ad92
	.xword	0x87a1cd3845bc0773
	.xword	0x5b6652dc27639706
	.xword	0xdb36aaad86d4a577
	.xword	0x09fd9d918989b5e9
	.xword	0x507092415d491dad
	.xword	0xc45b75060c379294
	.xword	0xea100b36209d7da1
	.xword	0xed7efc8662618240
	.xword	0x90480b5759c84b59
	.xword	0xbfe5bab41bdb5636
	.xword	0x028994eb1a0c5232
	.xword	0x4177f4dea9f31378
	.xword	0x2d4705dfb7113aff
	.xword	0xc174f6a82f569b9c
	.xword	0x9c2626738939ae58
	.xword	0x616544d253d55692
	.xword	0x089e73ccb721138a
	.xword	0xc05e05e2ccc4e7fa
	.xword	0x5027986601235643
	.xword	0x30700823878c7838
	.xword	0xcbda097d0baa631e
	.xword	0xaf00c28a5bcb253b
	.xword	0x50f18eccb7627385
	.xword	0x1a02f141ed121e76
	.xword	0x83e0748f7de4fbe6
	.xword	0x8329051d7d4f3921
	.xword	0x942d25c04e0090c4
	.xword	0xcbfd92ddae9f82f0
	.xword	0x4c6f1a8cc8322f66
	.xword	0xc752ca4677ab58fa
	.xword	0x6012184f8b553f25
	.xword	0x5d18c7d552b68d18
	.xword	0x71a9dd83cdb4e1db
	.xword	0x26dedecc8f2e87e7
	.xword	0x290a9629e7fda2eb
	.xword	0xf5ae00dcb6a2711b
	.xword	0x105a3273689fea1f
	.xword	0xe3e983eef18d6908
	.xword	0x73777fe2a68a638f
	.xword	0x31f043c2714dc23c
	.xword	0x7f137dc35b0f392a
	.xword	0x531a93cb6841f55d
	.xword	0xdd8459e70ea7c29b
	.xword	0x406358e511e970af
	.xword	0xe4e2d18e3ea5919d
	.xword	0x96941af6dfb55856
	.xword	0x12ed1ba9ee80a3b1
	.xword	0xceea2ff1f7775da3
	.xword	0x4d5918eb2d11a0e9
	.xword	0x9895309b6ac84fc6
	.xword	0x1012ffb4ad5a6b74
	.xword	0xfadf8f0c9a56910d
	.xword	0x14c191c85392688f
	.xword	0x2d448f911f91710c
	.xword	0x48f373714a5b75f4
	.xword	0xb8d93c1a478fa818
	.xword	0xb8aa3ae1d139cc2c
	.xword	0x8caf6f217f6d03e8
	.xword	0x5e45d0fb33e0aab8
	.xword	0xcc2a572846c78773
	.xword	0x53b2e7406e00486e
	.xword	0x7b7ecd05362d583d
	.xword	0x2e2e8ac4cd0132ca
	.xword	0xd9adfd272dd48f37
	.xword	0x790c660089c28e9b
	.xword	0x24b48411b50e4ae8
	.xword	0x9f5f2f87df57477f
	.xword	0x79943063d7b91be6
	.xword	0xf0aea42d8c635a1c
	.xword	0xcc45afcd5b8b5c34
	.xword	0x70b5a5dcdcf1368f
	.xword	0x10354d70e9a5b400
	.xword	0x33e0430117d85b1e
	.xword	0x7481f573662a5a10
	.xword	0x74eb6d83938ecf3a
	.xword	0xd6006809c0f191bc
	.xword	0x791e314e780ff755
	.xword	0xe8676fab864c3f60
	.xword	0x02ee17b40e846ad8
	.xword	0x18ac92da757d5073
	.xword	0x449a9da7d7ea7e97
	.xword	0x500176880d19c422
	.xword	0xd8ac48262a224a1c
	.xword	0xc54f3c2c205462f9
	.xword	0xc84c7163a972ea7a
	.xword	0x898d9bf532d5f7a7
	.xword	0x44323f52859514ad
	.xword	0x9c645083c4410148
	.xword	0x3c7d0271dd643a54
	.xword	0x59a6e85bd3d041da
	.align 0x4000
	.data
data_start_2:

	.xword	0x44727122c6cf366b
	.xword	0x236b5344c32c0d64
	.xword	0x1f5fa17e812d5f56
	.xword	0x89fb3bc2b277655a
	.xword	0x1a3eb8983061ec26
	.xword	0x3cad023924e4f629
	.xword	0x21a53f4824c3f56d
	.xword	0xb8f245aed2bfb44f
	.xword	0xa1aaf0d7d442ff67
	.xword	0xc2a6eed7be223991
	.xword	0x076fcb2bf715aba5
	.xword	0xc939dbe610dcfda1
	.xword	0x09b0f86f3fb75491
	.xword	0xb14300c1a31a4e7d
	.xword	0x086d84cf7fcbfda1
	.xword	0x1373c39342b3d78b
	.xword	0x0988941ac44a5462
	.xword	0xcb8fa97e68f3a088
	.xword	0xc043d3060cab620e
	.xword	0x146c45be9f944e05
	.xword	0x347bd4490bddb38a
	.xword	0xe545ed87941dbbb8
	.xword	0xcfada4a7f5329a71
	.xword	0xdab3bd07551fc2ca
	.xword	0xd606941cc88dbba4
	.xword	0xa02f2d4331833b71
	.xword	0xc900f163f032296c
	.xword	0x35fc59a86ff72006
	.xword	0x0229a8be75b6a673
	.xword	0xd6949880d30c155b
	.xword	0x99c61d557140688a
	.xword	0x1c2d9c9f9abc2732
	.xword	0xf0d3ec7513b0d0ba
	.xword	0x83b4a86d1cc18380
	.xword	0xf0b4c858483342c5
	.xword	0x5aabf232340a5a2b
	.xword	0xe3b90a874e4cbd51
	.xword	0xe55c7b9d1af21948
	.xword	0xb10eb4c90f217a68
	.xword	0xd9088e6d1e39abd8
	.xword	0xed0b0589f0035cf5
	.xword	0x254df680dab143b3
	.xword	0xc919ab72001b68ac
	.xword	0xa4a08f233b33067f
	.xword	0x0cb5b5ecdd77be97
	.xword	0xf3f8c2e984b41780
	.xword	0x164a1beba4132c3c
	.xword	0x4a88e9433eea61f0
	.xword	0xa3704f2fa503f879
	.xword	0x9a2a8c8e7dd964fa
	.xword	0x08f71f0880bca067
	.xword	0xa07e373377e83a16
	.xword	0xe2af8467d0a60d0a
	.xword	0x2e1ea1b72e1f6747
	.xword	0x331d332b8bdef81a
	.xword	0xe4cc0ef22123e22b
	.xword	0x2d5b2ba0a87a91ed
	.xword	0x74d0ab8dc4e6dd99
	.xword	0x22a1adfe1c3cf626
	.xword	0xe178476739c515ad
	.xword	0x12e54d17aba4a8b5
	.xword	0x233f6e7104bd095c
	.xword	0xe3f27b97dd27b8cc
	.xword	0xc803e17801357fc8
	.xword	0x0c8cfa1183aff396
	.xword	0xc0ba9abbc08f3e2c
	.xword	0xf2c79657aac31007
	.xword	0xa56d0d54fc8346bb
	.xword	0x4f56f2ae3edbca08
	.xword	0x534d9ae8c0aa9e04
	.xword	0x83e3145ee6134593
	.xword	0x0945a21bacf7e9bf
	.xword	0xf5980ed54de9947f
	.xword	0x3a0fd74ad28d7191
	.xword	0x4a4362cdbc0bbf69
	.xword	0x0331ca011118c269
	.xword	0x53ead97de045281c
	.xword	0x7866082f8be7b582
	.xword	0xd1ae523be5f00c6b
	.xword	0xc36bb430a31c13b7
	.xword	0xac8154c51f5d01b5
	.xword	0xfde560a52f1acde0
	.xword	0x2a24f07782cc5d61
	.xword	0x9c0ec839afea16d2
	.xword	0x5e029e8143d8685f
	.xword	0xb4af9a37025ee13d
	.xword	0xa4bfa281af090f23
	.xword	0x821cbf60f02fdd9e
	.xword	0x9e316aa6c5d8c3d1
	.xword	0xfe7765aaa1c59d87
	.xword	0x62f45c86a0e8ed06
	.xword	0xab0789c6bd202c4b
	.xword	0x8969bf1a83a6651f
	.xword	0xc952d252b23d9c66
	.xword	0x1143fd47a815be0f
	.xword	0xa08f32f36f6e31c0
	.xword	0x589492d0bf8bdb81
	.xword	0xc2a0c06edc206df6
	.xword	0xc33dba94922dc1f4
	.xword	0xcdfd9d95ddd529b2
	.xword	0x7a7e8b01c3e3b513
	.xword	0x0f0fe792a62a1598
	.xword	0x24cc4497495e93f0
	.xword	0xa11aebf835e6dcc7
	.xword	0x939d22e3b35e5b6e
	.xword	0xf0f9067d835d985f
	.xword	0x6ab958636d516bf7
	.xword	0xf7962b02c4d44306
	.xword	0x8668acc5eaa57f92
	.xword	0x6297213bcc263cec
	.xword	0x76ba3e4610e64bb5
	.xword	0x87d4cbf0aa457c54
	.xword	0x05c8c5e86d07bd34
	.xword	0xece114e92a0d3ddf
	.xword	0x9f7831d061c56761
	.xword	0x8f372d859de0bddf
	.xword	0x96d7193f61977e9f
	.xword	0x69f59ffc4c72d64a
	.xword	0x5f31e75d2bf9f271
	.xword	0xbf8e1deb1acc6a30
	.xword	0x325a4a6605698484
	.xword	0xd6ea79fbee8103c9
	.xword	0x5f6f461f33ba9867
	.xword	0x446ba0dddd739f73
	.xword	0x5e6c0a6a7fffb060
	.xword	0xcd10c9a96f5af83c
	.xword	0xd5a230dc0b41ed43
	.xword	0x260660e2a2ad3bbc
	.xword	0xf2e9793aea2b19bf
	.xword	0xe08fca0fecd39614
	.xword	0x4d387c4bd4d16d84
	.xword	0x2f7faa107c1685c1
	.xword	0xfb451b95fe44119e
	.xword	0xf4dc34b9e5ce561a
	.xword	0x77db0b4c5476bb8a
	.xword	0x454e3fd2817971c2
	.xword	0xa7a01653c180b90b
	.xword	0x8421d3743af494bd
	.xword	0xa376f028b014c9ef
	.xword	0xb6248c3f0e0e1066
	.xword	0xda58193a934947f7
	.xword	0x9e1fe50ef1803382
	.xword	0xdb42f7055ff6061a
	.xword	0x1a359b7bb33f2a44
	.xword	0xf30d499df28cc0b3
	.xword	0x8d5e8a3db275b711
	.xword	0xd104a1a23d9db711
	.xword	0x8868d8504a6cf013
	.xword	0xc1d8e8e48399b096
	.xword	0xa63e524e08c43984
	.xword	0x3daa0be2a1dc1f5d
	.xword	0x4e49689a73f790c9
	.xword	0xfa58db6c25d6a18b
	.xword	0x88e88317d2fbd5f3
	.xword	0x94124a23f7f6e908
	.xword	0x4c1bfbf20d3bde31
	.xword	0xad492c6cd9324ef3
	.xword	0x2cf184e6e65d95e0
	.xword	0x3e3e903b58746115
	.xword	0x0c1d2f95df18508e
	.xword	0x8d19e13b3c69e559
	.xword	0xe7a8d9455ec41fb7
	.xword	0x432d441aaf7de6e3
	.xword	0xb42f80e266ccdb40
	.xword	0xdecb132385d787a3
	.xword	0xadb26734193a337a
	.xword	0xa04cda512788c08f
	.xword	0xbc5ce9ef41d35233
	.xword	0xa506872042c147fb
	.xword	0x41dfd7f12c58fa2f
	.xword	0x22e62c726232c5bf
	.xword	0x92bf9e32300fa1f8
	.xword	0x298f79f0a30f7b42
	.xword	0xabe26f5e92f1cffd
	.xword	0xc727eb04597bde0d
	.xword	0x797bf1f5c32c7587
	.xword	0xdadbed6dc6e69683
	.xword	0x50255c963940e33f
	.xword	0x4389d0678bb9a10e
	.xword	0x9aac3648bd89067f
	.xword	0xcef7898dc04f971c
	.xword	0xc2a79d29b62291d6
	.xword	0xd639f2379a6073c6
	.xword	0xb16cd13d1100c6bd
	.xword	0xdd334c62b33a32ea
	.xword	0x6c0f26bf7e420ba8
	.xword	0x6a95e7c30f585163
	.xword	0x7074d92f35c4973d
	.xword	0x263c1e517325f6d8
	.xword	0x7bba8c780a78662b
	.xword	0xd46d25a0a2f0e50d
	.xword	0xb599eea063ef66be
	.xword	0x7a34e0a866c7116a
	.xword	0x67251c14e30da4c8
	.xword	0xda7dec323c8564ed
	.xword	0x862198f21f571398
	.xword	0x4522d6680e4ce1ed
	.xword	0x56ad768896af2d87
	.xword	0x6680b61db14d95fe
	.xword	0x19b6bf26b8d9d6fb
	.xword	0xa4e4ee1f5f1195f5
	.xword	0x0264d8c99e128001
	.xword	0x3b7647f8a806276b
	.xword	0xe2114982ab6eb70c
	.xword	0x128353ea9c1a616d
	.xword	0xd16ffb45056a67dd
	.xword	0x9316da5d96e81566
	.xword	0x2adcb7e07bf09f1e
	.xword	0xaf5f1cd5ba881910
	.xword	0xb101114d409ae910
	.xword	0x988a34973bdbda6d
	.xword	0x5f655d91d8def283
	.xword	0x6c50abcefe335647
	.xword	0xcb6d8c161dd49075
	.xword	0x4a7466a3170ad342
	.xword	0x15f85a8aef19a99a
	.xword	0x11e3c1349fbe9069
	.xword	0xee1fe09826d05e84
	.xword	0x958af14c5252b53b
	.xword	0x2dd438915b41b367
	.xword	0x5aae3e0fabecf30e
	.xword	0xee6a327cde60ef56
	.xword	0x652c2724b897765d
	.xword	0x8e535bcdd0f7eb03
	.xword	0x7f55db0ad227a300
	.xword	0xaf5a6f99a3dbbf81
	.xword	0x094ddd9151cbe2a1
	.xword	0x041a91d2bc5992fd
	.xword	0x0ea6db4dad1ccc3c
	.xword	0x469d1620231e007d
	.xword	0x63fd6d141f34fa15
	.xword	0x0416a0ed4fd9a33a
	.xword	0xf933fcb12882d98a
	.xword	0x31c7c755ac40440b
	.xword	0x3f464e869c0793f4
	.xword	0x42cbcb1dedba9234
	.xword	0x8bcd5e5d5d527b80
	.xword	0x0384c0386763979e
	.xword	0x46075d2fdbbcd64a
	.xword	0x4042ff4ddbd12894
	.xword	0x4ae2f08867d4e7f4
	.xword	0x2459b0f66d739250
	.xword	0x7232dbe4206f7988
	.xword	0xf7247ec0a8bbb333
	.xword	0x0caccc613923c52c
	.xword	0x0a5a68a8f013eaaf
	.xword	0x1be56cf85107d763
	.xword	0xde32f99cda4da17b
	.xword	0xa171f25f62103a5f
	.xword	0xc50abccfc4ad9aa4
	.xword	0x830894caf94b5201
	.xword	0x0b84b71cee2ab786
	.xword	0x27e036dbb5bdfc04
	.xword	0x7caddfb5bcb6ba7b
	.xword	0x872178f065c04217
	.xword	0x4170e5d35311efc7
	.align 0x8000
	.data
data_start_3:

	.xword	0x739c8a44411120e0
	.xword	0x2b63a67e8c6d6f51
	.xword	0xd4c5c1e9ae219746
	.xword	0x7d905d3d327011ef
	.xword	0xff5a70ef857b6c97
	.xword	0xd914b7955f27db79
	.xword	0x8ed55b30bf057e62
	.xword	0xade0568dfe77f12a
	.xword	0x98910aa734310220
	.xword	0xbedaa44da0185782
	.xword	0x3677ffa7da0cbb44
	.xword	0xd0a509206f6a5eae
	.xword	0xfae349fec8644323
	.xword	0x4b0aff1631fc3958
	.xword	0x588c4b0f7682f5f1
	.xword	0x24682bb244f191eb
	.xword	0x3fe4990876c624d6
	.xword	0xd4cd5682b422d673
	.xword	0x360c62f5b1e5f79c
	.xword	0x2f4ca18355dbf0c9
	.xword	0x242683e8ba1e9fc4
	.xword	0x33ec28cc633b8846
	.xword	0x75f2555876c8c8eb
	.xword	0xc5c7d42f7f7899d8
	.xword	0x3b43241805f2f7e8
	.xword	0x5b12361c3311602c
	.xword	0x9e1c7bcdda7789f9
	.xword	0x2d383f74aa016b1d
	.xword	0xc1de6e4e2fb59366
	.xword	0x0fa1f28fd47f1853
	.xword	0x5f1e5b50cb7e8b17
	.xword	0x2355a8434621aeb6
	.xword	0x7b255ebec6b05c8e
	.xword	0xa8d181bad867dc96
	.xword	0x5370905b70739b1d
	.xword	0x9c11d2903fa5673a
	.xword	0xcc2e6ee767ff5a50
	.xword	0xcae4da2b35b18abd
	.xword	0xa38f9544aa2980de
	.xword	0x9797a3d8a791c6c9
	.xword	0xd3c4d492771958b1
	.xword	0x967312c3bbe1dad5
	.xword	0x9077a8af5a049b52
	.xword	0x572f209b27154d8e
	.xword	0xca7619ada9df5e82
	.xword	0x2b456d6b0c29e2df
	.xword	0xc45ec9066e982c61
	.xword	0xb08a9e77c2f71592
	.xword	0xe527cc7ce7f57bd6
	.xword	0x42daf615b2e8334c
	.xword	0xcc8500b023f82f57
	.xword	0x9774352b8e0ac370
	.xword	0x657bbab1ecb78061
	.xword	0xc329e33d1f4fbb18
	.xword	0x764c15b1836119ba
	.xword	0x522e23cea9ab32c3
	.xword	0xbb5c9a6f31432716
	.xword	0xd8151548b203f81c
	.xword	0x3375f690b947974a
	.xword	0xb90d6ebb38c3677f
	.xword	0x657abb4e2a2ab1d9
	.xword	0x8bf77eab56c6f9dd
	.xword	0xc23b5c0e264fe7d7
	.xword	0x0e694bc0dbdb4295
	.xword	0x6b8135042c0a2178
	.xword	0xb88d71d007988185
	.xword	0xd6a6493f10bce259
	.xword	0xd21fd60d87b78c22
	.xword	0x5d426b1421958ce6
	.xword	0xe0ecd93778565967
	.xword	0x5a4bec9ef1008acd
	.xword	0xf172068304a8c4bf
	.xword	0x76f6ea4d2507ed4c
	.xword	0xdfad1efba58d67fe
	.xword	0x70a7bccb0aa2af28
	.xword	0x4a82475e2f7060ed
	.xword	0xc18b9ecb2b244af4
	.xword	0x8b663bd9da88f300
	.xword	0x816f116b60a65f66
	.xword	0xc91d4d8b3632ca69
	.xword	0x5b44a786675b788f
	.xword	0x3afd6805ef4b793e
	.xword	0xed634c5db6a5d9f6
	.xword	0x11c8ab8ea8178d25
	.xword	0xdea160e8ee9a3e70
	.xword	0x0198f46eabfb503a
	.xword	0x06af0043af2ed5f3
	.xword	0x992c2e75437bf936
	.xword	0xca7f408378c2dfc8
	.xword	0x1c97fe7ee0c120e3
	.xword	0x07cc493c94979e17
	.xword	0x96529fd7197dcbae
	.xword	0xd0e87d5b73311d2d
	.xword	0x6dc33163af470632
	.xword	0xd0b0d6f485b839c8
	.xword	0x4e76394a4d2fdcf7
	.xword	0xc6888411764d4c35
	.xword	0x0daed006870ce55f
	.xword	0xa99e28a440a3793a
	.xword	0x5e87fa0f859fee08
	.xword	0x71c02fa0a63e89fc
	.xword	0xf61954bc88fbceef
	.xword	0xa9bc7518dc86c6f9
	.xword	0xfd1c6ddb5a7c5e84
	.xword	0x15d4a63f327dd540
	.xword	0x692af9abce9ee41a
	.xword	0xdb559fb118ab8901
	.xword	0xae106dbefa9542de
	.xword	0xdd70a65c06275f9d
	.xword	0x6c8fb43123f63e9d
	.xword	0x2f5646f9cdf9af7b
	.xword	0x6f8fba10e8500a84
	.xword	0xc33e14f574c04023
	.xword	0x3153a0d0f9aedeb6
	.xword	0x85e403634750a27d
	.xword	0x49ee989ce4dea73c
	.xword	0x34a600c8d2474aa5
	.xword	0xa2a043b4c42a082e
	.xword	0xc19a8d5f85eb0a90
	.xword	0x094d7d4018620972
	.xword	0x863cac75d09888d0
	.xword	0x386c079ac51521cd
	.xword	0x0dc16642a047ced2
	.xword	0xd5c3e03142a73e14
	.xword	0xc14e3de260bcd0b4
	.xword	0x3ec8806a06e07443
	.xword	0xd5e276394edcc634
	.xword	0x5a207754ee85b38b
	.xword	0xf1075111784be284
	.xword	0x6f46305f495eb517
	.xword	0x30e242a17672146a
	.xword	0xa3867b0377cc627f
	.xword	0x626a894efe85d4bf
	.xword	0xb4ddc0c2b5bad1f2
	.xword	0xd890eaacd8375abc
	.xword	0x9dc602fa728becdc
	.xword	0x34d70615a5d82f54
	.xword	0xce775703e62a18e8
	.xword	0x35d98c8372ceabed
	.xword	0xf44da95b7f3bd71d
	.xword	0x49126ceecbe4ff24
	.xword	0x925b81260c213a37
	.xword	0xe006e02f169aacec
	.xword	0x8bc5601a6a24e674
	.xword	0x36c59f354338b4d8
	.xword	0xd574682280afb9ea
	.xword	0x264b1102310c7d86
	.xword	0x184778a4e62f82f3
	.xword	0x4f3d00c84863c3bb
	.xword	0x7ec022359f99629d
	.xword	0xa167eb893918e227
	.xword	0x8c9db0b1f909605b
	.xword	0x7890d2cb661e41c9
	.xword	0xb8feb0d50fae12af
	.xword	0x064c09d762645d03
	.xword	0xe084d7ef7495b452
	.xword	0x16995a95f3d58741
	.xword	0xd1ed8663ef6221fa
	.xword	0x2fac8264b3d799e1
	.xword	0x388fd653b014f620
	.xword	0xbb8dfd9089c6e937
	.xword	0xf74417c42ce309a0
	.xword	0xbd184cd1b32d9235
	.xword	0xd2b730a42c30cf69
	.xword	0x753b99cc4abc20fa
	.xword	0xc69cd6e4ed1855c9
	.xword	0xa8823337c2c137d9
	.xword	0x67a96cf400d193b3
	.xword	0x8140c3369f0c658e
	.xword	0x0f0a298606cad639
	.xword	0xc9ba459381095fa5
	.xword	0x7c4163c4d77b505b
	.xword	0x935040da734872f1
	.xword	0x1b666943bd17a7e2
	.xword	0x80d1755cb9052aa1
	.xword	0x5d38e7b5119355fa
	.xword	0xd19384d8841a2317
	.xword	0x6bb55750e7b6799d
	.xword	0x8c21cba116f85941
	.xword	0xce8d547fb0c038f1
	.xword	0xb1722eb3448f053e
	.xword	0xb2b9f59b798cf81c
	.xword	0x91fe658b4080eaa3
	.xword	0xcea73f957aec6c61
	.xword	0x0fcb4d3ca6ce7b34
	.xword	0x8896d38b9909dd24
	.xword	0x37de87e4c3c5f305
	.xword	0x5011dd3b5393ff84
	.xword	0x0dafe2d6512fbd18
	.xword	0xdbcb2fb4600e9813
	.xword	0x165977facfff6091
	.xword	0x69ee778e9f418e79
	.xword	0x886588701f368dff
	.xword	0x432c64a241365317
	.xword	0xed8957a1ae54099c
	.xword	0x4a516b254719ee83
	.xword	0x3fe62016fdd73dee
	.xword	0x536750b651c6c559
	.xword	0x7909729535c9c3d1
	.xword	0x0c2147d0fea50965
	.xword	0x102e8dbe7e92f688
	.xword	0xada85ac05dfc746f
	.xword	0xf2de7e0cfca2256c
	.xword	0x5dfcbbd71dbb9965
	.xword	0xdf97367161239d97
	.xword	0x0a881ad035fb658b
	.xword	0xde1791bc52bd0727
	.xword	0x0765f86a6350ed8e
	.xword	0x83dd53068de7ccea
	.xword	0xbe4c0020f3a89a35
	.xword	0x65871af652376826
	.xword	0xf47fdcafd5831198
	.xword	0x67e7c6567bff3ba2
	.xword	0xb17633553e267be9
	.xword	0xea99424066d6248a
	.xword	0x1f984b0c7bb384e9
	.xword	0x9744760a7ca846b4
	.xword	0xd052c09a8b071dee
	.xword	0xd1f1107f833f9e05
	.xword	0xb89de752e9731359
	.xword	0x4efbdd4dbf8448c3
	.xword	0x70847baf157d7d97
	.xword	0x13a94140158e36ed
	.xword	0x63ea5e055325e4c6
	.xword	0xe57812caf9eb60a5
	.xword	0x9b3216eebe39c29c
	.xword	0x732f21cf41b7b10f
	.xword	0xc04ab97d7a4947be
	.xword	0x276cd151a310e700
	.xword	0x1eb55b8de395d3b6
	.xword	0x0e0beb7d2c7e1c24
	.xword	0x5d84736a5db0725b
	.xword	0x88662e1b819dc228
	.xword	0x86e8e270f4f2a557
	.xword	0xf8408c33d97a8b9c
	.xword	0x11d86610e1b0feef
	.xword	0x87d07decee349d62
	.xword	0x834b231946b1c47d
	.xword	0xca532b8e32c7d83a
	.xword	0x7525e542d86e1b15
	.xword	0xcd17c70efc1e0d50
	.xword	0x30134fbf56e0bb46
	.xword	0x4057f6db504153f4
	.xword	0x33424fb4147154d0
	.xword	0x56f2c4ef1cf979a1
	.xword	0x73162e4065e8b4db
	.xword	0x3ae7abff7d455f1a
	.xword	0x9a038f3e9939c15e
	.xword	0xdfa73dec5f89091b
	.xword	0x25276e735e536cc4
	.xword	0x4ca4058bcba4619b
	.xword	0x5a8c99ca61599e6a
	.xword	0xf9d7a2ade9de9d36
	.xword	0x902c89819525fbb2
	.xword	0xad5fa43379ac0f8e
	.xword	0x3fe3d9481ee18214
	.align 0x10000
	.data
data_start_4:

	.xword	0x280ae3566edb676b
	.xword	0xb18ff702761af79c
	.xword	0x0fcd347a5dd06d8d
	.xword	0x0007847d5f2c24e6
	.xword	0x7d265d2c0dfd20a8
	.xword	0x884b34b89040cd6c
	.xword	0x4982f539959d24d1
	.xword	0x0133552c379e3c4b
	.xword	0x011af27991dafa45
	.xword	0x6dfd9db1ecaca419
	.xword	0x2ef2245fec3fd971
	.xword	0x3881ee8314d411d1
	.xword	0xa48ee1e96e4c3d90
	.xword	0x633cb5336d09ff2f
	.xword	0x97a3c12bb7bb9ede
	.xword	0x221226662b8d6a44
	.xword	0x87c5dea7c7b6ba03
	.xword	0xd195abc4d7ed3782
	.xword	0xb8f76d15256b74c8
	.xword	0x4bd5f2bd0b5109a7
	.xword	0xd58e91b09053d12b
	.xword	0x765e772b655854e7
	.xword	0xb8d327b345dbc2b8
	.xword	0x7376785dcf42960f
	.xword	0x6a3242ec655a92f7
	.xword	0xab88d9d63df58e59
	.xword	0x20050d81d22a0179
	.xword	0x867f8cec1b355de6
	.xword	0x20d3efc6332d63f7
	.xword	0x0cd7a00bb1521e93
	.xword	0x4e370e3f598c93e3
	.xword	0xabb5f8e639198d69
	.xword	0x4e685d3c7500293a
	.xword	0x9d2e9de7c3b002e5
	.xword	0xa815c4ec2d631c06
	.xword	0x2560ba3204ff1c11
	.xword	0x6e46432e257e1386
	.xword	0x964d7a8f7fedc93b
	.xword	0xf6a85c7a076ffb1a
	.xword	0x999b957f9f14fb75
	.xword	0x4f3eed76573e4e0e
	.xword	0xfb4369ca58e0711d
	.xword	0x0d005433359dc7ad
	.xword	0x29f2b7f71abde5c6
	.xword	0x6e5682f47e1fb2fe
	.xword	0x21431f543d589d75
	.xword	0x35fa1d2d083c39b8
	.xword	0x50179aba45e480f9
	.xword	0x3dd40bd516d70ec6
	.xword	0xa8cc37b76614951e
	.xword	0x86f3be869a3c1f06
	.xword	0x9426154a39ec068c
	.xword	0xbe4099dcc5b39f40
	.xword	0x065bcfd7b61f199d
	.xword	0xf12f235814a6d848
	.xword	0x74cc95bd5d373a1e
	.xword	0x243d23bf26410c9b
	.xword	0x02e6038856880745
	.xword	0xd4380d9cbd02440c
	.xword	0x50174212ae955365
	.xword	0x6bca13fce3544bc6
	.xword	0x170964f9eefac32d
	.xword	0x75285c07c88b9f41
	.xword	0x13bd230afeb8d663
	.xword	0x86ff65eb3f894ea0
	.xword	0x042c86ba1170a471
	.xword	0x282b819de51d7285
	.xword	0x6c9b960c5ba761d8
	.xword	0x2d93e5a4e5a5a720
	.xword	0xd546d3a4a8a978aa
	.xword	0x0f2af0cfa523c908
	.xword	0xa2820c1bec9fce52
	.xword	0xaee4a51c3ff86594
	.xword	0x086096d36140a18f
	.xword	0xbba9562fba1cfa2b
	.xword	0xd1aa39ac640e205d
	.xword	0x8b8769be44b9e607
	.xword	0x6a212760d2032f0f
	.xword	0x2d0cfc8af597d802
	.xword	0xf504aa19d2b5a53b
	.xword	0x261a2abc0eaa95f2
	.xword	0x8230d29ce772ea24
	.xword	0x0e0a3c1845284a5f
	.xword	0x3cb6b9ce90c72f02
	.xword	0xb7942784dbac261e
	.xword	0xad4d5ac735467a1a
	.xword	0xaab921a7ca414b8a
	.xword	0x8a4a92e772d671c9
	.xword	0xdd62215d014f554d
	.xword	0x4db166cf0f4c5f08
	.xword	0x47d3344428744312
	.xword	0x24f3ac516ebcc3f6
	.xword	0x311d20cce6be3157
	.xword	0xec34a08ce1d1aa4d
	.xword	0x64ce5318cf08ebd5
	.xword	0xca44f8576c9478ca
	.xword	0x5ae163ff6ace5401
	.xword	0x4cda8b9047e1298e
	.xword	0x37cdc552349ba0db
	.xword	0xcb1d157e666b61f3
	.xword	0xfc725a1f78abcc9a
	.xword	0x251cd34b41d487f2
	.xword	0xe271cfb906e98a7d
	.xword	0xd1e6a86e2161f70e
	.xword	0x6c3976394a22cb97
	.xword	0x565c3ad1327edd9f
	.xword	0x2e1a3b18c11dbc6f
	.xword	0xda0c1c0c225ce8a9
	.xword	0x716daeb9ed71de23
	.xword	0x32113ded7e30c95b
	.xword	0x0320210cab3e5797
	.xword	0xf455eceab3dc11d2
	.xword	0x4691283d8074bd2b
	.xword	0x8168be3ba0bd280d
	.xword	0x9cfc757ebbcf70ea
	.xword	0xe4f9f063d081476b
	.xword	0xb61f017984023eec
	.xword	0xc936c66ddf30ba66
	.xword	0xa1d8d7c63af767f8
	.xword	0x2c14982a47fbaa5e
	.xword	0x1024e2bfa1d210e7
	.xword	0x7463f97254a9455d
	.xword	0x14fa8989a741b42d
	.xword	0x20d2c1f91c01c4d4
	.xword	0xab9ab1be86d6c411
	.xword	0xaed80a91046e7c23
	.xword	0xa3e4d2be06d099d7
	.xword	0x622376e9dbd10638
	.xword	0xa0f922faea22154f
	.xword	0xcd393411cc8e371c
	.xword	0x844e6fbc1b44e33b
	.xword	0xc2eff9384ea1e2b0
	.xword	0xb6dd74804688342c
	.xword	0xbcb13471bd122399
	.xword	0x287d632ae3ae9ba0
	.xword	0xfd2be90badf6122f
	.xword	0x49b072b3ea529480
	.xword	0xe4d25636ebf0eccf
	.xword	0x114184885050a4ff
	.xword	0xe430f9df839b7cc6
	.xword	0x9eb6723e24c2a871
	.xword	0xc46265c69dca7c8f
	.xword	0x5447381af5667053
	.xword	0x2f20903be35200ea
	.xword	0xc7f133a4b9d0774e
	.xword	0xd0d43050643d2f34
	.xword	0x20a8d29e82900a15
	.xword	0x8fe7ef6ff03f8e38
	.xword	0xefcf1f212546d1df
	.xword	0x592eae2237302030
	.xword	0x03ae75fbb94d804c
	.xword	0x4802e13239e6f397
	.xword	0x2ab0c014bdd00941
	.xword	0x9fc52b5484f04482
	.xword	0x0993bc0b3d02bc96
	.xword	0xcef2acd2226dc2b4
	.xword	0x6e0d109c2600f8b4
	.xword	0xa430b40bc0337a8f
	.xword	0x5ab0b411bb4dbc00
	.xword	0x734e634e14a950aa
	.xword	0x0b2fdae25de09f11
	.xword	0xa9a1a9e3f09b3d66
	.xword	0x6da549611659c3e1
	.xword	0x861392d7b1719cad
	.xword	0x7e4811dbdfb39a8e
	.xword	0x4044b7255d00f9f2
	.xword	0x3f6e9849fbfeed40
	.xword	0x3c88bb514cb0c78f
	.xword	0x680cd52f3ec30814
	.xword	0x1e5d0b0c25e60502
	.xword	0x46184a9166a65c8a
	.xword	0x8d04988e89086993
	.xword	0x327cf4f82512ef0f
	.xword	0x2a1e394823a16d06
	.xword	0x3d458b596ae3ff9e
	.xword	0x0cf5f2e88dcd3d43
	.xword	0x42137d3f300e6324
	.xword	0x29eb6ae2a9afb2af
	.xword	0x413e34a1ba80efde
	.xword	0xbf98775bac8431b0
	.xword	0xcd7778280af18153
	.xword	0x3fa3075a4598443b
	.xword	0x3eaa79d8544db267
	.xword	0xd84ce03f73d28542
	.xword	0xa5dc46ff4214e7e9
	.xword	0xcfbe04495335adb7
	.xword	0x3663276da80fe850
	.xword	0xed96e23d98c6541f
	.xword	0xfb50bbc5b6380445
	.xword	0xf6b5554944994f25
	.xword	0x7c4d1ccfa9b025ed
	.xword	0xa393e9cbadb0e6bd
	.xword	0xf8768e7a10ac47fc
	.xword	0x54e608ca2dd8fb71
	.xword	0x95934d9f86446eef
	.xword	0x6d39e97a9b6e4404
	.xword	0x979953484541e7d8
	.xword	0x572b7c7e30284298
	.xword	0x56ff2d426df4d6a3
	.xword	0x05631d3d542ee36b
	.xword	0x4fd25632e312bca0
	.xword	0xb68551e64561d80c
	.xword	0x4c16896818daca84
	.xword	0xa909b5cb50707c42
	.xword	0x4b5a38b1c6935bc9
	.xword	0x96b45672ae740f52
	.xword	0x5e88a1a27d31c51c
	.xword	0x3151308155d788c8
	.xword	0x91ee5e4399b32e7a
	.xword	0x220c745c4c97afc4
	.xword	0x9017f327a9d283f6
	.xword	0x90baff1516bc606e
	.xword	0xef2df3e410ad7e02
	.xword	0x644c0144b060f94c
	.xword	0x8d0624109e9b980f
	.xword	0xd9e354b9fe3b48dd
	.xword	0x539ee08e454e0913
	.xword	0x02b8a0585b8e984b
	.xword	0xa14b4b04ed27f2b2
	.xword	0xe1f6253d000b8436
	.xword	0x1b989289a1a9f509
	.xword	0x8e761855b4c7bf1b
	.xword	0x91b41aef06bf3469
	.xword	0x3317ceafc4c8984a
	.xword	0x4bdf4418a6c383ad
	.xword	0xd656ef1a78d8b382
	.xword	0x210b5f9249d9c2fd
	.xword	0x6f1e9b25c17957b9
	.xword	0xb90e6a6680244687
	.xword	0xf5bedf4c2b510fe9
	.xword	0xbca0114c3c22f0aa
	.xword	0xf2cd206ec5491c98
	.xword	0xcf169443c42a42cc
	.xword	0xb05553d2a8ba5c55
	.xword	0x0d89d473ba363e69
	.xword	0x0fc5e441cbf9d07b
	.xword	0x011dbec2e58e29cf
	.xword	0xf193cb1c7f524947
	.xword	0xe5f6adbaec5572a8
	.xword	0xf96f0daa62e9764d
	.xword	0x0348c56887586b8c
	.xword	0x97db4087b92be042
	.xword	0x3e59b46f6601b861
	.xword	0x17db2afaa93304cd
	.xword	0x64ff3a60763989f1
	.xword	0x8d5b572465ef5f21
	.xword	0xbeb9f6111996672b
	.xword	0x5d3a04a39934fa67
	.xword	0x1851e212f2affaec
	.xword	0xfa4f1544aecd5493
	.xword	0x7c765feee9384ee2
	.xword	0x85a52be4e067b156
	.xword	0xa7dbb66a72fe226d
	.xword	0x5c692b5e1aebc69a
	.xword	0x210b97c612ee2517
	.xword	0xa612c8684d68ad73
	.align 0x20000
	.data
data_start_5:

	.xword	0x624bcbf47e42ccd7
	.xword	0x54d4bcc5fef1bcb5
	.xword	0xbafc9f89942e1e20
	.xword	0x6096d30320666e50
	.xword	0x7723b785a75be5cd
	.xword	0xcbed4626f5d488aa
	.xword	0x3a7ce2922b5d10f3
	.xword	0x40478352e06529d7
	.xword	0xd05b7df801535db6
	.xword	0xe7290c389fef13f7
	.xword	0xf087d39ec8ee419a
	.xword	0x61b434620a1993bb
	.xword	0xcf8e1f0392ca833f
	.xword	0x567be166c094d905
	.xword	0xd8fc17f78043d0ca
	.xword	0xb6764cfd02c467ac
	.xword	0x3aef5627178ad001
	.xword	0xcb03b69a7038129b
	.xword	0x0b616f7212527815
	.xword	0x80639164e04d50b0
	.xword	0x64193f8e7f087a0b
	.xword	0xec05837065e077a8
	.xword	0x058d4c378a2d1204
	.xword	0xd38383963a66cc9f
	.xword	0x6d35a9fa95f997d1
	.xword	0xed029f8081c41355
	.xword	0xefc0770532322cdb
	.xword	0x06bc5e9a0ee0e957
	.xword	0x0e7648c5bc51f672
	.xword	0x1aa555598fb45442
	.xword	0x75129ea7062efda3
	.xword	0xaf3c0c42e7abafb7
	.xword	0xe610988146592005
	.xword	0xdac5a23ce3cd3105
	.xword	0x43125f661bcd0bcd
	.xword	0x2abeba3425fb4b84
	.xword	0x311e14ac9a2b0ac8
	.xword	0xc0522eddba39d6b6
	.xword	0xf3af4294b411a253
	.xword	0x3993538eb9233657
	.xword	0x4d4f5f6c20242440
	.xword	0xc78224444c30603d
	.xword	0x3f275516df7af8e9
	.xword	0x6e86e1eebc1feca3
	.xword	0x054cbdea6a28fd8b
	.xword	0xd11362b1f500092e
	.xword	0xb0df72df0bc5481f
	.xword	0xf266ba272aeacfef
	.xword	0xf258d53023047307
	.xword	0x0439b99720f0b365
	.xword	0x33fe8a1d89f9dfd7
	.xword	0xeefd3ed38fe3274a
	.xword	0xcff0d90b55c8ac7f
	.xword	0x2e5b3a7364564be1
	.xword	0x7691e3095a60d7df
	.xword	0x38fab9572d0b65ea
	.xword	0x0a0860d4961725a9
	.xword	0xb0543e885b0d4fe8
	.xword	0x58c0d8e8b3879191
	.xword	0xd243b9cd36a0f1a8
	.xword	0x0336fb8959d7cba9
	.xword	0x8023f96dead6e951
	.xword	0xb4c2267b0ae6e6bc
	.xword	0xe8852a302b8fc91a
	.xword	0x9306dd4a1ca4be5b
	.xword	0xacc8f4ade3b33b0a
	.xword	0xd9234bdad628d3d0
	.xword	0xf05cd81ca1d98870
	.xword	0x6b47690addb9317e
	.xword	0x2b12a872499c4f24
	.xword	0x345fd084f90857b9
	.xword	0xa8b314898c8f3b5c
	.xword	0x4aca659e1ff3a4e4
	.xword	0x771a4c923a4960b1
	.xword	0x670fdfa4eec5820b
	.xword	0xb9d059fb59c0d1e4
	.xword	0xd490f0f8b94aed92
	.xword	0xd1e846bff51cdcdf
	.xword	0xa34f512692f279d3
	.xword	0x585d06c8ee13d03c
	.xword	0xc7bf5f0c06663708
	.xword	0xa80915561aaa32de
	.xword	0xe0730e13bf9a8d41
	.xword	0x3f4669be9c3b2102
	.xword	0x1f9a3ce0b289d3ac
	.xword	0x0856fee4cfd757b6
	.xword	0x9b26c3430766a5fd
	.xword	0x7ca3ec620fb81e24
	.xword	0x40bec983686beb57
	.xword	0x700b5fdbb4e9ca26
	.xword	0x77cf9d24617bd6d0
	.xword	0x646d68e04e96396f
	.xword	0x883cb9e6382367d9
	.xword	0xfc6b548c617112bb
	.xword	0xe60431065ba800ee
	.xword	0x7f792589fd51245e
	.xword	0x0fd063ee0cfb636f
	.xword	0xfbac305ff1d28d68
	.xword	0x01f03e0cd0222b8d
	.xword	0xfd7d6eeb0634e57c
	.xword	0xee16026d0ff6af1b
	.xword	0xf48ed861d8960403
	.xword	0x8493622c62a30feb
	.xword	0xccff1e2df202d90a
	.xword	0x41a0ce311327bd82
	.xword	0xf6bd0d58b3d1ff71
	.xword	0x589441fbd33fe0ea
	.xword	0xc80aa4dbd802051a
	.xword	0xc7d5eb9bd5e524d8
	.xword	0xbca5fd4856af7ddc
	.xword	0x4c6bae07a8de69db
	.xword	0x6bb161869a392132
	.xword	0xd450a4839f2dd728
	.xword	0x1abce7f9681284b0
	.xword	0x8da349aea480571d
	.xword	0x5d712a4f58e4786f
	.xword	0x4ba24b48bdc87eab
	.xword	0x3c864b916a6b13da
	.xword	0xfcf07877eec4ae1c
	.xword	0x07e4688517f0f65b
	.xword	0xdcbc268c5261db6d
	.xword	0xde3c7203003327ec
	.xword	0xa2aa19dbfd782056
	.xword	0xe9cdbe621b022c87
	.xword	0x1b4ac19ede670a12
	.xword	0x27500cc9684b87ae
	.xword	0x4b4496589e01c397
	.xword	0x710f2e4c604c727e
	.xword	0xd3e346a5a596d3f1
	.xword	0x18e2507b918ee530
	.xword	0x6e5d6b0eb06b24c5
	.xword	0xa42c6ea3d42c0541
	.xword	0xf3b7898cab215d57
	.xword	0xb8e5784f44cd85d5
	.xword	0x76315877ccae1e80
	.xword	0xca2e67538901e174
	.xword	0x3585b0b3709705e7
	.xword	0x0a7ee08bbcd084f8
	.xword	0xbfb020f0a881db60
	.xword	0x9405de10bf5bd753
	.xword	0xcbaf57eed2824f2b
	.xword	0xf529d0949621352e
	.xword	0xfdf40f9dfdae8b87
	.xword	0xd89b91c7d2563381
	.xword	0xe1ca3bf4f978d154
	.xword	0x75dcdd0f89079ea0
	.xword	0x0d256625eda422e4
	.xword	0xb73428f0c6cd58ef
	.xword	0xacb1bd84fbdf349c
	.xword	0xabec841df82c0204
	.xword	0x2223d8ba03c0ba9b
	.xword	0xc4b0e8ea0af42099
	.xword	0xa6cd484a2269da52
	.xword	0x602ecf70f471995a
	.xword	0x5f3198f4016cb3fc
	.xword	0x381654f93e547f20
	.xword	0xaf4d0cac4310794f
	.xword	0xc3d37eac250e180b
	.xword	0xb5901411da8145fb
	.xword	0x1e5f9fe4e8aba5c7
	.xword	0xf1b4bee6c352601d
	.xword	0x515cc1ac3a4c2b6c
	.xword	0x0c30973875d4d5fc
	.xword	0xd2f026252d257bdb
	.xword	0xb8522efb7649a468
	.xword	0x6d3e126891605c43
	.xword	0xf77f26559e94c95b
	.xword	0xc7e496d81bb7bfb6
	.xword	0xad8f6371057cb0bc
	.xword	0x0e966304445bebad
	.xword	0x4d37213d527b6469
	.xword	0xbf53e6d98eded6f5
	.xword	0x394505d69a9943cb
	.xword	0xa0b0b73608494095
	.xword	0xcd59576de9251f80
	.xword	0x659f696b33289996
	.xword	0x15d84bcd884fd5f5
	.xword	0x547eac8e6e303526
	.xword	0x452156e628630a6a
	.xword	0xc80e48a8a6c5a2cc
	.xword	0xeec6b40093372bf7
	.xword	0xce41af91f91f1c38
	.xword	0x1c43561812106790
	.xword	0x359e55adfffdc39f
	.xword	0x2eda85c851e934f7
	.xword	0x36cc17c73c29cead
	.xword	0x0206d579a657a8a3
	.xword	0xeb0c573a18259e68
	.xword	0x51dc8450256df933
	.xword	0x9177aa3c90b9fd65
	.xword	0xe4f3b37fc6a34091
	.xword	0xe758732e1b01e23a
	.xword	0x1ebd031729293fd9
	.xword	0xdfe58c0253151229
	.xword	0xcdd03635cc72692f
	.xword	0xe89f182de97a49ed
	.xword	0xd6613d436af39aea
	.xword	0x05ab3a73c64f92bd
	.xword	0x1d2f3ae62220c611
	.xword	0xc69ce490daf7df30
	.xword	0xaa6bf281c424a7f1
	.xword	0xfeb293b6394a26d8
	.xword	0x36a36cdec1fd2b16
	.xword	0x79c232a323f43e8d
	.xword	0xe933b700bcef2e47
	.xword	0xba8036b9ba36ad48
	.xword	0xde37b2b0e4f55368
	.xword	0x9801b98364b41139
	.xword	0x8d188babac8e99cb
	.xword	0x5baa4af8b94b0204
	.xword	0xdd0ec6083bfcc3bd
	.xword	0x070d4667d6e2f2ab
	.xword	0xed08b5665546e28d
	.xword	0x90d42506f5feef3a
	.xword	0x4c065881111841a4
	.xword	0xd70f509ef0d12af8
	.xword	0x3768590ca958558b
	.xword	0x93c4f66c96d0bda2
	.xword	0xb0373d6b8c99b2bb
	.xword	0x729f373c79cc2a98
	.xword	0xe2e42a42c7d0f443
	.xword	0x62ce3c84d051d71e
	.xword	0xa0be1c45b529de24
	.xword	0x0b8eeaf001164164
	.xword	0xefa36930605dc3ce
	.xword	0x55a11cf2b02f7ac4
	.xword	0x2e436662f65d265a
	.xword	0xe671febe8034cac6
	.xword	0xaa2aca5b5a9265fd
	.xword	0x46dea9ffd066aaf6
	.xword	0x626a2f701d0081ef
	.xword	0xcd3f861676b12154
	.xword	0x80eb2d9b51983ce2
	.xword	0x7dd4fcbe9cffe073
	.xword	0x2a303d9e7b59ae8a
	.xword	0xb26c0adf7bb62005
	.xword	0x612ad58e811f064e
	.xword	0x88b368fa3c705927
	.xword	0xa922602fe0f7af9d
	.xword	0x86a1c980d4b0485c
	.xword	0x63d27d1ab39f83f6
	.xword	0x325bb31066c3eb92
	.xword	0xac04893bdf98e0c1
	.xword	0xdb120a57692d554e
	.xword	0x1273551a68805b6e
	.xword	0xd8e0bf47bf7c0d85
	.xword	0xb384fc2e77f58996
	.xword	0xd04ae024346bf2e3
	.xword	0x1eda78e7a7120e63
	.xword	0x637d777cb53f3e47
	.xword	0x4e748944c338371b
	.xword	0x356515084a8d7188
	.xword	0xdb6cf12ded80a7bf
	.xword	0xee0af05565f1ea3e
	.xword	0x8160674d4a938408
	.xword	0x5cea2f38c9b49f9f
	.align 0x40000
	.data
data_start_6:

	.xword	0xefb12105fb50dae6
	.xword	0x8bc30c0c7a882b02
	.xword	0xb092531ee23de465
	.xword	0xfb97343a57b422a6
	.xword	0xcac4f20a44b0b41e
	.xword	0x656b07bdb00ded35
	.xword	0xdac5f75da43f3d0d
	.xword	0xb7602dff9cf6069a
	.xword	0x8fd51bb4550b3c3b
	.xword	0xa8cbe78237e01fca
	.xword	0x03e389fe6da5df5e
	.xword	0x3be6b89de230049e
	.xword	0x20014ddca2f21ca0
	.xword	0xbf81555323adaee3
	.xword	0xa9d1953c38b0bb81
	.xword	0xfe843a41d2fcffd9
	.xword	0x736f521013592f92
	.xword	0x5abf65c639083eb8
	.xword	0x8f010d6b19a2787a
	.xword	0x5b491ba317393337
	.xword	0xba59b97bf7dde2e6
	.xword	0xabf16d8309e77ae7
	.xword	0x47f15c9bd56175b7
	.xword	0x5aef0e823b00e7b5
	.xword	0xc4091bdb059b340f
	.xword	0x537cfb33c9dca474
	.xword	0x1f18a819505fc639
	.xword	0xdae1e37963f6a431
	.xword	0x19ef53fe96371d28
	.xword	0x008fcfef9e768d8b
	.xword	0x3b336247ffbb1ab5
	.xword	0xc2606dfa32367d95
	.xword	0xcd988f05df900e3e
	.xword	0xd6fbbc0eeabe719a
	.xword	0xf338561e13dd253b
	.xword	0xff5af2fceafbf111
	.xword	0xea950fbcb57d5077
	.xword	0x3673acc56ea97d10
	.xword	0xde26e32e3616a7d3
	.xword	0xcc4e160dfb13aecb
	.xword	0xe6e4d32e56cb6906
	.xword	0x6ffc04b7af6a641a
	.xword	0x5adaa0952cd847c3
	.xword	0xf55a28406676f08c
	.xword	0x5476f3f3ca7ad34f
	.xword	0x1636b0531a3a576f
	.xword	0x008731ad06af2749
	.xword	0x8835627cbe584849
	.xword	0x242ae3898ea84953
	.xword	0x4cfc55fcb111e41b
	.xword	0xf04a6dac5c73d220
	.xword	0x96ce4999d397eb49
	.xword	0x41a92ca9422bb3aa
	.xword	0x8217b4011a5d68cb
	.xword	0xb3a220d530d2e669
	.xword	0x8590d43e7735c1ca
	.xword	0x9af97d9f10d353c1
	.xword	0x32848c375842b561
	.xword	0xa1b31d6cab2a5c17
	.xword	0x8cdaf178c4d3281d
	.xword	0x0b6df9e1025c8f01
	.xword	0x3ccd377a32d59750
	.xword	0xaecb55466ab74406
	.xword	0xaf684e70bd79aeba
	.xword	0xfaac91a4e951c63d
	.xword	0x85b32a3b63801e84
	.xword	0xaf8877910a580875
	.xword	0x0f53667059d3280f
	.xword	0x776fe26764d64c1f
	.xword	0xb8cc0bcb0ae7d8e2
	.xword	0x7f8b8d0aee4cee30
	.xword	0x611e2c239ed9c500
	.xword	0xfa229fd7cb1fdab9
	.xword	0x5c662107b37bd5a8
	.xword	0x23a5dfcac549af0a
	.xword	0x42fc75fd1a881efe
	.xword	0x6a6f492802ae89b7
	.xword	0xa79038da410cc3c4
	.xword	0xa16dd05bdc688a47
	.xword	0xd4b4d9026d5fa0ef
	.xword	0xa44c4ac37908c47d
	.xword	0x6d9ca1731ccbab64
	.xword	0x3dba9ff7911087f6
	.xword	0xc8a6fd9e37fcee12
	.xword	0x20b9fa94381de19c
	.xword	0x03a8376d48e182b6
	.xword	0x9d9b650a7049874f
	.xword	0x3bbd2b005517523b
	.xword	0xfe04eaf87b418852
	.xword	0x6fb75fb4d8d1129f
	.xword	0xc66a010bb92f403a
	.xword	0x778f2cff559b48dd
	.xword	0x36411b76aa88c52e
	.xword	0x8da62cd2efdc2f1e
	.xword	0x722d6b9c31847bfc
	.xword	0x304a076e6102b2a2
	.xword	0x167f50aaf1ef8a54
	.xword	0x687bf7b9ee54f54d
	.xword	0xa75f8c4fa2b65ded
	.xword	0x87eb4b783580a1df
	.xword	0xc8166e841e24cca1
	.xword	0xb5b253e4118f408f
	.xword	0xd67f6cf153b21731
	.xword	0x5b1638984aa1dece
	.xword	0x3a1282d129a9fc45
	.xword	0xceeb13a31dc5770d
	.xword	0xad7cbff47cc3a060
	.xword	0x02ab1ba137c507e5
	.xword	0xaa3317389b779733
	.xword	0x81a2ad229ce86052
	.xword	0x6447e411dd781596
	.xword	0x9a5bd2c8c2847f0f
	.xword	0x708cd4469efa811f
	.xword	0x0e78c321c9f46735
	.xword	0x3d9c3783ccf580b0
	.xword	0x1338864086d3abe0
	.xword	0x4790819e42c7997f
	.xword	0xc487966d248c15ec
	.xword	0xfc9714ab73c19607
	.xword	0xcf26ec728547b5fa
	.xword	0x4d3170015586bee1
	.xword	0xdca2bab65acd6fef
	.xword	0x65747503659f83ce
	.xword	0x9ae0476d6b74775c
	.xword	0xe71242fc8f97f7f7
	.xword	0x5149fddbeab38d52
	.xword	0x3e59a9f8af9eb6d8
	.xword	0xd42a69030fdaed55
	.xword	0xb0bd74be428e0e53
	.xword	0xb66e237a9da7d40f
	.xword	0xabe783f658f7ad34
	.xword	0x7cdc414f84354cf3
	.xword	0x057eaf1f4152db47
	.xword	0x1d5957820b041e4d
	.xword	0x0fdc071d5ec80285
	.xword	0xbca9b056a07e5891
	.xword	0xe55bc30b90e5783b
	.xword	0xd53f8c2aabd06730
	.xword	0x7c34e14596890d4a
	.xword	0x75fd193dce29d3e0
	.xword	0xe361fc675a4890ca
	.xword	0x55727b036f626ebb
	.xword	0x5c57d15255df92c8
	.xword	0x62b959a101b9660e
	.xword	0x12ae22dc00071bf0
	.xword	0xcca5677e9a49eccf
	.xword	0x898f28f3fab19737
	.xword	0x890baf70c77febf1
	.xword	0x8d0a1b0ae3e1924d
	.xword	0x092073f926ff573f
	.xword	0xe7b451362868c309
	.xword	0x9168ed934003d890
	.xword	0x8e71bd6987a06d68
	.xword	0xf8ecb45e363beb38
	.xword	0xc244e153f3124a0c
	.xword	0xb2fc1c3a1de0d4f4
	.xword	0x111ba52760b49f2e
	.xword	0xde73a1b34a36a35a
	.xword	0xded7c894f4ccf701
	.xword	0xb963953122bbcfff
	.xword	0xbf1e199e28ce8c1f
	.xword	0xb198fcb2e0424e83
	.xword	0x8b7cd9cc79cff667
	.xword	0xf5376907ac9ec2d6
	.xword	0x1dc5a4a4dd34d3be
	.xword	0xdfc7661fee2c2a78
	.xword	0xd4367ad5c61bdeeb
	.xword	0x20063151376712da
	.xword	0x64d36c97dc8ce688
	.xword	0x463fd0e75321acc4
	.xword	0x576de69b4625c30a
	.xword	0x7dc421713856b866
	.xword	0x444fbb9e127941a2
	.xword	0xf6306327421a901e
	.xword	0xbb01d21c954a1856
	.xword	0x6d7032d8fe337c07
	.xword	0x729d24526ffea448
	.xword	0x9d5fe557246ee5f1
	.xword	0x411c3fd51f861193
	.xword	0x9efb4c5b997019ff
	.xword	0x6e27a528ebbbd038
	.xword	0x32b24fe4c0342eb6
	.xword	0x90264701c12a5f5d
	.xword	0xc77c04995be9e5c9
	.xword	0x8c55783aae5327f6
	.xword	0xe506304faa6dc61a
	.xword	0x0eb7806674e2638e
	.xword	0x65ef52a6df6261ce
	.xword	0x3153640b61fe383d
	.xword	0x806eb29d1d587183
	.xword	0x5f730b7876659b61
	.xword	0xdd6bebe5fb63bd0a
	.xword	0x298190f6683d8f94
	.xword	0x68e51df8e1935b5e
	.xword	0x91431a4ffedf8835
	.xword	0x832f24416dff63e7
	.xword	0x35945ac5dd570c7d
	.xword	0xad448afeb7d0bcc8
	.xword	0xa393ee8f99d7201b
	.xword	0x6651e87a7e8bf9ee
	.xword	0x34f9f747ba72e1af
	.xword	0xad800b4e670f6fb1
	.xword	0x52acad632e300f86
	.xword	0xb7155447233a5373
	.xword	0x1c2ff3f0cc390d31
	.xword	0x4ad6ebb17c1759f6
	.xword	0x57eb8b3f88495826
	.xword	0x72f4f129e6e03169
	.xword	0x96e7edc78192af4f
	.xword	0x0edb5a7df685a99a
	.xword	0x5dbef4828601a336
	.xword	0xd3e1e804f37f4534
	.xword	0xd90728cab848891a
	.xword	0xd892d4599696ace0
	.xword	0x48177ed00a036521
	.xword	0xcc8cd996513cdd10
	.xword	0xf28d228affccaf82
	.xword	0x38ae56544facbe9d
	.xword	0xf5fae76735bf21e7
	.xword	0x38ae2b60ff7a618a
	.xword	0xefd6ecb97b04df09
	.xword	0xad5bc2133ba71f8f
	.xword	0x2e53bb8116a0c227
	.xword	0xa66cfcbd32466a8b
	.xword	0x7fe25cce16d57749
	.xword	0xd2204f212c341022
	.xword	0x69f9599cce01a524
	.xword	0xf7ded761e03c0cd2
	.xword	0x22f1fbc5c0b6efc8
	.xword	0xb564b003d4bc1174
	.xword	0x4c35e3171668949b
	.xword	0xdcd31d7fd9cfdb51
	.xword	0x01922ac5e58ec169
	.xword	0x5f1a19c955b39d2d
	.xword	0xe42482b73d1eea87
	.xword	0x56ca496e8cd36ff1
	.xword	0x5a6350661423a31c
	.xword	0x4ae095f4a1ead31a
	.xword	0x27ea00a1cf18811f
	.xword	0x694977badfc69680
	.xword	0x152507acfcd5e695
	.xword	0xd94feafed3112d85
	.xword	0xb3a08c9c0a29f311
	.xword	0x308661c046d0a3fd
	.xword	0x04afa5365eb420dc
	.xword	0x3f04650dd2575f59
	.xword	0x1b10a1f04ad9d85d
	.xword	0x7e544a256261e92a
	.xword	0x7a9ef2e14e5fe4f6
	.xword	0x2467f38f4b86c3ec
	.xword	0x1446e03fa969948b
	.xword	0xd7f0d1102011fc8f
	.xword	0xbff23307249a2321
	.xword	0x40da59c81cbfdb0e
	.xword	0xb06eac038ae67f91
	.xword	0x30d149e5615b0113
	.align 0x80000
	.data
data_start_7:

	.xword	0xeeefc99ef1cf4f87
	.xword	0xcb1de41740a7346a
	.xword	0x73edcd289e592263
	.xword	0x71c867f3ab3311d9
	.xword	0xaf6deddf02409ac7
	.xword	0x96c455efb9fd07e5
	.xword	0x5d65f0dc20899f56
	.xword	0xd78f0dfd90c73e79
	.xword	0x779f708e47f94825
	.xword	0xe73fbbe8db80eb7b
	.xword	0xd9c137e5467e8475
	.xword	0xb23c490d65bf7aa1
	.xword	0x0d2328df6a2eb26e
	.xword	0xa2b67bee8e4f55c4
	.xword	0x8288258973b20945
	.xword	0xe4db4865afb36739
	.xword	0x3a8889f2466c91f7
	.xword	0x51840e2654e6e86c
	.xword	0xa22da2b59086148c
	.xword	0xa5e6cda6910cadc4
	.xword	0x97cd728bb76f8588
	.xword	0x4c13deee8b629346
	.xword	0xd88893b060460478
	.xword	0x757fac296d650ed9
	.xword	0x434641aaab486768
	.xword	0x627393e1a118d8cd
	.xword	0x1f095842392b409e
	.xword	0xdd877db068ed00ae
	.xword	0x314a661ae828e523
	.xword	0x24175e28c38bf936
	.xword	0x00052bf1a46df302
	.xword	0xc74a05747103a341
	.xword	0xcf62616d9dc35009
	.xword	0xca88411145dd1035
	.xword	0x99c8a31e8de12cd0
	.xword	0xddaafda3411ebce2
	.xword	0xfbeb0b908f72d25d
	.xword	0xed8ef57edbca3a6b
	.xword	0x8efd111a41454354
	.xword	0x36a5cf5dd4e454a9
	.xword	0x94d460cde455aa39
	.xword	0xd138a3ae11566d6d
	.xword	0xe0bca13f4f148668
	.xword	0x2b7924552e29b3c8
	.xword	0xdad5c61ceff98221
	.xword	0xfaee0a35d04d94a5
	.xword	0x095668501ed77638
	.xword	0xb959972af95ac4be
	.xword	0x4cfd1a01f1fb10ec
	.xword	0xb7043e00f023dfe1
	.xword	0xcda2ff738eac553b
	.xword	0x33690856f384ff80
	.xword	0x647d8c13d1e309bb
	.xword	0xc970a5f169d308df
	.xword	0xe0f67d66f2968047
	.xword	0x7545b88f57f1f7aa
	.xword	0x901bb74881770832
	.xword	0xf104fa471723fa50
	.xword	0x49f3346452dcbf3d
	.xword	0x5f0f0308029d0720
	.xword	0xf5fcfe7d070e15c9
	.xword	0xcbe99dae931a4c8c
	.xword	0x85a1531c455ae746
	.xword	0xa69605c2ef9e8e66
	.xword	0xa3d6f19e4e3f6ee8
	.xword	0x026f131254dbadae
	.xword	0xaaed8a332191b90f
	.xword	0x59498c3f5486c192
	.xword	0x3d604d821e689285
	.xword	0xe7dafec4f10ef9db
	.xword	0x7cee818827a95d57
	.xword	0x61afa8605e42c2be
	.xword	0xcf8b728de9e92d4f
	.xword	0xef74c94997fd6916
	.xword	0xc87ef3a2d75c1ecc
	.xword	0x84e3af8054d373e2
	.xword	0x5526887b71853755
	.xword	0xd48e7cf1b3353d6a
	.xword	0x36f19942c858947b
	.xword	0x4547f292600b3c53
	.xword	0x6fe5677cf5ea6871
	.xword	0x99027850337271e4
	.xword	0x1c7969fe6626eca4
	.xword	0x56d12cbab917387c
	.xword	0xefb294122ffae5ac
	.xword	0x203c97acb6759f0c
	.xword	0xdef0f9e0e821f036
	.xword	0xba467f3a715267de
	.xword	0xe640f83289bb818b
	.xword	0xa9902a51a59d7e6c
	.xword	0xc896cd71b5c58dd9
	.xword	0xf98c3439650f303f
	.xword	0xafd2bfe8b02d79e1
	.xword	0x79acd7db0a2275dd
	.xword	0xea3f44816834b5e2
	.xword	0x16856a8a9066a261
	.xword	0x71ad5307c5e2809a
	.xword	0xb50f5118c4396916
	.xword	0xab37b0e3dd594a1b
	.xword	0x0a07fe87d657f0ef
	.xword	0xca78da5c522a69e0
	.xword	0x54c6d4cb27cb29f7
	.xword	0x41ea33e0c2c6203e
	.xword	0x0a15fae60d4f2376
	.xword	0x22df6465873ed947
	.xword	0x5b05283be479f5c1
	.xword	0xed95a3a389b6c703
	.xword	0x12f00371b86d2c23
	.xword	0x3ffd383ce56d6180
	.xword	0x99e4cb8861faf7e8
	.xword	0x513411862e819fd6
	.xword	0x0e8523e6ca8591a7
	.xword	0x11b27319132bccc0
	.xword	0x23391ccd7558a38c
	.xword	0x860a0ade5e9f5305
	.xword	0x90d399f0dc08f9f9
	.xword	0x92de1b2761aa32e3
	.xword	0xfe1c7532d5846c29
	.xword	0x6dc7feb532900fcb
	.xword	0x943676b79f254bb5
	.xword	0x28084266dcb8f65c
	.xword	0xa9767a83752115bf
	.xword	0x0fc49c4468cd79f4
	.xword	0xd6479e61fe50a0c8
	.xword	0xf05c2d600277bd83
	.xword	0x20527cbb87dd5daa
	.xword	0x2c3c7ad2343bff34
	.xword	0x6ccaf0efe4213e04
	.xword	0xa74a232c62063fef
	.xword	0x8bef372b8d1525c8
	.xword	0x07188c44e45e77e7
	.xword	0x8ac168d2fadf2a3d
	.xword	0x312d76e90cdfec5a
	.xword	0x6396b4944d08d837
	.xword	0xd4ff84fba7dce150
	.xword	0x6fa46a7768c42e0f
	.xword	0xcab8270723df516a
	.xword	0xcf342c7ec09dbbac
	.xword	0xdeb69c80d04607b1
	.xword	0x0d61791b3a37c0d6
	.xword	0xe025d75d7d6b1da6
	.xword	0x465356efd32c9fca
	.xword	0xbd554bcdc71e2ae5
	.xword	0x25af662234150de7
	.xword	0x3dc1cb618b650dfe
	.xword	0xb7610c432d0a78ce
	.xword	0x885a1fc9121332f9
	.xword	0x6d5e7d5fb925cd22
	.xword	0xb9edb7f183248b59
	.xword	0xb438890e207dfe6a
	.xword	0x544d0897ce4201c9
	.xword	0x00943b356993196c
	.xword	0x7badd11428a76451
	.xword	0x70b9fd9ce2ff6ba8
	.xword	0xce5b80b99f50d498
	.xword	0x21c5f33e4eb0faaa
	.xword	0xf650125a9e3dffbb
	.xword	0xbc85cfd65522c0fb
	.xword	0x0e54a3134f138894
	.xword	0xda9df5c2f0cf12bd
	.xword	0x08cd0f9afddd4b04
	.xword	0xc1767302fc50a1e1
	.xword	0x48dd0b486ea3df93
	.xword	0x4eb88172b24ab543
	.xword	0xa8de3888b1745cb2
	.xword	0x107d45ea09419e9e
	.xword	0xc5e48c16d3673580
	.xword	0x5a87a66fee761af0
	.xword	0x0114abc870991318
	.xword	0x1d2bece211fa31cb
	.xword	0xa08fa0262c8f9be0
	.xword	0x73ff3327899b7379
	.xword	0x4206794c5ea30ad7
	.xword	0x628390af861fe656
	.xword	0xaf25ed5fe2f848ad
	.xword	0x3e315294649d1a10
	.xword	0xd4e354f00ac2c23f
	.xword	0x70d307feb99cd0a1
	.xword	0xca6b7b52cb86b8ef
	.xword	0x2ea8a46fc68a609e
	.xword	0xd26e2456f0e45ebe
	.xword	0x6a38a60c8c618ba4
	.xword	0xc104907c26f4781d
	.xword	0x2eefd6f238d42bba
	.xword	0xd7a5a778fc9bed23
	.xword	0x2f912ef239bc3e46
	.xword	0xb8419156b3764967
	.xword	0x92da566596a447fa
	.xword	0xf771a10e6258ee57
	.xword	0xe667f947c93d16e8
	.xword	0xe66b51ced7f92898
	.xword	0x1b7e4c230d066688
	.xword	0x4b460533f5628be7
	.xword	0x2b92b42d72a20302
	.xword	0x509209fda103326b
	.xword	0xa3ffc9ea56fb135b
	.xword	0xec2ea324aecee2b4
	.xword	0x58de9c46e86f3c60
	.xword	0x265f5031cee6ac04
	.xword	0x2a9a06f5c13c6440
	.xword	0x875f712a2aa2fdc7
	.xword	0x8d8502b2ef8898e8
	.xword	0x9bd6dc3eda814a83
	.xword	0x05053829d11d2b2a
	.xword	0x71ecd7a40ba687c4
	.xword	0x3277f8d82822bcd1
	.xword	0x66ff076d26717df1
	.xword	0x978bd4614af78f45
	.xword	0x1f05501dd0a9b26b
	.xword	0x3452787978be60ee
	.xword	0x28cb9aab99574991
	.xword	0x155a2ef310c1fa1c
	.xword	0x5ff2eadd66249864
	.xword	0xd7106e72fffffe5f
	.xword	0xeae723c8d240d822
	.xword	0xa0f35db8b807dc6a
	.xword	0x2446982063467756
	.xword	0x9bd6bde6b3c6c0ad
	.xword	0x7b648798f0e89b4c
	.xword	0xf1419b96f671a942
	.xword	0xa4853f236110a747
	.xword	0x81322886401a7312
	.xword	0x65c8a47600f7f386
	.xword	0x5235630933c1257f
	.xword	0x72e053f013f059de
	.xword	0x945b331a15a79dd9
	.xword	0x38986bf54f1f4d21
	.xword	0xa78244ce1936ef28
	.xword	0x1bee81fe70ed8582
	.xword	0xae3ddebf3b2979ca
	.xword	0xadaac3dd12de2a1d
	.xword	0xc8112b7426985b23
	.xword	0xe663a1d7f3601f20
	.xword	0xcc55fc79bbf7e402
	.xword	0x0722abdfcc195de9
	.xword	0x61f07413ab8bc120
	.xword	0xe2824c5ddb842b9c
	.xword	0xa23f98f7235eba2b
	.xword	0x5f9e5cf59b7b236f
	.xword	0xe85c0535a7aa279a
	.xword	0x2aaf00c54880863d
	.xword	0x71b46e11fe35bb5e
	.xword	0x90cacc82713621a6
	.xword	0xb28005a3268a744e
	.xword	0x8d6e2827c87a2f77
	.xword	0x18d086fff5614164
	.xword	0x44808c500c4613b1
	.xword	0x68a7ae7dac74bd54
	.xword	0xdc1b0ff190b73a33
	.xword	0xcc9a328bb65e5feb
	.xword	0xd7a89befac30ff89
	.xword	0x3528fbb09884f8ab
	.xword	0xc7b7ef78aea6751b
	.xword	0x47d3dd153b5159aa
	.xword	0x2dbff77d7f29b4d7
	.xword	0x1c8c03877bc3871d



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
