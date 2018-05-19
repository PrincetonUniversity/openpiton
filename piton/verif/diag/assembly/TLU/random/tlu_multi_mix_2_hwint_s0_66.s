// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_66.s
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
   random seed:	276153564
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

	setx 0x7cc2ff5170c0f1ba, %g1, %g0
	setx 0xd78fc26aeccb1c42, %g1, %g1
	setx 0x9662e505c52daeb0, %g1, %g2
	setx 0x22944a6423c916f0, %g1, %g3
	setx 0x35406c35470e941f, %g1, %g4
	setx 0xcfdce6d51bb5a0bb, %g1, %g5
	setx 0x29968e25e36eb482, %g1, %g6
	setx 0x0cc023d77028b784, %g1, %g7
	setx 0xbbe198e6c474125b, %g1, %r16
	setx 0xe9c944af8b09f30e, %g1, %r17
	setx 0x6d7bcce260bdaf18, %g1, %r18
	setx 0xaaa285942e546dc2, %g1, %r19
	setx 0xf8b02c261de33127, %g1, %r20
	setx 0xc1f07d408db7539a, %g1, %r21
	setx 0x9c23405ef119d897, %g1, %r22
	setx 0x3af32f53ed9bd490, %g1, %r23
	setx 0x83e8119a916ee1e1, %g1, %r24
	setx 0xf0bdc5c6c74b14d5, %g1, %r25
	setx 0xa90491ac7b385c75, %g1, %r26
	setx 0x3ff8b2ccaa6061b7, %g1, %r27
	setx 0x61840afcf0680216, %g1, %r28
	setx 0xace76273a2272fd6, %g1, %r29
	setx 0xb50339e45e56601d, %g1, %r30
	setx 0x36b86a8cc25766cf, %g1, %r31
	save
	setx 0x5c2be37111691a65, %g1, %r16
	setx 0x88da5ab62e877567, %g1, %r17
	setx 0x6c62dbe928283b6d, %g1, %r18
	setx 0xae76ec4601c3f31b, %g1, %r19
	setx 0xe18e71011bc4f206, %g1, %r20
	setx 0x46b8e16b3d0352b5, %g1, %r21
	setx 0x4e58bdcda1770f22, %g1, %r22
	setx 0xb0d3ab41712af9f7, %g1, %r23
	setx 0xfd0d41c784810a3c, %g1, %r24
	setx 0x4dce760d30975817, %g1, %r25
	setx 0x912e631a3b7347b3, %g1, %r26
	setx 0x8ca6fd65a7eaeba7, %g1, %r27
	setx 0x1794ba9298042c16, %g1, %r28
	setx 0x7faea5701ba26f34, %g1, %r29
	setx 0xe9d3fd58d0210e62, %g1, %r30
	setx 0x267fbcd4c990443d, %g1, %r31
	save
	setx 0x78bde0e176ef0934, %g1, %r16
	setx 0x6922ec1ac1906a92, %g1, %r17
	setx 0x052d108a36522367, %g1, %r18
	setx 0x25985091a18d1085, %g1, %r19
	setx 0xec4f0875c1dc9f10, %g1, %r20
	setx 0x047d55bd5f4b6efa, %g1, %r21
	setx 0xec493a53bd08dfb9, %g1, %r22
	setx 0x2b76901736719d2d, %g1, %r23
	setx 0x606006ed42ca2fd3, %g1, %r24
	setx 0x7b4f4be0aca220d5, %g1, %r25
	setx 0x9e7e1cc34c10b1ea, %g1, %r26
	setx 0xba9404971b10c2dc, %g1, %r27
	setx 0x7ae6a453dc649843, %g1, %r28
	setx 0x56455fc492fcf1c5, %g1, %r29
	setx 0x35d7d6fa673982b4, %g1, %r30
	setx 0x4233a12f5ee793ec, %g1, %r31
	save
	setx 0xe6ded67896bbf2c7, %g1, %r16
	setx 0x521bd9eeea784408, %g1, %r17
	setx 0xbdaf42bd34f83f69, %g1, %r18
	setx 0xfe90bd542f49546d, %g1, %r19
	setx 0xac3110c3dddb2cc6, %g1, %r20
	setx 0xc0546d4fea027d65, %g1, %r21
	setx 0x66f0820ae863b58f, %g1, %r22
	setx 0xe27703ccb1a992e3, %g1, %r23
	setx 0x1de45f51e8f29505, %g1, %r24
	setx 0x8a5cf5af147eb522, %g1, %r25
	setx 0xb7f5623f86dcf24a, %g1, %r26
	setx 0xd65c6ff4b88a9e40, %g1, %r27
	setx 0xaf36f9931ff08307, %g1, %r28
	setx 0x78ac6e7551c86494, %g1, %r29
	setx 0xc6da3d76ef72530b, %g1, %r30
	setx 0x9e221f0add41cfb4, %g1, %r31
	save
	setx 0x5af6d02a9870e893, %g1, %r16
	setx 0x9c9433488cefe61f, %g1, %r17
	setx 0x1569e492c2cb91d4, %g1, %r18
	setx 0xb1ba83d5124d65d8, %g1, %r19
	setx 0x09ca58395bf74634, %g1, %r20
	setx 0x0189883331fcd8ec, %g1, %r21
	setx 0xbbe0fbea1fb58ac3, %g1, %r22
	setx 0xcce8457aa620808e, %g1, %r23
	setx 0x5d19c605f9f197a9, %g1, %r24
	setx 0x8567eced5e91cbe7, %g1, %r25
	setx 0x44ec965fae4dbcc2, %g1, %r26
	setx 0x586c78a904ec4546, %g1, %r27
	setx 0x2670bb4aed7536e3, %g1, %r28
	setx 0x74ac19b1340e4825, %g1, %r29
	setx 0xd7bd1f9ddc008aa8, %g1, %r30
	setx 0x6f8e66842e4bc402, %g1, %r31
	save
	setx 0x89877cf721983c87, %g1, %r16
	setx 0x111861c9d7b031c2, %g1, %r17
	setx 0xea97679d28f3d0c9, %g1, %r18
	setx 0x1bc6a36d93e6936f, %g1, %r19
	setx 0x795c94e9f851b545, %g1, %r20
	setx 0x6248acc3fd7482ea, %g1, %r21
	setx 0x01f385c9124ae54d, %g1, %r22
	setx 0xe09520fe87394c7c, %g1, %r23
	setx 0xa8afe6961a5533fe, %g1, %r24
	setx 0x3e7aa998a2f6a7fb, %g1, %r25
	setx 0xfc1a6d607650bbc0, %g1, %r26
	setx 0xb5944e19c44b5920, %g1, %r27
	setx 0xcab2ff7a6a6214bf, %g1, %r28
	setx 0x20c30344aab9b4be, %g1, %r29
	setx 0x990f1c969a0e1711, %g1, %r30
	setx 0x3d0b742c5245dcf7, %g1, %r31
	save
	setx 0x256b99d0d7e7883d, %g1, %r16
	setx 0x42c43d7a2333ee03, %g1, %r17
	setx 0x1ca26f21095629ad, %g1, %r18
	setx 0x0df1a7aaa6d2b470, %g1, %r19
	setx 0xd6d74b7e4f540e25, %g1, %r20
	setx 0x6415bf9a88adfb38, %g1, %r21
	setx 0x5f2c1cd98fd0085a, %g1, %r22
	setx 0x81f40d29453c3f06, %g1, %r23
	setx 0x44dd56483310f603, %g1, %r24
	setx 0x55dd15e3fb163645, %g1, %r25
	setx 0x6e668b822170c4bd, %g1, %r26
	setx 0xff13d48652881771, %g1, %r27
	setx 0x570ecd1e69332112, %g1, %r28
	setx 0xcd6b98d669de549d, %g1, %r29
	setx 0xf0476b40c60293c8, %g1, %r30
	setx 0x45912b670b58e196, %g1, %r31
	save
	setx 0x0f404b3e9a4b3d07, %g1, %r16
	setx 0xddfc0630533a65f2, %g1, %r17
	setx 0x2bbaf3240db820ea, %g1, %r18
	setx 0x16a15bb693c4966f, %g1, %r19
	setx 0x001c9140e76eaac9, %g1, %r20
	setx 0x1d97ac1868e8189f, %g1, %r21
	setx 0x14279fc7537c7119, %g1, %r22
	setx 0x7ffc38db8f0dd7e1, %g1, %r23
	setx 0x6234c9c16fc77983, %g1, %r24
	setx 0xda5af45c7559b549, %g1, %r25
	setx 0x9fdad5a7d8b3d57c, %g1, %r26
	setx 0x473ec18461ee6c1b, %g1, %r27
	setx 0xadd0c83846d09b93, %g1, %r28
	setx 0x698e22eb25cb06b9, %g1, %r29
	setx 0x255003c9ae887f42, %g1, %r30
	setx 0x7d5a08af660ff302, %g1, %r31
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
	.word 0xbbe5614d  ! 1: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e421f0  ! 2: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e5218b  ! 3: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb4b5c000  ! 11: ORNcc_R	orncc 	%r23, %r0, %r26
	.word 0x8795a1ad  ! 14: WRPR_TT_I	wrpr	%r22, 0x01ad, %tt
	.word 0xb1643801  ! 15: MOVcc_I	<illegal instruction>
	.word 0xb1e5a16a  ! 16: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe4a017  ! 17: SAVE_I	save	%r18, 0x0001, %r31
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 3)
	.word 0xb9e5e1a9  ! 24: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe5a04f  ! 25: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb92c8000  ! 27: SLL_R	sll 	%r18, %r0, %r28
	.word 0xba05a022  ! 28: ADD_I	add 	%r22, 0x0022, %r29
	.word 0xb23da00b  ! 29: XNOR_I	xnor 	%r22, 0x000b, %r25
	.word 0xb9e4e0e3  ! 31: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb805e08b  ! 33: ADD_I	add 	%r23, 0x008b, %r28
	.word 0xb69c0000  ! 35: XORcc_R	xorcc 	%r16, %r0, %r27
	.word 0xbde5219b  ! 41: SAVE_I	save	%r20, 0x0001, %r30
	setx	0xf948c25f0000bf4c, %g1, %r10
	.word 0x839a8000  ! 42: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbe344000  ! 45: ORN_R	orn 	%r17, %r0, %r31
	.word 0xbbe4a07a  ! 46: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe421b4  ! 49: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbf480000  ! 50: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb8c58000  ! 51: ADDCcc_R	addccc 	%r22, %r0, %r28
	.word 0x8d946075  ! 52: WRPR_PSTATE_I	wrpr	%r17, 0x0075, %pstate
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 18)
	.word 0xbf2d0000  ! 55: SLL_R	sll 	%r20, %r0, %r31
	.word 0x8d94e1bb  ! 56: WRPR_PSTATE_I	wrpr	%r19, 0x01bb, %pstate
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 17)
	.word 0xbcc48000  ! 61: ADDCcc_R	addccc 	%r18, %r0, %r30
	.word 0xb5e4e08f  ! 65: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe5203c  ! 66: SAVE_I	save	%r20, 0x0001, %r31
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 20)
	.word 0xbbe4a138  ! 71: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1480000  ! 72: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb3e521ed  ! 74: SAVE_I	save	%r20, 0x0001, %r25
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, f)
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb1e5a0e9  ! 80: SAVE_I	save	%r22, 0x0001, %r24
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbbe5218f  ! 82: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe4e1e5  ! 84: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb750c000  ! 85: RDPR_TT	<illegal instruction>
	.word 0xb1e4e0ec  ! 87: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb2b460ae  ! 92: ORNcc_I	orncc 	%r17, 0x00ae, %r25
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 11)
	.word 0xb9e5e1de  ! 103: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e4e1e0  ! 104: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x91946090  ! 105: WRPR_PIL_I	wrpr	%r17, 0x0090, %pil
	.word 0xb5e5e0b2  ! 110: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe5603c  ! 111: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe421b0  ! 113: SAVE_I	save	%r16, 0x0001, %r31
	setx	data_start_3, %g1, %r16
	.word 0xbde5e089  ! 118: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde521ed  ! 119: SAVE_I	save	%r20, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0xefe0651b00005a80, %g1, %r10
	.word 0x819a8000  ! 121: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbbe52170  ! 128: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e4a0fd  ! 133: SAVE_I	save	%r18, 0x0001, %r28
	setx	data_start_1, %g1, %r19
	.word 0xb9e5a0af  ! 136: SAVE_I	save	%r22, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x9b6ba8240000ae59, %g1, %r10
	.word 0x839a8000  ! 147: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7e421a3  ! 152: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5504000  ! 155: RDPR_TNPC	<illegal instruction>
	.word 0xb7e4a1ff  ! 156: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe4e1ca  ! 160: SAVE_I	save	%r19, 0x0001, %r31
	setx	0xb8207388000088c4, %g1, %r10
	.word 0x819a8000  ! 162: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe420d9  ! 165: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x89942082  ! 167: WRPR_TICK_I	wrpr	%r16, 0x0082, %tick
	.word 0xb1e4a1cf  ! 169: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8394e1f4  ! 170: WRPR_TNPC_I	wrpr	%r19, 0x01f4, %tnpc
	.word 0xbde4a16b  ! 171: SAVE_I	save	%r18, 0x0001, %r30
	setx	data_start_3, %g1, %r23
	.word 0xb42c0000  ! 180: ANDN_R	andn 	%r16, %r0, %r26
	.word 0xbfe560db  ! 181: SAVE_I	save	%r21, 0x0001, %r31
	setx	data_start_6, %g1, %r18
	.word 0xbbe561cb  ! 186: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x8d94a147  ! 187: WRPR_PSTATE_I	wrpr	%r18, 0x0147, %pstate
	.word 0xb9e52073  ! 188: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3520000  ! 191: RDPR_PIL	<illegal instruction>
	.word 0xb1e4203d  ! 194: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbb540000  ! 196: RDPR_GL	<illegal instruction>
	.word 0xb9e4e15a  ! 203: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbd540000  ! 207: RDPR_GL	<illegal instruction>
	.word 0xbde520f7  ! 208: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e5a04a  ! 209: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x9195a092  ! 211: WRPR_PIL_I	wrpr	%r22, 0x0092, %pil
	.word 0xbde42000  ! 212: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde5a038  ! 213: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x4c63f09b000009cd, %g1, %r10
	.word 0x839a8000  ! 216: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbde5205b  ! 218: SAVE_I	save	%r20, 0x0001, %r30
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 33)
	.word 0xb3e5e151  ! 226: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e52151  ! 231: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xba35a194  ! 236: SUBC_I	orn 	%r22, 0x0194, %r29
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 35)
	.word 0xb5540000  ! 247: RDPR_GL	<illegal instruction>
	.word 0xb3e4e044  ! 250: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e4605c  ! 254: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x839421e5  ! 255: WRPR_TNPC_I	wrpr	%r16, 0x01e5, %tnpc
	.word 0xbde56073  ! 256: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe461b3  ! 259: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbbe560c9  ! 260: SAVE_I	save	%r21, 0x0001, %r29
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 1)
	.word 0xb7520000  ! 265: RDPR_PIL	<illegal instruction>
	setx	data_start_0, %g1, %r18
	.word 0xb3e42122  ! 267: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e5a1ca  ! 270: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e461c1  ! 271: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe4e115  ! 276: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8d9461b1  ! 278: WRPR_PSTATE_I	wrpr	%r17, 0x01b1, %pstate
	.word 0xbb2c2001  ! 281: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0xb634e084  ! 282: SUBC_I	orn 	%r19, 0x0084, %r27
	.word 0x8794a013  ! 284: WRPR_TT_I	wrpr	%r18, 0x0013, %tt
	.word 0xb7e4e033  ! 286: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde5e057  ! 288: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe46126  ! 293: SAVE_I	save	%r17, 0x0001, %r29
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 0)
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 37)
	.word 0xb3e4a115  ! 306: SAVE_I	save	%r18, 0x0001, %r25
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 3)
	.word 0xb5e421ae  ! 309: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e5e03b  ! 311: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb93d9000  ! 318: SRAX_R	srax	%r22, %r0, %r28
	.word 0xb424618b  ! 320: SUB_I	sub 	%r17, 0x018b, %r26
	.word 0xb5e461a5  ! 322: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x9195e0cf  ! 323: WRPR_PIL_I	wrpr	%r23, 0x00cf, %pil
	setx	data_start_3, %g1, %r23
	.word 0xb7e421ba  ! 325: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbde42180  ! 327: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e4200d  ! 332: SAVE_I	save	%r16, 0x0001, %r27
	mov	0, %r12
	.word 0x8f930000  ! 335: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7e5a1e0  ! 336: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e420cf  ! 337: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe5210e  ! 338: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3e42118  ! 339: SAVE_I	save	%r16, 0x0001, %r25
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb3e4e1c4  ! 342: SAVE_I	save	%r19, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe5e1e4  ! 346: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5480000  ! 347: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 21)
	.word 0xb9e421c5  ! 357: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e4205c  ! 358: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde460e7  ! 362: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7504000  ! 364: RDPR_TNPC	<illegal instruction>
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 3b)
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 9)
	mov	0, %r12
	.word 0x8f930000  ! 370: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3e4e095  ! 377: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8794e1d7  ! 378: WRPR_TT_I	wrpr	%r19, 0x01d7, %tt
	.word 0xb3e4a1ea  ! 381: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x9195a045  ! 382: WRPR_PIL_I	wrpr	%r22, 0x0045, %pil
	.word 0xbfe46083  ! 385: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe5a17d  ! 386: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e461d0  ! 388: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e52089  ! 389: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e4a05e  ! 391: SAVE_I	save	%r18, 0x0001, %r24
	mov	2, %r12
	.word 0x8f930000  ! 394: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x899521ca  ! 396: WRPR_TICK_I	wrpr	%r20, 0x01ca, %tick
	.word 0xb5e4e101  ! 398: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde5e141  ! 401: SAVE_I	save	%r23, 0x0001, %r30
	mov	1, %r12
	.word 0xa1930000  ! 404: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb33cc000  ! 405: SRA_R	sra 	%r19, %r0, %r25
	.word 0x8d95e0b1  ! 406: WRPR_PSTATE_I	wrpr	%r23, 0x00b1, %pstate
	.word 0xbde5a1d9  ! 407: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe56159  ! 409: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe4604b  ! 411: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8d942011  ! 412: WRPR_PSTATE_I	wrpr	%r16, 0x0011, %pstate
	.word 0xb9e460a9  ! 417: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde52092  ! 418: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x71a7c50000007ed0, %g1, %r10
	.word 0x839a8000  ! 419: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbaad4000  ! 421: ANDNcc_R	andncc 	%r21, %r0, %r29
	.word 0xbd51c000  ! 422: RDPR_TL	<illegal instruction>
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb3e56083  ! 427: SAVE_I	save	%r21, 0x0001, %r25
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 10)
	.word 0xb1e4e1bc  ! 431: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4e10a  ! 434: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e52043  ! 435: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb40c8000  ! 438: AND_R	and 	%r18, %r0, %r26
	.word 0xb7e52092  ! 439: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8d95e1ec  ! 441: WRPR_PSTATE_I	wrpr	%r23, 0x01ec, %pstate
	setx	data_start_5, %g1, %r22
	.word 0xbfe520b6  ! 448: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde5a1e9  ! 453: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e4a12a  ! 455: SAVE_I	save	%r18, 0x0001, %r27
	mov	0, %r12
	.word 0xa1930000  ! 459: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde4202b  ! 469: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e4e132  ! 471: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb8950000  ! 475: ORcc_R	orcc 	%r20, %r0, %r28
	.word 0xb9e4e159  ! 483: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e5e1c7  ! 485: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde420ce  ! 487: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde461ea  ! 489: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbcb58000  ! 491: ORNcc_R	orncc 	%r22, %r0, %r30
	.word 0xb5e560fa  ! 492: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e521c4  ! 501: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x819460b9  ! 502: WRPR_TPC_I	wrpr	%r17, 0x00b9, %tpc
	.word 0xb1e4a0b6  ! 506: SAVE_I	save	%r18, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe520db  ! 508: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e4a1ee  ! 512: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde5e056  ! 513: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbd3d0000  ! 514: SRA_R	sra 	%r20, %r0, %r30
	.word 0x8994e05f  ! 515: WRPR_TICK_I	wrpr	%r19, 0x005f, %tick
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb08d8000  ! 524: ANDcc_R	andcc 	%r22, %r0, %r24
	.word 0xbde460b9  ! 525: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e4215f  ! 527: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde4e18e  ! 530: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e421c1  ! 532: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8995a0c5  ! 536: WRPR_TICK_I	wrpr	%r22, 0x00c5, %tick
	.word 0xb1e5218b  ! 537: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e4203c  ! 545: SAVE_I	save	%r16, 0x0001, %r27
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 14)
	.word 0xb5e42111  ! 553: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb014e130  ! 554: OR_I	or 	%r19, 0x0130, %r24
	.word 0xbe2de00f  ! 562: ANDN_I	andn 	%r23, 0x000f, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5e0f8  ! 567: SAVE_I	save	%r23, 0x0001, %r27
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 10)
	.word 0xb351c000  ! 570: RDPR_TL	<illegal instruction>
	.word 0xb12d1000  ! 574: SLLX_R	sllx	%r20, %r0, %r24
	.word 0xbbe46178  ! 576: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb80420e0  ! 577: ADD_I	add 	%r16, 0x00e0, %r28
	setx	0x4492406a000048d7, %g1, %r10
	.word 0x839a8000  ! 580: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb43c8000  ! 582: XNOR_R	xnor 	%r18, %r0, %r26
	mov	0, %r12
	.word 0x8f930000  ! 584: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e52173  ! 585: SAVE_I	save	%r20, 0x0001, %r28
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbde46056  ! 588: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e5e033  ! 589: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x81942166  ! 593: WRPR_TPC_I	wrpr	%r16, 0x0166, %tpc
	.word 0xb2ad4000  ! 595: ANDNcc_R	andncc 	%r21, %r0, %r25
	.word 0xbd500000  ! 596: RDPR_TPC	<illegal instruction>
	.word 0xb5e5e012  ! 598: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde521bd  ! 601: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e560c0  ! 602: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe5a0f0  ! 603: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbe9d0000  ! 606: XORcc_R	xorcc 	%r20, %r0, %r31
	.word 0xbe44a187  ! 608: ADDC_I	addc 	%r18, 0x0187, %r31
	.word 0xb3e46032  ! 612: SAVE_I	save	%r17, 0x0001, %r25
	mov	1, %r12
	.word 0x8f930000  ! 615: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e5e0fa  ! 618: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e421ac  ! 619: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde5e12c  ! 625: SAVE_I	save	%r23, 0x0001, %r30
	setx	0x81d39a4d0000ba48, %g1, %r10
	.word 0x839a8000  ! 627: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd504000  ! 628: RDPR_TNPC	<illegal instruction>
	.word 0x87956019  ! 629: WRPR_TT_I	wrpr	%r21, 0x0019, %tt
	.word 0xbbe52125  ! 636: SAVE_I	save	%r20, 0x0001, %r29
	setx	data_start_3, %g1, %r21
	.word 0xb5e42120  ! 639: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7520000  ! 641: RDPR_PIL	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 642: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb0bc0000  ! 645: XNORcc_R	xnorcc 	%r16, %r0, %r24
	.word 0xbbe5602b  ! 648: SAVE_I	save	%r21, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe5217b  ! 654: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e5e07e  ! 656: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e56027  ! 659: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e4203e  ! 660: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbd518000  ! 661: RDPR_PSTATE	<illegal instruction>
	.word 0xbde5e1ce  ! 662: SAVE_I	save	%r23, 0x0001, %r30
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb0a4e045  ! 664: SUBcc_I	subcc 	%r19, 0x0045, %r24
	.word 0xbde5a180  ! 665: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde561b9  ! 667: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e5a054  ! 670: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde520a7  ! 677: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5510000  ! 678: RDPR_TICK	<illegal instruction>
	.word 0xb9480000  ! 679: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb5e4a0bd  ! 681: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb72c0000  ! 683: SLL_R	sll 	%r16, %r0, %r27
	.word 0xb7e5e0f8  ! 684: SAVE_I	save	%r23, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e461cf  ! 687: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x9194e0a2  ! 689: WRPR_PIL_I	wrpr	%r19, 0x00a2, %pil
	.word 0x8d94a0fb  ! 690: WRPR_PSTATE_I	wrpr	%r18, 0x00fb, %pstate
	.word 0xb5e4e058  ! 691: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8395e18a  ! 695: WRPR_TNPC_I	wrpr	%r23, 0x018a, %tnpc
	.word 0xbbe4203a  ! 698: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd3cc000  ! 702: SRA_R	sra 	%r19, %r0, %r30
	.word 0xb3e4e182  ! 704: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe5617e  ! 706: SAVE_I	save	%r21, 0x0001, %r29
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, e)
	.word 0x819461cd  ! 710: WRPR_TPC_I	wrpr	%r17, 0x01cd, %tpc
	.word 0xb9e4204a  ! 711: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbe85c000  ! 713: ADDcc_R	addcc 	%r23, %r0, %r31
	.word 0x8395a147  ! 723: WRPR_TNPC_I	wrpr	%r22, 0x0147, %tnpc
	.word 0xbcb4210d  ! 724: ORNcc_I	orncc 	%r16, 0x010d, %r30
	.word 0xb5e561e5  ! 725: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1480000  ! 727: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb4b58000  ! 729: SUBCcc_R	orncc 	%r22, %r0, %r26
	.word 0x8d946119  ! 731: WRPR_PSTATE_I	wrpr	%r17, 0x0119, %pstate
	.word 0xb3504000  ! 735: RDPR_TNPC	<illegal instruction>
	.word 0xbbe5213f  ! 738: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9480000  ! 739: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb7540000  ! 742: RDPR_GL	<illegal instruction>
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbbe4e1bd  ! 746: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde561b6  ! 750: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbf643801  ! 752: MOVcc_I	<illegal instruction>
	.word 0xb3e4a1e8  ! 756: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e520af  ! 757: SAVE_I	save	%r20, 0x0001, %r25
	mov	0, %r12
	.word 0x8f930000  ! 760: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe5a1a7  ! 761: SAVE_I	save	%r22, 0x0001, %r29
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, e)
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 1e)
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 34)
	.word 0xb5e421b9  ! 767: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x879520a7  ! 768: WRPR_TT_I	wrpr	%r20, 0x00a7, %tt
	setx	data_start_5, %g1, %r18
	.word 0x8995a093  ! 770: WRPR_TICK_I	wrpr	%r22, 0x0093, %tick
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 0)
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 3)
	.word 0xb1500000  ! 774: RDPR_TPC	<illegal instruction>
	.word 0xb950c000  ! 775: RDPR_TT	<illegal instruction>
	.word 0xbde4e006  ! 777: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe520d8  ! 782: SAVE_I	save	%r20, 0x0001, %r31
	setx	data_start_1, %g1, %r20
	.word 0xbfe5e00f  ! 785: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde561e2  ! 790: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9504000  ! 795: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb534b001  ! 798: SRLX_I	srlx	%r18, 0x0001, %r26
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 16)
	.word 0xb3e42036  ! 801: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde561e3  ! 802: SAVE_I	save	%r21, 0x0001, %r30
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbde52118  ! 817: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe5a091  ! 818: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e4e0aa  ! 819: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbd504000  ! 823: RDPR_TNPC	<illegal instruction>
	.word 0xbbe4a149  ! 824: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e5a1b7  ! 825: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e5a141  ! 827: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x819420c1  ! 832: WRPR_TPC_I	wrpr	%r16, 0x00c1, %tpc
	setx	data_start_3, %g1, %r21
	.word 0xbe342034  ! 836: SUBC_I	orn 	%r16, 0x0034, %r31
	.word 0xbfe5200d  ! 838: SAVE_I	save	%r20, 0x0001, %r31
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb1e5e19f  ! 841: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe46123  ! 845: SAVE_I	save	%r17, 0x0001, %r29
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 13)
	.word 0xb3e4a062  ! 851: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e5e06d  ! 852: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe5e146  ! 858: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e5a1cd  ! 860: SAVE_I	save	%r22, 0x0001, %r24
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 4)
	.word 0xb3510000  ! 862: RDPR_TICK	<illegal instruction>
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 0)
	.word 0xb1e4213e  ! 865: SAVE_I	save	%r16, 0x0001, %r24
	setx	data_start_4, %g1, %r20
	.word 0xba85e04a  ! 869: ADDcc_I	addcc 	%r23, 0x004a, %r29
	.word 0xb3e4e11c  ! 873: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde5a0b3  ! 874: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbd50c000  ! 875: RDPR_TT	<illegal instruction>
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 13)
	.word 0xbf510000  ! 884: RDPR_TICK	<illegal instruction>
	.word 0xbfe4607e  ! 885: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e52051  ! 886: SAVE_I	save	%r20, 0x0001, %r28
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 17)
	.word 0xbcc4c000  ! 892: ADDCcc_R	addccc 	%r19, %r0, %r30
	.word 0xbde5e124  ! 895: SAVE_I	save	%r23, 0x0001, %r30
	setx	0xb771688200002ac5, %g1, %r10
	.word 0x819a8000  ! 899: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_4, %g1, %r20
	.word 0xb9520000  ! 904: RDPR_PIL	<illegal instruction>
	.word 0xb1e421b9  ! 905: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe56086  ! 906: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e5e1d1  ! 907: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe46184  ! 909: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbc0ca19d  ! 919: AND_I	and 	%r18, 0x019d, %r30
	.word 0xbea50000  ! 921: SUBcc_R	subcc 	%r20, %r0, %r31
	.word 0xb7e4a04b  ! 924: SAVE_I	save	%r18, 0x0001, %r27
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb5e4e1e7  ! 926: SAVE_I	save	%r19, 0x0001, %r26
	setx	data_start_5, %g1, %r16
	.word 0xba046004  ! 935: ADD_I	add 	%r17, 0x0004, %r29
	.word 0xb3e561b2  ! 937: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde5e099  ! 939: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e520e5  ! 941: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8594215f  ! 946: WRPR_TSTATE_I	wrpr	%r16, 0x015f, %tstate
	.word 0xb9e4203c  ! 949: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e4a0cd  ! 950: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e561ce  ! 951: SAVE_I	save	%r21, 0x0001, %r27
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 15)
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 38)
	mov	0, %r12
	.word 0xa1930000  ! 967: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb4354000  ! 974: SUBC_R	orn 	%r21, %r0, %r26
	.word 0xb41ca020  ! 977: XOR_I	xor 	%r18, 0x0020, %r26
	.word 0xbfe520cc  ! 979: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e4601c  ! 982: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e421ac  ! 984: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbc9c204e  ! 986: XORcc_I	xorcc 	%r16, 0x004e, %r30
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 6)
	.word 0xbfe5e18b  ! 992: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb0adc000  ! 993: ANDNcc_R	andncc 	%r23, %r0, %r24
	.word 0xbfe560e1  ! 994: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e46131  ! 995: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e5e0ae  ! 998: SAVE_I	save	%r23, 0x0001, %r25
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
	.word 0xf33c205c  ! 5: STDF_I	std	%f25, [0x005c, %r16]
	.word 0xb8b40000  ! 11: ORNcc_R	orncc 	%r16, %r0, %r28
	.word 0x8795a012  ! 14: WRPR_TT_I	wrpr	%r22, 0x0012, %tt
	.word 0xb5643801  ! 15: MOVcc_I	<illegal instruction>
	.word 0xf13ce0a6  ! 20: STDF_I	std	%f24, [0x00a6, %r19]
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 9)
	.word 0xbf2c4000  ! 27: SLL_R	sll 	%r17, %r0, %r31
	.word 0xb204e1e5  ! 28: ADD_I	add 	%r19, 0x01e5, %r25
	.word 0xba3d6040  ! 29: XNOR_I	xnor 	%r21, 0x0040, %r29
	.word 0xf225e094  ! 30: STW_I	stw	%r25, [%r23 + 0x0094]
	.word 0xf625e1ab  ! 32: STW_I	stw	%r27, [%r23 + 0x01ab]
	.word 0xbc04a02b  ! 33: ADD_I	add 	%r18, 0x002b, %r30
	.word 0xb89c4000  ! 35: XORcc_R	xorcc 	%r17, %r0, %r28
	.word 0xf53d0000  ! 37: STDF_R	std	%f26, [%r0, %r20]
	setx	0x9e6c8e5c00002b15, %g1, %r10
	.word 0x839a8000  ! 42: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb4340000  ! 45: ORN_R	orn 	%r16, %r0, %r26
	.word 0xb5480000  ! 50: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb0c4c000  ! 51: ADDCcc_R	addccc 	%r19, %r0, %r24
	.word 0x8d952193  ! 52: WRPR_PSTATE_I	wrpr	%r20, 0x0193, %pstate
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 6)
	.word 0xb32d4000  ! 55: SLL_R	sll 	%r21, %r0, %r25
	.word 0x8d94a190  ! 56: WRPR_PSTATE_I	wrpr	%r18, 0x0190, %pstate
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 11)
	.word 0xb0c40000  ! 61: ADDCcc_R	addccc 	%r16, %r0, %r24
	.word 0xf034a128  ! 62: STH_I	sth	%r24, [%r18 + 0x0128]
	.word 0xf875c000  ! 63: STX_R	stx	%r28, [%r23 + %r0]
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf874e0c2  ! 69: STX_I	stx	%r28, [%r19 + 0x00c2]
	.word 0xb7480000  ! 72: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfe74e104  ! 73: STX_I	stx	%r31, [%r19 + 0x0104]
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf43d2184  ! 76: STD_I	std	%r26, [%r20 + 0x0184]
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 22)
	.word 0xfa74a1be  ! 78: STX_I	stx	%r29, [%r18 + 0x01be]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 29)
	.word 0xb350c000  ! 85: RDPR_TT	rdpr	%tt, %r25
	.word 0xfc344000  ! 86: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xf03dc000  ! 89: STD_R	std	%r24, [%r23 + %r0]
	.word 0xbeb52180  ! 92: ORNcc_I	orncc 	%r20, 0x0180, %r31
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 27)
	.word 0xf53d206b  ! 96: STDF_I	std	%f26, [0x006b, %r20]
	.word 0xf2340000  ! 99: STH_R	sth	%r25, [%r16 + %r0]
	.word 0x9194e0b5  ! 105: WRPR_PIL_I	wrpr	%r19, 0x00b5, %pil
	.word 0xfc2c60b8  ! 106: STB_I	stb	%r30, [%r17 + 0x00b8]
	setx	data_start_2, %g1, %r22
	.word 0xfc750000  ! 116: STX_R	stx	%r30, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x1049e4510000af84, %g1, %r10
	.word 0x819a8000  ! 121: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf275e115  ! 124: STX_I	stx	%r25, [%r23 + 0x0115]
	.word 0xf234e0d7  ! 125: STH_I	sth	%r25, [%r19 + 0x00d7]
	.word 0xfc2c0000  ! 126: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xfc3d8000  ! 131: STD_R	std	%r30, [%r22 + %r0]
	.word 0xfc2dc000  ! 132: STB_R	stb	%r30, [%r23 + %r0]
	setx	data_start_5, %g1, %r20
	.word 0xf024e0ca  ! 138: STW_I	stw	%r24, [%r19 + 0x00ca]
	.word 0xf03dc000  ! 140: STD_R	std	%r24, [%r23 + %r0]
	.word 0xfa24606b  ! 141: STW_I	stw	%r29, [%r17 + 0x006b]
	.word 0xf53ce0c3  ! 142: STDF_I	std	%f26, [0x00c3, %r19]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x4897c03100003a09, %g1, %r10
	.word 0x839a8000  ! 147: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe35a09a  ! 149: STH_I	sth	%r31, [%r22 + 0x009a]
	.word 0xfc7420e0  ! 153: STX_I	stx	%r30, [%r16 + 0x00e0]
	.word 0xbb504000  ! 155: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xf2252019  ! 157: STW_I	stw	%r25, [%r20 + 0x0019]
	.word 0xf42d0000  ! 158: STB_R	stb	%r26, [%r20 + %r0]
	setx	0x7ede8cc800003c8d, %g1, %r10
	.word 0x819a8000  ! 162: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe35612a  ! 166: STH_I	sth	%r31, [%r21 + 0x012a]
	.word 0x8995a116  ! 167: WRPR_TICK_I	wrpr	%r22, 0x0116, %tick
	.word 0x839460dc  ! 170: WRPR_TNPC_I	wrpr	%r17, 0x00dc, %tnpc
	.word 0xf73c6149  ! 172: STDF_I	std	%f27, [0x0149, %r17]
	.word 0xfc34e146  ! 173: STH_I	sth	%r30, [%r19 + 0x0146]
	setx	data_start_4, %g1, %r23
	.word 0xbc2d4000  ! 180: ANDN_R	andn 	%r21, %r0, %r30
	setx	data_start_5, %g1, %r19
	.word 0xf024e06b  ! 183: STW_I	stw	%r24, [%r19 + 0x006b]
	.word 0xf4252001  ! 185: STW_I	stw	%r26, [%r20 + 0x0001]
	.word 0x8d95e04f  ! 187: WRPR_PSTATE_I	wrpr	%r23, 0x004f, %pstate
	.word 0xb3520000  ! 191: RDPR_PIL	rdpr	%pil, %r25
	.word 0xfa24a192  ! 195: STW_I	stw	%r29, [%r18 + 0x0192]
	.word 0xbf540000  ! 196: RDPR_GL	<illegal instruction>
	.word 0xf234217c  ! 198: STH_I	sth	%r25, [%r16 + 0x017c]
	.word 0xf02c202f  ! 200: STB_I	stb	%r24, [%r16 + 0x002f]
	.word 0xfc244000  ! 201: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xf22d4000  ! 204: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xf93d8000  ! 205: STDF_R	std	%f28, [%r0, %r22]
	.word 0xb9540000  ! 207: RDPR_GL	<illegal instruction>
	.word 0x919520dc  ! 211: WRPR_PIL_I	wrpr	%r20, 0x00dc, %pil
	setx	0xcaa18ec40000cf88, %g1, %r10
	.word 0x839a8000  ! 216: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf23d2180  ! 219: STD_I	std	%r25, [%r20 + 0x0180]
	.word 0xf635e182  ! 220: STH_I	sth	%r27, [%r23 + 0x0182]
	.word 0xfc348000  ! 222: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xf33c0000  ! 223: STDF_R	std	%f25, [%r0, %r16]
	.word 0xf835a0c4  ! 224: STH_I	sth	%r28, [%r22 + 0x00c4]
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 12)
	.word 0xf22dc000  ! 229: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xf2240000  ! 230: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xbe34a1df  ! 236: SUBC_I	orn 	%r18, 0x01df, %r31
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 36)
	.word 0xf87460df  ! 244: STX_I	stx	%r28, [%r17 + 0x00df]
	.word 0xf33d61f7  ! 246: STDF_I	std	%f25, [0x01f7, %r21]
	.word 0xb9540000  ! 247: RDPR_GL	rdpr	%-, %r28
	.word 0xfe2c60a0  ! 252: STB_I	stb	%r31, [%r17 + 0x00a0]
	.word 0x839460d2  ! 255: WRPR_TNPC_I	wrpr	%r17, 0x00d2, %tnpc
	.word 0xfa254000  ! 261: STW_R	stw	%r29, [%r21 + %r0]
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 30)
	.word 0xf474a1b0  ! 263: STX_I	stx	%r26, [%r18 + 0x01b0]
	.word 0xf13d0000  ! 264: STDF_R	std	%f24, [%r0, %r20]
	.word 0xb3520000  ! 265: RDPR_PIL	rdpr	%pil, %r25
	setx	data_start_0, %g1, %r21
	.word 0xf63c4000  ! 275: STD_R	std	%r27, [%r17 + %r0]
	.word 0x8d95e091  ! 278: WRPR_PSTATE_I	wrpr	%r23, 0x0091, %pstate
	.word 0xf63d8000  ! 280: STD_R	std	%r27, [%r22 + %r0]
	.word 0xbd2d2001  ! 281: SLL_I	sll 	%r20, 0x0001, %r30
	.word 0xb234a065  ! 282: SUBC_I	orn 	%r18, 0x0065, %r25
	.word 0x8795a014  ! 284: WRPR_TT_I	wrpr	%r22, 0x0014, %tt
	.word 0xf23d0000  ! 287: STD_R	std	%r25, [%r20 + %r0]
	.word 0xf62ce03f  ! 289: STB_I	stb	%r27, [%r19 + 0x003f]
	.word 0xf234c000  ! 290: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xf87520e1  ! 291: STX_I	stx	%r28, [%r20 + 0x00e1]
	.word 0xfc344000  ! 292: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xf73dc000  ! 295: STDF_R	std	%f27, [%r0, %r23]
	.word 0xfa3c20e9  ! 296: STD_I	std	%r29, [%r16 + 0x00e9]
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, d)
	.word 0xf93d8000  ! 300: STDF_R	std	%f28, [%r0, %r22]
	.word 0xf22ce1ef  ! 301: STB_I	stb	%r25, [%r19 + 0x01ef]
	.word 0xf83ca00f  ! 302: STD_I	std	%r28, [%r18 + 0x000f]
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, b)
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 20)
	.word 0xfc75217b  ! 310: STX_I	stx	%r30, [%r20 + 0x017b]
	.word 0xbf3d9000  ! 318: SRAX_R	srax	%r22, %r0, %r31
	.word 0xb825e1ec  ! 320: SUB_I	sub 	%r23, 0x01ec, %r28
	.word 0x9194214c  ! 323: WRPR_PIL_I	wrpr	%r16, 0x014c, %pil
	setx	data_start_7, %g1, %r18
	.word 0xfa3d4000  ! 326: STD_R	std	%r29, [%r21 + %r0]
	.word 0xfa75201f  ! 330: STX_I	stx	%r29, [%r20 + 0x001f]
	mov	0, %r12
	.word 0x8f930000  ! 335: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 32)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7480000  ! 347: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfc348000  ! 348: STH_R	sth	%r30, [%r18 + %r0]
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 39)
	.word 0xf22521a3  ! 354: STW_I	stw	%r25, [%r20 + 0x01a3]
	.word 0xf23dc000  ! 359: STD_R	std	%r25, [%r23 + %r0]
	.word 0xfa3da08c  ! 360: STD_I	std	%r29, [%r22 + 0x008c]
	.word 0xfe2da182  ! 361: STB_I	stb	%r31, [%r22 + 0x0182]
	.word 0xbf504000  ! 364: RDPR_TNPC	<illegal instruction>
	.word 0xf6250000  ! 366: STW_R	stw	%r27, [%r20 + %r0]
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 8)
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 29)
	mov	1, %r12
	.word 0x8f930000  ! 370: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf0258000  ! 371: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xf8340000  ! 373: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xfb3cc000  ! 376: STDF_R	std	%f29, [%r0, %r19]
	.word 0x8794e007  ! 378: WRPR_TT_I	wrpr	%r19, 0x0007, %tt
	.word 0xfb3cc000  ! 379: STDF_R	std	%f29, [%r0, %r19]
	.word 0x9194a0e6  ! 382: WRPR_PIL_I	wrpr	%r18, 0x00e6, %pil
	.word 0xf6252144  ! 392: STW_I	stw	%r27, [%r20 + 0x0144]
	mov	2, %r12
	.word 0x8f930000  ! 394: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x89946186  ! 396: WRPR_TICK_I	wrpr	%r17, 0x0186, %tick
	.word 0xfd3d0000  ! 399: STDF_R	std	%f30, [%r0, %r20]
	.word 0xf63c6067  ! 400: STD_I	std	%r27, [%r17 + 0x0067]
	.word 0xf83d8000  ! 403: STD_R	std	%r28, [%r22 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 404: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb33d8000  ! 405: SRA_R	sra 	%r22, %r0, %r25
	.word 0x8d952123  ! 406: WRPR_PSTATE_I	wrpr	%r20, 0x0123, %pstate
	.word 0xf0358000  ! 408: STH_R	sth	%r24, [%r22 + %r0]
	.word 0x8d9520b2  ! 412: WRPR_PSTATE_I	wrpr	%r20, 0x00b2, %pstate
	.word 0xfc346104  ! 413: STH_I	sth	%r30, [%r17 + 0x0104]
	setx	0x454bfe120000fd49, %g1, %r10
	.word 0x839a8000  ! 419: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbaadc000  ! 421: ANDNcc_R	andncc 	%r23, %r0, %r29
	.word 0xbd51c000  ! 422: RDPR_TL	rdpr	%tl, %r30
	.word 0xf2258000  ! 424: STW_R	stw	%r25, [%r22 + %r0]
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 36)
	.word 0xf83c4000  ! 426: STD_R	std	%r28, [%r17 + %r0]
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf0748000  ! 432: STX_R	stx	%r24, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf024e005  ! 437: STW_I	stw	%r24, [%r19 + 0x0005]
	.word 0xbe0c0000  ! 438: AND_R	and 	%r16, %r0, %r31
	.word 0x8d94e104  ! 441: WRPR_PSTATE_I	wrpr	%r19, 0x0104, %pstate
	setx	data_start_1, %g1, %r20
	.word 0xfe3ce03e  ! 447: STD_I	std	%r31, [%r19 + 0x003e]
	.word 0xf33c4000  ! 450: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf63d4000  ! 452: STD_R	std	%r27, [%r21 + %r0]
	.word 0xff3d8000  ! 454: STDF_R	std	%f31, [%r0, %r22]
	mov	2, %r12
	.word 0xa1930000  ! 459: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf03dc000  ! 461: STD_R	std	%r24, [%r23 + %r0]
	.word 0xff3ce1f1  ! 464: STDF_I	std	%f31, [0x01f1, %r19]
	.word 0xf82de10e  ! 466: STB_I	stb	%r28, [%r23 + 0x010e]
	.word 0xfa2d4000  ! 468: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xf73d6129  ! 470: STDF_I	std	%f27, [0x0129, %r21]
	.word 0xbc958000  ! 475: ORcc_R	orcc 	%r22, %r0, %r30
	.word 0xf93ca1eb  ! 479: STDF_I	std	%f28, [0x01eb, %r18]
	.word 0xf33d8000  ! 480: STDF_R	std	%f25, [%r0, %r22]
	.word 0xfc75a1ee  ! 482: STX_I	stx	%r30, [%r22 + 0x01ee]
	.word 0xbab58000  ! 491: ORNcc_R	orncc 	%r22, %r0, %r29
	.word 0xf33dc000  ! 493: STDF_R	std	%f25, [%r0, %r23]
	.word 0xf82d4000  ! 497: STB_R	stb	%r28, [%r21 + %r0]
	.word 0x8194e0f7  ! 502: WRPR_TPC_I	wrpr	%r19, 0x00f7, %tpc
	.word 0xf824e032  ! 505: STW_I	stw	%r28, [%r19 + 0x0032]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa25c000  ! 509: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xf2356022  ! 511: STH_I	sth	%r25, [%r21 + 0x0022]
	.word 0xbd3d0000  ! 514: SRA_R	sra 	%r20, %r0, %r30
	.word 0x899521fc  ! 515: WRPR_TICK_I	wrpr	%r20, 0x01fc, %tick
	.word 0xf275e1b6  ! 516: STX_I	stx	%r25, [%r23 + 0x01b6]
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, d)
	.word 0xf0256126  ! 519: STW_I	stw	%r24, [%r21 + 0x0126]
	.word 0xb88cc000  ! 524: ANDcc_R	andcc 	%r19, %r0, %r28
	.word 0xff3c6028  ! 528: STDF_I	std	%f31, [0x0028, %r17]
	.word 0xf93c61d9  ! 531: STDF_I	std	%f28, [0x01d9, %r17]
	.word 0x8994a051  ! 536: WRPR_TICK_I	wrpr	%r18, 0x0051, %tick
	.word 0xf834a19a  ! 538: STH_I	sth	%r28, [%r18 + 0x019a]
	.word 0xf0348000  ! 539: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf8740000  ! 541: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xf625e09f  ! 548: STW_I	stw	%r27, [%r23 + 0x009f]
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 11)
	.word 0xbe15e1d5  ! 554: OR_I	or 	%r23, 0x01d5, %r31
	.word 0xf224e167  ! 556: STW_I	stw	%r25, [%r19 + 0x0167]
	.word 0xf13cc000  ! 560: STDF_R	std	%f24, [%r0, %r19]
	.word 0xb22c21bf  ! 562: ANDN_I	andn 	%r16, 0x01bf, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf825a1f3  ! 565: STW_I	stw	%r28, [%r22 + 0x01f3]
	.word 0xf275610f  ! 566: STX_I	stx	%r25, [%r21 + 0x010f]
	.word 0xfd3d6038  ! 568: STDF_I	std	%f30, [0x0038, %r21]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 34)
	.word 0xb951c000  ! 570: RDPR_TL	rdpr	%tl, %r28
	.word 0xb32cd000  ! 574: SLLX_R	sllx	%r19, %r0, %r25
	.word 0xbe042068  ! 577: ADD_I	add 	%r16, 0x0068, %r31
	.word 0xf434e111  ! 579: STH_I	sth	%r26, [%r19 + 0x0111]
	setx	0xe2a98eec00007990, %g1, %r10
	.word 0x839a8000  ! 580: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbc3c0000  ! 582: XNOR_R	xnor 	%r16, %r0, %r30
	mov	0, %r12
	.word 0x8f930000  ! 584: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf635e0f7  ! 586: STH_I	sth	%r27, [%r23 + 0x00f7]
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 2)
	.word 0xfe2c21b9  ! 592: STB_I	stb	%r31, [%r16 + 0x01b9]
	.word 0x8195a15a  ! 593: WRPR_TPC_I	wrpr	%r22, 0x015a, %tpc
	.word 0xb2ac4000  ! 595: ANDNcc_R	andncc 	%r17, %r0, %r25
	.word 0xbd500000  ! 596: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xf42da1ba  ! 599: STB_I	stb	%r26, [%r22 + 0x01ba]
	.word 0xfa244000  ! 600: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xfe74206e  ! 605: STX_I	stx	%r31, [%r16 + 0x006e]
	.word 0xb29dc000  ! 606: XORcc_R	xorcc 	%r23, %r0, %r25
	.word 0xf42cc000  ! 607: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xbe45a175  ! 608: ADDC_I	addc 	%r22, 0x0175, %r31
	.word 0xf03d4000  ! 611: STD_R	std	%r24, [%r21 + %r0]
	mov	2, %r12
	.word 0x8f930000  ! 615: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf834613e  ! 620: STH_I	sth	%r28, [%r17 + 0x013e]
	setx	0x9c0ca4e200009a5f, %g1, %r10
	.word 0x839a8000  ! 627: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb504000  ! 628: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0x879461c0  ! 629: WRPR_TT_I	wrpr	%r17, 0x01c0, %tt
	.word 0xf635e129  ! 633: STH_I	sth	%r27, [%r23 + 0x0129]
	.word 0xfa75a0d8  ! 634: STX_I	stx	%r29, [%r22 + 0x00d8]
	.word 0xf27461c3  ! 637: STX_I	stx	%r25, [%r17 + 0x01c3]
	setx	data_start_0, %g1, %r21
	.word 0xbb520000  ! 641: RDPR_PIL	rdpr	%pil, %r29
	mov	2, %r12
	.word 0x8f930000  ! 642: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf634e146  ! 643: STH_I	sth	%r27, [%r19 + 0x0146]
	.word 0xbabc4000  ! 645: XNORcc_R	xnorcc 	%r17, %r0, %r29
	.word 0xfc24608e  ! 646: STW_I	stw	%r30, [%r17 + 0x008e]
	.word 0xf6750000  ! 647: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xf33d4000  ! 650: STDF_R	std	%f25, [%r0, %r21]
	.word 0xf82c218e  ! 651: STB_I	stb	%r28, [%r16 + 0x018e]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe350000  ! 658: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xbf518000  ! 661: RDPR_PSTATE	rdpr	%pstate, %r31
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 35)
	.word 0xb8a520b8  ! 664: SUBcc_I	subcc 	%r20, 0x00b8, %r28
	.word 0xfa3d207d  ! 666: STD_I	std	%r29, [%r20 + 0x007d]
	.word 0xfc758000  ! 668: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xf42c61ae  ! 673: STB_I	stb	%r26, [%r17 + 0x01ae]
	.word 0xb3510000  ! 678: RDPR_TICK	<illegal instruction>
	.word 0xbb480000  ! 679: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb52c4000  ! 683: SLL_R	sll 	%r17, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2da153  ! 686: STB_I	stb	%r31, [%r22 + 0x0153]
	.word 0xfc2c0000  ! 688: STB_R	stb	%r30, [%r16 + %r0]
	.word 0x919520d9  ! 689: WRPR_PIL_I	wrpr	%r20, 0x00d9, %pil
	.word 0x8d9420c8  ! 690: WRPR_PSTATE_I	wrpr	%r16, 0x00c8, %pstate
	.word 0xfa75e038  ! 693: STX_I	stx	%r29, [%r23 + 0x0038]
	.word 0x8395e0ab  ! 695: WRPR_TNPC_I	wrpr	%r23, 0x00ab, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb93cc000  ! 702: SRA_R	sra 	%r19, %r0, %r28
	.word 0xf47561f0  ! 705: STX_I	stx	%r26, [%r21 + 0x01f0]
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 26)
	.word 0x81942038  ! 710: WRPR_TPC_I	wrpr	%r16, 0x0038, %tpc
	.word 0xb8854000  ! 713: ADDcc_R	addcc 	%r21, %r0, %r28
	.word 0xf8340000  ! 716: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xf0356167  ! 719: STH_I	sth	%r24, [%r21 + 0x0167]
	.word 0x8395a137  ! 723: WRPR_TNPC_I	wrpr	%r22, 0x0137, %tnpc
	.word 0xbab521bd  ! 724: ORNcc_I	orncc 	%r20, 0x01bd, %r29
	.word 0xbf480000  ! 727: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfc3d4000  ! 728: STD_R	std	%r30, [%r21 + %r0]
	.word 0xb4b40000  ! 729: SUBCcc_R	orncc 	%r16, %r0, %r26
	.word 0x8d9521c7  ! 731: WRPR_PSTATE_I	wrpr	%r20, 0x01c7, %pstate
	.word 0xfe34a111  ! 734: STH_I	sth	%r31, [%r18 + 0x0111]
	.word 0xb7504000  ! 735: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xbd480000  ! 739: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb3540000  ! 742: RDPR_GL	<illegal instruction>
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 12)
	.word 0xf074a08d  ! 744: STX_I	stx	%r24, [%r18 + 0x008d]
	.word 0xfe250000  ! 751: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xb1643801  ! 752: MOVcc_I	<illegal instruction>
	.word 0xf624c000  ! 755: STW_R	stw	%r27, [%r19 + %r0]
	mov	0, %r12
	.word 0x8f930000  ! 760: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 33)
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 5)
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 5)
	.word 0x879461c8  ! 768: WRPR_TT_I	wrpr	%r17, 0x01c8, %tt
	setx	data_start_6, %g1, %r16
	.word 0x89952107  ! 770: WRPR_TICK_I	wrpr	%r20, 0x0107, %tick
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 2a)
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 6)
	.word 0xf83d8000  ! 773: STD_R	std	%r28, [%r22 + %r0]
	.word 0xb5500000  ! 774: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xb150c000  ! 775: RDPR_TT	<illegal instruction>
	.word 0xf6250000  ! 781: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xfc75c000  ! 783: STX_R	stx	%r30, [%r23 + %r0]
	setx	data_start_4, %g1, %r17
	.word 0xf674e1d1  ! 787: STX_I	stx	%r27, [%r19 + 0x01d1]
	.word 0xf474e1b2  ! 788: STX_I	stx	%r26, [%r19 + 0x01b2]
	.word 0xf874c000  ! 789: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf63c8000  ! 791: STD_R	std	%r27, [%r18 + %r0]
	.word 0xf63d4000  ! 792: STD_R	std	%r27, [%r21 + %r0]
	.word 0xb1504000  ! 795: RDPR_TNPC	<illegal instruction>
	.word 0xf82d0000  ! 796: STB_R	stb	%r28, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb534f001  ! 798: SRLX_I	srlx	%r19, 0x0001, %r26
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 21)
	.word 0xf024e159  ! 803: STW_I	stw	%r24, [%r19 + 0x0159]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf624e1e3  ! 805: STW_I	stw	%r27, [%r19 + 0x01e3]
	.word 0xf034a189  ! 811: STH_I	sth	%r24, [%r18 + 0x0189]
	.word 0xf6756136  ! 815: STX_I	stx	%r27, [%r21 + 0x0136]
	.word 0xf13de0a1  ! 820: STDF_I	std	%f24, [0x00a1, %r23]
	.word 0xf62de159  ! 821: STB_I	stb	%r27, [%r23 + 0x0159]
	.word 0xbd504000  ! 823: RDPR_TNPC	<illegal instruction>
	.word 0xf63c20d2  ! 826: STD_I	std	%r27, [%r16 + 0x00d2]
	.word 0x81942164  ! 832: WRPR_TPC_I	wrpr	%r16, 0x0164, %tpc
	setx	data_start_7, %g1, %r17
	.word 0xf2744000  ! 834: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xf33ca017  ! 835: STDF_I	std	%f25, [0x0017, %r18]
	.word 0xbe35605c  ! 836: SUBC_I	orn 	%r21, 0x005c, %r31
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfe75a141  ! 843: STX_I	stx	%r31, [%r22 + 0x0141]
	.word 0xfe2ca0d6  ! 844: STB_I	stb	%r31, [%r18 + 0x00d6]
	.word 0xf024c000  ! 846: STW_R	stw	%r24, [%r19 + %r0]
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 1)
	.word 0xf0258000  ! 853: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xf8348000  ! 855: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xf43d8000  ! 856: STD_R	std	%r26, [%r22 + %r0]
	.word 0xf424e13b  ! 859: STW_I	stw	%r26, [%r19 + 0x013b]
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 14)
	.word 0xb9510000  ! 862: RDPR_TICK	rdpr	%tick, %r28
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 27)
	.word 0xf53cc000  ! 864: STDF_R	std	%f26, [%r0, %r19]
	setx	data_start_6, %g1, %r19
	.word 0xba8421ac  ! 869: ADDcc_I	addcc 	%r16, 0x01ac, %r29
	.word 0xbd50c000  ! 875: RDPR_TT	rdpr	%tt, %r30
	.word 0xfc2cc000  ! 877: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf23c0000  ! 879: STD_R	std	%r25, [%r16 + %r0]
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, f)
	.word 0xb1510000  ! 884: RDPR_TICK	<illegal instruction>
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 2e)
	.word 0xb0c54000  ! 892: ADDCcc_R	addccc 	%r21, %r0, %r24
	setx	0x8ddfa3e900000fd8, %g1, %r10
	.word 0x819a8000  ! 899: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_5, %g1, %r19
	.word 0xf63c0000  ! 903: STD_R	std	%r27, [%r16 + %r0]
	.word 0xb5520000  ! 904: RDPR_PIL	rdpr	%pil, %r26
	.word 0xf024a05d  ! 908: STW_I	stw	%r24, [%r18 + 0x005d]
	.word 0xf53de114  ! 914: STDF_I	std	%f26, [0x0114, %r23]
	.word 0xb80c20ca  ! 919: AND_I	and 	%r16, 0x00ca, %r28
	.word 0xf73da048  ! 920: STDF_I	std	%f27, [0x0048, %r22]
	.word 0xb0a4c000  ! 921: SUBcc_R	subcc 	%r19, %r0, %r24
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 3c)
	setx	data_start_1, %g1, %r19
	.word 0xf02c0000  ! 931: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xf42c8000  ! 932: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xfa2cc000  ! 934: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xb20461ba  ! 935: ADD_I	add 	%r17, 0x01ba, %r25
	.word 0x8594a1cd  ! 946: WRPR_TSTATE_I	wrpr	%r18, 0x01cd, %tstate
	.word 0xfa3c614b  ! 947: STD_I	std	%r29, [%r17 + 0x014b]
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 2)
	.word 0xfc342072  ! 961: STH_I	sth	%r30, [%r16 + 0x0072]
	.word 0xfc258000  ! 964: STW_R	stw	%r30, [%r22 + %r0]
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 24)
	mov	2, %r12
	.word 0xa1930000  ! 967: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf83521b9  ! 968: STH_I	sth	%r28, [%r20 + 0x01b9]
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 18)
	.word 0xb2358000  ! 974: SUBC_R	orn 	%r22, %r0, %r25
	.word 0xfd3de1fd  ! 976: STDF_I	std	%f30, [0x01fd, %r23]
	.word 0xba1c2047  ! 977: XOR_I	xor 	%r16, 0x0047, %r29
	.word 0xfd3de112  ! 983: STDF_I	std	%f30, [0x0112, %r23]
	.word 0xb09d6034  ! 986: XORcc_I	xorcc 	%r21, 0x0034, %r24
	.word 0xf53da1fc  ! 987: STDF_I	std	%f26, [0x01fc, %r22]
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, 2)
	.word 0xfc746148  ! 991: STX_I	stx	%r30, [%r17 + 0x0148]
	.word 0xbcad4000  ! 993: ANDNcc_R	andncc 	%r21, %r0, %r30
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
	.word 0xf64c8000  ! 4: LDSB_R	ldsb	[%r18 + %r0], %r27
	.word 0xfe05604a  ! 7: LDUW_I	lduw	[%r21 + 0x004a], %r31
	.word 0xf814c000  ! 10: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xb2b40000  ! 11: ORNcc_R	orncc 	%r16, %r0, %r25
	.word 0xf41c8000  ! 13: LDD_R	ldd	[%r18 + %r0], %r26
	.word 0x8795e0a2  ! 14: WRPR_TT_I	wrpr	%r23, 0x00a2, %tt
	.word 0xbb643801  ! 15: MOVcc_I	<illegal instruction>
	.word 0xf65cc000  ! 21: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xf054e18b  ! 22: LDSH_I	ldsh	[%r19 + 0x018b], %r24
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 10)
	.word 0xbf2d8000  ! 27: SLL_R	sll 	%r22, %r0, %r31
	.word 0xbc052084  ! 28: ADD_I	add 	%r20, 0x0084, %r30
	.word 0xbe3de04c  ! 29: XNOR_I	xnor 	%r23, 0x004c, %r31
	.word 0xba04603f  ! 33: ADD_I	add 	%r17, 0x003f, %r29
	.word 0xb89c8000  ! 35: XORcc_R	xorcc 	%r18, %r0, %r28
	.word 0xf815c000  ! 38: LDUH_R	lduh	[%r23 + %r0], %r28
	.word 0xf81de19a  ! 39: LDD_I	ldd	[%r23 + 0x019a], %r28
	.word 0xf20ca060  ! 40: LDUB_I	ldub	[%r18 + 0x0060], %r25
	setx	0xc491b06300007b9b, %g1, %r10
	.word 0x839a8000  ! 42: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb6350000  ! 45: ORN_R	orn 	%r20, %r0, %r27
	.word 0xfa4d4000  ! 47: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xb9480000  ! 50: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbec54000  ! 51: ADDCcc_R	addccc 	%r21, %r0, %r31
	.word 0x8d946150  ! 52: WRPR_PSTATE_I	wrpr	%r17, 0x0150, %pstate
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb12d8000  ! 55: SLL_R	sll 	%r22, %r0, %r24
	.word 0x8d94206d  ! 56: WRPR_PSTATE_I	wrpr	%r16, 0x006d, %pstate
	.word 0xfe1c8000  ! 57: LDD_R	ldd	[%r18 + %r0], %r31
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 6)
	.word 0xf44c211c  ! 60: LDSB_I	ldsb	[%r16 + 0x011c], %r26
	.word 0xbac5c000  ! 61: ADDCcc_R	addccc 	%r23, %r0, %r29
	.word 0xfc1de198  ! 67: LDD_I	ldd	[%r23 + 0x0198], %r30
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 2)
	.word 0xb1480000  ! 72: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 5)
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 0)
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 29)
	.word 0xb550c000  ! 85: RDPR_TT	<illegal instruction>
	.word 0xfc0520ad  ! 88: LDUW_I	lduw	[%r20 + 0x00ad], %r30
	.word 0xbab56042  ! 92: ORNcc_I	orncc 	%r21, 0x0042, %r29
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 27)
	.word 0xf61461d5  ! 94: LDUH_I	lduh	[%r17 + 0x01d5], %r27
	.word 0xff1c8000  ! 98: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xf4554000  ! 100: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xfb1c60cf  ! 101: LDDF_I	ldd	[%r17, 0x00cf], %f29
	.word 0x919420a7  ! 105: WRPR_PIL_I	wrpr	%r16, 0x00a7, %pil
	.word 0xf45c6196  ! 109: LDX_I	ldx	[%r17 + 0x0196], %r26
	.word 0xf44d8000  ! 112: LDSB_R	ldsb	[%r22 + %r0], %r26
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x3d66190a0000c919, %g1, %r10
	.word 0x819a8000  ! 121: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf204212f  ! 123: LDUW_I	lduw	[%r16 + 0x012f], %r25
	.word 0xf814c000  ! 129: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xf71dc000  ! 130: LDDF_R	ldd	[%r23, %r0], %f27
	.word 0xf84d4000  ! 134: LDSB_R	ldsb	[%r21 + %r0], %r28
	setx	data_start_5, %g1, %r21
	.word 0xf6154000  ! 137: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xf01d216d  ! 139: LDD_I	ldd	[%r20 + 0x016d], %r24
	.word 0xfa1dc000  ! 143: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xf44560c8  ! 144: LDSW_I	ldsw	[%r21 + 0x00c8], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe154000  ! 146: LDUH_R	lduh	[%r21 + %r0], %r31
	setx	0x4303b5fb0000498b, %g1, %r10
	.word 0x839a8000  ! 147: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe1c8000  ! 151: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xfe546069  ! 154: LDSH_I	ldsh	[%r17 + 0x0069], %r31
	.word 0xb9504000  ! 155: RDPR_TNPC	<illegal instruction>
	.word 0xf0150000  ! 161: LDUH_R	lduh	[%r20 + %r0], %r24
	setx	0x424b306000002a4c, %g1, %r10
	.word 0x819a8000  ! 162: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf65d20b0  ! 164: LDX_I	ldx	[%r20 + 0x00b0], %r27
	.word 0x89946013  ! 167: WRPR_TICK_I	wrpr	%r17, 0x0013, %tick
	.word 0x8395e181  ! 170: WRPR_TNPC_I	wrpr	%r23, 0x0181, %tnpc
	setx	data_start_2, %g1, %r18
	.word 0xb22d0000  ! 180: ANDN_R	andn 	%r20, %r0, %r25
	setx	data_start_2, %g1, %r21
	.word 0x8d95e0f8  ! 187: WRPR_PSTATE_I	wrpr	%r23, 0x00f8, %pstate
	.word 0xfe546110  ! 190: LDSH_I	ldsh	[%r17 + 0x0110], %r31
	.word 0xb7520000  ! 191: RDPR_PIL	<illegal instruction>
	.word 0xb5540000  ! 196: RDPR_GL	<illegal instruction>
	.word 0xf01dc000  ! 199: LDD_R	ldd	[%r23 + %r0], %r24
	.word 0xf25c6096  ! 206: LDX_I	ldx	[%r17 + 0x0096], %r25
	.word 0xb7540000  ! 207: RDPR_GL	<illegal instruction>
	.word 0xf60dc000  ! 210: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0x9195a180  ! 211: WRPR_PIL_I	wrpr	%r22, 0x0180, %pil
	setx	0x3e1f3eaf0000ff00, %g1, %r10
	.word 0x839a8000  ! 216: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 2)
	.word 0xf45da1db  ! 232: LDX_I	ldx	[%r22 + 0x01db], %r26
	.word 0xfc14a072  ! 233: LDUH_I	lduh	[%r18 + 0x0072], %r30
	.word 0xfc442166  ! 235: LDSW_I	ldsw	[%r16 + 0x0166], %r30
	.word 0xba34e0c9  ! 236: SUBC_I	orn 	%r19, 0x00c9, %r29
	.word 0xfc5dc000  ! 237: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xfc1de0a0  ! 242: LDD_I	ldd	[%r23 + 0x00a0], %r30
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 26)
	.word 0xf41d8000  ! 245: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0xb1540000  ! 247: RDPR_GL	<illegal instruction>
	.word 0x8395e1d4  ! 255: WRPR_TNPC_I	wrpr	%r23, 0x01d4, %tnpc
	.word 0xf4054000  ! 257: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xf40da144  ! 258: LDUB_I	ldub	[%r22 + 0x0144], %r26
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb1520000  ! 265: RDPR_PIL	<illegal instruction>
	setx	data_start_7, %g1, %r16
	.word 0xfd1dc000  ! 268: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0xfa5c8000  ! 274: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xf20de13b  ! 277: LDUB_I	ldub	[%r23 + 0x013b], %r25
	.word 0x8d95a193  ! 278: WRPR_PSTATE_I	wrpr	%r22, 0x0193, %pstate
	.word 0xf40d0000  ! 279: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xbf2ce001  ! 281: SLL_I	sll 	%r19, 0x0001, %r31
	.word 0xbe342095  ! 282: SUBC_I	orn 	%r16, 0x0095, %r31
	.word 0x879420e0  ! 284: WRPR_TT_I	wrpr	%r16, 0x00e0, %tt
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, c)
	.word 0xff1ce0cb  ! 299: LDDF_I	ldd	[%r19, 0x00cb], %f31
	.word 0xf84da0fe  ! 303: LDSB_I	ldsb	[%r22 + 0x00fe], %r28
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, c)
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 20)
	.word 0xf01c2046  ! 316: LDD_I	ldd	[%r16 + 0x0046], %r24
	.word 0xb93d5000  ! 318: SRAX_R	srax	%r21, %r0, %r28
	.word 0xbe252169  ! 320: SUB_I	sub 	%r20, 0x0169, %r31
	.word 0x9194a056  ! 323: WRPR_PIL_I	wrpr	%r18, 0x0056, %pil
	setx	data_start_0, %g1, %r23
	.word 0xf01c8000  ! 328: LDD_R	ldd	[%r18 + %r0], %r24
	.word 0xfc0da130  ! 331: LDUB_I	ldub	[%r22 + 0x0130], %r30
	.word 0xfe14a083  ! 333: LDUH_I	lduh	[%r18 + 0x0083], %r31
	mov	0, %r12
	.word 0x8f930000  ! 335: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5480000  ! 347: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfc4c2129  ! 350: LDSB_I	ldsb	[%r16 + 0x0129], %r30
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 12)
	.word 0xf21d20d4  ! 353: LDD_I	ldd	[%r20 + 0x00d4], %r25
	.word 0xf64d0000  ! 355: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xfc54c000  ! 363: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xbb504000  ! 364: RDPR_TNPC	<illegal instruction>
	.word 0xf4044000  ! 365: LDUW_R	lduw	[%r17 + %r0], %r26
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 3c)
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 1e)
	mov	2, %r12
	.word 0x8f930000  ! 370: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8794a027  ! 378: WRPR_TT_I	wrpr	%r18, 0x0027, %tt
	.word 0x9195a07c  ! 382: WRPR_PIL_I	wrpr	%r22, 0x007c, %pil
	mov	2, %r12
	.word 0x8f930000  ! 394: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x89956174  ! 396: WRPR_TICK_I	wrpr	%r21, 0x0174, %tick
	.word 0xfe45614e  ! 397: LDSW_I	ldsw	[%r21 + 0x014e], %r31
	mov	0, %r12
	.word 0xa1930000  ! 404: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbf3c8000  ! 405: SRA_R	sra 	%r18, %r0, %r31
	.word 0x8d942040  ! 406: WRPR_PSTATE_I	wrpr	%r16, 0x0040, %pstate
	.word 0xf014a06e  ! 410: LDUH_I	lduh	[%r18 + 0x006e], %r24
	.word 0x8d94a094  ! 412: WRPR_PSTATE_I	wrpr	%r18, 0x0094, %pstate
	.word 0xfc0d4000  ! 414: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xfe45a146  ! 416: LDSW_I	ldsw	[%r22 + 0x0146], %r31
	setx	0xe804726c0000fe81, %g1, %r10
	.word 0x839a8000  ! 419: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf414e140  ! 420: LDUH_I	lduh	[%r19 + 0x0140], %r26
	.word 0xb8ad0000  ! 421: ANDNcc_R	andncc 	%r20, %r0, %r28
	.word 0xb951c000  ! 422: RDPR_TL	<illegal instruction>
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 5)
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 9)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb60dc000  ! 438: AND_R	and 	%r23, %r0, %r27
	.word 0x8d9420d3  ! 441: WRPR_PSTATE_I	wrpr	%r16, 0x00d3, %pstate
	setx	data_start_1, %g1, %r17
	.word 0xf45cc000  ! 444: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xf64d4000  ! 445: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xfa1c8000  ! 446: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0xf80d4000  ! 451: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xf40c4000  ! 456: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xff1ca06b  ! 458: LDDF_I	ldd	[%r18, 0x006b], %f31
	mov	0, %r12
	.word 0xa1930000  ! 459: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe5da16e  ! 460: LDX_I	ldx	[%r22 + 0x016e], %r31
	.word 0xf05ce0a9  ! 463: LDX_I	ldx	[%r19 + 0x00a9], %r24
	.word 0xff1d4000  ! 465: LDDF_R	ldd	[%r21, %r0], %f31
	.word 0xf2458000  ! 467: LDSW_R	ldsw	[%r22 + %r0], %r25
	.word 0xfe042018  ! 473: LDUW_I	lduw	[%r16 + 0x0018], %r31
	.word 0xba954000  ! 475: ORcc_R	orcc 	%r21, %r0, %r29
	.word 0xfc550000  ! 477: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xfa45c000  ! 478: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xf244e1b4  ! 481: LDSW_I	ldsw	[%r19 + 0x01b4], %r25
	.word 0xfc0dc000  ! 484: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xbab40000  ! 491: ORNcc_R	orncc 	%r16, %r0, %r29
	.word 0xf0158000  ! 499: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0x8195a064  ! 502: WRPR_TPC_I	wrpr	%r22, 0x0064, %tpc
	.word 0xf01ce11e  ! 503: LDD_I	ldd	[%r19 + 0x011e], %r24
	.word 0xf44d60f3  ! 504: LDSB_I	ldsb	[%r21 + 0x00f3], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd3dc000  ! 514: SRA_R	sra 	%r23, %r0, %r30
	.word 0x8995e1ba  ! 515: WRPR_TICK_I	wrpr	%r23, 0x01ba, %tick
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf00ca1ac  ! 520: LDUB_I	ldub	[%r18 + 0x01ac], %r24
	.word 0xf845e079  ! 521: LDSW_I	ldsw	[%r23 + 0x0079], %r28
	.word 0xf0440000  ! 522: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xf245a10d  ! 523: LDSW_I	ldsw	[%r22 + 0x010d], %r25
	.word 0xb08dc000  ! 524: ANDcc_R	andcc 	%r23, %r0, %r24
	.word 0xf4052042  ! 526: LDUW_I	lduw	[%r20 + 0x0042], %r26
	.word 0xf20c4000  ! 533: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0xfc442124  ! 534: LDSW_I	ldsw	[%r16 + 0x0124], %r30
	.word 0xfe54c000  ! 535: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0x899420df  ! 536: WRPR_TICK_I	wrpr	%r16, 0x00df, %tick
	.word 0xf804e0f1  ! 540: LDUW_I	lduw	[%r19 + 0x00f1], %r28
	.word 0xf8048000  ! 542: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xf215a06f  ! 544: LDUH_I	lduh	[%r22 + 0x006f], %r25
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 35)
	.word 0xf04da1ea  ! 551: LDSB_I	ldsb	[%r22 + 0x01ea], %r24
	.word 0xb81560a9  ! 554: OR_I	or 	%r21, 0x00a9, %r28
	.word 0xf6054000  ! 557: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xfe5ca007  ! 559: LDX_I	ldx	[%r18 + 0x0007], %r31
	.word 0xb82ce0ac  ! 562: ANDN_I	andn 	%r19, 0x00ac, %r28
	.word 0xf20d4000  ! 563: LDUB_R	ldub	[%r21 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 8)
	.word 0xb151c000  ! 570: RDPR_TL	<illegal instruction>
	.word 0xf655c000  ! 571: LDSH_R	ldsh	[%r23 + %r0], %r27
	.word 0xf11c0000  ! 572: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xfe55a1a3  ! 573: LDSH_I	ldsh	[%r22 + 0x01a3], %r31
	.word 0xb92c9000  ! 574: SLLX_R	sllx	%r18, %r0, %r28
	.word 0xbc04600c  ! 577: ADD_I	add 	%r17, 0x000c, %r30
	setx	0xa9d635f200002a01, %g1, %r10
	.word 0x839a8000  ! 580: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa0ce048  ! 581: LDUB_I	ldub	[%r19 + 0x0048], %r29
	.word 0xb03d0000  ! 582: XNOR_R	xnor 	%r20, %r0, %r24
	.word 0xf04c8000  ! 583: LDSB_R	ldsb	[%r18 + %r0], %r24
	mov	0, %r12
	.word 0x8f930000  ! 584: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 28)
	.word 0xf0542121  ! 590: LDSH_I	ldsh	[%r16 + 0x0121], %r24
	.word 0xfd1ca196  ! 591: LDDF_I	ldd	[%r18, 0x0196], %f30
	.word 0x819420b7  ! 593: WRPR_TPC_I	wrpr	%r16, 0x00b7, %tpc
	.word 0xf80ca0f8  ! 594: LDUB_I	ldub	[%r18 + 0x00f8], %r28
	.word 0xb4ac0000  ! 595: ANDNcc_R	andncc 	%r16, %r0, %r26
	.word 0xb1500000  ! 596: RDPR_TPC	<illegal instruction>
	.word 0xb69c8000  ! 606: XORcc_R	xorcc 	%r18, %r0, %r27
	.word 0xb4452190  ! 608: ADDC_I	addc 	%r20, 0x0190, %r26
	.word 0xf11d4000  ! 614: LDDF_R	ldd	[%r21, %r0], %f24
	mov	1, %r12
	.word 0x8f930000  ! 615: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf24cc000  ! 626: LDSB_R	ldsb	[%r19 + %r0], %r25
	setx	0x35fcf79300006f96, %g1, %r10
	.word 0x839a8000  ! 627: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd504000  ! 628: RDPR_TNPC	<illegal instruction>
	.word 0x8795e060  ! 629: WRPR_TT_I	wrpr	%r23, 0x0060, %tt
	.word 0xf51c4000  ! 630: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0xfe54211f  ! 635: LDSH_I	ldsh	[%r16 + 0x011f], %r31
	setx	data_start_7, %g1, %r18
	.word 0xfe1c4000  ! 640: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xbf520000  ! 641: RDPR_PIL	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 642: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf4454000  ! 644: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xb0bc0000  ! 645: XNORcc_R	xnorcc 	%r16, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf00d2104  ! 653: LDUB_I	ldub	[%r20 + 0x0104], %r24
	.word 0xf41ce1bb  ! 655: LDD_I	ldd	[%r19 + 0x01bb], %r26
	.word 0xfe5c21bb  ! 657: LDX_I	ldx	[%r16 + 0x01bb], %r31
	.word 0xb3518000  ! 661: RDPR_PSTATE	rdpr	%pstate, %r25
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 4)
	.word 0xbea5a1bb  ! 664: SUBcc_I	subcc 	%r22, 0x01bb, %r31
	.word 0xf85c2076  ! 671: LDX_I	ldx	[%r16 + 0x0076], %r28
	.word 0xf2550000  ! 672: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xf045e164  ! 674: LDSW_I	ldsw	[%r23 + 0x0164], %r24
	.word 0xf45d4000  ! 676: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xb9510000  ! 678: RDPR_TICK	<illegal instruction>
	.word 0xb3480000  ! 679: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfa44e10d  ! 680: LDSW_I	ldsw	[%r19 + 0x010d], %r29
	.word 0xfc554000  ! 682: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xb12d0000  ! 683: SLL_R	sll 	%r20, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x91942020  ! 689: WRPR_PIL_I	wrpr	%r16, 0x0020, %pil
	.word 0x8d95e15b  ! 690: WRPR_PSTATE_I	wrpr	%r23, 0x015b, %pstate
	.word 0xf41c8000  ! 692: LDD_R	ldd	[%r18 + %r0], %r26
	.word 0xf84d606a  ! 694: LDSB_I	ldsb	[%r21 + 0x006a], %r28
	.word 0x8395e0bc  ! 695: WRPR_TNPC_I	wrpr	%r23, 0x00bc, %tnpc
	.word 0xf444a1c8  ! 697: LDSW_I	ldsw	[%r18 + 0x01c8], %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb93d0000  ! 702: SRA_R	sra 	%r20, %r0, %r28
	.word 0xfe0cc000  ! 703: LDUB_R	ldub	[%r19 + %r0], %r31
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 11)
	.word 0x8195a09a  ! 710: WRPR_TPC_I	wrpr	%r22, 0x009a, %tpc
	.word 0xf61c20e1  ! 712: LDD_I	ldd	[%r16 + 0x00e1], %r27
	.word 0xbc854000  ! 713: ADDcc_R	addcc 	%r21, %r0, %r30
	.word 0xf64ca19d  ! 717: LDSB_I	ldsb	[%r18 + 0x019d], %r27
	.word 0xf80c2159  ! 718: LDUB_I	ldub	[%r16 + 0x0159], %r28
	.word 0xf91dc000  ! 720: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xfe546125  ! 722: LDSH_I	ldsh	[%r17 + 0x0125], %r31
	.word 0x8395e05a  ! 723: WRPR_TNPC_I	wrpr	%r23, 0x005a, %tnpc
	.word 0xbcb52140  ! 724: ORNcc_I	orncc 	%r20, 0x0140, %r30
	.word 0xfa05a062  ! 726: LDUW_I	lduw	[%r22 + 0x0062], %r29
	.word 0xbb480000  ! 727: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb4b50000  ! 729: SUBCcc_R	orncc 	%r20, %r0, %r26
	.word 0xf855a1b6  ! 730: LDSH_I	ldsh	[%r22 + 0x01b6], %r28
	.word 0x8d94e16f  ! 731: WRPR_PSTATE_I	wrpr	%r19, 0x016f, %pstate
	.word 0xf4050000  ! 732: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xf404214f  ! 733: LDUW_I	lduw	[%r16 + 0x014f], %r26
	.word 0xb3504000  ! 735: RDPR_TNPC	<illegal instruction>
	.word 0xfa040000  ! 737: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xb5480000  ! 739: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf21c60fc  ! 740: LDD_I	ldd	[%r17 + 0x00fc], %r25
	.word 0xbd540000  ! 742: RDPR_GL	<illegal instruction>
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 27)
	.word 0xf4158000  ! 745: LDUH_R	lduh	[%r22 + %r0], %r26
	.word 0xf6040000  ! 747: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xfa14a11a  ! 748: LDUH_I	lduh	[%r18 + 0x011a], %r29
	.word 0xb9643801  ! 752: MOVcc_I	<illegal instruction>
	.word 0xfd1cc000  ! 754: LDDF_R	ldd	[%r19, %r0], %f30
	.word 0xf0548000  ! 758: LDSH_R	ldsh	[%r18 + %r0], %r24
	mov	0, %r12
	.word 0x8f930000  ! 760: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 30)
	.word 0xfe0d8000  ! 763: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xfe540000  ! 764: LDSH_R	ldsh	[%r16 + %r0], %r31
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, e)
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, b)
	.word 0x87946180  ! 768: WRPR_TT_I	wrpr	%r17, 0x0180, %tt
	setx	data_start_7, %g1, %r18
	.word 0x8994218b  ! 770: WRPR_TICK_I	wrpr	%r16, 0x018b, %tick
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 1d)
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 1a)
	.word 0xb1500000  ! 774: RDPR_TPC	<illegal instruction>
	.word 0xb350c000  ! 775: RDPR_TT	<illegal instruction>
	.word 0xfa440000  ! 780: LDSW_R	ldsw	[%r16 + %r0], %r29
	setx	data_start_7, %g1, %r17
	.word 0xfe45e177  ! 786: LDSW_I	ldsw	[%r23 + 0x0177], %r31
	.word 0xfc1561ad  ! 793: LDUH_I	lduh	[%r21 + 0x01ad], %r30
	.word 0xb1504000  ! 795: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb535b001  ! 798: SRLX_I	srlx	%r22, 0x0001, %r26
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf41ca1de  ! 800: LDD_I	ldd	[%r18 + 0x01de], %r26
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 28)
	.word 0xfe5da0e1  ! 806: LDX_I	ldx	[%r22 + 0x00e1], %r31
	.word 0xf01ca0fd  ! 809: LDD_I	ldd	[%r18 + 0x00fd], %r24
	.word 0xf805a01d  ! 810: LDUW_I	lduw	[%r22 + 0x001d], %r28
	.word 0xf4044000  ! 812: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0xf055e0d0  ! 822: LDSH_I	ldsh	[%r23 + 0x00d0], %r24
	.word 0xb7504000  ! 823: RDPR_TNPC	<illegal instruction>
	.word 0xff1cc000  ! 828: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0x81946065  ! 832: WRPR_TPC_I	wrpr	%r17, 0x0065, %tpc
	setx	data_start_3, %g1, %r22
	.word 0xb4352041  ! 836: SUBC_I	orn 	%r20, 0x0041, %r26
	.word 0xf45d8000  ! 837: LDX_R	ldx	[%r22 + %r0], %r26
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfc1cc000  ! 848: LDD_R	ldd	[%r19 + %r0], %r30
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf31dc000  ! 850: LDDF_R	ldd	[%r23, %r0], %f25
	.word 0xfe5da046  ! 854: LDX_I	ldx	[%r22 + 0x0046], %r31
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 28)
	.word 0xb9510000  ! 862: RDPR_TICK	<illegal instruction>
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 12)
	.word 0xfd1d61cb  ! 866: LDDF_I	ldd	[%r21, 0x01cb], %f30
	setx	data_start_7, %g1, %r17
	.word 0xf454e1e1  ! 868: LDSH_I	ldsh	[%r19 + 0x01e1], %r26
	.word 0xb28421a6  ! 869: ADDcc_I	addcc 	%r16, 0x01a6, %r25
	.word 0xfd1d6066  ! 870: LDDF_I	ldd	[%r21, 0x0066], %f30
	.word 0xbf50c000  ! 875: RDPR_TT	<illegal instruction>
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 0)
	.word 0xf40ce047  ! 882: LDUB_I	ldub	[%r19 + 0x0047], %r26
	.word 0xbd510000  ! 884: RDPR_TICK	<illegal instruction>
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 33)
	.word 0xbcc54000  ! 892: ADDCcc_R	addccc 	%r21, %r0, %r30
	.word 0xf6050000  ! 893: LDUW_R	lduw	[%r20 + %r0], %r27
	.word 0xfa4cc000  ! 894: LDSB_R	ldsb	[%r19 + %r0], %r29
	setx	0x73272c5000002b15, %g1, %r10
	.word 0x819a8000  ! 899: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_7, %g1, %r18
	.word 0xb7520000  ! 904: RDPR_PIL	<illegal instruction>
	.word 0xf4148000  ! 910: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xf6058000  ! 915: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xf65c8000  ! 916: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0xfe1c8000  ! 918: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xb20ca0d1  ! 919: AND_I	and 	%r18, 0x00d1, %r25
	.word 0xb2a50000  ! 921: SUBcc_R	subcc 	%r20, %r0, %r25
	.word 0xfc04a0cd  ! 922: LDUW_I	lduw	[%r18 + 0x00cd], %r30
	.word 0xf91c0000  ! 923: LDDF_R	ldd	[%r16, %r0], %f28
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 37)
	.word 0xf854e048  ! 928: LDSH_I	ldsh	[%r19 + 0x0048], %r28
	.word 0xfc4c2150  ! 929: LDSB_I	ldsb	[%r16 + 0x0150], %r30
	setx	data_start_0, %g1, %r21
	.word 0xf71dc000  ! 933: LDDF_R	ldd	[%r23, %r0], %f27
	.word 0xb00521e2  ! 935: ADD_I	add 	%r20, 0x01e2, %r24
	.word 0xf80460e0  ! 936: LDUW_I	lduw	[%r17 + 0x00e0], %r28
	.word 0xf05d2044  ! 938: LDX_I	ldx	[%r20 + 0x0044], %r24
	.word 0xff1c6010  ! 942: LDDF_I	ldd	[%r17, 0x0010], %f31
	.word 0xfe156125  ! 943: LDUH_I	lduh	[%r21 + 0x0125], %r31
	.word 0xfa0da1c8  ! 944: LDUB_I	ldub	[%r22 + 0x01c8], %r29
	.word 0xfe042129  ! 945: LDUW_I	lduw	[%r16 + 0x0129], %r31
	.word 0x85946013  ! 946: WRPR_TSTATE_I	wrpr	%r17, 0x0013, %tstate
	.word 0xfc0d61bc  ! 954: LDUB_I	ldub	[%r21 + 0x01bc], %r30
	.word 0xf414602b  ! 955: LDUH_I	lduh	[%r17 + 0x002b], %r26
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 13)
	.word 0xf0450000  ! 963: LDSW_R	ldsw	[%r20 + %r0], %r24
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 23)
	mov	0, %r12
	.word 0xa1930000  ! 967: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 33)
	.word 0xf60c6178  ! 970: LDUB_I	ldub	[%r17 + 0x0178], %r27
	.word 0xf0050000  ! 972: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xfc44e185  ! 973: LDSW_I	ldsw	[%r19 + 0x0185], %r30
	.word 0xb234c000  ! 974: SUBC_R	orn 	%r19, %r0, %r25
	.word 0xf91d602a  ! 975: LDDF_I	ldd	[%r21, 0x002a], %f28
	.word 0xb61d2155  ! 977: XOR_I	xor 	%r20, 0x0155, %r27
	.word 0xf2444000  ! 981: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0xfa0d8000  ! 985: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xb49ce14e  ! 986: XORcc_I	xorcc 	%r19, 0x014e, %r26
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, d)
	.word 0xb4ad4000  ! 993: ANDNcc_R	andncc 	%r21, %r0, %r26
	.word 0xfc448000  ! 996: LDSW_R	ldsw	[%r18 + %r0], %r30
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb5a90820  ! 6: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbdaac820  ! 8: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbba00560  ! 9: FSQRTq	fsqrt	
	.word 0xb4b58000  ! 11: ORNcc_R	orncc 	%r22, %r0, %r26
	.word 0xb3a00020  ! 12: FMOVs	fmovs	%f0, %f25
	.word 0x879420f4  ! 14: WRPR_TT_I	wrpr	%r16, 0x00f4, %tt
	.word 0xbf643801  ! 15: MOVcc_I	<illegal instruction>
	.word 0xbdab4820  ! 18: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbda5c8c0  ! 19: FSUBd	fsubd	%f54, %f0, %f30
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 18)
	.word 0xb5a409e0  ! 26: FDIVq	dis not found

	.word 0xbd2c8000  ! 27: SLL_R	sll 	%r18, %r0, %r30
	.word 0xb405212a  ! 28: ADD_I	add 	%r20, 0x012a, %r26
	.word 0xbc3ca0e8  ! 29: XNOR_I	xnor 	%r18, 0x00e8, %r30
	.word 0xbc05a0fd  ! 33: ADD_I	add 	%r22, 0x00fd, %r30
	.word 0xb9a4c860  ! 34: FADDq	dis not found

	.word 0xba9d4000  ! 35: XORcc_R	xorcc 	%r21, %r0, %r29
	.word 0xbfa4c8e0  ! 36: FSUBq	dis not found

	setx	0x9f8a3c13000009d4, %g1, %r10
	.word 0x839a8000  ! 42: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a81420  ! 43: FMOVRNZ	dis not found

	.word 0xbba50820  ! 44: FADDs	fadds	%f20, %f0, %f29
	.word 0xb234c000  ! 45: ORN_R	orn 	%r19, %r0, %r25
	.word 0xb1a54920  ! 48: FMULs	fmuls	%f21, %f0, %f24
	.word 0xbb480000  ! 50: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb4c44000  ! 51: ADDCcc_R	addccc 	%r17, %r0, %r26
	.word 0x8d95e13e  ! 52: WRPR_PSTATE_I	wrpr	%r23, 0x013e, %pstate
	.word 0xb3a00520  ! 53: FSQRTs	fsqrt	
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb32cc000  ! 55: SLL_R	sll 	%r19, %r0, %r25
	.word 0x8d9561a8  ! 56: WRPR_PSTATE_I	wrpr	%r21, 0x01a8, %pstate
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 34)
	.word 0xb5a81820  ! 59: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb2c4c000  ! 61: ADDCcc_R	addccc 	%r19, %r0, %r25
	.word 0xb1a00520  ! 64: FSQRTs	fsqrt	
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 28)
	.word 0xb5a548e0  ! 70: FSUBq	dis not found

	.word 0xbb480000  ! 72: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 2)
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb1a408a0  ! 79: FSUBs	fsubs	%f16, %f0, %f24
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 9)
	.word 0xb5a50920  ! 83: FMULs	fmuls	%f20, %f0, %f26
	.word 0xb350c000  ! 85: RDPR_TT	<illegal instruction>
	.word 0xbda80820  ! 90: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb7a9c820  ! 91: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb0b5a120  ! 92: ORNcc_I	orncc 	%r22, 0x0120, %r24
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 14)
	.word 0xb9aa0820  ! 95: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbfa48960  ! 97: FMULq	dis not found

	.word 0xb1a48920  ! 102: FMULs	fmuls	%f18, %f0, %f24
	.word 0x919461f9  ! 105: WRPR_PIL_I	wrpr	%r17, 0x01f9, %pil
	.word 0xbba9c820  ! 107: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbba5c8c0  ! 108: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xbfaa8820  ! 114: FMOVG	fmovs	%fcc1, %f0, %f31
	setx	data_start_4, %g1, %r16
	.word 0xb9a00540  ! 117: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0xd198a130000098dc, %g1, %r10
	.word 0x819a8000  ! 121: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1a9c820  ! 122: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbda88820  ! 127: FMOVLE	fmovs	%fcc1, %f0, %f30
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x44bc17260000cfd9, %g1, %r10
	.word 0x839a8000  ! 147: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a4c9c0  ! 148: FDIVd	fdivd	%f50, %f0, %f26
	.word 0xb3a54920  ! 150: FMULs	fmuls	%f21, %f0, %f25
	.word 0xb3504000  ! 155: RDPR_TNPC	<illegal instruction>
	.word 0xbba54940  ! 159: FMULd	fmuld	%f52, %f0, %f60
	setx	0x9f2e36f700005a49, %g1, %r10
	.word 0x819a8000  ! 162: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a54820  ! 163: FADDs	fadds	%f21, %f0, %f28
	.word 0x899520b2  ! 167: WRPR_TICK_I	wrpr	%r20, 0x00b2, %tick
	.word 0xb9a00020  ! 168: FMOVs	fmovs	%f0, %f28
	.word 0x8394e014  ! 170: WRPR_TNPC_I	wrpr	%r19, 0x0014, %tnpc
	.word 0xbfa9c820  ! 174: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00040  ! 175: FMOVd	fmovd	%f0, %f28
	setx	data_start_4, %g1, %r21
	.word 0xb9a40940  ! 177: FMULd	fmuld	%f16, %f0, %f28
	.word 0xbfa4c840  ! 178: FADDd	faddd	%f50, %f0, %f62
	.word 0xb9a40820  ! 179: FADDs	fadds	%f16, %f0, %f28
	.word 0xb02d4000  ! 180: ANDN_R	andn 	%r21, %r0, %r24
	setx	data_start_3, %g1, %r19
	.word 0xbda4c840  ! 184: FADDd	faddd	%f50, %f0, %f30
	.word 0x8d9520f6  ! 187: WRPR_PSTATE_I	wrpr	%r20, 0x00f6, %pstate
	.word 0xbfa00040  ! 189: FMOVd	fmovd	%f0, %f62
	.word 0xbb520000  ! 191: RDPR_PIL	<illegal instruction>
	.word 0xbda409e0  ! 192: FDIVq	dis not found

	.word 0xbfa80820  ! 193: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbb540000  ! 196: RDPR_GL	<illegal instruction>
	.word 0xbba508e0  ! 197: FSUBq	dis not found

	.word 0xb5a88820  ! 202: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb1540000  ! 207: RDPR_GL	<illegal instruction>
	.word 0x9195e1be  ! 211: WRPR_PIL_I	wrpr	%r23, 0x01be, %pil
	.word 0xb1a81c20  ! 214: FMOVRGEZ	dis not found

	.word 0xb3a4c840  ! 215: FADDd	faddd	%f50, %f0, %f56
	setx	0x95e0746b00009e45, %g1, %r10
	.word 0x839a8000  ! 216: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbdab8820  ! 217: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbda00540  ! 221: FSQRTd	fsqrt	
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb1a94820  ! 227: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb7aa4820  ! 228: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a00520  ! 234: FSQRTs	fsqrt	
	.word 0xb434613a  ! 236: SUBC_I	orn 	%r17, 0x013a, %r26
	.word 0xb9a80820  ! 238: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbfa00520  ! 239: FSQRTs	fsqrt	
	.word 0xbda489c0  ! 240: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xb3a4c8e0  ! 241: FSUBq	dis not found

hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, b)
	.word 0xb5540000  ! 247: RDPR_GL	<illegal instruction>
	.word 0xb7ab4820  ! 248: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a58840  ! 249: FADDd	faddd	%f22, %f0, %f28
	.word 0xb3a549e0  ! 251: FDIVq	dis not found

	.word 0xb9a5c820  ! 253: FADDs	fadds	%f23, %f0, %f28
	.word 0x839420ce  ! 255: WRPR_TNPC_I	wrpr	%r16, 0x00ce, %tnpc
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 20)
	.word 0xb3520000  ! 265: RDPR_PIL	<illegal instruction>
	setx	data_start_3, %g1, %r21
	.word 0xb5aa4820  ! 269: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbfab0820  ! 272: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb1a84820  ! 273: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0x8d9460ae  ! 278: WRPR_PSTATE_I	wrpr	%r17, 0x00ae, %pstate
	.word 0xb52ce001  ! 281: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xb435a125  ! 282: SUBC_I	orn 	%r22, 0x0125, %r26
	.word 0xb3a00560  ! 283: FSQRTq	fsqrt	
	.word 0x87942072  ! 284: WRPR_TT_I	wrpr	%r16, 0x0072, %tt
	.word 0xb5a58820  ! 285: FADDs	fadds	%f22, %f0, %f26
	.word 0xb5a5c940  ! 294: FMULd	fmuld	%f54, %f0, %f26
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbbaa0820  ! 298: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbdab4820  ! 304: FMOVCC	fmovs	%fcc1, %f0, %f30
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 27)
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 35)
	.word 0xb5a00560  ! 308: FSQRTq	fsqrt	
	.word 0xb9a44960  ! 312: FMULq	dis not found

	.word 0xb1a00020  ! 313: FMOVs	fmovs	%f0, %f24
	.word 0xb3a588a0  ! 314: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xb7a80820  ! 315: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb9a94820  ! 317: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbf3d5000  ! 318: SRAX_R	srax	%r21, %r0, %r31
	.word 0xb3a00520  ! 319: FSQRTs	fsqrt	
	.word 0xb4246069  ! 320: SUB_I	sub 	%r17, 0x0069, %r26
	.word 0xb3a54840  ! 321: FADDd	faddd	%f52, %f0, %f56
	.word 0x91942042  ! 323: WRPR_PIL_I	wrpr	%r16, 0x0042, %pil
	setx	data_start_2, %g1, %r17
	.word 0xbbabc820  ! 329: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb1a9c820  ! 334: FMOVVS	fmovs	%fcc1, %f0, %f24
	mov	0, %r12
	.word 0x8f930000  ! 335: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 27)
	.word 0xb3a00560  ! 341: FSQRTq	fsqrt	
	.word 0xb5a509e0  ! 343: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a00560  ! 345: FSQRTq	fsqrt	
	.word 0xb5480000  ! 347: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb9a489c0  ! 349: FDIVd	fdivd	%f18, %f0, %f28
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 20)
	.word 0xb3a00520  ! 352: FSQRTs	fsqrt	
	.word 0xb7a54920  ! 356: FMULs	fmuls	%f21, %f0, %f27
	.word 0xbf504000  ! 364: RDPR_TNPC	<illegal instruction>
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 21)
	.word 0xb5a5c8c0  ! 368: FSUBd	fsubd	%f54, %f0, %f26
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 3d)
	mov	2, %r12
	.word 0x8f930000  ! 370: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbab8820  ! 372: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbba00560  ! 374: FSQRTq	fsqrt	
	.word 0xbfa8c820  ! 375: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0x879520f9  ! 378: WRPR_TT_I	wrpr	%r20, 0x00f9, %tt
	.word 0xb5abc820  ! 380: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0x9195e0a3  ! 382: WRPR_PIL_I	wrpr	%r23, 0x00a3, %pil
	.word 0xbfa00520  ! 383: FSQRTs	fsqrt	
	.word 0xbbaa4820  ! 384: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb3a409e0  ! 387: FDIVq	dis not found

	.word 0xb1a50960  ! 390: FMULq	dis not found

	.word 0xb1abc820  ! 393: FMOVVC	fmovs	%fcc1, %f0, %f24
	mov	2, %r12
	.word 0x8f930000  ! 394: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda81420  ! 395: FMOVRNZ	dis not found

	.word 0x899460bf  ! 396: WRPR_TICK_I	wrpr	%r17, 0x00bf, %tick
	.word 0xb1a81420  ! 402: FMOVRNZ	dis not found

	mov	0, %r12
	.word 0xa1930000  ! 404: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb73c0000  ! 405: SRA_R	sra 	%r16, %r0, %r27
	.word 0x8d94603b  ! 406: WRPR_PSTATE_I	wrpr	%r17, 0x003b, %pstate
	.word 0x8d94613a  ! 412: WRPR_PSTATE_I	wrpr	%r17, 0x013a, %pstate
	.word 0xb3a9c820  ! 415: FMOVVS	fmovs	%fcc1, %f0, %f25
	setx	0x43d0e89d0000bd57, %g1, %r10
	.word 0x839a8000  ! 419: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbeadc000  ! 421: ANDNcc_R	andncc 	%r23, %r0, %r31
	.word 0xbf51c000  ! 422: RDPR_TL	<illegal instruction>
	.word 0xb1aac820  ! 423: FMOVGE	fmovs	%fcc1, %f0, %f24
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 36)
	.word 0xb5a488a0  ! 428: FSUBs	fsubs	%f18, %f0, %f26
	.word 0xbba80c20  ! 429: FMOVRLZ	dis not found

hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 1e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a449c0  ! 436: FDIVd	fdivd	%f48, %f0, %f28
	.word 0xb20c4000  ! 438: AND_R	and 	%r17, %r0, %r25
	.word 0xbda81820  ! 440: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0x8d94a12c  ! 441: WRPR_PSTATE_I	wrpr	%r18, 0x012c, %pstate
	setx	data_start_6, %g1, %r22
	.word 0xbfa5c940  ! 443: FMULd	fmuld	%f54, %f0, %f62
	.word 0xbfa90820  ! 449: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbfa4c8e0  ! 457: FSUBq	dis not found

	mov	1, %r12
	.word 0xa1930000  ! 459: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a40960  ! 462: FMULq	dis not found

	.word 0xbbab4820  ! 472: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb7a509a0  ! 474: FDIVs	fdivs	%f20, %f0, %f27
	.word 0xb4944000  ! 475: ORcc_R	orcc 	%r17, %r0, %r26
	.word 0xbdab8820  ! 476: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a80c20  ! 486: FMOVRLZ	dis not found

	.word 0xbfa88820  ! 488: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a50820  ! 490: FADDs	fadds	%f20, %f0, %f28
	.word 0xb0b5c000  ! 491: ORNcc_R	orncc 	%r23, %r0, %r24
	.word 0xbda80820  ! 494: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb7a80c20  ! 495: FMOVRLZ	dis not found

	.word 0xb3a80c20  ! 496: FMOVRLZ	dis not found

	.word 0xb5a589c0  ! 498: FDIVd	fdivd	%f22, %f0, %f26
	.word 0xb3a58840  ! 500: FADDd	faddd	%f22, %f0, %f56
	.word 0x8195a085  ! 502: WRPR_TPC_I	wrpr	%r22, 0x0085, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a9c820  ! 510: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbf3c4000  ! 514: SRA_R	sra 	%r17, %r0, %r31
	.word 0x89952138  ! 515: WRPR_TICK_I	wrpr	%r20, 0x0138, %tick
	.word 0xb9a80c20  ! 517: FMOVRLZ	dis not found

hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 28)
	.word 0xbe8c4000  ! 524: ANDcc_R	andcc 	%r17, %r0, %r31
	.word 0xb9a81820  ! 529: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0x8995a0f5  ! 536: WRPR_TICK_I	wrpr	%r22, 0x00f5, %tick
	.word 0xb3a40960  ! 543: FMULq	dis not found

	.word 0xb3abc820  ! 546: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb9a90820  ! 547: FMOVLEU	fmovs	%fcc1, %f0, %f28
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 15)
	.word 0xbba00520  ! 550: FSQRTs	fsqrt	
	.word 0xb7a48940  ! 552: FMULd	fmuld	%f18, %f0, %f58
	.word 0xb414a137  ! 554: OR_I	or 	%r18, 0x0137, %r26
	.word 0xb9a588c0  ! 555: FSUBd	fsubd	%f22, %f0, %f28
	.word 0xb7a98820  ! 558: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb3a00020  ! 561: FMOVs	fmovs	%f0, %f25
	.word 0xb22c2098  ! 562: ANDN_I	andn 	%r16, 0x0098, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 38)
	.word 0xb151c000  ! 570: RDPR_TL	<illegal instruction>
	.word 0xbf2dd000  ! 574: SLLX_R	sllx	%r23, %r0, %r31
	.word 0xbba00540  ! 575: FSQRTd	fsqrt	
	.word 0xba0561df  ! 577: ADD_I	add 	%r21, 0x01df, %r29
	.word 0xbda00040  ! 578: FMOVd	fmovd	%f0, %f30
	setx	0x8c4842f400004c8b, %g1, %r10
	.word 0x839a8000  ! 580: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb23c0000  ! 582: XNOR_R	xnor 	%r16, %r0, %r25
	mov	2, %r12
	.word 0x8f930000  ! 584: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 13)
	.word 0x81942052  ! 593: WRPR_TPC_I	wrpr	%r16, 0x0052, %tpc
	.word 0xb4ad8000  ! 595: ANDNcc_R	andncc 	%r22, %r0, %r26
	.word 0xb7500000  ! 596: RDPR_TPC	<illegal instruction>
	.word 0xbbab4820  ! 597: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbba589e0  ! 604: FDIVq	dis not found

	.word 0xb89d8000  ! 606: XORcc_R	xorcc 	%r22, %r0, %r28
	.word 0xb645e0b2  ! 608: ADDC_I	addc 	%r23, 0x00b2, %r27
	.word 0xb3aa4820  ! 609: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa4c920  ! 610: FMULs	fmuls	%f19, %f0, %f31
	.word 0xb9a8c820  ! 613: FMOVL	fmovs	%fcc1, %f0, %f28
	mov	2, %r12
	.word 0x8f930000  ! 615: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7a40940  ! 616: FMULd	fmuld	%f16, %f0, %f58
	.word 0xb5a00520  ! 617: FSQRTs	fsqrt	
	.word 0xbba509a0  ! 621: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xb5a9c820  ! 622: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbdaa0820  ! 623: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00040  ! 624: FMOVd	fmovd	%f0, %f26
	setx	0x4aded6990000bede, %g1, %r10
	.word 0x839a8000  ! 627: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7504000  ! 628: RDPR_TNPC	<illegal instruction>
	.word 0x8795e04d  ! 629: WRPR_TT_I	wrpr	%r23, 0x004d, %tt
	.word 0xb3a80420  ! 631: FMOVRZ	dis not found

	.word 0xbda488c0  ! 632: FSUBd	fsubd	%f18, %f0, %f30
	setx	data_start_2, %g1, %r17
	.word 0xb5520000  ! 641: RDPR_PIL	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 642: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbebd8000  ! 645: XNORcc_R	xnorcc 	%r22, %r0, %r31
	.word 0xb1a90820  ! 649: FMOVLEU	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7518000  ! 661: RDPR_PSTATE	<illegal instruction>
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 29)
	.word 0xb2a5e062  ! 664: SUBcc_I	subcc 	%r23, 0x0062, %r25
	.word 0xbda90820  ! 669: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb1a548a0  ! 675: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xb5510000  ! 678: RDPR_TICK	<illegal instruction>
	.word 0xb5480000  ! 679: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb12c4000  ! 683: SLL_R	sll 	%r17, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9194e1d9  ! 689: WRPR_PIL_I	wrpr	%r19, 0x01d9, %pil
	.word 0x8d95a095  ! 690: WRPR_PSTATE_I	wrpr	%r22, 0x0095, %pstate
	.word 0x83942055  ! 695: WRPR_TNPC_I	wrpr	%r16, 0x0055, %tnpc
	.word 0xb1a81420  ! 696: FMOVRNZ	dis not found

	.word 0xb9a81820  ! 699: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbba509c0  ! 701: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xb93d8000  ! 702: SRA_R	sra 	%r22, %r0, %r28
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, e)
	.word 0xb1a00540  ! 708: FSQRTd	fsqrt	
	.word 0xbfa48820  ! 709: FADDs	fadds	%f18, %f0, %f31
	.word 0x8194e1b0  ! 710: WRPR_TPC_I	wrpr	%r19, 0x01b0, %tpc
	.word 0xbe854000  ! 713: ADDcc_R	addcc 	%r21, %r0, %r31
	.word 0xb5a81c20  ! 714: FMOVRGEZ	dis not found

	.word 0xb5a00040  ! 715: FMOVd	fmovd	%f0, %f26
	.word 0xbba00020  ! 721: FMOVs	fmovs	%f0, %f29
	.word 0x8395e178  ! 723: WRPR_TNPC_I	wrpr	%r23, 0x0178, %tnpc
	.word 0xb2b4e131  ! 724: ORNcc_I	orncc 	%r19, 0x0131, %r25
	.word 0xb3480000  ! 727: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbeb44000  ! 729: SUBCcc_R	orncc 	%r17, %r0, %r31
	.word 0x8d952027  ! 731: WRPR_PSTATE_I	wrpr	%r20, 0x0027, %pstate
	.word 0xbb504000  ! 735: RDPR_TNPC	<illegal instruction>
	.word 0xb3a81420  ! 736: FMOVRNZ	dis not found

	.word 0xbf480000  ! 739: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb1a4c9e0  ! 741: FDIVq	dis not found

	.word 0xb7540000  ! 742: RDPR_GL	<illegal instruction>
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 34)
	.word 0xb1aa0820  ! 749: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbf643801  ! 752: MOVcc_I	<illegal instruction>
	.word 0xb3a5c920  ! 753: FMULs	fmuls	%f23, %f0, %f25
	.word 0xbfa00560  ! 759: FSQRTq	fsqrt	
	mov	0, %r12
	.word 0x8f930000  ! 760: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 38)
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 29)
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 1c)
	.word 0x8794618a  ! 768: WRPR_TT_I	wrpr	%r17, 0x018a, %tt
	setx	data_start_0, %g1, %r21
	.word 0x8994a14b  ! 770: WRPR_TICK_I	wrpr	%r18, 0x014b, %tick
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 4)
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 4)
	.word 0xb5500000  ! 774: RDPR_TPC	<illegal instruction>
	.word 0xb950c000  ! 775: RDPR_TT	<illegal instruction>
	.word 0xb3a00520  ! 776: FSQRTs	fsqrt	
	.word 0xb7a00560  ! 778: FSQRTq	fsqrt	
	.word 0xbfa54820  ! 779: FADDs	fadds	%f21, %f0, %f31
	setx	data_start_6, %g1, %r20
	.word 0xb7a48860  ! 794: FADDq	dis not found

	.word 0xb3504000  ! 795: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5343001  ! 798: SRLX_I	srlx	%r16, 0x0001, %r26
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 39)
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 0)
	.word 0xb3aa0820  ! 807: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb7a588a0  ! 808: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb5a94820  ! 813: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xbfa81420  ! 814: FMOVRNZ	dis not found

	.word 0xb7a4c8c0  ! 816: FSUBd	fsubd	%f50, %f0, %f58
	.word 0xbf504000  ! 823: RDPR_TNPC	<illegal instruction>
	.word 0xb5aa0820  ! 829: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb7a81c20  ! 830: FMOVRGEZ	dis not found

	.word 0xb3a48860  ! 831: FADDq	dis not found

	.word 0x8195e014  ! 832: WRPR_TPC_I	wrpr	%r23, 0x0014, %tpc
	setx	data_start_6, %g1, %r23
	.word 0xba35212b  ! 836: SUBC_I	orn 	%r20, 0x012b, %r29
	.word 0xb5a88820  ! 839: FMOVLE	fmovs	%fcc1, %f0, %f26
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 0)
	.word 0xb3a408c0  ! 842: FSUBd	fsubd	%f16, %f0, %f56
	.word 0xb5a48960  ! 847: FMULq	dis not found

hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 16)
	.word 0xb3a88820  ! 857: FMOVLE	fmovs	%fcc1, %f0, %f25
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 18)
	.word 0xb7510000  ! 862: RDPR_TICK	<illegal instruction>
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 31)
	setx	data_start_6, %g1, %r17
	.word 0xbc84a0ef  ! 869: ADDcc_I	addcc 	%r18, 0x00ef, %r30
	.word 0xb9a00560  ! 871: FSQRTq	fsqrt	
	.word 0xbda448a0  ! 872: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xb950c000  ! 875: RDPR_TT	<illegal instruction>
	.word 0xb1a58860  ! 876: FADDq	dis not found

	.word 0xbba589a0  ! 878: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xbbaa8820  ! 880: FMOVG	fmovs	%fcc1, %f0, %f29
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 8)
	.word 0xb7a54960  ! 883: FMULq	dis not found

	.word 0xb1510000  ! 884: RDPR_TICK	<illegal instruction>
	.word 0xb1a80820  ! 887: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb7a408c0  ! 888: FSUBd	fsubd	%f16, %f0, %f58
	.word 0xb3a80820  ! 889: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb7a489a0  ! 890: FDIVs	fdivs	%f18, %f0, %f27
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb0c58000  ! 892: ADDCcc_R	addccc 	%r22, %r0, %r24
	.word 0xbfa80c20  ! 896: FMOVRLZ	dis not found

	.word 0xb7a00540  ! 897: FSQRTd	fsqrt	
	.word 0xb3a00520  ! 898: FSQRTs	fsqrt	
	setx	0xf47c885b00006b19, %g1, %r10
	.word 0x819a8000  ! 899: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_6, %g1, %r18
	.word 0xb3a00040  ! 901: FMOVd	fmovd	%f0, %f56
	.word 0xbfa00540  ! 902: FSQRTd	fsqrt	
	.word 0xbb520000  ! 904: RDPR_PIL	<illegal instruction>
	.word 0xbda548e0  ! 911: FSUBq	dis not found

	.word 0xb5a00540  ! 912: FSQRTd	fsqrt	
	.word 0xb1a4c8a0  ! 913: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xbfa488a0  ! 917: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xb40d21a4  ! 919: AND_I	and 	%r20, 0x01a4, %r26
	.word 0xb6a44000  ! 921: SUBcc_R	subcc 	%r17, %r0, %r27
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 36)
	.word 0xbba8c820  ! 927: FMOVL	fmovs	%fcc1, %f0, %f29
	setx	data_start_7, %g1, %r16
	.word 0xbe04a1e0  ! 935: ADD_I	add 	%r18, 0x01e0, %r31
	.word 0xbba80c20  ! 940: FMOVRLZ	dis not found

	.word 0x8595e0ac  ! 946: WRPR_TSTATE_I	wrpr	%r23, 0x00ac, %tstate
	.word 0xb5ab8820  ! 948: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00540  ! 952: FSQRTd	fsqrt	
	.word 0xbbaa0820  ! 953: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbba44840  ! 956: FADDd	faddd	%f48, %f0, %f60
	.word 0xb7a5c8e0  ! 957: FSUBq	dis not found

hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, d)
	.word 0xbfa5c960  ! 959: FMULq	dis not found

	.word 0xb1a98820  ! 960: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb1ab8820  ! 962: FMOVPOS	fmovs	%fcc1, %f0, %f24
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 12)
	.word 0xb5a88820  ! 966: FMOVLE	fmovs	%fcc1, %f0, %f26
	mov	0, %r12
	.word 0xa1930000  ! 967: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbba81820  ! 971: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb2348000  ! 974: SUBC_R	orn 	%r18, %r0, %r25
	.word 0xb41d61ae  ! 977: XOR_I	xor 	%r21, 0x01ae, %r26
	.word 0xb1a88820  ! 978: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a88820  ! 980: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbe9de055  ! 986: XORcc_I	xorcc 	%r23, 0x0055, %r31
	.word 0xb5ab4820  ! 988: FMOVCC	fmovs	%fcc1, %f0, %f26
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 29)
	.word 0xb1a589e0  ! 990: FDIVq	dis not found

	.word 0xbeac4000  ! 993: ANDNcc_R	andncc 	%r17, %r0, %r31
	.word 0xb3a5c9e0  ! 997: FDIVq	dis not found


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

	.xword	0xba4d55a0beb97125
	.xword	0x7ae6db44dbe4ef65
	.xword	0xf53a253dea37a145
	.xword	0xed5e152d2a29bb6c
	.xword	0xbf80de7e160c2fb9
	.xword	0x354e13b6a6066a82
	.xword	0x4e31067f2d8ebcc1
	.xword	0xbb661f03a6553db5
	.xword	0x9dc1de59e3969c18
	.xword	0xbf0edbf126fb4fa2
	.xword	0x79a907227c35c9a5
	.xword	0xf937971c1cfb66de
	.xword	0xb5035596db0476a8
	.xword	0x2bf70d119a281e28
	.xword	0x891ab917fb2d94d2
	.xword	0x4a69746772200220
	.xword	0x14cfd834d277964c
	.xword	0x6c644c800025d4d4
	.xword	0x9398b47aa042ce3b
	.xword	0xe2e39a8027106027
	.xword	0xaf085c78af7cf14b
	.xword	0x1e740fbf7d8abd27
	.xword	0xcbd08b91b7a52ac1
	.xword	0xd71a0ae150454cca
	.xword	0xa888617dfd976540
	.xword	0xb52329fc5193a467
	.xword	0x3b8d507bb08791a2
	.xword	0x3e8a74bccc1cccb8
	.xword	0x33ee6ae24df25449
	.xword	0xa07908363e43a908
	.xword	0x24a4788644a33eb3
	.xword	0x362d361762e4d746
	.xword	0x26a00337ec94dd10
	.xword	0x605a766c3e2cd0b8
	.xword	0x9646921e110ebeaa
	.xword	0x1c725a71c7ae008e
	.xword	0xa782a1aaf303802b
	.xword	0xcc6a45d325e5c2d5
	.xword	0xf5b595c64f9d4417
	.xword	0x492a22a989c2d49a
	.xword	0x28447f6136eed1d5
	.xword	0x279287e7a1afdec7
	.xword	0x16452dc44d0d324d
	.xword	0xaa74a00e9321c156
	.xword	0x2165a5daa8c33484
	.xword	0x4f5b5e99e4f11c60
	.xword	0x1ab421c0f4fadf90
	.xword	0x5620b7ceff45d31e
	.xword	0x24457c4fd292064c
	.xword	0x257000830dc34137
	.xword	0xe6e327d9a2b19575
	.xword	0x28ce2c2da402dddb
	.xword	0x95908efc3b109080
	.xword	0xaa267b5cb90ae809
	.xword	0x4b5c735ddf43a724
	.xword	0x255de5425761610c
	.xword	0x4ffac3d40b43231a
	.xword	0x2dbb72aad7488f66
	.xword	0x80ea8528cd3bb317
	.xword	0x3be995dac4da2724
	.xword	0x7f1f26c37650ad9d
	.xword	0x9a859f823fbffe10
	.xword	0x39110c85c360aea9
	.xword	0x0f81058bf2695730
	.xword	0x29e146176cdfd601
	.xword	0x1768d20877200b2d
	.xword	0xbc9afb5d6b876aee
	.xword	0x1620c9b4c842266b
	.xword	0x179163248f51ec80
	.xword	0xa19501a667e4be8a
	.xword	0x8e5f4a3ed539c01f
	.xword	0xcdcb42a6b2199018
	.xword	0xde28df845947b443
	.xword	0xc908b5112fff8846
	.xword	0x87982c42d792ba43
	.xword	0x0d11579f97d38e47
	.xword	0x1b59ddb87dbe220a
	.xword	0xd4817084b34f4ab9
	.xword	0x6ccdc406f59a3cbe
	.xword	0x03e7acadf43162c6
	.xword	0x79089a21078dea63
	.xword	0x34ff926aea0a34cb
	.xword	0x12648f04ce4e0516
	.xword	0xfb49b17f2c7f20f5
	.xword	0x84a5463cc423033c
	.xword	0x709cae188b9a0ddc
	.xword	0x2344e3581ab8b410
	.xword	0xb4793c010cd35662
	.xword	0x3dbdbcf4f71b3e3c
	.xword	0x7bddc34ac8095e42
	.xword	0x2e6c1a2b75ff59e9
	.xword	0x800e1d1aab5c811c
	.xword	0xd6e997e966436627
	.xword	0x3b0b12f79d93bea0
	.xword	0xbe8a161b8d99655e
	.xword	0xa153f61b1dbfd046
	.xword	0xe9823211972b71a6
	.xword	0xda83ccced12c9e65
	.xword	0xb6f90762b719fb0a
	.xword	0xf0c7a5d46fbbaef1
	.xword	0xcd8268f0746b4eca
	.xword	0x277a8990362dbc59
	.xword	0x1441f8abaebca7bf
	.xword	0x32b1f4debf1f86bb
	.xword	0x7e77f9b92b5e6c40
	.xword	0xaa2e1232a56aca97
	.xword	0xfac0b2912bc48f22
	.xword	0x4ea7e7f3c1c8c409
	.xword	0xd49ff97466806d2b
	.xword	0xf81affa83801d268
	.xword	0xb41f5d6e94c5f1bf
	.xword	0xd8a4db51fc3b4df3
	.xword	0x15e74ddabdd3c341
	.xword	0x2eca7f85595e148a
	.xword	0x0d71b0c981f34fac
	.xword	0x60b010ed1c7910cd
	.xword	0x611a1765740eb0eb
	.xword	0x3de4badd023d80b3
	.xword	0x8353bcfcdec67367
	.xword	0x097ea2d6c7cc8d28
	.xword	0xc9732b563184d3ff
	.xword	0xf19e8e07f6eeca8f
	.xword	0x4c5e4cf01c714252
	.xword	0xc46d79be217a717c
	.xword	0x7d093519ea344a17
	.xword	0x043867d75f1dbb3b
	.xword	0xbe87a555191fcd69
	.xword	0x8e78f6b8c0c0662a
	.xword	0x5d4549cf17355851
	.xword	0xbfb3aed1d20671a8
	.xword	0xe5dd4913ba4a0980
	.xword	0xdfacbb377e0e390f
	.xword	0xb27fb7f4bc4264fa
	.xword	0x0c4908fe57c45539
	.xword	0x86e36a085cdecb0a
	.xword	0x23aa8759bb608ba0
	.xword	0x64cb47b68f37cd20
	.xword	0x14827e39fa2a3dc7
	.xword	0xb0d4afb61e2bd21b
	.xword	0xf7ebba2490af6ae6
	.xword	0xc8964180845c4dd7
	.xword	0x39806ef65a9cb780
	.xword	0xffb6d0261937ec85
	.xword	0x94c980d7da1915d9
	.xword	0x7019abeb57890561
	.xword	0x3a9f4f6f84bdda9d
	.xword	0xadd4f206b6e1875c
	.xword	0x7bb3f3c6ca44beb4
	.xword	0x065555b300a92ce3
	.xword	0x236cd0d5204d5baa
	.xword	0x1dc8686131f74463
	.xword	0x9eb146a89e330774
	.xword	0xd3813bb7e15b020f
	.xword	0xb52452f5331ff4f3
	.xword	0xc5ba2ae5b0d3ecff
	.xword	0x311dac76d6b48d6a
	.xword	0xea820a7af403c6d6
	.xword	0xe1a0204ddc48e47b
	.xword	0xed807a9a41d7f9a0
	.xword	0xfe0f2ae9d2056df8
	.xword	0x276f059e067a9384
	.xword	0xe90c8c0e676cd697
	.xword	0x6188e62255de3162
	.xword	0x327fa37151f540e1
	.xword	0xda44170b4d1ff3cb
	.xword	0x90fe5010eaf0dc42
	.xword	0x3a1f959f50177b2c
	.xword	0x20ecfcaf12a90a0a
	.xword	0x55db5428c971837b
	.xword	0xe6974d3d99a1c06a
	.xword	0x26e0b36c97b00231
	.xword	0x7d022ea85cee1ed5
	.xword	0xa47f9d90a6535402
	.xword	0x3268e3701c4a391c
	.xword	0x918f160901601d65
	.xword	0x23c7f112b9be49bf
	.xword	0x9c5e4fafc26fe1a3
	.xword	0x4c260ba614d1a553
	.xword	0x2a2f8b87c5d18cad
	.xword	0x69492c2e060f76d0
	.xword	0x8a810da5c7470c3d
	.xword	0xdf6fbe160485a3fa
	.xword	0xb8c33da550d6cd18
	.xword	0xd11e24d4bf293d0c
	.xword	0x9fbb900a5177ddd2
	.xword	0x31d3501ce7e6121a
	.xword	0x10192ea14ae7ac39
	.xword	0xe6cd733d133dd625
	.xword	0x4763983f3f223ac0
	.xword	0x8c15995603db5b36
	.xword	0xb6b1a1f5a1e21935
	.xword	0xedc509099307fea9
	.xword	0xc6bdae0e2839cafc
	.xword	0x891b5dfb0c177cdb
	.xword	0xf6cc4b586fd5562c
	.xword	0xff45be02bdf9ec2a
	.xword	0x6e64d3637269a499
	.xword	0xab01b09cc0ff63fe
	.xword	0x15bfec7a24a57569
	.xword	0x55a2294ca5bd6fd0
	.xword	0xeffe1c1624938d42
	.xword	0x9dd54b716e9bb540
	.xword	0x814fc847c901f919
	.xword	0xd76a484970db11d2
	.xword	0x85df7b5cc0e47d15
	.xword	0x2d4e0f8ad8aad73f
	.xword	0x0e4e87514fef155d
	.xword	0xa241296e2a2cc575
	.xword	0x5bf4037f0e7bb815
	.xword	0x29a5e959ea849697
	.xword	0xb226bdcfeb64858c
	.xword	0x506404e2bd336caa
	.xword	0x13b6f493b3f792f5
	.xword	0xa3202198c364c0ad
	.xword	0x379a893ed221dcff
	.xword	0xea676e6c234b5c4f
	.xword	0xb2b3915b5e490a34
	.xword	0x2069a95127b89e5b
	.xword	0x6f5cc01b8c01215e
	.xword	0x67ae1e60e2acbcfd
	.xword	0x8df01a014654ae50
	.xword	0x95fdf9faec0e78a1
	.xword	0x7c3b93bf7e18dfd7
	.xword	0xd771c5270f5c5ee8
	.xword	0xc816e3b78ed8deaa
	.xword	0x0a12361c9bbb6241
	.xword	0xd9e8ef54dd47b5a3
	.xword	0x47b4b260028ef9ac
	.xword	0x30a9d7b2067d4e31
	.xword	0xc518002cefe4bf32
	.xword	0x1bc4726e044850a5
	.xword	0x1d666e441dfc45e5
	.xword	0xd8c9a0def1bf66de
	.xword	0x35f89063f18817b2
	.xword	0xd7ee8e069b11b882
	.xword	0xadd8ea0beb03b5df
	.xword	0xa1669c08e37367d8
	.xword	0xd9cb9120657184a0
	.xword	0xf48bf682071caf58
	.xword	0xc15f0cdb0ff4ffb5
	.xword	0xd0ad32f056a855e9
	.xword	0x6dfd49f93b0585ee
	.xword	0x399a50cdad39ff33
	.xword	0xe166dd58e5ceef4e
	.xword	0x8e75f4311aad3e2c
	.xword	0x21b19e7635a20aed
	.xword	0xe6a6cab0c66e7db2
	.xword	0x45b35cd017c34a1c
	.xword	0xd5ac74c2282ab0e5
	.xword	0x7d6578a386586aa5
	.xword	0x4109098ef9a17dfc
	.xword	0xbf061d27ef1293eb
	.xword	0x603e197187fc3342
	.xword	0x98cd1d6d5e729bc8
	.xword	0x64f5bb01213e56d8
	.xword	0xfaf6b45070f68b6b
	.align 0x2000
	.data
