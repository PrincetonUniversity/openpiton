// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_2_s1.s
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
   random seed:	20042182
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

	setx 0x1d20a9fd17131d47, %g1, %g0
	setx 0x0eeb617f21ac4312, %g1, %g1
	setx 0x7d33556ab5247b6f, %g1, %g2
	setx 0x4da1d719e3c6e5f7, %g1, %g3
	setx 0x63eb8dfae6ba1a77, %g1, %g4
	setx 0xe2e5dfc5297cc971, %g1, %g5
	setx 0xea75b232c6360177, %g1, %g6
	setx 0xb9a5e68c844558c1, %g1, %g7
	setx 0x95e3f2bfb5ec841d, %g1, %r16
	setx 0x4ad280669c44967d, %g1, %r17
	setx 0xf960f749f805cad4, %g1, %r18
	setx 0xdc66fb11d010bf68, %g1, %r19
	setx 0x4c3f60cf85cdd456, %g1, %r20
	setx 0x1755fbdbb28b72aa, %g1, %r21
	setx 0xebc360bf009c33d8, %g1, %r22
	setx 0xc759d2ae133ab02a, %g1, %r23
	setx 0x8ce59a18dda4a9bb, %g1, %r24
	setx 0x85d1f8caade20130, %g1, %r25
	setx 0x4b231574a9e1b378, %g1, %r26
	setx 0xc6373ba38cbd4671, %g1, %r27
	setx 0xe7e600faa4b7fc63, %g1, %r28
	setx 0x30b97b258b99d214, %g1, %r29
	setx 0x1083db00179bbb38, %g1, %r30
	setx 0x58746a4d988acee8, %g1, %r31
	save
	setx 0xd97d108ee302d213, %g1, %r16
	setx 0x66f5f475e5107235, %g1, %r17
	setx 0xd20d6bd314e73083, %g1, %r18
	setx 0x06204fde8052a5e4, %g1, %r19
	setx 0xa5e37bc1fdb38385, %g1, %r20
	setx 0x05dd7427ce6c6d7a, %g1, %r21
	setx 0xf1260d5042dc07e3, %g1, %r22
	setx 0x5ad1c72e80de89b4, %g1, %r23
	setx 0xab46f0ff53b99ebc, %g1, %r24
	setx 0xa4e7db7f156ca083, %g1, %r25
	setx 0xdfced3432ba30fa0, %g1, %r26
	setx 0x1010343f262810bf, %g1, %r27
	setx 0xc486b56ce820aa66, %g1, %r28
	setx 0x94948f0052caef4d, %g1, %r29
	setx 0x4918efe62a62c8a3, %g1, %r30
	setx 0x02eb7bdc25133db4, %g1, %r31
	save
	setx 0x0fb254b95c4f84e4, %g1, %r16
	setx 0x95792f217c1a50ee, %g1, %r17
	setx 0x4986ce11f36b1687, %g1, %r18
	setx 0x389c9866fdf4bb97, %g1, %r19
	setx 0x00d611517f33c9e2, %g1, %r20
	setx 0x0be9a8525fb3db4b, %g1, %r21
	setx 0xaf8a9508d8f05905, %g1, %r22
	setx 0xb9c147d10c24192b, %g1, %r23
	setx 0x5d3a61f033841c00, %g1, %r24
	setx 0xe3aec8832372f00a, %g1, %r25
	setx 0x8d42880db3af0a91, %g1, %r26
	setx 0xdab3d2cab37d41a2, %g1, %r27
	setx 0xacbe34a76771f9f3, %g1, %r28
	setx 0xd29a618c315c854b, %g1, %r29
	setx 0x1d92ca6b1fe0ebfd, %g1, %r30
	setx 0x515b8b265327507f, %g1, %r31
	save
	setx 0xeace59a0789ea3c7, %g1, %r16
	setx 0xf55099e4dc83a314, %g1, %r17
	setx 0x9f21fe6cdd92dc84, %g1, %r18
	setx 0xba0e2712dfc286f7, %g1, %r19
	setx 0x1400fe95e5a43907, %g1, %r20
	setx 0x8b50ca242fe2cc5e, %g1, %r21
	setx 0xfc0aaae12afe2344, %g1, %r22
	setx 0x0c0dbb2219ca71d2, %g1, %r23
	setx 0x0718223a05a121d0, %g1, %r24
	setx 0x240fe23269b984fc, %g1, %r25
	setx 0xe63d22a03c82906d, %g1, %r26
	setx 0xdcabe064419a77d9, %g1, %r27
	setx 0x20e3d22e426cbe35, %g1, %r28
	setx 0xb2441d2b0542e8bd, %g1, %r29
	setx 0x9ac14e673adc0e5e, %g1, %r30
	setx 0xd109fa57109049f2, %g1, %r31
	save
	setx 0x30236aaed6676db5, %g1, %r16
	setx 0xfb22085873670257, %g1, %r17
	setx 0x91a240bd05abc3a1, %g1, %r18
	setx 0xa1f72655239ffdda, %g1, %r19
	setx 0x92037ce9bb400c6a, %g1, %r20
	setx 0xbaded0271de824ec, %g1, %r21
	setx 0x8d50efc10790ca32, %g1, %r22
	setx 0x28f15f274de521b1, %g1, %r23
	setx 0xcf6f3a0cb7aeff8b, %g1, %r24
	setx 0x5177def1d63f93ca, %g1, %r25
	setx 0xcdd6b675b84cf748, %g1, %r26
	setx 0xb5245ae9c838eb7a, %g1, %r27
	setx 0x303438171c690cfb, %g1, %r28
	setx 0xc862fd4bf8178ce3, %g1, %r29
	setx 0x75e0714ebd51b762, %g1, %r30
	setx 0x36654c2aef0f11b9, %g1, %r31
	save
	setx 0x1ede5bb7edbf9bd0, %g1, %r16
	setx 0xb806bfcd5dc0317f, %g1, %r17
	setx 0x89428b5c9414a1c1, %g1, %r18
	setx 0xb64dc6e6e7396980, %g1, %r19
	setx 0xecd34c32986dc0fd, %g1, %r20
	setx 0x982ce48f29e0cffa, %g1, %r21
	setx 0xf3eb71f3995c08ed, %g1, %r22
	setx 0xe8812ae43f8c1153, %g1, %r23
	setx 0x72ae571df3bb7c61, %g1, %r24
	setx 0x3ccb28e1dcc6f797, %g1, %r25
	setx 0x846819f588e617b2, %g1, %r26
	setx 0x1d58f827b679fdf3, %g1, %r27
	setx 0xad33a29f6d4e630e, %g1, %r28
	setx 0x044dfd260b6cf53b, %g1, %r29
	setx 0xdc6f626f02cb4df0, %g1, %r30
	setx 0xfe89ef802134b35c, %g1, %r31
	save
	setx 0x167a03afd89ca5a8, %g1, %r16
	setx 0x533ded356d861a7f, %g1, %r17
	setx 0x9cb7a07c8fb608b2, %g1, %r18
	setx 0xa649c8fc7f071330, %g1, %r19
	setx 0x8d286dd2ac226931, %g1, %r20
	setx 0xbada5f5fd554515f, %g1, %r21
	setx 0xa5544db8fc37a40c, %g1, %r22
	setx 0x99a34359e0d21b83, %g1, %r23
	setx 0x059336ec143ceb1e, %g1, %r24
	setx 0x8e52938a5e1e04b5, %g1, %r25
	setx 0xa04df2009c497160, %g1, %r26
	setx 0x8ca1053d5ca1d734, %g1, %r27
	setx 0x64be60f67408d47f, %g1, %r28
	setx 0xb2e9fa3affbb29c2, %g1, %r29
	setx 0xabf4dbc9550e14dc, %g1, %r30
	setx 0xb2680439695ff064, %g1, %r31
	save
	setx 0x2b41404184845771, %g1, %r16
	setx 0x3555b45886290700, %g1, %r17
	setx 0x15a266fb455581bc, %g1, %r18
	setx 0x71f3118bb1499e39, %g1, %r19
	setx 0x7ffb57e0fc7ce718, %g1, %r20
	setx 0x9c43d49a950ae655, %g1, %r21
	setx 0xf4bbbb106d47f398, %g1, %r22
	setx 0x7b7183b814e4fccd, %g1, %r23
	setx 0xae023c629a8ac065, %g1, %r24
	setx 0x4fa7da9b74ed7bfe, %g1, %r25
	setx 0x6012a4a4c8dbe084, %g1, %r26
	setx 0xdce9ea5c8afcd1dd, %g1, %r27
	setx 0x42b585ca5750839a, %g1, %r28
	setx 0x5447e90367cddaa9, %g1, %r29
	setx 0x8545f506bee00e92, %g1, %r30
	setx 0xcffaf99c565409ed, %g1, %r31
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
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 9)
	.word 0xb5e58000  ! 4: SAVE_R	save	%r22, %r0, %r26
	.word 0xb9e560c1  ! 5: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_wr_0:
	mov	0x36, %r14
	.word 0xfcf38e40  ! 9: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_0:
	mov	0x1b, %r14
	.word 0xf0db8e80  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb7e44000  ! 11: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_rd_1:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 12: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb5e4e164  ! 17: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e4c000  ! 20: SAVE_R	save	%r19, %r0, %r25
	.word 0xbeb40000  ! 23: SUBCcc_R	orncc 	%r16, %r0, %r31
	.word 0xbfe48000  ! 26: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_1:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 28: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb7e4a133  ! 31: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_2:
	mov	0x10, %r14
	.word 0xf4f38e40  ! 33: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_2:
	mov	0x33, %r14
	.word 0xf4db8e60  ! 36: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbde44000  ! 37: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 9)
	.word 0xb3e48000  ! 40: SAVE_R	save	%r18, %r0, %r25
	.word 0xbfe48000  ! 42: SAVE_R	save	%r18, %r0, %r31
	.word 0xbfe44000  ! 47: SAVE_R	save	%r17, %r0, %r31
	.word 0xb5e4a133  ! 49: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb0248000  ! 51: SUB_R	sub 	%r18, %r0, %r24
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_3:
	mov	0x10, %r14
	.word 0xfedb8400  ! 55: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_0:
	setx	0x1f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_rd_4:
	mov	0x2b, %r14
	.word 0xf6db84a0  ! 58: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbfe461fe  ! 59: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e42006  ! 60: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e4c000  ! 64: SAVE_R	save	%r19, %r0, %r26
	.word 0xbbe46141  ! 69: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb4ad0000  ! 70: ANDNcc_R	andncc 	%r20, %r0, %r26
T0_asi_reg_rd_5:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 76: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 34)
	.word 0xb7e54000  ! 81: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_1:
	setx	0x1e000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_2:
	setx	0x1e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 84: SAVE_R	save	%r18, %r0, %r28
	.word 0xb3e48000  ! 88: SAVE_R	save	%r18, %r0, %r25
	.word 0xb93c8000  ! 93: SRA_R	sra 	%r18, %r0, %r28
	.word 0xbe0c0000  ! 94: AND_R	and 	%r16, %r0, %r31
T0_asi_reg_rd_6:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 95: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_7:
	mov	0x12, %r14
	.word 0xf8db8e40  ! 97: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e5c000  ! 105: SAVE_R	save	%r23, %r0, %r24
	.word 0xbbe5a03f  ! 110: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_3:
	mov	0x33, %r14
	.word 0xf8f38e40  ! 111: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfe54000  ! 112: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_3:
	setx	0x1d0326, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_8:
	mov	0x2c, %r14
	.word 0xfadb8e40  ! 122: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_9:
	mov	0x2d, %r14
	.word 0xfadb8e60  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T0_asi_reg_rd_10:
	mov	0x15, %r14
	.word 0xfadb8400  ! 125: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_rd_11:
	mov	0x2a, %r14
	.word 0xf0db8400  ! 126: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_rd_12:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 131: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_4:
	setx	0x1e0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 139: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_13:
	mov	0x13, %r14
	.word 0xf0db8400  ! 140: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e5c000  ! 143: SAVE_R	save	%r23, %r0, %r28
	.word 0xbde561b0  ! 144: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e54000  ! 146: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_14:
	mov	0x3c4, %r14
	.word 0xf6db84a0  ! 149: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbbe58000  ! 152: SAVE_R	save	%r22, %r0, %r29
	.word 0xb9e4a1c4  ! 159: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb7e5a111  ! 162: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_4:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 163: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbbe5a06a  ! 165: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe5e1bc  ! 166: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbeb44000  ! 167: SUBCcc_R	orncc 	%r17, %r0, %r31
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 22)
	.word 0xb5e58000  ! 170: SAVE_R	save	%r22, %r0, %r26
	.word 0xb5e561e1  ! 172: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_5:
	setx	0x1d0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_5:
	mov	0x15, %r14
	.word 0xf6f384a0  ! 179: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_6:
	setx	0x1e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e181  ! 181: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_7:
	setx	0x1d0338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbfe54000  ! 185: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_wr_6:
	mov	0x32, %r14
	.word 0xfaf384a0  ! 187: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_8:
	setx	0x1c031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 190: SAVE_R	save	%r22, %r0, %r24
	.word 0xb7e54000  ! 194: SAVE_R	save	%r21, %r0, %r27
	.word 0xbde50000  ! 196: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_9:
	setx	0x1d0320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_10:
	setx	0x1f0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_7:
	mov	0xf, %r14
	.word 0xf6f38e40  ! 203: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_15:
	mov	0x5, %r14
	.word 0xf8db84a0  ! 204: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb4c56071  ! 207: ADDCcc_I	addccc 	%r21, 0x0071, %r26
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_11:
	setx	0x1f0224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_12:
	setx	0x1f010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_16:
	mov	0x2b, %r14
	.word 0xf6db8e40  ! 213: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1e4e135  ! 215: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbe0560fa  ! 218: ADD_I	add 	%r21, 0x00fa, %r31
T0_asi_reg_rd_17:
	mov	0x35, %r14
	.word 0xfcdb8e60  ! 219: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xba850000  ! 220: ADDcc_R	addcc 	%r20, %r0, %r29
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 17)
	.word 0xbc0da05e  ! 224: AND_I	and 	%r22, 0x005e, %r30
	.word 0xb3e56187  ! 225: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe50000  ! 226: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe48000  ! 228: SAVE_R	save	%r18, %r0, %r29
	.word 0xb8c5a0d6  ! 229: ADDCcc_I	addccc 	%r22, 0x00d6, %r28
T0_asi_reg_wr_8:
	mov	0x15, %r14
	.word 0xf0f38e80  ! 231: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb1e5e155  ! 232: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xba448000  ! 233: ADDC_R	addc 	%r18, %r0, %r29
cpu_intr_0_13:
	setx	0x1f0108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_14:
	setx	0x1c0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 238: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_15:
	setx	0x1e013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_9:
	mov	0x14, %r14
	.word 0xf8f384a0  ! 243: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb7e54000  ! 244: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_wr_10:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 246: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_wr_11:
	mov	0x24, %r14
	.word 0xf8f38400  ! 247: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_18:
	mov	0x32, %r14
	.word 0xfadb8e40  ! 251: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_19:
	mov	0x15, %r14
	.word 0xf6db8e60  ! 254: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_16:
	setx	0x1d0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb444c000  ! 259: ADDC_R	addc 	%r19, %r0, %r26
cpu_intr_0_17:
	setx	0x1e0335, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_20:
	mov	0x1a, %r14
	.word 0xfcdb8400  ! 263: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbde40000  ! 264: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_18:
	setx	0x1d0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_12:
	mov	0x3c8, %r14
	.word 0xfef38e60  ! 268: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1e5e124  ! 270: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb3e4e0c2  ! 272: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb8c58000  ! 273: ADDCcc_R	addccc 	%r22, %r0, %r28
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_wr_13:
	mov	0x5, %r14
	.word 0xf4f389e0  ! 277: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_14:
	mov	0x5, %r14
	.word 0xf0f389e0  ! 279: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_19:
	setx	0x1e001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_21:
	mov	0x25, %r14
	.word 0xf8db8e40  ! 283: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_15:
	mov	0x2b, %r14
	.word 0xf8f38e60  ! 287: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb3e5c000  ! 288: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_20:
	setx	0x1f0125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb3e48000  ! 293: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_16:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 294: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_0_21:
	setx	0x1f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_22:
	setx	0x1f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_wr_17:
	mov	0x29, %r14
	.word 0xfaf38e40  ! 308: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbbe46002  ! 309: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_23:
	setx	0x1d002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_24:
	setx	0x1f0017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_25:
	setx	0x1f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e42177  ! 318: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e4c000  ! 319: SAVE_R	save	%r19, %r0, %r27
	.word 0xb5e42095  ! 320: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e50000  ! 322: SAVE_R	save	%r20, %r0, %r24
	.word 0xb9e4c000  ! 324: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_26:
	setx	0x1d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 331: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_27:
	setx	0x1e0200, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_22:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 334: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbde46111  ! 339: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe461d1  ! 343: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_28:
	setx	0x1e0010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_29:
	setx	0x1f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_23:
	mov	0x18, %r14
	.word 0xfcdb8400  ! 355: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb5e54000  ! 356: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_30:
	setx	0x1f0201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, d)
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb43ca156  ! 361: XNOR_I	xnor 	%r18, 0x0156, %r26
	.word 0xb5e5a1f4  ! 362: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e4a080  ! 363: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_18:
	mov	0x14, %r14
	.word 0xf6f38e40  ! 365: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_31:
	setx	0x1c0028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_32:
	setx	0x1e022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 371: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_19:
	mov	0x3c3, %r14
	.word 0xf2f384a0  ! 372: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_wr_20:
	mov	0x3c0, %r14
	.word 0xfcf38e60  ! 373: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb7e521b5  ! 374: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbd7de401  ! 375: MOVR_I	movre	%r23, 0x1, %r30
	.word 0xb9e5203d  ! 376: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_33:
	setx	0x1d0335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_34:
	setx	0x1c012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 383: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_24:
	mov	0xa, %r14
	.word 0xfadb89e0  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_25:
	mov	0x2d, %r14
	.word 0xf2db8e40  ! 388: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb9e5a12a  ! 389: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 0)
	.word 0xb7e5e112  ! 392: SAVE_I	save	%r23, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_35:
	setx	0x1e032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e152  ! 402: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_36:
	setx	0x1c010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_26:
	mov	0xd, %r14
	.word 0xf0db89e0  ! 405: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_37:
	setx	0x1e012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23de1b2  ! 409: XNOR_I	xnor 	%r23, 0x01b2, %r25
cpu_intr_0_38:
	setx	0x1f0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 411: SAVE_R	save	%r19, %r0, %r24
	.word 0xb3e50000  ! 412: SAVE_R	save	%r20, %r0, %r25
	.word 0xbde44000  ! 413: SAVE_R	save	%r17, %r0, %r30
	.word 0xb1e50000  ! 417: SAVE_R	save	%r20, %r0, %r24
	.word 0xbfe4619e  ! 420: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_21:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 421: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 24)
	.word 0xb9e4612f  ! 424: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e48000  ! 425: SAVE_R	save	%r18, %r0, %r25
	.word 0xb7e5c000  ! 431: SAVE_R	save	%r23, %r0, %r27
	.word 0xbbe58000  ! 435: SAVE_R	save	%r22, %r0, %r29
	.word 0xbbe420e7  ! 436: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e44000  ! 438: SAVE_R	save	%r17, %r0, %r26
	.word 0xb1e4614e  ! 439: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_39:
	setx	0x1c0301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_40:
	setx	0x1d032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e461cf  ! 445: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_41:
	setx	0x220322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 456: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_27:
	mov	0x19, %r14
	.word 0xf2db84a0  ! 461: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb6b52188  ! 464: SUBCcc_I	orncc 	%r20, 0x0188, %r27
T0_asi_reg_wr_22:
	mov	0x16, %r14
	.word 0xf4f38e40  ! 466: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e5c000  ! 468: SAVE_R	save	%r23, %r0, %r26
	.word 0xbfe40000  ! 469: SAVE_R	save	%r16, %r0, %r31
	.word 0xbcad6160  ! 470: ANDNcc_I	andncc 	%r21, 0x0160, %r30
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 20)
	.word 0xbde5e12b  ! 473: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e50000  ! 477: SAVE_R	save	%r20, %r0, %r27
	.word 0xbead4000  ! 480: ANDNcc_R	andncc 	%r21, %r0, %r31
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 31)
	.word 0xb7e50000  ! 486: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_42:
	setx	0x220316, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_28:
	mov	0x11, %r14
	.word 0xf8db8e80  ! 489: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_43:
	setx	0x210130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 35)
	.word 0xbbe4a013  ! 493: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe58000  ! 497: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 8)
	.word 0xb3e56057  ! 501: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_23:
	mov	0x3c7, %r14
	.word 0xf2f389e0  ! 504: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb5e4e0ba  ! 507: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_44:
	setx	0x23023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_24:
	mov	0x34, %r14
	.word 0xf2f38e80  ! 510: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb3e54000  ! 511: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_rd_29:
	mov	0x34, %r14
	.word 0xf2db8e60  ! 512: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbfe46022  ! 514: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_45:
	setx	0x21003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_25:
	mov	0xf, %r14
	.word 0xfaf38e40  ! 518: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3e58000  ! 520: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_26:
	mov	0x32, %r14
	.word 0xf4f389e0  ! 523: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_46:
	setx	0x22000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc05a17f  ! 528: ADD_I	add 	%r22, 0x017f, %r30
	.word 0xb1e48000  ! 529: SAVE_R	save	%r18, %r0, %r24
	.word 0xb3e5e037  ! 535: SAVE_I	save	%r23, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_27:
	mov	0x31, %r14
	.word 0xf4f38e80  ! 538: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 24)
	.word 0xb3e460d8  ! 541: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 18)
	.word 0xb7e48000  ! 545: SAVE_R	save	%r18, %r0, %r27
	.word 0xb9e5207e  ! 546: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 24)
	.word 0xb1e5c000  ! 550: SAVE_R	save	%r23, %r0, %r24
	.word 0xb7e44000  ! 552: SAVE_R	save	%r17, %r0, %r27
	.word 0xb9e56138  ! 558: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e5c000  ! 563: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_wr_28:
	mov	0x37, %r14
	.word 0xf6f38e80  ! 565: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb3e5e04f  ! 566: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e5a11a  ! 568: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_47:
	setx	0x210325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2350000  ! 570: SUBC_R	orn 	%r20, %r0, %r25
cpu_intr_0_48:
	setx	0x220335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_49:
	setx	0x220037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca5e113  ! 574: SUBcc_I	subcc 	%r23, 0x0113, %r30
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_50:
	setx	0x200116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_51:
	setx	0x210309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e560ae  ! 581: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e42031  ! 587: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e46095  ! 588: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_52:
	setx	0x22011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_29:
	mov	0x34, %r14
	.word 0xfcf38400  ! 590: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_53:
	setx	0x22013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_54:
	setx	0x21020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_55:
	setx	0x21033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_30:
	mov	0x6, %r14
	.word 0xf4f384a0  ! 603: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 28)
	.word 0xbbe4c000  ! 605: SAVE_R	save	%r19, %r0, %r29
	.word 0xb9e4a162  ! 607: SAVE_I	save	%r18, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e50000  ! 609: SAVE_R	save	%r20, %r0, %r24
	.word 0xb7e54000  ! 610: SAVE_R	save	%r21, %r0, %r27
	.word 0xb3e48000  ! 611: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_56:
	setx	0x230201, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_31:
	mov	0x3c0, %r14
	.word 0xf0f38e80  ! 614: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_57:
	setx	0x23020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 617: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_32:
	mov	0x12, %r14
	.word 0xfaf38e60  ! 619: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbfe58000  ! 621: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_58:
	setx	0x22031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_59:
	setx	0x220026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43dc000  ! 627: XNOR_R	xnor 	%r23, %r0, %r26
cpu_intr_0_60:
	setx	0x20011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_61:
	setx	0x230338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e521b4  ! 633: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_62:
	setx	0x23010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_63:
	setx	0x22021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e56108  ! 637: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe4a114  ! 640: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_64:
	setx	0x200115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_65:
	setx	0x23000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a178  ! 649: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_66:
	setx	0x230030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 651: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, e)
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_67:
	setx	0x230035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc95c000  ! 665: ORcc_R	orcc 	%r23, %r0, %r30
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 38)
	.word 0xbde5a158  ! 672: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe50000  ! 673: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_68:
	setx	0x22012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02c6185  ! 675: ANDN_I	andn 	%r17, 0x0185, %r24
	.word 0xb60421f4  ! 676: ADD_I	add 	%r16, 0x01f4, %r27
	.word 0xb5e460c2  ! 677: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_69:
	setx	0x200339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe421ed  ! 686: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e48000  ! 688: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 34)
	.word 0xb5e4c000  ! 693: SAVE_R	save	%r19, %r0, %r26
	.word 0xbfe46022  ! 695: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_rd_30:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 696: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbde4c000  ! 699: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 15)
	.word 0xb69d2170  ! 702: XORcc_I	xorcc 	%r20, 0x0170, %r27
cpu_intr_0_70:
	setx	0x23031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_31:
	mov	0x25, %r14
	.word 0xfedb8e60  ! 705: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb5e4c000  ! 706: SAVE_R	save	%r19, %r0, %r26
	.word 0xb1e46113  ! 707: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_rd_32:
	mov	0x34, %r14
	.word 0xf8db89e0  ! 709: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb1e421dd  ! 710: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_33:
	mov	0x6, %r14
	.word 0xf6db8400  ! 712: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_rd_34:
	mov	0x33, %r14
	.word 0xfedb8e40  ! 713: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3e40000  ! 717: SAVE_R	save	%r16, %r0, %r25
	.word 0xb4940000  ! 723: ORcc_R	orcc 	%r16, %r0, %r26
	.word 0xb3e4e03b  ! 724: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe4a0c1  ! 725: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e561cf  ! 728: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_71:
	setx	0x20020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9641800  ! 730: MOVcc_R	<illegal instruction>
	.word 0xb5e46047  ! 733: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e5e171  ! 734: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_72:
	setx	0x200324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca58000  ! 738: SUBcc_R	subcc 	%r22, %r0, %r30
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_73:
	setx	0x20023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_33:
	mov	0x2e, %r14
	.word 0xf2f38e60  ! 749: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb7e4a072  ! 752: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb48c0000  ! 754: ANDcc_R	andcc 	%r16, %r0, %r26
T0_asi_reg_rd_35:
	mov	0x31, %r14
	.word 0xf0db8e60  ! 758: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_74:
	setx	0x220305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 760: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_rd_36:
	mov	0x3c2, %r14
	.word 0xf8db84a0  ! 761: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbbe5a097  ! 762: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_rd_37:
	mov	0x17, %r14
	.word 0xf2db8e40  ! 763: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_34:
	mov	0x9, %r14
	.word 0xfaf38e80  ! 765: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb4246109  ! 770: SUB_I	sub 	%r17, 0x0109, %r26
	.word 0xb72cb001  ! 773: SLLX_I	sllx	%r18, 0x0001, %r27
	.word 0xb935d000  ! 779: SRLX_R	srlx	%r23, %r0, %r28
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 2b)
	.word 0x8f902002  ! 785: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_75:
	setx	0x21020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2d2001  ! 795: SLL_I	sll 	%r20, 0x0001, %r31
	.word 0xbb3c7001  ! 801: SRAX_I	srax	%r17, 0x0001, %r29
T0_asi_reg_rd_38:
	mov	0x13, %r14
	.word 0xfadb84a0  ! 802: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_wr_35:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 803: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbde4a1fd  ! 805: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e50000  ! 806: SAVE_R	save	%r20, %r0, %r24
	.word 0xb5e50000  ! 807: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_rd_39:
	mov	0x31, %r14
	.word 0xf4db8e40  ! 809: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbc0c8000  ! 811: AND_R	and 	%r18, %r0, %r30
	.word 0xb3e56130  ! 814: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbd2cc000  ! 815: SLL_R	sll 	%r19, %r0, %r30
	.word 0xb1e561ee  ! 816: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_wr_36:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 817: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb61461de  ! 818: OR_I	or 	%r17, 0x01de, %r27
T0_asi_reg_wr_37:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 821: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb1e54000  ! 822: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_wr_38:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 824: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_76:
	setx	0x210318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2c0000  ! 834: SLL_R	sll 	%r16, %r0, %r30
T0_asi_reg_wr_39:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 835: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_40:
	mov	0x2, %r14
	.word 0xf8db8400  ! 838: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb7345000  ! 840: SRLX_R	srlx	%r17, %r0, %r27
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_rd_41:
	mov	0x2a, %r14
	.word 0xfedb84a0  ! 848: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_77:
	setx	0x220016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 10)
	.word 0xb2240000  ! 851: SUB_R	sub 	%r16, %r0, %r25
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 24)
	.word 0xb7e4c000  ! 854: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_78:
	setx	0x10201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 860: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_rd_42:
	mov	0x3c8, %r14
	.word 0xfadb89e0  ! 861: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbfe4203b  ! 865: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_43:
	mov	0x1c, %r14
	.word 0xfcdb8e40  ! 866: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_79:
	setx	0x210330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 871: SAVE_R	save	%r22, %r0, %r25
	.word 0xb3e54000  ! 873: SAVE_R	save	%r21, %r0, %r25
	.word 0xbbe4e1b0  ! 874: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe56139  ! 875: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_40:
	mov	0x17, %r14
	.word 0xfef38e40  ! 877: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_80:
	setx	0x22012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33c0000  ! 880: SRA_R	sra 	%r16, %r0, %r25
	.word 0xb3e5c000  ! 881: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_81:
	setx	0x220123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 883: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_44:
	mov	0xb, %r14
	.word 0xfadb84a0  ! 886: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbfe4e07a  ! 889: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe56014  ! 890: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e4c000  ! 891: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_82:
	setx	0x25023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 894: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_rd_45:
	mov	0x1c, %r14
	.word 0xfedb8e40  ! 897: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5e5a038  ! 898: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_83:
	setx	0x240106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_84:
	setx	0x24033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e05d  ! 907: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_85:
	setx	0x25030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_86:
	setx	0x260322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2c9000  ! 912: SLLX_R	sllx	%r18, %r0, %r29
cpu_intr_0_87:
	setx	0x25023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_88:
	setx	0x24020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_46:
	mov	0x19, %r14
	.word 0xf8db8e40  ! 918: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_89:
	setx	0x26030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e56005  ! 924: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_wr_41:
	mov	0xd, %r14
	.word 0xf4f38400  ! 926: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb5e48000  ! 928: SAVE_R	save	%r18, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe4e015  ! 934: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_rd_47:
	mov	0x30, %r14
	.word 0xf0db8e60  ! 935: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb485c000  ! 938: ADDcc_R	addcc 	%r23, %r0, %r26
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_90:
	setx	0x25023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 943: SAVE_R	save	%r20, %r0, %r30
	.word 0xbe9460b2  ! 944: ORcc_I	orcc 	%r17, 0x00b2, %r31
T0_asi_reg_wr_42:
	mov	0x2c, %r14
	.word 0xfcf38e40  ! 945: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7e5e146  ! 946: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e44000  ! 948: SAVE_R	save	%r17, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3342001  ! 951: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0xb89de012  ! 954: XORcc_I	xorcc 	%r23, 0x0012, %r28
	.word 0xbde4a157  ! 955: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb49d213e  ! 958: XORcc_I	xorcc 	%r20, 0x013e, %r26
	.word 0xbfe56169  ! 961: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_43:
	mov	0x2d, %r14
	.word 0xf6f38400  ! 964: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5e5c000  ! 966: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_wr_44:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 967: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb0ac6175  ! 968: ANDNcc_I	andncc 	%r17, 0x0175, %r24
	.word 0xbde54000  ! 969: SAVE_R	save	%r21, %r0, %r30
	.word 0xb9e5a1f7  ! 974: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbcc54000  ! 984: ADDCcc_R	addccc 	%r21, %r0, %r30
cpu_intr_0_91:
	setx	0x270217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e01a  ! 987: SAVE_I	save	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_45:
	mov	0x1b, %r14
	.word 0xf2f38e60  ! 993: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb9e521a8  ! 994: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_46:
	mov	0x2e, %r14
	.word 0xf4f38e60  ! 996: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_0_92:
	setx	0x250019, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_48:
	mov	0x3c0, %r14
	.word 0xf4db8400  ! 1007: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb1e5c000  ! 1010: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, f)
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_rd_49:
	mov	0x13, %r14
	.word 0xf4db8e40  ! 1015: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_rd_50:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_93:
	setx	0x24023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_94:
	setx	0x24013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 1020: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_51:
	mov	0x2f, %r14
	.word 0xf4db89e0  ! 1028: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_52:
	mov	0x2d, %r14
	.word 0xf8db8e60  ! 1031: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb1e4c000  ! 1033: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_53:
	mov	0x2e, %r14
	.word 0xfcdb8e40  ! 1035: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_95:
	setx	0x250323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, a)
	.word 0xb1e40000  ! 1043: SAVE_R	save	%r16, %r0, %r24
	.word 0xbbe461e7  ! 1045: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 35)
	.word 0xba1c21de  ! 1052: XOR_I	xor 	%r16, 0x01de, %r29
	.word 0xb1e5a1f4  ! 1054: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e4e0eb  ! 1056: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_wr_47:
	mov	0x38, %r14
	.word 0xf4f38400  ! 1060: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 11)
	.word 0xb9e54000  ! 1069: SAVE_R	save	%r21, %r0, %r28
	.word 0xb53c3001  ! 1071: SRAX_I	srax	%r16, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_96:
	setx	0x27000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_48:
	mov	0x2f, %r14
	.word 0xfcf38e40  ! 1076: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7e44000  ! 1077: SAVE_R	save	%r17, %r0, %r27
	.word 0xb7e5a0d5  ! 1079: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_97:
	setx	0x270318, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_54:
	mov	0x24, %r14
	.word 0xf8db8e60  ! 1082: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbbe4619e  ! 1085: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_wr_49:
	mov	0x34, %r14
	.word 0xfef38400  ! 1089: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbfe5e1d5  ! 1091: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_98:
	setx	0x24022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb5a0f9  ! 1095: SUBCcc_I	orncc 	%r22, 0x00f9, %r31
	.word 0xb5e44000  ! 1097: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_99:
	setx	0x260207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_100:
	setx	0x24013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_101:
	setx	0x27012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_50:
	mov	0x14, %r14
	.word 0xf8f38e40  ! 1106: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_102:
	setx	0x240105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_103:
	setx	0x240332, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_55:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 1114: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbfe4616c  ! 1116: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde52177  ! 1117: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_104:
	setx	0x25001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 38)
	.word 0xb7e5e0eb  ! 1124: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e56136  ! 1125: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7504000  ! 1128: RDPR_TNPC	<illegal instruction>
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 26)
	.word 0xbfe4e0b1  ! 1130: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb40c8000  ! 1133: AND_R	and 	%r18, %r0, %r26
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_105:
	setx	0x260236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_106:
	setx	0x270239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5605e  ! 1141: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_107:
	setx	0x260231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_108:
	setx	0x260236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_109:
	setx	0x240306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a0d7  ! 1152: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_56:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 1156: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb6c52060  ! 1158: ADDCcc_I	addccc 	%r20, 0x0060, %r27
cpu_intr_0_110:
	setx	0x240019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_111:
	setx	0x260211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_51:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 1165: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_57:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 1166: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e56015  ! 1167: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_wr_52:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 1172: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1e4e0a1  ! 1175: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_53:
	mov	0x3c6, %r14
	.word 0xfef389e0  ! 1177: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb1e4a151  ! 1180: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 12)
	.word 0xb9e44000  ! 1192: SAVE_R	save	%r17, %r0, %r28
	.word 0xb3e4a004  ! 1196: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_112:
	setx	0x24033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 1199: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_113:
	setx	0x24003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_58:
	mov	0x1d, %r14
	.word 0xfedb8e40  ! 1202: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbde4a02c  ! 1204: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e5a1b6  ! 1206: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_54:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 1207: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_114:
	setx	0x27023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 38)
	.word 0xb9e5a0da  ! 1211: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde44000  ! 1213: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 8)
	.word 0xbbe5c000  ! 1221: SAVE_R	save	%r23, %r0, %r29
	.word 0xbfe40000  ! 1222: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_115:
	setx	0x270323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_116:
	setx	0x24002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_117:
	setx	0x250213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 1233: SAVE_R	save	%r16, %r0, %r27
	.word 0xbde48000  ! 1234: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 33)
	.word 0xbca520ef  ! 1237: SUBcc_I	subcc 	%r20, 0x00ef, %r30
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 4)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e46041  ! 1240: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_118:
	setx	0x270322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e52100  ! 1245: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e4a067  ! 1246: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e5e16d  ! 1248: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e5c000  ! 1249: SAVE_R	save	%r23, %r0, %r26
	.word 0xb02cc000  ! 1250: ANDN_R	andn 	%r19, %r0, %r24
T0_asi_reg_rd_59:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 1254: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7e4c000  ! 1261: SAVE_R	save	%r19, %r0, %r27
	.word 0xbde4e01a  ! 1263: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e5e178  ! 1264: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbd35b001  ! 1265: SRLX_I	srlx	%r22, 0x0001, %r30
	.word 0xbde5a107  ! 1266: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_119:
	setx	0x27012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 1272: SAVE_R	save	%r23, %r0, %r29
	.word 0xb7e46069  ! 1273: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e44000  ! 1274: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_60:
	mov	0x1e, %r14
	.word 0xf2db8e40  ! 1278: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 15)
	.word 0xbbe50000  ! 1287: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_61:
	mov	0xa, %r14
	.word 0xf8db89e0  ! 1288: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, a)
	.word 0xb1e58000  ! 1291: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_55:
	mov	0x3c1, %r14
	.word 0xf8f38e80  ! 1292: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_0_120:
	setx	0x240211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 1295: SAVE_R	save	%r22, %r0, %r28
	.word 0xb72db001  ! 1297: SLLX_I	sllx	%r22, 0x0001, %r27
	.word 0xb7e4e062  ! 1301: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe5c000  ! 1302: SAVE_R	save	%r23, %r0, %r31
	.word 0xba358000  ! 1304: SUBC_R	orn 	%r22, %r0, %r29
T0_asi_reg_wr_56:
	mov	0x25, %r14
	.word 0xf6f389e0  ! 1305: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_0_121:
	setx	0x270129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e091  ! 1309: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7643801  ! 1310: MOVcc_I	<illegal instruction>
	.word 0xb7e5a196  ! 1315: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 0)
	.word 0xbfe4c000  ! 1317: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_57:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 1318: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbfe4a0bd  ! 1321: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_58:
	mov	0x14, %r14
	.word 0xf0f384a0  ! 1322: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_62:
	mov	0x11, %r14
	.word 0xfcdb8400  ! 1324: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbbe4617a  ! 1331: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb53c2001  ! 1336: SRA_I	sra 	%r16, 0x0001, %r26
T0_asi_reg_wr_59:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 1339: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_122:
	setx	0x270201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 13)
	.word 0xbde48000  ! 1345: SAVE_R	save	%r18, %r0, %r30
	.word 0xbfe560a7  ! 1346: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb6858000  ! 1348: ADDcc_R	addcc 	%r22, %r0, %r27
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_63:
	mov	0x2d, %r14
	.word 0xf4db8400  ! 1350: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb5e56192  ! 1352: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_123:
	setx	0x260306, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_64:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 1359: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_124:
	setx	0x270334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_125:
	setx	0x250338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a1af  ! 1367: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_126:
	setx	0x270132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 1371: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_127:
	setx	0x270030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 1373: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_128:
	setx	0x26021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 1377: SAVE_R	save	%r20, %r0, %r24
	.word 0xb89c4000  ! 1378: XORcc_R	xorcc 	%r17, %r0, %r28
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_60:
	mov	0x3c6, %r14
	.word 0xf0f38e80  ! 1385: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbde5c000  ! 1386: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_61:
	mov	0xd, %r14
	.word 0xf0f384a0  ! 1392: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_0_129:
	setx	0x2a0202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_130:
	setx	0x2b0000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_131:
	setx	0x280030, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_62:
	mov	0x8, %r14
	.word 0xf8f38e80  ! 1401: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 29)
	.word 0xb9e5e009  ! 1406: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_63:
	mov	0x3c6, %r14
	.word 0xf6f389e0  ! 1410: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbde42017  ! 1412: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde46019  ! 1414: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe5c000  ! 1420: SAVE_R	save	%r23, %r0, %r29
	.word 0xbde40000  ! 1421: SAVE_R	save	%r16, %r0, %r30
	.word 0xb6044000  ! 1427: ADD_R	add 	%r17, %r0, %r27
	.word 0xb1e421de  ! 1428: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_wr_64:
	mov	0x26, %r14
	.word 0xfef38e80  ! 1430: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb9e4206c  ! 1431: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_wr_65:
	mov	0x36, %r14
	.word 0xf4f38e80  ! 1433: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_132:
	setx	0x28030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e52117  ! 1445: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_66:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 1447: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 32)
	.word 0xbfe42193  ! 1450: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_133:
	setx	0x29030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde52041  ! 1454: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_wr_67:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 1456: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb3e48000  ! 1458: SAVE_R	save	%r18, %r0, %r25
	.word 0xb7e40000  ! 1462: SAVE_R	save	%r16, %r0, %r27
	.word 0xb3e521dd  ! 1463: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_rd_65:
	mov	0x10, %r14
	.word 0xfcdb8e60  ! 1464: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbde48000  ! 1466: SAVE_R	save	%r18, %r0, %r30
	.word 0xbde5a03f  ! 1469: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e4c000  ! 1471: SAVE_R	save	%r19, %r0, %r26
	.word 0xb4bd2024  ! 1472: XNORcc_I	xnorcc 	%r20, 0x0024, %r26
cpu_intr_0_134:
	setx	0x2b032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5201f  ! 1477: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe5c000  ! 1480: SAVE_R	save	%r23, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_135:
	setx	0x2b002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 1484: SAVE_R	save	%r23, %r0, %r30
	.word 0xb1e48000  ! 1490: SAVE_R	save	%r18, %r0, %r24
	.word 0xb5e4c000  ! 1492: SAVE_R	save	%r19, %r0, %r26
	.word 0xbbe5c000  ! 1499: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_68:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 1501: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb3e56155  ! 1505: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_69:
	mov	0x34, %r14
	.word 0xf2f38e40  ! 1507: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7e46071  ! 1509: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 7)
	.word 0xbde58000  ! 1517: SAVE_R	save	%r22, %r0, %r30
	.word 0xb3e5c000  ! 1518: SAVE_R	save	%r23, %r0, %r25
	.word 0xb550c000  ! 1520: RDPR_TT	<illegal instruction>
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_rd_66:
	mov	0x1b, %r14
	.word 0xf6db8e80  ! 1523: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbd353001  ! 1526: SRLX_I	srlx	%r20, 0x0001, %r30
	.word 0xb3e54000  ! 1528: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_70:
	mov	0x1e, %r14
	.word 0xfef38e40  ! 1529: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_67:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 1530: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3e5e033  ! 1531: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e5c000  ! 1532: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_71:
	mov	0x1e, %r14
	.word 0xf0f38e40  ! 1534: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb5e4e034  ! 1536: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_68:
	mov	0x3c1, %r14
	.word 0xf2db8400  ! 1538: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_rd_69:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 1540: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_wr_72:
	mov	0x2b, %r14
	.word 0xfaf38e80  ! 1542: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb9e521dc  ! 1544: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e54000  ! 1545: SAVE_R	save	%r21, %r0, %r25
	.word 0xb1e44000  ! 1548: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, d)
	.word 0xb7e54000  ! 1554: SAVE_R	save	%r21, %r0, %r27
	.word 0xbac560a3  ! 1555: ADDCcc_I	addccc 	%r21, 0x00a3, %r29
	.word 0xb5e4c000  ! 1557: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_rd_70:
	mov	0x13, %r14
	.word 0xfcdb8400  ! 1558: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_136:
	setx	0x2a002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e1aa  ! 1563: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde58000  ! 1564: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_73:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 1567: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_0_137:
	setx	0x29002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6348000  ! 1570: SUBC_R	orn 	%r18, %r0, %r27
	.word 0xb614e165  ! 1571: OR_I	or 	%r19, 0x0165, %r27
	.word 0xb7e4c000  ! 1572: SAVE_R	save	%r19, %r0, %r27
	.word 0xb014e0e1  ! 1576: OR_I	or 	%r19, 0x00e1, %r24
	.word 0xb89461b3  ! 1577: ORcc_I	orcc 	%r17, 0x01b3, %r28
	.word 0xb1e48000  ! 1578: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_138:
	setx	0x2b0300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_139:
	setx	0x290321, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_74:
	mov	0x26, %r14
	.word 0xf2f384a0  ! 1591: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb7e4a146  ! 1593: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e40000  ! 1594: SAVE_R	save	%r16, %r0, %r27
	.word 0xb7e50000  ! 1595: SAVE_R	save	%r20, %r0, %r27
	.word 0xb9e52080  ! 1598: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_140:
	setx	0x2a0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_141:
	setx	0x2b0023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_142:
	setx	0x28011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1d0000  ! 1605: XOR_R	xor 	%r20, %r0, %r29
T0_asi_reg_wr_75:
	mov	0x35, %r14
	.word 0xf4f38e80  ! 1611: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_71:
	mov	0x35, %r14
	.word 0xf6db8e60  ! 1617: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 38)
	.word 0xb3e5c000  ! 1624: SAVE_R	save	%r23, %r0, %r25
	.word 0xb92c0000  ! 1625: SLL_R	sll 	%r16, %r0, %r28
	.word 0xb1e44000  ! 1634: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbbe5c000  ! 1638: SAVE_R	save	%r23, %r0, %r29
	.word 0xb00da1d3  ! 1644: AND_I	and 	%r22, 0x01d3, %r24
cpu_intr_0_143:
	setx	0x2a021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_72:
	mov	0x29, %r14
	.word 0xf4db84a0  ! 1648: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbbe5e1e8  ! 1652: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb83ce06c  ! 1653: XNOR_I	xnor 	%r19, 0x006c, %r28
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 22)
	.word 0xb9e40000  ! 1661: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_76:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 1662: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_144:
	setx	0x28010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_73:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 1665: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_rd_74:
	mov	0x11, %r14
	.word 0xf2db84a0  ! 1667: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbd2d4000  ! 1668: SLL_R	sll 	%r21, %r0, %r30
cpu_intr_0_145:
	setx	0x290319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 12)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e4a18b  ! 1677: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5e0da  ! 1678: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 14)
	.word 0xb4b50000  ! 1683: ORNcc_R	orncc 	%r20, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_77:
	mov	0x12, %r14
	.word 0xfcf38e60  ! 1685: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb1e48000  ! 1686: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_wr_78:
	mov	0x2c, %r14
	.word 0xf0f38e40  ! 1690: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7e48000  ! 1693: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb29de167  ! 1697: XORcc_I	xorcc 	%r23, 0x0167, %r25
	.word 0xb33c3001  ! 1698: SRAX_I	srax	%r16, 0x0001, %r25
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_75:
	mov	0x37, %r14
	.word 0xfadb8e40  ! 1704: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5e5a087  ! 1706: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_79:
	mov	0x6, %r14
	.word 0xf8f384a0  ! 1710: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbde58000  ! 1712: SAVE_R	save	%r22, %r0, %r30
	.word 0xb5e4a189  ! 1713: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_146:
	setx	0x28001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_147:
	setx	0x2a0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 1716: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe521d1  ! 1717: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_76:
	mov	0x15, %r14
	.word 0xf8db8e40  ! 1718: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb97d0400  ! 1720: MOVR_R	movre	%r20, %r0, %r28
	.word 0xb5e5e18b  ! 1721: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_wr_80:
	mov	0x9, %r14
	.word 0xf0f384a0  ! 1723: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb1e4e02d  ! 1728: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_148:
	setx	0x2b001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e02d  ! 1733: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e560b3  ! 1736: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_149:
	setx	0x2b0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_150:
	setx	0x28001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_77:
	mov	0x3c5, %r14
	.word 0xf6db8e80  ! 1741: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_151:
	setx	0x28022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_152:
	setx	0x290205, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_81:
	mov	0x37, %r14
	.word 0xf8f38400  ! 1750: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbde5a0e2  ! 1751: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_78:
	mov	0xa, %r14
	.word 0xf4db8e60  ! 1754: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_153:
	setx	0x2a0136, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_154:
	setx	0x2a023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_rd_79:
	mov	0x1c, %r14
	.word 0xf4db8e80  ! 1765: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb5e4c000  ! 1767: SAVE_R	save	%r19, %r0, %r26
	.word 0xb7e5a0dc  ! 1768: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_80:
	mov	0x12, %r14
	.word 0xfcdb8e40  ! 1769: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_82:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 1771: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_81:
	mov	0x38, %r14
	.word 0xf6db89e0  ! 1772: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb9e40000  ! 1774: SAVE_R	save	%r16, %r0, %r28
	.word 0xbde5e018  ! 1776: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_wr_83:
	mov	0x1f, %r14
	.word 0xf6f38e60  ! 1780: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbde56038  ! 1781: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb1e4c000  ! 1786: SAVE_R	save	%r19, %r0, %r24
	.word 0xb9e4c000  ! 1796: SAVE_R	save	%r19, %r0, %r28
	.word 0xb3e421e0  ! 1799: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e5212e  ! 1803: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde4c000  ! 1805: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_84:
	mov	0x37, %r14
	.word 0xf8f38e60  ! 1806: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_155:
	setx	0x29013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8c0000  ! 1811: ANDcc_R	andcc 	%r16, %r0, %r30
T0_asi_reg_wr_85:
	mov	0x36, %r14
	.word 0xf8f38e40  ! 1812: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_156:
	setx	0x290227, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_86:
	mov	0x23, %r14
	.word 0xf4f384a0  ! 1814: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb83421ce  ! 1816: ORN_I	orn 	%r16, 0x01ce, %r28
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_157:
	setx	0x2e0025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_158:
	setx	0x2c002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e42095  ! 1826: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_rd_82:
	mov	0x2f, %r14
	.word 0xf8db8e80  ! 1829: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb3e4a10a  ! 1830: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbf344000  ! 1831: SRL_R	srl 	%r17, %r0, %r31
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_83:
	mov	0x37, %r14
	.word 0xf2db8e40  ! 1839: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_159:
	setx	0x2c0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 1849: SAVE_R	save	%r18, %r0, %r24
	.word 0xb3e42101  ! 1851: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_87:
	mov	0x15, %r14
	.word 0xf2f38e80  ! 1852: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb9e56049  ! 1853: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde5c000  ! 1854: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_160:
	setx	0x2d001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_84:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 1859: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb1e4a046  ! 1860: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_rd_85:
	mov	0x35, %r14
	.word 0xf0db89e0  ! 1867: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbbe5c000  ! 1871: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_88:
	mov	0xe, %r14
	.word 0xf0f389e0  ! 1872: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_wr_89:
	mov	0x32, %r14
	.word 0xf2f38400  ! 1874: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb3e44000  ! 1875: SAVE_R	save	%r17, %r0, %r25
	.word 0xbc45a0c1  ! 1877: ADDC_I	addc 	%r22, 0x00c1, %r30
	.word 0xb52c1000  ! 1878: SLLX_R	sllx	%r16, %r0, %r26
	.word 0xb9e5a07f  ! 1883: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_161:
	setx	0x2f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_86:
	mov	0x17, %r14
	.word 0xf6db8e80  ! 1887: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_162:
	setx	0x2d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_87:
	mov	0x3c0, %r14
	.word 0xf8db8e80  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb52dc000  ! 1892: SLL_R	sll 	%r23, %r0, %r26
cpu_intr_0_163:
	setx	0x2e003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 1899: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_164:
	setx	0x2f023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_88:
	mov	0x12, %r14
	.word 0xf4db8e60  ! 1904: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbbe5a1d3  ! 1905: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_rd_89:
	mov	0xa, %r14
	.word 0xf2db8e40  ! 1907: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 32)
	.word 0xbde4e07d  ! 1912: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_165:
	setx	0x2e0307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 30)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_166:
	setx	0x2c0009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_167:
	setx	0x2e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_168:
	setx	0x2d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_90:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 1928: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1e4a0a2  ! 1931: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_169:
	setx	0x2d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_170:
	setx	0x2d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e56129  ! 1937: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e42189  ! 1940: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_wr_90:
	mov	0x10, %r14
	.word 0xf0f384a0  ! 1941: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb7e50000  ! 1942: SAVE_R	save	%r20, %r0, %r27
	.word 0xbfe48000  ! 1943: SAVE_R	save	%r18, %r0, %r31
	.word 0xbfe5611f  ! 1944: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_171:
	setx	0x2d0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc34a10b  ! 1946: SUBC_I	orn 	%r18, 0x010b, %r30
	.word 0xbde5e098  ! 1947: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe520e3  ! 1948: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_172:
	setx	0x2e0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e52175  ! 1950: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_91:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 1958: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7e5e106  ! 1961: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_173:
	setx	0x2f0209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_174:
	setx	0x2e0030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_175:
	setx	0x2c013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 20)
T0_asi_reg_wr_92:
	mov	0x2e, %r14
	.word 0xf8f38e80  ! 1974: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_176:
	setx	0x2d0327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_177:
	setx	0x2d0321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 24)
	.word 0xb7e54000  ! 1986: SAVE_R	save	%r21, %r0, %r27
	.word 0xb7e58000  ! 1990: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_178:
	setx	0x2d0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c56103  ! 1993: ADDCcc_I	addccc 	%r21, 0x0103, %r26
cpu_intr_0_179:
	setx	0x2e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_180:
	setx	0x2f002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 1997: SAVE_R	save	%r20, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe52093  ! 2003: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_181:
	setx	0x2c0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3560ed  ! 2014: ORN_I	orn 	%r21, 0x00ed, %r31
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, f)
	.word 0xbde5c000  ! 2018: SAVE_R	save	%r23, %r0, %r30
	.word 0xb9e40000  ! 2020: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_93:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 2021: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 36)
	.word 0xb0ad4000  ! 2029: ANDNcc_R	andncc 	%r21, %r0, %r24
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 21)
	.word 0xbfe5e109  ! 2032: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e58000  ! 2033: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbde48000  ! 2036: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_91:
	mov	0x28, %r14
	.word 0xfadb84a0  ! 2040: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb3e5a1fd  ! 2045: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_94:
	mov	0x24, %r14
	.word 0xfef38400  ! 2047: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbfe4a104  ! 2051: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb4254000  ! 2059: SUB_R	sub 	%r21, %r0, %r26
	.word 0xb5e5c000  ! 2065: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 14)
	.word 0xb9e5e1a1  ! 2070: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e40000  ! 2071: SAVE_R	save	%r16, %r0, %r24
	.word 0xb9e44000  ! 2072: SAVE_R	save	%r17, %r0, %r28
	.word 0xb63ca045  ! 2073: XNOR_I	xnor 	%r18, 0x0045, %r27
	.word 0xb9e5a0e3  ! 2074: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbbe50000  ! 2078: SAVE_R	save	%r20, %r0, %r29
	.word 0xb3e5c000  ! 2081: SAVE_R	save	%r23, %r0, %r25
	.word 0xb8c50000  ! 2082: ADDCcc_R	addccc 	%r20, %r0, %r28
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_95:
	mov	0x34, %r14
	.word 0xf4f384a0  ! 2084: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb5e4a026  ! 2085: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbf3cc000  ! 2089: SRA_R	sra 	%r19, %r0, %r31
T0_asi_reg_rd_92:
	mov	0xf, %r14
	.word 0xf6db84a0  ! 2092: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_182:
	setx	0x2f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_183:
	setx	0x2c022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_93:
	mov	0x34, %r14
	.word 0xf2db8e40  ! 2100: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_rd_94:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 2101: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3e5c000  ! 2103: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_rd_95:
	mov	0x25, %r14
	.word 0xfcdb89e0  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_96:
	mov	0x29, %r14
	.word 0xf2f38e80  ! 2106: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb2346132  ! 2107: SUBC_I	orn 	%r17, 0x0132, %r25
T0_asi_reg_wr_97:
	mov	0x11, %r14
	.word 0xf0f38e60  ! 2108: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_0_184:
	setx	0x2c0020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, f)
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_185:
	setx	0x2f0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 2116: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_186:
	setx	0x2f0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e421a5  ! 2118: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e5e1d1  ! 2119: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_96:
	mov	0x2f, %r14
	.word 0xfedb89e0  ! 2120: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb5e44000  ! 2121: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_wr_98:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 2122: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbcc58000  ! 2123: ADDCcc_R	addccc 	%r22, %r0, %r30
	.word 0xb9e4609f  ! 2124: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe5c000  ! 2125: SAVE_R	save	%r23, %r0, %r31
	.word 0xb5e4c000  ! 2133: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_99:
	mov	0xd, %r14
	.word 0xfcf384a0  ! 2134: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_187:
	setx	0x2d020d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_188:
	setx	0x2e032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_100:
	mov	0x32, %r14
	.word 0xf0f38e40  ! 2141: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb5e5a033  ! 2143: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe48000  ! 2146: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_97:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 2149: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5e44000  ! 2150: SAVE_R	save	%r17, %r0, %r26
	.word 0xb9e54000  ! 2151: SAVE_R	save	%r21, %r0, %r28
	.word 0xb5e48000  ! 2153: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_98:
	mov	0x2c, %r14
	.word 0xf8db8e40  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9e5e1dc  ! 2158: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_189:
	setx	0x2d0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe14e08e  ! 2164: OR_I	or 	%r19, 0x008e, %r31
	.word 0xb5e5e073  ! 2166: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_190:
	setx	0x2d021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_191:
	setx	0x2f0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 2174: SAVE_R	save	%r20, %r0, %r27
	.word 0xb6b44000  ! 2175: ORNcc_R	orncc 	%r17, %r0, %r27
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, c)
	.word 0xb7e42042  ! 2182: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_192:
	setx	0x2f0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde420c7  ! 2190: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde44000  ! 2192: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_193:
	setx	0x2e011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_194:
	setx	0x2c000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_195:
	setx	0x2d002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_196:
	setx	0x2e0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb495e09f  ! 2213: ORcc_I	orcc 	%r23, 0x009f, %r26
	.word 0xb7e52005  ! 2216: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e46166  ! 2217: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e48000  ! 2218: SAVE_R	save	%r18, %r0, %r25
	.word 0xb1e561da  ! 2220: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 30)
	.word 0xb7e4c000  ! 2225: SAVE_R	save	%r19, %r0, %r27
	.word 0xb5e461c9  ! 2227: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe40000  ! 2228: SAVE_R	save	%r16, %r0, %r31
	.word 0xb9e50000  ! 2229: SAVE_R	save	%r20, %r0, %r28
	.word 0xb7e4a0e2  ! 2231: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_197:
	setx	0x2c0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e521eb  ! 2237: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e40000  ! 2239: SAVE_R	save	%r16, %r0, %r28
	.word 0xb7e5a1f5  ! 2243: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_198:
	setx	0x2d0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_101:
	mov	0x26, %r14
	.word 0xf8f38e40  ! 2247: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbbe44000  ! 2251: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_102:
	mov	0x1c, %r14
	.word 0xf4f38400  ! 2253: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_wr_103:
	mov	0x17, %r14
	.word 0xf8f38e80  ! 2254: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_rd_99:
	mov	0x23, %r14
	.word 0xfedb84a0  ! 2255: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_199:
	setx	0x2e023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe460a5  ! 2261: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_200:
	setx	0x2e0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7d0400  ! 2265: MOVR_R	movre	%r20, %r0, %r29
T0_asi_reg_wr_104:
	mov	0x1d, %r14
	.word 0xfaf38400  ! 2269: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb81ce1de  ! 2271: XOR_I	xor 	%r19, 0x01de, %r28
	.word 0xbbe421ca  ! 2275: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 27)
	.word 0xbe14c000  ! 2278: OR_R	or 	%r19, %r0, %r31
T0_asi_reg_rd_100:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 2283: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb9e5e11f  ! 2284: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde40000  ! 2286: SAVE_R	save	%r16, %r0, %r30
	.word 0xb3e4a0d3  ! 2288: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_rd_101:
	mov	0x2c, %r14
	.word 0xfcdb89e0  ! 2292: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbfe4c000  ! 2293: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_201:
	setx	0x2d0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 22)
	.word 0xb9e4c000  ! 2304: SAVE_R	save	%r19, %r0, %r28
	.word 0xbbe52179  ! 2309: SAVE_I	save	%r20, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_105:
	mov	0x37, %r14
	.word 0xf8f38e40  ! 2316: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_102:
	mov	0x22, %r14
	.word 0xf0db8e80  ! 2319: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb5e4e093  ! 2324: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_202:
	setx	0x300329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 27)
	.word 0xbfe52066  ! 2330: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb22ca1f0  ! 2331: ANDN_I	andn 	%r18, 0x01f0, %r25
	.word 0xbc948000  ! 2335: ORcc_R	orcc 	%r18, %r0, %r30
T0_asi_reg_wr_106:
	mov	0x14, %r14
	.word 0xf8f38e60  ! 2336: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb5e4c000  ! 2337: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_203:
	setx	0x33030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb635e09a  ! 2342: SUBC_I	orn 	%r23, 0x009a, %r27
cpu_intr_0_204:
	setx	0x310004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42113  ! 2350: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe58000  ! 2352: SAVE_R	save	%r22, %r0, %r31
	.word 0xbfe54000  ! 2354: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb1e58000  ! 2361: SAVE_R	save	%r22, %r0, %r24
	.word 0xbde4c000  ! 2365: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbde54000  ! 2370: SAVE_R	save	%r21, %r0, %r30
	.word 0xbfe4e122  ! 2375: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_rd_103:
	mov	0x2a, %r14
	.word 0xfedb8e40  ! 2376: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_107:
	mov	0x1c, %r14
	.word 0xf8f38e80  ! 2380: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_rd_104:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 2381: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e4e0e7  ! 2383: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_105:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_rd_106:
	mov	0x3c7, %r14
	.word 0xf0db8e60  ! 2388: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbde44000  ! 2389: SAVE_R	save	%r17, %r0, %r30
	.word 0xbbe5c000  ! 2390: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 17)
	.word 0xb7e48000  ! 2396: SAVE_R	save	%r18, %r0, %r27
	.word 0xb3e50000  ! 2399: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_107:
	mov	0x1a, %r14
	.word 0xf6db8e40  ! 2406: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1e4e0a6  ! 2407: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_205:
	setx	0x32021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a1bb  ! 2409: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_108:
	mov	0xb, %r14
	.word 0xf2db8e40  ! 2417: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_206:
	setx	0x320012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 2421: SAVE_R	save	%r22, %r0, %r30
	.word 0xbbe48000  ! 2422: SAVE_R	save	%r18, %r0, %r29
	.word 0xb5e4e0bf  ! 2424: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e48000  ! 2425: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_rd_109:
	mov	0x18, %r14
	.word 0xfcdb8400  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T0_asi_reg_rd_110:
	mov	0x26, %r14
	.word 0xfadb8e40  ! 2433: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbfe4e16d  ! 2435: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, e)
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 39)
	.word 0xb1e4a11a  ! 2438: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde56033  ! 2439: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_rd_111:
	mov	0x36, %r14
	.word 0xf0db89e0  ! 2442: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_wr_108:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 2444: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbfe4e18e  ! 2447: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_wr_109:
	mov	0x2c, %r14
	.word 0xf6f384a0  ! 2452: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_112:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 2471: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbde54000  ! 2475: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 30)
	.word 0xb9e54000  ! 2478: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_110:
	mov	0x32, %r14
	.word 0xf2f38e60  ! 2481: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb2c521e5  ! 2485: ADDCcc_I	addccc 	%r20, 0x01e5, %r25
	.word 0xbfe521b6  ! 2487: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_207:
	setx	0x300235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_113:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 2497: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbbe4c000  ! 2500: SAVE_R	save	%r19, %r0, %r29
	.word 0xb5e4e05c  ! 2504: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe4e1c6  ! 2506: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde54000  ! 2508: SAVE_R	save	%r21, %r0, %r30
	.word 0xb5e5a158  ! 2509: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_208:
	setx	0x31012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42021  ! 2512: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e4c000  ! 2513: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_209:
	setx	0x30001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_210:
	setx	0x310030, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_111:
	mov	0x14, %r14
	.word 0xfaf384a0  ! 2518: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb9e54000  ! 2519: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_211:
	setx	0x32001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_112:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 2527: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfe560ef  ! 2528: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e56137  ! 2529: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_212:
	setx	0x330017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e56032  ! 2531: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_114:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 2537: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_113:
	mov	0x2d, %r14
	.word 0xfef38e60  ! 2543: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbfe40000  ! 2545: SAVE_R	save	%r16, %r0, %r31
	.word 0xb1e48000  ! 2546: SAVE_R	save	%r18, %r0, %r24
	.word 0x8d95a153  ! 2547: WRPR_PSTATE_I	wrpr	%r22, 0x0153, %pstate
cpu_intr_0_213:
	setx	0x320101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_214:
	setx	0x320233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_215:
	setx	0x32000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56009  ! 2551: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e54000  ! 2554: SAVE_R	save	%r21, %r0, %r27
	.word 0xbfe4a0e8  ! 2555: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_216:
	setx	0x32022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_115:
	mov	0x3, %r14
	.word 0xf0db8e40  ! 2560: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_217:
	setx	0x320205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e03e  ! 2567: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde5e1bc  ! 2569: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_116:
	mov	0x16, %r14
	.word 0xf2db84a0  ! 2570: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_218:
	setx	0x32000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_117:
	mov	0x32, %r14
	.word 0xf4db8e60  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb1e4e1b6  ! 2579: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe50000  ! 2581: SAVE_R	save	%r20, %r0, %r29
	.word 0xb5e50000  ! 2583: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_114:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 2585: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_219:
	setx	0x30012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_115:
	mov	0x1d, %r14
	.word 0xf2f38e60  ! 2589: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb02de100  ! 2591: ANDN_I	andn 	%r23, 0x0100, %r24
T0_asi_reg_rd_118:
	mov	0x2a, %r14
	.word 0xf0db8e60  ! 2599: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_220:
	setx	0x330239, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_119:
	mov	0x1a, %r14
	.word 0xf8db84a0  ! 2602: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_221:
	setx	0x310004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 7)
	.word 0xb9e521d4  ! 2607: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb62d8000  ! 2609: ANDN_R	andn 	%r22, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_120:
	mov	0x10, %r14
	.word 0xf4db84a0  ! 2611: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb044c000  ! 2613: ADDC_R	addc 	%r19, %r0, %r24
cpu_intr_0_222:
	setx	0x31023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 2616: SAVE_R	save	%r17, %r0, %r27
	.word 0xb5e58000  ! 2619: SAVE_R	save	%r22, %r0, %r26
	.word 0xb2b54000  ! 2623: SUBCcc_R	orncc 	%r21, %r0, %r25
	.word 0xbde48000  ! 2624: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_223:
	setx	0x310103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 2632: SAVE_R	save	%r19, %r0, %r24
	.word 0xbde56017  ! 2633: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e5a197  ! 2635: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde58000  ! 2636: SAVE_R	save	%r22, %r0, %r30
	.word 0xb1e42099  ! 2638: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_121:
	mov	0x33, %r14
	.word 0xfadb8e40  ! 2641: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_122:
	mov	0x27, %r14
	.word 0xf8db8e60  ! 2642: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 2)
	.word 0xb4042098  ! 2644: ADD_I	add 	%r16, 0x0098, %r26
cpu_intr_0_224:
	setx	0x300212, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_123:
	mov	0xf, %r14
	.word 0xfcdb8e40  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 13)
	.word 0xbfe4210f  ! 2654: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_124:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 2657: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbde4607b  ! 2662: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_rd_125:
	mov	0x3, %r14
	.word 0xfcdb84a0  ! 2665: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb7e48000  ! 2667: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 15)
	.word 0xbd7cc400  ! 2671: MOVR_R	movre	%r19, %r0, %r30
T0_asi_reg_rd_126:
	mov	0x3c0, %r14
	.word 0xf0db89e0  ! 2673: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb9e48000  ! 2676: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_116:
	mov	0x33, %r14
	.word 0xf4f38e40  ! 2679: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e48000  ! 2681: SAVE_R	save	%r18, %r0, %r26
	.word 0xb7e42177  ! 2682: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe40000  ! 2684: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_117:
	mov	0x38, %r14
	.word 0xf4f38400  ! 2685: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_0_225:
	setx	0x310015, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_127:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 2689: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbbe58000  ! 2690: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 38)
	.word 0xb3e44000  ! 2694: SAVE_R	save	%r17, %r0, %r25
	.word 0xb9e42099  ! 2696: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_128:
	mov	0x6, %r14
	.word 0xf8db8e40  ! 2698: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb23c2078  ! 2702: XNOR_I	xnor 	%r16, 0x0078, %r25
	.word 0xbde4205d  ! 2708: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e461c5  ! 2709: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_226:
	setx	0x310108, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_129:
	mov	0x3c3, %r14
	.word 0xfcdb8e60  ! 2712: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb1e5215b  ! 2713: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_118:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 2715: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb1e5e0d3  ! 2716: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb12d7001  ! 2718: SLLX_I	sllx	%r21, 0x0001, %r24
	.word 0xb9e56121  ! 2719: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb884a17b  ! 2722: ADDcc_I	addcc 	%r18, 0x017b, %r28
	.word 0xb1e4c000  ! 2724: SAVE_R	save	%r19, %r0, %r24
	.word 0xbbe42125  ! 2725: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e50000  ! 2726: SAVE_R	save	%r20, %r0, %r28
	.word 0xbfe560dc  ! 2727: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 14)
	.word 0xb695c000  ! 2735: ORcc_R	orcc 	%r23, %r0, %r27
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_227:
	setx	0x33033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a18b  ! 2738: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_228:
	setx	0x330314, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_130:
	mov	0x4, %r14
	.word 0xf2db89e0  ! 2742: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_229:
	setx	0x370302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a04d  ! 2747: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e5a05a  ! 2750: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_131:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 2753: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T0_asi_reg_wr_119:
	mov	0x1a, %r14
	.word 0xfef38e80  ! 2754: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb245a1f2  ! 2759: ADDC_I	addc 	%r22, 0x01f2, %r25
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_132:
	mov	0x16, %r14
	.word 0xf0db84a0  ! 2764: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe4c000  ! 2767: SAVE_R	save	%r19, %r0, %r31
	.word 0xb5e5c000  ! 2768: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_230:
	setx	0x370102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb58000  ! 2770: SUBCcc_R	orncc 	%r22, %r0, %r31
cpu_intr_0_231:
	setx	0x36002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_232:
	setx	0x35003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 35)
	.word 0xb1e4e054  ! 2780: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde48000  ! 2781: SAVE_R	save	%r18, %r0, %r30
	.word 0xb604619f  ! 2783: ADD_I	add 	%r17, 0x019f, %r27
	.word 0xb9e4a04d  ! 2789: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe5217c  ! 2791: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e54000  ! 2792: SAVE_R	save	%r21, %r0, %r28
	.word 0xbde4a179  ! 2794: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_120:
	mov	0x29, %r14
	.word 0xf0f38e80  ! 2797: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_233:
	setx	0x340226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5612c  ! 2801: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, d)
	.word 0xb5e42178  ! 2807: SAVE_I	save	%r16, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 27)
	.word 0xb81560d6  ! 2813: OR_I	or 	%r21, 0x00d6, %r28
cpu_intr_0_234:
	setx	0x30212, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_121:
	mov	0x36, %r14
	.word 0xfef38e80  ! 2815: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_0_235:
	setx	0x370330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 2820: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_122:
	mov	0x33, %r14
	.word 0xf2f384a0  ! 2821: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb3e58000  ! 2823: SAVE_R	save	%r22, %r0, %r25
	.word 0xbfe54000  ! 2824: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_133:
	mov	0x29, %r14
	.word 0xf4db8e80  ! 2826: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb3e46000  ! 2827: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_rd_134:
	mov	0x2, %r14
	.word 0xfadb8e40  ! 2828: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 19)
	.word 0xb3e4a0b7  ! 2838: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb814a1e5  ! 2840: OR_I	or 	%r18, 0x01e5, %r28
	.word 0xb5641800  ! 2841: MOVcc_R	<illegal instruction>
	.word 0xb48c4000  ! 2843: ANDcc_R	andcc 	%r17, %r0, %r26
	.word 0xb5e5206b  ! 2844: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb81c8000  ! 2845: XOR_R	xor 	%r18, %r0, %r28
	.word 0xbbe48000  ! 2848: SAVE_R	save	%r18, %r0, %r29
	.word 0xb9e5a0f0  ! 2850: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3510000  ! 2852: RDPR_TICK	<illegal instruction>
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_236:
	setx	0x360031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 2871: SAVE_R	save	%r20, %r0, %r26
	.word 0xb3e5a0c8  ! 2874: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe5605d  ! 2875: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e5615a  ! 2876: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_237:
	setx	0x34010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_238:
	setx	0x350312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e0e8  ! 2882: SAVE_I	save	%r19, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb61421f4  ! 2885: OR_I	or 	%r16, 0x01f4, %r27
	.word 0xbfe54000  ! 2886: SAVE_R	save	%r21, %r0, %r31
	.word 0xbbe4a057  ! 2887: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 35)
	.word 0xbfe40000  ! 2890: SAVE_R	save	%r16, %r0, %r31
	.word 0xbfe48000  ! 2891: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_239:
	setx	0x350119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40c4000  ! 2895: AND_R	and 	%r17, %r0, %r26
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_240:
	setx	0x360331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e187  ! 2902: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb3e4617a  ! 2903: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e44000  ! 2904: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 6)
	.word 0xb93ca001  ! 2907: SRA_I	sra 	%r18, 0x0001, %r28
	.word 0xbfe4c000  ! 2908: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_241:
	setx	0x34032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e561fd  ! 2910: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e4c000  ! 2913: SAVE_R	save	%r19, %r0, %r28
	.word 0xbe140000  ! 2918: OR_R	or 	%r16, %r0, %r31
	.word 0xbc940000  ! 2922: ORcc_R	orcc 	%r16, %r0, %r30
	.word 0xb615e148  ! 2926: OR_I	or 	%r23, 0x0148, %r27
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb1e44000  ! 2930: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_123:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 2932: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb82dc000  ! 2941: ANDN_R	andn 	%r23, %r0, %r28
	.word 0xb5e5a1f2  ! 2942: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_135:
	mov	0x23, %r14
	.word 0xf6db84a0  ! 2950: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb9e560d3  ! 2951: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e48000  ! 2953: SAVE_R	save	%r18, %r0, %r28
	.word 0xb1e44000  ! 2955: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 17)
	.word 0xb7e420f1  ! 2958: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e50000  ! 2960: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_242:
	setx	0x36020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 2967: SAVE_R	save	%r20, %r0, %r29
	.word 0xbfe58000  ! 2970: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_243:
	setx	0x34010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_wr_124:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 2983: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_125:
	mov	0x1c, %r14
	.word 0xfcf38e40  ! 2984: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_244:
	setx	0x35031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_wr_126:
	mov	0x2f, %r14
	.word 0xfaf38e60  ! 2990: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_245:
	setx	0x350019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 2994: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_246:
	setx	0x37010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_247:
	setx	0x34021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_248:
	setx	0x340127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42007  ! 2999: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_rd_136:
	mov	0x1c, %r14
	.word 0xf6db89e0  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_249:
	setx	0x360201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_250:
	setx	0x340222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c8000  ! 3007: SRA_R	sra 	%r18, %r0, %r30
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_251:
	setx	0x37032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb434e0f6  ! 3017: ORN_I	orn 	%r19, 0x00f6, %r26
	.word 0xbbe42115  ! 3018: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbf341000  ! 3021: SRLX_R	srlx	%r16, %r0, %r31
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_wr_127:
	mov	0x2b, %r14
	.word 0xf6f38e80  ! 3026: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_252:
	setx	0x37013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 3035: SAVE_R	save	%r23, %r0, %r27
	.word 0xb9e54000  ! 3036: SAVE_R	save	%r21, %r0, %r28
	.word 0xb5e5e06c  ! 3037: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe4c000  ! 3038: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_128:
	mov	0x19, %r14
	.word 0xfcf38e80  ! 3040: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_rd_137:
	mov	0x23, %r14
	.word 0xf6db8e40  ! 3041: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_129:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 3042: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_rd_138:
	mov	0x3c0, %r14
	.word 0xf0db89e0  ! 3043: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb824e137  ! 3046: SUB_I	sub 	%r19, 0x0137, %r28
	.word 0xb1e5600a  ! 3048: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e44000  ! 3050: SAVE_R	save	%r17, %r0, %r25
	.word 0xb3e5a0b3  ! 3051: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_rd_139:
	mov	0x2, %r14
	.word 0xf6db84a0  ! 3052: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_0_253:
	setx	0x36021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 3057: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 29)
	.word 0xb40d21ed  ! 3063: AND_I	and 	%r20, 0x01ed, %r26
	.word 0xb5e42126  ! 3065: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbc3cc000  ! 3067: XNOR_R	xnor 	%r19, %r0, %r30
cpu_intr_0_254:
	setx	0x34033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 25)
	.word 0xb5e54000  ! 3075: SAVE_R	save	%r21, %r0, %r26
	.word 0xbbe40000  ! 3080: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_140:
	mov	0x24, %r14
	.word 0xfcdb8e40  ! 3082: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbfe5e069  ! 3085: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_255:
	setx	0x370319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e460e7  ! 3088: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e4c000  ! 3090: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_130:
	mov	0x13, %r14
	.word 0xfef38e60  ! 3095: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbde561ac  ! 3096: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe50000  ! 3102: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_141:
	mov	0x24, %r14
	.word 0xf4db8400  ! 3104: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, d)
	.word 0xb3e461f6  ! 3106: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_256:
	setx	0x34010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_257:
	setx	0x370032, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_131:
	mov	0x1, %r14
	.word 0xfcf38400  ! 3112: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb9e44000  ! 3114: SAVE_R	save	%r17, %r0, %r28
	.word 0xb9e460cc  ! 3115: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde56100  ! 3116: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_258:
	setx	0x360230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_259:
	setx	0x370021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_260:
	setx	0x35032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_261:
	setx	0x350020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 3122: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_262:
	setx	0x35002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a1fb  ! 3126: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe421ab  ! 3128: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe5c000  ! 3129: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_142:
	mov	0x1a, %r14
	.word 0xf0db8e40  ! 3131: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_263:
	setx	0x360234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_264:
	setx	0x360029, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_143:
	mov	0x5, %r14
	.word 0xf4db8e80  ! 3137: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb5e44000  ! 3139: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, e)
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_265:
	setx	0x35032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_132:
	mov	0x25, %r14
	.word 0xfaf38e80  ! 3154: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb5e460d3  ! 3155: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_266:
	setx	0x36000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_rd_144:
	mov	0x1c, %r14
	.word 0xf6db89e0  ! 3162: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 15)
	.word 0xb9e48000  ! 3166: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 35)
	.word 0xb3e58000  ! 3173: SAVE_R	save	%r22, %r0, %r25
	.word 0xbbe5a018  ! 3177: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_267:
	setx	0x37033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_133:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 3181: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_134:
	mov	0x1d, %r14
	.word 0xfef38400  ! 3187: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_268:
	setx	0x360019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08de03b  ! 3191: ANDcc_I	andcc 	%r23, 0x003b, %r24
cpu_intr_0_269:
	setx	0x35031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_135:
	mov	0x1, %r14
	.word 0xfef389e0  ! 3194: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_270:
	setx	0x34031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e420ed  ! 3197: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_271:
	setx	0x35010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2c7001  ! 3204: SLLX_I	sllx	%r17, 0x0001, %r31
T0_asi_reg_rd_145:
	mov	0x12, %r14
	.word 0xfedb84a0  ! 3205: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_272:
	setx	0x380313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23c0000  ! 3212: XNOR_R	xnor 	%r16, %r0, %r25
cpu_intr_0_273:
	setx	0x3b0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 3219: SAVE_R	save	%r19, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e42067  ! 3222: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_274:
	setx	0x380104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_275:
	setx	0x3a0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 3227: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_276:
	setx	0x3a0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_277:
	setx	0x3a0023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 2b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e4214d  ! 3238: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe52036  ! 3241: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e48000  ! 3250: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_rd_146:
	mov	0x30, %r14
	.word 0xfedb8400  ! 3251: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_278:
	setx	0x3a0134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_279:
	setx	0x380016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd345000  ! 3261: SRLX_R	srlx	%r17, %r0, %r30
	.word 0xb3e4e161  ! 3262: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_136:
	mov	0x26, %r14
	.word 0xfaf384a0  ! 3263: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, d)
	.word 0xb405e059  ! 3267: ADD_I	add 	%r23, 0x0059, %r26
T0_asi_reg_wr_137:
	mov	0x34, %r14
	.word 0xf6f38e40  ! 3269: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_280:
	setx	0x38033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e460ea  ! 3272: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e4610e  ! 3273: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb48ce0bd  ! 3274: ANDcc_I	andcc 	%r19, 0x00bd, %r26
cpu_intr_0_281:
	setx	0x3a0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4617e  ! 3278: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_147:
	mov	0x34, %r14
	.word 0xf6db8e60  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_wr_138:
	mov	0x30, %r14
	.word 0xfef38e40  ! 3280: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_148:
	mov	0x1f, %r14
	.word 0xf8db8e40  ! 3281: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_149:
	mov	0x37, %r14
	.word 0xfedb89e0  ! 3286: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_wr_139:
	mov	0x1d, %r14
	.word 0xf2f38e40  ! 3287: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1e54000  ! 3289: SAVE_R	save	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe54000  ! 3292: SAVE_R	save	%r21, %r0, %r29
	.word 0xb3e5e048  ! 3293: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_wr_140:
	mov	0x26, %r14
	.word 0xf8f38e40  ! 3294: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_150:
	mov	0x30, %r14
	.word 0xf2db89e0  ! 3295: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, e)
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 17)
	.word 0xb7e42120  ! 3306: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb3e4a1f6  ! 3309: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_151:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb3e58000  ! 3314: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 20)
	.word 0xb3e5c000  ! 3317: SAVE_R	save	%r23, %r0, %r25
	.word 0xb134b001  ! 3321: SRLX_I	srlx	%r18, 0x0001, %r24
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3500000  ! 3327: RDPR_TPC	<illegal instruction>
cpu_intr_0_282:
	setx	0x3b0001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_283:
	setx	0x3a0116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_284:
	setx	0x3a030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e12b  ! 3332: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_285:
	setx	0x3b0138, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_141:
	mov	0x1, %r14
	.word 0xfcf38e40  ! 3340: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb29c611a  ! 3344: XORcc_I	xorcc 	%r17, 0x011a, %r25
	.word 0xbbe5a031  ! 3350: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e5e0fc  ! 3352: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e5e05e  ! 3353: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e46193  ! 3354: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_286:
	setx	0x3b010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_287:
	setx	0x38021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba148000  ! 3358: OR_R	or 	%r18, %r0, %r29
	.word 0xb9e5c000  ! 3359: SAVE_R	save	%r23, %r0, %r28
	.word 0xb53d7001  ! 3360: SRAX_I	srax	%r21, 0x0001, %r26
	.word 0xbde42171  ! 3362: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e58000  ! 3365: SAVE_R	save	%r22, %r0, %r26
	.word 0xb1e40000  ! 3371: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_142:
	mov	0x3c5, %r14
	.word 0xfef38e80  ! 3372: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb3e5e0e8  ! 3373: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e520a2  ! 3374: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde421e9  ! 3377: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_rd_152:
	mov	0x2, %r14
	.word 0xf2db8e40  ! 3380: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_288:
	setx	0x3a010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_143:
	mov	0xc, %r14
	.word 0xfef389e0  ! 3386: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbec44000  ! 3389: ADDCcc_R	addccc 	%r17, %r0, %r31
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_wr_144:
	mov	0x33, %r14
	.word 0xf4f38e80  ! 3393: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_289:
	setx	0x3a002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e086  ! 3395: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_290:
	setx	0x39002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_291:
	setx	0x3b0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 3411: SAVE_R	save	%r23, %r0, %r24
	.word 0xbfe5c000  ! 3414: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_153:
	mov	0x15, %r14
	.word 0xf6db8e40  ! 3415: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_292:
	setx	0x39002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e152  ! 3420: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde40000  ! 3421: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_293:
	setx	0x390123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a067  ! 3423: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e4c000  ! 3424: SAVE_R	save	%r19, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb89d8000  ! 3428: XORcc_R	xorcc 	%r22, %r0, %r28
	.word 0xb7e44000  ! 3429: SAVE_R	save	%r17, %r0, %r27
	.word 0xbcbc4000  ! 3430: XNORcc_R	xnorcc 	%r17, %r0, %r30
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_145:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 3435: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_294:
	setx	0x39010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb435613e  ! 3439: SUBC_I	orn 	%r21, 0x013e, %r26
	.word 0xb3e46087  ! 3440: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_146:
	mov	0x33, %r14
	.word 0xf2f38e80  ! 3443: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb33c5000  ! 3447: SRAX_R	srax	%r17, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 35)
	.word 0xb0248000  ! 3452: SUB_R	sub 	%r18, %r0, %r24
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_147:
	mov	0x3c5, %r14
	.word 0xf8f38400  ! 3456: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_295:
	setx	0x3b022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 3458: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_wr_148:
	mov	0x10, %r14
	.word 0xf8f38e40  ! 3461: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe54000  ! 3462: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_296:
	setx	0x380237, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_149:
	mov	0x19, %r14
	.word 0xf0f384a0  ! 3465: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_0_297:
	setx	0x3b013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994208c  ! 3469: WRPR_TICK_I	wrpr	%r16, 0x008c, %tick
T0_asi_reg_rd_154:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 3470: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1e50000  ! 3471: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_150:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 3472: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7e50000  ! 3476: SAVE_R	save	%r20, %r0, %r27
	.word 0xb9e4a0a9  ! 3477: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e40000  ! 3479: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_wr_151:
	mov	0x3c4, %r14
	.word 0xf0f389e0  ! 3480: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbde58000  ! 3481: SAVE_R	save	%r22, %r0, %r30
	.word 0xb6c48000  ! 3483: ADDCcc_R	addccc 	%r18, %r0, %r27
	.word 0xb7e50000  ! 3485: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_298:
	setx	0x39011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_152:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 3488: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_rd_155:
	mov	0x22, %r14
	.word 0xfcdb84a0  ! 3502: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_wr_153:
	mov	0x2d, %r14
	.word 0xfcf38e60  ! 3505: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb3e54000  ! 3506: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_rd_156:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 3509: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbde54000  ! 3511: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_299:
	setx	0x380030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794e06f  ! 3518: WRPR_TT_I	wrpr	%r19, 0x006f, %tt
T0_asi_reg_wr_154:
	mov	0x3c3, %r14
	.word 0xfcf38e60  ! 3519: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbc450000  ! 3520: ADDC_R	addc 	%r20, %r0, %r30
cpu_intr_0_300:
	setx	0x3b0229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_301:
	setx	0x3b0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 37)
	.word 0xb3e4c000  ! 3530: SAVE_R	save	%r19, %r0, %r25
	.word 0xb6458000  ! 3533: ADDC_R	addc 	%r22, %r0, %r27
	.word 0xb40421ff  ! 3536: ADD_I	add 	%r16, 0x01ff, %r26
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbfe44000  ! 3538: SAVE_R	save	%r17, %r0, %r31
	.word 0xb7e40000  ! 3539: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_wr_155:
	mov	0x3c3, %r14
	.word 0xf2f384a0  ! 3543: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb9e58000  ! 3546: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, f)
	.word 0xb9e48000  ! 3548: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_156:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 3549: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 6)
	.word 0xbbe4c000  ! 3555: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 4)
	.word 0xbbe50000  ! 3560: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_wr_157:
	mov	0x8, %r14
	.word 0xfaf38e60  ! 3561: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_302:
	setx	0x3a003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_157:
	mov	0x27, %r14
	.word 0xf0db8e60  ! 3563: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_303:
	setx	0x3b033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 3567: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe4a078  ! 3571: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e48000  ! 3575: SAVE_R	save	%r18, %r0, %r27
	.word 0xb1e54000  ! 3578: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_304:
	setx	0x3a031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_305:
	setx	0x3b0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23ce04c  ! 3586: XNOR_I	xnor 	%r19, 0x004c, %r25
	.word 0x8195e1ce  ! 3591: WRPR_TPC_I	wrpr	%r23, 0x01ce, %tpc
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_306:
	setx	0x390027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 29)
	.word 0xb3e5c000  ! 3602: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_rd_158:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 3603: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_wr_158:
	mov	0x1, %r14
	.word 0xfaf389e0  ! 3604: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb1e5a12e  ! 3605: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe4e125  ! 3608: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_307:
	setx	0x3a032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc24e0b9  ! 3610: SUB_I	sub 	%r19, 0x00b9, %r30
	.word 0xbbe40000  ! 3613: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_159:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 3615: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_308:
	setx	0x38000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_309:
	setx	0x3a0035, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_159:
	mov	0x3c6, %r14
	.word 0xfedb8400  ! 3628: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbde54000  ! 3629: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_rd_160:
	mov	0x1, %r14
	.word 0xf0db8e80  ! 3630: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 3)
	.word 0xbbe48000  ! 3636: SAVE_R	save	%r18, %r0, %r29
	.word 0xbbe42158  ! 3637: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_310:
	setx	0x380109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 3644: SAVE_R	save	%r22, %r0, %r28
	.word 0xb9e5e192  ! 3647: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e46160  ! 3649: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_160:
	mov	0x2f, %r14
	.word 0xf6f389e0  ! 3650: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbbe5c000  ! 3652: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, e)
	.word 0xbde58000  ! 3658: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_161:
	mov	0x2c, %r14
	.word 0xf8db8e80  ! 3660: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb5e4207e  ! 3662: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbd357001  ! 3663: SRLX_I	srlx	%r21, 0x0001, %r30
	.word 0xbfe5e0fb  ! 3666: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 31)
	.word 0xb43d607f  ! 3668: XNOR_I	xnor 	%r21, 0x007f, %r26
	.word 0xbfe4c000  ! 3673: SAVE_R	save	%r19, %r0, %r31
	.word 0xb3e46076  ! 3675: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e560f9  ! 3676: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_311:
	setx	0x38031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a19e  ! 3678: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_312:
	setx	0x3c0112, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_161:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 3684: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb5e4a04d  ! 3691: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e46024  ! 3693: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde4216a  ! 3694: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 13)
	.word 0xba2c8000  ! 3701: ANDN_R	andn 	%r18, %r0, %r29
	.word 0xbe958000  ! 3702: ORcc_R	orcc 	%r22, %r0, %r31
	.word 0xb3e4e1bf  ! 3703: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_162:
	mov	0x3c6, %r14
	.word 0xf0f384a0  ! 3704: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb5e5c000  ! 3705: SAVE_R	save	%r23, %r0, %r26
	.word 0xb7e46036  ! 3706: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e44000  ! 3708: SAVE_R	save	%r17, %r0, %r25
	.word 0xb5e56173  ! 3709: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_313:
	setx	0x3d0117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_314:
	setx	0x3e0324, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_163:
	mov	0x2c, %r14
	.word 0xf6f38400  ! 3716: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbc2cc000  ! 3723: ANDN_R	andn 	%r19, %r0, %r30
	.word 0xb1e5c000  ! 3725: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_164:
	mov	0x20, %r14
	.word 0xfef38400  ! 3727: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbbe58000  ! 3732: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_165:
	mov	0x37, %r14
	.word 0xfaf38400  ! 3733: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_rd_162:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 3734: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_315:
	setx	0x3c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 3737: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_316:
	setx	0x3e001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 3739: SAVE_R	save	%r18, %r0, %r28
	.word 0xb9e46113  ! 3740: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_rd_163:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 3741: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb5e5c000  ! 3742: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_wr_166:
	mov	0x7, %r14
	.word 0xf0f38400  ! 3745: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbde520c4  ! 3753: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb2b4c000  ! 3754: SUBCcc_R	orncc 	%r19, %r0, %r25
T0_asi_reg_rd_164:
	mov	0x34, %r14
	.word 0xfedb84a0  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, f)
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 14)
	.word 0xb6158000  ! 3762: OR_R	or 	%r22, %r0, %r27
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, e)
	.word 0xbfe50000  ! 3767: SAVE_R	save	%r20, %r0, %r31
	.word 0xb7e56089  ! 3768: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_wr_167:
	mov	0x31, %r14
	.word 0xf8f38e40  ! 3774: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_168:
	mov	0x3c8, %r14
	.word 0xf2f38400  ! 3777: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1e48000  ! 3781: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 14)
	.word 0xb57c8400  ! 3783: MOVR_R	movre	%r18, %r0, %r26
	.word 0xbde58000  ! 3784: SAVE_R	save	%r22, %r0, %r30
	.word 0xb1e52074  ! 3785: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbfe520b3  ! 3787: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb7e560dc  ! 3796: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 5)
	.word 0xb3e561cd  ! 3801: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb09c61e6  ! 3803: XORcc_I	xorcc 	%r17, 0x01e6, %r24
cpu_intr_0_317:
	setx	0x3e0031, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_169:
	mov	0x13, %r14
	.word 0xfaf38e80  ! 3807: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb0c42058  ! 3808: ADDCcc_I	addccc 	%r16, 0x0058, %r24
	.word 0xbfe5c000  ! 3809: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_wr_170:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 3817: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9e420d9  ! 3818: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e50000  ! 3819: SAVE_R	save	%r20, %r0, %r24
	.word 0xbfe54000  ! 3820: SAVE_R	save	%r21, %r0, %r31
	.word 0xb72cf001  ! 3823: SLLX_I	sllx	%r19, 0x0001, %r27
cpu_intr_0_318:
	setx	0x3d0300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbbe5a065  ! 3829: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_319:
	setx	0x3e0109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, c)
	.word 0xb3e48000  ! 3833: SAVE_R	save	%r18, %r0, %r25
	.word 0xbfe54000  ! 3834: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_320:
	setx	0x3d0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 3838: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_165:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 3843: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_321:
	setx	0x3d000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 3850: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_wr_171:
	mov	0x28, %r14
	.word 0xfef38e80  ! 3857: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_0_322:
	setx	0x3d0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e46113  ! 3860: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb93d5000  ! 3861: SRAX_R	srax	%r21, %r0, %r28
T0_asi_reg_rd_166:
	mov	0x10, %r14
	.word 0xfcdb8400  ! 3865: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbbe4c000  ! 3867: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_wr_172:
	mov	0x6, %r14
	.word 0xf8f38e40  ! 3870: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfe40000  ! 3871: SAVE_R	save	%r16, %r0, %r31
	.word 0xb1e54000  ! 3872: SAVE_R	save	%r21, %r0, %r24
	.word 0xb3e48000  ! 3873: SAVE_R	save	%r18, %r0, %r25
	.word 0xb1e5211a  ! 3874: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_323:
	setx	0x3d032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_324:
	setx	0x3d020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba44c000  ! 3880: ADDC_R	addc 	%r19, %r0, %r29
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb8bd8000  ! 3885: XNORcc_R	xnorcc 	%r22, %r0, %r28
T0_asi_reg_wr_173:
	mov	0x2d, %r14
	.word 0xfef389e0  ! 3891: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e40000  ! 3895: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_174:
	mov	0x1c, %r14
	.word 0xfef389e0  ! 3896: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbfe58000  ! 3899: SAVE_R	save	%r22, %r0, %r31
	.word 0xb7510000  ! 3904: RDPR_TICK	<illegal instruction>
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 34)
	.word 0x919460e0  ! 3909: WRPR_PIL_I	wrpr	%r17, 0x00e0, %pil
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 32)
	.word 0xb3e5e1ee  ! 3914: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e4a194  ! 3916: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e5209b  ! 3917: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e50000  ! 3920: SAVE_R	save	%r20, %r0, %r27
	.word 0xb9e461bd  ! 3922: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e48000  ! 3924: SAVE_R	save	%r18, %r0, %r27
	.word 0xbe858000  ! 3926: ADDcc_R	addcc 	%r22, %r0, %r31
	.word 0xbbe5c000  ! 3930: SAVE_R	save	%r23, %r0, %r29
	.word 0xb3e5a0fc  ! 3934: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e5205b  ! 3937: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_325:
	setx	0x3e0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a156  ! 3940: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e420ac  ! 3942: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e4e017  ! 3945: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_167:
	mov	0x2a, %r14
	.word 0xf0db8e40  ! 3946: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_326:
	setx	0x3d022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_327:
	setx	0x3d0212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_328:
	setx	0x3e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 3957: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_168:
	mov	0x1a, %r14
	.word 0xfedb8e80  ! 3958: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_wr_175:
	mov	0x3c2, %r14
	.word 0xfcf38e60  ! 3961: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_wr_176:
	mov	0x3c3, %r14
	.word 0xf2f384a0  ! 3962: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_177:
	mov	0x25, %r14
	.word 0xfaf389e0  ! 3970: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 23)
	.word 0xb61ce01f  ! 3975: XOR_I	xor 	%r19, 0x001f, %r27
	.word 0xbde4a192  ! 3976: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_169:
	mov	0xc, %r14
	.word 0xf8db84a0  ! 3977: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T0_asi_reg_rd_170:
	mov	0x3, %r14
	.word 0xf0db8400  ! 3978: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_329:
	setx	0x3f0009, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_171:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 3983: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_330:
	setx	0x3e0118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_331:
	setx	0x3f0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46008  ! 3990: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_332:
	setx	0x10318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_178:
	mov	0x2e, %r14
	.word 0xf4f38e40  ! 3994: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e4605c  ! 3995: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_333:
	setx	0x3c0310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_334:
	setx	0x3f0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 4008: SAVE_R	save	%r19, %r0, %r25
	.word 0xb7e421ad  ! 4009: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e5e113  ! 4010: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_179:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 4012: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_0_335:
	setx	0x3c0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 4015: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_rd_172:
	mov	0x26, %r14
	.word 0xf0db89e0  ! 4016: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb7e50000  ! 4020: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_336:
	setx	0x3d0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e168  ! 4023: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_337:
	setx	0x3c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_180:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 4029: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb3e48000  ! 4030: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_181:
	mov	0x35, %r14
	.word 0xf0f38e60  ! 4031: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_0_338:
	setx	0x3f030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 4037: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_339:
	setx	0x3c003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_340:
	setx	0x3c031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e014  ! 4044: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe4c000  ! 4045: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_341:
	setx	0x3e010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 4049: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_182:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 4050: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_183:
	mov	0x2c, %r14
	.word 0xfaf38e40  ! 4052: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_173:
	mov	0x6, %r14
	.word 0xf8db84a0  ! 4057: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_342:
	setx	0x3f0201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_343:
	setx	0x3f0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c54000  ! 4062: ADDCcc_R	addccc 	%r21, %r0, %r28
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 9)
	.word 0xbfe4a008  ! 4069: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb6040000  ! 4073: ADD_R	add 	%r16, %r0, %r27
cpu_intr_0_344:
	setx	0x3c0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9dc000  ! 4077: XORcc_R	xorcc 	%r23, %r0, %r29
	.word 0xbde4c000  ! 4079: SAVE_R	save	%r19, %r0, %r30
	.word 0xb7e48000  ! 4083: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_345:
	setx	0x3f0336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_346:
	setx	0x3d0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a0b3  ! 4093: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_184:
	mov	0x32, %r14
	.word 0xfcf38400  ! 4094: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb02c4000  ! 4095: ANDN_R	andn 	%r17, %r0, %r24
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 7)
	.word 0xb5e5a11f  ! 4100: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e5a08b  ! 4101: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe58000  ! 4102: SAVE_R	save	%r22, %r0, %r29
	.word 0xbfe461db  ! 4104: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_185:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 4105: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_347:
	setx	0x3c0225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 25)
	.word 0xb5e461e9  ! 4112: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_174:
	mov	0x36, %r14
	.word 0xfcdb8e80  ! 4113: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_rd_175:
	mov	0x14, %r14
	.word 0xf2db89e0  ! 4117: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_348:
	setx	0x3f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_176:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 4121: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_349:
	setx	0x3d0314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_350:
	setx	0x10223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 4126: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_351:
	setx	0x3d001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 4130: SAVE_R	save	%r21, %r0, %r29
	.word 0xbde4e182  ! 4131: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde421c8  ! 4132: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3641800  ! 4133: MOVcc_R	<illegal instruction>
cpu_intr_0_352:
	setx	0x420324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 4136: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_353:
	setx	0x43000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_177:
	mov	0x3c4, %r14
	.word 0xf4db8e60  ! 4146: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 21)
	.word 0xbbe5617d  ! 4148: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5510000  ! 4149: RDPR_TICK	<illegal instruction>
T0_asi_reg_wr_186:
	mov	0x28, %r14
	.word 0xf8f389e0  ! 4151: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_wr_187:
	mov	0xf, %r14
	.word 0xfaf389e0  ! 4153: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_rd_178:
	mov	0x30, %r14
	.word 0xf8db8e40  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb8b4c000  ! 4155: ORNcc_R	orncc 	%r19, %r0, %r28
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb7e46077  ! 4163: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_354:
	setx	0x410006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 10)
	.word 0xbfe48000  ! 4166: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_355:
	setx	0x410225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 4169: SAVE_R	save	%r23, %r0, %r28
	.word 0xb9e4c000  ! 4170: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_356:
	setx	0x430029, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_188:
	mov	0x32, %r14
	.word 0xf8f384a0  ! 4180: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_357:
	setx	0x410008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_358:
	setx	0x400010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 4187: SAVE_R	save	%r21, %r0, %r28
	.word 0xbde42091  ! 4190: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbb641800  ! 4194: MOVcc_R	<illegal instruction>
	.word 0xb2150000  ! 4195: OR_R	or 	%r20, %r0, %r25
	.word 0xbbe48000  ! 4196: SAVE_R	save	%r18, %r0, %r29
	.word 0xb1e5a175  ! 4197: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e4a14d  ! 4198: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_359:
	setx	0x420109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a180  ! 4209: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde5c000  ! 4210: SAVE_R	save	%r23, %r0, %r30
	.word 0xbbe4a048  ! 4211: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_179:
	mov	0x27, %r14
	.word 0xf6db89e0  ! 4212: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_360:
	setx	0x410136, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb2bdc000  ! 4217: XNORcc_R	xnorcc 	%r23, %r0, %r25
T0_asi_reg_rd_180:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 4218: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb9e4a161  ! 4220: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_361:
	setx	0x430038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_362:
	setx	0x43033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_363:
	setx	0x430332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_364:
	setx	0x420235, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_181:
	mov	0x2f, %r14
	.word 0xfedb8e40  ! 4235: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb09c0000  ! 4236: XORcc_R	xorcc 	%r16, %r0, %r24
	.word 0xb9e5a19e  ! 4238: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e50000  ! 4239: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_365:
	setx	0x43032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_366:
	setx	0x420006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a115  ! 4247: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb61d60f6  ! 4248: XOR_I	xor 	%r21, 0x00f6, %r27
cpu_intr_0_367:
	setx	0x430016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 4251: SAVE_R	save	%r16, %r0, %r30
	.word 0xb9e56102  ! 4253: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e5a0ab  ! 4254: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_189:
	mov	0x33, %r14
	.word 0xf4f38e40  ! 4255: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 33)
	.word 0xbfe5e060  ! 4264: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb835e17b  ! 4265: ORN_I	orn 	%r23, 0x017b, %r28
	.word 0xbbe5c000  ! 4269: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_368:
	setx	0x420007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0a44000  ! 4273: SUBcc_R	subcc 	%r17, %r0, %r24
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 0)
	.word 0xb284e03e  ! 4275: ADDcc_I	addcc 	%r19, 0x003e, %r25
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbf2d4000  ! 4278: SLL_R	sll 	%r21, %r0, %r31
	.word 0xb7e48000  ! 4279: SAVE_R	save	%r18, %r0, %r27
	.word 0xbec54000  ! 4280: ADDCcc_R	addccc 	%r21, %r0, %r31
	.word 0xb5e4c000  ! 4283: SAVE_R	save	%r19, %r0, %r26
	.word 0xb1e4a1dc  ! 4284: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e4c000  ! 4286: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_wr_190:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 4290: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb72cd000  ! 4291: SLLX_R	sllx	%r19, %r0, %r27
	.word 0xb285e12d  ! 4292: ADDcc_I	addcc 	%r23, 0x012d, %r25
T0_asi_reg_rd_182:
	mov	0x11, %r14
	.word 0xf8db8e40  ! 4293: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbf3c6001  ! 4297: SRA_I	sra 	%r17, 0x0001, %r31
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb1e5e1fa  ! 4306: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_191:
	mov	0x3c5, %r14
	.word 0xf8f384a0  ! 4307: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_0_369:
	setx	0x410302, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_192:
	mov	0x11, %r14
	.word 0xf8f38e60  ! 4311: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_370:
	setx	0x42020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 4317: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_371:
	setx	0x430215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0cf  ! 4322: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_193:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 4324: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb6b4c000  ! 4327: ORNcc_R	orncc 	%r19, %r0, %r27
cpu_intr_0_372:
	setx	0x41012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_373:
	setx	0x400020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_374:
	setx	0x400332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_375:
	setx	0x420005, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_183:
	mov	0x29, %r14
	.word 0xfadb89e0  ! 4337: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb32c5000  ! 4338: SLLX_R	sllx	%r17, %r0, %r25
cpu_intr_0_376:
	setx	0x400201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a021  ! 4344: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e42161  ! 4345: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbde58000  ! 4354: SAVE_R	save	%r22, %r0, %r30
	.word 0xb1e5c000  ! 4355: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_377:
	setx	0x43010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_184:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbfe54000  ! 4358: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_wr_194:
	mov	0x1b, %r14
	.word 0xf4f384a0  ! 4360: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb5e4a00c  ! 4364: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e4a181  ! 4365: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, a)
	.word 0xbfe42198  ! 4372: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 39)
	.word 0xb3e5201a  ! 4376: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_378:
	setx	0x410333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5213f  ! 4381: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb21de009  ! 4382: XOR_I	xor 	%r23, 0x0009, %r25
	.word 0xbbe4214f  ! 4386: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb294a063  ! 4388: ORcc_I	orcc 	%r18, 0x0063, %r25
	.word 0xba9dc000  ! 4389: XORcc_R	xorcc 	%r23, %r0, %r29
T0_asi_reg_rd_185:
	mov	0x17, %r14
	.word 0xf2db8e60  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbbe4e021  ! 4392: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e52082  ! 4396: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_rd_186:
	mov	0x12, %r14
	.word 0xf0db84a0  ! 4399: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb9e5e160  ! 4403: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_195:
	mov	0x27, %r14
	.word 0xfcf38e40  ! 4404: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbbe58000  ! 4405: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_379:
	setx	0x43032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_380:
	setx	0x41031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde460af  ! 4421: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde52015  ! 4422: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_381:
	setx	0x430218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 4425: SAVE_R	save	%r19, %r0, %r25
	.word 0xb3e560e7  ! 4426: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_382:
	setx	0x400205, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_187:
	mov	0x3c5, %r14
	.word 0xfcdb8e80  ! 4431: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_wr_196:
	mov	0x22, %r14
	.word 0xf0f38e60  ! 4434: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb5e5a10e  ! 4436: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe4c000  ! 4443: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_197:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 4444: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_198:
	mov	0x7, %r14
	.word 0xfef38e60  ! 4445: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, d)
	.word 0x9195e1d2  ! 4451: WRPR_PIL_I	wrpr	%r23, 0x01d2, %pil
T0_asi_reg_wr_199:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 4453: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbbe5609b  ! 4454: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e52176  ! 4455: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb12dc000  ! 4458: SLL_R	sll 	%r23, %r0, %r24
	.word 0xb1e50000  ! 4461: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbbe50000  ! 4468: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 18)
	.word 0xbfe5e0cd  ! 4471: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_rd_188:
	mov	0x3c7, %r14
	.word 0xf2db8400  ! 4476: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_383:
	setx	0x41032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_384:
	setx	0x41000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_200:
	mov	0x3c2, %r14
	.word 0xf4f38e80  ! 4479: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_385:
	setx	0x40020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e521c4  ! 4482: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe44000  ! 4483: SAVE_R	save	%r17, %r0, %r29
	.word 0xbd51c000  ! 4484: RDPR_TL	<illegal instruction>
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 12)
	.word 0xbbe56108  ! 4490: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe5c000  ! 4493: SAVE_R	save	%r23, %r0, %r29
	.word 0xb5e54000  ! 4495: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_386:
	setx	0x400028, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb00d0000  ! 4500: AND_R	and 	%r20, %r0, %r24
T0_asi_reg_rd_189:
	mov	0x35, %r14
	.word 0xf8db8e60  ! 4505: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xba040000  ! 4506: ADD_R	add 	%r16, %r0, %r29
	.word 0xba95c000  ! 4507: ORcc_R	orcc 	%r23, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_387:
	setx	0x41011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_388:
	setx	0x40001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_389:
	setx	0x400121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 4520: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_201:
	mov	0x8, %r14
	.word 0xfef38e60  ! 4521: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_390:
	setx	0x420034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 4526: SAVE_R	save	%r22, %r0, %r27
	.word 0xb1e58000  ! 4529: SAVE_R	save	%r22, %r0, %r24
	.word 0xb7e4c000  ! 4530: SAVE_R	save	%r19, %r0, %r27
	.word 0xbbe4e17a  ! 4535: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 22)
	.word 0xb8344000  ! 4538: SUBC_R	orn 	%r17, %r0, %r28
cpu_intr_0_391:
	setx	0x400001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a050  ! 4543: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e5a1af  ! 4544: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_392:
	setx	0x420211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 4547: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_190:
	mov	0x4, %r14
	.word 0xfcdb8e80  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbbe5a101  ! 4550: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbbe421f7  ! 4552: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e46029  ! 4561: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e4e030  ! 4562: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e54000  ! 4566: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb1e5c000  ! 4576: SAVE_R	save	%r23, %r0, %r24
	.word 0xb1518000  ! 4578: RDPR_PSTATE	<illegal instruction>
T0_asi_reg_rd_191:
	mov	0x21, %r14
	.word 0xf6db8e80  ! 4579: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbde54000  ! 4580: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_393:
	setx	0x40033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 4582: SAVE_R	save	%r17, %r0, %r28
	.word 0xbbe58000  ! 4583: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 25)
	.word 0xb5e4e0ce  ! 4588: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e4e1f5  ! 4591: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_394:
	setx	0x420211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 22)
	.word 0xb1e40000  ! 4594: SAVE_R	save	%r16, %r0, %r24
	.word 0xbbe44000  ! 4595: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_395:
	setx	0x41012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_396:
	setx	0x410109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e460c7  ! 4603: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_202:
	mov	0x37, %r14
	.word 0xfaf389e0  ! 4609: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_rd_192:
	mov	0x34, %r14
	.word 0xf6db8e40  ! 4610: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_397:
	setx	0x45021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 4613: SAVE_R	save	%r21, %r0, %r30
	.word 0xbde40000  ! 4614: SAVE_R	save	%r16, %r0, %r30
	.word 0xbe354000  ! 4621: ORN_R	orn 	%r21, %r0, %r31
	.word 0xb1e44000  ! 4623: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_398:
	setx	0x450228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a04b  ! 4629: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 0)
	.word 0xb17c6401  ! 4632: MOVR_I	movre	%r17, 0x1, %r24
cpu_intr_0_399:
	setx	0x47031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_203:
	mov	0x1b, %r14
	.word 0xfaf384a0  ! 4634: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_rd_193:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 4638: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_194:
	mov	0xe, %r14
	.word 0xfedb8e80  ! 4640: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_0_400:
	setx	0x440209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5615a  ! 4644: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb40d8000  ! 4650: AND_R	and 	%r22, %r0, %r26
cpu_intr_0_401:
	setx	0x440225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_402:
	setx	0x450309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_403:
	setx	0x470010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_404:
	setx	0x44030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 4663: SAVE_R	save	%r18, %r0, %r31
	.word 0xbde5e123  ! 4664: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde50000  ! 4665: SAVE_R	save	%r20, %r0, %r30
	.word 0xb1e40000  ! 4666: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_405:
	setx	0x460136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a12d  ! 4670: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 30)
	.word 0xbfe4a17a  ! 4675: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e421cd  ! 4678: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5c000  ! 4679: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbfe44000  ! 4682: SAVE_R	save	%r17, %r0, %r31
	.word 0xbbe58000  ! 4684: SAVE_R	save	%r22, %r0, %r29
	.word 0xb5e4210d  ! 4685: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbf7d2401  ! 4688: MOVR_I	movre	%r20, 0x1, %r31
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_204:
	mov	0x4, %r14
	.word 0xf8f38e80  ! 4698: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_rd_195:
	mov	0x2f, %r14
	.word 0xf8db89e0  ! 4700: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_0_406:
	setx	0x450128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46152  ! 4703: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe48000  ! 4709: SAVE_R	save	%r18, %r0, %r31
	.word 0xb1e5a1a1  ! 4711: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe5e0f5  ! 4713: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb72dc000  ! 4715: SLL_R	sll 	%r23, %r0, %r27
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_407:
	setx	0x47021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_408:
	setx	0x45000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_409:
	setx	0x460133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 4726: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_205:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 4728: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 38)
	.word 0xb5e4a14f  ! 4741: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 36)
	.word 0xb5e52173  ! 4743: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe4c000  ! 4744: SAVE_R	save	%r19, %r0, %r31
	.word 0xb7e50000  ! 4746: SAVE_R	save	%r20, %r0, %r27
	.word 0xbfe5a04d  ! 4750: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_410:
	setx	0x45013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_411:
	setx	0x44023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe561a0  ! 4766: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_206:
	mov	0xc, %r14
	.word 0xf2f38400  ! 4768: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 11)
	.word 0xb3e4a06f  ! 4772: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e4c000  ! 4776: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_rd_196:
	mov	0x2, %r14
	.word 0xfcdb8e80  ! 4778: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_wr_207:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 4780: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9e520b3  ! 4782: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbe2c8000  ! 4787: ANDN_R	andn 	%r18, %r0, %r31
	.word 0xbde5e109  ! 4788: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb4b58000  ! 4793: ORNcc_R	orncc 	%r22, %r0, %r26
T0_asi_reg_rd_197:
	mov	0x3c7, %r14
	.word 0xf2db8400  ! 4794: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_rd_198:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 4797: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_208:
	mov	0x35, %r14
	.word 0xfcf38e80  ! 4798: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb9e421d6  ! 4799: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e420e7  ! 4800: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe58000  ! 4804: SAVE_R	save	%r22, %r0, %r31
	.word 0xbfe4619d  ! 4808: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbbe40000  ! 4809: SAVE_R	save	%r16, %r0, %r29
	.word 0xbbe48000  ! 4810: SAVE_R	save	%r18, %r0, %r29
	.word 0xbd508000  ! 4812: RDPR_TSTATE	<illegal instruction>
cpu_intr_0_412:
	setx	0x46031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a1d6  ! 4814: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e5c000  ! 4815: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_wr_209:
	mov	0x20, %r14
	.word 0xf0f38e80  ! 4817: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb5e460c6  ! 4819: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbc1ce0b6  ! 4824: XOR_I	xor 	%r19, 0x00b6, %r30
	.word 0xbbe50000  ! 4825: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe560f2  ! 4827: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_413:
	setx	0x46003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e126  ! 4834: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde44000  ! 4835: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_414:
	setx	0x450316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_415:
	setx	0x470022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe56146  ! 4846: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e5a051  ! 4850: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_199:
	mov	0x24, %r14
	.word 0xf2db84a0  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb5e5e113  ! 4858: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_200:
	mov	0x23, %r14
	.word 0xf2db89e0  ! 4860: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb6b4e06f  ! 4861: SUBCcc_I	orncc 	%r19, 0x006f, %r27
cpu_intr_0_416:
	setx	0x44022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_rd_201:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 4870: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0x899420f0  ! 4873: WRPR_TICK_I	wrpr	%r16, 0x00f0, %tick
	.word 0xbbe4e0d1  ! 4875: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e40000  ! 4878: SAVE_R	save	%r16, %r0, %r26
	.word 0xb1e4e18f  ! 4880: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e4a156  ! 4881: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe40000  ! 4882: SAVE_R	save	%r16, %r0, %r31
	.word 0xb5e5201c  ! 4884: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e560cc  ! 4886: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_417:
	setx	0x460117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_210:
	mov	0x10, %r14
	.word 0xf0f389e0  ! 4900: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbfe5c000  ! 4904: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_202:
	mov	0xa, %r14
	.word 0xf8db8e40  ! 4905: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde58000  ! 4909: SAVE_R	save	%r22, %r0, %r30
	.word 0xbf2c2001  ! 4910: SLL_I	sll 	%r16, 0x0001, %r31
	.word 0xbfe50000  ! 4911: SAVE_R	save	%r20, %r0, %r31
	.word 0xb7e40000  ! 4912: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_wr_211:
	mov	0x1a, %r14
	.word 0xf2f38400  ! 4914: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb1e48000  ! 4917: SAVE_R	save	%r18, %r0, %r24
	.word 0xb4c5c000  ! 4921: ADDCcc_R	addccc 	%r23, %r0, %r26
cpu_intr_0_418:
	setx	0x470215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 4923: SAVE_R	save	%r17, %r0, %r31
	.word 0xb3e5c000  ! 4924: SAVE_R	save	%r23, %r0, %r25
	.word 0xb7e58000  ! 4925: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e5c000  ! 4926: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbb520000  ! 4928: RDPR_PIL	<illegal instruction>
	.word 0xbc9da093  ! 4930: XORcc_I	xorcc 	%r22, 0x0093, %r30
cpu_intr_0_419:
	setx	0x440105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4213e  ! 4933: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 34)
	.word 0xb1e40000  ! 4939: SAVE_R	save	%r16, %r0, %r24
	.word 0xb7e420c4  ! 4941: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb41c0000  ! 4942: XOR_R	xor 	%r16, %r0, %r26
T0_asi_reg_wr_212:
	mov	0x2c, %r14
	.word 0xfaf38400  ! 4943: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_420:
	setx	0x440309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_421:
	setx	0x45011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 14)
	.word 0xb52de001  ! 4957: SLL_I	sll 	%r23, 0x0001, %r26
T0_asi_reg_wr_213:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 4958: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe58000  ! 4959: SAVE_R	save	%r22, %r0, %r31
	.word 0xbde4e0ec  ! 4963: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e4607d  ! 4968: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e48000  ! 4970: SAVE_R	save	%r18, %r0, %r24
	.word 0xb3e58000  ! 4974: SAVE_R	save	%r22, %r0, %r25
	.word 0xb7e4c000  ! 4975: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_203:
	mov	0x7, %r14
	.word 0xf6db8e80  ! 4976: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_422:
	setx	0x470322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 6)
	.word 0xb4954000  ! 4984: ORcc_R	orcc 	%r21, %r0, %r26
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_423:
	setx	0x460335, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_424:
	setx	0x440116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e561a6  ! 4995: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe4a09f  ! 4996: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e5e081  ! 4997: SAVE_I	save	%r23, 0x0001, %r28
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
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, b)
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 38)
	.word 0xf875c000  ! 3: STX_R	stx	%r28, [%r23 + %r0]
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 9)
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_0:
	mov	0x3c1, %r14
	.word 0xf0f38e80  ! 9: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_rd_0:
	mov	0xc, %r14
	.word 0xf0db8e80  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_rd_1:
	mov	0x37, %r14
	.word 0xfadb8e40  ! 12: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 16)
	.word 0xf6b40020  ! 15: STHA_R	stha	%r27, [%r16 + %r0] 0x01
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 8)
	.word 0xfeada1f5  ! 18: STBA_I	stba	%r31, [%r22 + 0x01f5] %asi
	.word 0xb0b50000  ! 23: SUBCcc_R	orncc 	%r20, %r0, %r24
	.word 0xfeadc020  ! 25: STBA_R	stba	%r31, [%r23 + %r0] 0x01
T3_asi_reg_wr_1:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 28: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_wr_2:
	mov	0x32, %r14
	.word 0xf8f38e80  ! 33: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_rd_2:
	mov	0x2f, %r14
	.word 0xf2db8400  ! 36: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf82c4000  ! 38: STB_R	stb	%r28, [%r17 + %r0]
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 9)
	.word 0xf2aca148  ! 41: STBA_I	stba	%r25, [%r18 + 0x0148] %asi
	.word 0xf435e0e9  ! 44: STH_I	sth	%r26, [%r23 + 0x00e9]
	.word 0xf42cc000  ! 45: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xfcace1f2  ! 46: STBA_I	stba	%r30, [%r19 + 0x01f2] %asi
	.word 0xfe744000  ! 50: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xb224c000  ! 51: SUB_R	sub 	%r19, %r0, %r25
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 29)
	.word 0xf07421b1  ! 53: STX_I	stx	%r24, [%r16 + 0x01b1]
	.word 0xfaac4020  ! 54: STBA_R	stba	%r29, [%r17 + %r0] 0x01
T3_asi_reg_rd_3:
	mov	0x7, %r14
	.word 0xfcdb8e60  ! 55: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_0:
	setx	0x1d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_4:
	mov	0x6, %r14
	.word 0xfedb8e60  ! 58: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf42dc000  ! 63: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xf8a50020  ! 65: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
	.word 0xb0acc000  ! 70: ANDNcc_R	andncc 	%r19, %r0, %r24
	.word 0xf4adc020  ! 72: STBA_R	stba	%r26, [%r23 + %r0] 0x01
	.word 0xf2ad21a6  ! 75: STBA_I	stba	%r25, [%r20 + 0x01a6] %asi
T3_asi_reg_rd_5:
	mov	0x36, %r14
	.word 0xf6db84a0  ! 76: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_1:
	setx	0x1f0201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_2:
	setx	0x1f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2350000  ! 86: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xf0256035  ! 89: STW_I	stw	%r24, [%r21 + 0x0035]
	.word 0xfaf5212c  ! 90: STXA_I	stxa	%r29, [%r20 + 0x012c] %asi
	.word 0xbf3d4000  ! 93: SRA_R	sra 	%r21, %r0, %r31
	.word 0xba0d0000  ! 94: AND_R	and 	%r20, %r0, %r29
T3_asi_reg_rd_6:
	mov	0x27, %r14
	.word 0xf2db8e80  ! 95: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfaa50020  ! 96: STWA_R	stwa	%r29, [%r20 + %r0] 0x01
T3_asi_reg_rd_7:
	mov	0x26, %r14
	.word 0xf6db8e60  ! 97: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 9)
	.word 0xf8a5e19d  ! 103: STWA_I	stwa	%r28, [%r23 + 0x019d] %asi
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_HPRIV
	.word 0xf4748000  ! 107: STX_R	stx	%r26, [%r18 + %r0]
T3_asi_reg_wr_3:
	mov	0x31, %r14
	.word 0xfcf38e80  ! 111: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_3:
	setx	0x1e0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_8:
	mov	0x5, %r14
	.word 0xfadb84a0  ! 122: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T3_asi_reg_rd_9:
	mov	0x20, %r14
	.word 0xf2db84a0  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_10:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 125: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_11:
	mov	0x3c5, %r14
	.word 0xf4db8e80  ! 126: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_rd_12:
	mov	0x35, %r14
	.word 0xfcdb84a0  ! 131: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf62c218c  ! 132: STB_I	stb	%r27, [%r16 + 0x018c]
cpu_intr_3_4:
	setx	0x1d0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad8020  ! 134: STBA_R	stba	%r24, [%r22 + %r0] 0x01
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982c1a  ! 135: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1a, %hpstate
	.word 0xfeb58020  ! 137: STHA_R	stha	%r31, [%r22 + %r0] 0x01
T3_asi_reg_rd_13:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 140: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 16)
	.word 0xf4ad4020  ! 147: STBA_R	stba	%r26, [%r21 + %r0] 0x01
	.word 0xf82d8000  ! 148: STB_R	stb	%r28, [%r22 + %r0]
T3_asi_reg_rd_14:
	mov	0x26, %r14
	.word 0xf6db89e0  ! 149: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xfcaca142  ! 150: STBA_I	stba	%r30, [%r18 + 0x0142] %asi
	.word 0xf0742028  ! 154: STX_I	stx	%r24, [%r16 + 0x0028]
	.word 0xfa2c20af  ! 155: STB_I	stb	%r29, [%r16 + 0x00af]
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_4:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 163: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfc25c000  ! 164: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xb4b44000  ! 167: SUBCcc_R	orncc 	%r17, %r0, %r26
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b18  ! 168: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b18, %hpstate
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_5:
	setx	0x1e023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b44020  ! 174: STHA_R	stha	%r28, [%r17 + %r0] 0x01
	.word 0xf225e116  ! 175: STW_I	stw	%r25, [%r23 + 0x0116]
T3_asi_reg_wr_5:
	mov	0x9, %r14
	.word 0xfaf389e0  ! 179: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_6:
	setx	0x1e0125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_7:
	setx	0x1d0126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 5)
	.word 0xfc7421b6  ! 184: STX_I	stx	%r30, [%r16 + 0x01b6]
T3_asi_reg_wr_6:
	mov	0x3c5, %r14
	.word 0xfcf38e80  ! 187: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_3_8:
	setx	0x1f0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42c8000  ! 191: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf42d0000  ! 192: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xfe2d6074  ! 197: STB_I	stb	%r31, [%r21 + 0x0074]
cpu_intr_3_9:
	setx	0x1f013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac0020  ! 200: STBA_R	stba	%r31, [%r16 + %r0] 0x01
cpu_intr_3_10:
	setx	0x1d0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b4212a  ! 202: STHA_I	stha	%r26, [%r16 + 0x012a] %asi
T3_asi_reg_wr_7:
	mov	0x12, %r14
	.word 0xfcf38e80  ! 203: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_rd_15:
	mov	0x37, %r14
	.word 0xf8db8e40  ! 204: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb0c4a1ce  ! 207: ADDCcc_I	addccc 	%r18, 0x01ce, %r24
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 25)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_11:
	setx	0x1f032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_12:
	setx	0x1e003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_16:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 213: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc748000  ! 216: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xbe05203c  ! 218: ADD_I	add 	%r20, 0x003c, %r31
T3_asi_reg_rd_17:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 219: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb6848000  ! 220: ADDcc_R	addcc 	%r18, %r0, %r27
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 20)
	.word 0xbc0d6142  ! 224: AND_I	and 	%r21, 0x0142, %r30
	.word 0xb2c5e171  ! 229: ADDCcc_I	addccc 	%r23, 0x0171, %r25
T3_asi_reg_wr_8:
	mov	0x7, %r14
	.word 0xfcf38e40  ! 231: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb0444000  ! 233: ADDC_R	addc 	%r17, %r0, %r24
	.word 0xf6b4e1cf  ! 234: STHA_I	stha	%r27, [%r19 + 0x01cf] %asi
cpu_intr_3_13:
	setx	0x1e010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_14:
	setx	0x1c0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24a042  ! 237: STW_I	stw	%r30, [%r18 + 0x0042]
cpu_intr_3_15:
	setx	0x1e020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_9:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 243: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_10:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 246: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_wr_11:
	mov	0x30, %r14
	.word 0xf8f38e40  ! 247: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf0340000  ! 248: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xf824a11b  ! 250: STW_I	stw	%r28, [%r18 + 0x011b]
T3_asi_reg_rd_18:
	mov	0x2e, %r14
	.word 0xfadb89e0  ! 251: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_rd_19:
	mov	0x14, %r14
	.word 0xf6db8e80  ! 254: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf8254000  ! 255: STW_R	stw	%r28, [%r21 + %r0]
cpu_intr_3_16:
	setx	0x1f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24e18e  ! 257: STW_I	stw	%r30, [%r19 + 0x018e]
	.word 0xbc450000  ! 259: ADDC_R	addc 	%r20, %r0, %r30
	.word 0xf8b4e118  ! 260: STHA_I	stha	%r28, [%r19 + 0x0118] %asi
cpu_intr_3_17:
	setx	0x1e003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0344000  ! 262: STH_R	sth	%r24, [%r17 + %r0]
T3_asi_reg_rd_20:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 263: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_18:
	setx	0x1f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_12:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 268: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 37)
	.word 0xb4c4c000  ! 273: ADDCcc_R	addccc 	%r19, %r0, %r26
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 3)
	.word 0xfa75213c  ! 275: STX_I	stx	%r29, [%r20 + 0x013c]
	.word 0xf0b58020  ! 276: STHA_R	stha	%r24, [%r22 + %r0] 0x01
T3_asi_reg_wr_13:
	mov	0x3, %r14
	.word 0xf8f38e60  ! 277: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_wr_14:
	mov	0x7, %r14
	.word 0xfaf389e0  ! 279: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_19:
	setx	0x1e012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_21:
	mov	0x25, %r14
	.word 0xf8db8e40  ! 283: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf2b54020  ! 286: STHA_R	stha	%r25, [%r21 + %r0] 0x01
T3_asi_reg_wr_15:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 287: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_20:
	setx	0x1c0316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_16:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 294: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_21:
	setx	0x1d020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ac60ae  ! 299: STBA_I	stba	%r25, [%r17 + 0x00ae] %asi
	.word 0xfc2c6089  ! 300: STB_I	stb	%r30, [%r17 + 0x0089]
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_22:
	setx	0x1d0309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, f)
	.word 0xf6b40020  ! 306: STHA_R	stha	%r27, [%r16 + %r0] 0x01
	.word 0xf6240000  ! 307: STW_R	stw	%r27, [%r16 + %r0]
T3_asi_reg_wr_17:
	mov	0x22, %r14
	.word 0xf0f38e40  ! 308: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_23:
	setx	0x1f010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa74c000  ! 312: STX_R	stx	%r29, [%r19 + %r0]
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982ac2  ! 314: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac2, %hpstate
cpu_intr_3_24:
	setx	0x1f0227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_25:
	setx	0x1c0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf034c000  ! 317: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xfe2d8000  ! 321: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xf2348000  ! 325: STH_R	sth	%r25, [%r18 + %r0]
cpu_intr_3_26:
	setx	0x1c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6354000  ! 328: STH_R	sth	%r27, [%r21 + %r0]
	ta	T_CHANGE_TO_TL1
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_27:
	setx	0x1d0310, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_22:
	mov	0x36, %r14
	.word 0xfcdb8e40  ! 334: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 1)
	.word 0xf475a134  ! 342: STX_I	stx	%r26, [%r22 + 0x0134]
	.word 0xf6348000  ! 344: STH_R	sth	%r27, [%r18 + %r0]
cpu_intr_3_28:
	setx	0x1e022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_29:
	setx	0x1f0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24e04d  ! 351: STW_I	stw	%r29, [%r19 + 0x004d]
	.word 0xf0ac8020  ! 352: STBA_R	stba	%r24, [%r18 + %r0] 0x01
	.word 0xfeb40020  ! 353: STHA_R	stha	%r31, [%r16 + %r0] 0x01
T3_asi_reg_rd_23:
	mov	0x3c7, %r14
	.word 0xf2db8400  ! 355: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_3_30:
	setx	0x1f031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 0)
	.word 0xb63d216a  ! 361: XNOR_I	xnor 	%r20, 0x016a, %r27
	.word 0xf4ad20e7  ! 364: STBA_I	stba	%r26, [%r20 + 0x00e7] %asi
T3_asi_reg_wr_18:
	mov	0x38, %r14
	.word 0xfcf384a0  ! 365: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_31:
	setx	0x1c0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24a0d8  ! 368: STW_I	stw	%r31, [%r18 + 0x00d8]
	ta	T_CHANGE_HPRIV
cpu_intr_3_32:
	setx	0x1f0222, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_19:
	mov	0x25, %r14
	.word 0xfcf38e80  ! 372: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_wr_20:
	mov	0x19, %r14
	.word 0xf4f384a0  ! 373: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb37d2401  ! 375: MOVR_I	movre	%r20, 0x1, %r25
	.word 0xfab5e0d2  ! 379: STHA_I	stha	%r29, [%r23 + 0x00d2] %asi
cpu_intr_3_33:
	setx	0x1f0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef5a1ff  ! 381: STXA_I	stxa	%r31, [%r22 + 0x01ff] %asi
cpu_intr_3_34:
	setx	0x1e0324, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_24:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf0acc020  ! 387: STBA_R	stba	%r24, [%r19 + %r0] 0x01
T3_asi_reg_rd_25:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 388: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 16)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_35:
	setx	0x1f0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c6145  ! 400: STB_I	stb	%r28, [%r17 + 0x0145]
cpu_intr_3_36:
	setx	0x1d0202, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_26:
	mov	0x2c, %r14
	.word 0xf0db8e80  ! 405: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_37:
	setx	0x1f0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63d2189  ! 409: XNOR_I	xnor 	%r20, 0x0189, %r27
cpu_intr_3_38:
	setx	0x1d033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6240000  ! 415: STW_R	stw	%r27, [%r16 + %r0]
T3_asi_reg_wr_21:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 421: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 11)
	.word 0xf6ac0020  ! 426: STBA_R	stba	%r27, [%r16 + %r0] 0x01
	.word 0xfe2ca099  ! 427: STB_I	stb	%r31, [%r18 + 0x0099]
	.word 0xf82de0fb  ! 430: STB_I	stb	%r28, [%r23 + 0x00fb]
cpu_intr_3_39:
	setx	0x1c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_40:
	setx	0x1c022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ade061  ! 444: STBA_I	stba	%r25, [%r23 + 0x0061] %asi
	.word 0xfaada1ea  ! 447: STBA_I	stba	%r29, [%r22 + 0x01ea] %asi
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982d08  ! 448: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d08, %hpstate
	.word 0xfcad8020  ! 449: STBA_R	stba	%r30, [%r22 + %r0] 0x01
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983d12  ! 453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d12, %hpstate
cpu_intr_3_41:
	setx	0x21010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf2acc020  ! 457: STBA_R	stba	%r25, [%r19 + %r0] 0x01
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983ac2  ! 458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac2, %hpstate
	.word 0xfcb4a1c2  ! 459: STHA_I	stha	%r30, [%r18 + 0x01c2] %asi
	.word 0xf6f52167  ! 460: STXA_I	stxa	%r27, [%r20 + 0x0167] %asi
T3_asi_reg_rd_27:
	mov	0x16, %r14
	.word 0xf8db8e60  ! 461: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfaaca0cb  ! 462: STBA_I	stba	%r29, [%r18 + 0x00cb] %asi
	.word 0xbab46102  ! 464: SUBCcc_I	orncc 	%r17, 0x0102, %r29
T3_asi_reg_wr_22:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 466: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xbeace1fa  ! 470: ANDNcc_I	andncc 	%r19, 0x01fa, %r31
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 0)
	.word 0xf2740000  ! 472: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf234c000  ! 475: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xfcade0a3  ! 479: STBA_I	stba	%r30, [%r23 + 0x00a3] %asi
	.word 0xb0ad4000  ! 480: ANDNcc_R	andncc 	%r21, %r0, %r24
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf6252025  ! 484: STW_I	stw	%r27, [%r20 + 0x0025]
cpu_intr_3_42:
	setx	0x22000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_28:
	mov	0x32, %r14
	.word 0xfadb8400  ! 489: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_43:
	setx	0x21012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 6)
	.word 0xfc2560a1  ! 496: STW_I	stw	%r30, [%r21 + 0x00a1]
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 8)
	.word 0xfab58020  ! 500: STHA_R	stha	%r29, [%r22 + %r0] 0x01
T3_asi_reg_wr_23:
	mov	0x6, %r14
	.word 0xfcf384a0  ! 504: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_44:
	setx	0x210222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2354000  ! 509: STH_R	sth	%r25, [%r21 + %r0]
T3_asi_reg_wr_24:
	mov	0x12, %r14
	.word 0xfcf38e80  ! 510: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_rd_29:
	mov	0x17, %r14
	.word 0xfcdb8e80  ! 512: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_45:
	setx	0x21031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_25:
	mov	0x26, %r14
	.word 0xf0f38e40  ! 518: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_wr_26:
	mov	0x3c4, %r14
	.word 0xf4f38400  ! 523: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_46:
	setx	0x220204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe352192  ! 526: STH_I	sth	%r31, [%r20 + 0x0192]
	.word 0xb205615f  ! 528: ADD_I	add 	%r21, 0x015f, %r25
	.word 0xfa2d8000  ! 533: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xfca40020  ! 536: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_27:
	mov	0x19, %r14
	.word 0xf6f389e0  ! 538: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf4f461ed  ! 540: STXA_I	stxa	%r26, [%r17 + 0x01ed] %asi
	.word 0xf6a5a03b  ! 542: STWA_I	stwa	%r27, [%r22 + 0x003b] %asi
	.word 0xf0758000  ! 543: STX_R	stx	%r24, [%r22 + %r0]
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf6b54020  ! 553: STHA_R	stha	%r27, [%r21 + %r0] 0x01
	.word 0xf0746085  ! 554: STX_I	stx	%r24, [%r17 + 0x0085]
	.word 0xfa25611c  ! 556: STW_I	stw	%r29, [%r21 + 0x011c]
	ta	T_CHANGE_HPRIV
	.word 0xf22c2092  ! 564: STB_I	stb	%r25, [%r16 + 0x0092]
T3_asi_reg_wr_28:
	mov	0x9, %r14
	.word 0xfcf38400  ! 565: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_3_47:
	setx	0x230123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0354000  ! 570: SUBC_R	orn 	%r21, %r0, %r24
cpu_intr_3_48:
	setx	0x230134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_49:
	setx	0x220006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa52025  ! 574: SUBcc_I	subcc 	%r20, 0x0025, %r29
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_50:
	setx	0x22032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_51:
	setx	0x220313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82521ad  ! 582: STW_I	stw	%r28, [%r20 + 0x01ad]
	.word 0xfc746157  ! 585: STX_I	stx	%r30, [%r17 + 0x0157]
cpu_intr_3_52:
	setx	0x20023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_29:
	mov	0x3c7, %r14
	.word 0xfef38e60  ! 590: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf4ac8020  ! 591: STBA_R	stba	%r26, [%r18 + %r0] 0x01
	.word 0xf024e02f  ! 594: STW_I	stw	%r24, [%r19 + 0x002f]
cpu_intr_3_53:
	setx	0x20033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_54:
	setx	0x23021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34e12c  ! 599: STH_I	sth	%r30, [%r19 + 0x012c]
cpu_intr_3_55:
	setx	0x22013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_30:
	mov	0xf, %r14
	.word 0xfaf389e0  ! 603: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 30)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_56:
	setx	0x20021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_31:
	mov	0x37, %r14
	.word 0xf4f389e0  ! 614: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_3_57:
	setx	0x210303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_32:
	mov	0x36, %r14
	.word 0xf2f389e0  ! 619: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_3_58:
	setx	0x21003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ace051  ! 623: STBA_I	stba	%r26, [%r19 + 0x0051] %asi
	.word 0xfab4c020  ! 624: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xfaada07c  ! 625: STBA_I	stba	%r29, [%r22 + 0x007c] %asi
cpu_intr_3_59:
	setx	0x22012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03cc000  ! 627: XNOR_R	xnor 	%r19, %r0, %r24
cpu_intr_3_60:
	setx	0x200102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_61:
	setx	0x23021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf825e0c1  ! 630: STW_I	stw	%r28, [%r23 + 0x00c1]
	.word 0xf8742162  ! 631: STX_I	stx	%r28, [%r16 + 0x0162]
cpu_intr_3_62:
	setx	0x210326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_63:
	setx	0x23032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4350000  ! 638: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xfcf4619c  ! 639: STXA_I	stxa	%r30, [%r17 + 0x019c] %asi
	.word 0xf2f4a0f0  ! 642: STXA_I	stxa	%r25, [%r18 + 0x00f0] %asi
cpu_intr_3_64:
	setx	0x23012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcad2136  ! 644: STBA_I	stba	%r30, [%r20 + 0x0136] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xfcb58020  ! 646: STHA_R	stha	%r30, [%r22 + %r0] 0x01
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_65:
	setx	0x210125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_66:
	setx	0x220313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 27)
	.word 0xf8b46062  ! 655: STHA_I	stha	%r28, [%r17 + 0x0062] %asi
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 33)
	.word 0xfe2ce1aa  ! 659: STB_I	stb	%r31, [%r19 + 0x01aa]
cpu_intr_3_67:
	setx	0x210115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf461db  ! 663: STXA_I	stxa	%r30, [%r17 + 0x01db] %asi
	.word 0xb8954000  ! 665: ORcc_R	orcc 	%r21, %r0, %r28
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, e)
	.word 0xf82da16d  ! 669: STB_I	stb	%r28, [%r22 + 0x016d]
	.word 0xf02de159  ! 670: STB_I	stb	%r24, [%r23 + 0x0159]
cpu_intr_3_68:
	setx	0x22001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82d21df  ! 675: ANDN_I	andn 	%r20, 0x01df, %r28
	.word 0xbc05e1b7  ! 676: ADD_I	add 	%r23, 0x01b7, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_69:
	setx	0x230116, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_rd_30:
	mov	0x20, %r14
	.word 0xfcdb8e80  ! 696: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, a)
	.word 0xb89ca188  ! 702: XORcc_I	xorcc 	%r18, 0x0188, %r28
cpu_intr_3_70:
	setx	0x23012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_31:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 705: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_rd_32:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 709: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfeac2175  ! 711: STBA_I	stba	%r31, [%r16 + 0x0175] %asi
T3_asi_reg_rd_33:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 712: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_rd_34:
	mov	0x24, %r14
	.word 0xf0db8e60  ! 713: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfab5616e  ! 714: STHA_I	stha	%r29, [%r21 + 0x016e] %asi
	.word 0xf82c0000  ! 718: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xf02d8000  ! 719: STB_R	stb	%r24, [%r22 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf8ace046  ! 722: STBA_I	stba	%r28, [%r19 + 0x0046] %asi
	.word 0xbc944000  ! 723: ORcc_R	orcc 	%r17, %r0, %r30
	.word 0xf6a40020  ! 726: STWA_R	stwa	%r27, [%r16 + %r0] 0x01
cpu_intr_3_71:
	setx	0x20022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf641800  ! 730: MOVcc_R	<illegal instruction>
	.word 0xf0a4a1b7  ! 735: STWA_I	stwa	%r24, [%r18 + 0x01b7] %asi
cpu_intr_3_72:
	setx	0x230002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa5c000  ! 738: SUBcc_R	subcc 	%r23, %r0, %r29
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_73:
	setx	0x20002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_wr_33:
	mov	0x2c, %r14
	.word 0xf4f38e60  ! 749: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL0
	.word 0xf4f5e1b7  ! 751: STXA_I	stxa	%r26, [%r23 + 0x01b7] %asi
	.word 0xf8f5a0fe  ! 753: STXA_I	stxa	%r28, [%r22 + 0x00fe] %asi
	.word 0xbe8c0000  ! 754: ANDcc_R	andcc 	%r16, %r0, %r31
T3_asi_reg_rd_35:
	mov	0x17, %r14
	.word 0xf0db8e40  ! 758: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_74:
	setx	0x22032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_36:
	mov	0x1d, %r14
	.word 0xfedb8e60  ! 761: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_rd_37:
	mov	0x25, %r14
	.word 0xf6db8e40  ! 763: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf6a4a0ef  ! 764: STWA_I	stwa	%r27, [%r18 + 0x00ef] %asi
T3_asi_reg_wr_34:
	mov	0x29, %r14
	.word 0xfaf38e40  ! 765: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982b88  ! 769: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b88, %hpstate
	.word 0xbc24a005  ! 770: SUB_I	sub 	%r18, 0x0005, %r30
	.word 0xbd2cb001  ! 773: SLLX_I	sllx	%r18, 0x0001, %r30
	.word 0xfcad8020  ! 774: STBA_R	stba	%r30, [%r22 + %r0] 0x01
	.word 0xfe2c601d  ! 775: STB_I	stb	%r31, [%r17 + 0x001d]
	.word 0xb9359000  ! 779: SRLX_R	srlx	%r22, %r0, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xfc258000  ! 781: STW_R	stw	%r30, [%r22 + %r0]
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 31)
	.word 0x8f902001  ! 785: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819828d0  ! 790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d0, %hpstate
	.word 0xf82d4000  ! 791: STB_R	stb	%r28, [%r21 + %r0]
cpu_intr_3_75:
	setx	0x23001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2ce001  ! 795: SLL_I	sll 	%r19, 0x0001, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xb13df001  ! 801: SRAX_I	srax	%r23, 0x0001, %r24
T3_asi_reg_rd_38:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 802: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_wr_35:
	mov	0x18, %r14
	.word 0xfef38e60  ! 803: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T3_asi_reg_rd_39:
	mov	0x1e, %r14
	.word 0xf6db8e40  ! 809: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf2a54020  ! 810: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xba0dc000  ! 811: AND_R	and 	%r23, %r0, %r29
	.word 0xfeb5204b  ! 813: STHA_I	stha	%r31, [%r20 + 0x004b] %asi
	.word 0xbb2dc000  ! 815: SLL_R	sll 	%r23, %r0, %r29
T3_asi_reg_wr_36:
	mov	0x7, %r14
	.word 0xf8f389e0  ! 817: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb0152138  ! 818: OR_I	or 	%r20, 0x0138, %r24
T3_asi_reg_wr_37:
	mov	0x1c, %r14
	.word 0xf6f38e40  ! 821: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_wr_38:
	mov	0x1a, %r14
	.word 0xfcf38400  ! 824: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfa74a0e5  ! 826: STX_I	stx	%r29, [%r18 + 0x00e5]
	.word 0xfc250000  ! 827: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf074e110  ! 828: STX_I	stx	%r24, [%r19 + 0x0110]
cpu_intr_3_76:
	setx	0x220139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72d4000  ! 834: SLL_R	sll 	%r21, %r0, %r27
T3_asi_reg_wr_39:
	mov	0xa, %r14
	.word 0xf8f38e80  ! 835: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_40:
	mov	0x1, %r14
	.word 0xfcdb8e60  ! 838: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfc75e1b5  ! 839: STX_I	stx	%r30, [%r23 + 0x01b5]
	.word 0xbd34d000  ! 840: SRLX_R	srlx	%r19, %r0, %r30
	.word 0xf0ad617c  ! 843: STBA_I	stba	%r24, [%r21 + 0x017c] %asi
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 32)
	.word 0xf235e183  ! 846: STH_I	sth	%r25, [%r23 + 0x0183]
T3_asi_reg_rd_41:
	mov	0xf, %r14
	.word 0xf8db8e40  ! 848: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_77:
	setx	0x200002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 30)
	.word 0xbe254000  ! 851: SUB_R	sub 	%r21, %r0, %r31
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf4342091  ! 855: STH_I	sth	%r26, [%r16 + 0x0091]
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 12)
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982aca  ! 857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aca, %hpstate
	.word 0xfa75a0a6  ! 858: STX_I	stx	%r29, [%r22 + 0x00a6]
cpu_intr_3_78:
	setx	0x210231, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_42:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 861: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf6ad0020  ! 862: STBA_R	stba	%r27, [%r20 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_43:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 866: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_3_79:
	setx	0x220312, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_40:
	mov	0x1c, %r14
	.word 0xf4f38e40  ! 877: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_80:
	setx	0x220008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3c0000  ! 880: SRA_R	sra 	%r16, %r0, %r31
cpu_intr_3_81:
	setx	0x23020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_44:
	mov	0x2f, %r14
	.word 0xfadb8e40  ! 886: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_TO_TL1
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_82:
	setx	0x27033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf435604a  ! 896: STH_I	sth	%r26, [%r21 + 0x004a]
T3_asi_reg_rd_45:
	mov	0x8, %r14
	.word 0xfcdb8e60  ! 897: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_83:
	setx	0x250032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca54020  ! 902: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
	.word 0xfe754000  ! 904: STX_R	stx	%r31, [%r21 + %r0]
cpu_intr_3_84:
	setx	0x26001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0348000  ! 906: STH_R	sth	%r24, [%r18 + %r0]
cpu_intr_3_85:
	setx	0x270318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_86:
	setx	0x240313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2d1000  ! 912: SLLX_R	sllx	%r20, %r0, %r30
cpu_intr_3_87:
	setx	0x250018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_88:
	setx	0x24031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_46:
	mov	0xf, %r14
	.word 0xfedb8400  ! 918: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, c)
	.word 0xf6b44020  ! 921: STHA_R	stha	%r27, [%r17 + %r0] 0x01
cpu_intr_3_89:
	setx	0x25033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_41:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 926: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf8340000  ! 927: STH_R	sth	%r28, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0ac8020  ! 933: STBA_R	stba	%r24, [%r18 + %r0] 0x01
T3_asi_reg_rd_47:
	mov	0x10, %r14
	.word 0xf8db8400  ! 935: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf8b44020  ! 937: STHA_R	stha	%r28, [%r17 + %r0] 0x01
	.word 0xba84c000  ! 938: ADDcc_R	addcc 	%r19, %r0, %r29
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_90:
	setx	0x270137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb695a042  ! 944: ORcc_I	orcc 	%r22, 0x0042, %r27
T3_asi_reg_wr_42:
	mov	0xd, %r14
	.word 0xf2f38400  ! 945: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfaad8020  ! 949: STBA_R	stba	%r29, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd346001  ! 951: SRL_I	srl 	%r17, 0x0001, %r30
	.word 0xb89de157  ! 954: XORcc_I	xorcc 	%r23, 0x0157, %r28
	.word 0xfc24a14a  ! 956: STW_I	stw	%r30, [%r18 + 0x014a]
	.word 0xf42cc000  ! 957: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xb49c617d  ! 958: XORcc_I	xorcc 	%r17, 0x017d, %r26
	.word 0xfca40020  ! 963: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
T3_asi_reg_wr_43:
	mov	0x18, %r14
	.word 0xf8f38e80  ! 964: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_wr_44:
	mov	0xd, %r14
	.word 0xf4f38e40  ! 967: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb4ad212c  ! 968: ANDNcc_I	andncc 	%r20, 0x012c, %r26
	.word 0xfca40020  ! 972: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 25)
	.word 0xf6ac20b0  ! 977: STBA_I	stba	%r27, [%r16 + 0x00b0] %asi
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 15)
	.word 0xbec40000  ! 984: ADDCcc_R	addccc 	%r16, %r0, %r31
	.word 0xf6250000  ! 985: STW_R	stw	%r27, [%r20 + %r0]
cpu_intr_3_91:
	setx	0x270110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f46047  ! 989: STXA_I	stxa	%r24, [%r17 + 0x0047] %asi
	.word 0xf6ad6197  ! 990: STBA_I	stba	%r27, [%r21 + 0x0197] %asi
	.word 0xf0742004  ! 991: STX_I	stx	%r24, [%r16 + 0x0004]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_45:
	mov	0x11, %r14
	.word 0xf0f38e60  ! 993: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_wr_46:
	mov	0x8, %r14
	.word 0xf6f38e80  ! 996: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_92:
	setx	0x270204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ac614e  ! 999: STBA_I	stba	%r25, [%r17 + 0x014e] %asi
	.word 0xf225c000  ! 1002: STW_R	stw	%r25, [%r23 + %r0]
T3_asi_reg_rd_48:
	mov	0x2e, %r14
	.word 0xf4db8e80  ! 1007: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf4ad4020  ! 1012: STBA_R	stba	%r26, [%r21 + %r0] 0x01
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_rd_49:
	mov	0x2e, %r14
	.word 0xf2db84a0  ! 1015: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_50:
	mov	0x9, %r14
	.word 0xf6db8e40  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_93:
	setx	0x240319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_94:
	setx	0x26030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b5a181  ! 1021: STHA_I	stha	%r26, [%r22 + 0x0181] %asi
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 31)
	.word 0xf025e00d  ! 1023: STW_I	stw	%r24, [%r23 + 0x000d]
	.word 0xf024c000  ! 1026: STW_R	stw	%r24, [%r19 + %r0]
T3_asi_reg_rd_51:
	mov	0x3c3, %r14
	.word 0xf4db84a0  ! 1028: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf6ad8020  ! 1029: STBA_R	stba	%r27, [%r22 + %r0] 0x01
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_rd_52:
	mov	0x6, %r14
	.word 0xfadb84a0  ! 1031: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T3_asi_reg_rd_53:
	mov	0x38, %r14
	.word 0xf8db8e80  ! 1035: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_95:
	setx	0x250323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf0252160  ! 1044: STW_I	stw	%r24, [%r20 + 0x0160]
	.word 0xf475e13e  ! 1047: STX_I	stx	%r26, [%r23 + 0x013e]
	.word 0xfeb4e118  ! 1049: STHA_I	stha	%r31, [%r19 + 0x0118] %asi
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 3e)
	.word 0xbc1d6096  ! 1052: XOR_I	xor 	%r21, 0x0096, %r30
	.word 0xf6b44020  ! 1057: STHA_R	stha	%r27, [%r17 + %r0] 0x01
T3_asi_reg_wr_47:
	mov	0x25, %r14
	.word 0xf0f38e60  ! 1060: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 16)
	.word 0xfca460d2  ! 1064: STWA_I	stwa	%r30, [%r17 + 0x00d2] %asi
	.word 0xfc34c000  ! 1068: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xbb3d7001  ! 1071: SRAX_I	srax	%r21, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_96:
	setx	0x270102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca4c020  ! 1075: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
T3_asi_reg_wr_48:
	mov	0x5, %r14
	.word 0xfcf38400  ! 1076: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_3_97:
	setx	0x250220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a421b9  ! 1081: STWA_I	stwa	%r28, [%r16 + 0x01b9] %asi
T3_asi_reg_rd_54:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 1082: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 1b)
	ta	T_CHANGE_TO_TL0
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, b)
	.word 0xf07561f6  ! 1088: STX_I	stx	%r24, [%r21 + 0x01f6]
T3_asi_reg_wr_49:
	mov	0x12, %r14
	.word 0xf8f38e60  ! 1089: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_98:
	setx	0x260234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b52104  ! 1095: SUBCcc_I	orncc 	%r20, 0x0104, %r26
cpu_intr_3_99:
	setx	0x240225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_100:
	setx	0x260335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_101:
	setx	0x270039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a52107  ! 1105: STWA_I	stwa	%r26, [%r20 + 0x0107] %asi
T3_asi_reg_wr_50:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 1106: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf2246156  ! 1107: STW_I	stw	%r25, [%r17 + 0x0156]
	.word 0xfcf421cb  ! 1109: STXA_I	stxa	%r30, [%r16 + 0x01cb] %asi
cpu_intr_3_102:
	setx	0x270010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_103:
	setx	0x240121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf034e012  ! 1112: STH_I	sth	%r24, [%r19 + 0x0012]
T3_asi_reg_rd_55:
	mov	0x23, %r14
	.word 0xfcdb8e60  ! 1114: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_TO_TL1
cpu_intr_3_104:
	setx	0x24000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfe2dc000  ! 1123: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xbb504000  ! 1128: RDPR_TNPC	rdpr	%tnpc, %r29
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 30)
	.word 0xba0d4000  ! 1133: AND_R	and 	%r21, %r0, %r29
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, b)
	.word 0xfaa50020  ! 1136: STWA_R	stwa	%r29, [%r20 + %r0] 0x01
	.word 0xf8a520ce  ! 1137: STWA_I	stwa	%r28, [%r20 + 0x00ce] %asi
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_105:
	setx	0x27023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_106:
	setx	0x260126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe350000  ! 1142: STH_R	sth	%r31, [%r20 + %r0]
cpu_intr_3_107:
	setx	0x24030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_108:
	setx	0x250124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434e1aa  ! 1146: STH_I	sth	%r26, [%r19 + 0x01aa]
cpu_intr_3_109:
	setx	0x260316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6342135  ! 1149: STH_I	sth	%r27, [%r16 + 0x0135]
	.word 0xf4254000  ! 1150: STW_R	stw	%r26, [%r21 + %r0]
T3_asi_reg_rd_56:
	mov	0x12, %r14
	.word 0xfedb8e60  ! 1156: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb8c5e1de  ! 1158: ADDCcc_I	addccc 	%r23, 0x01de, %r28
cpu_intr_3_110:
	setx	0x27031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8acc020  ! 1161: STBA_R	stba	%r28, [%r19 + %r0] 0x01
cpu_intr_3_111:
	setx	0x27012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_wr_51:
	mov	0x7, %r14
	.word 0xfaf384a0  ! 1165: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_57:
	mov	0x1, %r14
	.word 0xfedb8e40  ! 1166: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf474a1cc  ! 1169: STX_I	stx	%r26, [%r18 + 0x01cc]
	.word 0xf82520c0  ! 1171: STW_I	stw	%r28, [%r20 + 0x00c0]
T3_asi_reg_wr_52:
	mov	0xd, %r14
	.word 0xf2f389e0  ! 1172: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf6740000  ! 1173: STX_R	stx	%r27, [%r16 + %r0]
T3_asi_reg_wr_53:
	mov	0x21, %r14
	.word 0xf8f38e80  ! 1177: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 2c)
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a12  ! 1184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a12, %hpstate
	.word 0xfeb42066  ! 1186: STHA_I	stha	%r31, [%r16 + 0x0066] %asi
	.word 0xf024a1df  ! 1187: STW_I	stw	%r24, [%r18 + 0x01df]
	.word 0xf8b44020  ! 1190: STHA_R	stha	%r28, [%r17 + %r0] 0x01
	.word 0xf075a11f  ! 1193: STX_I	stx	%r24, [%r22 + 0x011f]
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982b5a  ! 1194: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5a, %hpstate
cpu_intr_3_112:
	setx	0x250101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_113:
	setx	0x260314, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_58:
	mov	0x3c0, %r14
	.word 0xfcdb89e0  ! 1202: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T3_asi_reg_wr_54:
	mov	0x3c1, %r14
	.word 0xfaf38e60  ! 1207: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_3_114:
	setx	0x260102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 2e)
	ta	T_CHANGE_HPRIV
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 26)
	.word 0xf42ca16d  ! 1218: STB_I	stb	%r26, [%r18 + 0x016d]
	.word 0xf0f5609b  ! 1220: STXA_I	stxa	%r24, [%r21 + 0x009b] %asi
cpu_intr_3_115:
	setx	0x260204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_116:
	setx	0x260234, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819829d0  ! 1229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d0, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xfaace037  ! 1231: STBA_I	stba	%r29, [%r19 + 0x0037] %asi
cpu_intr_3_117:
	setx	0x250325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb6a5a196  ! 1237: SUBcc_I	subcc 	%r22, 0x0196, %r27
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 29)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_118:
	setx	0x270122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22c8000  ! 1250: ANDN_R	andn 	%r18, %r0, %r25
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c42  ! 1251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c42, %hpstate
T3_asi_reg_rd_59:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 1254: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 1b)
	ta	T_CHANGE_NONHPRIV
	.word 0xfc250000  ! 1260: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf675c000  ! 1262: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xb7343001  ! 1265: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0xf42c8000  ! 1268: STB_R	stb	%r26, [%r18 + %r0]
cpu_intr_3_119:
	setx	0x250235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 8)
	.word 0xf6ad0020  ! 1277: STBA_R	stba	%r27, [%r20 + %r0] 0x01
T3_asi_reg_rd_60:
	mov	0xb, %r14
	.word 0xfcdb8400  ! 1278: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_61:
	mov	0x7, %r14
	.word 0xfcdb8e40  ! 1288: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_wr_55:
	mov	0xe, %r14
	.word 0xfef38e80  ! 1292: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_120:
	setx	0x260120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92c3001  ! 1297: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xf47520a1  ! 1299: STX_I	stx	%r26, [%r20 + 0x00a1]
	.word 0xbc350000  ! 1304: SUBC_R	orn 	%r20, %r0, %r30
T3_asi_reg_wr_56:
	mov	0x1a, %r14
	.word 0xf6f38e40  ! 1305: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_121:
	setx	0x250325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb4c020  ! 1307: STHA_R	stha	%r31, [%r19 + %r0] 0x01
	.word 0xb9643801  ! 1310: MOVcc_I	<illegal instruction>
	.word 0xf8348000  ! 1311: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xfaa4a0c2  ! 1313: STWA_I	stwa	%r29, [%r18 + 0x00c2] %asi
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_57:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 1318: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf6b4e0f6  ! 1319: STHA_I	stha	%r27, [%r19 + 0x00f6] %asi
T3_asi_reg_wr_58:
	mov	0x30, %r14
	.word 0xfef389e0  ! 1322: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_rd_62:
	mov	0x25, %r14
	.word 0xf0db8e80  ! 1324: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xf2a52144  ! 1329: STWA_I	stwa	%r25, [%r20 + 0x0144] %asi
	.word 0xf274a089  ! 1332: STX_I	stx	%r25, [%r18 + 0x0089]
	.word 0xfe2c0000  ! 1333: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xb93d6001  ! 1336: SRA_I	sra 	%r21, 0x0001, %r28
T3_asi_reg_wr_59:
	mov	0x1f, %r14
	.word 0xf0f38e40  ! 1339: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_122:
	setx	0x240235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 16)
	.word 0xf6354000  ! 1344: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xbc858000  ! 1348: ADDcc_R	addcc 	%r22, %r0, %r30
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_rd_63:
	mov	0x12, %r14
	.word 0xfcdb8e80  ! 1350: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
cpu_intr_3_123:
	setx	0x270303, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_64:
	mov	0x1f, %r14
	.word 0xf0db8e40  ! 1359: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_124:
	setx	0x270310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2758000  ! 1361: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xfc7520c7  ! 1362: STX_I	stx	%r30, [%r20 + 0x00c7]
cpu_intr_3_125:
	setx	0x26023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24c000  ! 1364: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xfa2cc000  ! 1365: STB_R	stb	%r29, [%r19 + %r0]
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_126:
	setx	0x260033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_127:
	setx	0x270035, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f0a  ! 1375: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0a, %hpstate
cpu_intr_3_128:
	setx	0x25032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9c8000  ! 1378: XORcc_R	xorcc 	%r18, %r0, %r31
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 39)
	.word 0xf0b48020  ! 1381: STHA_R	stha	%r24, [%r18 + %r0] 0x01
	.word 0xfaa4c020  ! 1382: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
	.word 0xfe2c211d  ! 1384: STB_I	stb	%r31, [%r16 + 0x011d]
T3_asi_reg_wr_60:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 1385: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf2748000  ! 1387: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xf02d602c  ! 1390: STB_I	stb	%r24, [%r21 + 0x002c]
T3_asi_reg_wr_61:
	mov	0xc, %r14
	.word 0xf8f38e60  ! 1392: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_129:
	setx	0x280024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_130:
	setx	0x2a0038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_131:
	setx	0x2a0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a40020  ! 1398: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
	.word 0xf4f5e153  ! 1399: STXA_I	stxa	%r26, [%r23 + 0x0153] %asi
T3_asi_reg_wr_62:
	mov	0x12, %r14
	.word 0xf0f38e40  ! 1401: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf83421f7  ! 1402: STH_I	sth	%r28, [%r16 + 0x01f7]
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfa2c0000  ! 1409: STB_R	stb	%r29, [%r16 + %r0]
T3_asi_reg_wr_63:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 1410: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983ac0  ! 1417: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac0, %hpstate
	.word 0xfe742001  ! 1419: STX_I	stx	%r31, [%r16 + 0x0001]
	.word 0xfcad0020  ! 1423: STBA_R	stba	%r30, [%r20 + %r0] 0x01
	.word 0xba044000  ! 1427: ADD_R	add 	%r17, %r0, %r29
T3_asi_reg_wr_64:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 1430: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf22ca005  ! 1432: STB_I	stb	%r25, [%r18 + 0x0005]
T3_asi_reg_wr_65:
	mov	0x13, %r14
	.word 0xf6f38e60  ! 1433: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf834a103  ! 1436: STH_I	sth	%r28, [%r18 + 0x0103]
	.word 0xf0f56011  ! 1438: STXA_I	stxa	%r24, [%r21 + 0x0011] %asi
	.word 0xf4a5e15a  ! 1439: STWA_I	stwa	%r26, [%r23 + 0x015a] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_132:
	setx	0x2b010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_66:
	mov	0x2f, %r14
	.word 0xf2f38e60  ! 1447: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_133:
	setx	0x28031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_67:
	mov	0x36, %r14
	.word 0xfcf38400  ! 1456: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfcada1bd  ! 1461: STBA_I	stba	%r30, [%r22 + 0x01bd] %asi
T3_asi_reg_rd_65:
	mov	0x2c, %r14
	.word 0xf6db84a0  ! 1464: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819839c2  ! 1467: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c2, %hpstate
	.word 0xf82ca14f  ! 1470: STB_I	stb	%r28, [%r18 + 0x014f]
	.word 0xbebd61f1  ! 1472: XNORcc_I	xnorcc 	%r21, 0x01f1, %r31
cpu_intr_3_134:
	setx	0x290009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef4e18d  ! 1478: STXA_I	stxa	%r31, [%r19 + 0x018d] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_135:
	setx	0x2a0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0348000  ! 1483: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf434c000  ! 1485: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xfc35e1c0  ! 1491: STH_I	sth	%r30, [%r23 + 0x01c0]
	.word 0xf474a021  ! 1493: STX_I	stx	%r26, [%r18 + 0x0021]
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983ac0  ! 1494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac0, %hpstate
	.word 0xf8f4609a  ! 1495: STXA_I	stxa	%r28, [%r17 + 0x009a] %asi
	.word 0xf6b4e1f9  ! 1498: STHA_I	stha	%r27, [%r19 + 0x01f9] %asi
T3_asi_reg_wr_68:
	mov	0x3, %r14
	.word 0xfcf38e60  ! 1501: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf0ada044  ! 1502: STBA_I	stba	%r24, [%r22 + 0x0044] %asi
	.word 0xf2b44020  ! 1504: STHA_R	stha	%r25, [%r17 + %r0] 0x01
T3_asi_reg_wr_69:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 1507: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf074c000  ! 1508: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xf2a54020  ! 1510: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 37)
	.word 0xbf50c000  ! 1520: RDPR_TT	rdpr	%tt, %r31
	ta	T_CHANGE_TO_TL1
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_66:
	mov	0x3c7, %r14
	.word 0xf0db84a0  ! 1523: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb334b001  ! 1526: SRLX_I	srlx	%r18, 0x0001, %r25
T3_asi_reg_wr_70:
	mov	0x2a, %r14
	.word 0xf6f38e80  ! 1529: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_rd_67:
	mov	0x27, %r14
	.word 0xf6db8400  ! 1530: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_71:
	mov	0x26, %r14
	.word 0xf0f38e80  ! 1534: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfaf420bb  ! 1535: STXA_I	stxa	%r29, [%r16 + 0x00bb] %asi
	.word 0xfcb4609f  ! 1537: STHA_I	stha	%r30, [%r17 + 0x009f] %asi
T3_asi_reg_rd_68:
	mov	0x36, %r14
	.word 0xf2db8e40  ! 1538: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_69:
	mov	0x32, %r14
	.word 0xfadb89e0  ! 1540: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_72:
	mov	0x2, %r14
	.word 0xf4f38e60  ! 1542: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983d48  ! 1547: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d48, %hpstate
	.word 0xf024a12c  ! 1549: STW_I	stw	%r24, [%r18 + 0x012c]
	.word 0xf62cc000  ! 1552: STB_R	stb	%r27, [%r19 + %r0]
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 39)
	.word 0xbec4e105  ! 1555: ADDCcc_I	addccc 	%r19, 0x0105, %r31
T3_asi_reg_rd_70:
	mov	0x3c8, %r14
	.word 0xf8db89e0  ! 1558: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_136:
	setx	0x280023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_wr_73:
	mov	0x36, %r14
	.word 0xf2f384a0  ! 1567: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_137:
	setx	0x2a0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ade05b  ! 1569: STBA_I	stba	%r27, [%r23 + 0x005b] %asi
	.word 0xb4340000  ! 1570: SUBC_R	orn 	%r16, %r0, %r26
	.word 0xb615a1fb  ! 1571: OR_I	or 	%r22, 0x01fb, %r27
	.word 0xb215e0e6  ! 1576: OR_I	or 	%r23, 0x00e6, %r25
	.word 0xb2946018  ! 1577: ORcc_I	orcc 	%r17, 0x0018, %r25
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_138:
	setx	0x2a0020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_139:
	setx	0x28020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_74:
	mov	0x2b, %r14
	.word 0xf0f38e80  ! 1591: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf82d8000  ! 1596: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xf8a54020  ! 1597: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
cpu_intr_3_140:
	setx	0x2b0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2ade15f  ! 1602: STBA_I	stba	%r25, [%r23 + 0x015f] %asi
cpu_intr_3_141:
	setx	0x2b032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_142:
	setx	0x2b0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1cc000  ! 1605: XOR_R	xor 	%r19, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf4ace00e  ! 1607: STBA_I	stba	%r26, [%r19 + 0x000e] %asi
	.word 0xf625614d  ! 1610: STW_I	stw	%r27, [%r21 + 0x014d]
T3_asi_reg_wr_75:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 1611: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 28)
	.word 0xf2252139  ! 1615: STW_I	stw	%r25, [%r20 + 0x0139]
T3_asi_reg_rd_71:
	mov	0x21, %r14
	.word 0xfedb8400  ! 1617: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf6ac4020  ! 1619: STBA_R	stba	%r27, [%r17 + %r0] 0x01
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 9)
	.word 0xfc340000  ! 1623: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xb52d4000  ! 1625: SLL_R	sll 	%r21, %r0, %r26
	.word 0xf42c0000  ! 1627: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xf035a00f  ! 1630: STH_I	sth	%r24, [%r22 + 0x000f]
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198299a  ! 1632: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099a, %hpstate
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c88  ! 1633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c88, %hpstate
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf82c8000  ! 1643: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xb60ca128  ! 1644: AND_I	and 	%r18, 0x0128, %r27
cpu_intr_3_143:
	setx	0x28032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b48020  ! 1647: STHA_R	stha	%r25, [%r18 + %r0] 0x01
T3_asi_reg_rd_72:
	mov	0x2d, %r14
	.word 0xf0db8e40  ! 1648: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfcb52086  ! 1649: STHA_I	stha	%r30, [%r20 + 0x0086] %asi
	.word 0xb23da1fc  ! 1653: XNOR_I	xnor 	%r22, 0x01fc, %r25
	.word 0xf8b4c020  ! 1655: STHA_R	stha	%r28, [%r19 + %r0] 0x01
	.word 0xf42d0000  ! 1656: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xfaa58020  ! 1657: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	.word 0xf825c000  ! 1659: STW_R	stw	%r28, [%r23 + %r0]
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_wr_76:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 1662: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_144:
	setx	0x28032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_73:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 1665: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_rd_74:
	mov	0x18, %r14
	.word 0xf0db89e0  ! 1667: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb52d0000  ! 1668: SLL_R	sll 	%r20, %r0, %r26
cpu_intr_3_145:
	setx	0x2b0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0aca1d0  ! 1671: STBA_I	stba	%r24, [%r18 + 0x01d0] %asi
	.word 0xf02ca145  ! 1672: STB_I	stb	%r24, [%r18 + 0x0145]
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf4f5a0ff  ! 1682: STXA_I	stxa	%r26, [%r22 + 0x00ff] %asi
	.word 0xb8b5c000  ! 1683: ORNcc_R	orncc 	%r23, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_77:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 1685: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfa34c000  ! 1687: STH_R	sth	%r29, [%r19 + %r0]
T3_asi_reg_wr_78:
	mov	0x1c, %r14
	.word 0xf2f38e40  ! 1690: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf0f5e17b  ! 1691: STXA_I	stxa	%r24, [%r23 + 0x017b] %asi
	.word 0xfcad61d9  ! 1692: STBA_I	stba	%r30, [%r21 + 0x01d9] %asi
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 1e)
	.word 0xbe9ce146  ! 1697: XORcc_I	xorcc 	%r19, 0x0146, %r31
	.word 0xb13c3001  ! 1698: SRAX_I	srax	%r16, 0x0001, %r24
	.word 0xfa240000  ! 1699: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xf2240000  ! 1701: STW_R	stw	%r25, [%r16 + %r0]
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_75:
	mov	0x14, %r14
	.word 0xf0db84a0  ! 1704: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf82ce0bf  ! 1708: STB_I	stb	%r28, [%r19 + 0x00bf]
T3_asi_reg_wr_79:
	mov	0x29, %r14
	.word 0xfcf38e60  ! 1710: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_146:
	setx	0x2a0115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_147:
	setx	0x280304, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_76:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 1718: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xbf7d8400  ! 1720: MOVR_R	movre	%r22, %r0, %r31
T3_asi_reg_wr_80:
	mov	0xc, %r14
	.word 0xf8f38400  ! 1723: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf0b44020  ! 1726: STHA_R	stha	%r24, [%r17 + %r0] 0x01
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_148:
	setx	0x28003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf23420c9  ! 1735: STH_I	sth	%r25, [%r16 + 0x00c9]
cpu_intr_3_149:
	setx	0x2a001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_150:
	setx	0x280029, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_77:
	mov	0x8, %r14
	.word 0xf2db8e80  ! 1741: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_3_151:
	setx	0x290216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf6ad20a3  ! 1744: STBA_I	stba	%r27, [%r20 + 0x00a3] %asi
	.word 0xfc2c8000  ! 1747: STB_R	stb	%r30, [%r18 + %r0]
cpu_intr_3_152:
	setx	0x28032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_81:
	mov	0x3c0, %r14
	.word 0xf4f389e0  ! 1750: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf6a56070  ! 1752: STWA_I	stwa	%r27, [%r21 + 0x0070] %asi
	.word 0xfea40020  ! 1753: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
T3_asi_reg_rd_78:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 1754: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_153:
	setx	0x280230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_154:
	setx	0x280039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_79:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 1765: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_80:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 1769: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_82:
	mov	0x1f, %r14
	.word 0xfef384a0  ! 1771: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_rd_81:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 1772: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf034205d  ! 1775: STH_I	sth	%r24, [%r16 + 0x005d]
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_wr_83:
	mov	0x1f, %r14
	.word 0xf2f38e40  ! 1780: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf4ac4020  ! 1783: STBA_R	stba	%r26, [%r17 + %r0] 0x01
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 6)
	.word 0xf2a40020  ! 1788: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
	.word 0xf475e0fa  ! 1797: STX_I	stx	%r26, [%r23 + 0x00fa]
	.word 0xfe24a1e7  ! 1798: STW_I	stw	%r31, [%r18 + 0x01e7]
	.word 0xf8f4a083  ! 1800: STXA_I	stxa	%r28, [%r18 + 0x0083] %asi
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_wr_84:
	mov	0x3c5, %r14
	.word 0xfcf38e80  ! 1806: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf22d20a2  ! 1807: STB_I	stb	%r25, [%r20 + 0x00a2]
cpu_intr_3_155:
	setx	0x2b012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea4e142  ! 1809: STWA_I	stwa	%r31, [%r19 + 0x0142] %asi
	.word 0xf6f5a1d1  ! 1810: STXA_I	stxa	%r27, [%r22 + 0x01d1] %asi
	.word 0xbe8c8000  ! 1811: ANDcc_R	andcc 	%r18, %r0, %r31
T3_asi_reg_wr_85:
	mov	0x17, %r14
	.word 0xf6f38e40  ! 1812: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_156:
	setx	0x2b033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_86:
	mov	0x1c, %r14
	.word 0xf2f38e60  ! 1814: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf224c000  ! 1815: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xbc35e156  ! 1816: ORN_I	orn 	%r23, 0x0156, %r30
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_157:
	setx	0x2f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a560c6  ! 1820: STWA_I	stwa	%r26, [%r21 + 0x00c6] %asi
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_158:
	setx	0x2c0337, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_82:
	mov	0x15, %r14
	.word 0xf2db8e60  ! 1829: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbd350000  ! 1831: SRL_R	srl 	%r20, %r0, %r30
	.word 0xf8a58020  ! 1834: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
	.word 0xfc3421e4  ! 1837: STH_I	sth	%r30, [%r16 + 0x01e4]
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_83:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 1839: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfa34a01c  ! 1840: STH_I	sth	%r29, [%r18 + 0x001c]
	.word 0xf4ac4020  ! 1841: STBA_R	stba	%r26, [%r17 + %r0] 0x01
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_159:
	setx	0x2d0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_87:
	mov	0x17, %r14
	.word 0xf4f384a0  ! 1852: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_160:
	setx	0x2c0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35e106  ! 1856: STH_I	sth	%r29, [%r23 + 0x0106]
T3_asi_reg_rd_84:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 1859: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_TO_TL1
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_85:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 1867: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 24)
	.word 0xf2250000  ! 1870: STW_R	stw	%r25, [%r20 + %r0]
T3_asi_reg_wr_88:
	mov	0xd, %r14
	.word 0xfef38e60  ! 1872: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T3_asi_reg_wr_89:
	mov	0x7, %r14
	.word 0xf2f389e0  ! 1874: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb644a119  ! 1877: ADDC_I	addc 	%r18, 0x0119, %r27
	.word 0xbd2d1000  ! 1878: SLLX_R	sllx	%r20, %r0, %r30
	.word 0xf42d0000  ! 1880: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xfcf5e024  ! 1881: STXA_I	stxa	%r30, [%r23 + 0x0024] %asi
	.word 0xf624a0c9  ! 1882: STW_I	stw	%r27, [%r18 + 0x00c9]
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_161:
	setx	0x2d0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_86:
	mov	0x2c, %r14
	.word 0xfadb8400  ! 1887: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_162:
	setx	0x2e001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_rd_87:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbd2d8000  ! 1892: SLL_R	sll 	%r22, %r0, %r30
	.word 0xf8ad2084  ! 1893: STBA_I	stba	%r28, [%r20 + 0x0084] %asi
cpu_intr_3_163:
	setx	0x2c0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a54020  ! 1897: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xf8b54020  ! 1900: STHA_R	stha	%r28, [%r21 + %r0] 0x01
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_164:
	setx	0x2f0315, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_88:
	mov	0x38, %r14
	.word 0xf0db8400  ! 1904: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfcac218b  ! 1906: STBA_I	stba	%r30, [%r16 + 0x018b] %asi
T3_asi_reg_rd_89:
	mov	0xa, %r14
	.word 0xf6db8e40  ! 1907: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 0)
	.word 0xf025c000  ! 1914: STW_R	stw	%r24, [%r23 + %r0]
cpu_intr_3_165:
	setx	0x2f012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_166:
	setx	0x2e020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d61df  ! 1921: STB_I	stb	%r30, [%r21 + 0x01df]
	.word 0xf82ce192  ! 1923: STB_I	stb	%r28, [%r19 + 0x0192]
	.word 0xf22c4000  ! 1924: STB_R	stb	%r25, [%r17 + %r0]
cpu_intr_3_167:
	setx	0x2e023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_168:
	setx	0x2c022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_90:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 1928: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_169:
	setx	0x2c0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca48020  ! 1933: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_170:
	setx	0x2f0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82cc000  ! 1938: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xf2ac0020  ! 1939: STBA_R	stba	%r25, [%r16 + %r0] 0x01
T3_asi_reg_wr_90:
	mov	0x33, %r14
	.word 0xf6f38e40  ! 1941: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_171:
	setx	0x2e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc342074  ! 1946: SUBC_I	orn 	%r16, 0x0074, %r30
cpu_intr_3_172:
	setx	0x2d0111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf825a11f  ! 1953: STW_I	stw	%r28, [%r22 + 0x011f]
	.word 0xfcb520bf  ! 1956: STHA_I	stha	%r30, [%r20 + 0x00bf] %asi
	.word 0xf2344000  ! 1957: STH_R	sth	%r25, [%r17 + %r0]
T3_asi_reg_wr_91:
	mov	0x2e, %r14
	.word 0xf0f38400  ! 1958: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf4b54020  ! 1959: STHA_R	stha	%r26, [%r21 + %r0] 0x01
	.word 0xfe248000  ! 1960: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xfa25e038  ! 1962: STW_I	stw	%r29, [%r23 + 0x0038]
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_173:
	setx	0x2c0139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_174:
	setx	0x2f0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c0000  ! 1967: STB_R	stb	%r29, [%r16 + %r0]
cpu_intr_3_175:
	setx	0x2d023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 1)
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819839c2  ! 1970: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c2, %hpstate
T3_asi_reg_wr_92:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 1974: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfc25c000  ! 1975: STW_R	stw	%r30, [%r23 + %r0]
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d52  ! 1976: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d52, %hpstate
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf6ada1ed  ! 1978: STBA_I	stba	%r27, [%r22 + 0x01ed] %asi
	.word 0xfaa5c020  ! 1979: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_176:
	setx	0x2d0333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_177:
	setx	0x2e020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf4a07a  ! 1983: STXA_I	stxa	%r30, [%r18 + 0x007a] %asi
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_178:
	setx	0x2f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c5e1b9  ! 1993: ADDCcc_I	addccc 	%r23, 0x01b9, %r27
cpu_intr_3_179:
	setx	0x2f032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_180:
	setx	0x2d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa74c000  ! 2002: STX_R	stx	%r29, [%r19 + %r0]
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf224e12f  ! 2005: STW_I	stw	%r25, [%r19 + 0x012f]
cpu_intr_3_181:
	setx	0x2e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275c000  ! 2009: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xfa354000  ! 2010: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf075c000  ! 2011: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xfa2c609b  ! 2013: STB_I	stb	%r29, [%r17 + 0x009b]
	.word 0xb234a01f  ! 2014: ORN_I	orn 	%r18, 0x001f, %r25
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 28)
	.word 0xf6ac4020  ! 2017: STBA_R	stba	%r27, [%r17 + %r0] 0x01
T3_asi_reg_wr_93:
	mov	0x10, %r14
	.word 0xf4f38400  ! 2021: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 35)
	.word 0xfef4e102  ! 2028: STXA_I	stxa	%r31, [%r19 + 0x0102] %asi
	.word 0xb8ac4000  ! 2029: ANDNcc_R	andncc 	%r17, %r0, %r28
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, d)
	.word 0xf2b42021  ! 2037: STHA_I	stha	%r25, [%r16 + 0x0021] %asi
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfaac0020  ! 2039: STBA_R	stba	%r29, [%r16 + %r0] 0x01
T3_asi_reg_rd_91:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 2040: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfcac0020  ! 2041: STBA_R	stba	%r30, [%r16 + %r0] 0x01
T3_asi_reg_wr_94:
	mov	0x3c4, %r14
	.word 0xf2f38400  ! 2047: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf6358000  ! 2050: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf6240000  ! 2052: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xfc35e1cc  ! 2053: STH_I	sth	%r30, [%r23 + 0x01cc]
	.word 0xb2250000  ! 2059: SUB_R	sub 	%r20, %r0, %r25
	.word 0xfc2c8000  ! 2062: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xf6248000  ! 2064: STW_R	stw	%r27, [%r18 + %r0]
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 17)
	.word 0xb83ce0db  ! 2073: XNOR_I	xnor 	%r19, 0x00db, %r28
	.word 0xfc2d21c0  ! 2075: STB_I	stb	%r30, [%r20 + 0x01c0]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 19)
	.word 0xb8c4c000  ! 2082: ADDCcc_R	addccc 	%r19, %r0, %r28
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_95:
	mov	0x6, %r14
	.word 0xfcf38e60  ! 2084: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbb3d0000  ! 2089: SRA_R	sra 	%r20, %r0, %r29
	.word 0xf0754000  ! 2090: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xf074a06b  ! 2091: STX_I	stx	%r24, [%r18 + 0x006b]
T3_asi_reg_rd_92:
	mov	0x3c1, %r14
	.word 0xf2db8e60  ! 2092: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_182:
	setx	0x2d0333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_183:
	setx	0x2e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e1a  ! 2097: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1a, %hpstate
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 16)
	.word 0xf0ac21e5  ! 2099: STBA_I	stba	%r24, [%r16 + 0x01e5] %asi
T3_asi_reg_rd_93:
	mov	0x26, %r14
	.word 0xfcdb8e80  ! 2100: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T3_asi_reg_rd_94:
	mov	0x25, %r14
	.word 0xfadb8e80  ! 2101: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf82de03a  ! 2102: STB_I	stb	%r28, [%r23 + 0x003a]
T3_asi_reg_rd_95:
	mov	0x25, %r14
	.word 0xf8db8400  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_96:
	mov	0x12, %r14
	.word 0xf6f389e0  ! 2106: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb2342184  ! 2107: SUBC_I	orn 	%r16, 0x0184, %r25
T3_asi_reg_wr_97:
	mov	0xd, %r14
	.word 0xfaf38e60  ! 2108: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_3_184:
	setx	0x2f0025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfaada029  ! 2111: STBA_I	stba	%r29, [%r22 + 0x0029] %asi
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_185:
	setx	0x2c001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a5c020  ! 2115: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
cpu_intr_3_186:
	setx	0x2f0002, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_96:
	mov	0x2f, %r14
	.word 0xf2db89e0  ! 2120: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_wr_98:
	mov	0x6, %r14
	.word 0xf4f38e60  ! 2122: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbac5c000  ! 2123: ADDCcc_R	addccc 	%r23, %r0, %r29
	.word 0xf4a4c020  ! 2126: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
	.word 0xfa758000  ! 2127: STX_R	stx	%r29, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xfca58020  ! 2130: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
	.word 0xfe744000  ! 2131: STX_R	stx	%r31, [%r17 + %r0]
T3_asi_reg_wr_99:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 2134: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_187:
	setx	0x2c0332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_188:
	setx	0x2f0029, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_100:
	mov	0x3c1, %r14
	.word 0xf6f389e0  ! 2141: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf4254000  ! 2142: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf4344000  ! 2145: STH_R	sth	%r26, [%r17 + %r0]
T3_asi_reg_rd_97:
	mov	0x1e, %r14
	.word 0xfedb8e60  ! 2149: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_rd_98:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_3_189:
	setx	0x2c0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa4c020  ! 2161: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
	.word 0xf0756012  ! 2162: STX_I	stx	%r24, [%r21 + 0x0012]
	.word 0xbc1520f1  ! 2164: OR_I	or 	%r20, 0x00f1, %r30
cpu_intr_3_190:
	setx	0x2c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb5e08d  ! 2169: STHA_I	stha	%r30, [%r23 + 0x008d] %asi
cpu_intr_3_191:
	setx	0x2e011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb54000  ! 2175: ORNcc_R	orncc 	%r21, %r0, %r31
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 1)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982c12  ! 2177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c12, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0xfc254000  ! 2179: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xf2a5c020  ! 2181: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
	.word 0xf025c000  ! 2184: STW_R	stw	%r24, [%r23 + %r0]
cpu_intr_3_192:
	setx	0x2d032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2dc000  ! 2193: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xfe2d0000  ! 2194: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xf82cc000  ! 2195: STB_R	stb	%r28, [%r19 + %r0]
cpu_intr_3_193:
	setx	0x2d0123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_194:
	setx	0x2e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfe354000  ! 2203: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xfc74e1f6  ! 2205: STX_I	stx	%r30, [%r19 + 0x01f6]
cpu_intr_3_195:
	setx	0x2f001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_196:
	setx	0x2d0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb8946172  ! 2213: ORcc_I	orcc 	%r17, 0x0172, %r28
	.word 0xf4a4a12f  ! 2215: STWA_I	stwa	%r26, [%r18 + 0x012f] %asi
	.word 0xf8a5c020  ! 2222: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfa35c000  ! 2226: STH_R	sth	%r29, [%r23 + %r0]
cpu_intr_3_197:
	setx	0x2d0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_198:
	setx	0x2e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_101:
	mov	0x2d, %r14
	.word 0xf8f384a0  ! 2247: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 7)
	.word 0xf6b4a046  ! 2250: STHA_I	stha	%r27, [%r18 + 0x0046] %asi
T3_asi_reg_wr_102:
	mov	0x3c2, %r14
	.word 0xf2f38e60  ! 2253: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_wr_103:
	mov	0x16, %r14
	.word 0xf6f389e0  ! 2254: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_rd_99:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 2255: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfcf4204a  ! 2256: STXA_I	stxa	%r30, [%r16 + 0x004a] %asi
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_199:
	setx	0x2e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_200:
	setx	0x2d0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17d8400  ! 2265: MOVR_R	movre	%r22, %r0, %r24
	.word 0xf67521fc  ! 2267: STX_I	stx	%r27, [%r20 + 0x01fc]
	.word 0xf62da0f1  ! 2268: STB_I	stb	%r27, [%r22 + 0x00f1]
T3_asi_reg_wr_104:
	mov	0x2d, %r14
	.word 0xfcf38400  ! 2269: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbe1c60e7  ! 2271: XOR_I	xor 	%r17, 0x00e7, %r31
	.word 0xf2f52024  ! 2273: STXA_I	stxa	%r25, [%r20 + 0x0024] %asi
	.word 0xf62c8000  ! 2274: STB_R	stb	%r27, [%r18 + %r0]
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 34)
	.word 0xb2140000  ! 2278: OR_R	or 	%r16, %r0, %r25
	.word 0xf024e15d  ! 2280: STW_I	stw	%r24, [%r19 + 0x015d]
T3_asi_reg_rd_100:
	mov	0x23, %r14
	.word 0xf0db89e0  ! 2283: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf4754000  ! 2290: STX_R	stx	%r26, [%r21 + %r0]
T3_asi_reg_rd_101:
	mov	0x15, %r14
	.word 0xfadb8400  ! 2292: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_201:
	setx	0x2f000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 9)
	.word 0xf0356138  ! 2310: STH_I	sth	%r24, [%r21 + 0x0138]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_wr_105:
	mov	0x2e, %r14
	.word 0xf8f389e0  ! 2316: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_102:
	mov	0x31, %r14
	.word 0xfadb8e40  ! 2319: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf02da0e0  ! 2320: STB_I	stb	%r24, [%r22 + 0x00e0]
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_202:
	setx	0x330335, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 3a)
	.word 0xbe2da05a  ! 2331: ANDN_I	andn 	%r22, 0x005a, %r31
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983912  ! 2333: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1912, %hpstate
	.word 0xf0b4e1f6  ! 2334: STHA_I	stha	%r24, [%r19 + 0x01f6] %asi
	.word 0xb0940000  ! 2335: ORcc_R	orcc 	%r16, %r0, %r24
T3_asi_reg_wr_106:
	mov	0x25, %r14
	.word 0xf0f38e80  ! 2336: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_203:
	setx	0x320121, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xb6356159  ! 2342: SUBC_I	orn 	%r21, 0x0159, %r27
	.word 0xf874e0e6  ! 2345: STX_I	stx	%r28, [%r19 + 0x00e6]
cpu_intr_3_204:
	setx	0x310112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2356183  ! 2349: STH_I	sth	%r25, [%r21 + 0x0183]
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 26)
	.word 0xf8aca09b  ! 2360: STBA_I	stba	%r28, [%r18 + 0x009b] %asi
	ta	T_CHANGE_HPRIV
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 31)
	.word 0xf2b4201c  ! 2372: STHA_I	stha	%r25, [%r16 + 0x001c] %asi
	.word 0xfe748000  ! 2374: STX_R	stx	%r31, [%r18 + %r0]
T3_asi_reg_rd_103:
	mov	0x10, %r14
	.word 0xfedb89e0  ! 2376: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfcad0020  ! 2379: STBA_R	stba	%r30, [%r20 + %r0] 0x01
T3_asi_reg_wr_107:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 2380: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_104:
	mov	0x3c2, %r14
	.word 0xfcdb89e0  ! 2381: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfa25a13a  ! 2382: STW_I	stw	%r29, [%r22 + 0x013a]
T3_asi_reg_rd_105:
	mov	0x26, %r14
	.word 0xf4db84a0  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_rd_106:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 2388: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 33)
	.word 0xf63420fd  ! 2392: STH_I	sth	%r27, [%r16 + 0x00fd]
	.word 0xf2ad21f3  ! 2393: STBA_I	stba	%r25, [%r20 + 0x01f3] %asi
	.word 0xf0f4e1fe  ! 2397: STXA_I	stxa	%r24, [%r19 + 0x01fe] %asi
	.word 0xf2a520d2  ! 2403: STWA_I	stwa	%r25, [%r20 + 0x00d2] %asi
T3_asi_reg_rd_107:
	mov	0x33, %r14
	.word 0xf0db89e0  ! 2406: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_205:
	setx	0x330333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfa758000  ! 2414: STX_R	stx	%r29, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_108:
	mov	0x6, %r14
	.word 0xf0db8e60  ! 2417: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_206:
	setx	0x320206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6350000  ! 2427: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xf6a56191  ! 2428: STWA_I	stwa	%r27, [%r21 + 0x0191] %asi
T3_asi_reg_rd_109:
	mov	0x3c6, %r14
	.word 0xf8db89e0  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf8b5a019  ! 2431: STHA_I	stha	%r28, [%r22 + 0x0019] %asi
	.word 0xf8f520db  ! 2432: STXA_I	stxa	%r28, [%r20 + 0x00db] %asi
T3_asi_reg_rd_110:
	mov	0x11, %r14
	.word 0xfadb84a0  ! 2433: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf8f4e08a  ! 2440: STXA_I	stxa	%r28, [%r19 + 0x008a] %asi
	.word 0xf8a4a01d  ! 2441: STWA_I	stwa	%r28, [%r18 + 0x001d] %asi
T3_asi_reg_rd_111:
	mov	0xc, %r14
	.word 0xf4db8e40  ! 2442: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_108:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 2444: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_wr_109:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 2452: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf0744000  ! 2454: STX_R	stx	%r24, [%r17 + %r0]
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf4758000  ! 2460: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xfe340000  ! 2461: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xf2348000  ! 2466: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xf2f52137  ! 2468: STXA_I	stxa	%r25, [%r20 + 0x0137] %asi
T3_asi_reg_rd_112:
	mov	0x30, %r14
	.word 0xf2db8e40  ! 2471: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfeb44020  ! 2472: STHA_R	stha	%r31, [%r17 + %r0] 0x01
	.word 0xfcf52128  ! 2473: STXA_I	stxa	%r30, [%r20 + 0x0128] %asi
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_wr_110:
	mov	0x10, %r14
	.word 0xfaf384a0  ! 2481: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb2c5e051  ! 2485: ADDCcc_I	addccc 	%r23, 0x0051, %r25
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 10)
	.word 0xf2254000  ! 2490: STW_R	stw	%r25, [%r21 + %r0]
cpu_intr_3_207:
	setx	0x300039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_rd_113:
	mov	0x10, %r14
	.word 0xf6db8e40  ! 2497: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf6b4a0ed  ! 2498: STHA_I	stha	%r27, [%r18 + 0x00ed] %asi
	.word 0xfe754000  ! 2499: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xf6ad0020  ! 2502: STBA_R	stba	%r27, [%r20 + %r0] 0x01
	.word 0xfe75a096  ! 2507: STX_I	stx	%r31, [%r22 + 0x0096]
cpu_intr_3_208:
	setx	0x320328, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_209:
	setx	0x30013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_210:
	setx	0x30033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_111:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 2518: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_3_211:
	setx	0x31023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf6b5e06e  ! 2525: STHA_I	stha	%r27, [%r23 + 0x006e] %asi
T3_asi_reg_wr_112:
	mov	0x9, %r14
	.word 0xfaf38400  ! 2527: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_3_212:
	setx	0x33013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4a0a0  ! 2533: STHA_I	stha	%r25, [%r18 + 0x00a0] %asi
	.word 0xf6b46100  ! 2536: STHA_I	stha	%r27, [%r17 + 0x0100] %asi
T3_asi_reg_rd_114:
	mov	0x3c5, %r14
	.word 0xfcdb8e80  ! 2537: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 3c)
	ta	T_CHANGE_NONHPRIV
	.word 0xf4f461b3  ! 2542: STXA_I	stxa	%r26, [%r17 + 0x01b3] %asi
T3_asi_reg_wr_113:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 2543: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0x8d94a169  ! 2547: WRPR_PSTATE_I	wrpr	%r18, 0x0169, %pstate
cpu_intr_3_213:
	setx	0x330220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_214:
	setx	0x300105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_215:
	setx	0x310002, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfa354000  ! 2556: STH_R	sth	%r29, [%r21 + %r0]
cpu_intr_3_216:
	setx	0x320000, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_115:
	mov	0x3c2, %r14
	.word 0xfadb8e60  ! 2560: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfa34a11b  ! 2562: STH_I	sth	%r29, [%r18 + 0x011b]
cpu_intr_3_217:
	setx	0x310223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d60d9  ! 2564: STB_I	stb	%r27, [%r21 + 0x00d9]
T3_asi_reg_rd_116:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 2570: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_218:
	setx	0x300323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 30)
	.word 0xfa24c000  ! 2576: STW_R	stw	%r29, [%r19 + %r0]
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_rd_117:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf2746158  ! 2580: STX_I	stx	%r25, [%r17 + 0x0158]
	.word 0xfcb42034  ! 2582: STHA_I	stha	%r30, [%r16 + 0x0034] %asi
T3_asi_reg_wr_114:
	mov	0xc, %r14
	.word 0xfaf38e80  ! 2585: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_219:
	setx	0x310115, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_115:
	mov	0x28, %r14
	.word 0xf4f38e40  ! 2589: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb62ce1c9  ! 2591: ANDN_I	andn 	%r19, 0x01c9, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xf62d8000  ! 2594: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xf8b4202c  ! 2595: STHA_I	stha	%r28, [%r16 + 0x002c] %asi
	.word 0xfa744000  ! 2596: STX_R	stx	%r29, [%r17 + %r0]
T3_asi_reg_rd_118:
	mov	0xb, %r14
	.word 0xf4db8400  ! 2599: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_3_220:
	setx	0x31021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_119:
	mov	0x37, %r14
	.word 0xfadb8e60  ! 2602: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_3_221:
	setx	0x310123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfeac0020  ! 2608: STBA_R	stba	%r31, [%r16 + %r0] 0x01
	.word 0xb82c0000  ! 2609: ANDN_R	andn 	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_120:
	mov	0x4, %r14
	.word 0xf8db8e60  ! 2611: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c50  ! 2612: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c50, %hpstate
	.word 0xb245c000  ! 2613: ADDC_R	addc 	%r23, %r0, %r25
cpu_intr_3_222:
	setx	0x300236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe754000  ! 2617: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xfa754000  ! 2620: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xf02d8000  ! 2621: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xb4b48000  ! 2623: SUBCcc_R	orncc 	%r18, %r0, %r26
cpu_intr_3_223:
	setx	0x320215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d0000  ! 2629: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xfe34209c  ! 2637: STH_I	sth	%r31, [%r16 + 0x009c]
	.word 0xf4f4e000  ! 2640: STXA_I	stxa	%r26, [%r19 + 0x0000] %asi
T3_asi_reg_rd_121:
	mov	0x26, %r14
	.word 0xfedb89e0  ! 2641: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_rd_122:
	mov	0x28, %r14
	.word 0xfedb8e40  ! 2642: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, b)
	.word 0xb80560d2  ! 2644: ADD_I	add 	%r21, 0x00d2, %r28
cpu_intr_3_224:
	setx	0x31001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_123:
	mov	0x4, %r14
	.word 0xfadb8e80  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_124:
	mov	0x10, %r14
	.word 0xf6db8e40  ! 2657: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc250000  ! 2658: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf224e176  ! 2661: STW_I	stw	%r25, [%r19 + 0x0176]
	.word 0xf4748000  ! 2663: STX_R	stx	%r26, [%r18 + %r0]
T3_asi_reg_rd_125:
	mov	0x5, %r14
	.word 0xfadb89e0  ! 2665: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf0f4603d  ! 2666: STXA_I	stxa	%r24, [%r17 + 0x003d] %asi
	ta	T_CHANGE_TO_TL0
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 33)
	.word 0xbd7d4400  ! 2671: MOVR_R	movre	%r21, %r0, %r30
T3_asi_reg_rd_126:
	mov	0x29, %r14
	.word 0xfcdb8400  ! 2673: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfa754000  ! 2674: STX_R	stx	%r29, [%r21 + %r0]
T3_asi_reg_wr_116:
	mov	0x36, %r14
	.word 0xf6f38e60  ! 2679: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_wr_117:
	mov	0x16, %r14
	.word 0xf2f38400  ! 2685: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_225:
	setx	0x300115, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_127:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 2689: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 27)
	.word 0xf2246067  ! 2693: STW_I	stw	%r25, [%r17 + 0x0067]
T3_asi_reg_rd_128:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 2698: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e80  ! 2700: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e80, %hpstate
	.word 0xba3da025  ! 2702: XNOR_I	xnor 	%r22, 0x0025, %r29
	.word 0xf2a50020  ! 2706: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
cpu_intr_3_226:
	setx	0x300210, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_129:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 2712: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_wr_118:
	mov	0x1c, %r14
	.word 0xf8f38e40  ! 2715: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd2c3001  ! 2718: SLLX_I	sllx	%r16, 0x0001, %r30
	.word 0xb684a115  ! 2722: ADDcc_I	addcc 	%r18, 0x0115, %r27
	.word 0xf0b50020  ! 2723: STHA_R	stha	%r24, [%r20 + %r0] 0x01
	.word 0xf6b44020  ! 2728: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, a)
	.word 0xb2958000  ! 2735: ORcc_R	orcc 	%r22, %r0, %r25
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_227:
	setx	0x320036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_228:
	setx	0x320202, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_130:
	mov	0x16, %r14
	.word 0xf6db8e40  ! 2742: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfa25e0cf  ! 2744: STW_I	stw	%r29, [%r23 + 0x00cf]
cpu_intr_3_229:
	setx	0x36000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa348000  ! 2746: STH_R	sth	%r29, [%r18 + %r0]
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 3)
	.word 0xfe74a003  ! 2752: STX_I	stx	%r31, [%r18 + 0x0003]
T3_asi_reg_rd_131:
	mov	0x3c5, %r14
	.word 0xf4db8e80  ! 2753: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_119:
	mov	0x7, %r14
	.word 0xf8f38e80  ! 2754: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	ta	T_CHANGE_NONHPRIV
	.word 0xb445a025  ! 2759: ADDC_I	addc 	%r22, 0x0025, %r26
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 19)
	.word 0xf6f5e11a  ! 2762: STXA_I	stxa	%r27, [%r23 + 0x011a] %asi
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_132:
	mov	0x2b, %r14
	.word 0xfcdb8e80  ! 2764: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf42c6033  ! 2765: STB_I	stb	%r26, [%r17 + 0x0033]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_230:
	setx	0x36032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b5c000  ! 2770: SUBCcc_R	orncc 	%r23, %r0, %r27
	.word 0xf42d0000  ! 2771: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xf4b4a1d9  ! 2773: STHA_I	stha	%r26, [%r18 + 0x01d9] %asi
cpu_intr_3_231:
	setx	0x350330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_232:
	setx	0x340306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024e0bf  ! 2776: STW_I	stw	%r24, [%r19 + 0x00bf]
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf234a091  ! 2779: STH_I	sth	%r25, [%r18 + 0x0091]
	.word 0xb205e14f  ! 2783: ADD_I	add 	%r23, 0x014f, %r25
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
	.word 0xf6a4e156  ! 2787: STWA_I	stwa	%r27, [%r19 + 0x0156] %asi
	.word 0xfe74c000  ! 2796: STX_R	stx	%r31, [%r19 + %r0]
T3_asi_reg_wr_120:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 2797: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_233:
	setx	0x350114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 32)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0ad6004  ! 2810: STBA_I	stba	%r24, [%r21 + 0x0004] %asi
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 2f)
	.word 0xbe146119  ! 2813: OR_I	or 	%r17, 0x0119, %r31
cpu_intr_3_234:
	setx	0x350304, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_121:
	mov	0x10, %r14
	.word 0xfcf38e40  ! 2815: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfaacc020  ! 2816: STBA_R	stba	%r29, [%r19 + %r0] 0x01
cpu_intr_3_235:
	setx	0x34023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe74202f  ! 2819: STX_I	stx	%r31, [%r16 + 0x002f]
T3_asi_reg_wr_122:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 2821: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_rd_133:
	mov	0x3c5, %r14
	.word 0xfadb8e60  ! 2826: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_rd_134:
	mov	0x35, %r14
	.word 0xf6db8e40  ! 2828: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf0ac0020  ! 2829: STBA_R	stba	%r24, [%r16 + %r0] 0x01
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 10)
	.word 0xfc2ca04e  ! 2833: STB_I	stb	%r30, [%r18 + 0x004e]
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 29)
	.word 0xf8a4617b  ! 2836: STWA_I	stwa	%r28, [%r17 + 0x017b] %asi
	.word 0xb81461d9  ! 2840: OR_I	or 	%r17, 0x01d9, %r28
	.word 0xb3641800  ! 2841: MOVcc_R	<illegal instruction>
	.word 0xba8d0000  ! 2843: ANDcc_R	andcc 	%r20, %r0, %r29
	.word 0xbe1d4000  ! 2845: XOR_R	xor 	%r21, %r0, %r31
	.word 0xf82d6061  ! 2847: STB_I	stb	%r28, [%r21 + 0x0061]
	.word 0xb7510000  ! 2852: RDPR_TICK	rdpr	%tick, %r27
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_236:
	setx	0x37011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b54020  ! 2859: STHA_R	stha	%r27, [%r21 + %r0] 0x01
	.word 0xfaad8020  ! 2860: STBA_R	stba	%r29, [%r22 + %r0] 0x01
	.word 0xf62d60a4  ! 2865: STB_I	stb	%r27, [%r21 + 0x00a4]
	.word 0xf4244000  ! 2870: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xfa2c20be  ! 2872: STB_I	stb	%r29, [%r16 + 0x00be]
cpu_intr_3_237:
	setx	0x340222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a4e19e  ! 2878: STWA_I	stwa	%r25, [%r19 + 0x019e] %asi
cpu_intr_3_238:
	setx	0x370226, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc15e1ee  ! 2885: OR_I	or 	%r23, 0x01ee, %r30
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfaada018  ! 2892: STBA_I	stba	%r29, [%r22 + 0x0018] %asi
cpu_intr_3_239:
	setx	0x35023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0d0000  ! 2895: AND_R	and 	%r20, %r0, %r29
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe35a0c4  ! 2899: STH_I	sth	%r31, [%r22 + 0x00c4]
cpu_intr_3_240:
	setx	0x360136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 6)
	.word 0xbd3c6001  ! 2907: SRA_I	sra 	%r17, 0x0001, %r30
cpu_intr_3_241:
	setx	0x350112, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a4a  ! 2912: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4a, %hpstate
	.word 0xf0a5c020  ! 2915: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
	.word 0xb015c000  ! 2918: OR_R	or 	%r23, %r0, %r24
	.word 0xf275a1da  ! 2919: STX_I	stx	%r25, [%r22 + 0x01da]
	.word 0xf2b4a1a5  ! 2920: STHA_I	stha	%r25, [%r18 + 0x01a5] %asi
	.word 0xb4950000  ! 2922: ORcc_R	orcc 	%r20, %r0, %r26
	.word 0xf2350000  ! 2925: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xb614a15a  ! 2926: OR_I	or 	%r18, 0x015a, %r27
	.word 0xf2a48020  ! 2928: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_wr_123:
	mov	0x26, %r14
	.word 0xf0f38400  ! 2932: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf2348000  ! 2936: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xfef5a18d  ! 2939: STXA_I	stxa	%r31, [%r22 + 0x018d] %asi
	.word 0xf2754000  ! 2940: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xb82c8000  ! 2941: ANDN_R	andn 	%r18, %r0, %r28
	.word 0xf874a0aa  ! 2944: STX_I	stx	%r28, [%r18 + 0x00aa]
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983cd0  ! 2945: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd0, %hpstate
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 15)
	.word 0xf4254000  ! 2948: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf234213e  ! 2949: STH_I	sth	%r25, [%r16 + 0x013e]
T3_asi_reg_rd_135:
	mov	0x26, %r14
	.word 0xf4db8e40  ! 2950: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf8ace025  ! 2954: STBA_I	stba	%r28, [%r19 + 0x0025] %asi
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, c)
	.word 0xf2346102  ! 2959: STH_I	sth	%r25, [%r17 + 0x0102]
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_242:
	setx	0x34010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d9a  ! 2968: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9a, %hpstate
cpu_intr_3_243:
	setx	0x35013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfe24a026  ! 2977: STW_I	stw	%r31, [%r18 + 0x0026]
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 23)
	.word 0xf2ac20c3  ! 2979: STBA_I	stba	%r25, [%r16 + 0x00c3] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xfc348000  ! 2981: STH_R	sth	%r30, [%r18 + %r0]
T3_asi_reg_wr_124:
	mov	0x20, %r14
	.word 0xf4f38e40  ! 2983: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_125:
	mov	0x1d, %r14
	.word 0xf8f38e60  ! 2984: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_244:
	setx	0x340338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_wr_126:
	mov	0x14, %r14
	.word 0xfef38e40  ! 2990: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_245:
	setx	0x35010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0adc020  ! 2993: STBA_R	stba	%r24, [%r23 + %r0] 0x01
cpu_intr_3_246:
	setx	0x370024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_247:
	setx	0x37012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_248:
	setx	0x34001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf075c000  ! 3000: STX_R	stx	%r24, [%r23 + %r0]
T3_asi_reg_rd_136:
	mov	0x12, %r14
	.word 0xf8db8e40  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, d)
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 9)
	.word 0xf22d4000  ! 3004: STB_R	stb	%r25, [%r21 + %r0]
cpu_intr_3_249:
	setx	0x36022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_250:
	setx	0x34003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53d0000  ! 3007: SRA_R	sra 	%r20, %r0, %r26
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf4b46077  ! 3009: STHA_I	stha	%r26, [%r17 + 0x0077] %asi
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_251:
	setx	0x34033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba34a064  ! 3017: ORN_I	orn 	%r18, 0x0064, %r29
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 12)
	.word 0xfc7421de  ! 3020: STX_I	stx	%r30, [%r16 + 0x01de]
	.word 0xbb34d000  ! 3021: SRLX_R	srlx	%r19, %r0, %r29
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_127:
	mov	0x28, %r14
	.word 0xf6f38e40  ! 3026: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_252:
	setx	0x360110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb52127  ! 3028: STHA_I	stha	%r31, [%r20 + 0x0127] %asi
	.word 0xf42d0000  ! 3029: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xfe742161  ! 3032: STX_I	stx	%r31, [%r16 + 0x0161]
T3_asi_reg_wr_128:
	mov	0x23, %r14
	.word 0xfef38400  ! 3040: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_rd_137:
	mov	0x3c2, %r14
	.word 0xf0db8e80  ! 3041: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_wr_129:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 3042: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_138:
	mov	0x34, %r14
	.word 0xfedb8e60  ! 3043: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb6242105  ! 3046: SUB_I	sub 	%r16, 0x0105, %r27
	.word 0xf275e088  ! 3049: STX_I	stx	%r25, [%r23 + 0x0088]
T3_asi_reg_rd_139:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 3052: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_253:
	setx	0x34012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfc74a054  ! 3056: STX_I	stx	%r30, [%r18 + 0x0054]
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 10)
	.word 0xf2b52001  ! 3060: STHA_I	stha	%r25, [%r20 + 0x0001] %asi
	.word 0xb00de12b  ! 3063: AND_I	and 	%r23, 0x012b, %r24
	.word 0xb23d0000  ! 3067: XNOR_R	xnor 	%r20, %r0, %r25
cpu_intr_3_254:
	setx	0x350007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34c000  ! 3070: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xfa248000  ! 3071: STW_R	stw	%r29, [%r18 + %r0]
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf825209a  ! 3076: STW_I	stw	%r28, [%r20 + 0x009a]
	ta	T_CHANGE_HPRIV
	.word 0xfa348000  ! 3079: STH_R	sth	%r29, [%r18 + %r0]
T3_asi_reg_rd_140:
	mov	0x16, %r14
	.word 0xfcdb8e60  ! 3082: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 13)
	.word 0xf0b4c020  ! 3084: STHA_R	stha	%r24, [%r19 + %r0] 0x01
cpu_intr_3_255:
	setx	0x340109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea44020  ! 3087: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 34)
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c98  ! 3093: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c98, %hpstate
	.word 0xf6a5c020  ! 3094: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
T3_asi_reg_wr_130:
	mov	0x3c5, %r14
	.word 0xfaf38e80  ! 3095: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf0342110  ! 3098: STH_I	sth	%r24, [%r16 + 0x0110]
T3_asi_reg_rd_141:
	mov	0x32, %r14
	.word 0xf4db8400  ! 3104: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_256:
	setx	0x340103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf234e022  ! 3108: STH_I	sth	%r25, [%r19 + 0x0022]
cpu_intr_3_257:
	setx	0x370234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d207c  ! 3110: STB_I	stb	%r31, [%r20 + 0x007c]
T3_asi_reg_wr_131:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 3112: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfaad8020  ! 3113: STBA_R	stba	%r29, [%r22 + %r0] 0x01
cpu_intr_3_258:
	setx	0x340007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_259:
	setx	0x34032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_260:
	setx	0x35013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_261:
	setx	0x350208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad2147  ! 3121: STBA_I	stba	%r24, [%r20 + 0x0147] %asi
cpu_intr_3_262:
	setx	0x34002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d8000  ! 3130: STB_R	stb	%r27, [%r22 + %r0]
T3_asi_reg_rd_142:
	mov	0x16, %r14
	.word 0xfadb89e0  ! 3131: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfe74a09d  ! 3132: STX_I	stx	%r31, [%r18 + 0x009d]
cpu_intr_3_263:
	setx	0x370021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_264:
	setx	0x370000, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_143:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 3137: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf024c000  ! 3138: STW_R	stw	%r24, [%r19 + %r0]
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, b)
	.word 0xf42c0000  ! 3145: STB_R	stb	%r26, [%r16 + %r0]
cpu_intr_3_265:
	setx	0x360225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea5c020  ! 3149: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf0a4600f  ! 3153: STWA_I	stwa	%r24, [%r17 + 0x000f] %asi
T3_asi_reg_wr_132:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 3154: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf224a08f  ! 3158: STW_I	stw	%r25, [%r18 + 0x008f]
cpu_intr_3_266:
	setx	0x37030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_144:
	mov	0x26, %r14
	.word 0xf8db8e60  ! 3162: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 23)
	.word 0xf62c4000  ! 3165: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf8742042  ! 3168: STX_I	stx	%r28, [%r16 + 0x0042]
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 19)
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xf4356025  ! 3176: STH_I	sth	%r26, [%r21 + 0x0025]
cpu_intr_3_267:
	setx	0x350004, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_133:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 3181: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf0b461be  ! 3182: STHA_I	stha	%r24, [%r17 + 0x01be] %asi
	.word 0xf6ad0020  ! 3183: STBA_R	stba	%r27, [%r20 + %r0] 0x01
T3_asi_reg_wr_134:
	mov	0x27, %r14
	.word 0xf4f384a0  ! 3187: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfcf561b8  ! 3188: STXA_I	stxa	%r30, [%r21 + 0x01b8] %asi
cpu_intr_3_268:
	setx	0x350334, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb68d61a6  ! 3191: ANDcc_I	andcc 	%r21, 0x01a6, %r27
cpu_intr_3_269:
	setx	0x350219, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_135:
	mov	0x26, %r14
	.word 0xfcf38e40  ! 3194: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_270:
	setx	0x37022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2cc000  ! 3198: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xf42c0000  ! 3199: STB_R	stb	%r26, [%r16 + %r0]
cpu_intr_3_271:
	setx	0x340320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12df001  ! 3204: SLLX_I	sllx	%r23, 0x0001, %r24
T3_asi_reg_rd_145:
	mov	0x30, %r14
	.word 0xf6db8400  ! 3205: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfcad0020  ! 3206: STBA_R	stba	%r30, [%r20 + %r0] 0x01
cpu_intr_3_272:
	setx	0x3a011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63d8000  ! 3212: XNOR_R	xnor 	%r22, %r0, %r27
cpu_intr_3_273:
	setx	0x38013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_274:
	setx	0x38011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf83521a7  ! 3225: STH_I	sth	%r28, [%r20 + 0x01a7]
cpu_intr_3_275:
	setx	0x3a0306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_276:
	setx	0x3a0011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_277:
	setx	0x3a003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42c0000  ! 3230: STB_R	stb	%r26, [%r16 + %r0]
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 8)
	ta	T_CHANGE_HPRIV
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 13)
	.word 0xf8b5612c  ! 3235: STHA_I	stha	%r28, [%r21 + 0x012c] %asi
	.word 0xf4744000  ! 3236: STX_R	stx	%r26, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b54020  ! 3239: STHA_R	stha	%r28, [%r21 + %r0] 0x01
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982942  ! 3240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0942, %hpstate
	.word 0xfa75e1c2  ! 3243: STX_I	stx	%r29, [%r23 + 0x01c2]
	.word 0xf0756046  ! 3244: STX_I	stx	%r24, [%r21 + 0x0046]
	ta	T_CHANGE_HPRIV
	.word 0xf634c000  ! 3246: STH_R	sth	%r27, [%r19 + %r0]
T3_asi_reg_rd_146:
	mov	0x23, %r14
	.word 0xfadb8400  ! 3251: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 27)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 3f)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_278:
	setx	0x380127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_279:
	setx	0x380303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb735d000  ! 3261: SRLX_R	srlx	%r23, %r0, %r27
T3_asi_reg_wr_136:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 3263: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 5)
	.word 0xb005e0c4  ! 3267: ADD_I	add 	%r23, 0x00c4, %r24
	.word 0xfea46000  ! 3268: STWA_I	stwa	%r31, [%r17 + 0x0000] %asi
T3_asi_reg_wr_137:
	mov	0xa, %r14
	.word 0xf4f38e60  ! 3269: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_280:
	setx	0x3b0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8da16f  ! 3274: ANDcc_I	andcc 	%r22, 0x016f, %r30
cpu_intr_3_281:
	setx	0x3b0130, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_147:
	mov	0x30, %r14
	.word 0xf6db8e60  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_wr_138:
	mov	0x1f, %r14
	.word 0xfcf38e60  ! 3280: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_rd_148:
	mov	0x2, %r14
	.word 0xf8db89e0  ! 3281: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_rd_149:
	mov	0x17, %r14
	.word 0xf0db8400  ! 3286: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_wr_139:
	mov	0x1f, %r14
	.word 0xfaf38e60  ! 3287: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf0a4e1c3  ! 3288: STWA_I	stwa	%r24, [%r19 + 0x01c3] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_140:
	mov	0x27, %r14
	.word 0xfcf38e80  ! 3294: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_rd_150:
	mov	0x3c7, %r14
	.word 0xfcdb8e80  ! 3295: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983f58  ! 3297: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f58, %hpstate
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 23)
	.word 0xf4ac4020  ! 3300: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xf4254000  ! 3301: STW_R	stw	%r26, [%r21 + %r0]
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_151:
	mov	0xd, %r14
	.word 0xfcdb8400  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfa2ca0c5  ! 3313: STB_I	stb	%r29, [%r18 + 0x00c5]
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf22d0000  ! 3319: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xf035a0fc  ! 3320: STH_I	sth	%r24, [%r22 + 0x00fc]
	.word 0xb5347001  ! 3321: SRLX_I	srlx	%r17, 0x0001, %r26
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 26)
	.word 0xfc758000  ! 3324: STX_R	stx	%r30, [%r22 + %r0]
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9500000  ! 3327: RDPR_TPC	rdpr	%tpc, %r28
cpu_intr_3_282:
	setx	0x390008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_283:
	setx	0x3b0322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_284:
	setx	0x3b021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_285:
	setx	0x3a0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0346037  ! 3339: STH_I	sth	%r24, [%r17 + 0x0037]
T3_asi_reg_wr_141:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 3340: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb89c61bb  ! 3344: XORcc_I	xorcc 	%r17, 0x01bb, %r28
	.word 0xf8b460e7  ! 3345: STHA_I	stha	%r28, [%r17 + 0x00e7] %asi
	.word 0xf835c000  ! 3346: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xf4a40020  ! 3347: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
	.word 0xf02c0000  ! 3349: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xf025616e  ! 3351: STW_I	stw	%r24, [%r21 + 0x016e]
cpu_intr_3_286:
	setx	0x3b0333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_287:
	setx	0x3a0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b460dd  ! 3357: STHA_I	stha	%r26, [%r17 + 0x00dd] %asi
	.word 0xbe158000  ! 3358: OR_R	or 	%r22, %r0, %r31
	.word 0xb73d3001  ! 3360: SRAX_I	srax	%r20, 0x0001, %r27
	.word 0xf6b52120  ! 3366: STHA_I	stha	%r27, [%r20 + 0x0120] %asi
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f50  ! 3368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f50, %hpstate
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b00  ! 3369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b00, %hpstate
T3_asi_reg_wr_142:
	mov	0x1e, %r14
	.word 0xfef38e40  ! 3372: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfa2c8000  ! 3379: STB_R	stb	%r29, [%r18 + %r0]
T3_asi_reg_rd_152:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 3380: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_288:
	setx	0x3b022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_143:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 3386: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbac48000  ! 3389: ADDCcc_R	addccc 	%r18, %r0, %r29
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_wr_144:
	mov	0x0, %r14
	.word 0xf4f389e0  ! 3393: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_3_289:
	setx	0x38023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0748000  ! 3397: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xfe2c8000  ! 3398: STB_R	stb	%r31, [%r18 + %r0]
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_290:
	setx	0x38020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf025e06f  ! 3402: STW_I	stw	%r24, [%r23 + 0x006f]
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f9a  ! 3404: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9a, %hpstate
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfea54020  ! 3407: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
	.word 0xfeb50020  ! 3408: STHA_R	stha	%r31, [%r20 + %r0] 0x01
cpu_intr_3_291:
	setx	0x3b0032, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_153:
	mov	0x3c6, %r14
	.word 0xfedb8400  ! 3415: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_292:
	setx	0x38012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_293:
	setx	0x380311, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf835a04a  ! 3427: STH_I	sth	%r28, [%r22 + 0x004a]
	.word 0xb49d0000  ! 3428: XORcc_R	xorcc 	%r20, %r0, %r26
	.word 0xb8bc4000  ! 3430: XNORcc_R	xnorcc 	%r17, %r0, %r28
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_145:
	mov	0x2a, %r14
	.word 0xfef38e60  ! 3435: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfaad20eb  ! 3436: STBA_I	stba	%r29, [%r20 + 0x00eb] %asi
cpu_intr_3_294:
	setx	0x3a022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb035a051  ! 3439: SUBC_I	orn 	%r22, 0x0051, %r24
	.word 0xf6a5e131  ! 3442: STWA_I	stwa	%r27, [%r23 + 0x0131] %asi
T3_asi_reg_wr_146:
	mov	0x3, %r14
	.word 0xf0f38e40  ! 3443: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf8ad619a  ! 3445: STBA_I	stba	%r28, [%r21 + 0x019a] %asi
	.word 0xf4344000  ! 3446: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xbd3dd000  ! 3447: SRAX_R	srax	%r23, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 8)
	.word 0xb025c000  ! 3452: SUB_R	sub 	%r23, %r0, %r24
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_147:
	mov	0x20, %r14
	.word 0xfaf38e60  ! 3456: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_3_295:
	setx	0x3b0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2744000  ! 3459: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xf2a50020  ! 3460: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
T3_asi_reg_wr_148:
	mov	0x3c4, %r14
	.word 0xf8f38400  ! 3461: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_296:
	setx	0x3b0331, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_149:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 3465: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_297:
	setx	0x38000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b58020  ! 3467: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	.word 0x8994e1c7  ! 3469: WRPR_TICK_I	wrpr	%r19, 0x01c7, %tick
T3_asi_reg_rd_154:
	mov	0xc, %r14
	.word 0xfcdb8400  ! 3470: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_wr_150:
	mov	0x2, %r14
	.word 0xfcf38e80  ! 3472: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf8254000  ! 3475: STW_R	stw	%r28, [%r21 + %r0]
T3_asi_reg_wr_151:
	mov	0x3c8, %r14
	.word 0xfaf384a0  ! 3480: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb2c54000  ! 3483: ADDCcc_R	addccc 	%r21, %r0, %r25
	.word 0xf075c000  ! 3484: STX_R	stx	%r24, [%r23 + %r0]
cpu_intr_3_298:
	setx	0x3a0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_152:
	mov	0x34, %r14
	.word 0xf4f384a0  ! 3488: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfca521b4  ! 3491: STWA_I	stwa	%r30, [%r20 + 0x01b4] %asi
	.word 0xfa25a062  ! 3494: STW_I	stw	%r29, [%r22 + 0x0062]
	.word 0xfc25c000  ! 3495: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xf035e05c  ! 3496: STH_I	sth	%r24, [%r23 + 0x005c]
	.word 0xf4748000  ! 3498: STX_R	stx	%r26, [%r18 + %r0]
T3_asi_reg_rd_155:
	mov	0xe, %r14
	.word 0xf2db8e80  ! 3502: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_wr_153:
	mov	0x3c3, %r14
	.word 0xfcf38e60  ! 3505: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf4350000  ! 3507: STH_R	sth	%r26, [%r20 + %r0]
T3_asi_reg_rd_156:
	mov	0xd, %r14
	.word 0xf0db8e40  ! 3509: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf6b54020  ! 3510: STHA_R	stha	%r27, [%r21 + %r0] 0x01
cpu_intr_3_299:
	setx	0x3b0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf27520c1  ! 3515: STX_I	stx	%r25, [%r20 + 0x00c1]
	.word 0x8795212c  ! 3518: WRPR_TT_I	wrpr	%r20, 0x012c, %tt
T3_asi_reg_wr_154:
	mov	0x16, %r14
	.word 0xf4f384a0  ! 3519: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb444c000  ! 3520: ADDC_R	addc 	%r19, %r0, %r26
cpu_intr_3_300:
	setx	0x3b011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_301:
	setx	0x3b0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 38)
	.word 0xfaacc020  ! 3532: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xbe440000  ! 3533: ADDC_R	addc 	%r16, %r0, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xb00461c3  ! 3536: ADD_I	add 	%r17, 0x01c3, %r24
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 23)
	.word 0xf2f5e070  ! 3541: STXA_I	stxa	%r25, [%r23 + 0x0070] %asi
	.word 0xfa2da1e3  ! 3542: STB_I	stb	%r29, [%r22 + 0x01e3]
T3_asi_reg_wr_155:
	mov	0x8, %r14
	.word 0xf8f384a0  ! 3543: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf8240000  ! 3545: STW_R	stw	%r28, [%r16 + %r0]
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_156:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 3549: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf23461ba  ! 3550: STH_I	sth	%r25, [%r17 + 0x01ba]
	.word 0xfc354000  ! 3552: STH_R	sth	%r30, [%r21 + %r0]
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, e)
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_157:
	mov	0x14, %r14
	.word 0xf4f38e40  ! 3561: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_302:
	setx	0x3a003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_157:
	mov	0x19, %r14
	.word 0xf2db8400  ! 3563: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf0a4c020  ! 3564: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
cpu_intr_3_303:
	setx	0x38023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 32)
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a80  ! 3570: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a80, %hpstate
	.word 0xfea4e182  ! 3572: STWA_I	stwa	%r31, [%r19 + 0x0182] %asi
	.word 0xf6f46130  ! 3573: STXA_I	stxa	%r27, [%r17 + 0x0130] %asi
cpu_intr_3_304:
	setx	0x3b033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_305:
	setx	0x390301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a4a012  ! 3583: STWA_I	stwa	%r28, [%r18 + 0x0012] %asi
	.word 0xfeb5c020  ! 3584: STHA_R	stha	%r31, [%r23 + %r0] 0x01
	.word 0xb23d6086  ! 3586: XNOR_I	xnor 	%r21, 0x0086, %r25
	.word 0xf6ac0020  ! 3587: STBA_R	stba	%r27, [%r16 + %r0] 0x01
	.word 0xfeaca125  ! 3589: STBA_I	stba	%r31, [%r18 + 0x0125] %asi
	.word 0x81946097  ! 3591: WRPR_TPC_I	wrpr	%r17, 0x0097, %tpc
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_306:
	setx	0x38031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275e17c  ! 3597: STX_I	stx	%r25, [%r23 + 0x017c]
	.word 0xf62421ab  ! 3599: STW_I	stw	%r27, [%r16 + 0x01ab]
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_rd_158:
	mov	0x3c4, %r14
	.word 0xf6db8e60  ! 3603: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_wr_158:
	mov	0x36, %r14
	.word 0xfcf38e40  ! 3604: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_307:
	setx	0x38001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb225a0a2  ! 3610: SUB_I	sub 	%r22, 0x00a2, %r25
	.word 0xf42c4000  ! 3612: STB_R	stb	%r26, [%r17 + %r0]
T3_asi_reg_wr_159:
	mov	0x31, %r14
	.word 0xfcf38400  ! 3615: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_3_308:
	setx	0x3b022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a50020  ! 3620: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
	.word 0xf624e058  ! 3623: STW_I	stw	%r27, [%r19 + 0x0058]
cpu_intr_3_309:
	setx	0x3b0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0750000  ! 3625: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xfc740000  ! 3627: STX_R	stx	%r30, [%r16 + %r0]
T3_asi_reg_rd_159:
	mov	0x28, %r14
	.word 0xf0db8400  ! 3628: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_rd_160:
	mov	0x3c2, %r14
	.word 0xf0db8e80  ! 3630: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_310:
	setx	0x3b0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac8020  ! 3642: STBA_R	stba	%r24, [%r18 + %r0] 0x01
	.word 0xf2a42058  ! 3646: STWA_I	stwa	%r25, [%r16 + 0x0058] %asi
	.word 0xf4348000  ! 3648: STH_R	sth	%r26, [%r18 + %r0]
T3_asi_reg_wr_160:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 3650: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf2b50020  ! 3656: STHA_R	stha	%r25, [%r20 + %r0] 0x01
	.word 0xfaf4a19a  ! 3657: STXA_I	stxa	%r29, [%r18 + 0x019a] %asi
T3_asi_reg_rd_161:
	mov	0x23, %r14
	.word 0xfadb8e80  ! 3660: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf22c61c4  ! 3661: STB_I	stb	%r25, [%r17 + 0x01c4]
	.word 0xbd347001  ! 3663: SRLX_I	srlx	%r17, 0x0001, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 29)
	.word 0xb63ce01c  ! 3668: XNOR_I	xnor 	%r19, 0x001c, %r27
	ta	T_CHANGE_TO_TL0
cpu_intr_3_311:
	setx	0x3a0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac0020  ! 3679: STBA_R	stba	%r29, [%r16 + %r0] 0x01
	.word 0xf0ad61fc  ! 3680: STBA_I	stba	%r24, [%r21 + 0x01fc] %asi
cpu_intr_3_312:
	setx	0x3e0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_161:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 3684: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf0248000  ! 3687: STW_R	stw	%r24, [%r18 + %r0]
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 38)
	.word 0xbc2cc000  ! 3701: ANDN_R	andn 	%r19, %r0, %r30
	.word 0xb295c000  ! 3702: ORcc_R	orcc 	%r23, %r0, %r25
T3_asi_reg_wr_162:
	mov	0xa, %r14
	.word 0xfef38e60  ! 3704: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_313:
	setx	0x3f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_314:
	setx	0x3d0116, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_163:
	mov	0x3c0, %r14
	.word 0xf4f389e0  ! 3716: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf8ace1ff  ! 3718: STBA_I	stba	%r28, [%r19 + 0x01ff] %asi
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982910  ! 3719: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0910, %hpstate
	.word 0xfe2c206a  ! 3720: STB_I	stb	%r31, [%r16 + 0x006a]
	.word 0xf025e0b9  ! 3721: STW_I	stw	%r24, [%r23 + 0x00b9]
	.word 0xf4f5e1a1  ! 3722: STXA_I	stxa	%r26, [%r23 + 0x01a1] %asi
	.word 0xb82dc000  ! 3723: ANDN_R	andn 	%r23, %r0, %r28
	.word 0xfcac6185  ! 3724: STBA_I	stba	%r30, [%r17 + 0x0185] %asi
T3_asi_reg_wr_164:
	mov	0x22, %r14
	.word 0xf0f38e40  ! 3727: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfc240000  ! 3730: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xfaa48020  ! 3731: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
T3_asi_reg_wr_165:
	mov	0x15, %r14
	.word 0xf2f38e40  ! 3733: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_162:
	mov	0x3c4, %r14
	.word 0xf6db8e60  ! 3734: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_315:
	setx	0x3c003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_316:
	setx	0x3e010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_163:
	mov	0x38, %r14
	.word 0xfcdb8400  ! 3741: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xfeacc020  ! 3744: STBA_R	stba	%r31, [%r19 + %r0] 0x01
T3_asi_reg_wr_166:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 3745: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf835e07d  ! 3747: STH_I	sth	%r28, [%r23 + 0x007d]
	.word 0xf2a520af  ! 3750: STWA_I	stwa	%r25, [%r20 + 0x00af] %asi
	.word 0xfe758000  ! 3751: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xfcf42178  ! 3752: STXA_I	stxa	%r30, [%r16 + 0x0178] %asi
	.word 0xbab48000  ! 3754: SUBCcc_R	orncc 	%r18, %r0, %r29
T3_asi_reg_rd_164:
	mov	0x17, %r14
	.word 0xf6db8400  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 25)
	.word 0xb4144000  ! 3762: OR_R	or 	%r17, %r0, %r26
	.word 0xfca40020  ! 3763: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, c)
	ta	T_CHANGE_TO_TL0
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_167:
	mov	0x17, %r14
	.word 0xfef38400  ! 3774: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_168:
	mov	0x17, %r14
	.word 0xfcf38e80  ! 3777: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf2f5610d  ! 3778: STXA_I	stxa	%r25, [%r21 + 0x010d] %asi
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb37dc400  ! 3783: MOVR_R	movre	%r23, %r0, %r25
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 28)
	.word 0xfe748000  ! 3790: STX_R	stx	%r31, [%r18 + %r0]
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf8b421ce  ! 3797: STHA_I	stha	%r28, [%r16 + 0x01ce] %asi
	ta	T_CHANGE_TO_TL0
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 28)
	.word 0xb09c2112  ! 3803: XORcc_I	xorcc 	%r16, 0x0112, %r24
cpu_intr_3_317:
	setx	0x3d0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5a057  ! 3805: STHA_I	stha	%r31, [%r22 + 0x0057] %asi
	.word 0xfcb4a087  ! 3806: STHA_I	stha	%r30, [%r18 + 0x0087] %asi
T3_asi_reg_wr_169:
	mov	0x1d, %r14
	.word 0xfef38e40  ! 3807: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb8c4e1d6  ! 3808: ADDCcc_I	addccc 	%r19, 0x01d6, %r28
	.word 0xfcb54020  ! 3810: STHA_R	stha	%r30, [%r21 + %r0] 0x01
	.word 0xf034a06e  ! 3815: STH_I	sth	%r24, [%r18 + 0x006e]
T3_asi_reg_wr_170:
	mov	0x1c, %r14
	.word 0xf0f38e80  ! 3817: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfc754000  ! 3822: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xb12d7001  ! 3823: SLLX_I	sllx	%r21, 0x0001, %r24
cpu_intr_3_318:
	setx	0x3e0111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_319:
	setx	0x3e0334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_320:
	setx	0x3c010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c21db  ! 3840: STB_I	stb	%r31, [%r16 + 0x01db]
	.word 0xf2ad8020  ! 3841: STBA_R	stba	%r25, [%r22 + %r0] 0x01
T3_asi_reg_rd_165:
	mov	0x2d, %r14
	.word 0xf4db84a0  ! 3843: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf4a5610c  ! 3844: STWA_I	stwa	%r26, [%r21 + 0x010c] %asi
	.word 0xf235a15e  ! 3845: STH_I	sth	%r25, [%r22 + 0x015e]
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_321:
	setx	0x3c0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x8198281a  ! 3849: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081a, %hpstate
	ta	T_CHANGE_TO_TL1
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_wr_171:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 3857: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_322:
	setx	0x3c0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13c9000  ! 3861: SRAX_R	srax	%r18, %r0, %r24
	.word 0xf0f52030  ! 3863: STXA_I	stxa	%r24, [%r20 + 0x0030] %asi
T3_asi_reg_rd_166:
	mov	0x3c6, %r14
	.word 0xf2db89e0  ! 3865: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f48  ! 3868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f48, %hpstate
T3_asi_reg_wr_172:
	mov	0x30, %r14
	.word 0xf6f38e80  ! 3870: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_323:
	setx	0x3d0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03421ad  ! 3876: STH_I	sth	%r24, [%r16 + 0x01ad]
cpu_intr_3_324:
	setx	0x3d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe44c000  ! 3880: ADDC_R	addc 	%r19, %r0, %r31
	.word 0xfcad6029  ! 3881: STBA_I	stba	%r30, [%r21 + 0x0029] %asi
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 32)
	.word 0xb2bd8000  ! 3885: XNORcc_R	xnorcc 	%r22, %r0, %r25
	.word 0xf8ac4020  ! 3886: STBA_R	stba	%r28, [%r17 + %r0] 0x01
	.word 0xf2adc020  ! 3888: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	.word 0xf4ac4020  ! 3889: STBA_R	stba	%r26, [%r17 + %r0] 0x01
T3_asi_reg_wr_173:
	mov	0x18, %r14
	.word 0xf8f38e40  ! 3891: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_174:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 3896: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 15)
	.word 0xfaa54020  ! 3900: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	.word 0xb3510000  ! 3904: RDPR_TICK	rdpr	%tick, %r25
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 28)
	.word 0xfe2d6168  ! 3906: STB_I	stb	%r31, [%r21 + 0x0168]
	.word 0xf6ac0020  ! 3907: STBA_R	stba	%r27, [%r16 + %r0] 0x01
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 6)
	.word 0x9195618b  ! 3909: WRPR_PIL_I	wrpr	%r21, 0x018b, %pil
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, e)
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 1)
	.word 0xfab48020  ! 3919: STHA_R	stha	%r29, [%r18 + %r0] 0x01
	.word 0xfab42048  ! 3923: STHA_I	stha	%r29, [%r16 + 0x0048] %asi
	.word 0xb4840000  ! 3926: ADDcc_R	addcc 	%r16, %r0, %r26
	.word 0xf0b4e1e4  ! 3928: STHA_I	stha	%r24, [%r19 + 0x01e4] %asi
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983800  ! 3933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1800, %hpstate
	.word 0xf62ca074  ! 3938: STB_I	stb	%r27, [%r18 + 0x0074]
cpu_intr_3_325:
	setx	0x3c010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac2081  ! 3941: STBA_I	stba	%r26, [%r16 + 0x0081] %asi
	.word 0xf634e182  ! 3944: STH_I	sth	%r27, [%r19 + 0x0182]
T3_asi_reg_rd_167:
	mov	0xf, %r14
	.word 0xfcdb8e60  ! 3946: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_326:
	setx	0x3c0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5a110  ! 3951: STHA_I	stha	%r28, [%r22 + 0x0110] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_327:
	setx	0x3f000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_328:
	setx	0x3c003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d8000  ! 3956: STB_R	stb	%r31, [%r22 + %r0]
T3_asi_reg_rd_168:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 3958: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 39)
	.word 0xf8b58020  ! 3960: STHA_R	stha	%r28, [%r22 + %r0] 0x01
T3_asi_reg_wr_175:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 3961: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T3_asi_reg_wr_176:
	mov	0x13, %r14
	.word 0xfef38400  ! 3962: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, b)
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 23)
	.word 0xf0ac4020  ! 3965: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	.word 0xfaadc020  ! 3968: STBA_R	stba	%r29, [%r23 + %r0] 0x01
	.word 0xf4b44020  ! 3969: STHA_R	stha	%r26, [%r17 + %r0] 0x01
T3_asi_reg_wr_177:
	mov	0x21, %r14
	.word 0xf6f38e40  ! 3970: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 11)
	.word 0xf22d2045  ! 3972: STB_I	stb	%r25, [%r20 + 0x0045]
	.word 0xb61d60b8  ! 3975: XOR_I	xor 	%r21, 0x00b8, %r27
T3_asi_reg_rd_169:
	mov	0x25, %r14
	.word 0xfcdb84a0  ! 3977: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T3_asi_reg_rd_170:
	mov	0x2c, %r14
	.word 0xf2db8e40  ! 3978: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_329:
	setx	0x3f0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25e13d  ! 3982: STW_I	stw	%r29, [%r23 + 0x013d]
T3_asi_reg_rd_171:
	mov	0x2a, %r14
	.word 0xf0db89e0  ! 3983: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfea50020  ! 3986: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
cpu_intr_3_330:
	setx	0x3f0233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_331:
	setx	0x3f0018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_332:
	setx	0x3c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a40020  ! 3992: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_wr_178:
	mov	0x20, %r14
	.word 0xf6f38e40  ! 3994: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf22d8000  ! 3997: STB_R	stb	%r25, [%r22 + %r0]
cpu_intr_3_333:
	setx	0x3f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4a04f  ! 3999: STWA_I	stwa	%r27, [%r18 + 0x004f] %asi
	.word 0xf8a4a188  ! 4004: STWA_I	stwa	%r28, [%r18 + 0x0188] %asi
cpu_intr_3_334:
	setx	0x3f0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75e131  ! 4011: STX_I	stx	%r29, [%r23 + 0x0131]
T3_asi_reg_wr_179:
	mov	0x3c1, %r14
	.word 0xf6f389e0  ! 4012: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_3_335:
	setx	0x3f023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_172:
	mov	0x2c, %r14
	.word 0xfedb8e60  ! 4016: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf22da14c  ! 4021: STB_I	stb	%r25, [%r22 + 0x014c]
cpu_intr_3_336:
	setx	0x3f0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb50020  ! 4024: STHA_R	stha	%r30, [%r20 + %r0] 0x01
cpu_intr_3_337:
	setx	0x3c0211, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_180:
	mov	0x30, %r14
	.word 0xf8f38400  ! 4029: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_wr_181:
	mov	0x11, %r14
	.word 0xfaf38e40  ! 4031: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xf034e00c  ! 4035: STH_I	sth	%r24, [%r19 + 0x000c]
cpu_intr_3_338:
	setx	0x3e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_339:
	setx	0x3d011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_340:
	setx	0x3e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6252161  ! 4042: STW_I	stw	%r27, [%r20 + 0x0161]
	.word 0xf82d8000  ! 4043: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xf4ad8020  ! 4047: STBA_R	stba	%r26, [%r22 + %r0] 0x01
cpu_intr_3_341:
	setx	0x3d0022, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_182:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 4050: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_wr_183:
	mov	0x38, %r14
	.word 0xf8f38e80  ! 4052: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf82c4000  ! 4054: STB_R	stb	%r28, [%r17 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_173:
	mov	0x1d, %r14
	.word 0xf0db8e60  ! 4057: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_342:
	setx	0x3c000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4a112  ! 4060: STHA_I	stha	%r25, [%r18 + 0x0112] %asi
cpu_intr_3_343:
	setx	0x3d020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c58000  ! 4062: ADDCcc_R	addccc 	%r22, %r0, %r25
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 15)
	.word 0xfa3521e4  ! 4072: STH_I	sth	%r29, [%r20 + 0x01e4]
	.word 0xb6040000  ! 4073: ADD_R	add 	%r16, %r0, %r27
cpu_intr_3_344:
	setx	0x3d000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49d4000  ! 4077: XORcc_R	xorcc 	%r21, %r0, %r26
	.word 0xf834a140  ! 4078: STH_I	sth	%r28, [%r18 + 0x0140]
	.word 0xf4740000  ! 4080: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xfea4a0d8  ! 4082: STWA_I	stwa	%r31, [%r18 + 0x00d8] %asi
	.word 0xfc24c000  ! 4085: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xfc2d8000  ! 4086: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xfea421ed  ! 4087: STWA_I	stwa	%r31, [%r16 + 0x01ed] %asi
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_345:
	setx	0x3d021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_346:
	setx	0x3f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_184:
	mov	0x1f, %r14
	.word 0xfcf38400  ! 4094: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb82dc000  ! 4095: ANDN_R	andn 	%r23, %r0, %r28
	.word 0xf8754000  ! 4097: STX_R	stx	%r28, [%r21 + %r0]
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_wr_185:
	mov	0xe, %r14
	.word 0xf8f389e0  ! 4105: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_347:
	setx	0x3e0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983d08  ! 4107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d08, %hpstate
	.word 0xf62c8000  ! 4108: STB_R	stb	%r27, [%r18 + %r0]
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 17)
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c88  ! 4110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c88, %hpstate
T3_asi_reg_rd_174:
	mov	0x7, %r14
	.word 0xf2db84a0  ! 4113: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983e52  ! 4114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e52, %hpstate
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_175:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 4117: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_348:
	setx	0x3d002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_rd_176:
	mov	0x2c, %r14
	.word 0xf4db8e80  ! 4121: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_3_349:
	setx	0x3f002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_350:
	setx	0x3e0200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_351:
	setx	0x3d0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42520e5  ! 4129: STW_I	stw	%r26, [%r20 + 0x00e5]
	.word 0xb9641800  ! 4133: MOVcc_R	<illegal instruction>
cpu_intr_3_352:
	setx	0x430133, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf0248000  ! 4137: STW_R	stw	%r24, [%r18 + %r0]
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf4f5a0d2  ! 4139: STXA_I	stxa	%r26, [%r22 + 0x00d2] %asi
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 1)
	.word 0xf0a40020  ! 4141: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 34)
	.word 0xf2b560f2  ! 4143: STHA_I	stha	%r25, [%r21 + 0x00f2] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_353:
	setx	0x430303, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_177:
	mov	0x21, %r14
	.word 0xf2db8400  ! 4146: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 39)
	.word 0xbb510000  ! 4149: RDPR_TICK	rdpr	%tick, %r29
T3_asi_reg_wr_186:
	mov	0x22, %r14
	.word 0xf2f389e0  ! 4151: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf82ca03a  ! 4152: STB_I	stb	%r28, [%r18 + 0x003a]
T3_asi_reg_wr_187:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 4153: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_rd_178:
	mov	0x17, %r14
	.word 0xf0db8e80  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb0b54000  ! 4155: ORNcc_R	orncc 	%r21, %r0, %r24
	.word 0xfe350000  ! 4158: STH_R	sth	%r31, [%r20 + %r0]
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_354:
	setx	0x40013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_355:
	setx	0x420236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5e062  ! 4171: STHA_I	stha	%r28, [%r23 + 0x0062] %asi
	.word 0xf2a4211d  ! 4174: STWA_I	stwa	%r25, [%r16 + 0x011d] %asi
	.word 0xf8ada06e  ! 4175: STBA_I	stba	%r28, [%r22 + 0x006e] %asi
	.word 0xfef4a0fe  ! 4177: STXA_I	stxa	%r31, [%r18 + 0x00fe] %asi
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_356:
	setx	0x420227, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_188:
	mov	0x13, %r14
	.word 0xfef38400  ! 4180: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_357:
	setx	0x40030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_358:
	setx	0x400334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75e13c  ! 4186: STX_I	stx	%r30, [%r23 + 0x013c]
	.word 0xbd641800  ! 4194: MOVcc_R	<illegal instruction>
	.word 0xb6140000  ! 4195: OR_R	or 	%r16, %r0, %r27
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 15)
	.word 0xfaf561cb  ! 4203: STXA_I	stxa	%r29, [%r21 + 0x01cb] %asi
cpu_intr_3_359:
	setx	0x430138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe348000  ! 4207: STH_R	sth	%r31, [%r18 + %r0]
T3_asi_reg_rd_179:
	mov	0x31, %r14
	.word 0xf0db84a0  ! 4212: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_360:
	setx	0x430234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5c020  ! 4215: STHA_R	stha	%r25, [%r23 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8bd0000  ! 4217: XNORcc_R	xnorcc 	%r20, %r0, %r28
T3_asi_reg_rd_180:
	mov	0x14, %r14
	.word 0xfcdb89e0  ! 4218: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_361:
	setx	0x42033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_362:
	setx	0x410326, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_363:
	setx	0x40001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad0020  ! 4231: STBA_R	stba	%r26, [%r20 + %r0] 0x01
cpu_intr_3_364:
	setx	0x40011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_181:
	mov	0x37, %r14
	.word 0xfcdb84a0  ! 4235: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb69d4000  ! 4236: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0xf62c0000  ! 4237: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xf2740000  ! 4240: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf6244000  ! 4242: STW_R	stw	%r27, [%r17 + %r0]
cpu_intr_3_365:
	setx	0x420335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_366:
	setx	0x430329, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb21d6164  ! 4248: XOR_I	xor 	%r21, 0x0164, %r25
cpu_intr_3_367:
	setx	0x420301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b4e15f  ! 4252: STHA_I	stha	%r24, [%r19 + 0x015f] %asi
T3_asi_reg_wr_189:
	mov	0x1a, %r14
	.word 0xfaf384a0  ! 4255: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf42de129  ! 4256: STB_I	stb	%r26, [%r23 + 0x0129]
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 39)
	.word 0xb23461ae  ! 4265: ORN_I	orn 	%r17, 0x01ae, %r25
	.word 0xfaac2103  ! 4267: STBA_I	stba	%r29, [%r16 + 0x0103] %asi
cpu_intr_3_368:
	setx	0x41032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0a58000  ! 4273: SUBcc_R	subcc 	%r22, %r0, %r24
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 39)
	.word 0xb484e065  ! 4275: ADDcc_I	addcc 	%r19, 0x0065, %r26
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 8)
	.word 0xb52cc000  ! 4278: SLL_R	sll 	%r19, %r0, %r26
	.word 0xb2c4c000  ! 4280: ADDCcc_R	addccc 	%r19, %r0, %r25
	.word 0xfca44020  ! 4282: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
T3_asi_reg_wr_190:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 4290: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb12c5000  ! 4291: SLLX_R	sllx	%r17, %r0, %r24
	.word 0xba84e156  ! 4292: ADDcc_I	addcc 	%r19, 0x0156, %r29
T3_asi_reg_rd_182:
	mov	0x31, %r14
	.word 0xf4db8e60  ! 4293: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfcb40020  ! 4296: STHA_R	stha	%r30, [%r16 + %r0] 0x01
	.word 0xbd3de001  ! 4297: SRA_I	sra 	%r23, 0x0001, %r30
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf8ac4020  ! 4302: STBA_R	stba	%r28, [%r17 + %r0] 0x01
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 31)
	ta	T_CHANGE_TO_TL1
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_wr_191:
	mov	0x6, %r14
	.word 0xf2f38400  ! 4307: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_369:
	setx	0x43013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_192:
	mov	0x3, %r14
	.word 0xfef38e60  ! 4311: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_370:
	setx	0x420320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_371:
	setx	0x430224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4e14c  ! 4321: STWA_I	stwa	%r27, [%r19 + 0x014c] %asi
T3_asi_reg_wr_193:
	mov	0xd, %r14
	.word 0xf4f38e80  ! 4324: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819829c0  ! 4325: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c0, %hpstate
	.word 0xfe344000  ! 4326: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xbab5c000  ! 4327: ORNcc_R	orncc 	%r23, %r0, %r29
	.word 0xfa350000  ! 4328: STH_R	sth	%r29, [%r20 + %r0]
cpu_intr_3_372:
	setx	0x400325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42ce193  ! 4330: STB_I	stb	%r26, [%r19 + 0x0193]
cpu_intr_3_373:
	setx	0x3010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_374:
	setx	0x42000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d6085  ! 4333: STB_I	stb	%r29, [%r21 + 0x0085]
cpu_intr_3_375:
	setx	0x430207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2421a4  ! 4336: STW_I	stw	%r31, [%r16 + 0x01a4]
T3_asi_reg_rd_183:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 4337: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb52d1000  ! 4338: SLLX_R	sllx	%r20, %r0, %r26
cpu_intr_3_376:
	setx	0x42003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf4a4c020  ! 4347: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 18)
	.word 0xf03460b6  ! 4350: STH_I	sth	%r24, [%r17 + 0x00b6]
	.word 0xfc250000  ! 4352: STW_R	stw	%r30, [%r20 + %r0]
cpu_intr_3_377:
	setx	0x420020, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_184:
	mov	0x34, %r14
	.word 0xf6db8400  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_wr_194:
	mov	0x3c0, %r14
	.word 0xfef38400  ! 4360: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfa35a181  ! 4367: STH_I	sth	%r29, [%r22 + 0x0181]
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 11)
	.word 0xf0f461e3  ! 4375: STXA_I	stxa	%r24, [%r17 + 0x01e3] %asi
cpu_intr_3_378:
	setx	0x410112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21da191  ! 4382: XOR_I	xor 	%r22, 0x0191, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xb494e14e  ! 4388: ORcc_I	orcc 	%r19, 0x014e, %r26
	.word 0xb49c0000  ! 4389: XORcc_R	xorcc 	%r16, %r0, %r26
T3_asi_reg_rd_185:
	mov	0x10, %r14
	.word 0xf2db84a0  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfe240000  ! 4394: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xfc354000  ! 4395: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xf425c000  ! 4397: STW_R	stw	%r26, [%r23 + %r0]
T3_asi_reg_rd_186:
	mov	0x1a, %r14
	.word 0xf0db8e80  ! 4399: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_wr_195:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 4404: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe2d210c  ! 4407: STB_I	stb	%r31, [%r20 + 0x010c]
	.word 0xf6b44020  ! 4408: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	.word 0xf6b5200d  ! 4409: STHA_I	stha	%r27, [%r20 + 0x000d] %asi
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a92  ! 4411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a92, %hpstate
	.word 0xfc2de074  ! 4412: STB_I	stb	%r30, [%r23 + 0x0074]
cpu_intr_3_379:
	setx	0x41030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb54020  ! 4417: STHA_R	stha	%r30, [%r21 + %r0] 0x01
cpu_intr_3_380:
	setx	0x40023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf035a1a5  ! 4423: STH_I	sth	%r24, [%r22 + 0x01a5]
cpu_intr_3_381:
	setx	0x430125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_382:
	setx	0x420121, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_187:
	mov	0x4, %r14
	.word 0xf8db84a0  ! 4431: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf6b50020  ! 4433: STHA_R	stha	%r27, [%r20 + %r0] 0x01
T3_asi_reg_wr_196:
	mov	0xd, %r14
	.word 0xf6f38400  ! 4434: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf6acc020  ! 4435: STBA_R	stba	%r27, [%r19 + %r0] 0x01
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983892  ! 4437: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1892, %hpstate
	.word 0xf0ac610f  ! 4438: STBA_I	stba	%r24, [%r17 + 0x010f] %asi
	.word 0xf62c206a  ! 4441: STB_I	stb	%r27, [%r16 + 0x006a]
T3_asi_reg_wr_197:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 4444: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_wr_198:
	mov	0x22, %r14
	.word 0xf6f38400  ! 4445: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 38)
	.word 0x9195e180  ! 4451: WRPR_PIL_I	wrpr	%r23, 0x0180, %pil
	.word 0xfab5e0ec  ! 4452: STHA_I	stha	%r29, [%r23 + 0x00ec] %asi
T3_asi_reg_wr_199:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 4453: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_TO_TL0
	.word 0xbf2cc000  ! 4458: SLL_R	sll 	%r19, %r0, %r31
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 18)
	.word 0xf6b54020  ! 4475: STHA_R	stha	%r27, [%r21 + %r0] 0x01
T3_asi_reg_rd_188:
	mov	0x3c4, %r14
	.word 0xf8db89e0  ! 4476: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_383:
	setx	0x41021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_384:
	setx	0x410232, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_200:
	mov	0x4, %r14
	.word 0xf8f38e80  ! 4479: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_3_385:
	setx	0x410221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 4484: RDPR_TL	rdpr	%tl, %r26
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 8)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_386:
	setx	0x400328, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb40d8000  ! 4500: AND_R	and 	%r22, %r0, %r26
T3_asi_reg_rd_189:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 4505: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb4040000  ! 4506: ADD_R	add 	%r16, %r0, %r26
	.word 0xb6958000  ! 4507: ORcc_R	orcc 	%r22, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6a40020  ! 4511: STWA_R	stwa	%r27, [%r16 + %r0] 0x01
	.word 0xf8b48020  ! 4512: STHA_R	stha	%r28, [%r18 + %r0] 0x01
	.word 0xfeadc020  ! 4513: STBA_R	stba	%r31, [%r23 + %r0] 0x01
	.word 0xf6a58020  ! 4514: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xfa35a1ae  ! 4515: STH_I	sth	%r29, [%r22 + 0x01ae]
	.word 0xf6a48020  ! 4516: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
cpu_intr_3_387:
	setx	0x400212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_388:
	setx	0x420137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_389:
	setx	0x41003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_201:
	mov	0x0, %r14
	.word 0xfaf38e80  ! 4521: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 1)
	.word 0xf0a4c020  ! 4524: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
cpu_intr_3_390:
	setx	0x41003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24a0f5  ! 4527: STW_I	stw	%r29, [%r18 + 0x00f5]
	.word 0xfeac21b4  ! 4534: STBA_I	stba	%r31, [%r16 + 0x01b4] %asi
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 15)
	.word 0xba354000  ! 4538: SUBC_R	orn 	%r21, %r0, %r29
cpu_intr_3_391:
	setx	0x41013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2748000  ! 4541: STX_R	stx	%r25, [%r18 + %r0]
cpu_intr_3_392:
	setx	0x420012, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_190:
	mov	0x1e, %r14
	.word 0xf8db84a0  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf2a5a127  ! 4554: STWA_I	stwa	%r25, [%r22 + 0x0127] %asi
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819829c0  ! 4556: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c0, %hpstate
	.word 0xf4348000  ! 4559: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xf02d8000  ! 4560: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xfe340000  ! 4565: STH_R	sth	%r31, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 38)
	.word 0xfc2d4000  ! 4570: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xfe240000  ! 4572: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xfca54020  ! 4573: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
	.word 0xfcad20c0  ! 4577: STBA_I	stba	%r30, [%r20 + 0x00c0] %asi
	.word 0xbb518000  ! 4578: RDPR_PSTATE	rdpr	%pstate, %r29
T3_asi_reg_rd_191:
	mov	0x1d, %r14
	.word 0xf8db8e40  ! 4579: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_393:
	setx	0x430332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfca40020  ! 4590: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
cpu_intr_3_394:
	setx	0x400325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_395:
	setx	0x43022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_396:
	setx	0x420010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 5)
	.word 0xfaf5e185  ! 4606: STXA_I	stxa	%r29, [%r23 + 0x0185] %asi
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982bda  ! 4607: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bda, %hpstate
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_wr_202:
	mov	0x2c, %r14
	.word 0xfef389e0  ! 4609: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_rd_192:
	mov	0x32, %r14
	.word 0xf4db8e40  ! 4610: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_397:
	setx	0x440133, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983e82  ! 4618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e82, %hpstate
	.word 0xfc35e0b4  ! 4619: STH_I	sth	%r30, [%r23 + 0x00b4]
	.word 0xbc350000  ! 4621: ORN_R	orn 	%r20, %r0, %r30
	.word 0xf2a521c7  ! 4622: STWA_I	stwa	%r25, [%r20 + 0x01c7] %asi
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_398:
	setx	0x470311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, a)
	.word 0xb97c6401  ! 4632: MOVR_I	movre	%r17, 0x1, %r28
cpu_intr_3_399:
	setx	0x460207, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_203:
	mov	0x21, %r14
	.word 0xfef38400  ! 4634: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_193:
	mov	0x3, %r14
	.word 0xf6db89e0  ! 4638: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_rd_194:
	mov	0x4, %r14
	.word 0xf2db84a0  ! 4640: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_3_400:
	setx	0x470012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6250000  ! 4643: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xf625a1a0  ! 4646: STW_I	stw	%r27, [%r22 + 0x01a0]
	.word 0xf62d4000  ! 4648: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xb00c0000  ! 4650: AND_R	and 	%r16, %r0, %r24
cpu_intr_3_401:
	setx	0x45013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_402:
	setx	0x460216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_403:
	setx	0x460025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a5a033  ! 4656: STWA_I	stwa	%r27, [%r22 + 0x0033] %asi
	.word 0xf6ac603d  ! 4657: STBA_I	stba	%r27, [%r17 + 0x003d] %asi
	.word 0xf2254000  ! 4659: STW_R	stw	%r25, [%r21 + %r0]
cpu_intr_3_404:
	setx	0x450110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad0020  ! 4661: STBA_R	stba	%r28, [%r20 + %r0] 0x01
cpu_intr_3_405:
	setx	0x470303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc358000  ! 4669: STH_R	sth	%r30, [%r22 + %r0]
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 12)
	.word 0xf6352099  ! 4674: STH_I	sth	%r27, [%r20 + 0x0099]
	.word 0xf6350000  ! 4680: STH_R	sth	%r27, [%r20 + %r0]
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 6)
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983ad0  ! 4683: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad0, %hpstate
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, f)
	.word 0xb57de401  ! 4688: MOVR_I	movre	%r23, 0x1, %r26
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 3c)
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983ac8  ! 4690: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac8, %hpstate
	.word 0xfa24c000  ! 4691: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf4ad8020  ! 4692: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xf4750000  ! 4695: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xf2adc020  ! 4697: STBA_R	stba	%r25, [%r23 + %r0] 0x01
T3_asi_reg_wr_204:
	mov	0x6, %r14
	.word 0xf4f38e40  ! 4698: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf425e10c  ! 4699: STW_I	stw	%r26, [%r23 + 0x010c]
T3_asi_reg_rd_195:
	mov	0x1d, %r14
	.word 0xf6db89e0  ! 4700: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_406:
	setx	0x450205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c0000  ! 4704: STB_R	stb	%r27, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b54020  ! 4707: STHA_R	stha	%r28, [%r21 + %r0] 0x01
	.word 0xb52d0000  ! 4715: SLL_R	sll 	%r20, %r0, %r26
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf224c000  ! 4720: STW_R	stw	%r25, [%r19 + %r0]
cpu_intr_3_407:
	setx	0x440021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_408:
	setx	0x470214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_409:
	setx	0x450334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa521bd  ! 4725: STWA_I	stwa	%r29, [%r20 + 0x01bd] %asi
T3_asi_reg_wr_205:
	mov	0x1f, %r14
	.word 0xfef389e0  ! 4728: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_NONHPRIV
	.word 0xfcf42149  ! 4731: STXA_I	stxa	%r30, [%r16 + 0x0149] %asi
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 26)
	.word 0xfe34a105  ! 4737: STH_I	sth	%r31, [%r18 + 0x0105]
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 30)
	.word 0xf6ac4020  ! 4740: STBA_R	stba	%r27, [%r17 + %r0] 0x01
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 29)
	.word 0xf2b5e0c0  ! 4748: STHA_I	stha	%r25, [%r23 + 0x00c0] %asi
	.word 0xf22d4000  ! 4752: STB_R	stb	%r25, [%r21 + %r0]
cpu_intr_3_410:
	setx	0x470300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 19)
	.word 0xf8348000  ! 4759: STH_R	sth	%r28, [%r18 + %r0]
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 1)
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983f80  ! 4762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f80, %hpstate
cpu_intr_3_411:
	setx	0x46020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b4a0d4  ! 4765: STHA_I	stha	%r28, [%r18 + 0x00d4] %asi
T3_asi_reg_wr_206:
	mov	0x1c, %r14
	.word 0xf4f38400  ! 4768: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 27)
	.word 0xf0340000  ! 4770: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xf6b54020  ! 4773: STHA_R	stha	%r27, [%r21 + %r0] 0x01
	.word 0xfc350000  ! 4774: STH_R	sth	%r30, [%r20 + %r0]
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982942  ! 4777: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0942, %hpstate
T3_asi_reg_rd_196:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 4778: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf8f5603a  ! 4779: STXA_I	stxa	%r28, [%r21 + 0x003a] %asi
T3_asi_reg_wr_207:
	mov	0x3c5, %r14
	.word 0xfef389e0  ! 4780: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf82c8000  ! 4784: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xf0254000  ! 4786: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xb42dc000  ! 4787: ANDN_R	andn 	%r23, %r0, %r26
	.word 0xfead8020  ! 4791: STBA_R	stba	%r31, [%r22 + %r0] 0x01
	.word 0xfc25e04b  ! 4792: STW_I	stw	%r30, [%r23 + 0x004b]
	.word 0xb0b48000  ! 4793: ORNcc_R	orncc 	%r18, %r0, %r24
T3_asi_reg_rd_197:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 4794: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_198:
	mov	0x3c0, %r14
	.word 0xf2db89e0  ! 4797: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_wr_208:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 4798: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfaa44020  ! 4807: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	.word 0xbd508000  ! 4812: RDPR_TSTATE	rdpr	%tstate, %r30
cpu_intr_3_412:
	setx	0x450039, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_209:
	mov	0x24, %r14
	.word 0xfef38400  ! 4817: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	.word 0xfe356161  ! 4821: STH_I	sth	%r31, [%r21 + 0x0161]
	.word 0xb41ce161  ! 4824: XOR_I	xor 	%r19, 0x0161, %r26
	.word 0xfe758000  ! 4826: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xfc744000  ! 4828: STX_R	stx	%r30, [%r17 + %r0]
cpu_intr_3_413:
	setx	0x47012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4a11e  ! 4832: STWA_I	stwa	%r24, [%r18 + 0x011e] %asi
	.word 0xfa35a089  ! 4833: STH_I	sth	%r29, [%r22 + 0x0089]
	.word 0xf825e126  ! 4836: STW_I	stw	%r28, [%r23 + 0x0126]
cpu_intr_3_414:
	setx	0x460303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f561db  ! 4839: STXA_I	stxa	%r26, [%r21 + 0x01db] %asi
	.word 0xf875e1f7  ! 4840: STX_I	stx	%r28, [%r23 + 0x01f7]
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfaa5c020  ! 4842: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
cpu_intr_3_415:
	setx	0x46001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c0000  ! 4844: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xf6ada178  ! 4845: STBA_I	stba	%r27, [%r22 + 0x0178] %asi
	.word 0xf4b4a0bf  ! 4849: STHA_I	stha	%r26, [%r18 + 0x00bf] %asi
	.word 0xf0b46152  ! 4852: STHA_I	stha	%r24, [%r17 + 0x0152] %asi
	.word 0xf6346070  ! 4854: STH_I	sth	%r27, [%r17 + 0x0070]
T3_asi_reg_rd_199:
	mov	0x12, %r14
	.word 0xf8db8e60  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf02d608f  ! 4857: STB_I	stb	%r24, [%r21 + 0x008f]
T3_asi_reg_rd_200:
	mov	0x3c3, %r14
	.word 0xf4db84a0  ! 4860: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbcb5a009  ! 4861: SUBCcc_I	orncc 	%r22, 0x0009, %r30
	.word 0xf6aca0f5  ! 4865: STBA_I	stba	%r27, [%r18 + 0x00f5] %asi
cpu_intr_3_416:
	setx	0x450024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_rd_201:
	mov	0x2a, %r14
	.word 0xf4db84a0  ! 4870: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf6ada1e6  ! 4871: STBA_I	stba	%r27, [%r22 + 0x01e6] %asi
	.word 0x8994a1dc  ! 4873: WRPR_TICK_I	wrpr	%r18, 0x01dc, %tick
	ta	T_CHANGE_TO_TL1
cpu_intr_3_417:
	setx	0x450310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe244000  ! 4893: STW_R	stw	%r31, [%r17 + %r0]
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 7)
	.word 0xf2354000  ! 4897: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xf4b5c020  ! 4898: STHA_R	stha	%r26, [%r23 + %r0] 0x01
T3_asi_reg_wr_210:
	mov	0x3c5, %r14
	.word 0xfef389e0  ! 4900: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf42da0a5  ! 4902: STB_I	stb	%r26, [%r22 + 0x00a5]
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_rd_202:
	mov	0xd, %r14
	.word 0xf4db84a0  ! 4905: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 2f)
	.word 0xb92de001  ! 4910: SLL_I	sll 	%r23, 0x0001, %r28
T3_asi_reg_wr_211:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 4914: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf4344000  ! 4915: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xf2a4a130  ! 4918: STWA_I	stwa	%r25, [%r18 + 0x0130] %asi
	.word 0xb8c44000  ! 4921: ADDCcc_R	addccc 	%r17, %r0, %r28
cpu_intr_3_418:
	setx	0x46030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 20)
	.word 0xbf520000  ! 4928: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf67461ea  ! 4929: STX_I	stx	%r27, [%r17 + 0x01ea]
	.word 0xb49c61a5  ! 4930: XORcc_I	xorcc 	%r17, 0x01a5, %r26
cpu_intr_3_419:
	setx	0x460312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac213b  ! 4937: STBA_I	stba	%r31, [%r16 + 0x013b] %asi
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 15)
	.word 0xf2f56046  ! 4940: STXA_I	stxa	%r25, [%r21 + 0x0046] %asi
	.word 0xba1d8000  ! 4942: XOR_R	xor 	%r22, %r0, %r29
T3_asi_reg_wr_212:
	mov	0x5, %r14
	.word 0xf6f38e60  ! 4943: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_420:
	setx	0x460220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_421:
	setx	0x450122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca4a181  ! 4949: STWA_I	stwa	%r30, [%r18 + 0x0181] %asi
	.word 0xfc35a18b  ! 4950: STH_I	sth	%r30, [%r22 + 0x018b]
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 5)
	.word 0xf8ac0020  ! 4953: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xfead4020  ! 4954: STBA_R	stba	%r31, [%r21 + %r0] 0x01
	.word 0xfead8020  ! 4955: STBA_R	stba	%r31, [%r22 + %r0] 0x01
	.word 0xf425c000  ! 4956: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xb12c2001  ! 4957: SLL_I	sll 	%r16, 0x0001, %r24
T3_asi_reg_wr_213:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 4958: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf835c000  ! 4962: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xfc3560a9  ! 4964: STH_I	sth	%r30, [%r21 + 0x00a9]
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_203:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 4976: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe2da1c3  ! 4978: STB_I	stb	%r31, [%r22 + 0x01c3]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_422:
	setx	0x460018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 21)
	.word 0xb295c000  ! 4984: ORcc_R	orcc 	%r23, %r0, %r25
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 1)
	.word 0xf82d0000  ! 4990: STB_R	stb	%r28, [%r20 + %r0]
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_423:
	setx	0x440129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_424:
	setx	0x470001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe758000  ! 4998: STX_R	stx	%r31, [%r22 + %r0]
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
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 37)
	.word 0xf4854020  ! 6: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r26
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, c)
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_0:
	mov	0x37, %r14
	.word 0xf8f389e0  ! 9: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T2_asi_reg_rd_0:
	mov	0x16, %r14
	.word 0xf2db8e40  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_1:
	mov	0x3c8, %r14
	.word 0xf2db8e60  ! 12: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf6c48020  ! 22: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r27
	.word 0xbcb54000  ! 23: SUBCcc_R	orncc 	%r21, %r0, %r30
T2_asi_reg_wr_1:
	mov	0x21, %r14
	.word 0xf2f38e40  ! 28: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf00cc000  ! 32: LDUB_R	ldub	[%r19 + %r0], %r24
T2_asi_reg_wr_2:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 33: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfed4c020  ! 35: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
T2_asi_reg_rd_2:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 36: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfad40020  ! 43: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r29
	.word 0xb4248000  ! 51: SUB_R	sub 	%r18, %r0, %r26
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_3:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 55: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_0:
	setx	0x1f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_rd_4:
	mov	0x3c0, %r14
	.word 0xf8db8400  ! 58: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf40d4000  ! 61: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xfa140000  ! 62: LDUH_R	lduh	[%r16 + %r0], %r29
	.word 0xfc8dc020  ! 67: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
	.word 0xfc5dc000  ! 68: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xb6ac8000  ! 70: ANDNcc_R	andncc 	%r18, %r0, %r27
	.word 0xfacca09d  ! 71: LDSBA_I	ldsba	[%r18, + 0x009d] %asi, %r29
	.word 0xfa85c020  ! 74: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r29
T2_asi_reg_rd_5:
	mov	0x1d, %r14
	.word 0xf8db8e40  ! 76: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf25c0000  ! 77: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xf20dc000  ! 78: LDUB_R	ldub	[%r23 + %r0], %r25
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_1:
	setx	0x1f0027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_2:
	setx	0x1d0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cde04a  ! 85: LDSBA_I	ldsba	[%r23, + 0x004a] %asi, %r26
	.word 0xf2958020  ! 91: LDUHA_R	lduha	[%r22, %r0] 0x01, %r25
	.word 0xf045c000  ! 92: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xb93c0000  ! 93: SRA_R	sra 	%r16, %r0, %r28
	.word 0xbe0d0000  ! 94: AND_R	and 	%r20, %r0, %r31
T2_asi_reg_rd_6:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 95: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T2_asi_reg_rd_7:
	mov	0x33, %r14
	.word 0xf0db8e40  ! 97: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf8d461a7  ! 98: LDSHA_I	ldsha	[%r17, + 0x01a7] %asi, %r28
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, c)
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_3:
	mov	0xe, %r14
	.word 0xf0f389e0  ! 111: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, f)
	.word 0xf04c4000  ! 115: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xf8450000  ! 116: LDSW_R	ldsw	[%r20 + %r0], %r28
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_3:
	setx	0x1c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6840020  ! 120: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_8:
	mov	0x12, %r14
	.word 0xf4db84a0  ! 122: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T2_asi_reg_rd_9:
	mov	0x16, %r14
	.word 0xf2db8e80  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfc4c0000  ! 124: LDSB_R	ldsb	[%r16 + %r0], %r30
T2_asi_reg_rd_10:
	mov	0x7, %r14
	.word 0xfadb84a0  ! 125: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_rd_11:
	mov	0x33, %r14
	.word 0xf8db8400  ! 126: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfad4c020  ! 128: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r29
	.word 0xfa944020  ! 129: LDUHA_R	lduha	[%r17, %r0] 0x01, %r29
T2_asi_reg_rd_12:
	mov	0x15, %r14
	.word 0xfadb89e0  ! 131: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_4:
	setx	0x1d0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982c52  ! 135: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c52, %hpstate
	.word 0xf6c50020  ! 136: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r27
T2_asi_reg_rd_13:
	mov	0x23, %r14
	.word 0xfadb89e0  ! 140: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf045e1c2  ! 145: LDSW_I	ldsw	[%r23 + 0x01c2], %r24
T2_asi_reg_rd_14:
	mov	0x1, %r14
	.word 0xf2db8400  ! 149: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf695c020  ! 158: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 15)
	.word 0xf8cd8020  ! 161: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
T2_asi_reg_wr_4:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 163: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb8b54000  ! 167: SUBCcc_R	orncc 	%r21, %r0, %r28
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c02  ! 168: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c02, %hpstate
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf4556055  ! 171: LDSH_I	ldsh	[%r21 + 0x0055], %r26
cpu_intr_2_5:
	setx	0x1c022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa54e0ef  ! 176: LDSH_I	ldsh	[%r19 + 0x00ef], %r29
T2_asi_reg_wr_5:
	mov	0x3c1, %r14
	.word 0xfcf38e60  ! 179: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_6:
	setx	0x1c002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_7:
	setx	0x1c0213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 16)
	.word 0xf00c201a  ! 186: LDUB_I	ldub	[%r16 + 0x001a], %r24
T2_asi_reg_wr_6:
	mov	0x24, %r14
	.word 0xfef38e80  ! 187: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_2_8:
	setx	0x1f0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf845e03f  ! 198: LDSW_I	ldsw	[%r23 + 0x003f], %r28
cpu_intr_2_9:
	setx	0x1d0208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_10:
	setx	0x1d0301, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_7:
	mov	0x2, %r14
	.word 0xf8f38e80  ! 203: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_rd_15:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 204: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfa4da025  ! 205: LDSB_I	ldsb	[%r22 + 0x0025], %r29
	.word 0xbec5a1de  ! 207: ADDCcc_I	addccc 	%r22, 0x01de, %r31
	.word 0xf245e019  ! 208: LDSW_I	ldsw	[%r23 + 0x0019], %r25
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, f)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_11:
	setx	0x1f030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_12:
	setx	0x1c003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_16:
	mov	0x26, %r14
	.word 0xf4db8e40  ! 213: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb805e019  ! 218: ADD_I	add 	%r23, 0x0019, %r28
T2_asi_reg_rd_17:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 219: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb4850000  ! 220: ADDcc_R	addcc 	%r20, %r0, %r26
	.word 0xf4c460aa  ! 222: LDSWA_I	ldswa	[%r17, + 0x00aa] %asi, %r26
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 1e)
	.word 0xb20c618d  ! 224: AND_I	and 	%r17, 0x018d, %r25
	.word 0xb8c4209b  ! 229: ADDCcc_I	addccc 	%r16, 0x009b, %r28
	.word 0xf2dda0d9  ! 230: LDXA_I	ldxa	[%r22, + 0x00d9] %asi, %r25
T2_asi_reg_wr_8:
	mov	0x2c, %r14
	.word 0xfcf38e80  ! 231: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb0448000  ! 233: ADDC_R	addc 	%r18, %r0, %r24
cpu_intr_2_13:
	setx	0x1c010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_14:
	setx	0x1d0321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_15:
	setx	0x1e0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8c0020  ! 240: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
T2_asi_reg_wr_9:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 243: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_10:
	mov	0x34, %r14
	.word 0xf4f389e0  ! 246: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_wr_11:
	mov	0x27, %r14
	.word 0xf8f38e40  ! 247: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_18:
	mov	0x3c5, %r14
	.word 0xf6db84a0  ! 251: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf0156087  ! 252: LDUH_I	lduh	[%r21 + 0x0087], %r24
	.word 0xf0046188  ! 253: LDUW_I	lduw	[%r17 + 0x0188], %r24
T2_asi_reg_rd_19:
	mov	0x23, %r14
	.word 0xf2db8e60  ! 254: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_16:
	setx	0x1e000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb645c000  ! 259: ADDC_R	addc 	%r23, %r0, %r27
cpu_intr_2_17:
	setx	0x1d022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_20:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 263: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_18:
	setx	0x1e020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_12:
	mov	0x24, %r14
	.word 0xf4f384a0  ! 268: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 24)
	.word 0xb0c40000  ! 273: ADDCcc_R	addccc 	%r16, %r0, %r24
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_13:
	mov	0x3c1, %r14
	.word 0xf2f38400  ! 277: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_14:
	mov	0x5, %r14
	.word 0xf4f38e40  ! 279: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_19:
	setx	0x1c020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d4612f  ! 281: LDSHA_I	ldsha	[%r17, + 0x012f] %asi, %r28
	.word 0xfacd8020  ! 282: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
T2_asi_reg_rd_21:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 283: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_wr_15:
	mov	0xf, %r14
	.word 0xf6f38e60  ! 287: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfcd4a030  ! 289: LDSHA_I	ldsha	[%r18, + 0x0030] %asi, %r30
cpu_intr_2_20:
	setx	0x1d013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_16:
	mov	0x3c4, %r14
	.word 0xf0f389e0  ! 294: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf44da08b  ! 296: LDSB_I	ldsb	[%r22 + 0x008b], %r26
	.word 0xfc5d0000  ! 297: LDX_R	ldx	[%r20 + %r0], %r30
cpu_intr_2_21:
	setx	0x1d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, c)
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_22:
	setx	0x1c0011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_17:
	mov	0xb, %r14
	.word 0xfef38e60  ! 308: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_2_23:
	setx	0x1f0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982dda  ! 314: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dda, %hpstate
cpu_intr_2_24:
	setx	0x1f0127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_25:
	setx	0x1e0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_26:
	setx	0x1d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64ca1b9  ! 329: LDSB_I	ldsb	[%r18 + 0x01b9], %r27
	ta	T_CHANGE_TO_TL1
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_27:
	setx	0x1e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_22:
	mov	0x1b, %r14
	.word 0xfadb8e40  ! 334: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_28:
	setx	0x1d032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_29:
	setx	0x1c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8c8020  ! 350: LDUBA_R	lduba	[%r18, %r0] 0x01, %r31
T2_asi_reg_rd_23:
	mov	0x23, %r14
	.word 0xf0db8e40  ! 355: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_30:
	setx	0x1d0310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 2a)
	.word 0xb63d601b  ! 361: XNOR_I	xnor 	%r21, 0x001b, %r27
T2_asi_reg_wr_18:
	mov	0x3c7, %r14
	.word 0xf8f38400  ! 365: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_31:
	setx	0x1e0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d4c020  ! 367: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
cpu_intr_2_32:
	setx	0x1e0021, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_19:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 372: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_20:
	mov	0x16, %r14
	.word 0xfaf38e80  ! 373: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb57da401  ! 375: MOVR_I	movre	%r22, 0x1, %r26
	.word 0xf055e0b3  ! 378: LDSH_I	ldsh	[%r23 + 0x00b3], %r24
cpu_intr_2_33:
	setx	0x1f0111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_34:
	setx	0x1f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_24:
	mov	0x23, %r14
	.word 0xfadb8e40  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf4156103  ! 386: LDUH_I	lduh	[%r21 + 0x0103], %r26
T2_asi_reg_rd_25:
	mov	0xb, %r14
	.word 0xfedb89e0  ! 388: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf40d0000  ! 390: LDUB_R	ldub	[%r20 + %r0], %r26
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 2b)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf85d4000  ! 394: LDX_R	ldx	[%r21 + %r0], %r28
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, c)
	.word 0xf8d48020  ! 398: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
cpu_intr_2_35:
	setx	0x1f013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedce1f3  ! 401: LDXA_I	ldxa	[%r19, + 0x01f3] %asi, %r31
cpu_intr_2_36:
	setx	0x1e0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf455a0f4  ! 404: LDSH_I	ldsh	[%r22 + 0x00f4], %r26
T2_asi_reg_rd_26:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 405: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_37:
	setx	0x1e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa05215a  ! 408: LDUW_I	lduw	[%r20 + 0x015a], %r29
	.word 0xb63ce09b  ! 409: XNOR_I	xnor 	%r19, 0x009b, %r27
cpu_intr_2_38:
	setx	0x1e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80ca0b4  ! 414: LDUB_I	ldub	[%r18 + 0x00b4], %r28
	.word 0xf415c000  ! 416: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xf8dca108  ! 419: LDXA_I	ldxa	[%r18, + 0x0108] %asi, %r28
T2_asi_reg_wr_21:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 421: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 3)
	.word 0xfe4521f4  ! 423: LDSW_I	ldsw	[%r20 + 0x01f4], %r31
	.word 0xf2140000  ! 428: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xf284a1fb  ! 434: LDUWA_I	lduwa	[%r18, + 0x01fb] %asi, %r25
cpu_intr_2_39:
	setx	0x1c0138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_40:
	setx	0x1f0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e18  ! 448: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e18, %hpstate
	.word 0xfe458000  ! 451: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xf0950020  ! 452: LDUHA_R	lduha	[%r20, %r0] 0x01, %r24
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983cd8  ! 453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd8, %hpstate
cpu_intr_2_41:
	setx	0x21030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e8a  ! 458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8a, %hpstate
T2_asi_reg_rd_27:
	mov	0x28, %r14
	.word 0xf6db89e0  ! 461: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbab5607a  ! 464: SUBCcc_I	orncc 	%r21, 0x007a, %r29
	.word 0xfa84c020  ! 465: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r29
T2_asi_reg_wr_22:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 466: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
	.word 0xb8ad601c  ! 470: ANDNcc_I	andncc 	%r21, 0x001c, %r28
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 24)
	.word 0xf8d48020  ! 474: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
	.word 0xfcc56123  ! 476: LDSWA_I	ldswa	[%r21, + 0x0123] %asi, %r30
	.word 0xfe54c000  ! 478: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xbeac8000  ! 480: ANDNcc_R	andncc 	%r18, %r0, %r31
	.word 0xf4d4a120  ! 481: LDSHA_I	ldsha	[%r18, + 0x0120] %asi, %r26
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_42:
	setx	0x200039, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_28:
	mov	0x16, %r14
	.word 0xfedb8400  ! 489: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_43:
	setx	0x220328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ccc020  ! 491: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r25
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 8)
	.word 0xfe1520d2  ! 502: LDUH_I	lduh	[%r20 + 0x00d2], %r31
T2_asi_reg_wr_23:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 504: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfe95e04b  ! 505: LDUHA_I	lduha	[%r23, + 0x004b] %asi, %r31
cpu_intr_2_44:
	setx	0x20011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_24:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 510: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_29:
	mov	0x3c2, %r14
	.word 0xf0db89e0  ! 512: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf0dc60db  ! 513: LDXA_I	ldxa	[%r17, + 0x00db] %asi, %r24
	.word 0xf2c46118  ! 515: LDSWA_I	ldswa	[%r17, + 0x0118] %asi, %r25
	.word 0xf04d60b8  ! 516: LDSB_I	ldsb	[%r21 + 0x00b8], %r24
cpu_intr_2_45:
	setx	0x23030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_25:
	mov	0x6, %r14
	.word 0xf8f38e80  ! 518: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf8854020  ! 519: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r28
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_26:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 523: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_46:
	setx	0x210233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb604a094  ! 528: ADD_I	add 	%r18, 0x0094, %r27
	.word 0xfe0ca05c  ! 530: LDUB_I	ldub	[%r18 + 0x005c], %r31
	.word 0xf414e197  ! 531: LDUH_I	lduh	[%r19 + 0x0197], %r26
	.word 0xfc4d8000  ! 532: LDSB_R	ldsb	[%r22 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_27:
	mov	0x34, %r14
	.word 0xf6f389e0  ! 538: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfed4211d  ! 547: LDSHA_I	ldsha	[%r16, + 0x011d] %asi, %r31
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfccc8020  ! 549: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r30
	.word 0xfa4d4000  ! 551: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf8dde081  ! 555: LDXA_I	ldxa	[%r23, + 0x0081] %asi, %r28
	.word 0xf4c48020  ! 560: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
	.word 0xfc0d6194  ! 561: LDUB_I	ldub	[%r21 + 0x0194], %r30
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_28:
	mov	0x26, %r14
	.word 0xf6f38e80  ! 565: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_47:
	setx	0x23003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb035c000  ! 570: SUBC_R	orn 	%r23, %r0, %r24
	.word 0xf4c5c020  ! 571: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r26
cpu_intr_2_48:
	setx	0x23000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_49:
	setx	0x22030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca5a0ec  ! 574: SUBcc_I	subcc 	%r22, 0x00ec, %r30
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_50:
	setx	0x22020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_51:
	setx	0x220218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf615a00e  ! 583: LDUH_I	lduh	[%r22 + 0x000e], %r27
cpu_intr_2_52:
	setx	0x210135, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_29:
	mov	0x3c4, %r14
	.word 0xfaf38e60  ! 590: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfa54e079  ! 593: LDSH_I	ldsh	[%r19 + 0x0079], %r29
cpu_intr_2_53:
	setx	0x23023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_54:
	setx	0x210333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_55:
	setx	0x210338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d4607f  ! 601: LDSHA_I	ldsha	[%r17, + 0x007f] %asi, %r25
T2_asi_reg_wr_30:
	mov	0xd, %r14
	.word 0xfef38400  ! 603: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, b)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_56:
	setx	0x210304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65d4000  ! 613: LDX_R	ldx	[%r21 + %r0], %r27
T2_asi_reg_wr_31:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 614: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf00cc000  ! 615: LDUB_R	ldub	[%r19 + %r0], %r24
cpu_intr_2_57:
	setx	0x210202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_wr_32:
	mov	0x27, %r14
	.word 0xf8f38400  ! 619: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_58:
	setx	0x230021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_59:
	setx	0x200031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83d4000  ! 627: XNOR_R	xnor 	%r21, %r0, %r28
cpu_intr_2_60:
	setx	0x210208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_61:
	setx	0x21012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_62:
	setx	0x220000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_63:
	setx	0x21013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d420e4  ! 636: LDSHA_I	ldsha	[%r16, + 0x00e4] %asi, %r28
cpu_intr_2_64:
	setx	0x220231, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_65:
	setx	0x220225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_66:
	setx	0x230234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 23)
	.word 0xfe0d20bf  ! 654: LDUB_I	ldub	[%r20 + 0x00bf], %r31
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 16)
	.word 0xf68dc020  ! 658: LDUBA_R	lduba	[%r23, %r0] 0x01, %r27
cpu_intr_2_67:
	setx	0x23002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa14c000  ! 664: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0xba948000  ! 665: ORcc_R	orcc 	%r18, %r0, %r29
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, c)
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf414c000  ! 671: LDUH_R	lduh	[%r19 + %r0], %r26
cpu_intr_2_68:
	setx	0x220105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2d60c1  ! 675: ANDN_I	andn 	%r21, 0x00c1, %r31
	.word 0xbe04e077  ! 676: ADD_I	add 	%r19, 0x0077, %r31
	ta	T_CHANGE_NONHPRIV
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 2)
	.word 0xfe0d4000  ! 680: LDUB_R	ldub	[%r21 + %r0], %r31
cpu_intr_2_69:
	setx	0x200113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48c4020  ! 682: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf405c000  ! 685: LDUW_R	lduw	[%r23 + %r0], %r26
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf64460f6  ! 692: LDSW_I	ldsw	[%r17 + 0x00f6], %r27
	.word 0xfcd4c020  ! 694: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r30
T2_asi_reg_rd_30:
	mov	0x6, %r14
	.word 0xf2db8e40  ! 696: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 35)
	.word 0xf25d2122  ! 701: LDX_I	ldx	[%r20 + 0x0122], %r25
	.word 0xbe9de0ee  ! 702: XORcc_I	xorcc 	%r23, 0x00ee, %r31
cpu_intr_2_70:
	setx	0x20032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_31:
	mov	0x38, %r14
	.word 0xf4db89e0  ! 705: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfc554000  ! 708: LDSH_R	ldsh	[%r21 + %r0], %r30
T2_asi_reg_rd_32:
	mov	0x13, %r14
	.word 0xf4db8e80  ! 709: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_rd_33:
	mov	0x7, %r14
	.word 0xf2db8e80  ! 712: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_rd_34:
	mov	0x20, %r14
	.word 0xfcdb8e60  ! 713: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xba954000  ! 723: ORcc_R	orcc 	%r21, %r0, %r29
	.word 0xf0d54020  ! 727: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r24
cpu_intr_2_71:
	setx	0x23021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3641800  ! 730: MOVcc_R	<illegal instruction>
	.word 0xfacde03c  ! 731: LDSBA_I	ldsba	[%r23, + 0x003c] %asi, %r29
	.word 0xf80c8000  ! 732: LDUB_R	ldub	[%r18 + %r0], %r28
cpu_intr_2_72:
	setx	0x220207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea54000  ! 738: SUBcc_R	subcc 	%r21, %r0, %r31
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_73:
	setx	0x20030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf4558000  ! 747: LDSH_R	ldsh	[%r22 + %r0], %r26
T2_asi_reg_wr_33:
	mov	0x4, %r14
	.word 0xfaf38e80  ! 749: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
	.word 0xb68d8000  ! 754: ANDcc_R	andcc 	%r22, %r0, %r27
	.word 0xf885e1ec  ! 756: LDUWA_I	lduwa	[%r23, + 0x01ec] %asi, %r28
	.word 0xfe04a113  ! 757: LDUW_I	lduw	[%r18 + 0x0113], %r31
T2_asi_reg_rd_35:
	mov	0x29, %r14
	.word 0xfedb8e80  ! 758: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_2_74:
	setx	0x22011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_36:
	mov	0x1d, %r14
	.word 0xf0db8e40  ! 761: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_rd_37:
	mov	0x3c0, %r14
	.word 0xfadb8e80  ! 763: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_wr_34:
	mov	0x22, %r14
	.word 0xf8f389e0  ! 765: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983dda  ! 769: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dda, %hpstate
	.word 0xbe25e0c5  ! 770: SUB_I	sub 	%r23, 0x00c5, %r31
	.word 0xf2858020  ! 772: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r25
	.word 0xbd2cb001  ! 773: SLLX_I	sllx	%r18, 0x0001, %r30
	.word 0xf0dca079  ! 776: LDXA_I	ldxa	[%r18, + 0x0079] %asi, %r24
	.word 0xf8858020  ! 777: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
	.word 0xb734d000  ! 779: SRLX_R	srlx	%r19, %r0, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xfe850020  ! 782: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r31
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 1c)
	.word 0x8f902000  ! 785: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_TO_TL1
	.word 0xf4840020  ! 788: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982e80  ! 790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e80, %hpstate
cpu_intr_2_75:
	setx	0x21032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dca032  ! 793: LDXA_I	ldxa	[%r18, + 0x0032] %asi, %r25
	.word 0xf00c0000  ! 794: LDUB_R	ldub	[%r16 + %r0], %r24
	.word 0xbb2c2001  ! 795: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0xfc558000  ! 796: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xfe550000  ! 797: LDSH_R	ldsh	[%r20 + %r0], %r31
	ta	T_CHANGE_TO_TL1
	.word 0xfc4dc000  ! 800: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xbf3c7001  ! 801: SRAX_I	srax	%r17, 0x0001, %r31
T2_asi_reg_rd_38:
	mov	0x24, %r14
	.word 0xfadb8400  ! 802: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_wr_35:
	mov	0x26, %r14
	.word 0xf6f38e60  ! 803: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_rd_39:
	mov	0x2, %r14
	.word 0xf4db8e40  ! 809: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbc0d0000  ! 811: AND_R	and 	%r20, %r0, %r30
	.word 0xfc0ca1b8  ! 812: LDUB_I	ldub	[%r18 + 0x01b8], %r30
	.word 0xb32c4000  ! 815: SLL_R	sll 	%r17, %r0, %r25
T2_asi_reg_wr_36:
	mov	0x2d, %r14
	.word 0xf8f38e80  ! 817: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb815a182  ! 818: OR_I	or 	%r22, 0x0182, %r28
	.word 0xf885e005  ! 819: LDUWA_I	lduwa	[%r23, + 0x0005] %asi, %r28
T2_asi_reg_wr_37:
	mov	0xa, %r14
	.word 0xf4f38e60  ! 821: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_38:
	mov	0x31, %r14
	.word 0xf8f38400  ! 824: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf045a00d  ! 825: LDSW_I	ldsw	[%r22 + 0x000d], %r24
	.word 0xfcc54020  ! 829: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r30
cpu_intr_2_76:
	setx	0x230208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64cc000  ! 831: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xfe95c020  ! 833: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
	.word 0xb72d4000  ! 834: SLL_R	sll 	%r21, %r0, %r27
T2_asi_reg_wr_39:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 835: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfcd48020  ! 836: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r30
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_rd_40:
	mov	0xf, %r14
	.word 0xf8db89e0  ! 838: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb9359000  ! 840: SRLX_R	srlx	%r22, %r0, %r28
	.word 0xf615e195  ! 841: LDUH_I	lduh	[%r23 + 0x0195], %r27
	.word 0xf48da03c  ! 842: LDUBA_I	lduba	[%r22, + 0x003c] %asi, %r26
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_41:
	mov	0x16, %r14
	.word 0xf6db8e80  ! 848: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_77:
	setx	0x20011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 3b)
	.word 0xb0240000  ! 851: SUB_R	sub 	%r16, %r0, %r24
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 1a)
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982a82  ! 857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a82, %hpstate
cpu_intr_2_78:
	setx	0x210201, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_42:
	mov	0x14, %r14
	.word 0xfedb8e60  ! 861: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xfe4d4000  ! 864: LDSB_R	ldsb	[%r21 + %r0], %r31
T2_asi_reg_rd_43:
	mov	0x3c2, %r14
	.word 0xf2db8400  ! 866: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_79:
	setx	0x23033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_40:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 877: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_80:
	setx	0x230126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13d0000  ! 880: SRA_R	sra 	%r20, %r0, %r24
cpu_intr_2_81:
	setx	0x230218, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_44:
	mov	0xf, %r14
	.word 0xf8db8400  ! 886: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_TO_TL1
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_82:
	setx	0x250327, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_45:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 897: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_2_83:
	setx	0x270023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24ce196  ! 901: LDSB_I	ldsb	[%r19 + 0x0196], %r25
	.word 0xfc0ce133  ! 903: LDUB_I	ldub	[%r19 + 0x0133], %r30
cpu_intr_2_84:
	setx	0x250337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_85:
	setx	0x260039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_86:
	setx	0x270008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d5000  ! 912: SLLX_R	sllx	%r21, %r0, %r25
	.word 0xf0cde0d4  ! 913: LDSBA_I	ldsba	[%r23, + 0x00d4] %asi, %r24
cpu_intr_2_87:
	setx	0x240112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_88:
	setx	0x24010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8d20d7  ! 916: LDUBA_I	lduba	[%r20, + 0x00d7] %asi, %r29
	.word 0xf0cd0020  ! 917: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r24
T2_asi_reg_rd_46:
	mov	0x18, %r14
	.word 0xfadb8e60  ! 918: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 9)
	.word 0xfed42040  ! 920: LDSHA_I	ldsha	[%r16, + 0x0040] %asi, %r31
	.word 0xf04da02b  ! 922: LDSB_I	ldsb	[%r22 + 0x002b], %r24
cpu_intr_2_89:
	setx	0x240012, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_41:
	mov	0x18, %r14
	.word 0xf0f38e80  ! 926: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf495c020  ! 930: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf24c6011  ! 932: LDSB_I	ldsb	[%r17 + 0x0011], %r25
T2_asi_reg_rd_47:
	mov	0x24, %r14
	.word 0xf8db8e60  ! 935: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf64d20c5  ! 936: LDSB_I	ldsb	[%r20 + 0x00c5], %r27
	.word 0xb685c000  ! 938: ADDcc_R	addcc 	%r23, %r0, %r27
	.word 0xf05c21f2  ! 939: LDX_I	ldx	[%r16 + 0x01f2], %r24
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_90:
	setx	0x25011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2454000  ! 942: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xb6956024  ! 944: ORcc_I	orcc 	%r21, 0x0024, %r27
T2_asi_reg_wr_42:
	mov	0x11, %r14
	.word 0xfef38e40  ! 945: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbf35e001  ! 951: SRL_I	srl 	%r23, 0x0001, %r31
	.word 0xfc84c020  ! 952: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r30
	.word 0xb09d20b2  ! 954: XORcc_I	xorcc 	%r20, 0x00b2, %r24
	.word 0xba9d200b  ! 958: XORcc_I	xorcc 	%r20, 0x000b, %r29
	.word 0xf454610b  ! 959: LDSH_I	ldsh	[%r17 + 0x010b], %r26
	.word 0xf4c560ac  ! 962: LDSWA_I	ldswa	[%r21, + 0x00ac] %asi, %r26
T2_asi_reg_wr_43:
	mov	0x38, %r14
	.word 0xf0f38e40  ! 964: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf2dde1cd  ! 965: LDXA_I	ldxa	[%r23, + 0x01cd] %asi, %r25
T2_asi_reg_wr_44:
	mov	0x3c4, %r14
	.word 0xf2f38e60  ! 967: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbeace18e  ! 968: ANDNcc_I	andncc 	%r19, 0x018e, %r31
	.word 0xf84c4000  ! 970: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xfed4c020  ! 971: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 4)
	.word 0xfa0d8000  ! 976: LDUB_R	ldub	[%r22 + %r0], %r29
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 22)
	.word 0xf44da052  ! 982: LDSB_I	ldsb	[%r22 + 0x0052], %r26
	.word 0xb2c40000  ! 984: ADDCcc_R	addccc 	%r16, %r0, %r25
cpu_intr_2_91:
	setx	0x260312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf854c000  ! 988: LDSH_R	ldsh	[%r19 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_45:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 993: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_wr_46:
	mov	0x2f, %r14
	.word 0xfef38e80  ! 996: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_2_92:
	setx	0x260105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa85a157  ! 1001: LDUWA_I	lduwa	[%r22, + 0x0157] %asi, %r29
	.word 0xf0c42067  ! 1003: LDSWA_I	ldswa	[%r16, + 0x0067] %asi, %r24
T2_asi_reg_rd_48:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 1007: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf2c5c020  ! 1014: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
T2_asi_reg_rd_49:
	mov	0x38, %r14
	.word 0xf2db89e0  ! 1015: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_rd_50:
	mov	0x2e, %r14
	.word 0xf0db8e60  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_93:
	setx	0x27013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_94:
	setx	0x250136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_rd_51:
	mov	0x32, %r14
	.word 0xfcdb8e40  ! 1028: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_rd_52:
	mov	0x28, %r14
	.word 0xf2db8e60  ! 1031: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfa5c4000  ! 1034: LDX_R	ldx	[%r17 + %r0], %r29
T2_asi_reg_rd_53:
	mov	0xb, %r14
	.word 0xf6db8e60  ! 1035: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_95:
	setx	0x270036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec4e05d  ! 1039: LDSWA_I	ldswa	[%r19, + 0x005d] %asi, %r31
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 10)
	.word 0xf8140000  ! 1050: LDUH_R	lduh	[%r16 + %r0], %r28
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 32)
	.word 0xb21da1f4  ! 1052: XOR_I	xor 	%r22, 0x01f4, %r25
	.word 0xf2cc4020  ! 1053: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r25
	.word 0xf88ce09d  ! 1055: LDUBA_I	lduba	[%r19, + 0x009d] %asi, %r28
T2_asi_reg_wr_47:
	mov	0x2b, %r14
	.word 0xf6f384a0  ! 1060: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfe5c4000  ! 1061: LDX_R	ldx	[%r17 + %r0], %r31
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf64ca15f  ! 1065: LDSB_I	ldsb	[%r18 + 0x015f], %r27
	.word 0xf094a141  ! 1066: LDUHA_I	lduha	[%r18, + 0x0141] %asi, %r24
	.word 0xb53c3001  ! 1071: SRAX_I	srax	%r16, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_96:
	setx	0x250315, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_48:
	mov	0x1d, %r14
	.word 0xf8f38e60  ! 1076: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_97:
	setx	0x250030, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_54:
	mov	0x36, %r14
	.word 0xfedb8e60  ! 1082: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 16)
	ta	T_CHANGE_TO_TL0
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_wr_49:
	mov	0x1a, %r14
	.word 0xf0f38400  ! 1089: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_98:
	setx	0x24020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b4e194  ! 1095: SUBCcc_I	orncc 	%r19, 0x0194, %r25
	.word 0xf8d5a168  ! 1098: LDSHA_I	ldsha	[%r22, + 0x0168] %asi, %r28
	.word 0xf08420d8  ! 1099: LDUWA_I	lduwa	[%r16, + 0x00d8] %asi, %r24
cpu_intr_2_99:
	setx	0x240106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_100:
	setx	0x27003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf414a015  ! 1102: LDUH_I	lduh	[%r18 + 0x0015], %r26
cpu_intr_2_101:
	setx	0x270034, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_50:
	mov	0x34, %r14
	.word 0xf4f389e0  ! 1106: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfc44e08b  ! 1108: LDSW_I	ldsw	[%r19 + 0x008b], %r30
cpu_intr_2_102:
	setx	0x25000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_103:
	setx	0x240222, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_55:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 1114: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	ta	T_CHANGE_TO_TL1
cpu_intr_2_104:
	setx	0x24000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc05a0fd  ! 1119: LDUW_I	lduw	[%r22 + 0x00fd], %r30
	.word 0xf2846084  ! 1120: LDUWA_I	lduwa	[%r17, + 0x0084] %asi, %r25
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 8)
	.word 0xf045c000  ! 1126: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xbf504000  ! 1128: RDPR_TNPC	<illegal instruction>
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 2c)
	.word 0xb60c0000  ! 1133: AND_R	and 	%r16, %r0, %r27
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_105:
	setx	0x24011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_106:
	setx	0x26010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_107:
	setx	0x26001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_108:
	setx	0x24023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_109:
	setx	0x27023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec44020  ! 1154: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
T2_asi_reg_rd_56:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 1156: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf054e02d  ! 1157: LDSH_I	ldsh	[%r19 + 0x002d], %r24
	.word 0xbec4e058  ! 1158: ADDCcc_I	addccc 	%r19, 0x0058, %r31
cpu_intr_2_110:
	setx	0x260121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4dd61ca  ! 1160: LDXA_I	ldxa	[%r21, + 0x01ca] %asi, %r26
cpu_intr_2_111:
	setx	0x26001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_wr_51:
	mov	0x1c, %r14
	.word 0xfcf38e60  ! 1165: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_57:
	mov	0x3c5, %r14
	.word 0xfadb8400  ! 1166: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfed58020  ! 1168: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
	.word 0xf84dc000  ! 1170: LDSB_R	ldsb	[%r23 + %r0], %r28
T2_asi_reg_wr_52:
	mov	0x26, %r14
	.word 0xfef389e0  ! 1172: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_53:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 1177: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfc14e0c7  ! 1183: LDUH_I	lduh	[%r19 + 0x00c7], %r30
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983812  ! 1184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1812, %hpstate
	.word 0xf6440000  ! 1185: LDSW_R	ldsw	[%r16 + %r0], %r27
	.word 0xf4d50020  ! 1189: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r26
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983818  ! 1194: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1818, %hpstate
	.word 0xfcdd6179  ! 1195: LDXA_I	ldxa	[%r21, + 0x0179] %asi, %r30
cpu_intr_2_112:
	setx	0x270307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf295a096  ! 1198: LDUHA_I	lduha	[%r22, + 0x0096] %asi, %r25
	.word 0xf20dc000  ! 1200: LDUB_R	ldub	[%r23 + %r0], %r25
cpu_intr_2_113:
	setx	0x27033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_58:
	mov	0x35, %r14
	.word 0xf2db8e60  ! 1202: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf6046021  ! 1203: LDUW_I	lduw	[%r17 + 0x0021], %r27
T2_asi_reg_wr_54:
	mov	0x2c, %r14
	.word 0xf4f38e40  ! 1207: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_114:
	setx	0x24031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, a)
	.word 0xf8548000  ! 1212: LDSH_R	ldsh	[%r18 + %r0], %r28
	ta	T_CHANGE_HPRIV
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 8)
	.word 0xf0858020  ! 1216: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
	.word 0xfe8c6183  ! 1217: LDUBA_I	lduba	[%r17, + 0x0183] %asi, %r31
	.word 0xf8cd4020  ! 1219: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r28
	.word 0xfe4d4000  ! 1223: LDSB_R	ldsb	[%r21 + %r0], %r31
cpu_intr_2_115:
	setx	0x270314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_116:
	setx	0x250126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa840020  ! 1226: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
	ta	T_CHANGE_HPRIV
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819829d8  ! 1229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d8, %hpstate
	ta	T_CHANGE_TO_TL0
cpu_intr_2_117:
	setx	0x240017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, e)
	.word 0xf654e059  ! 1236: LDSH_I	ldsh	[%r19 + 0x0059], %r27
	.word 0xb8a5a1e8  ! 1237: SUBcc_I	subcc 	%r22, 0x01e8, %r28
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 8)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf80d6145  ! 1241: LDUB_I	ldub	[%r21 + 0x0145], %r28
cpu_intr_2_118:
	setx	0x25030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c421df  ! 1244: LDSWA_I	ldswa	[%r16, + 0x01df] %asi, %r28
	.word 0xb02c4000  ! 1250: ANDN_R	andn 	%r17, %r0, %r24
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x8198295a  ! 1251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095a, %hpstate
	.word 0xf01561ee  ! 1252: LDUH_I	lduh	[%r21 + 0x01ee], %r24
T2_asi_reg_rd_59:
	mov	0xa, %r14
	.word 0xfcdb8e80  ! 1254: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 19)
	ta	T_CHANGE_NONHPRIV
	.word 0xf25461bb  ! 1258: LDSH_I	ldsh	[%r17 + 0x01bb], %r25
	.word 0xf45460cb  ! 1259: LDSH_I	ldsh	[%r17 + 0x00cb], %r26
	.word 0xb5347001  ! 1265: SRLX_I	srlx	%r17, 0x0001, %r26
	.word 0xf25c4000  ! 1267: LDX_R	ldx	[%r17 + %r0], %r25
cpu_intr_2_119:
	setx	0x270301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8444000  ! 1270: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xf6c4c020  ! 1275: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r27
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_60:
	mov	0x19, %r14
	.word 0xf4db8e60  ! 1278: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf48da1c7  ! 1280: LDUBA_I	lduba	[%r22, + 0x01c7] %asi, %r26
	.word 0xf6d52135  ! 1281: LDSHA_I	ldsha	[%r20, + 0x0135] %asi, %r27
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, c)
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 33)
	.word 0xf8d44020  ! 1286: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r28
T2_asi_reg_rd_61:
	mov	0x3c2, %r14
	.word 0xfedb89e0  ! 1288: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_NONHPRIV
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_55:
	mov	0x27, %r14
	.word 0xf6f38e40  ! 1292: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_120:
	setx	0x240210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2d3001  ! 1297: SLLX_I	sllx	%r20, 0x0001, %r30
	.word 0xbc35c000  ! 1304: SUBC_R	orn 	%r23, %r0, %r30
T2_asi_reg_wr_56:
	mov	0x3, %r14
	.word 0xfef38e40  ! 1305: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_121:
	setx	0x240235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7643801  ! 1310: MOVcc_I	<illegal instruction>
	.word 0xfe058000  ! 1312: LDUW_R	lduw	[%r22 + %r0], %r31
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_57:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 1318: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_58:
	mov	0x19, %r14
	.word 0xfef38e80  ! 1322: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_62:
	mov	0x8, %r14
	.word 0xf8db89e0  ! 1324: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf80d0000  ! 1326: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xf0c520a9  ! 1327: LDSWA_I	ldswa	[%r20, + 0x00a9] %asi, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xf0dca078  ! 1330: LDXA_I	ldxa	[%r18, + 0x0078] %asi, %r24
	.word 0xb53ce001  ! 1336: SRA_I	sra 	%r19, 0x0001, %r26
	.word 0xf4d5c020  ! 1337: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r26
	.word 0xfe15c000  ! 1338: LDUH_R	lduh	[%r23 + %r0], %r31
T2_asi_reg_wr_59:
	mov	0xf, %r14
	.word 0xfaf38e80  ! 1339: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_122:
	setx	0x25001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 18)
	.word 0xf44c6119  ! 1343: LDSB_I	ldsb	[%r17 + 0x0119], %r26
	.word 0xb4854000  ! 1348: ADDcc_R	addcc 	%r21, %r0, %r26
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_rd_63:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 1350: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf214c000  ! 1353: LDUH_R	lduh	[%r19 + %r0], %r25
	ta	T_CHANGE_TO_TL0
	.word 0xf2cd0020  ! 1355: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_123:
	setx	0x270327, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_64:
	mov	0x2c, %r14
	.word 0xf4db8e80  ! 1359: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_124:
	setx	0x250225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_125:
	setx	0x25031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecda1fa  ! 1368: LDSBA_I	ldsba	[%r22, + 0x01fa] %asi, %r31
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_126:
	setx	0x260132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_127:
	setx	0x260139, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983ec0  ! 1375: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec0, %hpstate
cpu_intr_2_128:
	setx	0x27003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49d4000  ! 1378: XORcc_R	xorcc 	%r21, %r0, %r26
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_wr_60:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 1385: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_wr_61:
	mov	0x26, %r14
	.word 0xf4f38e60  ! 1392: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_129:
	setx	0x2b0039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_130:
	setx	0x2a0212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_131:
	setx	0x290038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8540000  ! 1397: LDSH_R	ldsh	[%r16 + %r0], %r28
T2_asi_reg_wr_62:
	mov	0x28, %r14
	.word 0xfef38400  ! 1401: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 14)
	.word 0xf645c000  ! 1405: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xf2044000  ! 1407: LDUW_R	lduw	[%r17 + %r0], %r25
T2_asi_reg_wr_63:
	mov	0x3c8, %r14
	.word 0xf6f38e60  ! 1410: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf405a0e1  ! 1411: LDUW_I	lduw	[%r22 + 0x00e1], %r26
	.word 0xfecc0020  ! 1415: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r31
	.word 0xf0444000  ! 1416: LDSW_R	ldsw	[%r17 + %r0], %r24
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a88  ! 1417: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a88, %hpstate
	.word 0xfe8c20cc  ! 1418: LDUBA_I	lduba	[%r16, + 0x00cc] %asi, %r31
	.word 0xf2440000  ! 1422: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xf2554000  ! 1425: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xb204c000  ! 1427: ADD_R	add 	%r19, %r0, %r25
	.word 0xfa8dc020  ! 1429: LDUBA_R	lduba	[%r23, %r0] 0x01, %r29
T2_asi_reg_wr_64:
	mov	0x29, %r14
	.word 0xf4f38e40  ! 1430: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_65:
	mov	0x2f, %r14
	.word 0xfaf38e60  ! 1433: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfa4da0cc  ! 1434: LDSB_I	ldsb	[%r22 + 0x00cc], %r29
	.word 0xf4044000  ! 1435: LDUW_R	lduw	[%r17 + %r0], %r26
	ta	T_CHANGE_TO_TL0
cpu_intr_2_132:
	setx	0x2a0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5c8000  ! 1443: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xf0958020  ! 1446: LDUHA_R	lduha	[%r22, %r0] 0x01, %r24
T2_asi_reg_wr_66:
	mov	0x27, %r14
	.word 0xfcf38e80  ! 1447: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf4c54020  ! 1448: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r26
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_133:
	setx	0x290100, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_67:
	mov	0x0, %r14
	.word 0xf6f38e60  ! 1456: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_65:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 1464: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f02  ! 1467: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f02, %hpstate
	.word 0xfccc2111  ! 1468: LDSBA_I	ldsba	[%r16, + 0x0111] %asi, %r30
	.word 0xb4bd2041  ! 1472: XNORcc_I	xnorcc 	%r20, 0x0041, %r26
	.word 0xfc05a045  ! 1475: LDUW_I	lduw	[%r22 + 0x0045], %r30
cpu_intr_2_134:
	setx	0x2b021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_135:
	setx	0x2b0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68d21ad  ! 1489: LDUBA_I	lduba	[%r20, + 0x01ad] %asi, %r27
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198299a  ! 1494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099a, %hpstate
	.word 0xfe44e17a  ! 1497: LDSW_I	ldsw	[%r19 + 0x017a], %r31
	.word 0xf88dc020  ! 1500: LDUBA_R	lduba	[%r23, %r0] 0x01, %r28
T2_asi_reg_wr_68:
	mov	0x29, %r14
	.word 0xfcf384a0  ! 1501: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_wr_69:
	mov	0x1a, %r14
	.word 0xfaf38e60  ! 1507: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf60c617a  ! 1512: LDUB_I	ldub	[%r17 + 0x017a], %r27
	.word 0xf6150000  ! 1513: LDUH_R	lduh	[%r20 + %r0], %r27
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 5)
	.word 0xf885a01f  ! 1515: LDUWA_I	lduwa	[%r22, + 0x001f] %asi, %r28
	.word 0xf2444000  ! 1516: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0xfa45e183  ! 1519: LDSW_I	ldsw	[%r23 + 0x0183], %r29
	.word 0xbb50c000  ! 1520: RDPR_TT	rdpr	%tt, %r29
	ta	T_CHANGE_TO_TL1
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_66:
	mov	0x20, %r14
	.word 0xf4db89e0  ! 1523: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb534f001  ! 1526: SRLX_I	srlx	%r19, 0x0001, %r26
	.word 0xf615e0c6  ! 1527: LDUH_I	lduh	[%r23 + 0x00c6], %r27
T2_asi_reg_wr_70:
	mov	0x25, %r14
	.word 0xfef38e40  ! 1529: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_67:
	mov	0x24, %r14
	.word 0xf8db8e60  ! 1530: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_wr_71:
	mov	0xf, %r14
	.word 0xfaf38e80  ! 1534: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_rd_68:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 1538: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T2_asi_reg_rd_69:
	mov	0x15, %r14
	.word 0xf6db8400  ! 1540: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_wr_72:
	mov	0x2f, %r14
	.word 0xf8f38e60  ! 1542: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf0154000  ! 1543: LDUH_R	lduh	[%r21 + %r0], %r24
	.word 0xf044e03a  ! 1546: LDSW_I	ldsw	[%r19 + 0x003a], %r24
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983e12  ! 1547: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e12, %hpstate
	.word 0xf2d48020  ! 1550: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r25
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 29)
	.word 0xb8c4e077  ! 1555: ADDCcc_I	addccc 	%r19, 0x0077, %r28
T2_asi_reg_rd_70:
	mov	0x1f, %r14
	.word 0xf0db8e40  ! 1558: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_136:
	setx	0x2b0230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_wr_73:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 1567: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_2_137:
	setx	0x2b0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0354000  ! 1570: SUBC_R	orn 	%r21, %r0, %r24
	.word 0xb614e12a  ! 1571: OR_I	or 	%r19, 0x012a, %r27
	.word 0xf45ce1ea  ! 1573: LDX_I	ldx	[%r19 + 0x01ea], %r26
	.word 0xf65d21eb  ! 1574: LDX_I	ldx	[%r20 + 0x01eb], %r27
	.word 0xf00d610c  ! 1575: LDUB_I	ldub	[%r21 + 0x010c], %r24
	.word 0xb615a103  ! 1576: OR_I	or 	%r22, 0x0103, %r27
	.word 0xb494a162  ! 1577: ORcc_I	orcc 	%r18, 0x0162, %r26
	.word 0xf08de03c  ! 1579: LDUBA_I	lduba	[%r23, + 0x003c] %asi, %r24
	.word 0xf654c000  ! 1580: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0xf20dc000  ! 1581: LDUB_R	ldub	[%r23 + %r0], %r25
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_138:
	setx	0x2b0232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_139:
	setx	0x280018, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL0
	.word 0xf4956061  ! 1588: LDUHA_I	lduha	[%r21, + 0x0061] %asi, %r26
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_74:
	mov	0x23, %r14
	.word 0xf2f384a0  ! 1591: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_140:
	setx	0x28033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_141:
	setx	0x2b0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_142:
	setx	0x290132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1d4000  ! 1605: XOR_R	xor 	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_75:
	mov	0x3c7, %r14
	.word 0xf0f389e0  ! 1611: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, f)
	.word 0xfa948020  ! 1613: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
	.word 0xfecd0020  ! 1614: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
	.word 0xf8056098  ! 1616: LDUW_I	lduw	[%r21 + 0x0098], %r28
T2_asi_reg_rd_71:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 1617: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfa9461cd  ! 1618: LDUHA_I	lduha	[%r17, + 0x01cd] %asi, %r29
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 23)
	.word 0xf4444000  ! 1622: LDSW_R	ldsw	[%r17 + %r0], %r26
	.word 0xbf2d4000  ! 1625: SLL_R	sll 	%r21, %r0, %r31
	.word 0xf885214f  ! 1628: LDUWA_I	lduwa	[%r20, + 0x014f] %asi, %r28
	.word 0xf815a168  ! 1629: LDUH_I	lduh	[%r22 + 0x0168], %r28
	.word 0xf0d5e009  ! 1631: LDSHA_I	ldsha	[%r23, + 0x0009] %asi, %r24
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983fca  ! 1632: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fca, %hpstate
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c18  ! 1633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c18, %hpstate
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, a)
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 25)
	.word 0xfa048000  ! 1637: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xf20cc000  ! 1640: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xfe554000  ! 1641: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xbc0d20c8  ! 1644: AND_I	and 	%r20, 0x00c8, %r30
cpu_intr_2_143:
	setx	0x2b0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa85c020  ! 1646: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r29
T2_asi_reg_rd_72:
	mov	0x34, %r14
	.word 0xfadb8e40  ! 1648: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf6c4617b  ! 1650: LDSWA_I	ldswa	[%r17, + 0x017b] %asi, %r27
	.word 0xb23ce075  ! 1653: XNOR_I	xnor 	%r19, 0x0075, %r25
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_wr_76:
	mov	0x3c1, %r14
	.word 0xfcf38e60  ! 1662: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_144:
	setx	0x290310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_73:
	mov	0x0, %r14
	.word 0xf8db84a0  ! 1665: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf405e173  ! 1666: LDUW_I	lduw	[%r23 + 0x0173], %r26
T2_asi_reg_rd_74:
	mov	0x15, %r14
	.word 0xfadb84a0  ! 1667: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb12c4000  ! 1668: SLL_R	sll 	%r17, %r0, %r24
cpu_intr_2_145:
	setx	0x2b0007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 38)
	.word 0xf20c2062  ! 1675: LDUB_I	ldub	[%r16 + 0x0062], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf65d4000  ! 1679: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xfe844020  ! 1680: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 22)
	.word 0xbcb5c000  ! 1683: ORNcc_R	orncc 	%r23, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_77:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 1685: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfc05e0b1  ! 1688: LDUW_I	lduw	[%r23 + 0x00b1], %r30
	.word 0xf24d2149  ! 1689: LDSB_I	ldsb	[%r20 + 0x0149], %r25
T2_asi_reg_wr_78:
	mov	0x15, %r14
	.word 0xf6f38400  ! 1690: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 27)
	.word 0xbc9de1ba  ! 1697: XORcc_I	xorcc 	%r23, 0x01ba, %r30
	.word 0xb13cf001  ! 1698: SRAX_I	srax	%r19, 0x0001, %r24
	.word 0xf0c44020  ! 1700: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r24
	.word 0xfecca0d9  ! 1702: LDSBA_I	ldsba	[%r18, + 0x00d9] %asi, %r31
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_rd_75:
	mov	0x17, %r14
	.word 0xf8db89e0  ! 1704: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf88da198  ! 1707: LDUBA_I	lduba	[%r22, + 0x0198] %asi, %r28
	.word 0xf20c6154  ! 1709: LDUB_I	ldub	[%r17 + 0x0154], %r25
T2_asi_reg_wr_79:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 1710: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_2_146:
	setx	0x2b033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_147:
	setx	0x280005, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_76:
	mov	0x3, %r14
	.word 0xf0db8400  ! 1718: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xb97d0400  ! 1720: MOVR_R	movre	%r20, %r0, %r28
T2_asi_reg_wr_80:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 1723: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf45dc000  ! 1724: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xf0d48020  ! 1729: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r24
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_148:
	setx	0x290010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64d6137  ! 1734: LDSB_I	ldsb	[%r21 + 0x0137], %r27
cpu_intr_2_149:
	setx	0x2b011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_150:
	setx	0x2a010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_77:
	mov	0x6, %r14
	.word 0xf6db8400  ! 1741: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_151:
	setx	0x2b0132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 19)
	.word 0xfe8de068  ! 1746: LDUBA_I	lduba	[%r23, + 0x0068] %asi, %r31
cpu_intr_2_152:
	setx	0x2a0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_81:
	mov	0x3c4, %r14
	.word 0xf4f384a0  ! 1750: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_rd_78:
	mov	0x1a, %r14
	.word 0xf4db8e80  ! 1754: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_153:
	setx	0x2a010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_154:
	setx	0x2a0338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 29)
	.word 0xf805c000  ! 1764: LDUW_R	lduw	[%r23 + %r0], %r28
T2_asi_reg_rd_79:
	mov	0x18, %r14
	.word 0xf0db84a0  ! 1765: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf40d6050  ! 1766: LDUB_I	ldub	[%r21 + 0x0050], %r26
T2_asi_reg_rd_80:
	mov	0x2c, %r14
	.word 0xf4db8e40  ! 1769: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf6d4a1dc  ! 1770: LDSHA_I	ldsha	[%r18, + 0x01dc] %asi, %r27
T2_asi_reg_wr_82:
	mov	0x1b, %r14
	.word 0xf8f38e80  ! 1771: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_rd_81:
	mov	0x3c1, %r14
	.word 0xfedb8e60  ! 1772: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 22)
	.word 0xf894c020  ! 1779: LDUHA_R	lduha	[%r19, %r0] 0x01, %r28
T2_asi_reg_wr_83:
	mov	0x3c0, %r14
	.word 0xf8f38e80  ! 1780: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 30)
	.word 0xf40c4000  ! 1787: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xf2cd617b  ! 1791: LDSBA_I	ldsba	[%r21, + 0x017b] %asi, %r25
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 18)
	.word 0xf8d4e064  ! 1802: LDSHA_I	ldsha	[%r19, + 0x0064] %asi, %r28
T2_asi_reg_wr_84:
	mov	0xe, %r14
	.word 0xf0f38e40  ! 1806: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_155:
	setx	0x2a033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88c4000  ! 1811: ANDcc_R	andcc 	%r17, %r0, %r28
T2_asi_reg_wr_85:
	mov	0x3c7, %r14
	.word 0xf0f38400  ! 1812: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_156:
	setx	0x290222, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_86:
	mov	0x25, %r14
	.word 0xfef38e60  ! 1814: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb435a081  ! 1816: ORN_I	orn 	%r22, 0x0081, %r26
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfe8ca01c  ! 1818: LDUBA_I	lduba	[%r18, + 0x001c] %asi, %r31
cpu_intr_2_157:
	setx	0x2c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 13)
	.word 0xf4c44020  ! 1823: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r26
cpu_intr_2_158:
	setx	0x2c023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64c2158  ! 1827: LDSB_I	ldsb	[%r16 + 0x0158], %r27
T2_asi_reg_rd_82:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 1829: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7350000  ! 1831: SRL_R	srl 	%r20, %r0, %r27
	.word 0xf645e04f  ! 1832: LDSW_I	ldsw	[%r23 + 0x004f], %r27
	.word 0xf805e1a2  ! 1833: LDUW_I	lduw	[%r23 + 0x01a2], %r28
	.word 0xf805a1b8  ! 1835: LDUW_I	lduw	[%r22 + 0x01b8], %r28
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_83:
	mov	0x3c5, %r14
	.word 0xfcdb8e60  ! 1839: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfe444000  ! 1843: LDSW_R	ldsw	[%r17 + %r0], %r31
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 12)
	.word 0xf8440000  ! 1846: LDSW_R	ldsw	[%r16 + %r0], %r28
cpu_intr_2_159:
	setx	0x2c0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_87:
	mov	0x11, %r14
	.word 0xfcf389e0  ! 1852: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_2_160:
	setx	0x2c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_84:
	mov	0x15, %r14
	.word 0xf6db8e40  ! 1859: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL1
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf60c20f0  ! 1866: LDUB_I	ldub	[%r16 + 0x00f0], %r27
T2_asi_reg_rd_85:
	mov	0x2b, %r14
	.word 0xfadb84a0  ! 1867: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, e)
	.word 0xfa044000  ! 1869: LDUW_R	lduw	[%r17 + %r0], %r29
T2_asi_reg_wr_88:
	mov	0x1d, %r14
	.word 0xf0f384a0  ! 1872: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_wr_89:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 1874: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb04421f2  ! 1877: ADDC_I	addc 	%r16, 0x01f2, %r24
	.word 0xbd2d9000  ! 1878: SLLX_R	sllx	%r22, %r0, %r30
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_161:
	setx	0x2f0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_86:
	mov	0x30, %r14
	.word 0xf8db8e40  ! 1887: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_162:
	setx	0x2e0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_87:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb92c0000  ! 1892: SLL_R	sll 	%r16, %r0, %r28
	.word 0xf84c8000  ! 1895: LDSB_R	ldsb	[%r18 + %r0], %r28
cpu_intr_2_163:
	setx	0x2c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, f)
	.word 0xfc4cc000  ! 1902: LDSB_R	ldsb	[%r19 + %r0], %r30
cpu_intr_2_164:
	setx	0x2e0108, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_88:
	mov	0x30, %r14
	.word 0xfcdb84a0  ! 1904: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_rd_89:
	mov	0x3c5, %r14
	.word 0xfadb89e0  ! 1907: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 17)
	.word 0xf894e0ab  ! 1913: LDUHA_I	lduha	[%r19, + 0x00ab] %asi, %r28
cpu_intr_2_165:
	setx	0x2c0327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 3b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_166:
	setx	0x2e0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa156111  ! 1922: LDUH_I	lduh	[%r21 + 0x0111], %r29
cpu_intr_2_167:
	setx	0x2f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_168:
	setx	0x2d033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_90:
	mov	0x28, %r14
	.word 0xf0db8e80  ! 1928: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf2158000  ! 1930: LDUH_R	lduh	[%r22 + %r0], %r25
cpu_intr_2_169:
	setx	0x2c032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf64ca047  ! 1935: LDSB_I	ldsb	[%r18 + 0x0047], %r27
cpu_intr_2_170:
	setx	0x2e0025, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_90:
	mov	0x36, %r14
	.word 0xf4f38e60  ! 1941: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_171:
	setx	0x2c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb634e0ca  ! 1946: SUBC_I	orn 	%r19, 0x00ca, %r27
cpu_intr_2_172:
	setx	0x2d0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc14a1fb  ! 1951: LDUH_I	lduh	[%r18 + 0x01fb], %r30
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 5)
	.word 0xf8dca03f  ! 1954: LDXA_I	ldxa	[%r18, + 0x003f] %asi, %r28
T2_asi_reg_wr_91:
	mov	0x5, %r14
	.word 0xf2f38e80  ! 1958: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_173:
	setx	0x2d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_174:
	setx	0x2f0137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_175:
	setx	0x2e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 4)
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a40  ! 1970: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a40, %hpstate
	.word 0xfa5c61d7  ! 1972: LDX_I	ldx	[%r17 + 0x01d7], %r29
T2_asi_reg_wr_92:
	mov	0x29, %r14
	.word 0xfef38e40  ! 1974: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f02  ! 1976: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f02, %hpstate
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_176:
	setx	0x2c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_177:
	setx	0x2f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf68ca1df  ! 1987: LDUBA_I	lduba	[%r18, + 0x01df] %asi, %r27
	.word 0xf8556144  ! 1989: LDSH_I	ldsh	[%r21 + 0x0144], %r28
	.word 0xfa5de106  ! 1991: LDX_I	ldx	[%r23 + 0x0106], %r29
cpu_intr_2_178:
	setx	0x2c032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec4a0b8  ! 1993: ADDCcc_I	addccc 	%r18, 0x00b8, %r31
cpu_intr_2_179:
	setx	0x2c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_180:
	setx	0x2c0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_181:
	setx	0x2d032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb635e0b7  ! 2014: ORN_I	orn 	%r23, 0x00b7, %r27
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 7)
	.word 0xf65da010  ! 2019: LDX_I	ldx	[%r22 + 0x0010], %r27
T2_asi_reg_wr_93:
	mov	0xd, %r14
	.word 0xf2f384a0  ! 2021: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf0d5e1b7  ! 2024: LDSHA_I	ldsha	[%r23, + 0x01b7] %asi, %r24
	.word 0xf85c8000  ! 2026: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xf44ca1c9  ! 2027: LDSB_I	ldsb	[%r18 + 0x01c9], %r26
	.word 0xbaad4000  ! 2029: ANDNcc_R	andncc 	%r21, %r0, %r29
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_rd_91:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 2040: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf2cc8020  ! 2043: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r25
T2_asi_reg_wr_94:
	mov	0x26, %r14
	.word 0xf4f384a0  ! 2047: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfc84a038  ! 2048: LDUWA_I	lduwa	[%r18, + 0x0038] %asi, %r30
	.word 0xf0550000  ! 2049: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xf6040000  ! 2054: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xf6858020  ! 2056: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r27
	.word 0xf88de082  ! 2058: LDUBA_I	lduba	[%r23, + 0x0082] %asi, %r28
	.word 0xb4248000  ! 2059: SUB_R	sub 	%r18, %r0, %r26
	.word 0xfc9521b1  ! 2060: LDUHA_I	lduha	[%r20, + 0x01b1] %asi, %r30
	.word 0xfcdd21b1  ! 2063: LDXA_I	ldxa	[%r20, + 0x01b1] %asi, %r30
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 28)
	.word 0xf004c000  ! 2068: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xf605e1a8  ! 2069: LDUW_I	lduw	[%r23 + 0x01a8], %r27
	.word 0xb43c6007  ! 2073: XNOR_I	xnor 	%r17, 0x0007, %r26
	ta	T_CHANGE_NONHPRIV
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, b)
	.word 0xf815a0b9  ! 2079: LDUH_I	lduh	[%r22 + 0x00b9], %r28
	.word 0xb6c40000  ! 2082: ADDCcc_R	addccc 	%r16, %r0, %r27
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_95:
	mov	0x11, %r14
	.word 0xfcf38e60  ! 2084: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf85d8000  ! 2088: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xb93c4000  ! 2089: SRA_R	sra 	%r17, %r0, %r28
T2_asi_reg_rd_92:
	mov	0x17, %r14
	.word 0xf8db8e60  ! 2092: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_182:
	setx	0x2c0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d2187  ! 2095: LDX_I	ldx	[%r20 + 0x0187], %r28
cpu_intr_2_183:
	setx	0x2d0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982d88  ! 2097: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d88, %hpstate
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_rd_93:
	mov	0xf, %r14
	.word 0xfedb8e60  ! 2100: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_rd_94:
	mov	0x21, %r14
	.word 0xfedb8e40  ! 2101: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_rd_95:
	mov	0x11, %r14
	.word 0xf0db8e60  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_96:
	mov	0x5, %r14
	.word 0xf8f38e80  ! 2106: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbc35a115  ! 2107: SUBC_I	orn 	%r22, 0x0115, %r30
T2_asi_reg_wr_97:
	mov	0x11, %r14
	.word 0xf8f389e0  ! 2108: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_184:
	setx	0x2c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_185:
	setx	0x2e0105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_186:
	setx	0x2d020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_96:
	mov	0xc, %r14
	.word 0xf2db8e40  ! 2120: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_98:
	mov	0x14, %r14
	.word 0xf0f389e0  ! 2122: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb4c58000  ! 2123: ADDCcc_R	addccc 	%r22, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0xfa44e1e7  ! 2132: LDSW_I	ldsw	[%r19 + 0x01e7], %r29
T2_asi_reg_wr_99:
	mov	0xa, %r14
	.word 0xfef38400  ! 2134: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_187:
	setx	0x2f033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_188:
	setx	0x2e0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cc219a  ! 2138: LDSBA_I	ldsba	[%r16, + 0x019a] %asi, %r26
T2_asi_reg_wr_100:
	mov	0x9, %r14
	.word 0xfef38e40  ! 2141: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf415e06e  ! 2144: LDUH_I	lduh	[%r23 + 0x006e], %r26
	.word 0xf8dd60d0  ! 2147: LDXA_I	ldxa	[%r21, + 0x00d0] %asi, %r28
	.word 0xf005c000  ! 2148: LDUW_R	lduw	[%r23 + %r0], %r24
T2_asi_reg_rd_97:
	mov	0x19, %r14
	.word 0xf2db8e40  ! 2149: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf4d44020  ! 2152: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, a)
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_98:
	mov	0x1b, %r14
	.word 0xf6db8e40  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf04d0000  ! 2157: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xf8d5c020  ! 2159: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r28
cpu_intr_2_189:
	setx	0x2c0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00da1cd  ! 2163: LDUB_I	ldub	[%r22 + 0x01cd], %r24
	.word 0xb215e1d0  ! 2164: OR_I	or 	%r23, 0x01d0, %r25
	.word 0xf88c61f7  ! 2165: LDUBA_I	lduba	[%r17, + 0x01f7] %asi, %r28
	.word 0xfc4d4000  ! 2167: LDSB_R	ldsb	[%r21 + %r0], %r30
cpu_intr_2_190:
	setx	0x2c0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc85c020  ! 2170: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r30
cpu_intr_2_191:
	setx	0x2d0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48c2193  ! 2172: LDUBA_I	lduba	[%r16, + 0x0193] %asi, %r26
	.word 0xb8b40000  ! 2175: ORNcc_R	orncc 	%r16, %r0, %r28
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 17)
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983fca  ! 2177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fca, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0xf0540000  ! 2183: LDSH_R	ldsh	[%r16 + %r0], %r24
cpu_intr_2_192:
	setx	0x2c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5d6185  ! 2188: LDX_I	ldx	[%r21 + 0x0185], %r31
	.word 0xf0442104  ! 2189: LDSW_I	ldsw	[%r16 + 0x0104], %r24
cpu_intr_2_193:
	setx	0x2f0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c561df  ! 2198: LDSWA_I	ldswa	[%r21, + 0x01df] %asi, %r24
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 20)
	.word 0xf644a15b  ! 2200: LDSW_I	ldsw	[%r18 + 0x015b], %r27
cpu_intr_2_194:
	setx	0x2d0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfeccc020  ! 2204: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r31
	.word 0xf8846154  ! 2206: LDUWA_I	lduwa	[%r17, + 0x0154] %asi, %r28
cpu_intr_2_195:
	setx	0x2d0039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_196:
	setx	0x2d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf615c000  ! 2210: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xfc95e0b6  ! 2211: LDUHA_I	lduha	[%r23, + 0x00b6] %asi, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xbe9521c1  ! 2213: ORcc_I	orcc 	%r20, 0x01c1, %r31
	.word 0xf05d8000  ! 2214: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0xf845215e  ! 2223: LDSW_I	ldsw	[%r20 + 0x015e], %r28
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfa4de14e  ! 2230: LDSB_I	ldsb	[%r23 + 0x014e], %r29
	.word 0xfcd40020  ! 2232: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r30
	.word 0xf2cce0c8  ! 2233: LDSBA_I	ldsba	[%r19, + 0x00c8] %asi, %r25
	.word 0xf40560ef  ! 2235: LDUW_I	lduw	[%r21 + 0x00ef], %r26
cpu_intr_2_197:
	setx	0x2d0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_198:
	setx	0x2e022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0421b4  ! 2245: LDUW_I	lduw	[%r16 + 0x01b4], %r31
	.word 0xf805c000  ! 2246: LDUW_R	lduw	[%r23 + %r0], %r28
T2_asi_reg_wr_101:
	mov	0x18, %r14
	.word 0xfef38400  ! 2247: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf0dc2028  ! 2248: LDXA_I	ldxa	[%r16, + 0x0028] %asi, %r24
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfc4dc000  ! 2252: LDSB_R	ldsb	[%r23 + %r0], %r30
T2_asi_reg_wr_102:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 2253: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_103:
	mov	0x12, %r14
	.word 0xfcf38e40  ! 2254: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_99:
	mov	0x3c7, %r14
	.word 0xf6db84a0  ! 2255: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_199:
	setx	0x2f0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dc20c9  ! 2260: LDXA_I	ldxa	[%r16, + 0x00c9] %asi, %r25
	.word 0xf05c4000  ! 2263: LDX_R	ldx	[%r17 + %r0], %r24
cpu_intr_2_200:
	setx	0x2d023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77c8400  ! 2265: MOVR_R	movre	%r18, %r0, %r27
	.word 0xf8cd6024  ! 2266: LDSBA_I	ldsba	[%r21, + 0x0024] %asi, %r28
T2_asi_reg_wr_104:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 2269: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf4058000  ! 2270: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xbc1d6123  ! 2271: XOR_I	xor 	%r21, 0x0123, %r30
	.word 0xfa148000  ! 2272: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xfac58020  ! 2276: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r29
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 29)
	.word 0xbc14c000  ! 2278: OR_R	or 	%r19, %r0, %r30
	.word 0xf694a11e  ! 2281: LDUHA_I	lduha	[%r18, + 0x011e] %asi, %r27
T2_asi_reg_rd_100:
	mov	0x25, %r14
	.word 0xfadb8e40  ! 2283: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf05c8000  ! 2285: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0xfad4c020  ! 2287: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r29
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 39)
	.word 0xf6150000  ! 2291: LDUH_R	lduh	[%r20 + %r0], %r27
T2_asi_reg_rd_101:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 2292: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_201:
	setx	0x2e033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cc0020  ! 2295: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
	.word 0xfa84203b  ! 2297: LDUWA_I	lduwa	[%r16, + 0x003b] %asi, %r29
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 11)
	.word 0xfac560c7  ! 2300: LDSWA_I	ldswa	[%r21, + 0x00c7] %asi, %r29
	.word 0xf80dc000  ! 2301: LDUB_R	ldub	[%r23 + %r0], %r28
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 22)
	.word 0xfe55c000  ! 2305: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xfa05a167  ! 2306: LDUW_I	lduw	[%r22 + 0x0167], %r29
	.word 0xf25521e9  ! 2307: LDSH_I	ldsh	[%r20 + 0x01e9], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_wr_105:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 2316: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_102:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 2319: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf8050000  ! 2325: LDUW_R	lduw	[%r20 + %r0], %r28
cpu_intr_2_202:
	setx	0x300337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 30)
	.word 0xb42da16d  ! 2331: ANDN_I	andn 	%r22, 0x016d, %r26
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983bd8  ! 2333: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd8, %hpstate
	.word 0xbe95c000  ! 2335: ORcc_R	orcc 	%r23, %r0, %r31
T2_asi_reg_wr_106:
	mov	0x5, %r14
	.word 0xfcf38e40  ! 2336: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_203:
	setx	0x300310, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xb83520e7  ! 2342: SUBC_I	orn 	%r20, 0x00e7, %r28
	.word 0xf0d58020  ! 2343: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r24
	.word 0xfac54020  ! 2344: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
	.word 0xf40da0a6  ! 2346: LDUB_I	ldub	[%r22 + 0x00a6], %r26
cpu_intr_2_204:
	setx	0x330114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c50020  ! 2348: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r24
	.word 0xfe1461e2  ! 2353: LDUH_I	lduh	[%r17 + 0x01e2], %r31
	.word 0xfe84e141  ! 2355: LDUWA_I	lduwa	[%r19, + 0x0141] %asi, %r31
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, a)
	ta	T_CHANGE_HPRIV
	.word 0xfe15c000  ! 2366: LDUH_R	lduh	[%r23 + %r0], %r31
	.word 0xf24c4000  ! 2367: LDSB_R	ldsb	[%r17 + %r0], %r25
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf20c8000  ! 2371: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xfe4c8000  ! 2373: LDSB_R	ldsb	[%r18 + %r0], %r31
T2_asi_reg_rd_103:
	mov	0x25, %r14
	.word 0xfedb89e0  ! 2376: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfc0c0000  ! 2377: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xf6cc8020  ! 2378: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r27
T2_asi_reg_wr_107:
	mov	0x29, %r14
	.word 0xf8f38e80  ! 2380: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_rd_104:
	mov	0xf, %r14
	.word 0xfedb89e0  ! 2381: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_rd_105:
	mov	0xe, %r14
	.word 0xf8db8400  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf25c219e  ! 2387: LDX_I	ldx	[%r16 + 0x019e], %r25
T2_asi_reg_rd_106:
	mov	0x21, %r14
	.word 0xfedb84a0  ! 2388: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf845e12e  ! 2394: LDSW_I	ldsw	[%r23 + 0x012e], %r28
	.word 0xfc84c020  ! 2395: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r30
	.word 0xf444e0b0  ! 2398: LDSW_I	ldsw	[%r19 + 0x00b0], %r26
	.word 0xf05c6074  ! 2400: LDX_I	ldx	[%r17 + 0x0074], %r24
	.word 0xf004a120  ! 2401: LDUW_I	lduw	[%r18 + 0x0120], %r24
	.word 0xf0456177  ! 2405: LDSW_I	ldsw	[%r21 + 0x0177], %r24
T2_asi_reg_rd_107:
	mov	0x3c6, %r14
	.word 0xfcdb84a0  ! 2406: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_205:
	setx	0x300330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48d2027  ! 2411: LDUBA_I	lduba	[%r20, + 0x0027] %asi, %r26
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 7)
	.word 0xfe054000  ! 2413: LDUW_R	lduw	[%r21 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0xfe046001  ! 2416: LDUW_I	lduw	[%r17 + 0x0001], %r31
T2_asi_reg_rd_108:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 2417: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfa4c8000  ! 2418: LDSB_R	ldsb	[%r18 + %r0], %r29
	.word 0xf88dc020  ! 2419: LDUBA_R	lduba	[%r23, %r0] 0x01, %r28
cpu_intr_2_206:
	setx	0x310215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8521bc  ! 2426: LDUWA_I	lduwa	[%r20, + 0x01bc] %asi, %r30
T2_asi_reg_rd_109:
	mov	0xc, %r14
	.word 0xf2db89e0  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_rd_110:
	mov	0x2e, %r14
	.word 0xf2db8400  ! 2433: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_rd_111:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 2442: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_wr_108:
	mov	0xe, %r14
	.word 0xf0f38400  ! 2444: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 1)
	.word 0xf2c4a1ee  ! 2449: LDSWA_I	ldswa	[%r18, + 0x01ee] %asi, %r25
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_wr_109:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 2452: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf68da137  ! 2457: LDUBA_I	lduba	[%r22, + 0x0137] %asi, %r27
	.word 0xfa45e1e3  ! 2462: LDSW_I	ldsw	[%r23 + 0x01e3], %r29
	.word 0xf8c54020  ! 2464: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
	.word 0xf80c0000  ! 2465: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xf65dc000  ! 2469: LDX_R	ldx	[%r23 + %r0], %r27
T2_asi_reg_rd_112:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 2471: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8cd0020  ! 2474: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 35)
	.word 0xfcd460e1  ! 2479: LDSHA_I	ldsha	[%r17, + 0x00e1] %asi, %r30
T2_asi_reg_wr_110:
	mov	0x18, %r14
	.word 0xfaf38400  ! 2481: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf405a117  ! 2483: LDUW_I	lduw	[%r22 + 0x0117], %r26
	.word 0xbec5a15c  ! 2485: ADDCcc_I	addccc 	%r22, 0x015c, %r31
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, a)
	.word 0xf6156085  ! 2492: LDUH_I	lduh	[%r21 + 0x0085], %r27
cpu_intr_2_207:
	setx	0x320327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_rd_113:
	mov	0x23, %r14
	.word 0xf6db8e40  ! 2497: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf25c4000  ! 2501: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xf285a0d9  ! 2505: LDUWA_I	lduwa	[%r22, + 0x00d9] %asi, %r25
	.word 0xfccd61e2  ! 2510: LDSBA_I	ldsba	[%r21, + 0x01e2] %asi, %r30
cpu_intr_2_208:
	setx	0x31033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_209:
	setx	0x32010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_210:
	setx	0x320117, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_111:
	mov	0x2b, %r14
	.word 0xfaf389e0  ! 2518: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_211:
	setx	0x330227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dca1ba  ! 2521: LDXA_I	ldxa	[%r18, + 0x01ba] %asi, %r27
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_112:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 2527: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_212:
	setx	0x330224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d4a119  ! 2534: LDSHA_I	ldsha	[%r18, + 0x0119] %asi, %r27
T2_asi_reg_rd_114:
	mov	0xd, %r14
	.word 0xfadb8e40  ! 2537: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_NONHPRIV
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 31)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_113:
	mov	0x9, %r14
	.word 0xf4f384a0  ! 2543: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0x8d95a162  ! 2547: WRPR_PSTATE_I	wrpr	%r22, 0x0162, %pstate
cpu_intr_2_213:
	setx	0x32000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_214:
	setx	0x330212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_215:
	setx	0x300225, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_2_216:
	setx	0x32012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8848020  ! 2559: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r28
T2_asi_reg_rd_115:
	mov	0x2e, %r14
	.word 0xfcdb8400  ! 2560: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_217:
	setx	0x330203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf694a1a8  ! 2565: LDUHA_I	lduha	[%r18, + 0x01a8] %asi, %r27
T2_asi_reg_rd_116:
	mov	0x1d, %r14
	.word 0xf0db8e60  ! 2570: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_218:
	setx	0x310317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_117:
	mov	0x1e, %r14
	.word 0xf0db8400  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_wr_114:
	mov	0x2c, %r14
	.word 0xf0f384a0  ! 2585: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_219:
	setx	0x320204, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_115:
	mov	0x33, %r14
	.word 0xf2f389e0  ! 2589: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb62d219e  ! 2591: ANDN_I	andn 	%r20, 0x019e, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xfa14a094  ! 2597: LDUH_I	lduh	[%r18 + 0x0094], %r29
T2_asi_reg_rd_118:
	mov	0x21, %r14
	.word 0xfedb8e40  ! 2599: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfc45e136  ! 2600: LDSW_I	ldsw	[%r23 + 0x0136], %r30
cpu_intr_2_220:
	setx	0x330238, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_119:
	mov	0x9, %r14
	.word 0xf6db84a0  ! 2602: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_2_221:
	setx	0x300139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d44020  ! 2604: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 8)
	.word 0xb02cc000  ! 2609: ANDN_R	andn 	%r19, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_120:
	mov	0x34, %r14
	.word 0xf6db8e60  ! 2611: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983cd8  ! 2612: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd8, %hpstate
	.word 0xb044c000  ! 2613: ADDC_R	addc 	%r19, %r0, %r24
cpu_intr_2_222:
	setx	0x30013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dda0f7  ! 2618: LDXA_I	ldxa	[%r22, + 0x00f7] %asi, %r24
	.word 0xf6d40020  ! 2622: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r27
	.word 0xbcb44000  ! 2623: SUBCcc_R	orncc 	%r17, %r0, %r30
cpu_intr_2_223:
	setx	0x33002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d42187  ! 2630: LDSHA_I	ldsha	[%r16, + 0x0187] %asi, %r26
	.word 0xfec4a1ad  ! 2631: LDSWA_I	ldswa	[%r18, + 0x01ad] %asi, %r31
	.word 0xf0852086  ! 2634: LDUWA_I	lduwa	[%r20, + 0x0086] %asi, %r24
T2_asi_reg_rd_121:
	mov	0x5, %r14
	.word 0xf0db84a0  ! 2641: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_rd_122:
	mov	0x17, %r14
	.word 0xf2db8400  ! 2642: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 24)
	.word 0xb804a1b0  ! 2644: ADD_I	add 	%r18, 0x01b0, %r28
	.word 0xf0d520aa  ! 2646: LDSHA_I	ldsha	[%r20, + 0x00aa] %asi, %r24
	.word 0xf88ce1b9  ! 2648: LDUBA_I	lduba	[%r19, + 0x01b9] %asi, %r28
cpu_intr_2_224:
	setx	0x310312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d0020  ! 2650: LDUBA_R	lduba	[%r20, %r0] 0x01, %r31
T2_asi_reg_rd_123:
	mov	0x22, %r14
	.word 0xf2db8e40  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 27)
	.word 0xf84460fb  ! 2656: LDSW_I	ldsw	[%r17 + 0x00fb], %r28
T2_asi_reg_rd_124:
	mov	0x33, %r14
	.word 0xfcdb8e40  ! 2657: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe8cc020  ! 2659: LDUBA_R	lduba	[%r19, %r0] 0x01, %r31
	.word 0xfac5a1e9  ! 2660: LDSWA_I	ldswa	[%r22, + 0x01e9] %asi, %r29
	.word 0xf8954020  ! 2664: LDUHA_R	lduha	[%r21, %r0] 0x01, %r28
T2_asi_reg_rd_125:
	mov	0x2f, %r14
	.word 0xf4db8400  ! 2665: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf205215f  ! 2669: LDUW_I	lduw	[%r20 + 0x015f], %r25
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 1e)
	.word 0xb97d4400  ! 2671: MOVR_R	movre	%r21, %r0, %r28
T2_asi_reg_rd_126:
	mov	0xd, %r14
	.word 0xf2db8400  ! 2673: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfe4c4000  ! 2675: LDSB_R	ldsb	[%r17 + %r0], %r31
	.word 0xf6dd20f5  ! 2677: LDXA_I	ldxa	[%r20, + 0x00f5] %asi, %r27
T2_asi_reg_wr_116:
	mov	0x33, %r14
	.word 0xfef38400  ! 2679: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_117:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 2685: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_225:
	setx	0x310326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c421bd  ! 2688: LDSWA_I	ldswa	[%r16, + 0x01bd] %asi, %r25
T2_asi_reg_rd_127:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 2689: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 32)
	.word 0xfacc4020  ! 2697: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r29
T2_asi_reg_rd_128:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 2698: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfa542131  ! 2699: LDSH_I	ldsh	[%r16 + 0x0131], %r29
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c10  ! 2700: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c10, %hpstate
	.word 0xbc3ca140  ! 2702: XNOR_I	xnor 	%r18, 0x0140, %r30
	.word 0xfe04c000  ! 2704: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xf25dc000  ! 2705: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0xf6952153  ! 2707: LDUHA_I	lduha	[%r20, + 0x0153] %asi, %r27
cpu_intr_2_226:
	setx	0x32010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_129:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 2712: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf48d8020  ! 2714: LDUBA_R	lduba	[%r22, %r0] 0x01, %r26
T2_asi_reg_wr_118:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 2715: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb72d7001  ! 2718: SLLX_I	sllx	%r21, 0x0001, %r27
	.word 0xbe85a092  ! 2722: ADDcc_I	addcc 	%r22, 0x0092, %r31
	.word 0xf8442116  ! 2729: LDSW_I	ldsw	[%r16 + 0x0116], %r28
	ta	T_CHANGE_TO_TL0
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 23)
	.word 0xf08d210c  ! 2734: LDUBA_I	lduba	[%r20, + 0x010c] %asi, %r24
	.word 0xb4944000  ! 2735: ORcc_R	orcc 	%r17, %r0, %r26
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_227:
	setx	0x330221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_228:
	setx	0x320026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44d21fd  ! 2741: LDSB_I	ldsb	[%r20 + 0x01fd], %r26
T2_asi_reg_rd_130:
	mov	0x3c5, %r14
	.word 0xf0db84a0  ! 2742: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfe844020  ! 2743: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
cpu_intr_2_229:
	setx	0x340016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d44020  ! 2748: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r24
	.word 0xf204e0d2  ! 2749: LDUW_I	lduw	[%r19 + 0x00d2], %r25
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_131:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 2753: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_wr_119:
	mov	0x3c1, %r14
	.word 0xf0f38400  ! 2754: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV
	.word 0xf4840020  ! 2757: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r26
	.word 0xba44e0a9  ! 2759: ADDC_I	addc 	%r19, 0x00a9, %r29
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_rd_132:
	mov	0x1a, %r14
	.word 0xfedb8e60  ! 2764: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_230:
	setx	0x350209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b44000  ! 2770: SUBCcc_R	orncc 	%r17, %r0, %r26
cpu_intr_2_231:
	setx	0x340205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_232:
	setx	0x350236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, f)
	.word 0xbc04212e  ! 2783: ADD_I	add 	%r16, 0x012e, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xf6c46044  ! 2785: LDSWA_I	ldswa	[%r17, + 0x0044] %asi, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf694a061  ! 2790: LDUHA_I	lduha	[%r18, + 0x0061] %asi, %r27
	.word 0xf48d0020  ! 2795: LDUBA_R	lduba	[%r20, %r0] 0x01, %r26
T2_asi_reg_wr_120:
	mov	0x38, %r14
	.word 0xf2f38e60  ! 2797: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf0d50020  ! 2798: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r24
cpu_intr_2_233:
	setx	0x350109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c48020  ! 2800: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r28
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 26)
	.word 0xf4d4601a  ! 2806: LDSHA_I	ldsha	[%r17, + 0x001a] %asi, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf694c020  ! 2809: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
	.word 0xf614e0f2  ! 2811: LDUH_I	lduh	[%r19 + 0x00f2], %r27
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 17)
	.word 0xb41561dc  ! 2813: OR_I	or 	%r21, 0x01dc, %r26
cpu_intr_2_234:
	setx	0x370120, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_121:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 2815: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_235:
	setx	0x370200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6848020  ! 2818: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r27
T2_asi_reg_wr_122:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 2821: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_rd_133:
	mov	0x5, %r14
	.word 0xf0db8e40  ! 2826: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_rd_134:
	mov	0x2d, %r14
	.word 0xfedb8e80  ! 2828: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf48c4020  ! 2830: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
	.word 0xf2c44020  ! 2831: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r25
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 37)
	.word 0xb0152069  ! 2840: OR_I	or 	%r20, 0x0069, %r24
	.word 0xb3641800  ! 2841: MOVcc_R	<illegal instruction>
	.word 0xfccca1c7  ! 2842: LDSBA_I	ldsba	[%r18, + 0x01c7] %asi, %r30
	.word 0xb88d4000  ! 2843: ANDcc_R	andcc 	%r21, %r0, %r28
	.word 0xb01c0000  ! 2845: XOR_R	xor 	%r16, %r0, %r24
	.word 0xf4440000  ! 2846: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xfa0d8000  ! 2849: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xf845a191  ! 2851: LDSW_I	ldsw	[%r22 + 0x0191], %r28
	.word 0xb1510000  ! 2852: RDPR_TICK	<illegal instruction>
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_236:
	setx	0x37023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8dc020  ! 2856: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
	.word 0xf8444000  ! 2858: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xf2d4a050  ! 2866: LDSHA_I	ldsha	[%r18, + 0x0050] %asi, %r25
	.word 0xf0cc4020  ! 2868: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r24
cpu_intr_2_237:
	setx	0x360022, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_238:
	setx	0x370126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d201b  ! 2883: LDUB_I	ldub	[%r20 + 0x001b], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb614a119  ! 2885: OR_I	or 	%r18, 0x0119, %r27
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_239:
	setx	0x350134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe84e1dd  ! 2894: LDUWA_I	lduwa	[%r19, + 0x01dd] %asi, %r31
	.word 0xb00d0000  ! 2895: AND_R	and 	%r20, %r0, %r24
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 20)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_240:
	setx	0x35022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 22)
	.word 0xb13ce001  ! 2907: SRA_I	sra 	%r19, 0x0001, %r24
cpu_intr_2_241:
	setx	0x37023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6548000  ! 2911: LDSH_R	ldsh	[%r18 + %r0], %r27
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x8198398a  ! 2912: WRHPR_HPSTATE_I	wrhpr	%r0, 0x198a, %hpstate
	.word 0xf4c58020  ! 2916: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r26
	.word 0xb615c000  ! 2918: OR_R	or 	%r23, %r0, %r27
	.word 0xfa85a1d8  ! 2921: LDUWA_I	lduwa	[%r22, + 0x01d8] %asi, %r29
	.word 0xbc94c000  ! 2922: ORcc_R	orcc 	%r19, %r0, %r30
	.word 0xf85d2066  ! 2924: LDX_I	ldx	[%r20 + 0x0066], %r28
	.word 0xba152105  ! 2926: OR_I	or 	%r20, 0x0105, %r29
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_123:
	mov	0xf, %r14
	.word 0xf4f38e60  ! 2932: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf495c020  ! 2934: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
	.word 0xfc848020  ! 2935: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r30
	.word 0xb42d8000  ! 2941: ANDN_R	andn 	%r22, %r0, %r26
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982900  ! 2945: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0900, %hpstate
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_135:
	mov	0x22, %r14
	.word 0xfadb8e60  ! 2950: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf485a0f6  ! 2957: LDUWA_I	lduwa	[%r22, + 0x00f6] %asi, %r26
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_242:
	setx	0x37021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28d61b3  ! 2964: LDUBA_I	lduba	[%r21, + 0x01b3] %asi, %r25
	.word 0xf8554000  ! 2965: LDSH_R	ldsh	[%r21 + %r0], %r28
	.word 0xfec46105  ! 2966: LDSWA_I	ldswa	[%r17, + 0x0105] %asi, %r31
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983988  ! 2968: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1988, %hpstate
	.word 0xf05c0000  ! 2969: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xf054a055  ! 2971: LDSH_I	ldsh	[%r18 + 0x0055], %r24
cpu_intr_2_243:
	setx	0x370202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa452025  ! 2974: LDSW_I	ldsw	[%r20 + 0x0025], %r29
	ta	T_CHANGE_NONHPRIV
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 35)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_124:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 2983: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_wr_125:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 2984: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_244:
	setx	0x370109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 9)
	.word 0xf0dda092  ! 2989: LDXA_I	ldxa	[%r22, + 0x0092] %asi, %r24
T2_asi_reg_wr_126:
	mov	0x32, %r14
	.word 0xfaf384a0  ! 2990: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfa5ce1b1  ! 2991: LDX_I	ldx	[%r19 + 0x01b1], %r29
cpu_intr_2_245:
	setx	0x360315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_246:
	setx	0x35030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_247:
	setx	0x37023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_248:
	setx	0x34000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_136:
	mov	0x2b, %r14
	.word 0xf6db8e80  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_249:
	setx	0x340323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_250:
	setx	0x370327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3c8000  ! 3007: SRA_R	sra 	%r18, %r0, %r29
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 34)
	.word 0xfc0da110  ! 3010: LDUB_I	ldub	[%r22 + 0x0110], %r30
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_251:
	setx	0x370332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8c4020  ! 3014: LDUBA_R	lduba	[%r17, %r0] 0x01, %r30
	.word 0xfe846078  ! 3015: LDUWA_I	lduwa	[%r17, + 0x0078] %asi, %r31
	.word 0xf615619f  ! 3016: LDUH_I	lduh	[%r21 + 0x019f], %r27
	.word 0xb034e08c  ! 3017: ORN_I	orn 	%r19, 0x008c, %r24
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, b)
	.word 0xb5355000  ! 3021: SRLX_R	srlx	%r21, %r0, %r26
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 20)
	.word 0xfac420cf  ! 3024: LDSWA_I	ldswa	[%r16, + 0x00cf] %asi, %r29
T2_asi_reg_wr_127:
	mov	0x14, %r14
	.word 0xf2f38e40  ! 3026: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_252:
	setx	0x370225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8d4020  ! 3030: LDUBA_R	lduba	[%r21, %r0] 0x01, %r29
T2_asi_reg_wr_128:
	mov	0x27, %r14
	.word 0xf0f38400  ! 3040: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_rd_137:
	mov	0x35, %r14
	.word 0xfcdb8e80  ! 3041: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_wr_129:
	mov	0x4, %r14
	.word 0xf0f38e40  ! 3042: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_138:
	mov	0x2f, %r14
	.word 0xf8db84a0  ! 3043: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfe454000  ! 3044: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xfe154000  ! 3045: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xb824a1ad  ! 3046: SUB_I	sub 	%r18, 0x01ad, %r28
	.word 0xf2c50020  ! 3047: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r25
T2_asi_reg_rd_139:
	mov	0x15, %r14
	.word 0xfcdb89e0  ! 3052: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_253:
	setx	0x35022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfa450000  ! 3062: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0xb20ce194  ! 3063: AND_I	and 	%r19, 0x0194, %r25
	.word 0xf6440000  ! 3066: LDSW_R	ldsw	[%r16 + %r0], %r27
	.word 0xb83dc000  ! 3067: XNOR_R	xnor 	%r23, %r0, %r28
cpu_intr_2_254:
	setx	0x340333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa048000  ! 3069: LDUW_R	lduw	[%r18 + %r0], %r29
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 22)
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_140:
	mov	0x20, %r14
	.word 0xfadb8e80  ! 3082: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_255:
	setx	0x34023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 27)
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982e80  ! 3093: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e80, %hpstate
T2_asi_reg_wr_130:
	mov	0x19, %r14
	.word 0xf4f384a0  ! 3095: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfe8c4020  ! 3099: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	.word 0xfa5d61d8  ! 3100: LDX_I	ldx	[%r21 + 0x01d8], %r29
	.word 0xf605c000  ! 3103: LDUW_R	lduw	[%r23 + %r0], %r27
T2_asi_reg_rd_141:
	mov	0x22, %r14
	.word 0xfcdb89e0  ! 3104: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_256:
	setx	0x350215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_257:
	setx	0x37022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_131:
	mov	0x1f, %r14
	.word 0xf2f38e40  ! 3112: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_258:
	setx	0x36021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_259:
	setx	0x35010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_260:
	setx	0x350127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_261:
	setx	0x360339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8850020  ! 3123: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
	.word 0xf805e121  ! 3124: LDUW_I	lduw	[%r23 + 0x0121], %r28
cpu_intr_2_262:
	setx	0x360238, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_142:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 3131: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_263:
	setx	0x370329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_264:
	setx	0x360126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedd2083  ! 3136: LDXA_I	ldxa	[%r20, + 0x0083] %asi, %r31
T2_asi_reg_rd_143:
	mov	0x8, %r14
	.word 0xfcdb89e0  ! 3137: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_265:
	setx	0x360028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf685e1d9  ! 3148: LDUWA_I	lduwa	[%r23, + 0x01d9] %asi, %r27
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_132:
	mov	0x2e, %r14
	.word 0xf8f38e40  ! 3154: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf4954020  ! 3157: LDUHA_R	lduha	[%r21, %r0] 0x01, %r26
	.word 0xf4cd0020  ! 3159: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r26
cpu_intr_2_266:
	setx	0x34003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_144:
	mov	0x3c3, %r14
	.word 0xf0db89e0  ! 3162: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfe858020  ! 3163: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r31
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 19)
	.word 0xf8d48020  ! 3167: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
	.word 0xf055e008  ! 3169: LDSH_I	ldsh	[%r23 + 0x0008], %r24
	.word 0xfc146186  ! 3170: LDUH_I	lduh	[%r17 + 0x0186], %r30
	.word 0xf454c000  ! 3171: LDSH_R	ldsh	[%r19 + %r0], %r26
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 27)
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xfe8c619b  ! 3178: LDUBA_I	lduba	[%r17, + 0x019b] %asi, %r31
cpu_intr_2_267:
	setx	0x36020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_133:
	mov	0x3c5, %r14
	.word 0xfcf384a0  ! 3181: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfe8cc020  ! 3184: LDUBA_R	lduba	[%r19, %r0] 0x01, %r31
	.word 0xfa054000  ! 3185: LDUW_R	lduw	[%r21 + %r0], %r29
T2_asi_reg_wr_134:
	mov	0x1, %r14
	.word 0xfcf38e40  ! 3187: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_268:
	setx	0x360201, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb08ca062  ! 3191: ANDcc_I	andcc 	%r18, 0x0062, %r24
cpu_intr_2_269:
	setx	0x35000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_135:
	mov	0xc, %r14
	.word 0xfcf38e60  ! 3194: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_270:
	setx	0x35000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd4c020  ! 3200: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r30
	.word 0xf0d48020  ! 3201: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r24
	.word 0xfacde0f3  ! 3202: LDSBA_I	ldsba	[%r23, + 0x00f3] %asi, %r29
cpu_intr_2_271:
	setx	0x370214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2df001  ! 3204: SLLX_I	sllx	%r23, 0x0001, %r29
T2_asi_reg_rd_145:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 3205: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfcd58020  ! 3207: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r30
cpu_intr_2_272:
	setx	0x3a0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc156099  ! 3210: LDUH_I	lduh	[%r21 + 0x0099], %r30
	.word 0xbe3d8000  ! 3212: XNOR_R	xnor 	%r22, %r0, %r31
cpu_intr_2_273:
	setx	0x380337, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf48c8020  ! 3217: LDUBA_R	lduba	[%r18, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf055e1f5  ! 3223: LDSH_I	ldsh	[%r23 + 0x01f5], %r24
cpu_intr_2_274:
	setx	0x380318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_275:
	setx	0x3a0102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_276:
	setx	0x3a0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_277:
	setx	0x3b0219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 30)
	ta	T_CHANGE_HPRIV
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 20)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982bc2  ! 3240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc2, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0xf2c58020  ! 3247: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r25
T2_asi_reg_rd_146:
	mov	0x1e, %r14
	.word 0xfedb84a0  ! 3251: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf8154000  ! 3253: LDUH_R	lduh	[%r21 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfacdc020  ! 3257: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r29
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_278:
	setx	0x390202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_279:
	setx	0x380229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9341000  ! 3261: SRLX_R	srlx	%r16, %r0, %r28
T2_asi_reg_wr_136:
	mov	0x3c2, %r14
	.word 0xfef38e80  ! 3263: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, b)
	.word 0xb604e08a  ! 3267: ADD_I	add 	%r19, 0x008a, %r27
T2_asi_reg_wr_137:
	mov	0x24, %r14
	.word 0xfaf38e40  ! 3269: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_280:
	setx	0x3a0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8da00d  ! 3274: ANDcc_I	andcc 	%r22, 0x000d, %r29
	.word 0xfa840020  ! 3275: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
cpu_intr_2_281:
	setx	0x38012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_147:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_wr_138:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 3280: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T2_asi_reg_rd_148:
	mov	0x24, %r14
	.word 0xf0db8400  ! 3281: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf24c4000  ! 3282: LDSB_R	ldsb	[%r17 + %r0], %r25
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_149:
	mov	0x11, %r14
	.word 0xf2db84a0  ! 3286: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T2_asi_reg_wr_139:
	mov	0x26, %r14
	.word 0xfef389e0  ! 3287: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_140:
	mov	0x36, %r14
	.word 0xf6f38e40  ! 3294: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_150:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 3295: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf8d5c020  ! 3296: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r28
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983840  ! 3297: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1840, %hpstate
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 34)
	.word 0xf644c000  ! 3305: LDSW_R	ldsw	[%r19 + %r0], %r27
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 27)
	.word 0xfedc21ad  ! 3310: LDXA_I	ldxa	[%r16, + 0x01ad] %asi, %r31
	.word 0xf2cda167  ! 3311: LDSBA_I	ldsba	[%r22, + 0x0167] %asi, %r25
T2_asi_reg_rd_151:
	mov	0x2b, %r14
	.word 0xfedb8e40  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 11)
	.word 0xf00d8000  ! 3318: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0xbb343001  ! 3321: SRLX_I	srlx	%r16, 0x0001, %r29
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1500000  ! 3327: RDPR_TPC	<illegal instruction>
cpu_intr_2_282:
	setx	0x3a0021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_283:
	setx	0x380039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_284:
	setx	0x3b0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe154000  ! 3331: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xfa958020  ! 3333: LDUHA_R	lduha	[%r22, %r0] 0x01, %r29
	.word 0xf6052138  ! 3334: LDUW_I	lduw	[%r20 + 0x0138], %r27
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_285:
	setx	0x3b013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd4a1ab  ! 3338: LDSHA_I	ldsha	[%r18, + 0x01ab] %asi, %r30
T2_asi_reg_wr_141:
	mov	0x1a, %r14
	.word 0xfaf38e60  ! 3340: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf24c0000  ! 3341: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xfe84c020  ! 3342: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r31
	.word 0xf6956198  ! 3343: LDUHA_I	lduha	[%r21, + 0x0198] %asi, %r27
	.word 0xb69d200c  ! 3344: XORcc_I	xorcc 	%r20, 0x000c, %r27
	.word 0xfad5c020  ! 3348: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r29
cpu_intr_2_286:
	setx	0x3a0208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_287:
	setx	0x380006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc158000  ! 3358: OR_R	or 	%r22, %r0, %r30
	.word 0xbd3d7001  ! 3360: SRAX_I	srax	%r21, 0x0001, %r30
	.word 0xfecc20fe  ! 3361: LDSBA_I	ldsba	[%r16, + 0x00fe] %asi, %r31
	.word 0xf84c61dc  ! 3363: LDSB_I	ldsb	[%r17 + 0x01dc], %r28
	.word 0xfac4616b  ! 3364: LDSWA_I	ldswa	[%r17, + 0x016b] %asi, %r29
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983e0a  ! 3368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e0a, %hpstate
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b5a  ! 3369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b5a, %hpstate
T2_asi_reg_wr_142:
	mov	0x2c, %r14
	.word 0xf8f38e40  ! 3372: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfa8d0020  ! 3375: LDUBA_R	lduba	[%r20, %r0] 0x01, %r29
T2_asi_reg_rd_152:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 3380: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa84c020  ! 3382: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r29
cpu_intr_2_288:
	setx	0x3a0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d42137  ! 3384: LDSHA_I	ldsha	[%r16, + 0x0137] %asi, %r24
T2_asi_reg_wr_143:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 3386: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbec50000  ! 3389: ADDCcc_R	addccc 	%r20, %r0, %r31
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_144:
	mov	0x1e, %r14
	.word 0xf0f38e40  ! 3393: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_289:
	setx	0x380037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_290:
	setx	0x390331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf415c000  ! 3401: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xf4952015  ! 3403: LDUHA_I	lduha	[%r20, + 0x0015] %asi, %r26
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198389a  ! 3404: WRHPR_HPSTATE_I	wrhpr	%r0, 0x189a, %hpstate
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_291:
	setx	0x380332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf095e104  ! 3410: LDUHA_I	lduha	[%r23, + 0x0104] %asi, %r24
	.word 0xfadc61ac  ! 3412: LDXA_I	ldxa	[%r17, + 0x01ac] %asi, %r29
T2_asi_reg_rd_153:
	mov	0x23, %r14
	.word 0xf0db8e60  ! 3415: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_292:
	setx	0x38011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d0000  ! 3418: LDSB_R	ldsb	[%r20 + %r0], %r24
cpu_intr_2_293:
	setx	0x3b021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbe9d4000  ! 3428: XORcc_R	xorcc 	%r21, %r0, %r31
	.word 0xb8bd0000  ! 3430: XNORcc_R	xnorcc 	%r20, %r0, %r28
	.word 0xfcdda0ad  ! 3431: LDXA_I	ldxa	[%r22, + 0x00ad] %asi, %r30
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 21)
	.word 0xfe05e0a3  ! 3434: LDUW_I	lduw	[%r23 + 0x00a3], %r31
T2_asi_reg_wr_145:
	mov	0x37, %r14
	.word 0xf0f38e40  ! 3435: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_294:
	setx	0x380301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc35e143  ! 3439: SUBC_I	orn 	%r23, 0x0143, %r30
	.word 0xfa5520e4  ! 3441: LDSH_I	ldsh	[%r20 + 0x00e4], %r29
T2_asi_reg_wr_146:
	mov	0x30, %r14
	.word 0xfef38400  ! 3443: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbd3dd000  ! 3447: SRAX_R	srax	%r23, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf80c6168  ! 3449: LDUB_I	ldub	[%r17 + 0x0168], %r28
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 25)
	.word 0xfa5ce18d  ! 3451: LDX_I	ldx	[%r19 + 0x018d], %r29
	.word 0xba254000  ! 3452: SUB_R	sub 	%r21, %r0, %r29
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_wr_147:
	mov	0x1b, %r14
	.word 0xf6f38400  ! 3456: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_2_295:
	setx	0x3b031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_148:
	mov	0x3c7, %r14
	.word 0xfaf38e80  ! 3461: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_296:
	setx	0x3a003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_149:
	mov	0x21, %r14
	.word 0xf0f384a0  ! 3465: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_297:
	setx	0x380314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c2014  ! 3468: LDX_I	ldx	[%r16 + 0x0014], %r29
	.word 0x8994a08d  ! 3469: WRPR_TICK_I	wrpr	%r18, 0x008d, %tick
T2_asi_reg_rd_154:
	mov	0x1b, %r14
	.word 0xf4db8400  ! 3470: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_wr_150:
	mov	0x7, %r14
	.word 0xf8f38e40  ! 3472: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf895c020  ! 3473: LDUHA_R	lduha	[%r23, %r0] 0x01, %r28
	.word 0xf4446007  ! 3478: LDSW_I	ldsw	[%r17 + 0x0007], %r26
T2_asi_reg_wr_151:
	mov	0x2e, %r14
	.word 0xf6f38e40  ! 3480: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb0c40000  ! 3483: ADDCcc_R	addccc 	%r16, %r0, %r24
cpu_intr_2_298:
	setx	0x39013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_152:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 3488: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf2852094  ! 3489: LDUWA_I	lduwa	[%r20, + 0x0094] %asi, %r25
	.word 0xfad42137  ! 3493: LDSHA_I	ldsha	[%r16, + 0x0137] %asi, %r29
T2_asi_reg_rd_155:
	mov	0x10, %r14
	.word 0xf8db8e80  ! 3502: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfe148000  ! 3503: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xfcdca1bb  ! 3504: LDXA_I	ldxa	[%r18, + 0x01bb] %asi, %r30
T2_asi_reg_wr_153:
	mov	0x34, %r14
	.word 0xf8f384a0  ! 3505: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf68d2150  ! 3508: LDUBA_I	lduba	[%r20, + 0x0150] %asi, %r27
T2_asi_reg_rd_156:
	mov	0x0, %r14
	.word 0xf0db84a0  ! 3509: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_299:
	setx	0x3b0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87952006  ! 3518: WRPR_TT_I	wrpr	%r20, 0x0006, %tt
T2_asi_reg_wr_154:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 3519: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbc44c000  ! 3520: ADDC_R	addc 	%r19, %r0, %r30
	.word 0xf2cd61a4  ! 3521: LDSBA_I	ldsba	[%r21, + 0x01a4] %asi, %r25
cpu_intr_2_300:
	setx	0x3a0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0452086  ! 3523: LDSW_I	ldsw	[%r20 + 0x0086], %r24
cpu_intr_2_301:
	setx	0x38002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 17)
	.word 0xfe056046  ! 3531: LDUW_I	lduw	[%r21 + 0x0046], %r31
	.word 0xbc458000  ! 3533: ADDC_R	addc 	%r22, %r0, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xbc05e1ae  ! 3536: ADD_I	add 	%r23, 0x01ae, %r30
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_wr_155:
	mov	0x21, %r14
	.word 0xfaf38e80  ! 3543: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfaccc020  ! 3544: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r29
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_wr_156:
	mov	0x33, %r14
	.word 0xf2f389e0  ! 3549: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf80d2032  ! 3551: LDUB_I	ldub	[%r20 + 0x0032], %r28
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 18)
	.word 0xf28d4020  ! 3556: LDUBA_R	lduba	[%r21, %r0] 0x01, %r25
	.word 0xf084e069  ! 3557: LDUWA_I	lduwa	[%r19, + 0x0069] %asi, %r24
	.word 0xf48c0020  ! 3558: LDUBA_R	lduba	[%r16, %r0] 0x01, %r26
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_157:
	mov	0x1f, %r14
	.word 0xf4f38e40  ! 3561: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_302:
	setx	0x3a0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_157:
	mov	0x29, %r14
	.word 0xf0db84a0  ! 3563: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_303:
	setx	0x3a0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5d8000  ! 3568: LDX_R	ldx	[%r22 + %r0], %r29
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 9)
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983ad0  ! 3570: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad0, %hpstate
	.word 0xf444211f  ! 3574: LDSW_I	ldsw	[%r16 + 0x011f], %r26
	.word 0xfa95c020  ! 3576: LDUHA_R	lduha	[%r23, %r0] 0x01, %r29
cpu_intr_2_304:
	setx	0x3b0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cc61a0  ! 3580: LDSBA_I	ldsba	[%r17, + 0x01a0] %asi, %r24
cpu_intr_2_305:
	setx	0x39010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3ca120  ! 3586: XNOR_I	xnor 	%r18, 0x0120, %r30
	.word 0x8195205f  ! 3591: WRPR_TPC_I	wrpr	%r20, 0x005f, %tpc
	.word 0xf8056163  ! 3592: LDUW_I	lduw	[%r21 + 0x0163], %r28
	.word 0xf0d40020  ! 3593: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 1)
	.word 0xf654a178  ! 3595: LDSH_I	ldsh	[%r18 + 0x0178], %r27
cpu_intr_2_306:
	setx	0x3b0325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 3)
	.word 0xf244a0bc  ! 3601: LDSW_I	ldsw	[%r18 + 0x00bc], %r25
T2_asi_reg_rd_158:
	mov	0x34, %r14
	.word 0xfedb8e40  ! 3603: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_158:
	mov	0x3c1, %r14
	.word 0xfef38e80  ! 3604: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfa5cc000  ! 3606: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xfcd46079  ! 3607: LDSHA_I	ldsha	[%r17, + 0x0079] %asi, %r30
cpu_intr_2_307:
	setx	0x3a030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb424e18a  ! 3610: SUB_I	sub 	%r19, 0x018a, %r26
	.word 0xfac4e0d8  ! 3614: LDSWA_I	ldswa	[%r19, + 0x00d8] %asi, %r29
T2_asi_reg_wr_159:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 3615: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_308:
	setx	0x380104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedd2184  ! 3622: LDXA_I	ldxa	[%r20, + 0x0184] %asi, %r31
cpu_intr_2_309:
	setx	0x3a0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c21ae  ! 3626: LDX_I	ldx	[%r16 + 0x01ae], %r26
T2_asi_reg_rd_159:
	mov	0x38, %r14
	.word 0xfadb8e40  ! 3628: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_160:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 3630: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfa0c2111  ! 3634: LDUB_I	ldub	[%r16 + 0x0111], %r29
	.word 0xf05421db  ! 3635: LDSH_I	ldsh	[%r16 + 0x01db], %r24
	.word 0xf844e0ea  ! 3639: LDSW_I	ldsw	[%r19 + 0x00ea], %r28
	.word 0xfe45c000  ! 3640: LDSW_R	ldsw	[%r23 + %r0], %r31
cpu_intr_2_310:
	setx	0x38023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c58020  ! 3643: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r25
	.word 0xfec4e1e5  ! 3645: LDSWA_I	ldswa	[%r19, + 0x01e5] %asi, %r31
T2_asi_reg_wr_160:
	mov	0x2e, %r14
	.word 0xf4f38e60  ! 3650: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfe14c000  ! 3651: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xf2858020  ! 3653: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r25
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_161:
	mov	0x25, %r14
	.word 0xf2db8e40  ! 3660: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbd343001  ! 3663: SRLX_I	srlx	%r16, 0x0001, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 2b)
	.word 0xbc3ca14a  ! 3668: XNOR_I	xnor 	%r18, 0x014a, %r30
	.word 0xf0c420b2  ! 3670: LDSWA_I	ldswa	[%r16, + 0x00b2] %asi, %r24
	.word 0xfacde1f1  ! 3672: LDSBA_I	ldsba	[%r23, + 0x01f1] %asi, %r29
	ta	T_CHANGE_TO_TL0
cpu_intr_2_311:
	setx	0x390039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa940020  ! 3681: LDUHA_R	lduha	[%r16, %r0] 0x01, %r29
cpu_intr_2_312:
	setx	0x3e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_161:
	mov	0x17, %r14
	.word 0xf8f38e80  ! 3684: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 33)
	.word 0xfa558000  ! 3690: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xfc44c000  ! 3695: LDSW_R	ldsw	[%r19 + %r0], %r30
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 32)
	.word 0xf2dd215a  ! 3700: LDXA_I	ldxa	[%r20, + 0x015a] %asi, %r25
	.word 0xbe2cc000  ! 3701: ANDN_R	andn 	%r19, %r0, %r31
	.word 0xb8944000  ! 3702: ORcc_R	orcc 	%r17, %r0, %r28
T2_asi_reg_wr_162:
	mov	0x1, %r14
	.word 0xf4f38e80  ! 3704: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_2_313:
	setx	0x3c012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4150000  ! 3714: LDUH_R	lduh	[%r20 + %r0], %r26
cpu_intr_2_314:
	setx	0x3c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_163:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 3716: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983cd2  ! 3719: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd2, %hpstate
	.word 0xb82d4000  ! 3723: ANDN_R	andn 	%r21, %r0, %r28
T2_asi_reg_wr_164:
	mov	0x1c, %r14
	.word 0xfcf389e0  ! 3727: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf2954020  ! 3728: LDUHA_R	lduha	[%r21, %r0] 0x01, %r25
	.word 0xf455206f  ! 3729: LDSH_I	ldsh	[%r20 + 0x006f], %r26
T2_asi_reg_wr_165:
	mov	0xb, %r14
	.word 0xfef38400  ! 3733: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_rd_162:
	mov	0x4, %r14
	.word 0xf0db89e0  ! 3734: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_2_315:
	setx	0x3c0218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_316:
	setx	0x3c0228, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_163:
	mov	0x1b, %r14
	.word 0xf6db8e40  ! 3741: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_166:
	mov	0x17, %r14
	.word 0xf8f38400  ! 3745: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfed4a0e7  ! 3746: LDSHA_I	ldsha	[%r18, + 0x00e7] %asi, %r31
	.word 0xf40c0000  ! 3748: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xf0442191  ! 3749: LDSW_I	ldsw	[%r16 + 0x0191], %r24
	.word 0xbcb58000  ! 3754: SUBCcc_R	orncc 	%r22, %r0, %r30
T2_asi_reg_rd_164:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf00c4000  ! 3756: LDUB_R	ldub	[%r17 + %r0], %r24
	.word 0xf2944020  ! 3757: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf2548000  ! 3760: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xbc154000  ! 3762: OR_R	or 	%r21, %r0, %r30
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, a)
	ta	T_CHANGE_TO_TL0
	.word 0xf854208a  ! 3766: LDSH_I	ldsh	[%r16 + 0x008a], %r28
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfc54e0f0  ! 3770: LDSH_I	ldsh	[%r19 + 0x00f0], %r30
	.word 0xf244c000  ! 3772: LDSW_R	ldsw	[%r19 + %r0], %r25
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_167:
	mov	0x4, %r14
	.word 0xf6f38e40  ! 3774: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf414c000  ! 3775: LDUH_R	lduh	[%r19 + %r0], %r26
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_168:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 3777: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf6dc6062  ! 3779: LDXA_I	ldxa	[%r17, + 0x0062] %asi, %r27
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 1d)
	.word 0xbb7d8400  ! 3783: MOVR_R	movre	%r22, %r0, %r29
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 22)
	.word 0xf8844020  ! 3793: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
	.word 0xf615202c  ! 3794: LDUH_I	lduh	[%r20 + 0x002c], %r27
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 3)
	ta	T_CHANGE_TO_TL0
	.word 0xf244e11c  ! 3799: LDSW_I	ldsw	[%r19 + 0x011c], %r25
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 23)
	.word 0xb69d6141  ! 3803: XORcc_I	xorcc 	%r21, 0x0141, %r27
cpu_intr_2_317:
	setx	0x3f0226, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_169:
	mov	0x2e, %r14
	.word 0xfaf38e60  ! 3807: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb0c5e19b  ! 3808: ADDCcc_I	addccc 	%r23, 0x019b, %r24
	.word 0xfed46135  ! 3814: LDSHA_I	ldsha	[%r17, + 0x0135] %asi, %r31
	.word 0xf895c020  ! 3816: LDUHA_R	lduha	[%r23, %r0] 0x01, %r28
T2_asi_reg_wr_170:
	mov	0x2d, %r14
	.word 0xfaf38e80  ! 3817: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf8d42167  ! 3821: LDSHA_I	ldsha	[%r16, + 0x0167] %asi, %r28
	.word 0xb32d7001  ! 3823: SLLX_I	sllx	%r21, 0x0001, %r25
cpu_intr_2_318:
	setx	0x3d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 3)
	.word 0xf65cc000  ! 3828: LDX_R	ldx	[%r19 + %r0], %r27
cpu_intr_2_319:
	setx	0x3c0239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 22)
	.word 0xf2cc0020  ! 3832: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r25
cpu_intr_2_320:
	setx	0x3c013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe84a014  ! 3839: LDUWA_I	lduwa	[%r18, + 0x0014] %asi, %r31
	.word 0xfc858020  ! 3842: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
T2_asi_reg_rd_165:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 3843: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_321:
	setx	0x3d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983fd2  ! 3849: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd2, %hpstate
	ta	T_CHANGE_TO_TL1
	.word 0xfc95c020  ! 3854: LDUHA_R	lduha	[%r23, %r0] 0x01, %r30
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 27)
	.word 0xf0950020  ! 3856: LDUHA_R	lduha	[%r20, %r0] 0x01, %r24
T2_asi_reg_wr_171:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 3857: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_322:
	setx	0x3d0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93c5000  ! 3861: SRAX_R	srax	%r17, %r0, %r28
	.word 0xf8c5a109  ! 3864: LDSWA_I	ldswa	[%r22, + 0x0109] %asi, %r28
T2_asi_reg_rd_166:
	mov	0x2e, %r14
	.word 0xf4db89e0  ! 3865: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f12  ! 3868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f12, %hpstate
T2_asi_reg_wr_172:
	mov	0x2, %r14
	.word 0xf2f389e0  ! 3870: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_323:
	setx	0x3e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_324:
	setx	0x3c0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2454000  ! 3880: ADDC_R	addc 	%r21, %r0, %r25
	.word 0xf8450000  ! 3882: LDSW_R	ldsw	[%r20 + %r0], %r28
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfe5d0000  ! 3884: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xbebcc000  ! 3885: XNORcc_R	xnorcc 	%r19, %r0, %r31
T2_asi_reg_wr_173:
	mov	0x12, %r14
	.word 0xf6f38e40  ! 3891: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_174:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 3896: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf004c000  ! 3901: LDUW_R	lduw	[%r19 + %r0], %r24
	ta	T_CHANGE_HPRIV
	.word 0xfccca01b  ! 3903: LDSBA_I	ldsba	[%r18, + 0x001b] %asi, %r30
	.word 0xb7510000  ! 3904: RDPR_TICK	<illegal instruction>
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 1c)
	.word 0x9195a15e  ! 3909: WRPR_PIL_I	wrpr	%r22, 0x015e, %pil
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 33)
	.word 0xf6dd615b  ! 3912: LDXA_I	ldxa	[%r21, + 0x015b] %asi, %r27
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 34)
	.word 0xfa158000  ! 3918: LDUH_R	lduh	[%r22 + %r0], %r29
	.word 0xf48d0020  ! 3921: LDUBA_R	lduba	[%r20, %r0] 0x01, %r26
	.word 0xb4848000  ! 3926: ADDcc_R	addcc 	%r18, %r0, %r26
	.word 0xf6d52018  ! 3927: LDSHA_I	ldsha	[%r20, + 0x0018] %asi, %r27
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983912  ! 3933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1912, %hpstate
	.word 0xf6458000  ! 3935: LDSW_R	ldsw	[%r22 + %r0], %r27
cpu_intr_2_325:
	setx	0x3f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_167:
	mov	0x2e, %r14
	.word 0xf4db8e80  ! 3946: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf4154000  ! 3948: LDUH_R	lduh	[%r21 + %r0], %r26
cpu_intr_2_326:
	setx	0x3d010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfe8c8020  ! 3953: LDUBA_R	lduba	[%r18, %r0] 0x01, %r31
cpu_intr_2_327:
	setx	0x3e0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_328:
	setx	0x3f013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_168:
	mov	0x2e, %r14
	.word 0xf6db8e80  ! 3958: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_175:
	mov	0x23, %r14
	.word 0xfaf38e40  ! 3961: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_176:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 3962: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_177:
	mov	0x13, %r14
	.word 0xfaf38e80  ! 3970: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 37)
	.word 0xf0c5618d  ! 3974: LDSWA_I	ldswa	[%r21, + 0x018d] %asi, %r24
	.word 0xb21d209b  ! 3975: XOR_I	xor 	%r20, 0x009b, %r25
T2_asi_reg_rd_169:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 3977: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_170:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 3978: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfa4cc000  ! 3979: LDSB_R	ldsb	[%r19 + %r0], %r29
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_329:
	setx	0x3d0011, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_171:
	mov	0x32, %r14
	.word 0xfadb8e40  ! 3983: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8c521db  ! 3985: LDSWA_I	ldswa	[%r20, + 0x01db] %asi, %r28
cpu_intr_2_330:
	setx	0x3e030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_331:
	setx	0x3d030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_332:
	setx	0x3c021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_wr_178:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 3994: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_333:
	setx	0x3f0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c54020  ! 4001: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
	.word 0xfc854020  ! 4005: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r30
	.word 0xf2856061  ! 4006: LDUWA_I	lduwa	[%r21, + 0x0061] %asi, %r25
cpu_intr_2_334:
	setx	0x3e0106, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_179:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 4012: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_335:
	setx	0x3f0111, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_172:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 4016: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf0854020  ! 4018: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r24
	.word 0xf28c60e7  ! 4019: LDUBA_I	lduba	[%r17, + 0x00e7] %asi, %r25
cpu_intr_2_336:
	setx	0x3f011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_337:
	setx	0x3c0121, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_180:
	mov	0x1c, %r14
	.word 0xfaf38e40  ! 4029: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_181:
	mov	0x8, %r14
	.word 0xf4f384a0  ! 4031: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
cpu_intr_2_338:
	setx	0x3e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_339:
	setx	0x3f0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2954020  ! 4039: LDUHA_R	lduha	[%r21, %r0] 0x01, %r25
	.word 0xf4940020  ! 4040: LDUHA_R	lduha	[%r16, %r0] 0x01, %r26
cpu_intr_2_340:
	setx	0x3f021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_341:
	setx	0x3d0210, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_182:
	mov	0x29, %r14
	.word 0xfcf38e60  ! 4050: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfc8d613f  ! 4051: LDUBA_I	lduba	[%r21, + 0x013f] %asi, %r30
T2_asi_reg_wr_183:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 4052: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf0c4212e  ! 4055: LDSWA_I	ldswa	[%r16, + 0x012e] %asi, %r24
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_173:
	mov	0x2, %r14
	.word 0xf8db84a0  ! 4057: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_2_342:
	setx	0x3d030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_343:
	setx	0x3e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec4c000  ! 4062: ADDCcc_R	addccc 	%r19, %r0, %r31
	.word 0xf285e1ee  ! 4063: LDUWA_I	lduwa	[%r23, + 0x01ee] %asi, %r25
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa8d20e3  ! 4066: LDUBA_I	lduba	[%r20, + 0x00e3] %asi, %r29
	.word 0xf44de07e  ! 4067: LDSB_I	ldsb	[%r23 + 0x007e], %r26
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 12)
	.word 0xbc05c000  ! 4073: ADD_R	add 	%r23, %r0, %r30
	.word 0xf295605e  ! 4074: LDUHA_I	lduha	[%r21, + 0x005e] %asi, %r25
cpu_intr_2_344:
	setx	0x3e0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2840020  ! 4076: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
	.word 0xb29d4000  ! 4077: XORcc_R	xorcc 	%r21, %r0, %r25
	.word 0xfa850020  ! 4084: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r29
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_345:
	setx	0x3e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_346:
	setx	0x3d002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_184:
	mov	0x2f, %r14
	.word 0xf2f384a0  ! 4094: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb02d8000  ! 4095: ANDN_R	andn 	%r22, %r0, %r24
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 38)
	.word 0xf28d0020  ! 4099: LDUBA_R	lduba	[%r20, %r0] 0x01, %r25
T2_asi_reg_wr_185:
	mov	0x20, %r14
	.word 0xf0f38400  ! 4105: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_347:
	setx	0x3f0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982840  ! 4107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0840, %hpstate
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 2a)
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982892  ! 4110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0892, %hpstate
T2_asi_reg_rd_174:
	mov	0x36, %r14
	.word 0xfcdb89e0  ! 4113: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982b12  ! 4114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b12, %hpstate
	.word 0xfe5ca0fb  ! 4115: LDX_I	ldx	[%r18 + 0x00fb], %r31
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_175:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 4117: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_2_348:
	setx	0x3f0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_176:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 4121: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_349:
	setx	0x3e032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_350:
	setx	0x3d0134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_351:
	setx	0x3f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7641800  ! 4133: MOVcc_R	<illegal instruction>
cpu_intr_2_352:
	setx	0x410034, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, f)
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, b)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_353:
	setx	0x430304, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_177:
	mov	0x25, %r14
	.word 0xf6db8400  ! 4146: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 23)
	.word 0xb7510000  ! 4149: RDPR_TICK	<illegal instruction>
T2_asi_reg_wr_186:
	mov	0xb, %r14
	.word 0xf6f389e0  ! 4151: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T2_asi_reg_wr_187:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 4153: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T2_asi_reg_rd_178:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb2b4c000  ! 4155: ORNcc_R	orncc 	%r19, %r0, %r25
	.word 0xfe8d8020  ! 4157: LDUBA_R	lduba	[%r22, %r0] 0x01, %r31
	.word 0xf4d40020  ! 4159: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r26
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf4d4c020  ! 4162: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r26
cpu_intr_2_354:
	setx	0x400214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_355:
	setx	0x41020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8854020  ! 4173: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r28
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_356:
	setx	0x42001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_188:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 4180: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_357:
	setx	0x410313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed40020  ! 4183: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r31
cpu_intr_2_358:
	setx	0x43021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd641800  ! 4194: MOVcc_R	<illegal instruction>
	.word 0xb6158000  ! 4195: OR_R	or 	%r22, %r0, %r27
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_359:
	setx	0x40031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5c8000  ! 4208: LDX_R	ldx	[%r18 + %r0], %r31
T2_asi_reg_rd_179:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 4212: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_360:
	setx	0x410025, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb2bd8000  ! 4217: XNORcc_R	xnorcc 	%r22, %r0, %r25
T2_asi_reg_rd_180:
	mov	0x20, %r14
	.word 0xfcdb8e40  ! 4218: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf49461c2  ! 4219: LDUHA_I	lduha	[%r17, + 0x01c2] %asi, %r26
	.word 0xfc5d6092  ! 4222: LDX_I	ldx	[%r21 + 0x0092], %r30
cpu_intr_2_361:
	setx	0x42032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_362:
	setx	0x42002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc85e0d3  ! 4225: LDUWA_I	lduwa	[%r23, + 0x00d3] %asi, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf88de1ce  ! 4228: LDUBA_I	lduba	[%r23, + 0x01ce] %asi, %r28
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_363:
	setx	0x400319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_364:
	setx	0x400225, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_181:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 4235: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb09c8000  ! 4236: XORcc_R	xorcc 	%r18, %r0, %r24
cpu_intr_2_365:
	setx	0x40020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_366:
	setx	0x41032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xba1d202c  ! 4248: XOR_I	xor 	%r20, 0x002c, %r29
cpu_intr_2_367:
	setx	0x400204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf445e08b  ! 4250: LDSW_I	ldsw	[%r23 + 0x008b], %r26
T2_asi_reg_wr_189:
	mov	0x15, %r14
	.word 0xf4f389e0  ! 4255: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfc9520a5  ! 4257: LDUHA_I	lduha	[%r20, + 0x00a5] %asi, %r30
	.word 0xf255c000  ! 4258: LDSH_R	ldsh	[%r23 + %r0], %r25
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 1a)
	.word 0xb034e189  ! 4265: ORN_I	orn 	%r19, 0x0189, %r24
	.word 0xf004c000  ! 4268: LDUW_R	lduw	[%r19 + %r0], %r24
cpu_intr_2_368:
	setx	0x410200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d5a0ad  ! 4271: LDSHA_I	ldsha	[%r22, + 0x00ad] %asi, %r28
	.word 0xfccc216f  ! 4272: LDSBA_I	ldsba	[%r16, + 0x016f] %asi, %r30
	.word 0xb4a58000  ! 4273: SUBcc_R	subcc 	%r22, %r0, %r26
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 17)
	.word 0xb68421ba  ! 4275: ADDcc_I	addcc 	%r16, 0x01ba, %r27
	.word 0xf2cc2155  ! 4276: LDSBA_I	ldsba	[%r16, + 0x0155] %asi, %r25
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 3b)
	.word 0xb12d8000  ! 4278: SLL_R	sll 	%r22, %r0, %r24
	.word 0xb4c44000  ! 4280: ADDCcc_R	addccc 	%r17, %r0, %r26
	.word 0xf48d8020  ! 4287: LDUBA_R	lduba	[%r22, %r0] 0x01, %r26
	.word 0xf6c48020  ! 4289: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r27
T2_asi_reg_wr_190:
	mov	0x28, %r14
	.word 0xf2f38e40  ! 4290: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbd2c1000  ! 4291: SLLX_R	sllx	%r16, %r0, %r30
	.word 0xb88521b8  ! 4292: ADDcc_I	addcc 	%r20, 0x01b8, %r28
T2_asi_reg_rd_182:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 4293: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf2058000  ! 4294: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xfe85e0cd  ! 4295: LDUWA_I	lduwa	[%r23, + 0x00cd] %asi, %r31
	.word 0xb53ca001  ! 4297: SRA_I	sra 	%r18, 0x0001, %r26
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 0)
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 34)
	ta	T_CHANGE_TO_TL1
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_191:
	mov	0x1d, %r14
	.word 0xf0f38e40  ! 4307: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf45c60c3  ! 4308: LDX_I	ldx	[%r17 + 0x00c3], %r26
cpu_intr_2_369:
	setx	0x430324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc044000  ! 4310: LDUW_R	lduw	[%r17 + %r0], %r30
T2_asi_reg_wr_192:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 4311: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_2_370:
	setx	0x400333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe840020  ! 4315: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
	.word 0xf444a080  ! 4316: LDSW_I	ldsw	[%r18 + 0x0080], %r26
cpu_intr_2_371:
	setx	0x420010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45cc000  ! 4323: LDX_R	ldx	[%r19 + %r0], %r26
T2_asi_reg_wr_193:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 4324: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982850  ! 4325: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0850, %hpstate
	.word 0xb8b50000  ! 4327: ORNcc_R	orncc 	%r20, %r0, %r28
cpu_intr_2_372:
	setx	0x400003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_373:
	setx	0x40012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_374:
	setx	0x42030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_375:
	setx	0x430002, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_183:
	mov	0x29, %r14
	.word 0xf2db89e0  ! 4337: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb72c9000  ! 4338: SLLX_R	sllx	%r18, %r0, %r27
	.word 0xf60c8000  ! 4339: LDUB_R	ldub	[%r18 + %r0], %r27
cpu_intr_2_376:
	setx	0x430024, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf4c50020  ! 4343: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 36)
	.word 0xf0858020  ! 4351: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
	.word 0xfcc5e025  ! 4353: LDSWA_I	ldswa	[%r23, + 0x0025] %asi, %r30
cpu_intr_2_377:
	setx	0x410003, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_184:
	mov	0x12, %r14
	.word 0xfedb8e60  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_wr_194:
	mov	0x29, %r14
	.word 0xfaf38e80  ! 4360: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf25d0000  ! 4362: LDX_R	ldx	[%r20 + %r0], %r25
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_378:
	setx	0x410100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41c60ac  ! 4382: XOR_I	xor 	%r17, 0x00ac, %r26
	.word 0xf484e0d7  ! 4383: LDUWA_I	lduwa	[%r19, + 0x00d7] %asi, %r26
	.word 0xfa5d2031  ! 4384: LDX_I	ldx	[%r20 + 0x0031], %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xb294a0b8  ! 4388: ORcc_I	orcc 	%r18, 0x00b8, %r25
	.word 0xbc9c0000  ! 4389: XORcc_R	xorcc 	%r16, %r0, %r30
T2_asi_reg_rd_185:
	mov	0x2, %r14
	.word 0xfadb84a0  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_rd_186:
	mov	0x8, %r14
	.word 0xf6db89e0  ! 4399: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_wr_195:
	mov	0x14, %r14
	.word 0xfef384a0  ! 4404: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b90  ! 4411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b90, %hpstate
	.word 0xfcd52072  ! 4413: LDSHA_I	ldsha	[%r20, + 0x0072] %asi, %r30
	.word 0xfa5c4000  ! 4414: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xf2854020  ! 4415: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r25
cpu_intr_2_379:
	setx	0x420000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28d218a  ! 4419: LDUBA_I	lduba	[%r20, + 0x018a] %asi, %r25
cpu_intr_2_380:
	setx	0x42022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_381:
	setx	0x410214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20d21fb  ! 4427: LDUB_I	ldub	[%r20 + 0x01fb], %r25
	.word 0xf00c8000  ! 4428: LDUB_R	ldub	[%r18 + %r0], %r24
cpu_intr_2_382:
	setx	0x41033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4de00e  ! 4430: LDSB_I	ldsb	[%r23 + 0x000e], %r30
T2_asi_reg_rd_187:
	mov	0x1d, %r14
	.word 0xfadb8e80  ! 4431: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf00c20f0  ! 4432: LDUB_I	ldub	[%r16 + 0x00f0], %r24
T2_asi_reg_wr_196:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 4434: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e18  ! 4437: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e18, %hpstate
	.word 0xfe8c20b3  ! 4439: LDUBA_I	lduba	[%r16, + 0x00b3] %asi, %r31
	.word 0xf2d4e0ee  ! 4440: LDSHA_I	ldsha	[%r19, + 0x00ee] %asi, %r25
	.word 0xfa5ca16d  ! 4442: LDX_I	ldx	[%r18 + 0x016d], %r29
T2_asi_reg_wr_197:
	mov	0x3, %r14
	.word 0xf8f38400  ! 4444: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_wr_198:
	mov	0x21, %r14
	.word 0xf0f38400  ! 4445: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 4)
	.word 0xf20d0000  ! 4450: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0x919560b5  ! 4451: WRPR_PIL_I	wrpr	%r21, 0x00b5, %pil
T2_asi_reg_wr_199:
	mov	0x18, %r14
	.word 0xf8f38e80  ! 4453: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 9)
	ta	T_CHANGE_TO_TL0
	.word 0xb32c4000  ! 4458: SLL_R	sll 	%r17, %r0, %r25
	.word 0xf855611b  ! 4460: LDSH_I	ldsh	[%r21 + 0x011b], %r28
	.word 0xfc5d60d1  ! 4465: LDX_I	ldx	[%r21 + 0x00d1], %r30
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 18)
	.word 0xf085e0dd  ! 4470: LDUWA_I	lduwa	[%r23, + 0x00dd] %asi, %r24
	.word 0xf445a025  ! 4474: LDSW_I	ldsw	[%r22 + 0x0025], %r26
T2_asi_reg_rd_188:
	mov	0x2c, %r14
	.word 0xf0db8400  ! 4476: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_2_383:
	setx	0x42031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_384:
	setx	0x410314, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_200:
	mov	0x17, %r14
	.word 0xf2f38e60  ! 4479: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_385:
	setx	0x40003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 4484: RDPR_TL	<illegal instruction>
	.word 0xf4dd210c  ! 4486: LDXA_I	ldxa	[%r20, + 0x010c] %asi, %r26
	.word 0xfacd61f1  ! 4488: LDSBA_I	ldsba	[%r21, + 0x01f1] %asi, %r29
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 15)
	.word 0xfe44601e  ! 4491: LDSW_I	ldsw	[%r17 + 0x001e], %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_2_386:
	setx	0x410219, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb60c4000  ! 4500: AND_R	and 	%r17, %r0, %r27
	.word 0xf854a12a  ! 4502: LDSH_I	ldsh	[%r18 + 0x012a], %r28
	.word 0xf4554000  ! 4503: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xf2cca084  ! 4504: LDSBA_I	ldsba	[%r18, + 0x0084] %asi, %r25
T2_asi_reg_rd_189:
	mov	0x13, %r14
	.word 0xf4db8e40  ! 4505: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbe050000  ! 4506: ADD_R	add 	%r20, %r0, %r31
	.word 0xb8958000  ! 4507: ORcc_R	orcc 	%r22, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf405a04e  ! 4509: LDUW_I	lduw	[%r22 + 0x004e], %r26
	.word 0xfe45e1eb  ! 4510: LDSW_I	ldsw	[%r23 + 0x01eb], %r31
cpu_intr_2_387:
	setx	0x410324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_388:
	setx	0x430018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_389:
	setx	0x410326, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_201:
	mov	0x1a, %r14
	.word 0xf0f38e40  ! 4521: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_390:
	setx	0x40033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf685e107  ! 4528: LDUWA_I	lduwa	[%r23, + 0x0107] %asi, %r27
	.word 0xf04de11a  ! 4532: LDSB_I	ldsb	[%r23 + 0x011a], %r24
	.word 0xfa8461a0  ! 4533: LDUWA_I	lduwa	[%r17, + 0x01a0] %asi, %r29
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 22)
	.word 0xf6948020  ! 4537: LDUHA_R	lduha	[%r18, %r0] 0x01, %r27
	.word 0xbe35c000  ! 4538: SUBC_R	orn 	%r23, %r0, %r31
cpu_intr_2_391:
	setx	0x40032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_392:
	setx	0x43011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_190:
	mov	0x25, %r14
	.word 0xfedb89e0  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf24d4000  ! 4551: LDSB_R	ldsb	[%r21 + %r0], %r25
	.word 0xfe946076  ! 4555: LDUHA_I	lduha	[%r17, + 0x0076] %asi, %r31
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a48  ! 4556: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a48, %hpstate
	.word 0xf054c000  ! 4557: LDSH_R	ldsh	[%r19 + %r0], %r24
	.word 0xf60d4000  ! 4563: LDUB_R	ldub	[%r21 + %r0], %r27
	ta	T_CHANGE_HPRIV
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 0)
	.word 0xf895212d  ! 4571: LDUHA_I	lduha	[%r20, + 0x012d] %asi, %r28
	.word 0xf805c000  ! 4575: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xbd518000  ! 4578: RDPR_PSTATE	<illegal instruction>
T2_asi_reg_rd_191:
	mov	0x18, %r14
	.word 0xf4db89e0  ! 4579: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_393:
	setx	0x400126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6954020  ! 4586: LDUHA_R	lduha	[%r21, %r0] 0x01, %r27
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfc5d0000  ! 4589: LDX_R	ldx	[%r20 + %r0], %r30
cpu_intr_2_394:
	setx	0x43031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 30)
	.word 0xf6dde0e6  ! 4599: LDXA_I	ldxa	[%r23, + 0x00e6] %asi, %r27
cpu_intr_2_395:
	setx	0x40020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_396:
	setx	0x400010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 9)
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982f52  ! 4607: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f52, %hpstate
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_202:
	mov	0x1, %r14
	.word 0xfcf38e80  ! 4609: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_rd_192:
	mov	0x32, %r14
	.word 0xfedb8e60  ! 4610: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_397:
	setx	0x44030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc544000  ! 4615: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xf20c4000  ! 4616: LDUB_R	ldub	[%r17 + %r0], %r25
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983d88  ! 4618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d88, %hpstate
	.word 0xbe350000  ! 4621: ORN_R	orn 	%r20, %r0, %r31
	.word 0xf08da05a  ! 4624: LDUBA_I	lduba	[%r22, + 0x005a] %asi, %r24
	.word 0xf85d4000  ! 4625: LDX_R	ldx	[%r21 + %r0], %r28
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 3)
	.word 0xf6446100  ! 4627: LDSW_I	ldsw	[%r17 + 0x0100], %r27
cpu_intr_2_398:
	setx	0x47021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 10)
	.word 0xf404c000  ! 4631: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xb77ce401  ! 4632: MOVR_I	movre	%r19, 0x1, %r27
cpu_intr_2_399:
	setx	0x440105, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_203:
	mov	0x4, %r14
	.word 0xf4f38e40  ! 4634: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 33)
	.word 0xfa844020  ! 4637: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r29
T2_asi_reg_rd_193:
	mov	0x32, %r14
	.word 0xfedb8e40  ! 4638: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_rd_194:
	mov	0x4, %r14
	.word 0xfcdb8e60  ! 4640: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_2_400:
	setx	0x450009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00c606e  ! 4645: LDUB_I	ldub	[%r17 + 0x006e], %r24
	.word 0xbc0cc000  ! 4650: AND_R	and 	%r19, %r0, %r30
cpu_intr_2_401:
	setx	0x44022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_402:
	setx	0x470122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_403:
	setx	0x45021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0ce0e6  ! 4655: LDUB_I	ldub	[%r19 + 0x00e6], %r29
	.word 0xfacd213d  ! 4658: LDSBA_I	ldsba	[%r20, + 0x013d] %asi, %r29
cpu_intr_2_404:
	setx	0x45031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf854a1f8  ! 4662: LDSH_I	ldsh	[%r18 + 0x01f8], %r28
cpu_intr_2_405:
	setx	0x440234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 37)
	.word 0xfa8dc020  ! 4676: LDUBA_R	lduba	[%r23, %r0] 0x01, %r29
	.word 0xf8ccc020  ! 4677: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r28
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, a)
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982918  ! 4683: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0918, %hpstate
	.word 0xf2546156  ! 4686: LDSH_I	ldsh	[%r17 + 0x0156], %r25
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 39)
	.word 0xbb7da401  ! 4688: MOVR_I	movre	%r22, 0x1, %r29
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 30)
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f9a  ! 4690: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f9a, %hpstate
	.word 0xf454a12d  ! 4694: LDSH_I	ldsh	[%r18 + 0x012d], %r26
T2_asi_reg_wr_204:
	mov	0x20, %r14
	.word 0xfaf38e40  ! 4698: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_195:
	mov	0x13, %r14
	.word 0xfcdb8e80  ! 4700: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_406:
	setx	0x44001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf88c0020  ! 4706: LDUBA_R	lduba	[%r16, %r0] 0x01, %r28
	.word 0xfc05a001  ! 4708: LDUW_I	lduw	[%r22 + 0x0001], %r30
	.word 0xf80da12c  ! 4712: LDUB_I	ldub	[%r22 + 0x012c], %r28
	.word 0xb72c8000  ! 4715: SLL_R	sll 	%r18, %r0, %r27
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 39)
	.word 0xf45d2086  ! 4717: LDX_I	ldx	[%r20 + 0x0086], %r26
	.word 0xf6448000  ! 4718: LDSW_R	ldsw	[%r18 + %r0], %r27
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_407:
	setx	0x45021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_408:
	setx	0x46002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_409:
	setx	0x470201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dde0e2  ! 4724: LDXA_I	ldxa	[%r23, + 0x00e2] %asi, %r25
	.word 0xfc5c4000  ! 4727: LDX_R	ldx	[%r17 + %r0], %r30
T2_asi_reg_wr_205:
	mov	0x24, %r14
	.word 0xf6f384a0  ! 4728: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
	.word 0xf41521fd  ! 4732: LDUH_I	lduh	[%r20 + 0x01fd], %r26
	.word 0xf2950020  ! 4733: LDUHA_R	lduha	[%r20, %r0] 0x01, %r25
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 39)
	.word 0xf605e0d9  ! 4735: LDUW_I	lduw	[%r23 + 0x00d9], %r27
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_410:
	setx	0x450020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20c21cd  ! 4754: LDUB_I	ldub	[%r16 + 0x01cd], %r25
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfc94a0a0  ! 4757: LDUHA_I	lduha	[%r18, + 0x00a0] %asi, %r30
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 7)
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982912  ! 4762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0912, %hpstate
	.word 0xf05d4000  ! 4763: LDX_R	ldx	[%r21 + %r0], %r24
cpu_intr_2_411:
	setx	0x450201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80de1a8  ! 4767: LDUB_I	ldub	[%r23 + 0x01a8], %r28
T2_asi_reg_wr_206:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 4768: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf8cca133  ! 4771: LDSBA_I	ldsba	[%r18, + 0x0133] %asi, %r28
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f88  ! 4777: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f88, %hpstate
T2_asi_reg_rd_196:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 4778: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_207:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 4780: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf644e088  ! 4783: LDSW_I	ldsw	[%r19 + 0x0088], %r27
	.word 0xbe2c0000  ! 4787: ANDN_R	andn 	%r16, %r0, %r31
	.word 0xfc540000  ! 4789: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xf64d8000  ! 4790: LDSB_R	ldsb	[%r22 + %r0], %r27
	.word 0xb6b50000  ! 4793: ORNcc_R	orncc 	%r20, %r0, %r27
T2_asi_reg_rd_197:
	mov	0x0, %r14
	.word 0xf4db84a0  ! 4794: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfa040000  ! 4795: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xfa8de1dd  ! 4796: LDUBA_I	lduba	[%r23, + 0x01dd] %asi, %r29
T2_asi_reg_rd_198:
	mov	0x15, %r14
	.word 0xf8db8e80  ! 4797: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T2_asi_reg_wr_208:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 4798: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf485e057  ! 4801: LDUWA_I	lduwa	[%r23, + 0x0057] %asi, %r26
	.word 0xf68da10c  ! 4805: LDUBA_I	lduba	[%r22, + 0x010c] %asi, %r27
	.word 0xb3508000  ! 4812: RDPR_TSTATE	<illegal instruction>
cpu_intr_2_412:
	setx	0x450220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa55209e  ! 4816: LDSH_I	ldsh	[%r20 + 0x009e], %r29
T2_asi_reg_wr_209:
	mov	0x37, %r14
	.word 0xf2f38e40  ! 4817: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xba1d6056  ! 4824: XOR_I	xor 	%r21, 0x0056, %r29
cpu_intr_2_413:
	setx	0x450315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dc6195  ! 4831: LDXA_I	ldxa	[%r17, + 0x0195] %asi, %r24
cpu_intr_2_414:
	setx	0x47020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_415:
	setx	0x460127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc04a03d  ! 4847: LDUW_I	lduw	[%r18 + 0x003d], %r30
	.word 0xf4d420b6  ! 4851: LDSHA_I	ldsha	[%r16, + 0x00b6] %asi, %r26
	.word 0xf05c4000  ! 4853: LDX_R	ldx	[%r17 + %r0], %r24
T2_asi_reg_rd_199:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf40de11b  ! 4856: LDUB_I	ldub	[%r23 + 0x011b], %r26
T2_asi_reg_rd_200:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 4860: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb2b4e1f4  ! 4861: SUBCcc_I	orncc 	%r19, 0x01f4, %r25
	.word 0xfc958020  ! 4864: LDUHA_R	lduha	[%r22, %r0] 0x01, %r30
cpu_intr_2_416:
	setx	0x46031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4946179  ! 4867: LDUHA_I	lduha	[%r17, + 0x0179] %asi, %r26
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 8)
	.word 0xf6cce021  ! 4869: LDSBA_I	ldsba	[%r19, + 0x0021] %asi, %r27
T2_asi_reg_rd_201:
	mov	0x3, %r14
	.word 0xf8db84a0  ! 4870: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf6c4a1b0  ! 4872: LDSWA_I	ldswa	[%r18, + 0x01b0] %asi, %r27
	.word 0x89942116  ! 4873: WRPR_TICK_I	wrpr	%r16, 0x0116, %tick
	ta	T_CHANGE_TO_TL1
	.word 0xf484606a  ! 4877: LDUWA_I	lduwa	[%r17, + 0x006a] %asi, %r26
	.word 0xfc054000  ! 4883: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xf25c2062  ! 4885: LDX_I	ldx	[%r16 + 0x0062], %r25
cpu_intr_2_417:
	setx	0x460300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4dc000  ! 4892: LDSB_R	ldsb	[%r23 + %r0], %r29
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfcd4e104  ! 4895: LDSHA_I	ldsha	[%r19, + 0x0104] %asi, %r30
	.word 0xf844a16e  ! 4896: LDSW_I	ldsw	[%r18 + 0x016e], %r28
	.word 0xf4548000  ! 4899: LDSH_R	ldsh	[%r18 + %r0], %r26
T2_asi_reg_wr_210:
	mov	0x1b, %r14
	.word 0xfcf38e40  ! 4900: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_rd_202:
	mov	0x2e, %r14
	.word 0xfedb89e0  ! 4905: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, a)
	.word 0xf6044000  ! 4908: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xbd2ce001  ! 4910: SLL_I	sll 	%r19, 0x0001, %r30
	.word 0xfa4421d3  ! 4913: LDSW_I	ldsw	[%r16 + 0x01d3], %r29
T2_asi_reg_wr_211:
	mov	0xc, %r14
	.word 0xf0f38e60  ! 4914: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfc5d0000  ! 4916: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0xf40ce026  ! 4919: LDUB_I	ldub	[%r19 + 0x0026], %r26
	.word 0xfe4d4000  ! 4920: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xb4c4c000  ! 4921: ADDCcc_R	addccc 	%r19, %r0, %r26
cpu_intr_2_418:
	setx	0x45012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 19)
	.word 0xb1520000  ! 4928: RDPR_PIL	rdpr	%pil, %r24
	.word 0xb49de191  ! 4930: XORcc_I	xorcc 	%r23, 0x0191, %r26
cpu_intr_2_419:
	setx	0x470129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45d214a  ! 4935: LDX_I	ldx	[%r20 + 0x014a], %r26
	.word 0xf2058000  ! 4936: LDUW_R	lduw	[%r22 + %r0], %r25
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 1f)
	.word 0xb61cc000  ! 4942: XOR_R	xor 	%r19, %r0, %r27
T2_asi_reg_wr_212:
	mov	0x4, %r14
	.word 0xfef389e0  ! 4943: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_2_420:
	setx	0x47032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc85e1e2  ! 4946: LDUWA_I	lduwa	[%r23, + 0x01e2] %asi, %r30
cpu_intr_2_421:
	setx	0x470239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, a)
	.word 0xf0440000  ! 4952: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xbb2de001  ! 4957: SLL_I	sll 	%r23, 0x0001, %r29
T2_asi_reg_wr_213:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 4958: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	.word 0xfa44216b  ! 4967: LDSW_I	ldsw	[%r16 + 0x016b], %r29
	.word 0xf04ca022  ! 4969: LDSB_I	ldsb	[%r18 + 0x0022], %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf8952151  ! 4972: LDUHA_I	lduha	[%r20, + 0x0151] %asi, %r28
	.word 0xfa5460d1  ! 4973: LDSH_I	ldsh	[%r17 + 0x00d1], %r29
T2_asi_reg_rd_203:
	mov	0x13, %r14
	.word 0xf6db84a0  ! 4976: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfec44020  ! 4977: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_2_422:
	setx	0x46030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 13)
	.word 0xb2948000  ! 4984: ORcc_R	orcc 	%r18, %r0, %r25
	.word 0xf6840020  ! 4985: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, d)
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_423:
	setx	0x470225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_424:
	setx	0x460230, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_wr_0:
	mov	0x35, %r14
	.word 0xf6f38e80  ! 9: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_rd_0:
	mov	0x34, %r14
	.word 0xf6db8e40  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_rd_1:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 12: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 25)
	.word 0xbdaa8820  ! 14: FMOVG	fmovs	%fcc1, %f0, %f30
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 0)
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb5a00020  ! 21: FMOVs	fmovs	%f0, %f26
	.word 0xb0b48000  ! 23: SUBCcc_R	orncc 	%r18, %r0, %r24
	.word 0xbba90820  ! 24: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb5a88820  ! 27: FMOVLE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_1:
	mov	0x3c8, %r14
	.word 0xfcf389e0  ! 28: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb3a588c0  ! 29: FSUBd	fsubd	%f22, %f0, %f56
	.word 0xb1a00520  ! 30: FSQRTs	fsqrt	
T1_asi_reg_wr_2:
	mov	0x3c0, %r14
	.word 0xf2f389e0  ! 33: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbdaa8820  ! 34: FMOVG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_2:
	mov	0x36, %r14
	.word 0xfadb8e40  ! 36: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb3aa8820  ! 48: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbc250000  ! 51: SUB_R	sub 	%r20, %r0, %r30
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_3:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 55: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_0:
	setx	0x1d031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_4:
	mov	0x3c2, %r14
	.word 0xf0db89e0  ! 58: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb9a90820  ! 66: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbcac0000  ! 70: ANDNcc_R	andncc 	%r16, %r0, %r30
	.word 0xb3a81820  ! 73: FMOVRGZ	fmovs	%fcc3, %f0, %f25
T1_asi_reg_rd_5:
	mov	0x3c7, %r14
	.word 0xf0db8e80  ! 76: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb1aa8820  ! 80: FMOVG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_1:
	setx	0x1c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_2:
	setx	0x1d0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 87: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb53c8000  ! 93: SRA_R	sra 	%r18, %r0, %r26
	.word 0xb00c8000  ! 94: AND_R	and 	%r18, %r0, %r24
T1_asi_reg_rd_6:
	mov	0x13, %r14
	.word 0xfcdb8e80  ! 95: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_rd_7:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 97: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb5abc820  ! 99: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbba54940  ! 100: FMULd	fmuld	%f52, %f0, %f60
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, d)
	.word 0xb5aa0820  ! 102: FMOVA	fmovs	%fcc1, %f0, %f26
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb5a98820  ! 108: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbfaa0820  ! 109: FMOVA	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_3:
	mov	0x32, %r14
	.word 0xf6f38e80  ! 111: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 23)
	.word 0xbbaac820  ! 114: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbfa489a0  ! 117: FDIVs	fdivs	%f18, %f0, %f31
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_3:
	setx	0x1d020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_8:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 122: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_9:
	mov	0x3c7, %r14
	.word 0xfcdb89e0  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T1_asi_reg_rd_10:
	mov	0x4, %r14
	.word 0xfadb8e40  ! 125: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_11:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 126: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb7a84820  ! 127: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbda00520  ! 130: FSQRTs	fsqrt	
T1_asi_reg_rd_12:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 131: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_4:
	setx	0x1e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda9c820  ! 138: FMOVVS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_13:
	mov	0x1, %r14
	.word 0xf0db8e80  ! 140: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbda40920  ! 141: FMULs	fmuls	%f16, %f0, %f30
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_14:
	mov	0x1a, %r14
	.word 0xf6db8e40  ! 149: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3a94820  ! 151: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb3aa4820  ! 153: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb5aa8820  ! 156: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb1a549e0  ! 157: FDIVq	dis not found

iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_4:
	mov	0x25, %r14
	.word 0xf8f384a0  ! 163: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbeb58000  ! 167: SUBCcc_R	orncc 	%r22, %r0, %r31
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_5:
	setx	0x1f0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda448c0  ! 177: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xb7a84820  ! 178: FMOVE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_5:
	mov	0x6, %r14
	.word 0xf6f38400  ! 179: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_6:
	setx	0x1e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_7:
	setx	0x1e0008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_6:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 187: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7a489e0  ! 188: FDIVq	dis not found

cpu_intr_1_8:
	setx	0x1f0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 193: FSQRTq	fsqrt	
	.word 0xbfa81420  ! 195: FMOVRNZ	dis not found

cpu_intr_1_9:
	setx	0x1c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_10:
	setx	0x1d0117, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_7:
	mov	0x9, %r14
	.word 0xf2f38e40  ! 203: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_15:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 204: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb3a94820  ! 206: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbec4a043  ! 207: ADDCcc_I	addccc 	%r18, 0x0043, %r31
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_11:
	setx	0x1c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_12:
	setx	0x1c0028, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_16:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 213: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1a5c8a0  ! 214: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xb9a00560  ! 217: FSQRTq	fsqrt	
	.word 0xb605a0ce  ! 218: ADD_I	add 	%r22, 0x00ce, %r27
T1_asi_reg_rd_17:
	mov	0x1, %r14
	.word 0xfedb84a0  ! 219: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbc858000  ! 220: ADDcc_R	addcc 	%r22, %r0, %r30
	.word 0xbba81c20  ! 221: FMOVRGEZ	dis not found

iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbe0ca00d  ! 224: AND_I	and 	%r18, 0x000d, %r31
	.word 0xbba00040  ! 227: FMOVd	fmovd	%f0, %f60
	.word 0xb0c52137  ! 229: ADDCcc_I	addccc 	%r20, 0x0137, %r24
T1_asi_reg_wr_8:
	mov	0x3c1, %r14
	.word 0xf8f38e60  ! 231: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb644c000  ! 233: ADDC_R	addc 	%r19, %r0, %r27
cpu_intr_1_13:
	setx	0x1f0131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_14:
	setx	0x1d0126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_15:
	setx	0x1f0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 241: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbda80420  ! 242: FMOVRZ	dis not found

T1_asi_reg_wr_9:
	mov	0x4, %r14
	.word 0xf4f38e40  ! 243: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_wr_10:
	mov	0x1d, %r14
	.word 0xfef38e80  ! 246: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_wr_11:
	mov	0x35, %r14
	.word 0xf2f38e40  ! 247: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbaac820  ! 249: FMOVGE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_18:
	mov	0x13, %r14
	.word 0xfcdb89e0  ! 251: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T1_asi_reg_rd_19:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 254: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_1_16:
	setx	0x1c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c960  ! 258: FMULq	dis not found

	.word 0xb8458000  ! 259: ADDC_R	addc 	%r22, %r0, %r28
cpu_intr_1_17:
	setx	0x1e0302, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_20:
	mov	0x26, %r14
	.word 0xf6db8e40  ! 263: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_18:
	setx	0x1f0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 267: FMOVRGEZ	dis not found

T1_asi_reg_wr_12:
	mov	0x2f, %r14
	.word 0xf8f38e40  ! 268: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 8)
	.word 0xbac50000  ! 273: ADDCcc_R	addccc 	%r20, %r0, %r29
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_13:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 277: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_wr_14:
	mov	0x3c0, %r14
	.word 0xf8f384a0  ! 279: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_19:
	setx	0x1d0018, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_21:
	mov	0x3c8, %r14
	.word 0xf8db84a0  ! 283: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 13)
	.word 0xbba81820  ! 285: FMOVRGZ	fmovs	%fcc3, %f0, %f29
T1_asi_reg_wr_15:
	mov	0x2d, %r14
	.word 0xfaf38e60  ! 287: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_1_20:
	setx	0x1e003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 0)
	.word 0xb9a00540  ! 292: FSQRTd	fsqrt	
T1_asi_reg_wr_16:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 294: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb3a9c820  ! 295: FMOVVS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_21:
	setx	0x1d0117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_22:
	setx	0x1c0221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_17:
	mov	0xb, %r14
	.word 0xfaf389e0  ! 308: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbdaac820  ! 310: FMOVGE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_23:
	setx	0x1d0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda549a0  ! 313: FDIVs	fdivs	%f21, %f0, %f30
cpu_intr_1_24:
	setx	0x1c000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_25:
	setx	0x1e0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a40940  ! 323: FMULd	fmuld	%f16, %f0, %f24
	.word 0xb3abc820  ! 326: FMOVVC	fmovs	%fcc1, %f0, %f25
cpu_intr_1_26:
	setx	0x1c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_27:
	setx	0x1c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_22:
	mov	0x3c3, %r14
	.word 0xfcdb8400  ! 334: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 25)
	.word 0xb7a00040  ! 336: FMOVd	fmovd	%f0, %f58
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, a)
	.word 0xbdaa4820  ! 338: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a81820  ! 340: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb3ab0820  ! 341: FMOVGU	fmovs	%fcc1, %f0, %f25
cpu_intr_1_28:
	setx	0x1d0121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_29:
	setx	0x1f032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 349: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb7a98820  ! 354: FMOVNEG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_23:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 355: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_1_30:
	setx	0x1e0135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbba54940  ! 359: FMULd	fmuld	%f52, %f0, %f60
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbc3d6103  ! 361: XNOR_I	xnor 	%r21, 0x0103, %r30
T1_asi_reg_wr_18:
	mov	0x10, %r14
	.word 0xf0f38400  ! 365: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_31:
	setx	0x1f0220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_32:
	setx	0x1f0220, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_19:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 372: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_wr_20:
	mov	0x4, %r14
	.word 0xfaf389e0  ! 373: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb17c2401  ! 375: MOVR_I	movre	%r16, 0x1, %r24
	.word 0xb1a4c8c0  ! 377: FSUBd	fsubd	%f50, %f0, %f24
cpu_intr_1_33:
	setx	0x1e0037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_34:
	setx	0x1f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_24:
	mov	0x30, %r14
	.word 0xf2db8e40  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1a488e0  ! 385: FSUBq	dis not found

T1_asi_reg_rd_25:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 388: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 30)
	.word 0xb1a00020  ! 396: FMOVs	fmovs	%f0, %f24
	.word 0xbda489e0  ! 397: FDIVq	dis not found

cpu_intr_1_35:
	setx	0x1f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_36:
	setx	0x1c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_26:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 405: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_37:
	setx	0x1d0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 407: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb03d60c2  ! 409: XNOR_I	xnor 	%r21, 0x00c2, %r24
cpu_intr_1_38:
	setx	0x1f0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00020  ! 418: FMOVs	fmovs	%f0, %f29
T1_asi_reg_wr_21:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 421: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, f)
	.word 0xbda48960  ! 429: FMULq	dis not found

	.word 0xb9a80420  ! 432: FMOVRZ	dis not found

	.word 0xb7aa0820  ! 433: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb5a588c0  ! 437: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xb7ab0820  ! 440: FMOVGU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_39:
	setx	0x1f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_40:
	setx	0x1, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 446: FMOVRZ	dis not found

	.word 0xb7a90820  ! 450: FMOVLEU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_41:
	setx	0x200133, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_27:
	mov	0x3c6, %r14
	.word 0xfcdb8e60  ! 461: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbfa4c8c0  ! 463: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xb4b421fb  ! 464: SUBCcc_I	orncc 	%r16, 0x01fb, %r26
T1_asi_reg_wr_22:
	mov	0x29, %r14
	.word 0xf2f38e60  ! 466: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb0ad61dd  ! 470: ANDNcc_I	andncc 	%r21, 0x01dd, %r24
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 33)
	.word 0xbcad8000  ! 480: ANDNcc_R	andncc 	%r22, %r0, %r30
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 19)
	.word 0xbfabc820  ! 485: FMOVVC	fmovs	%fcc1, %f0, %f31
cpu_intr_1_42:
	setx	0x210029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a40920  ! 488: FMULs	fmuls	%f16, %f0, %f26
T1_asi_reg_rd_28:
	mov	0x24, %r14
	.word 0xf2db84a0  ! 489: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_43:
	setx	0x230321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 15)
	.word 0xbfaa4820  ! 494: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a80820  ! 495: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb9a80c20  ! 498: FMOVRLZ	dis not found

iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 10)
	.word 0xbda58920  ! 503: FMULs	fmuls	%f22, %f0, %f30
T1_asi_reg_wr_23:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 504: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbba00040  ! 506: FMOVd	fmovd	%f0, %f60
cpu_intr_1_44:
	setx	0x230317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_24:
	mov	0x1f, %r14
	.word 0xfef38400  ! 510: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_rd_29:
	mov	0xd, %r14
	.word 0xfcdb8e80  ! 512: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_45:
	setx	0x210313, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_25:
	mov	0xd, %r14
	.word 0xf0f38e40  ! 518: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbbab4820  ! 521: FMOVCC	fmovs	%fcc1, %f0, %f29
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_26:
	mov	0x3c7, %r14
	.word 0xfaf38e60  ! 523: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_46:
	setx	0x200236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c960  ! 527: FMULq	dis not found

	.word 0xb205e0bf  ! 528: ADD_I	add 	%r23, 0x00bf, %r25
	.word 0xbfa508e0  ! 534: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_27:
	mov	0x9, %r14
	.word 0xfcf38e40  ! 538: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9aa4820  ! 557: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a00040  ! 559: FMOVd	fmovd	%f0, %f26
T1_asi_reg_wr_28:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 565: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbab4820  ! 567: FMOVCC	fmovs	%fcc1, %f0, %f29
cpu_intr_1_47:
	setx	0x20021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0340000  ! 570: SUBC_R	orn 	%r16, %r0, %r24
cpu_intr_1_48:
	setx	0x200126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_49:
	setx	0x22000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0a52188  ! 574: SUBcc_I	subcc 	%r20, 0x0188, %r24
	.word 0xb7ab0820  ! 575: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbdaac820  ! 576: FMOVGE	fmovs	%fcc1, %f0, %f30
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_50:
	setx	0x210136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58860  ! 579: FADDq	dis not found

cpu_intr_1_51:
	setx	0x230036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c820  ! 584: FADDs	fadds	%f19, %f0, %f31
	.word 0xb7aac820  ! 586: FMOVGE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_52:
	setx	0x21010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_29:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 590: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7ab0820  ! 592: FMOVGU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_53:
	setx	0x220030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 28)
	.word 0xbdaa4820  ! 597: FMOVNE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_54:
	setx	0x23011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_55:
	setx	0x230201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda50920  ! 602: FMULs	fmuls	%f20, %f0, %f30
T1_asi_reg_wr_30:
	mov	0x3c4, %r14
	.word 0xf6f38e60  ! 603: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, d)
	.word 0xb5a00520  ! 606: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_56:
	setx	0x210336, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_31:
	mov	0x3c2, %r14
	.word 0xf0f384a0  ! 614: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_57:
	setx	0x210205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_32:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 619: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb7a88820  ! 620: FMOVLE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_58:
	setx	0x220128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_59:
	setx	0x230103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3dc000  ! 627: XNOR_R	xnor 	%r23, %r0, %r29
cpu_intr_1_60:
	setx	0x200005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_61:
	setx	0x23032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81c20  ! 632: FMOVRGEZ	dis not found

cpu_intr_1_62:
	setx	0x200117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_63:
	setx	0x230110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a90820  ! 641: FMOVLEU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_64:
	setx	0x220021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_65:
	setx	0x21032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_66:
	setx	0x210028, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 14)
	.word 0xbfa8c820  ! 657: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00520  ! 660: FSQRTs	fsqrt	
	.word 0xb7a9c820  ! 661: FMOVVS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_67:
	setx	0x200229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb095c000  ! 665: ORcc_R	orcc 	%r23, %r0, %r24
	.word 0xbdab4820  ! 666: FMOVCC	fmovs	%fcc1, %f0, %f30
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_68:
	setx	0x220031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2ca14d  ! 675: ANDN_I	andn 	%r18, 0x014d, %r31
	.word 0xb004a018  ! 676: ADD_I	add 	%r18, 0x0018, %r24
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_69:
	setx	0x23021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5abc820  ! 683: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbda509a0  ! 687: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xb9a40940  ! 689: FMULd	fmuld	%f16, %f0, %f28
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 21)
	.word 0xb3a00560  ! 691: FSQRTq	fsqrt	
T1_asi_reg_rd_30:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 696: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbda54820  ! 697: FADDs	fadds	%f21, %f0, %f30
	.word 0xbba4c9e0  ! 698: FDIVq	dis not found

iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 23)
	.word 0xb09d20c0  ! 702: XORcc_I	xorcc 	%r20, 0x00c0, %r24
	.word 0xb1a00520  ! 703: FSQRTs	fsqrt	
cpu_intr_1_70:
	setx	0x20000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_31:
	mov	0x25, %r14
	.word 0xf2db8e60  ! 705: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_rd_32:
	mov	0x3c8, %r14
	.word 0xf0db89e0  ! 709: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_rd_33:
	mov	0x3c2, %r14
	.word 0xfadb8400  ! 712: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_rd_34:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 713: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7a80820  ! 715: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb3a80820  ! 716: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb1a00520  ! 720: FSQRTs	fsqrt	
	.word 0xb4954000  ! 723: ORcc_R	orcc 	%r21, %r0, %r26
cpu_intr_1_71:
	setx	0x200319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9641800  ! 730: MOVcc_R	<illegal instruction>
cpu_intr_1_72:
	setx	0x22012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a508e0  ! 737: FSUBq	dis not found

	.word 0xbca48000  ! 738: SUBcc_R	subcc 	%r18, %r0, %r30
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_73:
	setx	0x200334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c860  ! 741: FADDq	dis not found

	.word 0xbda00560  ! 742: FSQRTq	fsqrt	
	.word 0xbba80820  ! 743: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 27)
	.word 0xbfa54920  ! 745: FMULs	fmuls	%f21, %f0, %f31
	.word 0xb1aa0820  ! 746: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbda40860  ! 748: FADDq	dis not found

T1_asi_reg_wr_33:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 749: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbc8c4000  ! 754: ANDcc_R	andcc 	%r17, %r0, %r30
	.word 0xb5a00560  ! 755: FSQRTq	fsqrt	
T1_asi_reg_rd_35:
	mov	0x15, %r14
	.word 0xfadb8400  ! 758: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_1_74:
	setx	0x210321, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_36:
	mov	0x3c6, %r14
	.word 0xfadb84a0  ! 761: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_rd_37:
	mov	0x2e, %r14
	.word 0xf0db8400  ! 763: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_34:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 765: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb1a54920  ! 766: FMULs	fmuls	%f21, %f0, %f24
	.word 0xb7a80820  ! 768: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb42460a7  ! 770: SUB_I	sub 	%r17, 0x00a7, %r26
	.word 0xb5a88820  ! 771: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb52df001  ! 773: SLLX_I	sllx	%r23, 0x0001, %r26
	.word 0xbba00020  ! 778: FMOVs	fmovs	%f0, %f29
	.word 0xb3355000  ! 779: SRLX_R	srlx	%r21, %r0, %r25
	.word 0xbda00540  ! 783: FSQRTd	fsqrt	
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 22)
	.word 0x8f902002  ! 785: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xb7a44960  ! 787: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_75:
	setx	0x21013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2c6001  ! 795: SLL_I	sll 	%r17, 0x0001, %r31
	.word 0xb7a00020  ! 798: FMOVs	fmovs	%f0, %f27
	.word 0xbd3d7001  ! 801: SRAX_I	srax	%r21, 0x0001, %r30
T1_asi_reg_rd_38:
	mov	0x34, %r14
	.word 0xf2db8e60  ! 802: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_wr_35:
	mov	0x3c2, %r14
	.word 0xfaf38400  ! 803: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbda5c8c0  ! 804: FSUBd	fsubd	%f54, %f0, %f30
	.word 0xb1a80420  ! 808: FMOVRZ	dis not found

T1_asi_reg_rd_39:
	mov	0x31, %r14
	.word 0xf6db89e0  ! 809: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb60c8000  ! 811: AND_R	and 	%r18, %r0, %r27
	.word 0xbf2dc000  ! 815: SLL_R	sll 	%r23, %r0, %r31
T1_asi_reg_wr_36:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 817: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb214613a  ! 818: OR_I	or 	%r17, 0x013a, %r25
	.word 0xb5a90820  ! 820: FMOVLEU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_37:
	mov	0x38, %r14
	.word 0xfef38e40  ! 821: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1ab4820  ! 823: FMOVCC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_38:
	mov	0x3c5, %r14
	.word 0xfcf38e60  ! 824: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_76:
	setx	0x22030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48940  ! 832: FMULd	fmuld	%f18, %f0, %f60
	.word 0xbb2cc000  ! 834: SLL_R	sll 	%r19, %r0, %r29
T1_asi_reg_wr_39:
	mov	0x3c5, %r14
	.word 0xf2f389e0  ! 835: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_rd_40:
	mov	0x1b, %r14
	.word 0xfadb89e0  ! 838: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb135d000  ! 840: SRLX_R	srlx	%r23, %r0, %r24
	.word 0xb9a84820  ! 844: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 13)
	.word 0xb7a449e0  ! 847: FDIVq	dis not found

T1_asi_reg_rd_41:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 848: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_77:
	setx	0x220322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 8)
	.word 0xb424c000  ! 851: SUB_R	sub 	%r19, %r0, %r26
	.word 0xb7a48840  ! 852: FADDd	faddd	%f18, %f0, %f58
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_78:
	setx	0x21022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_42:
	mov	0x7, %r14
	.word 0xf6db89e0  ! 861: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_rd_43:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 866: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb7a00560  ! 867: FSQRTq	fsqrt	
	.word 0xb1a5c9c0  ! 868: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xb9a00020  ! 869: FMOVs	fmovs	%f0, %f28
cpu_intr_1_79:
	setx	0x200019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a449a0  ! 872: FDIVs	fdivs	%f17, %f0, %f25
	.word 0xb5a50940  ! 876: FMULd	fmuld	%f20, %f0, %f26
T1_asi_reg_wr_40:
	mov	0x29, %r14
	.word 0xf2f38e40  ! 877: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_80:
	setx	0x230000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 879: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb73c8000  ! 880: SRA_R	sra 	%r18, %r0, %r27
cpu_intr_1_81:
	setx	0x200004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 885: FMOVL	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_44:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 886: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb7ab0820  ! 888: FMOVGU	fmovs	%fcc1, %f0, %f27
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_82:
	setx	0x26030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 895: FMOVCS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_45:
	mov	0x2d, %r14
	.word 0xf0db8e60  ! 897: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_83:
	setx	0x27023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81c20  ! 900: FMOVRGEZ	dis not found

cpu_intr_1_84:
	setx	0x240013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_85:
	setx	0x250036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c840  ! 909: FADDd	faddd	%f50, %f0, %f26
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_86:
	setx	0x25033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92d9000  ! 912: SLLX_R	sllx	%r22, %r0, %r28
cpu_intr_1_87:
	setx	0x250217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_88:
	setx	0x27033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_46:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 918: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_89:
	setx	0x24012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00520  ! 925: FSQRTs	fsqrt	
T1_asi_reg_wr_41:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 926: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb3aa0820  ! 929: FMOVA	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_47:
	mov	0x8, %r14
	.word 0xfedb89e0  ! 935: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb0844000  ! 938: ADDcc_R	addcc 	%r17, %r0, %r24
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_90:
	setx	0x270105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb894606b  ! 944: ORcc_I	orcc 	%r17, 0x006b, %r28
T1_asi_reg_wr_42:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 945: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbfa58940  ! 947: FMULd	fmuld	%f22, %f0, %f62
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb34a001  ! 951: SRL_I	srl 	%r18, 0x0001, %r29
	.word 0xbda4c9e0  ! 953: FDIVq	dis not found

	.word 0xbe9c60b1  ! 954: XORcc_I	xorcc 	%r17, 0x00b1, %r31
	.word 0xbe9d2192  ! 958: XORcc_I	xorcc 	%r20, 0x0192, %r31
	.word 0xbfa90820  ! 960: FMOVLEU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_43:
	mov	0x1c, %r14
	.word 0xf2f389e0  ! 964: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_wr_44:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 967: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb2ad2128  ! 968: ANDNcc_I	andncc 	%r20, 0x0128, %r25
	.word 0xbda80c20  ! 973: FMOVRLZ	dis not found

iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, e)
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb9a80420  ! 979: FMOVRZ	dis not found

	.word 0xb5a80c20  ! 980: FMOVRLZ	dis not found

	.word 0xbfa449c0  ! 981: FDIVd	fdivd	%f48, %f0, %f62
	.word 0xbfa98820  ! 983: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbcc4c000  ! 984: ADDCcc_R	addccc 	%r19, %r0, %r30
cpu_intr_1_91:
	setx	0x250339, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_45:
	mov	0x29, %r14
	.word 0xfef389e0  ! 993: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_wr_46:
	mov	0x3c8, %r14
	.word 0xf8f38e80  ! 996: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_1_92:
	setx	0x270017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 998: FMOVRZ	dis not found

	.word 0xb9aa4820  ! 1000: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a548e0  ! 1004: FSUBq	dis not found

	.word 0xbda548a0  ! 1005: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xbfa00520  ! 1006: FSQRTs	fsqrt	
T1_asi_reg_rd_48:
	mov	0x2e, %r14
	.word 0xfedb8e80  ! 1007: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb9a408c0  ! 1008: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xbfaa0820  ! 1009: FMOVA	fmovs	%fcc1, %f0, %f31
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_49:
	mov	0x2e, %r14
	.word 0xf8db8e60  ! 1015: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T1_asi_reg_rd_50:
	mov	0x20, %r14
	.word 0xfcdb89e0  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_93:
	setx	0x27020d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_94:
	setx	0x250017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a94820  ! 1019: FMOVCS	fmovs	%fcc1, %f0, %f26
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbfa00040  ! 1024: FMOVd	fmovd	%f0, %f62
	.word 0xbda4c940  ! 1025: FMULd	fmuld	%f50, %f0, %f30
	.word 0xb5a80820  ! 1027: FMOVN	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_51:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 1028: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_52:
	mov	0xf, %r14
	.word 0xfadb8400  ! 1031: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbfa508a0  ! 1032: FSUBs	fsubs	%f20, %f0, %f31
T1_asi_reg_rd_53:
	mov	0x1d, %r14
	.word 0xfcdb84a0  ! 1035: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 32)
	lda	[%r20 + %g0] 0xf0, %f2
cpu_intr_1_95:
	setx	0x260231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a488a0  ! 1040: FSUBs	fsubs	%f18, %f0, %f24
	.word 0xb7aa4820  ! 1041: FMOVNE	fmovs	%fcc1, %f0, %f27
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 27)
	.word 0xbda80820  ! 1046: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb5a40940  ! 1048: FMULd	fmuld	%f16, %f0, %f26
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb61c6049  ! 1052: XOR_I	xor 	%r17, 0x0049, %r27
	.word 0xb7ab4820  ! 1058: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbba508e0  ! 1059: FSUBq	dis not found

T1_asi_reg_wr_47:
	mov	0x29, %r14
	.word 0xfcf384a0  ! 1060: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbba9c820  ! 1063: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a90820  ! 1067: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb1ab0820  ! 1070: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb73db001  ! 1071: SRAX_I	srax	%r22, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_96:
	setx	0x240034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c860  ! 1074: FADDq	dis not found

T1_asi_reg_wr_48:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 1076: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbda84820  ! 1078: FMOVE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_97:
	setx	0x260017, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_54:
	mov	0x18, %r14
	.word 0xf4db8e80  ! 1082: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, f)
	.word 0xbda40860  ! 1087: FADDq	dis not found

T1_asi_reg_wr_49:
	mov	0x0, %r14
	.word 0xfef38400  ! 1089: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbba8c820  ! 1090: FMOVL	fmovs	%fcc1, %f0, %f29
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_98:
	setx	0x260323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a508a0  ! 1094: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xbeb4a1f9  ! 1095: SUBCcc_I	orncc 	%r18, 0x01f9, %r31
	.word 0xb5a589c0  ! 1096: FDIVd	fdivd	%f22, %f0, %f26
cpu_intr_1_99:
	setx	0x270137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_100:
	setx	0x240202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_101:
	setx	0x24022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 1104: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_50:
	mov	0x20, %r14
	.word 0xfef38e40  ! 1106: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_102:
	setx	0x27020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_103:
	setx	0x240235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda508e0  ! 1113: FSUBq	dis not found

T1_asi_reg_rd_55:
	mov	0x30, %r14
	.word 0xf6db8e40  ! 1114: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_104:
	setx	0x260104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 30)
	.word 0xb3a44840  ! 1122: FADDd	faddd	%f48, %f0, %f56
	.word 0xbba00540  ! 1127: FSQRTd	fsqrt	
	.word 0xb3504000  ! 1128: RDPR_TNPC	<illegal instruction>
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 31)
	.word 0xb3a81c20  ! 1131: FMOVRGEZ	dis not found

	.word 0xbda00520  ! 1132: FSQRTs	fsqrt	
	.word 0xb20d0000  ! 1133: AND_R	and 	%r20, %r0, %r25
	.word 0xb1a00560  ! 1134: FSQRTq	fsqrt	
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_105:
	setx	0x260028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_106:
	setx	0x250223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_107:
	setx	0x270137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_108:
	setx	0x250131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_109:
	setx	0x240227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 1148: FMOVRNZ	dis not found

	.word 0xb3a9c820  ! 1151: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a548a0  ! 1153: FSUBs	fsubs	%f21, %f0, %f27
	.word 0xbda00020  ! 1155: FMOVs	fmovs	%f0, %f30
T1_asi_reg_rd_56:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 1156: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb0c5e14e  ! 1158: ADDCcc_I	addccc 	%r23, 0x014e, %r24
cpu_intr_1_110:
	setx	0x250201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_111:
	setx	0x250318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 37)
	.word 0xbdaa8820  ! 1164: FMOVG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_51:
	mov	0x8, %r14
	.word 0xfcf389e0  ! 1165: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_rd_57:
	mov	0x2, %r14
	.word 0xf4db8e40  ! 1166: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_52:
	mov	0x3c5, %r14
	.word 0xf8f38e80  ! 1172: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbba81c20  ! 1174: FMOVRGEZ	dis not found

	.word 0xbdabc820  ! 1176: FMOVVC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_53:
	mov	0x3c0, %r14
	.word 0xf4f38e60  ! 1177: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 1)
	.word 0xb5a54960  ! 1179: FMULq	dis not found

iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb1a4c8e0  ! 1182: FSUBq	dis not found

	.word 0xb3a90820  ! 1188: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbda448e0  ! 1191: FSUBq	dis not found

cpu_intr_1_112:
	setx	0x250326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_113:
	setx	0x27030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_58:
	mov	0x37, %r14
	.word 0xfedb8e40  ! 1202: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9a90820  ! 1205: FMOVLEU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_54:
	mov	0x1b, %r14
	.word 0xf0f38e60  ! 1207: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_1_114:
	setx	0x27022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_115:
	setx	0x26023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_116:
	setx	0x260036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa489a0  ! 1228: FDIVs	fdivs	%f18, %f0, %f31
cpu_intr_1_117:
	setx	0x260116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 10)
	.word 0xb4a5e0dc  ! 1237: SUBcc_I	subcc 	%r23, 0x00dc, %r26
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_118:
	setx	0x250322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c9a0  ! 1243: FDIVs	fdivs	%f23, %f0, %f29
	.word 0xbfa58960  ! 1247: FMULq	dis not found

	.word 0xbc2d0000  ! 1250: ANDN_R	andn 	%r20, %r0, %r30
	.word 0xbda40920  ! 1253: FMULs	fmuls	%f16, %f0, %f30
T1_asi_reg_rd_59:
	mov	0x3c7, %r14
	.word 0xfadb8e60  ! 1254: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbbaa0820  ! 1257: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb335b001  ! 1265: SRLX_I	srlx	%r22, 0x0001, %r25
cpu_intr_1_119:
	setx	0x240339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 1271: FMOVG	fmovs	%fcc1, %f0, %f26
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_60:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 1278: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb9a5c940  ! 1279: FMULd	fmuld	%f54, %f0, %f28
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, e)
	.word 0xbba00540  ! 1284: FSQRTd	fsqrt	
	.word 0xbda50940  ! 1285: FMULd	fmuld	%f20, %f0, %f30
T1_asi_reg_rd_61:
	mov	0x10, %r14
	.word 0xf4db8e40  ! 1288: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_55:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 1292: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3a8c820  ! 1293: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_120:
	setx	0x270327, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xbb2c3001  ! 1297: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xb1a9c820  ! 1298: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb1a90820  ! 1300: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb7a44920  ! 1303: FMULs	fmuls	%f17, %f0, %f27
	.word 0xbc35c000  ! 1304: SUBC_R	orn 	%r23, %r0, %r30
T1_asi_reg_wr_56:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 1305: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_121:
	setx	0x24013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a588a0  ! 1308: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xbd643801  ! 1310: MOVcc_I	<illegal instruction>
	.word 0xb9a409c0  ! 1314: FDIVd	fdivd	%f16, %f0, %f28
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_wr_57:
	mov	0x2d, %r14
	.word 0xfcf38e60  ! 1318: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb1a4c9a0  ! 1320: FDIVs	fdivs	%f19, %f0, %f24
T1_asi_reg_wr_58:
	mov	0x31, %r14
	.word 0xfef38400  ! 1322: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_62:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 1324: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xbda00540  ! 1334: FSQRTd	fsqrt	
	.word 0xb3a80820  ! 1335: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb73de001  ! 1336: SRA_I	sra 	%r23, 0x0001, %r27
T1_asi_reg_wr_59:
	mov	0x9, %r14
	.word 0xf2f389e0  ! 1339: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_122:
	setx	0x24011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c960  ! 1341: FMULq	dis not found

iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 0)
	.word 0xbdab0820  ! 1347: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb4840000  ! 1348: ADDcc_R	addcc 	%r16, %r0, %r26
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_rd_63:
	mov	0x36, %r14
	.word 0xfedb89e0  ! 1350: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb9ab8820  ! 1351: FMOVPOS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_123:
	setx	0x270014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00040  ! 1358: FMOVd	fmovd	%f0, %f30
T1_asi_reg_rd_64:
	mov	0x1e, %r14
	.word 0xf2db8e60  ! 1359: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_124:
	setx	0x260100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_125:
	setx	0x25033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba548a0  ! 1366: FSUBs	fsubs	%f21, %f0, %f29
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_126:
	setx	0x240208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_127:
	setx	0x25020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c9a0  ! 1374: FDIVs	fdivs	%f23, %f0, %f29
cpu_intr_1_128:
	setx	0x240306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9c0000  ! 1378: XORcc_R	xorcc 	%r16, %r0, %r29
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 34)
	.word 0xb7a409c0  ! 1380: FDIVd	fdivd	%f16, %f0, %f58
	.word 0xb3abc820  ! 1383: FMOVVC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_60:
	mov	0x26, %r14
	.word 0xfcf38e40  ! 1385: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbba81420  ! 1388: FMOVRNZ	dis not found

	.word 0xb7abc820  ! 1389: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb3a90820  ! 1391: FMOVLEU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_61:
	mov	0x2e, %r14
	.word 0xf0f38e60  ! 1392: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_1_129:
	setx	0x29021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_130:
	setx	0x2b001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_131:
	setx	0x2a0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda508c0  ! 1396: FSUBd	fsubd	%f20, %f0, %f30
	.word 0xbda90820  ! 1400: FMOVLEU	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_62:
	mov	0x3c3, %r14
	.word 0xf0f38e60  ! 1401: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 39)
	.word 0xbda98820  ! 1404: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb5a80820  ! 1408: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_63:
	mov	0xb, %r14
	.word 0xfaf38e40  ! 1410: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5ab0820  ! 1413: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb3a81820  ! 1424: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb1ab4820  ! 1426: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb2054000  ! 1427: ADD_R	add 	%r21, %r0, %r25
T1_asi_reg_wr_64:
	mov	0x2a, %r14
	.word 0xfaf38e60  ! 1430: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_wr_65:
	mov	0x31, %r14
	.word 0xfcf38e80  ! 1433: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb1a81c20  ! 1437: FMOVRGEZ	dis not found

	.word 0xb1a448e0  ! 1441: FSUBq	dis not found

cpu_intr_1_132:
	setx	0x290227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a548a0  ! 1444: FSUBs	fsubs	%f21, %f0, %f25
T1_asi_reg_wr_66:
	mov	0x19, %r14
	.word 0xfef38e40  ! 1447: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 35)
	.word 0xb5a00520  ! 1451: FSQRTs	fsqrt	
	.word 0xb1a00520  ! 1452: FSQRTs	fsqrt	
cpu_intr_1_133:
	setx	0x280011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a409a0  ! 1455: FDIVs	fdivs	%f16, %f0, %f28
T1_asi_reg_wr_67:
	mov	0x3c7, %r14
	.word 0xf2f38e80  ! 1456: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 22)
	.word 0xbba98820  ! 1459: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb5a9c820  ! 1460: FMOVVS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_65:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 1464: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb5ab4820  ! 1465: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb6bd2166  ! 1472: XNORcc_I	xnorcc 	%r20, 0x0166, %r27
	.word 0xb7ab8820  ! 1473: FMOVPOS	fmovs	%fcc1, %f0, %f27
	lda	[%r20 + %g0] 0xf0, %f2
cpu_intr_1_134:
	setx	0x2a001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 1479: FMOVNEG	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_135:
	setx	0x2b010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81c20  ! 1486: FMOVRGEZ	dis not found

	.word 0xb7a81820  ! 1487: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbba98820  ! 1488: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb9a50920  ! 1496: FMULs	fmuls	%f20, %f0, %f28
T1_asi_reg_wr_68:
	mov	0x17, %r14
	.word 0xfcf38e40  ! 1501: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7a81820  ! 1503: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb3a54840  ! 1506: FADDd	faddd	%f52, %f0, %f56
T1_asi_reg_wr_69:
	mov	0x38, %r14
	.word 0xf6f389e0  ! 1507: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, a)
	.word 0xb350c000  ! 1520: RDPR_TT	<illegal instruction>
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_66:
	mov	0x6, %r14
	.word 0xf6db8e40  ! 1523: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbba489e0  ! 1524: FDIVq	dis not found

	.word 0xbba449e0  ! 1525: FDIVq	dis not found

	.word 0xbb357001  ! 1526: SRLX_I	srlx	%r21, 0x0001, %r29
T1_asi_reg_wr_70:
	mov	0x2f, %r14
	.word 0xfcf38400  ! 1529: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_rd_67:
	mov	0x2a, %r14
	.word 0xfcdb8e40  ! 1530: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_71:
	mov	0x28, %r14
	.word 0xf6f384a0  ! 1534: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_rd_68:
	mov	0x23, %r14
	.word 0xfadb89e0  ! 1538: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb3a84820  ! 1539: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_69:
	mov	0x2e, %r14
	.word 0xfadb8400  ! 1540: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbfa88820  ! 1541: FMOVLE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_72:
	mov	0xb, %r14
	.word 0xf8f38e40  ! 1542: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9a80420  ! 1551: FMOVRZ	dis not found

iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 33)
	.word 0xbec4a0f5  ! 1555: ADDCcc_I	addccc 	%r18, 0x00f5, %r31
	.word 0xbba8c820  ! 1556: FMOVL	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_70:
	mov	0x1a, %r14
	.word 0xf4db8e80  ! 1558: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb1a90820  ! 1559: FMOVLEU	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_136:
	setx	0x29013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 1562: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb1a589a0  ! 1565: FDIVs	fdivs	%f22, %f0, %f24
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_wr_73:
	mov	0x20, %r14
	.word 0xf0f38e40  ! 1567: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_137:
	setx	0x2b0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8354000  ! 1570: SUBC_R	orn 	%r21, %r0, %r28
	.word 0xb415e00c  ! 1571: OR_I	or 	%r23, 0x000c, %r26
	.word 0xba14e1ca  ! 1576: OR_I	or 	%r19, 0x01ca, %r29
	.word 0xbc9520ab  ! 1577: ORcc_I	orcc 	%r20, 0x00ab, %r30
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_138:
	setx	0x2b0110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_139:
	setx	0x2a0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80c20  ! 1586: FMOVRLZ	dis not found

	.word 0xb3a81c20  ! 1589: FMOVRGEZ	dis not found

T1_asi_reg_wr_74:
	mov	0x28, %r14
	.word 0xf4f384a0  ! 1591: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb5a4c840  ! 1592: FADDd	faddd	%f50, %f0, %f26
	.word 0xbba8c820  ! 1599: FMOVL	fmovs	%fcc1, %f0, %f29
cpu_intr_1_140:
	setx	0x2a0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_141:
	setx	0x29011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_142:
	setx	0x2b010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41dc000  ! 1605: XOR_R	xor 	%r23, %r0, %r26
	.word 0xb7a4c9e0  ! 1608: FDIVq	dis not found

	.word 0xb9a40860  ! 1609: FADDq	dis not found

T1_asi_reg_wr_75:
	mov	0x17, %r14
	.word 0xf4f38e40  ! 1611: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_rd_71:
	mov	0x2f, %r14
	.word 0xfcdb84a0  ! 1617: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 37)
	.word 0xbda40820  ! 1621: FADDs	fadds	%f16, %f0, %f30
	.word 0xb52c8000  ! 1625: SLL_R	sll 	%r18, %r0, %r26
	.word 0xb3a48820  ! 1626: FADDs	fadds	%f18, %f0, %f25
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, e)
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 36)
	.word 0xb3ab8820  ! 1639: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbba94820  ! 1642: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb80de1ac  ! 1644: AND_I	and 	%r23, 0x01ac, %r28
cpu_intr_1_143:
	setx	0x2b012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_72:
	mov	0x10, %r14
	.word 0xf6db84a0  ! 1648: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbda90820  ! 1651: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xba3ca1d4  ! 1653: XNOR_I	xnor 	%r18, 0x01d4, %r29
	.word 0xb7a81c20  ! 1654: FMOVRGEZ	dis not found

	.word 0xb7a48960  ! 1658: FMULq	dis not found

iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_wr_76:
	mov	0x1a, %r14
	.word 0xf2f38e40  ! 1662: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_144:
	setx	0x290125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_rd_73:
	mov	0x25, %r14
	.word 0xf8db8e40  ! 1665: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_74:
	mov	0xb, %r14
	.word 0xfedb89e0  ! 1667: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbd2d8000  ! 1668: SLL_R	sll 	%r22, %r0, %r30
	lda	[%r23 + %g0] 0xf0, %f2
cpu_intr_1_145:
	setx	0x2a0319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb9a408e0  ! 1674: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 6)
	.word 0xbcb40000  ! 1683: ORNcc_R	orncc 	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_77:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 1685: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_wr_78:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 1690: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb5a80820  ! 1695: FMOVN	fmovs	%fcc1, %f0, %f26
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 6)
	.word 0xbe9c2136  ! 1697: XORcc_I	xorcc 	%r16, 0x0136, %r31
	.word 0xbd3cb001  ! 1698: SRAX_I	srax	%r18, 0x0001, %r30
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_rd_75:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 1704: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5a81420  ! 1705: FMOVRNZ	dis not found

T1_asi_reg_wr_79:
	mov	0x15, %r14
	.word 0xf0f389e0  ! 1710: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb9a58820  ! 1711: FADDs	fadds	%f22, %f0, %f28
cpu_intr_1_146:
	setx	0x2a030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_147:
	setx	0x28002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_76:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 1718: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb97c8400  ! 1720: MOVR_R	movre	%r18, %r0, %r28
	.word 0xb7a00020  ! 1722: FMOVs	fmovs	%f0, %f27
T1_asi_reg_wr_80:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 1723: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbda00560  ! 1725: FSQRTq	fsqrt	
	.word 0xbda408a0  ! 1727: FSUBs	fsubs	%f16, %f0, %f30
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_148:
	setx	0x2a0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3abc820  ! 1732: FMOVVC	fmovs	%fcc1, %f0, %f25
cpu_intr_1_149:
	setx	0x290235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa48920  ! 1738: FMULs	fmuls	%f18, %f0, %f31
cpu_intr_1_150:
	setx	0x28000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a449e0  ! 1740: FDIVq	dis not found

T1_asi_reg_rd_77:
	mov	0x6, %r14
	.word 0xf4db89e0  ! 1741: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_1_151:
	setx	0x280031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 32)
	.word 0xbba408e0  ! 1745: FSUBq	dis not found

cpu_intr_1_152:
	setx	0x2b0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab4820  ! 1749: FMOVCC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_81:
	mov	0xe, %r14
	.word 0xfef384a0  ! 1750: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_rd_78:
	mov	0x10, %r14
	.word 0xfadb8e60  ! 1754: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_153:
	setx	0x2b021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 1757: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb1a44820  ! 1758: FADDs	fadds	%f17, %f0, %f24
cpu_intr_1_154:
	setx	0x290304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, f)
	.word 0xbba9c820  ! 1761: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a80420  ! 1762: FMOVRZ	dis not found

iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_79:
	mov	0x37, %r14
	.word 0xfadb8e40  ! 1765: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_80:
	mov	0x23, %r14
	.word 0xfcdb8400  ! 1769: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_82:
	mov	0x19, %r14
	.word 0xf0f38400  ! 1771: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_rd_81:
	mov	0x3c0, %r14
	.word 0xf4db8e60  ! 1772: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb1a00540  ! 1773: FSQRTd	fsqrt	
	.word 0xbba84820  ! 1777: FMOVE	fmovs	%fcc1, %f0, %f29
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_wr_83:
	mov	0xa, %r14
	.word 0xf8f38400  ! 1780: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb5a58820  ! 1782: FADDs	fadds	%f22, %f0, %f26
	.word 0xb7a40860  ! 1784: FADDq	dis not found

iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 19)
	.word 0xbda00560  ! 1789: FSQRTq	fsqrt	
	.word 0xb5a8c820  ! 1790: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb3a84820  ! 1792: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb3a8c820  ! 1793: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbba88820  ! 1794: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbbaa8820  ! 1795: FMOVG	fmovs	%fcc1, %f0, %f29
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 5)
	.word 0xb9a90820  ! 1804: FMOVLEU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_84:
	mov	0x20, %r14
	.word 0xf6f38e40  ! 1806: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_155:
	setx	0x2b0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08c0000  ! 1811: ANDcc_R	andcc 	%r16, %r0, %r24
T1_asi_reg_wr_85:
	mov	0x22, %r14
	.word 0xf4f38e40  ! 1812: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_156:
	setx	0x2a0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_86:
	mov	0x2c, %r14
	.word 0xf4f38e60  ! 1814: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb234e096  ! 1816: ORN_I	orn 	%r19, 0x0096, %r25
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_157:
	setx	0x2c0214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 33)
	.word 0xb7a00540  ! 1822: FSQRTd	fsqrt	
	.word 0xb3aac820  ! 1824: FMOVGE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_158:
	setx	0x2e021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 1828: FSQRTd	fsqrt	
T1_asi_reg_rd_82:
	mov	0x14, %r14
	.word 0xf6db8e40  ! 1829: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7354000  ! 1831: SRL_R	srl 	%r21, %r0, %r27
	.word 0xb1a48920  ! 1836: FMULs	fmuls	%f18, %f0, %f24
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_83:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 1839: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 14)
	.word 0xb9a00540  ! 1845: FSQRTd	fsqrt	
cpu_intr_1_159:
	setx	0x2e020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 1850: FSQRTs	fsqrt	
T1_asi_reg_wr_87:
	mov	0x33, %r14
	.word 0xf4f38400  ! 1852: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_1_160:
	setx	0x2e002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 1857: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb3a588e0  ! 1858: FSUBq	dis not found

T1_asi_reg_rd_84:
	mov	0x1d, %r14
	.word 0xf8db8e40  ! 1859: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbba00520  ! 1862: FSQRTs	fsqrt	
	.word 0xb1a81420  ! 1863: FMOVRNZ	dis not found

	.word 0xb3a00540  ! 1864: FSQRTd	fsqrt	
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_85:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 1867: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_wr_88:
	mov	0x3c1, %r14
	.word 0xfcf38e80  ! 1872: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb3a588c0  ! 1873: FSUBd	fsubd	%f22, %f0, %f56
T1_asi_reg_wr_89:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 1874: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3a81820  ! 1876: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb245604d  ! 1877: ADDC_I	addc 	%r21, 0x004d, %r25
	.word 0xbb2d9000  ! 1878: SLLX_R	sllx	%r22, %r0, %r29
	.word 0xbfaa4820  ! 1879: FMOVNE	fmovs	%fcc1, %f0, %f31
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 20)
	lda	[%r23 + %g0] 0xf0, %f2
cpu_intr_1_161:
	setx	0x2f0117, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_86:
	mov	0x16, %r14
	.word 0xfedb8e60  ! 1887: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_1_162:
	setx	0x2c0330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_87:
	mov	0x1d, %r14
	.word 0xfadb8e80  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb52d4000  ! 1892: SLL_R	sll 	%r21, %r0, %r26
	.word 0xb5a9c820  ! 1894: FMOVVS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_163:
	setx	0x2e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a98820  ! 1898: FMOVNEG	fmovs	%fcc1, %f0, %f27
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_164:
	setx	0x2e0027, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_88:
	mov	0x1f, %r14
	.word 0xf8db84a0  ! 1904: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_rd_89:
	mov	0x29, %r14
	.word 0xf8db8e40  ! 1907: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 18)
	.word 0xbba9c820  ! 1909: FMOVVS	fmovs	%fcc1, %f0, %f29
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 0)
	.word 0xb7a58860  ! 1911: FADDq	dis not found

cpu_intr_1_165:
	setx	0x2d020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 9)
	.word 0xbfa98820  ! 1917: FMOVNEG	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_166:
	setx	0x2f0211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_167:
	setx	0x2c0225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_168:
	setx	0x2d000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa4820  ! 1927: FMOVNE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_90:
	mov	0x3c3, %r14
	.word 0xfedb84a0  ! 1928: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	lda	[%r23 + %g0] 0xf0, %f2
cpu_intr_1_169:
	setx	0x2c0213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_170:
	setx	0x2c0027, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_90:
	mov	0x23, %r14
	.word 0xf4f389e0  ! 1941: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_171:
	setx	0x2d0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba34e16d  ! 1946: SUBC_I	orn 	%r19, 0x016d, %r29
cpu_intr_1_172:
	setx	0x2e0021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, e)
	.word 0xb9a00540  ! 1955: FSQRTd	fsqrt	
T1_asi_reg_wr_91:
	mov	0x12, %r14
	.word 0xf6f38e60  ! 1958: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 29)
	.word 0xb3a00040  ! 1964: FMOVd	fmovd	%f0, %f56
cpu_intr_1_173:
	setx	0x2d030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_174:
	setx	0x2f0300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_175:
	setx	0x2c0202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 24)
	.word 0xb1a44840  ! 1971: FADDd	faddd	%f48, %f0, %f24
	.word 0xb1a80820  ! 1973: FMOVN	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_92:
	mov	0x1d, %r14
	.word 0xfef384a0  ! 1974: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_176:
	setx	0x2f010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_177:
	setx	0x2c0129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 9)
	.word 0xbfa9c820  ! 1985: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb5a80420  ! 1988: FMOVRZ	dis not found

cpu_intr_1_178:
	setx	0x2e0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc56078  ! 1993: ADDCcc_I	addccc 	%r21, 0x0078, %r30
cpu_intr_1_179:
	setx	0x2d011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c8e0  ! 1995: FSUBq	dis not found

cpu_intr_1_180:
	setx	0x2d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a98820  ! 1998: FMOVNEG	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a549c0  ! 2000: FDIVd	fdivd	%f52, %f0, %f26
	.word 0xbda44920  ! 2001: FMULs	fmuls	%f17, %f0, %f30
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 21)
	.word 0xb3aac820  ! 2006: FMOVGE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_181:
	setx	0x2f0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c860  ! 2008: FADDq	dis not found

	.word 0xb7a4c960  ! 2012: FMULq	dis not found

	.word 0xb034e038  ! 2014: ORN_I	orn 	%r19, 0x0038, %r24
	.word 0xb9aa0820  ! 2015: FMOVA	fmovs	%fcc1, %f0, %f28
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_wr_93:
	mov	0x35, %r14
	.word 0xf8f384a0  ! 2021: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbfa00540  ! 2022: FSQRTd	fsqrt	
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 10)
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xb2ac4000  ! 2029: ANDNcc_R	andncc 	%r17, %r0, %r25
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb5a00540  ! 2031: FSQRTd	fsqrt	
	.word 0xb7a81420  ! 2034: FMOVRNZ	dis not found

iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_91:
	mov	0xa, %r14
	.word 0xfadb89e0  ! 2040: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb1a81820  ! 2042: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb3a409c0  ! 2044: FDIVd	fdivd	%f16, %f0, %f56
	.word 0xbda00520  ! 2046: FSQRTs	fsqrt	
T1_asi_reg_wr_94:
	mov	0xb, %r14
	.word 0xfaf38400  ! 2047: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbda54940  ! 2055: FMULd	fmuld	%f52, %f0, %f30
	.word 0xbfa589e0  ! 2057: FDIVq	dis not found

	.word 0xb6248000  ! 2059: SUB_R	sub 	%r18, %r0, %r27
	.word 0xbba4c940  ! 2061: FMULd	fmuld	%f50, %f0, %f60
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, e)
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 24)
	.word 0xbc3c61fa  ! 2073: XNOR_I	xnor 	%r17, 0x01fa, %r30
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 16)
	.word 0xb9a9c820  ! 2080: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb4c48000  ! 2082: ADDCcc_R	addccc 	%r18, %r0, %r26
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_wr_95:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 2084: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb1a84820  ! 2086: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a549c0  ! 2087: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xb13d0000  ! 2089: SRA_R	sra 	%r20, %r0, %r24
T1_asi_reg_rd_92:
	mov	0x1, %r14
	.word 0xfadb84a0  ! 2092: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_182:
	setx	0x2d0134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_183:
	setx	0x2c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_93:
	mov	0x13, %r14
	.word 0xf8db8e80  ! 2100: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_rd_94:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 2101: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_rd_95:
	mov	0x3c2, %r14
	.word 0xf0db8400  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_96:
	mov	0x14, %r14
	.word 0xf2f384a0  ! 2106: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb03461e5  ! 2107: SUBC_I	orn 	%r17, 0x01e5, %r24
T1_asi_reg_wr_97:
	mov	0x22, %r14
	.word 0xf2f38400  ! 2108: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_184:
	setx	0x2c003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb5a88820  ! 2112: FMOVLE	fmovs	%fcc1, %f0, %f26
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_185:
	setx	0x2f0103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_186:
	setx	0x2c033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_96:
	mov	0x0, %r14
	.word 0xf0db89e0  ! 2120: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_wr_98:
	mov	0x3, %r14
	.word 0xfcf38e40  ! 2122: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb0c4c000  ! 2123: ADDCcc_R	addccc 	%r19, %r0, %r24
	.word 0xb3abc820  ! 2128: FMOVVC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_99:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 2134: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbda00020  ! 2135: FMOVs	fmovs	%f0, %f30
cpu_intr_1_187:
	setx	0x2d0201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_188:
	setx	0x2c033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 2139: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbda81820  ! 2140: FMOVRGZ	fmovs	%fcc3, %f0, %f30
T1_asi_reg_wr_100:
	mov	0x27, %r14
	.word 0xf2f38400  ! 2141: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T1_asi_reg_rd_97:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 2149: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_98:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_1_189:
	setx	0x2f0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6146178  ! 2164: OR_I	or 	%r17, 0x0178, %r27
cpu_intr_1_190:
	setx	0x2e0202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_191:
	setx	0x2e011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab4820  ! 2173: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb8b40000  ! 2175: ORNcc_R	orncc 	%r16, %r0, %r28
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb9ab4820  ! 2180: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb9a80c20  ! 2185: FMOVRLZ	dis not found

cpu_intr_1_192:
	setx	0x2e0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 2187: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a98820  ! 2191: FMOVNEG	fmovs	%fcc1, %f0, %f27
cpu_intr_1_193:
	setx	0x2e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 2197: FMOVRZ	dis not found

iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_194:
	setx	0x2e0108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_195:
	setx	0x2e0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_196:
	setx	0x2f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb694a069  ! 2213: ORcc_I	orcc 	%r18, 0x0069, %r27
	.word 0xb7ab8820  ! 2219: FMOVPOS	fmovs	%fcc1, %f0, %f27
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 34)
	.word 0xb1a80820  ! 2234: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_197:
	setx	0x2f0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 2238: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb5a80820  ! 2241: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb5a00020  ! 2242: FMOVs	fmovs	%f0, %f26
cpu_intr_1_198:
	setx	0x2f000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_101:
	mov	0x19, %r14
	.word 0xf0f389e0  ! 2247: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_wr_102:
	mov	0x9, %r14
	.word 0xf0f38e40  ! 2253: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_103:
	mov	0x7, %r14
	.word 0xf4f38e40  ! 2254: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_99:
	mov	0x3c3, %r14
	.word 0xf4db84a0  ! 2255: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 29)
	.word 0xb9a80820  ! 2258: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
cpu_intr_1_199:
	setx	0x2c0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 2262: FMOVG	fmovs	%fcc1, %f0, %f29
cpu_intr_1_200:
	setx	0x2f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd7c8400  ! 2265: MOVR_R	movre	%r18, %r0, %r30
T1_asi_reg_wr_104:
	mov	0x28, %r14
	.word 0xf0f384a0  ! 2269: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb81d2076  ! 2271: XOR_I	xor 	%r20, 0x0076, %r28
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 3)
	.word 0xbe154000  ! 2278: OR_R	or 	%r21, %r0, %r31
	.word 0xb5a48960  ! 2279: FMULq	dis not found

	.word 0xb5ab8820  ! 2282: FMOVPOS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_100:
	mov	0x27, %r14
	.word 0xf6db8400  ! 2283: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_rd_101:
	mov	0x38, %r14
	.word 0xf4db8e40  ! 2292: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_201:
	setx	0x2f000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00040  ! 2296: FMOVd	fmovd	%f0, %f62
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 32)
	.word 0xbba4c8c0  ! 2299: FSUBd	fsubd	%f50, %f0, %f60
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb9a80820  ! 2303: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb3a00040  ! 2308: FMOVd	fmovd	%f0, %f56
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1a50820  ! 2313: FADDs	fadds	%f20, %f0, %f24
	.word 0xb5a40960  ! 2314: FMULq	dis not found

iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_105:
	mov	0x37, %r14
	.word 0xf8f389e0  ! 2316: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb7a00520  ! 2318: FSQRTs	fsqrt	
T1_asi_reg_rd_102:
	mov	0xc, %r14
	.word 0xfedb89e0  ! 2319: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb9a94820  ! 2321: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb1a80c20  ! 2322: FMOVRLZ	dis not found

iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_202:
	setx	0x320239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, c)
	.word 0xb7a00020  ! 2328: FMOVs	fmovs	%f0, %f27
	.word 0xbfab0820  ! 2329: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb82de030  ! 2331: ANDN_I	andn 	%r23, 0x0030, %r28
	.word 0xb5a589e0  ! 2332: FDIVq	dis not found

	.word 0xb094c000  ! 2335: ORcc_R	orcc 	%r19, %r0, %r24
T1_asi_reg_wr_106:
	mov	0x1a, %r14
	.word 0xf4f38e60  ! 2336: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_1_203:
	setx	0x320130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c8c0  ! 2339: FSUBd	fsubd	%f54, %f0, %f58
	.word 0xb5a98820  ! 2340: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbc34e0ce  ! 2342: SUBC_I	orn 	%r19, 0x00ce, %r30
cpu_intr_1_204:
	setx	0x330126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa488a0  ! 2351: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xb3a94820  ! 2356: FMOVCS	fmovs	%fcc1, %f0, %f25
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, b)
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 2e)
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbfa408c0  ! 2362: FSUBd	fsubd	%f16, %f0, %f62
	.word 0xb7a589a0  ! 2364: FDIVs	fdivs	%f22, %f0, %f27
	.word 0xb9ab4820  ! 2368: FMOVCC	fmovs	%fcc1, %f0, %f28
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_103:
	mov	0x22, %r14
	.word 0xf4db84a0  ! 2376: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T1_asi_reg_wr_107:
	mov	0x10, %r14
	.word 0xf6f38400  ! 2380: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T1_asi_reg_rd_104:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 2381: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbfa80420  ! 2384: FMOVRZ	dis not found

T1_asi_reg_rd_105:
	mov	0xb, %r14
	.word 0xf4db84a0  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbda54960  ! 2386: FMULq	dis not found

T1_asi_reg_rd_106:
	mov	0x3c0, %r14
	.word 0xfcdb89e0  ! 2388: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 15)
	.word 0xb5a81420  ! 2402: FMOVRNZ	dis not found

	.word 0xb7a00520  ! 2404: FSQRTs	fsqrt	
T1_asi_reg_rd_107:
	mov	0x1, %r14
	.word 0xfcdb89e0  ! 2406: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_205:
	setx	0x300006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 2410: FSQRTq	fsqrt	
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_rd_108:
	mov	0x12, %r14
	.word 0xf0db8e80  ! 2417: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_206:
	setx	0x330013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 2423: FSQRTd	fsqrt	
T1_asi_reg_rd_109:
	mov	0x14, %r14
	.word 0xf4db8e60  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb7a58840  ! 2430: FADDd	faddd	%f22, %f0, %f58
T1_asi_reg_rd_110:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 2433: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9a84820  ! 2434: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_rd_111:
	mov	0x3c2, %r14
	.word 0xfedb89e0  ! 2442: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb5a4c9e0  ! 2443: FDIVq	dis not found

T1_asi_reg_wr_108:
	mov	0x28, %r14
	.word 0xf6f38e60  ! 2444: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 16)
	.word 0xb3a4c840  ! 2446: FADDd	faddd	%f50, %f0, %f56
	.word 0xbda5c8e0  ! 2448: FSUBq	dis not found

iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb1a58820  ! 2451: FADDs	fadds	%f22, %f0, %f24
T1_asi_reg_wr_109:
	mov	0x1, %r14
	.word 0xf4f38e80  ! 2452: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbba44840  ! 2453: FADDd	faddd	%f48, %f0, %f60
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 2)
	.word 0xb3a588e0  ! 2456: FSUBq	dis not found

	.word 0xb5a81c20  ! 2458: FMOVRGEZ	dis not found

	.word 0xb7a44940  ! 2459: FMULd	fmuld	%f48, %f0, %f58
	.word 0xbda508e0  ! 2463: FSUBq	dis not found

	.word 0xb5ab0820  ! 2467: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb3a50840  ! 2470: FADDd	faddd	%f20, %f0, %f56
T1_asi_reg_rd_112:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 2471: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, f)
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 30)
	.word 0xb3aac820  ! 2480: FMOVGE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_110:
	mov	0x34, %r14
	.word 0xfaf38e60  ! 2481: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb9a488c0  ! 2482: FSUBd	fsubd	%f18, %f0, %f28
	.word 0xbbabc820  ! 2484: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbec56114  ! 2485: ADDCcc_I	addccc 	%r21, 0x0114, %r31
	.word 0xb3a00560  ! 2486: FSQRTq	fsqrt	
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbfa00020  ! 2489: FMOVs	fmovs	%f0, %f31
	.word 0xbda9c820  ! 2491: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb3a00040  ! 2493: FMOVd	fmovd	%f0, %f56
cpu_intr_1_207:
	setx	0x320131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 26)
	.word 0xbba549a0  ! 2496: FDIVs	fdivs	%f21, %f0, %f29
T1_asi_reg_rd_113:
	mov	0x35, %r14
	.word 0xf8db8e40  ! 2497: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5a48820  ! 2503: FADDs	fadds	%f18, %f0, %f26
cpu_intr_1_208:
	setx	0x310329, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_209:
	setx	0x330318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_210:
	setx	0x320339, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_111:
	mov	0x17, %r14
	.word 0xfef38400  ! 2518: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_211:
	setx	0x330205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a54840  ! 2522: FADDd	faddd	%f52, %f0, %f26
	.word 0xb3aa8820  ! 2523: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb9a00540  ! 2526: FSQRTd	fsqrt	
T1_asi_reg_wr_112:
	mov	0x3, %r14
	.word 0xf8f38e60  ! 2527: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_1_212:
	setx	0x32000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab8820  ! 2532: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb1ab8820  ! 2535: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_114:
	mov	0x1a, %r14
	.word 0xf4db84a0  ! 2537: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbba81420  ! 2539: FMOVRNZ	dis not found

iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_wr_113:
	mov	0xa, %r14
	.word 0xfaf38e40  ! 2543: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbba5c8a0  ! 2544: FSUBs	fsubs	%f23, %f0, %f29
	.word 0x8d9421f6  ! 2547: WRPR_PSTATE_I	wrpr	%r16, 0x01f6, %pstate
cpu_intr_1_213:
	setx	0x320318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_214:
	setx	0x330221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_215:
	setx	0x300104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c820  ! 2552: FADDs	fadds	%f19, %f0, %f30
cpu_intr_1_216:
	setx	0x31032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 2558: FMOVN	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_115:
	mov	0x3c6, %r14
	.word 0xf4db8e80  ! 2560: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb5a81420  ! 2561: FMOVRNZ	dis not found

cpu_intr_1_217:
	setx	0x32031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81420  ! 2566: FMOVRNZ	dis not found

	.word 0xb5a80c20  ! 2568: FMOVRLZ	dis not found

T1_asi_reg_rd_116:
	mov	0x8, %r14
	.word 0xf2db8e40  ! 2570: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 11)
	.word 0xb7a508e0  ! 2573: FSUBq	dis not found

cpu_intr_1_218:
	setx	0x31002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_117:
	mov	0x38, %r14
	.word 0xfadb8e80  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbfa81c20  ! 2584: FMOVRGEZ	dis not found

T1_asi_reg_wr_114:
	mov	0x5, %r14
	.word 0xfaf38e40  ! 2585: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_219:
	setx	0x300122, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_115:
	mov	0x23, %r14
	.word 0xf6f38e60  ! 2589: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb1a80820  ! 2590: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb22d20c8  ! 2591: ANDN_I	andn 	%r20, 0x00c8, %r25
	.word 0xbda40860  ! 2592: FADDq	dis not found

	.word 0xb5a00040  ! 2598: FMOVd	fmovd	%f0, %f26
T1_asi_reg_rd_118:
	mov	0x11, %r14
	.word 0xf8db8e60  ! 2599: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_1_220:
	setx	0x33030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_119:
	mov	0x22, %r14
	.word 0xfcdb8e60  ! 2602: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_221:
	setx	0x330228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 17)
	.word 0xbba80820  ! 2606: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb22d4000  ! 2609: ANDN_R	andn 	%r21, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_120:
	mov	0x11, %r14
	.word 0xf2db8400  ! 2611: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb6440000  ! 2613: ADDC_R	addc 	%r16, %r0, %r27
	.word 0xbfa549c0  ! 2614: FDIVd	fdivd	%f52, %f0, %f62
cpu_intr_1_222:
	setx	0x320005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b50000  ! 2623: SUBCcc_R	orncc 	%r20, %r0, %r26
cpu_intr_1_223:
	setx	0x330304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa488c0  ! 2626: FSUBd	fsubd	%f18, %f0, %f62
	.word 0xbfa588a0  ! 2627: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xbba80c20  ! 2628: FMOVRLZ	dis not found

	.word 0xb1a549c0  ! 2639: FDIVd	fdivd	%f52, %f0, %f24
T1_asi_reg_rd_121:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 2641: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_rd_122:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 2642: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 4)
	.word 0xba056135  ! 2644: ADD_I	add 	%r21, 0x0135, %r29
	.word 0xb9a58920  ! 2645: FMULs	fmuls	%f22, %f0, %f28
	.word 0xb1a94820  ! 2647: FMOVCS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_224:
	setx	0x300314, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_123:
	mov	0x16, %r14
	.word 0xf8db8400  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, e)
	.word 0xb3a9c820  ! 2653: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb3a00560  ! 2655: FSQRTq	fsqrt	
T1_asi_reg_rd_124:
	mov	0x3c0, %r14
	.word 0xf4db8400  ! 2657: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_rd_125:
	mov	0x2b, %r14
	.word 0xfcdb8e80  ! 2665: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 1)
	.word 0xb57d8400  ! 2671: MOVR_R	movre	%r22, %r0, %r26
	.word 0xb1a90820  ! 2672: FMOVLEU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_126:
	mov	0x1f, %r14
	.word 0xf4db8e60  ! 2673: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbda80420  ! 2678: FMOVRZ	dis not found

T1_asi_reg_wr_116:
	mov	0xd, %r14
	.word 0xf0f38400  ! 2679: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb3a00540  ! 2680: FSQRTd	fsqrt	
	.word 0xbfab4820  ! 2683: FMOVCC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_117:
	mov	0x38, %r14
	.word 0xf4f389e0  ! 2685: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb1a90820  ! 2686: FMOVLEU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_225:
	setx	0x31013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_127:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 2689: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb9a58860  ! 2692: FADDq	dis not found

	.word 0xb9aa8820  ! 2695: FMOVG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_128:
	mov	0x1e, %r14
	.word 0xf2db8400  ! 2698: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbda98820  ! 2701: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb23de0ae  ! 2702: XNOR_I	xnor 	%r23, 0x00ae, %r25
	.word 0xbfa84820  ! 2703: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbfab8820  ! 2710: FMOVPOS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_226:
	setx	0x300127, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_129:
	mov	0x3c4, %r14
	.word 0xfcdb8400  ! 2712: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_118:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 2715: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb32db001  ! 2718: SLLX_I	sllx	%r22, 0x0001, %r25
	.word 0xb7a449e0  ! 2720: FDIVq	dis not found

	.word 0xbfaa4820  ! 2721: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbc8561e9  ! 2722: ADDcc_I	addcc 	%r21, 0x01e9, %r30
	.word 0xbfa88820  ! 2731: FMOVLE	fmovs	%fcc1, %f0, %f31
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 4)
	.word 0xbba00540  ! 2733: FSQRTd	fsqrt	
	.word 0xb4958000  ! 2735: ORcc_R	orcc 	%r22, %r0, %r26
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_227:
	setx	0x32021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_228:
	setx	0x310204, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_130:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 2742: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_229:
	setx	0x350033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_rd_131:
	mov	0x3c0, %r14
	.word 0xf4db8400  ! 2753: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_wr_119:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 2754: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1a98820  ! 2755: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbda488a0  ! 2758: FSUBs	fsubs	%f18, %f0, %f30
	.word 0xbe45215a  ! 2759: ADDC_I	addc 	%r20, 0x015a, %r31
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_132:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 2764: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_230:
	setx	0x360231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb54000  ! 2770: SUBCcc_R	orncc 	%r21, %r0, %r30
	.word 0xb5a84820  ! 2772: FMOVE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_231:
	setx	0x350118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_232:
	setx	0x34001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 35)
	.word 0xbda00020  ! 2782: FMOVs	fmovs	%f0, %f30
	.word 0xbe04a0a3  ! 2783: ADD_I	add 	%r18, 0x00a3, %r31
	.word 0xbda80820  ! 2788: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb9a408c0  ! 2793: FSUBd	fsubd	%f16, %f0, %f28
T1_asi_reg_wr_120:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 2797: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_233:
	setx	0x35013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 2802: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbda84820  ! 2803: FMOVE	fmovs	%fcc1, %f0, %f30
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 2d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 19)
	.word 0xb41460f4  ! 2813: OR_I	or 	%r17, 0x00f4, %r26
cpu_intr_1_234:
	setx	0x340017, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_121:
	mov	0x38, %r14
	.word 0xf0f38e40  ! 2815: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_235:
	setx	0x370029, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_122:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 2821: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb7a81c20  ! 2822: FMOVRGEZ	dis not found

	.word 0xb3aa0820  ! 2825: FMOVA	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_133:
	mov	0x18, %r14
	.word 0xf4db8e40  ! 2826: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_134:
	mov	0x26, %r14
	.word 0xfadb84a0  ! 2828: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 9)
	.word 0xb9a90820  ! 2834: FMOVLEU	fmovs	%fcc1, %f0, %f28
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb1a5c8a0  ! 2837: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xb7a90820  ! 2839: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbc14e181  ! 2840: OR_I	or 	%r19, 0x0181, %r30
	.word 0xbb641800  ! 2841: MOVcc_R	<illegal instruction>
	.word 0xba8d0000  ! 2843: ANDcc_R	andcc 	%r20, %r0, %r29
	.word 0xb41c0000  ! 2845: XOR_R	xor 	%r16, %r0, %r26
	.word 0xb9510000  ! 2852: RDPR_TICK	<illegal instruction>
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 3)
	.word 0xb5a54940  ! 2854: FMULd	fmuld	%f52, %f0, %f26
cpu_intr_1_236:
	setx	0x350229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c9e0  ! 2857: FDIVq	dis not found

	.word 0xb1a5c8e0  ! 2861: FSUBq	dis not found

	.word 0xbda00040  ! 2862: FMOVd	fmovd	%f0, %f30
	.word 0xb1a81c20  ! 2863: FMOVRGEZ	dis not found

	.word 0xb3a549e0  ! 2864: FDIVq	dis not found

	.word 0xb3a94820  ! 2867: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a81420  ! 2869: FMOVRNZ	dis not found

	.word 0xbba548a0  ! 2873: FSUBs	fsubs	%f21, %f0, %f29
cpu_intr_1_237:
	setx	0x36032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 2879: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb1ab4820  ! 2880: FMOVCC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_238:
	setx	0x370318, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb615616f  ! 2885: OR_I	or 	%r21, 0x016f, %r27
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb5abc820  ! 2889: FMOVVC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_239:
	setx	0x340038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00c0000  ! 2895: AND_R	and 	%r16, %r0, %r24
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 2f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa81c20  ! 2898: FMOVRGEZ	dis not found

	.word 0xb9a4c9c0  ! 2900: FDIVd	fdivd	%f50, %f0, %f28
cpu_intr_1_240:
	setx	0x360202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 15)
	.word 0xb53c6001  ! 2907: SRA_I	sra 	%r17, 0x0001, %r26
cpu_intr_1_241:
	setx	0x34022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a40860  ! 2914: FADDq	dis not found

	.word 0xb3ab0820  ! 2917: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbc14c000  ! 2918: OR_R	or 	%r19, %r0, %r30
	.word 0xb4958000  ! 2922: ORcc_R	orcc 	%r22, %r0, %r26
	.word 0xb5aa4820  ! 2923: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb41520bc  ! 2926: OR_I	or 	%r20, 0x00bc, %r26
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_123:
	mov	0xd, %r14
	.word 0xfef384a0  ! 2932: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb5a48960  ! 2933: FMULq	dis not found

	.word 0xbfa00560  ! 2937: FSQRTq	fsqrt	
	.word 0xb5a5c920  ! 2938: FMULs	fmuls	%f23, %f0, %f26
	.word 0xb02d0000  ! 2941: ANDN_R	andn 	%r20, %r0, %r24
	.word 0xbfaa0820  ! 2943: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbba508a0  ! 2946: FSUBs	fsubs	%f20, %f0, %f29
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_rd_135:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 2950: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbfa50920  ! 2952: FMULs	fmuls	%f20, %f0, %f31
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 31)
	.word 0xb5a81420  ! 2961: FMOVRNZ	dis not found

iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_242:
	setx	0x360226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_243:
	setx	0x350306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa8820  ! 2973: FMOVG	fmovs	%fcc1, %f0, %f25
	lda	[%r23 + %g0] 0xf0, %f2
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 39)
	.word 0xb1a5c9c0  ! 2982: FDIVd	fdivd	%f54, %f0, %f24
T1_asi_reg_wr_124:
	mov	0x5, %r14
	.word 0xf4f38e80  ! 2983: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_wr_125:
	mov	0x3c8, %r14
	.word 0xfef384a0  ! 2984: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbda80820  ! 2985: FMOVN	fmovs	%fcc1, %f0, %f30
cpu_intr_1_244:
	setx	0x37010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_126:
	mov	0x5, %r14
	.word 0xf2f389e0  ! 2990: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_245:
	setx	0x35013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_246:
	setx	0x36021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_247:
	setx	0x35021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 2997: FMOVN	fmovs	%fcc1, %f0, %f29
cpu_intr_1_248:
	setx	0x36002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_136:
	mov	0x2a, %r14
	.word 0xfedb84a0  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_249:
	setx	0x360125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_250:
	setx	0x360325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13d0000  ! 3007: SRA_R	sra 	%r20, %r0, %r24
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_251:
	setx	0x36011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 3013: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb234a1af  ! 3017: ORN_I	orn 	%r18, 0x01af, %r25
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 15)
	.word 0xbf35d000  ! 3021: SRLX_R	srlx	%r23, %r0, %r31
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 32)
	.word 0xb9a50960  ! 3023: FMULq	dis not found

	.word 0xbfa80820  ! 3025: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_127:
	mov	0x24, %r14
	.word 0xf2f389e0  ! 3026: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_252:
	setx	0x340329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 3031: FSQRTq	fsqrt	
	.word 0xbba40960  ! 3033: FMULq	dis not found

	.word 0xb1a00520  ! 3034: FSQRTs	fsqrt	
	.word 0xbdaac820  ! 3039: FMOVGE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_128:
	mov	0x9, %r14
	.word 0xf8f38e40  ! 3040: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_137:
	mov	0x35, %r14
	.word 0xf6db89e0  ! 3041: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_wr_129:
	mov	0x6, %r14
	.word 0xfaf38e40  ! 3042: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_138:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 3043: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbc25a1eb  ! 3046: SUB_I	sub 	%r22, 0x01eb, %r30
T1_asi_reg_rd_139:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 3052: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_253:
	setx	0x37011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a44940  ! 3055: FMULd	fmuld	%f48, %f0, %f26
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 12)
	.word 0xb5a88820  ! 3059: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a00520  ! 3061: FSQRTs	fsqrt	
	.word 0xbc0d6196  ! 3063: AND_I	and 	%r21, 0x0196, %r30
	.word 0xb9a40820  ! 3064: FADDs	fadds	%f16, %f0, %f28
	.word 0xb23d0000  ! 3067: XNOR_R	xnor 	%r20, %r0, %r25
cpu_intr_1_254:
	setx	0x35022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a409a0  ! 3072: FDIVs	fdivs	%f16, %f0, %f28
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 19)
	.word 0xb1a5c8c0  ! 3074: FSUBd	fsubd	%f54, %f0, %f24
	.word 0xb1a84820  ! 3078: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a509c0  ! 3081: FDIVd	fdivd	%f20, %f0, %f24
T1_asi_reg_rd_140:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 3082: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_255:
	setx	0x340034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 3089: FMOVGE	fmovs	%fcc1, %f0, %f31
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 15)
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_wr_130:
	mov	0x17, %r14
	.word 0xf4f38e40  ! 3095: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbda488a0  ! 3097: FSUBs	fsubs	%f18, %f0, %f30
	.word 0xb3a00520  ! 3101: FSQRTs	fsqrt	
T1_asi_reg_rd_141:
	mov	0x3c8, %r14
	.word 0xf2db8e60  ! 3104: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_256:
	setx	0x370229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_257:
	setx	0x37001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a44940  ! 3111: FMULd	fmuld	%f48, %f0, %f24
T1_asi_reg_wr_131:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 3112: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_258:
	setx	0x340034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_259:
	setx	0x34012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_260:
	setx	0x34002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_261:
	setx	0x360235, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_262:
	setx	0x360331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c940  ! 3127: FMULd	fmuld	%f50, %f0, %f24
T1_asi_reg_rd_142:
	mov	0x3c8, %r14
	.word 0xf4db8e60  ! 3131: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb7a489c0  ! 3133: FDIVd	fdivd	%f18, %f0, %f58
cpu_intr_1_263:
	setx	0x34012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_264:
	setx	0x34011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_143:
	mov	0x22, %r14
	.word 0xf2db8e80  ! 3137: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, a)
	.word 0xb3a80c20  ! 3141: FMOVRLZ	dis not found

	.word 0xbda58960  ! 3142: FMULq	dis not found

iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_265:
	setx	0x370020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 3147: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb7a81420  ! 3150: FMOVRNZ	dis not found

iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb7aa0820  ! 3152: FMOVA	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_132:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 3154: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb3a88820  ! 3156: FMOVLE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_266:
	setx	0x37012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_144:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 3162: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_267:
	setx	0x370011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c9c0  ! 3180: FDIVd	fdivd	%f54, %f0, %f58
T1_asi_reg_wr_133:
	mov	0x3c4, %r14
	.word 0xf6f38e60  ! 3181: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb1aa8820  ! 3186: FMOVG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_134:
	mov	0x3c8, %r14
	.word 0xf0f38400  ! 3187: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_268:
	setx	0x340219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28c20a1  ! 3191: ANDcc_I	andcc 	%r16, 0x00a1, %r25
cpu_intr_1_269:
	setx	0x34003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 3193: FSQRTd	fsqrt	
T1_asi_reg_wr_135:
	mov	0x3c4, %r14
	.word 0xf8f38e60  ! 3194: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_1_270:
	setx	0x350037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba588e0  ! 3196: FSUBq	dis not found

cpu_intr_1_271:
	setx	0x350039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92cf001  ! 3204: SLLX_I	sllx	%r19, 0x0001, %r28
T1_asi_reg_rd_145:
	mov	0x11, %r14
	.word 0xf6db8e40  ! 3205: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_272:
	setx	0x38023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 3209: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbba90820  ! 3211: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbe3d4000  ! 3212: XNOR_R	xnor 	%r21, %r0, %r31
cpu_intr_1_273:
	setx	0x3b0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 3214: FSQRTs	fsqrt	
	.word 0xb7a588c0  ! 3216: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xbba00520  ! 3218: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_274:
	setx	0x3a0329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_275:
	setx	0x3b0315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_276:
	setx	0x1033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_277:
	setx	0x390014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00020  ! 3231: FMOVs	fmovs	%f0, %f28
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a48860  ! 3242: FADDq	dis not found

	.word 0xb1a4c9a0  ! 3248: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xbfa4c9a0  ! 3249: FDIVs	fdivs	%f19, %f0, %f31
T1_asi_reg_rd_146:
	mov	0x10, %r14
	.word 0xf4db8e80  ! 3251: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 2a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_278:
	setx	0x380215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_279:
	setx	0x3b0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf345000  ! 3261: SRLX_R	srlx	%r17, %r0, %r31
T1_asi_reg_wr_136:
	mov	0x15, %r14
	.word 0xf8f38e40  ! 3263: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbda00560  ! 3264: FSQRTq	fsqrt	
	.word 0xb9aa8820  ! 3265: FMOVG	fmovs	%fcc1, %f0, %f28
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 15)
	.word 0xb604e010  ! 3267: ADD_I	add 	%r19, 0x0010, %r27
T1_asi_reg_wr_137:
	mov	0xd, %r14
	.word 0xfef389e0  ! 3269: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb1a50860  ! 3270: FADDq	dis not found

cpu_intr_1_280:
	setx	0x380135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8de1fd  ! 3274: ANDcc_I	andcc 	%r23, 0x01fd, %r29
cpu_intr_1_281:
	setx	0x39003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba508c0  ! 3277: FSUBd	fsubd	%f20, %f0, %f60
T1_asi_reg_rd_147:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_wr_138:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 3280: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_rd_148:
	mov	0x37, %r14
	.word 0xf0db8400  ! 3281: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 10)
	.word 0xbba44840  ! 3285: FADDd	faddd	%f48, %f0, %f60
T1_asi_reg_rd_149:
	mov	0x16, %r14
	.word 0xf6db8400  ! 3286: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_wr_139:
	mov	0x25, %r14
	.word 0xfcf38e40  ! 3287: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbba81c20  ! 3290: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_140:
	mov	0x18, %r14
	.word 0xf6f38e40  ! 3294: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_150:
	mov	0xc, %r14
	.word 0xf2db8e60  ! 3295: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 6)
	.word 0xb7a80420  ! 3299: FMOVRZ	dis not found

	.word 0xbfa488e0  ! 3302: FSUBq	dis not found

iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_rd_151:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb1a80820  ! 3316: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb534f001  ! 3321: SRLX_I	srlx	%r19, 0x0001, %r26
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb3a94820  ! 3323: FMOVCS	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd500000  ! 3327: RDPR_TPC	<illegal instruction>
cpu_intr_1_282:
	setx	0x39013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_283:
	setx	0x380016, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_284:
	setx	0x390206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 3335: FMOVCS	fmovs	%fcc1, %f0, %f31
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_285:
	setx	0x390229, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_141:
	mov	0x29, %r14
	.word 0xfef38e80  ! 3340: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbc9ca14e  ! 3344: XORcc_I	xorcc 	%r18, 0x014e, %r30
cpu_intr_1_286:
	setx	0x3a032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_287:
	setx	0x39001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6144000  ! 3358: OR_R	or 	%r17, %r0, %r27
	.word 0xbb3cf001  ! 3360: SRAX_I	srax	%r19, 0x0001, %r29
	.word 0xb9a4c8a0  ! 3367: FSUBs	fsubs	%f19, %f0, %f28
	.word 0xbfa00020  ! 3370: FMOVs	fmovs	%f0, %f31
T1_asi_reg_wr_142:
	mov	0x3c8, %r14
	.word 0xf8f38e60  ! 3372: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbda9c820  ! 3376: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbba48920  ! 3378: FMULs	fmuls	%f18, %f0, %f29
T1_asi_reg_rd_152:
	mov	0x26, %r14
	.word 0xfcdb8e40  ! 3380: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_288:
	setx	0x380002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa4820  ! 3385: FMOVNE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_143:
	mov	0x2b, %r14
	.word 0xfaf38e40  ! 3386: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9a5c860  ! 3387: FADDq	dis not found

	.word 0xb7a44920  ! 3388: FMULs	fmuls	%f17, %f0, %f27
	.word 0xbcc54000  ! 3389: ADDCcc_R	addccc 	%r21, %r0, %r30
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_144:
	mov	0x3c5, %r14
	.word 0xf0f389e0  ! 3393: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_289:
	setx	0x3b011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81c20  ! 3396: FMOVRGEZ	dis not found

iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_290:
	setx	0x3b032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_291:
	setx	0x38011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81420  ! 3413: FMOVRNZ	dis not found

T1_asi_reg_rd_153:
	mov	0xb, %r14
	.word 0xf6db84a0  ! 3415: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_292:
	setx	0x39000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 3417: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb9a81420  ! 3419: FMOVRNZ	dis not found

cpu_intr_1_293:
	setx	0x390313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a8c820  ! 3425: FMOVL	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb69cc000  ! 3428: XORcc_R	xorcc 	%r19, %r0, %r27
	.word 0xb6bd4000  ! 3430: XNORcc_R	xnorcc 	%r21, %r0, %r27
	.word 0xb7ab4820  ! 3432: FMOVCC	fmovs	%fcc1, %f0, %f27
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_145:
	mov	0x10, %r14
	.word 0xf8f389e0  ! 3435: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb5a00560  ! 3437: FSQRTq	fsqrt	
cpu_intr_1_294:
	setx	0x390109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc35e0a5  ! 3439: SUBC_I	orn 	%r23, 0x00a5, %r30
T1_asi_reg_wr_146:
	mov	0x7, %r14
	.word 0xfaf384a0  ! 3443: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb1a50840  ! 3444: FADDd	faddd	%f20, %f0, %f24
	.word 0xb93d5000  ! 3447: SRAX_R	srax	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 20)
	.word 0xb0258000  ! 3452: SUB_R	sub 	%r22, %r0, %r24
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 33)
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_wr_147:
	mov	0x30, %r14
	.word 0xf2f38e60  ! 3456: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_295:
	setx	0x380100, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_148:
	mov	0x12, %r14
	.word 0xfef384a0  ! 3461: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb5a508a0  ! 3463: FSUBs	fsubs	%f20, %f0, %f26
cpu_intr_1_296:
	setx	0x38033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_149:
	mov	0x4, %r14
	.word 0xfef389e0  ! 3465: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_297:
	setx	0x3b0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994a1f1  ! 3469: WRPR_TICK_I	wrpr	%r18, 0x01f1, %tick
T1_asi_reg_rd_154:
	mov	0xe, %r14
	.word 0xfadb8e40  ! 3470: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_150:
	mov	0x22, %r14
	.word 0xfef38e80  ! 3472: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbba00020  ! 3474: FMOVs	fmovs	%f0, %f29
T1_asi_reg_wr_151:
	mov	0x2a, %r14
	.word 0xf6f389e0  ! 3480: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbda81820  ! 3482: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb8c4c000  ! 3483: ADDCcc_R	addccc 	%r19, %r0, %r28
cpu_intr_1_298:
	setx	0x38012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_152:
	mov	0x2, %r14
	.word 0xfcf38e40  ! 3488: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbba90820  ! 3490: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb7a00560  ! 3492: FSQRTq	fsqrt	
	.word 0xb9a80820  ! 3497: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb7a488e0  ! 3499: FSUBq	dis not found

	.word 0xb9a5c820  ! 3500: FADDs	fadds	%f23, %f0, %f28
	.word 0xb7a80820  ! 3501: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_155:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 3502: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_153:
	mov	0x38, %r14
	.word 0xf6f38e60  ! 3505: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_rd_156:
	mov	0x2f, %r14
	.word 0xf4db8e80  ! 3509: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb5a80c20  ! 3512: FMOVRLZ	dis not found

	.word 0xbda00040  ! 3513: FMOVd	fmovd	%f0, %f30
cpu_intr_1_299:
	setx	0x3a0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00020  ! 3516: FMOVs	fmovs	%f0, %f30
	.word 0xb7a54960  ! 3517: FMULq	dis not found

	.word 0x8794e074  ! 3518: WRPR_TT_I	wrpr	%r19, 0x0074, %tt
T1_asi_reg_wr_154:
	mov	0x2b, %r14
	.word 0xfcf38400  ! 3519: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbc440000  ! 3520: ADDC_R	addc 	%r16, %r0, %r30
cpu_intr_1_300:
	setx	0x390322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_301:
	setx	0x39032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 3525: FMOVRGEZ	dis not found

	.word 0xbfa408e0  ! 3526: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5ab8820  ! 3528: FMOVPOS	fmovs	%fcc1, %f0, %f26
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 24)
	.word 0xb245c000  ! 3533: ADDC_R	addc 	%r23, %r0, %r25
	.word 0xb5a00560  ! 3534: FSQRTq	fsqrt	
	.word 0xba0461e6  ! 3536: ADD_I	add 	%r17, 0x01e6, %r29
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 22)
	.word 0xbfa548e0  ! 3540: FSUBq	dis not found

T1_asi_reg_wr_155:
	mov	0x28, %r14
	.word 0xf0f384a0  ! 3543: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_wr_156:
	mov	0x21, %r14
	.word 0xfef38e40  ! 3549: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 25)
	.word 0xb7a80c20  ! 3554: FMOVRLZ	dis not found

iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_157:
	mov	0x3c8, %r14
	.word 0xf8f384a0  ! 3561: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_302:
	setx	0x3b0116, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_157:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 3563: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_1_303:
	setx	0x39013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a508a0  ! 3566: FSUBs	fsubs	%f20, %f0, %f24
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 6)
	.word 0xbbab8820  ! 3577: FMOVPOS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_304:
	setx	0x3a0022, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_305:
	setx	0x3a031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 3582: FSQRTq	fsqrt	
	.word 0xbfa488c0  ! 3585: FSUBd	fsubd	%f18, %f0, %f62
	.word 0xb43c6088  ! 3586: XNOR_I	xnor 	%r17, 0x0088, %r26
	.word 0xbbaa8820  ! 3588: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb3a80820  ! 3590: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0x8194e0e8  ! 3591: WRPR_TPC_I	wrpr	%r19, 0x00e8, %tpc
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_306:
	setx	0x380231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 3598: FMOVG	fmovs	%fcc1, %f0, %f24
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_158:
	mov	0x2c, %r14
	.word 0xf6db89e0  ! 3603: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_wr_158:
	mov	0x1b, %r14
	.word 0xfef38e60  ! 3604: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_307:
	setx	0x390001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0256155  ! 3610: SUB_I	sub 	%r21, 0x0155, %r24
	.word 0xb5ab8820  ! 3611: FMOVPOS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_159:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 3615: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_308:
	setx	0x390033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba8c820  ! 3617: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbfa00040  ! 3618: FMOVd	fmovd	%f0, %f62
	.word 0xb9a4c8e0  ! 3619: FSUBq	dis not found

	.word 0xbda81820  ! 3621: FMOVRGZ	fmovs	%fcc3, %f0, %f30
cpu_intr_1_309:
	setx	0x3a0209, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_159:
	mov	0x3c7, %r14
	.word 0xf8db89e0  ! 3628: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_rd_160:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 3630: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb3a94820  ! 3631: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbba90820  ! 3632: FMOVLEU	fmovs	%fcc1, %f0, %f29
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 32)
	.word 0xbda488a0  ! 3638: FSUBs	fsubs	%f18, %f0, %f30
cpu_intr_1_310:
	setx	0x390219, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_160:
	mov	0x7, %r14
	.word 0xf8f38e40  ! 3650: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb7aa4820  ! 3654: FMOVNE	fmovs	%fcc1, %f0, %f27
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 1d)
	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_rd_161:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 3660: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb334b001  ! 3663: SRLX_I	srlx	%r18, 0x0001, %r25
	.word 0xbfa40840  ! 3664: FADDd	faddd	%f16, %f0, %f62
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb23d2081  ! 3668: XNOR_I	xnor 	%r20, 0x0081, %r25
	.word 0xb9a548c0  ! 3669: FSUBd	fsubd	%f52, %f0, %f28
	.word 0xb7a81420  ! 3671: FMOVRNZ	dis not found

cpu_intr_1_311:
	setx	0x3a0334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_312:
	setx	0x3d0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_wr_161:
	mov	0x2c, %r14
	.word 0xf2f38e40  ! 3684: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3a00540  ! 3685: FSQRTd	fsqrt	
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 18)
	.word 0xb7a408e0  ! 3688: FSUBq	dis not found

	.word 0xbfa00040  ! 3689: FMOVd	fmovd	%f0, %f62
	.word 0xbfa80c20  ! 3692: FMOVRLZ	dis not found

	.word 0xbba5c860  ! 3696: FADDq	dis not found

	.word 0xbfa548e0  ! 3697: FSUBq	dis not found

iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb42cc000  ! 3701: ANDN_R	andn 	%r19, %r0, %r26
	.word 0xb6940000  ! 3702: ORcc_R	orcc 	%r16, %r0, %r27
T1_asi_reg_wr_162:
	mov	0x26, %r14
	.word 0xfcf38e80  ! 3704: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb3a9c820  ! 3707: FMOVVS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_313:
	setx	0x3f0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c8e0  ! 3711: FSUBq	dis not found

	.word 0xb5a449c0  ! 3712: FDIVd	fdivd	%f48, %f0, %f26
	.word 0xb1aa8820  ! 3713: FMOVG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_314:
	setx	0x3c0337, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_163:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 3716: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbda5c920  ! 3717: FMULs	fmuls	%f23, %f0, %f30
	.word 0xb82dc000  ! 3723: ANDN_R	andn 	%r23, %r0, %r28
	lda	[%r22 + %g0] 0xf0, %f2
T1_asi_reg_wr_164:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 3727: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_165:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 3733: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_162:
	mov	0x7, %r14
	.word 0xfadb8400  ! 3734: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_1_315:
	setx	0x3e0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 3736: FMOVRZ	dis not found

cpu_intr_1_316:
	setx	0x3f002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_163:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 3741: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_wr_166:
	mov	0x2b, %r14
	.word 0xfcf38e40  ! 3745: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb0b58000  ! 3754: SUBCcc_R	orncc 	%r22, %r0, %r24
T1_asi_reg_rd_164:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 24)
	.word 0xb1a50920  ! 3761: FMULs	fmuls	%f20, %f0, %f24
	.word 0xbe148000  ! 3762: OR_R	or 	%r18, %r0, %r31
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 39)
	.word 0xbfa5c920  ! 3771: FMULs	fmuls	%f23, %f0, %f31
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_167:
	mov	0x3c5, %r14
	.word 0xf8f384a0  ! 3774: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_wr_168:
	mov	0x5, %r14
	.word 0xfcf38e40  ! 3777: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, c)
	.word 0xb57d4400  ! 3783: MOVR_R	movre	%r21, %r0, %r26
	.word 0xb5a509a0  ! 3786: FDIVs	fdivs	%f20, %f0, %f26
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 31)
	.word 0xbda88820  ! 3789: FMOVLE	fmovs	%fcc1, %f0, %f30
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb7a80820  ! 3802: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb49d6163  ! 3803: XORcc_I	xorcc 	%r21, 0x0163, %r26
cpu_intr_1_317:
	setx	0x3d0135, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_169:
	mov	0x30, %r14
	.word 0xf0f38e60  ! 3807: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb4c52119  ! 3808: ADDCcc_I	addccc 	%r20, 0x0119, %r26
	.word 0xbda80c20  ! 3811: FMOVRLZ	dis not found

	.word 0xbfa4c9a0  ! 3812: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xbda589c0  ! 3813: FDIVd	fdivd	%f22, %f0, %f30
T1_asi_reg_wr_170:
	mov	0x16, %r14
	.word 0xf0f38e40  ! 3817: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb72df001  ! 3823: SLLX_I	sllx	%r23, 0x0001, %r27
cpu_intr_1_318:
	setx	0x3c0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 12)
	.word 0xb9a549c0  ! 3827: FDIVd	fdivd	%f52, %f0, %f28
cpu_intr_1_319:
	setx	0x3e010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 11)
	.word 0xbba508c0  ! 3835: FSUBd	fsubd	%f20, %f0, %f60
cpu_intr_1_320:
	setx	0x3c0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 3837: FMOVGE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_165:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 3843: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_321:
	setx	0x3e0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa508e0  ! 3848: FSUBq	dis not found

	.word 0xb1aa4820  ! 3851: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbda81c20  ! 3852: FMOVRGEZ	dis not found

iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_wr_171:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 3857: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_322:
	setx	0x3e0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba589c0  ! 3859: FDIVd	fdivd	%f22, %f0, %f60
	.word 0xb13d5000  ! 3861: SRAX_R	srax	%r21, %r0, %r24
	.word 0xb9a80c20  ! 3862: FMOVRLZ	dis not found

T1_asi_reg_rd_166:
	mov	0x3, %r14
	.word 0xf8db8400  ! 3865: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbda00540  ! 3866: FSQRTd	fsqrt	
	.word 0xb9a84820  ! 3869: FMOVE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_172:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 3870: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_323:
	setx	0x3f0014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_324:
	setx	0x3e0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb9a50840  ! 3879: FADDd	faddd	%f20, %f0, %f28
	.word 0xb8440000  ! 3880: ADDC_R	addc 	%r16, %r0, %r28
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 23)
	.word 0xb2bc4000  ! 3885: XNORcc_R	xnorcc 	%r17, %r0, %r25
	.word 0xbbab4820  ! 3887: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb9a48860  ! 3890: FADDq	dis not found

T1_asi_reg_wr_173:
	mov	0x2, %r14
	.word 0xf0f38e40  ! 3891: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a50920  ! 3894: FMULs	fmuls	%f20, %f0, %f24
T1_asi_reg_wr_174:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 3896: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, a)
	.word 0xb9a40940  ! 3898: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb5510000  ! 3904: RDPR_TICK	<illegal instruction>
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, c)
	.word 0x919520cd  ! 3909: WRPR_PIL_I	wrpr	%r20, 0x00cd, %pil
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 31)
	.word 0xbfa8c820  ! 3911: FMOVL	fmovs	%fcc1, %f0, %f31
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 11)
	.word 0xbda81420  ! 3915: FMOVRNZ	dis not found

	.word 0xb1aa4820  ! 3925: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb6850000  ! 3926: ADDcc_R	addcc 	%r20, %r0, %r27
	.word 0xbda81820  ! 3929: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbba4c820  ! 3931: FADDs	fadds	%f19, %f0, %f29
	.word 0xbfa81820  ! 3932: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb1a449c0  ! 3936: FDIVd	fdivd	%f48, %f0, %f24
cpu_intr_1_325:
	setx	0x3d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a409c0  ! 3943: FDIVd	fdivd	%f16, %f0, %f24
T1_asi_reg_rd_167:
	mov	0xe, %r14
	.word 0xfadb8e80  ! 3946: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb3a548e0  ! 3947: FSUBq	dis not found

cpu_intr_1_326:
	setx	0x3e0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80c20  ! 3950: FMOVRLZ	dis not found

cpu_intr_1_327:
	setx	0x3f0015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_328:
	setx	0x3e033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_168:
	mov	0x33, %r14
	.word 0xf0db84a0  ! 3958: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_175:
	mov	0x5, %r14
	.word 0xf6f38e40  ! 3961: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_176:
	mov	0x2b, %r14
	.word 0xfef38e80  ! 3962: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 25)
	.word 0xb3a00540  ! 3966: FSQRTd	fsqrt	
	.word 0xb1a4c840  ! 3967: FADDd	faddd	%f50, %f0, %f24
T1_asi_reg_wr_177:
	mov	0x2d, %r14
	.word 0xf0f38e40  ! 3970: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 19)
	.word 0xb9a4c940  ! 3973: FMULd	fmuld	%f50, %f0, %f28
	.word 0xb01ca195  ! 3975: XOR_I	xor 	%r18, 0x0195, %r24
T1_asi_reg_rd_169:
	mov	0x25, %r14
	.word 0xfadb8400  ! 3977: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_rd_170:
	mov	0x1e, %r14
	.word 0xf6db8400  ! 3978: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_329:
	setx	0x3e0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_171:
	mov	0x12, %r14
	.word 0xfadb84a0  ! 3983: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb9a449c0  ! 3984: FDIVd	fdivd	%f48, %f0, %f28
	.word 0xb9a80c20  ! 3987: FMOVRLZ	dis not found

cpu_intr_1_330:
	setx	0x3f0239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_331:
	setx	0x3f010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_332:
	setx	0x3d0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_178:
	mov	0x38, %r14
	.word 0xfef38400  ! 3994: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1a00560  ! 3996: FSQRTq	fsqrt	
cpu_intr_1_333:
	setx	0x3e0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab0820  ! 4000: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbba548c0  ! 4002: FSUBd	fsubd	%f52, %f0, %f60
	.word 0xbdaac820  ! 4003: FMOVGE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_334:
	setx	0x3e010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_179:
	mov	0x1b, %r14
	.word 0xf2f384a0  ! 4012: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb9abc820  ! 4013: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_335:
	setx	0x3d023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_172:
	mov	0x11, %r14
	.word 0xfedb8400  ! 4016: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb7a98820  ! 4017: FMOVNEG	fmovs	%fcc1, %f0, %f27
cpu_intr_1_336:
	setx	0x3d0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 4025: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbba489a0  ! 4026: FDIVs	fdivs	%f18, %f0, %f29
cpu_intr_1_337:
	setx	0x30010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c8c0  ! 4028: FSUBd	fsubd	%f50, %f0, %f26
T1_asi_reg_wr_180:
	mov	0x3c4, %r14
	.word 0xfef389e0  ! 4029: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_181:
	mov	0x20, %r14
	.word 0xfcf389e0  ! 4031: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb9a94820  ! 4032: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb5aa0820  ! 4034: FMOVA	fmovs	%fcc1, %f0, %f26
cpu_intr_1_338:
	setx	0x3d031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_339:
	setx	0x3c0009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_340:
	setx	0x3d0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba84820  ! 4046: FMOVE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_341:
	setx	0x3e033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_182:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 4050: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_wr_183:
	mov	0x9, %r14
	.word 0xfaf384a0  ! 4052: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbba80820  ! 4053: FMOVN	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_173:
	mov	0x15, %r14
	.word 0xf6db89e0  ! 4057: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbdab0820  ! 4058: FMOVGU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_342:
	setx	0x3c001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_343:
	setx	0x3e0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c54000  ! 4062: ADDCcc_R	addccc 	%r21, %r0, %r25
	.word 0xbda408e0  ! 4064: FSUBq	dis not found

iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbfa9c820  ! 4068: FMOVVS	fmovs	%fcc1, %f0, %f31
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 10)
	.word 0xb1a00040  ! 4071: FMOVd	fmovd	%f0, %f24
	.word 0xb2048000  ! 4073: ADD_R	add 	%r18, %r0, %r25
cpu_intr_1_344:
	setx	0x3d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69d8000  ! 4077: XORcc_R	xorcc 	%r22, %r0, %r27
	.word 0xb3a44860  ! 4081: FADDq	dis not found

	.word 0xb7a81420  ! 4088: FMOVRNZ	dis not found

	.word 0xb9a4c840  ! 4089: FADDd	faddd	%f50, %f0, %f28
cpu_intr_1_345:
	setx	0x3e0019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_346:
	setx	0x3d0022, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_184:
	mov	0x1f, %r14
	.word 0xf6f389e0  ! 4094: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb62dc000  ! 4095: ANDN_R	andn 	%r23, %r0, %r27
	.word 0xbfa9c820  ! 4096: FMOVVS	fmovs	%fcc1, %f0, %f31
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 13)
	.word 0xb3a98820  ! 4103: FMOVNEG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_185:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 4105: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_347:
	setx	0x3d013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbfa84820  ! 4111: FMOVE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_174:
	mov	0x6, %r14
	.word 0xfadb8e80  ! 4113: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_rd_175:
	mov	0x15, %r14
	.word 0xfadb8e80  ! 4117: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_348:
	setx	0x3e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_rd_176:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 4121: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbda409c0  ! 4122: FDIVd	fdivd	%f16, %f0, %f30
	.word 0xb3a5c9e0  ! 4123: FDIVq	dis not found

cpu_intr_1_349:
	setx	0x3d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_350:
	setx	0x3d023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_351:
	setx	0x3d032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81820  ! 4128: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb9641800  ! 4133: MOVcc_R	<illegal instruction>
cpu_intr_1_352:
	setx	0x420024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_353:
	setx	0x40022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_177:
	mov	0xe, %r14
	.word 0xf4db84a0  ! 4146: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb3510000  ! 4149: RDPR_TICK	<illegal instruction>
	.word 0xbba98820  ! 4150: FMOVNEG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_186:
	mov	0x1f, %r14
	.word 0xf2f38e60  ! 4151: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_wr_187:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 4153: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_rd_178:
	mov	0x25, %r14
	.word 0xfedb89e0  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbcb4c000  ! 4155: ORNcc_R	orncc 	%r19, %r0, %r30
	.word 0xbfa84820  ! 4156: FMOVE	fmovs	%fcc1, %f0, %f31
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 15)
	.word 0xb5a00520  ! 4161: FSQRTs	fsqrt	
cpu_intr_1_354:
	setx	0x420330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_355:
	setx	0x420217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a44820  ! 4168: FADDs	fadds	%f17, %f0, %f28
	.word 0xb9a449c0  ! 4172: FDIVd	fdivd	%f48, %f0, %f28
	.word 0xb5a00560  ! 4176: FSQRTq	fsqrt	
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_356:
	setx	0x41013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_188:
	mov	0x1, %r14
	.word 0xf2f389e0  ! 4180: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_357:
	setx	0x400007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a448a0  ! 4184: FSUBs	fsubs	%f17, %f0, %f26
cpu_intr_1_358:
	setx	0x43003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a94820  ! 4188: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a98820  ! 4189: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbba00540  ! 4191: FSQRTd	fsqrt	
	.word 0xbdab8820  ! 4192: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbba508a0  ! 4193: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xbf641800  ! 4194: MOVcc_R	<illegal instruction>
	.word 0xb4148000  ! 4195: OR_R	or 	%r18, %r0, %r26
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 1)
	.word 0xbfa81820  ! 4200: FMOVRGZ	fmovs	%fcc3, %f0, %f31
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 32)
	.word 0xbbaac820  ! 4202: FMOVGE	fmovs	%fcc1, %f0, %f29
	lda	[%r17 + %g0] 0xf0, %f2
cpu_intr_1_359:
	setx	0x420231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 4206: FSQRTs	fsqrt	
T1_asi_reg_rd_179:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 4212: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_360:
	setx	0x40031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8bc8000  ! 4217: XNORcc_R	xnorcc 	%r18, %r0, %r28
T1_asi_reg_rd_180:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 4218: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb5a94820  ! 4221: FMOVCS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_361:
	setx	0x420214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_362:
	setx	0x420025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 4226: FMOVG	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_363:
	setx	0x400136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab0820  ! 4232: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb1ab0820  ! 4233: FMOVGU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_364:
	setx	0x420030, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_181:
	mov	0x9, %r14
	.word 0xf4db8e60  ! 4235: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb89cc000  ! 4236: XORcc_R	xorcc 	%r19, %r0, %r28
	.word 0xbda4c8c0  ! 4241: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xbfa00520  ! 4243: FSQRTs	fsqrt	
cpu_intr_1_365:
	setx	0x400014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_366:
	setx	0x400034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81d20f9  ! 4248: XOR_I	xor 	%r20, 0x00f9, %r28
cpu_intr_1_367:
	setx	0x40003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_189:
	mov	0x3c2, %r14
	.word 0xf6f389e0  ! 4255: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb1a408a0  ! 4259: FSUBs	fsubs	%f16, %f0, %f24
	.word 0xb7a80820  ! 4260: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 18)
	.word 0xb7a81c20  ! 4262: FMOVRGEZ	dis not found

	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb435a101  ! 4265: ORN_I	orn 	%r22, 0x0101, %r26
	.word 0xbfa50920  ! 4266: FMULs	fmuls	%f20, %f0, %f31
cpu_intr_1_368:
	setx	0x410002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa4c000  ! 4273: SUBcc_R	subcc 	%r19, %r0, %r29
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, c)
	.word 0xb0846119  ! 4275: ADDcc_I	addcc 	%r17, 0x0119, %r24
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 5)
	.word 0xb92dc000  ! 4278: SLL_R	sll 	%r23, %r0, %r28
	.word 0xbec5c000  ! 4280: ADDCcc_R	addccc 	%r23, %r0, %r31
	.word 0xb5a44940  ! 4281: FMULd	fmuld	%f48, %f0, %f26
	.word 0xb5a489e0  ! 4285: FDIVq	dis not found

	lda	[%r17 + %g0] 0xf0, %f2
T1_asi_reg_wr_190:
	mov	0x28, %r14
	.word 0xf2f38e40  ! 4290: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbb2d9000  ! 4291: SLLX_R	sllx	%r22, %r0, %r29
	.word 0xb285e1d5  ! 4292: ADDcc_I	addcc 	%r23, 0x01d5, %r25
T1_asi_reg_rd_182:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 4293: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbd3d2001  ! 4297: SRA_I	sra 	%r20, 0x0001, %r30
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb7a409a0  ! 4299: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb1a509a0  ! 4300: FDIVs	fdivs	%f20, %f0, %f24
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_wr_191:
	mov	0x36, %r14
	.word 0xf8f38e60  ! 4307: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_1_369:
	setx	0x430117, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_192:
	mov	0x32, %r14
	.word 0xf6f384a0  ! 4311: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_370:
	setx	0x410215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa4820  ! 4313: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbfa94820  ! 4314: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbfab8820  ! 4318: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbba00520  ! 4319: FSQRTs	fsqrt	
cpu_intr_1_371:
	setx	0x420025, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_193:
	mov	0x36, %r14
	.word 0xfcf38e40  ! 4324: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbab54000  ! 4327: ORNcc_R	orncc 	%r21, %r0, %r29
cpu_intr_1_372:
	setx	0x41002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_373:
	setx	0x42003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_374:
	setx	0x410325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a90820  ! 4334: FMOVLEU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_375:
	setx	0x400311, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_183:
	mov	0x25, %r14
	.word 0xf8db84a0  ! 4337: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb32c1000  ! 4338: SLLX_R	sllx	%r16, %r0, %r25
cpu_intr_1_376:
	setx	0x400224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a549c0  ! 4342: FDIVd	fdivd	%f52, %f0, %f28
	.word 0xb9a40920  ! 4346: FMULs	fmuls	%f16, %f0, %f28
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 8)
	.word 0xb3a58960  ! 4349: FMULq	dis not found

cpu_intr_1_377:
	setx	0x410328, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_184:
	mov	0x2c, %r14
	.word 0xf2db8e60  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb7a80c20  ! 4359: FMOVRLZ	dis not found

T1_asi_reg_wr_194:
	mov	0x3c8, %r14
	.word 0xfef389e0  ! 4360: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb9a00560  ! 4361: FSQRTq	fsqrt	
	.word 0xb5a81c20  ! 4363: FMOVRGEZ	dis not found

	.word 0xb5a588c0  ! 4366: FSUBd	fsubd	%f22, %f0, %f26
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 25)
	.word 0xb7a80820  ! 4369: FMOVN	fmovs	%fcc1, %f0, %f27
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbda81420  ! 4374: FMOVRNZ	dis not found

	.word 0xbfa00520  ! 4377: FSQRTs	fsqrt	
	.word 0xb1a40820  ! 4378: FADDs	fadds	%f16, %f0, %f24
cpu_intr_1_378:
	setx	0x420138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 4380: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb21ce137  ! 4382: XOR_I	xor 	%r19, 0x0137, %r25
	.word 0xb3a50940  ! 4385: FMULd	fmuld	%f20, %f0, %f56
	.word 0xb09461bf  ! 4388: ORcc_I	orcc 	%r17, 0x01bf, %r24
	.word 0xb09d0000  ! 4389: XORcc_R	xorcc 	%r20, %r0, %r24
T1_asi_reg_rd_185:
	mov	0x16, %r14
	.word 0xfedb8e40  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3a84820  ! 4391: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a00560  ! 4393: FSQRTq	fsqrt	
	.word 0xb1a80c20  ! 4398: FMOVRLZ	dis not found

T1_asi_reg_rd_186:
	mov	0x3c8, %r14
	.word 0xf6db8e60  ! 4399: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb5aa4820  ! 4400: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa00040  ! 4401: FMOVd	fmovd	%f0, %f62
	.word 0xbda50920  ! 4402: FMULs	fmuls	%f20, %f0, %f30
T1_asi_reg_wr_195:
	mov	0x21, %r14
	.word 0xf0f38e40  ! 4404: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1a40860  ! 4406: FADDq	dis not found

	.word 0xbda00040  ! 4410: FMOVd	fmovd	%f0, %f30
cpu_intr_1_379:
	setx	0x42031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00020  ! 4418: FMOVs	fmovs	%f0, %f29
cpu_intr_1_380:
	setx	0x41022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_381:
	setx	0x420137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_382:
	setx	0x430030, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_187:
	mov	0x10, %r14
	.word 0xf2db8e60  ! 4431: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_wr_196:
	mov	0x24, %r14
	.word 0xfef38e60  ! 4434: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_wr_197:
	mov	0x20, %r14
	.word 0xf4f38e40  ! 4444: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_wr_198:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 4445: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbbaac820  ! 4446: FMOVGE	fmovs	%fcc1, %f0, %f29
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 17)
	.word 0xb1aa8820  ! 4448: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb7a44840  ! 4449: FADDd	faddd	%f48, %f0, %f58
	.word 0x9194e1ae  ! 4451: WRPR_PIL_I	wrpr	%r19, 0x01ae, %pil
T1_asi_reg_wr_199:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 4453: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 4)
	.word 0xb72d4000  ! 4458: SLL_R	sll 	%r21, %r0, %r27
	.word 0xbda9c820  ! 4459: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a00020  ! 4462: FMOVs	fmovs	%f0, %f28
	.word 0xb9a8c820  ! 4463: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb9a00520  ! 4464: FSQRTs	fsqrt	
	.word 0xb9ab8820  ! 4466: FMOVPOS	fmovs	%fcc1, %f0, %f28
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 6)
	.word 0xb9a508e0  ! 4472: FSUBq	dis not found

	.word 0xb7aa8820  ! 4473: FMOVG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_188:
	mov	0x11, %r14
	.word 0xf8db89e0  ! 4476: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_1_383:
	setx	0x41012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_384:
	setx	0x420200, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_200:
	mov	0xe, %r14
	.word 0xf0f38e80  ! 4479: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_1_385:
	setx	0x41033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 4481: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb351c000  ! 4484: RDPR_TL	<illegal instruction>
	.word 0xb5a4c9a0  ! 4485: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xb9a00040  ! 4487: FMOVd	fmovd	%f0, %f28
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb5a00520  ! 4492: FSQRTs	fsqrt	
	.word 0xb5a58920  ! 4494: FMULs	fmuls	%f22, %f0, %f26
cpu_intr_1_386:
	setx	0x400106, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda40840  ! 4499: FADDd	faddd	%f16, %f0, %f30
	.word 0xb00c4000  ! 4500: AND_R	and 	%r17, %r0, %r24
	.word 0xbfa448a0  ! 4501: FSUBs	fsubs	%f17, %f0, %f31
T1_asi_reg_rd_189:
	mov	0x3c7, %r14
	.word 0xfcdb8e80  ! 4505: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbe05c000  ! 4506: ADD_R	add 	%r23, %r0, %r31
	.word 0xbc954000  ! 4507: ORcc_R	orcc 	%r21, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_387:
	setx	0x400209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_388:
	setx	0x400027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_389:
	setx	0x420106, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_201:
	mov	0x5, %r14
	.word 0xf6f38e60  ! 4521: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb3a00520  ! 4523: FSQRTs	fsqrt	
cpu_intr_1_390:
	setx	0x43032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab0820  ! 4531: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbc34c000  ! 4538: SUBC_R	orn 	%r19, %r0, %r30
	.word 0xbbaa8820  ! 4539: FMOVG	fmovs	%fcc1, %f0, %f29
cpu_intr_1_391:
	setx	0x410106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 4542: FSQRTs	fsqrt	
	.word 0xb1a81c20  ! 4545: FMOVRGEZ	dis not found

cpu_intr_1_392:
	setx	0x430237, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_190:
	mov	0x3c4, %r14
	.word 0xfcdb89e0  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb3a00540  ! 4549: FSQRTd	fsqrt	
	.word 0xb5a4c820  ! 4553: FADDs	fadds	%f19, %f0, %f26
	.word 0xb1a00540  ! 4558: FSQRTd	fsqrt	
	.word 0xbba80c20  ! 4564: FMOVRLZ	dis not found

	.word 0xb1a81c20  ! 4567: FMOVRGEZ	dis not found

iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb1a81c20  ! 4574: FMOVRGEZ	dis not found

	.word 0xb5518000  ! 4578: RDPR_PSTATE	<illegal instruction>
T1_asi_reg_rd_191:
	mov	0x24, %r14
	.word 0xfcdb89e0  ! 4579: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_393:
	setx	0x41021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda408c0  ! 4584: FSUBd	fsubd	%f16, %f0, %f30
	.word 0xb7a48840  ! 4585: FADDd	faddd	%f18, %f0, %f58
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_394:
	setx	0x410008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 12)
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb5a00520  ! 4597: FSQRTs	fsqrt	
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_395:
	setx	0x420314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 4601: FSQRTd	fsqrt	
cpu_intr_1_396:
	setx	0x43010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 8)
	.word 0xb7ab4820  ! 4605: FMOVCC	fmovs	%fcc1, %f0, %f27
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_202:
	mov	0x19, %r14
	.word 0xfcf38e80  ! 4609: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_rd_192:
	mov	0x1a, %r14
	.word 0xfadb89e0  ! 4610: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_397:
	setx	0x460305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c8a0  ! 4617: FSUBs	fsubs	%f23, %f0, %f27
	.word 0xb9a81c20  ! 4620: FMOVRGEZ	dis not found

	.word 0xb8344000  ! 4621: ORN_R	orn 	%r17, %r0, %r28
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_398:
	setx	0x440232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb57c2401  ! 4632: MOVR_I	movre	%r16, 0x1, %r26
cpu_intr_1_399:
	setx	0x440300, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_203:
	mov	0xd, %r14
	.word 0xf6f38e60  ! 4634: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, a)
	.word 0xb9aa4820  ! 4636: FMOVNE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_193:
	mov	0x3c7, %r14
	.word 0xf4db84a0  ! 4638: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbfaac820  ! 4639: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_194:
	mov	0xa, %r14
	.word 0xfadb8e60  ! 4640: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_400:
	setx	0x44001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81820  ! 4642: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbfa81820  ! 4647: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbfa90820  ! 4649: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb40c4000  ! 4650: AND_R	and 	%r17, %r0, %r26
cpu_intr_1_401:
	setx	0x440132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a84820  ! 4652: FMOVE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_402:
	setx	0x46011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_403:
	setx	0x440236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_404:
	setx	0x44032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a98820  ! 4667: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_405:
	setx	0x460219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb1a80c20  ! 4672: FMOVRLZ	dis not found

	.word 0xbfa00520  ! 4673: FSQRTs	fsqrt	
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb37d2401  ! 4688: MOVR_I	movre	%r20, 0x1, %r25
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb5a00540  ! 4693: FSQRTd	fsqrt	
	.word 0xbba80820  ! 4696: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_204:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 4698: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_rd_195:
	mov	0x2c, %r14
	.word 0xf6db8e60  ! 4700: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_406:
	setx	0x47021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab8820  ! 4702: FMOVPOS	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a548a0  ! 4710: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xbba00560  ! 4714: FSQRTq	fsqrt	
	.word 0xbf2dc000  ! 4715: SLL_R	sll 	%r23, %r0, %r31
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_407:
	setx	0x45020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_408:
	setx	0x470132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_409:
	setx	0x470122, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_205:
	mov	0x2c, %r14
	.word 0xf0f38e60  ! 4728: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb7a80c20  ! 4730: FMOVRLZ	dis not found

iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 4)
	.word 0xb1a00020  ! 4736: FMOVs	fmovs	%f0, %f24
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 13)
	.word 0xbba94820  ! 4739: FMOVCS	fmovs	%fcc1, %f0, %f29
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 8)
	.word 0xb7a5c820  ! 4745: FADDs	fadds	%f23, %f0, %f27
	.word 0xb7a5c820  ! 4747: FADDs	fadds	%f23, %f0, %f27
	.word 0xb5ab4820  ! 4749: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb9a00540  ! 4751: FSQRTd	fsqrt	
cpu_intr_1_410:
	setx	0x44032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 11)
	.word 0xb1aa0820  ! 4756: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb7a4c8a0  ! 4758: FSUBs	fsubs	%f19, %f0, %f27
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 16)
	.word 0xb3ab4820  ! 4761: FMOVCC	fmovs	%fcc1, %f0, %f25
cpu_intr_1_411:
	setx	0x460221, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_206:
	mov	0x11, %r14
	.word 0xf8f384a0  ! 4768: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 35)
	.word 0xbfa81c20  ! 4775: FMOVRGEZ	dis not found

T1_asi_reg_rd_196:
	mov	0x16, %r14
	.word 0xfcdb8e80  ! 4778: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_wr_207:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 4780: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb7a8c820  ! 4781: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb5a548a0  ! 4785: FSUBs	fsubs	%f21, %f0, %f26
	.word 0xb62d4000  ! 4787: ANDN_R	andn 	%r21, %r0, %r27
	.word 0xbcb54000  ! 4793: ORNcc_R	orncc 	%r21, %r0, %r30
T1_asi_reg_rd_197:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 4794: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T1_asi_reg_rd_198:
	mov	0x15, %r14
	.word 0xfadb8e80  ! 4797: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_wr_208:
	mov	0x16, %r14
	.word 0xf2f389e0  ! 4798: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbda00520  ! 4802: FSQRTs	fsqrt	
	.word 0xb3a81420  ! 4803: FMOVRNZ	dis not found

	.word 0xbfa80820  ! 4806: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00520  ! 4811: FSQRTs	fsqrt	
	.word 0xb3508000  ! 4812: RDPR_TSTATE	<illegal instruction>
cpu_intr_1_412:
	setx	0x450034, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_209:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 4817: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7a00040  ! 4818: FMOVd	fmovd	%f0, %f58
	.word 0xb9a5c9e0  ! 4822: FDIVq	dis not found

	.word 0xbba5c9a0  ! 4823: FDIVs	fdivs	%f23, %f0, %f29
	.word 0xb01da1ae  ! 4824: XOR_I	xor 	%r22, 0x01ae, %r24
	.word 0xb7a00560  ! 4829: FSQRTq	fsqrt	
cpu_intr_1_413:
	setx	0x470319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_414:
	setx	0x460134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c9e0  ! 4838: FDIVq	dis not found

iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_415:
	setx	0x460202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 4848: FSQRTd	fsqrt	
T1_asi_reg_rd_199:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbda98820  ! 4859: FMOVNEG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_200:
	mov	0x3c0, %r14
	.word 0xf6db89e0  ! 4860: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb6b5a182  ! 4861: SUBCcc_I	orncc 	%r22, 0x0182, %r27
	.word 0xb9aa0820  ! 4862: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb1ab0820  ! 4863: FMOVGU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_416:
	setx	0x450216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_201:
	mov	0x30, %r14
	.word 0xf8db89e0  ! 4870: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0x8994a0d4  ! 4873: WRPR_TICK_I	wrpr	%r18, 0x00d4, %tick
	.word 0xbba94820  ! 4874: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a5c820  ! 4879: FADDs	fadds	%f23, %f0, %f24
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xbba5c860  ! 4888: FADDq	dis not found

	.word 0xbda00540  ! 4889: FSQRTd	fsqrt	
cpu_intr_1_417:
	setx	0x470210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab4820  ! 4891: FMOVCC	fmovs	%fcc1, %f0, %f31
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_210:
	mov	0x16, %r14
	.word 0xfcf38e40  ! 4900: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbda80c20  ! 4901: FMOVRLZ	dis not found

iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_202:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 4905: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbfa9c820  ! 4906: FMOVVS	fmovs	%fcc1, %f0, %f31
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb32ca001  ! 4910: SLL_I	sll 	%r18, 0x0001, %r25
T1_asi_reg_wr_211:
	mov	0x34, %r14
	.word 0xf4f38e40  ! 4914: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb4c48000  ! 4921: ADDCcc_R	addccc 	%r18, %r0, %r26
cpu_intr_1_418:
	setx	0x440135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 9)
	.word 0xb5520000  ! 4928: RDPR_PIL	<illegal instruction>
	.word 0xba9d203d  ! 4930: XORcc_I	xorcc 	%r20, 0x003d, %r29
cpu_intr_1_419:
	setx	0x47023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a50820  ! 4932: FADDs	fadds	%f20, %f0, %f27
	.word 0xb9aa0820  ! 4934: FMOVA	fmovs	%fcc1, %f0, %f28
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbc1cc000  ! 4942: XOR_R	xor 	%r19, %r0, %r30
T1_asi_reg_wr_212:
	mov	0x2b, %r14
	.word 0xf2f384a0  ! 4943: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbfa4c840  ! 4944: FADDd	faddd	%f50, %f0, %f62
cpu_intr_1_420:
	setx	0x47023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 4947: FMOVNEG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_421:
	setx	0x470305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 16)
	.word 0xb92de001  ! 4957: SLL_I	sll 	%r23, 0x0001, %r28
T1_asi_reg_wr_213:
	mov	0x1e, %r14
	.word 0xf2f38e40  ! 4958: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9a00560  ! 4960: FSQRTq	fsqrt	
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xbda54960  ! 4965: FMULq	dis not found

T1_asi_reg_rd_203:
	mov	0xd, %r14
	.word 0xfedb8e40  ! 4976: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_422:
	setx	0x440235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 15)
	.word 0xb5a50860  ! 4982: FADDq	dis not found

iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbe940000  ! 4984: ORcc_R	orcc 	%r16, %r0, %r31
	.word 0xb5a81420  ! 4986: FMOVRNZ	dis not found

iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 18)
	.word 0xbda548c0  ! 4988: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xbba80820  ! 4989: FMOVN	fmovs	%fcc1, %f0, %f29
iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_423:
	setx	0x47021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_424:
	setx	0x460214, %g1, %o0
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

	.xword	0x70c3c4f15e77de11
	.xword	0x2c926cf308575233
	.xword	0x32821196570717f1
	.xword	0x935c5151b4dbbbba
	.xword	0xa244c2845cdc3e86
	.xword	0xf3499ebbd444641c
	.xword	0x0fa026ff247764ec
	.xword	0xf5a85351ed27e1ab
	.xword	0x6a753ec6946a8e83
	.xword	0x77485617d6b91110
	.xword	0xf96766d21b151c8d
	.xword	0xc838cf7e641b9b6e
	.xword	0x809f0a2b496e9c87
	.xword	0x7dc82c21b6accad0
	.xword	0xc09fe1342cf1745e
	.xword	0xc0d15e39f0ccaab2
	.xword	0x297a0ac2b7d34b24
	.xword	0x7cbabeb7ab45fcdb
	.xword	0xadc3294a1f973090
	.xword	0xd76b53181c03f723
	.xword	0x8742afea070ee1cc
	.xword	0x7802e05824e80783
	.xword	0x8228a36be1a3df38
	.xword	0xc7bea67113ae6b38
	.xword	0x31f073f7b020f966
	.xword	0xe62c35093eccb66b
	.xword	0x9b37abbd22c57117
	.xword	0xd1700688ae45595d
	.xword	0x0f0eb8e0d20af9f2
	.xword	0xc694249dccc7d211
	.xword	0x3a27e05037b679e0
	.xword	0xee606bbc0db9692a
	.xword	0xfd87ccf2eaeff27f
	.xword	0xfc57cf8a298e66bd
	.xword	0x12394102379a8f45
	.xword	0xf61b85f678b06712
	.xword	0x9aca9aafbf9765ff
	.xword	0x7cbbf3f0ddd1afe4
	.xword	0x74fd411d84233773
	.xword	0x36568ac734d5c402
	.xword	0x9d9d31f394d5aae6
	.xword	0xcefacd97ababf250
	.xword	0x6f2500744c3e27f0
	.xword	0x22d8ac24a4aed5ac
	.xword	0x70168bfbfa2553cd
	.xword	0x29d951f194bee10d
	.xword	0xd09389bde717bcff
	.xword	0xeec83fbc34bfc575
	.xword	0x0c287c4e21b6f097
	.xword	0xf1c6bcce5433ab81
	.xword	0xb0b99d969c7e3240
	.xword	0x99cdf3b9e5886264
	.xword	0x072805fb261e6f43
	.xword	0x7e2df6b79f448e3b
	.xword	0x602d899f5eb878a1
	.xword	0x3af392bfcd7a8060
	.xword	0xe3c68856684f596d
	.xword	0xfc896a4421fc1f7d
	.xword	0x765e681caef26810
	.xword	0x1f14224f8d0105d4
	.xword	0xe00fb3a911eb77e5
	.xword	0xe4265789dec7cb0c
	.xword	0x4bdaa5ed5c716c49
	.xword	0x49baaf19dd43c838
	.xword	0xfd0ed35471f219fb
	.xword	0xd30df9b3b855a3be
	.xword	0x6e29a1fc02ee8f55
	.xword	0xf484c0f541dce19b
	.xword	0x067dab5347027c7f
	.xword	0x7269f456f8a1933c
	.xword	0x7bd57b9f0423e624
	.xword	0x528b18eb7bf133e0
	.xword	0xc0c8f9968beee07e
	.xword	0xde5897d839982dd7
	.xword	0xdb9d4355039b0000
	.xword	0x0499ba3e6e06a603
	.xword	0x446778d832b352b7
	.xword	0x1a8d1f5a7f1a004d
	.xword	0xc467e7fef58c6e4a
	.xword	0xb0822f5772ab84e8
	.xword	0x5722ee80c16f7410
	.xword	0x09882b5a6458a66d
	.xword	0x5553c0e14b18105c
	.xword	0xfb546bf8279206ae
	.xword	0x6c84e8b8e8b1019c
	.xword	0x94b1a1aecfa43512
	.xword	0x6bc0de7f2dcf9a34
	.xword	0x6997be36e3790eba
	.xword	0xaf94779384f6cd29
	.xword	0xaef8d5d43e4346d9
	.xword	0xbd50c2e9021a2dff
	.xword	0xc9922a7a645b06b7
	.xword	0xe19753d00ea782fd
	.xword	0x0c2992d55efb9249
	.xword	0xa5723cfc25b931cc
	.xword	0xc5b9b3821b6fa787
	.xword	0xf047a648ec8ea6fc
	.xword	0xd124cd585cbbc7e0
	.xword	0x2913f8f4536203b3
	.xword	0x031fbdf427c6bcb0
	.xword	0x199ae7a346cf0a2b
	.xword	0x0931242407897c10
	.xword	0x51a8ed6c5982f65e
	.xword	0x8c3f94340aba57d6
	.xword	0x7c91fc07fa4d4bbc
	.xword	0xe8853298553cf5ce
	.xword	0xa4cd1de3d78a8f9e
	.xword	0x7a64508361766c0c
	.xword	0x79c77ff867ce4323
	.xword	0x967bada1118d23de
	.xword	0x8e830cfa2b917f62
	.xword	0xdb01d65a11c273f1
	.xword	0x7142cc0167708341
	.xword	0x21b16083101e1d0b
	.xword	0xde4183143ac0570f
	.xword	0xf06b012254639e30
	.xword	0x1c8a86242fe73972
	.xword	0x9a306a89e9168aa3
	.xword	0xc15b300761e4a4d2
	.xword	0x878daa03f11d1cd7
	.xword	0x369850a6da994f54
	.xword	0x8fb400e58fb79fe5
	.xword	0x2d5a8e810a0d1ea1
	.xword	0x4fd3ff83f7b45e2c
	.xword	0x50fdd2194fa1aafb
	.xword	0xffb7b23a0c382fc6
	.xword	0xb8bea1e6db56c380
	.xword	0xfc2473471e94dd65
	.xword	0x535cd3eebbbeb3e0
	.xword	0x9840b97400c80c39
	.xword	0x9921321e89207911
	.xword	0x4f7f565577424fd1
	.xword	0x39ee195cfe44df17
	.xword	0x99573fc0abad5e2d
	.xword	0xf546ffe3f61a067a
	.xword	0x378ac28fb7e1eb1d
	.xword	0xde913487da4d9d3e
	.xword	0x03fbf4cb7cf1f294
	.xword	0x9fd7e653df35ced0
	.xword	0x6d3cfa8fb16e4523
	.xword	0xf639c7c187233db6
	.xword	0x5b286731e4657b57
	.xword	0x0c35d3d485c85b75
	.xword	0x4cba76f3135cd4a1
	.xword	0xc5215573f05f79f0
	.xword	0xf1d965bbe97f68ba
	.xword	0x631980feeb451f4b
	.xword	0x87154c0db9862a7e
	.xword	0x735a75d56cdea6d7
	.xword	0xa172c37511120bf3
	.xword	0x41f46fe21cb45474
	.xword	0xc912a6e38e590794
	.xword	0x05e14d25ce3a3ad8
	.xword	0x8ae7de7dbeedae34
	.xword	0x1178d509714da63e
	.xword	0x51c45e28e2d56d03
	.xword	0xd239af4968715715
	.xword	0x1408e5699ce2311c
	.xword	0xd2f0df2edc6e9cf9
	.xword	0xa6d13e22d0be6d9c
	.xword	0xb421e854d00f4fd0
	.xword	0x0578379cd7824124
	.xword	0x9d5f7fabaa8b8c6d
	.xword	0x991977176cde0111
	.xword	0x6169fac846e186f4
	.xword	0x10b9a959796b1d32
	.xword	0x98fd4a7210d56b1c
	.xword	0x52c7f0a4e8911ad4
	.xword	0xf263118245070146
	.xword	0x5b664eca5b5c8a6d
	.xword	0x7a7b5ccdb499432d
	.xword	0x3b9c7ad2cde442bb
	.xword	0xaec403323860b982
	.xword	0x74ef19ac44cc4149
	.xword	0x3f25525b262f5d7f
	.xword	0x70d9519ccc557bfe
	.xword	0x4311ba38ac13bceb
	.xword	0x6374135dc116665a
	.xword	0x687dcde299f1bdd3
	.xword	0xb3faf76cfb98d080
	.xword	0x41cf3b4ee122b890
	.xword	0xda28d700a2fd2eee
	.xword	0xb16c8ad54b33dc40
	.xword	0xbe545cbdcc0c4b8d
	.xword	0xaa0b567ca110f6d7
	.xword	0xa80df4aecfd28579
	.xword	0x0f2abb5c9fd8eba2
	.xword	0x293a9158b0f42bd7
	.xword	0xcab210c158ef224a
	.xword	0x898dacd3f20714a2
	.xword	0x0524d3cdc026d50b
	.xword	0x0bc265e1800d311c
	.xword	0xf8aafb4258d3b70a
	.xword	0x5bf68f19d24aef89
	.xword	0x233491a4ce79a9e1
	.xword	0xd8ba2fd7b63dae1d
	.xword	0xddf3f766348596cf
	.xword	0x26502dd2b06f455b
	.xword	0x3e6c2b2fa9b12451
	.xword	0xe2f68e6747af5898
	.xword	0x69b81b0950bd6507
	.xword	0xfa08b3aff76af942
	.xword	0x4f3e7ea05e3407e7
	.xword	0x1d5178a86f8b1d9a
	.xword	0xc8d2112c816055b4
	.xword	0x648f60beeb775807
	.xword	0x52e8226129b224ac
	.xword	0xf2893a2e9d5eea9d
	.xword	0x7df45531fe98652a
	.xword	0x316f9e2958fca9ce
	.xword	0x61f4fa6f99527de6
	.xword	0x93174a94e20e9504
	.xword	0x3801188c2f7bafa0
	.xword	0x6b442e95c9bd7ffb
	.xword	0x4c62b1f0431e350d
	.xword	0x31bfaa24c6564f74
	.xword	0x7fc33bf7b8a9fb84
	.xword	0x743303761e0bbcea
	.xword	0xf9915d28a0fdfc8a
	.xword	0xc72d2121ff0f60fd
	.xword	0xd85bbdd1fa2dcad2
	.xword	0x5ac25711880fb5d7
	.xword	0xedfb0146224dc1ed
	.xword	0x98ac59397c1ba067
	.xword	0x7e1646fba11b5f56
	.xword	0xc3d79539df0821c6
	.xword	0x114eed966c1076b6
	.xword	0x88465f116ee1c8db
	.xword	0xa0c547eedafaaafe
	.xword	0xd82429c46c036001
	.xword	0x4746286797c8a545
	.xword	0xbe664df82ad8f3a7
	.xword	0xafea840cc4c6e25c
	.xword	0x80baf0782a8cf5c0
	.xword	0xfc7ce8f5d1335bf2
	.xword	0xc1b3214936c0b67a
	.xword	0xd0c5adbcc90c271b
	.xword	0x6336722ae0085c1e
	.xword	0x924a69a743b9880e
	.xword	0x118eeffb5ab5d25c
	.xword	0xad6d8847dacce71b
	.xword	0xd9622da963f1b287
	.xword	0xbeff211007b93c14
	.xword	0x6409521efeae6394
	.xword	0xca1a572fd8ad1c9d
	.xword	0x3327f73be95b0191
	.xword	0x0a6b698cbdc1bffa
	.xword	0x0c4eaf4a8c6147f0
	.xword	0x153b7eb6ba2cf473
	.xword	0x3cc154309952cfaa
	.xword	0x570305e8e9ded9fe
	.xword	0x32fbdff18b73edf5
	.xword	0x58f0fdeb7465d15d
	.xword	0xc4f26fe153842ab0
	.xword	0x1a22d1dd5c4e55a9
	.xword	0x6dff04e092614d05
	.align 0x2000
	.data
data_start_1:

	.xword	0xf143c003bc1fd8a6
	.xword	0x6edc974130358b63
	.xword	0x3d12417db3378a1f
	.xword	0x66db7cba596a0f66
	.xword	0x67aea2f5ab554941
	.xword	0x26c17d0a275b1ed8
	.xword	0xbaf6232f688f2ec1
	.xword	0x4f230eb947ec88fc
	.xword	0xb3ea15ca991347ff
	.xword	0x128808d9d5eb6ffe
	.xword	0x269e496fb66f78dc
	.xword	0xbd37de4f1dc5794e
	.xword	0x84242587e6d41dba
	.xword	0xbfd4213a8a36136a
	.xword	0x672dee381ebf3a01
	.xword	0xd326c3910ed1f8fd
	.xword	0x66720172afa92463
	.xword	0x76da30b56d054047
	.xword	0x3428dffdc0c3a73e
	.xword	0x9f638182eacdd86b
	.xword	0x71429cd69b203dd5
	.xword	0xd47be98cba3e4a0c
	.xword	0xc361339f61233f7a
	.xword	0xa9d886fc42e6c3d1
	.xword	0x84d99a53370ec98d
	.xword	0xcd7c2457251eb75e
	.xword	0x71090ee60623695e
	.xword	0x73813ef3a6447e06
	.xword	0x30befee6d33f7060
	.xword	0x2cbbba7a89a6dcf7
	.xword	0x40710264de8375bd
	.xword	0x0c5b3f6040f3553c
	.xword	0xe13e3b5e72776d64
	.xword	0x5eb696808e2cc695
	.xword	0x0d001f2bfc5c604a
	.xword	0xcff6bb192766f0c7
	.xword	0x0ab3b23cb577cd2b
	.xword	0x200a16d9f9d2aeff
	.xword	0xf7c18c4c955d22c7
	.xword	0xd5bbf3084b88cf5d
	.xword	0x9d36d600d3d35a5f
	.xword	0x0857ff05d50400aa
	.xword	0x88105a9ca1ae63b0
	.xword	0x9ce1f0ec5dfe994d
	.xword	0xa0722619d9270da6
	.xword	0x3240d3735b0ea787
	.xword	0xebe57b780fd037c9
	.xword	0x47cb6c91fc743d82
	.xword	0x2ccb24a81ab6427c
	.xword	0xb7c09919e49e1a5e
	.xword	0xef9b60e9224dacff
	.xword	0xe82a808a571761c3
	.xword	0x43957c85cafaeeba
	.xword	0x0ecbc2589fe3e081
	.xword	0xf74769ad5eb68157
	.xword	0x9e0a28e392a08367
	.xword	0x762ecd214d9f94c9
	.xword	0x5b5edc0de446e309
	.xword	0xf9497ccf13a1bd45
	.xword	0xe48dd5b08945530c
	.xword	0xd6563acc9db32d63
	.xword	0xe566b650d055fedd
	.xword	0x2cc4c863e95c622d
	.xword	0x2097e118e1fde4ca
	.xword	0x938414f21ff00d85
	.xword	0xe300685247f63bc9
	.xword	0xc0ed00398b3c8fa7
	.xword	0xcb7a04a1633e282d
	.xword	0xc4a52d4693d4af8f
	.xword	0x4987188162e39d61
	.xword	0x3c853a5d06017c6e
	.xword	0x21e7bb26b10b9a6f
	.xword	0x9280ccd03050d6e8
	.xword	0x7aaeca0d5a8a0145
	.xword	0x63aa4cbda8a2b7b7
	.xword	0x4ba174f83dd0fd7a
	.xword	0xb2f8195cc95e41d3
	.xword	0x29aa12be9114db74
	.xword	0x5f73d7a29c517c7a
	.xword	0x97cd63d5d5fc864a
	.xword	0x7758564c2741e916
	.xword	0xbf555621b7947f92
	.xword	0x2ddecd58b28ceb2e
	.xword	0xbf025b6058b34084
	.xword	0x4b05f48c6b7a8d5d
	.xword	0x8916b8cf8c0ad4d8
	.xword	0xe79bad0e4ebd4a24
	.xword	0x3955fbf8fe7a9642
	.xword	0x15c4060a0f5d692f
	.xword	0x660b81b15fb665a2
	.xword	0x899e5635000e2110
	.xword	0x5255640ecd7e88c9
	.xword	0x775c07265be13766
	.xword	0x3876f220edb0e183
	.xword	0x0ee317fecfa7fde1
	.xword	0x9a83ebd441b3a0b7
	.xword	0xf968b0a8da381065
	.xword	0xf32fd075e5dbaedc
	.xword	0x30a09a91d1a808b3
	.xword	0xc3543eb1d6cd5632
	.xword	0x498ca17f7f131b54
	.xword	0x67da4f7d833224d6
	.xword	0x084231073aba1da0
	.xword	0x20283c0d5c4f3172
	.xword	0xc1179f7a909e2062
	.xword	0xf2416a453f919cb7
	.xword	0x2a515858759c1a20
	.xword	0xa43b63efa5c9b90a
	.xword	0x33f9ceb8174942d2
	.xword	0x4b8f46c5d90276f5
	.xword	0xb4d1e803f480387d
	.xword	0x694ff9f225ffb37d
	.xword	0x520159bd36c008f6
	.xword	0x7d237fad481c4779
	.xword	0xa2f3973244a01966
	.xword	0xc73687b09746bc1b
	.xword	0x19781f44abc41e50
	.xword	0xb89a54879ec51d79
	.xword	0xd7cc6436b2734748
	.xword	0x0f7d1d8a533de42b
	.xword	0x1143b95eeff79126
	.xword	0x2017c89a39de720b
	.xword	0x2976c8579d608de7
	.xword	0x7a95bd75b0da5abc
	.xword	0x9d5c7b94f7aa343e
	.xword	0x220d49065474d480
	.xword	0xa56cb2ecd5fadb62
	.xword	0xfa2c16d214c43011
	.xword	0xcb461bd4f4fa6637
	.xword	0x1a86e87c59b015bc
	.xword	0xcec93821bd9a97e9
	.xword	0x319acc69285ae311
	.xword	0x7ce7f8ba07cbc24f
	.xword	0x7604eafd9e2ce28b
	.xword	0xa3adf961e8fa056c
	.xword	0xe4dee69a66fe9ba6
	.xword	0xac6c2c534e46150c
	.xword	0xfe1055b15558b48f
	.xword	0x894b65531f082f3a
	.xword	0xf53da6c0f3eed705
	.xword	0xf14f45e232b657b1
	.xword	0x60f1df2ca90c3a5a
	.xword	0xc55f27b6febadbfd
	.xword	0xdfbb374065602aee
	.xword	0x609aa895f9aed887
	.xword	0x27de0e556f030737
	.xword	0x42fc3b1054f12aab
	.xword	0x60c1a2c2fd30550d
	.xword	0xe03ee52f21121b25
	.xword	0x1997583f48236d1e
	.xword	0x378547b0faabb584
	.xword	0xbfb1e0df846ae66a
	.xword	0xbb15436e8e763bd5
	.xword	0x78652bb3f099fab2
	.xword	0x1586794aafb3bf5a
	.xword	0x774fb0b0c74a33c1
	.xword	0xa877ef4daf386aad
	.xword	0x7130203d67ab1a71
	.xword	0x1757df9e5926abd5
	.xword	0x367bcd63f4dc89a2
	.xword	0x07b063f860674a7d
	.xword	0xe651894982324fd6
	.xword	0x5da7fd1cdce7bf61
	.xword	0xa0ab9788286fb477
	.xword	0x43e19c19bd4c46bb
	.xword	0x9db7859b6fc8e86a
	.xword	0x7d5e923af0e4fe31
	.xword	0x434bbb15c3908c72
	.xword	0x37195cf1e1d51d73
	.xword	0x24b777b42fa35cc5
	.xword	0xcea11f81874752cf
	.xword	0x57c1a9d3a0599c4e
	.xword	0xd42432f76f63311e
	.xword	0xa87166cce289b7fc
	.xword	0xc97bc272edd2a198
	.xword	0x21b7fe4d787857e0
	.xword	0x62bb0e5efc12d6d0
	.xword	0x87b39a1c37203e70
	.xword	0x07e97053a30c85d3
	.xword	0x81cdb70dad24dbab
	.xword	0xd87ee634df64db76
	.xword	0x5fc9f01ff426bf6e
	.xword	0x5b002475542f6d38
	.xword	0x2bc94e363afd7a58
	.xword	0xb194f8161ba13db5
	.xword	0xed224b39b370d7c0
	.xword	0xc05f1930d7558e11
	.xword	0x26935c3ff5e59025
	.xword	0xa59e00f1d59ace3f
	.xword	0x2572adbf3d58c379
	.xword	0x3730faa0200fa0a0
	.xword	0x800e829272f13c14
	.xword	0x9a4846e054d3008b
	.xword	0x8a44c5eefaa2ef27
	.xword	0x05d8f0b24e79af41
	.xword	0xc0a3f55f072c473c
	.xword	0xaaac0a826677a77f
	.xword	0xc9ec7a2b79150690
	.xword	0xc804540c54c65c11
	.xword	0xd3130294acc1de95
	.xword	0xcd69e377b72eabd0
	.xword	0x85303e08b4db492e
	.xword	0x7f4f8c90496a0c14
	.xword	0x73c34231f3f12733
	.xword	0xd935857d9255998c
	.xword	0x2452b8c5399d780f
	.xword	0x0acd74f3e6e24562
	.xword	0xfdb44872ccd4d8fe
	.xword	0x3a3712e259b43c9d
	.xword	0xe34a6eac45cd7892
	.xword	0xd5c80487c834a99c
	.xword	0xb5aa60c6f8838f3c
	.xword	0x780516c44fd26c44
	.xword	0x96f4dcfa9edc2ac0
	.xword	0x34c8b92e99451b8f
	.xword	0x92a0ba54b432d6d5
	.xword	0x94ca0aa9c476fbed
	.xword	0xfd30202d51accf3c
	.xword	0xbcb2e41376ed7b5b
	.xword	0xee119495158f73a4
	.xword	0x43457f5312a279e1
	.xword	0x224e1a88036fe349
	.xword	0x32661ce0acf8560d
	.xword	0xea4645af25ee55c4
	.xword	0xd63fe64447a83504
	.xword	0x8762784033f66628
	.xword	0x8116717487c25d8b
	.xword	0x765741e68adcab6e
	.xword	0x152e3f06f0cf3c14
	.xword	0x79393cf811f8123b
	.xword	0x7a83f3394f507c83
	.xword	0x69bf2bf67279dcd7
	.xword	0xa234cb4765bb27bd
	.xword	0x86853f1c1e2fb0fc
	.xword	0x739b1e16de0bbfd4
	.xword	0x6b5bb5178629c8a2
	.xword	0xd0c1ac03635352a9
	.xword	0x6e45dcb48b687be4
	.xword	0xb6bee56fa453d6e2
	.xword	0x4bbf02c2d15b7104
	.xword	0x55d65331c6525ba2
	.xword	0x9412027fa6fa34f1
	.xword	0x6aa9ed6ddf16425f
	.xword	0xedd90b09c180d14b
	.xword	0xd9ef3ef229fc290b
	.xword	0x96a7b2d6c97c90fe
	.xword	0x183f9a0fd639cd30
	.xword	0x9f38e9ae89d354c0
	.xword	0x7cac66248b1368a7
	.xword	0xa3d7419f6634b998
	.xword	0x35bd8684e70acd98
	.xword	0x968dd65f8345bae0
	.xword	0x6a08520e75a3e2d6
	.xword	0x97477f526294b895
	.xword	0x240b03705583df68
	.xword	0xde1cd319878616c1
	.align 0x4000
	.data
data_start_2:

	.xword	0x426da0f64d543e40
	.xword	0x3c04a0aa749f0b2f
	.xword	0x3c4d15a9df6a7c4c
	.xword	0x63961f0c44a65b1b
	.xword	0xa4c3877eb67bfab4
	.xword	0x0e2c9550ccfbe125
	.xword	0x04575df1b6622e23
	.xword	0xe3d6c58c681140dd
	.xword	0x183af3140c55ea9c
	.xword	0x5104bfd6bbb02e37
	.xword	0x55e5911fee641004
	.xword	0x2aaa7499036a2cae
	.xword	0x78840c8b488a08dc
	.xword	0x5cc3faad40080b8f
	.xword	0x40a8dbf7a2d7a3a5
	.xword	0xe97342e1ece446b7
	.xword	0xbfb5b69242471aeb
	.xword	0xdd8197901f436960
	.xword	0xed87b264fc8b89f6
	.xword	0x51055cfe66978227
	.xword	0x3b5e3301b58fe6e3
	.xword	0xfa7baf999aa9b390
	.xword	0x5e698bbc7a914d0c
	.xword	0x38daa6bde5e1c7a1
	.xword	0xcbcf4f9f5f67b3fd
	.xword	0x64b98fb412d5976e
	.xword	0x53f54dc40ee9e26f
	.xword	0xf08a6a25deb4eaa3
	.xword	0xac1797f18f6f9eb5
	.xword	0x87c0bb1e7dc10642
	.xword	0x825bfef82b3e0515
	.xword	0x5c4b380c435eea74
	.xword	0x62c8308599ccc441
	.xword	0xddb603020c11880f
	.xword	0x514b42bcbbb458f1
	.xword	0x1f92c9218b0aa1b4
	.xword	0xa68566b7fea150b0
	.xword	0xc8eb75a82540268f
	.xword	0x0c0c07ecd3918369
	.xword	0x78109d8c565daae7
	.xword	0x1c6f57d51ed13b21
	.xword	0x456600f27dfe0d6c
	.xword	0x2291422fdd88c6d1
	.xword	0xfda5e882ef2d699d
	.xword	0xbc3461bcb088fc26
	.xword	0x3fe660ab1eff77a8
	.xword	0x3e93136c0c42843f
	.xword	0xcd7090bd1e076c0d
	.xword	0x005a2745b85b3853
	.xword	0x1626bedfbba49cf8
	.xword	0xb78c5434ee590458
	.xword	0x32e1cd452b655124
	.xword	0x15316dc7c9cb7be5
	.xword	0x3dfea6a6899953e4
	.xword	0xe3e21dd88375a927
	.xword	0xebb32ddeb6017f47
	.xword	0x5cb30e646254f787
	.xword	0x51cf445665359442
	.xword	0x741312171ffaf83f
	.xword	0xf52b39041bc41216
	.xword	0xcfa93d159dc1c84b
	.xword	0xb394554e09651945
	.xword	0xba981d6bb953e105
	.xword	0x7859142bb26cbd5a
	.xword	0x936139ade48653cf
	.xword	0x9f79719200506e2c
	.xword	0x2f5c8463efbce5e8
	.xword	0x0e8b35a14e0f0caf
	.xword	0x1ab611eb6d47fbcb
	.xword	0x7d65cc2d7243383a
	.xword	0xf59485b48f3dec89
	.xword	0xfb81e82970a1b6a6
	.xword	0x225044a28c7acaa6
	.xword	0xbbb3bfdbd8877518
	.xword	0x8ce8750f858b21f7
	.xword	0x61d70bc02ac78dcd
	.xword	0x5b81e9927a1db023
	.xword	0x480366629b97bdae
	.xword	0xe6aa3b2aca73f732
	.xword	0xd86f275b2f28c598
	.xword	0xafc9ac7c99c0e2ca
	.xword	0x142a38e86d1d870a
	.xword	0x0637e55c709699e9
	.xword	0x292d2d3cace02ce9
	.xword	0xac19fa254f1f0da1
	.xword	0xd7e7b20515c9226a
	.xword	0x5655765dcafeef79
	.xword	0x99427d201d19cdde
	.xword	0xea547c85fa8a8b70
	.xword	0xb68346ece2114f0b
	.xword	0x3c57d4dcaf626c52
	.xword	0xf84ed857497c0320
	.xword	0xf406797adb4e891b
	.xword	0x8a8f64d252f3e563
	.xword	0x86458ffa6fa8cbf9
	.xword	0x9e9516f632e9cbe4
	.xword	0x0e73f31510de3e60
	.xword	0xc1200b95fd33d92b
	.xword	0xf6a71222660d960e
	.xword	0xf20d2ed89f3041df
	.xword	0x339599ed36cf8955
	.xword	0x08c1fc7d7f04b7fb
	.xword	0x3dc8a8abe00623a3
	.xword	0x798d11f820684f18
	.xword	0x59fd6fae60d164f0
	.xword	0xd5a9b812dcefdc63
	.xword	0xb8e89a35826431b1
	.xword	0xec6e301aa8ebbfa4
	.xword	0xa9dad2e22ddd3391
	.xword	0xeb1c27a9b06ae443
	.xword	0xfd7f2a20102e3a0d
	.xword	0x8d949e6a1e141c55
	.xword	0xb3ebb0cbeee05c90
	.xword	0xea92982a7b44071a
	.xword	0x707ba1c96044b657
	.xword	0x780528f6bd339e40
	.xword	0x55389c362ffd05e1
	.xword	0xd9f2ed7141dee563
	.xword	0x488654b33e11a48c
	.xword	0xf96f7ab7b1b04065
	.xword	0x86bd5821e731ebab
	.xword	0x7ad88988f29b7612
	.xword	0x81186d86083312d5
	.xword	0x0e8a0d60b441b5de
	.xword	0x22aaf1484453a802
	.xword	0xf7a7f116d736811e
	.xword	0x9c9469238f59801d
	.xword	0x1810991362edc23d
	.xword	0x61b41825a8ef51d5
	.xword	0x95e53b8f86daa955
	.xword	0x5963c8660310bc1a
	.xword	0x21a480ff6f43f9db
	.xword	0xc2ca7909ef4ba2bd
	.xword	0x6ba2bbb5fea6cfc9
	.xword	0x945c49e41127fa05
	.xword	0x9dd85e882414be6a
	.xword	0xf10c19299923a2bb
	.xword	0x760cf7ad5df2e41c
	.xword	0xc70e1576cb4ae567
	.xword	0x36d3f0e36e42067e
	.xword	0x36465f5d0f8fc11f
	.xword	0xeec398699422669e
	.xword	0x126db65fdf13445e
	.xword	0x3315d923a3432818
	.xword	0x2c8b25c575e52f93
	.xword	0xbea6ae472e3f8b3d
	.xword	0x9f86f0e588b66bee
	.xword	0x5bd84e8c871c3bed
	.xword	0x4822e1f33dd9c5b4
	.xword	0xb2cdee7f2565be13
	.xword	0xf61dd38e77a817f4
	.xword	0x603a52dd97720e3b
	.xword	0x491d9c3b32e5db06
	.xword	0x004b804ec6a02a4b
	.xword	0x9b17bb053f44265c
	.xword	0xda02be0631ed3b20
	.xword	0x4d1ae05d99ef000c
	.xword	0x84bdb711d9f7e41f
	.xword	0xbfd190c6b8c110b7
	.xword	0x6e296fc2c3102528
	.xword	0x76141a39ff131aea
	.xword	0xe4928df4d5980e0e
	.xword	0x8c98a4808b9e1c51
	.xword	0xa815a1b9d16c6e8f
	.xword	0xef329321c90d3926
	.xword	0x573cb5dc3941d2ab
	.xword	0x754efbf596cd5107
	.xword	0x5588d8fea2837ec3
	.xword	0xeb01a68063231af5
	.xword	0x8bb9f2bf554be284
	.xword	0x9ffffabc63b4e2bb
	.xword	0x7e8d584226c1bdc1
	.xword	0x54017e9645fcc66d
	.xword	0x0e389d9a61cf04b2
	.xword	0x3917efbbaa0f7213
	.xword	0x137183fa47954917
	.xword	0x66f466f9d4bd8a8a
	.xword	0x69168bfae4215557
	.xword	0xc15b22a30a7cbee1
	.xword	0xa86589af297d737b
	.xword	0x2a8f2ff95742356c
	.xword	0x6d7f295eda5c640a
	.xword	0xa8c6118297343a76
	.xword	0x6f2e10cd24ab0cb5
	.xword	0x9675692dd76b19ab
	.xword	0x0c81ce154550e025
	.xword	0xa07a18730d2eaa7f
	.xword	0x70f25c2bd1b04022
	.xword	0x26b6374990342843
	.xword	0x2183b4b1f914ec00
	.xword	0x830398ef058ec2ab
	.xword	0xad3f99e2d6d9fede
	.xword	0x7b3ee06d81159fb3
	.xword	0x1c1ddb01f9279639
	.xword	0x7da3552f137d9206
	.xword	0xb64cf8d81e6cee56
	.xword	0x3257d8f134cb85b1
	.xword	0xe9bc3e770d0900c7
	.xword	0xe1b705a3d5331bc4
	.xword	0xfc6a2936997c9469
	.xword	0x9a60f0f8309f1489
	.xword	0x0d785b20068bee94
	.xword	0xafbbfac0f6d16162
	.xword	0x44191369e4055f6d
	.xword	0xd9aae10350a57c21
	.xword	0x7db20a269c7de46c
	.xword	0x17d8bedcfdffa2c7
	.xword	0xc40faf5e0db45fb9
	.xword	0x558568487cddba2c
	.xword	0x367898fd32a90811
	.xword	0x52ef9b29475eb0ad
	.xword	0x70f8efd64cc5155d
	.xword	0xdbfaf8ca1c2ca101
	.xword	0xc5a562e5f11dc2ae
	.xword	0x77ffca056658b0c1
	.xword	0xe078be6219d1f1f6
	.xword	0x6fb2f6ad94b3648b
	.xword	0xdc897f2a64dcc23d
	.xword	0x9923ece64f0c27a6
	.xword	0xb59ad302b4519df0
	.xword	0x97a96ea343563d0e
	.xword	0x9f1e5d74285769e8
	.xword	0xfe14dc4da14d6ced
	.xword	0x24f25d389f9fe7a8
	.xword	0x0aa480031f1116b0
	.xword	0x3e363b6edd0bad8f
	.xword	0x91f05cd481ce30dd
	.xword	0xdb21c9e2e7d75109
	.xword	0xc0569ae78046c4db
	.xword	0x61e790b8c268c71d
	.xword	0xc729de17d38c36cb
	.xword	0x8fec07f6e596ab23
	.xword	0xc12f025a86dc782b
	.xword	0x835fc9dbd297dc6d
	.xword	0x4a116afaf308edea
	.xword	0x01cae72294f958cf
	.xword	0x9bcf9e12a6fa9eef
	.xword	0x591ad3b53bf071ef
	.xword	0xae28d310d8f2dd06
	.xword	0xccf7e188a356c70b
	.xword	0x2212340f1d178101
	.xword	0x0093ccdba9a62582
	.xword	0xe6edcba9a947770a
	.xword	0xae0be8981de51aee
	.xword	0x5104fedbaf077f84
	.xword	0x8220e8d95f5dfa65
	.xword	0xb53937614fd10a84
	.xword	0x33fe87b58e49f6d5
	.xword	0xafb974d7bb2fc2dc
	.xword	0xb54f8f22945ebee8
	.xword	0x521b50aa850f0c90
	.xword	0xd12088945addebbf
	.xword	0x7cb923027a8cedaa
	.xword	0xbd8e45285d026eb8
	.xword	0x18a8c98bb98d0c49
	.xword	0xabcafe00c164ebbb
	.align 0x8000
	.data
data_start_3:

	.xword	0xf45a7142b6329a8c
	.xword	0x7f4df5099ea47bad
	.xword	0x2324c4a8da47950a
	.xword	0x2b3b627ceea0729b
	.xword	0xc3421f42c0e9d3d5
	.xword	0x4d456a404ab71c4e
	.xword	0x2b53ada7c28e5a1f
	.xword	0x82e9a534e4917c09
	.xword	0xafafc26710f570bf
	.xword	0x3f03c2b5cdacc8e7
	.xword	0xf8334613d8e5d9c1
	.xword	0x2b744d2f8e6b6bf9
	.xword	0x2c15a296623bc48b
	.xword	0x89c7d33df5d74ad3
	.xword	0x0f8599cf4d3119a3
	.xword	0x7a4a0ee1d8ceb982
	.xword	0x1ae83afb021e3932
	.xword	0x6f5fb8024bd37195
	.xword	0x7ecf7ab65e4d9f5f
	.xword	0x6db0de6b729394ac
	.xword	0x783b86c1f30aac97
	.xword	0x4f4b61e2306c2927
	.xword	0xda06e56dfe30ebb8
	.xword	0x64e864b139733a3a
	.xword	0x657ed663a9aa21e3
	.xword	0xebde149f88c96d49
	.xword	0x3c7ca5d65c9182d1
	.xword	0xa7cdfa7909f919c0
	.xword	0x33b0eb646dfab542
	.xword	0xbd13227da58cfa9a
	.xword	0xb293a21e63dd771c
	.xword	0xe7a13a3fe62687b9
	.xword	0xc39500a08aa6e74e
	.xword	0x99b9c3ee1d14d4c6
	.xword	0x549bf4d1f96f9e63
	.xword	0xfcd5386ea3b981c3
	.xword	0x0e1fee648f231005
	.xword	0x810323eba88ec7f0
	.xword	0xb24ff0cad4a653dc
	.xword	0x65d2238bced33177
	.xword	0x0bde440ad0d6daee
	.xword	0x97a8d7aebde5dbc1
	.xword	0x12b458a99659f9c7
	.xword	0x0eb03ce646f5fdbc
	.xword	0x04a0676eb900cd44
	.xword	0x3cce29985517fec2
	.xword	0xcb2ac98631b4bf87
	.xword	0xda8470fc2ef0ba98
	.xword	0xaef4681dd7404001
	.xword	0xf1cfedb919ef9240
	.xword	0x4f252e0148cb5624
	.xword	0xd32ab1feb8bad6bb
	.xword	0x0afbe53850572142
	.xword	0xba4f7bb80998c18c
	.xword	0xe2263584322a7f01
	.xword	0xaf17a4c967358927
	.xword	0xc54b712e593929f8
	.xword	0x38f10a93d9dc83ec
	.xword	0x58e7982963e49990
	.xword	0x3aff46dec8957a4e
	.xword	0xb34041ffd03ff5b3
	.xword	0x43ab1f7be971e4ce
	.xword	0x4243b7f83ecf8f3a
	.xword	0x7bdb0a4ced38a417
	.xword	0x91aff7ce8a7d79b2
	.xword	0x59aadc75fbe06af3
	.xword	0x93ba3fb9d125cda7
	.xword	0xcd1a126746b55140
	.xword	0x43ab6ac6ae15ad10
	.xword	0x1e706fdfec757094
	.xword	0x443d1427ca8efdc5
	.xword	0x5d721839f588717d
	.xword	0x8f1f3adb6766177f
	.xword	0x38306986e5eeac5e
	.xword	0x40d66c42d92de26f
	.xword	0xd1396104c279348e
	.xword	0x2d38aa8c7dd38e0c
	.xword	0x1f5e0c4325c51da9
	.xword	0x05a3776b53231f97
	.xword	0x329b58a871ec7975
	.xword	0x69ed5a443b6c18ec
	.xword	0xb5aa7c3bd875d29b
	.xword	0xe9cab3ae44b00d50
	.xword	0x2269e0058acde76c
	.xword	0x7599cdfb151149e0
	.xword	0xf0dce43d23c84158
	.xword	0xa26f8df1ee8098e2
	.xword	0xd16f2b1c9bd7dbe0
	.xword	0xaa8e3317ffad3871
	.xword	0x568857a84036acd7
	.xword	0x658f73da0fc4062b
	.xword	0x7e8afa09a404d3d4
	.xword	0x08184583a0a2d877
	.xword	0x842480ee4f619c5d
	.xword	0x62998fafa9bbf4af
	.xword	0x75b05d4e0f995ada
	.xword	0xc5ba9cab86acbce8
	.xword	0x7d9e0dded495bb3b
	.xword	0x0ed3283c3ab6f6d9
	.xword	0x1710f3aa998ce0fe
	.xword	0x091ea977178d99e6
	.xword	0x3664be133f4a4798
	.xword	0xee220857f4fc291e
	.xword	0x3765111a0ea6663e
	.xword	0x572deba3b251d7aa
	.xword	0x57e6ed56a986df52
	.xword	0x05419f2718c9f955
	.xword	0x4e4fece0ea7c0450
	.xword	0xfca9f32e9d642320
	.xword	0x4a765c481bd2216a
	.xword	0x9b171b12d20b0b0a
	.xword	0x6c99f5e3174bad68
	.xword	0x377cb6751d557cc7
	.xword	0x6b97cd4f5930022e
	.xword	0x57e66f9f922c3d19
	.xword	0x563673d8b366632f
	.xword	0x78d8892afd45e78b
	.xword	0xf94247c6941b754d
	.xword	0x5d31206b25c3334b
	.xword	0xc1b2ad0cf8fa18d7
	.xword	0x0ae55567df64dd05
	.xword	0x73d1a20109391ff2
	.xword	0xe270dd78fb83dd9a
	.xword	0x1814d1d22f154262
	.xword	0xfa47e6927ad9c817
	.xword	0xaa3c52a75d812069
	.xword	0xcaf2328e23f644a2
	.xword	0x177f4f9cc026393f
	.xword	0xca8f92458b198de8
	.xword	0x5d317a3cebb6c77e
	.xword	0xc872d20875bbd443
	.xword	0xf3ab8bd110bc35bf
	.xword	0x77852e0918e2415e
	.xword	0x51fe377e8da8c7b2
	.xword	0xf3702ffb98c89207
	.xword	0x8bd15da647547ff9
	.xword	0x4904e71bdcfa8ab8
	.xword	0x4322ddc59fbe9682
	.xword	0x3e1c404a23e145bd
	.xword	0xa3d24028d1a25fb8
	.xword	0x1497fadb3ffce7a0
	.xword	0x87d753c601081bf4
	.xword	0x32214bad5061d0b9
	.xword	0x345b8e9ca86c8585
	.xword	0x11a100ae5f1a4af7
	.xword	0x5b17f257eebf975f
	.xword	0x080b51c92bf9045c
	.xword	0xed2e8e671f52700e
	.xword	0xdf3b0310c3f661c5
	.xword	0xf8a1126583de3467
	.xword	0x28a92955cdacacfa
	.xword	0x1bf4b804b7350dc8
	.xword	0x53b875726b883fd5
	.xword	0x2a97323debe8f24b
	.xword	0x36ed6acce768c3ee
	.xword	0x65636e061e607673
	.xword	0x10a3bc27fec664c7
	.xword	0xf4da3278bb137765
	.xword	0xcfa3125f73c22a9a
	.xword	0x98054508fcabe04e
	.xword	0x15f7ff4bdd9f0eb7
	.xword	0x0d240e263056bed1
	.xword	0xa79a68f0c502c112
	.xword	0xeded94ac3485d613
	.xword	0xcc2694385b097c01
	.xword	0x691fb30f4450af97
	.xword	0xfb7652e1510b4f8b
	.xword	0xac2e115bce7bce5d
	.xword	0xc2ac75398ab37bc1
	.xword	0x848339c88f1b7b82
	.xword	0x2fe4149284dbc6f2
	.xword	0x148fe64eb3dcc900
	.xword	0x8af94c29d0ed9eef
	.xword	0xd1fe1e9e84da3684
	.xword	0xe8519755829f5d8b
	.xword	0x0e343f3d6b88be26
	.xword	0x6bec071dd396e37e
	.xword	0xf5c4399dbea53847
	.xword	0xd70d5faf9b47018e
	.xword	0x54a28c201bdc42de
	.xword	0x039e9efd7718a12a
	.xword	0xac0641e5de4ccdb9
	.xword	0x5424d221ba8d4d92
	.xword	0x66a559a73157ffc0
	.xword	0x121389302215ff31
	.xword	0xa84562eac1a86994
	.xword	0xe9df00776c93d310
	.xword	0x4c4dd0d9540a56a2
	.xword	0x947bcbbef5b78329
	.xword	0xb5aba09d835ade97
	.xword	0x60cf230aec3d98c9
	.xword	0xfba26c19c64f6154
	.xword	0xef16fcbd28a7358f
	.xword	0xbe3b47ad94cc14d4
	.xword	0x0858318e963bc81e
	.xword	0xcb7a3d1791036a80
	.xword	0x38aaa0c4c18b3bff
	.xword	0x0aa39351cb58aadf
	.xword	0x216aed8e24cb1e60
	.xword	0xce9f6cd4c591a07a
	.xword	0x80cc6a4cb3c40cd7
	.xword	0xb43859482ea57aa3
	.xword	0x9e17fc4a46b08faa
	.xword	0x27550da2a1f42bdb
	.xword	0x15b31e489d5176a4
	.xword	0x6de5139e1ff64ffe
	.xword	0x5ac09ef54a4d4523
	.xword	0xf71b796962efca9f
	.xword	0x2de29a58eceeacab
	.xword	0x7b51e5ab2fd3a700
	.xword	0xb4db032688641799
	.xword	0x5cb8c6cbf3450920
	.xword	0x7556ed673b217198
	.xword	0x2c31e33cae22326f
	.xword	0x45a9ab4ce7fd6664
	.xword	0x1537705bc3039fd5
	.xword	0xa46587d5a0f8fdf4
	.xword	0x9fe7754c4e16a7b3
	.xword	0xad74208767f15a0c
	.xword	0x7e64d6d398c69f5f
	.xword	0x5453b1163299aad3
	.xword	0xd531128da33c2121
	.xword	0xbc2a4800324c45e1
	.xword	0xf5e5388047bd6b11
	.xword	0x49e1175ccb48625a
	.xword	0xf61476f9257e1dd4
	.xword	0x6121d9d940531878
	.xword	0xab4316e06f71a3ea
	.xword	0x3f177fe4b41646c8
	.xword	0x5fabad7de3af8a5c
	.xword	0xe09f2fc184edf44a
	.xword	0xcafb5f19bfbe35f3
	.xword	0xfd33cc74f8258cdc
	.xword	0xb146d0744f1ae50e
	.xword	0x5ea0923cf7fb3146
	.xword	0xed38d369c1c0751a
	.xword	0xf0ddcbc410eaecfa
	.xword	0x4a04370ee63b9f38
	.xword	0xe6259db071c3d07c
	.xword	0x1d805d33b4bf0cad
	.xword	0xcb62e3bce983a09c
	.xword	0x0cc75195638029b1
	.xword	0x8a3f723187d84247
	.xword	0xdfce2bfab5262492
	.xword	0x7cddc5d41a7df045
	.xword	0x19566e6510dfcce1
	.xword	0x2a937cec9b724142
	.xword	0xf9456fe82a98c973
	.xword	0x1fd3b2a10902288a
	.xword	0x378cac4149a21c92
	.xword	0xd53c0e9deae9ee5b
	.xword	0xeca7b8cdc4d41334
	.xword	0x5a81356bc4bfddd2
	.xword	0xd4d52915514ebe7e
	.xword	0x0443950b33df07c6
	.xword	0x7f301e6eab4db0fa
	.align 0x10000
	.data
data_start_4:

	.xword	0xba3fbea7e2fb9be5
	.xword	0x4a264b769316d7e0
	.xword	0xa7868a7c94864d52
	.xword	0x802c1c5b2667d80e
	.xword	0x86d7b04e47547655
	.xword	0xb3fd78029b79d993
	.xword	0x712a4fa6df0b5af8
	.xword	0xd9daee2661c897ea
	.xword	0x8cee0951da2db7da
	.xword	0xeee4056ba00d536f
	.xword	0x0e170d9e42c8273c
	.xword	0xa5239c992bd0005e
	.xword	0x33cf4847f8b24ea4
	.xword	0xf574ea2e28406d18
	.xword	0x7ce38b7ef9457c78
	.xword	0x3a361710c911b22a
	.xword	0xf24d69dfe1d19fc4
	.xword	0xa6a5448057ae6167
	.xword	0x2d00b8c58950f273
	.xword	0xa2d8baffc256fb9a
	.xword	0xeff058bf6541334b
	.xword	0xae48695ed22ca385
	.xword	0x32688c1dc5cebf41
	.xword	0x214ce890f60d70c6
	.xword	0x7eda18dc8ec4e979
	.xword	0xc75052b2819ad416
	.xword	0x5a68a4384bca524d
	.xword	0xe7a1dd5dd01ca84d
	.xword	0x7e4c01a31dae97bc
	.xword	0x17b512aaf6cba35b
	.xword	0x81b373034f7225b6
	.xword	0xd37fbd348b461b21
	.xword	0x1ec998ff4666612c
	.xword	0x002255ee96b8287c
	.xword	0x2fdf8a3eda859031
	.xword	0x9d9ef0524382ffa1
	.xword	0xfbb22085a1e597a5
	.xword	0x1872586ee53dce6a
	.xword	0x29fd4f3e3ca3e99d
	.xword	0x2188c9e36905d571
	.xword	0xca4cfa648b79dc9a
	.xword	0x0c89f1e4c9a136ed
	.xword	0x8b6977d3621522c6
	.xword	0xbb77c0576638f3a6
	.xword	0x0777f6beb054be27
	.xword	0x42257accbdda08cd
	.xword	0xc78cd3b93fc587db
	.xword	0x74dedb11439d1798
	.xword	0xb8d5ef06e69da0f5
	.xword	0x45013fc4c75de1e8
	.xword	0xddc6743c4a97e34a
	.xword	0x96cc53bbe3a88aae
	.xword	0x32fe9060c0c53b0c
	.xword	0x95dafe18f37b994f
	.xword	0xabf794d24d403a02
	.xword	0xfc0e58b98a26c3af
	.xword	0x303b4d6d7601caf0
	.xword	0x005ba5c61c5adbe8
	.xword	0x0063ca9c02858127
	.xword	0xc4c125d5a16f7b39
	.xword	0x93c1d9528333a4c2
	.xword	0x1e73e70d92c08e16
	.xword	0xff7ccba958075be2
	.xword	0x71232ade7a2b46d7
	.xword	0xc4722513e4fd0aa0
	.xword	0xe67ca5fc00a26228
	.xword	0xaaa57c1d7cff050c
	.xword	0x249c703840aff119
	.xword	0xa3aa1f92f98c1d4f
	.xword	0x7ea4147c3346414e
	.xword	0x36d349e34b948f04
	.xword	0x0d5c2707681c737c
	.xword	0xe5f76c6ae5d0b576
	.xword	0x814c3252d29077ab
	.xword	0xaf8789fd43c547be
	.xword	0x6d373c443ea99379
	.xword	0x46caaa1aaa61d64a
	.xword	0x0c63648bf0899399
	.xword	0x870c668b03998497
	.xword	0x0f07d559599a23b6
	.xword	0x2a8b13fd5e7c5c3c
	.xword	0x4039f2c1892f5ec4
	.xword	0x2d7490d9eb32f8c4
	.xword	0x086b856256ee5988
	.xword	0xf00ca2e1337013bd
	.xword	0xc7905397632cd97a
	.xword	0x8823e0f8d8a8a726
	.xword	0xd99c9ae466dd0e37
	.xword	0x7f0bef3d4e4afb11
	.xword	0xce2bf561d84e959c
	.xword	0x105f7a4737517f4d
	.xword	0x9f4181643f456cd8
	.xword	0x9f88b79cd2d16665
	.xword	0x8efce8619bcd16f3
	.xword	0x3e34ed5c9519ef96
	.xword	0x7c6011df049b07e1
	.xword	0x9d2545c7730b4013
	.xword	0x056af17298f24a6b
	.xword	0x3bc78c22b5053064
	.xword	0x4b90028929fe8665
	.xword	0x7bb2a510d570651a
	.xword	0x59144337d241484f
	.xword	0x28ad51672a1b66aa
	.xword	0x3379a393e11e3c68
	.xword	0x343091a35df5c5ca
	.xword	0xe426b2b434fa4489
	.xword	0x0ec19ef93e27512a
	.xword	0x6b61775725a92724
	.xword	0x0bc007d95ae16a80
	.xword	0xd75649edd05c7331
	.xword	0xb8afbf59a47e1b9a
	.xword	0xab4eb86040f67c0d
	.xword	0xa5fe6920961441d5
	.xword	0xebf1a48ddf341efc
	.xword	0x90e78439c8a01e7a
	.xword	0x2a342480982974e0
	.xword	0xc9207a5a7f631363
	.xword	0x4364b43dc5fca8c7
	.xword	0x313300399317be9d
	.xword	0xffaaeeef7b6ba79e
	.xword	0xb2f72a6c3b5e0c53
	.xword	0x5ac2bd89c21f84f7
	.xword	0x750b559e2bfbe530
	.xword	0xefe25ec234cee7c1
	.xword	0x124dc4bf89158a23
	.xword	0x270bad52096fbe04
	.xword	0x252ae2cb2aa2e603
	.xword	0x06b89615c9f670d8
	.xword	0x54839928287b2de7
	.xword	0x839ae5c686ca4d59
	.xword	0x7de24eeecd4a12a8
	.xword	0x3da90ad16abe3206
	.xword	0xd77cffa4537be674
	.xword	0x2af2b0f0a672b51c
	.xword	0x8ae69c29a57050a7
	.xword	0x9eadbe5d3916889f
	.xword	0x0bf6b88892ecee11
	.xword	0xc36e8ee4c4c26a08
	.xword	0x29cb6edf6a1a4138
	.xword	0xe999556eeeb35348
	.xword	0x59f9bc4f97e9ec31
	.xword	0x13abfd397b07699f
	.xword	0x621840c5859d912c
	.xword	0xa12826d92e046fa9
	.xword	0x6b1af15ea2306d1f
	.xword	0x6a2920e498ed9320
	.xword	0x25ac70bdec361164
	.xword	0xf58d53583a84d761
	.xword	0xa56ec6bf3a2a88f4
	.xword	0x547790e78e9a15cc
	.xword	0x9a56f7a7bb94527b
	.xword	0xbad0168e6101391f
	.xword	0x4593dc02b8030378
	.xword	0xb0fe92efd3f92779
	.xword	0x0f7571fc29f170d3
	.xword	0x2b69af2ce8f797fd
	.xword	0xce1c46b79dbfa324
	.xword	0xf185eaf00c1a94da
	.xword	0xd3c8f51d22ab7c90
	.xword	0xfada5d96a3a0c5dd
	.xword	0xf8cbfcc854341ea5
	.xword	0x04a08517ef46f5e3
	.xword	0xd78c560f398b7686
	.xword	0x9517234fb993dd92
	.xword	0xd646ce6387f8775f
	.xword	0xad31bc7d018b7b04
	.xword	0x8c3c8338dec8b11a
	.xword	0xfe91704f5dc00f47
	.xword	0x1b68731274940fe3
	.xword	0x0cfcb73e729d5b52
	.xword	0x2730bc2940bff7d3
	.xword	0x202014b06e271a8d
	.xword	0xa1a83ca3553bdb94
	.xword	0x34fe00b97ee2e6cc
	.xword	0x3d1c616cd6235297
	.xword	0x9f4ae5bce55f3923
	.xword	0xf172547cde60422a
	.xword	0x289df9c2718ea022
	.xword	0x15d9c53ecdb82306
	.xword	0x08e600db0a52e0b2
	.xword	0xb06114912809e881
	.xword	0xf39ef1cfd1ee2c84
	.xword	0x6d9984f0ec6940f0
	.xword	0xd98f7175d4572e4e
	.xword	0xf6d63f88904e317a
	.xword	0x3ac6bde011853ebb
	.xword	0xf65c189c89093213
	.xword	0xfa0645184507486b
	.xword	0xbcc6335cdaf0061f
	.xword	0x8d3e5fd1589fd944
	.xword	0xa9e01468d1c747db
	.xword	0x24f2f0ac969697cc
	.xword	0x540354d593151daf
	.xword	0x10a4c386ea57e8ab
	.xword	0xb0ca3869aba426ea
	.xword	0xdc3b3f047e0f5456
	.xword	0x4d2bd1847f7df941
	.xword	0x62b5c48fa5e42fc1
	.xword	0x507fdca1c063ca87
	.xword	0x800af35c4cb416bf
	.xword	0x8ad1eba7793ce587
	.xword	0xee28028b7d94b7d9
	.xword	0x42705502b94b408a
	.xword	0x78343d1949aa8f06
	.xword	0x685d0a82a7fbab2c
	.xword	0xcae2da882837f9dc
	.xword	0x294646e9b87ad844
	.xword	0xe89e14b9ba39be12
	.xword	0xebe73d40f30d3c8e
	.xword	0x7e2305fb92bf6501
	.xword	0x000626c9be0496b4
	.xword	0xad7b684b1ef59994
	.xword	0x870403e4c46c14fc
	.xword	0xdb85dda675fb33a5
	.xword	0xbb40604d41ea677a
	.xword	0x1be8aa4d75729a0c
	.xword	0x5a4c3e2877a759b0
	.xword	0x6cfcc04c7d3bf56b
	.xword	0x0f281db5178c41d8
	.xword	0x70580ab99384486d
	.xword	0x2e336f9abd207195
	.xword	0x7b2a63c878f0a97e
	.xword	0x4724f869491fb806
	.xword	0xd454a63ee5092675
	.xword	0xace5e24322cc37cf
	.xword	0x6a95d5446b7f1122
	.xword	0x339ae596831dc91d
	.xword	0x6937eaa45ca6db35
	.xword	0xac34752cbc60395f
	.xword	0x9170fd5daa2d3e2c
	.xword	0x683be89e038c2432
	.xword	0x5ceaa1d4651d6547
	.xword	0x05d2ac54dcad583d
	.xword	0x11318848c31b0eb3
	.xword	0x914fc2807b980756
	.xword	0x1e98209e1644fe00
	.xword	0xe94029a94026f289
	.xword	0xda3ba7dd14ded494
	.xword	0x4621a07b34f5bf84
	.xword	0x1205745974f52090
	.xword	0xdda4c0c04c84d5b0
	.xword	0x295700cb5b339994
	.xword	0x647f7b212036b2a2
	.xword	0xeec5011c1f64c1ef
	.xword	0xd2308d93e9325dd3
	.xword	0xca4dea7c5fb109d0
	.xword	0xdd364ed504e1c8c5
	.xword	0x83669d7b258d85b0
	.xword	0x2e0aeafaa33916fa
	.xword	0x20441352affc5205
	.xword	0xa2dc4c70a86434ca
	.xword	0xc404c8a6cfcd128c
	.xword	0x54aa70ef95f16af3
	.xword	0x6acbe527a6061c74
	.xword	0x4b7d4ffc47365ad5
	.xword	0xd32ae9711967610c
	.align 0x20000
	.data
data_start_5:

	.xword	0x78870ec19f05d950
	.xword	0x7314b75400cf4598
	.xword	0x24f6f4edeaee45a3
	.xword	0xda8f20752b7e547d
	.xword	0x2b901534083eec47
	.xword	0x99e56c4cb5308ae8
	.xword	0x7607033bf96fe907
	.xword	0xd4dc1094f9078bac
	.xword	0xe7c8e686d4f7b789
	.xword	0xd338a035ee661ca7
	.xword	0xfc577ef9f07877bf
	.xword	0xb91db13153339786
	.xword	0xe52b1a3675b1be2e
	.xword	0x8109a65f0611e06c
	.xword	0x54b4cda0bc943937
	.xword	0xea3323ca6b22fa36
	.xword	0x2edd6703e8386be5
	.xword	0x50000f95aedf794a
	.xword	0xc41a9135f655be67
	.xword	0xbb1738a12f3ab9a6
	.xword	0x1f438bc9c69c161d
	.xword	0xf7bbd847edfe7772
	.xword	0x4f36ac21ac8d9f2f
	.xword	0x1ec7f7c1a25deda9
	.xword	0x37c206b4a9cf1ef3
	.xword	0x484a51e8a73e13c6
	.xword	0x99a8d2f46f7eea5b
	.xword	0x1c1ace04213748fb
	.xword	0x977c7ae83ab0f3cc
	.xword	0x5c42c60784c3e696
	.xword	0x33a84431b94302ab
	.xword	0xf8258d975464664e
	.xword	0x35c2b0d4eab794e1
	.xword	0xd7c06428d5c13dbe
	.xword	0x3ce262c53fba3290
	.xword	0x2d41b31f1c3ac903
	.xword	0x1f01901baf70290e
	.xword	0xfe45fa808977cdfe
	.xword	0x87c8c86985d97711
	.xword	0xb2e60a05a8987645
	.xword	0x52b4a713112cc5a5
	.xword	0x8d09c995521afd1f
	.xword	0x20307167657a98ea
	.xword	0x362814c1016940e0
	.xword	0x3fc0c8c906a9c4bd
	.xword	0x7f9bb4cb8f8037a4
	.xword	0xb2754257039661c9
	.xword	0x905ef2c005655e2b
	.xword	0x6422ab3331293229
	.xword	0x254059a0e4752144
	.xword	0x79a5ecb72b81dfe3
	.xword	0x1f64b205a9f9c648
	.xword	0x6efce3c1f049b632
	.xword	0x183f50d332ea7def
	.xword	0x87786b51bb0e8bca
	.xword	0x834fc93f1e4b05e7
	.xword	0xdce0b045fce5d7b7
	.xword	0xb337508f4b0f4afb
	.xword	0x75f762f97a5b0497
	.xword	0xdbb4c000f6eb7c60
	.xword	0x554e2e56a7a7ba5c
	.xword	0x623a6aa2ef38130e
	.xword	0xbbad293a3c9e1b84
	.xword	0xd82d4b45361dcdc9
	.xword	0x6663110060b806ab
	.xword	0x46b748fa79d52179
	.xword	0xe59e193181c54f30
	.xword	0x42412b6020417929
	.xword	0x7baa59aaf9a32bdd
	.xword	0x7aaa5d1d974c26ad
	.xword	0x0070693bfe6f6ae9
	.xword	0xc5e707f65e0d45ca
	.xword	0x79ff2654478a7ddb
	.xword	0xbf7e7c430314ce86
	.xword	0x165480ae109b5cef
	.xword	0x098aa533d930f752
	.xword	0xd5de7285cfeea230
	.xword	0x38572da549eca46e
	.xword	0x52cb2f26ae79441f
	.xword	0x5d86726f0b76653e
	.xword	0x1e6f1da912027009
	.xword	0xa53bffbc674d1afe
	.xword	0x6a8370abf1a245ec
	.xword	0x22d37c5beb12a9ec
	.xword	0x610815aabe9c0e1f
	.xword	0x3149cb9e2db5cc09
	.xword	0x88a2eb2889311534
	.xword	0xe3bf68fa9dee75bb
	.xword	0x766aa59980f8931e
	.xword	0x050c6b6ba6125630
	.xword	0x5a91b1ed51335627
	.xword	0xfd6fa7f2fedbc17b
	.xword	0x62149983f3feb661
	.xword	0xe27114986404e570
	.xword	0xe506f34616ca23f8
	.xword	0x1458d746d30a1e79
	.xword	0x911e7ee8cc43a4e0
	.xword	0x9101e34c23c5d166
	.xword	0xbcac9c907dd3997c
	.xword	0xe7741b0766b8e7d1
	.xword	0x7ba5a08077dced83
	.xword	0x147cc653a8358700
	.xword	0xccca42b225ff9d0f
	.xword	0x9d6e720d15a0eca7
	.xword	0x2b8a4fe32e76f82b
	.xword	0x9baf4b7747efd519
	.xword	0x00e38f131e4936df
	.xword	0x059fa9e183031510
	.xword	0xb168b4a002d30357
	.xword	0x2d41d7bde0810f05
	.xword	0x0c5bf4ffbd5fe868
	.xword	0x7154d910dd950033
	.xword	0xdad8388984098dba
	.xword	0xd30f1a8c46000df2
	.xword	0x942936be47eb3e1e
	.xword	0xa13d69f1a6be7c4c
	.xword	0xcc4249363ba99cba
	.xword	0xb7b1a358880e3d82
	.xword	0x1313cff226e58b8c
	.xword	0xb7c22a02a6454123
	.xword	0x41a53b321ce74a87
	.xword	0x4fd44160a615c3fd
	.xword	0x078d2d8175afcdcb
	.xword	0x1f80d933f4f6ff60
	.xword	0xee7c6af0a9f6b727
	.xword	0x076208c1046b6844
	.xword	0xb16eeb32845fdb0c
	.xword	0x95b56fcf8a8d3ea7
	.xword	0x03368509965bcac1
	.xword	0x8ab059cf981f30d8
	.xword	0xea45169336a71cd4
	.xword	0x44eba62cb6cc256f
	.xword	0xeaf24d8739819cc2
	.xword	0x5c9f9ef20a018e70
	.xword	0x2d4aa977dd0be011
	.xword	0xd1ecccdc851b8eba
	.xword	0x248a61d9f2f93327
	.xword	0xcb4273d9932a4065
	.xword	0x2941fdc456689320
	.xword	0x89e741dddcd86057
	.xword	0x2069887b76e1ae7d
	.xword	0x59114c24fd86d573
	.xword	0x5d253cab61822d5e
	.xword	0x863c08f689834e4f
	.xword	0x6b1c897a73fc4e20
	.xword	0x1c523b325febf732
	.xword	0x9833f7e1e633dec9
	.xword	0x127d6621579bbaf6
	.xword	0xe1c8b06d77d17888
	.xword	0xba1012409597a7a4
	.xword	0x82714e4bdc01d5d4
	.xword	0x4dc745a61985f1ad
	.xword	0xdc183952238b05ce
	.xword	0xae69145d61736dc2
	.xword	0x91a9a8b53e6038f3
	.xword	0x50463cdf8335b754
	.xword	0x4d91a30a977690a8
	.xword	0x4c5719686c6f5577
	.xword	0x61710d33e8b7fbb4
	.xword	0xb62bf2a33a32fc96
	.xword	0xca585ea1c4e2c9e3
	.xword	0x1e94c2e3e5e18b7b
	.xword	0xeba57ff21eec029b
	.xword	0x704870717bd50e6b
	.xword	0x159abe4350f67d59
	.xword	0x439349d9f39e172e
	.xword	0xa213f791562f74d3
	.xword	0x41710d5f98d542d9
	.xword	0x77ba093654894917
	.xword	0xdf3b7ea2ecb98227
	.xword	0xe6ad6427eed859b9
	.xword	0x15e4c37926d3b14b
	.xword	0xe34d3f8698d8859b
	.xword	0x47233b7d170a3fa2
	.xword	0xa521f39bac9d084b
	.xword	0x2c599112bba1bd14
	.xword	0x72b2bf43766ee153
	.xword	0x5ae76829356201fc
	.xword	0xa7f4cbaae271ccae
	.xword	0xd6de3f719068e3dd
	.xword	0xfc3c6487fbef4ced
	.xword	0x6a2854570baa00a8
	.xword	0xaf83bca2d489a7fa
	.xword	0x14dc2998b9615f8d
	.xword	0xb275a26b7edfb2b3
	.xword	0xc60c3efa40c9cc4b
	.xword	0x77cdc6b5f5f20cbf
	.xword	0x6ee813eb8b72597d
	.xword	0xbe249daa63f99016
	.xword	0x0c982d53c9212673
	.xword	0xb8347b95a5e75643
	.xword	0x6aea36b44c33a389
	.xword	0x719289ac213a275c
	.xword	0x86634bce49e8da45
	.xword	0xcda806088480bf8e
	.xword	0x0bc2e82bf2cc07c0
	.xword	0xd1105310f8213660
	.xword	0xdcd9e9933c65151d
	.xword	0x49a6bc2b38e11c3a
	.xword	0xa400b04459ce65e5
	.xword	0x78bbd5b556fef5d5
	.xword	0x8042c51ab8253cef
	.xword	0xd40721a487b67290
	.xword	0x37bce66712fdf0fe
	.xword	0xe4cda0c8f33e4d0a
	.xword	0x85bf679937a9f150
	.xword	0x6d583a8f84f9e68d
	.xword	0xa8833e70bc709e21
	.xword	0x0cf5b2488eb025e2
	.xword	0x7c7d982e2c133023
	.xword	0x75cb787fededd544
	.xword	0x2847bef6403a43ff
	.xword	0x355e7391714a9d7e
	.xword	0xa2ac4897f2499d5a
	.xword	0xd74775f98c5f20cb
	.xword	0xe0a05676ff6b5729
	.xword	0x6621310f605ffb8c
	.xword	0x6ce842a32aa7224b
	.xword	0x603d08a9873c7352
	.xword	0x9d7b8f925d12148b
	.xword	0xcfe6f353560230f1
	.xword	0xd857e727181237dc
	.xword	0x01b240fe869df476
	.xword	0x2774af1450a4161e
	.xword	0x90a639450978a218
	.xword	0xc764d08fb4d61dfd
	.xword	0xfcb0a254c9b6a21d
	.xword	0x0889e9d9991c9e2d
	.xword	0x505ddf166c1915cc
	.xword	0x577bbf32de0617ae
	.xword	0xe9d6327afc249191
	.xword	0x9994482d8bb60e76
	.xword	0xfb27be7e8ccfe277
	.xword	0xa3ebbbe432045e5d
	.xword	0xe0846e7422fe6968
	.xword	0xa5b73c794935cf79
	.xword	0x30276483546163ef
	.xword	0x03022231816fcb94
	.xword	0xd580a7c8c52824b8
	.xword	0xabce4db5762eb40d
	.xword	0x2bea9c6fcf37d504
	.xword	0xb567428ae0b0c482
	.xword	0xf083314687827ff1
	.xword	0x3f429746264923da
	.xword	0xcfb5bd5835a87d3b
	.xword	0x9ca94b01fc24e31e
	.xword	0x2549a97a84160a72
	.xword	0x2aaa1e5733a20bcd
	.xword	0x1710435ccbdfc331
	.xword	0xc6381926dddbcd2c
	.xword	0xc361606949c25dc6
	.xword	0x0bdd2a86b3424ffa
	.xword	0x1e1c6797765a4be3
	.xword	0xc468bb87ef20162e
	.xword	0xb36c3dac9b6804b7
	.xword	0x53297aa96db4aed4
	.align 0x40000
	.data
data_start_6:

	.xword	0xf5d701e2b2e61ce7
	.xword	0x0f63d958c24479e7
	.xword	0x6a2f6cf11b0eaaeb
	.xword	0xb205ea064763fc9d
	.xword	0x843d8a6ac4733023
	.xword	0x4b825a7e5070b597
	.xword	0xf77858b1f4239a18
	.xword	0x05c7aac318181eff
	.xword	0x264603ef29394059
	.xword	0x1528e048785c3278
	.xword	0x4fc218fda1ce7943
	.xword	0x961fe168d048d8b2
	.xword	0x8ffad3003ed99cc2
	.xword	0xf34849750a26f208
	.xword	0xd5502772feaf4568
	.xword	0xb7a5be871e1f95dd
	.xword	0x22dff791ef3d7bcd
	.xword	0xf48054ddc508bd84
	.xword	0x77771a6ae557948a
	.xword	0x0f20ad56feebb363
	.xword	0x4384eafa6de9d038
	.xword	0x24227fbc1f62bfdd
	.xword	0xddf5cfb83b6c8acb
	.xword	0xe6349664e784e52f
	.xword	0x4845b4a9773d14e7
	.xword	0xec9a0113f93ba560
	.xword	0xbccb333a40a76966
	.xword	0xea5ef5236bb81061
	.xword	0xd0415ea961001635
	.xword	0xa27cebda5d4d12ff
	.xword	0xd3ab4239656e6d49
	.xword	0x36f6c97c43b9ac98
	.xword	0xa833036f1579930e
	.xword	0x8134faa669b5d14a
	.xword	0xa6bd44b2d80264c0
	.xword	0x2f16c589668147fa
	.xword	0x78f636449d3d36c8
	.xword	0xdad98a3305a14941
	.xword	0xd5dd0f74be5b2713
	.xword	0x1aa9dbc0a9bd7ef8
	.xword	0xcd20876ca4526da4
	.xword	0x5088d45b21c74cf8
	.xword	0xa2a5f117ecce6e8b
	.xword	0x7e2aa3d716f27794
	.xword	0x403232eb53f92a5e
	.xword	0x4e9060e5adb3c457
	.xword	0x74bfb109611bb251
	.xword	0xd9d4ed339136ab6d
	.xword	0x3d2a4f33fee09344
	.xword	0x144eaee782ed44be
	.xword	0xf49d09e328c86336
	.xword	0x48f73a2cd28ecf13
	.xword	0xf8e660ebd0c0970c
	.xword	0x502a417760451c35
	.xword	0xce7ba9e589b05c25
	.xword	0x9588ee77376eb28f
	.xword	0x8f2c0c1c2aad75ba
	.xword	0x3439de6c2e881f56
	.xword	0x201cfd8dcd308cd5
	.xword	0x732d39f10d54a80d
	.xword	0x05b5f7566ce0b45c
	.xword	0xb4a00d2d77c248af
	.xword	0x9f71443639358dc7
	.xword	0xd3c1f3d8a8d3c7f2
	.xword	0x5ca3be23e2cb3e80
	.xword	0xb1eecc3b262527e1
	.xword	0x2f965d7f2d67ede2
	.xword	0x785849e4f2f8bfab
	.xword	0x1fcb4fbc84063c5d
	.xword	0xf981a25c274aa5d1
	.xword	0x401a31c181c6b21c
	.xword	0xe0d1e47edd92a1a5
	.xword	0x25dd4889b27dd913
	.xword	0xe7310dc91de68d18
	.xword	0x5ad9364df3a367c4
	.xword	0xf5f880f213d849d0
	.xword	0x6d73abf84812d095
	.xword	0x948824d66fd6bf9a
	.xword	0xfe81c16306bf9035
	.xword	0x3e27ed800ca98884
	.xword	0x172c5a19961c931b
	.xword	0xb374cf9cadca0947
	.xword	0x97919a379707d62c
	.xword	0x3b5cf7faca4d11dc
	.xword	0x84f0fa6e53d6567f
	.xword	0xcfed2f2914038b2e
	.xword	0x3e55ae06e8b3ff13
	.xword	0x2b31a3cb5ba8d871
	.xword	0xf67f46e74637221c
	.xword	0x6eb352a245d902e2
	.xword	0x7d83602f5a048a5b
	.xword	0xde3927d933e175be
	.xword	0x2b228d337c37ce87
	.xword	0x1dde4fcaaa8fbf93
	.xword	0x578890b6f540b467
	.xword	0x05b1a862ba0197f8
	.xword	0xbb3f9ff484811e01
	.xword	0x92fe9ce971c10379
	.xword	0x8d0cbb987d0c1b83
	.xword	0x0fb0703a595e197f
	.xword	0xb82e6fd407ad9ccf
	.xword	0x81b7a44ea64ebd41
	.xword	0x855b857f1cfdb1fa
	.xword	0x6cb87fa2379f273a
	.xword	0x08eda84691392119
	.xword	0x42d644c4020080c0
	.xword	0xa2b96c2fb6278b08
	.xword	0x8128e614c9754b61
	.xword	0xcf532783663a9d9b
	.xword	0xfbcef7f52ddb3f2e
	.xword	0xa45010e2e0b5dd13
	.xword	0xc35af08d86693e93
	.xword	0x0a93261e4ea4d40f
	.xword	0x9b85244a631fef7c
	.xword	0xae79c4eec4ee6ece
	.xword	0x572ee9334fa26d05
	.xword	0xdc31415235e23a86
	.xword	0xd6de657e0532833b
	.xword	0x86a872ca78b8ca56
	.xword	0x904e69d91c3b5a05
	.xword	0x144bd4f7caafb548
	.xword	0x936c22ea6bf1b222
	.xword	0xa3eaaa9eb801e1d3
	.xword	0xa50fd041c252bbce
	.xword	0x517895faccb3471d
	.xword	0xb1a8a48483fcea96
	.xword	0x9685e6db6e576f60
	.xword	0xc461f78984466ee4
	.xword	0xd48ffaf8fd758f2c
	.xword	0x1b2f8d7c64953004
	.xword	0xd791d0f96989a86b
	.xword	0xcafaaef1c527d89b
	.xword	0xf21282f40086c194
	.xword	0x897eeaac1a0dfc50
	.xword	0x8dbebf25dc975195
	.xword	0x0578570e8c30b336
	.xword	0xee99e338f2a53b12
	.xword	0xbee7566c8c15fd8d
	.xword	0x01d97e39ca2f28b2
	.xword	0x999a49679d82f717
	.xword	0x1810f56776214b06
	.xword	0xe05d0f0c1b6434ae
	.xword	0x3a1e6a11f4854b10
	.xword	0x1fe0f75261a75c24
	.xword	0x7d43065adc05c73c
	.xword	0xfb4be54453bc44fa
	.xword	0xe729a52393683fe1
	.xword	0x5aba4707fb528a53
	.xword	0xf4559aeb9bbaad4b
	.xword	0xc06deb4d4e45a8b6
	.xword	0x5574c06ef1825c17
	.xword	0xe499a1b3195a03a9
	.xword	0x99a78eb1b9f05e15
	.xword	0x62965cafaa6a75c2
	.xword	0x006ac83f0c89de34
	.xword	0xfc3d7fa82f493648
	.xword	0x5056e81937388c67
	.xword	0xb72ad7f9fb77d185
	.xword	0x33eb08a188dd2833
	.xword	0xee44453a6cdce219
	.xword	0xc5b18eb25d542b2e
	.xword	0xd80aaa8033663ce7
	.xword	0xcb0fde72529f672d
	.xword	0x56904b8f66aedb5c
	.xword	0xf76c3312f37c77fd
	.xword	0x910f1597aaf9528f
	.xword	0xb31f192f3d897c42
	.xword	0x3a0112d1dd50377c
	.xword	0x9d9e8b64f259f07d
	.xword	0xe4ef09de018d6642
	.xword	0x60666bcec192b58f
	.xword	0x0f781429b87628b2
	.xword	0xb43e9fc6780a8507
	.xword	0x694b384e6433b0fd
	.xword	0x4a70b20ea98821c9
	.xword	0xbaa8fae10c1ad944
	.xword	0x2d0445d9723966f3
	.xword	0x786d6a5fd3995240
	.xword	0x3b59f0993a8fe81f
	.xword	0xca74dd20bee12d51
	.xword	0x8362d5aca3609576
	.xword	0xfca70cfc6561713d
	.xword	0x3bcddc00f24ad89b
	.xword	0x3c76221e4d2d4fb1
	.xword	0xaa2f736e4d76069b
	.xword	0xaf76025b28d57236
	.xword	0xf282157e472b7edc
	.xword	0xf5f7ad3519c58a94
	.xword	0x81549da0741e2291
	.xword	0x6af79e1123ac6083
	.xword	0x33e0de14a16df6e3
	.xword	0x42360fbebad3fe8c
	.xword	0x96803e4bf2d3e7e2
	.xword	0x03f4931dddcb3887
	.xword	0x8cec3c48bb75d002
	.xword	0xf5b81f40db0b3f84
	.xword	0xd52cd38588c94784
	.xword	0x68e13f48bf8bd67f
	.xword	0x929192f89d903273
	.xword	0x792abccc1643547c
	.xword	0x65e93364a16d8a42
	.xword	0x1cebcdedfdbf85ee
	.xword	0xbb95f2f0fa29ed1b
	.xword	0x369a801124277b1f
	.xword	0x01bdf95bffcd88e7
	.xword	0xc011dca4f286ff6e
	.xword	0x5279eea7f4a72312
	.xword	0xed2f4dac5eb9cc67
	.xword	0x48bbb946642aa141
	.xword	0x67bdee347db5fb5d
	.xword	0xb6de69a6e730de07
	.xword	0x51fe00ba9f975d14
	.xword	0xfc08727d631a33d1
	.xword	0x4c76f4ec59e90570
	.xword	0x9854a90656ee2e23
	.xword	0xac7385d46dad6613
	.xword	0x91f908436601ea0a
	.xword	0x1ed14419846452d0
	.xword	0xc4e88d5b5a43eea7
	.xword	0xd9caad0083cf3f83
	.xword	0xb0717a8d2d53c011
	.xword	0xc015d67451955bf9
	.xword	0x13c91a861648a132
	.xword	0xa66b96761d3fe3ef
	.xword	0x695d1970470274a9
	.xword	0xa883bd738f313457
	.xword	0x9ef2c76d0afb36a4
	.xword	0xe4ab6f3dc7cc7c7b
	.xword	0x2d86d0c2b4cb8bee
	.xword	0x4f9e79da36b7c994
	.xword	0x4ae2cbd1b21d9b81
	.xword	0x1ed37014308c3df1
	.xword	0xb9ee514ba58b139a
	.xword	0x689dbeb620a52bac
	.xword	0xbdf1692d63a9263f
	.xword	0x77380b05ee318baf
	.xword	0xc23db04539f43be9
	.xword	0x9298a29a9ec0f2d9
	.xword	0xe7658aecf2bc08f7
	.xword	0xd4160bf671200573
	.xword	0x37ec824b3057bcf1
	.xword	0x4e0b8187a7803b67
	.xword	0x4078611b2413341d
	.xword	0x111a812bf7f3bd93
	.xword	0x4297b36a34ebd054
	.xword	0xa987882e38fb54fb
	.xword	0x3247fbfa0136a499
	.xword	0x6d0ace6d972a6665
	.xword	0xd2797b303a18b3c1
	.xword	0x0f0fbe09d32f0310
	.xword	0x8a1d6443f8ea108b
	.xword	0xe20b529552a2facc
	.xword	0xd48e88e18f6af781
	.xword	0xa86023843cf15614
	.xword	0xef360262c650a050
	.xword	0x3483c56a1ac2678f
	.align 0x80000
	.data
data_start_7:

	.xword	0x2d075acdd9606b56
	.xword	0x07c395ebbe4eb956
	.xword	0x24d9b06213fcb01b
	.xword	0x0621f82c4ebf1621
	.xword	0x5e7a2b35a1b94980
	.xword	0xdea94e8a63aa3f54
	.xword	0x0793d6078f1bebbc
	.xword	0x15e3cd9e3a3e99e8
	.xword	0xdf198a53537b10f5
	.xword	0xc88d358c65c212a3
	.xword	0x88c7e47427345855
	.xword	0x2e80b5f7d299e093
	.xword	0x40724eb48f439aaa
	.xword	0x624a8252a8de603d
	.xword	0x9d1d3c9e0b0c0e5d
	.xword	0x96af8a9792bba3f5
	.xword	0x2648cc9bbd19a21e
	.xword	0xbf90e1344bdd949a
	.xword	0xa6276393eb0b4fea
	.xword	0x5a6e27732eb35902
	.xword	0xf7dc221cd62fe5c3
	.xword	0x1eb5092f37bfb37f
	.xword	0x978b2a7be98da2a0
	.xword	0xc375ef55719d22e1
	.xword	0x2da1d92709f0cd13
	.xword	0xb824cae2b31e558e
	.xword	0x424f889adef6c715
	.xword	0xeba1c30706d1f058
	.xword	0x8eec1d2787ff33cf
	.xword	0xcbe9ae236cd3868e
	.xword	0xdf0ac3030f74b09f
	.xword	0xc138f1ae0b5b863e
	.xword	0x5289e7f11630f9d4
	.xword	0xee00e30b4aa7d045
	.xword	0x4852d037efbe4081
	.xword	0x2a80b1f6335f7eba
	.xword	0x6d4b0d8498f8d6aa
	.xword	0xaa5a716f2a89e7ef
	.xword	0xbe97fc1550708b22
	.xword	0xfb84606238400c11
	.xword	0x04bfc528084a8273
	.xword	0x7b51bc18a327d5ac
	.xword	0xa030d8fb6145407c
	.xword	0xfcafe18811e10e8b
	.xword	0x9e3fbd7a288543d3
	.xword	0x18fec574296532d4
	.xword	0x854d8fd837552fac
	.xword	0xe825ba1f32768dfd
	.xword	0xc636b30100bca659
	.xword	0x161e7018157924b2
	.xword	0xb7a076ac9457f69d
	.xword	0xc903851e8529eabe
	.xword	0xe4efeea772bfdb96
	.xword	0x6ec827d579946e36
	.xword	0xa881dabb10b3214d
	.xword	0x61f677496b73766a
	.xword	0xb2e788887b537482
	.xword	0x41dbb992cf67453a
	.xword	0x8bacbb025b9b6c59
	.xword	0x802600e5cbda2bfd
	.xword	0x3fb10b9c1ec2d1cc
	.xword	0xb46b44390a87de46
	.xword	0x6641205264c22b9c
	.xword	0xda25a74546bf7447
	.xword	0x0222a1d68a5435cf
	.xword	0x2aa7e681f8daa5e9
	.xword	0xad4d5e4799f1b191
	.xword	0x16c76b6bc4572f6f
	.xword	0x051cf8c679d55374
	.xword	0x026bf4ab87ad2e81
	.xword	0x469e61baf5da5c54
	.xword	0xb5f6217cb075cd7c
	.xword	0xa15a787c02c7dd67
	.xword	0x6600c7e4f179b824
	.xword	0xfa5857d095cd1e7a
	.xword	0x82235cad853b47bd
	.xword	0x290042d579266c65
	.xword	0xbf099732e39d4b9b
	.xword	0x77467c94fc112c03
	.xword	0x2bcd82e475b8f8c7
	.xword	0x4b85c13939db61d5
	.xword	0x2cd093247a4894ef
	.xword	0xe52f1934ecd1f45b
	.xword	0x5750b5a359712c2e
	.xword	0x83e5846675211905
	.xword	0x1d1940363a607f7b
	.xword	0x69b98cdf81a71a09
	.xword	0x1419753524c05421
	.xword	0xcb4e629af5c2d2e2
	.xword	0x850103720f3e7b4e
	.xword	0x999cb5c8cc6cafc4
	.xword	0x8b29fa2b66006027
	.xword	0xcfba1180d0d14715
	.xword	0x055edaa1adf46409
	.xword	0x639499c1e48eb294
	.xword	0xd6c197bc096da595
	.xword	0xc5181394419c8e91
	.xword	0x7cc33f7f2080ad4d
	.xword	0x3f8888c9bbb14389
	.xword	0xc1140fe7b397ecd2
	.xword	0x77e1897d3aa798c3
	.xword	0x340bac1718316361
	.xword	0x386a31259def45d3
	.xword	0xc8a08aa11035296a
	.xword	0x52d6e566f898b22b
	.xword	0x676558d75f07be58
	.xword	0xfa3d4bc7a69de806
	.xword	0xe3f345323f582fed
	.xword	0x49de15e44db7efb4
	.xword	0x52f354c8fd742342
	.xword	0x5dec2dff7e154c2c
	.xword	0x388283bcc9d18aa0
	.xword	0x5dc82e54f0c41981
	.xword	0x1ba5f54d08f89c7f
	.xword	0x8a8e62d1e9d516d9
	.xword	0x0a6a1154d3943c31
	.xword	0x986327cb54f9081c
	.xword	0xcfec4789c8d44870
	.xword	0xa94ea622ca09ce45
	.xword	0xe87f3fd3f44916b3
	.xword	0x90880205890a38c0
	.xword	0x060122c977cccbf6
	.xword	0x9bcb12b2fd0eda60
	.xword	0x694ac79b898a5ffd
	.xword	0xe652c330edfdb88c
	.xword	0x8fbf201e5ebae688
	.xword	0x8e18915c62663df5
	.xword	0xc2f17eb4b7ad7acc
	.xword	0x54fc06c5cac1a1d4
	.xword	0xf5e408dec660dad5
	.xword	0xccf3215a367ac696
	.xword	0x2dd193e430c52e84
	.xword	0xb612f04ef40526c8
	.xword	0x4f727a4a74cdd7cf
	.xword	0x56c3a7c94cf40cd1
	.xword	0x71f92a19674e3ba8
	.xword	0xdb26ee388ef5c586
	.xword	0x02e532b1c4292ac9
	.xword	0x7429f618ca93151e
	.xword	0x161cf2b83abe865c
	.xword	0x57cb641f96f85827
	.xword	0xcc32e761438adaa8
	.xword	0x21d72eae13f2c1df
	.xword	0xd1cb6d49030bfb45
	.xword	0x11e55595922b4d6a
	.xword	0xfc9418a6ab09fccd
	.xword	0xed7e28fbbcd45320
	.xword	0x946ea18f7e4fb124
	.xword	0x615b215c6359f034
	.xword	0x9f2cbb2db6291f23
	.xword	0xbc6550ff20f9a12d
	.xword	0x401adef0492f8357
	.xword	0xf830359acf0aace1
	.xword	0x0a4e54c796674721
	.xword	0x572ab1e4463b7ddf
	.xword	0xbf3b6990587de34b
	.xword	0x6abe4e8606154733
	.xword	0x99f4ae6b246967bb
	.xword	0x6673feca3d5e454e
	.xword	0xbda1df9935f7fa7e
	.xword	0x11102f0a6ec5b1bc
	.xword	0xca97bac621323dc3
	.xword	0xc6ed80a17c10a665
	.xword	0x2173decb8f56ebe8
	.xword	0x6fe6b5783226ac6e
	.xword	0xbfb2d68c47f31737
	.xword	0x6f4aa7985b3ff950
	.xword	0xab1655f2892e3ad8
	.xword	0xbc16da0a3a04d21f
	.xword	0x4b84a2fb31fe0f20
	.xword	0xafa3bf243eefb184
	.xword	0xbaaddacbf92dec22
	.xword	0x34c7988a70a38f1b
	.xword	0x175964416c22d7e9
	.xword	0x01229dfb3f5142ed
	.xword	0xc17ff56866a12943
	.xword	0x95aa69dcdc335fcf
	.xword	0x5b34b9ddea8f5b4b
	.xword	0x125f29dd6e332113
	.xword	0x9f7f2d6e48d78005
	.xword	0x1a483f856f24072a
	.xword	0x2ae4c97e3688b6d5
	.xword	0x1687820223d0913d
	.xword	0x90b15867956c9376
	.xword	0xa3bcce09e98c3d9b
	.xword	0xc87cc53401125459
	.xword	0x9d73e9c91fa4fb93
	.xword	0x18911f0a833bdc53
	.xword	0x815a4819d9ad389f
	.xword	0x9a3a7aeb52c61894
	.xword	0xefb6a75d2d519da2
	.xword	0x86c16dcfb419e094
	.xword	0x0856607f9a6ed321
	.xword	0x9ca69ef5c1541b42
	.xword	0xae2fdfb761d7e199
	.xword	0xad72345b0d4b7f1b
	.xword	0x25e62a89b389f168
	.xword	0x33cb542790fbfb34
	.xword	0x66089f2ea678eca2
	.xword	0x051f6e0acb75a373
	.xword	0xac32081b4892f959
	.xword	0xc9738373b0b90c48
	.xword	0x828e137c9ecde85a
	.xword	0xb513f3ff1fa96248
	.xword	0xf2e35af6d7a96ddb
	.xword	0x3bb38ca0a622de56
	.xword	0x6fd141ea65749dd2
	.xword	0x33270974a89e6f79
	.xword	0xaa26b295098f5335
	.xword	0xfdfbbc1bf60ba0ea
	.xword	0x592024393b4d0e6b
	.xword	0x43fedf77f6e997b9
	.xword	0x078db8c38d806afd
	.xword	0x0b3f3a9cf913bb2e
	.xword	0xc7e2c59b33a39ec6
	.xword	0xdb70e432cae487c7
	.xword	0x177ba4aebc074b65
	.xword	0xea54a4e45c0854a7
	.xword	0x2c141fa0b940fa0f
	.xword	0x3a17e29e05812c61
	.xword	0x1ae7f4cba2c6dae3
	.xword	0x78171913c17a6054
	.xword	0x6a8763a514fd9ad1
	.xword	0xf3338a7e0f48f795
	.xword	0x4741ef58e43decc3
	.xword	0x7ff10258e0807459
	.xword	0x28bf48a4a5d179bd
	.xword	0x06f99b12aa29b5c2
	.xword	0xe686b2297bb20321
	.xword	0xfe1639d500c296ec
	.xword	0x1d12db3de4064c9c
	.xword	0xb0c6d352633f45bf
	.xword	0x20521105e830df9e
	.xword	0xaefab1e97af78a4a
	.xword	0x3b68c8b927e8b397
	.xword	0x829345d4a6f16889
	.xword	0xcd12c95c42b1b03e
	.xword	0x6e08e528715c6a1a
	.xword	0xf622ad73167cd508
	.xword	0x396c9c11dbbb27b1
	.xword	0xc72f9f2da92c660c
	.xword	0x053d10d18afdb8a4
	.xword	0x7d2281ebb378cd62
	.xword	0x6f5c82420e164a1d
	.xword	0xe06c8c9d3b09930e
	.xword	0xee40b1575867916a
	.xword	0x38578adb18b5fc87
	.xword	0xf012907f8e0f4cf1
	.xword	0xadbe5c6cf5a55a82
	.xword	0xfbeeb8c244eb0b72
	.xword	0x0229011b61724122
	.xword	0xe510c38f648f6a5f
	.xword	0x1ca994c781ec4d07
	.xword	0x1e80e951c4108e28
	.xword	0x71e39d9d290fbb9e
	.xword	0x9afe6ba359f6a878



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
