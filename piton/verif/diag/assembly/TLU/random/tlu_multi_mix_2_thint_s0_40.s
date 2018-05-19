// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_40.s
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
   random seed:	883460365
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

	setx 0x4e60edb69395fc5a, %g1, %g0
	setx 0x437828ac1a3af830, %g1, %g1
	setx 0xc0dabeec4ab1f128, %g1, %g2
	setx 0xb9c84c4ec2f95f80, %g1, %g3
	setx 0xa1a03c06f79d6789, %g1, %g4
	setx 0xa9cbdfcfbd137158, %g1, %g5
	setx 0x174f075f8eb9e3b9, %g1, %g6
	setx 0x8df224df65523a2e, %g1, %g7
	setx 0xe9b820d923447cd5, %g1, %r16
	setx 0x1b1219d5aaf46220, %g1, %r17
	setx 0x6b7e7fd5c345eed5, %g1, %r18
	setx 0x5f21a9c764867121, %g1, %r19
	setx 0x1d65633665cc4602, %g1, %r20
	setx 0xc3117087f49fd3c0, %g1, %r21
	setx 0xa4adc5e513adbf17, %g1, %r22
	setx 0xc0074b19d55d215e, %g1, %r23
	setx 0xdd0fb26f5bda1466, %g1, %r24
	setx 0xe201fb9446a98745, %g1, %r25
	setx 0x846c06c0d009fa7d, %g1, %r26
	setx 0xeeb139b1ac455977, %g1, %r27
	setx 0x64ece58375e60259, %g1, %r28
	setx 0x8a4c374ce21c06c4, %g1, %r29
	setx 0xf63836a85f2753de, %g1, %r30
	setx 0x7704394aa5043041, %g1, %r31
	save
	setx 0xe34aeb8f357ab2c9, %g1, %r16
	setx 0xf6fe1b6c471acb9c, %g1, %r17
	setx 0x704ba750c2e71665, %g1, %r18
	setx 0xc491b1f2b812cc35, %g1, %r19
	setx 0x0a18ed457a49f436, %g1, %r20
	setx 0x66d0301007419d9a, %g1, %r21
	setx 0x60031408072fd024, %g1, %r22
	setx 0x458f583d7b175bd0, %g1, %r23
	setx 0x905c5ec5340a8db4, %g1, %r24
	setx 0x29512a7876ffe3b5, %g1, %r25
	setx 0x073bcb7e795563c1, %g1, %r26
	setx 0x728ab736aeba54f5, %g1, %r27
	setx 0x32d66856142558d0, %g1, %r28
	setx 0xc9a7993c468210a8, %g1, %r29
	setx 0xcd30ae000bcacfe9, %g1, %r30
	setx 0xd9b47a19ebeea4fb, %g1, %r31
	save
	setx 0xe475c17f84bb5f8a, %g1, %r16
	setx 0xeaedfc3e6033e276, %g1, %r17
	setx 0xc5385e9aaab0d9ea, %g1, %r18
	setx 0xb17a53b81d46dfa0, %g1, %r19
	setx 0x2b1799b33af8ea59, %g1, %r20
	setx 0xf7d4af0df063dfca, %g1, %r21
	setx 0xa3ece0220f43a88c, %g1, %r22
	setx 0xf576589e3bf9df5f, %g1, %r23
	setx 0x7be5d0519a26f7af, %g1, %r24
	setx 0xb3a3d7068c021be3, %g1, %r25
	setx 0x5db7d3b61c150c93, %g1, %r26
	setx 0x8894ad58352e3d18, %g1, %r27
	setx 0x7f8fdffc8acba284, %g1, %r28
	setx 0x236840b2349ffef6, %g1, %r29
	setx 0x3c1fcdfe8f33f585, %g1, %r30
	setx 0x3a266c542d004782, %g1, %r31
	save
	setx 0xebe7373eda0643ae, %g1, %r16
	setx 0xd1f24ae0fb3fef8b, %g1, %r17
	setx 0xb944da664503c147, %g1, %r18
	setx 0x127120e9860333dc, %g1, %r19
	setx 0x46f7926b6d0dd8cf, %g1, %r20
	setx 0x83482e9c2e61b471, %g1, %r21
	setx 0x2eef52a08417a863, %g1, %r22
	setx 0xbe1cb58383c6d74a, %g1, %r23
	setx 0xa4b6cbf1483e94d5, %g1, %r24
	setx 0xc70273709bcc1e45, %g1, %r25
	setx 0x6c8b24eb1de76d16, %g1, %r26
	setx 0x36bdb5580b87a752, %g1, %r27
	setx 0x49fd37b1a558113d, %g1, %r28
	setx 0x3c4f15bc003b6390, %g1, %r29
	setx 0x98ea28cd3df85244, %g1, %r30
	setx 0xeff455c8b089e23c, %g1, %r31
	save
	setx 0x59d8c1aa4a22ec15, %g1, %r16
	setx 0x1c3ea819ed1f37a7, %g1, %r17
	setx 0x033f72b0b8fe7f63, %g1, %r18
	setx 0x4e5139d4ced5af0b, %g1, %r19
	setx 0xc4bf630bc1ac967c, %g1, %r20
	setx 0xa2d4f4e7bbc1960a, %g1, %r21
	setx 0x008e9011da9c24d8, %g1, %r22
	setx 0xe155b69dbf4a42fa, %g1, %r23
	setx 0x7b6a1fe0afc156da, %g1, %r24
	setx 0xa885760294127984, %g1, %r25
	setx 0x1a05c86ee82aa9dd, %g1, %r26
	setx 0x0415077844870ff3, %g1, %r27
	setx 0xfde93cabef45ff8e, %g1, %r28
	setx 0x76778272cbe8c47e, %g1, %r29
	setx 0x2383b737b449772f, %g1, %r30
	setx 0xba6524372f379ed0, %g1, %r31
	save
	setx 0xfe293130315f7ca3, %g1, %r16
	setx 0x04b70c95c59e9966, %g1, %r17
	setx 0xffb74a9f427e4258, %g1, %r18
	setx 0x9f5c551602613fd6, %g1, %r19
	setx 0x4b090de15a51d512, %g1, %r20
	setx 0x33ec0c1375ae0b94, %g1, %r21
	setx 0x485134d5e358584c, %g1, %r22
	setx 0xb3f4aeca24b520dd, %g1, %r23
	setx 0x4563c360fc793af0, %g1, %r24
	setx 0x66adb2e3a69801e9, %g1, %r25
	setx 0xec73f774541bc0e3, %g1, %r26
	setx 0xf247a1f384fae4ea, %g1, %r27
	setx 0x59cbd4f36e10db4c, %g1, %r28
	setx 0xc99fcf43a25aff90, %g1, %r29
	setx 0x3a4ab4dd71412c76, %g1, %r30
	setx 0x4f7b3ee455719756, %g1, %r31
	save
	setx 0xded48c935748606c, %g1, %r16
	setx 0xc884478915393f17, %g1, %r17
	setx 0xbb72e990c2a79641, %g1, %r18
	setx 0x4fc4c8cb9bd0f37d, %g1, %r19
	setx 0xef7dc776082ce4eb, %g1, %r20
	setx 0x544af32a6e24f6d4, %g1, %r21
	setx 0xe068a1bb21f8c002, %g1, %r22
	setx 0x3660a7fe178e9b86, %g1, %r23
	setx 0xff17fbbd8a6aa341, %g1, %r24
	setx 0x7607853cef046eda, %g1, %r25
	setx 0xa008fb450b416c7b, %g1, %r26
	setx 0x2160dcc381a25753, %g1, %r27
	setx 0x061d5a4fcad9049f, %g1, %r28
	setx 0x55584b4a03dff188, %g1, %r29
	setx 0xf744ef4f742b24b5, %g1, %r30
	setx 0x36b957b29e8b37cb, %g1, %r31
	save
	setx 0x64c276e8675d24b3, %g1, %r16
	setx 0x6e7f041c94c45bd8, %g1, %r17
	setx 0x7d40216a7ab35357, %g1, %r18
	setx 0x40740b16505c8f83, %g1, %r19
	setx 0x8e8990bf139241bf, %g1, %r20
	setx 0x9c0c7de31c9c29e7, %g1, %r21
	setx 0x7a1eba850f289e0c, %g1, %r22
	setx 0x4540daee735009e5, %g1, %r23
	setx 0x7a72b21cf7e84dcf, %g1, %r24
	setx 0xb6d43b9526ab691e, %g1, %r25
	setx 0x5e7337b7e2c4f832, %g1, %r26
	setx 0xf75bb3b01db916a0, %g1, %r27
	setx 0xbe1033d8b47e591b, %g1, %r28
	setx 0x63d6bc3870137f7b, %g1, %r29
	setx 0x88e83445091153d9, %g1, %r30
	setx 0xdcf5b80fd2bef53e, %g1, %r31
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
	.word 0x8d94e0ec  ! 1: WRPR_PSTATE_I	wrpr	%r19, 0x00ec, %pstate
	.word 0xb7e4e01b  ! 4: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x8594a10f  ! 6: WRPR_TSTATE_I	wrpr	%r18, 0x010f, %tstate
	.word 0xb32d5000  ! 8: SLLX_R	sllx	%r21, %r0, %r25
	.word 0xb135e001  ! 9: SRL_I	srl 	%r23, 0x0001, %r24
	.word 0xb1e5a105  ! 10: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e4e072  ! 12: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e561ae  ! 13: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde42137  ! 16: SAVE_I	save	%r16, 0x0001, %r30
	mov	0x9, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe460c3  ! 24: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8594e0fd  ! 25: WRPR_TSTATE_I	wrpr	%r19, 0x00fd, %tstate
	.word 0xb80cc000  ! 29: AND_R	and 	%r19, %r0, %r28
	.word 0x8794e1d4  ! 30: WRPR_TT_I	wrpr	%r19, 0x01d4, %tt
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4612c  ! 32: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe421d1  ! 38: SAVE_I	save	%r16, 0x0001, %r31
	mov	0x139, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde52080  ! 41: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb13d9000  ! 43: SRAX_R	srax	%r22, %r0, %r24
	.word 0xb1520000  ! 52: RDPR_PIL	<illegal instruction>
	.word 0xb7e520c1  ! 54: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e4616b  ! 57: SAVE_I	save	%r17, 0x0001, %r25
	mov	0x3b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e08a  ! 59: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb13d1000  ! 60: SRAX_R	srax	%r20, %r0, %r24
	.word 0xbb641800  ! 66: MOVcc_R	<illegal instruction>
	.word 0xb4350000  ! 67: ORN_R	orn 	%r20, %r0, %r26
	mov	0x12c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e520da  ! 70: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3500000  ! 74: RDPR_TPC	<illegal instruction>
	.word 0xb3e52010  ! 77: SAVE_I	save	%r20, 0x0001, %r25
	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 81: RDPR_GL	<illegal instruction>
	.word 0x899520ee  ! 82: WRPR_TICK_I	wrpr	%r20, 0x00ee, %tick
	.word 0xb1e4e1fe  ! 83: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8394a158  ! 86: WRPR_TNPC_I	wrpr	%r18, 0x0158, %tnpc
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 91: RDPR_GL	<illegal instruction>
	mov	0x2e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 93: RDPR_PIL	<illegal instruction>
	.word 0x879461fb  ! 95: WRPR_TT_I	wrpr	%r17, 0x01fb, %tt
	.word 0xb7540000  ! 96: RDPR_GL	<illegal instruction>
	.word 0xb9e56089  ! 98: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb6bca134  ! 99: XNORcc_I	xnorcc 	%r18, 0x0134, %r27
	.word 0xb7351000  ! 102: SRLX_R	srlx	%r20, %r0, %r27
	.word 0x89956051  ! 103: WRPR_TICK_I	wrpr	%r21, 0x0051, %tick
	.word 0xbfe52139  ! 104: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb09c8000  ! 105: XORcc_R	xorcc 	%r18, %r0, %r24
	.word 0x899561ae  ! 108: WRPR_TICK_I	wrpr	%r21, 0x01ae, %tick
	.word 0xbbe460b2  ! 109: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe52048  ! 110: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8394600c  ! 112: WRPR_TNPC_I	wrpr	%r17, 0x000c, %tnpc
	.word 0xb5e5e1b2  ! 114: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde42073  ! 115: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e460d0  ! 118: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb6a44000  ! 123: SUBcc_R	subcc 	%r17, %r0, %r27
	.word 0xb3e56081  ! 127: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e56084  ! 129: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbb50c000  ! 131: RDPR_TT	<illegal instruction>
	.word 0xbfe420cb  ! 134: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e56169  ! 137: SAVE_I	save	%r21, 0x0001, %r25
	setx	data_start_4, %g1, %r16
	.word 0xb3e5a14e  ! 142: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x9194a1fd  ! 143: WRPR_PIL_I	wrpr	%r18, 0x01fd, %pil
	.word 0xb3e560fd  ! 144: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e52116  ! 145: SAVE_I	save	%r20, 0x0001, %r28
	mov	0x223, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7508000  ! 150: RDPR_TSTATE	<illegal instruction>
	.word 0xbde4210b  ! 151: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe4a1e1  ! 152: SAVE_I	save	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbc44e1ce  ! 158: ADDC_I	addc 	%r19, 0x01ce, %r30
	.word 0xb5e420a2  ! 159: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbeada1cf  ! 162: ANDNcc_I	andncc 	%r22, 0x01cf, %r31
	.word 0xbfe4a167  ! 164: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e4e0b0  ! 170: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e5e1c2  ! 172: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1520000  ! 177: RDPR_PIL	<illegal instruction>
	.word 0xb7540000  ! 179: RDPR_GL	<illegal instruction>
	.word 0xbfe52184  ! 180: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8395203c  ! 184: WRPR_TNPC_I	wrpr	%r20, 0x003c, %tnpc
	.word 0xbd3c4000  ! 185: SRA_R	sra 	%r17, %r0, %r30
	.word 0xbde5e03e  ! 187: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e42198  ! 189: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe5a141  ! 191: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1510000  ! 193: RDPR_TICK	<illegal instruction>
	.word 0xb1e521a9  ! 194: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e52041  ! 199: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe4e01d  ! 201: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e4a091  ! 205: SAVE_I	save	%r18, 0x0001, %r28
	setx	data_start_2, %g1, %r19
	.word 0xb2bc8000  ! 214: XNORcc_R	xnorcc 	%r18, %r0, %r25
	mov	0x337, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 217: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb5e42137  ! 218: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb12d5000  ! 221: SLLX_R	sllx	%r21, %r0, %r24
	.word 0xbde4e0bb  ! 224: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e5a154  ! 226: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e421ce  ! 231: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e4e07f  ! 232: SAVE_I	save	%r19, 0x0001, %r26
	mov	1, %r12
	.word 0x8f930000  ! 233: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb43c6077  ! 234: XNOR_I	xnor 	%r17, 0x0077, %r26
	.word 0xb9e420ed  ! 240: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe42068  ! 242: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xba356099  ! 243: ORN_I	orn 	%r21, 0x0099, %r29
	.word 0xb77d4400  ! 249: MOVR_R	movre	%r21, %r0, %r27
	.word 0xb1e5e091  ! 253: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbd540000  ! 254: RDPR_GL	<illegal instruction>
	.word 0xbbe4a159  ! 257: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e5e14e  ! 259: SAVE_I	save	%r23, 0x0001, %r25
	mov	0x13d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe561c8  ! 265: SAVE_I	save	%r21, 0x0001, %r29
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 268: RDPR_TNPC	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 270: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e561d4  ! 271: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x80ddd97700003e82, %g1, %r10
	.word 0x839a8000  ! 272: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x23f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5601e  ! 276: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbb3ca001  ! 277: SRA_I	sra 	%r18, 0x0001, %r29
	.word 0xb00c4000  ! 280: AND_R	and 	%r17, %r0, %r24
	mov	0x219, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a0ea  ! 282: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e5e0f5  ! 283: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8994e02e  ! 285: WRPR_TICK_I	wrpr	%r19, 0x002e, %tick
	.word 0xbfe461af  ! 288: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb2c4e1ea  ! 292: ADDCcc_I	addccc 	%r19, 0x01ea, %r25
	.word 0xb1e5a1ab  ! 294: SAVE_I	save	%r22, 0x0001, %r24
	mov	0x203, %o0
	ta	T_SEND_THRD_INTR
	.word 0x89956176  ! 301: WRPR_TICK_I	wrpr	%r21, 0x0176, %tick
	.word 0x8194216d  ! 303: WRPR_TPC_I	wrpr	%r16, 0x016d, %tpc
	.word 0xb7e4606e  ! 305: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e4a0a0  ! 308: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e461c9  ! 309: SAVE_I	save	%r17, 0x0001, %r28
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4618a  ! 311: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x23b9a1160000ea5d, %g1, %r10
	.word 0x819a8000  ! 317: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb60d211f  ! 319: AND_I	and 	%r20, 0x011f, %r27
	.word 0xb9e4e15e  ! 320: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e4e0c7  ! 323: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e52036  ! 325: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde4e19a  ! 326: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e4203b  ! 327: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde5a027  ! 329: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9540000  ! 330: RDPR_GL	<illegal instruction>
	mov	0x32b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe42076  ! 334: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb0c40000  ! 335: ADDCcc_R	addccc 	%r16, %r0, %r24
	.word 0xbbe5a04d  ! 337: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb3e4a06e  ! 343: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e4a00c  ! 344: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe4a0c3  ! 345: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e561c0  ! 350: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe5e16f  ! 352: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xba3d8000  ! 355: XNOR_R	xnor 	%r22, %r0, %r29
	mov	0x304, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 361: RDPR_TPC	<illegal instruction>
	.word 0xb3e5e085  ! 364: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e5a0aa  ! 367: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbd500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xbbe421eb  ! 371: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e5602a  ! 378: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e4a0aa  ! 382: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e4e119  ! 383: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e4a037  ! 384: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e56014  ! 387: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe56195  ! 388: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe4a19e  ! 391: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe561a1  ! 394: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbab4601e  ! 396: SUBCcc_I	orncc 	%r17, 0x001e, %r29
	.word 0xb9e4209f  ! 397: SAVE_I	save	%r16, 0x0001, %r28
	setx	data_start_5, %g1, %r23
	.word 0xbfe520cb  ! 407: SAVE_I	save	%r20, 0x0001, %r31
	mov	0xd, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 411: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0xf, %o0
	ta	T_SEND_THRD_INTR
	setx	0xc2f04dff0000bc1f, %g1, %r10
	.word 0x839a8000  ! 414: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x7d7f40bf0000180d, %g1, %r10
	.word 0x819a8000  ! 415: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e560e0  ! 416: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x91956063  ! 417: WRPR_PIL_I	wrpr	%r21, 0x0063, %pil
	.word 0xb1e5a0b7  ! 420: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8794613f  ! 424: WRPR_TT_I	wrpr	%r17, 0x013f, %tt
	.word 0xb7e5a0cb  ! 425: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde5e0a1  ! 429: SAVE_I	save	%r23, 0x0001, %r30
	setx	data_start_1, %g1, %r23
	.word 0xb9e461d0  ! 432: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb951c000  ! 435: RDPR_TL	<illegal instruction>
	.word 0xb33dd000  ! 437: SRAX_R	srax	%r23, %r0, %r25
	.word 0x8794a07d  ! 438: WRPR_TT_I	wrpr	%r18, 0x007d, %tt
	.word 0xb23ce0e1  ! 440: XNOR_I	xnor 	%r19, 0x00e1, %r25
	.word 0xb7e4a181  ! 442: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e4a0c0  ! 443: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e560ff  ! 444: SAVE_I	save	%r21, 0x0001, %r28
	mov	0x212, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a156  ! 448: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb8b4a0ed  ! 452: SUBCcc_I	orncc 	%r18, 0x00ed, %r28
	mov	0x221, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28d60c2  ! 457: ANDcc_I	andcc 	%r21, 0x00c2, %r25
	.word 0xbf643801  ! 464: MOVcc_I	<illegal instruction>
	.word 0xb1e52076  ! 466: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7480000  ! 470: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb9e420ca  ! 471: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e4e142  ! 474: SAVE_I	save	%r19, 0x0001, %r27
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e521c0  ! 480: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbf480000  ! 482: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb09c4000  ! 483: XORcc_R	xorcc 	%r17, %r0, %r24
	.word 0xb3510000  ! 486: RDPR_TICK	<illegal instruction>
	.word 0xb1e5e090  ! 487: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7643801  ! 488: MOVcc_I	<illegal instruction>
	.word 0xb9518000  ! 489: RDPR_PSTATE	<illegal instruction>
	.word 0x8195e12e  ! 490: WRPR_TPC_I	wrpr	%r23, 0x012e, %tpc
	.word 0xb5e5a0c0  ! 492: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x8395a1d5  ! 496: WRPR_TNPC_I	wrpr	%r22, 0x01d5, %tnpc
	.word 0xb3e56155  ! 501: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e5e002  ! 504: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbe35c000  ! 506: SUBC_R	orn 	%r23, %r0, %r31
	.word 0xbb35e001  ! 507: SRL_I	srl 	%r23, 0x0001, %r29
	.word 0xbfe460d1  ! 510: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e4a09c  ! 513: SAVE_I	save	%r18, 0x0001, %r24
	mov	2, %r12
	.word 0x8f930000  ! 516: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e421d7  ! 518: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5508000  ! 519: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e46085  ! 520: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe420ca  ! 521: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe5202a  ! 522: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e4a0a9  ! 523: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe5e137  ! 525: SAVE_I	save	%r23, 0x0001, %r29
	mov	2, %r12
	.word 0xa1930000  ! 530: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8195e173  ! 533: WRPR_TPC_I	wrpr	%r23, 0x0173, %tpc
	.word 0x8994a0bc  ! 541: WRPR_TICK_I	wrpr	%r18, 0x00bc, %tick
	.word 0xbfe420f0  ! 542: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e4a12f  ! 543: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e4e16e  ! 547: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x859460fd  ! 549: WRPR_TSTATE_I	wrpr	%r17, 0x00fd, %tstate
	mov	1, %r12
	.word 0xa1930000  ! 550: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e56085  ! 551: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e5e1a1  ! 554: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7643801  ! 556: MOVcc_I	<illegal instruction>
	.word 0xb5e52083  ! 558: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb245c000  ! 560: ADDC_R	addc 	%r23, %r0, %r25
	.word 0xbc352175  ! 561: ORN_I	orn 	%r20, 0x0175, %r30
	.word 0xbd508000  ! 563: RDPR_TSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r20
	.word 0xbd3d5000  ! 574: SRAX_R	srax	%r21, %r0, %r30
	.word 0xb29dc000  ! 575: XORcc_R	xorcc 	%r23, %r0, %r25
	.word 0xb7e4604f  ! 576: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e4e0aa  ! 580: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e521ec  ! 584: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e5202c  ! 585: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e46093  ! 586: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde5605c  ! 587: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e5a16b  ! 591: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde4e0b7  ! 592: SAVE_I	save	%r19, 0x0001, %r30
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a1ad  ! 594: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e461a6  ! 596: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e5a10f  ! 598: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbd504000  ! 601: RDPR_TNPC	<illegal instruction>
	.word 0xb5e5e10a  ! 603: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e560e4  ! 606: SAVE_I	save	%r21, 0x0001, %r25
	setx	0x5c6af1c30000fa1d, %g1, %r10
	.word 0x839a8000  ! 607: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfe4207d  ! 608: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbab4e175  ! 611: ORNcc_I	orncc 	%r19, 0x0175, %r29
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e09c  ! 614: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e46160  ! 616: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e5e09a  ! 617: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbf500000  ! 621: RDPR_TPC	<illegal instruction>
	.word 0xbf540000  ! 626: RDPR_GL	<illegal instruction>
	.word 0xbde460d3  ! 627: SAVE_I	save	%r17, 0x0001, %r30
	mov	1, %r12
	.word 0xa1930000  ! 629: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3e561da  ! 630: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e4a052  ! 634: SAVE_I	save	%r18, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5a111  ! 638: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb68c21e7  ! 641: ANDcc_I	andcc 	%r16, 0x01e7, %r27
	.word 0xbde5e10b  ! 642: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8794e088  ! 645: WRPR_TT_I	wrpr	%r19, 0x0088, %tt
	.word 0xb1e4e19f  ! 646: SAVE_I	save	%r19, 0x0001, %r24
	mov	0x108, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe46099  ! 648: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8594e076  ! 649: WRPR_TSTATE_I	wrpr	%r19, 0x0076, %tstate
	.word 0xbfe4a1ef  ! 654: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe5e01a  ! 657: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbc346031  ! 659: ORN_I	orn 	%r17, 0x0031, %r30
	.word 0xbde5e01f  ! 663: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8195a0a0  ! 664: WRPR_TPC_I	wrpr	%r22, 0x00a0, %tpc
	mov	0x23, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394a052  ! 666: WRPR_TNPC_I	wrpr	%r18, 0x0052, %tnpc
	.word 0xb3e461e0  ! 668: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb02d4000  ! 669: ANDN_R	andn 	%r21, %r0, %r24
	.word 0xb03c4000  ! 670: XNOR_R	xnor 	%r17, %r0, %r24
	.word 0xb1350000  ! 671: SRL_R	srl 	%r20, %r0, %r24
	.word 0xbfe4a00c  ! 672: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e5617d  ! 674: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e46019  ! 675: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe46143  ! 676: SAVE_I	save	%r17, 0x0001, %r29
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc24615f  ! 682: SUB_I	sub 	%r17, 0x015f, %r30
	.word 0xbde5e114  ! 685: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x839520ec  ! 691: WRPR_TNPC_I	wrpr	%r20, 0x00ec, %tnpc
	.word 0xb9e521f4  ! 692: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe5611d  ! 695: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbf643801  ! 697: MOVcc_I	<illegal instruction>
	.word 0xbb508000  ! 698: RDPR_TSTATE	<illegal instruction>
	.word 0xbde52199  ! 701: SAVE_I	save	%r20, 0x0001, %r30
	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63dc000  ! 712: XNOR_R	xnor 	%r23, %r0, %r27
	.word 0x919461b7  ! 714: WRPR_PIL_I	wrpr	%r17, 0x01b7, %pil
	.word 0xb7e5a1bb  ! 721: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e521e3  ! 722: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbb518000  ! 728: RDPR_PSTATE	<illegal instruction>
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a1da  ! 731: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e4a1b8  ! 733: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e4a0e9  ! 734: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe5a076  ! 735: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb551c000  ! 742: RDPR_TL	<illegal instruction>
	.word 0x89946108  ! 743: WRPR_TICK_I	wrpr	%r17, 0x0108, %tick
	.word 0xb9540000  ! 744: RDPR_GL	<illegal instruction>
	.word 0xb7e5e1b7  ! 746: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e461f0  ! 752: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e5a1ff  ! 753: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e4e195  ! 762: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e42043  ! 764: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde56024  ! 765: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e420e8  ! 773: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e4e182  ! 774: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbd520000  ! 776: RDPR_PIL	<illegal instruction>
	.word 0xb5e560bf  ! 779: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x89946093  ! 781: WRPR_TICK_I	wrpr	%r17, 0x0093, %tick
	.word 0xbec56178  ! 783: ADDCcc_I	addccc 	%r21, 0x0178, %r31
	.word 0x8194e19e  ! 784: WRPR_TPC_I	wrpr	%r19, 0x019e, %tpc
	.word 0xb17c8400  ! 785: MOVR_R	movre	%r18, %r0, %r24
	.word 0xbbe5e090  ! 787: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb03d8000  ! 788: XNOR_R	xnor 	%r22, %r0, %r24
	.word 0xbde4a1a1  ! 790: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde42008  ! 794: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e5e014  ! 798: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde5e0bb  ! 799: SAVE_I	save	%r23, 0x0001, %r30
	mov	0x32, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e11e  ! 804: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x43c76f0200007a07, %g1, %r10
	.word 0x819a8000  ! 811: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e5e185  ! 812: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8d95e032  ! 817: WRPR_PSTATE_I	wrpr	%r23, 0x0032, %pstate
	setx	data_start_4, %g1, %r21
	setx	0x23aec1a0000bdc4, %g1, %r10
	.word 0x819a8000  ! 819: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9e5a179  ! 820: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x8794a11b  ! 823: WRPR_TT_I	wrpr	%r18, 0x011b, %tt
	.word 0xbfe5a0e7  ! 824: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x87942092  ! 825: WRPR_TT_I	wrpr	%r16, 0x0092, %tt
	.word 0xb1504000  ! 829: RDPR_TNPC	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 830: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde4e05a  ! 835: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e5a093  ! 837: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3e4208b  ! 838: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe5a07c  ! 839: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x9194a059  ! 842: WRPR_PIL_I	wrpr	%r18, 0x0059, %pil
	.word 0xbde4a06b  ! 843: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e46181  ! 845: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbb3c0000  ! 846: SRA_R	sra 	%r16, %r0, %r29
	.word 0xbde42187  ! 849: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8395609a  ! 857: WRPR_TNPC_I	wrpr	%r21, 0x009a, %tnpc
	.word 0xbde4203d  ! 858: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e4201f  ! 859: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5504000  ! 860: RDPR_TNPC	<illegal instruction>
	.word 0xb5e5a017  ! 863: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb72c1000  ! 865: SLLX_R	sllx	%r16, %r0, %r27
	.word 0xb7e4e1e7  ! 866: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbf504000  ! 867: RDPR_TNPC	<illegal instruction>
	setx	0x2f74db9600000d0c, %g1, %r10
	.word 0x839a8000  ! 868: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_1, %g1, %r16
	.word 0xbf510000  ! 872: RDPR_TICK	<illegal instruction>
	.word 0xb1e5e0e7  ! 873: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e4209a  ! 875: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde52119  ! 876: SAVE_I	save	%r20, 0x0001, %r30
	mov	0, %r12
	.word 0xa1930000  ! 877: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x9194e051  ! 879: WRPR_PIL_I	wrpr	%r19, 0x0051, %pil
	.word 0xb5e5602a  ! 880: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8594207d  ! 882: WRPR_TSTATE_I	wrpr	%r16, 0x007d, %tstate
	.word 0xb9e421de  ! 883: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe4a0f4  ! 884: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e4a026  ! 885: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5e0ea  ! 888: SAVE_I	save	%r23, 0x0001, %r31
	mov	0xa, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5603b  ! 893: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e5a189  ! 904: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e461d0  ! 913: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe5e105  ! 915: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbb480000  ! 920: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x8995201b  ! 921: WRPR_TICK_I	wrpr	%r20, 0x001b, %tick
	.word 0x879561a0  ! 922: WRPR_TT_I	wrpr	%r21, 0x01a0, %tt
	.word 0xba9dc000  ! 928: XORcc_R	xorcc 	%r23, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5e1aa  ! 932: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e56114  ! 933: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7520000  ! 934: RDPR_PIL	<illegal instruction>
	.word 0x81942116  ! 937: WRPR_TPC_I	wrpr	%r16, 0x0116, %tpc
	.word 0xbde52040  ! 938: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbb2c4000  ! 943: SLL_R	sll 	%r17, %r0, %r29
	.word 0xbfe4e0be  ! 944: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb245a0bf  ! 945: ADDC_I	addc 	%r22, 0x00bf, %r25
	.word 0xb3e42095  ! 949: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e56103  ! 952: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe5602f  ! 954: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e4606f  ! 956: SAVE_I	save	%r17, 0x0001, %r25
	setx	data_start_2, %g1, %r22
	.word 0xbbe5e119  ! 960: SAVE_I	save	%r23, 0x0001, %r29
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46100  ! 963: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb0a4e1c6  ! 964: SUBcc_I	subcc 	%r19, 0x01c6, %r24
	.word 0xb9e5e159  ! 966: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde4a033  ! 969: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e4612d  ! 971: SAVE_I	save	%r17, 0x0001, %r25
	setx	data_start_4, %g1, %r18
	.word 0xb7540000  ! 975: RDPR_GL	<illegal instruction>
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a04e  ! 977: SAVE_I	save	%r18, 0x0001, %r29
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 982: RDPR_TNPC	<illegal instruction>
	.word 0xb7e4a162  ! 986: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7504000  ! 987: RDPR_TNPC	<illegal instruction>
	.word 0xb5e560c7  ! 990: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x81942109  ! 991: WRPR_TPC_I	wrpr	%r16, 0x0109, %tpc
	.word 0xbf354000  ! 992: SRL_R	srl 	%r21, %r0, %r31
	.word 0xb9e421f7  ! 993: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8394a10e  ! 994: WRPR_TNPC_I	wrpr	%r18, 0x010e, %tnpc
	.word 0xbbe5e0c3  ! 997: SAVE_I	save	%r23, 0x0001, %r29
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
	.word 0x8d95a1bb  ! 1: WRPR_PSTATE_I	wrpr	%r22, 0x01bb, %pstate
	.word 0x85942152  ! 6: WRPR_TSTATE_I	wrpr	%r16, 0x0152, %tstate
	.word 0xf62c4000  ! 7: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xb52d5000  ! 8: SLLX_R	sllx	%r21, %r0, %r26
	.word 0xb7352001  ! 9: SRL_I	srl 	%r20, 0x0001, %r27
	.word 0xf83d2188  ! 14: STD_I	std	%r28, [%r20 + 0x0188]
	.word 0xf2740000  ! 15: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xfc75e18f  ! 21: STX_I	stx	%r30, [%r23 + 0x018f]
	mov	0x2e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x85956127  ! 25: WRPR_TSTATE_I	wrpr	%r21, 0x0127, %tstate
	.word 0xf424c000  ! 26: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xb60d0000  ! 29: AND_R	and 	%r20, %r0, %r27
	.word 0x8794a0f7  ! 30: WRPR_TT_I	wrpr	%r18, 0x00f7, %tt
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42560f6  ! 34: STW_I	stw	%r26, [%r21 + 0x00f6]
	.word 0xfb3d8000  ! 35: STDF_R	std	%f29, [%r0, %r22]
	.word 0xf2248000  ! 37: STW_R	stw	%r25, [%r18 + %r0]
	mov	0x13c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33c1000  ! 43: SRAX_R	srax	%r16, %r0, %r25
	.word 0xf53d4000  ! 44: STDF_R	std	%f26, [%r0, %r21]
	.word 0xf0356081  ! 45: STH_I	sth	%r24, [%r21 + 0x0081]
	.word 0xf23c6147  ! 49: STD_I	std	%r25, [%r17 + 0x0147]
	.word 0xb1520000  ! 52: RDPR_PIL	rdpr	%pil, %r24
	.word 0xf63d6180  ! 53: STD_I	std	%r27, [%r21 + 0x0180]
	.word 0xf6744000  ! 56: STX_R	stx	%r27, [%r17 + %r0]
	mov	0x3a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53d9000  ! 60: SRAX_R	srax	%r22, %r0, %r26
	.word 0xfe3c2149  ! 64: STD_I	std	%r31, [%r16 + 0x0149]
	.word 0xb7641800  ! 66: MOVcc_R	<illegal instruction>
	.word 0xb834c000  ! 67: ORN_R	orn 	%r19, %r0, %r28
	mov	0x12b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf73ce1dc  ! 72: STDF_I	std	%f27, [0x01dc, %r19]
	.word 0xfc350000  ! 73: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xb5500000  ! 74: RDPR_TPC	<illegal instruction>
	.word 0xfa256010  ! 76: STW_I	stw	%r29, [%r21 + 0x0010]
	mov	0x5, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03d0000  ! 79: STD_R	std	%r24, [%r20 + %r0]
	.word 0xf63d0000  ! 80: STD_R	std	%r27, [%r20 + %r0]
	.word 0xb1540000  ! 81: RDPR_GL	<illegal instruction>
	.word 0x8994a029  ! 82: WRPR_TICK_I	wrpr	%r18, 0x0029, %tick
	.word 0xf87461cd  ! 85: STX_I	stx	%r28, [%r17 + 0x01cd]
	.word 0x8395a159  ! 86: WRPR_TNPC_I	wrpr	%r22, 0x0159, %tnpc
	.word 0xfe2dc000  ! 87: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xf93c8000  ! 88: STDF_R	std	%f28, [%r0, %r18]
	mov	0x311, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 91: RDPR_GL	rdpr	%-, %r25
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1520000  ! 93: RDPR_PIL	<illegal instruction>
	.word 0x8794218b  ! 95: WRPR_TT_I	wrpr	%r16, 0x018b, %tt
	.word 0xb7540000  ! 96: RDPR_GL	rdpr	%-, %r27
	.word 0xbcbc2174  ! 99: XNORcc_I	xnorcc 	%r16, 0x0174, %r30
	.word 0xf225a09f  ! 100: STW_I	stw	%r25, [%r22 + 0x009f]
	.word 0xbb359000  ! 102: SRLX_R	srlx	%r22, %r0, %r29
	.word 0x899561d4  ! 103: WRPR_TICK_I	wrpr	%r21, 0x01d4, %tick
	.word 0xb49dc000  ! 105: XORcc_R	xorcc 	%r23, %r0, %r26
	.word 0x899460b9  ! 108: WRPR_TICK_I	wrpr	%r17, 0x00b9, %tick
	.word 0xf03560ba  ! 111: STH_I	sth	%r24, [%r21 + 0x00ba]
	.word 0x83952062  ! 112: WRPR_TNPC_I	wrpr	%r20, 0x0062, %tnpc
	.word 0xfc35617d  ! 121: STH_I	sth	%r30, [%r21 + 0x017d]
	.word 0xb6a50000  ! 123: SUBcc_R	subcc 	%r20, %r0, %r27
	.word 0xfa24210f  ! 128: STW_I	stw	%r29, [%r16 + 0x010f]
	.word 0xb150c000  ! 131: RDPR_TT	rdpr	%tt, %r24
	.word 0xfe354000  ! 132: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf4344000  ! 133: STH_R	sth	%r26, [%r17 + %r0]
	setx	data_start_4, %g1, %r16
	.word 0xf635c000  ! 139: STH_R	sth	%r27, [%r23 + %r0]
	.word 0x9194a0d2  ! 143: WRPR_PIL_I	wrpr	%r18, 0x00d2, %pil
	mov	0x22a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 150: RDPR_TSTATE	rdpr	%tstate, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf73d6160  ! 156: STDF_I	std	%f27, [0x0160, %r21]
	.word 0xfe2ce0af  ! 157: STB_I	stb	%r31, [%r19 + 0x00af]
	.word 0xba44218c  ! 158: ADDC_I	addc 	%r16, 0x018c, %r29
	.word 0xbead21ca  ! 162: ANDNcc_I	andncc 	%r20, 0x01ca, %r31
	.word 0xfa348000  ! 163: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xfa3c2152  ! 166: STD_I	std	%r29, [%r16 + 0x0152]
	.word 0xf43d4000  ! 168: STD_R	std	%r26, [%r21 + %r0]
	.word 0xbf520000  ! 177: RDPR_PIL	<illegal instruction>
	.word 0xbb540000  ! 179: RDPR_GL	<illegal instruction>
	.word 0xf0354000  ! 181: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xf274607d  ! 183: STX_I	stx	%r25, [%r17 + 0x007d]
	.word 0x8394e0ca  ! 184: WRPR_TNPC_I	wrpr	%r19, 0x00ca, %tnpc
	.word 0xb73d0000  ! 185: SRA_R	sra 	%r20, %r0, %r27
	.word 0xf025a017  ! 188: STW_I	stw	%r24, [%r22 + 0x0017]
	.word 0xf0740000  ! 190: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xf62d8000  ! 192: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xbb510000  ! 193: RDPR_TICK	rdpr	%tick, %r29
	.word 0xfe254000  ! 197: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf8750000  ! 198: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xfb3c8000  ! 200: STDF_R	std	%f29, [%r0, %r18]
	.word 0xf22da1a5  ! 204: STB_I	stb	%r25, [%r22 + 0x01a5]
	.word 0xf4754000  ! 206: STX_R	stx	%r26, [%r21 + %r0]
	setx	data_start_0, %g1, %r21
	.word 0xb2bc4000  ! 214: XNORcc_R	xnorcc 	%r17, %r0, %r25
	mov	0x317, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 217: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb92dd000  ! 221: SLLX_R	sllx	%r23, %r0, %r28
	.word 0xf63d2083  ! 222: STD_I	std	%r27, [%r20 + 0x0083]
	.word 0xfa750000  ! 223: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xfe754000  ! 227: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xfc2c8000  ! 228: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xf22c0000  ! 229: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xfc3cc000  ! 230: STD_R	std	%r30, [%r19 + %r0]
	mov	0, %r12
	.word 0x8f930000  ! 233: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xba3ce1d8  ! 234: XNOR_I	xnor 	%r19, 0x01d8, %r29
	.word 0xfc3d60c9  ! 235: STD_I	std	%r30, [%r21 + 0x00c9]
	.word 0xf62d2198  ! 237: STB_I	stb	%r27, [%r20 + 0x0198]
	.word 0xfe24e01d  ! 239: STW_I	stw	%r31, [%r19 + 0x001d]
	.word 0xfc3c4000  ! 241: STD_R	std	%r30, [%r17 + %r0]
	.word 0xb035e097  ! 243: ORN_I	orn 	%r23, 0x0097, %r24
	.word 0xf43421a3  ! 244: STH_I	sth	%r26, [%r16 + 0x01a3]
	.word 0xf4744000  ! 245: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xf024a08f  ! 248: STW_I	stw	%r24, [%r18 + 0x008f]
	.word 0xbd7c0400  ! 249: MOVR_R	movre	%r16, %r0, %r30
	.word 0xbf540000  ! 254: RDPR_GL	rdpr	%-, %r31
	.word 0xf0748000  ! 256: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xf02c4000  ! 260: STB_R	stb	%r24, [%r17 + %r0]
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d0000  ! 263: STB_R	stb	%r24, [%r20 + %r0]
	mov	0x1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 268: RDPR_TNPC	<illegal instruction>
	.word 0xf33da121  ! 269: STDF_I	std	%f25, [0x0121, %r22]
	mov	2, %r12
	.word 0x8f930000  ! 270: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x131123cc00003d8d, %g1, %r10
	.word 0x839a8000  ! 272: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4340000  ! 274: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xb53da001  ! 277: SRA_I	sra 	%r22, 0x0001, %r26
	.word 0xb00cc000  ! 280: AND_R	and 	%r19, %r0, %r24
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994a024  ! 285: WRPR_TICK_I	wrpr	%r18, 0x0024, %tick
	.word 0xf63da076  ! 289: STD_I	std	%r27, [%r22 + 0x0076]
	.word 0xff3d61ef  ! 291: STDF_I	std	%f31, [0x01ef, %r21]
	.word 0xbac5a0e4  ! 292: ADDCcc_I	addccc 	%r22, 0x00e4, %r29
	mov	0x302, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3cc000  ! 297: STDF_R	std	%f31, [%r0, %r19]
	.word 0xf83460bd  ! 298: STH_I	sth	%r28, [%r17 + 0x00bd]
	.word 0xfd3c8000  ! 300: STDF_R	std	%f30, [%r0, %r18]
	.word 0x8994a15d  ! 301: WRPR_TICK_I	wrpr	%r18, 0x015d, %tick
	.word 0x8194200c  ! 303: WRPR_TPC_I	wrpr	%r16, 0x000c, %tpc
	.word 0xf23da1b0  ! 306: STD_I	std	%r25, [%r22 + 0x01b0]
	.word 0xfe3dc000  ! 307: STD_R	std	%r31, [%r23 + %r0]
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02ce04e  ! 313: STB_I	stb	%r24, [%r19 + 0x004e]
	.word 0xf83de119  ! 314: STD_I	std	%r28, [%r23 + 0x0119]
	.word 0xf63560ac  ! 315: STH_I	sth	%r27, [%r21 + 0x00ac]
	setx	0xd8cfd5b20000bcc9, %g1, %r10
	.word 0x819a8000  ! 317: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbe0ca0cc  ! 319: AND_I	and 	%r18, 0x00cc, %r31
	.word 0xf83c4000  ! 324: STD_R	std	%r28, [%r17 + %r0]
	.word 0xbb540000  ! 330: RDPR_GL	rdpr	%-, %r29
	mov	0x100, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc3ce0df  ! 333: STD_I	std	%r30, [%r19 + 0x00df]
	.word 0xb4c48000  ! 335: ADDCcc_R	addccc 	%r18, %r0, %r26
	.word 0xf23c8000  ! 341: STD_R	std	%r25, [%r18 + %r0]
	.word 0xb1480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf43ce038  ! 346: STD_I	std	%r26, [%r19 + 0x0038]
	.word 0xfa358000  ! 348: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xfe3c0000  ! 349: STD_R	std	%r31, [%r16 + %r0]
	.word 0xf22da13c  ! 354: STB_I	stb	%r25, [%r22 + 0x013c]
	.word 0xb43d4000  ! 355: XNOR_R	xnor 	%r21, %r0, %r26
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 361: RDPR_TPC	<illegal instruction>
	.word 0xf53ce138  ! 363: STDF_I	std	%f26, [0x0138, %r19]
	.word 0xfc3cc000  ! 365: STD_R	std	%r30, [%r19 + %r0]
	.word 0xf8358000  ! 366: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xb3500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xfa2d21e7  ! 370: STB_I	stb	%r29, [%r20 + 0x01e7]
	.word 0xf234c000  ! 372: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xf03c61a5  ! 373: STD_I	std	%r24, [%r17 + 0x01a5]
	.word 0xf8244000  ! 375: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xf425216b  ! 377: STW_I	stw	%r26, [%r20 + 0x016b]
	.word 0xfe2d0000  ! 379: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xf93d4000  ! 381: STDF_R	std	%f28, [%r0, %r21]
	.word 0xf23da152  ! 386: STD_I	std	%r25, [%r22 + 0x0152]
	.word 0xb2b4a0dd  ! 396: SUBCcc_I	orncc 	%r18, 0x00dd, %r25
	.word 0xfc2d6033  ! 399: STB_I	stb	%r30, [%r21 + 0x0033]
	.word 0xfc2c2021  ! 401: STB_I	stb	%r30, [%r16 + 0x0021]
	setx	data_start_6, %g1, %r17
	.word 0xf43d0000  ! 405: STD_R	std	%r26, [%r20 + %r0]
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02cc000  ! 409: STB_R	stb	%r24, [%r19 + %r0]
	mov	0, %r12
	.word 0x8f930000  ! 411: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	setx	0x49b6437600006b41, %g1, %r10
	.word 0x839a8000  ! 414: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x85838e3f0000ca1b, %g1, %r10
	.word 0x819a8000  ! 415: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9195615f  ! 417: WRPR_PIL_I	wrpr	%r21, 0x015f, %pil
	.word 0xf6252041  ! 418: STW_I	stw	%r27, [%r20 + 0x0041]
	.word 0xfb3de17b  ! 421: STDF_I	std	%f29, [0x017b, %r23]
	.word 0xf22c4000  ! 422: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xf42420bd  ! 423: STW_I	stw	%r26, [%r16 + 0x00bd]
	.word 0x8794e1aa  ! 424: WRPR_TT_I	wrpr	%r19, 0x01aa, %tt
	.word 0xfd3d4000  ! 427: STDF_R	std	%f30, [%r0, %r21]
	setx	data_start_3, %g1, %r21
	.word 0xf4346060  ! 431: STH_I	sth	%r26, [%r17 + 0x0060]
	.word 0xf13de0e5  ! 434: STDF_I	std	%f24, [0x00e5, %r23]
	.word 0xb751c000  ! 435: RDPR_TL	rdpr	%tl, %r27
	.word 0xb33d9000  ! 437: SRAX_R	srax	%r22, %r0, %r25
	.word 0x8794a060  ! 438: WRPR_TT_I	wrpr	%r18, 0x0060, %tt
	.word 0xb63de1ad  ! 440: XNOR_I	xnor 	%r23, 0x01ad, %r27
	.word 0xf42c4000  ! 441: STB_R	stb	%r26, [%r17 + %r0]
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6250000  ! 449: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xb8b521c4  ! 452: SUBCcc_I	orncc 	%r20, 0x01c4, %r28
	mov	0x3b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d2014  ! 456: STB_I	stb	%r24, [%r20 + 0x0014]
	.word 0xbe8de0bf  ! 457: ANDcc_I	andcc 	%r23, 0x00bf, %r31
	.word 0xf67420e7  ! 463: STX_I	stx	%r27, [%r16 + 0x00e7]
	.word 0xb7643801  ! 464: MOVcc_I	<illegal instruction>
	.word 0xb1480000  ! 470: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfe250000  ! 475: STW_R	stw	%r31, [%r20 + %r0]
	mov	0x29, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2461f3  ! 478: STW_I	stw	%r31, [%r17 + 0x01f3]
	.word 0xb3480000  ! 482: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbe9c4000  ! 483: XORcc_R	xorcc 	%r17, %r0, %r31
	.word 0xf23c4000  ! 484: STD_R	std	%r25, [%r17 + %r0]
	.word 0xb5510000  ! 486: RDPR_TICK	rdpr	%tick, %r26
	.word 0xb5643801  ! 488: MOVcc_I	<illegal instruction>
	.word 0xbb518000  ! 489: RDPR_PSTATE	<illegal instruction>
	.word 0x8194612f  ! 490: WRPR_TPC_I	wrpr	%r17, 0x012f, %tpc
	.word 0xf0258000  ! 491: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xfa344000  ! 494: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xfa34c000  ! 495: STH_R	sth	%r29, [%r19 + %r0]
	.word 0x8394e04d  ! 496: WRPR_TNPC_I	wrpr	%r19, 0x004d, %tnpc
	.word 0xfc2d4000  ! 503: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xb6344000  ! 506: SUBC_R	orn 	%r17, %r0, %r27
	.word 0xb1352001  ! 507: SRL_I	srl 	%r20, 0x0001, %r24
	.word 0xfc342169  ! 508: STH_I	sth	%r30, [%r16 + 0x0169]
	.word 0xf73dc000  ! 509: STDF_R	std	%f27, [%r0, %r23]
	.word 0xfe35c000  ! 511: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xfb3ca1f9  ! 512: STDF_I	std	%f29, [0x01f9, %r18]
	.word 0xf62d4000  ! 515: STB_R	stb	%r27, [%r21 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 516: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf024a072  ! 517: STW_I	stw	%r24, [%r18 + 0x0072]
	.word 0xb9508000  ! 519: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf33c0000  ! 524: STDF_R	std	%f25, [%r0, %r16]
	.word 0xfe2421ee  ! 526: STW_I	stw	%r31, [%r16 + 0x01ee]
	.word 0xf0240000  ! 527: STW_R	stw	%r24, [%r16 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 530: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8195e103  ! 533: WRPR_TPC_I	wrpr	%r23, 0x0103, %tpc
	.word 0xf22cc000  ! 536: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xfe2de0b8  ! 539: STB_I	stb	%r31, [%r23 + 0x00b8]
	.word 0x8994a015  ! 541: WRPR_TICK_I	wrpr	%r18, 0x0015, %tick
	.word 0xfa744000  ! 546: STX_R	stx	%r29, [%r17 + %r0]
	.word 0x85946076  ! 549: WRPR_TSTATE_I	wrpr	%r17, 0x0076, %tstate
	mov	2, %r12
	.word 0xa1930000  ! 550: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9643801  ! 556: MOVcc_I	<illegal instruction>
	.word 0xf33c0000  ! 557: STDF_R	std	%f25, [%r0, %r16]
	.word 0xfc3d6042  ! 559: STD_I	std	%r30, [%r21 + 0x0042]
	.word 0xb445c000  ! 560: ADDC_R	addc 	%r23, %r0, %r26
	.word 0xb23561b2  ! 561: ORN_I	orn 	%r21, 0x01b2, %r25
	.word 0xb1508000  ! 563: RDPR_TSTATE	rdpr	%tstate, %r24
	setx	data_start_7, %g1, %r17
	.word 0xf0358000  ! 568: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xb53d9000  ! 574: SRAX_R	srax	%r22, %r0, %r26
	.word 0xb09cc000  ! 575: XORcc_R	xorcc 	%r19, %r0, %r24
	.word 0xfd3dc000  ! 578: STDF_R	std	%f30, [%r0, %r23]
	.word 0xf0348000  ! 579: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf4244000  ! 581: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xf43461ae  ! 583: STH_I	sth	%r26, [%r17 + 0x01ae]
	.word 0xf73de0ad  ! 589: STDF_I	std	%f27, [0x00ad, %r23]
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe342178  ! 597: STH_I	sth	%r31, [%r16 + 0x0178]
	.word 0xfe2de118  ! 599: STB_I	stb	%r31, [%r23 + 0x0118]
	.word 0xbf504000  ! 601: RDPR_TNPC	<illegal instruction>
	.word 0xfa2c8000  ! 602: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xfd3c0000  ! 605: STDF_R	std	%f30, [%r0, %r16]
	setx	0xaa70e7920000698d, %g1, %r10
	.word 0x839a8000  ! 607: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf83de050  ! 609: STD_I	std	%r28, [%r23 + 0x0050]
	.word 0xb0b4a1cd  ! 611: ORNcc_I	orncc 	%r18, 0x01cd, %r24
	.word 0xf6752066  ! 612: STX_I	stx	%r27, [%r20 + 0x0066]
	mov	0x112, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 621: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xff3c0000  ! 623: STDF_R	std	%f31, [%r0, %r16]
	.word 0xb9540000  ! 626: RDPR_GL	<illegal instruction>
	.word 0xf0340000  ! 628: STH_R	sth	%r24, [%r16 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 629: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb88de178  ! 641: ANDcc_I	andcc 	%r23, 0x0178, %r28
	.word 0x8794e0b4  ! 645: WRPR_TT_I	wrpr	%r19, 0x00b4, %tt
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595e15d  ! 649: WRPR_TSTATE_I	wrpr	%r23, 0x015d, %tstate
	.word 0xf42c8000  ! 651: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf675a18c  ! 655: STX_I	stx	%r27, [%r22 + 0x018c]
	.word 0xb634e096  ! 659: ORN_I	orn 	%r19, 0x0096, %r27
	.word 0xfa2de1c6  ! 660: STB_I	stb	%r29, [%r23 + 0x01c6]
	.word 0x8194a021  ! 664: WRPR_TPC_I	wrpr	%r18, 0x0021, %tpc
	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394a112  ! 666: WRPR_TNPC_I	wrpr	%r18, 0x0112, %tnpc
	.word 0xb02d8000  ! 669: ANDN_R	andn 	%r22, %r0, %r24
	.word 0xbe3c4000  ! 670: XNOR_R	xnor 	%r17, %r0, %r31
	.word 0xb7358000  ! 671: SRL_R	srl 	%r22, %r0, %r27
	.word 0xf62c4000  ! 677: STB_R	stb	%r27, [%r17 + %r0]
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba25e101  ! 682: SUB_I	sub 	%r23, 0x0101, %r29
	.word 0xf0744000  ! 687: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xfc35215f  ! 688: STH_I	sth	%r30, [%r20 + 0x015f]
	.word 0xfe25c000  ! 689: STW_R	stw	%r31, [%r23 + %r0]
	.word 0x8395e0e2  ! 691: WRPR_TNPC_I	wrpr	%r23, 0x00e2, %tnpc
	.word 0xb9643801  ! 697: MOVcc_I	<illegal instruction>
	.word 0xb9508000  ! 698: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf93d0000  ! 699: STDF_R	std	%f28, [%r0, %r20]
	.word 0xf02da076  ! 703: STB_I	stb	%r24, [%r22 + 0x0076]
	.word 0xf2344000  ! 704: STH_R	sth	%r25, [%r17 + %r0]
	mov	0x31d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83c8000  ! 712: XNOR_R	xnor 	%r18, %r0, %r28
	.word 0x919420a2  ! 714: WRPR_PIL_I	wrpr	%r16, 0x00a2, %pil
	.word 0xf275a19b  ! 715: STX_I	stx	%r25, [%r22 + 0x019b]
	.word 0xf8242160  ! 717: STW_I	stw	%r28, [%r16 + 0x0160]
	.word 0xf274c000  ! 718: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf43cc000  ! 720: STD_R	std	%r26, [%r19 + %r0]
	.word 0xf02ca06e  ! 726: STB_I	stb	%r24, [%r18 + 0x006e]
	.word 0xb7518000  ! 728: RDPR_PSTATE	rdpr	%pstate, %r27
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf224e19f  ! 730: STW_I	stw	%r25, [%r19 + 0x019f]
	.word 0xfa758000  ! 732: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xfa3da165  ! 737: STD_I	std	%r29, [%r22 + 0x0165]
	.word 0xb351c000  ! 742: RDPR_TL	<illegal instruction>
	.word 0x8995a119  ! 743: WRPR_TICK_I	wrpr	%r22, 0x0119, %tick
	.word 0xbd540000  ! 744: RDPR_GL	rdpr	%-, %r30
	.word 0xfa3dc000  ! 745: STD_R	std	%r29, [%r23 + %r0]
	.word 0xfc2ce1d1  ! 763: STB_I	stb	%r30, [%r19 + 0x01d1]
	.word 0xbf520000  ! 776: RDPR_PIL	<illegal instruction>
	.word 0xfe248000  ! 777: STW_R	stw	%r31, [%r18 + %r0]
	.word 0x8994215b  ! 781: WRPR_TICK_I	wrpr	%r16, 0x015b, %tick
	.word 0xf53da1b1  ! 782: STDF_I	std	%f26, [0x01b1, %r22]
	.word 0xb8c5219e  ! 783: ADDCcc_I	addccc 	%r20, 0x019e, %r28
	.word 0x8195e1be  ! 784: WRPR_TPC_I	wrpr	%r23, 0x01be, %tpc
	.word 0xbf7c4400  ! 785: MOVR_R	movre	%r17, %r0, %r31
	.word 0xf824a0e9  ! 786: STW_I	stw	%r28, [%r18 + 0x00e9]
	.word 0xb03d0000  ! 788: XNOR_R	xnor 	%r20, %r0, %r24
	.word 0xf63521a3  ! 800: STH_I	sth	%r27, [%r20 + 0x01a3]
	.word 0xfc3c612e  ! 802: STD_I	std	%r30, [%r17 + 0x012e]
	mov	0x106, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4758000  ! 807: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xfd3d8000  ! 809: STDF_R	std	%f30, [%r0, %r22]
	.word 0xf73ca00e  ! 810: STDF_I	std	%f27, [0x000e, %r18]
	setx	0x3266acfd0000db8d, %g1, %r10
	.word 0x819a8000  ! 811: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf02d8000  ! 814: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xf42de0b9  ! 815: STB_I	stb	%r26, [%r23 + 0x00b9]
	.word 0x8d95e0bd  ! 817: WRPR_PSTATE_I	wrpr	%r23, 0x00bd, %pstate
	setx	data_start_3, %g1, %r23
	setx	0x59062a0a0000f8d3, %g1, %r10
	.word 0x819a8000  ! 819: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x879420c4  ! 823: WRPR_TT_I	wrpr	%r16, 0x00c4, %tt
	.word 0x8794201d  ! 825: WRPR_TT_I	wrpr	%r16, 0x001d, %tt
	.word 0xf42d4000  ! 828: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xb1504000  ! 829: RDPR_TNPC	rdpr	%tnpc, %r24
	mov	0, %r12
	.word 0xa1930000  ! 830: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf22c6011  ! 834: STB_I	stb	%r25, [%r17 + 0x0011]
	.word 0xf834a025  ! 841: STH_I	sth	%r28, [%r18 + 0x0025]
	.word 0x91946126  ! 842: WRPR_PIL_I	wrpr	%r17, 0x0126, %pil
	.word 0xb73cc000  ! 846: SRA_R	sra 	%r19, %r0, %r27
	.word 0xf22421e0  ! 848: STW_I	stw	%r25, [%r16 + 0x01e0]
	.word 0xf835a18b  ! 850: STH_I	sth	%r28, [%r22 + 0x018b]
	.word 0x83946187  ! 857: WRPR_TNPC_I	wrpr	%r17, 0x0187, %tnpc
	.word 0xbf504000  ! 860: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xb12c5000  ! 865: SLLX_R	sllx	%r17, %r0, %r24
	.word 0xbb504000  ! 867: RDPR_TNPC	<illegal instruction>
	setx	0xa77d126800000f90, %g1, %r10
	.word 0x839a8000  ! 868: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_3, %g1, %r20
	.word 0xb5510000  ! 872: RDPR_TICK	rdpr	%tick, %r26
	mov	0, %r12
	.word 0xa1930000  ! 877: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x91956188  ! 879: WRPR_PIL_I	wrpr	%r21, 0x0188, %pil
	.word 0x8595a15d  ! 882: WRPR_TSTATE_I	wrpr	%r22, 0x015d, %tstate
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf43da08d  ! 890: STD_I	std	%r26, [%r22 + 0x008d]
	.word 0xfe24c000  ! 891: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf83cc000  ! 892: STD_R	std	%r28, [%r19 + %r0]
	.word 0xf03da077  ! 895: STD_I	std	%r24, [%r22 + 0x0077]
	.word 0xf824a024  ! 898: STW_I	stw	%r28, [%r18 + 0x0024]
	.word 0xf8258000  ! 899: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xf6256192  ! 902: STW_I	stw	%r27, [%r21 + 0x0192]
	.word 0xf62dc000  ! 903: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xfa3ca1f8  ! 905: STD_I	std	%r29, [%r18 + 0x01f8]
	.word 0xf0256107  ! 908: STW_I	stw	%r24, [%r21 + 0x0107]
	.word 0xb3480000  ! 920: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8994602c  ! 921: WRPR_TICK_I	wrpr	%r17, 0x002c, %tick
	.word 0x8794607c  ! 922: WRPR_TT_I	wrpr	%r17, 0x007c, %tt
	.word 0xf424a101  ! 926: STW_I	stw	%r26, [%r18 + 0x0101]
	.word 0xb09d0000  ! 928: XORcc_R	xorcc 	%r20, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe74c000  ! 931: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xb3520000  ! 934: RDPR_PIL	rdpr	%pil, %r25
	.word 0x8195a1f8  ! 937: WRPR_TPC_I	wrpr	%r22, 0x01f8, %tpc
	.word 0xf07460ce  ! 939: STX_I	stx	%r24, [%r17 + 0x00ce]
	.word 0xf13de003  ! 941: STDF_I	std	%f24, [0x0003, %r23]
	.word 0xf93dc000  ! 942: STDF_R	std	%f28, [%r0, %r23]
	.word 0xb92dc000  ! 943: SLL_R	sll 	%r23, %r0, %r28
	.word 0xb044e186  ! 945: ADDC_I	addc 	%r19, 0x0186, %r24
	.word 0xfc748000  ! 947: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf2750000  ! 948: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xf42c0000  ! 951: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xfe3c21d4  ! 957: STD_I	std	%r31, [%r16 + 0x01d4]
	setx	data_start_5, %g1, %r20
	.word 0xf6744000  ! 961: STX_R	stx	%r27, [%r17 + %r0]
	mov	0x213, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a4a1c8  ! 964: SUBcc_I	subcc 	%r18, 0x01c8, %r27
	.word 0xf53de160  ! 965: STDF_I	std	%f26, [0x0160, %r23]
	.word 0xf42cc000  ! 970: STB_R	stb	%r26, [%r19 + %r0]
	setx	data_start_5, %g1, %r23
	.word 0xb1540000  ! 975: RDPR_GL	rdpr	%-, %r24
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 982: RDPR_TNPC	<illegal instruction>
	.word 0xf93d6077  ! 984: STDF_I	std	%f28, [0x0077, %r21]
	.word 0xb5504000  ! 987: RDPR_TNPC	<illegal instruction>
	.word 0x8194206b  ! 991: WRPR_TPC_I	wrpr	%r16, 0x006b, %tpc
	.word 0xbb35c000  ! 992: SRL_R	srl 	%r23, %r0, %r29
	.word 0x8394a131  ! 994: WRPR_TNPC_I	wrpr	%r18, 0x0131, %tnpc
	.word 0xf2740000  ! 998: STX_R	stx	%r25, [%r16 + %r0]
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
	.word 0x8d9561a8  ! 1: WRPR_PSTATE_I	wrpr	%r21, 0x01a8, %pstate
	.word 0xf8054000  ! 5: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0x859420f8  ! 6: WRPR_TSTATE_I	wrpr	%r16, 0x00f8, %tstate
	.word 0xb32d1000  ! 8: SLLX_R	sllx	%r20, %r0, %r25
	.word 0xb3352001  ! 9: SRL_I	srl 	%r20, 0x0001, %r25
	.word 0xfc1c0000  ! 11: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xf65d0000  ! 17: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xf91de072  ! 19: LDDF_I	ldd	[%r23, 0x0072], %f28
	.word 0xf05c4000  ! 20: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0xf65ce17f  ! 22: LDX_I	ldx	[%r19 + 0x017f], %r27
	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x85952080  ! 25: WRPR_TSTATE_I	wrpr	%r20, 0x0080, %tstate
	.word 0xf0058000  ! 27: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xba0c0000  ! 29: AND_R	and 	%r16, %r0, %r29
	.word 0x8794e150  ! 30: WRPR_TT_I	wrpr	%r19, 0x0150, %tt
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa15e1a0  ! 33: LDUH_I	lduh	[%r23 + 0x01a0], %r29
	.word 0xf11c2105  ! 39: LDDF_I	ldd	[%r16, 0x0105], %f24
	mov	0x37, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa1ca151  ! 42: LDD_I	ldd	[%r18 + 0x0151], %r29
	.word 0xb73c5000  ! 43: SRAX_R	srax	%r17, %r0, %r27
	.word 0xf85c2022  ! 46: LDX_I	ldx	[%r16 + 0x0022], %r28
	.word 0xfc1d8000  ! 47: LDD_R	ldd	[%r22 + %r0], %r30
	.word 0xf45460ef  ! 51: LDSH_I	ldsh	[%r17 + 0x00ef], %r26
	.word 0xbd520000  ! 52: RDPR_PIL	<illegal instruction>
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3c1000  ! 60: SRAX_R	srax	%r16, %r0, %r29
	.word 0xf6450000  ! 63: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xfe5de1fa  ! 65: LDX_I	ldx	[%r23 + 0x01fa], %r31
	.word 0xbf641800  ! 66: MOVcc_R	<illegal instruction>
	.word 0xb4340000  ! 67: ORN_R	orn 	%r16, %r0, %r26
	mov	0x10a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 74: RDPR_TPC	<illegal instruction>
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 81: RDPR_GL	<illegal instruction>
	.word 0x8995e081  ! 82: WRPR_TICK_I	wrpr	%r23, 0x0081, %tick
	.word 0xf81cc000  ! 84: LDD_R	ldd	[%r19 + %r0], %r28
	.word 0x8394a1ee  ! 86: WRPR_TNPC_I	wrpr	%r18, 0x01ee, %tnpc
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf61ca108  ! 90: LDD_I	ldd	[%r18 + 0x0108], %r27
	.word 0xbf540000  ! 91: RDPR_GL	<illegal instruction>
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 93: RDPR_PIL	<illegal instruction>
	.word 0xfe14e1b3  ! 94: LDUH_I	lduh	[%r19 + 0x01b3], %r31
	.word 0x8794613f  ! 95: WRPR_TT_I	wrpr	%r17, 0x013f, %tt
	.word 0xb9540000  ! 96: RDPR_GL	<illegal instruction>
	.word 0xf40c8000  ! 97: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xbebc204c  ! 99: XNORcc_I	xnorcc 	%r16, 0x004c, %r31
	.word 0xb5351000  ! 102: SRLX_R	srlx	%r20, %r0, %r26
	.word 0x899420c8  ! 103: WRPR_TICK_I	wrpr	%r16, 0x00c8, %tick
	.word 0xb29c0000  ! 105: XORcc_R	xorcc 	%r16, %r0, %r25
	.word 0xf044a1e1  ! 106: LDSW_I	ldsw	[%r18 + 0x01e1], %r24
	.word 0xf654a1cd  ! 107: LDSH_I	ldsh	[%r18 + 0x01cd], %r27
	.word 0x8994e04f  ! 108: WRPR_TICK_I	wrpr	%r19, 0x004f, %tick
	.word 0x8394a060  ! 112: WRPR_TNPC_I	wrpr	%r18, 0x0060, %tnpc
	.word 0xfe44e148  ! 113: LDSW_I	ldsw	[%r19 + 0x0148], %r31
	.word 0xfc0d2155  ! 117: LDUB_I	ldub	[%r20 + 0x0155], %r30
	.word 0xfe1da134  ! 119: LDD_I	ldd	[%r22 + 0x0134], %r31
	.word 0xbaa44000  ! 123: SUBcc_R	subcc 	%r17, %r0, %r29
	.word 0xf11d8000  ! 124: LDDF_R	ldd	[%r22, %r0], %f24
	.word 0xfe0c0000  ! 126: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xbd50c000  ! 131: RDPR_TT	<illegal instruction>
	.word 0xf01c4000  ! 135: LDD_R	ldd	[%r17 + %r0], %r24
	.word 0xf71ce11b  ! 136: LDDF_I	ldd	[%r19, 0x011b], %f27
	setx	data_start_6, %g1, %r17
	.word 0xfa048000  ! 140: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xf84cc000  ! 141: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0x9195a167  ! 143: WRPR_PIL_I	wrpr	%r22, 0x0167, %pil
	.word 0xfa1cc000  ! 147: LDD_R	ldd	[%r19 + %r0], %r29
	mov	0x32c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf61cc000  ! 149: LDD_R	ldd	[%r19 + %r0], %r27
	.word 0xb3508000  ! 150: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba446029  ! 158: ADDC_I	addc 	%r17, 0x0029, %r29
	.word 0xf20d0000  ! 160: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xf11c4000  ! 161: LDDF_R	ldd	[%r17, %r0], %f24
	.word 0xbaad20ee  ! 162: ANDNcc_I	andncc 	%r20, 0x00ee, %r29
	.word 0xf61c2142  ! 165: LDD_I	ldd	[%r16 + 0x0142], %r27
	.word 0xf21c8000  ! 171: LDD_R	ldd	[%r18 + %r0], %r25
	.word 0xf61da022  ! 173: LDD_I	ldd	[%r22 + 0x0022], %r27
	.word 0xf605e071  ! 175: LDUW_I	lduw	[%r23 + 0x0071], %r27
	.word 0xb5520000  ! 177: RDPR_PIL	<illegal instruction>
	.word 0xf05ca0e8  ! 178: LDX_I	ldx	[%r18 + 0x00e8], %r24
	.word 0xb1540000  ! 179: RDPR_GL	<illegal instruction>
	.word 0x8395a071  ! 184: WRPR_TNPC_I	wrpr	%r22, 0x0071, %tnpc
	.word 0xb93c4000  ! 185: SRA_R	sra 	%r17, %r0, %r28
	.word 0xf6050000  ! 186: LDUW_R	lduw	[%r20 + %r0], %r27
	.word 0xb7510000  ! 193: RDPR_TICK	<illegal instruction>
	.word 0xff1c0000  ! 195: LDDF_R	ldd	[%r16, %r0], %f31
	setx	data_start_6, %g1, %r23
	.word 0xfa5c4000  ! 210: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xfc4c0000  ! 211: LDSB_R	ldsb	[%r16 + %r0], %r30
	.word 0xfe1c2182  ! 212: LDD_I	ldd	[%r16 + 0x0182], %r31
	.word 0xb4bc0000  ! 214: XNORcc_R	xnorcc 	%r16, %r0, %r26
	.word 0xf65da158  ! 215: LDX_I	ldx	[%r22 + 0x0158], %r27
	mov	0x134, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 217: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf2154000  ! 219: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0xb32c1000  ! 221: SLLX_R	sllx	%r16, %r0, %r25
	.word 0xf444c000  ! 225: LDSW_R	ldsw	[%r19 + %r0], %r26
	mov	1, %r12
	.word 0x8f930000  ! 233: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbe3c217b  ! 234: XNOR_I	xnor 	%r16, 0x017b, %r31
	.word 0xfa0d60a1  ! 236: LDUB_I	ldub	[%r21 + 0x00a1], %r29
	.word 0xfa0d8000  ! 238: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xb03460ee  ! 243: ORN_I	orn 	%r17, 0x00ee, %r24
	.word 0xf615c000  ! 247: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xbf7c4400  ! 249: MOVR_R	movre	%r17, %r0, %r31
	.word 0xf244a1fd  ! 250: LDSW_I	ldsw	[%r18 + 0x01fd], %r25
	.word 0xf25dc000  ! 251: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0xf81d8000  ! 252: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xb5540000  ! 254: RDPR_GL	rdpr	%-, %r26
	.word 0xf00cc000  ! 255: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xf85d8000  ! 258: LDX_R	ldx	[%r22 + %r0], %r28
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfd1c4000  ! 264: LDDF_R	ldd	[%r17, %r0], %f30
	mov	0x20, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa140000  ! 267: LDUH_R	lduh	[%r16 + %r0], %r29
	.word 0xb7504000  ! 268: RDPR_TNPC	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 270: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x6102bfbd00007d04, %g1, %r10
	.word 0x839a8000  ! 272: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x13c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73ce001  ! 277: SRA_I	sra 	%r19, 0x0001, %r27
	.word 0xfa55e18a  ! 278: LDSH_I	ldsh	[%r23 + 0x018a], %r29
	.word 0xb40d8000  ! 280: AND_R	and 	%r22, %r0, %r26
	mov	0x1b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf045a0d2  ! 284: LDSW_I	ldsw	[%r22 + 0x00d2], %r24
	.word 0x8995e1f2  ! 285: WRPR_TICK_I	wrpr	%r23, 0x01f2, %tick
	.word 0xfa1561a0  ! 290: LDUH_I	lduh	[%r21 + 0x01a0], %r29
	.word 0xbec52189  ! 292: ADDCcc_I	addccc 	%r20, 0x0189, %r31
	.word 0xf04521ab  ! 293: LDSW_I	ldsw	[%r20 + 0x01ab], %r24
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc45c000  ! 296: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0x8995e195  ! 301: WRPR_TICK_I	wrpr	%r23, 0x0195, %tick
	.word 0xfa5d4000  ! 302: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0x8194a0e0  ! 303: WRPR_TPC_I	wrpr	%r18, 0x00e0, %tpc
	mov	0x1d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00c0000  ! 312: LDUB_R	ldub	[%r16 + %r0], %r24
	.word 0xfa458000  ! 316: LDSW_R	ldsw	[%r22 + %r0], %r29
	setx	0x6d0dd233000098da, %g1, %r10
	.word 0x819a8000  ! 317: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb00d2152  ! 319: AND_I	and 	%r20, 0x0152, %r24
	.word 0xf44d8000  ! 322: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xbf540000  ! 330: RDPR_GL	<illegal instruction>
	mov	0x32a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c4c000  ! 335: ADDCcc_R	addccc 	%r19, %r0, %r26
	.word 0xf004e16a  ! 339: LDUW_I	lduw	[%r19 + 0x016a], %r24
	.word 0xfe5c0000  ! 340: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xb1480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfc440000  ! 347: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xf20c4000  ! 351: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0xbe3c8000  ! 355: XNOR_R	xnor 	%r18, %r0, %r31
	.word 0xfa54c000  ! 356: LDSH_R	ldsh	[%r19 + %r0], %r29
	mov	0x3d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc148000  ! 359: LDUH_R	lduh	[%r18 + %r0], %r30
	.word 0xbd500000  ! 361: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xfe4d21d7  ! 390: LDSB_I	ldsb	[%r20 + 0x01d7], %r31
	.word 0xf25560ff  ! 392: LDSH_I	ldsh	[%r21 + 0x00ff], %r25
	.word 0xf85d2011  ! 393: LDX_I	ldx	[%r20 + 0x0011], %r28
	.word 0xf60ca08e  ! 395: LDUB_I	ldub	[%r18 + 0x008e], %r27
	.word 0xb4b5a1ba  ! 396: SUBCcc_I	orncc 	%r22, 0x01ba, %r26
	.word 0xf815e1dc  ! 400: LDUH_I	lduh	[%r23 + 0x01dc], %r28
	setx	data_start_1, %g1, %r22
	.word 0xf815208e  ! 406: LDUH_I	lduh	[%r20 + 0x008e], %r28
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf654e168  ! 410: LDSH_I	ldsh	[%r19 + 0x0168], %r27
	mov	0, %r12
	.word 0x8f930000  ! 411: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf84ca171  ! 412: LDSB_I	ldsb	[%r18 + 0x0171], %r28
	mov	0x329, %o0
	ta	T_SEND_THRD_INTR
	setx	0xfdbb058200008ad4, %g1, %r10
	.word 0x839a8000  ! 414: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x195ec8650000ccda, %g1, %r10
	.word 0x819a8000  ! 415: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9194613f  ! 417: WRPR_PIL_I	wrpr	%r17, 0x013f, %pil
	.word 0xfa5d615c  ! 419: LDX_I	ldx	[%r21 + 0x015c], %r29
	.word 0x87956020  ! 424: WRPR_TT_I	wrpr	%r21, 0x0020, %tt
	.word 0xf00c6021  ! 426: LDUB_I	ldub	[%r17 + 0x0021], %r24
	setx	data_start_5, %g1, %r23
	.word 0xb151c000  ! 435: RDPR_TL	<illegal instruction>
	.word 0xfa456025  ! 436: LDSW_I	ldsw	[%r21 + 0x0025], %r29
	.word 0xbf3d5000  ! 437: SRAX_R	srax	%r21, %r0, %r31
	.word 0x8794e17d  ! 438: WRPR_TT_I	wrpr	%r19, 0x017d, %tt
	.word 0xfe04e053  ! 439: LDUW_I	lduw	[%r19 + 0x0053], %r31
	.word 0xba3d61b6  ! 440: XNOR_I	xnor 	%r21, 0x01b6, %r29
	.word 0xfc44a1cb  ! 445: LDSW_I	ldsw	[%r18 + 0x01cb], %r30
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa44608c  ! 450: LDSW_I	ldsw	[%r17 + 0x008c], %r29
	.word 0xf20d21d4  ! 451: LDUB_I	ldub	[%r20 + 0x01d4], %r25
	.word 0xb6b5e00d  ! 452: SUBCcc_I	orncc 	%r23, 0x000d, %r27
	mov	0x109, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe44a16c  ! 455: LDSW_I	ldsw	[%r18 + 0x016c], %r31
	.word 0xb68d20f5  ! 457: ANDcc_I	andcc 	%r20, 0x00f5, %r27
	.word 0xb5643801  ! 464: MOVcc_I	<illegal instruction>
	.word 0xf8152089  ! 467: LDUH_I	lduh	[%r20 + 0x0089], %r28
	.word 0xf45de000  ! 469: LDX_I	ldx	[%r23 + 0x0000], %r26
	.word 0xb5480000  ! 470: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf004e06f  ! 472: LDUW_I	lduw	[%r19 + 0x006f], %r24
	.word 0xf205c000  ! 473: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xf45cc000  ! 476: LDX_R	ldx	[%r19 + %r0], %r26
	mov	0x2b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c8000  ! 479: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xf2552084  ! 481: LDSH_I	ldsh	[%r20 + 0x0084], %r25
	.word 0xbb480000  ! 482: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbc9c0000  ! 483: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xf255605c  ! 485: LDSH_I	ldsh	[%r21 + 0x005c], %r25
	.word 0xb9510000  ! 486: RDPR_TICK	<illegal instruction>
	.word 0xbb643801  ! 488: MOVcc_I	<illegal instruction>
	.word 0xb3518000  ! 489: RDPR_PSTATE	<illegal instruction>
	.word 0x8195e165  ! 490: WRPR_TPC_I	wrpr	%r23, 0x0165, %tpc
	.word 0xfa1dc000  ! 493: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0x83942198  ! 496: WRPR_TNPC_I	wrpr	%r16, 0x0198, %tnpc
	.word 0xf614c000  ! 498: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xf80c60b8  ! 499: LDUB_I	ldub	[%r17 + 0x00b8], %r28
	.word 0xf0540000  ! 500: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xf05da1ad  ! 505: LDX_I	ldx	[%r22 + 0x01ad], %r24
	.word 0xb035c000  ! 506: SUBC_R	orn 	%r23, %r0, %r24
	.word 0xb734e001  ! 507: SRL_I	srl 	%r19, 0x0001, %r27
	.word 0xf44c0000  ! 514: LDSB_R	ldsb	[%r16 + %r0], %r26
	mov	0, %r12
	.word 0x8f930000  ! 516: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbd508000  ! 519: RDPR_TSTATE	<illegal instruction>
	.word 0xfa14e0ca  ! 528: LDUH_I	lduh	[%r19 + 0x00ca], %r29
	mov	0, %r12
	.word 0xa1930000  ! 530: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8195e128  ! 533: WRPR_TPC_I	wrpr	%r23, 0x0128, %tpc
	.word 0xf00de050  ! 538: LDUB_I	ldub	[%r23 + 0x0050], %r24
	.word 0x8994a065  ! 541: WRPR_TICK_I	wrpr	%r18, 0x0065, %tick
	.word 0x859520a1  ! 549: WRPR_TSTATE_I	wrpr	%r20, 0x00a1, %tstate
	mov	2, %r12
	.word 0xa1930000  ! 550: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf61d61ed  ! 552: LDD_I	ldd	[%r21 + 0x01ed], %r27
	.word 0xf05ca0f0  ! 553: LDX_I	ldx	[%r18 + 0x00f0], %r24
	.word 0xfe5d206e  ! 555: LDX_I	ldx	[%r20 + 0x006e], %r31
	.word 0xb7643801  ! 556: MOVcc_I	<illegal instruction>
	.word 0xb8444000  ! 560: ADDC_R	addc 	%r17, %r0, %r28
	.word 0xba35219d  ! 561: ORN_I	orn 	%r20, 0x019d, %r29
	.word 0xf31d0000  ! 562: LDDF_R	ldd	[%r20, %r0], %f25
	.word 0xbf508000  ! 563: RDPR_TSTATE	<illegal instruction>
	.word 0xfc5d8000  ! 564: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xfa5ca196  ! 565: LDX_I	ldx	[%r18 + 0x0196], %r29
	setx	data_start_6, %g1, %r20
	.word 0xf80d4000  ! 569: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xf84420e9  ! 572: LDSW_I	ldsw	[%r16 + 0x00e9], %r28
	.word 0xfe040000  ! 573: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0xb73dd000  ! 574: SRAX_R	srax	%r23, %r0, %r27
	.word 0xb89c8000  ! 575: XORcc_R	xorcc 	%r18, %r0, %r28
	mov	0x22d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5de0c6  ! 595: LDX_I	ldx	[%r23 + 0x00c6], %r31
	.word 0xf8144000  ! 600: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xbd504000  ! 601: RDPR_TNPC	<illegal instruction>
	.word 0xfb1de071  ! 604: LDDF_I	ldd	[%r23, 0x0071], %f29
	setx	0x1f847e8a00002ecb, %g1, %r10
	.word 0x839a8000  ! 607: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb2b4a135  ! 611: ORNcc_I	orncc 	%r18, 0x0135, %r25
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5c8000  ! 618: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xf85da164  ! 620: LDX_I	ldx	[%r22 + 0x0164], %r28
	.word 0xbd500000  ! 621: RDPR_TPC	<illegal instruction>
	.word 0xf65cc000  ! 622: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xf81dc000  ! 624: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0xf05cc000  ! 625: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xbd540000  ! 626: RDPR_GL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 629: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf8554000  ! 631: LDSH_R	ldsh	[%r21 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf24da096  ! 637: LDSB_I	ldsb	[%r22 + 0x0096], %r25
	.word 0xfa0d61a2  ! 639: LDUB_I	ldub	[%r21 + 0x01a2], %r29
	.word 0xb88d2022  ! 641: ANDcc_I	andcc 	%r20, 0x0022, %r28
	.word 0xf20dc000  ! 643: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0x879420bb  ! 645: WRPR_TT_I	wrpr	%r16, 0x00bb, %tt
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594e0d2  ! 649: WRPR_TSTATE_I	wrpr	%r19, 0x00d2, %tstate
	.word 0xf6544000  ! 652: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xfa14a017  ! 658: LDUH_I	lduh	[%r18 + 0x0017], %r29
	.word 0xb4356178  ! 659: ORN_I	orn 	%r21, 0x0178, %r26
	.word 0xfe0d6106  ! 661: LDUB_I	ldub	[%r21 + 0x0106], %r31
	.word 0xf044e0f4  ! 662: LDSW_I	ldsw	[%r19 + 0x00f4], %r24
	.word 0x8195e184  ! 664: WRPR_TPC_I	wrpr	%r23, 0x0184, %tpc
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395e0fb  ! 666: WRPR_TNPC_I	wrpr	%r23, 0x00fb, %tnpc
	.word 0xb62c4000  ! 669: ANDN_R	andn 	%r17, %r0, %r27
	.word 0xb83c4000  ! 670: XNOR_R	xnor 	%r17, %r0, %r28
	.word 0xb9350000  ! 671: SRL_R	srl 	%r20, %r0, %r28
	.word 0xf8058000  ! 678: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xf444c000  ! 680: LDSW_R	ldsw	[%r19 + %r0], %r26
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb424a000  ! 682: SUB_I	sub 	%r18, 0x0000, %r26
	.word 0xfe5c0000  ! 684: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xf01c8000  ! 686: LDD_R	ldd	[%r18 + %r0], %r24
	.word 0x839521e9  ! 691: WRPR_TNPC_I	wrpr	%r20, 0x01e9, %tnpc
	.word 0xfc5561e4  ! 693: LDSH_I	ldsh	[%r21 + 0x01e4], %r30
	.word 0xfc450000  ! 694: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xf4150000  ! 696: LDUH_R	lduh	[%r20 + %r0], %r26
	.word 0xb9643801  ! 697: MOVcc_I	<illegal instruction>
	.word 0xb1508000  ! 698: RDPR_TSTATE	<illegal instruction>
	.word 0xfa14a131  ! 709: LDUH_I	lduh	[%r18 + 0x0131], %r29
	mov	0x20e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4ca143  ! 711: LDSB_I	ldsb	[%r18 + 0x0143], %r31
	.word 0xbe3dc000  ! 712: XNOR_R	xnor 	%r23, %r0, %r31
	.word 0xf21c208e  ! 713: LDD_I	ldd	[%r16 + 0x008e], %r25
	.word 0x9194a174  ! 714: WRPR_PIL_I	wrpr	%r18, 0x0174, %pil
	.word 0xb3518000  ! 728: RDPR_PSTATE	<illegal instruction>
	mov	0x228, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4560e1  ! 736: LDSW_I	ldsw	[%r21 + 0x00e1], %r30
	.word 0xf80d6003  ! 739: LDUB_I	ldub	[%r21 + 0x0003], %r28
	.word 0xf6444000  ! 740: LDSW_R	ldsw	[%r17 + %r0], %r27
	.word 0xb751c000  ! 742: RDPR_TL	<illegal instruction>
	.word 0x8995e11f  ! 743: WRPR_TICK_I	wrpr	%r23, 0x011f, %tick
	.word 0xbd540000  ! 744: RDPR_GL	<illegal instruction>
	.word 0xf8048000  ! 748: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xf41461b5  ! 754: LDUH_I	lduh	[%r17 + 0x01b5], %r26
	.word 0xfc14e154  ! 757: LDUH_I	lduh	[%r19 + 0x0154], %r30
	.word 0xfa4c60ff  ! 759: LDSB_I	ldsb	[%r17 + 0x00ff], %r29
	.word 0xfc1d0000  ! 760: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xf00ce106  ! 767: LDUB_I	ldub	[%r19 + 0x0106], %r24
	.word 0xf815c000  ! 768: LDUH_R	lduh	[%r23 + %r0], %r28
	.word 0xf844a067  ! 769: LDSW_I	ldsw	[%r18 + 0x0067], %r28
	.word 0xf0054000  ! 770: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xf41de06e  ! 775: LDD_I	ldd	[%r23 + 0x006e], %r26
	.word 0xb1520000  ! 776: RDPR_PIL	<illegal instruction>
	.word 0xf85d8000  ! 778: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xf24d204c  ! 780: LDSB_I	ldsb	[%r20 + 0x004c], %r25
	.word 0x8995e1c4  ! 781: WRPR_TICK_I	wrpr	%r23, 0x01c4, %tick
	.word 0xbcc4a1c2  ! 783: ADDCcc_I	addccc 	%r18, 0x01c2, %r30
	.word 0x819521cc  ! 784: WRPR_TPC_I	wrpr	%r20, 0x01cc, %tpc
	.word 0xb97d8400  ! 785: MOVR_R	movre	%r22, %r0, %r28
	.word 0xb03cc000  ! 788: XNOR_R	xnor 	%r19, %r0, %r24
	.word 0xf60c610a  ! 789: LDUB_I	ldub	[%r17 + 0x010a], %r27
	.word 0xf85ce060  ! 791: LDX_I	ldx	[%r19 + 0x0060], %r28
	.word 0xfe158000  ! 792: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0xf31c0000  ! 793: LDDF_R	ldd	[%r16, %r0], %f25
	.word 0xfa1de0c8  ! 795: LDD_I	ldd	[%r23 + 0x00c8], %r29
	mov	0x13c, %o0
	ta	T_SEND_THRD_INTR
	setx	0x815fa5b20000bfd1, %g1, %r10
	.word 0x819a8000  ! 811: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf00dc000  ! 813: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xfd1d4000  ! 816: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0x8d946003  ! 817: WRPR_PSTATE_I	wrpr	%r17, 0x0003, %pstate
	setx	data_start_4, %g1, %r18
	setx	0xfb461eac0000e840, %g1, %r10
	.word 0x819a8000  ! 819: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf4454000  ! 822: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0x8794219d  ! 823: WRPR_TT_I	wrpr	%r16, 0x019d, %tt
	.word 0x8794200d  ! 825: WRPR_TT_I	wrpr	%r16, 0x000d, %tt
	.word 0xf8556140  ! 827: LDSH_I	ldsh	[%r21 + 0x0140], %r28
	.word 0xb3504000  ! 829: RDPR_TNPC	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 830: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf60d4000  ! 832: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xf31ce12c  ! 833: LDDF_I	ldd	[%r19, 0x012c], %f25
	.word 0x919561ef  ! 842: WRPR_PIL_I	wrpr	%r21, 0x01ef, %pil
	.word 0xfc45a01b  ! 844: LDSW_I	ldsw	[%r22 + 0x001b], %r30
	.word 0xb73dc000  ! 846: SRA_R	sra 	%r23, %r0, %r27
	.word 0xfa1c8000  ! 851: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0xfd1c4000  ! 852: LDDF_R	ldd	[%r17, %r0], %f30
	.word 0xf615a110  ! 853: LDUH_I	lduh	[%r22 + 0x0110], %r27
	.word 0xfa544000  ! 854: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0x839420fe  ! 857: WRPR_TNPC_I	wrpr	%r16, 0x00fe, %tnpc
	.word 0xbb504000  ! 860: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xf01d60cf  ! 861: LDD_I	ldd	[%r21 + 0x00cf], %r24
	.word 0xf8444000  ! 862: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xb32d9000  ! 865: SLLX_R	sllx	%r22, %r0, %r25
	.word 0xb3504000  ! 867: RDPR_TNPC	<illegal instruction>
	setx	0x29d1bfe10000e81e, %g1, %r10
	.word 0x839a8000  ! 868: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf31ca086  ! 870: LDDF_I	ldd	[%r18, 0x0086], %f25
	setx	data_start_3, %g1, %r22
	.word 0xb3510000  ! 872: RDPR_TICK	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 877: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf80c0000  ! 878: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0x9195a0ed  ! 879: WRPR_PIL_I	wrpr	%r22, 0x00ed, %pil
	.word 0x8595a0b8  ! 882: WRPR_TSTATE_I	wrpr	%r22, 0x00b8, %tstate
	.word 0xf40c4000  ! 886: LDUB_R	ldub	[%r17 + %r0], %r26
	mov	0x36, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc05c000  ! 897: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xf65cc000  ! 900: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xf4040000  ! 907: LDUW_R	lduw	[%r16 + %r0], %r26
	.word 0xf0458000  ! 910: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xfa0cc000  ! 912: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xf80461c2  ! 916: LDUW_I	lduw	[%r17 + 0x01c2], %r28
	.word 0xfe144000  ! 917: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xf20d0000  ! 918: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xb3480000  ! 920: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8995e006  ! 921: WRPR_TICK_I	wrpr	%r23, 0x0006, %tick
	.word 0x8794213f  ! 922: WRPR_TT_I	wrpr	%r16, 0x013f, %tt
	.word 0xf91d4000  ! 925: LDDF_R	ldd	[%r21, %r0], %f28
	.word 0xfa552194  ! 927: LDSH_I	ldsh	[%r20 + 0x0194], %r29
	.word 0xb89c4000  ! 928: XORcc_R	xorcc 	%r17, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd520000  ! 934: RDPR_PIL	<illegal instruction>
	.word 0xf51d4000  ! 936: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0x8195a0e2  ! 937: WRPR_TPC_I	wrpr	%r22, 0x00e2, %tpc
	.word 0xfe5d0000  ! 940: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xbd2c0000  ! 943: SLL_R	sll 	%r16, %r0, %r30
	.word 0xbc44e017  ! 945: ADDC_I	addc 	%r19, 0x0017, %r30
	.word 0xf2442032  ! 946: LDSW_I	ldsw	[%r16 + 0x0032], %r25
	.word 0xfa05e1bc  ! 953: LDUW_I	lduw	[%r23 + 0x01bc], %r29
	.word 0xf84ce031  ! 955: LDSB_I	ldsb	[%r19 + 0x0031], %r28
	setx	data_start_0, %g1, %r17
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0a4e180  ! 964: SUBcc_I	subcc 	%r19, 0x0180, %r24
	.word 0xf31ce170  ! 967: LDDF_I	ldd	[%r19, 0x0170], %f25
	.word 0xfd1c4000  ! 968: LDDF_R	ldd	[%r17, %r0], %f30
	setx	data_start_3, %g1, %r19
	.word 0xb7540000  ! 975: RDPR_GL	<illegal instruction>
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	mov	0x3c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf205e128  ! 980: LDUW_I	lduw	[%r23 + 0x0128], %r25
	.word 0xfe5561b0  ! 981: LDSH_I	ldsh	[%r21 + 0x01b0], %r31
	.word 0xbb504000  ! 982: RDPR_TNPC	<illegal instruction>
	.word 0xf2144000  ! 983: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xb3504000  ! 987: RDPR_TNPC	<illegal instruction>
	.word 0xf64c8000  ! 988: LDSB_R	ldsb	[%r18 + %r0], %r27
	.word 0xf91cc000  ! 989: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0x819561aa  ! 991: WRPR_TPC_I	wrpr	%r21, 0x01aa, %tpc
	.word 0xb534c000  ! 992: SRL_R	srl 	%r19, %r0, %r26
	.word 0x8395e16f  ! 994: WRPR_TNPC_I	wrpr	%r23, 0x016f, %tnpc
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0x8d94617a  ! 1: WRPR_PSTATE_I	wrpr	%r17, 0x017a, %pstate
	.word 0xb7a88820  ! 2: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb9abc820  ! 3: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0x8595e15e  ! 6: WRPR_TSTATE_I	wrpr	%r23, 0x015e, %tstate
	.word 0xb72d5000  ! 8: SLLX_R	sllx	%r21, %r0, %r27
	.word 0xbd35a001  ! 9: SRL_I	srl 	%r22, 0x0001, %r30
	.word 0xb5a589a0  ! 18: FDIVs	fdivs	%f22, %f0, %f26
	mov	0x12a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x85946031  ! 25: WRPR_TSTATE_I	wrpr	%r17, 0x0031, %tstate
	.word 0xbbaa4820  ! 28: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb80c0000  ! 29: AND_R	and 	%r16, %r0, %r28
	.word 0x87946044  ! 30: WRPR_TT_I	wrpr	%r17, 0x0044, %tt
	mov	0x208, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 36: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	mov	0x320, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3dd000  ! 43: SRAX_R	srax	%r23, %r0, %r31
	.word 0xb3a58940  ! 48: FMULd	fmuld	%f22, %f0, %f56
	.word 0xb9aa8820  ! 50: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb7520000  ! 52: RDPR_PIL	<illegal instruction>
	.word 0xb7a81c20  ! 55: FMOVRGEZ	dis not found

	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53d9000  ! 60: SRAX_R	srax	%r22, %r0, %r26
	.word 0xbfa449c0  ! 61: FDIVd	fdivd	%f48, %f0, %f62
	.word 0xb3a4c840  ! 62: FADDd	faddd	%f50, %f0, %f56
	.word 0xb9641800  ! 66: MOVcc_R	<illegal instruction>
	.word 0xb4340000  ! 67: ORN_R	orn 	%r16, %r0, %r26
	mov	0x0, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab4820  ! 69: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb1a00540  ! 71: FSQRTd	fsqrt	
	.word 0xb9500000  ! 74: RDPR_TPC	<illegal instruction>
	.word 0xbda448c0  ! 75: FSUBd	fsubd	%f48, %f0, %f30
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 81: RDPR_GL	<illegal instruction>
	.word 0x899521d9  ! 82: WRPR_TICK_I	wrpr	%r20, 0x01d9, %tick
	.word 0x839520a0  ! 86: WRPR_TNPC_I	wrpr	%r20, 0x00a0, %tnpc
	mov	0x222, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 91: RDPR_GL	<illegal instruction>
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1520000  ! 93: RDPR_PIL	<illegal instruction>
	.word 0x8794a1c4  ! 95: WRPR_TT_I	wrpr	%r18, 0x01c4, %tt
	.word 0xb9540000  ! 96: RDPR_GL	<illegal instruction>
	.word 0xb4bda1ff  ! 99: XNORcc_I	xnorcc 	%r22, 0x01ff, %r26
	.word 0xb7a509e0  ! 101: FDIVq	dis not found

	.word 0xbd349000  ! 102: SRLX_R	srlx	%r18, %r0, %r30
	.word 0x89946127  ! 103: WRPR_TICK_I	wrpr	%r17, 0x0127, %tick
	.word 0xb89c8000  ! 105: XORcc_R	xorcc 	%r18, %r0, %r28
	.word 0x8994a1d5  ! 108: WRPR_TICK_I	wrpr	%r18, 0x01d5, %tick
	.word 0x8395e00d  ! 112: WRPR_TNPC_I	wrpr	%r23, 0x000d, %tnpc
	.word 0xbfa84820  ! 116: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbda88820  ! 120: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a80c20  ! 122: FMOVRLZ	dis not found

	.word 0xb8a44000  ! 123: SUBcc_R	subcc 	%r17, %r0, %r28
	.word 0xbba00020  ! 125: FMOVs	fmovs	%f0, %f29
	.word 0xbba54860  ! 130: FADDq	dis not found

	.word 0xb750c000  ! 131: RDPR_TT	<illegal instruction>
	setx	data_start_7, %g1, %r21
	.word 0x9194200b  ! 143: WRPR_PIL_I	wrpr	%r16, 0x000b, %pil
	.word 0xbfab0820  ! 146: FMOVGU	fmovs	%fcc1, %f0, %f31
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 150: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a80c20  ! 153: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa50940  ! 155: FMULd	fmuld	%f20, %f0, %f62
	.word 0xb6446159  ! 158: ADDC_I	addc 	%r17, 0x0159, %r27
	.word 0xb6ac2080  ! 162: ANDNcc_I	andncc 	%r16, 0x0080, %r27
	.word 0xbba80820  ! 167: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb3a81420  ! 169: FMOVRNZ	dis not found

	.word 0xb1a448c0  ! 174: FSUBd	fsubd	%f48, %f0, %f24
	.word 0xbfa508a0  ! 176: FSUBs	fsubs	%f20, %f0, %f31
	.word 0xbd520000  ! 177: RDPR_PIL	<illegal instruction>
	.word 0xbb540000  ! 179: RDPR_GL	<illegal instruction>
	.word 0xbfa00520  ! 182: FSQRTs	fsqrt	
	.word 0x8395a18f  ! 184: WRPR_TNPC_I	wrpr	%r22, 0x018f, %tnpc
	.word 0xbf3d4000  ! 185: SRA_R	sra 	%r21, %r0, %r31
	.word 0xb9510000  ! 193: RDPR_TICK	<illegal instruction>
	.word 0xb9a00020  ! 196: FMOVs	fmovs	%f0, %f28
	.word 0xb5a489a0  ! 202: FDIVs	fdivs	%f18, %f0, %f26
	.word 0xbfa4c940  ! 203: FMULd	fmuld	%f50, %f0, %f62
	.word 0xbda00020  ! 207: FMOVs	fmovs	%f0, %f30
	.word 0xbfa4c960  ! 208: FMULq	dis not found

	setx	data_start_1, %g1, %r21
	.word 0xbfa80420  ! 213: FMOVRZ	dis not found

	.word 0xb2bd8000  ! 214: XNORcc_R	xnorcc 	%r22, %r0, %r25
	mov	0x1d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 217: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbda44820  ! 220: FADDs	fadds	%f17, %f0, %f30
	.word 0xbd2c9000  ! 221: SLLX_R	sllx	%r18, %r0, %r30
	mov	1, %r12
	.word 0x8f930000  ! 233: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb43ca1c5  ! 234: XNOR_I	xnor 	%r18, 0x01c5, %r26
	.word 0xb83520dc  ! 243: ORN_I	orn 	%r20, 0x00dc, %r28
	.word 0xb9a80820  ! 246: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb97c0400  ! 249: MOVR_R	movre	%r16, %r0, %r28
	.word 0xbd540000  ! 254: RDPR_GL	<illegal instruction>
	.word 0xb9a409c0  ! 261: FDIVd	fdivd	%f16, %f0, %f28
	mov	0x223, %o0
	ta	T_SEND_THRD_INTR
	mov	0x23c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 268: RDPR_TNPC	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 270: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xe15b933c0000cf5f, %g1, %r10
	.word 0x839a8000  ! 272: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x31, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 275: FMOVRZ	dis not found

	.word 0xb33d2001  ! 277: SRA_I	sra 	%r20, 0x0001, %r25
	.word 0xbda90820  ! 279: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbc0c8000  ! 280: AND_R	and 	%r18, %r0, %r30
	mov	0x23f, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994e032  ! 285: WRPR_TICK_I	wrpr	%r19, 0x0032, %tick
	.word 0xb1a44960  ! 286: FMULq	dis not found

	.word 0xbfa84820  ! 287: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb8c56173  ! 292: ADDCcc_I	addccc 	%r21, 0x0173, %r28
	mov	0x18, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a509e0  ! 299: FDIVq	dis not found

	.word 0x8994a08b  ! 301: WRPR_TICK_I	wrpr	%r18, 0x008b, %tick
	.word 0x8195e03d  ! 303: WRPR_TPC_I	wrpr	%r23, 0x003d, %tpc
	.word 0xb9a00020  ! 304: FMOVs	fmovs	%f0, %f28
	mov	0x219, %o0
	ta	T_SEND_THRD_INTR
	setx	0xdb8569130000af08, %g1, %r10
	.word 0x819a8000  ! 317: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa5c960  ! 318: FMULq	dis not found

	.word 0xbc0de1de  ! 319: AND_I	and 	%r23, 0x01de, %r30
	.word 0xb3a489e0  ! 321: FDIVq	dis not found

	.word 0xb1aa8820  ! 328: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbb540000  ! 330: RDPR_GL	<illegal instruction>
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba40940  ! 332: FMULd	fmuld	%f16, %f0, %f60
	.word 0xbac54000  ! 335: ADDCcc_R	addccc 	%r21, %r0, %r29
	.word 0xb9a408e0  ! 336: FSUBq	dis not found

	.word 0xb1a00540  ! 338: FSQRTd	fsqrt	
	.word 0xbf480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb1a48960  ! 353: FMULq	dis not found

	.word 0xbc3d8000  ! 355: XNOR_R	xnor 	%r22, %r0, %r30
	.word 0xbda449a0  ! 357: FDIVs	fdivs	%f17, %f0, %f30
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 360: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb3500000  ! 361: RDPR_TPC	<illegal instruction>
	.word 0xb7a54940  ! 362: FMULd	fmuld	%f52, %f0, %f58
	.word 0xb3a548e0  ! 368: FSUBq	dis not found

	.word 0xb5500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xbdaac820  ! 374: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a44920  ! 376: FMULs	fmuls	%f17, %f0, %f27
	.word 0xbba5c8e0  ! 380: FSUBq	dis not found

	.word 0xb3a81420  ! 385: FMOVRNZ	dis not found

	.word 0xbba00020  ! 389: FMOVs	fmovs	%f0, %f29
	.word 0xbeb5e19a  ! 396: SUBCcc_I	orncc 	%r23, 0x019a, %r31
	.word 0xbdabc820  ! 398: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb3a81c20  ! 402: FMOVRGEZ	dis not found

	.word 0xb3a54840  ! 403: FADDd	faddd	%f52, %f0, %f56
	setx	data_start_6, %g1, %r17
	mov	0x231, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 411: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	setx	0xca8a585a00001899, %g1, %r10
	.word 0x839a8000  ! 414: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x8b90704400005e13, %g1, %r10
	.word 0x819a8000  ! 415: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9195a07b  ! 417: WRPR_PIL_I	wrpr	%r22, 0x007b, %pil
	.word 0x879461ef  ! 424: WRPR_TT_I	wrpr	%r17, 0x01ef, %tt
	.word 0xb5a54820  ! 428: FADDs	fadds	%f21, %f0, %f26
	setx	data_start_1, %g1, %r20
	.word 0xb7a84820  ! 433: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbb51c000  ! 435: RDPR_TL	<illegal instruction>
	.word 0xbd3c9000  ! 437: SRAX_R	srax	%r18, %r0, %r30
	.word 0x8795e1e2  ! 438: WRPR_TT_I	wrpr	%r23, 0x01e2, %tt
	.word 0xba3ca10d  ! 440: XNOR_I	xnor 	%r18, 0x010d, %r29
	mov	0x210, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa54840  ! 447: FADDd	faddd	%f52, %f0, %f62
	.word 0xb2b420c0  ! 452: SUBCcc_I	orncc 	%r16, 0x00c0, %r25
	mov	0x127, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a50840  ! 454: FADDd	faddd	%f20, %f0, %f26
	.word 0xba8d2186  ! 457: ANDcc_I	andcc 	%r20, 0x0186, %r29
	.word 0xbda90820  ! 458: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00560  ! 459: FSQRTq	fsqrt	
	.word 0xbda409e0  ! 460: FDIVq	dis not found

	.word 0xb9a81420  ! 461: FMOVRNZ	dis not found

	.word 0xbfaac820  ! 462: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb7643801  ! 464: MOVcc_I	<illegal instruction>
	.word 0xb9a00560  ! 465: FSQRTq	fsqrt	
	.word 0xb1aa0820  ! 468: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbf480000  ! 470: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	mov	0x23c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 482: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb89cc000  ! 483: XORcc_R	xorcc 	%r19, %r0, %r28
	.word 0xb7510000  ! 486: RDPR_TICK	<illegal instruction>
	.word 0xb7643801  ! 488: MOVcc_I	<illegal instruction>
	.word 0xbd518000  ! 489: RDPR_PSTATE	<illegal instruction>
	.word 0x81942051  ! 490: WRPR_TPC_I	wrpr	%r16, 0x0051, %tpc
	.word 0x8394e1a2  ! 496: WRPR_TNPC_I	wrpr	%r19, 0x01a2, %tnpc
	.word 0xbfa408c0  ! 497: FSUBd	fsubd	%f16, %f0, %f62
	.word 0xb1a5c9c0  ! 502: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xb8358000  ! 506: SUBC_R	orn 	%r22, %r0, %r28
	.word 0xb734a001  ! 507: SRL_I	srl 	%r18, 0x0001, %r27
	mov	0, %r12
	.word 0x8f930000  ! 516: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf508000  ! 519: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a84820  ! 529: FMOVE	fmovs	%fcc1, %f0, %f27
	mov	0, %r12
	.word 0xa1930000  ! 530: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda9c820  ! 531: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbba48840  ! 532: FADDd	faddd	%f18, %f0, %f60
	.word 0x81952081  ! 533: WRPR_TPC_I	wrpr	%r20, 0x0081, %tpc
	.word 0xbba00540  ! 534: FSQRTd	fsqrt	
	.word 0xbfa00040  ! 535: FMOVd	fmovd	%f0, %f62
	.word 0xbfa488c0  ! 537: FSUBd	fsubd	%f18, %f0, %f62
	.word 0xbda00020  ! 540: FMOVs	fmovs	%f0, %f30
	.word 0x8994a119  ! 541: WRPR_TICK_I	wrpr	%r18, 0x0119, %tick
	.word 0xbfab4820  ! 544: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb3a5c820  ! 545: FADDs	fadds	%f23, %f0, %f25
	.word 0xb1a80820  ! 548: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0x8594a04b  ! 549: WRPR_TSTATE_I	wrpr	%r18, 0x004b, %tstate
	mov	0, %r12
	.word 0xa1930000  ! 550: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5643801  ! 556: MOVcc_I	<illegal instruction>
	.word 0xb0444000  ! 560: ADDC_R	addc 	%r17, %r0, %r24
	.word 0xbc3520ae  ! 561: ORN_I	orn 	%r20, 0x00ae, %r30
	.word 0xb5508000  ! 563: RDPR_TSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r19
	.word 0xb1a80820  ! 567: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbfa80820  ! 570: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb5a9c820  ! 571: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb53dd000  ! 574: SRAX_R	srax	%r23, %r0, %r26
	.word 0xbe9d0000  ! 575: XORcc_R	xorcc 	%r20, %r0, %r31
	.word 0xbba90820  ! 577: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb5a00560  ! 582: FSQRTq	fsqrt	
	.word 0xbda88820  ! 588: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb3aa0820  ! 590: FMOVA	fmovs	%fcc1, %f0, %f25
	mov	0x123, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 601: RDPR_TNPC	<illegal instruction>
	setx	0xa1bbe14f0000ef0a, %g1, %r10
	.word 0x839a8000  ! 607: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfa81c20  ! 610: FMOVRGEZ	dis not found

	.word 0xb4b561e2  ! 611: ORNcc_I	orncc 	%r21, 0x01e2, %r26
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba489a0  ! 615: FDIVs	fdivs	%f18, %f0, %f29
	.word 0xb9a80420  ! 619: FMOVRZ	dis not found

	.word 0xb7500000  ! 621: RDPR_TPC	<illegal instruction>
	.word 0xbd540000  ! 626: RDPR_GL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 629: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda44960  ! 632: FMULq	dis not found

	.word 0xb7a54920  ! 633: FMULs	fmuls	%f21, %f0, %f27
	.word 0xb7a80420  ! 635: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a00560  ! 640: FSQRTq	fsqrt	
	.word 0xb28de19a  ! 641: ANDcc_I	andcc 	%r23, 0x019a, %r25
	.word 0xb7a548e0  ! 644: FSUBq	dis not found

	.word 0x879420c0  ! 645: WRPR_TT_I	wrpr	%r16, 0x00c0, %tt
	mov	0x108, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595209d  ! 649: WRPR_TSTATE_I	wrpr	%r20, 0x009d, %tstate
	.word 0xbba00540  ! 650: FSQRTd	fsqrt	
	.word 0xbba00560  ! 653: FSQRTq	fsqrt	
	.word 0xbfab0820  ! 656: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xbc3420fa  ! 659: ORN_I	orn 	%r16, 0x00fa, %r30
	.word 0x8194e1e7  ! 664: WRPR_TPC_I	wrpr	%r19, 0x01e7, %tpc
	mov	0x21b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394e0dc  ! 666: WRPR_TNPC_I	wrpr	%r19, 0x00dc, %tnpc
	.word 0xb7aa8820  ! 667: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbc2d0000  ! 669: ANDN_R	andn 	%r20, %r0, %r30
	.word 0xb63c8000  ! 670: XNOR_R	xnor 	%r18, %r0, %r27
	.word 0xb534c000  ! 671: SRL_R	srl 	%r19, %r0, %r26
	.word 0xb5a509a0  ! 673: FDIVs	fdivs	%f20, %f0, %f26
	.word 0xbfa508e0  ! 679: FSUBq	dis not found

	mov	0x33f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe25204b  ! 682: SUB_I	sub 	%r20, 0x004b, %r31
	.word 0xb9a5c9a0  ! 683: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xb5a88820  ! 690: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0x83952152  ! 691: WRPR_TNPC_I	wrpr	%r20, 0x0152, %tnpc
	.word 0xb5643801  ! 697: MOVcc_I	<illegal instruction>
	.word 0xb1508000  ! 698: RDPR_TSTATE	<illegal instruction>
	.word 0xbba408c0  ! 700: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xb5a488c0  ! 702: FSUBd	fsubd	%f18, %f0, %f26
	.word 0xbba80820  ! 705: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb3a80820  ! 706: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb5a00520  ! 707: FSQRTs	fsqrt	
	.word 0xb1a00520  ! 708: FSQRTs	fsqrt	
	mov	0x313, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63d8000  ! 712: XNOR_R	xnor 	%r22, %r0, %r27
	.word 0x9195a0cb  ! 714: WRPR_PIL_I	wrpr	%r22, 0x00cb, %pil
	.word 0xbfa5c940  ! 716: FMULd	fmuld	%f54, %f0, %f62
	.word 0xb7abc820  ! 719: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb1ab8820  ! 723: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb5a4c9c0  ! 724: FDIVd	fdivd	%f50, %f0, %f26
	.word 0xbfa54860  ! 725: FADDq	dis not found

	.word 0xbba588a0  ! 727: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xb3518000  ! 728: RDPR_PSTATE	<illegal instruction>
	mov	0x9, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c8c0  ! 738: FSUBd	fsubd	%f50, %f0, %f28
	.word 0xbfa58960  ! 741: FMULq	dis not found

	.word 0xbb51c000  ! 742: RDPR_TL	<illegal instruction>
	.word 0x8995a175  ! 743: WRPR_TICK_I	wrpr	%r22, 0x0175, %tick
	.word 0xb1540000  ! 744: RDPR_GL	<illegal instruction>
	.word 0xb5a94820  ! 747: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb5a58940  ! 749: FMULd	fmuld	%f22, %f0, %f26
	.word 0xb3a80420  ! 750: FMOVRZ	dis not found

	.word 0xb7a4c9a0  ! 751: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb1a549a0  ! 755: FDIVs	fdivs	%f21, %f0, %f24
	.word 0xb3a00040  ! 756: FMOVd	fmovd	%f0, %f56
	.word 0xb7a54960  ! 758: FMULq	dis not found

	.word 0xb3a408a0  ! 761: FSUBs	fsubs	%f16, %f0, %f25
	.word 0xb5a9c820  ! 766: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbba58860  ! 771: FADDq	dis not found

	.word 0xb5a8c820  ! 772: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb1520000  ! 776: RDPR_PIL	<illegal instruction>
	.word 0x8994609e  ! 781: WRPR_TICK_I	wrpr	%r17, 0x009e, %tick
	.word 0xb6c4e040  ! 783: ADDCcc_I	addccc 	%r19, 0x0040, %r27
	.word 0x8194a0f0  ! 784: WRPR_TPC_I	wrpr	%r18, 0x00f0, %tpc
	.word 0xb77c0400  ! 785: MOVR_R	movre	%r16, %r0, %r27
	.word 0xb63d8000  ! 788: XNOR_R	xnor 	%r22, %r0, %r27
	.word 0xb7a81820  ! 796: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbba4c920  ! 797: FMULs	fmuls	%f19, %f0, %f29
	.word 0xb3ab8820  ! 801: FMOVPOS	fmovs	%fcc1, %f0, %f25
	mov	0x301, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c8a0  ! 805: FSUBs	fsubs	%f23, %f0, %f26
	.word 0xb3a548c0  ! 806: FSUBd	fsubd	%f52, %f0, %f56
	.word 0xb1a54860  ! 808: FADDq	dis not found

	setx	0x1ad8f45500007bd8, %g1, %r10
	.word 0x819a8000  ! 811: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d9520cd  ! 817: WRPR_PSTATE_I	wrpr	%r20, 0x00cd, %pstate
	setx	data_start_2, %g1, %r23
	setx	0x2cacf1170000fe98, %g1, %r10
	.word 0x819a8000  ! 819: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa00520  ! 821: FSQRTs	fsqrt	
	.word 0x879520aa  ! 823: WRPR_TT_I	wrpr	%r20, 0x00aa, %tt
	.word 0x879420c6  ! 825: WRPR_TT_I	wrpr	%r16, 0x00c6, %tt
	.word 0xb9aa4820  ! 826: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbd504000  ! 829: RDPR_TNPC	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 830: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a81820  ! 831: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb5ab4820  ! 836: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb3a94820  ! 840: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0x9195619e  ! 842: WRPR_PIL_I	wrpr	%r21, 0x019e, %pil
	.word 0xbd3dc000  ! 846: SRA_R	sra 	%r23, %r0, %r30
	.word 0xb1a488a0  ! 847: FSUBs	fsubs	%f18, %f0, %f24
	.word 0xbdaa4820  ! 855: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a88820  ! 856: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0x8395e145  ! 857: WRPR_TNPC_I	wrpr	%r23, 0x0145, %tnpc
	.word 0xbf504000  ! 860: RDPR_TNPC	<illegal instruction>
	.word 0xb7a80420  ! 864: FMOVRZ	dis not found

	.word 0xb92cd000  ! 865: SLLX_R	sllx	%r19, %r0, %r28
	.word 0xbd504000  ! 867: RDPR_TNPC	<illegal instruction>
	setx	0xa903e67800005a9f, %g1, %r10
	.word 0x839a8000  ! 868: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a81420  ! 869: FMOVRNZ	dis not found

	setx	data_start_6, %g1, %r16
	.word 0xb7510000  ! 872: RDPR_TICK	<illegal instruction>
	.word 0xb5a508e0  ! 874: FSUBq	dis not found

	mov	0, %r12
	.word 0xa1930000  ! 877: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x91942115  ! 879: WRPR_PIL_I	wrpr	%r16, 0x0115, %pil
	.word 0xbfa81c20  ! 881: FMOVRGEZ	dis not found

	.word 0x8595e022  ! 882: WRPR_TSTATE_I	wrpr	%r23, 0x0022, %tstate
	.word 0xbda00040  ! 887: FMOVd	fmovd	%f0, %f30
	mov	0x315, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00040  ! 894: FMOVd	fmovd	%f0, %f60
	.word 0xb3a94820  ! 896: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbba58920  ! 901: FMULs	fmuls	%f22, %f0, %f29
	.word 0xb7a50860  ! 906: FADDq	dis not found

	.word 0xb3a58860  ! 909: FADDq	dis not found

	.word 0xbba00540  ! 911: FSQRTd	fsqrt	
	.word 0xb5a588c0  ! 914: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xbfa448e0  ! 919: FSUBq	dis not found

	.word 0xb5480000  ! 920: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x8994e007  ! 921: WRPR_TICK_I	wrpr	%r19, 0x0007, %tick
	.word 0x87942123  ! 922: WRPR_TT_I	wrpr	%r16, 0x0123, %tt
	.word 0xb9a549e0  ! 923: FDIVq	dis not found

	.word 0xbda88820  ! 924: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb89d4000  ! 928: XORcc_R	xorcc 	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a50860  ! 930: FADDq	dis not found

	.word 0xb7520000  ! 934: RDPR_PIL	<illegal instruction>
	.word 0xbfa81420  ! 935: FMOVRNZ	dis not found

	.word 0x8195217f  ! 937: WRPR_TPC_I	wrpr	%r20, 0x017f, %tpc
	.word 0xb52c0000  ! 943: SLL_R	sll 	%r16, %r0, %r26
	.word 0xba4520e2  ! 945: ADDC_I	addc 	%r20, 0x00e2, %r29
	.word 0xbfa9c820  ! 950: FMOVVS	fmovs	%fcc1, %f0, %f31
	setx	data_start_5, %g1, %r18
	.word 0xb1a00540  ! 959: FSQRTd	fsqrt	
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea421be  ! 964: SUBcc_I	subcc 	%r16, 0x01be, %r31
	.word 0xb1a54920  ! 972: FMULs	fmuls	%f21, %f0, %f24
	setx	data_start_1, %g1, %r21
	.word 0xbda44940  ! 974: FMULd	fmuld	%f48, %f0, %f30
	.word 0xb1540000  ! 975: RDPR_GL	<illegal instruction>
	mov	0x22, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 979: FSQRTd	fsqrt	
	.word 0xbb504000  ! 982: RDPR_TNPC	<illegal instruction>
	.word 0xb9a409e0  ! 985: FDIVq	dis not found

	.word 0xb7504000  ! 987: RDPR_TNPC	<illegal instruction>
	.word 0x8195e1b2  ! 991: WRPR_TPC_I	wrpr	%r23, 0x01b2, %tpc
	.word 0xb9350000  ! 992: SRL_R	srl 	%r20, %r0, %r28
	.word 0x8395a078  ! 994: WRPR_TNPC_I	wrpr	%r22, 0x0078, %tnpc
	.word 0xb1a409a0  ! 995: FDIVs	fdivs	%f16, %f0, %f24
	.word 0xbba80820  ! 996: FMOVN	fmovs	%fcc1, %f0, %f29

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

	.xword	0xe940ac5daebd601f
	.xword	0xeb38edf344f8f08c
	.xword	0x60e0b9721b8d2f93
	.xword	0x07d56cd2ac004e46
	.xword	0xc4338a37a58c6389
	.xword	0xe1b1ae4d6947ab95
	.xword	0x65faa020c8a39197
	.xword	0x83bd1300d8472209
	.xword	0x07d96ef9a8b93870
	.xword	0xbe744faba3a94b0e
	.xword	0x1ab417d16549841b
	.xword	0x1697ab625bb283c5
	.xword	0xcf24ae5782df1cb6
	.xword	0x2b986d02d22060a9
	.xword	0x8cbe57f67f21281a
	.xword	0x6c711b4f88c8da29
	.xword	0xf53e4a6977fd538d
	.xword	0xf821710c32a5acba
	.xword	0xe8948c51382a1319
	.xword	0x6bcdba9800e77e0b
	.xword	0x2423d05de23844e4
	.xword	0x233b5b299e3f0e0e
	.xword	0xc3a5ffea79530075
	.xword	0x7cee6ff965ea8789
	.xword	0x4d9c1e1f0e295acb
	.xword	0x52b3e84aec99741a
	.xword	0x09b5dbde54d8c7e6
	.xword	0x70bcf4d22e3b4a56
	.xword	0xc9f1e17eac856458
	.xword	0x4e59f72651e9d077
	.xword	0xe7c784ac5f9c649f
	.xword	0x959a5689a4456feb
	.xword	0x4597cb888586c477
	.xword	0xfb3e52e6348ca83f
	.xword	0xfd89b0c266974645
	.xword	0xd13ed1b73f3f8dc9
	.xword	0x8d9751cf10e7aaf3
	.xword	0xfb3fc22e0f5a3ff6
	.xword	0x08317683092f71ea
	.xword	0x0a39f79624073740
	.xword	0xa9c8f01e88b9237a
	.xword	0x05b3e36660c09626
	.xword	0x2997368d646bf433
	.xword	0xceca6d3510c6d8dd
	.xword	0x23c00a7a007d1c9d
	.xword	0x449fdba2e5a28d7a
	.xword	0xc198a2f0d5c7468a
	.xword	0xa38305fe2f711a9b
	.xword	0xe7e1c06f08aa5637
	.xword	0xa9616159f68f0c63
	.xword	0x50d7bdeef7131a2a
	.xword	0x6c1c0cdaccc695b5
	.xword	0xf2b487a0fa1adb06
	.xword	0x76f0934a5d3ce850
	.xword	0x2e151324400ffc98
	.xword	0x6bbeaef84d23a431
	.xword	0xaa667cafbb0837d5
	.xword	0x1d5ab27bc0f75713
	.xword	0x8ca017793c6bfd64
	.xword	0x7b3f44c07229cfc7
	.xword	0x68681e4cb8afb14d
	.xword	0x23fd7308bcb09d5b
	.xword	0x15a758b2dcd7a0dd
	.xword	0xfb8027b970b530f0
	.xword	0x3145f4fe58d78b35
	.xword	0xa3914ed8c3a57a07
	.xword	0x9ae958442cb9f195
	.xword	0xda8d7aec2278f835
	.xword	0x822e471371fc761c
	.xword	0xc611be0c02daa4cf
	.xword	0xb723596ced332ca0
	.xword	0x1bc11faa88ed0fdf
	.xword	0x3bd330583cfdc0b2
	.xword	0x67a5a2c127ac98ec
	.xword	0xde045fabb1af5058
	.xword	0x9db90724ffec5997
	.xword	0x3694faf93128de7d
	.xword	0x8e95fd500f0632c5
	.xword	0x43b88a259f3205b0
	.xword	0xe78894440314e4b2
	.xword	0xf6647ad02fa6779f
	.xword	0x1838f3c7e1629a5a
	.xword	0x2406b9807bdd4427
	.xword	0x5d01704edd1aae38
	.xword	0x0ed2bf3af9246841
	.xword	0xcaf6e967b4ac936f
	.xword	0x8f79c36e470092a4
	.xword	0x19d3d2953a99d063
	.xword	0xd33786ab40a4371f
	.xword	0x5eced8f31d0990f7
	.xword	0x6c4a1b922e07281f
	.xword	0x0015659677faa34d
	.xword	0x646974463d094e4d
	.xword	0xb2da43c8e1565895
	.xword	0x328020a82df71ce2
	.xword	0x1b3ac3aa06c972ba
	.xword	0xb1e1c92434162555
	.xword	0x1d09f157e66bda45
	.xword	0xf37feb6f9526c5dd
	.xword	0x524ca9632ba65b1a
	.xword	0x067f7ac87f4555d6
	.xword	0x751ac9fb4f321bbd
	.xword	0x48cb51ab5b239106
	.xword	0x54acfd5d7eb84780
	.xword	0x529743fd304dd7f8
	.xword	0x19b8514e8f5f25a2
	.xword	0x5c36c21b789de5ad
	.xword	0xf36de9171c9e2ef6
	.xword	0x384c9d85b262bcfe
	.xword	0x76eb3cc6aa789ee1
	.xword	0x87a5b5ff066635cd
	.xword	0x26fea87e4e44b681
	.xword	0x0f9bf139018c2b1c
	.xword	0x182e85e2e36d9562
	.xword	0x28da998eb2d67d47
	.xword	0x119eca5a6ef4ac47
	.xword	0xcd61503944fe3ec9
	.xword	0x15678ffb6af5de6e
	.xword	0xd0f45a30191decad
	.xword	0xb3a4a169fea20713
	.xword	0xd5aa00418db3fe4d
	.xword	0xd667d40aa2cd0297
	.xword	0x8ec47deb238a928f
	.xword	0x73d486bdb18d61f2
	.xword	0x2f2a4a57088ca435
	.xword	0xc94d2b2326bce4e0
	.xword	0x5c6a3e94c8ee35bd
	.xword	0x83409481ef6febe2
	.xword	0x47749d69880ff1f1
	.xword	0x0ba137a807a75fe1
	.xword	0x73e533cb8963b3ed
	.xword	0x6e8f54c5913a9ac4
	.xword	0xedb6bbbce480a6d9
	.xword	0x31a2e470907e24aa
	.xword	0xb3fd3be618110b73
	.xword	0x4b134f956b8464cb
	.xword	0xf326ad161c55393d
	.xword	0x3105cc43ff3b51bb
	.xword	0x743e971fb65b4385
	.xword	0xafa961b4884078c7
	.xword	0x4d4d7bdda48825ba
	.xword	0x121df78b68292794
	.xword	0x61d97e4ceb75fea6
	.xword	0xd629b92a731f6ae1
	.xword	0xe1397af1d1fc3c15
	.xword	0xb7b69c04cd61a132
	.xword	0xa402c5d29ac352b0
	.xword	0x4b47ffae8fe6872d
	.xword	0xf1654777dbd12665
	.xword	0x5e7361f809f43585
	.xword	0xe7da36beabab02d5
	.xword	0x92d9af07c0bfaebe
	.xword	0xa961418dfb30baaf
	.xword	0xbec9cd9b7f8acdb4
	.xword	0x612f4534d727f4d5
	.xword	0x59e89547628cedbd
	.xword	0x8f1c45c04099d727
	.xword	0xd06158df3a56ee40
	.xword	0xa7121e92a3ee8f17
	.xword	0x0d17ba0b2223b27e
	.xword	0x93be6e9f2fe2edf8
	.xword	0xb490a8a5b047b629
	.xword	0x428f89998d6d0bcf
	.xword	0x945845c25ddecb92
	.xword	0xff58b2a77afcf146
	.xword	0x14bbaca2c208f187
	.xword	0x9373491f6f74f58a
	.xword	0x77d2a9eecc81fa19
	.xword	0x3d19a09144e1a685
	.xword	0xec8350358d09aeed
	.xword	0x7ec1deae1d8f24af
	.xword	0x138c620ed74ac46d
	.xword	0x73eadad2b5cbfc73
	.xword	0x4cb701110e2d4b18
	.xword	0x6da07102317af7f8
	.xword	0x7fc81bef36f7f24e
	.xword	0x1d5fbb5a10598ae9
	.xword	0x08095b230ca8cfd3
	.xword	0xf289b1ebefec4598
	.xword	0x09715cb710437f39
	.xword	0x6227c9725b985d03
	.xword	0x1ecc7dd5c6ea9ca4
	.xword	0xb95c2d06c24c8a95
	.xword	0x14bc8c96c5cec4df
	.xword	0x983bc914790cc029
	.xword	0xa0506d244d1e3495
	.xword	0x172a49cb0aef42b8
	.xword	0xf9f5774b143894d8
	.xword	0xb3498f990f0012b4
	.xword	0xa84f0f0329d9d319
	.xword	0x75ad7db5f2f07647
	.xword	0x09a0c6ec15060b40
	.xword	0x3310de6a3726c832
	.xword	0x6ab143e4c5ad1032
	.xword	0xff6ba9a3711854a8
	.xword	0x630355b300764100
	.xword	0x97f7ad346f05ab95
	.xword	0xfef0ddfa23dcb540
	.xword	0x1c32e4930cba6c30
	.xword	0xe08fb18001c0c23d
	.xword	0xda4eb0baafe5a27d
	.xword	0x58da786ff06b6883
	.xword	0x57bcd1daf3ca6928
	.xword	0x137e3866ef27e9e1
	.xword	0xc7e3da73a751be32
	.xword	0x2fbf1ffbc6d4cb34
	.xword	0x69e7bd13ed50d9d3
	.xword	0xe7c6d5c71aec7888
	.xword	0x72607a72e86a0772
	.xword	0xaf9c1deb4b5fdde9
	.xword	0x513d6c67240ee49a
	.xword	0x5e0866b4ea466de8
	.xword	0x98644f7881a6b018
	.xword	0xb2dabf7b41b3ec5d
	.xword	0x89376a9b892e1227
	.xword	0x31372f20363eebd0
	.xword	0x27e9a2bc3cb8e91b
	.xword	0x80e6bf87f697d1ce
	.xword	0x1945f846c7e3b19a
	.xword	0xf2e175bc22073929
	.xword	0x82470f59c8a58b45
	.xword	0xa135c5dd4b213253
	.xword	0x998f0f21e12cd9ac
	.xword	0x09cdb5531e50fc08
	.xword	0x7ee53e92b9b59a76
	.xword	0x61d1dc18bef74d18
	.xword	0x0d361997dce497db
	.xword	0x78c8301e40fc5849
	.xword	0x74c4c52ed173a062
	.xword	0xec4b1d318e4079f5
	.xword	0x53f9c14e0a380a43
	.xword	0xdff333ca0842434b
	.xword	0x10694f9b8c071a72
	.xword	0x94edbacf5716720f
	.xword	0x06afb59fb7a2bd0d
	.xword	0xefeeeb55b3c8b2fe
	.xword	0xc33d6329abcf62ca
	.xword	0x311f537235818060
	.xword	0x7c6cea9b27572c76
	.xword	0xf9bee95f50313d0a
	.xword	0x5f7e13efea8e737d
	.xword	0x8079bc8621004b85
	.xword	0x6732e33695e3af0c
	.xword	0x57d2d5dacbe820d7
	.xword	0x72f4226089700ab4
	.xword	0x4aaa86c7f7ef53bf
	.xword	0x26f493a8f2985f59
	.xword	0x8fb89058e4686696
	.xword	0x30b8244770b98749
	.xword	0x7af5447d86116c5d
	.xword	0xce061bf0fcf13389
	.xword	0x08fe5ff614c2f2b5
	.xword	0x294145ee312c883d
	.xword	0x19464d360eb48521
	.xword	0xe9295babd8bc92b0
	.xword	0xd5a54d438a6b8ede
	.align 0x2000
	.data
data_start_1:

	.xword	0x0c7d0c6092aaa1c4
	.xword	0x347db21bc12f2167
	.xword	0x000de6a2fd1da453
	.xword	0x3d9ebddc321dc252
	.xword	0xf9931580a6a898e0
	.xword	0x75de4ccbe7cfe853
	.xword	0x564d15c932ce9ac9
	.xword	0xea44194971f0df4b
	.xword	0xe79004a995692e2d
	.xword	0xb1bdd2e557a29bbd
	.xword	0x9de5072c3332576b
	.xword	0xe01d340e8e0168af
	.xword	0x7b566bde21ae0683
	.xword	0xb5ce34981205bf4c
	.xword	0x5cd508389223ad5a
	.xword	0xa3f7deead3c3b99f
	.xword	0x79c91f6c85812da7
	.xword	0xe270ae7c6968a521
	.xword	0xf4d54658fd5dcc79
	.xword	0x09e43bafae914857
	.xword	0x75e095a0d8ac4394
	.xword	0x34e59046e1df3c3a
	.xword	0xbad249848991cc4d
	.xword	0xc02b088e98559029
	.xword	0x6d6a826dc9405e6f
	.xword	0x72987134c3a582e4
	.xword	0xcf0b5d40006137ca
	.xword	0xfe5b257facf198f0
	.xword	0xb9f5056b33563c58
	.xword	0xa53182acaaaedc92
	.xword	0xc5f42f789ae4e55e
	.xword	0x4e1c14fe2da8c190
	.xword	0x78a25cc7a3e56337
	.xword	0x90e932f7617339ec
	.xword	0x594ce26569c1a16c
	.xword	0x2c39956f676b1026
	.xword	0x95459de25084e4b4
	.xword	0x4b8735dc1a16bbb6
	.xword	0x69b63a2d61c69afa
	.xword	0xe1bfe4401ab0e9bd
	.xword	0xfba9d1246285821c
	.xword	0x2af100885081a9bb
	.xword	0xbea878a2e4a45bbf
	.xword	0x7340eb8c7eef61ef
	.xword	0xcc244aaca665ffba
	.xword	0x288f42fa80e835e7
	.xword	0x38f37b1b169c1bd0
	.xword	0xcbbbfa6f755eb57c
	.xword	0x6a52472aecbf13a7
	.xword	0xb817edab4becf9a4
	.xword	0x3931203ea7ff62de
	.xword	0x6b2af6b7e93846b9
	.xword	0xc1a8cd4790e06198
	.xword	0x43fca04eb08a5537
	.xword	0x20c76964ddffb9eb
	.xword	0x5ae2b2e07c02af5b
	.xword	0x611046bea123f85d
	.xword	0x6d1147a70436ceb5
	.xword	0xabc5bfd92e64f004
	.xword	0xe75001db8d3cc5ea
	.xword	0xc3e973dc12d73eb3
	.xword	0xe7ed20ce9685bd7c
	.xword	0xb37d2f342f1eb6d2
	.xword	0x5b79637a73c21da6
	.xword	0xb67f7880f72345e8
	.xword	0xf804dbc3fd1d09af
	.xword	0x2f26990a4efba981
	.xword	0xc879a4c2f14c498a
	.xword	0xb5260c51cdfb4892
	.xword	0x5e7fe65ce3fa651e
	.xword	0x70f06e68c8cf4e7e
	.xword	0x938a4490d4949428
	.xword	0x4cb57cc35e1a617b
	.xword	0x47a2decfa0cd03c0
	.xword	0x9456dc031b0bf7dc
	.xword	0x6be6f7f178810d12
	.xword	0x819aaf344aa05073
	.xword	0x090bacd41da889dd
	.xword	0xc704ef882f197253
	.xword	0x14b4b78ea8ea55a7
	.xword	0x01aed88850834038
	.xword	0x506485f8d110c34f
	.xword	0xc1ff682a48a5c94c
	.xword	0xefd17af76a1492f7
	.xword	0x3ad7e9691b2c5857
	.xword	0x2a7f5174529c67be
	.xword	0x403f903f72683e3c
	.xword	0xb48f355a27ad6a2c
	.xword	0x575fc341f77c8028
	.xword	0x7500153e4306ecda
	.xword	0xec6d668fabd52398
	.xword	0x09d7599179d2064c
	.xword	0xb91fd33f5b58941b
	.xword	0xa80b4722c6b4084a
	.xword	0x9429237d9f9fb9be
	.xword	0x2f466524ca30aef1
	.xword	0xb10c90aacda08940
	.xword	0xa02270fd6bb874c5
	.xword	0x4d19704f37d81225
	.xword	0x6dde97614636de06
	.xword	0xa4c442459b46cd31
	.xword	0x01f3deb07b3db618
	.xword	0x56a2ae85ef6c94b9
	.xword	0x666186e759c665e2
	.xword	0x0d29ba13d81d4a0f
	.xword	0x6da3bc2565544e5c
	.xword	0x4f7e017a8f9fe522
	.xword	0x6ad71fdb14187add
	.xword	0xe3d9f789d1183bc7
	.xword	0x109bd0c54b8c4574
	.xword	0x88758bdf110733a6
	.xword	0x0eb77b46cf0e46fc
	.xword	0x75e9f639cb9c84e8
	.xword	0xd5b20d79de13b886
	.xword	0x14f55e05bb95e898
	.xword	0x31c9febbbabae3f6
	.xword	0x4146a9e3d14c1500
	.xword	0x1f284c67fff3aa46
	.xword	0x51f06ec362f68c99
	.xword	0x2307fbcfa7363110
	.xword	0x5c5cc06ca45f6633
	.xword	0x668989c0bbd5e5e4
	.xword	0xf0d8b6364beefd94
	.xword	0x7d5b0ea70feb90a3
	.xword	0xe1e2df621d15dd80
	.xword	0xc7f0d7648295fd80
	.xword	0x2e8d1ea992694b12
	.xword	0x77f5d2ddc3479530
	.xword	0xfd341f516ee41477
	.xword	0x9a35718c35f4a643
	.xword	0xe542a2af07e74a1c
	.xword	0x56c282df66e23616
	.xword	0x42aec757271eca7a
	.xword	0x782d77e14c290ce4
	.xword	0x2696ae156482778a
	.xword	0x64dd9aaad5da434b
	.xword	0x22f6804f3869d04a
	.xword	0x8d5d7f9b61f1f81b
	.xword	0x15a4eba09bd558ee
	.xword	0xa710640336a3b23a
	.xword	0x020276a5005a464b
	.xword	0xec40b58719d7a91a
	.xword	0x8d41970e2950ec52
	.xword	0x873c34e5ee5da320
	.xword	0xd0a02169bf8aa125
	.xword	0xd6f067bee059f57b
	.xword	0x886335b5443daea9
	.xword	0xa0472e8bf57eb4dd
	.xword	0x3560714e69230f76
	.xword	0x253ac187a480f6ed
	.xword	0x66160257460e6d27
	.xword	0x6fadff0594f0be5f
	.xword	0xd3155e2356758951
	.xword	0xefc0c5ba57894b98
	.xword	0xde2cd459f2c9c1a5
	.xword	0x71914bc6ffb17da0
	.xword	0x06ae02ec84334fa4
	.xword	0xec3482bdacf0dfa8
	.xword	0xd5a5d7199cdf0fc0
	.xword	0xe7e779dc9c97c99c
	.xword	0x1e34e5c4c848849e
	.xword	0x570cdb4c931d4801
	.xword	0xd6eae431e90488d9
	.xword	0xae8eb0967d76981f
	.xword	0x9368aaf94f9104b9
	.xword	0xfbc12458cbab4d4f
	.xword	0x122bf3e4fc4f1e01
	.xword	0xe23a77e9da3596f6
	.xword	0x238e1041ab8baabf
	.xword	0xcec0c56f588aa4b2
	.xword	0x7e6bf9d1211b5c98
	.xword	0x8681f5d260d6be28
	.xword	0x4f04fd919b427367
	.xword	0x32ec41156c86059f
	.xword	0xdd83be6779096b54
	.xword	0x76e81cdd245102b6
	.xword	0x77d7940745de1921
	.xword	0x41780fff69c3c414
	.xword	0x493e553f7a1cd2b5
	.xword	0xfee91b9b0f436976
	.xword	0x4cdbbdd07716e0fa
	.xword	0x27a35a08ed8efd02
	.xword	0x4027d2ff543db376
	.xword	0xa12c4f67fad4cd2e
	.xword	0x250396b2f7297d6c
	.xword	0x25ff2ce83a5afe42
	.xword	0x6a03f7b7f2c58fb6
	.xword	0xd0d2aeada2d9e7ef
	.xword	0x97acbf145825ed33
	.xword	0x5c381844bf24610e
	.xword	0xce538ec0dbdb3785
	.xword	0xae139bcb11a31fb1
	.xword	0xd8e407343d8d2d26
	.xword	0xab2567d4cbb913b7
	.xword	0x33873ada15f21cb9
	.xword	0xd5ac8602c97585a6
	.xword	0x981bd35ec7e9e576
	.xword	0xeee31993e29cc77d
	.xword	0xad19c044af563f8e
	.xword	0x91e6d99a919cd9ec
	.xword	0xb539225fa890b00f
	.xword	0x51f7c5f739e3dc62
	.xword	0x8326e0c0abad4976
	.xword	0xb8fe4b8a44d9dc78
	.xword	0x2f772bac9b69eab9
	.xword	0x9cb70b6e9162e648
	.xword	0x6a5e62e829073ec8
	.xword	0x0a9584a4aea703b8
	.xword	0x8a4b0b0fc8ea7944
	.xword	0xd178a22bbbd18e35
	.xword	0x4ae812db0244a697
	.xword	0x5e1e8bb5bf1086ba
	.xword	0x75fa537bb0e787cf
	.xword	0x2e49c94025d4d40b
	.xword	0xd1c35ccbc5609ade
	.xword	0x52d61338955de63c
	.xword	0xb9d715dc120ee83a
	.xword	0xe80d2f4bac8492f8
	.xword	0x172eb1c3eede643d
	.xword	0x1a2a7c45fbad1cfb
	.xword	0xe54f5d9296e829b8
	.xword	0x9e707f868393a05d
	.xword	0x61fa4668deae6a8c
	.xword	0x5d9a22e4efd6666f
	.xword	0x4a2f83417cbe56f6
	.xword	0x5ffce92816de4cd2
	.xword	0xd994608828dbde51
	.xword	0x6d7a8f143f53ead5
	.xword	0x4a4ed6df0e510a8c
	.xword	0x7fa5d1e3a92b4539
	.xword	0x3b0ea041d20956b5
	.xword	0x46b06dbf4d3601c9
	.xword	0x273c9a8eb171f1cd
	.xword	0xe2c52a6bedb00df1
	.xword	0x55ef54c8ee91342e
	.xword	0x0b4c94279489aced
	.xword	0xe95aef104e3c899f
	.xword	0x298bea7834e93d38
	.xword	0xaa648243b0a86807
	.xword	0xda2be40b0a8ad6e6
	.xword	0xeff6747ada949a7c
	.xword	0x271f362203a447ea
	.xword	0x3e392b0afae803a7
	.xword	0x8467e68b46bfbf75
	.xword	0x01eab658304f2127
	.xword	0x6fbcaf9e23cbf5ea
	.xword	0xaeb1a037c34aa41e
	.xword	0x69a99acb6d405e7d
	.xword	0x1a6a545ae11963f4
	.xword	0x5a889eea909e85e1
	.xword	0x6beae7e7553ddcf6
	.xword	0x6e278c4e2b315ee7
	.xword	0x345fc3857827a8f6
	.xword	0xff1e443a62801d22
	.xword	0xbde4f4547804c8e7
	.xword	0xfffc7a0cdc103e0e
	.align 0x4000
	.data
data_start_2:

	.xword	0x4e85751015ec9691
	.xword	0xa5afb888b61fbd39
	.xword	0xb8007e6d6bda507b
	.xword	0xc0357088302a0911
	.xword	0x78570522f33151ce
	.xword	0xe95e4b251b72b304
	.xword	0x7e0126c7b03c2265
	.xword	0xe303ccd5023e461d
	.xword	0xe090ccd11e18ad41
	.xword	0xaeed6dd731dfe773
	.xword	0xb7177bef6cb6fb76
	.xword	0x1db5dbdd48811caf
	.xword	0x3af94f16811f9d2d
	.xword	0xfa2c8618a89ce31f
	.xword	0x6f4b918e4ebc2ac9
	.xword	0x64cb7095638bd81e
	.xword	0x3f03756a6e12d64d
	.xword	0x2dffe0f9a3c4fc29
	.xword	0xc8141b104a5835ae
	.xword	0x4fb98b82f4dfb731
	.xword	0x60042f1c71031e84
	.xword	0x2d4ea93c48feaf89
	.xword	0xcacce18237d388d6
	.xword	0x1043b276b2ff532a
	.xword	0x31c93c289cb1a238
	.xword	0x16cee63cfae82f5b
	.xword	0x6fe95bd84ae74cd5
	.xword	0xa0fb87ae896c8775
	.xword	0x1f230408cafa0bba
	.xword	0xe1c7a6fc6a71cd0f
	.xword	0xbb076b9bb502729a
	.xword	0xaffb00329e05e412
	.xword	0x18c481517fef099c
	.xword	0x7e45cefe0091bc16
	.xword	0x4e3791e57fec54b7
	.xword	0x4b1b52334de8ecf1
	.xword	0x0ce9141d62999300
	.xword	0x70d6bdeeeae756c9
	.xword	0x7ce7be1096ed32c2
	.xword	0xe4f7c1d12c16fc34
	.xword	0xf9608bc6e3b68598
	.xword	0xcae3c33c8f9ecaa7
	.xword	0x1a5b340aa5f0f22a
	.xword	0x9364f34dea5eb91a
	.xword	0xd060e4bc6ca0779f
	.xword	0xf96716213c84bc25
	.xword	0x88c3931048698c85
	.xword	0xa02df8c8199a2d7f
	.xword	0xec3bd2edc0e150fc
	.xword	0x7ca864d93acd1ad8
	.xword	0xffc90739042b9f7d
	.xword	0xf7612b74af639133
	.xword	0x8a9afeacd9142f98
	.xword	0x15b2b7615b3aface
	.xword	0x3a378c77b99fd10c
	.xword	0xdf7aa3df5a3d210b
	.xword	0x73daa60ee4d18dae
	.xword	0xc505deb2f7709df8
	.xword	0x9c89c94f750b959c
	.xword	0xa8782d44ef2c9c57
	.xword	0xd2df27f3415e07f5
	.xword	0x79426a8bc09e45dc
	.xword	0x264d60805f777fd8
	.xword	0x4f7343b3ff94cac8
	.xword	0x58536d157aa0406b
	.xword	0xbf08487d31307836
	.xword	0xb46e6d591eb78887
	.xword	0x68ecf501aa9a048c
	.xword	0x6e9adfc9e0216eb7
	.xword	0x09f4435ffe28e43f
	.xword	0xd2504153a4a0cb40
	.xword	0x5ab93809d8347f7c
	.xword	0xc90003610091d6a5
	.xword	0x9d3a75e0fc63ba31
	.xword	0xaca80821c8bb0776
	.xword	0xdb286147b2f17976
	.xword	0x35958aefe41de401
	.xword	0x6f63cf24ee2dac81
	.xword	0x639699d2f4fd4b2f
	.xword	0x6780e17d09ebda57
	.xword	0x239cc533dd266fd7
	.xword	0xd75cf9e89fb57dc6
	.xword	0xbff024321b16b680
	.xword	0x757e4b676622aa59
	.xword	0xc1f86d1396faeb13
	.xword	0x916f0db8a59cd088
	.xword	0xc4d127b92b0f7132
	.xword	0xce50b70111dc47b6
	.xword	0x5d5cda6e68029212
	.xword	0xf4ac85e59ed7d117
	.xword	0x0f2a0573b97d2c24
	.xword	0xd79708192eba6851
	.xword	0x4a09afbd999c8d1b
	.xword	0x413b94264b481ef5
	.xword	0x74b6800ef8f8a178
	.xword	0xc5ea39015642f72b
	.xword	0x0731faac0817995d
	.xword	0x40912cc2578f15c8
	.xword	0x25d1a21215742286
	.xword	0xa06ec2f55c8516b7
	.xword	0x2a6dac4b0edc7eb1
	.xword	0xc140a31f3d165ffe
	.xword	0xfa0ea5bebc97b027
	.xword	0x836f5e36b5ae44a9
	.xword	0x21586b3108bc1181
	.xword	0x730e1cdce00f5d73
	.xword	0x14aa7e79750c99f0
	.xword	0x52056a84e943b226
	.xword	0x0f550d0192c3f2cc
	.xword	0x2d732bb063561068
	.xword	0x795e3313207f1330
	.xword	0x95b0513282044da0
	.xword	0xb1e8ec44341d7d96
	.xword	0xc4ad7753de7d353f
	.xword	0x595444d7b2081669
	.xword	0xe1d27776b59e6be3
	.xword	0x30652677b0d8471d
	.xword	0x066b6fc335044353
	.xword	0xabdf91f1d5582925
	.xword	0x7d5602b377409f8e
	.xword	0x4cd85bf537a6280d
	.xword	0x7b16fcc59104c45e
	.xword	0xbe79bec923a41009
	.xword	0x56beb5382be8fbf0
	.xword	0x9e24fe87f9edc800
	.xword	0xe5018c59414698af
	.xword	0x5d136573be3db5b8
	.xword	0x0af8cbe24eab4ec9
	.xword	0x28506896b1764511
	.xword	0x294f3dfbbdc6976d
	.xword	0xa602fb5820906fdd
	.xword	0x03fda1cf427b6be9
	.xword	0xb6bf54d6bde62788
	.xword	0x582d3f0b4f7a55d1
	.xword	0x2a514502399608a7
	.xword	0xb836fab2b2473718
	.xword	0x474a199fced8d393
	.xword	0xdfda975c7ecb0126
	.xword	0x1edf03adc5e7cd38
	.xword	0x3db24df7c141bee9
	.xword	0xf59c3259045a2ad4
	.xword	0x86374dbe3edd4cb4
	.xword	0xf5c97d5d2d209f37
	.xword	0x04a57c8f0bc5096a
	.xword	0x19c50463f4db4df3
	.xword	0x0f415ddfdc22923f
	.xword	0x7e7d6ab1f1c4629a
	.xword	0xa4c760387eee05d3
	.xword	0xd242258b3907e74e
	.xword	0xf428ebda3349e2aa
	.xword	0x2d347f9d0a4a2cc2
	.xword	0xe5b3414936f72dc4
	.xword	0x362cbbc4a2b59a74
	.xword	0x7688ea013093bba6
	.xword	0x90dc55d0db9cf1d9
	.xword	0x6e69a97b246344d7
	.xword	0x357c9df120b8e0ae
	.xword	0x7e6e488be27cf61a
	.xword	0xea05ff64b3054289
	.xword	0x865668786e0220c7
	.xword	0xec300ec28cf163f9
	.xword	0x334dcc0c6daf5e4a
	.xword	0x9a4d487add4a3312
	.xword	0xbed436e87276da4e
	.xword	0xbdacf92460d123bb
	.xword	0x0404f405e8ced4e8
	.xword	0x94d76e83b02bfccc
	.xword	0xa69f5342b11f6f48
	.xword	0x587f9f0bb37b4852
	.xword	0x4caba5bfb1958a6d
	.xword	0xcd90e306ac7d01d6
	.xword	0x52a639508131e810
	.xword	0x3a7fa17996873cf6
	.xword	0x7effbf152620ea97
	.xword	0x9f97de627c7a6079
	.xword	0xde4b81b14c1b1e8c
	.xword	0x15c4f96da44ba306
	.xword	0xdecaebd37f6f98c1
	.xword	0x92ea2cb413eedde1
	.xword	0x4e35d991b7c36830
	.xword	0x0f5404120ff2548a
	.xword	0x5beac92e5f759c87
	.xword	0x3627365f2b10e1c6
	.xword	0xafd4239b8dcde0c8
	.xword	0x5128115ee6e76100
	.xword	0x3078253914c9006b
	.xword	0xf15f165b6a5b9cb3
	.xword	0x383981f42944ca76
	.xword	0x2aaa6c786fa848b4
	.xword	0x8ecddd6b23fbbd7f
	.xword	0x3e4fa950ad7d9892
	.xword	0xf916f974e7f66845
	.xword	0xaee03e827c894cde
	.xword	0x6a796ab4dba26681
	.xword	0x1e62e4c1fed40b09
	.xword	0x68ecca60fca91786
	.xword	0x78aa65d7485cf2ed
	.xword	0x14d1519633e219ea
	.xword	0x894455564ab4df79
	.xword	0xad337d451a4541ec
	.xword	0x1576bf81b097d4c3
	.xword	0x8f69f02301c94d25
	.xword	0x770938329c92011b
	.xword	0xc31fecea0ae88cf8
	.xword	0x86702868c2da0a0b
	.xword	0xd1e4c6343a6852c1
	.xword	0x03f9cfe9f2eca413
	.xword	0x8cf8f09d2404eb4a
	.xword	0xc08fe11762d14275
	.xword	0xda2270c8d2ea79fb
	.xword	0x638b7ab2c23138c4
	.xword	0xb7d9e78bd5c05a82
	.xword	0x0a20fe4a79ce29b7
	.xword	0x5df2db32e1266722
	.xword	0xd876a5bdbd156a55
	.xword	0xd79522e728b0e82d
	.xword	0x4940fcdd83ef4c00
	.xword	0xd6887482e198e0a5
	.xword	0x05d416a2cb18d97f
	.xword	0x77086c1455c1a567
	.xword	0xb27d55e9c6517ca3
	.xword	0xfa368f7946e9da04
	.xword	0x607c9da6240251b7
	.xword	0x08b33ae2fa36ffd1
	.xword	0xe9cb12e8928c1fb9
	.xword	0x4d81cc7c91379c35
	.xword	0x37040fedb9d6f5fc
	.xword	0x03482ad92bc36e51
	.xword	0xff02846c17fbb72e
	.xword	0x4bb2385dfdbb3bfa
	.xword	0xd471ff124c3822a9
	.xword	0xb08a0a1239786448
	.xword	0x2f5fdf3c9e7d66ac
	.xword	0x26bcb9ac186f3c60
	.xword	0x7f2bb35cc93fff83
	.xword	0x331481d3749a79fa
	.xword	0xd668c648acd8fc78
	.xword	0xd4305bb02a432bce
	.xword	0xa34e83f1eccb526d
	.xword	0x1d51b4ff3bfbe1d1
	.xword	0xf3415c9acd005561
	.xword	0x5fcd949f80e5b627
	.xword	0x958a573d6a4821a9
	.xword	0xcc147a5304570d8f
	.xword	0x7ed8e6a1183141c1
	.xword	0x53e83c3a0ccb6e90
	.xword	0xfde1267eb1e58993
	.xword	0x324359bf9641b571
	.xword	0xdcf3ae8fc55a8ab8
	.xword	0x0579c2e10798b7d2
	.xword	0x80353cca9f3ee9aa
	.xword	0xe06cfeffe7c72cf4
	.xword	0x31d8de2521595268
	.xword	0x2d977453a9ba8bd6
	.xword	0xb91362e2e487e109
	.xword	0x3b9e59c56810866b
	.align 0x8000
	.data
data_start_3:

	.xword	0x973dd9a75138c4fc
	.xword	0x13cc47026d246587
	.xword	0x7977ffb003fac3a2
	.xword	0xd516736d9e7bbf0d
	.xword	0x325b7da38232f1b9
	.xword	0x354c39b3c38da732
	.xword	0xa08f09e9566c5a37
	.xword	0xdceb15bddd537d72
	.xword	0x0feed1d7ce6f163b
	.xword	0x56b5692a5253e595
	.xword	0x805038894a81a4da
	.xword	0x782b402d7810331e
	.xword	0x61858b37ecfa6b0c
	.xword	0x8369e6f810569854
	.xword	0xab4daff105a3221b
	.xword	0x329fcb42b31a3dd5
	.xword	0xf892bf6ffe62919a
	.xword	0x7e7db122df39b608
	.xword	0x01c417182f99b45a
	.xword	0x43282102247bc295
	.xword	0x8447658c2f23a909
	.xword	0x74665b3c26c0556a
	.xword	0x33b96ca1682794ca
	.xword	0x935f220eb549f42d
	.xword	0x7b4d574bc3c57520
	.xword	0x97c592ea5fbc8d02
	.xword	0xe39cfdf63e1c932d
	.xword	0xc4718a97cab91bb4
	.xword	0xad84d469b4b7bab3
	.xword	0x8f15e77c282cc166
	.xword	0x88ff53bc3412b0e2
	.xword	0x73f5f41e4bf46a28
	.xword	0xf8e57ed2b5c76408
	.xword	0xac737237fd3c7729
	.xword	0x5f1628eedb886a35
	.xword	0x592b5c2a7099d257
	.xword	0x6c26ea0b4a90b820
	.xword	0x43f1df3aa542377a
	.xword	0x1d16228456d50f97
	.xword	0x0c76eb873d0b7385
	.xword	0x75ec060e688a7823
	.xword	0x188aad75edf409f7
	.xword	0x10691307730d01f1
	.xword	0xfbbc8365d3d424c3
	.xword	0x8f68a2fc508416df
	.xword	0x448aedb7d393616b
	.xword	0x1a42d1a82bcc5264
	.xword	0xa5431aea6429d4b9
	.xword	0x919f650ba636e6f1
	.xword	0x5ea68281e47e500f
	.xword	0x59875ba1b595617d
	.xword	0xb1a69b8f13c636b9
	.xword	0xc15ad4cdb25c05bd
	.xword	0x9cbed7e1860e6b62
	.xword	0xd7a6836630b8f251
	.xword	0x8d7be69d93f421c8
	.xword	0x51f969f3ba4a5a83
	.xword	0x254acbfc603f6c21
	.xword	0x813401566393d78c
	.xword	0x4d43205cd63c3be0
	.xword	0xc7f98bae8e2b3227
	.xword	0x5fa0ef90677cb5a7
	.xword	0x1a8a5d40ad4c412a
	.xword	0x70aced32a996fa57
	.xword	0x78186c5448aa3d6f
	.xword	0x4f2538df19faad38
	.xword	0x2eb4bce5f4ccbdd7
	.xword	0x28fa9c6e2fafc62f
	.xword	0x51022d404a50c76d
	.xword	0x7df44c8f470e204e
	.xword	0x33ce94fc8f03edc4
	.xword	0x66844722d52d06b6
	.xword	0x183e6077aa09fb20
	.xword	0x30086181ac4b193f
	.xword	0x42dccb263755b462
	.xword	0xd3cc35f68beafb30
	.xword	0x6505c8b8ba650cef
	.xword	0x2ab3e7c13cb4304a
	.xword	0x7d5628d0204421e6
	.xword	0x11478e7eb2ec5a90
	.xword	0x9978096bf10f15e4
	.xword	0x7728c6b8173cf88e
	.xword	0x46be07a5adc72684
	.xword	0x1a03201f741dceb0
	.xword	0xdbaaf23985182e30
	.xword	0x6657c376b6df1204
	.xword	0xa2343bab116936ab
	.xword	0xe183e97f28c26ac8
	.xword	0x555135ad2bf13eda
	.xword	0x95908a927300c76a
	.xword	0xac033fd1190378f5
	.xword	0x6f5efc49a387caea
	.xword	0x94aa592565c490dc
	.xword	0x3dc2fbcf3ef4e402
	.xword	0xbd33606cfa7724fb
	.xword	0x937b9df89e74a3b6
	.xword	0xaab228918c1796b7
	.xword	0xe5b55f642b7f7e95
	.xword	0x895ad6805a092299
	.xword	0x074e733ca252be17
	.xword	0xda6ea8dde6706eff
	.xword	0x0982abf4f4b0ebdc
	.xword	0xfd148691d695bc1f
	.xword	0xdf8c0ecff70b5f21
	.xword	0x7f986a2f96f6d341
	.xword	0xe2a712517c958504
	.xword	0xc9bb82395a71708b
	.xword	0xc6dbc128f3728ede
	.xword	0x7e5a53801516ed29
	.xword	0xbfda5d64783bc0d5
	.xword	0x234b557c21f69f3a
	.xword	0xbb386caf70dd02a6
	.xword	0xc932b0bc0e331e0e
	.xword	0xe00b6ef63972cad4
	.xword	0xb8481c18e0a8f9cb
	.xword	0x4addc0a7783d8fa0
	.xword	0x01182550c0153152
	.xword	0x25e0dd806a73c6e0
	.xword	0xbddd8c88ff4bd056
	.xword	0x8917f50466c10b82
	.xword	0x44c445945b703d99
	.xword	0xa46c47d11048af2b
	.xword	0x701e90c04a8acb8d
	.xword	0xae8f8abcdc842df7
	.xword	0xd1264925ddc7b0d0
	.xword	0xefcffdc088dab484
	.xword	0xfd607e8488c9e975
	.xword	0x8f254436c347ef04
	.xword	0xe112495274b71a29
	.xword	0x8e1248090abda4a4
	.xword	0xe3e4dae7d0f2ea86
	.xword	0x952352f8f9a31509
	.xword	0xbe21cdf226e16274
	.xword	0xebb09f29ff1237df
	.xword	0x946e8a0f74735461
	.xword	0x245b009ef1a7eab9
	.xword	0xd619edac7bb7a739
	.xword	0x1647c673e8653693
	.xword	0x55a76df3b5df7f4b
	.xword	0x61e1a7188ecc8f01
	.xword	0xbc222ebf8fac4129
	.xword	0xe60a9a8ffce2c97a
	.xword	0x4fe65983017e30a0
	.xword	0x66075b74df6c8f7e
	.xword	0x52556461046a32bc
	.xword	0xf563170b2e9f067e
	.xword	0x1d692edac3b4c115
	.xword	0x89b76df0aa442616
	.xword	0xca18d8fb8d1f49ad
	.xword	0xabff433fcd29a2c5
	.xword	0x25b08d51a49e6b47
	.xword	0x06972b3b4db10499
	.xword	0xffe7e5c57f1ca4ee
	.xword	0x411c731bb3708849
	.xword	0xeca7a876b37ab648
	.xword	0xa9df08726ae4b257
	.xword	0x8e070ecaf72f1ea7
	.xword	0x4305f11d37dc9f7a
	.xword	0xd25ed5e54dc719ba
	.xword	0x8503e30636672a37
	.xword	0x84850858c78c9a9a
	.xword	0x2bbfbe7a99484f49
	.xword	0x19c824c9240083fa
	.xword	0xdbe969c1710a3cd1
	.xword	0x2a1d510dc6a8c43a
	.xword	0x46bee0bd80c9dc02
	.xword	0xff0c7b53829a8bcc
	.xword	0x508dc0534a82b914
	.xword	0x31980745e5f0db68
	.xword	0x0fd94e19dcd78714
	.xword	0x74580e00ac872a4d
	.xword	0x3b6c4d14deb648e8
	.xword	0x30641f8af2dc1c08
	.xword	0xfb72bb7ac62e3cfb
	.xword	0xc1913b35f08a9013
	.xword	0x834ddaae06dcc5ee
	.xword	0x12714c70dc865419
	.xword	0x7ce973d413e80ff3
	.xword	0x19ecf8d6ab9ee3b2
	.xword	0x025c932a45f91f6c
	.xword	0xcd5536306f1848e5
	.xword	0x8232ce11c282feb7
	.xword	0x9c5bc30682216849
	.xword	0x627599a21e7b3e6c
	.xword	0x8e01c8168f263f22
	.xword	0x8acb2e8b1da3e8ce
	.xword	0x61414a04e681c6ff
	.xword	0x88c0fda74bb33f25
	.xword	0x00412c862d6ea54e
	.xword	0x3caf4e387a73d08a
	.xword	0x848dbc54e500c33e
	.xword	0x839ebab10e5346c1
	.xword	0x30f7add81c11238f
	.xword	0x8791177b2ac1752a
	.xword	0x3fac9c1868bf6c56
	.xword	0x57b1de57f5d33d98
	.xword	0x1a01603c5872c999
	.xword	0x7efd7fb294938d9c
	.xword	0x60926cb5358d428d
	.xword	0x8faaa535628a0b53
	.xword	0x006fd254cafe746a
	.xword	0x00b0c563267ce00b
	.xword	0xbe0381c3b9098875
	.xword	0x23f97e80e823d87d
	.xword	0xcb79e46a454f5abb
	.xword	0x14375273b0654c7f
	.xword	0x28014720271b6ea0
	.xword	0xf8ea8630cdd30899
	.xword	0xab716e6957a76c2d
	.xword	0xa5c3eaa68c49b07b
	.xword	0x0750257bea6cf2e8
	.xword	0xe8ee18b5a363b5c6
	.xword	0x26c90fa9aa9e3852
	.xword	0x30bb5043f1a26230
	.xword	0x348b4dfada3a6314
	.xword	0xed643eccf5e5aac2
	.xword	0xaf059bbb154694ae
	.xword	0x523e6f1404c88a71
	.xword	0xb3a64738827ad648
	.xword	0xcdc96e5584d792da
	.xword	0xd5d7e23373f55e51
	.xword	0x6c21d4dee06788ce
	.xword	0x56c0646de385b344
	.xword	0x496272c7dffc19fe
	.xword	0xc8a7aa6e3edd5876
	.xword	0xd9e804e0c76870ce
	.xword	0xa5be86b6517d7cb8
	.xword	0x5700331126dee1e5
	.xword	0x80a1165540fcff3c
	.xword	0x8c2078c00d041d00
	.xword	0x3e36019a39da06af
	.xword	0x11feb8668d6519bd
	.xword	0x9110d0c3aa1da2f0
	.xword	0xce7e01154e7faba4
	.xword	0xb5c9eb449e7f8c6c
	.xword	0x9eb4140a36d89db3
	.xword	0x151f3249c7cf6de5
	.xword	0x96e3437e6b834ef7
	.xword	0xea45427446262b1a
	.xword	0xa754df894e4dd3f8
	.xword	0xdeb47b050a66f1ec
	.xword	0x08aff821ecad7841
	.xword	0x14df0f0cb3b4029f
	.xword	0x5954a111c14c9ed6
	.xword	0x37e72724eff0ee48
	.xword	0x2a4b4d89c1b6e213
	.xword	0xe6d515087d8a8e05
	.xword	0x36a0e9785cf6173a
	.xword	0xa37893cfeca26a1d
	.xword	0xc603870a636c12d0
	.xword	0xd91b6ec3d1fe7cbc
	.xword	0x3d5a72a68bca973f
	.xword	0xe1df5ecb80a4d52d
	.xword	0x4b3270b7ed0737de
	.xword	0xae6b97765a71c21a
	.xword	0x93bffbfa13617d2b
	.align 0x10000
	.data
data_start_4:

	.xword	0xd9bf0ed3671a2498
	.xword	0x0e3131bbc9969c19
	.xword	0xf6a3669eb26b25b2
	.xword	0x2187486f4658501f
	.xword	0x0af36808044b6d01
	.xword	0x901a94116d35bc29
	.xword	0xf701bf05570122f8
	.xword	0x79f7994ddaaa6b65
	.xword	0x3041bdeaf1180699
	.xword	0x9b7a00903e95fc9a
	.xword	0x29531d23a1093cc4
	.xword	0x83c8cf47a5191341
	.xword	0x8a1820cb0495ebc8
	.xword	0x08c90ae517319305
	.xword	0x9b440b3239bf94bc
	.xword	0x1734382243673c43
	.xword	0x32ea938b1dc49752
	.xword	0x062c89b1b672a732
	.xword	0x46f86c80e1195bb8
	.xword	0xa5c71142a8d7fb2c
	.xword	0xe5eeedcd3a6675d8
	.xword	0x27d1baf0fc96fee7
	.xword	0x51c8c016780ae40a
	.xword	0x37f006c96525b04f
	.xword	0x6a4a503bb619a7d7
	.xword	0x507458784b7241ed
	.xword	0xcd41c2ec0570be5c
	.xword	0x8ea0cf267a081310
	.xword	0x7c697a7214ea64b8
	.xword	0x9707a67b34ddf16e
	.xword	0xc414e3646652f2ff
	.xword	0x4dfccac126e3605d
	.xword	0x5a72448332ca2dd7
	.xword	0x4a4f3d17cbd92182
	.xword	0x91543c82a2d7c933
	.xword	0x84ef3f59b18761e6
	.xword	0xe4031adfcd1ea2cd
	.xword	0x8c855e2488e87d3d
	.xword	0xd16882cb2e3ddd88
	.xword	0x5a6ff36230618693
	.xword	0x6b0378fd51f8bff5
	.xword	0x4decb6c771a7ed30
	.xword	0xd08ab35e4eef460d
	.xword	0x544824eded95a66b
	.xword	0xebec33d5c43dbc04
	.xword	0x8dd2d6427eb5b38a
	.xword	0xfcf378697cc03e9c
	.xword	0x7431eda7c3ae7d7b
	.xword	0xc03c2d14e576e53f
	.xword	0xe6090766764a82ca
	.xword	0x3f15505deb82920e
	.xword	0x86aaeea31965059e
	.xword	0xa8221888088ecf4b
	.xword	0x8a3a3a6b4ab1a0ba
	.xword	0xa2fc85bd312333e5
	.xword	0xe4346ead885d9059
	.xword	0x76caf31650677077
	.xword	0x71ef35eb727ea1ba
	.xword	0x8e7fbd132a5c7dc1
	.xword	0x2b3bc3db9354a362
	.xword	0x69813b66f35abffc
	.xword	0x3af51483fa56f3b5
	.xword	0x44910410fc799688
	.xword	0x9f47568e986751c5
	.xword	0x6b883e2d676f362e
	.xword	0x308bf2418de45aa1
	.xword	0xbb58e0dd6a216d6f
	.xword	0x21653fade3d2c6d8
	.xword	0x881043ae02e90d7c
	.xword	0x0d73620eedf7b6c9
	.xword	0x66a90ff6099f9ec8
	.xword	0xd652483c66c29860
	.xword	0xff8604f9472e8050
	.xword	0x0a2c4c9a3dbbbd73
	.xword	0xe1d749e3b566a770
	.xword	0x9e21b181d2e8f90b
	.xword	0x1d4a5ea5aa48463f
	.xword	0x58283c062f979f02
	.xword	0x250b6bc1d6536b1a
	.xword	0x6eee0160beaa12f4
	.xword	0x301ed63553ee6bcb
	.xword	0x0fedaf8e00291ba3
	.xword	0xd28ee8cf0f987e49
	.xword	0xc316d8a898b53c75
	.xword	0x3290f2122554843a
	.xword	0x7f361e3b54dacdfb
	.xword	0xf1b98b9f2d0c6357
	.xword	0x435b14fcb11a3a59
	.xword	0xb73c023f431bd3f0
	.xword	0xb6ad62ea19399432
	.xword	0x36b4eaaeaf943939
	.xword	0xf5eebe80dbb1ab23
	.xword	0x8158c0757e8387d7
	.xword	0x3889c47b94eede55
	.xword	0xab7f03140faa2994
	.xword	0x0f8592f1e3e3bdcd
	.xword	0x199754d18628f67c
	.xword	0x875fe342b2e5e76b
	.xword	0x53976ceb081e688f
	.xword	0x20a40a5c452c3644
	.xword	0x499191a386121779
	.xword	0xb64659cd33e763af
	.xword	0xba2ae2963ad48d3c
	.xword	0x1b7b38bf24b94dc7
	.xword	0xe711c2429aa40c57
	.xword	0xf06053fe3a535c58
	.xword	0x73eb70dbb802b84f
	.xword	0xea836a3d26be7f22
	.xword	0x107790cd14620ab4
	.xword	0xef1c054917d5ac6e
	.xword	0x09d9a45f1df2f0a7
	.xword	0xf95c08b21f32d610
	.xword	0x45713d19122d7c3e
	.xword	0xf5df63a02c7288e5
	.xword	0x338260875e8fa72a
	.xword	0x988f0fde90f78f3c
	.xword	0x7f8128dace8304b5
	.xword	0x9579fabee9af0edb
	.xword	0xf06c8b6701bc5a80
	.xword	0x775286bbc9ee5f24
	.xword	0x6178a6d14c4df533
	.xword	0x3061b6b08b3f6442
	.xword	0x0eedeef7db68a020
	.xword	0x388aac01e534ba5e
	.xword	0xa24d3337efeadd5c
	.xword	0xf19f8cafb0a85f4c
	.xword	0x53a2688c484dbe3f
	.xword	0xa16613abb1d358e1
	.xword	0xcbd74e9bd18d7fe2
	.xword	0xf2165a7a99ab7991
	.xword	0xf544cfb4b7ddd5e7
	.xword	0xd962f420c25dd51b
	.xword	0xaad11829bc8dfde1
	.xword	0x906d670072f471b4
	.xword	0x7d76df5ebc23dc33
	.xword	0x69e561ab51e3ebc0
	.xword	0xafd1f4736af51aad
	.xword	0x36c082e9027c534e
	.xword	0xa0d864f46b33954e
	.xword	0x265d8429bc845c46
	.xword	0x278da48ea3c6b2aa
	.xword	0x9eaf5dbf8bc06f52
	.xword	0x9b2801047606b744
	.xword	0xe6a57ec30c0584e3
	.xword	0x9ea9d4b70f602186
	.xword	0x021ec6bb14233941
	.xword	0xf1bf7feb8922a0ff
	.xword	0x07870c7c88c5dc07
	.xword	0xbfa017053e45ec50
	.xword	0x68ef734e01d220b7
	.xword	0xe2c55efaacb3a70f
	.xword	0x799eaea964b76991
	.xword	0x0af43b28c9fe7cbe
	.xword	0x222844b98a6ea767
	.xword	0xd68a99d9c39fee8f
	.xword	0xa1f1398d26591d23
	.xword	0xac2c2a0ca09ffd27
	.xword	0x3351997b970cef8e
	.xword	0xfa60750a7fc6c048
	.xword	0xc8c7687135035906
	.xword	0xa9451d1d463e95a4
	.xword	0x7bb380b0f602425b
	.xword	0x6c7fcf14c97e9a16
	.xword	0xa67f30238224a412
	.xword	0xd55442a3a52fbfa4
	.xword	0xf340f881742a836f
	.xword	0x3b5fd0f0391d7b7c
	.xword	0xb8dcf3f007afa73b
	.xword	0xd54866fec35cd7b1
	.xword	0x6aa46ec785a60365
	.xword	0x9cd3e84f26b6982a
	.xword	0xdb3eee0679c60e3e
	.xword	0x14f3bfe0de4b22d6
	.xword	0x1ade026cc4ecea1b
	.xword	0x35548d8faa82495c
	.xword	0xd122cd4eab0f7ec3
	.xword	0x13f94af5c2ebeaf5
	.xword	0x3d0d6bfb74359abf
	.xword	0x4fbc6ae9f42ea445
	.xword	0x78b9794f1a311572
	.xword	0x037fa4334300e85c
	.xword	0xd8aafb9b93e525c8
	.xword	0xf67aae32689dd99e
	.xword	0xbb6200944165bca6
	.xword	0x93cf1112b3ed32f4
	.xword	0xc1666b1d1da2d239
	.xword	0x90a042e9d9b4a884
	.xword	0x96ad9c153f8b55b5
	.xword	0xd983e878905247ed
	.xword	0x65ff83c436c92e16
	.xword	0x135b7ebf76501f58
	.xword	0xe4e2811d67388e35
	.xword	0x003a0689ddaebc91
	.xword	0xae945294ddaf36c6
	.xword	0x2518146ccc74e967
	.xword	0x6a90ddf0eb47b981
	.xword	0x00eefa52528b46e4
	.xword	0x440c5aea27bd7d58
	.xword	0x6e8cce8cf70d0750
	.xword	0x379f93d8cba8e811
	.xword	0x22a6504dc1ff0e05
	.xword	0x2cb27c4c9d687b49
	.xword	0xbef3ab8ba1744b07
	.xword	0x5c49457b3d71d081
	.xword	0x4fc3542276b9b8ee
	.xword	0x778e04d61eac763d
	.xword	0x6a31aefc57697090
	.xword	0xc85a67896c53cc20
	.xword	0xd96e129b3fb5d6dd
	.xword	0x06a90c56b2cbf9e4
	.xword	0xe8e43caa238fc0f0
	.xword	0xadb4b035cf5ed5e1
	.xword	0x90fe5441fe35c14a
	.xword	0xe21dc0d29daf2e70
	.xword	0x8be6b0abd7a12eeb
	.xword	0x1e407bacffaca285
	.xword	0x856b447f140a2889
	.xword	0x1d59f9b105329c8e
	.xword	0x59bbf632fd21cfc8
	.xword	0x5a792e982663f0ad
	.xword	0x4a458bd862b5bf0c
	.xword	0xdd33b18e91e6692a
	.xword	0x8c8ddbffe45d9f99
	.xword	0xd5e0e544d136a31e
	.xword	0x342e8cd44954b5ff
	.xword	0x73023f08b2f28367
	.xword	0xe622092e80470413
	.xword	0xcb78e47a8ba04752
	.xword	0x8dffb90606f3503b
	.xword	0x6dad37fedf4ba544
	.xword	0xf51d2ca23e185244
	.xword	0xad58c74e1ccc1d97
	.xword	0xa5d3a924f67320d7
	.xword	0x94f163647a407a37
	.xword	0xcfc403fbff6c4738
	.xword	0x0593f1df4d4a3d38
	.xword	0xf8ad769a591c7888
	.xword	0xa14ca96044b81581
	.xword	0x573a3da5aa6c7dd1
	.xword	0xb41488fbbc38ff90
	.xword	0x37862f27b1298d19
	.xword	0xd01782f019a72065
	.xword	0x4ba157605ce4ace7
	.xword	0x04731bef200342f1
	.xword	0x6f9b7d2a8fa8f889
	.xword	0x6846d2af93625de9
	.xword	0xc0a6f3a07d1b5729
	.xword	0x6f3721f97c293a65
	.xword	0x7dce0c13a1129228
	.xword	0x307d7e63647c0bf5
	.xword	0x94b6ac9ea9a8e5bb
	.xword	0xc4f5b68b366d27c9
	.xword	0xbe985c731bf23198
	.xword	0x3de00f9c70ee0a28
	.xword	0x6814a0dd2de55a02
	.xword	0xfb5ac3270927c80c
	.align 0x20000
	.data
data_start_5:

	.xword	0xa6ae64e473b2c787
	.xword	0x73bdb91687225cc6
	.xword	0x9a41d426e834c2a4
	.xword	0x4f59ace699248501
	.xword	0x077e93a1a01c5628
	.xword	0x14c445b76fd35616
	.xword	0x43d6d468ca61106a
	.xword	0xa4308b82be6277be
	.xword	0x347f2fc070ccfe76
	.xword	0x11ea9816e559fbe7
	.xword	0x336a371075f0a298
	.xword	0x41df8294cf4ecfaf
	.xword	0x397ac24c0a4f44cf
	.xword	0x10bdddae206d9c88
	.xword	0xc02c843fc357340b
	.xword	0x098ac82c48abb701
	.xword	0xf8d8568d2ca030d2
	.xword	0xa11e9821deb0204b
	.xword	0x948e26b87a03e1e4
	.xword	0xab24b8f21fdb5285
	.xword	0x6affa491a1dd0a3a
	.xword	0xea837730d8b78410
	.xword	0xd31f928889693553
	.xword	0xb215080b45655968
	.xword	0xe85f22102142ece3
	.xword	0xcebb409e8fc1bb27
	.xword	0x0b61541b3aefea5e
	.xword	0x77f3d3178f4150ed
	.xword	0xf975def11d5ea315
	.xword	0x3661338701bf0c0b
	.xword	0xcaed10bab8562b00
	.xword	0x8af22025d9c9d7ab
	.xword	0x83003dd87697f266
	.xword	0xd3187b0a0ba76e0b
	.xword	0xbaa1cd47292e1459
	.xword	0x65a39f1fac1ad002
	.xword	0x3ec1494434e50d46
	.xword	0xe476a224bfb07213
	.xword	0xe88064a581ab1b9d
	.xword	0x51251c5ac489d6c1
	.xword	0x98733e03d7fc9d1b
	.xword	0x0f075e64bec6d877
	.xword	0x0107740385920ac9
	.xword	0xae6fa50d9ce43168
	.xword	0xfe56dd2601ca6719
	.xword	0x157573d85bcd35e4
	.xword	0x1d7665d998a13fe1
	.xword	0x1b06d19d31914156
	.xword	0xf38346d16fd05cbb
	.xword	0x5d81879f2437fae0
	.xword	0x92b2e1584802e61b
	.xword	0xf574d015a2d21a18
	.xword	0x58bb50e00e716d40
	.xword	0x83e95ec438527a85
	.xword	0xa48d1c8870ef3562
	.xword	0x9346ce551a222afb
	.xword	0x75d02260b17e9d1b
	.xword	0x7c3d755479710a74
	.xword	0x4c8e36f035aaa088
	.xword	0x8529ebee1b42a9d0
	.xword	0xb94cc972bcb05173
	.xword	0xf6d72d94de68af9d
	.xword	0x5065e4b1f144385a
	.xword	0x8324acb39256dad9
	.xword	0xab0ca0179304b433
	.xword	0x8a473495ff5d1e1b
	.xword	0xb7b7bbfeaf5a1599
	.xword	0x3b7cce871b337dee
	.xword	0xfc137101b4d19ee1
	.xword	0x1fca554ce2aa7b9d
	.xword	0x15dcd77c479aea49
	.xword	0xc009de619d4cab77
	.xword	0x4c566c2c50984fc9
	.xword	0xcd777d3a54443c4a
	.xword	0x45a7264351c5d44c
	.xword	0x165df4e2e3f7b30a
	.xword	0xd7f1abca82556b1d
	.xword	0x342c97028d9e549d
	.xword	0x4d7941a4e783b2a9
	.xword	0x90109226bf83c479
	.xword	0x869d02da773d4590
	.xword	0xab534bfa7a166f82
	.xword	0xe822d4a96a015256
	.xword	0x84014400746afbe8
	.xword	0xb2a070edd8afcf9e
	.xword	0x805001d4da0729dc
	.xword	0xf8e2f49d9617f94e
	.xword	0x9605cca534afd2e1
	.xword	0x24b45afd04c82fd1
	.xword	0xe6f7febf2c744b58
	.xword	0xf462f0f15ca693e4
	.xword	0xca42e2edace1a74e
	.xword	0xb5e6bddbfa862e2a
	.xword	0xfcfade4cd10dbaeb
	.xword	0x3ae8d60fb6282dee
	.xword	0xd3067ab914c0849f
	.xword	0x22288489348aca8a
	.xword	0x220c77be4566c865
	.xword	0xe1299fdb4ab62779
	.xword	0x4c6714f5f8c442a5
	.xword	0x17b54cb812a6b02d
	.xword	0x69594f0555c4630e
	.xword	0x90265924a6f5e010
	.xword	0x2fb5ca79fc094c12
	.xword	0x6ddf9f0bd6660dbb
	.xword	0x5d9d83510738ac0c
	.xword	0xe9f56d45d91ebd79
	.xword	0x7f9c57c55b589f3b
	.xword	0x400f5041c2a1a7e8
	.xword	0x4e80f01b27289d12
	.xword	0xfb15102db4fa2f10
	.xword	0x8ad1bbc7b0676eb9
	.xword	0x7c2a8dbbb6df4d99
	.xword	0x8d1f5d1bc7a76239
	.xword	0xa49e1236142d7083
	.xword	0xa131f32e412a704a
	.xword	0xd4e3c4b1118b6e43
	.xword	0x3f2a57baf747beed
	.xword	0x952b21a0a061256b
	.xword	0xbbce71d2aea7653d
	.xword	0x5b5c52731527c973
	.xword	0x4f50ec91956f681f
	.xword	0x951bc119748e2a9d
	.xword	0xe1975ea296ad03ce
	.xword	0xddf245ccbab92df7
	.xword	0xb60c215ae01feee8
	.xword	0xda750ddb3d9acf76
	.xword	0x421956ba9227f137
	.xword	0x2f892827be24c1aa
	.xword	0xac623b255ebb7ba3
	.xword	0xb381b415ce59280b
	.xword	0x74e95cd3288f9631
	.xword	0xdf2ffaabd462be2a
	.xword	0xbba44fd3ceb505dc
	.xword	0x4d6d2a1b4835d148
	.xword	0x4417026dc66e019d
	.xword	0xac6f034e03a0c582
	.xword	0x9332e2216a9ba1e0
	.xword	0x797352e5c422df10
	.xword	0xf56ec7ae6bd08fe7
	.xword	0xf9b45714d5880541
	.xword	0x88c8b15bc6c1a0ad
	.xword	0x408ec2a176b20d5d
	.xword	0x198d44c66d17c250
	.xword	0x7d983b777beb2d7c
	.xword	0x1ccc766720f1087f
	.xword	0xe96c4b0e75072d2f
	.xword	0x1c29318bdb20980e
	.xword	0xf2dfac756d92ca59
	.xword	0x6bd0db152e20938a
	.xword	0x342da719abe549da
	.xword	0x59b760c9f6c1b09b
	.xword	0x2e0fe866b293c742
	.xword	0xd265c06d893e3ef3
	.xword	0x016d7be0f0f207cd
	.xword	0xf691603a710be1d1
	.xword	0x52dcbb4970b7814c
	.xword	0x886245224849fd57
	.xword	0x23e35f5c747cb6f2
	.xword	0x9ea1f79346c78602
	.xword	0x95bb12b481b9fa54
	.xword	0xda324c0ddba68bbb
	.xword	0x88c0876646cdf681
	.xword	0x450c05c8e5f0f4f2
	.xword	0x195e423afa51111d
	.xword	0x808951e37d0536f7
	.xword	0x08562e136e6f118f
	.xword	0x060b5602f100f96b
	.xword	0xe34be527873336ff
	.xword	0x8fa171f1b7aeef31
	.xword	0x8d3ff56b12f524eb
	.xword	0xd62eac591c457361
	.xword	0xecc376b4d0dc9270
	.xword	0x5f5e500f16d2b079
	.xword	0x1829bbbdbb739d0c
	.xword	0x6ae48432996a3235
	.xword	0x5ddd8dc491338bb3
	.xword	0xff06995b96b37493
	.xword	0x2e79f60415c65e83
	.xword	0x9930a1b3a6f3c52e
	.xword	0x492cb93e29be8161
	.xword	0x0a3c8835de16de6d
	.xword	0xd5bebf3ab5daa7c6
	.xword	0x658800f54d16b941
	.xword	0x619b6d4005fe1255
	.xword	0x430a30d09e88ff84
	.xword	0x0a1dff132fc5d073
	.xword	0x91cfcb30028859ef
	.xword	0x898280021f9f5cc1
	.xword	0x67ac11576b347b55
	.xword	0xd118a8b0b55c5d98
	.xword	0x07fb2035949827e4
	.xword	0xf869a854887642d2
	.xword	0x1e4b1d61f2eda79a
	.xword	0x953eb404d9a6f0d7
	.xword	0x11bccb80e690c660
	.xword	0xd29ccaf4bd89372e
	.xword	0x76ae110e02056091
	.xword	0x85146b8c1ea0ae42
	.xword	0x13b45b063ab2e2c3
	.xword	0xb013c9292d9a7c04
	.xword	0x0ccb7d6e58658bf2
	.xword	0x29d87f2566f2808d
	.xword	0xd0d10d17f97a1744
	.xword	0x287d13014f21a3a6
	.xword	0x9dc802bf956c157f
	.xword	0x9ec735f4830babbd
	.xword	0x382ba914975ddffe
	.xword	0x5550b1d1b1b826ab
	.xword	0x5490cbe1f9998a87
	.xword	0xa0be8452bdb681cd
	.xword	0xef7331bdc679d85c
	.xword	0xa90949900b1a4da9
	.xword	0x50767f46ad325870
	.xword	0xf42beea74c4732e3
	.xword	0x8d6563a4bfe4336e
	.xword	0x73e8a8de35561c44
	.xword	0x75261d7366daf61f
	.xword	0x511c229e8b12dc11
	.xword	0xc7c43087299cf8f0
	.xword	0x788ed54bef47e851
	.xword	0x01b71109fb32bca3
	.xword	0x1be8962d8ccb5e87
	.xword	0x5760c7bdef18385f
	.xword	0x140c2df7e5745547
	.xword	0xb26f85c755fbbe18
	.xword	0x1928f51d2d395b4e
	.xword	0x5087efedd040915b
	.xword	0x4866596411674564
	.xword	0x8979f483824d01be
	.xword	0xdf65ea88572aa0be
	.xword	0xbcc24f8595ae6f95
	.xword	0xefa785b6b7329e0e
	.xword	0x8d3754d2ec0032eb
	.xword	0x7e066bed9b5c1ee9
	.xword	0xe7da9c1c7eb08d04
	.xword	0x62261cf0b77851e6
	.xword	0xd97ce069f1ad5cf4
	.xword	0x2f824f5d1fdcf4ac
	.xword	0x72167a4690e1c723
	.xword	0x0e96d95a548f282b
	.xword	0xc04e4d465be07832
	.xword	0xf1119a539e318a7a
	.xword	0xd550f05db149808d
	.xword	0x774878d03c7b2c9e
	.xword	0x2a8ffb2e6b1d5910
	.xword	0xfbbf7f457be4cad4
	.xword	0x39afdfa25333c70e
	.xword	0xb0d14d57e6a731ec
	.xword	0xc87ec7fce5a3bade
	.xword	0xf9364cdbfd778bdf
	.xword	0x62337a2506280a7f
	.xword	0xb4ac74bfbe4192d1
	.xword	0xb1488a8cc6dde0e1
	.xword	0xa33ddbfb477bf381
	.xword	0x9e7cec928686c7f7
	.align 0x40000
	.data
data_start_6:

	.xword	0xd8254c964d1a4053
	.xword	0xabb121dd9cc3fb77
	.xword	0x7919ffd155ed4bbd
	.xword	0xef19df1c274d518f
	.xword	0xa1aa78fbbd75f9ad
	.xword	0x5dd3037c93bf1934
	.xword	0x8e6682742fae51a3
	.xword	0x4bb276b1e83a6868
	.xword	0x6ea9c7e64100b417
	.xword	0xd4d31c16bce33ba6
	.xword	0x93516fe924667311
	.xword	0x1e4306a9c8f6e30c
	.xword	0x33e083c4c4c46c13
	.xword	0x8406c3ef2f93a8fd
	.xword	0x4fae8a6c476757cb
	.xword	0x5b538eca76b602e5
	.xword	0x69ba080cfc2eee4f
	.xword	0x86b56910c5f53114
	.xword	0xca598ec5fca42fff
	.xword	0x879544f9d8357021
	.xword	0x81c5c167f8337a69
	.xword	0xe778dce4f97d5610
	.xword	0x2a2a5a44ffb3cc1d
	.xword	0xc5f2b77f1d308a96
	.xword	0xe386087bd8e254a7
	.xword	0x1b2832245022d342
	.xword	0xcd537cc60d3e3c2d
	.xword	0xeae9850a9d3461c6
	.xword	0xbce37839dedda05a
	.xword	0x2dccad60714432b1
	.xword	0xaab8b646eaf60333
	.xword	0xb7380b6af6580878
	.xword	0x5d6afa09dfba87db
	.xword	0x920b9dec541a2f92
	.xword	0xc5492bef0e6a52bf
	.xword	0x980c3ce0b4ca1784
	.xword	0xc202b0e7f3fb091f
	.xword	0xfda13770fae9f6d6
	.xword	0xdc59e08bcb6c2e61
	.xword	0xd508060197d43b34
	.xword	0x18c16538be2cd46b
	.xword	0x4015d26ae95f6a56
	.xword	0xfb5dc79ff28ce9d3
	.xword	0x87350a942195ef03
	.xword	0xe18d09c85495f54d
	.xword	0xe66de89877639938
	.xword	0xa567ec376ce32971
	.xword	0xfef0f2addcda8a62
	.xword	0x35bc41959a7278d5
	.xword	0xbbe3cee1d1aafecf
	.xword	0x1fa717c173ba29a3
	.xword	0x141895baa3bc1442
	.xword	0xbe88f07d34db350d
	.xword	0xab6a3c6e50413d36
	.xword	0x77501a7e77fa8c67
	.xword	0x1496f74364f93111
	.xword	0xb7fdcc04cafc8b02
	.xword	0xe506b8d6fe70c7a4
	.xword	0x3bfbcb220fd02969
	.xword	0x6774c58c5282f0c8
	.xword	0x5b2e43dbd6427516
	.xword	0xf81201ea2e2f5901
	.xword	0xd5cfd47121e4a11a
	.xword	0x452892a9d12730e0
	.xword	0xa4701d3bbdf089da
	.xword	0x4f2158390b3c5340
	.xword	0xd7ae2bfe284d26ba
	.xword	0x421a8fbe0bdb49fa
	.xword	0xa230fbee6cc5c158
	.xword	0xd74a12fce3007b47
	.xword	0x8f4263ca0012ee65
	.xword	0x3d8b3e3d9c3d1961
	.xword	0xa516c86e1854de94
	.xword	0x80595d382b762ebc
	.xword	0x05cdb5cada098b2f
	.xword	0xe53d9b7a7bcc8a1d
	.xword	0xa76d591d196bdbd1
	.xword	0xadb811d1382678ff
	.xword	0xfd85b9d0b4bf394a
	.xword	0x437a546d188bf1ce
	.xword	0xeae29c9e88f1c825
	.xword	0x994bd40378b8fed7
	.xword	0x6280734dd70c7632
	.xword	0x2b13982a43231cc3
	.xword	0xe47bc34a2afe2707
	.xword	0x4b8c0165676c2105
	.xword	0xfa99838152e8f849
	.xword	0xb799d706134528fa
	.xword	0xb3c4cd5633cf0847
	.xword	0xec1e66d19090ebfb
	.xword	0x187a805244525e76
	.xword	0xe8216ef78c28f929
	.xword	0x0a7456922449a337
	.xword	0x0471f1d5fa3c7bf5
	.xword	0xd8c0007ffcb92530
	.xword	0xe3d1d12c466a5cbc
	.xword	0xcc23d8a8a5b31583
	.xword	0x81e764c31e254892
	.xword	0x9e188ba32784a43d
	.xword	0x28849c4df13833a4
	.xword	0x7eedfcb2e6ca16b0
	.xword	0x692b4c1df76654a3
	.xword	0x6eb1b49062a47343
	.xword	0xcdeaeb1e4126f4c4
	.xword	0xe8f88d1405076dd3
	.xword	0x2caea17151199942
	.xword	0x3a4ac26f3c7fff39
	.xword	0xec1cd02c2d4a372e
	.xword	0x885807980bbd3f7d
	.xword	0x842535b9e80a9f0d
	.xword	0x4fb3a3d289f4fa58
	.xword	0xae34fc865977622f
	.xword	0xe648e9d2bed679a5
	.xword	0x9afffeb5c039d16e
	.xword	0x7b741f91f6d6fee1
	.xword	0xd3656c18520898f9
	.xword	0x313f925512615343
	.xword	0x579d2e2f0255645d
	.xword	0xb764f1173685e3ac
	.xword	0x2a555f9a9e448456
	.xword	0xfad7d4b0cb558d46
	.xword	0x20ed4b17ea3e82f8
	.xword	0x7b22ce345d8a0cb2
	.xword	0xa32dc002b2e519a7
	.xword	0xb767e9a361964c88
	.xword	0x93d420ff03a2f650
	.xword	0x043185d1674b6385
	.xword	0xa7f53f5ddf8dfb37
	.xword	0xd8d0b362b39be918
	.xword	0x65102ce813c7a415
	.xword	0x755f5ef1200b0ea3
	.xword	0xada5ffb24b59199a
	.xword	0x7d403796869d7bf3
	.xword	0x0fbdcd1262e71276
	.xword	0x4de1509c5859315c
	.xword	0xbd7c0245d3b86fa7
	.xword	0x1d6356336422dd7e
	.xword	0x5d7401f292092ca6
	.xword	0x125129796bf09abe
	.xword	0x84c680d7e3404b42
	.xword	0xdf6d424e2ea4ee00
	.xword	0x14718eb075ec9c44
	.xword	0x9d3f7de923fa7b10
	.xword	0xc97aaa0155d96ec0
	.xword	0x7d2d1134d6b3d6c6
	.xword	0xf0cca7c856f1bd00
	.xword	0x51083b9afcfee965
	.xword	0x34c4fe3d9265cedb
	.xword	0x3915d47c2587e2d8
	.xword	0xc6c80e0ac136ee75
	.xword	0xc9ba5ef0898ddfef
	.xword	0xff40c89a2beed224
	.xword	0xfc601cee71d91b0f
	.xword	0x4402026732fbf644
	.xword	0x312682829c92d340
	.xword	0x403f2e624852b5d6
	.xword	0x48e56edce68f0faf
	.xword	0x72a1254d46cdd79c
	.xword	0xc81a71dd3fb7e50f
	.xword	0x26c9c2eaff9d50a2
	.xword	0x41e10c79efbf40af
	.xword	0xb828e64446b6a999
	.xword	0x9bafe87a15c97e19
	.xword	0x49fbcf86d33e53e1
	.xword	0xfa35ff61d54c0462
	.xword	0xe30ce76b3bec98f6
	.xword	0xe1e0aeb299a689fd
	.xword	0xcba4236665bc01ef
	.xword	0x9ed02d426dafdf74
	.xword	0xc6fe2d34897f55e5
	.xword	0x32bfeda13374908d
	.xword	0x066fdfab3b73a9a1
	.xword	0x42b0686091388e8a
	.xword	0xc489a172f78eef43
	.xword	0xa571269f25e92d2e
	.xword	0xe0c3d7a18548658b
	.xword	0x53a61c1cdfb6392d
	.xword	0xd5143f5594d4b66f
	.xword	0x9e877593df2700ea
	.xword	0xf83caafec3b084b2
	.xword	0x1d542d13dcdea7ab
	.xword	0x9191359acf7964f0
	.xword	0xfa2cdd4213f8d9c2
	.xword	0x90a2aff56238ba57
	.xword	0x4ae252d4105b80db
	.xword	0xfd5fd0fd866454a8
	.xword	0x493b8b11ff9333c1
	.xword	0xb3d373624043be46
	.xword	0xa74997a8fcdc0283
	.xword	0xcf82fc708c567820
	.xword	0x5cc49b149643a577
	.xword	0x3502ce248a2d963a
	.xword	0xdc833dbef249c507
	.xword	0x1fbd77577d71220f
	.xword	0x58f9a9c5e8fddfc0
	.xword	0x383190d72b059862
	.xword	0x7dc6caabd8103c74
	.xword	0xc111dca52fbf544b
	.xword	0x1e3de31dcaa19f75
	.xword	0x2678785a889c43d5
	.xword	0x424b8ab5db73a7b2
	.xword	0xaaf3c3498a896291
	.xword	0xa7285064b042f52d
	.xword	0x9e1e5e039887df39
	.xword	0xcd935c4dba352a77
	.xword	0x6de5bce4dbd1150e
	.xword	0xaada3dc577b3f525
	.xword	0x4a75d46ed1f29137
	.xword	0x9fd065c3b585cff7
	.xword	0xe8bd9f3240e3e227
	.xword	0x5bdb99d8b9cb16fb
	.xword	0x700340c2ac4f5a1b
	.xword	0xbcfad9fb37f452b4
	.xword	0x6c90b88b649fce12
	.xword	0x8a739b64746e79d0
	.xword	0x49a9ae5144eb29a4
	.xword	0xdad54663c75cd64e
	.xword	0x53f349acfab5fbc8
	.xword	0x1b4238db2f891cfd
	.xword	0x81a64460ae50a010
	.xword	0x7ce747411c9ad450
	.xword	0x7e077e147f088b19
	.xword	0x0fd422a62c65b3ce
	.xword	0x9fcc7868d0c6dd7e
	.xword	0xeb60b162df5374d1
	.xword	0xa4d191de329de04f
	.xword	0x517dda0abf2d28cb
	.xword	0x5423e1c10c187464
	.xword	0x1b9b87804d7dfbb6
	.xword	0x9e50281b10ef4e2e
	.xword	0x3a9941cc594b81eb
	.xword	0x9d4ac397f031e6f9
	.xword	0x09f6991c657f7538
	.xword	0x8ce79230d5de88f3
	.xword	0xeb1fe6b088085f62
	.xword	0x609cf8421dac1158
	.xword	0x67469435641ce3a4
	.xword	0xb7f86a3c1693b7b4
	.xword	0xcea4dae6fb9a3964
	.xword	0x43909592991f120b
	.xword	0xa005d45323272be3
	.xword	0x5f91339c40aa6536
	.xword	0xc868aaacf15c0292
	.xword	0x6a49256c9ed7d4fc
	.xword	0x93869d1ad03939f2
	.xword	0x3d61220fe3f61338
	.xword	0xd0610a4b306388d0
	.xword	0x6f818dd7d587fcd9
	.xword	0xd06279c9880ba3cd
	.xword	0xa6f0198561a08e2b
	.xword	0xef9fb2bc8865c369
	.xword	0xf00116edea857d0c
	.xword	0xad936c7404d494b8
	.xword	0x8feba9ad370c097c
	.xword	0x28c86f0d9f57e756
	.xword	0x1d8eb0e280f48f44
	.align 0x80000
	.data
data_start_7:

	.xword	0xbc294ae01fa3c122
	.xword	0x46fe16f17a3ff5d5
	.xword	0xc7d10826f976128e
	.xword	0xe145993f6f1e65a1
	.xword	0x5a47532ca775c876
	.xword	0xd1af997695cdf26d
	.xword	0x5afc0a68007fd6a1
	.xword	0xe2d0a9c245527f43
	.xword	0xf65db16d5f683364
	.xword	0xea91ff5d90260917
	.xword	0xadb4f1a68f8864d4
	.xword	0xe5ff2e98a1fed88c
	.xword	0x9a0be5954a1d8261
	.xword	0x4251eedd2c7cf581
	.xword	0x02209dcf79d4e189
	.xword	0xd09dc724ad289564
	.xword	0x8cac353fefbf4e2d
	.xword	0x144d97077dc2ce7c
	.xword	0x0a84f9d2a13aaf3b
	.xword	0xb4faafd33bf92c53
	.xword	0x7e7340601bf523a6
	.xword	0x34cc8a423701e73e
	.xword	0x76aecafb1ec2a2a9
	.xword	0x9a1b8aa447026977
	.xword	0x79cc5b7832258646
	.xword	0xf8f7b39d8167eb15
	.xword	0xd1ec24a18fd20088
	.xword	0x221fd4a9497566d9
	.xword	0xfb9a8193b245eef5
	.xword	0x5503102a501e170d
	.xword	0x4f24c445262b5882
	.xword	0x8bac5b09e5e62393
	.xword	0x011bb06e3c3b0950
	.xword	0x891de126c4a803ca
	.xword	0xb5ff203c2e97802f
	.xword	0x9f19b0a1fae07f43
	.xword	0xbee6e924fb637bcc
	.xword	0x11bf0e3b88cd3f20
	.xword	0x66bb721e8b5144f5
	.xword	0xefbd373940f8bb8d
	.xword	0x27250f032baebf27
	.xword	0xa213f7f5d4f70705
	.xword	0x7f3b428b5401c53d
	.xword	0xc2c83165a5e1e23b
	.xword	0x6fe62da6397bd8b3
	.xword	0xca96f6737047834b
	.xword	0x48dfe2a4e919f90e
	.xword	0x4300315b27fa5b51
	.xword	0xb356524ae33068f4
	.xword	0x30253486f51321e0
	.xword	0x4b5c7f27ce2012e9
	.xword	0x2a6d672dd6060786
	.xword	0x2be68425a5bbf857
	.xword	0x45f7956a3a5f5160
	.xword	0x09e4a39cb33f90a8
	.xword	0xb142944848311c20
	.xword	0x563a3aff27efcc47
	.xword	0x2003f7b70ae3c9e0
	.xword	0x807af1a72d9c7581
	.xword	0x4bcdafe81b1ad8ac
	.xword	0xbd459092cdad7c67
	.xword	0xbd64327c4767c86b
	.xword	0xeb473631a90a3768
	.xword	0x03a3863e71c428a2
	.xword	0x9483348b8cf4afc0
	.xword	0x754f15eeb355ddfc
	.xword	0xd5757c5f99eabc35
	.xword	0x4349f141f81d3e90
	.xword	0x06edacba8de65a75
	.xword	0x996aa4d0a4afbaa7
	.xword	0x8b74d61a4117e663
	.xword	0xf6ae9b772670e9b5
	.xword	0xf0a4df0b3c7ec62b
	.xword	0xeadeca0a1a540a15
	.xword	0x9db2f211e038b3d8
	.xword	0x009420d4bed1ee04
	.xword	0x1ff4137695f688b7
	.xword	0xcbb07d5a19c9fa01
	.xword	0x8a49365f6546523a
	.xword	0x30150376c452d258
	.xword	0xc268c3b53fa468e0
	.xword	0xfe609a5f3a7be8b7
	.xword	0x96328f8a786a7ba9
	.xword	0x6c728d638155cfd9
	.xword	0x4b3c5bb785bac1d3
	.xword	0xdc4a509715748525
	.xword	0x11a18b78c40dd9f1
	.xword	0xfdf3ac8946ffc133
	.xword	0x53d784c79985ba7c
	.xword	0x0791466db71b22d4
	.xword	0xc27fad33c47a3423
	.xword	0x1908da28dab53848
	.xword	0x3b6e875622abd003
	.xword	0xca6419b920bf8ea1
	.xword	0xcfa43bc275e19f67
	.xword	0xf82d1b9ffa4a6ceb
	.xword	0x403d6f08e63eed6f
	.xword	0xb641f5f1dfcc84f3
	.xword	0xe4b0f0c45f30c89d
	.xword	0x7dbe00d60f78d6db
	.xword	0xa50ad27bb5f2c35c
	.xword	0x2a31031881bce1c8
	.xword	0x6933a48430eeba64
	.xword	0x7a880663a5d4eaa3
	.xword	0x5e7f7bcedbfeced8
	.xword	0x4fc9689443c6fb3d
	.xword	0x7cddedd7a63d083e
	.xword	0x8e0174c3e8ca666a
	.xword	0x83bfd90669e72fd4
	.xword	0x22744236406ffc04
	.xword	0x1ea5b3893bb37ed1
	.xword	0x2c5c1558631aff8e
	.xword	0x42bf0d7245fbe626
	.xword	0x2462285ac7ab8174
	.xword	0xe60816cf90525ee4
	.xword	0x4fcae469ba1f3d59
	.xword	0x55b0690e3f0bd21a
	.xword	0xb34e183dc845e054
	.xword	0xeb520d870400dc56
	.xword	0xd471eb00a2e8f6a8
	.xword	0xd6c3f541f9222197
	.xword	0x1b7d8dc0b72b6ba4
	.xword	0x7a004cc74ec17078
	.xword	0x1ac3aa2df280a243
	.xword	0x042feb4811a4c093
	.xword	0x4903b9aca3aaff82
	.xword	0xc14082ac8ee9694e
	.xword	0xaab4d9b50496186f
	.xword	0x5acaa77786150cbe
	.xword	0x2ddf27161398b6db
	.xword	0x6e138c0885b825c3
	.xword	0x4772c41ccf41b1b0
	.xword	0x994aa992c3e526b9
	.xword	0x58114a2c2fd96afd
	.xword	0xbec9c277dfb3cf30
	.xword	0xf4a808411d83f609
	.xword	0x424e4077f32e68e0
	.xword	0xae808af04d5f125b
	.xword	0x22bb32dedddfc0ae
	.xword	0xecc26766ddcfbc13
	.xword	0x57869a7c852cb5bc
	.xword	0x76ccbe348d57222f
	.xword	0x52611fb76c211734
	.xword	0x81a523c39b61a61a
	.xword	0x4cb2f5f70fd35929
	.xword	0x713b0c4690704d36
	.xword	0x01e620f9ff661105
	.xword	0x5e9e063982c48c9a
	.xword	0xbb6f220600bd4a11
	.xword	0x31a693673d18d1a3
	.xword	0xcc9cc01fa6245b54
	.xword	0x5f81d407497f54e0
	.xword	0xc3ed311cc514d440
	.xword	0x901575e56e5769e1
	.xword	0x554f2106506949cf
	.xword	0x71919717138ffa6f
	.xword	0xce662d0b0de494b2
	.xword	0xabf54c8085e99849
	.xword	0xf876504f3953cae9
	.xword	0x12ac0a051b768d67
	.xword	0xd4c5092882a5089d
	.xword	0x8f58dbe323df68a4
	.xword	0x702cab9778a4cf88
	.xword	0xe619eeef3d79b0db
	.xword	0x3798c9ed17fc3997
	.xword	0x96bb509f5126bb86
	.xword	0xab5fef71e2d2a14e
	.xword	0x5024f236cfae1b69
	.xword	0x426c88869f090e25
	.xword	0x9ee2ed87de9ae806
	.xword	0xc4d2a691ef595cac
	.xword	0x5a66bcdc5546793b
	.xword	0xc708db0ec7966c0f
	.xword	0x832edd879fdd9c9a
	.xword	0x4e996b47a7442892
	.xword	0x3fad7392b996a0d2
	.xword	0x52a0cf386040505b
	.xword	0x3561ed3556e93959
	.xword	0x6a5ea611971b8351
	.xword	0x9a44efea441a2f78
	.xword	0xd7aeb1976fce4314
	.xword	0xec587f2f78693b8d
	.xword	0xd62afe325bd3fea6
	.xword	0x830a8fb553c22af4
	.xword	0x12ff35dfde7a087b
	.xword	0xaa48088c41b92d06
	.xword	0x5b3c724c9fdd970a
	.xword	0x348371b49d445512
	.xword	0x14240be3972dd388
	.xword	0x70078504b3c65c2f
	.xword	0xb884fa4648c34063
	.xword	0x7accfb4121872f40
	.xword	0x7c7921cedc79ca05
	.xword	0x9b47fe6521691fe7
	.xword	0x3d2cc9c37623bf39
	.xword	0xf19370584d578e65
	.xword	0x0409fc757f2df7cb
	.xword	0x514bef28e5693494
	.xword	0x0fd45a9128caf968
	.xword	0xf8bb4f1a231efd14
	.xword	0x6358fafc8f944ff9
	.xword	0x56f090a3cd96382f
	.xword	0x4ec10b3c862934da
	.xword	0xcb56fe24c2e87eaa
	.xword	0x529994d1d9fc458d
	.xword	0xef035199691b7ac1
	.xword	0xe968947ed1ae149b
	.xword	0x936281aae87e25ee
	.xword	0x0d5c604da18fbdd5
	.xword	0x328975615c268cea
	.xword	0x61ab149104a1c1ed
	.xword	0xa4dda8aef7cc9a32
	.xword	0x5024f27af92391d4
	.xword	0x666083d1ff4038d7
	.xword	0xd0353101476e3539
	.xword	0x58fc23a9b7e22393
	.xword	0xca8a1244bd21eb49
	.xword	0xa102a27ca25f44c1
	.xword	0xa0660a44d867444b
	.xword	0x0568ae833f4af663
	.xword	0x854e62ce04dd41ca
	.xword	0xf4913f38c3dae2f8
	.xword	0x31b77ed9e677bf71
	.xword	0x35ed0bca09d04935
	.xword	0x4d5607647f4bd118
	.xword	0xc54fa01d871db74f
	.xword	0x731ee74a8bef0b00
	.xword	0x40efd499fe5bace1
	.xword	0xc78c7c5d64ef9874
	.xword	0x7eb01230e5840996
	.xword	0x2b126ee7a4cb9e32
	.xword	0x9db8d53c6565f726
	.xword	0x1a7f2a6f37fe347d
	.xword	0x023132009c1f496d
	.xword	0x8fc550395ebd6107
	.xword	0xddcaf655d5e623c3
	.xword	0x9710b908a830e146
	.xword	0x66d813dce27325e0
	.xword	0x80799781a107da46
	.xword	0x44b05cc630e2154d
	.xword	0x8cd2c3ac54df20ed
	.xword	0xbb92365fb8116ced
	.xword	0x1086cbf342862901
	.xword	0xd95d8e517a5d7804
	.xword	0xa2490649455e712b
	.xword	0xe22873d82743853f
	.xword	0xbfb23714f208d1ff
	.xword	0xfd94de99417e2820
	.xword	0x6cd5ac14bda9f222
	.xword	0x6ce8705c665be6f8
	.xword	0xbd4fa2fbb1d66bce
	.xword	0xc309259e3a3c2b9e
	.xword	0x60060ee712cc14ba
	.xword	0x585f3a68a4a910a3
	.xword	0x16ebed0c69b60ea6
	.xword	0x419b1b52b9b4cd48



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