data_start_1:

	.xword	0x7adb0d6c63f7ba83
	.xword	0xb0545cb0e021f228
	.xword	0x019c2c2c3c3f6f35
	.xword	0x8bc1b56c2d3ed108
	.xword	0x67171b34d29b13bb
	.xword	0xaef4cea64bee448b
	.xword	0xaca5fa47747ab576
	.xword	0x947a6114dd891c8a
	.xword	0xee7785ae12bf31b1
	.xword	0xc723a8a1ae68f447
	.xword	0xb1986e04c4f527c2
	.xword	0xf90f9e38a01eb398
	.xword	0xd7fc35f1efaac8af
	.xword	0x1e396dc0cca0beb7
	.xword	0x7c1979653f517fba
	.xword	0xb4f8ffb325878d27
	.xword	0xf25b1d6a32bb05a4
	.xword	0x0d2a554f7be88eba
	.xword	0x06594d23860e0ad7
	.xword	0xdc16bacaaada2010
	.xword	0xb5b4bdfa9d9190b7
	.xword	0xc125bfc3e58e685c
	.xword	0x6569a01c3a9c3ae8
	.xword	0x6699277041db308c
	.xword	0xae4ef292bb68a36a
	.xword	0x5c5829b38351d2d9
	.xword	0x09ed85580e77524f
	.xword	0x34e8ad8e3b5ed022
	.xword	0xbc095888ac5da0d6
	.xword	0x7eb6daad10250f1d
	.xword	0x2c4d380f8cb4a801
	.xword	0x46bc72170c9f7494
	.xword	0x3487ba37fafa4594
	.xword	0x498a3d6c065f14cd
	.xword	0x947b197668386be6
	.xword	0xe04cd61d9f300b98
	.xword	0xf1f2bfe7acf925cd
	.xword	0x4d3d863102dd11b1
	.xword	0x6df5606e900d0f77
	.xword	0xe1721e93d3c8aabb
	.xword	0x4765b1cfaae4abd9
	.xword	0x0710f3ae203a8fcd
	.xword	0x091cdd43a20f99db
	.xword	0xab2addb458c97f6f
	.xword	0x36a4290d67ebff49
	.xword	0xd0802513e4ca62df
	.xword	0xc1f225fbdd36c746
	.xword	0x3c301ed9f31b6e2e
	.xword	0x3b1c52330a949500
	.xword	0x9039fb03e4135f99
	.xword	0x830fde72333532e8
	.xword	0x4f6910982eb77863
	.xword	0x05b91b9091444be5
	.xword	0x98a48d8e4fc9f7b6
	.xword	0xf42e0c79922276df
	.xword	0x63bf61a4dbc388b9
	.xword	0xea99045360f8d099
	.xword	0xd38475122322fa0f
	.xword	0x44f553cbbe572789
	.xword	0x29c3f7467ff7f9fd
	.xword	0x1a3527279f9acf5f
	.xword	0x89c8790c6333f73d
	.xword	0x2c4d16a598d76e50
	.xword	0x50d5c89808df1bad
	.xword	0xfaf1e7b36dd6da7d
	.xword	0x389b65c62976d60f
	.xword	0xac5e84b0ff9063f2
	.xword	0x73f2e6cdc51c0cd8
	.xword	0x4c61071d92f969ba
	.xword	0x134139143d24fec2
	.xword	0x90ef3276c700c732
	.xword	0x11fe221c02c2bba6
	.xword	0x573144a27e6c2f06
	.xword	0x9f4ef9ae372e129e
	.xword	0x3dcd2b7cc9d7af55
	.xword	0x9251f025198314f7
	.xword	0xb4d424d5d06f097d
	.xword	0xe2d9637e8f32fc9c
	.xword	0x5dfeca43391410b0
	.xword	0x7ae60de2bde1175c
	.xword	0x68d8d5c27ae8f9c5
	.xword	0x988aaba347ac280c
	.xword	0xb61fa0fe0ccfd7ee
	.xword	0xeac8e4f24dab00a6
	.xword	0xe48a7fa70c4f6089
	.xword	0xfb97d989a5c3b4ca
	.xword	0xe1111029a077e423
	.xword	0xa0eb158118da3a86
	.xword	0xd21ae01b758e2bf4
	.xword	0xd7fecd9c39bc9a5c
	.xword	0x3e610cfd6ced1a86
	.xword	0x2372752c6425c119
	.xword	0x291a302d9006cc9e
	.xword	0xd58b0f667ac66569
	.xword	0xce1992b284d2a722
	.xword	0x5557a6172a7e1783
	.xword	0x9557ee6c9f243bc4
	.xword	0xb42899e96b638f0c
	.xword	0x0417cd7ba4d19730
	.xword	0x920c5fd7652f4e80
	.xword	0x7c41b79f1d8005a4
	.xword	0x060708f15908a0b0
	.xword	0x345a1815f1dd2f74
	.xword	0x4d1a451ae872ed72
	.xword	0x71031d853f90b03e
	.xword	0x9c4e6b911162c303
	.xword	0x6f9d19aac492ef27
	.xword	0x698b05b7ecf4347a
	.xword	0x78457dcba4211bc2
	.xword	0xca63629c7447c3b5
	.xword	0xb7895a38ebd3aa92
	.xword	0xd3cfb7a20ac14c64
	.xword	0x6771609591c9247a
	.xword	0x313bb8900292db92
	.xword	0x5c58cb8b5c509dbe
	.xword	0xab3bdb6d07ab35fb
	.xword	0x449e8989b4e438e1
	.xword	0xcd0e4132e6306d7e
	.xword	0x875fe4dd94cd9064
	.xword	0x771e15cd6a608b1e
	.xword	0x3d3b3f3f70b1e742
	.xword	0x6e8ad7d33737e886
	.xword	0x3d8c17b8bcd22443
	.xword	0xc18c563a1c8982b4
	.xword	0xbfef5421a3292518
	.xword	0xbfe7f2d31500b7f6
	.xword	0xf22ad1805759e6f8
	.xword	0x726ab5e071373673
	.xword	0xe297708fab99fcd6
	.xword	0x9d0dbbd4c4b6b043
	.xword	0x59ecb8bcd2478632
	.xword	0xc8c0ab5da9a98ec9
	.xword	0x7163eeaa1f358d54
	.xword	0xe0171edb5d4b164f
	.xword	0xa581eb305de148b3
	.xword	0x1b663b67734c038a
	.xword	0x00cd350569b60341
	.xword	0xc104c4899df44db5
	.xword	0x80161782bccb8240
	.xword	0x6667b89a948f7725
	.xword	0x78858cda59cb41a3
	.xword	0x2dd70e52a37bf9ef
	.xword	0x408d0b0ee14867ad
	.xword	0x1436caf753314baa
	.xword	0xdec05fc9ad5ec735
	.xword	0x83094194918a0d7e
	.xword	0xd595b55a93733976
	.xword	0x9dcb637a4c748bca
	.xword	0x2828396d3bf09405
	.xword	0x725429b68f553770
	.xword	0xce5cb3e9fb3651bc
	.xword	0x4fc884afbcf5c0be
	.xword	0x8bed8ad96d30b5d9
	.xword	0x4f908b82ef411861
	.xword	0x3804af15586f154a
	.xword	0xb7ff03965a2147ce
	.xword	0x653cb47e1028090f
	.xword	0x84382d2154e36f36
	.xword	0x58380f2c24afded2
	.xword	0x9beff397e488af9f
	.xword	0x969194dbfa976e84
	.xword	0xfe74b02309f87130
	.xword	0xf9dbbb9f7d930d8f
	.xword	0x08d487cbb046d313
	.xword	0x871adb7243883e6d
	.xword	0x9a1ec247107b45ad
	.xword	0x3bc6e8c5b234ed48
	.xword	0xe5981120e0606a7c
	.xword	0x64493a6890357c33
	.xword	0x1f98093039eab448
	.xword	0x84535a57a3cdf9e3
	.xword	0xfad372d88acdd06f
	.xword	0xe589c8fa742f5fd1
	.xword	0xc62569f017d02019
	.xword	0x12697b6ee697c469
	.xword	0xf19c638f22336576
	.xword	0xf7759f69b3f5e0d5
	.xword	0x6069afb14d6f8be6
	.xword	0xe8e23ca20bf7eb0f
	.xword	0x704d680c7f7c5cb6
	.xword	0x03ba7169dd3bde41
	.xword	0x7b69335218d42e15
	.xword	0x1ae386959e47621d
	.xword	0xeba7e2f900b3525d
	.xword	0xa1f9e9d3aecee413
	.xword	0x316165c96e448c35
	.xword	0xd277e791219a8694
	.xword	0xdd2b0fbb96cba13e
	.xword	0xb5388056ed506360
	.xword	0x86077564131081a9
	.xword	0x36ac940403d1c701
	.xword	0xfc64ea6aac5094d2
	.xword	0xb62e55ce0807eb69
	.xword	0xc88cfa6a92206425
	.xword	0x3a68ad7a4e6ce51e
	.xword	0xd8773aecc19ff076
	.xword	0x3b430fe744723f8f
	.xword	0x8bfccf1d8fa0c552
	.xword	0xfd01d051227db919
	.xword	0x0f5b0bfe5c2adfb0
	.xword	0xe2c9f939feaf4a2f
	.xword	0x39b6cc0a8b014d40
	.xword	0x3e07fbe403053095
	.xword	0x6d223c2905b7050d
	.xword	0x1bba7b063388e45f
	.xword	0x8633602c20a9fb1e
	.xword	0xbe3a64bda3e866cd
	.xword	0x672f19e933a7dff3
	.xword	0x7a8550ca1a1b03c4
	.xword	0xfbf276809a382ce0
	.xword	0xb7d7b1186ec92ccc
	.xword	0xa3c54a293ae41c7b
	.xword	0xb18086b87f0abf0a
	.xword	0x9337df676b2cdd63
	.xword	0x79d0d9bf7fbdc8d2
	.xword	0x54764049a76fdca0
	.xword	0x7ca1cea4292e50be
	.xword	0x753d5f8f722a9aad
	.xword	0x57d22c831dde797c
	.xword	0xc29c2967783a38d6
	.xword	0x13d6beb5e37c0d37
	.xword	0x7d356bb616e6d9a6
	.xword	0x24f0e2fd2d4b20a3
	.xword	0xd2c8fd9976104de9
	.xword	0x6f3c12b7e178dd1d
	.xword	0x022e0907f773961b
	.xword	0x317b16986117b6e1
	.xword	0xe31c9167e6e3bfc8
	.xword	0x45b773750e6dd666
	.xword	0x2dfb6571a59b71ec
	.xword	0x4c3decc68c553f81
	.xword	0x7c54e1a5029892dc
	.xword	0x412c6043328b8dc2
	.xword	0xcf8b6c398012f1e2
	.xword	0xcde6ea352dc332df
	.xword	0x90e4799da19ebc45
	.xword	0x9cae9969ab5fa857
	.xword	0xfda14c26a27556e6
	.xword	0xf8c3850507df1be6
	.xword	0xf961f855c95b09a9
	.xword	0x49089ea35f66d671
	.xword	0xffd114e2314d7699
	.xword	0xa92cfe4d8ebff436
	.xword	0x3ab7d3488fa53249
	.xword	0x5433f855ef121559
	.xword	0x62c2fcf809f71fad
	.xword	0x452786d4e1582c23
	.xword	0xf50b2bfbcb2fbe24
	.xword	0xca10ccadd782b081
	.xword	0xd9ac93bca3a779f8
	.xword	0x58573b221b2cc373
	.xword	0x641929ea05f7bac4
	.xword	0x36f8409ff8f3695a
	.xword	0x62c47b83bce8c83d
	.xword	0xc118eade05bdf87a
	.xword	0x829d0103f1ecd663
	.align 0x4000
	.data
data_start_2:

	.xword	0x8c8ad91846313b4c
	.xword	0xcd2beabd864242c1
	.xword	0x17e4762f158ead12
	.xword	0xe0b7121dec9c8d18
	.xword	0x43f3241ac0905f78
	.xword	0xd0f1455a3ab92313
	.xword	0xd361de90bffeb0e3
	.xword	0x3ac7272c83c3237c
	.xword	0xcb248a5dd9477601
	.xword	0x086b423de8942645
	.xword	0xaa0670aee9aa17d0
	.xword	0x2b7f3a2cf901e79c
	.xword	0x50d0753deac8c483
	.xword	0xfabbc6899196596e
	.xword	0x5005e21494a74c2f
	.xword	0x662bb12fc519bace
	.xword	0x202084b76523a466
	.xword	0x493a7b6b2f63c60c
	.xword	0x771cf0a895cfe2f7
	.xword	0xec35e3c0a0977d07
	.xword	0xc9dc53a00104c44d
	.xword	0xe8951bb185f15020
	.xword	0x968d54636379088b
	.xword	0x6d6b6b4b3b8e4eb2
	.xword	0x32ce2f3c4a90a9bb
	.xword	0xc8dba6afd6f34db9
	.xword	0x016bcb1da690f7cf
	.xword	0xa0b0781cad2e075e
	.xword	0x394eb2d932dd20ef
	.xword	0xccc90708006e2145
	.xword	0x7e0e36d574a72e49
	.xword	0xc5528a0fc4aa988e
	.xword	0x08f0cc3f1ec73377
	.xword	0xbc8943087bef8ee0
	.xword	0x874871f107f2b796
	.xword	0xbff2ac756da4971e
	.xword	0x7752d382e49a817b
	.xword	0x6a517ae1be58f17b
	.xword	0x09b34ce6aa97e49f
	.xword	0x0d2dddfbbb0e759c
	.xword	0xeb2c90dca230a0bd
	.xword	0xf5e16c9898b82550
	.xword	0x8f2fbfc8ad67cbd0
	.xword	0x5c5ce20b043c77a3
	.xword	0x236834add1b8d920
	.xword	0x1291ab8308c34c30
	.xword	0xac727f2f1b3f35c6
	.xword	0xa08b76704da5b0bf
	.xword	0xc9a7efde99fae461
	.xword	0xa208140298658ae1
	.xword	0x53eb93387869054c
	.xword	0x7279e6e38d674eff
	.xword	0xf1dc95aceb400508
	.xword	0x65b105208393712b
	.xword	0xe2373fc50ffebd4c
	.xword	0x25640cf71ad4b950
	.xword	0x01caeda6eccbdbb9
	.xword	0xc6a38285bb00ff91
	.xword	0xcd6bfc82d62f2b99
	.xword	0x424ef32ac7be3cb5
	.xword	0x09955e3ac79b7fa0
	.xword	0xc8837a087ce786a7
	.xword	0xfc6f4ba64e630f00
	.xword	0x93aa119644b3e8ec
	.xword	0xc98cc945838db241
	.xword	0xa366d941810eb4e0
	.xword	0xb7281fb37d583e04
	.xword	0x9b6ada3f26e07f7e
	.xword	0x563f78e50e0a565c
	.xword	0xc1f58d86b8b063d0
	.xword	0x1287711dd8ddc4d5
	.xword	0xce5cee4c69c4fd42
	.xword	0x1a79f32ec722682f
	.xword	0x04c2ed49220b5ee7
	.xword	0x62ac023fd4873ec9
	.xword	0xd5d97dadf222e707
	.xword	0xe1a6680ad47b989b
	.xword	0x5d1199293e230ca6
	.xword	0xaaad9800b9b17784
	.xword	0x692ee27da178a303
	.xword	0x4ed718de23d41b85
	.xword	0x7c0b947e6364c94a
	.xword	0x78bae9324a274a89
	.xword	0xba42883b6addc0eb
	.xword	0x6c019718efa36a31
	.xword	0xc1599a601ac7d2f5
	.xword	0x34ec60977e95d3e5
	.xword	0xc5e312b387323fd0
	.xword	0x764873aa2baf1957
	.xword	0x5208e6246068c91a
	.xword	0xe376da0a1c385205
	.xword	0xa13e06f74486e8d9
	.xword	0xb0ccfdca50c0d151
	.xword	0x1f2d5746e37c63d7
	.xword	0xd1488c07853ecc2f
	.xword	0xac81c2917a91c405
	.xword	0x3af96cd79c92641e
	.xword	0xfd16ad0d88eeeac4
	.xword	0x837dde7c15eadb71
	.xword	0x57e5cba27bd54f28
	.xword	0x3b864edbea97a708
	.xword	0x76e42a771c4f8997
	.xword	0xf397ba1d94f9857f
	.xword	0xf48ad96fd2a38bbc
	.xword	0x36f0ffdb9a7a09a0
	.xword	0xffd20e2f50aad8ff
	.xword	0x88f1dacccbf4c424
	.xword	0x711dfefa95892860
	.xword	0x6317cb5dedb4c022
	.xword	0x8ffeca9c570ccae9
	.xword	0xdc619a9c3dc69292
	.xword	0x53aeeb019610229f
	.xword	0x4e7c3519be8dd79e
	.xword	0x993d01b51f05405c
	.xword	0x510d1d93ffa3d415
	.xword	0x55e33455091360d2
	.xword	0xe5f8d5847890a19a
	.xword	0x78ba613b24315842
	.xword	0xf0030eefc907bfa5
	.xword	0x7abd24ee9ff9f774
	.xword	0x2988762f311ba936
	.xword	0xcc515fd180fb046b
	.xword	0x0a1346e521146476
	.xword	0x1f0e1dbc83919dd3
	.xword	0x9d57186f7ad399e6
	.xword	0xc5098e9bcf2884ec
	.xword	0x4d70fcc2746e4df9
	.xword	0xdbdd8aba30307b9d
	.xword	0xa58c798ae6ffe73e
	.xword	0x3af0eb00a8a889b2
	.xword	0xa105a6edfbf3b15a
	.xword	0x47186093165861f7
	.xword	0x8f2ae73a6e5f1762
	.xword	0xb7a0313df9b1ca7c
	.xword	0x9ef05dfcca27eb03
	.xword	0xcc35607435d094ce
	.xword	0x10647a0ff8497c2a
	.xword	0x46380ec083b87c9f
	.xword	0xcc571e73423e6df8
	.xword	0xf2b0f697fc430435
	.xword	0x45e7601df1546aad
	.xword	0x855c117634a374b9
	.xword	0x55b9a8a94e20fc6b
	.xword	0xa285022fd976aa02
	.xword	0xa0e6ba4f41817aa8
	.xword	0xc8d5b80fc880d9aa
	.xword	0x6cda60a555c3cd2e
	.xword	0xc0d70853d7b60e3d
	.xword	0x839049566fcbab53
	.xword	0xcc43c6bf87958781
	.xword	0x725abb1e87af30b9
	.xword	0x7963c3d60ab64fdb
	.xword	0x9396e90ad3de81ef
	.xword	0x3f40ea9faccccd6d
	.xword	0xe1952bb1dd986059
	.xword	0x01712e4134ac256c
	.xword	0x8afc62693287e27b
	.xword	0xfc9fe18eacdecb51
	.xword	0x45c206bc459ceb1d
	.xword	0x360a570cca5f2d01
	.xword	0x42151798e49def71
	.xword	0x17ee8c95942a16e8
	.xword	0x88d1a0f50d800179
	.xword	0x4790cb42641ede53
	.xword	0x5c7a9a671e7fce02
	.xword	0x500a8bbacd15dd6b
	.xword	0x4d266b1664d2f553
	.xword	0x6e67c96aa569c96d
	.xword	0x09993e2155bc5ffc
	.xword	0x819f7fded24f6106
	.xword	0x41e7dddf092026ff
	.xword	0x41d5b47cf0dd03a0
	.xword	0xdee62199844fe3fd
	.xword	0x5b16f7d6b29ba380
	.xword	0x3cb9fd45e5c141ac
	.xword	0xcc89fcea3da3cedc
	.xword	0x3d6a16bebc4f8ad4
	.xword	0x36d46a1abc12a699
	.xword	0xfe0fd69d4bd453bf
	.xword	0xc807e4585bb3febf
	.xword	0x0711eebbff1d197e
	.xword	0x3b3244445be44dac
	.xword	0x7581ac12655b0891
	.xword	0x2c3121564b68ca33
	.xword	0x4851677ee9356235
	.xword	0x1309c8943c1eb07e
	.xword	0x9ecb2fe1c10c1d83
	.xword	0x3083cac7bcc61aad
	.xword	0x126fb517d886f4e0
	.xword	0xcfe47374cbd12ac3
	.xword	0xa00ff8563686c2a2
	.xword	0x13c1672e28c05ff1
	.xword	0x6c43aa1ccdbe7937
	.xword	0x873c39b28a5c9fbb
	.xword	0xb318cf67acbb7f10
	.xword	0xc28c3d5fa0a76161
	.xword	0x14f1dd09900ab3bb
	.xword	0x3365da2dc972bbe9
	.xword	0x66df1caa4b79f516
	.xword	0xb81c9ded54f865f4
	.xword	0xbf780a04578f3710
	.xword	0x9f442d8446caef6a
	.xword	0xe9de9406431fb6e3
	.xword	0x8f43c1936529969e
	.xword	0xab0ef81d375f5486
	.xword	0x0c500f500f16a7bb
	.xword	0x002f1646ee2962ec
	.xword	0xc0ae9cd1717d7a4a
	.xword	0x10f7b8e477aeb668
	.xword	0x1fbec450cd5224ba
	.xword	0xb6866d2053e5e039
	.xword	0x0bbe2f8a85cefeac
	.xword	0xb230df6bfa776568
	.xword	0x8f6c28d97b9c1e3b
	.xword	0xae1bf27439364bb1
	.xword	0xe46667ce47ad7f67
	.xword	0x9832db00976a6a16
	.xword	0x873d168bd6d0d36e
	.xword	0xc28a28b3390cb5d5
	.xword	0x6b8e313d94811f05
	.xword	0x52b3e262e923b353
	.xword	0x09dec60584b8dd61
	.xword	0x0c88c89d7738d001
	.xword	0x0a06f69bdab893cf
	.xword	0x688c68de82a6de1d
	.xword	0xe01bad47087b484d
	.xword	0x8d2d97273416fbea
	.xword	0xcf166af39212be2a
	.xword	0x0278e6a0adb0d9de
	.xword	0xb7ff644309637c6e
	.xword	0xdd30bd36355c0cbc
	.xword	0x8ed07e7f8b577ac5
	.xword	0x9546534d95c23188
	.xword	0xdc75974a3108bffb
	.xword	0xbfb17e2f8123cb49
	.xword	0x37c3072242123d92
	.xword	0x5c1ceddcd03777fd
	.xword	0x9012480ad72e36f2
	.xword	0xda9403060e119cc4
	.xword	0x2fecc9c43c6c1e37
	.xword	0x67d8180f2becc595
	.xword	0x64a0fffde3378d2f
	.xword	0x78adb18099c79437
	.xword	0xe205ec4609e2a866
	.xword	0x90a5623f725e64ff
	.xword	0xd10da7e24d3ec665
	.xword	0x6416b8b910cdf6c5
	.xword	0x7ed2972d44e98fce
	.xword	0xaed3a226dbe4cf6c
	.xword	0x87a9a0a080508e89
	.xword	0x05f32e8855771874
	.xword	0xdfa201ccdb3261e0
	.xword	0xb6c429ddee9ffe5e
	.xword	0xc8eec77d08fbc72a
	.xword	0x35a7ee62f538ef61
	.xword	0x28dbb0520ab5f008
	.align 0x8000
	.data
