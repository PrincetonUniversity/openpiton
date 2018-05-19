// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_0_s1.s
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
   random seed:	611724325
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

	setx 0xd6ef02830f6c86ae, %g1, %g0
	setx 0x178976a5f13c10c0, %g1, %g1
	setx 0x7fdec7835a989f30, %g1, %g2
	setx 0x196ef71a2e6fdcf6, %g1, %g3
	setx 0xd2e3bf7a4422a629, %g1, %g4
	setx 0x7ed709af181c7ef4, %g1, %g5
	setx 0xd70bd1f9dedff39c, %g1, %g6
	setx 0x92c09d30f6ecad47, %g1, %g7
	setx 0xbc37fd2b34ec7e4b, %g1, %r16
	setx 0x7a561042362f4671, %g1, %r17
	setx 0x371808e106611ee5, %g1, %r18
	setx 0x22e8e62d453b8934, %g1, %r19
	setx 0x6166a0cb98f551d6, %g1, %r20
	setx 0xcdaf7c29baa05bda, %g1, %r21
	setx 0xf7c4d02d7e272638, %g1, %r22
	setx 0x66a7f81edef8c227, %g1, %r23
	setx 0xf751c48d36aedcb6, %g1, %r24
	setx 0xb35ec33d1d4b5f83, %g1, %r25
	setx 0x1e8678bf817f844f, %g1, %r26
	setx 0x496a7d4d875a031c, %g1, %r27
	setx 0x1caaf1766c1324a5, %g1, %r28
	setx 0x047b5677b1a808d7, %g1, %r29
	setx 0x09ac99e209ea1a46, %g1, %r30
	setx 0xe86a5779ca7e78bd, %g1, %r31
	save
	setx 0xa4cef1e4c241f713, %g1, %r16
	setx 0xcac6a2b9c49831c1, %g1, %r17
	setx 0xb13ec6151c37bb62, %g1, %r18
	setx 0x40c4b60ec6595240, %g1, %r19
	setx 0xbc429712dfab8df3, %g1, %r20
	setx 0x34b054e2ba09c404, %g1, %r21
	setx 0x1aed0eb86b667373, %g1, %r22
	setx 0x3ac125dc0dc7c5eb, %g1, %r23
	setx 0x79d41ce12feae347, %g1, %r24
	setx 0xb60b1b049545e1d9, %g1, %r25
	setx 0x54409395eb671f18, %g1, %r26
	setx 0xe5f86eba20c4d587, %g1, %r27
	setx 0xbd47da31f49972c1, %g1, %r28
	setx 0x2813a91c2edbee48, %g1, %r29
	setx 0xe16e9b67e15fdc8b, %g1, %r30
	setx 0x0de54b765a7b19b2, %g1, %r31
	save
	setx 0x06022d7a7cde742e, %g1, %r16
	setx 0x284d026300af4de3, %g1, %r17
	setx 0xe5f5bbd2498ad002, %g1, %r18
	setx 0x17e46183879076d9, %g1, %r19
	setx 0xfe4a42cba8171778, %g1, %r20
	setx 0x1918e0e9783b0669, %g1, %r21
	setx 0xd060dc62201740f3, %g1, %r22
	setx 0xcf5dad6f0daf0ec3, %g1, %r23
	setx 0x3e70974df9dd776e, %g1, %r24
	setx 0x627024a445a40797, %g1, %r25
	setx 0xf9f6b547638f828e, %g1, %r26
	setx 0xefae6596fffbbfb8, %g1, %r27
	setx 0xe8f04c36de431470, %g1, %r28
	setx 0x9d57ae67489b2a42, %g1, %r29
	setx 0xe2eb34c58179c07e, %g1, %r30
	setx 0x0454316a3976d6ab, %g1, %r31
	save
	setx 0x6afac3baf4f6a8c3, %g1, %r16
	setx 0xdc47fe85c15a06d9, %g1, %r17
	setx 0xf334d3bc60c3dd1e, %g1, %r18
	setx 0xae9a89e92d9d44d0, %g1, %r19
	setx 0x606d5e174a656c65, %g1, %r20
	setx 0x74ca4ec0c7c1058b, %g1, %r21
	setx 0xe3f3f0a2f9ecb350, %g1, %r22
	setx 0x09a74280e05c5188, %g1, %r23
	setx 0xdba4423bfa8ab2b8, %g1, %r24
	setx 0x3af6d76ab90042c1, %g1, %r25
	setx 0x9792620dcd94a29f, %g1, %r26
	setx 0xa7c2d60a164aff90, %g1, %r27
	setx 0xdf8aa24323a009dd, %g1, %r28
	setx 0x117d5779d45b092c, %g1, %r29
	setx 0xf9dba2c1ec04d86a, %g1, %r30
	setx 0xa6566f6ed453ee76, %g1, %r31
	save
	setx 0xb7fae4e3c5b036dc, %g1, %r16
	setx 0x1de083d45e558fed, %g1, %r17
	setx 0xca2ab8496a24ed36, %g1, %r18
	setx 0xae0bc7dd0144e08d, %g1, %r19
	setx 0xb04cbcd72e1e54cb, %g1, %r20
	setx 0x4077a6adefb03220, %g1, %r21
	setx 0x911e574e2d8c50aa, %g1, %r22
	setx 0x09df6adfedbf02d7, %g1, %r23
	setx 0xd94ed8da9dd02df1, %g1, %r24
	setx 0x37e094ed5b36d1b2, %g1, %r25
	setx 0xd5630060f08e6240, %g1, %r26
	setx 0xc42043845bffca3f, %g1, %r27
	setx 0x24d7cb5a002257ce, %g1, %r28
	setx 0x9fbd2c455700fb6f, %g1, %r29
	setx 0x57d51059501dbab4, %g1, %r30
	setx 0x5002f65a7d8b9038, %g1, %r31
	save
	setx 0x3a58b1809157c4bd, %g1, %r16
	setx 0x1e193659b3d2e436, %g1, %r17
	setx 0xcc512a3024405686, %g1, %r18
	setx 0x0711ec6e75502f7c, %g1, %r19
	setx 0x1d3d6aa9ed71a56f, %g1, %r20
	setx 0xa27c3965e206405a, %g1, %r21
	setx 0xd681ab0467cd0590, %g1, %r22
	setx 0x8284e47c13d00049, %g1, %r23
	setx 0x5b74bb042b46f25d, %g1, %r24
	setx 0xcded895e0ff0475b, %g1, %r25
	setx 0x89dbbc401146b239, %g1, %r26
	setx 0x895a9dea421137b1, %g1, %r27
	setx 0x1b04845ddaba45d2, %g1, %r28
	setx 0x8b464efd0496d1d2, %g1, %r29
	setx 0xb6bab70a47d6b56e, %g1, %r30
	setx 0x3c221747d9e3f08c, %g1, %r31
	save
	setx 0x1b0c08f119a19aea, %g1, %r16
	setx 0xd05a5b8bf842f4de, %g1, %r17
	setx 0x547e11d9c4e51446, %g1, %r18
	setx 0xd04f0517c23cc2a2, %g1, %r19
	setx 0x36c61888abe8dd37, %g1, %r20
	setx 0xc7a9265d62333bda, %g1, %r21
	setx 0x62cb23edef6f83f9, %g1, %r22
	setx 0xe5b733531232b210, %g1, %r23
	setx 0x0def608f06d008f4, %g1, %r24
	setx 0x2875a1ef99ff31f3, %g1, %r25
	setx 0x3a8abbb20e27fe8b, %g1, %r26
	setx 0x478cc4509321fc83, %g1, %r27
	setx 0x568ba290e067d29d, %g1, %r28
	setx 0x41264e359059c3ff, %g1, %r29
	setx 0x5ccdf5e1abb2567c, %g1, %r30
	setx 0xe1959682b680ba78, %g1, %r31
	save
	setx 0xf0201737f28dab7d, %g1, %r16
	setx 0x7ef86fd61957e95b, %g1, %r17
	setx 0xff8795bdf26b27af, %g1, %r18
	setx 0x040eaa87c4c2a786, %g1, %r19
	setx 0xa20493b7b8adb55c, %g1, %r20
	setx 0xbef80b833cdb3b0e, %g1, %r21
	setx 0x6e113ff30afe97e5, %g1, %r22
	setx 0xef16888b4dfeccc1, %g1, %r23
	setx 0xbc0d20ceff92b1a5, %g1, %r24
	setx 0x0fb53ff590cb00d5, %g1, %r25
	setx 0x7f96d9c6b5719f59, %g1, %r26
	setx 0xa62903a6655444ef, %g1, %r27
	setx 0x2aefd1857757bebe, %g1, %r28
	setx 0x4834aaf9d0f328bc, %g1, %r29
	setx 0x48e1576bd59e7b3f, %g1, %r30
	setx 0x1d4078db4c45207a, %g1, %r31
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
	.word 0xbfe4e1be  ! 1: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe54000  ! 3: SAVE_R	save	%r21, %r0, %r31
	.word 0xb1e4c000  ! 4: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbbe52056  ! 6: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e40000  ! 7: SAVE_R	save	%r16, %r0, %r24
	.word 0xb7e58000  ! 10: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_0:
	setx	0x1e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00d8000  ! 14: AND_R	and 	%r22, %r0, %r24
T0_asi_reg_wr_0:
	mov	0x25, %r14
	.word 0xfcf38400  ! 15: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb2ac2134  ! 22: ANDNcc_I	andncc 	%r16, 0x0134, %r25
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_1:
	setx	0x1c0037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_2:
	setx	0x1e0027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_3:
	setx	0x1d0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb6b5a17d  ! 44: ORNcc_I	orncc 	%r22, 0x017d, %r27
	.word 0xbde4a1f2  ! 45: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbb3df001  ! 49: SRAX_I	srax	%r23, 0x0001, %r29
	.word 0xbfe48000  ! 51: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_4:
	setx	0x1e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 54: SAVE_R	save	%r22, %r0, %r24
	.word 0xbfe58000  ! 55: SAVE_R	save	%r22, %r0, %r31
	.word 0xbbe5a174  ! 56: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_5:
	setx	0x1f0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_1:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 59: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_rd_0:
	mov	0x3c4, %r14
	.word 0xf2db89e0  ! 62: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb5e5e161  ! 68: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e4e054  ! 70: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_wr_2:
	mov	0x37, %r14
	.word 0xf4f384a0  ! 72: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb3e5612f  ! 73: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_3:
	mov	0x25, %r14
	.word 0xf6f38e60  ! 75: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 3)
	.word 0xb92d0000  ! 79: SLL_R	sll 	%r20, %r0, %r28
	.word 0xb1e42172  ! 80: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e42012  ! 87: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_6:
	setx	0x1e003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a1d5  ! 95: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 36)
	.word 0xb1e40000  ! 99: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_4:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 102: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb885a08e  ! 103: ADDcc_I	addcc 	%r22, 0x008e, %r28
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb5e420e3  ! 109: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_wr_5:
	mov	0x22, %r14
	.word 0xf4f38e40  ! 112: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb1e4c000  ! 113: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_1:
	mov	0x2d, %r14
	.word 0xf8db8e60  ! 114: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_0_7:
	setx	0x1c0021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_8:
	setx	0x1e0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 127: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_wr_6:
	mov	0xf, %r14
	.word 0xf4f38400  ! 132: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbfe4a150  ! 135: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_9:
	setx	0x1e0201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_10:
	setx	0x1d012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe460ab  ! 144: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 29)
	.word 0xb3e5c000  ! 147: SAVE_R	save	%r23, %r0, %r25
	.word 0xb9e48000  ! 148: SAVE_R	save	%r18, %r0, %r28
	.word 0xb3e48000  ! 149: SAVE_R	save	%r18, %r0, %r25
	.word 0xb1508000  ! 153: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe420c9  ! 157: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_2:
	mov	0x2a, %r14
	.word 0xfedb89e0  ! 158: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_11:
	setx	0x1c0123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_rd_3:
	mov	0x34, %r14
	.word 0xf6db8e80  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 37)
	.word 0xb7e42001  ! 171: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e560a6  ! 172: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_rd_4:
	mov	0x26, %r14
	.word 0xf8db8e40  ! 183: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb7e4a178  ! 184: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_12:
	setx	0x1c0338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbbe4a0cc  ! 191: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3643801  ! 193: MOVcc_I	<illegal instruction>
cpu_intr_0_13:
	setx	0x1c0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe521a5  ! 195: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_14:
	setx	0x1d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_5:
	mov	0x4, %r14
	.word 0xfadb8e40  ! 203: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9e461a3  ! 204: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xba8c4000  ! 206: ANDcc_R	andcc 	%r17, %r0, %r29
	.word 0xb5e4e0a4  ! 207: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_7:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 208: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9e54000  ! 209: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_8:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 211: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb7e5e1e7  ! 213: SAVE_I	save	%r23, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_9:
	mov	0x2, %r14
	.word 0xf0f38e60  ! 218: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 21)
	.word 0xbbe40000  ! 220: SAVE_R	save	%r16, %r0, %r29
	.word 0xb5e4a068  ! 223: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_rd_6:
	mov	0x1e, %r14
	.word 0xf2db8400  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb1e5a15c  ! 225: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x87942024  ! 228: WRPR_TT_I	wrpr	%r16, 0x0024, %tt
	.word 0xbfe521d0  ! 231: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe42041  ! 233: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e56177  ! 240: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde4c000  ! 241: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 26)
	.word 0xb80c21dc  ! 251: AND_I	and 	%r16, 0x01dc, %r28
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 38)
	.word 0xb635a140  ! 257: ORN_I	orn 	%r22, 0x0140, %r27
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 5)
	.word 0xb5e4e1aa  ! 267: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_7:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 271: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb5e4e146  ! 272: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_15:
	setx	0x1c0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5605d  ! 276: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e560f4  ! 280: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe4c000  ! 281: SAVE_R	save	%r19, %r0, %r29
	.word 0xbd641800  ! 285: MOVcc_R	<illegal instruction>
T0_asi_reg_rd_8:
	mov	0x1d, %r14
	.word 0xf6db89e0  ! 286: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb9e4e1c6  ! 287: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_wr_10:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 294: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbbe54000  ! 300: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_16:
	setx	0x1d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_9:
	mov	0x14, %r14
	.word 0xfedb89e0  ! 305: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb3e421ed  ! 306: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_17:
	setx	0x1f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_18:
	setx	0x1f0114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_19:
	setx	0x1e0133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbfe5a0b1  ! 320: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e48000  ! 322: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_wr_11:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 324: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_wr_12:
	mov	0x26, %r14
	.word 0xf4f38e80  ! 325: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_20:
	setx	0x1f0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 328: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_21:
	setx	0x1d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb835c000  ! 334: SUBC_R	orn 	%r23, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e44000  ! 341: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_22:
	setx	0x1d0000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, d)
	.word 0xb9e4c000  ! 346: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_23:
	setx	0x1f0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a17d  ! 349: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde4c000  ! 351: SAVE_R	save	%r19, %r0, %r30
	.word 0xb5e44000  ! 352: SAVE_R	save	%r17, %r0, %r26
	.word 0xb5e40000  ! 354: SAVE_R	save	%r16, %r0, %r26
	.word 0xb1e48000  ! 356: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_24:
	setx	0x1e0030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_25:
	setx	0x1e0312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, c)
	.word 0xb3e58000  ! 365: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_26:
	setx	0x1e013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46163  ! 368: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_27:
	setx	0x1f022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 373: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_28:
	setx	0x1e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 20)
	.word 0xb9e5e082  ! 377: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_10:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 379: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_rd_11:
	mov	0xd, %r14
	.word 0xfadb8e40  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7e4e108  ! 385: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_29:
	setx	0x1e000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195215d  ! 390: WRPR_PIL_I	wrpr	%r20, 0x015d, %pil
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, d)
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_30:
	setx	0x1c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e40000  ! 405: SAVE_R	save	%r16, %r0, %r28
	.word 0xbf2de001  ! 407: SLL_I	sll 	%r23, 0x0001, %r31
T0_asi_reg_wr_13:
	mov	0x37, %r14
	.word 0xf6f38e60  ! 412: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbbe4606f  ! 415: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_12:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 421: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_31:
	setx	0x1d030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe52068  ! 424: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_14:
	mov	0x13, %r14
	.word 0xf2f38e80  ! 427: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_32:
	setx	0x1e023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_33:
	setx	0x1d011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_13:
	mov	0x9, %r14
	.word 0xfadb8e40  ! 438: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5e58000  ! 439: SAVE_R	save	%r22, %r0, %r26
	.word 0xb9e4e0af  ! 441: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_34:
	setx	0x1c0339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_35:
	setx	0x1c0127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 28)
	.word 0xb1e48000  ! 454: SAVE_R	save	%r18, %r0, %r24
	.word 0xb3e5e113  ! 455: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe5e103  ! 456: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_wr_15:
	mov	0x26, %r14
	.word 0xf4f389e0  ! 462: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbde48000  ! 463: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_wr_16:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 470: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbde44000  ! 471: SAVE_R	save	%r17, %r0, %r30
	.word 0xb5e42070  ! 472: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e50000  ! 476: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb1e4a113  ! 480: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbc844000  ! 483: ADDcc_R	addcc 	%r17, %r0, %r30
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 10)
	.word 0xb735e001  ! 490: SRL_I	srl 	%r23, 0x0001, %r27
	.word 0xb4ace129  ! 492: ANDNcc_I	andncc 	%r19, 0x0129, %r26
	.word 0xb1e4c000  ! 493: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_14:
	mov	0x1e, %r14
	.word 0xf4db8e40  ! 494: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbbe420b1  ! 495: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde40000  ! 496: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_rd_15:
	mov	0x1d, %r14
	.word 0xfadb8e40  ! 501: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_17:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 502: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_18:
	mov	0x14, %r14
	.word 0xf2f389e0  ! 507: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbde5e020  ! 512: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb89d8000  ! 513: XORcc_R	xorcc 	%r22, %r0, %r28
	.word 0xb1e48000  ! 514: SAVE_R	save	%r18, %r0, %r24
	.word 0xb5e40000  ! 516: SAVE_R	save	%r16, %r0, %r26
	.word 0xbfe5212a  ! 521: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e48000  ! 522: SAVE_R	save	%r18, %r0, %r24
	.word 0xb1e4619d  ! 523: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe54000  ! 525: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb1e54000  ! 529: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_wr_19:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 532: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_16:
	mov	0x1f, %r14
	.word 0xf4db89e0  ! 535: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T0_asi_reg_rd_17:
	mov	0x22, %r14
	.word 0xfedb8e40  ! 536: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_36:
	setx	0x230214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e561fa  ! 541: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e5a0fc  ! 545: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe4a192  ! 546: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe50000  ! 547: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_wr_20:
	mov	0x21, %r14
	.word 0xfef384a0  ! 550: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb224e1ea  ! 553: SUB_I	sub 	%r19, 0x01ea, %r25
T0_asi_reg_rd_18:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 555: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbe54000  ! 557: SAVE_R	save	%r21, %r0, %r29
	.word 0xb1e5e094  ! 558: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_21:
	mov	0x17, %r14
	.word 0xfef38e40  ! 560: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_19:
	mov	0x3c8, %r14
	.word 0xfadb89e0  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_37:
	setx	0x200037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e00e  ! 569: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe58000  ! 570: SAVE_R	save	%r22, %r0, %r31
	.word 0xbaad21b8  ! 576: ANDNcc_I	andncc 	%r20, 0x01b8, %r29
T0_asi_reg_wr_22:
	mov	0x7, %r14
	.word 0xfcf38e40  ! 577: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_23:
	mov	0x15, %r14
	.word 0xf4f384a0  ! 578: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb5e560ff  ! 579: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e58000  ! 580: SAVE_R	save	%r22, %r0, %r27
	.word 0xb5e4c000  ! 582: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_rd_20:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 583: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb7641800  ! 585: MOVcc_R	<illegal instruction>
	.word 0xb025c000  ! 587: SUB_R	sub 	%r23, %r0, %r24
	.word 0xbde4c000  ! 589: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_24:
	mov	0x1e, %r14
	.word 0xf6f38400  ! 593: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbbe5e043  ! 596: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_rd_21:
	mov	0x18, %r14
	.word 0xfadb8e40  ! 597: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbfe52136  ! 600: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_25:
	mov	0x31, %r14
	.word 0xfcf384a0  ! 601: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, b)
	.word 0xb1e40000  ! 605: SAVE_R	save	%r16, %r0, %r24
	.word 0xbbe4a0d4  ! 607: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_22:
	mov	0x0, %r14
	.word 0xf2db84a0  ! 608: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_38:
	setx	0x210319, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_23:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 611: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb7e48000  ! 612: SAVE_R	save	%r18, %r0, %r27
	.word 0xb9e58000  ! 615: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_rd_24:
	mov	0xd, %r14
	.word 0xfadb8400  ! 616: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_wr_26:
	mov	0x2a, %r14
	.word 0xfaf384a0  ! 617: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_39:
	setx	0x200026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_40:
	setx	0x210310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_41:
	setx	0x220024, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_27:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 625: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_42:
	setx	0x22012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_43:
	setx	0x210123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_44:
	setx	0x210116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 6)
	.word 0xb7e40000  ! 633: SAVE_R	save	%r16, %r0, %r27
	.word 0xb7e52192  ! 635: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_45:
	setx	0x20020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_46:
	setx	0x210339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, b)
	.word 0xb5e5c000  ! 643: SAVE_R	save	%r23, %r0, %r26
	.word 0xbbe46104  ! 645: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe4c000  ! 646: SAVE_R	save	%r19, %r0, %r31
	.word 0xbfe40000  ! 647: SAVE_R	save	%r16, %r0, %r31
	.word 0xbbe4c000  ! 648: SAVE_R	save	%r19, %r0, %r29
	.word 0xb5e4603e  ! 649: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe40000  ! 654: SAVE_R	save	%r16, %r0, %r31
	.word 0xbab58000  ! 655: ORNcc_R	orncc 	%r22, %r0, %r29
T0_asi_reg_wr_28:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 657: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 24)
	.word 0xb7e4a091  ! 659: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e44000  ! 661: SAVE_R	save	%r17, %r0, %r28
	.word 0xb1e46132  ! 663: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_47:
	setx	0x220322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5210c  ! 672: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb33ce001  ! 674: SRA_I	sra 	%r19, 0x0001, %r25
	.word 0xb1e56089  ! 675: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb81c60b7  ! 677: XOR_I	xor 	%r17, 0x00b7, %r28
T0_asi_reg_rd_25:
	mov	0x6, %r14
	.word 0xf4db8e80  ! 682: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb435606f  ! 684: SUBC_I	orn 	%r21, 0x006f, %r26
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbde460b9  ! 690: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbe3d0000  ! 693: XNOR_R	xnor 	%r20, %r0, %r31
	.word 0xb3e44000  ! 695: SAVE_R	save	%r17, %r0, %r25
	.word 0xb5480000  ! 696: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbbe4a01b  ! 700: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 21)
	.word 0xb1e461b1  ! 708: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e50000  ! 709: SAVE_R	save	%r20, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_48:
	setx	0x220011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_49:
	setx	0x230309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a1f9  ! 719: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde50000  ! 721: SAVE_R	save	%r20, %r0, %r30
	.word 0xb9e5e153  ! 722: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbc04c000  ! 723: ADD_R	add 	%r19, %r0, %r30
cpu_intr_0_50:
	setx	0x230338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 727: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_51:
	setx	0x23013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 29)
	.word 0xbfe4a053  ! 735: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e5c000  ! 738: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_52:
	setx	0x23013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0850000  ! 745: ADDcc_R	addcc 	%r20, %r0, %r24
	.word 0xb3e48000  ! 750: SAVE_R	save	%r18, %r0, %r25
	.word 0xbc34e1f8  ! 752: ORN_I	orn 	%r19, 0x01f8, %r30
T0_asi_reg_wr_29:
	mov	0x2e, %r14
	.word 0xf6f384a0  ! 756: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_53:
	setx	0x220001, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_26:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 759: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb7e44000  ! 760: SAVE_R	save	%r17, %r0, %r27
	.word 0xbbe4602a  ! 761: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_54:
	setx	0x200223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb1e5c000  ! 769: SAVE_R	save	%r23, %r0, %r24
	.word 0xb7e48000  ! 777: SAVE_R	save	%r18, %r0, %r27
	.word 0xbbe54000  ! 778: SAVE_R	save	%r21, %r0, %r29
	.word 0xb1e4a1e4  ! 779: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_55:
	setx	0x200106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_56:
	setx	0x21023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e0e0  ! 782: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb034612f  ! 784: SUBC_I	orn 	%r17, 0x012f, %r24
cpu_intr_0_57:
	setx	0x230022, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_58:
	setx	0x220000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 789: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_30:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 791: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_0_59:
	setx	0x200124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde520ce  ! 794: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e44000  ! 795: SAVE_R	save	%r17, %r0, %r27
	.word 0xb01ca151  ! 796: XOR_I	xor 	%r18, 0x0151, %r24
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 24)
	.word 0xbfe52161  ! 802: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbab5c000  ! 806: ORNcc_R	orncc 	%r23, %r0, %r29
	.word 0xbfe50000  ! 808: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 16)
	.word 0xbfe44000  ! 821: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_31:
	mov	0x0, %r14
	.word 0xfcf38e80  ! 825: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbfe5a01d  ! 826: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e52021  ! 827: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5c000  ! 829: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_60:
	setx	0x210217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0348000  ! 834: ORN_R	orn 	%r18, %r0, %r24
	.word 0xbbe4205e  ! 836: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_27:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 837: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_rd_28:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb63421f5  ! 842: ORN_I	orn 	%r16, 0x01f5, %r27
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 15)
	.word 0xb82ca0ed  ! 851: ANDN_I	andn 	%r18, 0x00ed, %r28
	.word 0xb5e44000  ! 854: SAVE_R	save	%r17, %r0, %r26
	.word 0xb1e52130  ! 855: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_32:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 859: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_61:
	setx	0x230012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_62:
	setx	0x20022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb01ca18e  ! 867: XOR_I	xor 	%r18, 0x018e, %r24
T0_asi_reg_wr_33:
	mov	0xa, %r14
	.word 0xf8f38e40  ! 868: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_63:
	setx	0x200005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 4)
	.word 0xbde461eb  ! 879: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_64:
	setx	0x210220, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_29:
	mov	0xf, %r14
	.word 0xf2db8e40  ! 883: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb7e5e141  ! 886: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e5606a  ! 889: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_rd_30:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 891: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3e48000  ! 892: SAVE_R	save	%r18, %r0, %r25
	.word 0xb5e42010  ! 893: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_31:
	mov	0xb, %r14
	.word 0xf8db8e60  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_rd_32:
	mov	0x3c4, %r14
	.word 0xf2db8e80  ! 901: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_0_65:
	setx	0x230339, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_33:
	mov	0x3c2, %r14
	.word 0xfcdb84a0  ! 905: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_wr_34:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 908: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 4)
	.word 0xbbe560c0  ! 920: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_66:
	setx	0x10334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_35:
	mov	0x31, %r14
	.word 0xfef38e60  ! 925: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_34:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 932: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_67:
	setx	0x200332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, a)
	.word 0xb9e44000  ! 940: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_68:
	setx	0x200105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 942: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_36:
	mov	0x14, %r14
	.word 0xfef384a0  ! 943: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_69:
	setx	0x27001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 948: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_35:
	mov	0x2d, %r14
	.word 0xfedb84a0  ! 949: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbfe54000  ! 950: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_70:
	setx	0x270335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_71:
	setx	0x240010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e0db  ! 955: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_36:
	mov	0x36, %r14
	.word 0xf6db8400  ! 956: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_72:
	setx	0x25021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8ac8000  ! 959: ANDNcc_R	andncc 	%r18, %r0, %r28
	.word 0xbde50000  ! 962: SAVE_R	save	%r20, %r0, %r30
	.word 0xb5e58000  ! 967: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb7e4e18c  ! 970: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e4e080  ! 972: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x9195e1a9  ! 973: WRPR_PIL_I	wrpr	%r23, 0x01a9, %pil
	.word 0xb7e50000  ! 974: SAVE_R	save	%r20, %r0, %r27
	.word 0xb1e4c000  ! 977: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_73:
	setx	0x26031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_37:
	mov	0x27, %r14
	.word 0xfaf384a0  ! 982: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbbe44000  ! 985: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_74:
	setx	0x260337, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_37:
	mov	0x4, %r14
	.word 0xfedb8e40  ! 989: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_38:
	mov	0x24, %r14
	.word 0xfcf38e80  ! 991: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 13)
	.word 0xbfe5a0de  ! 996: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e4e0b0  ! 997: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 2e)
	.word 0x8395604c  ! 1001: WRPR_TNPC_I	wrpr	%r21, 0x004c, %tnpc
	.word 0xbfe520f0  ! 1002: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e4a0fe  ! 1003: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbc8ca0c7  ! 1006: ANDcc_I	andcc 	%r18, 0x00c7, %r30
T0_asi_reg_wr_39:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 1007: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb9e40000  ! 1008: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbfe40000  ! 1010: SAVE_R	save	%r16, %r0, %r31
	.word 0xb1e5c000  ! 1012: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_rd_38:
	mov	0x36, %r14
	.word 0xf4db89e0  ! 1014: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb3e4c000  ! 1016: SAVE_R	save	%r19, %r0, %r25
	.word 0x8f902000  ! 1017: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, e)
	.word 0xb3e4c000  ! 1023: SAVE_R	save	%r19, %r0, %r25
	.word 0xbde561d6  ! 1024: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e4c000  ! 1026: SAVE_R	save	%r19, %r0, %r24
	.word 0xb9e5c000  ! 1027: SAVE_R	save	%r23, %r0, %r28
	.word 0xb9e44000  ! 1029: SAVE_R	save	%r17, %r0, %r28
	.word 0xb9e5e0c5  ! 1030: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_75:
	setx	0x240131, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_40:
	mov	0x1a, %r14
	.word 0xf8f389e0  ! 1034: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_76:
	setx	0x27001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_41:
	mov	0x27, %r14
	.word 0xf0f38400  ! 1039: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbbe4a127  ! 1043: SAVE_I	save	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 18)
	.word 0xb6258000  ! 1050: SUB_R	sub 	%r22, %r0, %r27
T0_asi_reg_wr_42:
	mov	0x9, %r14
	.word 0xf4f38e40  ! 1052: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde5e028  ! 1055: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbe9c4000  ! 1057: XORcc_R	xorcc 	%r17, %r0, %r31
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_wr_43:
	mov	0x5, %r14
	.word 0xf4f38e80  ! 1063: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_wr_44:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 1064: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb9e44000  ! 1067: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_39:
	mov	0x35, %r14
	.word 0xf8db8e80  ! 1073: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_rd_40:
	mov	0x10, %r14
	.word 0xf2db89e0  ! 1074: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7e42122  ! 1078: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_45:
	mov	0x15, %r14
	.word 0xf8f38400  ! 1081: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_41:
	mov	0x3c2, %r14
	.word 0xfadb8400  ! 1087: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_rd_42:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 1088: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 16)
	.word 0xbbe4e14e  ! 1092: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_46:
	mov	0x26, %r14
	.word 0xfcf389e0  ! 1095: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_77:
	setx	0x25010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_43:
	mov	0xd, %r14
	.word 0xf2db8e80  ! 1100: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbde50000  ! 1101: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_44:
	mov	0x18, %r14
	.word 0xfedb8e60  ! 1102: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_78:
	setx	0x25031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_79:
	setx	0x260209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e421bd  ! 1105: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e4e1fb  ! 1106: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e54000  ! 1107: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_80:
	setx	0x250116, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_47:
	mov	0x14, %r14
	.word 0xf2f38400  ! 1110: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_0_81:
	setx	0x240035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb3e5a08f  ! 1118: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_82:
	setx	0x27032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61461e8  ! 1124: OR_I	or 	%r17, 0x01e8, %r27
T0_asi_reg_rd_45:
	mov	0x33, %r14
	.word 0xfedb84a0  ! 1126: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_rd_46:
	mov	0x4, %r14
	.word 0xf2db8e80  ! 1127: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb5e44000  ! 1131: SAVE_R	save	%r17, %r0, %r26
	.word 0xb3e5a08b  ! 1132: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_83:
	setx	0x250127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb1e4205f  ! 1140: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde5e0ac  ! 1141: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8794a143  ! 1142: WRPR_TT_I	wrpr	%r18, 0x0143, %tt
	.word 0xbbe5a06a  ! 1146: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbbe44000  ! 1148: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb1e48000  ! 1150: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_84:
	setx	0x240212, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_48:
	mov	0x14, %r14
	.word 0xf2f38400  ! 1154: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbfe5e064  ! 1155: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_85:
	setx	0x250012, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_49:
	mov	0x3c4, %r14
	.word 0xf4f38e60  ! 1159: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb7e5a168  ! 1160: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_86:
	setx	0x27010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3c0000  ! 1163: SRA_R	sra 	%r16, %r0, %r31
T0_asi_reg_rd_47:
	mov	0x37, %r14
	.word 0xf6db89e0  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb0954000  ! 1166: ORcc_R	orcc 	%r21, %r0, %r24
	.word 0xb5e5c000  ! 1167: SAVE_R	save	%r23, %r0, %r26
	.word 0xbde5a0d1  ! 1170: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_48:
	mov	0x0, %r14
	.word 0xf2db8e80  ! 1172: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbde4e099  ! 1175: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x87946038  ! 1176: WRPR_TT_I	wrpr	%r17, 0x0038, %tt
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 5)
	.word 0xb3e58000  ! 1179: SAVE_R	save	%r22, %r0, %r25
	.word 0xbaa52046  ! 1181: SUBcc_I	subcc 	%r20, 0x0046, %r29
T0_asi_reg_wr_50:
	mov	0x16, %r14
	.word 0xfaf384a0  ! 1183: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb3e560aa  ! 1185: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e54000  ! 1191: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 21)
	.word 0xb52d3001  ! 1195: SLLX_I	sllx	%r20, 0x0001, %r26
T0_asi_reg_rd_49:
	mov	0x1f, %r14
	.word 0xfedb89e0  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_wr_51:
	mov	0xc, %r14
	.word 0xf2f38e40  ! 1199: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_87:
	setx	0x26031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 1205: SAVE_R	save	%r18, %r0, %r26
	.word 0xbde42082  ! 1213: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_88:
	setx	0x26022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 1219: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_wr_52:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 1223: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb3e46185  ! 1228: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 12)
	.word 0xb2a40000  ! 1236: SUBcc_R	subcc 	%r16, %r0, %r25
cpu_intr_0_89:
	setx	0x250114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 1238: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_90:
	setx	0x250101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 1242: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_wr_53:
	mov	0xa, %r14
	.word 0xfaf38400  ! 1244: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbe1dc000  ! 1248: XOR_R	xor 	%r23, %r0, %r31
cpu_intr_0_91:
	setx	0x30127, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_54:
	mov	0x27, %r14
	.word 0xf6f38e60  ! 1253: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb20d0000  ! 1257: AND_R	and 	%r20, %r0, %r25
	.word 0xb7e5c000  ! 1259: SAVE_R	save	%r23, %r0, %r27
	.word 0xb1e5a1e8  ! 1261: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e5e1c9  ! 1265: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe520ef  ! 1266: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e54000  ! 1267: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_55:
	mov	0x21, %r14
	.word 0xfaf38e40  ! 1272: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_wr_56:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 1275: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_50:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 1276: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb2c461a2  ! 1278: ADDCcc_I	addccc 	%r17, 0x01a2, %r25
cpu_intr_0_92:
	setx	0x240016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 1282: SAVE_R	save	%r23, %r0, %r29
	.word 0xbde421c7  ! 1283: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e4a000  ! 1284: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbb7c8400  ! 1285: MOVR_R	movre	%r18, %r0, %r29
	.word 0xb0952070  ! 1286: ORcc_I	orcc 	%r20, 0x0070, %r24
T0_asi_reg_rd_51:
	mov	0x3c1, %r14
	.word 0xfadb8e80  ! 1287: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb9e4601e  ! 1290: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e44000  ! 1293: SAVE_R	save	%r17, %r0, %r25
	.word 0xb5e44000  ! 1294: SAVE_R	save	%r17, %r0, %r26
	.word 0xbe95c000  ! 1295: ORcc_R	orcc 	%r23, %r0, %r31
cpu_intr_0_93:
	setx	0x270000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 1302: SAVE_R	save	%r20, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_94:
	setx	0x27023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4609c  ! 1308: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, c)
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_95:
	setx	0x240317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_96:
	setx	0x270224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_97:
	setx	0x27031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 0)
	.word 0xb12c4000  ! 1322: SLL_R	sll 	%r17, %r0, %r24
T0_asi_reg_rd_52:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 1323: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb1e50000  ! 1329: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_98:
	setx	0x260327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1351000  ! 1333: SRLX_R	srlx	%r20, %r0, %r24
	.word 0xb5e4a1df  ! 1336: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e58000  ! 1337: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_53:
	mov	0x1a, %r14
	.word 0xfcdb84a0  ! 1340: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb77c8400  ! 1349: MOVR_R	movre	%r18, %r0, %r27
	.word 0xb9e4c000  ! 1351: SAVE_R	save	%r19, %r0, %r28
	.word 0xbde4e04b  ! 1352: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb7e4a03b  ! 1356: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_rd_54:
	mov	0x2f, %r14
	.word 0xf4db89e0  ! 1361: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 21)
	.word 0xbaad4000  ! 1364: ANDNcc_R	andncc 	%r21, %r0, %r29
	.word 0xbbe421b6  ! 1366: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe54000  ! 1367: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_57:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 1371: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb9e40000  ! 1376: SAVE_R	save	%r16, %r0, %r28
	.word 0xb2a5e1cc  ! 1379: SUBcc_I	subcc 	%r23, 0x01cc, %r25
cpu_intr_0_99:
	setx	0x260123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2d8000  ! 1381: ANDN_R	andn 	%r22, %r0, %r30
	.word 0xb9e4a0a1  ! 1384: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_55:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb4b50000  ! 1388: SUBCcc_R	orncc 	%r20, %r0, %r26
T0_asi_reg_wr_58:
	mov	0x3c2, %r14
	.word 0xf2f38400  ! 1389: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbf353001  ! 1392: SRLX_I	srlx	%r20, 0x0001, %r31
T0_asi_reg_wr_59:
	mov	0x3, %r14
	.word 0xf4f38400  ! 1393: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 8)
	.word 0xb5e42039  ! 1396: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e46185  ! 1398: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_100:
	setx	0x2b0013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_101:
	setx	0x290100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e42052  ! 1407: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe4e17f  ! 1408: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e561e1  ! 1411: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_102:
	setx	0x290007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 28)
	.word 0xb5510000  ! 1415: RDPR_TICK	<illegal instruction>
	.word 0xbde46105  ! 1421: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb6ad8000  ! 1426: ANDNcc_R	andncc 	%r22, %r0, %r27
	.word 0xbde5c000  ! 1427: SAVE_R	save	%r23, %r0, %r30
	.word 0xb894c000  ! 1431: ORcc_R	orcc 	%r19, %r0, %r28
	.word 0xbf51c000  ! 1432: RDPR_TL	<illegal instruction>
	.word 0xbfe5606c  ! 1433: SAVE_I	save	%r21, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb095c000  ! 1436: ORcc_R	orcc 	%r23, %r0, %r24
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb5e54000  ! 1442: SAVE_R	save	%r21, %r0, %r26
	.word 0xbde54000  ! 1444: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 16)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e561b1  ! 1451: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e4c000  ! 1452: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_103:
	setx	0x290122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_104:
	setx	0x29003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_105:
	setx	0x290137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_106:
	setx	0x29013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_107:
	setx	0x2a013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_108:
	setx	0x290308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_109:
	setx	0x2a030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_60:
	mov	0x11, %r14
	.word 0xf2f38400  ! 1466: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbe8c20a2  ! 1473: ANDcc_I	andcc 	%r16, 0x00a2, %r31
	.word 0xb9e5e03c  ! 1477: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb82520f9  ! 1480: SUB_I	sub 	%r20, 0x00f9, %r28
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 36)
	.word 0xb3510000  ! 1484: RDPR_TICK	<illegal instruction>
	.word 0xb9e54000  ! 1486: SAVE_R	save	%r21, %r0, %r28
	.word 0xb9e44000  ! 1488: SAVE_R	save	%r17, %r0, %r28
	.word 0xb5641800  ! 1490: MOVcc_R	<illegal instruction>
	.word 0xb1e5e0c3  ! 1492: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e52186  ! 1496: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e421c4  ! 1497: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_rd_56:
	mov	0x4, %r14
	.word 0xf2db8400  ! 1503: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb43ca143  ! 1504: XNOR_I	xnor 	%r18, 0x0143, %r26
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_110:
	setx	0x2b0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2458000  ! 1510: ADDC_R	addc 	%r22, %r0, %r25
	.word 0xbde54000  ! 1511: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_rd_57:
	mov	0x32, %r14
	.word 0xfedb8e80  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb3e5e0ca  ! 1517: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_111:
	setx	0x280239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 1520: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb5e461a8  ! 1522: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_112:
	setx	0x2b0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_113:
	setx	0x290203, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_58:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 1528: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 2b)
	.word 0xba9c6000  ! 1531: XORcc_I	xorcc 	%r17, 0x0000, %r29
cpu_intr_0_114:
	setx	0x2a0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_115:
	setx	0x2a013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5205a  ! 1535: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_116:
	setx	0x280004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_117:
	setx	0x2b0216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_118:
	setx	0x280130, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_59:
	mov	0x23, %r14
	.word 0xf6db8e80  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T0_asi_reg_rd_60:
	mov	0x2c, %r14
	.word 0xfedb8e40  ! 1548: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb935c000  ! 1553: SRL_R	srl 	%r23, %r0, %r28
	.word 0xbbe561cc  ! 1555: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_rd_61:
	mov	0x26, %r14
	.word 0xf4db8e60  ! 1556: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb9e560b5  ! 1557: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbfe40000  ! 1559: SAVE_R	save	%r16, %r0, %r31
	.word 0xb5e54000  ! 1560: SAVE_R	save	%r21, %r0, %r26
	.word 0xb1e48000  ! 1563: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_119:
	setx	0x29020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 1565: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 10)
	.word 0xb7e54000  ! 1571: SAVE_R	save	%r21, %r0, %r27
	.word 0xb3e561ac  ! 1572: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 33)
	.word 0xb5e58000  ! 1580: SAVE_R	save	%r22, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4a04f  ! 1585: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_62:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 1589: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_63:
	mov	0x1f, %r14
	.word 0xf2db84a0  ! 1592: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbbe4c000  ! 1593: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_120:
	setx	0x2b0005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 20)
	.word 0xb7e5c000  ! 1599: SAVE_R	save	%r23, %r0, %r27
	.word 0xb92d6001  ! 1600: SLL_I	sll 	%r21, 0x0001, %r28
cpu_intr_0_121:
	setx	0x280201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x899560f6  ! 1604: WRPR_TICK_I	wrpr	%r21, 0x00f6, %tick
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 27)
	.word 0xb7e5a013  ! 1606: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x9195e0b0  ! 1608: WRPR_PIL_I	wrpr	%r23, 0x00b0, %pil
T0_asi_reg_wr_61:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 1610: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb9e40000  ! 1611: SAVE_R	save	%r16, %r0, %r28
	.word 0xbfe420a8  ! 1613: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe5c000  ! 1615: SAVE_R	save	%r23, %r0, %r31
	.word 0xbfe40000  ! 1617: SAVE_R	save	%r16, %r0, %r31
	.word 0xb22d218c  ! 1626: ANDN_I	andn 	%r20, 0x018c, %r25
	.word 0xb6ad8000  ! 1627: ANDNcc_R	andncc 	%r22, %r0, %r27
cpu_intr_0_122:
	setx	0x2a0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_64:
	mov	0x10, %r14
	.word 0xf4db8e40  ! 1633: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5e44000  ! 1638: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_65:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 1640: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_wr_62:
	mov	0x1a, %r14
	.word 0xfaf38e40  ! 1641: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_66:
	mov	0x1f, %r14
	.word 0xf6db84a0  ! 1650: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_wr_63:
	mov	0x37, %r14
	.word 0xf6f38e80  ! 1651: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb9e44000  ! 1652: SAVE_R	save	%r17, %r0, %r28
	.word 0xbfe54000  ! 1655: SAVE_R	save	%r21, %r0, %r31
	.word 0xbfe5200f  ! 1657: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_123:
	setx	0x29001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_64:
	mov	0x3c7, %r14
	.word 0xf0f38e80  ! 1661: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 25)
	.word 0xbde54000  ! 1663: SAVE_R	save	%r21, %r0, %r30
	.word 0xbab5c000  ! 1666: ORNcc_R	orncc 	%r23, %r0, %r29
T0_asi_reg_rd_67:
	mov	0x1a, %r14
	.word 0xf2db8e80  ! 1668: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb3e5c000  ! 1670: SAVE_R	save	%r23, %r0, %r25
	.word 0xb9e5a1df  ! 1671: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_65:
	mov	0x31, %r14
	.word 0xf6f38e60  ! 1672: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb9e54000  ! 1676: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_66:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 1681: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1e5c000  ! 1683: SAVE_R	save	%r23, %r0, %r24
	.word 0xb2ac0000  ! 1688: ANDNcc_R	andncc 	%r16, %r0, %r25
cpu_intr_0_124:
	setx	0x29002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a021  ! 1691: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_125:
	setx	0x2b0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 1693: SAVE_R	save	%r19, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_67:
	mov	0x3c0, %r14
	.word 0xfaf389e0  ! 1697: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb1e54000  ! 1699: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_126:
	setx	0x29011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e460a3  ! 1702: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e54000  ! 1704: SAVE_R	save	%r21, %r0, %r26
	.word 0xb7e5c000  ! 1705: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_127:
	setx	0x280207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_128:
	setx	0x290016, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_68:
	mov	0xf, %r14
	.word 0xfadb8e60  ! 1718: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_129:
	setx	0x2b0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e04a  ! 1720: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_130:
	setx	0x2b013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e461a3  ! 1726: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e42082  ! 1730: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_131:
	setx	0x2a0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a041  ! 1732: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde5e123  ! 1734: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e40000  ! 1736: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 2)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e58000  ! 1745: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_69:
	mov	0x3c5, %r14
	.word 0xf0db84a0  ! 1750: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb2ade157  ! 1751: ANDNcc_I	andncc 	%r23, 0x0157, %r25
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb9e40000  ! 1753: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_132:
	setx	0x290318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_133:
	setx	0x290301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_134:
	setx	0x28033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_135:
	setx	0x290106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a058  ! 1765: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_136:
	setx	0x280016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 1767: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbbe4c000  ! 1775: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_wr_68:
	mov	0x34, %r14
	.word 0xf8f38e60  ! 1776: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_137:
	setx	0x280229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_138:
	setx	0x2a011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e192  ! 1779: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e54000  ! 1781: SAVE_R	save	%r21, %r0, %r27
	.word 0xbde5610d  ! 1785: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_rd_70:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 1788: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1e44000  ! 1789: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbfe42119  ! 1794: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_139:
	setx	0x2b0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 1797: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_wr_69:
	mov	0x1e, %r14
	.word 0xfef389e0  ! 1798: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe48000  ! 1805: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_71:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 1806: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_72:
	mov	0xb, %r14
	.word 0xf2db8e40  ! 1809: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbbe4e06e  ! 1810: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_140:
	setx	0x29002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_141:
	setx	0x2a0328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_142:
	setx	0x2a0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 1821: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_73:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_143:
	setx	0x2b021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 1826: SAVE_R	save	%r22, %r0, %r31
	.word 0xbbe48000  ! 1827: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_70:
	mov	0x3c3, %r14
	.word 0xf8f389e0  ! 1828: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbfe42058  ! 1833: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e4c000  ! 1835: SAVE_R	save	%r19, %r0, %r26
	.word 0xb7e40000  ! 1836: SAVE_R	save	%r16, %r0, %r27
	.word 0xb3e5a198  ! 1840: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, c)
	.word 0xbbe54000  ! 1843: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_144:
	setx	0x280305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_wr_71:
	mov	0x15, %r14
	.word 0xfcf38400  ! 1852: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb7e4c000  ! 1853: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 21)
	.word 0xb3e4a033  ! 1859: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_145:
	setx	0x290207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb1e54000  ! 1865: SAVE_R	save	%r21, %r0, %r24
	.word 0xb1e4a01e  ! 1869: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_146:
	setx	0x29003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_147:
	setx	0x28010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb405e1e9  ! 1873: ADD_I	add 	%r23, 0x01e9, %r26
	.word 0xbbe40000  ! 1875: SAVE_R	save	%r16, %r0, %r29
	.word 0xbfe460d7  ! 1876: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_72:
	mov	0x31, %r14
	.word 0xfcf38e40  ! 1878: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 34)
	.word 0xb1e58000  ! 1883: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_73:
	mov	0x3c3, %r14
	.word 0xf6f384a0  ! 1885: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 30)
	.word 0xb7e48000  ! 1894: SAVE_R	save	%r18, %r0, %r27
	.word 0xbde5a09b  ! 1896: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde5e0ce  ! 1897: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_148:
	setx	0x2d012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e146  ! 1901: SAVE_I	save	%r23, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde420ae  ! 1904: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde5a1b5  ! 1905: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_149:
	setx	0x2c0114, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_74:
	mov	0x21, %r14
	.word 0xfcf38e60  ! 1909: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_150:
	setx	0x2c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_74:
	mov	0x0, %r14
	.word 0xf4db89e0  ! 1921: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T0_asi_reg_wr_75:
	mov	0x38, %r14
	.word 0xfef38400  ! 1922: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbfe5c000  ! 1923: SAVE_R	save	%r23, %r0, %r31
	.word 0xb5e5c000  ! 1925: SAVE_R	save	%r23, %r0, %r26
	.word 0xb3e4e0ae  ! 1926: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e44000  ! 1928: SAVE_R	save	%r17, %r0, %r27
	.word 0xb21d21f0  ! 1930: XOR_I	xor 	%r20, 0x01f0, %r25
	.word 0xb7e5e0cb  ! 1936: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_151:
	setx	0x2c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 1939: SAVE_R	save	%r19, %r0, %r27
	.word 0xb3e50000  ! 1940: SAVE_R	save	%r20, %r0, %r25
	.word 0xbde4a031  ! 1943: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe421bd  ! 1944: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e5c000  ! 1946: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_76:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 1955: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbb350000  ! 1956: SRL_R	srl 	%r20, %r0, %r29
	.word 0xbfe40000  ! 1960: SAVE_R	save	%r16, %r0, %r31
	.word 0xb7e40000  ! 1962: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_rd_75:
	mov	0xd, %r14
	.word 0xf8db84a0  ! 1966: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_152:
	setx	0x2e0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 1972: SAVE_R	save	%r18, %r0, %r31
	.word 0xb13d2001  ! 1973: SRA_I	sra 	%r20, 0x0001, %r24
	.word 0xb5e44000  ! 1975: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_153:
	setx	0x2f013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a5a158  ! 1978: SUBcc_I	subcc 	%r22, 0x0158, %r26
	.word 0xbbe50000  ! 1979: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 31)
	.word 0xbe0521e7  ! 1981: ADD_I	add 	%r20, 0x01e7, %r31
	.word 0xb5e56138  ! 1983: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_154:
	setx	0x2f020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 10)
	.word 0xb5e42142  ! 1988: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe460e0  ! 1989: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb49d4000  ! 1992: XORcc_R	xorcc 	%r21, %r0, %r26
T0_asi_reg_wr_77:
	mov	0x3c3, %r14
	.word 0xf2f38400  ! 1993: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_0_155:
	setx	0x2f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_156:
	setx	0x2e0102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_78:
	mov	0x15, %r14
	.word 0xfaf38e60  ! 2005: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbde5a17d  ! 2007: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb004201c  ! 2009: ADD_I	add 	%r16, 0x001c, %r24
	.word 0xb4854000  ! 2010: ADDcc_R	addcc 	%r21, %r0, %r26
	.word 0xbfe4a063  ! 2012: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_79:
	mov	0x3c4, %r14
	.word 0xf4f384a0  ! 2014: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb3e5e1e6  ! 2016: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_157:
	setx	0x2c001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_80:
	mov	0x1, %r14
	.word 0xf8f38e40  ! 2019: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_158:
	setx	0x2c0206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 6)
	.word 0xb9353001  ! 2024: SRLX_I	srlx	%r20, 0x0001, %r28
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_wr_81:
	mov	0x18, %r14
	.word 0xfcf38400  ! 2028: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb32cd000  ! 2029: SLLX_R	sllx	%r19, %r0, %r25
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb7e4a198  ! 2032: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_159:
	setx	0x2d012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e1ff  ! 2045: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_rd_76:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 2050: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_rd_77:
	mov	0x34, %r14
	.word 0xf2db8400  ! 2056: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_wr_82:
	mov	0x2d, %r14
	.word 0xfef38400  ! 2061: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbfe40000  ! 2062: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_160:
	setx	0x2e000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91942112  ! 2065: WRPR_PIL_I	wrpr	%r16, 0x0112, %pil
	.word 0xb3e56152  ! 2066: SAVE_I	save	%r21, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_78:
	mov	0x1b, %r14
	.word 0xfcdb8e60  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb17ce401  ! 2071: MOVR_I	movre	%r19, 0x1, %r24
	.word 0xbd7de401  ! 2072: MOVR_I	movre	%r23, 0x1, %r30
	.word 0xb5e4c000  ! 2076: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_rd_79:
	mov	0x2b, %r14
	.word 0xf0db8e60  ! 2077: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb7e4e03c  ! 2078: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde4a09c  ! 2083: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_80:
	mov	0x5, %r14
	.word 0xf2db8e80  ! 2085: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbde4607b  ! 2087: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e40000  ! 2088: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_161:
	setx	0x2e013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_162:
	setx	0x2f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_163:
	setx	0x2f011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_164:
	setx	0x2e0310, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_83:
	mov	0x3c8, %r14
	.word 0xf2f389e0  ! 2099: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb9e44000  ! 2100: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_165:
	setx	0x2d0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 2105: RDPR_PIL	<illegal instruction>
cpu_intr_0_166:
	setx	0x2f0103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_84:
	mov	0x1b, %r14
	.word 0xf6f38e40  ! 2108: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_81:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 2113: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_167:
	setx	0x2e000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e0d4  ! 2118: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e44000  ! 2119: SAVE_R	save	%r17, %r0, %r24
	.word 0xbde4a1d2  ! 2120: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e4e0e6  ! 2122: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe5e1c6  ! 2124: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe421d3  ! 2125: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_168:
	setx	0x2e0222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 16)
	.word 0xbbe4a192  ! 2131: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_169:
	setx	0x2e021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c4c000  ! 2137: ADDCcc_R	addccc 	%r19, %r0, %r28
	.word 0xb5e48000  ! 2139: SAVE_R	save	%r18, %r0, %r26
	.word 0xb5e58000  ! 2142: SAVE_R	save	%r22, %r0, %r26
	.word 0xb5e44000  ! 2143: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_wr_85:
	mov	0x37, %r14
	.word 0xfaf384a0  ! 2144: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb5e4607b  ! 2147: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_170:
	setx	0x2e022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 2157: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_wr_86:
	mov	0x17, %r14
	.word 0xf6f38e80  ! 2160: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_171:
	setx	0x2d003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594a1e1  ! 2166: WRPR_TSTATE_I	wrpr	%r18, 0x01e1, %tstate
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 34)
	.word 0xbabd6058  ! 2171: XNORcc_I	xnorcc 	%r21, 0x0058, %r29
T0_asi_reg_wr_87:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 2174: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfe42113  ! 2177: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_88:
	mov	0x25, %r14
	.word 0xf2f38e40  ! 2179: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_89:
	mov	0x3c6, %r14
	.word 0xfef38e60  ! 2180: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbfe58000  ! 2181: SAVE_R	save	%r22, %r0, %r31
	.word 0xb5e420fa  ! 2182: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e54000  ! 2183: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_172:
	setx	0x2f0316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_173:
	setx	0x2f0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e093  ! 2194: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde40000  ! 2195: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 27)
	.word 0xb3e44000  ! 2197: SAVE_R	save	%r17, %r0, %r25
	.word 0xb2158000  ! 2205: OR_R	or 	%r22, %r0, %r25
	.word 0xbbe561b2  ! 2208: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_174:
	setx	0x2e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_82:
	mov	0x34, %r14
	.word 0xf2db8e60  ! 2211: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_83:
	mov	0xc, %r14
	.word 0xf8db8e80  ! 2219: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_wr_90:
	mov	0x22, %r14
	.word 0xfaf38e60  ! 2220: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbbe5c000  ! 2221: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_175:
	setx	0x2c0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e035  ! 2224: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, d)
	.word 0xb1e5a0fc  ! 2234: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 38)
	.word 0x8f902002  ! 2238: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_176:
	setx	0x2c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a199  ! 2242: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_84:
	mov	0x3c7, %r14
	.word 0xfcdb8e80  ! 2244: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb62da1c9  ! 2250: ANDN_I	andn 	%r22, 0x01c9, %r27
	.word 0xbde40000  ! 2251: SAVE_R	save	%r16, %r0, %r30
	.word 0xb1e54000  ! 2252: SAVE_R	save	%r21, %r0, %r24
	.word 0xbfe4c000  ! 2254: SAVE_R	save	%r19, %r0, %r31
	.word 0xbbe4a1b8  ! 2256: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_177:
	setx	0x2f002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e109  ! 2270: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 37)
	.word 0xb5e4c000  ! 2275: SAVE_R	save	%r19, %r0, %r26
	.word 0xb3e48000  ! 2277: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 32)
	.word 0xbde58000  ! 2279: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_178:
	setx	0x2e020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_179:
	setx	0x2e0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 2283: RDPR_TNPC	<illegal instruction>
	.word 0xb3e56180  ! 2284: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e48000  ! 2285: SAVE_R	save	%r18, %r0, %r27
	.word 0xb8046045  ! 2286: ADD_I	add 	%r17, 0x0045, %r28
	.word 0xb9e48000  ! 2291: SAVE_R	save	%r18, %r0, %r28
	.word 0xb9e5a065  ! 2299: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe50000  ! 2303: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_wr_91:
	mov	0x23, %r14
	.word 0xfaf38e60  ! 2305: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb3e58000  ! 2306: SAVE_R	save	%r22, %r0, %r25
	.word 0xbde56123  ! 2311: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e56019  ! 2313: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e4c000  ! 2316: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e46195  ! 2318: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_85:
	mov	0x12, %r14
	.word 0xfedb8e40  ! 2322: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_92:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 2325: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_180:
	setx	0x2f0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b40000  ! 2328: ORNcc_R	orncc 	%r16, %r0, %r28
	.word 0xb5e4e1ae  ! 2331: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbaa420d9  ! 2334: SUBcc_I	subcc 	%r16, 0x00d9, %r29
	.word 0xb13c2001  ! 2335: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0xb3e5a037  ! 2337: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde4a02f  ! 2339: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e50000  ! 2340: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_93:
	mov	0x2e, %r14
	.word 0xfcf384a0  ! 2343: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbfe5a0c8  ! 2344: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e48000  ! 2347: SAVE_R	save	%r18, %r0, %r27
	.word 0xbde58000  ! 2348: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 11)
	.word 0xb5e5a0b7  ! 2355: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_181:
	setx	0x31003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_182:
	setx	0x300324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 2370: SAVE_R	save	%r19, %r0, %r27
	.word 0xbbe50000  ! 2372: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe4218f  ! 2374: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_94:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 2375: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb1e50000  ! 2378: SAVE_R	save	%r20, %r0, %r24
	.word 0xbebca076  ! 2379: XNORcc_I	xnorcc 	%r18, 0x0076, %r31
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_183:
	setx	0x33021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 2384: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_86:
	mov	0x0, %r14
	.word 0xfadb84a0  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5e5c000  ! 2386: SAVE_R	save	%r23, %r0, %r26
	.word 0xb92cd000  ! 2390: SLLX_R	sllx	%r19, %r0, %r28
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_87:
	mov	0x0, %r14
	.word 0xf2db8400  ! 2393: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb7e48000  ! 2396: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_wr_95:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 2399: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbbe5c000  ! 2402: SAVE_R	save	%r23, %r0, %r29
	.word 0xb3e54000  ! 2404: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_rd_88:
	mov	0x9, %r14
	.word 0xf2db89e0  ! 2405: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_rd_89:
	mov	0x6, %r14
	.word 0xfedb8e60  ! 2407: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb60520dd  ! 2408: ADD_I	add 	%r20, 0x00dd, %r27
T0_asi_reg_rd_90:
	mov	0x3c2, %r14
	.word 0xfcdb84a0  ! 2409: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb5e5c000  ! 2410: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_184:
	setx	0x33000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 2412: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_91:
	mov	0x8, %r14
	.word 0xf0db8e40  ! 2415: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb60dc000  ! 2416: AND_R	and 	%r23, %r0, %r27
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb68c0000  ! 2420: ANDcc_R	andcc 	%r16, %r0, %r27
T0_asi_reg_wr_96:
	mov	0x1d, %r14
	.word 0xfef389e0  ! 2421: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_wr_97:
	mov	0x22, %r14
	.word 0xfaf38e40  ! 2428: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_92:
	mov	0x1d, %r14
	.word 0xfadb8e40  ! 2431: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7e5e1b7  ! 2434: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_185:
	setx	0x300328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc840000  ! 2440: ADDcc_R	addcc 	%r16, %r0, %r30
	.word 0xb9e4e18d  ! 2441: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e561f7  ! 2442: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e4e1a6  ! 2448: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_93:
	mov	0x24, %r14
	.word 0xfedb8400  ! 2451: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_wr_98:
	mov	0x10, %r14
	.word 0xfcf38e80  ! 2452: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_186:
	setx	0x330011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_94:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 2461: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_187:
	setx	0x33020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0d5  ! 2466: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e48000  ! 2467: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_188:
	setx	0x30030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_99:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 2471: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbe48000  ! 2476: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_95:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 2478: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_189:
	setx	0x30032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_100:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 2487: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_96:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 2489: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_190:
	setx	0x31033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1ce014  ! 2495: XOR_I	xor 	%r19, 0x0014, %r31
	.word 0xbfe50000  ! 2497: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_97:
	mov	0x3c2, %r14
	.word 0xf0db89e0  ! 2498: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_98:
	mov	0x0, %r14
	.word 0xf8db8e60  ! 2501: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb014c000  ! 2503: OR_R	or 	%r19, %r0, %r24
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb9e5e0f3  ! 2511: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_101:
	mov	0x7, %r14
	.word 0xf4f389e0  ! 2513: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbde460aa  ! 2514: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_wr_102:
	mov	0x2, %r14
	.word 0xf6f384a0  ! 2516: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb9e46155  ! 2519: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_191:
	setx	0x320020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 2523: SAVE_R	save	%r20, %r0, %r28
	.word 0xbbe48000  ! 2525: SAVE_R	save	%r18, %r0, %r29
	.word 0xb9510000  ! 2527: RDPR_TICK	<illegal instruction>
T0_asi_reg_rd_99:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 2529: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_rd_100:
	mov	0x2d, %r14
	.word 0xf0db89e0  ! 2537: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb1e5c000  ! 2539: SAVE_R	save	%r23, %r0, %r24
	.word 0x8394a1e4  ! 2540: WRPR_TNPC_I	wrpr	%r18, 0x01e4, %tnpc
	.word 0xbde48000  ! 2543: SAVE_R	save	%r18, %r0, %r30
	.word 0xb1e5a0ec  ! 2545: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e5a1dc  ! 2547: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_192:
	setx	0x310229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 2553: SAVE_R	save	%r23, %r0, %r27
	.word 0xb09d0000  ! 2554: XORcc_R	xorcc 	%r20, %r0, %r24
cpu_intr_0_193:
	setx	0x33023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 2557: SAVE_R	save	%r22, %r0, %r25
	.word 0xb5e52118  ! 2558: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e40000  ! 2559: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 25)
	.word 0x8195e084  ! 2561: WRPR_TPC_I	wrpr	%r23, 0x0084, %tpc
cpu_intr_0_194:
	setx	0x310320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 2565: SAVE_R	save	%r20, %r0, %r25
	.word 0xb69da13f  ! 2566: XORcc_I	xorcc 	%r22, 0x013f, %r27
T0_asi_reg_rd_101:
	mov	0x1a, %r14
	.word 0xfcdb84a0  ! 2567: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_0_195:
	setx	0x31001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a1c4  ! 2569: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_196:
	setx	0x330313, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_103:
	mov	0xe, %r14
	.word 0xf8f384a0  ! 2574: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb044a11b  ! 2577: ADDC_I	addc 	%r18, 0x011b, %r24
cpu_intr_0_197:
	setx	0x33023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a1f0  ! 2581: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_104:
	mov	0x2e, %r14
	.word 0xf0f38e80  ! 2582: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbfe48000  ! 2584: SAVE_R	save	%r18, %r0, %r31
	.word 0xb3e44000  ! 2585: SAVE_R	save	%r17, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_102:
	mov	0x20, %r14
	.word 0xf2db89e0  ! 2593: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_rd_103:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 2600: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbfe4a04a  ! 2601: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_105:
	mov	0x1c, %r14
	.word 0xf0f38e40  ! 2604: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbde4a1c1  ! 2605: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_104:
	mov	0x2a, %r14
	.word 0xfadb89e0  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_wr_106:
	mov	0x7, %r14
	.word 0xfaf38e60  ! 2609: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb5e4c000  ! 2611: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_198:
	setx	0x310235, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_107:
	mov	0x4, %r14
	.word 0xfef38e40  ! 2622: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfe4c000  ! 2623: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_199:
	setx	0x330212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, a)
	.word 0xb9e50000  ! 2630: SAVE_R	save	%r20, %r0, %r28
	.word 0xb7e5c000  ! 2631: SAVE_R	save	%r23, %r0, %r27
	.word 0xb6b5c000  ! 2632: SUBCcc_R	orncc 	%r23, %r0, %r27
	.word 0xb9e5c000  ! 2634: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_105:
	mov	0x2a, %r14
	.word 0xf2db89e0  ! 2635: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5c000  ! 2640: SAVE_R	save	%r23, %r0, %r28
	.word 0xbde54000  ! 2641: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_rd_106:
	mov	0xc, %r14
	.word 0xfadb89e0  ! 2644: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbab48000  ! 2645: ORNcc_R	orncc 	%r18, %r0, %r29
	.word 0xb3e5c000  ! 2646: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_200:
	setx	0x320216, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_108:
	mov	0x23, %r14
	.word 0xf8f38400  ! 2652: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_107:
	mov	0x9, %r14
	.word 0xfcdb8e80  ! 2653: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 3e)
	.word 0xba14c000  ! 2657: OR_R	or 	%r19, %r0, %r29
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 9)
	.word 0xbbe4e185  ! 2660: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_109:
	mov	0x16, %r14
	.word 0xfcf389e0  ! 2661: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_201:
	setx	0x300323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_202:
	setx	0x300020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 13)
	.word 0x8f902001  ! 2665: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xbde50000  ! 2666: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e5a1eb  ! 2670: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e5a07b  ! 2672: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_110:
	mov	0x3, %r14
	.word 0xf0f384a0  ! 2673: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbbe4a014  ! 2675: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_203:
	setx	0x310033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49da0d8  ! 2684: XORcc_I	xorcc 	%r22, 0x00d8, %r26
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_204:
	setx	0x3033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_111:
	mov	0x27, %r14
	.word 0xfcf38e60  ! 2689: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_wr_112:
	mov	0x31, %r14
	.word 0xf6f384a0  ! 2690: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb1e48000  ! 2697: SAVE_R	save	%r18, %r0, %r24
	.word 0xb9e58000  ! 2698: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 24)
	.word 0xb1e5c000  ! 2705: SAVE_R	save	%r23, %r0, %r24
	.word 0xb1e48000  ! 2706: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_rd_108:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 2707: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_205:
	setx	0x33032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a148  ! 2711: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e58000  ! 2712: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb4ac216c  ! 2714: ANDNcc_I	andncc 	%r16, 0x016c, %r26
	.word 0xb5e4e1ad  ! 2715: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe54000  ! 2716: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_wr_113:
	mov	0x2, %r14
	.word 0xfcf38400  ! 2717: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb9e4e195  ! 2718: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 14)
	.word 0xb9e52137  ! 2720: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb82dc000  ! 2723: ANDN_R	andn 	%r23, %r0, %r28
	.word 0xba9c4000  ! 2728: XORcc_R	xorcc 	%r17, %r0, %r29
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 14)
	.word 0xb3e50000  ! 2732: SAVE_R	save	%r20, %r0, %r25
	.word 0xb8c54000  ! 2734: ADDCcc_R	addccc 	%r21, %r0, %r28
	.word 0xbbe56133  ! 2735: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e561b6  ! 2738: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e54000  ! 2740: SAVE_R	save	%r21, %r0, %r24
	.word 0xbde48000  ! 2743: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_wr_114:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 2744: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_109:
	mov	0x27, %r14
	.word 0xf6db89e0  ! 2747: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb7e46072  ! 2748: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_206:
	setx	0x300037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe421f8  ! 2753: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 31)
	.word 0xb13cb001  ! 2756: SRAX_I	srax	%r18, 0x0001, %r24
	.word 0xb3e4603d  ! 2757: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe44000  ! 2758: SAVE_R	save	%r17, %r0, %r29
	.word 0xbde48000  ! 2759: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb7e4615b  ! 2765: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_207:
	setx	0x30001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_110:
	mov	0x3c4, %r14
	.word 0xf2db84a0  ! 2768: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T0_asi_reg_wr_115:
	mov	0x35, %r14
	.word 0xfaf38e80  ! 2771: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_0_208:
	setx	0x300011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 25)
	.word 0xb9e56180  ! 2777: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 9)
	.word 0xbb3de001  ! 2781: SRA_I	sra 	%r23, 0x0001, %r29
	.word 0xb3e4a0c5  ! 2784: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe5e193  ! 2785: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbbe48000  ! 2786: SAVE_R	save	%r18, %r0, %r29
	.word 0xbf7c4400  ! 2787: MOVR_R	movre	%r17, %r0, %r31
	.word 0xb9e56111  ! 2788: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 17)
	.word 0xb3e4e012  ! 2791: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e5c000  ! 2796: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_111:
	mov	0x16, %r14
	.word 0xfadb8e60  ! 2802: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb1e4c000  ! 2803: SAVE_R	save	%r19, %r0, %r24
	.word 0xb7e56142  ! 2805: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb0242057  ! 2806: SUB_I	sub 	%r16, 0x0057, %r24
cpu_intr_0_209:
	setx	0x370311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 2808: SAVE_R	save	%r20, %r0, %r31
	.word 0xb92c7001  ! 2809: SLLX_I	sllx	%r17, 0x0001, %r28
	.word 0xb9e560b1  ! 2812: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e40000  ! 2814: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_210:
	setx	0x37013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb5e58000  ! 2826: SAVE_R	save	%r22, %r0, %r26
	.word 0xbc8c4000  ! 2827: ANDcc_R	andcc 	%r17, %r0, %r30
	.word 0xbe2ca08f  ! 2828: ANDN_I	andn 	%r18, 0x008f, %r31
cpu_intr_0_211:
	setx	0x340231, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_112:
	mov	0x10, %r14
	.word 0xf2db8400  ! 2830: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_rd_113:
	mov	0x1, %r14
	.word 0xf8db8e60  ! 2831: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_114:
	mov	0x37, %r14
	.word 0xfcdb8400  ! 2833: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb7e50000  ! 2836: SAVE_R	save	%r20, %r0, %r27
	.word 0xbfe4a177  ! 2837: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_116:
	mov	0x18, %r14
	.word 0xf2f389e0  ! 2840: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbbe50000  ! 2842: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_212:
	setx	0x34020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe5c000  ! 2847: SAVE_R	save	%r23, %r0, %r29
	.word 0xb9e5a175  ! 2849: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb205208d  ! 2850: ADD_I	add 	%r20, 0x008d, %r25
	.word 0xb1e5e12f  ! 2854: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 20)
	.word 0xb9e50000  ! 2859: SAVE_R	save	%r20, %r0, %r28
	.word 0xb6b4c000  ! 2863: ORNcc_R	orncc 	%r19, %r0, %r27
	.word 0xbde4205b  ! 2865: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb72d8000  ! 2868: SLL_R	sll 	%r22, %r0, %r27
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
	.word 0xb7e4c000  ! 2874: SAVE_R	save	%r19, %r0, %r27
	.word 0xb7e4c000  ! 2875: SAVE_R	save	%r19, %r0, %r27
	.word 0xbcbcc000  ! 2876: XNORcc_R	xnorcc 	%r19, %r0, %r30
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 4)
	.word 0xbeac612f  ! 2888: ANDNcc_I	andncc 	%r17, 0x012f, %r31
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbde58000  ! 2893: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_wr_117:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 2895: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbbe5a0e1  ! 2897: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_213:
	setx	0x360122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe42076  ! 2904: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_118:
	mov	0xa, %r14
	.word 0xfaf38e60  ! 2905: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb9e54000  ! 2906: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_214:
	setx	0x35023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 2909: SAVE_R	save	%r16, %r0, %r29
	.word 0xb9e50000  ! 2910: SAVE_R	save	%r20, %r0, %r28
	.word 0xbbe5a04e  ! 2913: SAVE_I	save	%r22, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe4610b  ! 2915: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_215:
	setx	0x30137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4452099  ! 2919: ADDC_I	addc 	%r20, 0x0099, %r26
cpu_intr_0_216:
	setx	0x340013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_217:
	setx	0x350228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_218:
	setx	0x37012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5600b  ! 2924: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb12d6001  ! 2925: SLL_I	sll 	%r21, 0x0001, %r24
T0_asi_reg_wr_119:
	mov	0x26, %r14
	.word 0xf2f38e80  ! 2929: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 35)
	.word 0xbbe5a118  ! 2936: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb5e56031  ! 2952: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe48000  ! 2954: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_219:
	setx	0x370007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_220:
	setx	0x340207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_221:
	setx	0x35010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 2962: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_222:
	setx	0x340121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 2966: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_223:
	setx	0x350105, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_115:
	mov	0x25, %r14
	.word 0xf2db8e40  ! 2968: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_224:
	setx	0x360223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde520fc  ! 2970: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_225:
	setx	0x360124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33c8000  ! 2974: SRA_R	sra 	%r18, %r0, %r25
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 35)
	.word 0xb3e5c000  ! 2977: SAVE_R	save	%r23, %r0, %r25
	.word 0xb7e421ae  ! 2978: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_226:
	setx	0x34030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 2986: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_227:
	setx	0x36001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 10)
	.word 0xb03ca1f3  ! 3000: XNOR_I	xnor 	%r18, 0x01f3, %r24
	.word 0xb9e4e031  ! 3004: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e50000  ! 3005: SAVE_R	save	%r20, %r0, %r27
	.word 0xb9e5e1c4  ! 3007: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_120:
	mov	0x19, %r14
	.word 0xf8f38e60  ! 3008: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbfe50000  ! 3009: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe56096  ! 3013: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e4c000  ! 3014: SAVE_R	save	%r19, %r0, %r26
	.word 0xb1e44000  ! 3016: SAVE_R	save	%r17, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb13da001  ! 3020: SRA_I	sra 	%r22, 0x0001, %r24
	.word 0xb7e42082  ! 3021: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_wr_121:
	mov	0x2a, %r14
	.word 0xfef389e0  ! 3025: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_228:
	setx	0x37020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 3027: SAVE_R	save	%r20, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 34)
	.word 0xb12ce001  ! 3036: SLL_I	sll 	%r19, 0x0001, %r24
T0_asi_reg_rd_116:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 3038: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_rd_117:
	mov	0x31, %r14
	.word 0xfedb89e0  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_229:
	setx	0x340211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 3049: SAVE_R	save	%r20, %r0, %r25
	.word 0xb1e5c000  ! 3050: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_rd_118:
	mov	0x3c5, %r14
	.word 0xf6db89e0  ! 3051: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_230:
	setx	0x340009, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_119:
	mov	0x30, %r14
	.word 0xfadb8e80  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_0_231:
	setx	0x360332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e56181  ! 3080: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e5c000  ! 3082: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_232:
	setx	0x340105, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_120:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 3088: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbbe40000  ! 3091: SAVE_R	save	%r16, %r0, %r29
	.word 0xb5e4c000  ! 3095: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_122:
	mov	0x2c, %r14
	.word 0xf2f38e40  ! 3096: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_233:
	setx	0x370208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e04b  ! 3100: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbe95a080  ! 3101: ORcc_I	orcc 	%r22, 0x0080, %r31
	.word 0xba950000  ! 3102: ORcc_R	orcc 	%r20, %r0, %r29
	.word 0xb0952011  ! 3103: ORcc_I	orcc 	%r20, 0x0011, %r24
T0_asi_reg_rd_121:
	mov	0x20, %r14
	.word 0xfadb8e80  ! 3107: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_0_234:
	setx	0x370018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6958000  ! 3112: ORcc_R	orcc 	%r22, %r0, %r27
cpu_intr_0_235:
	setx	0x37022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e421f9  ! 3114: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe5c000  ! 3115: SAVE_R	save	%r23, %r0, %r29
	.word 0xb0054000  ! 3116: ADD_R	add 	%r21, %r0, %r24
	.word 0xbc44a136  ! 3117: ADDC_I	addc 	%r18, 0x0136, %r30
	.word 0xbde44000  ! 3118: SAVE_R	save	%r17, %r0, %r30
	.word 0xb1e40000  ! 3119: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_236:
	setx	0x36013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e041  ! 3122: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_122:
	mov	0x20, %r14
	.word 0xf4db84a0  ! 3124: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xba3c619f  ! 3125: XNOR_I	xnor 	%r17, 0x019f, %r29
T0_asi_reg_wr_123:
	mov	0x2a, %r14
	.word 0xf6f38e80  ! 3126: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_237:
	setx	0x36021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_123:
	mov	0x7, %r14
	.word 0xfedb8e80  ! 3135: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbfe4610e  ! 3136: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 36)
	.word 0xbfe58000  ! 3148: SAVE_R	save	%r22, %r0, %r31
	.word 0xb5e50000  ! 3149: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_rd_124:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 3150: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_0_238:
	setx	0x37002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 3153: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_124:
	mov	0x1b, %r14
	.word 0xfcf38e40  ! 3157: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_wr_125:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 3159: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_125:
	mov	0x3c4, %r14
	.word 0xf4db8400  ! 3160: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb5e52126  ! 3163: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 3a)
	.word 0x8f902000  ! 3170: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb2ad6023  ! 3171: ANDNcc_I	andncc 	%r21, 0x0023, %r25
	.word 0xbde4a0c9  ! 3174: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_239:
	setx	0x340221, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe44000  ! 3179: SAVE_R	save	%r17, %r0, %r31
	.word 0xbfe48000  ! 3182: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_240:
	setx	0x360035, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_126:
	mov	0x11, %r14
	.word 0xf2db8400  ! 3184: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb04561bf  ! 3186: ADDC_I	addc 	%r21, 0x01bf, %r24
	.word 0xb9e40000  ! 3187: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_126:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 3190: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbd520000  ! 3191: RDPR_PIL	<illegal instruction>
cpu_intr_0_241:
	setx	0x350022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a14f  ! 3198: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde58000  ! 3199: SAVE_R	save	%r22, %r0, %r30
	.word 0xbde54000  ! 3200: SAVE_R	save	%r21, %r0, %r30
	.word 0xbde4604d  ! 3201: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e58000  ! 3202: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_wr_127:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 3203: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_127:
	mov	0x10, %r14
	.word 0xf4db84a0  ! 3205: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb1e56031  ! 3206: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, f)
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 19)
	.word 0xbeb48000  ! 3211: SUBCcc_R	orncc 	%r18, %r0, %r31
cpu_intr_0_242:
	setx	0x370124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e18f  ! 3217: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e52007  ! 3219: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_243:
	setx	0x36030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_244:
	setx	0x350339, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_128:
	mov	0x20, %r14
	.word 0xf2f38e80  ! 3225: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_rd_128:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 3226: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb5e54000  ! 3227: SAVE_R	save	%r21, %r0, %r26
	.word 0xb1e46194  ! 3228: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e5c000  ! 3230: SAVE_R	save	%r23, %r0, %r27
	.word 0xb1e5c000  ! 3233: SAVE_R	save	%r23, %r0, %r24
	.word 0xb1e54000  ! 3236: SAVE_R	save	%r21, %r0, %r24
	.word 0xbde52175  ! 3237: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_wr_129:
	mov	0x17, %r14
	.word 0xf4f389e0  ! 3239: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb3e5a177  ! 3243: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_130:
	mov	0x9, %r14
	.word 0xfcf38e40  ! 3245: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_245:
	setx	0x3a033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_131:
	mov	0x27, %r14
	.word 0xf0f389e0  ! 3247: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb12cb001  ! 3249: SLLX_I	sllx	%r18, 0x0001, %r24
cpu_intr_0_246:
	setx	0x3a0000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_247:
	setx	0x390034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_rd_129:
	mov	0x3c7, %r14
	.word 0xf4db89e0  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb5e50000  ! 3256: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 20)
	.word 0xb1e5c000  ! 3262: SAVE_R	save	%r23, %r0, %r24
	.word 0xb2ad0000  ! 3263: ANDNcc_R	andncc 	%r20, %r0, %r25
	.word 0xb89da1ea  ! 3264: XORcc_I	xorcc 	%r22, 0x01ea, %r28
cpu_intr_0_248:
	setx	0x380022, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_249:
	setx	0x39011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_130:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 3274: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_250:
	setx	0x39033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_131:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 3277: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_251:
	setx	0x390228, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_132:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 3281: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_133:
	mov	0x27, %r14
	.word 0xf6f38e60  ! 3286: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_rd_132:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 3287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_252:
	setx	0x380104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0dd  ! 3289: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e52081  ! 3292: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb5500000  ! 3298: RDPR_TPC	<illegal instruction>
	.word 0xb7e4a100  ! 3300: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbde5e1bb  ! 3302: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e50000  ! 3304: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_rd_133:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 3307: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 25)
	.word 0xbfe4e08b  ! 3309: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde40000  ! 3310: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 11)
	.word 0xb7e4e0c4  ! 3312: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e44000  ! 3314: SAVE_R	save	%r17, %r0, %r27
	.word 0xbbe4e124  ! 3319: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7518000  ! 3323: RDPR_PSTATE	<illegal instruction>
	.word 0xbde560eb  ! 3325: SAVE_I	save	%r21, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_134:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 3328: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, b)
	.word 0xb0ad61f7  ! 3330: ANDNcc_I	andncc 	%r21, 0x01f7, %r24
	.word 0xbde48000  ! 3336: SAVE_R	save	%r18, %r0, %r30
	.word 0xbc2da0af  ! 3339: ANDN_I	andn 	%r22, 0x00af, %r30
	.word 0xbfe4a069  ! 3341: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_253:
	setx	0x390203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1d8000  ! 3345: XOR_R	xor 	%r22, %r0, %r29
T0_asi_reg_wr_135:
	mov	0xf, %r14
	.word 0xf8f389e0  ! 3351: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_0_254:
	setx	0x39032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_255:
	setx	0x3a0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 3359: RDPR_TT	<illegal instruction>
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_256:
	setx	0x39032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe521fa  ! 3365: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_257:
	setx	0x390119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bcc000  ! 3377: XNORcc_R	xnorcc 	%r19, %r0, %r24
	.word 0xb5e54000  ! 3378: SAVE_R	save	%r21, %r0, %r26
	.word 0xb6b4e0fa  ! 3379: SUBCcc_I	orncc 	%r19, 0x00fa, %r27
T0_asi_reg_rd_134:
	mov	0x32, %r14
	.word 0xfedb8e40  ! 3384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3e5219f  ! 3386: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e4a06f  ! 3388: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe52063  ! 3390: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_258:
	setx	0x3b0011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_135:
	mov	0x13, %r14
	.word 0xf0db8e60  ! 3398: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_259:
	setx	0x390301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9c60be  ! 3400: XORcc_I	xorcc 	%r17, 0x00be, %r30
	.word 0xb7e52156  ! 3402: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbd520000  ! 3403: RDPR_PIL	<illegal instruction>
	.word 0xbbe4a012  ! 3405: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe4a15d  ! 3409: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_260:
	setx	0x38021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_261:
	setx	0x39001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_262:
	setx	0x380139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 5)
	.word 0xb5e4217d  ! 3421: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e40000  ! 3422: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_263:
	setx	0x3b010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_264:
	setx	0x3b020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 3433: SAVE_R	save	%r17, %r0, %r27
	.word 0xbfe4e00e  ! 3435: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_265:
	setx	0x39013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 3440: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_266:
	setx	0x390208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_267:
	setx	0x3b011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_268:
	setx	0x390103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb7e54000  ! 3447: SAVE_R	save	%r21, %r0, %r27
	.word 0xb42dc000  ! 3452: ANDN_R	andn 	%r23, %r0, %r26
cpu_intr_0_269:
	setx	0x390235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 3458: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_270:
	setx	0x39030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe460fe  ! 3463: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e5607e  ! 3464: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde56118  ! 3474: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_271:
	setx	0x38023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 3478: SAVE_R	save	%r16, %r0, %r30
	.word 0xb08561a2  ! 3480: ADDcc_I	addcc 	%r21, 0x01a2, %r24
T0_asi_reg_rd_136:
	mov	0x2, %r14
	.word 0xf4db84a0  ! 3483: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 12)
	.word 0xb7e58000  ! 3489: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_272:
	setx	0x380016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_rd_137:
	mov	0x33, %r14
	.word 0xf4db84a0  ! 3492: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb9e40000  ! 3495: SAVE_R	save	%r16, %r0, %r28
	.word 0xbfe420b5  ! 3497: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e5c000  ! 3500: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_136:
	mov	0x2, %r14
	.word 0xf8f38e60  ! 3501: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 27)
	.word 0xb5e56003  ! 3509: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e54000  ! 3511: SAVE_R	save	%r21, %r0, %r24
	.word 0xb9e5a04f  ! 3513: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_273:
	setx	0x390209, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_137:
	mov	0xb, %r14
	.word 0xf6f38400  ! 3516: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbbe560b6  ! 3518: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_274:
	setx	0x39021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 3520: SAVE_R	save	%r22, %r0, %r26
	.word 0xb1e4c000  ! 3522: SAVE_R	save	%r19, %r0, %r24
	.word 0xbde4a187  ! 3524: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e52079  ! 3527: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_wr_138:
	mov	0x1d, %r14
	.word 0xfaf389e0  ! 3529: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_275:
	setx	0x380017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_276:
	setx	0x3a0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 3536: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_138:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 3538: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbde54000  ! 3539: SAVE_R	save	%r21, %r0, %r30
	.word 0xbfe52094  ! 3541: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb6250000  ! 3542: SUB_R	sub 	%r20, %r0, %r27
cpu_intr_0_277:
	setx	0x3b0327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 6)
	.word 0xbe046073  ! 3555: ADD_I	add 	%r17, 0x0073, %r31
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_139:
	mov	0x27, %r14
	.word 0xf8db8e80  ! 3558: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb9e44000  ! 3559: SAVE_R	save	%r17, %r0, %r28
	.word 0xbde40000  ! 3561: SAVE_R	save	%r16, %r0, %r30
	.word 0xb1e50000  ! 3565: SAVE_R	save	%r20, %r0, %r24
	.word 0xb695c000  ! 3567: ORcc_R	orcc 	%r23, %r0, %r27
	.word 0xbfe4a0e9  ! 3568: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_140:
	mov	0x3c8, %r14
	.word 0xf6db84a0  ! 3570: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb1e5a174  ! 3572: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_278:
	setx	0x39010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_139:
	mov	0x3c6, %r14
	.word 0xf8f389e0  ! 3575: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbbe54000  ! 3576: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_rd_141:
	mov	0x4, %r14
	.word 0xf2db8e80  ! 3578: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbbe5a098  ! 3580: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 9)
	.word 0xbfe48000  ! 3583: SAVE_R	save	%r18, %r0, %r31
	.word 0xb5e4619b  ! 3585: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e50000  ! 3586: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_279:
	setx	0x390336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_280:
	setx	0x3b030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 3592: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_281:
	setx	0x380232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_282:
	setx	0x39031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 31)
	.word 0x9194e075  ! 3599: WRPR_PIL_I	wrpr	%r19, 0x0075, %pil
	.word 0xb4844000  ! 3600: ADDcc_R	addcc 	%r17, %r0, %r26
	.word 0xb5e4c000  ! 3601: SAVE_R	save	%r19, %r0, %r26
	.word 0xbbe5a0e4  ! 3604: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_283:
	setx	0x3a0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_142:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb7e4a124  ! 3613: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb3e5209a  ! 3616: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e5e1c9  ! 3619: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_284:
	setx	0x3a010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 3623: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_wr_140:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 3625: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_rd_143:
	mov	0x29, %r14
	.word 0xf6db84a0  ! 3627: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_0_285:
	setx	0x3b0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e17e  ! 3629: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e5e123  ! 3630: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e420b8  ! 3634: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e5a007  ! 3638: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde52039  ! 3642: SAVE_I	save	%r20, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_141:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 3644: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb5e4e17f  ! 3645: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e44000  ! 3646: SAVE_R	save	%r17, %r0, %r24
	.word 0xbde420f7  ! 3647: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde4e1b5  ! 3648: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7643801  ! 3649: MOVcc_I	<illegal instruction>
	.word 0xb7e4a00a  ! 3650: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe44000  ! 3653: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_286:
	setx	0x3a0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4942056  ! 3655: ORcc_I	orcc 	%r16, 0x0056, %r26
T0_asi_reg_wr_142:
	mov	0x31, %r14
	.word 0xfcf38400  ! 3656: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_144:
	mov	0x38, %r14
	.word 0xf4db8400  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_287:
	setx	0x380328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe248000  ! 3662: SUB_R	sub 	%r18, %r0, %r31
T0_asi_reg_wr_143:
	mov	0x3, %r14
	.word 0xf8f38e80  ! 3663: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb5e50000  ! 3665: SAVE_R	save	%r20, %r0, %r26
	.word 0xb3e5e1e2  ! 3669: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb52d4000  ! 3670: SLL_R	sll 	%r21, %r0, %r26
T0_asi_reg_rd_145:
	mov	0x32, %r14
	.word 0xfedb84a0  ! 3672: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_288:
	setx	0x3b0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a0b2  ! 3677: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbd344000  ! 3678: SRL_R	srl 	%r17, %r0, %r30
cpu_intr_0_289:
	setx	0x3a0011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 27)
	.word 0xbfe5c000  ! 3682: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_290:
	setx	0x3b0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0c4  ! 3690: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe521c5  ! 3692: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e4c000  ! 3695: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_rd_146:
	mov	0x27, %r14
	.word 0xf8db84a0  ! 3697: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb5e4e14b  ! 3698: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e52012  ! 3702: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_rd_147:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 3705: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_291:
	setx	0x3a021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_292:
	setx	0x39003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_293:
	setx	0x3b012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_144:
	mov	0x2e, %r14
	.word 0xf0f38400  ! 3717: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_294:
	setx	0x3e001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_295:
	setx	0x3e0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb57d8400  ! 3728: MOVR_R	movre	%r22, %r0, %r26
	.word 0xb1e46143  ! 3729: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e4e1d5  ! 3731: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_296:
	setx	0x3c013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e460f6  ! 3737: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe48000  ! 3739: SAVE_R	save	%r18, %r0, %r29
	.word 0xb1e40000  ! 3743: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_145:
	mov	0x13, %r14
	.word 0xf6f38400  ! 3744: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_rd_148:
	mov	0x1a, %r14
	.word 0xf2db89e0  ! 3746: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb1e4209c  ! 3748: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, e)
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_149:
	mov	0x32, %r14
	.word 0xf2db8e40  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1e52016  ! 3762: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb2a4a19e  ! 3764: SUBcc_I	subcc 	%r18, 0x019e, %r25
	.word 0xb5e58000  ! 3767: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb3e48000  ! 3770: SAVE_R	save	%r18, %r0, %r25
	.word 0xb5e4e019  ! 3773: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_297:
	setx	0x3f0235, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_150:
	mov	0x6, %r14
	.word 0xfadb8e40  ! 3775: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9e54000  ! 3778: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_298:
	setx	0x3f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88cc000  ! 3782: ANDcc_R	andcc 	%r19, %r0, %r28
T0_asi_reg_rd_151:
	mov	0x3c8, %r14
	.word 0xfcdb84a0  ! 3783: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb3e48000  ! 3785: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_299:
	setx	0x3e0113, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_146:
	mov	0xd, %r14
	.word 0xf2f38400  ! 3789: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbfe50000  ! 3791: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_152:
	mov	0x8, %r14
	.word 0xfcdb8e80  ! 3792: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_rd_153:
	mov	0x2b, %r14
	.word 0xfcdb8e60  ! 3793: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb8244000  ! 3794: SUB_R	sub 	%r17, %r0, %r28
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 6)
	.word 0xbde5c000  ! 3798: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_300:
	setx	0x3e0118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 0)
	.word 0xbfe421fe  ! 3803: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e48000  ! 3807: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_154:
	mov	0x2d, %r14
	.word 0xfedb8e40  ! 3815: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 24)
	.word 0xb9e4617c  ! 3823: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_rd_155:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 3825: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_147:
	mov	0x24, %r14
	.word 0xfef38400  ! 3826: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1e40000  ! 3832: SAVE_R	save	%r16, %r0, %r24
	.word 0xbde4608e  ! 3836: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e4c000  ! 3838: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_301:
	setx	0x3f0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8450000  ! 3840: ADDC_R	addc 	%r20, %r0, %r28
cpu_intr_0_302:
	setx	0x3e023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_303:
	setx	0x3e0114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_wr_148:
	mov	0x3c4, %r14
	.word 0xfaf38400  ! 3850: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_wr_149:
	mov	0x1f, %r14
	.word 0xfcf38400  ! 3853: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_wr_150:
	mov	0xa, %r14
	.word 0xf2f389e0  ! 3857: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_0_304:
	setx	0x3c011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_305:
	setx	0x3e0309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 13)
	.word 0xb7e4a070  ! 3866: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_151:
	mov	0x2b, %r14
	.word 0xf6f38e80  ! 3875: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_306:
	setx	0x3c0104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb5e54000  ! 3879: SAVE_R	save	%r21, %r0, %r26
	.word 0xbbe50000  ! 3880: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_wr_152:
	mov	0x16, %r14
	.word 0xf8f38e80  ! 3885: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 4)
	.word 0xb9e54000  ! 3889: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 27)
	.word 0xbfe44000  ! 3895: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_rd_156:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 3898: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_307:
	setx	0x3e001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_rd_157:
	mov	0x28, %r14
	.word 0xf2db8e40  ! 3905: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbde4a04c  ! 3906: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_158:
	mov	0x9, %r14
	.word 0xfcdb8400  ! 3907: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e50000  ! 3909: SAVE_R	save	%r20, %r0, %r24
	.word 0xbbe5e1ac  ! 3910: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e5a12b  ! 3914: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_159:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 3918: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_308:
	setx	0x3d010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ac0000  ! 3923: ANDNcc_R	andncc 	%r16, %r0, %r24
	.word 0xb9e4a185  ! 3926: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5358000  ! 3927: SRL_R	srl 	%r22, %r0, %r26
	.word 0xb3e48000  ! 3928: SAVE_R	save	%r18, %r0, %r25
	.word 0xbde4c000  ! 3930: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 28)
	.word 0xb0a4a15c  ! 3933: SUBcc_I	subcc 	%r18, 0x015c, %r24
T0_asi_reg_rd_160:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 3934: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbde5e19f  ! 3935: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e48000  ! 3936: SAVE_R	save	%r18, %r0, %r27
	.word 0xbde54000  ! 3938: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_309:
	setx	0x3e020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_161:
	mov	0x15, %r14
	.word 0xf6db8e40  ! 3942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5e46038  ! 3944: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_162:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 3945: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3e56186  ! 3946: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde52043  ! 3947: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_163:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 3949: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb9e4a00e  ! 3950: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe5a168  ! 3952: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe5c000  ! 3954: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_310:
	setx	0x3e010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_311:
	setx	0x3c0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 3960: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_312:
	setx	0x3f002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba85c000  ! 3964: ADDcc_R	addcc 	%r23, %r0, %r29
T0_asi_reg_rd_164:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 3965: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_165:
	mov	0x13, %r14
	.word 0xfadb8400  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb5e50000  ! 3968: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_313:
	setx	0x3d022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_rd_166:
	mov	0x25, %r14
	.word 0xf8db8e40  ! 3981: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_167:
	mov	0x18, %r14
	.word 0xfedb8400  ! 3998: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb9e40000  ! 4000: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_314:
	setx	0x3f0124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_315:
	setx	0x3d0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a180  ! 4009: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, f)
	.word 0xbbe52054  ! 4014: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe58000  ! 4016: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_316:
	setx	0x3f0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e560b9  ! 4022: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_317:
	setx	0x3f023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 33)
	.word 0xb5e5e147  ! 4031: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_168:
	mov	0x11, %r14
	.word 0xfedb89e0  ! 4032: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_318:
	setx	0x3c0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5619d  ! 4035: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_319:
	setx	0x3c0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 4038: SAVE_R	save	%r22, %r0, %r26
	.word 0xb5e521db  ! 4039: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbfe44000  ! 4049: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 39)
	.word 0xb1510000  ! 4051: RDPR_TICK	<illegal instruction>
	.word 0xbbe5a19f  ! 4052: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 32)
	.word 0xb3e4c000  ! 4062: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_320:
	setx	0x3f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a12e  ! 4065: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_169:
	mov	0x8, %r14
	.word 0xf2db84a0  ! 4069: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb4350000  ! 4071: SUBC_R	orn 	%r20, %r0, %r26
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb3e54000  ! 4077: SAVE_R	save	%r21, %r0, %r25
	.word 0xbde4e04b  ! 4078: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 25)
	.word 0xb7e4e0fa  ! 4081: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde5c000  ! 4083: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb73c3001  ! 4087: SRAX_I	srax	%r16, 0x0001, %r27
	.word 0xbbe5606c  ! 4088: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e54000  ! 4090: SAVE_R	save	%r21, %r0, %r27
	.word 0xb0ad0000  ! 4091: ANDNcc_R	andncc 	%r20, %r0, %r24
cpu_intr_0_321:
	setx	0x3e0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_153:
	mov	0x12, %r14
	.word 0xfcf38e40  ! 4103: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5e4c000  ! 4104: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_322:
	setx	0x3d023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e421fa  ! 4110: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_323:
	setx	0x3f0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e199  ! 4116: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb7e54000  ! 4123: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_wr_154:
	mov	0x27, %r14
	.word 0xf4f389e0  ! 4124: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_wr_155:
	mov	0x2d, %r14
	.word 0xf6f389e0  ! 4125: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb5e50000  ! 4126: SAVE_R	save	%r20, %r0, %r26
	.word 0xb28de031  ! 4127: ANDcc_I	andcc 	%r23, 0x0031, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7359000  ! 4131: SRLX_R	srlx	%r22, %r0, %r27
	.word 0xb9e46186  ! 4133: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e40000  ! 4134: SAVE_R	save	%r16, %r0, %r25
	.word 0xb9e50000  ! 4137: SAVE_R	save	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_324:
	setx	0x3d011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a110  ! 4141: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_wr_156:
	mov	0x19, %r14
	.word 0xf6f38e40  ! 4142: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_325:
	setx	0x3d0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba15c000  ! 4147: OR_R	or 	%r23, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e4e0b0  ! 4152: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e46094  ! 4153: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_rd_170:
	mov	0x2a, %r14
	.word 0xf2db8e60  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb3e520f5  ! 4155: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_326:
	setx	0x3d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_157:
	mov	0x20, %r14
	.word 0xf6f38e60  ! 4157: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb93c1000  ! 4160: SRAX_R	srax	%r16, %r0, %r28
	.word 0xb9e44000  ! 4163: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_171:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 4175: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_wr_158:
	mov	0x12, %r14
	.word 0xfef38e40  ! 4176: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb9e40000  ! 4177: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_159:
	mov	0x29, %r14
	.word 0xfef38e80  ! 4178: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_rd_172:
	mov	0x32, %r14
	.word 0xf6db8e40  ! 4179: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7e44000  ! 4181: SAVE_R	save	%r17, %r0, %r27
	.word 0xbfe48000  ! 4182: SAVE_R	save	%r18, %r0, %r31
	.word 0xb9e461a9  ! 4184: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 39)
	.word 0xb5e5c000  ! 4194: SAVE_R	save	%r23, %r0, %r26
	.word 0xb9e42199  ! 4195: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_wr_160:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 4197: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbf520000  ! 4199: RDPR_PIL	<illegal instruction>
cpu_intr_0_327:
	setx	0x41032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbfe5c000  ! 4206: SAVE_R	save	%r23, %r0, %r31
	.word 0xbbe56003  ! 4207: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe40000  ! 4209: SAVE_R	save	%r16, %r0, %r29
	.word 0xb9e4a066  ! 4210: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 5)
	.word 0xb804a041  ! 4212: ADD_I	add 	%r18, 0x0041, %r28
	.word 0xbfe5c000  ! 4213: SAVE_R	save	%r23, %r0, %r31
	.word 0xb7e50000  ! 4216: SAVE_R	save	%r20, %r0, %r27
	.word 0xb20da175  ! 4218: AND_I	and 	%r22, 0x0175, %r25
cpu_intr_0_328:
	setx	0x420014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e421af  ! 4225: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe50000  ! 4229: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_329:
	setx	0x400211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_330:
	setx	0x400339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_rd_173:
	mov	0x3c7, %r14
	.word 0xf8db8e60  ! 4246: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbfe5c000  ! 4247: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_wr_161:
	mov	0x27, %r14
	.word 0xf4f389e0  ! 4254: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbde5e15f  ! 4255: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8d956033  ! 4256: WRPR_PSTATE_I	wrpr	%r21, 0x0033, %pstate
T0_asi_reg_wr_162:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 4258: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T0_asi_reg_wr_163:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 4259: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbbe48000  ! 4260: SAVE_R	save	%r18, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_331:
	setx	0x42022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_174:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 4266: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_rd_175:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 4267: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb335b001  ! 4269: SRLX_I	srlx	%r22, 0x0001, %r25
	.word 0xb205c000  ! 4276: ADD_R	add 	%r23, %r0, %r25
T0_asi_reg_wr_164:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 4277: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb5e48000  ! 4279: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_rd_176:
	mov	0x1c, %r14
	.word 0xf0db8e80  ! 4281: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb3504000  ! 4282: RDPR_TNPC	<illegal instruction>
	.word 0xb5e5213a  ! 4284: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_wr_165:
	mov	0x0, %r14
	.word 0xfcf38e40  ! 4288: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb2c4208e  ! 4289: ADDCcc_I	addccc 	%r16, 0x008e, %r25
T0_asi_reg_rd_177:
	mov	0x12, %r14
	.word 0xf4db8400  ! 4290: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7e5e007  ! 4292: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb4c58000  ! 4293: ADDCcc_R	addccc 	%r22, %r0, %r26
T0_asi_reg_rd_178:
	mov	0x24, %r14
	.word 0xfedb8e40  ! 4294: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_179:
	mov	0x4, %r14
	.word 0xf2db8e60  ! 4297: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbfe50000  ! 4298: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_166:
	mov	0x17, %r14
	.word 0xf2f389e0  ! 4299: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbbe48000  ! 4300: SAVE_R	save	%r18, %r0, %r29
	.word 0xb9e40000  ! 4302: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_332:
	setx	0x410133, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_180:
	mov	0x10, %r14
	.word 0xf8db8e80  ! 4310: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb5e4a0f6  ! 4312: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_333:
	setx	0x420128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a1be  ! 4315: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_181:
	mov	0x1d, %r14
	.word 0xf0db8e40  ! 4316: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5e48000  ! 4317: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_wr_167:
	mov	0x32, %r14
	.word 0xf6f384a0  ! 4320: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb5480000  ! 4324: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb9e520f6  ! 4328: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_182:
	mov	0x23, %r14
	.word 0xfcdb8400  ! 4329: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb5e48000  ! 4330: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7e5a0ce  ! 4338: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e48000  ! 4339: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 35)
	.word 0xbebc61c4  ! 4348: XNORcc_I	xnorcc 	%r17, 0x01c4, %r31
	.word 0xb7641800  ! 4349: MOVcc_R	<illegal instruction>
cpu_intr_0_334:
	setx	0x430204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 4351: SAVE_R	save	%r16, %r0, %r25
	.word 0xbfe44000  ! 4352: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_335:
	setx	0x40000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_336:
	setx	0x430133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_337:
	setx	0x41021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 4363: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb1e5e01e  ! 4374: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_338:
	setx	0x430221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_339:
	setx	0x40010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 4380: SAVE_R	save	%r23, %r0, %r26
	.word 0xbde40000  ! 4382: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_168:
	mov	0x3c0, %r14
	.word 0xf4f389e0  ! 4383: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb7e4c000  ! 4384: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_183:
	mov	0x24, %r14
	.word 0xf2db8e80  ! 4386: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_0_340:
	setx	0x400005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 4392: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_rd_184:
	mov	0x2, %r14
	.word 0xfadb8400  ! 4393: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_wr_169:
	mov	0x37, %r14
	.word 0xf8f38e40  ! 4395: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9e4c000  ! 4396: SAVE_R	save	%r19, %r0, %r28
	.word 0xb5e520e2  ! 4398: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_170:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 4401: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_341:
	setx	0x430335, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_185:
	mov	0x29, %r14
	.word 0xf8db8e60  ! 4404: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_186:
	mov	0x3c7, %r14
	.word 0xf6db8e60  ! 4407: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_342:
	setx	0x430325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e42005  ! 4410: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e42083  ! 4411: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe40000  ! 4413: SAVE_R	save	%r16, %r0, %r29
	.word 0xbc0c4000  ! 4414: AND_R	and 	%r17, %r0, %r30
	.word 0xb3e58000  ! 4416: SAVE_R	save	%r22, %r0, %r25
	.word 0xb5e58000  ! 4418: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_187:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 4421: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb334b001  ! 4423: SRLX_I	srlx	%r18, 0x0001, %r25
cpu_intr_0_343:
	setx	0x42020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_344:
	setx	0x410310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 37)
	.word 0xb5e5c000  ! 4434: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 16)
	.word 0xb1e56132  ! 4438: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e58000  ! 4440: SAVE_R	save	%r22, %r0, %r28
	.word 0xbbe50000  ! 4446: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_345:
	setx	0x430332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_346:
	setx	0x430227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_347:
	setx	0x410020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 39)
	.word 0xbbe40000  ! 4456: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_348:
	setx	0x43000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 4462: SAVE_R	save	%r19, %r0, %r29
	.word 0xb3e4a1de  ! 4466: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_349:
	setx	0x420208, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_188:
	mov	0x37, %r14
	.word 0xf2db84a0  ! 4471: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_350:
	setx	0x430228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_189:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 4478: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbde40000  ! 4480: SAVE_R	save	%r16, %r0, %r30
	.word 0xb97cc400  ! 4482: MOVR_R	movre	%r19, %r0, %r28
T0_asi_reg_wr_171:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 4485: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb4b5c000  ! 4486: ORNcc_R	orncc 	%r23, %r0, %r26
cpu_intr_0_351:
	setx	0x42031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_172:
	mov	0x8, %r14
	.word 0xf0f38e60  ! 4492: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbde4616d  ! 4499: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 33)
	.word 0xb1e4a1be  ! 4504: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 25)
	.word 0xbbe5e15d  ! 4512: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 30)
	.word 0xb5e4a1fd  ! 4517: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e56102  ! 4518: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_190:
	mov	0x0, %r14
	.word 0xf4db84a0  ! 4519: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_wr_173:
	mov	0x2f, %r14
	.word 0xfaf389e0  ! 4520: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb1e4e0df  ! 4522: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_191:
	mov	0x27, %r14
	.word 0xf8db8e60  ! 4523: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb1e4c000  ! 4524: SAVE_R	save	%r19, %r0, %r24
	.word 0xb3e5a143  ! 4531: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_rd_192:
	mov	0x3c5, %r14
	.word 0xfedb8e80  ! 4533: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_rd_193:
	mov	0x3c2, %r14
	.word 0xf8db84a0  ! 4536: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_352:
	setx	0x430109, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, e)
	.word 0xb3e48000  ! 4544: SAVE_R	save	%r18, %r0, %r25
	.word 0xba458000  ! 4546: ADDC_R	addc 	%r22, %r0, %r29
T0_asi_reg_rd_194:
	mov	0x21, %r14
	.word 0xf4db84a0  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_353:
	setx	0x400122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56055  ! 4555: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_354:
	setx	0x40012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_174:
	mov	0x16, %r14
	.word 0xf2f38e40  ! 4557: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_175:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 4559: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_355:
	setx	0x410008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a080  ! 4564: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_356:
	setx	0x42013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_195:
	mov	0x1f, %r14
	.word 0xf4db89e0  ! 4575: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_wr_176:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 4577: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb1e50000  ! 4580: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_177:
	mov	0x3c7, %r14
	.word 0xf2f384a0  ! 4583: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_357:
	setx	0x400130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3351000  ! 4588: SRLX_R	srlx	%r20, %r0, %r25
	.word 0xbde54000  ! 4589: SAVE_R	save	%r21, %r0, %r30
	.word 0xb02c210b  ! 4598: ANDN_I	andn 	%r16, 0x010b, %r24
	.word 0xb6358000  ! 4599: SUBC_R	orn 	%r22, %r0, %r27
	.word 0xbbe420d0  ! 4603: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_178:
	mov	0x35, %r14
	.word 0xf2f38400  ! 4606: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_0_358:
	setx	0x420123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1d0000  ! 4608: XOR_R	xor 	%r20, %r0, %r31
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_359:
	setx	0x420137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a083  ! 4613: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e520f2  ! 4614: SAVE_I	save	%r20, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde54000  ! 4618: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_360:
	setx	0x42031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_196:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 4634: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_361:
	setx	0x460335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc25e0ed  ! 4640: SUB_I	sub 	%r23, 0x00ed, %r30
	.word 0xbfe42133  ! 4641: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_197:
	mov	0x23, %r14
	.word 0xfcdb8e60  ! 4642: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_362:
	setx	0x460014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a015  ! 4649: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 13)
	.word 0xb7e54000  ! 4654: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_wr_179:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 4655: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_363:
	setx	0x470135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, e)
	.word 0xb17c4400  ! 4659: MOVR_R	movre	%r17, %r0, %r24
cpu_intr_0_364:
	setx	0x450238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 24)
	.word 0xb53d2001  ! 4663: SRA_I	sra 	%r20, 0x0001, %r26
T0_asi_reg_rd_198:
	mov	0x12, %r14
	.word 0xf4db8400  ! 4664: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbb351000  ! 4665: SRLX_R	srlx	%r20, %r0, %r29
cpu_intr_0_365:
	setx	0x460212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56161  ! 4668: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e4e126  ! 4669: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e42155  ! 4671: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5e5e1e5  ! 4672: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe5a181  ! 4676: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_rd_199:
	mov	0x2c, %r14
	.word 0xf0db84a0  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbde44000  ! 4682: SAVE_R	save	%r17, %r0, %r30
	.word 0xb63c8000  ! 4683: XNOR_R	xnor 	%r18, %r0, %r27
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 25)
	.word 0xbde560a5  ! 4685: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 36)
	.word 0xb9e50000  ! 4688: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb5e46173  ! 4690: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e4e15e  ! 4696: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb2358000  ! 4697: ORN_R	orn 	%r22, %r0, %r25
	.word 0xb93dc000  ! 4699: SRA_R	sra 	%r23, %r0, %r28
	.word 0xb6c50000  ! 4701: ADDCcc_R	addccc 	%r20, %r0, %r27
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5e520d4  ! 4706: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_366:
	setx	0x45020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 34)
	.word 0xbe8d8000  ! 4710: ANDcc_R	andcc 	%r22, %r0, %r31
T0_asi_reg_rd_200:
	mov	0x9, %r14
	.word 0xf0db84a0  ! 4711: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbde54000  ! 4714: SAVE_R	save	%r21, %r0, %r30
	.word 0xb1e521d2  ! 4719: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e5e181  ! 4720: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb8a4c000  ! 4721: SUBcc_R	subcc 	%r19, %r0, %r28
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_wr_180:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 4725: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_181:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 4726: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_wr_182:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 4728: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb7e5e0e0  ! 4729: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb93d3001  ! 4731: SRAX_I	srax	%r20, 0x0001, %r28
	.word 0xb9e40000  ! 4733: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_367:
	setx	0x46033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 4736: SAVE_R	save	%r20, %r0, %r28
	.word 0xb7348000  ! 4737: SRL_R	srl 	%r18, %r0, %r27
	.word 0xbfe54000  ! 4740: SAVE_R	save	%r21, %r0, %r31
	.word 0xbfe5613f  ! 4743: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, d)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e58000  ! 4750: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb9e561e8  ! 4753: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe4204b  ! 4755: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e4e145  ! 4756: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_wr_183:
	mov	0x7, %r14
	.word 0xfaf38e40  ! 4763: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 26)
	.word 0xb1e561b2  ! 4771: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_wr_184:
	mov	0x10, %r14
	.word 0xf4f38e40  ! 4777: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7e58000  ! 4778: SAVE_R	save	%r22, %r0, %r27
	.word 0xbbe48000  ! 4779: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_185:
	mov	0x28, %r14
	.word 0xf0f384a0  ! 4780: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbbe44000  ! 4785: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_201:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 4786: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb09cc000  ! 4787: XORcc_R	xorcc 	%r19, %r0, %r24
T0_asi_reg_rd_202:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 4788: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7e50000  ! 4792: SAVE_R	save	%r20, %r0, %r27
	.word 0xba8c8000  ! 4795: ANDcc_R	andcc 	%r18, %r0, %r29
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 34)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc2c4000  ! 4801: ANDN_R	andn 	%r17, %r0, %r30
T0_asi_reg_rd_203:
	mov	0x1b, %r14
	.word 0xf4db8e80  ! 4802: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_0_368:
	setx	0x450113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_369:
	setx	0x44003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_186:
	mov	0x16, %r14
	.word 0xfef38e60  ! 4809: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb5e4c000  ! 4810: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_187:
	mov	0x2e, %r14
	.word 0xf2f38e60  ! 4812: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_rd_204:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 4813: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T0_asi_reg_wr_188:
	mov	0x18, %r14
	.word 0xf0f38e80  ! 4815: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbfe48000  ! 4816: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_370:
	setx	0x47031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e04d  ! 4821: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbb3de001  ! 4824: SRA_I	sra 	%r23, 0x0001, %r29
	.word 0xbfe56058  ! 4825: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_205:
	mov	0x38, %r14
	.word 0xf0db89e0  ! 4826: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbb34a001  ! 4827: SRL_I	srl 	%r18, 0x0001, %r29
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_371:
	setx	0x470132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 4)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb29d4000  ! 4837: XORcc_R	xorcc 	%r21, %r0, %r25
	.word 0xb1e4e124  ! 4840: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_372:
	setx	0x450113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 22)
	.word 0xbe1c0000  ! 4850: XOR_R	xor 	%r16, %r0, %r31
	.word 0xb9e58000  ! 4851: SAVE_R	save	%r22, %r0, %r28
	.word 0xb5e5a0aa  ! 4852: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e58000  ! 4853: SAVE_R	save	%r22, %r0, %r24
	.word 0xb9e40000  ! 4854: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_rd_206:
	mov	0x22, %r14
	.word 0xf6db89e0  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_rd_207:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 4865: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb9641800  ! 4866: MOVcc_R	<illegal instruction>
T0_asi_reg_wr_189:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 4868: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb9e4c000  ! 4869: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_wr_190:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 4870: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb1e4c000  ! 4874: SAVE_R	save	%r19, %r0, %r24
	.word 0xba0cc000  ! 4876: AND_R	and 	%r19, %r0, %r29
	.word 0xb9e54000  ! 4878: SAVE_R	save	%r21, %r0, %r28
	.word 0xb7e48000  ! 4880: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_rd_208:
	mov	0x29, %r14
	.word 0xfcdb8e60  ! 4882: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_rd_209:
	mov	0xe, %r14
	.word 0xfedb8e40  ! 4883: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_191:
	mov	0x1b, %r14
	.word 0xfaf38e40  ! 4885: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_wr_192:
	mov	0x3c1, %r14
	.word 0xfaf38e60  ! 4887: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 26)
	.word 0xbfe58000  ! 4891: SAVE_R	save	%r22, %r0, %r31
	.word 0xbde5a184  ! 4893: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e4e05a  ! 4894: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e4e091  ! 4895: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e44000  ! 4898: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_210:
	mov	0x3c0, %r14
	.word 0xfadb8400  ! 4900: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_wr_193:
	mov	0x27, %r14
	.word 0xfcf38e40  ! 4908: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5e44000  ! 4909: SAVE_R	save	%r17, %r0, %r26
	.word 0xbfe54000  ! 4911: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_wr_194:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 4912: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb9e54000  ! 4913: SAVE_R	save	%r21, %r0, %r28
	.word 0xbfe5204c  ! 4920: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_373:
	setx	0x47002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_374:
	setx	0x440209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 1c)
	.word 0xba0521e0  ! 4926: ADD_I	add 	%r20, 0x01e0, %r29
T0_asi_reg_wr_195:
	mov	0x3c1, %r14
	.word 0xf0f38e80  ! 4927: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_196:
	mov	0xc, %r14
	.word 0xf0f38e60  ! 4929: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb5e56134  ! 4930: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb28d8000  ! 4931: ANDcc_R	andcc 	%r22, %r0, %r25
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_211:
	mov	0x19, %r14
	.word 0xf0db8400  ! 4939: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb9e40000  ! 4940: SAVE_R	save	%r16, %r0, %r28
	.word 0xbe25610d  ! 4941: SUB_I	sub 	%r21, 0x010d, %r31
	.word 0xba2dc000  ! 4942: ANDN_R	andn 	%r23, %r0, %r29
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_375:
	setx	0x470114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe421b0  ! 4945: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_197:
	mov	0x17, %r14
	.word 0xf2f38e60  ! 4946: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbbe44000  ! 4948: SAVE_R	save	%r17, %r0, %r29
	.word 0xbfe5c000  ! 4949: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, b)
	.word 0xb845e18c  ! 4952: ADDC_I	addc 	%r23, 0x018c, %r28
	.word 0xb935b001  ! 4957: SRLX_I	srlx	%r22, 0x0001, %r28
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 37)
	.word 0xb9e52096  ! 4960: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_376:
	setx	0x450123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_wr_198:
	mov	0x1b, %r14
	.word 0xfaf38e40  ! 4977: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_377:
	setx	0x450018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_378:
	setx	0x460131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_379:
	setx	0x46020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_rd_212:
	mov	0x3, %r14
	.word 0xfadb8e80  ! 4992: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb7e5a06a  ! 4993: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_380:
	setx	0x460008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_396:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_396), 16, 16)) -> intp(0, 0, 34)
	.word 0xbf480000  ! 4998: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
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
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf634c000  ! 8: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xf02ce092  ! 11: STB_I	stb	%r24, [%r19 + 0x0092]
cpu_intr_3_0:
	setx	0x1e000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40cc000  ! 14: AND_R	and 	%r19, %r0, %r26
T3_asi_reg_wr_0:
	mov	0x1, %r14
	.word 0xf8f384a0  ! 15: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf82c4000  ! 16: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xfc242018  ! 17: STW_I	stw	%r30, [%r16 + 0x0018]
	.word 0xfaa40020  ! 18: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
	.word 0xf62c6138  ! 20: STB_I	stb	%r27, [%r17 + 0x0138]
	.word 0xb6aca037  ! 22: ANDNcc_I	andncc 	%r18, 0x0037, %r27
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_1:
	setx	0x1e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4740000  ! 32: STX_R	stx	%r26, [%r16 + %r0]
cpu_intr_3_2:
	setx	0x1d0104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_3:
	setx	0x1d0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc7520ff  ! 39: STX_I	stx	%r30, [%r20 + 0x00ff]
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 1d)
	.word 0xbab42189  ! 44: ORNcc_I	orncc 	%r16, 0x0189, %r29
	.word 0xfca5618d  ! 48: STWA_I	stwa	%r30, [%r21 + 0x018d] %asi
	.word 0xbf3cb001  ! 49: SRAX_I	srax	%r18, 0x0001, %r31
	.word 0xfea4a030  ! 50: STWA_I	stwa	%r31, [%r18 + 0x0030] %asi
cpu_intr_3_4:
	setx	0x1d000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_5:
	setx	0x1d0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5e169  ! 58: STWA_I	stwa	%r28, [%r23 + 0x0169] %asi
T3_asi_reg_wr_1:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 59: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_0:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 62: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfead0020  ! 67: STBA_R	stba	%r31, [%r20 + %r0] 0x01
	.word 0xf4a46150  ! 71: STWA_I	stwa	%r26, [%r17 + 0x0150] %asi
T3_asi_reg_wr_2:
	mov	0x2b, %r14
	.word 0xfef38e40  ! 72: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf8b4a096  ! 74: STHA_I	stha	%r28, [%r18 + 0x0096] %asi
T3_asi_reg_wr_3:
	mov	0x22, %r14
	.word 0xfaf389e0  ! 75: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfc35a160  ! 76: STH_I	sth	%r30, [%r22 + 0x0160]
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, a)
	.word 0xb92d8000  ! 79: SLL_R	sll 	%r22, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2acc020  ! 85: STBA_R	stba	%r25, [%r19 + %r0] 0x01
	.word 0xfeb5218d  ! 86: STHA_I	stha	%r31, [%r20 + 0x018d] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf625e08c  ! 89: STW_I	stw	%r27, [%r23 + 0x008c]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_6:
	setx	0x1f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d0000  ! 96: STB_R	stb	%r27, [%r20 + %r0]
	ta	T_CHANGE_TO_TL1
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf42420e8  ! 100: STW_I	stw	%r26, [%r16 + 0x00e8]
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_wr_4:
	mov	0xc, %r14
	.word 0xf4f38400  ! 102: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xba84a0f3  ! 103: ADDcc_I	addcc 	%r18, 0x00f3, %r29
	.word 0xfeb420a7  ! 105: STHA_I	stha	%r31, [%r16 + 0x00a7] %asi
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfe2de155  ! 110: STB_I	stb	%r31, [%r23 + 0x0155]
	.word 0xf67561da  ! 111: STX_I	stx	%r27, [%r21 + 0x01da]
T3_asi_reg_wr_5:
	mov	0x38, %r14
	.word 0xf2f389e0  ! 112: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_rd_1:
	mov	0x1e, %r14
	.word 0xf0db8e40  ! 114: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_7:
	setx	0x1c011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34e095  ! 116: STH_I	sth	%r30, [%r19 + 0x0095]
	.word 0xfab50020  ! 117: STHA_R	stha	%r29, [%r20 + %r0] 0x01
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_8:
	setx	0x1d0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983c40  ! 120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c40, %hpstate
	.word 0xf8f461cd  ! 121: STXA_I	stxa	%r28, [%r17 + 0x01cd] %asi
	.word 0xf02d6147  ! 124: STB_I	stb	%r24, [%r21 + 0x0147]
	.word 0xfa2c20de  ! 129: STB_I	stb	%r29, [%r16 + 0x00de]
	.word 0xf6240000  ! 131: STW_R	stw	%r27, [%r16 + %r0]
T3_asi_reg_wr_6:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 132: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_3_9:
	setx	0x1e023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_10:
	setx	0x1e000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6340000  ! 139: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xfa350000  ! 141: STH_R	sth	%r29, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf4ace193  ! 151: STBA_I	stba	%r26, [%r19 + 0x0193] %asi
	.word 0xf2f5e05d  ! 152: STXA_I	stxa	%r25, [%r23 + 0x005d] %asi
	.word 0xbd508000  ! 153: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xfeace172  ! 154: STBA_I	stba	%r31, [%r19 + 0x0172] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_2:
	mov	0x18, %r14
	.word 0xf6db8e40  ! 158: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfa2d8000  ! 159: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xfea50020  ! 160: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
cpu_intr_3_11:
	setx	0x1f023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25212c  ! 162: STW_I	stw	%r31, [%r20 + 0x012c]
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_rd_3:
	mov	0x37, %r14
	.word 0xfedb8e40  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 15)
	.word 0xf2754000  ! 176: STX_R	stx	%r25, [%r21 + %r0]
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, b)
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_rd_4:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 183: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_12:
	setx	0x1c023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 2f)
	.word 0xb9643801  ! 193: MOVcc_I	<illegal instruction>
cpu_intr_3_13:
	setx	0x1e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_14:
	setx	0x1e0036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, d)
	.word 0xf424e16f  ! 201: STW_I	stw	%r26, [%r19 + 0x016f]
T3_asi_reg_rd_5:
	mov	0x1c, %r14
	.word 0xfcdb8e40  ! 203: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xba8c4000  ! 206: ANDcc_R	andcc 	%r17, %r0, %r29
T3_asi_reg_wr_7:
	mov	0xb, %r14
	.word 0xf0f38400  ! 208: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T3_asi_reg_wr_8:
	mov	0x13, %r14
	.word 0xf4f38e60  ! 211: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfca44020  ! 212: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_9:
	mov	0x9, %r14
	.word 0xfcf38400  ! 218: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 23)
	.word 0xf675a0ed  ! 222: STX_I	stx	%r27, [%r22 + 0x00ed]
T3_asi_reg_rd_6:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0x87942050  ! 228: WRPR_TT_I	wrpr	%r16, 0x0050, %tt
	.word 0xf0f420dd  ! 234: STXA_I	stxa	%r24, [%r16 + 0x00dd] %asi
	.word 0xfa2420e4  ! 236: STW_I	stw	%r29, [%r16 + 0x00e4]
	.word 0xf2adc020  ! 239: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	.word 0xfc2c2056  ! 242: STB_I	stb	%r30, [%r16 + 0x0056]
	.word 0xf42c2028  ! 245: STB_I	stb	%r26, [%r16 + 0x0028]
	.word 0xfa2c60d7  ! 247: STB_I	stb	%r29, [%r17 + 0x00d7]
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_NONHPRIV
	.word 0xb60ca1a8  ! 251: AND_I	and 	%r18, 0x01a8, %r27
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 12)
	.word 0xf035c000  ! 255: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xb23560a6  ! 257: ORN_I	orn 	%r21, 0x00a6, %r25
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a0a  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0a, %hpstate
	.word 0xf0754000  ! 260: STX_R	stx	%r24, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 9)
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c02  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c02, %hpstate
T3_asi_reg_rd_7:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 271: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_15:
	setx	0x1f032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4358000  ! 283: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xf0b4602f  ! 284: STHA_I	stha	%r24, [%r17 + 0x002f] %asi
	.word 0xbb641800  ! 285: MOVcc_R	<illegal instruction>
T3_asi_reg_rd_8:
	mov	0x29, %r14
	.word 0xfadb8e80  ! 286: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf034c000  ! 289: STH_R	sth	%r24, [%r19 + %r0]
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfcb4a093  ! 291: STHA_I	stha	%r30, [%r18 + 0x0093] %asi
	.word 0xf67420a8  ! 293: STX_I	stx	%r27, [%r16 + 0x00a8]
T3_asi_reg_wr_10:
	mov	0x1, %r14
	.word 0xf8f389e0  ! 294: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfaac6063  ! 295: STBA_I	stba	%r29, [%r17 + 0x0063] %asi
	.word 0xf8f460d4  ! 296: STXA_I	stxa	%r28, [%r17 + 0x00d4] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xfaace12e  ! 298: STBA_I	stba	%r29, [%r19 + 0x012e] %asi
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_16:
	setx	0x1f0217, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_9:
	mov	0x14, %r14
	.word 0xf0db89e0  ! 305: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf6f4e132  ! 308: STXA_I	stxa	%r27, [%r19 + 0x0132] %asi
cpu_intr_3_17:
	setx	0x1f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_18:
	setx	0x1d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_19:
	setx	0x1d0124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 39)
	.word 0xf42c4000  ! 323: STB_R	stb	%r26, [%r17 + %r0]
T3_asi_reg_wr_11:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 324: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T3_asi_reg_wr_12:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 325: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
cpu_intr_3_20:
	setx	0x1d0021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_21:
	setx	0x1f012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a5a0fd  ! 332: STWA_I	stwa	%r26, [%r22 + 0x00fd] %asi
	.word 0xfab5a1d2  ! 333: STHA_I	stha	%r29, [%r22 + 0x01d2] %asi
	.word 0xbc354000  ! 334: SUBC_R	orn 	%r21, %r0, %r30
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c8a  ! 335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8a, %hpstate
	.word 0xf234a18c  ! 336: STH_I	sth	%r25, [%r18 + 0x018c]
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_22:
	setx	0x1d0331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 38)
	.word 0xf87560ec  ! 344: STX_I	stx	%r28, [%r21 + 0x00ec]
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_23:
	setx	0x1e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b50020  ! 353: STHA_R	stha	%r28, [%r20 + %r0] 0x01
	.word 0xf4b58020  ! 355: STHA_R	stha	%r26, [%r22 + %r0] 0x01
cpu_intr_3_24:
	setx	0x1f0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f18  ! 359: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f18, %hpstate
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 29)
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983e1a  ! 361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e1a, %hpstate
cpu_intr_3_25:
	setx	0x1c0338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 18)
	.word 0xf02c0000  ! 364: STB_R	stb	%r24, [%r16 + %r0]
cpu_intr_3_26:
	setx	0x1f032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a50020  ! 370: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
	.word 0xf8aca054  ! 371: STBA_I	stba	%r28, [%r18 + 0x0054] %asi
cpu_intr_3_27:
	setx	0x1e0322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_28:
	setx	0x1e0020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf6b58020  ! 378: STHA_R	stha	%r27, [%r22 + %r0] 0x01
T3_asi_reg_rd_10:
	mov	0x24, %r14
	.word 0xfedb89e0  ! 379: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf2a4e0bb  ! 380: STWA_I	stwa	%r25, [%r19 + 0x00bb] %asi
	.word 0xfaac609f  ! 381: STBA_I	stba	%r29, [%r17 + 0x009f] %asi
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_rd_11:
	mov	0x36, %r14
	.word 0xf0db89e0  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_29:
	setx	0x1d0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f52005  ! 388: STXA_I	stxa	%r24, [%r20 + 0x0005] %asi
	.word 0x91952022  ! 390: WRPR_PIL_I	wrpr	%r20, 0x0022, %pil
	.word 0xfaa5c020  ! 391: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
	.word 0xf8ad607e  ! 392: STBA_I	stba	%r28, [%r21 + 0x007e] %asi
	.word 0xf0b461e6  ! 397: STHA_I	stha	%r24, [%r17 + 0x01e6] %asi
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_30:
	setx	0x1d0024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, a)
	.word 0xf4b58020  ! 404: STHA_R	stha	%r26, [%r22 + %r0] 0x01
	.word 0xbd2c2001  ! 407: SLL_I	sll 	%r16, 0x0001, %r30
	.word 0xf4f461e0  ! 410: STXA_I	stxa	%r26, [%r17 + 0x01e0] %asi
	.word 0xfea54020  ! 411: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
T3_asi_reg_wr_13:
	mov	0xa, %r14
	.word 0xf8f38e40  ! 412: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983a98  ! 414: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a98, %hpstate
	.word 0xfab460f4  ! 418: STHA_I	stha	%r29, [%r17 + 0x00f4] %asi
	.word 0xf2ad60c4  ! 420: STBA_I	stba	%r25, [%r21 + 0x00c4] %asi
T3_asi_reg_rd_12:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 421: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_31:
	setx	0x1f0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d0000  ! 423: STB_R	stb	%r30, [%r20 + %r0]
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983ed8  ! 425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed8, %hpstate
T3_asi_reg_wr_14:
	mov	0x1f, %r14
	.word 0xf4f38e60  ! 427: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	ta	T_CHANGE_NONHPRIV
	.word 0xf62460d0  ! 433: STW_I	stw	%r27, [%r17 + 0x00d0]
cpu_intr_3_32:
	setx	0x1d0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc2d8000  ! 436: STB_R	stb	%r30, [%r22 + %r0]
cpu_intr_3_33:
	setx	0x1e001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_13:
	mov	0x1f, %r14
	.word 0xfcdb8400  ! 438: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf62d8000  ! 440: STB_R	stb	%r27, [%r22 + %r0]
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 3)
	.word 0xfaac612b  ! 443: STBA_I	stba	%r29, [%r17 + 0x012b] %asi
	.word 0xf274608b  ! 444: STX_I	stx	%r25, [%r17 + 0x008b]
cpu_intr_3_34:
	setx	0x1c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_35:
	setx	0x1c0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ada081  ! 448: STBA_I	stba	%r27, [%r22 + 0x0081] %asi
	.word 0xfaf42008  ! 449: STXA_I	stxa	%r29, [%r16 + 0x0008] %asi
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 39)
	.word 0xf634e115  ! 453: STH_I	sth	%r27, [%r19 + 0x0115]
	.word 0xf0b4a10a  ! 457: STHA_I	stha	%r24, [%r18 + 0x010a] %asi
	.word 0xf2ad2020  ! 458: STBA_I	stba	%r25, [%r20 + 0x0020] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xf8a54020  ! 460: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_wr_15:
	mov	0x2d, %r14
	.word 0xf2f384a0  ! 462: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 33)
	.word 0xf2258000  ! 467: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf02c4000  ! 468: STB_R	stb	%r24, [%r17 + %r0]
T3_asi_reg_wr_16:
	mov	0x3, %r14
	.word 0xf0f389e0  ! 470: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfa350000  ! 474: STH_R	sth	%r29, [%r20 + %r0]
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 19)
	.word 0xf0b4613a  ! 478: STHA_I	stha	%r24, [%r17 + 0x013a] %asi
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 10)
	.word 0xbc854000  ! 483: ADDcc_R	addcc 	%r21, %r0, %r30
	.word 0xf424e1c3  ! 484: STW_I	stw	%r26, [%r19 + 0x01c3]
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf8b5e015  ! 487: STHA_I	stha	%r28, [%r23 + 0x0015] %asi
	.word 0xb934a001  ! 490: SRL_I	srl 	%r18, 0x0001, %r28
	.word 0xbaad6188  ! 492: ANDNcc_I	andncc 	%r21, 0x0188, %r29
T3_asi_reg_rd_14:
	mov	0x2d, %r14
	.word 0xfcdb8e60  ! 494: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 28)
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982c52  ! 499: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c52, %hpstate
	.word 0xf4a50020  ! 500: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
T3_asi_reg_rd_15:
	mov	0x2b, %r14
	.word 0xf8db89e0  ! 501: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_wr_17:
	mov	0x2, %r14
	.word 0xf8f38e80  ! 502: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfe2c2151  ! 503: STB_I	stb	%r31, [%r16 + 0x0151]
	.word 0xf62cc000  ! 504: STB_R	stb	%r27, [%r19 + %r0]
T3_asi_reg_wr_18:
	mov	0x7, %r14
	.word 0xf8f38e40  ! 507: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b54020  ! 510: STHA_R	stha	%r28, [%r21 + %r0] 0x01
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 22)
	.word 0xbe9dc000  ! 513: XORcc_R	xorcc 	%r23, %r0, %r31
	.word 0xf0ad2137  ! 515: STBA_I	stba	%r24, [%r20 + 0x0137] %asi
	.word 0xfa258000  ! 518: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xf23520d6  ! 519: STH_I	sth	%r25, [%r20 + 0x00d6]
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 30)
	.word 0xf4ad6024  ! 528: STBA_I	stba	%r26, [%r21 + 0x0024] %asi
	.word 0xf63421dd  ! 530: STH_I	sth	%r27, [%r16 + 0x01dd]
T3_asi_reg_wr_19:
	mov	0x32, %r14
	.word 0xf6f38e40  ! 532: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_16:
	mov	0x35, %r14
	.word 0xf6db8e40  ! 535: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_rd_17:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 536: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf8b50020  ! 538: STHA_R	stha	%r28, [%r20 + %r0] 0x01
cpu_intr_3_36:
	setx	0x200339, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	.word 0xf6a5c020  ! 543: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_20:
	mov	0xd, %r14
	.word 0xf4f384a0  ! 550: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf0acc020  ! 552: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	.word 0xb624e046  ! 553: SUB_I	sub 	%r19, 0x0046, %r27
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_18:
	mov	0x22, %r14
	.word 0xfcdb89e0  ! 555: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xf025c000  ! 559: STW_R	stw	%r24, [%r23 + %r0]
T3_asi_reg_wr_21:
	mov	0x13, %r14
	.word 0xf0f389e0  ! 560: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_rd_19:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
cpu_intr_3_37:
	setx	0x21020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac6098  ! 567: STBA_I	stba	%r24, [%r17 + 0x0098] %asi
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL0
	.word 0xf6f4e02a  ! 574: STXA_I	stxa	%r27, [%r19 + 0x002a] %asi
	.word 0xb0ace178  ! 576: ANDNcc_I	andncc 	%r19, 0x0178, %r24
T3_asi_reg_wr_22:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 577: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_wr_23:
	mov	0x1f, %r14
	.word 0xf4f38400  ! 578: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_20:
	mov	0x20, %r14
	.word 0xfcdb8400  ! 583: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 1f)
	.word 0xb9641800  ! 585: MOVcc_R	<illegal instruction>
	.word 0xbc254000  ! 587: SUB_R	sub 	%r21, %r0, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf874a06c  ! 591: STX_I	stx	%r28, [%r18 + 0x006c]
T3_asi_reg_wr_24:
	mov	0x23, %r14
	.word 0xf6f38e40  ! 593: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_21:
	mov	0x3c1, %r14
	.word 0xf8db8e60  ! 597: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983cca  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cca, %hpstate
T3_asi_reg_wr_25:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 601: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_22:
	mov	0x36, %r14
	.word 0xf0db8e60  ! 608: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_38:
	setx	0x210139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2240000  ! 610: STW_R	stw	%r25, [%r16 + %r0]
T3_asi_reg_rd_23:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 611: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf22cc000  ! 613: STB_R	stb	%r25, [%r19 + %r0]
T3_asi_reg_rd_24:
	mov	0x8, %r14
	.word 0xf4db8e40  ! 616: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_26:
	mov	0x14, %r14
	.word 0xf6f38e80  ! 617: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_39:
	setx	0x230337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 12)
	.word 0xf0a4c020  ! 620: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	.word 0xfef46027  ! 622: STXA_I	stxa	%r31, [%r17 + 0x0027] %asi
cpu_intr_3_40:
	setx	0x200211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_41:
	setx	0x20032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_27:
	mov	0x3c6, %r14
	.word 0xf0f384a0  ! 625: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_42:
	setx	0x220026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_43:
	setx	0x230035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_44:
	setx	0x220321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b56178  ! 631: STHA_I	stha	%r25, [%r21 + 0x0178] %asi
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_45:
	setx	0x210138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_46:
	setx	0x20023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 32)
	.word 0xfe35c000  ! 641: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xf025217a  ! 642: STW_I	stw	%r24, [%r20 + 0x017a]
	.word 0xfc350000  ! 653: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xb4b4c000  ! 655: ORNcc_R	orncc 	%r19, %r0, %r26
T3_asi_reg_wr_28:
	mov	0x9, %r14
	.word 0xfaf38400  ! 657: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 6)
	.word 0xf0246027  ! 660: STW_I	stw	%r24, [%r17 + 0x0027]
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_47:
	setx	0x200135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad60fd  ! 670: STBA_I	stba	%r28, [%r21 + 0x00fd] %asi
	.word 0xfc74e0af  ! 671: STX_I	stx	%r30, [%r19 + 0x00af]
	.word 0xf8b5612a  ! 673: STHA_I	stha	%r28, [%r21 + 0x012a] %asi
	.word 0xb33d6001  ! 674: SRA_I	sra 	%r21, 0x0001, %r25
	.word 0xfa344000  ! 676: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xb01c60c1  ! 677: XOR_I	xor 	%r17, 0x00c1, %r24
	.word 0xfea4e11b  ! 679: STWA_I	stwa	%r31, [%r19 + 0x011b] %asi
T3_asi_reg_rd_25:
	mov	0x1e, %r14
	.word 0xf4db8e40  ! 682: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb235a132  ! 684: SUBC_I	orn 	%r22, 0x0132, %r25
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 3e)
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf475616e  ! 692: STX_I	stx	%r26, [%r21 + 0x016e]
	.word 0xba3d0000  ! 693: XNOR_R	xnor 	%r20, %r0, %r29
	.word 0xf43520df  ! 694: STH_I	sth	%r26, [%r20 + 0x00df]
	.word 0xbd480000  ! 696: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf234e021  ! 698: STH_I	sth	%r25, [%r19 + 0x0021]
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982f18  ! 703: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f18, %hpstate
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf825c000  ! 705: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xfaad6029  ! 710: STBA_I	stba	%r29, [%r21 + 0x0029] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_48:
	setx	0x220019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_49:
	setx	0x21003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xb2048000  ! 723: ADD_R	add 	%r18, %r0, %r25
cpu_intr_3_50:
	setx	0x230011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8248000  ! 729: STW_R	stw	%r28, [%r18 + %r0]
cpu_intr_3_51:
	setx	0x22011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 8)
	.word 0xfa74214a  ! 737: STX_I	stx	%r29, [%r16 + 0x014a]
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 28)
	.word 0xfa2c215e  ! 741: STB_I	stb	%r29, [%r16 + 0x015e]
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_52:
	setx	0x210309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2854000  ! 745: ADDcc_R	addcc 	%r21, %r0, %r25
	.word 0xf0a44020  ! 746: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
	.word 0xf2a54020  ! 749: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xb23560fd  ! 752: ORN_I	orn 	%r21, 0x00fd, %r25
T3_asi_reg_wr_29:
	mov	0x4, %r14
	.word 0xf6f38400  ! 756: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_3_53:
	setx	0x210315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea4c020  ! 758: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
T3_asi_reg_rd_26:
	mov	0x1, %r14
	.word 0xf4db8e80  ! 759: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_3_54:
	setx	0x230131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 39)
	.word 0xf035e08c  ! 771: STH_I	sth	%r24, [%r23 + 0x008c]
cpu_intr_3_55:
	setx	0x210214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_56:
	setx	0x230203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3521f0  ! 784: SUBC_I	orn 	%r20, 0x01f0, %r30
cpu_intr_3_57:
	setx	0x230115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf034a1ba  ! 786: STH_I	sth	%r24, [%r18 + 0x01ba]
cpu_intr_3_58:
	setx	0x230218, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_30:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 791: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_59:
	setx	0x220024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41d60c5  ! 796: XOR_I	xor 	%r21, 0x00c5, %r26
	.word 0xfa2d8000  ! 797: STB_R	stb	%r29, [%r22 + %r0]
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, b)
	.word 0xf025c000  ! 800: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xb6b44000  ! 806: ORNcc_R	orncc 	%r17, %r0, %r27
	.word 0xf63421a5  ! 807: STH_I	sth	%r27, [%r16 + 0x01a5]
	.word 0xfc754000  ! 814: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xfa758000  ! 816: STX_R	stx	%r29, [%r22 + %r0]
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf6358000  ! 820: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xfe35612a  ! 822: STH_I	sth	%r31, [%r21 + 0x012a]
	.word 0xfcada104  ! 823: STBA_I	stba	%r30, [%r22 + 0x0104] %asi
T3_asi_reg_wr_31:
	mov	0x36, %r14
	.word 0xf6f38e60  ! 825: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf82dc000  ! 830: STB_R	stb	%r28, [%r23 + %r0]
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_60:
	setx	0x210300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb035c000  ! 834: ORN_R	orn 	%r23, %r0, %r24
	.word 0xf6ad209e  ! 835: STBA_I	stba	%r27, [%r20 + 0x009e] %asi
T3_asi_reg_rd_27:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 837: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfe2d0000  ! 838: STB_R	stb	%r31, [%r20 + %r0]
T3_asi_reg_rd_28:
	mov	0x31, %r14
	.word 0xfcdb8400  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf6a420f1  ! 840: STWA_I	stwa	%r27, [%r16 + 0x00f1] %asi
	.word 0xfc352077  ! 841: STH_I	sth	%r30, [%r20 + 0x0077]
	.word 0xbc356134  ! 842: ORN_I	orn 	%r21, 0x0134, %r30
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 3d)
	ta	T_CHANGE_NONHPRIV
	.word 0xf63420ca  ! 846: STH_I	sth	%r27, [%r16 + 0x00ca]
	.word 0xfe340000  ! 848: STH_R	sth	%r31, [%r16 + %r0]
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, a)
	.word 0xbc2ca192  ! 851: ANDN_I	andn 	%r18, 0x0192, %r30
	.word 0xfc35c000  ! 857: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xf4f4a16b  ! 858: STXA_I	stxa	%r26, [%r18 + 0x016b] %asi
T3_asi_reg_wr_32:
	mov	0x38, %r14
	.word 0xf4f38e40  ! 859: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf2a520c2  ! 860: STWA_I	stwa	%r25, [%r20 + 0x00c2] %asi
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_61:
	setx	0x220312, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_62:
	setx	0x220209, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb41c6037  ! 867: XOR_I	xor 	%r17, 0x0037, %r26
T3_asi_reg_wr_33:
	mov	0x16, %r14
	.word 0xf4f38e40  ! 868: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_63:
	setx	0x21023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf42037  ! 870: STXA_I	stxa	%r29, [%r16 + 0x0037] %asi
	.word 0xf474e000  ! 875: STX_I	stx	%r26, [%r19 + 0x0000]
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_64:
	setx	0x210324, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_29:
	mov	0x3c3, %r14
	.word 0xf0db89e0  ! 883: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf025e197  ! 884: STW_I	stw	%r24, [%r23 + 0x0197]
T3_asi_reg_rd_30:
	mov	0x36, %r14
	.word 0xf2db8e60  ! 891: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf624e1c3  ! 894: STW_I	stw	%r27, [%r19 + 0x01c3]
	.word 0xf6a4608b  ! 895: STWA_I	stwa	%r27, [%r17 + 0x008b] %asi
	.word 0xfc244000  ! 898: STW_R	stw	%r30, [%r17 + %r0]
T3_asi_reg_rd_31:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_rd_32:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 901: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_65:
	setx	0x200229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8754000  ! 903: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xfeac2056  ! 904: STBA_I	stba	%r31, [%r16 + 0x0056] %asi
T3_asi_reg_rd_33:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 905: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf8b44020  ! 907: STHA_R	stha	%r28, [%r17 + %r0] 0x01
T3_asi_reg_wr_34:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 908: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf0acc020  ! 909: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	.word 0xf6ac8020  ! 912: STBA_R	stba	%r27, [%r18 + %r0] 0x01
	.word 0xf0742040  ! 913: STX_I	stx	%r24, [%r16 + 0x0040]
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 14)
	.word 0xf2258000  ! 915: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf0a54020  ! 916: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
cpu_intr_3_66:
	setx	0x220304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_wr_35:
	mov	0x3c0, %r14
	.word 0xf0f38e80  ! 925: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, f)
	.word 0xf4a4c020  ! 928: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
	.word 0xf02c4000  ! 931: STB_R	stb	%r24, [%r17 + %r0]
T3_asi_reg_rd_34:
	mov	0x3c2, %r14
	.word 0xfadb8e80  ! 932: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_67:
	setx	0x200337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 1)
	.word 0xf435a1c3  ! 939: STH_I	sth	%r26, [%r22 + 0x01c3]
cpu_intr_3_68:
	setx	0x220126, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_36:
	mov	0x22, %r14
	.word 0xf6f38400  ! 943: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_69:
	setx	0x240324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2340000  ! 946: STH_R	sth	%r25, [%r16 + %r0]
T3_asi_reg_rd_35:
	mov	0x1d, %r14
	.word 0xf4db8400  ! 949: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf62cc000  ! 951: STB_R	stb	%r27, [%r19 + %r0]
cpu_intr_3_70:
	setx	0x27000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_71:
	setx	0x24013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_36:
	mov	0xe, %r14
	.word 0xfadb8e40  ! 956: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_72:
	setx	0x260329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8ad4000  ! 959: ANDNcc_R	andncc 	%r21, %r0, %r28
	.word 0xfa2c2011  ! 961: STB_I	stb	%r29, [%r16 + 0x0011]
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 16)
	.word 0x919420c0  ! 973: WRPR_PIL_I	wrpr	%r16, 0x00c0, %pil
cpu_intr_3_73:
	setx	0x270304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf4a0b0  ! 980: STXA_I	stxa	%r29, [%r18 + 0x00b0] %asi
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_37:
	mov	0x5, %r14
	.word 0xfef38e40  ! 982: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfa242168  ! 983: STW_I	stw	%r29, [%r16 + 0x0168]
	.word 0xf4a4e0c2  ! 984: STWA_I	stwa	%r26, [%r19 + 0x00c2] %asi
cpu_intr_3_74:
	setx	0x270120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5214b  ! 987: STHA_I	stha	%r31, [%r20 + 0x014b] %asi
T3_asi_reg_rd_37:
	mov	0x8, %r14
	.word 0xfcdb89e0  ! 989: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf42d210e  ! 990: STB_I	stb	%r26, [%r20 + 0x010e]
T3_asi_reg_wr_38:
	mov	0x26, %r14
	.word 0xf2f38e40  ! 991: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfc2520b5  ! 993: STW_I	stw	%r30, [%r20 + 0x00b5]
	.word 0xf0240000  ! 994: STW_R	stw	%r24, [%r16 + %r0]
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 12)
	.word 0x8394e0d7  ! 1001: WRPR_TNPC_I	wrpr	%r19, 0x00d7, %tnpc
	.word 0xb88ca1a7  ! 1006: ANDcc_I	andcc 	%r18, 0x01a7, %r28
T3_asi_reg_wr_39:
	mov	0x13, %r14
	.word 0xfaf38e40  ! 1007: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 5)
	.word 0xfe25c000  ! 1011: STW_R	stw	%r31, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_38:
	mov	0x9, %r14
	.word 0xfcdb84a0  ! 1014: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfe254000  ! 1015: STW_R	stw	%r31, [%r21 + %r0]
	.word 0x8f902000  ! 1017: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xf225611c  ! 1018: STW_I	stw	%r25, [%r21 + 0x011c]
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 34)
	.word 0xf4358000  ! 1021: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xf0344000  ! 1022: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xf4acc020  ! 1025: STBA_R	stba	%r26, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_75:
	setx	0x25001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_40:
	mov	0x31, %r14
	.word 0xf6f38e40  ! 1034: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_76:
	setx	0x240134, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_41:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 1039: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfa3520f2  ! 1041: STH_I	sth	%r29, [%r20 + 0x00f2]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf0348000  ! 1048: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xfcf46082  ! 1049: STXA_I	stxa	%r30, [%r17 + 0x0082] %asi
	.word 0xbe244000  ! 1050: SUB_R	sub 	%r17, %r0, %r31
T3_asi_reg_wr_42:
	mov	0x6, %r14
	.word 0xf6f389e0  ! 1052: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 39)
	.word 0xb49d0000  ! 1057: XORcc_R	xorcc 	%r20, %r0, %r26
	.word 0xf4750000  ! 1059: STX_R	stx	%r26, [%r20 + %r0]
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_43:
	mov	0x3c5, %r14
	.word 0xf6f384a0  ! 1063: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_wr_44:
	mov	0x35, %r14
	.word 0xfcf38e40  ! 1064: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 35)
	.word 0xf0adc020  ! 1070: STBA_R	stba	%r24, [%r23 + %r0] 0x01
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_39:
	mov	0x19, %r14
	.word 0xfadb8e80  ! 1073: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_rd_40:
	mov	0x30, %r14
	.word 0xf2db8e40  ! 1074: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfab48020  ! 1077: STHA_R	stha	%r29, [%r18 + %r0] 0x01
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_wr_45:
	mov	0x26, %r14
	.word 0xf2f38e60  ! 1081: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfe24209c  ! 1082: STW_I	stw	%r31, [%r16 + 0x009c]
	.word 0xf8a521ac  ! 1083: STWA_I	stwa	%r28, [%r20 + 0x01ac] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_41:
	mov	0x16, %r14
	.word 0xfcdb89e0  ! 1087: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T3_asi_reg_rd_42:
	mov	0x3c8, %r14
	.word 0xf6db89e0  ! 1088: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, a)
	.word 0xfa75c000  ! 1091: STX_R	stx	%r29, [%r23 + %r0]
T3_asi_reg_wr_46:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 1095: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_77:
	setx	0x270232, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2d0000  ! 1098: STB_R	stb	%r31, [%r20 + %r0]
T3_asi_reg_rd_43:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 1100: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_rd_44:
	mov	0x10, %r14
	.word 0xfedb8e40  ! 1102: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_78:
	setx	0x24032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_79:
	setx	0x260314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_80:
	setx	0x27021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_47:
	mov	0x1a, %r14
	.word 0xfaf389e0  ! 1110: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfab420e4  ! 1111: STHA_I	stha	%r29, [%r16 + 0x00e4] %asi
	.word 0xf075a0c2  ! 1112: STX_I	stx	%r24, [%r22 + 0x00c2]
	.word 0xf6246032  ! 1115: STW_I	stw	%r27, [%r17 + 0x0032]
cpu_intr_3_81:
	setx	0x260213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 38)
	.word 0xfe24e04a  ! 1120: STW_I	stw	%r31, [%r19 + 0x004a]
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_82:
	setx	0x240137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb814209e  ! 1124: OR_I	or 	%r16, 0x009e, %r28
	.word 0xfcf5a0d6  ! 1125: STXA_I	stxa	%r30, [%r22 + 0x00d6] %asi
T3_asi_reg_rd_45:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 1126: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_rd_46:
	mov	0x7, %r14
	.word 0xf0db8e40  ! 1127: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf8a4a18b  ! 1130: STWA_I	stwa	%r28, [%r18 + 0x018b] %asi
cpu_intr_3_83:
	setx	0x260029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a58020  ! 1134: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 14)
	.word 0xfc740000  ! 1138: STX_R	stx	%r30, [%r16 + %r0]
	.word 0x879521bf  ! 1142: WRPR_TT_I	wrpr	%r20, 0x01bf, %tt
	.word 0xf6754000  ! 1147: STX_R	stx	%r27, [%r21 + %r0]
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_84:
	setx	0x24010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf4601b  ! 1152: STXA_I	stxa	%r30, [%r17 + 0x001b] %asi
T3_asi_reg_wr_48:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 1154: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_85:
	setx	0x24003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819828c8  ! 1157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c8, %hpstate
T3_asi_reg_wr_49:
	mov	0x6, %r14
	.word 0xf0f38e40  ! 1159: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf2a58020  ! 1161: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
cpu_intr_3_86:
	setx	0x250324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c8000  ! 1163: SRA_R	sra 	%r18, %r0, %r30
	.word 0xf2a561b3  ! 1164: STWA_I	stwa	%r25, [%r21 + 0x01b3] %asi
T3_asi_reg_rd_47:
	mov	0x23, %r14
	.word 0xfcdb8e40  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbc950000  ! 1166: ORcc_R	orcc 	%r20, %r0, %r30
	.word 0xf22d2028  ! 1171: STB_I	stb	%r25, [%r20 + 0x0028]
T3_asi_reg_rd_48:
	mov	0x3c3, %r14
	.word 0xfcdb8400  ! 1172: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfe3561a8  ! 1173: STH_I	sth	%r31, [%r21 + 0x01a8]
	.word 0x8794a0a0  ! 1176: WRPR_TT_I	wrpr	%r18, 0x00a0, %tt
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfc7420cf  ! 1178: STX_I	stx	%r30, [%r16 + 0x00cf]
	.word 0xf8b44020  ! 1180: STHA_R	stha	%r28, [%r17 + %r0] 0x01
	.word 0xbaa4210a  ! 1181: SUBcc_I	subcc 	%r16, 0x010a, %r29
	.word 0xfe74c000  ! 1182: STX_R	stx	%r31, [%r19 + %r0]
T3_asi_reg_wr_50:
	mov	0x2a, %r14
	.word 0xfcf38e40  ! 1183: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfe354000  ! 1186: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xfc74c000  ! 1188: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xfaa44020  ! 1189: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	.word 0xf22de164  ! 1190: STB_I	stb	%r25, [%r23 + 0x0164]
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 27)
	.word 0xfe34c000  ! 1194: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xbf2c3001  ! 1195: SLLX_I	sllx	%r16, 0x0001, %r31
	.word 0xf2aca1b0  ! 1196: STBA_I	stba	%r25, [%r18 + 0x01b0] %asi
	.word 0xf8348000  ! 1197: STH_R	sth	%r28, [%r18 + %r0]
T3_asi_reg_rd_49:
	mov	0x30, %r14
	.word 0xf8db8e60  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_51:
	mov	0x8, %r14
	.word 0xf6f38e40  ! 1199: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_87:
	setx	0x270305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac8020  ! 1203: STBA_R	stba	%r27, [%r18 + %r0] 0x01
	.word 0xf875c000  ! 1206: STX_R	stx	%r28, [%r23 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xfc2d61dc  ! 1214: STB_I	stb	%r30, [%r21 + 0x01dc]
cpu_intr_3_88:
	setx	0x260321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b48020  ! 1218: STHA_R	stha	%r28, [%r18 + %r0] 0x01
	.word 0xf8b4a14f  ! 1220: STHA_I	stha	%r28, [%r18 + 0x014f] %asi
	.word 0xfe358000  ! 1221: STH_R	sth	%r31, [%r22 + %r0]
T3_asi_reg_wr_52:
	mov	0x19, %r14
	.word 0xfef38e40  ! 1223: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf075e1af  ! 1224: STX_I	stx	%r24, [%r23 + 0x01af]
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x8198394a  ! 1225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194a, %hpstate
	.word 0xfa24e10b  ! 1229: STW_I	stw	%r29, [%r19 + 0x010b]
	ta	T_CHANGE_HPRIV
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 18)
	.word 0xb2a4c000  ! 1236: SUBcc_R	subcc 	%r19, %r0, %r25
cpu_intr_3_89:
	setx	0x250015, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_90:
	setx	0x27002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_53:
	mov	0x37, %r14
	.word 0xf2f384a0  ! 1244: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf025a0e3  ! 1245: STW_I	stw	%r24, [%r22 + 0x00e3]
	.word 0xfc742169  ! 1247: STX_I	stx	%r30, [%r16 + 0x0169]
	.word 0xbc1c0000  ! 1248: XOR_R	xor 	%r16, %r0, %r30
cpu_intr_3_91:
	setx	0x270013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275e11b  ! 1252: STX_I	stx	%r25, [%r23 + 0x011b]
T3_asi_reg_wr_54:
	mov	0x3c1, %r14
	.word 0xf6f384a0  ! 1253: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfc2521a6  ! 1255: STW_I	stw	%r30, [%r20 + 0x01a6]
	.word 0xf0f4e0ea  ! 1256: STXA_I	stxa	%r24, [%r19 + 0x00ea] %asi
	.word 0xbe0d8000  ! 1257: AND_R	and 	%r22, %r0, %r31
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983dc8  ! 1258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc8, %hpstate
	.word 0xf2b4e17e  ! 1263: STHA_I	stha	%r25, [%r19 + 0x017e] %asi
	.word 0xf8a4217d  ! 1264: STWA_I	stwa	%r28, [%r16 + 0x017d] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xfaaca14f  ! 1270: STBA_I	stba	%r29, [%r18 + 0x014f] %asi
T3_asi_reg_wr_55:
	mov	0xf, %r14
	.word 0xf6f389e0  ! 1272: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_wr_56:
	mov	0x2b, %r14
	.word 0xf2f38e60  ! 1275: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_rd_50:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 1276: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb0c4618a  ! 1278: ADDCcc_I	addccc 	%r17, 0x018a, %r24
cpu_intr_3_92:
	setx	0x270324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf7d4400  ! 1285: MOVR_R	movre	%r21, %r0, %r31
	.word 0xb294e043  ! 1286: ORcc_I	orcc 	%r19, 0x0043, %r25
T3_asi_reg_rd_51:
	mov	0x3c8, %r14
	.word 0xfadb8e60  ! 1287: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf2ace009  ! 1289: STBA_I	stba	%r25, [%r19 + 0x0009] %asi
	.word 0xfa2c0000  ! 1292: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xb8954000  ! 1295: ORcc_R	orcc 	%r21, %r0, %r28
cpu_intr_3_93:
	setx	0x270027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a5a012  ! 1299: STWA_I	stwa	%r27, [%r22 + 0x0012] %asi
	.word 0xf42d618e  ! 1300: STB_I	stb	%r26, [%r21 + 0x018e]
	.word 0xf025e185  ! 1301: STW_I	stw	%r24, [%r23 + 0x0185]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_94:
	setx	0x25013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_95:
	setx	0x26031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_96:
	setx	0x25030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfea4a198  ! 1318: STWA_I	stwa	%r31, [%r18 + 0x0198] %asi
	.word 0xfe750000  ! 1319: STX_R	stx	%r31, [%r20 + %r0]
cpu_intr_3_97:
	setx	0x25031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 2e)
	.word 0xb72cc000  ! 1322: SLL_R	sll 	%r19, %r0, %r27
T3_asi_reg_rd_52:
	mov	0x18, %r14
	.word 0xf2db8e40  ! 1323: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf6b48020  ! 1324: STHA_R	stha	%r27, [%r18 + %r0] 0x01
	.word 0xfeb58020  ! 1327: STHA_R	stha	%r31, [%r22 + %r0] 0x01
cpu_intr_3_98:
	setx	0x250015, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d92  ! 1332: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d92, %hpstate
	.word 0xbf341000  ! 1333: SRLX_R	srlx	%r16, %r0, %r31
	.word 0xf6f5a03e  ! 1334: STXA_I	stxa	%r27, [%r22 + 0x003e] %asi
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c5a  ! 1335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5a, %hpstate
	.word 0xf6ad4020  ! 1338: STBA_R	stba	%r27, [%r21 + %r0] 0x01
	.word 0xf0ade0cc  ! 1339: STBA_I	stba	%r24, [%r23 + 0x00cc] %asi
T3_asi_reg_rd_53:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 1340: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf0acc020  ! 1341: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	.word 0xfea461db  ! 1343: STWA_I	stwa	%r31, [%r17 + 0x01db] %asi
	.word 0xf6a5e127  ! 1345: STWA_I	stwa	%r27, [%r23 + 0x0127] %asi
	.word 0xf475a188  ! 1346: STX_I	stx	%r26, [%r22 + 0x0188]
	.word 0xb17cc400  ! 1349: MOVR_R	movre	%r19, %r0, %r24
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 17)
	.word 0xfc2da026  ! 1355: STB_I	stb	%r30, [%r22 + 0x0026]
	.word 0xf035607d  ! 1358: STH_I	sth	%r24, [%r21 + 0x007d]
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982cc0  ! 1360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc0, %hpstate
T3_asi_reg_rd_54:
	mov	0x33, %r14
	.word 0xf4db8e60  ! 1361: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb0ac4000  ! 1364: ANDNcc_R	andncc 	%r17, %r0, %r24
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 8)
	.word 0xf22da007  ! 1369: STB_I	stb	%r25, [%r22 + 0x0007]
T3_asi_reg_wr_57:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 1371: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfe242102  ! 1374: STW_I	stw	%r31, [%r16 + 0x0102]
	.word 0xfa25e0cf  ! 1378: STW_I	stw	%r29, [%r23 + 0x00cf]
	.word 0xbca5205a  ! 1379: SUBcc_I	subcc 	%r20, 0x005a, %r30
cpu_intr_3_99:
	setx	0x260125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22d4000  ! 1381: ANDN_R	andn 	%r21, %r0, %r25
T3_asi_reg_rd_55:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbeb54000  ! 1388: SUBCcc_R	orncc 	%r21, %r0, %r31
T3_asi_reg_wr_58:
	mov	0x3, %r14
	.word 0xfaf38e40  ! 1389: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfa25615c  ! 1391: STW_I	stw	%r29, [%r21 + 0x015c]
	.word 0xbf353001  ! 1392: SRLX_I	srlx	%r20, 0x0001, %r31
T3_asi_reg_wr_59:
	mov	0xb, %r14
	.word 0xfcf38e40  ! 1393: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, c)
	.word 0xfa2d20cf  ! 1401: STB_I	stb	%r29, [%r20 + 0x00cf]
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_100:
	setx	0x2b0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b40020  ! 1405: STHA_R	stha	%r26, [%r16 + %r0] 0x01
cpu_intr_3_101:
	setx	0x280017, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_102:
	setx	0x2b010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, f)
	.word 0xb9510000  ! 1415: RDPR_TICK	rdpr	%tick, %r28
	.word 0xf235c000  ! 1417: STH_R	sth	%r25, [%r23 + %r0]
	ta	T_CHANGE_TO_TL1
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e5a  ! 1422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5a, %hpstate
	.word 0xb4ac0000  ! 1426: ANDNcc_R	andncc 	%r16, %r0, %r26
	.word 0xfaf561bc  ! 1428: STXA_I	stxa	%r29, [%r21 + 0x01bc] %asi
	.word 0xf8b50020  ! 1430: STHA_R	stha	%r28, [%r20 + %r0] 0x01
	.word 0xb895c000  ! 1431: ORcc_R	orcc 	%r23, %r0, %r28
	.word 0xb151c000  ! 1432: RDPR_TL	rdpr	%tl, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbc94c000  ! 1436: ORcc_R	orcc 	%r19, %r0, %r30
	.word 0xf6ac4020  ! 1437: STBA_R	stba	%r27, [%r17 + %r0] 0x01
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 31)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xf4f4e109  ! 1453: STXA_I	stxa	%r26, [%r19 + 0x0109] %asi
cpu_intr_3_103:
	setx	0x29001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_104:
	setx	0x280328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_105:
	setx	0x2b0039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_106:
	setx	0x2b0032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_107:
	setx	0x280318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 32)
	.word 0xf4752012  ! 1463: STX_I	stx	%r26, [%r20 + 0x0012]
cpu_intr_3_108:
	setx	0x2b012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_109:
	setx	0x2b0223, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_60:
	mov	0x34, %r14
	.word 0xf0f38400  ! 1466: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf4ada0f4  ! 1467: STBA_I	stba	%r26, [%r22 + 0x00f4] %asi
	.word 0xfaa4c020  ! 1471: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
	.word 0xf275214a  ! 1472: STX_I	stx	%r25, [%r20 + 0x014a]
	.word 0xb08d6112  ! 1473: ANDcc_I	andcc 	%r21, 0x0112, %r24
	.word 0xf0a44020  ! 1476: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
	.word 0xf2b44020  ! 1479: STHA_R	stha	%r25, [%r17 + %r0] 0x01
	.word 0xbc24e146  ! 1480: SUB_I	sub 	%r19, 0x0146, %r30
	.word 0xfc754000  ! 1481: STX_R	stx	%r30, [%r21 + %r0]
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 0)
	.word 0xb1510000  ! 1484: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_TO_TL0
	.word 0xf424a0c0  ! 1489: STW_I	stw	%r26, [%r18 + 0x00c0]
	.word 0xb3641800  ! 1490: MOVcc_R	<illegal instruction>
	.word 0xf2244000  ! 1493: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xf6346177  ! 1498: STH_I	sth	%r27, [%r17 + 0x0177]
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 32)
	.word 0xf8344000  ! 1500: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xf434a025  ! 1501: STH_I	sth	%r26, [%r18 + 0x0025]
T3_asi_reg_rd_56:
	mov	0x11, %r14
	.word 0xfedb8e40  ! 1503: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbc3d607e  ! 1504: XNOR_I	xnor 	%r21, 0x007e, %r30
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 1)
	.word 0xf024a00f  ! 1506: STW_I	stw	%r24, [%r18 + 0x000f]
	.word 0xfc3460ee  ! 1507: STH_I	sth	%r30, [%r17 + 0x00ee]
	.word 0xf6f4e197  ! 1508: STXA_I	stxa	%r27, [%r19 + 0x0197] %asi
cpu_intr_3_110:
	setx	0x2b0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8448000  ! 1510: ADDC_R	addc 	%r18, %r0, %r28
	.word 0xf0ad6013  ! 1513: STBA_I	stba	%r24, [%r21 + 0x0013] %asi
T3_asi_reg_rd_57:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_111:
	setx	0x290112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_112:
	setx	0x290003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfcac0020  ! 1525: STBA_R	stba	%r30, [%r16 + %r0] 0x01
cpu_intr_3_113:
	setx	0x2a0224, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_58:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 1528: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb49c202f  ! 1531: XORcc_I	xorcc 	%r16, 0x002f, %r26
cpu_intr_3_114:
	setx	0x28013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_115:
	setx	0x29023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_116:
	setx	0x2b0118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_117:
	setx	0x2b0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf4a1fc  ! 1540: STXA_I	stxa	%r29, [%r18 + 0x01fc] %asi
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_118:
	setx	0x290020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c8000  ! 1544: STB_R	stb	%r24, [%r18 + %r0]
T3_asi_reg_rd_59:
	mov	0x16, %r14
	.word 0xf8db8400  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T3_asi_reg_rd_60:
	mov	0x35, %r14
	.word 0xf2db8400  ! 1548: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf2f5a184  ! 1549: STXA_I	stxa	%r25, [%r22 + 0x0184] %asi
	.word 0xf0b5c020  ! 1552: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xb1358000  ! 1553: SRL_R	srl 	%r22, %r0, %r24
	.word 0xfab58020  ! 1554: STHA_R	stha	%r29, [%r22 + %r0] 0x01
T3_asi_reg_rd_61:
	mov	0x25, %r14
	.word 0xf0db8e80  ! 1556: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf035a029  ! 1562: STH_I	sth	%r24, [%r22 + 0x0029]
cpu_intr_3_119:
	setx	0x2b030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf2a4a030  ! 1574: STWA_I	stwa	%r25, [%r18 + 0x0030] %asi
	.word 0xf02d4000  ! 1578: STB_R	stb	%r24, [%r21 + %r0]
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfea4611b  ! 1581: STWA_I	stwa	%r31, [%r17 + 0x011b] %asi
	.word 0xfe358000  ! 1582: STH_R	sth	%r31, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 6)
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982fc0  ! 1587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc0, %hpstate
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_62:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 1589: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf22d214e  ! 1590: STB_I	stb	%r25, [%r20 + 0x014e]
T3_asi_reg_rd_63:
	mov	0x26, %r14
	.word 0xfadb8e80  ! 1592: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_120:
	setx	0x2b003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4adc020  ! 1596: STBA_R	stba	%r26, [%r23 + %r0] 0x01
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 39)
	.word 0xfeb5606b  ! 1598: STHA_I	stha	%r31, [%r21 + 0x006b] %asi
	.word 0xb52da001  ! 1600: SLL_I	sll 	%r22, 0x0001, %r26
	.word 0xfe7560ce  ! 1601: STX_I	stx	%r31, [%r21 + 0x00ce]
cpu_intr_3_121:
	setx	0x29000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x899520ec  ! 1604: WRPR_TICK_I	wrpr	%r20, 0x00ec, %tick
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 6)
	.word 0x919521f1  ! 1608: WRPR_PIL_I	wrpr	%r20, 0x01f1, %pil
	.word 0xf07460d9  ! 1609: STX_I	stx	%r24, [%r17 + 0x00d9]
T3_asi_reg_wr_61:
	mov	0xb, %r14
	.word 0xfcf389e0  ! 1610: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfc240000  ! 1618: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xf8b40020  ! 1619: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xf2ace04c  ! 1622: STBA_I	stba	%r25, [%r19 + 0x004c] %asi
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f1a  ! 1624: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f1a, %hpstate
	.word 0xf02d0000  ! 1625: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xba2ca1ed  ! 1626: ANDN_I	andn 	%r18, 0x01ed, %r29
	.word 0xb6ad8000  ! 1627: ANDNcc_R	andncc 	%r22, %r0, %r27
	.word 0xf4f4609a  ! 1629: STXA_I	stxa	%r26, [%r17 + 0x009a] %asi
cpu_intr_3_122:
	setx	0x2b0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca42095  ! 1632: STWA_I	stwa	%r30, [%r16 + 0x0095] %asi
T3_asi_reg_rd_64:
	mov	0x2b, %r14
	.word 0xf2db8e40  ! 1633: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf0a58020  ! 1634: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983ec8  ! 1637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec8, %hpstate
	.word 0xf23461ad  ! 1639: STH_I	sth	%r25, [%r17 + 0x01ad]
T3_asi_reg_rd_65:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 1640: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_62:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 1641: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 38)
	ta	T_CHANGE_HPRIV
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_rd_66:
	mov	0x11, %r14
	.word 0xf2db8e80  ! 1650: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_wr_63:
	mov	0x38, %r14
	.word 0xf8f38e60  ! 1651: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfcac0020  ! 1656: STBA_R	stba	%r30, [%r16 + %r0] 0x01
	.word 0xf6a4e0f5  ! 1658: STWA_I	stwa	%r27, [%r19 + 0x00f5] %asi
cpu_intr_3_123:
	setx	0x280204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa356184  ! 1660: STH_I	sth	%r29, [%r21 + 0x0184]
T3_asi_reg_wr_64:
	mov	0x26, %r14
	.word 0xfcf38e40  ! 1661: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf6a461c8  ! 1665: STWA_I	stwa	%r27, [%r17 + 0x01c8] %asi
	.word 0xb2b44000  ! 1666: ORNcc_R	orncc 	%r17, %r0, %r25
T3_asi_reg_rd_67:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 1668: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf82c0000  ! 1669: STB_R	stb	%r28, [%r16 + %r0]
T3_asi_reg_wr_65:
	mov	0x17, %r14
	.word 0xfcf384a0  ! 1672: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf0b5609c  ! 1674: STHA_I	stha	%r24, [%r21 + 0x009c] %asi
	.word 0xf02da15e  ! 1678: STB_I	stb	%r24, [%r22 + 0x015e]
T3_asi_reg_wr_66:
	mov	0xf, %r14
	.word 0xfcf38e40  ! 1681: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf0358000  ! 1682: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xf8244000  ! 1685: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xf2f4a0f7  ! 1687: STXA_I	stxa	%r25, [%r18 + 0x00f7] %asi
	.word 0xb2adc000  ! 1688: ANDNcc_R	andncc 	%r23, %r0, %r25
cpu_intr_3_124:
	setx	0x290007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b42111  ! 1690: STHA_I	stha	%r24, [%r16 + 0x0111] %asi
cpu_intr_3_125:
	setx	0x2b0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_67:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 1697: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
cpu_intr_3_126:
	setx	0x29033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25c000  ! 1706: STW_R	stw	%r30, [%r23 + %r0]
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_127:
	setx	0x2b003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf6ad8020  ! 1712: STBA_R	stba	%r27, [%r22 + %r0] 0x01
cpu_intr_3_128:
	setx	0x290334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24207b  ! 1716: STW_I	stw	%r31, [%r16 + 0x007b]
	.word 0xf0250000  ! 1717: STW_R	stw	%r24, [%r20 + %r0]
T3_asi_reg_rd_68:
	mov	0x2f, %r14
	.word 0xf4db89e0  ! 1718: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_129:
	setx	0x2a002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c0000  ! 1721: STB_R	stb	%r28, [%r16 + %r0]
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_130:
	setx	0x2a033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d4000  ! 1727: STB_R	stb	%r27, [%r21 + %r0]
cpu_intr_3_131:
	setx	0x2b0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfea52069  ! 1740: STWA_I	stwa	%r31, [%r20 + 0x0069] %asi
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 23)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf825e132  ! 1747: STW_I	stw	%r28, [%r23 + 0x0132]
	.word 0xf8b40020  ! 1748: STHA_R	stha	%r28, [%r16 + %r0] 0x01
T3_asi_reg_rd_69:
	mov	0x5, %r14
	.word 0xfcdb84a0  ! 1750: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb6ac2177  ! 1751: ANDNcc_I	andncc 	%r16, 0x0177, %r27
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_132:
	setx	0x28030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982a5a  ! 1756: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5a, %hpstate
cpu_intr_3_133:
	setx	0x280129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_134:
	setx	0x2b0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d206c  ! 1763: STB_I	stb	%r31, [%r20 + 0x006c]
cpu_intr_3_135:
	setx	0x2a0216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_136:
	setx	0x290201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 38)
	.word 0xfef56176  ! 1770: STXA_I	stxa	%r31, [%r21 + 0x0176] %asi
	.word 0xf8744000  ! 1771: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xf2b421fb  ! 1772: STHA_I	stha	%r25, [%r16 + 0x01fb] %asi
	.word 0xfeace11c  ! 1773: STBA_I	stba	%r31, [%r19 + 0x011c] %asi
	.word 0xfe2c0000  ! 1774: STB_R	stb	%r31, [%r16 + %r0]
T3_asi_reg_wr_68:
	mov	0x1, %r14
	.word 0xfcf389e0  ! 1776: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_137:
	setx	0x2b0311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_138:
	setx	0x2a002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a54020  ! 1783: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_70:
	mov	0x6, %r14
	.word 0xf2db8e40  ! 1788: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 33)
	.word 0xf8756048  ! 1792: STX_I	stx	%r28, [%r21 + 0x0048]
	.word 0xf62da1cd  ! 1795: STB_I	stb	%r27, [%r22 + 0x01cd]
cpu_intr_3_139:
	setx	0x2b0100, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_69:
	mov	0x1c, %r14
	.word 0xfaf38400  ! 1798: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfaac8020  ! 1799: STBA_R	stba	%r29, [%r18 + %r0] 0x01
	.word 0xf235e0e8  ! 1800: STH_I	sth	%r25, [%r23 + 0x00e8]
	.word 0xfa34600a  ! 1801: STH_I	sth	%r29, [%r17 + 0x000a]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_71:
	mov	0x34, %r14
	.word 0xf6db8e40  ! 1806: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_rd_72:
	mov	0x38, %r14
	.word 0xf6db8400  ! 1809: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_3_140:
	setx	0x28030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaad8020  ! 1814: STBA_R	stba	%r29, [%r22 + %r0] 0x01
cpu_intr_3_141:
	setx	0x2b031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f4a104  ! 1817: STXA_I	stxa	%r25, [%r18 + 0x0104] %asi
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_142:
	setx	0x280136, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_73:
	mov	0x2a, %r14
	.word 0xf8db8e40  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_143:
	setx	0x2a0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb58020  ! 1824: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_70:
	mov	0x30, %r14
	.word 0xf0f384a0  ! 1828: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfe34c000  ! 1838: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf2254000  ! 1839: STW_R	stw	%r25, [%r21 + %r0]
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 10)
	.word 0xfa2c8000  ! 1844: STB_R	stb	%r29, [%r18 + %r0]
cpu_intr_3_144:
	setx	0x28010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab44020  ! 1846: STHA_R	stha	%r29, [%r17 + %r0] 0x01
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 3)
	.word 0xf825c000  ! 1850: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xf6b4c020  ! 1851: STHA_R	stha	%r27, [%r19 + %r0] 0x01
T3_asi_reg_wr_71:
	mov	0x14, %r14
	.word 0xf4f389e0  ! 1852: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_145:
	setx	0x2a0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a5e073  ! 1862: STWA_I	stwa	%r24, [%r23 + 0x0073] %asi
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 3)
	.word 0xf4b40020  ! 1866: STHA_R	stha	%r26, [%r16 + %r0] 0x01
	.word 0xf6b50020  ! 1867: STHA_R	stha	%r27, [%r20 + %r0] 0x01
cpu_intr_3_146:
	setx	0x2a0103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_147:
	setx	0x2b0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba04a155  ! 1873: ADD_I	add 	%r18, 0x0155, %r29
T3_asi_reg_wr_72:
	mov	0x38, %r14
	.word 0xf8f38e40  ! 1878: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf22c21f8  ! 1879: STB_I	stb	%r25, [%r16 + 0x01f8]
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, b)
	.word 0xf62d2050  ! 1884: STB_I	stb	%r27, [%r20 + 0x0050]
T3_asi_reg_wr_73:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 1885: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf6f4e08b  ! 1889: STXA_I	stxa	%r27, [%r19 + 0x008b] %asi
	.word 0xfe75203e  ! 1893: STX_I	stx	%r31, [%r20 + 0x003e]
	.word 0xfe748000  ! 1898: STX_R	stx	%r31, [%r18 + %r0]
cpu_intr_3_148:
	setx	0x2c0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_149:
	setx	0x2c0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42ca1a1  ! 1907: STB_I	stb	%r26, [%r18 + 0x01a1]
T3_asi_reg_wr_74:
	mov	0x3c1, %r14
	.word 0xfef38e80  ! 1909: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf8ac0020  ! 1911: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xf6250000  ! 1912: STW_R	stw	%r27, [%r20 + %r0]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_150:
	setx	0x2d0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6adc020  ! 1915: STBA_R	stba	%r27, [%r23 + %r0] 0x01
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, c)
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_rd_74:
	mov	0x3c8, %r14
	.word 0xf2db8e60  ! 1921: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_wr_75:
	mov	0x1b, %r14
	.word 0xfef389e0  ! 1922: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf62560c5  ! 1924: STW_I	stw	%r27, [%r21 + 0x00c5]
	.word 0xf8344000  ! 1927: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xb01ce08b  ! 1930: XOR_I	xor 	%r19, 0x008b, %r24
	.word 0xf22ca169  ! 1931: STB_I	stb	%r25, [%r18 + 0x0169]
	.word 0xf22da0b0  ! 1935: STB_I	stb	%r25, [%r22 + 0x00b0]
cpu_intr_3_151:
	setx	0x2e0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2758000  ! 1938: STX_R	stx	%r25, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xfc240000  ! 1945: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xfaac8020  ! 1947: STBA_R	stba	%r29, [%r18 + %r0] 0x01
	.word 0xf8f4e11c  ! 1948: STXA_I	stxa	%r28, [%r19 + 0x011c] %asi
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 2c)
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_76:
	mov	0x12, %r14
	.word 0xf6f38e80  ! 1955: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb9358000  ! 1956: SRL_R	srl 	%r22, %r0, %r28
	.word 0xf6b4e12f  ! 1961: STHA_I	stha	%r27, [%r19 + 0x012f] %asi
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_rd_75:
	mov	0x29, %r14
	.word 0xf0db8400  ! 1966: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_152:
	setx	0x2d002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53c2001  ! 1973: SRA_I	sra 	%r16, 0x0001, %r26
cpu_intr_3_153:
	setx	0x2d030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad4020  ! 1977: STBA_R	stba	%r24, [%r21 + %r0] 0x01
	.word 0xbaa5a0a9  ! 1978: SUBcc_I	subcc 	%r22, 0x00a9, %r29
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 30)
	.word 0xb805a113  ! 1981: ADD_I	add 	%r22, 0x0113, %r28
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_154:
	setx	0x2e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcaca1cf  ! 1985: STBA_I	stba	%r30, [%r18 + 0x01cf] %asi
	ta	T_CHANGE_TO_TL0
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 33)
	ta	T_CHANGE_TO_TL1
	.word 0xb89d4000  ! 1992: XORcc_R	xorcc 	%r21, %r0, %r28
T3_asi_reg_wr_77:
	mov	0x4, %r14
	.word 0xfaf38e40  ! 1993: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfc2dc000  ! 1997: STB_R	stb	%r30, [%r23 + %r0]
cpu_intr_3_155:
	setx	0x2f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_156:
	setx	0x2c0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa344000  ! 2003: STH_R	sth	%r29, [%r17 + %r0]
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_wr_78:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 2005: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb005a105  ! 2009: ADD_I	add 	%r22, 0x0105, %r24
	.word 0xbe840000  ! 2010: ADDcc_R	addcc 	%r16, %r0, %r31
T3_asi_reg_wr_79:
	mov	0xb, %r14
	.word 0xfcf38e60  ! 2014: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf0a50020  ! 2017: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
cpu_intr_3_157:
	setx	0x2c0217, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_80:
	mov	0x8, %r14
	.word 0xfef38e40  ! 2019: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_158:
	setx	0x2f0236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 0)
	.word 0xf6b58020  ! 2022: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	.word 0xbb343001  ! 2024: SRLX_I	srlx	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_81:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 2028: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbf2d9000  ! 2029: SLLX_R	sllx	%r22, %r0, %r31
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 37)
	.word 0xf8b4213c  ! 2033: STHA_I	stha	%r28, [%r16 + 0x013c] %asi
	.word 0xf82c61de  ! 2036: STB_I	stb	%r28, [%r17 + 0x01de]
cpu_intr_3_159:
	setx	0x2f033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf675c000  ! 2046: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf8ad4020  ! 2047: STBA_R	stba	%r28, [%r21 + %r0] 0x01
T3_asi_reg_rd_76:
	mov	0x3c7, %r14
	.word 0xf4db89e0  ! 2050: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_77:
	mov	0x6, %r14
	.word 0xf6db84a0  ! 2056: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf8ac8020  ! 2059: STBA_R	stba	%r28, [%r18 + %r0] 0x01
T3_asi_reg_wr_82:
	mov	0xb, %r14
	.word 0xf2f38e40  ! 2061: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_160:
	setx	0x2f010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x919461cc  ! 2065: WRPR_PIL_I	wrpr	%r17, 0x01cc, %pil
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_78:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf62c8000  ! 2069: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xb77da401  ! 2071: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xb97d2401  ! 2072: MOVR_I	movre	%r20, 0x1, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xf2246179  ! 2075: STW_I	stw	%r25, [%r17 + 0x0179]
T3_asi_reg_rd_79:
	mov	0x17, %r14
	.word 0xf8db89e0  ! 2077: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf0ad8020  ! 2080: STBA_R	stba	%r24, [%r22 + %r0] 0x01
T3_asi_reg_rd_80:
	mov	0x38, %r14
	.word 0xf4db84a0  ! 2085: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf4ad0020  ! 2086: STBA_R	stba	%r26, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
cpu_intr_3_161:
	setx	0x2f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_162:
	setx	0x2c0020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_163:
	setx	0x2c0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_164:
	setx	0x2c0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_83:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 2099: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_3_165:
	setx	0x2c013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 2105: RDPR_PIL	rdpr	%pil, %r25
cpu_intr_3_166:
	setx	0x2d011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_wr_84:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 2108: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_rd_81:
	mov	0x2f, %r14
	.word 0xf2db8e60  ! 2113: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_167:
	setx	0x2d0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc758000  ! 2123: STX_R	stx	%r30, [%r22 + %r0]
cpu_intr_3_168:
	setx	0x2f0313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 31)
	.word 0xfcf5201f  ! 2132: STXA_I	stxa	%r30, [%r20 + 0x001f] %asi
	.word 0xf2a40020  ! 2133: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
	.word 0xf2352163  ! 2134: STH_I	sth	%r25, [%r20 + 0x0163]
cpu_intr_3_169:
	setx	0x2f0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c44000  ! 2137: ADDCcc_R	addccc 	%r17, %r0, %r28
T3_asi_reg_wr_85:
	mov	0xc, %r14
	.word 0xfef38e80  ! 2144: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfaada190  ! 2145: STBA_I	stba	%r29, [%r22 + 0x0190] %asi
	.word 0xf02421f2  ! 2146: STW_I	stw	%r24, [%r16 + 0x01f2]
	.word 0xf42da141  ! 2148: STB_I	stb	%r26, [%r22 + 0x0141]
cpu_intr_3_170:
	setx	0x2d0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf22de1f0  ! 2152: STB_I	stb	%r25, [%r23 + 0x01f0]
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_86:
	mov	0x3c4, %r14
	.word 0xfaf38e60  ! 2160: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfe2da055  ! 2163: STB_I	stb	%r31, [%r22 + 0x0055]
cpu_intr_3_171:
	setx	0x2f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x85956019  ! 2166: WRPR_TSTATE_I	wrpr	%r21, 0x0019, %tstate
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf2ad8020  ! 2169: STBA_R	stba	%r25, [%r22 + %r0] 0x01
	.word 0xb4bd6164  ! 2171: XNORcc_I	xnorcc 	%r21, 0x0164, %r26
T3_asi_reg_wr_87:
	mov	0x17, %r14
	.word 0xf2f384a0  ! 2174: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf4f420f8  ! 2176: STXA_I	stxa	%r26, [%r16 + 0x00f8] %asi
	.word 0xfeb5e057  ! 2178: STHA_I	stha	%r31, [%r23 + 0x0057] %asi
T3_asi_reg_wr_88:
	mov	0x14, %r14
	.word 0xf8f38e80  ! 2179: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_wr_89:
	mov	0x3c8, %r14
	.word 0xf8f38400  ! 2180: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_172:
	setx	0x2c012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0754000  ! 2190: STX_R	stx	%r24, [%r21 + %r0]
cpu_intr_3_173:
	setx	0x2c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 9)
	.word 0xf0354000  ! 2199: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xfc34c000  ! 2201: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xbc150000  ! 2205: OR_R	or 	%r20, %r0, %r30
	.word 0xf0f4a1c7  ! 2207: STXA_I	stxa	%r24, [%r18 + 0x01c7] %asi
	.word 0xf2746184  ! 2209: STX_I	stx	%r25, [%r17 + 0x0184]
cpu_intr_3_174:
	setx	0x2f0205, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_82:
	mov	0x2f, %r14
	.word 0xfadb8e40  ! 2211: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfa2c8000  ! 2212: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xfca58020  ! 2213: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_rd_83:
	mov	0x22, %r14
	.word 0xf0db8e80  ! 2219: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_wr_90:
	mov	0x0, %r14
	.word 0xf8f38400  ! 2220: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_175:
	setx	0x2f0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6758000  ! 2226: STX_R	stx	%r27, [%r22 + %r0]
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, e)
	.word 0xf4a44020  ! 2228: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 10)
	.word 0xfa24a01a  ! 2233: STW_I	stw	%r29, [%r18 + 0x001a]
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 13)
	.word 0x8f902000  ! 2238: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_176:
	setx	0x2d033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_84:
	mov	0xe, %r14
	.word 0xf4db84a0  ! 2244: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2f4a00e  ! 2246: STXA_I	stxa	%r25, [%r18 + 0x000e] %asi
	.word 0xb02ca16f  ! 2250: ANDN_I	andn 	%r18, 0x016f, %r24
	.word 0xfea5c020  ! 2255: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	.word 0xfc746111  ! 2259: STX_I	stx	%r30, [%r17 + 0x0111]
	.word 0xf6356015  ! 2264: STH_I	sth	%r27, [%r21 + 0x0015]
	.word 0xfea56078  ! 2265: STWA_I	stwa	%r31, [%r21 + 0x0078] %asi
cpu_intr_3_177:
	setx	0x2d013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 22)
	.word 0xfa2d0000  ! 2273: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xfc258000  ! 2276: STW_R	stw	%r30, [%r22 + %r0]
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 28)
	.word 0xfaade061  ! 2280: STBA_I	stba	%r29, [%r23 + 0x0061] %asi
cpu_intr_3_178:
	setx	0x2f0027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_179:
	setx	0x2c012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 2283: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xbc04218a  ! 2286: ADD_I	add 	%r16, 0x018a, %r30
	.word 0xfe348000  ! 2288: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf0a50020  ! 2289: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
	.word 0xfc35a047  ! 2290: STH_I	sth	%r30, [%r22 + 0x0047]
	.word 0xf2b54020  ! 2292: STHA_R	stha	%r25, [%r21 + %r0] 0x01
	.word 0xf6b560a6  ! 2294: STHA_I	stha	%r27, [%r21 + 0x00a6] %asi
	.word 0xf82c4000  ! 2295: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xf0ada1da  ! 2301: STBA_I	stba	%r24, [%r22 + 0x01da] %asi
	.word 0xf6256183  ! 2304: STW_I	stw	%r27, [%r21 + 0x0183]
T3_asi_reg_wr_91:
	mov	0x17, %r14
	.word 0xf4f38e40  ! 2305: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfa24a0cf  ! 2309: STW_I	stw	%r29, [%r18 + 0x00cf]
	.word 0xfcada03a  ! 2315: STBA_I	stba	%r30, [%r22 + 0x003a] %asi
	.word 0xfa2d4000  ! 2319: STB_R	stb	%r29, [%r21 + %r0]
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982dd2  ! 2320: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd2, %hpstate
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_85:
	mov	0x2b, %r14
	.word 0xf8db8e60  ! 2322: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_92:
	mov	0xa, %r14
	.word 0xfef38e80  ! 2325: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_180:
	setx	0x2d0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b4c000  ! 2328: ORNcc_R	orncc 	%r19, %r0, %r28
	.word 0xf02ce151  ! 2330: STB_I	stb	%r24, [%r19 + 0x0151]
	.word 0xf2ac8020  ! 2332: STBA_R	stba	%r25, [%r18 + %r0] 0x01
	.word 0xbaa4e145  ! 2334: SUBcc_I	subcc 	%r19, 0x0145, %r29
	.word 0xb93da001  ! 2335: SRA_I	sra 	%r22, 0x0001, %r28
	.word 0xfead0020  ! 2338: STBA_R	stba	%r31, [%r20 + %r0] 0x01
	.word 0xfc758000  ! 2341: STX_R	stx	%r30, [%r22 + %r0]
T3_asi_reg_wr_93:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 2343: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf2a58020  ! 2345: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	.word 0xf4b48020  ! 2346: STHA_R	stha	%r26, [%r18 + %r0] 0x01
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_181:
	setx	0x30011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf835615a  ! 2357: STH_I	sth	%r28, [%r21 + 0x015a]
	.word 0xfeb5c020  ! 2361: STHA_R	stha	%r31, [%r23 + %r0] 0x01
cpu_intr_3_182:
	setx	0x30022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac4020  ! 2363: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	.word 0xfcf5e144  ! 2364: STXA_I	stxa	%r30, [%r23 + 0x0144] %asi
	.word 0xf0a4c020  ! 2365: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	.word 0xfc34e0b1  ! 2367: STH_I	sth	%r30, [%r19 + 0x00b1]
	.word 0xfa74e139  ! 2368: STX_I	stx	%r29, [%r19 + 0x0139]
	.word 0xf62cc000  ! 2371: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xf4b50020  ! 2373: STHA_R	stha	%r26, [%r20 + %r0] 0x01
T3_asi_reg_wr_94:
	mov	0x3, %r14
	.word 0xf8f384a0  ! 2375: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbebda1fa  ! 2379: XNORcc_I	xnorcc 	%r22, 0x01fa, %r31
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, c)
	.word 0xf0258000  ! 2382: STW_R	stw	%r24, [%r22 + %r0]
cpu_intr_3_183:
	setx	0x310028, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_86:
	mov	0xd, %r14
	.word 0xfedb8e40  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfe740000  ! 2387: STX_R	stx	%r31, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983e52  ! 2389: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e52, %hpstate
	.word 0xbf2d5000  ! 2390: SLLX_R	sllx	%r21, %r0, %r31
	.word 0xf6f560d8  ! 2391: STXA_I	stxa	%r27, [%r21 + 0x00d8] %asi
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_rd_87:
	mov	0x2a, %r14
	.word 0xfadb8e60  ! 2393: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf8a54020  ! 2394: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
T3_asi_reg_wr_95:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 2399: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfe2c0000  ! 2403: STB_R	stb	%r31, [%r16 + %r0]
T3_asi_reg_rd_88:
	mov	0x2a, %r14
	.word 0xf0db8400  ! 2405: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_rd_89:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 2407: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb805214f  ! 2408: ADD_I	add 	%r20, 0x014f, %r28
T3_asi_reg_rd_90:
	mov	0x18, %r14
	.word 0xfadb84a0  ! 2409: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_184:
	setx	0x320232, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_91:
	mov	0xe, %r14
	.word 0xf8db8400  ! 2415: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb60cc000  ! 2416: AND_R	and 	%r19, %r0, %r27
	.word 0xf0254000  ! 2417: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xfead4020  ! 2418: STBA_R	stba	%r31, [%r21 + %r0] 0x01
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 12)
	.word 0xb08dc000  ! 2420: ANDcc_R	andcc 	%r23, %r0, %r24
T3_asi_reg_wr_96:
	mov	0x1b, %r14
	.word 0xfaf38e60  ! 2421: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 6)
	.word 0xf22ca047  ! 2425: STB_I	stb	%r25, [%r18 + 0x0047]
T3_asi_reg_wr_97:
	mov	0x3c7, %r14
	.word 0xfcf38400  ! 2428: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfcad6115  ! 2430: STBA_I	stba	%r30, [%r21 + 0x0115] %asi
T3_asi_reg_rd_92:
	mov	0x8, %r14
	.word 0xfedb8e80  ! 2431: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	ta	T_CHANGE_HPRIV
	.word 0xf0754000  ! 2436: STX_R	stx	%r24, [%r21 + %r0]
cpu_intr_3_185:
	setx	0x330125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6848000  ! 2440: ADDcc_R	addcc 	%r18, %r0, %r27
	.word 0xf82d6135  ! 2445: STB_I	stb	%r28, [%r21 + 0x0135]
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982990  ! 2449: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0990, %hpstate
	.word 0xf6744000  ! 2450: STX_R	stx	%r27, [%r17 + %r0]
T3_asi_reg_rd_93:
	mov	0x4, %r14
	.word 0xf6db84a0  ! 2451: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T3_asi_reg_wr_98:
	mov	0x3c2, %r14
	.word 0xfef38e80  ! 2452: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_186:
	setx	0x32033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 38)
	.word 0xfe24c000  ! 2459: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf074c000  ! 2460: STX_R	stx	%r24, [%r19 + %r0]
T3_asi_reg_rd_94:
	mov	0x30, %r14
	.word 0xfadb8e80  ! 2461: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_187:
	setx	0x30020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa758000  ! 2464: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xf82561ec  ! 2468: STW_I	stw	%r28, [%r21 + 0x01ec]
cpu_intr_3_188:
	setx	0x310116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf035c000  ! 2470: STH_R	sth	%r24, [%r23 + %r0]
T3_asi_reg_wr_99:
	mov	0x1c, %r14
	.word 0xfef38e40  ! 2471: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_rd_95:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 2478: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf6b46180  ! 2482: STHA_I	stha	%r27, [%r17 + 0x0180] %asi
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfc34a1ef  ! 2484: STH_I	sth	%r30, [%r18 + 0x01ef]
cpu_intr_3_189:
	setx	0x320315, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_100:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 2487: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf0aca004  ! 2488: STBA_I	stba	%r24, [%r18 + 0x0004] %asi
T3_asi_reg_rd_96:
	mov	0x3c7, %r14
	.word 0xf6db8400  ! 2489: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_3_190:
	setx	0x300101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81da1ff  ! 2495: XOR_I	xor 	%r22, 0x01ff, %r28
T3_asi_reg_rd_97:
	mov	0x2b, %r14
	.word 0xf8db8e80  ! 2498: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, f)
	.word 0xf8b50020  ! 2500: STHA_R	stha	%r28, [%r20 + %r0] 0x01
T3_asi_reg_rd_98:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 2501: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb2150000  ! 2503: OR_R	or 	%r20, %r0, %r25
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 0)
	ta	T_CHANGE_TO_TL1
	.word 0xfa74a0e7  ! 2510: STX_I	stx	%r29, [%r18 + 0x00e7]
	.word 0xf67421df  ! 2512: STX_I	stx	%r27, [%r16 + 0x01df]
T3_asi_reg_wr_101:
	mov	0x3c1, %r14
	.word 0xfef38e80  ! 2513: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_wr_102:
	mov	0x9, %r14
	.word 0xfcf38e40  ! 2516: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfe2cc000  ! 2518: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xf2a4c020  ! 2520: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
cpu_intr_3_191:
	setx	0x30011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0242065  ! 2524: STW_I	stw	%r24, [%r16 + 0x0065]
	.word 0xbd510000  ! 2527: RDPR_TICK	rdpr	%tick, %r30
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_99:
	mov	0x6, %r14
	.word 0xf0db89e0  ! 2529: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfe2de0c1  ! 2534: STB_I	stb	%r31, [%r23 + 0x00c1]
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_100:
	mov	0x23, %r14
	.word 0xfedb84a0  ! 2537: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0x83946162  ! 2540: WRPR_TNPC_I	wrpr	%r17, 0x0162, %tnpc
	.word 0xfca4204c  ! 2544: STWA_I	stwa	%r30, [%r16 + 0x004c] %asi
	.word 0xf62da07b  ! 2549: STB_I	stb	%r27, [%r22 + 0x007b]
cpu_intr_3_192:
	setx	0x300029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe748000  ! 2552: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xbc9d0000  ! 2554: XORcc_R	xorcc 	%r20, %r0, %r30
cpu_intr_3_193:
	setx	0x310014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 1d)
	.word 0x819460ba  ! 2561: WRPR_TPC_I	wrpr	%r17, 0x00ba, %tpc
cpu_intr_3_194:
	setx	0x330204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09d60b1  ! 2566: XORcc_I	xorcc 	%r21, 0x00b1, %r24
T3_asi_reg_rd_101:
	mov	0x26, %r14
	.word 0xfedb8e40  ! 2567: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_195:
	setx	0x31010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_196:
	setx	0x31030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca40020  ! 2573: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
T3_asi_reg_wr_103:
	mov	0x33, %r14
	.word 0xf8f389e0  ! 2574: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf22cc000  ! 2576: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xb6452010  ! 2577: ADDC_I	addc 	%r20, 0x0010, %r27
	.word 0xfa3460ed  ! 2579: STH_I	sth	%r29, [%r17 + 0x00ed]
cpu_intr_3_197:
	setx	0x30031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_104:
	mov	0x0, %r14
	.word 0xf0f38e60  ! 2582: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf224619c  ! 2587: STW_I	stw	%r25, [%r17 + 0x019c]
	.word 0xf435a0e3  ! 2589: STH_I	sth	%r26, [%r22 + 0x00e3]
	.word 0xf22c4000  ! 2592: STB_R	stb	%r25, [%r17 + %r0]
T3_asi_reg_rd_102:
	mov	0x1d, %r14
	.word 0xf0db89e0  ! 2593: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfcb56184  ! 2597: STHA_I	stha	%r30, [%r21 + 0x0184] %asi
	.word 0xfc252192  ! 2599: STW_I	stw	%r30, [%r20 + 0x0192]
T3_asi_reg_rd_103:
	mov	0x16, %r14
	.word 0xf2db89e0  ! 2600: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_wr_105:
	mov	0x21, %r14
	.word 0xf6f38e60  ! 2604: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_rd_104:
	mov	0xb, %r14
	.word 0xfadb89e0  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf8b461f1  ! 2607: STHA_I	stha	%r28, [%r17 + 0x01f1] %asi
T3_asi_reg_wr_106:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 2609: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf0a5a008  ! 2613: STWA_I	stwa	%r24, [%r22 + 0x0008] %asi
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 13)
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983c92  ! 2615: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c92, %hpstate
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 26)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_198:
	setx	0x320127, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_107:
	mov	0xe, %r14
	.word 0xf4f38e60  ! 2622: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf02dc000  ! 2624: STB_R	stb	%r24, [%r23 + %r0]
cpu_intr_3_199:
	setx	0x320315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf234e071  ! 2627: STH_I	sth	%r25, [%r19 + 0x0071]
	.word 0xfe24c000  ! 2628: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xfe2d2108  ! 2629: STB_I	stb	%r31, [%r20 + 0x0108]
	.word 0xb4b4c000  ! 2632: SUBCcc_R	orncc 	%r19, %r0, %r26
T3_asi_reg_rd_105:
	mov	0x5, %r14
	.word 0xf2db89e0  ! 2635: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfcb5c020  ! 2638: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982940  ! 2642: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0940, %hpstate
	.word 0xfe758000  ! 2643: STX_R	stx	%r31, [%r22 + %r0]
T3_asi_reg_rd_106:
	mov	0x35, %r14
	.word 0xf4db89e0  ! 2644: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbcb50000  ! 2645: ORNcc_R	orncc 	%r20, %r0, %r30
	.word 0xf0754000  ! 2647: STX_R	stx	%r24, [%r21 + %r0]
cpu_intr_3_200:
	setx	0x300222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf825e147  ! 2650: STW_I	stw	%r28, [%r23 + 0x0147]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_108:
	mov	0x32, %r14
	.word 0xf2f38e80  ! 2652: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_107:
	mov	0x10, %r14
	.word 0xf6db8e40  ! 2653: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf824e0dd  ! 2655: STW_I	stw	%r28, [%r19 + 0x00dd]
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 11)
	.word 0xbc148000  ! 2657: OR_R	or 	%r18, %r0, %r30
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 22)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_109:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 2661: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_201:
	setx	0x320100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_202:
	setx	0x30002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 16)
	.word 0x8f902001  ! 2665: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_wr_110:
	mov	0x3c1, %r14
	.word 0xfef38e80  ! 2673: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf0a44020  ! 2679: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
	.word 0xf424617b  ! 2680: STW_I	stw	%r26, [%r17 + 0x017b]
cpu_intr_3_203:
	setx	0x300330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89c203f  ! 2684: XORcc_I	xorcc 	%r16, 0x003f, %r28
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 2d)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_204:
	setx	0x33001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_111:
	mov	0x1b, %r14
	.word 0xf4f38e80  ! 2689: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T3_asi_reg_wr_112:
	mov	0x11, %r14
	.word 0xf2f384a0  ! 2690: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b4e1be  ! 2692: STHA_I	stha	%r28, [%r19 + 0x01be] %asi
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983810  ! 2699: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1810, %hpstate
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, f)
	.word 0xf02d8000  ! 2704: STB_R	stb	%r24, [%r22 + %r0]
T3_asi_reg_rd_108:
	mov	0x25, %r14
	.word 0xf8db89e0  ! 2707: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_205:
	setx	0x310019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa42057  ! 2710: STWA_I	stwa	%r29, [%r16 + 0x0057] %asi
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 13)
	.word 0xbaad21cc  ! 2714: ANDNcc_I	andncc 	%r20, 0x01cc, %r29
T3_asi_reg_wr_113:
	mov	0x3c4, %r14
	.word 0xf0f38e60  ! 2717: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 29)
	.word 0xf0b4e03e  ! 2722: STHA_I	stha	%r24, [%r19 + 0x003e] %asi
	.word 0xbc2d8000  ! 2723: ANDN_R	andn 	%r22, %r0, %r30
	.word 0xf8ac0020  ! 2724: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xf0ad4020  ! 2725: STBA_R	stba	%r24, [%r21 + %r0] 0x01
	.word 0xf8a4e0da  ! 2726: STWA_I	stwa	%r28, [%r19 + 0x00da] %asi
	.word 0xb49d8000  ! 2728: XORcc_R	xorcc 	%r22, %r0, %r26
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 3e)
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 28)
	.word 0xf6742174  ! 2733: STX_I	stx	%r27, [%r16 + 0x0174]
	.word 0xb6c58000  ! 2734: ADDCcc_R	addccc 	%r22, %r0, %r27
	.word 0xf2350000  ! 2741: STH_R	sth	%r25, [%r20 + %r0]
T3_asi_reg_wr_114:
	mov	0x0, %r14
	.word 0xfef389e0  ! 2744: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf6ac214b  ! 2746: STBA_I	stba	%r27, [%r16 + 0x014b] %asi
T3_asi_reg_rd_109:
	mov	0x20, %r14
	.word 0xf8db8400  ! 2747: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf2f42011  ! 2749: STXA_I	stxa	%r25, [%r16 + 0x0011] %asi
cpu_intr_3_206:
	setx	0x31020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead215c  ! 2752: STBA_I	stba	%r31, [%r20 + 0x015c] %asi
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 23)
	.word 0xb53d7001  ! 2756: SRAX_I	srax	%r21, 0x0001, %r26
	ta	T_CHANGE_TO_TL1
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 0)
	.word 0xfa35e03f  ! 2763: STH_I	sth	%r29, [%r23 + 0x003f]
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_207:
	setx	0x300300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6aca005  ! 2767: STBA_I	stba	%r27, [%r18 + 0x0005] %asi
T3_asi_reg_rd_110:
	mov	0x3c8, %r14
	.word 0xfedb8400  ! 2768: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_wr_115:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 2771: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_208:
	setx	0x330233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac0020  ! 2775: STBA_R	stba	%r26, [%r16 + %r0] 0x01
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 0)
	.word 0xfca5e13c  ! 2778: STWA_I	stwa	%r30, [%r23 + 0x013c] %asi
	.word 0xfca5e1cc  ! 2779: STWA_I	stwa	%r30, [%r23 + 0x01cc] %asi
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 2e)
	.word 0xb53de001  ! 2781: SRA_I	sra 	%r23, 0x0001, %r26
	.word 0xbd7d0400  ! 2787: MOVR_R	movre	%r20, %r0, %r30
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf6ada1ce  ! 2793: STBA_I	stba	%r27, [%r22 + 0x01ce] %asi
	.word 0xf835c000  ! 2797: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xf0b4c020  ! 2798: STHA_R	stha	%r24, [%r19 + %r0] 0x01
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf47460e1  ! 2801: STX_I	stx	%r26, [%r17 + 0x00e1]
T3_asi_reg_rd_111:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 2802: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xb425a081  ! 2806: SUB_I	sub 	%r22, 0x0081, %r26
cpu_intr_3_209:
	setx	0x36002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2df001  ! 2809: SLLX_I	sllx	%r23, 0x0001, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf0244000  ! 2815: STW_R	stw	%r24, [%r17 + %r0]
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf4258000  ! 2819: STW_R	stw	%r26, [%r22 + %r0]
cpu_intr_3_210:
	setx	0x360026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea50020  ! 2821: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 1b)
	.word 0xba8d8000  ! 2827: ANDcc_R	andcc 	%r22, %r0, %r29
	.word 0xbe2de1b3  ! 2828: ANDN_I	andn 	%r23, 0x01b3, %r31
cpu_intr_3_211:
	setx	0x34010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_112:
	mov	0x11, %r14
	.word 0xf2db84a0  ! 2830: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_113:
	mov	0xb, %r14
	.word 0xfadb84a0  ! 2831: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_rd_114:
	mov	0x36, %r14
	.word 0xf0db89e0  ! 2833: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfcb5e15c  ! 2834: STHA_I	stha	%r30, [%r23 + 0x015c] %asi
	.word 0xf22c611a  ! 2838: STB_I	stb	%r25, [%r17 + 0x011a]
T3_asi_reg_wr_116:
	mov	0x12, %r14
	.word 0xfcf38400  ! 2840: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf4a54020  ! 2841: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
cpu_intr_3_212:
	setx	0x370128, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbc046110  ! 2850: ADD_I	add 	%r17, 0x0110, %r30
	.word 0xf6ace197  ! 2851: STBA_I	stba	%r27, [%r19 + 0x0197] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 5)
	.word 0xf2f5a173  ! 2862: STXA_I	stxa	%r25, [%r22 + 0x0173] %asi
	.word 0xb4b58000  ! 2863: ORNcc_R	orncc 	%r22, %r0, %r26
	.word 0xf82c2096  ! 2864: STB_I	stb	%r28, [%r16 + 0x0096]
	.word 0xf235a0eb  ! 2867: STH_I	sth	%r25, [%r22 + 0x00eb]
	.word 0xb92d0000  ! 2868: SLL_R	sll 	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2b5c020  ! 2870: STHA_R	stha	%r25, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbebdc000  ! 2876: XNORcc_R	xnorcc 	%r23, %r0, %r31
	.word 0xf42c0000  ! 2878: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xf2750000  ! 2879: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xfa248000  ! 2881: STW_R	stw	%r29, [%r18 + %r0]
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf4b4a0ba  ! 2887: STHA_I	stha	%r26, [%r18 + 0x00ba] %asi
	.word 0xb6aca141  ! 2888: ANDNcc_I	andncc 	%r18, 0x0141, %r27
	ta	T_CHANGE_TO_TL0
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 38)
	.word 0xf2a560ec  ! 2892: STWA_I	stwa	%r25, [%r21 + 0x00ec] %asi
	.word 0xf6b5203b  ! 2894: STHA_I	stha	%r27, [%r20 + 0x003b] %asi
T3_asi_reg_wr_117:
	mov	0x21, %r14
	.word 0xfcf38e80  ! 2895: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
cpu_intr_3_213:
	setx	0x370030, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_118:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 2905: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf2242189  ! 2907: STW_I	stw	%r25, [%r16 + 0x0189]
cpu_intr_3_214:
	setx	0x350225, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982dc0  ! 2916: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc0, %hpstate
cpu_intr_3_215:
	setx	0x37003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb844e09e  ! 2919: ADDC_I	addc 	%r19, 0x009e, %r28
cpu_intr_3_216:
	setx	0x370318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_217:
	setx	0x360129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_218:
	setx	0x37021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2c6001  ! 2925: SLL_I	sll 	%r17, 0x0001, %r30
	.word 0xfa752067  ! 2926: STX_I	stx	%r29, [%r20 + 0x0067]
T3_asi_reg_wr_119:
	mov	0x29, %r14
	.word 0xfaf38e40  ! 2929: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983d0a  ! 2931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0a, %hpstate
	.word 0xfea5c020  ! 2932: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf624a0e0  ! 2948: STW_I	stw	%r27, [%r18 + 0x00e0]
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 29)
	.word 0xfcada019  ! 2957: STBA_I	stba	%r30, [%r22 + 0x0019] %asi
cpu_intr_3_219:
	setx	0x370308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_220:
	setx	0x340017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_221:
	setx	0x370029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_222:
	setx	0x370017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_223:
	setx	0x37021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_115:
	mov	0x38, %r14
	.word 0xfedb89e0  ! 2968: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_3_224:
	setx	0x34011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf075e09d  ! 2971: STX_I	stx	%r24, [%r23 + 0x009d]
cpu_intr_3_225:
	setx	0x37002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53d4000  ! 2974: SRA_R	sra 	%r21, %r0, %r26
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 16)
	.word 0xfa2ca182  ! 2979: STB_I	stb	%r29, [%r18 + 0x0182]
	.word 0xf0b5a130  ! 2980: STHA_I	stha	%r24, [%r22 + 0x0130] %asi
	.word 0xf0b40020  ! 2982: STHA_R	stha	%r24, [%r16 + %r0] 0x01
cpu_intr_3_226:
	setx	0x37000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab50020  ! 2987: STHA_R	stha	%r29, [%r20 + %r0] 0x01
	.word 0xfcb5a145  ! 2988: STHA_I	stha	%r30, [%r22 + 0x0145] %asi
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 34)
	.word 0xfa74e1ca  ! 2992: STX_I	stx	%r29, [%r19 + 0x01ca]
cpu_intr_3_227:
	setx	0x34031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 16)
	.word 0xf4ac4020  ! 2999: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xba3d61bd  ! 3000: XNOR_I	xnor 	%r21, 0x01bd, %r29
T3_asi_reg_wr_120:
	mov	0x5, %r14
	.word 0xfcf389e0  ! 3008: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6f420b0  ! 3018: STXA_I	stxa	%r27, [%r16 + 0x00b0] %asi
	.word 0xbf3d6001  ! 3020: SRA_I	sra 	%r21, 0x0001, %r31
	.word 0xf2340000  ! 3022: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xfab58020  ! 3024: STHA_R	stha	%r29, [%r22 + %r0] 0x01
T3_asi_reg_wr_121:
	mov	0x0, %r14
	.word 0xfcf384a0  ! 3025: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_228:
	setx	0x370135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42da0e4  ! 3028: STB_I	stb	%r26, [%r22 + 0x00e4]
	.word 0xf27421ab  ! 3029: STX_I	stx	%r25, [%r16 + 0x01ab]
	.word 0xf4f560bb  ! 3030: STXA_I	stxa	%r26, [%r21 + 0x00bb] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 0)
	.word 0xb12de001  ! 3036: SLL_I	sll 	%r23, 0x0001, %r24
	.word 0xfa25c000  ! 3037: STW_R	stw	%r29, [%r23 + %r0]
T3_asi_reg_rd_116:
	mov	0x29, %r14
	.word 0xfadb89e0  ! 3038: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfca4a02a  ! 3039: STWA_I	stwa	%r30, [%r18 + 0x002a] %asi
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_HPRIV
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_rd_117:
	mov	0xe, %r14
	.word 0xf4db89e0  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_229:
	setx	0x370102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34e0d7  ! 3048: STH_I	sth	%r30, [%r19 + 0x00d7]
T3_asi_reg_rd_118:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 3051: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf6b4205f  ! 3052: STHA_I	stha	%r27, [%r16 + 0x005f] %asi
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfa2cc000  ! 3058: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xfcb5c020  ! 3059: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0xf625a029  ! 3062: STW_I	stw	%r27, [%r22 + 0x0029]
	.word 0xf235e1a9  ! 3063: STH_I	sth	%r25, [%r23 + 0x01a9]
	.word 0xf8f5a05e  ! 3064: STXA_I	stxa	%r28, [%r22 + 0x005e] %asi
	.word 0xfe2dc000  ! 3065: STB_R	stb	%r31, [%r23 + %r0]
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_230:
	setx	0x370025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24a14d  ! 3070: STW_I	stw	%r31, [%r18 + 0x014d]
T3_asi_reg_rd_119:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf2ac8020  ! 3076: STBA_R	stba	%r25, [%r18 + %r0] 0x01
cpu_intr_3_231:
	setx	0x350129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d6030  ! 3079: STB_I	stb	%r24, [%r21 + 0x0030]
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf4ac0020  ! 3086: STBA_R	stba	%r26, [%r16 + %r0] 0x01
cpu_intr_3_232:
	setx	0x360215, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_120:
	mov	0x2f, %r14
	.word 0xf6db84a0  ! 3088: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf4a520db  ! 3089: STWA_I	stwa	%r26, [%r20 + 0x00db] %asi
T3_asi_reg_wr_122:
	mov	0x1c, %r14
	.word 0xfef38e80  ! 3096: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_233:
	setx	0x34022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcad8020  ! 3099: STBA_R	stba	%r30, [%r22 + %r0] 0x01
	.word 0xb8942068  ! 3101: ORcc_I	orcc 	%r16, 0x0068, %r28
	.word 0xb4940000  ! 3102: ORcc_R	orcc 	%r16, %r0, %r26
	.word 0xbc9521c3  ! 3103: ORcc_I	orcc 	%r20, 0x01c3, %r30
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983ac2  ! 3104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac2, %hpstate
T3_asi_reg_rd_121:
	mov	0x9, %r14
	.word 0xfcdb8e40  ! 3107: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf82d4000  ! 3109: STB_R	stb	%r28, [%r21 + %r0]
cpu_intr_3_234:
	setx	0x34001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb294c000  ! 3112: ORcc_R	orcc 	%r19, %r0, %r25
cpu_intr_3_235:
	setx	0x360217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4040000  ! 3116: ADD_R	add 	%r16, %r0, %r26
	.word 0xb04460da  ! 3117: ADDC_I	addc 	%r17, 0x00da, %r24
cpu_intr_3_236:
	setx	0x35010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_122:
	mov	0x33, %r14
	.word 0xf8db8400  ! 3124: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb43ca0d6  ! 3125: XNOR_I	xnor 	%r18, 0x00d6, %r26
T3_asi_reg_wr_123:
	mov	0x2f, %r14
	.word 0xfaf38e60  ! 3126: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf6b4c020  ! 3131: STHA_R	stha	%r27, [%r19 + %r0] 0x01
cpu_intr_3_237:
	setx	0x340207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_123:
	mov	0x24, %r14
	.word 0xf8db89e0  ! 3135: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf2b54020  ! 3138: STHA_R	stha	%r25, [%r21 + %r0] 0x01
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 32)
	.word 0xf2a54020  ! 3141: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xf2f46050  ! 3147: STXA_I	stxa	%r25, [%r17 + 0x0050] %asi
T3_asi_reg_rd_124:
	mov	0x3c8, %r14
	.word 0xfedb8400  ! 3150: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_238:
	setx	0x340131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6acc020  ! 3156: STBA_R	stba	%r27, [%r19 + %r0] 0x01
T3_asi_reg_wr_124:
	mov	0xa, %r14
	.word 0xf2f38400  ! 3157: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_125:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 3159: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_rd_125:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 3160: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 11)
	.word 0x8f902000  ! 3170: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xbcada186  ! 3171: ANDNcc_I	andncc 	%r22, 0x0186, %r30
	.word 0xf0f521f8  ! 3175: STXA_I	stxa	%r24, [%r20 + 0x01f8] %asi
cpu_intr_3_239:
	setx	0x370303, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf22d8000  ! 3181: STB_R	stb	%r25, [%r22 + %r0]
cpu_intr_3_240:
	setx	0x37002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_126:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 3184: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbe45211c  ! 3186: ADDC_I	addc 	%r20, 0x011c, %r31
	.word 0xfa340000  ! 3189: STH_R	sth	%r29, [%r16 + %r0]
T3_asi_reg_wr_126:
	mov	0x2d, %r14
	.word 0xf6f38e40  ! 3190: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb3520000  ! 3191: RDPR_PIL	rdpr	%pil, %r25
	.word 0xf2b42045  ! 3192: STHA_I	stha	%r25, [%r16 + 0x0045] %asi
cpu_intr_3_241:
	setx	0x350325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63560ce  ! 3195: STH_I	sth	%r27, [%r21 + 0x00ce]
	.word 0xfca44020  ! 3196: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
T3_asi_reg_wr_127:
	mov	0x8, %r14
	.word 0xf6f38400  ! 3203: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_127:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 3205: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 1c)
	.word 0xb8b58000  ! 3211: SUBCcc_R	orncc 	%r22, %r0, %r28
	.word 0xf224a1b3  ! 3215: STW_I	stw	%r25, [%r18 + 0x01b3]
cpu_intr_3_242:
	setx	0x340037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac4020  ! 3220: STBA_R	stba	%r29, [%r17 + %r0] 0x01
cpu_intr_3_243:
	setx	0x370226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_244:
	setx	0x370028, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_128:
	mov	0xb, %r14
	.word 0xf2f38e80  ! 3225: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_128:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 3226: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfc74202f  ! 3232: STX_I	stx	%r30, [%r16 + 0x002f]
	.word 0xf0248000  ! 3234: STW_R	stw	%r24, [%r18 + %r0]
T3_asi_reg_wr_129:
	mov	0xb, %r14
	.word 0xf4f38400  ! 3239: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c52  ! 3242: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c52, %hpstate
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_wr_130:
	mov	0x38, %r14
	.word 0xfef38e60  ! 3245: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_245:
	setx	0x380034, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_131:
	mov	0x3c5, %r14
	.word 0xfcf38400  ! 3247: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 3b)
	.word 0xbb2c3001  ! 3249: SLLX_I	sllx	%r16, 0x0001, %r29
cpu_intr_3_246:
	setx	0x38011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_247:
	setx	0x3b021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_rd_129:
	mov	0xd, %r14
	.word 0xfedb89e0  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf02c8000  ! 3257: STB_R	stb	%r24, [%r18 + %r0]
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 3a)
	.word 0xbcac0000  ! 3263: ANDNcc_R	andncc 	%r16, %r0, %r30
	.word 0xb69de0cb  ! 3264: XORcc_I	xorcc 	%r23, 0x00cb, %r27
	.word 0xfea4c020  ! 3265: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
cpu_intr_3_248:
	setx	0x3b002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4250000  ! 3269: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xfeade1cc  ! 3270: STBA_I	stba	%r31, [%r23 + 0x01cc] %asi
	.word 0xf2b58020  ! 3271: STHA_R	stha	%r25, [%r22 + %r0] 0x01
	.word 0xf875a1d9  ! 3272: STX_I	stx	%r28, [%r22 + 0x01d9]
cpu_intr_3_249:
	setx	0x38020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_130:
	mov	0xd, %r14
	.word 0xf0db89e0  ! 3274: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfcf4a03f  ! 3275: STXA_I	stxa	%r30, [%r18 + 0x003f] %asi
cpu_intr_3_250:
	setx	0x3a0309, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_131:
	mov	0x12, %r14
	.word 0xfadb84a0  ! 3277: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_TO_TL1
cpu_intr_3_251:
	setx	0x380010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef4e02d  ! 3280: STXA_I	stxa	%r31, [%r19 + 0x002d] %asi
T3_asi_reg_wr_132:
	mov	0x20, %r14
	.word 0xf2f384a0  ! 3281: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfc744000  ! 3283: STX_R	stx	%r30, [%r17 + %r0]
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_133:
	mov	0x26, %r14
	.word 0xf8f38e60  ! 3286: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_rd_132:
	mov	0x2, %r14
	.word 0xf0db8e40  ! 3287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_252:
	setx	0x3b0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac6017  ! 3294: STBA_I	stba	%r24, [%r17 + 0x0017] %asi
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 10)
	.word 0xb7500000  ! 3298: RDPR_TPC	rdpr	%tpc, %r27
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 8)
	.word 0xf6758000  ! 3303: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xf0244000  ! 3306: STW_R	stw	%r24, [%r17 + %r0]
T3_asi_reg_rd_133:
	mov	0x36, %r14
	.word 0xf2db8400  ! 3307: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfe2421d1  ! 3313: STW_I	stw	%r31, [%r16 + 0x01d1]
	.word 0xf2b54020  ! 3316: STHA_R	stha	%r25, [%r21 + %r0] 0x01
	.word 0xf6346017  ! 3317: STH_I	sth	%r27, [%r17 + 0x0017]
	.word 0xfc74a090  ! 3321: STX_I	stx	%r30, [%r18 + 0x0090]
	.word 0xbb518000  ! 3323: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_134:
	mov	0x2e, %r14
	.word 0xf0f389e0  ! 3328: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 7)
	.word 0xbcade181  ! 3330: ANDNcc_I	andncc 	%r23, 0x0181, %r30
	.word 0xf4ac4020  ! 3331: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xfa740000  ! 3332: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xf8b5e15c  ! 3333: STHA_I	stha	%r28, [%r23 + 0x015c] %asi
	.word 0xf4ac8020  ! 3335: STBA_R	stba	%r26, [%r18 + %r0] 0x01
	.word 0xfc344000  ! 3337: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xb42d6091  ! 3339: ANDN_I	andn 	%r21, 0x0091, %r26
cpu_intr_3_253:
	setx	0x390339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61c8000  ! 3345: XOR_R	xor 	%r18, %r0, %r27
	.word 0xf6ac21b2  ! 3346: STBA_I	stba	%r27, [%r16 + 0x01b2] %asi
	.word 0xf8a42134  ! 3347: STWA_I	stwa	%r28, [%r16 + 0x0134] %asi
T3_asi_reg_wr_135:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 3351: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_254:
	setx	0x38000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_255:
	setx	0x3a011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 3359: RDPR_TT	rdpr	%tt, %r26
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 31)
	.word 0xfe35c000  ! 3362: STH_R	sth	%r31, [%r23 + %r0]
cpu_intr_3_256:
	setx	0x39002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf6a40020  ! 3374: STWA_R	stwa	%r27, [%r16 + %r0] 0x01
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_257:
	setx	0x3b0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabcc000  ! 3377: XNORcc_R	xnorcc 	%r19, %r0, %r29
	.word 0xb2b5209f  ! 3379: SUBCcc_I	orncc 	%r20, 0x009f, %r25
T3_asi_reg_rd_134:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 3384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfab48020  ! 3387: STHA_R	stha	%r29, [%r18 + %r0] 0x01
	.word 0xfcb4c020  ! 3392: STHA_R	stha	%r30, [%r19 + %r0] 0x01
	.word 0xfeac215e  ! 3393: STBA_I	stba	%r31, [%r16 + 0x015e] %asi
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_258:
	setx	0x3a011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_rd_135:
	mov	0x11, %r14
	.word 0xfedb84a0  ! 3398: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_259:
	setx	0x380234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29d6063  ! 3400: XORcc_I	xorcc 	%r21, 0x0063, %r25
	.word 0xfa35c000  ! 3401: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xbd520000  ! 3403: RDPR_PIL	<illegal instruction>
	.word 0xfa75e01b  ! 3406: STX_I	stx	%r29, [%r23 + 0x001b]
	.word 0xf82dc000  ! 3408: STB_R	stb	%r28, [%r23 + %r0]
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982810  ! 3413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0810, %hpstate
	.word 0xfcf4e0d8  ! 3414: STXA_I	stxa	%r30, [%r19 + 0x00d8] %asi
cpu_intr_3_260:
	setx	0x3a0300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_261:
	setx	0x380232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_262:
	setx	0x3a030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 29)
	.word 0xf82dc000  ! 3420: STB_R	stb	%r28, [%r23 + %r0]
cpu_intr_3_263:
	setx	0x3a0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c8000  ! 3427: STB_R	stb	%r29, [%r18 + %r0]
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_264:
	setx	0x390327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d0000  ! 3436: STB_R	stb	%r30, [%r20 + %r0]
cpu_intr_3_265:
	setx	0x390210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_266:
	setx	0x3a0201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_267:
	setx	0x3a002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_268:
	setx	0x3a002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 1b)
	.word 0xb22c4000  ! 3452: ANDN_R	andn 	%r17, %r0, %r25
cpu_intr_3_269:
	setx	0x390130, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf674c000  ! 3461: STX_R	stx	%r27, [%r19 + %r0]
cpu_intr_3_270:
	setx	0x380110, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a50  ! 3475: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a50, %hpstate
cpu_intr_3_271:
	setx	0x3a0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb084a074  ! 3480: ADDcc_I	addcc 	%r18, 0x0074, %r24
	.word 0xfeb48020  ! 3481: STHA_R	stha	%r31, [%r18 + %r0] 0x01
T3_asi_reg_rd_136:
	mov	0x23, %r14
	.word 0xf4db84a0  ! 3483: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_272:
	setx	0x3a0127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_137:
	mov	0x33, %r14
	.word 0xfadb8e80  ! 3492: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_136:
	mov	0x1f, %r14
	.word 0xfaf38e80  ! 3501: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf6754000  ! 3504: STX_R	stx	%r27, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf625e024  ! 3508: STW_I	stw	%r27, [%r23 + 0x0024]
	.word 0xf0a5e17f  ! 3510: STWA_I	stwa	%r24, [%r23 + 0x017f] %asi
	.word 0xfaf521dd  ! 3512: STXA_I	stxa	%r29, [%r20 + 0x01dd] %asi
	.word 0xf4344000  ! 3514: STH_R	sth	%r26, [%r17 + %r0]
cpu_intr_3_273:
	setx	0x39033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_137:
	mov	0x1, %r14
	.word 0xfef38400  ! 3516: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfe2d4000  ! 3517: STB_R	stb	%r31, [%r21 + %r0]
cpu_intr_3_274:
	setx	0x39010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe750000  ! 3523: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf62d208b  ! 3526: STB_I	stb	%r27, [%r20 + 0x008b]
	.word 0xf6748000  ! 3528: STX_R	stx	%r27, [%r18 + %r0]
T3_asi_reg_wr_138:
	mov	0xd, %r14
	.word 0xfcf38e80  ! 3529: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf6240000  ! 3530: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xfef4a11e  ! 3531: STXA_I	stxa	%r31, [%r18 + 0x011e] %asi
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_275:
	setx	0x39011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_276:
	setx	0x3b0021, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_138:
	mov	0x24, %r14
	.word 0xfcdb84a0  ! 3538: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf825a1f2  ! 3540: STW_I	stw	%r28, [%r22 + 0x01f2]
	.word 0xba248000  ! 3542: SUB_R	sub 	%r18, %r0, %r29
cpu_intr_3_277:
	setx	0x3b0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35a123  ! 3544: STH_I	sth	%r30, [%r22 + 0x0123]
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf625205d  ! 3546: STW_I	stw	%r27, [%r20 + 0x005d]
	.word 0xfe750000  ! 3548: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf6ac602b  ! 3551: STBA_I	stba	%r27, [%r17 + 0x002b] %asi
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 9)
	.word 0xb804e102  ! 3555: ADD_I	add 	%r19, 0x0102, %r28
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_rd_139:
	mov	0x18, %r14
	.word 0xfedb8e40  ! 3558: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfcaca0ed  ! 3562: STBA_I	stba	%r30, [%r18 + 0x00ed] %asi
	.word 0xfab40020  ! 3563: STHA_R	stha	%r29, [%r16 + %r0] 0x01
	.word 0xf8f520f4  ! 3566: STXA_I	stxa	%r28, [%r20 + 0x00f4] %asi
	.word 0xba954000  ! 3567: ORcc_R	orcc 	%r21, %r0, %r29
T3_asi_reg_rd_140:
	mov	0x17, %r14
	.word 0xf8db84a0  ! 3570: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf6ad4020  ! 3573: STBA_R	stba	%r27, [%r21 + %r0] 0x01
cpu_intr_3_278:
	setx	0x3a030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_139:
	mov	0x3c5, %r14
	.word 0xfcf38400  ! 3575: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T3_asi_reg_rd_141:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 3578: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 35)
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982b40  ! 3587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b40, %hpstate
cpu_intr_3_279:
	setx	0x390106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_280:
	setx	0x390012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a50020  ! 3594: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
cpu_intr_3_281:
	setx	0x390222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_282:
	setx	0x380314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 8)
	.word 0xfaa50020  ! 3598: STWA_R	stwa	%r29, [%r20 + %r0] 0x01
	.word 0x9194e1aa  ! 3599: WRPR_PIL_I	wrpr	%r19, 0x01aa, %pil
	.word 0xbe85c000  ! 3600: ADDcc_R	addcc 	%r23, %r0, %r31
	.word 0xf8f4e013  ! 3602: STXA_I	stxa	%r28, [%r19 + 0x0013] %asi
	.word 0xf2b5a067  ! 3603: STHA_I	stha	%r25, [%r22 + 0x0067] %asi
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 3)
	.word 0xf675205d  ! 3606: STX_I	stx	%r27, [%r20 + 0x005d]
cpu_intr_3_283:
	setx	0x3a021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0b52014  ! 3609: STHA_I	stha	%r24, [%r20 + 0x0014] %asi
T3_asi_reg_rd_142:
	mov	0x34, %r14
	.word 0xfedb84a0  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 31)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_284:
	setx	0x3b023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_140:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 3625: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf434e109  ! 3626: STH_I	sth	%r26, [%r19 + 0x0109]
T3_asi_reg_rd_143:
	mov	0x36, %r14
	.word 0xf8db89e0  ! 3627: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_285:
	setx	0x38020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42c4000  ! 3632: STB_R	stb	%r26, [%r17 + %r0]
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982e92  ! 3636: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e92, %hpstate
	.word 0xf6758000  ! 3637: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xf8a40020  ! 3640: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_141:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 3644: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7643801  ! 3649: MOVcc_I	<illegal instruction>
	.word 0xfe756082  ! 3652: STX_I	stx	%r31, [%r21 + 0x0082]
cpu_intr_3_286:
	setx	0x380204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb494a0cc  ! 3655: ORcc_I	orcc 	%r18, 0x00cc, %r26
T3_asi_reg_wr_142:
	mov	0x21, %r14
	.word 0xf4f38400  ! 3656: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_rd_144:
	mov	0x3c6, %r14
	.word 0xf4db89e0  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_TO_TL1
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983bd0  ! 3660: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd0, %hpstate
cpu_intr_3_287:
	setx	0x39012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc254000  ! 3662: SUB_R	sub 	%r21, %r0, %r30
T3_asi_reg_wr_143:
	mov	0x11, %r14
	.word 0xfcf384a0  ! 3663: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf02dc000  ! 3667: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xbb2c8000  ! 3670: SLL_R	sll 	%r18, %r0, %r29
	.word 0xf0254000  ! 3671: STW_R	stw	%r24, [%r21 + %r0]
T3_asi_reg_rd_145:
	mov	0x7, %r14
	.word 0xf4db84a0  ! 3672: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfaace1fa  ! 3673: STBA_I	stba	%r29, [%r19 + 0x01fa] %asi
cpu_intr_3_288:
	setx	0x390006, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c0a  ! 3675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c0a, %hpstate
	.word 0xb735c000  ! 3678: SRL_R	srl 	%r23, %r0, %r27
	.word 0xf8244000  ! 3679: STW_R	stw	%r28, [%r17 + %r0]
cpu_intr_3_289:
	setx	0x380124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_290:
	setx	0x3a010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634a006  ! 3686: STH_I	sth	%r27, [%r18 + 0x0006]
	.word 0xf22c20a1  ! 3687: STB_I	stb	%r25, [%r16 + 0x00a1]
	.word 0xfab40020  ! 3689: STHA_R	stha	%r29, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	.word 0xf6b5a0ad  ! 3693: STHA_I	stha	%r27, [%r22 + 0x00ad] %asi
T3_asi_reg_rd_146:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 3697: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf62ca1a8  ! 3699: STB_I	stb	%r27, [%r18 + 0x01a8]
	.word 0xf224c000  ! 3700: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xf42c0000  ! 3704: STB_R	stb	%r26, [%r16 + %r0]
T3_asi_reg_rd_147:
	mov	0x18, %r14
	.word 0xf4db8e80  ! 3705: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf0a561a2  ! 3706: STWA_I	stwa	%r24, [%r21 + 0x01a2] %asi
	.word 0xf2ac0020  ! 3707: STBA_R	stba	%r25, [%r16 + %r0] 0x01
cpu_intr_3_291:
	setx	0x390037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_292:
	setx	0x3a0101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_293:
	setx	0x380101, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfe75c000  ! 3716: STX_R	stx	%r31, [%r23 + %r0]
T3_asi_reg_wr_144:
	mov	0x1b, %r14
	.word 0xf2f38e40  ! 3717: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_294:
	setx	0x3f0322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_295:
	setx	0x3f0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7d8400  ! 3728: MOVR_R	movre	%r22, %r0, %r29
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 4)
	.word 0xf22421f2  ! 3734: STW_I	stw	%r25, [%r16 + 0x01f2]
	.word 0xf875c000  ! 3735: STX_R	stx	%r28, [%r23 + %r0]
cpu_intr_3_296:
	setx	0x3c0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf624c000  ! 3742: STW_R	stw	%r27, [%r19 + %r0]
T3_asi_reg_wr_145:
	mov	0x10, %r14
	.word 0xfcf389e0  ! 3744: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_148:
	mov	0x18, %r14
	.word 0xf6db8e40  ! 3746: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 31)
	.word 0xfe2c60a2  ! 3752: STB_I	stb	%r31, [%r17 + 0x00a2]
	.word 0xf6258000  ! 3754: STW_R	stw	%r27, [%r22 + %r0]
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_149:
	mov	0x2, %r14
	.word 0xf6db8400  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfe2d8000  ! 3759: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xfea4213c  ! 3761: STWA_I	stwa	%r31, [%r16 + 0x013c] %asi
	.word 0xb8a42040  ! 3764: SUBcc_I	subcc 	%r16, 0x0040, %r28
	.word 0xfaa5218f  ! 3766: STWA_I	stwa	%r29, [%r20 + 0x018f] %asi
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_297:
	setx	0x3d0330, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_150:
	mov	0x3, %r14
	.word 0xf6db8e60  ! 3775: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfe34c000  ! 3777: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf4240000  ! 3779: STW_R	stw	%r26, [%r16 + %r0]
cpu_intr_3_298:
	setx	0x3d002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88d0000  ! 3782: ANDcc_R	andcc 	%r20, %r0, %r28
T3_asi_reg_rd_151:
	mov	0x29, %r14
	.word 0xf4db89e0  ! 3783: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfe34c000  ! 3786: STH_R	sth	%r31, [%r19 + %r0]
cpu_intr_3_299:
	setx	0x3c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_146:
	mov	0x15, %r14
	.word 0xf6f384a0  ! 3789: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_rd_152:
	mov	0x2c, %r14
	.word 0xfadb8e40  ! 3792: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_153:
	mov	0x3c3, %r14
	.word 0xfadb8400  ! 3793: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb625c000  ! 3794: SUB_R	sub 	%r23, %r0, %r27
	.word 0xfab420dd  ! 3795: STHA_I	stha	%r29, [%r16 + 0x00dd] %asi
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_300:
	setx	0x3c011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f42160  ! 3801: STXA_I	stxa	%r28, [%r16 + 0x0160] %asi
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 19)
	.word 0xf4ad8020  ! 3805: STBA_R	stba	%r26, [%r22 + %r0] 0x01
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 37)
	.word 0xf8ad8020  ! 3809: STBA_R	stba	%r28, [%r22 + %r0] 0x01
	.word 0xfa25a1ec  ! 3811: STW_I	stw	%r29, [%r22 + 0x01ec]
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf2a46089  ! 3813: STWA_I	stwa	%r25, [%r17 + 0x0089] %asi
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_154:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 3815: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xfc2de056  ! 3817: STB_I	stb	%r30, [%r23 + 0x0056]
	.word 0xf82420af  ! 3819: STW_I	stw	%r28, [%r16 + 0x00af]
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 30)
	.word 0xf8a461ac  ! 3822: STWA_I	stwa	%r28, [%r17 + 0x01ac] %asi
T3_asi_reg_rd_155:
	mov	0x3c1, %r14
	.word 0xfedb89e0  ! 3825: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_wr_147:
	mov	0x3c3, %r14
	.word 0xf6f38e80  ! 3826: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
	.word 0xfea5217a  ! 3829: STWA_I	stwa	%r31, [%r20 + 0x017a] %asi
	.word 0xfea40020  ! 3835: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
cpu_intr_3_301:
	setx	0x3d0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc450000  ! 3840: ADDC_R	addc 	%r20, %r0, %r30
cpu_intr_3_302:
	setx	0x3e0002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_303:
	setx	0x3f0112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_wr_148:
	mov	0x5, %r14
	.word 0xfcf389e0  ! 3850: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_NONHPRIV
	.word 0xf8252184  ! 3852: STW_I	stw	%r28, [%r20 + 0x0184]
T3_asi_reg_wr_149:
	mov	0x23, %r14
	.word 0xf8f38e80  ! 3853: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfcac20b6  ! 3854: STBA_I	stba	%r30, [%r16 + 0x00b6] %asi
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_150:
	mov	0x22, %r14
	.word 0xf4f38e40  ! 3857: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_304:
	setx	0x3d0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf224c000  ! 3859: STW_R	stw	%r25, [%r19 + %r0]
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_305:
	setx	0x3f0339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 23)
	.word 0xf0b5e0a7  ! 3873: STHA_I	stha	%r24, [%r23 + 0x00a7] %asi
T3_asi_reg_wr_151:
	mov	0x1a, %r14
	.word 0xfaf38e60  ! 3875: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_3_306:
	setx	0x3f0224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 12)
	.word 0xf275a042  ! 3884: STX_I	stx	%r25, [%r22 + 0x0042]
T3_asi_reg_wr_152:
	mov	0x3c1, %r14
	.word 0xf4f384a0  ! 3885: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfe2c20cf  ! 3886: STB_I	stb	%r31, [%r16 + 0x00cf]
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 14)
	.word 0xfa742003  ! 3894: STX_I	stx	%r29, [%r16 + 0x0003]
	.word 0xf8a48020  ! 3896: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
T3_asi_reg_rd_156:
	mov	0x23, %r14
	.word 0xfedb8e60  ! 3898: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf4a40020  ! 3900: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
	.word 0xf8a5e143  ! 3901: STWA_I	stwa	%r28, [%r23 + 0x0143] %asi
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_307:
	setx	0x3c0327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_157:
	mov	0x9, %r14
	.word 0xfedb8e60  ! 3905: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_rd_158:
	mov	0x2, %r14
	.word 0xf8db89e0  ! 3907: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8a461bb  ! 3912: STWA_I	stwa	%r28, [%r17 + 0x01bb] %asi
	.word 0xfaf5a175  ! 3915: STXA_I	stxa	%r29, [%r22 + 0x0175] %asi
	.word 0xf8a40020  ! 3917: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
T3_asi_reg_rd_159:
	mov	0x18, %r14
	.word 0xf6db8e40  ! 3918: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_308:
	setx	0x3e0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef5a168  ! 3922: STXA_I	stxa	%r31, [%r22 + 0x0168] %asi
	.word 0xb8ad8000  ! 3923: ANDNcc_R	andncc 	%r22, %r0, %r28
	.word 0xbd358000  ! 3927: SRL_R	srl 	%r22, %r0, %r30
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, c)
	.word 0xb8a420f0  ! 3933: SUBcc_I	subcc 	%r16, 0x00f0, %r28
T3_asi_reg_rd_160:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 3934: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf2344000  ! 3937: STH_R	sth	%r25, [%r17 + %r0]
cpu_intr_3_309:
	setx	0x3c0100, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_161:
	mov	0x29, %r14
	.word 0xf2db84a0  ! 3942: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfa2c60ae  ! 3943: STB_I	stb	%r29, [%r17 + 0x00ae]
T3_asi_reg_rd_162:
	mov	0x2f, %r14
	.word 0xf0db8e40  ! 3945: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf6240000  ! 3948: STW_R	stw	%r27, [%r16 + %r0]
T3_asi_reg_rd_163:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 3949: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf0a4c020  ! 3951: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
cpu_intr_3_310:
	setx	0x3f020d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_311:
	setx	0x3c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f5a1d5  ! 3958: STXA_I	stxa	%r24, [%r22 + 0x01d5] %asi
cpu_intr_3_312:
	setx	0x3e0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe844000  ! 3964: ADDcc_R	addcc 	%r17, %r0, %r31
T3_asi_reg_rd_164:
	mov	0xd, %r14
	.word 0xfcdb8e40  ! 3965: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf0354000  ! 3966: STH_R	sth	%r24, [%r21 + %r0]
T3_asi_reg_rd_165:
	mov	0x24, %r14
	.word 0xfadb8400  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_313:
	setx	0x3e0213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf2ade1bd  ! 3975: STBA_I	stba	%r25, [%r23 + 0x01bd] %asi
	.word 0xf834602b  ! 3977: STH_I	sth	%r28, [%r17 + 0x002b]
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_166:
	mov	0x1, %r14
	.word 0xf0db8e40  ! 3981: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf22c610a  ! 3984: STB_I	stb	%r25, [%r17 + 0x010a]
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf034a1f0  ! 3989: STH_I	sth	%r24, [%r18 + 0x01f0]
	.word 0xf8ac8020  ! 3990: STBA_R	stba	%r28, [%r18 + %r0] 0x01
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_167:
	mov	0xe, %r14
	.word 0xf8db8e60  ! 3998: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_3_314:
	setx	0x3d0123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_315:
	setx	0x3c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 5)
	ta	T_CHANGE_TO_TL1
	.word 0xfc2c21b1  ! 4018: STB_I	stb	%r30, [%r16 + 0x01b1]
	.word 0xf6758000  ! 4019: STX_R	stx	%r27, [%r22 + %r0]
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_316:
	setx	0x3c022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_317:
	setx	0x3c011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 19)
	.word 0xf6754000  ! 4029: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xfaf460c0  ! 4030: STXA_I	stxa	%r29, [%r17 + 0x00c0] %asi
T3_asi_reg_rd_168:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 4032: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_318:
	setx	0x3d0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2dc000  ! 4036: STB_R	stb	%r29, [%r23 + %r0]
cpu_intr_3_319:
	setx	0x3c0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d8000  ! 4040: STB_R	stb	%r27, [%r22 + %r0]
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 19)
	.word 0xfa340000  ! 4045: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xf4b5e1ea  ! 4047: STHA_I	stha	%r26, [%r23 + 0x01ea] %asi
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 7)
	.word 0xb3510000  ! 4051: RDPR_TICK	rdpr	%tick, %r25
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 10)
	.word 0xf02c4000  ! 4058: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xf0a50020  ! 4059: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_320:
	setx	0x3f0225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_rd_169:
	mov	0x14, %r14
	.word 0xf0db8400  ! 4069: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf0352101  ! 4070: STH_I	sth	%r24, [%r20 + 0x0101]
	.word 0xbe35c000  ! 4071: SUBC_R	orn 	%r23, %r0, %r31
	.word 0xf4ad8020  ! 4072: STBA_R	stba	%r26, [%r22 + %r0] 0x01
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf0f4e15b  ! 4076: STXA_I	stxa	%r24, [%r19 + 0x015b] %asi
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf6b460b5  ! 4082: STHA_I	stha	%r27, [%r17 + 0x00b5] %asi
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 11)
	.word 0xb33cf001  ! 4087: SRAX_I	srax	%r19, 0x0001, %r25
	.word 0xf0b4c020  ! 4089: STHA_R	stha	%r24, [%r19 + %r0] 0x01
	.word 0xb2ad0000  ! 4091: ANDNcc_R	andncc 	%r20, %r0, %r25
cpu_intr_3_321:
	setx	0x3c012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0244000  ! 4098: STW_R	stw	%r24, [%r17 + %r0]
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_153:
	mov	0x15, %r14
	.word 0xfaf38e80  ! 4103: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
cpu_intr_3_322:
	setx	0x3d030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a54020  ! 4111: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
cpu_intr_3_323:
	setx	0x3c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c0000  ! 4117: STB_R	stb	%r24, [%r16 + %r0]
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf6ac8020  ! 4120: STBA_R	stba	%r27, [%r18 + %r0] 0x01
T3_asi_reg_wr_154:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 4124: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_wr_155:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 4125: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb88c6015  ! 4127: ANDcc_I	andcc 	%r17, 0x0015, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb934d000  ! 4131: SRLX_R	srlx	%r19, %r0, %r28
	.word 0xfaad4020  ! 4132: STBA_R	stba	%r29, [%r21 + %r0] 0x01
	.word 0xf6f46044  ! 4135: STXA_I	stxa	%r27, [%r17 + 0x0044] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa354000  ! 4139: STH_R	sth	%r29, [%r21 + %r0]
cpu_intr_3_324:
	setx	0x3e030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_156:
	mov	0x31, %r14
	.word 0xf6f38e40  ! 4142: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_325:
	setx	0x3e0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb0154000  ! 4147: OR_R	or 	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0348000  ! 4150: STH_R	sth	%r24, [%r18 + %r0]
T3_asi_reg_rd_170:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_3_326:
	setx	0x3e0123, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_157:
	mov	0x3c4, %r14
	.word 0xfcf38400  ! 4157: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfe756108  ! 4159: STX_I	stx	%r31, [%r21 + 0x0108]
	.word 0xbd3cd000  ! 4160: SRAX_R	srax	%r19, %r0, %r30
	.word 0xf8b54020  ! 4161: STHA_R	stha	%r28, [%r21 + %r0] 0x01
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 25)
	ta	T_CHANGE_HPRIV
	.word 0xf0358000  ! 4172: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xf8a561f6  ! 4174: STWA_I	stwa	%r28, [%r21 + 0x01f6] %asi
T3_asi_reg_rd_171:
	mov	0x23, %r14
	.word 0xfcdb84a0  ! 4175: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T3_asi_reg_wr_158:
	mov	0x32, %r14
	.word 0xf0f38e60  ! 4176: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_wr_159:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 4178: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T3_asi_reg_rd_172:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 4179: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfa2c0000  ! 4180: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xfa348000  ! 4183: STH_R	sth	%r29, [%r18 + %r0]
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfca5e0a4  ! 4186: STWA_I	stwa	%r30, [%r23 + 0x00a4] %asi
	.word 0xfa2d600c  ! 4190: STB_I	stb	%r29, [%r21 + 0x000c]
	.word 0xf4750000  ! 4196: STX_R	stx	%r26, [%r20 + %r0]
T3_asi_reg_wr_160:
	mov	0x26, %r14
	.word 0xf0f38400  ! 4197: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb5520000  ! 4199: RDPR_PIL	rdpr	%pil, %r26
cpu_intr_3_327:
	setx	0x42011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead2123  ! 4202: STBA_I	stba	%r31, [%r20 + 0x0123] %asi
	.word 0xf4240000  ! 4203: STW_R	stw	%r26, [%r16 + %r0]
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf2ad8020  ! 4208: STBA_R	stba	%r25, [%r22 + %r0] 0x01
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 15)
	.word 0xb604e0a3  ! 4212: ADD_I	add 	%r19, 0x00a3, %r27
	.word 0xb60ca1f1  ! 4218: AND_I	and 	%r18, 0x01f1, %r27
cpu_intr_3_328:
	setx	0x43031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea58020  ! 4222: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_329:
	setx	0x400317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_330:
	setx	0x410000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf8354000  ! 4239: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xfa346155  ! 4242: STH_I	sth	%r29, [%r17 + 0x0155]
T3_asi_reg_rd_173:
	mov	0x31, %r14
	.word 0xf2db8e40  ! 4246: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf2b5e0b8  ! 4251: STHA_I	stha	%r25, [%r23 + 0x00b8] %asi
	.word 0xf0aca0bc  ! 4252: STBA_I	stba	%r24, [%r18 + 0x00bc] %asi
	.word 0xfaa46089  ! 4253: STWA_I	stwa	%r29, [%r17 + 0x0089] %asi
T3_asi_reg_wr_161:
	mov	0x19, %r14
	.word 0xf0f38e80  ! 4254: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0x8d95e1be  ! 4256: WRPR_PSTATE_I	wrpr	%r23, 0x01be, %pstate
T3_asi_reg_wr_162:
	mov	0x3c1, %r14
	.word 0xf8f38e80  ! 4258: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_wr_163:
	mov	0x31, %r14
	.word 0xf6f38e80  ! 4259: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfab48020  ! 4263: STHA_R	stha	%r29, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_331:
	setx	0x420221, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_174:
	mov	0x3c7, %r14
	.word 0xf4db8e60  ! 4266: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_rd_175:
	mov	0x1b, %r14
	.word 0xfadb8e40  ! 4267: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfc2da183  ! 4268: STB_I	stb	%r30, [%r22 + 0x0183]
	.word 0xb334b001  ! 4269: SRLX_I	srlx	%r18, 0x0001, %r25
	.word 0xb8058000  ! 4276: ADD_R	add 	%r22, %r0, %r28
T3_asi_reg_wr_164:
	mov	0x0, %r14
	.word 0xfaf389e0  ! 4277: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf2ad4020  ! 4280: STBA_R	stba	%r25, [%r21 + %r0] 0x01
T3_asi_reg_rd_176:
	mov	0x2e, %r14
	.word 0xfadb8400  ! 4281: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbd504000  ! 4282: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xf4356181  ! 4287: STH_I	sth	%r26, [%r21 + 0x0181]
T3_asi_reg_wr_165:
	mov	0x7, %r14
	.word 0xfcf38e40  ! 4288: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbec5a0e0  ! 4289: ADDCcc_I	addccc 	%r22, 0x00e0, %r31
T3_asi_reg_rd_177:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 4290: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 2d)
	.word 0xbac5c000  ! 4293: ADDCcc_R	addccc 	%r23, %r0, %r29
T3_asi_reg_rd_178:
	mov	0x3c5, %r14
	.word 0xfedb8e80  ! 4294: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x8198294a  ! 4295: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094a, %hpstate
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_179:
	mov	0x35, %r14
	.word 0xf8db84a0  ! 4297: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_wr_166:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 4299: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_332:
	setx	0x41013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_180:
	mov	0x1d, %r14
	.word 0xfadb8e40  ! 4310: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfaad8020  ! 4313: STBA_R	stba	%r29, [%r22 + %r0] 0x01
cpu_intr_3_333:
	setx	0x410113, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_181:
	mov	0x38, %r14
	.word 0xfedb8e60  ! 4316: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf4b40020  ! 4318: STHA_R	stha	%r26, [%r16 + %r0] 0x01
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_wr_167:
	mov	0x0, %r14
	.word 0xf6f38400  ! 4320: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfa246175  ! 4323: STW_I	stw	%r29, [%r17 + 0x0175]
	.word 0xbd480000  ! 4324: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfca4e140  ! 4325: STWA_I	stwa	%r30, [%r19 + 0x0140] %asi
T3_asi_reg_rd_182:
	mov	0x31, %r14
	.word 0xf4db8400  ! 4329: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 8)
	.word 0xf6ac8020  ! 4335: STBA_R	stba	%r27, [%r18 + %r0] 0x01
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 10)
	.word 0xf8a4c020  ! 4343: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
	.word 0xf234e09f  ! 4347: STH_I	sth	%r25, [%r19 + 0x009f]
	.word 0xbcbce097  ! 4348: XNORcc_I	xnorcc 	%r19, 0x0097, %r30
	.word 0xb5641800  ! 4349: MOVcc_R	<illegal instruction>
cpu_intr_3_334:
	setx	0x42012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2250000  ! 4353: STW_R	stw	%r25, [%r20 + %r0]
cpu_intr_3_335:
	setx	0x410012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_336:
	setx	0x400029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_337:
	setx	0x420229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 29)
	.word 0xfa34a0f7  ! 4368: STH_I	sth	%r29, [%r18 + 0x00f7]
	.word 0xf4a4606d  ! 4369: STWA_I	stwa	%r26, [%r17 + 0x006d] %asi
	ta	T_CHANGE_TO_TL1
cpu_intr_3_338:
	setx	0x42033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_339:
	setx	0x430107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf07421dc  ! 4377: STX_I	stx	%r24, [%r16 + 0x01dc]
T3_asi_reg_wr_168:
	mov	0x2d, %r14
	.word 0xf8f38400  ! 4383: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf2ac8020  ! 4385: STBA_R	stba	%r25, [%r18 + %r0] 0x01
T3_asi_reg_rd_183:
	mov	0x27, %r14
	.word 0xfcdb8e40  ! 4386: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_340:
	setx	0x420024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c0000  ! 4391: STB_R	stb	%r29, [%r16 + %r0]
T3_asi_reg_rd_184:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 4393: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_169:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 4395: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf8b520a0  ! 4397: STHA_I	stha	%r28, [%r20 + 0x00a0] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_170:
	mov	0x1f, %r14
	.word 0xf4f38400  ! 4401: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_3_341:
	setx	0x400304, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_185:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 4404: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_186:
	mov	0x18, %r14
	.word 0xf8db8e40  ! 4407: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfc348000  ! 4408: STH_R	sth	%r30, [%r18 + %r0]
cpu_intr_3_342:
	setx	0x43010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ad4020  ! 4412: STBA_R	stba	%r25, [%r21 + %r0] 0x01
	.word 0xba0dc000  ! 4414: AND_R	and 	%r23, %r0, %r29
	.word 0xfcb40020  ! 4419: STHA_R	stha	%r30, [%r16 + %r0] 0x01
T3_asi_reg_rd_187:
	mov	0x17, %r14
	.word 0xf6db8e60  ! 4421: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf42c214b  ! 4422: STB_I	stb	%r26, [%r16 + 0x014b]
	.word 0xbb357001  ! 4423: SRLX_I	srlx	%r21, 0x0001, %r29
	.word 0xf2a5c020  ! 4425: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
	.word 0xfcf5613c  ! 4426: STXA_I	stxa	%r30, [%r21 + 0x013c] %asi
cpu_intr_3_343:
	setx	0x400030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac4020  ! 4429: STBA_R	stba	%r30, [%r17 + %r0] 0x01
cpu_intr_3_344:
	setx	0x430133, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e8a  ! 4431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8a, %hpstate
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 7)
	.word 0xf034a148  ! 4436: STH_I	sth	%r24, [%r18 + 0x0148]
	.word 0xf634c000  ! 4441: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xf2358000  ! 4442: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xfca58020  ! 4445: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
cpu_intr_3_345:
	setx	0x40021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c61f2  ! 4449: STB_I	stb	%r28, [%r17 + 0x01f2]
	.word 0xf82c2050  ! 4451: STB_I	stb	%r28, [%r16 + 0x0050]
cpu_intr_3_346:
	setx	0x410210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_347:
	setx	0x410315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 21)
	.word 0xf2242092  ! 4458: STW_I	stw	%r25, [%r16 + 0x0092]
	.word 0xfef521c8  ! 4460: STXA_I	stxa	%r31, [%r20 + 0x01c8] %asi
cpu_intr_3_348:
	setx	0x400115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82cc000  ! 4463: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xf6ade17a  ! 4465: STBA_I	stba	%r27, [%r23 + 0x017a] %asi
	.word 0xf8a46030  ! 4469: STWA_I	stwa	%r28, [%r17 + 0x0030] %asi
cpu_intr_3_349:
	setx	0x43022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_188:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 4471: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_350:
	setx	0x400205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6250000  ! 4473: STW_R	stw	%r27, [%r20 + %r0]
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf4ad4020  ! 4477: STBA_R	stba	%r26, [%r21 + %r0] 0x01
T3_asi_reg_rd_189:
	mov	0x7, %r14
	.word 0xf0db8e40  ! 4478: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf234a1a0  ! 4481: STH_I	sth	%r25, [%r18 + 0x01a0]
	.word 0xb57d4400  ! 4482: MOVR_R	movre	%r21, %r0, %r26
	.word 0xf8b5c020  ! 4483: STHA_R	stha	%r28, [%r23 + %r0] 0x01
T3_asi_reg_wr_171:
	mov	0x31, %r14
	.word 0xfef38400  ! 4485: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb6b54000  ! 4486: ORNcc_R	orncc 	%r21, %r0, %r27
	.word 0xf4a58020  ! 4490: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
cpu_intr_3_351:
	setx	0x41003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_172:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 4492: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf2a4e016  ! 4494: STWA_I	stwa	%r25, [%r19 + 0x0016] %asi
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, b)
	.word 0xfaa4e156  ! 4505: STWA_I	stwa	%r29, [%r19 + 0x0156] %asi
	.word 0xf22d8000  ! 4506: STB_R	stb	%r25, [%r22 + %r0]
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_190:
	mov	0xd, %r14
	.word 0xf8db8e40  ! 4519: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_173:
	mov	0x4, %r14
	.word 0xfcf38e80  ! 4520: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_rd_191:
	mov	0x1f, %r14
	.word 0xfedb8e60  ! 4523: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf42560cf  ! 4525: STW_I	stw	%r26, [%r21 + 0x00cf]
T3_asi_reg_rd_192:
	mov	0x16, %r14
	.word 0xfcdb8e40  ! 4533: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf234e11f  ! 4534: STH_I	sth	%r25, [%r19 + 0x011f]
	.word 0xf835e001  ! 4535: STH_I	sth	%r28, [%r23 + 0x0001]
T3_asi_reg_rd_193:
	mov	0x2b, %r14
	.word 0xfcdb8e40  ! 4536: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_352:
	setx	0x430118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d0000  ! 4539: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xfa2ca1a2  ! 4540: STB_I	stb	%r29, [%r18 + 0x01a2]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb6444000  ! 4546: ADDC_R	addc 	%r17, %r0, %r27
T3_asi_reg_rd_194:
	mov	0xa, %r14
	.word 0xfadb8400  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_353:
	setx	0x430124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5c020  ! 4550: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
	.word 0xf075a1fc  ! 4553: STX_I	stx	%r24, [%r22 + 0x01fc]
	.word 0xf42d0000  ! 4554: STB_R	stb	%r26, [%r20 + %r0]
cpu_intr_3_354:
	setx	0x420022, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_174:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 4557: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_175:
	mov	0x32, %r14
	.word 0xfcf384a0  ! 4559: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_355:
	setx	0x41002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b54020  ! 4565: STHA_R	stha	%r28, [%r21 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
cpu_intr_3_356:
	setx	0x42033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0750000  ! 4574: STX_R	stx	%r24, [%r20 + %r0]
T3_asi_reg_rd_195:
	mov	0x1a, %r14
	.word 0xfadb8e40  ! 4575: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_176:
	mov	0x1a, %r14
	.word 0xfcf384a0  ! 4577: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 33)
	.word 0xfc2c6194  ! 4582: STB_I	stb	%r30, [%r17 + 0x0194]
T3_asi_reg_wr_177:
	mov	0x17, %r14
	.word 0xf6f38e80  ! 4583: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf435a0e4  ! 4584: STH_I	sth	%r26, [%r22 + 0x00e4]
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 3d)
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982958  ! 4586: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0958, %hpstate
cpu_intr_3_357:
	setx	0x40003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf351000  ! 4588: SRLX_R	srlx	%r20, %r0, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf8ad8020  ! 4594: STBA_R	stba	%r28, [%r22 + %r0] 0x01
	.word 0xf4f461a9  ! 4595: STXA_I	stxa	%r26, [%r17 + 0x01a9] %asi
	.word 0xb02de163  ! 4598: ANDN_I	andn 	%r23, 0x0163, %r24
	.word 0xb2350000  ! 4599: SUBC_R	orn 	%r20, %r0, %r25
	.word 0xf4248000  ! 4601: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xf2a4210d  ! 4604: STWA_I	stwa	%r25, [%r16 + 0x010d] %asi
T3_asi_reg_wr_178:
	mov	0x22, %r14
	.word 0xfcf384a0  ! 4606: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_358:
	setx	0x42032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1dc000  ! 4608: XOR_R	xor 	%r23, %r0, %r30
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982cc0  ! 4610: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc0, %hpstate
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_359:
	setx	0x410334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42521b2  ! 4615: STW_I	stw	%r26, [%r20 + 0x01b2]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8a40020  ! 4620: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
cpu_intr_3_360:
	setx	0x40010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a44020  ! 4625: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
	.word 0xfa7521b5  ! 4628: STX_I	stx	%r29, [%r20 + 0x01b5]
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_196:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 4634: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_361:
	setx	0x47000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xb425a13b  ! 4640: SUB_I	sub 	%r22, 0x013b, %r26
T3_asi_reg_rd_197:
	mov	0x28, %r14
	.word 0xf8db8e40  ! 4642: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_362:
	setx	0x45000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac4020  ! 4650: STBA_R	stba	%r27, [%r17 + %r0] 0x01
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_wr_179:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 4655: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf43560ed  ! 4656: STH_I	sth	%r26, [%r21 + 0x00ed]
cpu_intr_3_363:
	setx	0x470010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 0)
	.word 0xbd7dc400  ! 4659: MOVR_R	movre	%r23, %r0, %r30
	.word 0xf2adc020  ! 4660: STBA_R	stba	%r25, [%r23 + %r0] 0x01
cpu_intr_3_364:
	setx	0x450212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 17)
	.word 0xbd3ca001  ! 4663: SRA_I	sra 	%r18, 0x0001, %r30
T3_asi_reg_rd_198:
	mov	0x25, %r14
	.word 0xfcdb8400  ! 4664: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbb355000  ! 4665: SRLX_R	srlx	%r21, %r0, %r29
cpu_intr_3_365:
	setx	0x44033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2c0000  ! 4674: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xf4acc020  ! 4677: STBA_R	stba	%r26, [%r19 + %r0] 0x01
	.word 0xfcb4604e  ! 4678: STHA_I	stha	%r30, [%r17 + 0x004e] %asi
T3_asi_reg_rd_199:
	mov	0x34, %r14
	.word 0xfcdb8e80  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbc3cc000  ! 4683: XNOR_R	xnor 	%r19, %r0, %r30
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf6a420d1  ! 4691: STWA_I	stwa	%r27, [%r16 + 0x00d1] %asi
	.word 0xf434601f  ! 4692: STH_I	sth	%r26, [%r17 + 0x001f]
	ta	T_CHANGE_TO_TL0
	.word 0xb235c000  ! 4697: ORN_R	orn 	%r23, %r0, %r25
	.word 0xbd3cc000  ! 4699: SRA_R	sra 	%r19, %r0, %r30
	.word 0xbec44000  ! 4701: ADDCcc_R	addccc 	%r17, %r0, %r31
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 32)
	.word 0xf4ace167  ! 4705: STBA_I	stba	%r26, [%r19 + 0x0167] %asi
cpu_intr_3_366:
	setx	0x45013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 14)
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x8198381a  ! 4709: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181a, %hpstate
	.word 0xb28d8000  ! 4710: ANDcc_R	andcc 	%r22, %r0, %r25
T3_asi_reg_rd_200:
	mov	0x2c, %r14
	.word 0xf2db8e80  ! 4711: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfc24a16d  ! 4712: STW_I	stw	%r30, [%r18 + 0x016d]
	.word 0xf2aca050  ! 4715: STBA_I	stba	%r25, [%r18 + 0x0050] %asi
	.word 0xbaa48000  ! 4721: SUBcc_R	subcc 	%r18, %r0, %r29
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 23)
	.word 0xf8a50020  ! 4724: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
T3_asi_reg_wr_180:
	mov	0x13, %r14
	.word 0xf0f38400  ! 4725: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T3_asi_reg_wr_181:
	mov	0x1f, %r14
	.word 0xf0f38e80  ! 4726: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_182:
	mov	0x17, %r14
	.word 0xf2f38e40  ! 4728: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf0aca147  ! 4730: STBA_I	stba	%r24, [%r18 + 0x0147] %asi
	.word 0xb53db001  ! 4731: SRAX_I	srax	%r22, 0x0001, %r26
	.word 0xfa350000  ! 4732: STH_R	sth	%r29, [%r20 + %r0]
cpu_intr_3_367:
	setx	0x46030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb534c000  ! 4737: SRL_R	srl 	%r19, %r0, %r26
	.word 0xfcf5e18a  ! 4739: STXA_I	stxa	%r30, [%r23 + 0x018a] %asi
	ta	T_CHANGE_TO_TL1
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 20)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983dd8  ! 4746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd8, %hpstate
	.word 0xf6340000  ! 4748: STH_R	sth	%r27, [%r16 + %r0]
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 17)
	.word 0xf8ade01b  ! 4757: STBA_I	stba	%r28, [%r23 + 0x001b] %asi
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 11)
	.word 0xf4f4e1ed  ! 4759: STXA_I	stxa	%r26, [%r19 + 0x01ed] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xf82d2087  ! 4762: STB_I	stb	%r28, [%r20 + 0x0087]
T3_asi_reg_wr_183:
	mov	0x22, %r14
	.word 0xfaf38e60  ! 4763: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfcad8020  ! 4766: STBA_R	stba	%r30, [%r22 + %r0] 0x01
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 3e)
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_wr_184:
	mov	0x20, %r14
	.word 0xfcf384a0  ! 4777: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_wr_185:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 4780: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfab54020  ! 4782: STHA_R	stha	%r29, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_201:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 4786: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb49d4000  ! 4787: XORcc_R	xorcc 	%r21, %r0, %r26
T3_asi_reg_rd_202:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 4788: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf2744000  ! 4789: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xf0b40020  ! 4790: STHA_R	stha	%r24, [%r16 + %r0] 0x01
	.word 0xf6b48020  ! 4791: STHA_R	stha	%r27, [%r18 + %r0] 0x01
	.word 0xfab42178  ! 4794: STHA_I	stha	%r29, [%r16 + 0x0178] %asi
	.word 0xb28c0000  ! 4795: ANDcc_R	andcc 	%r16, %r0, %r25
	.word 0xf8ac4020  ! 4796: STBA_R	stba	%r28, [%r17 + %r0] 0x01
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 6)
	.word 0xfaa40020  ! 4799: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb82d4000  ! 4801: ANDN_R	andn 	%r21, %r0, %r28
T3_asi_reg_rd_203:
	mov	0x26, %r14
	.word 0xf0db8e60  ! 4802: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf234a0b5  ! 4803: STH_I	sth	%r25, [%r18 + 0x00b5]
cpu_intr_3_368:
	setx	0x47012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982eca  ! 4805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eca, %hpstate
cpu_intr_3_369:
	setx	0x47000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef4a051  ! 4808: STXA_I	stxa	%r31, [%r18 + 0x0051] %asi
T3_asi_reg_wr_186:
	mov	0x2e, %r14
	.word 0xfef384a0  ! 4809: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_wr_187:
	mov	0x2e, %r14
	.word 0xfcf384a0  ! 4812: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_rd_204:
	mov	0x24, %r14
	.word 0xf0db8e80  ! 4813: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_wr_188:
	mov	0x5, %r14
	.word 0xf6f384a0  ! 4815: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf6a42154  ! 4819: STWA_I	stwa	%r27, [%r16 + 0x0154] %asi
cpu_intr_3_370:
	setx	0x47000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf87560d1  ! 4823: STX_I	stx	%r28, [%r21 + 0x00d1]
	.word 0xb53de001  ! 4824: SRA_I	sra 	%r23, 0x0001, %r26
T3_asi_reg_rd_205:
	mov	0x34, %r14
	.word 0xf6db8e80  ! 4826: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbf356001  ! 4827: SRL_I	srl 	%r21, 0x0001, %r31
	ta	T_CHANGE_NONHPRIV
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_371:
	setx	0x450030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb49d4000  ! 4837: XORcc_R	xorcc 	%r21, %r0, %r26
	.word 0xfe74e07e  ! 4839: STX_I	stx	%r31, [%r19 + 0x007e]
cpu_intr_3_372:
	setx	0x440133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f5a17a  ! 4842: STXA_I	stxa	%r28, [%r22 + 0x017a] %asi
	.word 0xf4b4c020  ! 4843: STHA_R	stha	%r26, [%r19 + %r0] 0x01
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 2)
	.word 0xfc2cc000  ! 4847: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xb01d0000  ! 4850: XOR_R	xor 	%r20, %r0, %r24
T3_asi_reg_rd_206:
	mov	0x3, %r14
	.word 0xf4db89e0  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfc748000  ! 4856: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf42c0000  ! 4862: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xf2a5c020  ! 4863: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
	.word 0xf274c000  ! 4864: STX_R	stx	%r25, [%r19 + %r0]
T3_asi_reg_rd_207:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 4865: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbd641800  ! 4866: MOVcc_R	<illegal instruction>
	.word 0xf6a48020  ! 4867: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
T3_asi_reg_wr_189:
	mov	0x25, %r14
	.word 0xf2f38e80  ! 4868: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_wr_190:
	mov	0x31, %r14
	.word 0xf0f384a0  ! 4870: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf025c000  ! 4871: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xfe2c4000  ! 4872: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xfcb42122  ! 4873: STHA_I	stha	%r30, [%r16 + 0x0122] %asi
	.word 0xbc0d8000  ! 4876: AND_R	and 	%r22, %r0, %r30
	.word 0xfe34a10d  ! 4881: STH_I	sth	%r31, [%r18 + 0x010d]
T3_asi_reg_rd_208:
	mov	0xa, %r14
	.word 0xf2db84a0  ! 4882: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_209:
	mov	0x2f, %r14
	.word 0xf4db8e40  ! 4883: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_wr_191:
	mov	0x24, %r14
	.word 0xf2f38e60  ! 4885: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_192:
	mov	0xe, %r14
	.word 0xf0f38e80  ! 4887: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfeb4215f  ! 4888: STHA_I	stha	%r31, [%r16 + 0x015f] %asi
	.word 0xf8aca069  ! 4889: STBA_I	stba	%r28, [%r18 + 0x0069] %asi
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_210:
	mov	0x1f, %r14
	.word 0xf4db8e60  ! 4900: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfaa54020  ! 4901: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf02421ff  ! 4906: STW_I	stw	%r24, [%r16 + 0x01ff]
	.word 0xfc348000  ! 4907: STH_R	sth	%r30, [%r18 + %r0]
T3_asi_reg_wr_193:
	mov	0x6, %r14
	.word 0xfef38e60  ! 4908: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf875c000  ! 4910: STX_R	stx	%r28, [%r23 + %r0]
T3_asi_reg_wr_194:
	mov	0x21, %r14
	.word 0xfcf38e40  ! 4912: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf02c8000  ! 4914: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xfe350000  ! 4917: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xf4a5c020  ! 4918: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
cpu_intr_3_373:
	setx	0x460018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_374:
	setx	0x450115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 16)
	.word 0xb6046018  ! 4926: ADD_I	add 	%r17, 0x0018, %r27
T3_asi_reg_wr_195:
	mov	0x1c, %r14
	.word 0xfef38e40  ! 4927: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_wr_196:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 4929: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbc8c8000  ! 4931: ANDcc_R	andcc 	%r18, %r0, %r30
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 1d)
	ta	T_CHANGE_TO_TL1
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 27)
	.word 0xfeb4e1cd  ! 4937: STHA_I	stha	%r31, [%r19 + 0x01cd] %asi
T3_asi_reg_rd_211:
	mov	0x26, %r14
	.word 0xfcdb8e40  ! 4939: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb62420d2  ! 4941: SUB_I	sub 	%r16, 0x00d2, %r27
	.word 0xbc2d8000  ! 4942: ANDN_R	andn 	%r22, %r0, %r30
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_375:
	setx	0x440225, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_197:
	mov	0x24, %r14
	.word 0xf8f38e60  ! 4946: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb644e1ed  ! 4952: ADDC_I	addc 	%r19, 0x01ed, %r27
	.word 0xf0f420ff  ! 4953: STXA_I	stxa	%r24, [%r16 + 0x00ff] %asi
	.word 0xfeade039  ! 4955: STBA_I	stba	%r31, [%r23 + 0x0039] %asi
	.word 0xb1347001  ! 4957: SRLX_I	srlx	%r17, 0x0001, %r24
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 13)
	.word 0xf8240000  ! 4962: STW_R	stw	%r28, [%r16 + %r0]
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_376:
	setx	0x45030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, 4)
	.word 0xfea560d5  ! 4971: STWA_I	stwa	%r31, [%r21 + 0x00d5] %asi
	.word 0xf2a5c020  ! 4976: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
T3_asi_reg_wr_198:
	mov	0x20, %r14
	.word 0xf6f38e40  ! 4977: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
cpu_intr_3_377:
	setx	0x440321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d610d  ! 4982: STB_I	stb	%r31, [%r21 + 0x010d]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_378:
	setx	0x440000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_379:
	setx	0x440215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_212:
	mov	0x0, %r14
	.word 0xf6db8e40  ! 4992: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_380:
	setx	0x450007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24618f  ! 4996: STW_I	stw	%r30, [%r17 + 0x018f]
iob_intr_3_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_396), 16, 16)) -> intp(3, 0, 3b)
	.word 0xbd480000  ! 4998: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
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
	.word 0xf2958020  ! 2: LDUHA_R	lduha	[%r22, %r0] 0x01, %r25
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfe85e118  ! 12: LDUWA_I	lduwa	[%r23, + 0x0118] %asi, %r31
cpu_intr_2_0:
	setx	0x1c012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0d4000  ! 14: AND_R	and 	%r21, %r0, %r29
T2_asi_reg_wr_0:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 15: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf4c5208e  ! 19: LDSWA_I	ldswa	[%r20, + 0x008e] %asi, %r26
	.word 0xf45c8000  ! 21: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xbeaca0b6  ! 22: ANDNcc_I	andncc 	%r18, 0x00b6, %r31
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf4d5e179  ! 28: LDSHA_I	ldsha	[%r23, + 0x0179] %asi, %r26
cpu_intr_2_1:
	setx	0x1d001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d58020  ! 31: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r24
	.word 0xf4044000  ! 34: LDUW_R	lduw	[%r17 + %r0], %r26
cpu_intr_2_2:
	setx	0x1c020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_3:
	setx	0x1f031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c4209d  ! 38: LDSWA_I	ldswa	[%r16, + 0x009d] %asi, %r26
	.word 0xf0040000  ! 41: LDUW_R	lduw	[%r16 + %r0], %r24
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf28c8020  ! 43: LDUBA_R	lduba	[%r18, %r0] 0x01, %r25
	.word 0xb4b421e6  ! 44: ORNcc_I	orncc 	%r16, 0x01e6, %r26
	.word 0xf40c0000  ! 47: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xbd3cb001  ! 49: SRAX_I	srax	%r18, 0x0001, %r30
cpu_intr_2_4:
	setx	0x1c011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_5:
	setx	0x1e0118, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_1:
	mov	0x3c3, %r14
	.word 0xf2f38400  ! 59: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf8544000  ! 61: LDSH_R	ldsh	[%r17 + %r0], %r28
T2_asi_reg_rd_0:
	mov	0x21, %r14
	.word 0xfedb8e80  ! 62: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf814c000  ! 66: LDUH_R	lduh	[%r19 + %r0], %r28
T2_asi_reg_wr_2:
	mov	0x2, %r14
	.word 0xfcf38400  ! 72: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_wr_3:
	mov	0x4, %r14
	.word 0xfaf38e60  ! 75: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 2e)
	.word 0xbf2d8000  ! 79: SLL_R	sll 	%r22, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf85ca0dd  ! 84: LDX_I	ldx	[%r18 + 0x00dd], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
cpu_intr_2_6:
	setx	0x1c002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_wr_4:
	mov	0x11, %r14
	.word 0xfef38e80  ! 102: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb68460a4  ! 103: ADDcc_I	addcc 	%r17, 0x00a4, %r27
	.word 0xfc54219f  ! 106: LDSH_I	ldsh	[%r16 + 0x019f], %r30
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_5:
	mov	0x2, %r14
	.word 0xfcf38e40  ! 112: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_1:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 114: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_7:
	setx	0x1f021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_8:
	setx	0x1c0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983ada  ! 120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ada, %hpstate
	.word 0xfc8c2097  ! 122: LDUBA_I	lduba	[%r16, + 0x0097] %asi, %r30
	.word 0xfc0c8000  ! 123: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xfc15a042  ! 125: LDUH_I	lduh	[%r22 + 0x0042], %r30
	.word 0xf28c0020  ! 126: LDUBA_R	lduba	[%r16, %r0] 0x01, %r25
T2_asi_reg_wr_6:
	mov	0x18, %r14
	.word 0xfaf389e0  ! 132: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf6854020  ! 134: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r27
	.word 0xfe0da1e9  ! 136: LDUB_I	ldub	[%r22 + 0x01e9], %r31
cpu_intr_2_9:
	setx	0x1c000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_10:
	setx	0x1d0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2440000  ! 143: LDSW_R	ldsw	[%r16 + %r0], %r25
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 38)
	.word 0xfe854020  ! 150: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r31
	.word 0xb9508000  ! 153: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_2:
	mov	0x17, %r14
	.word 0xf2db8400  ! 158: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_11:
	setx	0x1d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d205d  ! 163: LDUB_I	ldub	[%r20 + 0x005d], %r31
	.word 0xfc044000  ! 164: LDUW_R	lduw	[%r17 + %r0], %r30
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfc04203f  ! 167: LDUW_I	lduw	[%r16 + 0x003f], %r30
T2_asi_reg_rd_3:
	mov	0xb, %r14
	.word 0xfcdb8400  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 10)
	.word 0xf0858020  ! 174: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
	.word 0xf84520a6  ! 177: LDSW_I	ldsw	[%r20 + 0x00a6], %r28
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfccd6036  ! 180: LDSBA_I	ldsba	[%r21, + 0x0036] %asi, %r30
	.word 0xf04c8000  ! 181: LDSB_R	ldsb	[%r18 + %r0], %r24
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_rd_4:
	mov	0x1a, %r14
	.word 0xf6db89e0  ! 183: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_12:
	setx	0x1e0035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 16)
	.word 0xf25d8000  ! 192: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xb5643801  ! 193: MOVcc_I	<illegal instruction>
cpu_intr_2_13:
	setx	0x1e0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf654e016  ! 196: LDSH_I	ldsh	[%r19 + 0x0016], %r27
cpu_intr_2_14:
	setx	0x1d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_5:
	mov	0xa, %r14
	.word 0xf8db8e40  ! 203: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf4940020  ! 205: LDUHA_R	lduha	[%r16, %r0] 0x01, %r26
	.word 0xbe8c4000  ! 206: ANDcc_R	andcc 	%r17, %r0, %r31
T2_asi_reg_wr_7:
	mov	0x1b, %r14
	.word 0xfaf384a0  ! 208: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf45ce004  ! 210: LDX_I	ldx	[%r19 + 0x0004], %r26
T2_asi_reg_wr_8:
	mov	0x3c2, %r14
	.word 0xf0f389e0  ! 211: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf44d8000  ! 214: LDSB_R	ldsb	[%r22 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_9:
	mov	0x3c1, %r14
	.word 0xf2f38400  ! 218: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_6:
	mov	0x12, %r14
	.word 0xf4db84a0  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf8dd2136  ! 226: LDXA_I	ldxa	[%r20, + 0x0136] %asi, %r28
	.word 0x87946079  ! 228: WRPR_TT_I	wrpr	%r17, 0x0079, %tt
	.word 0xf4956100  ! 229: LDUHA_I	lduha	[%r21, + 0x0100] %asi, %r26
	.word 0xf64c20cd  ! 230: LDSB_I	ldsb	[%r16 + 0x00cd], %r27
	.word 0xfe8d0020  ! 237: LDUBA_R	lduba	[%r20, %r0] 0x01, %r31
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 25)
	ta	T_CHANGE_NONHPRIV
	.word 0xf255e059  ! 250: LDSH_I	ldsh	[%r23 + 0x0059], %r25
	.word 0xb00d20d9  ! 251: AND_I	and 	%r20, 0x00d9, %r24
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfc5d2120  ! 254: LDX_I	ldx	[%r20 + 0x0120], %r30
	.word 0xbc35e198  ! 257: ORN_I	orn 	%r23, 0x0198, %r30
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e9a  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9a, %hpstate
	.word 0xfc54a07c  ! 261: LDSH_I	ldsh	[%r18 + 0x007c], %r30
	ta	T_CHANGE_HPRIV
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 25)
	.word 0xf69460e7  ! 265: LDUHA_I	lduha	[%r17, + 0x00e7] %asi, %r27
	.word 0xf0840020  ! 268: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r24
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b90  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b90, %hpstate
T2_asi_reg_rd_7:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 271: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_15:
	setx	0x1f0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0450000  ! 279: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xf25d6032  ! 282: LDX_I	ldx	[%r21 + 0x0032], %r25
	.word 0xbb641800  ! 285: MOVcc_R	<illegal instruction>
T2_asi_reg_rd_8:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 286: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_wr_10:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 294: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL0
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 7)
	.word 0xf81560b1  ! 301: LDUH_I	lduh	[%r21 + 0x00b1], %r28
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_16:
	setx	0x1f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_9:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 305: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfc84e17a  ! 307: LDUWA_I	lduwa	[%r19, + 0x017a] %asi, %r30
cpu_intr_2_17:
	setx	0x1f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_18:
	setx	0x1e0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0561a1  ! 312: LDUW_I	lduw	[%r21 + 0x01a1], %r31
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_19:
	setx	0x1c0213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, e)
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf00d4000  ! 317: LDUB_R	ldub	[%r21 + %r0], %r24
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_wr_11:
	mov	0xa, %r14
	.word 0xf8f384a0  ! 324: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T2_asi_reg_wr_12:
	mov	0x12, %r14
	.word 0xf0f389e0  ! 325: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
cpu_intr_2_20:
	setx	0x1c021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d4000  ! 329: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xf244a0ed  ! 330: LDSW_I	ldsw	[%r18 + 0x00ed], %r25
cpu_intr_2_21:
	setx	0x1f0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc344000  ! 334: SUBC_R	orn 	%r17, %r0, %r30
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983dd0  ! 335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd0, %hpstate
	.word 0xf4040000  ! 337: LDUW_R	lduw	[%r16 + %r0], %r26
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_22:
	setx	0x1f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_23:
	setx	0x1d0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8c8020  ! 357: LDUBA_R	lduba	[%r18, %r0] 0x01, %r31
cpu_intr_2_24:
	setx	0x1e0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983f90  ! 359: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f90, %hpstate
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 8)
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983982  ! 361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1982, %hpstate
cpu_intr_2_25:
	setx	0x1c0205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_26:
	setx	0x1f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa046095  ! 367: LDUW_I	lduw	[%r17 + 0x0095], %r29
cpu_intr_2_27:
	setx	0x1e0124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_28:
	setx	0x1c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 20)
	.word 0xfc85a00a  ! 376: LDUWA_I	lduwa	[%r22, + 0x000a] %asi, %r30
T2_asi_reg_rd_10:
	mov	0x28, %r14
	.word 0xf2db89e0  ! 379: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_11:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_29:
	setx	0x1d0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195a008  ! 390: WRPR_PIL_I	wrpr	%r22, 0x0008, %pil
	.word 0xfac44020  ! 393: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r29
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, b)
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_30:
	setx	0x1c021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 11)
	.word 0xbf2da001  ! 407: SLL_I	sll 	%r22, 0x0001, %r31
T2_asi_reg_wr_13:
	mov	0x1b, %r14
	.word 0xfef38400  ! 412: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982842  ! 414: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0842, %hpstate
	.word 0xf28520b5  ! 416: LDUWA_I	lduwa	[%r20, + 0x00b5] %asi, %r25
	.word 0xf00ce049  ! 417: LDUB_I	ldub	[%r19 + 0x0049], %r24
	.word 0xfe85209e  ! 419: LDUWA_I	lduwa	[%r20, + 0x009e] %asi, %r31
T2_asi_reg_rd_12:
	mov	0x3c4, %r14
	.word 0xf6db8400  ! 421: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_31:
	setx	0x1e0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x8198380a  ! 425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x180a, %hpstate
	.word 0xfecda0d3  ! 426: LDSBA_I	ldsba	[%r22, + 0x00d3] %asi, %r31
T2_asi_reg_wr_14:
	mov	0x30, %r14
	.word 0xf6f38e40  ! 427: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xfacc0020  ! 429: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
	.word 0xf25c61ba  ! 430: LDX_I	ldx	[%r17 + 0x01ba], %r25
	.word 0xf0850020  ! 431: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r24
	.word 0xfc050000  ! 432: LDUW_R	lduw	[%r20 + %r0], %r30
cpu_intr_2_32:
	setx	0x1f031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_33:
	setx	0x1e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_13:
	mov	0x2a, %r14
	.word 0xf2db89e0  ! 438: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_34:
	setx	0x1f0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_35:
	setx	0x1c001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8544000  ! 447: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xfed40020  ! 450: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r31
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf68da082  ! 452: LDUBA_I	lduba	[%r22, + 0x0082] %asi, %r27
	ta	T_CHANGE_TO_TL0
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_wr_15:
	mov	0x3c1, %r14
	.word 0xf2f389e0  ! 462: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 32)
	.word 0xf4c40020  ! 469: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r26
T2_asi_reg_wr_16:
	mov	0x2e, %r14
	.word 0xf4f38e40  ! 470: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 29)
	.word 0xb4854000  ! 483: ADDcc_R	addcc 	%r21, %r0, %r26
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, f)
	.word 0xf8140000  ! 486: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xf05dc000  ! 488: LDX_R	ldx	[%r23 + %r0], %r24
	.word 0xf4c4215e  ! 489: LDSWA_I	ldswa	[%r16, + 0x015e] %asi, %r26
	.word 0xb134a001  ! 490: SRL_I	srl 	%r18, 0x0001, %r24
	.word 0xb2ac20b8  ! 492: ANDNcc_I	andncc 	%r16, 0x00b8, %r25
T2_asi_reg_rd_14:
	mov	0xf, %r14
	.word 0xfadb84a0  ! 494: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf4542024  ! 497: LDSH_I	ldsh	[%r16 + 0x0024], %r26
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 2c)
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982dc2  ! 499: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc2, %hpstate
T2_asi_reg_rd_15:
	mov	0x11, %r14
	.word 0xf6db8e80  ! 501: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_wr_17:
	mov	0x20, %r14
	.word 0xf6f38e40  ! 502: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf614615e  ! 505: LDUH_I	lduh	[%r17 + 0x015e], %r27
T2_asi_reg_wr_18:
	mov	0x24, %r14
	.word 0xfcf38e40  ! 507: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 32)
	.word 0xbe9d0000  ! 513: XORcc_R	xorcc 	%r20, %r0, %r31
	.word 0xf8dda0b3  ! 517: LDXA_I	ldxa	[%r22, + 0x00b3] %asi, %r28
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, f)
	.word 0xfcd5e1ff  ! 531: LDSHA_I	ldsha	[%r23, + 0x01ff] %asi, %r30
T2_asi_reg_wr_19:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 532: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_rd_16:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 535: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_rd_17:
	mov	0x4, %r14
	.word 0xfadb8e40  ! 536: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf0c48020  ! 537: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r24
cpu_intr_2_36:
	setx	0x200123, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_20:
	mov	0x13, %r14
	.word 0xf2f384a0  ! 550: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf20de10a  ! 551: LDUB_I	ldub	[%r23 + 0x010a], %r25
	.word 0xba25202d  ! 553: SUB_I	sub 	%r20, 0x002d, %r29
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_18:
	mov	0x2, %r14
	.word 0xf2db8e40  ! 555: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_21:
	mov	0x3c7, %r14
	.word 0xfaf38e80  ! 560: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_rd_19:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
cpu_intr_2_37:
	setx	0x210223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d8000  ! 568: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xf05d0000  ! 571: LDX_R	ldx	[%r20 + %r0], %r24
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL0
	.word 0xfc95e040  ! 575: LDUHA_I	lduha	[%r23, + 0x0040] %asi, %r30
	.word 0xbeaca1f1  ! 576: ANDNcc_I	andncc 	%r18, 0x01f1, %r31
T2_asi_reg_wr_22:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 577: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_23:
	mov	0x1c, %r14
	.word 0xfef384a0  ! 578: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_20:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 583: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 0)
	.word 0xb1641800  ! 585: MOVcc_R	<illegal instruction>
	.word 0xbc258000  ! 587: SUB_R	sub 	%r22, %r0, %r30
	.word 0xfe144000  ! 588: LDUH_R	lduh	[%r17 + %r0], %r31
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_24:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 593: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf044a0c9  ! 594: LDSW_I	ldsw	[%r18 + 0x00c9], %r24
T2_asi_reg_rd_21:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 597: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf68c61b9  ! 598: LDUBA_I	lduba	[%r17, + 0x01b9] %asi, %r27
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d92  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d92, %hpstate
T2_asi_reg_wr_25:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 601: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 9)
	.word 0xfa4d0000  ! 606: LDSB_R	ldsb	[%r20 + %r0], %r29
T2_asi_reg_rd_22:
	mov	0x8, %r14
	.word 0xf0db8e40  ! 608: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_38:
	setx	0x20023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_23:
	mov	0xb, %r14
	.word 0xf2db8e80  ! 611: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_rd_24:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 616: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_26:
	mov	0xb, %r14
	.word 0xfef38e80  ! 617: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_2_39:
	setx	0x22001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 35)
	.word 0xf485a135  ! 621: LDUWA_I	lduwa	[%r22, + 0x0135] %asi, %r26
cpu_intr_2_40:
	setx	0x22020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_41:
	setx	0x23012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_27:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 625: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_42:
	setx	0x22031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_43:
	setx	0x21030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_44:
	setx	0x200112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_45:
	setx	0x21002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa442118  ! 637: LDSW_I	ldsw	[%r16 + 0x0118], %r29
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_46:
	setx	0x210024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 20)
	.word 0xfad40020  ! 652: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r29
	.word 0xb0b4c000  ! 655: ORNcc_R	orncc 	%r19, %r0, %r24
	.word 0xfc448000  ! 656: LDSW_R	ldsw	[%r18 + %r0], %r30
T2_asi_reg_wr_28:
	mov	0x3c0, %r14
	.word 0xfef384a0  ! 657: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 10)
	.word 0xfe144000  ! 662: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xf215c000  ! 664: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xfac44020  ! 665: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r29
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 27)
	.word 0xf65c208f  ! 668: LDX_I	ldx	[%r16 + 0x008f], %r27
cpu_intr_2_47:
	setx	0x210018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3d6001  ! 674: SRA_I	sra 	%r21, 0x0001, %r30
	.word 0xb21ce016  ! 677: XOR_I	xor 	%r19, 0x0016, %r25
T2_asi_reg_rd_25:
	mov	0x14, %r14
	.word 0xfadb8e40  ! 682: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb835e0d3  ! 684: SUBC_I	orn 	%r23, 0x00d3, %r28
	.word 0xf8848020  ! 685: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r28
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 2)
	.word 0xfec5e109  ! 691: LDSWA_I	ldswa	[%r23, + 0x0109] %asi, %r31
	.word 0xba3c8000  ! 693: XNOR_R	xnor 	%r18, %r0, %r29
	.word 0xb5480000  ! 696: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfe840020  ! 699: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
	.word 0xf6840020  ! 701: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a58  ! 703: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a58, %hpstate
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 30)
	.word 0xf8cd8020  ! 712: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_48:
	setx	0x200031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_49:
	setx	0x200016, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xbe058000  ! 723: ADD_R	add 	%r22, %r0, %r31
cpu_intr_2_50:
	setx	0x210103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4050000  ! 726: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xfadca1c1  ! 728: LDXA_I	ldxa	[%r18, + 0x01c1] %asi, %r29
cpu_intr_2_51:
	setx	0x20033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_52:
	setx	0x220119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d4e1ad  ! 744: LDSHA_I	ldsha	[%r19, + 0x01ad] %asi, %r25
	.word 0xb285c000  ! 745: ADDcc_R	addcc 	%r23, %r0, %r25
	.word 0xfe44e017  ! 747: LDSW_I	ldsw	[%r19 + 0x0017], %r31
	.word 0xf8dda1ea  ! 748: LDXA_I	ldxa	[%r22, + 0x01ea] %asi, %r28
	.word 0xf204e008  ! 751: LDUW_I	lduw	[%r19 + 0x0008], %r25
	.word 0xb834e1b6  ! 752: ORN_I	orn 	%r19, 0x01b6, %r28
	.word 0xf00ca046  ! 754: LDUB_I	ldub	[%r18 + 0x0046], %r24
	.word 0xf815212a  ! 755: LDUH_I	lduh	[%r20 + 0x012a], %r28
T2_asi_reg_wr_29:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 756: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_53:
	setx	0x210320, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_26:
	mov	0x26, %r14
	.word 0xfadb84a0  ! 759: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf4cd8020  ! 763: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r26
cpu_intr_2_54:
	setx	0x210210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 9)
	.word 0xfc056157  ! 767: LDUW_I	lduw	[%r21 + 0x0157], %r30
	.word 0xfa45a048  ! 772: LDSW_I	ldsw	[%r22 + 0x0048], %r29
cpu_intr_2_55:
	setx	0x23010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_56:
	setx	0x23013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0dc000  ! 783: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xbe34a0eb  ! 784: SUBC_I	orn 	%r18, 0x00eb, %r31
cpu_intr_2_57:
	setx	0x230104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_58:
	setx	0x200136, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_30:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 791: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_59:
	setx	0x20000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c4a087  ! 793: LDSWA_I	ldswa	[%r18, + 0x0087] %asi, %r24
	.word 0xbc1d2156  ! 796: XOR_I	xor 	%r20, 0x0156, %r30
	.word 0xf65de1b2  ! 798: LDX_I	ldx	[%r23 + 0x01b2], %r27
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 5)
	.word 0xfc540000  ! 803: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xb2b54000  ! 806: ORNcc_R	orncc 	%r21, %r0, %r25
	.word 0xf2940020  ! 810: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
	.word 0xf045c000  ! 815: LDSW_R	ldsw	[%r23 + %r0], %r24
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_wr_31:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 825: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf64c4000  ! 828: LDSB_R	ldsb	[%r17 + %r0], %r27
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_60:
	setx	0x230329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe350000  ! 834: ORN_R	orn 	%r20, %r0, %r31
T2_asi_reg_rd_27:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 837: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_rd_28:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xba35217c  ! 842: ORN_I	orn 	%r20, 0x017c, %r29
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 18)
	ta	T_CHANGE_NONHPRIV
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 29)
	.word 0xbe2d20f2  ! 851: ANDN_I	andn 	%r20, 0x00f2, %r31
	.word 0xf0cde175  ! 853: LDSBA_I	ldsba	[%r23, + 0x0175] %asi, %r24
T2_asi_reg_wr_32:
	mov	0x1a, %r14
	.word 0xfcf384a0  ! 859: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_61:
	setx	0x20012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_62:
	setx	0x21012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88ce0e0  ! 865: LDUBA_I	lduba	[%r19, + 0x00e0] %asi, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb81da0c2  ! 867: XOR_I	xor 	%r22, 0x00c2, %r28
T2_asi_reg_wr_33:
	mov	0xe, %r14
	.word 0xfaf38e80  ! 868: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_63:
	setx	0x230008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc048000  ! 873: LDUW_R	lduw	[%r18 + %r0], %r30
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 30)
	.word 0xfadd6014  ! 880: LDXA_I	ldxa	[%r21, + 0x0014] %asi, %r29
cpu_intr_2_64:
	setx	0x200325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c4a085  ! 882: LDSWA_I	ldswa	[%r18, + 0x0085] %asi, %r24
T2_asi_reg_rd_29:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 883: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf0d54020  ! 885: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r24
	.word 0xf4c52157  ! 888: LDSWA_I	ldswa	[%r20, + 0x0157] %asi, %r26
	.word 0xfc0d0000  ! 890: LDUB_R	ldub	[%r20 + %r0], %r30
T2_asi_reg_rd_30:
	mov	0xf, %r14
	.word 0xf0db89e0  ! 891: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfa44a042  ! 897: LDSW_I	ldsw	[%r18 + 0x0042], %r29
T2_asi_reg_rd_31:
	mov	0xc, %r14
	.word 0xf8db8e60  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfa94a16e  ! 900: LDUHA_I	lduha	[%r18, + 0x016e] %asi, %r29
T2_asi_reg_rd_32:
	mov	0x17, %r14
	.word 0xf8db8e80  ! 901: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_65:
	setx	0x230010, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_33:
	mov	0x30, %r14
	.word 0xf8db8e60  ! 905: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_wr_34:
	mov	0x12, %r14
	.word 0xf8f389e0  ! 908: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 11)
	.word 0xf2d4e05a  ! 918: LDSHA_I	ldsha	[%r19, + 0x005a] %asi, %r25
	.word 0xf044619e  ! 921: LDSW_I	ldsw	[%r17 + 0x019e], %r24
cpu_intr_2_66:
	setx	0x21022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_wr_35:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 925: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf6158000  ! 926: LDUH_R	lduh	[%r22 + %r0], %r27
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 2)
	.word 0xfe940020  ! 929: LDUHA_R	lduha	[%r16, %r0] 0x01, %r31
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_34:
	mov	0x6, %r14
	.word 0xfedb8e40  ! 932: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_67:
	setx	0x23011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec50020  ! 934: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r31
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 21)
	.word 0xf88cc020  ! 936: LDUBA_R	lduba	[%r19, %r0] 0x01, %r28
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_68:
	setx	0x220014, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_36:
	mov	0x22, %r14
	.word 0xf6f389e0  ! 943: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_69:
	setx	0x260001, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_35:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 949: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_2_70:
	setx	0x26012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_71:
	setx	0x26023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_36:
	mov	0x15, %r14
	.word 0xf6db84a0  ! 956: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_2_72:
	setx	0x270123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4ac8000  ! 959: ANDNcc_R	andncc 	%r18, %r0, %r26
	.word 0xf20c8000  ! 963: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xf68dc020  ! 964: LDUBA_R	lduba	[%r23, %r0] 0x01, %r27
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 29)
	.word 0x9194a0bf  ! 973: WRPR_PIL_I	wrpr	%r18, 0x00bf, %pil
	.word 0xf8558000  ! 975: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xfe440000  ! 976: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xf0458000  ! 978: LDSW_R	ldsw	[%r22 + %r0], %r24
cpu_intr_2_73:
	setx	0x240137, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_37:
	mov	0x1e, %r14
	.word 0xfcf38e60  ! 982: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_74:
	setx	0x27023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd5619f  ! 988: LDSHA_I	ldsha	[%r21, + 0x019f] %asi, %r30
T2_asi_reg_rd_37:
	mov	0x2, %r14
	.word 0xfadb89e0  ! 989: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_wr_38:
	mov	0x33, %r14
	.word 0xfcf38e80  ! 991: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 0)
	.word 0xf2554000  ! 999: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xf88d602a  ! 1000: LDUBA_I	lduba	[%r21, + 0x002a] %asi, %r28
	.word 0x839521b9  ! 1001: WRPR_TNPC_I	wrpr	%r20, 0x01b9, %tnpc
	.word 0xf8cc2122  ! 1004: LDSBA_I	ldsba	[%r16, + 0x0122] %asi, %r28
	.word 0xfa95a00b  ! 1005: LDUHA_I	lduha	[%r22, + 0x000b] %asi, %r29
	.word 0xb48c60a3  ! 1006: ANDcc_I	andcc 	%r17, 0x00a3, %r26
T2_asi_reg_wr_39:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 1007: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 3e)
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_38:
	mov	0x22, %r14
	.word 0xf8db89e0  ! 1014: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0x8f902000  ! 1017: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf48c8020  ! 1028: LDUBA_R	lduba	[%r18, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf88460f2  ! 1032: LDUWA_I	lduwa	[%r17, + 0x00f2] %asi, %r28
cpu_intr_2_75:
	setx	0x260127, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_40:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 1034: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf6150000  ! 1035: LDUH_R	lduh	[%r20 + %r0], %r27
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 32)
	.word 0xfa5dc000  ! 1037: LDX_R	ldx	[%r23 + %r0], %r29
cpu_intr_2_76:
	setx	0x24013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_41:
	mov	0x4, %r14
	.word 0xf8f389e0  ! 1039: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf08ca184  ! 1040: LDUBA_I	lduba	[%r18, + 0x0184] %asi, %r24
	.word 0xf614c000  ! 1042: LDUH_R	lduh	[%r19 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfc0c8000  ! 1047: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xb8248000  ! 1050: SUB_R	sub 	%r18, %r0, %r28
T2_asi_reg_wr_42:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 1052: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfccd0020  ! 1053: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r30
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 10)
	.word 0xf8cd4020  ! 1056: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r28
	.word 0xb29dc000  ! 1057: XORcc_R	xorcc 	%r23, %r0, %r25
	.word 0xf685c020  ! 1058: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 28)
	.word 0xf4958020  ! 1062: LDUHA_R	lduha	[%r22, %r0] 0x01, %r26
T2_asi_reg_wr_43:
	mov	0x32, %r14
	.word 0xfaf38e60  ! 1063: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_wr_44:
	mov	0x3c8, %r14
	.word 0xf2f38e60  ! 1064: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_rd_39:
	mov	0xb, %r14
	.word 0xf2db8400  ! 1073: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_rd_40:
	mov	0x8, %r14
	.word 0xf4db8e40  ! 1074: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfac40020  ! 1076: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r29
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_45:
	mov	0x3c2, %r14
	.word 0xf2f384a0  ! 1081: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf8c5a024  ! 1084: LDSWA_I	ldswa	[%r22, + 0x0024] %asi, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc1421cd  ! 1086: LDUH_I	lduh	[%r16 + 0x01cd], %r30
T2_asi_reg_rd_41:
	mov	0x0, %r14
	.word 0xfcdb84a0  ! 1087: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_rd_42:
	mov	0x33, %r14
	.word 0xf0db8e40  ! 1088: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe458000  ! 1089: LDSW_R	ldsw	[%r22 + %r0], %r31
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 25)
	.word 0xfacd0020  ! 1093: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
T2_asi_reg_wr_46:
	mov	0x1, %r14
	.word 0xfcf38e80  ! 1095: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_77:
	setx	0x25022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_43:
	mov	0x3c7, %r14
	.word 0xf6db84a0  ! 1100: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_rd_44:
	mov	0x3c1, %r14
	.word 0xfadb8e60  ! 1102: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_2_78:
	setx	0x250336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_79:
	setx	0x27010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0ce112  ! 1108: LDUB_I	ldub	[%r19 + 0x0112], %r29
cpu_intr_2_80:
	setx	0x24020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_47:
	mov	0x26, %r14
	.word 0xfef38e60  ! 1110: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf4dce0f1  ! 1114: LDXA_I	ldxa	[%r19, + 0x00f1] %asi, %r26
cpu_intr_2_81:
	setx	0x240221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, f)
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_82:
	setx	0x250137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41461a7  ! 1124: OR_I	or 	%r17, 0x01a7, %r26
T2_asi_reg_rd_45:
	mov	0x3, %r14
	.word 0xf4db8e40  ! 1126: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_46:
	mov	0xd, %r14
	.word 0xf8db84a0  ! 1127: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfacca109  ! 1128: LDSBA_I	ldsba	[%r18, + 0x0109] %asi, %r29
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_83:
	setx	0x26001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c561e8  ! 1135: LDSWA_I	ldswa	[%r21, + 0x01e8] %asi, %r28
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, d)
	.word 0x87942148  ! 1142: WRPR_TT_I	wrpr	%r16, 0x0148, %tt
	.word 0xfe45c000  ! 1143: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xf85da155  ! 1144: LDX_I	ldx	[%r22 + 0x0155], %r28
	.word 0xf484e190  ! 1145: LDUWA_I	lduwa	[%r19, + 0x0190] %asi, %r26
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_84:
	setx	0x250104, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_48:
	mov	0x38, %r14
	.word 0xf4f38e40  ! 1154: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_85:
	setx	0x250314, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982fd8  ! 1157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd8, %hpstate
	.word 0xf6044000  ! 1158: LDUW_R	lduw	[%r17 + %r0], %r27
T2_asi_reg_wr_49:
	mov	0x35, %r14
	.word 0xfef38e60  ! 1159: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_2_86:
	setx	0x24003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c0000  ! 1163: SRA_R	sra 	%r16, %r0, %r30
T2_asi_reg_rd_47:
	mov	0x1b, %r14
	.word 0xf8db8e80  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb4940000  ! 1166: ORcc_R	orcc 	%r16, %r0, %r26
	.word 0xf494e189  ! 1168: LDUHA_I	lduha	[%r19, + 0x0189] %asi, %r26
	.word 0xfc44c000  ! 1169: LDSW_R	ldsw	[%r19 + %r0], %r30
T2_asi_reg_rd_48:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 1172: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf084e08c  ! 1174: LDUWA_I	lduwa	[%r19, + 0x008c] %asi, %r24
	.word 0x8794a132  ! 1176: WRPR_TT_I	wrpr	%r18, 0x0132, %tt
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 18)
	.word 0xb6a5217c  ! 1181: SUBcc_I	subcc 	%r20, 0x017c, %r27
T2_asi_reg_wr_50:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 1183: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf8d44020  ! 1184: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r28
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 2f)
	.word 0xb32c3001  ! 1195: SLLX_I	sllx	%r16, 0x0001, %r25
T2_asi_reg_rd_49:
	mov	0x14, %r14
	.word 0xf2db8e60  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_wr_51:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 1199: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf2cd6038  ! 1200: LDSBA_I	ldsba	[%r21, + 0x0038] %asi, %r25
cpu_intr_2_87:
	setx	0x26020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d58020  ! 1204: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r26
	.word 0xf0140000  ! 1208: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xfc4dc000  ! 1210: LDSB_R	ldsb	[%r23 + %r0], %r30
	ta	T_CHANGE_TO_TL1
cpu_intr_2_88:
	setx	0x260339, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_52:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 1223: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983812  ! 1225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1812, %hpstate
	.word 0xfe5c4000  ! 1227: LDX_R	ldx	[%r17 + %r0], %r31
	ta	T_CHANGE_HPRIV
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf6cca196  ! 1233: LDSBA_I	ldsba	[%r18, + 0x0196] %asi, %r27
	.word 0xfad40020  ! 1234: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r29
	.word 0xb6a58000  ! 1236: SUBcc_R	subcc 	%r22, %r0, %r27
cpu_intr_2_89:
	setx	0x240231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf614c000  ! 1239: LDUH_R	lduh	[%r19 + %r0], %r27
	ta	T_CHANGE_TO_TL0
cpu_intr_2_90:
	setx	0x24021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d2158  ! 1243: LDX_I	ldx	[%r20 + 0x0158], %r28
T2_asi_reg_wr_53:
	mov	0x2, %r14
	.word 0xf6f38e40  ! 1244: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbc1c8000  ! 1248: XOR_R	xor 	%r18, %r0, %r30
cpu_intr_2_91:
	setx	0x260317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d8000  ! 1250: LDX_R	ldx	[%r22 + %r0], %r28
T2_asi_reg_wr_54:
	mov	0x12, %r14
	.word 0xf8f389e0  ! 1253: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb80c0000  ! 1257: AND_R	and 	%r16, %r0, %r28
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983c18  ! 1258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c18, %hpstate
	.word 0xf05c20ca  ! 1260: LDX_I	ldx	[%r16 + 0x00ca], %r24
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_55:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 1272: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf8050000  ! 1273: LDUW_R	lduw	[%r20 + %r0], %r28
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_56:
	mov	0x3c2, %r14
	.word 0xf4f38e80  ! 1275: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_rd_50:
	mov	0x1, %r14
	.word 0xfedb84a0  ! 1276: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb8c5e050  ! 1278: ADDCcc_I	addccc 	%r23, 0x0050, %r28
	.word 0xf28da027  ! 1279: LDUBA_I	lduba	[%r22, + 0x0027] %asi, %r25
cpu_intr_2_92:
	setx	0x27011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77d8400  ! 1285: MOVR_R	movre	%r22, %r0, %r27
	.word 0xb0946015  ! 1286: ORcc_I	orcc 	%r17, 0x0015, %r24
T2_asi_reg_rd_51:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 1287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfcd5c020  ! 1288: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r30
	.word 0xbe94c000  ! 1295: ORcc_R	orcc 	%r19, %r0, %r31
cpu_intr_2_93:
	setx	0x270038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4d616f  ! 1297: LDSB_I	ldsb	[%r21 + 0x016f], %r31
	.word 0xf21421be  ! 1303: LDUH_I	lduh	[%r16 + 0x01be], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_94:
	setx	0x260316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_95:
	setx	0x250311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_96:
	setx	0x250117, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfe040000  ! 1317: LDUW_R	lduw	[%r16 + %r0], %r31
cpu_intr_2_97:
	setx	0x260229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 19)
	.word 0xb72dc000  ! 1322: SLL_R	sll 	%r23, %r0, %r27
T2_asi_reg_rd_52:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 1323: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf68c202c  ! 1325: LDUBA_I	lduba	[%r16, + 0x002c] %asi, %r27
	.word 0xf484207e  ! 1328: LDUWA_I	lduwa	[%r16, + 0x007e] %asi, %r26
cpu_intr_2_98:
	setx	0x1021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c5a  ! 1332: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c5a, %hpstate
	.word 0xbb34d000  ! 1333: SRLX_R	srlx	%r19, %r0, %r29
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198380a  ! 1335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x180a, %hpstate
T2_asi_reg_rd_53:
	mov	0x1e, %r14
	.word 0xfcdb84a0  ! 1340: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfec44020  ! 1347: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
	.word 0xbb7d0400  ! 1349: MOVR_R	movre	%r20, %r0, %r29
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 2)
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x819829da  ! 1360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09da, %hpstate
T2_asi_reg_rd_54:
	mov	0x27, %r14
	.word 0xfedb84a0  ! 1361: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 38)
	.word 0xf68d0020  ! 1363: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
	.word 0xb6ad4000  ! 1364: ANDNcc_R	andncc 	%r21, %r0, %r27
	.word 0xf24dc000  ! 1365: LDSB_R	ldsb	[%r23 + %r0], %r25
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_57:
	mov	0x10, %r14
	.word 0xf8f38e60  ! 1371: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf8d4a172  ! 1375: LDSHA_I	ldsha	[%r18, + 0x0172] %asi, %r28
	.word 0xb2a56184  ! 1379: SUBcc_I	subcc 	%r21, 0x0184, %r25
cpu_intr_2_99:
	setx	0x26011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2d0000  ! 1381: ANDN_R	andn 	%r20, %r0, %r31
	.word 0xf60cc000  ! 1382: LDUB_R	ldub	[%r19 + %r0], %r27
T2_asi_reg_rd_55:
	mov	0xf, %r14
	.word 0xf0db8e40  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb2b5c000  ! 1388: SUBCcc_R	orncc 	%r23, %r0, %r25
T2_asi_reg_wr_58:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 1389: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfacdc020  ! 1390: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r29
	.word 0xb7343001  ! 1392: SRLX_I	srlx	%r16, 0x0001, %r27
T2_asi_reg_wr_59:
	mov	0x36, %r14
	.word 0xfcf389e0  ! 1393: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 13)
	.word 0xf0148000  ! 1397: LDUH_R	lduh	[%r18 + %r0], %r24
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_100:
	setx	0x2a0029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_101:
	setx	0x2b0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_102:
	setx	0x29032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4148000  ! 1413: LDUH_R	lduh	[%r18 + %r0], %r26
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 15)
	.word 0xbd510000  ! 1415: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_TO_TL1
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x8198295a  ! 1422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095a, %hpstate
	.word 0xb4adc000  ! 1426: ANDNcc_R	andncc 	%r23, %r0, %r26
	.word 0xf644604e  ! 1429: LDSW_I	ldsw	[%r17 + 0x004e], %r27
	.word 0xb695c000  ! 1431: ORcc_R	orcc 	%r23, %r0, %r27
	.word 0xb951c000  ! 1432: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbe94c000  ! 1436: ORcc_R	orcc 	%r19, %r0, %r31
	.word 0xfad48020  ! 1438: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r29
	.word 0xf2444000  ! 1439: LDSW_R	ldsw	[%r17 + %r0], %r25
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf20d8000  ! 1443: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xf2550000  ! 1445: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xf05dc000  ! 1446: LDX_R	ldx	[%r23 + %r0], %r24
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_103:
	setx	0x280111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_104:
	setx	0x290026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_105:
	setx	0x2b0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacc20d2  ! 1459: LDSBA_I	ldsba	[%r16, + 0x00d2] %asi, %r29
cpu_intr_2_106:
	setx	0x2a021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_107:
	setx	0x280000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_108:
	setx	0x280008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_109:
	setx	0x2b012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_60:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 1466: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf04d2039  ! 1468: LDSB_I	ldsb	[%r20 + 0x0039], %r24
	.word 0xf6cce194  ! 1469: LDSBA_I	ldsba	[%r19, + 0x0194] %asi, %r27
	.word 0xf0854020  ! 1470: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r24
	.word 0xbe8c6145  ! 1473: ANDcc_I	andcc 	%r17, 0x0145, %r31
	.word 0xbe25a011  ! 1480: SUB_I	sub 	%r22, 0x0011, %r31
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 5)
	.word 0xb1510000  ! 1484: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_TO_TL0
	.word 0xf28561ba  ! 1487: LDUWA_I	lduwa	[%r21, + 0x01ba] %asi, %r25
	.word 0xb9641800  ! 1490: MOVcc_R	<illegal instruction>
	.word 0xf0558000  ! 1495: LDSH_R	ldsh	[%r22 + %r0], %r24
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_56:
	mov	0x9, %r14
	.word 0xfcdb8e80  ! 1503: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb23d604f  ! 1504: XNOR_I	xnor 	%r21, 0x004f, %r25
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_110:
	setx	0x2a0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4440000  ! 1510: ADDC_R	addc 	%r16, %r0, %r26
	.word 0xfa54a16e  ! 1512: LDSH_I	ldsh	[%r18 + 0x016e], %r29
T2_asi_reg_rd_57:
	mov	0x11, %r14
	.word 0xfadb8e80  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_111:
	setx	0x290031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c40020  ! 1519: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r28
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_112:
	setx	0x290338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_113:
	setx	0x29023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_58:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 1528: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf20d4000  ! 1529: LDUB_R	ldub	[%r21 + %r0], %r25
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 22)
	.word 0xbc9de0cb  ! 1531: XORcc_I	xorcc 	%r23, 0x00cb, %r30
	.word 0xf415a081  ! 1532: LDUH_I	lduh	[%r22 + 0x0081], %r26
cpu_intr_2_114:
	setx	0x290107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_115:
	setx	0x280135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_116:
	setx	0x290312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_117:
	setx	0x2b023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_118:
	setx	0x29023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_59:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_rd_60:
	mov	0x38, %r14
	.word 0xfcdb89e0  ! 1548: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf614e186  ! 1551: LDUH_I	lduh	[%r19 + 0x0186], %r27
	.word 0xb3340000  ! 1553: SRL_R	srl 	%r16, %r0, %r25
T2_asi_reg_rd_61:
	mov	0x24, %r14
	.word 0xf6db8400  ! 1556: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf64cc000  ! 1561: LDSB_R	ldsb	[%r19 + %r0], %r27
cpu_intr_2_119:
	setx	0x2b003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc944020  ! 1566: LDUHA_R	lduha	[%r17, %r0] 0x01, %r30
	.word 0xfa15c000  ! 1567: LDUH_R	lduh	[%r23 + %r0], %r29
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 4)
	.word 0xf2cc8020  ! 1570: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r25
	.word 0xfe848020  ! 1573: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r31
	.word 0xfed4a01f  ! 1576: LDSHA_I	ldsha	[%r18, + 0x001f] %asi, %r31
	.word 0xf68c61fb  ! 1577: LDUBA_I	lduba	[%r17, + 0x01fb] %asi, %r27
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 36)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, c)
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c50  ! 1587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c50, %hpstate
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_rd_62:
	mov	0x10, %r14
	.word 0xf0db84a0  ! 1589: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf65de0de  ! 1591: LDX_I	ldx	[%r23 + 0x00de], %r27
T2_asi_reg_rd_63:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 1592: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_120:
	setx	0x2a021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 2e)
	.word 0xb32ce001  ! 1600: SLL_I	sll 	%r19, 0x0001, %r25
	.word 0xf4c52086  ! 1602: LDSWA_I	ldswa	[%r20, + 0x0086] %asi, %r26
cpu_intr_2_121:
	setx	0x2a013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8995e039  ! 1604: WRPR_TICK_I	wrpr	%r23, 0x0039, %tick
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 20)
	.word 0x9194e024  ! 1608: WRPR_PIL_I	wrpr	%r19, 0x0024, %pil
T2_asi_reg_wr_61:
	mov	0x32, %r14
	.word 0xf2f38e40  ! 1610: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe4da105  ! 1614: LDSB_I	ldsb	[%r22 + 0x0105], %r31
	.word 0xfcd5a025  ! 1620: LDSHA_I	ldsha	[%r22, + 0x0025] %asi, %r30
	.word 0xf8948020  ! 1621: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198294a  ! 1624: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094a, %hpstate
	.word 0xb82d6096  ! 1626: ANDN_I	andn 	%r21, 0x0096, %r28
	.word 0xb4adc000  ! 1627: ANDNcc_R	andncc 	%r23, %r0, %r26
	.word 0xfa8d4020  ! 1630: LDUBA_R	lduba	[%r21, %r0] 0x01, %r29
cpu_intr_2_122:
	setx	0x280210, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_64:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 1633: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf2444000  ! 1635: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0xfcd58020  ! 1636: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r30
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982a10  ! 1637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a10, %hpstate
T2_asi_reg_rd_65:
	mov	0x24, %r14
	.word 0xfadb8400  ! 1640: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_wr_62:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 1641: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf04d0000  ! 1644: LDSB_R	ldsb	[%r20 + %r0], %r24
	ta	T_CHANGE_HPRIV
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfa8ca04f  ! 1648: LDUBA_I	lduba	[%r18, + 0x004f] %asi, %r29
	.word 0xf20de026  ! 1649: LDUB_I	ldub	[%r23 + 0x0026], %r25
T2_asi_reg_rd_66:
	mov	0x2b, %r14
	.word 0xf0db8e60  ! 1650: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_wr_63:
	mov	0x1d, %r14
	.word 0xf2f38400  ! 1651: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf80d0000  ! 1653: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xf28d6044  ! 1654: LDUBA_I	lduba	[%r21, + 0x0044] %asi, %r25
cpu_intr_2_123:
	setx	0x2b020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_64:
	mov	0x19, %r14
	.word 0xf4f38e60  ! 1661: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 28)
	.word 0xf2c56076  ! 1664: LDSWA_I	ldswa	[%r21, + 0x0076] %asi, %r25
	.word 0xb4b40000  ! 1666: ORNcc_R	orncc 	%r16, %r0, %r26
T2_asi_reg_rd_67:
	mov	0x17, %r14
	.word 0xf2db8400  ! 1668: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_wr_65:
	mov	0x22, %r14
	.word 0xf6f38e60  ! 1672: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfa950020  ! 1677: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
	.word 0xfccd0020  ! 1680: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r30
T2_asi_reg_wr_66:
	mov	0x22, %r14
	.word 0xf8f38e60  ! 1681: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb0ac4000  ! 1688: ANDNcc_R	andncc 	%r17, %r0, %r24
cpu_intr_2_124:
	setx	0x2a020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_125:
	setx	0x2a0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8458000  ! 1695: LDSW_R	ldsw	[%r22 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_67:
	mov	0x24, %r14
	.word 0xf8f389e0  ! 1697: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
cpu_intr_2_126:
	setx	0x2a003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cc2120  ! 1707: LDSBA_I	ldsba	[%r16, + 0x0120] %asi, %r24
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_127:
	setx	0x29001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfe940020  ! 1713: LDUHA_R	lduha	[%r16, %r0] 0x01, %r31
cpu_intr_2_128:
	setx	0x290134, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_68:
	mov	0x3c5, %r14
	.word 0xf2db8400  ! 1718: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_129:
	setx	0x2b0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6054000  ! 1722: LDUW_R	lduw	[%r21 + %r0], %r27
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_130:
	setx	0x2a0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8cc020  ! 1729: LDUBA_R	lduba	[%r19, %r0] 0x01, %r31
cpu_intr_2_131:
	setx	0x2b0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d4619b  ! 1733: LDSHA_I	ldsha	[%r17, + 0x019b] %asi, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xf055e0a0  ! 1737: LDSH_I	ldsh	[%r23 + 0x00a0], %r24
	.word 0xf48dc020  ! 1738: LDUBA_R	lduba	[%r23, %r0] 0x01, %r26
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 31)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf28da0bd  ! 1746: LDUBA_I	lduba	[%r22, + 0x00bd] %asi, %r25
T2_asi_reg_rd_69:
	mov	0x3, %r14
	.word 0xfedb8400  ! 1750: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb2ada14c  ! 1751: ANDNcc_I	andncc 	%r22, 0x014c, %r25
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_132:
	setx	0x2b033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8561da  ! 1755: LDUWA_I	lduwa	[%r21, + 0x01da] %asi, %r30
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983d08  ! 1756: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d08, %hpstate
cpu_intr_2_133:
	setx	0x280211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_134:
	setx	0x290216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_135:
	setx	0x290036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_136:
	setx	0x280130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 10)
	.word 0xf6c4e1dc  ! 1769: LDSWA_I	ldswa	[%r19, + 0x01dc] %asi, %r27
T2_asi_reg_wr_68:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 1776: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_137:
	setx	0x290104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_138:
	setx	0x280132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc95e0db  ! 1780: LDUHA_I	lduha	[%r23, + 0x00db] %asi, %r30
	.word 0xf0cd4020  ! 1784: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xf6048000  ! 1787: LDUW_R	lduw	[%r18 + %r0], %r27
T2_asi_reg_rd_70:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 1788: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 15)
	.word 0xf2d4c020  ! 1793: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r25
cpu_intr_2_139:
	setx	0x290219, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_69:
	mov	0x2e, %r14
	.word 0xfcf38e40  ! 1798: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfad4a099  ! 1803: LDSHA_I	ldsha	[%r18, + 0x0099] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_71:
	mov	0x33, %r14
	.word 0xf6db84a0  ! 1806: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfe540000  ! 1807: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xfa84a038  ! 1808: LDUWA_I	lduwa	[%r18, + 0x0038] %asi, %r29
T2_asi_reg_rd_72:
	mov	0x9, %r14
	.word 0xfadb8400  ! 1809: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfa44c000  ! 1811: LDSW_R	ldsw	[%r19 + %r0], %r29
cpu_intr_2_140:
	setx	0x2a033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_141:
	setx	0x2a012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_142:
	setx	0x2a010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_73:
	mov	0x3c5, %r14
	.word 0xf0db84a0  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_143:
	setx	0x280000, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_70:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 1828: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_144:
	setx	0x2b0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24d4000  ! 1847: LDSB_R	ldsb	[%r21 + %r0], %r25
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 37)
	.word 0xfe94a091  ! 1849: LDUHA_I	lduha	[%r18, + 0x0091] %asi, %r31
T2_asi_reg_wr_71:
	mov	0x20, %r14
	.word 0xf6f38e40  ! 1852: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfa5cc000  ! 1854: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xfe548000  ! 1855: LDSH_R	ldsh	[%r18 + %r0], %r31
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf64de168  ! 1860: LDSB_I	ldsb	[%r23 + 0x0168], %r27
cpu_intr_2_145:
	setx	0x2a0223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_146:
	setx	0x29012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_147:
	setx	0x2b0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0521a1  ! 1873: ADD_I	add 	%r20, 0x01a1, %r29
T2_asi_reg_wr_72:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 1878: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_wr_73:
	mov	0x2, %r14
	.word 0xf6f389e0  ! 1885: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 1)
	.word 0xfe5de1bf  ! 1888: LDX_I	ldx	[%r23 + 0x01bf], %r31
	.word 0xf844e19a  ! 1891: LDSW_I	ldsw	[%r19 + 0x019a], %r28
	.word 0xf25ce1ae  ! 1899: LDX_I	ldx	[%r19 + 0x01ae], %r25
cpu_intr_2_148:
	setx	0x2e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0950020  ! 1903: LDUHA_R	lduha	[%r20, %r0] 0x01, %r24
cpu_intr_2_149:
	setx	0x2e0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2940020  ! 1908: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
T2_asi_reg_wr_74:
	mov	0x1b, %r14
	.word 0xf4f38400  ! 1909: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf8cd6168  ! 1910: LDSBA_I	ldsba	[%r21, + 0x0168] %asi, %r28
	ta	T_CHANGE_TO_TL0
cpu_intr_2_150:
	setx	0x2e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 39)
	.word 0xfc8d8020  ! 1920: LDUBA_R	lduba	[%r22, %r0] 0x01, %r30
T2_asi_reg_rd_74:
	mov	0x1f, %r14
	.word 0xfedb8e80  ! 1921: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_wr_75:
	mov	0x0, %r14
	.word 0xf4f38400  ! 1922: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf8c5e116  ! 1929: LDSWA_I	ldswa	[%r23, + 0x0116] %asi, %r28
	.word 0xb01c61f8  ! 1930: XOR_I	xor 	%r17, 0x01f8, %r24
	.word 0xf2054000  ! 1933: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xf2dde17c  ! 1934: LDXA_I	ldxa	[%r23, + 0x017c] %asi, %r25
cpu_intr_2_151:
	setx	0x2e000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf65d0000  ! 1949: LDX_R	ldx	[%r20 + %r0], %r27
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, e)
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_76:
	mov	0x36, %r14
	.word 0xf8f389e0  ! 1955: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb935c000  ! 1956: SRL_R	srl 	%r23, %r0, %r28
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_75:
	mov	0x14, %r14
	.word 0xfcdb8e60  ! 1966: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfc45a0a7  ! 1967: LDSW_I	ldsw	[%r22 + 0x00a7], %r30
	.word 0xf8cc607a  ! 1968: LDSBA_I	ldsba	[%r17, + 0x007a] %asi, %r28
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf214e1f3  ! 1970: LDUH_I	lduh	[%r19 + 0x01f3], %r25
cpu_intr_2_152:
	setx	0x2d002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3de001  ! 1973: SRA_I	sra 	%r23, 0x0001, %r31
	.word 0xf40d2196  ! 1974: LDUB_I	ldub	[%r20 + 0x0196], %r26
cpu_intr_2_153:
	setx	0x2c030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a52183  ! 1978: SUBcc_I	subcc 	%r20, 0x0183, %r25
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb405a090  ! 1981: ADD_I	add 	%r22, 0x0090, %r26
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_154:
	setx	0x2f000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 1)
	ta	T_CHANGE_TO_TL1
	.word 0xbe9c8000  ! 1992: XORcc_R	xorcc 	%r18, %r0, %r31
T2_asi_reg_wr_77:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 1993: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_2_155:
	setx	0x2f0207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_156:
	setx	0x2f0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5cc000  ! 2002: LDX_R	ldx	[%r19 + %r0], %r30
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_wr_78:
	mov	0x0, %r14
	.word 0xf2f389e0  ! 2005: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfed520d6  ! 2008: LDSHA_I	ldsha	[%r20, + 0x00d6] %asi, %r31
	.word 0xb004203d  ! 2009: ADD_I	add 	%r16, 0x003d, %r24
	.word 0xb2840000  ! 2010: ADDcc_R	addcc 	%r16, %r0, %r25
T2_asi_reg_wr_79:
	mov	0xb, %r14
	.word 0xfef38400  ! 2014: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf695c020  ! 2015: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
cpu_intr_2_157:
	setx	0x2f021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_80:
	mov	0x3c4, %r14
	.word 0xfef38400  ! 2019: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_158:
	setx	0x2c031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 5)
	.word 0xfc050000  ! 2023: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xb1357001  ! 2024: SRLX_I	srlx	%r21, 0x0001, %r24
	.word 0xfa55207d  ! 2025: LDSH_I	ldsh	[%r20 + 0x007d], %r29
	ta	T_CHANGE_HPRIV
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_wr_81:
	mov	0x6, %r14
	.word 0xf0f38400  ! 2028: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbd2cd000  ! 2029: SLLX_R	sllx	%r19, %r0, %r30
	.word 0xf0952081  ! 2030: LDUHA_I	lduha	[%r20, + 0x0081] %asi, %r24
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 19)
	.word 0xf655e1da  ! 2034: LDSH_I	ldsh	[%r23 + 0x01da], %r27
	.word 0xf6c4a0c3  ! 2037: LDSWA_I	ldswa	[%r18, + 0x00c3] %asi, %r27
cpu_intr_2_159:
	setx	0x2f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf214c000  ! 2041: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xfc154000  ! 2042: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xfe450000  ! 2043: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0xfed5211a  ! 2049: LDSHA_I	ldsha	[%r20, + 0x011a] %asi, %r31
T2_asi_reg_rd_76:
	mov	0x34, %r14
	.word 0xfadb8400  ! 2050: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf4446067  ! 2051: LDSW_I	ldsw	[%r17 + 0x0067], %r26
	ta	T_CHANGE_TO_TL1
	.word 0xfa8ca026  ! 2053: LDUBA_I	lduba	[%r18, + 0x0026] %asi, %r29
	.word 0xf48c8020  ! 2055: LDUBA_R	lduba	[%r18, %r0] 0x01, %r26
T2_asi_reg_rd_77:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 2056: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf24c61de  ! 2060: LDSB_I	ldsb	[%r17 + 0x01de], %r25
T2_asi_reg_wr_82:
	mov	0x3c3, %r14
	.word 0xf4f38e60  ! 2061: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_160:
	setx	0x2d033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91946053  ! 2065: WRPR_PIL_I	wrpr	%r17, 0x0053, %pil
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_78:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf84ca0e7  ! 2070: LDSB_I	ldsb	[%r18 + 0x00e7], %r28
	.word 0xb37da401  ! 2071: MOVR_I	movre	%r22, 0x1, %r25
	.word 0xb57c2401  ! 2072: MOVR_I	movre	%r16, 0x1, %r26
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_79:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 2077: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf45d8000  ! 2079: LDX_R	ldx	[%r22 + %r0], %r26
	.word 0xf894e171  ! 2081: LDUHA_I	lduha	[%r19, + 0x0171] %asi, %r28
	.word 0xf24ce19f  ! 2082: LDSB_I	ldsb	[%r19 + 0x019f], %r25
T2_asi_reg_rd_80:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 2085: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
cpu_intr_2_161:
	setx	0x2d0305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_162:
	setx	0x2e0105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_163:
	setx	0x2d0136, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_164:
	setx	0x2d000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04c60ef  ! 2098: LDSB_I	ldsb	[%r17 + 0x00ef], %r24
T2_asi_reg_wr_83:
	mov	0x3c1, %r14
	.word 0xf0f38400  ! 2099: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf454a111  ! 2102: LDSH_I	ldsh	[%r18 + 0x0111], %r26
cpu_intr_2_165:
	setx	0x2e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf520000  ! 2105: RDPR_PIL	<illegal instruction>
cpu_intr_2_166:
	setx	0x2e0000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_wr_84:
	mov	0x30, %r14
	.word 0xf4f38e80  ! 2108: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf04d0000  ! 2109: LDSB_R	ldsb	[%r20 + %r0], %r24
T2_asi_reg_rd_81:
	mov	0x34, %r14
	.word 0xfcdb8e60  ! 2113: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf8848020  ! 2116: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r28
cpu_intr_2_167:
	setx	0x2e0109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_168:
	setx	0x2e0300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 12)
	.word 0xfa84209e  ! 2130: LDUWA_I	lduwa	[%r16, + 0x009e] %asi, %r29
cpu_intr_2_169:
	setx	0x2d0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa854020  ! 2136: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r29
	.word 0xb6c44000  ! 2137: ADDCcc_R	addccc 	%r17, %r0, %r27
	.word 0xf80c6105  ! 2138: LDUB_I	ldub	[%r17 + 0x0105], %r28
T2_asi_reg_wr_85:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 2144: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf2d5c020  ! 2149: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r25
cpu_intr_2_170:
	setx	0x2f0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf0556155  ! 2153: LDSH_I	ldsh	[%r21 + 0x0155], %r24
	.word 0xf2454000  ! 2156: LDSW_R	ldsw	[%r21 + %r0], %r25
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_86:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 2160: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_2_171:
	setx	0x2d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x859520e7  ! 2166: WRPR_TSTATE_I	wrpr	%r20, 0x00e7, %tstate
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 4)
	.word 0xf6d48020  ! 2168: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
	.word 0xbabca165  ! 2171: XNORcc_I	xnorcc 	%r18, 0x0165, %r29
	.word 0xfe5cc000  ! 2172: LDX_R	ldx	[%r19 + %r0], %r31
	.word 0xf88c61d4  ! 2173: LDUBA_I	lduba	[%r17, + 0x01d4] %asi, %r28
T2_asi_reg_wr_87:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 2174: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf84ce13e  ! 2175: LDSB_I	ldsb	[%r19 + 0x013e], %r28
T2_asi_reg_wr_88:
	mov	0x30, %r14
	.word 0xfef38e40  ! 2179: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_89:
	mov	0x12, %r14
	.word 0xfaf389e0  ! 2180: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_172:
	setx	0x2d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad44020  ! 2187: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
cpu_intr_2_173:
	setx	0x2f0139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 12)
	.word 0xf8c5e0e0  ! 2202: LDSWA_I	ldswa	[%r23, + 0x00e0] %asi, %r28
	.word 0xfc84c020  ! 2203: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r30
	.word 0xfa454000  ! 2204: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xb4140000  ! 2205: OR_R	or 	%r16, %r0, %r26
cpu_intr_2_174:
	setx	0x2f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_82:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 2211: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 32)
	.word 0xfc550000  ! 2217: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xf4c561a1  ! 2218: LDSWA_I	ldswa	[%r21, + 0x01a1] %asi, %r26
T2_asi_reg_rd_83:
	mov	0x3c7, %r14
	.word 0xfadb8e60  ! 2219: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_wr_90:
	mov	0xa, %r14
	.word 0xf6f38e80  ! 2220: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_175:
	setx	0x2f0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf844c000  ! 2225: LDSW_R	ldsw	[%r19 + %r0], %r28
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, d)
	.word 0xfc5c8000  ! 2230: LDX_R	ldx	[%r18 + %r0], %r30
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 25)
	.word 0xf68c4020  ! 2232: LDUBA_R	lduba	[%r17, %r0] 0x01, %r27
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf455a14c  ! 2236: LDSH_I	ldsh	[%r22 + 0x014c], %r26
	.word 0xf285e09d  ! 2237: LDUWA_I	lduwa	[%r23, + 0x009d] %asi, %r25
	.word 0x8f902001  ! 2238: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_176:
	setx	0x2e0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed4e130  ! 2241: LDSHA_I	ldsha	[%r19, + 0x0130] %asi, %r31
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_84:
	mov	0xb, %r14
	.word 0xfedb8e40  ! 2244: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb62c20d5  ! 2250: ANDN_I	andn 	%r16, 0x00d5, %r27
	.word 0xf44d20c0  ! 2253: LDSB_I	ldsb	[%r20 + 0x00c0], %r26
	.word 0xfe84c020  ! 2260: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r31
	.word 0xfc8d604c  ! 2263: LDUBA_I	lduba	[%r21, + 0x004c] %asi, %r30
	.word 0xf25cc000  ! 2267: LDX_R	ldx	[%r19 + %r0], %r25
	.word 0xf01521cc  ! 2268: LDUH_I	lduh	[%r20 + 0x01cc], %r24
cpu_intr_2_177:
	setx	0x2d0301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 21)
	.word 0xfe55e13a  ! 2272: LDSH_I	ldsh	[%r23 + 0x013a], %r31
	.word 0xfcd520d0  ! 2274: LDSHA_I	ldsha	[%r20, + 0x00d0] %asi, %r30
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_178:
	setx	0x2e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_179:
	setx	0x2f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 2283: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xb40461ff  ! 2286: ADD_I	add 	%r17, 0x01ff, %r26
	.word 0xfed52028  ! 2293: LDSHA_I	ldsha	[%r20, + 0x0028] %asi, %r31
	.word 0xf20c4000  ! 2297: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0xfa55a077  ! 2298: LDSH_I	ldsh	[%r22 + 0x0077], %r29
	.word 0xfe95214e  ! 2302: LDUHA_I	lduha	[%r20, + 0x014e] %asi, %r31
T2_asi_reg_wr_91:
	mov	0xd, %r14
	.word 0xfcf384a0  ! 2305: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf2dce0e9  ! 2307: LDXA_I	ldxa	[%r19, + 0x00e9] %asi, %r25
	.word 0xf6dca055  ! 2308: LDXA_I	ldxa	[%r18, + 0x0055] %asi, %r27
	.word 0xf4956146  ! 2312: LDUHA_I	lduha	[%r21, + 0x0146] %asi, %r26
	.word 0xf8c48020  ! 2314: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r28
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982a92  ! 2320: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a92, %hpstate
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_rd_85:
	mov	0x1e, %r14
	.word 0xfedb8e80  ! 2322: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_wr_92:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 2325: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_2_180:
	setx	0x2c010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb50000  ! 2328: ORNcc_R	orncc 	%r20, %r0, %r31
	.word 0xbca4a146  ! 2334: SUBcc_I	subcc 	%r18, 0x0146, %r30
	.word 0xb93da001  ! 2335: SRA_I	sra 	%r22, 0x0001, %r28
	.word 0xf2158000  ! 2342: LDUH_R	lduh	[%r22 + %r0], %r25
T2_asi_reg_wr_93:
	mov	0x36, %r14
	.word 0xf4f38400  ! 2343: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, b)
	.word 0xf0558000  ! 2350: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xfe04a104  ! 2351: LDUW_I	lduw	[%r18 + 0x0104], %r31
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_181:
	setx	0x33003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c4a0a9  ! 2359: LDSWA_I	ldswa	[%r18, + 0x00a9] %asi, %r24
	.word 0xf68da0db  ! 2360: LDUBA_I	lduba	[%r22, + 0x00db] %asi, %r27
cpu_intr_2_182:
	setx	0x30012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_94:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 2375: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf284e06d  ! 2376: LDUWA_I	lduwa	[%r19, + 0x006d] %asi, %r25
	.word 0xfcd50020  ! 2377: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r30
	.word 0xbebca016  ! 2379: XNORcc_I	xnorcc 	%r18, 0x0016, %r31
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfe554000  ! 2381: LDSH_R	ldsh	[%r21 + %r0], %r31
cpu_intr_2_183:
	setx	0x300323, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_86:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983858  ! 2389: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1858, %hpstate
	.word 0xbb2d1000  ! 2390: SLLX_R	sllx	%r20, %r0, %r29
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_rd_87:
	mov	0x36, %r14
	.word 0xf4db84a0  ! 2393: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf00d0000  ! 2395: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xf05da081  ! 2397: LDX_I	ldx	[%r22 + 0x0081], %r24
	.word 0xfc8c2023  ! 2398: LDUBA_I	lduba	[%r16, + 0x0023] %asi, %r30
T2_asi_reg_wr_95:
	mov	0x1e, %r14
	.word 0xfcf38e40  ! 2399: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfe94e1e1  ! 2400: LDUHA_I	lduha	[%r19, + 0x01e1] %asi, %r31
T2_asi_reg_rd_88:
	mov	0x27, %r14
	.word 0xfadb84a0  ! 2405: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfc8d0020  ! 2406: LDUBA_R	lduba	[%r20, %r0] 0x01, %r30
T2_asi_reg_rd_89:
	mov	0x18, %r14
	.word 0xf2db8e80  ! 2407: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb205e092  ! 2408: ADD_I	add 	%r23, 0x0092, %r25
T2_asi_reg_rd_90:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 2409: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_184:
	setx	0x30030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5cc000  ! 2413: LDX_R	ldx	[%r19 + %r0], %r29
T2_asi_reg_rd_91:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 2415: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb80d4000  ! 2416: AND_R	and 	%r21, %r0, %r28
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 2b)
	.word 0xb88dc000  ! 2420: ANDcc_R	andcc 	%r23, %r0, %r28
T2_asi_reg_wr_96:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 2421: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_wr_97:
	mov	0x5, %r14
	.word 0xfcf38e40  ! 2428: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_92:
	mov	0x1f, %r14
	.word 0xf8db8e60  ! 2431: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	.word 0xf80da1c0  ! 2437: LDUB_I	ldub	[%r22 + 0x01c0], %r28
	.word 0xf4d4a01e  ! 2438: LDSHA_I	ldsha	[%r18, + 0x001e] %asi, %r26
cpu_intr_2_185:
	setx	0x330126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe850000  ! 2440: ADDcc_R	addcc 	%r20, %r0, %r31
	.word 0xf204210a  ! 2446: LDUW_I	lduw	[%r16 + 0x010a], %r25
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983c52  ! 2449: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c52, %hpstate
T2_asi_reg_rd_93:
	mov	0x10, %r14
	.word 0xf4db8400  ! 2451: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_wr_98:
	mov	0x22, %r14
	.word 0xf4f38e60  ! 2452: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf28d0020  ! 2453: LDUBA_R	lduba	[%r20, %r0] 0x01, %r25
	.word 0xfa8d8020  ! 2454: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_186:
	setx	0x300009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_94:
	mov	0x2c, %r14
	.word 0xfedb89e0  ! 2461: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_187:
	setx	0x33003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec5a08a  ! 2465: LDSWA_I	ldswa	[%r22, + 0x008a] %asi, %r31
cpu_intr_2_188:
	setx	0x300121, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_99:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 2471: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfa4cc000  ! 2474: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0xfa0c8000  ! 2475: LDUB_R	ldub	[%r18 + %r0], %r29
T2_asi_reg_rd_95:
	mov	0x35, %r14
	.word 0xf4db8400  ! 2478: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfacd8020  ! 2479: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
	.word 0xf60d8000  ! 2480: LDUB_R	ldub	[%r22 + %r0], %r27
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_189:
	setx	0x300211, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_100:
	mov	0x1c, %r14
	.word 0xf0f38e80  ! 2487: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_rd_96:
	mov	0x2c, %r14
	.word 0xf8db84a0  ! 2489: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf84de023  ! 2490: LDSB_I	ldsb	[%r23 + 0x0023], %r28
cpu_intr_2_190:
	setx	0x310117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41c615f  ! 2495: XOR_I	xor 	%r17, 0x015f, %r26
T2_asi_reg_rd_97:
	mov	0x32, %r14
	.word 0xf4db84a0  ! 2498: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_98:
	mov	0x1c, %r14
	.word 0xf8db8e80  ! 2501: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb8158000  ! 2503: OR_R	or 	%r22, %r0, %r28
	.word 0xfa8c0020  ! 2505: LDUBA_R	lduba	[%r16, %r0] 0x01, %r29
	.word 0xfa0ce19d  ! 2507: LDUB_I	ldub	[%r19 + 0x019d], %r29
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 2b)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_101:
	mov	0x8, %r14
	.word 0xf8f384a0  ! 2513: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf4d4e06c  ! 2515: LDSHA_I	ldsha	[%r19, + 0x006c] %asi, %r26
T2_asi_reg_wr_102:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 2516: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_2_191:
	setx	0x32012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc444000  ! 2522: LDSW_R	ldsw	[%r17 + %r0], %r30
	.word 0xfcc40020  ! 2526: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r30
	.word 0xb9510000  ! 2527: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_99:
	mov	0x37, %r14
	.word 0xf0db8e40  ! 2529: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf6450000  ! 2530: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xfe454000  ! 2533: LDSW_R	ldsw	[%r21 + %r0], %r31
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_100:
	mov	0x2d, %r14
	.word 0xf8db8400  ! 2537: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfa04c000  ! 2538: LDUW_R	lduw	[%r19 + %r0], %r29
	.word 0x83942121  ! 2540: WRPR_TNPC_I	wrpr	%r16, 0x0121, %tnpc
	.word 0xf20c0000  ! 2541: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xfcc58020  ! 2546: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r30
	.word 0xf8448000  ! 2548: LDSW_R	ldsw	[%r18 + %r0], %r28
cpu_intr_2_192:
	setx	0x330219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9c8000  ! 2554: XORcc_R	xorcc 	%r18, %r0, %r29
cpu_intr_2_193:
	setx	0x330213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88d8020  ! 2556: LDUBA_R	lduba	[%r22, %r0] 0x01, %r28
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 16)
	.word 0x8194600a  ! 2561: WRPR_TPC_I	wrpr	%r17, 0x000a, %tpc
	.word 0xf2cc0020  ! 2563: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r25
cpu_intr_2_194:
	setx	0x320102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9c61a3  ! 2566: XORcc_I	xorcc 	%r17, 0x01a3, %r31
T2_asi_reg_rd_101:
	mov	0xc, %r14
	.word 0xfcdb8e80  ! 2567: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_195:
	setx	0x330215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_196:
	setx	0x31030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2944020  ! 2572: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
T2_asi_reg_wr_103:
	mov	0x34, %r14
	.word 0xf4f38e40  ! 2574: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf65c600d  ! 2575: LDX_I	ldx	[%r17 + 0x000d], %r27
	.word 0xb844a09a  ! 2577: ADDC_I	addc 	%r18, 0x009a, %r28
cpu_intr_2_197:
	setx	0x310329, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_104:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 2582: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc5c2085  ! 2588: LDX_I	ldx	[%r16 + 0x0085], %r30
T2_asi_reg_rd_102:
	mov	0x8, %r14
	.word 0xfedb8e40  ! 2593: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 19)
	.word 0xfc5421b3  ! 2598: LDSH_I	ldsh	[%r16 + 0x01b3], %r30
T2_asi_reg_rd_103:
	mov	0x2e, %r14
	.word 0xf2db8e40  ! 2600: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf6150000  ! 2603: LDUH_R	lduh	[%r20 + %r0], %r27
T2_asi_reg_wr_105:
	mov	0x25, %r14
	.word 0xf0f38400  ! 2604: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_rd_104:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_wr_106:
	mov	0x24, %r14
	.word 0xfaf389e0  ! 2609: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf08d8020  ! 2610: LDUBA_R	lduba	[%r22, %r0] 0x01, %r24
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 1d)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f92  ! 2615: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f92, %hpstate
	.word 0xf654601f  ! 2616: LDSH_I	ldsh	[%r17 + 0x001f], %r27
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 3d)
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_198:
	setx	0x330221, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_107:
	mov	0x36, %r14
	.word 0xfcf38400  ! 2622: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_2_199:
	setx	0x330316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 1e)
	.word 0xb2b4c000  ! 2632: SUBCcc_R	orncc 	%r19, %r0, %r25
T2_asi_reg_rd_105:
	mov	0xa, %r14
	.word 0xf4db8e60  ! 2635: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfa5d0000  ! 2636: LDX_R	ldx	[%r20 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982840  ! 2642: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0840, %hpstate
T2_asi_reg_rd_106:
	mov	0x23, %r14
	.word 0xfcdb8e40  ! 2644: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb2b50000  ! 2645: ORNcc_R	orncc 	%r20, %r0, %r25
cpu_intr_2_200:
	setx	0x330220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe04e13c  ! 2649: LDUW_I	lduw	[%r19 + 0x013c], %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_108:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 2652: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_107:
	mov	0xc, %r14
	.word 0xfedb8e60  ! 2653: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 15)
	.word 0xba150000  ! 2657: OR_R	or 	%r20, %r0, %r29
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 2f)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_109:
	mov	0x28, %r14
	.word 0xf2f384a0  ! 2661: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_201:
	setx	0x330314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_202:
	setx	0x32020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 1d)
	.word 0x8f902001  ! 2665: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfc95a10d  ! 2668: LDUHA_I	lduha	[%r22, + 0x010d] %asi, %r30
	.word 0xf4842199  ! 2669: LDUWA_I	lduwa	[%r16, + 0x0199] %asi, %r26
	.word 0xfe94c020  ! 2671: LDUHA_R	lduha	[%r19, %r0] 0x01, %r31
T2_asi_reg_wr_110:
	mov	0x18, %r14
	.word 0xf8f384a0  ! 2673: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf6844020  ! 2674: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r27
	.word 0xf25c4000  ! 2677: LDX_R	ldx	[%r17 + %r0], %r25
cpu_intr_2_203:
	setx	0x300105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8cc020  ! 2682: LDUBA_R	lduba	[%r19, %r0] 0x01, %r29
	.word 0xb49da1cc  ! 2684: XORcc_I	xorcc 	%r22, 0x01cc, %r26
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 22)
	ta	T_CHANGE_TO_TL1
	.word 0xfc0d21ed  ! 2687: LDUB_I	ldub	[%r20 + 0x01ed], %r30
cpu_intr_2_204:
	setx	0x33020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_111:
	mov	0x3c5, %r14
	.word 0xf4f38400  ! 2689: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_wr_112:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 2690: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_NONHPRIV
	.word 0xf88c609e  ! 2693: LDUBA_I	lduba	[%r17, + 0x009e] %asi, %r28
	.word 0xf405e03c  ! 2694: LDUW_I	lduw	[%r23 + 0x003c], %r26
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f42  ! 2699: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f42, %hpstate
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf8c48020  ! 2701: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r28
	.word 0xf65da103  ! 2702: LDX_I	ldx	[%r22 + 0x0103], %r27
T2_asi_reg_rd_108:
	mov	0x14, %r14
	.word 0xfcdb84a0  ! 2707: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf80c6124  ! 2708: LDUB_I	ldub	[%r17 + 0x0124], %r28
cpu_intr_2_205:
	setx	0x330228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 1b)
	.word 0xbeaca08e  ! 2714: ANDNcc_I	andncc 	%r18, 0x008e, %r31
T2_asi_reg_wr_113:
	mov	0x19, %r14
	.word 0xf4f38e40  ! 2717: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 2a)
	.word 0xb02c0000  ! 2723: ANDN_R	andn 	%r16, %r0, %r24
	.word 0xb69d0000  ! 2728: XORcc_R	xorcc 	%r20, %r0, %r27
	.word 0xfcc5a04d  ! 2729: LDSWA_I	ldswa	[%r22, + 0x004d] %asi, %r30
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 26)
	.word 0xb6c50000  ! 2734: ADDCcc_R	addccc 	%r20, %r0, %r27
	.word 0xf685a0a0  ! 2736: LDUWA_I	lduwa	[%r22, + 0x00a0] %asi, %r27
	.word 0xfa958020  ! 2737: LDUHA_R	lduha	[%r22, %r0] 0x01, %r29
	.word 0xf68c8020  ! 2739: LDUBA_R	lduba	[%r18, %r0] 0x01, %r27
T2_asi_reg_wr_114:
	mov	0x25, %r14
	.word 0xf6f38400  ! 2744: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T2_asi_reg_rd_109:
	mov	0x15, %r14
	.word 0xf4db8e40  ! 2747: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_206:
	setx	0x31011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 23)
	.word 0xb73c7001  ! 2756: SRAX_I	srax	%r17, 0x0001, %r27
	ta	T_CHANGE_TO_TL1
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_207:
	setx	0x32020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_110:
	mov	0x3c1, %r14
	.word 0xf4db8400  ! 2768: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf8554000  ! 2770: LDSH_R	ldsh	[%r21 + %r0], %r28
T2_asi_reg_wr_115:
	mov	0x37, %r14
	.word 0xfef38400  ! 2771: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_208:
	setx	0x330210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0cc000  ! 2774: LDUB_R	ldub	[%r19 + %r0], %r31
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 30)
	.word 0xb53c6001  ! 2781: SRA_I	sra 	%r17, 0x0001, %r26
	.word 0xf85c61ab  ! 2782: LDX_I	ldx	[%r17 + 0x01ab], %r28
	.word 0xb17d8400  ! 2787: MOVR_R	movre	%r22, %r0, %r24
	.word 0xfc150000  ! 2789: LDUH_R	lduh	[%r20 + %r0], %r30
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 24)
	.word 0xfed560ec  ! 2792: LDSHA_I	ldsha	[%r21, + 0x00ec] %asi, %r31
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_111:
	mov	0x3c2, %r14
	.word 0xf8db89e0  ! 2802: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xbe2460b8  ! 2806: SUB_I	sub 	%r17, 0x00b8, %r31
cpu_intr_2_209:
	setx	0x360301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12db001  ! 2809: SLLX_I	sllx	%r22, 0x0001, %r24
	ta	T_CHANGE_NONHPRIV
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_210:
	setx	0x340136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5561b8  ! 2822: LDSH_I	ldsh	[%r21 + 0x01b8], %r30
	ta	T_CHANGE_TO_TL1
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 34)
	.word 0xb28cc000  ! 2827: ANDcc_R	andcc 	%r19, %r0, %r25
	.word 0xb42ca1a0  ! 2828: ANDN_I	andn 	%r18, 0x01a0, %r26
cpu_intr_2_211:
	setx	0x34012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_112:
	mov	0x8, %r14
	.word 0xfadb89e0  ! 2830: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_rd_113:
	mov	0x16, %r14
	.word 0xf2db89e0  ! 2831: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_rd_114:
	mov	0x7, %r14
	.word 0xf8db8e40  ! 2833: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfe4d21f7  ! 2835: LDSB_I	ldsb	[%r20 + 0x01f7], %r31
T2_asi_reg_wr_116:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 2840: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_212:
	setx	0x370006, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb8056119  ! 2850: ADD_I	add 	%r21, 0x0119, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf88c8020  ! 2857: LDUBA_R	lduba	[%r18, %r0] 0x01, %r28
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 1d)
	.word 0xb8b40000  ! 2863: ORNcc_R	orncc 	%r16, %r0, %r28
	.word 0xb32d8000  ! 2868: SLL_R	sll 	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_TO_TL0
	.word 0xfcd54020  ! 2872: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbebdc000  ! 2876: XNORcc_R	xnorcc 	%r23, %r0, %r31
	.word 0xf64c0000  ! 2882: LDSB_R	ldsb	[%r16 + %r0], %r27
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 1)
	.word 0xf2940020  ! 2884: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
	.word 0xbaaca178  ! 2888: ANDNcc_I	andncc 	%r18, 0x0178, %r29
	ta	T_CHANGE_TO_TL0
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_117:
	mov	0xb, %r14
	.word 0xf2f38e40  ! 2895: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
cpu_intr_2_213:
	setx	0x37023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c50020  ! 2901: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r25
T2_asi_reg_wr_118:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 2905: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_214:
	setx	0x350133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf254605a  ! 2912: LDSH_I	ldsh	[%r17 + 0x005a], %r25
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
	.word 0x8198295a  ! 2916: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095a, %hpstate
	.word 0xf25cc000  ! 2917: LDX_R	ldx	[%r19 + %r0], %r25
cpu_intr_2_215:
	setx	0x350204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe446124  ! 2919: ADDC_I	addc 	%r17, 0x0124, %r31
cpu_intr_2_216:
	setx	0x340230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf285e11f  ! 2921: LDUWA_I	lduwa	[%r23, + 0x011f] %asi, %r25
cpu_intr_2_217:
	setx	0x34033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_218:
	setx	0x360206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2d6001  ! 2925: SLL_I	sll 	%r21, 0x0001, %r31
	.word 0xf64dc000  ! 2928: LDSB_R	ldsb	[%r23 + %r0], %r27
T2_asi_reg_wr_119:
	mov	0x37, %r14
	.word 0xf8f38e80  ! 2929: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983f58  ! 2931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f58, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 3)
	.word 0xf444e1bd  ! 2938: LDSW_I	ldsw	[%r19 + 0x01bd], %r26
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf605210c  ! 2943: LDUW_I	lduw	[%r20 + 0x010c], %r27
	.word 0xf884619c  ! 2945: LDUWA_I	lduwa	[%r17, + 0x019c] %asi, %r28
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_219:
	setx	0x37030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_220:
	setx	0x34010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_221:
	setx	0x37001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa946003  ! 2963: LDUHA_I	lduha	[%r17, + 0x0003] %asi, %r29
cpu_intr_2_222:
	setx	0x35010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_223:
	setx	0x370118, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_115:
	mov	0xd, %r14
	.word 0xf8db89e0  ! 2968: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_224:
	setx	0x350337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_225:
	setx	0x37031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53c0000  ! 2974: SRA_R	sra 	%r16, %r0, %r26
	.word 0xfc45a190  ! 2975: LDSW_I	ldsw	[%r22 + 0x0190], %r30
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 26)
	.word 0xfa5da006  ! 2981: LDX_I	ldx	[%r22 + 0x0006], %r29
	.word 0xfe842104  ! 2983: LDUWA_I	lduwa	[%r16, + 0x0104] %asi, %r31
cpu_intr_2_226:
	setx	0x36002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2854020  ! 2985: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r25
	.word 0xfc5521b9  ! 2990: LDSH_I	ldsh	[%r20 + 0x01b9], %r30
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_227:
	setx	0x370111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 35)
	.word 0xb23c6101  ! 3000: XNOR_I	xnor 	%r17, 0x0101, %r25
	.word 0xfad4a0fd  ! 3001: LDSHA_I	ldsha	[%r18, + 0x00fd] %asi, %r29
	.word 0xfcc52107  ! 3003: LDSWA_I	ldswa	[%r20, + 0x0107] %asi, %r30
T2_asi_reg_wr_120:
	mov	0x3c8, %r14
	.word 0xf8f38400  ! 3008: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf054e075  ! 3012: LDSH_I	ldsh	[%r19 + 0x0075], %r24
	.word 0xfccd21cf  ! 3015: LDSBA_I	ldsba	[%r20, + 0x01cf] %asi, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb93de001  ! 3020: SRA_I	sra 	%r23, 0x0001, %r28
	.word 0xf6954020  ! 3023: LDUHA_R	lduha	[%r21, %r0] 0x01, %r27
T2_asi_reg_wr_121:
	mov	0x12, %r14
	.word 0xf4f384a0  ! 3025: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_228:
	setx	0x35031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf65d4000  ! 3032: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xfe0c4000  ! 3033: LDUB_R	ldub	[%r17 + %r0], %r31
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 0)
	.word 0xf4548000  ! 3035: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xbf2d6001  ! 3036: SLL_I	sll 	%r21, 0x0001, %r31
T2_asi_reg_rd_116:
	mov	0x12, %r14
	.word 0xf4db8400  ! 3038: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 3b)
	ta	T_CHANGE_HPRIV
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 17)
	.word 0xfe5c0000  ! 3043: LDX_R	ldx	[%r16 + %r0], %r31
T2_asi_reg_rd_117:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_229:
	setx	0x360203, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_118:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 3051: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 23)
	.word 0xf88c210c  ! 3055: LDUBA_I	lduba	[%r16, + 0x010c] %asi, %r28
	.word 0xf8c5c020  ! 3056: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r28
	.word 0xf015e053  ! 3057: LDUH_I	lduh	[%r23 + 0x0053], %r24
	.word 0xfc54600a  ! 3061: LDSH_I	ldsh	[%r17 + 0x000a], %r30
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_230:
	setx	0x350123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe94a091  ! 3069: LDUHA_I	lduha	[%r18, + 0x0091] %asi, %r31
T2_asi_reg_rd_119:
	mov	0x14, %r14
	.word 0xfedb8e40  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf6c5613a  ! 3073: LDSWA_I	ldswa	[%r21, + 0x013a] %asi, %r27
cpu_intr_2_231:
	setx	0x34002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf485e09e  ! 3078: LDUWA_I	lduwa	[%r23, + 0x009e] %asi, %r26
	.word 0xf0454000  ! 3083: LDSW_R	ldsw	[%r21 + %r0], %r24
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_232:
	setx	0x340001, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_120:
	mov	0x34, %r14
	.word 0xfcdb8e40  ! 3088: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfc5c4000  ! 3090: LDX_R	ldx	[%r17 + %r0], %r30
	.word 0xfc8ca0a2  ! 3092: LDUBA_I	lduba	[%r18, + 0x00a2] %asi, %r30
	.word 0xf2cc60f3  ! 3093: LDSBA_I	ldsba	[%r17, + 0x00f3] %asi, %r25
	.word 0xf055a0df  ! 3094: LDSH_I	ldsh	[%r22 + 0x00df], %r24
T2_asi_reg_wr_122:
	mov	0x2b, %r14
	.word 0xf2f38e60  ! 3096: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_233:
	setx	0x34021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb294a1c0  ! 3101: ORcc_I	orcc 	%r18, 0x01c0, %r25
	.word 0xb6950000  ! 3102: ORcc_R	orcc 	%r20, %r0, %r27
	.word 0xba94e01b  ! 3103: ORcc_I	orcc 	%r19, 0x001b, %r29
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983d90  ! 3104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d90, %hpstate
	.word 0xf8454000  ! 3105: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xf64c616f  ! 3106: LDSB_I	ldsb	[%r17 + 0x016f], %r27
T2_asi_reg_rd_121:
	mov	0x3c4, %r14
	.word 0xfadb8e60  ! 3107: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfcc4c020  ! 3110: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r30
cpu_intr_2_234:
	setx	0x340020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0940000  ! 3112: ORcc_R	orcc 	%r16, %r0, %r24
cpu_intr_2_235:
	setx	0x370303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb004c000  ! 3116: ADD_R	add 	%r19, %r0, %r24
	.word 0xb444213e  ! 3117: ADDC_I	addc 	%r16, 0x013e, %r26
cpu_intr_2_236:
	setx	0x34012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_122:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 3124: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb03de1fd  ! 3125: XNOR_I	xnor 	%r23, 0x01fd, %r24
T2_asi_reg_wr_123:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 3126: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfc0560fc  ! 3127: LDUW_I	lduw	[%r21 + 0x00fc], %r30
	.word 0xf08c60bb  ! 3128: LDUBA_I	lduba	[%r17, + 0x00bb] %asi, %r24
cpu_intr_2_237:
	setx	0x350318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 2)
	.word 0xfed48020  ! 3134: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r31
T2_asi_reg_rd_123:
	mov	0x7, %r14
	.word 0xf4db84a0  ! 3135: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfacd215b  ! 3137: LDSBA_I	ldsba	[%r20, + 0x015b] %asi, %r29
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 38)
	.word 0xf05ce0e2  ! 3140: LDX_I	ldx	[%r19 + 0x00e2], %r24
	.word 0xf654e168  ! 3142: LDSH_I	ldsh	[%r19 + 0x0168], %r27
	.word 0xf454c000  ! 3146: LDSH_R	ldsh	[%r19 + %r0], %r26
T2_asi_reg_rd_124:
	mov	0x18, %r14
	.word 0xfadb8e40  ! 3150: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_238:
	setx	0x350315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dd21e3  ! 3152: LDXA_I	ldxa	[%r20, + 0x01e3] %asi, %r28
	.word 0xfe050000  ! 3154: LDUW_R	lduw	[%r20 + %r0], %r31
	.word 0xfe0421d7  ! 3155: LDUW_I	lduw	[%r16 + 0x01d7], %r31
T2_asi_reg_wr_124:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 3157: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_125:
	mov	0x2e, %r14
	.word 0xfef38e40  ! 3159: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_125:
	mov	0x3c1, %r14
	.word 0xfcdb8400  ! 3160: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf48c4020  ! 3161: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
	.word 0xf80520c7  ! 3162: LDUW_I	lduw	[%r20 + 0x00c7], %r28
	.word 0xfc458000  ! 3164: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xfc958020  ! 3165: LDUHA_R	lduha	[%r22, %r0] 0x01, %r30
	.word 0xfcdc61e6  ! 3167: LDXA_I	ldxa	[%r17, + 0x01e6] %asi, %r30
	.word 0xf2cda1ad  ! 3168: LDSBA_I	ldsba	[%r22, + 0x01ad] %asi, %r25
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 3d)
	.word 0x8f902002  ! 3170: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xbcace00d  ! 3171: ANDNcc_I	andncc 	%r19, 0x000d, %r30
	.word 0xf244e0e0  ! 3172: LDSW_I	ldsw	[%r19 + 0x00e0], %r25
	.word 0xfe44615f  ! 3173: LDSW_I	ldsw	[%r17 + 0x015f], %r31
cpu_intr_2_239:
	setx	0x37030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_240:
	setx	0x360235, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_126:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 3184: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf6d50020  ! 3185: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r27
	.word 0xba446148  ! 3186: ADDC_I	addc 	%r17, 0x0148, %r29
	.word 0xf05c6138  ! 3188: LDX_I	ldx	[%r17 + 0x0138], %r24
T2_asi_reg_wr_126:
	mov	0x35, %r14
	.word 0xf4f38e80  ! 3190: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbd520000  ! 3191: RDPR_PIL	<illegal instruction>
cpu_intr_2_241:
	setx	0x34011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_127:
	mov	0x21, %r14
	.word 0xf2f389e0  ! 3203: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_rd_127:
	mov	0x11, %r14
	.word 0xf0db84a0  ! 3205: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb6b50000  ! 3211: SUBCcc_R	orncc 	%r20, %r0, %r27
	.word 0xfe8d4020  ! 3212: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
cpu_intr_2_242:
	setx	0x37031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6850020  ! 3218: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r27
cpu_intr_2_243:
	setx	0x350007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_244:
	setx	0x370138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4c8000  ! 3224: LDSB_R	ldsb	[%r18 + %r0], %r31
T2_asi_reg_wr_128:
	mov	0x3c0, %r14
	.word 0xf8f384a0  ! 3225: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T2_asi_reg_rd_128:
	mov	0x2d, %r14
	.word 0xf8db8e60  ! 3226: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf04ce1cb  ! 3229: LDSB_I	ldsb	[%r19 + 0x01cb], %r24
	.word 0xfc842109  ! 3231: LDUWA_I	lduwa	[%r16, + 0x0109] %asi, %r30
	.word 0xfa44c000  ! 3235: LDSW_R	ldsw	[%r19 + %r0], %r29
T2_asi_reg_wr_129:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 3239: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf4454000  ! 3241: LDSW_R	ldsw	[%r21 + %r0], %r26
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983ec8  ! 3242: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec8, %hpstate
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_wr_130:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 3245: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_245:
	setx	0x3a0036, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_131:
	mov	0x22, %r14
	.word 0xf6f38400  ! 3247: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 15)
	.word 0xb92cf001  ! 3249: SLLX_I	sllx	%r19, 0x0001, %r28
cpu_intr_2_246:
	setx	0x380123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_247:
	setx	0x3b0331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_129:
	mov	0x0, %r14
	.word 0xfcdb8e40  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf4dd60ac  ! 3258: LDXA_I	ldxa	[%r21, + 0x00ac] %asi, %r26
	.word 0xf65c8000  ! 3259: LDX_R	ldx	[%r18 + %r0], %r27
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 1)
	.word 0xbaad4000  ! 3263: ANDNcc_R	andncc 	%r21, %r0, %r29
	.word 0xbe9d60cb  ! 3264: XORcc_I	xorcc 	%r21, 0x00cb, %r31
cpu_intr_2_248:
	setx	0x3b023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_249:
	setx	0x38030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_130:
	mov	0x3c5, %r14
	.word 0xf4db84a0  ! 3274: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_250:
	setx	0x3a0019, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_131:
	mov	0x34, %r14
	.word 0xf6db8e40  ! 3277: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL1
cpu_intr_2_251:
	setx	0x3b0318, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_132:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 3281: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf8452163  ! 3282: LDSW_I	ldsw	[%r20 + 0x0163], %r28
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_133:
	mov	0x4, %r14
	.word 0xfaf38e60  ! 3286: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_rd_132:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 3287: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_2_252:
	setx	0x3b033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8c21b7  ! 3293: LDUBA_I	lduba	[%r16, + 0x01b7] %asi, %r30
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfec5a0c6  ! 3297: LDSWA_I	ldswa	[%r22, + 0x00c6] %asi, %r31
	.word 0xb1500000  ! 3298: RDPR_TPC	<illegal instruction>
	.word 0xf85c0000  ! 3299: LDX_R	ldx	[%r16 + %r0], %r28
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 35)
	.word 0xf88c2028  ! 3305: LDUBA_I	lduba	[%r16, + 0x0028] %asi, %r28
T2_asi_reg_rd_133:
	mov	0x2, %r14
	.word 0xf2db8e80  ! 3307: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 6)
	.word 0xfc5d60b4  ! 3320: LDX_I	ldx	[%r21 + 0x00b4], %r30
	.word 0xf40c8000  ! 3322: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xbb518000  ! 3323: RDPR_PSTATE	<illegal instruction>
	.word 0xf44d4000  ! 3324: LDSB_R	ldsb	[%r21 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_134:
	mov	0x3, %r14
	.word 0xf8f389e0  ! 3328: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 38)
	.word 0xb4ace133  ! 3330: ANDNcc_I	andncc 	%r19, 0x0133, %r26
	.word 0xfe94e1f3  ! 3338: LDUHA_I	lduha	[%r19, + 0x01f3] %asi, %r31
	.word 0xb22d205a  ! 3339: ANDN_I	andn 	%r20, 0x005a, %r25
	.word 0xf0144000  ! 3342: LDUH_R	lduh	[%r17 + %r0], %r24
cpu_intr_2_253:
	setx	0x39021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81c4000  ! 3345: XOR_R	xor 	%r17, %r0, %r28
	.word 0xf415a0b7  ! 3348: LDUH_I	lduh	[%r22 + 0x00b7], %r26
T2_asi_reg_wr_135:
	mov	0x2a, %r14
	.word 0xfef384a0  ! 3351: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_254:
	setx	0x390300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_255:
	setx	0x3b000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24d2183  ! 3356: LDSB_I	ldsb	[%r20 + 0x0183], %r25
	.word 0xfc8dc020  ! 3357: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
	.word 0xfcdca157  ! 3358: LDXA_I	ldxa	[%r18, + 0x0157] %asi, %r30
	.word 0xb150c000  ! 3359: RDPR_TT	<illegal instruction>
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 34)
	.word 0xfc95a07d  ! 3361: LDUHA_I	lduha	[%r22, + 0x007d] %asi, %r30
cpu_intr_2_256:
	setx	0x390031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa15e0c5  ! 3366: LDUH_I	lduh	[%r23 + 0x00c5], %r29
	.word 0xf84da058  ! 3367: LDSB_I	ldsb	[%r22 + 0x0058], %r28
	.word 0xf2c48020  ! 3369: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r25
	.word 0xfec4e0a0  ! 3370: LDSWA_I	ldswa	[%r19, + 0x00a0] %asi, %r31
	ta	T_CHANGE_HPRIV
	.word 0xf45d60dd  ! 3372: LDX_I	ldx	[%r21 + 0x00dd], %r26
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_257:
	setx	0x3b0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bcc000  ! 3377: XNORcc_R	xnorcc 	%r19, %r0, %r28
	.word 0xbeb460a7  ! 3379: SUBCcc_I	orncc 	%r17, 0x00a7, %r31
	.word 0xf2dd2110  ! 3381: LDXA_I	ldxa	[%r20, + 0x0110] %asi, %r25
T2_asi_reg_rd_134:
	mov	0x2d, %r14
	.word 0xf6db8e40  ! 3384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc044000  ! 3385: LDUW_R	lduw	[%r17 + %r0], %r30
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_258:
	setx	0x39021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_135:
	mov	0x31, %r14
	.word 0xf2db84a0  ! 3398: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_259:
	setx	0x390310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89ca0ab  ! 3400: XORcc_I	xorcc 	%r18, 0x00ab, %r28
	.word 0xb5520000  ! 3403: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982b88  ! 3413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b88, %hpstate
cpu_intr_2_260:
	setx	0x390335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_261:
	setx	0x39023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cdc020  ! 3417: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r26
cpu_intr_2_262:
	setx	0x390323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_263:
	setx	0x3b0135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_264:
	setx	0x380221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4146008  ! 3432: LDUH_I	lduh	[%r17 + 0x0008], %r26
	.word 0xfed4a022  ! 3434: LDSHA_I	ldsha	[%r18, + 0x0022] %asi, %r31
cpu_intr_2_265:
	setx	0x3b0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacd0020  ! 3439: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
cpu_intr_2_266:
	setx	0x38003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_267:
	setx	0x3a0103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_268:
	setx	0x3a0122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, e)
	.word 0xfa0d0000  ! 3448: LDUB_R	ldub	[%r20 + %r0], %r29
	.word 0xbc2d0000  ! 3452: ANDN_R	andn 	%r20, %r0, %r30
cpu_intr_2_269:
	setx	0x380210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2140000  ! 3454: LDUH_R	lduh	[%r16 + %r0], %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xfe95a1af  ! 3456: LDUHA_I	lduha	[%r22, + 0x01af] %asi, %r31
	.word 0xf0542185  ! 3460: LDSH_I	ldsh	[%r16 + 0x0185], %r24
cpu_intr_2_270:
	setx	0x3a030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4848020  ! 3467: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r26
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982c8a  ! 3475: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8a, %hpstate
cpu_intr_2_271:
	setx	0x390006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2842064  ! 3480: ADDcc_I	addcc 	%r16, 0x0064, %r25
T2_asi_reg_rd_136:
	mov	0x35, %r14
	.word 0xf4db8e80  ! 3483: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf65d21e8  ! 3485: LDX_I	ldx	[%r20 + 0x01e8], %r27
	.word 0xf6852031  ! 3486: LDUWA_I	lduwa	[%r20, + 0x0031] %asi, %r27
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 9)
	.word 0xf844e16d  ! 3488: LDSW_I	ldsw	[%r19 + 0x016d], %r28
cpu_intr_2_272:
	setx	0x3b021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_137:
	mov	0x2f, %r14
	.word 0xf0db8e40  ! 3492: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xf6152095  ! 3496: LDUH_I	lduh	[%r20 + 0x0095], %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xfc0c0000  ! 3499: LDUB_R	ldub	[%r16 + %r0], %r30
T2_asi_reg_wr_136:
	mov	0x8, %r14
	.word 0xf0f384a0  ! 3501: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfc440000  ! 3502: LDSW_R	ldsw	[%r16 + %r0], %r30
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_273:
	setx	0x3a0328, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_137:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 3516: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_274:
	setx	0x39001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6458000  ! 3525: LDSW_R	ldsw	[%r22 + %r0], %r27
T2_asi_reg_wr_138:
	mov	0x1a, %r14
	.word 0xfaf389e0  ! 3529: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_275:
	setx	0x380131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dde0d9  ! 3534: LDXA_I	ldxa	[%r23, + 0x00d9] %asi, %r28
cpu_intr_2_276:
	setx	0x3b0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0154000  ! 3537: LDUH_R	lduh	[%r21 + %r0], %r24
T2_asi_reg_rd_138:
	mov	0x6, %r14
	.word 0xf6db8400  ! 3538: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbe244000  ! 3542: SUB_R	sub 	%r17, %r0, %r31
cpu_intr_2_277:
	setx	0x380000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 16)
	.word 0xf4850020  ! 3547: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r26
	.word 0xf64ca068  ! 3549: LDSB_I	ldsb	[%r18 + 0x0068], %r27
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf05cc000  ! 3554: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xbe04e0e0  ! 3555: ADD_I	add 	%r19, 0x00e0, %r31
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_rd_139:
	mov	0x28, %r14
	.word 0xf2db8400  ! 3558: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf2d54020  ! 3560: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r25
	.word 0xba954000  ! 3567: ORcc_R	orcc 	%r21, %r0, %r29
T2_asi_reg_rd_140:
	mov	0x2b, %r14
	.word 0xf0db8e60  ! 3570: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfed4a03e  ! 3571: LDSHA_I	ldsha	[%r18, + 0x003e] %asi, %r31
cpu_intr_2_278:
	setx	0x3a0213, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_139:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 3575: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf4542159  ! 3577: LDSH_I	ldsh	[%r16 + 0x0159], %r26
T2_asi_reg_rd_141:
	mov	0x22, %r14
	.word 0xf2db8e40  ! 3578: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf6558000  ! 3579: LDSH_R	ldsh	[%r22 + %r0], %r27
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 32)
	.word 0xf68d613b  ! 3584: LDUBA_I	lduba	[%r21, + 0x013b] %asi, %r27
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982cd8  ! 3587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd8, %hpstate
	.word 0xf2846014  ! 3588: LDUWA_I	lduwa	[%r17, + 0x0014] %asi, %r25
	.word 0xfcd5613d  ! 3589: LDSHA_I	ldsha	[%r21, + 0x013d] %asi, %r30
cpu_intr_2_279:
	setx	0x3a002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_280:
	setx	0x39021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa858020  ! 3593: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r29
cpu_intr_2_281:
	setx	0x3a0202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_282:
	setx	0x390024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 1e)
	.word 0x9194201f  ! 3599: WRPR_PIL_I	wrpr	%r16, 0x001f, %pil
	.word 0xb0840000  ! 3600: ADDcc_R	addcc 	%r16, %r0, %r24
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_283:
	setx	0x3a0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_142:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 18)
	.word 0xfc84e19f  ! 3617: LDUWA_I	lduwa	[%r19, + 0x019f] %asi, %r30
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_284:
	setx	0x3a0212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_wr_140:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 3625: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T2_asi_reg_rd_143:
	mov	0x3c0, %r14
	.word 0xf4db8400  ! 3627: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_285:
	setx	0x380333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cc0020  ! 3631: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
	.word 0xfe544000  ! 3633: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xfe9461c2  ! 3635: LDUHA_I	lduha	[%r17, + 0x01c2] %asi, %r31
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983fc8  ! 3636: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc8, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_141:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 3644: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbd643801  ! 3649: MOVcc_I	<illegal instruction>
	.word 0xfe154000  ! 3651: LDUH_R	lduh	[%r21 + %r0], %r31
cpu_intr_2_286:
	setx	0x3b023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29520db  ! 3655: ORcc_I	orcc 	%r20, 0x00db, %r25
T2_asi_reg_wr_142:
	mov	0x36, %r14
	.word 0xfaf38400  ! 3656: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_rd_144:
	mov	0xe, %r14
	.word 0xf0db8e60  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfccc0020  ! 3658: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
	ta	T_CHANGE_TO_TL1
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b50  ! 3660: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b50, %hpstate
cpu_intr_2_287:
	setx	0x3a030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2250000  ! 3662: SUB_R	sub 	%r20, %r0, %r25
T2_asi_reg_wr_143:
	mov	0xb, %r14
	.word 0xf4f384a0  ! 3663: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb12c0000  ! 3670: SLL_R	sll 	%r16, %r0, %r24
T2_asi_reg_rd_145:
	mov	0x9, %r14
	.word 0xfedb8e40  ! 3672: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_288:
	setx	0x3b010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d80  ! 3675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d80, %hpstate
	.word 0xf85560c3  ! 3676: LDSH_I	ldsh	[%r21 + 0x00c3], %r28
	.word 0xb734c000  ! 3678: SRL_R	srl 	%r19, %r0, %r27
cpu_intr_2_289:
	setx	0x3a031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 22)
	.word 0xf2cc4020  ! 3683: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r25
cpu_intr_2_290:
	setx	0x390134, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_146:
	mov	0x25, %r14
	.word 0xf6db84a0  ! 3697: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_rd_147:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 3705: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf65c21af  ! 3708: LDX_I	ldx	[%r16 + 0x01af], %r27
cpu_intr_2_291:
	setx	0x3a022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48ca056  ! 3710: LDUBA_I	lduba	[%r18, + 0x0056] %asi, %r26
	.word 0xf2cd0020  ! 3711: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r25
cpu_intr_2_292:
	setx	0x3a0101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_293:
	setx	0x390000, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_144:
	mov	0x22, %r14
	.word 0xf2f38400  ! 3717: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfacd61a3  ! 3719: LDSBA_I	ldsba	[%r21, + 0x01a3] %asi, %r29
	.word 0xfc4d8000  ! 3720: LDSB_R	ldsb	[%r22 + %r0], %r30
cpu_intr_2_294:
	setx	0x3f0133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_295:
	setx	0x3f011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacd0020  ! 3726: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
	.word 0xf4dda014  ! 3727: LDXA_I	ldxa	[%r22, + 0x0014] %asi, %r26
	.word 0xbd7d0400  ! 3728: MOVR_R	movre	%r20, %r0, %r30
	.word 0xf2c44020  ! 3732: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r25
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_296:
	setx	0x3e011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf495c020  ! 3741: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
T2_asi_reg_wr_145:
	mov	0x13, %r14
	.word 0xf0f38e40  ! 3744: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_rd_148:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 3746: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 18)
	.word 0xfc048000  ! 3750: LDUW_R	lduw	[%r18 + %r0], %r30
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_rd_149:
	mov	0x38, %r14
	.word 0xf4db8e80  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfc5ce19e  ! 3757: LDX_I	ldx	[%r19 + 0x019e], %r30
	.word 0xf6844020  ! 3758: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r27
	.word 0xb8a420c3  ! 3764: SUBcc_I	subcc 	%r16, 0x00c3, %r28
	.word 0xfa042124  ! 3765: LDUW_I	lduw	[%r16 + 0x0124], %r29
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 18)
	.word 0xfed421d8  ! 3771: LDSHA_I	ldsha	[%r16, + 0x01d8] %asi, %r31
	.word 0xfc846142  ! 3772: LDUWA_I	lduwa	[%r17, + 0x0142] %asi, %r30
cpu_intr_2_297:
	setx	0x3c020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_150:
	mov	0x16, %r14
	.word 0xf4db8e80  ! 3775: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfac44020  ! 3776: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r29
cpu_intr_2_298:
	setx	0x3e032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8d4000  ! 3782: ANDcc_R	andcc 	%r21, %r0, %r29
T2_asi_reg_rd_151:
	mov	0x19, %r14
	.word 0xf0db8e80  ! 3783: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf4dc2003  ! 3784: LDXA_I	ldxa	[%r16, + 0x0003] %asi, %r26
cpu_intr_2_299:
	setx	0x3d0200, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_146:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 3789: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_rd_152:
	mov	0x2b, %r14
	.word 0xfedb8e80  ! 3792: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_rd_153:
	mov	0x2c, %r14
	.word 0xf4db8e40  ! 3793: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb2240000  ! 3794: SUB_R	sub 	%r16, %r0, %r25
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_300:
	setx	0x3f0020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf45ce195  ! 3806: LDX_I	ldx	[%r19 + 0x0195], %r26
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, b)
	.word 0xf4948020  ! 3810: LDUHA_R	lduha	[%r18, %r0] 0x01, %r26
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_rd_154:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 3815: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf64d6155  ! 3818: LDSB_I	ldsb	[%r21 + 0x0155], %r27
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 20)
	.word 0xf0d4a134  ! 3824: LDSHA_I	ldsha	[%r18, + 0x0134] %asi, %r24
T2_asi_reg_rd_155:
	mov	0x6, %r14
	.word 0xf4db8400  ! 3825: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_wr_147:
	mov	0x1f, %r14
	.word 0xf4f38e80  ! 3826: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
	.word 0xfa4d0000  ! 3830: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xf4d46054  ! 3831: LDSHA_I	ldsha	[%r17, + 0x0054] %asi, %r26
	.word 0xf24d2026  ! 3833: LDSB_I	ldsb	[%r20 + 0x0026], %r25
	.word 0xf8150000  ! 3834: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xfa9560da  ! 3837: LDUHA_I	lduha	[%r21, + 0x00da] %asi, %r29
cpu_intr_2_301:
	setx	0x3f023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb844c000  ! 3840: ADDC_R	addc 	%r19, %r0, %r28
	.word 0xf8dda1ca  ! 3841: LDXA_I	ldxa	[%r22, + 0x01ca] %asi, %r28
	.word 0xf0842067  ! 3843: LDUWA_I	lduwa	[%r16, + 0x0067] %asi, %r24
cpu_intr_2_302:
	setx	0x3c0002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_303:
	setx	0x3e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_148:
	mov	0x20, %r14
	.word 0xfef38e40  ! 3850: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_149:
	mov	0x32, %r14
	.word 0xfcf38e80  ! 3853: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_150:
	mov	0x0, %r14
	.word 0xfaf38e40  ! 3857: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_304:
	setx	0x3f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 5)
	.word 0xf65520a0  ! 3861: LDSH_I	ldsh	[%r20 + 0x00a0], %r27
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_305:
	setx	0x3e003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 7)
	.word 0xfc5c4000  ! 3865: LDX_R	ldx	[%r17 + %r0], %r30
	.word 0xfc8c4020  ! 3870: LDUBA_R	lduba	[%r17, %r0] 0x01, %r30
	.word 0xf24c0000  ! 3872: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xfad4c020  ! 3874: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r29
T2_asi_reg_wr_151:
	mov	0x2e, %r14
	.word 0xf8f38e40  ! 3875: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_306:
	setx	0x3e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 14)
	.word 0xf454a033  ! 3883: LDSH_I	ldsh	[%r18 + 0x0033], %r26
T2_asi_reg_wr_152:
	mov	0x1, %r14
	.word 0xf2f384a0  ! 3885: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, f)
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf2dca1c7  ! 3890: LDXA_I	ldxa	[%r18, + 0x01c7] %asi, %r25
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, b)
	.word 0xf8850020  ! 3892: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
	.word 0xfe542021  ! 3893: LDSH_I	ldsh	[%r16 + 0x0021], %r31
T2_asi_reg_rd_156:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 3898: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_307:
	setx	0x3e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_rd_157:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 3905: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_rd_158:
	mov	0x12, %r14
	.word 0xf4db8e60  ! 3907: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfec4a0d8  ! 3911: LDSWA_I	ldswa	[%r18, + 0x00d8] %asi, %r31
	.word 0xfcdd218d  ! 3913: LDXA_I	ldxa	[%r20, + 0x018d] %asi, %r30
T2_asi_reg_rd_159:
	mov	0x17, %r14
	.word 0xf6db8e60  ! 3918: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_308:
	setx	0x3e0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed421c4  ! 3921: LDSHA_I	ldsha	[%r16, + 0x01c4] %asi, %r31
	.word 0xb0ac8000  ! 3923: ANDNcc_R	andncc 	%r18, %r0, %r24
	.word 0xb9348000  ! 3927: SRL_R	srl 	%r18, %r0, %r28
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 11)
	.word 0xf25d0000  ! 3932: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xbca461de  ! 3933: SUBcc_I	subcc 	%r17, 0x01de, %r30
T2_asi_reg_rd_160:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 3934: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf885c020  ! 3939: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r28
cpu_intr_2_309:
	setx	0x3d0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_161:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 3942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_162:
	mov	0x8, %r14
	.word 0xf2db8e40  ! 3945: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_163:
	mov	0x34, %r14
	.word 0xfadb8e40  ! 3949: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf60c8000  ! 3953: LDUB_R	ldub	[%r18 + %r0], %r27
	.word 0xfe044000  ! 3955: LDUW_R	lduw	[%r17 + %r0], %r31
cpu_intr_2_310:
	setx	0x3d0305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_311:
	setx	0x3e0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6448000  ! 3959: LDSW_R	ldsw	[%r18 + %r0], %r27
cpu_intr_2_312:
	setx	0x3f0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2954020  ! 3963: LDUHA_R	lduha	[%r21, %r0] 0x01, %r25
	.word 0xb4844000  ! 3964: ADDcc_R	addcc 	%r17, %r0, %r26
T2_asi_reg_rd_164:
	mov	0x8, %r14
	.word 0xfadb89e0  ! 3965: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_rd_165:
	mov	0x2, %r14
	.word 0xf4db8e60  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_313:
	setx	0x3e0121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 6)
	.word 0xf005e1fb  ! 3972: LDUW_I	lduw	[%r23 + 0x01fb], %r24
	.word 0xfa952168  ! 3978: LDUHA_I	lduha	[%r20, + 0x0168] %asi, %r29
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_166:
	mov	0x36, %r14
	.word 0xf8db8e40  ! 3981: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf45c210f  ! 3982: LDX_I	ldx	[%r16 + 0x010f], %r26
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf844e1ff  ! 3997: LDSW_I	ldsw	[%r19 + 0x01ff], %r28
T2_asi_reg_rd_167:
	mov	0x3c5, %r14
	.word 0xfadb8400  ! 3998: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_2_314:
	setx	0x3d001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4c4000  ! 4002: LDSB_R	ldsb	[%r17 + %r0], %r31
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_315:
	setx	0x3c0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc446039  ! 4005: LDSW_I	ldsw	[%r17 + 0x0039], %r30
	.word 0xf014601a  ! 4006: LDUH_I	lduh	[%r17 + 0x001a], %r24
	ta	T_CHANGE_HPRIV
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 34)
	ta	T_CHANGE_TO_TL1
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_316:
	setx	0x3d0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0458000  ! 4023: LDSW_R	ldsw	[%r22 + %r0], %r24
cpu_intr_2_317:
	setx	0x3c0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8958020  ! 4026: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 15)
	.word 0xf6150000  ! 4028: LDUH_R	lduh	[%r20 + %r0], %r27
T2_asi_reg_rd_168:
	mov	0x13, %r14
	.word 0xf0db8e60  ! 4032: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_318:
	setx	0x3c0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4140000  ! 4034: LDUH_R	lduh	[%r16 + %r0], %r26
cpu_intr_2_319:
	setx	0x3d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa95c020  ! 4041: LDUHA_R	lduha	[%r23, %r0] 0x01, %r29
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 8)
	.word 0xbd510000  ! 4051: RDPR_TICK	<illegal instruction>
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 1)
	.word 0xfa4ce1e4  ! 4054: LDSB_I	ldsb	[%r19 + 0x01e4], %r29
	.word 0xf055e0f0  ! 4055: LDSH_I	ldsh	[%r23 + 0x00f0], %r24
	.word 0xf00d216f  ! 4057: LDUB_I	ldub	[%r20 + 0x016f], %r24
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 5)
	.word 0xf45d8000  ! 4063: LDX_R	ldx	[%r22 + %r0], %r26
cpu_intr_2_320:
	setx	0x3e0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfadd605d  ! 4067: LDXA_I	ldxa	[%r21, + 0x005d] %asi, %r29
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_169:
	mov	0x29, %r14
	.word 0xfcdb84a0  ! 4069: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbc354000  ! 4071: SUBC_R	orn 	%r21, %r0, %r30
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf2c50020  ! 4074: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r25
	.word 0xfe556181  ! 4075: LDSH_I	ldsh	[%r21 + 0x0181], %r31
	.word 0xf40dc000  ! 4079: LDUB_R	ldub	[%r23 + %r0], %r26
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 1e)
	.word 0xbd3c7001  ! 4087: SRAX_I	srax	%r17, 0x0001, %r30
	.word 0xb0ad4000  ! 4091: ANDNcc_R	andncc 	%r21, %r0, %r24
	.word 0xfa144000  ! 4093: LDUH_R	lduh	[%r17 + %r0], %r29
cpu_intr_2_321:
	setx	0x3e0126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, a)
	.word 0xf0dc2024  ! 4101: LDXA_I	ldxa	[%r16, + 0x0024] %asi, %r24
T2_asi_reg_wr_153:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 4103: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf2950020  ! 4105: LDUHA_R	lduha	[%r20, %r0] 0x01, %r25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_322:
	setx	0x3e0219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_323:
	setx	0x3c0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa554000  ! 4115: LDSH_R	ldsh	[%r21 + %r0], %r29
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf8856194  ! 4122: LDUWA_I	lduwa	[%r21, + 0x0194] %asi, %r28
T2_asi_reg_wr_154:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 4124: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T2_asi_reg_wr_155:
	mov	0x6, %r14
	.word 0xfef38e60  ! 4125: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb48ca172  ! 4127: ANDcc_I	andcc 	%r18, 0x0172, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4548000  ! 4130: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xb1351000  ! 4131: SRLX_R	srlx	%r20, %r0, %r24
	.word 0xfa040000  ! 4136: LDUW_R	lduw	[%r16 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_324:
	setx	0x3d0310, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_156:
	mov	0x11, %r14
	.word 0xf2f38e40  ! 4142: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_325:
	setx	0x3d0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf844e12f  ! 4144: LDSW_I	ldsw	[%r19 + 0x012f], %r28
	ta	T_CHANGE_TO_TL1
	.word 0xf85ca17b  ! 4146: LDX_I	ldx	[%r18 + 0x017b], %r28
	.word 0xba144000  ! 4147: OR_R	or 	%r17, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_170:
	mov	0x18, %r14
	.word 0xf6db84a0  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_2_326:
	setx	0x3f0117, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_157:
	mov	0x3c6, %r14
	.word 0xfef38e80  ! 4157: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf2d4211f  ! 4158: LDSHA_I	ldsha	[%r16, + 0x011f] %asi, %r25
	.word 0xbb3cd000  ! 4160: SRAX_R	srax	%r19, %r0, %r29
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 31)
	.word 0xf4d52160  ! 4168: LDSHA_I	ldsha	[%r20, + 0x0160] %asi, %r26
	.word 0xf24d0000  ! 4169: LDSB_R	ldsb	[%r20 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0xfac5a1db  ! 4171: LDSWA_I	ldswa	[%r22, + 0x01db] %asi, %r29
	.word 0xf8458000  ! 4173: LDSW_R	ldsw	[%r22 + %r0], %r28
T2_asi_reg_rd_171:
	mov	0x8, %r14
	.word 0xfcdb8e40  ! 4175: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_158:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 4176: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_159:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 4178: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_172:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 4179: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 5)
	.word 0xfe144000  ! 4187: LDUH_R	lduh	[%r17 + %r0], %r31
T2_asi_reg_wr_160:
	mov	0xf, %r14
	.word 0xfef384a0  ! 4197: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfc154000  ! 4198: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xb5520000  ! 4199: RDPR_PIL	<illegal instruction>
cpu_intr_2_327:
	setx	0x430117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, f)
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 30)
	.word 0xba04e1bf  ! 4212: ADD_I	add 	%r19, 0x01bf, %r29
	.word 0xfc158000  ! 4214: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xf85ca135  ! 4215: LDX_I	ldx	[%r18 + 0x0135], %r28
	.word 0xbc0d2037  ! 4218: AND_I	and 	%r20, 0x0037, %r30
	.word 0xfa4d8000  ! 4220: LDSB_R	ldsb	[%r22 + %r0], %r29
cpu_intr_2_328:
	setx	0x43030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cd4020  ! 4226: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r25
	.word 0xf604a037  ! 4230: LDUW_I	lduw	[%r18 + 0x0037], %r27
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_329:
	setx	0x400119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_330:
	setx	0x42021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf8cca046  ! 4237: LDSBA_I	ldsba	[%r18, + 0x0046] %asi, %r28
	.word 0xf0d50020  ! 4241: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r24
	.word 0xf215611b  ! 4244: LDUH_I	lduh	[%r21 + 0x011b], %r25
T2_asi_reg_rd_173:
	mov	0x17, %r14
	.word 0xf4db89e0  ! 4246: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf215e06c  ! 4249: LDUH_I	lduh	[%r23 + 0x006c], %r25
	.word 0xf88d20af  ! 4250: LDUBA_I	lduba	[%r20, + 0x00af] %asi, %r28
T2_asi_reg_wr_161:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 4254: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0x8d95e114  ! 4256: WRPR_PSTATE_I	wrpr	%r23, 0x0114, %pstate
T2_asi_reg_wr_162:
	mov	0x3c5, %r14
	.word 0xf4f38400  ! 4258: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_wr_163:
	mov	0x1, %r14
	.word 0xfcf38e40  ! 4259: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_331:
	setx	0x430100, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_174:
	mov	0x1, %r14
	.word 0xf0db84a0  ! 4266: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_rd_175:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 4267: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb734f001  ! 4269: SRLX_I	srlx	%r19, 0x0001, %r27
	.word 0xf6dde19d  ! 4271: LDXA_I	ldxa	[%r23, + 0x019d] %asi, %r27
	.word 0xf25da1fd  ! 4274: LDX_I	ldx	[%r22 + 0x01fd], %r25
	.word 0xf2040000  ! 4275: LDUW_R	lduw	[%r16 + %r0], %r25
	.word 0xbe040000  ! 4276: ADD_R	add 	%r16, %r0, %r31
T2_asi_reg_wr_164:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 4277: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfc8d2107  ! 4278: LDUBA_I	lduba	[%r20, + 0x0107] %asi, %r30
T2_asi_reg_rd_176:
	mov	0x17, %r14
	.word 0xfcdb8e40  ! 4281: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5504000  ! 4282: RDPR_TNPC	<illegal instruction>
	.word 0xfc040000  ! 4283: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xf4940020  ! 4285: LDUHA_R	lduha	[%r16, %r0] 0x01, %r26
	.word 0xfa54e007  ! 4286: LDSH_I	ldsh	[%r19 + 0x0007], %r29
T2_asi_reg_wr_165:
	mov	0x29, %r14
	.word 0xfaf38e80  ! 4288: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb0c4a0e5  ! 4289: ADDCcc_I	addccc 	%r18, 0x00e5, %r24
T2_asi_reg_rd_177:
	mov	0x1, %r14
	.word 0xf4db8400  ! 4290: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 11)
	.word 0xbac48000  ! 4293: ADDCcc_R	addccc 	%r18, %r0, %r29
T2_asi_reg_rd_178:
	mov	0x20, %r14
	.word 0xfcdb8400  ! 4294: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e1a  ! 4295: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e1a, %hpstate
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_179:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 4297: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_166:
	mov	0x1c, %r14
	.word 0xf0f38e40  ! 4299: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfa95215c  ! 4303: LDUHA_I	lduha	[%r20, + 0x015c] %asi, %r29
	.word 0xfa84a13a  ! 4304: LDUWA_I	lduwa	[%r18, + 0x013a] %asi, %r29
	.word 0xfcdda046  ! 4306: LDXA_I	ldxa	[%r22, + 0x0046] %asi, %r30
cpu_intr_2_332:
	setx	0x410233, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_180:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 4310: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf00dc000  ! 4311: LDUB_R	ldub	[%r23 + %r0], %r24
cpu_intr_2_333:
	setx	0x420007, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_181:
	mov	0x3c8, %r14
	.word 0xfedb8400  ! 4316: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_167:
	mov	0x3c3, %r14
	.word 0xf4f389e0  ! 4320: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfecd60fd  ! 4321: LDSBA_I	ldsba	[%r21, + 0x00fd] %asi, %r31
	.word 0xfc54c000  ! 4322: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xbf480000  ! 4324: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf405c000  ! 4327: LDUW_R	lduw	[%r23 + %r0], %r26
T2_asi_reg_rd_182:
	mov	0x1a, %r14
	.word 0xf8db89e0  ! 4329: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 1a)
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf44d8000  ! 4336: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xf04d8000  ! 4340: LDSB_R	ldsb	[%r22 + %r0], %r24
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 9)
	.word 0xfe0c20a2  ! 4345: LDUB_I	ldub	[%r16 + 0x00a2], %r31
	.word 0xf8d4602b  ! 4346: LDSHA_I	ldsha	[%r17, + 0x002b] %asi, %r28
	.word 0xb8bc20f2  ! 4348: XNORcc_I	xnorcc 	%r16, 0x00f2, %r28
	.word 0xbb641800  ! 4349: MOVcc_R	<illegal instruction>
cpu_intr_2_334:
	setx	0x400209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c205e  ! 4354: LDX_I	ldx	[%r16 + 0x005e], %r29
cpu_intr_2_335:
	setx	0x400325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_336:
	setx	0x420211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_337:
	setx	0x430006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88460fe  ! 4361: LDUWA_I	lduwa	[%r17, + 0x00fe] %asi, %r28
	.word 0xf8158000  ! 4364: LDUH_R	lduh	[%r22 + %r0], %r28
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 2)
	.word 0xfcd5c020  ! 4366: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r30
	.word 0xfcc48020  ! 4370: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
	.word 0xf0554000  ! 4371: LDSH_R	ldsh	[%r21 + %r0], %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_2_338:
	setx	0x400200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_339:
	setx	0x410017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08c6009  ! 4378: LDUBA_I	lduba	[%r17, + 0x0009] %asi, %r24
T2_asi_reg_wr_168:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 4383: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_183:
	mov	0x35, %r14
	.word 0xf8db8e40  ! 4386: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_340:
	setx	0x40021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d5e0a7  ! 4389: LDSHA_I	ldsha	[%r23, + 0x00a7] %asi, %r25
	.word 0xfc14a04c  ! 4390: LDUH_I	lduh	[%r18 + 0x004c], %r30
T2_asi_reg_rd_184:
	mov	0x3c1, %r14
	.word 0xf0db8e60  ! 4393: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_wr_169:
	mov	0x19, %r14
	.word 0xf4f384a0  ! 4395: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_170:
	mov	0x37, %r14
	.word 0xf2f389e0  ! 4401: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_341:
	setx	0x400322, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_185:
	mov	0x37, %r14
	.word 0xf4db89e0  ! 4404: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf8dd61f8  ! 4406: LDXA_I	ldxa	[%r21, + 0x01f8] %asi, %r28
T2_asi_reg_rd_186:
	mov	0x17, %r14
	.word 0xf4db89e0  ! 4407: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_342:
	setx	0x41022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40c8000  ! 4414: AND_R	and 	%r18, %r0, %r26
	.word 0xfad5609f  ! 4417: LDSHA_I	ldsha	[%r21, + 0x009f] %asi, %r29
T2_asi_reg_rd_187:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 4421: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbf34b001  ! 4423: SRLX_I	srlx	%r18, 0x0001, %r31
	.word 0xf48d61d1  ! 4427: LDUBA_I	lduba	[%r21, + 0x01d1] %asi, %r26
cpu_intr_2_343:
	setx	0x420024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_344:
	setx	0x430231, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x819838da  ! 4431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18da, %hpstate
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 37)
	.word 0xfc8d0020  ! 4444: LDUBA_R	lduba	[%r20, %r0] 0x01, %r30
cpu_intr_2_345:
	setx	0x430039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf695e06c  ! 4450: LDUHA_I	lduha	[%r23, + 0x006c] %asi, %r27
cpu_intr_2_346:
	setx	0x410227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa55a1ef  ! 4453: LDSH_I	ldsh	[%r22 + 0x01ef], %r29
cpu_intr_2_347:
	setx	0x420123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, a)
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf8542130  ! 4459: LDSH_I	ldsh	[%r16 + 0x0130], %r28
cpu_intr_2_348:
	setx	0x400327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c50020  ! 4467: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r24
	.word 0xfc554000  ! 4468: LDSH_R	ldsh	[%r21 + %r0], %r30
cpu_intr_2_349:
	setx	0x40020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_188:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 4471: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_2_350:
	setx	0x410034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_189:
	mov	0x5, %r14
	.word 0xf0db84a0  ! 4478: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbb7c8400  ! 4482: MOVR_R	movre	%r18, %r0, %r29
	.word 0xf44d60b3  ! 4484: LDSB_I	ldsb	[%r21 + 0x00b3], %r26
T2_asi_reg_wr_171:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 4485: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb6b5c000  ! 4486: ORNcc_R	orncc 	%r23, %r0, %r27
	.word 0xf64cc000  ! 4487: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xfe5d4000  ! 4489: LDX_R	ldx	[%r21 + %r0], %r31
cpu_intr_2_351:
	setx	0x420236, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_172:
	mov	0x32, %r14
	.word 0xf0f38e60  ! 4492: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf80d0000  ! 4493: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xfecd4020  ! 4496: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
	.word 0xf8050000  ! 4498: LDUW_R	lduw	[%r20 + %r0], %r28
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 14)
	.word 0xfe45e1ca  ! 4509: LDSW_I	ldsw	[%r23 + 0x01ca], %r31
	.word 0xfe4c61cc  ! 4511: LDSB_I	ldsb	[%r17 + 0x01cc], %r31
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 21)
	.word 0xf695e1c0  ! 4515: LDUHA_I	lduha	[%r23, + 0x01c0] %asi, %r27
	.word 0xf45c0000  ! 4516: LDX_R	ldx	[%r16 + %r0], %r26
T2_asi_reg_rd_190:
	mov	0x18, %r14
	.word 0xf0db8e80  ! 4519: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_wr_173:
	mov	0x14, %r14
	.word 0xfaf38e40  ! 4520: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_191:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 4523: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf2150000  ! 4526: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0xf8044000  ! 4527: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xf05560ba  ! 4529: LDSH_I	ldsh	[%r21 + 0x00ba], %r24
	.word 0xfccda085  ! 4532: LDSBA_I	ldsba	[%r22, + 0x0085] %asi, %r30
T2_asi_reg_rd_192:
	mov	0xd, %r14
	.word 0xf0db8e40  ! 4533: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_rd_193:
	mov	0x1e, %r14
	.word 0xfedb8e40  ! 4536: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_352:
	setx	0x41011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, d)
	.word 0xb6448000  ! 4546: ADDC_R	addc 	%r18, %r0, %r27
	.word 0xfe4c8000  ! 4547: LDSB_R	ldsb	[%r18 + %r0], %r31
T2_asi_reg_rd_194:
	mov	0x3c0, %r14
	.word 0xf8db8e60  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_353:
	setx	0x43013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68d8020  ! 4551: LDUBA_R	lduba	[%r22, %r0] 0x01, %r27
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_354:
	setx	0x43010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_174:
	mov	0x3c0, %r14
	.word 0xf2f38400  ! 4557: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_wr_175:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 4559: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfe5cc000  ! 4561: LDX_R	ldx	[%r19 + %r0], %r31
cpu_intr_2_355:
	setx	0x410011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf804601e  ! 4567: LDUW_I	lduw	[%r17 + 0x001e], %r28
	ta	T_CHANGE_TO_TL0
	.word 0xfe448000  ! 4570: LDSW_R	ldsw	[%r18 + %r0], %r31
cpu_intr_2_356:
	setx	0x41033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64521a2  ! 4572: LDSW_I	ldsw	[%r20 + 0x01a2], %r27
	.word 0xfa8ca185  ! 4573: LDUBA_I	lduba	[%r18, + 0x0185] %asi, %r29
T2_asi_reg_rd_195:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 4575: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_wr_176:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 4577: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf20c602c  ! 4579: LDUB_I	ldub	[%r17 + 0x002c], %r25
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_177:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 4583: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 39)
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a8a  ! 4586: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a8a, %hpstate
cpu_intr_2_357:
	setx	0x41031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf359000  ! 4588: SRLX_R	srlx	%r22, %r0, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf84d4000  ! 4593: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xf4d5c020  ! 4596: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r26
	.word 0xb22ce1e5  ! 4598: ANDN_I	andn 	%r19, 0x01e5, %r25
	.word 0xbc34c000  ! 4599: SUBC_R	orn 	%r19, %r0, %r30
	.word 0xf6952147  ! 4600: LDUHA_I	lduha	[%r20, + 0x0147] %asi, %r27
	.word 0xfe45e16a  ! 4602: LDSW_I	ldsw	[%r23 + 0x016a], %r31
T2_asi_reg_wr_178:
	mov	0x35, %r14
	.word 0xfcf38e40  ! 4606: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_358:
	setx	0x410336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41cc000  ! 4608: XOR_R	xor 	%r19, %r0, %r26
	.word 0xf8046020  ! 4609: LDUW_I	lduw	[%r17 + 0x0020], %r28
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c02  ! 4610: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c02, %hpstate
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_359:
	setx	0x420318, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_360:
	setx	0x42033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05d60cb  ! 4623: LDX_I	ldx	[%r21 + 0x00cb], %r24
	.word 0xfad48020  ! 4624: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r29
	.word 0xfa0de0b9  ! 4626: LDUB_I	ldub	[%r23 + 0x00b9], %r29
	.word 0xfc54a1de  ! 4629: LDSH_I	ldsh	[%r18 + 0x01de], %r30
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_196:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 4634: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_2_361:
	setx	0x47032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c40020  ! 4637: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	.word 0xb4256005  ! 4640: SUB_I	sub 	%r21, 0x0005, %r26
T2_asi_reg_rd_197:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 4642: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfc0c608c  ! 4645: LDUB_I	ldub	[%r17 + 0x008c], %r30
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_362:
	setx	0x46012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dda174  ! 4651: LDXA_I	ldxa	[%r22, + 0x0174] %asi, %r28
	.word 0xfac5e10a  ! 4652: LDSWA_I	ldswa	[%r23, + 0x010a] %asi, %r29
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_179:
	mov	0xf, %r14
	.word 0xf8f389e0  ! 4655: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_363:
	setx	0x44022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 1f)
	.word 0xb57d8400  ! 4659: MOVR_R	movre	%r22, %r0, %r26
cpu_intr_2_364:
	setx	0x450126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 1a)
	.word 0xb73ca001  ! 4663: SRA_I	sra 	%r18, 0x0001, %r27
T2_asi_reg_rd_198:
	mov	0x14, %r14
	.word 0xf8db84a0  ! 4664: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb934d000  ! 4665: SRLX_R	srlx	%r19, %r0, %r28
cpu_intr_2_365:
	setx	0x470235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2152166  ! 4667: LDUH_I	lduh	[%r20 + 0x0166], %r25
	.word 0xf24dc000  ! 4673: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xf45c0000  ! 4680: LDX_R	ldx	[%r16 + %r0], %r26
T2_asi_reg_rd_199:
	mov	0x0, %r14
	.word 0xf2db8e80  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb83d8000  ! 4683: XNOR_R	xnor 	%r22, %r0, %r28
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, e)
	ta	T_CHANGE_TO_TL0
	.word 0xf6558000  ! 4695: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xb6358000  ! 4697: ORN_R	orn 	%r22, %r0, %r27
	.word 0xf8d40020  ! 4698: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r28
	.word 0xb13c0000  ! 4699: SRA_R	sra 	%r16, %r0, %r24
	.word 0xb6c54000  ! 4701: ADDCcc_R	addccc 	%r21, %r0, %r27
	.word 0xf85c0000  ! 4702: LDX_R	ldx	[%r16 + %r0], %r28
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_366:
	setx	0x45013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 22)
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983f42  ! 4709: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f42, %hpstate
	.word 0xb88c4000  ! 4710: ANDcc_R	andcc 	%r17, %r0, %r28
T2_asi_reg_rd_200:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 4711: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf6458000  ! 4713: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xf8040000  ! 4716: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xb6a50000  ! 4721: SUBcc_R	subcc 	%r20, %r0, %r27
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_wr_180:
	mov	0x14, %r14
	.word 0xfef384a0  ! 4725: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_wr_181:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 4726: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_182:
	mov	0x3c0, %r14
	.word 0xf4f384a0  ! 4728: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbb3d3001  ! 4731: SRAX_I	srax	%r20, 0x0001, %r29
	.word 0xfa4d201c  ! 4734: LDSB_I	ldsb	[%r20 + 0x001c], %r29
cpu_intr_2_367:
	setx	0x47033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3344000  ! 4737: SRL_R	srl 	%r17, %r0, %r25
	ta	T_CHANGE_TO_TL1
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, d)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983802  ! 4746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1802, %hpstate
	.word 0xf0c50020  ! 4747: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r24
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, c)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_183:
	mov	0x2c, %r14
	.word 0xf6f38400  ! 4763: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf48d60c4  ! 4764: LDUBA_I	lduba	[%r21, + 0x00c4] %asi, %r26
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfe150000  ! 4768: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xf24c208e  ! 4769: LDSB_I	ldsb	[%r16 + 0x008e], %r25
	.word 0xf415e147  ! 4770: LDUH_I	lduh	[%r23 + 0x0147], %r26
	.word 0xfe050000  ! 4773: LDUW_R	lduw	[%r20 + %r0], %r31
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_wr_184:
	mov	0x22, %r14
	.word 0xf2f38e60  ! 4777: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_wr_185:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 4780: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfc0da073  ! 4781: LDUB_I	ldub	[%r22 + 0x0073], %r30
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_201:
	mov	0x4, %r14
	.word 0xf4db8e60  ! 4786: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xba9c8000  ! 4787: XORcc_R	xorcc 	%r18, %r0, %r29
T2_asi_reg_rd_202:
	mov	0x0, %r14
	.word 0xfadb8e40  ! 4788: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfc95c020  ! 4793: LDUHA_R	lduha	[%r23, %r0] 0x01, %r30
	.word 0xb88c0000  ! 4795: ANDcc_R	andcc 	%r16, %r0, %r28
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 38)
	.word 0xf68ca1ae  ! 4798: LDUBA_I	lduba	[%r18, + 0x01ae] %asi, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc2dc000  ! 4801: ANDN_R	andn 	%r23, %r0, %r30
T2_asi_reg_rd_203:
	mov	0x2, %r14
	.word 0xfadb84a0  ! 4802: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_2_368:
	setx	0x440216, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983dca  ! 4805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dca, %hpstate
cpu_intr_2_369:
	setx	0x46010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_186:
	mov	0x1b, %r14
	.word 0xf0f38e40  ! 4809: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_187:
	mov	0x0, %r14
	.word 0xf6f384a0  ! 4812: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_rd_204:
	mov	0x20, %r14
	.word 0xf2db8e60  ! 4813: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfc156049  ! 4814: LDUH_I	lduh	[%r21 + 0x0049], %r30
T2_asi_reg_wr_188:
	mov	0x18, %r14
	.word 0xf0f389e0  ! 4815: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf2cc20e6  ! 4818: LDSBA_I	ldsba	[%r16, + 0x00e6] %asi, %r25
cpu_intr_2_370:
	setx	0x440222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2544000  ! 4822: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xbb3d6001  ! 4824: SRA_I	sra 	%r21, 0x0001, %r29
T2_asi_reg_rd_205:
	mov	0x14, %r14
	.word 0xfcdb8e80  ! 4826: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbf35e001  ! 4827: SRL_I	srl 	%r23, 0x0001, %r31
	.word 0xf0d50020  ! 4829: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r24
	ta	T_CHANGE_NONHPRIV
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_371:
	setx	0x450001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 9)
	.word 0xf64d60e4  ! 4835: LDSB_I	ldsb	[%r21 + 0x00e4], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc9c4000  ! 4837: XORcc_R	xorcc 	%r17, %r0, %r30
	.word 0xf28dc020  ! 4838: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
cpu_intr_2_372:
	setx	0x440309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0444000  ! 4844: LDSW_R	ldsw	[%r17 + %r0], %r24
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 0)
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb41d4000  ! 4850: XOR_R	xor 	%r21, %r0, %r26
T2_asi_reg_rd_206:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfcc520a0  ! 4857: LDSWA_I	ldswa	[%r20, + 0x00a0] %asi, %r30
	.word 0xf88da153  ! 4859: LDUBA_I	lduba	[%r22, + 0x0153] %asi, %r28
	.word 0xfa446115  ! 4861: LDSW_I	ldsw	[%r17 + 0x0115], %r29
T2_asi_reg_rd_207:
	mov	0x1d, %r14
	.word 0xf0db8400  ! 4865: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb1641800  ! 4866: MOVcc_R	<illegal instruction>
T2_asi_reg_wr_189:
	mov	0x22, %r14
	.word 0xf8f38e40  ! 4868: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_190:
	mov	0x1, %r14
	.word 0xf6f38e40  ! 4870: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbc0dc000  ! 4876: AND_R	and 	%r23, %r0, %r30
	.word 0xf64de125  ! 4877: LDSB_I	ldsb	[%r23 + 0x0125], %r27
	.word 0xfe4c0000  ! 4879: LDSB_R	ldsb	[%r16 + %r0], %r31
T2_asi_reg_rd_208:
	mov	0x3c5, %r14
	.word 0xfadb84a0  ! 4882: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_rd_209:
	mov	0x12, %r14
	.word 0xf2db8400  ! 4883: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_wr_191:
	mov	0x3c8, %r14
	.word 0xfaf384a0  ! 4885: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_192:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 4887: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf2050000  ! 4896: LDUW_R	lduw	[%r20 + %r0], %r25
	.word 0xf00d203c  ! 4897: LDUB_I	ldub	[%r20 + 0x003c], %r24
	.word 0xfa948020  ! 4899: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
T2_asi_reg_rd_210:
	mov	0x8, %r14
	.word 0xf8db8400  ! 4900: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_TO_TL1
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_wr_193:
	mov	0x1a, %r14
	.word 0xf6f38e40  ! 4908: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_194:
	mov	0x22, %r14
	.word 0xf2f384a0  ! 4912: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf2840020  ! 4915: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
	.word 0xfec50020  ! 4916: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r31
	.word 0xf45561fd  ! 4919: LDSH_I	ldsh	[%r21 + 0x01fd], %r26
cpu_intr_2_373:
	setx	0x46002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_374:
	setx	0x440201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64d6082  ! 4923: LDSB_I	ldsb	[%r21 + 0x0082], %r27
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 26)
	.word 0xb6042149  ! 4926: ADD_I	add 	%r16, 0x0149, %r27
T2_asi_reg_wr_195:
	mov	0x1c, %r14
	.word 0xf0f384a0  ! 4927: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_196:
	mov	0x16, %r14
	.word 0xf8f38400  ! 4929: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb08d4000  ! 4931: ANDcc_R	andcc 	%r21, %r0, %r24
	.word 0xfe8d4020  ! 4932: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 25)
	.word 0xf4446045  ! 4934: LDSW_I	ldsw	[%r17 + 0x0045], %r26
	ta	T_CHANGE_TO_TL1
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 33)
	.word 0xf01421af  ! 4938: LDUH_I	lduh	[%r16 + 0x01af], %r24
T2_asi_reg_rd_211:
	mov	0x30, %r14
	.word 0xf0db8400  ! 4939: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb02560de  ! 4941: SUB_I	sub 	%r21, 0x00de, %r24
	.word 0xbe2d4000  ! 4942: ANDN_R	andn 	%r21, %r0, %r31
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_375:
	setx	0x440102, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_197:
	mov	0xd, %r14
	.word 0xf4f38400  ! 4946: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf6d5e024  ! 4951: LDSHA_I	ldsha	[%r23, + 0x0024] %asi, %r27
	.word 0xbc45e034  ! 4952: ADDC_I	addc 	%r23, 0x0034, %r30
	.word 0xf28521d7  ! 4956: LDUWA_I	lduwa	[%r20, + 0x01d7] %asi, %r25
	.word 0xb5353001  ! 4957: SRLX_I	srlx	%r20, 0x0001, %r26
	.word 0xf0050000  ! 4958: LDUW_R	lduw	[%r20 + %r0], %r24
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf48ca06f  ! 4961: LDUBA_I	lduba	[%r18, + 0x006f] %asi, %r26
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_376:
	setx	0x470032, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfe5d604d  ! 4973: LDX_I	ldx	[%r21 + 0x004d], %r31
T2_asi_reg_wr_198:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 4977: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
cpu_intr_2_377:
	setx	0x450111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2144000  ! 4980: LDUH_R	lduh	[%r17 + %r0], %r25
	ta	T_CHANGE_TO_TL1
	.word 0xf4c5c020  ! 4984: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r26
	.word 0xf0854020  ! 4987: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r24
cpu_intr_2_378:
	setx	0x440228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_379:
	setx	0x440220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_212:
	mov	0x0, %r14
	.word 0xf0db8e60  ! 4992: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf2942153  ! 4994: LDUHA_I	lduha	[%r16, + 0x0153] %asi, %r25
cpu_intr_2_380:
	setx	0x44011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_396:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_396), 16, 16)) -> intp(2, 0, f)
	.word 0xb9480000  ! 4998: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, f)
	.word 0xb3a489e0  ! 9: FDIVq	dis not found

cpu_intr_1_0:
	setx	0x1c031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0d8000  ! 14: AND_R	and 	%r22, %r0, %r29
T1_asi_reg_wr_0:
	mov	0xb, %r14
	.word 0xfcf38400  ! 15: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb2ac60db  ! 22: ANDNcc_I	andncc 	%r17, 0x00db, %r25
	.word 0xbba40920  ! 23: FMULs	fmuls	%f16, %f0, %f29
	.word 0xb3a00520  ! 24: FSQRTs	fsqrt	
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb7a48860  ! 29: FADDq	dis not found

cpu_intr_1_1:
	setx	0x1f033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a50840  ! 33: FADDd	faddd	%f20, %f0, %f26
cpu_intr_1_2:
	setx	0x1d020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_3:
	setx	0x1c020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa0820  ! 37: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbda98820  ! 40: FMOVNEG	fmovs	%fcc1, %f0, %f30
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 21)
	.word 0xb8b4211f  ! 44: ORNcc_I	orncc 	%r16, 0x011f, %r28
	.word 0xb7a548e0  ! 46: FSUBq	dis not found

	.word 0xb73cf001  ! 49: SRAX_I	srax	%r19, 0x0001, %r27
	.word 0xbfa408c0  ! 52: FSUBd	fsubd	%f16, %f0, %f62
cpu_intr_1_4:
	setx	0x1e023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_5:
	setx	0x1e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_1:
	mov	0x2, %r14
	.word 0xf4f38e80  ! 59: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb1aa0820  ! 60: FMOVA	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_0:
	mov	0x3c0, %r14
	.word 0xf8db8e80  ! 62: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb5a4c8c0  ! 63: FSUBd	fsubd	%f50, %f0, %f26
	.word 0xb9ab8820  ! 64: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a40860  ! 65: FADDq	dis not found

	.word 0xbba4c9a0  ! 69: FDIVs	fdivs	%f19, %f0, %f29
T1_asi_reg_wr_2:
	mov	0x10, %r14
	.word 0xfaf38400  ! 72: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_3:
	mov	0x1c, %r14
	.word 0xf4f38e60  ! 75: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb5a00560  ! 77: FSQRTq	fsqrt	
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbb2cc000  ! 79: SLL_R	sll 	%r19, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a81820  ! 82: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb5a00560  ! 83: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a88820  ! 90: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbda90820  ! 92: FMOVLEU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_6:
	setx	0x1d0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_wr_4:
	mov	0x22, %r14
	.word 0xf2f38400  ! 102: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb684617c  ! 103: ADDcc_I	addcc 	%r17, 0x017c, %r27
	.word 0xb5aa0820  ! 104: FMOVA	fmovs	%fcc1, %f0, %f26
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_5:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 112: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_1:
	mov	0x30, %r14
	.word 0xf6db8400  ! 114: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_1_7:
	setx	0x1d0127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_8:
	setx	0x1c0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c820  ! 128: FADDs	fadds	%f19, %f0, %f25
	.word 0xb1a94820  ! 130: FMOVCS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_6:
	mov	0x3c3, %r14
	.word 0xfef38e60  ! 132: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb3a9c820  ! 133: FMOVVS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_9:
	setx	0x1e0335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_10:
	setx	0x1e0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa4820  ! 140: FMOVNE	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbba409e0  ! 145: FDIVq	dis not found

iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb508000  ! 153: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a44940  ! 155: FMULd	fmuld	%f48, %f0, %f56
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_2:
	mov	0x1a, %r14
	.word 0xfedb8e80  ! 158: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_11:
	setx	0x1c000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 6)
	.word 0xb7a548c0  ! 166: FSUBd	fsubd	%f52, %f0, %f58
	.word 0xb1a81820  ! 168: FMOVRGZ	fmovs	%fcc3, %f0, %f24
T1_asi_reg_rd_3:
	mov	0x38, %r14
	.word 0xf2db8e80  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 10)
	.word 0xbda00540  ! 173: FSQRTd	fsqrt	
	.word 0xb7aa8820  ! 175: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb3a00540  ! 178: FSQRTd	fsqrt	
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_4:
	mov	0x3c8, %r14
	.word 0xfadb8e60  ! 183: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb3a488e0  ! 185: FSUBq	dis not found

iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_12:
	setx	0x1c022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 0)
	.word 0xb9643801  ! 193: MOVcc_I	<illegal instruction>
cpu_intr_1_13:
	setx	0x1e000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_14:
	setx	0x1d011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 198: FSQRTq	fsqrt	
	.word 0xb1a94820  ! 199: FMOVCS	fmovs	%fcc1, %f0, %f24
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 26)
	.word 0xbba00520  ! 202: FSQRTs	fsqrt	
T1_asi_reg_rd_5:
	mov	0x3c6, %r14
	.word 0xf4db8e80  ! 203: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb48d8000  ! 206: ANDcc_R	andcc 	%r22, %r0, %r26
T1_asi_reg_wr_7:
	mov	0x1e, %r14
	.word 0xf8f38e40  ! 208: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_8:
	mov	0x2a, %r14
	.word 0xf6f384a0  ! 211: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb7a4c8c0  ! 215: FSUBd	fsubd	%f50, %f0, %f58
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a508a0  ! 217: FSUBs	fsubs	%f20, %f0, %f26
T1_asi_reg_wr_9:
	mov	0x2b, %r14
	.word 0xfaf38e40  ! 218: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 15)
	.word 0xbba8c820  ! 221: FMOVL	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_6:
	mov	0x18, %r14
	.word 0xf2db8e40  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1a448a0  ! 227: FSUBs	fsubs	%f17, %f0, %f24
	.word 0x8794602e  ! 228: WRPR_TT_I	wrpr	%r17, 0x002e, %tt
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb9a00520  ! 235: FSQRTs	fsqrt	
	.word 0xb1aa4820  ! 238: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a81420  ! 243: FMOVRNZ	dis not found

	.word 0xb9a80820  ! 244: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb1a44820  ! 246: FADDs	fadds	%f17, %f0, %f24
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 18)
	.word 0xb00d6063  ! 251: AND_I	and 	%r21, 0x0063, %r24
	.word 0xb9aa4820  ! 252: FMOVNE	fmovs	%fcc1, %f0, %f28
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb5ab4820  ! 256: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb434e173  ! 257: ORN_I	orn 	%r19, 0x0173, %r26
	.word 0xbfa58920  ! 259: FMULs	fmuls	%f22, %f0, %f31
	.word 0xb9a549e0  ! 262: FDIVq	dis not found

iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 28)
	.word 0xbba00520  ! 266: FSQRTs	fsqrt	
	.word 0xb7a80c20  ! 270: FMOVRLZ	dis not found

T1_asi_reg_rd_7:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 271: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_15:
	setx	0x1e0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c8e0  ! 275: FSUBq	dis not found

	.word 0xb9aa4820  ! 277: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a50940  ! 278: FMULd	fmuld	%f20, %f0, %f56
	.word 0xb7641800  ! 285: MOVcc_R	<illegal instruction>
T1_asi_reg_rd_8:
	mov	0x3, %r14
	.word 0xf6db8e40  ! 286: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5a4c820  ! 288: FADDs	fadds	%f19, %f0, %f26
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 10)
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_wr_10:
	mov	0x35, %r14
	.word 0xf8f38e80  ! 294: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 33)
	.word 0xbba80420  ! 302: FMOVRZ	dis not found

iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_16:
	setx	0x1f0309, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_9:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 305: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_17:
	setx	0x1f000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_18:
	setx	0x1e0207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_19:
	setx	0x1f030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 7)
	.word 0xb9a40860  ! 319: FADDq	dis not found

	.word 0xb9a50920  ! 321: FMULs	fmuls	%f20, %f0, %f28
T1_asi_reg_wr_11:
	mov	0x3, %r14
	.word 0xf4f384a0  ! 324: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_wr_12:
	mov	0x1c, %r14
	.word 0xf0f384a0  ! 325: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_20:
	setx	0x1f0215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_21:
	setx	0x1c002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6348000  ! 334: SUBC_R	orn 	%r18, %r0, %r27
	.word 0xb1a00040  ! 338: FMOVd	fmovd	%f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_22:
	setx	0x1d0022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 23)
	.word 0xbda548c0  ! 345: FSUBd	fsubd	%f52, %f0, %f30
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_23:
	setx	0x1d0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80c20  ! 350: FMOVRLZ	dis not found

cpu_intr_1_24:
	setx	0x1e0022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_25:
	setx	0x1e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_26:
	setx	0x1e0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 369: FSQRTq	fsqrt	
cpu_intr_1_27:
	setx	0x1d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_28:
	setx	0x1c031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_10:
	mov	0x36, %r14
	.word 0xfadb84a0  ! 379: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 10)
	.word 0xbfa98820  ! 383: FMOVNEG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_11:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_29:
	setx	0x1f0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a408c0  ! 387: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xbda588a0  ! 389: FSUBs	fsubs	%f22, %f0, %f30
	.word 0x9194619a  ! 390: WRPR_PIL_I	wrpr	%r17, 0x019a, %pil
	.word 0xb1a54820  ! 394: FADDs	fadds	%f21, %f0, %f24
	.word 0xb7a54920  ! 395: FMULs	fmuls	%f21, %f0, %f27
	.word 0xbda80420  ! 396: FMOVRZ	dis not found

iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_30:
	setx	0x1d0002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 18)
	.word 0xb7a4c8a0  ! 406: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xbf2ce001  ! 407: SLL_I	sll 	%r19, 0x0001, %r31
	.word 0xb5a80820  ! 408: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbfa81c20  ! 409: FMOVRGEZ	dis not found

T1_asi_reg_wr_13:
	mov	0x32, %r14
	.word 0xf8f38e60  ! 412: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbda90820  ! 413: FMOVLEU	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_12:
	mov	0x34, %r14
	.word 0xf0db84a0  ! 421: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_31:
	setx	0x1c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_14:
	mov	0x1f, %r14
	.word 0xf6f38e40  ! 427: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_32:
	setx	0x1f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_33:
	setx	0x1c0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_13:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 438: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_34:
	setx	0x1e0208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_35:
	setx	0x1e032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_15:
	mov	0x2, %r14
	.word 0xf4f38e40  ! 462: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 13)
	.word 0xb9a48860  ! 465: FADDq	dis not found

	.word 0xbdab8820  ! 466: FMOVPOS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_16:
	mov	0x24, %r14
	.word 0xfef389e0  ! 470: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb7a88820  ! 473: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a449e0  ! 475: FDIVq	dis not found

iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 14)
	.word 0xb7a40820  ! 479: FADDs	fadds	%f16, %f0, %f27
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 24)
	.word 0xb6858000  ! 483: ADDcc_R	addcc 	%r22, %r0, %r27
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, a)
	.word 0xb134a001  ! 490: SRL_I	srl 	%r18, 0x0001, %r24
	.word 0xb9a5c9e0  ! 491: FDIVq	dis not found

	.word 0xbcada0a3  ! 492: ANDNcc_I	andncc 	%r22, 0x00a3, %r30
T1_asi_reg_rd_14:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 494: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_15:
	mov	0xe, %r14
	.word 0xf2db89e0  ! 501: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_wr_17:
	mov	0x3c8, %r14
	.word 0xf6f38e60  ! 502: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbfa00520  ! 506: FSQRTs	fsqrt	
T1_asi_reg_wr_18:
	mov	0x11, %r14
	.word 0xfef38e40  ! 507: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7aa4820  ! 508: FMOVNE	fmovs	%fcc1, %f0, %f27
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 4)
	.word 0xb69d4000  ! 513: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0xbfab0820  ! 520: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00520  ! 524: FSQRTs	fsqrt	
	.word 0xb1a5c9c0  ! 526: FDIVd	fdivd	%f54, %f0, %f24
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_19:
	mov	0x21, %r14
	.word 0xf4f38e80  ! 532: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbfa80c20  ! 533: FMOVRLZ	dis not found

	.word 0xbfa508c0  ! 534: FSUBd	fsubd	%f20, %f0, %f62
T1_asi_reg_rd_16:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 535: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_17:
	mov	0x1f, %r14
	.word 0xfadb8e60  ! 536: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_36:
	setx	0x22020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 544: FMOVL	fmovs	%fcc1, %f0, %f31
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_20:
	mov	0x33, %r14
	.word 0xf2f38e40  ! 550: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb0252183  ! 553: SUB_I	sub 	%r20, 0x0183, %r24
T1_asi_reg_rd_18:
	mov	0x2f, %r14
	.word 0xfadb8e40  ! 555: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_21:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 560: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1a9c820  ! 561: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb3a4c960  ! 562: FMULq	dis not found

T1_asi_reg_rd_19:
	mov	0x2c, %r14
	.word 0xf8db84a0  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb7a00020  ! 565: FMOVs	fmovs	%f0, %f27
cpu_intr_1_37:
	setx	0x22011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ada1c7  ! 576: ANDNcc_I	andncc 	%r22, 0x01c7, %r24
T1_asi_reg_wr_22:
	mov	0x11, %r14
	.word 0xfcf389e0  ! 577: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_wr_23:
	mov	0x9, %r14
	.word 0xf0f389e0  ! 578: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_rd_20:
	mov	0x27, %r14
	.word 0xfadb8e40  ! 583: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 2)
	.word 0xbd641800  ! 585: MOVcc_R	<illegal instruction>
	.word 0xb7a81420  ! 586: FMOVRNZ	dis not found

	.word 0xb0244000  ! 587: SUB_R	sub 	%r17, %r0, %r24
	.word 0xb3a98820  ! 592: FMOVNEG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_24:
	mov	0xa, %r14
	.word 0xf4f38400  ! 593: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb7aa8820  ! 595: FMOVG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_21:
	mov	0x14, %r14
	.word 0xf2db8e60  ! 597: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_wr_25:
	mov	0x38, %r14
	.word 0xfaf38e40  ! 601: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9a4c820  ! 602: FADDs	fadds	%f19, %f0, %f28
	.word 0xb5a81420  ! 603: FMOVRNZ	dis not found

iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_rd_22:
	mov	0x18, %r14
	.word 0xfedb8e60  ! 608: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_1_38:
	setx	0x20021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_23:
	mov	0x24, %r14
	.word 0xf6db84a0  ! 611: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb7a409a0  ! 614: FDIVs	fdivs	%f16, %f0, %f27
T1_asi_reg_rd_24:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 616: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_wr_26:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 617: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_39:
	setx	0x21002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_40:
	setx	0x230338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_41:
	setx	0x21011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_27:
	mov	0x1d, %r14
	.word 0xf0f38e40  ! 625: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_42:
	setx	0x23002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_43:
	setx	0x33e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 628: FSQRTq	fsqrt	
cpu_intr_1_44:
	setx	0x220132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 630: FMOVPOS	fmovs	%fcc1, %f0, %f27
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 18)
	.word 0xb3a84820  ! 634: FMOVE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_45:
	setx	0x22002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_46:
	setx	0x23031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbba4c840  ! 644: FADDd	faddd	%f50, %f0, %f60
	.word 0xb7a4c920  ! 650: FMULs	fmuls	%f19, %f0, %f27
	.word 0xb9a80820  ! 651: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb4b50000  ! 655: ORNcc_R	orncc 	%r20, %r0, %r26
T1_asi_reg_wr_28:
	mov	0x14, %r14
	.word 0xfef38e60  ! 657: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbfa80820  ! 667: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
cpu_intr_1_47:
	setx	0x21001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33de001  ! 674: SRA_I	sra 	%r23, 0x0001, %r25
	.word 0xbc1ce10e  ! 677: XOR_I	xor 	%r19, 0x010e, %r30
	.word 0xbba80420  ! 678: FMOVRZ	dis not found

	.word 0xb9a00520  ! 680: FSQRTs	fsqrt	
	.word 0xb3a50820  ! 681: FADDs	fadds	%f20, %f0, %f25
T1_asi_reg_rd_25:
	mov	0xa, %r14
	.word 0xf6db8e80  ! 682: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbe35e0df  ! 684: SUBC_I	orn 	%r23, 0x00df, %r31
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, d)
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb9a00560  ! 689: FSQRTq	fsqrt	
	.word 0xbc3c4000  ! 693: XNOR_R	xnor 	%r17, %r0, %r30
	.word 0xb9480000  ! 696: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbda48840  ! 697: FADDd	faddd	%f18, %f0, %f30
	.word 0xb9a4c940  ! 702: FMULd	fmuld	%f50, %f0, %f28
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb5abc820  ! 706: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbba488a0  ! 707: FSUBs	fsubs	%f18, %f0, %f29
	.word 0xbba00040  ! 711: FMOVd	fmovd	%f0, %f60
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_48:
	setx	0x21001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_49:
	setx	0x220308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa0820  ! 718: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb1a81820  ! 720: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb2054000  ! 723: ADD_R	add 	%r21, %r0, %r25
	.word 0xbba00520  ! 724: FSQRTs	fsqrt	
cpu_intr_1_50:
	setx	0x230237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda448a0  ! 730: FSUBs	fsubs	%f17, %f0, %f30
cpu_intr_1_51:
	setx	0x230223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a84820  ! 732: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbfa81c20  ! 733: FMOVRGEZ	dis not found

iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 16)
	.word 0xbba449e0  ! 736: FDIVq	dis not found

iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, c)
	.word 0xbfa00520  ! 740: FSQRTs	fsqrt	
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_52:
	setx	0x210312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4840000  ! 745: ADDcc_R	addcc 	%r16, %r0, %r26
	.word 0xb635612e  ! 752: ORN_I	orn 	%r21, 0x012e, %r27
	.word 0xbfa9c820  ! 753: FMOVVS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_29:
	mov	0x15, %r14
	.word 0xf0f38400  ! 756: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_53:
	setx	0x220233, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_26:
	mov	0x11, %r14
	.word 0xf8db8e60  ! 759: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb1a80820  ! 762: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_54:
	setx	0x230115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbbaa8820  ! 766: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb7aa0820  ! 768: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb3a409a0  ! 770: FDIVs	fdivs	%f16, %f0, %f25
	.word 0xbfa84820  ! 773: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a00540  ! 774: FSQRTd	fsqrt	
	.word 0xbbaa0820  ! 775: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb9a94820  ! 776: FMOVCS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_55:
	setx	0x21012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_56:
	setx	0x200036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe34a013  ! 784: SUBC_I	orn 	%r18, 0x0013, %r31
cpu_intr_1_57:
	setx	0x23011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_58:
	setx	0x210028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a508e0  ! 788: FSUBq	dis not found

	.word 0xbda98820  ! 790: FMOVNEG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_30:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 791: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_59:
	setx	0x230206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01ce089  ! 796: XOR_I	xor 	%r19, 0x0089, %r24
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbfab4820  ! 801: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb5a88820  ! 804: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa81820  ! 805: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb2b54000  ! 806: ORNcc_R	orncc 	%r21, %r0, %r25
	.word 0xb5a50840  ! 809: FADDd	faddd	%f20, %f0, %f26
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb1a88820  ! 812: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbfa84820  ! 813: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbba4c920  ! 817: FMULs	fmuls	%f19, %f0, %f29
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb1a90820  ! 824: FMOVLEU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_31:
	mov	0x37, %r14
	.word 0xf8f38e60  ! 825: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbba94820  ! 832: FMOVCS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_60:
	setx	0x200010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba350000  ! 834: ORN_R	orn 	%r20, %r0, %r29
T1_asi_reg_rd_27:
	mov	0x18, %r14
	.word 0xfedb8e40  ! 837: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_rd_28:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb034a13c  ! 842: ORN_I	orn 	%r18, 0x013c, %r24
	.word 0xb3a98820  ! 843: FMOVNEG	fmovs	%fcc1, %f0, %f25
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 31)
	.word 0xb1a40920  ! 847: FMULs	fmuls	%f16, %f0, %f24
	.word 0xb3aa8820  ! 849: FMOVG	fmovs	%fcc1, %f0, %f25
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 5)
	.word 0xb22ce1cc  ! 851: ANDN_I	andn 	%r19, 0x01cc, %r25
	.word 0xb7a00540  ! 852: FSQRTd	fsqrt	
	.word 0xb3a90820  ! 856: FMOVLEU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_32:
	mov	0x4, %r14
	.word 0xf6f384a0  ! 859: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_61:
	setx	0x200332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_62:
	setx	0x230339, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba1c6136  ! 867: XOR_I	xor 	%r17, 0x0136, %r29
T1_asi_reg_wr_33:
	mov	0x23, %r14
	.word 0xf0f389e0  ! 868: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_63:
	setx	0x230231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48920  ! 871: FMULs	fmuls	%f18, %f0, %f29
	.word 0xb5a81820  ! 872: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb3a80820  ! 874: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb9a409a0  ! 877: FDIVs	fdivs	%f16, %f0, %f28
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_64:
	setx	0x210112, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_29:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 883: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3a84820  ! 887: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_30:
	mov	0x7, %r14
	.word 0xfadb8400  ! 891: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbda9c820  ! 896: FMOVVS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_31:
	mov	0x26, %r14
	.word 0xf8db84a0  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_rd_32:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 901: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_65:
	setx	0x21002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_33:
	mov	0x10, %r14
	.word 0xf6db84a0  ! 905: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb3a5c9c0  ! 906: FDIVd	fdivd	%f54, %f0, %f56
T1_asi_reg_wr_34:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 908: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb5a548c0  ! 910: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xb5a4c840  ! 911: FADDd	faddd	%f50, %f0, %f26
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 22)
	.word 0xbba4c860  ! 917: FADDq	dis not found

	.word 0xb9a48840  ! 919: FADDd	faddd	%f18, %f0, %f28
cpu_intr_1_66:
	setx	0x22031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 923: FSQRTd	fsqrt	
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_wr_35:
	mov	0x4, %r14
	.word 0xfef384a0  ! 925: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_34:
	mov	0x29, %r14
	.word 0xfcdb8e60  ! 932: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_67:
	setx	0x22020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbba84820  ! 938: FMOVE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_68:
	setx	0x210302, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_36:
	mov	0x36, %r14
	.word 0xfef38400  ! 943: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_69:
	setx	0x250035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba94820  ! 947: FMOVCS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_35:
	mov	0x1e, %r14
	.word 0xf2db8e40  ! 949: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_70:
	setx	0x27032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00040  ! 953: FMOVd	fmovd	%f0, %f26
cpu_intr_1_71:
	setx	0x260016, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_36:
	mov	0x4, %r14
	.word 0xf8db8e60  ! 956: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb5a00560  ! 957: FSQRTq	fsqrt	
cpu_intr_1_72:
	setx	0x27013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaad0000  ! 959: ANDNcc_R	andncc 	%r20, %r0, %r29
	.word 0xb5a9c820  ! 960: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a509c0  ! 965: FDIVd	fdivd	%f20, %f0, %f24
	.word 0xb9a509a0  ! 966: FDIVs	fdivs	%f20, %f0, %f28
	.word 0xb5a589a0  ! 968: FDIVs	fdivs	%f22, %f0, %f26
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 9)
	.word 0xb3a5c920  ! 971: FMULs	fmuls	%f23, %f0, %f25
	.word 0x9194612d  ! 973: WRPR_PIL_I	wrpr	%r17, 0x012d, %pil
cpu_intr_1_73:
	setx	0x27012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_37:
	mov	0x3c6, %r14
	.word 0xf6f384a0  ! 982: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_74:
	setx	0x24020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_37:
	mov	0x28, %r14
	.word 0xf0db8400  ! 989: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_38:
	mov	0x3c1, %r14
	.word 0xf2f384a0  ! 991: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 1)
	.word 0xbfa508e0  ! 995: FSUBq	dis not found

iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, b)
	.word 0x839560d6  ! 1001: WRPR_TNPC_I	wrpr	%r21, 0x00d6, %tnpc
	.word 0xbe8da011  ! 1006: ANDcc_I	andcc 	%r22, 0x0011, %r31
T1_asi_reg_wr_39:
	mov	0x27, %r14
	.word 0xf0f38e80  ! 1007: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_38:
	mov	0x32, %r14
	.word 0xf8db84a0  ! 1014: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0x8f902000  ! 1017: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb5a00540  ! 1019: FSQRTd	fsqrt	
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 2a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_75:
	setx	0x270019, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_40:
	mov	0x10, %r14
	.word 0xf4f38400  ! 1034: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_76:
	setx	0x260216, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_41:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 1039: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda548e0  ! 1045: FSUBq	dis not found

iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 9)
	.word 0xba258000  ! 1050: SUB_R	sub 	%r22, %r0, %r29
	.word 0xb3a5c8e0  ! 1051: FSUBq	dis not found

T1_asi_reg_wr_42:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 1052: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbe9dc000  ! 1057: XORcc_R	xorcc 	%r23, %r0, %r31
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbda80c20  ! 1061: FMOVRLZ	dis not found

T1_asi_reg_wr_43:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 1063: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_wr_44:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 1064: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb1a80820  ! 1065: FMOVN	fmovs	%fcc1, %f0, %f24
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 15)
	.word 0xb5a00560  ! 1069: FSQRTq	fsqrt	
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 36)
	.word 0xb1a80820  ! 1072: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_39:
	mov	0x1e, %r14
	.word 0xfadb8e40  ! 1073: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_40:
	mov	0x1f, %r14
	.word 0xfcdb89e0  ! 1074: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbba80c20  ! 1075: FMOVRLZ	dis not found

iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 38)
	.word 0xb3aa8820  ! 1080: FMOVG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_45:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 1081: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_41:
	mov	0x1f, %r14
	.word 0xf6db8e40  ! 1087: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_rd_42:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 1088: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 35)
	.word 0xb9ab4820  ! 1094: FMOVCC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_46:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 1095: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_77:
	setx	0x260104, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a00560  ! 1099: FSQRTq	fsqrt	
T1_asi_reg_rd_43:
	mov	0x19, %r14
	.word 0xfadb89e0  ! 1100: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_rd_44:
	mov	0x20, %r14
	.word 0xf8db84a0  ! 1102: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_78:
	setx	0x250010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_79:
	setx	0x25030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_80:
	setx	0x270000, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_47:
	mov	0x3, %r14
	.word 0xf0f38e40  ! 1110: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3a00020  ! 1113: FMOVs	fmovs	%f0, %f25
cpu_intr_1_81:
	setx	0x270131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 11)
	.word 0xb7a00520  ! 1119: FSQRTs	fsqrt	
	.word 0xbfa8c820  ! 1121: FMOVL	fmovs	%fcc1, %f0, %f31
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_82:
	setx	0x26031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba15e1a0  ! 1124: OR_I	or 	%r23, 0x01a0, %r29
T1_asi_reg_rd_45:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 1126: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_rd_46:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 1127: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_83:
	setx	0x240110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 1136: FMOVRGEZ	dis not found

iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, e)
	.word 0xbba00020  ! 1139: FMOVs	fmovs	%f0, %f29
	.word 0x879560f7  ! 1142: WRPR_TT_I	wrpr	%r21, 0x00f7, %tt
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_84:
	setx	0x27003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a548c0  ! 1153: FSUBd	fsubd	%f52, %f0, %f58
T1_asi_reg_wr_48:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 1154: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_85:
	setx	0x26000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_49:
	mov	0x34, %r14
	.word 0xfaf38400  ! 1159: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_86:
	setx	0x27030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13c4000  ! 1163: SRA_R	sra 	%r17, %r0, %r24
T1_asi_reg_rd_47:
	mov	0x0, %r14
	.word 0xf8db8e40  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb2950000  ! 1166: ORcc_R	orcc 	%r20, %r0, %r25
T1_asi_reg_rd_48:
	mov	0x3c5, %r14
	.word 0xf2db8400  ! 1172: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0x8795e138  ! 1176: WRPR_TT_I	wrpr	%r23, 0x0138, %tt
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 29)
	.word 0xbea4e102  ! 1181: SUBcc_I	subcc 	%r19, 0x0102, %r31
T1_asi_reg_wr_50:
	mov	0x4, %r14
	.word 0xf2f38e60  ! 1183: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbda509e0  ! 1187: FDIVq	dis not found

iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb1a98820  ! 1193: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb32c7001  ! 1195: SLLX_I	sllx	%r17, 0x0001, %r25
T1_asi_reg_rd_49:
	mov	0x1c, %r14
	.word 0xf8db8400  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T1_asi_reg_wr_51:
	mov	0x1c, %r14
	.word 0xfef38400  ! 1199: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_87:
	setx	0x270331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 1202: FMOVRGEZ	dis not found

	.word 0xb9a9c820  ! 1207: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb3a5c8e0  ! 1209: FSUBq	dis not found

	.word 0xbba4c9e0  ! 1211: FDIVq	dis not found

cpu_intr_1_88:
	setx	0x25020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a509a0  ! 1216: FDIVs	fdivs	%f20, %f0, %f25
	.word 0xbba40820  ! 1217: FADDs	fadds	%f16, %f0, %f29
	.word 0xbba488a0  ! 1222: FSUBs	fsubs	%f18, %f0, %f29
T1_asi_reg_wr_52:
	mov	0x2c, %r14
	.word 0xf0f38400  ! 1223: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb3aac820  ! 1226: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 9)
	.word 0xbba488c0  ! 1232: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xb3a549a0  ! 1235: FDIVs	fdivs	%f21, %f0, %f25
	.word 0xb8a5c000  ! 1236: SUBcc_R	subcc 	%r23, %r0, %r28
cpu_intr_1_89:
	setx	0x24003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_90:
	setx	0x270129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_53:
	mov	0x3c3, %r14
	.word 0xfaf38e80  ! 1244: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbbaa4820  ! 1246: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb21dc000  ! 1248: XOR_R	xor 	%r23, %r0, %r25
cpu_intr_1_91:
	setx	0x240137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 1251: FMOVRZ	dis not found

T1_asi_reg_wr_54:
	mov	0x32, %r14
	.word 0xfaf38400  ! 1253: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb3a58960  ! 1254: FMULq	dis not found

	.word 0xb20c8000  ! 1257: AND_R	and 	%r18, %r0, %r25
	.word 0xb7a44820  ! 1262: FADDs	fadds	%f17, %f0, %f27
	.word 0xb9aac820  ! 1269: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a8c820  ! 1271: FMOVL	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_55:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 1272: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_wr_56:
	mov	0x3c2, %r14
	.word 0xf0f384a0  ! 1275: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_rd_50:
	mov	0x23, %r14
	.word 0xfcdb8e60  ! 1276: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb7a98820  ! 1277: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb6c420ec  ! 1278: ADDCcc_I	addccc 	%r16, 0x00ec, %r27
	.word 0xb3a509a0  ! 1280: FDIVs	fdivs	%f20, %f0, %f25
cpu_intr_1_92:
	setx	0x260201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd7d4400  ! 1285: MOVR_R	movre	%r21, %r0, %r30
	.word 0xb894e060  ! 1286: ORcc_I	orcc 	%r19, 0x0060, %r28
T1_asi_reg_rd_51:
	mov	0x6, %r14
	.word 0xf4db8e40  ! 1287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9ab8820  ! 1291: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb2954000  ! 1295: ORcc_R	orcc 	%r21, %r0, %r25
cpu_intr_1_93:
	setx	0x25010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 1298: FMOVRGEZ	dis not found

	.word 0xb5a40840  ! 1304: FADDd	faddd	%f16, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa48920  ! 1306: FMULs	fmuls	%f18, %f0, %f31
cpu_intr_1_94:
	setx	0x260033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a88820  ! 1309: FMOVLE	fmovs	%fcc1, %f0, %f26
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 1)
	.word 0xb5a5c840  ! 1312: FADDd	faddd	%f54, %f0, %f26
	.word 0xb7a84820  ! 1313: FMOVE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_95:
	setx	0x270107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_96:
	setx	0x250224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_97:
	setx	0x27020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 36)
	.word 0xbd2d0000  ! 1322: SLL_R	sll 	%r20, %r0, %r30
T1_asi_reg_rd_52:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 1323: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbbaa0820  ! 1326: FMOVA	fmovs	%fcc1, %f0, %f29
cpu_intr_1_98:
	setx	0x240214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a40960  ! 1331: FMULq	dis not found

	.word 0xb9351000  ! 1333: SRLX_R	srlx	%r20, %r0, %r28
T1_asi_reg_rd_53:
	mov	0x15, %r14
	.word 0xf0db8400  ! 1340: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb1a40960  ! 1342: FMULq	dis not found

	.word 0xbba44960  ! 1344: FMULq	dis not found

	.word 0xb7a448e0  ! 1348: FSUBq	dis not found

	.word 0xbb7d4400  ! 1349: MOVR_R	movre	%r21, %r0, %r29
	.word 0xb1a98820  ! 1350: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbfa81820  ! 1353: FMOVRGZ	fmovs	%fcc3, %f0, %f31
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb7a88820  ! 1357: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a4c8e0  ! 1359: FSUBq	dis not found

T1_asi_reg_rd_54:
	mov	0x12, %r14
	.word 0xf2db8400  ! 1361: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbcadc000  ! 1364: ANDNcc_R	andncc 	%r23, %r0, %r30
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 36)
	.word 0xb1a58960  ! 1370: FMULq	dis not found

T1_asi_reg_wr_57:
	mov	0x27, %r14
	.word 0xf8f38e40  ! 1371: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb7a80c20  ! 1372: FMOVRLZ	dis not found

	.word 0xbba509a0  ! 1373: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xb3a50940  ! 1377: FMULd	fmuld	%f20, %f0, %f56
	.word 0xb8a561bd  ! 1379: SUBcc_I	subcc 	%r21, 0x01bd, %r28
cpu_intr_1_99:
	setx	0x240225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2c4000  ! 1381: ANDN_R	andn 	%r17, %r0, %r31
	.word 0xbba00560  ! 1383: FSQRTq	fsqrt	
	.word 0xb7a81c20  ! 1385: FMOVRGEZ	dis not found

T1_asi_reg_rd_55:
	mov	0x0, %r14
	.word 0xf0db8e60  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb7a5c8c0  ! 1387: FSUBd	fsubd	%f54, %f0, %f58
	.word 0xb2b44000  ! 1388: SUBCcc_R	orncc 	%r17, %r0, %r25
T1_asi_reg_wr_58:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 1389: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb1347001  ! 1392: SRLX_I	srlx	%r17, 0x0001, %r24
T1_asi_reg_wr_59:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 1393: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5a8c820  ! 1394: FMOVL	fmovs	%fcc1, %f0, %f26
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbba81420  ! 1399: FMOVRNZ	dis not found

	.word 0xb5a90820  ! 1400: FMOVLEU	fmovs	%fcc1, %f0, %f26
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_100:
	setx	0x280002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_101:
	setx	0x290005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 1409: FMOVGE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_102:
	setx	0x2a0203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbd510000  ! 1415: RDPR_TICK	<illegal instruction>
	.word 0xb5a81c20  ! 1416: FMOVRGEZ	dis not found

	.word 0xbba80420  ! 1419: FMOVRZ	dis not found

	.word 0xbba48920  ! 1420: FMULs	fmuls	%f18, %f0, %f29
	.word 0xbda80420  ! 1423: FMOVRZ	dis not found

	.word 0xbdaac820  ! 1424: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a94820  ! 1425: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb8ad4000  ! 1426: ANDNcc_R	andncc 	%r21, %r0, %r28
	.word 0xb4950000  ! 1431: ORcc_R	orcc 	%r20, %r0, %r26
	.word 0xb551c000  ! 1432: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a98820  ! 1435: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb095c000  ! 1436: ORcc_R	orcc 	%r23, %r0, %r24
	.word 0xb5a5c9e0  ! 1440: FDIVq	dis not found

iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 3b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa00040  ! 1450: FMOVd	fmovd	%f0, %f62
cpu_intr_1_103:
	setx	0x2b0315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_104:
	setx	0x29031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 2)
	.word 0xb9a5c8a0  ! 1457: FSUBs	fsubs	%f23, %f0, %f28
cpu_intr_1_105:
	setx	0x2a0221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_106:
	setx	0x280204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_107:
	setx	0x290226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_108:
	setx	0x290028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_109:
	setx	0x280330, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_60:
	mov	0x36, %r14
	.word 0xf6f38e60  ! 1466: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbe8ce1cb  ! 1473: ANDcc_I	andcc 	%r19, 0x01cb, %r31
	.word 0xb1ab4820  ! 1474: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbba5c9e0  ! 1475: FDIVq	dis not found

	.word 0xb9a589c0  ! 1478: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xb624a1aa  ! 1480: SUB_I	sub 	%r18, 0x01aa, %r27
	.word 0xbba00520  ! 1482: FSQRTs	fsqrt	
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbb510000  ! 1484: RDPR_TICK	<illegal instruction>
	.word 0xb9641800  ! 1490: MOVcc_R	<illegal instruction>
	.word 0xb3a80420  ! 1491: FMOVRZ	dis not found

	.word 0xb5a8c820  ! 1494: FMOVL	fmovs	%fcc1, %f0, %f26
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 1)
	.word 0xbba90820  ! 1502: FMOVLEU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_56:
	mov	0x2f, %r14
	.word 0xf4db8400  ! 1503: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbc3c60de  ! 1504: XNOR_I	xnor 	%r17, 0x00de, %r30
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_110:
	setx	0x290022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4448000  ! 1510: ADDC_R	addc 	%r18, %r0, %r26
T1_asi_reg_rd_57:
	mov	0x13, %r14
	.word 0xf4db8e60  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb3a80c20  ! 1515: FMOVRLZ	dis not found

	.word 0xbfa00040  ! 1516: FMOVd	fmovd	%f0, %f62
cpu_intr_1_111:
	setx	0x290130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_112:
	setx	0x280238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 28)
	.word 0xb9a40860  ! 1526: FADDq	dis not found

cpu_intr_1_113:
	setx	0x2b0010, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_58:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 1528: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 15)
	.word 0xb49ce097  ! 1531: XORcc_I	xorcc 	%r19, 0x0097, %r26
cpu_intr_1_114:
	setx	0x2a002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_115:
	setx	0x2b0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aac820  ! 1536: FMOVGE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_116:
	setx	0x2b0023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_117:
	setx	0x2a0114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 19)
	.word 0xb7a4c940  ! 1542: FMULd	fmuld	%f50, %f0, %f58
cpu_intr_1_118:
	setx	0x2a0011, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_59:
	mov	0x0, %r14
	.word 0xfcdb8e40  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1a50940  ! 1546: FMULd	fmuld	%f20, %f0, %f24
	.word 0xbba54820  ! 1547: FADDs	fadds	%f21, %f0, %f29
T1_asi_reg_rd_60:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 1548: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1a00520  ! 1550: FSQRTs	fsqrt	
	.word 0xbb358000  ! 1553: SRL_R	srl 	%r22, %r0, %r29
T1_asi_reg_rd_61:
	mov	0x14, %r14
	.word 0xf0db89e0  ! 1556: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_119:
	setx	0x29020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00040  ! 1568: FMOVd	fmovd	%f0, %f28
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 4)
	.word 0xb5a489e0  ! 1575: FDIVq	dis not found

iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 22)
	.word 0xb5a80820  ! 1583: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_rd_62:
	mov	0x2f, %r14
	.word 0xfadb84a0  ! 1589: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_rd_63:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 1592: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_120:
	setx	0x280320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00040  ! 1595: FMOVd	fmovd	%f0, %f26
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 2)
	.word 0xb52da001  ! 1600: SLL_I	sll 	%r22, 0x0001, %r26
cpu_intr_1_121:
	setx	0x290013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994e1a7  ! 1604: WRPR_TICK_I	wrpr	%r19, 0x01a7, %tick
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 23)
	.word 0xb9a54960  ! 1607: FMULq	dis not found

	.word 0x9194a1fc  ! 1608: WRPR_PIL_I	wrpr	%r18, 0x01fc, %pil
T1_asi_reg_wr_61:
	mov	0x31, %r14
	.word 0xfcf38e60  ! 1610: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb1a4c920  ! 1612: FMULs	fmuls	%f19, %f0, %f24
	.word 0xb5aa4820  ! 1616: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb1a4c9a0  ! 1623: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xba2de18d  ! 1626: ANDN_I	andn 	%r23, 0x018d, %r29
	.word 0xb6ac8000  ! 1627: ANDNcc_R	andncc 	%r18, %r0, %r27
	.word 0xbba80420  ! 1628: FMOVRZ	dis not found

cpu_intr_1_122:
	setx	0x2a0209, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_64:
	mov	0x0, %r14
	.word 0xfadb8e80  ! 1633: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_rd_65:
	mov	0x1d, %r14
	.word 0xf0db8400  ! 1640: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_62:
	mov	0x35, %r14
	.word 0xf6f384a0  ! 1641: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb1a80820  ! 1642: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbfa9c820  ! 1646: FMOVVS	fmovs	%fcc1, %f0, %f31
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_66:
	mov	0x19, %r14
	.word 0xf2db8400  ! 1650: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_wr_63:
	mov	0x3c1, %r14
	.word 0xf6f38400  ! 1651: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_123:
	setx	0x290220, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_64:
	mov	0x18, %r14
	.word 0xf0f389e0  ! 1661: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 5)
	.word 0xb6b48000  ! 1666: ORNcc_R	orncc 	%r18, %r0, %r27
	.word 0xb3a81420  ! 1667: FMOVRNZ	dis not found

T1_asi_reg_rd_67:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 1668: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_wr_65:
	mov	0x3c5, %r14
	.word 0xf0f384a0  ! 1672: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb3a50940  ! 1673: FMULd	fmuld	%f20, %f0, %f56
	.word 0xb5a50920  ! 1675: FMULs	fmuls	%f20, %f0, %f26
	.word 0xb5a54960  ! 1679: FMULq	dis not found

T1_asi_reg_wr_66:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 1681: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb5ab4820  ! 1686: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb2adc000  ! 1688: ANDNcc_R	andncc 	%r23, %r0, %r25
cpu_intr_1_124:
	setx	0x2b0236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_125:
	setx	0x29013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a40840  ! 1694: FADDd	faddd	%f16, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_67:
	mov	0x3c3, %r14
	.word 0xfaf38e60  ! 1697: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb3a94820  ! 1700: FMOVCS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_126:
	setx	0x290020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 1703: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb7a00560  ! 1708: FSQRTq	fsqrt	
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_127:
	setx	0x290214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_128:
	setx	0x2a000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c8e0  ! 1715: FSUBq	dis not found

T1_asi_reg_rd_68:
	mov	0x2d, %r14
	.word 0xf0db84a0  ! 1718: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_129:
	setx	0x2a011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 1f)
	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_130:
	setx	0x2a0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 1728: FMOVA	fmovs	%fcc1, %f0, %f27
cpu_intr_1_131:
	setx	0x2a023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 1739: FMOVG	fmovs	%fcc1, %f0, %f26
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbfa48920  ! 1743: FMULs	fmuls	%f18, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a588a0  ! 1749: FSUBs	fsubs	%f22, %f0, %f28
T1_asi_reg_rd_69:
	mov	0x34, %r14
	.word 0xfcdb8400  ! 1750: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb8ad21f0  ! 1751: ANDNcc_I	andncc 	%r20, 0x01f0, %r28
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_132:
	setx	0x2a000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba8c820  ! 1757: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb1a488c0  ! 1758: FSUBd	fsubd	%f18, %f0, %f24
	.word 0xbba50860  ! 1759: FADDq	dis not found

cpu_intr_1_133:
	setx	0x29012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_134:
	setx	0x2a013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_135:
	setx	0x290124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_136:
	setx	0x2a0303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_68:
	mov	0x1c, %r14
	.word 0xf8f384a0  ! 1776: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_137:
	setx	0x280303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_138:
	setx	0x2a0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00520  ! 1782: FSQRTs	fsqrt	
T1_asi_reg_rd_70:
	mov	0x1c, %r14
	.word 0xf8db84a0  ! 1788: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb9abc820  ! 1791: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_139:
	setx	0x28010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_69:
	mov	0x2b, %r14
	.word 0xfcf38e80  ! 1798: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb1a80820  ! 1802: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_71:
	mov	0x14, %r14
	.word 0xfadb8e60  ! 1806: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T1_asi_reg_rd_72:
	mov	0x22, %r14
	.word 0xfcdb8e40  ! 1809: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9a00560  ! 1812: FSQRTq	fsqrt	
cpu_intr_1_140:
	setx	0x280135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40860  ! 1815: FADDq	dis not found

cpu_intr_1_141:
	setx	0x2b033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 6)
	.word 0xbda549a0  ! 1819: FDIVs	fdivs	%f21, %f0, %f30
cpu_intr_1_142:
	setx	0x280128, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_73:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_1_143:
	setx	0x28022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_70:
	mov	0xe, %r14
	.word 0xf0f38e40  ! 1828: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb5a4c8c0  ! 1829: FSUBd	fsubd	%f50, %f0, %f26
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbfa488c0  ! 1831: FSUBd	fsubd	%f18, %f0, %f62
	.word 0xb9a508e0  ! 1832: FSUBq	dis not found

	.word 0xb7a98820  ! 1834: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb3a48940  ! 1837: FMULd	fmuld	%f18, %f0, %f56
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 10)
	.word 0xb3a58940  ! 1842: FMULd	fmuld	%f22, %f0, %f56
cpu_intr_1_144:
	setx	0x29000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_wr_71:
	mov	0x1e, %r14
	.word 0xf8f38e80  ! 1852: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb5a8c820  ! 1856: FMOVL	fmovs	%fcc1, %f0, %f26
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 15)
	.word 0xbba4c840  ! 1858: FADDd	faddd	%f50, %f0, %f60
cpu_intr_1_145:
	setx	0x29021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 1863: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 1)
	.word 0xb5a5c8c0  ! 1868: FSUBd	fsubd	%f54, %f0, %f26
	.word 0xb1a50820  ! 1870: FADDs	fadds	%f20, %f0, %f24
cpu_intr_1_146:
	setx	0x280229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_147:
	setx	0x290316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb405e02f  ! 1873: ADD_I	add 	%r23, 0x002f, %r26
	.word 0xbda00540  ! 1874: FSQRTd	fsqrt	
	.word 0xbda48960  ! 1877: FMULq	dis not found

T1_asi_reg_wr_72:
	mov	0x11, %r14
	.word 0xfaf38e40  ! 1878: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_73:
	mov	0x32, %r14
	.word 0xf0f38400  ! 1885: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb1aa8820  ! 1886: FMOVG	fmovs	%fcc1, %f0, %f24
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 22)
	.word 0xbfa58860  ! 1890: FADDq	dis not found

	.word 0xb3a90820  ! 1892: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a9c820  ! 1895: FMOVVS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_148:
	setx	0x2e0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_149:
	setx	0x2c0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_74:
	mov	0x3c2, %r14
	.word 0xf8f38e60  ! 1909: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_1_150:
	setx	0x2c0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a48840  ! 1916: FADDd	faddd	%f18, %f0, %f58
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb9a00560  ! 1918: FSQRTq	fsqrt	
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_rd_74:
	mov	0x1, %r14
	.word 0xf6db89e0  ! 1921: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_wr_75:
	mov	0x9, %r14
	.word 0xf2f389e0  ! 1922: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb61de05f  ! 1930: XOR_I	xor 	%r23, 0x005f, %r27
	.word 0xb7a00560  ! 1932: FSQRTq	fsqrt	
cpu_intr_1_151:
	setx	0x2e0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 1942: FMOVRGEZ	dis not found

iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 19)
	.word 0xb5a81820  ! 1953: FMOVRGZ	fmovs	%fcc3, %f0, %f26
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_76:
	mov	0x2f, %r14
	.word 0xf4f38e40  ! 1955: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb1340000  ! 1956: SRL_R	srl 	%r16, %r0, %r24
	.word 0xb5a80820  ! 1957: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbba50840  ! 1958: FADDd	faddd	%f20, %f0, %f60
	.word 0xb1a40960  ! 1959: FMULq	dis not found

iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 38)
	.word 0xb7a488e0  ! 1964: FSUBq	dis not found

	.word 0xb1a00560  ! 1965: FSQRTq	fsqrt	
T1_asi_reg_rd_75:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 1966: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_152:
	setx	0x2f000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73ce001  ! 1973: SRA_I	sra 	%r19, 0x0001, %r27
cpu_intr_1_153:
	setx	0x2f0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a4a06a  ! 1978: SUBcc_I	subcc 	%r18, 0x006a, %r25
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 29)
	.word 0xba0421fb  ! 1981: ADD_I	add 	%r16, 0x01fb, %r29
cpu_intr_1_154:
	setx	0x2d0304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 7)
	.word 0xbda44860  ! 1990: FADDq	dis not found

	.word 0xbc9c0000  ! 1992: XORcc_R	xorcc 	%r16, %r0, %r30
T1_asi_reg_wr_77:
	mov	0x14, %r14
	.word 0xf2f38e40  ! 1993: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3a84820  ! 1994: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb9a5c9a0  ! 1995: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xb1a80420  ! 1996: FMOVRZ	dis not found

	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb3a98820  ! 1999: FMOVNEG	fmovs	%fcc1, %f0, %f25
cpu_intr_1_155:
	setx	0x2e0135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_156:
	setx	0x2d0139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_78:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 2005: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb7aac820  ! 2006: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb605a089  ! 2009: ADD_I	add 	%r22, 0x0089, %r27
	.word 0xb2840000  ! 2010: ADDcc_R	addcc 	%r16, %r0, %r25
	.word 0xbfa81820  ! 2011: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb1a84820  ! 2013: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_79:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 2014: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_157:
	setx	0x2c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_80:
	mov	0x35, %r14
	.word 0xf0f389e0  ! 2019: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_158:
	setx	0x2d0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 6)
	.word 0xbf34f001  ! 2024: SRLX_I	srlx	%r19, 0x0001, %r31
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_81:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 2028: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbb2d1000  ! 2029: SLLX_R	sllx	%r20, %r0, %r29
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 21)
	.word 0xb7a44840  ! 2035: FADDd	faddd	%f48, %f0, %f58
cpu_intr_1_159:
	setx	0x2c020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a44860  ! 2039: FADDq	dis not found

	.word 0xb3a548e0  ! 2044: FSUBq	dis not found

	.word 0xb3a449a0  ! 2048: FDIVs	fdivs	%f17, %f0, %f25
T1_asi_reg_rd_76:
	mov	0x21, %r14
	.word 0xf4db84a0  ! 2050: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb5a9c820  ! 2054: FMOVVS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_77:
	mov	0x2e, %r14
	.word 0xf2db8e40  ! 2056: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfab0820  ! 2057: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xbda509a0  ! 2058: FDIVs	fdivs	%f20, %f0, %f30
T1_asi_reg_wr_82:
	mov	0x2, %r14
	.word 0xf8f384a0  ! 2061: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_160:
	setx	0x2f0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 2064: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0x9195215b  ! 2065: WRPR_PIL_I	wrpr	%r20, 0x015b, %pil
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_78:
	mov	0x13, %r14
	.word 0xf4db8400  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb17ca401  ! 2071: MOVR_I	movre	%r18, 0x1, %r24
	.word 0xb17d2401  ! 2072: MOVR_I	movre	%r20, 0x1, %r24
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_rd_79:
	mov	0x1c, %r14
	.word 0xf2db8e60  ! 2077: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbba00560  ! 2084: FSQRTq	fsqrt	
T1_asi_reg_rd_80:
	mov	0x2c, %r14
	.word 0xfadb8400  ! 2085: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_1_161:
	setx	0x2c0300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_162:
	setx	0x2d0318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_163:
	setx	0x2c0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa50820  ! 2093: FADDs	fadds	%f20, %f0, %f31
	.word 0xbfa5c940  ! 2094: FMULd	fmuld	%f54, %f0, %f62
cpu_intr_1_164:
	setx	0x2d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a8c820  ! 2096: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbba80820  ! 2097: FMOVN	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_83:
	mov	0xf, %r14
	.word 0xf2f38e40  ! 2099: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbda54940  ! 2101: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb5a40860  ! 2103: FADDq	dis not found

cpu_intr_1_165:
	setx	0x2f0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 2105: RDPR_PIL	<illegal instruction>
cpu_intr_1_166:
	setx	0x2e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_84:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 2108: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5a40860  ! 2110: FADDq	dis not found

	.word 0xbbab4820  ! 2111: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb3a5c920  ! 2112: FMULs	fmuls	%f23, %f0, %f25
T1_asi_reg_rd_81:
	mov	0x3c8, %r14
	.word 0xf8db8400  ! 2113: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbdaa0820  ! 2114: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbda58860  ! 2115: FADDq	dis not found

cpu_intr_1_167:
	setx	0x2d0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba589e0  ! 2121: FDIVq	dis not found

cpu_intr_1_168:
	setx	0x2c0000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 23)
	.word 0xb7a589e0  ! 2128: FDIVq	dis not found

	.word 0xbda588c0  ! 2129: FSUBd	fsubd	%f22, %f0, %f30
cpu_intr_1_169:
	setx	0x2e010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec44000  ! 2137: ADDCcc_R	addccc 	%r17, %r0, %r31
	.word 0xb9a5c8a0  ! 2140: FSUBs	fsubs	%f23, %f0, %f28
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_wr_85:
	mov	0x1c, %r14
	.word 0xfef38400  ! 2144: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_170:
	setx	0x2c0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 2154: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a80820  ! 2155: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 27)
	.word 0xbba54820  ! 2159: FADDs	fadds	%f21, %f0, %f29
T1_asi_reg_wr_86:
	mov	0x20, %r14
	.word 0xfaf38e40  ! 2160: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9a8c820  ! 2161: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb5a81420  ! 2162: FMOVRNZ	dis not found

cpu_intr_1_171:
	setx	0x2f0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40860  ! 2165: FADDq	dis not found

	.word 0x8594e17c  ! 2166: WRPR_TSTATE_I	wrpr	%r19, 0x017c, %tstate
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 15)
	.word 0xb7a48940  ! 2170: FMULd	fmuld	%f18, %f0, %f58
	.word 0xb2bca0e8  ! 2171: XNORcc_I	xnorcc 	%r18, 0x00e8, %r25
T1_asi_reg_wr_87:
	mov	0x16, %r14
	.word 0xf0f38e40  ! 2174: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_88:
	mov	0x26, %r14
	.word 0xf0f38e40  ! 2179: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_89:
	mov	0xf, %r14
	.word 0xf8f38e40  ! 2180: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_172:
	setx	0x2f031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba88820  ! 2185: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbba589c0  ! 2186: FDIVd	fdivd	%f22, %f0, %f60
	.word 0xb9a98820  ! 2188: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbda98820  ! 2189: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbba80820  ! 2191: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb3a408c0  ! 2192: FSUBd	fsubd	%f16, %f0, %f56
cpu_intr_1_173:
	setx	0x2c000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 18)
	.word 0xbba5c9c0  ! 2198: FDIVd	fdivd	%f54, %f0, %f60
	.word 0xbba9c820  ! 2200: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb6144000  ! 2205: OR_R	or 	%r17, %r0, %r27
	.word 0xb5a8c820  ! 2206: FMOVL	fmovs	%fcc1, %f0, %f26
cpu_intr_1_174:
	setx	0x2c0138, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_82:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 2211: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3a548a0  ! 2214: FSUBs	fsubs	%f21, %f0, %f25
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_rd_83:
	mov	0xa, %r14
	.word 0xfcdb84a0  ! 2219: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_wr_90:
	mov	0x14, %r14
	.word 0xfcf38e80  ! 2220: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_175:
	setx	0x2c023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81420  ! 2223: FMOVRNZ	dis not found

iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, b)
	.word 0x8f902002  ! 2238: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_176:
	setx	0x2d0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_84:
	mov	0x28, %r14
	.word 0xfcdb84a0  ! 2244: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba448a0  ! 2247: FSUBs	fsubs	%f17, %f0, %f29
	.word 0xbda5c960  ! 2248: FMULq	dis not found

	.word 0xbfa50820  ! 2249: FADDs	fadds	%f20, %f0, %f31
	.word 0xba2c216b  ! 2250: ANDN_I	andn 	%r16, 0x016b, %r29
	.word 0xbbabc820  ! 2257: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb1a549a0  ! 2258: FDIVs	fdivs	%f21, %f0, %f24
	.word 0xb5a8c820  ! 2261: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbbaa0820  ! 2262: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbba509c0  ! 2266: FDIVd	fdivd	%f20, %f0, %f60
cpu_intr_1_177:
	setx	0x2f000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_178:
	setx	0x2c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_179:
	setx	0x2f0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 2283: RDPR_TNPC	<illegal instruction>
	.word 0xb405a073  ! 2286: ADD_I	add 	%r22, 0x0073, %r26
	.word 0xb3a448e0  ! 2287: FSUBq	dis not found

	.word 0xb3a00540  ! 2296: FSQRTd	fsqrt	
	.word 0xbbab8820  ! 2300: FMOVPOS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_91:
	mov	0x14, %r14
	.word 0xf2f384a0  ! 2305: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb3a5c920  ! 2310: FMULs	fmuls	%f23, %f0, %f25
	.word 0xbba88820  ! 2317: FMOVLE	fmovs	%fcc1, %f0, %f29
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_rd_85:
	mov	0xc, %r14
	.word 0xfadb8e60  ! 2322: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb3a80820  ! 2323: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbbaa8820  ! 2324: FMOVG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_92:
	mov	0x2, %r14
	.word 0xf0f38e40  ! 2325: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_180:
	setx	0x2d033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 2327: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb8b50000  ! 2328: ORNcc_R	orncc 	%r20, %r0, %r28
	.word 0xb9a80820  ! 2329: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbda44860  ! 2333: FADDq	dis not found

	.word 0xb0a56071  ! 2334: SUBcc_I	subcc 	%r21, 0x0071, %r24
	.word 0xb73da001  ! 2335: SRA_I	sra 	%r22, 0x0001, %r27
	.word 0xbfa5c9a0  ! 2336: FDIVs	fdivs	%f23, %f0, %f31
T1_asi_reg_wr_93:
	mov	0x1a, %r14
	.word 0xf6f38400  ! 2343: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 37)
	.word 0xbda4c920  ! 2353: FMULs	fmuls	%f19, %f0, %f30
	.word 0xb7a489e0  ! 2354: FDIVq	dis not found

cpu_intr_1_181:
	setx	0x330316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c840  ! 2358: FADDd	faddd	%f50, %f0, %f26
cpu_intr_1_182:
	setx	0x330301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa4820  ! 2366: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbfa408e0  ! 2369: FSUBq	dis not found

T1_asi_reg_wr_94:
	mov	0x2b, %r14
	.word 0xf6f38e60  ! 2375: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbabd2104  ! 2379: XNORcc_I	xnorcc 	%r20, 0x0104, %r29
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_183:
	setx	0x33020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_86:
	mov	0x7, %r14
	.word 0xf0db8400  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbd2d9000  ! 2390: SLLX_R	sllx	%r22, %r0, %r30
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_87:
	mov	0x33, %r14
	.word 0xfcdb8e80  ! 2393: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_wr_95:
	mov	0x1d, %r14
	.word 0xf2f38e80  ! 2399: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb3a90820  ! 2401: FMOVLEU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_88:
	mov	0x2b, %r14
	.word 0xfedb89e0  ! 2405: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_89:
	mov	0x25, %r14
	.word 0xfedb8e40  ! 2407: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb204a054  ! 2408: ADD_I	add 	%r18, 0x0054, %r25
T1_asi_reg_rd_90:
	mov	0x33, %r14
	.word 0xf4db8e80  ! 2409: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_184:
	setx	0x32022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 2414: FMOVLEU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_91:
	mov	0x18, %r14
	.word 0xf0db89e0  ! 2415: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbe0dc000  ! 2416: AND_R	and 	%r23, %r0, %r31
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 25)
	.word 0xbe8d0000  ! 2420: ANDcc_R	andcc 	%r20, %r0, %r31
T1_asi_reg_wr_96:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 2421: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbda54820  ! 2422: FADDs	fadds	%f21, %f0, %f30
	.word 0xb1a5c8c0  ! 2423: FSUBd	fsubd	%f54, %f0, %f24
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 20)
	.word 0xb7a409e0  ! 2426: FDIVq	dis not found

	.word 0xbba80820  ! 2427: FMOVN	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_97:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 2428: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb1abc820  ! 2429: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_92:
	mov	0x32, %r14
	.word 0xf0db8e40  ! 2431: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbba00040  ! 2432: FMOVd	fmovd	%f0, %f60
	.word 0xbfa54960  ! 2433: FMULq	dis not found

cpu_intr_1_185:
	setx	0x33001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6848000  ! 2440: ADDcc_R	addcc 	%r18, %r0, %r27
	.word 0xb5a5c940  ! 2443: FMULd	fmuld	%f54, %f0, %f26
	.word 0xb9a00560  ! 2444: FSQRTq	fsqrt	
	.word 0xb1abc820  ! 2447: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_93:
	mov	0x31, %r14
	.word 0xfadb8e80  ! 2451: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_wr_98:
	mov	0x24, %r14
	.word 0xf2f38e60  ! 2452: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_186:
	setx	0x310223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb7a589a0  ! 2458: FDIVs	fdivs	%f22, %f0, %f27
T1_asi_reg_rd_94:
	mov	0x36, %r14
	.word 0xf8db8e40  ! 2461: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_187:
	setx	0x330331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_188:
	setx	0x310317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_99:
	mov	0x21, %r14
	.word 0xfaf38e40  ! 2471: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbba80c20  ! 2472: FMOVRLZ	dis not found

	.word 0xb3aa0820  ! 2473: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb3a00040  ! 2477: FMOVd	fmovd	%f0, %f56
T1_asi_reg_rd_95:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 2478: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbdaac820  ! 2481: FMOVGE	fmovs	%fcc1, %f0, %f30
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9aac820  ! 2485: FMOVGE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_189:
	setx	0x320013, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_100:
	mov	0x8, %r14
	.word 0xf6f389e0  ! 2487: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_96:
	mov	0x18, %r14
	.word 0xf8db8e80  ! 2489: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb7ab8820  ! 2491: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a8c820  ! 2492: FMOVL	fmovs	%fcc1, %f0, %f28
cpu_intr_1_190:
	setx	0x32002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba449c0  ! 2494: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xb61da18b  ! 2495: XOR_I	xor 	%r22, 0x018b, %r27
	.word 0xb7a80c20  ! 2496: FMOVRLZ	dis not found

T1_asi_reg_rd_97:
	mov	0x1a, %r14
	.word 0xf2db8e80  ! 2498: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_rd_98:
	mov	0x5, %r14
	.word 0xf6db8e40  ! 2501: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9a00560  ! 2502: FSQRTq	fsqrt	
	.word 0xb8140000  ! 2503: OR_R	or 	%r16, %r0, %r28
	.word 0xbba549c0  ! 2504: FDIVd	fdivd	%f52, %f0, %f60
	.word 0xb9a54920  ! 2506: FMULs	fmuls	%f21, %f0, %f28
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_wr_101:
	mov	0x19, %r14
	.word 0xf6f389e0  ! 2513: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_wr_102:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 2516: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb5a9c820  ! 2517: FMOVVS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_191:
	setx	0x310216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 2527: RDPR_TICK	<illegal instruction>
T1_asi_reg_rd_99:
	mov	0x3c6, %r14
	.word 0xfcdb89e0  ! 2529: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb7a00520  ! 2531: FSQRTs	fsqrt	
	.word 0xbfa509c0  ! 2532: FDIVd	fdivd	%f20, %f0, %f62
	.word 0xb1a9c820  ! 2535: FMOVVS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_100:
	mov	0xc, %r14
	.word 0xf4db8e40  ! 2537: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0x8394a106  ! 2540: WRPR_TNPC_I	wrpr	%r18, 0x0106, %tnpc
	.word 0xbba448a0  ! 2542: FSUBs	fsubs	%f17, %f0, %f29
	.word 0xbdaa0820  ! 2550: FMOVA	fmovs	%fcc1, %f0, %f30
cpu_intr_1_192:
	setx	0x32030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9dc000  ! 2554: XORcc_R	xorcc 	%r23, %r0, %r30
cpu_intr_1_193:
	setx	0x300207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, f)
	.word 0x81942158  ! 2561: WRPR_TPC_I	wrpr	%r16, 0x0158, %tpc
	.word 0xb9a00560  ! 2562: FSQRTq	fsqrt	
cpu_intr_1_194:
	setx	0x320021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09d6025  ! 2566: XORcc_I	xorcc 	%r21, 0x0025, %r24
T1_asi_reg_rd_101:
	mov	0x11, %r14
	.word 0xf8db89e0  ! 2567: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_1_195:
	setx	0x30013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a9c820  ! 2570: FMOVVS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_196:
	setx	0x300328, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_103:
	mov	0x17, %r14
	.word 0xf2f38e40  ! 2574: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb245e1f6  ! 2577: ADDC_I	addc 	%r23, 0x01f6, %r25
	.word 0xbbab0820  ! 2578: FMOVGU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_197:
	setx	0x330205, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_104:
	mov	0x3c5, %r14
	.word 0xfef38e60  ! 2582: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb7a90820  ! 2583: FMOVLEU	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a4c920  ! 2590: FMULs	fmuls	%f19, %f0, %f27
	.word 0xb3a449c0  ! 2591: FDIVd	fdivd	%f48, %f0, %f56
T1_asi_reg_rd_102:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 2593: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 37)
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_103:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 2600: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbba80c20  ! 2602: FMOVRLZ	dis not found

T1_asi_reg_wr_105:
	mov	0x1, %r14
	.word 0xf0f389e0  ! 2604: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_rd_104:
	mov	0x19, %r14
	.word 0xf0db84a0  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb5a4c820  ! 2608: FADDs	fadds	%f19, %f0, %f26
T1_asi_reg_wr_106:
	mov	0x25, %r14
	.word 0xf0f38e40  ! 2609: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbda80820  ! 2612: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 19)
	.word 0xbfab4820  ! 2617: FMOVCC	fmovs	%fcc1, %f0, %f31
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb7a81420  ! 2619: FMOVRNZ	dis not found

cpu_intr_1_198:
	setx	0x330010, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_107:
	mov	0x2f, %r14
	.word 0xf0f38e60  ! 2622: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_1_199:
	setx	0x330302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 0)
	.word 0xbcb40000  ! 2632: SUBCcc_R	orncc 	%r16, %r0, %r30
	.word 0xb7a44920  ! 2633: FMULs	fmuls	%f17, %f0, %f27
T1_asi_reg_rd_105:
	mov	0x27, %r14
	.word 0xf6db8e60  ! 2635: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb5a50860  ! 2637: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_106:
	mov	0x3c6, %r14
	.word 0xf4db8400  ! 2644: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb6b58000  ! 2645: ORNcc_R	orncc 	%r22, %r0, %r27
cpu_intr_1_200:
	setx	0x310105, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_108:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 2652: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_107:
	mov	0x10, %r14
	.word 0xf4db84a0  ! 2653: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb9a4c8c0  ! 2654: FSUBd	fsubd	%f50, %f0, %f28
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 31)
	.word 0xb6158000  ! 2657: OR_R	or 	%r22, %r0, %r27
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_wr_109:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 2661: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_201:
	setx	0x310226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_202:
	setx	0x330137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 22)
	.word 0x8f902000  ! 2665: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_110:
	mov	0x6, %r14
	.word 0xfef38e60  ! 2673: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbba8c820  ! 2676: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb7a90820  ! 2678: FMOVLEU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_203:
	setx	0x31012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 2683: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb29da017  ! 2684: XORcc_I	xorcc 	%r22, 0x0017, %r25
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_204:
	setx	0x31013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_111:
	mov	0x35, %r14
	.word 0xfcf38e60  ! 2689: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T1_asi_reg_wr_112:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 2690: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb5a00520  ! 2695: FSQRTs	fsqrt	
	.word 0xbba5c8a0  ! 2696: FSUBs	fsubs	%f23, %f0, %f29
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 39)
	.word 0xb1aa4820  ! 2703: FMOVNE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_108:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 2707: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_205:
	setx	0x31000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 8)
	.word 0xb8ace1d6  ! 2714: ANDNcc_I	andncc 	%r19, 0x01d6, %r28
T1_asi_reg_wr_113:
	mov	0x26, %r14
	.word 0xf8f38e60  ! 2717: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 7)
	.word 0xb3abc820  ! 2721: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb62c4000  ! 2723: ANDN_R	andn 	%r17, %r0, %r27
	.word 0xb5a54960  ! 2727: FMULq	dis not found

	.word 0xbe9d0000  ! 2728: XORcc_R	xorcc 	%r20, %r0, %r31
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, f)
	.word 0xb0c48000  ! 2734: ADDCcc_R	addccc 	%r18, %r0, %r24
	.word 0xb7a80c20  ! 2742: FMOVRLZ	dis not found

T1_asi_reg_wr_114:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 2744: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3a80420  ! 2745: FMOVRZ	dis not found

T1_asi_reg_rd_109:
	mov	0x1, %r14
	.word 0xf6db84a0  ! 2747: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbba548c0  ! 2750: FSUBd	fsubd	%f52, %f0, %f60
cpu_intr_1_206:
	setx	0x320031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 26)
	.word 0xbfa94820  ! 2755: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb33d3001  ! 2756: SRAX_I	srax	%r20, 0x0001, %r25
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb1a8c820  ! 2762: FMOVL	fmovs	%fcc1, %f0, %f24
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_207:
	setx	0x30010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_110:
	mov	0x3c3, %r14
	.word 0xf4db89e0  ! 2768: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb1a00040  ! 2769: FMOVd	fmovd	%f0, %f24
T1_asi_reg_wr_115:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 2771: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_208:
	setx	0x330123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a548a0  ! 2773: FSUBs	fsubs	%f21, %f0, %f25
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 39)
	.word 0xbf3ce001  ! 2781: SRA_I	sra 	%r19, 0x0001, %r31
	.word 0xb5a80420  ! 2783: FMOVRZ	dis not found

	.word 0xbd7cc400  ! 2787: MOVR_R	movre	%r19, %r0, %r30
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 22)
	.word 0xb3aa4820  ! 2794: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb3a509a0  ! 2795: FDIVs	fdivs	%f20, %f0, %f25
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, a)
	.word 0xb5a50940  ! 2800: FMULd	fmuld	%f20, %f0, %f26
T1_asi_reg_rd_111:
	mov	0x18, %r14
	.word 0xfadb8e40  ! 2802: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb024618a  ! 2806: SUB_I	sub 	%r17, 0x018a, %r24
cpu_intr_1_209:
	setx	0x34012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2cf001  ! 2809: SLLX_I	sllx	%r19, 0x0001, %r31
	.word 0xb7a5c920  ! 2810: FMULs	fmuls	%f23, %f0, %f27
	.word 0xb1a80820  ! 2811: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbfa4c8c0  ! 2816: FSUBd	fsubd	%f50, %f0, %f62
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 27)
	.word 0xbfa5c9e0  ! 2818: FDIVq	dis not found

cpu_intr_1_210:
	setx	0x350136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 4)
	.word 0xb1a449e0  ! 2825: FDIVq	dis not found

	.word 0xb68d4000  ! 2827: ANDcc_R	andcc 	%r21, %r0, %r27
	.word 0xb62da1e1  ! 2828: ANDN_I	andn 	%r22, 0x01e1, %r27
cpu_intr_1_211:
	setx	0x340231, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_112:
	mov	0xd, %r14
	.word 0xf2db84a0  ! 2830: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T1_asi_reg_rd_113:
	mov	0x3c6, %r14
	.word 0xf4db89e0  ! 2831: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_rd_114:
	mov	0x28, %r14
	.word 0xf2db8e40  ! 2833: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb9a44940  ! 2839: FMULd	fmuld	%f48, %f0, %f28
T1_asi_reg_wr_116:
	mov	0x5, %r14
	.word 0xf8f384a0  ! 2840: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_212:
	setx	0x35021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a408e0  ! 2845: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba4c820  ! 2848: FADDs	fadds	%f19, %f0, %f29
	.word 0xba0561ed  ! 2850: ADD_I	add 	%r21, 0x01ed, %r29
	.word 0xb9a00560  ! 2852: FSQRTq	fsqrt	
	.word 0xb5abc820  ! 2853: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb9a48820  ! 2855: FADDs	fadds	%f18, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 0)
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb7a00040  ! 2861: FMOVd	fmovd	%f0, %f58
	.word 0xbeb40000  ! 2863: ORNcc_R	orncc 	%r16, %r0, %r31
	.word 0xbfa589e0  ! 2866: FDIVq	dis not found

	.word 0xbd2d0000  ! 2868: SLL_R	sll 	%r20, %r0, %r30
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
	.word 0xbebd0000  ! 2876: XNORcc_R	xnorcc 	%r20, %r0, %r31
	.word 0xb3a00560  ! 2877: FSQRTq	fsqrt	
	.word 0xbba00040  ! 2880: FMOVd	fmovd	%f0, %f60
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 31)
	.word 0xbba40860  ! 2885: FADDq	dis not found

	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbaac61d5  ! 2888: ANDNcc_I	andncc 	%r17, 0x01d5, %r29
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, a)
	.word 0xb9a8c820  ! 2891: FMOVL	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_117:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 2895: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1a448a0  ! 2898: FSUBs	fsubs	%f17, %f0, %f24
cpu_intr_1_213:
	setx	0x350038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a8c820  ! 2900: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbda448c0  ! 2902: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xbfa488a0  ! 2903: FSUBs	fsubs	%f18, %f0, %f31
T1_asi_reg_wr_118:
	mov	0x20, %r14
	.word 0xf2f389e0  ! 2905: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_214:
	setx	0x36021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda408e0  ! 2911: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_215:
	setx	0x350026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba45a113  ! 2919: ADDC_I	addc 	%r22, 0x0113, %r29
cpu_intr_1_216:
	setx	0x340233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_217:
	setx	0x35012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_218:
	setx	0x350300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92d6001  ! 2925: SLL_I	sll 	%r21, 0x0001, %r28
	.word 0xb1a00560  ! 2927: FSQRTq	fsqrt	
T1_asi_reg_wr_119:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 2929: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbfa589e0  ! 2930: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 10)
	.word 0xb7a409a0  ! 2937: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb5a4c860  ! 2939: FADDq	dis not found

iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 7)
	.word 0xbda548a0  ! 2941: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xbbaac820  ! 2942: FMOVGE	fmovs	%fcc1, %f0, %f29
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb3a00540  ! 2946: FSQRTd	fsqrt	
	.word 0xb3a4c9c0  ! 2947: FDIVd	fdivd	%f50, %f0, %f56
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb5a90820  ! 2950: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb9a80820  ! 2951: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb5ab0820  ! 2953: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb5a4c940  ! 2955: FMULd	fmuld	%f50, %f0, %f26
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_219:
	setx	0x370239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_220:
	setx	0x340227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_221:
	setx	0x37033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda588c0  ! 2964: FSUBd	fsubd	%f22, %f0, %f30
cpu_intr_1_222:
	setx	0x37002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_223:
	setx	0x340118, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_115:
	mov	0x29, %r14
	.word 0xf6db8e40  ! 2968: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_224:
	setx	0x350339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa4820  ! 2972: FMOVNE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_225:
	setx	0x350202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93c4000  ! 2974: SRA_R	sra 	%r17, %r0, %r28
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_226:
	setx	0x370012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 2989: FMOVL	fmovs	%fcc1, %f0, %f25
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 10)
	.word 0xb9abc820  ! 2993: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_227:
	setx	0x350213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81c20  ! 2995: FMOVRGEZ	dis not found

	.word 0xbfa408c0  ! 2996: FSUBd	fsubd	%f16, %f0, %f62
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 18)
	.word 0xb5a94820  ! 2998: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb83ca1cd  ! 3000: XNOR_I	xnor 	%r18, 0x01cd, %r28
	.word 0xbfa44940  ! 3002: FMULd	fmuld	%f48, %f0, %f62
	.word 0xb9a80420  ! 3006: FMOVRZ	dis not found

T1_asi_reg_wr_120:
	mov	0x7, %r14
	.word 0xfcf38e60  ! 3008: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbda00560  ! 3010: FSQRTq	fsqrt	
	.word 0xb1a98820  ! 3011: FMOVNEG	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a40960  ! 3019: FMULq	dis not found

	.word 0xb53ce001  ! 3020: SRA_I	sra 	%r19, 0x0001, %r26
T1_asi_reg_wr_121:
	mov	0x3c3, %r14
	.word 0xf4f389e0  ! 3025: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_228:
	setx	0x340032, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 19)
	.word 0xbb2ce001  ! 3036: SLL_I	sll 	%r19, 0x0001, %r29
T1_asi_reg_rd_116:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 3038: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_117:
	mov	0x24, %r14
	.word 0xf2db89e0  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_1_229:
	setx	0x35012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9abc820  ! 3046: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb9a8c820  ! 3047: FMOVL	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_118:
	mov	0x33, %r14
	.word 0xfadb84a0  ! 3051: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 29)
	.word 0xb5a54920  ! 3054: FMULs	fmuls	%f21, %f0, %f26
	.word 0xbba54840  ! 3060: FADDd	faddd	%f52, %f0, %f60
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_230:
	setx	0x35020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c9c0  ! 3068: FDIVd	fdivd	%f54, %f0, %f28
T1_asi_reg_rd_119:
	mov	0x23, %r14
	.word 0xf6db8e40  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9a4c8a0  ! 3072: FSUBs	fsubs	%f19, %f0, %f28
	.word 0xbda00540  ! 3074: FSQRTd	fsqrt	
	.word 0xb1a449e0  ! 3075: FDIVq	dis not found

cpu_intr_1_231:
	setx	0x340027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba549c0  ! 3081: FDIVd	fdivd	%f52, %f0, %f60
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_232:
	setx	0x340236, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_120:
	mov	0x25, %r14
	.word 0xfadb8e40  ! 3088: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_122:
	mov	0x35, %r14
	.word 0xfaf384a0  ! 3096: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_233:
	setx	0x350339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c8e0  ! 3098: FSUBq	dis not found

	.word 0xbc956125  ! 3101: ORcc_I	orcc 	%r21, 0x0125, %r30
	.word 0xb4954000  ! 3102: ORcc_R	orcc 	%r21, %r0, %r26
	.word 0xb295a188  ! 3103: ORcc_I	orcc 	%r22, 0x0188, %r25
T1_asi_reg_rd_121:
	mov	0x1, %r14
	.word 0xf6db8e40  ! 3107: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbda50860  ! 3108: FADDq	dis not found

cpu_intr_1_234:
	setx	0x350106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6954000  ! 3112: ORcc_R	orcc 	%r21, %r0, %r27
cpu_intr_1_235:
	setx	0x350010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc044000  ! 3116: ADD_R	add 	%r17, %r0, %r30
	.word 0xb644e12d  ! 3117: ADDC_I	addc 	%r19, 0x012d, %r27
cpu_intr_1_236:
	setx	0x36012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 3121: FMOVRZ	dis not found

	lda	[%r17 + %g0] 0xf0, %f2
T1_asi_reg_rd_122:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 3124: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb63ce064  ! 3125: XNOR_I	xnor 	%r19, 0x0064, %r27
T1_asi_reg_wr_123:
	mov	0x3c5, %r14
	.word 0xf4f38400  ! 3126: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb7a80c20  ! 3129: FMOVRLZ	dis not found

	.word 0xb1a588a0  ! 3130: FSUBs	fsubs	%f22, %f0, %f24
cpu_intr_1_237:
	setx	0x370215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_123:
	mov	0x2d, %r14
	.word 0xfcdb8e40  ! 3135: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 4)
	.word 0xbfaa4820  ! 3143: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a48860  ! 3144: FADDq	dis not found

	.word 0xb7a54920  ! 3145: FMULs	fmuls	%f21, %f0, %f27
T1_asi_reg_rd_124:
	mov	0x4, %r14
	.word 0xf4db8400  ! 3150: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_238:
	setx	0x35002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_124:
	mov	0x16, %r14
	.word 0xfaf38e40  ! 3157: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_125:
	mov	0x21, %r14
	.word 0xf2f38e80  ! 3159: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_rd_125:
	mov	0x2f, %r14
	.word 0xfadb8e60  ! 3160: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb3a5c8a0  ! 3166: FSUBs	fsubs	%f23, %f0, %f25
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 3f)
	.word 0x8f902000  ! 3170: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb8ace0d4  ! 3171: ANDNcc_I	andncc 	%r19, 0x00d4, %r28
cpu_intr_1_239:
	setx	0x340222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba84820  ! 3177: FMOVE	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a5c820  ! 3180: FADDs	fadds	%f23, %f0, %f25
cpu_intr_1_240:
	setx	0x360231, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_126:
	mov	0x29, %r14
	.word 0xf4db8e40  ! 3184: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb845a00d  ! 3186: ADDC_I	addc 	%r22, 0x000d, %r28
T1_asi_reg_wr_126:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 3190: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbb520000  ! 3191: RDPR_PIL	<illegal instruction>
cpu_intr_1_241:
	setx	0x370037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c8e0  ! 3194: FSUBq	dis not found

	.word 0xbda98820  ! 3197: FMOVNEG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_127:
	mov	0x13, %r14
	.word 0xfaf38e80  ! 3203: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_127:
	mov	0x32, %r14
	.word 0xf2db8e40  ! 3205: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 38)
	.word 0xb7a5c8c0  ! 3208: FSUBd	fsubd	%f54, %f0, %f58
	.word 0xb1abc820  ! 3209: FMOVVC	fmovs	%fcc1, %f0, %f24
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 21)
	.word 0xb8b50000  ! 3211: SUBCcc_R	orncc 	%r20, %r0, %r28
	.word 0xbba81820  ! 3213: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb5a88820  ! 3214: FMOVLE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_242:
	setx	0x370214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_243:
	setx	0x340231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_244:
	setx	0x350016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a98820  ! 3223: FMOVNEG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_128:
	mov	0x20, %r14
	.word 0xf6f38e80  ! 3225: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_rd_128:
	mov	0x23, %r14
	.word 0xf8db8e80  ! 3226: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbbaa0820  ! 3238: FMOVA	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_129:
	mov	0x1d, %r14
	.word 0xf2f38e80  ! 3239: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbfa40940  ! 3240: FMULd	fmuld	%f16, %f0, %f62
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_130:
	mov	0x22, %r14
	.word 0xf0f384a0  ! 3245: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_245:
	setx	0x3a0321, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_131:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 3247: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 31)
	.word 0xb32db001  ! 3249: SLLX_I	sllx	%r22, 0x0001, %r25
cpu_intr_1_246:
	setx	0x3b011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 3251: FMOVVC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_247:
	setx	0x38012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9a00560  ! 3254: FSQRTq	fsqrt	
T1_asi_reg_rd_129:
	mov	0x3c7, %r14
	.word 0xfedb8e80  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbfa44920  ! 3260: FMULs	fmuls	%f17, %f0, %f31
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb4acc000  ! 3263: ANDNcc_R	andncc 	%r19, %r0, %r26
	.word 0xb29ca01e  ! 3264: XORcc_I	xorcc 	%r18, 0x001e, %r25
cpu_intr_1_248:
	setx	0x38002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c9a0  ! 3267: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xb9a4c8e0  ! 3268: FSUBq	dis not found

cpu_intr_1_249:
	setx	0x390009, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_130:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 3274: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_250:
	setx	0x39001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_131:
	mov	0x20, %r14
	.word 0xfadb8e60  ! 3277: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_251:
	setx	0x390211, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_132:
	mov	0x27, %r14
	.word 0xf2f384a0  ! 3281: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, e)
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_wr_133:
	mov	0x28, %r14
	.word 0xf4f38e40  ! 3286: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_132:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 3287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_252:
	setx	0x3b0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a58920  ! 3290: FMULs	fmuls	%f22, %f0, %f27
	.word 0xb9a44960  ! 3291: FMULq	dis not found

iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 16)
	.word 0xb9a84820  ! 3296: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb1500000  ! 3298: RDPR_TPC	<illegal instruction>
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_133:
	mov	0x9, %r14
	.word 0xf8db8e40  ! 3307: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 25)
	.word 0xb9a80420  ! 3315: FMOVRZ	dis not found

	.word 0xb5a00520  ! 3318: FSQRTs	fsqrt	
	.word 0xb9518000  ! 3323: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a44920  ! 3326: FMULs	fmuls	%f17, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_134:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 3328: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbcac20f1  ! 3330: ANDNcc_I	andncc 	%r16, 0x00f1, %r30
	.word 0xbba4c860  ! 3334: FADDq	dis not found

	.word 0xb42d206d  ! 3339: ANDN_I	andn 	%r20, 0x006d, %r26
	.word 0xb9a54920  ! 3340: FMULs	fmuls	%f21, %f0, %f28
	.word 0xb1a94820  ! 3343: FMOVCS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_253:
	setx	0x3b0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21c8000  ! 3345: XOR_R	xor 	%r18, %r0, %r25
	.word 0xb1a40840  ! 3349: FADDd	faddd	%f16, %f0, %f24
	.word 0xb5a448e0  ! 3350: FSUBq	dis not found

T1_asi_reg_wr_135:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 3351: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_254:
	setx	0x380320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 3353: FMOVCS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_255:
	setx	0x3b020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 3355: FMOVRGEZ	dis not found

	.word 0xbb50c000  ! 3359: RDPR_TT	<illegal instruction>
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_256:
	setx	0x390312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 3364: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbdaa0820  ! 3368: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbba58840  ! 3373: FADDd	faddd	%f22, %f0, %f60
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_257:
	setx	0x390308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bc0000  ! 3377: XNORcc_R	xnorcc 	%r16, %r0, %r27
	.word 0xb8b4e0b5  ! 3379: SUBCcc_I	orncc 	%r19, 0x00b5, %r28
	.word 0xb9a489e0  ! 3380: FDIVq	dis not found

	.word 0xbba4c8c0  ! 3382: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xb3a589c0  ! 3383: FDIVd	fdivd	%f22, %f0, %f56
T1_asi_reg_rd_134:
	mov	0x22, %r14
	.word 0xfcdb8400  ! 3384: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbda81c20  ! 3389: FMOVRGEZ	dis not found

	.word 0xbdaa0820  ! 3391: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb1a80820  ! 3395: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_258:
	setx	0x3a0330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_135:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 3398: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_259:
	setx	0x3a001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69d6077  ! 3400: XORcc_I	xorcc 	%r21, 0x0077, %r27
	.word 0xbd520000  ! 3403: RDPR_PIL	<illegal instruction>
	.word 0xb3a48860  ! 3404: FADDq	dis not found

	.word 0xb9a98820  ! 3407: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbfa98820  ! 3411: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb5a549c0  ! 3412: FDIVd	fdivd	%f52, %f0, %f26
cpu_intr_1_260:
	setx	0x3a0119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_261:
	setx	0x38022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_262:
	setx	0x3a003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1a9c820  ! 3423: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb9a81420  ! 3424: FMOVRNZ	dis not found

cpu_intr_1_263:
	setx	0x380318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa0820  ! 3426: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbfa9c820  ! 3428: FMOVVS	fmovs	%fcc1, %f0, %f31
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, a)
	.word 0xb1a48860  ! 3430: FADDq	dis not found

cpu_intr_1_264:
	setx	0x390126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 3437: FMOVPOS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_265:
	setx	0x39030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 3441: FMOVVS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_266:
	setx	0x390111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_267:
	setx	0x38012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_268:
	setx	0x390217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a94820  ! 3445: FMOVCS	fmovs	%fcc1, %f0, %f28
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3a448c0  ! 3449: FSUBd	fsubd	%f48, %f0, %f56
	.word 0xbfa80820  ! 3450: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb3a44940  ! 3451: FMULd	fmuld	%f48, %f0, %f56
	.word 0xba2c4000  ! 3452: ANDN_R	andn 	%r17, %r0, %r29
cpu_intr_1_269:
	setx	0x3a0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda549a0  ! 3457: FDIVs	fdivs	%f21, %f0, %f30
	.word 0xb3a50860  ! 3459: FADDq	dis not found

cpu_intr_1_270:
	setx	0x39020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aac820  ! 3465: FMOVGE	fmovs	%fcc1, %f0, %f28
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb3ab8820  ! 3468: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb5aa0820  ! 3469: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb7a8c820  ! 3470: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb3a54960  ! 3471: FMULq	dis not found

	.word 0xb1a5c9e0  ! 3472: FDIVq	dis not found

	.word 0xb5a90820  ! 3473: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb5a54960  ! 3476: FMULq	dis not found

cpu_intr_1_271:
	setx	0x380207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 3479: FMOVRGEZ	dis not found

	.word 0xb085604c  ! 3480: ADDcc_I	addcc 	%r21, 0x004c, %r24
	.word 0xb3a81420  ! 3482: FMOVRNZ	dis not found

T1_asi_reg_rd_136:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 3483: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb9a408a0  ! 3484: FSUBs	fsubs	%f16, %f0, %f28
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_272:
	setx	0x3b0205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_rd_137:
	mov	0x5, %r14
	.word 0xf8db84a0  ! 3492: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbda509e0  ! 3493: FDIVq	dis not found

T1_asi_reg_wr_136:
	mov	0x5, %r14
	.word 0xf0f38400  ! 3501: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbba4c860  ! 3503: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_273:
	setx	0x39012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_137:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 3516: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_274:
	setx	0x390026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c820  ! 3521: FADDs	fadds	%f23, %f0, %f25
T1_asi_reg_wr_138:
	mov	0x19, %r14
	.word 0xf2f38e60  ! 3529: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_275:
	setx	0x38032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_276:
	setx	0x38002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_138:
	mov	0x29, %r14
	.word 0xfedb8400  ! 3538: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbc250000  ! 3542: SUB_R	sub 	%r20, %r0, %r30
cpu_intr_1_277:
	setx	0x3a0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9a448a0  ! 3550: FSUBs	fsubs	%f17, %f0, %f28
	.word 0xb5a98820  ! 3552: FMOVNEG	fmovs	%fcc1, %f0, %f26
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, b)
	.word 0xbe0560de  ! 3555: ADD_I	add 	%r21, 0x00de, %r31
	.word 0xb5a90820  ! 3556: FMOVLEU	fmovs	%fcc1, %f0, %f26
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_rd_139:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 3558: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb7a4c960  ! 3564: FMULq	dis not found

	.word 0xb694c000  ! 3567: ORcc_R	orcc 	%r19, %r0, %r27
	.word 0xb5a54940  ! 3569: FMULd	fmuld	%f52, %f0, %f26
T1_asi_reg_rd_140:
	mov	0x12, %r14
	.word 0xf2db8e40  ! 3570: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_278:
	setx	0x38022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_139:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 3575: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_rd_141:
	mov	0x28, %r14
	.word 0xf0db84a0  ! 3578: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbda00540  ! 3581: FSQRTd	fsqrt	
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_279:
	setx	0x3b0036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_280:
	setx	0x380226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_281:
	setx	0x380307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_282:
	setx	0x380322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 2)
	.word 0x9195212c  ! 3599: WRPR_PIL_I	wrpr	%r20, 0x012c, %pil
	.word 0xb2848000  ! 3600: ADDcc_R	addcc 	%r18, %r0, %r25
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_283:
	setx	0x380136, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a48860  ! 3610: FADDq	dis not found

	.word 0xbdaa8820  ! 3611: FMOVG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_142:
	mov	0x7, %r14
	.word 0xfcdb8400  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 6)
	.word 0xb1a00040  ! 3620: FMOVd	fmovd	%f0, %f24
cpu_intr_1_284:
	setx	0x380304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80c20  ! 3622: FMOVRLZ	dis not found

iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_140:
	mov	0x36, %r14
	.word 0xf2f38e40  ! 3625: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_143:
	mov	0x6, %r14
	.word 0xf2db8e60  ! 3627: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_285:
	setx	0x38022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a8c820  ! 3639: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb3a5c8a0  ! 3641: FSUBs	fsubs	%f23, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_141:
	mov	0x27, %r14
	.word 0xf8f389e0  ! 3644: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb9643801  ! 3649: MOVcc_I	<illegal instruction>
cpu_intr_1_286:
	setx	0x380113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb894a04c  ! 3655: ORcc_I	orcc 	%r18, 0x004c, %r28
T1_asi_reg_wr_142:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 3656: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_144:
	mov	0x3c5, %r14
	.word 0xf6db8e80  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_287:
	setx	0x38013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb625c000  ! 3662: SUB_R	sub 	%r23, %r0, %r27
T1_asi_reg_wr_143:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 3663: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb3aa8820  ! 3664: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb5a81820  ! 3666: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb3a8c820  ! 3668: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb52cc000  ! 3670: SLL_R	sll 	%r19, %r0, %r26
T1_asi_reg_rd_145:
	mov	0x2e, %r14
	.word 0xfedb89e0  ! 3672: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_1_288:
	setx	0x3a0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb535c000  ! 3678: SRL_R	srl 	%r23, %r0, %r26
cpu_intr_1_289:
	setx	0x39010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_290:
	setx	0x3a032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40840  ! 3685: FADDd	faddd	%f16, %f0, %f56
	.word 0xb3a8c820  ! 3688: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbfaa4820  ! 3694: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb7a40840  ! 3696: FADDd	faddd	%f16, %f0, %f58
T1_asi_reg_rd_146:
	mov	0x4, %r14
	.word 0xf6db8e60  ! 3697: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbdaac820  ! 3701: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbda588e0  ! 3703: FSUBq	dis not found

T1_asi_reg_rd_147:
	mov	0x1e, %r14
	.word 0xf8db8e40  ! 3705: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_291:
	setx	0x38011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a489e0  ! 3712: FDIVq	dis not found

cpu_intr_1_292:
	setx	0x3a0005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_293:
	setx	0x3b0221, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_144:
	mov	0xf, %r14
	.word 0xfef38400  ! 3717: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_294:
	setx	0x3e0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a90820  ! 3722: FMOVLEU	fmovs	%fcc1, %f0, %f24
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_295:
	setx	0x3c030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7dc400  ! 3728: MOVR_R	movre	%r23, %r0, %r29
	.word 0xb1a5c8c0  ! 3730: FSUBd	fsubd	%f54, %f0, %f24
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_296:
	setx	0x3f0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a94820  ! 3738: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a81c20  ! 3740: FMOVRGEZ	dis not found

T1_asi_reg_wr_145:
	mov	0x28, %r14
	.word 0xf8f389e0  ! 3744: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_rd_148:
	mov	0x17, %r14
	.word 0xf8db8e60  ! 3746: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbba40840  ! 3747: FADDd	faddd	%f16, %f0, %f60
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbba508e0  ! 3753: FSUBq	dis not found

iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_149:
	mov	0x26, %r14
	.word 0xf4db8400  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbdaa0820  ! 3760: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbba58820  ! 3763: FADDs	fadds	%f22, %f0, %f29
	.word 0xb8a5a1ab  ! 3764: SUBcc_I	subcc 	%r22, 0x01ab, %r28
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 0)
	.word 0xb7a90820  ! 3769: FMOVLEU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_297:
	setx	0x3f031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_150:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 3775: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3aa4820  ! 3780: FMOVNE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_298:
	setx	0x3f0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8d0000  ! 3782: ANDcc_R	andcc 	%r20, %r0, %r30
T1_asi_reg_rd_151:
	mov	0x1d, %r14
	.word 0xf4db8e80  ! 3783: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbba589e0  ! 3787: FDIVq	dis not found

cpu_intr_1_299:
	setx	0x3f0126, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_146:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 3789: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbfa84820  ! 3790: FMOVE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_152:
	mov	0x16, %r14
	.word 0xf6db8400  ! 3792: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_rd_153:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 3793: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb6244000  ! 3794: SUB_R	sub 	%r17, %r0, %r27
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb3a81820  ! 3797: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbfa489a0  ! 3799: FDIVs	fdivs	%f18, %f0, %f31
cpu_intr_1_300:
	setx	0x3f0228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb1a489c0  ! 3804: FDIVd	fdivd	%f18, %f0, %f24
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_rd_154:
	mov	0x32, %r14
	.word 0xf4db8e60  ! 3815: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb7a80820  ! 3816: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_155:
	mov	0x20, %r14
	.word 0xf4db84a0  ! 3825: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T1_asi_reg_wr_147:
	mov	0x14, %r14
	.word 0xf0f38e60  ! 3826: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb5aac820  ! 3828: FMOVGE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_301:
	setx	0x3f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4444000  ! 3840: ADDC_R	addc 	%r17, %r0, %r26
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb5a489e0  ! 3844: FDIVq	dis not found

cpu_intr_1_302:
	setx	0x3d0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 3846: FSQRTq	fsqrt	
	.word 0xbba81820  ! 3847: FMOVRGZ	fmovs	%fcc3, %f0, %f29
cpu_intr_1_303:
	setx	0x3c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_wr_148:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 3850: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_149:
	mov	0x8, %r14
	.word 0xf4f38e60  ! 3853: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb7a90820  ! 3855: FMOVLEU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_150:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 3857: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_304:
	setx	0x3c001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_305:
	setx	0x3d023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 7)
	.word 0xbfa58960  ! 3867: FMULq	dis not found

	.word 0xb7aac820  ! 3868: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a88820  ! 3869: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbba44820  ! 3871: FADDs	fadds	%f17, %f0, %f29
T1_asi_reg_wr_151:
	mov	0x3c6, %r14
	.word 0xf6f38e60  ! 3875: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb5a54940  ! 3876: FMULd	fmuld	%f52, %f0, %f26
cpu_intr_1_306:
	setx	0x3e0219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 17)
	.word 0xb3a4c9a0  ! 3881: FDIVs	fdivs	%f19, %f0, %f25
	.word 0xb5a489a0  ! 3882: FDIVs	fdivs	%f18, %f0, %f26
T1_asi_reg_wr_152:
	mov	0x20, %r14
	.word 0xfef384a0  ! 3885: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 1)
	.word 0xb1a00540  ! 3897: FSQRTd	fsqrt	
T1_asi_reg_rd_156:
	mov	0x31, %r14
	.word 0xf2db8e40  ! 3898: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb7aa8820  ! 3899: FMOVG	fmovs	%fcc1, %f0, %f27
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_307:
	setx	0x3d0219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_rd_157:
	mov	0x3c6, %r14
	.word 0xf4db89e0  ! 3905: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_rd_158:
	mov	0x1e, %r14
	.word 0xfedb89e0  ! 3907: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a00040  ! 3916: FMOVd	fmovd	%f0, %f56
T1_asi_reg_rd_159:
	mov	0x20, %r14
	.word 0xf2db8e60  ! 3918: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbda9c820  ! 3919: FMOVVS	fmovs	%fcc1, %f0, %f30
cpu_intr_1_308:
	setx	0x3e0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4ad4000  ! 3923: ANDNcc_R	andncc 	%r21, %r0, %r26
	.word 0xb7a94820  ! 3924: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a5c9a0  ! 3925: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xbb354000  ! 3927: SRL_R	srl 	%r21, %r0, %r29
	.word 0xb7a50940  ! 3929: FMULd	fmuld	%f20, %f0, %f58
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 8)
	.word 0xbca5e13b  ! 3933: SUBcc_I	subcc 	%r23, 0x013b, %r30
T1_asi_reg_rd_160:
	mov	0x8, %r14
	.word 0xfadb84a0  ! 3934: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbba4c860  ! 3940: FADDq	dis not found

cpu_intr_1_309:
	setx	0x3c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_161:
	mov	0xb, %r14
	.word 0xf0db84a0  ! 3942: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_rd_162:
	mov	0x3c4, %r14
	.word 0xf4db89e0  ! 3945: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_rd_163:
	mov	0x1d, %r14
	.word 0xf8db8e80  ! 3949: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_1_310:
	setx	0x3c0232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_311:
	setx	0x3f0131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_312:
	setx	0x3e0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 3962: FSQRTq	fsqrt	
	.word 0xbe858000  ! 3964: ADDcc_R	addcc 	%r22, %r0, %r31
T1_asi_reg_rd_164:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 3965: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_rd_165:
	mov	0x1c, %r14
	.word 0xfedb89e0  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_1_313:
	setx	0x3d001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 35)
	.word 0xb9a50860  ! 3971: FADDq	dis not found

	.word 0xb3abc820  ! 3973: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb9a88820  ! 3974: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a58920  ! 3976: FMULs	fmuls	%f22, %f0, %f24
	.word 0xb1a98820  ! 3980: FMOVNEG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_166:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 3981: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbbab0820  ! 3983: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbfa98820  ! 3985: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb5a00020  ! 3986: FMOVs	fmovs	%f0, %f26
	.word 0xb1a588c0  ! 3987: FSUBd	fsubd	%f22, %f0, %f24
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 8)
	.word 0xb7a80420  ! 3995: FMOVRZ	dis not found

	.word 0xbba9c820  ! 3996: FMOVVS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_167:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 3998: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5aa4820  ! 3999: FMOVNE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_314:
	setx	0x3e003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_315:
	setx	0x3d003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 4007: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb5a4c8e0  ! 4008: FSUBq	dis not found

	.word 0xb1a549c0  ! 4011: FDIVd	fdivd	%f52, %f0, %f24
	.word 0xb3a80820  ! 4012: FMOVN	fmovs	%fcc1, %f0, %f25
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, b)
	.word 0xbda40840  ! 4015: FADDd	faddd	%f16, %f0, %f30
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_316:
	setx	0x3e020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda9c820  ! 4024: FMOVVS	fmovs	%fcc1, %f0, %f30
cpu_intr_1_317:
	setx	0x3e0325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_168:
	mov	0x13, %r14
	.word 0xf6db8e40  ! 4032: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_318:
	setx	0x3e0200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_319:
	setx	0x3d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba549e0  ! 4042: FDIVq	dis not found

iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 6)
	.word 0xb7ab4820  ! 4044: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb3a90820  ! 4046: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbba50840  ! 4048: FADDd	faddd	%f20, %f0, %f60
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb7510000  ! 4051: RDPR_TICK	<illegal instruction>
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbdabc820  ! 4056: FMOVVC	fmovs	%fcc1, %f0, %f30
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb3a54820  ! 4061: FADDs	fadds	%f21, %f0, %f25
cpu_intr_1_320:
	setx	0x3d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a488c0  ! 4066: FSUBd	fsubd	%f18, %f0, %f26
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_169:
	mov	0x1a, %r14
	.word 0xf2db84a0  ! 4069: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb2340000  ! 4071: SUBC_R	orn 	%r16, %r0, %r25
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 30)
	.word 0xb7ab8820  ! 4086: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbf3d3001  ! 4087: SRAX_I	srax	%r20, 0x0001, %r31
	.word 0xb8adc000  ! 4091: ANDNcc_R	andncc 	%r23, %r0, %r28
	.word 0xb7aa8820  ! 4092: FMOVG	fmovs	%fcc1, %f0, %f27
cpu_intr_1_321:
	setx	0x3d0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb5a50920  ! 4096: FMULs	fmuls	%f20, %f0, %f26
	.word 0xb5abc820  ! 4097: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbba00560  ! 4099: FSQRTq	fsqrt	
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb5a80c20  ! 4102: FMOVRLZ	dis not found

T1_asi_reg_wr_153:
	mov	0x36, %r14
	.word 0xf2f38e60  ! 4103: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbba54940  ! 4106: FMULd	fmuld	%f52, %f0, %f60
	.word 0xbdab4820  ! 4107: FMOVCC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_322:
	setx	0x3d0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_323:
	setx	0x3c023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 4114: FSQRTs	fsqrt	
	.word 0xb7a44940  ! 4118: FMULd	fmuld	%f48, %f0, %f58
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, b)
	.word 0xb9a80820  ! 4121: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_154:
	mov	0x3c8, %r14
	.word 0xf2f389e0  ! 4124: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_wr_155:
	mov	0xa, %r14
	.word 0xf8f38e40  ! 4125: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbc8c2079  ! 4127: ANDcc_I	andcc 	%r16, 0x0079, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa5c840  ! 4129: FADDd	faddd	%f54, %f0, %f62
	.word 0xbf351000  ! 4131: SRLX_R	srlx	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_324:
	setx	0x3f0036, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_156:
	mov	0x18, %r14
	.word 0xfcf38e80  ! 4142: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_325:
	setx	0x3f002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6154000  ! 4147: OR_R	or 	%r21, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a80820  ! 4149: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb7ab0820  ! 4151: FMOVGU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_170:
	mov	0x21, %r14
	.word 0xfedb84a0  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_1_326:
	setx	0x3f0315, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_157:
	mov	0x6, %r14
	.word 0xf4f38e40  ! 4157: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbd3d5000  ! 4160: SRAX_R	srax	%r21, %r0, %r30
	.word 0xb3a4c8a0  ! 4162: FSUBs	fsubs	%f19, %f0, %f25
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 8)
	.word 0xbba54840  ! 4165: FADDd	faddd	%f52, %f0, %f60
	.word 0xbda48840  ! 4166: FADDd	faddd	%f18, %f0, %f30
	.word 0xb3a88820  ! 4167: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_171:
	mov	0x18, %r14
	.word 0xf0db8e80  ! 4175: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_wr_158:
	mov	0x4, %r14
	.word 0xfaf38e80  ! 4176: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_wr_159:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 4178: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T1_asi_reg_rd_172:
	mov	0xe, %r14
	.word 0xf4db8e60  ! 4179: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 32)
	.word 0xbda449a0  ! 4188: FDIVs	fdivs	%f17, %f0, %f30
	.word 0xbda48860  ! 4189: FADDq	dis not found

	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbda588a0  ! 4192: FSUBs	fsubs	%f22, %f0, %f30
	.word 0xb7a00020  ! 4193: FMOVs	fmovs	%f0, %f27
T1_asi_reg_wr_160:
	mov	0x6, %r14
	.word 0xfaf38e40  ! 4197: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1520000  ! 4199: RDPR_PIL	<illegal instruction>
	.word 0xbba81420  ! 4200: FMOVRNZ	dis not found

cpu_intr_1_327:
	setx	0x430125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 31)
	.word 0xba05e08a  ! 4212: ADD_I	add 	%r23, 0x008a, %r29
	.word 0xb5a80c20  ! 4217: FMOVRLZ	dis not found

	.word 0xb00ce1b1  ! 4218: AND_I	and 	%r19, 0x01b1, %r24
	.word 0xb7a00540  ! 4219: FSQRTd	fsqrt	
cpu_intr_1_328:
	setx	0x420333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 4223: FMOVRGEZ	dis not found

	.word 0xb1ab8820  ! 4224: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb9a00520  ! 4227: FSQRTs	fsqrt	
	.word 0xbba4c840  ! 4228: FADDd	faddd	%f50, %f0, %f60
cpu_intr_1_329:
	setx	0x410319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80c20  ! 4233: FMOVRLZ	dis not found

cpu_intr_1_330:
	setx	0x40021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 30)
	.word 0xbfa88820  ! 4236: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a5c820  ! 4238: FADDs	fadds	%f23, %f0, %f24
	.word 0xbba81c20  ! 4240: FMOVRGEZ	dis not found

	.word 0xb1a54860  ! 4243: FADDq	dis not found

	.word 0xbba00520  ! 4245: FSQRTs	fsqrt	
T1_asi_reg_rd_173:
	mov	0x8, %r14
	.word 0xf4db8e80  ! 4246: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb1aa8820  ! 4248: FMOVG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_161:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 4254: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0x8d952121  ! 4256: WRPR_PSTATE_I	wrpr	%r20, 0x0121, %pstate
	.word 0xb5a50840  ! 4257: FADDd	faddd	%f20, %f0, %f26
T1_asi_reg_wr_162:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 4258: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_163:
	mov	0xe, %r14
	.word 0xfcf38400  ! 4259: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbda00040  ! 4261: FMOVd	fmovd	%f0, %f30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_331:
	setx	0x430303, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_174:
	mov	0x35, %r14
	.word 0xf0db8e40  ! 4266: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_175:
	mov	0x37, %r14
	.word 0xfedb8400  ! 4267: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbd35b001  ! 4269: SRLX_I	srlx	%r22, 0x0001, %r30
	.word 0xbba588e0  ! 4270: FSUBq	dis not found

	.word 0xb9a509a0  ! 4272: FDIVs	fdivs	%f20, %f0, %f28
	.word 0xb9a80420  ! 4273: FMOVRZ	dis not found

	.word 0xb8040000  ! 4276: ADD_R	add 	%r16, %r0, %r28
T1_asi_reg_wr_164:
	mov	0xa, %r14
	.word 0xf0f38e80  ! 4277: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_rd_176:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 4281: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3504000  ! 4282: RDPR_TNPC	<illegal instruction>
T1_asi_reg_wr_165:
	mov	0x25, %r14
	.word 0xf2f389e0  ! 4288: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbec4615d  ! 4289: ADDCcc_I	addccc 	%r17, 0x015d, %r31
T1_asi_reg_rd_177:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 4290: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 15)
	.word 0xbec50000  ! 4293: ADDCcc_R	addccc 	%r20, %r0, %r31
T1_asi_reg_rd_178:
	mov	0x22, %r14
	.word 0xfedb84a0  ! 4294: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_179:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 4297: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_wr_166:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 4299: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbba588e0  ! 4301: FSUBq	dis not found

	.word 0xb7a81420  ! 4305: FMOVRNZ	dis not found

	.word 0xbda00540  ! 4307: FSQRTd	fsqrt	
cpu_intr_1_332:
	setx	0x400329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 4309: FMOVE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_180:
	mov	0x4, %r14
	.word 0xf0db8e40  ! 4310: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_333:
	setx	0x42030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_181:
	mov	0x2a, %r14
	.word 0xfedb8e80  ! 4316: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_167:
	mov	0x3c4, %r14
	.word 0xf4f384a0  ! 4320: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb7480000  ! 4324: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb5a80820  ! 4326: FMOVN	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_182:
	mov	0x2e, %r14
	.word 0xf8db8e40  ! 4329: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb1a80820  ! 4337: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1a80820  ! 4342: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb3a81c20  ! 4344: FMOVRGEZ	dis not found

	.word 0xbcbd2043  ! 4348: XNORcc_I	xnorcc 	%r20, 0x0043, %r30
	.word 0xbd641800  ! 4349: MOVcc_R	<illegal instruction>
cpu_intr_1_334:
	setx	0x430302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_335:
	setx	0x410111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_336:
	setx	0x400205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_337:
	setx	0x400210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 4360: FSQRTq	fsqrt	
	.word 0xb5a94820  ! 4362: FMOVCS	fmovs	%fcc1, %f0, %f26
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb7a5c9e0  ! 4367: FDIVq	dis not found

	.word 0xb1a5c9e0  ! 4373: FDIVq	dis not found

cpu_intr_1_338:
	setx	0x410034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_339:
	setx	0x42022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 4379: FSQRTd	fsqrt	
	.word 0xb7a81820  ! 4381: FMOVRGZ	fmovs	%fcc3, %f0, %f27
T1_asi_reg_wr_168:
	mov	0x28, %r14
	.word 0xf4f38e40  ! 4383: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_183:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 4386: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_1_340:
	setx	0x420122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba548c0  ! 4388: FSUBd	fsubd	%f52, %f0, %f60
T1_asi_reg_rd_184:
	mov	0x36, %r14
	.word 0xf0db8e40  ! 4393: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfa90820  ! 4394: FMOVLEU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_169:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 4395: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	lda	[%r21 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_170:
	mov	0x3c4, %r14
	.word 0xfef384a0  ! 4401: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_341:
	setx	0x40022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 4403: FSQRTq	fsqrt	
T1_asi_reg_rd_185:
	mov	0x5, %r14
	.word 0xfadb84a0  ! 4404: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_rd_186:
	mov	0x16, %r14
	.word 0xf6db8400  ! 4407: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_1_342:
	setx	0x42021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0d0000  ! 4414: AND_R	and 	%r20, %r0, %r29
	.word 0xb5a50940  ! 4415: FMULd	fmuld	%f20, %f0, %f26
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_rd_187:
	mov	0x16, %r14
	.word 0xfedb8e40  ! 4421: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbd343001  ! 4423: SRLX_I	srlx	%r16, 0x0001, %r30
	.word 0xb5a00020  ! 4424: FMOVs	fmovs	%f0, %f26
cpu_intr_1_343:
	setx	0x400108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_344:
	setx	0x42012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 10)
	.word 0xbfa4c9a0  ! 4433: FDIVs	fdivs	%f19, %f0, %f31
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, d)
	.word 0xb1a58920  ! 4437: FMULs	fmuls	%f22, %f0, %f24
	.word 0xb7a588c0  ! 4439: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xb9a80820  ! 4443: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
cpu_intr_1_345:
	setx	0x400209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 4448: FMOVRNZ	dis not found

cpu_intr_1_346:
	setx	0x40012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_347:
	setx	0x410139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_348:
	setx	0x40012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00040  ! 4464: FMOVd	fmovd	%f0, %f26
cpu_intr_1_349:
	setx	0x420038, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_188:
	mov	0x37, %r14
	.word 0xf6db8e40  ! 4471: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_350:
	setx	0x400236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c9e0  ! 4474: FDIVq	dis not found

	.word 0xb5a50960  ! 4475: FMULq	dis not found

iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_rd_189:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 4478: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb5a4c9c0  ! 4479: FDIVd	fdivd	%f50, %f0, %f26
	.word 0xbd7c0400  ! 4482: MOVR_R	movre	%r16, %r0, %r30
T1_asi_reg_wr_171:
	mov	0x4, %r14
	.word 0xf2f38400  ! 4485: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbab58000  ! 4486: ORNcc_R	orncc 	%r22, %r0, %r29
	.word 0xb1a81820  ! 4488: FMOVRGZ	fmovs	%fcc3, %f0, %f24
cpu_intr_1_351:
	setx	0x43013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_172:
	mov	0x5, %r14
	.word 0xf0f38e80  ! 4492: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb3a8c820  ! 4495: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb9a5c8a0  ! 4497: FSUBs	fsubs	%f23, %f0, %f28
	.word 0xb3a40960  ! 4500: FMULq	dis not found

iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 30)
	.word 0xb3a54960  ! 4502: FMULq	dis not found

	.word 0xbda48860  ! 4503: FADDq	dis not found

	.word 0xbbaa0820  ! 4507: FMOVA	fmovs	%fcc1, %f0, %f29
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 8)
	.word 0xb5a00540  ! 4510: FSQRTd	fsqrt	
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_190:
	mov	0x1f, %r14
	.word 0xfedb8e80  ! 4519: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_wr_173:
	mov	0x2, %r14
	.word 0xf8f384a0  ! 4520: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb3a58820  ! 4521: FADDs	fadds	%f22, %f0, %f25
T1_asi_reg_rd_191:
	mov	0x8, %r14
	.word 0xf2db8e60  ! 4523: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbfa4c8a0  ! 4528: FSUBs	fsubs	%f19, %f0, %f31
	.word 0xb9a48960  ! 4530: FMULq	dis not found

T1_asi_reg_rd_192:
	mov	0x15, %r14
	.word 0xfadb8e60  ! 4533: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T1_asi_reg_rd_193:
	mov	0x1e, %r14
	.word 0xf4db8e60  ! 4536: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_352:
	setx	0x43003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa8820  ! 4538: FMOVG	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb1a44920  ! 4543: FMULs	fmuls	%f17, %f0, %f24
	.word 0xbba90820  ! 4545: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb444c000  ! 4546: ADDC_R	addc 	%r19, %r0, %r26
T1_asi_reg_rd_194:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_353:
	setx	0x420229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_354:
	setx	0x430134, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_174:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 4557: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbfa81820  ! 4558: FMOVRGZ	fmovs	%fcc3, %f0, %f31
T1_asi_reg_wr_175:
	mov	0x27, %r14
	.word 0xf8f38400  ! 4559: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_355:
	setx	0x41031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 4563: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a4c820  ! 4566: FADDs	fadds	%f19, %f0, %f28
	.word 0xbba44840  ! 4568: FADDd	faddd	%f48, %f0, %f60
cpu_intr_1_356:
	setx	0x430306, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_195:
	mov	0x11, %r14
	.word 0xfadb8400  ! 4575: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_176:
	mov	0x3, %r14
	.word 0xfef38400  ! 4577: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbba408c0  ! 4578: FSUBd	fsubd	%f16, %f0, %f60
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_177:
	mov	0xb, %r14
	.word 0xf4f38e40  ! 4583: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_357:
	setx	0x43013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb134d000  ! 4588: SRLX_R	srlx	%r19, %r0, %r24
	.word 0xbba88820  ! 4591: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbba81820  ! 4592: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb3a4c840  ! 4597: FADDd	faddd	%f50, %f0, %f56
	.word 0xbc2ce08f  ! 4598: ANDN_I	andn 	%r19, 0x008f, %r30
	.word 0xb4354000  ! 4599: SUBC_R	orn 	%r21, %r0, %r26
	.word 0xb1a4c9a0  ! 4605: FDIVs	fdivs	%f19, %f0, %f24
T1_asi_reg_wr_178:
	mov	0x3c4, %r14
	.word 0xfef38400  ! 4606: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_358:
	setx	0x41011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41c4000  ! 4608: XOR_R	xor 	%r17, %r0, %r26
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_359:
	setx	0x420103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 4616: FMOVPOS	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa589e0  ! 4619: FDIVq	dis not found

	.word 0xb3a00540  ! 4621: FSQRTd	fsqrt	
cpu_intr_1_360:
	setx	0x40012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81820  ! 4627: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbbab8820  ! 4630: FMOVPOS	fmovs	%fcc1, %f0, %f29
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 34)
	.word 0xb5a80820  ! 4633: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_196:
	mov	0x2b, %r14
	.word 0xf8db8400  ! 4634: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_1_361:
	setx	0x44011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 4636: FMOVd	fmovd	%f0, %f24
	.word 0xbfa549c0  ! 4638: FDIVd	fdivd	%f52, %f0, %f62
	.word 0xbe25a0aa  ! 4640: SUB_I	sub 	%r22, 0x00aa, %r31
T1_asi_reg_rd_197:
	mov	0x20, %r14
	.word 0xf0db8e40  ! 4642: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, f)
	.word 0xb9a00540  ! 4644: FSQRTd	fsqrt	
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 28)
	.word 0xb1ab8820  ! 4647: FMOVPOS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_362:
	setx	0x47033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_wr_179:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 4655: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_363:
	setx	0x450033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 27)
	.word 0xb17d8400  ! 4659: MOVR_R	movre	%r22, %r0, %r24
cpu_intr_1_364:
	setx	0x46012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 32)
	.word 0xbf3d2001  ! 4663: SRA_I	sra 	%r20, 0x0001, %r31
T1_asi_reg_rd_198:
	mov	0x8, %r14
	.word 0xf2db8e40  ! 4664: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1351000  ! 4665: SRLX_R	srlx	%r20, %r0, %r24
cpu_intr_1_365:
	setx	0x46033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 4670: FSQRTq	fsqrt	
	.word 0xbfa58960  ! 4675: FMULq	dis not found

	.word 0xbda9c820  ! 4679: FMOVVS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_199:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb83dc000  ! 4683: XNOR_R	xnor 	%r23, %r0, %r28
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 5)
	.word 0xb3a00520  ! 4687: FSQRTs	fsqrt	
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 8)
	.word 0xb3a00040  ! 4693: FMOVd	fmovd	%f0, %f56
	.word 0xb6340000  ! 4697: ORN_R	orn 	%r16, %r0, %r27
	.word 0xb13d4000  ! 4699: SRA_R	sra 	%r21, %r0, %r24
	.word 0xb7a81820  ! 4700: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb0c58000  ! 4701: ADDCcc_R	addccc 	%r22, %r0, %r24
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbba5c940  ! 4704: FMULd	fmuld	%f54, %f0, %f60
cpu_intr_1_366:
	setx	0x46001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 13)
	.word 0xb08c4000  ! 4710: ANDcc_R	andcc 	%r17, %r0, %r24
T1_asi_reg_rd_200:
	mov	0x19, %r14
	.word 0xf6db8e40  ! 4711: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1a84820  ! 4717: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xbba5c8e0  ! 4718: FSUBq	dis not found

	.word 0xb6a58000  ! 4721: SUBcc_R	subcc 	%r22, %r0, %r27
	.word 0xb7a5c820  ! 4722: FADDs	fadds	%f23, %f0, %f27
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_180:
	mov	0x30, %r14
	.word 0xfaf38e60  ! 4725: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_wr_181:
	mov	0x24, %r14
	.word 0xfef38e60  ! 4726: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_182:
	mov	0x1f, %r14
	.word 0xf4f38e60  ! 4728: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb33cf001  ! 4731: SRAX_I	srax	%r19, 0x0001, %r25
cpu_intr_1_367:
	setx	0x460301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5358000  ! 4737: SRL_R	srl 	%r22, %r0, %r26
	.word 0xb9a5c8a0  ! 4738: FSUBs	fsubs	%f23, %f0, %f28
	.word 0xb5a00540  ! 4741: FSQRTd	fsqrt	
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 32)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda50820  ! 4749: FADDs	fadds	%f20, %f0, %f30
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb9a80820  ! 4752: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb1a80c20  ! 4754: FMOVRLZ	dis not found

iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 9)
	.word 0xb3a81c20  ! 4760: FMOVRGEZ	dis not found

T1_asi_reg_wr_183:
	mov	0x25, %r14
	.word 0xf2f38400  ! 4763: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbba00040  ! 4765: FMOVd	fmovd	%f0, %f60
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 13)
	.word 0xbfa80820  ! 4772: FMOVN	fmovs	%fcc1, %f0, %f31
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb1a44820  ! 4775: FADDs	fadds	%f17, %f0, %f24
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_wr_184:
	mov	0x21, %r14
	.word 0xfcf384a0  ! 4777: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_wr_185:
	mov	0x9, %r14
	.word 0xfcf384a0  ! 4780: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb1a58820  ! 4783: FADDs	fadds	%f22, %f0, %f24
T1_asi_reg_rd_201:
	mov	0xe, %r14
	.word 0xfadb8e80  ! 4786: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb49c4000  ! 4787: XORcc_R	xorcc 	%r17, %r0, %r26
T1_asi_reg_rd_202:
	mov	0x2, %r14
	.word 0xf6db8400  ! 4788: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb88d0000  ! 4795: ANDcc_R	andcc 	%r20, %r0, %r28
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb02d4000  ! 4801: ANDN_R	andn 	%r21, %r0, %r24
T1_asi_reg_rd_203:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 4802: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_368:
	setx	0x470307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_369:
	setx	0x45021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 4807: FMOVL	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_186:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 4809: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3aa8820  ! 4811: FMOVG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_187:
	mov	0x5, %r14
	.word 0xfaf384a0  ! 4812: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_rd_204:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 4813: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_wr_188:
	mov	0x1e, %r14
	.word 0xfcf38400  ! 4815: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbba90820  ! 4817: FMOVLEU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_370:
	setx	0x47021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73c6001  ! 4824: SRA_I	sra 	%r17, 0x0001, %r27
T1_asi_reg_rd_205:
	mov	0xf, %r14
	.word 0xfcdb84a0  ! 4826: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbf35a001  ! 4827: SRL_I	srl 	%r22, 0x0001, %r31
	.word 0xb9a80820  ! 4828: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbba94820  ! 4831: FMOVCS	fmovs	%fcc1, %f0, %f29
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_371:
	setx	0x470237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb49d0000  ! 4837: XORcc_R	xorcc 	%r20, %r0, %r26
cpu_intr_1_372:
	setx	0x460103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, b)
	.word 0xb9aac820  ! 4848: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a5c860  ! 4849: FADDq	dis not found

	.word 0xb21d0000  ! 4850: XOR_R	xor 	%r20, %r0, %r25
T1_asi_reg_rd_206:
	mov	0x6, %r14
	.word 0xf6db8e80  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb1a8c820  ! 4858: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb1ab4820  ! 4860: FMOVCC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_207:
	mov	0xe, %r14
	.word 0xf4db8e40  ! 4865: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb7641800  ! 4866: MOVcc_R	<illegal instruction>
T1_asi_reg_wr_189:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 4868: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_wr_190:
	mov	0xe, %r14
	.word 0xfcf38e60  ! 4870: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbfa5c920  ! 4875: FMULs	fmuls	%f23, %f0, %f31
	.word 0xb80c0000  ! 4876: AND_R	and 	%r16, %r0, %r28
T1_asi_reg_rd_208:
	mov	0xc, %r14
	.word 0xf2db89e0  ! 4882: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_rd_209:
	mov	0x3c4, %r14
	.word 0xfadb84a0  ! 4883: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_wr_191:
	mov	0xc, %r14
	.word 0xf0f38e60  ! 4885: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_wr_192:
	mov	0x27, %r14
	.word 0xfcf38e40  ! 4887: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 1)
	.word 0xbbaa8820  ! 4892: FMOVG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_210:
	mov	0x10, %r14
	.word 0xfadb89e0  ! 4900: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb3ab8820  ! 4903: FMOVPOS	fmovs	%fcc1, %f0, %f25
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 4)
	.word 0xb3a4c8c0  ! 4905: FSUBd	fsubd	%f50, %f0, %f56
T1_asi_reg_wr_193:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 4908: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_194:
	mov	0x1, %r14
	.word 0xf8f389e0  ! 4912: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_373:
	setx	0x47010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_374:
	setx	0x46002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 15)
	.word 0xbfaa0820  ! 4925: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb80420b2  ! 4926: ADD_I	add 	%r16, 0x00b2, %r28
T1_asi_reg_wr_195:
	mov	0x17, %r14
	.word 0xf0f389e0  ! 4927: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_wr_196:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 4929: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb08d4000  ! 4931: ANDcc_R	andcc 	%r21, %r0, %r24
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_rd_211:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 4939: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb425600f  ! 4941: SUB_I	sub 	%r21, 0x000f, %r26
	.word 0xbc2d8000  ! 4942: ANDN_R	andn 	%r22, %r0, %r30
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_375:
	setx	0x460018, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_197:
	mov	0xc, %r14
	.word 0xfaf38e40  ! 4946: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1a40860  ! 4947: FADDq	dis not found

iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 4)
	.word 0xb6442125  ! 4952: ADDC_I	addc 	%r16, 0x0125, %r27
	.word 0xb1a54840  ! 4954: FADDd	faddd	%f52, %f0, %f24
	.word 0xbb353001  ! 4957: SRLX_I	srlx	%r20, 0x0001, %r29
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 36)
	.word 0xbba549a0  ! 4964: FDIVs	fdivs	%f21, %f0, %f29
	.word 0xb7a508c0  ! 4965: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xbba81c20  ! 4966: FMOVRGEZ	dis not found

	.word 0xbbaac820  ! 4967: FMOVGE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_376:
	setx	0x470312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbba40920  ! 4972: FMULs	fmuls	%f16, %f0, %f29
	.word 0xb1a00540  ! 4974: FSQRTd	fsqrt	
	.word 0xb3a50920  ! 4975: FMULs	fmuls	%f20, %f0, %f25
T1_asi_reg_wr_198:
	mov	0x19, %r14
	.word 0xfef38e80  ! 4977: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_377:
	setx	0x450132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa509e0  ! 4981: FDIVq	dis not found

	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbfa00520  ! 4986: FSQRTs	fsqrt	
cpu_intr_1_378:
	setx	0x46013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_379:
	setx	0x450126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c960  ! 4990: FMULq	dis not found

iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_212:
	mov	0x1d, %r14
	.word 0xf2db8400  ! 4992: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_380:
	setx	0x460135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_396:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_396), 16, 16)) -> intp(1, 0, 7)
	.word 0xb3480000  ! 4998: RDHPR_HPSTATE	rdhpr	%hpstate, %r25

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

	.xword	0xfd8b5c445897f849
	.xword	0xe4e6d8d295225a6b
	.xword	0xc1afd72bcdd6623c
	.xword	0xc9f90ae653dea589
	.xword	0x1ae2cd40b6a1100e
	.xword	0x2581029305f64702
	.xword	0x8d2c7c9c359f7753
	.xword	0x3b9047a0fd3c314a
	.xword	0x0afd6cbe1f34f1af
	.xword	0x277c423acd4a6146
	.xword	0x9acee337e1ee6f7b
	.xword	0x0e6584d020f1f1cc
	.xword	0x561310777debefe6
	.xword	0xe82623a39d0e3e7c
	.xword	0x6f92ebd8024097ed
	.xword	0x2d44213a05b80bd7
	.xword	0xcdba8aa85c8997d1
	.xword	0xab7bac575b850c47
	.xword	0xc1612f23b7d06524
	.xword	0xc6f3c3ccdbd42d2a
	.xword	0xb8d86a0a7ca8f822
	.xword	0xca0f5bb71c23cd53
	.xword	0x8fd0313cfa00a1f1
	.xword	0x48d99a6a77bdb3ae
	.xword	0x2b167ad8098a675a
	.xword	0x6279f685135b05f6
	.xword	0x95a79761d3d2896f
	.xword	0xab357d434c4a82ef
	.xword	0x6010f38b8fa56a66
	.xword	0xb904c382b76c432c
	.xword	0xfd559ea7c1f51a6c
	.xword	0x9725bd84058abfb1
	.xword	0x9b884d1e6798ef5a
	.xword	0x6c688fdf5bbf3ac1
	.xword	0x9aed9f609308c3f8
	.xword	0x8fdd71847cbc0d01
	.xword	0x8243ab93e2c459de
	.xword	0xd69c0a4cad120309
	.xword	0x35379e2778dfd63b
	.xword	0x1aa8c7994908cbad
	.xword	0x0f1f3ac3d3436152
	.xword	0x90bb55bb9e11aadd
	.xword	0x2ac09a3481365a20
	.xword	0x4b85217b2f18760d
	.xword	0x9f23600a5c619353
	.xword	0x54663e8bde427066
	.xword	0x662a27eb4e8b8072
	.xword	0x369f6f87860b3166
	.xword	0xaafd63677f07c0ea
	.xword	0xa8fc2315426a26f2
	.xword	0xbf93c50c796ede39
	.xword	0x0873f30d68696799
	.xword	0xdf20930def7d0cbc
	.xword	0x162cb487c76471fb
	.xword	0xcc87228b89df2b3c
	.xword	0x965f3019aaaae8a2
	.xword	0xe2ab93ae406183b9
	.xword	0x6555a3585e63fe52
	.xword	0xd07ad77b8a5f094b
	.xword	0x67aa988d33487d1a
	.xword	0xb53f4ca3ab26ba9d
	.xword	0x547142cdbe53626e
	.xword	0xe48425a8943e09b7
	.xword	0x6346c9665afdfa2b
	.xword	0x33c14e11453ed3d5
	.xword	0x40e85f49feb4a960
	.xword	0xf0103d46b0df77b8
	.xword	0x942306d1b47183e6
	.xword	0xd4574e5e3309b380
	.xword	0xd009a2bc35e65ed0
	.xword	0x0f90b48716822854
	.xword	0xf3cb406453bdaf65
	.xword	0xa2ccbc98b90b8088
	.xword	0xaf6bde85c13cad20
	.xword	0x6d09e85718ac8131
	.xword	0x4fad658fc3281764
	.xword	0x115fcb5abff8e3d4
	.xword	0x246878f9a82895b7
	.xword	0x65141ac31e1548fb
	.xword	0x7bdccc5483092d0d
	.xword	0xf11738d45e9feea6
	.xword	0x77e142d954275619
	.xword	0xe8de85eadbbdaa54
	.xword	0x8cd39a3b4f71695a
	.xword	0xd04c886d2996ab57
	.xword	0x36b1c291d7c06b98
	.xword	0x20b7ccd4f7e567cb
	.xword	0x4952b060bf1bc960
	.xword	0xe2bf5539226d6575
	.xword	0xb3c99e881c5ed1bb
	.xword	0x76f6510f4f09ca55
	.xword	0x15cadf0c4d79a5dc
	.xword	0x0b6035495a0c7851
	.xword	0x3ee3873a5c6c9970
	.xword	0x55f9b27d97e88725
	.xword	0x0b69a306c387fe2f
	.xword	0xc7e4a0cf43442fdd
	.xword	0xe7e99eed8fbf732b
	.xword	0xc572dfc10638df9c
	.xword	0xb7e00b1599ae6cc4
	.xword	0xca59aa9d3c8eb301
	.xword	0x85242ad01d64d3e9
	.xword	0xdf71d841ff580c76
	.xword	0x0da3cb247bb4d6b8
	.xword	0x6f126c156a3a7290
	.xword	0x24cd630d9e56aaae
	.xword	0xf552604622330688
	.xword	0x4a878322dce10736
	.xword	0xb403abfa92eb55f0
	.xword	0x591992cf4859fb93
	.xword	0xeca5c2ac7f51d34f
	.xword	0xe73b96856cd4cb82
	.xword	0x189db6bfef28dec1
	.xword	0x191d8560405e7981
	.xword	0x560e9167bf9b5dbc
	.xword	0xe6a1c5e5444a9b0f
	.xword	0xfa04ce45ac858563
	.xword	0xa1ed68085d7aa1ad
	.xword	0x8814eb597a6cbe53
	.xword	0x4651d3ce238162b6
	.xword	0x1fd36229dbc96d65
	.xword	0xb5678e06d6e234fa
	.xword	0xc4a8c180a0be022f
	.xword	0x184cb2e8ef25c0de
	.xword	0x65e8a2d85fff28b4
	.xword	0xe8437c6f300782fb
	.xword	0x703fd689af511af8
	.xword	0x1a89bb20b70b72b1
	.xword	0x3d631e46bffa1720
	.xword	0x96a27a791c50a66a
	.xword	0x882a95aadb258ad1
	.xword	0xfecba7f5ca62d848
	.xword	0xc7eb4455c85c645a
	.xword	0xbe7862eb3ccbd52f
	.xword	0x3d7be562ff3f3a3d
	.xword	0xcdca22e649ef08f0
	.xword	0xe0685ab8375cd514
	.xword	0x32a757fa4ddaa96a
	.xword	0xf0a02a7cf2148775
	.xword	0x86f8f0be00434877
	.xword	0x51a5a4d212c166b9
	.xword	0xd75f4eaf6eeada96
	.xword	0xbbf6f32357dc84a7
	.xword	0xa95f28518a35d608
	.xword	0xfd736680fe9bb02e
	.xword	0x1e418b3a35c2c857
	.xword	0xe635bf08e20804fd
	.xword	0xa6aa377271da89a7
	.xword	0x4feec89cac0dbdef
	.xword	0x3cabfa3e3e37e0ea
	.xword	0x94028b7c1bc57afb
	.xword	0x788c8a8a5e87ed52
	.xword	0x04508fbc993f9d63
	.xword	0x83bb80f0a1023f92
	.xword	0x447156fdb55a55a0
	.xword	0x0b82436a9fbbf848
	.xword	0x92341cfce9575289
	.xword	0x7e0cb9dff22ffc23
	.xword	0xed2221b46cbc199f
	.xword	0xc6c89260b907c14d
	.xword	0xcec95480845fd89e
	.xword	0x14759fec159d818e
	.xword	0xc2d478a3516aba32
	.xword	0x6af12b3975923da8
	.xword	0x2adb2c97ac57071b
	.xword	0x17d2fefbd9e8cf05
	.xword	0x93439213ede42910
	.xword	0x13be470c24e410e5
	.xword	0x4836199c480f9892
	.xword	0xf316b39899476443
	.xword	0xaeba79de35ca0516
	.xword	0x389cbde7ab061a75
	.xword	0x3d89f6d3fd720080
	.xword	0xa3bbe289f1761e23
	.xword	0x07868b96db240b96
	.xword	0xe21396a66a2755a4
	.xword	0xd8cddae3a29a8ef4
	.xword	0x149835824a15a349
	.xword	0xc3c0d2c06f4059b4
	.xword	0x0f06c515743302ee
	.xword	0x3c50e70b93313424
	.xword	0xc580cdf299e25d46
	.xword	0xd7440d4fd8791042
	.xword	0x972748801e4f1d3a
	.xword	0x7956da2ab616e49b
	.xword	0x668e01a37ae3dd1b
	.xword	0x4bf9e889b3cdd9fc
	.xword	0x001222726985f3a6
	.xword	0x7466823d6aca31d8
	.xword	0xa8b13cbff2a3ed99
	.xword	0x72a32092e63d6e42
	.xword	0x3a2c08a79127fc58
	.xword	0x613c132cf8953f3c
	.xword	0x378f5129d73277a0
	.xword	0x09d5012f72763508
	.xword	0x3adb1e9892e192b1
	.xword	0x7619510f6e4aa356
	.xword	0xbb34598b8fc34366
	.xword	0x344de6650398246e
	.xword	0xbee906bcfce334b2
	.xword	0x539691f847f766de
	.xword	0x36ac68403463144e
	.xword	0xb693437c1e8ab89a
	.xword	0x7abc92fe4af90dcf
	.xword	0xc262409420735ee0
	.xword	0x2dc4d3be3555b719
	.xword	0x3a001a2e2bc5be31
	.xword	0x5cb34bebc924cd93
	.xword	0x69b229ae664d17c4
	.xword	0x8264cb368ebe2d63
	.xword	0xf98a8966e4b6e5d0
	.xword	0x733c233d445723e7
	.xword	0xdb69200bf7c72e17
	.xword	0xfd64971fc94d6cd6
	.xword	0x45e870d1aea68fdf
	.xword	0xd37dc261ad60e199
	.xword	0x1ff1bbcd741408c8
	.xword	0x28fb28fd8c0f864a
	.xword	0x67871cab4c887ad3
	.xword	0x87bae4c28a60190c
	.xword	0x5e2b1207ad44c02d
	.xword	0xb3b431dab3147073
	.xword	0xd3bf424553219b0e
	.xword	0x30eac1c7142c0aff
	.xword	0x3730f487a0fc9167
	.xword	0x98ebee74636de1f9
	.xword	0x3937b5dbdbccf34d
	.xword	0x6c337359f807adb3
	.xword	0x8ca67576c55c343a
	.xword	0x18265f3846160c51
	.xword	0x0dbd5ade693d6d34
	.xword	0x862e8f4d62d05729
	.xword	0x463cb2d44d704ce1
	.xword	0xd4b4ad99870af947
	.xword	0xf181c9075739d630
	.xword	0xb1c7f327e43d021a
	.xword	0x6ec84cd5b62e8cc9
	.xword	0x1bad36a82ac92959
	.xword	0x3fa817f282991fb9
	.xword	0xc164ba19679832f2
	.xword	0x868f7e9c322eff4f
	.xword	0x421f3c6bd6e24f38
	.xword	0xc8c70f9072f4b7d8
	.xword	0x977212181e8ad845
	.xword	0xc523f66a7edbc758
	.xword	0x06dd19a676d0860c
	.xword	0x03f0dee31df99c63
	.xword	0x473369f94db513b3
	.xword	0xad6b63abb4a08b53
	.xword	0x92e213439fab7701
	.xword	0x37e85d72041b1e59
	.xword	0x0ac813ab9f983236
	.xword	0x770dc8459f250666
	.xword	0x6e2564737bb317d3
	.xword	0x1f69024bda00dd25
	.xword	0xff78474474d798b0
	.align 0x2000
	.data
data_start_1:

	.xword	0x38b1d0cf62389cdf
	.xword	0xb2b12f0372c3b561
	.xword	0x62e41242000c34bc
	.xword	0x4b35dbd5f6df5a36
	.xword	0xd933632138d7434f
	.xword	0xf83766cf211e3442
	.xword	0x7fa357aaf1fcd404
	.xword	0x14512ec477b8bd40
	.xword	0x23ed119035474876
	.xword	0x1f235c704dec1796
	.xword	0xd84928329b338493
	.xword	0xe5c864554e12e95c
	.xword	0x750707c9a07645ce
	.xword	0x358f3fef9ffd6ce3
	.xword	0xdaea5cdaafa94ff2
	.xword	0xacf7a2460118b276
	.xword	0x66b84e109e0c6860
	.xword	0x054f1a685a6de04f
	.xword	0x20652ecc95ebe854
	.xword	0x530acbb97c5d4c16
	.xword	0xd6f7728843bcf948
	.xword	0xf1981a0c23bd155a
	.xword	0x8fc3d55aa7f404ed
	.xword	0xf51910aba47c890b
	.xword	0x58e4b0adfa81499d
	.xword	0xf6c5e712a3b9c6a0
	.xword	0xab80d4929c8c0ddc
	.xword	0x2f027213adea2139
	.xword	0xa9695a1d3e831a29
	.xword	0xa19e6b27e98d652d
	.xword	0x1d69cdef402db77c
	.xword	0x9f9cdc8d35cea08c
	.xword	0x15e2ea504cdfd6ac
	.xword	0x8b1e3f3c63e077c5
	.xword	0x360c14241d297e06
	.xword	0x039efeda420f55e0
	.xword	0x3fbda5d47166e714
	.xword	0x4efb23a8a3923a06
	.xword	0x8a9f770f5cc8d6aa
	.xword	0xc2b0f49355635dd2
	.xword	0xce0872cc1c23ca89
	.xword	0x39111905815482cb
	.xword	0xabccdab4a2ab581e
	.xword	0xd808e1cdc24a67c1
	.xword	0x442d3a425b3c5ecf
	.xword	0x9fdd95a3e599de2e
	.xword	0xb988ab3f25a36f47
	.xword	0x6000fa485d95081d
	.xword	0x5a354a40442fc853
	.xword	0xda2042cf672b4586
	.xword	0xb9dc266f1bf5251c
	.xword	0x71dd12dedc506e8b
	.xword	0xd3e120b3247ee9d5
	.xword	0xa6479ab0d3017767
	.xword	0xb30e53ff32da1ac8
	.xword	0x037a55d053ed9828
	.xword	0x6517de8535f538e2
	.xword	0x2bbe4d364616660a
	.xword	0xa693d63b0f179977
	.xword	0xb8b3f149e7ff3925
	.xword	0xc143d43051f9ea8e
	.xword	0x7d18aa65532631ff
	.xword	0xfeb9182ad917f3ab
	.xword	0x8542628e8811d62a
	.xword	0x3195cdcc95b13211
	.xword	0xc2374b745d275911
	.xword	0x8820cad9d7cf7c7e
	.xword	0x3204b284a2302216
	.xword	0xf66952d95c7e68a7
	.xword	0x21ac070278bdc532
	.xword	0xbf8df7bd6d16798a
	.xword	0x85d4a18403c698c8
	.xword	0xac3555bae2c81225
	.xword	0x69a2e022845bfac5
	.xword	0xffa5b1997279e8db
	.xword	0x1cec4d82c625c1a5
	.xword	0x2bb014a3a0def6f0
	.xword	0x38d9650c8b2feb9a
	.xword	0x5e5a8dc04818e5e0
	.xword	0x5152ade89a4538a9
	.xword	0xc800c759a489195b
	.xword	0x85520714c60421dc
	.xword	0x762a8a58f923ab63
	.xword	0xe72db3238b241038
	.xword	0x112738d6b2f53f7a
	.xword	0xc8d493e3240b816e
	.xword	0x21d927d074b7d420
	.xword	0xacd5b3d798a430d7
	.xword	0x946c5f7630be4f30
	.xword	0x4572436bb36c8e5d
	.xword	0x82dcef88d83a9a61
	.xword	0xe9330bfba39e918e
	.xword	0x9426acf11ee813c0
	.xword	0x5e74af0487b73812
	.xword	0x3b69b59e6817e643
	.xword	0xddb1f29ea9469b3f
	.xword	0x6eaa1dac2736d1fb
	.xword	0x374d39ddfb9bfe97
	.xword	0x37152b4dc8272f44
	.xword	0x4b9c6576b6d53750
	.xword	0x1b057919fc95a2b9
	.xword	0xe45426957bbb7e72
	.xword	0x34df0ea69e4a3cfe
	.xword	0x859167cf5e0397e0
	.xword	0x9bde6219f3f7684c
	.xword	0x22b2f86a2f85d47c
	.xword	0xe93fb3dc641741f5
	.xword	0x3a6734657d153c8c
	.xword	0x6aa82f703b154029
	.xword	0x99b58e6791b18318
	.xword	0x52a8cdf1608f8e3a
	.xword	0x372ce068208e964d
	.xword	0xf5d39cc70baf311c
	.xword	0xbe34dfa0c316bfea
	.xword	0x29c277ff7534d949
	.xword	0x4981447c8c4f959f
	.xword	0x76f7414f9e65b593
	.xword	0xd4613f0e53881554
	.xword	0xac2cf5ade4f1ca13
	.xword	0x4a02c81d2848523a
	.xword	0x5babfeae93da1283
	.xword	0x41c7a6b8bad42731
	.xword	0x47806e74d14102cb
	.xword	0x7460b86c3a6c6134
	.xword	0x04a335e266e635a2
	.xword	0x007dbb9272c0289a
	.xword	0x7718ea436ea3386a
	.xword	0x47d0da877f1620d1
	.xword	0x15217f3ac5f831a8
	.xword	0xd95360aa13555f39
	.xword	0xd31ad26c10d234d4
	.xword	0xdfd605d0068eaeef
	.xword	0x87c02342dd43f09c
	.xword	0xf31501394b7cc55a
	.xword	0x2d3cc413a4755cb4
	.xword	0x7348d2a5db24cbec
	.xword	0x59f04e97c15a0534
	.xword	0x219ee7f323a92fa2
	.xword	0x3a2f0a1540de4ce6
	.xword	0x832cffaed79cf9ab
	.xword	0x3c5f03e90e46444e
	.xword	0x586ac45cb2999fa9
	.xword	0x9d1c6e985a18d83d
	.xword	0xcb38af991dc11ec4
	.xword	0xd14e6bba59ae870a
	.xword	0xfd12bacc0522e553
	.xword	0x2717dda560c2c0cc
	.xword	0xca3287c145b3934d
	.xword	0xc9fab85b0d9e4935
	.xword	0x50fb0e6c575e159f
	.xword	0x67ddcadb371b4d05
	.xword	0x0b6ee7cb6d7e30bc
	.xword	0x6e4bfd9aa9f1d4b8
	.xword	0xeed96e1dfa0bc569
	.xword	0xd66abf754242d24c
	.xword	0xe69abea2e00a7cb0
	.xword	0x3aa45dfa3ab38ae9
	.xword	0xcf0887cd495864e8
	.xword	0xb9d8f5ead07d7641
	.xword	0xa83b1881254f132f
	.xword	0xaf393d5d8951da24
	.xword	0xc66831a7c89367ed
	.xword	0xe0485559381ff3f9
	.xword	0xa61b9ac8084e4efa
	.xword	0x95f3d643ed070f84
	.xword	0x9010446ed6d75c7e
	.xword	0x6690213dc6635f23
	.xword	0xfad90ef0b424f88f
	.xword	0xab01f41cce194dde
	.xword	0xa34c25bb075aa842
	.xword	0x7c283d679af42c6f
	.xword	0x87ac6501e4ee6cbd
	.xword	0x76ada1a73b43a02d
	.xword	0xff64163718435880
	.xword	0x26892ce51208c6d0
	.xword	0xd340d519f22570b6
	.xword	0xd5f799a334f396ce
	.xword	0x59bfb6d1c8150918
	.xword	0x0ea1454891fb4803
	.xword	0xb78be447082a70e3
	.xword	0xd28ce5cbcde3b9e6
	.xword	0xdb461d2d82a6ee0c
	.xword	0x459d7ef6264c4da3
	.xword	0x7b33deeeea6f17a4
	.xword	0x3f4cb36e633fe12f
	.xword	0xaba5faab73429967
	.xword	0xfa278649fe86483f
	.xword	0x86239c297ba322fc
	.xword	0xf1a2f3b4cdad8bae
	.xword	0x6a250090584057e1
	.xword	0x7dcdc13d891d8f94
	.xword	0xdb3e9f6e48644332
	.xword	0xab293532c0a43de9
	.xword	0x40a434bfd21e0a61
	.xword	0x4fc40db2ed7947c8
	.xword	0x203fa749fb213d6c
	.xword	0xb32af853ea1eafd6
	.xword	0x023f91309cbc9edf
	.xword	0xf1e626705cf89abe
	.xword	0xe7cc692fd0eb8604
	.xword	0xbbe1053c1f21f5a6
	.xword	0x0689946cccb4004d
	.xword	0x3985e0015dd98b01
	.xword	0xd97784ecb2e0c313
	.xword	0x63330dd44595aa24
	.xword	0x19002517f5987ff8
	.xword	0xb190f3407b54ebe5
	.xword	0x31321a43743223f1
	.xword	0xf9c07a0fc9a69d51
	.xword	0xbfb444cdf6383486
	.xword	0x4644621262db45c5
	.xword	0xa146b858adc3773c
	.xword	0xda486e115c08c2b7
	.xword	0x248969eb0914c520
	.xword	0xea776708c14aa48f
	.xword	0x34325d76832435bd
	.xword	0xaf0929f5006a6dad
	.xword	0x13f4388337bd678b
	.xword	0xf0c3d738a79a4585
	.xword	0x1aac6ba6b7a4b010
	.xword	0x1fa3c7501265643d
	.xword	0x8513348ac123450a
	.xword	0x30e1eeb1c0fbcc0d
	.xword	0xe55955fe4697ac80
	.xword	0x4ab9bc802a4a86c0
	.xword	0x412d9ec6bd17deeb
	.xword	0x4d4f4bb2922e7817
	.xword	0x6c368310e5d45241
	.xword	0xc2fb37e7a286363c
	.xword	0x7cea6cdc90fb9747
	.xword	0xb7b13476b021bb03
	.xword	0xb5b8f4a8dd1b9953
	.xword	0xf903459a400adffd
	.xword	0x1b6f2f7d59085860
	.xword	0xd09aeb797dab2918
	.xword	0xa9fdeed68990a157
	.xword	0xed4487b838406794
	.xword	0x13e07b5bae06bd1f
	.xword	0xb7784edfef7cc19d
	.xword	0x6a64534bf03b54ff
	.xword	0xfaf095b8245524bc
	.xword	0x2135a45b9701250a
	.xword	0x9db403f9dfa7b5e9
	.xword	0x8c48bd8bdd5d1895
	.xword	0x510b8729b2f2ac2c
	.xword	0x90c9d713f2099993
	.xword	0x9795049eb51e549b
	.xword	0xc242803c6f4cb45d
	.xword	0xaa60000e750f81ca
	.xword	0xd3bb6970cad17cf0
	.xword	0x467b3d6945f36991
	.xword	0xd5bed2a03a440c04
	.xword	0x15af492bea0f546b
	.xword	0x964b05ac08cc23c8
	.xword	0xd736543657a5343a
	.xword	0xe574c20b3c7ad6d9
	.align 0x4000
	.data
data_start_2:

	.xword	0xa8f6107ab051e787
	.xword	0xb2109c592ef2b730
	.xword	0xa16e2349106824de
	.xword	0x2395155607d962d1
	.xword	0x4cc27b2963d59196
	.xword	0x530ad5dcf8cf43f0
	.xword	0xfe86055140d1a9ad
	.xword	0x0f539cf9698bba52
	.xword	0x55ab267f0b8f93b7
	.xword	0x7b1c3ac7f671f5fb
	.xword	0x38e31bd00c05b58e
	.xword	0x0e5499c91561a980
	.xword	0xfeee5f8067e25a0d
	.xword	0x1c778a14097565ac
	.xword	0x3d0c081f1694e6ae
	.xword	0xca0cb27a5833f30b
	.xword	0x037bc4f268ee337f
	.xword	0x938b7b9c026e7f00
	.xword	0x6b2b388bfc344a09
	.xword	0xe81fbff0636b0d58
	.xword	0x2baa9ab4af7ec7fa
	.xword	0x8a6ff9641fb6b0f6
	.xword	0x7ef70e5e5a64a449
	.xword	0xb4b5235ce58a2456
	.xword	0x0e850ccb4a07965e
	.xword	0xe3d224edfb0b0095
	.xword	0x757b1e426e829479
	.xword	0x474c0191a9d0ea30
	.xword	0x83eb36687d3528d2
	.xword	0xf77c48881fe0316e
	.xword	0xefa3d3c463186ffb
	.xword	0x9dd47b4f69be4a40
	.xword	0x8682a0d7fa3f1410
	.xword	0x1c6b61138dd23e78
	.xword	0x33098c364b6e9035
	.xword	0x038f01fff5fddbf2
	.xword	0x32086076d0130b5c
	.xword	0x414ec91fd318401c
	.xword	0x775125257a33195a
	.xword	0xe4371e6fe076d795
	.xword	0xd18b4841524293da
	.xword	0x878263d130c43585
	.xword	0x283810e11dc35288
	.xword	0xc89189cd1990e2e5
	.xword	0xe528dfbb19fe1527
	.xword	0xcf956bae578a4caa
	.xword	0xe528f1e8d77eab77
	.xword	0x2fadba01cd88b8d6
	.xword	0xb554ee6ee282779a
	.xword	0x76c01afe6c24933e
	.xword	0x0dbed0ef4f8ddbda
	.xword	0x3ada629e402e910e
	.xword	0xcd7a2c0488f876ff
	.xword	0x2af54c38ca5ff55c
	.xword	0xf5c4bf37fbc095f1
	.xword	0x3190ac707098cdc1
	.xword	0xd2ef21267b241cc7
	.xword	0x7a7bda12f291bcb1
	.xword	0x539fabd0e8fd3d8e
	.xword	0xb369f0ed0192479e
	.xword	0x7929d6812befd6c8
	.xword	0x97212fcb412e9652
	.xword	0x8bb81a97c256b0a9
	.xword	0x3ca1e1b1f6b39ce4
	.xword	0x429575b6a3a26b13
	.xword	0x35699400da481e23
	.xword	0x995301879037e6cf
	.xword	0x08e54004359b94cb
	.xword	0x28192ca03c03d39d
	.xword	0xb1f008acf4296c95
	.xword	0xad3b1452dd6d364b
	.xword	0xc7c555743ce468c3
	.xword	0x9ee29e2863505ab4
	.xword	0xa55089682c96978e
	.xword	0xbcfbf747cd150afd
	.xword	0xbc2ff1444545448c
	.xword	0x9c9464619f2d98b4
	.xword	0xe3b1d74dab7b1989
	.xword	0x3820c0bac02530e0
	.xword	0x3ec998dc4dc30bfc
	.xword	0x837f77d64d2e39a7
	.xword	0xe8f5ece62dc4ca84
	.xword	0x27038fc72ede9277
	.xword	0x55e010253f3b5182
	.xword	0x8f7e3855bf329d16
	.xword	0x20c2090a53821b51
	.xword	0xbcaaa12c5116f970
	.xword	0x44860912ae8af046
	.xword	0xf91cc20ab039b8b6
	.xword	0x5d6b60a40329a2bf
	.xword	0x2fd9798c408252ad
	.xword	0x9ba51f2df82b8e9c
	.xword	0xf36a98620a60707d
	.xword	0x0f52f4012e1c2bcb
	.xword	0xd2185734b6e414dd
	.xword	0xd00d9fdf64424ea1
	.xword	0xa7a66e1e059867cd
	.xword	0xaf8fec5b8d056e4b
	.xword	0x58c8d0d2f7af5df8
	.xword	0x4505341eca56957b
	.xword	0x25113cf5e6152576
	.xword	0x3582705fd16ead95
	.xword	0xa4ff05b0505ea99f
	.xword	0xc628c74791d83a5c
	.xword	0xf139c17f1df8941e
	.xword	0xe1a6d87dea4e537b
	.xword	0x992de5fa34c89cb1
	.xword	0xb36d8ea1357ef425
	.xword	0xfdbec676d04b5838
	.xword	0xb4d556bd9b1c2836
	.xword	0xa3cc81304eceefce
	.xword	0x8512f37b66e178d9
	.xword	0x68ae60e9d65051ed
	.xword	0x811de6352121739e
	.xword	0xe83970751189a855
	.xword	0x1365831bb5c565bd
	.xword	0x2b4b28bdc70d4a52
	.xword	0x2a5e1a6137ebd911
	.xword	0x381948e8936e0498
	.xword	0x1a91b1e98b7a2888
	.xword	0xbeff1622e3b65e5c
	.xword	0xa0f5fcfa87f30bd4
	.xword	0x2c4cca863c09d749
	.xword	0x90252e32cb35039a
	.xword	0x1b2e4834e36ae9b0
	.xword	0x1ce446fe62eed13e
	.xword	0x1be59fddc64e6208
	.xword	0xf568a164f3b14ead
	.xword	0x58784bbc78e62a3a
	.xword	0x873aac48ecb42f06
	.xword	0xcc9cdbe3243b03dc
	.xword	0xa765160e386adf5e
	.xword	0x2ed990c07ece520a
	.xword	0xf73d0dcdc849ce9f
	.xword	0x782b6a227accaf4f
	.xword	0xdc522c69a437d3a9
	.xword	0xc6342e8e881f0ed4
	.xword	0x77e5269dc70ca344
	.xword	0x95f7cf03292492be
	.xword	0x2c0c40901f4f04c8
	.xword	0xe93ec2cdc5c16c40
	.xword	0xf007ded75d3aa5cc
	.xword	0xfe165df5c8eb11d2
	.xword	0xace5b4f45cf96c50
	.xword	0xc281af19a3a3c9ac
	.xword	0x2eacb094767c09b5
	.xword	0xdaf83504bd1f8222
	.xword	0xa350bbb02e3f57d2
	.xword	0x5d1025961d073e92
	.xword	0x1a4c1a9b6d9e6a8b
	.xword	0x2650a3e37d9e71d3
	.xword	0xe3af034e03b26eed
	.xword	0x12a2310cdc3a0cb9
	.xword	0x88193e2f69255280
	.xword	0x885c3b78f2dcafc8
	.xword	0x28be179417f8e6e0
	.xword	0x614400e311d339ec
	.xword	0xe5d71c091b48a99e
	.xword	0x822e4fb4a1b72c3d
	.xword	0xe86c93f47561ee7b
	.xword	0x66df264ef9f3c376
	.xword	0x97afbe8294f6c8f5
	.xword	0x05b114a3a496b1f0
	.xword	0xb142890dca3bd0e4
	.xword	0x4ac0ebc1af9fdd43
	.xword	0xb4d03983d61ae075
	.xword	0xfdc9f2a8f04ee3fd
	.xword	0xe215fcba7b7dacb2
	.xword	0xc8864dedbed77a58
	.xword	0x813084d91cdfc880
	.xword	0xce6e86af7fd9c1f2
	.xword	0x01a705f4547fc382
	.xword	0x4f129ecc4542ed14
	.xword	0x7fcc7649d151dbfb
	.xword	0x89c99bec62450145
	.xword	0x472332afff9abaeb
	.xword	0x861df8b328063ee0
	.xword	0x6f21ba768cdc7a23
	.xword	0x1c4db5141bd84203
	.xword	0x0a4c748841b500ed
	.xword	0x688399dc1fcede49
	.xword	0x3783cb595c552834
	.xword	0xde067276315ca5f2
	.xword	0xb8bb7d6e56041ad4
	.xword	0x58fd4015a1fc722f
	.xword	0x0b17a286635fdcf1
	.xword	0xcdf6fa0456ddcf59
	.xword	0xb9dbd6fd5ecb61f4
	.xword	0x9283c09ed9b17d11
	.xword	0x2429056dde824a0a
	.xword	0xc43dfa3d7cb7ff22
	.xword	0x890a3ee238fcfa11
	.xword	0xe3055bbef0609782
	.xword	0xb570d043a8ada39a
	.xword	0x6c0a40e636cc095b
	.xword	0x27e54490d0619e6c
	.xword	0x3d8dd4bf4fc28106
	.xword	0x839a113ffc4e28b1
	.xword	0xa9a07f507850c606
	.xword	0x1d9608a254da1eca
	.xword	0xfa00084ea1eecbc4
	.xword	0x7e616201121092aa
	.xword	0x56086384a929b256
	.xword	0xb2562b09e0ec994b
	.xword	0xd7f6f0891c69edc2
	.xword	0xa3c6116c4a2bfd8f
	.xword	0xe453425e3e93fe80
	.xword	0xf3233ac9d80ab671
	.xword	0xc881cd0ec0707343
	.xword	0xe07cf5657578115d
	.xword	0x4feb3e0faecb4db2
	.xword	0x5e0b82662ee8c32a
	.xword	0xa01921f0e693b495
	.xword	0x104172bc8affb3a7
	.xword	0x58fd1ff72b00700b
	.xword	0x00747b54f1743a0b
	.xword	0xb4dae3141cb7cf35
	.xword	0x2be7eaab1eab8bc6
	.xword	0x314680828f1aa1be
	.xword	0x1be487a6c87c0ccc
	.xword	0x519cf1bf2c6872fc
	.xword	0xc8d54264669181a0
	.xword	0xcfba4a037c346fa8
	.xword	0xed53860da64f25a2
	.xword	0xc15854adfade669f
	.xword	0x6516c75642d34eff
	.xword	0x6b7fc32dacb758c5
	.xword	0x9da6c5a975a8e877
	.xword	0xf4781e79c1b96d77
	.xword	0xd0807348be5f9e82
	.xword	0x42e4ae0c3d9a04f8
	.xword	0x4672e10c971ff0c7
	.xword	0x4879056ab142c213
	.xword	0x4155cc97920eff33
	.xword	0x76071daf8eeff503
	.xword	0x3799cc2709c95aea
	.xword	0xb9424085811abe3a
	.xword	0xd4f856d08547992b
	.xword	0xc6dea6df264eeed3
	.xword	0x0f1e71e7b2ef9022
	.xword	0xfa5c26f646b52ae3
	.xword	0x4be1aa1c87deadf3
	.xword	0x7015766c7eeffd8c
	.xword	0xf64058bbb7c40748
	.xword	0x707b3dad371eed47
	.xword	0x0efa286dfdb7fb20
	.xword	0x7df8e5e628b1c1c5
	.xword	0x557ddb0c75ddaf18
	.xword	0xed765b90ef78f871
	.xword	0x8eb7d7d0b24a14e5
	.xword	0x56fa2bbf4487c63b
	.xword	0xdaabaac871270af7
	.xword	0xa6aaa70d0934ee48
	.xword	0x22a1adda19a355e1
	.xword	0x5acdb9bbdb9ac930
	.xword	0x22a25d3562c1c779
	.align 0x8000
	.data
data_start_3:

	.xword	0x618116b3d56a11d6
	.xword	0xb3b4d62c09b775c8
	.xword	0x5ec2d80ccd195bf9
	.xword	0x268bfc87d63a6cfc
	.xword	0x9bc2108dc07b908d
	.xword	0x98fb8be370cd62d7
	.xword	0xd8c7fed2e8aaf4c2
	.xword	0xdf7f094b88d1f00f
	.xword	0xfbd6f6dfe6e14449
	.xword	0xfb40374065e49c33
	.xword	0xddf2d1049633df57
	.xword	0x439eb7e18f1b744f
	.xword	0x684e1f1605480038
	.xword	0xde86159d2e38a3df
	.xword	0xf4f0c922a4860f5b
	.xword	0x9b54f2712a1a3a64
	.xword	0xec2fdb05502b53d4
	.xword	0x519622aa1dc0ed46
	.xword	0x308455cadf9b555e
	.xword	0xdfe2bc68fd2d8f3c
	.xword	0xbffe1e9106056aeb
	.xword	0xea821e887e1a1b25
	.xword	0x8e41ef0b86a4b8ed
	.xword	0x8f85f7c4d90d97d4
	.xword	0x3ccd6d6706edcdf7
	.xword	0xd4b4bb06f495bccb
	.xword	0xb7b11cd15a9d2366
	.xword	0xbbfa926575530c0a
	.xword	0x2eb52e14babccb36
	.xword	0x3811d2c4b7ca1cd7
	.xword	0x94c65314793b50c7
	.xword	0xece38b0532c36d4a
	.xword	0x363557a7ffe8dbc9
	.xword	0x6606b93dcdfef1bb
	.xword	0xfce509bf4a1b360f
	.xword	0x69d4df3d5e508dc8
	.xword	0x391b7e928204520b
	.xword	0x02325a10860efe93
	.xword	0x2a4a73c9243d74c8
	.xword	0x06f19aeeffd74966
	.xword	0x5943cf265009ed24
	.xword	0x69cfe7e7c264254c
	.xword	0x7fa153e753329968
	.xword	0x7ea5f5efbe30e7ce
	.xword	0x1ca0c6fcf17c64f8
	.xword	0x91756c152c5342cb
	.xword	0xc005179f6ab0f688
	.xword	0x3714c6ca4a5715b1
	.xword	0x22fb237772a446d6
	.xword	0x621034006a65ea8e
	.xword	0x9ab8d5b32545e955
	.xword	0x75af9de0637071e5
	.xword	0x00518f25d8294628
	.xword	0x4eca4825893779c8
	.xword	0x56890f1e57f63e03
	.xword	0xebb04d63b092c624
	.xword	0x229a10e9a2523e5f
	.xword	0x7c315de9bcd243da
	.xword	0x44a95da3aed9121b
	.xword	0xb6c12903791a64ad
	.xword	0x7d575ff79174ba85
	.xword	0x67738e6d37a47e2e
	.xword	0xf39be5147327544d
	.xword	0xd2eb816d69b955f2
	.xword	0xd20cb1e4a8501061
	.xword	0x7376934941f84f3b
	.xword	0xdac5dc6f5d76b182
	.xword	0x5ec5d530bc21a7e8
	.xword	0x31e438fab5e13eff
	.xword	0x41cf53bf060cf4f3
	.xword	0x24012c4d50d530bd
	.xword	0xf1bd3f0b840c8aa3
	.xword	0x298c429d1fad8b43
	.xword	0xc2a8d698683004a0
	.xword	0xf5030b103390645e
	.xword	0xd407c858464f2ecc
	.xword	0x268b2d178c12f8be
	.xword	0x01c83b4bdfff375c
	.xword	0xd44f9eb12f0c1a8f
	.xword	0x76c261f6ebb08c75
	.xword	0x35df8c1df862ba79
	.xword	0xdf50728650142a67
	.xword	0x4924c76206465597
	.xword	0x89604966b17d628a
	.xword	0x9cb978593a2af955
	.xword	0x7250bd677c62b06f
	.xword	0x1e2f939290c2c2e6
	.xword	0x89120392055a9b84
	.xword	0x082f98a6dff7e89d
	.xword	0xd552bbbfde6e57c0
	.xword	0x1c5f59126c4e1c80
	.xword	0x235f1ea9ab9c6296
	.xword	0x7a56bade7fc5f25e
	.xword	0x187066ebdf39c4fa
	.xword	0x5ed014eb7f059be2
	.xword	0xf862499ecd3cef07
	.xword	0x845f12465b479a96
	.xword	0xb93210d5e61cd23c
	.xword	0xd414d60465da764d
	.xword	0x162452d9b210b673
	.xword	0x682b0f15200212e5
	.xword	0xd6235182a6f99d86
	.xword	0xdccc89b82305dc6c
	.xword	0x61783cf568afc482
	.xword	0xfb2e12ab4f71efef
	.xword	0x60194a2157b950cd
	.xword	0x3686af8f63599e3c
	.xword	0xe9c876e7871503e1
	.xword	0xbe04fb3e54b74b46
	.xword	0x4719a24364dfc807
	.xword	0xbb9bc349c9639b1d
	.xword	0x895266987a1d2f63
	.xword	0x17382e78a97e6c73
	.xword	0xfb8fac8bc13f7c09
	.xword	0x500ff5dc288ee7f4
	.xword	0x4ef3827309754ee8
	.xword	0x1bc51af8eb684b5b
	.xword	0xfd1c7b13687c7fcf
	.xword	0xc8feffaaef4d93e1
	.xword	0x95c03df4165fbe86
	.xword	0x2ad574ee29b4957c
	.xword	0x022f0328d49e76c1
	.xword	0x77bcf95dadf6d510
	.xword	0x013face60ab7d585
	.xword	0x778ded2124858924
	.xword	0x8f26e7ecd0f77bf9
	.xword	0x65aad743c9624e5d
	.xword	0xccb35d3162c380d4
	.xword	0xbc7c57ae3ad5efa8
	.xword	0xca2a5f92a8f0b941
	.xword	0x1d3644a3e7e406fe
	.xword	0x316a6373db80d1af
	.xword	0xb3dce28f0786321c
	.xword	0xa01ae5c533738c35
	.xword	0x75575f8fab7edb94
	.xword	0x1f100ffad3d6d7d0
	.xword	0xb876a5b3fe70d85d
	.xword	0x5124d1f9bd874268
	.xword	0x03afa1220404c607
	.xword	0x448bd5fb247356cd
	.xword	0x75acaffc2a6733b4
	.xword	0xabbd6bea2978ae0a
	.xword	0xb51d6f89ac2de1c5
	.xword	0x9460cd928d57313c
	.xword	0x61b8c15af8fb84b1
	.xword	0xa27f9df6d5fb57f2
	.xword	0x31a6f01fe77d98e1
	.xword	0x359d490a0c4f8d80
	.xword	0xbfb441dd23421675
	.xword	0xf757f160526c0226
	.xword	0x424b398e4bcbaaf0
	.xword	0xe9c5157117e0928a
	.xword	0x9ea1eb47f73d5315
	.xword	0xfa015a69edb3b2be
	.xword	0x0df7c63e1adc6c45
	.xword	0xe7ae47029391603a
	.xword	0xf3588d8234d85ca8
	.xword	0x0d8407073df9ae64
	.xword	0x3d2afbdcbe6dc975
	.xword	0x90142daf9ea49ce5
	.xword	0xb5b9da00b16b5617
	.xword	0xfe4ce07c4f63a74a
	.xword	0x6f4fa37e6367fc7d
	.xword	0x718f1dd1656fa760
	.xword	0x03698e1cc7eb5b29
	.xword	0x579dcf289888487c
	.xword	0x4ae1abe793a5e917
	.xword	0xe9cf61b2229dda23
	.xword	0x962b5971873c9dfa
	.xword	0x99e5a2afaba819e2
	.xword	0x4066e38144125d72
	.xword	0x421c0f0e61582173
	.xword	0xc4427eee7db203c7
	.xword	0x6d8588ba1a87152f
	.xword	0xb4ce4b5b87ed0461
	.xword	0x562e11409b60d37a
	.xword	0x6804d9eedebdbb03
	.xword	0x65bcb85f59ccb769
	.xword	0xa15483d946d27790
	.xword	0x46087f3a56f1cf1a
	.xword	0xdf92856c6db9f4f4
	.xword	0x42fba84a7891ba49
	.xword	0x48b225f2147ce4c5
	.xword	0x19bed927376f3e0c
	.xword	0x5b863c1cc9737ee1
	.xword	0x8c5706ed0032655e
	.xword	0x1796fe71ba9d549e
	.xword	0xc0d2ed93bbca4fae
	.xword	0x2ac5a21bf88ea724
	.xword	0xa9964ac0a1d69a9d
	.xword	0x74cca90ac5615cd3
	.xword	0x5dc32bbfe89ad55d
	.xword	0x531c9cc4da87a4ad
	.xword	0x33e1630f163c306c
	.xword	0x64d2a5e80e29a18c
	.xword	0xc2fc8da75e000fb3
	.xword	0x9655b7756218310c
	.xword	0x42e65c6ec73dd9ef
	.xword	0x509d2db4798a0800
	.xword	0x3ca98876b12caecd
	.xword	0xf3309b5c801fb7f8
	.xword	0x6edea18fa27954bd
	.xword	0xcc61488f6d78d941
	.xword	0xa042d530419f165e
	.xword	0x5afc4ef76129067a
	.xword	0xc88d9fd99439cde0
	.xword	0x4f924c54be7a4559
	.xword	0xcbc36627011e609a
	.xword	0x5e6718a931ff6cf6
	.xword	0x44432df75108d89d
	.xword	0x0a7ef5ba97909cbe
	.xword	0xfedc2b8d0ab5c5fa
	.xword	0x17d099d82c6bacea
	.xword	0x9688d411b0b50b05
	.xword	0x5312a64546150d28
	.xword	0xb745f0e2b735e203
	.xword	0x6944b3cdcb787a50
	.xword	0x38b543c9c40daf6c
	.xword	0x4988ddd38425bbbb
	.xword	0x1a200073e1ce42b8
	.xword	0xf59ff2d438303df9
	.xword	0x838bae7788149a97
	.xword	0xd450ca59750727e6
	.xword	0x01e58e652d688965
	.xword	0xceffdc3ffabc1819
	.xword	0xc5d06c7b0bb262fa
	.xword	0x0c4c2a9e6507cb4c
	.xword	0x09e0adef6a80c4e3
	.xword	0x19ddb32ba8555c6d
	.xword	0xbb0cfced3c03809d
	.xword	0x0f67293fa75a1bda
	.xword	0xe3a765c6f6205571
	.xword	0xf393536600338926
	.xword	0xe7e74ecf04e557d7
	.xword	0x3958f798b1453b7e
	.xword	0x8496a4aebbe2cf31
	.xword	0xb5a202ca7f95dd66
	.xword	0xace0e782e0d41082
	.xword	0xafa5388517c472b6
	.xword	0x416a0f8fb9491044
	.xword	0xc8f892cf97d5634c
	.xword	0xe3886bf5fbca284d
	.xword	0x686ec62709f73da0
	.xword	0xe9f11618b705b06a
	.xword	0x2c34e09d3db447d5
	.xword	0x2138b45226a8c5c1
	.xword	0x18c122d0dfa61276
	.xword	0x3be408196c1ca430
	.xword	0x156bca9636299b53
	.xword	0x8c99f6d539bbf8c2
	.xword	0x69ece936b4ba489a
	.xword	0x0d3d8eb6eba28ec8
	.xword	0x7c2027a66808ece9
	.xword	0xa0257d7567239b7d
	.xword	0xa853cf2bf29dd864
	.xword	0x94f7b7ec68cd9bce
	.align 0x10000
	.data
data_start_4:

	.xword	0x6342c70d37332b88
	.xword	0x555a075b20ab4237
	.xword	0xea8b9a6b2fbae568
	.xword	0xe29c7debc41a96a6
	.xword	0x60f50b27884962a4
	.xword	0x8dfe3c78775d5c7e
	.xword	0x2348fb3c12fc34be
	.xword	0x964e5cc0bd6bc8a6
	.xword	0xa0d7ac0db08bb361
	.xword	0xb24fa90521c6dc5e
	.xword	0x55105898670c61a1
	.xword	0x9549b7a1a5660a29
	.xword	0x8a4a6f876845e8af
	.xword	0xa2c2347bfb9a7a3c
	.xword	0x5c332b6ecf4531cb
	.xword	0x103e0cfd378ab744
	.xword	0xe793eb26a27822c5
	.xword	0xd06ae99fc39353ca
	.xword	0x8d0c5807d296b0ce
	.xword	0x9a0d8643f45513ba
	.xword	0x2148513ae6354ff6
	.xword	0xd9821a0d9f93c729
	.xword	0x13570281fd765e33
	.xword	0x1ac32c1a98035b8a
	.xword	0xe2ab690a5347a784
	.xword	0x9a5862911d2cc151
	.xword	0x2453c4afa8b9830f
	.xword	0xd1b089f2b30eb832
	.xword	0xf331691ebfc11ba8
	.xword	0x89893ac1105219bf
	.xword	0xdec40fe2ffc37121
	.xword	0xfd273a2985483f27
	.xword	0x01fde841a5bde050
	.xword	0x3c11530ced42d8ec
	.xword	0x0bcf1f4eaf24700d
	.xword	0x0189e4014c566fe5
	.xword	0x6f95dc310130f6fd
	.xword	0xc08fa98bcd92d7c6
	.xword	0x5169eb94cdd9dbac
	.xword	0x7e542ff8d74a3653
	.xword	0x3c98550e109b574b
	.xword	0x19f1702c06626246
	.xword	0x561bcc4242bc7c4b
	.xword	0x6d716c22772681c3
	.xword	0x0d557df59e060c80
	.xword	0x62a317cfbd499f18
	.xword	0xb151de2e3a1660a9
	.xword	0x19ce71b4089265a8
	.xword	0x084dc82863d81cad
	.xword	0x6abcafbebf58d5a0
	.xword	0xf64dfa79aa7e84d4
	.xword	0x487111da4392eb69
	.xword	0x4f7d883733c0c83f
	.xword	0x25793fc71a11310a
	.xword	0xb73cff089d32e97b
	.xword	0x0141e3ac48761642
	.xword	0xca090419502f858a
	.xword	0x5430e085399db71c
	.xword	0x3bd11a471cc5f078
	.xword	0x263d213235c1e421
	.xword	0x32a03bac8a5f558d
	.xword	0x53cacdbd572c8e22
	.xword	0x3edda5a08da74cb0
	.xword	0x4c250c7a1dbf4b1a
	.xword	0x3bd4ea1f095e9c3e
	.xword	0xf3036523ba777b67
	.xword	0x9014e09be04b2b36
	.xword	0x8648f28a22da3c87
	.xword	0xffacb7ec4dd7ac6d
	.xword	0x8739f4df010689c0
	.xword	0x99a6838a57877f0b
	.xword	0x2c384fb431d2fb6b
	.xword	0xf6d22a97ecfa5a36
	.xword	0x8e61a4858800e933
	.xword	0x2839f2589d1cd43d
	.xword	0x93d3fa9f38db642b
	.xword	0x6a9f5cc76b96a738
	.xword	0xa94595423d77a595
	.xword	0xd8381f400d01a0ed
	.xword	0xcc6449b3d5e070fd
	.xword	0x91139cecd6030a31
	.xword	0xcee450d4fca03409
	.xword	0x088d176e568e23a2
	.xword	0xb7c75666da3bc697
	.xword	0xdcfdb7c0c91c45ce
	.xword	0x994960070786313c
	.xword	0x95e040a4857d39b6
	.xword	0xf7da236f14caf70e
	.xword	0x3af9eaa32c443ff9
	.xword	0xf63798096872037d
	.xword	0x24dcda4c331a5c33
	.xword	0x72dcd027523b9648
	.xword	0x574b9dbefb455eb8
	.xword	0xf23e3810881693f2
	.xword	0x6ac4ab4aec76fe49
	.xword	0x408cf6e2b74cebc2
	.xword	0xd3d6b06a61c7edd9
	.xword	0x7b14f0bc97b268cd
	.xword	0xaf590f1f8458b5c7
	.xword	0x4c67615f5c21bbc2
	.xword	0x74c1d6aad5f24410
	.xword	0xfd44a8e888405294
	.xword	0x00e9f066fa86b289
	.xword	0x11e45f5cc09bc4d5
	.xword	0xb2064c037111ce3d
	.xword	0xb05b988060663db3
	.xword	0x15cedfcfbebe6db1
	.xword	0x788338eb7988b2ea
	.xword	0x601d1d0b12108ca7
	.xword	0x8bad5c6c122d4f25
	.xword	0xc463b261237ed63c
	.xword	0x22f23169600dd76e
	.xword	0x9b396a09ddd4d8e3
	.xword	0xee59ddec225a6411
	.xword	0x9e7b4faaf8f82684
	.xword	0xc3210eeae5c1a2f4
	.xword	0x2771647f8b238195
	.xword	0xe724f64434653e48
	.xword	0x4602260cbdac6d7c
	.xword	0x8ff67f1f0fb2a628
	.xword	0x911611e0da3e9e56
	.xword	0x1f0f9751984603f6
	.xword	0xb4eeb757f3a8d5cd
	.xword	0xcbada964a95a5a90
	.xword	0x4c217654c13a6621
	.xword	0x0d77c154cb744d55
	.xword	0xb91ca12434a53d3f
	.xword	0x2f48298898888e29
	.xword	0x9f83e98555a1a0f2
	.xword	0x9b3b61ba45a2d841
	.xword	0x55bd9c39348a0e66
	.xword	0x63060961daef1d56
	.xword	0x50f0c69b8c5e100b
	.xword	0x90d53214131c157d
	.xword	0x6360cf098b5a7388
	.xword	0x18c8720f3ab0bcc6
	.xword	0x2afeeae3058c4fc2
	.xword	0xe66287ceb4d149b0
	.xword	0x4e6ae51ba63d6b35
	.xword	0x8d02ccd1727e62a6
	.xword	0x918072afcaa96a52
	.xword	0xb5270b17369c2a25
	.xword	0xfa1d73668899e785
	.xword	0xc07c81feecc70a2d
	.xword	0x3135801d947db6d2
	.xword	0xa4bb32931fb85635
	.xword	0x11ffcd889e55c875
	.xword	0x41dcd9d48de1e178
	.xword	0x10f02db027287c37
	.xword	0xe4af9149b1eeec24
	.xword	0x5b7e51ef65d30d24
	.xword	0x895721cf8b3c2316
	.xword	0x3cdb3e7c3beae9f8
	.xword	0x40fc1f264f53233d
	.xword	0x91f45f13e6e4c155
	.xword	0x92e962d43321df24
	.xword	0xbe65e7ba0201c108
	.xword	0xbd15623488c927e2
	.xword	0x17074f104bb77725
	.xword	0x9edb8138b3dcac9d
	.xword	0x93899650d7804513
	.xword	0xa12929fedc651b1f
	.xword	0x8773a8d9b25d4590
	.xword	0xf64e4a37192e4bab
	.xword	0xb253afe8f162fe3a
	.xword	0x3bce86be821ebcb0
	.xword	0x4b12f1b26f040846
	.xword	0x2b4fc4b4ff5412ad
	.xword	0x863b8e57104f39b2
	.xword	0xdfe6a224dee7b27b
	.xword	0x9d3e48ba23dac986
	.xword	0xbd79278870a306a7
	.xword	0xf3938a6e2f05376b
	.xword	0xa919b6e2f37f2ac6
	.xword	0x45bcc6701dc47d39
	.xword	0x2734ae649997e56d
	.xword	0xd0957b7325e338f3
	.xword	0xaa9c3c6774755874
	.xword	0x614ee3f89136bb6a
	.xword	0xb2ddc2028bdebe51
	.xword	0x6e82941f35738925
	.xword	0xeb9b46d30986e9df
	.xword	0xa81b1d491b73729c
	.xword	0xa7854fd96dd3e030
	.xword	0x9952842e27301ed0
	.xword	0xf48d2096ea00763b
	.xword	0xe7484b1acff29194
	.xword	0xb2f44a1970cbe40d
	.xword	0x5734d29afefbb75b
	.xword	0x0566625ac1cec9c3
	.xword	0x2cfdc636ef911d73
	.xword	0xbf521c28d70eef80
	.xword	0xf6b33e192bdc86a7
	.xword	0x4b383a363e119ffb
	.xword	0x74b72fd8cbb3879c
	.xword	0x176382c64c01ada3
	.xword	0xb483ad62b43510a2
	.xword	0x061bd0b1bde24f39
	.xword	0x5a204c2437d4bc8f
	.xword	0x762aeb8cd50ee13e
	.xword	0x4b9cfd55c508fc53
	.xword	0xcb2a2cadba57b429
	.xword	0x6b22d209b2ecfc3a
	.xword	0x56bd1f52babb2f97
	.xword	0x2a38b55a5c7d23c7
	.xword	0x9e8c5607f1ecf5fc
	.xword	0x589bd7853ea322ed
	.xword	0x08226fd36a2e77a5
	.xword	0x9945864301575b32
	.xword	0xad2f78a6cd36646f
	.xword	0x5725dd8c3a077f5e
	.xword	0xc373d2cb59c3c920
	.xword	0xb36e0cf1fb313e08
	.xword	0x87993f0f62654a12
	.xword	0x6f1f0a6d0c4de61b
	.xword	0x4a8753d9938f2be7
	.xword	0x2e90c920eee10d94
	.xword	0xfca57ef743f3f216
	.xword	0x8884d7dc9ca75daa
	.xword	0x2cc50a98609aabcc
	.xword	0x79aed429da85f42b
	.xword	0x12751693bf76e742
	.xword	0xac47ba4ab385cd06
	.xword	0xc07e6918dc193da6
	.xword	0x8bfc2c0b4401ce57
	.xword	0xadf1e645ff69bf67
	.xword	0xdc039f02a9c5eb1f
	.xword	0xfaaba5ffa4c1278f
	.xword	0xd26c38ac12f86b32
	.xword	0xd82fde8bc0cb5d69
	.xword	0xa8460665bba7a318
	.xword	0x2df746d0518e1793
	.xword	0x67aaf1cb75af5059
	.xword	0x29d7a49d5d38ba24
	.xword	0x2827dda1d2adbe87
	.xword	0xa1d1daee9a17eeca
	.xword	0xd1ab5b3227d35df6
	.xword	0xca00a886b7479fbb
	.xword	0x8fbd38f22259f637
	.xword	0x2706dd3f40f732bf
	.xword	0x4d853a85bea5b9cd
	.xword	0x5db0195676c75f2a
	.xword	0xb8d72745d7594644
	.xword	0xcb1c4c54d2977f8b
	.xword	0x3a2b2ca99ac87caf
	.xword	0xab6896cc6bc338e6
	.xword	0xf0ef35fdc11131a9
	.xword	0xbe154689c39ddc0e
	.xword	0xe7e332fefe027bfa
	.xword	0x781e134d4d6ed2c7
	.xword	0x6adbccb082a0e786
	.xword	0x18bcb614a7e1a59e
	.xword	0x455c6af6b56917d9
	.xword	0x8528bc676797ae0e
	.xword	0x83c5dd2affcf4417
	.xword	0x89d09f8deb1b91e9
	.align 0x20000
	.data
data_start_5:

	.xword	0x91695c8241b08d37
	.xword	0x1e3d7db9c3c6f85a
	.xword	0xb2bc83acf05c81fe
	.xword	0x448cb968dcf2058f
	.xword	0x0b7a66e9c2954137
	.xword	0xe582002436492bf0
	.xword	0x460bcc6f213e82ae
	.xword	0xf49523d64e13b9f1
	.xword	0xf73e268c3b344698
	.xword	0xdcc8267f427bc4cb
	.xword	0xf542e1184b20ab24
	.xword	0xee2d9444eba2bd9b
	.xword	0x9b1570d6199710bc
	.xword	0x96f806c69cd56725
	.xword	0x83205552cde17dae
	.xword	0xf4f5a473629865ba
	.xword	0x2483737bcdca8b6f
	.xword	0x02cdd37b1d2acd7b
	.xword	0x008129045fd33771
	.xword	0xaa83c3969f1a7129
	.xword	0xb353e8a7b8a92135
	.xword	0xbd5abf9f969130dd
	.xword	0x834214d9086e9703
	.xword	0xbeae0815cdcf9ed4
	.xword	0x2a02a3e4a4596f7b
	.xword	0xa4e80859c2ea3571
	.xword	0x679b8846fb7d92b6
	.xword	0x0c59a2f96fb71e4e
	.xword	0xd5bbdd255de0c8a4
	.xword	0x1d88e9d80ea48dd6
	.xword	0xd303d487733fc91e
	.xword	0xb7073f5f9d4bd13f
	.xword	0x39ba90a2a2c67cc5
	.xword	0xded830b780b7d392
	.xword	0x05fdbf953b5f5205
	.xword	0xec7b56c2c9440313
	.xword	0x878be887f05319ce
	.xword	0xdf2f44dbf89b2e02
	.xword	0x1a576ec91641042e
	.xword	0xcb496f7d276e8e4b
	.xword	0x3fa9e9ea80812cae
	.xword	0xb5fb131a3c784539
	.xword	0xb8dec3cce753b0c3
	.xword	0xda78a8fcb80d1b67
	.xword	0x0d7e73536ef55670
	.xword	0x4c509e0012d36497
	.xword	0x1d2f76027c07cdc7
	.xword	0x4b24de90be361f75
	.xword	0x406ad51561e2aaca
	.xword	0x8fc496059659e25c
	.xword	0xf6e4b13892e115aa
	.xword	0xed97f59a666effd6
	.xword	0x9917acaaf033972c
	.xword	0xb458b95294ecadd7
	.xword	0x4045b359f6680736
	.xword	0xfc285823ef3bc3a7
	.xword	0xef817570a930e096
	.xword	0x0df56359f6dd7faf
	.xword	0xe43f6cd93e281e34
	.xword	0xab1ac56561b5c53c
	.xword	0x629faa126b6a206d
	.xword	0x24bf23507d5c8dcf
	.xword	0xf17804e92e675488
	.xword	0x36cbd5874cf4275c
	.xword	0xc7c1ad5013c7d7e5
	.xword	0x66685e56b347bfa4
	.xword	0xd8438cc4cd29f380
	.xword	0x00ef5442ecc262b3
	.xword	0xf90fb9abb1abbb23
	.xword	0x691f175c070617d1
	.xword	0xc92dcf7dedafa3ad
	.xword	0x14650aec8de0dab0
	.xword	0x0c157709016989c9
	.xword	0xa1f8b4db78991462
	.xword	0xbcdbba950222b7f9
	.xword	0xce127facf8483740
	.xword	0xb0f9ced971577838
	.xword	0xee00e0126405df7e
	.xword	0xcfbbde6e558eba35
	.xword	0xdee3eb4eccce74c2
	.xword	0x41e6e388a96e9a1b
	.xword	0x995a249a8dfc8e70
	.xword	0x9724cae5f72dca94
	.xword	0x1c79e7d82ff99fe5
	.xword	0x3a44ed2c30f4d792
	.xword	0xc83a1f37ffcecccf
	.xword	0xcd8a49c2a2429e55
	.xword	0xf7bf5ac089a9a539
	.xword	0x7c372f5b60de0324
	.xword	0x3ac535c108f5d80c
	.xword	0x2de195bee4f16938
	.xword	0x59cc8afb6870d089
	.xword	0x8c8c6bb684e680ef
	.xword	0x53152586ca7cf08c
	.xword	0x002227eb0f46c629
	.xword	0x652e5fa5310bbf66
	.xword	0x5bc81d19349caaa1
	.xword	0xae72a90cf69a0c36
	.xword	0x1044c2a57e0e627f
	.xword	0xdc5099ad58e9cbc7
	.xword	0xac25169ab0315816
	.xword	0x556d399b54538c0a
	.xword	0xa1cd3e283661c38f
	.xword	0x3244a7b337c9bb3f
	.xword	0xe28b94ed2bb9ae95
	.xword	0x769e9bdbb55b1b8c
	.xword	0x8baa72b530e1b87d
	.xword	0x86c1f9418e977469
	.xword	0x2fde51edb64fd6dd
	.xword	0x3771ba48285cf276
	.xword	0x1af2dc14146fc183
	.xword	0xb9913800368ce157
	.xword	0x8d264d3b1da19377
	.xword	0x46d62c05d0f6977e
	.xword	0x2fd9579e21199bca
	.xword	0x1a3b3a8b306b1267
	.xword	0x2de4812f9f03c078
	.xword	0x4ec2b4923907d57e
	.xword	0x2767054b66a80285
	.xword	0x7f6e6577c88ac42a
	.xword	0x177d0fbd23768f87
	.xword	0x6d959929a7a4ded8
	.xword	0x12d4b95b0a348edf
	.xword	0x35e1a4bd0b0cc2df
	.xword	0x1df0861644937929
	.xword	0xb71e799f7c046175
	.xword	0xf9df15f5f1eb37b9
	.xword	0x657234bb79480b7b
	.xword	0x34223d1f9754019d
	.xword	0xb301415c10d7f0c4
	.xword	0x39eee19f43dece44
	.xword	0xab75a45354d733b2
	.xword	0x20f72e6515c67587
	.xword	0x7ee0ae17415e89a8
	.xword	0x44c7e4019bbcb874
	.xword	0xd42a1433cbe46366
	.xword	0x115d5fd70b550e78
	.xword	0x67d29df0324f9417
	.xword	0xd69dae585e925645
	.xword	0x7fc85494fcda145b
	.xword	0x2a3c794dc4e33cc7
	.xword	0x1274c58096b04f5d
	.xword	0x93f9e2aae89e62b6
	.xword	0x9de00f58b783044c
	.xword	0x76ee280f756462d2
	.xword	0x9bd677e3207bfb67
	.xword	0x264a2ac386a55417
	.xword	0xf2097b8fe7091682
	.xword	0xd19ea0c3c21648f4
	.xword	0x287384cd6b83e235
	.xword	0x4299e52a93d71728
	.xword	0x8737007e3a7eb00f
	.xword	0x18344aa25293b381
	.xword	0xe4863dd398079039
	.xword	0xbfce8f3279b4fcb2
	.xword	0xede3713021ae4972
	.xword	0x6fd53f633818abdd
	.xword	0x876cf34d0d5cc54b
	.xword	0xd46c859853d82c27
	.xword	0xa984bee82e278562
	.xword	0xf014ac43ea2679c3
	.xword	0xb814d43bc8f6a841
	.xword	0x589a011dc4d5c8ca
	.xword	0x37a62190c75f3720
	.xword	0x7cb79f2e4e736e3b
	.xword	0xd74b403dd5cf7df8
	.xword	0xf4edea0c57a01b88
	.xword	0xa1ecc23b9c339e3f
	.xword	0x89226081929568e9
	.xword	0x42106a4e89f4fdc9
	.xword	0x05dbc56b56b2168a
	.xword	0xc6f735a982661ae6
	.xword	0x41ea624fec31887b
	.xword	0xb5f9ca8e96f9acbe
	.xword	0x582865dc98178220
	.xword	0x30485c6d84889e0e
	.xword	0x3579fb9afc473307
	.xword	0xe0405e129ae560a4
	.xword	0xc518942af48e66a9
	.xword	0xfc7bc451d400fad1
	.xword	0xa5dfa29a59925106
	.xword	0x1b25712cfbdd9b36
	.xword	0xbb09ef6c11339de2
	.xword	0xc9ad5f6751d4d627
	.xword	0xe9a2ccfe97245535
	.xword	0x4237b60e389f6609
	.xword	0xa3f765465d793314
	.xword	0xde7e726824e3ac1e
	.xword	0x2f7257106619251f
	.xword	0x372e333753a45ecc
	.xword	0xcbc7252da720fe47
	.xword	0x81f61dff345d47c8
	.xword	0xc04e0c44d616b28b
	.xword	0xe1d22edb4237bca3
	.xword	0xe4bebaa7c90f1690
	.xword	0xbfa2e720c5c96948
	.xword	0x5a5037e0991bef7d
	.xword	0x36c170d46df135d8
	.xword	0x9365d79bc9e5f591
	.xword	0x482349285ada615f
	.xword	0xf2791d5d920e342a
	.xword	0x58ce7c15e04660ce
	.xword	0xd63f2ed862e5272d
	.xword	0x4dfb6f0648b1c7cf
	.xword	0x5b5b46dc1af8442a
	.xword	0x4935a4e2e8293843
	.xword	0x550dc5910a7649fa
	.xword	0xb18cff1b5d9ba039
	.xword	0x3a17fdb8b26e8706
	.xword	0xac4739b1bd84a2c2
	.xword	0x5afdb83917236c36
	.xword	0x53838dab4a8fd137
	.xword	0xe84b4af5f77665c9
	.xword	0x8560be50aec96efc
	.xword	0x1a744e9ee8a106c1
	.xword	0x2d9735d6cc41eecc
	.xword	0x8dddfa7845bafa06
	.xword	0x71f444f377fc57db
	.xword	0x09ab275ce39e34d3
	.xword	0xe2bad0a9d701d685
	.xword	0x5fa2fa58ef2f48a8
	.xword	0x9b74668dd7db1118
	.xword	0x94ed8b969b62eff3
	.xword	0x226ed22c94e584ff
	.xword	0xdce3d773a0596685
	.xword	0x91c1d86b191065e0
	.xword	0x86a28b4dae51d751
	.xword	0x12e69940232d05cb
	.xword	0x2551885ce1f8ebcd
	.xword	0x3873e2b660fe1778
	.xword	0xe2b1c45bc0dc5ae9
	.xword	0x33fc7f07547cbc28
	.xword	0xf7b5f93dfcf29220
	.xword	0x66defa16f6f242bc
	.xword	0x39e7238946b294b6
	.xword	0x7596e296eb2a1f31
	.xword	0xba969541711ce38b
	.xword	0xa86efddaffd8d57d
	.xword	0x3cb5d87a80b59554
	.xword	0xc8400badbbc25da4
	.xword	0x8da8e9b24343b43d
	.xword	0x7436df1bf191ce7f
	.xword	0xd8c3a69a6db2b676
	.xword	0x523f20327fc42b50
	.xword	0xb6773acfe3f85fe0
	.xword	0xa86f77afdd8ab7e3
	.xword	0x465708d795ba9bcb
	.xword	0x95fd8b623d3eb280
	.xword	0xfd1b2540e6db952d
	.xword	0x526a554c75ad7afe
	.xword	0xfeb7c8e35bde1476
	.xword	0x483697369bcecf15
	.xword	0x54c920c2e393b446
	.xword	0x0e03b8fd850e82f5
	.xword	0x364604f162037d22
	.xword	0x78f96ed8454464e7
	.align 0x40000
	.data
data_start_6:

	.xword	0xfdbc4f87c6ad259c
	.xword	0x69c9ce5473411249
	.xword	0xc283dca7225a5cb9
	.xword	0x87c7db406c66ec07
	.xword	0x63c191688325d41e
	.xword	0x013271752a9e6dcc
	.xword	0x0b80ee3bb243a375
	.xword	0x0716e8e5563748d4
	.xword	0x962b399134e78b17
	.xword	0x377adaa1be825492
	.xword	0x9ece8679eab9ebab
	.xword	0x6f58ef65a3671c48
	.xword	0xbaaa27a9da8bf946
	.xword	0x21093b4295def6c6
	.xword	0x924d9d02dfb182e4
	.xword	0x6ee62b6095bfd0dd
	.xword	0xe00661f31ea0d409
	.xword	0x68fdfabeee78a06d
	.xword	0x7fd8835ba6758db4
	.xword	0xa0826faa6d71a53e
	.xword	0xb7bb655c55746a13
	.xword	0xc3cf43b675ca1961
	.xword	0xc5b34b5880578bf2
	.xword	0x10a125b59d5f4a79
	.xword	0xb88361d9ef1f09d8
	.xword	0xbd12e5a4acab40a2
	.xword	0xd7c9adc6c3b88b16
	.xword	0x62e08864a72915b2
	.xword	0x74ddc26b9274d451
	.xword	0xe0b5aa7ccc2b0237
	.xword	0x83b8e9422b1ccc1f
	.xword	0x523e23e8fcc6c4db
	.xword	0xf57a1583869ab265
	.xword	0x44bdbbc923476f46
	.xword	0x6ce97f49b640dfe8
	.xword	0x6ca68f6de5bdddb7
	.xword	0xfbd33fb60efd984e
	.xword	0x1935657e3ea3fef0
	.xword	0x3ea4b6a74e4256ce
	.xword	0xcba18380fdf3dedc
	.xword	0xafd6018ecc646314
	.xword	0x8be981f477110f60
	.xword	0x7b433bf8c4ef9c24
	.xword	0x959112098e6ea731
	.xword	0x3c74e7965daccf75
	.xword	0x3ce514028b737412
	.xword	0x41573d34ffb6cdeb
	.xword	0x12fb8154bffec4be
	.xword	0x11b44e973d13e10e
	.xword	0xb3694056fe600de3
	.xword	0x9f8ef499f458ae87
	.xword	0x1fd09a2effd2acb7
	.xword	0xcb47b81f4575aa1a
	.xword	0x0afa4798d1ece92f
	.xword	0xb4916827875f9682
	.xword	0xd518a2f87cdcee04
	.xword	0x04cab7c49a871c48
	.xword	0x62af29e84ffd484d
	.xword	0x54ae2d93dbbc442f
	.xword	0xb2d7b5475bafe8de
	.xword	0x62537e0c670bd375
	.xword	0x20bc43cd2d10d8aa
	.xword	0x1ea71b1ecec893d0
	.xword	0x99c60dd6bc5a8f59
	.xword	0xfe11068086c73bce
	.xword	0xe61f1cbc1aea28a6
	.xword	0x693bae4ab055a8a8
	.xword	0x177ccd1ac9bc1a1e
	.xword	0xb92a8b534767f655
	.xword	0xe058ad7d026aefaa
	.xword	0x97ce11a2bc5d71b8
	.xword	0x968da2aedef729b1
	.xword	0x4744347e567e9503
	.xword	0x35b610e46b13fc20
	.xword	0xf7433ebd11c1079d
	.xword	0xbc9227b2b8f70206
	.xword	0xb3700640581005e9
	.xword	0x2ca10555644f9dea
	.xword	0x3832f2c6c32ae20e
	.xword	0xb85ef61dfaae457c
	.xword	0x5e4ed6ce1d118533
	.xword	0x23ca639e90250bec
	.xword	0x895c855545fc9410
	.xword	0xa196dc1281be132e
	.xword	0x5ee435d62006be9f
	.xword	0xb5faac11d03a44ff
	.xword	0x076451f598b7d526
	.xword	0x13d1d4c10fc26517
	.xword	0x6ec7056f99650a64
	.xword	0xdda5016630d7f4c1
	.xword	0x130f49b379bbe6ae
	.xword	0x1e06adedce0336af
	.xword	0xefa63708c8e96584
	.xword	0xa06dcfe2bf4084cf
	.xword	0x233148a28d044af3
	.xword	0xd2dc3a137262f304
	.xword	0xa4dedc210aa64775
	.xword	0x2b68c528d2e22f8f
	.xword	0x4cb7dbddcb0e908c
	.xword	0x97d99b4bb9c92bd9
	.xword	0xf69e0679325b67cb
	.xword	0xb593cd30f9d5b922
	.xword	0x85ec74ef793400c5
	.xword	0x57da8465206ba971
	.xword	0x13639e6223e1c5dd
	.xword	0x23ec234475fddd24
	.xword	0x9e372cef45e319a3
	.xword	0x57e9e9b826a1a57c
	.xword	0xcda54d1ff0b84fa4
	.xword	0x80aa14964e14ea2e
	.xword	0x592954ca3b6d0e98
	.xword	0x0de2ced2a9272a86
	.xword	0x5e577ddaabcd2bfe
	.xword	0x707780185e89635a
	.xword	0x1a7e79cf68533ac1
	.xword	0x34273634b69b41c5
	.xword	0x8c0281a3a6c5ae5a
	.xword	0x3ba10ca39c85d2e8
	.xword	0x586ef9a3c005beda
	.xword	0x7cf32022c500f5e2
	.xword	0x8492b69c71acb0d3
	.xword	0x5d328d21fe9300ee
	.xword	0xb599c2d05479def2
	.xword	0xe484f282c8245625
	.xword	0xebdac8870803cb38
	.xword	0xf3cf4467e6a53209
	.xword	0x682d78d155d240c9
	.xword	0x4975a1db7596bee1
	.xword	0xd82f269e93962cd5
	.xword	0xc4b6f10aef484b99
	.xword	0x2430ffc9e9f7bd01
	.xword	0xef4bc9a999f5f528
	.xword	0x7244cab6fd48d766
	.xword	0xdc4886b9efdc6e77
	.xword	0x8f2af3f4f4dc55b9
	.xword	0x96ef7b0c9785c89c
	.xword	0x4a613ed106cb0b0b
	.xword	0x0557c200b678bda8
	.xword	0x6e0cea53366429ea
	.xword	0x70eb3707da6b0ddb
	.xword	0x3dbb5f9f08fc79a5
	.xword	0x0694fa5eae4b3406
	.xword	0x2dd5e1cd591a614b
	.xword	0x6b8fea0f0597fd6e
	.xword	0x1a9334f74f23121a
	.xword	0x985c846e508d1e00
	.xword	0xdc28d455cb6f483d
	.xword	0x5f29e1f832929e0d
	.xword	0x8fa52553675235bc
	.xword	0xe659371b0367087b
	.xword	0x3a2cdd8c2a94b760
	.xword	0x220f452257e7f428
	.xword	0xc0ffef6cce65fc1f
	.xword	0x987a2c0c867b527d
	.xword	0xbdcb555994005255
	.xword	0x9c94117b56d93d18
	.xword	0x0c27c5917aa8a026
	.xword	0xb683049f310e1777
	.xword	0x0604728c855558dc
	.xword	0x06b5a1f03e679582
	.xword	0xd34d96dd5c3897cc
	.xword	0xf6601b418be4514d
	.xword	0xf8d13fc21e1b83dd
	.xword	0xb9f5257127f6df88
	.xword	0x907eceafa43500bc
	.xword	0xa8c7054a11c65cbe
	.xword	0xdffe63b269868c26
	.xword	0x77a6f1de49b9ee92
	.xword	0x85feda10069e6685
	.xword	0xe949d18ec5a3d959
	.xword	0x7301da711467ceb5
	.xword	0x8f07f9f1311984fa
	.xword	0x6ca5faec1211e031
	.xword	0xcf2f5eeb16ea923e
	.xword	0x67e40018f4250037
	.xword	0x216733d35407560d
	.xword	0x5e2121e781ccd7fc
	.xword	0xd60cd95e8b3dce3a
	.xword	0xb0e6dccec64c587e
	.xword	0xe67664085be2a4a1
	.xword	0xcb1d3d74a03aede8
	.xword	0xb6cae8edea19a8a1
	.xword	0x4d5f40d5adba18c7
	.xword	0xc8e0d364813222f1
	.xword	0xe4927e831d784140
	.xword	0x92965f4199a65f2f
	.xword	0x79e8d5fd2e0095ca
	.xword	0xcc66688529266e7d
	.xword	0xf01594b3b362d35a
	.xword	0xa01b4240ac6a6cd6
	.xword	0xc4377a87a2bacf7d
	.xword	0xb1465f58fb32f189
	.xword	0x1fcb1d46e3ebee79
	.xword	0xa289e2a8e91fd8b1
	.xword	0x6f9ee3ce28309cb6
	.xword	0x16b6199365b646b9
	.xword	0x5afebd5ee437c71c
	.xword	0x93fd6d1672a4737e
	.xword	0x9442e3030955f431
	.xword	0x3f803de75ccc4bbf
	.xword	0xe4fb225cf5299878
	.xword	0x3fd9bf01eadd1c3e
	.xword	0x0b2a888756238396
	.xword	0x26523603a09b5c24
	.xword	0x93c9238c7545cb1c
	.xword	0x0610df143ce8529e
	.xword	0x1d91edeb3acc7b33
	.xword	0xdbab1ed80675760b
	.xword	0x92fcfe401db6cfae
	.xword	0x765f096e722fafe5
	.xword	0xb73d755ed3386d09
	.xword	0xde599ef5f8956454
	.xword	0x87b0dbfc95b63261
	.xword	0x8fa72f7b4b66b345
	.xword	0x7e1e7fa788a96571
	.xword	0x000404054258a586
	.xword	0x170e06fc0a199ab2
	.xword	0xf3f14187868b97c3
	.xword	0xe3d4283ab166f7b9
	.xword	0x59f1c31c84e6da66
	.xword	0x87a816bf6e175e34
	.xword	0x68f88dbd1ee6552e
	.xword	0x10449956a9086c4a
	.xword	0xd99351d8554f98ce
	.xword	0x8b80aceb4c6ce246
	.xword	0x24387b1004006872
	.xword	0xddcd002be77a27cb
	.xword	0x9f60fc17a6425f77
	.xword	0x60b18500503e5a65
	.xword	0x9d903a06f16fd247
	.xword	0x590ba09e95b82620
	.xword	0xe470f6e254b67b11
	.xword	0x51f3d2437149bc44
	.xword	0xf7ccbd3c562be04b
	.xword	0x7e5fa2aafca148c9
	.xword	0x327c7a96d738c675
	.xword	0xf6e151084f476a95
	.xword	0x7cf7d4380ee9ec19
	.xword	0x39d466303cb61277
	.xword	0x1a38c4a0d9213c4a
	.xword	0xffe87388c488407b
	.xword	0xb342608cd922b44e
	.xword	0x31822945c0e94ad1
	.xword	0xc4b25a3ee7675edb
	.xword	0xc7d5ae4305eae0cf
	.xword	0xc5dab9619ef8a428
	.xword	0xb8fe79d0bee3f5eb
	.xword	0x9db27b74abee1dc1
	.xword	0xcf4474dd0713b219
	.xword	0xa18501f841b0c669
	.xword	0xb21907a9c331a983
	.xword	0xfc4b3397a51281ac
	.xword	0x72a1235d0216a149
	.xword	0x9200cbe3e1c91575
	.xword	0xda12c106e0540e8d
	.xword	0x6c126882d90c4857
	.align 0x80000
	.data
data_start_7:

	.xword	0x3416242748feedbb
	.xword	0xf476de4b297ee7af
	.xword	0x9b8b4dac8ec497ff
	.xword	0x87b9b6e899d89807
	.xword	0x76826827723e7630
	.xword	0x03c9825722b5378c
	.xword	0xfa25b7ade8a78853
	.xword	0x3bf7c5853bb2c176
	.xword	0x182af8834c504c0b
	.xword	0x773162c10dd98e97
	.xword	0x235ff1fc65325467
	.xword	0xbbea96eae50db4cf
	.xword	0x319a7ea18fe81006
	.xword	0x9291c63dc2d80304
	.xword	0xac54d159554df4fd
	.xword	0xab21db554a75a693
	.xword	0x582bdcbaf0bbac62
	.xword	0xd8e498ffe602d2ed
	.xword	0x3f11c94e58a2da6a
	.xword	0x3a99e927c6a88920
	.xword	0xf6f08829fe92cf67
	.xword	0x1eed14d02580e775
	.xword	0x286af9f04ac6e839
	.xword	0x45b535e02f97dcfb
	.xword	0x5ab8cf669066f225
	.xword	0xe211ae6d082c06f0
	.xword	0x7e673ed655091d74
	.xword	0x3ebe5d623e9a32c5
	.xword	0xa1a4edafac4645fe
	.xword	0xe108d356d06d4373
	.xword	0x37d6975cc7e70a42
	.xword	0x5b97c3492083f6e5
	.xword	0xd2a10a5247c5ec5e
	.xword	0xac3b5ec22d45f954
	.xword	0x8a605ca59efadd25
	.xword	0x958ab9fed640afe7
	.xword	0x175eaa6c93b9e175
	.xword	0xdfe93853b66d3fd2
	.xword	0xad2c476b7b9f388a
	.xword	0x39783f691efb544c
	.xword	0xc6878b45539d14d7
	.xword	0xb3238dd7ba5c6630
	.xword	0xb9f78077207b03c1
	.xword	0x8f91ece0a81e92c5
	.xword	0x90d288c2272ee641
	.xword	0x8f7d8fe9b28b0153
	.xword	0x886c2d4fc87c2a41
	.xword	0xb023132feec90e42
	.xword	0x56a03f8a51a67574
	.xword	0x903d4500d3e90889
	.xword	0xdd68037ce5a90459
	.xword	0x5201c76b2ebb35fe
	.xword	0x7a1f25054d7ef5db
	.xword	0xbef6ab76c3252b52
	.xword	0xc8ecac35237b11af
	.xword	0xc8c1215534e47864
	.xword	0xb8c0a3c6d2f14c12
	.xword	0xcae009761bd36830
	.xword	0x570aa7f060d632c8
	.xword	0xa61d5573c5ce49aa
	.xword	0x5c4bafcf6292d9dc
	.xword	0xc409c1af33a73424
	.xword	0x9d6f950b103df1b8
	.xword	0xd3ea8b62b14a2aa7
	.xword	0x0e4c8d341cfb5626
	.xword	0xb3a6959b409eb3fc
	.xword	0x61ec8ac2970d53a9
	.xword	0x97bed3c2e9b94c4b
	.xword	0x62b500c6c7f2e096
	.xword	0x7e8b613928d0483b
	.xword	0x2f78254eeaf384a8
	.xword	0x0e8ca321ec52212a
	.xword	0x8beb0ec98fce5ad9
	.xword	0x313860dda80d64ab
	.xword	0x43adaefb915321c8
	.xword	0x774c88288e1cd011
	.xword	0x4e8380a27ae13767
	.xword	0x5fe7e740365dd10e
	.xword	0xad5390a2c227c772
	.xword	0x33d928344100c220
	.xword	0x9a43ca433479b125
	.xword	0x47c5c018d99d45ee
	.xword	0x443db342ec710106
	.xword	0x4933f9050f07a38e
	.xword	0x55f29af415784d85
	.xword	0x2295b0887751dd0d
	.xword	0xd0c9e78f7b713c70
	.xword	0xebea42a2186ba9ad
	.xword	0x26c1e7c5cf99f36e
	.xword	0x48d27cc8eb82284f
	.xword	0xa8f8aa7ae5af7532
	.xword	0x7ad805750ed8f3aa
	.xword	0x6a901fa3589960dd
	.xword	0xd9f0736508c32cb9
	.xword	0x9276c64710bd13dd
	.xword	0x96cec2ae0c7fa9d6
	.xword	0x19ff1b0248f971e3
	.xword	0x20d8b05fc929883c
	.xword	0xfda471d58e55822e
	.xword	0xdb0c832f63c6bd14
	.xword	0x9fe4a66aa4a07767
	.xword	0x236dfa7e43e8a639
	.xword	0x3afa74986bf723fe
	.xword	0xcd5a3daeeec7e0dc
	.xword	0x5ba577110aac2b9c
	.xword	0xefdfbf7663c20cd0
	.xword	0x919feb03b77110c4
	.xword	0xf4f2251fc5a18443
	.xword	0x1d5f0317692fba10
	.xword	0x2042aa24541e9790
	.xword	0x00558320314fe4b2
	.xword	0x0a8980427fff22ed
	.xword	0x5a253e8a47f8a711
	.xword	0x43f50dcc8f174523
	.xword	0x09c24f8de51be54f
	.xword	0xf990a9395abda7fd
	.xword	0x2eda34041f68fdcf
	.xword	0xb45ccf547e2db74e
	.xword	0x53b30158bcbee6fe
	.xword	0xdfe0575c9bb632a0
	.xword	0xe8b44a5e1995be77
	.xword	0x9a2e6ddff20b7d41
	.xword	0x15c7d3b6c08ff804
	.xword	0x409826d7ad05d1ba
	.xword	0xe39da4a23dc13593
	.xword	0x10ce1b363a726d9f
	.xword	0x64581d1878da9def
	.xword	0xe18e7796692daf49
	.xword	0x70be7ab4a00bce89
	.xword	0xdc1623a6d2e657d4
	.xword	0x92ace4e68dd079ef
	.xword	0x906199e27140ee6d
	.xword	0xe8aa68937abff950
	.xword	0x9c135651d0e89d1a
	.xword	0x18402c1276d21caa
	.xword	0xeae58b61d3ce4f27
	.xword	0xca083e2e75fa669c
	.xword	0xcfdb8ec775c52931
	.xword	0x38ba89e15eaa1587
	.xword	0xcd86901c847a6a03
	.xword	0x7983528cf9b19d5e
	.xword	0x1e2929f8bd4331cb
	.xword	0x78c7cfc02318655f
	.xword	0x34c38624aa17c24f
	.xword	0x48c2b6d677b252c7
	.xword	0xf56851bf9cc07fff
	.xword	0xecbde9fae4fe1866
	.xword	0xae1329016d71fb9c
	.xword	0x0990fe10878bb099
	.xword	0x6f386419dbdfcf5a
	.xword	0x60b4d15b444d2b71
	.xword	0x8607a2bd7c4003a3
	.xword	0x70d752b9d97df786
	.xword	0x6481694f7f2d44a0
	.xword	0x6988496cd9a15f7b
	.xword	0xed650e9e26e7a34e
	.xword	0x84e0583e4b9a6f37
	.xword	0x8c957d8d30fef2f7
	.xword	0xd8ee4a2439ec4bca
	.xword	0x3d82496f4cfa2345
	.xword	0x1f8eef2f0fba8896
	.xword	0x689981e326eb14a4
	.xword	0x0329d3890ef9ebc0
	.xword	0x23254dc1fa1aaab1
	.xword	0xc433477ef4f43fae
	.xword	0x5dbb981cbfa499b2
	.xword	0x3085299191cd0a43
	.xword	0xd7bba0625ba9b7c2
	.xword	0xb01f243ced621819
	.xword	0x4bc3723e247af9dd
	.xword	0x34ec18ad6346a4d3
	.xword	0x66d52714d8ad9f07
	.xword	0x9d1042ebf7a02e3d
	.xword	0x567454b1051ab3af
	.xword	0xadc6f8aef58e1e96
	.xword	0xa3febdcd80ac21ae
	.xword	0x9a761314661b53c8
	.xword	0x79a7fd4040ad0630
	.xword	0xa3d63f64a5d8f50c
	.xword	0xe1e19d1750dd868c
	.xword	0x17ad857a20fff1c2
	.xword	0x2a8060cc415a5949
	.xword	0x982488474d6a767e
	.xword	0x531ef8a73495b37b
	.xword	0x6896cef82fc3327d
	.xword	0xa7edc055278ae7a2
	.xword	0x0e2cc04b601304a9
	.xword	0x47b0246ad47dc78a
	.xword	0xa1ad354df905480c
	.xword	0xaccb7995fa673a11
	.xword	0x0ed7963b10f9efc3
	.xword	0x47c81db9a7cad12e
	.xword	0x41e2ab9314f01f26
	.xword	0x31c74abfc5fff4fb
	.xword	0x4e6363d79c635b68
	.xword	0xb7808ded4b7b608c
	.xword	0x6b9cf93bfff60a20
	.xword	0x607407204a1356b1
	.xword	0x1fbcdeb3d0250bba
	.xword	0x30a7a37c65b185f7
	.xword	0x4d37dd0c59591869
	.xword	0x81bbeb41aef92a9b
	.xword	0xcb65093ed26e5bfe
	.xword	0xf2c2618f90ae5def
	.xword	0x1107f3a7e62dd95f
	.xword	0x954457610b9ff283
	.xword	0x95836458fb016ac1
	.xword	0xaae83e1f7cd71bde
	.xword	0x1dec014c174d1a2d
	.xword	0xbc18a487ab8f6e29
	.xword	0x3649088254d71267
	.xword	0xd659d5f2f8fe9a74
	.xword	0x1b911342296858d4
	.xword	0x92db8b95c1ca3420
	.xword	0xa445b4b7ee01c1a5
	.xword	0x9d101f836c3afd60
	.xword	0xf4ba3bdfa44e991a
	.xword	0xd8a08b18ab0bdfd3
	.xword	0x444f7f3fcf601181
	.xword	0x13be2a1602aa2099
	.xword	0xe1c1268e2af36a39
	.xword	0x53c3db378a841bf8
	.xword	0x8e990a807b0aafb2
	.xword	0x331c6c77d9cbf4b5
	.xword	0x7f8cd872d123b648
	.xword	0xdd3ef0ace84e1466
	.xword	0x24628e3df67d52bb
	.xword	0x73cfc982cb902070
	.xword	0x5777600daa088e55
	.xword	0x4056143555b7f65d
	.xword	0x503445fa6e8b1ad0
	.xword	0x4969d819bd77f805
	.xword	0x107cc166df533a26
	.xword	0xd57d3a3184304cc5
	.xword	0x739af754b12d537f
	.xword	0x111d87496432dcfe
	.xword	0x76d0c090da118e32
	.xword	0x61ea4dbba76a8d21
	.xword	0xd35b6cbbd41173b7
	.xword	0x810c412a024c3513
	.xword	0xdc19764a2b7c4308
	.xword	0x351d942a578ae173
	.xword	0xeb80b22578900a97
	.xword	0xf17c5ab3cadc6d91
	.xword	0x0cd4bd2db199563d
	.xword	0x55669e401916a95a
	.xword	0x4184974a7c22d472
	.xword	0x50528d07bef34f80
	.xword	0xc0ba116a88851746
	.xword	0x2d8978b8c0040732
	.xword	0x4bca953504e957c6
	.xword	0x5ee4dd4ebac30c60
	.xword	0x03ab839ccbc35243
	.xword	0xd35291f3bdcbe0cb
	.xword	0xe111718132c0f108
	.xword	0x2aff65bad590b362



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
