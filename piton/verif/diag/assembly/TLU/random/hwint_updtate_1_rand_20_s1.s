// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_20_s1.s
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
   random seed:	574150844
   Jal hwint_updtate_1.j:	
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

	setx 0x3ee2e924c251008d, %g1, %g0
	setx 0x05f82246395edb93, %g1, %g1
	setx 0xc6da7854180b6e49, %g1, %g2
	setx 0xffb3ef7341820982, %g1, %g3
	setx 0x3869d30fe8bf46bb, %g1, %g4
	setx 0x57943b04f271dd8a, %g1, %g5
	setx 0xa521d6b8e5dfe779, %g1, %g6
	setx 0xbd1d72b436bbe2c8, %g1, %g7
	setx 0x786efa5c70bdcd2e, %g1, %r16
	setx 0x2b44bf53bc4cea55, %g1, %r17
	setx 0x390c507ecf8396ee, %g1, %r18
	setx 0xc029c72961631305, %g1, %r19
	setx 0x5c82f867880f51cb, %g1, %r20
	setx 0xc2d50632334bee65, %g1, %r21
	setx 0x94b8e096a8534888, %g1, %r22
	setx 0x313f3cf3a5f1cd81, %g1, %r23
	setx 0x5f3fbbb5746b32d4, %g1, %r24
	setx 0xf7acb108fe1dbc83, %g1, %r25
	setx 0xc52ca9a28f3bad0e, %g1, %r26
	setx 0x59d3b247c7200e24, %g1, %r27
	setx 0xef22f3421fe7bc77, %g1, %r28
	setx 0x203235092156ff32, %g1, %r29
	setx 0xc953e29f8d37eb84, %g1, %r30
	setx 0x8769a3c55c8992ef, %g1, %r31
	save
	setx 0x2048f72afc8f6bd3, %g1, %r16
	setx 0x8871f9cd024a50a8, %g1, %r17
	setx 0x0882f40c1670fca9, %g1, %r18
	setx 0x3650e9fe95d2bbcc, %g1, %r19
	setx 0x0c90a4db55d65141, %g1, %r20
	setx 0xcb3dba903529a24e, %g1, %r21
	setx 0xc30bf020b45d0d43, %g1, %r22
	setx 0xe8c1af4faaf197aa, %g1, %r23
	setx 0x385c24ee074933a5, %g1, %r24
	setx 0x140d18b12adc471a, %g1, %r25
	setx 0x186b1637450408b5, %g1, %r26
	setx 0xebb847dd9e3857a4, %g1, %r27
	setx 0x53aee6731c6fda64, %g1, %r28
	setx 0x2bb1a63de36993eb, %g1, %r29
	setx 0x55630c903f095f13, %g1, %r30
	setx 0x22844fd54343c4bb, %g1, %r31
	save
	setx 0xca6986e806c40cad, %g1, %r16
	setx 0xff39c50a20469b30, %g1, %r17
	setx 0x19ca7336744daf20, %g1, %r18
	setx 0x5897f9f3d8024576, %g1, %r19
	setx 0xf80d3a054ae58209, %g1, %r20
	setx 0xfa04faadacaf855c, %g1, %r21
	setx 0x6c606b21befa3f01, %g1, %r22
	setx 0xb6d81122eb74f950, %g1, %r23
	setx 0xa9609b2d875743a1, %g1, %r24
	setx 0x76dc3cd806ac49cc, %g1, %r25
	setx 0x4ab041264eaa3398, %g1, %r26
	setx 0x7926ce97b46a99ae, %g1, %r27
	setx 0xe3ffcfe20ab42e40, %g1, %r28
	setx 0x698d8e8a61b53a71, %g1, %r29
	setx 0x6ee7b7af6fc0a477, %g1, %r30
	setx 0x5e6d6379486cc312, %g1, %r31
	save
	setx 0xe67e10cf7394552f, %g1, %r16
	setx 0x89ab31099be01291, %g1, %r17
	setx 0x47e4adf1cfc677b8, %g1, %r18
	setx 0x3ed922d30c0a9a2c, %g1, %r19
	setx 0xd8f2cd0951d8af23, %g1, %r20
	setx 0xe04ee1fc5a793f7b, %g1, %r21
	setx 0x83537f7bc79680bc, %g1, %r22
	setx 0x7ff057631ddc88be, %g1, %r23
	setx 0x1b406a895cd52e50, %g1, %r24
	setx 0x5bd44042c8af9653, %g1, %r25
	setx 0xb19469e210d6a1d1, %g1, %r26
	setx 0x3890d910daba23b4, %g1, %r27
	setx 0x66d9ad55c50e9ad5, %g1, %r28
	setx 0x425188526a9449be, %g1, %r29
	setx 0xd08ffdc0c6f0ebab, %g1, %r30
	setx 0xb5b8f13dae918fe5, %g1, %r31
	save
	setx 0x8a66cc251fab92c0, %g1, %r16
	setx 0x5fdc32e5629b2523, %g1, %r17
	setx 0x6eaa491ad5e39a28, %g1, %r18
	setx 0x3d56b740a8cec803, %g1, %r19
	setx 0xa15644b576acc17f, %g1, %r20
	setx 0x97c76e78c3fe1d19, %g1, %r21
	setx 0x91c79a78f142d3f2, %g1, %r22
	setx 0xa18f12bc7321eed8, %g1, %r23
	setx 0x60e077089a10f3c7, %g1, %r24
	setx 0x237671b42cf135da, %g1, %r25
	setx 0x5cdacdd8e209ea3d, %g1, %r26
	setx 0xd9b9b8cc42a1ee3c, %g1, %r27
	setx 0x2766435a86f0472e, %g1, %r28
	setx 0x67af33aa415d8cab, %g1, %r29
	setx 0x846649bca81cc486, %g1, %r30
	setx 0x0807d83fe3b88014, %g1, %r31
	save
	setx 0x4af425a6bf834fe2, %g1, %r16
	setx 0x1d5a452aa23c7a9a, %g1, %r17
	setx 0x362013649ba7724e, %g1, %r18
	setx 0x8be20c66dcaae188, %g1, %r19
	setx 0xfd91a66db3264256, %g1, %r20
	setx 0xf837f900e3e6934a, %g1, %r21
	setx 0x571e09c2129796a0, %g1, %r22
	setx 0x4de7fe9407d952df, %g1, %r23
	setx 0x99c7d353ee413749, %g1, %r24
	setx 0x7b5eea2e9277481a, %g1, %r25
	setx 0xa76efaeea8f52168, %g1, %r26
	setx 0x188df9a047722aaa, %g1, %r27
	setx 0xbea6174b9d9b5eab, %g1, %r28
	setx 0x1bffde915f6d7c46, %g1, %r29
	setx 0x91ddc97da7cf5b8c, %g1, %r30
	setx 0x3d81a58631e557c1, %g1, %r31
	save
	setx 0x7f7167733a417bbc, %g1, %r16
	setx 0x9f9a99267afcf8f5, %g1, %r17
	setx 0xa5f8101e79c7840a, %g1, %r18
	setx 0x703e79af2bc5b029, %g1, %r19
	setx 0xe7404e8985f4845d, %g1, %r20
	setx 0xbf1a0000d5750522, %g1, %r21
	setx 0x2319461af985e143, %g1, %r22
	setx 0x9ee279ad2ef69055, %g1, %r23
	setx 0x15829a8a3d75b7ea, %g1, %r24
	setx 0xc04f8b6722af5e71, %g1, %r25
	setx 0x63cdca646719878e, %g1, %r26
	setx 0xa3ccabbbccf8b97f, %g1, %r27
	setx 0xf2b2d4fa2e636016, %g1, %r28
	setx 0x245ef558ce9c7654, %g1, %r29
	setx 0x5d9ce3d4da1806f1, %g1, %r30
	setx 0x2ab97e532d98592c, %g1, %r31
	save
	setx 0x809f4f2d3c2e5139, %g1, %r16
	setx 0x3696058ff81b008e, %g1, %r17
	setx 0x7d3c44243c6578fa, %g1, %r18
	setx 0x5fbe051e48392c30, %g1, %r19
	setx 0xc8c75e36f0198c5b, %g1, %r20
	setx 0x0a84380fc6826634, %g1, %r21
	setx 0xff0c751e76680abf, %g1, %r22
	setx 0x0a07cc0b88c5706a, %g1, %r23
	setx 0x41d0894fca8d8b95, %g1, %r24
	setx 0x9fe83ebada010f54, %g1, %r25
	setx 0x2d69b4b880368fb6, %g1, %r26
	setx 0x14d695b0360d61bc, %g1, %r27
	setx 0x5550f9288b744022, %g1, %r28
	setx 0x973f589f16dcef4c, %g1, %r29
	setx 0x455d60d8570af3a9, %g1, %r30
	setx 0xf754c812d9d6047f, %g1, %r31
	ta	T_CHANGE_HPRIV
	wrpr	%g0, 0, %pil
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
	setx	%hi(0x1ffe0000f), %g1, %g2
	stxa	%g2, [%g0] 0x45
	mov	0x38, %g3
	setx	data_start_0, %g1, %g2
	stxa	%g2, [%g3] 0x58
Init_scratchpad:
	wr	%g0, 0x4f, %asi
	stxa	%l0, [0x0] %asi
	stxa	%l1, [0x8] %asi
	stxa	%l2, [0x10] %asi
	stxa	%l3, [0x18] %asi
	stxa	%l4, [0x20] %asi
	stxa	%l5, [0x28] %asi
	stxa	%l6, [0x30] %asi
	stxa	%l7, [0x38] %asi
	ta	T_CHANGE_NONHPRIV
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
	.word 0xb7e5a097  ! 2: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_0:
	setx	0x180120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 8: SAVE_R	save	%r21, %r0, %r28
	.word 0xbfe4c000  ! 9: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_rd_0:
	mov	0x8, %r14
	.word 0xf8db8e60  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_0_1:
	setx	0x1d0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88c8000  ! 12: ANDcc_R	andcc 	%r18, %r0, %r28
T0_asi_reg_wr_0:
	mov	0x22, %r14
	.word 0xfcf384a0  ! 14: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_1:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 15: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_rd_1:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 18: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbde4e0a0  ! 21: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbac5a16b  ! 25: ADDCcc_I	addccc 	%r22, 0x016b, %r29
	.word 0xb5e56106  ! 27: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_2:
	setx	0x1d030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e44000  ! 31: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_3:
	setx	0x1f003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a0b7  ! 34: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_2:
	mov	0x2f, %r14
	.word 0xfef38e80  ! 41: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbfe50000  ! 48: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_4:
	setx	0x1c002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_5:
	setx	0x1c001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_3:
	mov	0x2f, %r14
	.word 0xfcf38e40  ! 59: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_2:
	mov	0x23, %r14
	.word 0xf4db8e40  ! 62: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xba3ca16a  ! 63: XNOR_I	xnor 	%r18, 0x016a, %r29
	.word 0xbfe48000  ! 71: SAVE_R	save	%r18, %r0, %r31
	.word 0xbde42100  ! 75: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_6:
	setx	0x1c0020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_7:
	setx	0x1c0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 88: SAVE_R	save	%r23, %r0, %r29
	.word 0xbb354000  ! 91: SRL_R	srl 	%r21, %r0, %r29
	.word 0xbbe5e0ef  ! 92: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e44000  ! 93: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_4:
	mov	0x34, %r14
	.word 0xf2f38400  ! 94: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb3e4e09f  ! 96: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_8:
	setx	0x1c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_3:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 101: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_0_9:
	setx	0x1d0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92cb001  ! 106: SLLX_I	sllx	%r18, 0x0001, %r28
	.word 0xbfe4c000  ! 107: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 6)
	.word 0xbebc4000  ! 115: XNORcc_R	xnorcc 	%r17, %r0, %r31
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 38)
	.word 0xbfe4a060  ! 123: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_rd_4:
	mov	0x28, %r14
	.word 0xfedb8e40  ! 130: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, e)
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb7e4211b  ! 139: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_10:
	setx	0x1f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 151: SAVE_R	save	%r19, %r0, %r26
	.word 0xbfe5e158  ! 154: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, d)
	.word 0xb1e4a01d  ! 159: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 27)
	.word 0xb8b4e1ec  ! 166: ORNcc_I	orncc 	%r19, 0x01ec, %r28
cpu_intr_0_11:
	setx	0x1c021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_5:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 171: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 26)
	.word 0xbde54000  ! 175: SAVE_R	save	%r21, %r0, %r30
	.word 0xbbe5c000  ! 176: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_12:
	setx	0x1f000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a0ec  ! 180: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_13:
	setx	0x1c0223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 15)
	.word 0xb3e48000  ! 187: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 3)
	.word 0xbbe44000  ! 190: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_14:
	setx	0x1e0326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_15:
	setx	0x1d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_16:
	setx	0x1d0317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 24)
	.word 0xb0b420a7  ! 200: ORNcc_I	orncc 	%r16, 0x00a7, %r24
	.word 0xbde4e008  ! 202: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e40000  ! 206: SAVE_R	save	%r16, %r0, %r26
	.word 0xb7e4e007  ! 207: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_17:
	setx	0x1c0010, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_6:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 211: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_18:
	setx	0x1c0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe420f2  ! 216: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_7:
	mov	0x6, %r14
	.word 0xfcf38e80  ! 217: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbfe48000  ! 220: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_19:
	setx	0x1c0326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_8:
	mov	0x34, %r14
	.word 0xfcf389e0  ! 228: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_20:
	setx	0x1e0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5611a  ! 231: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e56140  ! 233: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 38)
	.word 0xbfe4219b  ! 238: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe4a1ac  ! 240: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e48000  ! 241: SAVE_R	save	%r18, %r0, %r26
	.word 0xbe440000  ! 242: ADDC_R	addc 	%r16, %r0, %r31
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 16)
	.word 0xbbe54000  ! 249: SAVE_R	save	%r21, %r0, %r29
	.word 0xbb50c000  ! 257: RDPR_TT	<illegal instruction>
	.word 0xb1e44000  ! 258: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_wr_9:
	mov	0x38, %r14
	.word 0xf2f384a0  ! 259: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb7e5a193  ! 260: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb53cf001  ! 262: SRAX_I	srax	%r19, 0x0001, %r26
T0_asi_reg_wr_10:
	mov	0x3c6, %r14
	.word 0xf4f38e60  ! 264: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb5e48000  ! 265: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_rd_5:
	mov	0x7, %r14
	.word 0xfcdb8400  ! 268: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb1e5e122  ! 274: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb43c20f0  ! 276: XNOR_I	xnor 	%r16, 0x00f0, %r26
	.word 0xb3e4a070  ! 281: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe560b6  ! 282: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde5c000  ! 283: SAVE_R	save	%r23, %r0, %r30
	.word 0xb5e40000  ! 284: SAVE_R	save	%r16, %r0, %r26
	.word 0xb3e5e164  ! 286: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_6:
	mov	0x12, %r14
	.word 0xf4db89e0  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_21:
	setx	0x1c0110, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_7:
	mov	0x36, %r14
	.word 0xf6db8400  ! 291: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_22:
	setx	0x1c0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe42081  ! 295: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_11:
	mov	0x28, %r14
	.word 0xf4f38e40  ! 297: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde54000  ! 300: SAVE_R	save	%r21, %r0, %r30
	.word 0xb7e4e08a  ! 302: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e54000  ! 306: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb5e48000  ! 311: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_23:
	setx	0x1f0236, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_12:
	mov	0x1b, %r14
	.word 0xf8f38e60  ! 316: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T0_asi_reg_wr_13:
	mov	0x14, %r14
	.word 0xf8f38e40  ! 320: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb3e52113  ! 323: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_14:
	mov	0x3c6, %r14
	.word 0xf8f38e60  ! 324: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T0_asi_reg_wr_15:
	mov	0x3c5, %r14
	.word 0xf8f38400  ! 325: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_wr_16:
	mov	0x15, %r14
	.word 0xfef38400  ! 326: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_wr_17:
	mov	0x8, %r14
	.word 0xf0f38e80  ! 327: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_8:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 329: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbde4c000  ! 330: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_18:
	mov	0x1f, %r14
	.word 0xf2f38e80  ! 333: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbbe4c000  ! 336: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_24:
	setx	0x1e0036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_25:
	setx	0x1f013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5217a  ! 343: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_9:
	mov	0x3, %r14
	.word 0xfadb8400  ! 344: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb2b40000  ! 345: SUBCcc_R	orncc 	%r16, %r0, %r25
	.word 0xbde4c000  ! 346: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_26:
	setx	0x1e0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e50000  ! 351: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_wr_19:
	mov	0x3c4, %r14
	.word 0xf8f384a0  ! 354: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbbe421ad  ! 358: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e40000  ! 363: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_27:
	setx	0x1e021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_28:
	setx	0x1f0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_29:
	setx	0x1d0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a116  ! 369: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_30:
	setx	0x1d0026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_31:
	setx	0x1f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_10:
	mov	0x7, %r14
	.word 0xf6db8400  ! 373: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_rd_11:
	mov	0x2f, %r14
	.word 0xf8db89e0  ! 376: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_wr_20:
	mov	0x15, %r14
	.word 0xf4f389e0  ! 377: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb1e42146  ! 379: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe44000  ! 380: SAVE_R	save	%r17, %r0, %r31
	.word 0xb82ca025  ! 383: ANDN_I	andn 	%r18, 0x0025, %r28
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbbe4e0d8  ! 389: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbe1ce056  ! 390: XOR_I	xor 	%r19, 0x0056, %r31
	.word 0xb7e58000  ! 391: SAVE_R	save	%r22, %r0, %r27
	.word 0xb1e42125  ! 392: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e56019  ! 393: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e58000  ! 394: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_32:
	setx	0x1d0001, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_21:
	mov	0x3c2, %r14
	.word 0xf6f389e0  ! 398: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_0_33:
	setx	0x1f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 402: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 12)
	.word 0xbde4603c  ! 404: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e46037  ! 405: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e5a13c  ! 406: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e5c000  ! 407: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_22:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 408: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbde4e07f  ! 410: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_23:
	mov	0x16, %r14
	.word 0xfaf38e60  ! 411: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_rd_12:
	mov	0x37, %r14
	.word 0xf4db8e60  ! 414: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T0_asi_reg_wr_24:
	mov	0x2c, %r14
	.word 0xfaf38400  ! 415: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_rd_13:
	mov	0x1f, %r14
	.word 0xf4db8e80  ! 418: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_0_34:
	setx	0x1c0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e52046  ! 424: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde58000  ! 428: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_35:
	setx	0x1c011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_36:
	setx	0x1c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe561ed  ! 433: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbc9de1f8  ! 435: XORcc_I	xorcc 	%r23, 0x01f8, %r30
	.word 0xb7e421cb  ! 437: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_wr_25:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 438: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_37:
	setx	0x1c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_14:
	mov	0x4, %r14
	.word 0xf6db8e80  ! 445: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb3e44000  ! 446: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_38:
	setx	0x1f0010, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_26:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 449: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb9e54000  ! 450: SAVE_R	save	%r21, %r0, %r28
	.word 0xbbe46187  ! 451: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde4a1fc  ! 453: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_39:
	setx	0x1c003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_15:
	mov	0x1d, %r14
	.word 0xf0db84a0  ! 455: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T0_asi_reg_rd_16:
	mov	0x26, %r14
	.word 0xfedb8e40  ! 456: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3e54000  ! 457: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_27:
	mov	0x3c4, %r14
	.word 0xfaf38e60  ! 458: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb3e5a0f7  ! 460: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_40:
	setx	0x21012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, e)
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 31)
	.word 0x819561d2  ! 468: WRPR_TPC_I	wrpr	%r21, 0x01d2, %tpc
	.word 0xb035c000  ! 471: SUBC_R	orn 	%r23, %r0, %r24
cpu_intr_0_41:
	setx	0x230328, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_28:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 474: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_29:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 480: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1e5c000  ! 484: SAVE_R	save	%r23, %r0, %r24
	.word 0xb97cc400  ! 488: MOVR_R	movre	%r19, %r0, %r28
cpu_intr_0_42:
	setx	0x23031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4614b  ! 490: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e421ee  ! 491: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_17:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 492: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb3e4c000  ! 496: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_rd_18:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 500: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_43:
	setx	0x230131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63d0000  ! 503: XNOR_R	xnor 	%r20, %r0, %r27
cpu_intr_0_44:
	setx	0x200327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08d60e5  ! 512: ANDcc_I	andcc 	%r21, 0x00e5, %r24
	.word 0xb9e52078  ! 513: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_wr_30:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 514: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbfe4c000  ! 515: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_45:
	setx	0x22033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb4844000  ! 519: ADDcc_R	addcc 	%r17, %r0, %r26
	.word 0xb7e48000  ! 522: SAVE_R	save	%r18, %r0, %r27
	.word 0xb09da1e9  ! 524: XORcc_I	xorcc 	%r22, 0x01e9, %r24
	.word 0xb3e4a1db  ! 525: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e5a0ee  ! 528: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_19:
	mov	0x2a, %r14
	.word 0xf4db89e0  ! 530: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb7e50000  ! 537: SAVE_R	save	%r20, %r0, %r27
	.word 0xb1e54000  ! 539: SAVE_R	save	%r21, %r0, %r24
	.word 0xbc2cc000  ! 541: ANDN_R	andn 	%r19, %r0, %r30
T0_asi_reg_rd_20:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_wr_31:
	mov	0x4, %r14
	.word 0xf8f38e40  ! 543: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfe44000  ! 544: SAVE_R	save	%r17, %r0, %r31
	.word 0xb9e5e09e  ! 545: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe50000  ! 550: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_46:
	setx	0x210131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21d0000  ! 555: XOR_R	xor 	%r20, %r0, %r25
	.word 0xbfe48000  ! 559: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_21:
	mov	0x0, %r14
	.word 0xf0db89e0  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbde58000  ! 568: SAVE_R	save	%r22, %r0, %r30
	.word 0xbde42000  ! 569: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e5a150  ! 570: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbeb58000  ! 573: SUBCcc_R	orncc 	%r22, %r0, %r31
T0_asi_reg_rd_22:
	mov	0x8, %r14
	.word 0xf6db8e60  ! 574: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbde44000  ! 576: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_23:
	mov	0x15, %r14
	.word 0xf0db8e80  ! 577: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb5e4a03f  ! 578: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb0adc000  ! 580: ANDNcc_R	andncc 	%r23, %r0, %r24
	.word 0xb7e460bc  ! 581: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e48000  ! 583: SAVE_R	save	%r18, %r0, %r24
	.word 0xb7e56182  ! 586: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e460c8  ! 587: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_47:
	setx	0x20023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1ed  ! 589: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e58000  ! 592: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_48:
	setx	0x230013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e181  ! 594: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb9e54000  ! 597: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_32:
	mov	0xa, %r14
	.word 0xfaf384a0  ! 598: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbde5e0c5  ! 600: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_wr_33:
	mov	0x3c1, %r14
	.word 0xf6f38e60  ! 602: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbde5a0e5  ! 604: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_34:
	mov	0xb, %r14
	.word 0xfef389e0  ! 605: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_49:
	setx	0x220200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 611: SAVE_R	save	%r20, %r0, %r27
	.word 0xb5e50000  ! 612: SAVE_R	save	%r20, %r0, %r26
	.word 0xb3e46031  ! 613: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_50:
	setx	0x220000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_24:
	mov	0x31, %r14
	.word 0xf0db8e80  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb9e5e0ef  ! 622: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, c)
	.word 0xbde50000  ! 636: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_35:
	mov	0x2a, %r14
	.word 0xf8f38400  ! 637: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbd2cb001  ! 638: SLLX_I	sllx	%r18, 0x0001, %r30
T0_asi_reg_rd_25:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 640: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_51:
	setx	0x220305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_52:
	setx	0x200134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 645: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_53:
	setx	0x22010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe560a4  ! 649: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e44000  ! 652: SAVE_R	save	%r17, %r0, %r25
	.word 0xbd3d2001  ! 655: SRA_I	sra 	%r20, 0x0001, %r30
T0_asi_reg_wr_36:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 656: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 27)
	.word 0xbde40000  ! 658: SAVE_R	save	%r16, %r0, %r30
	.word 0xbde461c4  ! 661: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe54000  ! 663: SAVE_R	save	%r21, %r0, %r29
	.word 0xb1e44000  ! 664: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 1)
	.word 0xbbe461a7  ! 667: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e58000  ! 668: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_26:
	mov	0x29, %r14
	.word 0xf4db89e0  ! 671: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 12)
	.word 0xb1520000  ! 679: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe5c000  ! 685: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, a)
	.word 0xb52c2001  ! 689: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xb7e4e0b4  ! 690: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 17)
	.word 0xb9e5c000  ! 699: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_27:
	mov	0x12, %r14
	.word 0xf0db8e80  ! 705: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_54:
	setx	0x23030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 710: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_55:
	setx	0x21030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_28:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 714: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb5346001  ! 715: SRL_I	srl 	%r17, 0x0001, %r26
	.word 0xb73d9000  ! 716: SRAX_R	srax	%r22, %r0, %r27
cpu_intr_0_56:
	setx	0x20020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_29:
	mov	0xb, %r14
	.word 0xf4db8e60  ! 724: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbde50000  ! 725: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_57:
	setx	0x230111, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_37:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 728: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb404c000  ! 729: ADD_R	add 	%r19, %r0, %r26
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 14)
	.word 0xb09d616e  ! 736: XORcc_I	xorcc 	%r21, 0x016e, %r24
T0_asi_reg_rd_30:
	mov	0x33, %r14
	.word 0xf2db8400  ! 742: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_wr_38:
	mov	0x2a, %r14
	.word 0xfef38e60  ! 743: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_58:
	setx	0x210109, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_39:
	mov	0x3c0, %r14
	.word 0xfef38e80  ! 749: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbde50000  ! 750: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_59:
	setx	0x22013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 22)
	.word 0xb9e54000  ! 755: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_60:
	setx	0x21022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, f)
	.word 0xbfe50000  ! 761: SAVE_R	save	%r20, %r0, %r31
	.word 0xb3e48000  ! 762: SAVE_R	save	%r18, %r0, %r25
	.word 0xb5e52176  ! 764: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_61:
	setx	0x21012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_40:
	mov	0x3c8, %r14
	.word 0xfcf384a0  ! 768: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb4c46178  ! 770: ADDCcc_I	addccc 	%r17, 0x0178, %r26
	.word 0xb5e46087  ! 772: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe4e0b4  ! 776: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 32)
	.word 0xbfe5a0e2  ! 783: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbd35b001  ! 786: SRLX_I	srlx	%r22, 0x0001, %r30
	.word 0xb4b4610b  ! 788: SUBCcc_I	orncc 	%r17, 0x010b, %r26
cpu_intr_0_62:
	setx	0x20000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb484c000  ! 792: ADDcc_R	addcc 	%r19, %r0, %r26
	.word 0xb3e4c000  ! 793: SAVE_R	save	%r19, %r0, %r25
	.word 0xbebdc000  ! 794: XNORcc_R	xnorcc 	%r23, %r0, %r31
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_rd_31:
	mov	0x23, %r14
	.word 0xf2db8e80  ! 798: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb7e5a1b2  ! 800: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_63:
	setx	0x200336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_64:
	setx	0x23032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e040  ! 805: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e56138  ! 806: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_65:
	setx	0x210233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 815: SAVE_R	save	%r22, %r0, %r29
	.word 0xb3e48000  ! 816: SAVE_R	save	%r18, %r0, %r25
	.word 0xbfe461f2  ! 817: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_41:
	mov	0x31, %r14
	.word 0xf6f38e60  ! 819: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_wr_42:
	mov	0x3c1, %r14
	.word 0xf0f384a0  ! 821: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb5e4a17f  ! 822: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_32:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 826: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb1e50000  ! 829: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_66:
	setx	0x200120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e199  ! 831: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e4a16d  ! 835: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e58000  ! 837: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_67:
	setx	0x200310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 842: SAVE_R	save	%r23, %r0, %r30
	.word 0xbbe48000  ! 845: SAVE_R	save	%r18, %r0, %r29
	.word 0xbbe58000  ! 851: SAVE_R	save	%r22, %r0, %r29
	.word 0xbfe4e10f  ! 853: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde4c000  ! 855: SAVE_R	save	%r19, %r0, %r30
	.word 0xbbe44000  ! 856: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_68:
	setx	0x210013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_69:
	setx	0x210304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4218c  ! 859: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_rd_33:
	mov	0x8, %r14
	.word 0xf4db8e40  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e5a0a4  ! 863: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb3e40000  ! 868: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_wr_43:
	mov	0x13, %r14
	.word 0xf2f384a0  ! 870: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbde42186  ! 873: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 32)
	.word 0xbe3cc000  ! 876: XNOR_R	xnor 	%r19, %r0, %r31
	.word 0xb7e50000  ! 877: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_70:
	setx	0x210108, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_34:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 882: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_71:
	setx	0x200008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_72:
	setx	0x210314, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_35:
	mov	0x2e, %r14
	.word 0xf0db8e40  ! 888: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbde521ca  ! 889: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb92dd000  ! 892: SLLX_R	sllx	%r23, %r0, %r28
T0_asi_reg_rd_36:
	mov	0x2b, %r14
	.word 0xfcdb89e0  ! 893: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb3e4c000  ! 894: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_rd_37:
	mov	0x13, %r14
	.word 0xf0db84a0  ! 896: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 14)
	.word 0xb7e58000  ! 899: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_44:
	mov	0xe, %r14
	.word 0xfaf38e80  ! 901: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb9e4604e  ! 902: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_73:
	setx	0x20013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_45:
	mov	0x6, %r14
	.word 0xfcf38e40  ! 904: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_74:
	setx	0x20033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_38:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 906: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_75:
	setx	0x270208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 914: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_46:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 916: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 1)
	.word 0xbe958000  ! 927: ORcc_R	orcc 	%r22, %r0, %r31
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, b)
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_76:
	setx	0x24012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_77:
	setx	0x270126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1356001  ! 941: SRL_I	srl 	%r21, 0x0001, %r24
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 30)
	.word 0xb09cc000  ! 947: XORcc_R	xorcc 	%r19, %r0, %r24
cpu_intr_0_78:
	setx	0x240110, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_39:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_40:
	mov	0x3c7, %r14
	.word 0xf8db89e0  ! 958: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb3e58000  ! 962: SAVE_R	save	%r22, %r0, %r25
	.word 0xb9e44000  ! 964: SAVE_R	save	%r17, %r0, %r28
	.word 0xb1e461d4  ! 965: SAVE_I	save	%r17, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_79:
	setx	0x24021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_47:
	mov	0x32, %r14
	.word 0xfef38e40  ! 970: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfe54000  ! 972: SAVE_R	save	%r21, %r0, %r31
	.word 0xb7e4e0b0  ! 974: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e50000  ! 977: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_48:
	mov	0x3c7, %r14
	.word 0xf0f384a0  ! 978: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbbe421f2  ! 979: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb7e44000  ! 983: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 29)
	.word 0xbde42196  ! 989: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_rd_41:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 997: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_80:
	setx	0x270335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 1001: SAVE_R	save	%r18, %r0, %r29
	.word 0xbde48000  ! 1004: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_81:
	setx	0x240025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde461d6  ! 1006: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e54000  ! 1009: SAVE_R	save	%r21, %r0, %r26
	.word 0xb3e46188  ! 1011: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e4a1c3  ! 1012: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_42:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 1013: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb6bc4000  ! 1014: XNORcc_R	xnorcc 	%r17, %r0, %r27
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 2)
	.word 0xbfe5a020  ! 1021: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e4e19c  ! 1022: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe5a09e  ! 1024: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde48000  ! 1026: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_wr_49:
	mov	0x5, %r14
	.word 0xf2f384a0  ! 1027: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5e42086  ! 1028: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe52182  ! 1029: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_82:
	setx	0x250124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 35)
	.word 0xbbe5a1f2  ! 1042: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde50000  ! 1043: SAVE_R	save	%r20, %r0, %r30
	.word 0xbf3c7001  ! 1046: SRAX_I	srax	%r17, 0x0001, %r31
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, c)
	.word 0xb9e40000  ! 1052: SAVE_R	save	%r16, %r0, %r28
	.word 0xb6b40000  ! 1053: SUBCcc_R	orncc 	%r16, %r0, %r27
	.word 0xb3e4c000  ! 1055: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_wr_50:
	mov	0x5, %r14
	.word 0xfcf38400  ! 1056: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_83:
	setx	0x250014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_84:
	setx	0x25010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 3)
	.word 0xb9e5a0b4  ! 1065: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_85:
	setx	0x250012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_86:
	setx	0x250302, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_43:
	mov	0x28, %r14
	.word 0xfedb89e0  ! 1075: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb3e460e5  ! 1076: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_51:
	mov	0x1a, %r14
	.word 0xf0f38e40  ! 1077: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 26)
	.word 0xbb641800  ! 1080: MOVcc_R	<illegal instruction>
cpu_intr_0_87:
	setx	0x240332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 4)
	.word 0xb7e52122  ! 1091: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_88:
	setx	0x27010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a0de  ! 1096: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb13d3001  ! 1098: SRAX_I	srax	%r20, 0x0001, %r24
T0_asi_reg_rd_44:
	mov	0x33, %r14
	.word 0xf4db8e60  ! 1099: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb5e40000  ! 1102: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 39)
	.word 0xb3e461ce  ! 1107: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e40000  ! 1108: SAVE_R	save	%r16, %r0, %r28
	.word 0xb83d4000  ! 1111: XNOR_R	xnor 	%r21, %r0, %r28
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_52:
	mov	0x29, %r14
	.word 0xf6f384a0  ! 1114: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbfe4c000  ! 1116: SAVE_R	save	%r19, %r0, %r31
	.word 0xbde4c000  ! 1117: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 36)
	.word 0xbc1d8000  ! 1121: XOR_R	xor 	%r22, %r0, %r30
	.word 0xb9e56055  ! 1122: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_89:
	setx	0x250003, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_45:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 1128: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb1e48000  ! 1130: SAVE_R	save	%r18, %r0, %r24
	.word 0xbde48000  ! 1132: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_90:
	setx	0x27023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 1142: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_46:
	mov	0x1e, %r14
	.word 0xf2db8e80  ! 1145: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbde48000  ! 1147: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_wr_53:
	mov	0x36, %r14
	.word 0xfef38e40  ! 1149: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_47:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 1152: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_wr_54:
	mov	0x25, %r14
	.word 0xfcf38e40  ! 1155: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_91:
	setx	0x270230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_92:
	setx	0x24031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_48:
	mov	0x27, %r14
	.word 0xf0db8400  ! 1162: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbde4c000  ! 1168: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_55:
	mov	0x1c, %r14
	.word 0xfef38e80  ! 1170: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_49:
	mov	0x3c8, %r14
	.word 0xf2db8e60  ! 1177: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbc9c215f  ! 1180: XORcc_I	xorcc 	%r16, 0x015f, %r30
	.word 0xbde42179  ! 1181: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde48000  ! 1183: SAVE_R	save	%r18, %r0, %r30
	.word 0xb5e5c000  ! 1188: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_93:
	setx	0x24013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_94:
	setx	0x250039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc25c000  ! 1191: SUB_R	sub 	%r23, %r0, %r30
T0_asi_reg_rd_50:
	mov	0x3c6, %r14
	.word 0xf4db89e0  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb4b420e8  ! 1196: ORNcc_I	orncc 	%r16, 0x00e8, %r26
cpu_intr_0_95:
	setx	0x250105, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_56:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 1200: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_57:
	mov	0x11, %r14
	.word 0xfaf38e40  ! 1205: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe5a1f7  ! 1208: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbde48000  ! 1210: SAVE_R	save	%r18, %r0, %r30
	.word 0xb7e40000  ! 1211: SAVE_R	save	%r16, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 7)
	.word 0xbbe54000  ! 1216: SAVE_R	save	%r21, %r0, %r29
	.word 0xbde460df  ! 1217: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e5a052  ! 1219: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_96:
	setx	0x250232, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_51:
	mov	0x3c4, %r14
	.word 0xf4db8400  ! 1221: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb734b001  ! 1225: SRLX_I	srlx	%r18, 0x0001, %r27
T0_asi_reg_wr_58:
	mov	0x31, %r14
	.word 0xf4f389e0  ! 1227: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb3e4e137  ! 1230: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe54000  ! 1232: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb1e5c000  ! 1234: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 8)
	.word 0xbbe46144  ! 1238: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_97:
	setx	0x24031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_98:
	setx	0x25002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_52:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 1246: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3e44000  ! 1247: SAVE_R	save	%r17, %r0, %r25
	.word 0xb1e52114  ! 1250: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb9e54000  ! 1253: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_59:
	mov	0x3, %r14
	.word 0xfcf384a0  ! 1254: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_99:
	setx	0x270300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 1259: SAVE_R	save	%r19, %r0, %r31
	.word 0xbbe52135  ! 1261: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3e46064  ! 1263: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe4a04c  ! 1268: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb9e461a8  ! 1270: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e4a04e  ! 1272: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e521a5  ! 1277: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe44000  ! 1278: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_100:
	setx	0x27022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_53:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 1282: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3e40000  ! 1286: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_101:
	setx	0x270327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42023  ! 1289: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_60:
	mov	0xa, %r14
	.word 0xfaf38e80  ! 1290: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb3e4619a  ! 1292: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe58000  ! 1293: SAVE_R	save	%r22, %r0, %r29
	.word 0xb1e5615b  ! 1294: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_102:
	setx	0x26032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b5c000  ! 1297: SUBCcc_R	orncc 	%r23, %r0, %r25
	.word 0xbfe4c000  ! 1301: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 19)
	.word 0xb72ca001  ! 1306: SLL_I	sll 	%r18, 0x0001, %r27
	.word 0xb5e4a19d  ! 1307: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb9e42184  ! 1309: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e48000  ! 1310: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 14)
	.word 0xbeb48000  ! 1313: ORNcc_R	orncc 	%r18, %r0, %r31
T0_asi_reg_wr_61:
	mov	0x3c4, %r14
	.word 0xfef384a0  ! 1314: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_103:
	setx	0x260014, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_62:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 1317: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbe48000  ! 1321: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_104:
	setx	0x270028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_63:
	mov	0x6, %r14
	.word 0xf0f38e60  ! 1326: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb7e42044  ! 1327: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_54:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 1330: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb1e561e2  ! 1334: SAVE_I	save	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_rd_55:
	mov	0xc, %r14
	.word 0xf2db8e60  ! 1337: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbfe44000  ! 1339: SAVE_R	save	%r17, %r0, %r31
	.word 0xb5e48000  ! 1342: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_105:
	setx	0x27023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e1db  ! 1346: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e56007  ! 1348: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde561d1  ! 1349: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_106:
	setx	0x260023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c5e035  ! 1355: ADDCcc_I	addccc 	%r23, 0x0035, %r27
cpu_intr_0_107:
	setx	0x260304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb5e4e12e  ! 1362: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e40000  ! 1363: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_108:
	setx	0x240200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 1369: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_rd_56:
	mov	0x25, %r14
	.word 0xfcdb84a0  ! 1371: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbde40000  ! 1372: SAVE_R	save	%r16, %r0, %r30
	.word 0xbbe521cc  ! 1374: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_109:
	setx	0x27003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_110:
	setx	0x240015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe420b0  ! 1385: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_111:
	setx	0x0, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb3e54000  ! 1390: SAVE_R	save	%r21, %r0, %r25
	.word 0xb9e4a03c  ! 1394: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_112:
	setx	0x260227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_113:
	setx	0x280135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7357001  ! 1404: SRLX_I	srlx	%r21, 0x0001, %r27
T0_asi_reg_rd_57:
	mov	0x15, %r14
	.word 0xfcdb8e80  ! 1405: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_wr_64:
	mov	0x1c, %r14
	.word 0xfef38e80  ! 1407: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb8b44000  ! 1408: SUBCcc_R	orncc 	%r17, %r0, %r28
T0_asi_reg_rd_58:
	mov	0x36, %r14
	.word 0xfedb89e0  ! 1410: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_59:
	mov	0x2, %r14
	.word 0xfedb89e0  ! 1418: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_rd_60:
	mov	0x1e, %r14
	.word 0xf0db8e40  ! 1421: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 10)
	.word 0xb5e40000  ! 1427: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_114:
	setx	0x2a032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_115:
	setx	0x2b0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a185  ! 1433: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4a00e  ! 1436: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_rd_61:
	mov	0x34, %r14
	.word 0xf2db84a0  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb1e54000  ! 1438: SAVE_R	save	%r21, %r0, %r24
	.word 0xb3e4e1dc  ! 1440: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e46121  ! 1444: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_wr_65:
	mov	0x2a, %r14
	.word 0xf4f38400  ! 1446: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_wr_66:
	mov	0xf, %r14
	.word 0xfcf38e60  ! 1448: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb1e5c000  ! 1449: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 30)
	.word 0xb7e44000  ! 1452: SAVE_R	save	%r17, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb4b54000  ! 1455: ORNcc_R	orncc 	%r21, %r0, %r26
	.word 0xb1e5c000  ! 1456: SAVE_R	save	%r23, %r0, %r24
	.word 0x87946181  ! 1457: WRPR_TT_I	wrpr	%r17, 0x0181, %tt
	.word 0xbca4a164  ! 1458: SUBcc_I	subcc 	%r18, 0x0164, %r30
T0_asi_reg_rd_62:
	mov	0x2, %r14
	.word 0xf4db89e0  ! 1459: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_116:
	setx	0x290221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b40000  ! 1461: SUBCcc_R	orncc 	%r16, %r0, %r27
	.word 0xb7e40000  ! 1464: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe4a00b  ! 1469: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe5a16c  ! 1470: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 6)
	.word 0xb5e50000  ! 1476: SAVE_R	save	%r20, %r0, %r26
	.word 0xb834e045  ! 1479: SUBC_I	orn 	%r19, 0x0045, %r28
T0_asi_reg_wr_67:
	mov	0x7, %r14
	.word 0xf0f389e0  ! 1481: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5e420ec  ! 1483: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_117:
	setx	0x29003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_118:
	setx	0x280337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46145  ! 1491: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_63:
	mov	0x11, %r14
	.word 0xfedb8400  ! 1492: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_119:
	setx	0x2b0201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 27)
	.word 0xbde40000  ! 1502: SAVE_R	save	%r16, %r0, %r30
	.word 0xb9e5616e  ! 1510: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_68:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 1516: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_120:
	setx	0x29031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_69:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 1524: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_wr_70:
	mov	0x3c8, %r14
	.word 0xf4f38e60  ! 1526: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1e44000  ! 1527: SAVE_R	save	%r17, %r0, %r24
	.word 0xb215a08c  ! 1530: OR_I	or 	%r22, 0x008c, %r25
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 27)
	.word 0xbfe520b8  ! 1532: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_rd_64:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb0a4207c  ! 1539: SUBcc_I	subcc 	%r16, 0x007c, %r24
	.word 0xbde44000  ! 1540: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_121:
	setx	0x28003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_122:
	setx	0x290208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_123:
	setx	0x2b003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 1549: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_wr_71:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 1551: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_0_124:
	setx	0x2b011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3c0000  ! 1554: XNOR_R	xnor 	%r16, %r0, %r29
	.word 0xb834c000  ! 1556: ORN_R	orn 	%r19, %r0, %r28
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_wr_72:
	mov	0x19, %r14
	.word 0xf4f38e40  ! 1558: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e4c000  ! 1559: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e40000  ! 1565: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_rd_65:
	mov	0x2a, %r14
	.word 0xfcdb8e40  ! 1568: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb1e5605f  ! 1572: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e58000  ! 1574: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb52d7001  ! 1581: SLLX_I	sllx	%r21, 0x0001, %r26
	.word 0xbbe4615b  ! 1583: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_66:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_125:
	setx	0x2a031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe420fd  ! 1592: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbd7d2401  ! 1593: MOVR_I	movre	%r20, 0x1, %r30
	.word 0xb7e52182  ! 1597: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e460cc  ! 1599: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_73:
	mov	0x3c2, %r14
	.word 0xf4f38e60  ! 1601: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_rd_67:
	mov	0x2b, %r14
	.word 0xfcdb8e60  ! 1603: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_126:
	setx	0x2b011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_127:
	setx	0x290034, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_68:
	mov	0x3c7, %r14
	.word 0xf0db8400  ! 1609: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbfe4c000  ! 1610: SAVE_R	save	%r19, %r0, %r31
	.word 0xb5e5a157  ! 1612: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_128:
	setx	0x2b0328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_129:
	setx	0x2a0111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_rd_69:
	mov	0x0, %r14
	.word 0xfedb8e80  ! 1625: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbbe420be  ! 1628: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb57ce401  ! 1629: MOVR_I	movre	%r19, 0x1, %r26
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb5e560eb  ! 1634: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_wr_74:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 1635: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1e44000  ! 1637: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_wr_75:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 1641: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3e50000  ! 1643: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb1e44000  ! 1646: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_130:
	setx	0x290137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a107  ! 1649: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_76:
	mov	0x3c6, %r14
	.word 0xf4f38e60  ! 1650: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_wr_77:
	mov	0xd, %r14
	.word 0xf4f38400  ! 1651: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_0_131:
	setx	0x280233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4602b  ! 1658: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, b)
	.word 0xb3e44000  ! 1663: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_132:
	setx	0x2b0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5216d  ! 1666: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_133:
	setx	0x29032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_70:
	mov	0x4, %r14
	.word 0xf4db8400  ! 1668: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_rd_71:
	mov	0x7, %r14
	.word 0xfcdb8e40  ! 1669: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5e44000  ! 1671: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_wr_78:
	mov	0x1f, %r14
	.word 0xfaf38400  ! 1672: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbfe46042  ! 1675: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e5612a  ! 1676: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 31)
	.word 0xa1902001  ! 1681: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xbde5e1de  ! 1682: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_72:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 1685: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_134:
	setx	0x2a003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e19d  ! 1691: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e44000  ! 1692: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_73:
	mov	0x38, %r14
	.word 0xf0db8e60  ! 1693: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_rd_74:
	mov	0x26, %r14
	.word 0xf0db8e40  ! 1695: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1e50000  ! 1696: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_79:
	mov	0x21, %r14
	.word 0xfef38e60  ! 1697: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbbe5e013  ! 1698: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_135:
	setx	0x28000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5605a  ! 1712: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde54000  ! 1714: SAVE_R	save	%r21, %r0, %r30
	.word 0xb9e421ac  ! 1716: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_136:
	setx	0x2a023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595a1f1  ! 1721: WRPR_TSTATE_I	wrpr	%r22, 0x01f1, %tstate
	.word 0xb9e56124  ! 1722: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_137:
	setx	0x2a003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e52173  ! 1727: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e520d1  ! 1728: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e50000  ! 1730: SAVE_R	save	%r20, %r0, %r27
	.word 0xb6adc000  ! 1733: ANDNcc_R	andncc 	%r23, %r0, %r27
	.word 0xbde4e132  ! 1734: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e4c000  ! 1736: SAVE_R	save	%r19, %r0, %r24
	.word 0xbfe42162  ! 1737: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe42195  ! 1738: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e42099  ! 1741: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbec46099  ! 1742: ADDCcc_I	addccc 	%r17, 0x0099, %r31
cpu_intr_0_138:
	setx	0x29030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_75:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 1746: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_rd_76:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 1748: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbfe48000  ! 1753: SAVE_R	save	%r18, %r0, %r31
	.word 0xb1e50000  ! 1754: SAVE_R	save	%r20, %r0, %r24
	.word 0xb1e5a144  ! 1755: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_wr_80:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 1759: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_wr_81:
	mov	0x1b, %r14
	.word 0xf2f384a0  ! 1762: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 11)
	.word 0xbc35204a  ! 1765: ORN_I	orn 	%r20, 0x004a, %r30
T0_asi_reg_wr_82:
	mov	0x3c0, %r14
	.word 0xf4f38e60  ! 1770: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb7e48000  ! 1772: SAVE_R	save	%r18, %r0, %r27
	.word 0x9195a1fa  ! 1773: WRPR_PIL_I	wrpr	%r22, 0x01fa, %pil
	.word 0xb7e4a128  ! 1774: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_77:
	mov	0x0, %r14
	.word 0xf6db8e40  ! 1777: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_139:
	setx	0x290008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 1781: SAVE_R	save	%r18, %r0, %r30
	.word 0xb1e5c000  ! 1782: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_rd_78:
	mov	0x3c1, %r14
	.word 0xfcdb8400  ! 1783: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbfe5a15b  ! 1787: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe461c8  ! 1789: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_79:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 1790: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_140:
	setx	0x2a0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb42d606d  ! 1792: ANDN_I	andn 	%r21, 0x006d, %r26
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb9e46141  ! 1804: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_141:
	setx	0x2b0202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_142:
	setx	0x280308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbbe5c000  ! 1813: SAVE_R	save	%r23, %r0, %r29
	.word 0xb1e48000  ! 1814: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_80:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 1820: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb535f001  ! 1822: SRLX_I	srlx	%r23, 0x0001, %r26
	.word 0xb92c9000  ! 1823: SLLX_R	sllx	%r18, %r0, %r28
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_143:
	setx	0x29002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_83:
	mov	0x38, %r14
	.word 0xfef38e40  ! 1832: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbe58000  ! 1834: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_144:
	setx	0x2f0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_81:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 1839: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5e48000  ! 1844: SAVE_R	save	%r18, %r0, %r26
	.word 0xb1e520a4  ! 1846: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_145:
	setx	0x2e033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_84:
	mov	0x23, %r14
	.word 0xf2f38e60  ! 1852: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb3e42147  ! 1853: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbfe4c000  ! 1856: SAVE_R	save	%r19, %r0, %r31
	.word 0xb1e5e167  ! 1858: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde40000  ! 1859: SAVE_R	save	%r16, %r0, %r30
	.word 0xbbe4a056  ! 1860: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_82:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 1862: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_rd_83:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 1865: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1e40000  ! 1866: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_146:
	setx	0x2c0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e151  ! 1869: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb735f001  ! 1870: SRLX_I	srlx	%r23, 0x0001, %r27
cpu_intr_0_147:
	setx	0x2c0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e58000  ! 1876: SAVE_R	save	%r22, %r0, %r27
	.word 0xb4044000  ! 1877: ADD_R	add 	%r17, %r0, %r26
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_148:
	setx	0x2e003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea460d1  ! 1890: SUBcc_I	subcc 	%r17, 0x00d1, %r31
cpu_intr_0_149:
	setx	0x2f0301, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_85:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 1892: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb6bd617b  ! 1895: XNORcc_I	xnorcc 	%r21, 0x017b, %r27
cpu_intr_0_150:
	setx	0x2f0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a0ff  ! 1898: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_151:
	setx	0x2e020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, a)
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 15)
	.word 0xbfe40000  ! 1910: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 31)
	.word 0xbde4a09a  ! 1914: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_86:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 1916: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_87:
	mov	0x14, %r14
	.word 0xf2f38e40  ! 1919: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_152:
	setx	0x2e0018, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_88:
	mov	0x1b, %r14
	.word 0xf0f38e80  ! 1921: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_153:
	setx	0x2c0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 1932: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb1e50000  ! 1934: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbde40000  ! 1936: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_89:
	mov	0x3c2, %r14
	.word 0xfcf38e60  ! 1937: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_rd_84:
	mov	0xb, %r14
	.word 0xfcdb8e60  ! 1938: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_rd_85:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 1941: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbde461ee  ! 1948: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8f902000  ! 1949: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_154:
	setx	0x2c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_90:
	mov	0x3c1, %r14
	.word 0xf4f38400  ! 1957: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb5520000  ! 1958: RDPR_PIL	<illegal instruction>
cpu_intr_0_155:
	setx	0x2c0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a07b  ! 1962: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbd480000  ! 1963: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb7e4a18e  ! 1964: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_156:
	setx	0x2c023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_157:
	setx	0x2e0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89de123  ! 1968: XORcc_I	xorcc 	%r23, 0x0123, %r28
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_158:
	setx	0x2f0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb815a0b8  ! 1976: OR_I	or 	%r22, 0x00b8, %r28
cpu_intr_0_159:
	setx	0x2d0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1345000  ! 1978: SRLX_R	srlx	%r17, %r0, %r24
	.word 0xb1e50000  ! 1979: SAVE_R	save	%r20, %r0, %r24
	.word 0xb1e520ef  ! 1980: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde58000  ! 1981: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_86:
	mov	0x25, %r14
	.word 0xf8db8e60  ! 1984: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_160:
	setx	0x2f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_87:
	mov	0x1d, %r14
	.word 0xfedb89e0  ! 1992: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_161:
	setx	0x2e0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bd600b  ! 1998: XNORcc_I	xnorcc 	%r21, 0x000b, %r28
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 32)
	.word 0xb7e5e193  ! 2002: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_162:
	setx	0x2f0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a08f  ! 2007: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_163:
	setx	0x2d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 2013: SAVE_R	save	%r20, %r0, %r29
	.word 0xb3e58000  ! 2014: SAVE_R	save	%r22, %r0, %r25
	.word 0xb9e4a14a  ! 2015: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe48000  ! 2016: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_91:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 2018: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5e50000  ! 2019: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_rd_88:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 2020: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb7e44000  ! 2021: SAVE_R	save	%r17, %r0, %r27
	.word 0xbd504000  ! 2022: RDPR_TNPC	<illegal instruction>
	.word 0xb3e50000  ! 2023: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_164:
	setx	0x2d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_89:
	mov	0xb, %r14
	.word 0xf4db8400  ! 2025: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_rd_90:
	mov	0x28, %r14
	.word 0xfcdb89e0  ! 2027: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb5e48000  ! 2029: SAVE_R	save	%r18, %r0, %r26
	.word 0xb3e48000  ! 2030: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 3a)
	.word 0x8f902001  ! 2033: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xb5e42186  ! 2037: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e44000  ! 2038: SAVE_R	save	%r17, %r0, %r25
	.word 0xb1e58000  ! 2039: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 14)
	.word 0xb7e4c000  ! 2042: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_91:
	mov	0x29, %r14
	.word 0xf2db8400  ! 2044: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb5e56179  ! 2049: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe40000  ! 2052: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb1e460cc  ! 2054: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_165:
	setx	0x2f020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 3)
	.word 0xbde5c000  ! 2064: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_166:
	setx	0x2d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_92:
	mov	0x32, %r14
	.word 0xfadb8e60  ! 2072: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_167:
	setx	0x2f0313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_168:
	setx	0x2e0026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_169:
	setx	0x2d021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 2086: SAVE_R	save	%r17, %r0, %r31
	.word 0xb3e50000  ! 2087: SAVE_R	save	%r20, %r0, %r25
	.word 0xbbe44000  ! 2088: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_170:
	setx	0x2e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb435e1b7  ! 2094: ORN_I	orn 	%r23, 0x01b7, %r26
	.word 0xb8c42063  ! 2101: ADDCcc_I	addccc 	%r16, 0x0063, %r28
T0_asi_reg_rd_93:
	mov	0x3, %r14
	.word 0xf8db84a0  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 10)
	.word 0xb5e4a07e  ! 2106: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xba1c0000  ! 2108: XOR_R	xor 	%r16, %r0, %r29
	.word 0xb5e50000  ! 2115: SAVE_R	save	%r20, %r0, %r26
	.word 0xb4b4c000  ! 2116: SUBCcc_R	orncc 	%r19, %r0, %r26
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb9e521b5  ! 2119: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 19)
	.word 0xbfe56183  ! 2123: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e4617c  ! 2125: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e5607d  ! 2135: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbfe44000  ! 2141: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_171:
	setx	0x2c0237, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_92:
	mov	0x2c, %r14
	.word 0xfcf384a0  ! 2145: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb2250000  ! 2147: SUB_R	sub 	%r20, %r0, %r25
	.word 0xbfe4a163  ! 2148: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3359000  ! 2151: SRLX_R	srlx	%r22, %r0, %r25
	.word 0xbde56064  ! 2152: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_172:
	setx	0x2d032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 2156: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_173:
	setx	0x2d0027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, a)
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_rd_94:
	mov	0xa, %r14
	.word 0xf8db8e40  ! 2170: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1480000  ! 2171: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
T0_asi_reg_wr_93:
	mov	0x8, %r14
	.word 0xfcf38e60  ! 2172: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb5e50000  ! 2173: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_174:
	setx	0x2c012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_175:
	setx	0x2f0015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 39)
	.word 0xb3e5a10f  ! 2177: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_176:
	setx	0x2f001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_177:
	setx	0x2e0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a18b  ! 2182: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe50000  ! 2183: SAVE_R	save	%r20, %r0, %r31
	.word 0xb7e48000  ! 2184: SAVE_R	save	%r18, %r0, %r27
	.word 0xbde58000  ! 2185: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_178:
	setx	0x2f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_179:
	setx	0x218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_180:
	setx	0x2f0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 2196: SAVE_R	save	%r21, %r0, %r25
	.word 0xbde42111  ! 2198: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e560da  ! 2199: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_181:
	setx	0x2c0137, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_95:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 2205: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb1e4a02a  ! 2213: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe58000  ! 2214: SAVE_R	save	%r22, %r0, %r29
	.word 0xbc05c000  ! 2215: ADD_R	add 	%r23, %r0, %r30
	.word 0xbfe44000  ! 2217: SAVE_R	save	%r17, %r0, %r31
	.word 0xb634603d  ! 2219: SUBC_I	orn 	%r17, 0x003d, %r27
	.word 0xbbe5a12a  ! 2220: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbbe4a1d6  ! 2221: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_96:
	mov	0x0, %r14
	.word 0xfcdb8e40  ! 2222: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1e5a0ad  ! 2223: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8f902002  ! 2226: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
T0_asi_reg_rd_97:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 2227: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb5e4611b  ! 2229: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe521f1  ! 2231: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3e54000  ! 2232: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_94:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 2234: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb2adc000  ! 2235: ANDNcc_R	andncc 	%r23, %r0, %r25
T0_asi_reg_rd_98:
	mov	0x27, %r14
	.word 0xfcdb8e40  ! 2236: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb7e4c000  ! 2238: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_182:
	setx	0x2d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_wr_95:
	mov	0x10, %r14
	.word 0xf6f384a0  ! 2244: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_rd_99:
	mov	0x34, %r14
	.word 0xfcdb8e60  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb9e40000  ! 2246: SAVE_R	save	%r16, %r0, %r28
	.word 0xbbe4e0f0  ! 2247: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe48000  ! 2252: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_183:
	setx	0x2d0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 2255: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_184:
	setx	0x2e013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a0cc  ! 2258: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_96:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 2264: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 38)
	.word 0xbb2c7001  ! 2278: SLLX_I	sllx	%r17, 0x0001, %r29
	.word 0xbde52170  ! 2280: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_185:
	setx	0x2d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 2285: SAVE_R	save	%r21, %r0, %r27
	.word 0xb3e5c000  ! 2287: SAVE_R	save	%r23, %r0, %r25
	.word 0xb9e48000  ! 2288: SAVE_R	save	%r18, %r0, %r28
	.word 0xbfe4c000  ! 2289: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_97:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 2292: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_98:
	mov	0x3c7, %r14
	.word 0xf8f38400  ! 2297: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_100:
	mov	0x19, %r14
	.word 0xfcdb89e0  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbfe4c000  ! 2307: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_99:
	mov	0x38, %r14
	.word 0xf6f38e40  ! 2309: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb40d8000  ! 2311: AND_R	and 	%r22, %r0, %r26
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_101:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 2314: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbde48000  ! 2320: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_186:
	setx	0x300004, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_102:
	mov	0x3c6, %r14
	.word 0xf0db89e0  ! 2323: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_187:
	setx	0x330109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_188:
	setx	0x320023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5219e  ! 2331: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_103:
	mov	0x2d, %r14
	.word 0xf6db8e80  ! 2332: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb9e54000  ! 2336: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 25)
	.word 0xb3e5a0e6  ! 2339: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_100:
	mov	0x2, %r14
	.word 0xfaf38e60  ! 2342: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_189:
	setx	0x30012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_101:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 2344: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 2)
	.word 0xb9e4a1b6  ! 2348: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbb2c0000  ! 2354: SLL_R	sll 	%r16, %r0, %r29
	.word 0xbe352049  ! 2357: SUBC_I	orn 	%r20, 0x0049, %r31
	.word 0xbde40000  ! 2361: SAVE_R	save	%r16, %r0, %r30
	.word 0xb5e4c000  ! 2362: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_190:
	setx	0x300302, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_104:
	mov	0x27, %r14
	.word 0xf4db8e80  ! 2365: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb9e5e02d  ! 2366: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb52d4000  ! 2368: SLL_R	sll 	%r21, %r0, %r26
cpu_intr_0_191:
	setx	0x310106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a03c  ! 2375: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_105:
	mov	0x10, %r14
	.word 0xf4db8e40  ! 2377: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e5c000  ! 2378: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_rd_106:
	mov	0x22, %r14
	.word 0xfcdb89e0  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_rd_107:
	mov	0x3, %r14
	.word 0xfedb8e80  ! 2387: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb7e4e127  ! 2389: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7e54000  ! 2392: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_108:
	mov	0x14, %r14
	.word 0xf4db8400  ! 2394: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_rd_109:
	mov	0xd, %r14
	.word 0xf0db8e40  ! 2396: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb37da401  ! 2397: MOVR_I	movre	%r22, 0x1, %r25
cpu_intr_0_192:
	setx	0x32010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab52036  ! 2403: ORNcc_I	orncc 	%r20, 0x0036, %r29
cpu_intr_0_193:
	setx	0x330021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 2409: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_102:
	mov	0x16, %r14
	.word 0xfef38e40  ! 2411: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbe5a11c  ! 2414: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 10)
	.word 0xb7e4a0f6  ! 2417: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_194:
	setx	0x330117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e1b1  ! 2423: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb73ca001  ! 2424: SRA_I	sra 	%r18, 0x0001, %r27
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 31)
	.word 0xbde5c000  ! 2431: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_195:
	setx	0x300030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_196:
	setx	0x320005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_197:
	setx	0x300128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 2441: SAVE_R	save	%r17, %r0, %r25
	.word 0xb1e40000  ! 2443: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_rd_110:
	mov	0x33, %r14
	.word 0xf0db89e0  ! 2449: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbfe4a0e3  ! 2451: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_198:
	setx	0x300227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 2454: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_wr_103:
	mov	0x3, %r14
	.word 0xf2f38e40  ! 2455: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_199:
	setx	0x33012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_wr_104:
	mov	0x9, %r14
	.word 0xf8f38e40  ! 2463: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_111:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 2464: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb2b42018  ! 2465: ORNcc_I	orncc 	%r16, 0x0018, %r25
T0_asi_reg_wr_105:
	mov	0x1a, %r14
	.word 0xfaf384a0  ! 2468: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_200:
	setx	0x320018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 2478: SAVE_R	save	%r18, %r0, %r25
	.word 0xbfe54000  ! 2479: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_201:
	setx	0x310223, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_112:
	mov	0x6, %r14
	.word 0xf4db8e80  ! 2481: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb5e4c000  ! 2485: SAVE_R	save	%r19, %r0, %r26
	.word 0xb72d8000  ! 2487: SLL_R	sll 	%r22, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e48000  ! 2490: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_106:
	mov	0xf, %r14
	.word 0xf4f38e40  ! 2494: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9e58000  ! 2495: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_202:
	setx	0x330209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e461ce  ! 2501: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe5a08e  ! 2502: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_203:
	setx	0x330313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 2507: SAVE_R	save	%r19, %r0, %r30
	.word 0xbfe5c000  ! 2508: SAVE_R	save	%r23, %r0, %r31
	.word 0xb9e5a1cf  ! 2515: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e5e1e3  ! 2521: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_113:
	mov	0x2e, %r14
	.word 0xf4db8400  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, f)
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_204:
	setx	0x320000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe420d8  ! 2529: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_205:
	setx	0x33020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e0f9  ! 2531: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbde48000  ! 2535: SAVE_R	save	%r18, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e54000  ! 2540: SAVE_R	save	%r21, %r0, %r26
	.word 0xb1e4607c  ! 2541: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_107:
	mov	0x18, %r14
	.word 0xfef38400  ! 2542: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbbe4e1ea  ! 2543: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_108:
	mov	0x0, %r14
	.word 0xfcf38e60  ! 2544: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_rd_114:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 2547: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb7e5a1ea  ! 2548: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e56127  ! 2549: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_206:
	setx	0x310327, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb08ce04d  ! 2556: ANDcc_I	andcc 	%r19, 0x004d, %r24
	.word 0xb5e40000  ! 2557: SAVE_R	save	%r16, %r0, %r26
	.word 0xbfe5c000  ! 2559: SAVE_R	save	%r23, %r0, %r31
	.word 0xb01c4000  ! 2560: XOR_R	xor 	%r17, %r0, %r24
	.word 0xb9e4c000  ! 2561: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_rd_115:
	mov	0x25, %r14
	.word 0xf0db8e60  ! 2563: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb5e5a1eb  ! 2564: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde4e0ba  ! 2565: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 3)
	.word 0xb8bc61b5  ! 2568: XNORcc_I	xnorcc 	%r17, 0x01b5, %r28
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_207:
	setx	0x33031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_208:
	setx	0x320303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 2577: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbde46100  ! 2580: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e420e9  ! 2581: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 13)
	.word 0xb5e44000  ! 2585: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_209:
	setx	0x30012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_210:
	setx	0x310304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 2597: SAVE_R	save	%r23, %r0, %r28
	.word 0xb3e58000  ! 2599: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_211:
	setx	0x32003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_109:
	mov	0x3c3, %r14
	.word 0xf6f384a0  ! 2609: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_rd_116:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_212:
	setx	0x300206, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_213:
	setx	0x32012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_214:
	setx	0x300231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5203e  ! 2614: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb52d3001  ! 2618: SLLX_I	sllx	%r20, 0x0001, %r26
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 6)
	.word 0xb5e4c000  ! 2621: SAVE_R	save	%r19, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbde4c000  ! 2630: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_215:
	setx	0x33001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb48421a4  ! 2632: ADDcc_I	addcc 	%r16, 0x01a4, %r26
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 25)
	.word 0xbfe5c000  ! 2636: SAVE_R	save	%r23, %r0, %r31
	.word 0xbab50000  ! 2638: ORNcc_R	orncc 	%r20, %r0, %r29
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_wr_110:
	mov	0x31, %r14
	.word 0xfef38400  ! 2640: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbbe5e0b2  ! 2642: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_rd_117:
	mov	0x7, %r14
	.word 0xfedb8e60  ! 2644: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb7e5c000  ! 2645: SAVE_R	save	%r23, %r0, %r27
	.word 0xb424a1ff  ! 2647: SUB_I	sub 	%r18, 0x01ff, %r26
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 35)
	.word 0xb3e461b0  ! 2650: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_rd_118:
	mov	0x5, %r14
	.word 0xf2db8e60  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb1e4218c  ! 2655: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_216:
	setx	0x330011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaad2116  ! 2661: ANDNcc_I	andncc 	%r20, 0x0116, %r29
	.word 0xb7e4c000  ! 2662: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_217:
	setx	0x32011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_wr_111:
	mov	0x22, %r14
	.word 0xfaf38e40  ! 2671: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1e5e01c  ! 2673: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_218:
	setx	0x310233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_219:
	setx	0x310111, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_119:
	mov	0x30, %r14
	.word 0xf4db8400  ! 2681: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbc848000  ! 2684: ADDcc_R	addcc 	%r18, %r0, %r30
	.word 0xb5e52001  ! 2686: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb825a066  ! 2688: SUB_I	sub 	%r22, 0x0066, %r28
T0_asi_reg_rd_120:
	mov	0x29, %r14
	.word 0xf8db8400  ! 2690: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_rd_121:
	mov	0x13, %r14
	.word 0xf4db84a0  ! 2691: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_wr_112:
	mov	0x26, %r14
	.word 0xf2f389e0  ! 2692: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_rd_122:
	mov	0x1e, %r14
	.word 0xfcdb84a0  ! 2697: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb5e5e1c6  ! 2702: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e520be  ! 2705: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e5a1d0  ! 2706: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde5607f  ! 2709: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 5)
	.word 0xbfe58000  ! 2720: SAVE_R	save	%r22, %r0, %r31
	.word 0xba0ca0e3  ! 2722: AND_I	and 	%r18, 0x00e3, %r29
	.word 0xb5e4c000  ! 2724: SAVE_R	save	%r19, %r0, %r26
	.word 0xbb348000  ! 2729: SRL_R	srl 	%r18, %r0, %r29
	.word 0xbbe5608d  ! 2730: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_220:
	setx	0x31002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0f6  ! 2735: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbd7ce401  ! 2736: MOVR_I	movre	%r19, 0x1, %r30
cpu_intr_0_221:
	setx	0x32032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_123:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 2740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_222:
	setx	0x300126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3dc000  ! 2743: SRA_R	sra 	%r23, %r0, %r30
	.word 0xbde4c000  ! 2746: SAVE_R	save	%r19, %r0, %r30
	.word 0xb7e54000  ! 2748: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 0)
	.word 0xb951c000  ! 2750: RDPR_TL	<illegal instruction>
	.word 0xbfe5a194  ! 2754: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_223:
	setx	0x330223, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_113:
	mov	0x1d, %r14
	.word 0xf2f38400  ! 2763: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb92c7001  ! 2765: SLLX_I	sllx	%r17, 0x0001, %r28
cpu_intr_0_224:
	setx	0x340336, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_124:
	mov	0x19, %r14
	.word 0xfadb8e40  ! 2767: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_225:
	setx	0x340000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7351000  ! 2776: SRLX_R	srlx	%r20, %r0, %r27
T0_asi_reg_rd_125:
	mov	0x2a, %r14
	.word 0xf4db89e0  ! 2777: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb1e58000  ! 2778: SAVE_R	save	%r22, %r0, %r24
	.word 0xb3e42160  ! 2779: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_114:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 2780: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_226:
	setx	0x34012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e4205b  ! 2786: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_227:
	setx	0x360022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_126:
	mov	0x2e, %r14
	.word 0xf0db84a0  ! 2791: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T0_asi_reg_wr_115:
	mov	0x30, %r14
	.word 0xf8f384a0  ! 2795: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb1e54000  ! 2797: SAVE_R	save	%r21, %r0, %r24
	.word 0xb9e50000  ! 2798: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_rd_127:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 2799: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_228:
	setx	0x360134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_229:
	setx	0x334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_230:
	setx	0x35010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e102  ! 2813: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_231:
	setx	0x340318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_116:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 2829: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 24)
	.word 0xb9e58000  ! 2834: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb9e48000  ! 2843: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_wr_117:
	mov	0xe, %r14
	.word 0xf2f38e40  ! 2846: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe58000  ! 2847: SAVE_R	save	%r22, %r0, %r31
	.word 0xb8c50000  ! 2849: ADDCcc_R	addccc 	%r20, %r0, %r28
cpu_intr_0_232:
	setx	0x360112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0a6  ! 2851: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 12)
	.word 0xbde4c000  ! 2857: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_118:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 2863: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_233:
	setx	0x370310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_234:
	setx	0x340028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 2876: SAVE_R	save	%r18, %r0, %r30
	.word 0xb22da155  ! 2877: ANDN_I	andn 	%r22, 0x0155, %r25
cpu_intr_0_235:
	setx	0x34010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 2880: SAVE_R	save	%r22, %r0, %r25
	.word 0xb3e4206f  ! 2881: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e520ee  ! 2882: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 10)
	.word 0xbbe561ed  ! 2887: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb2bda1d8  ! 2889: XNORcc_I	xnorcc 	%r22, 0x01d8, %r25
	.word 0xb5e4612d  ! 2895: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_236:
	setx	0x340326, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_119:
	mov	0x38, %r14
	.word 0xf8f38400  ! 2900: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbfe48000  ! 2904: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_237:
	setx	0x35010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e01e  ! 2910: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_120:
	mov	0x1b, %r14
	.word 0xf4f384a0  ! 2911: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_238:
	setx	0x340311, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_121:
	mov	0x1d, %r14
	.word 0xfcf38e40  ! 2918: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7e52058  ! 2919: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e5e1de  ! 2923: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_122:
	mov	0x6, %r14
	.word 0xfaf38e40  ! 2925: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5e40000  ! 2926: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_123:
	mov	0x7, %r14
	.word 0xfaf389e0  ! 2929: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbf518000  ! 2931: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e40000  ! 2933: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_wr_124:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 2934: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 11)
	.word 0xb5e58000  ! 2942: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_239:
	setx	0x36030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 2945: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_240:
	setx	0x350037, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_125:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 2950: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5e58000  ! 2951: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 29)
	.word 0xb7e4614a  ! 2954: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbde4a195  ! 2959: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_128:
	mov	0x2, %r14
	.word 0xf6db8400  ! 2964: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xba85602a  ! 2965: ADDcc_I	addcc 	%r21, 0x002a, %r29
	.word 0xb7e58000  ! 2967: SAVE_R	save	%r22, %r0, %r27
	.word 0xbde4c000  ! 2968: SAVE_R	save	%r19, %r0, %r30
	.word 0xb3e4e100  ! 2969: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e56126  ! 2971: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_129:
	mov	0x3c1, %r14
	.word 0xfcdb8400  ! 2972: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_0_241:
	setx	0x35031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_126:
	mov	0x3c3, %r14
	.word 0xfcf384a0  ! 2974: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9e40000  ! 2976: SAVE_R	save	%r16, %r0, %r28
	.word 0xb7e5e1c6  ! 2977: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_127:
	mov	0x9, %r14
	.word 0xfaf384a0  ! 2979: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb9e44000  ! 2980: SAVE_R	save	%r17, %r0, %r28
	.word 0xb9e560a5  ! 2981: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e56131  ! 2983: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e58000  ! 2985: SAVE_R	save	%r22, %r0, %r24
	.word 0xb0340000  ! 2986: ORN_R	orn 	%r16, %r0, %r24
T0_asi_reg_rd_130:
	mov	0x17, %r14
	.word 0xf8db8e60  ! 2992: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_0_242:
	setx	0x360233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 2996: SAVE_R	save	%r22, %r0, %r26
	.word 0xb7e48000  ! 3001: SAVE_R	save	%r18, %r0, %r27
	.word 0xb1e50000  ! 3003: SAVE_R	save	%r20, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e56160  ! 3011: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde54000  ! 3014: SAVE_R	save	%r21, %r0, %r30
	.word 0xb41d4000  ! 3015: XOR_R	xor 	%r21, %r0, %r26
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_243:
	setx	0x35002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_131:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 3028: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_0_244:
	setx	0x36002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 3030: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_245:
	setx	0x34032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63c4000  ! 3056: XNOR_R	xnor 	%r17, %r0, %r27
	.word 0xbc2d20c9  ! 3058: ANDN_I	andn 	%r20, 0x00c9, %r30
	.word 0xbbe48000  ! 3059: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_246:
	setx	0x350328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_wr_128:
	mov	0x6, %r14
	.word 0xf2f38400  ! 3063: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 0)
	.word 0xb7518000  ! 3066: RDPR_PSTATE	<illegal instruction>
T0_asi_reg_wr_129:
	mov	0x3, %r14
	.word 0xfaf38e60  ! 3068: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_247:
	setx	0x370224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 3070: SAVE_R	save	%r22, %r0, %r24
	.word 0xbfe5c000  ! 3071: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 21)
	.word 0xba15c000  ! 3074: OR_R	or 	%r23, %r0, %r29
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_248:
	setx	0x360238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a1f3  ! 3078: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_249:
	setx	0x34003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d95606f  ! 3084: WRPR_PSTATE_I	wrpr	%r21, 0x006f, %pstate
cpu_intr_0_250:
	setx	0x350313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_251:
	setx	0x340313, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_132:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 3093: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1e52161  ! 3095: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_rd_133:
	mov	0x15, %r14
	.word 0xf2db8e40  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_252:
	setx	0x350013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb734c000  ! 3106: SRL_R	srl 	%r19, %r0, %r27
	.word 0xb5e40000  ! 3107: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 35)
	.word 0xb32c9000  ! 3122: SLLX_R	sllx	%r18, %r0, %r25
cpu_intr_0_253:
	setx	0x370221, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_134:
	mov	0x33, %r14
	.word 0xf0db89e0  ! 3124: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb7e40000  ! 3125: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_wr_130:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 3126: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb5e44000  ! 3127: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_wr_131:
	mov	0x3, %r14
	.word 0xfef38e80  ! 3134: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb5e5a182  ! 3135: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_132:
	mov	0x15, %r14
	.word 0xfef389e0  ! 3136: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb1520000  ! 3137: RDPR_PIL	<illegal instruction>
	.word 0xb8350000  ! 3143: ORN_R	orn 	%r20, %r0, %r28
	.word 0xb7e521e0  ! 3145: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 30)
	.word 0xbfe5c000  ! 3148: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb5e48000  ! 3157: SAVE_R	save	%r18, %r0, %r26
	.word 0xb1e5615b  ! 3160: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 38)
	.word 0xbfe42160  ! 3164: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e54000  ! 3165: SAVE_R	save	%r21, %r0, %r25
	.word 0xbd351000  ! 3167: SRLX_R	srlx	%r20, %r0, %r30
T0_asi_reg_wr_133:
	mov	0x27, %r14
	.word 0xf4f38e60  ! 3168: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_rd_135:
	mov	0xb, %r14
	.word 0xfedb89e0  ! 3170: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_rd_136:
	mov	0x31, %r14
	.word 0xf4db8e60  ! 3171: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbeacc000  ! 3173: ANDNcc_R	andncc 	%r19, %r0, %r31
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 3)
	.word 0xb1e42122  ! 3175: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde560d6  ! 3179: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb934c000  ! 3185: SRL_R	srl 	%r19, %r0, %r28
	.word 0xbfe52139  ! 3189: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7345000  ! 3192: SRLX_R	srlx	%r17, %r0, %r27
	.word 0xbfe50000  ! 3193: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_254:
	setx	0x370129, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_137:
	mov	0x1, %r14
	.word 0xf0db8400  ! 3196: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_255:
	setx	0x360019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, b)
	.word 0xb1e42024  ! 3214: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_wr_134:
	mov	0x20, %r14
	.word 0xfaf38e80  ! 3216: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 35)
	.word 0xbde5612d  ! 3225: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e58000  ! 3227: SAVE_R	save	%r22, %r0, %r27
	.word 0xb1e5a053  ! 3228: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e5c000  ! 3229: SAVE_R	save	%r23, %r0, %r26
	.word 0xbc0561a3  ! 3230: ADD_I	add 	%r21, 0x01a3, %r30
	.word 0xb1e48000  ! 3232: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_256:
	setx	0x3b0231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_257:
	setx	0x39013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb025e13d  ! 3238: SUB_I	sub 	%r23, 0x013d, %r24
	.word 0xb9e40000  ! 3239: SAVE_R	save	%r16, %r0, %r28
	.word 0xb1e560a7  ! 3241: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e421ed  ! 3242: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe46135  ! 3243: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_rd_138:
	mov	0x34, %r14
	.word 0xf4db8400  ! 3244: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb9e5a1bd  ! 3246: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e5a1da  ! 3247: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_135:
	mov	0x37, %r14
	.word 0xf8f389e0  ! 3249: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb1e40000  ! 3250: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbbe5a00a  ! 3253: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_258:
	setx	0x38032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_259:
	setx	0x3b0135, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_136:
	mov	0x20, %r14
	.word 0xfef389e0  ! 3257: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb734b001  ! 3258: SRLX_I	srlx	%r18, 0x0001, %r27
T0_asi_reg_wr_137:
	mov	0x18, %r14
	.word 0xf0f38e40  ! 3259: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_139:
	mov	0x1b, %r14
	.word 0xf6db8e40  ! 3260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3e5c000  ! 3263: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_260:
	setx	0x3b0317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbde4c000  ! 3274: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_rd_140:
	mov	0x17, %r14
	.word 0xf0db8400  ! 3275: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_138:
	mov	0x10, %r14
	.word 0xf4f389e0  ! 3279: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 28)
	.word 0xbbe56123  ! 3287: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_261:
	setx	0x380332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_262:
	setx	0x390216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e521db  ! 3292: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_263:
	setx	0x3b0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b4a15b  ! 3295: SUBCcc_I	orncc 	%r18, 0x015b, %r25
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbde5a16b  ! 3304: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_139:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 3311: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_rd_141:
	mov	0x27, %r14
	.word 0xf4db84a0  ! 3314: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb1e54000  ! 3316: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_264:
	setx	0x3a023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb7e4616b  ! 3319: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e40000  ! 3322: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_265:
	setx	0x3a003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 3326: SAVE_R	save	%r17, %r0, %r26
	.word 0xb3e461df  ! 3332: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_rd_142:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 3334: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9e5c000  ! 3335: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_143:
	mov	0x1a, %r14
	.word 0xf4db8400  ! 3346: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbb641800  ! 3347: MOVcc_R	<illegal instruction>
	.word 0xb2b50000  ! 3348: SUBCcc_R	orncc 	%r20, %r0, %r25
cpu_intr_0_266:
	setx	0x3a0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd354000  ! 3353: SRL_R	srl 	%r21, %r0, %r30
T0_asi_reg_rd_144:
	mov	0xa, %r14
	.word 0xfcdb8e80  ! 3355: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_145:
	mov	0x9, %r14
	.word 0xf4db89e0  ! 3361: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8995e14c  ! 3363: WRPR_TICK_I	wrpr	%r23, 0x014c, %tick
T0_asi_reg_wr_140:
	mov	0xb, %r14
	.word 0xfef38e80  ! 3364: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_wr_141:
	mov	0x12, %r14
	.word 0xf8f38e40  ! 3365: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfe44000  ! 3367: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_146:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 3375: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_rd_147:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 3381: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 18)
	.word 0xbfe520c0  ! 3383: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 11)
	.word 0xb7e54000  ! 3385: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_rd_148:
	mov	0x7, %r14
	.word 0xf4db8e80  ! 3391: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_wr_142:
	mov	0x3c5, %r14
	.word 0xf0f389e0  ! 3392: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_267:
	setx	0x39021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c5e093  ! 3396: ADDCcc_I	addccc 	%r23, 0x0093, %r27
	.word 0xb1e50000  ! 3397: SAVE_R	save	%r20, %r0, %r24
	.word 0xbfe5a14c  ! 3398: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe5210f  ! 3399: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 26)
	.word 0xb7e4a058  ! 3403: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e4e1c6  ! 3405: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e48000  ! 3409: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 20)
	.word 0xb5e5c000  ! 3413: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_268:
	setx	0x3a0337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_269:
	setx	0x3a0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a192  ! 3416: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_270:
	setx	0x3b012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_271:
	setx	0x3b0315, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_143:
	mov	0xb, %r14
	.word 0xfcf389e0  ! 3421: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_272:
	setx	0x39030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_144:
	mov	0x2b, %r14
	.word 0xf4f38e40  ! 3425: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_145:
	mov	0xb, %r14
	.word 0xf4f38400  ! 3427: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 6)
	.word 0xb2c4a004  ! 3431: ADDCcc_I	addccc 	%r18, 0x0004, %r25
	.word 0xb1e5606f  ! 3433: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_273:
	setx	0x3a003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_274:
	setx	0x39023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e42153  ! 3439: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_275:
	setx	0x3b003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_146:
	mov	0x2, %r14
	.word 0xf0f38400  ! 3443: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb7e4a0a9  ! 3447: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e54000  ! 3448: SAVE_R	save	%r21, %r0, %r24
	.word 0xb9e44000  ! 3449: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_276:
	setx	0x3b000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_277:
	setx	0x3a0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 25)
	.word 0xb9e52036  ! 3456: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_278:
	setx	0x3b0234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_279:
	setx	0x39011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 32)
	.word 0xb1e48000  ! 3466: SAVE_R	save	%r18, %r0, %r24
	.word 0xb9e5e065  ! 3471: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe40000  ! 3473: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_280:
	setx	0x390107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_281:
	setx	0x3a0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e065  ! 3477: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_rd_149:
	mov	0x1d, %r14
	.word 0xf8db8e60  ! 3479: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_0_282:
	setx	0x380315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a181  ! 3485: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_283:
	setx	0x3a003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 3491: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_rd_150:
	mov	0x33, %r14
	.word 0xf6db8e80  ! 3494: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T0_asi_reg_rd_151:
	mov	0x3c3, %r14
	.word 0xfcdb8e60  ! 3495: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_rd_152:
	mov	0x1, %r14
	.word 0xf2db89e0  ! 3496: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, b)
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 29)
	.word 0xb1e40000  ! 3500: SAVE_R	save	%r16, %r0, %r24
	.word 0xbfe5a14f  ! 3502: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 26)
	.word 0xb9e5a034  ! 3506: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_284:
	setx	0x3b0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 3508: SAVE_R	save	%r22, %r0, %r27
	.word 0xbde5a161  ! 3509: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe4a02c  ! 3511: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb48c0000  ! 3513: ANDcc_R	andcc 	%r16, %r0, %r26
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 10)
	.word 0xb2448000  ! 3529: ADDC_R	addc 	%r18, %r0, %r25
T0_asi_reg_rd_153:
	mov	0x1c, %r14
	.word 0xfadb8400  ! 3530: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_285:
	setx	0x390120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 32)
	.word 0xba25605e  ! 3540: SUB_I	sub 	%r21, 0x005e, %r29
	.word 0xbde5612f  ! 3543: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e5607e  ! 3544: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_286:
	setx	0x3b0221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_147:
	mov	0x34, %r14
	.word 0xfcf384a0  ! 3550: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbfe4a0ed  ! 3551: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_287:
	setx	0x3b0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43c8000  ! 3557: XNOR_R	xnor 	%r18, %r0, %r26
cpu_intr_0_288:
	setx	0x3b0110, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_154:
	mov	0xa, %r14
	.word 0xfcdb89e0  ! 3559: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 0)
	.word 0xbfe4604f  ! 3561: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e4616b  ! 3562: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbead0000  ! 3563: ANDNcc_R	andncc 	%r20, %r0, %r31
	.word 0xbde48000  ! 3565: SAVE_R	save	%r18, %r0, %r30
	.word 0xb0158000  ! 3566: OR_R	or 	%r22, %r0, %r24
T0_asi_reg_rd_155:
	mov	0x3c0, %r14
	.word 0xf2db8400  ! 3570: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb8148000  ! 3573: OR_R	or 	%r18, %r0, %r28
	.word 0xb9e58000  ! 3576: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_289:
	setx	0x3b003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e561e1  ! 3584: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e40000  ! 3585: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_290:
	setx	0x3a0008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbbe40000  ! 3588: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, c)
	.word 0xbde44000  ! 3591: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_156:
	mov	0x10, %r14
	.word 0xf4db84a0  ! 3592: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb9e5e03b  ! 3594: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e5c000  ! 3595: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 29)
	.word 0xb9e521a6  ! 3599: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe4e172  ! 3602: SAVE_I	save	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_291:
	setx	0x3a0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 3608: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_wr_148:
	mov	0x2a, %r14
	.word 0xf0f38e60  ! 3609: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb12cc000  ! 3613: SLL_R	sll 	%r19, %r0, %r24
	.word 0xb7e50000  ! 3614: SAVE_R	save	%r20, %r0, %r27
	.word 0xbde5c000  ! 3615: SAVE_R	save	%r23, %r0, %r30
	.word 0xb5e44000  ! 3617: SAVE_R	save	%r17, %r0, %r26
	.word 0xbde420ed  ! 3620: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe48000  ! 3625: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_157:
	mov	0x6, %r14
	.word 0xf2db8e40  ! 3626: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_292:
	setx	0x3b0118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, a)
	.word 0xbde4c000  ! 3638: SAVE_R	save	%r19, %r0, %r30
	.word 0xb9e4e0ad  ! 3639: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_rd_158:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 3642: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_293:
	setx	0x380106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e52102  ! 3646: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 14)
	.word 0xbde4a015  ! 3652: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb40c2136  ! 3653: AND_I	and 	%r16, 0x0136, %r26
T0_asi_reg_wr_149:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 3655: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T0_asi_reg_rd_159:
	mov	0x1c, %r14
	.word 0xf8db8e40  ! 3656: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_294:
	setx	0x3b0225, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_160:
	mov	0x2, %r14
	.word 0xf2db89e0  ! 3663: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_wr_150:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 3665: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_295:
	setx	0x390308, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_151:
	mov	0x3c4, %r14
	.word 0xf0f38e60  ! 3668: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbca561d9  ! 3670: SUBcc_I	subcc 	%r21, 0x01d9, %r30
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 32)
	.word 0xb9e46176  ! 3675: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_rd_161:
	mov	0x2f, %r14
	.word 0xf6db8e60  ! 3676: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_wr_152:
	mov	0x1d, %r14
	.word 0xfcf38e40  ! 3681: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_296:
	setx	0x3b033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 3688: MOVcc_I	<illegal instruction>
	.word 0xb7e40000  ! 3693: SAVE_R	save	%r16, %r0, %r27
	.word 0xbbe520c3  ! 3694: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 33)
	.word 0xb7e5e0f4  ! 3697: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e4c000  ! 3700: SAVE_R	save	%r19, %r0, %r27
	.word 0xb5e5e05e  ! 3702: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_297:
	setx	0x3d0208, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_162:
	mov	0x35, %r14
	.word 0xfcdb84a0  ! 3706: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_0_298:
	setx	0x3f0336, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_163:
	mov	0x2e, %r14
	.word 0xfcdb8400  ! 3712: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb1e5c000  ! 3713: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_rd_164:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 3716: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7e54000  ! 3718: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 12)
	.word 0xb9e560ba  ! 3724: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb09da013  ! 3729: XORcc_I	xorcc 	%r22, 0x0013, %r24
cpu_intr_0_299:
	setx	0x3d031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 3734: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_300:
	setx	0x3c0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe460a8  ! 3740: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_301:
	setx	0x3d0122, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_153:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 3744: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_302:
	setx	0x3d0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e144  ! 3751: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_303:
	setx	0x3c0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 3753: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_304:
	setx	0x3c023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_165:
	mov	0x1b, %r14
	.word 0xfcdb84a0  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_wr_154:
	mov	0x1d, %r14
	.word 0xfef38e40  ! 3761: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_305:
	setx	0x3f0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde420ae  ! 3767: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_155:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 3771: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbbe40000  ! 3773: SAVE_R	save	%r16, %r0, %r29
	.word 0xb9e44000  ! 3776: SAVE_R	save	%r17, %r0, %r28
	.word 0xbe0d202e  ! 3777: AND_I	and 	%r20, 0x002e, %r31
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 0)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbe440000  ! 3789: ADDC_R	addc 	%r16, %r0, %r31
	.word 0xb1e4a164  ! 3790: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 35)
	.word 0xbe452175  ! 3792: ADDC_I	addc 	%r20, 0x0175, %r31
	.word 0xb1643801  ! 3797: MOVcc_I	<illegal instruction>
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb7e4a125  ! 3801: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e58000  ! 3802: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb3e460aa  ! 3806: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_306:
	setx	0x3f0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a44000  ! 3809: SUBcc_R	subcc 	%r17, %r0, %r25
	.word 0xb5e4611d  ! 3811: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e4c000  ! 3812: SAVE_R	save	%r19, %r0, %r27
	.word 0xb1e46171  ! 3813: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_rd_166:
	mov	0x1b, %r14
	.word 0xf6db8e60  ! 3815: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 0)
	.word 0xb1e4219a  ! 3817: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde5c000  ! 3819: SAVE_R	save	%r23, %r0, %r30
	.word 0xb7e44000  ! 3821: SAVE_R	save	%r17, %r0, %r27
	.word 0xbbe4e121  ! 3824: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_156:
	mov	0x6, %r14
	.word 0xfcf38e60  ! 3826: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_wr_157:
	mov	0x3c3, %r14
	.word 0xf2f38e60  ! 3831: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_rd_167:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 3833: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_rd_168:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 3834: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_0_307:
	setx	0x3f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_158:
	mov	0x8, %r14
	.word 0xf2f389e0  ! 3840: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb5e54000  ! 3844: SAVE_R	save	%r21, %r0, %r26
	.word 0xb7e54000  ! 3845: SAVE_R	save	%r21, %r0, %r27
	.word 0xb2350000  ! 3851: ORN_R	orn 	%r20, %r0, %r25
	.word 0xba0ce0fd  ! 3853: AND_I	and 	%r19, 0x00fd, %r29
T0_asi_reg_rd_169:
	mov	0x1f, %r14
	.word 0xfadb8e60  ! 3854: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_159:
	mov	0x30, %r14
	.word 0xf0f384a0  ! 3856: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_160:
	mov	0x9, %r14
	.word 0xf4f389e0  ! 3860: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbfe5e0c2  ! 3863: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e48000  ! 3865: SAVE_R	save	%r18, %r0, %r26
	.word 0xbc950000  ! 3866: ORcc_R	orcc 	%r20, %r0, %r30
	.word 0xba058000  ! 3867: ADD_R	add 	%r22, %r0, %r29
	.word 0xb7e44000  ! 3868: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_308:
	setx	0x3c023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 3872: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_170:
	mov	0x30, %r14
	.word 0xfedb8e40  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0x8f902000  ! 3878: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb3347001  ! 3880: SRLX_I	srlx	%r17, 0x0001, %r25
	.word 0xb7e4c000  ! 3881: SAVE_R	save	%r19, %r0, %r27
	.word 0xbfe48000  ! 3883: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_309:
	setx	0x3e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba2cc000  ! 3893: ANDN_R	andn 	%r19, %r0, %r29
	.word 0xbe2d61cc  ! 3894: ANDN_I	andn 	%r21, 0x01cc, %r31
	.word 0xb1357001  ! 3896: SRLX_I	srlx	%r21, 0x0001, %r24
T0_asi_reg_rd_171:
	mov	0x13, %r14
	.word 0xfcdb8e60  ! 3898: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb3e5e078  ! 3899: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_wr_161:
	mov	0x18, %r14
	.word 0xf2f38e40  ! 3900: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbe4c000  ! 3901: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_172:
	mov	0x3c1, %r14
	.word 0xfcdb8400  ! 3909: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb1e520ad  ! 3911: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_310:
	setx	0x3d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 3915: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_162:
	mov	0x31, %r14
	.word 0xfef38400  ! 3916: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb5e54000  ! 3917: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 38)
	.word 0xb62c4000  ! 3923: ANDN_R	andn 	%r17, %r0, %r27
	.word 0xbde58000  ! 3924: SAVE_R	save	%r22, %r0, %r30
	.word 0xbbe40000  ! 3927: SAVE_R	save	%r16, %r0, %r29
	.word 0xb9e4e117  ! 3929: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb0bc0000  ! 3931: XNORcc_R	xnorcc 	%r16, %r0, %r24
T0_asi_reg_wr_163:
	mov	0x1d, %r14
	.word 0xf8f389e0  ! 3932: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_rd_173:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 3934: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_311:
	setx	0x3f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e1cd  ! 3938: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e5e08f  ! 3941: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e5e0e2  ! 3946: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_312:
	setx	0x3d0024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_313:
	setx	0x3d0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 3953: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_314:
	setx	0x3f0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5209b  ! 3956: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_315:
	setx	0x3d002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 3959: SAVE_R	save	%r22, %r0, %r24
	.word 0xb1e52133  ! 3960: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e461bf  ! 3964: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbb2cf001  ! 3966: SLLX_I	sllx	%r19, 0x0001, %r29
cpu_intr_0_316:
	setx	0x3f023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a196  ! 3969: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_wr_164:
	mov	0x36, %r14
	.word 0xfaf38e40  ! 3973: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3e50000  ! 3974: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 30)
	.word 0xbfe54000  ! 3979: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 15)
	.word 0xb1e5a1ad  ! 3981: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_317:
	setx	0x3c033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 3991: SAVE_R	save	%r17, %r0, %r31
	.word 0xb9e4e199  ! 3992: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_174:
	mov	0x27, %r14
	.word 0xf2db8e80  ! 3996: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbbe4a02d  ! 3997: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_318:
	setx	0x3f0234, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_175:
	mov	0x10, %r14
	.word 0xf4db8e40  ! 4000: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbca48000  ! 4002: SUBcc_R	subcc 	%r18, %r0, %r30
	.word 0xbfe5e1b0  ! 4003: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_wr_165:
	mov	0x32, %r14
	.word 0xf0f38400  ! 4005: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 8)
	.word 0xb434a14e  ! 4008: SUBC_I	orn 	%r18, 0x014e, %r26
	.word 0xb9e4c000  ! 4009: SAVE_R	save	%r19, %r0, %r28
	.word 0xb1e4a0ab  ! 4010: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe5a126  ! 4011: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_319:
	setx	0x3d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a18a  ! 4017: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe5c000  ! 4018: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_320:
	setx	0x3f0025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_176:
	mov	0x13, %r14
	.word 0xf6db84a0  ! 4035: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_0_321:
	setx	0x3c0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7643801  ! 4038: MOVcc_I	<illegal instruction>
	.word 0xbfe54000  ! 4040: SAVE_R	save	%r21, %r0, %r31
	.word 0xbbe5616d  ! 4041: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e56027  ! 4042: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbe1ca0cf  ! 4052: XOR_I	xor 	%r18, 0x00cf, %r31
	.word 0xb0944000  ! 4055: ORcc_R	orcc 	%r17, %r0, %r24
T0_asi_reg_rd_177:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 4058: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7e5e045  ! 4059: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e50000  ! 4060: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_166:
	mov	0x11, %r14
	.word 0xf4f38e60  ! 4062: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb17ce401  ! 4064: MOVR_I	movre	%r19, 0x1, %r24
	.word 0xbde5a1a8  ! 4065: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e4c000  ! 4068: SAVE_R	save	%r19, %r0, %r28
	.word 0xb4352141  ! 4070: ORN_I	orn 	%r20, 0x0141, %r26
T0_asi_reg_rd_178:
	mov	0x2c, %r14
	.word 0xf2db8e40  ! 4071: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3e521f7  ! 4075: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_167:
	mov	0x2a, %r14
	.word 0xfcf389e0  ! 4076: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_179:
	mov	0x3c4, %r14
	.word 0xfadb8e60  ! 4078: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbde48000  ! 4080: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_322:
	setx	0x3c0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e1a6  ! 4083: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_180:
	mov	0x28, %r14
	.word 0xf8db8e40  ! 4085: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_168:
	mov	0x1, %r14
	.word 0xfaf389e0  ! 4086: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_181:
	mov	0x15, %r14
	.word 0xf6db8e40  ! 4088: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb5e46153  ! 4091: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde52195  ! 4093: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbc8521b0  ! 4099: ADDcc_I	addcc 	%r20, 0x01b0, %r30
T0_asi_reg_rd_182:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 4103: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_169:
	mov	0x1e, %r14
	.word 0xf6f38e60  ! 4105: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e4e049  ! 4113: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_183:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 4115: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 14)
	.word 0xb9e4e1b0  ! 4119: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 15)
	.word 0xb9e54000  ! 4124: SAVE_R	save	%r21, %r0, %r28
	.word 0xb3e4c000  ! 4126: SAVE_R	save	%r19, %r0, %r25
	.word 0xb9e44000  ! 4128: SAVE_R	save	%r17, %r0, %r28
	.word 0xb3e42042  ! 4132: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 18)
	.word 0xb3e5e00a  ! 4135: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e48000  ! 4140: SAVE_R	save	%r18, %r0, %r24
	.word 0xbde5c000  ! 4144: SAVE_R	save	%r23, %r0, %r30
	.word 0xb00d4000  ! 4146: AND_R	and 	%r21, %r0, %r24
	.word 0xb5e40000  ! 4148: SAVE_R	save	%r16, %r0, %r26
	.word 0xbde4e1d3  ! 4149: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_323:
	setx	0x42000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_wr_170:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 4159: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_wr_171:
	mov	0x3c5, %r14
	.word 0xf0f384a0  ! 4161: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbfe54000  ! 4167: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_wr_172:
	mov	0x13, %r14
	.word 0xf2f389e0  ! 4169: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbc94c000  ! 4170: ORcc_R	orcc 	%r19, %r0, %r30
	.word 0xbfe5a14b  ! 4172: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_wr_173:
	mov	0x23, %r14
	.word 0xfcf38e60  ! 4174: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_324:
	setx	0x430319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 4180: SAVE_R	save	%r22, %r0, %r26
	.word 0xb5e4e02b  ! 4183: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e5c000  ! 4184: SAVE_R	save	%r23, %r0, %r25
	.word 0xbfe4a1f7  ! 4186: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e48000  ! 4188: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_184:
	mov	0x4, %r14
	.word 0xf6db89e0  ! 4196: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_rd_185:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 4198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3e4e02d  ! 4199: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_174:
	mov	0x11, %r14
	.word 0xf8f38e40  ! 4202: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 26)
	.word 0xbfe5a0a3  ! 4206: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbaad6020  ! 4209: ANDNcc_I	andncc 	%r21, 0x0020, %r29
cpu_intr_0_325:
	setx	0x410304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_326:
	setx	0x41021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_327:
	setx	0x42001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9641800  ! 4218: MOVcc_R	<illegal instruction>
	.word 0xbfe52023  ! 4220: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 4)
	.word 0xbbe50000  ! 4222: SAVE_R	save	%r20, %r0, %r29
	.word 0xbde56111  ! 4223: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb1e4c000  ! 4225: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_328:
	setx	0x410022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b4c000  ! 4231: SUBCcc_R	orncc 	%r19, %r0, %r27
	.word 0xb7e44000  ! 4232: SAVE_R	save	%r17, %r0, %r27
	.word 0xb7e520bd  ! 4233: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb92c7001  ! 4236: SLLX_I	sllx	%r17, 0x0001, %r28
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_329:
	setx	0x410111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_175:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 4242: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb845a054  ! 4251: ADDC_I	addc 	%r22, 0x0054, %r28
	.word 0xbe0da090  ! 4260: AND_I	and 	%r22, 0x0090, %r31
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb0a5e08b  ! 4263: SUBcc_I	subcc 	%r23, 0x008b, %r24
	.word 0xbbe52048  ! 4264: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_330:
	setx	0x40022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 4266: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_331:
	setx	0x410215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4203b  ! 4270: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_332:
	setx	0x410018, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_186:
	mov	0x10, %r14
	.word 0xf0db89e0  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb7e48000  ! 4279: SAVE_R	save	%r18, %r0, %r27
	.word 0xbfe48000  ! 4280: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_333:
	setx	0x420127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 4283: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 16)
	.word 0xb5e58000  ! 4286: SAVE_R	save	%r22, %r0, %r26
	.word 0xbe354000  ! 4287: ORN_R	orn 	%r21, %r0, %r31
	.word 0xbde5c000  ! 4288: SAVE_R	save	%r23, %r0, %r30
	.word 0xb1e44000  ! 4289: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_187:
	mov	0xc, %r14
	.word 0xf2db8e80  ! 4290: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 30)
	.word 0xbbe5c000  ! 4294: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_334:
	setx	0x41031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbde460b4  ! 4308: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e54000  ! 4309: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_335:
	setx	0x420210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 30)
	.word 0xbde54000  ! 4316: SAVE_R	save	%r21, %r0, %r30
	.word 0xbbe4217a  ! 4324: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_176:
	mov	0x14, %r14
	.word 0xf6f38e80  ! 4327: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbde50000  ! 4328: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, a)
	.word 0xbfe40000  ! 4333: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_wr_177:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 4336: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_336:
	setx	0x420237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 4339: SAVE_R	save	%r21, %r0, %r25
	.word 0xb2b40000  ! 4340: ORNcc_R	orncc 	%r16, %r0, %r25
	.word 0xb1e5c000  ! 4341: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_337:
	setx	0x400116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 4350: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_178:
	mov	0x3c7, %r14
	.word 0xfcf38400  ! 4352: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_188:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 4353: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 38)
	.word 0xb7e40000  ! 4355: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_wr_179:
	mov	0x2c, %r14
	.word 0xfaf38e40  ! 4356: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_338:
	setx	0x400327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_339:
	setx	0x42000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_340:
	setx	0x400104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b56122  ! 4367: ORNcc_I	orncc 	%r21, 0x0122, %r28
cpu_intr_0_341:
	setx	0x410220, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_189:
	mov	0x26, %r14
	.word 0xf8db89e0  ! 4370: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_wr_180:
	mov	0x1f, %r14
	.word 0xf2f38e80  ! 4372: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_rd_190:
	mov	0x16, %r14
	.word 0xf6db8400  ! 4373: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbfe521fe  ! 4374: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e4a1c9  ! 4377: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe56096  ! 4379: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xba15c000  ! 4381: OR_R	or 	%r23, %r0, %r29
	.word 0xb00d0000  ! 4383: AND_R	and 	%r20, %r0, %r24
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 18)
	.word 0xb1e44000  ! 4387: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_191:
	mov	0x18, %r14
	.word 0xf6db89e0  ! 4391: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbbe420e3  ! 4392: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_181:
	mov	0x13, %r14
	.word 0xf0f389e0  ! 4394: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbfe4c000  ! 4395: SAVE_R	save	%r19, %r0, %r31
	.word 0xbfe52197  ! 4398: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb48da031  ! 4399: ANDcc_I	andcc 	%r22, 0x0031, %r26
	.word 0xb13cc000  ! 4400: SRA_R	sra 	%r19, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e40000  ! 4407: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_342:
	setx	0x430236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_343:
	setx	0x400222, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_192:
	mov	0x7, %r14
	.word 0xfcdb8e80  ! 4422: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbbe56181  ! 4424: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_344:
	setx	0x41022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb22de1a9  ! 4436: ANDN_I	andn 	%r23, 0x01a9, %r25
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 20)
	.word 0xb7643801  ! 4438: MOVcc_I	<illegal instruction>
cpu_intr_0_345:
	setx	0x410026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_346:
	setx	0x43000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 4444: SAVE_R	save	%r16, %r0, %r27
	.word 0xb3e44000  ! 4446: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_347:
	setx	0x410331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_348:
	setx	0x41033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_193:
	mov	0x34, %r14
	.word 0xf6db8e60  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb7e5a108  ! 4457: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe5a181  ! 4461: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_rd_194:
	mov	0x0, %r14
	.word 0xf8db89e0  ! 4470: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 16)
	.word 0xb7e58000  ! 4472: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e4a0e8  ! 4474: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_349:
	setx	0x40023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_182:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 4480: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_rd_195:
	mov	0x34, %r14
	.word 0xfadb89e0  ! 4481: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbde4217e  ! 4482: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_183:
	mov	0x18, %r14
	.word 0xf0f38e40  ! 4486: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb0bc60a8  ! 4487: XNORcc_I	xnorcc 	%r17, 0x00a8, %r24
T0_asi_reg_rd_196:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 4488: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb3e5e06e  ! 4489: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_350:
	setx	0x420211, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_184:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 4493: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_185:
	mov	0x1b, %r14
	.word 0xf4f38e60  ! 4494: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_rd_197:
	mov	0x3c8, %r14
	.word 0xfedb8e80  ! 4497: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbbe561bd  ! 4498: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e58000  ! 4499: SAVE_R	save	%r22, %r0, %r28
	.word 0xb7358000  ! 4500: SRL_R	srl 	%r22, %r0, %r27
	.word 0xbfe44000  ! 4501: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_351:
	setx	0x400012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4956165  ! 4507: ORcc_I	orcc 	%r21, 0x0165, %r26
	.word 0xb7e4c000  ! 4508: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_wr_186:
	mov	0x7, %r14
	.word 0xfef384a0  ! 4513: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_352:
	setx	0x43021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba140000  ! 4517: OR_R	or 	%r16, %r0, %r29
T0_asi_reg_rd_198:
	mov	0x1a, %r14
	.word 0xfadb8e60  ! 4518: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_353:
	setx	0x2021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a1c2  ! 4522: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_rd_199:
	mov	0x16, %r14
	.word 0xf0db8e40  ! 4527: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, d)
	.word 0xb2b46012  ! 4529: ORNcc_I	orncc 	%r17, 0x0012, %r25
	.word 0xbfe4e03a  ! 4531: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e44000  ! 4532: SAVE_R	save	%r17, %r0, %r24
	.word 0xb9e5a033  ! 4533: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_200:
	mov	0x2b, %r14
	.word 0xf6db8e40  ! 4538: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_201:
	mov	0x25, %r14
	.word 0xf0db84a0  ! 4539: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbfe54000  ! 4540: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 2a)
	.word 0x8794602a  ! 4544: WRPR_TT_I	wrpr	%r17, 0x002a, %tt
cpu_intr_0_354:
	setx	0x410239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a180  ! 4547: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_355:
	setx	0x400023, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_202:
	mov	0x12, %r14
	.word 0xf6db8e40  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfe5e02f  ! 4554: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde5c000  ! 4557: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_356:
	setx	0x43033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_357:
	setx	0x430010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_rd_203:
	mov	0x36, %r14
	.word 0xfadb8e60  ! 4564: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbfe46178  ! 4565: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe50000  ! 4567: SAVE_R	save	%r20, %r0, %r31
	.word 0xb5e42172  ! 4568: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbc24604a  ! 4570: SUB_I	sub 	%r17, 0x004a, %r30
T0_asi_reg_wr_187:
	mov	0xd, %r14
	.word 0xf2f384a0  ! 4573: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5e40000  ! 4575: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_358:
	setx	0x420102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_359:
	setx	0x400104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_wr_188:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 4590: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7e54000  ! 4594: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 31)
	.word 0xb1e54000  ! 4599: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_wr_189:
	mov	0x1e, %r14
	.word 0xfcf38400  ! 4601: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb6b54000  ! 4604: SUBCcc_R	orncc 	%r21, %r0, %r27
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 20)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e5a09d  ! 4610: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_204:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 4614: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_205:
	mov	0x25, %r14
	.word 0xf8db8400  ! 4615: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbde58000  ! 4616: SAVE_R	save	%r22, %r0, %r30
	.word 0xb1e42197  ! 4617: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e5e169  ! 4618: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 24)
	.word 0xb5e40000  ! 4620: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_wr_190:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 4626: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e58000  ! 4631: SAVE_R	save	%r22, %r0, %r25
	.word 0xb9e54000  ! 4632: SAVE_R	save	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e44000  ! 4640: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_360:
	setx	0x45000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_361:
	setx	0x47012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e52103  ! 4645: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e40000  ! 4647: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_362:
	setx	0x44022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 4650: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_206:
	mov	0x3c8, %r14
	.word 0xf6db8e80  ! 4651: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 16)
	.word 0xbb510000  ! 4653: RDPR_TICK	<illegal instruction>
T0_asi_reg_wr_191:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 4654: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_363:
	setx	0x46021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 4661: SAVE_R	save	%r21, %r0, %r29
	.word 0xbc958000  ! 4666: ORcc_R	orcc 	%r22, %r0, %r30
	.word 0xb8b460c4  ! 4667: ORNcc_I	orncc 	%r17, 0x00c4, %r28
cpu_intr_0_364:
	setx	0x440223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879460cb  ! 4672: WRPR_TT_I	wrpr	%r17, 0x00cb, %tt
	.word 0xb0c461cd  ! 4675: ADDCcc_I	addccc 	%r17, 0x01cd, %r24
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb1e48000  ! 4677: SAVE_R	save	%r18, %r0, %r24
	.word 0xb9e5a04d  ! 4680: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e420b1  ! 4682: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_wr_192:
	mov	0x14, %r14
	.word 0xfef38e60  ! 4685: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_365:
	setx	0x44023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 4688: SAVE_R	save	%r20, %r0, %r30
	.word 0xbbe50000  ! 4689: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_wr_193:
	mov	0x1c, %r14
	.word 0xfcf384a0  ! 4691: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 24)
	.word 0x8d94614b  ! 4693: WRPR_PSTATE_I	wrpr	%r17, 0x014b, %pstate
	.word 0xbc04210d  ! 4694: ADD_I	add 	%r16, 0x010d, %r30
cpu_intr_0_366:
	setx	0x44032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe520ea  ! 4697: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 19)
	.word 0xb9e40000  ! 4701: SAVE_R	save	%r16, %r0, %r28
	.word 0xb23d4000  ! 4702: XNOR_R	xnor 	%r21, %r0, %r25
cpu_intr_0_367:
	setx	0x460021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8de04c  ! 4704: ANDcc_I	andcc 	%r23, 0x004c, %r29
	.word 0xbde4c000  ! 4705: SAVE_R	save	%r19, %r0, %r30
	.word 0xb5e46186  ! 4707: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe50000  ! 4710: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 22)
	.word 0xb3e54000  ! 4716: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_194:
	mov	0x37, %r14
	.word 0xf2f389e0  ! 4725: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb7e5a0f0  ! 4727: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_368:
	setx	0x470123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33c8000  ! 4732: SRA_R	sra 	%r18, %r0, %r25
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_rd_207:
	mov	0xe, %r14
	.word 0xf4db8e60  ! 4735: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_369:
	setx	0x45020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_195:
	mov	0x4, %r14
	.word 0xfcf389e0  ! 4741: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_wr_196:
	mov	0x14, %r14
	.word 0xfef38400  ! 4746: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb9e40000  ! 4747: SAVE_R	save	%r16, %r0, %r28
	.word 0xb3e5c000  ! 4752: SAVE_R	save	%r23, %r0, %r25
	.word 0xbfe5a085  ! 4755: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 32)
	.word 0xbde5e0d3  ! 4759: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_208:
	mov	0x2e, %r14
	.word 0xf0db84a0  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbde5e136  ! 4763: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb2050000  ! 4764: ADD_R	add 	%r20, %r0, %r25
	.word 0xbde40000  ! 4766: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_wr_197:
	mov	0x1d, %r14
	.word 0xf2f38e80  ! 4768: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb1e420a5  ! 4771: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e420a1  ! 4774: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_396:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_396), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb7641800  ! 4778: MOVcc_R	<illegal instruction>
	.word 0xb9e460b1  ! 4781: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_rd_209:
	mov	0x12, %r14
	.word 0xf6db84a0  ! 4783: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_0_370:
	setx	0x440201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_397:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_397), 16, 16)) -> intp(0, 0, 38)
	.word 0xb9e5c000  ! 4790: SAVE_R	save	%r23, %r0, %r28
	.word 0xb1e5c000  ! 4791: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_198:
	mov	0x31, %r14
	.word 0xf4f38e60  ! 4794: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e4c000  ! 4799: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_wr_199:
	mov	0xb, %r14
	.word 0xfaf38e80  ! 4800: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_398:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_398), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_399:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_399), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_371:
	setx	0x470035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 4810: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_372:
	setx	0x440310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09ca1e9  ! 4813: XORcc_I	xorcc 	%r18, 0x01e9, %r24
iob_intr_0_400:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_400), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_401:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_401), 16, 16)) -> intp(0, 0, 4)
	.word 0xb3e4a1ba  ! 4820: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_402:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_402), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_373:
	setx	0x470028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a1f7  ! 4833: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb6344000  ! 4834: SUBC_R	orn 	%r17, %r0, %r27
	.word 0xb9e54000  ! 4835: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_374:
	setx	0x47033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcad4000  ! 4838: ANDNcc_R	andncc 	%r21, %r0, %r30
	.word 0xbde50000  ! 4839: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_403:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_403), 16, 16)) -> intp(0, 0, 34)
	.word 0xbbe40000  ! 4841: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_210:
	mov	0x20, %r14
	.word 0xfcdb8400  ! 4846: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbde420c9  ! 4847: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_404:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_404), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_405:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_405), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb1e44000  ! 4850: SAVE_R	save	%r17, %r0, %r24
	.word 0xbfe4e02d  ! 4853: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_406:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_406), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_407:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_407), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb5e54000  ! 4861: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_375:
	setx	0x470120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_408:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_408), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_200:
	mov	0x3c4, %r14
	.word 0xfef38400  ! 4865: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb151c000  ! 4866: RDPR_TL	<illegal instruction>
	.word 0xb9e5e1f6  ! 4869: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e52019  ! 4870: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe5a114  ! 4871: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_376:
	setx	0x440204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_409:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_409), 16, 16)) -> intp(0, 0, 25)
	.word 0xb9e5605b  ! 4878: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e46011  ! 4880: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_410:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_410), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb9e48000  ! 4883: SAVE_R	save	%r18, %r0, %r28
	.word 0xbca46132  ! 4885: SUBcc_I	subcc 	%r17, 0x0132, %r30
	.word 0xb7e50000  ! 4887: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_377:
	setx	0x450112, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_211:
	mov	0x32, %r14
	.word 0xf4db89e0  ! 4891: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_378:
	setx	0x470128, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_201:
	mov	0x10, %r14
	.word 0xfcf38e60  ! 4893: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb68d0000  ! 4895: ANDcc_R	andcc 	%r20, %r0, %r27
T0_asi_reg_rd_212:
	mov	0x0, %r14
	.word 0xf0db8e80  ! 4896: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_411:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_411), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_412:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_412), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_413:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_413), 16, 16)) -> intp(0, 0, 4)
	.word 0xbfe5c000  ! 4906: SAVE_R	save	%r23, %r0, %r31
	.word 0xb03de046  ! 4909: XNOR_I	xnor 	%r23, 0x0046, %r24
iob_intr_0_414:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_414), 16, 16)) -> intp(0, 0, 36)
	.word 0xbbe5617f  ! 4915: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_379:
	setx	0x45020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_380:
	setx	0x450137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_381:
	setx	0x45023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_382:
	setx	0x470116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 4922: SAVE_R	save	%r16, %r0, %r28
	.word 0xbbe5e04a  ! 4923: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbe248000  ! 4925: SUB_R	sub 	%r18, %r0, %r31
cpu_intr_0_383:
	setx	0x440017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_415:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_415), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_rd_213:
	mov	0x29, %r14
	.word 0xf8db84a0  ! 4933: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_384:
	setx	0x45033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e1b7  ! 4935: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_214:
	mov	0x2, %r14
	.word 0xf2db8400  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_385:
	setx	0x450114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_386:
	setx	0x470304, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_215:
	mov	0xb, %r14
	.word 0xfcdb8400  ! 4945: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbfe46134  ! 4946: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbf3d0000  ! 4949: SRA_R	sra 	%r20, %r0, %r31
	.word 0xb7e44000  ! 4950: SAVE_R	save	%r17, %r0, %r27
	.word 0xbbe58000  ! 4951: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_202:
	mov	0x3c3, %r14
	.word 0xf6f384a0  ! 4952: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb3e4a10a  ! 4953: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_387:
	setx	0x44001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 4956: SAVE_R	save	%r23, %r0, %r29
	.word 0xb9e58000  ! 4957: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_wr_203:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 4959: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_388:
	setx	0x45030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_416:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_416), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb1e58000  ! 4968: SAVE_R	save	%r22, %r0, %r24
	.word 0xbbe5c000  ! 4969: SAVE_R	save	%r23, %r0, %r29
	.word 0xbbe58000  ! 4974: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_417:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_417), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_389:
	setx	0x440237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_418:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_418), 16, 16)) -> intp(0, 0, 32)
	.word 0xb9e42091  ! 4986: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e5e042  ! 4987: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb2b4e0a8  ! 4989: ORNcc_I	orncc 	%r19, 0x00a8, %r25
	.word 0xb3e4c000  ! 4990: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_419:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_419), 16, 16)) -> intp(0, 0, b)
iob_intr_0_420:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_420), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_421:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_421), 16, 16)) -> intp(0, 0, 1a)
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
	.word 0xfe742153  ! 1: STX_I	stx	%r31, [%r16 + 0x0153]
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982fd0  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd0, %hpstate
	.word 0xf6250000  ! 6: STW_R	stw	%r27, [%r20 + %r0]
cpu_intr_3_0:
	setx	0x18030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_0:
	mov	0x34, %r14
	.word 0xf4db8e40  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_1:
	setx	0x1e020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28d0000  ! 12: ANDcc_R	andcc 	%r20, %r0, %r25
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_0:
	mov	0x19, %r14
	.word 0xf8f389e0  ! 14: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_wr_1:
	mov	0xe, %r14
	.word 0xf4f38400  ! 15: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_rd_1:
	mov	0x9, %r14
	.word 0xfcdb8400  ! 18: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfe246000  ! 19: STW_I	stw	%r31, [%r17 + 0x0000]
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 3c)
	.word 0xbac4210f  ! 25: ADDCcc_I	addccc 	%r16, 0x010f, %r29
	.word 0xfaad8020  ! 26: STBA_R	stba	%r29, [%r22 + %r0] 0x01
cpu_intr_3_2:
	setx	0x1c0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_3:
	setx	0x1f021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaad0020  ! 33: STBA_R	stba	%r29, [%r20 + %r0] 0x01
	.word 0xf2a4a0a2  ! 36: STWA_I	stwa	%r25, [%r18 + 0x00a2] %asi
	.word 0xf8b48020  ! 37: STHA_R	stha	%r28, [%r18 + %r0] 0x01
	.word 0xf2a44020  ! 38: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
	.word 0xf874e073  ! 40: STX_I	stx	%r28, [%r19 + 0x0073]
T3_asi_reg_wr_2:
	mov	0x1a, %r14
	.word 0xf0f384a0  ! 41: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf22ca0f1  ! 44: STB_I	stb	%r25, [%r18 + 0x00f1]
	.word 0xf824e06b  ! 46: STW_I	stw	%r28, [%r19 + 0x006b]
	.word 0xfaadc020  ! 49: STBA_R	stba	%r29, [%r23 + %r0] 0x01
cpu_intr_3_4:
	setx	0x1f0309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_5:
	setx	0x1e003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_3:
	mov	0x6, %r14
	.word 0xf2f38e40  ! 59: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 1d)
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_2:
	mov	0x4, %r14
	.word 0xf4db84a0  ! 62: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbe3de0c3  ! 63: XNOR_I	xnor 	%r23, 0x00c3, %r31
	.word 0xf22d20a2  ! 64: STB_I	stb	%r25, [%r20 + 0x00a2]
	ta	T_CHANGE_NONHPRIV
	.word 0xfc3421a4  ! 70: STH_I	sth	%r30, [%r16 + 0x01a4]
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_NONHPRIV
	.word 0xf4a4e197  ! 79: STWA_I	stwa	%r26, [%r19 + 0x0197] %asi
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_6:
	setx	0x1c030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac204a  ! 83: STBA_I	stba	%r28, [%r16 + 0x004a] %asi
cpu_intr_3_7:
	setx	0x1f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf875e018  ! 87: STX_I	stx	%r28, [%r23 + 0x0018]
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819828d2  ! 90: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d2, %hpstate
	.word 0xb7354000  ! 91: SRL_R	srl 	%r21, %r0, %r27
T3_asi_reg_wr_4:
	mov	0x12, %r14
	.word 0xfaf38e40  ! 94: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983898  ! 97: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1898, %hpstate
cpu_intr_3_8:
	setx	0x1e022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_3:
	mov	0x9, %r14
	.word 0xf6db8e40  ! 101: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf874c000  ! 103: STX_R	stx	%r28, [%r19 + %r0]
cpu_intr_3_9:
	setx	0x1e022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2cf001  ! 106: SLLX_I	sllx	%r19, 0x0001, %r29
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 27)
	.word 0xfead219e  ! 113: STBA_I	stba	%r31, [%r20 + 0x019e] %asi
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb2bdc000  ! 115: XNORcc_R	xnorcc 	%r23, %r0, %r25
	.word 0xfca5a171  ! 116: STWA_I	stwa	%r30, [%r22 + 0x0171] %asi
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_4:
	mov	0x34, %r14
	.word 0xf0db8e40  ! 130: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf2ad61df  ! 131: STBA_I	stba	%r25, [%r21 + 0x01df] %asi
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf22561a3  ! 134: STW_I	stw	%r25, [%r21 + 0x01a3]
	.word 0xfa2ca0fe  ! 137: STB_I	stb	%r29, [%r18 + 0x00fe]
	.word 0xfaacc020  ! 138: STBA_R	stba	%r29, [%r19 + %r0] 0x01
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf0f4e07b  ! 141: STXA_I	stxa	%r24, [%r19 + 0x007b] %asi
	.word 0xf274e0f3  ! 142: STX_I	stx	%r25, [%r19 + 0x00f3]
	.word 0xfaad0020  ! 144: STBA_R	stba	%r29, [%r20 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_10:
	setx	0x1e013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2240000  ! 148: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xfa2dc000  ! 152: STB_R	stb	%r29, [%r23 + %r0]
	ta	T_CHANGE_TO_TL0
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf2b421a0  ! 160: STHA_I	stha	%r25, [%r16 + 0x01a0] %asi
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 29)
	.word 0xfaa4c020  ! 164: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
	.word 0xfc2d0000  ! 165: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xb0b56172  ! 166: ORNcc_I	orncc 	%r21, 0x0172, %r24
	.word 0xfe25e0d6  ! 169: STW_I	stw	%r31, [%r23 + 0x00d6]
cpu_intr_3_11:
	setx	0x1d033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_5:
	mov	0x32, %r14
	.word 0xfcf38e80  ! 171: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfcac2052  ! 172: STBA_I	stba	%r30, [%r16 + 0x0052] %asi
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfaf420bf  ! 177: STXA_I	stxa	%r29, [%r16 + 0x00bf] %asi
	.word 0xf02ca071  ! 178: STB_I	stb	%r24, [%r18 + 0x0071]
cpu_intr_3_12:
	setx	0x1d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_13:
	setx	0x1d031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 12)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_14:
	setx	0x1d0308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_15:
	setx	0x1d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03561b2  ! 194: STH_I	sth	%r24, [%r21 + 0x01b2]
cpu_intr_3_16:
	setx	0x1f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8aca127  ! 197: STBA_I	stba	%r28, [%r18 + 0x0127] %asi
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, f)
	.word 0xbeb4217c  ! 200: ORNcc_I	orncc 	%r16, 0x017c, %r31
	.word 0xfcaca18b  ! 201: STBA_I	stba	%r30, [%r18 + 0x018b] %asi
	.word 0xf0ace18a  ! 203: STBA_I	stba	%r24, [%r19 + 0x018a] %asi
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_17:
	setx	0x1f0214, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_6:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 211: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_3_18:
	setx	0x1f0316, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_7:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 217: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf8346010  ! 218: STH_I	sth	%r28, [%r17 + 0x0010]
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_19:
	setx	0x1e013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25c000  ! 224: STW_R	stw	%r29, [%r23 + %r0]
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_8:
	mov	0x1e, %r14
	.word 0xf8f384a0  ! 228: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfa754000  ! 229: STX_R	stx	%r29, [%r21 + %r0]
cpu_intr_3_20:
	setx	0x1c0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc740000  ! 234: STX_R	stx	%r30, [%r16 + %r0]
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfe74a034  ! 237: STX_I	stx	%r31, [%r18 + 0x0034]
	.word 0xfc34c000  ! 239: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xbc454000  ! 242: ADDC_R	addc 	%r21, %r0, %r30
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 9)
	.word 0xf4248000  ! 248: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xfab44020  ! 255: STHA_R	stha	%r29, [%r17 + %r0] 0x01
	.word 0xf0752042  ! 256: STX_I	stx	%r24, [%r20 + 0x0042]
	.word 0xb350c000  ! 257: RDPR_TT	rdpr	%tt, %r25
T3_asi_reg_wr_9:
	mov	0x28, %r14
	.word 0xfef38e60  ! 259: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbd3db001  ! 262: SRAX_I	srax	%r22, 0x0001, %r30
T3_asi_reg_wr_10:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 264: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_5:
	mov	0xd, %r14
	.word 0xf6db8e80  ! 268: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_NONHPRIV
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfcaca18d  ! 275: STBA_I	stba	%r30, [%r18 + 0x018d] %asi
	.word 0xb83c60f4  ! 276: XNOR_I	xnor 	%r17, 0x00f4, %r28
	.word 0xfc740000  ! 285: STX_R	stx	%r30, [%r16 + %r0]
T3_asi_reg_rd_6:
	mov	0x1a, %r14
	.word 0xfedb89e0  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfe344000  ! 289: STH_R	sth	%r31, [%r17 + %r0]
cpu_intr_3_21:
	setx	0x1f0127, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_7:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 291: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_22:
	setx	0x1f0038, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_11:
	mov	0xe, %r14
	.word 0xfef38e40  ! 297: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4ad0020  ! 308: STBA_R	stba	%r26, [%r20 + %r0] 0x01
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_23:
	setx	0x1c031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_12:
	mov	0x1a, %r14
	.word 0xf8f38400  ! 316: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_wr_13:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 320: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfe340000  ! 322: STH_R	sth	%r31, [%r16 + %r0]
T3_asi_reg_wr_14:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 324: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_15:
	mov	0x1, %r14
	.word 0xfaf38400  ! 325: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_wr_16:
	mov	0x3c0, %r14
	.word 0xf4f38e60  ! 326: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_wr_17:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 327: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_8:
	mov	0x19, %r14
	.word 0xf4db89e0  ! 329: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T3_asi_reg_wr_18:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 333: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_24:
	setx	0x1d0106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_25:
	setx	0x1f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a4c020  ! 339: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
	.word 0xf4244000  ! 342: STW_R	stw	%r26, [%r17 + %r0]
T3_asi_reg_rd_9:
	mov	0x13, %r14
	.word 0xf6db8e40  ! 344: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbcb48000  ! 345: SUBCcc_R	orncc 	%r18, %r0, %r30
cpu_intr_3_26:
	setx	0x1d0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_19:
	mov	0x25, %r14
	.word 0xf4f38e60  ! 354: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf8740000  ! 356: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xf4244000  ! 359: STW_R	stw	%r26, [%r17 + %r0]
cpu_intr_3_27:
	setx	0x1e023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_28:
	setx	0x1c012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_29:
	setx	0x1e033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_30:
	setx	0x1c0027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_31:
	setx	0x1f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_10:
	mov	0x17, %r14
	.word 0xfadb8e80  ! 373: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfaad8020  ! 375: STBA_R	stba	%r29, [%r22 + %r0] 0x01
T3_asi_reg_rd_11:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 376: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T3_asi_reg_wr_20:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 377: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfa2de092  ! 382: STB_I	stb	%r29, [%r23 + 0x0092]
	.word 0xbe2de1de  ! 383: ANDN_I	andn 	%r23, 0x01de, %r31
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 19)
	.word 0xfe2c211a  ! 387: STB_I	stb	%r31, [%r16 + 0x011a]
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 1c)
	.word 0xb21c6074  ! 390: XOR_I	xor 	%r17, 0x0074, %r25
cpu_intr_3_32:
	setx	0x1f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_21:
	mov	0x3c4, %r14
	.word 0xf8f384a0  ! 398: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_33:
	setx	0x1c0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea5e1c6  ! 401: STWA_I	stwa	%r31, [%r23 + 0x01c6] %asi
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_wr_22:
	mov	0xd, %r14
	.word 0xf2f38e40  ! 408: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_23:
	mov	0x32, %r14
	.word 0xf6f38400  ! 411: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_rd_12:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 414: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_24:
	mov	0x32, %r14
	.word 0xf4f38400  ! 415: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfc240000  ! 417: STW_R	stw	%r30, [%r16 + %r0]
T3_asi_reg_rd_13:
	mov	0x10, %r14
	.word 0xf8db8e80  ! 418: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf0f521aa  ! 419: STXA_I	stxa	%r24, [%r20 + 0x01aa] %asi
cpu_intr_3_34:
	setx	0x1c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa340000  ! 421: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xfe2d20e8  ! 423: STB_I	stb	%r31, [%r20 + 0x00e8]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_35:
	setx	0x1d001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_36:
	setx	0x1f0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09d206c  ! 435: XORcc_I	xorcc 	%r20, 0x006c, %r24
T3_asi_reg_wr_25:
	mov	0x3c1, %r14
	.word 0xf6f384a0  ! 438: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_37:
	setx	0x1d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ace012  ! 444: STBA_I	stba	%r25, [%r19 + 0x0012] %asi
T3_asi_reg_rd_14:
	mov	0x3c0, %r14
	.word 0xf0db89e0  ! 445: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_38:
	setx	0x1e0135, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_26:
	mov	0x28, %r14
	.word 0xfcf38e60  ! 449: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_39:
	setx	0x1d0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_15:
	mov	0xa, %r14
	.word 0xf0db8e60  ! 455: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_rd_16:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 456: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_wr_27:
	mov	0x17, %r14
	.word 0xfaf38e60  ! 458: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf8348000  ! 461: STH_R	sth	%r28, [%r18 + %r0]
cpu_intr_3_40:
	setx	0x200023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 24)
	.word 0xf8ade06c  ! 467: STBA_I	stba	%r28, [%r23 + 0x006c] %asi
	.word 0x8194e01c  ! 468: WRPR_TPC_I	wrpr	%r19, 0x001c, %tpc
	.word 0xf6b58020  ! 470: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	.word 0xb635c000  ! 471: SUBC_R	orn 	%r23, %r0, %r27
cpu_intr_3_41:
	setx	0x210120, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_28:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 474: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 8)
	.word 0xfa74c000  ! 477: STX_R	stx	%r29, [%r19 + %r0]
T3_asi_reg_wr_29:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 480: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfaa4a13d  ! 481: STWA_I	stwa	%r29, [%r18 + 0x013d] %asi
	.word 0xf6252096  ! 483: STW_I	stw	%r27, [%r20 + 0x0096]
	.word 0xfab4606b  ! 487: STHA_I	stha	%r29, [%r17 + 0x006b] %asi
	.word 0xb77c4400  ! 488: MOVR_R	movre	%r17, %r0, %r27
cpu_intr_3_42:
	setx	0x20022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_17:
	mov	0xb, %r14
	.word 0xfadb8e80  ! 492: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf6346137  ! 493: STH_I	sth	%r27, [%r17 + 0x0137]
T3_asi_reg_rd_18:
	mov	0xd, %r14
	.word 0xf2db8e40  ! 500: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_43:
	setx	0x21003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3d0000  ! 503: XNOR_R	xnor 	%r20, %r0, %r31
	.word 0xfeace024  ! 504: STBA_I	stba	%r31, [%r19 + 0x0024] %asi
cpu_intr_3_44:
	setx	0x230017, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf4a40020  ! 509: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
	.word 0xb48d20c6  ! 512: ANDcc_I	andcc 	%r20, 0x00c6, %r26
T3_asi_reg_wr_30:
	mov	0xe, %r14
	.word 0xf2f384a0  ! 514: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_45:
	setx	0x20010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbe840000  ! 519: ADDcc_R	addcc 	%r16, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0xfe758000  ! 523: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xb29c61e3  ! 524: XORcc_I	xorcc 	%r17, 0x01e3, %r25
	.word 0xfcade1f1  ! 527: STBA_I	stba	%r30, [%r23 + 0x01f1] %asi
T3_asi_reg_rd_19:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 530: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 5)
	.word 0xf0a58020  ! 533: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
	.word 0xf6b54020  ! 534: STHA_R	stha	%r27, [%r21 + %r0] 0x01
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982a50  ! 536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a50, %hpstate
	.word 0xf674a0df  ! 538: STX_I	stx	%r27, [%r18 + 0x00df]
	.word 0xb42c8000  ! 541: ANDN_R	andn 	%r18, %r0, %r26
T3_asi_reg_rd_20:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_wr_31:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 543: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf23560b7  ! 546: STH_I	sth	%r25, [%r21 + 0x00b7]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_46:
	setx	0x23031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1c4000  ! 555: XOR_R	xor 	%r17, %r0, %r29
	.word 0xf6b5c020  ! 560: STHA_R	stha	%r27, [%r23 + %r0] 0x01
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 26)
	.word 0xf475216b  ! 562: STX_I	stx	%r26, [%r20 + 0x016b]
T3_asi_reg_rd_21:
	mov	0xc, %r14
	.word 0xf2db8400  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfef52051  ! 564: STXA_I	stxa	%r31, [%r20 + 0x0051] %asi
	.word 0xfab4a02c  ! 566: STHA_I	stha	%r29, [%r18 + 0x002c] %asi
	.word 0xf0b461ad  ! 571: STHA_I	stha	%r24, [%r17 + 0x01ad] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xb4b40000  ! 573: SUBCcc_R	orncc 	%r16, %r0, %r26
T3_asi_reg_rd_22:
	mov	0x36, %r14
	.word 0xf2db8e80  ! 574: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_rd_23:
	mov	0x1a, %r14
	.word 0xf2db8400  ! 577: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbaacc000  ! 580: ANDNcc_R	andncc 	%r19, %r0, %r29
	.word 0xf4a5c020  ! 585: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
cpu_intr_3_47:
	setx	0x210014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ad8020  ! 591: STBA_R	stba	%r27, [%r22 + %r0] 0x01
cpu_intr_3_48:
	setx	0x22010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_32:
	mov	0x3c4, %r14
	.word 0xf8f384a0  ! 598: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf8254000  ! 599: STW_R	stw	%r28, [%r21 + %r0]
T3_asi_reg_wr_33:
	mov	0x1b, %r14
	.word 0xf0f38400  ! 602: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T3_asi_reg_wr_34:
	mov	0x38, %r14
	.word 0xfaf38e40  ! 605: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf634e037  ! 606: STH_I	sth	%r27, [%r19 + 0x0037]
	.word 0xf0b48020  ! 607: STHA_R	stha	%r24, [%r18 + %r0] 0x01
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_49:
	setx	0x200037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f5e068  ! 615: STXA_I	stxa	%r25, [%r23 + 0x0068] %asi
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_50:
	setx	0x230027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_rd_24:
	mov	0x24, %r14
	.word 0xf6db84a0  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf4b420cf  ! 623: STHA_I	stha	%r26, [%r16 + 0x00cf] %asi
	.word 0xfa24c000  ! 624: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf024618b  ! 625: STW_I	stw	%r24, [%r17 + 0x018b]
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf22de058  ! 627: STB_I	stb	%r25, [%r23 + 0x0058]
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 31)
	.word 0xf0ad4020  ! 631: STBA_R	stba	%r24, [%r21 + %r0] 0x01
	.word 0xf82d4000  ! 633: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xfea52111  ! 634: STWA_I	stwa	%r31, [%r20 + 0x0111] %asi
T3_asi_reg_wr_35:
	mov	0xf, %r14
	.word 0xf4f38e80  ! 637: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb72d3001  ! 638: SLLX_I	sllx	%r20, 0x0001, %r27
	.word 0xf2b48020  ! 639: STHA_R	stha	%r25, [%r18 + %r0] 0x01
T3_asi_reg_rd_25:
	mov	0x4, %r14
	.word 0xfcdb8400  ! 640: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfe24604f  ! 641: STW_I	stw	%r31, [%r17 + 0x004f]
cpu_intr_3_51:
	setx	0x21021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_52:
	setx	0x220206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_53:
	setx	0x22033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc340000  ! 648: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xfeadc020  ! 654: STBA_R	stba	%r31, [%r23 + %r0] 0x01
	.word 0xbb3ce001  ! 655: SRA_I	sra 	%r19, 0x0001, %r29
T3_asi_reg_wr_36:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 656: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 35)
	.word 0xfe35a0fa  ! 662: STH_I	sth	%r31, [%r22 + 0x00fa]
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_rd_26:
	mov	0x28, %r14
	.word 0xfadb8e40  ! 671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_NONHPRIV
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb7520000  ! 679: RDPR_PIL	rdpr	%pil, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf43420de  ! 686: STH_I	sth	%r26, [%r16 + 0x00de]
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 34)
	.word 0xb52c2001  ! 689: SLL_I	sll 	%r16, 0x0001, %r26
	ta	T_CHANGE_NONHPRIV
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 20)
	.word 0xfe350000  ! 696: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xf6756077  ! 697: STX_I	stx	%r27, [%r21 + 0x0077]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_27:
	mov	0x26, %r14
	.word 0xf4db89e0  ! 705: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_54:
	setx	0x230305, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfab56067  ! 708: STHA_I	stha	%r29, [%r21 + 0x0067] %asi
	.word 0xf2a52055  ! 712: STWA_I	stwa	%r25, [%r20 + 0x0055] %asi
cpu_intr_3_55:
	setx	0x200312, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_28:
	mov	0x2, %r14
	.word 0xf6db8e40  ! 714: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb134a001  ! 715: SRL_I	srl 	%r18, 0x0001, %r24
	.word 0xbb3c1000  ! 716: SRAX_R	srax	%r16, %r0, %r29
	.word 0xfcac4020  ! 720: STBA_R	stba	%r30, [%r17 + %r0] 0x01
cpu_intr_3_56:
	setx	0x220224, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_29:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 724: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_3_57:
	setx	0x210034, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_37:
	mov	0xe, %r14
	.word 0xfcf384a0  ! 728: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb2044000  ! 729: ADD_R	add 	%r17, %r0, %r25
	.word 0xf2ac6091  ! 732: STBA_I	stba	%r25, [%r17 + 0x0091] %asi
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 12)
	.word 0xfa74a08c  ! 735: STX_I	stx	%r29, [%r18 + 0x008c]
	.word 0xba9c21ce  ! 736: XORcc_I	xorcc 	%r16, 0x01ce, %r29
	.word 0xfc2421fe  ! 737: STW_I	stw	%r30, [%r16 + 0x01fe]
	.word 0xf6a48020  ! 739: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
	.word 0xf07421c1  ! 741: STX_I	stx	%r24, [%r16 + 0x01c1]
T3_asi_reg_rd_30:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 742: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_wr_38:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 743: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_3_58:
	setx	0x21001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4a122  ! 748: STHA_I	stha	%r29, [%r18 + 0x0122] %asi
T3_asi_reg_wr_39:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 749: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_59:
	setx	0x210135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 31)
	.word 0xf4250000  ! 754: STW_R	stw	%r26, [%r20 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_60:
	setx	0x200006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_61:
	setx	0x200002, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_40:
	mov	0x29, %r14
	.word 0xfaf38e40  ! 768: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xb8c520a1  ! 770: ADDCcc_I	addccc 	%r20, 0x00a1, %r28
	.word 0xfaaca075  ! 773: STBA_I	stba	%r29, [%r18 + 0x0075] %asi
	.word 0xf6750000  ! 775: STX_R	stx	%r27, [%r20 + %r0]
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 21)
	.word 0xf4348000  ! 781: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xfab58020  ! 782: STHA_R	stha	%r29, [%r22 + %r0] 0x01
	.word 0xf62c6101  ! 784: STB_I	stb	%r27, [%r17 + 0x0101]
	.word 0xbd343001  ! 786: SRLX_I	srlx	%r16, 0x0001, %r30
	.word 0xb0b56194  ! 788: SUBCcc_I	orncc 	%r21, 0x0194, %r24
	.word 0xf234618d  ! 789: STH_I	sth	%r25, [%r17 + 0x018d]
cpu_intr_3_62:
	setx	0x20032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba850000  ! 792: ADDcc_R	addcc 	%r20, %r0, %r29
	.word 0xb8bc4000  ! 794: XNORcc_R	xnorcc 	%r17, %r0, %r28
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_31:
	mov	0x19, %r14
	.word 0xf2db84a0  ! 798: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_3_63:
	setx	0x21d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4210e  ! 802: STHA_I	stha	%r29, [%r16 + 0x010e] %asi
cpu_intr_3_64:
	setx	0x21022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4c020  ! 804: STHA_R	stha	%r25, [%r19 + %r0] 0x01
	.word 0xf025e0d5  ! 807: STW_I	stw	%r24, [%r23 + 0x00d5]
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983f82  ! 808: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f82, %hpstate
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_65:
	setx	0x23030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4342008  ! 812: STH_I	sth	%r26, [%r16 + 0x0008]
	.word 0xfa356169  ! 813: STH_I	sth	%r29, [%r21 + 0x0169]
T3_asi_reg_wr_41:
	mov	0xd, %r14
	.word 0xf4f38e60  ! 819: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfa34c000  ! 820: STH_R	sth	%r29, [%r19 + %r0]
T3_asi_reg_wr_42:
	mov	0x21, %r14
	.word 0xfaf38e80  ! 821: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_rd_32:
	mov	0x31, %r14
	.word 0xf2db8e60  ! 826: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf2a44020  ! 827: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
	.word 0xfab521b0  ! 828: STHA_I	stha	%r29, [%r20 + 0x01b0] %asi
cpu_intr_3_66:
	setx	0x230217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b5c020  ! 832: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xf6ad8020  ! 833: STBA_R	stba	%r27, [%r22 + %r0] 0x01
	.word 0xf4758000  ! 836: STX_R	stx	%r26, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
cpu_intr_3_67:
	setx	0x210029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ade056  ! 843: STBA_I	stba	%r28, [%r23 + 0x0056] %asi
	.word 0xf035a1da  ! 850: STH_I	sth	%r24, [%r22 + 0x01da]
	.word 0xf4244000  ! 852: STW_R	stw	%r26, [%r17 + %r0]
cpu_intr_3_68:
	setx	0x200309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_69:
	setx	0x23001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_33:
	mov	0x3c1, %r14
	.word 0xfedb8e60  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf4b40020  ! 862: STHA_R	stha	%r26, [%r16 + %r0] 0x01
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 30)
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983992  ! 869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1992, %hpstate
T3_asi_reg_wr_43:
	mov	0xc, %r14
	.word 0xf0f389e0  ! 870: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfa756040  ! 872: STX_I	stx	%r29, [%r21 + 0x0040]
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983f0a  ! 874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0a, %hpstate
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, a)
	.word 0xba3cc000  ! 876: XNOR_R	xnor 	%r19, %r0, %r29
	.word 0xf424a025  ! 879: STW_I	stw	%r26, [%r18 + 0x0025]
cpu_intr_3_70:
	setx	0x200024, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_34:
	mov	0x3, %r14
	.word 0xf6db8e40  ! 882: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf0f4617e  ! 884: STXA_I	stxa	%r24, [%r17 + 0x017e] %asi
cpu_intr_3_71:
	setx	0x21021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_72:
	setx	0x230115, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_35:
	mov	0x3c3, %r14
	.word 0xf2db8400  ! 888: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb92c1000  ! 892: SLLX_R	sllx	%r16, %r0, %r28
T3_asi_reg_rd_36:
	mov	0x3c7, %r14
	.word 0xf4db8e60  ! 893: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_rd_37:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 896: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_wr_44:
	mov	0x2a, %r14
	.word 0xfaf38400  ! 901: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_3_73:
	setx	0x220017, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_45:
	mov	0x32, %r14
	.word 0xf6f38e40  ! 904: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_74:
	setx	0x23030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_38:
	mov	0x19, %r14
	.word 0xfcdb8e40  ! 906: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfaa56097  ! 907: STWA_I	stwa	%r29, [%r21 + 0x0097] %asi
	.word 0xf2b54020  ! 908: STHA_R	stha	%r25, [%r21 + %r0] 0x01
cpu_intr_3_75:
	setx	0x260319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b50020  ! 912: STHA_R	stha	%r28, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_46:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 916: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf62dc000  ! 920: STB_R	stb	%r27, [%r23 + %r0]
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 23)
	.word 0xfa2520b0  ! 922: STW_I	stw	%r29, [%r20 + 0x00b0]
	.word 0xf8756121  ! 924: STX_I	stx	%r28, [%r21 + 0x0121]
	.word 0xb2958000  ! 927: ORcc_R	orcc 	%r22, %r0, %r25
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf0b42078  ! 931: STHA_I	stha	%r24, [%r16 + 0x0078] %asi
cpu_intr_3_76:
	setx	0x24012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8aca15e  ! 935: STBA_I	stba	%r28, [%r18 + 0x015e] %asi
	.word 0xfe35a078  ! 936: STH_I	sth	%r31, [%r22 + 0x0078]
cpu_intr_3_77:
	setx	0x260227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb35e001  ! 941: SRL_I	srl 	%r23, 0x0001, %r29
	.word 0xf225e15d  ! 942: STW_I	stw	%r25, [%r23 + 0x015d]
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 29)
	.word 0xf2a56143  ! 945: STWA_I	stwa	%r25, [%r21 + 0x0143] %asi
	.word 0xfea4a164  ! 946: STWA_I	stwa	%r31, [%r18 + 0x0164] %asi
	.word 0xbe9c8000  ! 947: XORcc_R	xorcc 	%r18, %r0, %r31
	.word 0xfea52093  ! 948: STWA_I	stwa	%r31, [%r20 + 0x0093] %asi
	.word 0xf62c21dd  ! 949: STB_I	stb	%r27, [%r16 + 0x01dd]
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983808  ! 952: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1808, %hpstate
cpu_intr_3_78:
	setx	0x25020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac61ce  ! 954: STBA_I	stba	%r28, [%r17 + 0x01ce] %asi
	.word 0xfa2c2098  ! 956: STB_I	stb	%r29, [%r16 + 0x0098]
T3_asi_reg_rd_39:
	mov	0x2, %r14
	.word 0xf4db8e40  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_40:
	mov	0xe, %r14
	.word 0xfadb84a0  ! 958: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfa748000  ! 959: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xfe2d4000  ! 961: STB_R	stb	%r31, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 3e)
	ta	T_CHANGE_HPRIV
cpu_intr_3_79:
	setx	0x24001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_47:
	mov	0x0, %r14
	.word 0xfaf389e0  ! 970: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfa2dc000  ! 971: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf8250000  ! 975: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xfc75a062  ! 976: STX_I	stx	%r30, [%r22 + 0x0062]
T3_asi_reg_wr_48:
	mov	0x2f, %r14
	.word 0xf4f38400  ! 978: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, f)
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a50  ! 981: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a50, %hpstate
	ta	T_CHANGE_TO_TL0
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 29)
	.word 0xfaa5a096  ! 996: STWA_I	stwa	%r29, [%r22 + 0x0096] %asi
T3_asi_reg_rd_41:
	mov	0x3c1, %r14
	.word 0xf8db8e80  ! 997: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfea5c020  ! 998: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
cpu_intr_3_80:
	setx	0x250326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02ce0a7  ! 1002: STB_I	stb	%r24, [%r19 + 0x00a7]
	.word 0xf6254000  ! 1003: STW_R	stw	%r27, [%r21 + %r0]
cpu_intr_3_81:
	setx	0x24022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_42:
	mov	0x3, %r14
	.word 0xfadb8e60  ! 1013: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbebc8000  ! 1014: XNORcc_R	xnorcc 	%r18, %r0, %r31
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, d)
	.word 0xf62c605a  ! 1019: STB_I	stb	%r27, [%r17 + 0x005a]
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_wr_49:
	mov	0x3c0, %r14
	.word 0xf8f38e60  ! 1027: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfca50020  ! 1032: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_82:
	setx	0x270111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 7)
	.word 0xb93cb001  ! 1046: SRAX_I	srax	%r18, 0x0001, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xf42c8000  ! 1048: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf6ad60ca  ! 1049: STBA_I	stba	%r27, [%r21 + 0x00ca] %asi
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 3a)
	.word 0xb2b54000  ! 1053: SUBCcc_R	orncc 	%r21, %r0, %r25
T3_asi_reg_wr_50:
	mov	0x14, %r14
	.word 0xfaf38e60  ! 1056: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_3_83:
	setx	0x24003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_84:
	setx	0x240226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 18)
	.word 0xf2a5a048  ! 1063: STWA_I	stwa	%r25, [%r22 + 0x0048] %asi
	.word 0xfc25c000  ! 1064: STW_R	stw	%r30, [%r23 + %r0]
cpu_intr_3_85:
	setx	0x26002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef46040  ! 1072: STXA_I	stxa	%r31, [%r17 + 0x0040] %asi
cpu_intr_3_86:
	setx	0x26030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_43:
	mov	0xa, %r14
	.word 0xfcdb8e40  ! 1075: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_51:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 1077: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 0)
	.word 0xb1641800  ! 1080: MOVcc_R	<illegal instruction>
	.word 0xf42c2174  ! 1084: STB_I	stb	%r26, [%r16 + 0x0174]
cpu_intr_3_87:
	setx	0x270026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 12)
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b48020  ! 1092: STHA_R	stha	%r28, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_88:
	setx	0x250126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5e01d  ! 1097: STHA_I	stha	%r25, [%r23 + 0x001d] %asi
	.word 0xbf3c3001  ! 1098: SRAX_I	srax	%r16, 0x0001, %r31
T3_asi_reg_rd_44:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 1099: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf0a4c020  ! 1104: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 14)
	.word 0xb63c4000  ! 1111: XNOR_R	xnor 	%r17, %r0, %r27
	.word 0xf4a4218e  ! 1112: STWA_I	stwa	%r26, [%r16 + 0x018e] %asi
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_52:
	mov	0x1, %r14
	.word 0xf0f38e80  ! 1114: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf4b40020  ! 1115: STHA_R	stha	%r26, [%r16 + %r0] 0x01
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 20)
	.word 0xbe1d0000  ! 1121: XOR_R	xor 	%r20, %r0, %r31
cpu_intr_3_89:
	setx	0x260333, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_45:
	mov	0x37, %r14
	.word 0xf6db8400  ! 1128: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf0b46181  ! 1129: STHA_I	stha	%r24, [%r17 + 0x0181] %asi
	.word 0xfa7421c8  ! 1131: STX_I	stx	%r29, [%r16 + 0x01c8]
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b1a  ! 1134: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1a, %hpstate
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfe75a04e  ! 1138: STX_I	stx	%r31, [%r22 + 0x004e]
cpu_intr_3_90:
	setx	0x260113, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_46:
	mov	0x12, %r14
	.word 0xfadb8e40  ! 1145: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf82dc000  ! 1146: STB_R	stb	%r28, [%r23 + %r0]
T3_asi_reg_wr_53:
	mov	0x5, %r14
	.word 0xfef384a0  ! 1149: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfea460c1  ! 1150: STWA_I	stwa	%r31, [%r17 + 0x00c1] %asi
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_47:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 1152: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_wr_54:
	mov	0x6, %r14
	.word 0xf6f384a0  ! 1155: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_91:
	setx	0x240037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_92:
	setx	0x260005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4744000  ! 1160: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xf8ad8020  ! 1161: STBA_R	stba	%r28, [%r22 + %r0] 0x01
T3_asi_reg_rd_48:
	mov	0x2c, %r14
	.word 0xfedb8e40  ! 1162: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf8f561ea  ! 1163: STXA_I	stxa	%r28, [%r21 + 0x01ea] %asi
	.word 0xfe2cc000  ! 1164: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xf0b48020  ! 1165: STHA_R	stha	%r24, [%r18 + %r0] 0x01
	.word 0xfa358000  ! 1169: STH_R	sth	%r29, [%r22 + %r0]
T3_asi_reg_wr_55:
	mov	0x3c7, %r14
	.word 0xf8f38e80  ! 1170: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 30)
	.word 0xfe344000  ! 1174: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xfcaca078  ! 1176: STBA_I	stba	%r30, [%r18 + 0x0078] %asi
T3_asi_reg_rd_49:
	mov	0x22, %r14
	.word 0xfcdb8400  ! 1177: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf2adc020  ! 1178: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	.word 0xba9d6067  ! 1180: XORcc_I	xorcc 	%r21, 0x0067, %r29
	.word 0xf82da1da  ! 1184: STB_I	stb	%r28, [%r22 + 0x01da]
	.word 0xfab5206a  ! 1186: STHA_I	stha	%r29, [%r20 + 0x006a] %asi
cpu_intr_3_93:
	setx	0x25021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_94:
	setx	0x250339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe250000  ! 1191: SUB_R	sub 	%r20, %r0, %r31
	.word 0xf22c6197  ! 1193: STB_I	stb	%r25, [%r17 + 0x0197]
T3_asi_reg_rd_50:
	mov	0x2a, %r14
	.word 0xfcdb89e0  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbab4e11e  ! 1196: ORNcc_I	orncc 	%r19, 0x011e, %r29
	.word 0xf42ca066  ! 1198: STB_I	stb	%r26, [%r18 + 0x0066]
cpu_intr_3_95:
	setx	0x24013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_56:
	mov	0x25, %r14
	.word 0xf2f38e40  ! 1200: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfeace035  ! 1204: STBA_I	stba	%r31, [%r19 + 0x0035] %asi
T3_asi_reg_wr_57:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 1205: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf634a09e  ! 1206: STH_I	sth	%r27, [%r18 + 0x009e]
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 3d)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_96:
	setx	0x27013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_51:
	mov	0x37, %r14
	.word 0xf0db8e80  ! 1221: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf0756060  ! 1223: STX_I	stx	%r24, [%r21 + 0x0060]
	.word 0xb935f001  ! 1225: SRLX_I	srlx	%r23, 0x0001, %r28
	.word 0xfaa421ab  ! 1226: STWA_I	stwa	%r29, [%r16 + 0x01ab] %asi
T3_asi_reg_wr_58:
	mov	0x36, %r14
	.word 0xf2f38e40  ! 1227: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe75c000  ! 1229: STX_R	stx	%r31, [%r23 + %r0]
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 5)
	ta	T_CHANGE_TO_TL0
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 13)
	.word 0xfa348000  ! 1239: STH_R	sth	%r29, [%r18 + %r0]
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_97:
	setx	0x26000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_98:
	setx	0x250131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a460ca  ! 1244: STWA_I	stwa	%r26, [%r17 + 0x00ca] %asi
T3_asi_reg_rd_52:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 1246: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfcac8020  ! 1248: STBA_R	stba	%r30, [%r18 + %r0] 0x01
	.word 0xf0742010  ! 1249: STX_I	stx	%r24, [%r16 + 0x0010]
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_59:
	mov	0x13, %r14
	.word 0xf2f384a0  ! 1254: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_99:
	setx	0x240215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca48020  ! 1262: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
	.word 0xfe74a089  ! 1267: STX_I	stx	%r31, [%r18 + 0x0089]
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf475e16a  ! 1273: STX_I	stx	%r26, [%r23 + 0x016a]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf624e1e4  ! 1279: STW_I	stw	%r27, [%r19 + 0x01e4]
cpu_intr_3_100:
	setx	0x24003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_53:
	mov	0x14, %r14
	.word 0xfcdb8400  ! 1282: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982cc0  ! 1283: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc0, %hpstate
	.word 0xfea4c020  ! 1285: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
cpu_intr_3_101:
	setx	0x260315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f4e043  ! 1288: STXA_I	stxa	%r24, [%r19 + 0x0043] %asi
T3_asi_reg_wr_60:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 1290: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
cpu_intr_3_102:
	setx	0x27011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab40000  ! 1297: SUBCcc_R	orncc 	%r16, %r0, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xf625e19f  ! 1302: STW_I	stw	%r27, [%r23 + 0x019f]
	.word 0xfe75c000  ! 1303: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xfcada13a  ! 1304: STBA_I	stba	%r30, [%r22 + 0x013a] %asi
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 16)
	.word 0xbf2c6001  ! 1306: SLL_I	sll 	%r17, 0x0001, %r31
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 21)
	.word 0xfc344000  ! 1311: STH_R	sth	%r30, [%r17 + %r0]
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 1)
	.word 0xbcb4c000  ! 1313: ORNcc_R	orncc 	%r19, %r0, %r30
T3_asi_reg_wr_61:
	mov	0x17, %r14
	.word 0xfcf38e60  ! 1314: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_103:
	setx	0x25021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_62:
	mov	0xb, %r14
	.word 0xf8f38e40  ! 1317: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfcf4a0b5  ! 1322: STXA_I	stxa	%r30, [%r18 + 0x00b5] %asi
cpu_intr_3_104:
	setx	0x270306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_63:
	mov	0x1d, %r14
	.word 0xf2f38e80  ! 1326: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_54:
	mov	0x20, %r14
	.word 0xf4db8e60  ! 1330: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_55:
	mov	0xe, %r14
	.word 0xf2db8400  ! 1337: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_3_105:
	setx	0x26002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_106:
	setx	0x26033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c4a1e6  ! 1355: ADDCcc_I	addccc 	%r18, 0x01e6, %r28
cpu_intr_3_107:
	setx	0x270235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 3)
	.word 0xf42c61bf  ! 1360: STB_I	stb	%r26, [%r17 + 0x01bf]
	.word 0xfab5a163  ! 1361: STHA_I	stha	%r29, [%r22 + 0x0163] %asi
cpu_intr_3_108:
	setx	0x26010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b50020  ! 1366: STHA_R	stha	%r27, [%r20 + %r0] 0x01
	.word 0xf024a1aa  ! 1367: STW_I	stw	%r24, [%r18 + 0x01aa]
	.word 0xf4ad610d  ! 1370: STBA_I	stba	%r26, [%r21 + 0x010d] %asi
T3_asi_reg_rd_56:
	mov	0x1, %r14
	.word 0xf0db8400  ! 1371: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf634612a  ! 1373: STH_I	sth	%r27, [%r17 + 0x012a]
cpu_intr_3_109:
	setx	0x250215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe74c000  ! 1378: STX_R	stx	%r31, [%r19 + %r0]
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
cpu_intr_3_110:
	setx	0x260211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b50020  ! 1384: STHA_R	stha	%r26, [%r20 + %r0] 0x01
cpu_intr_3_111:
	setx	0x260338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfea4c020  ! 1392: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
cpu_intr_3_112:
	setx	0x270224, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_113:
	setx	0x2a0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3353001  ! 1404: SRLX_I	srlx	%r20, 0x0001, %r25
T3_asi_reg_rd_57:
	mov	0x3c6, %r14
	.word 0xf0db8400  ! 1405: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_wr_64:
	mov	0x1a, %r14
	.word 0xfaf38e40  ! 1407: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbab58000  ! 1408: SUBCcc_R	orncc 	%r22, %r0, %r29
T3_asi_reg_rd_58:
	mov	0x10, %r14
	.word 0xfedb8e40  ! 1410: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf4a4a0ed  ! 1412: STWA_I	stwa	%r26, [%r18 + 0x00ed] %asi
	.word 0xf6f56069  ! 1413: STXA_I	stxa	%r27, [%r21 + 0x0069] %asi
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfe74e1f7  ! 1417: STX_I	stx	%r31, [%r19 + 0x01f7]
T3_asi_reg_rd_59:
	mov	0x27, %r14
	.word 0xf2db8e40  ! 1418: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfeb40020  ! 1419: STHA_R	stha	%r31, [%r16 + %r0] 0x01
	.word 0xfaa5a1ac  ! 1420: STWA_I	stwa	%r29, [%r22 + 0x01ac] %asi
T3_asi_reg_rd_60:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 1421: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 22)
	.word 0xf225c000  ! 1426: STW_R	stw	%r25, [%r23 + %r0]
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_114:
	setx	0x290204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_115:
	setx	0x29023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5a13d  ! 1431: STWA_I	stwa	%r29, [%r22 + 0x013d] %asi
T3_asi_reg_rd_61:
	mov	0x1e, %r14
	.word 0xf0db84a0  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_wr_65:
	mov	0x3c6, %r14
	.word 0xf2f389e0  ! 1446: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfea521b6  ! 1447: STWA_I	stwa	%r31, [%r20 + 0x01b6] %asi
T3_asi_reg_wr_66:
	mov	0x32, %r14
	.word 0xf8f38e80  ! 1448: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 3e)
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb2b40000  ! 1455: ORNcc_R	orncc 	%r16, %r0, %r25
	.word 0x8794a136  ! 1457: WRPR_TT_I	wrpr	%r18, 0x0136, %tt
	.word 0xbea4a198  ! 1458: SUBcc_I	subcc 	%r18, 0x0198, %r31
T3_asi_reg_rd_62:
	mov	0xa, %r14
	.word 0xf0db8e40  ! 1459: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_116:
	setx	0x280131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b40000  ! 1461: SUBCcc_R	orncc 	%r16, %r0, %r24
	.word 0xf274a0e8  ! 1462: STX_I	stx	%r25, [%r18 + 0x00e8]
	.word 0xfa75e1ac  ! 1465: STX_I	stx	%r29, [%r23 + 0x01ac]
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 1f)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982dc0  ! 1467: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2ace0b8  ! 1471: STBA_I	stba	%r25, [%r19 + 0x00b8] %asi
	.word 0xf4adc020  ! 1472: STBA_R	stba	%r26, [%r23 + %r0] 0x01
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 12)
	.word 0xfab44020  ! 1475: STHA_R	stha	%r29, [%r17 + %r0] 0x01
	.word 0xf82c8000  ! 1477: STB_R	stb	%r28, [%r18 + %r0]
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c42  ! 1478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c42, %hpstate
	.word 0xb4342015  ! 1479: SUBC_I	orn 	%r16, 0x0015, %r26
T3_asi_reg_wr_67:
	mov	0x14, %r14
	.word 0xfaf38400  ! 1481: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
cpu_intr_3_117:
	setx	0x2a032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_118:
	setx	0x29022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf624e129  ! 1489: STW_I	stw	%r27, [%r19 + 0x0129]
	.word 0xfe750000  ! 1490: STX_R	stx	%r31, [%r20 + %r0]
T3_asi_reg_rd_63:
	mov	0x19, %r14
	.word 0xf0db89e0  ! 1492: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_119:
	setx	0x290317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c0000  ! 1498: STB_R	stb	%r29, [%r16 + %r0]
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 16)
	.word 0xf2350000  ! 1505: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xf8750000  ! 1511: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xf425e0be  ! 1513: STW_I	stw	%r26, [%r23 + 0x00be]
T3_asi_reg_wr_68:
	mov	0xd, %r14
	.word 0xfcf38e60  ! 1516: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf8248000  ! 1517: STW_R	stw	%r28, [%r18 + %r0]
cpu_intr_3_120:
	setx	0x2a0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983e42  ! 1519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e42, %hpstate
	.word 0xfc350000  ! 1521: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xfeac6198  ! 1522: STBA_I	stba	%r31, [%r17 + 0x0198] %asi
T3_asi_reg_wr_69:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 1524: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_70:
	mov	0xa, %r14
	.word 0xf8f38e40  ! 1526: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf235c000  ! 1528: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xbc14a1ac  ! 1530: OR_I	or 	%r18, 0x01ac, %r30
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, f)
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_rd_64:
	mov	0x7, %r14
	.word 0xfedb8400  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xfa7561a0  ! 1538: STX_I	stx	%r29, [%r21 + 0x01a0]
	.word 0xbaa5a13b  ! 1539: SUBcc_I	subcc 	%r22, 0x013b, %r29
cpu_intr_3_121:
	setx	0x290133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf424c000  ! 1543: STW_R	stw	%r26, [%r19 + %r0]
cpu_intr_3_122:
	setx	0x290329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8748000  ! 1545: STX_R	stx	%r28, [%r18 + %r0]
cpu_intr_3_123:
	setx	0x2b0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf83560b6  ! 1547: STH_I	sth	%r28, [%r21 + 0x00b6]
	.word 0xf0748000  ! 1550: STX_R	stx	%r24, [%r18 + %r0]
T3_asi_reg_wr_71:
	mov	0x37, %r14
	.word 0xf8f38e60  ! 1551: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_124:
	setx	0x2b022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43c4000  ! 1554: XNOR_R	xnor 	%r17, %r0, %r26
	.word 0xb834c000  ! 1556: ORN_R	orn 	%r19, %r0, %r28
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_72:
	mov	0x3c5, %r14
	.word 0xfcf38e80  ! 1558: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_rd_65:
	mov	0x19, %r14
	.word 0xfedb8e60  ! 1568: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf6a44020  ! 1569: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 27)
	.word 0xf8254000  ! 1571: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xfe2d8000  ! 1573: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xf23421b6  ! 1575: STH_I	sth	%r25, [%r16 + 0x01b6]
	.word 0xf474214f  ! 1576: STX_I	stx	%r26, [%r16 + 0x014f]
	.word 0xf62d0000  ! 1577: STB_R	stb	%r27, [%r20 + %r0]
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 20)
	.word 0xbf2d3001  ! 1581: SLLX_I	sllx	%r20, 0x0001, %r31
T3_asi_reg_rd_66:
	mov	0x16, %r14
	.word 0xf8db8e40  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_125:
	setx	0x290206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0248000  ! 1587: STW_R	stw	%r24, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xfa2c0000  ! 1591: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xb37d6401  ! 1593: MOVR_I	movre	%r21, 0x1, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xf2f4e0f3  ! 1598: STXA_I	stxa	%r25, [%r19 + 0x00f3] %asi
	.word 0xf03421b2  ! 1600: STH_I	sth	%r24, [%r16 + 0x01b2]
T3_asi_reg_wr_73:
	mov	0x1, %r14
	.word 0xf8f38e80  ! 1601: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_rd_67:
	mov	0xb, %r14
	.word 0xfcdb84a0  ! 1603: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_126:
	setx	0x28001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_127:
	setx	0x2a0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad4020  ! 1607: STBA_R	stba	%r24, [%r21 + %r0] 0x01
	.word 0xfeb5e07a  ! 1608: STHA_I	stha	%r31, [%r23 + 0x007a] %asi
T3_asi_reg_rd_68:
	mov	0x35, %r14
	.word 0xfcdb8e80  ! 1609: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf0354000  ! 1613: STH_R	sth	%r24, [%r21 + %r0]
cpu_intr_3_128:
	setx	0x20209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2754000  ! 1616: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf224a03b  ! 1618: STW_I	stw	%r25, [%r18 + 0x003b]
cpu_intr_3_129:
	setx	0x280223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa58020  ! 1621: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 31)
	.word 0xfe24610b  ! 1624: STW_I	stw	%r31, [%r17 + 0x010b]
T3_asi_reg_rd_69:
	mov	0x38, %r14
	.word 0xf2db89e0  ! 1625: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbf7d6401  ! 1629: MOVR_I	movre	%r21, 0x1, %r31
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfaad8020  ! 1631: STBA_R	stba	%r29, [%r22 + %r0] 0x01
	.word 0xfead0020  ! 1633: STBA_R	stba	%r31, [%r20 + %r0] 0x01
T3_asi_reg_wr_74:
	mov	0x20, %r14
	.word 0xfaf38e40  ! 1635: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_wr_75:
	mov	0x23, %r14
	.word 0xf0f38e80  ! 1641: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_130:
	setx	0x280104, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_76:
	mov	0x31, %r14
	.word 0xf0f38e40  ! 1650: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_77:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 1651: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_131:
	setx	0x2b021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2521c3  ! 1653: STW_I	stw	%r29, [%r20 + 0x01c3]
	.word 0xf035a16f  ! 1654: STH_I	sth	%r24, [%r22 + 0x016f]
	.word 0xf0b40020  ! 1655: STHA_R	stha	%r24, [%r16 + %r0] 0x01
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf834a011  ! 1660: STH_I	sth	%r28, [%r18 + 0x0011]
cpu_intr_3_132:
	setx	0x2a0228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_133:
	setx	0x290035, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_70:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 1668: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_rd_71:
	mov	0x1a, %r14
	.word 0xf8db84a0  ! 1669: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_wr_78:
	mov	0x6, %r14
	.word 0xf0f384a0  ! 1672: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf6b5a14a  ! 1673: STHA_I	stha	%r27, [%r22 + 0x014a] %asi
	.word 0xf82c0000  ! 1674: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xf624200d  ! 1677: STW_I	stw	%r27, [%r16 + 0x000d]
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 26)
	.word 0xf2a5a15d  ! 1680: STWA_I	stwa	%r25, [%r22 + 0x015d] %asi
	.word 0xa1902000  ! 1681: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xf8a5c020  ! 1684: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
T3_asi_reg_rd_72:
	mov	0x14, %r14
	.word 0xf0db89e0  ! 1685: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf635c000  ! 1686: STH_R	sth	%r27, [%r23 + %r0]
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 4)
	.word 0xfcf42007  ! 1689: STXA_I	stxa	%r30, [%r16 + 0x0007] %asi
cpu_intr_3_134:
	setx	0x2a0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_73:
	mov	0x2e, %r14
	.word 0xf8db84a0  ! 1693: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf83420fb  ! 1694: STH_I	sth	%r28, [%r16 + 0x00fb]
T3_asi_reg_rd_74:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 1695: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_79:
	mov	0x16, %r14
	.word 0xf8f389e0  ! 1697: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf0248000  ! 1702: STW_R	stw	%r24, [%r18 + %r0]
cpu_intr_3_135:
	setx	0x29030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24a17e  ! 1705: STW_I	stw	%r30, [%r18 + 0x017e]
	.word 0xfc2c4000  ! 1710: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xf0346005  ! 1713: STH_I	sth	%r24, [%r17 + 0x0005]
	.word 0xf635e182  ! 1715: STH_I	sth	%r27, [%r23 + 0x0182]
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_136:
	setx	0x2b012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595a0d6  ! 1721: WRPR_TSTATE_I	wrpr	%r22, 0x00d6, %tstate
	ta	T_CHANGE_TO_TL0
cpu_intr_3_137:
	setx	0x290229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc740000  ! 1729: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xb4ac8000  ! 1733: ANDNcc_R	andncc 	%r18, %r0, %r26
	.word 0xf2752072  ! 1739: STX_I	stx	%r25, [%r20 + 0x0072]
	.word 0xb8c420e7  ! 1742: ADDCcc_I	addccc 	%r16, 0x00e7, %r28
	.word 0xf22d210e  ! 1744: STB_I	stb	%r25, [%r20 + 0x010e]
cpu_intr_3_138:
	setx	0x2b033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_75:
	mov	0x28, %r14
	.word 0xfcdb8e80  ! 1746: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T3_asi_reg_rd_76:
	mov	0x3c8, %r14
	.word 0xfadb89e0  ! 1748: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf2ad6137  ! 1749: STBA_I	stba	%r25, [%r21 + 0x0137] %asi
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 20)
	.word 0xf035a130  ! 1756: STH_I	sth	%r24, [%r22 + 0x0130]
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_80:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 1759: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_81:
	mov	0x1d, %r14
	.word 0xf4f389e0  ! 1762: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf6b48020  ! 1763: STHA_R	stha	%r27, [%r18 + %r0] 0x01
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 38)
	.word 0xb234a076  ! 1765: ORN_I	orn 	%r18, 0x0076, %r25
	.word 0xf22d6018  ! 1767: STB_I	stb	%r25, [%r21 + 0x0018]
T3_asi_reg_wr_82:
	mov	0x26, %r14
	.word 0xf0f38400  ! 1770: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0x9195e03a  ! 1773: WRPR_PIL_I	wrpr	%r23, 0x003a, %pil
	.word 0xfaa560e9  ! 1775: STWA_I	stwa	%r29, [%r21 + 0x00e9] %asi
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_rd_77:
	mov	0x3c5, %r14
	.word 0xf6db89e0  ! 1777: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf4f5a1e9  ! 1778: STXA_I	stxa	%r26, [%r22 + 0x01e9] %asi
cpu_intr_3_139:
	setx	0x280233, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_78:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 1783: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_79:
	mov	0x32, %r14
	.word 0xfadb84a0  ! 1790: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_140:
	setx	0x2a0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2d61be  ! 1792: ANDN_I	andn 	%r21, 0x01be, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xfeac60fb  ! 1800: STBA_I	stba	%r31, [%r17 + 0x00fb] %asi
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 1)
	.word 0xf82c8000  ! 1805: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xfaac0020  ! 1806: STBA_R	stba	%r29, [%r16 + %r0] 0x01
	.word 0xf0b4e18c  ! 1807: STHA_I	stha	%r24, [%r19 + 0x018c] %asi
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_141:
	setx	0x280018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_142:
	setx	0x2a0017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 26)
	.word 0xfe25e00a  ! 1818: STW_I	stw	%r31, [%r23 + 0x000a]
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_80:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 1820: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfa744000  ! 1821: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xbf347001  ! 1822: SRLX_I	srlx	%r17, 0x0001, %r31
	.word 0xbd2d1000  ! 1823: SLLX_R	sllx	%r20, %r0, %r30
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_143:
	setx	0x29022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_83:
	mov	0x6, %r14
	.word 0xfcf38e40  ! 1832: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf6a54020  ! 1833: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
	.word 0xf425c000  ! 1835: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xf2adc020  ! 1836: STBA_R	stba	%r25, [%r23 + %r0] 0x01
cpu_intr_3_144:
	setx	0x2f012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_81:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 1839: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf62dc000  ! 1842: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xf8ade01f  ! 1845: STBA_I	stba	%r28, [%r23 + 0x001f] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_145:
	setx	0x2d0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc340000  ! 1851: STH_R	sth	%r30, [%r16 + %r0]
T3_asi_reg_wr_84:
	mov	0x16, %r14
	.word 0xf0f38e60  ! 1852: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_rd_82:
	mov	0x23, %r14
	.word 0xf4db89e0  ! 1862: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T3_asi_reg_rd_83:
	mov	0x13, %r14
	.word 0xfcdb8e60  ! 1865: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_146:
	setx	0x2e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7343001  ! 1870: SRLX_I	srlx	%r16, 0x0001, %r27
cpu_intr_3_147:
	setx	0x2c001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6040000  ! 1877: ADD_R	add 	%r16, %r0, %r27
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_148:
	setx	0x2c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02ce0c6  ! 1889: STB_I	stb	%r24, [%r19 + 0x00c6]
	.word 0xb2a560da  ! 1890: SUBcc_I	subcc 	%r21, 0x00da, %r25
cpu_intr_3_149:
	setx	0x2d0204, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_85:
	mov	0x26, %r14
	.word 0xf4f38e40  ! 1892: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb2bc604b  ! 1895: XNORcc_I	xnorcc 	%r17, 0x004b, %r25
cpu_intr_3_150:
	setx	0x2d021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_151:
	setx	0x2e0226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 2e)
	ta	T_CHANGE_TO_TL1
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_wr_86:
	mov	0x3c2, %r14
	.word 0xfcf38e60  ! 1916: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_87:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 1919: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_152:
	setx	0x2f0000, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_88:
	mov	0x3c6, %r14
	.word 0xf0f38400  ! 1921: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 2b)
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982848  ! 1926: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0848, %hpstate
cpu_intr_3_153:
	setx	0x2c032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf435c000  ! 1931: STH_R	sth	%r26, [%r23 + %r0]
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_wr_89:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 1937: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T3_asi_reg_rd_84:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 1938: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf2748000  ! 1940: STX_R	stx	%r25, [%r18 + %r0]
T3_asi_reg_rd_85:
	mov	0x3c2, %r14
	.word 0xf4db84a0  ! 1941: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfc35e14c  ! 1946: STH_I	sth	%r30, [%r23 + 0x014c]
	.word 0xf0a4c020  ! 1947: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	.word 0x8f902002  ! 1949: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf4350000  ! 1954: STH_R	sth	%r26, [%r20 + %r0]
cpu_intr_3_154:
	setx	0x2e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_90:
	mov	0x22, %r14
	.word 0xf6f38400  ! 1957: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbf520000  ! 1958: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf2a44020  ! 1959: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
cpu_intr_3_155:
	setx	0x2d011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 1963: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
cpu_intr_3_156:
	setx	0x2f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc344000  ! 1966: STH_R	sth	%r30, [%r17 + %r0]
cpu_intr_3_157:
	setx	0x2c0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9da072  ! 1968: XORcc_I	xorcc 	%r22, 0x0072, %r31
	.word 0xfa2d0000  ! 1969: STB_R	stb	%r29, [%r20 + %r0]
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 22)
	.word 0xfc2cc000  ! 1972: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xfc2c21ae  ! 1974: STB_I	stb	%r30, [%r16 + 0x01ae]
cpu_intr_3_158:
	setx	0x2f0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba142067  ! 1976: OR_I	or 	%r16, 0x0067, %r29
cpu_intr_3_159:
	setx	0x2f003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd359000  ! 1978: SRLX_R	srlx	%r22, %r0, %r30
	.word 0xfe358000  ! 1982: STH_R	sth	%r31, [%r22 + %r0]
T3_asi_reg_rd_86:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 1984: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf22d8000  ! 1986: STB_R	stb	%r25, [%r22 + %r0]
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 32)
	.word 0xf625e18c  ! 1989: STW_I	stw	%r27, [%r23 + 0x018c]
cpu_intr_3_160:
	setx	0x2d0012, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_87:
	mov	0x3c7, %r14
	.word 0xf6db8e60  ! 1992: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_161:
	setx	0x2c0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2758000  ! 1994: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xf2a5e084  ! 1997: STWA_I	stwa	%r25, [%r23 + 0x0084] %asi
	.word 0xbcbde0d0  ! 1998: XNORcc_I	xnorcc 	%r23, 0x00d0, %r30
	.word 0xfc258000  ! 1999: STW_R	stw	%r30, [%r22 + %r0]
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, f)
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 0)
	.word 0xf2f42183  ! 2004: STXA_I	stxa	%r25, [%r16 + 0x0183] %asi
cpu_intr_3_162:
	setx	0x2e0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982990  ! 2008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0990, %hpstate
cpu_intr_3_163:
	setx	0x2c013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf8348000  ! 2012: STH_R	sth	%r28, [%r18 + %r0]
T3_asi_reg_wr_91:
	mov	0x23, %r14
	.word 0xfef38e40  ! 2018: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_rd_88:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 2020: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbb504000  ! 2022: RDPR_TNPC	rdpr	%tnpc, %r29
cpu_intr_3_164:
	setx	0x2f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_89:
	mov	0x12, %r14
	.word 0xfadb89e0  ! 2025: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfc25a169  ! 2026: STW_I	stw	%r30, [%r22 + 0x0169]
T3_asi_reg_rd_90:
	mov	0x3c3, %r14
	.word 0xfedb8e60  ! 2027: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 36)
	.word 0xf2b40020  ! 2032: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	.word 0x8f902001  ! 2033: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xf42c4000  ! 2034: STB_R	stb	%r26, [%r17 + %r0]
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_rd_91:
	mov	0x11, %r14
	.word 0xfedb84a0  ! 2044: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfc2d0000  ! 2045: STB_R	stb	%r30, [%r20 + %r0]
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 32)
	.word 0xf6352083  ! 2055: STH_I	sth	%r27, [%r20 + 0x0083]
cpu_intr_3_165:
	setx	0x2c0227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 3)
	.word 0xf0b54020  ! 2058: STHA_R	stha	%r24, [%r21 + %r0] 0x01
	.word 0xfaa54020  ! 2060: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_166:
	setx	0x2e0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5e1ad  ! 2069: STHA_I	stha	%r31, [%r23 + 0x01ad] %asi
	.word 0xfca50020  ! 2070: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
T3_asi_reg_rd_92:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 2072: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf235a18e  ! 2073: STH_I	sth	%r25, [%r22 + 0x018e]
cpu_intr_3_167:
	setx	0x2d022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_168:
	setx	0x2f0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a50020  ! 2078: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_169:
	setx	0x2d0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ada1d7  ! 2083: STBA_I	stba	%r28, [%r22 + 0x01d7] %asi
	.word 0xf8a50020  ! 2085: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
cpu_intr_3_170:
	setx	0x2f0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf274a1b1  ! 2091: STX_I	stx	%r25, [%r18 + 0x01b1]
	.word 0xfc25618f  ! 2093: STW_I	stw	%r30, [%r21 + 0x018f]
	.word 0xb434209d  ! 2094: ORN_I	orn 	%r16, 0x009d, %r26
	.word 0xfc2520c8  ! 2098: STW_I	stw	%r30, [%r20 + 0x00c8]
	.word 0xf475c000  ! 2099: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xbac460e8  ! 2101: ADDCcc_I	addccc 	%r17, 0x00e8, %r29
T3_asi_reg_rd_93:
	mov	0x3c0, %r14
	.word 0xf8db8e60  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 18)
	.word 0xb21d8000  ! 2108: XOR_R	xor 	%r22, %r0, %r25
	.word 0xf075a199  ! 2110: STX_I	stx	%r24, [%r22 + 0x0199]
	.word 0xbab54000  ! 2116: SUBCcc_R	orncc 	%r21, %r0, %r29
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 17)
	.word 0xfc246069  ! 2128: STW_I	stw	%r30, [%r17 + 0x0069]
	ta	T_CHANGE_HPRIV
	.word 0xf2a58020  ! 2131: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	.word 0xf8a56127  ! 2132: STWA_I	stwa	%r28, [%r21 + 0x0127] %asi
	.word 0xf03520ce  ! 2133: STH_I	sth	%r24, [%r20 + 0x00ce]
	.word 0xfa344000  ! 2136: STH_R	sth	%r29, [%r17 + %r0]
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_171:
	setx	0x2f0322, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_92:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 2145: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfa344000  ! 2146: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xba25c000  ! 2147: SUB_R	sub 	%r23, %r0, %r29
	.word 0xbd35d000  ! 2151: SRLX_R	srlx	%r23, %r0, %r30
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, e)
	.word 0xf475609b  ! 2154: STX_I	stx	%r26, [%r21 + 0x009b]
cpu_intr_3_172:
	setx	0x2f0034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_173:
	setx	0x2c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 12)
	.word 0xfca40020  ! 2162: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
	.word 0xfaac0020  ! 2163: STBA_R	stba	%r29, [%r16 + %r0] 0x01
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_94:
	mov	0x3c5, %r14
	.word 0xfadb84a0  ! 2170: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5480000  ! 2171: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
T3_asi_reg_wr_93:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 2172: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_174:
	setx	0x2f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_175:
	setx	0x2e0318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 3c)
cpu_intr_3_176:
	setx	0x2e010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_177:
	setx	0x2c0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf8a420ed  ! 2181: STWA_I	stwa	%r28, [%r16 + 0x00ed] %asi
cpu_intr_3_178:
	setx	0x2f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb46188  ! 2189: STHA_I	stha	%r31, [%r17 + 0x0188] %asi
	.word 0xf8a40020  ! 2190: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	.word 0xf42c616d  ! 2191: STB_I	stb	%r26, [%r17 + 0x016d]
cpu_intr_3_179:
	setx	0x2d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac0020  ! 2193: STBA_R	stba	%r27, [%r16 + %r0] 0x01
	.word 0xfcad0020  ! 2194: STBA_R	stba	%r30, [%r20 + %r0] 0x01
cpu_intr_3_180:
	setx	0x2c020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5a1ae  ! 2197: STHA_I	stha	%r28, [%r22 + 0x01ae] %asi
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_181:
	setx	0x2d0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02cc000  ! 2203: STB_R	stb	%r24, [%r19 + %r0]
T3_asi_reg_rd_95:
	mov	0x14, %r14
	.word 0xf4db8e40  ! 2205: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfcac0020  ! 2209: STBA_R	stba	%r30, [%r16 + %r0] 0x01
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf6a50020  ! 2212: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
	.word 0xbc054000  ! 2215: ADD_R	add 	%r21, %r0, %r30
	.word 0xb635e020  ! 2219: SUBC_I	orn 	%r23, 0x0020, %r27
T3_asi_reg_rd_96:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 2222: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8b48020  ! 2224: STHA_R	stha	%r28, [%r18 + %r0] 0x01
	.word 0xf2f4a1e6  ! 2225: STXA_I	stxa	%r25, [%r18 + 0x01e6] %asi
	.word 0x8f902001  ! 2226: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
T3_asi_reg_rd_97:
	mov	0x32, %r14
	.word 0xfedb8e80  ! 2227: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xf22d4000  ! 2233: STB_R	stb	%r25, [%r21 + %r0]
T3_asi_reg_wr_94:
	mov	0xe, %r14
	.word 0xfef389e0  ! 2234: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbcac8000  ! 2235: ANDNcc_R	andncc 	%r18, %r0, %r30
T3_asi_reg_rd_98:
	mov	0x4, %r14
	.word 0xf0db8e40  ! 2236: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_182:
	setx	0x2c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 8)
	.word 0xfe35e061  ! 2242: STH_I	sth	%r31, [%r23 + 0x0061]
	.word 0xf0ade069  ! 2243: STBA_I	stba	%r24, [%r23 + 0x0069] %asi
T3_asi_reg_wr_95:
	mov	0x2d, %r14
	.word 0xf6f384a0  ! 2244: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_rd_99:
	mov	0x17, %r14
	.word 0xfadb8400  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfc2560a4  ! 2249: STW_I	stw	%r30, [%r21 + 0x00a4]
cpu_intr_3_183:
	setx	0x2f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf474a1db  ! 2254: STX_I	stx	%r26, [%r18 + 0x01db]
cpu_intr_3_184:
	setx	0x2c020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_96:
	mov	0x27, %r14
	.word 0xf8f38400  ! 2264: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfc2c219f  ! 2265: STB_I	stb	%r30, [%r16 + 0x019f]
	.word 0xf8ac613e  ! 2266: STBA_I	stba	%r28, [%r17 + 0x013e] %asi
	.word 0xf0358000  ! 2268: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xfc3460b0  ! 2272: STH_I	sth	%r30, [%r17 + 0x00b0]
	.word 0xfc358000  ! 2273: STH_R	sth	%r30, [%r22 + %r0]
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 16)
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819829da  ! 2275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09da, %hpstate
	.word 0xf8ad2030  ! 2277: STBA_I	stba	%r28, [%r20 + 0x0030] %asi
	.word 0xb52d3001  ! 2278: SLLX_I	sllx	%r20, 0x0001, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xfeb4e067  ! 2283: STHA_I	stha	%r31, [%r19 + 0x0067] %asi
cpu_intr_3_185:
	setx	0x2d0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa252039  ! 2291: STW_I	stw	%r29, [%r20 + 0x0039]
T3_asi_reg_wr_97:
	mov	0x1b, %r14
	.word 0xfaf38e80  ! 2292: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a88  ! 2296: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a88, %hpstate
T3_asi_reg_wr_98:
	mov	0x3c6, %r14
	.word 0xfcf384a0  ! 2297: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfef46190  ! 2299: STXA_I	stxa	%r31, [%r17 + 0x0190] %asi
	.word 0xfa2c4000  ! 2300: STB_R	stb	%r29, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_100:
	mov	0x30, %r14
	.word 0xfcdb8e60  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfab5a0a2  ! 2304: STHA_I	stha	%r29, [%r22 + 0x00a2] %asi
T3_asi_reg_wr_99:
	mov	0x2b, %r14
	.word 0xfcf384a0  ! 2309: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb80c8000  ! 2311: AND_R	and 	%r18, %r0, %r28
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_rd_101:
	mov	0x13, %r14
	.word 0xfedb89e0  ! 2314: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfef42067  ! 2315: STXA_I	stxa	%r31, [%r16 + 0x0067] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xf22d8000  ! 2317: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xf224c000  ! 2319: STW_R	stw	%r25, [%r19 + %r0]
cpu_intr_3_186:
	setx	0x300120, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_102:
	mov	0x2f, %r14
	.word 0xfcdb89e0  ! 2323: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf0740000  ! 2324: STX_R	stx	%r24, [%r16 + %r0]
cpu_intr_3_187:
	setx	0x330327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_188:
	setx	0x33001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcad0020  ! 2328: STBA_R	stba	%r30, [%r20 + %r0] 0x01
	.word 0xf2344000  ! 2329: STH_R	sth	%r25, [%r17 + %r0]
T3_asi_reg_rd_103:
	mov	0x1f, %r14
	.word 0xf2db8e40  ! 2332: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 18)
	.word 0xf275e182  ! 2341: STX_I	stx	%r25, [%r23 + 0x0182]
T3_asi_reg_wr_100:
	mov	0x2a, %r14
	.word 0xf8f384a0  ! 2342: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_189:
	setx	0x310235, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_101:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 2344: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 30)
	.word 0xfaade0f1  ! 2346: STBA_I	stba	%r29, [%r23 + 0x00f1] %asi
	.word 0xf8a4c020  ! 2347: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
	.word 0xfc358000  ! 2350: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xb32c0000  ! 2354: SLL_R	sll 	%r16, %r0, %r25
	.word 0xbe346047  ! 2357: SUBC_I	orn 	%r17, 0x0047, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xfeb5e0c9  ! 2360: STHA_I	stha	%r31, [%r23 + 0x00c9] %asi
cpu_intr_3_190:
	setx	0x330019, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_104:
	mov	0x32, %r14
	.word 0xf8db8e80  ! 2365: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb52d0000  ! 2368: SLL_R	sll 	%r20, %r0, %r26
	.word 0xf2a460ee  ! 2369: STWA_I	stwa	%r25, [%r17 + 0x00ee] %asi
	.word 0xf4356194  ! 2372: STH_I	sth	%r26, [%r21 + 0x0194]
cpu_intr_3_191:
	setx	0x32003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22dc000  ! 2374: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xf6258000  ! 2376: STW_R	stw	%r27, [%r22 + %r0]
T3_asi_reg_rd_105:
	mov	0x28, %r14
	.word 0xf2db8e80  ! 2377: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_HPRIV
	.word 0xfa744000  ! 2381: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xf8a5a1b7  ! 2383: STWA_I	stwa	%r28, [%r22 + 0x01b7] %asi
	.word 0xf22c8000  ! 2384: STB_R	stb	%r25, [%r18 + %r0]
T3_asi_reg_rd_106:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_107:
	mov	0x2b, %r14
	.word 0xfcdb89e0  ! 2387: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfab48020  ! 2390: STHA_R	stha	%r29, [%r18 + %r0] 0x01
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 19)
	.word 0xfe248000  ! 2393: STW_R	stw	%r31, [%r18 + %r0]
T3_asi_reg_rd_108:
	mov	0xa, %r14
	.word 0xfcdb8e40  ! 2394: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_109:
	mov	0x24, %r14
	.word 0xf0db8e40  ! 2396: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb37da401  ! 2397: MOVR_I	movre	%r22, 0x1, %r25
cpu_intr_3_192:
	setx	0x300302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc744000  ! 2401: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xfcb48020  ! 2402: STHA_R	stha	%r30, [%r18 + %r0] 0x01
	.word 0xbab4a01a  ! 2403: ORNcc_I	orncc 	%r18, 0x001a, %r29
cpu_intr_3_193:
	setx	0x300321, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_102:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 2411: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfa354000  ! 2412: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf62da0d0  ! 2413: STB_I	stb	%r27, [%r22 + 0x00d0]
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_194:
	setx	0x300129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c6001  ! 2424: SRA_I	sra 	%r17, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0xf4a58020  ! 2426: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
	.word 0xfa2ce02d  ! 2427: STB_I	stb	%r29, [%r19 + 0x002d]
	.word 0xf2f4a1e3  ! 2429: STXA_I	stxa	%r25, [%r18 + 0x01e3] %asi
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_195:
	setx	0x31000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_196:
	setx	0x300305, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_197:
	setx	0x33000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5e1cf  ! 2439: STWA_I	stwa	%r25, [%r23 + 0x01cf] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xfc2d61d6  ! 2442: STB_I	stb	%r30, [%r21 + 0x01d6]
	.word 0xf62ca025  ! 2444: STB_I	stb	%r27, [%r18 + 0x0025]
	.word 0xf2358000  ! 2448: STH_R	sth	%r25, [%r22 + %r0]
T3_asi_reg_rd_110:
	mov	0x18, %r14
	.word 0xfedb8e80  ! 2449: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfc24a131  ! 2450: STW_I	stw	%r30, [%r18 + 0x0131]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_198:
	setx	0x310206, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_103:
	mov	0x27, %r14
	.word 0xfcf389e0  ! 2455: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, b)
	.word 0xf0b4a031  ! 2458: STHA_I	stha	%r24, [%r18 + 0x0031] %asi
	.word 0xfcad0020  ! 2459: STBA_R	stba	%r30, [%r20 + %r0] 0x01
cpu_intr_3_199:
	setx	0x300001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_104:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 2463: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_rd_111:
	mov	0x23, %r14
	.word 0xf8db8e60  ! 2464: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbab561b2  ! 2465: ORNcc_I	orncc 	%r21, 0x01b2, %r29
	.word 0xf8342045  ! 2467: STH_I	sth	%r28, [%r16 + 0x0045]
T3_asi_reg_wr_105:
	mov	0x23, %r14
	.word 0xf6f384a0  ! 2468: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_200:
	setx	0x30001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a54020  ! 2471: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
	.word 0xf825a05f  ! 2475: STW_I	stw	%r28, [%r22 + 0x005f]
	.word 0xf8a50020  ! 2476: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
cpu_intr_3_201:
	setx	0x30010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_112:
	mov	0x1a, %r14
	.word 0xf2db8e60  ! 2481: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbd2c0000  ! 2487: SLL_R	sll 	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2ca0e1  ! 2491: STB_I	stb	%r29, [%r18 + 0x00e1]
	.word 0xfa744000  ! 2493: STX_R	stx	%r29, [%r17 + %r0]
T3_asi_reg_wr_106:
	mov	0x28, %r14
	.word 0xfcf38e60  ! 2494: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_202:
	setx	0x310017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea5c020  ! 2503: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
cpu_intr_3_203:
	setx	0x310028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8250000  ! 2505: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf62c20ac  ! 2510: STB_I	stb	%r27, [%r16 + 0x00ac]
	.word 0xf6ad203f  ! 2511: STBA_I	stba	%r27, [%r20 + 0x003f] %asi
	.word 0xf8a44020  ! 2512: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
	.word 0xfead4020  ! 2513: STBA_R	stba	%r31, [%r21 + %r0] 0x01
	.word 0xf2acc020  ! 2514: STBA_R	stba	%r25, [%r19 + %r0] 0x01
	.word 0xfa246002  ! 2518: STW_I	stw	%r29, [%r17 + 0x0002]
	ta	T_CHANGE_HPRIV
	.word 0xf424a125  ! 2520: STW_I	stw	%r26, [%r18 + 0x0125]
T3_asi_reg_rd_113:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8ac60e9  ! 2523: STBA_I	stba	%r28, [%r17 + 0x00e9] %asi
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, e)
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983f18  ! 2526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f18, %hpstate
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_204:
	setx	0x33003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_205:
	setx	0x330333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 6)
	.word 0xfc240000  ! 2533: STW_R	stw	%r30, [%r16 + %r0]
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 1b)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983ad2  ! 2537: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad2, %hpstate
T3_asi_reg_wr_107:
	mov	0x3c8, %r14
	.word 0xfcf384a0  ! 2542: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_wr_108:
	mov	0x25, %r14
	.word 0xfcf38e80  ! 2544: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f00  ! 2546: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f00, %hpstate
T3_asi_reg_rd_114:
	mov	0x5, %r14
	.word 0xf0db8e60  ! 2547: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf2b44020  ! 2550: STHA_R	stha	%r25, [%r17 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
cpu_intr_3_206:
	setx	0x300204, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb28d2012  ! 2556: ANDcc_I	andcc 	%r20, 0x0012, %r25
	.word 0xb81d4000  ! 2560: XOR_R	xor 	%r21, %r0, %r28
T3_asi_reg_rd_115:
	mov	0x8, %r14
	.word 0xfadb8e60  ! 2563: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf4a52077  ! 2566: STWA_I	stwa	%r26, [%r20 + 0x0077] %asi
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, b)
	.word 0xbabc6170  ! 2568: XNORcc_I	xnorcc 	%r17, 0x0170, %r29
	.word 0xf6348000  ! 2569: STH_R	sth	%r27, [%r18 + %r0]
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, c)
	.word 0xf42d0000  ! 2571: STB_R	stb	%r26, [%r20 + %r0]
cpu_intr_3_207:
	setx	0x31020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_208:
	setx	0x320325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfaa5c020  ! 2583: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_209:
	setx	0x320115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf034e010  ! 2591: STH_I	sth	%r24, [%r19 + 0x0010]
cpu_intr_3_210:
	setx	0x300212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b54020  ! 2602: STHA_R	stha	%r26, [%r21 + %r0] 0x01
cpu_intr_3_211:
	setx	0x330002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_109:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 2609: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_116:
	mov	0xf, %r14
	.word 0xfcdb8e40  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_212:
	setx	0x320329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_213:
	setx	0x33031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_214:
	setx	0x30030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc250000  ! 2616: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf2258000  ! 2617: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xb12d3001  ! 2618: SLLX_I	sllx	%r20, 0x0001, %r24
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0740000  ! 2623: STX_R	stx	%r24, [%r16 + %r0]
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 32)
	.word 0xf2a48020  ! 2626: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
cpu_intr_3_215:
	setx	0x310208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8560e3  ! 2632: ADDcc_I	addcc 	%r21, 0x00e3, %r29
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfe2d4000  ! 2634: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xf6748000  ! 2635: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xb8b50000  ! 2638: ORNcc_R	orncc 	%r20, %r0, %r28
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_110:
	mov	0xa, %r14
	.word 0xfef389e0  ! 2640: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_rd_117:
	mov	0x33, %r14
	.word 0xf2db89e0  ! 2644: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbe246077  ! 2647: SUB_I	sub 	%r17, 0x0077, %r31
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_rd_118:
	mov	0x11, %r14
	.word 0xf8db8400  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf62c0000  ! 2652: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xfea420c2  ! 2653: STWA_I	stwa	%r31, [%r16 + 0x00c2] %asi
	.word 0xf4ade198  ! 2654: STBA_I	stba	%r26, [%r23 + 0x0198] %asi
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 4)
	.word 0xfe742021  ! 2657: STX_I	stx	%r31, [%r16 + 0x0021]
	.word 0xf82da0ea  ! 2659: STB_I	stb	%r28, [%r22 + 0x00ea]
cpu_intr_3_216:
	setx	0x320332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaace057  ! 2661: ANDNcc_I	andncc 	%r19, 0x0057, %r29
cpu_intr_3_217:
	setx	0x320323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 25)
	.word 0xf2a4c020  ! 2668: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
T3_asi_reg_wr_111:
	mov	0x7, %r14
	.word 0xf2f389e0  ! 2671: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfeb42068  ! 2674: STHA_I	stha	%r31, [%r16 + 0x0068] %asi
cpu_intr_3_218:
	setx	0x300231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_219:
	setx	0x32021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf035a1cd  ! 2679: STH_I	sth	%r24, [%r22 + 0x01cd]
T3_asi_reg_rd_119:
	mov	0x5, %r14
	.word 0xfadb8e40  ! 2681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfea48020  ! 2683: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
	.word 0xbe844000  ! 2684: ADDcc_R	addcc 	%r17, %r0, %r31
	.word 0xfaac4020  ! 2685: STBA_R	stba	%r29, [%r17 + %r0] 0x01
	.word 0xb82421e9  ! 2688: SUB_I	sub 	%r16, 0x01e9, %r28
T3_asi_reg_rd_120:
	mov	0x18, %r14
	.word 0xf6db8400  ! 2690: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_rd_121:
	mov	0x0, %r14
	.word 0xf0db89e0  ! 2691: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_wr_112:
	mov	0xb, %r14
	.word 0xfef38e40  ! 2692: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_rd_122:
	mov	0x2b, %r14
	.word 0xf4db8e80  ! 2697: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfcf461e2  ! 2701: STXA_I	stxa	%r30, [%r17 + 0x01e2] %asi
	.word 0xf034c000  ! 2703: STH_R	sth	%r24, [%r19 + %r0]
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfe342047  ! 2719: STH_I	sth	%r31, [%r16 + 0x0047]
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x819829ca  ! 2721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ca, %hpstate
	.word 0xbe0de0b0  ! 2722: AND_I	and 	%r23, 0x00b0, %r31
	.word 0xf8ade152  ! 2725: STBA_I	stba	%r28, [%r23 + 0x0152] %asi
	.word 0xf6a46055  ! 2728: STWA_I	stwa	%r27, [%r17 + 0x0055] %asi
	.word 0xb3358000  ! 2729: SRL_R	srl 	%r22, %r0, %r25
cpu_intr_3_220:
	setx	0x320114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17ce401  ! 2736: MOVR_I	movre	%r19, 0x1, %r24
cpu_intr_3_221:
	setx	0x30032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5a1c3  ! 2739: STWA_I	stwa	%r30, [%r22 + 0x01c3] %asi
T3_asi_reg_rd_123:
	mov	0x38, %r14
	.word 0xfcdb8e60  ! 2740: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_222:
	setx	0x33001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2ce179  ! 2742: STB_I	stb	%r30, [%r19 + 0x0179]
	.word 0xb93c4000  ! 2743: SRA_R	sra 	%r17, %r0, %r28
	.word 0xfa35e0f6  ! 2744: STH_I	sth	%r29, [%r23 + 0x00f6]
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, e)
	.word 0xbf51c000  ! 2750: RDPR_TL	rdpr	%tl, %r31
	.word 0xf8b56034  ! 2751: STHA_I	stha	%r28, [%r21 + 0x0034] %asi
	.word 0xfa2421d2  ! 2752: STW_I	stw	%r29, [%r16 + 0x01d2]
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf0a48020  ! 2757: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	.word 0xfaaca127  ! 2758: STBA_I	stba	%r29, [%r18 + 0x0127] %asi
cpu_intr_3_223:
	setx	0x32032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675202e  ! 2760: STX_I	stx	%r27, [%r20 + 0x002e]
T3_asi_reg_wr_113:
	mov	0x14, %r14
	.word 0xf4f38e60  ! 2763: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb12cf001  ! 2765: SLLX_I	sllx	%r19, 0x0001, %r24
cpu_intr_3_224:
	setx	0x34031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_124:
	mov	0x3, %r14
	.word 0xfadb8e80  ! 2767: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xfa34a1c9  ! 2771: STH_I	sth	%r29, [%r18 + 0x01c9]
	.word 0xf8ac0020  ! 2773: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xf02dc000  ! 2774: STB_R	stb	%r24, [%r23 + %r0]
cpu_intr_3_225:
	setx	0x360112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb349000  ! 2776: SRLX_R	srlx	%r18, %r0, %r29
T3_asi_reg_rd_125:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 2777: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_wr_114:
	mov	0x27, %r14
	.word 0xfcf38e60  ! 2780: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_226:
	setx	0x350318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_227:
	setx	0x37022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 17)
	.word 0xfaf4e110  ! 2789: STXA_I	stxa	%r29, [%r19 + 0x0110] %asi
T3_asi_reg_rd_126:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 2791: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfeada065  ! 2792: STBA_I	stba	%r31, [%r22 + 0x0065] %asi
	.word 0xf4f56110  ! 2793: STXA_I	stxa	%r26, [%r21 + 0x0110] %asi
	.word 0xf02cc000  ! 2794: STB_R	stb	%r24, [%r19 + %r0]
T3_asi_reg_wr_115:
	mov	0x26, %r14
	.word 0xf2f38400  ! 2795: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_127:
	mov	0x2f, %r14
	.word 0xf2db89e0  ! 2799: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_3_228:
	setx	0x360121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb461f6  ! 2802: STHA_I	stha	%r31, [%r17 + 0x01f6] %asi
cpu_intr_3_229:
	setx	0x370202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf274e02d  ! 2807: STX_I	stx	%r25, [%r19 + 0x002d]
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, f)
	.word 0xf8b58020  ! 2811: STHA_R	stha	%r28, [%r22 + %r0] 0x01
cpu_intr_3_230:
	setx	0x35010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf2b54020  ! 2816: STHA_R	stha	%r25, [%r21 + %r0] 0x01
cpu_intr_3_231:
	setx	0x34021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_116:
	mov	0x13, %r14
	.word 0xf8f389e0  ! 2829: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf6b4e1ba  ! 2830: STHA_I	stha	%r27, [%r19 + 0x01ba] %asi
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 8)
	.word 0xf6a421ca  ! 2838: STWA_I	stwa	%r27, [%r16 + 0x01ca] %asi
	.word 0xf0750000  ! 2840: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xfea48020  ! 2841: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
	.word 0xf4748000  ! 2842: STX_R	stx	%r26, [%r18 + %r0]
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_wr_117:
	mov	0xe, %r14
	.word 0xf0f38e40  ! 2846: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfc2421dc  ! 2848: STW_I	stw	%r30, [%r16 + 0x01dc]
	.word 0xb8c44000  ! 2849: ADDCcc_R	addccc 	%r17, %r0, %r28
cpu_intr_3_232:
	setx	0x340308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 38)
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c92  ! 2861: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c92, %hpstate
	.word 0xf02c4000  ! 2862: STB_R	stb	%r24, [%r17 + %r0]
T3_asi_reg_wr_118:
	mov	0x2e, %r14
	.word 0xf0f384a0  ! 2863: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf2754000  ! 2864: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf6758000  ! 2865: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xfa740000  ! 2866: STX_R	stx	%r29, [%r16 + %r0]
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_233:
	setx	0x35021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_234:
	setx	0x350034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2c20e3  ! 2877: ANDN_I	andn 	%r16, 0x00e3, %r29
cpu_intr_3_235:
	setx	0x360220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6258000  ! 2879: STW_R	stw	%r27, [%r22 + %r0]
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 3e)
	.word 0xb0bc601a  ! 2889: XNORcc_I	xnorcc 	%r17, 0x001a, %r24
	.word 0xfe2da059  ! 2890: STB_I	stb	%r31, [%r22 + 0x0059]
	.word 0xfca4a13e  ! 2894: STWA_I	stwa	%r30, [%r18 + 0x013e] %asi
	.word 0xf834214e  ! 2897: STH_I	sth	%r28, [%r16 + 0x014e]
cpu_intr_3_236:
	setx	0x34002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_119:
	mov	0x25, %r14
	.word 0xfaf38e80  ! 2900: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf0246012  ! 2903: STW_I	stw	%r24, [%r17 + 0x0012]
cpu_intr_3_237:
	setx	0x360220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab5c020  ! 2908: STHA_R	stha	%r29, [%r23 + %r0] 0x01
T3_asi_reg_wr_120:
	mov	0x29, %r14
	.word 0xf4f384a0  ! 2911: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf6756110  ! 2913: STX_I	stx	%r27, [%r21 + 0x0110]
cpu_intr_3_238:
	setx	0x34013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_121:
	mov	0xe, %r14
	.word 0xf8f38e80  ! 2918: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_wr_122:
	mov	0x3c6, %r14
	.word 0xf2f384a0  ! 2925: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_wr_123:
	mov	0x3c8, %r14
	.word 0xf8f38400  ! 2929: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb3518000  ! 2931: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xfca5c020  ! 2932: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
T3_asi_reg_wr_124:
	mov	0x3c0, %r14
	.word 0xf2f38e60  ! 2934: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfc758000  ! 2935: STX_R	stx	%r30, [%r22 + %r0]
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_239:
	setx	0x370023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_240:
	setx	0x360308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8acc020  ! 2949: STBA_R	stba	%r28, [%r19 + %r0] 0x01
T3_asi_reg_wr_125:
	mov	0x25, %r14
	.word 0xfcf389e0  ! 2950: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 0)
	.word 0xf0f4e0e7  ! 2956: STXA_I	stxa	%r24, [%r19 + 0x00e7] %asi
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b00  ! 2958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b00, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xf8252015  ! 2962: STW_I	stw	%r28, [%r20 + 0x0015]
	.word 0xfe246081  ! 2963: STW_I	stw	%r31, [%r17 + 0x0081]
T3_asi_reg_rd_128:
	mov	0x2, %r14
	.word 0xf6db89e0  ! 2964: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb285a0af  ! 2965: ADDcc_I	addcc 	%r22, 0x00af, %r25
T3_asi_reg_rd_129:
	mov	0x37, %r14
	.word 0xfedb8e60  ! 2972: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_241:
	setx	0x37020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_126:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 2974: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf6a50020  ! 2975: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
	.word 0xf2ad6015  ! 2978: STBA_I	stba	%r25, [%r21 + 0x0015] %asi
T3_asi_reg_wr_127:
	mov	0x2e, %r14
	.word 0xf0f38e80  ! 2979: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbe350000  ! 2986: ORN_R	orn 	%r20, %r0, %r31
	.word 0xf0a44020  ! 2988: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
	.word 0xfcad4020  ! 2989: STBA_R	stba	%r30, [%r21 + %r0] 0x01
	.word 0xfe258000  ! 2991: STW_R	stw	%r31, [%r22 + %r0]
T3_asi_reg_rd_130:
	mov	0x3c5, %r14
	.word 0xf8db89e0  ! 2992: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_242:
	setx	0x370225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2460f9  ! 2998: STW_I	stw	%r30, [%r17 + 0x00f9]
	.word 0xfe744000  ! 2999: STX_R	stx	%r31, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfeb58020  ! 3007: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xf22d212a  ! 3009: STB_I	stb	%r25, [%r20 + 0x012a]
	.word 0xfef420f6  ! 3012: STXA_I	stxa	%r31, [%r16 + 0x00f6] %asi
	.word 0xbc1cc000  ! 3015: XOR_R	xor 	%r19, %r0, %r30
	.word 0xf835a170  ! 3016: STH_I	sth	%r28, [%r22 + 0x0170]
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 17)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983e5a  ! 3020: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5a, %hpstate
	.word 0xf2748000  ! 3021: STX_R	stx	%r25, [%r18 + %r0]
cpu_intr_3_243:
	setx	0x36033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35610e  ! 3023: STH_I	sth	%r29, [%r21 + 0x010e]
	.word 0xf8240000  ! 3025: STW_R	stw	%r28, [%r16 + %r0]
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_rd_131:
	mov	0x34, %r14
	.word 0xfedb8e40  ! 3028: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_244:
	setx	0x37002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8240000  ! 3031: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xf8a4e1d3  ! 3032: STWA_I	stwa	%r28, [%r19 + 0x01d3] %asi
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982918  ! 3034: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0918, %hpstate
	.word 0xf4b4e14b  ! 3035: STHA_I	stha	%r26, [%r19 + 0x014b] %asi
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982d98  ! 3037: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d98, %hpstate
	.word 0xf4ac8020  ! 3041: STBA_R	stba	%r26, [%r18 + %r0] 0x01
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 3)
	.word 0xf8b420d7  ! 3045: STHA_I	stha	%r28, [%r16 + 0x00d7] %asi
	.word 0xfe2ca18b  ! 3049: STB_I	stb	%r31, [%r18 + 0x018b]
cpu_intr_3_245:
	setx	0x350028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa40020  ! 3053: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
	.word 0xb63c8000  ! 3056: XNOR_R	xnor 	%r18, %r0, %r27
	.word 0xb62ce06c  ! 3058: ANDN_I	andn 	%r19, 0x006c, %r27
cpu_intr_3_246:
	setx	0x340101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_128:
	mov	0x13, %r14
	.word 0xf0f38e40  ! 3063: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf6b58020  ! 3064: STHA_R	stha	%r27, [%r22 + %r0] 0x01
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 28)
	.word 0xb9518000  ! 3066: RDPR_PSTATE	rdpr	%pstate, %r28
T3_asi_reg_wr_129:
	mov	0x17, %r14
	.word 0xf2f38e60  ! 3068: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_3_247:
	setx	0x360237, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 4)
	.word 0xba154000  ! 3074: OR_R	or 	%r21, %r0, %r29
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_248:
	setx	0x37033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6254000  ! 3082: STW_R	stw	%r27, [%r21 + %r0]
cpu_intr_3_249:
	setx	0x350038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94604b  ! 3084: WRPR_PSTATE_I	wrpr	%r17, 0x004b, %pstate
	.word 0xf62561a2  ! 3086: STW_I	stw	%r27, [%r21 + 0x01a2]
cpu_intr_3_250:
	setx	0x370137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_251:
	setx	0x340321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63461ed  ! 3090: STH_I	sth	%r27, [%r17 + 0x01ed]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_132:
	mov	0x20, %r14
	.word 0xfedb8e80  ! 3093: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfe74c000  ! 3094: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xf22561f5  ! 3097: STW_I	stw	%r25, [%r21 + 0x01f5]
T3_asi_reg_rd_133:
	mov	0x30, %r14
	.word 0xf2db89e0  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_3_252:
	setx	0x350111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca42100  ! 3102: STWA_I	stwa	%r30, [%r16 + 0x0100] %asi
	.word 0xf22ca0e0  ! 3103: STB_I	stb	%r25, [%r18 + 0x00e0]
	.word 0xb134c000  ! 3106: SRL_R	srl 	%r19, %r0, %r24
	.word 0xf2f4e087  ! 3109: STXA_I	stxa	%r25, [%r19 + 0x0087] %asi
	.word 0xf2340000  ! 3110: STH_R	sth	%r25, [%r16 + %r0]
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 34)
	.word 0xf2248000  ! 3115: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xfef4e0a6  ! 3118: STXA_I	stxa	%r31, [%r19 + 0x00a6] %asi
	.word 0xf62c4000  ! 3119: STB_R	stb	%r27, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xb12dd000  ! 3122: SLLX_R	sllx	%r23, %r0, %r24
cpu_intr_3_253:
	setx	0x340234, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_134:
	mov	0x31, %r14
	.word 0xf4db8e60  ! 3124: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_wr_130:
	mov	0x1a, %r14
	.word 0xf8f38e40  ! 3126: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfa35e1fb  ! 3132: STH_I	sth	%r29, [%r23 + 0x01fb]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_131:
	mov	0x34, %r14
	.word 0xfaf38400  ! 3134: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_wr_132:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 3136: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1520000  ! 3137: RDPR_PIL	rdpr	%pil, %r24
	.word 0xfe2d8000  ! 3138: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xf425a19d  ! 3140: STW_I	stw	%r26, [%r22 + 0x019d]
	.word 0xb6358000  ! 3143: ORN_R	orn 	%r22, %r0, %r27
	.word 0xf8344000  ! 3144: STH_R	sth	%r28, [%r17 + %r0]
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, f)
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 8)
	.word 0xf22d61bd  ! 3158: STB_I	stb	%r25, [%r21 + 0x01bd]
	.word 0xf2a48020  ! 3159: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
	.word 0xfca4616b  ! 3161: STWA_I	stwa	%r30, [%r17 + 0x016b] %asi
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 3a)
	ta	T_CHANGE_HPRIV
	.word 0xb1355000  ! 3167: SRLX_R	srlx	%r21, %r0, %r24
T3_asi_reg_wr_133:
	mov	0x33, %r14
	.word 0xf4f38e60  ! 3168: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_135:
	mov	0xf, %r14
	.word 0xf8db8e80  ! 3170: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T3_asi_reg_rd_136:
	mov	0x14, %r14
	.word 0xf6db8400  ! 3171: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb2ad4000  ! 3173: ANDNcc_R	andncc 	%r21, %r0, %r25
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 38)
	ta	T_CHANGE_TO_TL1
	.word 0xf4a5c020  ! 3180: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
	.word 0xfea40020  ! 3182: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
	.word 0xf8254000  ! 3183: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xf0250000  ! 3184: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xbb34c000  ! 3185: SRL_R	srl 	%r19, %r0, %r29
	.word 0xf4ace012  ! 3187: STBA_I	stba	%r26, [%r19 + 0x0012] %asi
	.word 0xb3351000  ! 3192: SRLX_R	srlx	%r20, %r0, %r25
cpu_intr_3_254:
	setx	0x340238, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_137:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 3196: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf0250000  ! 3201: STW_R	stw	%r24, [%r20 + %r0]
cpu_intr_3_255:
	setx	0x340237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a461fe  ! 3203: STWA_I	stwa	%r27, [%r17 + 0x01fe] %asi
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf4f5203c  ! 3207: STXA_I	stxa	%r26, [%r20 + 0x003c] %asi
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_134:
	mov	0xc, %r14
	.word 0xf2f384a0  ! 3216: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf6750000  ! 3221: STX_R	stx	%r27, [%r20 + %r0]
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfcb5201d  ! 3226: STHA_I	stha	%r30, [%r20 + 0x001d] %asi
	.word 0xbe05602f  ! 3230: ADD_I	add 	%r21, 0x002f, %r31
cpu_intr_3_256:
	setx	0x39010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_257:
	setx	0x39023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb42461d7  ! 3238: SUB_I	sub 	%r17, 0x01d7, %r26
	.word 0xf4a4c020  ! 3240: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
T3_asi_reg_rd_138:
	mov	0x26, %r14
	.word 0xfcdb84a0  ! 3244: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T3_asi_reg_wr_135:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 3249: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf47521b4  ! 3252: STX_I	stx	%r26, [%r20 + 0x01b4]
cpu_intr_3_258:
	setx	0x3b031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_259:
	setx	0x380202, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_136:
	mov	0x10, %r14
	.word 0xf4f38400  ! 3257: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbf35b001  ! 3258: SRLX_I	srlx	%r22, 0x0001, %r31
T3_asi_reg_wr_137:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 3259: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_rd_139:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 3260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xfea421ba  ! 3264: STWA_I	stwa	%r31, [%r16 + 0x01ba] %asi
	.word 0xf8ac21a0  ! 3265: STBA_I	stba	%r28, [%r16 + 0x01a0] %asi
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d12  ! 3266: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d12, %hpstate
	.word 0xf2ac6087  ! 3268: STBA_I	stba	%r25, [%r17 + 0x0087] %asi
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_260:
	setx	0x390226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_rd_140:
	mov	0x3c8, %r14
	.word 0xf4db89e0  ! 3275: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf6a5c020  ! 3277: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_wr_138:
	mov	0x7, %r14
	.word 0xfaf38e80  ! 3279: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983d5a  ! 3281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d5a, %hpstate
	.word 0xfaad8020  ! 3282: STBA_R	stba	%r29, [%r22 + %r0] 0x01
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfaa44020  ! 3288: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
cpu_intr_3_261:
	setx	0x39001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_262:
	setx	0x3a0134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_263:
	setx	0x3a0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b5606c  ! 3295: SUBCcc_I	orncc 	%r21, 0x006c, %r24
	.word 0xf0b5a011  ! 3296: STHA_I	stha	%r24, [%r22 + 0x0011] %asi
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 13)
	.word 0xf824e0b5  ! 3299: STW_I	stw	%r28, [%r19 + 0x00b5]
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf42ca138  ! 3308: STB_I	stb	%r26, [%r18 + 0x0138]
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_wr_139:
	mov	0x18, %r14
	.word 0xfcf38e40  ! 3311: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf8742082  ! 3313: STX_I	stx	%r28, [%r16 + 0x0082]
T3_asi_reg_rd_141:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 3314: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf4acc020  ! 3315: STBA_R	stba	%r26, [%r19 + %r0] 0x01
cpu_intr_3_264:
	setx	0x380209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 12)
	.word 0xfe2da1da  ! 3320: STB_I	stb	%r31, [%r22 + 0x01da]
cpu_intr_3_265:
	setx	0x380227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6758000  ! 3325: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xf6ac4020  ! 3329: STBA_R	stba	%r27, [%r17 + %r0] 0x01
	.word 0xf2250000  ! 3331: STW_R	stw	%r25, [%r20 + %r0]
T3_asi_reg_rd_142:
	mov	0x3c5, %r14
	.word 0xfadb8400  ! 3334: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 13)
	.word 0xf8740000  ! 3342: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xfa75c000  ! 3343: STX_R	stx	%r29, [%r23 + %r0]
T3_asi_reg_rd_143:
	mov	0x3c1, %r14
	.word 0xfedb8e60  ! 3346: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb3641800  ! 3347: MOVcc_R	<illegal instruction>
	.word 0xbab4c000  ! 3348: SUBCcc_R	orncc 	%r19, %r0, %r29
	.word 0xfa258000  ! 3350: STW_R	stw	%r29, [%r22 + %r0]
cpu_intr_3_266:
	setx	0x38030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3344000  ! 3353: SRL_R	srl 	%r17, %r0, %r25
T3_asi_reg_rd_144:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 3355: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf4b44020  ! 3356: STHA_R	stha	%r26, [%r17 + %r0] 0x01
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_rd_145:
	mov	0xc, %r14
	.word 0xf4db89e0  ! 3361: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8995a0be  ! 3363: WRPR_TICK_I	wrpr	%r22, 0x00be, %tick
T3_asi_reg_wr_140:
	mov	0x2c, %r14
	.word 0xf8f389e0  ! 3364: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_wr_141:
	mov	0x11, %r14
	.word 0xf0f38e60  ! 3365: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf6ada126  ! 3366: STBA_I	stba	%r27, [%r22 + 0x0126] %asi
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 2)
	.word 0xfcf42141  ! 3371: STXA_I	stxa	%r30, [%r16 + 0x0141] %asi
	.word 0xf035a147  ! 3373: STH_I	sth	%r24, [%r22 + 0x0147]
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_rd_146:
	mov	0x10, %r14
	.word 0xf8db8e40  ! 3375: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf2ad4020  ! 3376: STBA_R	stba	%r25, [%r21 + %r0] 0x01
	.word 0xfe2c0000  ! 3377: STB_R	stb	%r31, [%r16 + %r0]
T3_asi_reg_rd_147:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 3381: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 38)
	.word 0xf22d219b  ! 3386: STB_I	stb	%r25, [%r20 + 0x019b]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 20)
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_148:
	mov	0x2e, %r14
	.word 0xf0db89e0  ! 3391: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_wr_142:
	mov	0x25, %r14
	.word 0xfaf38e40  ! 3392: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_267:
	setx	0x390306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf425c000  ! 3395: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xb4c461c6  ! 3396: ADDCcc_I	addccc 	%r17, 0x01c6, %r26
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 12)
	.word 0xf075e034  ! 3404: STX_I	stx	%r24, [%r23 + 0x0034]
	.word 0xf82d4000  ! 3408: STB_R	stb	%r28, [%r21 + %r0]
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf6ad0020  ! 3412: STBA_R	stba	%r27, [%r20 + %r0] 0x01
cpu_intr_3_268:
	setx	0x3a0239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_269:
	setx	0x3a022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a4a0de  ! 3417: STWA_I	stwa	%r25, [%r18 + 0x00de] %asi
cpu_intr_3_270:
	setx	0x390331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_271:
	setx	0x390035, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_143:
	mov	0x3c3, %r14
	.word 0xf8f389e0  ! 3421: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_272:
	setx	0x390237, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_144:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 3425: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_145:
	mov	0x25, %r14
	.word 0xf2f38e40  ! 3427: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 21)
	.word 0xbec4e1f2  ! 3431: ADDCcc_I	addccc 	%r19, 0x01f2, %r31
	.word 0xf2f4215b  ! 3434: STXA_I	stxa	%r25, [%r16 + 0x015b] %asi
cpu_intr_3_273:
	setx	0x3a0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_274:
	setx	0x380005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_275:
	setx	0x390020, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_146:
	mov	0x3c6, %r14
	.word 0xfef389e0  ! 3443: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf47561bc  ! 3444: STX_I	stx	%r26, [%r21 + 0x01bc]
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_276:
	setx	0x3a030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_277:
	setx	0x380033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 22)
	.word 0xf2250000  ! 3457: STW_R	stw	%r25, [%r20 + %r0]
cpu_intr_3_278:
	setx	0x3b0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b48  ! 3459: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b48, %hpstate
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_279:
	setx	0x390108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 24)
	.word 0xfc74a0c5  ! 3467: STX_I	stx	%r30, [%r18 + 0x00c5]
	ta	T_CHANGE_HPRIV
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b08  ! 3469: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b08, %hpstate
	.word 0xfc75e1c0  ! 3472: STX_I	stx	%r30, [%r23 + 0x01c0]
cpu_intr_3_280:
	setx	0x3b0334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_281:
	setx	0x3b0336, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_149:
	mov	0x34, %r14
	.word 0xfadb84a0  ! 3479: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c52  ! 3480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c52, %hpstate
cpu_intr_3_282:
	setx	0x3b032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b54020  ! 3482: STHA_R	stha	%r24, [%r21 + %r0] 0x01
	.word 0xfcb48020  ! 3484: STHA_R	stha	%r30, [%r18 + %r0] 0x01
	.word 0xfeb4a166  ! 3487: STHA_I	stha	%r31, [%r18 + 0x0166] %asi
	.word 0xf0f42010  ! 3488: STXA_I	stxa	%r24, [%r16 + 0x0010] %asi
	.word 0xf8254000  ! 3489: STW_R	stw	%r28, [%r21 + %r0]
cpu_intr_3_283:
	setx	0x390336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0240000  ! 3492: STW_R	stw	%r24, [%r16 + %r0]
T3_asi_reg_rd_150:
	mov	0x30, %r14
	.word 0xf4db84a0  ! 3494: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_rd_151:
	mov	0x38, %r14
	.word 0xf0db8e80  ! 3495: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_rd_152:
	mov	0xd, %r14
	.word 0xfcdb84a0  ! 3496: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 3)
	.word 0xf4a5a112  ! 3503: STWA_I	stwa	%r26, [%r22 + 0x0112] %asi
	.word 0xfe75a173  ! 3504: STX_I	stx	%r31, [%r22 + 0x0173]
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_284:
	setx	0x380200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c4000  ! 3510: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xba8d0000  ! 3513: ANDcc_R	andcc 	%r20, %r0, %r29
	.word 0xf875c000  ! 3514: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xf8f5e109  ! 3515: STXA_I	stxa	%r28, [%r23 + 0x0109] %asi
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, c)
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf0f4e118  ! 3522: STXA_I	stxa	%r24, [%r19 + 0x0118] %asi
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, d)
	.word 0xf2ad20aa  ! 3526: STBA_I	stba	%r25, [%r20 + 0x00aa] %asi
	.word 0xb0440000  ! 3529: ADDC_R	addc 	%r16, %r0, %r24
T3_asi_reg_rd_153:
	mov	0x1b, %r14
	.word 0xf8db89e0  ! 3530: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf4750000  ! 3531: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xf22ce1a6  ! 3534: STB_I	stb	%r25, [%r19 + 0x01a6]
cpu_intr_3_285:
	setx	0x39032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 38)
	.word 0xb624205c  ! 3540: SUB_I	sub 	%r16, 0x005c, %r27
	.word 0xf0b5e15e  ! 3542: STHA_I	stha	%r24, [%r23 + 0x015e] %asi
cpu_intr_3_286:
	setx	0x3b0220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 27)
	.word 0xf274e175  ! 3548: STX_I	stx	%r25, [%r19 + 0x0175]
T3_asi_reg_wr_147:
	mov	0x34, %r14
	.word 0xfcf384a0  ! 3550: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf42c0000  ! 3552: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xf2a5c020  ! 3553: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
	.word 0xf4258000  ! 3554: STW_R	stw	%r26, [%r22 + %r0]
cpu_intr_3_287:
	setx	0x3a020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03c0000  ! 3557: XNOR_R	xnor 	%r16, %r0, %r24
cpu_intr_3_288:
	setx	0x38020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_154:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 3559: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 3f)
	.word 0xb6acc000  ! 3563: ANDNcc_R	andncc 	%r19, %r0, %r27
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982990  ! 3564: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0990, %hpstate
	.word 0xb8158000  ! 3566: OR_R	or 	%r22, %r0, %r28
T3_asi_reg_rd_155:
	mov	0x17, %r14
	.word 0xf2db8e40  ! 3570: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 13)
	.word 0xbe158000  ! 3573: OR_R	or 	%r22, %r0, %r31
	.word 0xfa740000  ! 3577: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xfca4214a  ! 3578: STWA_I	stwa	%r30, [%r16 + 0x014a] %asi
	.word 0xf8752014  ! 3579: STX_I	stx	%r28, [%r20 + 0x0014]
cpu_intr_3_289:
	setx	0x380110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_290:
	setx	0x3030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_rd_156:
	mov	0x4, %r14
	.word 0xf8db8e40  ! 3592: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, f)
	.word 0xf2358000  ! 3598: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xf2b4a135  ! 3600: STHA_I	stha	%r25, [%r18 + 0x0135] %asi
	.word 0xfcb4c020  ! 3601: STHA_R	stha	%r30, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_291:
	setx	0x38022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_148:
	mov	0x16, %r14
	.word 0xfaf38e40  ! 3609: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2748000  ! 3612: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xbd2d4000  ! 3613: SLL_R	sll 	%r21, %r0, %r30
	.word 0xf0a56000  ! 3616: STWA_I	stwa	%r24, [%r21 + 0x0000] %asi
	.word 0xf2b48020  ! 3619: STHA_R	stha	%r25, [%r18 + %r0] 0x01
	.word 0xfe24c000  ! 3622: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf6342044  ! 3623: STH_I	sth	%r27, [%r16 + 0x0044]
T3_asi_reg_rd_157:
	mov	0x32, %r14
	.word 0xf8db8e80  ! 3626: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_3_292:
	setx	0x390238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f4a09e  ! 3629: STXA_I	stxa	%r27, [%r18 + 0x009e] %asi
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 37)
	.word 0xf0ada166  ! 3633: STBA_I	stba	%r24, [%r22 + 0x0166] %asi
	.word 0xf0ade12e  ! 3635: STBA_I	stba	%r24, [%r23 + 0x012e] %asi
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_158:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 3642: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfa2c6147  ! 3643: STB_I	stb	%r29, [%r17 + 0x0147]
cpu_intr_3_293:
	setx	0x10202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 24)
	.word 0xbe0de082  ! 3653: AND_I	and 	%r23, 0x0082, %r31
	.word 0xf8344000  ! 3654: STH_R	sth	%r28, [%r17 + %r0]
T3_asi_reg_wr_149:
	mov	0x27, %r14
	.word 0xfef38e40  ! 3655: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_rd_159:
	mov	0x34, %r14
	.word 0xf0db84a0  ! 3656: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf2ac61bf  ! 3657: STBA_I	stba	%r25, [%r17 + 0x01bf] %asi
	.word 0xfeb44020  ! 3659: STHA_R	stha	%r31, [%r17 + %r0] 0x01
cpu_intr_3_294:
	setx	0x380035, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_160:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 3663: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_150:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 3665: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_295:
	setx	0x3b011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea48020  ! 3667: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
T3_asi_reg_wr_151:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 3668: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf6ade17e  ! 3669: STBA_I	stba	%r27, [%r23 + 0x017e] %asi
	.word 0xbea56127  ! 3670: SUBcc_I	subcc 	%r21, 0x0127, %r31
	.word 0xfaaca121  ! 3671: STBA_I	stba	%r29, [%r18 + 0x0121] %asi
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 32)
	.word 0xf635c000  ! 3674: STH_R	sth	%r27, [%r23 + %r0]
T3_asi_reg_rd_161:
	mov	0x26, %r14
	.word 0xf0db84a0  ! 3676: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf6b40020  ! 3677: STHA_R	stha	%r27, [%r16 + %r0] 0x01
	.word 0xf82520c3  ! 3678: STW_I	stw	%r28, [%r20 + 0x00c3]
T3_asi_reg_wr_152:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 3681: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_296:
	setx	0x390114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5643801  ! 3688: MOVcc_I	<illegal instruction>
	.word 0xf2750000  ! 3690: STX_R	stx	%r25, [%r20 + %r0]
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf22c0000  ! 3699: STB_R	stb	%r25, [%r16 + %r0]
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_297:
	setx	0x3d000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_162:
	mov	0x1f, %r14
	.word 0xfadb8e60  ! 3706: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf6b44020  ! 3707: STHA_R	stha	%r27, [%r17 + %r0] 0x01
cpu_intr_3_298:
	setx	0x3e0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2250000  ! 3710: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xf4b58020  ! 3711: STHA_R	stha	%r26, [%r22 + %r0] 0x01
T3_asi_reg_rd_163:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 3712: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 21)
	.word 0xf4a52092  ! 3715: STWA_I	stwa	%r26, [%r20 + 0x0092] %asi
T3_asi_reg_rd_164:
	mov	0x1e, %r14
	.word 0xf0db8400  ! 3716: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 35)
	.word 0xf434c000  ! 3725: STH_R	sth	%r26, [%r19 + %r0]
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 24)
	.word 0xfeac0020  ! 3728: STBA_R	stba	%r31, [%r16 + %r0] 0x01
	.word 0xb49ca047  ! 3729: XORcc_I	xorcc 	%r18, 0x0047, %r26
	.word 0xfa2c4000  ! 3730: STB_R	stb	%r29, [%r17 + %r0]
cpu_intr_3_299:
	setx	0x3e0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34e199  ! 3733: STH_I	sth	%r31, [%r19 + 0x0199]
cpu_intr_3_300:
	setx	0x3d033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983bca  ! 3736: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bca, %hpstate
	.word 0xf6356145  ! 3738: STH_I	sth	%r27, [%r21 + 0x0145]
	.word 0xfea4a094  ! 3739: STWA_I	stwa	%r31, [%r18 + 0x0094] %asi
	.word 0xfaf5605b  ! 3742: STXA_I	stxa	%r29, [%r21 + 0x005b] %asi
cpu_intr_3_301:
	setx	0x3f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_153:
	mov	0x33, %r14
	.word 0xf0f389e0  ! 3744: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf8b48020  ! 3745: STHA_R	stha	%r28, [%r18 + %r0] 0x01
cpu_intr_3_302:
	setx	0x3c0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b48020  ! 3749: STHA_R	stha	%r25, [%r18 + %r0] 0x01
cpu_intr_3_303:
	setx	0x3f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_304:
	setx	0x3e0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8358000  ! 3755: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xf8aca012  ! 3756: STBA_I	stba	%r28, [%r18 + 0x0012] %asi
T3_asi_reg_rd_165:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_154:
	mov	0x1, %r14
	.word 0xf0f38e80  ! 3761: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
cpu_intr_3_305:
	setx	0x3d030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe244000  ! 3769: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xfef520c6  ! 3770: STXA_I	stxa	%r31, [%r20 + 0x00c6] %asi
T3_asi_reg_wr_155:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 3771: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfeb44020  ! 3774: STHA_R	stha	%r31, [%r17 + %r0] 0x01
	.word 0xb60ce00a  ! 3777: AND_I	and 	%r19, 0x000a, %r27
	.word 0xf6adc020  ! 3779: STBA_R	stba	%r27, [%r23 + %r0] 0x01
	.word 0xf2254000  ! 3780: STW_R	stw	%r25, [%r21 + %r0]
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, e)
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0450000  ! 3789: ADDC_R	addc 	%r20, %r0, %r24
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 3b)
	.word 0xba44a09e  ! 3792: ADDC_I	addc 	%r18, 0x009e, %r29
	.word 0xf2746109  ! 3795: STX_I	stx	%r25, [%r17 + 0x0109]
	ta	T_CHANGE_TO_TL0
	.word 0xbb643801  ! 3797: MOVcc_I	<illegal instruction>
	.word 0xf4350000  ! 3798: STH_R	sth	%r26, [%r20 + %r0]
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_306:
	setx	0x3d0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a54000  ! 3809: SUBcc_R	subcc 	%r21, %r0, %r25
	.word 0xfe344000  ! 3814: STH_R	sth	%r31, [%r17 + %r0]
T3_asi_reg_rd_166:
	mov	0x3c7, %r14
	.word 0xf0db84a0  ! 3815: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf6ade08e  ! 3818: STBA_I	stba	%r27, [%r23 + 0x008e] %asi
T3_asi_reg_wr_156:
	mov	0x2a, %r14
	.word 0xf8f38e80  ! 3826: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf2aca166  ! 3827: STBA_I	stba	%r25, [%r18 + 0x0166] %asi
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, c)
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 1b)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_157:
	mov	0xb, %r14
	.word 0xf0f38e80  ! 3831: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_rd_167:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 3833: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_168:
	mov	0x17, %r14
	.word 0xf2db8e60  ! 3834: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xfa24a0ff  ! 3838: STW_I	stw	%r29, [%r18 + 0x00ff]
cpu_intr_3_307:
	setx	0x3f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_158:
	mov	0x5, %r14
	.word 0xfaf38400  ! 3840: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfc75a158  ! 3842: STX_I	stx	%r30, [%r22 + 0x0158]
	.word 0xf4258000  ! 3849: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xb2358000  ! 3851: ORN_R	orn 	%r22, %r0, %r25
	.word 0xf07520ee  ! 3852: STX_I	stx	%r24, [%r20 + 0x00ee]
	.word 0xbc0ce0f1  ! 3853: AND_I	and 	%r19, 0x00f1, %r30
T3_asi_reg_rd_169:
	mov	0xc, %r14
	.word 0xf0db8e40  ! 3854: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_159:
	mov	0x3c4, %r14
	.word 0xfcf38400  ! 3856: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf4248000  ! 3857: STW_R	stw	%r26, [%r18 + %r0]
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 28)
	.word 0xfa34e084  ! 3859: STH_I	sth	%r29, [%r19 + 0x0084]
T3_asi_reg_wr_160:
	mov	0xb, %r14
	.word 0xfef38400  ! 3860: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfe250000  ! 3862: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xf235a052  ! 3864: STH_I	sth	%r25, [%r22 + 0x0052]
	.word 0xb4954000  ! 3866: ORcc_R	orcc 	%r21, %r0, %r26
	.word 0xbc05c000  ! 3867: ADD_R	add 	%r23, %r0, %r30
	.word 0xfe74a163  ! 3869: STX_I	stx	%r31, [%r18 + 0x0163]
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_308:
	setx	0x3e012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2560ff  ! 3873: STW_I	stw	%r29, [%r21 + 0x00ff]
T3_asi_reg_rd_170:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0x8f902002  ! 3878: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xbd347001  ! 3880: SRLX_I	srlx	%r17, 0x0001, %r30
	.word 0xfa348000  ! 3884: STH_R	sth	%r29, [%r18 + %r0]
cpu_intr_3_309:
	setx	0x3d0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf4a02b  ! 3890: STXA_I	stxa	%r29, [%r18 + 0x002b] %asi
	.word 0xf474c000  ! 3891: STX_R	stx	%r26, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb42d4000  ! 3893: ANDN_R	andn 	%r21, %r0, %r26
	.word 0xb22ca0e7  ! 3894: ANDN_I	andn 	%r18, 0x00e7, %r25
	.word 0xb5353001  ! 3896: SRLX_I	srlx	%r20, 0x0001, %r26
T3_asi_reg_rd_171:
	mov	0x26, %r14
	.word 0xf2db89e0  ! 3898: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_wr_161:
	mov	0x4, %r14
	.word 0xf6f38e40  ! 3900: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf8748000  ! 3905: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xf4ade0f6  ! 3907: STBA_I	stba	%r26, [%r23 + 0x00f6] %asi
T3_asi_reg_rd_172:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 3909: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xfc340000  ! 3913: STH_R	sth	%r30, [%r16 + %r0]
cpu_intr_3_310:
	setx	0x3e0233, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_162:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 3916: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfa340000  ! 3920: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xfab5e17c  ! 3921: STHA_I	stha	%r29, [%r23 + 0x017c] %asi
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 33)
	.word 0xb42dc000  ! 3923: ANDN_R	andn 	%r23, %r0, %r26
	.word 0xf4358000  ! 3930: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xb0bd0000  ! 3931: XNORcc_R	xnorcc 	%r20, %r0, %r24
T3_asi_reg_wr_163:
	mov	0x1b, %r14
	.word 0xf4f38e80  ! 3932: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T3_asi_reg_rd_173:
	mov	0x25, %r14
	.word 0xf2db84a0  ! 3934: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_3_311:
	setx	0x3d0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f46020  ! 3936: STXA_I	stxa	%r28, [%r17 + 0x0020] %asi
	ta	T_CHANGE_NONHPRIV
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983f40  ! 3943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f40, %hpstate
	.word 0xf8f4a1b8  ! 3944: STXA_I	stxa	%r28, [%r18 + 0x01b8] %asi
cpu_intr_3_312:
	setx	0x3d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_313:
	setx	0x3f001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_314:
	setx	0x3d0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2240000  ! 3955: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf8a5c020  ! 3957: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
cpu_intr_3_315:
	setx	0x3f012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0358000  ! 3961: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xf035c000  ! 3962: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xf4344000  ! 3963: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xb32db001  ! 3966: SLLX_I	sllx	%r22, 0x0001, %r25
cpu_intr_3_316:
	setx	0x3f0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4c020  ! 3968: STHA_R	stha	%r29, [%r19 + %r0] 0x01
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_wr_164:
	mov	0x1a, %r14
	.word 0xfcf38e60  ! 3973: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf8b5c020  ! 3977: STHA_R	stha	%r28, [%r23 + %r0] 0x01
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_317:
	setx	0x3e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5c020  ! 3986: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xf0ac2088  ! 3993: STBA_I	stba	%r24, [%r16 + 0x0088] %asi
	.word 0xfe35c000  ! 3995: STH_R	sth	%r31, [%r23 + %r0]
T3_asi_reg_rd_174:
	mov	0x2e, %r14
	.word 0xfedb8e40  ! 3996: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_TO_TL1
cpu_intr_3_318:
	setx	0x3c020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_175:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 4000: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb8a58000  ! 4002: SUBcc_R	subcc 	%r22, %r0, %r28
T3_asi_reg_wr_165:
	mov	0x36, %r14
	.word 0xf4f38e60  ! 4005: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 32)
	.word 0xb034a065  ! 4008: SUBC_I	orn 	%r18, 0x0065, %r24
cpu_intr_3_319:
	setx	0x3f0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc754000  ! 4013: STX_R	stx	%r30, [%r21 + %r0]
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 18)
	ta	T_CHANGE_TO_TL1
	.word 0xf6258000  ! 4021: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xf6f5203a  ! 4023: STXA_I	stxa	%r27, [%r20 + 0x003a] %asi
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_320:
	setx	0x3c010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_176:
	mov	0x2e, %r14
	.word 0xfadb8e40  ! 4035: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_321:
	setx	0x3e010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5643801  ! 4038: MOVcc_I	<illegal instruction>
	.word 0xf6ace18c  ! 4039: STBA_I	stba	%r27, [%r19 + 0x018c] %asi
	ta	T_CHANGE_TO_TL1
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 27)
	.word 0xfa2461b4  ! 4045: STW_I	stw	%r29, [%r17 + 0x01b4]
	.word 0xf62dc000  ! 4046: STB_R	stb	%r27, [%r23 + %r0]
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 13)
	.word 0xfc2dc000  ! 4049: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xbe1c2127  ! 4052: XOR_I	xor 	%r16, 0x0127, %r31
	.word 0xf2246029  ! 4054: STW_I	stw	%r25, [%r17 + 0x0029]
	.word 0xb6940000  ! 4055: ORcc_R	orcc 	%r16, %r0, %r27
	.word 0xfead0020  ! 4057: STBA_R	stba	%r31, [%r20 + %r0] 0x01
T3_asi_reg_rd_177:
	mov	0x36, %r14
	.word 0xf0db8e80  ! 4058: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf635a1dd  ! 4061: STH_I	sth	%r27, [%r22 + 0x01dd]
T3_asi_reg_wr_166:
	mov	0x25, %r14
	.word 0xfaf38e60  ! 4062: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbf7d6401  ! 4064: MOVR_I	movre	%r21, 0x1, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xfa75619c  ! 4067: STX_I	stx	%r29, [%r21 + 0x019c]
	.word 0xbe35e0c9  ! 4070: ORN_I	orn 	%r23, 0x00c9, %r31
T3_asi_reg_rd_178:
	mov	0x3c0, %r14
	.word 0xfcdb84a0  ! 4071: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf62561e8  ! 4074: STW_I	stw	%r27, [%r21 + 0x01e8]
T3_asi_reg_wr_167:
	mov	0x2a, %r14
	.word 0xfcf384a0  ! 4076: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_179:
	mov	0x9, %r14
	.word 0xf0db8e60  ! 4078: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_322:
	setx	0x3d020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_180:
	mov	0x12, %r14
	.word 0xf2db8e80  ! 4085: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_wr_168:
	mov	0x1, %r14
	.word 0xfaf38e60  ! 4086: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_rd_181:
	mov	0x3c2, %r14
	.word 0xfedb84a0  ! 4088: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 1e)
	.word 0xfa2460aa  ! 4095: STW_I	stw	%r29, [%r17 + 0x00aa]
	.word 0xf07521cb  ! 4097: STX_I	stx	%r24, [%r20 + 0x01cb]
	.word 0xf02d6054  ! 4098: STB_I	stb	%r24, [%r21 + 0x0054]
	.word 0xba84a061  ! 4099: ADDcc_I	addcc 	%r18, 0x0061, %r29
	.word 0xfa258000  ! 4100: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xfea50020  ! 4101: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
T3_asi_reg_rd_182:
	mov	0x3c4, %r14
	.word 0xfcdb8e60  ! 4103: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf6354000  ! 4104: STH_R	sth	%r27, [%r21 + %r0]
T3_asi_reg_wr_169:
	mov	0x2c, %r14
	.word 0xf6f38e60  ! 4105: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf634c000  ! 4107: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xfaa54020  ! 4109: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	.word 0xf2358000  ! 4110: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xfe244000  ! 4111: STW_R	stw	%r31, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_183:
	mov	0xa, %r14
	.word 0xfcdb8e40  ! 4115: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 12)
	.word 0xf0b50020  ! 4117: STHA_R	stha	%r24, [%r20 + %r0] 0x01
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 15)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf6b50020  ! 4138: STHA_R	stha	%r27, [%r20 + %r0] 0x01
	.word 0xf8a48020  ! 4139: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
	.word 0xfe2521c8  ! 4142: STW_I	stw	%r31, [%r20 + 0x01c8]
	.word 0xb80dc000  ! 4146: AND_R	and 	%r23, %r0, %r28
	.word 0xf62cc000  ! 4147: STB_R	stb	%r27, [%r19 + %r0]
cpu_intr_3_323:
	setx	0x400200, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_wr_170:
	mov	0x7, %r14
	.word 0xfef38e40  ! 4159: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_171:
	mov	0x32, %r14
	.word 0xf6f38e80  ! 4161: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 13)
	.word 0xf8244000  ! 4164: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xf8a42158  ! 4165: STWA_I	stwa	%r28, [%r16 + 0x0158] %asi
	.word 0xf6a40020  ! 4168: STWA_R	stwa	%r27, [%r16 + %r0] 0x01
T3_asi_reg_wr_172:
	mov	0x2c, %r14
	.word 0xfcf38400  ! 4169: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb2944000  ! 4170: ORcc_R	orcc 	%r17, %r0, %r25
	.word 0xfa75a059  ! 4171: STX_I	stx	%r29, [%r22 + 0x0059]
T3_asi_reg_wr_173:
	mov	0x26, %r14
	.word 0xf0f384a0  ! 4174: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf424a177  ! 4175: STW_I	stw	%r26, [%r18 + 0x0177]
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_324:
	setx	0x40001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f5a1a8  ! 4181: STXA_I	stxa	%r25, [%r22 + 0x01a8] %asi
	.word 0xf475204c  ! 4189: STX_I	stx	%r26, [%r20 + 0x004c]
	.word 0xf8a4c020  ! 4190: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xf6ad8020  ! 4195: STBA_R	stba	%r27, [%r22 + %r0] 0x01
T3_asi_reg_rd_184:
	mov	0x28, %r14
	.word 0xfedb89e0  ! 4196: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf07560c0  ! 4197: STX_I	stx	%r24, [%r21 + 0x00c0]
T3_asi_reg_rd_185:
	mov	0x9, %r14
	.word 0xfcdb8400  ! 4198: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_174:
	mov	0x5, %r14
	.word 0xfef389e0  ! 4202: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, c)
	.word 0xb0ac6128  ! 4209: ANDNcc_I	andncc 	%r17, 0x0128, %r24
cpu_intr_3_325:
	setx	0x43013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_326:
	setx	0x430339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 9)
	.word 0xf8b4e04b  ! 4216: STHA_I	stha	%r28, [%r19 + 0x004b] %asi
cpu_intr_3_327:
	setx	0x420037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1641800  ! 4218: MOVcc_R	<illegal instruction>
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_328:
	setx	0x430011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b40000  ! 4231: SUBCcc_R	orncc 	%r16, %r0, %r26
	.word 0xfa75a04f  ! 4235: STX_I	stx	%r29, [%r22 + 0x004f]
	.word 0xb12d3001  ! 4236: SLLX_I	sllx	%r20, 0x0001, %r24
	.word 0xfeac6005  ! 4237: STBA_I	stba	%r31, [%r17 + 0x0005] %asi
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_329:
	setx	0x400205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_wr_175:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 4242: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf0a5a198  ! 4245: STWA_I	stwa	%r24, [%r22 + 0x0198] %asi
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 1e)
	.word 0xbc452192  ! 4251: ADDC_I	addc 	%r20, 0x0192, %r30
	.word 0xf6a4616b  ! 4252: STWA_I	stwa	%r27, [%r17 + 0x016b] %asi
	.word 0xf6a5619a  ! 4255: STWA_I	stwa	%r27, [%r21 + 0x019a] %asi
	.word 0xb20ce1ff  ! 4260: AND_I	and 	%r19, 0x01ff, %r25
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 2e)
	.word 0xbea56162  ! 4263: SUBcc_I	subcc 	%r21, 0x0162, %r31
cpu_intr_3_330:
	setx	0x420305, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_331:
	setx	0x400031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef46073  ! 4269: STXA_I	stxa	%r31, [%r17 + 0x0073] %asi
	.word 0xf82560b8  ! 4273: STW_I	stw	%r28, [%r21 + 0x00b8]
cpu_intr_3_332:
	setx	0x400138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe252086  ! 4277: STW_I	stw	%r31, [%r20 + 0x0086]
T3_asi_reg_rd_186:
	mov	0x1b, %r14
	.word 0xfcdb8e60  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_333:
	setx	0x430230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, a)
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 32)
	.word 0xb8354000  ! 4287: ORN_R	orn 	%r21, %r0, %r28
T3_asi_reg_rd_187:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 4290: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_334:
	setx	0x430013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf07520c9  ! 4296: STX_I	stx	%r24, [%r20 + 0x00c9]
	.word 0xfaac4020  ! 4299: STBA_R	stba	%r29, [%r17 + %r0] 0x01
	.word 0xf8ad4020  ! 4300: STBA_R	stba	%r28, [%r21 + %r0] 0x01
	.word 0xf2b54020  ! 4301: STHA_R	stha	%r25, [%r21 + %r0] 0x01
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, c)
	.word 0xf6ad0020  ! 4310: STBA_R	stba	%r27, [%r20 + %r0] 0x01
cpu_intr_3_335:
	setx	0x410239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf425a160  ! 4312: STW_I	stw	%r26, [%r22 + 0x0160]
	.word 0xfc748000  ! 4313: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf074a15e  ! 4314: STX_I	stx	%r24, [%r18 + 0x015e]
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 38)
	.word 0xf675601d  ! 4322: STX_I	stx	%r27, [%r21 + 0x001d]
T3_asi_reg_wr_176:
	mov	0x2b, %r14
	.word 0xf0f38e60  ! 4327: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 14)
	.word 0xf234604c  ! 4332: STH_I	sth	%r25, [%r17 + 0x004c]
T3_asi_reg_wr_177:
	mov	0x33, %r14
	.word 0xfef38e60  ! 4336: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf6a46006  ! 4337: STWA_I	stwa	%r27, [%r17 + 0x0006] %asi
cpu_intr_3_336:
	setx	0x40013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb4c000  ! 4340: ORNcc_R	orncc 	%r19, %r0, %r31
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 22)
	.word 0xfa7521af  ! 4344: STX_I	stx	%r29, [%r20 + 0x01af]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_337:
	setx	0x43021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f5e0c6  ! 4348: STXA_I	stxa	%r26, [%r23 + 0x00c6] %asi
T3_asi_reg_wr_178:
	mov	0x11, %r14
	.word 0xf6f38e60  ! 4352: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_rd_188:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 4353: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_wr_179:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 4356: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_338:
	setx	0x400334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_339:
	setx	0x41033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_340:
	setx	0x400033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b4e12f  ! 4365: STHA_I	stha	%r24, [%r19 + 0x012f] %asi
	.word 0xbab4e04c  ! 4367: ORNcc_I	orncc 	%r19, 0x004c, %r29
cpu_intr_3_341:
	setx	0x420001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5e1f4  ! 4369: STHA_I	stha	%r28, [%r23 + 0x01f4] %asi
T3_asi_reg_rd_189:
	mov	0x10, %r14
	.word 0xf8db8e80  ! 4370: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T3_asi_reg_wr_180:
	mov	0x16, %r14
	.word 0xf2f38e60  ! 4372: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_rd_190:
	mov	0x1b, %r14
	.word 0xfcdb8e40  ! 4373: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf0250000  ! 4375: STW_R	stw	%r24, [%r20 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf6350000  ! 4380: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xb4144000  ! 4381: OR_R	or 	%r17, %r0, %r26
	.word 0xf434a140  ! 4382: STH_I	sth	%r26, [%r18 + 0x0140]
	.word 0xbe0dc000  ! 4383: AND_R	and 	%r23, %r0, %r31
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 18)
	.word 0xfe346138  ! 4388: STH_I	sth	%r31, [%r17 + 0x0138]
	.word 0xf6a44020  ! 4389: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
T3_asi_reg_rd_191:
	mov	0x33, %r14
	.word 0xf4db8400  ! 4391: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf224a176  ! 4393: STW_I	stw	%r25, [%r18 + 0x0176]
T3_asi_reg_wr_181:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 4394: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbc8ce1db  ! 4399: ANDcc_I	andcc 	%r19, 0x01db, %r30
	.word 0xbd3dc000  ! 4400: SRA_R	sra 	%r23, %r0, %r30
	.word 0xf4ad2165  ! 4403: STBA_I	stba	%r26, [%r20 + 0x0165] %asi
	.word 0xfe2d4000  ! 4405: STB_R	stb	%r31, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 16)
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a4a  ! 4411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4a, %hpstate
cpu_intr_3_342:
	setx	0x410018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_343:
	setx	0x43001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_192:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 4422: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf2a5e11b  ! 4426: STWA_I	stwa	%r25, [%r23 + 0x011b] %asi
cpu_intr_3_344:
	setx	0x400222, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 31)
	.word 0xb22da07d  ! 4436: ANDN_I	andn 	%r22, 0x007d, %r25
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 6)
	.word 0xb3643801  ! 4438: MOVcc_I	<illegal instruction>
cpu_intr_3_345:
	setx	0x43013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc240000  ! 4441: STW_R	stw	%r30, [%r16 + %r0]
cpu_intr_3_346:
	setx	0x420302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_347:
	setx	0x43032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_348:
	setx	0x430202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_rd_193:
	mov	0x28, %r14
	.word 0xf2db8400  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfe74e1ee  ! 4458: STX_I	stx	%r31, [%r19 + 0x01ee]
	.word 0xf82461c7  ! 4459: STW_I	stw	%r28, [%r17 + 0x01c7]
	.word 0xfe350000  ! 4463: STH_R	sth	%r31, [%r20 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf4f56038  ! 4465: STXA_I	stxa	%r26, [%r21 + 0x0038] %asi
	.word 0xfc354000  ! 4466: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xfc248000  ! 4467: STW_R	stw	%r30, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_194:
	mov	0x33, %r14
	.word 0xfcdb89e0  ! 4470: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf4b58020  ! 4475: STHA_R	stha	%r26, [%r22 + %r0] 0x01
	.word 0xf82d8000  ! 4476: STB_R	stb	%r28, [%r22 + %r0]
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e08  ! 4478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e08, %hpstate
cpu_intr_3_349:
	setx	0x410017, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_182:
	mov	0x19, %r14
	.word 0xf6f384a0  ! 4480: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_rd_195:
	mov	0x35, %r14
	.word 0xf8db8e60  ! 4481: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfa740000  ! 4485: STX_R	stx	%r29, [%r16 + %r0]
T3_asi_reg_wr_183:
	mov	0x30, %r14
	.word 0xfaf38e60  ! 4486: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbcbde182  ! 4487: XNORcc_I	xnorcc 	%r23, 0x0182, %r30
T3_asi_reg_rd_196:
	mov	0xb, %r14
	.word 0xf6db8400  ! 4488: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_350:
	setx	0x420004, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_184:
	mov	0x4, %r14
	.word 0xf4f38e40  ! 4493: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_185:
	mov	0x2a, %r14
	.word 0xf6f38400  ! 4494: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf0a56074  ! 4495: STWA_I	stwa	%r24, [%r21 + 0x0074] %asi
T3_asi_reg_rd_197:
	mov	0x3c7, %r14
	.word 0xf8db8e60  ! 4497: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbb34c000  ! 4500: SRL_R	srl 	%r19, %r0, %r29
	.word 0xfc2ce13b  ! 4503: STB_I	stb	%r30, [%r19 + 0x013b]
	.word 0xf2358000  ! 4505: STH_R	sth	%r25, [%r22 + %r0]
cpu_intr_3_351:
	setx	0x41032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb294e124  ! 4507: ORcc_I	orcc 	%r19, 0x0124, %r25
	.word 0xf0a4c020  ! 4510: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
T3_asi_reg_wr_186:
	mov	0x22, %r14
	.word 0xfef38e80  ! 4513: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_352:
	setx	0x410233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba14c000  ! 4517: OR_R	or 	%r19, %r0, %r29
T3_asi_reg_rd_198:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 4518: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_353:
	setx	0x430002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_199:
	mov	0x10, %r14
	.word 0xfedb8e40  ! 4527: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 32)
	.word 0xbeb4618d  ! 4529: ORNcc_I	orncc 	%r17, 0x018d, %r31
	.word 0xfcace084  ! 4530: STBA_I	stba	%r30, [%r19 + 0x0084] %asi
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfcb5c020  ! 4536: STHA_R	stha	%r30, [%r23 + %r0] 0x01
T3_asi_reg_rd_200:
	mov	0x13, %r14
	.word 0xf0db89e0  ! 4538: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_rd_201:
	mov	0x2d, %r14
	.word 0xfedb8e40  ! 4539: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfa358000  ! 4542: STH_R	sth	%r29, [%r22 + %r0]
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 27)
	.word 0x8795a1d0  ! 4544: WRPR_TT_I	wrpr	%r22, 0x01d0, %tt
cpu_intr_3_354:
	setx	0x430023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24c000  ! 4548: STW_R	stw	%r29, [%r19 + %r0]
cpu_intr_3_355:
	setx	0x43003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_202:
	mov	0x32, %r14
	.word 0xf6db8e40  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xf6b40020  ! 4555: STHA_R	stha	%r27, [%r16 + %r0] 0x01
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_356:
	setx	0x430115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_357:
	setx	0x410002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_203:
	mov	0x36, %r14
	.word 0xfedb8e80  ! 4564: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf2a4c020  ! 4569: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
	.word 0xbc252193  ! 4570: SUB_I	sub 	%r20, 0x0193, %r30
T3_asi_reg_wr_187:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 4573: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_358:
	setx	0x43022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2744000  ! 4582: STX_R	stx	%r25, [%r17 + %r0]
cpu_intr_3_359:
	setx	0x43013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf4ad0020  ! 4585: STBA_R	stba	%r26, [%r20 + %r0] 0x01
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_188:
	mov	0x3c6, %r14
	.word 0xf4f38400  ! 4590: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf874a166  ! 4591: STX_I	stx	%r28, [%r18 + 0x0166]
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 2)
	.word 0xf2a50020  ! 4600: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
T3_asi_reg_wr_189:
	mov	0x25, %r14
	.word 0xf8f38e40  ! 4601: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf2a461b1  ! 4602: STWA_I	stwa	%r25, [%r17 + 0x01b1] %asi
	.word 0xbab50000  ! 4604: SUBCcc_R	orncc 	%r20, %r0, %r29
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, f)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0xf62420c5  ! 4613: STW_I	stw	%r27, [%r16 + 0x00c5]
T3_asi_reg_rd_204:
	mov	0x30, %r14
	.word 0xf4db8e60  ! 4614: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_rd_205:
	mov	0xc, %r14
	.word 0xf8db89e0  ! 4615: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_190:
	mov	0x27, %r14
	.word 0xfef389e0  ! 4626: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc34c000  ! 4628: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xf62c0000  ! 4630: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xf4ac61b3  ! 4634: STBA_I	stba	%r26, [%r17 + 0x01b3] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf235613a  ! 4641: STH_I	sth	%r25, [%r21 + 0x013a]
cpu_intr_3_360:
	setx	0x46023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_361:
	setx	0x450118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2ca090  ! 4646: STB_I	stb	%r29, [%r18 + 0x0090]
cpu_intr_3_362:
	setx	0x470226, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_206:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 4651: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 11)
	.word 0xb9510000  ! 4653: RDPR_TICK	rdpr	%tick, %r28
T3_asi_reg_wr_191:
	mov	0x1e, %r14
	.word 0xf0f384a0  ! 4654: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 36)
	.word 0xf8b58020  ! 4657: STHA_R	stha	%r28, [%r22 + %r0] 0x01
	.word 0xf42de0ff  ! 4658: STB_I	stb	%r26, [%r23 + 0x00ff]
	.word 0xfc25e003  ! 4659: STW_I	stw	%r30, [%r23 + 0x0003]
cpu_intr_3_363:
	setx	0x460135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634a1df  ! 4662: STH_I	sth	%r27, [%r18 + 0x01df]
	.word 0xfa758000  ! 4664: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xbc94c000  ! 4666: ORcc_R	orcc 	%r19, %r0, %r30
	.word 0xb8b5a027  ! 4667: ORNcc_I	orncc 	%r22, 0x0027, %r28
cpu_intr_3_364:
	setx	0x47023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf5a1f0  ! 4671: STXA_I	stxa	%r30, [%r22 + 0x01f0] %asi
	.word 0x8794a094  ! 4672: WRPR_TT_I	wrpr	%r18, 0x0094, %tt
	.word 0xb8c4205a  ! 4675: ADDCcc_I	addccc 	%r16, 0x005a, %r28
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 3e)
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982948  ! 4678: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0948, %hpstate
T3_asi_reg_wr_192:
	mov	0x4, %r14
	.word 0xf6f38e40  ! 4685: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf8356076  ! 4686: STH_I	sth	%r28, [%r21 + 0x0076]
cpu_intr_3_365:
	setx	0x44010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_193:
	mov	0x2f, %r14
	.word 0xf4f38e80  ! 4691: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 2e)
	.word 0x8d942118  ! 4693: WRPR_PSTATE_I	wrpr	%r16, 0x0118, %pstate
	.word 0xba04e031  ! 4694: ADD_I	add 	%r19, 0x0031, %r29
cpu_intr_3_366:
	setx	0x440337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22d200e  ! 4698: STB_I	stb	%r25, [%r20 + 0x000e]
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 12)
	.word 0xb43d0000  ! 4702: XNOR_R	xnor 	%r20, %r0, %r26
cpu_intr_3_367:
	setx	0x44021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68de18d  ! 4704: ANDcc_I	andcc 	%r23, 0x018d, %r27
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198389a  ! 4709: WRHPR_HPSTATE_I	wrhpr	%r0, 0x189a, %hpstate
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 9)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_194:
	mov	0x14, %r14
	.word 0xfaf38e40  ! 4725: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfc248000  ! 4728: STW_R	stw	%r30, [%r18 + %r0]
cpu_intr_3_368:
	setx	0x460314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f5a16f  ! 4731: STXA_I	stxa	%r27, [%r22 + 0x016f] %asi
	.word 0xb33d8000  ! 4732: SRA_R	sra 	%r22, %r0, %r25
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_rd_207:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 4735: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_369:
	setx	0x440210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b5c020  ! 4740: STHA_R	stha	%r24, [%r23 + %r0] 0x01
T3_asi_reg_wr_195:
	mov	0x20, %r14
	.word 0xf2f384a0  ! 4741: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfa75618c  ! 4742: STX_I	stx	%r29, [%r21 + 0x018c]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_wr_196:
	mov	0x1, %r14
	.word 0xfcf38400  ! 4746: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf6754000  ! 4748: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xfa358000  ! 4749: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xfe35c000  ! 4754: STH_R	sth	%r31, [%r23 + %r0]
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf6b4a173  ! 4758: STHA_I	stha	%r27, [%r18 + 0x0173] %asi
T3_asi_reg_rd_208:
	mov	0x23, %r14
	.word 0xf0db8e40  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb2048000  ! 4764: ADD_R	add 	%r18, %r0, %r25
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_wr_197:
	mov	0x2, %r14
	.word 0xf6f38400  ! 4768: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf03521fe  ! 4770: STH_I	sth	%r24, [%r20 + 0x01fe]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_396), 16, 16)) -> intp(3, 0, 38)
	.word 0xf8342086  ! 4777: STH_I	sth	%r28, [%r16 + 0x0086]
	.word 0xb9641800  ! 4778: MOVcc_R	<illegal instruction>
T3_asi_reg_rd_209:
	mov	0x1e, %r14
	.word 0xf2db8400  ! 4783: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_3_370:
	setx	0x470121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_397), 16, 16)) -> intp(3, 0, 17)
	.word 0xfaa50020  ! 4788: STWA_R	stwa	%r29, [%r20 + %r0] 0x01
	.word 0xf2250000  ! 4789: STW_R	stw	%r25, [%r20 + %r0]
T3_asi_reg_wr_198:
	mov	0x1b, %r14
	.word 0xfef38e40  ! 4794: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf224a032  ! 4795: STW_I	stw	%r25, [%r18 + 0x0032]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_199:
	mov	0x31, %r14
	.word 0xf2f38e40  ! 4800: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf0a56026  ! 4801: STWA_I	stwa	%r24, [%r21 + 0x0026] %asi
	.word 0xf4a421dd  ! 4804: STWA_I	stwa	%r26, [%r16 + 0x01dd] %asi
iob_intr_3_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_398), 16, 16)) -> intp(3, 0, 26)
	.word 0xfc744000  ! 4806: STX_R	stx	%r30, [%r17 + %r0]
iob_intr_3_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_399), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_371:
	setx	0x470012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_372:
	setx	0x47020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89d61db  ! 4813: XORcc_I	xorcc 	%r21, 0x01db, %r28
iob_intr_3_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_400), 16, 16)) -> intp(3, 0, 2)
	.word 0xfea560d2  ! 4816: STWA_I	stwa	%r31, [%r21 + 0x00d2] %asi
iob_intr_3_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_401), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_402), 16, 16)) -> intp(3, 0, 14)
	.word 0xf6758000  ! 4826: STX_R	stx	%r27, [%r22 + %r0]
cpu_intr_3_373:
	setx	0x47002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6358000  ! 4834: SUBC_R	orn 	%r22, %r0, %r27
cpu_intr_3_374:
	setx	0x470210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaac8000  ! 4838: ANDNcc_R	andncc 	%r18, %r0, %r29
iob_intr_3_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_403), 16, 16)) -> intp(3, 0, 2a)
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982b50  ! 4843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b50, %hpstate
	.word 0xf275e0dc  ! 4845: STX_I	stx	%r25, [%r23 + 0x00dc]
T3_asi_reg_rd_210:
	mov	0x30, %r14
	.word 0xf0db84a0  ! 4846: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_404), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_405), 16, 16)) -> intp(3, 0, a)
	ta	T_CHANGE_HPRIV
iob_intr_3_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_406), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_407), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_375:
	setx	0x45023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_408), 16, 16)) -> intp(3, 0, 0)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_200:
	mov	0x4, %r14
	.word 0xf0f38e60  ! 4865: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb351c000  ! 4866: RDPR_TL	rdpr	%tl, %r25
	.word 0xfaaca0e8  ! 4868: STBA_I	stba	%r29, [%r18 + 0x00e8] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_376:
	setx	0x46002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_409), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_410), 16, 16)) -> intp(3, 0, d)
	.word 0xbea56142  ! 4885: SUBcc_I	subcc 	%r21, 0x0142, %r31
cpu_intr_3_377:
	setx	0x47003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_211:
	mov	0x38, %r14
	.word 0xf0db84a0  ! 4891: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_3_378:
	setx	0x470220, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_201:
	mov	0x2d, %r14
	.word 0xf6f38e40  ! 4893: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982b02  ! 4894: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b02, %hpstate
	.word 0xb28d0000  ! 4895: ANDcc_R	andcc 	%r20, %r0, %r25
T3_asi_reg_rd_212:
	mov	0x3c7, %r14
	.word 0xf0db84a0  ! 4896: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_411), 16, 16)) -> intp(3, 0, 15)
	.word 0xfe74e199  ! 4899: STX_I	stx	%r31, [%r19 + 0x0199]
iob_intr_3_412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_412), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf0f5e15c  ! 4901: STXA_I	stxa	%r24, [%r23 + 0x015c] %asi
iob_intr_3_413:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_413), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfa25e11c  ! 4903: STW_I	stw	%r29, [%r23 + 0x011c]
	.word 0xfc2cc000  ! 4904: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xb43ce0de  ! 4909: XNOR_I	xnor 	%r19, 0x00de, %r26
	.word 0xfa350000  ! 4911: STH_R	sth	%r29, [%r20 + %r0]
iob_intr_3_414:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_414), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_379:
	setx	0x440107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_380:
	setx	0x46013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_381:
	setx	0x45011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_382:
	setx	0x440334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6258000  ! 4925: SUB_R	sub 	%r22, %r0, %r27
	ta	T_CHANGE_TO_TL0
cpu_intr_3_383:
	setx	0x450001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0248000  ! 4930: STW_R	stw	%r24, [%r18 + %r0]
iob_intr_3_415:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_415), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_213:
	mov	0x3c7, %r14
	.word 0xfedb8e80  ! 4933: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_3_384:
	setx	0x470119, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_214:
	mov	0x29, %r14
	.word 0xf2db89e0  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
cpu_intr_3_385:
	setx	0x44010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983882  ! 4942: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1882, %hpstate
cpu_intr_3_386:
	setx	0x460010, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_215:
	mov	0x22, %r14
	.word 0xfcdb8e40  ! 4945: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf4ac8020  ! 4948: STBA_R	stba	%r26, [%r18 + %r0] 0x01
	.word 0xb93c8000  ! 4949: SRA_R	sra 	%r18, %r0, %r28
T3_asi_reg_wr_202:
	mov	0x35, %r14
	.word 0xfcf38e60  ! 4952: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_387:
	setx	0x470017, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_203:
	mov	0xe, %r14
	.word 0xf8f38e60  ! 4959: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_388:
	setx	0x450034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f5a0f4  ! 4963: STXA_I	stxa	%r25, [%r22 + 0x00f4] %asi
	.word 0xf675e00d  ! 4966: STX_I	stx	%r27, [%r23 + 0x000d]
iob_intr_3_416:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_416), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf075a187  ! 4970: STX_I	stx	%r24, [%r22 + 0x0187]
iob_intr_3_417:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_417), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_389:
	setx	0x45023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_418:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_418), 16, 16)) -> intp(3, 0, 1e)
	ta	T_CHANGE_HPRIV
	.word 0xb2b5e1d0  ! 4989: ORNcc_I	orncc 	%r23, 0x01d0, %r25
iob_intr_3_419:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_419), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_420:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_420), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_421:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_421), 16, 16)) -> intp(3, 0, 22)
	.word 0xf0a4c020  ! 4998: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
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
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f02  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f02, %hpstate
cpu_intr_2_0:
	setx	0x19031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_0:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_1:
	setx	0x1e0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8d8000  ! 12: ANDcc_R	andcc 	%r22, %r0, %r30
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_0:
	mov	0x2e, %r14
	.word 0xfaf384a0  ! 14: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_wr_1:
	mov	0x17, %r14
	.word 0xf4f38e40  ! 15: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf694603c  ! 17: LDUHA_I	lduha	[%r17, + 0x003c] %asi, %r27
T2_asi_reg_rd_1:
	mov	0x29, %r14
	.word 0xf4db89e0  ! 18: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf20d61d6  ! 20: LDUB_I	ldub	[%r21 + 0x01d6], %r25
	.word 0xfc14c000  ! 22: LDUH_R	lduh	[%r19 + %r0], %r30
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb8c4a037  ! 25: ADDCcc_I	addccc 	%r18, 0x0037, %r28
	.word 0xfacc4020  ! 28: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r29
cpu_intr_2_2:
	setx	0x1e030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_3:
	setx	0x1e003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedc2022  ! 39: LDXA_I	ldxa	[%r16, + 0x0022] %asi, %r31
T2_asi_reg_wr_2:
	mov	0x1c, %r14
	.word 0xf0f38e60  ! 41: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfec4c020  ! 42: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r31
	.word 0xfc8c8020  ! 43: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
	.word 0xfe042098  ! 45: LDUW_I	lduw	[%r16 + 0x0098], %r31
	.word 0xf085e1bf  ! 51: LDUWA_I	lduwa	[%r23, + 0x01bf] %asi, %r24
cpu_intr_2_4:
	setx	0x1d0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0c8000  ! 53: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xf2144000  ! 54: LDUH_R	lduh	[%r17 + %r0], %r25
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 24)
	.word 0xfe5c0000  ! 56: LDX_R	ldx	[%r16 + %r0], %r31
cpu_intr_2_5:
	setx	0x1e022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_3:
	mov	0x6, %r14
	.word 0xfaf389e0  ! 59: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 16)
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_2:
	mov	0x3c3, %r14
	.word 0xf2db8400  ! 62: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb83ca0eb  ! 63: XNOR_I	xnor 	%r18, 0x00eb, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xf215e0e1  ! 67: LDUH_I	lduh	[%r23 + 0x00e1], %r25
	.word 0xf6958020  ! 68: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
	.word 0xfa550000  ! 69: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xf455e1c6  ! 74: LDSH_I	ldsh	[%r23 + 0x01c6], %r26
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_NONHPRIV
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_6:
	setx	0x1f011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_7:
	setx	0x1f011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfc8ce08b  ! 89: LDUBA_I	lduba	[%r19, + 0x008b] %asi, %r30
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982ad8  ! 90: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad8, %hpstate
	.word 0xbd35c000  ! 91: SRL_R	srl 	%r23, %r0, %r30
T2_asi_reg_wr_4:
	mov	0x3c1, %r14
	.word 0xf0f38e80  ! 94: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982ad8  ! 97: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad8, %hpstate
cpu_intr_2_8:
	setx	0x1f001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28c0020  ! 100: LDUBA_R	lduba	[%r16, %r0] 0x01, %r25
T2_asi_reg_rd_3:
	mov	0x20, %r14
	.word 0xf4db8e40  ! 101: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf00c0000  ! 102: LDUB_R	ldub	[%r16 + %r0], %r24
cpu_intr_2_9:
	setx	0x1e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2db001  ! 106: SLLX_I	sllx	%r22, 0x0001, %r30
	.word 0xf045e12c  ! 109: LDSW_I	ldsw	[%r23 + 0x012c], %r24
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb6bcc000  ! 115: XNORcc_R	xnorcc 	%r19, %r0, %r27
	.word 0xf4d5c020  ! 118: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r26
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 10)
	.word 0xf45d8000  ! 122: LDX_R	ldx	[%r22 + %r0], %r26
	.word 0xfa44608d  ! 127: LDSW_I	ldsw	[%r17 + 0x008d], %r29
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_rd_4:
	mov	0x5, %r14
	.word 0xf0db84a0  ! 130: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf054c000  ! 135: LDSH_R	ldsh	[%r19 + %r0], %r24
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 13)
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_10:
	setx	0x1c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf805e0e6  ! 150: LDUW_I	lduw	[%r23 + 0x00e6], %r28
	.word 0xfacc8020  ! 155: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r29
	.word 0xfa8c610d  ! 156: LDUBA_I	lduba	[%r17, + 0x010d] %asi, %r29
	ta	T_CHANGE_TO_TL0
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, e)
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, d)
	.word 0xbab5a02f  ! 166: ORNcc_I	orncc 	%r22, 0x002f, %r29
	.word 0xfa4d61ae  ! 167: LDSB_I	ldsb	[%r21 + 0x01ae], %r29
	.word 0xfa040000  ! 168: LDUW_R	lduw	[%r16 + %r0], %r29
cpu_intr_2_11:
	setx	0x1c0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_5:
	mov	0x9, %r14
	.word 0xf0f389e0  ! 171: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_12:
	setx	0x1c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_13:
	setx	0x1d000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf4142061  ! 188: LDUH_I	lduh	[%r16 + 0x0061], %r26
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 3c)
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_14:
	setx	0x1f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_15:
	setx	0x1c023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05c8000  ! 195: LDX_R	ldx	[%r18 + %r0], %r24
cpu_intr_2_16:
	setx	0x1d0200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 25)
	.word 0xfe0ca0ee  ! 199: LDUB_I	ldub	[%r18 + 0x00ee], %r31
	.word 0xbab46097  ! 200: ORNcc_I	orncc 	%r17, 0x0097, %r29
	.word 0xfe4de02d  ! 205: LDSB_I	ldsb	[%r23 + 0x002d], %r31
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 25)
	.word 0xfe050000  ! 209: LDUW_R	lduw	[%r20 + %r0], %r31
cpu_intr_2_17:
	setx	0x1d030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_6:
	mov	0x2f, %r14
	.word 0xf4f384a0  ! 211: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_18:
	setx	0x1f0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6144000  ! 214: LDUH_R	lduh	[%r17 + %r0], %r27
T2_asi_reg_wr_7:
	mov	0x3, %r14
	.word 0xfaf38e40  ! 217: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfec5e1da  ! 219: LDSWA_I	ldswa	[%r23, + 0x01da] %asi, %r31
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, b)
	.word 0xf455e18f  ! 222: LDSH_I	ldsh	[%r23 + 0x018f], %r26
cpu_intr_2_19:
	setx	0x1c0325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_wr_8:
	mov	0x2c, %r14
	.word 0xfcf38e40  ! 228: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_20:
	setx	0x1f013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 3)
	.word 0xb8454000  ! 242: ADDC_R	addc 	%r21, %r0, %r28
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 28)
	.word 0xf25dc000  ! 244: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0xf2dc202c  ! 247: LDXA_I	ldxa	[%r16, + 0x002c] %asi, %r25
	.word 0xfa8d616c  ! 250: LDUBA_I	lduba	[%r21, + 0x016c] %asi, %r29
	.word 0xfe85212d  ! 251: LDUWA_I	lduwa	[%r20, + 0x012d] %asi, %r31
	.word 0xb750c000  ! 257: RDPR_TT	<illegal instruction>
T2_asi_reg_wr_9:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 259: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb33df001  ! 262: SRAX_I	srax	%r23, 0x0001, %r25
T2_asi_reg_wr_10:
	mov	0x3c5, %r14
	.word 0xf2f384a0  ! 264: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_rd_5:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 268: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_NONHPRIV
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, c)
	.word 0xbc3ce17a  ! 276: XNOR_I	xnor 	%r19, 0x017a, %r30
	.word 0xfe8cc020  ! 277: LDUBA_R	lduba	[%r19, %r0] 0x01, %r31
	.word 0xf24c0000  ! 279: LDSB_R	ldsb	[%r16 + %r0], %r25
T2_asi_reg_rd_6:
	mov	0x9, %r14
	.word 0xfadb89e0  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf6d48020  ! 288: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
cpu_intr_2_21:
	setx	0x1f0239, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_7:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 291: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_22:
	setx	0x1c022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_11:
	mov	0x3c4, %r14
	.word 0xf4f38400  ! 297: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfe8ca083  ! 298: LDUBA_I	lduba	[%r18, + 0x0083] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfcd54020  ! 312: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r30
	.word 0xf09560f1  ! 314: LDUHA_I	lduha	[%r21, + 0x00f1] %asi, %r24
cpu_intr_2_23:
	setx	0x1d030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_12:
	mov	0x3c8, %r14
	.word 0xf6f38e80  ! 316: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf654e012  ! 318: LDSH_I	ldsh	[%r19 + 0x0012], %r27
	.word 0xfc4dc000  ! 319: LDSB_R	ldsb	[%r23 + %r0], %r30
T2_asi_reg_wr_13:
	mov	0x20, %r14
	.word 0xfef38400  ! 320: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf64c4000  ! 321: LDSB_R	ldsb	[%r17 + %r0], %r27
T2_asi_reg_wr_14:
	mov	0x4, %r14
	.word 0xfef389e0  ! 324: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_15:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 325: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_wr_16:
	mov	0xe, %r14
	.word 0xfaf38e80  ! 326: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_wr_17:
	mov	0x2d, %r14
	.word 0xfaf38e80  ! 327: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_rd_8:
	mov	0x4, %r14
	.word 0xf6db8e80  ! 329: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfcd48020  ! 331: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r30
T2_asi_reg_wr_18:
	mov	0x20, %r14
	.word 0xf0f38e60  ! 333: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfa858020  ! 334: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r29
cpu_intr_2_24:
	setx	0x1f0229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_25:
	setx	0x1d0239, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_9:
	mov	0x23, %r14
	.word 0xfcdb89e0  ! 344: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb4b5c000  ! 345: SUBCcc_R	orncc 	%r23, %r0, %r26
cpu_intr_2_26:
	setx	0x1c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf804a1af  ! 349: LDUW_I	lduw	[%r18 + 0x01af], %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_wr_19:
	mov	0x10, %r14
	.word 0xf0f389e0  ! 354: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf8440000  ! 355: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xfa0c6053  ! 357: LDUB_I	ldub	[%r17 + 0x0053], %r29
	.word 0xf0cc2171  ! 360: LDSBA_I	ldsba	[%r16, + 0x0171] %asi, %r24
cpu_intr_2_27:
	setx	0x1f022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_28:
	setx	0x1e0234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_29:
	setx	0x1e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c8000  ! 368: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xf8c58020  ! 370: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r28
cpu_intr_2_30:
	setx	0x1c0211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_31:
	setx	0x1c0121, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_10:
	mov	0x15, %r14
	.word 0xfcdb8400  ! 373: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfa1560c9  ! 374: LDUH_I	lduh	[%r21 + 0x00c9], %r29
T2_asi_reg_rd_11:
	mov	0x3c4, %r14
	.word 0xf6db8400  ! 376: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_wr_20:
	mov	0x3c7, %r14
	.word 0xf2f38e80  ! 377: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf8952058  ! 378: LDUHA_I	lduha	[%r20, + 0x0058] %asi, %r28
	.word 0xbe2ca072  ! 383: ANDN_I	andn 	%r18, 0x0072, %r31
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, f)
	.word 0xf04420c6  ! 386: LDSW_I	ldsw	[%r16 + 0x00c6], %r24
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 16)
	.word 0xb81d2115  ! 390: XOR_I	xor 	%r20, 0x0115, %r28
cpu_intr_2_32:
	setx	0x1f0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4954020  ! 396: LDUHA_R	lduha	[%r21, %r0] 0x01, %r26
	.word 0xf88c607b  ! 397: LDUBA_I	lduba	[%r17, + 0x007b] %asi, %r28
T2_asi_reg_wr_21:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 398: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfed58020  ! 399: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
cpu_intr_2_33:
	setx	0x1f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_22:
	mov	0x3c3, %r14
	.word 0xfcf38400  ! 408: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_wr_23:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 411: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_12:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 414: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_wr_24:
	mov	0x38, %r14
	.word 0xfaf38400  ! 415: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_rd_13:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 418: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_34:
	setx	0x1e0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf005e0ca  ! 422: LDUW_I	lduw	[%r23 + 0x00ca], %r24
	ta	T_CHANGE_TO_TL1
	.word 0xfe4c8000  ! 426: LDSB_R	ldsb	[%r18 + %r0], %r31
cpu_intr_2_35:
	setx	0x1f0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf61520d3  ! 430: LDUH_I	lduh	[%r20 + 0x00d3], %r27
cpu_intr_2_36:
	setx	0x1f0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89c20d2  ! 435: XORcc_I	xorcc 	%r16, 0x00d2, %r28
T2_asi_reg_wr_25:
	mov	0x12, %r14
	.word 0xfaf38e60  ! 438: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf2cd6081  ! 439: LDSBA_I	ldsba	[%r21, + 0x0081] %asi, %r25
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 29)
	.word 0xfc058000  ! 442: LDUW_R	lduw	[%r22 + %r0], %r30
cpu_intr_2_37:
	setx	0x33f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_14:
	mov	0x26, %r14
	.word 0xfcdb8e80  ! 445: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_38:
	setx	0x1f0312, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_26:
	mov	0x23, %r14
	.word 0xfef384a0  ! 449: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfe840020  ! 452: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
cpu_intr_2_39:
	setx	0x1e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_15:
	mov	0x2d, %r14
	.word 0xfadb8e40  ! 455: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_16:
	mov	0x5, %r14
	.word 0xf0db8e40  ! 456: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_27:
	mov	0x32, %r14
	.word 0xf2f38e40  ! 458: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf85c61df  ! 462: LDX_I	ldx	[%r17 + 0x01df], %r28
cpu_intr_2_40:
	setx	0x220135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 3f)
	.word 0x8195a115  ! 468: WRPR_TPC_I	wrpr	%r22, 0x0115, %tpc
	.word 0xfa55e16e  ! 469: LDSH_I	ldsh	[%r23 + 0x016e], %r29
	.word 0xb2344000  ! 471: SUBC_R	orn 	%r17, %r0, %r25
cpu_intr_2_41:
	setx	0x220210, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_28:
	mov	0x3c8, %r14
	.word 0xfef38e60  ! 474: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 18)
	.word 0xf255e1e1  ! 476: LDSH_I	ldsh	[%r23 + 0x01e1], %r25
	.word 0xf44c8000  ! 478: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0xf4cd217e  ! 479: LDSBA_I	ldsba	[%r20, + 0x017e] %asi, %r26
T2_asi_reg_wr_29:
	mov	0x38, %r14
	.word 0xf8f389e0  ! 480: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf8d4a034  ! 482: LDSHA_I	ldsha	[%r18, + 0x0034] %asi, %r28
	.word 0xbf7c0400  ! 488: MOVR_R	movre	%r16, %r0, %r31
cpu_intr_2_42:
	setx	0x230210, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_17:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 492: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf6458000  ! 494: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xfe848020  ! 497: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r31
	.word 0xf855a05e  ! 498: LDSH_I	ldsh	[%r22 + 0x005e], %r28
	.word 0xf805e010  ! 499: LDUW_I	lduw	[%r23 + 0x0010], %r28
T2_asi_reg_rd_18:
	mov	0x26, %r14
	.word 0xfadb8e60  ! 500: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_43:
	setx	0x230313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3cc000  ! 503: XNOR_R	xnor 	%r19, %r0, %r29
	.word 0xf8c4c020  ! 505: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
cpu_intr_2_44:
	setx	0x210019, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf6044000  ! 511: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xbe8c6015  ! 512: ANDcc_I	andcc 	%r17, 0x0015, %r31
T2_asi_reg_wr_30:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 514: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_45:
	setx	0x220224, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba85c000  ! 519: ADDcc_R	addcc 	%r23, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0xb69c60b8  ! 524: XORcc_I	xorcc 	%r17, 0x00b8, %r27
	.word 0xf6440000  ! 526: LDSW_R	ldsw	[%r16 + %r0], %r27
	.word 0xfe058000  ! 529: LDUW_R	lduw	[%r22 + %r0], %r31
T2_asi_reg_rd_19:
	mov	0x5, %r14
	.word 0xfadb8e40  ! 530: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfc15c000  ! 531: LDUH_R	lduh	[%r23 + %r0], %r30
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 29)
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982b52  ! 536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b52, %hpstate
	.word 0xb62c0000  ! 541: ANDN_R	andn 	%r16, %r0, %r27
T2_asi_reg_rd_20:
	mov	0x37, %r14
	.word 0xf4db8e40  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_31:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 543: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf04ce0b3  ! 549: LDSB_I	ldsb	[%r19 + 0x00b3], %r24
	.word 0xfe8d6150  ! 551: LDUBA_I	lduba	[%r21, + 0x0150] %asi, %r31
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 6)
	.word 0xfa0ca093  ! 553: LDUB_I	ldub	[%r18 + 0x0093], %r29
cpu_intr_2_46:
	setx	0x200033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1d0000  ! 555: XOR_R	xor 	%r20, %r0, %r31
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_21:
	mov	0x24, %r14
	.word 0xf4db8e40  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf6150000  ! 567: LDUH_R	lduh	[%r20 + %r0], %r27
	ta	T_CHANGE_TO_TL0
	.word 0xb2b4c000  ! 573: SUBCcc_R	orncc 	%r19, %r0, %r25
T2_asi_reg_rd_22:
	mov	0x1, %r14
	.word 0xf0db8400  ! 574: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfa5d2162  ! 575: LDX_I	ldx	[%r20 + 0x0162], %r29
T2_asi_reg_rd_23:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 577: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbcadc000  ! 580: ANDNcc_R	andncc 	%r23, %r0, %r30
	.word 0xf28d8020  ! 582: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
cpu_intr_2_47:
	setx	0x200301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf084c020  ! 590: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
cpu_intr_2_48:
	setx	0x210323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_wr_32:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 598: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf48c8020  ! 601: LDUBA_R	lduba	[%r18, %r0] 0x01, %r26
T2_asi_reg_wr_33:
	mov	0x3c8, %r14
	.word 0xf8f38e80  ! 602: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf245603b  ! 603: LDSW_I	ldsw	[%r21 + 0x003b], %r25
T2_asi_reg_wr_34:
	mov	0x3c3, %r14
	.word 0xfcf38400  ! 605: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_49:
	setx	0x200011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf004a1fe  ! 614: LDUW_I	lduw	[%r18 + 0x01fe], %r24
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_50:
	setx	0x220334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_24:
	mov	0x1, %r14
	.word 0xfadb8e40  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf804a12f  ! 629: LDUW_I	lduw	[%r18 + 0x012f], %r28
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf24da0dd  ! 635: LDSB_I	ldsb	[%r22 + 0x00dd], %r25
T2_asi_reg_wr_35:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 637: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbd2cb001  ! 638: SLLX_I	sllx	%r18, 0x0001, %r30
T2_asi_reg_rd_25:
	mov	0x29, %r14
	.word 0xfedb8e60  ! 640: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_2_51:
	setx	0x200005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_52:
	setx	0x210039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_53:
	setx	0x230239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4858020  ! 651: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r26
	.word 0xbb3de001  ! 655: SRA_I	sra 	%r23, 0x0001, %r29
T2_asi_reg_wr_36:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 656: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf8cc20dd  ! 659: LDSBA_I	ldsba	[%r16, + 0x00dd] %asi, %r28
	.word 0xf0cca1ba  ! 660: LDSBA_I	ldsba	[%r18, + 0x01ba] %asi, %r24
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfacda1da  ! 670: LDSBA_I	ldsba	[%r22, + 0x01da] %asi, %r29
T2_asi_reg_rd_26:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 671: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_NONHPRIV
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 26)
	.word 0xb3520000  ! 679: RDPR_PIL	<illegal instruction>
	.word 0xfc4c6162  ! 680: LDSB_I	ldsb	[%r17 + 0x0162], %r30
	.word 0xfa44a126  ! 681: LDSW_I	ldsw	[%r18 + 0x0126], %r29
	.word 0xf094c020  ! 682: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0444000  ! 684: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xfa45c000  ! 687: LDSW_R	ldsw	[%r23 + %r0], %r29
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 1a)
	.word 0xb72d2001  ! 689: SLL_I	sll 	%r20, 0x0001, %r27
	ta	T_CHANGE_NONHPRIV
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 19)
	.word 0xfa04a032  ! 694: LDUW_I	lduw	[%r18 + 0x0032], %r29
	.word 0xf6154000  ! 700: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xfc144000  ! 703: LDUH_R	lduh	[%r17 + %r0], %r30
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_27:
	mov	0x3, %r14
	.word 0xf4db89e0  ! 705: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_54:
	setx	0x230216, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_55:
	setx	0x210131, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_28:
	mov	0x6, %r14
	.word 0xfcdb8e80  ! 714: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb9342001  ! 715: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0xb93d5000  ! 716: SRAX_R	srax	%r21, %r0, %r28
	.word 0xf6c40020  ! 721: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r27
cpu_intr_2_56:
	setx	0x230009, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_29:
	mov	0x1, %r14
	.word 0xfcdb8e60  ! 724: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfc854020  ! 726: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r30
cpu_intr_2_57:
	setx	0x230227, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_37:
	mov	0x31, %r14
	.word 0xfef38e60  ! 728: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbc054000  ! 729: ADD_R	add 	%r21, %r0, %r30
	.word 0xf6cda123  ! 730: LDSBA_I	ldsba	[%r22, + 0x0123] %asi, %r27
	.word 0xfc458000  ! 731: LDSW_R	ldsw	[%r22 + %r0], %r30
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 17)
	.word 0xb09c6100  ! 736: XORcc_I	xorcc 	%r17, 0x0100, %r24
	.word 0xfe5c0000  ! 738: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xfc95c020  ! 740: LDUHA_R	lduha	[%r23, %r0] 0x01, %r30
T2_asi_reg_rd_30:
	mov	0x15, %r14
	.word 0xf2db8e40  ! 742: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_38:
	mov	0x3c8, %r14
	.word 0xf0f38e80  ! 743: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_58:
	setx	0x230030, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_39:
	mov	0x4, %r14
	.word 0xfaf38e60  ! 749: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_59:
	setx	0x230032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf6558000  ! 753: LDSH_R	ldsh	[%r22 + %r0], %r27
	ta	T_CHANGE_TO_TL1
cpu_intr_2_60:
	setx	0x220221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 8)
	.word 0xfadd2078  ! 760: LDXA_I	ldxa	[%r20, + 0x0078] %asi, %r29
	.word 0xf25d4000  ! 763: LDX_R	ldx	[%r21 + %r0], %r25
cpu_intr_2_61:
	setx	0x230200, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_40:
	mov	0xe, %r14
	.word 0xfef38e40  ! 768: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xbec521c4  ! 770: ADDCcc_I	addccc 	%r20, 0x01c4, %r31
	.word 0xfcdd217e  ! 774: LDXA_I	ldxa	[%r20, + 0x017e] %asi, %r30
	.word 0xf254e001  ! 779: LDSH_I	ldsh	[%r19 + 0x0001], %r25
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 10)
	.word 0xb935b001  ! 786: SRLX_I	srlx	%r22, 0x0001, %r28
	.word 0xf8cd4020  ! 787: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r28
	.word 0xbcb5602d  ! 788: SUBCcc_I	orncc 	%r21, 0x002d, %r30
cpu_intr_2_62:
	setx	0x220316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba848000  ! 792: ADDcc_R	addcc 	%r18, %r0, %r29
	.word 0xb8bc4000  ! 794: XNORcc_R	xnorcc 	%r17, %r0, %r28
	.word 0xf09560dd  ! 795: LDUHA_I	lduha	[%r21, + 0x00dd] %asi, %r24
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfacc0020  ! 797: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
T2_asi_reg_rd_31:
	mov	0x35, %r14
	.word 0xfcdb89e0  ! 798: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_63:
	setx	0x230234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_64:
	setx	0x22012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983818  ! 808: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1818, %hpstate
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_65:
	setx	0x21010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0c6103  ! 814: LDUB_I	ldub	[%r17 + 0x0103], %r29
T2_asi_reg_wr_41:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 819: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_42:
	mov	0x16, %r14
	.word 0xf6f389e0  ! 821: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfad421f0  ! 823: LDSHA_I	ldsha	[%r16, + 0x01f0] %asi, %r29
	.word 0xfe050000  ! 824: LDUW_R	lduw	[%r20 + %r0], %r31
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_rd_32:
	mov	0x3c8, %r14
	.word 0xf6db8e80  ! 826: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_66:
	setx	0x210228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04c8000  ! 838: LDSB_R	ldsb	[%r18 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0xf8c44020  ! 840: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r28
cpu_intr_2_67:
	setx	0x220125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe154000  ! 844: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xf20d0000  ! 846: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xfc040000  ! 847: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xfe9460bc  ! 848: LDUHA_I	lduha	[%r17, + 0x00bc] %asi, %r31
	.word 0xfe54612f  ! 849: LDSH_I	ldsh	[%r17 + 0x012f], %r31
	.word 0xf8540000  ! 854: LDSH_R	ldsh	[%r16 + %r0], %r28
cpu_intr_2_68:
	setx	0x210021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_69:
	setx	0x210229, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_33:
	mov	0x24, %r14
	.word 0xfedb89e0  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf44d2068  ! 861: LDSB_I	ldsb	[%r20 + 0x0068], %r26
	.word 0xf244a170  ! 864: LDSW_I	ldsw	[%r18 + 0x0170], %r25
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 10)
	.word 0xf8dce1ce  ! 866: LDXA_I	ldxa	[%r19, + 0x01ce] %asi, %r28
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983b9a  ! 869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b9a, %hpstate
T2_asi_reg_wr_43:
	mov	0x1d, %r14
	.word 0xf8f38e80  ! 870: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf845616f  ! 871: LDSW_I	ldsw	[%r21 + 0x016f], %r28
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982cc2  ! 874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc2, %hpstate
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 2)
	.word 0xb43d4000  ! 876: XNOR_R	xnor 	%r21, %r0, %r26
cpu_intr_2_70:
	setx	0x220011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cda126  ! 881: LDSBA_I	ldsba	[%r22, + 0x0126] %asi, %r24
T2_asi_reg_rd_34:
	mov	0x6, %r14
	.word 0xf8db8e40  ! 882: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfc148000  ! 883: LDUH_R	lduh	[%r18 + %r0], %r30
cpu_intr_2_71:
	setx	0x22030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_72:
	setx	0x20010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc85e156  ! 887: LDUWA_I	lduwa	[%r23, + 0x0156] %asi, %r30
T2_asi_reg_rd_35:
	mov	0x3c4, %r14
	.word 0xfcdb8e60  ! 888: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb72c9000  ! 892: SLLX_R	sllx	%r18, %r0, %r27
T2_asi_reg_rd_36:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 893: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_rd_37:
	mov	0x32, %r14
	.word 0xf6db8e40  ! 896: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_44:
	mov	0x1c, %r14
	.word 0xfef384a0  ! 901: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_73:
	setx	0x200304, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_45:
	mov	0x33, %r14
	.word 0xf4f389e0  ! 904: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_74:
	setx	0x210303, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_38:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 906: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc0de09e  ! 909: LDUB_I	ldub	[%r23 + 0x009e], %r30
cpu_intr_2_75:
	setx	0x250334, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_46:
	mov	0x2e, %r14
	.word 0xf8f38e40  ! 916: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 7)
	.word 0xf65d0000  ! 923: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xfe040000  ! 926: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0xba95c000  ! 927: ORcc_R	orcc 	%r23, %r0, %r29
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, d)
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_76:
	setx	0x27001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84d21c9  ! 933: LDSB_I	ldsb	[%r20 + 0x01c9], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_77:
	setx	0x250220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf285609b  ! 938: LDUWA_I	lduwa	[%r21, + 0x009b] %asi, %r25
	.word 0xf6444000  ! 939: LDSW_R	ldsw	[%r17 + %r0], %r27
	.word 0xb1346001  ! 941: SRL_I	srl 	%r17, 0x0001, %r24
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 27)
	.word 0xf48cc020  ! 944: LDUBA_R	lduba	[%r19, %r0] 0x01, %r26
	.word 0xba9d4000  ! 947: XORcc_R	xorcc 	%r21, %r0, %r29
	.word 0xfec4a117  ! 950: LDSWA_I	ldswa	[%r18, + 0x0117] %asi, %r31
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982802  ! 952: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0802, %hpstate
cpu_intr_2_78:
	setx	0x240101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc04e12a  ! 955: LDUW_I	lduw	[%r19 + 0x012a], %r30
T2_asi_reg_rd_39:
	mov	0x2f, %r14
	.word 0xf0db8e80  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_rd_40:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 958: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfed561b6  ! 960: LDSHA_I	ldsha	[%r21, + 0x01b6] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 22)
	ta	T_CHANGE_HPRIV
cpu_intr_2_79:
	setx	0x26011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_47:
	mov	0x32, %r14
	.word 0xf6f384a0  ! 970: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf48da1d7  ! 973: LDUBA_I	lduba	[%r22, + 0x01d7] %asi, %r26
T2_asi_reg_wr_48:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 978: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 39)
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983f12  ! 981: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f12, %hpstate
	ta	T_CHANGE_TO_TL0
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 9)
	.word 0xf44ce0e6  ! 986: LDSB_I	ldsb	[%r19 + 0x00e6], %r26
	.word 0xf0cd617c  ! 987: LDSBA_I	ldsba	[%r21, + 0x017c] %asi, %r24
	.word 0xfe04600a  ! 991: LDUW_I	lduw	[%r17 + 0x000a], %r31
	.word 0xf0152087  ! 992: LDUH_I	lduh	[%r20 + 0x0087], %r24
	.word 0xf4c50020  ! 993: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_41:
	mov	0x2f, %r14
	.word 0xf0db8e40  ! 997: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_80:
	setx	0x270112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08cc020  ! 1000: LDUBA_R	lduba	[%r19, %r0] 0x01, %r24
cpu_intr_2_81:
	setx	0x260109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf855c000  ! 1008: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xf40ce1ce  ! 1010: LDUB_I	ldub	[%r19 + 0x01ce], %r26
T2_asi_reg_rd_42:
	mov	0x3c3, %r14
	.word 0xf4db89e0  ! 1013: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb6bd0000  ! 1014: XNORcc_R	xnorcc 	%r20, %r0, %r27
	.word 0xf28c4020  ! 1015: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf8d56182  ! 1018: LDSHA_I	ldsha	[%r21, + 0x0182] %asi, %r28
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 28)
	.word 0xf0cc8020  ! 1023: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r24
T2_asi_reg_wr_49:
	mov	0x29, %r14
	.word 0xfaf38e60  ! 1027: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfe55c000  ! 1031: LDSH_R	ldsh	[%r23 + %r0], %r31
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_82:
	setx	0x270328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfe1461cf  ! 1044: LDUH_I	lduh	[%r17 + 0x01cf], %r31
	.word 0xb93cf001  ! 1046: SRAX_I	srax	%r19, 0x0001, %r28
	ta	T_CHANGE_NONHPRIV
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfe544000  ! 1051: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xb6b5c000  ! 1053: SUBCcc_R	orncc 	%r23, %r0, %r27
T2_asi_reg_wr_50:
	mov	0x3c0, %r14
	.word 0xf8f384a0  ! 1056: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_2_83:
	setx	0x25023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_84:
	setx	0x24030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec46059  ! 1060: LDSWA_I	ldswa	[%r17, + 0x0059] %asi, %r31
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, c)
	.word 0xf60d4000  ! 1062: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xf4c58020  ! 1067: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r26
	.word 0xfac46161  ! 1068: LDSWA_I	ldswa	[%r17, + 0x0161] %asi, %r29
cpu_intr_2_85:
	setx	0x25031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_86:
	setx	0x270336, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_43:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 1075: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T2_asi_reg_wr_51:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 1077: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf8140000  ! 1079: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xb9641800  ! 1080: MOVcc_R	<illegal instruction>
	.word 0xf8152012  ! 1081: LDUH_I	lduh	[%r20 + 0x0012], %r28
	.word 0xfadce178  ! 1082: LDXA_I	ldxa	[%r19, + 0x0178] %asi, %r29
	.word 0xfadd607f  ! 1083: LDXA_I	ldxa	[%r21, + 0x007f] %asi, %r29
	.word 0xf0d5c020  ! 1085: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r24
cpu_intr_2_87:
	setx	0x250219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 23)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_88:
	setx	0x25011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe84e1d8  ! 1095: LDUWA_I	lduwa	[%r19, + 0x01d8] %asi, %r31
	.word 0xbf3c7001  ! 1098: SRAX_I	srax	%r17, 0x0001, %r31
T2_asi_reg_rd_44:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 1099: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfe058000  ! 1100: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0xfad44020  ! 1101: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
	.word 0xfc858020  ! 1103: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
	.word 0xf855212e  ! 1105: LDSH_I	ldsh	[%r20 + 0x012e], %r28
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 19)
	.word 0xf804a0f2  ! 1109: LDUW_I	lduw	[%r18 + 0x00f2], %r28
	.word 0xfcd40020  ! 1110: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r30
	.word 0xb23c0000  ! 1111: XNOR_R	xnor 	%r16, %r0, %r25
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_wr_52:
	mov	0x3c3, %r14
	.word 0xfcf384a0  ! 1114: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 26)
	.word 0xbe1dc000  ! 1121: XOR_R	xor 	%r23, %r0, %r31
cpu_intr_2_89:
	setx	0x26022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0056042  ! 1124: LDUW_I	lduw	[%r21 + 0x0042], %r24
	.word 0xfa458000  ! 1125: LDSW_R	ldsw	[%r22 + %r0], %r29
T2_asi_reg_rd_45:
	mov	0x2b, %r14
	.word 0xf6db8400  ! 1128: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983892  ! 1134: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1892, %hpstate
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_90:
	setx	0x26001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc45e18b  ! 1141: LDSW_I	ldsw	[%r23 + 0x018b], %r30
	.word 0xf415c000  ! 1144: LDUH_R	lduh	[%r23 + %r0], %r26
T2_asi_reg_rd_46:
	mov	0x24, %r14
	.word 0xfcdb84a0  ! 1145: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_wr_53:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 1149: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_47:
	mov	0x3c7, %r14
	.word 0xfedb8e80  ! 1152: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_54:
	mov	0x29, %r14
	.word 0xfaf389e0  ! 1155: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf6146049  ! 1156: LDUH_I	lduh	[%r17 + 0x0049], %r27
cpu_intr_2_91:
	setx	0x270316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_92:
	setx	0x240307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa542022  ! 1159: LDSH_I	ldsh	[%r16 + 0x0022], %r29
T2_asi_reg_rd_48:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 1162: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfa5ce060  ! 1166: LDX_I	ldx	[%r19 + 0x0060], %r29
T2_asi_reg_wr_55:
	mov	0x8, %r14
	.word 0xf8f38e80  ! 1170: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfc45c000  ! 1172: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xfa0d4000  ! 1175: LDUB_R	ldub	[%r21 + %r0], %r29
T2_asi_reg_rd_49:
	mov	0xb, %r14
	.word 0xf4db84a0  ! 1177: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf805e0b6  ! 1179: LDUW_I	lduw	[%r23 + 0x00b6], %r28
	.word 0xba9ca183  ! 1180: XORcc_I	xorcc 	%r18, 0x0183, %r29
	.word 0xf2c54020  ! 1182: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r25
cpu_intr_2_93:
	setx	0x260129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_94:
	setx	0x250109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe250000  ! 1191: SUB_R	sub 	%r20, %r0, %r31
T2_asi_reg_rd_50:
	mov	0x36, %r14
	.word 0xf8db89e0  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb8b46065  ! 1196: ORNcc_I	orncc 	%r17, 0x0065, %r28
	.word 0xfed48020  ! 1197: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r31
cpu_intr_2_95:
	setx	0x27001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_56:
	mov	0x17, %r14
	.word 0xf6f38e80  ! 1200: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_57:
	mov	0x3, %r14
	.word 0xfaf38e60  ! 1205: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfec40020  ! 1207: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r31
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 2)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_96:
	setx	0x270232, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_51:
	mov	0x1, %r14
	.word 0xf8db8400  ! 1221: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3353001  ! 1225: SRLX_I	srlx	%r20, 0x0001, %r25
T2_asi_reg_wr_58:
	mov	0x2f, %r14
	.word 0xfcf38400  ! 1227: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfc040000  ! 1228: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xfcc4a19e  ! 1231: LDSWA_I	ldswa	[%r18, + 0x019e] %asi, %r30
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 38)
	.word 0xf214e0d3  ! 1235: LDUH_I	lduh	[%r19 + 0x00d3], %r25
	ta	T_CHANGE_TO_TL0
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_97:
	setx	0x240301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_98:
	setx	0x270201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa550000  ! 1245: LDSH_R	ldsh	[%r20 + %r0], %r29
T2_asi_reg_rd_52:
	mov	0x1f, %r14
	.word 0xfedb8e40  ! 1246: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_59:
	mov	0x4, %r14
	.word 0xf4f38400  ! 1254: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfcc50020  ! 1256: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r30
cpu_intr_2_99:
	setx	0x260230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d4602a  ! 1264: LDSHA_I	ldsha	[%r17, + 0x002a] %asi, %r28
	.word 0xfe44c000  ! 1265: LDSW_R	ldsw	[%r19 + %r0], %r31
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 6)
	.word 0xfccc0020  ! 1271: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_100:
	setx	0x250103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0054000  ! 1281: LDUW_R	lduw	[%r21 + %r0], %r24
T2_asi_reg_rd_53:
	mov	0x36, %r14
	.word 0xf8db8e60  ! 1282: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a48  ! 1283: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a48, %hpstate
	.word 0xf28dc020  ! 1284: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
cpu_intr_2_101:
	setx	0x240302, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_60:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 1290: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
	.word 0xf095a092  ! 1295: LDUHA_I	lduha	[%r22, + 0x0092] %asi, %r24
cpu_intr_2_102:
	setx	0x26010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b54000  ! 1297: SUBCcc_R	orncc 	%r21, %r0, %r26
	ta	T_CHANGE_TO_TL0
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 39)
	.word 0xbb2de001  ! 1306: SLL_I	sll 	%r23, 0x0001, %r29
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 2a)
	.word 0xb0b4c000  ! 1313: ORNcc_R	orncc 	%r19, %r0, %r24
T2_asi_reg_wr_61:
	mov	0x1d, %r14
	.word 0xf6f38e80  ! 1314: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_103:
	setx	0x24021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_62:
	mov	0x34, %r14
	.word 0xfef384a0  ! 1317: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf2c4e13a  ! 1318: LDSWA_I	ldswa	[%r19, + 0x013a] %asi, %r25
cpu_intr_2_104:
	setx	0x26001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_63:
	mov	0x6, %r14
	.word 0xfef389e0  ! 1326: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf84c20b0  ! 1328: LDSB_I	ldsb	[%r16 + 0x00b0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_54:
	mov	0x22, %r14
	.word 0xf8db8e40  ! 1330: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf4dce065  ! 1331: LDXA_I	ldxa	[%r19, + 0x0065] %asi, %r26
	.word 0xfcc48020  ! 1332: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
	.word 0xfa8cc020  ! 1333: LDUBA_R	lduba	[%r19, %r0] 0x01, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_55:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 1337: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf4458000  ! 1340: LDSW_R	ldsw	[%r22 + %r0], %r26
cpu_intr_2_105:
	setx	0x240232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfadde00f  ! 1344: LDXA_I	ldxa	[%r23, + 0x000f] %asi, %r29
	.word 0xf6d52060  ! 1347: LDSHA_I	ldsha	[%r20, + 0x0060] %asi, %r27
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 3)
	.word 0xf6848020  ! 1351: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r27
cpu_intr_2_106:
	setx	0x260035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c5a1d9  ! 1355: ADDCcc_I	addccc 	%r22, 0x01d9, %r27
cpu_intr_2_107:
	setx	0x24011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 21)
	.word 0xf695e14c  ! 1358: LDUHA_I	lduha	[%r23, + 0x014c] %asi, %r27
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_108:
	setx	0x24031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2048000  ! 1365: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0xfc8dc020  ! 1368: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
T2_asi_reg_rd_56:
	mov	0x7, %r14
	.word 0xf4db8e40  ! 1371: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfedce13e  ! 1375: LDXA_I	ldxa	[%r19, + 0x013e] %asi, %r31
cpu_intr_2_109:
	setx	0x27003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
	.word 0xfa94a166  ! 1381: LDUHA_I	lduha	[%r18, + 0x0166] %asi, %r29
cpu_intr_2_110:
	setx	0x24032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88d4020  ! 1386: LDUBA_R	lduba	[%r21, %r0] 0x01, %r28
cpu_intr_2_111:
	setx	0x27003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 11)
	.word 0xf294e023  ! 1393: LDUHA_I	lduha	[%r19, + 0x0023] %asi, %r25
cpu_intr_2_112:
	setx	0x260020, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 17)
	.word 0xf6d460ec  ! 1399: LDSHA_I	ldsha	[%r17, + 0x00ec] %asi, %r27
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_113:
	setx	0x2b0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d58020  ! 1403: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r26
	.word 0xbf35b001  ! 1404: SRLX_I	srlx	%r22, 0x0001, %r31
T2_asi_reg_rd_57:
	mov	0x17, %r14
	.word 0xf2db8e80  ! 1405: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_wr_64:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 1407: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb0b44000  ! 1408: SUBCcc_R	orncc 	%r17, %r0, %r24
T2_asi_reg_rd_58:
	mov	0x2d, %r14
	.word 0xf2db8400  ! 1410: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf84561c5  ! 1415: LDSW_I	ldsw	[%r21 + 0x01c5], %r28
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_rd_59:
	mov	0x14, %r14
	.word 0xf8db8e60  ! 1418: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_rd_60:
	mov	0x8, %r14
	.word 0xf6db8e60  ! 1421: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf4cc4020  ! 1423: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r26
	.word 0xfc552107  ! 1424: LDSH_I	ldsh	[%r20 + 0x0107], %r30
	.word 0xf84561c9  ! 1425: LDSW_I	ldsw	[%r21 + 0x01c9], %r28
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_114:
	setx	0x2a000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_115:
	setx	0x290210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf804a003  ! 1432: LDUW_I	lduw	[%r18 + 0x0003], %r28
	.word 0xfe044000  ! 1434: LDUW_R	lduw	[%r17 + %r0], %r31
T2_asi_reg_rd_61:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe5da153  ! 1441: LDX_I	ldx	[%r22 + 0x0153], %r31
	.word 0xfcc54020  ! 1442: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r30
	.word 0xfa8c4020  ! 1443: LDUBA_R	lduba	[%r17, %r0] 0x01, %r29
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_wr_65:
	mov	0x32, %r14
	.word 0xf0f38e80  ! 1446: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_wr_66:
	mov	0xd, %r14
	.word 0xf4f38e60  ! 1448: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 23)
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0b54000  ! 1455: ORNcc_R	orncc 	%r21, %r0, %r24
	.word 0x87956040  ! 1457: WRPR_TT_I	wrpr	%r21, 0x0040, %tt
	.word 0xbaa420cb  ! 1458: SUBcc_I	subcc 	%r16, 0x00cb, %r29
T2_asi_reg_rd_62:
	mov	0xc, %r14
	.word 0xf0db84a0  ! 1459: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_116:
	setx	0x2a000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb54000  ! 1461: SUBCcc_R	orncc 	%r21, %r0, %r30
	.word 0xf654c000  ! 1463: LDSH_R	ldsh	[%r19 + %r0], %r27
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 3a)
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982a82  ! 1467: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a82, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf8cd8020  ! 1473: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 10)
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983f0a  ! 1478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0a, %hpstate
	.word 0xb634e109  ! 1479: SUBC_I	orn 	%r19, 0x0109, %r27
T2_asi_reg_wr_67:
	mov	0x2a, %r14
	.word 0xf8f384a0  ! 1481: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	.word 0xf20d21e5  ! 1484: LDUB_I	ldub	[%r20 + 0x01e5], %r25
	.word 0xf2c50020  ! 1485: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r25
cpu_intr_2_117:
	setx	0x2b0019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_118:
	setx	0x29011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_63:
	mov	0x1, %r14
	.word 0xfcdb89e0  ! 1492: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_119:
	setx	0x290337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf095a138  ! 1499: LDUHA_I	lduha	[%r22, + 0x0138] %asi, %r24
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 12)
	.word 0xfe8dc020  ! 1501: LDUBA_R	lduba	[%r23, %r0] 0x01, %r31
	.word 0xfc054000  ! 1503: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xfcccc020  ! 1507: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r30
	.word 0xf6cce1fc  ! 1508: LDSBA_I	ldsba	[%r19, + 0x01fc] %asi, %r27
	.word 0xfc048000  ! 1509: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xfc540000  ! 1514: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xfe4560f3  ! 1515: LDSW_I	ldsw	[%r21 + 0x00f3], %r31
T2_asi_reg_wr_68:
	mov	0x2e, %r14
	.word 0xf0f38e80  ! 1516: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_120:
	setx	0x2a0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d82  ! 1519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d82, %hpstate
	.word 0xf05dc000  ! 1520: LDX_R	ldx	[%r23 + %r0], %r24
	.word 0xfad4a06c  ! 1523: LDSHA_I	ldsha	[%r18, + 0x006c] %asi, %r29
T2_asi_reg_wr_69:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 1524: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_wr_70:
	mov	0x7, %r14
	.word 0xf0f38e40  ! 1526: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb214202d  ! 1530: OR_I	or 	%r16, 0x002d, %r25
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 12)
	.word 0xfec5a0fa  ! 1534: LDSWA_I	ldswa	[%r22, + 0x00fa] %asi, %r31
T2_asi_reg_rd_64:
	mov	0x29, %r14
	.word 0xfedb89e0  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xb2a4a020  ! 1539: SUBcc_I	subcc 	%r18, 0x0020, %r25
	.word 0xf0cc20ae  ! 1541: LDSBA_I	ldsba	[%r16, + 0x00ae] %asi, %r24
cpu_intr_2_121:
	setx	0x290320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_122:
	setx	0x2a0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_123:
	setx	0x2a0210, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_71:
	mov	0x22, %r14
	.word 0xf6f389e0  ! 1551: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_2_124:
	setx	0x2a0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3c4000  ! 1554: XNOR_R	xnor 	%r17, %r0, %r30
	.word 0xf4dc2029  ! 1555: LDXA_I	ldxa	[%r16, + 0x0029] %asi, %r26
	.word 0xbe354000  ! 1556: ORN_R	orn 	%r21, %r0, %r31
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_wr_72:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 1558: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf4052036  ! 1560: LDUW_I	lduw	[%r20 + 0x0036], %r26
	.word 0xfa458000  ! 1562: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xf2954020  ! 1563: LDUHA_R	lduha	[%r21, %r0] 0x01, %r25
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_65:
	mov	0x5, %r14
	.word 0xf4db84a0  ! 1568: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 20)
	.word 0xfcc5c020  ! 1580: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r30
	.word 0xbf2db001  ! 1581: SLLX_I	sllx	%r22, 0x0001, %r31
	.word 0xf64c4000  ! 1582: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xfadce0da  ! 1584: LDXA_I	ldxa	[%r19, + 0x00da] %asi, %r29
T2_asi_reg_rd_66:
	mov	0x2e, %r14
	.word 0xfcdb8e60  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_2_125:
	setx	0x280330, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfecd60de  ! 1590: LDSBA_I	ldsba	[%r21, + 0x00de] %asi, %r31
	.word 0xbb7de401  ! 1593: MOVR_I	movre	%r23, 0x1, %r29
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_73:
	mov	0x20, %r14
	.word 0xfef38e40  ! 1601: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf0cce1a0  ! 1602: LDSBA_I	ldsba	[%r19, + 0x01a0] %asi, %r24
T2_asi_reg_rd_67:
	mov	0xf, %r14
	.word 0xfcdb8e40  ! 1603: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_126:
	setx	0x290202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_127:
	setx	0x2a0203, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_68:
	mov	0x20, %r14
	.word 0xf8db84a0  ! 1609: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_2_128:
	setx	0x29013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_129:
	setx	0x2b0225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_69:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 1625: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf8040000  ! 1627: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xb57c2401  ! 1629: MOVR_I	movre	%r16, 0x1, %r26
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 30)
	.word 0xf00d0000  ! 1632: LDUB_R	ldub	[%r20 + %r0], %r24
T2_asi_reg_wr_74:
	mov	0x4, %r14
	.word 0xf2f38400  ! 1635: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfa94a14e  ! 1636: LDUHA_I	lduha	[%r18, + 0x014e] %asi, %r29
	.word 0xf8850020  ! 1638: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
	.word 0xf6450000  ! 1639: LDSW_R	ldsw	[%r20 + %r0], %r27
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_wr_75:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 1641: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 24)
	.word 0xfe0c21a9  ! 1645: LDUB_I	ldub	[%r16 + 0x01a9], %r31
cpu_intr_2_130:
	setx	0x290335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80d8000  ! 1648: LDUB_R	ldub	[%r22 + %r0], %r28
T2_asi_reg_wr_76:
	mov	0x30, %r14
	.word 0xfcf38e80  ! 1650: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_wr_77:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 1651: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_2_131:
	setx	0x280033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccc4020  ! 1656: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r30
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, e)
	.word 0xf6948020  ! 1661: LDUHA_R	lduha	[%r18, %r0] 0x01, %r27
	.word 0xf60d4000  ! 1662: LDUB_R	ldub	[%r21 + %r0], %r27
cpu_intr_2_132:
	setx	0x2a0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08c0020  ! 1665: LDUBA_R	lduba	[%r16, %r0] 0x01, %r24
cpu_intr_2_133:
	setx	0x20234, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_70:
	mov	0x15, %r14
	.word 0xf8db8400  ! 1668: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_rd_71:
	mov	0x29, %r14
	.word 0xf4db8e40  ! 1669: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf08de100  ! 1670: LDUBA_I	lduba	[%r23, + 0x0100] %asi, %r24
T2_asi_reg_wr_78:
	mov	0x3c2, %r14
	.word 0xf8f389e0  ! 1672: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf4cd4020  ! 1679: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r26
	.word 0xa1902001  ! 1681: WRPR_GL_I	wrpr	%r0, 0x0001, %-
T2_asi_reg_rd_72:
	mov	0x34, %r14
	.word 0xf4db84a0  ! 1685: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_134:
	setx	0x2b013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_73:
	mov	0x6, %r14
	.word 0xf0db8400  ! 1693: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_rd_74:
	mov	0x15, %r14
	.word 0xf2db84a0  ! 1695: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T2_asi_reg_wr_79:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 1697: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfec44020  ! 1699: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
	.word 0xf85ca0c7  ! 1701: LDX_I	ldx	[%r18 + 0x00c7], %r28
cpu_intr_2_135:
	setx	0x28023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0446033  ! 1707: LDSW_I	ldsw	[%r17 + 0x0033], %r24
	.word 0xfc15c000  ! 1708: LDUH_R	lduh	[%r23 + %r0], %r30
	.word 0xf094211f  ! 1709: LDUHA_I	lduha	[%r16, + 0x011f] %asi, %r24
	.word 0xfe542104  ! 1711: LDSH_I	ldsh	[%r16 + 0x0104], %r31
	.word 0xf0cce1f9  ! 1717: LDSBA_I	ldsba	[%r19, + 0x01f9] %asi, %r24
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_136:
	setx	0x2b0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594a01b  ! 1721: WRPR_TSTATE_I	wrpr	%r18, 0x001b, %tstate
	ta	T_CHANGE_TO_TL0
	.word 0xf80dc000  ! 1724: LDUB_R	ldub	[%r23 + %r0], %r28
cpu_intr_2_137:
	setx	0x290225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68c20b8  ! 1732: LDUBA_I	lduba	[%r16, + 0x00b8] %asi, %r27
	.word 0xb2acc000  ! 1733: ANDNcc_R	andncc 	%r19, %r0, %r25
	.word 0xfa4da072  ! 1735: LDSB_I	ldsb	[%r22 + 0x0072], %r29
	.word 0xf6840020  ! 1740: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
	.word 0xbec5214c  ! 1742: ADDCcc_I	addccc 	%r20, 0x014c, %r31
	.word 0xf2d4e0fc  ! 1743: LDSHA_I	ldsha	[%r19, + 0x00fc] %asi, %r25
cpu_intr_2_138:
	setx	0x2b0301, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_75:
	mov	0x23, %r14
	.word 0xf4db89e0  ! 1746: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_rd_76:
	mov	0x1b, %r14
	.word 0xfedb8400  ! 1748: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfacc0020  ! 1750: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf48cc020  ! 1757: LDUBA_R	lduba	[%r19, %r0] 0x01, %r26
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_wr_80:
	mov	0x8, %r14
	.word 0xf2f38400  ! 1759: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_wr_81:
	mov	0x20, %r14
	.word 0xf2f38e80  ! 1762: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 5)
	.word 0xbc34a071  ! 1765: ORN_I	orn 	%r18, 0x0071, %r30
	.word 0xf85ca064  ! 1766: LDX_I	ldx	[%r18 + 0x0064], %r28
	.word 0xf0040000  ! 1768: LDUW_R	lduw	[%r16 + %r0], %r24
	.word 0xf2944020  ! 1769: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
T2_asi_reg_wr_82:
	mov	0x18, %r14
	.word 0xf6f38e80  ! 1770: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf8d52180  ! 1771: LDSHA_I	ldsha	[%r20, + 0x0180] %asi, %r28
	.word 0x91946098  ! 1773: WRPR_PIL_I	wrpr	%r17, 0x0098, %pil
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_rd_77:
	mov	0x1a, %r14
	.word 0xf0db84a0  ! 1777: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_139:
	setx	0x2a0124, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_78:
	mov	0x23, %r14
	.word 0xf6db8400  ! 1783: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfecc2145  ! 1784: LDSBA_I	ldsba	[%r16, + 0x0145] %asi, %r31
	ta	T_CHANGE_HPRIV
	.word 0xf6846129  ! 1788: LDUWA_I	lduwa	[%r17, + 0x0129] %asi, %r27
T2_asi_reg_rd_79:
	mov	0x0, %r14
	.word 0xf0db8e40  ! 1790: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_140:
	setx	0x2b0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02d219f  ! 1792: ANDN_I	andn 	%r20, 0x019f, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xfc058000  ! 1795: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xf05c0000  ! 1797: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xfe5d8000  ! 1799: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xfadc6033  ! 1801: LDXA_I	ldxa	[%r17, + 0x0033] %asi, %r29
	.word 0xfe0dc000  ! 1802: LDUB_R	ldub	[%r23 + %r0], %r31
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_141:
	setx	0x2a0025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_142:
	setx	0x2a0002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 28)
	.word 0xf6458000  ! 1815: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xf08c0020  ! 1816: LDUBA_R	lduba	[%r16, %r0] 0x01, %r24
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_80:
	mov	0x8, %r14
	.word 0xf2db8e60  ! 1820: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb7357001  ! 1822: SRLX_I	srlx	%r21, 0x0001, %r27
	.word 0xb32d9000  ! 1823: SLLX_R	sllx	%r22, %r0, %r25
	.word 0xf04ca0c1  ! 1825: LDSB_I	ldsb	[%r18 + 0x00c1], %r24
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_143:
	setx	0x2b0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_83:
	mov	0x30, %r14
	.word 0xf8f389e0  ! 1832: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_144:
	setx	0x2c000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf254e0be  ! 1838: LDSH_I	ldsh	[%r19 + 0x00be], %r25
T2_asi_reg_rd_81:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 1839: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf6840020  ! 1840: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
	.word 0xfcd58020  ! 1843: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xfacc4020  ! 1848: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r29
	.word 0xf84d0000  ! 1849: LDSB_R	ldsb	[%r20 + %r0], %r28
cpu_intr_2_145:
	setx	0x2c030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_84:
	mov	0x1e, %r14
	.word 0xf8f38e40  ! 1852: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 16)
	.word 0xfa440000  ! 1861: LDSW_R	ldsw	[%r16 + %r0], %r29
T2_asi_reg_rd_82:
	mov	0x2e, %r14
	.word 0xf2db8e40  ! 1862: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfe040000  ! 1863: LDUW_R	lduw	[%r16 + %r0], %r31
T2_asi_reg_rd_83:
	mov	0x24, %r14
	.word 0xfedb8e60  ! 1865: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf2ccc020  ! 1867: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r25
cpu_intr_2_146:
	setx	0x2e0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb34b001  ! 1870: SRLX_I	srlx	%r18, 0x0001, %r29
cpu_intr_2_147:
	setx	0x2e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20461ac  ! 1873: LDUW_I	lduw	[%r17 + 0x01ac], %r25
	.word 0xfa04e0d4  ! 1874: LDUW_I	lduw	[%r19 + 0x00d4], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba04c000  ! 1877: ADD_R	add 	%r19, %r0, %r29
	.word 0xfe15a1e4  ! 1878: LDUH_I	lduh	[%r22 + 0x01e4], %r31
	.word 0xf85d4000  ! 1879: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xf2c5202f  ! 1880: LDSWA_I	ldswa	[%r20, + 0x002f] %asi, %r25
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfe15c000  ! 1884: LDUH_R	lduh	[%r23 + %r0], %r31
	.word 0xf6554000  ! 1885: LDSH_R	ldsh	[%r21 + %r0], %r27
cpu_intr_2_148:
	setx	0x2c031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a5e10e  ! 1890: SUBcc_I	subcc 	%r23, 0x010e, %r26
cpu_intr_2_149:
	setx	0x2f033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_85:
	mov	0x18, %r14
	.word 0xfaf38400  ! 1892: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf245c000  ! 1894: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xb0bda019  ! 1895: XNORcc_I	xnorcc 	%r22, 0x0019, %r24
cpu_intr_2_150:
	setx	0x2e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_151:
	setx	0x2e033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, e)
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 14)
	.word 0xf4dc60e7  ! 1905: LDXA_I	ldxa	[%r17, + 0x00e7] %asi, %r26
	.word 0xfe04c000  ! 1906: LDUW_R	lduw	[%r19 + %r0], %r31
	ta	T_CHANGE_TO_TL1
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 1a)
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_wr_86:
	mov	0x3c3, %r14
	.word 0xf6f38e80  ! 1916: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfe05e1f7  ! 1917: LDUW_I	lduw	[%r23 + 0x01f7], %r31
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_87:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 1919: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_152:
	setx	0x2e0222, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_88:
	mov	0x32, %r14
	.word 0xf0f38e40  ! 1921: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfe054000  ! 1922: LDUW_R	lduw	[%r21 + %r0], %r31
	.word 0xf885a0b0  ! 1923: LDUWA_I	lduwa	[%r22, + 0x00b0] %asi, %r28
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 30)
	.word 0xf644a178  ! 1925: LDSW_I	ldsw	[%r18 + 0x0178], %r27
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983d00  ! 1926: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d00, %hpstate
	.word 0xf6d5e116  ! 1927: LDSHA_I	ldsha	[%r23, + 0x0116] %asi, %r27
cpu_intr_2_153:
	setx	0x2c0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf894618e  ! 1929: LDUHA_I	lduha	[%r17, + 0x018e] %asi, %r28
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_89:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 1937: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_rd_84:
	mov	0x3c2, %r14
	.word 0xfedb84a0  ! 1938: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_rd_85:
	mov	0x29, %r14
	.word 0xf2db8e40  ! 1941: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfc05a04c  ! 1942: LDUW_I	lduw	[%r22 + 0x004c], %r30
	.word 0xf25d61a2  ! 1944: LDX_I	ldx	[%r21 + 0x01a2], %r25
	.word 0xf4856136  ! 1945: LDUWA_I	lduwa	[%r21, + 0x0136] %asi, %r26
	.word 0x8f902000  ! 1949: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xf615a1e9  ! 1950: LDUH_I	lduh	[%r22 + 0x01e9], %r27
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_154:
	setx	0x2c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_90:
	mov	0x10, %r14
	.word 0xfcf38e80  ! 1957: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb3520000  ! 1958: RDPR_PIL	rdpr	%pil, %r25
cpu_intr_2_155:
	setx	0x2d0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 1963: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
cpu_intr_2_156:
	setx	0x2f0002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_157:
	setx	0x2c030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29c6082  ! 1968: XORcc_I	xorcc 	%r17, 0x0082, %r25
	.word 0xfecc6147  ! 1970: LDSBA_I	ldsba	[%r17, + 0x0147] %asi, %r31
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_158:
	setx	0x2f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb214e1ce  ! 1976: OR_I	or 	%r19, 0x01ce, %r25
cpu_intr_2_159:
	setx	0x2d000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb935d000  ! 1978: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xf6450000  ! 1983: LDSW_R	ldsw	[%r20 + %r0], %r27
T2_asi_reg_rd_86:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 1984: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_160:
	setx	0x2f0010, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_87:
	mov	0x3c5, %r14
	.word 0xf6db89e0  ! 1992: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_161:
	setx	0x2e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bd6141  ! 1998: XNORcc_I	xnorcc 	%r21, 0x0141, %r27
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_162:
	setx	0x2f001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982890  ! 2008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0890, %hpstate
cpu_intr_2_163:
	setx	0x2f0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf45dc000  ! 2017: LDX_R	ldx	[%r23 + %r0], %r26
T2_asi_reg_wr_91:
	mov	0x36, %r14
	.word 0xfcf38e40  ! 2018: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_88:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 2020: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1504000  ! 2022: RDPR_TNPC	<illegal instruction>
cpu_intr_2_164:
	setx	0x2c010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_89:
	mov	0x35, %r14
	.word 0xf6db8e40  ! 2025: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_90:
	mov	0x3, %r14
	.word 0xf4db84a0  ! 2027: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf6d44020  ! 2028: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r27
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 21)
	.word 0x8f902001  ! 2033: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xfa950020  ! 2035: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_rd_91:
	mov	0x4, %r14
	.word 0xf4db8e80  ! 2044: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfedc61fa  ! 2046: LDXA_I	ldxa	[%r17, + 0x01fa] %asi, %r31
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 33)
	.word 0xfac58020  ! 2048: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r29
	.word 0xf8450000  ! 2050: LDSW_R	ldsw	[%r20 + %r0], %r28
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_165:
	setx	0x2d0208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 8)
	.word 0xfa8d0020  ! 2059: LDUBA_R	lduba	[%r20, %r0] 0x01, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xf4dde159  ! 2062: LDXA_I	ldxa	[%r23, + 0x0159] %asi, %r26
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_166:
	setx	0x2d0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4852022  ! 2066: LDUWA_I	lduwa	[%r20, + 0x0022] %asi, %r26
	.word 0xf64d6127  ! 2067: LDSB_I	ldsb	[%r21 + 0x0127], %r27
	.word 0xfc854020  ! 2071: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r30
T2_asi_reg_rd_92:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 2072: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_167:
	setx	0x2d0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_168:
	setx	0x2c0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cd0020  ! 2076: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r24
	.word 0xf6cc4020  ! 2077: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r27
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_169:
	setx	0x2d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_170:
	setx	0x2e0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08dc020  ! 2092: LDUBA_R	lduba	[%r23, %r0] 0x01, %r24
	.word 0xb2352091  ! 2094: ORN_I	orn 	%r20, 0x0091, %r25
	.word 0xf695202d  ! 2096: LDUHA_I	lduha	[%r20, + 0x002d] %asi, %r27
	.word 0xf8c54020  ! 2100: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
	.word 0xb4c4e033  ! 2101: ADDCcc_I	addccc 	%r19, 0x0033, %r26
	.word 0xfa0d60ee  ! 2102: LDUB_I	ldub	[%r21 + 0x00ee], %r29
	.word 0xf6140000  ! 2103: LDUH_R	lduh	[%r16 + %r0], %r27
T2_asi_reg_rd_93:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, f)
	.word 0xba1c0000  ! 2108: XOR_R	xor 	%r16, %r0, %r29
	.word 0xfc8ca0f9  ! 2112: LDUBA_I	lduba	[%r18, + 0x00f9] %asi, %r30
	.word 0xf2544000  ! 2114: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xb4b5c000  ! 2116: SUBCcc_R	orncc 	%r23, %r0, %r26
	.word 0xfcd521a0  ! 2117: LDSHA_I	ldsha	[%r20, + 0x01a0] %asi, %r30
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf2144000  ! 2124: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xf4d5c020  ! 2127: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	.word 0xfe04c000  ! 2130: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xfa054000  ! 2137: LDUW_R	lduw	[%r21 + %r0], %r29
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_171:
	setx	0x2c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_92:
	mov	0xf, %r14
	.word 0xfcf38400  ! 2145: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xba24c000  ! 2147: SUB_R	sub 	%r19, %r0, %r29
	.word 0xf20c8000  ! 2149: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xf8c4202a  ! 2150: LDSWA_I	ldswa	[%r16, + 0x002a] %asi, %r28
	.word 0xbb355000  ! 2151: SRLX_R	srlx	%r21, %r0, %r29
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_172:
	setx	0x2f0029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_173:
	setx	0x2c0033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 12)
	.word 0xfe040000  ! 2164: LDUW_R	lduw	[%r16 + %r0], %r31
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf0056140  ! 2168: LDUW_I	lduw	[%r21 + 0x0140], %r24
T2_asi_reg_rd_94:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 2170: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9480000  ! 2171: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
T2_asi_reg_wr_93:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 2172: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_174:
	setx	0x2e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_175:
	setx	0x2d010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_176:
	setx	0x2e022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_177:
	setx	0x2f0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfe842174  ! 2186: LDUWA_I	lduwa	[%r16, + 0x0174] %asi, %r31
cpu_intr_2_178:
	setx	0x2f0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc84612d  ! 2188: LDUWA_I	lduwa	[%r17, + 0x012d] %asi, %r30
cpu_intr_2_179:
	setx	0x2c0017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_180:
	setx	0x2c0221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_181:
	setx	0x2f0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc94208d  ! 2204: LDUHA_I	lduha	[%r16, + 0x008d] %asi, %r30
T2_asi_reg_rd_95:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 2205: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf4956039  ! 2206: LDUHA_I	lduha	[%r21, + 0x0039] %asi, %r26
	.word 0xfad5a080  ! 2208: LDSHA_I	ldsha	[%r22, + 0x0080] %asi, %r29
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 22)
	.word 0xf20dc000  ! 2211: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xba044000  ! 2215: ADD_R	add 	%r17, %r0, %r29
	.word 0xfecc8020  ! 2216: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r31
	.word 0xbc352030  ! 2219: SUBC_I	orn 	%r20, 0x0030, %r30
T2_asi_reg_rd_96:
	mov	0x34, %r14
	.word 0xf8db8e40  ! 2222: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0x8f902002  ! 2226: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
T2_asi_reg_rd_97:
	mov	0x3c8, %r14
	.word 0xfcdb84a0  ! 2227: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf695c020  ! 2228: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_94:
	mov	0x10, %r14
	.word 0xf0f389e0  ! 2234: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb6ad8000  ! 2235: ANDNcc_R	andncc 	%r22, %r0, %r27
T2_asi_reg_rd_98:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 2236: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_182:
	setx	0x2e0029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_95:
	mov	0x33, %r14
	.word 0xfcf38e40  ! 2244: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_99:
	mov	0xc, %r14
	.word 0xf4db8e80  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf6c48020  ! 2248: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r27
	.word 0xfc4c0000  ! 2250: LDSB_R	ldsb	[%r16 + %r0], %r30
	.word 0xf85c20fd  ! 2251: LDX_I	ldx	[%r16 + 0x00fd], %r28
cpu_intr_2_183:
	setx	0x2f000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_184:
	setx	0x2d022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08ce1d5  ! 2261: LDUBA_I	lduba	[%r19, + 0x01d5] %asi, %r24
	.word 0xf094c020  ! 2263: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
T2_asi_reg_wr_96:
	mov	0x3c2, %r14
	.word 0xf6f38e80  ! 2264: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfa0dc000  ! 2269: LDUB_R	ldub	[%r23 + %r0], %r29
	.word 0xfecc6071  ! 2270: LDSBA_I	ldsba	[%r17, + 0x0071] %asi, %r31
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 2e)
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982a0a  ! 2275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0a, %hpstate
	.word 0xb32cf001  ! 2278: SLLX_I	sllx	%r19, 0x0001, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xf0cca0b1  ! 2281: LDSBA_I	ldsba	[%r18, + 0x00b1] %asi, %r24
	.word 0xfe056109  ! 2282: LDUW_I	lduw	[%r21 + 0x0109], %r31
cpu_intr_2_185:
	setx	0x2d000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d52049  ! 2290: LDSHA_I	ldsha	[%r20, + 0x0049] %asi, %r24
T2_asi_reg_wr_97:
	mov	0x3c1, %r14
	.word 0xfcf38e60  ! 2292: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf48cc020  ! 2293: LDUBA_R	lduba	[%r19, %r0] 0x01, %r26
	.word 0xfc44c000  ! 2295: LDSW_R	ldsw	[%r19 + %r0], %r30
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f9a  ! 2296: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9a, %hpstate
T2_asi_reg_wr_98:
	mov	0x1c, %r14
	.word 0xf4f38e40  ! 2297: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfa84e155  ! 2301: LDUWA_I	lduwa	[%r19, + 0x0155] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_100:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe0c8000  ! 2305: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xf08da126  ! 2308: LDUBA_I	lduba	[%r22, + 0x0126] %asi, %r24
T2_asi_reg_wr_99:
	mov	0x17, %r14
	.word 0xf4f38e40  ! 2309: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf20c0000  ! 2310: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xb00c8000  ! 2311: AND_R	and 	%r18, %r0, %r24
	.word 0xf44c0000  ! 2312: LDSB_R	ldsb	[%r16 + %r0], %r26
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_rd_101:
	mov	0x1, %r14
	.word 0xf0db8e60  ! 2314: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xfe8c618a  ! 2318: LDUBA_I	lduba	[%r17, + 0x018a] %asi, %r31
	.word 0xf615a1e5  ! 2321: LDUH_I	lduh	[%r22 + 0x01e5], %r27
cpu_intr_2_186:
	setx	0x32022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_102:
	mov	0x13, %r14
	.word 0xfedb8e40  ! 2323: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_187:
	setx	0x310125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_188:
	setx	0x300007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe14e175  ! 2327: LDUH_I	lduh	[%r19 + 0x0175], %r31
T2_asi_reg_rd_103:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 2332: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf4550000  ! 2333: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xfc5cc000  ! 2334: LDX_R	ldx	[%r19 + %r0], %r30
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 4)
	.word 0xf80c8000  ! 2337: LDUB_R	ldub	[%r18 + %r0], %r28
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_wr_100:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 2342: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_189:
	setx	0x330214, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_101:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 2344: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf2cce06a  ! 2352: LDSBA_I	ldsba	[%r19, + 0x006a] %asi, %r25
	.word 0xbd2dc000  ! 2354: SLL_R	sll 	%r23, %r0, %r30
	.word 0xfa0d21eb  ! 2356: LDUB_I	ldub	[%r20 + 0x01eb], %r29
	.word 0xb8342046  ! 2357: SUBC_I	orn 	%r16, 0x0046, %r28
	ta	T_CHANGE_TO_TL1
cpu_intr_2_190:
	setx	0x310322, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_104:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 2365: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf0c5e1d4  ! 2367: LDSWA_I	ldswa	[%r23, + 0x01d4] %asi, %r24
	.word 0xb72dc000  ! 2368: SLL_R	sll 	%r23, %r0, %r27
	.word 0xf494e179  ! 2370: LDUHA_I	lduha	[%r19, + 0x0179] %asi, %r26
	.word 0xf0042091  ! 2371: LDUW_I	lduw	[%r16 + 0x0091], %r24
cpu_intr_2_191:
	setx	0x32022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_105:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 2377: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_106:
	mov	0x35, %r14
	.word 0xfedb8e40  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_107:
	mov	0x1, %r14
	.word 0xfcdb8e40  ! 2387: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf05d4000  ! 2388: LDX_R	ldx	[%r21 + %r0], %r24
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_108:
	mov	0x2d, %r14
	.word 0xf8db8e80  ! 2394: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf24d20c3  ! 2395: LDSB_I	ldsb	[%r20 + 0x00c3], %r25
T2_asi_reg_rd_109:
	mov	0x16, %r14
	.word 0xf2db84a0  ! 2396: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb17d2401  ! 2397: MOVR_I	movre	%r20, 0x1, %r24
	.word 0xf6d4c020  ! 2398: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r27
	.word 0xfccd0020  ! 2399: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r30
cpu_intr_2_192:
	setx	0x320214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b560b0  ! 2403: ORNcc_I	orncc 	%r21, 0x00b0, %r28
	.word 0xf4844020  ! 2404: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r26
cpu_intr_2_193:
	setx	0x330301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84c8000  ! 2408: LDSB_R	ldsb	[%r18 + %r0], %r28
T2_asi_reg_wr_102:
	mov	0x3c4, %r14
	.word 0xf8f384a0  ! 2411: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfccda0af  ! 2418: LDSBA_I	ldsba	[%r22, + 0x00af] %asi, %r30
	.word 0xfc4c2026  ! 2419: LDSB_I	ldsb	[%r16 + 0x0026], %r30
	.word 0xf894c020  ! 2420: LDUHA_R	lduha	[%r19, %r0] 0x01, %r28
	.word 0xf015a01e  ! 2421: LDUH_I	lduh	[%r22 + 0x001e], %r24
cpu_intr_2_194:
	setx	0x330307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3ce001  ! 2424: SRA_I	sra 	%r19, 0x0001, %r30
	ta	T_CHANGE_HPRIV
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfac50020  ! 2432: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r29
cpu_intr_2_195:
	setx	0x33000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_196:
	setx	0x33030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_197:
	setx	0x30021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfa5461fd  ! 2445: LDSH_I	ldsh	[%r17 + 0x01fd], %r29
T2_asi_reg_rd_110:
	mov	0x11, %r14
	.word 0xf4db8e40  ! 2449: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_198:
	setx	0x300219, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_103:
	mov	0x3c7, %r14
	.word 0xfaf38e80  ! 2455: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf0c40020  ! 2456: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r24
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_199:
	setx	0x32020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_104:
	mov	0x3c6, %r14
	.word 0xf0f38e60  ! 2463: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T2_asi_reg_rd_111:
	mov	0x21, %r14
	.word 0xf8db89e0  ! 2464: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb6b5a074  ! 2465: ORNcc_I	orncc 	%r22, 0x0074, %r27
T2_asi_reg_wr_105:
	mov	0x9, %r14
	.word 0xf6f38e40  ! 2468: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_200:
	setx	0x30010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf614c000  ! 2470: LDUH_R	lduh	[%r19 + %r0], %r27
cpu_intr_2_201:
	setx	0x310337, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_112:
	mov	0x5, %r14
	.word 0xfcdb84a0  ! 2481: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf644614e  ! 2482: LDSW_I	ldsw	[%r17 + 0x014e], %r27
	.word 0xb52d4000  ! 2487: SLL_R	sll 	%r21, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa954020  ! 2492: LDUHA_R	lduha	[%r21, %r0] 0x01, %r29
T2_asi_reg_wr_106:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 2494: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf0d5603b  ! 2497: LDSHA_I	ldsha	[%r21, + 0x003b] %asi, %r24
cpu_intr_2_202:
	setx	0x300136, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_203:
	setx	0x300105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd44020  ! 2509: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r30
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_113:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 17)
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982e50  ! 2526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e50, %hpstate
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_204:
	setx	0x310026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_205:
	setx	0x32021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 2a)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a8a  ! 2537: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8a, %hpstate
	.word 0xf2cc8020  ! 2538: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r25
	.word 0xf0cd0020  ! 2539: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r24
T2_asi_reg_wr_107:
	mov	0x6, %r14
	.word 0xf2f38e60  ! 2542: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_wr_108:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 2544: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf055a037  ! 2545: LDSH_I	ldsh	[%r22 + 0x0037], %r24
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819829ca  ! 2546: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ca, %hpstate
T2_asi_reg_rd_114:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 2547: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0xfc4d20c2  ! 2553: LDSB_I	ldsb	[%r20 + 0x00c2], %r30
cpu_intr_2_206:
	setx	0x320336, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xba8d21a1  ! 2556: ANDcc_I	andcc 	%r20, 0x01a1, %r29
	.word 0xb21d0000  ! 2560: XOR_R	xor 	%r20, %r0, %r25
	.word 0xf0858020  ! 2562: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
T2_asi_reg_rd_115:
	mov	0x25, %r14
	.word 0xf0db8e60  ! 2563: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 30)
	.word 0xb0bca1db  ! 2568: XNORcc_I	xnorcc 	%r18, 0x01db, %r24
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 26)
	.word 0xf8cc2156  ! 2572: LDSBA_I	ldsba	[%r16, + 0x0156] %asi, %r28
cpu_intr_2_207:
	setx	0x330116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_208:
	setx	0x30013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 33)
	.word 0xf295a133  ! 2582: LDUHA_I	lduha	[%r22, + 0x0133] %asi, %r25
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_209:
	setx	0x330024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4544000  ! 2587: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xfe048000  ! 2594: LDUW_R	lduw	[%r18 + %r0], %r31
cpu_intr_2_210:
	setx	0x30030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45da007  ! 2596: LDX_I	ldx	[%r22 + 0x0007], %r26
	.word 0xf85d219d  ! 2601: LDX_I	ldx	[%r20 + 0x019d], %r28
	.word 0xfe058000  ! 2603: LDUW_R	lduw	[%r22 + %r0], %r31
cpu_intr_2_211:
	setx	0x32023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 15)
	.word 0xfe84e171  ! 2608: LDUWA_I	lduwa	[%r19, + 0x0171] %asi, %r31
T2_asi_reg_wr_109:
	mov	0x20, %r14
	.word 0xfcf389e0  ! 2609: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_rd_116:
	mov	0x20, %r14
	.word 0xf0db8e80  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_212:
	setx	0x30023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_213:
	setx	0x300305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_214:
	setx	0x300302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92cb001  ! 2618: SLLX_I	sllx	%r18, 0x0001, %r28
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 33)
	.word 0xf05de0bb  ! 2625: LDX_I	ldx	[%r23 + 0x00bb], %r24
	.word 0xf05c21e4  ! 2627: LDX_I	ldx	[%r16 + 0x01e4], %r24
	.word 0xf2840020  ! 2628: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
	.word 0xf214a170  ! 2629: LDUH_I	lduh	[%r18 + 0x0170], %r25
cpu_intr_2_215:
	setx	0x320315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0846143  ! 2632: ADDcc_I	addcc 	%r17, 0x0143, %r24
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, b)
	.word 0xf885a1ee  ! 2637: LDUWA_I	lduwa	[%r22, + 0x01ee] %asi, %r28
	.word 0xb6b40000  ! 2638: ORNcc_R	orncc 	%r16, %r0, %r27
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_wr_110:
	mov	0x35, %r14
	.word 0xfaf38e60  ! 2640: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf60d0000  ! 2641: LDUB_R	ldub	[%r20 + %r0], %r27
	.word 0xfac50020  ! 2643: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r29
T2_asi_reg_rd_117:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 2644: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xba24e1fe  ! 2647: SUB_I	sub 	%r19, 0x01fe, %r29
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfacc4020  ! 2649: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r29
T2_asi_reg_rd_118:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, e)
	.word 0xf014e190  ! 2658: LDUH_I	lduh	[%r19 + 0x0190], %r24
cpu_intr_2_216:
	setx	0x320101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeace151  ! 2661: ANDNcc_I	andncc 	%r19, 0x0151, %r31
cpu_intr_2_217:
	setx	0x330322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 11)
	.word 0xf294c020  ! 2669: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
	.word 0xf24ca102  ! 2670: LDSB_I	ldsb	[%r18 + 0x0102], %r25
T2_asi_reg_wr_111:
	mov	0x15, %r14
	.word 0xf0f38e60  ! 2671: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfc850020  ! 2672: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r30
cpu_intr_2_218:
	setx	0x31021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_219:
	setx	0x310109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa55e1a2  ! 2678: LDSH_I	ldsh	[%r23 + 0x01a2], %r29
	.word 0xf0c40020  ! 2680: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r24
T2_asi_reg_rd_119:
	mov	0x2b, %r14
	.word 0xfcdb84a0  ! 2681: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf40c8000  ! 2682: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xba840000  ! 2684: ADDcc_R	addcc 	%r16, %r0, %r29
	.word 0xf0056106  ! 2687: LDUW_I	lduw	[%r21 + 0x0106], %r24
	.word 0xb624e19e  ! 2688: SUB_I	sub 	%r19, 0x019e, %r27
T2_asi_reg_rd_120:
	mov	0x1f, %r14
	.word 0xfedb8e40  ! 2690: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_rd_121:
	mov	0xf, %r14
	.word 0xf0db89e0  ! 2691: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_wr_112:
	mov	0x1d, %r14
	.word 0xf8f38e80  ! 2692: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfa8da167  ! 2693: LDUBA_I	lduba	[%r22, + 0x0167] %asi, %r29
	.word 0xfa144000  ! 2694: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xf655c000  ! 2695: LDSH_R	ldsh	[%r23 + %r0], %r27
	.word 0xf4858020  ! 2696: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r26
T2_asi_reg_rd_122:
	mov	0x5, %r14
	.word 0xf8db89e0  ! 2697: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf4cd4020  ! 2698: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r26
	.word 0xfe4d60d8  ! 2700: LDSB_I	ldsb	[%r21 + 0x00d8], %r31
	.word 0xf454e034  ! 2704: LDSH_I	ldsh	[%r19 + 0x0034], %r26
	.word 0xfecd0020  ! 2708: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
	.word 0xf6158000  ! 2710: LDUH_R	lduh	[%r22 + %r0], %r27
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 24)
	.word 0xfe5dc000  ! 2713: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xfa8cc020  ! 2716: LDUBA_R	lduba	[%r19, %r0] 0x01, %r29
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 8)
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982f88  ! 2721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f88, %hpstate
	.word 0xbe0ca05a  ! 2722: AND_I	and 	%r18, 0x005a, %r31
	.word 0xf004e1a7  ! 2726: LDUW_I	lduw	[%r19 + 0x01a7], %r24
	.word 0xf25ce1ee  ! 2727: LDX_I	ldx	[%r19 + 0x01ee], %r25
	.word 0xb5350000  ! 2729: SRL_R	srl 	%r20, %r0, %r26
	.word 0xfe856058  ! 2731: LDUWA_I	lduwa	[%r21, + 0x0058] %asi, %r31
cpu_intr_2_220:
	setx	0x33032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe044000  ! 2734: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xbb7ce401  ! 2736: MOVR_I	movre	%r19, 0x1, %r29
cpu_intr_2_221:
	setx	0x320121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa94a18c  ! 2738: LDUHA_I	lduha	[%r18, + 0x018c] %asi, %r29
T2_asi_reg_rd_123:
	mov	0x27, %r14
	.word 0xfadb8e80  ! 2740: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_222:
	setx	0x206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93c0000  ! 2743: SRA_R	sra 	%r16, %r0, %r28
	.word 0xf6d4a16b  ! 2745: LDSHA_I	ldsha	[%r18, + 0x016b] %asi, %r27
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 33)
	.word 0xb551c000  ! 2750: RDPR_TL	rdpr	%tl, %r26
	.word 0xfcdc20bc  ! 2753: LDXA_I	ldxa	[%r16, + 0x00bc] %asi, %r30
	.word 0xf4c5200d  ! 2755: LDSWA_I	ldswa	[%r20, + 0x000d] %asi, %r26
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_223:
	setx	0x310305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c44020  ! 2761: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r26
T2_asi_reg_wr_113:
	mov	0x17, %r14
	.word 0xf4f38e60  ! 2763: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb92cf001  ! 2765: SLLX_I	sllx	%r19, 0x0001, %r28
cpu_intr_2_224:
	setx	0x370213, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_124:
	mov	0x36, %r14
	.word 0xf0db8e40  ! 2767: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_TO_TL0
cpu_intr_2_225:
	setx	0x370035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf355000  ! 2776: SRLX_R	srlx	%r21, %r0, %r31
T2_asi_reg_rd_125:
	mov	0x27, %r14
	.word 0xf4db8e80  ! 2777: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_wr_114:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 2780: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfcd4e1d6  ! 2781: LDSHA_I	ldsha	[%r19, + 0x01d6] %asi, %r30
cpu_intr_2_226:
	setx	0x370332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 28)
	.word 0xf48521a9  ! 2785: LDUWA_I	lduwa	[%r20, + 0x01a9] %asi, %r26
cpu_intr_2_227:
	setx	0x37022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 36)
	.word 0xf6c5c020  ! 2790: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r27
T2_asi_reg_rd_126:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 2791: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_wr_115:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 2795: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_127:
	mov	0x25, %r14
	.word 0xfadb8e60  ! 2799: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf64c0000  ! 2800: LDSB_R	ldsb	[%r16 + %r0], %r27
cpu_intr_2_228:
	setx	0x340237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_229:
	setx	0x360039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc940020  ! 2806: LDUHA_R	lduha	[%r16, %r0] 0x01, %r30
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_230:
	setx	0x35002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_231:
	setx	0x340339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf4ccc020  ! 2819: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r26
	.word 0xfac4e140  ! 2820: LDSWA_I	ldswa	[%r19, + 0x0140] %asi, %r29
	.word 0xfacdc020  ! 2821: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r29
	.word 0xf2044000  ! 2824: LDUW_R	lduw	[%r17 + %r0], %r25
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf08cc020  ! 2827: LDUBA_R	lduba	[%r19, %r0] 0x01, %r24
T2_asi_reg_wr_116:
	mov	0x15, %r14
	.word 0xf0f38e40  ! 2829: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfe05a0d1  ! 2832: LDUW_I	lduw	[%r22 + 0x00d1], %r31
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 34)
	.word 0xf24d6144  ! 2837: LDSB_I	ldsb	[%r21 + 0x0144], %r25
	.word 0xf0154000  ! 2839: LDUH_R	lduh	[%r21 + %r0], %r24
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_wr_117:
	mov	0x1, %r14
	.word 0xf8f384a0  ! 2846: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb0c48000  ! 2849: ADDCcc_R	addccc 	%r18, %r0, %r24
cpu_intr_2_232:
	setx	0x360029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6158000  ! 2852: LDUH_R	lduh	[%r22 + %r0], %r27
	.word 0xf6940020  ! 2853: LDUHA_R	lduha	[%r16, %r0] 0x01, %r27
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, f)
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 16)
	.word 0xfc954020  ! 2856: LDUHA_R	lduha	[%r21, %r0] 0x01, %r30
	.word 0xf6050000  ! 2859: LDUW_R	lduw	[%r20 + %r0], %r27
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, a)
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982e52  ! 2861: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e52, %hpstate
T2_asi_reg_wr_118:
	mov	0x14, %r14
	.word 0xf2f38e60  ! 2863: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfa058000  ! 2868: LDUW_R	lduw	[%r22 + %r0], %r29
cpu_intr_2_233:
	setx	0x350139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84d8000  ! 2872: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xfa84e1f8  ! 2874: LDUWA_I	lduwa	[%r19, + 0x01f8] %asi, %r29
cpu_intr_2_234:
	setx	0x370128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22da0a9  ! 2877: ANDN_I	andn 	%r22, 0x00a9, %r25
cpu_intr_2_235:
	setx	0x36033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe058000  ! 2883: LDUW_R	lduw	[%r22 + %r0], %r31
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, e)
	.word 0xf8dc601c  ! 2885: LDXA_I	ldxa	[%r17, + 0x001c] %asi, %r28
	.word 0xf405a190  ! 2888: LDUW_I	lduw	[%r22 + 0x0190], %r26
	.word 0xb6bce17e  ! 2889: XNORcc_I	xnorcc 	%r19, 0x017e, %r27
	.word 0xf4554000  ! 2892: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xfa040000  ! 2893: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xf05cc000  ! 2896: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xf2840020  ! 2898: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
cpu_intr_2_236:
	setx	0x350318, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_119:
	mov	0x34, %r14
	.word 0xfef38e40  ! 2900: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfc148000  ! 2901: LDUH_R	lduh	[%r18 + %r0], %r30
	.word 0xf2156117  ! 2902: LDUH_I	lduh	[%r21 + 0x0117], %r25
cpu_intr_2_237:
	setx	0x360230, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_120:
	mov	0x1c, %r14
	.word 0xf0f38e40  ! 2911: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf8cc8020  ! 2912: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
	.word 0xfa84c020  ! 2914: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r29
cpu_intr_2_238:
	setx	0x340019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88dc020  ! 2916: LDUBA_R	lduba	[%r23, %r0] 0x01, %r28
	.word 0xf4dc603a  ! 2917: LDXA_I	ldxa	[%r17, + 0x003a] %asi, %r26
T2_asi_reg_wr_121:
	mov	0x37, %r14
	.word 0xf6f389e0  ! 2918: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf4cd4020  ! 2920: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r26
	.word 0xf605c000  ! 2921: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xf495e079  ! 2922: LDUHA_I	lduha	[%r23, + 0x0079] %asi, %r26
T2_asi_reg_wr_122:
	mov	0x3c5, %r14
	.word 0xf2f38400  ! 2925: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_wr_123:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 2929: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbd518000  ! 2931: RDPR_PSTATE	<illegal instruction>
T2_asi_reg_wr_124:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 2934: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf6c40020  ! 2936: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r27
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 33)
	.word 0xfacd8020  ! 2938: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
	.word 0xfccd4020  ! 2940: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r30
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_239:
	setx	0x350312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_240:
	setx	0x350015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00d8000  ! 2948: LDUB_R	ldub	[%r22 + %r0], %r24
T2_asi_reg_wr_125:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 2950: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 25)
	.word 0xf2554000  ! 2953: LDSH_R	ldsh	[%r21 + %r0], %r25
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 23)
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982912  ! 2958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0912, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xf8cde029  ! 2961: LDSBA_I	ldsba	[%r23, + 0x0029] %asi, %r28
T2_asi_reg_rd_128:
	mov	0x2c, %r14
	.word 0xfcdb8e80  ! 2964: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb684a1c9  ! 2965: ADDcc_I	addcc 	%r18, 0x01c9, %r27
	.word 0xf28c0020  ! 2966: LDUBA_R	lduba	[%r16, %r0] 0x01, %r25
	.word 0xfc0561a6  ! 2970: LDUW_I	lduw	[%r21 + 0x01a6], %r30
T2_asi_reg_rd_129:
	mov	0x1a, %r14
	.word 0xf6db8e80  ! 2972: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_241:
	setx	0x370138, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_126:
	mov	0x2f, %r14
	.word 0xf0f38400  ! 2974: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_wr_127:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 2979: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf80c61f3  ! 2982: LDUB_I	ldub	[%r17 + 0x01f3], %r28
	.word 0xbe340000  ! 2986: ORN_R	orn 	%r16, %r0, %r31
T2_asi_reg_rd_130:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 2992: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf6cc21e9  ! 2993: LDSBA_I	ldsba	[%r16, + 0x01e9] %asi, %r27
cpu_intr_2_242:
	setx	0x37003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc150000  ! 2997: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xf0cd4020  ! 3000: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
	.word 0xf64421ce  ! 3002: LDSW_I	ldsw	[%r16 + 0x01ce], %r27
	.word 0xfa95a108  ! 3005: LDUHA_I	lduha	[%r22, + 0x0108] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xb41c8000  ! 3015: XOR_R	xor 	%r18, %r0, %r26
	.word 0xfacc8020  ! 3017: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r29
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 1f)
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f88  ! 3020: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f88, %hpstate
cpu_intr_2_243:
	setx	0x370202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c6191  ! 3026: LDX_I	ldx	[%r17 + 0x0191], %r29
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_131:
	mov	0x33, %r14
	.word 0xf4db84a0  ! 3028: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_244:
	setx	0x34001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48521af  ! 3033: LDUWA_I	lduwa	[%r20, + 0x01af] %asi, %r26
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983ed8  ! 3034: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed8, %hpstate
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983882  ! 3037: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1882, %hpstate
	.word 0xf65c2174  ! 3039: LDX_I	ldx	[%r16 + 0x0174], %r27
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 29)
	.word 0xf28d6098  ! 3047: LDUBA_I	lduba	[%r21, + 0x0098] %asi, %r25
cpu_intr_2_245:
	setx	0x37012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa45c000  ! 3051: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xf0d40020  ! 3054: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
	.word 0xf245a0f9  ! 3055: LDSW_I	ldsw	[%r22 + 0x00f9], %r25
	.word 0xb43d0000  ! 3056: XNOR_R	xnor 	%r20, %r0, %r26
	.word 0xfec5c020  ! 3057: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r31
	.word 0xba2ca132  ! 3058: ANDN_I	andn 	%r18, 0x0132, %r29
cpu_intr_2_246:
	setx	0x340116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_wr_128:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 3063: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 3)
	.word 0xb9518000  ! 3066: RDPR_PSTATE	<illegal instruction>
	.word 0xf2d44020  ! 3067: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r25
T2_asi_reg_wr_129:
	mov	0x1b, %r14
	.word 0xf2f389e0  ! 3068: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_247:
	setx	0x34000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 3e)
	.word 0xbc144000  ! 3074: OR_R	or 	%r17, %r0, %r30
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_248:
	setx	0x35023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa1460e7  ! 3081: LDUH_I	lduh	[%r17 + 0x00e7], %r29
cpu_intr_2_249:
	setx	0x35032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94e028  ! 3084: WRPR_PSTATE_I	wrpr	%r19, 0x0028, %pstate
	.word 0xf8cde0ac  ! 3085: LDSBA_I	ldsba	[%r23, + 0x00ac] %asi, %r28
cpu_intr_2_250:
	setx	0x35001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf894a0ae  ! 3088: LDUHA_I	lduha	[%r18, + 0x00ae] %asi, %r28
cpu_intr_2_251:
	setx	0x360333, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_132:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 3093: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_133:
	mov	0x3c5, %r14
	.word 0xf0db8e60  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_252:
	setx	0x350000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec48020  ! 3105: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
	.word 0xb5358000  ! 3106: SRL_R	srl 	%r22, %r0, %r26
	.word 0xfc140000  ! 3108: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xfc44a1f8  ! 3111: LDSW_I	ldsw	[%r18 + 0x01f8], %r30
	.word 0xfcc4c020  ! 3112: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r30
	.word 0xfe4cc000  ! 3113: LDSB_R	ldsb	[%r19 + %r0], %r31
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 3f)
	ta	T_CHANGE_HPRIV
	.word 0xb12d9000  ! 3122: SLLX_R	sllx	%r22, %r0, %r24
cpu_intr_2_253:
	setx	0x36033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_134:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 3124: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_130:
	mov	0x8, %r14
	.word 0xfaf38e80  ! 3126: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 6)
	.word 0xfe440000  ! 3130: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xf084604f  ! 3131: LDUWA_I	lduwa	[%r17, + 0x004f] %asi, %r24
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_131:
	mov	0x9, %r14
	.word 0xf6f38e40  ! 3134: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_132:
	mov	0x33, %r14
	.word 0xfef38e60  ! 3136: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbd520000  ! 3137: RDPR_PIL	<illegal instruction>
	.word 0xf04c4000  ! 3139: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xb8344000  ! 3143: ORN_R	orn 	%r17, %r0, %r28
	.word 0xfecda16c  ! 3146: LDSBA_I	ldsba	[%r22, + 0x016c] %asi, %r31
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 32)
	.word 0xfe5c0000  ! 3150: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xf84de0bd  ! 3151: LDSB_I	ldsb	[%r23 + 0x00bd], %r28
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, d)
	.word 0xf45ca1d1  ! 3155: LDX_I	ldx	[%r18 + 0x01d1], %r26
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 24)
	ta	T_CHANGE_HPRIV
	.word 0xbf355000  ! 3167: SRLX_R	srlx	%r21, %r0, %r31
T2_asi_reg_wr_133:
	mov	0xd, %r14
	.word 0xfaf38400  ! 3168: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf24d8000  ! 3169: LDSB_R	ldsb	[%r22 + %r0], %r25
T2_asi_reg_rd_135:
	mov	0xa, %r14
	.word 0xfadb8e80  ! 3170: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_rd_136:
	mov	0x24, %r14
	.word 0xf2db8400  ! 3171: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbeac4000  ! 3173: ANDNcc_R	andncc 	%r17, %r0, %r31
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 3d)
	ta	T_CHANGE_TO_TL1
	.word 0xf2548000  ! 3177: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xfa5de073  ! 3181: LDX_I	ldx	[%r23 + 0x0073], %r29
	.word 0xb7340000  ! 3185: SRL_R	srl 	%r16, %r0, %r27
	.word 0xb9359000  ! 3192: SRLX_R	srlx	%r22, %r0, %r28
	.word 0xfc0d20e8  ! 3194: LDUB_I	ldub	[%r20 + 0x00e8], %r30
cpu_intr_2_254:
	setx	0x36002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_137:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 3196: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf415e16d  ! 3197: LDUH_I	lduh	[%r23 + 0x016d], %r26
	.word 0xf455a0a4  ! 3199: LDSH_I	ldsh	[%r22 + 0x00a4], %r26
cpu_intr_2_255:
	setx	0x340225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 36)
	.word 0xf4c40020  ! 3208: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r26
	.word 0xfa45c000  ! 3209: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xf45561a2  ! 3210: LDSH_I	ldsh	[%r21 + 0x01a2], %r26
	.word 0xfa056175  ! 3211: LDUW_I	lduw	[%r21 + 0x0175], %r29
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_134:
	mov	0xf, %r14
	.word 0xf4f38400  ! 3216: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfa044000  ! 3222: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xf64d8000  ! 3223: LDSB_R	ldsb	[%r22 + %r0], %r27
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 37)
	.word 0xb804a10e  ! 3230: ADD_I	add 	%r18, 0x010e, %r28
cpu_intr_2_256:
	setx	0x3a012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_257:
	setx	0x3a020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d61c0  ! 3235: LDUB_I	ldub	[%r21 + 0x01c0], %r31
	.word 0xf2848020  ! 3236: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
	.word 0xb22420c8  ! 3238: SUB_I	sub 	%r16, 0x00c8, %r25
T2_asi_reg_rd_138:
	mov	0x3c4, %r14
	.word 0xf0db8400  ! 3244: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_wr_135:
	mov	0x32, %r14
	.word 0xf2f38e40  ! 3249: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_258:
	setx	0x3a0239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_259:
	setx	0x3b0122, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_136:
	mov	0x14, %r14
	.word 0xf0f38e80  ! 3257: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb5347001  ! 3258: SRLX_I	srlx	%r17, 0x0001, %r26
T2_asi_reg_wr_137:
	mov	0x3c2, %r14
	.word 0xf4f38400  ! 3259: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_rd_139:
	mov	0x1, %r14
	.word 0xfadb8e40  ! 3260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xfc4dc000  ! 3262: LDSB_R	ldsb	[%r23 + %r0], %r30
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983c8a  ! 3266: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c8a, %hpstate
	.word 0xfcc42133  ! 3267: LDSWA_I	ldswa	[%r16, + 0x0133] %asi, %r30
	.word 0xf28d2045  ! 3269: LDUBA_I	lduba	[%r20, + 0x0045] %asi, %r25
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_260:
	setx	0x3b031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_rd_140:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 3275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe4dc000  ! 3276: LDSB_R	ldsb	[%r23 + %r0], %r31
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_wr_138:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 3279: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c9a  ! 3281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c9a, %hpstate
	.word 0xfc846177  ! 3283: LDUWA_I	lduwa	[%r17, + 0x0177] %asi, %r30
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf8d561a7  ! 3285: LDSHA_I	ldsha	[%r21, + 0x01a7] %asi, %r28
	.word 0xf0148000  ! 3289: LDUH_R	lduh	[%r18 + %r0], %r24
cpu_intr_2_261:
	setx	0x3a0213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_262:
	setx	0x3a0019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_263:
	setx	0x380012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b5a097  ! 3295: SUBCcc_I	orncc 	%r22, 0x0097, %r27
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf605600c  ! 3300: LDUW_I	lduw	[%r21 + 0x000c], %r27
	.word 0xfe0de173  ! 3301: LDUB_I	ldub	[%r23 + 0x0173], %r31
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 9)
	.word 0xf45d0000  ! 3305: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0xf2cd8020  ! 3309: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_wr_139:
	mov	0x3c7, %r14
	.word 0xf2f384a0  ! 3311: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfc854020  ! 3312: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r30
T2_asi_reg_rd_141:
	mov	0x26, %r14
	.word 0xfadb89e0  ! 3314: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_264:
	setx	0x3b010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 28)
	.word 0xf40c0000  ! 3321: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xfe94c020  ! 3323: LDUHA_R	lduha	[%r19, %r0] 0x01, %r31
cpu_intr_2_265:
	setx	0x3b0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf045c000  ! 3328: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xf01560b6  ! 3330: LDUH_I	lduh	[%r21 + 0x00b6], %r24
	.word 0xf4cd0020  ! 3333: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r26
T2_asi_reg_rd_142:
	mov	0x30, %r14
	.word 0xf2db8e80  ! 3334: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 36)
	.word 0xfe94a188  ! 3338: LDUHA_I	lduha	[%r18, + 0x0188] %asi, %r31
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 8)
	.word 0xf04d0000  ! 3340: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xfa540000  ! 3344: LDSH_R	ldsh	[%r16 + %r0], %r29
T2_asi_reg_rd_143:
	mov	0x21, %r14
	.word 0xfcdb8e60  ! 3346: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb5641800  ! 3347: MOVcc_R	<illegal instruction>
	.word 0xbeb58000  ! 3348: SUBCcc_R	orncc 	%r22, %r0, %r31
	.word 0xfc5c0000  ! 3351: LDX_R	ldx	[%r16 + %r0], %r30
cpu_intr_2_266:
	setx	0x3b031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9340000  ! 3353: SRL_R	srl 	%r16, %r0, %r28
T2_asi_reg_rd_144:
	mov	0x36, %r14
	.word 0xf8db8e80  ! 3355: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf4c58020  ! 3357: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r26
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_145:
	mov	0x16, %r14
	.word 0xfadb8400  ! 3361: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x89946051  ! 3363: WRPR_TICK_I	wrpr	%r17, 0x0051, %tick
T2_asi_reg_wr_140:
	mov	0x2, %r14
	.word 0xf6f38e40  ! 3364: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_141:
	mov	0x37, %r14
	.word 0xf4f38e80  ! 3365: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 2)
	.word 0xf25520a0  ! 3369: LDSH_I	ldsh	[%r20 + 0x00a0], %r25
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_146:
	mov	0xe, %r14
	.word 0xf0db8e40  ! 3375: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf88de073  ! 3379: LDUBA_I	lduba	[%r23, + 0x0073] %asi, %r28
	.word 0xfa854020  ! 3380: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r29
T2_asi_reg_rd_147:
	mov	0x3c8, %r14
	.word 0xf6db8e60  ! 3381: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 31)
	ta	T_CHANGE_NONHPRIV
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 3b)
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_148:
	mov	0x20, %r14
	.word 0xfadb8e60  ! 3391: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_wr_142:
	mov	0x17, %r14
	.word 0xf0f38400  ! 3392: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf2c560ab  ! 3393: LDSWA_I	ldswa	[%r21, + 0x00ab] %asi, %r25
cpu_intr_2_267:
	setx	0x3a020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c4a052  ! 3396: ADDCcc_I	addccc 	%r18, 0x0052, %r27
	.word 0xf85ce10e  ! 3400: LDX_I	ldx	[%r19 + 0x010e], %r28
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 12)
	.word 0xf695e06b  ! 3402: LDUHA_I	lduha	[%r23, + 0x006b] %asi, %r27
	.word 0xfe84a10d  ! 3406: LDUWA_I	lduwa	[%r18, + 0x010d] %asi, %r31
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_268:
	setx	0x39012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_269:
	setx	0x3b0329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_270:
	setx	0x380129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_271:
	setx	0x3b001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_143:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 3421: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2cd217b  ! 3422: LDSBA_I	ldsba	[%r20, + 0x017b] %asi, %r25
cpu_intr_2_272:
	setx	0x3a023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_144:
	mov	0x3c1, %r14
	.word 0xf8f389e0  ! 3425: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf0458000  ! 3426: LDSW_R	ldsw	[%r22 + %r0], %r24
T2_asi_reg_wr_145:
	mov	0x13, %r14
	.word 0xf4f38e40  ! 3427: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfe4de19f  ! 3428: LDSB_I	ldsb	[%r23 + 0x019f], %r31
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 3f)
	.word 0xb0c56057  ! 3431: ADDCcc_I	addccc 	%r21, 0x0057, %r24
cpu_intr_2_273:
	setx	0x3b0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfc458000  ! 3437: LDSW_R	ldsw	[%r22 + %r0], %r30
cpu_intr_2_274:
	setx	0x3a003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_275:
	setx	0x3b0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe94a185  ! 3442: LDUHA_I	lduha	[%r18, + 0x0185] %asi, %r31
T2_asi_reg_wr_146:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 3443: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_276:
	setx	0x390301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_277:
	setx	0x3a000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d54020  ! 3454: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r26
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_278:
	setx	0x380009, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983810  ! 3459: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1810, %hpstate
	.word 0xfe048000  ! 3460: LDUW_R	lduw	[%r18 + %r0], %r31
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_279:
	setx	0x3a0116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_HPRIV
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983a42  ! 3469: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a42, %hpstate
	.word 0xfa8ca045  ! 3470: LDUBA_I	lduba	[%r18, + 0x0045] %asi, %r29
cpu_intr_2_280:
	setx	0x3b013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_281:
	setx	0x3a020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_149:
	mov	0x4, %r14
	.word 0xf0db8400  ! 3479: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982810  ! 3480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0810, %hpstate
cpu_intr_2_282:
	setx	0x3a0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cce1f1  ! 3486: LDSBA_I	ldsba	[%r19, + 0x01f1] %asi, %r24
cpu_intr_2_283:
	setx	0x3a001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_150:
	mov	0x6, %r14
	.word 0xf6db8400  ! 3494: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_rd_151:
	mov	0x4, %r14
	.word 0xfedb8e80  ! 3495: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_rd_152:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 3496: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_284:
	setx	0x380312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb48d0000  ! 3513: ANDcc_R	andcc 	%r20, %r0, %r26
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 23)
	.word 0xf8856061  ! 3517: LDUWA_I	lduwa	[%r21, + 0x0061] %asi, %r28
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa15a032  ! 3528: LDUH_I	lduh	[%r22 + 0x0032], %r29
	.word 0xb0444000  ! 3529: ADDC_R	addc 	%r17, %r0, %r24
T2_asi_reg_rd_153:
	mov	0x31, %r14
	.word 0xf4db8e40  ! 3530: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc4d603d  ! 3533: LDSB_I	ldsb	[%r21 + 0x003d], %r30
cpu_intr_2_285:
	setx	0x3b0127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 9)
	.word 0xf28c20ab  ! 3538: LDUBA_I	lduba	[%r16, + 0x00ab] %asi, %r25
	.word 0xf08de100  ! 3539: LDUBA_I	lduba	[%r23, + 0x0100] %asi, %r24
	.word 0xb6246002  ! 3540: SUB_I	sub 	%r17, 0x0002, %r27
	.word 0xfa958020  ! 3545: LDUHA_R	lduha	[%r22, %r0] 0x01, %r29
cpu_intr_2_286:
	setx	0x380225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_147:
	mov	0x18, %r14
	.word 0xf2f38e40  ! 3550: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_287:
	setx	0x3a0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3d8000  ! 3557: XNOR_R	xnor 	%r22, %r0, %r29
cpu_intr_2_288:
	setx	0x380016, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_154:
	mov	0xd, %r14
	.word 0xfadb8e40  ! 3559: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 1a)
	.word 0xbeac8000  ! 3563: ANDNcc_R	andncc 	%r18, %r0, %r31
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982992  ! 3564: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0992, %hpstate
	.word 0xb0150000  ! 3566: OR_R	or 	%r20, %r0, %r24
	.word 0xfcdda01c  ! 3568: LDXA_I	ldxa	[%r22, + 0x001c] %asi, %r30
T2_asi_reg_rd_155:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 3570: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfc556148  ! 3571: LDSH_I	ldsh	[%r21 + 0x0148], %r30
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 2c)
	.word 0xb4148000  ! 3573: OR_R	or 	%r18, %r0, %r26
	.word 0xfe5d0000  ! 3580: LDX_R	ldx	[%r20 + %r0], %r31
cpu_intr_2_289:
	setx	0x3b001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_290:
	setx	0x390307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_rd_156:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 3592: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf85ca1f0  ! 3593: LDX_I	ldx	[%r18 + 0x01f0], %r28
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfad4e033  ! 3597: LDSHA_I	ldsha	[%r19, + 0x0033] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8454000  ! 3605: LDSW_R	ldsw	[%r21 + %r0], %r28
cpu_intr_2_291:
	setx	0x3b0112, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_148:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 3609: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbf2c8000  ! 3613: SLL_R	sll 	%r18, %r0, %r31
	.word 0xf6c5c020  ! 3624: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r27
T2_asi_reg_rd_157:
	mov	0xa, %r14
	.word 0xfedb8e60  ! 3626: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_2_292:
	setx	0x380329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 11)
	.word 0xfc8c4020  ! 3632: LDUBA_R	lduba	[%r17, %r0] 0x01, %r30
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 8)
	.word 0xfa5d0000  ! 3637: LDX_R	ldx	[%r20 + %r0], %r29
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_rd_158:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 3642: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfa558000  ! 3644: LDSH_R	ldsh	[%r22 + %r0], %r29
cpu_intr_2_293:
	setx	0x390101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 26)
	.word 0xfac421d3  ! 3649: LDSWA_I	ldswa	[%r16, + 0x01d3] %asi, %r29
	.word 0xf0552168  ! 3651: LDSH_I	ldsh	[%r20 + 0x0168], %r24
	.word 0xba0da1e8  ! 3653: AND_I	and 	%r22, 0x01e8, %r29
T2_asi_reg_wr_149:
	mov	0x25, %r14
	.word 0xf8f38e80  ! 3655: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_rd_159:
	mov	0x11, %r14
	.word 0xfcdb8e40  ! 3656: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf444c000  ! 3658: LDSW_R	ldsw	[%r19 + %r0], %r26
cpu_intr_2_294:
	setx	0x3a010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf804611f  ! 3662: LDUW_I	lduw	[%r17 + 0x011f], %r28
T2_asi_reg_rd_160:
	mov	0x34, %r14
	.word 0xf2db8400  ! 3663: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfed460ad  ! 3664: LDSHA_I	ldsha	[%r17, + 0x00ad] %asi, %r31
T2_asi_reg_wr_150:
	mov	0x5, %r14
	.word 0xfef38e60  ! 3665: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_2_295:
	setx	0x3a031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_151:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 3668: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbea5a121  ! 3670: SUBcc_I	subcc 	%r22, 0x0121, %r31
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_rd_161:
	mov	0x3c5, %r14
	.word 0xf4db89e0  ! 3676: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf28c6111  ! 3679: LDUBA_I	lduba	[%r17, + 0x0111] %asi, %r25
T2_asi_reg_wr_152:
	mov	0x3, %r14
	.word 0xfcf38e40  ! 3681: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf8954020  ! 3683: LDUHA_R	lduha	[%r21, %r0] 0x01, %r28
	.word 0xfc0da011  ! 3685: LDUB_I	ldub	[%r22 + 0x0011], %r30
cpu_intr_2_296:
	setx	0x3a0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3643801  ! 3688: MOVcc_I	<illegal instruction>
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_297:
	setx	0x3d033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_162:
	mov	0x30, %r14
	.word 0xf2db8e80  ! 3706: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_298:
	setx	0x3d002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_163:
	mov	0x22, %r14
	.word 0xf8db8e40  ! 3712: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_164:
	mov	0x2c, %r14
	.word 0xf8db8400  ! 3716: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 16)
	.word 0xfa94c020  ! 3720: LDUHA_R	lduha	[%r19, %r0] 0x01, %r29
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, f)
	.word 0xb89c6159  ! 3729: XORcc_I	xorcc 	%r17, 0x0159, %r28
cpu_intr_2_299:
	setx	0x3c0109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_300:
	setx	0x3d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982842  ! 3736: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0842, %hpstate
	.word 0xf85cc000  ! 3741: LDX_R	ldx	[%r19 + %r0], %r28
cpu_intr_2_301:
	setx	0x3c0216, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_153:
	mov	0x2c, %r14
	.word 0xf8f389e0  ! 3744: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_302:
	setx	0x3d000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa158000  ! 3747: LDUH_R	lduh	[%r22 + %r0], %r29
cpu_intr_2_303:
	setx	0x3f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_304:
	setx	0x3d0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65c2175  ! 3757: LDX_I	ldx	[%r16 + 0x0175], %r27
T2_asi_reg_rd_165:
	mov	0x23, %r14
	.word 0xf8db89e0  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_154:
	mov	0x23, %r14
	.word 0xf2f38e80  ! 3761: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfc858020  ! 3762: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
	ta	T_CHANGE_TO_TL0
cpu_intr_2_305:
	setx	0x3e010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cc8020  ! 3766: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r25
T2_asi_reg_wr_155:
	mov	0x2c, %r14
	.word 0xf2f38e60  ! 3771: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf65de05a  ! 3775: LDX_I	ldx	[%r23 + 0x005a], %r27
	.word 0xba0ca12e  ! 3777: AND_I	and 	%r18, 0x012e, %r29
	.word 0xf4540000  ! 3778: LDSH_R	ldsh	[%r16 + %r0], %r26
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf6c50020  ! 3784: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf44d21b2  ! 3788: LDSB_I	ldsb	[%r20 + 0x01b2], %r26
	.word 0xb0454000  ! 3789: ADDC_R	addc 	%r21, %r0, %r24
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 2a)
	.word 0xb644a112  ! 3792: ADDC_I	addc 	%r18, 0x0112, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xbd643801  ! 3797: MOVcc_I	<illegal instruction>
	.word 0xf6456110  ! 3799: LDSW_I	ldsw	[%r21 + 0x0110], %r27
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 25)
	.word 0xf64c4000  ! 3805: LDSB_R	ldsb	[%r17 + %r0], %r27
cpu_intr_2_306:
	setx	0x3e0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a54000  ! 3809: SUBcc_R	subcc 	%r21, %r0, %r25
	.word 0xfecd61a4  ! 3810: LDSBA_I	ldsba	[%r21, + 0x01a4] %asi, %r31
T2_asi_reg_rd_166:
	mov	0x1d, %r14
	.word 0xfcdb8400  ! 3815: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 9)
	.word 0xfa54c000  ! 3820: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xfad4e136  ! 3823: LDSHA_I	ldsha	[%r19, + 0x0136] %asi, %r29
T2_asi_reg_wr_156:
	mov	0xa, %r14
	.word 0xf0f38e80  ! 3826: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 8)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_157:
	mov	0x2b, %r14
	.word 0xfcf389e0  ! 3831: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_rd_167:
	mov	0x7, %r14
	.word 0xf4db89e0  ! 3833: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_rd_168:
	mov	0x3c2, %r14
	.word 0xfadb8400  ! 3834: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xf04561be  ! 3837: LDSW_I	ldsw	[%r21 + 0x01be], %r24
cpu_intr_2_307:
	setx	0x3f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_158:
	mov	0x2b, %r14
	.word 0xf6f38e40  ! 3840: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf0448000  ! 3841: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0xf084a133  ! 3843: LDUWA_I	lduwa	[%r18, + 0x0133] %asi, %r24
	.word 0xfc14c000  ! 3846: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xba354000  ! 3851: ORN_R	orn 	%r21, %r0, %r29
	.word 0xb60d6143  ! 3853: AND_I	and 	%r21, 0x0143, %r27
T2_asi_reg_rd_169:
	mov	0x2b, %r14
	.word 0xf0db89e0  ! 3854: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_wr_159:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 3856: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_160:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 3860: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb2950000  ! 3866: ORcc_R	orcc 	%r20, %r0, %r25
	.word 0xb6048000  ! 3867: ADD_R	add 	%r18, %r0, %r27
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_308:
	setx	0x3f0036, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_170:
	mov	0x3c0, %r14
	.word 0xf8db89e0  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf80c4000  ! 3876: LDUB_R	ldub	[%r17 + %r0], %r28
	.word 0x8f902000  ! 3878: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb3357001  ! 3880: SRLX_I	srlx	%r21, 0x0001, %r25
cpu_intr_2_309:
	setx	0x3d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8cc020  ! 3888: LDUBA_R	lduba	[%r19, %r0] 0x01, %r30
	.word 0xf054a0c3  ! 3889: LDSH_I	ldsh	[%r18 + 0x00c3], %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbe2d4000  ! 3893: ANDN_R	andn 	%r21, %r0, %r31
	.word 0xb62ce1b5  ! 3894: ANDN_I	andn 	%r19, 0x01b5, %r27
	.word 0xb3343001  ! 3896: SRLX_I	srlx	%r16, 0x0001, %r25
T2_asi_reg_rd_171:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 3898: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_161:
	mov	0x2, %r14
	.word 0xf2f38e40  ! 3900: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf4c4e197  ! 3903: LDSWA_I	ldswa	[%r19, + 0x0197] %asi, %r26
T2_asi_reg_rd_172:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 3909: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfc944020  ! 3910: LDUHA_R	lduha	[%r17, %r0] 0x01, %r30
	ta	T_CHANGE_TO_TL1
cpu_intr_2_310:
	setx	0x3f0336, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_162:
	mov	0x3c2, %r14
	.word 0xf6f389e0  ! 3916: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 32)
	.word 0xb22c8000  ! 3923: ANDN_R	andn 	%r18, %r0, %r25
	.word 0xb4bd4000  ! 3931: XNORcc_R	xnorcc 	%r21, %r0, %r26
T2_asi_reg_wr_163:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 3932: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_rd_173:
	mov	0x7, %r14
	.word 0xfadb8e60  ! 3934: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_2_311:
	setx	0x3d0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5ce0e9  ! 3937: LDX_I	ldx	[%r19 + 0x00e9], %r31
	.word 0xfed521b4  ! 3939: LDSHA_I	ldsha	[%r20, + 0x01b4] %asi, %r31
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983aca  ! 3943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1aca, %hpstate
	.word 0xf2c46021  ! 3945: LDSWA_I	ldswa	[%r17, + 0x0021] %asi, %r25
cpu_intr_2_312:
	setx	0x3e011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_313:
	setx	0x3d0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe158000  ! 3949: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0xf80c616f  ! 3950: LDUB_I	ldub	[%r17 + 0x016f], %r28
	.word 0xf6058000  ! 3951: LDUW_R	lduw	[%r22 + %r0], %r27
cpu_intr_2_314:
	setx	0x3f012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_315:
	setx	0x3f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa948020  ! 3965: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
	.word 0xb92cb001  ! 3966: SLLX_I	sllx	%r18, 0x0001, %r28
cpu_intr_2_316:
	setx	0x3e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc854020  ! 3970: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r30
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfc8c8020  ! 3972: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
T2_asi_reg_wr_164:
	mov	0x2c, %r14
	.word 0xf0f38400  ! 3973: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf6040000  ! 3976: LDUW_R	lduw	[%r16 + %r0], %r27
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_317:
	setx	0x3f0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cde0f0  ! 3987: LDSBA_I	ldsba	[%r23, + 0x00f0] %asi, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xf04d60d8  ! 3994: LDSB_I	ldsb	[%r21 + 0x00d8], %r24
T2_asi_reg_rd_174:
	mov	0x3c4, %r14
	.word 0xf2db8e80  ! 3996: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_318:
	setx	0x3f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_175:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 4000: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbaa58000  ! 4002: SUBcc_R	subcc 	%r22, %r0, %r29
T2_asi_reg_wr_165:
	mov	0x26, %r14
	.word 0xfaf38e40  ! 4005: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 3f)
	.word 0xb23520ad  ! 4008: SUBC_I	orn 	%r20, 0x00ad, %r25
cpu_intr_2_319:
	setx	0x3d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccc8020  ! 4015: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r30
	.word 0xfa14c000  ! 4016: LDUH_R	lduh	[%r19 + %r0], %r29
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, a)
	ta	T_CHANGE_TO_TL1
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_320:
	setx	0x3f0309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf60cc000  ! 4031: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xfe4da09f  ! 4032: LDSB_I	ldsb	[%r22 + 0x009f], %r31
T2_asi_reg_rd_176:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 4035: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf644c000  ! 4036: LDSW_R	ldsw	[%r19 + %r0], %r27
cpu_intr_2_321:
	setx	0x3d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3643801  ! 4038: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_TO_TL1
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf45d21fa  ! 4047: LDX_I	ldx	[%r20 + 0x01fa], %r26
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf2058000  ! 4050: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xfac42131  ! 4051: LDSWA_I	ldswa	[%r16, + 0x0131] %asi, %r29
	.word 0xbc1d6112  ! 4052: XOR_I	xor 	%r21, 0x0112, %r30
	.word 0xfac54020  ! 4053: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
	.word 0xb0958000  ! 4055: ORcc_R	orcc 	%r22, %r0, %r24
	.word 0xf24c2094  ! 4056: LDSB_I	ldsb	[%r16 + 0x0094], %r25
T2_asi_reg_rd_177:
	mov	0x19, %r14
	.word 0xfedb8e60  ! 4058: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_wr_166:
	mov	0x2b, %r14
	.word 0xf2f38e40  ! 4062: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbf7c6401  ! 4064: MOVR_I	movre	%r17, 0x1, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xb634a1fb  ! 4070: ORN_I	orn 	%r18, 0x01fb, %r27
T2_asi_reg_rd_178:
	mov	0x2a, %r14
	.word 0xfadb8e40  ! 4071: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf45cc000  ! 4072: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xf4dc61a5  ! 4073: LDXA_I	ldxa	[%r17, + 0x01a5] %asi, %r26
T2_asi_reg_wr_167:
	mov	0x30, %r14
	.word 0xf8f384a0  ! 4076: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_rd_179:
	mov	0x11, %r14
	.word 0xf6db8e60  ! 4078: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_322:
	setx	0x3e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_180:
	mov	0xb, %r14
	.word 0xfcdb84a0  ! 4085: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_wr_168:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 4086: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_181:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 4088: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfc5d8000  ! 4090: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xb685e07f  ! 4099: ADDcc_I	addcc 	%r23, 0x007f, %r27
T2_asi_reg_rd_182:
	mov	0x15, %r14
	.word 0xfcdb8e40  ! 4103: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_169:
	mov	0x35, %r14
	.word 0xf6f38e40  ! 4105: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfe8de18e  ! 4108: LDUBA_I	lduba	[%r23, + 0x018e] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf285a01c  ! 4114: LDUWA_I	lduwa	[%r22, + 0x001c] %asi, %r25
T2_asi_reg_rd_183:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 4115: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfa4d8000  ! 4121: LDSB_R	ldsb	[%r22 + %r0], %r29
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 32)
	.word 0xfc0c6172  ! 4125: LDUB_I	ldub	[%r17 + 0x0172], %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xfc046014  ! 4133: LDUW_I	lduw	[%r17 + 0x0014], %r30
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 12)
	.word 0xfa5ce140  ! 4136: LDX_I	ldx	[%r19 + 0x0140], %r29
	.word 0xf245200d  ! 4137: LDSW_I	ldsw	[%r20 + 0x000d], %r25
	.word 0xf6d5c020  ! 4141: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
	.word 0xfac40020  ! 4143: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r29
	.word 0xf8d4e01f  ! 4145: LDSHA_I	ldsha	[%r19, + 0x001f] %asi, %r28
	.word 0xba0cc000  ! 4146: AND_R	and 	%r19, %r0, %r29
	.word 0xf80d0000  ! 4150: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xf894e05a  ! 4151: LDUHA_I	lduha	[%r19, + 0x005a] %asi, %r28
cpu_intr_2_323:
	setx	0x420229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa9561fe  ! 4154: LDUHA_I	lduha	[%r21, + 0x01fe] %asi, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xf694c020  ! 4156: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_wr_170:
	mov	0x1b, %r14
	.word 0xf6f38400  ! 4159: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T2_asi_reg_wr_171:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 4161: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf4cc0020  ! 4162: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r26
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_wr_172:
	mov	0x3c2, %r14
	.word 0xfcf389e0  ! 4169: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb295c000  ! 4170: ORcc_R	orcc 	%r23, %r0, %r25
T2_asi_reg_wr_173:
	mov	0x29, %r14
	.word 0xfef384a0  ! 4174: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfa442195  ! 4176: LDSW_I	ldsw	[%r16 + 0x0195], %r29
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_324:
	setx	0x41022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cd8020  ! 4179: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r27
	.word 0xf8944020  ! 4187: LDUHA_R	lduha	[%r17, %r0] 0x01, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xfe14e050  ! 4193: LDUH_I	lduh	[%r19 + 0x0050], %r31
	.word 0xfa0cc000  ! 4194: LDUB_R	ldub	[%r19 + %r0], %r29
T2_asi_reg_rd_184:
	mov	0x3c2, %r14
	.word 0xf8db84a0  ! 4196: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T2_asi_reg_rd_185:
	mov	0x17, %r14
	.word 0xf2db8400  ! 4198: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_174:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 4202: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 35)
	.word 0xf8dca0eb  ! 4205: LDXA_I	ldxa	[%r18, + 0x00eb] %asi, %r28
	.word 0xb6ad2000  ! 4209: ANDNcc_I	andncc 	%r20, 0x0000, %r27
cpu_intr_2_325:
	setx	0x400238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_326:
	setx	0x42021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe14c000  ! 4213: LDUH_R	lduh	[%r19 + %r0], %r31
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_327:
	setx	0x430115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf641800  ! 4218: MOVcc_R	<illegal instruction>
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 12)
	.word 0xfa0ce10f  ! 4226: LDUB_I	ldub	[%r19 + 0x010f], %r29
	.word 0xf814c000  ! 4227: LDUH_R	lduh	[%r19 + %r0], %r28
cpu_intr_2_328:
	setx	0x420314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb5c000  ! 4231: SUBCcc_R	orncc 	%r23, %r0, %r31
	.word 0xb12db001  ! 4236: SLLX_I	sllx	%r22, 0x0001, %r24
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_329:
	setx	0x41011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_wr_175:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 4242: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf885612d  ! 4244: LDUWA_I	lduwa	[%r21, + 0x012d] %asi, %r28
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfc040000  ! 4248: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xba4561ac  ! 4251: ADDC_I	addc 	%r21, 0x01ac, %r29
	.word 0xfed54020  ! 4256: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r31
	.word 0xfe948020  ! 4257: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
	.word 0xf4c58020  ! 4258: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r26
	.word 0xba0de039  ! 4260: AND_I	and 	%r23, 0x0039, %r29
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 12)
	.word 0xb8a4e155  ! 4263: SUBcc_I	subcc 	%r19, 0x0155, %r28
cpu_intr_2_330:
	setx	0x410029, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_331:
	setx	0x42013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64d8000  ! 4272: LDSB_R	ldsb	[%r22 + %r0], %r27
cpu_intr_2_332:
	setx	0x400136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c54020  ! 4276: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r24
T2_asi_reg_rd_186:
	mov	0x5, %r14
	.word 0xf8db8e40  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf214205c  ! 4281: LDUH_I	lduh	[%r16 + 0x005c], %r25
cpu_intr_2_333:
	setx	0x410229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 14)
	.word 0xb4358000  ! 4287: ORN_R	orn 	%r22, %r0, %r26
T2_asi_reg_rd_187:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 4290: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_334:
	setx	0x42023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28d8020  ! 4297: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
	.word 0xf88d61fc  ! 4298: LDUBA_I	lduba	[%r21, + 0x01fc] %asi, %r28
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf85c20a1  ! 4303: LDX_I	ldx	[%r16 + 0x00a1], %r28
	.word 0xf05d0000  ! 4304: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xf814c000  ! 4305: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xfac42135  ! 4306: LDSWA_I	ldswa	[%r16, + 0x0135] %asi, %r29
	.word 0xf00ce07d  ! 4307: LDUB_I	ldub	[%r19 + 0x007d], %r24
cpu_intr_2_335:
	setx	0x410132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 23)
	.word 0xf8d521af  ! 4318: LDSHA_I	ldsha	[%r20, + 0x01af] %asi, %r28
	.word 0xf4140000  ! 4321: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xfc458000  ! 4323: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xf20460fd  ! 4325: LDUW_I	lduw	[%r17 + 0x00fd], %r25
	.word 0xfa5ce03e  ! 4326: LDX_I	ldx	[%r19 + 0x003e], %r29
T2_asi_reg_wr_176:
	mov	0x23, %r14
	.word 0xf6f389e0  ! 4327: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf64d604c  ! 4329: LDSB_I	ldsb	[%r21 + 0x004c], %r27
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfc140000  ! 4331: LDUH_R	lduh	[%r16 + %r0], %r30
T2_asi_reg_wr_177:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 4336: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_336:
	setx	0x400108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb4c000  ! 4340: ORNcc_R	orncc 	%r19, %r0, %r31
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 29)
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_337:
	setx	0x430214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84de1e2  ! 4347: LDSB_I	ldsb	[%r23 + 0x01e2], %r28
	.word 0xf014e1ad  ! 4351: LDUH_I	lduh	[%r19 + 0x01ad], %r24
T2_asi_reg_wr_178:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 4352: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_rd_188:
	mov	0x3c1, %r14
	.word 0xf8db8e60  ! 4353: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_wr_179:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 4356: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf0550000  ! 4357: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xf855a163  ! 4358: LDSH_I	ldsh	[%r22 + 0x0163], %r28
cpu_intr_2_338:
	setx	0x430123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_339:
	setx	0x420119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa840020  ! 4362: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
cpu_intr_2_340:
	setx	0x420214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc84619c  ! 4366: LDUWA_I	lduwa	[%r17, + 0x019c] %asi, %r30
	.word 0xb8b4a0b9  ! 4367: ORNcc_I	orncc 	%r18, 0x00b9, %r28
cpu_intr_2_341:
	setx	0x43022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_189:
	mov	0x3c3, %r14
	.word 0xfcdb84a0  ! 4370: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf80dc000  ! 4371: LDUB_R	ldub	[%r23 + %r0], %r28
T2_asi_reg_wr_180:
	mov	0x3c0, %r14
	.word 0xf8f38e80  ! 4372: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_rd_190:
	mov	0x22, %r14
	.word 0xfcdb89e0  ! 4373: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xb414c000  ! 4381: OR_R	or 	%r19, %r0, %r26
	.word 0xb40c0000  ! 4383: AND_R	and 	%r16, %r0, %r26
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf64ce004  ! 4390: LDSB_I	ldsb	[%r19 + 0x0004], %r27
T2_asi_reg_rd_191:
	mov	0x15, %r14
	.word 0xfcdb8e80  ! 4391: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_wr_181:
	mov	0xe, %r14
	.word 0xf4f38e40  ! 4394: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb48c21bc  ! 4399: ANDcc_I	andcc 	%r16, 0x01bc, %r26
	.word 0xbd3d0000  ! 4400: SRA_R	sra 	%r20, %r0, %r30
	.word 0xf0cc4020  ! 4402: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 8)
	.word 0xfad5a0ab  ! 4410: LDSHA_I	ldsha	[%r22, + 0x00ab] %asi, %r29
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983dca  ! 4411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dca, %hpstate
	.word 0xf454e036  ! 4412: LDSH_I	ldsh	[%r19 + 0x0036], %r26
	.word 0xfed5a198  ! 4415: LDSHA_I	ldsha	[%r22, + 0x0198] %asi, %r31
cpu_intr_2_342:
	setx	0x430303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf28ce15c  ! 4419: LDUBA_I	lduba	[%r19, + 0x015c] %asi, %r25
cpu_intr_2_343:
	setx	0x420121, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_192:
	mov	0xe, %r14
	.word 0xf8db89e0  ! 4422: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf28d60a5  ! 4423: LDUBA_I	lduba	[%r21, + 0x00a5] %asi, %r25
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_344:
	setx	0x43021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfcd5e1a5  ! 4429: LDSHA_I	ldsha	[%r23, + 0x01a5] %asi, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4c5c020  ! 4432: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r26
	ta	T_CHANGE_NONHPRIV
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf4c44020  ! 4435: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r26
	.word 0xb62de172  ! 4436: ANDN_I	andn 	%r23, 0x0172, %r27
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 3d)
	.word 0xbd643801  ! 4438: MOVcc_I	<illegal instruction>
cpu_intr_2_345:
	setx	0x40033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf295e1bd  ! 4440: LDUHA_I	lduha	[%r23, + 0x01bd] %asi, %r25
cpu_intr_2_346:
	setx	0x41012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_347:
	setx	0x430029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_348:
	setx	0x400135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_rd_193:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfa94e06e  ! 4456: LDUHA_I	lduha	[%r19, + 0x006e] %asi, %r29
	.word 0xf65c4000  ! 4462: LDX_R	ldx	[%r17 + %r0], %r27
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_194:
	mov	0x27, %r14
	.word 0xfadb8e60  ! 4470: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfc94c020  ! 4473: LDUHA_R	lduha	[%r19, %r0] 0x01, %r30
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983bda  ! 4478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bda, %hpstate
cpu_intr_2_349:
	setx	0x420316, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_182:
	mov	0x1f, %r14
	.word 0xfef38400  ! 4480: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_rd_195:
	mov	0x5, %r14
	.word 0xfcdb8e40  ! 4481: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf2450000  ! 4483: LDSW_R	ldsw	[%r20 + %r0], %r25
T2_asi_reg_wr_183:
	mov	0x18, %r14
	.word 0xf6f38e40  ! 4486: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb0bc612c  ! 4487: XNORcc_I	xnorcc 	%r17, 0x012c, %r24
T2_asi_reg_rd_196:
	mov	0x20, %r14
	.word 0xf4db8e80  ! 4488: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_350:
	setx	0x410213, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_184:
	mov	0x3c5, %r14
	.word 0xf2f38400  ! 4493: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_wr_185:
	mov	0x38, %r14
	.word 0xf8f38e40  ! 4494: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_197:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 4497: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5344000  ! 4500: SRL_R	srl 	%r17, %r0, %r26
	.word 0xfa556066  ! 4502: LDSH_I	ldsh	[%r21 + 0x0066], %r29
cpu_intr_2_351:
	setx	0x430115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09561d6  ! 4507: ORcc_I	orcc 	%r21, 0x01d6, %r24
	.word 0xf20d0000  ! 4509: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xfe84e101  ! 4511: LDUWA_I	lduwa	[%r19, + 0x0101] %asi, %r31
T2_asi_reg_wr_186:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 4513: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfc5d201c  ! 4514: LDX_I	ldx	[%r20 + 0x001c], %r30
cpu_intr_2_352:
	setx	0x410120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6148000  ! 4517: OR_R	or 	%r18, %r0, %r27
T2_asi_reg_rd_198:
	mov	0x14, %r14
	.word 0xf6db89e0  ! 4518: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_353:
	setx	0x400322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04c8000  ! 4520: LDSB_R	ldsb	[%r18 + %r0], %r24
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_199:
	mov	0x4, %r14
	.word 0xf2db8e80  ! 4527: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 33)
	.word 0xb8b4a1f3  ! 4529: ORNcc_I	orncc 	%r18, 0x01f3, %r28
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_200:
	mov	0x3, %r14
	.word 0xfedb84a0  ! 4538: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_rd_201:
	mov	0x3c0, %r14
	.word 0xf0db8e60  ! 4539: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 3d)
	.word 0x8795204b  ! 4544: WRPR_TT_I	wrpr	%r20, 0x004b, %tt
cpu_intr_2_354:
	setx	0x420018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_355:
	setx	0x430021, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_202:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xf004e046  ! 4556: LDUW_I	lduw	[%r19 + 0x0046], %r24
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_356:
	setx	0x43001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_357:
	setx	0x410002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_rd_203:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 4564: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfc4cc000  ! 4566: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xb024a0e0  ! 4570: SUB_I	sub 	%r18, 0x00e0, %r24
	.word 0xf285c020  ! 4572: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r25
T2_asi_reg_wr_187:
	mov	0x3c6, %r14
	.word 0xfef38e60  ! 4573: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_2_358:
	setx	0x410223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00d61b5  ! 4579: LDUB_I	ldub	[%r21 + 0x01b5], %r24
	.word 0xf60c20b8  ! 4580: LDUB_I	ldub	[%r16 + 0x00b8], %r27
cpu_intr_2_359:
	setx	0x400017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, c)
	.word 0xf25da07e  ! 4586: LDX_I	ldx	[%r22 + 0x007e], %r25
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_wr_188:
	mov	0x32, %r14
	.word 0xf2f38e40  ! 4590: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf2c521c7  ! 4592: LDSWA_I	ldswa	[%r20, + 0x01c7] %asi, %r25
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 18)
	.word 0xf0858020  ! 4598: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
T2_asi_reg_wr_189:
	mov	0x17, %r14
	.word 0xf2f389e0  ! 4601: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb6b44000  ! 4604: SUBCcc_R	orncc 	%r17, %r0, %r27
	.word 0xfc4ca0f4  ! 4607: LDSB_I	ldsb	[%r18 + 0x00f4], %r30
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_204:
	mov	0x3, %r14
	.word 0xfcdb8e80  ! 4614: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_rd_205:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 4615: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfe0d4000  ! 4622: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xfa5d8000  ! 4624: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xfacde06f  ! 4625: LDSBA_I	ldsba	[%r23, + 0x006f] %asi, %r29
T2_asi_reg_wr_190:
	mov	0x3c7, %r14
	.word 0xf8f38400  ! 4626: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf285614f  ! 4629: LDUWA_I	lduwa	[%r21, + 0x014f] %asi, %r25
	.word 0xfe84214f  ! 4636: LDUWA_I	lduwa	[%r16, + 0x014f] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_360:
	setx	0x460310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_361:
	setx	0x450302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_362:
	setx	0x47011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_206:
	mov	0x38, %r14
	.word 0xf0db8e40  ! 4651: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 12)
	.word 0xbb510000  ! 4653: RDPR_TICK	<illegal instruction>
T2_asi_reg_wr_191:
	mov	0x1f, %r14
	.word 0xf8f38e40  ! 4654: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_363:
	setx	0x470036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0450000  ! 4663: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xba950000  ! 4666: ORcc_R	orcc 	%r20, %r0, %r29
	.word 0xbeb5a16d  ! 4667: ORNcc_I	orncc 	%r22, 0x016d, %r31
cpu_intr_2_364:
	setx	0x46030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794204d  ! 4672: WRPR_TT_I	wrpr	%r16, 0x004d, %tt
	.word 0xb8c46022  ! 4675: ADDCcc_I	addccc 	%r17, 0x0022, %r28
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 18)
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982848  ! 4678: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0848, %hpstate
T2_asi_reg_wr_192:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 4685: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_365:
	setx	0x47001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedde08e  ! 4690: LDXA_I	ldxa	[%r23, + 0x008e] %asi, %r31
T2_asi_reg_wr_193:
	mov	0x1e, %r14
	.word 0xf8f38e80  ! 4691: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 11)
	.word 0x8d952104  ! 4693: WRPR_PSTATE_I	wrpr	%r20, 0x0104, %pstate
	.word 0xb605a1e2  ! 4694: ADD_I	add 	%r22, 0x01e2, %r27
	.word 0xf685e1b9  ! 4695: LDUWA_I	lduwa	[%r23, + 0x01b9] %asi, %r27
cpu_intr_2_366:
	setx	0x460014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 22)
	.word 0xfc55c000  ! 4700: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xba3c8000  ! 4702: XNOR_R	xnor 	%r18, %r0, %r29
cpu_intr_2_367:
	setx	0x44013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8de09c  ! 4704: ANDcc_I	andcc 	%r23, 0x009c, %r29
	.word 0xfed48020  ! 4708: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r31
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c88  ! 4709: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c88, %hpstate
	.word 0xf0c52052  ! 4711: LDSWA_I	ldswa	[%r20, + 0x0052] %asi, %r24
	.word 0xf2dc2180  ! 4712: LDXA_I	ldxa	[%r16, + 0x0180] %asi, %r25
	.word 0xf4cde1d5  ! 4713: LDSBA_I	ldsba	[%r23, + 0x01d5] %asi, %r26
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 14)
	.word 0xf484a1c4  ! 4715: LDUWA_I	lduwa	[%r18, + 0x01c4] %asi, %r26
	.word 0xfa4520ba  ! 4719: LDSW_I	ldsw	[%r20 + 0x00ba], %r29
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 7)
	.word 0xfa14e1d2  ! 4722: LDUH_I	lduh	[%r19 + 0x01d2], %r29
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_194:
	mov	0x17, %r14
	.word 0xf4f384a0  ! 4725: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfc4d8000  ! 4726: LDSB_R	ldsb	[%r22 + %r0], %r30
cpu_intr_2_368:
	setx	0x460139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf255e0e4  ! 4730: LDSH_I	ldsh	[%r23 + 0x00e4], %r25
	.word 0xbb3c8000  ! 4732: SRA_R	sra 	%r18, %r0, %r29
	.word 0xfadc61a7  ! 4733: LDXA_I	ldxa	[%r17, + 0x01a7] %asi, %r29
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_207:
	mov	0x20, %r14
	.word 0xf6db89e0  ! 4735: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, f)
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf885c020  ! 4738: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r28
cpu_intr_2_369:
	setx	0x450037, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_195:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 4741: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2954020  ! 4744: LDUHA_R	lduha	[%r21, %r0] 0x01, %r25
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_196:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 4746: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfa548000  ! 4751: LDSH_R	ldsh	[%r18 + %r0], %r29
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfe04c000  ! 4757: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xf05dc000  ! 4760: LDX_R	ldx	[%r23 + %r0], %r24
T2_asi_reg_rd_208:
	mov	0x3c0, %r14
	.word 0xf8db8400  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb004c000  ! 4764: ADD_R	add 	%r19, %r0, %r24
	.word 0xf0dd6152  ! 4765: LDXA_I	ldxa	[%r21, + 0x0152] %asi, %r24
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_wr_197:
	mov	0x3c5, %r14
	.word 0xf2f389e0  ! 4768: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf4c5a023  ! 4769: LDSWA_I	ldswa	[%r22, + 0x0023] %asi, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_396:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_396), 16, 16)) -> intp(2, 0, 20)
	.word 0xfc040000  ! 4776: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xbf641800  ! 4778: MOVcc_R	<illegal instruction>
	.word 0xf0140000  ! 4780: LDUH_R	lduh	[%r16 + %r0], %r24
T2_asi_reg_rd_209:
	mov	0x7, %r14
	.word 0xf0db8e40  ! 4783: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_370:
	setx	0x440311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_397:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_397), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_wr_198:
	mov	0x1f, %r14
	.word 0xf2f38e40  ! 4794: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2948020  ! 4798: LDUHA_R	lduha	[%r18, %r0] 0x01, %r25
T2_asi_reg_wr_199:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 4800: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfa4d0000  ! 4802: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xfa8ca0ad  ! 4803: LDUBA_I	lduba	[%r18, + 0x00ad] %asi, %r29
iob_intr_2_398:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_398), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_399:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_399), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_371:
	setx	0x470318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec5e03b  ! 4811: LDSWA_I	ldswa	[%r23, + 0x003b] %asi, %r31
cpu_intr_2_372:
	setx	0x44013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69c21ab  ! 4813: XORcc_I	xorcc 	%r16, 0x01ab, %r27
iob_intr_2_400:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_400), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_401:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_401), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfe944020  ! 4819: LDUHA_R	lduha	[%r17, %r0] 0x01, %r31
	.word 0xf085209b  ! 4823: LDUWA_I	lduwa	[%r20, + 0x009b] %asi, %r24
iob_intr_2_402:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_402), 16, 16)) -> intp(2, 0, 3)
	.word 0xfa550000  ! 4827: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xfc0520da  ! 4828: LDUW_I	lduw	[%r20 + 0x00da], %r30
	.word 0xfe148000  ! 4829: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xf204a178  ! 4831: LDUW_I	lduw	[%r18 + 0x0178], %r25
cpu_intr_2_373:
	setx	0x470325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba354000  ! 4834: SUBC_R	orn 	%r21, %r0, %r29
	.word 0xf6d5a1d7  ! 4836: LDSHA_I	ldsha	[%r22, + 0x01d7] %asi, %r27
cpu_intr_2_374:
	setx	0x46033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4ac0000  ! 4838: ANDNcc_R	andncc 	%r16, %r0, %r26
iob_intr_2_403:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_403), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfa8c61b0  ! 4842: LDUBA_I	lduba	[%r17, + 0x01b0] %asi, %r29
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982d80  ! 4843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d80, %hpstate
	.word 0xf04c0000  ! 4844: LDSB_R	ldsb	[%r16 + %r0], %r24
T2_asi_reg_rd_210:
	mov	0x3c7, %r14
	.word 0xfedb8e80  ! 4846: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_2_404:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_404), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_405:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_405), 16, 16)) -> intp(2, 0, d)
	.word 0xf2950020  ! 4851: LDUHA_R	lduha	[%r20, %r0] 0x01, %r25
	.word 0xfe85e17e  ! 4854: LDUWA_I	lduwa	[%r23, + 0x017e] %asi, %r31
	ta	T_CHANGE_HPRIV
iob_intr_2_406:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_406), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_407:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_407), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_375:
	setx	0x470036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_408:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_408), 16, 16)) -> intp(2, 0, 19)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_200:
	mov	0x11, %r14
	.word 0xf8f389e0  ! 4865: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbf51c000  ! 4866: RDPR_TL	<illegal instruction>
	.word 0xf2c5e19d  ! 4872: LDSWA_I	ldswa	[%r23, + 0x019d] %asi, %r25
	ta	T_CHANGE_TO_TL0
cpu_intr_2_376:
	setx	0x46012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe55203f  ! 4875: LDSH_I	ldsh	[%r20 + 0x003f], %r31
iob_intr_2_409:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_409), 16, 16)) -> intp(2, 0, d)
	.word 0xfccc8020  ! 4879: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r30
iob_intr_2_410:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_410), 16, 16)) -> intp(2, 0, 27)
	.word 0xfc454000  ! 4884: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xb0a421c0  ! 4885: SUBcc_I	subcc 	%r16, 0x01c0, %r24
	.word 0xfa4c8000  ! 4886: LDSB_R	ldsb	[%r18 + %r0], %r29
	.word 0xf8cdc020  ! 4889: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
cpu_intr_2_377:
	setx	0x460209, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_211:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 4891: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_378:
	setx	0x470307, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_201:
	mov	0x9, %r14
	.word 0xfaf38e60  ! 4893: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e92  ! 4894: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e92, %hpstate
	.word 0xb28c0000  ! 4895: ANDcc_R	andcc 	%r16, %r0, %r25
T2_asi_reg_rd_212:
	mov	0x2b, %r14
	.word 0xfedb8e40  ! 4896: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf85ce19f  ! 4897: LDX_I	ldx	[%r19 + 0x019f], %r28
iob_intr_2_411:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_411), 16, 16)) -> intp(2, 0, c)
iob_intr_2_412:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_412), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_413:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_413), 16, 16)) -> intp(2, 0, 2)
	.word 0xf094e0f3  ! 4905: LDUHA_I	lduha	[%r19, + 0x00f3] %asi, %r24
	.word 0xf8d4c020  ! 4907: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r28
	.word 0xbc3da0ca  ! 4909: XNOR_I	xnor 	%r22, 0x00ca, %r30
	.word 0xf68c2056  ! 4910: LDUBA_I	lduba	[%r16, + 0x0056] %asi, %r27
	.word 0xf045e1b9  ! 4912: LDSW_I	ldsw	[%r23 + 0x01b9], %r24
iob_intr_2_414:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_414), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_379:
	setx	0x440121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_380:
	setx	0x470012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_381:
	setx	0x470036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4da0fb  ! 4920: LDSB_I	ldsb	[%r22 + 0x00fb], %r31
cpu_intr_2_382:
	setx	0x440035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8250000  ! 4925: SUB_R	sub 	%r20, %r0, %r28
	.word 0xf614a182  ! 4926: LDUH_I	lduh	[%r18 + 0x0182], %r27
	ta	T_CHANGE_TO_TL0
cpu_intr_2_383:
	setx	0x46000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe448000  ! 4931: LDSW_R	ldsw	[%r18 + %r0], %r31
iob_intr_2_415:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_415), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_213:
	mov	0x1a, %r14
	.word 0xf2db8e60  ! 4933: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_384:
	setx	0x44011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc1521b3  ! 4936: LDUH_I	lduh	[%r20 + 0x01b3], %r30
T2_asi_reg_rd_214:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
cpu_intr_2_385:
	setx	0x470001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d0020  ! 4941: LDUBA_R	lduba	[%r20, %r0] 0x01, %r31
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983f4a  ! 4942: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4a, %hpstate
	.word 0xf644c000  ! 4943: LDSW_R	ldsw	[%r19 + %r0], %r27
cpu_intr_2_386:
	setx	0x440119, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_215:
	mov	0xa, %r14
	.word 0xf4db8e80  ! 4945: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfe4cc000  ! 4947: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xb33c4000  ! 4949: SRA_R	sra 	%r17, %r0, %r25
T2_asi_reg_wr_202:
	mov	0x36, %r14
	.word 0xfcf38e40  ! 4952: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf685a04f  ! 4954: LDUWA_I	lduwa	[%r22, + 0x004f] %asi, %r27
cpu_intr_2_387:
	setx	0x44031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_203:
	mov	0x1e, %r14
	.word 0xf0f38e80  ! 4959: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf4c44020  ! 4961: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r26
cpu_intr_2_388:
	setx	0x440211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cd4020  ! 4965: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r26
iob_intr_2_416:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_416), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfc84c020  ! 4971: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r30
	.word 0xfc4ca1f0  ! 4972: LDSB_I	ldsb	[%r18 + 0x01f0], %r30
iob_intr_2_417:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_417), 16, 16)) -> intp(2, 0, 34)
	.word 0xf8dd211b  ! 4977: LDXA_I	ldxa	[%r20, + 0x011b] %asi, %r28
cpu_intr_2_389:
	setx	0x470239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c0000  ! 4980: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xf6dde0bb  ! 4982: LDXA_I	ldxa	[%r23, + 0x00bb] %asi, %r27
iob_intr_2_418:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_418), 16, 16)) -> intp(2, 0, 13)
	.word 0xf05ca063  ! 4984: LDX_I	ldx	[%r18 + 0x0063], %r24
	ta	T_CHANGE_HPRIV
	.word 0xbab461a3  ! 4989: ORNcc_I	orncc 	%r17, 0x01a3, %r29
	.word 0xfc552167  ! 4991: LDSH_I	ldsh	[%r20 + 0x0167], %r30
iob_intr_2_419:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_419), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_420:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_420), 16, 16)) -> intp(2, 0, 9)
	.word 0xfa0d8000  ! 4995: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xfe456109  ! 4996: LDSW_I	ldsw	[%r21 + 0x0109], %r31
iob_intr_2_421:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_421), 16, 16)) -> intp(2, 0, d)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb7a00540  ! 3: FSQRTd	fsqrt	
	.word 0xb3a00540  ! 5: FSQRTd	fsqrt	
cpu_intr_1_0:
	setx	0x18002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_0:
	mov	0x7, %r14
	.word 0xf4db8e40  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_1:
	setx	0x1f013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe8c4000  ! 12: ANDcc_R	andcc 	%r17, %r0, %r31
T1_asi_reg_wr_0:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 14: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_wr_1:
	mov	0x2a, %r14
	.word 0xf0f38e60  ! 15: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb3a5c820  ! 16: FADDs	fadds	%f23, %f0, %f25
T1_asi_reg_rd_1:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 18: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 36)
	.word 0xb9a44940  ! 24: FMULd	fmuld	%f48, %f0, %f28
	.word 0xb2c42195  ! 25: ADDCcc_I	addccc 	%r16, 0x0195, %r25
cpu_intr_1_2:
	setx	0x1e0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_3:
	setx	0x1f0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 35: FMOVPOS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_2:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 41: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfa00020  ! 47: FMOVs	fmovs	%f0, %f31
	.word 0xb1a80820  ! 50: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_4:
	setx	0x1d0106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 33)
	.word 0xb1a488e0  ! 57: FSUBq	dis not found

cpu_intr_1_5:
	setx	0x1d0034, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_3:
	mov	0x3c1, %r14
	.word 0xfcf384a0  ! 59: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_2:
	mov	0x13, %r14
	.word 0xf4db89e0  ! 62: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbe3de1a1  ! 63: XNOR_I	xnor 	%r23, 0x01a1, %r31
	.word 0xb5a81420  ! 66: FMOVRNZ	dis not found

	.word 0xbba00540  ! 72: FSQRTd	fsqrt	
	.word 0xb7a4c820  ! 73: FADDs	fadds	%f19, %f0, %f27
	.word 0xbda508a0  ! 77: FSUBs	fsubs	%f20, %f0, %f30
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_6:
	setx	0x1e023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 82: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00540  ! 84: FSQRTd	fsqrt	
cpu_intr_1_7:
	setx	0x1c0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb354000  ! 91: SRL_R	srl 	%r21, %r0, %r29
T1_asi_reg_wr_4:
	mov	0x6, %r14
	.word 0xfaf38e40  ! 94: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_8:
	setx	0x1d0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa409c0  ! 99: FDIVd	fdivd	%f16, %f0, %f62
T1_asi_reg_rd_3:
	mov	0x3c7, %r14
	.word 0xf0db8e60  ! 101: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_9:
	setx	0x1f0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa4820  ! 105: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb12df001  ! 106: SLLX_I	sllx	%r23, 0x0001, %r24
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, e)
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbcbd8000  ! 115: XNORcc_R	xnorcc 	%r22, %r0, %r30
	.word 0xb3a44840  ! 117: FADDd	faddd	%f48, %f0, %f56
	.word 0xb9a5c940  ! 119: FMULd	fmuld	%f54, %f0, %f28
	.word 0xb1a81420  ! 120: FMOVRNZ	dis not found

iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 13)
	.word 0xb9a58920  ! 124: FMULs	fmuls	%f22, %f0, %f28
	.word 0xb5a50860  ! 125: FADDq	dis not found

	.word 0xbba4c860  ! 126: FADDq	dis not found

	.word 0xbba81c20  ! 128: FMOVRGEZ	dis not found

iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_4:
	mov	0x18, %r14
	.word 0xf8db89e0  ! 130: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 18)
	.word 0xbfa81820  ! 136: FMOVRGZ	fmovs	%fcc3, %f0, %f31
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 5)
	.word 0xb1a5c9a0  ! 143: FDIVs	fdivs	%f23, %f0, %f24
cpu_intr_1_10:
	setx	0x1e0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a549c0  ! 147: FDIVd	fdivd	%f52, %f0, %f26
	.word 0xb1a81820  ! 149: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbbabc820  ! 153: FMOVVC	fmovs	%fcc1, %f0, %f29
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb9a5c9c0  ! 161: FDIVd	fdivd	%f54, %f0, %f28
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 37)
	.word 0xb2b4215b  ! 166: ORNcc_I	orncc 	%r16, 0x015b, %r25
cpu_intr_1_11:
	setx	0x1e0025, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_5:
	mov	0x13, %r14
	.word 0xf0f38400  ! 171: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbbaa8820  ! 173: FMOVG	fmovs	%fcc1, %f0, %f29
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_12:
	setx	0x1e023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a40940  ! 181: FMULd	fmuld	%f16, %f0, %f26
cpu_intr_1_13:
	setx	0x1d0033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7aa0820  ! 186: FMOVA	fmovs	%fcc1, %f0, %f27
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_14:
	setx	0x1c010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_15:
	setx	0x1d0303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_16:
	setx	0x1f0301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, b)
	.word 0xb6b42131  ! 200: ORNcc_I	orncc 	%r16, 0x0131, %r27
	.word 0xb7ab0820  ! 204: FMOVGU	fmovs	%fcc1, %f0, %f27
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_17:
	setx	0x1f0327, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_6:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 211: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_18:
	setx	0x1f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 213: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbfa98820  ! 215: FMOVNEG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_7:
	mov	0x2, %r14
	.word 0xf2f384a0  ! 217: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_19:
	setx	0x1f0236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, b)
	.word 0xbfa00540  ! 226: FSQRTd	fsqrt	
	.word 0xb9a80c20  ! 227: FMOVRLZ	dis not found

T1_asi_reg_wr_8:
	mov	0x3c2, %r14
	.word 0xf2f38400  ! 228: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_20:
	setx	0x1e0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba409a0  ! 232: FDIVs	fdivs	%f16, %f0, %f29
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 37)
	.word 0xbfa449c0  ! 236: FDIVd	fdivd	%f48, %f0, %f62
	.word 0xbc444000  ! 242: ADDC_R	addc 	%r17, %r0, %r30
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb9a449a0  ! 245: FDIVs	fdivs	%f17, %f0, %f28
	.word 0xbba84820  ! 246: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a58820  ! 252: FADDs	fadds	%f22, %f0, %f28
	.word 0xbda88820  ! 253: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb1aa4820  ! 254: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb750c000  ! 257: RDPR_TT	<illegal instruction>
T1_asi_reg_wr_9:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 259: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbfa58840  ! 261: FADDd	faddd	%f22, %f0, %f62
	.word 0xb73cb001  ! 262: SRAX_I	srax	%r18, 0x0001, %r27
	.word 0xb3aac820  ! 263: FMOVGE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_10:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 264: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3a80820  ! 266: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbbaac820  ! 267: FMOVGE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_5:
	mov	0x3c8, %r14
	.word 0xfedb8400  ! 268: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb5a40940  ! 269: FMULd	fmuld	%f16, %f0, %f26
	.word 0xb5a5c9c0  ! 272: FDIVd	fdivd	%f54, %f0, %f26
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 29)
	.word 0xb83d6111  ! 276: XNOR_I	xnor 	%r21, 0x0111, %r28
	.word 0xb9a58820  ! 278: FADDs	fadds	%f22, %f0, %f28
	.word 0xbfa81820  ! 280: FMOVRGZ	fmovs	%fcc3, %f0, %f31
T1_asi_reg_rd_6:
	mov	0x9, %r14
	.word 0xf2db8400  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_21:
	setx	0x1c0015, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_7:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 291: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb5a509e0  ! 293: FDIVq	dis not found

cpu_intr_1_22:
	setx	0x1e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 296: FMOVN	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_11:
	mov	0x2f, %r14
	.word 0xf0f384a0  ! 297: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbab4820  ! 301: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb3ab4820  ! 303: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb3aa4820  ! 304: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb3a40920  ! 305: FMULs	fmuls	%f16, %f0, %f25
	.word 0xb9a00020  ! 307: FMOVs	fmovs	%f0, %f28
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb9a80820  ! 310: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbda5c8e0  ! 313: FSUBq	dis not found

cpu_intr_1_23:
	setx	0x1f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_12:
	mov	0x25, %r14
	.word 0xf2f389e0  ! 316: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_wr_13:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 320: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_wr_14:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 324: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_15:
	mov	0x1b, %r14
	.word 0xfaf38e40  ! 325: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_16:
	mov	0x3c3, %r14
	.word 0xf8f389e0  ! 326: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_wr_17:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 327: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_8:
	mov	0x4, %r14
	.word 0xf4db84a0  ! 329: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb9a00040  ! 332: FMOVd	fmovd	%f0, %f28
T1_asi_reg_wr_18:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 333: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7a00020  ! 335: FMOVs	fmovs	%f0, %f27
cpu_intr_1_24:
	setx	0x1e0108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_25:
	setx	0x1d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa449c0  ! 340: FDIVd	fdivd	%f48, %f0, %f62
	.word 0xbdab0820  ! 341: FMOVGU	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_9:
	mov	0x16, %r14
	.word 0xf0db8e80  ! 344: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb8b58000  ! 345: SUBCcc_R	orncc 	%r22, %r0, %r28
	.word 0xb5a5c840  ! 347: FADDd	faddd	%f54, %f0, %f26
cpu_intr_1_26:
	setx	0x1c0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbab4820  ! 352: FMOVCC	fmovs	%fcc1, %f0, %f29
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_19:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 354: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7a00560  ! 361: FSQRTq	fsqrt	
	.word 0xb1a00560  ! 362: FSQRTq	fsqrt	
cpu_intr_1_27:
	setx	0x1e0117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_28:
	setx	0x1e0103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_29:
	setx	0x1e0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda50940  ! 367: FMULd	fmuld	%f20, %f0, %f30
cpu_intr_1_30:
	setx	0x1f022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_31:
	setx	0x1e0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_10:
	mov	0xd, %r14
	.word 0xf8db8e60  ! 373: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T1_asi_reg_rd_11:
	mov	0x1b, %r14
	.word 0xfcdb89e0  ! 376: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T1_asi_reg_wr_20:
	mov	0x3c6, %r14
	.word 0xf0f384a0  ! 377: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb7a00560  ! 381: FSQRTq	fsqrt	
	.word 0xb82d21e3  ! 383: ANDN_I	andn 	%r20, 0x01e3, %r28
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 16)
	.word 0xbba00540  ! 385: FSQRTd	fsqrt	
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 32)
	.word 0xb21d2029  ! 390: XOR_I	xor 	%r20, 0x0029, %r25
cpu_intr_1_32:
	setx	0x1e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_21:
	mov	0x2f, %r14
	.word 0xf8f389e0  ! 398: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_33:
	setx	0x1f001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_22:
	mov	0x20, %r14
	.word 0xf4f38e60  ! 408: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbda449a0  ! 409: FDIVs	fdivs	%f17, %f0, %f30
T1_asi_reg_wr_23:
	mov	0x3c8, %r14
	.word 0xf8f38e80  ! 411: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbda80820  ! 412: FMOVN	fmovs	%fcc1, %f0, %f30
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_rd_12:
	mov	0x2c, %r14
	.word 0xf6db8400  ! 414: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_wr_24:
	mov	0xf, %r14
	.word 0xfef38e40  ! 415: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb5a00020  ! 416: FMOVs	fmovs	%f0, %f26
T1_asi_reg_rd_13:
	mov	0x10, %r14
	.word 0xfadb89e0  ! 418: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_34:
	setx	0x1e0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48920  ! 427: FMULs	fmuls	%f18, %f0, %f29
cpu_intr_1_35:
	setx	0x1d0237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_36:
	setx	0x1c0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c9c0  ! 432: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xb3ab4820  ! 434: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb89ca02d  ! 435: XORcc_I	xorcc 	%r18, 0x002d, %r28
	.word 0xb5a4c940  ! 436: FMULd	fmuld	%f50, %f0, %f26
T1_asi_reg_wr_25:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 438: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb5a588e0  ! 440: FSUBq	dis not found

iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_37:
	setx	0x1c0016, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_14:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 445: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_38:
	setx	0x1f0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_wr_26:
	mov	0x14, %r14
	.word 0xfaf389e0  ! 449: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_1_39:
	setx	0x1e0129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_15:
	mov	0xa, %r14
	.word 0xf2db8e60  ! 455: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_rd_16:
	mov	0x32, %r14
	.word 0xfadb89e0  ! 456: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_wr_27:
	mov	0x9, %r14
	.word 0xfef384a0  ! 458: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbfa54960  ! 459: FMULq	dis not found

cpu_intr_1_40:
	setx	0x230013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 34)
	.word 0xb5a408e0  ! 465: FSUBq	dis not found

iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 2e)
	.word 0x8194205e  ! 468: WRPR_TPC_I	wrpr	%r16, 0x005e, %tpc
	.word 0xb234c000  ! 471: SUBC_R	orn 	%r19, %r0, %r25
	.word 0xbba5c860  ! 472: FADDq	dis not found

cpu_intr_1_41:
	setx	0x230009, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_28:
	mov	0x3c7, %r14
	.word 0xfef38e60  ! 474: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_wr_29:
	mov	0x25, %r14
	.word 0xf4f38e80  ! 480: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb1a00540  ! 485: FSQRTd	fsqrt	
	.word 0xbda54960  ! 486: FMULq	dis not found

	.word 0xbd7d0400  ! 488: MOVR_R	movre	%r20, %r0, %r30
cpu_intr_1_42:
	setx	0x230327, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_17:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 492: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbda50920  ! 495: FMULs	fmuls	%f20, %f0, %f30
T1_asi_reg_rd_18:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 500: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_43:
	setx	0x230135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23cc000  ! 503: XNOR_R	xnor 	%r19, %r0, %r25
cpu_intr_1_44:
	setx	0x210206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda549a0  ! 508: FDIVs	fdivs	%f21, %f0, %f30
	.word 0xb5a00040  ! 510: FMOVd	fmovd	%f0, %f26
	.word 0xba8c60b2  ! 512: ANDcc_I	andcc 	%r17, 0x00b2, %r29
T1_asi_reg_wr_30:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 514: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb5a44840  ! 516: FADDd	faddd	%f48, %f0, %f26
cpu_intr_1_45:
	setx	0x21021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbe85c000  ! 519: ADDcc_R	addcc 	%r23, %r0, %r31
	.word 0xbda44820  ! 520: FADDs	fadds	%f17, %f0, %f30
	.word 0xba9d6139  ! 524: XORcc_I	xorcc 	%r21, 0x0139, %r29
T1_asi_reg_rd_19:
	mov	0x34, %r14
	.word 0xf8db84a0  ! 530: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, a)
	.word 0xb5a84820  ! 535: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb1ab0820  ! 540: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbc2cc000  ! 541: ANDN_R	andn 	%r19, %r0, %r30
T1_asi_reg_rd_20:
	mov	0x1e, %r14
	.word 0xf2db8e40  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_31:
	mov	0x20, %r14
	.word 0xf0f38e80  ! 543: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a44960  ! 548: FMULq	dis not found

iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_46:
	setx	0x20032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41c4000  ! 555: XOR_R	xor 	%r17, %r0, %r26
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb7a9c820  ! 557: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbfa00520  ! 558: FSQRTs	fsqrt	
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_21:
	mov	0x2e, %r14
	.word 0xf6db8e60  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbbaa4820  ! 565: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb2b40000  ! 573: SUBCcc_R	orncc 	%r16, %r0, %r25
T1_asi_reg_rd_22:
	mov	0x21, %r14
	.word 0xfcdb8e40  ! 574: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_23:
	mov	0x29, %r14
	.word 0xfadb84a0  ! 577: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb1a44940  ! 579: FMULd	fmuld	%f48, %f0, %f24
	.word 0xbeac8000  ! 580: ANDNcc_R	andncc 	%r18, %r0, %r31
	.word 0xb5a80820  ! 584: FMOVN	fmovs	%fcc1, %f0, %f26
cpu_intr_1_47:
	setx	0x210000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_48:
	setx	0x200311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_32:
	mov	0x36, %r14
	.word 0xf0f38e60  ! 598: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_33:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 602: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_34:
	mov	0x21, %r14
	.word 0xf6f389e0  ! 605: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbba40960  ! 608: FMULq	dis not found

iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_49:
	setx	0x22013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 10)
	.word 0xb3a509a0  ! 617: FDIVs	fdivs	%f20, %f0, %f25
cpu_intr_1_50:
	setx	0x200019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 23)
	.word 0xbfabc820  ! 620: FMOVVC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_24:
	mov	0x38, %r14
	.word 0xf0db8e40  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb9a5c9e0  ! 632: FDIVq	dis not found

T1_asi_reg_wr_35:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 637: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbb2c7001  ! 638: SLLX_I	sllx	%r17, 0x0001, %r29
T1_asi_reg_rd_25:
	mov	0x2e, %r14
	.word 0xfcdb8400  ! 640: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_51:
	setx	0x220113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_52:
	setx	0x20013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 644: FSQRTd	fsqrt	
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_53:
	setx	0x230313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa4820  ! 650: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbdaa8820  ! 653: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb53ca001  ! 655: SRA_I	sra 	%r18, 0x0001, %r26
T1_asi_reg_wr_36:
	mov	0x26, %r14
	.word 0xf4f389e0  ! 656: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 25)
	.word 0xbfa409a0  ! 666: FDIVs	fdivs	%f16, %f0, %f31
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_rd_26:
	mov	0x2f, %r14
	.word 0xf2db8e60  ! 671: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbfa549e0  ! 672: FDIVq	dis not found

	.word 0xbbaac820  ! 673: FMOVGE	fmovs	%fcc1, %f0, %f29
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbda98820  ! 676: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbda4c8a0  ! 677: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xb3a00560  ! 678: FSQRTq	fsqrt	
	.word 0xbd520000  ! 679: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 17)
	.word 0xb92ca001  ! 689: SLL_I	sll 	%r18, 0x0001, %r28
	.word 0xbda8c820  ! 691: FMOVL	fmovs	%fcc1, %f0, %f30
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 22)
	.word 0xbda4c9c0  ! 695: FDIVd	fdivd	%f50, %f0, %f30
	.word 0xb5aa4820  ! 698: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a588e0  ! 701: FSUBq	dis not found

	.word 0xbba80420  ! 702: FMOVRZ	dis not found

T1_asi_reg_rd_27:
	mov	0x1b, %r14
	.word 0xfcdb8e40  ! 705: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_54:
	setx	0x21011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa0820  ! 709: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb5a00540  ! 711: FSQRTd	fsqrt	
cpu_intr_1_55:
	setx	0x200012, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_28:
	mov	0x3c5, %r14
	.word 0xf8db89e0  ! 714: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb1346001  ! 715: SRL_I	srl 	%r17, 0x0001, %r24
	.word 0xb53dd000  ! 716: SRAX_R	srax	%r23, %r0, %r26
	.word 0xb3aa8820  ! 717: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbbab4820  ! 718: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb9a00020  ! 719: FMOVs	fmovs	%f0, %f28
cpu_intr_1_56:
	setx	0x22031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 723: FSQRTd	fsqrt	
T1_asi_reg_rd_29:
	mov	0x16, %r14
	.word 0xfedb8e40  ! 724: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_57:
	setx	0x210111, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_37:
	mov	0x2a, %r14
	.word 0xf2f38e40  ! 728: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb6054000  ! 729: ADD_R	add 	%r21, %r0, %r27
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 27)
	.word 0xb7a44920  ! 734: FMULs	fmuls	%f17, %f0, %f27
	.word 0xbc9da12b  ! 736: XORcc_I	xorcc 	%r22, 0x012b, %r30
T1_asi_reg_rd_30:
	mov	0x12, %r14
	.word 0xf6db8400  ! 742: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_wr_38:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 743: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5a00020  ! 744: FMOVs	fmovs	%f0, %f26
cpu_intr_1_58:
	setx	0x230033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 746: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a44860  ! 747: FADDq	dis not found

T1_asi_reg_wr_39:
	mov	0x3c6, %r14
	.word 0xf2f38400  ! 749: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_59:
	setx	0x200124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_60:
	setx	0x200030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 758: FMOVPOS	fmovs	%fcc1, %f0, %f27
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_61:
	setx	0x23000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 766: FSQRTd	fsqrt	
	.word 0xb9a58940  ! 767: FMULd	fmuld	%f22, %f0, %f28
T1_asi_reg_wr_40:
	mov	0x1e, %r14
	.word 0xf8f38e40  ! 768: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb4c5a0c6  ! 770: ADDCcc_I	addccc 	%r22, 0x00c6, %r26
	.word 0xb9ab8820  ! 771: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb3a548c0  ! 777: FSUBd	fsubd	%f52, %f0, %f56
	.word 0xbfabc820  ! 778: FMOVVC	fmovs	%fcc1, %f0, %f31
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 9)
	.word 0xb7a58960  ! 785: FMULq	dis not found

	.word 0xb1343001  ! 786: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xbab560df  ! 788: SUBCcc_I	orncc 	%r21, 0x00df, %r29
cpu_intr_1_62:
	setx	0x23033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 791: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb0840000  ! 792: ADDcc_R	addcc 	%r16, %r0, %r24
	.word 0xb8bc4000  ! 794: XNORcc_R	xnorcc 	%r17, %r0, %r28
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_rd_31:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 798: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb7a449e0  ! 799: FDIVq	dis not found

cpu_intr_1_63:
	setx	0x21030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_64:
	setx	0x230134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_65:
	setx	0x210206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 811: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb1a50820  ! 818: FADDs	fadds	%f20, %f0, %f24
T1_asi_reg_wr_41:
	mov	0x3c2, %r14
	.word 0xfcf384a0  ! 819: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_wr_42:
	mov	0x33, %r14
	.word 0xf4f38e60  ! 821: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_rd_32:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 826: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_66:
	setx	0x230236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 834: FSQRTd	fsqrt	
cpu_intr_1_67:
	setx	0x22020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_68:
	setx	0x23033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_69:
	setx	0x21031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_33:
	mov	0x2f, %r14
	.word 0xfadb89e0  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 18)
	.word 0xb5a00560  ! 867: FSQRTq	fsqrt	
T1_asi_reg_wr_43:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 870: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 19)
	.word 0xba3d8000  ! 876: XNOR_R	xnor 	%r22, %r0, %r29
	.word 0xb5a4c8e0  ! 878: FSUBq	dis not found

cpu_intr_1_70:
	setx	0x220300, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_34:
	mov	0x13, %r14
	.word 0xf0db8400  ! 882: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_71:
	setx	0x23031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_72:
	setx	0x20001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_35:
	mov	0xc, %r14
	.word 0xf0db8e60  ! 888: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbfa00520  ! 890: FSQRTs	fsqrt	
	.word 0xbba54860  ! 891: FADDq	dis not found

	.word 0xb52dd000  ! 892: SLLX_R	sllx	%r23, %r0, %r26
T1_asi_reg_rd_36:
	mov	0x24, %r14
	.word 0xf8db8e80  ! 893: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb1a549a0  ! 895: FDIVs	fdivs	%f21, %f0, %f24
T1_asi_reg_rd_37:
	mov	0x3c1, %r14
	.word 0xf2db8e60  ! 896: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 13)
	.word 0xbda58860  ! 898: FADDq	dis not found

	.word 0xb1a84820  ! 900: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_44:
	mov	0x31, %r14
	.word 0xf0f38e80  ! 901: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_1_73:
	setx	0x210307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_45:
	mov	0x11, %r14
	.word 0xfcf38400  ! 904: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_74:
	setx	0x20031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_38:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 906: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbfaac820  ! 910: FMOVGE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_75:
	setx	0x27002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a98820  ! 915: FMOVNEG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_46:
	mov	0x3c0, %r14
	.word 0xf4f38e60  ! 916: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbdab0820  ! 918: FMOVGU	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, d)
	.word 0xb3a448e0  ! 925: FSUBq	dis not found

	.word 0xb294c000  ! 927: ORcc_R	orcc 	%r19, %r0, %r25
	.word 0xbbaa4820  ! 928: FMOVNE	fmovs	%fcc1, %f0, %f29
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_76:
	setx	0x240039, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_77:
	setx	0x250105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab4820  ! 940: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbd352001  ! 941: SRL_I	srl 	%r20, 0x0001, %r30
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, f)
	.word 0xba9c0000  ! 947: XORcc_R	xorcc 	%r16, %r0, %r29
	.word 0xbfa00560  ! 951: FSQRTq	fsqrt	
cpu_intr_1_78:
	setx	0x250318, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_39:
	mov	0x32, %r14
	.word 0xf0db8e40  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_40:
	mov	0x1, %r14
	.word 0xf2db84a0  ! 958: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbda5c8c0  ! 963: FSUBd	fsubd	%f54, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_79:
	setx	0x27021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_47:
	mov	0xb, %r14
	.word 0xfef38e60  ! 970: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_wr_48:
	mov	0x20, %r14
	.word 0xf6f38e40  ! 978: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 38)
	.word 0xbba00020  ! 985: FMOVs	fmovs	%f0, %f29
	.word 0xb1a00560  ! 988: FSQRTq	fsqrt	
	.word 0xb1a448e0  ! 990: FSUBq	dis not found

iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 17)
	.word 0xb7a00540  ! 995: FSQRTd	fsqrt	
T1_asi_reg_rd_41:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 997: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_80:
	setx	0x270120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_81:
	setx	0x25002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c9c0  ! 1007: FDIVd	fdivd	%f54, %f0, %f60
T1_asi_reg_rd_42:
	mov	0x2e, %r14
	.word 0xfedb8e60  ! 1013: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb4bcc000  ! 1014: XNORcc_R	xnorcc 	%r19, %r0, %r26
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 3)
	.word 0xb5a548e0  ! 1025: FSUBq	dis not found

T1_asi_reg_wr_49:
	mov	0x10, %r14
	.word 0xfef38e80  ! 1027: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3a40840  ! 1034: FADDd	faddd	%f16, %f0, %f56
	.word 0xbda81820  ! 1035: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbfaac820  ! 1036: FMOVGE	fmovs	%fcc1, %f0, %f31
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbfa84820  ! 1038: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a88820  ! 1039: FMOVLE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_82:
	setx	0x260229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb3a80c20  ! 1045: FMOVRLZ	dis not found

	.word 0xbd3d7001  ! 1046: SRAX_I	srax	%r21, 0x0001, %r30
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 25)
	.word 0xb0b4c000  ! 1053: SUBCcc_R	orncc 	%r19, %r0, %r24
	.word 0xb1a488c0  ! 1054: FSUBd	fsubd	%f18, %f0, %f24
T1_asi_reg_wr_50:
	mov	0x34, %r14
	.word 0xf6f38e60  ! 1056: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_1_83:
	setx	0x240026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_84:
	setx	0x25021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81420  ! 1059: FMOVRNZ	dis not found

iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 36)
	.word 0xbba508a0  ! 1066: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xbfa489c0  ! 1069: FDIVd	fdivd	%f18, %f0, %f62
cpu_intr_1_85:
	setx	0x240309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81c20  ! 1071: FMOVRGEZ	dis not found

cpu_intr_1_86:
	setx	0x250017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a54860  ! 1074: FADDq	dis not found

T1_asi_reg_rd_43:
	mov	0x24, %r14
	.word 0xf8db89e0  ! 1075: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_wr_51:
	mov	0x2f, %r14
	.word 0xfcf38e60  ! 1077: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 34)
	.word 0xb7641800  ! 1080: MOVcc_R	<illegal instruction>
	.word 0xb5a98820  ! 1086: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb9a5c920  ! 1087: FMULs	fmuls	%f23, %f0, %f28
cpu_intr_1_87:
	setx	0x25032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 37)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_88:
	setx	0x24033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13c3001  ! 1098: SRAX_I	srax	%r16, 0x0001, %r24
T1_asi_reg_rd_44:
	mov	0x2d, %r14
	.word 0xf4db8e80  ! 1099: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 12)
	.word 0xb23cc000  ! 1111: XNOR_R	xnor 	%r19, %r0, %r25
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_52:
	mov	0x3c3, %r14
	.word 0xf4f389e0  ! 1114: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbfa84820  ! 1118: FMOVE	fmovs	%fcc1, %f0, %f31
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 10)
	.word 0xbbaa4820  ! 1120: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb41d4000  ! 1121: XOR_R	xor 	%r21, %r0, %r26
cpu_intr_1_89:
	setx	0x27022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a54860  ! 1126: FADDq	dis not found

	.word 0xbda5c9a0  ! 1127: FDIVs	fdivs	%f23, %f0, %f30
T1_asi_reg_rd_45:
	mov	0x5, %r14
	.word 0xf6db8e60  ! 1128: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb7a00560  ! 1133: FSQRTq	fsqrt	
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 14)
	.word 0xb3a508c0  ! 1136: FSUBd	fsubd	%f20, %f0, %f56
	.word 0xb3ab0820  ! 1137: FMOVGU	fmovs	%fcc1, %f0, %f25
cpu_intr_1_90:
	setx	0x240331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40820  ! 1140: FADDs	fadds	%f16, %f0, %f25
	.word 0xbfa80820  ! 1143: FMOVN	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_46:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 1145: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1a44860  ! 1148: FADDq	dis not found

T1_asi_reg_wr_53:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 1149: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_rd_47:
	mov	0x11, %r14
	.word 0xf6db8400  ! 1152: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb1a40820  ! 1154: FADDs	fadds	%f16, %f0, %f24
T1_asi_reg_wr_54:
	mov	0x3c5, %r14
	.word 0xf8f384a0  ! 1155: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_91:
	setx	0x27033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_92:
	setx	0x260200, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_48:
	mov	0xd, %r14
	.word 0xfcdb89e0  ! 1162: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbba00540  ! 1167: FSQRTd	fsqrt	
T1_asi_reg_wr_55:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 1170: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 22)
	.word 0xbda00040  ! 1173: FMOVd	fmovd	%f0, %f30
T1_asi_reg_rd_49:
	mov	0x1e, %r14
	.word 0xf8db8400  ! 1177: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb89ce122  ! 1180: XORcc_I	xorcc 	%r19, 0x0122, %r28
	.word 0xbba54820  ! 1185: FADDs	fadds	%f21, %f0, %f29
	.word 0xb1a50940  ! 1187: FMULd	fmuld	%f20, %f0, %f24
cpu_intr_1_93:
	setx	0x260339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_94:
	setx	0x25031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba24c000  ! 1191: SUB_R	sub 	%r19, %r0, %r29
	.word 0xbba58860  ! 1192: FADDq	dis not found

	.word 0xb1aa4820  ! 1194: FMOVNE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_50:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 1195: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb2b5204b  ! 1196: ORNcc_I	orncc 	%r20, 0x004b, %r25
cpu_intr_1_95:
	setx	0x270321, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_56:
	mov	0x5, %r14
	.word 0xf8f38e60  ! 1200: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb5a448a0  ! 1201: FSUBs	fsubs	%f17, %f0, %f26
	.word 0xbba48840  ! 1202: FADDd	faddd	%f18, %f0, %f60
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_57:
	mov	0x1c, %r14
	.word 0xfef38e40  ! 1205: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 33)
	.word 0xbda9c820  ! 1212: FMOVVS	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, a)
	.word 0xbda80820  ! 1218: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
cpu_intr_1_96:
	setx	0x250303, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_51:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 1221: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1a80420  ! 1222: FMOVRZ	dis not found

	.word 0xb3a5c920  ! 1224: FMULs	fmuls	%f23, %f0, %f25
	.word 0xbb357001  ! 1225: SRLX_I	srlx	%r21, 0x0001, %r29
T1_asi_reg_wr_58:
	mov	0x36, %r14
	.word 0xf0f384a0  ! 1227: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_97:
	setx	0x25030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a58820  ! 1242: FADDs	fadds	%f22, %f0, %f25
cpu_intr_1_98:
	setx	0x250216, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_52:
	mov	0x1d, %r14
	.word 0xf4db8400  ! 1246: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 4)
	.word 0xbba81820  ! 1252: FMOVRGZ	fmovs	%fcc3, %f0, %f29
T1_asi_reg_wr_59:
	mov	0x17, %r14
	.word 0xf6f389e0  ! 1254: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbda509e0  ! 1255: FDIVq	dis not found

	.word 0xbba549a0  ! 1257: FDIVs	fdivs	%f21, %f0, %f29
cpu_intr_1_99:
	setx	0x270025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 1260: FSQRTs	fsqrt	
	.word 0xbfa80420  ! 1266: FMOVRZ	dis not found

iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 4)
	.word 0xbda48860  ! 1274: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a80c20  ! 1276: FMOVRLZ	dis not found

cpu_intr_1_100:
	setx	0x250104, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_53:
	mov	0xa, %r14
	.word 0xfcdb89e0  ! 1282: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_101:
	setx	0x27023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_60:
	mov	0x19, %r14
	.word 0xfef38400  ! 1290: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_102:
	setx	0x26020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b40000  ! 1297: SUBCcc_R	orncc 	%r16, %r0, %r24
	.word 0xb3a549c0  ! 1298: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xb7a588e0  ! 1300: FSUBq	dis not found

iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb52ce001  ! 1306: SLL_I	sll 	%r19, 0x0001, %r26
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, a)
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 38)
	.word 0xb0b50000  ! 1313: ORNcc_R	orncc 	%r20, %r0, %r24
T1_asi_reg_wr_61:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 1314: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_103:
	setx	0x270024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa0820  ! 1316: FMOVA	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_62:
	mov	0x10, %r14
	.word 0xf8f384a0  ! 1317: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb1a94820  ! 1319: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a4c860  ! 1320: FADDq	dis not found

cpu_intr_1_104:
	setx	0x27033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 19)
	.word 0xb7a81820  ! 1325: FMOVRGZ	fmovs	%fcc3, %f0, %f27
T1_asi_reg_wr_63:
	mov	0x20, %r14
	.word 0xf4f38e40  ! 1326: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_54:
	mov	0x3c6, %r14
	.word 0xfcdb8400  ! 1330: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_rd_55:
	mov	0x16, %r14
	.word 0xf6db8e40  ! 1337: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9a00560  ! 1338: FSQRTq	fsqrt	
	.word 0xbfa488c0  ! 1341: FSUBd	fsubd	%f18, %f0, %f62
cpu_intr_1_105:
	setx	0x130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 1345: FMOVA	fmovs	%fcc1, %f0, %f26
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_106:
	setx	0x27023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a40920  ! 1353: FMULs	fmuls	%f16, %f0, %f27
	.word 0xbba84820  ! 1354: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb2c5e0c3  ! 1355: ADDCcc_I	addccc 	%r23, 0x00c3, %r25
cpu_intr_1_107:
	setx	0x250103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_108:
	setx	0x270221, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_56:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 1371: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_109:
	setx	0x24012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa44920  ! 1377: FMULs	fmuls	%f17, %f0, %f31
cpu_intr_1_110:
	setx	0x250324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 1383: FMOVG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_111:
	setx	0x250203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb5a409e0  ! 1389: FDIVq	dis not found

	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_112:
	setx	0x270016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 1397: FMOVLEU	fmovs	%fcc1, %f0, %f31
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbda90820  ! 1401: FMOVLEU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_113:
	setx	0x28001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3347001  ! 1404: SRLX_I	srlx	%r17, 0x0001, %r25
T1_asi_reg_rd_57:
	mov	0x16, %r14
	.word 0xf2db8e40  ! 1405: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb7a50820  ! 1406: FADDs	fadds	%f20, %f0, %f27
T1_asi_reg_wr_64:
	mov	0x2c, %r14
	.word 0xf6f38e80  ! 1407: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbcb48000  ! 1408: SUBCcc_R	orncc 	%r18, %r0, %r30
	.word 0xb5a549e0  ! 1409: FDIVq	dis not found

T1_asi_reg_rd_58:
	mov	0x35, %r14
	.word 0xf2db8400  ! 1410: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbda548a0  ! 1411: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xbbab0820  ! 1414: FMOVGU	fmovs	%fcc1, %f0, %f29
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_59:
	mov	0x2, %r14
	.word 0xf4db8e80  ! 1418: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_rd_60:
	mov	0x27, %r14
	.word 0xf2db8e40  ! 1421: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_114:
	setx	0x280137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_115:
	setx	0x280231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 1435: FMOVNEG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_61:
	mov	0x31, %r14
	.word 0xfedb89e0  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbfa81820  ! 1439: FMOVRGZ	fmovs	%fcc3, %f0, %f31
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_wr_65:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 1446: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_66:
	mov	0x2e, %r14
	.word 0xf8f384a0  ! 1448: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a00560  ! 1454: FSQRTq	fsqrt	
	.word 0xb8b54000  ! 1455: ORNcc_R	orncc 	%r21, %r0, %r28
	.word 0x879460a9  ! 1457: WRPR_TT_I	wrpr	%r17, 0x00a9, %tt
	.word 0xbaa56199  ! 1458: SUBcc_I	subcc 	%r21, 0x0199, %r29
T1_asi_reg_rd_62:
	mov	0x20, %r14
	.word 0xf6db8e80  ! 1459: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_116:
	setx	0x29003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b58000  ! 1461: SUBCcc_R	orncc 	%r22, %r0, %r25
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 32)
	.word 0xbc3560fe  ! 1479: SUBC_I	orn 	%r21, 0x00fe, %r30
	.word 0xbba408e0  ! 1480: FSUBq	dis not found

T1_asi_reg_wr_67:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 1481: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_117:
	setx	0x2a0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab0820  ! 1487: FMOVGU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_118:
	setx	0x2a0218, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_63:
	mov	0x1a, %r14
	.word 0xf2db8400  ! 1492: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 12)
	.word 0xb9a4c9a0  ! 1494: FDIVs	fdivs	%f19, %f0, %f28
	.word 0xb7a00040  ! 1495: FMOVd	fmovd	%f0, %f58
	.word 0xbfa90820  ! 1496: FMOVLEU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_119:
	setx	0x28030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 2)
	.word 0xbfa00520  ! 1504: FSQRTs	fsqrt	
	.word 0xbda548a0  ! 1506: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xbba4c860  ! 1512: FADDq	dis not found

T1_asi_reg_wr_68:
	mov	0x23, %r14
	.word 0xfaf38400  ! 1516: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_120:
	setx	0x280327, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_69:
	mov	0x19, %r14
	.word 0xfcf389e0  ! 1524: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb9a81420  ! 1525: FMOVRNZ	dis not found

T1_asi_reg_wr_70:
	mov	0x25, %r14
	.word 0xf2f389e0  ! 1526: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbda81420  ! 1529: FMOVRNZ	dis not found

	.word 0xb415a025  ! 1530: OR_I	or 	%r22, 0x0025, %r26
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_64:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbda84820  ! 1537: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xbea56125  ! 1539: SUBcc_I	subcc 	%r21, 0x0125, %r31
cpu_intr_1_121:
	setx	0x280027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_122:
	setx	0x290309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_123:
	setx	0x29001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa4820  ! 1548: FMOVNE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_71:
	mov	0x3c1, %r14
	.word 0xf6f38400  ! 1551: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_124:
	setx	0x29032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aac820  ! 1553: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb43c4000  ! 1554: XNOR_R	xnor 	%r17, %r0, %r26
	.word 0xbe348000  ! 1556: ORN_R	orn 	%r18, %r0, %r31
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_wr_72:
	mov	0x1, %r14
	.word 0xf0f389e0  ! 1558: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbfa408a0  ! 1561: FSUBs	fsubs	%f16, %f0, %f31
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 32)
	.word 0xbfa80420  ! 1566: FMOVRZ	dis not found

	.word 0xbfab0820  ! 1567: FMOVGU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_65:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 1568: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 36)
	.word 0xb3a00520  ! 1579: FSQRTs	fsqrt	
	.word 0xbf2d7001  ! 1581: SLLX_I	sllx	%r21, 0x0001, %r31
T1_asi_reg_rd_66:
	mov	0x32, %r14
	.word 0xfedb8e40  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_125:
	setx	0x2b0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 1589: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb57d6401  ! 1593: MOVR_I	movre	%r21, 0x1, %r26
	.word 0xbfa00540  ! 1595: FSQRTd	fsqrt	
	.word 0xb5a58860  ! 1596: FADDq	dis not found

T1_asi_reg_wr_73:
	mov	0x8, %r14
	.word 0xf8f384a0  ! 1601: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_rd_67:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 1603: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_126:
	setx	0x2b011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 1605: FMOVE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_127:
	setx	0x29003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_68:
	mov	0x2e, %r14
	.word 0xfcdb89e0  ! 1609: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb1a8c820  ! 1611: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb1a48940  ! 1614: FMULd	fmuld	%f18, %f0, %f24
cpu_intr_1_128:
	setx	0x2b0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 1617: FSQRTd	fsqrt	
cpu_intr_1_129:
	setx	0x290024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a488c0  ! 1620: FSUBd	fsubd	%f18, %f0, %f28
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 35)
	.word 0xbba449c0  ! 1623: FDIVd	fdivd	%f48, %f0, %f60
T1_asi_reg_rd_69:
	mov	0x2a, %r14
	.word 0xf0db89e0  ! 1625: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb3a50960  ! 1626: FMULq	dis not found

	.word 0xb97c2401  ! 1629: MOVR_I	movre	%r16, 0x1, %r28
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_wr_74:
	mov	0x36, %r14
	.word 0xfaf38400  ! 1635: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_wr_75:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 1641: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb9a409e0  ! 1642: FDIVq	dis not found

iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_130:
	setx	0x2a012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_76:
	mov	0xb, %r14
	.word 0xfcf38400  ! 1650: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_wr_77:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 1651: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_131:
	setx	0x28030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80c20  ! 1657: FMOVRLZ	dis not found

iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_132:
	setx	0x2a0122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_133:
	setx	0x280317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_70:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 1668: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T1_asi_reg_rd_71:
	mov	0x2a, %r14
	.word 0xfadb84a0  ! 1669: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_wr_78:
	mov	0x2b, %r14
	.word 0xf0f389e0  ! 1672: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 3c)
	.word 0xa1902000  ! 1681: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xb1a50920  ! 1683: FMULs	fmuls	%f20, %f0, %f24
T1_asi_reg_rd_72:
	mov	0x1e, %r14
	.word 0xfedb8e60  ! 1685: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7ab4820  ! 1688: FMOVCC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_134:
	setx	0x2a0322, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_73:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 1693: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_74:
	mov	0x28, %r14
	.word 0xf4db8e40  ! 1695: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_79:
	mov	0x3c7, %r14
	.word 0xf6f38400  ! 1697: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb9a98820  ! 1700: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_135:
	setx	0x2a0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 1704: FMOVNEG	fmovs	%fcc1, %f0, %f30
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbba9c820  ! 1719: FMOVVS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_136:
	setx	0x280309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594600a  ! 1721: WRPR_TSTATE_I	wrpr	%r17, 0x000a, %tstate
cpu_intr_1_137:
	setx	0x290332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c9e0  ! 1726: FDIVq	dis not found

	.word 0xbda80c20  ! 1731: FMOVRLZ	dis not found

	.word 0xb6acc000  ! 1733: ANDNcc_R	andncc 	%r19, %r0, %r27
	.word 0xb4c5e07c  ! 1742: ADDCcc_I	addccc 	%r23, 0x007c, %r26
cpu_intr_1_138:
	setx	0x2a0308, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_75:
	mov	0x17, %r14
	.word 0xfadb8e40  ! 1746: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1a548e0  ! 1747: FSUBq	dis not found

T1_asi_reg_rd_76:
	mov	0x3c0, %r14
	.word 0xfedb84a0  ! 1748: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbfa508c0  ! 1752: FSUBd	fsubd	%f20, %f0, %f62
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_80:
	mov	0x2b, %r14
	.word 0xf2f38e80  ! 1759: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbba58940  ! 1760: FMULd	fmuld	%f22, %f0, %f60
	.word 0xb7a81c20  ! 1761: FMOVRGEZ	dis not found

T1_asi_reg_wr_81:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 1762: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 19)
	.word 0xb634e050  ! 1765: ORN_I	orn 	%r19, 0x0050, %r27
T1_asi_reg_wr_82:
	mov	0x2e, %r14
	.word 0xf8f38e80  ! 1770: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0x919520a4  ! 1773: WRPR_PIL_I	wrpr	%r20, 0x00a4, %pil
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_rd_77:
	mov	0x2e, %r14
	.word 0xf8db8e80  ! 1777: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbfa448c0  ! 1779: FSUBd	fsubd	%f48, %f0, %f62
cpu_intr_1_139:
	setx	0x2a0123, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_78:
	mov	0x12, %r14
	.word 0xf4db84a0  ! 1783: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb1a84820  ! 1785: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_79:
	mov	0x9, %r14
	.word 0xf6db8e60  ! 1790: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_140:
	setx	0x2a0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2ca0af  ! 1792: ANDN_I	andn 	%r18, 0x00af, %r29
	.word 0xb3a90820  ! 1794: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbba50820  ! 1796: FADDs	fadds	%f20, %f0, %f29
	.word 0xbda4c8e0  ! 1798: FSUBq	dis not found

iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_141:
	setx	0x2a022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_142:
	setx	0x28021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 1811: FMOVA	fmovs	%fcc1, %f0, %f26
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb5a58860  ! 1817: FADDq	dis not found

iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_80:
	mov	0x3c1, %r14
	.word 0xf2db84a0  ! 1820: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3353001  ! 1822: SRLX_I	srlx	%r20, 0x0001, %r25
	.word 0xb32dd000  ! 1823: SLLX_R	sllx	%r23, %r0, %r25
	.word 0xbba00040  ! 1824: FMOVd	fmovd	%f0, %f60
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, f)
	.word 0xbda00540  ! 1827: FSQRTd	fsqrt	
	.word 0xbba4c940  ! 1828: FMULd	fmuld	%f50, %f0, %f60
	.word 0xb9aa4820  ! 1829: FMOVNE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_143:
	setx	0x2b001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_83:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 1832: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_1_144:
	setx	0x2f0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_81:
	mov	0x4, %r14
	.word 0xf8db8e40  ! 1839: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1a489a0  ! 1841: FDIVs	fdivs	%f18, %f0, %f24
cpu_intr_1_145:
	setx	0x2d0106, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_84:
	mov	0x3c1, %r14
	.word 0xfaf38e60  ! 1852: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbba54920  ! 1855: FMULs	fmuls	%f21, %f0, %f29
	.word 0xb9a40840  ! 1857: FADDd	faddd	%f16, %f0, %f28
T1_asi_reg_rd_82:
	mov	0x0, %r14
	.word 0xfcdb84a0  ! 1862: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbfa58960  ! 1864: FMULq	dis not found

T1_asi_reg_rd_83:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 1865: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_146:
	setx	0x2c0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd357001  ! 1870: SRLX_I	srlx	%r21, 0x0001, %r30
cpu_intr_1_147:
	setx	0x2e0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80420  ! 1872: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc050000  ! 1877: ADD_R	add 	%r20, %r0, %r30
	.word 0xbda589c0  ! 1881: FDIVd	fdivd	%f22, %f0, %f30
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_148:
	setx	0x2c0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a58920  ! 1887: FMULs	fmuls	%f22, %f0, %f25
	.word 0xb7a48820  ! 1888: FADDs	fadds	%f18, %f0, %f27
	.word 0xbca4e15d  ! 1890: SUBcc_I	subcc 	%r19, 0x015d, %r30
cpu_intr_1_149:
	setx	0x2f0217, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_85:
	mov	0x31, %r14
	.word 0xf0f38e80  ! 1892: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb3ab4820  ! 1893: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbabca1f8  ! 1895: XNORcc_I	xnorcc 	%r18, 0x01f8, %r29
	.word 0xbda4c9e0  ! 1896: FDIVq	dis not found

cpu_intr_1_150:
	setx	0x2d022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_151:
	setx	0x2e0326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 13)
	.word 0xb9a00520  ! 1901: FSQRTs	fsqrt	
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 38)
	.word 0xb7ab0820  ! 1909: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb9a489c0  ! 1911: FDIVd	fdivd	%f18, %f0, %f28
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb7ab8820  ! 1913: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb7aac820  ! 1915: FMOVGE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_86:
	mov	0x25, %r14
	.word 0xf4f38e60  ! 1916: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_wr_87:
	mov	0x16, %r14
	.word 0xfcf384a0  ! 1919: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_1_152:
	setx	0x2e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_88:
	mov	0x15, %r14
	.word 0xf6f38400  ! 1921: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_153:
	setx	0x2e003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c840  ! 1930: FADDd	faddd	%f50, %f0, %f26
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_89:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 1937: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_84:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 1938: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb9aac820  ! 1939: FMOVGE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_85:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 1941: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1a50960  ! 1943: FMULq	dis not found

	.word 0x8f902002  ! 1949: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xb5a80c20  ! 1951: FMOVRLZ	dis not found

iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb9a4c840  ! 1953: FADDd	faddd	%f50, %f0, %f28
	.word 0xbba94820  ! 1955: FMOVCS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_154:
	setx	0x2c031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_90:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 1957: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb5520000  ! 1958: RDPR_PIL	<illegal instruction>
	.word 0xb3a00040  ! 1960: FMOVd	fmovd	%f0, %f56
cpu_intr_1_155:
	setx	0x2f0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 1963: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
cpu_intr_1_156:
	setx	0x2e0211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_157:
	setx	0x2c0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9d610c  ! 1968: XORcc_I	xorcc 	%r21, 0x010c, %r30
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb5a90820  ! 1973: FMOVLEU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_158:
	setx	0x2d0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb814a032  ! 1976: OR_I	or 	%r18, 0x0032, %r28
cpu_intr_1_159:
	setx	0x2e010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb935d000  ! 1978: SRLX_R	srlx	%r23, %r0, %r28
T1_asi_reg_rd_86:
	mov	0x18, %r14
	.word 0xf0db8e80  ! 1984: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb5ab8820  ! 1985: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb3ab4820  ! 1987: FMOVCC	fmovs	%fcc1, %f0, %f25
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_160:
	setx	0x2e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a98820  ! 1991: FMOVNEG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_87:
	mov	0x37, %r14
	.word 0xfadb84a0  ! 1992: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_1_161:
	setx	0x2d0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 1995: FMOVRGEZ	dis not found

	.word 0xbfa508a0  ! 1996: FSUBs	fsubs	%f20, %f0, %f31
	.word 0xbcbce1ff  ! 1998: XNORcc_I	xnorcc 	%r19, 0x01ff, %r30
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, a)
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 11)
	.word 0xb3ab4820  ! 2003: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb5a449c0  ! 2005: FDIVd	fdivd	%f48, %f0, %f26
cpu_intr_1_162:
	setx	0x2d012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba90820  ! 2009: FMOVLEU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_163:
	setx	0x2e0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_91:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 2018: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_rd_88:
	mov	0x2e, %r14
	.word 0xf4db84a0  ! 2020: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7504000  ! 2022: RDPR_TNPC	<illegal instruction>
cpu_intr_1_164:
	setx	0x2d003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_89:
	mov	0x2d, %r14
	.word 0xf8db8400  ! 2025: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T1_asi_reg_rd_90:
	mov	0x4, %r14
	.word 0xf2db8e40  ! 2027: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 39)
	.word 0x8f902002  ! 2033: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xbbabc820  ! 2036: FMOVVC	fmovs	%fcc1, %f0, %f29
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb9ab0820  ! 2043: FMOVGU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_91:
	mov	0x1f, %r14
	.word 0xfadb8400  ! 2044: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 11)
	.word 0xb3aa4820  ! 2051: FMOVNE	fmovs	%fcc1, %f0, %f25
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_165:
	setx	0x2d0218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_166:
	setx	0x2f0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c8a0  ! 2068: FSUBs	fsubs	%f23, %f0, %f29
T1_asi_reg_rd_92:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 2072: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_1_167:
	setx	0x2f0306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_168:
	setx	0x2e011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa4820  ! 2079: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a80420  ! 2080: FMOVRZ	dis not found

iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_169:
	setx	0x2c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 2084: FSQRTs	fsqrt	
cpu_intr_1_170:
	setx	0x2d003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 2090: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbe35a1b3  ! 2094: ORN_I	orn 	%r22, 0x01b3, %r31
	.word 0xb3a548e0  ! 2095: FSUBq	dis not found

	.word 0xb7a48920  ! 2097: FMULs	fmuls	%f18, %f0, %f27
	.word 0xb2c52186  ! 2101: ADDCcc_I	addccc 	%r20, 0x0186, %r25
T1_asi_reg_rd_93:
	mov	0x3c8, %r14
	.word 0xf0db89e0  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, e)
	.word 0xbba54840  ! 2107: FADDd	faddd	%f52, %f0, %f60
	.word 0xb81cc000  ! 2108: XOR_R	xor 	%r19, %r0, %r28
	.word 0xb7aac820  ! 2109: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a00520  ! 2111: FSQRTs	fsqrt	
	.word 0xbfa00560  ! 2113: FSQRTq	fsqrt	
	.word 0xb4b44000  ! 2116: SUBCcc_R	orncc 	%r17, %r0, %r26
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 14)
	.word 0xb7a88820  ! 2120: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a80820  ! 2121: FMOVN	fmovs	%fcc1, %f0, %f25
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb9a80820  ! 2126: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb3a80820  ! 2134: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbfab8820  ! 2138: FMOVPOS	fmovs	%fcc1, %f0, %f31
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 3)
	.word 0xb9a88820  ! 2140: FMOVLE	fmovs	%fcc1, %f0, %f28
	lda	[%r23 + %g0] 0xf0, %f2
cpu_intr_1_171:
	setx	0x2c012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 2144: FSQRTq	fsqrt	
T1_asi_reg_wr_92:
	mov	0x23, %r14
	.word 0xf8f384a0  ! 2145: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb6244000  ! 2147: SUB_R	sub 	%r17, %r0, %r27
	.word 0xb7359000  ! 2151: SRLX_R	srlx	%r22, %r0, %r27
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_172:
	setx	0x2d0219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_173:
	setx	0x2c022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 2158: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb7a5c920  ! 2159: FMULs	fmuls	%f23, %f0, %f27
	.word 0xb7a9c820  ! 2160: FMOVVS	fmovs	%fcc1, %f0, %f27
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 13)
	.word 0xbba80820  ! 2166: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbda40820  ! 2169: FADDs	fadds	%f16, %f0, %f30
T1_asi_reg_rd_94:
	mov	0x13, %r14
	.word 0xf6db8e40  ! 2170: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9480000  ! 2171: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
T1_asi_reg_wr_93:
	mov	0x10, %r14
	.word 0xf0f38e80  ! 2172: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_1_174:
	setx	0x2c0324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_175:
	setx	0x2f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_176:
	setx	0x2d0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_177:
	setx	0x2d0116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_178:
	setx	0x2f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_179:
	setx	0x2f0008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_180:
	setx	0x2c001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda488c0  ! 2200: FSUBd	fsubd	%f18, %f0, %f30
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_181:
	setx	0x2f0318, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_95:
	mov	0x1e, %r14
	.word 0xf2db84a0  ! 2205: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbfa81420  ! 2207: FMOVRNZ	dis not found

iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb2058000  ! 2215: ADD_R	add 	%r22, %r0, %r25
	.word 0xb7a5c9c0  ! 2218: FDIVd	fdivd	%f54, %f0, %f58
	.word 0xb6352113  ! 2219: SUBC_I	orn 	%r20, 0x0113, %r27
T1_asi_reg_rd_96:
	mov	0x29, %r14
	.word 0xfadb8e60  ! 2222: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0x8f902000  ! 2226: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
T1_asi_reg_rd_97:
	mov	0x1f, %r14
	.word 0xf4db8e40  ! 2227: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_94:
	mov	0x7, %r14
	.word 0xf8f38e80  ! 2234: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb6ad0000  ! 2235: ANDNcc_R	andncc 	%r20, %r0, %r27
T1_asi_reg_rd_98:
	mov	0x38, %r14
	.word 0xf4db84a0  ! 2236: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7a409a0  ! 2237: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb9a5c8e0  ! 2239: FSUBq	dis not found

cpu_intr_1_182:
	setx	0x2c023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_95:
	mov	0x10, %r14
	.word 0xfcf38e40  ! 2244: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_99:
	mov	0x30, %r14
	.word 0xfcdb8e40  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_183:
	setx	0x2e0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 2256: FSQRTs	fsqrt	
cpu_intr_1_184:
	setx	0x2f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a548c0  ! 2259: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xb3a80420  ! 2260: FMOVRZ	dis not found

	.word 0xb5a84820  ! 2262: FMOVE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_96:
	mov	0x23, %r14
	.word 0xf0f384a0  ! 2264: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbda80c20  ! 2267: FMOVRLZ	dis not found

	.word 0xb9a90820  ! 2271: FMOVLEU	fmovs	%fcc1, %f0, %f28
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 23)
	.word 0xbfab4820  ! 2276: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb92d3001  ! 2278: SLLX_I	sllx	%r20, 0x0001, %r28
cpu_intr_1_185:
	setx	0x2f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80c20  ! 2286: FMOVRLZ	dis not found

T1_asi_reg_wr_97:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 2292: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbfa489a0  ! 2294: FDIVs	fdivs	%f18, %f0, %f31
T1_asi_reg_wr_98:
	mov	0x22, %r14
	.word 0xf0f38e40  ! 2297: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3a00520  ! 2298: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_100:
	mov	0x2d, %r14
	.word 0xfadb8400  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbba00020  ! 2306: FMOVs	fmovs	%f0, %f29
T1_asi_reg_wr_99:
	mov	0x1c, %r14
	.word 0xfef38e40  ! 2309: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb20d8000  ! 2311: AND_R	and 	%r22, %r0, %r25
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_101:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 2314: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_186:
	setx	0x300106, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_102:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 2323: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_187:
	setx	0x31021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_188:
	setx	0x30022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 2330: FSQRTq	fsqrt	
T1_asi_reg_rd_103:
	mov	0x1c, %r14
	.word 0xfedb8e40  ! 2332: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 20)
	.word 0xbfa00560  ! 2340: FSQRTq	fsqrt	
T1_asi_reg_wr_100:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 2342: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_189:
	setx	0x330310, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_101:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 2344: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb5a5c9a0  ! 2349: FDIVs	fdivs	%f23, %f0, %f26
	.word 0xb7a00020  ! 2351: FMOVs	fmovs	%f0, %f27
	.word 0xb1a5c840  ! 2353: FADDd	faddd	%f54, %f0, %f24
	.word 0xb12d0000  ! 2354: SLL_R	sll 	%r20, %r0, %r24
	.word 0xb9a48820  ! 2355: FADDs	fadds	%f18, %f0, %f28
	.word 0xbe3561a4  ! 2357: SUBC_I	orn 	%r21, 0x01a4, %r31
	.word 0xb1a548a0  ! 2358: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xb7aac820  ! 2363: FMOVGE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_190:
	setx	0x31033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_104:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 2365: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb52c4000  ! 2368: SLL_R	sll 	%r17, %r0, %r26
cpu_intr_1_191:
	setx	0x300305, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_105:
	mov	0x15, %r14
	.word 0xf8db8e40  ! 2377: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1ab0820  ! 2379: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbfa4c920  ! 2382: FMULs	fmuls	%f19, %f0, %f31
T1_asi_reg_rd_106:
	mov	0x16, %r14
	.word 0xf4db89e0  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_rd_107:
	mov	0x26, %r14
	.word 0xfcdb8e60  ! 2387: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_108:
	mov	0xb, %r14
	.word 0xf6db8e80  ! 2394: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_rd_109:
	mov	0x3c2, %r14
	.word 0xf8db84a0  ! 2396: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbd7c2401  ! 2397: MOVR_I	movre	%r16, 0x1, %r30
cpu_intr_1_192:
	setx	0x300224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b4e0cd  ! 2403: ORNcc_I	orncc 	%r19, 0x00cd, %r24
	.word 0xbda81c20  ! 2405: FMOVRGEZ	dis not found

cpu_intr_1_193:
	setx	0x300324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54840  ! 2407: FADDd	faddd	%f52, %f0, %f30
	.word 0xb9a549c0  ! 2410: FDIVd	fdivd	%f52, %f0, %f28
T1_asi_reg_wr_102:
	mov	0x17, %r14
	.word 0xfef38400  ! 2411: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbfa98820  ! 2415: FMOVNEG	fmovs	%fcc1, %f0, %f31
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_194:
	setx	0x30013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3d2001  ! 2424: SRA_I	sra 	%r20, 0x0001, %r31
	.word 0xb9a50940  ! 2428: FMULd	fmuld	%f20, %f0, %f28
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 6)
	.word 0xb5a90820  ! 2433: FMOVLEU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_195:
	setx	0x310109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 2435: FMOVRZ	dis not found

cpu_intr_1_196:
	setx	0x31012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_197:
	setx	0x30033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81820  ! 2446: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbfa00560  ! 2447: FSQRTq	fsqrt	
T1_asi_reg_rd_110:
	mov	0x3c6, %r14
	.word 0xf8db8e80  ! 2449: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_1_198:
	setx	0x320013, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_103:
	mov	0x0, %r14
	.word 0xf6f38e80  ! 2455: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_199:
	setx	0x300238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb3a98820  ! 2462: FMOVNEG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_104:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 2463: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_rd_111:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 2464: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb8b4a0a8  ! 2465: ORNcc_I	orncc 	%r18, 0x00a8, %r28
	.word 0xbba44960  ! 2466: FMULq	dis not found

T1_asi_reg_wr_105:
	mov	0x1f, %r14
	.word 0xf6f38400  ! 2468: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_200:
	setx	0x300112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 2472: FSQRTq	fsqrt	
	.word 0xb9a408e0  ! 2473: FSUBq	dis not found

	.word 0xb3a489a0  ! 2474: FDIVs	fdivs	%f18, %f0, %f25
	.word 0xb5a88820  ! 2477: FMOVLE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_201:
	setx	0x300208, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_112:
	mov	0xd, %r14
	.word 0xfedb8e60  ! 2481: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb3a50860  ! 2483: FADDq	dis not found

	.word 0xbda81820  ! 2484: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb1a589c0  ! 2486: FDIVd	fdivd	%f22, %f0, %f24
	.word 0xbd2c8000  ! 2487: SLL_R	sll 	%r18, %r0, %r30
	.word 0xbbaac820  ! 2488: FMOVGE	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_106:
	mov	0x38, %r14
	.word 0xf4f384a0  ! 2494: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbda80c20  ! 2496: FMOVRLZ	dis not found

cpu_intr_1_202:
	setx	0x31020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58960  ! 2499: FMULq	dis not found

	.word 0xb7a58920  ! 2500: FMULs	fmuls	%f22, %f0, %f27
cpu_intr_1_203:
	setx	0x30023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 2506: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbfab4820  ! 2516: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb5a54940  ! 2517: FMULd	fmuld	%f52, %f0, %f26
T1_asi_reg_rd_113:
	mov	0xd, %r14
	.word 0xf2db8e40  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_204:
	setx	0x330215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_205:
	setx	0x30013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, c)
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 24)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_107:
	mov	0x1d, %r14
	.word 0xf4f38400  ! 2542: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_wr_108:
	mov	0x8, %r14
	.word 0xfaf38e40  ! 2544: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_114:
	mov	0xd, %r14
	.word 0xf0db84a0  ! 2547: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_206:
	setx	0x300223, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb68da0a4  ! 2556: ANDcc_I	andcc 	%r22, 0x00a4, %r27
	.word 0xb7a81420  ! 2558: FMOVRNZ	dis not found

	.word 0xba1c0000  ! 2560: XOR_R	xor 	%r16, %r0, %r29
T1_asi_reg_rd_115:
	mov	0x11, %r14
	.word 0xfadb89e0  ! 2563: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb6bca07a  ! 2568: XNORcc_I	xnorcc 	%r18, 0x007a, %r27
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_207:
	setx	0x310231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_208:
	setx	0x330019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c9c0  ! 2576: FDIVd	fdivd	%f54, %f0, %f58
	.word 0xbda00040  ! 2578: FMOVd	fmovd	%f0, %f30
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_209:
	setx	0x320020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba448c0  ! 2588: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xb3a00540  ! 2589: FSQRTd	fsqrt	
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb5a548e0  ! 2592: FSUBq	dis not found

	.word 0xb5a00540  ! 2593: FSQRTd	fsqrt	
cpu_intr_1_210:
	setx	0x30033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a509e0  ! 2598: FDIVq	dis not found

	.word 0xbda88820  ! 2600: FMOVLE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_211:
	setx	0x300210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 7)
	.word 0xbba80820  ! 2606: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbda00560  ! 2607: FSQRTq	fsqrt	
T1_asi_reg_wr_109:
	mov	0x38, %r14
	.word 0xf6f38e40  ! 2609: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_116:
	mov	0x20, %r14
	.word 0xf4db8e40  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_212:
	setx	0x310306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_213:
	setx	0x31003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_214:
	setx	0x320200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00020  ! 2615: FMOVs	fmovs	%f0, %f30
	.word 0xb92d7001  ! 2618: SLLX_I	sllx	%r21, 0x0001, %r28
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbba80820  ! 2620: FMOVN	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_215:
	setx	0x320023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba85a1f6  ! 2632: ADDcc_I	addcc 	%r22, 0x01f6, %r29
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 33)
	.word 0xb6b44000  ! 2638: ORNcc_R	orncc 	%r17, %r0, %r27
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_110:
	mov	0x1f, %r14
	.word 0xf0f38400  ! 2640: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_rd_117:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 2644: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb3a00520  ! 2646: FSQRTs	fsqrt	
	.word 0xb624e1f7  ! 2647: SUB_I	sub 	%r19, 0x01f7, %r27
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_rd_118:
	mov	0x0, %r14
	.word 0xfadb8e80  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_216:
	setx	0x33011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8ad208d  ! 2661: ANDNcc_I	andncc 	%r20, 0x008d, %r28
	.word 0xb7a44940  ! 2663: FMULd	fmuld	%f48, %f0, %f58
	.word 0xb1a50960  ! 2664: FMULq	dis not found

cpu_intr_1_217:
	setx	0x310030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81820  ! 2666: FMOVRGZ	fmovs	%fcc3, %f0, %f26
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_111:
	mov	0x1e, %r14
	.word 0xf8f38e40  ! 2671: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_218:
	setx	0x320004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a548a0  ! 2676: FSUBs	fsubs	%f21, %f0, %f27
cpu_intr_1_219:
	setx	0x320138, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_119:
	mov	0x14, %r14
	.word 0xf6db8e40  ! 2681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb8858000  ! 2684: ADDcc_R	addcc 	%r22, %r0, %r28
	.word 0xb6252161  ! 2688: SUB_I	sub 	%r20, 0x0161, %r27
	.word 0xb1a549c0  ! 2689: FDIVd	fdivd	%f52, %f0, %f24
T1_asi_reg_rd_120:
	mov	0x15, %r14
	.word 0xfcdb89e0  ! 2690: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T1_asi_reg_rd_121:
	mov	0x17, %r14
	.word 0xf6db8e80  ! 2691: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_wr_112:
	mov	0xe, %r14
	.word 0xf6f38e40  ! 2692: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_122:
	mov	0x6, %r14
	.word 0xfcdb8e80  ! 2697: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbba5c860  ! 2699: FADDq	dis not found

	.word 0xb5a00040  ! 2707: FMOVd	fmovd	%f0, %f26
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 35)
	.word 0xb3a54860  ! 2712: FADDq	dis not found

	.word 0xb9ab0820  ! 2714: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbda589e0  ! 2715: FDIVq	dis not found

	.word 0xb1a409e0  ! 2717: FDIVq	dis not found

iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, b)
	.word 0xb40da0ca  ! 2722: AND_I	and 	%r22, 0x00ca, %r26
	.word 0xb9a81c20  ! 2723: FMOVRGEZ	dis not found

	.word 0xbb34c000  ! 2729: SRL_R	srl 	%r19, %r0, %r29
cpu_intr_1_220:
	setx	0x330026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 2733: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb17d6401  ! 2736: MOVR_I	movre	%r21, 0x1, %r24
cpu_intr_1_221:
	setx	0x320308, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_123:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 2740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_222:
	setx	0x31000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13d4000  ! 2743: SRA_R	sra 	%r21, %r0, %r24
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 12)
	.word 0xb551c000  ! 2750: RDPR_TL	<illegal instruction>
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_223:
	setx	0x310112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c8e0  ! 2762: FSUBq	dis not found

T1_asi_reg_wr_113:
	mov	0x15, %r14
	.word 0xfcf389e0  ! 2763: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb5a54820  ! 2764: FADDs	fadds	%f21, %f0, %f26
	.word 0xb92c3001  ! 2765: SLLX_I	sllx	%r16, 0x0001, %r28
cpu_intr_1_224:
	setx	0x350216, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_124:
	mov	0x2d, %r14
	.word 0xfadb84a0  ! 2767: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbba50920  ! 2768: FMULs	fmuls	%f20, %f0, %f29
	.word 0xbbaa8820  ! 2769: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbba80820  ! 2772: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
cpu_intr_1_225:
	setx	0x340028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5349000  ! 2776: SRLX_R	srlx	%r18, %r0, %r26
T1_asi_reg_rd_125:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 2777: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_114:
	mov	0x35, %r14
	.word 0xf2f38e40  ! 2780: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_226:
	setx	0x360305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a50840  ! 2783: FADDd	faddd	%f20, %f0, %f56
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_227:
	setx	0x36003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_126:
	mov	0x1e, %r14
	.word 0xfcdb8e40  ! 2791: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_115:
	mov	0x11, %r14
	.word 0xf8f38e40  ! 2795: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_127:
	mov	0x3c3, %r14
	.word 0xf0db8400  ! 2799: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_228:
	setx	0x360139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa44960  ! 2803: FMULq	dis not found

cpu_intr_1_229:
	setx	0x360302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba8c820  ! 2805: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb9a80820  ! 2808: FMOVN	fmovs	%fcc1, %f0, %f28
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 11)
	.word 0xb1a00540  ! 2810: FSQRTd	fsqrt	
cpu_intr_1_230:
	setx	0x370331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a449c0  ! 2814: FDIVd	fdivd	%f48, %f0, %f28
cpu_intr_1_231:
	setx	0x37002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, f)
	.word 0xbfa44860  ! 2822: FADDq	dis not found

	.word 0xbfa80c20  ! 2823: FMOVRLZ	dis not found

	.word 0xb7a88820  ! 2825: FMOVLE	fmovs	%fcc1, %f0, %f27
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 2)
	.word 0xb9a9c820  ! 2828: FMOVVS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_116:
	mov	0x24, %r14
	.word 0xf6f389e0  ! 2829: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbda98820  ! 2831: FMOVNEG	fmovs	%fcc1, %f0, %f30
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 17)
	.word 0xb7a5c860  ! 2844: FADDq	dis not found

iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_wr_117:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 2846: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb4c40000  ! 2849: ADDCcc_R	addccc 	%r16, %r0, %r26
cpu_intr_1_232:
	setx	0x35030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 39)
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_wr_118:
	mov	0x29, %r14
	.word 0xf4f38e40  ! 2863: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 24)
	.word 0xbda00040  ! 2869: FMOVd	fmovd	%f0, %f30
cpu_intr_1_233:
	setx	0x34013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a40960  ! 2871: FMULq	dis not found

	.word 0xb7a88820  ! 2873: FMOVLE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_234:
	setx	0x350228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2ca08c  ! 2877: ANDN_I	andn 	%r18, 0x008c, %r31
cpu_intr_1_235:
	setx	0x35022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbba5c9e0  ! 2886: FDIVq	dis not found

	.word 0xb2bce104  ! 2889: XNORcc_I	xnorcc 	%r19, 0x0104, %r25
	.word 0xb5a50960  ! 2891: FMULq	dis not found

cpu_intr_1_236:
	setx	0x36010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_119:
	mov	0x2f, %r14
	.word 0xfaf389e0  ! 2900: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7aac820  ! 2905: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xbda84820  ! 2906: FMOVE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_237:
	setx	0x360035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa0820  ! 2909: FMOVA	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_120:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 2911: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_238:
	setx	0x34031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_121:
	mov	0x6, %r14
	.word 0xfaf38e40  ! 2918: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7a84820  ! 2924: FMOVE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_122:
	mov	0x20, %r14
	.word 0xfaf389e0  ! 2925: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbba508e0  ! 2927: FSUBq	dis not found

	.word 0xbbab8820  ! 2928: FMOVPOS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_123:
	mov	0x31, %r14
	.word 0xf6f38e40  ! 2929: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfa4c920  ! 2930: FMULs	fmuls	%f19, %f0, %f31
	.word 0xb7518000  ! 2931: RDPR_PSTATE	<illegal instruction>
T1_asi_reg_wr_124:
	mov	0x33, %r14
	.word 0xfaf384a0  ! 2934: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb9a84820  ! 2939: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb1ab4820  ! 2943: FMOVCC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_239:
	setx	0x370325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_240:
	setx	0x360131, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_wr_125:
	mov	0xd, %r14
	.word 0xf6f384a0  ! 2950: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 12)
	.word 0xb7a00520  ! 2957: FSQRTs	fsqrt	
T1_asi_reg_rd_128:
	mov	0x30, %r14
	.word 0xf4db84a0  ! 2964: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbe8521fc  ! 2965: ADDcc_I	addcc 	%r20, 0x01fc, %r31
T1_asi_reg_rd_129:
	mov	0x25, %r14
	.word 0xf4db8e40  ! 2972: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_241:
	setx	0x360231, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_126:
	mov	0x2b, %r14
	.word 0xfcf38400  ! 2974: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_wr_127:
	mov	0x20, %r14
	.word 0xfaf38400  ! 2979: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb1a50920  ! 2984: FMULs	fmuls	%f20, %f0, %f24
	.word 0xb8354000  ! 2986: ORN_R	orn 	%r21, %r0, %r28
	.word 0xb7a9c820  ! 2987: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb1a84820  ! 2990: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_130:
	mov	0x38, %r14
	.word 0xf4db8400  ! 2992: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_242:
	setx	0x34022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb3a40840  ! 3004: FADDd	faddd	%f16, %f0, %f56
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a80420  ! 3010: FMOVRZ	dis not found

	.word 0xb1a50940  ! 3013: FMULd	fmuld	%f20, %f0, %f24
	.word 0xba1cc000  ! 3015: XOR_R	xor 	%r19, %r0, %r29
	.word 0xbda5c940  ! 3018: FMULd	fmuld	%f54, %f0, %f30
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_243:
	setx	0x37020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a54820  ! 3024: FADDs	fadds	%f21, %f0, %f25
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_131:
	mov	0x3c7, %r14
	.word 0xf2db84a0  ! 3028: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_244:
	setx	0x34033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 3036: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb5a40860  ! 3038: FADDq	dis not found

	.word 0xb3a5c920  ! 3040: FMULs	fmuls	%f23, %f0, %f25
	.word 0xb3a448c0  ! 3042: FSUBd	fsubd	%f48, %f0, %f56
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 26)
	.word 0xb9a4c840  ! 3044: FADDd	faddd	%f50, %f0, %f28
	.word 0xbba80820  ! 3046: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbda00520  ! 3048: FSQRTs	fsqrt	
cpu_intr_1_245:
	setx	0x340303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 3052: FSQRTq	fsqrt	
	.word 0xbc3dc000  ! 3056: XNOR_R	xnor 	%r23, %r0, %r30
	.word 0xb42c2097  ! 3058: ANDN_I	andn 	%r16, 0x0097, %r26
cpu_intr_1_246:
	setx	0x350002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 28)
	.word 0xb7a44840  ! 3062: FADDd	faddd	%f48, %f0, %f58
T1_asi_reg_wr_128:
	mov	0x2d, %r14
	.word 0xf4f38400  ! 3063: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 10)
	.word 0xbd518000  ! 3066: RDPR_PSTATE	<illegal instruction>
T1_asi_reg_wr_129:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 3068: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_247:
	setx	0x350034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 1f)
	.word 0xba148000  ! 3074: OR_R	or 	%r18, %r0, %r29
	.word 0xb5a00040  ! 3075: FMOVd	fmovd	%f0, %f26
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_248:
	setx	0x370328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 3079: FMOVRZ	dis not found

	.word 0xbba88820  ! 3080: FMOVLE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_249:
	setx	0x350311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94e041  ! 3084: WRPR_PSTATE_I	wrpr	%r19, 0x0041, %pstate
cpu_intr_1_250:
	setx	0x360319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_251:
	setx	0x360036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 3091: FMOVGE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_132:
	mov	0x10, %r14
	.word 0xf4db8e40  ! 3093: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbfa548a0  ! 3096: FSUBs	fsubs	%f21, %f0, %f31
T1_asi_reg_rd_133:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_1_252:
	setx	0x36022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab0820  ! 3100: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbda00540  ! 3101: FSQRTd	fsqrt	
	.word 0xbda00520  ! 3104: FSQRTs	fsqrt	
	.word 0xb9350000  ! 3106: SRL_R	srl 	%r20, %r0, %r28
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 30)
	.word 0xbfa90820  ! 3116: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb3a94820  ! 3117: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbbaa8820  ! 3120: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb72c5000  ! 3122: SLLX_R	sllx	%r17, %r0, %r27
cpu_intr_1_253:
	setx	0x370026, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_134:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 3124: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_130:
	mov	0x6, %r14
	.word 0xfcf38400  ! 3126: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbda489e0  ! 3128: FDIVq	dis not found

iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_wr_131:
	mov	0x38, %r14
	.word 0xfcf38e60  ! 3134: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T1_asi_reg_wr_132:
	mov	0x4, %r14
	.word 0xfef38e80  ! 3136: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbd520000  ! 3137: RDPR_PIL	<illegal instruction>
	.word 0xb5a449c0  ! 3141: FDIVd	fdivd	%f48, %f0, %f26
	.word 0xb1a54940  ! 3142: FMULd	fmuld	%f52, %f0, %f24
	.word 0xba340000  ! 3143: ORN_R	orn 	%r16, %r0, %r29
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 0)
	.word 0xb3ab0820  ! 3156: FMOVGU	fmovs	%fcc1, %f0, %f25
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbfa5c860  ! 3166: FADDq	dis not found

	.word 0xbd355000  ! 3167: SRLX_R	srlx	%r21, %r0, %r30
T1_asi_reg_wr_133:
	mov	0x0, %r14
	.word 0xf0f384a0  ! 3168: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_rd_135:
	mov	0x27, %r14
	.word 0xf4db8e40  ! 3170: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_136:
	mov	0x3c2, %r14
	.word 0xfedb8e80  ! 3171: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb9a548c0  ! 3172: FSUBd	fsubd	%f52, %f0, %f28
	.word 0xbeac0000  ! 3173: ANDNcc_R	andncc 	%r16, %r0, %r31
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbda448e0  ! 3178: FSUBq	dis not found

	.word 0xb5354000  ! 3185: SRL_R	srl 	%r21, %r0, %r26
	.word 0xb3a488a0  ! 3186: FSUBs	fsubs	%f18, %f0, %f25
	.word 0xbfa40820  ! 3188: FADDs	fadds	%f16, %f0, %f31
	.word 0xbfa58940  ! 3190: FMULd	fmuld	%f22, %f0, %f62
	.word 0xb3a00040  ! 3191: FMOVd	fmovd	%f0, %f56
	.word 0xb7359000  ! 3192: SRLX_R	srlx	%r22, %r0, %r27
cpu_intr_1_254:
	setx	0x360133, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_137:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 3196: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbfa00540  ! 3198: FSQRTd	fsqrt	
	.word 0xbfa58860  ! 3200: FADDq	dis not found

cpu_intr_1_255:
	setx	0x350134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 25)
	.word 0xbdab0820  ! 3213: FMOVGU	fmovs	%fcc1, %f0, %f30
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_134:
	mov	0x2d, %r14
	.word 0xf0f389e0  ! 3216: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5a48940  ! 3217: FMULd	fmuld	%f18, %f0, %f26
	.word 0xb9a48920  ! 3218: FMULs	fmuls	%f18, %f0, %f28
	.word 0xbda548e0  ! 3219: FSUBq	dis not found

	.word 0xb7a81c20  ! 3220: FMOVRGEZ	dis not found

iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbc05e1c3  ! 3230: ADD_I	add 	%r23, 0x01c3, %r30
	.word 0xbba88820  ! 3231: FMOVLE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_256:
	setx	0x3a011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_257:
	setx	0x380312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 3237: FSQRTs	fsqrt	
	.word 0xb025a16a  ! 3238: SUB_I	sub 	%r22, 0x016a, %r24
T1_asi_reg_rd_138:
	mov	0x20, %r14
	.word 0xf4db8e40  ! 3244: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5a81420  ! 3245: FMOVRNZ	dis not found

	.word 0xbda44920  ! 3248: FMULs	fmuls	%f17, %f0, %f30
T1_asi_reg_wr_135:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 3249: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_258:
	setx	0x390319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba50920  ! 3255: FMULs	fmuls	%f20, %f0, %f29
cpu_intr_1_259:
	setx	0x3a0030, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_136:
	mov	0x3c3, %r14
	.word 0xf4f389e0  ! 3257: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb935f001  ! 3258: SRLX_I	srlx	%r23, 0x0001, %r28
T1_asi_reg_wr_137:
	mov	0x1d, %r14
	.word 0xfef38e80  ! 3259: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_rd_139:
	mov	0x1a, %r14
	.word 0xf8db84a0  ! 3260: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_260:
	setx	0x38012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r21 + %g0] 0xf0, %f2
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_rd_140:
	mov	0x38, %r14
	.word 0xf4db89e0  ! 3275: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_138:
	mov	0x3c2, %r14
	.word 0xf6f38e80  ! 3279: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbda00040  ! 3280: FMOVd	fmovd	%f0, %f30
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb1a5c960  ! 3286: FMULq	dis not found

cpu_intr_1_261:
	setx	0x390212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_262:
	setx	0x380130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_263:
	setx	0x38001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa449a0  ! 3294: FDIVs	fdivs	%f17, %f0, %f31
	.word 0xb6b5e0cf  ! 3295: SUBCcc_I	orncc 	%r23, 0x00cf, %r27
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 21)
	.word 0xbfa00040  ! 3298: FMOVd	fmovd	%f0, %f62
	.word 0xb5a80c20  ! 3302: FMOVRLZ	dis not found

iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 12)
	.word 0xb9a54860  ! 3306: FADDq	dis not found

	.word 0xb7a81420  ! 3307: FMOVRNZ	dis not found

iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_139:
	mov	0x1, %r14
	.word 0xf8f38e40  ! 3311: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_141:
	mov	0x3c3, %r14
	.word 0xfedb84a0  ! 3314: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_1_264:
	setx	0x380213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_265:
	setx	0x3a0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a90820  ! 3327: FMOVLEU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_142:
	mov	0x3c1, %r14
	.word 0xf0db8400  ! 3334: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb9a84820  ! 3337: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbdabc820  ! 3341: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb5a509c0  ! 3345: FDIVd	fdivd	%f20, %f0, %f26
T1_asi_reg_rd_143:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 3346: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbf641800  ! 3347: MOVcc_R	<illegal instruction>
	.word 0xb0b58000  ! 3348: SUBCcc_R	orncc 	%r22, %r0, %r24
	.word 0xb9a80820  ! 3349: FMOVN	fmovs	%fcc1, %f0, %f28
cpu_intr_1_266:
	setx	0x390104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd340000  ! 3353: SRL_R	srl 	%r16, %r0, %r30
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_rd_144:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 3355: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 16)
	.word 0xbdaa0820  ! 3360: FMOVA	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_145:
	mov	0x26, %r14
	.word 0xf8db8400  ! 3361: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8995a126  ! 3363: WRPR_TICK_I	wrpr	%r22, 0x0126, %tick
T1_asi_reg_wr_140:
	mov	0x12, %r14
	.word 0xfaf38400  ! 3364: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_141:
	mov	0x20, %r14
	.word 0xf6f384a0  ! 3365: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb1a00540  ! 3372: FSQRTd	fsqrt	
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_146:
	mov	0x16, %r14
	.word 0xf0db8400  ! 3375: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7aa0820  ! 3378: FMOVA	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_147:
	mov	0x1a, %r14
	.word 0xfcdb89e0  ! 3381: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 11)
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_rd_148:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 3391: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_142:
	mov	0xb, %r14
	.word 0xf0f384a0  ! 3392: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_267:
	setx	0x3a033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac561ff  ! 3396: ADDCcc_I	addccc 	%r21, 0x01ff, %r29
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 5)
	.word 0xb9a00560  ! 3407: FSQRTq	fsqrt	
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 31)
	.word 0xb3aa8820  ! 3411: FMOVG	fmovs	%fcc1, %f0, %f25
cpu_intr_1_268:
	setx	0x3b0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_269:
	setx	0x3b0206, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_270:
	setx	0x390201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_271:
	setx	0x390116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa40960  ! 3420: FMULq	dis not found

T1_asi_reg_wr_143:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 3421: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_272:
	setx	0x3a002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a409c0  ! 3424: FDIVd	fdivd	%f16, %f0, %f24
T1_asi_reg_wr_144:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 3425: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_145:
	mov	0x23, %r14
	.word 0xfef38e40  ! 3427: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, f)
	.word 0xb5a548c0  ! 3430: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xb2c5202c  ! 3431: ADDCcc_I	addccc 	%r20, 0x002c, %r25
	.word 0xbbaac820  ! 3432: FMOVGE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_273:
	setx	0x380337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_274:
	setx	0x3a0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 3440: FMOVGU	fmovs	%fcc1, %f0, %f25
cpu_intr_1_275:
	setx	0x3b011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_146:
	mov	0x2a, %r14
	.word 0xfef389e0  ! 3443: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb3a00020  ! 3445: FMOVs	fmovs	%f0, %f25
	.word 0xb5aac820  ! 3446: FMOVGE	fmovs	%fcc1, %f0, %f26
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_276:
	setx	0x3a0001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_277:
	setx	0x390113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_278:
	setx	0x3b0313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_279:
	setx	0x2032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80c20  ! 3463: FMOVRLZ	dis not found

iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_280:
	setx	0x3b011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_281:
	setx	0x390311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a44940  ! 3478: FMULd	fmuld	%f48, %f0, %f28
T1_asi_reg_rd_149:
	mov	0x13, %r14
	.word 0xf6db8e40  ! 3479: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_282:
	setx	0x3a0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa8820  ! 3483: FMOVG	fmovs	%fcc1, %f0, %f27
cpu_intr_1_283:
	setx	0x380004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbabc820  ! 3493: FMOVVC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_150:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 3494: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_rd_151:
	mov	0x18, %r14
	.word 0xfedb84a0  ! 3495: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_rd_152:
	mov	0x1c, %r14
	.word 0xfadb84a0  ! 3496: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 37)
	.word 0xb1a409e0  ! 3498: FDIVq	dis not found

iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 26)
	.word 0xbdab4820  ! 3501: FMOVCC	fmovs	%fcc1, %f0, %f30
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_284:
	setx	0x3b0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba84820  ! 3512: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbe8c4000  ! 3513: ANDcc_R	andcc 	%r17, %r0, %r31
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 17)
	.word 0xb7a88820  ! 3519: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbfa81c20  ! 3520: FMOVRGEZ	dis not found

	.word 0xb9a58940  ! 3521: FMULd	fmuld	%f22, %f0, %f28
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 14)
	.word 0xbba8c820  ! 3524: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb9a58960  ! 3525: FMULq	dis not found

	.word 0xbfa549c0  ! 3527: FDIVd	fdivd	%f52, %f0, %f62
	.word 0xb0448000  ! 3529: ADDC_R	addc 	%r18, %r0, %r24
T1_asi_reg_rd_153:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 3530: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1a8c820  ! 3532: FMOVL	fmovs	%fcc1, %f0, %f24
cpu_intr_1_285:
	setx	0x39022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 3536: FMOVG	fmovs	%fcc1, %f0, %f29
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 16)
	.word 0xb82521de  ! 3540: SUB_I	sub 	%r20, 0x01de, %r28
	.word 0xbda548a0  ! 3541: FSUBs	fsubs	%f21, %f0, %f30
cpu_intr_1_286:
	setx	0x380310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 19)
	.word 0xbfab8820  ! 3549: FMOVPOS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_147:
	mov	0x2e, %r14
	.word 0xfef384a0  ! 3550: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_287:
	setx	0x3b020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40920  ! 3556: FMULs	fmuls	%f16, %f0, %f25
	.word 0xb43d8000  ! 3557: XNOR_R	xnor 	%r22, %r0, %r26
cpu_intr_1_288:
	setx	0x390315, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_154:
	mov	0x5, %r14
	.word 0xf4db8e60  ! 3559: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 11)
	.word 0xb4acc000  ! 3563: ANDNcc_R	andncc 	%r19, %r0, %r26
	.word 0xb6144000  ! 3566: OR_R	or 	%r17, %r0, %r27
	.word 0xbda48840  ! 3567: FADDd	faddd	%f18, %f0, %f30
	.word 0xbda94820  ! 3569: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_155:
	mov	0x2, %r14
	.word 0xfedb8e60  ! 3570: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 12)
	.word 0xbe144000  ! 3573: OR_R	or 	%r17, %r0, %r31
	.word 0xb7a44860  ! 3574: FADDq	dis not found

	.word 0xb5a5c9e0  ! 3575: FDIVq	dis not found

	.word 0xb7a88820  ! 3581: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a81420  ! 3582: FMOVRNZ	dis not found

cpu_intr_1_289:
	setx	0x380002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_290:
	setx	0x3b0227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb9a5c8c0  ! 3589: FSUBd	fsubd	%f54, %f0, %f28
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_156:
	mov	0x3c4, %r14
	.word 0xfedb8e80  ! 3592: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 25)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a81420  ! 3604: FMOVRNZ	dis not found

	.word 0xbba4c8a0  ! 3606: FSUBs	fsubs	%f19, %f0, %f29
cpu_intr_1_291:
	setx	0x3a0116, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_148:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 3609: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbfa80c20  ! 3610: FMOVRLZ	dis not found

	.word 0xbfaac820  ! 3611: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb72d4000  ! 3613: SLL_R	sll 	%r21, %r0, %r27
	.word 0xbba44820  ! 3618: FADDs	fadds	%f17, %f0, %f29
	.word 0xbba408c0  ! 3621: FSUBd	fsubd	%f16, %f0, %f60
T1_asi_reg_rd_157:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 3626: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbfab4820  ! 3627: FMOVCC	fmovs	%fcc1, %f0, %f31
cpu_intr_1_292:
	setx	0x380126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 4)
	.word 0xb5a5c8e0  ! 3631: FSUBq	dis not found

	.word 0xb1a4c8e0  ! 3634: FSUBq	dis not found

iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbba448a0  ! 3641: FSUBs	fsubs	%f17, %f0, %f29
T1_asi_reg_rd_158:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 3642: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_1_293:
	setx	0x3b0021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb3a5c960  ! 3648: FMULq	dis not found

	.word 0xb7a90820  ! 3650: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xba0d215b  ! 3653: AND_I	and 	%r20, 0x015b, %r29
T1_asi_reg_wr_149:
	mov	0xc, %r14
	.word 0xf0f38e80  ! 3655: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_rd_159:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 3656: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_294:
	setx	0x38002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a84820  ! 3661: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_160:
	mov	0xd, %r14
	.word 0xf6db8e80  ! 3663: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_wr_150:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 3665: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_295:
	setx	0x390133, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_151:
	mov	0x10, %r14
	.word 0xfaf38e60  ! 3668: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbaa4a01e  ! 3670: SUBcc_I	subcc 	%r18, 0x001e, %r29
	.word 0xb9a548a0  ! 3672: FSUBs	fsubs	%f21, %f0, %f28
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_161:
	mov	0x2, %r14
	.word 0xf8db8400  ! 3676: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbda488e0  ! 3680: FSUBq	dis not found

T1_asi_reg_wr_152:
	mov	0xa, %r14
	.word 0xfef38e80  ! 3681: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb5a81820  ! 3682: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb5a00540  ! 3684: FSQRTd	fsqrt	
	.word 0xb5a449a0  ! 3686: FDIVs	fdivs	%f17, %f0, %f26
cpu_intr_1_296:
	setx	0x390117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 3688: MOVcc_I	<illegal instruction>
	.word 0xb9aa0820  ! 3689: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb7a88820  ! 3691: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a80820  ! 3692: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb1aa4820  ! 3695: FMOVNE	fmovs	%fcc1, %f0, %f24
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, d)
	.word 0xb9a44820  ! 3698: FADDs	fadds	%f17, %f0, %f28
	.word 0xbfa548e0  ! 3701: FSUBq	dis not found

iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 1)
	.word 0xbda409c0  ! 3704: FDIVd	fdivd	%f16, %f0, %f30
cpu_intr_1_297:
	setx	0x3f010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_162:
	mov	0x14, %r14
	.word 0xfadb89e0  ! 3706: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_298:
	setx	0x3d0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 3709: FMOVGE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_163:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 3712: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_rd_164:
	mov	0x3, %r14
	.word 0xfedb8e80  ! 3716: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbfab0820  ! 3717: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 23)
	.word 0xb1a84820  ! 3721: FMOVE	fmovs	%fcc1, %f0, %f24
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 23)
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9a449e0  ! 3727: FDIVq	dis not found

	.word 0xb69c61d8  ! 3729: XORcc_I	xorcc 	%r17, 0x01d8, %r27
cpu_intr_1_299:
	setx	0x3f0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a40960  ! 3732: FMULq	dis not found

cpu_intr_1_300:
	setx	0x3c0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a508e0  ! 3737: FSUBq	dis not found

cpu_intr_1_301:
	setx	0x3d002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_153:
	mov	0x3c5, %r14
	.word 0xf6f38400  ! 3744: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_302:
	setx	0x3d022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81820  ! 3748: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb9a58840  ! 3750: FADDd	faddd	%f22, %f0, %f28
cpu_intr_1_303:
	setx	0x3f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_304:
	setx	0x3d0131, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_165:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3a80820  ! 3760: FMOVN	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_154:
	mov	0x2b, %r14
	.word 0xfaf384a0  ! 3761: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbdaa0820  ! 3763: FMOVA	fmovs	%fcc1, %f0, %f30
cpu_intr_1_305:
	setx	0x3e023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa54920  ! 3768: FMULs	fmuls	%f21, %f0, %f31
T1_asi_reg_wr_155:
	mov	0x14, %r14
	.word 0xfef38400  ! 3771: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb3a40860  ! 3772: FADDq	dis not found

	.word 0xbc0da004  ! 3777: AND_I	and 	%r22, 0x0004, %r30
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, e)
	.word 0xbfa44940  ! 3783: FMULd	fmuld	%f48, %f0, %f62
	.word 0xbba88820  ! 3785: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbbab4820  ! 3786: FMOVCC	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba440000  ! 3789: ADDC_R	addc 	%r16, %r0, %r29
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 0)
	.word 0xbc44a144  ! 3792: ADDC_I	addc 	%r18, 0x0144, %r30
	.word 0xbdabc820  ! 3793: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb1abc820  ! 3794: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb9643801  ! 3797: MOVcc_I	<illegal instruction>
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbbab4820  ! 3804: FMOVCC	fmovs	%fcc1, %f0, %f29
cpu_intr_1_306:
	setx	0x3e0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 3808: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbea5c000  ! 3809: SUBcc_R	subcc 	%r23, %r0, %r31
T1_asi_reg_rd_166:
	mov	0x3c4, %r14
	.word 0xf6db84a0  ! 3815: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb9a589e0  ! 3822: FDIVq	dis not found

	.word 0xbda98820  ! 3825: FMOVNEG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_156:
	mov	0xe, %r14
	.word 0xf2f38e40  ! 3826: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_157:
	mov	0x29, %r14
	.word 0xfef38e40  ! 3831: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbba549e0  ! 3832: FDIVq	dis not found

T1_asi_reg_rd_167:
	mov	0xf, %r14
	.word 0xf8db89e0  ! 3833: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_rd_168:
	mov	0x8, %r14
	.word 0xf0db8e40  ! 3834: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9ab4820  ! 3835: FMOVCC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_307:
	setx	0x3f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_158:
	mov	0x2a, %r14
	.word 0xfcf389e0  ! 3840: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb3a488e0  ! 3847: FSUBq	dis not found

	.word 0xbda80820  ! 3848: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb7a409e0  ! 3850: FDIVq	dis not found

	.word 0xbe348000  ! 3851: ORN_R	orn 	%r18, %r0, %r31
	.word 0xb60de00c  ! 3853: AND_I	and 	%r23, 0x000c, %r27
T1_asi_reg_rd_169:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 3854: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_159:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 3856: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_wr_160:
	mov	0x37, %r14
	.word 0xf2f389e0  ! 3860: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb5a00560  ! 3861: FSQRTq	fsqrt	
	.word 0xb6940000  ! 3866: ORcc_R	orcc 	%r16, %r0, %r27
	.word 0xb4050000  ! 3867: ADD_R	add 	%r20, %r0, %r26
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_308:
	setx	0x3e0027, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_170:
	mov	0x26, %r14
	.word 0xfcdb89e0  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb3ab8820  ! 3875: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbda509e0  ! 3877: FDIVq	dis not found

	.word 0x8f902000  ! 3878: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xbda5c840  ! 3879: FADDd	faddd	%f54, %f0, %f30
	.word 0xb935f001  ! 3880: SRLX_I	srlx	%r23, 0x0001, %r28
	.word 0xbba589c0  ! 3882: FDIVd	fdivd	%f22, %f0, %f60
cpu_intr_1_309:
	setx	0x3e0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a549c0  ! 3886: FDIVd	fdivd	%f52, %f0, %f24
	.word 0xb3a90820  ! 3887: FMOVLEU	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb22c4000  ! 3893: ANDN_R	andn 	%r17, %r0, %r25
	.word 0xbc2c209e  ! 3894: ANDN_I	andn 	%r16, 0x009e, %r30
	.word 0xbfa00560  ! 3895: FSQRTq	fsqrt	
	.word 0xb335b001  ! 3896: SRLX_I	srlx	%r22, 0x0001, %r25
	.word 0xb1aa8820  ! 3897: FMOVG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_171:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 3898: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_wr_161:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 3900: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbba94820  ! 3902: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a40840  ! 3904: FADDd	faddd	%f16, %f0, %f56
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb1a50960  ! 3908: FMULq	dis not found

T1_asi_reg_rd_172:
	mov	0x16, %r14
	.word 0xf6db89e0  ! 3909: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_1_310:
	setx	0x3e0020, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_162:
	mov	0x1f, %r14
	.word 0xf6f38e40  ! 3916: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb9a9c820  ! 3918: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb7abc820  ! 3919: FMOVVC	fmovs	%fcc1, %f0, %f27
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb62dc000  ! 3923: ANDN_R	andn 	%r23, %r0, %r27
	.word 0xbfa80820  ! 3925: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb7a4c820  ! 3926: FADDs	fadds	%f19, %f0, %f27
	.word 0xb3a9c820  ! 3928: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb2bc0000  ! 3931: XNORcc_R	xnorcc 	%r16, %r0, %r25
T1_asi_reg_wr_163:
	mov	0x1a, %r14
	.word 0xfef38400  ! 3932: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb3aac820  ! 3933: FMOVGE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_173:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 3934: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_311:
	setx	0x3e0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 3942: FMOVRGEZ	dis not found

cpu_intr_1_312:
	setx	0x3c0223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_313:
	setx	0x3f013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda489c0  ! 3952: FDIVd	fdivd	%f18, %f0, %f30
cpu_intr_1_314:
	setx	0x3d0023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_315:
	setx	0x3c0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72c7001  ! 3966: SLLX_I	sllx	%r17, 0x0001, %r27
cpu_intr_1_316:
	setx	0x3e032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_164:
	mov	0x1, %r14
	.word 0xf2f38e80  ! 3973: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 11)
	.word 0xb5a81820  ! 3978: FMOVRGZ	fmovs	%fcc3, %f0, %f26
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9a548c0  ! 3982: FSUBd	fsubd	%f52, %f0, %f28
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_317:
	setx	0x3c001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 3985: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbfa588a0  ! 3988: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xb3a00560  ! 3990: FSQRTq	fsqrt	
T1_asi_reg_rd_174:
	mov	0x9, %r14
	.word 0xf6db8e80  ! 3996: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_318:
	setx	0x3e0220, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_175:
	mov	0x1, %r14
	.word 0xf2db8e60  ! 4000: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbdaa4820  ! 4001: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbea40000  ! 4002: SUBcc_R	subcc 	%r16, %r0, %r31
	.word 0xb3a4c840  ! 4004: FADDd	faddd	%f50, %f0, %f56
T1_asi_reg_wr_165:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 4005: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfa48820  ! 4006: FADDs	fadds	%f18, %f0, %f31
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb434e1cb  ! 4008: SUBC_I	orn 	%r19, 0x01cb, %r26
cpu_intr_1_319:
	setx	0x3f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a448e0  ! 4014: FSUBq	dis not found

iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbba589a0  ! 4022: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xbfabc820  ! 4024: FMOVVC	fmovs	%fcc1, %f0, %f31
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 28)
	.word 0xbba00020  ! 4027: FMOVs	fmovs	%f0, %f29
cpu_intr_1_320:
	setx	0x3e0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa4820  ! 4029: FMOVNE	fmovs	%fcc1, %f0, %f24
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 5)
	.word 0xb1a81420  ! 4033: FMOVRNZ	dis not found

	.word 0xbba80820  ! 4034: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_176:
	mov	0x34, %r14
	.word 0xfcdb8e80  ! 4035: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_321:
	setx	0x3d031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 4038: MOVcc_I	<illegal instruction>
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 22)
	.word 0xb81ce1ae  ! 4052: XOR_I	xor 	%r19, 0x01ae, %r28
	.word 0xbe94c000  ! 4055: ORcc_R	orcc 	%r19, %r0, %r31
T1_asi_reg_rd_177:
	mov	0x26, %r14
	.word 0xf8db84a0  ! 4058: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_wr_166:
	mov	0x17, %r14
	.word 0xf6f389e0  ! 4062: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb3a00560  ! 4063: FSQRTq	fsqrt	
	.word 0xb37ce401  ! 4064: MOVR_I	movre	%r19, 0x1, %r25
	.word 0xbfab8820  ! 4069: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb43561e0  ! 4070: ORN_I	orn 	%r21, 0x01e0, %r26
T1_asi_reg_rd_178:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 4071: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_167:
	mov	0x3c2, %r14
	.word 0xfef38e80  ! 4076: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_179:
	mov	0x24, %r14
	.word 0xf4db89e0  ! 4078: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 28)
	.word 0xbfa448e0  ! 4081: FSUBq	dis not found

cpu_intr_1_322:
	setx	0x3e0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_rd_180:
	mov	0x3c6, %r14
	.word 0xf4db89e0  ! 4085: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_wr_168:
	mov	0x12, %r14
	.word 0xf0f38e60  ! 4086: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_rd_181:
	mov	0x3c0, %r14
	.word 0xf2db89e0  ! 4088: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 25)
	.word 0xb5a50960  ! 4092: FMULq	dis not found

	.word 0xbfa94820  ! 4094: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a9c820  ! 4096: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb284a028  ! 4099: ADDcc_I	addcc 	%r18, 0x0028, %r25
	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_rd_182:
	mov	0x3, %r14
	.word 0xf2db8400  ! 4103: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_wr_169:
	mov	0x1a, %r14
	.word 0xf4f38e80  ! 4105: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbba48860  ! 4106: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_183:
	mov	0x15, %r14
	.word 0xf4db8400  ! 4115: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbda00040  ! 4118: FMOVd	fmovd	%f0, %f30
	.word 0xbda00560  ! 4120: FSQRTq	fsqrt	
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 13)
	.word 0xb7aa4820  ! 4127: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xbbab0820  ! 4129: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb7a5c860  ! 4131: FADDq	dis not found

iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 24)
	.word 0xb80d0000  ! 4146: AND_R	and 	%r20, %r0, %r28
cpu_intr_1_323:
	setx	0x41030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 4153: FSQRTq	fsqrt	
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 32)
	.word 0xbba81c20  ! 4158: FMOVRGEZ	dis not found

T1_asi_reg_wr_170:
	mov	0x16, %r14
	.word 0xf4f384a0  ! 4159: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbdaa4820  ! 4160: FMOVNE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_171:
	mov	0x4, %r14
	.word 0xf0f389e0  ! 4161: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbba81820  ! 4166: FMOVRGZ	fmovs	%fcc3, %f0, %f29
T1_asi_reg_wr_172:
	mov	0x18, %r14
	.word 0xf0f38e60  ! 4169: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb8944000  ! 4170: ORcc_R	orcc 	%r17, %r0, %r28
	.word 0xb9a508c0  ! 4173: FSUBd	fsubd	%f20, %f0, %f28
T1_asi_reg_wr_173:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 4174: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_324:
	setx	0x40001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c8e0  ! 4182: FSUBq	dis not found

	.word 0xb9a00560  ! 4185: FSQRTq	fsqrt	
	.word 0xbba489e0  ! 4192: FDIVq	dis not found

T1_asi_reg_rd_184:
	mov	0x16, %r14
	.word 0xf2db8e60  ! 4196: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_rd_185:
	mov	0xe, %r14
	.word 0xfadb84a0  ! 4198: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5a489e0  ! 4201: FDIVq	dis not found

T1_asi_reg_wr_174:
	mov	0xd, %r14
	.word 0xfaf389e0  ! 4202: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7a00040  ! 4203: FMOVd	fmovd	%f0, %f58
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 26)
	.word 0xbfa00560  ! 4207: FSQRTq	fsqrt	
	.word 0xb3a00520  ! 4208: FSQRTs	fsqrt	
	.word 0xb2ada16d  ! 4209: ANDNcc_I	andncc 	%r22, 0x016d, %r25
cpu_intr_1_325:
	setx	0x40001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa50840  ! 4211: FADDd	faddd	%f20, %f0, %f62
cpu_intr_1_326:
	setx	0x420230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, d)
	.word 0xb5a9c820  ! 4215: FMOVVS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_327:
	setx	0x410211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3641800  ! 4218: MOVcc_R	<illegal instruction>
	.word 0xbbabc820  ! 4219: FMOVVC	fmovs	%fcc1, %f0, %f29
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbda98820  ! 4228: FMOVNEG	fmovs	%fcc1, %f0, %f30
	lda	[%r18 + %g0] 0xf0, %f2
cpu_intr_1_328:
	setx	0x410138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b54000  ! 4231: SUBCcc_R	orncc 	%r21, %r0, %r28
	.word 0xb3a81c20  ! 4234: FMOVRGEZ	dis not found

	.word 0xb12cf001  ! 4236: SLLX_I	sllx	%r19, 0x0001, %r24
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_329:
	setx	0x400315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_175:
	mov	0x36, %r14
	.word 0xfef38400  ! 4242: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 16)
	.word 0xbda44840  ! 4246: FADDd	faddd	%f48, %f0, %f30
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb5aa0820  ! 4249: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb5a81820  ! 4250: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb44460f0  ! 4251: ADDC_I	addc 	%r17, 0x00f0, %r26
	.word 0xb5a81420  ! 4253: FMOVRNZ	dis not found

	.word 0xb9a409a0  ! 4254: FDIVs	fdivs	%f16, %f0, %f28
	.word 0xbfa80820  ! 4259: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbc0c6128  ! 4260: AND_I	and 	%r17, 0x0128, %r30
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, b)
	.word 0xb9a5c8a0  ! 4262: FSUBs	fsubs	%f23, %f0, %f28
	.word 0xb0a46001  ! 4263: SUBcc_I	subcc 	%r17, 0x0001, %r24
cpu_intr_1_330:
	setx	0x420119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_331:
	setx	0x42030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81820  ! 4271: FMOVRGZ	fmovs	%fcc3, %f0, %f31
cpu_intr_1_332:
	setx	0x42003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba98820  ! 4275: FMOVNEG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_186:
	mov	0xc, %r14
	.word 0xfadb8e40  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_333:
	setx	0x420022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, f)
	.word 0xbc350000  ! 4287: ORN_R	orn 	%r20, %r0, %r30
T1_asi_reg_rd_187:
	mov	0x6, %r14
	.word 0xfadb84a0  ! 4290: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbfa8c820  ! 4291: FMOVL	fmovs	%fcc1, %f0, %f31
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_334:
	setx	0x420124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_335:
	setx	0x430123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 19)
	.word 0xbda88820  ! 4317: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a5c820  ! 4319: FADDs	fadds	%f23, %f0, %f26
	.word 0xb3ab0820  ! 4320: FMOVGU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_176:
	mov	0x3c4, %r14
	.word 0xf8f38e60  ! 4327: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb7a80420  ! 4334: FMOVRZ	dis not found

	.word 0xbba00520  ! 4335: FSQRTs	fsqrt	
T1_asi_reg_wr_177:
	mov	0x24, %r14
	.word 0xf4f38400  ! 4336: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_1_336:
	setx	0x400121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb50000  ! 4340: ORNcc_R	orncc 	%r20, %r0, %r30
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb9ab4820  ! 4343: FMOVCC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_337:
	setx	0x41012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c920  ! 4349: FMULs	fmuls	%f23, %f0, %f24
T1_asi_reg_wr_178:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 4352: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_188:
	mov	0x1c, %r14
	.word 0xf0db8e80  ! 4353: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_wr_179:
	mov	0x1, %r14
	.word 0xf6f38e80  ! 4356: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb5a80820  ! 4359: FMOVN	fmovs	%fcc1, %f0, %f26
cpu_intr_1_338:
	setx	0x43013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_339:
	setx	0x40000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c920  ! 4363: FMULs	fmuls	%f19, %f0, %f25
cpu_intr_1_340:
	setx	0x41022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb4e029  ! 4367: ORNcc_I	orncc 	%r19, 0x0029, %r31
cpu_intr_1_341:
	setx	0x40031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_189:
	mov	0x11, %r14
	.word 0xf0db8e40  ! 4370: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_180:
	mov	0x2d, %r14
	.word 0xf2f38e40  ! 4372: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_190:
	mov	0x3c3, %r14
	.word 0xf0db8e60  ! 4373: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbdaa0820  ! 4376: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb2150000  ! 4381: OR_R	or 	%r20, %r0, %r25
	.word 0xbc0dc000  ! 4383: AND_R	and 	%r23, %r0, %r30
	.word 0xbba409e0  ! 4384: FDIVq	dis not found

	.word 0xb5a90820  ! 4385: FMOVLEU	fmovs	%fcc1, %f0, %f26
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_rd_191:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 4391: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_181:
	mov	0x6, %r14
	.word 0xf8f389e0  ! 4394: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb3a48860  ! 4396: FADDq	dis not found

	.word 0xbba88820  ! 4397: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xba8d2004  ! 4399: ANDcc_I	andcc 	%r20, 0x0004, %r29
	.word 0xb33c8000  ! 4400: SRA_R	sra 	%r18, %r0, %r25
	.word 0xb1a80420  ! 4401: FMOVRZ	dis not found

	.word 0xb3a00560  ! 4404: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 10)
	.word 0xb7a81420  ! 4409: FMOVRNZ	dis not found

	.word 0xbdab0820  ! 4413: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb1a48940  ! 4414: FMULd	fmuld	%f18, %f0, %f24
cpu_intr_1_342:
	setx	0x43023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 29)
	.word 0xbfaa4820  ! 4418: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbfa489a0  ! 4420: FDIVs	fdivs	%f18, %f0, %f31
cpu_intr_1_343:
	setx	0x40002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_192:
	mov	0x31, %r14
	.word 0xf2db8e60  ! 4422: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_344:
	setx	0x40001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	lda	[%r17 + %g0] 0xf0, %f2
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbe2c60b5  ! 4436: ANDN_I	andn 	%r17, 0x00b5, %r31
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 8)
	.word 0xbd643801  ! 4438: MOVcc_I	<illegal instruction>
cpu_intr_1_345:
	setx	0x420000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_346:
	setx	0x41022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 4443: FMOVVS	fmovs	%fcc1, %f0, %f31
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb3a00540  ! 4447: FSQRTd	fsqrt	
	.word 0xb7a98820  ! 4448: FMOVNEG	fmovs	%fcc1, %f0, %f27
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_347:
	setx	0x400108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a58820  ! 4451: FADDs	fadds	%f22, %f0, %f26
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_348:
	setx	0x41020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_193:
	mov	0x16, %r14
	.word 0xfadb8e60  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb9ab4820  ! 4460: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb9a489e0  ! 4469: FDIVq	dis not found

T1_asi_reg_rd_194:
	mov	0xc, %r14
	.word 0xf4db89e0  ! 4470: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 3b)
	lda	[%r17 + %g0] 0xf0, %f2
cpu_intr_1_349:
	setx	0x420110, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_182:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 4480: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_rd_195:
	mov	0x8, %r14
	.word 0xfedb8e40  ! 4481: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfa8c820  ! 4484: FMOVL	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_183:
	mov	0x4, %r14
	.word 0xf2f384a0  ! 4486: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbabd20f2  ! 4487: XNORcc_I	xnorcc 	%r20, 0x00f2, %r29
T1_asi_reg_rd_196:
	mov	0x3, %r14
	.word 0xf4db8e80  ! 4488: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb1a58840  ! 4491: FADDd	faddd	%f22, %f0, %f24
cpu_intr_1_350:
	setx	0x43003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_184:
	mov	0x2, %r14
	.word 0xfef38e40  ! 4493: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_185:
	mov	0x18, %r14
	.word 0xfcf38e40  ! 4494: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb1a48860  ! 4496: FADDq	dis not found

T1_asi_reg_rd_197:
	mov	0x2a, %r14
	.word 0xfcdb8e80  ! 4497: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb934c000  ! 4500: SRL_R	srl 	%r19, %r0, %r28
	.word 0xbbab4820  ! 4504: FMOVCC	fmovs	%fcc1, %f0, %f29
cpu_intr_1_351:
	setx	0x430301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb095e175  ! 4507: ORcc_I	orcc 	%r23, 0x0175, %r24
	.word 0xbda54960  ! 4512: FMULq	dis not found

T1_asi_reg_wr_186:
	mov	0x10, %r14
	.word 0xfef38e40  ! 4513: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_352:
	setx	0x400220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 4516: FMOVRLZ	dis not found

	.word 0xb4140000  ! 4517: OR_R	or 	%r16, %r0, %r26
T1_asi_reg_rd_198:
	mov	0x16, %r14
	.word 0xf6db8e80  ! 4518: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_353:
	setx	0x400307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80c20  ! 4521: FMOVRLZ	dis not found

	.word 0xb9a58820  ! 4523: FADDs	fadds	%f22, %f0, %f28
	.word 0xbba00020  ! 4524: FMOVs	fmovs	%f0, %f29
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb7a00560  ! 4526: FSQRTq	fsqrt	
T1_asi_reg_rd_199:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 4527: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 19)
	.word 0xb4b4a137  ! 4529: ORNcc_I	orncc 	%r18, 0x0137, %r26
	.word 0xbba508a0  ! 4534: FSUBs	fsubs	%f20, %f0, %f29
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 19)
	.word 0xb1a409c0  ! 4537: FDIVd	fdivd	%f16, %f0, %f24
T1_asi_reg_rd_200:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 4538: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_rd_201:
	mov	0x2, %r14
	.word 0xf4db8e40  ! 4539: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbda48920  ! 4541: FMULs	fmuls	%f18, %f0, %f30
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 3)
	.word 0x8795e0e1  ! 4544: WRPR_TT_I	wrpr	%r23, 0x00e1, %tt
	.word 0xb3aa4820  ! 4545: FMOVNE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_354:
	setx	0x42002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_355:
	setx	0x42001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_202:
	mov	0x5, %r14
	.word 0xfadb8e40  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb7ab4820  ! 4553: FMOVCC	fmovs	%fcc1, %f0, %f27
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_356:
	setx	0x410031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_357:
	setx	0x400318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_203:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 4564: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb625219c  ! 4570: SUB_I	sub 	%r20, 0x019c, %r27
	.word 0xb5a88820  ! 4571: FMOVLE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_187:
	mov	0x1e, %r14
	.word 0xfaf38e60  ! 4573: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb5a5c820  ! 4574: FADDs	fadds	%f23, %f0, %f26
cpu_intr_1_358:
	setx	0x410019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa509e0  ! 4577: FDIVq	dis not found

	.word 0xb9a54920  ! 4578: FMULs	fmuls	%f21, %f0, %f28
	.word 0xb9aa4820  ! 4581: FMOVNE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_359:
	setx	0x400010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, d)
	.word 0xb5a50840  ! 4588: FADDd	faddd	%f20, %f0, %f26
	.word 0xb9a00560  ! 4589: FSQRTq	fsqrt	
T1_asi_reg_wr_188:
	mov	0x17, %r14
	.word 0xf4f389e0  ! 4590: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb9a40860  ! 4593: FADDq	dis not found

	.word 0xbba48840  ! 4595: FADDd	faddd	%f18, %f0, %f60
	.word 0xbba48960  ! 4596: FMULq	dis not found

iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_wr_189:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 4601: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb3aa0820  ! 4603: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb2b44000  ! 4604: SUBCcc_R	orncc 	%r17, %r0, %r25
	.word 0xbda548c0  ! 4605: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xbfa81820  ! 4606: FMOVRGZ	fmovs	%fcc3, %f0, %f31
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 1e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba8c820  ! 4612: FMOVL	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_204:
	mov	0x21, %r14
	.word 0xf6db8e80  ! 4614: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_rd_205:
	mov	0x2e, %r14
	.word 0xfedb89e0  ! 4615: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb3a98820  ! 4623: FMOVNEG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_190:
	mov	0x9, %r14
	.word 0xf0f38400  ! 4626: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda80820  ! 4633: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbba90820  ! 4635: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbba81820  ! 4637: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a00520  ! 4639: FSQRTs	fsqrt	
cpu_intr_1_360:
	setx	0x47020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_361:
	setx	0x440203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa40920  ! 4644: FMULs	fmuls	%f16, %f0, %f31
	.word 0xb7a44920  ! 4648: FMULs	fmuls	%f17, %f0, %f27
cpu_intr_1_362:
	setx	0x450101, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_206:
	mov	0x2a, %r14
	.word 0xfcdb84a0  ! 4651: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 27)
	.word 0xb5510000  ! 4653: RDPR_TICK	<illegal instruction>
T1_asi_reg_wr_191:
	mov	0xc, %r14
	.word 0xf0f38400  ! 4654: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_363:
	setx	0x470315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 4665: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb0948000  ! 4666: ORcc_R	orcc 	%r18, %r0, %r24
	.word 0xbcb52164  ! 4667: ORNcc_I	orncc 	%r20, 0x0164, %r30
	.word 0xb5a58940  ! 4668: FMULd	fmuld	%f22, %f0, %f26
	.word 0xbfa00520  ! 4669: FSQRTs	fsqrt	
cpu_intr_1_364:
	setx	0x47021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794a18a  ! 4672: WRPR_TT_I	wrpr	%r18, 0x018a, %tt
	.word 0xbda81c20  ! 4673: FMOVRGEZ	dis not found

	.word 0xb9a00020  ! 4674: FMOVs	fmovs	%f0, %f28
	.word 0xbcc521b4  ! 4675: ADDCcc_I	addccc 	%r20, 0x01b4, %r30
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, e)
	.word 0xb7a00040  ! 4679: FMOVd	fmovd	%f0, %f58
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb7a00540  ! 4683: FSQRTd	fsqrt	
	.word 0xb9a408a0  ! 4684: FSUBs	fsubs	%f16, %f0, %f28
T1_asi_reg_wr_192:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 4685: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_365:
	setx	0x46013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_193:
	mov	0x34, %r14
	.word 0xfcf384a0  ! 4691: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 3d)
	.word 0x8d9460d0  ! 4693: WRPR_PSTATE_I	wrpr	%r17, 0x00d0, %pstate
	.word 0xb4046166  ! 4694: ADD_I	add 	%r17, 0x0166, %r26
cpu_intr_1_366:
	setx	0x470000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 16)
	.word 0xb23d4000  ! 4702: XNOR_R	xnor 	%r21, %r0, %r25
cpu_intr_1_367:
	setx	0x440034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28d61c8  ! 4704: ANDcc_I	andcc 	%r21, 0x01c8, %r25
	.word 0xb9a448e0  ! 4706: FSUBq	dis not found

iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 29)
	.word 0xb5a50820  ! 4717: FADDs	fadds	%f20, %f0, %f26
	.word 0xb5a81420  ! 4718: FMOVRNZ	dis not found

iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 37)
	.word 0xbfa00520  ! 4721: FSQRTs	fsqrt	
	.word 0xb3a48840  ! 4723: FADDd	faddd	%f18, %f0, %f56
T1_asi_reg_wr_194:
	mov	0x30, %r14
	.word 0xfef38e40  ! 4725: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_368:
	setx	0x460203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3dc000  ! 4732: SRA_R	sra 	%r23, %r0, %r29
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_rd_207:
	mov	0x26, %r14
	.word 0xf8db84a0  ! 4735: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_369:
	setx	0x44030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_195:
	mov	0x1f, %r14
	.word 0xf0f38400  ! 4741: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_196:
	mov	0x15, %r14
	.word 0xf0f38400  ! 4746: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbda00560  ! 4750: FSQRTq	fsqrt	
	.word 0xb9a80c20  ! 4753: FMOVRLZ	dis not found

iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbfa4c9c0  ! 4761: FDIVd	fdivd	%f50, %f0, %f62
T1_asi_reg_rd_208:
	mov	0x1f, %r14
	.word 0xf2db8e40  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb0040000  ! 4764: ADD_R	add 	%r16, %r0, %r24
iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_wr_197:
	mov	0x1f, %r14
	.word 0xfef384a0  ! 4768: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a80c20  ! 4773: FMOVRLZ	dis not found

iob_intr_1_396:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_396), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbd641800  ! 4778: MOVcc_R	<illegal instruction>
	.word 0xbbab4820  ! 4779: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbda5c920  ! 4782: FMULs	fmuls	%f23, %f0, %f30
T1_asi_reg_rd_209:
	mov	0xf, %r14
	.word 0xfcdb84a0  ! 4783: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_370:
	setx	0x450006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a44840  ! 4785: FADDd	faddd	%f48, %f0, %f26
	.word 0xb5a4c8e0  ! 4786: FSUBq	dis not found

iob_intr_1_397:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_397), 16, 16)) -> intp(1, 0, 17)
	.word 0xbfa00520  ! 4792: FSQRTs	fsqrt	
	.word 0xb5a00520  ! 4793: FSQRTs	fsqrt	
T1_asi_reg_wr_198:
	mov	0x22, %r14
	.word 0xf6f38e80  ! 4794: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a549c0  ! 4797: FDIVd	fdivd	%f52, %f0, %f24
T1_asi_reg_wr_199:
	mov	0x7, %r14
	.word 0xf0f38400  ! 4800: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_1_398:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_398), 16, 16)) -> intp(1, 0, 17)
	.word 0xb5a40920  ! 4807: FMULs	fmuls	%f16, %f0, %f26
iob_intr_1_399:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_399), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_371:
	setx	0x450206, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_372:
	setx	0x460330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49da1a0  ! 4813: XORcc_I	xorcc 	%r22, 0x01a0, %r26
	.word 0xb5a00520  ! 4814: FSQRTs	fsqrt	
iob_intr_1_400:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_400), 16, 16)) -> intp(1, 0, b)
iob_intr_1_401:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_401), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfaa4820  ! 4818: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00520  ! 4821: FSQRTs	fsqrt	
	.word 0xb3a54860  ! 4822: FADDq	dis not found

	.word 0xb7a54940  ! 4824: FMULd	fmuld	%f52, %f0, %f58
iob_intr_1_402:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_402), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbfa509e0  ! 4830: FDIVq	dis not found

cpu_intr_1_373:
	setx	0x440338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc344000  ! 4834: SUBC_R	orn 	%r17, %r0, %r30
cpu_intr_1_374:
	setx	0x460332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcad8000  ! 4838: ANDNcc_R	andncc 	%r22, %r0, %r30
iob_intr_1_403:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_403), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_210:
	mov	0x11, %r14
	.word 0xf2db89e0  ! 4846: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_404:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_404), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_405:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_405), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb5a80c20  ! 4852: FMOVRLZ	dis not found

	.word 0xb7a00540  ! 4855: FSQRTd	fsqrt	
	.word 0xb9a48840  ! 4857: FADDd	faddd	%f18, %f0, %f28
	.word 0xbfa54920  ! 4858: FMULs	fmuls	%f21, %f0, %f31
iob_intr_1_406:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_406), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_407:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_407), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_375:
	setx	0x44032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_408:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_408), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_200:
	mov	0x2, %r14
	.word 0xf0f38e40  ! 4865: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb151c000  ! 4866: RDPR_TL	<illegal instruction>
	.word 0xbfa80820  ! 4867: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
cpu_intr_1_376:
	setx	0x440219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c8a0  ! 4876: FSUBs	fsubs	%f19, %f0, %f28
iob_intr_1_409:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_409), 16, 16)) -> intp(1, 0, 37)
	.word 0xbda8c820  ! 4881: FMOVL	fmovs	%fcc1, %f0, %f30
iob_intr_1_410:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_410), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb4a4a1c9  ! 4885: SUBcc_I	subcc 	%r18, 0x01c9, %r26
	.word 0xbba5c820  ! 4888: FADDs	fadds	%f23, %f0, %f29
cpu_intr_1_377:
	setx	0x440125, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_211:
	mov	0x3c8, %r14
	.word 0xf4db8e60  ! 4891: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_378:
	setx	0x460306, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_201:
	mov	0x6, %r14
	.word 0xfcf384a0  ! 4893: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb48c0000  ! 4895: ANDcc_R	andcc 	%r16, %r0, %r26
T1_asi_reg_rd_212:
	mov	0x15, %r14
	.word 0xf6db8e60  ! 4896: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_1_411:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_411), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_412:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_412), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_413:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_413), 16, 16)) -> intp(1, 0, 12)
	.word 0xb7a408c0  ! 4908: FSUBd	fsubd	%f16, %f0, %f58
	.word 0xba3da11e  ! 4909: XNOR_I	xnor 	%r22, 0x011e, %r29
iob_intr_1_414:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_414), 16, 16)) -> intp(1, 0, 38)
	.word 0xbba88820  ! 4914: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb1aa0820  ! 4916: FMOVA	fmovs	%fcc1, %f0, %f24
cpu_intr_1_379:
	setx	0x440215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_380:
	setx	0x46000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_381:
	setx	0x47030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_382:
	setx	0x440308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 4924: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb0240000  ! 4925: SUB_R	sub 	%r16, %r0, %r24
cpu_intr_1_383:
	setx	0x470128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba448c0  ! 4929: FSUBd	fsubd	%f48, %f0, %f60
iob_intr_1_415:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_415), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_rd_213:
	mov	0x1c, %r14
	.word 0xf8db8e40  ! 4933: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_384:
	setx	0x470239, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_214:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_385:
	setx	0x46012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_386:
	setx	0x470233, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_215:
	mov	0x1d, %r14
	.word 0xfcdb8e40  ! 4945: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb73d8000  ! 4949: SRA_R	sra 	%r22, %r0, %r27
T1_asi_reg_wr_202:
	mov	0x32, %r14
	.word 0xfaf38e40  ! 4952: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_387:
	setx	0x460327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 4958: FSQRTs	fsqrt	
T1_asi_reg_wr_203:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 4959: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb1a5c8a0  ! 4960: FSUBs	fsubs	%f23, %f0, %f24
cpu_intr_1_388:
	setx	0x450310, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_416:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_416), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb1aa4820  ! 4973: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a4c920  ! 4975: FMULs	fmuls	%f19, %f0, %f24
iob_intr_1_417:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_417), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_389:
	setx	0x440200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a488a0  ! 4979: FSUBs	fsubs	%f18, %f0, %f28
	.word 0xbda00560  ! 4981: FSQRTq	fsqrt	
iob_intr_1_418:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_418), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb1a489a0  ! 4988: FDIVs	fdivs	%f18, %f0, %f24
	.word 0xb4b4e135  ! 4989: ORNcc_I	orncc 	%r19, 0x0135, %r26
iob_intr_1_419:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_419), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_420:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_420), 16, 16)) -> intp(1, 0, 13)
	.word 0xb7aa4820  ! 4994: FMOVNE	fmovs	%fcc1, %f0, %f27
iob_intr_1_421:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_421), 16, 16)) -> intp(1, 0, e)

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

	.xword	0x78e497a458793f8c
	.xword	0x4cc61f6c457b9a74
	.xword	0x3d3eb7929a6555ff
	.xword	0x3318dffb2f4f1e80
	.xword	0xb42153bd8adb65d5
	.xword	0x0bf37b7f80535ca6
	.xword	0x1013a60e696a0ef5
	.xword	0x5f6b1a08515d9818
	.xword	0x4e2e982df1e617a7
	.xword	0x5b894c467e1c5421
	.xword	0xff99a5ccd9ec2a75
	.xword	0xd4b39e8485b98fec
	.xword	0xd3abe66fd89100c9
	.xword	0xe0043e9c14a7d457
	.xword	0x38d85c0a5fd17ab2
	.xword	0xbe4a377ae3ce861d
	.xword	0x21b572f2b122bb5b
	.xword	0xe52a6ed721638c64
	.xword	0xdd50c60c594da932
	.xword	0x0eead73233a4a71f
	.xword	0xad16e4b51e3f1e06
	.xword	0x802a6497799fe154
	.xword	0x081f0a969ae4a5e8
	.xword	0x48a8a197e4bbb096
	.xword	0x9d960f6f661222d2
	.xword	0xab4450038dd044bb
	.xword	0xc102f2d5c9bc850f
	.xword	0xca9ca2e025c597b8
	.xword	0x74dc2ceaadb39777
	.xword	0xd420722fc13a912b
	.xword	0x71182db3308caccf
	.xword	0x70ad3cc2b9291ab5
	.xword	0xa108b4993ca25d4d
	.xword	0x4981db4b54291257
	.xword	0x8b9e47fb8b78cc5d
	.xword	0x4c6e39da94df4212
	.xword	0x7bf827b8a8c055b2
	.xword	0xff02fb9bd915ae1a
	.xword	0xdd24e8de544e72ef
	.xword	0x81c554183e26a76d
	.xword	0x8e76f55b53113770
	.xword	0xc7ef30a5d82cf5c4
	.xword	0x0d0d412d064930f5
	.xword	0xd554e49f51954dae
	.xword	0x1069b24675da9863
	.xword	0xbb2022b91f2ca17c
	.xword	0x189619738ad600ba
	.xword	0xe40c2e78357df855
	.xword	0xd6a59109db0322ca
	.xword	0x56eba2fa4b646231
	.xword	0x2d72d6a96f6ad698
	.xword	0x7dae9a3dc10c3d0a
	.xword	0x75fded826552b80c
	.xword	0xe04f4ad0e0470279
	.xword	0x4761909b2cc74aaa
	.xword	0xa3ce6c24e9fae631
	.xword	0x7e794bd2e804b527
	.xword	0xe7d524d1bd57e5e7
	.xword	0xf7215918c1325054
	.xword	0x08c9fdd88424a5b3
	.xword	0x2a9afd4450790be2
	.xword	0x4ee3a2319932c4a2
	.xword	0x7bc8eee45d468c10
	.xword	0xc66b818c4084a11f
	.xword	0x3fed286fd790961e
	.xword	0xf4b11129faa42226
	.xword	0x9651eb2f619d7b9c
	.xword	0xdad671ea47b01d8f
	.xword	0x901856eb4d5944b5
	.xword	0xd849b3a3b6baae4f
	.xword	0xfc7784a14b262b3b
	.xword	0xe026e0af4551e079
	.xword	0xe1e4f7b98eb1004d
	.xword	0xc7fe39c7960a49c9
	.xword	0x71f58afb48dbb571
	.xword	0x0687c24d5001d856
	.xword	0x769ea7225f8e032a
	.xword	0xc7626eadfb6318fd
	.xword	0x469fc2b0761a51cb
	.xword	0x9409a066c2e65b9c
	.xword	0xae9d792e639cd816
	.xword	0xa918f5e5117e0f1f
	.xword	0x653b2c06def6110a
	.xword	0xb54ec2911d97d237
	.xword	0x2927ddee4be40ec1
	.xword	0x946dc0d380ae0877
	.xword	0x84c3fc34fb30b4de
	.xword	0x1eb2e7b4680967dc
	.xword	0xff6c92ebb0f908ee
	.xword	0x994ec1c1b7edca09
	.xword	0xb85e2b41de4f3ab7
	.xword	0x1577b9726077c632
	.xword	0x556d68de3aea6507
	.xword	0x7b2e9cd01dc4f93a
	.xword	0xdf3eeccf61620335
	.xword	0x01ed3c115a05de39
	.xword	0xe61bf19307810577
	.xword	0x620e7d20774ea186
	.xword	0x71c57fdf7a269e20
	.xword	0x2c9f8ad29e2ceefc
	.xword	0x5bea0165217d8150
	.xword	0xf1c1596c46a734c8
	.xword	0x6185f698606e6300
	.xword	0x22c38515df42478e
	.xword	0xc0e631137723d6b9
	.xword	0x92de6fccf6378e27
	.xword	0x1e0a83b7b722c38b
	.xword	0xcab6377465c6de3f
	.xword	0x401e43ac4a18f412
	.xword	0x3d53327ef1f2c559
	.xword	0x5616b93ff2ff7b66
	.xword	0x3feef4f5b7c7c5c0
	.xword	0x4d1b948e4d354c85
	.xword	0xdbb71de76c53cda6
	.xword	0xe2e2158d1720727a
	.xword	0xf86165dba05401bc
	.xword	0x08d2c186008b8bda
	.xword	0x19a09225ab042cb4
	.xword	0x9e0f0bc63b71eed8
	.xword	0x732f1ab3dfe6012a
	.xword	0x5116034bd6f0e7a8
	.xword	0xdc473c3e411fec66
	.xword	0x75cb20e67b35788b
	.xword	0xc816068aa3c09ab1
	.xword	0x257a1e9c80eca9ad
	.xword	0xe126e81717199050
	.xword	0xba8884447cc781d7
	.xword	0xead390d4c1c193b7
	.xword	0x0e142159803a9977
	.xword	0x8a927adb3434e44a
	.xword	0x640e226939c2c427
	.xword	0xfa81b63a4fb69d1b
	.xword	0x7bad24c6a4855a36
	.xword	0x85cac3621a49c575
	.xword	0xf097e5310d4c341e
	.xword	0xe9bf77068ed16317
	.xword	0x7552bd671349370a
	.xword	0x65334e181c8b172a
	.xword	0xf54cd620397cf075
	.xword	0x6104b6b1948f54ba
	.xword	0x01d7fb676fa14b75
	.xword	0x10f923349d3cf726
	.xword	0xcd7a99261e8f582a
	.xword	0x373268cbc782f304
	.xword	0x7837558b206284f5
	.xword	0xd65e5999721e94c3
	.xword	0xbd873cfe78e56d78
	.xword	0xbd4ade11236abf81
	.xword	0xcab3872216b19aa1
	.xword	0xce4cb4729e43041e
	.xword	0xa520d37051ee40c3
	.xword	0x9d892d7d2358815f
	.xword	0x30b1e93d1e66c524
	.xword	0x7128d388ad5e968b
	.xword	0x4ab947c91cd0770c
	.xword	0xa613bd04e7ae155d
	.xword	0x5555166e03abecc1
	.xword	0xc62dd9e4883bc56f
	.xword	0x2ffc448ada282f78
	.xword	0x5e610b8b6b95dda1
	.xword	0x6d0048df3d57643a
	.xword	0x3deb98dc1efc8866
	.xword	0x951409a59f503256
	.xword	0xa0beff379bc4a7eb
	.xword	0xe1b7b542af0d9875
	.xword	0x84b1b6f9d772a73a
	.xword	0x9a0eb7841ea4cabf
	.xword	0xe2f49d6a0036e9c1
	.xword	0xde61af6df7d86c81
	.xword	0x55bbfc4bd7c9c4a1
	.xword	0x9cbf2f3e2848cb1c
	.xword	0xa19c4ab503c4bdeb
	.xword	0xb8e80ce2a83b2ad9
	.xword	0x9f0d17efa7e074fc
	.xword	0xaf7c825c500d8dd6
	.xword	0x94b8614c12bd71b3
	.xword	0xb9a2addefe67ee54
	.xword	0x9b045539da73b678
	.xword	0x2f3b00f9011a4e74
	.xword	0x699ba595db308378
	.xword	0x5da72efc2726dc47
	.xword	0x4987e6e9a7abffea
	.xword	0xbbc457e6d12051fd
	.xword	0xb2955425229dccfa
	.xword	0xec8d023215b44683
	.xword	0x0acd7ba3ee5a3f0f
	.xword	0x8ce568998bb1df67
	.xword	0xb901272d3ea7cc59
	.xword	0x0333ca0f82243631
	.xword	0x6f45bf09e84afa21
	.xword	0x4c196eef2df4bf59
	.xword	0xc522461369b6a7e5
	.xword	0xf80c986fc448c36a
	.xword	0x015322b9e950b167
	.xword	0x0442b7623b55406e
	.xword	0x7c7aa5dbb39af5ef
	.xword	0x3e800dafd16883a3
	.xword	0x64281262d32bea54
	.xword	0xd45bb7825745ff87
	.xword	0x2cd9cdbb47a58eb4
	.xword	0x1a6e5cbe30cdbf64
	.xword	0x57e0a2a2d4b51114
	.xword	0x86f2d84b9a6c0d8d
	.xword	0xfb2e34fd74af3c30
	.xword	0xebba23ad13cbb3f4
	.xword	0x6dcb03cecffaec7c
	.xword	0xd802cb4c090151c7
	.xword	0x60c2983aaf039a1e
	.xword	0xb5058992e58e0cf3
	.xword	0x10cd5c634919e058
	.xword	0x88bade8164a94f58
	.xword	0xf6dfb6bf43ac2cd3
	.xword	0xeca439c931264878
	.xword	0xcf0ba82f3f70f7e3
	.xword	0x3c25a76a43f37c00
	.xword	0xb3700ac346b4038b
	.xword	0xef85de6733967995
	.xword	0x98cff1eb2d7e2777
	.xword	0x5fd42003c58e9526
	.xword	0x6c33a4926192d3fe
	.xword	0x641b0cca6215e969
	.xword	0xecc8c937b1d9bcff
	.xword	0xb4470d15cf13e97c
	.xword	0xf098f2abb2d32250
	.xword	0x71e8299263a5f911
	.xword	0xd78278e49cf45903
	.xword	0x168dd969ec6faa86
	.xword	0xb3415fe2263dded1
	.xword	0x757772e611941a44
	.xword	0x4eac96e2bfdc606a
	.xword	0x74d25a0d18a6bba3
	.xword	0xc5b0fb795bc140f9
	.xword	0x9e667adde0dda7c4
	.xword	0xacca2fe8fb6611ea
	.xword	0xc2329f42b89a0021
	.xword	0xc3d5a23edac1afe0
	.xword	0x1e644c4cfb29cff6
	.xword	0x534178e93d26766b
	.xword	0x9a54a700f43c14d6
	.xword	0xb57b780f3534fcb6
	.xword	0x49bd7c0e8afebdbe
	.xword	0xce4a0a1d27903b0e
	.xword	0x833d14fb921ede93
	.xword	0x01df3543fc93fe2c
	.xword	0xd5755bbe64a6fc17
	.xword	0x293c2d110ae1ec7c
	.xword	0x830a2d219e2a878f
	.xword	0x6edf9299f024db74
	.xword	0xcf0520682db6357e
	.xword	0x239a23fe867e671c
	.xword	0x5368a6a81d14dce7
	.xword	0xfcca4f8b5faf619b
	.xword	0x53243778ec6b90ce
	.xword	0x0ae058d5f932cb5c
	.xword	0xb9ceb1a0a1a9922e
	.xword	0x505f198755aed94a
	.align 0x2000
	.data
data_start_1:

	.xword	0xb8771881835b51b7
	.xword	0x7937d9847e55db4c
	.xword	0x300a7cfe3248d29c
	.xword	0x6451e21088ca4ebc
	.xword	0x601069bbb383e08d
	.xword	0x74bb724ea2fea0e9
	.xword	0x126a6a8bd9afa80f
	.xword	0xdd4993d7ff137baa
	.xword	0x12711e400a8d4821
	.xword	0x4bb2aacdfe654568
	.xword	0x675c6d17db954e84
	.xword	0xafc0e2f14bc62d51
	.xword	0xfd2629db378fc836
	.xword	0x75110fb30f78a9a0
	.xword	0x145b0b95205b43d3
	.xword	0xebbc42fb726bff7a
	.xword	0x16b725e88b277e35
	.xword	0xd2e4fa15a3145031
	.xword	0x03947577c24fe41d
	.xword	0x453e382b969974bf
	.xword	0xb6c17ff5b6312d29
	.xword	0x2748f7e140e7010f
	.xword	0x332c4b06b0136703
	.xword	0xc9d7166e48f10d23
	.xword	0x6ab3e93b0024f2f4
	.xword	0x645bc34281365571
	.xword	0x89583207cc8fd560
	.xword	0x61c9b36adec4dc4f
	.xword	0x785adf77d7515a52
	.xword	0x02b5f64bfaf2ca45
	.xword	0x3da8a3b5610c42b4
	.xword	0x64c73c33605d5d8a
	.xword	0xc5030e41b7646774
	.xword	0xed9ea63d8d090011
	.xword	0xace8da9d3e70feff
	.xword	0x7f952d2c48ec0b5f
	.xword	0x8ae0cb3f46fab670
	.xword	0x3a0d47957e6cb1b0
	.xword	0x7eb14cac0a1f3d6c
	.xword	0x2fee51598e2e6f9e
	.xword	0x330740f67565644f
	.xword	0x61868a511e6c3ec6
	.xword	0xcf2b07ed1e1c7329
	.xword	0xb4444a41d0030cba
	.xword	0x9919ef9d5db79353
	.xword	0xa106fc4820e7b789
	.xword	0xe3add5f1b4afc90b
	.xword	0x8dabff5ec0d544c3
	.xword	0x1fa862622784304e
	.xword	0x9601f794b866904b
	.xword	0xb041fb675a8e7f69
	.xword	0xd2491de277ac6409
	.xword	0x40ddf41a059cbd4d
	.xword	0x49e047bfc33e29fb
	.xword	0xf5c21f76b857bfa2
	.xword	0x0f6a8099bff738a8
	.xword	0x3e4e44a27530ee17
	.xword	0x0412b6c07c581243
	.xword	0xb9bfb891baa5f9dd
	.xword	0x54f06c6cd6ba7ed5
	.xword	0x5f5f302fb5f36946
	.xword	0xc1dd719ed93001c0
	.xword	0xaeedf933d5521522
	.xword	0x30824d55584b5fb8
	.xword	0x4f4a10498a96f54f
	.xword	0xf7375de8520b98aa
	.xword	0x57f42580812313a5
	.xword	0xf2eb855d94288dda
	.xword	0x720da665cfc138dc
	.xword	0x0bfc24a69c479353
	.xword	0xc357d54e5744f483
	.xword	0xbdeaaf37b588ab6f
	.xword	0x6bd9c433eab8ff99
	.xword	0x794ccb990d0c0ac8
	.xword	0xcfc6e2efc32cba7c
	.xword	0xde26c9fec90657ce
	.xword	0x33a7cf43bc6953d7
	.xword	0x0f6ab8456e414f7f
	.xword	0xc771f384091d77cb
	.xword	0xddade11abb8581cd
	.xword	0xf3bb9c6fdda725ce
	.xword	0xe0609a30d2f3ff65
	.xword	0xe27040446dfeb98e
	.xword	0x307608263a512ab0
	.xword	0xef3e3782c73950a6
	.xword	0x3d58106d9a8f464f
	.xword	0x2069e07103f6e1ce
	.xword	0x27ff6a76a342d6fb
	.xword	0x86589270e12a4a60
	.xword	0x7b36642c8d130e2d
	.xword	0x28153cd54f60a102
	.xword	0xb8b05b1262abe352
	.xword	0xab13e4e281cfa4e6
	.xword	0x8be05181ae62471b
	.xword	0x353fccdad323a7ca
	.xword	0x187bb0c0a2629587
	.xword	0x91f4691cd0b8ffe9
	.xword	0x3516d7211ecddf41
	.xword	0x83198255803e11f9
	.xword	0x43abef8bab470aae
	.xword	0xe1b8005f6d6f98b8
	.xword	0x851440f64de63e94
	.xword	0x0b8193f9175f5df4
	.xword	0xa772ed17e9f38452
	.xword	0xf7bcc3d60ecb379e
	.xword	0x14b4a83cb15c8724
	.xword	0x49bae5726d8f3e9a
	.xword	0xb88ce1d23b89b7fa
	.xword	0x1d6c3fe294aa631f
	.xword	0xcf0e7e2ff96ef2a7
	.xword	0x75824d76401eca85
	.xword	0xcca4cefb3f23ae55
	.xword	0x41a0a7c785006a23
	.xword	0x76f2daeb3a4790e8
	.xword	0x0865aa307c0e346b
	.xword	0xcaf06516e719e6c8
	.xword	0x624ed63d5c0b735f
	.xword	0xb3e3dd5a6fde62c8
	.xword	0x090a4dc7a7d024c4
	.xword	0x43c491b6d42f9feb
	.xword	0xbe2274743610ad12
	.xword	0x6f3f352f1fdc9b81
	.xword	0x26c2c7a1405d34fd
	.xword	0x8d5c684f485157cd
	.xword	0x3b22723b18db37dd
	.xword	0x25b6b9122c3333a5
	.xword	0x64d577a84ea264c7
	.xword	0xbd7dd8fd47ee2ac6
	.xword	0x601be201803b96d2
	.xword	0x55d8884b59a3336a
	.xword	0x3181603f951913ae
	.xword	0xfcb7e6d318ceca71
	.xword	0xf0f9dbbd98f55ed1
	.xword	0xd1185b0cbbd0c5d4
	.xword	0xfef88ff9af2d9c18
	.xword	0x707fa83df768f4e7
	.xword	0x2c8ca1ab8f5f9f4a
	.xword	0x95e45ccd98342ab5
	.xword	0x5d82d09988b9a502
	.xword	0x0e368dadc4066bea
	.xword	0xe55959fdc2f6176e
	.xword	0x86c916417fe56bfc
	.xword	0x68bae01c21cb6481
	.xword	0x697542b420a0e996
	.xword	0x2025b8f7b32910ec
	.xword	0x904ca9bd67b75c5e
	.xword	0x04678b0fd6b80f50
	.xword	0x41f6025cf3b4cd33
	.xword	0xec5d6053c2b0b9d8
	.xword	0xeff4f85ff71ac70d
	.xword	0x53948a52b6456f39
	.xword	0xd94173d20b026ccc
	.xword	0x286a6aedbd070562
	.xword	0x2c3759f919d24efa
	.xword	0xbbc23f6564177fba
	.xword	0xa6422790198c02c1
	.xword	0x19c39a34040b099b
	.xword	0xf692d7da34f586a7
	.xword	0xd78a6d89bc2da55d
	.xword	0x8228f722fcb6e37a
	.xword	0xcde7c9440d232930
	.xword	0x31bd19fb49735eac
	.xword	0x16cb4761cec8219e
	.xword	0xd753de69be6d8887
	.xword	0x39a93d4be4f055c3
	.xword	0xed56470187cc466a
	.xword	0xc0071d76138c3ec8
	.xword	0x38d4e0e975461425
	.xword	0x8205cdbdc64d992e
	.xword	0x41ee58ffa0098c79
	.xword	0x8cbbe7a119fec645
	.xword	0x0e0210ea353e5f9b
	.xword	0xd8a432b3e389fe9a
	.xword	0xb0f3f5bd65339995
	.xword	0x373874f60183cd61
	.xword	0x5f6c6615de108245
	.xword	0x3e2c540596d3c343
	.xword	0x3f9be4f27395c748
	.xword	0x8ed2d708cd8ca5f2
	.xword	0xd43294139648da74
	.xword	0xed77dcb7ede9634b
	.xword	0x06d7385562651613
	.xword	0xb7fcf7ea1c1c06bc
	.xword	0x076c5a5875fd2d58
	.xword	0x3f64524e67c9961e
	.xword	0xde2bc6d99317f4ae
	.xword	0x7b9d53ce1697d78d
	.xword	0x00f3f88fe0a003d3
	.xword	0x689adaef7c79c1cc
	.xword	0x9bd2f6bfc137152b
	.xword	0x0dd1c5613ea018a0
	.xword	0x43490212a4e0f97a
	.xword	0x09425c3681070f46
	.xword	0x8eed3a0434f27d09
	.xword	0x58be5beae414c118
	.xword	0x50c76848798126e5
	.xword	0x2f98fc124d501b42
	.xword	0x00ca57b0aa033d41
	.xword	0x0ad00c029f656d76
	.xword	0xf654f3dd6d9ddeba
	.xword	0x7d8f81f7a13e85e9
	.xword	0x2ef398692afcc979
	.xword	0xe52aa56513c2d55f
	.xword	0x5f1888fa66d12c21
	.xword	0x85a35bf12e0a6ed4
	.xword	0xfd19d01c2140b185
	.xword	0xeaa15395fd872770
	.xword	0xbe4a095f5e130e69
	.xword	0xe426241485385622
	.xword	0x35df2d9373fe4982
	.xword	0x175569680fef49f2
	.xword	0x285fdf3e934215db
	.xword	0x916ade3bdae10089
	.xword	0xf3bc4a01f7af9a25
	.xword	0x0e2d5fa7c8b28ace
	.xword	0x6e323ae050a0575d
	.xword	0x2322debc53783bc8
	.xword	0x73560a8f11d5dc96
	.xword	0x87edf55a35a69514
	.xword	0xc6ba45a8d84c7837
	.xword	0x575c8c86635d9974
	.xword	0xba88dc1315847c21
	.xword	0x9e7b1f7bfccd8e37
	.xword	0x7f19f88c1e1fe422
	.xword	0xd20855951c9a769c
	.xword	0x098f274d3c798323
	.xword	0xaa48c2c5e0cdca3b
	.xword	0xe702b055d3f282ae
	.xword	0x859445e0af02a43c
	.xword	0x4e9962f5b9bdf75b
	.xword	0xb56c120154a01b78
	.xword	0x4a492afdccf06755
	.xword	0xd921477ecc8fd42a
	.xword	0xef72feeda664c1d9
	.xword	0x0bae7540f3fa56dc
	.xword	0xc4f50db2a3efb80a
	.xword	0x7df9ec775c619b7d
	.xword	0x4007e2d7379a3d97
	.xword	0x2d7a491c5e5f51ce
	.xword	0x230968ce4685881e
	.xword	0x3cbc8587a9670aba
	.xword	0xade262fad89deafd
	.xword	0x04f5c09f276e7a3f
	.xword	0xf84c91d8c0c7af46
	.xword	0x930cd0828068e75c
	.xword	0xbb1782b4360f080e
	.xword	0xafe06e03c21dfbae
	.xword	0x6d85a4df08a407e7
	.xword	0x6ccdfd2a2bdce136
	.xword	0xb9b3517910d176db
	.xword	0x8fe406125b8fe43d
	.xword	0xf3a3885ac2584b93
	.xword	0xf471ed58efbf29a2
	.xword	0xc6fa8d90e7f72ad5
	.xword	0x53bbf048bd74c1af
	.xword	0xba93203419f11570
	.align 0x4000
	.data
data_start_2:

	.xword	0x883ec60c596ba714
	.xword	0xeb1cd313ea320dab
	.xword	0x1ef1d2bd8e5bcb7a
	.xword	0x5e169c9b7f26f50d
	.xword	0xeee7ef8fea39e2a8
	.xword	0x9252e2082995b970
	.xword	0xb748748ced65b3ec
	.xword	0x93a9277df065f1a2
	.xword	0x8bb91e666b78a07d
	.xword	0x0794edb55657885b
	.xword	0x08e6ea2d8f7b9a1b
	.xword	0x9678301744778dd9
	.xword	0x18101522c2d5f402
	.xword	0x4f73017095533417
	.xword	0xdfbd5f7f27e1db1a
	.xword	0x82c3f2ef54727824
	.xword	0xba06a01a2d7f345a
	.xword	0xee548a5a664064d8
	.xword	0x7a68f89b79559f97
	.xword	0xc5f5a3cbed8bee19
	.xword	0xf4cddfe1333c6259
	.xword	0x4b7fb84f8ac3ab77
	.xword	0x2333f3fd5549ec65
	.xword	0xf1e25c4a0c7bfd0f
	.xword	0x727b2ddf5c5a7e42
	.xword	0xd8997b4bd9c93897
	.xword	0x5a57cee026ab8a3a
	.xword	0x3d0a0e1cd5dd8998
	.xword	0xd0a1c12ca0e38cb6
	.xword	0xa02d383d0154671f
	.xword	0xa90ce06d87162c62
	.xword	0x7ca878c08ab1e761
	.xword	0x47b327667b4c8401
	.xword	0xaa0f7a80ee7e90e4
	.xword	0x7b73ad933d7e2ba4
	.xword	0x37dde09bb47ebbb0
	.xword	0x7989e16fa0ee2300
	.xword	0x595f713bb6ea29bb
	.xword	0x8d502f0afc1cec54
	.xword	0xc0e0e8ab4505b15e
	.xword	0x605471449dd63c04
	.xword	0xd5c965c59e0dc001
	.xword	0x9fbe190c0f6aab0b
	.xword	0x6459662924f862f9
	.xword	0xbf5ec000310eef09
	.xword	0xe518dbb9f668a0cd
	.xword	0x189b572f39c27b65
	.xword	0xac15f60c242ab0d8
	.xword	0xe84f0761e64800bc
	.xword	0xb2e7b14accde5112
	.xword	0x5e3acbe8810d1f06
	.xword	0x791dc1a7a459598e
	.xword	0x0383aa958b549a62
	.xword	0xb62acae276abaabb
	.xword	0xae43c9d0543a5229
	.xword	0x604230f4a07ec06d
	.xword	0x8b41ce9a995ec294
	.xword	0x0d1a087b0d0afa28
	.xword	0x7251a617063f9147
	.xword	0x26adaeade4ac95f6
	.xword	0xa232b5cd16afd89d
	.xword	0x5a6003fc1974312f
	.xword	0xc244fc78c6da7305
	.xword	0xe824bb9ff41a76ee
	.xword	0xda9261cf5d6532f6
	.xword	0x0c4b887b466b6d86
	.xword	0x5ae522135cfbf389
	.xword	0x2c256ad3ce0f96b4
	.xword	0xb5e4f181539b20cb
	.xword	0x821eda91b244ad3b
	.xword	0x9d6d96f36e3e4b73
	.xword	0x97f46b330ea6b0ea
	.xword	0x0735431e3f4c4805
	.xword	0xd3a94ff7d6466d97
	.xword	0x52142d88d87e8043
	.xword	0xd1772f6ce895c0c5
	.xword	0x9c2af83795f0e987
	.xword	0x71b58bedc1d6dee5
	.xword	0x7bdd4fa0e783bd58
	.xword	0xe24f349daf64539b
	.xword	0xb4e01107303bb5d0
	.xword	0xfb5cb5298ceb0a3d
	.xword	0x4595e1c52a6da3b7
	.xword	0x77e7f088a24bf14c
	.xword	0x72e43ec15850e7a7
	.xword	0x6d8835d8b5b5b52d
	.xword	0x4cb040d5372d9745
	.xword	0x6341e1ed3bcfcc84
	.xword	0x9579386a93e74ab4
	.xword	0xf4f0fdedfc46bb71
	.xword	0xcfc80a61120b7994
	.xword	0xe403832c31c98301
	.xword	0x004b79ffd2fbdcae
	.xword	0xc3c6553fac29bc7c
	.xword	0x2086a338bac3f9c3
	.xword	0x63d8b708e147c08b
	.xword	0x1dda8532062082c0
	.xword	0x1d354b41a2ee8d5d
	.xword	0xe0ade409517fe05a
	.xword	0xe609abc5130f1b0d
	.xword	0xf403e03cccdaef37
	.xword	0x123260f334ad6b4b
	.xword	0x3855ba4c36b7b9cc
	.xword	0x58f3ba0f7ca2b501
	.xword	0x17c0e0bf42094064
	.xword	0x40fce987789997eb
	.xword	0xc5397a624e723cd5
	.xword	0x4d463cc2bc707e6c
	.xword	0x15cd1826f3f619ed
	.xword	0xc378d566061e30da
	.xword	0x7c8a7c0eca58ef4a
	.xword	0xbf951dc8e7e046cb
	.xword	0xd7f8719e53619d23
	.xword	0x0aad6812c67b6b98
	.xword	0xe961cab86f78e071
	.xword	0x7908f1c6b9e149ea
	.xword	0x232d255a4ed85aa9
	.xword	0xdad35f6629b58497
	.xword	0xa9f98aa757326a4a
	.xword	0xc6636e5cdd04ad48
	.xword	0x5d28890f299b2332
	.xword	0x67d24d7a57c04215
	.xword	0x8326e22259c70f7b
	.xword	0x7583fe364bbce285
	.xword	0xa21dd76e49defd49
	.xword	0x2b61efc5338ba4d0
	.xword	0xfed2f7a6e24300ba
	.xword	0xdd811d9581ac883e
	.xword	0x9b21f878e0c9f3f1
	.xword	0xafdbcd91759af6c7
	.xword	0x59f590cb34c91273
	.xword	0xe449b43c93348f3c
	.xword	0xdd5a0a6070243c37
	.xword	0x478afcfbb81875cd
	.xword	0xb1fe2a63d0ca8a88
	.xword	0xa9ff6e2fc1008b15
	.xword	0x7e3be47e6986d7ec
	.xword	0x86d656db8f8e4166
	.xword	0x1cbf30ea84eeef21
	.xword	0x92d3d07a0fc6be01
	.xword	0xacb26da73d3b82a1
	.xword	0x26f52eca02af6e72
	.xword	0xa1a93e7d124c17fd
	.xword	0xa526086bac4be753
	.xword	0xd095260420d32a61
	.xword	0xa4f4ee090eff7fa5
	.xword	0x146a87f68cf8282d
	.xword	0x05b9d107f25f23a4
	.xword	0x1a9591afd60ae1d6
	.xword	0xde0635ebdb09231a
	.xword	0x276433afe5e41f47
	.xword	0xfa47a82f5ea45caf
	.xword	0xc96d07b8b2db7dcc
	.xword	0x3490738c571d7dc8
	.xword	0x6ace3be56b4fa3ec
	.xword	0x9a39858498d40868
	.xword	0x8e425ed1362d2868
	.xword	0x5bc7e110012fa6b5
	.xword	0x93a3a32adcc3b6c4
	.xword	0xb37b0472bad93552
	.xword	0x2cdbf39c70ad9d42
	.xword	0xca207031c14d701c
	.xword	0xed25a7e4603bb7f7
	.xword	0xb3124b3e9f7fa03e
	.xword	0x7ad438a841a1faca
	.xword	0x7faba414bcac051e
	.xword	0x8dadd7f692697650
	.xword	0x40148ac8f617b805
	.xword	0x9b244463325703df
	.xword	0x18c64c8be9a3becb
	.xword	0xf93eabbfee2da8a2
	.xword	0x9f96309c7f7ad27e
	.xword	0xcd60dfae6b6fa5e1
	.xword	0x0e7af7298988a139
	.xword	0x0e0e5dc5db52d17d
	.xword	0xdaca9b5868612b22
	.xword	0x49b7bbfa23fbc09f
	.xword	0x777e81ad797810a0
	.xword	0xd8c0ab849921e29b
	.xword	0x5733718d0aff1557
	.xword	0x3bf6b970235ce027
	.xword	0x08d1f47878b35a8d
	.xword	0xdda6e303e1fe3ff5
	.xword	0xad1d3b78166ba56e
	.xword	0x77aec8a6f903f567
	.xword	0x807d76cd10d62c2d
	.xword	0x7b46e550ca88313b
	.xword	0x3938e2f784e1fb51
	.xword	0x2938d941f48df3a5
	.xword	0x12fc902fa70d1e28
	.xword	0xc6a274241d2ec97e
	.xword	0xdc2a67991447ce22
	.xword	0x9e2d3a4c6245a2f1
	.xword	0x7b4e1be68db901f3
	.xword	0x4a325bcc50a1b2b9
	.xword	0xff6fdc0fad81f48e
	.xword	0x83243c5226983e78
	.xword	0xadae324ce2c223b3
	.xword	0xd320ad3bc935bc00
	.xword	0x5a38e2699405ee4c
	.xword	0x8ae077186646587a
	.xword	0xb19e7f12952502f9
	.xword	0xb216e78d48b45e09
	.xword	0xf3cd5e22467a2f06
	.xword	0xb400d3307b17388e
	.xword	0x56e8de9eee9bcc79
	.xword	0x3779f54dd636f110
	.xword	0x28d156798c897c9f
	.xword	0x8e968eff4cfeaa20
	.xword	0xc01dd92296d71244
	.xword	0xbc864e05b84a83ef
	.xword	0xfd68b2ba55c928b4
	.xword	0xf2b8db4492839a1e
	.xword	0x9d832df5cc4ec80a
	.xword	0xb5d892d337c7659d
	.xword	0xc93d0d459b451cc8
	.xword	0x501523adc137685e
	.xword	0x22e24beb783df257
	.xword	0xe22c4e7dabf6763e
	.xword	0xd5c319bb3da76f51
	.xword	0x6c966edc1b0e596c
	.xword	0xd6a1c3d81b578454
	.xword	0x907b3a149244ca10
	.xword	0x0974973f1d64843e
	.xword	0x71b28bed968faf70
	.xword	0x9dc93383b466ffea
	.xword	0x462da042a8f092bf
	.xword	0x5127ec66fc542b7f
	.xword	0x697eb78bfe54f6db
	.xword	0xe29550174f1ee691
	.xword	0xfb0b82c23cf1339f
	.xword	0xe24d395b5bd7b409
	.xword	0xa28c8f2c4f3d676e
	.xword	0x2a4dbc029cca6dde
	.xword	0x157709566b1e1857
	.xword	0xf425bd3929d03b5d
	.xword	0xc58c3a2869d70f68
	.xword	0x764a40abd2a6f778
	.xword	0x3985661707459629
	.xword	0xee526b420574ad5f
	.xword	0x15f491fb9b30b24d
	.xword	0x21e276527e8a08f4
	.xword	0xa15c8ad762483478
	.xword	0xb9536e3a005ae902
	.xword	0x01ba5664282e4f6f
	.xword	0x25f3633899625149
	.xword	0x0d007138f0a03084
	.xword	0x33cc623ccd2d57c5
	.xword	0xec6646716832704b
	.xword	0x5940a3ba1cb66026
	.xword	0xeb1a9cd94dada7b3
	.xword	0x31c1440e2aa6f66e
	.xword	0x479cff72f6d6d226
	.xword	0x8edbd93c1d45255f
	.xword	0xb93d8e6edb63db7d
	.xword	0x980fcaf476a9198d
	.align 0x8000
	.data
data_start_3:

	.xword	0x54ac0128ee019a88
	.xword	0xbf6dec6dd425e872
	.xword	0x1af17709789f0a43
	.xword	0x8ddb9f74968d6508
	.xword	0x78876be2ac8772a4
	.xword	0x8ce1871ed3ae9d2d
	.xword	0x4a8a01859a4b13eb
	.xword	0x52d4f7a1776f2ca6
	.xword	0x1f31e6962d2e65f9
	.xword	0x01b515587c82841a
	.xword	0x4e0ea6ada4fc9b27
	.xword	0xfb1be545145e0bb6
	.xword	0x04501fc3560eb625
	.xword	0x18f273d9f30e1872
	.xword	0xb6f1fe0a34318f9a
	.xword	0xb4dfb30968a74fa1
	.xword	0xddf2d6f0271e50e8
	.xword	0xc5e75f47ff410876
	.xword	0x7e96683e22f0f8e5
	.xword	0x5dff4d05ab3d3eaf
	.xword	0x24f9216effc61296
	.xword	0xbe4fc6090d7d2996
	.xword	0x41931120aed69a4f
	.xword	0x977234d81404ace6
	.xword	0x310c1003aad31958
	.xword	0x9c843796d7708da6
	.xword	0x590295706244423d
	.xword	0x5cbf616ffd05ee18
	.xword	0x15505a3c5100caf2
	.xword	0x83e90555975aa561
	.xword	0x0c58d5afda0561a2
	.xword	0x2ea68f0fd49c58b8
	.xword	0x66b03f637002139a
	.xword	0x11c03362e672f7c0
	.xword	0x7d33aba3415feece
	.xword	0xa346411789c24ada
	.xword	0x3c4ab6090a0f92a8
	.xword	0x5a6782c29c629a62
	.xword	0x6b565f654ae1d256
	.xword	0x00dd472b7eb3fde1
	.xword	0x6f0b06c2b2fa5d5a
	.xword	0xb9ec78767a17307d
	.xword	0x5bef504ba9fe22fa
	.xword	0xedb3f6748a963fb3
	.xword	0xeaa6833354e90e3b
	.xword	0xe2a7c99aa936a366
	.xword	0x53e2d5d92104e393
	.xword	0x82f64ad9092d4df0
	.xword	0xa25baa817e61254d
	.xword	0x14120e12651ca0e8
	.xword	0xf91a3d9a552dc2e3
	.xword	0x8d55a5b86bc631b1
	.xword	0x974d947c8a9804ed
	.xword	0x7c9e12f8200ec3e4
	.xword	0x8075aafb5735be56
	.xword	0xe40d8557c4cd345d
	.xword	0xfb61b55aca7b4d60
	.xword	0x11ff099df5020a92
	.xword	0xc12f65e1361a5fd5
	.xword	0x3dcf6ed0144521c7
	.xword	0xee667c6b3a0ef350
	.xword	0x81dab0b2cbdc7e5e
	.xword	0xc13983ce92b8fe08
	.xword	0x29d69c9bbc8baee1
	.xword	0x2a573cd6d98d9459
	.xword	0xd53bde93a5d687e9
	.xword	0x7beae49f26daf492
	.xword	0xfc112b4a5fe876fa
	.xword	0x012ef3c35e24c4b6
	.xword	0x1c25400b2c609fde
	.xword	0x81a834a225dde0ee
	.xword	0xb0530ddc6d4b508b
	.xword	0xc386e50db7ae5a6c
	.xword	0xcaa8e308080615f9
	.xword	0x6df1d5a0e033a1d9
	.xword	0x570aea9fd569b89c
	.xword	0x5453261017b199aa
	.xword	0x287457e071b0c5bb
	.xword	0x868b2d018968ff6e
	.xword	0xd38bf6d8b4df83e8
	.xword	0x11eebc125e60c2d8
	.xword	0xd787a9bb786075fd
	.xword	0xbb51036bb73cbfa7
	.xword	0xbd1396bafff7d7f7
	.xword	0x81dd3e86521e57ad
	.xword	0x025a85e57c8c935f
	.xword	0x21642ba23143b02a
	.xword	0xdee7aa42483d0ccd
	.xword	0x41a857dd45f7fe8b
	.xword	0x0307bacf98abe1e7
	.xword	0xd963cd7a8bea1f22
	.xword	0x478ee1a6448f2a98
	.xword	0xa9e6a824d3b60c3f
	.xword	0x7ae7a4d5b9b371cb
	.xword	0xdd7bc23ddf354b79
	.xword	0x52049c4834c18111
	.xword	0xc900e89acf435d4b
	.xword	0xc31e9238415eca77
	.xword	0xbe063597331071e8
	.xword	0xbc5483310ec5e4ff
	.xword	0x476e9bfdea8117b7
	.xword	0x62251c3ba71ef163
	.xword	0x222e5b7e3e6486ab
	.xword	0x186a22c70dd1fa00
	.xword	0x832de983d98e4f0a
	.xword	0xf34a3ee8ee112563
	.xword	0x43416042627214d4
	.xword	0x9ebdefca8aa5f51b
	.xword	0xf762deb839149131
	.xword	0xf1215e37d7ed10d4
	.xword	0xb7f43d2c039424fd
	.xword	0x0013ce8641779c0b
	.xword	0x502a715f209b6641
	.xword	0x93cb80354b130e48
	.xword	0x87789310019addb7
	.xword	0xfda1174e68b1b3b5
	.xword	0x98d4594af200195c
	.xword	0x08f42ff462fb274a
	.xword	0x48260f8edc288ac7
	.xword	0xa46870dc93ab0785
	.xword	0x091397dd78e5623a
	.xword	0x0bf7feb2df13d2c1
	.xword	0xe5f9e0ec214fb203
	.xword	0x38c29573d10772ce
	.xword	0xbc9f08a44f8b0d8a
	.xword	0x73011d0c749cdfad
	.xword	0x087c9989328e2050
	.xword	0x4b644184d6f6b5dd
	.xword	0x6657728d6bbb2367
	.xword	0x7b2b1a770ec0deaa
	.xword	0x7659493ec8437d9d
	.xword	0xa20ddf95bb6acb75
	.xword	0x796699a21c828727
	.xword	0xe9d99062983ba105
	.xword	0xc3284dbc924623af
	.xword	0x6232e6abf524a7dd
	.xword	0x5fdf18318b9d6d0d
	.xword	0x32577957b556cdbe
	.xword	0x07dcb1d48f23b0b1
	.xword	0xc67835a95a85448f
	.xword	0xaa418f301b60e8d6
	.xword	0x6de94eb67cc3a248
	.xword	0x06bdfcfe3e3bf02d
	.xword	0x2980ee66372661f7
	.xword	0x558b125b045276a3
	.xword	0xd89fa5e7be66f0c5
	.xword	0x45bcb37a0105e905
	.xword	0x37b3b18ba80f28bd
	.xword	0x799917cabe55e47e
	.xword	0x246b9ef8280fffff
	.xword	0x1292e292d018831c
	.xword	0x9883c633770ed50a
	.xword	0xbef43f4ee56654f2
	.xword	0x533dab4fde213449
	.xword	0x43eb671f72a896f0
	.xword	0x455d35b414c4081f
	.xword	0xc1e8fc20e9a893ea
	.xword	0x7d124fb1dbabf9ce
	.xword	0x923bfdce87589afa
	.xword	0x439e55176bb9600a
	.xword	0x70d86563c06fdfab
	.xword	0x717cf8514eabc330
	.xword	0xd00da7b28b9eede8
	.xword	0x2c3f8300fc69fe85
	.xword	0x62484381656b003a
	.xword	0xd0176ee553595c5f
	.xword	0x2d1f6a15ce529ea8
	.xword	0xe1f9d21ac0c70f96
	.xword	0x2dc066ca6e04e35b
	.xword	0x583e7ba0fec26545
	.xword	0x1d33dbbd4dc503d7
	.xword	0xe68f64893cb5b211
	.xword	0x759e58607568b626
	.xword	0xa95e7e98bfcb67ae
	.xword	0x2f38bd50afaa6fbc
	.xword	0xc15e2ce985b583e8
	.xword	0x8db2021c65fa4280
	.xword	0x31b983b0e36704a1
	.xword	0x9efad6d11e6ef2ab
	.xword	0xc257bb6d9cf66a9e
	.xword	0x6a015ca16e109aa3
	.xword	0x1142ffa21058be89
	.xword	0x28f88a2e763f0c3c
	.xword	0x3f84474824d633b5
	.xword	0xcb6315ff460bf42e
	.xword	0xed214cf733fd3a3b
	.xword	0xbf5379950848fe2e
	.xword	0x48ae69c923a0d788
	.xword	0x370be079155021a3
	.xword	0x4b72a4a9bd162b8c
	.xword	0x54661d8f70c63db6
	.xword	0xec50b84923442c25
	.xword	0x13d25922c82bee7a
	.xword	0x631e3a370ebc6d63
	.xword	0xac674c734c65b40a
	.xword	0x0ad2d3981519ed72
	.xword	0x7c2b9f8ad543a2dd
	.xword	0xf8033591d4f0a273
	.xword	0xf125e7dec2b86066
	.xword	0xda7ae29965988439
	.xword	0x73ea413d03ccdd63
	.xword	0x5e9dccb5008e5e5b
	.xword	0x35cc44b7750feecc
	.xword	0x0ad391f2dfdacf9c
	.xword	0x3a5b124bfb324a5b
	.xword	0x2883b65b7f967235
	.xword	0xbdbae729078755fe
	.xword	0x7d98cc484f8d5722
	.xword	0xabef72459d37ff1c
	.xword	0x017053d3afec5fb2
	.xword	0x51c64433933f7ab5
	.xword	0x25120fcd4121dc9a
	.xword	0x9271a0128e66a482
	.xword	0x82b41fdc96af3139
	.xword	0xc967148c9359d3ee
	.xword	0xda5c171309478b33
	.xword	0x47ccab1db2eb642a
	.xword	0xb59e497b0b97b77c
	.xword	0xa0820d6a21593624
	.xword	0x5ab42601bc9d5ef6
	.xword	0x998567e3f17a82fb
	.xword	0xdaeba0983aaa9f71
	.xword	0x4e739839ec7f730c
	.xword	0xf88336eb0c964cd0
	.xword	0x8a163712769c841e
	.xword	0x3384cc9fe45f3068
	.xword	0xd15cf7e23ed15ea5
	.xword	0xe39fade8e958deca
	.xword	0xfd54756db0ceccaf
	.xword	0x116339be75f48505
	.xword	0x36c031e5fe7286de
	.xword	0x623d106e6111715f
	.xword	0x7a5f13d5db0d67b8
	.xword	0xe0854fceb8be95f0
	.xword	0x73db7dcf0ef10c43
	.xword	0x02c7667c60e81c5a
	.xword	0x5e22afa4005d95a7
	.xword	0xc14b563bce158804
	.xword	0xb37fae516a833b71
	.xword	0x7bc0af92dc075403
	.xword	0x741829d4f60a9381
	.xword	0xebe3f8defbe7651e
	.xword	0xc5e86136d3baf154
	.xword	0x279fe827b2ac17cb
	.xword	0x36e49a6c0053a55b
	.xword	0xb1104d6fe7f1336e
	.xword	0x6f1eb2e17f2af4b6
	.xword	0xfd5d8b4d1a5cda85
	.xword	0x6bacd33a11f4af96
	.xword	0x7b3bca41dd47725e
	.xword	0xc875e8fc717d9808
	.xword	0xebfed2e26844a201
	.xword	0x34f5a5b0822f21b8
	.xword	0x5a562dea9ced4e44
	.xword	0x22b216bad7d973c5
	.xword	0x707f620225b7d1b3
	.align 0x10000
	.data
data_start_4:

	.xword	0x54fb768f9ff90602
	.xword	0xf57ed7921d8e25bd
	.xword	0x6ad904f522a044a3
	.xword	0x10f4cc3fe487f160
	.xword	0x19174989276489d4
	.xword	0xba490e6eaafe0d8b
	.xword	0x019774410bda7b07
	.xword	0x9375396ab6018db8
	.xword	0xf33fbc4f9189beb1
	.xword	0x14828d8b3193faa8
	.xword	0x8a190795a9d30de4
	.xword	0x4823687ae9c96e03
	.xword	0x734f26eb777a7aae
	.xword	0xa4d769bbc9264de0
	.xword	0x3f21e0300b738704
	.xword	0xcdb7bc2ec63d420a
	.xword	0xba99067645a9f4d0
	.xword	0x9ba500085509db81
	.xword	0x026553be1c79be97
	.xword	0xeb87f9db9bc02ac5
	.xword	0xfce57c8882e5b8f1
	.xword	0x3218b5fe9d97bebf
	.xword	0xb7f7c3c2cf73a3e5
	.xword	0xf17388e004690f69
	.xword	0x9ac4f3977cb124b2
	.xword	0x21c5a3158825b08a
	.xword	0x9166a2a215ef35fc
	.xword	0x612201e61bf970cf
	.xword	0xfc4cbeb40adedf35
	.xword	0x14d0f754f0cf8bf0
	.xword	0xe7271e4dd53854ef
	.xword	0x340e83f74a734a09
	.xword	0x6f1c29b5ae2ae2d1
	.xword	0xba8f675728fc18e3
	.xword	0x36cd2ff1c79e785b
	.xword	0xd0890dcdc1f88908
	.xword	0x32290a12b95d5ff9
	.xword	0xfba4d127eb27d525
	.xword	0xc52146d3e0d71e21
	.xword	0x48db45da5682a0a2
	.xword	0xb3a6c3a4eb670522
	.xword	0xe79e64b3ec28e1a5
	.xword	0x4f6798783bdd425c
	.xword	0x1d4655362e5ea537
	.xword	0x315974808fbdfc22
	.xword	0x8d4e9376606d81ef
	.xword	0xdeaa62b019c8dc75
	.xword	0xe8d97d1c8a974c7a
	.xword	0x4282fccf9fedb28a
	.xword	0xa66a258b7ff07f64
	.xword	0x480b880fc7c24cc6
	.xword	0x642ea6571605cd37
	.xword	0xc2e806f8536e0abe
	.xword	0xdd40639333b04c5e
	.xword	0xa98681d7e3d63fb5
	.xword	0x8f92109e657aa187
	.xword	0x73da2369c3fa960f
	.xword	0x9d616c6751f14d6e
	.xword	0x8e9767b87ac4a719
	.xword	0xbd09a4c86bf7ae8b
	.xword	0x1f853a79d66a1493
	.xword	0xdc75208c571b579e
	.xword	0xb9f09fe5e46be883
	.xword	0x3d140780685dff88
	.xword	0xd3213a2615f89bc1
	.xword	0xd658daa9ed108e25
	.xword	0x1c43a4c9dae0f668
	.xword	0x0366b024e86358bc
	.xword	0x0d1e5f63aa790e79
	.xword	0x0a5da0cc73b4ddd3
	.xword	0xa1f488597124f29c
	.xword	0xe491c6700e84ccbc
	.xword	0xb9c5267794dbfae6
	.xword	0xc09bf871fb3c0e7c
	.xword	0x1e0c1ea4737c136c
	.xword	0x658a8f53ea95670f
	.xword	0x8587ba6dad2272df
	.xword	0xef294f80e8fc082c
	.xword	0xf0a9e2b098603491
	.xword	0xc9e91ff6e1e1dcbc
	.xword	0xe92f4003114fc7b9
	.xword	0x929bea6dc87778fc
	.xword	0xa1a00ef7a0c6ade8
	.xword	0x64211849142e43b3
	.xword	0x8d656b720cbe10a8
	.xword	0x8b76c15d935b60c5
	.xword	0x1ce7b338da3a5a40
	.xword	0xa502a3f48d77d09c
	.xword	0x7d4b5b31145396d6
	.xword	0x46d88b60663f9ba1
	.xword	0x62993156d66aacf9
	.xword	0xbaabe2885884c6e6
	.xword	0xc8955dd62c8f4470
	.xword	0x1ceb98e3dda6edf2
	.xword	0x7eac87e3918456d3
	.xword	0x28a2b3902fd74df2
	.xword	0x7ab6150327233a43
	.xword	0x86d7f6692845e73a
	.xword	0x74ba2a6ed295c42f
	.xword	0x71c57769abb9f4ef
	.xword	0x98e9a2997cdaad26
	.xword	0xd2b22f6a478f9aa2
	.xword	0x250667da6ca432fe
	.xword	0xc3dadb78374ddd58
	.xword	0x2aee72c789c3e72d
	.xword	0x3dab698edfd45c8f
	.xword	0x472041f55e9e6528
	.xword	0x11a28f0526b97ea3
	.xword	0x711a2a14a85337d8
	.xword	0x185a2ae6f6d5fe84
	.xword	0x8dc2cecab3bb829e
	.xword	0x0eb7116bc78f8803
	.xword	0x13cad7bc1bcb19a8
	.xword	0xc151b406d6a71337
	.xword	0x3ff25f87ea097224
	.xword	0x9b2e6158f41c4d14
	.xword	0xe2ee9042427b3891
	.xword	0x8d8f1bcebfc6b6c9
	.xword	0x02ca71d3a3b244d1
	.xword	0x3928c6d539dd750d
	.xword	0xe4f5d56ebdb89d72
	.xword	0xa0372d2a76b8f17e
	.xword	0xc306afefe2699099
	.xword	0xa70745db0eb7b465
	.xword	0x461335f83da6b55a
	.xword	0x22e61a69369ea978
	.xword	0x9e7fda867961095d
	.xword	0x94e2d18a048ef3ed
	.xword	0x21218a5f41ca937d
	.xword	0xd88821f0798de16a
	.xword	0xcdc80a1013b646fe
	.xword	0x50984949cbb7453f
	.xword	0x53adfc24de3a4422
	.xword	0x379a5416ac49ab11
	.xword	0x41ada45526e0332c
	.xword	0x9efc8a6c9f6656c5
	.xword	0x96c03a6c5f58f815
	.xword	0xab257b550c15d5df
	.xword	0x50ac514bdb0ae46b
	.xword	0xd68be9f7314f5c9f
	.xword	0xb3fb48780110a14a
	.xword	0x8be3f2ef4c3390af
	.xword	0x91befa918d6320de
	.xword	0xb0b2dd862e8f060c
	.xword	0x9f0e5666b7e1f61c
	.xword	0x9d9a0dbbb65869bd
	.xword	0x2ed0c0cd8a86322b
	.xword	0x128caca94eb23e31
	.xword	0x715e636aa3f82a46
	.xword	0x193c43e01379a017
	.xword	0x5a0b2c9b5485ca8e
	.xword	0xecd21f9ec0346538
	.xword	0x61545d45aedfd5eb
	.xword	0xb54c86242e590429
	.xword	0x9d892cb6d62c90a6
	.xword	0x0de3fb743c28b5c1
	.xword	0x20e082862b040400
	.xword	0xeb8b050fac17885e
	.xword	0x4ff45ef2fe946a7e
	.xword	0xbcabb1f7934b00c5
	.xword	0x773eb0742c668903
	.xword	0xea1ba1580e8f3f4b
	.xword	0xf525c7d2f3de0e8a
	.xword	0x79a8b209fd2a154e
	.xword	0x7a35d5719351ed01
	.xword	0xce533395b773e88a
	.xword	0xf46e7438b9cc6443
	.xword	0xc36eaa2464c9a290
	.xword	0xfef93de97243a784
	.xword	0x84c23284d145be07
	.xword	0x7145bd29216a6403
	.xword	0x9cdb4277d26fe147
	.xword	0xc7823fdc51624cc5
	.xword	0x6efb30a5cd23ee11
	.xword	0xda3e3a53ecdd9b66
	.xword	0xd653ffae8eed612e
	.xword	0x5fd71b1a887f9573
	.xword	0x03660d6ec7ef4adb
	.xword	0xd68d6232a68bb8cd
	.xword	0x0564c02e8b4c80bb
	.xword	0x5422cb3baa409454
	.xword	0xa3dad546d3edcad4
	.xword	0x7a12f246b1e0815c
	.xword	0x8abb285873d229e0
	.xword	0x025f261f61ba2eef
	.xword	0x72cc35ae070479d6
	.xword	0xd2d4a70a27265f67
	.xword	0x0bcd2498c76e4522
	.xword	0x7912f280c98ef444
	.xword	0x2836392e1e930e9c
	.xword	0xfd71a6aa9a831616
	.xword	0x840681e219630674
	.xword	0xb1601998cd0fb9b0
	.xword	0xe7b0cea56825865c
	.xword	0x5b61030b499b36fc
	.xword	0xa834d7d3af4c8def
	.xword	0x5a7cb5d3ce6b278e
	.xword	0x5c6bc01e7d07aade
	.xword	0x417d826869ed2570
	.xword	0x282adf297bab0643
	.xword	0x35c6a59388b94e5a
	.xword	0xb22bda840b8795de
	.xword	0xfb0fc61c235c47b1
	.xword	0x32cd7221f16af8b6
	.xword	0xdea89d7c2d82f1ce
	.xword	0x4e40839962df4893
	.xword	0x050098de43fd6530
	.xword	0x8eb93058b81bae2c
	.xword	0x168f7c0b52e414aa
	.xword	0xe396e127b5075722
	.xword	0xec765725a70d8fe1
	.xword	0x960349e90b4bd16c
	.xword	0xe45443b10d3468ec
	.xword	0xe0018aad2d904800
	.xword	0xb90e86e15edc5a65
	.xword	0x47e160c4bdb0b9cf
	.xword	0x2e22b3d9fc7fc0c6
	.xword	0xf61eacbbbee4b4bd
	.xword	0xf6dbffc5eb57d43b
	.xword	0x189c8deaa6f28ba0
	.xword	0x96b32bc516206ccc
	.xword	0xdc7898118fdd0977
	.xword	0x57d4da7512606e5f
	.xword	0xbf32f9389f479780
	.xword	0x0f70e6568c1074df
	.xword	0x58dc999b2f0709cb
	.xword	0x0c3fee554115650e
	.xword	0x0b69078765e01932
	.xword	0x3135b088b7060666
	.xword	0x516837c098d34765
	.xword	0x1e6fad8af9d1c7e3
	.xword	0x0bf7d785aea68dd1
	.xword	0xf4fe0bd61dd99974
	.xword	0xbd205ed10245dce8
	.xword	0xef66f561527f7564
	.xword	0xca4e05687a47971f
	.xword	0xf8c662846b8fe499
	.xword	0x11581155d39905d8
	.xword	0xcd3428f32fe79596
	.xword	0x6c5ebae77bd80ffe
	.xword	0x70f2565f9c3b013e
	.xword	0x36e704cfcf3bfb37
	.xword	0xd83eb9d5ae86fff2
	.xword	0x89308a39e5ac7284
	.xword	0xadc9f1c96665a9e9
	.xword	0xe7a443983efc76a4
	.xword	0x249f31662ce83122
	.xword	0xff9daf5e0ad5cdf4
	.xword	0x8d1b99dbaf0b4993
	.xword	0xe01584c6306a2104
	.xword	0x59d2f6625fc35d91
	.xword	0xa5b9af686ddff8a8
	.xword	0x4c732342db255da6
	.xword	0x8e1e67111269b60e
	.xword	0x59c4b3ece1bc3de6
	.xword	0x530a291b434bc47d
	.align 0x20000
	.data
data_start_5:

	.xword	0xfc429521a02da08e
	.xword	0x3abef74eb0117abd
	.xword	0x1f286c699e2472e7
	.xword	0xa93bc1cd67ccc4b1
	.xword	0x391400800f834003
	.xword	0x4ddda370b5da788d
	.xword	0xbed800e49a30b3d5
	.xword	0xa466e407c56a6b9f
	.xword	0x4120d8182d4ce1ee
	.xword	0xe3577a321b74d524
	.xword	0x5298a819303eaa0e
	.xword	0x1fa0aa86f4b6575a
	.xword	0x82fcb6eedfaf5ee6
	.xword	0xd67547eefd550ab7
	.xword	0xcee7b529684a5f2b
	.xword	0x017bed7674b0f4cb
	.xword	0x57928d921e2c33bc
	.xword	0xf77b21481276a58c
	.xword	0x810458862ce57d68
	.xword	0x581cd2161e15cab1
	.xword	0xa850919dc6f77402
	.xword	0xa5d305c2f60e500f
	.xword	0xadd5565f0e2af979
	.xword	0x549ffcc1af232a3b
	.xword	0x941e9bfcfa03502e
	.xword	0xb5e908d3a1241dab
	.xword	0x8ce1d03ac165a24c
	.xword	0x64fa35bff77bc561
	.xword	0x161b9c048e7c4873
	.xword	0xa398b1670e027b2c
	.xword	0xf84da75622d7990e
	.xword	0xb64025dc4f879e81
	.xword	0xd30d0c33d8d8dac3
	.xword	0xde74208bc9e8930b
	.xword	0xc0965eeb702b0523
	.xword	0xce97a47601e88b46
	.xword	0x01fecf4aa5d2f7b0
	.xword	0xe3e59bc718130dc9
	.xword	0x93da38d1251d7697
	.xword	0xf4cad636eded70fe
	.xword	0xa0d9ecb4bf7bd6dc
	.xword	0xbd58b320beff93f2
	.xword	0xfb99e8a5b72c1738
	.xword	0x973e3b845f733355
	.xword	0x1b29ea922043c0b6
	.xword	0xd524645aab3451e7
	.xword	0xc4efb5f8a1abc641
	.xword	0xb8dd38c58a668d54
	.xword	0x8da68646a7774354
	.xword	0xfd54a6bc5494f356
	.xword	0x7a3db297854f63b4
	.xword	0x0878c60d4f85d64a
	.xword	0x3981e1ddf146e527
	.xword	0x73b89fb5b15c4cfa
	.xword	0x37c303ac52da747c
	.xword	0x99e521069f56ffdb
	.xword	0xecff17dadd48cfcb
	.xword	0x1c0785aa3a6ac8ed
	.xword	0xd6c0aef870576d55
	.xword	0xc70ca7cc9a297e89
	.xword	0x923f5f87f570c906
	.xword	0xf67452b28daba4f4
	.xword	0xfbe36a0f1273701b
	.xword	0xc4aaa4e221adf6f7
	.xword	0x81f5b9384dc6e4a7
	.xword	0x7b0347d5adfbb21e
	.xword	0xe29e39124781c8fa
	.xword	0x65362b57f80bec73
	.xword	0x360e00a99d3f0af2
	.xword	0x2a416441dbe2662b
	.xword	0x0644705740cd4268
	.xword	0xff0efd8ce893a2e3
	.xword	0x9f4d70883238065a
	.xword	0xf55c5392674f3d6a
	.xword	0x059a9ba51445a723
	.xword	0xe544ea0e30e5ccee
	.xword	0xb30f352b19dcb5a7
	.xword	0x6eb7fb5dbaf5fc46
	.xword	0x426073589891a81b
	.xword	0xda4370dc297a948a
	.xword	0x60a7698e679ef7d2
	.xword	0x42400c75c3baa338
	.xword	0x0c74e417fdda6580
	.xword	0xcaaf86d22bf6da7a
	.xword	0xa90402a0c04ee035
	.xword	0xc8989d95bfaaa186
	.xword	0x3afffa96f4407d0d
	.xword	0x99d88cb706416818
	.xword	0x7dc194cc7b9c8876
	.xword	0xc77e21cb225ec83c
	.xword	0x436632977588887d
	.xword	0xb9bb1ac9473c436a
	.xword	0x41941242b93c927c
	.xword	0x9c34c7d50f7298a5
	.xword	0x90a8329e1d2b977c
	.xword	0x9e4c73d00e71b6f0
	.xword	0x4c55abdf602792ae
	.xword	0x5a6b2d38f556ba59
	.xword	0x6657f02cbc6d1a37
	.xword	0x3db3d432ee37d978
	.xword	0x5a96de324ce621cc
	.xword	0xb36b3cc6007e070a
	.xword	0xfdbd317ca38e686f
	.xword	0x289f9bf7859114ef
	.xword	0x8551790009ddd218
	.xword	0xb894cea7f69d7134
	.xword	0xbb7e2ce93362840c
	.xword	0x663a19879da667de
	.xword	0xf0d71d6a169496be
	.xword	0xed1c042ee3faea40
	.xword	0xd4ea93aceacbf313
	.xword	0xbec6c061c12620c2
	.xword	0x8d63e32fedebbb1d
	.xword	0xa2f8e81d89f17396
	.xword	0xcc9f56bafe393be5
	.xword	0x5f4689ab9699f32c
	.xword	0x78cb7fd7081a02d9
	.xword	0xdedc137b715a294e
	.xword	0x6271f6f66e9de9a1
	.xword	0x90d1f4ba0270812f
	.xword	0x2f502dd4fa8db843
	.xword	0x0bcea916552ea1d5
	.xword	0x6518bae0efe9f2d4
	.xword	0xaf2b0bb1e9e2adb9
	.xword	0xc181bf9b3de215bc
	.xword	0x7e0505052e78972a
	.xword	0x193520f3d4e879b8
	.xword	0x3734188607372deb
	.xword	0x28516d93e9b15eaf
	.xword	0x91dc5b636d922a2c
	.xword	0x2f0b16bd609f9055
	.xword	0x5ce0791c02fbe3f8
	.xword	0x465749f82da0aea0
	.xword	0x42841dbd7ce84866
	.xword	0x606e2dbdb2edda4c
	.xword	0xcbed910fafe1d276
	.xword	0x2467e4e8fde20008
	.xword	0xf558d2ccd4a7c7c7
	.xword	0xa3774a2e3245d7f5
	.xword	0xd76dbc600ea09534
	.xword	0xdbd94a12c77fad92
	.xword	0x3ddcef8624846078
	.xword	0x116a081b03c97deb
	.xword	0x2095413e656e86ac
	.xword	0x3d80356f62408900
	.xword	0x7baf4e915b7f7572
	.xword	0x2a654482e2b16005
	.xword	0x8cfca210fc6cf01c
	.xword	0xfc57442082ac9166
	.xword	0x479ad37ca4ade3f7
	.xword	0xb0c88115af941162
	.xword	0x2f8ee018ac02fce7
	.xword	0x7458b1987c55d28a
	.xword	0x181fe2eff83efbeb
	.xword	0xa732465b460c1c91
	.xword	0x4c795976fcb546c0
	.xword	0xab8238d25bf4b26a
	.xword	0xa74934ddd10ef02b
	.xword	0xf69853db34082823
	.xword	0x0f1aa8bd9e7221c1
	.xword	0xe590d8cffc9b4c69
	.xword	0x5c4bd35381f6450e
	.xword	0x4e7a0c787f42c8de
	.xword	0x973cb68a424d6550
	.xword	0x1479defaa01a1117
	.xword	0x7ae7449e2de44d64
	.xword	0x1556809ef192236a
	.xword	0x4f25f13ec3c05005
	.xword	0x3aa9cb2d0ac1f368
	.xword	0x65622c43e4ab7c81
	.xword	0x7241816550780ff3
	.xword	0xad1c0dff399d3c27
	.xword	0x766c70625417af51
	.xword	0xa0389b202daa74d3
	.xword	0xc0bb9e07b540cec4
	.xword	0x5011f3fc93cf7694
	.xword	0x669c27f32a77bf8e
	.xword	0x08224ae2caf06b8f
	.xword	0x78d8fc5011af4a55
	.xword	0x740439e955bc0d76
	.xword	0x67276d0a2ac2a835
	.xword	0x4d3f95e0a5e99b6a
	.xword	0xad7eff269499fb34
	.xword	0xf17fbfb91f4b5b8f
	.xword	0xf11a9e523b496ee5
	.xword	0xe556722c08021280
	.xword	0xd14e2aa274eef309
	.xword	0x388707aa7932c83b
	.xword	0x7f889c50aa386b45
	.xword	0x0c40de36c1819bbe
	.xword	0x1af2b6177bac9d67
	.xword	0xc7692d4af63d0a27
	.xword	0x4027fddc187bfdad
	.xword	0x1dd0f887b9a1000d
	.xword	0xf14ee5c98db23e24
	.xword	0x16236c853865248a
	.xword	0xab7f6c4b7407fba1
	.xword	0xe8134ff2d118d65d
	.xword	0x7020df8fb4a89eb1
	.xword	0x2c1018e490e3fdea
	.xword	0x3d234da198ee0fb7
	.xword	0x077fb517bfba1684
	.xword	0xf3b3561aebc82a50
	.xword	0x9aa49a2f4207d63e
	.xword	0x48d01b4c1834c217
	.xword	0x315170ebb0e3613e
	.xword	0x1c270593ff7f9d40
	.xword	0x88233fa39ea135e5
	.xword	0x2bf56e7f9d054679
	.xword	0x46cd41fb23dcb9fa
	.xword	0x26d03a5a50331080
	.xword	0xc365089a9f7951a5
	.xword	0xb0b1a7dc00eb4f5c
	.xword	0xb37173087171f00e
	.xword	0xa228298aca1f103d
	.xword	0x66d7abe970cb89d0
	.xword	0x266183b1db8d0247
	.xword	0x6e70ee015f8ae5e4
	.xword	0x6f550ee3344d242a
	.xword	0xd47df9e9e49a8f75
	.xword	0x4d59ddbfb61cec8c
	.xword	0x83478edaf65a0d19
	.xword	0x5fa5cc5d81b46212
	.xword	0x80c78291a6128c02
	.xword	0x24c6ff0d1fbab0e8
	.xword	0xf17f732e3dbcd6fa
	.xword	0x41815bff01e3f5bb
	.xword	0xd1e80d210783e3ab
	.xword	0xa98b2291eb3393db
	.xword	0xceffb3bb5b4a4dcb
	.xword	0x8d0c11a045aa132f
	.xword	0xcc67bb9d24bc8e2b
	.xword	0xb9a12f53f721c722
	.xword	0xef660fb7ed60e3da
	.xword	0x98eeb9e2885106e6
	.xword	0x2f79442bcae4c9c2
	.xword	0x49497ecb23e920af
	.xword	0xc3ed8d1f9411971f
	.xword	0xfa271d1e03d25ea9
	.xword	0xdfdf0faa1ded3566
	.xword	0xcf1d404dafa944d6
	.xword	0x7048abc00c116a38
	.xword	0x3522157688bb0eeb
	.xword	0x1ee1f81132c55ae5
	.xword	0xd67140c41a5a215e
	.xword	0x0b0618010adbf11f
	.xword	0x6591dfd9626b032e
	.xword	0xb07c328a3ef9c6a5
	.xword	0xa1e100b264b9904b
	.xword	0xa4e07c37f69db97b
	.xword	0xc5a21b8e27ea54e2
	.xword	0xa542d1af9fd26104
	.xword	0x84775b7f5871f62c
	.xword	0x797acefd72baf717
	.xword	0x63e2c7bf474357ee
	.xword	0x8a91f22bffe1fdb0
	.align 0x40000
	.data
data_start_6:

	.xword	0xff4c7d0140ffd6cd
	.xword	0xc4d8e7fa27e377f0
	.xword	0x8f69601fcbd9e7da
	.xword	0xaf129a77aba5b2fc
	.xword	0xe04e2e3cfa35d19e
	.xword	0x922a4adff9b628aa
	.xword	0x391b11c61c369b4e
	.xword	0x8ea308135c4fedf6
	.xword	0x1dbafddd5217613b
	.xword	0x36d55ec7d6ccc61f
	.xword	0x612d4c832a6f2fda
	.xword	0xe513f91241b3f43c
	.xword	0x1b358f9d73c07344
	.xword	0xaa300f2dfd0429a2
	.xword	0xb29b66b011b7c9ee
	.xword	0xc490b6441690f1fe
	.xword	0xeef6f865715c791c
	.xword	0x392104a99b60ebf3
	.xword	0xa3cea1957be4c576
	.xword	0xd65d0cf963992d62
	.xword	0x39296d8e00307074
	.xword	0x572266fe180d8896
	.xword	0xccbe708828c7777a
	.xword	0x8b99fcc1096e20bf
	.xword	0x2b318ce8cef202a3
	.xword	0xad1462d47545f94b
	.xword	0x9050021498428cdb
	.xword	0x34c5b2acb3d3efec
	.xword	0xe82364fd4e3d7797
	.xword	0x02de64ce92749091
	.xword	0x1af9247631cef081
	.xword	0x4694d7325661c815
	.xword	0x779ba4559ca1f034
	.xword	0xf79819e001da3cc5
	.xword	0x1ad799cf75b9792f
	.xword	0xe644ba124113f9cb
	.xword	0x0ff5379f4585048f
	.xword	0x5d8423fca8ab6db9
	.xword	0xdebb209d48b7fb1a
	.xword	0x6eee91b837ac4c41
	.xword	0xafb9669b177d7bce
	.xword	0x3512939243ff2747
	.xword	0x9340ae5f47d2f523
	.xword	0x0f8c60d37b52f396
	.xword	0xa09c7555a7a634e7
	.xword	0x70cf0723153e5839
	.xword	0xe1e804a3a6322272
	.xword	0x3b142035bbcfaf0e
	.xword	0x50a53434724bc0e6
	.xword	0x8c1ed5f1f949a607
	.xword	0x026171ff9e16af1a
	.xword	0xb5a78ce6d2e9abc7
	.xword	0xbd2bf1a274d129c9
	.xword	0x168cb295e25ac12e
	.xword	0xa305ac96451840f8
	.xword	0xadc924f921adcd48
	.xword	0x8ce13df4fd9ab6e2
	.xword	0x923c7f6c300ad52a
	.xword	0xae315dbfbf19f69c
	.xword	0x23b2fb5eee439838
	.xword	0x47bd6fcdda0a60c7
	.xword	0xf6871ba1e88172cc
	.xword	0x8ee40767e61fec2c
	.xword	0x22c03e0b8927af05
	.xword	0x2ad5ac70073f19d0
	.xword	0x83a66b496dc47c38
	.xword	0x8baf3bd62ef422f5
	.xword	0xd2d9c55eb2396a19
	.xword	0xa56424f82c23b282
	.xword	0xa7521a94eb3f5823
	.xword	0xa39d326c2ec50f5f
	.xword	0x17bf4e1178b58264
	.xword	0x1524932ff065fb68
	.xword	0xcf4e7006f86a2583
	.xword	0xe448043b8f500d48
	.xword	0x689971a964967088
	.xword	0xf41af111980307a7
	.xword	0x19f53d284aefe311
	.xword	0xab396fc1c3f75ec5
	.xword	0xd67ae9221a515b50
	.xword	0x8eaddaa592523c55
	.xword	0x2a0e8c12196f3391
	.xword	0x5ce5aed745547909
	.xword	0x3a56409880651b96
	.xword	0xd612a9b677ffaf25
	.xword	0x904d7c82b249d516
	.xword	0x19edfc4b353baf54
	.xword	0x13eb651259677526
	.xword	0x18608ab1cf3f6772
	.xword	0x3d4b1927e8b0a15a
	.xword	0x17d0c855353f845d
	.xword	0x98394d58eafa1703
	.xword	0x20cdd7edab2b6fd5
	.xword	0x4957eb2f0d40f4b7
	.xword	0x7be0767e86d817b2
	.xword	0xf59dc6899d7ed312
	.xword	0x100351aecfb38fdf
	.xword	0x5e98b5eaf25d8572
	.xword	0x55d134faa7eb8711
	.xword	0xa8b970546d3ef0d8
	.xword	0x0bc80c2f906c9654
	.xword	0x02772eb4ee96bba7
	.xword	0x79b668abb4aead18
	.xword	0xd9176da78e5ad5ad
	.xword	0x0f7ad14935eb5921
	.xword	0xfad98a2d796dd91c
	.xword	0x460720db3c17067b
	.xword	0xa94637236e6fb656
	.xword	0x299316df5b5d4ba5
	.xword	0x74a519b57d63ae37
	.xword	0xdd797dd95a666b7a
	.xword	0x74da8dd20c9177b3
	.xword	0xd3f803396918a733
	.xword	0x1e8f87505d0a0b90
	.xword	0xa28c8da2ee9b735f
	.xword	0x910840e2ca177cb7
	.xword	0xd7253c0943fec53a
	.xword	0xb84ad04a81d1bf7f
	.xword	0x75ef30f4c7eb863d
	.xword	0xbd12868875eece58
	.xword	0xe7468b537f638e7e
	.xword	0xb8ec570de0d138fa
	.xword	0x50847d2af8213f3f
	.xword	0xe377ba50482d9cec
	.xword	0x50130a2dbcb845a6
	.xword	0xa4e9d15be38aead7
	.xword	0x5bbcd7b4a21d83bd
	.xword	0xff4eb237742592f0
	.xword	0xa1cb1d1bd6cd0c0d
	.xword	0xda84e21f58987b91
	.xword	0x7ef7eb53539d37ff
	.xword	0xb0321658e087a472
	.xword	0x7b75ad1f3e4b879d
	.xword	0x99d0df843e8797a5
	.xword	0xb1ee6c9df0e797c4
	.xword	0x887067ed83a11135
	.xword	0xc850ed1647bfdc2a
	.xword	0x98190f0b3fd65988
	.xword	0xefe7c96947e6d5a4
	.xword	0xabb6a324411a40fb
	.xword	0x1cc03abf573898bf
	.xword	0xb45e70c2cb2d39b3
	.xword	0x74455b51c251318c
	.xword	0x9bf7e04ab85694e7
	.xword	0x02c2e6eefbd86886
	.xword	0x8a144b752a59b44c
	.xword	0x673281b1d2fd351d
	.xword	0xde4c4ad4ff32ecc0
	.xword	0x9a4e44d8f1c19327
	.xword	0xe9d53787557fb6b7
	.xword	0x0bc5b1ff1b52fbca
	.xword	0x2972a2bd3f1833e7
	.xword	0xa5e9942b998a545f
	.xword	0x5fec2a623a53f9e6
	.xword	0x05b5658e5247ebd3
	.xword	0xcf290b56ba4213e6
	.xword	0x9d843817bce69dc7
	.xword	0xeaa977813219e506
	.xword	0x6eff611628f90ad3
	.xword	0xa99f0e725a87dddd
	.xword	0x2d53ce7f25854b08
	.xword	0xda1a4e9b08f20956
	.xword	0x24646e3f7382f440
	.xword	0x3391e0362c423d0d
	.xword	0xd27f1c5f5d832b9c
	.xword	0x2bba15cf30e21379
	.xword	0x1ca132404c701a23
	.xword	0xb2b04753a28f7a23
	.xword	0x53e79ec10d4d4efc
	.xword	0x64ae1f4309a93687
	.xword	0x05724d477c412980
	.xword	0x630d404a6d4d1bee
	.xword	0x09519ae9ccd3623c
	.xword	0xd32f83d94542658b
	.xword	0xa9dacf5d2951f2e3
	.xword	0x5898f7e13bf65f42
	.xword	0x91e40e2a52696180
	.xword	0x52b3cc9ffd12bcbe
	.xword	0x486d18043b3a8cb7
	.xword	0x442cc98626b45230
	.xword	0xda93f934e2c5b793
	.xword	0x5f3923383e3617b8
	.xword	0x52474c8eff297f1c
	.xword	0xbdd9fd963df65f8b
	.xword	0x22497fdf37e8959a
	.xword	0xa202a29ec2457352
	.xword	0x33d153aaa93c3328
	.xword	0x7f25fad8cdf447c9
	.xword	0xe784124382091684
	.xword	0x8162c62a1a0f2e27
	.xword	0x36734922b74c2909
	.xword	0xe5f4b40d71f522b5
	.xword	0x5ff4cf06cfde57db
	.xword	0x8635751bda75724e
	.xword	0x6fc036ea798ee793
	.xword	0x5538e64f2b101a65
	.xword	0x09752483592f9335
	.xword	0x2c1913c21d12b42c
	.xword	0xd7229456ea81f736
	.xword	0xc4d27a36fee3a1a9
	.xword	0x729112de88840ed1
	.xword	0x7897203bbc31af73
	.xword	0x110d250546bdfc22
	.xword	0xbbdc9388b426c441
	.xword	0x6d20b191cdab0194
	.xword	0x57823d1e1fa39d03
	.xword	0xd30722a3d35d4087
	.xword	0xe8c10dbf33775702
	.xword	0xc592174d25733e6f
	.xword	0xeef0a3b446b75e13
	.xword	0x8a473a5c8d321ced
	.xword	0xa3e6285b27b8af78
	.xword	0x081d392d08e81254
	.xword	0x9de9f6a5f25efb0f
	.xword	0xcdd6d2e377c1b971
	.xword	0xaf5bfa08e956faf6
	.xword	0x700e974244345e0c
	.xword	0x505a0f4edaeece92
	.xword	0xe0c9f0b7dab92f67
	.xword	0xf3748c4fcc48e32b
	.xword	0xb69690e5f75d6b9f
	.xword	0x961232235a468da9
	.xword	0x259a4a87799da170
	.xword	0x2b9a37f747c159c8
	.xword	0xa87c4f1e9af7c451
	.xword	0x2be75239a19b1322
	.xword	0xe7d33c673abb3788
	.xword	0xc49031370d484514
	.xword	0x4f31e92000a6d5fa
	.xword	0x895486d39a457d34
	.xword	0x42ae94427061d773
	.xword	0x08c673b01ec0ccd4
	.xword	0x3d7b3be82f43160e
	.xword	0xc6da25d822b86da8
	.xword	0x62e05c41ac5da894
	.xword	0x0e91b11ec06aed6a
	.xword	0x7cd91e8c9b85a4a1
	.xword	0xe2d7570d9ec41199
	.xword	0x3546ece396353c87
	.xword	0x5baa9e42982df699
	.xword	0x884f63b0ac91ad0a
	.xword	0xcadf2afc42623565
	.xword	0xf6e6d2b03a4ee789
	.xword	0x70ed4c01eaf16e06
	.xword	0xc9f24f9765f9f9c1
	.xword	0x767b21c9a8a5b806
	.xword	0xd681cd546e4510ea
	.xword	0xf27fd4bdaa52b5d8
	.xword	0x72686da2a5c6227d
	.xword	0xd55d292c846a0e0d
	.xword	0xf7d8e9410a61e12b
	.xword	0x5d126bb23ac97bdc
	.xword	0x429fe6e76a392f45
	.xword	0x5f3eccd0a40ffbd2
	.xword	0xe387d9412b24abf9
	.xword	0xec7b6aba44bab7b2
	.align 0x80000
	.data
data_start_7:

	.xword	0x02e76b5be32e76c0
	.xword	0x5a541898997f7b22
	.xword	0x0f86f2903afeddf0
	.xword	0x2662636d64e92c5f
	.xword	0xd6844d5f3b6bf516
	.xword	0xe7e56220dd3330e0
	.xword	0x368860eba08722ff
	.xword	0xe6f177dd2634f4b4
	.xword	0x772976a76f597427
	.xword	0x9b6d0eb9e0076612
	.xword	0x7979c0d18b3313e0
	.xword	0x66002b7dcbcecb60
	.xword	0xd92cd3aee8b1ab62
	.xword	0x74b92287f0d0fb36
	.xword	0x5da54266aa56fff3
	.xword	0xcd78b28ca738ded4
	.xword	0x013c3e10ade9f451
	.xword	0xa641d5499b44d6b0
	.xword	0x59c3af7842913a2e
	.xword	0xaf20c8f35fb09c6b
	.xword	0xb821355a1d993800
	.xword	0xa82fb8532b214797
	.xword	0x42d66caef745fe92
	.xword	0xf84fd1428c87d057
	.xword	0xfc50a711f740d9c7
	.xword	0xbc905f12af9e2f8a
	.xword	0x4325151fa56a9691
	.xword	0x90c7e854960d1231
	.xword	0xd6e7496f44510639
	.xword	0x8666002bea9d8ed9
	.xword	0x92482d15f00e2026
	.xword	0xe5ad918e640482ed
	.xword	0xbbb86164e84b2ea0
	.xword	0x79a3b9bf13b69f10
	.xword	0xfe30c91fbbf85a14
	.xword	0x4a6d9fab892d1d84
	.xword	0x95a9d669b537ceda
	.xword	0xd2575e9e416e60e1
	.xword	0x2343a2e53fb3e307
	.xword	0x5c63b27fc25aeed4
	.xword	0x7079a83e13d5f337
	.xword	0xb9d44e01f1d8f19d
	.xword	0xb7cc99883663d384
	.xword	0xdab5be861106832b
	.xword	0x84388a860e19cf91
	.xword	0x73c6669e9d238353
	.xword	0x13e0dce0274cac0e
	.xword	0x1a6ae2dbad9b21be
	.xword	0x71e754c0bf14b7e0
	.xword	0x640f5bfa4455ae51
	.xword	0x7bbc249810de1a35
	.xword	0xe72ad4973f223d3c
	.xword	0xce3c352c645da805
	.xword	0xaeb02e1fe731f1e0
	.xword	0x2b1e31202cad1ed3
	.xword	0x41eb9d9573b57221
	.xword	0x6ba1885266b519c7
	.xword	0x53a2983c0e62ff43
	.xword	0x613b45c909e93faa
	.xword	0xfb435cbf8ae8b1f5
	.xword	0xaefe7a4e850fefc9
	.xword	0xa804ab5ce386e203
	.xword	0xbec80383d21ef7bd
	.xword	0x8b4981fded6c06b8
	.xword	0x976f037241333f93
	.xword	0xf0b6fb925c4316f6
	.xword	0x155d0aad902f0fc7
	.xword	0xaee7c0abd2f5f2b4
	.xword	0x1bd7bae316686ea9
	.xword	0x1f600111ef84b4e8
	.xword	0xe6c90dc6fda5581c
	.xword	0x08716fc2587c85ba
	.xword	0xd3007700e59e1741
	.xword	0xbb808616a1a007d5
	.xword	0x6b8073386b574947
	.xword	0xa8a60aec2b55ad4b
	.xword	0x1a4a2fe5f5cae254
	.xword	0xae08121b9aba9078
	.xword	0x8abedf298e8d683a
	.xword	0xed3d9a639720faa7
	.xword	0x93b739aa5b9f4e83
	.xword	0x28af1df6bfb46c60
	.xword	0xe0a5d673dc225e02
	.xword	0x7bb3ac6ca380ed63
	.xword	0x0e6d44b71e516843
	.xword	0x96a37a31620015a9
	.xword	0x91e8c065a4124e70
	.xword	0x5f33713f212023c6
	.xword	0x3e6073e0b23daeea
	.xword	0xfd3a557bd7d56b36
	.xword	0x277db1eece3c2bb3
	.xword	0x456e58e1007ddeda
	.xword	0x16885a8635c80a10
	.xword	0x584d2081c209c5ed
	.xword	0xbbe1d0da94328d0a
	.xword	0x01b838292710586c
	.xword	0x157fac60fea9338d
	.xword	0xaca69206e3312a7f
	.xword	0xe10ef4b7aa6dc413
	.xword	0xc51b26140792161a
	.xword	0x1a05d96007455c56
	.xword	0x83dc24b67926279f
	.xword	0x538c875b49c072b1
	.xword	0x561f08032cc47de5
	.xword	0x77112d375b71cf7c
	.xword	0xfbbd9ea27d709fa8
	.xword	0x5ca969fafc17af76
	.xword	0x7bf606769aa983f2
	.xword	0x7016d80b9f3cdae8
	.xword	0x03a8d964a3677231
	.xword	0x46fa8035e1e0088a
	.xword	0x343f97347420a2f4
	.xword	0x91697cec12df5017
	.xword	0x5bfb12f70d418bbd
	.xword	0x35cac69a708cea3c
	.xword	0x95f276d074e15957
	.xword	0xeeb864d7b00b13e1
	.xword	0x76b0e5fb7b672b9e
	.xword	0xb9566eea441a488d
	.xword	0x47080c91be28474c
	.xword	0x2c55a39d7e7c5c25
	.xword	0x80a8ebbc89d25ca2
	.xword	0x1fd18b91b04906d6
	.xword	0xcdece3c01baa573a
	.xword	0x9c4df1394a142dfe
	.xword	0x3ebba0f325523c02
	.xword	0x6eacb9f2cf526ae4
	.xword	0xb932d2cbed8e34fe
	.xword	0xb22319165d4bcc52
	.xword	0xe2382f1f081f4751
	.xword	0x55fa1c15ef0ff568
	.xword	0x4acfe73f679e7113
	.xword	0x77a4f650d4b06456
	.xword	0x18c9d6a113149fba
	.xword	0xd9b60d2c57324154
	.xword	0xdaf107131b48c946
	.xword	0x7a9a68cc38fe135e
	.xword	0x7c9467a35c5f184c
	.xword	0x3f4c3c5152b5142e
	.xword	0x97d02d17c47a0da5
	.xword	0xfd6f1dcf368d662a
	.xword	0x0be23cb6ea538422
	.xword	0xda129f436c93a362
	.xword	0x6b3be649bb83dad1
	.xword	0xda3cd86966628a24
	.xword	0x446825a39578b7a3
	.xword	0x78607814688286e9
	.xword	0x1f6093f99dea25cd
	.xword	0xf43981ace1d6187a
	.xword	0xd340bed28f193127
	.xword	0x9462d8e81948cf31
	.xword	0xc0cb623bddf972ea
	.xword	0x58fdec26355e9c34
	.xword	0x3a8f81663bee739b
	.xword	0x6eedcd2dbf42fc63
	.xword	0x81be4da19401b236
	.xword	0x6307009c6b05dc7b
	.xword	0xe66ea364ef2d8f0a
	.xword	0x1344c92310bce0a5
	.xword	0x8fdf86e116eccd9a
	.xword	0x2084e497cb4bfeb7
	.xword	0xaf289bb4431941ce
	.xword	0x16a6beb5835f3850
	.xword	0xbb5a18b86ab5e426
	.xword	0xb5fda38db4a36b40
	.xword	0xee9d1d046748ca02
	.xword	0xd6bcd448b5c85ae6
	.xword	0x0f1a6c1bfffa69a7
	.xword	0xf90feadb389e5170
	.xword	0xe0cfc0be4d54f2ab
	.xword	0xbcc60d07eb568a98
	.xword	0xc29759784e73799b
	.xword	0x1ca76162370f48c5
	.xword	0xc912466ba99fa9ca
	.xword	0xb6d73569bd307651
	.xword	0x38ccf35362015c98
	.xword	0xee1550fab7ae48d1
	.xword	0x0003724be927470a
	.xword	0x9968aa73da18ed31
	.xword	0x0064e98d4b12a9c4
	.xword	0x2c27da5a4692b839
	.xword	0x90a9d213b965dfb2
	.xword	0x2cbdeadd0d32a922
	.xword	0x584a7be077f92b32
	.xword	0x22bfb3dcf3f74340
	.xword	0x9c01efdb338a9574
	.xword	0x11366e975a40555b
	.xword	0x6f06128acda24a13
	.xword	0x608b2ea926d3567a
	.xword	0x749848b05f31c03d
	.xword	0xc3e0a990d7899636
	.xword	0xed8dda57ef4e7452
	.xword	0xeaae54cc80842878
	.xword	0x232aa04ddf62053c
	.xword	0x18ca52cc3f7c0def
	.xword	0xccf5254e660a891a
	.xword	0x6c27344fd5874b42
	.xword	0x554abc80ae79d43f
	.xword	0x21ed8613d0692578
	.xword	0x4956432f9c6bbe41
	.xword	0x274af7fdaa185bfa
	.xword	0x0be52a22ba79dba4
	.xword	0x0b7027e80936b977
	.xword	0xe19d748e3471f653
	.xword	0x1f70768b3c4db5e6
	.xword	0x89daefa9b6246e56
	.xword	0x6065d4508471d95f
	.xword	0xf8323ff4e3b8f41a
	.xword	0x32de2299625abdd9
	.xword	0xba5cfb7ba1efbdf9
	.xword	0xf35f5fc82a7db6a1
	.xword	0x1e4ef519650b0707
	.xword	0x11d5c80d944f40d3
	.xword	0xe4ecc5afc4ad0fe4
	.xword	0xddd04dc19a1312fc
	.xword	0xde47238123c8e9b1
	.xword	0xb40f8005437540d7
	.xword	0xfe1852dd99fef4fa
	.xword	0x9533ec0dde155a20
	.xword	0xf8ef7b24c9a5c2b4
	.xword	0x14cc3ce369f09a6d
	.xword	0x09b998b815e520a5
	.xword	0x892b7acd19d70684
	.xword	0x05375f685e89f3ad
	.xword	0x11a774d59a5acf56
	.xword	0x99c5506794161e67
	.xword	0x04123e61b54122e2
	.xword	0xa930504ca5ec8cc9
	.xword	0x4b2adb99d2ddc6bb
	.xword	0x7f277f7fed151aa1
	.xword	0xaf161974488c0421
	.xword	0xbc3f486eda752b04
	.xword	0xe278caef67a7f2eb
	.xword	0x82c3e6ec131004b6
	.xword	0x1689075b339905af
	.xword	0x8742a55c973739e9
	.xword	0x6ac44d1555c0e9a4
	.xword	0x88c104eaa6060d88
	.xword	0x1ddb726263714bf1
	.xword	0x8c89e320e36db5ee
	.xword	0x50f9fa80b2c612d9
	.xword	0x8a22e7001b1d5d4d
	.xword	0x42837ecd475ebc90
	.xword	0x88e52d8e7b837ccf
	.xword	0x8b1052f0045ec523
	.xword	0xf28ddb1124bf3297
	.xword	0x0a85f1371a848909
	.xword	0x84bdaf634d67e09e
	.xword	0xc375286d7434e41a
	.xword	0x277e89e78da9c9f8
	.xword	0x2559f821f12dfa45
	.xword	0x97853b8f4db929b8
	.xword	0x7a1e2aafc1edc262
	.xword	0x2a9bd33853f11545
	.xword	0x487d4fd3ce06e4e6
	.xword	0xf89908d9385a94d7



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
!!#   int iob_intr_cnt = 0;
!!#   int cpu_intr_cnt = 0;
!!#   int asi_reg_rdcnt = 0;
!!#   int asi_reg_wrcnt = 0;
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
!!#   IJ_bind_thread_group("diag.j", 36, th_all,  0xf);
!!#   IJ_bind_thread_group("diag.j", 37, th_wn,    0x1);
!!#   IJ_bind_thread_group("diag.j", 38, th_fp,    0x2);
!!#   IJ_bind_thread_group("diag.j", 39, th_ld,    0x4);
!!#   IJ_bind_thread_group("diag.j", 40, th_st,    0x8);
!!#   IJ_bind_thread_group("diag.j", 41, th_ldst,  0xc);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 43,"{16}" );
!!#   IJ_set_rvar ("diag.j", 44, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 45, Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Ft_Rs1, "{16..23}");
!!#   IJ_set_ropr_fld ("diag.j", 48, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 49, ijdefault, Ft_Simm13, "13'b0 000r rrrr rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 50, ijdefault, Ft_Rd, "{24..31}");
!!# 
!!#   // ASR read/write parametes
!!#   IJ_set_rvar ("diag.j", 53, Rv_asi_va, "{ 0x0..0x38, 0x3c0..0x3c8 }");
!!#   IJ_set_ropr_fld ("diag.j", 54, Rop_asi_reg, Ft_Rs1, "{14}");
!!#   IJ_set_ropr_fld ("diag.j", 55, Rop_asi_reg, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 56, Rop_asi_reg, Ft_Rd,  "{24..31}");
!!#   IJ_set_ropr_fld ("diag.j", 57, Rop_asi_reg, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld ("diag.j", 58, Rop_asi_reg, Ft_Imm_Asi, "{0x72, 0x73, 0x74, 0x25, 0x20, 0x4f}");
!!# 
!!#   // IO HW interrupt vector
!!#   IJ_set_rvar ("diag.j", 61, Rv_intr_vect, "6'brr rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 63, Rv_intr_disp_reg, 
!!#                "46'{0},"     // RSVD0 
!!# 	       "2'brr,"      // Type
!!#                "3'b000,"     // RSVD1 
!!#                "5'b000rr,"   // THREAD 
!!#                "2'b00,"      // RSVD2
!!#                "6'brr rrrr"  // VECTOR 
!!#               );
!!# 
!!#   IJ_set_rvar ("diag.j", 72, Rv_ma_cntl, "12'b0001 r100 0000");
!!# 
!!#   // Random data pattern
!!#   IJ_set_rvar ("diag.j", 75, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   // ldst memory address
!!#   IJ_set_rvar ("diag.j", 78, Rv_data_sec, "{0..7}");
!!#   IJ_set_rvar ("diag.j", 79, Rv_ldst_var, "{16..23}");
!!# 
!!#   // HPSTATE/HTSTATE write data
!!#   //IJ_set_rvar (Rv_hpstate, "12'h1rrr rr0r r0r1");
!!#   IJ_set_ropr_fld ("diag.j", 83, Rop_hpstate, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 84, Rop_hpstate, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 85, Rop_hpstate, Ft_Simm13, "13'br 1rrr rr0r r0r0");
!!# 
!!#   // TL & GL write data
!!#   IJ_set_rvar ("diag.j", 88, Rv_tl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 89, Rop_tl, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 90, Rop_tl, Ft_Rs2, "{0}");
!!#   //IJ_set_ropr_fld (Rop_tl, Ft_Simm13, "13'b0 0000 0000 00rr");
!!#   IJ_set_ropr_fld ("diag.j", 92, Rop_tl, Ft_Simm13, "{0, 1, 2}");
!!# 
!!#   IJ_set_rvar ("diag.j", 94, Rv_gl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 95, Rop_gl, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 96, Rop_gl, Ft_Rs2, "{0}");
!!#   //IJ_set_ropr_fld (Rop_gl, Ft_Simm13, "13'b0 0000 0000 00rr");
!!#   IJ_set_ropr_fld ("diag.j", 98, Rop_gl, Ft_Simm13, "{0, 1, 2}");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 100, th_all, 8, 0, Rv_rand64);
!!# 
!!#   // Floating point register initializaation
!!#   IJ_printf ("diag.j", 103, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#   IJ_printf ("diag.j", 104, th_all, "\twrpr\t%%g0, 0, %%pil\n");
!!# 
!!#   IJ_printf ("diag.j", 106, th_all, "\twr\t%%g0, 4, %%fprs\n");
!!#   IJ_printf ("diag.j", 107, th_all, "\tsetx\tdata_start_0, %%r1, %%g7\n");
!!#   for (i = 0; i < 32; i++) {
!!# 	IJ_printf  ("diag.j", 109, th_all,"\tldd\t[%%g7+%d], %%f%d\n", (i*8), (i*2));
!!#   }
!!#   IJ_printf ("diag.j", 111, th_all, "\tsetx\tfsr_data, %%r1, %%g7\n");
!!#   IJ_printf ("diag.j", 112, th_all, "\tstx\t%%fsr, [%%g7]\n");
!!#   IJ_printf ("diag.j", 113, th_all, "\tldx\t[%%g7], %%g4\n");
!!#   IJ_printf ("diag.j", 114, th_all, "\tsetx\t%%hi(0x0f000000), %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 115, th_all, "\tor\t%%g4, %%g3, %%g4\n");
!!#   IJ_printf ("diag.j", 116, th_all, "\tstx\t%%g4, [%%g7]\n");
!!#   IJ_printf ("diag.j", 117, th_all, "\tldx\t[%%g7], %%fsr\n");
!!# 
!!#   // VA watchpoint enable
!!#   IJ_printf ("diag.j", 120, th_all, "\tsetx\t%%hi(0x1ffe0000f), %%g1, %%g2\n");
!!#   IJ_printf ("diag.j", 121, th_all, "\tstxa\t%%g2, [%%g0] 0x45\n");
!!#   IJ_printf ("diag.j", 122, th_all, "\tmov\t0x38, %%g3\n");
!!#   IJ_printf ("diag.j", 123, th_ldst, "\tsetx\tdata_start_0, %%g1, %%g2\n");
!!#   IJ_printf ("diag.j", 124, th_all, "\tstxa\t%%g2, [%%g3] 0x58\n");
!!# 
!!#   // Initialize the scratch pad registers
!!#   IJ_printf ("diag.j", 127, th_all, "Init_scratchpad:\n");
!!#   IJ_printf ("diag.j", 128, th_all, "\twr\t%%g0, 0x4f, %%asi\n");
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 130, th_all, "\tstxa\t%%l%0d, [0x%0x] %%asi\n", i, (i*8));
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 133, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 
!!#   IJ_th_fork("diag.j", 136,0x2, 0x4, 0x8, -1);;
!!# 
!!#   // Initialize Rs1 (va) for threads 2, 3
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 140, th_ldst, "\tsetx\tdata_start_%d, %%g1, %%r%d\n", i, (16+i));
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
!!#   IJ_th_join("diag.j", 147,0xf);
!!#   IJ_th_start ("diag.j", 148,Seq_Start, NULL, 1);
!!# 
!!#   IJ_printf ("diag.j", 150, th_all, "\t.data\nfsr_data:\n\n");
!!#   IJ_printf  ("diag.j", 151, th_all,"\t.xword\t0x0000000000000000\n");
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 153, th_all, "\t.align 0x%x\n", (1<<(i+12)));
!!#     IJ_printf ("diag.j", 154, th_all, "\t.data\ndata_start_%d:\n\n", i);
!!#     for (j = 0; j < 256; j++) {
!!# 	IJ_printf  ("diag.j", 156, th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
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
!!# 	spec_inst
!!# 	| comm_inst
!!# 	{
!!# 	  IJ_generate ("diag.j", 196, th_all, $1);
!!# 	}
!!# 	| spill_trap 
!!# 	{
!!# 	  IJ_generate ("diag.j", 200, th_wn, $1);
!!# 	}
!!# 	| fp_all 
!!# 	{
!!# 	  IJ_generate ("diag.j", 204, th_fp, $1);
!!# 	}
!!# 	| load 
!!# 	{
!!# 	  IJ_generate ("diag.j", 208, th_ld, $1);
!!# 	}
!!# 	| store
!!# 	{
!!# 	  IJ_generate ("diag.j", 212, th_st, $1);
!!# 	}
!!# 	| set_va %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_generate ("diag.j", 216, th_ldst, $1);
!!# 	}
!!# ;
!!# 
!!# spec_inst:
!!# 	iob_intr
!!# 	| cpu_intr
!!# 	| spu_rsrv_illgl %rvar  Rv_low_wt
!!# 	| cntx_demap	 %rvar  Rv_low_wt
!!# ;
!!# 
!!# comm_inst:
!!# 	alu
!!# 	| read_priv_reg	 %rvar  Rv_low_wt
!!# 	| write_priv_reg %rvar  Rv_low_wt
!!# 	| read_asi_reg
!!# 	| write_asi_reg
!!# 	| change_priv	%rvar  Rv_mid_wt
!!# ;
!!# 
!!# change_priv:
!!# 	mHPRIV
!!# 	{
!!#           IJ_printf ("diag.j", 239, th_ldst, "\tta\tT_CHANGE_HPRIV\n");
!!# 	}
!!# 	| mNONHPRIV
!!# 	{
!!#           IJ_printf ("diag.j", 243, th_ldst, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	}
!!# 	| mTL1
!!# 	{
!!#           IJ_printf ("diag.j", 247, th_ldst, "\tta\tT_CHANGE_TO_TL1\n");
!!# 	}
!!# 	| mTL0
!!# 	{
!!#           IJ_printf ("diag.j", 251, th_ldst, "\tta\tT_CHANGE_TO_TL0\n");
!!# 	}
!!# ;
!!# 
!!# set_va: tWRHPR_HPSTATE_I %ropr  Rop_hpstate
!!# 	{
!!# 	  IJ_printf ("diag.j", 257, th_ldst, "\tsetx\tdata_start_%rd, %%g1, %%r%rd\n", Rv_data_sec, Rv_ldst_var);
!!#           IJ_printf ("diag.j", 258, th_ldst, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 259, th_ldst, "\tmov\t0x38, %%g1\n");
!!#           IJ_printf ("diag.j", 260, th_ldst, "\tstxa\t%%r%d, [%%g1] 0x58\n", IJ_get_rvar_val32 ("diag.j", 260, Rv_ldst_var));
!!#         } 
!!# ;
!!# 
!!# write_priv_reg:
!!# 	tWRPR_PSTATE_I
!!# 	| tWRPR_TPC_I 
!!# 	| tWRPR_TNPC_I 
!!# 	| tWRPR_TSTATE_I 
!!# 	| tWRPR_TT_I
!!# 	| tWRPR_TICK_I
!!# 	| tWRPR_TL_I %ropr  Rop_tl
!!# 	| tWRPR_GL_I %ropr  Rop_gl
!!# 	| tWRPR_PIL_I
!!# ;
!!# 
!!# read_priv_reg: 
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
!!# read_asi_reg:
!!# 	tLDXA_R %ropr  Rop_asi_reg
!!# 	{
!!#           IJ_printf ("diag.j", 292, th_all, "T%y_asi_reg_rd_%d:\n", asi_reg_rdcnt);
!!#           IJ_printf ("diag.j", 293, th_all, "\tmov\t0x%rx, %%r14\n", Rv_asi_va);
!!# 	  asi_reg_rdcnt++;
!!# 	}
!!# ;
!!# 
!!# write_asi_reg:
!!# 	tSTXA_R %ropr  Rop_asi_reg
!!# 	{
!!#           IJ_printf ("diag.j", 301, th_all, "T%y_asi_reg_wr_%d:\n", asi_reg_wrcnt);
!!#           IJ_printf ("diag.j", 302, th_all, "\tmov\t0x%rx, %%r14\n", Rv_asi_va);
!!# 	  asi_reg_wrcnt++;
!!# 	}
!!# ;
!!# 
!!# load:	
!!# 	tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R
!!# 	| tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I
!!# 	| tLDSBA_R | tLDSHA_R | tLDSWA_R | tLDUBA_R | tLDUHA_R | tLDUWA_R
!!# 	| tLDSBA_I | tLDSHA_I | tLDSWA_I | tLDUBA_I | tLDUHA_I | tLDUWA_I | tLDXA_I
!!# 	| mBLK_LD
!!# 	{
!!#           IJ_printf ("diag.j", 314, th_fp, "\tlda\t[%%r%d + %%g0] 0xf0, %%f2\n", IJ_get_rvar_val32 ("diag.j", 314, Rv_ldst_var));
!!# 	}
!!# ;
!!# 
!!# store:
!!# 	tSTB_R | tSTH_R | tSTW_R | tSTX_R | tSTB_I | tSTH_I | tSTW_I | tSTX_I
!!# 	| tSTBA_R | tSTHA_R | tSTWA_R
!!# 	| tSTBA_I | tSTHA_I | tSTWA_I | tSTXA_I
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
!!# 	tSAVE_I | tSAVE_R
!!# ;
!!# 
!!# cntx_demap: itlb_demap | dtlb_demap
!!# ;
!!# 
!!# itlb_demap: mIDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 348, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 349, th_all, "\tmov\t0, %%g1\n");
!!#           IJ_printf ("diag.j", 350, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 351, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 352, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	};
!!# 
!!# dtlb_demap: mDDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 357, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 358, th_all, "\tmov\t8, %%g1\n");
!!#           IJ_printf ("diag.j", 359, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 360, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 361, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           IJ_printf ("diag.j", 362, th_all, "\tflush\n");
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
!!# 	  IJ_printf ("diag.j", 376, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 377, th_all, "\tmov\t0x80, %%g1\n");
!!# 	  IJ_printf ("diag.j", 378, th_all, "\tmov\t0x%rx, %%g2\n", Rv_ma_cntl);
!!# 	  IJ_printf ("diag.j", 379, th_all, "\tstxa\t%%g2, [%%g1] 0x40\n");
!!# 	  IJ_printf ("diag.j", 380, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#         }
!!# ;
!!# 
!!# cpu_intr:
!!# 	mCPU_INTR
!!# 	{
!!#           IJ_printf ("diag.j", 387, th_all, "cpu_intr_%y_%d:\n", cpu_intr_cnt);
!!# 	  IJ_printf ("diag.j", 388, th_all, "\tsetx\t0x%llrx, %%g1, %%o0\n", Rv_intr_disp_reg);
!!#           IJ_printf ("diag.j", 389, th_all, "\tta\tT_SEND_THRD_INTR\n");
!!# 	  cpu_intr_cnt++;
!!# 	}
!!# ;
!!# 
!!# iob_intr:
!!# 	mIOB_INT
!!#         {
!!#           IJ_printf ("diag.j", 397, th_all, "iob_intr_%y_%d:\n", iob_intr_cnt);
!!#           IJ_printf ("diag.j", 398, th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.iob_intr_%y_%d), 16, 16)) -> intp(%y, 0, %rx)\n", iob_intr_cnt, Rv_intr_vect);
!!#           iob_intr_cnt++;
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