data_start_3:

	.xword	0x46c70b8aaf094c19
	.xword	0x54c6cc112d03a951
	.xword	0x4dfc01f90acba6c5
	.xword	0x60381649f8b30e2a
	.xword	0x14cc23fec99975c5
	.xword	0x62e44d5b9c3ae26e
	.xword	0xcb3f273a3c425d63
	.xword	0xcde2765b23731c59
	.xword	0xe2b7d889dc71de24
	.xword	0x95f9ce6ff6da9d4a
	.xword	0xd92cd781af5f5b8c
	.xword	0x3bf24501761d733e
	.xword	0x4f24cb24452cf46b
	.xword	0x6fe43abbc6fe46b0
	.xword	0xf8ff56650df34702
	.xword	0xc08dd1354293fccb
	.xword	0x7099971e801d0241
	.xword	0xfce835ad1ca82bb5
	.xword	0xae9e77c247abf6df
	.xword	0xf49e37c411857ef8
	.xword	0xe1cd846f79660bbc
	.xword	0x39016cbb9f46e532
	.xword	0x0f45c2ca77786b26
	.xword	0x2a071fcd97b72c04
	.xword	0x43735c105addb1d0
	.xword	0x2e302a5a0ea12275
	.xword	0x823ed54df0d48b71
	.xword	0xae6847416cc14641
	.xword	0x99ce4ecf520fb8f1
	.xword	0x1a85eea29c28b7ad
	.xword	0x6fad74d23f149db9
	.xword	0xea840374905ad0f6
	.xword	0x0e2e30a91e9f21e2
	.xword	0xfa081d23cae7f355
	.xword	0xb3ae374117e2137d
	.xword	0x64bd605244f54051
	.xword	0xe9a62b2541b20cda
	.xword	0x38e54d0ab9b247c2
	.xword	0x832c6802a1fcea39
	.xword	0xec9e7f79a7290527
	.xword	0xe246c5b9b95b7380
	.xword	0x231e3101daeee0bf
	.xword	0xdff4288960a15be8
	.xword	0x272ead397db4c062
	.xword	0xc5ec0269fde9ddda
	.xword	0x4f573a1b69ee6852
	.xword	0x4281222890cdc6b8
	.xword	0xcc17d31f6ef2b796
	.xword	0x0c65cedc1c60d12a
	.xword	0xebacdc246ab903cb
	.xword	0x6d83be2bd34e698c
	.xword	0xf493a43fd12b5a3b
	.xword	0xa8efcfc2ab8a81bb
	.xword	0xad576de7b2e505c3
	.xword	0x4adf81ef41823581
	.xword	0xb1aa3d39ec1a2bb4
	.xword	0xa34903284901bcb0
	.xword	0xfe7bf0b215c89915
	.xword	0x3065fe8f22a73ce5
	.xword	0x9d2a1fc828cdbd02
	.xword	0x04814746aeeb246a
	.xword	0x4a5f4f60e02edcd6
	.xword	0xe529088319ca30f4
	.xword	0x9854879706230eab
	.xword	0x4fd028d68097015c
	.xword	0xe7f2df20e0835f7a
	.xword	0x60740db3739e41e6
	.xword	0xf8c4c6266c8132a3
	.xword	0x00b6c19ff664d47b
	.xword	0xe5e735eefdc02040
	.xword	0x075a4cc9be9aac25
	.xword	0x2e4ef6bfa3d1c824
	.xword	0x7c6979591d304b38
	.xword	0x30185f9b9e6e67a7
	.xword	0x9f0286c15055284d
	.xword	0x1010025192edf3fa
	.xword	0x58a850bc4d8e456f
	.xword	0xbfbc03c5adae63e0
	.xword	0x6e98218104f11f8b
	.xword	0x514e0fc088e41ed8
	.xword	0x56b5b3e997a61da2
	.xword	0xbabe67466cc7570c
	.xword	0x2f64c9398ac696d9
	.xword	0x6a28176f53ec1ff2
	.xword	0xf3ad74c5db318f46
	.xword	0x765ffa2e9e5b40a0
	.xword	0x00b0c48856e3f695
	.xword	0x2e1520cae93f14ac
	.xword	0x19c14c5b90510f73
	.xword	0x85d9be52cfe4c45c
	.xword	0x1c59bba335e529f9
	.xword	0x8167408f28681e1b
	.xword	0x8fc6e40293e4a9f6
	.xword	0x21c646a5738fee6e
	.xword	0xf3e4d8b0822f8d5f
	.xword	0x7c87b96a2aec985e
	.xword	0x05c7fe3adda3f1d7
	.xword	0xd2a77a9929d3f47b
	.xword	0x67b4b5525f1722ed
	.xword	0xfdf427b4c6e721f8
	.xword	0xf602780a08f9c769
	.xword	0x0443623fbf2a2432
	.xword	0x4252c222b56e8df7
	.xword	0xd5d1e12ce4c41d10
	.xword	0xdaf596935bf78ee0
	.xword	0xa955daaa314fd6d2
	.xword	0x5ae0b6498c5b679e
	.xword	0x0a6bd12f8b0bee97
	.xword	0x1bc044ff3e2113fa
	.xword	0xa88ff8c0a6cf8243
	.xword	0x8717c1dd1b2f14e1
	.xword	0x8a19e40bb964fd7a
	.xword	0x9f2621e09fe4ed43
	.xword	0x74f6799f838549b6
	.xword	0x4acb33279970c5cc
	.xword	0x42137a27878d6965
	.xword	0x78a476d6214aec87
	.xword	0xb1b203cea5718ee8
	.xword	0xc05a96a84acd38d3
	.xword	0x6f019c1ec9e51c8c
	.xword	0xed95d04f55fbd113
	.xword	0x05650e3ef6cd0301
	.xword	0x73cb8906ef0e9a9d
	.xword	0x5e090b35d48da9a8
	.xword	0xdd4a64490b87d9bd
	.xword	0xceb02c0fecd46765
	.xword	0x487dac1fd9b923ed
	.xword	0xf8282b406d02a06b
	.xword	0x80e97fd13ce39f33
	.xword	0xf955282067bd31ef
	.xword	0xba29ce0a28747d5e
	.xword	0xe43bda9683c58743
	.xword	0xa37979a8f8f081ba
	.xword	0xde7093f76a3a021a
	.xword	0xba5b31bcf153accb
	.xword	0x96fe55924401d37f
	.xword	0x890c4c1ad0b6b907
	.xword	0x2f0e7e61ff3cbad0
	.xword	0x8d0fc06a754ae467
	.xword	0x9376db13f3494d31
	.xword	0x120b8b9d23790c20
	.xword	0xb3b904e06727c7cf
	.xword	0x06cbe69211c382b2
	.xword	0x4b1f19660a67a47b
	.xword	0x7e3a86c2d4d0cb7c
	.xword	0xb374739f0dd06db4
	.xword	0x0b926224efe75089
	.xword	0x28efd58f70f41974
	.xword	0xf7f3f65c5f510570
	.xword	0xe92d5c3da034e605
	.xword	0xadfa4fa89a009cd8
	.xword	0xb4693b0662ad9301
	.xword	0x6d3c6f15f59cfaea
	.xword	0xa1f85eb6d8d88f23
	.xword	0xff5ae29f0911e7d0
	.xword	0x5d674fc48917d898
	.xword	0xb156ec79a82624c2
	.xword	0x841812c6346c60d5
	.xword	0x570aff7cf2734458
	.xword	0x6650acc8708c22b3
	.xword	0x14be0b55fabd8f26
	.xword	0x9615f30041951491
	.xword	0xb5a5f296ca349d55
	.xword	0xd03eb8e403626a26
	.xword	0xd74f5f2bf368f53a
	.xword	0xaee3468ec728e34a
	.xword	0xf86286aef97ddfb1
	.xword	0xec47b9e8267e1fac
	.xword	0x4412736914c1545b
	.xword	0x5cf4dc98004d181e
	.xword	0x0c15bca262e5cc5f
	.xword	0x51000bbeabda5dbf
	.xword	0xf162b53bb01f1f69
	.xword	0xbfd5e4d424bafa94
	.xword	0x8b3c67295bbf56b6
	.xword	0x850b1dc43cbbddfe
	.xword	0x12c1c023ee1e994c
	.xword	0x640d2644f28bccff
	.xword	0x2202636a12376dc0
	.xword	0x598fc337be5eae11
	.xword	0xcea48250fd65deb0
	.xword	0xa36d103c2180beb8
	.xword	0xe76b5da2366fe8a8
	.xword	0x620a50f5d992e5d6
	.xword	0x7a6eff42aef99471
	.xword	0xe259d5dc2a4114b8
	.xword	0x1a339e72c32d502d
	.xword	0x281e1ef500a34fbe
	.xword	0x4d941b2b3233c888
	.xword	0x2d13ba4002a3bcf2
	.xword	0xa9557f3bda8f0ecf
	.xword	0xeade7c7c3b7ba3f5
	.xword	0xe8be5f9dab6f993b
	.xword	0xe1503f414d14808b
	.xword	0x27f88fb301a61e5e
	.xword	0x65edb18ea8c9d4d7
	.xword	0x4f0fe691bc2fa007
	.xword	0x7396c876c5cf3443
	.xword	0xa4f814bb7da0b4dc
	.xword	0x3b21030a012bc972
	.xword	0x79fb7d94ac773f76
	.xword	0xb1dee7290f47ea08
	.xword	0x41febfcb701ec5a7
	.xword	0xbd0342697f68b2ea
	.xword	0x8dfeb9550b2e02c5
	.xword	0x0b15189e7e3c0dcd
	.xword	0x9aab71fd0c7decf1
	.xword	0xa92619d780c5842a
	.xword	0x4d1c71e71949d129
	.xword	0x7b378797dbd449ea
	.xword	0x4826a8763d9bb52a
	.xword	0x63f5739274c55dfe
	.xword	0xb370fb5e1439d878
	.xword	0xb7e810953341d153
	.xword	0x070c2a9be8bb9487
	.xword	0x8937dac6f7f9d9bd
	.xword	0x4959e7bf4d792326
	.xword	0x83af276ce4484a8e
	.xword	0x5a4f053623361ea1
	.xword	0xcc1c8a94ead9ff96
	.xword	0xba8d57e76d0a5721
	.xword	0x91ad7b68356f4e0e
	.xword	0x244c0e4ee6dc21c2
	.xword	0x7b0face91feb674a
	.xword	0x37ad6752edbdde5f
	.xword	0x0eb6b1d93e7b51a2
	.xword	0x6756cf316b7826bb
	.xword	0x6ff0d2380037ab3b
	.xword	0x41c0abedce8495a6
	.xword	0x0eac9076b97caffe
	.xword	0x230c860c6b53468b
	.xword	0x845ea91d77343fe1
	.xword	0x4d0b3c5d66192a6c
	.xword	0xb53d1aceccac6de7
	.xword	0x16adf3a47459d063
	.xword	0xbd88bb6ba5750feb
	.xword	0x4f6abb48d305c402
	.xword	0xd823bbca3229d400
	.xword	0xa4dcbe8c86a41067
	.xword	0xcf81bf7775e84282
	.xword	0x5b62d98502133a1b
	.xword	0xf9eeb806f9e2827a
	.xword	0x550fbd15e60084d6
	.xword	0x602b77426a0c863e
	.xword	0x6edbd603e11e8ee0
	.xword	0x752b85c53b803a06
	.xword	0xf74293242c268cae
	.xword	0x6cf158184acb483c
	.xword	0x34aa27397f4ee3cd
	.xword	0xd4b6d51cbc17a778
	.xword	0xa76e5e3aafd32cb5
	.xword	0xd9d281964a1d55fd
	.xword	0xbe44c3b4919c9440
	.xword	0xf4ade52f346f56d4
	.xword	0xce7c5b9b3791f700
	.xword	0x2321acf07a2490ef
	.align 0x10000
	.data
data_start_4:

	.xword	0x01bbd5b41d5ade78
	.xword	0x9f86fae66803d7dd
	.xword	0x40c52af8901573f0
	.xword	0x469935ed2a2cdf39
	.xword	0x3315c8732d2fb3f1
	.xword	0xbd84e06b1fe5428a
	.xword	0x784ff2ea454ddfa8
	.xword	0x0220f2491cca56ba
	.xword	0x8e9dc890e171aa4e
	.xword	0x5230e491abd0b304
	.xword	0x5aae2ecd243291f9
	.xword	0x07328a86c431265b
	.xword	0xcd4f9450e1c0ca58
	.xword	0xb210c498e93ac2f3
	.xword	0x267100b733d1482b
	.xword	0xb7e26f18e0ef58a6
	.xword	0xd7d5b7687cdba53e
	.xword	0x23b094083247420a
	.xword	0xb9b08617cc5c7ce3
	.xword	0x9be69fa9bd42bb62
	.xword	0x5e46abcfae2f3854
	.xword	0x378a6a4a4408eb28
	.xword	0xdfc0445890c4ec90
	.xword	0x19712f71d2fe7bc5
	.xword	0xbab580860711cc66
	.xword	0x843021dd941ec65e
	.xword	0x9557cbec9946b0d8
	.xword	0x4a0cd2d997473e29
	.xword	0x27e7ad000dcd025a
	.xword	0xfb0dddcfa786a942
	.xword	0x77956d34cdc0e31c
	.xword	0x05c43bc23b8804ba
	.xword	0x5a5f37af55d390fe
	.xword	0x360784662acb9f40
	.xword	0xa57d02924ff340c2
	.xword	0x990ce47cdf76f6a9
	.xword	0x0da138ced3a381cb
	.xword	0x543bade1b8d2494b
	.xword	0x3b1a24e5ae55a047
	.xword	0xd001c0e3d2b8ea8c
	.xword	0xd8b1a5c50dbc383f
	.xword	0x5965a6d3b520ca4d
	.xword	0xd943a55609611091
	.xword	0x0a3677fb46703e3a
	.xword	0x9a790b1db5a8a28d
	.xword	0x355d8c1d1482b778
	.xword	0xf2b4c01a0052e130
	.xword	0xbcb6195038cb03c9
	.xword	0xe89ebbd4cf049086
	.xword	0xf073e5f12d760288
	.xword	0x16f40e2b212f311e
	.xword	0xd7d800d0a8bf766c
	.xword	0x77ac2d1c3866de31
	.xword	0x04804a2ae87c6e1a
	.xword	0xb8b7feae0c8761b0
	.xword	0xc2b04a8fa1c99d13
	.xword	0x7acd9df18c29cdf9
	.xword	0x6afc9ee0f2277959
	.xword	0xcafcf0b16c949580
	.xword	0x21ff9042f06be3dc
	.xword	0x31b99675a0a992f1
	.xword	0x92db5cb9ccc84518
	.xword	0x58264e3b839fe96e
	.xword	0x1d648c1ffee7f175
	.xword	0xbe0461e59c1d04b8
	.xword	0xdba9ef22e8ba6df5
	.xword	0xffff5a67b58ae53d
	.xword	0x2127601d4f8a8330
	.xword	0xd8d2ca2ff88ba5a9
	.xword	0x4bfba49c0509289c
	.xword	0xeecd16430933969a
	.xword	0x90a7b6713c96c787
	.xword	0xa1f9d04cfb592e9f
	.xword	0x8563dc11151ccd9a
	.xword	0x71f850d321c864e8
	.xword	0xc5f099601cae141f
	.xword	0xf1991a260a8c66c5
	.xword	0xd4d5a9f34ed478b0
	.xword	0x68da937f299bccae
	.xword	0x8025697fc4be3821
	.xword	0x82ae2d52e868dd5e
	.xword	0x91dca9770bacdc20
	.xword	0xb4f57461948d35cb
	.xword	0x9ff4ba4991d679fe
	.xword	0xf6ad45e1aff57d3a
	.xword	0x03bf42a02774f568
	.xword	0x5e03a3d56a1e6c90
	.xword	0x2905414ca8cfd6fc
	.xword	0xf1f684d4d5a74ace
	.xword	0xd7b40f8df4354730
	.xword	0x087d5150c3fe2e73
	.xword	0x3a08b8698d530532
	.xword	0x2eadbb06c7a7eb23
	.xword	0x96db9c7fca1a1934
	.xword	0xea29fbf5d91d718e
	.xword	0xb34eedc605e4af7e
	.xword	0xd5482ad17a6bbd01
	.xword	0xd090bffd16beade0
	.xword	0xfeecfc1ffdb1ae4f
	.xword	0x5d831d64eb1e7427
	.xword	0x0193e410511643fb
	.xword	0xf8311bacbbf640cb
	.xword	0xdfbdfba865ead91d
	.xword	0x863e8c853e319e08
	.xword	0x63f51289c7ab2783
	.xword	0x41e458615adc3f15
	.xword	0xad251dab95a57f92
	.xword	0x323e9d57c8dcc473
	.xword	0x2824ef8fac5c6f71
	.xword	0x7712aa5b7b7f5caa
	.xword	0x1324811868620beb
	.xword	0x5d4b147884a46fc5
	.xword	0x91a12a763a2b7d2e
	.xword	0x8e33ba5317da8075
	.xword	0x2da1a3219f167824
	.xword	0xacca11d6c6730c60
	.xword	0x0abef9bc611ae3a2
	.xword	0x1b9b1900b6c3e0d5
	.xword	0x02dd16f5c07a6a07
	.xword	0x0747d182df52f4c5
	.xword	0x2822ec8891274104
	.xword	0x7cee12443c821e9d
	.xword	0xbf4e82e6f9ebb138
	.xword	0xd4d864ba5017ac7e
	.xword	0xf890f69abb5678c3
	.xword	0x01ae297f3b4427b7
	.xword	0x93d392a88672b4a1
	.xword	0x7a316cc4db37fb4c
	.xword	0xdf8ded36374dd75a
	.xword	0x3441607de5298764
	.xword	0x6ed4843a41d588e8
	.xword	0xf54e4df776dcb4a9
	.xword	0xb2afac185cf49c21
	.xword	0xd64b020d82710fb1
	.xword	0xac89128d0cda5308
	.xword	0x080ee96b0877cb67
	.xword	0xc91bbf020b9e41f4
	.xword	0xf28a0775194c8927
	.xword	0xadec08ab08ecc63e
	.xword	0x3775460cf9c1bdc1
	.xword	0x7c80a185d73875ed
	.xword	0x9da8e5cd14b8b1bd
	.xword	0xfa75772d1559a8ef
	.xword	0x0fabb0043f66901f
	.xword	0xae221c94f9e03f37
	.xword	0x26808f6820939f7b
	.xword	0x92c7600e3996f8a3
	.xword	0xac4cbce61edbc858
	.xword	0x9da74a3f6782151a
	.xword	0xda96fc3b351699cc
	.xword	0x48ce70463710342a
	.xword	0x89eff4774422eb53
	.xword	0x435568e598c0efc9
	.xword	0xe28d72793fa6d0a9
	.xword	0x52097e78b51a5619
	.xword	0x96e9ae3de90fae81
	.xword	0x2e175890f5490b59
	.xword	0xa553340297e0fc1f
	.xword	0x316f9fe24e262f26
	.xword	0x84a9518bc910f3a4
	.xword	0x5948442dadd030fb
	.xword	0x42508b6cf4492a82
	.xword	0xed71aee6ce1087bc
	.xword	0x126ff1f84746d6ff
	.xword	0x9dfdb6f6d852d9c9
	.xword	0x39a3549f494f4a51
	.xword	0x8b60bd0dafd85097
	.xword	0x83f0c0bc7b9a49e6
	.xword	0xea908d31849b07b0
	.xword	0x4fe737f8738a1850
	.xword	0xab3f684ff389d6a0
	.xword	0x95b76d9d452b09f5
	.xword	0x0e8be18acfe2adc8
	.xword	0x1a5d6ab2feee6ae4
	.xword	0x58bdaa2ea892cdcc
	.xword	0x8cd6dea8c5d34d7e
	.xword	0xd284915e46061be0
	.xword	0x02c5f60fee2f4d3a
	.xword	0xa11231010d8978e1
	.xword	0x67041243d06f8e61
	.xword	0xa72000254b81ec9b
	.xword	0xe66677254aafcad3
	.xword	0x3af1cd45e4da09de
	.xword	0xf7c7a9fd154ebd26
	.xword	0xe42878a4dd54cf25
	.xword	0x6655f7245d78eb18
	.xword	0x8486bdb70b2f3913
	.xword	0xa434b15e26e3f7a2
	.xword	0x1c1670552cfbe57f
	.xword	0x3fba387305a5a55b
	.xword	0xca6ec8eb00d5b02e
	.xword	0xdb2f7ef9aef3b0d4
	.xword	0xf783874f8b0cf81f
	.xword	0x64b1ea59915ff8bb
	.xword	0xc0ee0a74be539485
	.xword	0xe9e55b2931e84e42
	.xword	0xa1f0adee3b8a7819
	.xword	0x82c534aab93a4bcb
	.xword	0x08112061a49d872b
	.xword	0x14a3fb3bf3c0397b
	.xword	0x357078c21355843a
	.xword	0x6a3666679c1222f3
	.xword	0x6e4904bb2538e3ff
	.xword	0xb96395dfae6b93d6
	.xword	0x816f7383cbb64a6c
	.xword	0xc36f0d03d87f850d
	.xword	0x237beb5f5b3628e5
	.xword	0x96acf8340a12b53b
	.xword	0x3de763c19c2c80a1
	.xword	0xd7c9918f9f3daa9c
	.xword	0x6a81ccdc11b46b56
	.xword	0x754fceec72888f83
	.xword	0x3a86505cb0405f62
	.xword	0xfe7d04ed0e39f4b8
	.xword	0x67a14cb8b0253924
	.xword	0x84ef8c65364f1ee5
	.xword	0xe2a96fdcdcea6ee3
	.xword	0x04a385243d26aafc
	.xword	0xb90280bbf7d48e41
	.xword	0x54797b288a740b28
	.xword	0xd378274fa4f750e2
	.xword	0x67e474f9d78608f9
	.xword	0x8361b172f4cd4dba
	.xword	0x2b70de442c6e6714
	.xword	0xccd45d4af1fbcbd1
	.xword	0x5d7703e915745506
	.xword	0x5cddef4430f564d2
	.xword	0x355a49c9cb9b61ec
	.xword	0x0ee78024d33be472
	.xword	0x310210bff40b0df2
	.xword	0xc712b8b2edbbc8c2
	.xword	0xb44600bf661f7234
	.xword	0xc2a7854f98a53cda
	.xword	0x9919fc8d8bc10f02
	.xword	0x4cfcd115fe45a424
	.xword	0x762fb7611ea3b74e
	.xword	0x4c2c03031b298d8e
	.xword	0xb39513ce475ba547
	.xword	0x34a03cc52e755985
	.xword	0x9e4ec095257da0b8
	.xword	0x1c0de156dd2b6c7d
	.xword	0x477e75d1034d7824
	.xword	0xa3f43a9d17f8949c
	.xword	0x9fca22f89ce72bd7
	.xword	0x847431bd3a0f51d2
	.xword	0xcb7dfd38a62eab02
	.xword	0x941a2e07f0d9c36e
	.xword	0x49ac2aa46bf8521a
	.xword	0x4e93a98c7a28e46a
	.xword	0xc78c2646ab688083
	.xword	0xb9a66a228aa3014b
	.xword	0x4630bf7378493fd3
	.xword	0xe79725468f675f69
	.xword	0x5da36ab73fd2b53d
	.xword	0x001cdbd555deb7d4
	.xword	0x56fded155439167c
	.align 0x20000
	.data
data_start_5:

	.xword	0x55a511e076e4a34e
	.xword	0xe94e0ebbf9432bb2
	.xword	0xa1010c837ec3e9ba
	.xword	0x81fe416a50e2659c
	.xword	0xb1cd9f920cca8e4a
	.xword	0x51d5157861030076
	.xword	0x3a6d0cc4e57e723d
	.xword	0xcbfccf3e2be09b41
	.xword	0x431b8e68806c3746
	.xword	0xc5484fb7d6d9bd27
	.xword	0xcf97ca47d534dc40
	.xword	0x231a3144395b09eb
	.xword	0xe0f4c404ab6dac4c
	.xword	0xa61e2e37f1e30edc
	.xword	0x4c7d9811f7b8f9d5
	.xword	0xc9b496f47f7c64a6
	.xword	0xae230c3da63bd85f
	.xword	0x85fd433bb6c67c68
	.xword	0xa602a98fee8196f8
	.xword	0xef93a36aee88a252
	.xword	0x22e097da715b417d
	.xword	0xa02754a9b31d477e
	.xword	0x3b545fd52a7e40b9
	.xword	0x3ac586c9997ec84c
	.xword	0xc1a41b0c3679f641
	.xword	0x6fc8d92a7decac6d
	.xword	0x03df13a30eb9aec4
	.xword	0xce685562471212a7
	.xword	0xfef9a7234d0b16c4
	.xword	0xea3eea5e9cd488e0
	.xword	0x7580dc2dc3926ff1
	.xword	0x7774befcb8515507
	.xword	0x9de4fef002bae10d
	.xword	0xe0f07a1d671eab5e
	.xword	0x5e7a8e3ecf0ff7d8
	.xword	0x426220239793b935
	.xword	0x03a36f34eeabce6f
	.xword	0x1c1b83c2e5dffdc1
	.xword	0xf452cab12d4f4830
	.xword	0x8e4ff98c733865e2
	.xword	0x91547f4510a0348f
	.xword	0x7e9239cc37b467e9
	.xword	0xed544e8a2e5a4790
	.xword	0x742ef17a0f9e6265
	.xword	0x70d4846df76d5698
	.xword	0x756077b14b193e8b
	.xword	0x3fd38f46693f2e7e
	.xword	0xb12804ebc0c024ee
	.xword	0x91034c6832cd2cd1
	.xword	0x17fa0e8cfff7f6bf
	.xword	0x57a2abf5c54b2526
	.xword	0x93d7691c34b7cd15
	.xword	0xc5cdb2173e5ba282
	.xword	0xe2a35c54faff421a
	.xword	0xa20b57d7728d2790
	.xword	0xd3b1d906b37b9d12
	.xword	0x55de2485d63051fb
	.xword	0x0ed3caa9fa439aa4
	.xword	0x0b21c1fcc18a6f18
	.xword	0xecfc0e454f60e61a
	.xword	0x28989e77b03e2a49
	.xword	0x5d0fbf1d0535029b
	.xword	0x10d2116ba968b045
	.xword	0x5a9cf201613ba1d7
	.xword	0x59905cc49049b5cf
	.xword	0x6b456bcd1f1e7cc3
	.xword	0x091e332ac555200c
	.xword	0x6bf99c8230e03d28
	.xword	0xe4a33e3b27b8e9df
	.xword	0xe7800b62f3933b04
	.xword	0x0baf8f677ee87302
	.xword	0xa1798fc7eac58b08
	.xword	0x6dc75ee926067298
	.xword	0x3d41d09650fcfc22
	.xword	0xf8554144abd93183
	.xword	0xd20a41e98d2c2db2
	.xword	0xd808d43a1b9e01c7
	.xword	0x23cfda9c76dc47e3
	.xword	0x5935b2c95cf8c48b
	.xword	0x7109eab3a0e016e6
	.xword	0x7b4a70b223c5bbbe
	.xword	0x399ec6246d30de19
	.xword	0x7021609fcd2fa14c
	.xword	0x1f7a410c03b00741
	.xword	0xe4759e07a491b93b
	.xword	0x2395074c99e4cf05
	.xword	0x9103b412a811f869
	.xword	0x691d9c9a5e2e7728
	.xword	0x50592f124fa14795
	.xword	0xb892383fd1bd72b4
	.xword	0xd0c3624ff26fa5a7
	.xword	0xdd10d7d72d3ac61a
	.xword	0x5e64295340a3fe59
	.xword	0xd80ec40dc67e7c98
	.xword	0x2bf21b25e332ed19
	.xword	0x24a68da6ac7c2a9b
	.xword	0xd45e81431c2a80a0
	.xword	0xb5ced34862a8155b
	.xword	0x4fb9c08bd4383770
	.xword	0xc6d3b5e033f5c2ff
	.xword	0x957cf82ec367b9a2
	.xword	0xe0c19055c00967d4
	.xword	0x99d695961ed22d21
	.xword	0x74e537aea4af45e4
	.xword	0xd82a50b6c56ee6ad
	.xword	0x33fa6896283c0664
	.xword	0x3abf2f90a542128e
	.xword	0xbbac7de5ec6d69f0
	.xword	0x964e10c245a28a28
	.xword	0x7c492244fcc87602
	.xword	0xb15874d62c6bbfbf
	.xword	0x97bde10a1fbdf892
	.xword	0x997ec834901b2e2c
	.xword	0xcd20c52b464cd56e
	.xword	0x226afc50a8ab0152
	.xword	0x6c7b1574ece1c7fd
	.xword	0x1004e5da2d96c5a0
	.xword	0xaa0bc610ff96ec10
	.xword	0x5f699923e89ca1a3
	.xword	0xaff9528657350b98
	.xword	0x74bfc5fd3876af7a
	.xword	0x998cbc996ae3e0c1
	.xword	0xfce093606ce5e437
	.xword	0xaf0c07c11ed65675
	.xword	0x42b00201209db164
	.xword	0xa2607c0fb47dc0fc
	.xword	0xc38e79d24c5fda8b
	.xword	0x5ec4cb051a44104c
	.xword	0x1399b53c6ecd2629
	.xword	0xc37ad7feb8f6cf43
	.xword	0x2a66ae90d3559441
	.xword	0xb66e3b8b2809267a
	.xword	0x8ac00f2b70213c41
	.xword	0x6d2bf079158ee50b
	.xword	0xbcd7c66525b34421
	.xword	0xb3f31634e078d41a
	.xword	0x105e4b0610e296d8
	.xword	0x39afdd4e517b40a3
	.xword	0x2b7c23b5b1940e78
	.xword	0x983bcc260bfeca0a
	.xword	0x64318e1d8d5b853e
	.xword	0xb7673720674803a6
	.xword	0x00d253d432e0c7c3
	.xword	0x39ad3b0ff8a85e03
	.xword	0x8436887178baaf47
	.xword	0x27379607feca5af5
	.xword	0xf40fe14162d450f7
	.xword	0x67c4d06f39b6791e
	.xword	0x4cf44f6abccdef1a
	.xword	0xb70b0b308cbef542
	.xword	0x1e4904cb1f33b57b
	.xword	0x5c73900b6f99fc10
	.xword	0xe0b2ae2500e4925a
	.xword	0x22f6c93d4b4e0176
	.xword	0xa0286c1217538ee0
	.xword	0xbbd2c0644abfa118
	.xword	0x2e65bbbdb3539262
	.xword	0xcb364c18987b1a6e
	.xword	0xdf3805726a7a5ac9
	.xword	0x1e57044bf4424c99
	.xword	0xdda5e8a3eec3c0d2
	.xword	0xbeffad9818eed8e1
	.xword	0x8d08e44b8e8b3954
	.xword	0xeaad1f37b3ab22e3
	.xword	0x776a4171e5fa1d90
	.xword	0xe439f742967c67fe
	.xword	0x0445be805db1762c
	.xword	0x87e05cf9bc9a79f9
	.xword	0xc30afaa3408d2194
	.xword	0x54a3020e89196a0e
	.xword	0xf2e9cc1cef8a0ecd
	.xword	0x70e3d828a3039ffe
	.xword	0x7398ec2bfc4cb587
	.xword	0xd58a2371eb5eb994
	.xword	0x779806aafacddd3c
	.xword	0x7fb6751cf2cd3c5c
	.xword	0xd49181bbed7c9909
	.xword	0x31dd89fe35b53372
	.xword	0x3eb84f571beb00d4
	.xword	0x6b5efbe30ff56eb4
	.xword	0xae7de1ba488e6f4c
	.xword	0x9b1ba0c9a6e4fe6c
	.xword	0xdd8e7f53b48c1da9
	.xword	0x54852927c3773c4b
	.xword	0x3c728da955368ec4
	.xword	0x3b777c0749f5df64
	.xword	0x8aa2573b8d3446ef
	.xword	0x5cbf70fd725340e5
	.xword	0x9710468865ff0e4a
	.xword	0xcc952c1d3c0126f0
	.xword	0x539655e770436671
	.xword	0x1d925758d87e86a2
	.xword	0x72352d43125c33a3
	.xword	0xb8af56ad2fae577a
	.xword	0x2746082478ebb499
	.xword	0x7dcd5cc892edbbd2
	.xword	0xd412895f930bc313
	.xword	0xbefbdc33cc4a4feb
	.xword	0x58be62525b712865
	.xword	0xe089cb616f8672fa
	.xword	0x18ebc594fcecb688
	.xword	0x3cb4f90306f332bd
	.xword	0xbb5e2ef6dedcba4f
	.xword	0xfff4e7ddd79692f3
	.xword	0xc792d293f96175f9
	.xword	0x5add88e335a2c1b5
	.xword	0x15af68c25eba390c
	.xword	0x4d7a1d4cbe0c50fb
	.xword	0xcb852325b9415d6d
	.xword	0x683df82d4311bd6a
	.xword	0x98a1719a46b0b670
	.xword	0x2eeff80016cb2959
	.xword	0x328fe3f66cc39097
	.xword	0x0934c2d466a9f7cd
	.xword	0x058eb76402badfc8
	.xword	0x0d13d7492914a1c7
	.xword	0x9150b0540a118982
	.xword	0x10678d7a822d2bfa
	.xword	0x9bb69935b31be9d9
	.xword	0x7e8543bb55840e3e
	.xword	0x2c0e1a5a3fe1a418
	.xword	0x1385b5e4211da08a
	.xword	0x7df742c6cc1ca4ab
	.xword	0x163d606faddbafeb
	.xword	0xf8606926c03451f6
	.xword	0xe2a7a30a2a1b681d
	.xword	0xb8f79cbbf70d2384
	.xword	0x4b93facc554670b6
	.xword	0xd9ff62c9efebdcdb
	.xword	0x0b954b9a39107ae7
	.xword	0xb365efa6ab3ca250
	.xword	0x5b9f9a01e0712079
	.xword	0x24d6103ef466eedb
	.xword	0x68c3855a991168d3
	.xword	0x12e16949a61533c3
	.xword	0xbbf234ae3fb6a05b
	.xword	0xffc625e13d04be7c
	.xword	0xb48ff8d1ecc3824f
	.xword	0xa15a01ec27998c67
	.xword	0x5cea4870bb8fff0a
	.xword	0x6a5230dea161b630
	.xword	0xe8845d088e0bfa04
	.xword	0xdcde92d498057b73
	.xword	0x0b398649a04174e2
	.xword	0xe6eb61dcc3a14a6f
	.xword	0xfd347ec1b3cfdd03
	.xword	0x33cca73ba6ea40b4
	.xword	0xf5ee05533ff8895d
	.xword	0x7b593a2c93c8f11c
	.xword	0x555bff42daeef3d6
	.xword	0x9788293b064269f5
	.xword	0x7541f25a1b4506dd
	.xword	0xbb4e03e6e811614a
	.xword	0x2ad65172ddb19b9a
	.xword	0x72caec17f9617e41
	.xword	0xac2c6923df02ce52
	.align 0x40000
	.data
data_start_6:

	.xword	0x556008158992f682
	.xword	0x251e1844a818d30f
	.xword	0x6a617c235356e628
	.xword	0xef63d26ecffe8b5b
	.xword	0x55da22493e8b8ffd
	.xword	0x937291c879169e11
	.xword	0xfb40fb32a6216a42
	.xword	0x71fbf79e12ee6db3
	.xword	0xba37faf757fbd179
	.xword	0x4fd2f8e849753ee4
	.xword	0x545fedd7651c28f8
	.xword	0xa1d12fc7eb9343db
	.xword	0x29b1998311089452
	.xword	0x9d371f820ce5bc56
	.xword	0x7a5a0c30a6ff5cb0
	.xword	0xb53544e0a565dc32
	.xword	0x2fe48620aeb94585
	.xword	0x04940959febf81eb
	.xword	0xdb4cc1a0a2440483
	.xword	0x7d032f3cacaeff2e
	.xword	0x08bdfd21bd90dc15
	.xword	0x9751d5ef09bcf2bb
	.xword	0xa2e410656b7ffc4e
	.xword	0x06b5d98cc2b894d5
	.xword	0x1c89f8abd1b3ad86
	.xword	0xf700f000b7736480
	.xword	0x424f47f1a46bd73b
	.xword	0x79a4e3effa9d5758
	.xword	0x13f26d4f7bcb54f4
	.xword	0xe7a8ad9aad904259
	.xword	0x3aba5adb6fa69214
	.xword	0xcd0852e8e61dec98
	.xword	0x8fcf7e49e2a946da
	.xword	0x978ddcd83b97bf3e
	.xword	0xa5cc1775a0cc1287
	.xword	0x4a9f3964966dc400
	.xword	0xd82fde0062804da5
	.xword	0x10c1fbc7a38e9493
	.xword	0x9736d8f71cb4de0c
	.xword	0x84360ddab71b4767
	.xword	0x3ccb1eb52a6a19c7
	.xword	0x5219aa9848249871
	.xword	0xa7a4abe1fae8d9d4
	.xword	0x640136b551f9833e
	.xword	0xbecd7b6f2f0605cf
	.xword	0xa102cf3821300248
	.xword	0x9a9e7868a441a307
	.xword	0x9d51a5e78fb54d9e
	.xword	0xa68f1d785fcee305
	.xword	0xf9394f42c0053937
	.xword	0x2893c3732e125dcb
	.xword	0x38529d231bd19de9
	.xword	0x6b3a4a0904f4a6bb
	.xword	0x465042c56822b21d
	.xword	0x8fecc7db2a411e48
	.xword	0xe59ab440fb240d98
	.xword	0xcfbdd91ab3349828
	.xword	0x001fe5856ae51dd9
	.xword	0x2c42456a2cc03920
	.xword	0xbc51fadbea260db0
	.xword	0x192ebba7e32d8779
	.xword	0x73c98e8bd443eb00
	.xword	0xa473e960847145f7
	.xword	0xa7032b9a98366b4a
	.xword	0x27627971c8d5f901
	.xword	0x8eea0d7ceb3b1858
	.xword	0x665b8f699f69f6a1
	.xword	0xb60f1f11b416b373
	.xword	0xd0891747e9e2bba5
	.xword	0xe1c65ee225e19e7b
	.xword	0x927e06c8fb7bf0ba
	.xword	0x1efad4d8cd018cfc
	.xword	0xe01d02091a341d20
	.xword	0x54a1a8d325601dc2
	.xword	0xa239d222831796f5
	.xword	0x434fedec9eeeb088
	.xword	0x8b1920cccaaf89ae
	.xword	0x1b8c438e6dc3b852
	.xword	0xb31832b377c906d2
	.xword	0x9025c0b14493986f
	.xword	0x51f460061ca389e0
	.xword	0xf0f66c4540f6efc2
	.xword	0x60658633712a0e28
	.xword	0xa569f4140dbe31c2
	.xword	0xa98efd4d968fcd11
	.xword	0x8fa8d1189da5cc6b
	.xword	0xb8d41a0dde51e5bb
	.xword	0x2ffc9f3883b28358
	.xword	0xcabe7963384f92a4
	.xword	0x5f58c70e8d110581
	.xword	0xb2054a97a4845832
	.xword	0x9e92e207c6b518ac
	.xword	0xd46da83de1969c66
	.xword	0x22f3059a4ba34c92
	.xword	0x2f0a8929ef0d432c
	.xword	0x567c7e69073eb085
	.xword	0x4b7117cf0f857ab6
	.xword	0xd9c1a4b4a486792b
	.xword	0x17b3da95824e73db
	.xword	0x26e07658aa5c2d58
	.xword	0x4ac09d289bda86ea
	.xword	0xe3fbe78d9d084c5f
	.xword	0x65f11d2f697b1990
	.xword	0x411e5754acf86853
	.xword	0x7fd70fb2224c9826
	.xword	0xe26e45680f64f420
	.xword	0x4e251e6b40888a28
	.xword	0xf6f10fe477667bfc
	.xword	0x934b36809053848e
	.xword	0x10cd0f2bf182a3fc
	.xword	0xa7325a000b8dda53
	.xword	0xdb24598cee9ed41b
	.xword	0x1f6660356e2923b5
	.xword	0x9c5dc2450bd33168
	.xword	0x1db99b659d5851b1
	.xword	0xe8646dad8c4b7fba
	.xword	0x8d252a680750c05d
	.xword	0xb81959446778ca55
	.xword	0x7ca483feb6379429
	.xword	0x6f2e964256a2a901
	.xword	0x7dd26de5a7fe10f7
	.xword	0x3c5bfed58026ab19
	.xword	0x8b3b4461151d9ea8
	.xword	0x56b7327538fc7745
	.xword	0x1b1fb726df44f563
	.xword	0x0d54a41366785516
	.xword	0x3d61494c578c104e
	.xword	0xcc1f1bec6f9d1e5a
	.xword	0x26b23fe0c49c201c
	.xword	0xbcadfca6511a5e1c
	.xword	0xa5b5192ff71dcd3b
	.xword	0x4620c87bc870ccd4
	.xword	0xf92c4bf481d87d58
	.xword	0x7e103693931f3c61
	.xword	0x36bdad5a9affbeb3
	.xword	0xba6bf0f8bb0df0ef
	.xword	0xe5672a08e5c9e11f
	.xword	0x9c725ad2e0f24084
	.xword	0x04bbe05c7faf1ebd
	.xword	0x06bbebcc82a04b87
	.xword	0x147fb14f6386bd99
	.xword	0xf1fcdfd7eaaf56f2
	.xword	0x53b81ab3c12e2ece
	.xword	0xddd12878a61ea0b0
	.xword	0x4962ec35d3642b5d
	.xword	0x8c4a5b94d550dd89
	.xword	0x34c5289eb6d5755d
	.xword	0x6c5c8eced9311314
	.xword	0x908b130a2efc479e
	.xword	0xd35fa01d0d7d4cbd
	.xword	0xea99174a5c4ec197
	.xword	0xbde9d36a0cc2f876
	.xword	0xacebcbd7965bba8d
	.xword	0x623510eecaf4d42e
	.xword	0x1798ce6411f737f9
	.xword	0x6ce803a3de638546
	.xword	0xd5dc32068d4db0b1
	.xword	0x1905e0147c52c2c8
	.xword	0xab3805aa7762a740
	.xword	0xd2e3b432259944d6
	.xword	0xed7722813cb10e08
	.xword	0x0823dc7c8eff1ed6
	.xword	0x8cf5640a84a20654
	.xword	0x4a629dc16427191d
	.xword	0x74ad2e5fce8ce8e1
	.xword	0x1c864a60273e2b5e
	.xword	0x419af5225860dafb
	.xword	0xb93ac132031b2b8a
	.xword	0xf2bc757ff77ace9a
	.xword	0x618b2499b3e9a008
	.xword	0xc6a7b5809f2d4613
	.xword	0xc2dad2418e303e0a
	.xword	0x460d8dcd1fea1251
	.xword	0x67072c3d9978736a
	.xword	0xa473da4fd35981f7
	.xword	0x69cbd39c2b9c044e
	.xword	0xf83fc258a207ee28
	.xword	0xa88c419a2f9bdb38
	.xword	0xbdf97559b2b05d76
	.xword	0x55d2869c38cf8885
	.xword	0x8b6e2dbd0d025c54
	.xword	0x2edf7d2541451292
	.xword	0xf1d6f46d2528b277
	.xword	0x45c3d92d37e704f7
	.xword	0x2107c5a49747f951
	.xword	0xa88ece4e0252e976
	.xword	0xee1f5da5f3a6754e
	.xword	0x7cad3ad58a3e3d4c
	.xword	0x8afabe35c77336a6
	.xword	0xe9110dca12bc8e7b
	.xword	0x4ff5baf9c2f0a220
	.xword	0xc5b1959de90c8b7e
	.xword	0xcec5bf7b32caa4ac
	.xword	0x9540c13ce241a4b0
	.xword	0x767cad5ee23480be
	.xword	0x7f2d4c9851894da2
	.xword	0xef555725ffbc428f
	.xword	0xe5f48c9200a74d64
	.xword	0x9eab433d8ac3fbad
	.xword	0x61d470e3baf30b3f
	.xword	0x6e3613f27e092afb
	.xword	0x3867218b096cbfbb
	.xword	0x15bf0c5a4d435779
	.xword	0xcb675fe4a3d5117d
	.xword	0x32b7e482dde763b2
	.xword	0xc078d3ea7f953f51
	.xword	0x08abf441f5e7dc4e
	.xword	0xc6073ff1cd3ac5b9
	.xword	0xdef7786f51972c5f
	.xword	0xc029a9752a252382
	.xword	0x9e24b0fd16a2e45c
	.xword	0x456838234f82997c
	.xword	0x2e09299cfacc41d6
	.xword	0xa66c82eafa42d73c
	.xword	0xdfefd3e19c6a80bb
	.xword	0x192c5852ccaa20aa
	.xword	0xf6c4b65e698a660f
	.xword	0x6c1b290f4478dc9f
	.xword	0xcd1ef83ca14a3263
	.xword	0xa25bad3bd4fcee14
	.xword	0x35966cbc2e538339
	.xword	0xf2b6296b499b6beb
	.xword	0x77e7adf046267a30
	.xword	0x56fa9a9120ee1106
	.xword	0x3d7c71d5c96fd9ab
	.xword	0x988ed4f918fb0a9d
	.xword	0x73c7f87395a1258d
	.xword	0x5333cb46d187749f
	.xword	0xe9a092e5b95ec5e7
	.xword	0x4d7afdd302a2e2b8
	.xword	0xdc4ffa41675ab27e
	.xword	0xff62b8d4795438f9
	.xword	0x68492c20452b6d23
	.xword	0xf733f3248cc6d8be
	.xword	0x3111b9fe612c5b67
	.xword	0x175321bb57c57682
	.xword	0x3503e5b7f20400ce
	.xword	0x8665259ef2d85140
	.xword	0x56b007da4211f66c
	.xword	0xd33c7bd1a2b4dff6
	.xword	0x033a3ed917277d92
	.xword	0xf69a4f91961252a0
	.xword	0xec5dd7a3fa3b1b46
	.xword	0x2452ade8a503c94e
	.xword	0xb14f2e041b1ce8ff
	.xword	0xed125e163f9f76b7
	.xword	0x727fd28f9e982304
	.xword	0xc6e5cbcb40aae9e9
	.xword	0xe66683023c09757a
	.xword	0x10a836595d573bfa
	.xword	0x0478c906de7062e6
	.xword	0xe8962c9725349e22
	.xword	0xeef6001bf4f7ad93
	.xword	0x90d355282f496087
	.xword	0x445c8bec7a176cb0
	.xword	0x1ad8a3eab391006b
	.align 0x80000
	.data
data_start_7:

	.xword	0x77c0a443f35292bc
	.xword	0xa0f89b0705632899
	.xword	0x3075cfd397214987
	.xword	0x31b029a3082994a3
	.xword	0xcd96650699df60af
	.xword	0xd6a71bad8efe02b2
	.xword	0x52796b67f29dff3e
	.xword	0xb0c8ee1701a7cbb6
	.xword	0xc0aa3217ec1ffcd8
	.xword	0xe9bef321d8df95ee
	.xword	0xf2617156edd76782
	.xword	0x228c2224819f923c
	.xword	0xfc3dc0a8ffaad224
	.xword	0xa8b097e704c93da6
	.xword	0x381c2c3e54482fbb
	.xword	0xe252bc0b0a3b7b56
	.xword	0x8a66d649ddf71afa
	.xword	0x76e9e95b6e9b314c
	.xword	0xa507c02b5ba4daca
	.xword	0xed4b76674fa31f56
	.xword	0xb5cd6c444921f12d
	.xword	0x38e79caf16aeddb0
	.xword	0xf5c3e65a0fd1e6a4
	.xword	0xda6cf42e01f4ec26
	.xword	0xd2be87ffa00e47fd
	.xword	0xcf4f9ebc1f2c5ee9
	.xword	0xa31edbf6a8b6c374
	.xword	0x8f8ba23c1b5173fd
	.xword	0x261c20d2ef21090c
	.xword	0x878b1b0283f0f1f0
	.xword	0x076f3dcd03d513d3
	.xword	0xbbce55c86e270f3f
	.xword	0xc7eeb777b289eff8
	.xword	0xf619cc845bb04e06
	.xword	0xbc99ee6c38c6cf31
	.xword	0xd87787e481a4a675
	.xword	0x32c6aec1c8b0835e
	.xword	0xa206501f26b04aa5
	.xword	0x8398efffc580770b
	.xword	0xa7ddbac1598ddd95
	.xword	0x5f23154fdb01e3a0
	.xword	0x4699c38b8d02b3ad
	.xword	0xc8b514a4eeb0f874
	.xword	0x3cac9d28202da050
	.xword	0x6f7646a2a3bd7abf
	.xword	0xdc02ecf47889b448
	.xword	0x6ca573ced884c0d6
	.xword	0xa3afdc594e73b906
	.xword	0xe0b16d3dd3e859f2
	.xword	0x5ea3094f032bb088
	.xword	0xc49ff70815fe6804
	.xword	0xbd7eea9fa3605f73
	.xword	0x2ec98e944c11a9d3
	.xword	0xc224ae60901e0a34
	.xword	0x89ed3457186cd416
	.xword	0xeca1f6aed17a8a8f
	.xword	0xc1bf70103c1530f3
	.xword	0xffffcf64704abdc6
	.xword	0x4322166754b19699
	.xword	0x9cb61f87ab00d363
	.xword	0xd7b4e7b762b96614
	.xword	0x47f21b50fb38875d
	.xword	0xf01279eb0824fd84
	.xword	0xc15836420b20a116
	.xword	0x6701049a2d5bdae5
	.xword	0xea7702c53898ece9
	.xword	0x367f0bca33626dc2
	.xword	0x3d87390593f1c456
	.xword	0x6f44a81f1b2f02e7
	.xword	0x83b2ab502ed4907d
	.xword	0xbae57525021f117e
	.xword	0x327546f424118fb4
	.xword	0xc46389388daf1d0c
	.xword	0xce63295119f2ede6
	.xword	0x4917c6bf3087a103
	.xword	0xffc5e62fc634dd5a
	.xword	0xa81c039e662fc4e2
	.xword	0x6f5f844d8f285597
	.xword	0x04a68089cf9eb9f6
	.xword	0x9b4c9317d5ec8c60
	.xword	0x5c1cdcb6c248b4f9
	.xword	0x3b1cdb21e8d75208
	.xword	0xd185c53dd6a381ff
	.xword	0x338cc183feda2f4c
	.xword	0x964bbb8ce2c1ac1b
	.xword	0xf7b55ebe39db6001
	.xword	0xeac5b686040aab90
	.xword	0x81b27ba549ec990f
	.xword	0x91eb7589efff8507
	.xword	0x2903a342138c8b5f
	.xword	0x9dffc03519323a38
	.xword	0x7175e410847df518
	.xword	0x541d78b9837e6b3c
	.xword	0x2716b406945676da
	.xword	0x662643eeec653ffa
	.xword	0x77f497861a52050f
	.xword	0x37c61aa7fc76a447
	.xword	0x1de2712b5ef274f6
	.xword	0x0be67b49317a59ce
	.xword	0xd178642ff8e5f9ad
	.xword	0xf23d27cfcf1fd2d0
	.xword	0xade6535eede28775
	.xword	0x02ec4f9129c36d73
	.xword	0x65b8490db35b5271
	.xword	0xca0b8d7803692def
	.xword	0x6802eaa2a45a68fc
	.xword	0x98252bcd0c413655
	.xword	0x118a7023b3398060
	.xword	0x627538d5bfccc01f
	.xword	0x25a41217616873df
	.xword	0x46e6e66146272921
	.xword	0xfb9ecd5b3e5c4e0f
	.xword	0x5fbdae5d909f57c7
	.xword	0x0feb0b58cecbecbf
	.xword	0x3561a30ffab3c433
	.xword	0xd196ee0f7a86d81c
	.xword	0xf807dc11908a9669
	.xword	0x03d752f3058647ed
	.xword	0xcd48c99fb97d7cd7
	.xword	0x5f5ad1f340b388ba
	.xword	0x539d0d7c9e913003
	.xword	0x8e6dbebc5f577b63
	.xword	0xe36f7e38d1403aed
	.xword	0x66160e85cae96537
	.xword	0x9550d261e1ee64aa
	.xword	0xec6bf422a83793a8
	.xword	0x8e30fee3151558c7
	.xword	0x808e7140336b245c
	.xword	0x5a0ee31b8ca7a488
	.xword	0xb4bd4dbc2f3559f2
	.xword	0xc9cc747f1c465c78
	.xword	0xd6026b5ea88b11f7
	.xword	0xd431c65ea8231767
	.xword	0x23bf4e869de05c0f
	.xword	0x7b42b0a2cbd62d05
	.xword	0xd4ffb70cc93d46a5
	.xword	0x010783a5fc98cfd6
	.xword	0xad3b6220ad6a9668
	.xword	0x0c02fcd9840f3012
	.xword	0x792ddf7290475a89
	.xword	0x4b573d348bd08097
	.xword	0x321e0b4e7ca33a03
	.xword	0x8d86307350af2627
	.xword	0x3fd1384bf56199a6
	.xword	0x67edf4c404f7e7bb
	.xword	0xef8d049e6a0e60c8
	.xword	0xb470bfbbbc2e799e
	.xword	0x9717b7b44b521155
	.xword	0x37f55b705d165165
	.xword	0x20d2644e1e58f0d1
	.xword	0xcf484decf34b2155
	.xword	0xdbffc8355a460f0f
	.xword	0x07145ead2b1cd8d2
	.xword	0x7e5f595a950ca0fa
	.xword	0x32bc01f99971c44b
	.xword	0x752343cc9f7e569a
	.xword	0x02329664df5c810e
	.xword	0x1b84fa3287db3d7e
	.xword	0x62c066345ae672eb
	.xword	0xc96bde6f6113bee3
	.xword	0x0faaea2e18a0d7f8
	.xword	0x42770cef162c94f7
	.xword	0x6d0be5e1ae63261f
	.xword	0x5f77fbf5b86821b2
	.xword	0xa52e21392dc7fa59
	.xword	0x707f070499f8936b
	.xword	0x04072f990e94343f
	.xword	0xf07f3734b99942ff
	.xword	0xc1173b8f1800903d
	.xword	0x65076bca1d0ec5dc
	.xword	0xba2c392756d9f8fe
	.xword	0xdb3ad3b59390e0bf
	.xword	0xd14cd5a29b54de3d
	.xword	0xbda71655bbd0ac71
	.xword	0x99761b98922370f4
	.xword	0x23753953e12ace4d
	.xword	0x4d7a5ef8ce02823b
	.xword	0x42e40f8d053b9c36
	.xword	0x4a0276ee6738c75c
	.xword	0x5695dafd84db525f
	.xword	0x40e513781b30c42a
	.xword	0x76df4314d3bf8ff8
	.xword	0xd165fd46dbf44716
	.xword	0xc4eccaa6e85abd90
	.xword	0x2e83777309e0e6fd
	.xword	0x999055335c6408a0
	.xword	0x336c9384af646270
	.xword	0x54c91c6a3b4e3974
	.xword	0x34d859310b82e7c8
	.xword	0xfe1b0054262f2d26
	.xword	0x7c3e482fa0052d1d
	.xword	0xad6983949794febb
	.xword	0x4a11e2e8f1dcdaa2
	.xword	0xa310f0ac286ead4e
	.xword	0xe63f2ea4d35ae75b
	.xword	0x22f7530959d3a723
	.xword	0x05a4f18814e6da70
	.xword	0xfa3204f73d9cb044
	.xword	0xa247c4d658d9d727
	.xword	0xb499d53706dedde2
	.xword	0xf3205208655a65b3
	.xword	0x5462880b6ba343f6
	.xword	0x369fb2f802fe82de
	.xword	0xf7acacb91aaa1405
	.xword	0x381eaa73a66444f5
	.xword	0x01b8fc4871134a78
	.xword	0x375e33dd6b9b7ac9
	.xword	0x213f61e12f736c31
	.xword	0x02bcce9ceb51e008
	.xword	0x55636c4408363146
	.xword	0x3339446b87238b48
	.xword	0x6a077898d5437554
	.xword	0x9344f983408d5c29
	.xword	0x62b0debf71524938
	.xword	0xde4d09138651dd85
	.xword	0x153df27cfea988f7
	.xword	0xbd7b805ccadfe3d5
	.xword	0x6c874f0b45a4bb28
	.xword	0x7dff1c982f4bfa89
	.xword	0x7f3855bebede513e
	.xword	0x1e43dd961f291b25
	.xword	0x2838ff455a12bd47
	.xword	0xd2ef8570a1d40728
	.xword	0x80882603daf6c785
	.xword	0x3ac58ed6464fc303
	.xword	0xb4375d20555d3032
	.xword	0x527f16a853e464f1
	.xword	0x7d1d7bde6ca8b959
	.xword	0xcc1e6b2d5c303e1c
	.xword	0x1433607cbf31aac6
	.xword	0x0e7b3e64401d437b
	.xword	0x3c2c6cd9a442cdc6
	.xword	0x5530eaeb9c66d3ea
	.xword	0xf0270fdb71e28333
	.xword	0xebef773a9de8d62f
	.xword	0x745facaf881ff44c
	.xword	0xf3b67341e62a3bbd
	.xword	0x0c8f18e8eb72fd15
	.xword	0x733ad71f98ba40f4
	.xword	0xc7da80b84f9c7ca1
	.xword	0xd8b90885f51ec33d
	.xword	0xdad7161233d75852
	.xword	0xbb18781a647a2332
	.xword	0x885274165cf16932
	.xword	0x47af05df6c21e537
	.xword	0xc44bca7dc515f298
	.xword	0x481a4d5de514c95e
	.xword	0xc891509c83a3072c
	.xword	0x3c0e421b56f133d7
	.xword	0x42c4c45d7b1307ae
	.xword	0x3b4cb7950cb3e5a4
	.xword	0x2283ddd8886d5cd4
	.xword	0xd08c48c0a8154c9f
	.xword	0xbe4a82ef84a4eb99
	.xword	0x9b4208d4567b437d
	.xword	0x0d7148991a22a42d



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
