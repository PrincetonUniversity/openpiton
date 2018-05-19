// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_13_s1.s
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
   random seed:	831610068
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

	setx 0x991b83e0952e7c25, %g1, %g0
	setx 0xdeca7602466691f7, %g1, %g1
	setx 0xfbbd89bc1079aef1, %g1, %g2
	setx 0xdc792d5ba256324e, %g1, %g3
	setx 0x34b96743100aebab, %g1, %g4
	setx 0x3ab8c9a008d4414e, %g1, %g5
	setx 0x543fec10760653a1, %g1, %g6
	setx 0xb2cd83d4362a1a04, %g1, %g7
	setx 0x4285b6f0d21595f2, %g1, %r16
	setx 0x70efb8a747b35435, %g1, %r17
	setx 0xd3d1b532c54415d6, %g1, %r18
	setx 0x4db19789b27518d9, %g1, %r19
	setx 0x29b5e80771a6d59f, %g1, %r20
	setx 0xbedf32aee22ccd51, %g1, %r21
	setx 0xbf1a0512e83eb6c8, %g1, %r22
	setx 0xb5d7a3e738424cfd, %g1, %r23
	setx 0x291246499ab5aa18, %g1, %r24
	setx 0xfe64bf4020188f6f, %g1, %r25
	setx 0xfb96d85a93e34a66, %g1, %r26
	setx 0x31935437f89863b0, %g1, %r27
	setx 0x1276d5a2031b1647, %g1, %r28
	setx 0x5a642d19e549bd8a, %g1, %r29
	setx 0xd9c67abb3f7142f4, %g1, %r30
	setx 0x03cb3da5e86071ab, %g1, %r31
	save
	setx 0x23efb35aa6b3ddd3, %g1, %r16
	setx 0xe20d9f2d2b434a34, %g1, %r17
	setx 0xada361d08e96fb81, %g1, %r18
	setx 0x4f8c617e9cc480ec, %g1, %r19
	setx 0x4545b083f2615651, %g1, %r20
	setx 0x3e6ef59467b9d49e, %g1, %r21
	setx 0xdbd16b60157553c3, %g1, %r22
	setx 0x424cf0f38d892702, %g1, %r23
	setx 0x13156c4a94d1a929, %g1, %r24
	setx 0xbad9b139e4054496, %g1, %r25
	setx 0x7a22f44742930e69, %g1, %r26
	setx 0x49e0469535c7df38, %g1, %r27
	setx 0x759b61af4a7058bc, %g1, %r28
	setx 0x9df43811dbeaa523, %g1, %r29
	setx 0xd21dd9789f0a7553, %g1, %r30
	setx 0xbb79c71928f303f7, %g1, %r31
	save
	setx 0xb50398447d34c231, %g1, %r16
	setx 0x7d924d0eb201dbf8, %g1, %r17
	setx 0x878f0c8a40c8f9e4, %g1, %r18
	setx 0x40c5e4e7c9206112, %g1, %r19
	setx 0x8168afd523aa3fc5, %g1, %r20
	setx 0x1ce279b9de75e600, %g1, %r21
	setx 0xd145b8e5c8128af1, %g1, %r22
	setx 0xbe2c4f86da4b7544, %g1, %r23
	setx 0x3e7cae0151a568c5, %g1, %r24
	setx 0xd578e68ca8a74d14, %g1, %r25
	setx 0xd5c497eab7f409d4, %g1, %r26
	setx 0x71e25deb3e8c7c7e, %g1, %r27
	setx 0xe0b886ee5e501654, %g1, %r28
	setx 0xd79251c29b758809, %g1, %r29
	setx 0x96ce5d5f13e4cadf, %g1, %r30
	setx 0xe9b93e658eb051be, %g1, %r31
	save
	setx 0x3258722b7679558f, %g1, %r16
	setx 0x492c519daf5a6445, %g1, %r17
	setx 0x61ec2be523d673c8, %g1, %r18
	setx 0x87f5c1772d3d9160, %g1, %r19
	setx 0x2a8b45796e09bfd3, %g1, %r20
	setx 0xc07e6c5cd03e4b2f, %g1, %r21
	setx 0x9d9d3f432e0875dc, %g1, %r22
	setx 0x9630154747a16ace, %g1, %r23
	setx 0x11b258251863f050, %g1, %r24
	setx 0x203ae18200ac616f, %g1, %r25
	setx 0x97d075aa8571d5c1, %g1, %r26
	setx 0x6e5faa40eda5ada0, %g1, %r27
	setx 0xd0da441111184a55, %g1, %r28
	setx 0xdebe798e4a07ed42, %g1, %r29
	setx 0x1f05dd8467612d9f, %g1, %r30
	setx 0x18e652d577766971, %g1, %r31
	save
	setx 0x86e8ffa1f80e680c, %g1, %r16
	setx 0x63f37bf9851044f3, %g1, %r17
	setx 0xd736ec4e069987e4, %g1, %r18
	setx 0x2bcbd48ca8f58e07, %g1, %r19
	setx 0xe8b820655d3d30b3, %g1, %r20
	setx 0x2390219c5ab7daad, %g1, %r21
	setx 0xff3042f4b34168f2, %g1, %r22
	setx 0x24ae8670f45c1714, %g1, %r23
	setx 0x7713e0f83dff2e57, %g1, %r24
	setx 0xbd8d2fe0527cb01a, %g1, %r25
	setx 0x6178cc642de94c71, %g1, %r26
	setx 0x481f49b862e8bde4, %g1, %r27
	setx 0xa176a086c87ca9da, %g1, %r28
	setx 0x13aff846f9f7fc8b, %g1, %r29
	setx 0x620ba1b486f79af6, %g1, %r30
	setx 0x8f3fdb731ee17680, %g1, %r31
	save
	setx 0x0494bdc2398a49ea, %g1, %r16
	setx 0x4152c77e49fed8a6, %g1, %r17
	setx 0x2cd2f484de0ce562, %g1, %r18
	setx 0x8f5b62e638421768, %g1, %r19
	setx 0x0b71e1d9b60fc91a, %g1, %r20
	setx 0x620759e4e62b8b0a, %g1, %r21
	setx 0xf5bd7c9e3370904c, %g1, %r22
	setx 0xdda95f54aa68220f, %g1, %r23
	setx 0x6c4388ab84956069, %g1, %r24
	setx 0x23aa380219101326, %g1, %r25
	setx 0xbc5bee32ba8ec440, %g1, %r26
	setx 0x7d436764b7d292a6, %g1, %r27
	setx 0x9d7a407b73e063ff, %g1, %r28
	setx 0x85c3335dbb24e012, %g1, %r29
	setx 0x057673f54acd663c, %g1, %r30
	setx 0x4ba9cb5e5d0e68d5, %g1, %r31
	save
	setx 0x45bbb7e3f890ab4c, %g1, %r16
	setx 0x62e12e8abdf47ecd, %g1, %r17
	setx 0x7ce7d9a69492fbea, %g1, %r18
	setx 0x6c0fa45bf65761ed, %g1, %r19
	setx 0x3060c6056169c78d, %g1, %r20
	setx 0xcd514b245192864e, %g1, %r21
	setx 0x806eacc2b367ff5f, %g1, %r22
	setx 0x98cd42dd6be4b65d, %g1, %r23
	setx 0x275f1f4255a03e5a, %g1, %r24
	setx 0x4ce0b8bb4666df01, %g1, %r25
	setx 0x851846f4598b2386, %g1, %r26
	setx 0x543cb0f32a3ea5cb, %g1, %r27
	setx 0x0ae6326a4bde7792, %g1, %r28
	setx 0x4ea02410ded24d5c, %g1, %r29
	setx 0x83795060492ace25, %g1, %r30
	setx 0xf09a4e3b920a334c, %g1, %r31
	save
	setx 0x2380997d9ac50099, %g1, %r16
	setx 0xe194ab0b6eec1f06, %g1, %r17
	setx 0x902513288f1f3232, %g1, %r18
	setx 0xa10228ea29b4632c, %g1, %r19
	setx 0xc4b3ca2e46d59067, %g1, %r20
	setx 0xb4d55cc38606d210, %g1, %r21
	setx 0x6050b716421afdfb, %g1, %r22
	setx 0x4e7449779441095e, %g1, %r23
	setx 0xc0ac8163b5f47755, %g1, %r24
	setx 0xe3f97096a56086cc, %g1, %r25
	setx 0xadd168c80dfdd9be, %g1, %r26
	setx 0x1bf10860f04c1518, %g1, %r27
	setx 0x1e4de2e0284596c2, %g1, %r28
	setx 0x9b4e8b8fdce53898, %g1, %r29
	setx 0x8b8cdc4022bb63a5, %g1, %r30
	setx 0x7ed4822a67296467, %g1, %r31
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
T0_asi_reg_wr_0:
	mov	0x2, %r14
	.word 0xf8f38e80  ! 1: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_0_0:
	setx	0x180033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 3: SAVE_R	save	%r23, %r0, %r27
	.word 0xb3e48000  ! 5: SAVE_R	save	%r18, %r0, %r25
	.word 0xb8b54000  ! 7: SUBCcc_R	orncc 	%r21, %r0, %r28
	.word 0xbde40000  ! 9: SAVE_R	save	%r16, %r0, %r30
	.word 0xa1902002  ! 12: WRPR_GL_I	wrpr	%r0, 0x0002, %-
T0_asi_reg_rd_0:
	mov	0x3c5, %r14
	.word 0xf2db84a0  ! 13: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_1:
	setx	0x1e003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a109  ! 17: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e420d4  ! 18: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbbe52180  ! 30: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_1:
	mov	0x12, %r14
	.word 0xf6f38e60  ! 31: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb2ac211a  ! 36: ANDNcc_I	andncc 	%r16, 0x011a, %r25
cpu_intr_0_2:
	setx	0x1e0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 41: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_3:
	setx	0x1d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_4:
	setx	0x1e0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 48: SAVE_R	save	%r20, %r0, %r27
	.word 0xb7e50000  ! 49: SAVE_R	save	%r20, %r0, %r27
	.word 0xbbe44000  ! 53: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_2:
	mov	0x30, %r14
	.word 0xf0f38e40  ! 57: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_3:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 59: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_1:
	mov	0x3, %r14
	.word 0xf2db8e40  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbebc0000  ! 61: XNORcc_R	xnorcc 	%r16, %r0, %r31
	.word 0x819460b5  ! 62: WRPR_TPC_I	wrpr	%r17, 0x00b5, %tpc
T0_asi_reg_wr_4:
	mov	0x34, %r14
	.word 0xfaf38e80  ! 72: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb3e461dd  ! 73: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_rd_2:
	mov	0x3c5, %r14
	.word 0xfadb8400  ! 77: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_wr_5:
	mov	0x25, %r14
	.word 0xf0f38e80  ! 79: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb3e58000  ! 80: SAVE_R	save	%r22, %r0, %r25
	.word 0xb3e54000  ! 82: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_5:
	setx	0x1e0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 85: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 35)
	.word 0xbde44000  ! 87: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_6:
	setx	0x1f0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 93: SAVE_R	save	%r23, %r0, %r24
	.word 0xbde5c000  ! 94: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_7:
	setx	0x1d0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e42168  ! 100: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde4c000  ! 101: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_8:
	setx	0x1e0118, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_3:
	mov	0x3c7, %r14
	.word 0xf2db8e80  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_rd_4:
	mov	0x1c, %r14
	.word 0xf2db8e60  ! 108: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_5:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 117: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbfe5c000  ! 118: SAVE_R	save	%r23, %r0, %r31
	.word 0xbe8cc000  ! 120: ANDcc_R	andcc 	%r19, %r0, %r31
	.word 0xb9e50000  ! 124: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e4c000  ! 128: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 1)
	.word 0xbfe44000  ! 131: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_wr_6:
	mov	0x7, %r14
	.word 0xf6f38e40  ! 133: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7e46163  ! 140: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbb7d0400  ! 142: MOVR_R	movre	%r20, %r0, %r29
	.word 0xbbe54000  ! 144: SAVE_R	save	%r21, %r0, %r29
	.word 0xbde54000  ! 146: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_rd_6:
	mov	0x32, %r14
	.word 0xf6db8e40  ! 150: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3e54000  ! 153: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_rd_7:
	mov	0x32, %r14
	.word 0xf2db8e40  ! 154: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_9:
	setx	0x1d021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb5e44000  ! 163: SAVE_R	save	%r17, %r0, %r26
	.word 0xb7e5c000  ! 167: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_8:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_7:
	mov	0x1b, %r14
	.word 0xfef38e40  ! 170: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_8:
	mov	0x3c4, %r14
	.word 0xfaf38400  ! 171: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbbe5a1af  ! 172: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb804a014  ! 176: ADD_I	add 	%r18, 0x0014, %r28
	.word 0xb3e5c000  ! 181: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_9:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 182: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_9:
	mov	0x34, %r14
	.word 0xf6db8e40  ! 187: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb93d9000  ! 188: SRAX_R	srax	%r22, %r0, %r28
T0_asi_reg_wr_10:
	mov	0x34, %r14
	.word 0xfef384a0  ! 189: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_rd_10:
	mov	0x16, %r14
	.word 0xfadb84a0  ! 191: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5e54000  ! 192: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_11:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 193: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb1e48000  ! 194: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_wr_12:
	mov	0x34, %r14
	.word 0xfef389e0  ! 197: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_10:
	setx	0x1d022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e0cc  ! 200: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_11:
	setx	0x1e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_13:
	mov	0x26, %r14
	.word 0xf4f384a0  ! 208: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbde5a180  ! 211: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e5613e  ! 214: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_14:
	mov	0x9, %r14
	.word 0xf6f38e40  ! 216: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_11:
	mov	0x18, %r14
	.word 0xf4db8e40  ! 217: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbde48000  ! 218: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_12:
	setx	0x1f001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_13:
	setx	0x1f023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_14:
	setx	0x1d0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c5c000  ! 223: ADDCcc_R	addccc 	%r23, %r0, %r26
T0_asi_reg_rd_12:
	mov	0x27, %r14
	.word 0xfedb84a0  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb1e4608b  ! 225: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e4a026  ! 230: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_15:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 231: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 4)
	.word 0xb5e50000  ! 235: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_16:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 236: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_15:
	setx	0x1e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 241: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_17:
	mov	0x1a, %r14
	.word 0xfef38400  ! 242: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb3e50000  ! 249: SAVE_R	save	%r20, %r0, %r25
	.word 0xb5e5e1f9  ! 250: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x9195a02f  ! 253: WRPR_PIL_I	wrpr	%r22, 0x002f, %pil
cpu_intr_0_16:
	setx	0x1d0131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 38)
	.word 0xb4b4a0c5  ! 262: SUBCcc_I	orncc 	%r18, 0x00c5, %r26
cpu_intr_0_17:
	setx	0x1d023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_18:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 264: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb1e5e05e  ! 265: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e4e0a3  ! 268: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe5c000  ! 269: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_13:
	mov	0xb, %r14
	.word 0xf8db89e0  ! 270: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb3e50000  ! 274: SAVE_R	save	%r20, %r0, %r25
	.word 0xb7e521a0  ! 279: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_19:
	mov	0x2, %r14
	.word 0xfef38400  ! 281: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_wr_20:
	mov	0x11, %r14
	.word 0xf2f38e60  ! 284: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_0_18:
	setx	0x1f011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_19:
	setx	0x1d010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 290: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_21:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 296: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_14:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 297: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1e44000  ! 298: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_20:
	setx	0x1c010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_22:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 307: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_rd_15:
	mov	0x1f, %r14
	.word 0xf0db8e60  ! 312: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_21:
	setx	0x1f0104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_22:
	setx	0x1c0034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_23:
	setx	0x1d021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a13a  ! 322: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_24:
	setx	0x1c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_25:
	setx	0x1e0039, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_16:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 334: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_17:
	mov	0x1f, %r14
	.word 0xfedb84a0  ! 337: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_26:
	setx	0x1c0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e16c  ! 343: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e54000  ! 344: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_wr_23:
	mov	0x30, %r14
	.word 0xf8f38e40  ! 349: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbf3df001  ! 353: SRAX_I	srax	%r23, 0x0001, %r31
	.word 0xb02c8000  ! 355: ANDN_R	andn 	%r18, %r0, %r24
	.word 0xb1e5a021  ! 356: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_27:
	setx	0x1d010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_28:
	setx	0x1c0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 26)
	.word 0xbfe4c000  ! 365: SAVE_R	save	%r19, %r0, %r31
	.word 0xb7e5e170  ! 369: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e5601f  ! 373: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_24:
	mov	0x2a, %r14
	.word 0xf4f389e0  ! 374: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 10)
	.word 0xb1e4a17b  ! 376: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe58000  ! 377: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, f)
	.word 0xb7e40000  ! 389: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_29:
	setx	0x1e0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e087  ! 392: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e4601b  ! 393: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_18:
	mov	0x3c2, %r14
	.word 0xfadb8e80  ! 395: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb5e4a06a  ! 398: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_rd_19:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 399: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_25:
	mov	0x3c4, %r14
	.word 0xf4f38400  ! 400: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb1e5e168  ! 402: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_30:
	setx	0x1e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 20)
	.word 0xbde4c000  ! 407: SAVE_R	save	%r19, %r0, %r30
	.word 0x879421c1  ! 409: WRPR_TT_I	wrpr	%r16, 0x01c1, %tt
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_20:
	mov	0x3c1, %r14
	.word 0xf8db8e80  ! 417: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_31:
	setx	0x1c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 421: SAVE_R	save	%r17, %r0, %r29
	.word 0xb7e54000  ! 424: SAVE_R	save	%r21, %r0, %r27
	.word 0xbd510000  ! 425: RDPR_TICK	<illegal instruction>
	.word 0x9194e047  ! 427: WRPR_PIL_I	wrpr	%r19, 0x0047, %pil
	.word 0xb3e5e01b  ! 428: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e520a4  ! 429: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb6354000  ! 430: SUBC_R	orn 	%r21, %r0, %r27
T0_asi_reg_rd_21:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 435: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbbe5202e  ! 439: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 20)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde40000  ! 456: SAVE_R	save	%r16, %r0, %r30
	.word 0xbbe40000  ! 459: SAVE_R	save	%r16, %r0, %r29
	.word 0xbc84c000  ! 460: ADDcc_R	addcc 	%r19, %r0, %r30
	.word 0xb9e520a1  ! 461: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e56072  ! 462: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_22:
	mov	0x29, %r14
	.word 0xf0db84a0  ! 471: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T0_asi_reg_wr_26:
	mov	0x9, %r14
	.word 0xfcf384a0  ! 473: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb3e5a104  ! 476: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e4e1b4  ! 478: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e420f3  ! 480: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbc35a177  ! 481: ORN_I	orn 	%r22, 0x0177, %r30
	.word 0xbaac4000  ! 483: ANDNcc_R	andncc 	%r17, %r0, %r29
cpu_intr_0_32:
	setx	0x230330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 485: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_33:
	setx	0x200218, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_23:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 490: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb9e5206d  ! 491: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e4e1bb  ! 493: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde46138  ! 496: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e4e12a  ! 497: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb0c4e0e3  ! 501: ADDCcc_I	addccc 	%r19, 0x00e3, %r24
T0_asi_reg_rd_24:
	mov	0x2, %r14
	.word 0xf2db84a0  ! 508: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_27:
	mov	0x34, %r14
	.word 0xfaf389e0  ! 512: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb5e5e085  ! 514: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_25:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 515: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3e52027  ! 516: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e5e1bd  ! 518: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_34:
	setx	0x22030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_35:
	setx	0x200100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 24)
	.word 0xbbe4e0ec  ! 528: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_36:
	setx	0x22003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_26:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 534: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_37:
	setx	0x210331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_38:
	setx	0x210200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 540: SAVE_R	save	%r17, %r0, %r27
	.word 0xbfe4a106  ! 543: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde4a162  ! 545: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb2bd8000  ! 546: XNORcc_R	xnorcc 	%r22, %r0, %r25
T0_asi_reg_rd_27:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 547: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_wr_28:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 551: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb834c000  ! 552: ORN_R	orn 	%r19, %r0, %r28
T0_asi_reg_rd_28:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 560: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_0_39:
	setx	0x210132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 566: SAVE_R	save	%r18, %r0, %r27
	.word 0xbde5a15a  ! 567: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_40:
	setx	0x22012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf641800  ! 574: MOVcc_R	<illegal instruction>
	.word 0xbbe4a027  ! 575: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb935b001  ! 576: SRLX_I	srlx	%r22, 0x0001, %r28
	.word 0xbfe5612c  ! 577: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe50000  ! 578: SAVE_R	save	%r20, %r0, %r31
	.word 0xb7e58000  ! 582: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 17)
	.word 0xb1e4e166  ! 584: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 21)
	.word 0xb1e52187  ! 587: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_41:
	setx	0x21032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_29:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 594: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_rd_30:
	mov	0x3c2, %r14
	.word 0xf8db89e0  ! 595: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_0_42:
	setx	0x21013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_43:
	setx	0x230209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 600: SAVE_R	save	%r21, %r0, %r31
	.word 0xbfe48000  ! 606: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_44:
	setx	0x210028, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_29:
	mov	0x2f, %r14
	.word 0xfaf389e0  ! 610: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbe34a16b  ! 612: ORN_I	orn 	%r18, 0x016b, %r31
	.word 0xbde5a19f  ! 613: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbbe421f0  ! 617: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde46026  ! 618: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e52154  ! 619: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_rd_31:
	mov	0x35, %r14
	.word 0xf2db89e0  ! 622: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_45:
	setx	0x200123, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_30:
	mov	0x1a, %r14
	.word 0xfaf38e40  ! 626: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_32:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 630: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_rd_33:
	mov	0x14, %r14
	.word 0xf4db8400  ! 632: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbcbc2192  ! 633: XNORcc_I	xnorcc 	%r16, 0x0192, %r30
cpu_intr_0_46:
	setx	0x200312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_47:
	setx	0x210130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e521cc  ! 637: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_wr_31:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 639: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfe48000  ! 643: SAVE_R	save	%r18, %r0, %r31
	.word 0xb7e58000  ! 645: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e521bc  ! 648: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e58000  ! 651: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_32:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 654: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb1e54000  ! 659: SAVE_R	save	%r21, %r0, %r24
	.word 0xb5e42098  ! 663: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_34:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 665: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_wr_33:
	mov	0x5, %r14
	.word 0xfef38e80  ! 666: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_0_48:
	setx	0x210323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 670: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e58000  ! 672: SAVE_R	save	%r22, %r0, %r28
	.word 0xbbe42045  ! 675: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e4c000  ! 676: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_49:
	setx	0x220017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 678: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_wr_34:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 681: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_wr_35:
	mov	0x26, %r14
	.word 0xfcf389e0  ! 684: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, b)
	.word 0xbfe50000  ! 688: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 25)
	.word 0xbfe420a9  ! 695: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb69c8000  ! 696: XORcc_R	xorcc 	%r18, %r0, %r27
cpu_intr_0_50:
	setx	0x200215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_51:
	setx	0x230207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_52:
	setx	0x200023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5606a  ! 701: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe58000  ! 702: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 14)
	.word 0xb3e40000  ! 706: SAVE_R	save	%r16, %r0, %r25
	.word 0xb3e42127  ! 707: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9504000  ! 708: RDPR_TNPC	<illegal instruction>
	.word 0xb7e5a018  ! 709: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde54000  ! 710: SAVE_R	save	%r21, %r0, %r30
	.word 0xb5e5a1aa  ! 714: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_36:
	mov	0x35, %r14
	.word 0xf0f38e40  ! 715: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_35:
	mov	0x21, %r14
	.word 0xf0db8400  ! 717: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_wr_37:
	mov	0x17, %r14
	.word 0xf4f38e40  ! 721: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb9e42107  ! 724: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_53:
	setx	0x220006, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_36:
	mov	0x26, %r14
	.word 0xfedb84a0  ! 735: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbfe5c000  ! 736: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_37:
	mov	0x3c5, %r14
	.word 0xf4db89e0  ! 740: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb5e560c7  ! 741: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_54:
	setx	0x230331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 749: SAVE_R	save	%r22, %r0, %r30
	.word 0xb7e4e0bb  ! 753: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_55:
	setx	0x230018, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_38:
	mov	0x36, %r14
	.word 0xfaf384a0  ! 755: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, b)
	.word 0xbfe58000  ! 759: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_56:
	setx	0x230200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_57:
	setx	0x22003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e48000  ! 763: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 12)
	.word 0xb2852142  ! 768: ADDcc_I	addcc 	%r20, 0x0142, %r25
	.word 0xb1e4618b  ! 769: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_39:
	mov	0x3c2, %r14
	.word 0xf6f38e80  ! 770: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb29560ab  ! 771: ORcc_I	orcc 	%r21, 0x00ab, %r25
cpu_intr_0_58:
	setx	0x20002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a1ea  ! 774: SAVE_I	save	%r22, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_38:
	mov	0x26, %r14
	.word 0xf6db8400  ! 778: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5e5e144  ! 780: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_59:
	setx	0x230339, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_39:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 783: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_wr_40:
	mov	0x11, %r14
	.word 0xfcf38e40  ! 785: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_40:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 788: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_0_60:
	setx	0x21012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 791: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_61:
	setx	0x20020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5206b  ! 794: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe4c000  ! 795: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_62:
	setx	0x230335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb534e001  ! 797: SRL_I	srl 	%r19, 0x0001, %r26
	.word 0xb1e4c000  ! 798: SAVE_R	save	%r19, %r0, %r24
	.word 0xbde54000  ! 800: SAVE_R	save	%r21, %r0, %r30
	.word 0xb7e46132  ! 802: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb20d4000  ! 808: AND_R	and 	%r21, %r0, %r25
T0_asi_reg_rd_41:
	mov	0x13, %r14
	.word 0xf2db8400  ! 812: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb5e4204d  ! 813: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_63:
	setx	0x230028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1641800  ! 821: MOVcc_R	<illegal instruction>
	.word 0xb3e48000  ! 826: SAVE_R	save	%r18, %r0, %r25
	.word 0xb89da1f8  ! 827: XORcc_I	xorcc 	%r22, 0x01f8, %r28
	.word 0xb9e4e149  ! 829: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_64:
	setx	0x23002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_65:
	setx	0x230127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe45a05d  ! 834: ADDC_I	addc 	%r22, 0x005d, %r31
	.word 0xb7e5c000  ! 836: SAVE_R	save	%r23, %r0, %r27
	.word 0xbbe40000  ! 837: SAVE_R	save	%r16, %r0, %r29
	.word 0xb9e4c000  ! 838: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_rd_42:
	mov	0x11, %r14
	.word 0xfadb8e40  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7e5e1de  ! 840: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb0358000  ! 843: ORN_R	orn 	%r22, %r0, %r24
	.word 0xb5e4a1db  ! 844: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_41:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 845: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_66:
	setx	0x230321, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_43:
	mov	0x3c8, %r14
	.word 0xf8db89e0  ! 849: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb3e4e14f  ! 850: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e421ab  ! 851: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_44:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 852: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_67:
	setx	0x21002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4614b  ! 855: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe40000  ! 858: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 18)
	.word 0xb3e50000  ! 862: SAVE_R	save	%r20, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4e021  ! 867: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_68:
	setx	0x230026, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_45:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 871: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_wr_42:
	mov	0x17, %r14
	.word 0xf8f38e80  ! 872: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb9e50000  ! 873: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 15)
	.word 0xbbe58000  ! 878: SAVE_R	save	%r22, %r0, %r29
	.word 0xbe15e11e  ! 881: OR_I	or 	%r23, 0x011e, %r31
cpu_intr_0_69:
	setx	0x210319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_70:
	setx	0x230005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 887: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_71:
	setx	0x22000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_43:
	mov	0x2e, %r14
	.word 0xf6f389e0  ! 890: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_44:
	mov	0x2d, %r14
	.word 0xf2f38e80  ! 895: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 37)
	.word 0xbde4a148  ! 901: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_72:
	setx	0x250025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 3a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4e0f7  ! 906: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbde54000  ! 913: SAVE_R	save	%r21, %r0, %r30
	.word 0xba940000  ! 914: ORcc_R	orcc 	%r16, %r0, %r29
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 29)
	.word 0xb4350000  ! 920: SUBC_R	orn 	%r20, %r0, %r26
	.word 0xbbe4205b  ! 921: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_46:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 931: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_73:
	setx	0x25000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb9e4e135  ! 936: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e50000  ! 938: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_wr_45:
	mov	0x32, %r14
	.word 0xfcf38400  ! 944: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbb7ce401  ! 945: MOVR_I	movre	%r19, 0x1, %r29
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 3)
	.word 0xbde461c2  ! 949: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e44000  ! 953: SAVE_R	save	%r17, %r0, %r28
	.word 0xb7e48000  ! 954: SAVE_R	save	%r18, %r0, %r27
	.word 0xb1e4a1a7  ! 955: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_74:
	setx	0x270318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, b)
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_75:
	setx	0x240020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, d)
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbbe54000  ! 968: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_76:
	setx	0x25010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_46:
	mov	0x5, %r14
	.word 0xfef38e80  ! 973: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_47:
	mov	0x0, %r14
	.word 0xf4f384a0  ! 975: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_wr_48:
	mov	0x1a, %r14
	.word 0xf6f38e60  ! 976: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_77:
	setx	0x240009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 986: SAVE_R	save	%r18, %r0, %r24
	.word 0xba84e126  ! 990: ADDcc_I	addcc 	%r19, 0x0126, %r29
T0_asi_reg_rd_47:
	mov	0xc, %r14
	.word 0xf8db8e80  ! 992: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_78:
	setx	0x240110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_79:
	setx	0x25021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd351000  ! 998: SRLX_R	srlx	%r20, %r0, %r30
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbe05c000  ! 1001: ADD_R	add 	%r23, %r0, %r31
cpu_intr_0_80:
	setx	0x24010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe04a1bb  ! 1005: ADD_I	add 	%r18, 0x01bb, %r31
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 12)
	.word 0xb1e5c000  ! 1010: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_81:
	setx	0x24031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 9)
	.word 0xbde5212d  ! 1024: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb5e5203b  ! 1026: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 5)
	.word 0xbd7d4400  ! 1030: MOVR_R	movre	%r21, %r0, %r30
cpu_intr_0_82:
	setx	0x260134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbfe58000  ! 1050: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_83:
	setx	0x240304, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_48:
	mov	0x1c, %r14
	.word 0xf6db89e0  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_0_84:
	setx	0x270301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 1056: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_49:
	mov	0x6, %r14
	.word 0xf2f38e60  ! 1057: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb1e5e0c0  ! 1059: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_rd_49:
	mov	0x21, %r14
	.word 0xfedb8400  ! 1063: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbde54000  ! 1064: SAVE_R	save	%r21, %r0, %r30
	.word 0xb1643801  ! 1065: MOVcc_I	<illegal instruction>
T0_asi_reg_wr_50:
	mov	0x3c0, %r14
	.word 0xf4f389e0  ! 1067: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_85:
	setx	0x260216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb7e5a0ac  ! 1080: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb8342084  ! 1081: SUBC_I	orn 	%r16, 0x0084, %r28
	.word 0xb1e5c000  ! 1086: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_51:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 1087: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb52cf001  ! 1088: SLLX_I	sllx	%r19, 0x0001, %r26
cpu_intr_0_86:
	setx	0x26010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 1091: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_87:
	setx	0x250112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 1094: SAVE_R	save	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_88:
	setx	0x26011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 1104: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_52:
	mov	0xf, %r14
	.word 0xf8f38e40  ! 1107: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb73d2001  ! 1108: SRA_I	sra 	%r20, 0x0001, %r27
cpu_intr_0_89:
	setx	0x270038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb484a03c  ! 1112: ADDcc_I	addcc 	%r18, 0x003c, %r26
	.word 0xb7e4c000  ! 1114: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_wr_53:
	mov	0x38, %r14
	.word 0xf4f384a0  ! 1115: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb7e48000  ! 1116: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_rd_50:
	mov	0x23, %r14
	.word 0xf0db8e40  ! 1118: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 14)
	.word 0xb7e54000  ! 1121: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_90:
	setx	0x26002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_54:
	mov	0x20, %r14
	.word 0xf6f38e80  ! 1124: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbbe5e054  ! 1125: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_rd_51:
	mov	0x10, %r14
	.word 0xf0db89e0  ! 1135: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 29)
	.word 0xb9540000  ! 1140: RDPR_GL	<illegal instruction>
	.word 0xbfe46071  ! 1141: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde50000  ! 1143: SAVE_R	save	%r20, %r0, %r30
	.word 0xb3e5a0c5  ! 1146: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e5e16d  ! 1149: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_55:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 1150: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_rd_52:
	mov	0xa, %r14
	.word 0xf4db8400  ! 1152: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb3e420ca  ! 1153: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_56:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 1155: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5e5e03f  ! 1156: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe56012  ! 1165: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe4c000  ! 1166: SAVE_R	save	%r19, %r0, %r29
	.word 0xb3e5e16f  ! 1167: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_53:
	mov	0x7, %r14
	.word 0xf4db8e80  ! 1168: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_0_91:
	setx	0x240017, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_57:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 1172: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_92:
	setx	0x26003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbfe4a0c1  ! 1176: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_54:
	mov	0xe, %r14
	.word 0xf8db8e80  ! 1178: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_rd_55:
	mov	0xf, %r14
	.word 0xfedb8400  ! 1181: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_93:
	setx	0x25033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_94:
	setx	0x270334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21421e8  ! 1191: OR_I	or 	%r16, 0x01e8, %r25
cpu_intr_0_95:
	setx	0x240127, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_58:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 1193: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_96:
	setx	0x260116, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_59:
	mov	0x3c7, %r14
	.word 0xf0f38e60  ! 1195: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb7e5e0c5  ! 1201: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_97:
	setx	0x26010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 1205: RDPR_TICK	<illegal instruction>
	.word 0xb7e5c000  ! 1209: SAVE_R	save	%r23, %r0, %r27
	.word 0xb3e561df  ! 1211: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xba15e04a  ! 1212: OR_I	or 	%r23, 0x004a, %r29
	.word 0xb5e54000  ! 1215: SAVE_R	save	%r21, %r0, %r26
	.word 0xb1e5e07c  ! 1217: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e40000  ! 1218: SAVE_R	save	%r16, %r0, %r24
	.word 0xb1e4604b  ! 1223: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe4a145  ! 1225: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb2acc000  ! 1226: ANDNcc_R	andncc 	%r19, %r0, %r25
T0_asi_reg_rd_56:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 1229: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e4e028  ! 1236: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde4c000  ! 1238: SAVE_R	save	%r19, %r0, %r30
	.word 0xbfe44000  ! 1239: SAVE_R	save	%r17, %r0, %r31
	.word 0xbc840000  ! 1245: ADDcc_R	addcc 	%r16, %r0, %r30
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbd520000  ! 1248: RDPR_PIL	<illegal instruction>
	.word 0xbead4000  ! 1249: ANDNcc_R	andncc 	%r21, %r0, %r31
cpu_intr_0_98:
	setx	0x250321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3cd000  ! 1255: SRAX_R	srax	%r19, %r0, %r29
T0_asi_reg_rd_57:
	mov	0x1f, %r14
	.word 0xf6db8e80  ! 1259: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb9e5a0dd  ! 1261: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e4c000  ! 1262: SAVE_R	save	%r19, %r0, %r26
	.word 0xb7e4e0f2  ! 1268: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_99:
	setx	0x250107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 1273: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_wr_60:
	mov	0x28, %r14
	.word 0xf2f38e60  ! 1274: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_0_100:
	setx	0x260220, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_58:
	mov	0x27, %r14
	.word 0xf6db8e80  ! 1280: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T0_asi_reg_rd_59:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 1283: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbe0461ee  ! 1286: ADD_I	add 	%r17, 0x01ee, %r31
cpu_intr_0_101:
	setx	0x25010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e42059  ! 1290: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e40000  ! 1295: SAVE_R	save	%r16, %r0, %r26
	.word 0xbfe4e083  ! 1298: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_rd_60:
	mov	0x3c7, %r14
	.word 0xf6db89e0  ! 1300: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbbe560a1  ! 1302: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_rd_61:
	mov	0x1e, %r14
	.word 0xf2db89e0  ! 1303: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_wr_61:
	mov	0x1c, %r14
	.word 0xf8f38e80  ! 1311: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_0_102:
	setx	0x260329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 1315: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_103:
	setx	0x260318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 1317: SAVE_R	save	%r16, %r0, %r24
	.word 0xb7e58000  ! 1318: SAVE_R	save	%r22, %r0, %r27
	.word 0xbbe50000  ! 1319: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_62:
	mov	0x31, %r14
	.word 0xf8db8e80  ! 1320: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb9e5a1d7  ! 1325: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe50000  ! 1328: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_104:
	setx	0x24003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_62:
	mov	0xb, %r14
	.word 0xf8f38e40  ! 1334: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbbe421ec  ! 1350: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_105:
	setx	0x27013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_106:
	setx	0x260215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 1357: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 25)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 11)
	.word 0xbfe54000  ! 1367: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_63:
	mov	0x1a, %r14
	.word 0xfedb8e40  ! 1368: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_63:
	mov	0x17, %r14
	.word 0xf0f38e40  ! 1371: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb5e40000  ! 1378: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_107:
	setx	0x2a0228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_108:
	setx	0x290339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab58000  ! 1384: ORNcc_R	orncc 	%r22, %r0, %r29
T0_asi_reg_wr_64:
	mov	0x2a, %r14
	.word 0xf4f38e60  ! 1385: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_rd_64:
	mov	0x3c6, %r14
	.word 0xfadb84a0  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb13d8000  ! 1387: SRA_R	sra 	%r22, %r0, %r24
	.word 0xb9e48000  ! 1388: SAVE_R	save	%r18, %r0, %r28
	.word 0xbbe4c000  ! 1391: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_109:
	setx	0x29031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_110:
	setx	0x29011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_65:
	mov	0x1, %r14
	.word 0xf6db8e40  ! 1400: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_65:
	mov	0x4, %r14
	.word 0xf2f38400  ! 1401: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb534d000  ! 1408: SRLX_R	srlx	%r19, %r0, %r26
T0_asi_reg_rd_66:
	mov	0x2f, %r14
	.word 0xf6db8400  ! 1409: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb3e48000  ! 1411: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbde48000  ! 1419: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_rd_67:
	mov	0x35, %r14
	.word 0xfedb8400  ! 1421: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_111:
	setx	0x2b0133, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_66:
	mov	0xb, %r14
	.word 0xf0f38e80  ! 1424: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb3e4e041  ! 1425: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_67:
	mov	0xb, %r14
	.word 0xf8f389e0  ! 1426: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_0_112:
	setx	0x290211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_113:
	setx	0x290029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_rd_68:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7e420ad  ! 1439: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5343001  ! 1440: SRLX_I	srlx	%r16, 0x0001, %r26
cpu_intr_0_114:
	setx	0x280127, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_69:
	mov	0x32, %r14
	.word 0xfadb8e40  ! 1442: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 24)
	.word 0xb1e5a0ad  ! 1446: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_70:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 1448: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb5e48000  ! 1453: SAVE_R	save	%r18, %r0, %r26
	.word 0xb5e40000  ! 1454: SAVE_R	save	%r16, %r0, %r26
	.word 0xb3e58000  ! 1455: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_115:
	setx	0x2b032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_116:
	setx	0x28020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e5e1b7  ! 1459: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb60420cd  ! 1462: ADD_I	add 	%r16, 0x00cd, %r27
cpu_intr_0_117:
	setx	0x2a0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e52031  ! 1467: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe5e1e4  ! 1471: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1348000  ! 1472: SRL_R	srl 	%r18, %r0, %r24
	.word 0xb9e50000  ! 1475: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_wr_68:
	mov	0xd, %r14
	.word 0xf0f38e80  ! 1476: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_wr_69:
	mov	0x2b, %r14
	.word 0xf8f38400  ! 1478: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_wr_70:
	mov	0x3c3, %r14
	.word 0xfef38e60  ! 1480: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_118:
	setx	0x2b003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 11)
	.word 0xb7e54000  ! 1488: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 19)
	.word 0xb7e4c000  ! 1492: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_119:
	setx	0x290125, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_71:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 1496: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbde58000  ! 1499: SAVE_R	save	%r22, %r0, %r30
	.word 0xbde4a10b  ! 1502: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde50000  ! 1503: SAVE_R	save	%r20, %r0, %r30
	.word 0xb9643801  ! 1505: MOVcc_I	<illegal instruction>
T0_asi_reg_rd_71:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 1506: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_120:
	setx	0x28021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_72:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 1508: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_wr_72:
	mov	0x33, %r14
	.word 0xf6f38e40  ! 1511: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_73:
	mov	0x1b, %r14
	.word 0xfadb89e0  ! 1513: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb3e4600c  ! 1514: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e4e187  ! 1517: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe5c000  ! 1518: SAVE_R	save	%r23, %r0, %r29
	.word 0xb9e56108  ! 1519: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_121:
	setx	0x29000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a031  ! 1522: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_122:
	setx	0x2b001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_73:
	mov	0x14, %r14
	.word 0xf6f38e60  ! 1533: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e58000  ! 1536: SAVE_R	save	%r22, %r0, %r26
	.word 0xbbe561e4  ! 1537: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_123:
	setx	0x2a002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_74:
	mov	0x23, %r14
	.word 0xfaf389e0  ! 1541: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_124:
	setx	0x2b001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4210f  ! 1546: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 19)
	.word 0xbfe4e1b9  ! 1550: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_75:
	mov	0x3c4, %r14
	.word 0xfaf38400  ! 1551: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb7e5c000  ! 1553: SAVE_R	save	%r23, %r0, %r27
	.word 0xb5e4c000  ! 1554: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_125:
	setx	0x290120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_126:
	setx	0x280020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_127:
	setx	0x2a002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e460ee  ! 1563: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e5a170  ! 1564: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_128:
	setx	0x2b010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 23)
	.word 0xba454000  ! 1571: ADDC_R	addc 	%r21, %r0, %r29
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb3e5a141  ! 1577: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 37)
	.word 0xb5e4e09a  ! 1580: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_76:
	mov	0x3c4, %r14
	.word 0xf0f384a0  ! 1582: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbde4a0c5  ! 1583: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_129:
	setx	0x2a0124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_130:
	setx	0x2a0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 1588: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_rd_74:
	mov	0x3c1, %r14
	.word 0xf0db8e60  ! 1590: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_131:
	setx	0x290035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 1593: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_132:
	setx	0x28033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_133:
	setx	0x2a0027, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_77:
	mov	0x25, %r14
	.word 0xf2f38e80  ! 1597: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb7540000  ! 1598: RDPR_GL	<illegal instruction>
	.word 0xb5e5e0e6  ! 1599: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7343001  ! 1602: SRLX_I	srlx	%r16, 0x0001, %r27
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 23)
	.word 0xb02c8000  ! 1604: ANDN_R	andn 	%r18, %r0, %r24
	.word 0xb49420db  ! 1605: ORcc_I	orcc 	%r16, 0x00db, %r26
	.word 0xbde4c000  ! 1609: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_134:
	setx	0x280133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c421d9  ! 1611: ADDCcc_I	addccc 	%r16, 0x01d9, %r26
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_78:
	mov	0x2f, %r14
	.word 0xf0f38e40  ! 1613: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_wr_79:
	mov	0x3, %r14
	.word 0xf2f38e40  ! 1617: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xa1902000  ! 1618: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xb9e5e17d  ! 1622: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e4204e  ! 1624: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb6bce1d5  ! 1625: XNORcc_I	xnorcc 	%r19, 0x01d5, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_135:
	setx	0x2a030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 10)
	.word 0xb29c61e9  ! 1634: XORcc_I	xorcc 	%r17, 0x01e9, %r25
T0_asi_reg_wr_80:
	mov	0x8, %r14
	.word 0xf0f38e80  ! 1635: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbde4e133  ! 1636: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb8058000  ! 1639: ADD_R	add 	%r22, %r0, %r28
T0_asi_reg_wr_81:
	mov	0x16, %r14
	.word 0xf8f38e80  ! 1640: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_rd_75:
	mov	0x1a, %r14
	.word 0xf2db89e0  ! 1642: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb3e44000  ! 1643: SAVE_R	save	%r17, %r0, %r25
	.word 0xb5e44000  ! 1645: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_136:
	setx	0x2a0209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 15)
	.word 0xb7e4c000  ! 1654: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1e5c000  ! 1660: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 14)
	.word 0xb1e4c000  ! 1664: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_137:
	setx	0x2a0232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_138:
	setx	0x28021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc84a152  ! 1669: ADDcc_I	addcc 	%r18, 0x0152, %r30
	.word 0xb3e44000  ! 1670: SAVE_R	save	%r17, %r0, %r25
	.word 0xb7e40000  ! 1671: SAVE_R	save	%r16, %r0, %r27
	.word 0xbde4a1da  ! 1672: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e4a08d  ! 1673: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 34)
	.word 0xb5e520ae  ! 1676: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_139:
	setx	0x2a030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_82:
	mov	0x25, %r14
	.word 0xfcf384a0  ! 1680: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_76:
	mov	0x32, %r14
	.word 0xfcdb8e40  ! 1685: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xba450000  ! 1687: ADDC_R	addc 	%r20, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_140:
	setx	0x290308, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_77:
	mov	0x6, %r14
	.word 0xfadb8400  ! 1692: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_141:
	setx	0x2b0137, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_83:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 1694: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbab54000  ! 1702: ORNcc_R	orncc 	%r21, %r0, %r29
	.word 0xbe8cc000  ! 1704: ANDcc_R	andcc 	%r19, %r0, %r31
T0_asi_reg_wr_84:
	mov	0x8, %r14
	.word 0xf0f38e60  ! 1707: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_rd_78:
	mov	0x24, %r14
	.word 0xfedb8400  ! 1710: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbbe5e02a  ! 1713: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_142:
	setx	0x280305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e44000  ! 1719: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 20)
	.word 0xb9e4c000  ! 1721: SAVE_R	save	%r19, %r0, %r28
	.word 0xbb7ca401  ! 1725: MOVR_I	movre	%r18, 0x1, %r29
	.word 0xbde58000  ! 1726: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_79:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 1732: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_rd_80:
	mov	0x2a, %r14
	.word 0xf8db8400  ! 1733: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 5)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4a0c2  ! 1739: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9510000  ! 1740: RDPR_TICK	<illegal instruction>
	.word 0xb750c000  ! 1741: RDPR_TT	<illegal instruction>
cpu_intr_0_143:
	setx	0x29020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_85:
	mov	0x3c7, %r14
	.word 0xf2f389e0  ! 1743: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb1e4c000  ! 1744: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_wr_86:
	mov	0x32, %r14
	.word 0xfaf384a0  ! 1745: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb7e56184  ! 1746: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb22d20b8  ! 1747: ANDN_I	andn 	%r20, 0x00b8, %r25
	.word 0xb1e40000  ! 1751: SAVE_R	save	%r16, %r0, %r24
	.word 0xbfe420c6  ! 1752: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e54000  ! 1754: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_87:
	mov	0x1e, %r14
	.word 0xf0f38e40  ! 1760: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb5e58000  ! 1761: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_144:
	setx	0x2a0313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_145:
	setx	0x29020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 1766: SAVE_R	save	%r22, %r0, %r24
	.word 0xb1e42078  ! 1769: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb025a138  ! 1771: SUB_I	sub 	%r22, 0x0138, %r24
T0_asi_reg_wr_88:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 1772: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb9e5a149  ! 1773: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbd342001  ! 1777: SRL_I	srl 	%r16, 0x0001, %r30
cpu_intr_0_146:
	setx	0x29000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_81:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 1780: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_0_147:
	setx	0x29033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37c0400  ! 1784: MOVR_R	movre	%r16, %r0, %r25
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb5e520bc  ! 1791: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde48000  ! 1792: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_rd_82:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 1797: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 10)
	.word 0xbde460de  ! 1801: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e54000  ! 1803: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_148:
	setx	0x28030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_149:
	setx	0x29000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e461b3  ! 1812: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e54000  ! 1814: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_83:
	mov	0x3c0, %r14
	.word 0xfcdb89e0  ! 1820: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_wr_89:
	mov	0x2c, %r14
	.word 0xf8f389e0  ! 1822: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 2)
	.word 0xb7e4217d  ! 1826: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e48000  ! 1828: SAVE_R	save	%r18, %r0, %r24
	.word 0xb9e5e0eb  ! 1830: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 22)
	.word 0xbde5e140  ! 1833: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_84:
	mov	0x1b, %r14
	.word 0xf0db8e80  ! 1835: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb3e561e9  ! 1836: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 0)
	.word 0xbde4c000  ! 1840: SAVE_R	save	%r19, %r0, %r30
	.word 0xb1e52161  ! 1845: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e54000  ! 1847: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_wr_90:
	mov	0xd, %r14
	.word 0xf6f384a0  ! 1849: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbbe46062  ! 1850: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe4e02f  ! 1851: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_150:
	setx	0x2e0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0c61ed  ! 1853: AND_I	and 	%r17, 0x01ed, %r29
	.word 0xbcb48000  ! 1857: SUBCcc_R	orncc 	%r18, %r0, %r30
	.word 0xb9e5a15b  ! 1860: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e5c000  ! 1862: SAVE_R	save	%r23, %r0, %r24
	.word 0xbe8560fd  ! 1863: ADDcc_I	addcc 	%r21, 0x00fd, %r31
	.word 0xb7e461e9  ! 1864: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_151:
	setx	0x2f0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a1da  ! 1872: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e54000  ! 1873: SAVE_R	save	%r21, %r0, %r24
	.word 0xb1e560c3  ! 1874: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb49d0000  ! 1875: XORcc_R	xorcc 	%r20, %r0, %r26
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_91:
	mov	0x38, %r14
	.word 0xf0f38e40  ! 1877: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_85:
	mov	0x18, %r14
	.word 0xf2db8400  ! 1880: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb62cc000  ! 1884: ANDN_R	andn 	%r19, %r0, %r27
	.word 0xb835a185  ! 1885: ORN_I	orn 	%r22, 0x0185, %r28
	.word 0xbbe46067  ! 1886: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_86:
	mov	0x30, %r14
	.word 0xf0db84a0  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbfe44000  ! 1893: SAVE_R	save	%r17, %r0, %r31
	.word 0xb7e5a0bc  ! 1895: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbd3d2001  ! 1896: SRA_I	sra 	%r20, 0x0001, %r30
	.word 0xb3e48000  ! 1897: SAVE_R	save	%r18, %r0, %r25
	.word 0xb80ca00d  ! 1900: AND_I	and 	%r18, 0x000d, %r28
cpu_intr_0_152:
	setx	0x2c022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_87:
	mov	0x1a, %r14
	.word 0xfadb8400  ! 1906: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_wr_92:
	mov	0x13, %r14
	.word 0xfcf38e60  ! 1907: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_rd_88:
	mov	0x7, %r14
	.word 0xf0db8400  ! 1909: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_wr_93:
	mov	0x21, %r14
	.word 0xfcf38e40  ! 1910: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5e44000  ! 1911: SAVE_R	save	%r17, %r0, %r26
	.word 0xb7e46008  ! 1914: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_153:
	setx	0x2c030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08d6094  ! 1917: ANDcc_I	andcc 	%r21, 0x0094, %r24
	.word 0xbfe461c2  ! 1919: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_154:
	setx	0x2d0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_94:
	mov	0x3, %r14
	.word 0xfaf389e0  ! 1923: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_155:
	setx	0x2f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_95:
	mov	0xa, %r14
	.word 0xf8f38400  ! 1926: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_156:
	setx	0x2d0033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_157:
	setx	0x2c0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 1938: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_rd_89:
	mov	0x5, %r14
	.word 0xf4db8e60  ! 1942: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb80c4000  ! 1947: AND_R	and 	%r17, %r0, %r28
cpu_intr_0_158:
	setx	0x2d0139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_159:
	setx	0x2e021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 1952: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 4)
	.word 0xbbe50000  ! 1966: SAVE_R	save	%r20, %r0, %r29
	.word 0xb9e5e033  ! 1969: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe52021  ! 1970: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_96:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 1972: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0x8395e103  ! 1973: WRPR_TNPC_I	wrpr	%r23, 0x0103, %tnpc
	.word 0xbde5e16c  ! 1975: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbd2cb001  ! 1977: SLLX_I	sllx	%r18, 0x0001, %r30
	.word 0xb42521fc  ! 1981: SUB_I	sub 	%r20, 0x01fc, %r26
T0_asi_reg_rd_90:
	mov	0x33, %r14
	.word 0xfedb8400  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb5e5e10a  ! 1990: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_wr_97:
	mov	0x23, %r14
	.word 0xf0f38e40  ! 1992: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_160:
	setx	0x2d030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_91:
	mov	0x27, %r14
	.word 0xfadb84a0  ! 1996: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_rd_92:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 1998: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb37c0400  ! 1999: MOVR_R	movre	%r16, %r0, %r25
cpu_intr_0_161:
	setx	0x2d0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42103  ! 2003: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb43d4000  ! 2004: XNOR_R	xnor 	%r21, %r0, %r26
T0_asi_reg_wr_98:
	mov	0x1, %r14
	.word 0xf2f38e80  ! 2006: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_162:
	setx	0x2c0122, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_99:
	mov	0x13, %r14
	.word 0xf0f38e60  ! 2011: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_163:
	setx	0x2c033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_100:
	mov	0xf, %r14
	.word 0xfef38e80  ! 2018: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbfe48000  ! 2020: SAVE_R	save	%r18, %r0, %r31
	.word 0xb3e54000  ! 2022: SAVE_R	save	%r21, %r0, %r25
	.word 0xb3e4c000  ! 2023: SAVE_R	save	%r19, %r0, %r25
	.word 0xb6b5a1f3  ! 2024: SUBCcc_I	orncc 	%r22, 0x01f3, %r27
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_164:
	setx	0x2d0121, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_93:
	mov	0x18, %r14
	.word 0xf8db8e40  ! 2031: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 14)
	.word 0xbfe50000  ! 2033: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_165:
	setx	0x2f021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 2036: SAVE_R	save	%r22, %r0, %r25
	.word 0xbfe560df  ! 2038: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_166:
	setx	0x2f0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 2046: SAVE_R	save	%r17, %r0, %r30
	.word 0xb9e4215e  ! 2049: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_167:
	setx	0x2e030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_94:
	mov	0x21, %r14
	.word 0xfcdb8e60  ! 2064: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_168:
	setx	0x2c003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_95:
	mov	0x21, %r14
	.word 0xfedb8e60  ! 2066: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb0b48000  ! 2068: ORNcc_R	orncc 	%r18, %r0, %r24
	.word 0xb7e58000  ! 2070: SAVE_R	save	%r22, %r0, %r27
	.word 0xbfe50000  ! 2071: SAVE_R	save	%r20, %r0, %r31
	.word 0xb9e44000  ! 2072: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_96:
	mov	0x36, %r14
	.word 0xfedb84a0  ! 2073: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbbe461a4  ! 2076: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e560a1  ! 2078: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_rd_97:
	mov	0x37, %r14
	.word 0xf6db8e40  ! 2079: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_98:
	mov	0x11, %r14
	.word 0xf0db8400  ! 2080: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_169:
	setx	0x2f0028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 19)
	.word 0xb7e4a17b  ! 2086: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb52d1000  ! 2087: SLLX_R	sllx	%r20, %r0, %r26
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb5e44000  ! 2093: SAVE_R	save	%r17, %r0, %r26
	.word 0xb7641800  ! 2094: MOVcc_R	<illegal instruction>
T0_asi_reg_rd_99:
	mov	0x19, %r14
	.word 0xfedb8e80  ! 2099: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb9e58000  ! 2102: SAVE_R	save	%r22, %r0, %r28
	.word 0xbbe4c000  ! 2103: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_100:
	mov	0x12, %r14
	.word 0xfcdb8e40  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbde5c000  ! 2105: SAVE_R	save	%r23, %r0, %r30
	.word 0xbde4c000  ! 2107: SAVE_R	save	%r19, %r0, %r30
	.word 0xb9e521fd  ! 2113: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e5a1ef  ! 2116: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_170:
	setx	0x2c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5615e  ! 2120: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e5e0ee  ! 2121: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde421fd  ! 2123: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_rd_101:
	mov	0xf, %r14
	.word 0xf2db8400  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb9e5c000  ! 2126: SAVE_R	save	%r23, %r0, %r28
	.word 0xbd7cc400  ! 2128: MOVR_R	movre	%r19, %r0, %r30
T0_asi_reg_rd_102:
	mov	0x10, %r14
	.word 0xfcdb8e40  ! 2129: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9e5a1ad  ! 2130: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 16)
	.word 0xb3e4a0ed  ! 2132: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e4a055  ! 2133: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e44000  ! 2134: SAVE_R	save	%r17, %r0, %r27
	.word 0xbcc46086  ! 2136: ADDCcc_I	addccc 	%r17, 0x0086, %r30
cpu_intr_0_171:
	setx	0x2f0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 2144: MOVcc_R	<illegal instruction>
	.word 0xb1e5a19a  ! 2145: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde561cf  ! 2147: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe5a198  ! 2148: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_wr_101:
	mov	0xc, %r14
	.word 0xfef38e80  ! 2149: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_wr_102:
	mov	0x32, %r14
	.word 0xf6f38400  ! 2150: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 36)
	.word 0x8f902000  ! 2155: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5e5e099  ! 2158: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e48000  ! 2160: SAVE_R	save	%r18, %r0, %r27
	.word 0xbfe40000  ! 2164: SAVE_R	save	%r16, %r0, %r31
	.word 0xbbe4213f  ! 2165: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e5c000  ! 2170: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_172:
	setx	0x2f0217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_173:
	setx	0x2f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_103:
	mov	0xf, %r14
	.word 0xf0db84a0  ! 2177: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T0_asi_reg_rd_104:
	mov	0x3c4, %r14
	.word 0xf4db8e60  ! 2181: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbbe44000  ! 2186: SAVE_R	save	%r17, %r0, %r29
	.word 0xb7e5c000  ! 2188: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_105:
	mov	0x1c, %r14
	.word 0xfadb8e40  ! 2191: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb63da014  ! 2194: XNOR_I	xnor 	%r22, 0x0014, %r27
	.word 0xbde5e010  ! 2195: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e48000  ! 2196: SAVE_R	save	%r18, %r0, %r27
	.word 0xbfe5c000  ! 2197: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, c)
	.word 0xbbe42084  ! 2200: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbde52156  ! 2205: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_106:
	mov	0xa, %r14
	.word 0xf2db89e0  ! 2208: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_wr_103:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 2209: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_174:
	setx	0x2f001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_107:
	mov	0x6, %r14
	.word 0xf0db8e40  ! 2212: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 12)
	.word 0xb1e5c000  ! 2215: SAVE_R	save	%r23, %r0, %r24
	.word 0x879420f6  ! 2217: WRPR_TT_I	wrpr	%r16, 0x00f6, %tt
T0_asi_reg_wr_104:
	mov	0x20, %r14
	.word 0xfcf38e60  ! 2218: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_wr_105:
	mov	0x37, %r14
	.word 0xf0f389e0  ! 2221: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbde4c000  ! 2222: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_175:
	setx	0x2e0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba458000  ! 2224: ADDC_R	addc 	%r22, %r0, %r29
	.word 0xbde50000  ! 2225: SAVE_R	save	%r20, %r0, %r30
	.word 0xb1e4201e  ! 2227: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xba8d0000  ! 2229: ANDcc_R	andcc 	%r20, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4a1b1  ! 2233: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe5a139  ! 2236: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_wr_106:
	mov	0xb, %r14
	.word 0xf4f38e40  ! 2237: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbbe5e005  ! 2238: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbde4a042  ! 2242: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_107:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 2243: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_rd_108:
	mov	0x3c6, %r14
	.word 0xf4db8400  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_rd_109:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 2247: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_rd_110:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 2250: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb1e46124  ! 2255: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e40000  ! 2256: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_rd_111:
	mov	0x2a, %r14
	.word 0xfcdb8e60  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_176:
	setx	0x31003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 2266: SAVE_R	save	%r16, %r0, %r28
	.word 0xbc8ce148  ! 2267: ANDcc_I	andcc 	%r19, 0x0148, %r30
T0_asi_reg_wr_108:
	mov	0x15, %r14
	.word 0xfef38e60  ! 2268: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbbe4e099  ! 2274: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 19)
	.word 0xb7e4a072  ! 2278: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe44000  ! 2279: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_112:
	mov	0x2f, %r14
	.word 0xf0db89e0  ! 2280: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_177:
	setx	0x330015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 2284: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_113:
	mov	0x2a, %r14
	.word 0xf4db8e40  ! 2285: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_178:
	setx	0x310123, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_109:
	mov	0x14, %r14
	.word 0xf0f38400  ! 2290: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_rd_114:
	mov	0x3c6, %r14
	.word 0xf2db89e0  ! 2291: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbde4e1e6  ! 2292: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_110:
	mov	0x31, %r14
	.word 0xfaf38e60  ! 2298: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_179:
	setx	0x330308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5615c  ! 2302: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbf7d0400  ! 2308: MOVR_R	movre	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e54000  ! 2312: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_180:
	setx	0x330224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e560e8  ! 2316: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde50000  ! 2317: SAVE_R	save	%r20, %r0, %r30
	.word 0xb9e58000  ! 2320: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_181:
	setx	0x310230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80d20c4  ! 2322: AND_I	and 	%r20, 0x00c4, %r28
	.word 0xb5e520df  ! 2327: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_wr_111:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 2330: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb1e4e0f1  ! 2335: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe54000  ! 2341: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_182:
	setx	0x32001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3cc000  ! 2350: XNOR_R	xnor 	%r19, %r0, %r31
	.word 0xb3e5c000  ! 2351: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 5)
	.word 0xb7e40000  ! 2359: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_183:
	setx	0x330123, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_115:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 2366: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb5e46186  ! 2367: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbe9d8000  ! 2368: XORcc_R	xorcc 	%r22, %r0, %r31
	.word 0xb5e4e173  ! 2369: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_116:
	mov	0x3c6, %r14
	.word 0xf4db8400  ! 2372: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_wr_112:
	mov	0x36, %r14
	.word 0xf4f389e0  ! 2374: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_184:
	setx	0x310000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_113:
	mov	0x3c7, %r14
	.word 0xfcf38400  ! 2377: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb1e50000  ! 2378: SAVE_R	save	%r20, %r0, %r24
	.word 0xb1e50000  ! 2380: SAVE_R	save	%r20, %r0, %r24
	.word 0xb72c4000  ! 2381: SLL_R	sll 	%r17, %r0, %r27
cpu_intr_0_185:
	setx	0x320012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_186:
	setx	0x30002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_187:
	setx	0x320213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b4204f  ! 2396: ORNcc_I	orncc 	%r16, 0x004f, %r24
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_188:
	setx	0x30011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_189:
	setx	0x320028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 17)
	.word 0xb1e4a1fd  ! 2421: SAVE_I	save	%r18, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_190:
	setx	0x33012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e521c4  ! 2425: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb01cc000  ! 2426: XOR_R	xor 	%r19, %r0, %r24
	.word 0xb2b4a147  ! 2427: SUBCcc_I	orncc 	%r18, 0x0147, %r25
	.word 0xbbe50000  ! 2431: SAVE_R	save	%r20, %r0, %r29
	.word 0xbc9d20df  ! 2433: XORcc_I	xorcc 	%r20, 0x00df, %r30
T0_asi_reg_wr_114:
	mov	0x29, %r14
	.word 0xfcf38400  ! 2434: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_wr_115:
	mov	0x38, %r14
	.word 0xf0f38e60  ! 2437: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_rd_117:
	mov	0xd, %r14
	.word 0xfedb89e0  ! 2439: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1e5e141  ! 2441: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_191:
	setx	0x310133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_192:
	setx	0x320326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_193:
	setx	0x31032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_118:
	mov	0x21, %r14
	.word 0xfadb8e40  ! 2450: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_wr_116:
	mov	0xd, %r14
	.word 0xfaf38e40  ! 2458: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_194:
	setx	0x310228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_195:
	setx	0x300304, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_117:
	mov	0x2c, %r14
	.word 0xf8f389e0  ! 2470: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_0_196:
	setx	0x310025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe46002  ! 2472: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_197:
	setx	0x330309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a1ec  ! 2475: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_198:
	setx	0x310214, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_119:
	mov	0x2b, %r14
	.word 0xf8db8e40  ! 2477: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_118:
	mov	0x2, %r14
	.word 0xf0f38e40  ! 2478: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_120:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 2481: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_199:
	setx	0x31032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_119:
	mov	0x35, %r14
	.word 0xf2f38e40  ! 2485: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe48000  ! 2491: SAVE_R	save	%r18, %r0, %r31
	.word 0xbde42045  ! 2494: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e58000  ! 2495: SAVE_R	save	%r22, %r0, %r25
	.word 0xb9e48000  ! 2497: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb5e48000  ! 2500: SAVE_R	save	%r18, %r0, %r26
	.word 0xb09461c7  ! 2502: ORcc_I	orcc 	%r17, 0x01c7, %r24
	.word 0xbde4e11d  ! 2503: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e4e0e7  ! 2504: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_200:
	setx	0x30020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_201:
	setx	0x300120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a171  ! 2508: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e4e1e7  ! 2514: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 33)
	.word 0xbfe56069  ! 2517: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_120:
	mov	0xf, %r14
	.word 0xf6f38e40  ! 2518: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb024c000  ! 2519: SUB_R	sub 	%r19, %r0, %r24
	.word 0xb9e5e02c  ! 2520: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e561c3  ! 2523: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e42041  ! 2524: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e42077  ! 2525: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 18)
	.word 0xbfe4c000  ! 2529: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_202:
	setx	0x330128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 2536: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_203:
	setx	0x30010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_121:
	mov	0x2b, %r14
	.word 0xfadb84a0  ! 2539: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_204:
	setx	0x330008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 2543: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_121:
	mov	0x3c5, %r14
	.word 0xfaf38e80  ! 2552: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbfe4e119  ! 2553: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_205:
	setx	0x310106, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_122:
	mov	0xb, %r14
	.word 0xf0f38e60  ! 2559: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb7e54000  ! 2560: SAVE_R	save	%r21, %r0, %r27
	.word 0xbde54000  ! 2562: SAVE_R	save	%r21, %r0, %r30
	.word 0xbde48000  ! 2564: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e4e078  ! 2570: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_123:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 2571: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_wr_124:
	mov	0xc, %r14
	.word 0xfef38e40  ! 2574: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfe5e1d4  ! 2577: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb89ce14f  ! 2579: XORcc_I	xorcc 	%r19, 0x014f, %r28
	.word 0xb01c606c  ! 2581: XOR_I	xor 	%r17, 0x006c, %r24
	.word 0xb3e50000  ! 2583: SAVE_R	save	%r20, %r0, %r25
	.word 0xb9e5614c  ! 2584: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e50000  ! 2588: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_rd_122:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 2591: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb9e5a1a9  ! 2592: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e4c000  ! 2593: SAVE_R	save	%r19, %r0, %r27
	.word 0xbcb4607d  ! 2595: ORNcc_I	orncc 	%r17, 0x007d, %r30
	.word 0xbd3d9000  ! 2596: SRAX_R	srax	%r22, %r0, %r30
	.word 0xb5e54000  ! 2599: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_125:
	mov	0x1f, %r14
	.word 0xf4f389e0  ! 2601: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_206:
	setx	0x330227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbbe5a1ea  ! 2606: SAVE_I	save	%r22, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_207:
	setx	0x300012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde561a0  ! 2614: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_rd_123:
	mov	0x20, %r14
	.word 0xfedb8e60  ! 2616: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T0_asi_reg_rd_124:
	mov	0x2e, %r14
	.word 0xfadb8e80  ! 2617: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb9e50000  ! 2619: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_wr_126:
	mov	0x29, %r14
	.word 0xf8f38e60  ! 2620: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb5e50000  ! 2625: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_208:
	setx	0x330220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a13c  ! 2629: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_209:
	setx	0x300235, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_125:
	mov	0x35, %r14
	.word 0xf0db8e80  ! 2634: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb5e4c000  ! 2635: SAVE_R	save	%r19, %r0, %r26
	.word 0x8595a174  ! 2636: WRPR_TSTATE_I	wrpr	%r22, 0x0174, %tstate
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 3)
	.word 0xbbe5a185  ! 2639: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e42035  ! 2641: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e56153  ! 2642: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_210:
	setx	0x310129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4204b  ! 2647: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_211:
	setx	0x330022, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_126:
	mov	0x26, %r14
	.word 0xf2db89e0  ! 2658: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_wr_127:
	mov	0x3c6, %r14
	.word 0xf8f389e0  ! 2659: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbbe44000  ! 2660: SAVE_R	save	%r17, %r0, %r29
	.word 0xb9e561ef  ! 2661: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e5a055  ! 2662: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_127:
	mov	0x32, %r14
	.word 0xfadb8e40  ! 2666: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_128:
	mov	0x15, %r14
	.word 0xf0db8e60  ! 2667: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb5e58000  ! 2669: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_129:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 34)
	.word 0xb5500000  ! 2674: RDPR_TPC	<illegal instruction>
cpu_intr_0_212:
	setx	0x330223, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_130:
	mov	0x2f, %r14
	.word 0xfedb8e60  ! 2679: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_213:
	setx	0x310333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 2682: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_131:
	mov	0x13, %r14
	.word 0xf6db8e60  ! 2683: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 18)
	.word 0xb5e40000  ! 2688: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_132:
	mov	0x29, %r14
	.word 0xf4db8400  ! 2690: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbfe56143  ! 2691: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_133:
	mov	0xa, %r14
	.word 0xf8db8e80  ! 2695: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 32)
	.word 0xb5e5c000  ! 2699: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_214:
	setx	0x330214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46013  ! 2704: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_rd_134:
	mov	0x3c4, %r14
	.word 0xf8db89e0  ! 2707: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb7e48000  ! 2708: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_rd_135:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 2709: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb235e1c4  ! 2711: ORN_I	orn 	%r23, 0x01c4, %r25
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb3e5c000  ! 2714: SAVE_R	save	%r23, %r0, %r25
	.word 0xbbe58000  ! 2715: SAVE_R	save	%r22, %r0, %r29
	.word 0xb7e5e072  ! 2716: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e4a0a0  ! 2717: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe5c000  ! 2719: SAVE_R	save	%r23, %r0, %r31
	.word 0xbde4c000  ! 2720: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_rd_136:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 2721: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbd643801  ! 2722: MOVcc_I	<illegal instruction>
	.word 0xb9e5c000  ! 2723: SAVE_R	save	%r23, %r0, %r28
	.word 0xb88dc000  ! 2725: ANDcc_R	andcc 	%r23, %r0, %r28
cpu_intr_0_215:
	setx	0x340032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_216:
	setx	0x340336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 14)
	.word 0xbaa42190  ! 2737: SUBcc_I	subcc 	%r16, 0x0190, %r29
T0_asi_reg_rd_137:
	mov	0x26, %r14
	.word 0xf2db84a0  ! 2739: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbde48000  ! 2745: SAVE_R	save	%r18, %r0, %r30
	.word 0xb5e58000  ! 2746: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_138:
	mov	0x1c, %r14
	.word 0xfcdb8e60  ! 2749: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_wr_128:
	mov	0x35, %r14
	.word 0xf6f38400  ! 2755: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5e4e0a9  ! 2756: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbc9cc000  ! 2757: XORcc_R	xorcc 	%r19, %r0, %r30
	.word 0xb3e54000  ! 2758: SAVE_R	save	%r21, %r0, %r25
	.word 0xb1e4a171  ! 2759: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_217:
	setx	0x370014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_218:
	setx	0x340210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e520bb  ! 2771: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde4c000  ! 2783: SAVE_R	save	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e48000  ! 2785: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_219:
	setx	0x350310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73c8000  ! 2787: SRA_R	sra 	%r18, %r0, %r27
	.word 0xb9358000  ! 2789: SRL_R	srl 	%r22, %r0, %r28
	.word 0xb7e50000  ! 2794: SAVE_R	save	%r20, %r0, %r27
	.word 0xb5e44000  ! 2797: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_139:
	mov	0xc, %r14
	.word 0xfcdb8e40  ! 2798: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbbe54000  ! 2799: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_wr_129:
	mov	0x0, %r14
	.word 0xfef38e80  ! 2801: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb5e4a188  ! 2806: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_220:
	setx	0x350225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56172  ! 2809: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_140:
	mov	0x0, %r14
	.word 0xfcdb8e40  ! 2811: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 27)
	.word 0xb3e58000  ! 2815: SAVE_R	save	%r22, %r0, %r25
	.word 0xbbe44000  ! 2816: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_141:
	mov	0x4, %r14
	.word 0xfadb8e40  ! 2819: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xba044000  ! 2820: ADD_R	add 	%r17, %r0, %r29
cpu_intr_0_221:
	setx	0x360304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb5e5601a  ! 2825: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 39)
	.word 0xb9e5c000  ! 2829: SAVE_R	save	%r23, %r0, %r28
	.word 0xbcbc8000  ! 2830: XNORcc_R	xnorcc 	%r18, %r0, %r30
	.word 0xb3e4a156  ! 2835: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe560f3  ! 2838: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_222:
	setx	0x36011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e42000  ! 2840: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e54000  ! 2841: SAVE_R	save	%r21, %r0, %r27
	.word 0x919560f4  ! 2842: WRPR_PIL_I	wrpr	%r21, 0x00f4, %pil
	.word 0xb1e50000  ! 2843: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_223:
	setx	0x35020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5617d  ! 2851: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe520bd  ! 2852: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_142:
	mov	0x15, %r14
	.word 0xf2db8400  ! 2857: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 29)
	.word 0xb9e46152  ! 2861: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_rd_143:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 2864: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb03460ef  ! 2865: SUBC_I	orn 	%r17, 0x00ef, %r24
T0_asi_reg_wr_130:
	mov	0x3c3, %r14
	.word 0xfef389e0  ! 2867: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb684c000  ! 2869: ADDcc_R	addcc 	%r19, %r0, %r27
T0_asi_reg_wr_131:
	mov	0x0, %r14
	.word 0xfaf384a0  ! 2870: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbde56110  ! 2872: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e5a153  ! 2874: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_132:
	mov	0x32, %r14
	.word 0xfaf38400  ! 2875: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_224:
	setx	0x370112, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_144:
	mov	0x3c8, %r14
	.word 0xf0db89e0  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_225:
	setx	0x36000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_226:
	setx	0x340034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_227:
	setx	0x36022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e52054  ! 2887: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e421a6  ! 2889: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 24)
	.word 0xb7e561aa  ! 2892: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_145:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 2893: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb5e4a03a  ! 2894: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde5c000  ! 2896: SAVE_R	save	%r23, %r0, %r30
	.word 0xbc1c8000  ! 2898: XOR_R	xor 	%r18, %r0, %r30
	.word 0xb1e5a17e  ! 2899: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_146:
	mov	0x17, %r14
	.word 0xfadb89e0  ! 2904: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb7e5e1e9  ! 2905: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e40000  ! 2907: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_133:
	mov	0x2d, %r14
	.word 0xfef389e0  ! 2909: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb5e5e16b  ! 2910: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_147:
	mov	0x21, %r14
	.word 0xfedb8400  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_228:
	setx	0x37022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 2914: SAVE_R	save	%r16, %r0, %r26
	.word 0xbfe5606e  ! 2916: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_134:
	mov	0x25, %r14
	.word 0xfef38e40  ! 2921: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, c)
	.word 0xb7e48000  ! 2923: SAVE_R	save	%r18, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbeb58000  ! 2925: ORNcc_R	orncc 	%r22, %r0, %r31
	.word 0xb9e5c000  ! 2927: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_229:
	setx	0x350318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_230:
	setx	0x35010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_148:
	mov	0x31, %r14
	.word 0xf4db89e0  ! 2934: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbfe44000  ! 2935: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_rd_149:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 2937: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbde4607d  ! 2939: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_231:
	setx	0x34030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 2942: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_135:
	mov	0x23, %r14
	.word 0xfef38e80  ! 2946: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1e54000  ! 2947: SAVE_R	save	%r21, %r0, %r24
	.word 0xb835a0db  ! 2948: SUBC_I	orn 	%r22, 0x00db, %r28
	.word 0xb9e58000  ! 2950: SAVE_R	save	%r22, %r0, %r28
	.word 0xb3e4611e  ! 2951: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_136:
	mov	0x2, %r14
	.word 0xfef38400  ! 2953: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb3e48000  ! 2954: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_137:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 2955: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbbe520bb  ! 2956: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_138:
	mov	0x26, %r14
	.word 0xfcf38e60  ! 2957: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb3e44000  ! 2959: SAVE_R	save	%r17, %r0, %r25
	.word 0xb3e42061  ! 2961: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde58000  ! 2962: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_wr_139:
	mov	0x2e, %r14
	.word 0xf6f389e0  ! 2963: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_0_232:
	setx	0x350239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_233:
	setx	0x360117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 2966: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_rd_150:
	mov	0x36, %r14
	.word 0xf2db89e0  ! 2967: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 29)
	.word 0xb7e4600d  ! 2976: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_wr_140:
	mov	0xf, %r14
	.word 0xf0f384a0  ! 2982: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb1e50000  ! 2985: SAVE_R	save	%r20, %r0, %r24
	.word 0xbbe54000  ! 2987: SAVE_R	save	%r21, %r0, %r29
	.word 0xbfe48000  ! 2989: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 13)
	.word 0xb12d0000  ! 2991: SLL_R	sll 	%r20, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde461ef  ! 2993: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_wr_141:
	mov	0x19, %r14
	.word 0xf2f38e40  ! 2997: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 12)
	.word 0xb1e4a1a1  ! 3002: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb0954000  ! 3003: ORcc_R	orcc 	%r21, %r0, %r24
	.word 0xbbe4205e  ! 3005: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_142:
	mov	0x2b, %r14
	.word 0xf2f38e80  ! 3006: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_rd_151:
	mov	0x2c, %r14
	.word 0xfedb8400  ! 3007: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb1e5a15c  ! 3008: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbbe40000  ! 3009: SAVE_R	save	%r16, %r0, %r29
	.word 0xb5e521d8  ! 3010: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe50000  ! 3011: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_143:
	mov	0x2e, %r14
	.word 0xf8f38e60  ! 3013: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T0_asi_reg_rd_152:
	mov	0x28, %r14
	.word 0xf2db8400  ! 3015: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb1e5c000  ! 3018: SAVE_R	save	%r23, %r0, %r24
	.word 0xb5e4219d  ! 3019: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e54000  ! 3021: SAVE_R	save	%r21, %r0, %r28
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
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_234:
	setx	0x360005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8c202e  ! 3034: ANDcc_I	andcc 	%r16, 0x002e, %r29
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 24)
	.word 0xb7e4a0b1  ! 3037: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_rd_153:
	mov	0xf, %r14
	.word 0xfedb89e0  ! 3045: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, e)
	.word 0xb1e42040  ! 3051: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_wr_144:
	mov	0x18, %r14
	.word 0xf2f38400  ! 3052: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_rd_154:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 3054: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb1e5c000  ! 3056: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_235:
	setx	0x370105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 3059: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_236:
	setx	0x36020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83cc000  ! 3062: XNOR_R	xnor 	%r19, %r0, %r28
cpu_intr_0_237:
	setx	0x350009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 3066: SAVE_R	save	%r23, %r0, %r28
	.word 0xb3e50000  ! 3067: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbde52050  ! 3069: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_155:
	mov	0x27, %r14
	.word 0xfedb8e40  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9e4e0d2  ! 3072: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_145:
	mov	0x24, %r14
	.word 0xf2f38e40  ! 3073: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_156:
	mov	0x1d, %r14
	.word 0xfcdb89e0  ! 3075: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_238:
	setx	0x350128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e094  ! 3081: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb6954000  ! 3084: ORcc_R	orcc 	%r21, %r0, %r27
	.word 0xb13c8000  ! 3085: SRA_R	sra 	%r18, %r0, %r24
cpu_intr_0_239:
	setx	0x37032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_240:
	setx	0x350128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e179  ! 3089: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_241:
	setx	0x350104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e0e5  ! 3098: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_157:
	mov	0x1c, %r14
	.word 0xf8db8e40  ! 3099: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_242:
	setx	0x34002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5602c  ! 3102: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_243:
	setx	0x370101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 12)
	.word 0xbaa5e18a  ! 3109: SUBcc_I	subcc 	%r23, 0x018a, %r29
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_158:
	mov	0x3c1, %r14
	.word 0xf2db8e60  ! 3123: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbde58000  ! 3124: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_159:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 3127: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_244:
	setx	0x35020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e15c  ! 3130: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb3e4a0b5  ! 3132: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 9)
	.word 0xb9e44000  ! 3136: SAVE_R	save	%r17, %r0, %r28
	.word 0xb5e4c000  ! 3137: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_rd_160:
	mov	0x3c7, %r14
	.word 0xf0db8400  ! 3142: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb88dc000  ! 3146: ANDcc_R	andcc 	%r23, %r0, %r28
	.word 0xbfe4c000  ! 3147: SAVE_R	save	%r19, %r0, %r31
	.word 0xb3e460fa  ! 3148: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde5c000  ! 3149: SAVE_R	save	%r23, %r0, %r30
	.word 0xb5e5c000  ! 3150: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_245:
	setx	0x35033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83ca0a6  ! 3157: XNOR_I	xnor 	%r18, 0x00a6, %r28
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 1d)
	.word 0x91952168  ! 3159: WRPR_PIL_I	wrpr	%r20, 0x0168, %pil
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_246:
	setx	0x340231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_247:
	setx	0x3b020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_161:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 3168: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_rd_162:
	mov	0x19, %r14
	.word 0xf0db8e40  ! 3170: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbfe5e118  ! 3179: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, d)
	.word 0xb0acc000  ! 3184: ANDNcc_R	andncc 	%r19, %r0, %r24
	.word 0xb1e42044  ! 3186: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde58000  ! 3187: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_rd_163:
	mov	0x0, %r14
	.word 0xf6db8e80  ! 3189: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 3)
	.word 0xb9e5e10d  ! 3193: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_rd_164:
	mov	0xe, %r14
	.word 0xf0db89e0  ! 3195: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbfe5c000  ! 3201: SAVE_R	save	%r23, %r0, %r31
	.word 0xb7e420dd  ! 3202: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_248:
	setx	0x3a0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e520c0  ! 3204: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_249:
	setx	0x390014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46199  ! 3210: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_rd_165:
	mov	0x25, %r14
	.word 0xf2db8400  ! 3212: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 1)
	.word 0xb7e5c000  ! 3222: SAVE_R	save	%r23, %r0, %r27
	.word 0xbfe58000  ! 3223: SAVE_R	save	%r22, %r0, %r31
	.word 0xb5e5c000  ! 3227: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_250:
	setx	0x3b021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde521c6  ! 3231: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e5c000  ! 3232: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 21)
	.word 0xb9e48000  ! 3238: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_rd_166:
	mov	0xa, %r14
	.word 0xfcdb8400  ! 3242: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_rd_167:
	mov	0x29, %r14
	.word 0xf0db8e40  ! 3248: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1e42172  ! 3251: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_251:
	setx	0x3b0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x859521d9  ! 3255: WRPR_TSTATE_I	wrpr	%r20, 0x01d9, %tstate
cpu_intr_0_252:
	setx	0x3b022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 3259: SAVE_R	save	%r16, %r0, %r29
	.word 0xbfe5202e  ! 3260: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_168:
	mov	0x36, %r14
	.word 0xf8db89e0  ! 3262: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb9e5c000  ! 3266: SAVE_R	save	%r23, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_146:
	mov	0x27, %r14
	.word 0xf2f38e60  ! 3269: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_169:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 3276: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbfe48000  ! 3277: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb035602a  ! 3285: ORN_I	orn 	%r21, 0x002a, %r24
	.word 0xbbe5c000  ! 3286: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_170:
	mov	0x7, %r14
	.word 0xfedb8e40  ! 3287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_171:
	mov	0x12, %r14
	.word 0xfedb8e60  ! 3289: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb3e42062  ! 3291: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe5c000  ! 3293: SAVE_R	save	%r23, %r0, %r29
	.word 0xb9e48000  ! 3294: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_253:
	setx	0x3b0224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 20)
	.word 0xb1e5a16e  ! 3310: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_172:
	mov	0x3c7, %r14
	.word 0xf6db8e80  ! 3311: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbd3da001  ! 3312: SRA_I	sra 	%r22, 0x0001, %r30
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_173:
	mov	0x19, %r14
	.word 0xf6db84a0  ! 3316: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_wr_147:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 3318: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_wr_148:
	mov	0x21, %r14
	.word 0xf6f389e0  ! 3320: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbfe46199  ! 3322: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_149:
	mov	0x34, %r14
	.word 0xf6f38e40  ! 3325: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb9e5e0aa  ! 3327: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_254:
	setx	0x390203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 27)
	.word 0xb9e58000  ! 3337: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_255:
	setx	0x390034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 3341: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, d)
	.word 0xb535c000  ! 3344: SRL_R	srl 	%r23, %r0, %r26
	.word 0xb20420b0  ! 3345: ADD_I	add 	%r16, 0x00b0, %r25
cpu_intr_0_256:
	setx	0x380236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_174:
	mov	0x24, %r14
	.word 0xf0db8400  ! 3356: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb5e48000  ! 3358: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_rd_175:
	mov	0xf, %r14
	.word 0xfcdb8e40  ! 3372: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbde420b7  ! 3373: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e50000  ! 3375: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_wr_150:
	mov	0x2c, %r14
	.word 0xfaf384a0  ! 3376: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_176:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 3378: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0x8f902000  ! 3379: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cpu_intr_0_257:
	setx	0x390117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_258:
	setx	0x3a002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 31)
	.word 0xb5e5c000  ! 3386: SAVE_R	save	%r23, %r0, %r26
	.word 0xb3e5e14b  ! 3388: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_259:
	setx	0x3a033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 3392: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_151:
	mov	0x21, %r14
	.word 0xf0f384a0  ! 3393: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_0_260:
	setx	0x380234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 3399: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_261:
	setx	0x380006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 14)
	.word 0xb60dc000  ! 3405: AND_R	and 	%r23, %r0, %r27
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, f)
	.word 0xb7e4a152  ! 3409: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e5208f  ! 3412: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe521a4  ! 3416: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_262:
	setx	0x3a022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_177:
	mov	0x17, %r14
	.word 0xf0db89e0  ! 3420: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb1e58000  ! 3421: SAVE_R	save	%r22, %r0, %r24
	.word 0xbbe5e1ae  ! 3422: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_152:
	mov	0x19, %r14
	.word 0xfef38e40  ! 3424: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb3e4e092  ! 3427: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_263:
	setx	0x380004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_wr_153:
	mov	0x33, %r14
	.word 0xf2f389e0  ! 3433: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_wr_154:
	mov	0x21, %r14
	.word 0xf4f38400  ! 3434: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_264:
	setx	0x38032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbbe5c000  ! 3441: SAVE_R	save	%r23, %r0, %r29
	.word 0xbde5e195  ! 3442: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 2)
	.word 0xb9e4a09d  ! 3448: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e5c000  ! 3449: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_265:
	setx	0x3b0238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 33)
	.word 0xb5e5a1e3  ! 3457: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e54000  ! 3458: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_178:
	mov	0x6, %r14
	.word 0xf8db8400  ! 3462: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_266:
	setx	0x3a031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_267:
	setx	0x380027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_268:
	setx	0x3b0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00c204e  ! 3475: AND_I	and 	%r16, 0x004e, %r24
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_269:
	setx	0x3b0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 3482: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_270:
	setx	0x39000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_155:
	mov	0x37, %r14
	.word 0xfcf38e40  ! 3491: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9e48000  ! 3492: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_156:
	mov	0x23, %r14
	.word 0xfaf38400  ! 3493: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbde5c000  ! 3494: SAVE_R	save	%r23, %r0, %r30
	.word 0xb8440000  ! 3495: ADDC_R	addc 	%r16, %r0, %r28
cpu_intr_0_271:
	setx	0x3b010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b50000  ! 3497: SUBCcc_R	orncc 	%r20, %r0, %r25
cpu_intr_0_272:
	setx	0x390328, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_157:
	mov	0x1c, %r14
	.word 0xf8f38e40  ! 3501: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, c)
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_273:
	setx	0x3a0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b56029  ! 3510: SUBCcc_I	orncc 	%r21, 0x0029, %r28
	.word 0xbbe58000  ! 3511: SAVE_R	save	%r22, %r0, %r29
	.word 0xbfe5a1af  ! 3513: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e5600f  ! 3515: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_179:
	mov	0x27, %r14
	.word 0xfedb8e40  ! 3519: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_180:
	mov	0x4, %r14
	.word 0xfadb89e0  ! 3520: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb9e48000  ! 3524: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 21)
	.word 0xb3e5a02b  ! 3526: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e4e13e  ! 3528: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe4e080  ! 3529: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e461a6  ! 3531: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_274:
	setx	0x39013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_158:
	mov	0x3c1, %r14
	.word 0xfcf384a0  ! 3535: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_rd_181:
	mov	0x23, %r14
	.word 0xfadb8e80  ! 3536: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 2b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5c000  ! 3544: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 9)
	.word 0xb7e40000  ! 3546: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 3)
	.word 0xb3e5a131  ! 3550: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_275:
	setx	0x3b0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 3553: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_wr_159:
	mov	0x1f, %r14
	.word 0xf6f38e80  ! 3555: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T0_asi_reg_rd_182:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_183:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 3560: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_276:
	setx	0x3b0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40de175  ! 3562: AND_I	and 	%r23, 0x0175, %r26
	.word 0xb9e4e0c9  ! 3564: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde40000  ! 3566: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 18)
	.word 0xbfe4619b  ! 3569: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 7)
	.word 0xb3e44000  ! 3573: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_rd_184:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 3577: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_277:
	setx	0x39000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_160:
	mov	0x3c7, %r14
	.word 0xf0f389e0  ! 3586: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_rd_185:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 3587: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_186:
	mov	0x5, %r14
	.word 0xf6db89e0  ! 3588: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb1e4c000  ! 3594: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_187:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 3596: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb5e44000  ! 3601: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_278:
	setx	0x38022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_279:
	setx	0x38000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_280:
	setx	0x3b0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 3617: SAVE_R	save	%r23, %r0, %r25
	.word 0xb9e5e1a9  ! 3618: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_281:
	setx	0x390201, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_161:
	mov	0x1e, %r14
	.word 0xfef38e40  ! 3624: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbf345000  ! 3626: SRLX_R	srlx	%r17, %r0, %r31
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_162:
	mov	0x29, %r14
	.word 0xf0f38400  ! 3630: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_282:
	setx	0x3c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, b)
	.word 0xb3e4603e  ! 3639: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e4e197  ! 3640: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde4a0c6  ! 3641: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_wr_163:
	mov	0x3, %r14
	.word 0xf6f38e80  ! 3646: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T0_asi_reg_rd_188:
	mov	0xf, %r14
	.word 0xfcdb8e60  ! 3647: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb5e46013  ! 3648: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde4c000  ! 3649: SAVE_R	save	%r19, %r0, %r30
	.word 0xbbe5e0d3  ! 3650: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_283:
	setx	0x3d002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e1fe  ! 3656: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde4207b  ! 3657: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_284:
	setx	0x3e010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 3659: SAVE_R	save	%r22, %r0, %r24
	.word 0xb89c8000  ! 3662: XORcc_R	xorcc 	%r18, %r0, %r28
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb3e50000  ! 3664: SAVE_R	save	%r20, %r0, %r25
	.word 0xb1e5a182  ! 3665: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_285:
	setx	0x3c0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 3668: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_164:
	mov	0x14, %r14
	.word 0xf8f389e0  ! 3669: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_165:
	mov	0x2b, %r14
	.word 0xf4f38e80  ! 3671: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb77d0400  ! 3672: MOVR_R	movre	%r20, %r0, %r27
T0_asi_reg_rd_189:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 3674: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_286:
	setx	0x3c0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e085  ! 3677: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_287:
	setx	0x3f023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 5)
	.word 0xbde58000  ! 3685: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_288:
	setx	0x3d011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_166:
	mov	0x3c3, %r14
	.word 0xf4f384a0  ! 3689: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbfe40000  ! 3692: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_289:
	setx	0x3e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4619c  ! 3694: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 32)
	.word 0xbbe58000  ! 3697: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 31)
	.word 0xbde42160  ! 3701: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e40000  ! 3702: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_290:
	setx	0x3e0021, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_190:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 3705: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbb3de001  ! 3707: SRA_I	sra 	%r23, 0x0001, %r29
	.word 0xb1518000  ! 3708: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e5c000  ! 3709: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_167:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 3711: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_291:
	setx	0x3f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 3713: RDPR_PIL	<illegal instruction>
	.word 0xbbe42038  ! 3715: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_191:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 3722: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_292:
	setx	0x3c0034, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_168:
	mov	0x35, %r14
	.word 0xf6f384a0  ! 3725: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_169:
	mov	0xf, %r14
	.word 0xf2f389e0  ! 3726: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_rd_192:
	mov	0x27, %r14
	.word 0xf6db84a0  ! 3727: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_wr_170:
	mov	0x2c, %r14
	.word 0xfcf38e40  ! 3730: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3e48000  ! 3731: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_193:
	mov	0x17, %r14
	.word 0xfadb8e40  ! 3736: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_293:
	setx	0x3f0213, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_171:
	mov	0x30, %r14
	.word 0xf2f38400  ! 3741: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_rd_194:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_294:
	setx	0x3d022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_195:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 3747: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbfe46049  ! 3748: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e44000  ! 3749: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 9)
	.word 0xbbe5a09a  ! 3753: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_295:
	setx	0x3e0000, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_196:
	mov	0xc, %r14
	.word 0xf6db8400  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_wr_172:
	mov	0x1, %r14
	.word 0xf0f38e80  ! 3757: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T0_asi_reg_rd_197:
	mov	0x31, %r14
	.word 0xf0db8e60  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_rd_198:
	mov	0x33, %r14
	.word 0xf4db8e40  ! 3763: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e46197  ! 3764: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 8)
	.word 0xbbe40000  ! 3768: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 22)
	.word 0xb3e54000  ! 3773: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_173:
	mov	0xb, %r14
	.word 0xf6f38e40  ! 3784: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_296:
	setx	0x3d013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 3790: SAVE_R	save	%r17, %r0, %r27
	.word 0xbbe54000  ! 3791: SAVE_R	save	%r21, %r0, %r29
	.word 0xbbe4a186  ! 3794: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde5a10b  ! 3796: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_199:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 3799: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7e48000  ! 3802: SAVE_R	save	%r18, %r0, %r27
	.word 0xb3e4e11b  ! 3803: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb4254000  ! 3804: SUB_R	sub 	%r21, %r0, %r26
	.word 0xb1e48000  ! 3805: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_297:
	setx	0x3d033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbfe48000  ! 3818: SAVE_R	save	%r18, %r0, %r31
	.word 0xb5e44000  ! 3819: SAVE_R	save	%r17, %r0, %r26
	.word 0xb5e54000  ! 3828: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_rd_200:
	mov	0x2e, %r14
	.word 0xfedb8e40  ! 3829: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_174:
	mov	0x3, %r14
	.word 0xf0f38400  ! 3839: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbde42171  ! 3841: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e58000  ! 3845: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_201:
	mov	0x9, %r14
	.word 0xf4db8e40  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb4c40000  ! 3852: ADDCcc_R	addccc 	%r16, %r0, %r26
	.word 0xbfe54000  ! 3854: SAVE_R	save	%r21, %r0, %r31
	.word 0xbd355000  ! 3856: SRLX_R	srlx	%r21, %r0, %r30
cpu_intr_0_298:
	setx	0x3c0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e460b5  ! 3861: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_299:
	setx	0x3c0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_300:
	setx	0x3e0326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb9e520b7  ! 3871: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e44000  ! 3872: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_301:
	setx	0x3d0109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 10)
	.word 0xb7e5c000  ! 3887: SAVE_R	save	%r23, %r0, %r27
	.word 0xb9e5e00a  ! 3889: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb9e44000  ! 3891: SAVE_R	save	%r17, %r0, %r28
	.word 0xbbe4a163  ! 3893: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e58000  ! 3894: SAVE_R	save	%r22, %r0, %r28
	.word 0xbfe44000  ! 3895: SAVE_R	save	%r17, %r0, %r31
	.word 0xbde58000  ! 3896: SAVE_R	save	%r22, %r0, %r30
	.word 0xb3e4a0c7  ! 3898: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb8250000  ! 3900: SUB_R	sub 	%r20, %r0, %r28
	.word 0xb3e40000  ! 3902: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_302:
	setx	0x3c001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_202:
	mov	0x34, %r14
	.word 0xf2db89e0  ! 3906: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb1e460ad  ! 3910: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 16)
	.word 0xbde40000  ! 3914: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_303:
	setx	0x3c0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb494e1c3  ! 3917: ORcc_I	orcc 	%r19, 0x01c3, %r26
T0_asi_reg_rd_203:
	mov	0x38, %r14
	.word 0xf8db8e60  ! 3919: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 34)
	.word 0xb7e52076  ! 3922: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_304:
	setx	0x3d0123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb9e54000  ! 3931: SAVE_R	save	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_204:
	mov	0x3c6, %r14
	.word 0xf2db8e80  ! 3934: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_0_305:
	setx	0x3f033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 3937: SAVE_R	save	%r23, %r0, %r31
	.word 0xb1520000  ! 3938: RDPR_PIL	<illegal instruction>
	.word 0xb9e52117  ! 3940: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_306:
	setx	0x3e0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbab4e15a  ! 3949: SUBCcc_I	orncc 	%r19, 0x015a, %r29
	.word 0xb5e40000  ! 3954: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, d)
	.word 0xbd2d9000  ! 3959: SLLX_R	sllx	%r22, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_307:
	setx	0x3d0038, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_205:
	mov	0x33, %r14
	.word 0xf8db84a0  ! 3964: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T0_asi_reg_wr_175:
	mov	0x5, %r14
	.word 0xf2f38e40  ! 3965: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbf346001  ! 3967: SRL_I	srl 	%r17, 0x0001, %r31
	.word 0xbbe56151  ! 3968: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb4ad2195  ! 3971: ANDNcc_I	andncc 	%r20, 0x0195, %r26
	.word 0xb3e5a174  ! 3973: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_308:
	setx	0x3f030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_309:
	setx	0x3d033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_310:
	setx	0x3e0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe46085  ! 3979: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_rd_206:
	mov	0x38, %r14
	.word 0xfadb8e80  ! 3980: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb00c61d4  ! 3981: AND_I	and 	%r17, 0x01d4, %r24
	.word 0xbb2d8000  ! 3984: SLL_R	sll 	%r22, %r0, %r29
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 23)
	.word 0xb9e560a9  ! 3990: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e4a1a7  ! 3991: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_311:
	setx	0x3c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a145  ! 3993: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e44000  ! 3996: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_176:
	mov	0x24, %r14
	.word 0xf4f38e80  ! 4003: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_rd_207:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 4006: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb5e52177  ! 4007: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_wr_177:
	mov	0xc, %r14
	.word 0xf4f38e40  ! 4009: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e44000  ! 4014: SAVE_R	save	%r17, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde50000  ! 4020: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 1)
	.word 0xbbe54000  ! 4026: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_wr_178:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 4027: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_312:
	setx	0x3f0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3db001  ! 4034: SRAX_I	srax	%r22, 0x0001, %r30
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_rd_208:
	mov	0x3c0, %r14
	.word 0xf2db84a0  ! 4039: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb9e5e12d  ! 4041: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3347001  ! 4042: SRLX_I	srlx	%r17, 0x0001, %r25
cpu_intr_0_313:
	setx	0x3c0338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_314:
	setx	0x3c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_315:
	setx	0x3c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b420b1  ! 4052: SUBCcc_I	orncc 	%r16, 0x00b1, %r28
	.word 0xbbe54000  ! 4055: SAVE_R	save	%r21, %r0, %r29
	.word 0xb3e4606b  ! 4056: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_rd_209:
	mov	0x22, %r14
	.word 0xf0db8e40  ! 4059: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, b)
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_316:
	setx	0x3d0336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbde5e0c1  ! 4066: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb0bca060  ! 4068: XNORcc_I	xnorcc 	%r18, 0x0060, %r24
	.word 0xb1e56070  ! 4069: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_wr_179:
	mov	0x2, %r14
	.word 0xf6f38e80  ! 4071: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_317:
	setx	0x3c0024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_318:
	setx	0x3e002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_180:
	mov	0x3c6, %r14
	.word 0xf4f38400  ! 4075: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_wr_181:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 4078: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 6)
	.word 0xb1e5e1bb  ! 4082: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_182:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 4084: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_183:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 4087: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_0_319:
	setx	0x3f0000, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_184:
	mov	0x36, %r14
	.word 0xf2f38400  ! 4089: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb8c4211d  ! 4090: ADDCcc_I	addccc 	%r16, 0x011d, %r28
	.word 0xb1e560f9  ! 4091: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_320:
	setx	0x3e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_321:
	setx	0x3e0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21ce061  ! 4099: XOR_I	xor 	%r19, 0x0061, %r25
cpu_intr_0_322:
	setx	0x400132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e46138  ! 4107: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_323:
	setx	0x41022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 12)
	.word 0xb635e146  ! 4117: SUBC_I	orn 	%r23, 0x0146, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5202a  ! 4121: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_wr_185:
	mov	0x2f, %r14
	.word 0xfaf384a0  ! 4122: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e5a173  ! 4124: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbc95a1db  ! 4126: ORcc_I	orcc 	%r22, 0x01db, %r30
	.word 0xb7e48000  ! 4128: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_rd_210:
	mov	0xf, %r14
	.word 0xfadb89e0  ! 4129: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb3e58000  ! 4133: SAVE_R	save	%r22, %r0, %r25
	.word 0xb1e5e030  ! 4135: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde4e0b8  ! 4136: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe40000  ! 4137: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_211:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 4142: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_324:
	setx	0x41032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_212:
	mov	0x6, %r14
	.word 0xfcdb8e40  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbe4461ed  ! 4149: ADDC_I	addc 	%r17, 0x01ed, %r31
	.word 0xb5e4a11a  ! 4150: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbb50c000  ! 4151: RDPR_TT	<illegal instruction>
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_213:
	mov	0x3c3, %r14
	.word 0xfedb8e60  ! 4156: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_325:
	setx	0x420115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebc4000  ! 4161: XNORcc_R	xnorcc 	%r17, %r0, %r31
	.word 0xb9e50000  ! 4163: SAVE_R	save	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_214:
	mov	0x29, %r14
	.word 0xfcdb89e0  ! 4165: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e40000  ! 4167: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_215:
	mov	0x2d, %r14
	.word 0xf4db8e80  ! 4168: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb9e56074  ! 4169: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e5c000  ! 4170: SAVE_R	save	%r23, %r0, %r25
	.word 0x859521d2  ! 4175: WRPR_TSTATE_I	wrpr	%r20, 0x01d2, %tstate
	.word 0xbbe46179  ! 4177: SAVE_I	save	%r17, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_326:
	setx	0x42022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe461b9  ! 4181: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 21)
	.word 0xb1e40000  ! 4184: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 27)
	.word 0xb7e44000  ! 4189: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_rd_216:
	mov	0x35, %r14
	.word 0xfedb89e0  ! 4194: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_rd_217:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 4195: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_327:
	setx	0x420237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 4201: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_328:
	setx	0x420027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_329:
	setx	0x410224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 4208: SAVE_R	save	%r16, %r0, %r24
	.word 0xbde44000  ! 4210: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_330:
	setx	0x420212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72d8000  ! 4214: SLL_R	sll 	%r22, %r0, %r27
	.word 0xbfe5e127  ! 4216: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe44000  ! 4220: SAVE_R	save	%r17, %r0, %r29
	.word 0xb0a40000  ! 4221: SUBcc_R	subcc 	%r16, %r0, %r24
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 0)
	.word 0xb7e50000  ! 4223: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_rd_218:
	mov	0x3c8, %r14
	.word 0xf8db8e80  ! 4226: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_wr_186:
	mov	0x32, %r14
	.word 0xf4f38e80  ! 4227: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe56078  ! 4231: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_187:
	mov	0xe, %r14
	.word 0xf0f384a0  ! 4232: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, b)
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 11)
	.word 0xb9e5a082  ! 4244: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 36)
	.word 0xb1e40000  ! 4252: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 38)
	.word 0xb9e5c000  ! 4258: SAVE_R	save	%r23, %r0, %r28
	.word 0xb9e460de  ! 4259: SAVE_I	save	%r17, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_331:
	setx	0x41003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 4266: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_188:
	mov	0x31, %r14
	.word 0xf2f38400  ! 4268: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb7e40000  ! 4269: SAVE_R	save	%r16, %r0, %r27
	.word 0xb9e48000  ! 4270: SAVE_R	save	%r18, %r0, %r28
	.word 0xbbe4e030  ! 4272: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe5e024  ! 4276: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_332:
	setx	0x420138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 4281: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_189:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 4282: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xba940000  ! 4283: ORcc_R	orcc 	%r16, %r0, %r29
T0_asi_reg_wr_190:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 4284: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 31)
	.word 0xbfe520af  ! 4286: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_219:
	mov	0x26, %r14
	.word 0xfedb8e40  ! 4287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_191:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 4289: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_333:
	setx	0x135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_334:
	setx	0x420015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 4295: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_wr_192:
	mov	0x31, %r14
	.word 0xf0f38e40  ! 4296: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3e40000  ! 4297: SAVE_R	save	%r16, %r0, %r25
	.word 0xba0da10b  ! 4298: AND_I	and 	%r22, 0x010b, %r29
	.word 0xb9e48000  ! 4299: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_193:
	mov	0xd, %r14
	.word 0xf4f38e40  ! 4303: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_194:
	mov	0x3c5, %r14
	.word 0xf4f38e60  ! 4304: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, f)
	.word 0xbde4c000  ! 4318: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_195:
	mov	0xf, %r14
	.word 0xf4f38400  ! 4319: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe48000  ! 4324: SAVE_R	save	%r18, %r0, %r29
	.word 0xb4c52102  ! 4326: ADDCcc_I	addccc 	%r20, 0x0102, %r26
	.word 0xbfe52190  ! 4327: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 15)
	.word 0xb095a01d  ! 4329: ORcc_I	orcc 	%r22, 0x001d, %r24
	.word 0xb3e5c000  ! 4330: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_335:
	setx	0x400230, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_220:
	mov	0x0, %r14
	.word 0xf6db8e60  ! 4332: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbfe5610e  ! 4336: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_196:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 4337: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb1e4c000  ! 4352: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_221:
	mov	0x19, %r14
	.word 0xfcdb84a0  ! 4353: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_222:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_197:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 4358: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb1e4e14c  ! 4360: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe44000  ! 4362: SAVE_R	save	%r17, %r0, %r29
	.word 0xb28ca040  ! 4364: ANDcc_I	andcc 	%r18, 0x0040, %r25
cpu_intr_0_336:
	setx	0x42033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb7e46168  ! 4368: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_wr_198:
	mov	0x28, %r14
	.word 0xf6f38400  ! 4370: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb1e5c000  ! 4373: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_199:
	mov	0x2e, %r14
	.word 0xfcf38e80  ! 4380: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_rd_223:
	mov	0x13, %r14
	.word 0xfadb8e80  ! 4381: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb7e4604d  ! 4382: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e5a13b  ! 4385: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe5e0e7  ! 4386: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_200:
	mov	0x23, %r14
	.word 0xfaf38e80  ! 4387: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_224:
	mov	0xa, %r14
	.word 0xfadb8e60  ! 4389: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbde58000  ! 4391: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, a)
	.word 0xb7e4e104  ! 4394: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbc3c4000  ! 4396: XNOR_R	xnor 	%r17, %r0, %r30
	.word 0xb9e58000  ! 4398: SAVE_R	save	%r22, %r0, %r28
	.word 0xbde58000  ! 4400: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_225:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 4401: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_337:
	setx	0x420332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5216f  ! 4403: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe5e1f1  ! 4405: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e50000  ! 4406: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_rd_226:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 4407: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_338:
	setx	0x42023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_339:
	setx	0x410317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 4418: SAVE_R	save	%r23, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e54000  ! 4420: SAVE_R	save	%r21, %r0, %r26
	.word 0xb7e5604e  ! 4421: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9510000  ! 4422: RDPR_TICK	<illegal instruction>
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 22)
	.word 0xbbe58000  ! 4424: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_340:
	setx	0x42013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbde50000  ! 4438: SAVE_R	save	%r20, %r0, %r30
	.word 0xb0a40000  ! 4439: SUBcc_R	subcc 	%r16, %r0, %r24
	.word 0xb1e5c000  ! 4441: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_341:
	setx	0x400202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 29)
	.word 0xb5e4a036  ! 4449: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_rd_227:
	mov	0x2f, %r14
	.word 0xf2db8e40  ! 4453: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 23)
	.word 0xb01d4000  ! 4458: XOR_R	xor 	%r21, %r0, %r24
	.word 0xb9e42186  ! 4459: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_342:
	setx	0x41033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a0c5  ! 4462: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e4e064  ! 4463: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_343:
	setx	0x42020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e172  ! 4465: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 18)
	.word 0xa1902001  ! 4469: WRPR_GL_I	wrpr	%r0, 0x0001, %-
T0_asi_reg_wr_201:
	mov	0x11, %r14
	.word 0xf2f384a0  ! 4473: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb8a54000  ! 4475: SUBcc_R	subcc 	%r21, %r0, %r28
T0_asi_reg_rd_228:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 4479: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1350000  ! 4482: SRL_R	srl 	%r20, %r0, %r24
T0_asi_reg_rd_229:
	mov	0x3c0, %r14
	.word 0xf8db8e80  ! 4485: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_344:
	setx	0x40012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 4491: SAVE_R	save	%r19, %r0, %r31
	.word 0xbb643801  ! 4492: MOVcc_I	<illegal instruction>
T0_asi_reg_wr_202:
	mov	0xe, %r14
	.word 0xfcf384a0  ! 4494: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbde54000  ! 4497: SAVE_R	save	%r21, %r0, %r30
	.word 0xbde4c000  ! 4500: SAVE_R	save	%r19, %r0, %r30
	.word 0xb88cc000  ! 4501: ANDcc_R	andcc 	%r19, %r0, %r28
	.word 0xb3e5e17c  ! 4503: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_345:
	setx	0x410019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 39)
	.word 0xbbe5a1df  ! 4511: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_wr_203:
	mov	0x3c1, %r14
	.word 0xf2f38e60  ! 4514: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb13c7001  ! 4515: SRAX_I	srax	%r17, 0x0001, %r24
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_230:
	mov	0x3c8, %r14
	.word 0xf6db89e0  ! 4518: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_0_346:
	setx	0x40001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_347:
	setx	0x43003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 4521: SAVE_R	save	%r17, %r0, %r29
	.word 0xb6354000  ! 4527: SUBC_R	orn 	%r21, %r0, %r27
	.word 0xb9e48000  ! 4531: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_348:
	setx	0x400026, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_204:
	mov	0xe, %r14
	.word 0xfaf389e0  ! 4536: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_349:
	setx	0x42001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_350:
	setx	0x400102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1c8  ! 4545: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_205:
	mov	0x31, %r14
	.word 0xf8f389e0  ! 4549: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbac50000  ! 4550: ADDCcc_R	addccc 	%r20, %r0, %r29
	.word 0xbcad0000  ! 4551: ANDNcc_R	andncc 	%r20, %r0, %r30
	.word 0xb9e40000  ! 4555: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_206:
	mov	0x32, %r14
	.word 0xfcf389e0  ! 4556: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb5e4210c  ! 4558: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e4e1f0  ! 4559: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_351:
	setx	0x470031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 4561: SAVE_R	save	%r22, %r0, %r25
	.word 0xb7e54000  ! 4562: SAVE_R	save	%r21, %r0, %r27
	.word 0xb7e58000  ! 4565: SAVE_R	save	%r22, %r0, %r27
	.word 0xbfe5a134  ! 4566: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_352:
	setx	0x46001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 4574: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_207:
	mov	0x16, %r14
	.word 0xf4f38400  ! 4579: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5c000  ! 4583: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_353:
	setx	0x470007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0cd  ! 4586: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e42153  ! 4588: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e5e0d5  ! 4589: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e4613c  ! 4591: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e4c000  ! 4592: SAVE_R	save	%r19, %r0, %r27
	.word 0xb1e5a0af  ! 4594: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_208:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 4596: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_354:
	setx	0x47021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e421f1  ! 4599: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_355:
	setx	0x460103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_356:
	setx	0x20317, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_231:
	mov	0x11, %r14
	.word 0xf2db8400  ! 4605: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbfe52123  ! 4606: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e5e1f6  ! 4607: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_209:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 4614: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_0_357:
	setx	0x45030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_210:
	mov	0x3c8, %r14
	.word 0xf0f38e80  ! 4618: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb9e46131  ! 4620: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_211:
	mov	0xb, %r14
	.word 0xf2f389e0  ! 4622: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_0_358:
	setx	0x45030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_359:
	setx	0x47010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_232:
	mov	0x19, %r14
	.word 0xfadb8e80  ! 4627: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_0_360:
	setx	0x450133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a140  ! 4631: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb37de401  ! 4632: MOVR_I	movre	%r23, 0x1, %r25
cpu_intr_0_361:
	setx	0x47013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_wr_212:
	mov	0x3c0, %r14
	.word 0xfef384a0  ! 4642: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb9e54000  ! 4644: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_362:
	setx	0x45022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_233:
	mov	0x2e, %r14
	.word 0xf0db84a0  ! 4648: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 18)
	.word 0xbde44000  ! 4653: SAVE_R	save	%r17, %r0, %r30
	.word 0xb7e48000  ! 4658: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_wr_213:
	mov	0x33, %r14
	.word 0xf8f38e40  ! 4659: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9e50000  ! 4660: SAVE_R	save	%r20, %r0, %r28
	.word 0xb7e4c000  ! 4663: SAVE_R	save	%r19, %r0, %r27
	.word 0xb3e40000  ! 4664: SAVE_R	save	%r16, %r0, %r25
	.word 0xbde46035  ! 4665: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 34)
	.word 0xb5e48000  ! 4669: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_wr_214:
	mov	0x31, %r14
	.word 0xfcf38e60  ! 4675: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbd34c000  ! 4676: SRL_R	srl 	%r19, %r0, %r30
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_363:
	setx	0x470200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 4680: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_364:
	setx	0x470022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 4684: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb3e5e164  ! 4687: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e52019  ! 4689: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_365:
	setx	0x46030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb7e4e06c  ! 4694: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_215:
	mov	0x15, %r14
	.word 0xf4f38e40  ! 4696: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_234:
	mov	0x32, %r14
	.word 0xf0db8e80  ! 4697: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_366:
	setx	0x45031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb7e4e0ba  ! 4703: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_235:
	mov	0x1, %r14
	.word 0xfcdb8e60  ! 4705: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_367:
	setx	0x46030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56179  ! 4707: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb93d7001  ! 4709: SRAX_I	srax	%r21, 0x0001, %r28
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb6b4c000  ! 4711: ORNcc_R	orncc 	%r19, %r0, %r27
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 5)
	.word 0xb1e42034  ! 4713: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_216:
	mov	0x10, %r14
	.word 0xfaf38e80  ! 4719: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb23da0e3  ! 4720: XNOR_I	xnor 	%r22, 0x00e3, %r25
	.word 0xbf480000  ! 4721: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
T0_asi_reg_rd_236:
	mov	0x3c2, %r14
	.word 0xfadb89e0  ! 4722: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_368:
	setx	0x460215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0242106  ! 4729: SUB_I	sub 	%r16, 0x0106, %r24
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 7)
	.word 0xb1e40000  ! 4734: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_369:
	setx	0x450129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_370:
	setx	0x470037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6948000  ! 4737: ORcc_R	orcc 	%r18, %r0, %r27
	.word 0xb9e44000  ! 4738: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 12)
	.word 0xb3e5a15f  ! 4744: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb3352001  ! 4753: SRL_I	srl 	%r20, 0x0001, %r25
	.word 0xb9e4e09e  ! 4759: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_371:
	setx	0x440112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 3)
	.word 0xbfe40000  ! 4772: SAVE_R	save	%r16, %r0, %r31
	.word 0xbde520cb  ! 4773: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe40000  ! 4777: SAVE_R	save	%r16, %r0, %r29
	.word 0xbe0c4000  ! 4778: AND_R	and 	%r17, %r0, %r31
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb5e5610f  ! 4781: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9350000  ! 4784: SRL_R	srl 	%r20, %r0, %r28
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb21c601f  ! 4790: XOR_I	xor 	%r17, 0x001f, %r25
	.word 0xbb540000  ! 4792: RDPR_GL	<illegal instruction>
T0_asi_reg_wr_217:
	mov	0x37, %r14
	.word 0xfef384a0  ! 4793: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb7e58000  ! 4794: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_372:
	setx	0x470037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e016  ! 4798: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_373:
	setx	0x450229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13c3001  ! 4802: SRAX_I	srax	%r16, 0x0001, %r24
	.word 0xb5e5c000  ! 4804: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_rd_237:
	mov	0x2b, %r14
	.word 0xf8db8e40  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_238:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 4807: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_374:
	setx	0x45000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_239:
	mov	0x16, %r14
	.word 0xf2db84a0  ! 4811: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3e44000  ! 4813: SAVE_R	save	%r17, %r0, %r25
	.word 0xbfe5605a  ! 4814: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e4e107  ! 4819: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_218:
	mov	0x0, %r14
	.word 0xf6f38400  ! 4820: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbfe48000  ! 4821: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 19)
	.word 0xa1902002  ! 4824: WRPR_GL_I	wrpr	%r0, 0x0002, %-
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_375:
	setx	0x450136, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e46126  ! 4835: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_wr_219:
	mov	0x37, %r14
	.word 0xfef38400  ! 4836: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1e58000  ! 4840: SAVE_R	save	%r22, %r0, %r24
	.word 0xb3e4c000  ! 4844: SAVE_R	save	%r19, %r0, %r25
	.word 0xbfe4a127  ! 4849: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e44000  ! 4856: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_rd_240:
	mov	0x18, %r14
	.word 0xf0db8400  ! 4860: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_376:
	setx	0x46033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_241:
	mov	0x3c2, %r14
	.word 0xfcdb8e80  ! 4866: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_377:
	setx	0x440311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_378:
	setx	0x460136, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_220:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 4875: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_242:
	mov	0x2c, %r14
	.word 0xfadb8400  ! 4877: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb1e5a083  ! 4880: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e54000  ! 4882: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_379:
	setx	0x460231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 4885: SAVE_R	save	%r17, %r0, %r24
	.word 0xb0c58000  ! 4888: ADDCcc_R	addccc 	%r22, %r0, %r24
cpu_intr_0_380:
	setx	0x44001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_381:
	setx	0x47021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3c6001  ! 4895: SRA_I	sra 	%r17, 0x0001, %r29
	.word 0xbbe4c000  ! 4898: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_396:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_396), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_397:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_397), 16, 16)) -> intp(0, 0, 12)
	.word 0xb5e461f2  ! 4907: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e58000  ! 4910: SAVE_R	save	%r22, %r0, %r27
	.word 0xb5e561ff  ! 4912: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e44000  ! 4913: SAVE_R	save	%r17, %r0, %r26
	.word 0xb1e5a1f0  ! 4914: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_221:
	mov	0xd, %r14
	.word 0xfaf384a0  ! 4915: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbcbca1d0  ! 4916: XNORcc_I	xnorcc 	%r18, 0x01d0, %r30
	.word 0xb61cc000  ! 4917: XOR_R	xor 	%r19, %r0, %r27
T0_asi_reg_wr_222:
	mov	0x6, %r14
	.word 0xfcf38e60  ! 4919: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_398:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_398), 16, 16)) -> intp(0, 0, 1c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_243:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 4926: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_399:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_399), 16, 16)) -> intp(0, 0, 38)
	.word 0xba244000  ! 4928: SUB_R	sub 	%r17, %r0, %r29
iob_intr_0_400:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_400), 16, 16)) -> intp(0, 0, 32)
	.word 0xb5e48000  ! 4934: SAVE_R	save	%r18, %r0, %r26
	.word 0xbde4a138  ! 4936: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_382:
	setx	0x460016, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_383:
	setx	0x450218, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_244:
	mov	0x21, %r14
	.word 0xf6db8e80  ! 4944: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T0_asi_reg_rd_245:
	mov	0x30, %r14
	.word 0xf0db8e40  ! 4945: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_401:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_401), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_384:
	setx	0x45033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1c0000  ! 4948: XOR_R	xor 	%r16, %r0, %r30
	.word 0xb5e5a06d  ! 4950: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_385:
	setx	0x45013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42117  ! 4960: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_402:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_402), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_246:
	mov	0xb, %r14
	.word 0xf8db84a0  ! 4962: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_403:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_403), 16, 16)) -> intp(0, 0, f)
	.word 0xb7e5212c  ! 4969: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_386:
	setx	0x44031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_387:
	setx	0x450125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a0f1  ! 4977: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe44000  ! 4979: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_223:
	mov	0x3c2, %r14
	.word 0xf2f38e60  ! 4982: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_wr_224:
	mov	0x1, %r14
	.word 0xf0f38400  ! 4989: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_0_388:
	setx	0x44003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_247:
	mov	0x1a, %r14
	.word 0xfcdb8e40  ! 4992: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbbe5a196  ! 4993: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_404:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_404), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_248:
	mov	0x3c6, %r14
	.word 0xf6db89e0  ! 4996: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_rd_249:
	mov	0x7, %r14
	.word 0xfedb8e40  ! 4997: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_405:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_405), 16, 16)) -> intp(0, 0, 38)
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
T3_asi_reg_wr_0:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 1: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_0:
	setx	0x180311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a48020  ! 6: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
	.word 0xbab48000  ! 7: SUBCcc_R	orncc 	%r18, %r0, %r29
	.word 0xa1902002  ! 12: WRPR_GL_I	wrpr	%r0, 0x0002, %-
T3_asi_reg_rd_0:
	mov	0xf, %r14
	.word 0xfadb8e60  ! 13: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_3_1:
	setx	0x1f012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeadc020  ! 16: STBA_R	stba	%r31, [%r23 + %r0] 0x01
	.word 0xfe2d4000  ! 21: STB_R	stb	%r31, [%r21 + %r0]
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 20)
	.word 0xfe2c2053  ! 23: STB_I	stb	%r31, [%r16 + 0x0053]
	.word 0xf6b48020  ! 24: STHA_R	stha	%r27, [%r18 + %r0] 0x01
	.word 0xfa25605b  ! 25: STW_I	stw	%r29, [%r21 + 0x005b]
	.word 0xfc2dc000  ! 26: STB_R	stb	%r30, [%r23 + %r0]
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_wr_1:
	mov	0x1c, %r14
	.word 0xfef38e60  ! 31: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfe34c000  ! 32: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf6ac6027  ! 33: STBA_I	stba	%r27, [%r17 + 0x0027] %asi
	.word 0xb4ace0d9  ! 36: ANDNcc_I	andncc 	%r19, 0x00d9, %r26
cpu_intr_3_2:
	setx	0x23d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_3:
	setx	0x1c0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2358000  ! 43: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xfe254000  ! 44: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf8ac4020  ! 46: STBA_R	stba	%r28, [%r17 + %r0] 0x01
cpu_intr_3_4:
	setx	0x1f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d2086  ! 51: STB_I	stb	%r26, [%r20 + 0x0086]
	ta	T_CHANGE_TO_TL1
	.word 0xf6342004  ! 56: STH_I	sth	%r27, [%r16 + 0x0004]
T3_asi_reg_wr_2:
	mov	0x24, %r14
	.word 0xfef38e40  ! 57: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_3:
	mov	0x13, %r14
	.word 0xfef384a0  ! 59: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_rd_1:
	mov	0x33, %r14
	.word 0xf6db84a0  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbcbc8000  ! 61: XNORcc_R	xnorcc 	%r18, %r0, %r30
	.word 0x81952108  ! 62: WRPR_TPC_I	wrpr	%r20, 0x0108, %tpc
	.word 0xf8b5a1de  ! 68: STHA_I	stha	%r28, [%r22 + 0x01de] %asi
	.word 0xf4354000  ! 71: STH_R	sth	%r26, [%r21 + %r0]
T3_asi_reg_wr_4:
	mov	0x0, %r14
	.word 0xfcf38e40  ! 72: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 1a)
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982ed0  ! 75: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed0, %hpstate
T3_asi_reg_rd_2:
	mov	0x2a, %r14
	.word 0xf4db8e80  ! 77: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_5:
	mov	0x5, %r14
	.word 0xfcf38e60  ! 79: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_5:
	setx	0x1e0100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 1)
	.word 0xf8256091  ! 91: STW_I	stw	%r28, [%r21 + 0x0091]
cpu_intr_3_6:
	setx	0x1f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_7:
	setx	0x1c0105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_8:
	setx	0x1f0202, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_3:
	mov	0x27, %r14
	.word 0xf0db8400  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf0f4a1ea  ! 104: STXA_I	stxa	%r24, [%r18 + 0x01ea] %asi
	.word 0xf024e026  ! 105: STW_I	stw	%r24, [%r19 + 0x0026]
	.word 0xf2a4c020  ! 107: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
T3_asi_reg_rd_4:
	mov	0x2e, %r14
	.word 0xf6db8e40  ! 108: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf4346109  ! 109: STH_I	sth	%r26, [%r17 + 0x0109]
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_5:
	mov	0x29, %r14
	.word 0xf0db8e40  ! 117: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xba8d0000  ! 120: ANDcc_R	andcc 	%r20, %r0, %r29
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c82  ! 122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c82, %hpstate
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, a)
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_6:
	mov	0x1b, %r14
	.word 0xfaf38e60  ! 133: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf0b4c020  ! 135: STHA_R	stha	%r24, [%r19 + %r0] 0x01
	.word 0xb77d0400  ! 142: MOVR_R	movre	%r20, %r0, %r27
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 37)
	.word 0xfef46191  ! 148: STXA_I	stxa	%r31, [%r17 + 0x0191] %asi
	.word 0xf0f4a170  ! 149: STXA_I	stxa	%r24, [%r18 + 0x0170] %asi
T3_asi_reg_rd_6:
	mov	0x31, %r14
	.word 0xfcdb8e80  ! 150: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T3_asi_reg_rd_7:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 154: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_9:
	setx	0x1f022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 34)
	.word 0xf6a58020  ! 164: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xf8adc020  ! 165: STBA_R	stba	%r28, [%r23 + %r0] 0x01
T3_asi_reg_rd_8:
	mov	0x38, %r14
	.word 0xf0db89e0  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_wr_7:
	mov	0x1b, %r14
	.word 0xfcf38e80  ! 170: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_wr_8:
	mov	0x7, %r14
	.word 0xf4f38e40  ! 171: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf2242188  ! 174: STW_I	stw	%r25, [%r16 + 0x0188]
	.word 0xb8046042  ! 176: ADD_I	add 	%r17, 0x0042, %r28
	.word 0xfea5c020  ! 177: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
T3_asi_reg_wr_9:
	mov	0x3c4, %r14
	.word 0xf0f389e0  ! 182: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf874a006  ! 186: STX_I	stx	%r28, [%r18 + 0x0006]
T3_asi_reg_rd_9:
	mov	0x2f, %r14
	.word 0xf2db8e40  ! 187: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb73c5000  ! 188: SRAX_R	srax	%r17, %r0, %r27
T3_asi_reg_wr_10:
	mov	0xa, %r14
	.word 0xf4f384a0  ! 189: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T3_asi_reg_rd_10:
	mov	0x1a, %r14
	.word 0xf6db8400  ! 191: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_wr_11:
	mov	0x25, %r14
	.word 0xf6f38e80  ! 193: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_wr_12:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 197: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_3_10:
	setx	0x1f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef460ee  ! 199: STXA_I	stxa	%r31, [%r17 + 0x00ee] %asi
	.word 0xf22d60aa  ! 202: STB_I	stb	%r25, [%r21 + 0x00aa]
	.word 0xf2358000  ! 203: STH_R	sth	%r25, [%r22 + %r0]
cpu_intr_3_11:
	setx	0x1e0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf5e047  ! 206: STXA_I	stxa	%r29, [%r23 + 0x0047] %asi
T3_asi_reg_wr_13:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 208: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf0a48020  ! 209: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	.word 0xf02d617e  ! 213: STB_I	stb	%r24, [%r21 + 0x017e]
T3_asi_reg_wr_14:
	mov	0x14, %r14
	.word 0xf8f38e80  ! 216: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_rd_11:
	mov	0x3c7, %r14
	.word 0xf2db8e80  ! 217: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_3_12:
	setx	0x1c0119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_13:
	setx	0x1e0218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_14:
	setx	0x1e003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc50000  ! 223: ADDCcc_R	addccc 	%r20, %r0, %r30
T3_asi_reg_rd_12:
	mov	0x17, %r14
	.word 0xfedb89e0  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfab5608e  ! 226: STHA_I	stha	%r29, [%r21 + 0x008e] %asi
	.word 0xf8258000  ! 227: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xf42ca0a1  ! 228: STB_I	stb	%r26, [%r18 + 0x00a1]
	.word 0xf02d61c1  ! 229: STB_I	stb	%r24, [%r21 + 0x01c1]
T3_asi_reg_wr_15:
	mov	0x2, %r14
	.word 0xf6f38e40  ! 231: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_16:
	mov	0x2f, %r14
	.word 0xfef38e40  ! 236: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_15:
	setx	0x1d0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf560ad  ! 239: STXA_I	stxa	%r30, [%r21 + 0x00ad] %asi
T3_asi_reg_wr_17:
	mov	0x28, %r14
	.word 0xfef38e60  ! 242: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfe25a1da  ! 243: STW_I	stw	%r31, [%r22 + 0x01da]
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, a)
	.word 0xf225a16d  ! 251: STW_I	stw	%r25, [%r22 + 0x016d]
	.word 0xfa35214b  ! 252: STH_I	sth	%r29, [%r20 + 0x014b]
	.word 0x91946191  ! 253: WRPR_PIL_I	wrpr	%r17, 0x0191, %pil
cpu_intr_3_16:
	setx	0x1c0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b4e0c2  ! 256: STHA_I	stha	%r26, [%r19 + 0x00c2] %asi
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 15)
	.word 0xb0b5e00f  ! 262: SUBCcc_I	orncc 	%r23, 0x000f, %r24
cpu_intr_3_17:
	setx	0x1f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_18:
	mov	0x1d, %r14
	.word 0xf8f38e80  ! 264: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf6a48020  ! 266: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
T3_asi_reg_rd_13:
	mov	0x14, %r14
	.word 0xfadb89e0  ! 270: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfef4a0f8  ! 272: STXA_I	stxa	%r31, [%r18 + 0x00f8] %asi
	.word 0xf82c6105  ! 276: STB_I	stb	%r28, [%r17 + 0x0105]
	.word 0xf025a18b  ! 277: STW_I	stw	%r24, [%r22 + 0x018b]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_19:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 281: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_wr_20:
	mov	0x25, %r14
	.word 0xf6f38e80  ! 284: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_18:
	setx	0x1d033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_19:
	setx	0x1c0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2de0ee  ! 289: STB_I	stb	%r30, [%r23 + 0x00ee]
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfca5e12b  ! 293: STWA_I	stwa	%r30, [%r23 + 0x012b] %asi
	.word 0xfe74a0f8  ! 294: STX_I	stx	%r31, [%r18 + 0x00f8]
T3_asi_reg_wr_21:
	mov	0x22, %r14
	.word 0xf4f38400  ! 296: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_rd_14:
	mov	0x2f, %r14
	.word 0xf2db89e0  ! 297: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf425a10d  ! 300: STW_I	stw	%r26, [%r22 + 0x010d]
	.word 0xf82d4000  ! 301: STB_R	stb	%r28, [%r21 + %r0]
cpu_intr_3_20:
	setx	0x1e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad2109  ! 306: STBA_I	stba	%r24, [%r20 + 0x0109] %asi
T3_asi_reg_wr_22:
	mov	0x2e, %r14
	.word 0xf8f38e80  ! 307: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf22d8000  ! 311: STB_R	stb	%r25, [%r22 + %r0]
T3_asi_reg_rd_15:
	mov	0x3c8, %r14
	.word 0xf6db8400  ! 312: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_3_21:
	setx	0x1f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf07560b4  ! 314: STX_I	stx	%r24, [%r21 + 0x00b4]
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_22:
	setx	0x1c031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_23:
	setx	0x1f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_24:
	setx	0x1e012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac8020  ! 326: STBA_R	stba	%r26, [%r18 + %r0] 0x01
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, f)
	.word 0xfc350000  ! 328: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xfa2de01b  ! 329: STB_I	stb	%r29, [%r23 + 0x001b]
cpu_intr_3_25:
	setx	0x1e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_16:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 334: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_rd_17:
	mov	0x37, %r14
	.word 0xf4db8e60  ! 337: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 15)
	.word 0xf875a1bf  ! 340: STX_I	stx	%r28, [%r22 + 0x01bf]
cpu_intr_3_26:
	setx	0x1e010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac20ad  ! 346: STBA_I	stba	%r24, [%r16 + 0x00ad] %asi
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_23:
	mov	0x3c8, %r14
	.word 0xfaf384a0  ! 349: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf4748000  ! 352: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xb13db001  ! 353: SRAX_I	srax	%r22, 0x0001, %r24
	.word 0xbc2d0000  ! 355: ANDN_R	andn 	%r20, %r0, %r30
cpu_intr_3_27:
	setx	0x1d0331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_28:
	setx	0x1e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 2a)
	ta	T_CHANGE_HPRIV
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c5a  ! 370: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c5a, %hpstate
	.word 0xfcad20f0  ! 371: STBA_I	stba	%r30, [%r20 + 0x00f0] %asi
	.word 0xf874a0e4  ! 372: STX_I	stx	%r28, [%r18 + 0x00e4]
T3_asi_reg_wr_24:
	mov	0x1d, %r14
	.word 0xfcf389e0  ! 374: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 5)
	.word 0xf4240000  ! 380: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xfe24c000  ! 382: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf6a520f6  ! 388: STWA_I	stwa	%r27, [%r20 + 0x00f6] %asi
cpu_intr_3_29:
	setx	0x1e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_18:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 395: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfca5a129  ! 397: STWA_I	stwa	%r30, [%r22 + 0x0129] %asi
T3_asi_reg_rd_19:
	mov	0x26, %r14
	.word 0xf8db8e60  ! 399: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_25:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 400: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_3_30:
	setx	0x1c0326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 35)
	.word 0xfc24613a  ! 408: STW_I	stw	%r30, [%r17 + 0x013a]
	.word 0x87952066  ! 409: WRPR_TT_I	wrpr	%r20, 0x0066, %tt
	ta	T_CHANGE_TO_TL0
	.word 0xfe34a1bf  ! 411: STH_I	sth	%r31, [%r18 + 0x01bf]
	ta	T_CHANGE_TO_TL1
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_rd_20:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 417: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfaad8020  ! 418: STBA_R	stba	%r29, [%r22 + %r0] 0x01
	.word 0xfead4020  ! 419: STBA_R	stba	%r31, [%r21 + %r0] 0x01
cpu_intr_3_31:
	setx	0x1c0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe750000  ! 422: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xb9510000  ! 425: RDPR_TICK	rdpr	%tick, %r28
	.word 0x9194e02a  ! 427: WRPR_PIL_I	wrpr	%r19, 0x002a, %pil
	.word 0xb8350000  ! 430: SUBC_R	orn 	%r20, %r0, %r28
T3_asi_reg_rd_21:
	mov	0x35, %r14
	.word 0xfedb89e0  ! 435: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 8)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2b4a0a3  ! 445: STHA_I	stha	%r25, [%r18 + 0x00a3] %asi
	.word 0xf8f421b4  ! 454: STXA_I	stxa	%r28, [%r16 + 0x01b4] %asi
	.word 0xb6858000  ! 460: ADDcc_R	addcc 	%r22, %r0, %r27
	.word 0xfe2cc000  ! 463: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xf62c2003  ! 464: STB_I	stb	%r27, [%r16 + 0x0003]
	.word 0xfc75e129  ! 466: STX_I	stx	%r30, [%r23 + 0x0129]
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_22:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 471: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_26:
	mov	0x27, %r14
	.word 0xf2f38e60  ! 473: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, b)
	.word 0xb835a027  ! 481: ORN_I	orn 	%r22, 0x0027, %r28
	.word 0xb8adc000  ! 483: ANDNcc_R	andncc 	%r23, %r0, %r28
cpu_intr_3_32:
	setx	0x210322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_33:
	setx	0x22023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_23:
	mov	0x1c, %r14
	.word 0xfadb8e40  ! 490: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f90  ! 492: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f90, %hpstate
	.word 0xb6c5a0e9  ! 501: ADDCcc_I	addccc 	%r22, 0x00e9, %r27
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c88  ! 503: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c88, %hpstate
T3_asi_reg_rd_24:
	mov	0x14, %r14
	.word 0xfedb84a0  ! 508: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf2ada125  ! 509: STBA_I	stba	%r25, [%r22 + 0x0125] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_27:
	mov	0x2d, %r14
	.word 0xfef38e80  ! 512: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_rd_25:
	mov	0x22, %r14
	.word 0xfcdb8e80  ! 515: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf8a5c020  ! 517: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 6)
	.word 0xf2b421b8  ! 520: STHA_I	stha	%r25, [%r16 + 0x01b8] %asi
cpu_intr_3_34:
	setx	0x230218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_35:
	setx	0x20002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad6024  ! 523: STBA_I	stba	%r26, [%r21 + 0x0024] %asi
	.word 0xfa2de0ad  ! 525: STB_I	stb	%r29, [%r23 + 0x00ad]
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_36:
	setx	0x220316, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_26:
	mov	0x17, %r14
	.word 0xf8db8400  ! 534: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf2750000  ! 536: STX_R	stx	%r25, [%r20 + %r0]
cpu_intr_3_37:
	setx	0x230119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_38:
	setx	0x210100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bdc000  ! 546: XNORcc_R	xnorcc 	%r23, %r0, %r25
T3_asi_reg_rd_27:
	mov	0x16, %r14
	.word 0xfedb8e60  ! 547: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_28:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 551: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbe354000  ! 552: ORN_R	orn 	%r21, %r0, %r31
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xf8a421e3  ! 557: STWA_I	stwa	%r28, [%r16 + 0x01e3] %asi
	.word 0xf8f5600e  ! 558: STXA_I	stxa	%r28, [%r21 + 0x000e] %asi
T3_asi_reg_rd_28:
	mov	0xe, %r14
	.word 0xf0db89e0  ! 560: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_39:
	setx	0x21023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2da0f7  ! 565: STB_I	stb	%r30, [%r22 + 0x00f7]
cpu_intr_3_40:
	setx	0x230200, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983fda  ! 570: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fda, %hpstate
	.word 0xb7641800  ! 574: MOVcc_R	<illegal instruction>
	.word 0xbd347001  ! 576: SRLX_I	srlx	%r17, 0x0001, %r30
	.word 0xf2a5c020  ! 580: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_41:
	setx	0x210113, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_29:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 594: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_30:
	mov	0x11, %r14
	.word 0xf2db89e0  ! 595: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf6346171  ! 597: STH_I	sth	%r27, [%r17 + 0x0171]
cpu_intr_3_42:
	setx	0x230200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_43:
	setx	0x23022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275c000  ! 601: STX_R	stx	%r25, [%r23 + %r0]
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983e40  ! 603: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e40, %hpstate
	.word 0xfa740000  ! 607: STX_R	stx	%r29, [%r16 + %r0]
cpu_intr_3_44:
	setx	0x220225, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_29:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 610: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfab58020  ! 611: STHA_R	stha	%r29, [%r22 + %r0] 0x01
	.word 0xbc34e05c  ! 612: ORN_I	orn 	%r19, 0x005c, %r30
	.word 0xfe344000  ! 614: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xfc3420a7  ! 615: STH_I	sth	%r30, [%r16 + 0x00a7]
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 21)
	.word 0xfa748000  ! 620: STX_R	stx	%r29, [%r18 + %r0]
T3_asi_reg_rd_31:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 622: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_3_45:
	setx	0x210016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab54020  ! 625: STHA_R	stha	%r29, [%r21 + %r0] 0x01
T3_asi_reg_wr_30:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 626: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983c82  ! 627: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c82, %hpstate
	.word 0xf42c4000  ! 628: STB_R	stb	%r26, [%r17 + %r0]
T3_asi_reg_rd_32:
	mov	0xb, %r14
	.word 0xf0db8e40  ! 630: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_33:
	mov	0x29, %r14
	.word 0xfadb89e0  ! 632: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb2bde0f8  ! 633: XNORcc_I	xnorcc 	%r23, 0x00f8, %r25
	.word 0xf4250000  ! 634: STW_R	stw	%r26, [%r20 + %r0]
cpu_intr_3_46:
	setx	0x220005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_47:
	setx	0x22003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_31:
	mov	0x34, %r14
	.word 0xfcf38e60  ! 639: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf834c000  ! 642: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xf8a5e185  ! 646: STWA_I	stwa	%r28, [%r23 + 0x0185] %asi
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982c92  ! 652: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c92, %hpstate
T3_asi_reg_wr_32:
	mov	0x32, %r14
	.word 0xf8f38400  ! 654: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_rd_34:
	mov	0x9, %r14
	.word 0xfadb8e40  ! 665: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_33:
	mov	0x22, %r14
	.word 0xf0f38400  ! 666: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL0
	.word 0xf8f4a169  ! 668: STXA_I	stxa	%r28, [%r18 + 0x0169] %asi
cpu_intr_3_48:
	setx	0x23032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf475c000  ! 671: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xfa758000  ! 673: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xf2a48020  ! 674: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
cpu_intr_3_49:
	setx	0x23031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_34:
	mov	0x36, %r14
	.word 0xf2f38e40  ! 681: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_35:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 684: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 30)
	.word 0xfc744000  ! 687: STX_R	stx	%r30, [%r17 + %r0]
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 2d)
	.word 0xba9d8000  ! 696: XORcc_R	xorcc 	%r22, %r0, %r29
cpu_intr_3_50:
	setx	0x22011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_51:
	setx	0x210328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6740000  ! 699: STX_R	stx	%r27, [%r16 + %r0]
cpu_intr_3_52:
	setx	0x210236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 24)
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f50  ! 704: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f50, %hpstate
	.word 0xb5504000  ! 708: RDPR_TNPC	rdpr	%tnpc, %r26
T3_asi_reg_wr_36:
	mov	0x1f, %r14
	.word 0xf0f38400  ! 715: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_35:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 717: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_37:
	mov	0x12, %r14
	.word 0xfaf38e80  ! 721: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, e)
	ta	T_CHANGE_TO_TL0
	.word 0xfeb54020  ! 730: STHA_R	stha	%r31, [%r21 + %r0] 0x01
	.word 0xfcad60fc  ! 733: STBA_I	stba	%r30, [%r21 + 0x00fc] %asi
cpu_intr_3_53:
	setx	0x21030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_36:
	mov	0x7, %r14
	.word 0xfadb8400  ! 735: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfc74a1ea  ! 737: STX_I	stx	%r30, [%r18 + 0x01ea]
	ta	T_CHANGE_HPRIV
	.word 0xfcac6005  ! 739: STBA_I	stba	%r30, [%r17 + 0x0005] %asi
T3_asi_reg_rd_37:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 740: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_54:
	setx	0x22021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_55:
	setx	0x210221, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_38:
	mov	0x3c4, %r14
	.word 0xfef38400  ! 755: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_56:
	setx	0x20001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_57:
	setx	0x10e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 27)
	.word 0xf62dc000  ! 765: STB_R	stb	%r27, [%r23 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xb4846089  ! 768: ADDcc_I	addcc 	%r17, 0x0089, %r26
T3_asi_reg_wr_39:
	mov	0x3c4, %r14
	.word 0xf8f384a0  ! 770: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb095605e  ! 771: ORcc_I	orcc 	%r21, 0x005e, %r24
	.word 0xf6346114  ! 772: STH_I	sth	%r27, [%r17 + 0x0114]
cpu_intr_3_58:
	setx	0x220321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0740000  ! 775: STX_R	stx	%r24, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_38:
	mov	0x31, %r14
	.word 0xf6db8e60  ! 778: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_59:
	setx	0x23013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_39:
	mov	0x2e, %r14
	.word 0xfcdb89e0  ! 783: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T3_asi_reg_wr_40:
	mov	0x22, %r14
	.word 0xf0f38400  ! 785: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_40:
	mov	0x2d, %r14
	.word 0xfcdb8400  ! 788: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf22c6018  ! 789: STB_I	stb	%r25, [%r17 + 0x0018]
cpu_intr_3_60:
	setx	0x230030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ada140  ! 792: STBA_I	stba	%r28, [%r22 + 0x0140] %asi
cpu_intr_3_61:
	setx	0x200239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_62:
	setx	0x210213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb342001  ! 797: SRL_I	srl 	%r16, 0x0001, %r29
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, b)
	.word 0xf0340000  ! 805: STH_R	sth	%r24, [%r16 + %r0]
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982cd0  ! 807: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd0, %hpstate
	.word 0xb80d0000  ! 808: AND_R	and 	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	.word 0xf2354000  ! 811: STH_R	sth	%r25, [%r21 + %r0]
T3_asi_reg_rd_41:
	mov	0x25, %r14
	.word 0xfadb8e60  ! 812: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_63:
	setx	0x20020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b4c020  ! 818: STHA_R	stha	%r28, [%r19 + %r0] 0x01
	.word 0xb5641800  ! 821: MOVcc_R	<illegal instruction>
	.word 0xf225c000  ! 822: STW_R	stw	%r25, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf6ac0020  ! 824: STBA_R	stba	%r27, [%r16 + %r0] 0x01
	.word 0xb29de10b  ! 827: XORcc_I	xorcc 	%r23, 0x010b, %r25
cpu_intr_3_64:
	setx	0x200006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_65:
	setx	0x220039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5c020  ! 833: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
	.word 0xbe44a04f  ! 834: ADDC_I	addc 	%r18, 0x004f, %r31
T3_asi_reg_rd_42:
	mov	0x31, %r14
	.word 0xfadb8e40  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xba34c000  ! 843: ORN_R	orn 	%r19, %r0, %r29
T3_asi_reg_wr_41:
	mov	0x3c1, %r14
	.word 0xf8f38e60  ! 845: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfcade09c  ! 846: STBA_I	stba	%r30, [%r23 + 0x009c] %asi
	.word 0xfc240000  ! 847: STW_R	stw	%r30, [%r16 + %r0]
cpu_intr_3_66:
	setx	0x23010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_43:
	mov	0x8, %r14
	.word 0xf0db84a0  ! 849: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T3_asi_reg_rd_44:
	mov	0x3c5, %r14
	.word 0xf6db84a0  ! 852: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_67:
	setx	0x20031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5208b  ! 857: STHA_I	stha	%r28, [%r20 + 0x008b] %asi
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 30)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_68:
	setx	0x200025, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_45:
	mov	0x3c8, %r14
	.word 0xf0db84a0  ! 871: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T3_asi_reg_wr_42:
	mov	0x6, %r14
	.word 0xf4f38e60  ! 872: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf2a58020  ! 875: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, f)
	.word 0xf03420d3  ! 877: STH_I	sth	%r24, [%r16 + 0x00d3]
	.word 0xf2ac61e5  ! 880: STBA_I	stba	%r25, [%r17 + 0x01e5] %asi
	.word 0xb014a0fe  ! 881: OR_I	or 	%r18, 0x00fe, %r24
cpu_intr_3_69:
	setx	0x210330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_70:
	setx	0x20020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5e115  ! 885: STHA_I	stha	%r28, [%r23 + 0x0115] %asi
cpu_intr_3_71:
	setx	0x21023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a56060  ! 889: STWA_I	stwa	%r26, [%r21 + 0x0060] %asi
T3_asi_reg_wr_43:
	mov	0x1e, %r14
	.word 0xfaf38400  ! 890: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf8258000  ! 891: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xfea54020  ! 893: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_wr_44:
	mov	0x15, %r14
	.word 0xf6f38400  ! 895: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf8ad2089  ! 900: STBA_I	stba	%r28, [%r20 + 0x0089] %asi
cpu_intr_3_72:
	setx	0x260328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 1e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 39)
	.word 0xf22ce00f  ! 908: STB_I	stb	%r25, [%r19 + 0x000f]
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 10)
	.word 0xba950000  ! 914: ORcc_R	orcc 	%r20, %r0, %r29
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 23)
	.word 0xfea5c020  ! 917: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	.word 0xf874e1e1  ! 918: STX_I	stx	%r28, [%r19 + 0x01e1]
	.word 0xb0354000  ! 920: SUBC_R	orn 	%r21, %r0, %r24
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 31)
	.word 0xfa2de0ea  ! 925: STB_I	stb	%r29, [%r23 + 0x00ea]
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_rd_46:
	mov	0x32, %r14
	.word 0xfcdb89e0  ! 931: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_73:
	setx	0x25023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 1a)
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983c8a  ! 937: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c8a, %hpstate
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfc250000  ! 943: STW_R	stw	%r30, [%r20 + %r0]
T3_asi_reg_wr_45:
	mov	0x37, %r14
	.word 0xfef384a0  ! 944: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb37d2401  ! 945: MOVR_I	movre	%r20, 0x1, %r25
	ta	T_CHANGE_TO_TL0
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfa2dc000  ! 948: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xfcad212b  ! 950: STBA_I	stba	%r30, [%r20 + 0x012b] %asi
	.word 0xf62ca068  ! 956: STB_I	stb	%r27, [%r18 + 0x0068]
cpu_intr_3_74:
	setx	0x260234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad0020  ! 958: STBA_R	stba	%r24, [%r20 + %r0] 0x01
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_75:
	setx	0x25032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ade164  ! 963: STBA_I	stba	%r25, [%r23 + 0x0164] %asi
	.word 0xf074600c  ! 964: STX_I	stx	%r24, [%r17 + 0x000c]
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 22)
	ta	T_CHANGE_TO_TL0
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfe248000  ! 969: STW_R	stw	%r31, [%r18 + %r0]
cpu_intr_3_76:
	setx	0x25013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_46:
	mov	0x3c6, %r14
	.word 0xf0f38e60  ! 973: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_wr_47:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 975: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_wr_48:
	mov	0x16, %r14
	.word 0xfef384a0  ! 976: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_3_77:
	setx	0x240218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434602d  ! 985: STH_I	sth	%r26, [%r17 + 0x002d]
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983e88  ! 988: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e88, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xbe846156  ! 990: ADDcc_I	addcc 	%r17, 0x0156, %r31
T3_asi_reg_rd_47:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 992: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_78:
	setx	0x270119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c0000  ! 994: STB_R	stb	%r24, [%r16 + %r0]
cpu_intr_3_79:
	setx	0x260105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc74c000  ! 996: STX_R	stx	%r30, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xb7355000  ! 998: SRLX_R	srlx	%r21, %r0, %r27
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 2c)
	.word 0xbc040000  ! 1001: ADD_R	add 	%r16, %r0, %r30
cpu_intr_3_80:
	setx	0x250138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba05a1cd  ! 1005: ADD_I	add 	%r22, 0x01cd, %r29
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfc754000  ! 1011: STX_R	stx	%r30, [%r21 + %r0]
cpu_intr_3_81:
	setx	0x26021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f520f5  ! 1013: STXA_I	stxa	%r25, [%r20 + 0x00f5] %asi
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfaaca0e8  ! 1016: STBA_I	stba	%r29, [%r18 + 0x00e8] %asi
	.word 0xf0a4e122  ! 1017: STWA_I	stwa	%r24, [%r19 + 0x0122] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xfead4020  ! 1020: STBA_R	stba	%r31, [%r21 + %r0] 0x01
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 27)
	.word 0xf675c000  ! 1029: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xbb7d4400  ! 1030: MOVR_R	movre	%r21, %r0, %r29
cpu_intr_3_82:
	setx	0x25023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca48020  ! 1034: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfcb4c020  ! 1041: STHA_R	stha	%r30, [%r19 + %r0] 0x01
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 25)
	.word 0xfe35e187  ! 1047: STH_I	sth	%r31, [%r23 + 0x0187]
cpu_intr_3_83:
	setx	0x26010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_48:
	mov	0x10, %r14
	.word 0xf8db84a0  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_3_84:
	setx	0x250001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5a1bf  ! 1054: STWA_I	stwa	%r29, [%r22 + 0x01bf] %asi
T3_asi_reg_wr_49:
	mov	0x37, %r14
	.word 0xf8f38400  ! 1057: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 8)
	.word 0xf075c000  ! 1062: STX_R	stx	%r24, [%r23 + %r0]
T3_asi_reg_rd_49:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 1063: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9643801  ! 1065: MOVcc_I	<illegal instruction>
T3_asi_reg_wr_50:
	mov	0x28, %r14
	.word 0xfcf389e0  ! 1067: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf424c000  ! 1068: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf6a46113  ! 1069: STWA_I	stwa	%r27, [%r17 + 0x0113] %asi
	.word 0xfcac211f  ! 1072: STBA_I	stba	%r30, [%r16 + 0x011f] %asi
cpu_intr_3_85:
	setx	0x270234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 21)
	ta	T_CHANGE_TO_TL0
	.word 0xb2356103  ! 1081: SUBC_I	orn 	%r21, 0x0103, %r25
	.word 0xf424c000  ! 1082: STW_R	stw	%r26, [%r19 + %r0]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_51:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 1087: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb12c7001  ! 1088: SLLX_I	sllx	%r17, 0x0001, %r24
cpu_intr_3_86:
	setx	0x26032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_87:
	setx	0x250308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a40020  ! 1096: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_88:
	setx	0x260139, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_52:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 1107: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb73c2001  ! 1108: SRA_I	sra 	%r16, 0x0001, %r27
cpu_intr_3_89:
	setx	0x250106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb884a04f  ! 1112: ADDcc_I	addcc 	%r18, 0x004f, %r28
	.word 0xf02ce1da  ! 1113: STB_I	stb	%r24, [%r19 + 0x01da]
T3_asi_reg_wr_53:
	mov	0x7, %r14
	.word 0xf2f384a0  ! 1115: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_rd_50:
	mov	0x11, %r14
	.word 0xf4db89e0  ! 1118: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_90:
	setx	0x24003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_54:
	mov	0x19, %r14
	.word 0xf8f389e0  ! 1124: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf6f4a072  ! 1128: STXA_I	stxa	%r27, [%r18 + 0x0072] %asi
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 21)
	.word 0xfaace0b9  ! 1130: STBA_I	stba	%r29, [%r19 + 0x00b9] %asi
T3_asi_reg_rd_51:
	mov	0x0, %r14
	.word 0xfadb8e60  ! 1135: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf4346178  ! 1137: STH_I	sth	%r26, [%r17 + 0x0178]
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 10)
	.word 0xb9540000  ! 1140: RDPR_GL	rdpr	%-, %r28
	.word 0xf0b54020  ! 1142: STHA_R	stha	%r24, [%r21 + %r0] 0x01
	.word 0xf8248000  ! 1144: STW_R	stw	%r28, [%r18 + %r0]
T3_asi_reg_wr_55:
	mov	0x3c5, %r14
	.word 0xf4f38400  ! 1150: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfc250000  ! 1151: STW_R	stw	%r30, [%r20 + %r0]
T3_asi_reg_rd_52:
	mov	0xb, %r14
	.word 0xfedb8e80  ! 1152: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_wr_56:
	mov	0x2f, %r14
	.word 0xf6f389e0  ! 1155: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf0a4e170  ! 1157: STWA_I	stwa	%r24, [%r19 + 0x0170] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xf07460af  ! 1160: STX_I	stx	%r24, [%r17 + 0x00af]
	.word 0xfaa54020  ! 1162: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	.word 0xf6a4e019  ! 1163: STWA_I	stwa	%r27, [%r19 + 0x0019] %asi
T3_asi_reg_rd_53:
	mov	0x2f, %r14
	.word 0xf0db84a0  ! 1168: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_3_91:
	setx	0x250038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5c020  ! 1170: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
T3_asi_reg_wr_57:
	mov	0x3c7, %r14
	.word 0xf8f38400  ! 1172: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_92:
	setx	0x240031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_rd_54:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 1178: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf4358000  ! 1180: STH_R	sth	%r26, [%r22 + %r0]
T3_asi_reg_rd_55:
	mov	0x32, %r14
	.word 0xf6db8400  ! 1181: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_TO_TL0
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982e10  ! 1184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e10, %hpstate
cpu_intr_3_93:
	setx	0x250210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b44020  ! 1188: STHA_R	stha	%r28, [%r17 + %r0] 0x01
	.word 0xf0748000  ! 1189: STX_R	stx	%r24, [%r18 + %r0]
cpu_intr_3_94:
	setx	0x240201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe152132  ! 1191: OR_I	or 	%r20, 0x0132, %r31
cpu_intr_3_95:
	setx	0x270220, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_58:
	mov	0x14, %r14
	.word 0xf0f38e80  ! 1193: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_96:
	setx	0x250136, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_59:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 1195: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 27)
	.word 0xf4258000  ! 1200: STW_R	stw	%r26, [%r22 + %r0]
cpu_intr_3_97:
	setx	0x240122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb510000  ! 1205: RDPR_TICK	rdpr	%tick, %r29
	.word 0xb215a07b  ! 1212: OR_I	or 	%r22, 0x007b, %r25
	.word 0xfc248000  ! 1216: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf22c4000  ! 1219: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xfe354000  ! 1221: STH_R	sth	%r31, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xb6ac0000  ! 1226: ANDNcc_R	andncc 	%r16, %r0, %r27
	.word 0xfa7561c5  ! 1228: STX_I	stx	%r29, [%r21 + 0x01c5]
T3_asi_reg_rd_56:
	mov	0x3c0, %r14
	.word 0xf0db89e0  ! 1229: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
	.word 0xf0340000  ! 1234: STH_R	sth	%r24, [%r16 + %r0]
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982982  ! 1235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0982, %hpstate
	.word 0xf2a54020  ! 1241: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xf42d0000  ! 1244: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xbc85c000  ! 1245: ADDcc_R	addcc 	%r23, %r0, %r30
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 5)
	.word 0xf435a1d7  ! 1247: STH_I	sth	%r26, [%r22 + 0x01d7]
	.word 0xb3520000  ! 1248: RDPR_PIL	rdpr	%pil, %r25
	.word 0xb4ad4000  ! 1249: ANDNcc_R	andncc 	%r21, %r0, %r26
	.word 0xf82c0000  ! 1251: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xf62d4000  ! 1252: STB_R	stb	%r27, [%r21 + %r0]
cpu_intr_3_98:
	setx	0x240127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b5a114  ! 1254: STHA_I	stha	%r24, [%r22 + 0x0114] %asi
	.word 0xb13cd000  ! 1255: SRAX_R	srax	%r19, %r0, %r24
	.word 0xf4740000  ! 1257: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xf02de0a1  ! 1258: STB_I	stb	%r24, [%r23 + 0x00a1]
T3_asi_reg_rd_57:
	mov	0x28, %r14
	.word 0xfedb89e0  ! 1259: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, a)
	.word 0xf835a121  ! 1263: STH_I	sth	%r28, [%r22 + 0x0121]
	.word 0xfea42199  ! 1265: STWA_I	stwa	%r31, [%r16 + 0x0199] %asi
cpu_intr_3_99:
	setx	0x240215, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_60:
	mov	0x6, %r14
	.word 0xf8f384a0  ! 1274: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfa254000  ! 1275: STW_R	stw	%r29, [%r21 + %r0]
cpu_intr_3_100:
	setx	0x24010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_58:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 1280: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf8aca15a  ! 1282: STBA_I	stba	%r28, [%r18 + 0x015a] %asi
T3_asi_reg_rd_59:
	mov	0x3c8, %r14
	.word 0xf8db89e0  ! 1283: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfe25a060  ! 1285: STW_I	stw	%r31, [%r22 + 0x0060]
	.word 0xb005e002  ! 1286: ADD_I	add 	%r23, 0x0002, %r24
cpu_intr_3_101:
	setx	0x250315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a58020  ! 1291: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
	.word 0xf234e017  ! 1294: STH_I	sth	%r25, [%r19 + 0x0017]
	.word 0xf2b4c020  ! 1296: STHA_R	stha	%r25, [%r19 + %r0] 0x01
T3_asi_reg_rd_60:
	mov	0x31, %r14
	.word 0xfadb8400  ! 1300: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_61:
	mov	0x29, %r14
	.word 0xf6db89e0  ! 1303: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xfa746059  ! 1304: STX_I	stx	%r29, [%r17 + 0x0059]
	.word 0xf6aca090  ! 1305: STBA_I	stba	%r27, [%r18 + 0x0090] %asi
	.word 0xfa34e143  ! 1308: STH_I	sth	%r29, [%r19 + 0x0143]
	.word 0xf2248000  ! 1309: STW_R	stw	%r25, [%r18 + %r0]
T3_asi_reg_wr_61:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 1311: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfa350000  ! 1312: STH_R	sth	%r29, [%r20 + %r0]
cpu_intr_3_102:
	setx	0x250225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_103:
	setx	0x260217, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_62:
	mov	0x27, %r14
	.word 0xfcdb8e40  ! 1320: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf0a50020  ! 1324: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
	.word 0xf8a40020  ! 1331: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
cpu_intr_3_104:
	setx	0x26030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf624c000  ! 1333: STW_R	stw	%r27, [%r19 + %r0]
T3_asi_reg_wr_62:
	mov	0x37, %r14
	.word 0xfaf38e60  ! 1334: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfa740000  ! 1338: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xf8258000  ! 1339: STW_R	stw	%r28, [%r22 + %r0]
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 25)
	.word 0xfcb48020  ! 1341: STHA_R	stha	%r30, [%r18 + %r0] 0x01
	.word 0xf0248000  ! 1343: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xf2a48020  ! 1344: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
	.word 0xf43521d2  ! 1351: STH_I	sth	%r26, [%r20 + 0x01d2]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_105:
	setx	0x25013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f5e03c  ! 1355: STXA_I	stxa	%r24, [%r23 + 0x003c] %asi
cpu_intr_3_106:
	setx	0x27001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca4e17f  ! 1358: STWA_I	stwa	%r30, [%r19 + 0x017f] %asi
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 32)
	.word 0xfaa44020  ! 1361: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	.word 0xfaadc020  ! 1363: STBA_R	stba	%r29, [%r23 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_63:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 1368: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_63:
	mov	0x3c1, %r14
	.word 0xfaf38e60  ! 1371: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf0b46177  ! 1372: STHA_I	stha	%r24, [%r17 + 0x0177] %asi
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf0754000  ! 1380: STX_R	stx	%r24, [%r21 + %r0]
cpu_intr_3_107:
	setx	0x2b0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2254000  ! 1382: STW_R	stw	%r25, [%r21 + %r0]
cpu_intr_3_108:
	setx	0x28000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab44000  ! 1384: ORNcc_R	orncc 	%r17, %r0, %r29
T3_asi_reg_wr_64:
	mov	0xf, %r14
	.word 0xf0f389e0  ! 1385: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_rd_64:
	mov	0x28, %r14
	.word 0xf2db8e80  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb13c0000  ! 1387: SRA_R	sra 	%r16, %r0, %r24
	.word 0xf4ad8020  ! 1393: STBA_R	stba	%r26, [%r22 + %r0] 0x01
cpu_intr_3_109:
	setx	0x2b031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a521c1  ! 1396: STWA_I	stwa	%r27, [%r20 + 0x01c1] %asi
cpu_intr_3_110:
	setx	0x2b012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_65:
	mov	0x10, %r14
	.word 0xf6db8e40  ! 1400: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_65:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 1401: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 28)
	.word 0xb1341000  ! 1408: SRLX_R	srlx	%r16, %r0, %r24
T3_asi_reg_rd_66:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 1409: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, a)
	.word 0xf2b420fa  ! 1413: STHA_I	stha	%r25, [%r16 + 0x00fa] %asi
	.word 0xf8258000  ! 1414: STW_R	stw	%r28, [%r22 + %r0]
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 15)
	.word 0xf2b5c020  ! 1416: STHA_R	stha	%r25, [%r23 + %r0] 0x01
	.word 0xf4f4612b  ! 1418: STXA_I	stxa	%r26, [%r17 + 0x012b] %asi
T3_asi_reg_rd_67:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 1421: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_3_111:
	setx	0x290218, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_66:
	mov	0x18, %r14
	.word 0xf0f38e40  ! 1424: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_67:
	mov	0x24, %r14
	.word 0xfaf38e60  ! 1426: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf8a58020  ! 1428: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
cpu_intr_3_112:
	setx	0x280011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4754000  ! 1432: STX_R	stx	%r26, [%r21 + %r0]
cpu_intr_3_113:
	setx	0x290035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_68:
	mov	0x13, %r14
	.word 0xf2db84a0  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb334b001  ! 1440: SRLX_I	srlx	%r18, 0x0001, %r25
cpu_intr_3_114:
	setx	0x280311, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_69:
	mov	0x2a, %r14
	.word 0xfedb8e40  ! 1442: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfcb42063  ! 1444: STHA_I	stha	%r30, [%r16 + 0x0063] %asi
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_70:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 1448: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_115:
	setx	0x2b0312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_116:
	setx	0x280231, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb004616e  ! 1462: ADD_I	add 	%r17, 0x016e, %r24
cpu_intr_3_117:
	setx	0x280111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6aca0b4  ! 1466: STBA_I	stba	%r27, [%r18 + 0x00b4] %asi
	.word 0xf0b420f5  ! 1468: STHA_I	stha	%r24, [%r16 + 0x00f5] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5344000  ! 1472: SRL_R	srl 	%r17, %r0, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf4b54020  ! 1474: STHA_R	stha	%r26, [%r21 + %r0] 0x01
T3_asi_reg_wr_68:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 1476: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_wr_69:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 1478: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_wr_70:
	mov	0x30, %r14
	.word 0xfef389e0  ! 1480: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 3e)
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b4a  ! 1482: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b4a, %hpstate
cpu_intr_3_118:
	setx	0x29022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea50020  ! 1484: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 25)
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f00  ! 1486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f00, %hpstate
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 30)
	.word 0xf8b54020  ! 1490: STHA_R	stha	%r28, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
cpu_intr_3_119:
	setx	0x2a0126, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_71:
	mov	0xb, %r14
	.word 0xfef384a0  ! 1496: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbf643801  ! 1505: MOVcc_I	<illegal instruction>
T3_asi_reg_rd_71:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 1506: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_3_120:
	setx	0x280133, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_72:
	mov	0x2e, %r14
	.word 0xfcdb8e40  ! 1508: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf2250000  ! 1509: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xf8f5e148  ! 1510: STXA_I	stxa	%r28, [%r23 + 0x0148] %asi
T3_asi_reg_wr_72:
	mov	0x37, %r14
	.word 0xf2f38e60  ! 1511: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_rd_73:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 1513: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf2b5e1c2  ! 1515: STHA_I	stha	%r25, [%r23 + 0x01c2] %asi
cpu_intr_3_121:
	setx	0x280008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_122:
	setx	0x280231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34c000  ! 1528: STH_R	sth	%r30, [%r19 + %r0]
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_73:
	mov	0x24, %r14
	.word 0xf0f38400  ! 1533: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0258000  ! 1538: STW_R	stw	%r24, [%r22 + %r0]
cpu_intr_3_123:
	setx	0x2b0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_74:
	mov	0x32, %r14
	.word 0xf4f38e40  ! 1541: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_124:
	setx	0x2a021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b4a08f  ! 1544: STHA_I	stha	%r26, [%r18 + 0x008f] %asi
	.word 0xfeb56160  ! 1545: STHA_I	stha	%r31, [%r21 + 0x0160] %asi
	.word 0xf4a5a04f  ! 1547: STWA_I	stwa	%r26, [%r22 + 0x004f] %asi
	.word 0xf0b40020  ! 1548: STHA_R	stha	%r24, [%r16 + %r0] 0x01
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_75:
	mov	0x2b, %r14
	.word 0xf2f38e80  ! 1551: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 32)
	.word 0xf42d8000  ! 1556: STB_R	stb	%r26, [%r22 + %r0]
cpu_intr_3_125:
	setx	0x29012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_126:
	setx	0x28002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b58020  ! 1561: STHA_R	stha	%r24, [%r22 + %r0] 0x01
cpu_intr_3_127:
	setx	0x2a0200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_128:
	setx	0x28022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf4a5e096  ! 1569: STWA_I	stwa	%r26, [%r23 + 0x0096] %asi
	.word 0xfe2c4000  ! 1570: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xb2454000  ! 1571: ADDC_R	addc 	%r21, %r0, %r25
	.word 0xf4ad2196  ! 1572: STBA_I	stba	%r26, [%r20 + 0x0196] %asi
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_76:
	mov	0x1, %r14
	.word 0xf8f384a0  ! 1582: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_129:
	setx	0x290001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_130:
	setx	0x280201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42c0000  ! 1587: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xf62cc000  ! 1589: STB_R	stb	%r27, [%r19 + %r0]
T3_asi_reg_rd_74:
	mov	0x2e, %r14
	.word 0xfcdb8e40  ! 1590: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_131:
	setx	0x2a000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_132:
	setx	0x2a0114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_133:
	setx	0x2b0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5e1b6  ! 1596: STHA_I	stha	%r25, [%r23 + 0x01b6] %asi
T3_asi_reg_wr_77:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 1597: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9540000  ! 1598: RDPR_GL	rdpr	%-, %r28
	.word 0xb7347001  ! 1602: SRLX_I	srlx	%r17, 0x0001, %r27
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 13)
	.word 0xb02c8000  ! 1604: ANDN_R	andn 	%r18, %r0, %r24
	.word 0xb29460d9  ! 1605: ORcc_I	orcc 	%r17, 0x00d9, %r25
	.word 0xfab5a036  ! 1607: STHA_I	stha	%r29, [%r22 + 0x0036] %asi
	.word 0xf6744000  ! 1608: STX_R	stx	%r27, [%r17 + %r0]
cpu_intr_3_134:
	setx	0x28020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c5211a  ! 1611: ADDCcc_I	addccc 	%r20, 0x011a, %r25
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_wr_78:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 1613: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 13)
	.word 0xfea40020  ! 1615: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
T3_asi_reg_wr_79:
	mov	0x2c, %r14
	.word 0xfef384a0  ! 1617: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xa1902002  ! 1618: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xf22c4000  ! 1623: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xb6bce061  ! 1625: XNORcc_I	xnorcc 	%r19, 0x0061, %r27
	.word 0xf0b560e0  ! 1626: STHA_I	stha	%r24, [%r21 + 0x00e0] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfcb56044  ! 1628: STHA_I	stha	%r30, [%r21 + 0x0044] %asi
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_135:
	setx	0x29031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 6)
	.word 0xfa244000  ! 1633: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xbc9de0df  ! 1634: XORcc_I	xorcc 	%r23, 0x00df, %r30
T3_asi_reg_wr_80:
	mov	0x36, %r14
	.word 0xfcf38e80  ! 1635: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf6a58020  ! 1638: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xb2048000  ! 1639: ADD_R	add 	%r18, %r0, %r25
T3_asi_reg_wr_81:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 1640: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_rd_75:
	mov	0x3c4, %r14
	.word 0xfcdb89e0  ! 1642: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf8a4e034  ! 1644: STWA_I	stwa	%r28, [%r19 + 0x0034] %asi
	.word 0xfeace130  ! 1647: STBA_I	stba	%r31, [%r19 + 0x0130] %asi
	.word 0xfcf5a11d  ! 1648: STXA_I	stxa	%r30, [%r22 + 0x011d] %asi
cpu_intr_3_136:
	setx	0x29031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d8000  ! 1651: STB_R	stb	%r26, [%r22 + %r0]
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, d)
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 3)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_137:
	setx	0x2b0109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_138:
	setx	0x280101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb684a0bf  ! 1669: ADDcc_I	addcc 	%r18, 0x00bf, %r27
	.word 0xf0258000  ! 1674: STW_R	stw	%r24, [%r22 + %r0]
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_139:
	setx	0x2b033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6754000  ! 1678: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xfe354000  ! 1679: STH_R	sth	%r31, [%r21 + %r0]
T3_asi_reg_wr_82:
	mov	0x5, %r14
	.word 0xf8f384a0  ! 1680: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfef460b0  ! 1682: STXA_I	stxa	%r31, [%r17 + 0x00b0] %asi
	.word 0xfca420f4  ! 1684: STWA_I	stwa	%r30, [%r16 + 0x00f4] %asi
T3_asi_reg_rd_76:
	mov	0x19, %r14
	.word 0xf8db8e40  ! 1685: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbc458000  ! 1687: ADDC_R	addc 	%r22, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_140:
	setx	0x2b022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_77:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 1692: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_141:
	setx	0x29020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_83:
	mov	0x2e, %r14
	.word 0xfaf38e60  ! 1694: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf0f5e003  ! 1695: STXA_I	stxa	%r24, [%r23 + 0x0003] %asi
	.word 0xfa34a173  ! 1696: STH_I	sth	%r29, [%r18 + 0x0173]
	ta	T_CHANGE_HPRIV
	.word 0xfa35a09a  ! 1699: STH_I	sth	%r29, [%r22 + 0x009a]
	.word 0xfc7460b4  ! 1701: STX_I	stx	%r30, [%r17 + 0x00b4]
	.word 0xb2b5c000  ! 1702: ORNcc_R	orncc 	%r23, %r0, %r25
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819839ca  ! 1703: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19ca, %hpstate
	.word 0xbc8dc000  ! 1704: ANDcc_R	andcc 	%r23, %r0, %r30
	.word 0xfef4a18b  ! 1705: STXA_I	stxa	%r31, [%r18 + 0x018b] %asi
	.word 0xf6ac8020  ! 1706: STBA_R	stba	%r27, [%r18 + %r0] 0x01
T3_asi_reg_wr_84:
	mov	0xf, %r14
	.word 0xfaf384a0  ! 1707: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_78:
	mov	0x21, %r14
	.word 0xfadb8e60  ! 1710: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf8f4e064  ! 1714: STXA_I	stxa	%r28, [%r19 + 0x0064] %asi
	.word 0xf0b42134  ! 1715: STHA_I	stha	%r24, [%r16 + 0x0134] %asi
	.word 0xfe2da076  ! 1716: STB_I	stb	%r31, [%r22 + 0x0076]
cpu_intr_3_142:
	setx	0x28030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf42d4000  ! 1723: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xb77d6401  ! 1725: MOVR_I	movre	%r21, 0x1, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xf0240000  ! 1730: STW_R	stw	%r24, [%r16 + %r0]
T3_asi_reg_rd_79:
	mov	0x35, %r14
	.word 0xf4db84a0  ! 1732: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_rd_80:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 1733: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1510000  ! 1740: RDPR_TICK	rdpr	%tick, %r24
	.word 0xb150c000  ! 1741: RDPR_TT	<illegal instruction>
cpu_intr_3_143:
	setx	0x29010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_85:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 1743: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_wr_86:
	mov	0x3c8, %r14
	.word 0xf6f38e80  ! 1745: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbc2c217d  ! 1747: ANDN_I	andn 	%r16, 0x017d, %r30
	.word 0xf6744000  ! 1749: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xfa34a077  ! 1750: STH_I	sth	%r29, [%r18 + 0x0077]
	ta	T_CHANGE_HPRIV
	.word 0xfe74e16e  ! 1756: STX_I	stx	%r31, [%r19 + 0x016e]
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 9)
	.word 0xf0a58020  ! 1759: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
T3_asi_reg_wr_87:
	mov	0x15, %r14
	.word 0xfcf38e40  ! 1760: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_144:
	setx	0x28002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad600b  ! 1763: STBA_I	stba	%r24, [%r21 + 0x000b] %asi
cpu_intr_3_145:
	setx	0x2b0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead4020  ! 1765: STBA_R	stba	%r31, [%r21 + %r0] 0x01
	.word 0xf23560a6  ! 1767: STH_I	sth	%r25, [%r21 + 0x00a6]
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982b92  ! 1770: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b92, %hpstate
	.word 0xbe24e182  ! 1771: SUB_I	sub 	%r19, 0x0182, %r31
T3_asi_reg_wr_88:
	mov	0x1c, %r14
	.word 0xfcf389e0  ! 1772: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf824c000  ! 1775: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xb1346001  ! 1777: SRL_I	srl 	%r17, 0x0001, %r24
cpu_intr_3_146:
	setx	0x2a022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_rd_81:
	mov	0x21, %r14
	.word 0xf4db8400  ! 1780: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfe248000  ! 1781: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xf0a5e191  ! 1782: STWA_I	stwa	%r24, [%r23 + 0x0191] %asi
cpu_intr_3_147:
	setx	0x2a023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17c8400  ! 1784: MOVR_R	movre	%r18, %r0, %r24
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 10)
	.word 0xfeb5e050  ! 1789: STHA_I	stha	%r31, [%r23 + 0x0050] %asi
	.word 0xfaa52033  ! 1790: STWA_I	stwa	%r29, [%r20 + 0x0033] %asi
	.word 0xf074e10a  ! 1793: STX_I	stx	%r24, [%r19 + 0x010a]
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_82:
	mov	0x1b, %r14
	.word 0xf0db8e60  ! 1797: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 34)
	.word 0xf4244000  ! 1802: STW_R	stw	%r26, [%r17 + %r0]
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 11)
	.word 0xf0242040  ! 1805: STW_I	stw	%r24, [%r16 + 0x0040]
	.word 0xf6b48020  ! 1806: STHA_R	stha	%r27, [%r18 + %r0] 0x01
cpu_intr_3_148:
	setx	0x29012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5a082  ! 1809: STWA_I	stwa	%r28, [%r22 + 0x0082] %asi
	.word 0xf02d2011  ! 1810: STB_I	stb	%r24, [%r20 + 0x0011]
cpu_intr_3_149:
	setx	0x2b0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983b82  ! 1813: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b82, %hpstate
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf4b5613c  ! 1817: STHA_I	stha	%r26, [%r21 + 0x013c] %asi
T3_asi_reg_rd_83:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 1820: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_wr_89:
	mov	0x34, %r14
	.word 0xf0f384a0  ! 1822: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfc2d60a5  ! 1829: STB_I	stb	%r30, [%r21 + 0x00a5]
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 22)
	.word 0xf434c000  ! 1832: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xf8242078  ! 1834: STW_I	stw	%r28, [%r16 + 0x0078]
T3_asi_reg_rd_84:
	mov	0x37, %r14
	.word 0xf8db8e80  ! 1835: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf2f46142  ! 1842: STXA_I	stxa	%r25, [%r17 + 0x0142] %asi
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982bd0  ! 1846: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd0, %hpstate
T3_asi_reg_wr_90:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 1849: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_150:
	setx	0x2d0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb60c219a  ! 1853: AND_I	and 	%r16, 0x019a, %r27
	.word 0xfeb5a17c  ! 1856: STHA_I	stha	%r31, [%r22 + 0x017c] %asi
	.word 0xb6b50000  ! 1857: SUBCcc_R	orncc 	%r20, %r0, %r27
	.word 0xf0252037  ! 1858: STW_I	stw	%r24, [%r20 + 0x0037]
	.word 0xf2b40020  ! 1861: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	.word 0xbe8521e4  ! 1863: ADDcc_I	addcc 	%r20, 0x01e4, %r31
	.word 0xf4a58020  ! 1866: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
	.word 0xf674e053  ! 1867: STX_I	stx	%r27, [%r19 + 0x0053]
	.word 0xf4a5a153  ! 1868: STWA_I	stwa	%r26, [%r22 + 0x0153] %asi
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_151:
	setx	0x2f0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9c4000  ! 1875: XORcc_R	xorcc 	%r17, %r0, %r30
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_wr_91:
	mov	0x3c8, %r14
	.word 0xf8f38e80  ! 1877: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_rd_85:
	mov	0x2b, %r14
	.word 0xf8db8400  ! 1880: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfeb421c8  ! 1883: STHA_I	stha	%r31, [%r16 + 0x01c8] %asi
	.word 0xb62cc000  ! 1884: ANDN_R	andn 	%r19, %r0, %r27
	.word 0xb83561c8  ! 1885: ORN_I	orn 	%r21, 0x01c8, %r28
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 10)
	.word 0xf0b4e0cd  ! 1890: STHA_I	stha	%r24, [%r19 + 0x00cd] %asi
T3_asi_reg_rd_86:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf874a07d  ! 1894: STX_I	stx	%r28, [%r18 + 0x007d]
	.word 0xb33d2001  ! 1896: SRA_I	sra 	%r20, 0x0001, %r25
	.word 0xf22da0ec  ! 1898: STB_I	stb	%r25, [%r22 + 0x00ec]
	.word 0xf2ac0020  ! 1899: STBA_R	stba	%r25, [%r16 + %r0] 0x01
	.word 0xb40c21d0  ! 1900: AND_I	and 	%r16, 0x01d0, %r26
	ta	T_CHANGE_HPRIV
	.word 0xfead8020  ! 1902: STBA_R	stba	%r31, [%r22 + %r0] 0x01
cpu_intr_3_152:
	setx	0x2d0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8740000  ! 1905: STX_R	stx	%r28, [%r16 + %r0]
T3_asi_reg_rd_87:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 1906: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_92:
	mov	0x18, %r14
	.word 0xf8f384a0  ! 1907: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_rd_88:
	mov	0x29, %r14
	.word 0xf8db89e0  ! 1909: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_wr_93:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 1910: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf6258000  ! 1913: STW_R	stw	%r27, [%r22 + %r0]
cpu_intr_3_153:
	setx	0x2f013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f5a114  ! 1916: STXA_I	stxa	%r24, [%r22 + 0x0114] %asi
	.word 0xb68da12b  ! 1917: ANDcc_I	andcc 	%r22, 0x012b, %r27
cpu_intr_3_154:
	setx	0x2c0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b54020  ! 1921: STHA_R	stha	%r27, [%r21 + %r0] 0x01
T3_asi_reg_wr_94:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 1923: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_155:
	setx	0x2e0202, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_95:
	mov	0x33, %r14
	.word 0xf4f38e80  ! 1926: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 3b)
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c80  ! 1932: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c80, %hpstate
cpu_intr_3_156:
	setx	0x2f0007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 16)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_157:
	setx	0x2e030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b48020  ! 1937: STHA_R	stha	%r28, [%r18 + %r0] 0x01
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, b)
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_89:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 1942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb40c0000  ! 1947: AND_R	and 	%r16, %r0, %r26
cpu_intr_3_158:
	setx	0x2c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_159:
	setx	0x2e001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24c000  ! 1950: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xfc25e149  ! 1951: STW_I	stw	%r30, [%r23 + 0x0149]
	.word 0xf825e163  ! 1953: STW_I	stw	%r28, [%r23 + 0x0163]
	.word 0xfa7460ce  ! 1954: STX_I	stx	%r29, [%r17 + 0x00ce]
	.word 0xfa25a143  ! 1957: STW_I	stw	%r29, [%r22 + 0x0143]
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 12)
	.word 0xf2a521f3  ! 1962: STWA_I	stwa	%r25, [%r20 + 0x01f3] %asi
	.word 0xf0340000  ! 1963: STH_R	sth	%r24, [%r16 + %r0]
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 4)
	.word 0xf8adc020  ! 1965: STBA_R	stba	%r28, [%r23 + %r0] 0x01
	.word 0xf2ac8020  ! 1967: STBA_R	stba	%r25, [%r18 + %r0] 0x01
T3_asi_reg_wr_96:
	mov	0x29, %r14
	.word 0xf6f384a0  ! 1972: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0x8395a14a  ! 1973: WRPR_TNPC_I	wrpr	%r22, 0x014a, %tnpc
	.word 0xbb2df001  ! 1977: SLLX_I	sllx	%r23, 0x0001, %r29
	.word 0xb024a0d4  ! 1981: SUB_I	sub 	%r18, 0x00d4, %r24
	.word 0xf6acc020  ! 1985: STBA_R	stba	%r27, [%r19 + %r0] 0x01
	.word 0xfca58020  ! 1987: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
T3_asi_reg_rd_90:
	mov	0xa, %r14
	.word 0xf2db84a0  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_wr_97:
	mov	0x15, %r14
	.word 0xf4f38e60  ! 1992: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_160:
	setx	0x2e000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb50020  ! 1995: STHA_R	stha	%r31, [%r20 + %r0] 0x01
T3_asi_reg_rd_91:
	mov	0x25, %r14
	.word 0xf0db8400  ! 1996: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_rd_92:
	mov	0x4, %r14
	.word 0xf8db8400  ! 1998: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb57d4400  ! 1999: MOVR_R	movre	%r21, %r0, %r26
cpu_intr_3_161:
	setx	0x2f031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3d4000  ! 2004: XNOR_R	xnor 	%r21, %r0, %r30
T3_asi_reg_wr_98:
	mov	0x28, %r14
	.word 0xfaf38e40  ! 2006: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfaade13d  ! 2008: STBA_I	stba	%r29, [%r23 + 0x013d] %asi
cpu_intr_3_162:
	setx	0x2f0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982840  ! 2010: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0840, %hpstate
T3_asi_reg_wr_99:
	mov	0x14, %r14
	.word 0xf8f384a0  ! 2011: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_163:
	setx	0x2e0224, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_100:
	mov	0x2f, %r14
	.word 0xf2f38e40  ! 2018: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfa344000  ! 2019: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xb0b4e047  ! 2024: SUBCcc_I	orncc 	%r19, 0x0047, %r24
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfc3521af  ! 2028: STH_I	sth	%r30, [%r20 + 0x01af]
cpu_intr_3_164:
	setx	0x2e0303, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_93:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 2031: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_165:
	setx	0x2e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d6102  ! 2039: STB_I	stb	%r28, [%r21 + 0x0102]
	.word 0xf2f5a04d  ! 2041: STXA_I	stxa	%r25, [%r22 + 0x004d] %asi
cpu_intr_3_166:
	setx	0x2f0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4340000  ! 2048: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xfc250000  ! 2051: STW_R	stw	%r30, [%r20 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xfab5e18c  ! 2054: STHA_I	stha	%r29, [%r23 + 0x018c] %asi
	.word 0xf6a54020  ! 2058: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
cpu_intr_3_167:
	setx	0x2f0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d4000  ! 2063: STB_R	stb	%r30, [%r21 + %r0]
T3_asi_reg_rd_94:
	mov	0x8, %r14
	.word 0xf2db8400  ! 2064: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_3_168:
	setx	0x2f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_95:
	mov	0xe, %r14
	.word 0xfadb8e60  ! 2066: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbab40000  ! 2068: ORNcc_R	orncc 	%r16, %r0, %r29
T3_asi_reg_rd_96:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 2073: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf6ad0020  ! 2074: STBA_R	stba	%r27, [%r20 + %r0] 0x01
	.word 0xf6ad4020  ! 2075: STBA_R	stba	%r27, [%r21 + %r0] 0x01
	.word 0xf435e14d  ! 2077: STH_I	sth	%r26, [%r23 + 0x014d]
T3_asi_reg_rd_97:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 2079: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_rd_98:
	mov	0xe, %r14
	.word 0xfadb8e80  ! 2080: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_169:
	setx	0x2d0001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 1)
	.word 0xb72c1000  ! 2087: SLLX_R	sllx	%r16, %r0, %r27
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfa756178  ! 2089: STX_I	stx	%r29, [%r21 + 0x0178]
	.word 0xb3641800  ! 2094: MOVcc_R	<illegal instruction>
T3_asi_reg_rd_99:
	mov	0x1f, %r14
	.word 0xfedb8e40  ! 2099: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf62ce188  ! 2100: STB_I	stb	%r27, [%r19 + 0x0188]
T3_asi_reg_rd_100:
	mov	0x16, %r14
	.word 0xfadb8400  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfeb4e0f6  ! 2108: STHA_I	stha	%r31, [%r19 + 0x00f6] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xf6a50020  ! 2112: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
cpu_intr_3_170:
	setx	0x2d0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c8000  ! 2119: STB_R	stb	%r24, [%r18 + %r0]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_101:
	mov	0x19, %r14
	.word 0xf8db8400  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb97d4400  ! 2128: MOVR_R	movre	%r21, %r0, %r28
T3_asi_reg_rd_102:
	mov	0x3c2, %r14
	.word 0xfedb84a0  ! 2129: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 2d)
	.word 0xb6c4a060  ! 2136: ADDCcc_I	addccc 	%r18, 0x0060, %r27
	.word 0xfead8020  ! 2138: STBA_R	stba	%r31, [%r22 + %r0] 0x01
	.word 0xfcb5e04d  ! 2139: STHA_I	stha	%r30, [%r23 + 0x004d] %asi
cpu_intr_3_171:
	setx	0x2f0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d213c  ! 2143: STB_I	stb	%r27, [%r20 + 0x013c]
	.word 0xb7641800  ! 2144: MOVcc_R	<illegal instruction>
T3_asi_reg_wr_101:
	mov	0x1a, %r14
	.word 0xf6f38e60  ! 2149: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_wr_102:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 2150: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 26)
	.word 0x8f902000  ! 2155: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 25)
	ta	T_CHANGE_TO_TL1
	.word 0xfead6193  ! 2172: STBA_I	stba	%r31, [%r21 + 0x0193] %asi
cpu_intr_3_172:
	setx	0x2f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_173:
	setx	0x2e0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf824c000  ! 2176: STW_R	stw	%r28, [%r19 + %r0]
T3_asi_reg_rd_103:
	mov	0x1c, %r14
	.word 0xfedb89e0  ! 2177: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf4ace078  ! 2179: STBA_I	stba	%r26, [%r19 + 0x0078] %asi
	.word 0xfaadc020  ! 2180: STBA_R	stba	%r29, [%r23 + %r0] 0x01
T3_asi_reg_rd_104:
	mov	0x0, %r14
	.word 0xfcdb89e0  ! 2181: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf625e17d  ! 2183: STW_I	stw	%r27, [%r23 + 0x017d]
	.word 0xf4f5a055  ! 2184: STXA_I	stxa	%r26, [%r22 + 0x0055] %asi
	.word 0xfe74a03d  ! 2187: STX_I	stx	%r31, [%r18 + 0x003d]
T3_asi_reg_rd_105:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 2191: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 2c)
	.word 0xbc3ca0ff  ! 2194: XNOR_I	xnor 	%r18, 0x00ff, %r30
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_106:
	mov	0x10, %r14
	.word 0xfedb8400  ! 2208: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_wr_103:
	mov	0x1a, %r14
	.word 0xfef38400  ! 2209: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_174:
	setx	0x2c0030, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_107:
	mov	0x14, %r14
	.word 0xf2db89e0  ! 2212: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 32)
	.word 0x8795a16b  ! 2217: WRPR_TT_I	wrpr	%r22, 0x016b, %tt
T3_asi_reg_wr_104:
	mov	0x3c1, %r14
	.word 0xf4f38e80  ! 2218: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf62cc000  ! 2219: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xfcb40020  ! 2220: STHA_R	stha	%r30, [%r16 + %r0] 0x01
T3_asi_reg_wr_105:
	mov	0x20, %r14
	.word 0xfaf38400  ! 2221: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_3_175:
	setx	0x2d0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0454000  ! 2224: ADDC_R	addc 	%r21, %r0, %r24
	.word 0xbe8d8000  ! 2229: ANDcc_R	andcc 	%r22, %r0, %r31
	.word 0xf824c000  ! 2230: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xfa2ca0c1  ! 2231: STB_I	stb	%r29, [%r18 + 0x00c1]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_106:
	mov	0x13, %r14
	.word 0xfef38e40  ! 2237: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfa244000  ! 2239: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xf82c6198  ! 2241: STB_I	stb	%r28, [%r17 + 0x0198]
T3_asi_reg_wr_107:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 2243: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf4a50020  ! 2244: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
T3_asi_reg_rd_108:
	mov	0x1d, %r14
	.word 0xf6db89e0  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_rd_109:
	mov	0x7, %r14
	.word 0xf8db8e40  ! 2247: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf234212b  ! 2248: STH_I	sth	%r25, [%r16 + 0x012b]
	.word 0xf674201a  ! 2249: STX_I	stx	%r27, [%r16 + 0x001a]
T3_asi_reg_rd_110:
	mov	0x6, %r14
	.word 0xfcdb8400  ! 2250: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf074a0c1  ! 2252: STX_I	stx	%r24, [%r18 + 0x00c1]
	.word 0xf02d8000  ! 2253: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xf0a46150  ! 2257: STWA_I	stwa	%r24, [%r17 + 0x0150] %asi
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983e12  ! 2258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e12, %hpstate
	.word 0xfa75e0dd  ! 2259: STX_I	stx	%r29, [%r23 + 0x00dd]
T3_asi_reg_rd_111:
	mov	0x26, %r14
	.word 0xfedb8e40  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_176:
	setx	0x32023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ada033  ! 2265: STBA_I	stba	%r27, [%r22 + 0x0033] %asi
	.word 0xb08c2000  ! 2267: ANDcc_I	andcc 	%r16, 0x0000, %r24
T3_asi_reg_wr_108:
	mov	0x16, %r14
	.word 0xfaf384a0  ! 2268: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f50  ! 2270: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f50, %hpstate
	.word 0xf4a48020  ! 2273: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, e)
	.word 0xf274e031  ! 2276: STX_I	stx	%r25, [%r19 + 0x0031]
T3_asi_reg_rd_112:
	mov	0x3, %r14
	.word 0xfedb89e0  ! 2280: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_3_177:
	setx	0x300119, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_113:
	mov	0x15, %r14
	.word 0xfedb8e80  ! 2285: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_178:
	setx	0x320307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b4e1d9  ! 2289: STHA_I	stha	%r26, [%r19 + 0x01d9] %asi
T3_asi_reg_wr_109:
	mov	0xa, %r14
	.word 0xf0f38e80  ! 2290: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_rd_114:
	mov	0x11, %r14
	.word 0xf2db8e40  ! 2291: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf0a44020  ! 2294: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
T3_asi_reg_wr_110:
	mov	0x3c7, %r14
	.word 0xfef38e60  ! 2298: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_179:
	setx	0x310224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf0b4c020  ! 2304: STHA_R	stha	%r24, [%r19 + %r0] 0x01
	.word 0xf4ada110  ! 2305: STBA_I	stba	%r26, [%r22 + 0x0110] %asi
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 39)
	.word 0xfa2d8000  ! 2307: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xbd7c0400  ! 2308: MOVR_R	movre	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_180:
	setx	0x31033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a40020  ! 2315: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
cpu_intr_3_181:
	setx	0x330015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40d6103  ! 2322: AND_I	and 	%r21, 0x0103, %r26
	.word 0xf2ac613e  ! 2324: STBA_I	stba	%r25, [%r17 + 0x013e] %asi
	.word 0xfc74e01f  ! 2325: STX_I	stx	%r30, [%r19 + 0x001f]
	.word 0xf4f5a06d  ! 2326: STXA_I	stxa	%r26, [%r22 + 0x006d] %asi
	ta	T_CHANGE_TO_TL1
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_111:
	mov	0x3c2, %r14
	.word 0xf0f389e0  ! 2330: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0xfca44020  ! 2333: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
	.word 0xf0b5c020  ! 2337: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xf0a40020  ! 2340: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
	.word 0xf0a460a3  ! 2342: STWA_I	stwa	%r24, [%r17 + 0x00a3] %asi
	.word 0xfe75c000  ! 2343: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xfaac2146  ! 2345: STBA_I	stba	%r29, [%r16 + 0x0146] %asi
	.word 0xf4b4e143  ! 2347: STHA_I	stha	%r26, [%r19 + 0x0143] %asi
cpu_intr_3_182:
	setx	0x320239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43dc000  ! 2350: XNOR_R	xnor 	%r23, %r0, %r26
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf2a5e057  ! 2356: STWA_I	stwa	%r25, [%r23 + 0x0057] %asi
	.word 0xf4ac61e5  ! 2357: STBA_I	stba	%r26, [%r17 + 0x01e5] %asi
	.word 0xf4354000  ! 2358: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xf82c4000  ! 2360: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xf27460e3  ! 2362: STX_I	stx	%r25, [%r17 + 0x00e3]
cpu_intr_3_183:
	setx	0x330115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d4000  ! 2364: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xf6750000  ! 2365: STX_R	stx	%r27, [%r20 + %r0]
T3_asi_reg_rd_115:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 2366: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb09c4000  ! 2368: XORcc_R	xorcc 	%r17, %r0, %r24
T3_asi_reg_rd_116:
	mov	0xe, %r14
	.word 0xf2db8e40  ! 2372: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_112:
	mov	0x3c5, %r14
	.word 0xf2f384a0  ! 2374: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_184:
	setx	0x310214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_wr_113:
	mov	0x34, %r14
	.word 0xfef38e40  ! 2377: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb12c8000  ! 2381: SLL_R	sll 	%r18, %r0, %r24
cpu_intr_3_185:
	setx	0x32031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24a13d  ! 2383: STW_I	stw	%r31, [%r18 + 0x013d]
cpu_intr_3_186:
	setx	0x310003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5614a  ! 2385: STHA_I	stha	%r28, [%r21 + 0x014a] %asi
	.word 0xfca40020  ! 2387: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
	.word 0xf0752008  ! 2389: STX_I	stx	%r24, [%r20 + 0x0008]
cpu_intr_3_187:
	setx	0x30010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xbab5a154  ! 2396: ORNcc_I	orncc 	%r22, 0x0154, %r29
	.word 0xf8ad0020  ! 2397: STBA_R	stba	%r28, [%r20 + %r0] 0x01
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_188:
	setx	0x32001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc748000  ! 2407: STX_R	stx	%r30, [%r18 + %r0]
cpu_intr_3_189:
	setx	0x32003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 0)
	.word 0xf0b5c020  ! 2417: STHA_R	stha	%r24, [%r23 + %r0] 0x01
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc74a12b  ! 2423: STX_I	stx	%r30, [%r18 + 0x012b]
cpu_intr_3_190:
	setx	0x30020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21cc000  ! 2426: XOR_R	xor 	%r19, %r0, %r25
	.word 0xb6b5a102  ! 2427: SUBCcc_I	orncc 	%r22, 0x0102, %r27
	.word 0xf8b50020  ! 2428: STHA_R	stha	%r28, [%r20 + %r0] 0x01
	.word 0xf4350000  ! 2429: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xfead8020  ! 2430: STBA_R	stba	%r31, [%r22 + %r0] 0x01
	.word 0xbc9c615f  ! 2433: XORcc_I	xorcc 	%r17, 0x015f, %r30
T3_asi_reg_wr_114:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 2434: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T3_asi_reg_wr_115:
	mov	0x3c5, %r14
	.word 0xf2f38e80  ! 2437: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_117:
	mov	0xc, %r14
	.word 0xfcdb8e40  ! 2439: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_191:
	setx	0x300303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_192:
	setx	0x32010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_193:
	setx	0x300315, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_118:
	mov	0x3c7, %r14
	.word 0xf0db8400  ! 2450: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 25)
	.word 0xf475a1fc  ! 2455: STX_I	stx	%r26, [%r22 + 0x01fc]
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_116:
	mov	0x3, %r14
	.word 0xf0f38400  ! 2458: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf6aca016  ! 2459: STBA_I	stba	%r27, [%r18 + 0x0016] %asi
	.word 0xf275a136  ! 2460: STX_I	stx	%r25, [%r22 + 0x0136]
cpu_intr_3_194:
	setx	0x33010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983c10  ! 2462: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c10, %hpstate
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_195:
	setx	0x320324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc3560ed  ! 2468: STH_I	sth	%r30, [%r21 + 0x00ed]
T3_asi_reg_wr_117:
	mov	0x23, %r14
	.word 0xf4f389e0  ! 2470: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_3_196:
	setx	0x300031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c4000  ! 2473: STB_R	stb	%r27, [%r17 + %r0]
cpu_intr_3_197:
	setx	0x31031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_198:
	setx	0x320322, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_119:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 2477: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_wr_118:
	mov	0xa, %r14
	.word 0xf0f38e60  ! 2478: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_120:
	mov	0x0, %r14
	.word 0xf8db8400  ! 2481: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_199:
	setx	0x310036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef4e10c  ! 2483: STXA_I	stxa	%r31, [%r19 + 0x010c] %asi
T3_asi_reg_wr_119:
	mov	0xf, %r14
	.word 0xf4f38e80  ! 2485: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf625a15e  ! 2488: STW_I	stw	%r27, [%r22 + 0x015e]
	.word 0xf82c60ec  ! 2492: STB_I	stb	%r28, [%r17 + 0x00ec]
	.word 0xfa2c6173  ! 2496: STB_I	stb	%r29, [%r17 + 0x0173]
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 34)
	.word 0xb495e0d5  ! 2502: ORcc_I	orcc 	%r23, 0x00d5, %r26
	.word 0xfaa44020  ! 2505: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
cpu_intr_3_200:
	setx	0x320033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_201:
	setx	0x32002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b40020  ! 2510: STHA_R	stha	%r28, [%r16 + %r0] 0x01
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_wr_120:
	mov	0x30, %r14
	.word 0xf0f38e40  ! 2518: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbc244000  ! 2519: SUB_R	sub 	%r17, %r0, %r30
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 30)
	.word 0xf224c000  ! 2527: STW_R	stw	%r25, [%r19 + %r0]
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfc258000  ! 2533: STW_R	stw	%r30, [%r22 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_202:
	setx	0x310015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_203:
	setx	0x310220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_121:
	mov	0x3, %r14
	.word 0xfadb89e0  ! 2539: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf0a460b9  ! 2541: STWA_I	stwa	%r24, [%r17 + 0x00b9] %asi
cpu_intr_3_204:
	setx	0x33011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4246078  ! 2544: STW_I	stw	%r26, [%r17 + 0x0078]
	.word 0xf424e016  ! 2546: STW_I	stw	%r26, [%r19 + 0x0016]
	.word 0xf475a012  ! 2547: STX_I	stx	%r26, [%r22 + 0x0012]
	.word 0xfeb58020  ! 2548: STHA_R	stha	%r31, [%r22 + %r0] 0x01
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf834e09b  ! 2551: STH_I	sth	%r28, [%r19 + 0x009b]
T3_asi_reg_wr_121:
	mov	0x3c7, %r14
	.word 0xfef38e60  ! 2552: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfea40020  ! 2556: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
cpu_intr_3_205:
	setx	0x32031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc744000  ! 2558: STX_R	stx	%r30, [%r17 + %r0]
T3_asi_reg_wr_122:
	mov	0x1c, %r14
	.word 0xf4f38e40  ! 2559: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfa348000  ! 2561: STH_R	sth	%r29, [%r18 + %r0]
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_123:
	mov	0xe, %r14
	.word 0xf8f384a0  ! 2571: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_wr_124:
	mov	0x1b, %r14
	.word 0xf2f389e0  ! 2574: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xba9d6103  ! 2579: XORcc_I	xorcc 	%r21, 0x0103, %r29
	.word 0xbc1ca150  ! 2581: XOR_I	xor 	%r18, 0x0150, %r30
T3_asi_reg_rd_122:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 2591: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb2b4a040  ! 2595: ORNcc_I	orncc 	%r18, 0x0040, %r25
	.word 0xb73c1000  ! 2596: SRAX_R	srax	%r16, %r0, %r27
T3_asi_reg_wr_125:
	mov	0x1, %r14
	.word 0xfaf38e40  ! 2601: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_206:
	setx	0x33010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 22)
	.word 0xfaac0020  ! 2607: STBA_R	stba	%r29, [%r16 + %r0] 0x01
	.word 0xf4b4e050  ! 2608: STHA_I	stha	%r26, [%r19 + 0x0050] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_207:
	setx	0x32003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_123:
	mov	0x2f, %r14
	.word 0xfedb8e40  ! 2616: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_124:
	mov	0x3, %r14
	.word 0xfedb84a0  ! 2617: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf4350000  ! 2618: STH_R	sth	%r26, [%r20 + %r0]
T3_asi_reg_wr_126:
	mov	0x2e, %r14
	.word 0xfef38400  ! 2620: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_208:
	setx	0x30013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_209:
	setx	0x310028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2258000  ! 2631: STW_R	stw	%r25, [%r22 + %r0]
T3_asi_reg_rd_125:
	mov	0xe, %r14
	.word 0xfedb8e40  ! 2634: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0x8595204d  ! 2636: WRPR_TSTATE_I	wrpr	%r20, 0x004d, %tstate
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_210:
	setx	0x320125, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f90  ! 2646: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f90, %hpstate
	.word 0xf8350000  ! 2649: STH_R	sth	%r28, [%r20 + %r0]
cpu_intr_3_211:
	setx	0x300004, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983b82  ! 2652: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b82, %hpstate
	.word 0xfa340000  ! 2657: STH_R	sth	%r29, [%r16 + %r0]
T3_asi_reg_rd_126:
	mov	0x31, %r14
	.word 0xfadb8e40  ! 2658: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_127:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 2659: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_127:
	mov	0x34, %r14
	.word 0xf4db8e40  ! 2666: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_128:
	mov	0xe, %r14
	.word 0xf6db8e40  ! 2667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_129:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 1)
	.word 0xbb500000  ! 2674: RDPR_TPC	rdpr	%tpc, %r29
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_212:
	setx	0x320110, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_130:
	mov	0x24, %r14
	.word 0xf0db8e40  ! 2679: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_213:
	setx	0x320139, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_131:
	mov	0x32, %r14
	.word 0xf8db8e60  ! 2683: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_rd_132:
	mov	0x2f, %r14
	.word 0xfedb89e0  ! 2690: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 34)
	.word 0xfaa44020  ! 2693: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
T3_asi_reg_rd_133:
	mov	0x0, %r14
	.word 0xf0db8e60  ! 2695: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 2d)
	ta	T_CHANGE_HPRIV
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 1e)
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983fd0  ! 2702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd0, %hpstate
cpu_intr_3_214:
	setx	0x320329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35206d  ! 2705: STH_I	sth	%r29, [%r20 + 0x006d]
	.word 0xfa2ce0a3  ! 2706: STB_I	stb	%r29, [%r19 + 0x00a3]
T3_asi_reg_rd_134:
	mov	0x8, %r14
	.word 0xf2db8e60  ! 2707: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_rd_135:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 2709: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf0b5a1c3  ! 2710: STHA_I	stha	%r24, [%r22 + 0x01c3] %asi
	.word 0xb634a148  ! 2711: ORN_I	orn 	%r18, 0x0148, %r27
	.word 0xf635c000  ! 2712: STH_R	sth	%r27, [%r23 + %r0]
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf6744000  ! 2718: STX_R	stx	%r27, [%r17 + %r0]
T3_asi_reg_rd_136:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 2721: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbd643801  ! 2722: MOVcc_I	<illegal instruction>
	.word 0xbe8d4000  ! 2725: ANDcc_R	andcc 	%r21, %r0, %r31
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198381a  ! 2726: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181a, %hpstate
cpu_intr_3_215:
	setx	0x36001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_216:
	setx	0x36023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf034e183  ! 2733: STH_I	sth	%r24, [%r19 + 0x0183]
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 13)
	.word 0xb0a52153  ! 2737: SUBcc_I	subcc 	%r20, 0x0153, %r24
T3_asi_reg_rd_137:
	mov	0x16, %r14
	.word 0xfedb8e60  ! 2739: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfe248000  ! 2741: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xf8a5c020  ! 2742: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
	.word 0xf0aca0fc  ! 2747: STBA_I	stba	%r24, [%r18 + 0x00fc] %asi
T3_asi_reg_rd_138:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 2749: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf0740000  ! 2750: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xf434a0a7  ! 2752: STH_I	sth	%r26, [%r18 + 0x00a7]
T3_asi_reg_wr_128:
	mov	0x23, %r14
	.word 0xf6f38e40  ! 2755: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb29d8000  ! 2757: XORcc_R	xorcc 	%r22, %r0, %r25
cpu_intr_3_217:
	setx	0x36003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a40020  ! 2764: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	.word 0xfc3461fb  ! 2766: STH_I	sth	%r30, [%r17 + 0x01fb]
cpu_intr_3_218:
	setx	0x350315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa758000  ! 2768: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xf4a40020  ! 2773: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
	.word 0xf22c8000  ! 2775: STB_R	stb	%r25, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_219:
	setx	0x350209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33c8000  ! 2787: SRA_R	sra 	%r18, %r0, %r25
	.word 0xbf35c000  ! 2789: SRL_R	srl 	%r23, %r0, %r31
	.word 0xf0b4a073  ! 2791: STHA_I	stha	%r24, [%r18 + 0x0073] %asi
	.word 0xf62de0e4  ! 2793: STB_I	stb	%r27, [%r23 + 0x00e4]
	.word 0xf42d8000  ! 2795: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xfaf520e9  ! 2796: STXA_I	stxa	%r29, [%r20 + 0x00e9] %asi
T3_asi_reg_rd_139:
	mov	0x2a, %r14
	.word 0xfcdb8400  ! 2798: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_wr_129:
	mov	0x19, %r14
	.word 0xf8f38e60  ! 2801: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf42ce0fc  ! 2807: STB_I	stb	%r26, [%r19 + 0x00fc]
cpu_intr_3_220:
	setx	0x340229, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_140:
	mov	0xd, %r14
	.word 0xf6db8400  ! 2811: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf275a0b2  ! 2817: STX_I	stx	%r25, [%r22 + 0x00b2]
T3_asi_reg_rd_141:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 2819: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbc050000  ! 2820: ADD_R	add 	%r20, %r0, %r30
cpu_intr_3_221:
	setx	0x36032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, e)
	.word 0xf6f5e0c6  ! 2827: STXA_I	stxa	%r27, [%r23 + 0x00c6] %asi
	.word 0xb6bc8000  ! 2830: XNORcc_R	xnorcc 	%r18, %r0, %r27
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x819838d0  ! 2834: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d0, %hpstate
cpu_intr_3_222:
	setx	0x34031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x919560e8  ! 2842: WRPR_PIL_I	wrpr	%r21, 0x00e8, %pil
cpu_intr_3_223:
	setx	0x36013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfcadc020  ! 2853: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	.word 0xf075e064  ! 2854: STX_I	stx	%r24, [%r23 + 0x0064]
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_142:
	mov	0x5, %r14
	.word 0xf6db8e80  ! 2857: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfc740000  ! 2858: STX_R	stx	%r30, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_143:
	mov	0x20, %r14
	.word 0xf6db8e80  ! 2864: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb234a168  ! 2865: SUBC_I	orn 	%r18, 0x0168, %r25
T3_asi_reg_wr_130:
	mov	0x1e, %r14
	.word 0xf6f38e60  ! 2867: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfcb54020  ! 2868: STHA_R	stha	%r30, [%r21 + %r0] 0x01
	.word 0xb2854000  ! 2869: ADDcc_R	addcc 	%r21, %r0, %r25
T3_asi_reg_wr_131:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 2870: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf6b44020  ! 2871: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	.word 0xf024a174  ! 2873: STW_I	stw	%r24, [%r18 + 0x0174]
T3_asi_reg_wr_132:
	mov	0x32, %r14
	.word 0xf0f384a0  ! 2875: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_224:
	setx	0x35023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_144:
	mov	0x22, %r14
	.word 0xfedb8e80  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf0ac4020  ! 2879: STBA_R	stba	%r24, [%r17 + %r0] 0x01
cpu_intr_3_225:
	setx	0x340316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_226:
	setx	0x370102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_227:
	setx	0x360238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_rd_145:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 2893: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf0a4a0a0  ! 2897: STWA_I	stwa	%r24, [%r18 + 0x00a0] %asi
	.word 0xba1cc000  ! 2898: XOR_R	xor 	%r19, %r0, %r29
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 20)
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_146:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 2904: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_wr_133:
	mov	0x6, %r14
	.word 0xf0f38e60  ! 2909: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_147:
	mov	0x18, %r14
	.word 0xf8db8e80  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_3_228:
	setx	0x340020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5a18c  ! 2919: STHA_I	stha	%r27, [%r22 + 0x018c] %asi
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_134:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 2921: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 4)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbcb50000  ! 2925: ORNcc_R	orncc 	%r20, %r0, %r30
	.word 0xf8350000  ! 2926: STH_R	sth	%r28, [%r20 + %r0]
cpu_intr_3_229:
	setx	0x370318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_230:
	setx	0x350018, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_148:
	mov	0x23, %r14
	.word 0xf4db89e0  ! 2934: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf625a0fd  ! 2936: STW_I	stw	%r27, [%r22 + 0x00fd]
T3_asi_reg_rd_149:
	mov	0x26, %r14
	.word 0xfadb84a0  ! 2937: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_231:
	setx	0x340220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34a106  ! 2945: STH_I	sth	%r30, [%r18 + 0x0106]
T3_asi_reg_wr_135:
	mov	0xc, %r14
	.word 0xfef389e0  ! 2946: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb634e10f  ! 2948: SUBC_I	orn 	%r19, 0x010f, %r27
T3_asi_reg_wr_136:
	mov	0x30, %r14
	.word 0xf0f38e40  ! 2953: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_137:
	mov	0x23, %r14
	.word 0xfef38e80  ! 2955: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_wr_138:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 2957: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf6754000  ! 2960: STX_R	stx	%r27, [%r21 + %r0]
T3_asi_reg_wr_139:
	mov	0x24, %r14
	.word 0xf2f389e0  ! 2963: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_3_232:
	setx	0x340328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_233:
	setx	0x35003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_150:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 2967: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 0)
	.word 0xf0b4e01c  ! 2979: STHA_I	stha	%r24, [%r19 + 0x001c] %asi
	.word 0xfcb5a0d2  ! 2980: STHA_I	stha	%r30, [%r22 + 0x00d2] %asi
T3_asi_reg_wr_140:
	mov	0x1e, %r14
	.word 0xf2f38400  ! 2982: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfcac4020  ! 2988: STBA_R	stba	%r30, [%r17 + %r0] 0x01
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 19)
	.word 0xbf2d4000  ! 2991: SLL_R	sll 	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_wr_141:
	mov	0xf, %r14
	.word 0xf8f38400  ! 2997: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 3)
	.word 0xf224c000  ! 2999: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xbe948000  ! 3003: ORcc_R	orcc 	%r18, %r0, %r31
	.word 0xfab5a009  ! 3004: STHA_I	stha	%r29, [%r22 + 0x0009] %asi
T3_asi_reg_wr_142:
	mov	0xd, %r14
	.word 0xf6f38e40  ! 3006: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_151:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 3007: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_wr_143:
	mov	0x27, %r14
	.word 0xf8f38e40  ! 3013: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_152:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 3015: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfe740000  ! 3020: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xf475e1bc  ! 3022: STX_I	stx	%r26, [%r23 + 0x01bc]
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
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982ed8  ! 3025: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed8, %hpstate
	.word 0xf0b5612f  ! 3028: STHA_I	stha	%r24, [%r21 + 0x012f] %asi
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf035e0e7  ! 3030: STH_I	sth	%r24, [%r23 + 0x00e7]
	ta	T_CHANGE_HPRIV
cpu_intr_3_234:
	setx	0x360000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28de043  ! 3034: ANDcc_I	andcc 	%r23, 0x0043, %r25
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 16)
	.word 0xf025e0ba  ! 3038: STW_I	stw	%r24, [%r23 + 0x00ba]
	.word 0xfc2cc000  ! 3040: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf6f420dd  ! 3041: STXA_I	stxa	%r27, [%r16 + 0x00dd] %asi
	.word 0xf8ac8020  ! 3043: STBA_R	stba	%r28, [%r18 + %r0] 0x01
T3_asi_reg_rd_153:
	mov	0x4, %r14
	.word 0xfadb8400  ! 3045: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfaa56168  ! 3048: STWA_I	stwa	%r29, [%r21 + 0x0168] %asi
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_wr_144:
	mov	0xb, %r14
	.word 0xf6f38e40  ! 3052: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_154:
	mov	0x17, %r14
	.word 0xf0db8e60  ! 3054: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_235:
	setx	0x370307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_236:
	setx	0x36033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23cc000  ! 3062: XNOR_R	xnor 	%r19, %r0, %r25
cpu_intr_3_237:
	setx	0x360315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_155:
	mov	0x3c1, %r14
	.word 0xf0db89e0  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_wr_145:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 3073: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf4a520df  ! 3074: STWA_I	stwa	%r26, [%r20 + 0x00df] %asi
T3_asi_reg_rd_156:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 3075: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf0b421a2  ! 3076: STHA_I	stha	%r24, [%r16 + 0x01a2] %asi
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d42  ! 3077: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d42, %hpstate
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b9a  ! 3078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9a, %hpstate
cpu_intr_3_238:
	setx	0x370112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0748000  ! 3083: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xba958000  ! 3084: ORcc_R	orcc 	%r22, %r0, %r29
	.word 0xbd3c4000  ! 3085: SRA_R	sra 	%r17, %r0, %r30
cpu_intr_3_239:
	setx	0x35001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_240:
	setx	0x35003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4754000  ! 3088: STX_R	stx	%r26, [%r21 + %r0]
	ta	T_CHANGE_TO_TL0
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819829c0  ! 3091: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c0, %hpstate
	.word 0xfef461d0  ! 3092: STXA_I	stxa	%r31, [%r17 + 0x01d0] %asi
cpu_intr_3_241:
	setx	0x340314, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_157:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 3099: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf2240000  ! 3100: STW_R	stw	%r25, [%r16 + %r0]
cpu_intr_3_242:
	setx	0x36030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_243:
	setx	0x34020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfa34c000  ! 3106: STH_R	sth	%r29, [%r19 + %r0]
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 39)
	.word 0xbea56126  ! 3109: SUBcc_I	subcc 	%r21, 0x0126, %r31
	.word 0xfe2c8000  ! 3115: STB_R	stb	%r31, [%r18 + %r0]
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_rd_158:
	mov	0x33, %r14
	.word 0xf8db84a0  ! 3123: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_rd_159:
	mov	0x3c3, %r14
	.word 0xf0db89e0  ! 3127: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf035c000  ! 3128: STH_R	sth	%r24, [%r23 + %r0]
cpu_intr_3_244:
	setx	0x370223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 38)
	.word 0xf42de1b0  ! 3135: STB_I	stb	%r26, [%r23 + 0x01b0]
	.word 0xfc348000  ! 3138: STH_R	sth	%r30, [%r18 + %r0]
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_rd_160:
	mov	0x2d, %r14
	.word 0xfadb8400  ! 3142: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfaa4c020  ! 3143: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
	.word 0xf274e002  ! 3144: STX_I	stx	%r25, [%r19 + 0x0002]
	.word 0xb88dc000  ! 3146: ANDcc_R	andcc 	%r23, %r0, %r28
cpu_intr_3_245:
	setx	0x35021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03d60a6  ! 3157: XNOR_I	xnor 	%r21, 0x00a6, %r24
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 3a)
	.word 0x919561d2  ! 3159: WRPR_PIL_I	wrpr	%r21, 0x01d2, %pil
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 13)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_246:
	setx	0x360213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42de105  ! 3166: STB_I	stb	%r26, [%r23 + 0x0105]
cpu_intr_3_247:
	setx	0x3a0226, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_161:
	mov	0xe, %r14
	.word 0xf0db8e40  ! 3168: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_162:
	mov	0x1e, %r14
	.word 0xfadb8e40  ! 3170: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819838d0  ! 3171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d0, %hpstate
	.word 0xf075e027  ! 3172: STX_I	stx	%r24, [%r23 + 0x0027]
	.word 0xfeb5c020  ! 3173: STHA_R	stha	%r31, [%r23 + %r0] 0x01
	.word 0xf834a0b0  ! 3175: STH_I	sth	%r28, [%r18 + 0x00b0]
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, b)
	.word 0xf6ad8020  ! 3183: STBA_R	stba	%r27, [%r22 + %r0] 0x01
	.word 0xbcac0000  ! 3184: ANDNcc_R	andncc 	%r16, %r0, %r30
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_rd_163:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 3189: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_164:
	mov	0x25, %r14
	.word 0xf8db8e80  ! 3195: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf835c000  ! 3198: STH_R	sth	%r28, [%r23 + %r0]
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_248:
	setx	0x380303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_249:
	setx	0x38010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb58020  ! 3207: STHA_R	stha	%r30, [%r22 + %r0] 0x01
T3_asi_reg_rd_165:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 3212: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf0ac8020  ! 3215: STBA_R	stba	%r24, [%r18 + %r0] 0x01
	.word 0xf624a193  ! 3216: STW_I	stw	%r27, [%r18 + 0x0193]
	.word 0xf22d8000  ! 3217: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xfeadc020  ! 3218: STBA_R	stba	%r31, [%r23 + %r0] 0x01
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 31)
	.word 0xfe2ca1f6  ! 3220: STB_I	stb	%r31, [%r18 + 0x01f6]
	.word 0xfc74a026  ! 3221: STX_I	stx	%r30, [%r18 + 0x0026]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_250:
	setx	0x38010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf0752027  ! 3235: STX_I	stx	%r24, [%r20 + 0x0027]
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d08  ! 3237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d08, %hpstate
	.word 0xfa34610a  ! 3239: STH_I	sth	%r29, [%r17 + 0x010a]
T3_asi_reg_rd_166:
	mov	0xc, %r14
	.word 0xf0db89e0  ! 3242: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfa746065  ! 3243: STX_I	stx	%r29, [%r17 + 0x0065]
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 9)
	.word 0xf4a54020  ! 3247: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
T3_asi_reg_rd_167:
	mov	0x6, %r14
	.word 0xfcdb8400  ! 3248: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_251:
	setx	0x380206, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x8595e16f  ! 3255: WRPR_TSTATE_I	wrpr	%r23, 0x016f, %tstate
	.word 0xfc756161  ! 3256: STX_I	stx	%r30, [%r21 + 0x0161]
cpu_intr_3_252:
	setx	0x3b0137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_168:
	mov	0x2d, %r14
	.word 0xf4db84a0  ! 3262: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982d82  ! 3265: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d82, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_146:
	mov	0x3c8, %r14
	.word 0xf2f38400  ! 3269: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfaa560f4  ! 3271: STWA_I	stwa	%r29, [%r21 + 0x00f4] %asi
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf4a50020  ! 3273: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 29)
	.word 0xfe7560fa  ! 3275: STX_I	stx	%r31, [%r21 + 0x00fa]
T3_asi_reg_rd_169:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 3276: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 11)
	ta	T_CHANGE_HPRIV
	.word 0xfcac8020  ! 3283: STBA_R	stba	%r30, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb234e042  ! 3285: ORN_I	orn 	%r19, 0x0042, %r25
T3_asi_reg_rd_170:
	mov	0x18, %r14
	.word 0xf0db8e40  ! 3287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe35c000  ! 3288: STH_R	sth	%r31, [%r23 + %r0]
T3_asi_reg_rd_171:
	mov	0x33, %r14
	.word 0xfedb8e60  ! 3289: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_253:
	setx	0x3b0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8242184  ! 3296: STW_I	stw	%r28, [%r16 + 0x0184]
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 2)
	.word 0xfaa50020  ! 3301: STWA_R	stwa	%r29, [%r20 + %r0] 0x01
	.word 0xf4758000  ! 3303: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf83421e4  ! 3305: STH_I	sth	%r28, [%r16 + 0x01e4]
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_rd_172:
	mov	0xa, %r14
	.word 0xfcdb8e80  ! 3311: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb53d2001  ! 3312: SRA_I	sra 	%r20, 0x0001, %r26
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_rd_173:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 3316: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_147:
	mov	0x11, %r14
	.word 0xf2f384a0  ! 3318: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_wr_148:
	mov	0x2f, %r14
	.word 0xf0f384a0  ! 3320: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf2ace18e  ! 3324: STBA_I	stba	%r25, [%r19 + 0x018e] %asi
T3_asi_reg_wr_149:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 3325: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_254:
	setx	0x3b0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf274a0de  ! 3330: STX_I	stx	%r25, [%r18 + 0x00de]
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 18)
	ta	T_CHANGE_HPRIV
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_255:
	setx	0x3a0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982fd8  ! 3339: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd8, %hpstate
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 1a)
	.word 0xbd35c000  ! 3344: SRL_R	srl 	%r23, %r0, %r30
	.word 0xbe04e178  ! 3345: ADD_I	add 	%r19, 0x0178, %r31
	.word 0xf024a106  ! 3349: STW_I	stw	%r24, [%r18 + 0x0106]
cpu_intr_3_256:
	setx	0x380117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 1c)
	ta	T_CHANGE_TO_TL0
	.word 0xf2b5c020  ! 3355: STHA_R	stha	%r25, [%r23 + %r0] 0x01
T3_asi_reg_rd_174:
	mov	0x37, %r14
	.word 0xf8db8e60  ! 3356: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf42c61c3  ! 3357: STB_I	stb	%r26, [%r17 + 0x01c3]
	.word 0xf42c21fa  ! 3360: STB_I	stb	%r26, [%r16 + 0x01fa]
	.word 0xf22c60ba  ! 3361: STB_I	stb	%r25, [%r17 + 0x00ba]
	.word 0xf0ac8020  ! 3363: STBA_R	stba	%r24, [%r18 + %r0] 0x01
	.word 0xfaa5a17b  ! 3365: STWA_I	stwa	%r29, [%r22 + 0x017b] %asi
	.word 0xf275e0df  ! 3368: STX_I	stx	%r25, [%r23 + 0x00df]
	.word 0xf0348000  ! 3370: STH_R	sth	%r24, [%r18 + %r0]
T3_asi_reg_rd_175:
	mov	0x3c5, %r14
	.word 0xf2db84a0  ! 3372: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_wr_150:
	mov	0x26, %r14
	.word 0xf6f384a0  ! 3376: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf6ade043  ! 3377: STBA_I	stba	%r27, [%r23 + 0x0043] %asi
T3_asi_reg_rd_176:
	mov	0x36, %r14
	.word 0xf6db8e40  ! 3378: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0x8f902000  ! 3379: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cpu_intr_3_257:
	setx	0x390312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_258:
	setx	0x3a0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac4020  ! 3382: STBA_R	stba	%r30, [%r17 + %r0] 0x01
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 16)
	.word 0xf074e0f4  ! 3385: STX_I	stx	%r24, [%r19 + 0x00f4]
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_259:
	setx	0x3b012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_151:
	mov	0x5, %r14
	.word 0xf4f384a0  ! 3393: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf02d2198  ! 3395: STB_I	stb	%r24, [%r20 + 0x0198]
cpu_intr_3_260:
	setx	0x390131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3520d2  ! 3397: STH_I	sth	%r31, [%r20 + 0x00d2]
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 3b)
cpu_intr_3_261:
	setx	0x3a0304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 32)
	.word 0xb80dc000  ! 3405: AND_R	and 	%r23, %r0, %r28
	.word 0xf6348000  ! 3406: STH_R	sth	%r27, [%r18 + %r0]
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 3)
	.word 0xf825e15f  ! 3411: STW_I	stw	%r28, [%r23 + 0x015f]
	.word 0xfc240000  ! 3414: STW_R	stw	%r30, [%r16 + %r0]
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_262:
	setx	0x3b020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_177:
	mov	0xc, %r14
	.word 0xf4db8e80  ! 3420: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_152:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 3424: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_263:
	setx	0x380318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf675e0f6  ! 3432: STX_I	stx	%r27, [%r23 + 0x00f6]
T3_asi_reg_wr_153:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 3433: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_154:
	mov	0x25, %r14
	.word 0xf2f38e60  ! 3434: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 33)
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b1a  ! 3436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b1a, %hpstate
	.word 0xf6b44020  ! 3438: STHA_R	stha	%r27, [%r17 + %r0] 0x01
cpu_intr_3_264:
	setx	0x3a012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 6)
	.word 0xf8b5c020  ! 3443: STHA_R	stha	%r28, [%r23 + %r0] 0x01
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 9)
	.word 0xf435a189  ! 3447: STH_I	sth	%r26, [%r22 + 0x0189]
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_265:
	setx	0x39011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_rd_178:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 3462: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfc74205c  ! 3463: STX_I	stx	%r30, [%r16 + 0x005c]
cpu_intr_3_266:
	setx	0x38030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a48020  ! 3467: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
	.word 0xf8ad209a  ! 3468: STBA_I	stba	%r28, [%r20 + 0x009a] %asi
cpu_intr_3_267:
	setx	0x380314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf475a1f1  ! 3470: STX_I	stx	%r26, [%r22 + 0x01f1]
cpu_intr_3_268:
	setx	0x380204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f5e0aa  ! 3473: STXA_I	stxa	%r24, [%r23 + 0x00aa] %asi
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e98  ! 3474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e98, %hpstate
	.word 0xbe0c605f  ! 3475: AND_I	and 	%r17, 0x005f, %r31
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 18)
	.word 0xf22d2190  ! 3477: STB_I	stb	%r25, [%r20 + 0x0190]
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f4a  ! 3478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4a, %hpstate
	.word 0xfe2c4000  ! 3479: STB_R	stb	%r31, [%r17 + %r0]
cpu_intr_3_269:
	setx	0x3b023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe242043  ! 3484: STW_I	stw	%r31, [%r16 + 0x0043]
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_270:
	setx	0x3b0325, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_155:
	mov	0x1, %r14
	.word 0xfaf38e40  ! 3491: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_156:
	mov	0x30, %r14
	.word 0xf8f38e80  ! 3493: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb4450000  ! 3495: ADDC_R	addc 	%r20, %r0, %r26
cpu_intr_3_271:
	setx	0x38011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b48000  ! 3497: SUBCcc_R	orncc 	%r18, %r0, %r24
cpu_intr_3_272:
	setx	0x39030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_157:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 3501: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_273:
	setx	0x3a021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b5c020  ! 3509: STHA_R	stha	%r26, [%r23 + %r0] 0x01
	.word 0xb2b5e02d  ! 3510: SUBCcc_I	orncc 	%r23, 0x002d, %r25
	.word 0xf2b4610b  ! 3514: STHA_I	stha	%r25, [%r17 + 0x010b] %asi
	.word 0xf0758000  ! 3517: STX_R	stx	%r24, [%r22 + %r0]
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_rd_179:
	mov	0x1d, %r14
	.word 0xf8db8400  ! 3519: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T3_asi_reg_rd_180:
	mov	0x32, %r14
	.word 0xf8db8e40  ! 3520: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 24)
	.word 0xf62de006  ! 3527: STB_I	stb	%r27, [%r23 + 0x0006]
	.word 0xfca48020  ! 3530: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
cpu_intr_3_274:
	setx	0x390212, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_158:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 3535: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_rd_181:
	mov	0x12, %r14
	.word 0xf2db89e0  ! 3536: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 24)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf435e1f8  ! 3547: STH_I	sth	%r26, [%r23 + 0x01f8]
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_275:
	setx	0x390000, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_159:
	mov	0x3c4, %r14
	.word 0xfcf38400  ! 3555: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfe2da176  ! 3556: STB_I	stb	%r31, [%r22 + 0x0176]
T3_asi_reg_rd_182:
	mov	0x3c2, %r14
	.word 0xfcdb84a0  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf6f56116  ! 3559: STXA_I	stxa	%r27, [%r21 + 0x0116] %asi
T3_asi_reg_rd_183:
	mov	0x1f, %r14
	.word 0xf8db8e60  ! 3560: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_3_276:
	setx	0x39003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0da1cd  ! 3562: AND_I	and 	%r22, 0x01cd, %r30
	.word 0xf4f4e0d0  ! 3565: STXA_I	stxa	%r26, [%r19 + 0x00d0] %asi
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, c)
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_rd_184:
	mov	0x16, %r14
	.word 0xfedb8e40  ! 3577: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf22521e8  ! 3579: STW_I	stw	%r25, [%r20 + 0x01e8]
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_277:
	setx	0x3a030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa746045  ! 3585: STX_I	stx	%r29, [%r17 + 0x0045]
T3_asi_reg_wr_160:
	mov	0x30, %r14
	.word 0xf4f389e0  ! 3586: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_rd_185:
	mov	0xe, %r14
	.word 0xfedb84a0  ! 3587: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T3_asi_reg_rd_186:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 3588: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf2258000  ! 3589: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xfaa520a2  ! 3590: STWA_I	stwa	%r29, [%r20 + 0x00a2] %asi
T3_asi_reg_rd_187:
	mov	0x2, %r14
	.word 0xfadb8e80  ! 3596: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf6740000  ! 3597: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xfa74a03a  ! 3603: STX_I	stx	%r29, [%r18 + 0x003a]
	.word 0xf82d0000  ! 3606: STB_R	stb	%r28, [%r20 + %r0]
cpu_intr_3_278:
	setx	0x380318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab5c020  ! 3609: STHA_R	stha	%r29, [%r23 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_279:
	setx	0x390218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_280:
	setx	0x3a0014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_281:
	setx	0x38030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a52017  ! 3620: STWA_I	stwa	%r26, [%r20 + 0x0017] %asi
	.word 0xf6758000  ! 3622: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xfa2c6059  ! 3623: STB_I	stb	%r29, [%r17 + 0x0059]
T3_asi_reg_wr_161:
	mov	0x3c5, %r14
	.word 0xf2f384a0  ! 3624: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb3341000  ! 3626: SRLX_R	srlx	%r16, %r0, %r25
	.word 0xf025a123  ! 3627: STW_I	stw	%r24, [%r22 + 0x0123]
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_wr_162:
	mov	0x3c3, %r14
	.word 0xf6f38e80  ! 3630: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf824617b  ! 3632: STW_I	stw	%r28, [%r17 + 0x017b]
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_282:
	setx	0x3e023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfab58020  ! 3637: STHA_R	stha	%r29, [%r22 + %r0] 0x01
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 3a)
	ta	T_CHANGE_TO_TL0
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_wr_163:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 3646: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_188:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 3647: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 20)
	.word 0xf4b50020  ! 3654: STHA_R	stha	%r26, [%r20 + %r0] 0x01
cpu_intr_3_283:
	setx	0x3d0316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_284:
	setx	0x3d022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c2052  ! 3660: STB_I	stb	%r29, [%r16 + 0x0052]
	.word 0xb69d8000  ! 3662: XORcc_R	xorcc 	%r22, %r0, %r27
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_285:
	setx	0x3f012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_164:
	mov	0x30, %r14
	.word 0xf6f389e0  ! 3669: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_165:
	mov	0x17, %r14
	.word 0xfcf384a0  ! 3671: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbb7c8400  ! 3672: MOVR_R	movre	%r18, %r0, %r29
T3_asi_reg_rd_189:
	mov	0x26, %r14
	.word 0xf6db8e40  ! 3674: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_286:
	setx	0x3e0310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_287:
	setx	0x3e0232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 30)
	ta	T_CHANGE_TO_TL1
	.word 0xf675208a  ! 3686: STX_I	stx	%r27, [%r20 + 0x008a]
cpu_intr_3_288:
	setx	0x3f0203, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_166:
	mov	0x26, %r14
	.word 0xfef38e60  ! 3689: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfc74c000  ! 3690: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xf0348000  ! 3691: STH_R	sth	%r24, [%r18 + %r0]
cpu_intr_3_289:
	setx	0x3d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e92  ! 3695: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e92, %hpstate
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf225c000  ! 3698: STW_R	stw	%r25, [%r23 + %r0]
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 9)
	.word 0xf074e118  ! 3700: STX_I	stx	%r24, [%r19 + 0x0118]
cpu_intr_3_290:
	setx	0x3e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_190:
	mov	0x38, %r14
	.word 0xf6db8e40  ! 3705: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbf3d6001  ! 3707: SRA_I	sra 	%r21, 0x0001, %r31
	.word 0xbf518000  ! 3708: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xfa250000  ! 3710: STW_R	stw	%r29, [%r20 + %r0]
T3_asi_reg_wr_167:
	mov	0x2c, %r14
	.word 0xf8f389e0  ! 3711: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_291:
	setx	0x3f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 3713: RDPR_PIL	<illegal instruction>
T3_asi_reg_rd_191:
	mov	0x4, %r14
	.word 0xf8db8e60  ! 3722: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_292:
	setx	0x3d0136, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_168:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 3725: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_wr_169:
	mov	0x13, %r14
	.word 0xf4f38e80  ! 3726: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T3_asi_reg_rd_192:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 3727: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a00  ! 3728: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a00, %hpstate
T3_asi_reg_wr_170:
	mov	0x12, %r14
	.word 0xf6f38e40  ! 3730: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983a98  ! 3733: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a98, %hpstate
T3_asi_reg_rd_193:
	mov	0x3c7, %r14
	.word 0xf0db8400  ! 3736: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_3_293:
	setx	0x3f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_171:
	mov	0x18, %r14
	.word 0xfaf384a0  ! 3741: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_194:
	mov	0x3c3, %r14
	.word 0xf6db84a0  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_294:
	setx	0x3e013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_195:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 3747: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf6252066  ! 3750: STW_I	stw	%r27, [%r20 + 0x0066]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_295:
	setx	0x3d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_196:
	mov	0x2d, %r14
	.word 0xf2db84a0  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_wr_172:
	mov	0x35, %r14
	.word 0xf0f38400  ! 3757: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T3_asi_reg_rd_197:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982858  ! 3760: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0858, %hpstate
T3_asi_reg_rd_198:
	mov	0x3c8, %r14
	.word 0xf4db8e60  ! 3763: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 1)
	.word 0xf235606b  ! 3772: STH_I	sth	%r25, [%r21 + 0x006b]
	.word 0xf02c2008  ! 3774: STB_I	stb	%r24, [%r16 + 0x0008]
	.word 0xfa240000  ! 3775: STW_R	stw	%r29, [%r16 + %r0]
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 22)
	.word 0xf8a40020  ! 3779: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
T3_asi_reg_wr_173:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 3784: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf075c000  ! 3788: STX_R	stx	%r24, [%r23 + %r0]
cpu_intr_3_296:
	setx	0x3f0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4613d  ! 3792: STWA_I	stwa	%r27, [%r17 + 0x013d] %asi
T3_asi_reg_rd_199:
	mov	0x4, %r14
	.word 0xfcdb84a0  ! 3799: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf62ca0c3  ! 3800: STB_I	stb	%r27, [%r18 + 0x00c3]
	.word 0xbc25c000  ! 3804: SUB_R	sub 	%r23, %r0, %r30
	.word 0xf6354000  ! 3806: STH_R	sth	%r27, [%r21 + %r0]
cpu_intr_3_297:
	setx	0x3d0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb4e1b1  ! 3811: STHA_I	stha	%r31, [%r19 + 0x01b1] %asi
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf034c000  ! 3814: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xf2ada0e7  ! 3816: STBA_I	stba	%r25, [%r22 + 0x00e7] %asi
	.word 0xf6b40020  ! 3820: STHA_R	stha	%r27, [%r16 + %r0] 0x01
	.word 0xf825c000  ! 3822: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xfc754000  ! 3824: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xf22421ff  ! 3825: STW_I	stw	%r25, [%r16 + 0x01ff]
T3_asi_reg_rd_200:
	mov	0x16, %r14
	.word 0xfedb8400  ! 3829: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf8742108  ! 3830: STX_I	stx	%r28, [%r16 + 0x0108]
	.word 0xf0b48020  ! 3834: STHA_R	stha	%r24, [%r18 + %r0] 0x01
T3_asi_reg_wr_174:
	mov	0x13, %r14
	.word 0xf2f38400  ! 3839: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfef4a04b  ! 3844: STXA_I	stxa	%r31, [%r18 + 0x004b] %asi
T3_asi_reg_rd_201:
	mov	0x32, %r14
	.word 0xfcdb89e0  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfa25c000  ! 3848: STW_R	stw	%r29, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf8b4e05a  ! 3850: STHA_I	stha	%r28, [%r19 + 0x005a] %asi
	.word 0xb0c58000  ! 3852: ADDCcc_R	addccc 	%r22, %r0, %r24
	.word 0xfea4e076  ! 3853: STWA_I	stwa	%r31, [%r19 + 0x0076] %asi
	.word 0xbb351000  ! 3856: SRLX_R	srlx	%r20, %r0, %r29
cpu_intr_3_298:
	setx	0x3c022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe354000  ! 3859: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf474a043  ! 3860: STX_I	stx	%r26, [%r18 + 0x0043]
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_299:
	setx	0x3f031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_300:
	setx	0x3c0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf834a160  ! 3865: STH_I	sth	%r28, [%r18 + 0x0160]
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 9)
	.word 0xf8a4e152  ! 3870: STWA_I	stwa	%r28, [%r19 + 0x0152] %asi
	.word 0xf035c000  ! 3873: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xf6346132  ! 3875: STH_I	sth	%r27, [%r17 + 0x0132]
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
cpu_intr_3_301:
	setx	0x3f0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa4c020  ! 3879: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 8)
	.word 0xf02c4000  ! 3885: STB_R	stb	%r24, [%r17 + %r0]
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 7)
	.word 0xfcb5a1a3  ! 3892: STHA_I	stha	%r30, [%r22 + 0x01a3] %asi
	.word 0xba248000  ! 3900: SUB_R	sub 	%r18, %r0, %r29
cpu_intr_3_302:
	setx	0x3d003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ac614e  ! 3905: STBA_I	stba	%r25, [%r17 + 0x014e] %asi
T3_asi_reg_rd_202:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 3906: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 0)
	.word 0xfa2ca03c  ! 3912: STB_I	stb	%r29, [%r18 + 0x003c]
cpu_intr_3_303:
	setx	0x3f0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb294e1e7  ! 3917: ORcc_I	orcc 	%r19, 0x01e7, %r25
T3_asi_reg_rd_203:
	mov	0x24, %r14
	.word 0xf8db8e40  ! 3919: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_TO_TL1
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_304:
	setx	0x3f002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 2)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_204:
	mov	0x5, %r14
	.word 0xf0db8e60  ! 3934: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_305:
	setx	0x3f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 3938: RDPR_PIL	rdpr	%pil, %r26
	.word 0xf6756012  ! 3939: STX_I	stx	%r27, [%r21 + 0x0012]
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_306:
	setx	0x3e0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf07421dd  ! 3945: STX_I	stx	%r24, [%r16 + 0x01dd]
	ta	T_CHANGE_TO_TL0
	.word 0xb2b5a162  ! 3949: SUBCcc_I	orncc 	%r22, 0x0162, %r25
	.word 0xfc2ce1c8  ! 3950: STB_I	stb	%r30, [%r19 + 0x01c8]
	.word 0xf0ade18b  ! 3953: STBA_I	stba	%r24, [%r23 + 0x018b] %asi
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfc758000  ! 3956: STX_R	stx	%r30, [%r22 + %r0]
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 39)
	.word 0xf024c000  ! 3958: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xbf2c1000  ! 3959: SLLX_R	sllx	%r16, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_307:
	setx	0x3e0106, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_205:
	mov	0x27, %r14
	.word 0xf6db8e40  ! 3964: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_175:
	mov	0x8, %r14
	.word 0xf0f38e80  ! 3965: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb3356001  ! 3967: SRL_I	srl 	%r21, 0x0001, %r25
	.word 0xb6ade120  ! 3971: ANDNcc_I	andncc 	%r23, 0x0120, %r27
	.word 0xfe35c000  ! 3972: STH_R	sth	%r31, [%r23 + %r0]
cpu_intr_3_308:
	setx	0x3e0311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_309:
	setx	0x3d032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_310:
	setx	0x3f0303, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_206:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 3980: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbe0da056  ! 3981: AND_I	and 	%r22, 0x0056, %r31
	.word 0xf42d8000  ! 3982: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xfa2c0000  ! 3983: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xb32c0000  ! 3984: SLL_R	sll 	%r16, %r0, %r25
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf0b560d7  ! 3987: STHA_I	stha	%r24, [%r21 + 0x00d7] %asi
cpu_intr_3_311:
	setx	0x3f0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfef56101  ! 3995: STXA_I	stxa	%r31, [%r21 + 0x0101] %asi
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfaa48020  ! 4000: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
	.word 0xf8f5a198  ! 4001: STXA_I	stxa	%r28, [%r22 + 0x0198] %asi
	.word 0xf42d8000  ! 4002: STB_R	stb	%r26, [%r22 + %r0]
T3_asi_reg_wr_176:
	mov	0x3c4, %r14
	.word 0xfaf38400  ! 4003: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfcad4020  ! 4004: STBA_R	stba	%r30, [%r21 + %r0] 0x01
	.word 0xf2a52195  ! 4005: STWA_I	stwa	%r25, [%r20 + 0x0195] %asi
T3_asi_reg_rd_207:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 4006: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf4248000  ! 4008: STW_R	stw	%r26, [%r18 + %r0]
T3_asi_reg_wr_177:
	mov	0x21, %r14
	.word 0xf8f389e0  ! 4009: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983ad2  ! 4011: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad2, %hpstate
	.word 0xf425c000  ! 4013: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xfcb54020  ! 4015: STHA_R	stha	%r30, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf62c4000  ! 4022: STB_R	stb	%r27, [%r17 + %r0]
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 29)
	.word 0xf4348000  ! 4024: STH_R	sth	%r26, [%r18 + %r0]
T3_asi_reg_wr_178:
	mov	0x0, %r14
	.word 0xf4f38e40  ! 4027: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_312:
	setx	0x3d0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2ce16f  ! 4032: STB_I	stb	%r31, [%r19 + 0x016f]
	.word 0xb93c7001  ! 4034: SRAX_I	srax	%r17, 0x0001, %r28
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 24)
	.word 0xf025c000  ! 4036: STW_R	stw	%r24, [%r23 + %r0]
T3_asi_reg_rd_208:
	mov	0x3c8, %r14
	.word 0xf8db84a0  ! 4039: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf4356119  ! 4040: STH_I	sth	%r26, [%r21 + 0x0119]
	.word 0xbb353001  ! 4042: SRLX_I	srlx	%r20, 0x0001, %r29
cpu_intr_3_313:
	setx	0x3e0125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_314:
	setx	0x3e0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_315:
	setx	0x3d0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf4202d  ! 4049: STXA_I	stxa	%r29, [%r16 + 0x002d] %asi
	.word 0xf02d4000  ! 4050: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xbab420ae  ! 4052: SUBCcc_I	orncc 	%r16, 0x00ae, %r29
T3_asi_reg_rd_209:
	mov	0x2d, %r14
	.word 0xfcdb8e40  ! 4059: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 16)
	.word 0xf8b4a074  ! 4061: STHA_I	stha	%r28, [%r18 + 0x0074] %asi
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_316:
	setx	0x3013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf6a560c6  ! 4067: STWA_I	stwa	%r27, [%r21 + 0x00c6] %asi
	.word 0xb6bd614e  ! 4068: XNORcc_I	xnorcc 	%r21, 0x014e, %r27
T3_asi_reg_wr_179:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 4071: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_317:
	setx	0x3f003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_318:
	setx	0x3c030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_180:
	mov	0x10, %r14
	.word 0xf8f38e40  ! 4075: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf4356009  ! 4076: STH_I	sth	%r26, [%r21 + 0x0009]
	.word 0xf8250000  ! 4077: STW_R	stw	%r28, [%r20 + %r0]
T3_asi_reg_wr_181:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 4078: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 28)
	.word 0xf4258000  ! 4083: STW_R	stw	%r26, [%r22 + %r0]
T3_asi_reg_wr_182:
	mov	0x32, %r14
	.word 0xf6f38400  ! 4084: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf8a42006  ! 4086: STWA_I	stwa	%r28, [%r16 + 0x0006] %asi
T3_asi_reg_wr_183:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 4087: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_319:
	setx	0x3e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_184:
	mov	0x22, %r14
	.word 0xf6f38e80  ! 4089: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb0c5e0c5  ! 4090: ADDCcc_I	addccc 	%r23, 0x00c5, %r24
	.word 0xfeb50020  ! 4092: STHA_R	stha	%r31, [%r20 + %r0] 0x01
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_320:
	setx	0x3e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe244000  ! 4095: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xfab5c020  ! 4096: STHA_R	stha	%r29, [%r23 + %r0] 0x01
cpu_intr_3_321:
	setx	0x3c0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c6058  ! 4098: STB_I	stb	%r24, [%r17 + 0x0058]
	.word 0xb41d2034  ! 4099: XOR_I	xor 	%r20, 0x0034, %r26
cpu_intr_3_322:
	setx	0x410025, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_323:
	setx	0x430130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, e)
	.word 0xf63560c1  ! 4113: STH_I	sth	%r27, [%r21 + 0x00c1]
	.word 0xfc75e14f  ! 4116: STX_I	stx	%r30, [%r23 + 0x014f]
	.word 0xbe35605c  ! 4117: SUBC_I	orn 	%r21, 0x005c, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4b460a2  ! 4120: STHA_I	stha	%r26, [%r17 + 0x00a2] %asi
T3_asi_reg_wr_185:
	mov	0x3c1, %r14
	.word 0xf0f38400  ! 4122: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 1)
	.word 0xf02cc000  ! 4125: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xba95a024  ! 4126: ORcc_I	orcc 	%r22, 0x0024, %r29
	.word 0xf2748000  ! 4127: STX_R	stx	%r25, [%r18 + %r0]
T3_asi_reg_rd_210:
	mov	0x31, %r14
	.word 0xfadb89e0  ! 4129: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 2a)
	ta	T_CHANGE_TO_TL1
	.word 0xfa248000  ! 4141: STW_R	stw	%r29, [%r18 + %r0]
T3_asi_reg_rd_211:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 4142: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_324:
	setx	0x420225, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_212:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb6452150  ! 4149: ADDC_I	addc 	%r20, 0x0150, %r27
	.word 0xbd50c000  ! 4151: RDPR_TT	rdpr	%tt, %r30
	.word 0xf6f5e121  ! 4153: STXA_I	stxa	%r27, [%r23 + 0x0121] %asi
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_213:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 4156: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_325:
	setx	0x430039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bc0000  ! 4161: XNORcc_R	xnorcc 	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_214:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 4165: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_215:
	mov	0xd, %r14
	.word 0xfcdb8e60  ! 4168: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf22c8000  ! 4172: STB_R	stb	%r25, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x8594e0bd  ! 4175: WRPR_TSTATE_I	wrpr	%r19, 0x00bd, %tstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_326:
	setx	0x420226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 30)
	.word 0xf234a1cc  ! 4187: STH_I	sth	%r25, [%r18 + 0x01cc]
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_216:
	mov	0x1d, %r14
	.word 0xf2db89e0  ! 4194: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_rd_217:
	mov	0x0, %r14
	.word 0xf8db8e40  ! 4195: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_327:
	setx	0x42021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6242187  ! 4199: STW_I	stw	%r27, [%r16 + 0x0187]
cpu_intr_3_328:
	setx	0x420129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_329:
	setx	0x41023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a58020  ! 4205: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
cpu_intr_3_330:
	setx	0x430136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32c4000  ! 4214: SLL_R	sll 	%r17, %r0, %r25
	.word 0xfeac21fb  ! 4217: STBA_I	stba	%r31, [%r16 + 0x01fb] %asi
	.word 0xf2a4c020  ! 4219: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
	.word 0xb4a40000  ! 4221: SUBcc_R	subcc 	%r16, %r0, %r26
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 39)
	.word 0xf2ade0b2  ! 4225: STBA_I	stba	%r25, [%r23 + 0x00b2] %asi
T3_asi_reg_rd_218:
	mov	0x3c8, %r14
	.word 0xf2db8e60  ! 4226: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_wr_186:
	mov	0x3c8, %r14
	.word 0xf8f38400  ! 4227: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf8f56126  ! 4228: STXA_I	stxa	%r28, [%r21 + 0x0126] %asi
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_187:
	mov	0x2d, %r14
	.word 0xfcf38e60  ! 4232: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfc7521ab  ! 4233: STX_I	stx	%r30, [%r20 + 0x01ab]
	.word 0xfe75614f  ! 4237: STX_I	stx	%r31, [%r21 + 0x014f]
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, c)
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 9)
	.word 0xf8b50020  ! 4241: STHA_R	stha	%r28, [%r20 + %r0] 0x01
	.word 0xfcb4e026  ! 4243: STHA_I	stha	%r30, [%r19 + 0x0026] %asi
	.word 0xfc244000  ! 4245: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xfaf460ed  ! 4246: STXA_I	stxa	%r29, [%r17 + 0x00ed] %asi
	.word 0xf235616c  ! 4247: STH_I	sth	%r25, [%r21 + 0x016c]
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf4acc020  ! 4250: STBA_R	stba	%r26, [%r19 + %r0] 0x01
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfe7461e4  ! 4257: STX_I	stx	%r31, [%r17 + 0x01e4]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_331:
	setx	0x400119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf224a0d1  ! 4267: STW_I	stw	%r25, [%r18 + 0x00d1]
T3_asi_reg_wr_188:
	mov	0x33, %r14
	.word 0xf6f389e0  ! 4268: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfc2da1e8  ! 4271: STB_I	stb	%r30, [%r22 + 0x01e8]
	.word 0xf8a460f4  ! 4273: STWA_I	stwa	%r28, [%r17 + 0x00f4] %asi
	.word 0xf4a5e05e  ! 4277: STWA_I	stwa	%r26, [%r23 + 0x005e] %asi
cpu_intr_3_332:
	setx	0x40031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82cc000  ! 4280: STB_R	stb	%r28, [%r19 + %r0]
T3_asi_reg_wr_189:
	mov	0xa, %r14
	.word 0xf0f38400  ! 4282: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb4948000  ! 4283: ORcc_R	orcc 	%r18, %r0, %r26
T3_asi_reg_wr_190:
	mov	0x28, %r14
	.word 0xf4f38e40  ! 4284: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_219:
	mov	0x1e, %r14
	.word 0xfedb89e0  ! 4287: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfc74606f  ! 4288: STX_I	stx	%r30, [%r17 + 0x006f]
T3_asi_reg_wr_191:
	mov	0x2d, %r14
	.word 0xf2f38e40  ! 4289: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f88  ! 4291: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f88, %hpstate
cpu_intr_3_333:
	setx	0x410238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_334:
	setx	0x420009, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_192:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 4296: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb80d60c6  ! 4298: AND_I	and 	%r21, 0x00c6, %r28
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_193:
	mov	0x3c5, %r14
	.word 0xfef38e80  ! 4303: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_wr_194:
	mov	0x15, %r14
	.word 0xfcf38400  ! 4304: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf274c000  ! 4305: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf4b40020  ! 4306: STHA_R	stha	%r26, [%r16 + %r0] 0x01
	.word 0xf2ade055  ! 4307: STBA_I	stba	%r25, [%r23 + 0x0055] %asi
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, c)
	.word 0xf4ac0020  ! 4309: STBA_R	stba	%r26, [%r16 + %r0] 0x01
	.word 0xf0250000  ! 4312: STW_R	stw	%r24, [%r20 + %r0]
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_195:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 4319: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbec4e0d9  ! 4326: ADDCcc_I	addccc 	%r19, 0x00d9, %r31
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 2f)
	.word 0xba946070  ! 4329: ORcc_I	orcc 	%r17, 0x0070, %r29
cpu_intr_3_335:
	setx	0x410225, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_220:
	mov	0x3c0, %r14
	.word 0xf2db8400  ! 4332: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf62c2091  ! 4333: STB_I	stb	%r27, [%r16 + 0x0091]
	.word 0xf424a173  ! 4334: STW_I	stw	%r26, [%r18 + 0x0173]
T3_asi_reg_wr_196:
	mov	0xd, %r14
	.word 0xfcf384a0  ! 4337: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf835c000  ! 4340: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xf42ca1f8  ! 4341: STB_I	stb	%r26, [%r18 + 0x01f8]
	ta	T_CHANGE_TO_TL1
	.word 0xf8a56078  ! 4347: STWA_I	stwa	%r28, [%r21 + 0x0078] %asi
	.word 0xfaa54020  ! 4349: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
T3_asi_reg_rd_221:
	mov	0x17, %r14
	.word 0xfcdb8e80  ! 4353: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_222:
	mov	0x24, %r14
	.word 0xf4db8e40  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_197:
	mov	0x2c, %r14
	.word 0xfaf384a0  ! 4358: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	.word 0xfa750000  ! 4363: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xbe8ce0f5  ! 4364: ANDcc_I	andcc 	%r19, 0x00f5, %r31
cpu_intr_3_336:
	setx	0x41010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, d)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_198:
	mov	0x0, %r14
	.word 0xfcf38e80  ! 4370: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf034a0d5  ! 4372: STH_I	sth	%r24, [%r18 + 0x00d5]
	.word 0xfe75c000  ! 4378: STX_R	stx	%r31, [%r23 + %r0]
T3_asi_reg_wr_199:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 4380: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T3_asi_reg_rd_223:
	mov	0x3c7, %r14
	.word 0xfcdb89e0  ! 4381: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982f80  ! 4383: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f80, %hpstate
	.word 0xfca54020  ! 4384: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
T3_asi_reg_wr_200:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 4387: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf8748000  ! 4388: STX_R	stx	%r28, [%r18 + %r0]
T3_asi_reg_rd_224:
	mov	0x3c8, %r14
	.word 0xf4db8e60  ! 4389: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf2ad0020  ! 4390: STBA_R	stba	%r25, [%r20 + %r0] 0x01
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb63cc000  ! 4396: XNOR_R	xnor 	%r19, %r0, %r27
	.word 0xf424c000  ! 4397: STW_R	stw	%r26, [%r19 + %r0]
T3_asi_reg_rd_225:
	mov	0x2f, %r14
	.word 0xfcdb84a0  ! 4401: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_337:
	setx	0x400038, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_226:
	mov	0x3c8, %r14
	.word 0xf6db84a0  ! 4407: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 19)
	.word 0xf2b5c020  ! 4414: STHA_R	stha	%r25, [%r23 + %r0] 0x01
cpu_intr_3_338:
	setx	0x40011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_339:
	setx	0x420214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2ca06c  ! 4417: STB_I	stb	%r29, [%r18 + 0x006c]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3510000  ! 4422: RDPR_TICK	rdpr	%tick, %r25
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfa354000  ! 4427: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xfea4c020  ! 4428: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
	.word 0xf0740000  ! 4430: STX_R	stx	%r24, [%r16 + %r0]
cpu_intr_3_340:
	setx	0x430226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 12)
	.word 0xf425206d  ! 4436: STW_I	stw	%r26, [%r20 + 0x006d]
	.word 0xb2a50000  ! 4439: SUBcc_R	subcc 	%r20, %r0, %r25
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983882  ! 4440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1882, %hpstate
cpu_intr_3_341:
	setx	0x430305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 39)
	.word 0xfa258000  ! 4448: STW_R	stw	%r29, [%r22 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf02d8000  ! 4451: STB_R	stb	%r24, [%r22 + %r0]
T3_asi_reg_rd_227:
	mov	0x30, %r14
	.word 0xf4db89e0  ! 4453: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfa350000  ! 4454: STH_R	sth	%r29, [%r20 + %r0]
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 9)
	.word 0xb41cc000  ! 4458: XOR_R	xor 	%r19, %r0, %r26
	.word 0xfa75e01f  ! 4460: STX_I	stx	%r29, [%r23 + 0x001f]
cpu_intr_3_342:
	setx	0x43030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_343:
	setx	0x40010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 1)
	.word 0xa1902000  ! 4469: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xf6a58020  ! 4471: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xf8a56054  ! 4472: STWA_I	stwa	%r28, [%r21 + 0x0054] %asi
T3_asi_reg_wr_201:
	mov	0x36, %r14
	.word 0xf6f38e80  ! 4473: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb2a58000  ! 4475: SUBcc_R	subcc 	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_228:
	mov	0xd, %r14
	.word 0xfcdb89e0  ! 4479: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfc352123  ! 4481: STH_I	sth	%r30, [%r20 + 0x0123]
	.word 0xbf344000  ! 4482: SRL_R	srl 	%r17, %r0, %r31
	.word 0xf2b420b8  ! 4484: STHA_I	stha	%r25, [%r16 + 0x00b8] %asi
T3_asi_reg_rd_229:
	mov	0x5, %r14
	.word 0xf4db8e40  ! 4485: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf8748000  ! 4488: STX_R	stx	%r28, [%r18 + %r0]
cpu_intr_3_344:
	setx	0x400331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 4492: MOVcc_I	<illegal instruction>
T3_asi_reg_wr_202:
	mov	0x5, %r14
	.word 0xf2f38e40  ! 4494: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb68c4000  ! 4501: ANDcc_R	andcc 	%r17, %r0, %r27
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b90  ! 4502: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b90, %hpstate
cpu_intr_3_345:
	setx	0x400223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_203:
	mov	0x36, %r14
	.word 0xfef384a0  ! 4514: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb73cb001  ! 4515: SRAX_I	srax	%r18, 0x0001, %r27
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_230:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 4518: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_346:
	setx	0x400315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_347:
	setx	0x400322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75e009  ! 4522: STX_I	stx	%r30, [%r23 + 0x0009]
	.word 0xb4350000  ! 4527: SUBC_R	orn 	%r20, %r0, %r26
	.word 0xf03521c3  ! 4532: STH_I	sth	%r24, [%r20 + 0x01c3]
cpu_intr_3_348:
	setx	0x420206, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_204:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 4536: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfaa4e023  ! 4537: STWA_I	stwa	%r29, [%r19 + 0x0023] %asi
	.word 0xf234e044  ! 4539: STH_I	sth	%r25, [%r19 + 0x0044]
cpu_intr_3_349:
	setx	0x410323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_350:
	setx	0x42011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0acc020  ! 4546: STBA_R	stba	%r24, [%r19 + %r0] 0x01
T3_asi_reg_wr_205:
	mov	0x1b, %r14
	.word 0xfcf389e0  ! 4549: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb6c4c000  ! 4550: ADDCcc_R	addccc 	%r19, %r0, %r27
	.word 0xb2acc000  ! 4551: ANDNcc_R	andncc 	%r19, %r0, %r25
	.word 0xf835a062  ! 4553: STH_I	sth	%r28, [%r22 + 0x0062]
T3_asi_reg_wr_206:
	mov	0x3c2, %r14
	.word 0xf4f38e80  ! 4556: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_3_351:
	setx	0x46000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf4e0a6  ! 4564: STXA_I	stxa	%r29, [%r19 + 0x00a6] %asi
	.word 0xf2b4c020  ! 4568: STHA_R	stha	%r25, [%r19 + %r0] 0x01
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 33)
	.word 0xfe2d4000  ! 4571: STB_R	stb	%r31, [%r21 + %r0]
cpu_intr_3_352:
	setx	0x440125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf035c000  ! 4575: STH_R	sth	%r24, [%r23 + %r0]
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983b98  ! 4576: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b98, %hpstate
	.word 0xfab42163  ! 4577: STHA_I	stha	%r29, [%r16 + 0x0163] %asi
T3_asi_reg_wr_207:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 4579: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf8b4609f  ! 4580: STHA_I	stha	%r28, [%r17 + 0x009f] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2b561e1  ! 4584: STHA_I	stha	%r25, [%r21 + 0x01e1] %asi
cpu_intr_3_353:
	setx	0x45013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa348000  ! 4590: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xfc2421b5  ! 4595: STW_I	stw	%r30, [%r16 + 0x01b5]
T3_asi_reg_wr_208:
	mov	0x3c2, %r14
	.word 0xfcf38e60  ! 4596: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
cpu_intr_3_354:
	setx	0x470210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8256155  ! 4600: STW_I	stw	%r28, [%r21 + 0x0155]
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_355:
	setx	0x460234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_356:
	setx	0x460231, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_231:
	mov	0x3c5, %r14
	.word 0xf4db89e0  ! 4605: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf62c4000  ! 4609: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf424614a  ! 4610: STW_I	stw	%r26, [%r17 + 0x014a]
	.word 0xf2a44020  ! 4612: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
T3_asi_reg_wr_209:
	mov	0x10, %r14
	.word 0xfaf38e60  ! 4614: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_3_357:
	setx	0x440229, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_210:
	mov	0x23, %r14
	.word 0xf0f389e0  ! 4618: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_wr_211:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 4622: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_3_358:
	setx	0x46033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_359:
	setx	0x450206, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_232:
	mov	0xa, %r14
	.word 0xf2db89e0  ! 4627: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_3_360:
	setx	0x440233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77c2401  ! 4632: MOVR_I	movre	%r16, 0x1, %r27
cpu_intr_3_361:
	setx	0x47012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 12)
	.word 0xfc250000  ! 4640: STW_R	stw	%r30, [%r20 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_212:
	mov	0x4, %r14
	.word 0xfef38400  ! 4642: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf2250000  ! 4643: STW_R	stw	%r25, [%r20 + %r0]
cpu_intr_3_362:
	setx	0x450025, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_233:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 4648: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf6b50020  ! 4649: STHA_R	stha	%r27, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfca54020  ! 4652: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	.word 0xfaace153  ! 4656: STBA_I	stba	%r29, [%r19 + 0x0153] %asi
T3_asi_reg_wr_213:
	mov	0x2b, %r14
	.word 0xf0f38e60  ! 4659: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_wr_214:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 4675: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb334c000  ! 4676: SRL_R	srl 	%r19, %r0, %r25
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_363:
	setx	0x47012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac60ed  ! 4682: STBA_I	stba	%r28, [%r17 + 0x00ed] %asi
cpu_intr_3_364:
	setx	0x46020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_365:
	setx	0x47023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb50020  ! 4691: STHA_R	stha	%r31, [%r20 + %r0] 0x01
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, a)
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_wr_215:
	mov	0xe, %r14
	.word 0xfcf389e0  ! 4696: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_rd_234:
	mov	0x38, %r14
	.word 0xf8db8e80  ! 4697: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_3_366:
	setx	0x47031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8754000  ! 4701: STX_R	stx	%r28, [%r21 + %r0]
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 32)
	.word 0xf8a4c020  ! 4704: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
T3_asi_reg_rd_235:
	mov	0x3c2, %r14
	.word 0xfcdb84a0  ! 4705: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_367:
	setx	0x450115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13d7001  ! 4709: SRAX_I	srax	%r21, 0x0001, %r24
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 2f)
	.word 0xbab54000  ! 4711: ORNcc_R	orncc 	%r21, %r0, %r29
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, d)
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 21)
	ta	T_CHANGE_NONHPRIV
	.word 0xf62c6157  ! 4718: STB_I	stb	%r27, [%r17 + 0x0157]
T3_asi_reg_wr_216:
	mov	0xa, %r14
	.word 0xf2f38e80  ! 4719: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb43de079  ! 4720: XNOR_I	xnor 	%r23, 0x0079, %r26
	.word 0xb1480000  ! 4721: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
T3_asi_reg_rd_236:
	mov	0x33, %r14
	.word 0xf6db8400  ! 4722: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_3_368:
	setx	0x450232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6256110  ! 4729: SUB_I	sub 	%r21, 0x0110, %r27
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_369:
	setx	0x470039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_370:
	setx	0x440034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe954000  ! 4737: ORcc_R	orcc 	%r21, %r0, %r31
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 37)
	.word 0xf434a00a  ! 4743: STH_I	sth	%r26, [%r18 + 0x000a]
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, c)
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f58  ! 4748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f58, %hpstate
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb9352001  ! 4753: SRL_I	srl 	%r20, 0x0001, %r28
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_371:
	setx	0x47032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac2115  ! 4762: STBA_I	stba	%r26, [%r16 + 0x0115] %asi
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 3e)
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 1)
	ta	T_CHANGE_NONHPRIV
	.word 0xfa344000  ! 4769: STH_R	sth	%r29, [%r17 + %r0]
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 37)
	.word 0xbe0d8000  ! 4778: AND_R	and 	%r22, %r0, %r31
	.word 0xfe244000  ! 4779: STW_R	stw	%r31, [%r17 + %r0]
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 28)
	.word 0xf8a50020  ! 4783: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
	.word 0xbd344000  ! 4784: SRL_R	srl 	%r17, %r0, %r30
	.word 0xf0f4200f  ! 4785: STXA_I	stxa	%r24, [%r16 + 0x000f] %asi
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 2f)
	.word 0xb41ca04d  ! 4790: XOR_I	xor 	%r18, 0x004d, %r26
	.word 0xfa35e0e8  ! 4791: STH_I	sth	%r29, [%r23 + 0x00e8]
	.word 0xbd540000  ! 4792: RDPR_GL	rdpr	%-, %r30
T3_asi_reg_wr_217:
	mov	0x6, %r14
	.word 0xf0f38e40  ! 4793: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_372:
	setx	0x470334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_373:
	setx	0x470312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3df001  ! 4802: SRAX_I	srax	%r23, 0x0001, %r29
	.word 0xf8b44020  ! 4803: STHA_R	stha	%r28, [%r17 + %r0] 0x01
T3_asi_reg_rd_237:
	mov	0x1e, %r14
	.word 0xf0db8400  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf074a0e0  ! 4806: STX_I	stx	%r24, [%r18 + 0x00e0]
T3_asi_reg_rd_238:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 4807: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf634a0e2  ! 4809: STH_I	sth	%r27, [%r18 + 0x00e2]
cpu_intr_3_374:
	setx	0x47022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_239:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 4811: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf6acc020  ! 4818: STBA_R	stba	%r27, [%r19 + %r0] 0x01
T3_asi_reg_wr_218:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 4820: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 28)
	.word 0xa1902001  ! 4824: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xf235a117  ! 4825: STH_I	sth	%r25, [%r22 + 0x0117]
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 8)
	.word 0xf4a54020  ! 4829: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
cpu_intr_3_375:
	setx	0x460322, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_219:
	mov	0x20, %r14
	.word 0xf2f38e60  ! 4836: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfcb40020  ! 4837: STHA_R	stha	%r30, [%r16 + %r0] 0x01
	.word 0xf834e0fb  ! 4838: STH_I	sth	%r28, [%r19 + 0x00fb]
	.word 0xf62d213d  ! 4839: STB_I	stb	%r27, [%r20 + 0x013d]
	ta	T_CHANGE_NONHPRIV
	.word 0xf624e161  ! 4845: STW_I	stw	%r27, [%r19 + 0x0161]
	.word 0xf02ca1ef  ! 4847: STB_I	stb	%r24, [%r18 + 0x01ef]
	.word 0xf6350000  ! 4854: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xf2adc020  ! 4857: STBA_R	stba	%r25, [%r23 + %r0] 0x01
T3_asi_reg_rd_240:
	mov	0x1b, %r14
	.word 0xfadb8e60  ! 4860: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982d10  ! 4861: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d10, %hpstate
cpu_intr_3_376:
	setx	0x470002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b44020  ! 4863: STHA_R	stha	%r24, [%r17 + %r0] 0x01
T3_asi_reg_rd_241:
	mov	0x21, %r14
	.word 0xf8db8e40  ! 4866: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf4ad610c  ! 4868: STBA_I	stba	%r26, [%r21 + 0x010c] %asi
cpu_intr_3_377:
	setx	0x45012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_378:
	setx	0x470220, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_220:
	mov	0x35, %r14
	.word 0xfef38e40  ! 4875: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983d88  ! 4876: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d88, %hpstate
T3_asi_reg_rd_242:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 4877: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_379:
	setx	0x470010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c58000  ! 4888: ADDCcc_R	addccc 	%r22, %r0, %r25
cpu_intr_3_380:
	setx	0x460239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a4c020  ! 4891: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
	.word 0xfe356121  ! 4892: STH_I	sth	%r31, [%r21 + 0x0121]
cpu_intr_3_381:
	setx	0x450120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53de001  ! 4895: SRA_I	sra 	%r23, 0x0001, %r26
iob_intr_3_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_396), 16, 16)) -> intp(3, 0, e)
	.word 0xf6754000  ! 4902: STX_R	stx	%r27, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf42d609e  ! 4905: STB_I	stb	%r26, [%r21 + 0x009e]
iob_intr_3_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_397), 16, 16)) -> intp(3, 0, 27)
	.word 0xf2ac0020  ! 4908: STBA_R	stba	%r25, [%r16 + %r0] 0x01
	.word 0xf0ad0020  ! 4909: STBA_R	stba	%r24, [%r20 + %r0] 0x01
T3_asi_reg_wr_221:
	mov	0x34, %r14
	.word 0xfcf389e0  ! 4915: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbebca1c3  ! 4916: XNORcc_I	xnorcc 	%r18, 0x01c3, %r31
	.word 0xbc1cc000  ! 4917: XOR_R	xor 	%r19, %r0, %r30
T3_asi_reg_wr_222:
	mov	0x20, %r14
	.word 0xf8f38e40  ! 4919: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_398), 16, 16)) -> intp(3, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_243:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 4926: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_399), 16, 16)) -> intp(3, 0, 5)
	.word 0xb824c000  ! 4928: SUB_R	sub 	%r19, %r0, %r28
	.word 0xfaada0b4  ! 4931: STBA_I	stba	%r29, [%r22 + 0x00b4] %asi
	.word 0xf8340000  ! 4932: STH_R	sth	%r28, [%r16 + %r0]
iob_intr_3_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_400), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_382:
	setx	0x440223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4240000  ! 4938: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xfea521fb  ! 4940: STWA_I	stwa	%r31, [%r20 + 0x01fb] %asi
	.word 0xf225c000  ! 4941: STW_R	stw	%r25, [%r23 + %r0]
cpu_intr_3_383:
	setx	0x450336, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_244:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 4944: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_245:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 4945: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_3_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_401), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_384:
	setx	0x20200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1c0000  ! 4948: XOR_R	xor 	%r16, %r0, %r29
	.word 0xf624e080  ! 4951: STW_I	stw	%r27, [%r19 + 0x0080]
cpu_intr_3_385:
	setx	0x460315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0344000  ! 4953: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xfaacc020  ! 4954: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b9a  ! 4957: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b9a, %hpstate
iob_intr_3_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_402), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_rd_246:
	mov	0x1e, %r14
	.word 0xf0db8400  ! 4962: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf02c21c7  ! 4963: STB_I	stb	%r24, [%r16 + 0x01c7]
iob_intr_3_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_403), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf6250000  ! 4968: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xf62c4000  ! 4970: STB_R	stb	%r27, [%r17 + %r0]
cpu_intr_3_386:
	setx	0x44002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_387:
	setx	0x45013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4a0fd  ! 4973: STHA_I	stha	%r29, [%r18 + 0x00fd] %asi
	.word 0xf8b44020  ! 4974: STHA_R	stha	%r28, [%r17 + %r0] 0x01
	.word 0xf02d2165  ! 4978: STB_I	stb	%r24, [%r20 + 0x0165]
	.word 0xfa350000  ! 4981: STH_R	sth	%r29, [%r20 + %r0]
T3_asi_reg_wr_223:
	mov	0xf, %r14
	.word 0xf8f38e40  ! 4982: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf43460fa  ! 4983: STH_I	sth	%r26, [%r17 + 0x00fa]
	ta	T_CHANGE_TO_TL0
	.word 0xf4258000  ! 4986: STW_R	stw	%r26, [%r22 + %r0]
T3_asi_reg_wr_224:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 4989: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_388:
	setx	0x460219, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_247:
	mov	0x1e, %r14
	.word 0xf0db84a0  ! 4992: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf6248000  ! 4994: STW_R	stw	%r27, [%r18 + %r0]
iob_intr_3_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_404), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_rd_248:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 4996: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_rd_249:
	mov	0x3c1, %r14
	.word 0xfadb84a0  ! 4997: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf2ad8020  ! 4998: STBA_R	stba	%r25, [%r22 + %r0] 0x01
iob_intr_3_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_405), 16, 16)) -> intp(3, 0, 12)
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
T2_asi_reg_wr_0:
	mov	0xa, %r14
	.word 0xf8f38e40  ! 1: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_0:
	setx	0x18000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf044e1db  ! 4: LDSW_I	ldsw	[%r19 + 0x01db], %r24
	.word 0xb8b44000  ! 7: SUBCcc_R	orncc 	%r17, %r0, %r28
	.word 0xfe4de1c1  ! 10: LDSB_I	ldsb	[%r23 + 0x01c1], %r31
	.word 0xf604e00d  ! 11: LDUW_I	lduw	[%r19 + 0x000d], %r27
	.word 0xa1902000  ! 12: WRPR_GL_I	wrpr	%r0, 0x0000, %-
T2_asi_reg_rd_0:
	mov	0x31, %r14
	.word 0xf4db8e40  ! 13: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_1:
	setx	0x1d0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4042076  ! 20: LDUW_I	lduw	[%r16 + 0x0076], %r26
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 17)
	.word 0xf45c4000  ! 28: LDX_R	ldx	[%r17 + %r0], %r26
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_wr_1:
	mov	0x1b, %r14
	.word 0xfcf38e40  ! 31: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb0ada195  ! 36: ANDNcc_I	andncc 	%r22, 0x0195, %r24
	.word 0xf05c8000  ! 37: LDX_R	ldx	[%r18 + %r0], %r24
cpu_intr_2_2:
	setx	0x1c031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc44e1cc  ! 40: LDSW_I	ldsw	[%r19 + 0x01cc], %r30
cpu_intr_2_3:
	setx	0x1e0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad58020  ! 45: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r29
cpu_intr_2_4:
	setx	0x1f0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60ce035  ! 50: LDUB_I	ldub	[%r19 + 0x0035], %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf0442134  ! 55: LDSW_I	ldsw	[%r16 + 0x0134], %r24
T2_asi_reg_wr_2:
	mov	0x21, %r14
	.word 0xf4f38e40  ! 57: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfc5561d5  ! 58: LDSH_I	ldsh	[%r21 + 0x01d5], %r30
T2_asi_reg_wr_3:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 59: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_1:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbabc8000  ! 61: XNORcc_R	xnorcc 	%r18, %r0, %r29
	.word 0x819560a2  ! 62: WRPR_TPC_I	wrpr	%r21, 0x00a2, %tpc
	.word 0xf2cdc020  ! 63: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r25
	.word 0xf895e038  ! 64: LDUHA_I	lduha	[%r23, + 0x0038] %asi, %r28
	.word 0xf4148000  ! 69: LDUH_R	lduh	[%r18 + %r0], %r26
T2_asi_reg_wr_4:
	mov	0x2, %r14
	.word 0xf2f384a0  ! 72: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 15)
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a90  ! 75: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a90, %hpstate
T2_asi_reg_rd_2:
	mov	0x23, %r14
	.word 0xfedb8e40  ! 77: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfcc5c020  ! 78: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r30
T2_asi_reg_wr_5:
	mov	0x17, %r14
	.word 0xf4f384a0  ! 79: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_5:
	setx	0x1f0135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa44e0fe  ! 90: LDSW_I	ldsw	[%r19 + 0x00fe], %r29
cpu_intr_2_6:
	setx	0x1f0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64ce125  ! 95: LDSB_I	ldsb	[%r19 + 0x0125], %r27
	.word 0xf40ce09c  ! 97: LDUB_I	ldub	[%r19 + 0x009c], %r26
cpu_intr_2_7:
	setx	0x1c011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88d20b0  ! 99: LDUBA_I	lduba	[%r20, + 0x00b0] %asi, %r28
cpu_intr_2_8:
	setx	0x1c0301, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_3:
	mov	0x26, %r14
	.word 0xfcdb8e60  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf6950020  ! 106: LDUHA_R	lduha	[%r20, %r0] 0x01, %r27
T2_asi_reg_rd_4:
	mov	0x18, %r14
	.word 0xf8db89e0  ! 108: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf25c2071  ! 115: LDX_I	ldx	[%r16 + 0x0071], %r25
	.word 0xf6c58020  ! 116: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r27
T2_asi_reg_rd_5:
	mov	0xb, %r14
	.word 0xf8db8e60  ! 117: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf28cc020  ! 119: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
	.word 0xb28d8000  ! 120: ANDcc_R	andcc 	%r22, %r0, %r25
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819829da  ! 122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09da, %hpstate
	.word 0xf01560ca  ! 123: LDUH_I	lduh	[%r21 + 0x00ca], %r24
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 0)
	.word 0xfadda077  ! 127: LDXA_I	ldxa	[%r22, + 0x0077] %asi, %r29
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_wr_6:
	mov	0x29, %r14
	.word 0xf0f38e60  ! 133: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf08c201f  ! 136: LDUBA_I	lduba	[%r16, + 0x001f] %asi, %r24
	.word 0xf815c000  ! 138: LDUH_R	lduh	[%r23 + %r0], %r28
	.word 0xbf7cc400  ! 142: MOVR_R	movre	%r19, %r0, %r31
	.word 0xfc0da1e2  ! 143: LDUB_I	ldub	[%r22 + 0x01e2], %r30
	.word 0xfe0d2002  ! 145: LDUB_I	ldub	[%r20 + 0x0002], %r31
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_rd_6:
	mov	0x10, %r14
	.word 0xfedb8e80  ! 150: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf2956035  ! 152: LDUHA_I	lduha	[%r21, + 0x0035] %asi, %r25
T2_asi_reg_rd_7:
	mov	0x3c1, %r14
	.word 0xf2db84a0  ! 154: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf415a1ee  ! 156: LDUH_I	lduh	[%r22 + 0x01ee], %r26
	.word 0xf0c54020  ! 157: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r24
cpu_intr_2_9:
	setx	0x1d0324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfc8ca18a  ! 162: LDUBA_I	lduba	[%r18, + 0x018a] %asi, %r30
T2_asi_reg_rd_8:
	mov	0x24, %r14
	.word 0xfcdb8e60  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_wr_7:
	mov	0x9, %r14
	.word 0xfcf38400  ! 170: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_wr_8:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 171: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfe14a1b2  ! 173: LDUH_I	lduh	[%r18 + 0x01b2], %r31
	.word 0xb2052008  ! 176: ADD_I	add 	%r20, 0x0008, %r25
	.word 0xfe15e16f  ! 179: LDUH_I	lduh	[%r23 + 0x016f], %r31
	.word 0xfe14c000  ! 180: LDUH_R	lduh	[%r19 + %r0], %r31
T2_asi_reg_wr_9:
	mov	0x14, %r14
	.word 0xfef38e40  ! 182: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf25d0000  ! 183: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xfe0c2079  ! 185: LDUB_I	ldub	[%r16 + 0x0079], %r31
T2_asi_reg_rd_9:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 187: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbb3dd000  ! 188: SRAX_R	srax	%r23, %r0, %r29
T2_asi_reg_wr_10:
	mov	0xe, %r14
	.word 0xf0f38e40  ! 189: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_10:
	mov	0x0, %r14
	.word 0xfcdb8400  ! 191: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T2_asi_reg_wr_11:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 193: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfed4e173  ! 196: LDSHA_I	ldsha	[%r19, + 0x0173] %asi, %r31
T2_asi_reg_wr_12:
	mov	0x4, %r14
	.word 0xfaf38e40  ! 197: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_10:
	setx	0x1d0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d6187  ! 201: LDUBA_I	lduba	[%r21, + 0x0187] %asi, %r31
cpu_intr_2_11:
	setx	0x1c012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_13:
	mov	0x5, %r14
	.word 0xf8f384a0  ! 208: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf414a056  ! 210: LDUH_I	lduh	[%r18 + 0x0056], %r26
	.word 0xf20c8000  ! 215: LDUB_R	ldub	[%r18 + %r0], %r25
T2_asi_reg_wr_14:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 216: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_rd_11:
	mov	0x3c1, %r14
	.word 0xf2db84a0  ! 217: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_12:
	setx	0x1d021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_13:
	setx	0x1d013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_14:
	setx	0x1d030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c50000  ! 223: ADDCcc_R	addccc 	%r20, %r0, %r27
T2_asi_reg_rd_12:
	mov	0x36, %r14
	.word 0xf0db8400  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_wr_15:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 231: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_16:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 236: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_15:
	setx	0x1e020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cca017  ! 238: LDSBA_I	ldsba	[%r18, + 0x0017] %asi, %r24
	.word 0xfe858020  ! 240: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r31
T2_asi_reg_wr_17:
	mov	0x3c4, %r14
	.word 0xf4f38e80  ! 242: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 1b)
	.word 0x9195a03b  ! 253: WRPR_PIL_I	wrpr	%r22, 0x003b, %pil
cpu_intr_2_16:
	setx	0x1c001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa55e051  ! 258: LDSH_I	ldsh	[%r23 + 0x0051], %r29
	.word 0xf80ca0da  ! 260: LDUB_I	ldub	[%r18 + 0x00da], %r28
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 30)
	.word 0xb2b42142  ! 262: SUBCcc_I	orncc 	%r16, 0x0142, %r25
cpu_intr_2_17:
	setx	0x1f0233, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_18:
	mov	0x2f, %r14
	.word 0xf2f38e40  ! 264: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf205c000  ! 267: LDUW_R	lduw	[%r23 + %r0], %r25
T2_asi_reg_rd_13:
	mov	0x2, %r14
	.word 0xfadb8e40  ! 270: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_19:
	mov	0x2e, %r14
	.word 0xf0f38400  ! 281: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf204c000  ! 282: LDUW_R	lduw	[%r19 + %r0], %r25
T2_asi_reg_wr_20:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 284: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf6544000  ! 285: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xf05421bd  ! 286: LDSH_I	ldsh	[%r16 + 0x01bd], %r24
cpu_intr_2_18:
	setx	0x1d0000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_19:
	setx	0x1f002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf04d8000  ! 295: LDSB_R	ldsb	[%r22 + %r0], %r24
T2_asi_reg_wr_21:
	mov	0x8, %r14
	.word 0xfef38400  ! 296: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_rd_14:
	mov	0x18, %r14
	.word 0xf6db8e80  ! 297: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf60c618e  ! 302: LDUB_I	ldub	[%r17 + 0x018e], %r27
cpu_intr_2_20:
	setx	0x1f021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc45c000  ! 304: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xf48cc020  ! 305: LDUBA_R	lduba	[%r19, %r0] 0x01, %r26
T2_asi_reg_wr_22:
	mov	0xc, %r14
	.word 0xf6f38e60  ! 307: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_15:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 312: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_21:
	setx	0x1c012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4944020  ! 316: LDUHA_R	lduha	[%r17, %r0] 0x01, %r26
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_22:
	setx	0x1f0114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_23:
	setx	0x1d0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf2058000  ! 321: LDUW_R	lduw	[%r22 + %r0], %r25
cpu_intr_2_24:
	setx	0x1c0300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_25:
	setx	0x1d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_16:
	mov	0x3c1, %r14
	.word 0xfadb8e60  ! 334: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 6)
	.word 0xf8cd615f  ! 336: LDSBA_I	ldsba	[%r21, + 0x015f] %asi, %r28
T2_asi_reg_rd_17:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 337: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_26:
	setx	0x1d0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c4201c  ! 345: LDSWA_I	ldswa	[%r16, + 0x001c] %asi, %r24
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_23:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 349: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfcd44020  ! 350: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r30
	.word 0xb13df001  ! 353: SRAX_I	srax	%r23, 0x0001, %r24
	.word 0xb62d4000  ! 355: ANDN_R	andn 	%r21, %r0, %r27
cpu_intr_2_27:
	setx	0x1e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_28:
	setx	0x1f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6148000  ! 360: LDUH_R	lduh	[%r18 + %r0], %r27
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, e)
	ta	T_CHANGE_HPRIV
	.word 0xfe54214a  ! 368: LDSH_I	ldsh	[%r16 + 0x014a], %r31
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983cc8  ! 370: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc8, %hpstate
T2_asi_reg_wr_24:
	mov	0x35, %r14
	.word 0xf2f384a0  ! 374: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 6)
	.word 0xf6d560d1  ! 383: LDSHA_I	ldsha	[%r21, + 0x00d1] %asi, %r27
	.word 0xf2c40020  ! 385: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r25
	.word 0xfe4d0000  ! 387: LDSB_R	ldsb	[%r20 + %r0], %r31
cpu_intr_2_29:
	setx	0x1c0106, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_18:
	mov	0x1c, %r14
	.word 0xf0db89e0  ! 395: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_rd_19:
	mov	0x1, %r14
	.word 0xf4db8400  ! 399: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_wr_25:
	mov	0x1b, %r14
	.word 0xfaf389e0  ! 400: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_30:
	setx	0x1e0339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf4d4c020  ! 406: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r26
	.word 0x8794e0f7  ! 409: WRPR_TT_I	wrpr	%r19, 0x00f7, %tt
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
	.word 0xf05ce0bf  ! 413: LDX_I	ldx	[%r19 + 0x00bf], %r24
	.word 0xf4dd610b  ! 414: LDXA_I	ldxa	[%r21, + 0x010b] %asi, %r26
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_20:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 417: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_31:
	setx	0x1d0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 425: RDPR_TICK	<illegal instruction>
	.word 0x919421bc  ! 427: WRPR_PIL_I	wrpr	%r16, 0x01bc, %pil
	.word 0xb0354000  ! 430: SUBC_R	orn 	%r21, %r0, %r24
	.word 0xf6950020  ! 433: LDUHA_R	lduha	[%r20, %r0] 0x01, %r27
T2_asi_reg_rd_21:
	mov	0x17, %r14
	.word 0xf0db8e80  ! 435: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfa5d0000  ! 436: LDX_R	ldx	[%r20 + %r0], %r29
	.word 0xf0c5c020  ! 437: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 24)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf88561a2  ! 443: LDUWA_I	lduwa	[%r21, + 0x01a2] %asi, %r28
	.word 0xf6d40020  ! 444: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r27
	.word 0xf20ca1bb  ! 448: LDUB_I	ldub	[%r18 + 0x01bb], %r25
	.word 0xf24c0000  ! 449: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xfecd4020  ! 451: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
	.word 0xf05de04a  ! 453: LDX_I	ldx	[%r23 + 0x004a], %r24
	.word 0xfe85219c  ! 455: LDUWA_I	lduwa	[%r20, + 0x019c] %asi, %r31
	.word 0xf44d4000  ! 457: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0xb4848000  ! 460: ADDcc_R	addcc 	%r18, %r0, %r26
	.word 0xf245608b  ! 465: LDSW_I	ldsw	[%r21 + 0x008b], %r25
	.word 0xf094c020  ! 467: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 9)
	.word 0xfecd8020  ! 469: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r31
	.word 0xfa4d8000  ! 470: LDSB_R	ldsb	[%r22 + %r0], %r29
T2_asi_reg_rd_22:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 471: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_wr_26:
	mov	0x38, %r14
	.word 0xf4f384a0  ! 473: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 35)
	.word 0xb035e098  ! 481: ORN_I	orn 	%r23, 0x0098, %r24
	.word 0xf6540000  ! 482: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0xb4ac8000  ! 483: ANDNcc_R	andncc 	%r18, %r0, %r26
cpu_intr_2_32:
	setx	0x220334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_33:
	setx	0x230116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2442049  ! 488: LDSW_I	ldsw	[%r16 + 0x0049], %r25
	.word 0xfac40020  ! 489: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r29
T2_asi_reg_rd_23:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 490: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982880  ! 492: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0880, %hpstate
	.word 0xf8844020  ! 495: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
	.word 0xfa8da1e2  ! 500: LDUBA_I	lduba	[%r22, + 0x01e2] %asi, %r29
	.word 0xb2c4a11c  ! 501: ADDCcc_I	addccc 	%r18, 0x011c, %r25
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982d9a  ! 503: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9a, %hpstate
	.word 0xf24c8000  ! 504: LDSB_R	ldsb	[%r18 + %r0], %r25
T2_asi_reg_rd_24:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 508: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf6dca1d9  ! 511: LDXA_I	ldxa	[%r18, + 0x01d9] %asi, %r27
T2_asi_reg_wr_27:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 512: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfa844020  ! 513: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r29
T2_asi_reg_rd_25:
	mov	0x17, %r14
	.word 0xf4db8e40  ! 515: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_34:
	setx	0x210108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_35:
	setx	0x230327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 25)
	.word 0xf29460ce  ! 527: LDUHA_I	lduha	[%r17, + 0x00ce] %asi, %r25
cpu_intr_2_36:
	setx	0x20031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc044000  ! 532: LDUW_R	lduw	[%r17 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_26:
	mov	0x11, %r14
	.word 0xf0db8e60  ! 534: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf805e1dd  ! 537: LDUW_I	lduw	[%r23 + 0x01dd], %r28
cpu_intr_2_37:
	setx	0x210221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_38:
	setx	0x22032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf604c000  ! 541: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0xbabc4000  ! 546: XNORcc_R	xnorcc 	%r17, %r0, %r29
T2_asi_reg_rd_27:
	mov	0x4, %r14
	.word 0xfadb89e0  ! 547: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 14)
	.word 0xfe846002  ! 549: LDUWA_I	lduwa	[%r17, + 0x0002] %asi, %r31
T2_asi_reg_wr_28:
	mov	0x23, %r14
	.word 0xfef38400  ! 551: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb035c000  ! 552: ORN_R	orn 	%r23, %r0, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xf88ca0b2  ! 554: LDUBA_I	lduba	[%r18, + 0x00b2] %asi, %r28
	.word 0xf2c40020  ! 555: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r25
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_28:
	mov	0x3c4, %r14
	.word 0xfcdb8e60  ! 560: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_2_39:
	setx	0x22012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad5c020  ! 564: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r29
cpu_intr_2_40:
	setx	0x210338, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982cd8  ! 570: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd8, %hpstate
	.word 0xfa444000  ! 572: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xf28d0020  ! 573: LDUBA_R	lduba	[%r20, %r0] 0x01, %r25
	.word 0xb1641800  ! 574: MOVcc_R	<illegal instruction>
	.word 0xbb353001  ! 576: SRLX_I	srlx	%r20, 0x0001, %r29
	.word 0xf48ca1f2  ! 579: LDUBA_I	lduba	[%r18, + 0x01f2] %asi, %r26
	.word 0xf08da103  ! 581: LDUBA_I	lduba	[%r22, + 0x0103] %asi, %r24
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf45dc000  ! 586: LDX_R	ldx	[%r23 + %r0], %r26
cpu_intr_2_41:
	setx	0x200005, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf04ca059  ! 592: LDSB_I	ldsb	[%r18 + 0x0059], %r24
	.word 0xf44d0000  ! 593: LDSB_R	ldsb	[%r20 + %r0], %r26
T2_asi_reg_rd_29:
	mov	0x35, %r14
	.word 0xfedb89e0  ! 594: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_rd_30:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 595: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_2_42:
	setx	0x210302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_43:
	setx	0x210129, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982ec8  ! 603: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec8, %hpstate
	.word 0xf2040000  ! 605: LDUW_R	lduw	[%r16 + %r0], %r25
cpu_intr_2_44:
	setx	0x230336, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_29:
	mov	0x33, %r14
	.word 0xfaf38e40  ! 610: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb83560e0  ! 612: ORN_I	orn 	%r21, 0x00e0, %r28
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 28)
	.word 0xfcc44020  ! 621: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r30
T2_asi_reg_rd_31:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 622: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_45:
	setx	0x220333, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_30:
	mov	0x10, %r14
	.word 0xf0f38400  ! 626: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983c8a  ! 627: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c8a, %hpstate
T2_asi_reg_rd_32:
	mov	0x2, %r14
	.word 0xf8db8e40  ! 630: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_rd_33:
	mov	0x8, %r14
	.word 0xf2db89e0  ! 632: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbabda11d  ! 633: XNORcc_I	xnorcc 	%r22, 0x011d, %r29
cpu_intr_2_46:
	setx	0x23013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_47:
	setx	0x210312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_wr_31:
	mov	0x5, %r14
	.word 0xf2f384a0  ! 639: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf485e14e  ! 640: LDUWA_I	lduwa	[%r23, + 0x014e] %asi, %r26
	.word 0xf04d4000  ! 644: LDSB_R	ldsb	[%r21 + %r0], %r24
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a8a  ! 652: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a8a, %hpstate
T2_asi_reg_wr_32:
	mov	0x15, %r14
	.word 0xfef389e0  ! 654: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf8050000  ! 656: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xf64d60a3  ! 660: LDSB_I	ldsb	[%r21 + 0x00a3], %r27
	.word 0xf0d520dc  ! 662: LDSHA_I	ldsha	[%r20, + 0x00dc] %asi, %r24
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_rd_34:
	mov	0x36, %r14
	.word 0xf0db8e40  ! 665: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_33:
	mov	0xd, %r14
	.word 0xfaf38e80  ! 666: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
cpu_intr_2_48:
	setx	0x210106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_49:
	setx	0x200222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_wr_34:
	mov	0x16, %r14
	.word 0xfef384a0  ! 681: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf6cc4020  ! 682: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r27
	.word 0xfe0d20f9  ! 683: LDUB_I	ldub	[%r20 + 0x00f9], %r31
T2_asi_reg_wr_35:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 684: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf6856093  ! 690: LDUWA_I	lduwa	[%r21, + 0x0093] %asi, %r27
	.word 0xf81560e2  ! 693: LDUH_I	lduh	[%r21 + 0x00e2], %r28
	.word 0xbe9dc000  ! 696: XORcc_R	xorcc 	%r23, %r0, %r31
cpu_intr_2_50:
	setx	0x210008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_51:
	setx	0x200102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_52:
	setx	0x210110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 3a)
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819829c8  ! 704: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c8, %hpstate
	.word 0xbd504000  ! 708: RDPR_TNPC	<illegal instruction>
	.word 0xf4cc4020  ! 712: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r26
	.word 0xfe4dc000  ! 713: LDSB_R	ldsb	[%r23 + %r0], %r31
T2_asi_reg_wr_36:
	mov	0x13, %r14
	.word 0xfcf389e0  ! 715: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_35:
	mov	0x35, %r14
	.word 0xfadb8e60  ! 717: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 18)
	.word 0xf6458000  ! 720: LDSW_R	ldsw	[%r22 + %r0], %r27
T2_asi_reg_wr_37:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 721: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfa0ca034  ! 725: LDUB_I	ldub	[%r18 + 0x0034], %r29
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 3b)
	ta	T_CHANGE_TO_TL0
	.word 0xf2142056  ! 729: LDUH_I	lduh	[%r16 + 0x0056], %r25
	.word 0xf20cc000  ! 732: LDUB_R	ldub	[%r19 + %r0], %r25
cpu_intr_2_53:
	setx	0x210107, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_36:
	mov	0x2b, %r14
	.word 0xf6db8e40  ! 735: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_37:
	mov	0x22, %r14
	.word 0xf8db84a0  ! 740: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_54:
	setx	0x200300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf054a053  ! 746: LDSH_I	ldsh	[%r18 + 0x0053], %r24
	.word 0xf2554000  ! 752: LDSH_R	ldsh	[%r21 + %r0], %r25
cpu_intr_2_55:
	setx	0x230334, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_38:
	mov	0x2f, %r14
	.word 0xf4f38e40  ! 755: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf6850020  ! 756: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r27
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_56:
	setx	0x210320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_57:
	setx	0x210112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 3a)
	ta	T_CHANGE_NONHPRIV
	.word 0xb485a0ed  ! 768: ADDcc_I	addcc 	%r22, 0x00ed, %r26
T2_asi_reg_wr_39:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 770: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbe95e1cb  ! 771: ORcc_I	orcc 	%r23, 0x01cb, %r31
cpu_intr_2_58:
	setx	0x220027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2056072  ! 776: LDUW_I	lduw	[%r21 + 0x0072], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_38:
	mov	0x10, %r14
	.word 0xf8db89e0  ! 778: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, d)
	.word 0xfa04e077  ! 781: LDUW_I	lduw	[%r19 + 0x0077], %r29
cpu_intr_2_59:
	setx	0x23002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_39:
	mov	0x3c6, %r14
	.word 0xf8db89e0  ! 783: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_wr_40:
	mov	0x17, %r14
	.word 0xf0f38e60  ! 785: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 18)
	.word 0xfc050000  ! 787: LDUW_R	lduw	[%r20 + %r0], %r30
T2_asi_reg_rd_40:
	mov	0x26, %r14
	.word 0xf2db8e40  ! 788: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_60:
	setx	0x220324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_61:
	setx	0x230321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_62:
	setx	0x20013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3352001  ! 797: SRL_I	srl 	%r20, 0x0001, %r25
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 32)
	.word 0xf28da0d2  ! 806: LDUBA_I	lduba	[%r22, + 0x00d2] %asi, %r25
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982e10  ! 807: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e10, %hpstate
	.word 0xb00c0000  ! 808: AND_R	and 	%r16, %r0, %r24
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_41:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 812: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_63:
	setx	0x21010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe1420c0  ! 816: LDUH_I	lduh	[%r16 + 0x00c0], %r31
	.word 0xfc848020  ! 817: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r30
	.word 0xbb641800  ! 821: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0xb49ca066  ! 827: XORcc_I	xorcc 	%r18, 0x0066, %r26
	.word 0xfcd48020  ! 828: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r30
cpu_intr_2_64:
	setx	0x22023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_65:
	setx	0x220006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc452144  ! 834: ADDC_I	addc 	%r20, 0x0144, %r30
T2_asi_reg_rd_42:
	mov	0x29, %r14
	.word 0xf2db84a0  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf8048000  ! 841: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xf60c8000  ! 842: LDUB_R	ldub	[%r18 + %r0], %r27
	.word 0xb0350000  ! 843: ORN_R	orn 	%r20, %r0, %r24
T2_asi_reg_wr_41:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 845: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_66:
	setx	0x23023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_43:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 849: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_44:
	mov	0xc, %r14
	.word 0xfedb8e40  ! 852: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfe14e1d0  ! 853: LDUH_I	lduh	[%r19 + 0x01d0], %r31
cpu_intr_2_67:
	setx	0x230328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d5e10c  ! 856: LDSHA_I	ldsha	[%r23, + 0x010c] %asi, %r25
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 12)
	.word 0xfc45e116  ! 861: LDSW_I	ldsw	[%r23 + 0x0116], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf604a0d3  ! 865: LDUW_I	lduw	[%r18 + 0x00d3], %r27
	.word 0xfa4c8000  ! 868: LDSB_R	ldsb	[%r18 + %r0], %r29
cpu_intr_2_68:
	setx	0x220102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6948020  ! 870: LDUHA_R	lduha	[%r18, %r0] 0x01, %r27
T2_asi_reg_rd_45:
	mov	0x18, %r14
	.word 0xfedb84a0  ! 871: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_wr_42:
	mov	0x30, %r14
	.word 0xfcf389e0  ! 872: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfad48020  ! 874: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r29
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 38)
	.word 0xf8d420f3  ! 879: LDSHA_I	ldsha	[%r16, + 0x00f3] %asi, %r28
	.word 0xb015a016  ! 881: OR_I	or 	%r22, 0x0016, %r24
cpu_intr_2_69:
	setx	0x230223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_70:
	setx	0x220220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_71:
	setx	0x210111, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_43:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 890: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_44:
	mov	0x2a, %r14
	.word 0xfaf38e40  ! 895: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 0)
	.word 0xf4446064  ! 898: LDSW_I	ldsw	[%r17 + 0x0064], %r26
	.word 0xf6d5a100  ! 902: LDSHA_I	ldsha	[%r22, + 0x0100] %asi, %r27
cpu_intr_2_72:
	setx	0x240119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 5)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 14)
	.word 0xf2058000  ! 910: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xfa0c618d  ! 911: LDUB_I	ldub	[%r17 + 0x018d], %r29
	.word 0xfccde00f  ! 912: LDSBA_I	ldsba	[%r23, + 0x000f] %asi, %r30
	.word 0xba954000  ! 914: ORcc_R	orcc 	%r21, %r0, %r29
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 6)
	.word 0xb4350000  ! 920: SUBC_R	orn 	%r20, %r0, %r26
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfc84611a  ! 923: LDUWA_I	lduwa	[%r17, + 0x011a] %asi, %r30
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, d)
	.word 0xfa15a1e8  ! 930: LDUH_I	lduh	[%r22 + 0x01e8], %r29
T2_asi_reg_rd_46:
	mov	0x9, %r14
	.word 0xfedb89e0  ! 931: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_2_73:
	setx	0x250317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 34)
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198399a  ! 937: WRHPR_HPSTATE_I	wrhpr	%r0, 0x199a, %hpstate
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 22)
	.word 0xfc0cc000  ! 941: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xf655e12a  ! 942: LDSH_I	ldsh	[%r23 + 0x012a], %r27
T2_asi_reg_wr_45:
	mov	0xd, %r14
	.word 0xf6f38e40  ! 944: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbd7d6401  ! 945: MOVR_I	movre	%r21, 0x1, %r30
	ta	T_CHANGE_TO_TL0
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf294c020  ! 951: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
cpu_intr_2_74:
	setx	0x24012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_75:
	setx	0x25012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 30)
	ta	T_CHANGE_TO_TL0
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_76:
	setx	0x27031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_46:
	mov	0x13, %r14
	.word 0xf2f38e60  ! 973: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_wr_47:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 975: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_48:
	mov	0x15, %r14
	.word 0xfaf38e60  ! 976: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf4146152  ! 978: LDUH_I	lduh	[%r17 + 0x0152], %r26
	.word 0xf6140000  ! 979: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xf085610c  ! 980: LDUWA_I	lduwa	[%r21, + 0x010c] %asi, %r24
	.word 0xf85da1b0  ! 982: LDX_I	ldx	[%r22 + 0x01b0], %r28
	.word 0xfc4d8000  ! 983: LDSB_R	ldsb	[%r22 + %r0], %r30
cpu_intr_2_77:
	setx	0x26012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198280a  ! 988: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080a, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xb68521be  ! 990: ADDcc_I	addcc 	%r20, 0x01be, %r27
T2_asi_reg_rd_47:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 992: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_78:
	setx	0x270315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_79:
	setx	0x240217, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xb3349000  ! 998: SRLX_R	srlx	%r18, %r0, %r25
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 1)
	.word 0xb4048000  ! 1001: ADD_R	add 	%r18, %r0, %r26
	.word 0xfe45a192  ! 1002: LDSW_I	ldsw	[%r22 + 0x0192], %r31
cpu_intr_2_80:
	setx	0x25012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe05a14f  ! 1005: ADD_I	add 	%r22, 0x014f, %r31
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_81:
	setx	0x240323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfa0d21e8  ! 1018: LDUB_I	ldub	[%r20 + 0x01e8], %r29
	ta	T_CHANGE_TO_TL0
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 28)
	.word 0xfa446072  ! 1027: LDSW_I	ldsw	[%r17 + 0x0072], %r29
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 1c)
	.word 0xb37d4400  ! 1030: MOVR_R	movre	%r21, %r0, %r25
	.word 0xf0054000  ! 1032: LDUW_R	lduw	[%r21 + %r0], %r24
cpu_intr_2_82:
	setx	0x240008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 20)
	.word 0xf24d8000  ! 1036: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xfc8ce049  ! 1038: LDUBA_I	lduba	[%r19, + 0x0049] %asi, %r30
	.word 0xf6dc6071  ! 1039: LDXA_I	ldxa	[%r17, + 0x0071] %asi, %r27
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, d)
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, d)
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 4)
	.word 0xfccd0020  ! 1045: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r30
	.word 0xf00d4000  ! 1048: LDUB_R	ldub	[%r21 + %r0], %r24
cpu_intr_2_83:
	setx	0x250232, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_48:
	mov	0x7, %r14
	.word 0xf6db89e0  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_84:
	setx	0x24031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_49:
	mov	0x12, %r14
	.word 0xf2f384a0  ! 1057: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
	.word 0xf08d0020  ! 1060: LDUBA_R	lduba	[%r20, %r0] 0x01, %r24
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_49:
	mov	0x24, %r14
	.word 0xf8db89e0  ! 1063: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbb643801  ! 1065: MOVcc_I	<illegal instruction>
T2_asi_reg_wr_50:
	mov	0x1b, %r14
	.word 0xfaf38e80  ! 1067: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfc5ca0ea  ! 1071: LDX_I	ldx	[%r18 + 0x00ea], %r30
cpu_intr_2_85:
	setx	0x26030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 2e)
	ta	T_CHANGE_TO_TL0
	.word 0xb63521e9  ! 1081: SUBC_I	orn 	%r20, 0x01e9, %r27
	.word 0xf8c421d4  ! 1083: LDSWA_I	ldswa	[%r16, + 0x01d4] %asi, %r28
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_51:
	mov	0x1, %r14
	.word 0xf8f38e60  ! 1087: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb32c3001  ! 1088: SLLX_I	sllx	%r16, 0x0001, %r25
cpu_intr_2_86:
	setx	0x26012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4852060  ! 1090: LDUWA_I	lduwa	[%r20, + 0x0060] %asi, %r26
	.word 0xf8d48020  ! 1092: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
cpu_intr_2_87:
	setx	0x270320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecd8020  ! 1095: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r31
	.word 0xf20d207d  ! 1097: LDUB_I	ldub	[%r20 + 0x007d], %r25
	.word 0xf8148000  ! 1101: LDUH_R	lduh	[%r18 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_88:
	setx	0x260038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8d8020  ! 1105: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
T2_asi_reg_wr_52:
	mov	0x1e, %r14
	.word 0xf0f38e60  ! 1107: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb33da001  ! 1108: SRA_I	sra 	%r22, 0x0001, %r25
	.word 0xfa5d0000  ! 1110: LDX_R	ldx	[%r20 + %r0], %r29
cpu_intr_2_89:
	setx	0x24033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb48561c8  ! 1112: ADDcc_I	addcc 	%r21, 0x01c8, %r26
T2_asi_reg_wr_53:
	mov	0x34, %r14
	.word 0xfcf38e60  ! 1115: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf6dc60f9  ! 1117: LDXA_I	ldxa	[%r17, + 0x00f9] %asi, %r27
T2_asi_reg_rd_50:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 1118: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf405c000  ! 1119: LDUW_R	lduw	[%r23 + %r0], %r26
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_90:
	setx	0x270132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45cc000  ! 1123: LDX_R	ldx	[%r19 + %r0], %r26
T2_asi_reg_wr_54:
	mov	0x0, %r14
	.word 0xfaf38400  ! 1124: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfe15e0f8  ! 1126: LDUH_I	lduh	[%r23 + 0x00f8], %r31
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 15)
	.word 0xf44d8000  ! 1131: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xf6546020  ! 1132: LDSH_I	ldsh	[%r17 + 0x0020], %r27
	.word 0xf004204b  ! 1134: LDUW_I	lduw	[%r16 + 0x004b], %r24
T2_asi_reg_rd_51:
	mov	0x1f, %r14
	.word 0xf2db8400  ! 1135: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 7)
	.word 0xf6050000  ! 1138: LDUW_R	lduw	[%r20 + %r0], %r27
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 28)
	.word 0xb1540000  ! 1140: RDPR_GL	<illegal instruction>
	.word 0xf054c000  ! 1148: LDSH_R	ldsh	[%r19 + %r0], %r24
T2_asi_reg_wr_55:
	mov	0x4, %r14
	.word 0xfcf384a0  ! 1150: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_rd_52:
	mov	0x9, %r14
	.word 0xf6db89e0  ! 1152: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_wr_56:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 1155: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xf284c020  ! 1161: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r25
T2_asi_reg_rd_53:
	mov	0x1c, %r14
	.word 0xfadb84a0  ! 1168: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_2_91:
	setx	0x250223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8158000  ! 1171: LDUH_R	lduh	[%r22 + %r0], %r28
T2_asi_reg_wr_57:
	mov	0x2d, %r14
	.word 0xf4f389e0  ! 1172: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf45c20b3  ! 1173: LDX_I	ldx	[%r16 + 0x00b3], %r26
cpu_intr_2_92:
	setx	0x25023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_rd_54:
	mov	0x24, %r14
	.word 0xf2db8e80  ! 1178: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_55:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 1181: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xf8d48020  ! 1183: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a82  ! 1184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a82, %hpstate
cpu_intr_2_93:
	setx	0x240024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_94:
	setx	0x250214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe152060  ! 1191: OR_I	or 	%r20, 0x0060, %r31
cpu_intr_2_95:
	setx	0x26031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_58:
	mov	0x33, %r14
	.word 0xf6f38e40  ! 1193: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_96:
	setx	0x240123, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_59:
	mov	0x1d, %r14
	.word 0xf2f38e80  ! 1195: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_97:
	setx	0x270322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 1205: RDPR_TICK	<illegal instruction>
	.word 0xf4c48020  ! 1206: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
	.word 0xf25d20cf  ! 1208: LDX_I	ldx	[%r20 + 0x00cf], %r25
	.word 0xfa5d205d  ! 1210: LDX_I	ldx	[%r20 + 0x005d], %r29
	.word 0xba15609c  ! 1212: OR_I	or 	%r21, 0x009c, %r29
	.word 0xf4d48020  ! 1213: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
	.word 0xf2d5a07e  ! 1214: LDSHA_I	ldsha	[%r22, + 0x007e] %asi, %r25
	.word 0xfe55c000  ! 1220: LDSH_R	ldsh	[%r23 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0xbead4000  ! 1226: ANDNcc_R	andncc 	%r21, %r0, %r31
	.word 0xf2c5e031  ! 1227: LDSWA_I	ldswa	[%r23, + 0x0031] %asi, %r25
T2_asi_reg_rd_56:
	mov	0x34, %r14
	.word 0xf4db89e0  ! 1229: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfac5e147  ! 1230: LDSWA_I	ldswa	[%r23, + 0x0147] %asi, %r29
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
	.word 0xf8cde19b  ! 1233: LDSBA_I	ldsba	[%r23, + 0x019b] %asi, %r28
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819838da  ! 1235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18da, %hpstate
	.word 0xf2d40020  ! 1240: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r25
	.word 0xf404c000  ! 1242: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xfe8c2121  ! 1243: LDUBA_I	lduba	[%r16, + 0x0121] %asi, %r31
	.word 0xb2848000  ! 1245: ADDcc_R	addcc 	%r18, %r0, %r25
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 1b)
	.word 0xb9520000  ! 1248: RDPR_PIL	<illegal instruction>
	.word 0xb2ac0000  ! 1249: ANDNcc_R	andncc 	%r16, %r0, %r25
	.word 0xf88de053  ! 1250: LDUBA_I	lduba	[%r23, + 0x0053] %asi, %r28
cpu_intr_2_98:
	setx	0x26022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93cd000  ! 1255: SRAX_R	srax	%r19, %r0, %r28
	.word 0xf4840020  ! 1256: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r26
T2_asi_reg_rd_57:
	mov	0x3c5, %r14
	.word 0xf6db89e0  ! 1259: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 17)
	.word 0xf6448000  ! 1266: LDSW_R	ldsw	[%r18 + %r0], %r27
cpu_intr_2_99:
	setx	0x24030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d4000  ! 1272: LDSB_R	ldsb	[%r21 + %r0], %r24
T2_asi_reg_wr_60:
	mov	0x17, %r14
	.word 0xfcf38400  ! 1274: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_2_100:
	setx	0x250218, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_58:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 1280: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf68c0020  ! 1281: LDUBA_R	lduba	[%r16, %r0] 0x01, %r27
T2_asi_reg_rd_59:
	mov	0x8, %r14
	.word 0xf0db8e40  ! 1283: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf8cd0020  ! 1284: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
	.word 0xb005211b  ! 1286: ADD_I	add 	%r20, 0x011b, %r24
	.word 0xfa154000  ! 1287: LDUH_R	lduh	[%r21 + %r0], %r29
cpu_intr_2_101:
	setx	0x260207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85ce124  ! 1289: LDX_I	ldx	[%r19 + 0x0124], %r28
	.word 0xf04c8000  ! 1292: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xf80cc000  ! 1293: LDUB_R	ldub	[%r19 + %r0], %r28
T2_asi_reg_rd_60:
	mov	0x1d, %r14
	.word 0xf4db8e40  ! 1300: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_61:
	mov	0x2e, %r14
	.word 0xf2db8e60  ! 1303: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf6454000  ! 1306: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xf414a1c8  ! 1310: LDUH_I	lduh	[%r18 + 0x01c8], %r26
T2_asi_reg_wr_61:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 1311: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_2_102:
	setx	0x27033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_103:
	setx	0x24012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_62:
	mov	0x3c2, %r14
	.word 0xfadb8400  ! 1320: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfc5cc000  ! 1321: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xfc8cc020  ! 1322: LDUBA_R	lduba	[%r19, %r0] 0x01, %r30
	.word 0xfa4d8000  ! 1326: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xf60d4000  ! 1329: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xf2cd8020  ! 1330: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
cpu_intr_2_104:
	setx	0x240012, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_62:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 1334: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf60de138  ! 1336: LDUB_I	ldub	[%r23 + 0x0138], %r27
	.word 0xf4552049  ! 1337: LDSH_I	ldsh	[%r20 + 0x0049], %r26
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 32)
	.word 0xfc14a1fc  ! 1346: LDUH_I	lduh	[%r18 + 0x01fc], %r30
	.word 0xfacc4020  ! 1347: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r29
	.word 0xf2050000  ! 1349: LDUW_R	lduw	[%r20 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_105:
	setx	0x24002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_106:
	setx	0x24030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 11)
	.word 0xf40ce1d2  ! 1362: LDUB_I	ldub	[%r19 + 0x01d2], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_63:
	mov	0x18, %r14
	.word 0xf0db8e60  ! 1368: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_wr_63:
	mov	0xf, %r14
	.word 0xfcf38e40  ! 1371: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 6)
	.word 0xfed4c020  ! 1374: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
	.word 0xf8c48020  ! 1379: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r28
cpu_intr_2_107:
	setx	0x290008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_108:
	setx	0x29030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab48000  ! 1384: ORNcc_R	orncc 	%r18, %r0, %r29
T2_asi_reg_wr_64:
	mov	0x37, %r14
	.word 0xf6f384a0  ! 1385: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_rd_64:
	mov	0x3c4, %r14
	.word 0xf8db8e60  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb73c4000  ! 1387: SRA_R	sra 	%r17, %r0, %r27
	.word 0xfa0c8000  ! 1390: LDUB_R	ldub	[%r18 + %r0], %r29
cpu_intr_2_109:
	setx	0x2a022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_110:
	setx	0x290031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d4000  ! 1399: LDX_R	ldx	[%r21 + %r0], %r28
T2_asi_reg_rd_65:
	mov	0x21, %r14
	.word 0xfadb8e40  ! 1400: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_65:
	mov	0x2a, %r14
	.word 0xf4f38400  ! 1401: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf8d4a1df  ! 1404: LDSHA_I	ldsha	[%r18, + 0x01df] %asi, %r28
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf8048000  ! 1407: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xb1341000  ! 1408: SRLX_R	srlx	%r16, %r0, %r24
T2_asi_reg_rd_66:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 1409: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf2dc6077  ! 1410: LDXA_I	ldxa	[%r17, + 0x0077] %asi, %r25
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, e)
	.word 0xfecd4020  ! 1417: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
	.word 0xf494e1a2  ! 1420: LDUHA_I	lduha	[%r19, + 0x01a2] %asi, %r26
T2_asi_reg_rd_67:
	mov	0x8, %r14
	.word 0xfedb8e60  ! 1421: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_2_111:
	setx	0x2b0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85ce005  ! 1423: LDX_I	ldx	[%r19 + 0x0005], %r28
T2_asi_reg_wr_66:
	mov	0x6, %r14
	.word 0xf0f38e60  ! 1424: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T2_asi_reg_wr_67:
	mov	0x2a, %r14
	.word 0xf2f38e80  ! 1426: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_112:
	setx	0x28023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25ce1ad  ! 1430: LDX_I	ldx	[%r19 + 0x01ad], %r25
	.word 0xfad46179  ! 1433: LDSHA_I	ldsha	[%r17, + 0x0179] %asi, %r29
cpu_intr_2_113:
	setx	0x2a003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4850020  ! 1435: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r26
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_rd_68:
	mov	0x3c6, %r14
	.word 0xfcdb8e60  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbf353001  ! 1440: SRLX_I	srlx	%r20, 0x0001, %r31
cpu_intr_2_114:
	setx	0x2b002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_69:
	mov	0x14, %r14
	.word 0xfedb84a0  ! 1442: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf0450000  ! 1443: LDSW_R	ldsw	[%r20 + %r0], %r24
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_70:
	mov	0x2b, %r14
	.word 0xf4db8e60  ! 1448: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf40d213a  ! 1450: LDUB_I	ldub	[%r20 + 0x013a], %r26
	.word 0xf8040000  ! 1451: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xf094c020  ! 1452: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
cpu_intr_2_115:
	setx	0x2b012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_116:
	setx	0x2b031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf84d6058  ! 1460: LDSB_I	ldsb	[%r21 + 0x0058], %r28
	.word 0xb404a1e3  ! 1462: ADD_I	add 	%r18, 0x01e3, %r26
cpu_intr_2_117:
	setx	0x2b0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe948020  ! 1464: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3348000  ! 1472: SRL_R	srl 	%r18, %r0, %r25
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_68:
	mov	0x17, %r14
	.word 0xfcf38400  ! 1476: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_69:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 1478: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_wr_70:
	mov	0x2e, %r14
	.word 0xf0f38e80  ! 1480: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 9)
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982800  ! 1482: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0800, %hpstate
cpu_intr_2_118:
	setx	0x2a0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, a)
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d90  ! 1486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d90, %hpstate
	.word 0xf4158000  ! 1487: LDUH_R	lduh	[%r22 + %r0], %r26
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 2c)
	ta	T_CHANGE_HPRIV
	.word 0xf8c44020  ! 1493: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r28
cpu_intr_2_119:
	setx	0x28013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_71:
	mov	0x37, %r14
	.word 0xfcf38e60  ! 1496: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf44cc000  ! 1498: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xfe540000  ! 1501: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xb1643801  ! 1505: MOVcc_I	<illegal instruction>
T2_asi_reg_rd_71:
	mov	0x7, %r14
	.word 0xfadb84a0  ! 1506: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_2_120:
	setx	0x28003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_72:
	mov	0x14, %r14
	.word 0xfcdb8e40  ! 1508: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_72:
	mov	0xc, %r14
	.word 0xf2f38e40  ! 1511: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf255a05a  ! 1512: LDSH_I	ldsh	[%r22 + 0x005a], %r25
T2_asi_reg_rd_73:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 1513: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf05c8000  ! 1516: LDX_R	ldx	[%r18 + %r0], %r24
cpu_intr_2_121:
	setx	0x290105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 27)
	.word 0xfe55a010  ! 1524: LDSH_I	ldsh	[%r22 + 0x0010], %r31
cpu_intr_2_122:
	setx	0x2b0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d5e102  ! 1527: LDSHA_I	ldsha	[%r23, + 0x0102] %asi, %r26
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 19)
	.word 0xf8456147  ! 1532: LDSW_I	ldsw	[%r21 + 0x0147], %r28
T2_asi_reg_wr_73:
	mov	0x7, %r14
	.word 0xf6f38400  ! 1533: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf8d40020  ! 1535: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r28
cpu_intr_2_123:
	setx	0x290233, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_74:
	mov	0x23, %r14
	.word 0xf4f384a0  ! 1541: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_124:
	setx	0x290016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_75:
	mov	0x3c0, %r14
	.word 0xf8f384a0  ! 1551: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf014c000  ! 1552: LDUH_R	lduh	[%r19 + %r0], %r24
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfa954020  ! 1557: LDUHA_R	lduha	[%r21, %r0] 0x01, %r29
	.word 0xf6cd60bf  ! 1558: LDSBA_I	ldsba	[%r21, + 0x00bf] %asi, %r27
cpu_intr_2_125:
	setx	0x280108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_126:
	setx	0x2b0007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_127:
	setx	0x280236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d4020  ! 1565: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
cpu_intr_2_128:
	setx	0x28021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 18)
	.word 0xba458000  ! 1571: ADDC_R	addc 	%r22, %r0, %r29
	.word 0xf25d8000  ! 1573: LDX_R	ldx	[%r22 + %r0], %r25
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 18)
	.word 0xfa54e03b  ! 1575: LDSH_I	ldsh	[%r19 + 0x003b], %r29
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_wr_76:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 1582: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf20ce037  ! 1584: LDUB_I	ldub	[%r19 + 0x0037], %r25
cpu_intr_2_129:
	setx	0x2a002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_130:
	setx	0x29021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_74:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 1590: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_131:
	setx	0x2b0036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_132:
	setx	0x2b0118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_133:
	setx	0x280121, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_77:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 1597: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb3540000  ! 1598: RDPR_GL	<illegal instruction>
	.word 0xf20cc000  ! 1601: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xb1353001  ! 1602: SRLX_I	srlx	%r20, 0x0001, %r24
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 25)
	.word 0xbc2c4000  ! 1604: ANDN_R	andn 	%r17, %r0, %r30
	.word 0xbc9561c6  ! 1605: ORcc_I	orcc 	%r21, 0x01c6, %r30
	.word 0xf085a176  ! 1606: LDUWA_I	lduwa	[%r22, + 0x0176] %asi, %r24
cpu_intr_2_134:
	setx	0x2b0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c52142  ! 1611: ADDCcc_I	addccc 	%r20, 0x0142, %r24
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_78:
	mov	0x2d, %r14
	.word 0xf4f389e0  ! 1613: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 38)
	.word 0xf8cc0020  ! 1616: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r28
T2_asi_reg_wr_79:
	mov	0x9, %r14
	.word 0xf2f384a0  ! 1617: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xa1902000  ! 1618: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xfa95e0f5  ! 1620: LDUHA_I	lduha	[%r23, + 0x00f5] %asi, %r29
	.word 0xb8bc2051  ! 1625: XNORcc_I	xnorcc 	%r16, 0x0051, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_135:
	setx	0x2a003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 1)
	.word 0xba9ca10e  ! 1634: XORcc_I	xorcc 	%r18, 0x010e, %r29
T2_asi_reg_wr_80:
	mov	0x3c6, %r14
	.word 0xf0f38400  ! 1635: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf054a0ce  ! 1637: LDSH_I	ldsh	[%r18 + 0x00ce], %r24
	.word 0xba048000  ! 1639: ADD_R	add 	%r18, %r0, %r29
T2_asi_reg_wr_81:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 1640: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfc140000  ! 1641: LDUH_R	lduh	[%r16 + %r0], %r30
T2_asi_reg_rd_75:
	mov	0x2a, %r14
	.word 0xf4db8e40  ! 1642: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf694a1ae  ! 1646: LDUHA_I	lduha	[%r18, + 0x01ae] %asi, %r27
	.word 0xf88ca088  ! 1649: LDUBA_I	lduba	[%r18, + 0x0088] %asi, %r28
cpu_intr_2_136:
	setx	0x1003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, e)
	.word 0xfc8d6180  ! 1656: LDUBA_I	lduba	[%r21, + 0x0180] %asi, %r30
	.word 0xf6544000  ! 1657: LDSH_R	ldsh	[%r17 + %r0], %r27
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, f)
	.word 0xf65ce193  ! 1659: LDX_I	ldx	[%r19 + 0x0193], %r27
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 7)
	ta	T_CHANGE_TO_TL0
	.word 0xfedda00a  ! 1666: LDXA_I	ldxa	[%r22, + 0x000a] %asi, %r31
cpu_intr_2_137:
	setx	0x2a013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_138:
	setx	0x280131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc84a11c  ! 1669: ADDcc_I	addcc 	%r18, 0x011c, %r30
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_139:
	setx	0x290313, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_82:
	mov	0x3, %r14
	.word 0xfef38e40  ! 1680: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf64cc000  ! 1683: LDSB_R	ldsb	[%r19 + %r0], %r27
T2_asi_reg_rd_76:
	mov	0xc, %r14
	.word 0xf0db8e60  ! 1685: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf20561a2  ! 1686: LDUW_I	lduw	[%r21 + 0x01a2], %r25
	.word 0xbc440000  ! 1687: ADDC_R	addc 	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf81520c3  ! 1689: LDUH_I	lduh	[%r20 + 0x00c3], %r28
cpu_intr_2_140:
	setx	0x280113, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_77:
	mov	0x2e, %r14
	.word 0xfcdb84a0  ! 1692: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_141:
	setx	0x2a0101, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_83:
	mov	0x2e, %r14
	.word 0xf4f384a0  ! 1694: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	.word 0xbcb5c000  ! 1702: ORNcc_R	orncc 	%r23, %r0, %r30
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982cc0  ! 1703: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc0, %hpstate
	.word 0xb68d0000  ! 1704: ANDcc_R	andcc 	%r20, %r0, %r27
T2_asi_reg_wr_84:
	mov	0x3c8, %r14
	.word 0xf8f38e60  ! 1707: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfc05605f  ! 1709: LDUW_I	lduw	[%r21 + 0x005f], %r30
T2_asi_reg_rd_78:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 1710: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfe5d201a  ! 1711: LDX_I	ldx	[%r20 + 0x001a], %r31
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_142:
	setx	0x2a033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, e)
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, d)
	.word 0xf8d52193  ! 1724: LDSHA_I	ldsha	[%r20, + 0x0193] %asi, %r28
	.word 0xb77c2401  ! 1725: MOVR_I	movre	%r16, 0x1, %r27
	.word 0xf4856018  ! 1727: LDUWA_I	lduwa	[%r21, + 0x0018] %asi, %r26
	.word 0xfc446001  ! 1728: LDSW_I	ldsw	[%r17 + 0x0001], %r30
	ta	T_CHANGE_TO_TL0
	.word 0xfa4c4000  ! 1731: LDSB_R	ldsb	[%r17 + %r0], %r29
T2_asi_reg_rd_79:
	mov	0x33, %r14
	.word 0xf8db8e40  ! 1732: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_rd_80:
	mov	0x14, %r14
	.word 0xf6db89e0  ! 1733: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 3c)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbf510000  ! 1740: RDPR_TICK	<illegal instruction>
	.word 0xb350c000  ! 1741: RDPR_TT	<illegal instruction>
cpu_intr_2_143:
	setx	0x2a0330, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_85:
	mov	0x1a, %r14
	.word 0xfcf38e80  ! 1743: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_wr_86:
	mov	0x1e, %r14
	.word 0xf4f38400  ! 1745: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb42d2025  ! 1747: ANDN_I	andn 	%r20, 0x0025, %r26
	ta	T_CHANGE_HPRIV
	.word 0xf48c2154  ! 1755: LDUBA_I	lduba	[%r16, + 0x0154] %asi, %r26
	.word 0xfe142192  ! 1757: LDUH_I	lduh	[%r16 + 0x0192], %r31
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_wr_87:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 1760: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_144:
	setx	0x2a032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_145:
	setx	0x28001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983fd0  ! 1770: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd0, %hpstate
	.word 0xb02561dd  ! 1771: SUB_I	sub 	%r21, 0x01dd, %r24
T2_asi_reg_wr_88:
	mov	0x3c8, %r14
	.word 0xf6f389e0  ! 1772: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf4cd0020  ! 1774: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r26
	.word 0xbb352001  ! 1777: SRL_I	srl 	%r20, 0x0001, %r29
cpu_intr_2_146:
	setx	0x2b0204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_81:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 1780: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_147:
	setx	0x280006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77dc400  ! 1784: MOVR_R	movre	%r23, %r0, %r27
	.word 0xf20561f8  ! 1785: LDUW_I	lduw	[%r21 + 0x01f8], %r25
	.word 0xf65cc000  ! 1786: LDX_R	ldx	[%r19 + %r0], %r27
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 34)
	.word 0xf4dc6137  ! 1788: LDXA_I	ldxa	[%r17, + 0x0137] %asi, %r26
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_82:
	mov	0x2e, %r14
	.word 0xfedb89e0  ! 1797: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfe942017  ! 1798: LDUHA_I	lduha	[%r16, + 0x0017] %asi, %r31
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_148:
	setx	0x290211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_149:
	setx	0x2b0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983b9a  ! 1813: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b9a, %hpstate
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 2)
	.word 0xfe040000  ! 1819: LDUW_R	lduw	[%r16 + %r0], %r31
T2_asi_reg_rd_83:
	mov	0x2f, %r14
	.word 0xf4db8e40  ! 1820: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_89:
	mov	0x1e, %r14
	.word 0xf4f38e80  ! 1822: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfe4da0db  ! 1823: LDSB_I	ldsb	[%r22 + 0x00db], %r31
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_rd_84:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 1835: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa0560bd  ! 1838: LDUW_I	lduw	[%r21 + 0x00bd], %r29
	.word 0xfa554000  ! 1844: LDSH_R	ldsh	[%r21 + %r0], %r29
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982a90  ! 1846: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a90, %hpstate
	.word 0xfa0d207f  ! 1848: LDUB_I	ldub	[%r20 + 0x007f], %r29
T2_asi_reg_wr_90:
	mov	0x37, %r14
	.word 0xf2f38400  ! 1849: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_2_150:
	setx	0x2e013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80de042  ! 1853: AND_I	and 	%r23, 0x0042, %r28
	.word 0xb6b4c000  ! 1857: SUBCcc_R	orncc 	%r19, %r0, %r27
	.word 0xb2842028  ! 1863: ADDcc_I	addcc 	%r16, 0x0028, %r25
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_151:
	setx	0x2f012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9d0000  ! 1875: XORcc_R	xorcc 	%r20, %r0, %r30
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_91:
	mov	0x10, %r14
	.word 0xf4f389e0  ! 1877: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_85:
	mov	0xa, %r14
	.word 0xfadb8e40  ! 1880: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbc2d8000  ! 1884: ANDN_R	andn 	%r22, %r0, %r30
	.word 0xb6356128  ! 1885: ORN_I	orn 	%r21, 0x0128, %r27
	.word 0xf80c60a8  ! 1887: LDUB_I	ldub	[%r17 + 0x00a8], %r28
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_rd_86:
	mov	0x8, %r14
	.word 0xf4db8e60  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xb13d6001  ! 1896: SRA_I	sra 	%r21, 0x0001, %r24
	.word 0xb60da159  ! 1900: AND_I	and 	%r22, 0x0159, %r27
	ta	T_CHANGE_HPRIV
	.word 0xf05d8000  ! 1903: LDX_R	ldx	[%r22 + %r0], %r24
cpu_intr_2_152:
	setx	0x2c0017, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_87:
	mov	0x1a, %r14
	.word 0xf8db8e40  ! 1906: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_92:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 1907: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_88:
	mov	0x27, %r14
	.word 0xf8db8400  ! 1909: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_wr_93:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 1910: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2458000  ! 1912: LDSW_R	ldsw	[%r22 + %r0], %r25
cpu_intr_2_153:
	setx	0x2d000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28d607c  ! 1917: ANDcc_I	andcc 	%r21, 0x007c, %r25
	.word 0xf00d8000  ! 1918: LDUB_R	ldub	[%r22 + %r0], %r24
cpu_intr_2_154:
	setx	0x2f0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0c4000  ! 1922: LDUB_R	ldub	[%r17 + %r0], %r29
T2_asi_reg_wr_94:
	mov	0x35, %r14
	.word 0xf2f384a0  ! 1923: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_155:
	setx	0x2d0208, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_95:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 1926: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 19)
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819839ca  ! 1932: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19ca, %hpstate
cpu_intr_2_156:
	setx	0x2d0219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 30)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_157:
	setx	0x2c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_89:
	mov	0x1e, %r14
	.word 0xfadb8e40  ! 1942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfa444000  ! 1946: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xba0c8000  ! 1947: AND_R	and 	%r18, %r0, %r29
cpu_intr_2_158:
	setx	0x2d020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_159:
	setx	0x2d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc450000  ! 1955: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xf2cc2023  ! 1956: LDSBA_I	ldsba	[%r16, + 0x0023] %asi, %r25
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf294a0f3  ! 1961: LDUHA_I	lduha	[%r18, + 0x00f3] %asi, %r25
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfad44020  ! 1971: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
T2_asi_reg_wr_96:
	mov	0x4, %r14
	.word 0xf8f38e60  ! 1972: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0x8394e03a  ! 1973: WRPR_TNPC_I	wrpr	%r19, 0x003a, %tnpc
	.word 0xfa94c020  ! 1974: LDUHA_R	lduha	[%r19, %r0] 0x01, %r29
	.word 0xfc0c8000  ! 1976: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xb12df001  ! 1977: SLLX_I	sllx	%r23, 0x0001, %r24
	.word 0xf25420d3  ! 1978: LDSH_I	ldsh	[%r16 + 0x00d3], %r25
	.word 0xb625a11c  ! 1981: SUB_I	sub 	%r22, 0x011c, %r27
	.word 0xf60de1dd  ! 1982: LDUB_I	ldub	[%r23 + 0x01dd], %r27
	.word 0xf814c000  ! 1984: LDUH_R	lduh	[%r19 + %r0], %r28
T2_asi_reg_rd_90:
	mov	0x3, %r14
	.word 0xf8db8e40  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_97:
	mov	0x33, %r14
	.word 0xf0f38e40  ! 1992: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_160:
	setx	0x2d012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_91:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 1996: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_rd_92:
	mov	0x3c0, %r14
	.word 0xfcdb89e0  ! 1998: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb17c4400  ! 1999: MOVR_R	movre	%r17, %r0, %r24
cpu_intr_2_161:
	setx	0x2d022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88c2171  ! 2002: LDUBA_I	lduba	[%r16, + 0x0171] %asi, %r28
	.word 0xbc3d4000  ! 2004: XNOR_R	xnor 	%r21, %r0, %r30
	.word 0xfa55c000  ! 2005: LDSH_R	ldsh	[%r23 + %r0], %r29
T2_asi_reg_wr_98:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 2006: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_162:
	setx	0x2c0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819829c8  ! 2010: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c8, %hpstate
T2_asi_reg_wr_99:
	mov	0x14, %r14
	.word 0xfef389e0  ! 2011: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, f)
	.word 0xf094c020  ! 2014: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
	.word 0xfe948020  ! 2015: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
	.word 0xf6450000  ! 2016: LDSW_R	ldsw	[%r20 + %r0], %r27
cpu_intr_2_163:
	setx	0x2d0014, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_100:
	mov	0x9, %r14
	.word 0xfcf38e60  ! 2018: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb8b5e0e0  ! 2024: SUBCcc_I	orncc 	%r23, 0x00e0, %r28
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_164:
	setx	0x2c0219, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_93:
	mov	0x19, %r14
	.word 0xf6db84a0  ! 2031: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 2)
	.word 0xf604203e  ! 2034: LDUW_I	lduw	[%r16 + 0x003e], %r27
cpu_intr_2_165:
	setx	0x2d0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf285e0ac  ! 2037: LDUWA_I	lduwa	[%r23, + 0x00ac] %asi, %r25
	.word 0xf884a18e  ! 2040: LDUWA_I	lduwa	[%r18, + 0x018e] %asi, %r28
cpu_intr_2_166:
	setx	0x2d0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc048000  ! 2044: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xfa4ca0ca  ! 2045: LDSB_I	ldsb	[%r18 + 0x00ca], %r29
	.word 0xfad4c020  ! 2052: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xf85c4000  ! 2056: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xf0854020  ! 2057: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r24
	.word 0xfe5521b0  ! 2060: LDSH_I	ldsh	[%r20 + 0x01b0], %r31
cpu_intr_2_167:
	setx	0x2c0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf29560e6  ! 2062: LDUHA_I	lduha	[%r21, + 0x00e6] %asi, %r25
T2_asi_reg_rd_94:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 2064: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_168:
	setx	0x2c033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_95:
	mov	0x1, %r14
	.word 0xf4db89e0  ! 2066: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb4b50000  ! 2068: ORNcc_R	orncc 	%r20, %r0, %r26
	.word 0xf045610f  ! 2069: LDSW_I	ldsw	[%r21 + 0x010f], %r24
T2_asi_reg_rd_96:
	mov	0x20, %r14
	.word 0xfedb8400  ! 2073: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_rd_97:
	mov	0xe, %r14
	.word 0xfadb8400  ! 2079: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_rd_98:
	mov	0x3c7, %r14
	.word 0xf2db8400  ! 2080: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_169:
	setx	0x2c0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2156080  ! 2082: LDUH_I	lduh	[%r21 + 0x0080], %r25
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 16)
	.word 0xb92d9000  ! 2087: SLLX_R	sllx	%r22, %r0, %r28
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 16)
	.word 0xb7641800  ! 2094: MOVcc_R	<illegal instruction>
	.word 0xfc550000  ! 2096: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xf204c000  ! 2097: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xfecd8020  ! 2098: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r31
T2_asi_reg_rd_99:
	mov	0x4, %r14
	.word 0xfcdb84a0  ! 2099: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfe946188  ! 2101: LDUHA_I	lduha	[%r17, + 0x0188] %asi, %r31
T2_asi_reg_rd_100:
	mov	0x3c5, %r14
	.word 0xf0db84a0  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf2cd8020  ! 2114: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
cpu_intr_2_170:
	setx	0x2f0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4ca146  ! 2118: LDSB_I	ldsb	[%r18 + 0x0146], %r31
	.word 0xf8440000  ! 2122: LDSW_R	ldsw	[%r16 + %r0], %r28
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_101:
	mov	0x2c, %r14
	.word 0xf4db8e40  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc15a123  ! 2127: LDUH_I	lduh	[%r22 + 0x0123], %r30
	.word 0xbb7cc400  ! 2128: MOVR_R	movre	%r19, %r0, %r29
T2_asi_reg_rd_102:
	mov	0x3c2, %r14
	.word 0xf0db8400  ! 2129: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 5)
	.word 0xfa052156  ! 2135: LDUW_I	lduw	[%r20 + 0x0156], %r29
	.word 0xb2c421b9  ! 2136: ADDCcc_I	addccc 	%r16, 0x01b9, %r25
	.word 0xfedda0d7  ! 2141: LDXA_I	ldxa	[%r22, + 0x00d7] %asi, %r31
cpu_intr_2_171:
	setx	0x2e0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7641800  ! 2144: MOVcc_R	<illegal instruction>
	.word 0xf2d54020  ! 2146: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r25
T2_asi_reg_wr_101:
	mov	0x3c6, %r14
	.word 0xf4f38e60  ! 2149: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_102:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 2150: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 38)
	.word 0xfe8c61f0  ! 2153: LDUBA_I	lduba	[%r17, + 0x01f0] %asi, %r31
	.word 0xfa15c000  ! 2154: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0x8f902001  ! 2155: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 0)
	.word 0xf095a045  ! 2161: LDUHA_I	lduha	[%r22, + 0x0045] %asi, %r24
	.word 0xfcc4e07e  ! 2167: LDSWA_I	ldswa	[%r19, + 0x007e] %asi, %r30
	ta	T_CHANGE_TO_TL1
cpu_intr_2_172:
	setx	0x2f002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_173:
	setx	0x2d0313, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_103:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 2177: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfc54a194  ! 2178: LDSH_I	ldsh	[%r18 + 0x0194], %r30
T2_asi_reg_rd_104:
	mov	0x3c7, %r14
	.word 0xfadb84a0  ! 2181: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfa4d4000  ! 2185: LDSB_R	ldsb	[%r21 + %r0], %r29
T2_asi_reg_rd_105:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 2191: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 13)
	.word 0xb63de0b0  ! 2194: XNOR_I	xnor 	%r23, 0x00b0, %r27
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 24)
	.word 0xf2540000  ! 2201: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xf854c000  ! 2202: LDSH_R	ldsh	[%r19 + %r0], %r28
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf28cc020  ! 2207: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
T2_asi_reg_rd_106:
	mov	0x16, %r14
	.word 0xfedb8e40  ! 2208: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_103:
	mov	0x1b, %r14
	.word 0xf8f38400  ! 2209: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfa05a1ae  ! 2210: LDUW_I	lduw	[%r22 + 0x01ae], %r29
cpu_intr_2_174:
	setx	0x2e0115, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_107:
	mov	0x3c6, %r14
	.word 0xf0db89e0  ! 2212: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 8)
	.word 0xf8d5c020  ! 2216: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r28
	.word 0x8794e01d  ! 2217: WRPR_TT_I	wrpr	%r19, 0x001d, %tt
T2_asi_reg_wr_104:
	mov	0x20, %r14
	.word 0xf8f38e60  ! 2218: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_wr_105:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 2221: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_175:
	setx	0x2f0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb644c000  ! 2224: ADDC_R	addc 	%r19, %r0, %r27
	.word 0xfc94602a  ! 2228: LDUHA_I	lduha	[%r17, + 0x002a] %asi, %r30
	.word 0xb28c4000  ! 2229: ANDcc_R	andcc 	%r17, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfad4e14f  ! 2234: LDSHA_I	ldsha	[%r19, + 0x014f] %asi, %r29
T2_asi_reg_wr_106:
	mov	0x18, %r14
	.word 0xf8f38e80  ! 2237: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfa45c000  ! 2240: LDSW_R	ldsw	[%r23 + %r0], %r29
T2_asi_reg_wr_107:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 2243: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_108:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T2_asi_reg_rd_109:
	mov	0x27, %r14
	.word 0xfcdb8e60  ! 2247: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_rd_110:
	mov	0x3, %r14
	.word 0xfadb84a0  ! 2250: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf2142156  ! 2251: LDUH_I	lduh	[%r16 + 0x0156], %r25
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983ac8  ! 2258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac8, %hpstate
T2_asi_reg_rd_111:
	mov	0x1a, %r14
	.word 0xf0db8e80  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_176:
	setx	0x30021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0550000  ! 2264: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xb28d6066  ! 2267: ANDcc_I	andcc 	%r21, 0x0066, %r25
T2_asi_reg_wr_108:
	mov	0x32, %r14
	.word 0xfef389e0  ! 2268: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf0d5a144  ! 2269: LDSHA_I	ldsha	[%r22, + 0x0144] %asi, %r24
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983fc0  ! 2270: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc0, %hpstate
	.word 0xf24d0000  ! 2271: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xfe8461c0  ! 2272: LDUWA_I	lduwa	[%r17, + 0x01c0] %asi, %r31
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 7)
	.word 0xfccd8020  ! 2277: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r30
T2_asi_reg_rd_112:
	mov	0x28, %r14
	.word 0xf8db8e40  ! 2280: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfe448000  ! 2281: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xf4cc611e  ! 2282: LDSBA_I	ldsba	[%r17, + 0x011e] %asi, %r26
cpu_intr_2_177:
	setx	0x300328, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_113:
	mov	0x1e, %r14
	.word 0xf8db8400  ! 2285: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfe84e0b3  ! 2287: LDUWA_I	lduwa	[%r19, + 0x00b3] %asi, %r31
cpu_intr_2_178:
	setx	0x300131, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_109:
	mov	0x37, %r14
	.word 0xf4f384a0  ! 2290: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_rd_114:
	mov	0xb, %r14
	.word 0xfedb8e60  ! 2291: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 2)
	.word 0xf0dda16c  ! 2296: LDXA_I	ldxa	[%r22, + 0x016c] %asi, %r24
	.word 0xf005602f  ! 2297: LDUW_I	lduw	[%r21 + 0x002f], %r24
T2_asi_reg_wr_110:
	mov	0x2e, %r14
	.word 0xf0f38e40  ! 2298: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 27)
	.word 0xfe05e117  ! 2300: LDUW_I	lduw	[%r23 + 0x0117], %r31
cpu_intr_2_179:
	setx	0x33013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 19)
	.word 0xb97c0400  ! 2308: MOVR_R	movre	%r16, %r0, %r28
	.word 0xfec48020  ! 2309: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe05c000  ! 2313: LDUW_R	lduw	[%r23 + %r0], %r31
cpu_intr_2_180:
	setx	0x320327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_181:
	setx	0x310128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe0c210a  ! 2322: AND_I	and 	%r16, 0x010a, %r31
	ta	T_CHANGE_TO_TL1
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_wr_111:
	mov	0x30, %r14
	.word 0xf6f38e40  ! 2330: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0xfadce104  ! 2339: LDXA_I	ldxa	[%r19, + 0x0104] %asi, %r29
	.word 0xf8c5601f  ! 2344: LDSWA_I	ldswa	[%r21, + 0x001f] %asi, %r28
	.word 0xf05dc000  ! 2346: LDX_R	ldx	[%r23 + %r0], %r24
cpu_intr_2_182:
	setx	0x32002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3c8000  ! 2350: XNOR_R	xnor 	%r18, %r0, %r29
	.word 0xfe550000  ! 2352: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xf4d48020  ! 2353: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 23)
	.word 0xfcdc2157  ! 2361: LDXA_I	ldxa	[%r16, + 0x0157] %asi, %r30
cpu_intr_2_183:
	setx	0x330009, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_115:
	mov	0x3c7, %r14
	.word 0xf2db84a0  ! 2366: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb09c8000  ! 2368: XORcc_R	xorcc 	%r18, %r0, %r24
	.word 0xf045c000  ! 2370: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xf0850020  ! 2371: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r24
T2_asi_reg_rd_116:
	mov	0x3c7, %r14
	.word 0xf2db84a0  ! 2372: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf8c4e0dc  ! 2373: LDSWA_I	ldswa	[%r19, + 0x00dc] %asi, %r28
T2_asi_reg_wr_112:
	mov	0x22, %r14
	.word 0xfcf38e40  ! 2374: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_184:
	setx	0x33001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_113:
	mov	0x2d, %r14
	.word 0xfef38e80  ! 2377: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb92d4000  ! 2381: SLL_R	sll 	%r21, %r0, %r28
cpu_intr_2_185:
	setx	0x320226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_186:
	setx	0x320328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44da186  ! 2390: LDSB_I	ldsb	[%r22 + 0x0186], %r26
cpu_intr_2_187:
	setx	0x32003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfed4c020  ! 2393: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
	.word 0xfe85217c  ! 2394: LDUWA_I	lduwa	[%r20, + 0x017c] %asi, %r31
	.word 0xb4b520f7  ! 2396: ORNcc_I	orncc 	%r20, 0x00f7, %r26
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf85c0000  ! 2401: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xfa8ce08e  ! 2403: LDUBA_I	lduba	[%r19, + 0x008e] %asi, %r29
cpu_intr_2_188:
	setx	0x32001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08d6114  ! 2406: LDUBA_I	lduba	[%r21, + 0x0114] %asi, %r24
cpu_intr_2_189:
	setx	0x30032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 24)
	.word 0xfa0ca141  ! 2410: LDUB_I	ldub	[%r18 + 0x0141], %r29
	.word 0xf88ca15d  ! 2411: LDUBA_I	lduba	[%r18, + 0x015d] %asi, %r28
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfcdd2007  ! 2418: LDXA_I	ldxa	[%r20, + 0x0007] %asi, %r30
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, f)
	.word 0xfcdce1f2  ! 2420: LDXA_I	ldxa	[%r19, + 0x01f2] %asi, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_190:
	setx	0x300319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1d8000  ! 2426: XOR_R	xor 	%r22, %r0, %r29
	.word 0xbab521ee  ! 2427: SUBCcc_I	orncc 	%r20, 0x01ee, %r29
	.word 0xfa95c020  ! 2432: LDUHA_R	lduha	[%r23, %r0] 0x01, %r29
	.word 0xb89d2059  ! 2433: XORcc_I	xorcc 	%r20, 0x0059, %r28
T2_asi_reg_wr_114:
	mov	0x6, %r14
	.word 0xf4f38e40  ! 2434: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfed5a054  ! 2435: LDSHA_I	ldsha	[%r22, + 0x0054] %asi, %r31
	.word 0xfc058000  ! 2436: LDUW_R	lduw	[%r22 + %r0], %r30
T2_asi_reg_wr_115:
	mov	0x3c1, %r14
	.word 0xf2f384a0  ! 2437: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfe84c020  ! 2438: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r31
T2_asi_reg_rd_117:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 2439: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfc8c0020  ! 2440: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_191:
	setx	0x300330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_192:
	setx	0x32030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88c61ba  ! 2447: LDUBA_I	lduba	[%r17, + 0x01ba] %asi, %r28
cpu_intr_2_193:
	setx	0x330032, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_118:
	mov	0x21, %r14
	.word 0xf2db8e60  ! 2450: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 24)
	.word 0xf64da10f  ! 2452: LDSB_I	ldsb	[%r22 + 0x010f], %r27
	.word 0xfe04e1ac  ! 2454: LDUW_I	lduw	[%r19 + 0x01ac], %r31
	.word 0xf40dc000  ! 2456: LDUB_R	ldub	[%r23 + %r0], %r26
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_116:
	mov	0x2d, %r14
	.word 0xf2f389e0  ! 2458: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_194:
	setx	0x30010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819829c2  ! 2462: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c2, %hpstate
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, d)
	.word 0xfa940020  ! 2466: LDUHA_R	lduha	[%r16, %r0] 0x01, %r29
cpu_intr_2_195:
	setx	0x310129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0442118  ! 2469: LDSW_I	ldsw	[%r16 + 0x0118], %r24
T2_asi_reg_wr_117:
	mov	0x2, %r14
	.word 0xfcf38e80  ! 2470: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_196:
	setx	0x30022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_197:
	setx	0x32013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_198:
	setx	0x320011, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_119:
	mov	0x3c6, %r14
	.word 0xf0db89e0  ! 2477: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_wr_118:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 2478: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfe8d21a1  ! 2479: LDUBA_I	lduba	[%r20, + 0x01a1] %asi, %r31
T2_asi_reg_rd_120:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 2481: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_199:
	setx	0x310325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d42160  ! 2484: LDSHA_I	ldsha	[%r16, + 0x0160] %asi, %r27
T2_asi_reg_wr_119:
	mov	0x1c, %r14
	.word 0xfef38e40  ! 2485: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf64d2140  ! 2489: LDSB_I	ldsb	[%r20 + 0x0140], %r27
	.word 0xf25d4000  ! 2490: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xf45c60d6  ! 2493: LDX_I	ldx	[%r17 + 0x00d6], %r26
	.word 0xfa04a07c  ! 2498: LDUW_I	lduw	[%r18 + 0x007c], %r29
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 16)
	.word 0xf25dc000  ! 2501: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0xbc942173  ! 2502: ORcc_I	orcc 	%r16, 0x0173, %r30
cpu_intr_2_200:
	setx	0x310332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_201:
	setx	0x33022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa844020  ! 2511: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r29
	.word 0xf6cc21a2  ! 2512: LDSBA_I	ldsba	[%r16, + 0x01a2] %asi, %r27
	.word 0xf444c000  ! 2513: LDSW_R	ldsw	[%r19 + %r0], %r26
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_wr_120:
	mov	0x35, %r14
	.word 0xfcf38400  ! 2518: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xba254000  ! 2519: SUB_R	sub 	%r21, %r0, %r29
	.word 0xf68c4020  ! 2521: LDUBA_R	lduba	[%r17, %r0] 0x01, %r27
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 24)
	.word 0xfe4c0000  ! 2531: LDSB_R	ldsb	[%r16 + %r0], %r31
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_202:
	setx	0x320217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_203:
	setx	0x330309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_rd_121:
	mov	0x3, %r14
	.word 0xf6db84a0  ! 2539: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf2158000  ! 2540: LDUH_R	lduh	[%r22 + %r0], %r25
cpu_intr_2_204:
	setx	0x320305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d48020  ! 2545: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfc550000  ! 2550: LDSH_R	ldsh	[%r20 + %r0], %r30
T2_asi_reg_wr_121:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 2552: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf24de1bd  ! 2554: LDSB_I	ldsb	[%r23 + 0x01bd], %r25
	.word 0xfe5c4000  ! 2555: LDX_R	ldx	[%r17 + %r0], %r31
cpu_intr_2_205:
	setx	0x310234, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_122:
	mov	0x30, %r14
	.word 0xf2f38e60  ! 2559: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfe0c20b9  ! 2565: LDUB_I	ldub	[%r16 + 0x00b9], %r31
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_123:
	mov	0x2f, %r14
	.word 0xf2f38e40  ! 2571: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_124:
	mov	0x7, %r14
	.word 0xfef38e40  ! 2574: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf80ca1a0  ! 2575: LDUB_I	ldub	[%r18 + 0x01a0], %r28
	.word 0xbc9d6074  ! 2579: XORcc_I	xorcc 	%r21, 0x0074, %r30
	.word 0xf65da0d4  ! 2580: LDX_I	ldx	[%r22 + 0x00d4], %r27
	.word 0xbc1d6076  ! 2581: XOR_I	xor 	%r21, 0x0076, %r30
	.word 0xf604a170  ! 2582: LDUW_I	lduw	[%r18 + 0x0170], %r27
	.word 0xf2c42086  ! 2586: LDSWA_I	ldswa	[%r16, + 0x0086] %asi, %r25
	.word 0xf44c213a  ! 2589: LDSB_I	ldsb	[%r16 + 0x013a], %r26
T2_asi_reg_rd_122:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 2591: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb8b5a14a  ! 2595: ORNcc_I	orncc 	%r22, 0x014a, %r28
	.word 0xb93c1000  ! 2596: SRAX_R	srax	%r16, %r0, %r28
	.word 0xfc540000  ! 2597: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xf45d21ff  ! 2598: LDX_I	ldx	[%r20 + 0x01ff], %r26
T2_asi_reg_wr_125:
	mov	0x28, %r14
	.word 0xfef384a0  ! 2601: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_206:
	setx	0x32013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf00c612d  ! 2609: LDUB_I	ldub	[%r17 + 0x012d], %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8cc2190  ! 2612: LDSBA_I	ldsba	[%r16, + 0x0190] %asi, %r28
cpu_intr_2_207:
	setx	0x310214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0040000  ! 2615: LDUW_R	lduw	[%r16 + %r0], %r24
T2_asi_reg_rd_123:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 2616: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_rd_124:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 2617: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_126:
	mov	0x2f, %r14
	.word 0xf4f38400  ! 2620: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf68da069  ! 2621: LDUBA_I	lduba	[%r22, + 0x0069] %asi, %r27
cpu_intr_2_208:
	setx	0x30022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf41421d2  ! 2628: LDUH_I	lduh	[%r16 + 0x01d2], %r26
cpu_intr_2_209:
	setx	0x330114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20461b3  ! 2632: LDUW_I	lduw	[%r17 + 0x01b3], %r25
T2_asi_reg_rd_125:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 2634: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0x8594a08c  ! 2636: WRPR_TSTATE_I	wrpr	%r18, 0x008c, %tstate
	.word 0xf49420b5  ! 2637: LDUHA_I	lduha	[%r16, + 0x00b5] %asi, %r26
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf4d48020  ! 2640: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
cpu_intr_2_210:
	setx	0x31000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa558000  ! 2644: LDSH_R	ldsh	[%r22 + %r0], %r29
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982802  ! 2646: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0802, %hpstate
	.word 0xf8854020  ! 2648: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r28
cpu_intr_2_211:
	setx	0x310303, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982e5a  ! 2652: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5a, %hpstate
	.word 0xfa140000  ! 2653: LDUH_R	lduh	[%r16 + %r0], %r29
	.word 0xf24d8000  ! 2655: LDSB_R	ldsb	[%r22 + %r0], %r25
T2_asi_reg_rd_126:
	mov	0x3c7, %r14
	.word 0xf4db89e0  ! 2658: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_wr_127:
	mov	0x13, %r14
	.word 0xf8f38e60  ! 2659: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf695e104  ! 2664: LDUHA_I	lduha	[%r23, + 0x0104] %asi, %r27
T2_asi_reg_rd_127:
	mov	0xb, %r14
	.word 0xf6db84a0  ! 2666: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_rd_128:
	mov	0xc, %r14
	.word 0xf0db8e40  ! 2667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_129:
	mov	0x19, %r14
	.word 0xf6db84a0  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 17)
	.word 0xbb500000  ! 2674: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_212:
	setx	0x30030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24dc000  ! 2678: LDSB_R	ldsb	[%r23 + %r0], %r25
T2_asi_reg_rd_130:
	mov	0x2c, %r14
	.word 0xf0db8400  ! 2679: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_2_213:
	setx	0x33002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_131:
	mov	0x9, %r14
	.word 0xf0db8e60  ! 2683: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 36)
	.word 0xfa054000  ! 2686: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0xfa5d0000  ! 2687: LDX_R	ldx	[%r20 + %r0], %r29
	.word 0xf2ccc020  ! 2689: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r25
T2_asi_reg_rd_132:
	mov	0xe, %r14
	.word 0xf2db84a0  ! 2690: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_133:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 2695: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, f)
	ta	T_CHANGE_HPRIV
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 34)
	.word 0xf05ce041  ! 2701: LDX_I	ldx	[%r19 + 0x0041], %r24
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819828ca  ! 2702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ca, %hpstate
cpu_intr_2_214:
	setx	0x330023, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_134:
	mov	0x1e, %r14
	.word 0xf2db89e0  ! 2707: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_rd_135:
	mov	0x3c0, %r14
	.word 0xfadb8e60  ! 2709: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb835e132  ! 2711: ORN_I	orn 	%r23, 0x0132, %r28
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_136:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 2721: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb9643801  ! 2722: MOVcc_I	<illegal instruction>
	.word 0xbe8cc000  ! 2725: ANDcc_R	andcc 	%r19, %r0, %r31
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982bc8  ! 2726: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc8, %hpstate
	.word 0xfa1561d7  ! 2728: LDUH_I	lduh	[%r21 + 0x01d7], %r29
cpu_intr_2_215:
	setx	0x360305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_216:
	setx	0x360111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 8)
	.word 0xf2944020  ! 2736: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
	.word 0xb2a5e087  ! 2737: SUBcc_I	subcc 	%r23, 0x0087, %r25
T2_asi_reg_rd_137:
	mov	0x6, %r14
	.word 0xf6db8e40  ! 2739: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf80c6156  ! 2743: LDUB_I	ldub	[%r17 + 0x0156], %r28
	.word 0xfc050000  ! 2744: LDUW_R	lduw	[%r20 + %r0], %r30
T2_asi_reg_rd_138:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 2749: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_128:
	mov	0x2f, %r14
	.word 0xf6f389e0  ! 2755: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb49cc000  ! 2757: XORcc_R	xorcc 	%r19, %r0, %r26
cpu_intr_2_217:
	setx	0x370014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf854611a  ! 2763: LDSH_I	ldsh	[%r17 + 0x011a], %r28
cpu_intr_2_218:
	setx	0x350305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf415c000  ! 2772: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xf04d613c  ! 2776: LDSB_I	ldsb	[%r21 + 0x013c], %r24
	.word 0xf0840020  ! 2778: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r24
	.word 0xf8050000  ! 2779: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xf6042004  ! 2782: LDUW_I	lduw	[%r16 + 0x0004], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_219:
	setx	0x340007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53c0000  ! 2787: SRA_R	sra 	%r16, %r0, %r26
	.word 0xb5350000  ! 2789: SRL_R	srl 	%r20, %r0, %r26
	.word 0xfa952194  ! 2790: LDUHA_I	lduha	[%r20, + 0x0194] %asi, %r29
	.word 0xfc0cc000  ! 2792: LDUB_R	ldub	[%r19 + %r0], %r30
T2_asi_reg_rd_139:
	mov	0x3c1, %r14
	.word 0xf0db8400  ! 2798: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_wr_129:
	mov	0x3c1, %r14
	.word 0xf0f38e80  ! 2801: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf25da016  ! 2802: LDX_I	ldx	[%r22 + 0x0016], %r25
	.word 0xfc84e176  ! 2803: LDUWA_I	lduwa	[%r19, + 0x0176] %asi, %r30
	.word 0xf8dca054  ! 2804: LDXA_I	ldxa	[%r18, + 0x0054] %asi, %r28
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_220:
	setx	0x360026, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_140:
	mov	0x6, %r14
	.word 0xfedb8e60  ! 2811: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 5)
	.word 0xf44da199  ! 2813: LDSB_I	ldsb	[%r22 + 0x0199], %r26
	.word 0xf40d21ff  ! 2814: LDUB_I	ldub	[%r20 + 0x01ff], %r26
T2_asi_reg_rd_141:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 2819: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xba05c000  ! 2820: ADD_R	add 	%r23, %r0, %r29
cpu_intr_2_221:
	setx	0x36010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85cc000  ! 2822: LDX_R	ldx	[%r19 + %r0], %r28
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfc5da1b6  ! 2824: LDX_I	ldx	[%r22 + 0x01b6], %r30
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 1)
	.word 0xb0bd0000  ! 2830: XNORcc_R	xnorcc 	%r20, %r0, %r24
	.word 0xfac5e0fe  ! 2831: LDSWA_I	ldswa	[%r23, + 0x00fe] %asi, %r29
	.word 0xf414e0ab  ! 2832: LDUH_I	lduh	[%r19 + 0x00ab], %r26
	.word 0xf08d4020  ! 2833: LDUBA_R	lduba	[%r21, %r0] 0x01, %r24
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b5a  ! 2834: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b5a, %hpstate
cpu_intr_2_222:
	setx	0x35032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195a1ad  ! 2842: WRPR_PIL_I	wrpr	%r22, 0x01ad, %pil
	.word 0xf0c46056  ! 2845: LDSWA_I	ldswa	[%r17, + 0x0056] %asi, %r24
cpu_intr_2_223:
	setx	0x3031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48c0020  ! 2848: LDUBA_R	lduba	[%r16, %r0] 0x01, %r26
	.word 0xf08c20f9  ! 2849: LDUBA_I	lduba	[%r16, + 0x00f9] %asi, %r24
	ta	T_CHANGE_HPRIV
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_142:
	mov	0x36, %r14
	.word 0xf2db8e40  ! 2857: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 38)
	.word 0xf48d2127  ! 2863: LDUBA_I	lduba	[%r20, + 0x0127] %asi, %r26
T2_asi_reg_rd_143:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 2864: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb835609c  ! 2865: SUBC_I	orn 	%r21, 0x009c, %r28
	.word 0xf215e103  ! 2866: LDUH_I	lduh	[%r23 + 0x0103], %r25
T2_asi_reg_wr_130:
	mov	0x38, %r14
	.word 0xfef38e40  ! 2867: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb2840000  ! 2869: ADDcc_R	addcc 	%r16, %r0, %r25
T2_asi_reg_wr_131:
	mov	0x27, %r14
	.word 0xfef384a0  ! 2870: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_wr_132:
	mov	0x22, %r14
	.word 0xf6f389e0  ! 2875: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_2_224:
	setx	0x370102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa44e0e4  ! 2877: LDSW_I	ldsw	[%r19 + 0x00e4], %r29
T2_asi_reg_rd_144:
	mov	0x38, %r14
	.word 0xf6db89e0  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_225:
	setx	0x340030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_226:
	setx	0x36003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_227:
	setx	0x340038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf085a1ff  ! 2885: LDUWA_I	lduwa	[%r22, + 0x01ff] %asi, %r24
	.word 0xf05c8000  ! 2888: LDX_R	ldx	[%r18 + %r0], %r24
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_rd_145:
	mov	0x3c6, %r14
	.word 0xf6db89e0  ! 2893: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xb81c8000  ! 2898: XOR_R	xor 	%r18, %r0, %r28
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 22)
	.word 0xf8d58020  ! 2902: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_146:
	mov	0x19, %r14
	.word 0xf6db8e60  ! 2904: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf00560fe  ! 2906: LDUW_I	lduw	[%r21 + 0x00fe], %r24
T2_asi_reg_wr_133:
	mov	0x2c, %r14
	.word 0xf4f38e40  ! 2909: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_147:
	mov	0x16, %r14
	.word 0xf0db84a0  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_228:
	setx	0x35033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf894615b  ! 2913: LDUHA_I	lduha	[%r17, + 0x015b] %asi, %r28
	.word 0xf20c4000  ! 2915: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0xfedca0ba  ! 2917: LDXA_I	ldxa	[%r18, + 0x00ba] %asi, %r31
	.word 0xfc454000  ! 2918: LDSW_R	ldsw	[%r21 + %r0], %r30
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_134:
	mov	0x21, %r14
	.word 0xf0f38400  ! 2921: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8b40000  ! 2925: ORNcc_R	orncc 	%r16, %r0, %r28
cpu_intr_2_229:
	setx	0x34013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf404203d  ! 2929: LDUW_I	lduw	[%r16 + 0x003d], %r26
	.word 0xf4d460e7  ! 2930: LDSHA_I	ldsha	[%r17, + 0x00e7] %asi, %r26
	.word 0xf84d8000  ! 2931: LDSB_R	ldsb	[%r22 + %r0], %r28
cpu_intr_2_230:
	setx	0x370200, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_148:
	mov	0x29, %r14
	.word 0xf0db8400  ! 2934: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_rd_149:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 2937: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf854215d  ! 2938: LDSH_I	ldsh	[%r16 + 0x015d], %r28
cpu_intr_2_231:
	setx	0x360135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc54020  ! 2941: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r30
	.word 0xfc854020  ! 2944: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r30
T2_asi_reg_wr_135:
	mov	0x1e, %r14
	.word 0xf6f38e80  ! 2946: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb435a0cc  ! 2948: SUBC_I	orn 	%r22, 0x00cc, %r26
T2_asi_reg_wr_136:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 2953: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_137:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 2955: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_138:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 2957: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf484e1e9  ! 2958: LDUWA_I	lduwa	[%r19, + 0x01e9] %asi, %r26
T2_asi_reg_wr_139:
	mov	0x1b, %r14
	.word 0xf0f38e60  ! 2963: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_232:
	setx	0x34033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_233:
	setx	0x340214, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_150:
	mov	0x1a, %r14
	.word 0xf6db8400  ! 2967: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 16)
	.word 0xfacde1c5  ! 2973: LDSBA_I	ldsba	[%r23, + 0x01c5] %asi, %r29
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf8c5a1b6  ! 2975: LDSWA_I	ldswa	[%r22, + 0x01b6] %asi, %r28
	.word 0xfc5da192  ! 2977: LDX_I	ldx	[%r22 + 0x0192], %r30
	.word 0xf6950020  ! 2978: LDUHA_R	lduha	[%r20, %r0] 0x01, %r27
	.word 0xf284a16e  ! 2981: LDUWA_I	lduwa	[%r18, + 0x016e] %asi, %r25
T2_asi_reg_wr_140:
	mov	0x31, %r14
	.word 0xfaf38e40  ! 2982: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf40dc000  ! 2984: LDUB_R	ldub	[%r23 + %r0], %r26
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, b)
	.word 0xb32c4000  ! 2991: SLL_R	sll 	%r17, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfcd50020  ! 2995: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r30
	.word 0xf0156010  ! 2996: LDUH_I	lduh	[%r21 + 0x0010], %r24
T2_asi_reg_wr_141:
	mov	0x27, %r14
	.word 0xfcf38400  ! 2997: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 7)
	.word 0xf00c6172  ! 3000: LDUB_I	ldub	[%r17 + 0x0172], %r24
	.word 0xf00d60f5  ! 3001: LDUB_I	ldub	[%r21 + 0x00f5], %r24
	.word 0xb8948000  ! 3003: ORcc_R	orcc 	%r18, %r0, %r28
T2_asi_reg_wr_142:
	mov	0x3c0, %r14
	.word 0xfcf389e0  ! 3006: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_rd_151:
	mov	0x2d, %r14
	.word 0xfcdb84a0  ! 3007: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_wr_143:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 3013: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_rd_152:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 3015: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf0854020  ! 3017: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r24
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
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983a4a  ! 3025: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4a, %hpstate
	.word 0xf684e161  ! 3027: LDUWA_I	lduwa	[%r19, + 0x0161] %asi, %r27
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, e)
	ta	T_CHANGE_HPRIV
	.word 0xf414a007  ! 3032: LDUH_I	lduh	[%r18 + 0x0007], %r26
cpu_intr_2_234:
	setx	0x35003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28ce0f2  ! 3034: ANDcc_I	andcc 	%r19, 0x00f2, %r25
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 30)
	.word 0xfec54020  ! 3036: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
	.word 0xfcc5a197  ! 3044: LDSWA_I	ldswa	[%r22, + 0x0197] %asi, %r30
T2_asi_reg_rd_153:
	mov	0x35, %r14
	.word 0xf8db8e40  ! 3045: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfadc6033  ! 3047: LDXA_I	ldxa	[%r17, + 0x0033] %asi, %r29
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 22)
	.word 0xfc140000  ! 3050: LDUH_R	lduh	[%r16 + %r0], %r30
T2_asi_reg_wr_144:
	mov	0xd, %r14
	.word 0xf8f38e40  ! 3052: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf645a0a3  ! 3053: LDSW_I	ldsw	[%r22 + 0x00a3], %r27
T2_asi_reg_rd_154:
	mov	0x1, %r14
	.word 0xf4db8e60  ! 3054: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_235:
	setx	0x37031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88cc020  ! 3060: LDUBA_R	lduba	[%r19, %r0] 0x01, %r28
cpu_intr_2_236:
	setx	0x360010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43d4000  ! 3062: XNOR_R	xnor 	%r21, %r0, %r26
cpu_intr_2_237:
	setx	0x340334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_155:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_wr_145:
	mov	0x1, %r14
	.word 0xf6f38e60  ! 3073: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_rd_156:
	mov	0x38, %r14
	.word 0xf0db8e40  ! 3075: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819829c0  ! 3077: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c0, %hpstate
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982c08  ! 3078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c08, %hpstate
cpu_intr_2_238:
	setx	0x350124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa444000  ! 3082: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xbe944000  ! 3084: ORcc_R	orcc 	%r17, %r0, %r31
	.word 0xbf3dc000  ! 3085: SRA_R	sra 	%r23, %r0, %r31
cpu_intr_2_239:
	setx	0x350134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_240:
	setx	0x360120, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982892  ! 3091: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0892, %hpstate
	.word 0xfe152041  ! 3093: LDUH_I	lduh	[%r20 + 0x0041], %r31
	.word 0xfecd4020  ! 3094: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
	.word 0xfecc4020  ! 3095: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r31
cpu_intr_2_241:
	setx	0x35000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_157:
	mov	0x2f, %r14
	.word 0xf6db89e0  ! 3099: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_242:
	setx	0x34032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_243:
	setx	0x370327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 8)
	.word 0xfa0d8000  ! 3105: LDUB_R	ldub	[%r22 + %r0], %r29
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 32)
	.word 0xb8a5a1ce  ! 3109: SUBcc_I	subcc 	%r22, 0x01ce, %r28
	.word 0xf65ca030  ! 3112: LDX_I	ldx	[%r18 + 0x0030], %r27
	.word 0xf85d0000  ! 3114: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xfecdc020  ! 3116: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r31
	.word 0xf48d2109  ! 3119: LDUBA_I	lduba	[%r20, + 0x0109] %asi, %r26
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf045a12b  ! 3121: LDSW_I	ldsw	[%r22 + 0x012b], %r24
T2_asi_reg_rd_158:
	mov	0x16, %r14
	.word 0xfadb8e40  ! 3123: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_159:
	mov	0xe, %r14
	.word 0xf4db8e40  ! 3127: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_244:
	setx	0x360010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 6)
	.word 0xf80cc000  ! 3140: LDUB_R	ldub	[%r19 + %r0], %r28
T2_asi_reg_rd_160:
	mov	0x2d, %r14
	.word 0xf6db8e40  ! 3142: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc45e0f5  ! 3145: LDSW_I	ldsw	[%r23 + 0x00f5], %r30
	.word 0xba8cc000  ! 3146: ANDcc_R	andcc 	%r19, %r0, %r29
cpu_intr_2_245:
	setx	0x36033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf445c000  ! 3156: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xbe3c60c7  ! 3157: XNOR_I	xnor 	%r17, 0x00c7, %r31
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 18)
	.word 0x9195e017  ! 3159: WRPR_PIL_I	wrpr	%r23, 0x0017, %pil
	.word 0xf40c8000  ! 3160: LDUB_R	ldub	[%r18 + %r0], %r26
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf28da108  ! 3163: LDUBA_I	lduba	[%r22, + 0x0108] %asi, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_246:
	setx	0x35033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_247:
	setx	0x3a0314, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_161:
	mov	0x1, %r14
	.word 0xf0db8e40  ! 3168: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf0158000  ! 3169: LDUH_R	lduh	[%r22 + %r0], %r24
T2_asi_reg_rd_162:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 3170: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982e42  ! 3171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e42, %hpstate
	.word 0xf4054000  ! 3174: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xf8d5c020  ! 3176: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r28
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 3)
	.word 0xf094c020  ! 3182: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
	.word 0xb4ad8000  ! 3184: ANDNcc_R	andncc 	%r22, %r0, %r26
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_163:
	mov	0x34, %r14
	.word 0xf4db8e40  ! 3189: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_164:
	mov	0x25, %r14
	.word 0xf4db89e0  ! 3195: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf29560af  ! 3197: LDUHA_I	lduha	[%r21, + 0x00af] %asi, %r25
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_248:
	setx	0x3b0332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_249:
	setx	0x380323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc04c000  ! 3209: LDUW_R	lduw	[%r19 + %r0], %r30
T2_asi_reg_rd_165:
	mov	0x31, %r14
	.word 0xfedb89e0  ! 3212: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfed58020  ! 3213: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf28d205d  ! 3225: LDUBA_I	lduba	[%r20, + 0x005d] %asi, %r25
	.word 0xfac54020  ! 3226: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
	ta	T_CHANGE_TO_TL1
cpu_intr_2_250:
	setx	0x390203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 1c)
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982950  ! 3237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0950, %hpstate
T2_asi_reg_rd_166:
	mov	0x30, %r14
	.word 0xf6db8e80  ! 3242: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_rd_167:
	mov	0x3c4, %r14
	.word 0xfcdb89e0  ! 3248: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_251:
	setx	0x3a0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x859521eb  ! 3255: WRPR_TSTATE_I	wrpr	%r20, 0x01eb, %tstate
cpu_intr_2_252:
	setx	0x3b013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_rd_168:
	mov	0x17, %r14
	.word 0xf4db8e60  ! 3262: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf004e118  ! 3263: LDUW_I	lduw	[%r19 + 0x0118], %r24
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983d02  ! 3265: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d02, %hpstate
	.word 0xf254a096  ! 3267: LDSH_I	ldsh	[%r18 + 0x0096], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_146:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 3269: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, d)
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_rd_169:
	mov	0x24, %r14
	.word 0xf6db8e80  ! 3276: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_HPRIV
	.word 0xfe844020  ! 3280: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
	.word 0xf4d48020  ! 3281: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
	.word 0xfcd58020  ! 3282: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbe3421eb  ! 3285: ORN_I	orn 	%r16, 0x01eb, %r31
T2_asi_reg_rd_170:
	mov	0x26, %r14
	.word 0xf4db8e80  ! 3287: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_rd_171:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 3289: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfa0d0000  ! 3290: LDUB_R	ldub	[%r20 + %r0], %r29
cpu_intr_2_253:
	setx	0x3a0327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_172:
	mov	0x6, %r14
	.word 0xfcdb8e60  ! 3311: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb53de001  ! 3312: SRA_I	sra 	%r23, 0x0001, %r26
	.word 0xfc4d4000  ! 3313: LDSB_R	ldsb	[%r21 + %r0], %r30
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 5)
	.word 0xf00c4000  ! 3315: LDUB_R	ldub	[%r17 + %r0], %r24
T2_asi_reg_rd_173:
	mov	0x30, %r14
	.word 0xfcdb8e80  ! 3316: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_wr_147:
	mov	0x0, %r14
	.word 0xf8f38e60  ! 3318: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf2cd8020  ! 3319: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
T2_asi_reg_wr_148:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 3320: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfc550000  ! 3323: LDSH_R	ldsh	[%r20 + %r0], %r30
T2_asi_reg_wr_149:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 3325: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_254:
	setx	0x38003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 11)
	ta	T_CHANGE_HPRIV
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 35)
	.word 0xfc942125  ! 3335: LDUHA_I	lduha	[%r16, + 0x0125] %asi, %r30
	.word 0xf2850020  ! 3336: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r25
cpu_intr_2_255:
	setx	0x38021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982d58  ! 3339: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d58, %hpstate
	.word 0xfedca016  ! 3340: LDXA_I	ldxa	[%r18, + 0x0016] %asi, %r31
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 11)
	.word 0xb7358000  ! 3344: SRL_R	srl 	%r22, %r0, %r27
	.word 0xba04a1f7  ! 3345: ADD_I	add 	%r18, 0x01f7, %r29
	.word 0xf8844020  ! 3347: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
cpu_intr_2_256:
	setx	0x38032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 1c)
	ta	T_CHANGE_TO_TL0
	.word 0xf8c44020  ! 3354: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r28
T2_asi_reg_rd_174:
	mov	0x3c7, %r14
	.word 0xfcdb8e80  ! 3356: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfa444000  ! 3367: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xf68c20ba  ! 3369: LDUBA_I	lduba	[%r16, + 0x00ba] %asi, %r27
	.word 0xfe15a18b  ! 3371: LDUH_I	lduh	[%r22 + 0x018b], %r31
T2_asi_reg_rd_175:
	mov	0x12, %r14
	.word 0xf0db8e80  ! 3372: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfc158000  ! 3374: LDUH_R	lduh	[%r22 + %r0], %r30
T2_asi_reg_wr_150:
	mov	0x1b, %r14
	.word 0xfcf38e80  ! 3376: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_rd_176:
	mov	0x2b, %r14
	.word 0xf6db8400  ! 3378: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0x8f902000  ! 3379: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cpu_intr_2_257:
	setx	0x3a0033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_258:
	setx	0x3a031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_259:
	setx	0x380206, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_151:
	mov	0x34, %r14
	.word 0xf6f38e40  ! 3393: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_260:
	setx	0x390314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24da170  ! 3398: LDSB_I	ldsb	[%r22 + 0x0170], %r25
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf295a0ab  ! 3401: LDUHA_I	lduha	[%r22, + 0x00ab] %asi, %r25
cpu_intr_2_261:
	setx	0x39013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, a)
	.word 0xbe0d0000  ! 3405: AND_R	and 	%r20, %r0, %r31
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 35)
	.word 0xf6c4607c  ! 3413: LDSWA_I	ldswa	[%r17, + 0x007c] %asi, %r27
	.word 0xf684e142  ! 3417: LDUWA_I	lduwa	[%r19, + 0x0142] %asi, %r27
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_262:
	setx	0x3b000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_177:
	mov	0xd, %r14
	.word 0xf2db8400  ! 3420: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfa950020  ! 3423: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
T2_asi_reg_wr_152:
	mov	0x25, %r14
	.word 0xfaf389e0  ! 3424: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf45c0000  ! 3425: LDX_R	ldx	[%r16 + %r0], %r26
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 29)
	.word 0xfcc54020  ! 3428: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r30
cpu_intr_2_263:
	setx	0x3b002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_153:
	mov	0xd, %r14
	.word 0xf2f38e60  ! 3433: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_wr_154:
	mov	0x24, %r14
	.word 0xfef38e60  ! 3434: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 21)
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f08  ! 3436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f08, %hpstate
cpu_intr_2_264:
	setx	0x39012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 14)
	.word 0xfa450000  ! 3450: LDSW_R	ldsw	[%r20 + %r0], %r29
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfc84a0e3  ! 3453: LDUWA_I	lduwa	[%r18, + 0x00e3] %asi, %r30
cpu_intr_2_265:
	setx	0x3b0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8de173  ! 3455: LDUBA_I	lduba	[%r23, + 0x0173] %asi, %r30
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_178:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 3462: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf2546125  ! 3464: LDSH_I	ldsh	[%r17 + 0x0125], %r25
cpu_intr_2_266:
	setx	0x3b0125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_267:
	setx	0x3b032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_268:
	setx	0x3b0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f0a  ! 3474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0a, %hpstate
	.word 0xb00c6082  ! 3475: AND_I	and 	%r17, 0x0082, %r24
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 27)
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a42  ! 3478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a42, %hpstate
cpu_intr_2_269:
	setx	0x3a0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08c201b  ! 3485: LDUBA_I	lduba	[%r16, + 0x001b] %asi, %r24
	.word 0xf28ce1a8  ! 3486: LDUBA_I	lduba	[%r19, + 0x01a8] %asi, %r25
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 36)
	.word 0xfc544000  ! 3488: LDSH_R	ldsh	[%r17 + %r0], %r30
cpu_intr_2_270:
	setx	0x390317, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_155:
	mov	0x12, %r14
	.word 0xfaf384a0  ! 3491: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_wr_156:
	mov	0x1f, %r14
	.word 0xf2f38e60  ! 3493: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbc44c000  ! 3495: ADDC_R	addc 	%r19, %r0, %r30
cpu_intr_2_271:
	setx	0x38003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb48000  ! 3497: SUBCcc_R	orncc 	%r18, %r0, %r30
cpu_intr_2_272:
	setx	0x380001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa14e11d  ! 3499: LDUH_I	lduh	[%r19 + 0x011d], %r29
T2_asi_reg_wr_157:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 3501: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf2d40020  ! 3505: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r25
cpu_intr_2_273:
	setx	0x39022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4d0000  ! 3508: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xb6b4e079  ! 3510: SUBCcc_I	orncc 	%r19, 0x0079, %r27
	.word 0xf08d2126  ! 3512: LDUBA_I	lduba	[%r20, + 0x0126] %asi, %r24
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_179:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 3519: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_rd_180:
	mov	0x18, %r14
	.word 0xf6db89e0  ! 3520: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xfe04a04f  ! 3522: LDUW_I	lduw	[%r18 + 0x004f], %r31
	.word 0xf4d44020  ! 3523: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_274:
	setx	0x3a002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_158:
	mov	0x2a, %r14
	.word 0xfcf38e60  ! 3535: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_181:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 3536: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2046150  ! 3540: LDUW_I	lduw	[%r17 + 0x0150], %r25
	.word 0xf28da00f  ! 3541: LDUBA_I	lduba	[%r22, + 0x000f] %asi, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 21)
	.word 0xf65c8000  ! 3548: LDX_R	ldx	[%r18 + %r0], %r27
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_275:
	setx	0x3b0004, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_159:
	mov	0x3c4, %r14
	.word 0xf0f384a0  ! 3555: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_rd_182:
	mov	0xe, %r14
	.word 0xf6db8e80  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_rd_183:
	mov	0x1a, %r14
	.word 0xfadb89e0  ! 3560: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_276:
	setx	0x3b0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40de1a4  ! 3562: AND_I	and 	%r23, 0x01a4, %r26
	.word 0xfe14c000  ! 3563: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xfa442141  ! 3567: LDSW_I	ldsw	[%r16 + 0x0141], %r29
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 38)
	.word 0xf2148000  ! 3572: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xfedc607c  ! 3574: LDXA_I	ldxa	[%r17, + 0x007c] %asi, %r31
	.word 0xf6d4e1d8  ! 3576: LDSHA_I	ldsha	[%r19, + 0x01d8] %asi, %r27
T2_asi_reg_rd_184:
	mov	0x37, %r14
	.word 0xfedb8400  ! 3577: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfc4c8000  ! 3578: LDSB_R	ldsb	[%r18 + %r0], %r30
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 1)
	.word 0xf68dc020  ! 3582: LDUBA_R	lduba	[%r23, %r0] 0x01, %r27
cpu_intr_2_277:
	setx	0x390230, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_160:
	mov	0x13, %r14
	.word 0xf4f38e40  ! 3586: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_185:
	mov	0x31, %r14
	.word 0xf4db8400  ! 3587: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_rd_186:
	mov	0x16, %r14
	.word 0xf8db8e80  ! 3588: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfa8d8020  ! 3591: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
	.word 0xf2d4a098  ! 3592: LDSHA_I	ldsha	[%r18, + 0x0098] %asi, %r25
	.word 0xf68c6164  ! 3593: LDUBA_I	lduba	[%r17, + 0x0164] %asi, %r27
T2_asi_reg_rd_187:
	mov	0x8, %r14
	.word 0xfedb84a0  ! 3596: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfa458000  ! 3598: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xfc548000  ! 3604: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xfc4cc000  ! 3605: LDSB_R	ldsb	[%r19 + %r0], %r30
cpu_intr_2_278:
	setx	0x3b0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf004e036  ! 3610: LDUW_I	lduw	[%r19 + 0x0036], %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_279:
	setx	0x3b003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_280:
	setx	0x3b0336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_281:
	setx	0x3b0114, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_161:
	mov	0x17, %r14
	.word 0xf6f38e40  ! 3624: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf6452046  ! 3625: LDSW_I	ldsw	[%r20 + 0x0046], %r27
	.word 0xbd349000  ! 3626: SRLX_R	srlx	%r18, %r0, %r30
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_162:
	mov	0x1, %r14
	.word 0xfef38e60  ! 3630: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf485e0f7  ! 3631: LDUWA_I	lduwa	[%r23, + 0x00f7] %asi, %r26
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_282:
	setx	0x3f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 23)
	ta	T_CHANGE_TO_TL0
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_163:
	mov	0x1f, %r14
	.word 0xf8f384a0  ! 3646: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T2_asi_reg_rd_188:
	mov	0x19, %r14
	.word 0xf2db8e40  ! 3647: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf484205d  ! 3652: LDUWA_I	lduwa	[%r16, + 0x005d] %asi, %r26
	.word 0xf6958020  ! 3653: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
cpu_intr_2_283:
	setx	0x3c020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_284:
	setx	0x3f0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89d8000  ! 3662: XORcc_R	xorcc 	%r22, %r0, %r28
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_285:
	setx	0x3c0307, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_164:
	mov	0x0, %r14
	.word 0xf0f38e40  ! 3669: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_165:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 3671: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbf7c4400  ! 3672: MOVR_R	movre	%r17, %r0, %r31
	.word 0xfc14a1a2  ! 3673: LDUH_I	lduh	[%r18 + 0x01a2], %r30
T2_asi_reg_rd_189:
	mov	0x21, %r14
	.word 0xfadb8e80  ! 3674: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf6d5208b  ! 3675: LDSHA_I	ldsha	[%r20, + 0x008b] %asi, %r27
cpu_intr_2_286:
	setx	0x3c011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_287:
	setx	0x3e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe152122  ! 3679: LDUH_I	lduh	[%r20 + 0x0122], %r31
	.word 0xf6cce08e  ! 3680: LDSBA_I	ldsba	[%r19, + 0x008e] %asi, %r27
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 8)
	ta	T_CHANGE_TO_TL1
	.word 0xfa0c2087  ! 3684: LDUB_I	ldub	[%r16 + 0x0087], %r29
	.word 0xfc844020  ! 3687: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r30
cpu_intr_2_288:
	setx	0x3c0014, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_166:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 3689: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_289:
	setx	0x3f002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819839d0  ! 3695: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d0, %hpstate
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_290:
	setx	0x3f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_190:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 3705: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb53da001  ! 3707: SRA_I	sra 	%r22, 0x0001, %r26
	.word 0xb7518000  ! 3708: RDPR_PSTATE	rdpr	%pstate, %r27
T2_asi_reg_wr_167:
	mov	0x1b, %r14
	.word 0xf2f38e80  ! 3711: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_291:
	setx	0x3e0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 3713: RDPR_PIL	<illegal instruction>
	.word 0xfec5a1b4  ! 3716: LDSWA_I	ldswa	[%r22, + 0x01b4] %asi, %r31
	.word 0xfe5de0a8  ! 3719: LDX_I	ldx	[%r23 + 0x00a8], %r31
	.word 0xf25d21c5  ! 3720: LDX_I	ldx	[%r20 + 0x01c5], %r25
T2_asi_reg_rd_191:
	mov	0x15, %r14
	.word 0xf4db8e40  ! 3722: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_292:
	setx	0x3d0133, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_168:
	mov	0xa, %r14
	.word 0xf4f38e60  ! 3725: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_169:
	mov	0x1, %r14
	.word 0xf4f38e60  ! 3726: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_rd_192:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 3727: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983e40  ! 3728: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e40, %hpstate
	.word 0xf6140000  ! 3729: LDUH_R	lduh	[%r16 + %r0], %r27
T2_asi_reg_wr_170:
	mov	0x10, %r14
	.word 0xfef384a0  ! 3730: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf20c4000  ! 3732: LDUB_R	ldub	[%r17 + %r0], %r25
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983d82  ! 3733: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d82, %hpstate
T2_asi_reg_rd_193:
	mov	0x36, %r14
	.word 0xf8db8e40  ! 3736: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfccca1e6  ! 3737: LDSBA_I	ldsba	[%r18, + 0x01e6] %asi, %r30
	.word 0xf4040000  ! 3739: LDUW_R	lduw	[%r16 + %r0], %r26
cpu_intr_2_293:
	setx	0x3d012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_171:
	mov	0x3, %r14
	.word 0xf0f38e40  ! 3741: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_194:
	mov	0x3c0, %r14
	.word 0xf0db8e60  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_294:
	setx	0x3d0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dca02d  ! 3745: LDXA_I	ldxa	[%r18, + 0x002d] %asi, %r27
	.word 0xf4040000  ! 3746: LDUW_R	lduw	[%r16 + %r0], %r26
T2_asi_reg_rd_195:
	mov	0xf, %r14
	.word 0xf0db8e80  ! 3747: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_NONHPRIV
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_295:
	setx	0x3c0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc58020  ! 3755: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r30
T2_asi_reg_rd_196:
	mov	0x7, %r14
	.word 0xf4db8e40  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_172:
	mov	0x19, %r14
	.word 0xf6f38e60  ! 3757: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_rd_197:
	mov	0xa, %r14
	.word 0xfedb84a0  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983d4a  ! 3760: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d4a, %hpstate
T2_asi_reg_rd_198:
	mov	0x14, %r14
	.word 0xf2db8e40  ! 3763: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, e)
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 31)
	.word 0xf885c020  ! 3770: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r28
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf6cde023  ! 3777: LDSBA_I	ldsba	[%r23, + 0x0023] %asi, %r27
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_wr_173:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 3784: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_296:
	setx	0x3f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecc4020  ! 3798: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r31
T2_asi_reg_rd_199:
	mov	0x25, %r14
	.word 0xfadb8e60  ! 3799: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb2248000  ! 3804: SUB_R	sub 	%r18, %r0, %r25
	.word 0xf85cc000  ! 3807: LDX_R	ldx	[%r19 + %r0], %r28
cpu_intr_2_297:
	setx	0x3d0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfe0d21f3  ! 3823: LDUB_I	ldub	[%r20 + 0x01f3], %r31
	.word 0xfc542053  ! 3827: LDSH_I	ldsh	[%r16 + 0x0053], %r30
T2_asi_reg_rd_200:
	mov	0x19, %r14
	.word 0xf4db8e80  ! 3829: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf40461c5  ! 3831: LDUW_I	lduw	[%r17 + 0x01c5], %r26
	.word 0xf48d4020  ! 3832: LDUBA_R	lduba	[%r21, %r0] 0x01, %r26
	.word 0xf2452023  ! 3833: LDSW_I	ldsw	[%r20 + 0x0023], %r25
	.word 0xf8c4e18c  ! 3835: LDSWA_I	ldswa	[%r19, + 0x018c] %asi, %r28
	.word 0xf6d48020  ! 3836: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
	.word 0xfe444000  ! 3837: LDSW_R	ldsw	[%r17 + %r0], %r31
T2_asi_reg_wr_174:
	mov	0x34, %r14
	.word 0xf0f384a0  ! 3839: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_201:
	mov	0xe, %r14
	.word 0xf2db89e0  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_HPRIV
	.word 0xf0c48020  ! 3851: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r24
	.word 0xbcc4c000  ! 3852: ADDCcc_R	addccc 	%r19, %r0, %r30
	.word 0xf80520c0  ! 3855: LDUW_I	lduw	[%r20 + 0x00c0], %r28
	.word 0xb734d000  ! 3856: SRLX_R	srlx	%r19, %r0, %r27
cpu_intr_2_298:
	setx	0x3f0133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_299:
	setx	0x3f0022, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_300:
	setx	0x3e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 7)
	.word 0xf0c48020  ! 3874: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
cpu_intr_2_301:
	setx	0x3f021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4042023  ! 3881: LDUW_I	lduw	[%r16 + 0x0023], %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf25de0dc  ! 3883: LDX_I	ldx	[%r23 + 0x00dc], %r25
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf2450000  ! 3886: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xfa540000  ! 3888: LDSH_R	ldsh	[%r16 + %r0], %r29
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 10)
	.word 0xfadce12b  ! 3897: LDXA_I	ldxa	[%r19, + 0x012b] %asi, %r29
	.word 0xb8240000  ! 3900: SUB_R	sub 	%r16, %r0, %r28
	.word 0xf44ca035  ! 3901: LDSB_I	ldsb	[%r18 + 0x0035], %r26
cpu_intr_2_302:
	setx	0x3f031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_202:
	mov	0x19, %r14
	.word 0xf0db8400  ! 3906: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf28d8020  ! 3907: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
	.word 0xf2958020  ! 3909: LDUHA_R	lduha	[%r22, %r0] 0x01, %r25
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 7)
	.word 0xf60560ce  ! 3913: LDUW_I	lduw	[%r21 + 0x00ce], %r27
cpu_intr_2_303:
	setx	0x3f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2956102  ! 3917: ORcc_I	orcc 	%r21, 0x0102, %r25
	.word 0xfe444000  ! 3918: LDSW_R	ldsw	[%r17 + %r0], %r31
T2_asi_reg_rd_203:
	mov	0x10, %r14
	.word 0xfcdb8e40  ! 3919: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_TO_TL1
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_304:
	setx	0x3d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_204:
	mov	0x0, %r14
	.word 0xfadb8400  ! 3934: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_2_305:
	setx	0x3d0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1520000  ! 3938: RDPR_PIL	<illegal instruction>
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_306:
	setx	0x3e030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf05d2021  ! 3947: LDX_I	ldx	[%r20 + 0x0021], %r24
	ta	T_CHANGE_TO_TL0
	.word 0xb4b4e171  ! 3949: SUBCcc_I	orncc 	%r19, 0x0171, %r26
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb52c1000  ! 3959: SLLX_R	sllx	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf65d2023  ! 3961: LDX_I	ldx	[%r20 + 0x0023], %r27
cpu_intr_2_307:
	setx	0x3f0113, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_205:
	mov	0x1c, %r14
	.word 0xfedb8e40  ! 3964: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_175:
	mov	0x3c5, %r14
	.word 0xf2f384a0  ! 3965: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfe9521ff  ! 3966: LDUHA_I	lduha	[%r20, + 0x01ff] %asi, %r31
	.word 0xbd352001  ! 3967: SRL_I	srl 	%r20, 0x0001, %r30
	.word 0xfe156067  ! 3969: LDUH_I	lduh	[%r21 + 0x0067], %r31
	.word 0xfa946115  ! 3970: LDUHA_I	lduha	[%r17, + 0x0115] %asi, %r29
	.word 0xbaad20ed  ! 3971: ANDNcc_I	andncc 	%r20, 0x00ed, %r29
cpu_intr_2_308:
	setx	0x3c021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_309:
	setx	0x3c0329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_310:
	setx	0x3f010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_206:
	mov	0x3c7, %r14
	.word 0xf4db8e60  ! 3980: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb40d2004  ! 3981: AND_I	and 	%r20, 0x0004, %r26
	.word 0xbd2d0000  ! 3984: SLL_R	sll 	%r20, %r0, %r30
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_311:
	setx	0x3e031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_wr_176:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 4003: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_207:
	mov	0x3c8, %r14
	.word 0xf6db8e80  ! 4006: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_wr_177:
	mov	0x2, %r14
	.word 0xf8f38e40  ! 4009: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983c4a  ! 4011: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c4a, %hpstate
	.word 0xf805e142  ! 4012: LDUW_I	lduw	[%r23 + 0x0142], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf805214f  ! 4018: LDUW_I	lduw	[%r20 + 0x014f], %r28
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_wr_178:
	mov	0x1, %r14
	.word 0xf4f389e0  ! 4027: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_312:
	setx	0x3c010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc52166  ! 4033: LDSWA_I	ldswa	[%r20, + 0x0166] %asi, %r30
	.word 0xbd3cf001  ! 4034: SRAX_I	srax	%r19, 0x0001, %r30
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 15)
	.word 0xf4c44020  ! 4037: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r26
T2_asi_reg_rd_208:
	mov	0x3c3, %r14
	.word 0xfedb84a0  ! 4039: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbf34b001  ! 4042: SRLX_I	srlx	%r18, 0x0001, %r31
cpu_intr_2_313:
	setx	0x3e013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_314:
	setx	0x3f0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_315:
	setx	0x3f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b5e023  ! 4052: SUBCcc_I	orncc 	%r23, 0x0023, %r26
	.word 0xf0cd0020  ! 4053: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r24
T2_asi_reg_rd_209:
	mov	0x6, %r14
	.word 0xf4db8e40  ! 4059: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_316:
	setx	0x3e0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08c4020  ! 4064: LDUBA_R	lduba	[%r17, %r0] 0x01, %r24
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, c)
	.word 0xbcbc615e  ! 4068: XNORcc_I	xnorcc 	%r17, 0x015e, %r30
T2_asi_reg_wr_179:
	mov	0x1d, %r14
	.word 0xfef38e80  ! 4071: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_2_317:
	setx	0x3f011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec54020  ! 4073: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
cpu_intr_2_318:
	setx	0x3f0135, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_180:
	mov	0xb, %r14
	.word 0xf6f38400  ! 4075: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T2_asi_reg_wr_181:
	mov	0x5, %r14
	.word 0xf4f38e60  ! 4078: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf24c8000  ! 4080: LDSB_R	ldsb	[%r18 + %r0], %r25
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_wr_182:
	mov	0x37, %r14
	.word 0xfef38400  ! 4084: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfcdda017  ! 4085: LDXA_I	ldxa	[%r22, + 0x0017] %asi, %r30
T2_asi_reg_wr_183:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 4087: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_319:
	setx	0x10208, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_184:
	mov	0x20, %r14
	.word 0xfaf384a0  ! 4089: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbcc5a12a  ! 4090: ADDCcc_I	addccc 	%r22, 0x012a, %r30
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_320:
	setx	0x3e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_321:
	setx	0x3f0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1de01d  ! 4099: XOR_I	xor 	%r23, 0x001d, %r29
	.word 0xfc152023  ! 4102: LDUH_I	lduh	[%r20 + 0x0023], %r30
cpu_intr_2_322:
	setx	0x410239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc52119  ! 4104: LDSWA_I	ldswa	[%r20, + 0x0119] %asi, %r30
	ta	T_CHANGE_TO_TL1
cpu_intr_2_323:
	setx	0x43033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 26)
	.word 0xf8cda06e  ! 4114: LDSBA_I	ldsba	[%r22, + 0x006e] %asi, %r28
	.word 0xf4540000  ! 4115: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xb03560be  ! 4117: SUBC_I	orn 	%r21, 0x00be, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_185:
	mov	0x2b, %r14
	.word 0xf8f38e80  ! 4122: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, b)
	.word 0xbc95a049  ! 4126: ORcc_I	orcc 	%r22, 0x0049, %r30
T2_asi_reg_rd_210:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 4129: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfad4613d  ! 4131: LDSHA_I	ldsha	[%r17, + 0x013d] %asi, %r29
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 16)
	ta	T_CHANGE_TO_TL1
	.word 0xf245e130  ! 4139: LDSW_I	ldsw	[%r23 + 0x0130], %r25
	.word 0xf2144000  ! 4140: LDUH_R	lduh	[%r17 + %r0], %r25
T2_asi_reg_rd_211:
	mov	0x1b, %r14
	.word 0xfadb8e40  ! 4142: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf6946184  ! 4143: LDUHA_I	lduha	[%r17, + 0x0184] %asi, %r27
cpu_intr_2_324:
	setx	0x430305, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_212:
	mov	0xd, %r14
	.word 0xf0db8e60  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfecc0020  ! 4148: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r31
	.word 0xb645e041  ! 4149: ADDC_I	addc 	%r23, 0x0041, %r27
	.word 0xb350c000  ! 4151: RDPR_TT	<illegal instruction>
	.word 0xf0c48020  ! 4152: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r24
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_213:
	mov	0x1, %r14
	.word 0xf8db84a0  ! 4156: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_325:
	setx	0x430138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabc8000  ! 4161: XNORcc_R	xnorcc 	%r18, %r0, %r29
	.word 0xf25c8000  ! 4162: LDX_R	ldx	[%r18 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_214:
	mov	0x1b, %r14
	.word 0xf2db8e80  ! 4165: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_215:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 4168: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf28d8020  ! 4171: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
	.word 0xf055201a  ! 4173: LDSH_I	ldsh	[%r20 + 0x001a], %r24
	ta	T_CHANGE_HPRIV
	.word 0x8595205f  ! 4175: WRPR_TSTATE_I	wrpr	%r20, 0x005f, %tstate
	.word 0xf044604a  ! 4176: LDSW_I	ldsw	[%r17 + 0x004a], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_326:
	setx	0x400024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, b)
	.word 0xf2554000  ! 4185: LDSH_R	ldsh	[%r21 + %r0], %r25
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf005c000  ! 4188: LDUW_R	lduw	[%r23 + %r0], %r24
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_216:
	mov	0xf, %r14
	.word 0xf4db8e80  ! 4194: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_rd_217:
	mov	0x3c0, %r14
	.word 0xf0db8e60  ! 4195: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_327:
	setx	0x400336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf695c020  ! 4197: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
	.word 0xfe454000  ! 4198: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xfe4d4000  ! 4200: LDSB_R	ldsb	[%r21 + %r0], %r31
cpu_intr_2_328:
	setx	0x43033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_329:
	setx	0x400103, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf64da05a  ! 4207: LDSB_I	ldsb	[%r22 + 0x005a], %r27
	.word 0xf48c4020  ! 4211: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
	.word 0xfa8d6035  ! 4212: LDUBA_I	lduba	[%r21, + 0x0035] %asi, %r29
cpu_intr_2_330:
	setx	0x410129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92c4000  ! 4214: SLL_R	sll 	%r17, %r0, %r28
	.word 0xf685e026  ! 4215: LDUWA_I	lduwa	[%r23, + 0x0026] %asi, %r27
	.word 0xb0a48000  ! 4221: SUBcc_R	subcc 	%r18, %r0, %r24
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 2)
	.word 0xfac58020  ! 4224: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r29
T2_asi_reg_rd_218:
	mov	0x0, %r14
	.word 0xfcdb8400  ! 4226: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T2_asi_reg_wr_186:
	mov	0x33, %r14
	.word 0xf8f38400  ! 4227: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfc4cc000  ! 4229: LDSB_R	ldsb	[%r19 + %r0], %r30
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_187:
	mov	0x33, %r14
	.word 0xf0f38e40  ! 4232: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 1)
	.word 0xf04ce1b3  ! 4242: LDSB_I	ldsb	[%r19 + 0x01b3], %r24
	.word 0xf014a089  ! 4248: LDUH_I	lduh	[%r18 + 0x0089], %r24
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfe55a130  ! 4254: LDSH_I	ldsh	[%r22 + 0x0130], %r31
	.word 0xfc4ce0c3  ! 4256: LDSB_I	ldsb	[%r19 + 0x00c3], %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_331:
	setx	0x410204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c48020  ! 4263: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
T2_asi_reg_wr_188:
	mov	0xd, %r14
	.word 0xf4f384a0  ! 4268: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf885e0d5  ! 4274: LDUWA_I	lduwa	[%r23, + 0x00d5] %asi, %r28
cpu_intr_2_332:
	setx	0x43011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_189:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 4282: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb8954000  ! 4283: ORcc_R	orcc 	%r21, %r0, %r28
T2_asi_reg_wr_190:
	mov	0x1e, %r14
	.word 0xfcf38e40  ! 4284: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_rd_219:
	mov	0x32, %r14
	.word 0xfcdb89e0  ! 4287: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_wr_191:
	mov	0x9, %r14
	.word 0xf0f38e60  ! 4289: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c5a  ! 4291: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5a, %hpstate
cpu_intr_2_333:
	setx	0x400336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_334:
	setx	0x410326, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_192:
	mov	0x7, %r14
	.word 0xf4f38e80  ! 4296: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbe0d21b6  ! 4298: AND_I	and 	%r20, 0x01b6, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xf4d5a1c1  ! 4302: LDSHA_I	ldsha	[%r22, + 0x01c1] %asi, %r26
T2_asi_reg_wr_193:
	mov	0x1d, %r14
	.word 0xf4f38400  ! 4303: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_wr_194:
	mov	0x16, %r14
	.word 0xf4f38e40  ! 4304: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 23)
	.word 0xf80c4000  ! 4311: LDUB_R	ldub	[%r17 + %r0], %r28
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 0)
	.word 0xf694e1de  ! 4314: LDUHA_I	lduha	[%r19, + 0x01de] %asi, %r27
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, a)
	.word 0xf81521ee  ! 4316: LDUH_I	lduh	[%r20 + 0x01ee], %r28
T2_asi_reg_wr_195:
	mov	0x10, %r14
	.word 0xfaf384a0  ! 4319: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe858020  ! 4325: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r31
	.word 0xbac4a0c6  ! 4326: ADDCcc_I	addccc 	%r18, 0x00c6, %r29
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, c)
	.word 0xb294a07c  ! 4329: ORcc_I	orcc 	%r18, 0x007c, %r25
cpu_intr_2_335:
	setx	0x41010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_220:
	mov	0xa, %r14
	.word 0xf0db8e60  ! 4332: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_wr_196:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 4337: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfad5c020  ! 4338: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xfc8c2152  ! 4348: LDUBA_I	lduba	[%r16, + 0x0152] %asi, %r30
	.word 0xf88de19b  ! 4351: LDUBA_I	lduba	[%r23, + 0x019b] %asi, %r28
T2_asi_reg_rd_221:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 4353: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfe5d21f9  ! 4354: LDX_I	ldx	[%r20 + 0x01f9], %r31
	.word 0xf684a043  ! 4355: LDUWA_I	lduwa	[%r18, + 0x0043] %asi, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_222:
	mov	0x38, %r14
	.word 0xf8db8e40  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_197:
	mov	0xc, %r14
	.word 0xfef38400  ! 4358: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf80c4000  ! 4359: LDUB_R	ldub	[%r17 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0xb88d61f1  ! 4364: ANDcc_I	andcc 	%r21, 0x01f1, %r28
cpu_intr_2_336:
	setx	0x410234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 39)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_198:
	mov	0x18, %r14
	.word 0xfaf38e60  ! 4370: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfccd21a9  ! 4371: LDSBA_I	ldsba	[%r20, + 0x01a9] %asi, %r30
	.word 0xf60da1a1  ! 4376: LDUB_I	ldub	[%r22 + 0x01a1], %r27
	.word 0xf0548000  ! 4377: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xf6454000  ! 4379: LDSW_R	ldsw	[%r21 + %r0], %r27
T2_asi_reg_wr_199:
	mov	0x31, %r14
	.word 0xf4f384a0  ! 4380: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_rd_223:
	mov	0xe, %r14
	.word 0xfadb89e0  ! 4381: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982ac2  ! 4383: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac2, %hpstate
T2_asi_reg_wr_200:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 4387: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_224:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 4389: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe440000  ! 4392: LDSW_R	ldsw	[%r16 + %r0], %r31
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 3)
	.word 0xf8550000  ! 4395: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xb83dc000  ! 4396: XNOR_R	xnor 	%r23, %r0, %r28
	.word 0xf40dc000  ! 4399: LDUB_R	ldub	[%r23 + %r0], %r26
T2_asi_reg_rd_225:
	mov	0x2d, %r14
	.word 0xf0db8e80  ! 4401: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_337:
	setx	0x41020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_226:
	mov	0x3c2, %r14
	.word 0xfcdb89e0  ! 4407: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 12)
	.word 0xf00cc000  ! 4413: LDUB_R	ldub	[%r19 + %r0], %r24
cpu_intr_2_338:
	setx	0x40033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_339:
	setx	0x400331, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1510000  ! 4422: RDPR_TICK	<illegal instruction>
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 1)
	.word 0xf88c4020  ! 4425: LDUBA_R	lduba	[%r17, %r0] 0x01, %r28
	.word 0xf24d61a9  ! 4432: LDSB_I	ldsb	[%r21 + 0x01a9], %r25
cpu_intr_2_340:
	setx	0x400319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 10)
	.word 0xf80c60b4  ! 4437: LDUB_I	ldub	[%r17 + 0x00b4], %r28
	.word 0xbca40000  ! 4439: SUBcc_R	subcc 	%r16, %r0, %r30
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982840  ! 4440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0840, %hpstate
	.word 0xf8140000  ! 4443: LDUH_R	lduh	[%r16 + %r0], %r28
cpu_intr_2_341:
	setx	0x420114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5ca187  ! 4445: LDX_I	ldx	[%r18 + 0x0187], %r31
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 18)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_227:
	mov	0x2a, %r14
	.word 0xf6db84a0  ! 4453: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 37)
	.word 0xb81d0000  ! 4458: XOR_R	xor 	%r20, %r0, %r28
cpu_intr_2_342:
	setx	0x40010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_343:
	setx	0x420120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d5e05e  ! 4466: LDSHA_I	ldsha	[%r23, + 0x005e] %asi, %r26
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 2c)
	.word 0xa1902000  ! 4469: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xf0c460e1  ! 4470: LDSWA_I	ldswa	[%r17, + 0x00e1] %asi, %r24
T2_asi_reg_wr_201:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 4473: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfe4da1b6  ! 4474: LDSB_I	ldsb	[%r22 + 0x01b6], %r31
	.word 0xb4a5c000  ! 4475: SUBcc_R	subcc 	%r23, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0xf0048000  ! 4477: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xf044c000  ! 4478: LDSW_R	ldsw	[%r19 + %r0], %r24
T2_asi_reg_rd_228:
	mov	0x3c6, %r14
	.word 0xf2db8e60  ! 4479: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf0d44020  ! 4480: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r24
	.word 0xbd340000  ! 4482: SRL_R	srl 	%r16, %r0, %r30
T2_asi_reg_rd_229:
	mov	0x36, %r14
	.word 0xf4db8e40  ! 4485: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf84de113  ! 4486: LDSB_I	ldsb	[%r23 + 0x0113], %r28
cpu_intr_2_344:
	setx	0x410327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 4492: MOVcc_I	<illegal instruction>
	.word 0xf0cc8020  ! 4493: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r24
T2_asi_reg_wr_202:
	mov	0x21, %r14
	.word 0xf6f38e60  ! 4494: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfacc8020  ! 4495: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r29
	.word 0xf01421c1  ! 4499: LDUH_I	lduh	[%r16 + 0x01c1], %r24
	.word 0xba8c4000  ! 4501: ANDcc_R	andcc 	%r17, %r0, %r29
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819828d0  ! 4502: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d0, %hpstate
cpu_intr_2_345:
	setx	0x410328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf25d61cc  ! 4509: LDX_I	ldx	[%r21 + 0x01cc], %r25
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, f)
	.word 0xf68d8020  ! 4513: LDUBA_R	lduba	[%r22, %r0] 0x01, %r27
T2_asi_reg_wr_203:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 4514: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb93cf001  ! 4515: SRAX_I	srax	%r19, 0x0001, %r28
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_230:
	mov	0x14, %r14
	.word 0xf6db84a0  ! 4518: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_2_346:
	setx	0x40030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_347:
	setx	0x41003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80d0000  ! 4524: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xf6c4e1fa  ! 4525: LDSWA_I	ldswa	[%r19, + 0x01fa] %asi, %r27
	.word 0xf0c54020  ! 4526: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r24
	.word 0xbe358000  ! 4527: SUBC_R	orn 	%r22, %r0, %r31
	.word 0xfa5d0000  ! 4530: LDX_R	ldx	[%r20 + %r0], %r29
cpu_intr_2_348:
	setx	0x400007, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_204:
	mov	0x24, %r14
	.word 0xf8f38e60  ! 4536: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf4d5a129  ! 4538: LDSHA_I	ldsha	[%r22, + 0x0129] %asi, %r26
cpu_intr_2_349:
	setx	0x430008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d6087  ! 4541: LDX_I	ldx	[%r21 + 0x0087], %r28
cpu_intr_2_350:
	setx	0x42011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65ca0d6  ! 4548: LDX_I	ldx	[%r18 + 0x00d6], %r27
T2_asi_reg_wr_205:
	mov	0x3c4, %r14
	.word 0xfef389e0  ! 4549: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb0c44000  ! 4550: ADDCcc_R	addccc 	%r17, %r0, %r24
	.word 0xb8ad4000  ! 4551: ANDNcc_R	andncc 	%r21, %r0, %r28
T2_asi_reg_wr_206:
	mov	0x3c1, %r14
	.word 0xfcf384a0  ! 4556: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfc0c8000  ! 4557: LDUB_R	ldub	[%r18 + %r0], %r30
cpu_intr_2_351:
	setx	0x47012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4050000  ! 4567: LDUW_R	lduw	[%r20 + %r0], %r26
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_352:
	setx	0x440025, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b18  ! 4576: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b18, %hpstate
T2_asi_reg_wr_207:
	mov	0x3c0, %r14
	.word 0xf4f389e0  ! 4579: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf8cc8020  ! 4581: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_353:
	setx	0x47010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf615614f  ! 4587: LDUH_I	lduh	[%r21 + 0x014f], %r27
T2_asi_reg_wr_208:
	mov	0x37, %r14
	.word 0xf0f384a0  ! 4596: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_354:
	setx	0x440104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20c21f9  ! 4601: LDUB_I	ldub	[%r16 + 0x01f9], %r25
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_355:
	setx	0x460116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_356:
	setx	0x440333, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_231:
	mov	0xb, %r14
	.word 0xfedb8e60  ! 4605: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf8d56123  ! 4611: LDSHA_I	ldsha	[%r21, + 0x0123] %asi, %r28
	.word 0xfc04e1d6  ! 4613: LDUW_I	lduw	[%r19 + 0x01d6], %r30
T2_asi_reg_wr_209:
	mov	0x2f, %r14
	.word 0xfaf389e0  ! 4614: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_357:
	setx	0x470330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfadc20af  ! 4617: LDXA_I	ldxa	[%r16, + 0x00af] %asi, %r29
T2_asi_reg_wr_210:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 4618: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf6cc20be  ! 4621: LDSBA_I	ldsba	[%r16, + 0x00be] %asi, %r27
T2_asi_reg_wr_211:
	mov	0x3c3, %r14
	.word 0xf6f384a0  ! 4622: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf695c020  ! 4623: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
cpu_intr_2_358:
	setx	0x460206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d4a0d3  ! 4625: LDSHA_I	ldsha	[%r18, + 0x00d3] %asi, %r28
cpu_intr_2_359:
	setx	0x460315, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_232:
	mov	0x3c4, %r14
	.word 0xfcdb8400  ! 4627: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_360:
	setx	0x470105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa95e1a3  ! 4629: LDUHA_I	lduha	[%r23, + 0x01a3] %asi, %r29
	.word 0xb97d6401  ! 4632: MOVR_I	movre	%r21, 0x1, %r28
	.word 0xf4950020  ! 4634: LDUHA_R	lduha	[%r20, %r0] 0x01, %r26
cpu_intr_2_361:
	setx	0x450204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf844212f  ! 4637: LDSW_I	ldsw	[%r16 + 0x012f], %r28
	.word 0xf405e171  ! 4639: LDUW_I	lduw	[%r23 + 0x0171], %r26
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_212:
	mov	0x17, %r14
	.word 0xf0f384a0  ! 4642: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_362:
	setx	0x45010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85c0000  ! 4647: LDX_R	ldx	[%r16 + %r0], %r28
T2_asi_reg_rd_233:
	mov	0x10, %r14
	.word 0xf0db8400  ! 4648: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 2a)
	ta	T_CHANGE_HPRIV
	.word 0xf605e1df  ! 4655: LDUW_I	lduw	[%r23 + 0x01df], %r27
T2_asi_reg_wr_213:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 4659: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	.word 0xf0d48020  ! 4662: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r24
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 31)
	.word 0xf2544000  ! 4668: LDSH_R	ldsh	[%r17 + %r0], %r25
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf08d4020  ! 4671: LDUBA_R	lduba	[%r21, %r0] 0x01, %r24
	.word 0xf20d4000  ! 4673: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0xf28dc020  ! 4674: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
T2_asi_reg_wr_214:
	mov	0x5, %r14
	.word 0xfcf38e60  ! 4675: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb3340000  ! 4676: SRL_R	srl 	%r16, %r0, %r25
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_363:
	setx	0x47030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0448000  ! 4681: LDSW_R	ldsw	[%r18 + %r0], %r24
cpu_intr_2_364:
	setx	0x450119, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 29)
	.word 0xfe4c0000  ! 4688: LDSB_R	ldsb	[%r16 + %r0], %r31
cpu_intr_2_365:
	setx	0x450104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf844a045  ! 4692: LDSW_I	ldsw	[%r18 + 0x0045], %r28
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_wr_215:
	mov	0xb, %r14
	.word 0xfef38e60  ! 4696: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T2_asi_reg_rd_234:
	mov	0x1e, %r14
	.word 0xf8db89e0  ! 4697: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfe04e11f  ! 4698: LDUW_I	lduw	[%r19 + 0x011f], %r31
cpu_intr_2_366:
	setx	0x460232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_235:
	mov	0x2b, %r14
	.word 0xf2db84a0  ! 4705: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_367:
	setx	0x460028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73d7001  ! 4709: SRAX_I	srax	%r21, 0x0001, %r27
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 29)
	.word 0xbeb44000  ! 4711: ORNcc_R	orncc 	%r17, %r0, %r31
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 19)
	.word 0xf24c4000  ! 4716: LDSB_R	ldsb	[%r17 + %r0], %r25
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_216:
	mov	0x14, %r14
	.word 0xfef38400  ! 4719: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb03ca045  ! 4720: XNOR_I	xnor 	%r18, 0x0045, %r24
	.word 0xbd480000  ! 4721: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
T2_asi_reg_rd_236:
	mov	0x16, %r14
	.word 0xf4db8e40  ! 4722: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfccc8020  ! 4724: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r30
	.word 0xf4d58020  ! 4725: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r26
cpu_intr_2_368:
	setx	0x470012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba24a144  ! 4729: SUB_I	sub 	%r18, 0x0144, %r29
	.word 0xfacd8020  ! 4730: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 35)
	.word 0xf295217a  ! 4733: LDUHA_I	lduha	[%r20, + 0x017a] %asi, %r25
cpu_intr_2_369:
	setx	0x46022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_370:
	setx	0x450009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4954000  ! 4737: ORcc_R	orcc 	%r21, %r0, %r26
	.word 0xfe5c4000  ! 4739: LDX_R	ldx	[%r17 + %r0], %r31
	.word 0xfe04a0a6  ! 4741: LDUW_I	lduw	[%r18 + 0x00a6], %r31
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 10)
	.word 0xfe0d0000  ! 4745: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0xf6956073  ! 4746: LDUHA_I	lduha	[%r21, + 0x0073] %asi, %r27
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 38)
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983f08  ! 4748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f08, %hpstate
	.word 0xf4152060  ! 4750: LDUH_I	lduh	[%r20 + 0x0060], %r26
	.word 0xfacd8020  ! 4751: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 14)
	.word 0xbb35a001  ! 4753: SRL_I	srl 	%r22, 0x0001, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xf20c217c  ! 4755: LDUB_I	ldub	[%r16 + 0x017c], %r25
	.word 0xfc8d20dc  ! 4757: LDUBA_I	lduba	[%r20, + 0x00dc] %asi, %r30
	.word 0xf2c54020  ! 4758: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r25
cpu_intr_2_371:
	setx	0x450309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 1f)
	ta	T_CHANGE_NONHPRIV
	.word 0xfa5d8000  ! 4770: LDX_R	ldx	[%r22 + %r0], %r29
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 26)
	.word 0xfe9420df  ! 4774: LDUHA_I	lduha	[%r16, + 0x00df] %asi, %r31
	.word 0xf8c44020  ! 4776: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r28
	.word 0xb20d8000  ! 4778: AND_R	and 	%r22, %r0, %r25
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 3)
	.word 0xfe540000  ! 4782: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xb734c000  ! 4784: SRL_R	srl 	%r19, %r0, %r27
	.word 0xfe858020  ! 4786: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r31
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf29460d9  ! 4788: LDUHA_I	lduha	[%r17, + 0x00d9] %asi, %r25
	.word 0xf2c44020  ! 4789: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r25
	.word 0xb21da1b9  ! 4790: XOR_I	xor 	%r22, 0x01b9, %r25
	.word 0xb5540000  ! 4792: RDPR_GL	<illegal instruction>
T2_asi_reg_wr_217:
	mov	0x6, %r14
	.word 0xf8f38e40  ! 4793: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_372:
	setx	0x47023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_373:
	setx	0x440333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3cb001  ! 4802: SRAX_I	srax	%r18, 0x0001, %r31
T2_asi_reg_rd_237:
	mov	0x3c7, %r14
	.word 0xf2db8e80  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_rd_238:
	mov	0x3c3, %r14
	.word 0xfadb8400  ! 4807: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_2_374:
	setx	0x470004, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_239:
	mov	0x13, %r14
	.word 0xfcdb8400  ! 4811: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf695c020  ! 4812: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
	.word 0xfe94a1f2  ! 4816: LDUHA_I	lduha	[%r18, + 0x01f2] %asi, %r31
	.word 0xfa940020  ! 4817: LDUHA_R	lduha	[%r16, %r0] 0x01, %r29
T2_asi_reg_wr_218:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 4820: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 32)
	.word 0xa1902001  ! 4824: WRPR_GL_I	wrpr	%r0, 0x0001, %-
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 16)
	.word 0xfe5460ca  ! 4828: LDSH_I	ldsh	[%r17 + 0x00ca], %r31
	.word 0xf45ca149  ! 4830: LDX_I	ldx	[%r18 + 0x0149], %r26
cpu_intr_2_375:
	setx	0x470016, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe442145  ! 4834: LDSW_I	ldsw	[%r16 + 0x0145], %r31
T2_asi_reg_wr_219:
	mov	0x27, %r14
	.word 0xfef389e0  ! 4836: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_NONHPRIV
	.word 0xf6144000  ! 4851: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xfa95c020  ! 4852: LDUHA_R	lduha	[%r23, %r0] 0x01, %r29
	.word 0xfa4ca036  ! 4855: LDSB_I	ldsb	[%r18 + 0x0036], %r29
	.word 0xf2c54020  ! 4859: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r25
T2_asi_reg_rd_240:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 4860: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f48  ! 4861: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f48, %hpstate
cpu_intr_2_376:
	setx	0x44031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf015e144  ! 4864: LDUH_I	lduh	[%r23 + 0x0144], %r24
	.word 0xfe0d0000  ! 4865: LDUB_R	ldub	[%r20 + %r0], %r31
T2_asi_reg_rd_241:
	mov	0x15, %r14
	.word 0xf4db84a0  ! 4866: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_377:
	setx	0x47003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_378:
	setx	0x45021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8158000  ! 4872: LDUH_R	lduh	[%r22 + %r0], %r28
T2_asi_reg_wr_220:
	mov	0x32, %r14
	.word 0xfef389e0  ! 4875: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983d42  ! 4876: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d42, %hpstate
T2_asi_reg_rd_242:
	mov	0xf, %r14
	.word 0xfcdb8e60  ! 4877: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf0d44020  ! 4879: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r24
	.word 0xf8dda19a  ! 4883: LDXA_I	ldxa	[%r22, + 0x019a] %asi, %r28
cpu_intr_2_379:
	setx	0x460022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6456193  ! 4886: LDSW_I	ldsw	[%r21 + 0x0193], %r27
	.word 0xb2c5c000  ! 4888: ADDCcc_R	addccc 	%r23, %r0, %r25
cpu_intr_2_380:
	setx	0x470221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_381:
	setx	0x440029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73ca001  ! 4895: SRA_I	sra 	%r18, 0x0001, %r27
	.word 0xfcc460d7  ! 4897: LDSWA_I	ldswa	[%r17, + 0x00d7] %asi, %r30
	.word 0xfed520b5  ! 4899: LDSHA_I	ldsha	[%r20, + 0x00b5] %asi, %r31
iob_intr_2_396:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_396), 16, 16)) -> intp(2, 0, 9)
	ta	T_CHANGE_HPRIV
iob_intr_2_397:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_397), 16, 16)) -> intp(2, 0, c)
	.word 0xf804c000  ! 4911: LDUW_R	lduw	[%r19 + %r0], %r28
T2_asi_reg_wr_221:
	mov	0x23, %r14
	.word 0xf4f38e80  ! 4915: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb8bd613a  ! 4916: XNORcc_I	xnorcc 	%r21, 0x013a, %r28
	.word 0xb41cc000  ! 4917: XOR_R	xor 	%r19, %r0, %r26
	.word 0xfcd50020  ! 4918: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r30
T2_asi_reg_wr_222:
	mov	0x1e, %r14
	.word 0xf8f384a0  ! 4919: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfed4e131  ! 4920: LDSHA_I	ldsha	[%r19, + 0x0131] %asi, %r31
	.word 0xf644e01e  ! 4921: LDSW_I	ldsw	[%r19 + 0x001e], %r27
	.word 0xf24cc000  ! 4922: LDSB_R	ldsb	[%r19 + %r0], %r25
iob_intr_2_398:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_398), 16, 16)) -> intp(2, 0, 32)
	.word 0xf6840020  ! 4924: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_243:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 4926: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_2_399:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_399), 16, 16)) -> intp(2, 0, c)
	.word 0xb6240000  ! 4928: SUB_R	sub 	%r16, %r0, %r27
iob_intr_2_400:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_400), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf6cc4020  ! 4935: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r27
cpu_intr_2_382:
	setx	0x440127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_383:
	setx	0x450130, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_244:
	mov	0x24, %r14
	.word 0xf2db8400  ! 4944: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_rd_245:
	mov	0x31, %r14
	.word 0xfadb8400  ! 4945: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_401:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_401), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_384:
	setx	0x440314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1d4000  ! 4948: XOR_R	xor 	%r21, %r0, %r29
	.word 0xfe8da0f1  ! 4949: LDUBA_I	lduba	[%r22, + 0x00f1] %asi, %r31
cpu_intr_2_385:
	setx	0x450133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5ce107  ! 4955: LDX_I	ldx	[%r19 + 0x0107], %r30
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982940  ! 4957: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0940, %hpstate
	.word 0xfe0da04c  ! 4959: LDUB_I	ldub	[%r22 + 0x004c], %r31
iob_intr_2_402:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_402), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_246:
	mov	0xa, %r14
	.word 0xfcdb8e60  ! 4962: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_403:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_403), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_386:
	setx	0x450214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_387:
	setx	0x470002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00c0000  ! 4976: LDUB_R	ldub	[%r16 + %r0], %r24
T2_asi_reg_wr_223:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 4982: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
	.word 0xfa0de1f8  ! 4985: LDUB_I	ldub	[%r23 + 0x01f8], %r29
	.word 0xfc94a002  ! 4988: LDUHA_I	lduha	[%r18, + 0x0002] %asi, %r30
T2_asi_reg_wr_224:
	mov	0x7, %r14
	.word 0xfaf389e0  ! 4989: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_388:
	setx	0x47002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf895c020  ! 4991: LDUHA_R	lduha	[%r23, %r0] 0x01, %r28
T2_asi_reg_rd_247:
	mov	0x3c8, %r14
	.word 0xfadb8e60  ! 4992: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_2_404:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_404), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_rd_248:
	mov	0xb, %r14
	.word 0xf0db8e60  ! 4996: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_rd_249:
	mov	0x2d, %r14
	.word 0xf4db84a0  ! 4997: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_405:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_405), 16, 16)) -> intp(2, 0, 2c)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
T1_asi_reg_wr_0:
	mov	0x1e, %r14
	.word 0xfef38e60  ! 1: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_0:
	setx	0x1b0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b5c000  ! 7: SUBCcc_R	orncc 	%r23, %r0, %r27
	.word 0xbba5c940  ! 8: FMULd	fmuld	%f54, %f0, %f60
	.word 0xa1902000  ! 12: WRPR_GL_I	wrpr	%r0, 0x0000, %-
T1_asi_reg_rd_0:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 13: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb1a8c820  ! 14: FMOVL	fmovs	%fcc1, %f0, %f24
cpu_intr_1_1:
	setx	0x1c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00020  ! 19: FMOVs	fmovs	%f0, %f29
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_wr_1:
	mov	0x1c, %r14
	.word 0xf8f38e40  ! 31: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9a508a0  ! 34: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xb1abc820  ! 35: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb6ac2042  ! 36: ANDNcc_I	andncc 	%r16, 0x0042, %r27
	.word 0xbfa48920  ! 38: FMULs	fmuls	%f18, %f0, %f31
cpu_intr_1_2:
	setx	0x1c0134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_3:
	setx	0x1e0030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_4:
	setx	0x1d0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a588e0  ! 52: FSUBq	dis not found

T1_asi_reg_wr_2:
	mov	0x28, %r14
	.word 0xf0f38e80  ! 57: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_wr_3:
	mov	0xd, %r14
	.word 0xf0f38e80  ! 59: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_rd_1:
	mov	0x3, %r14
	.word 0xf8db8400  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb2bd4000  ! 61: XNORcc_R	xnorcc 	%r21, %r0, %r25
	.word 0x81946004  ! 62: WRPR_TPC_I	wrpr	%r17, 0x0004, %tpc
	.word 0xbba80820  ! 65: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbfa8c820  ! 66: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb3a40940  ! 67: FMULd	fmuld	%f16, %f0, %f56
	.word 0xbfab8820  ! 70: FMOVPOS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_4:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 72: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 18)
	.word 0xb5a94820  ! 76: FMOVCS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_2:
	mov	0x23, %r14
	.word 0xf0db8e60  ! 77: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T1_asi_reg_wr_5:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 79: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb3a489a0  ! 81: FDIVs	fdivs	%f18, %f0, %f25
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_5:
	setx	0x1c0209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_6:
	setx	0x1d0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c960  ! 96: FMULq	dis not found

cpu_intr_1_7:
	setx	0x1e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_8:
	setx	0x1e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_3:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T1_asi_reg_rd_4:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 108: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbfa549e0  ! 110: FDIVq	dis not found

iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 17)
	.word 0xb1a408c0  ! 112: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xbfaa4820  ! 113: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbbab0820  ! 114: FMOVGU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_5:
	mov	0x35, %r14
	.word 0xf2db8e80  ! 117: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb68c4000  ! 120: ANDcc_R	andcc 	%r17, %r0, %r27
	.word 0xbda80820  ! 121: FMOVN	fmovs	%fcc1, %f0, %f30
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 25)
	.word 0xb7a80820  ! 126: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_6:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 133: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbda588c0  ! 134: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xb1a81420  ! 137: FMOVRNZ	dis not found

	.word 0xb7a48820  ! 139: FADDs	fadds	%f18, %f0, %f27
	.word 0xbba4c940  ! 141: FMULd	fmuld	%f50, %f0, %f60
	.word 0xb97d0400  ! 142: MOVR_R	movre	%r20, %r0, %r28
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_rd_6:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 150: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbfab0820  ! 151: FMOVGU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_7:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 154: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfa80820  ! 155: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb9aac820  ! 158: FMOVGE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_9:
	setx	0x1c023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 160: FSQRTq	fsqrt	
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 19)
	.word 0xb1a4c840  ! 166: FADDd	faddd	%f50, %f0, %f24
	.word 0xb1a80420  ! 168: FMOVRZ	dis not found

T1_asi_reg_rd_8:
	mov	0x3c5, %r14
	.word 0xfedb89e0  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_wr_7:
	mov	0x3c2, %r14
	.word 0xfcf389e0  ! 170: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_wr_8:
	mov	0x16, %r14
	.word 0xfcf38400  ! 171: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbfa50840  ! 175: FADDd	faddd	%f20, %f0, %f62
	.word 0xba056082  ! 176: ADD_I	add 	%r21, 0x0082, %r29
	.word 0xb9a54940  ! 178: FMULd	fmuld	%f52, %f0, %f28
T1_asi_reg_wr_9:
	mov	0x20, %r14
	.word 0xf0f38400  ! 182: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbbaa4820  ! 184: FMOVNE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_9:
	mov	0x2d, %r14
	.word 0xfcdb8e40  ! 187: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb53c5000  ! 188: SRAX_R	srax	%r17, %r0, %r26
T1_asi_reg_wr_10:
	mov	0x27, %r14
	.word 0xfcf384a0  ! 189: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbda488a0  ! 190: FSUBs	fsubs	%f18, %f0, %f30
T1_asi_reg_rd_10:
	mov	0x3c0, %r14
	.word 0xfadb8e60  ! 191: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T1_asi_reg_wr_11:
	mov	0xc, %r14
	.word 0xf8f384a0  ! 193: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbdaa8820  ! 195: FMOVG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_12:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 197: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_10:
	setx	0x1d0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 204: FMOVVC	fmovs	%fcc1, %f0, %f31
cpu_intr_1_11:
	setx	0x1d022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c9e0  ! 207: FDIVq	dis not found

T1_asi_reg_wr_13:
	mov	0x3c1, %r14
	.word 0xf0f384a0  ! 208: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbba4c9e0  ! 212: FDIVq	dis not found

T1_asi_reg_wr_14:
	mov	0x1e, %r14
	.word 0xfef38e40  ! 216: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_11:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 217: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_12:
	setx	0x1d0027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_13:
	setx	0x1f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 221: FMOVGE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_14:
	setx	0x1e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac48000  ! 223: ADDCcc_R	addccc 	%r18, %r0, %r29
T1_asi_reg_rd_12:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_15:
	mov	0x24, %r14
	.word 0xfaf38e40  ! 231: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbda408e0  ! 232: FSUBq	dis not found

iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, e)
	.word 0xbba4c9a0  ! 234: FDIVs	fdivs	%f19, %f0, %f29
T1_asi_reg_wr_16:
	mov	0x38, %r14
	.word 0xf2f38e80  ! 236: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_15:
	setx	0x1f0307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_17:
	mov	0x0, %r14
	.word 0xf8f384a0  ! 242: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb9a44820  ! 244: FADDs	fadds	%f17, %f0, %f28
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbba90820  ! 246: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb1a48840  ! 247: FADDd	faddd	%f18, %f0, %f24
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 5)
	.word 0x9194a004  ! 253: WRPR_PIL_I	wrpr	%r18, 0x0004, %pil
	.word 0xb9a409e0  ! 254: FDIVq	dis not found

cpu_intr_1_16:
	setx	0x1e0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a94820  ! 257: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb9a9c820  ! 259: FMOVVS	fmovs	%fcc1, %f0, %f28
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 16)
	.word 0xb6b4a033  ! 262: SUBCcc_I	orncc 	%r18, 0x0033, %r27
cpu_intr_1_17:
	setx	0x1c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_18:
	mov	0x28, %r14
	.word 0xf4f389e0  ! 264: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_rd_13:
	mov	0x2b, %r14
	.word 0xf6db8e40  ! 270: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9aa8820  ! 271: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbba509c0  ! 273: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xb7a588c0  ! 275: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xb3a00540  ! 278: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_19:
	mov	0x7, %r14
	.word 0xf0f389e0  ! 281: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_wr_20:
	mov	0x3c4, %r14
	.word 0xf0f384a0  ! 284: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_18:
	setx	0x1d0305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_19:
	setx	0x1c0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54860  ! 291: FADDq	dis not found

iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_wr_21:
	mov	0x22, %r14
	.word 0xf0f389e0  ! 296: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_rd_14:
	mov	0x3c0, %r14
	.word 0xf0db89e0  ! 297: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb5a81420  ! 299: FMOVRNZ	dis not found

cpu_intr_1_20:
	setx	0x1c0313, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_22:
	mov	0xf, %r14
	.word 0xf8f38e60  ! 307: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb3a48940  ! 308: FMULd	fmuld	%f18, %f0, %f56
	.word 0xbba408a0  ! 309: FSUBs	fsubs	%f16, %f0, %f29
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_15:
	mov	0x35, %r14
	.word 0xf0db8400  ! 312: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_21:
	setx	0x1c0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa50860  ! 315: FADDq	dis not found

iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_22:
	setx	0x1c0000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_23:
	setx	0x1d0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a44940  ! 323: FMULd	fmuld	%f48, %f0, %f24
	.word 0xb3a50840  ! 324: FADDd	faddd	%f20, %f0, %f56
cpu_intr_1_24:
	setx	0x1d021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb5a588c0  ! 330: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xb5a9c820  ! 331: FMOVVS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_25:
	setx	0x1d0318, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_16:
	mov	0x3c1, %r14
	.word 0xfadb8e80  ! 334: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_rd_17:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 337: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 38)
	.word 0xb5a44940  ! 339: FMULd	fmuld	%f48, %f0, %f26
	.word 0xb1a00520  ! 341: FSQRTs	fsqrt	
cpu_intr_1_26:
	setx	0x1f0339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 14)
	.word 0xbfa40860  ! 348: FADDq	dis not found

T1_asi_reg_wr_23:
	mov	0x37, %r14
	.word 0xf4f384a0  ! 349: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb7a548c0  ! 351: FSUBd	fsubd	%f52, %f0, %f58
	.word 0xb33df001  ! 353: SRAX_I	srax	%r23, 0x0001, %r25
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb42d0000  ! 355: ANDN_R	andn 	%r20, %r0, %r26
	.word 0xb5a81420  ! 357: FMOVRNZ	dis not found

cpu_intr_1_27:
	setx	0x1e0319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_28:
	setx	0x1c0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c9a0  ! 361: FDIVs	fdivs	%f23, %f0, %f31
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbba54940  ! 363: FMULd	fmuld	%f52, %f0, %f60
	.word 0xbda81420  ! 364: FMOVRNZ	dis not found

	.word 0xb5a5c840  ! 367: FADDd	faddd	%f54, %f0, %f26
T1_asi_reg_wr_24:
	mov	0x16, %r14
	.word 0xfef38e60  ! 374: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 19)
	.word 0xb5a40940  ! 378: FMULd	fmuld	%f16, %f0, %f26
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 20)
	.word 0xb7a40920  ! 381: FMULs	fmuls	%f16, %f0, %f27
	.word 0xb7a40920  ! 384: FMULs	fmuls	%f16, %f0, %f27
	.word 0xb1a98820  ! 386: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbfa9c820  ! 390: FMOVVS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_29:
	setx	0x1c020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda508e0  ! 394: FSUBq	dis not found

T1_asi_reg_rd_18:
	mov	0x23, %r14
	.word 0xf0db8e80  ! 395: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbba44960  ! 396: FMULq	dis not found

T1_asi_reg_rd_19:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 399: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_25:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 400: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5a8c820  ! 401: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbdaa8820  ! 403: FMOVG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_30:
	setx	0x1f023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 2d)
	.word 0x8795a055  ! 409: WRPR_TT_I	wrpr	%r22, 0x0055, %tt
	.word 0xb9ab8820  ! 415: FMOVPOS	fmovs	%fcc1, %f0, %f28
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_rd_20:
	mov	0x29, %r14
	.word 0xf2db8e40  ! 417: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_31:
	setx	0x1f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba88820  ! 423: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbf510000  ! 425: RDPR_TICK	<illegal instruction>
	.word 0xb1a81420  ! 426: FMOVRNZ	dis not found

	.word 0x9195a1b4  ! 427: WRPR_PIL_I	wrpr	%r22, 0x01b4, %pil
	.word 0xbe348000  ! 430: SUBC_R	orn 	%r18, %r0, %r31
	.word 0xbfa409e0  ! 431: FDIVq	dis not found

	.word 0xb5a589a0  ! 432: FDIVs	fdivs	%f22, %f0, %f26
	.word 0xb9a5c840  ! 434: FADDd	faddd	%f54, %f0, %f28
T1_asi_reg_rd_21:
	mov	0x4, %r14
	.word 0xfadb8400  ! 435: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb7a00560  ! 438: FSQRTq	fsqrt	
	.word 0xb9a8c820  ! 440: FMOVL	fmovs	%fcc1, %f0, %f28
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a488a0  ! 446: FSUBs	fsubs	%f18, %f0, %f27
	.word 0xb3a449a0  ! 447: FDIVs	fdivs	%f17, %f0, %f25
	.word 0xb9a00560  ! 450: FSQRTq	fsqrt	
	.word 0xb1a88820  ! 452: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb7aa8820  ! 458: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb285c000  ! 460: ADDcc_R	addcc 	%r23, %r0, %r25
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_22:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 471: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbdab4820  ! 472: FMOVCC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_26:
	mov	0x1b, %r14
	.word 0xfef38e40  ! 473: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfa00540  ! 474: FSQRTd	fsqrt	
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9aa8820  ! 477: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb9a589c0  ! 479: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xb03420ed  ! 481: ORN_I	orn 	%r16, 0x00ed, %r24
	.word 0xb8adc000  ! 483: ANDNcc_R	andncc 	%r23, %r0, %r28
cpu_intr_1_32:
	setx	0x200312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58960  ! 486: FMULq	dis not found

cpu_intr_1_33:
	setx	0x200013, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_23:
	mov	0x38, %r14
	.word 0xf2db8e40  ! 490: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbbaa8820  ! 494: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb7a80c20  ! 498: FMOVRLZ	dis not found

	.word 0xb9abc820  ! 499: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbec4a1f6  ! 501: ADDCcc_I	addccc 	%r18, 0x01f6, %r31
	.word 0xb7aa8820  ! 502: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbfab8820  ! 505: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a84820  ! 506: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbfa00560  ! 507: FSQRTq	fsqrt	
T1_asi_reg_rd_24:
	mov	0x13, %r14
	.word 0xfadb84a0  ! 508: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_27:
	mov	0x3, %r14
	.word 0xf0f38e80  ! 512: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_rd_25:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 515: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_34:
	setx	0x230105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_35:
	setx	0x210332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa54920  ! 524: FMULs	fmuls	%f21, %f0, %f31
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_36:
	setx	0x22013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a94820  ! 530: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbfaac820  ! 531: FMOVGE	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_26:
	mov	0x25, %r14
	.word 0xfadb8e40  ! 534: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5a90820  ! 535: FMOVLEU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_37:
	setx	0x21022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_38:
	setx	0x20032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 542: FSQRTd	fsqrt	
	.word 0xb1ab0820  ! 544: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb6bcc000  ! 546: XNORcc_R	xnorcc 	%r19, %r0, %r27
T1_asi_reg_rd_27:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 547: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 15)
	.word 0xb1a4c960  ! 550: FMULq	dis not found

T1_asi_reg_wr_28:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 551: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbc35c000  ! 552: ORN_R	orn 	%r23, %r0, %r30
	.word 0xbfa00540  ! 559: FSQRTd	fsqrt	
T1_asi_reg_rd_28:
	mov	0x1a, %r14
	.word 0xfcdb84a0  ! 560: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbda84820  ! 561: FMOVE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_39:
	setx	0x22022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 563: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb9aa4820  ! 568: FMOVNE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_40:
	setx	0x230037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 571: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb9641800  ! 574: MOVcc_R	<illegal instruction>
	.word 0xbb343001  ! 576: SRLX_I	srlx	%r16, 0x0001, %r29
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 16)
	.word 0xb1a9c820  ! 588: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbba8c820  ! 589: FMOVL	fmovs	%fcc1, %f0, %f29
cpu_intr_1_41:
	setx	0x220234, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_29:
	mov	0x1, %r14
	.word 0xf4db89e0  ! 594: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_rd_30:
	mov	0x3c6, %r14
	.word 0xfadb84a0  ! 595: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbfa58960  ! 596: FMULq	dis not found

cpu_intr_1_42:
	setx	0x210115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_43:
	setx	0x21002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c860  ! 602: FADDq	dis not found

	.word 0xbda88820  ! 604: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a50960  ! 608: FMULq	dis not found

cpu_intr_1_44:
	setx	0x23001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_29:
	mov	0xa, %r14
	.word 0xf4f38e60  ! 610: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbc3521eb  ! 612: ORN_I	orn 	%r20, 0x01eb, %r30
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_31:
	mov	0x1d, %r14
	.word 0xf2db8e40  ! 622: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_45:
	setx	0x220025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 624: FMOVN	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_30:
	mov	0x3c8, %r14
	.word 0xf6f38e80  ! 626: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbba5c8c0  ! 629: FSUBd	fsubd	%f54, %f0, %f60
T1_asi_reg_rd_32:
	mov	0x24, %r14
	.word 0xfedb89e0  ! 630: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbfa00020  ! 631: FMOVs	fmovs	%f0, %f31
T1_asi_reg_rd_33:
	mov	0x1c, %r14
	.word 0xfadb8400  ! 632: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb2bc2132  ! 633: XNORcc_I	xnorcc 	%r16, 0x0132, %r25
cpu_intr_1_46:
	setx	0x230227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_47:
	setx	0x22033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_wr_31:
	mov	0x35, %r14
	.word 0xf2f38e80  ! 639: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb9a81c20  ! 641: FMOVRGEZ	dis not found

	.word 0xbda84820  ! 647: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a80820  ! 649: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb5a81c20  ! 650: FMOVRGEZ	dis not found

	.word 0xb7a00540  ! 653: FSQRTd	fsqrt	
T1_asi_reg_wr_32:
	mov	0x37, %r14
	.word 0xfaf38400  ! 654: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb1a5c960  ! 655: FMULq	dis not found

	.word 0xbba9c820  ! 657: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a81820  ! 658: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb9a449a0  ! 661: FDIVs	fdivs	%f17, %f0, %f28
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_34:
	mov	0x37, %r14
	.word 0xf6db8e60  ! 665: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_wr_33:
	mov	0x23, %r14
	.word 0xf2f389e0  ! 666: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_48:
	setx	0x210312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_49:
	setx	0x23012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb5a81c20  ! 680: FMOVRGEZ	dis not found

T1_asi_reg_wr_34:
	mov	0x15, %r14
	.word 0xfaf384a0  ! 681: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_wr_35:
	mov	0x5, %r14
	.word 0xfef389e0  ! 684: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbda00520  ! 686: FSQRTs	fsqrt	
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbfa48960  ! 691: FMULq	dis not found

	.word 0xb9a4c840  ! 692: FADDd	faddd	%f50, %f0, %f28
	.word 0xb5a8c820  ! 694: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb89dc000  ! 696: XORcc_R	xorcc 	%r23, %r0, %r28
cpu_intr_1_50:
	setx	0x210236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_51:
	setx	0x210116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_52:
	setx	0x20020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 3)
	.word 0xbfab4820  ! 705: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb7504000  ! 708: RDPR_TNPC	<illegal instruction>
	.word 0xb5a80420  ! 711: FMOVRZ	dis not found

T1_asi_reg_wr_36:
	mov	0x16, %r14
	.word 0xf6f389e0  ! 715: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_35:
	mov	0x3c4, %r14
	.word 0xf2db8e80  ! 717: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 13)
	.word 0xb1a58840  ! 719: FADDd	faddd	%f22, %f0, %f24
T1_asi_reg_wr_37:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 721: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, f)
	.word 0xbba448c0  ! 723: FSUBd	fsubd	%f48, %f0, %f60
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, f)
	.word 0xb9a448a0  ! 727: FSUBs	fsubs	%f17, %f0, %f28
	.word 0xb5a589e0  ! 731: FDIVq	dis not found

cpu_intr_1_53:
	setx	0x210134, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_36:
	mov	0xd, %r14
	.word 0xf8db8e60  ! 735: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T1_asi_reg_rd_37:
	mov	0x9, %r14
	.word 0xf4db8e40  ! 740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 39)
	.word 0xb7aac820  ! 743: FMOVGE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_54:
	setx	0x20030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba44960  ! 745: FMULq	dis not found

	.word 0xb9a408a0  ! 747: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xb7ab8820  ! 748: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbda90820  ! 750: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00040  ! 751: FMOVd	fmovd	%f0, %f26
cpu_intr_1_55:
	setx	0x20030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_38:
	mov	0x24, %r14
	.word 0xf4f38e40  ! 755: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbda80820  ! 757: FMOVN	fmovs	%fcc1, %f0, %f30
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_56:
	setx	0x220127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_57:
	setx	0x22001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 31)
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xbc85a0c8  ! 768: ADDcc_I	addcc 	%r22, 0x00c8, %r30
T1_asi_reg_wr_39:
	mov	0xc, %r14
	.word 0xfaf38400  ! 770: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbe95202f  ! 771: ORcc_I	orcc 	%r20, 0x002f, %r31
cpu_intr_1_58:
	setx	0x200232, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_38:
	mov	0x29, %r14
	.word 0xfedb8400  ! 778: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_59:
	setx	0x230230, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_39:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 783: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbda00040  ! 784: FMOVd	fmovd	%f0, %f30
T1_asi_reg_wr_40:
	mov	0x21, %r14
	.word 0xfef38e60  ! 785: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_rd_40:
	mov	0x8, %r14
	.word 0xfedb8e60  ! 788: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_1_60:
	setx	0x23020d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_61:
	setx	0x21031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_62:
	setx	0x21030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb334e001  ! 797: SRL_I	srl 	%r19, 0x0001, %r25
	.word 0xb9a48840  ! 799: FADDd	faddd	%f18, %f0, %f28
	.word 0xb3a58960  ! 801: FMULq	dis not found

	.word 0xbfa80420  ! 803: FMOVRZ	dis not found

iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 24)
	.word 0xbe0c8000  ! 808: AND_R	and 	%r18, %r0, %r31
	.word 0xbdab4820  ! 810: FMOVCC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_41:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 812: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_63:
	setx	0x220201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 819: FSQRTq	fsqrt	
	.word 0xb9abc820  ! 820: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbd641800  ! 821: MOVcc_R	<illegal instruction>
	.word 0xb1a48920  ! 825: FMULs	fmuls	%f18, %f0, %f24
	.word 0xbe9c611a  ! 827: XORcc_I	xorcc 	%r17, 0x011a, %r31
cpu_intr_1_64:
	setx	0x20022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a489e0  ! 831: FDIVq	dis not found

cpu_intr_1_65:
	setx	0x200113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba45a11e  ! 834: ADDC_I	addc 	%r22, 0x011e, %r29
	.word 0xb5a81420  ! 835: FMOVRNZ	dis not found

T1_asi_reg_rd_42:
	mov	0x25, %r14
	.word 0xf6db89e0  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xba340000  ! 843: ORN_R	orn 	%r16, %r0, %r29
T1_asi_reg_wr_41:
	mov	0x10, %r14
	.word 0xfef389e0  ! 845: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_66:
	setx	0x230203, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_43:
	mov	0x10, %r14
	.word 0xf2db8e40  ! 849: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_44:
	mov	0x3, %r14
	.word 0xf4db8e60  ! 852: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_67:
	setx	0x220039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 9)
	.word 0xbba4c820  ! 860: FADDs	fadds	%f19, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a409a0  ! 864: FDIVs	fdivs	%f16, %f0, %f24
	.word 0xb1aa0820  ! 866: FMOVA	fmovs	%fcc1, %f0, %f24
cpu_intr_1_68:
	setx	0x20003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_45:
	mov	0x21, %r14
	.word 0xf8db8e40  ! 871: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_42:
	mov	0x15, %r14
	.word 0xfcf38e60  ! 872: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 0)
	.word 0xb615a1c6  ! 881: OR_I	or 	%r22, 0x01c6, %r27
	.word 0xbba5c960  ! 882: FMULq	dis not found

cpu_intr_1_69:
	setx	0x210232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_70:
	setx	0x22023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a54860  ! 886: FADDq	dis not found

cpu_intr_1_71:
	setx	0x200103, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_43:
	mov	0x32, %r14
	.word 0xfcf38e80  ! 890: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbda94820  ! 892: FMOVCS	fmovs	%fcc1, %f0, %f30
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_44:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 895: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 30)
	.word 0xbfa88820  ! 897: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xbbabc820  ! 899: FMOVVC	fmovs	%fcc1, %f0, %f29
cpu_intr_1_72:
	setx	0x270339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb4944000  ! 914: ORcc_R	orcc 	%r17, %r0, %r26
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1a40860  ! 919: FADDq	dis not found

	.word 0xbc340000  ! 920: SUBC_R	orn 	%r16, %r0, %r30
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 22)
	.word 0xb9a589c0  ! 924: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xbda88820  ! 926: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a549a0  ! 927: FDIVs	fdivs	%f21, %f0, %f24
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 2)
	.word 0xb5ab0820  ! 929: FMOVGU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_46:
	mov	0x27, %r14
	.word 0xfcdb89e0  ! 931: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_73:
	setx	0x250003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 6)
	.word 0xb5a00540  ! 934: FSQRTd	fsqrt	
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb1a00040  ! 940: FMOVd	fmovd	%f0, %f24
T1_asi_reg_wr_45:
	mov	0x24, %r14
	.word 0xf4f38e40  ! 944: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbf7da401  ! 945: MOVR_I	movre	%r22, 0x1, %r31
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 39)
	.word 0xb7a84820  ! 952: FMOVE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_74:
	setx	0x240113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 959: FMOVLE	fmovs	%fcc1, %f0, %f25
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_75:
	setx	0x24012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_76:
	setx	0x270219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 971: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb3aa0820  ! 972: FMOVA	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_46:
	mov	0x10, %r14
	.word 0xfaf38e80  ! 973: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_wr_47:
	mov	0x33, %r14
	.word 0xf8f38400  ! 975: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_wr_48:
	mov	0x25, %r14
	.word 0xf0f38e60  ! 976: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbdab4820  ! 977: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb9aa0820  ! 981: FMOVA	fmovs	%fcc1, %f0, %f28
cpu_intr_1_77:
	setx	0x250023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c820  ! 987: FADDs	fadds	%f23, %f0, %f28
	.word 0xba85e0a2  ! 990: ADDcc_I	addcc 	%r23, 0x00a2, %r29
	.word 0xb7a00540  ! 991: FSQRTd	fsqrt	
T1_asi_reg_rd_47:
	mov	0x6, %r14
	.word 0xfcdb89e0  ! 992: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_78:
	setx	0x240104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_79:
	setx	0x260029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5351000  ! 998: SRLX_R	srlx	%r20, %r0, %r26
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 22)
	.word 0xbe040000  ! 1001: ADD_R	add 	%r16, %r0, %r31
cpu_intr_1_80:
	setx	0x270330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48840  ! 1004: FADDd	faddd	%f18, %f0, %f60
	.word 0xbe04e019  ! 1005: ADD_I	add 	%r19, 0x0019, %r31
	.word 0xb7a548a0  ! 1006: FSUBs	fsubs	%f21, %f0, %f27
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 25)
	.word 0xb9a81420  ! 1008: FMOVRNZ	dis not found

	.word 0xbdaac820  ! 1009: FMOVGE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_81:
	setx	0x250313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a408c0  ! 1014: FSUBd	fsubd	%f16, %f0, %f26
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, f)
	.word 0xb9aa4820  ! 1021: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb3ab8820  ! 1022: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a81420  ! 1023: FMOVRNZ	dis not found

iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 8)
	.word 0xbf7cc400  ! 1030: MOVR_R	movre	%r19, %r0, %r31
	.word 0xbbaac820  ! 1031: FMOVGE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_82:
	setx	0x240119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 17)
	.word 0xbfa88820  ! 1037: FMOVLE	fmovs	%fcc1, %f0, %f31
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 6)
	.word 0xb3a5c9c0  ! 1044: FDIVd	fdivd	%f54, %f0, %f56
	.word 0xb3a4c9c0  ! 1046: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xb7a509e0  ! 1049: FDIVq	dis not found

cpu_intr_1_83:
	setx	0x260304, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_48:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_84:
	setx	0x260217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 1055: FSQRTq	fsqrt	
T1_asi_reg_wr_49:
	mov	0x3c0, %r14
	.word 0xf8f38e80  ! 1057: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_rd_49:
	mov	0x14, %r14
	.word 0xfedb8e80  ! 1063: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbf643801  ! 1065: MOVcc_I	<illegal instruction>
	.word 0xb9aa0820  ! 1066: FMOVA	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_50:
	mov	0x13, %r14
	.word 0xf6f389e0  ! 1067: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbba00520  ! 1070: FSQRTs	fsqrt	
cpu_intr_1_85:
	setx	0x240100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, c)
	.word 0xb9a54940  ! 1075: FMULd	fmuld	%f52, %f0, %f28
	.word 0xb1a58940  ! 1076: FMULd	fmuld	%f22, %f0, %f24
	.word 0xbda588e0  ! 1078: FSUBq	dis not found

	.word 0xbba00520  ! 1079: FSQRTs	fsqrt	
	.word 0xb03520a9  ! 1081: SUBC_I	orn 	%r20, 0x00a9, %r24
	.word 0xbda80420  ! 1085: FMOVRZ	dis not found

T1_asi_reg_wr_51:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 1087: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb72cb001  ! 1088: SLLX_I	sllx	%r18, 0x0001, %r27
cpu_intr_1_86:
	setx	0x24003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_87:
	setx	0x27033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a54960  ! 1098: FMULq	dis not found

	.word 0xb5a94820  ! 1099: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb9aa4820  ! 1100: FMOVNE	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_88:
	setx	0x25013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa48960  ! 1106: FMULq	dis not found

T1_asi_reg_wr_52:
	mov	0x34, %r14
	.word 0xf8f38e40  ! 1107: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbb3ca001  ! 1108: SRA_I	sra 	%r18, 0x0001, %r29
	.word 0xb7a9c820  ! 1109: FMOVVS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_89:
	setx	0x270115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28420c2  ! 1112: ADDcc_I	addcc 	%r16, 0x00c2, %r25
T1_asi_reg_wr_53:
	mov	0xb, %r14
	.word 0xf8f38e60  ! 1115: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T1_asi_reg_rd_50:
	mov	0x2e, %r14
	.word 0xf2db8e40  ! 1118: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_90:
	setx	0x25011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_54:
	mov	0x0, %r14
	.word 0xfcf38e80  ! 1124: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbda4c8e0  ! 1127: FSUBq	dis not found

iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb5a5c860  ! 1133: FADDq	dis not found

T1_asi_reg_rd_51:
	mov	0x1a, %r14
	.word 0xf2db84a0  ! 1135: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbd540000  ! 1140: RDPR_GL	<illegal instruction>
	.word 0xb1a40860  ! 1145: FADDq	dis not found

	.word 0xb1a589e0  ! 1147: FDIVq	dis not found

T1_asi_reg_wr_55:
	mov	0x22, %r14
	.word 0xf8f38e60  ! 1150: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T1_asi_reg_rd_52:
	mov	0x1c, %r14
	.word 0xfadb8e40  ! 1152: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbda409e0  ! 1154: FDIVq	dis not found

T1_asi_reg_wr_56:
	mov	0x28, %r14
	.word 0xfef38400  ! 1155: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb9a408a0  ! 1158: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xb5a48940  ! 1164: FMULd	fmuld	%f18, %f0, %f26
T1_asi_reg_rd_53:
	mov	0x34, %r14
	.word 0xf2db89e0  ! 1168: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_1_91:
	setx	0x270336, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_57:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 1172: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_92:
	setx	0x250125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 38)
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_rd_54:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 1178: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_55:
	mov	0x18, %r14
	.word 0xfcdb84a0  ! 1181: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbba488e0  ! 1185: FSUBq	dis not found

	lda	[%r17 + %g0] 0xf0, %f2
cpu_intr_1_93:
	setx	0x27011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_94:
	setx	0x260127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe14e17f  ! 1191: OR_I	or 	%r19, 0x017f, %r31
cpu_intr_1_95:
	setx	0x240331, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_58:
	mov	0x23, %r14
	.word 0xf8f38400  ! 1193: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_96:
	setx	0x240332, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_59:
	mov	0x1c, %r14
	.word 0xfef38e40  ! 1195: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, b)
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9a80420  ! 1199: FMOVRZ	dis not found

	.word 0xb7a8c820  ! 1202: FMOVL	fmovs	%fcc1, %f0, %f27
	lda	[%r17 + %g0] 0xf0, %f2
cpu_intr_1_97:
	setx	0x250118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9510000  ! 1205: RDPR_TICK	<illegal instruction>
	.word 0xbda8c820  ! 1207: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb415a1a3  ! 1212: OR_I	or 	%r22, 0x01a3, %r26
	.word 0xb3a80c20  ! 1222: FMOVRLZ	dis not found

	.word 0xb8ad4000  ! 1226: ANDNcc_R	andncc 	%r21, %r0, %r28
T1_asi_reg_rd_56:
	mov	0x3c5, %r14
	.word 0xf0db8e60  ! 1229: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb7a00560  ! 1237: FSQRTq	fsqrt	
	.word 0xb084c000  ! 1245: ADDcc_R	addcc 	%r19, %r0, %r24
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb9520000  ! 1248: RDPR_PIL	<illegal instruction>
	.word 0xb8ac8000  ! 1249: ANDNcc_R	andncc 	%r18, %r0, %r28
cpu_intr_1_98:
	setx	0x24012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93d9000  ! 1255: SRAX_R	srax	%r22, %r0, %r28
T1_asi_reg_rd_57:
	mov	0x2f, %r14
	.word 0xfadb8400  ! 1259: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 2)
	.word 0xbfa44940  ! 1264: FMULd	fmuld	%f48, %f0, %f62
	.word 0xb7a449a0  ! 1267: FDIVs	fdivs	%f17, %f0, %f27
	.word 0xbfa588e0  ! 1269: FSUBq	dis not found

cpu_intr_1_99:
	setx	0x260226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 1271: FMOVGE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_60:
	mov	0x28, %r14
	.word 0xf8f38e40  ! 1274: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb7a81420  ! 1276: FMOVRNZ	dis not found

	.word 0xbfa5c8e0  ! 1277: FSUBq	dis not found

	.word 0xbba00540  ! 1278: FSQRTd	fsqrt	
cpu_intr_1_100:
	setx	0x240029, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_58:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 1280: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_59:
	mov	0x29, %r14
	.word 0xf4db84a0  ! 1283: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbc05a1d4  ! 1286: ADD_I	add 	%r22, 0x01d4, %r30
cpu_intr_1_101:
	setx	0x25031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c820  ! 1297: FADDs	fadds	%f19, %f0, %f28
	.word 0xb7ab4820  ! 1299: FMOVCC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_60:
	mov	0x6, %r14
	.word 0xfedb8e60  ! 1300: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_rd_61:
	mov	0x2, %r14
	.word 0xf0db8e40  ! 1303: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfaa8820  ! 1307: FMOVG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_61:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 1311: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_102:
	setx	0x27013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_103:
	setx	0x270032, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_62:
	mov	0x3c2, %r14
	.word 0xf4db84a0  ! 1320: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbda4c920  ! 1323: FMULs	fmuls	%f19, %f0, %f30
	.word 0xbfa4c9e0  ! 1327: FDIVq	dis not found

cpu_intr_1_104:
	setx	0x250220, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_62:
	mov	0x3c0, %r14
	.word 0xf2f389e0  ! 1334: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb7a4c940  ! 1335: FMULd	fmuld	%f50, %f0, %f58
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 36)
	.word 0xb3a549e0  ! 1342: FDIVq	dis not found

	.word 0xb7a80c20  ! 1345: FMOVRLZ	dis not found

	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb7a548e0  ! 1352: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_105:
	setx	0x270330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_106:
	setx	0x240320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb5a50820  ! 1360: FADDs	fadds	%f20, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a9c820  ! 1365: FMOVVS	fmovs	%fcc1, %f0, %f28
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_63:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 1368: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb1a5c960  ! 1369: FMULq	dis not found

	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_wr_63:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 1371: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, c)
	.word 0xb3a54960  ! 1375: FMULq	dis not found

	.word 0xb9a90820  ! 1376: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb5a8c820  ! 1377: FMOVL	fmovs	%fcc1, %f0, %f26
cpu_intr_1_107:
	setx	0x2b011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_108:
	setx	0x28022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b5c000  ! 1384: ORNcc_R	orncc 	%r23, %r0, %r24
T1_asi_reg_wr_64:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 1385: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_rd_64:
	mov	0x36, %r14
	.word 0xf2db8e60  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb13c0000  ! 1387: SRA_R	sra 	%r16, %r0, %r24
	.word 0xbda5c9e0  ! 1389: FDIVq	dis not found

	.word 0xb9a00040  ! 1392: FMOVd	fmovd	%f0, %f28
cpu_intr_1_109:
	setx	0x290210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00040  ! 1395: FMOVd	fmovd	%f0, %f28
cpu_intr_1_110:
	setx	0x2a0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00020  ! 1398: FMOVs	fmovs	%f0, %f25
T1_asi_reg_rd_65:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 1400: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_wr_65:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 1401: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9a00540  ! 1402: FSQRTd	fsqrt	
	.word 0xbfa54840  ! 1403: FADDd	faddd	%f52, %f0, %f62
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 34)
	.word 0xbdaa8820  ! 1406: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbd349000  ! 1408: SRLX_R	srlx	%r18, %r0, %r30
T1_asi_reg_rd_66:
	mov	0x32, %r14
	.word 0xfadb8e40  ! 1409: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_67:
	mov	0xe, %r14
	.word 0xfcdb8e40  ! 1421: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_111:
	setx	0x2b0000, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_66:
	mov	0x13, %r14
	.word 0xf8f38e80  ! 1424: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_wr_67:
	mov	0x1f, %r14
	.word 0xf6f38e60  ! 1426: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb3a8c820  ! 1427: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_112:
	setx	0x29033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a588e0  ! 1431: FSUBq	dis not found

cpu_intr_1_113:
	setx	0x2a0035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_rd_68:
	mov	0x33, %r14
	.word 0xf2db8400  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb9a408a0  ! 1438: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xbf34b001  ! 1440: SRLX_I	srlx	%r18, 0x0001, %r31
cpu_intr_1_114:
	setx	0x28011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_69:
	mov	0xc, %r14
	.word 0xfedb89e0  ! 1442: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_70:
	mov	0x3c0, %r14
	.word 0xfcdb89e0  ! 1448: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb9a98820  ! 1449: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_115:
	setx	0x280132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_116:
	setx	0x280207, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba4c920  ! 1461: FMULs	fmuls	%f19, %f0, %f29
	.word 0xb605a0fc  ! 1462: ADD_I	add 	%r22, 0x00fc, %r27
cpu_intr_1_117:
	setx	0x280331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa0820  ! 1465: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbfa00520  ! 1469: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd358000  ! 1472: SRL_R	srl 	%r22, %r0, %r30
T1_asi_reg_wr_68:
	mov	0x37, %r14
	.word 0xf4f389e0  ! 1476: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_wr_69:
	mov	0x31, %r14
	.word 0xfcf38e80  ! 1478: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb9a4c820  ! 1479: FADDs	fadds	%f19, %f0, %f28
T1_asi_reg_wr_70:
	mov	0x3, %r14
	.word 0xfaf38e60  ! 1480: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_118:
	setx	0x2b0121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 9)
	.word 0xbda5c840  ! 1494: FADDd	faddd	%f54, %f0, %f30
cpu_intr_1_119:
	setx	0x28001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_71:
	mov	0x11, %r14
	.word 0xf6f38e80  ! 1496: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb9a409e0  ! 1497: FDIVq	dis not found

	.word 0xb7a4c8a0  ! 1500: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xb7a81820  ! 1504: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb7643801  ! 1505: MOVcc_I	<illegal instruction>
T1_asi_reg_rd_71:
	mov	0x7, %r14
	.word 0xfcdb8e60  ! 1506: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_120:
	setx	0x2a0007, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_72:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 1508: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_wr_72:
	mov	0x15, %r14
	.word 0xfaf38e60  ! 1511: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_rd_73:
	mov	0x21, %r14
	.word 0xfedb8e80  ! 1513: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_121:
	setx	0x2a0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a589e0  ! 1521: FDIVq	dis not found

iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_122:
	setx	0x290205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a40920  ! 1526: FMULs	fmuls	%f16, %f0, %f28
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 4)
	.word 0xb9a80c20  ! 1530: FMOVRLZ	dis not found

	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_wr_73:
	mov	0x1e, %r14
	.word 0xf8f384a0  ! 1533: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_123:
	setx	0x2a0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 1540: FSQRTd	fsqrt	
T1_asi_reg_wr_74:
	mov	0x18, %r14
	.word 0xf0f38e40  ! 1541: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_124:
	setx	0x290221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 1543: FMOVRNZ	dis not found

iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_wr_75:
	mov	0xf, %r14
	.word 0xfaf384a0  ! 1551: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_125:
	setx	0x280233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_126:
	setx	0x280302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_127:
	setx	0x2a0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a54940  ! 1566: FMULd	fmuld	%f52, %f0, %f58
cpu_intr_1_128:
	setx	0x280216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 24)
	.word 0xbe458000  ! 1571: ADDC_R	addc 	%r22, %r0, %r31
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9a00540  ! 1576: FSQRTd	fsqrt	
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_wr_76:
	mov	0xb, %r14
	.word 0xf2f38e80  ! 1582: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_129:
	setx	0x29012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_130:
	setx	0x2b0328, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_74:
	mov	0x3c6, %r14
	.word 0xfcdb89e0  ! 1590: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb5a5c960  ! 1591: FMULq	dis not found

cpu_intr_1_131:
	setx	0x290112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_132:
	setx	0x2b0137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_133:
	setx	0x290110, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_77:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 1597: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbb540000  ! 1598: RDPR_GL	<illegal instruction>
	.word 0xb1a81c20  ! 1600: FMOVRGEZ	dis not found

	.word 0xb3343001  ! 1602: SRLX_I	srlx	%r16, 0x0001, %r25
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbe2dc000  ! 1604: ANDN_R	andn 	%r23, %r0, %r31
	.word 0xb494214f  ! 1605: ORcc_I	orcc 	%r16, 0x014f, %r26
cpu_intr_1_134:
	setx	0x2b0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c5e125  ! 1611: ADDCcc_I	addccc 	%r23, 0x0125, %r25
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_78:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 1613: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_79:
	mov	0xf, %r14
	.word 0xf6f38e60  ! 1617: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xa1902001  ! 1618: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xb9aa8820  ! 1619: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb3aa8820  ! 1621: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb8bde085  ! 1625: XNORcc_I	xnorcc 	%r23, 0x0085, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a9c820  ! 1629: FMOVVS	fmovs	%fcc1, %f0, %f28
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_135:
	setx	0x2a030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, f)
	.word 0xb29c6188  ! 1634: XORcc_I	xorcc 	%r17, 0x0188, %r25
T1_asi_reg_wr_80:
	mov	0x3c3, %r14
	.word 0xf4f389e0  ! 1635: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xba048000  ! 1639: ADD_R	add 	%r18, %r0, %r29
T1_asi_reg_wr_81:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 1640: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_rd_75:
	mov	0xd, %r14
	.word 0xf6db89e0  ! 1642: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_1_136:
	setx	0x28031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a44840  ! 1652: FADDd	faddd	%f48, %f0, %f24
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 3a)
	lda	[%r21 + %g0] 0xf0, %f2
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 3c)
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xb5a81c20  ! 1665: FMOVRGEZ	dis not found

cpu_intr_1_137:
	setx	0x2a000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_138:
	setx	0x2b0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc84e0eb  ! 1669: ADDcc_I	addcc 	%r19, 0x00eb, %r30
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_139:
	setx	0x2a012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_82:
	mov	0x3, %r14
	.word 0xfaf38e80  ! 1680: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_76:
	mov	0x35, %r14
	.word 0xfadb84a0  ! 1685: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb2458000  ! 1687: ADDC_R	addc 	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a80c20  ! 1690: FMOVRLZ	dis not found

cpu_intr_1_140:
	setx	0x290230, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_77:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 1692: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_141:
	setx	0x2b033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_83:
	mov	0x14, %r14
	.word 0xf2f384a0  ! 1694: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbfa98820  ! 1698: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbba54920  ! 1700: FMULs	fmuls	%f21, %f0, %f29
	.word 0xb2b50000  ! 1702: ORNcc_R	orncc 	%r20, %r0, %r25
	.word 0xba8d4000  ! 1704: ANDcc_R	andcc 	%r21, %r0, %r29
T1_asi_reg_wr_84:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 1707: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbda80820  ! 1708: FMOVN	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_78:
	mov	0x1d, %r14
	.word 0xfedb84a0  ! 1710: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_142:
	setx	0x290222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 15)
	.word 0xb3a8c820  ! 1722: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb17c6401  ! 1725: MOVR_I	movre	%r17, 0x1, %r24
T1_asi_reg_rd_79:
	mov	0x16, %r14
	.word 0xf0db8400  ! 1732: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_rd_80:
	mov	0x12, %r14
	.word 0xf8db8e60  ! 1733: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbda80820  ! 1735: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00560  ! 1736: FSQRTq	fsqrt	
	.word 0xbdaa8820  ! 1737: FMOVG	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3510000  ! 1740: RDPR_TICK	<illegal instruction>
	.word 0xbf50c000  ! 1741: RDPR_TT	<illegal instruction>
cpu_intr_1_143:
	setx	0x2a030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_85:
	mov	0x0, %r14
	.word 0xf4f389e0  ! 1743: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_wr_86:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 1745: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb22ce10a  ! 1747: ANDN_I	andn 	%r19, 0x010a, %r25
	.word 0xb1a4c960  ! 1748: FMULq	dis not found

iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_87:
	mov	0x2e, %r14
	.word 0xf4f389e0  ! 1760: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_144:
	setx	0x280002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_145:
	setx	0x290119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda548a0  ! 1768: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xb425e021  ! 1771: SUB_I	sub 	%r23, 0x0021, %r26
T1_asi_reg_wr_88:
	mov	0x10, %r14
	.word 0xfaf38e40  ! 1772: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3a588e0  ! 1776: FSUBq	dis not found

	.word 0xb1342001  ! 1777: SRL_I	srl 	%r16, 0x0001, %r24
cpu_intr_1_146:
	setx	0x2b0303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_81:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 1780: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_1_147:
	setx	0x29011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77d4400  ! 1784: MOVR_R	movre	%r21, %r0, %r27
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 9)
	.word 0xbba4c820  ! 1796: FADDs	fadds	%f19, %f0, %f29
T1_asi_reg_rd_82:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 1797: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 35)
	.word 0xbbaa8820  ! 1800: FMOVG	fmovs	%fcc1, %f0, %f29
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 15)
	.word 0xb1a40920  ! 1807: FMULs	fmuls	%f16, %f0, %f24
cpu_intr_1_148:
	setx	0x28033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_149:
	setx	0x2b032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 35)
	.word 0xb1a54920  ! 1816: FMULs	fmuls	%f21, %f0, %f24
	.word 0xb7a5c960  ! 1818: FMULq	dis not found

T1_asi_reg_rd_83:
	mov	0x17, %r14
	.word 0xf6db89e0  ! 1820: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb3a80820  ! 1821: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_89:
	mov	0x3c7, %r14
	.word 0xf6f38400  ! 1822: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 21)
	.word 0xb5a00020  ! 1825: FMOVs	fmovs	%f0, %f26
	.word 0xbba00560  ! 1827: FSQRTq	fsqrt	
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_rd_84:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 1835: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb1a509c0  ! 1839: FDIVd	fdivd	%f20, %f0, %f24
	.word 0xb5aa4820  ! 1841: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a4c9e0  ! 1843: FDIVq	dis not found

T1_asi_reg_wr_90:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 1849: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_150:
	setx	0x2c022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0d6045  ! 1853: AND_I	and 	%r21, 0x0045, %r29
	.word 0xb7a9c820  ! 1854: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbda80820  ! 1855: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb4b4c000  ! 1857: SUBCcc_R	orncc 	%r19, %r0, %r26
	.word 0xb3a80c20  ! 1859: FMOVRLZ	dis not found

	.word 0xb0846007  ! 1863: ADDcc_I	addcc 	%r17, 0x0007, %r24
	.word 0xb1a80420  ! 1865: FMOVRZ	dis not found

iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_151:
	setx	0x2f0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69d4000  ! 1875: XORcc_R	xorcc 	%r21, %r0, %r27
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_wr_91:
	mov	0xf, %r14
	.word 0xf8f38e40  ! 1877: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 2)
	.word 0xbbaa8820  ! 1879: FMOVG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_85:
	mov	0xe, %r14
	.word 0xf2db8e40  ! 1880: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5a4c9a0  ! 1881: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xb1a40840  ! 1882: FADDd	faddd	%f16, %f0, %f24
	.word 0xb62d0000  ! 1884: ANDN_R	andn 	%r20, %r0, %r27
	.word 0xb034e0b7  ! 1885: ORN_I	orn 	%r19, 0x00b7, %r24
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 13)
	.word 0xbba80c20  ! 1889: FMOVRLZ	dis not found

T1_asi_reg_rd_86:
	mov	0x32, %r14
	.word 0xfedb84a0  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb13ca001  ! 1896: SRA_I	sra 	%r18, 0x0001, %r24
	.word 0xb40c211a  ! 1900: AND_I	and 	%r16, 0x011a, %r26
cpu_intr_1_152:
	setx	0x2e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_87:
	mov	0x2e, %r14
	.word 0xf4db8e60  ! 1906: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_wr_92:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 1907: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbda408c0  ! 1908: FSUBd	fsubd	%f16, %f0, %f30
T1_asi_reg_rd_88:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 1909: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_93:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 1910: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_1_153:
	setx	0x2d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8c604e  ! 1917: ANDcc_I	andcc 	%r17, 0x004e, %r30
cpu_intr_1_154:
	setx	0x2e0233, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_94:
	mov	0x7, %r14
	.word 0xfcf38e40  ! 1923: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9a409c0  ! 1924: FDIVd	fdivd	%f16, %f0, %f28
cpu_intr_1_155:
	setx	0x2e032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_95:
	mov	0x15, %r14
	.word 0xfef38400  ! 1926: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbdaa0820  ! 1927: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00040  ! 1928: FMOVd	fmovd	%f0, %f24
	.word 0xb7a90820  ! 1929: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbda58960  ! 1930: FMULq	dis not found

iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_156:
	setx	0x2c0310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_157:
	setx	0x2c002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 3)
	.word 0xbfa80420  ! 1941: FMOVRZ	dis not found

T1_asi_reg_rd_89:
	mov	0x9, %r14
	.word 0xfedb8e40  ! 1942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbba588a0  ! 1943: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xbda48820  ! 1944: FADDs	fadds	%f18, %f0, %f30
	.word 0xb5ab0820  ! 1945: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb20d8000  ! 1947: AND_R	and 	%r22, %r0, %r25
cpu_intr_1_158:
	setx	0x2e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_159:
	setx	0x2e033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb1a80820  ! 1959: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb7a549e0  ! 1968: FDIVq	dis not found

T1_asi_reg_wr_96:
	mov	0x37, %r14
	.word 0xfcf38e40  ! 1972: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0x8395a052  ! 1973: WRPR_TNPC_I	wrpr	%r22, 0x0052, %tnpc
	.word 0xb92db001  ! 1977: SLLX_I	sllx	%r22, 0x0001, %r28
	.word 0xb7a90820  ! 1979: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbfab4820  ! 1980: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb224a060  ! 1981: SUB_I	sub 	%r18, 0x0060, %r25
	.word 0xb1a81c20  ! 1983: FMOVRGEZ	dis not found

	.word 0xb7ab4820  ! 1986: FMOVCC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_90:
	mov	0x2e, %r14
	.word 0xf8db8400  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbfa00020  ! 1989: FMOVs	fmovs	%f0, %f31
	.word 0xbfa54860  ! 1991: FADDq	dis not found

T1_asi_reg_wr_97:
	mov	0x29, %r14
	.word 0xf6f38e40  ! 1992: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_160:
	setx	0x2c0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 1994: FMOVNEG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_91:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 1996: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3a48940  ! 1997: FMULd	fmuld	%f18, %f0, %f56
T1_asi_reg_rd_92:
	mov	0xf, %r14
	.word 0xf8db8e40  ! 1998: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb97c4400  ! 1999: MOVR_R	movre	%r17, %r0, %r28
	.word 0xb9a40840  ! 2000: FADDd	faddd	%f16, %f0, %f28
cpu_intr_1_161:
	setx	0x2d021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23c0000  ! 2004: XNOR_R	xnor 	%r16, %r0, %r25
T1_asi_reg_wr_98:
	mov	0x2e, %r14
	.word 0xf2f38e60  ! 2006: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb7a90820  ! 2007: FMOVLEU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_162:
	setx	0x2c002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_99:
	mov	0x3c1, %r14
	.word 0xf6f38400  ! 2011: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 37)
	.word 0xb3abc820  ! 2013: FMOVVC	fmovs	%fcc1, %f0, %f25
cpu_intr_1_163:
	setx	0x2f0128, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_100:
	mov	0x3c1, %r14
	.word 0xf2f389e0  ! 2018: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbba80c20  ! 2021: FMOVRLZ	dis not found

	.word 0xbeb561eb  ! 2024: SUBCcc_I	orncc 	%r21, 0x01eb, %r31
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 17)
	.word 0xbba50940  ! 2026: FMULd	fmuld	%f20, %f0, %f60
	.word 0xb9a588a0  ! 2027: FSUBs	fsubs	%f22, %f0, %f28
	.word 0xb9ab8820  ! 2029: FMOVPOS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_164:
	setx	0x2c0306, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_93:
	mov	0x9, %r14
	.word 0xf4db89e0  ! 2031: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_165:
	setx	0x2d010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_166:
	setx	0x2d030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 2043: FSQRTs	fsqrt	
	.word 0xb5abc820  ! 2047: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbda5c9c0  ! 2050: FDIVd	fdivd	%f54, %f0, %f30
	.word 0xbba509e0  ! 2055: FDIVq	dis not found

	.word 0xb7a88820  ! 2059: FMOVLE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_167:
	setx	0x2c0127, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_94:
	mov	0x23, %r14
	.word 0xfcdb8400  ! 2064: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_168:
	setx	0x2c0310, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_95:
	mov	0x38, %r14
	.word 0xf6db8e40  ! 2066: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfab0820  ! 2067: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb4b58000  ! 2068: ORNcc_R	orncc 	%r22, %r0, %r26
T1_asi_reg_rd_96:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 2073: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_rd_97:
	mov	0x3c8, %r14
	.word 0xfedb8400  ! 2079: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T1_asi_reg_rd_98:
	mov	0x33, %r14
	.word 0xf6db8e40  ! 2080: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_169:
	setx	0x2e0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 2083: FMOVLE	fmovs	%fcc1, %f0, %f24
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 0)
	.word 0xb3a509a0  ! 2085: FDIVs	fdivs	%f20, %f0, %f25
	.word 0xbf2d5000  ! 2087: SLLX_R	sllx	%r21, %r0, %r31
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 21)
	.word 0xbba00040  ! 2090: FMOVd	fmovd	%f0, %f60
	.word 0xb7a88820  ! 2091: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbba489c0  ! 2092: FDIVd	fdivd	%f18, %f0, %f60
	.word 0xbb641800  ! 2094: MOVcc_R	<illegal instruction>
	.word 0xb1a549a0  ! 2095: FDIVs	fdivs	%f21, %f0, %f24
T1_asi_reg_rd_99:
	mov	0xb, %r14
	.word 0xf4db8e40  ! 2099: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_100:
	mov	0x33, %r14
	.word 0xfcdb8e80  ! 2104: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb3a00520  ! 2106: FSQRTs	fsqrt	
	.word 0xb1a409c0  ! 2109: FDIVd	fdivd	%f16, %f0, %f24
	.word 0xb1a5c8c0  ! 2110: FSUBd	fsubd	%f54, %f0, %f24
	.word 0xb9a98820  ! 2115: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_170:
	setx	0x2c0311, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_101:
	mov	0x2, %r14
	.word 0xfedb84a0  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbd7d4400  ! 2128: MOVR_R	movre	%r21, %r0, %r30
T1_asi_reg_rd_102:
	mov	0x34, %r14
	.word 0xf6db84a0  ! 2129: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbec56171  ! 2136: ADDCcc_I	addccc 	%r21, 0x0171, %r31
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb5a50860  ! 2140: FADDq	dis not found

cpu_intr_1_171:
	setx	0x2e023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9641800  ! 2144: MOVcc_R	<illegal instruction>
T1_asi_reg_wr_101:
	mov	0x3c3, %r14
	.word 0xf2f38400  ! 2149: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T1_asi_reg_wr_102:
	mov	0x1d, %r14
	.word 0xf4f38e40  ! 2150: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9a81820  ! 2151: FMOVRGZ	fmovs	%fcc3, %f0, %f28
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 32)
	.word 0x8f902001  ! 2155: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 13)
	.word 0xb9a508e0  ! 2157: FSUBq	dis not found

	.word 0xb3a9c820  ! 2159: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb3aac820  ! 2162: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbbab0820  ! 2163: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb1a5c8c0  ! 2166: FSUBd	fsubd	%f54, %f0, %f24
	.word 0xb9a489e0  ! 2168: FDIVq	dis not found

	.word 0xb3a408e0  ! 2169: FSUBq	dis not found

cpu_intr_1_172:
	setx	0x2e0029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_173:
	setx	0x2e002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_103:
	mov	0x18, %r14
	.word 0xfcdb8400  ! 2177: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_104:
	mov	0x19, %r14
	.word 0xf8db8e80  ! 2181: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb1aac820  ! 2182: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbfa448c0  ! 2189: FSUBd	fsubd	%f48, %f0, %f62
	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_rd_105:
	mov	0x17, %r14
	.word 0xfadb89e0  ! 2191: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 26)
	.word 0xb43d21a7  ! 2194: XNOR_I	xnor 	%r20, 0x01a7, %r26
	.word 0xbba84820  ! 2198: FMOVE	fmovs	%fcc1, %f0, %f29
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb1a54960  ! 2203: FMULq	dis not found

iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 12)
	.word 0xb9a90820  ! 2206: FMOVLEU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_106:
	mov	0x3c5, %r14
	.word 0xfadb84a0  ! 2208: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_wr_103:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 2209: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_174:
	setx	0x2d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_107:
	mov	0x3c7, %r14
	.word 0xf8db89e0  ! 2212: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 25)
	.word 0xbda81420  ! 2214: FMOVRNZ	dis not found

	.word 0x87956066  ! 2217: WRPR_TT_I	wrpr	%r21, 0x0066, %tt
T1_asi_reg_wr_104:
	mov	0x17, %r14
	.word 0xf2f389e0  ! 2218: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_wr_105:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 2221: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_175:
	setx	0x2c0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc440000  ! 2224: ADDC_R	addc 	%r16, %r0, %r30
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb68cc000  ! 2229: ANDcc_R	andcc 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a548c0  ! 2235: FSUBd	fsubd	%f52, %f0, %f26
T1_asi_reg_wr_106:
	mov	0x30, %r14
	.word 0xf2f38e40  ! 2237: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_107:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 2243: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_108:
	mov	0x3c1, %r14
	.word 0xf8db8e60  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbba00560  ! 2246: FSQRTq	fsqrt	
T1_asi_reg_rd_109:
	mov	0x37, %r14
	.word 0xf6db8e60  ! 2247: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_rd_110:
	mov	0x3c6, %r14
	.word 0xfadb89e0  ! 2250: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb3aa0820  ! 2254: FMOVA	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_111:
	mov	0x1f, %r14
	.word 0xf0db8e40  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 30)
	.word 0xb5ab8820  ! 2262: FMOVPOS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_176:
	setx	0x320231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8ca089  ! 2267: ANDcc_I	andcc 	%r18, 0x0089, %r30
T1_asi_reg_wr_108:
	mov	0x11, %r14
	.word 0xf6f38e40  ! 2268: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_112:
	mov	0x3c5, %r14
	.word 0xf6db84a0  ! 2280: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_177:
	setx	0x310032, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_113:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 2285: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_178:
	setx	0x320338, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_109:
	mov	0x3c0, %r14
	.word 0xfcf389e0  ! 2290: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_rd_114:
	mov	0x13, %r14
	.word 0xfadb8e80  ! 2291: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9a40940  ! 2295: FMULd	fmuld	%f16, %f0, %f28
T1_asi_reg_wr_110:
	mov	0x28, %r14
	.word 0xfcf384a0  ! 2298: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_179:
	setx	0x320134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 0)
	.word 0xb97c4400  ! 2308: MOVR_R	movre	%r17, %r0, %r28
	.word 0xb1a00540  ! 2310: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_180:
	setx	0x31021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 2318: FSQRTs	fsqrt	
	.word 0xbfa81c20  ! 2319: FMOVRGEZ	dis not found

cpu_intr_1_181:
	setx	0x32021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20d214a  ! 2322: AND_I	and 	%r20, 0x014a, %r25
	.word 0xbdab4820  ! 2323: FMOVCC	fmovs	%fcc1, %f0, %f30
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_111:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 2330: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb7a84820  ! 2334: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a4c860  ! 2336: FADDq	dis not found

	.word 0xbda81420  ! 2338: FMOVRNZ	dis not found

	.word 0xbfa80820  ! 2348: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
cpu_intr_1_182:
	setx	0x310025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03c0000  ! 2350: XNOR_R	xnor 	%r16, %r0, %r24
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 27)
	.word 0xb1aa0820  ! 2355: FMOVA	fmovs	%fcc1, %f0, %f24
cpu_intr_1_183:
	setx	0x32010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_115:
	mov	0x37, %r14
	.word 0xf8db8e40  ! 2366: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb09cc000  ! 2368: XORcc_R	xorcc 	%r19, %r0, %r24
T1_asi_reg_rd_116:
	mov	0xf, %r14
	.word 0xf0db8e40  ! 2372: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_112:
	mov	0x29, %r14
	.word 0xfcf389e0  ! 2374: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_1_184:
	setx	0x320300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_113:
	mov	0x12, %r14
	.word 0xf0f38400  ! 2377: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbba509e0  ! 2379: FDIVq	dis not found

	.word 0xbf2d4000  ! 2381: SLL_R	sll 	%r21, %r0, %r31
cpu_intr_1_185:
	setx	0x31023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_186:
	setx	0x310013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00040  ! 2386: FMOVd	fmovd	%f0, %f60
	.word 0xbfa589a0  ! 2388: FDIVs	fdivs	%f22, %f0, %f31
cpu_intr_1_187:
	setx	0x31031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5abc820  ! 2395: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbeb42190  ! 2396: ORNcc_I	orncc 	%r16, 0x0190, %r31
	.word 0xbba00520  ! 2398: FSQRTs	fsqrt	
	.word 0xb5abc820  ! 2399: FMOVVC	fmovs	%fcc1, %f0, %f26
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb7a40960  ! 2402: FMULq	dis not found

cpu_intr_1_188:
	setx	0x33010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 2405: FSQRTd	fsqrt	
cpu_intr_1_189:
	setx	0x310303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 32)
	.word 0xbba509e0  ! 2412: FDIVq	dis not found

	.word 0xbba48820  ! 2413: FADDs	fadds	%f18, %f0, %f29
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 9)
	.word 0xb3a4c9e0  ! 2415: FDIVq	dis not found

iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 30)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_190:
	setx	0x30013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21d8000  ! 2426: XOR_R	xor 	%r22, %r0, %r25
	.word 0xbab420c4  ! 2427: SUBCcc_I	orncc 	%r16, 0x00c4, %r29
	.word 0xb69c61eb  ! 2433: XORcc_I	xorcc 	%r17, 0x01eb, %r27
T1_asi_reg_wr_114:
	mov	0x2b, %r14
	.word 0xfaf38400  ! 2434: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_115:
	mov	0x6, %r14
	.word 0xf0f38e60  ! 2437: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_rd_117:
	mov	0x2f, %r14
	.word 0xf8db8e80  ! 2439: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_191:
	setx	0x300118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 2445: FMOVRZ	dis not found

cpu_intr_1_192:
	setx	0x320136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a488c0  ! 2448: FSUBd	fsubd	%f18, %f0, %f26
cpu_intr_1_193:
	setx	0x310334, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_118:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 2450: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 33)
	.word 0xb5a50940  ! 2453: FMULd	fmuld	%f20, %f0, %f26
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_116:
	mov	0x3c7, %r14
	.word 0xfcf389e0  ! 2458: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_1_194:
	setx	0x310338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 29)
	.word 0xbfa4c9e0  ! 2464: FDIVq	dis not found

	.word 0xb7a4c920  ! 2465: FMULs	fmuls	%f19, %f0, %f27
cpu_intr_1_195:
	setx	0x33011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_117:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 2470: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_196:
	setx	0x32021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_197:
	setx	0x320025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_198:
	setx	0x330317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_119:
	mov	0x18, %r14
	.word 0xfcdb8400  ! 2477: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_118:
	mov	0x16, %r14
	.word 0xf2f38e60  ! 2478: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb3a549e0  ! 2480: FDIVq	dis not found

T1_asi_reg_rd_120:
	mov	0x36, %r14
	.word 0xf2db8e60  ! 2481: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_199:
	setx	0x300207, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_119:
	mov	0x6, %r14
	.word 0xf8f38e40  ! 2485: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbba50920  ! 2486: FMULs	fmuls	%f20, %f0, %f29
	.word 0xb5a90820  ! 2487: FMOVLEU	fmovs	%fcc1, %f0, %f26
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 20)
	.word 0xb694a0b6  ! 2502: ORcc_I	orcc 	%r18, 0x00b6, %r27
cpu_intr_1_200:
	setx	0x330105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_201:
	setx	0x310210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a549c0  ! 2509: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xb9a449e0  ! 2515: FDIVq	dis not found

iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_120:
	mov	0x3c1, %r14
	.word 0xfaf38e60  ! 2518: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xba250000  ! 2519: SUB_R	sub 	%r20, %r0, %r29
	lda	[%r17 + %g0] 0xf0, %f2
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb7a8c820  ! 2528: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb7a44960  ! 2530: FMULq	dis not found

iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_202:
	setx	0x31000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_203:
	setx	0x31003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_121:
	mov	0x2f, %r14
	.word 0xf8db8e40  ! 2539: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_204:
	setx	0x320017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_121:
	mov	0x20, %r14
	.word 0xf2f38e40  ! 2552: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_205:
	setx	0x30013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_122:
	mov	0x1a, %r14
	.word 0xf0f38e60  ! 2559: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb5ab4820  ! 2563: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb7a00560  ! 2566: FSQRTq	fsqrt	
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbda40820  ! 2568: FADDs	fadds	%f16, %f0, %f30
	.word 0xbfaac820  ! 2569: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_123:
	mov	0x17, %r14
	.word 0xfcf389e0  ! 2571: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb3aa8820  ! 2573: FMOVG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_124:
	mov	0x15, %r14
	.word 0xf8f384a0  ! 2574: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbfabc820  ! 2576: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbda9c820  ! 2578: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb29d20f0  ! 2579: XORcc_I	xorcc 	%r20, 0x00f0, %r25
	.word 0xb01de1a1  ! 2581: XOR_I	xor 	%r23, 0x01a1, %r24
	.word 0xb9a4c860  ! 2585: FADDq	dis not found

	.word 0xb7a81c20  ! 2587: FMOVRGEZ	dis not found

	.word 0xbfab0820  ! 2590: FMOVGU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_122:
	mov	0x3c8, %r14
	.word 0xfadb8e60  ! 2591: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb9a81820  ! 2594: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb2b5a18d  ! 2595: ORNcc_I	orncc 	%r22, 0x018d, %r25
	.word 0xbf3c5000  ! 2596: SRAX_R	srax	%r17, %r0, %r31
	.word 0xbda00560  ! 2600: FSQRTq	fsqrt	
T1_asi_reg_wr_125:
	mov	0xc, %r14
	.word 0xf4f389e0  ! 2601: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_206:
	setx	0x300204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 34)
	.word 0xb1a54960  ! 2605: FMULq	dis not found

	.word 0xb3aac820  ! 2610: FMOVGE	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_207:
	setx	0x320207, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_123:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 2616: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_124:
	mov	0xa, %r14
	.word 0xf0db8400  ! 2617: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_126:
	mov	0x9, %r14
	.word 0xfcf38400  ! 2620: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbba81420  ! 2622: FMOVRNZ	dis not found

	.word 0xb1a8c820  ! 2623: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb1a00040  ! 2624: FMOVd	fmovd	%f0, %f24
	.word 0xb1a00040  ! 2626: FMOVd	fmovd	%f0, %f24
cpu_intr_1_208:
	setx	0x31032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_209:
	setx	0x300231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aac820  ! 2633: FMOVGE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_125:
	mov	0x30, %r14
	.word 0xfadb8e60  ! 2634: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0x8594a1e8  ! 2636: WRPR_TSTATE_I	wrpr	%r18, 0x01e8, %tstate
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_210:
	setx	0x330326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80c20  ! 2645: FMOVRLZ	dis not found

	.word 0xbda80820  ! 2650: FMOVN	fmovs	%fcc1, %f0, %f30
cpu_intr_1_211:
	setx	0x330029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00020  ! 2654: FMOVs	fmovs	%f0, %f25
	.word 0xbda90820  ! 2656: FMOVLEU	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_126:
	mov	0x15, %r14
	.word 0xf4db8e60  ! 2658: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_wr_127:
	mov	0x2a, %r14
	.word 0xf2f38400  ! 2659: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbbaa4820  ! 2663: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a00540  ! 2665: FSQRTd	fsqrt	
T1_asi_reg_rd_127:
	mov	0x2b, %r14
	.word 0xf8db8e40  ! 2666: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_128:
	mov	0x26, %r14
	.word 0xfadb8e80  ! 2667: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbda00520  ! 2670: FSQRTs	fsqrt	
T1_asi_reg_rd_129:
	mov	0x8, %r14
	.word 0xf4db89e0  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb7abc820  ! 2672: FMOVVC	fmovs	%fcc1, %f0, %f27
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 17)
	.word 0xb7500000  ! 2674: RDPR_TPC	<illegal instruction>
	.word 0xbfaa4820  ! 2676: FMOVNE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_212:
	setx	0x320238, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_130:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 2679: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb7a00520  ! 2680: FSQRTs	fsqrt	
cpu_intr_1_213:
	setx	0x330313, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_131:
	mov	0x18, %r14
	.word 0xf6db8400  ! 2683: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb3a00560  ! 2684: FSQRTq	fsqrt	
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_132:
	mov	0x1e, %r14
	.word 0xf6db8e40  ! 2690: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 13)
	.word 0xb9ab8820  ! 2694: FMOVPOS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_133:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 2695: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 36)
	.word 0xb3a408e0  ! 2697: FSUBq	dis not found

iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_214:
	setx	0x330219, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_134:
	mov	0x7, %r14
	.word 0xf4db84a0  ! 2707: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T1_asi_reg_rd_135:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 2709: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb434a0fe  ! 2711: ORN_I	orn 	%r18, 0x00fe, %r26
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_136:
	mov	0x3c2, %r14
	.word 0xf4db84a0  ! 2721: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbd643801  ! 2722: MOVcc_I	<illegal instruction>
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb68dc000  ! 2725: ANDcc_R	andcc 	%r23, %r0, %r27
	.word 0xbda5c8a0  ! 2727: FSUBs	fsubs	%f23, %f0, %f30
	.word 0xbfab4820  ! 2729: FMOVCC	fmovs	%fcc1, %f0, %f31
cpu_intr_1_215:
	setx	0x34012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_216:
	setx	0x340305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 2734: FMOVRZ	dis not found

iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 17)
	.word 0xbaa420b1  ! 2737: SUBcc_I	subcc 	%r16, 0x00b1, %r29
	.word 0xbda409a0  ! 2738: FDIVs	fdivs	%f16, %f0, %f30
T1_asi_reg_rd_137:
	mov	0x22, %r14
	.word 0xfedb8e40  ! 2739: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1a81820  ! 2740: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbfa48940  ! 2748: FMULd	fmuld	%f18, %f0, %f62
T1_asi_reg_rd_138:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 2749: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbfa00040  ! 2751: FMOVd	fmovd	%f0, %f62
	.word 0xb1a00540  ! 2753: FSQRTd	fsqrt	
	.word 0xb5a40960  ! 2754: FMULq	dis not found

T1_asi_reg_wr_128:
	mov	0x7, %r14
	.word 0xfef38e40  ! 2755: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbe9d8000  ! 2757: XORcc_R	xorcc 	%r22, %r0, %r31
	.word 0xb7a00040  ! 2760: FMOVd	fmovd	%f0, %f58
cpu_intr_1_217:
	setx	0x360101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a549e0  ! 2762: FDIVq	dis not found

	.word 0xbba44960  ! 2765: FMULq	dis not found

cpu_intr_1_218:
	setx	0x360032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 2769: FSQRTq	fsqrt	
	.word 0xb1a80820  ! 2770: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbfaa0820  ! 2774: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb1a4c920  ! 2777: FMULs	fmuls	%f19, %f0, %f24
	.word 0xb5a40940  ! 2780: FMULd	fmuld	%f16, %f0, %f26
	.word 0xbba58840  ! 2781: FADDd	faddd	%f22, %f0, %f60
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_219:
	setx	0x35003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93d4000  ! 2787: SRA_R	sra 	%r21, %r0, %r28
	.word 0xbfa489a0  ! 2788: FDIVs	fdivs	%f18, %f0, %f31
	.word 0xb1358000  ! 2789: SRL_R	srl 	%r22, %r0, %r24
T1_asi_reg_rd_139:
	mov	0x2a, %r14
	.word 0xf0db8e80  ! 2798: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb9a00540  ! 2800: FSQRTd	fsqrt	
T1_asi_reg_wr_129:
	mov	0x3c3, %r14
	.word 0xfaf38e60  ! 2801: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_220:
	setx	0x370220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa84820  ! 2810: FMOVE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_140:
	mov	0x14, %r14
	.word 0xf8db8e60  ! 2811: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 1)
	.word 0xb1a50840  ! 2818: FADDd	faddd	%f20, %f0, %f24
T1_asi_reg_rd_141:
	mov	0x34, %r14
	.word 0xfcdb8e40  ! 2819: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb8040000  ! 2820: ADD_R	add 	%r16, %r0, %r28
cpu_intr_1_221:
	setx	0x350212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 12)
	.word 0xb3a9c820  ! 2828: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb6bcc000  ! 2830: XNORcc_R	xnorcc 	%r19, %r0, %r27
	.word 0xb5a00560  ! 2836: FSQRTq	fsqrt	
	.word 0xb7a98820  ! 2837: FMOVNEG	fmovs	%fcc1, %f0, %f27
cpu_intr_1_222:
	setx	0x37003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194a00c  ! 2842: WRPR_PIL_I	wrpr	%r18, 0x000c, %pil
	.word 0xb5a50840  ! 2844: FADDd	faddd	%f20, %f0, %f26
	.word 0xb3a00560  ! 2846: FSQRTq	fsqrt	
cpu_intr_1_223:
	setx	0x360221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdabc820  ! 2855: FMOVVC	fmovs	%fcc1, %f0, %f30
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_142:
	mov	0x20, %r14
	.word 0xf8db8e80  ! 2857: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_rd_143:
	mov	0x1e, %r14
	.word 0xfedb8e80  ! 2864: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb234a0ee  ! 2865: SUBC_I	orn 	%r18, 0x00ee, %r25
T1_asi_reg_wr_130:
	mov	0x1d, %r14
	.word 0xf4f38e40  ! 2867: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbe85c000  ! 2869: ADDcc_R	addcc 	%r23, %r0, %r31
T1_asi_reg_wr_131:
	mov	0x27, %r14
	.word 0xf0f389e0  ! 2870: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_wr_132:
	mov	0x3c5, %r14
	.word 0xf4f38400  ! 2875: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_1_224:
	setx	0x360002, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_144:
	mov	0x3c3, %r14
	.word 0xfedb8e60  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_1_225:
	setx	0x34012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_226:
	setx	0x360337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_227:
	setx	0x370304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 2883: FMOVd	fmovd	%f0, %f24
	.word 0xb9a50960  ! 2884: FMULq	dis not found

	.word 0xb7a58960  ! 2886: FMULq	dis not found

	.word 0xbda548c0  ! 2890: FSUBd	fsubd	%f52, %f0, %f30
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_145:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 2893: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbe1d4000  ! 2898: XOR_R	xor 	%r21, %r0, %r31
	.word 0xb5aa0820  ! 2900: FMOVA	fmovs	%fcc1, %f0, %f26
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_rd_146:
	mov	0x11, %r14
	.word 0xfcdb8e40  ! 2904: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_wr_133:
	mov	0x7, %r14
	.word 0xf0f38e40  ! 2909: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_147:
	mov	0x17, %r14
	.word 0xf0db8e40  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_228:
	setx	0x340217, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_134:
	mov	0x37, %r14
	.word 0xfcf389e0  ! 2921: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6b54000  ! 2925: ORNcc_R	orncc 	%r21, %r0, %r27
cpu_intr_1_229:
	setx	0x36010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a548a0  ! 2932: FSUBs	fsubs	%f21, %f0, %f24
cpu_intr_1_230:
	setx	0x360125, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_148:
	mov	0xb, %r14
	.word 0xf2db8e40  ! 2934: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_149:
	mov	0x2d, %r14
	.word 0xf4db8400  ! 2937: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_231:
	setx	0x350335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab4820  ! 2943: FMOVCC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_135:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 2946: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb035a045  ! 2948: SUBC_I	orn 	%r22, 0x0045, %r24
	.word 0xb1a81420  ! 2949: FMOVRNZ	dis not found

	.word 0xb1a50920  ! 2952: FMULs	fmuls	%f20, %f0, %f24
T1_asi_reg_wr_136:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 2953: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_137:
	mov	0x3c8, %r14
	.word 0xf8f38e60  ! 2955: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T1_asi_reg_wr_138:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 2957: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_139:
	mov	0x12, %r14
	.word 0xf0f389e0  ! 2963: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_232:
	setx	0x370227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_233:
	setx	0x350335, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_150:
	mov	0x30, %r14
	.word 0xfedb89e0  ! 2967: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbfa4c8e0  ! 2968: FSUBq	dis not found

	.word 0xb5a00040  ! 2969: FMOVd	fmovd	%f0, %f26
	.word 0xbfaa0820  ! 2970: FMOVA	fmovs	%fcc1, %f0, %f31
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 25)
	.word 0xbda448a0  ! 2972: FSUBs	fsubs	%f17, %f0, %f30
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_140:
	mov	0x25, %r14
	.word 0xf4f389e0  ! 2982: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb5ab0820  ! 2983: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb3a90820  ! 2986: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 28)
	.word 0xbf2c8000  ! 2991: SLL_R	sll 	%r18, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_141:
	mov	0xd, %r14
	.word 0xfcf384a0  ! 2997: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb4948000  ! 3003: ORcc_R	orcc 	%r18, %r0, %r26
T1_asi_reg_wr_142:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 3006: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_151:
	mov	0x3c3, %r14
	.word 0xf2db8e80  ! 3007: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbda80c20  ! 3012: FMOVRLZ	dis not found

T1_asi_reg_wr_143:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 3013: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb9ab8820  ! 3014: FMOVPOS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_152:
	mov	0x26, %r14
	.word 0xf4db89e0  ! 3015: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb7a88820  ! 3016: FMOVLE	fmovs	%fcc1, %f0, %f27
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
	.word 0xb9a90820  ! 3026: FMOVLEU	fmovs	%fcc1, %f0, %f28
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_234:
	setx	0x370015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8c21e9  ! 3034: ANDcc_I	andcc 	%r16, 0x01e9, %r29
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 20)
	.word 0xbba00540  ! 3039: FSQRTd	fsqrt	
	.word 0xbfa54860  ! 3042: FADDq	dis not found

T1_asi_reg_rd_153:
	mov	0x3, %r14
	.word 0xfcdb8e80  ! 3045: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb5a548c0  ! 3046: FSUBd	fsubd	%f52, %f0, %f26
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_wr_144:
	mov	0x2e, %r14
	.word 0xfaf38400  ! 3052: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_rd_154:
	mov	0x2d, %r14
	.word 0xfadb8e40  ! 3054: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5a4c840  ! 3055: FADDd	faddd	%f50, %f0, %f26
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_235:
	setx	0x340124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_236:
	setx	0x36000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3d4000  ! 3062: XNOR_R	xnor 	%r21, %r0, %r30
cpu_intr_1_237:
	setx	0x340121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a448c0  ! 3064: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xb9a4c8e0  ! 3065: FSUBq	dis not found

iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 5)
	.word 0xb7a00560  ! 3070: FSQRTq	fsqrt	
T1_asi_reg_rd_155:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_wr_145:
	mov	0x26, %r14
	.word 0xfaf38e40  ! 3073: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_156:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 3075: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_238:
	setx	0x360025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a548e0  ! 3080: FSUBq	dis not found

	.word 0xb0954000  ! 3084: ORcc_R	orcc 	%r21, %r0, %r24
	.word 0xb13d4000  ! 3085: SRA_R	sra 	%r21, %r0, %r24
cpu_intr_1_239:
	setx	0x350000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_240:
	setx	0x35013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_241:
	setx	0x350115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab4820  ! 3097: FMOVCC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_157:
	mov	0x24, %r14
	.word 0xf0db89e0  ! 3099: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_242:
	setx	0x370239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_243:
	setx	0x350303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 36)
	.word 0xb5ab0820  ! 3108: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb2a46090  ! 3109: SUBcc_I	subcc 	%r17, 0x0090, %r25
	.word 0xb5a00520  ! 3110: FSQRTs	fsqrt	
	.word 0xbfa80c20  ! 3111: FMOVRLZ	dis not found

	.word 0xbda80c20  ! 3113: FMOVRLZ	dis not found

	.word 0xb1a00040  ! 3117: FMOVd	fmovd	%f0, %f24
	.word 0xb1ab8820  ! 3118: FMOVPOS	fmovs	%fcc1, %f0, %f24
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb3a00560  ! 3122: FSQRTq	fsqrt	
T1_asi_reg_rd_158:
	mov	0x24, %r14
	.word 0xf6db8e60  ! 3123: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbda84820  ! 3125: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xbba80820  ! 3126: FMOVN	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_159:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 3127: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_244:
	setx	0x370121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 35)
	.word 0xbfa00560  ! 3133: FSQRTq	fsqrt	
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb3a5c8c0  ! 3141: FSUBd	fsubd	%f54, %f0, %f56
T1_asi_reg_rd_160:
	mov	0x3c7, %r14
	.word 0xfcdb8e80  ! 3142: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbe8c8000  ! 3146: ANDcc_R	andcc 	%r18, %r0, %r31
	.word 0xb7a00560  ! 3151: FSQRTq	fsqrt	
	.word 0xbba408c0  ! 3152: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xbfa40920  ! 3153: FMULs	fmuls	%f16, %f0, %f31
cpu_intr_1_245:
	setx	0x350235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa8820  ! 3155: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbe3d209d  ! 3157: XNOR_I	xnor 	%r20, 0x009d, %r31
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 19)
	.word 0x919460e1  ! 3159: WRPR_PIL_I	wrpr	%r17, 0x00e1, %pil
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 4)
	.word 0xb1a4c9c0  ! 3162: FDIVd	fdivd	%f50, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_246:
	setx	0x35021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_247:
	setx	0x3b0315, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_161:
	mov	0x7, %r14
	.word 0xf4db8e60  ! 3168: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_rd_162:
	mov	0x19, %r14
	.word 0xf2db84a0  ! 3170: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 12)
	.word 0xb4ad8000  ! 3184: ANDNcc_R	andncc 	%r22, %r0, %r26
	.word 0xbba8c820  ! 3185: FMOVL	fmovs	%fcc1, %f0, %f29
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_rd_163:
	mov	0x31, %r14
	.word 0xf8db8e80  ! 3189: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb3a00520  ! 3190: FSQRTs	fsqrt	
	lda	[%r21 + %g0] 0xf0, %f2
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_164:
	mov	0x29, %r14
	.word 0xfadb8400  ! 3195: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb3a4c820  ! 3196: FADDs	fadds	%f19, %f0, %f25
	.word 0xbba58840  ! 3199: FADDd	faddd	%f22, %f0, %f60
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_248:
	setx	0x38013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 3205: FMOVGE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_249:
	setx	0x3a0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00040  ! 3208: FMOVd	fmovd	%f0, %f26
	.word 0xb9a449c0  ! 3211: FDIVd	fdivd	%f48, %f0, %f28
T1_asi_reg_rd_165:
	mov	0x25, %r14
	.word 0xfcdb89e0  ! 3212: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	lda	[%r21 + %g0] 0xf0, %f2
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbba00020  ! 3224: FMOVs	fmovs	%f0, %f29
	.word 0xb9abc820  ! 3228: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_250:
	setx	0x39000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 38)
	.word 0xbba80420  ! 3234: FMOVRZ	dis not found

	.word 0xb5a8c820  ! 3236: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00540  ! 3240: FSQRTd	fsqrt	
	.word 0xbbab4820  ! 3241: FMOVCC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_166:
	mov	0xa, %r14
	.word 0xfadb8e60  ! 3242: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbfa84820  ! 3245: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a5c940  ! 3246: FMULd	fmuld	%f54, %f0, %f26
T1_asi_reg_rd_167:
	mov	0x1a, %r14
	.word 0xfadb84a0  ! 3248: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb3a40860  ! 3249: FADDq	dis not found

	.word 0xb1a448c0  ! 3250: FSUBd	fsubd	%f48, %f0, %f24
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_251:
	setx	0x39032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x85952154  ! 3255: WRPR_TSTATE_I	wrpr	%r20, 0x0154, %tstate
cpu_intr_1_252:
	setx	0x3b021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba88820  ! 3258: FMOVLE	fmovs	%fcc1, %f0, %f29
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_168:
	mov	0x4, %r14
	.word 0xf6db84a0  ! 3262: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbba88820  ! 3264: FMOVLE	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_146:
	mov	0x9, %r14
	.word 0xf8f38e40  ! 3269: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_169:
	mov	0x2c, %r14
	.word 0xfadb8e80  ! 3276: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 2c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6342059  ! 3285: ORN_I	orn 	%r16, 0x0059, %r27
T1_asi_reg_rd_170:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 3287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_171:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 3289: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb3a00540  ! 3292: FSQRTd	fsqrt	
cpu_intr_1_253:
	setx	0x39030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 3297: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb3a9c820  ! 3298: FMOVVS	fmovs	%fcc1, %f0, %f25
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 13)
	.word 0xbba448c0  ! 3300: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xb7a9c820  ! 3302: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb7a9c820  ! 3304: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a40940  ! 3306: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb9a00540  ! 3307: FSQRTd	fsqrt	
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb9a90820  ! 3309: FMOVLEU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_172:
	mov	0x26, %r14
	.word 0xf0db84a0  ! 3311: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbb3ca001  ! 3312: SRA_I	sra 	%r18, 0x0001, %r29
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_173:
	mov	0x38, %r14
	.word 0xf8db89e0  ! 3316: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_wr_147:
	mov	0x3c1, %r14
	.word 0xfcf38e80  ! 3318: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_wr_148:
	mov	0x1b, %r14
	.word 0xfef38e40  ! 3320: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbaa4820  ! 3321: FMOVNE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_149:
	mov	0x1b, %r14
	.word 0xf0f384a0  ! 3325: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_254:
	setx	0x3b031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a508a0  ! 3329: FSUBs	fsubs	%f20, %f0, %f24
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb7a98820  ! 3333: FMOVNEG	fmovs	%fcc1, %f0, %f27
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_255:
	setx	0x3a033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 30)
	.word 0xb1350000  ! 3344: SRL_R	srl 	%r20, %r0, %r24
	.word 0xb205a0ed  ! 3345: ADD_I	add 	%r22, 0x00ed, %r25
	.word 0xbda00520  ! 3346: FSQRTs	fsqrt	
	.word 0xbba40860  ! 3348: FADDq	dis not found

cpu_intr_1_256:
	setx	0x3a0220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 10)
	.word 0xb5a40960  ! 3352: FMULq	dis not found

T1_asi_reg_rd_174:
	mov	0x23, %r14
	.word 0xf6db84a0  ! 3356: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb9a81c20  ! 3359: FMOVRGEZ	dis not found

	.word 0xbdaa0820  ! 3362: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00540  ! 3364: FSQRTd	fsqrt	
	.word 0xbba508a0  ! 3366: FSUBs	fsubs	%f20, %f0, %f29
T1_asi_reg_rd_175:
	mov	0x7, %r14
	.word 0xf0db8400  ! 3372: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_150:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 3376: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_176:
	mov	0x29, %r14
	.word 0xfadb89e0  ! 3378: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0x8f902000  ! 3379: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cpu_intr_1_257:
	setx	0x3a0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_258:
	setx	0x39001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 18)
	.word 0xb9a489c0  ! 3384: FDIVd	fdivd	%f18, %f0, %f28
	.word 0xbba5c8e0  ! 3387: FSUBq	dis not found

	.word 0xb3a50920  ! 3389: FMULs	fmuls	%f20, %f0, %f25
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_259:
	setx	0x38032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_151:
	mov	0x23, %r14
	.word 0xfaf38e40  ! 3393: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfa80420  ! 3394: FMOVRZ	dis not found

cpu_intr_1_260:
	setx	0x3b012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_261:
	setx	0x3b0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 3403: FMOVRZ	dis not found

iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 22)
	.word 0xb20d8000  ! 3405: AND_R	and 	%r22, %r0, %r25
	.word 0xb5a50940  ! 3407: FMULd	fmuld	%f20, %f0, %f26
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 6)
	.word 0xb1a4c960  ! 3410: FMULq	dis not found

	.word 0xb7a44840  ! 3415: FADDd	faddd	%f48, %f0, %f58
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_262:
	setx	0x390034, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_177:
	mov	0x36, %r14
	.word 0xf8db8e80  ! 3420: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_wr_152:
	mov	0x3c1, %r14
	.word 0xfaf38e60  ! 3424: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_263:
	setx	0x3b0110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_wr_153:
	mov	0x1e, %r14
	.word 0xf0f38e40  ! 3433: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_154:
	mov	0x8, %r14
	.word 0xf2f38e40  ! 3434: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbba9c820  ! 3437: FMOVVS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_264:
	setx	0x3b0304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbba90820  ! 3444: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb1a4c840  ! 3445: FADDd	faddd	%f50, %f0, %f24
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 7)
	.word 0xbba589c0  ! 3452: FDIVd	fdivd	%f22, %f0, %f60
cpu_intr_1_265:
	setx	0x390021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 3)
	.word 0xbdabc820  ! 3459: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb7a80420  ! 3460: FMOVRZ	dis not found

	.word 0xbfa40920  ! 3461: FMULs	fmuls	%f16, %f0, %f31
T1_asi_reg_rd_178:
	mov	0x3c7, %r14
	.word 0xfcdb8e80  ! 3462: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_266:
	setx	0x390331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00040  ! 3466: FMOVd	fmovd	%f0, %f62
cpu_intr_1_267:
	setx	0x3b022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_268:
	setx	0x390319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c820  ! 3472: FADDs	fadds	%f23, %f0, %f24
	.word 0xb60d21ec  ! 3475: AND_I	and 	%r20, 0x01ec, %r27
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_269:
	setx	0x380237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 3481: FMOVRGEZ	dis not found

	.word 0xbfab8820  ! 3483: FMOVPOS	fmovs	%fcc1, %f0, %f31
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_270:
	setx	0x3a0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a549e0  ! 3490: FDIVq	dis not found

T1_asi_reg_wr_155:
	mov	0x1b, %r14
	.word 0xf8f38e80  ! 3491: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_wr_156:
	mov	0xf, %r14
	.word 0xf8f384a0  ! 3493: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb6454000  ! 3495: ADDC_R	addc 	%r21, %r0, %r27
cpu_intr_1_271:
	setx	0x380325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b5c000  ! 3497: SUBCcc_R	orncc 	%r23, %r0, %r25
cpu_intr_1_272:
	setx	0x3a002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 3500: FSQRTq	fsqrt	
T1_asi_reg_wr_157:
	mov	0x12, %r14
	.word 0xf6f38e80  ! 3501: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbda489c0  ! 3502: FDIVd	fdivd	%f18, %f0, %f30
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_273:
	setx	0x380016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 3507: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb2b52034  ! 3510: SUBCcc_I	orncc 	%r20, 0x0034, %r25
	.word 0xbfa00520  ! 3516: FSQRTs	fsqrt	
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_rd_179:
	mov	0x3c1, %r14
	.word 0xfadb84a0  ! 3519: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_rd_180:
	mov	0x1a, %r14
	.word 0xf0db8e40  ! 3520: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9aa8820  ! 3521: FMOVG	fmovs	%fcc1, %f0, %f28
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbfa5c840  ! 3532: FADDd	faddd	%f54, %f0, %f62
	.word 0xb1a58920  ! 3533: FMULs	fmuls	%f22, %f0, %f24
cpu_intr_1_274:
	setx	0x3a0120, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_158:
	mov	0xa, %r14
	.word 0xf4f384a0  ! 3535: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_rd_181:
	mov	0x3c3, %r14
	.word 0xfcdb8e60  ! 3536: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 22)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a548a0  ! 3539: FSUBs	fsubs	%f21, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_275:
	setx	0x390117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00020  ! 3554: FMOVs	fmovs	%f0, %f30
T1_asi_reg_wr_159:
	mov	0x35, %r14
	.word 0xf2f38e60  ! 3555: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_rd_182:
	mov	0x34, %r14
	.word 0xfadb8400  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb9a50860  ! 3558: FADDq	dis not found

T1_asi_reg_rd_183:
	mov	0x2c, %r14
	.word 0xfadb8e60  ! 3560: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_276:
	setx	0x3b0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20c6117  ! 3562: AND_I	and 	%r17, 0x0117, %r25
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 17)
	.word 0xbbab8820  ! 3571: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbda508a0  ! 3575: FSUBs	fsubs	%f20, %f0, %f30
T1_asi_reg_rd_184:
	mov	0x37, %r14
	.word 0xf0db89e0  ! 3577: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbfa81820  ! 3580: FMOVRGZ	fmovs	%fcc3, %f0, %f31
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_277:
	setx	0x39021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a50860  ! 3584: FADDq	dis not found

T1_asi_reg_wr_160:
	mov	0x2f, %r14
	.word 0xf6f38e60  ! 3586: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_rd_185:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 3587: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_rd_186:
	mov	0x11, %r14
	.word 0xfadb8e40  ! 3588: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3a00040  ! 3595: FMOVd	fmovd	%f0, %f56
T1_asi_reg_rd_187:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 3596: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb3a98820  ! 3599: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbda488e0  ! 3600: FSUBq	dis not found

	.word 0xbda00020  ! 3602: FMOVs	fmovs	%f0, %f30
cpu_intr_1_278:
	setx	0x390118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a488c0  ! 3608: FSUBd	fsubd	%f18, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_279:
	setx	0x38003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a449c0  ! 3613: FDIVd	fdivd	%f48, %f0, %f28
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_280:
	setx	0x390304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58960  ! 3616: FMULq	dis not found

cpu_intr_1_281:
	setx	0x380124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 3621: FMOVRGEZ	dis not found

T1_asi_reg_wr_161:
	mov	0x3c6, %r14
	.word 0xf6f38e60  ! 3624: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb3349000  ! 3626: SRLX_R	srlx	%r18, %r0, %r25
	.word 0xb1a90820  ! 3628: FMOVLEU	fmovs	%fcc1, %f0, %f24
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_162:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 3630: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfaa8820  ! 3633: FMOVG	fmovs	%fcc1, %f0, %f31
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_282:
	setx	0x3d0321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb5a408a0  ! 3642: FSUBs	fsubs	%f16, %f0, %f26
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_wr_163:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 3646: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_188:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 3647: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_283:
	setx	0x3f021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_284:
	setx	0x3c0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81820  ! 3661: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb49c0000  ! 3662: XORcc_R	xorcc 	%r16, %r0, %r26
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_285:
	setx	0x3d0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a48920  ! 3667: FMULs	fmuls	%f18, %f0, %f27
T1_asi_reg_wr_164:
	mov	0x1f, %r14
	.word 0xf8f38e40  ! 3669: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_165:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 3671: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb17dc400  ! 3672: MOVR_R	movre	%r23, %r0, %r24
T1_asi_reg_rd_189:
	mov	0x8, %r14
	.word 0xf0db84a0  ! 3674: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_286:
	setx	0x3d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_287:
	setx	0x3d0014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb9a81420  ! 3683: FMOVRNZ	dis not found

cpu_intr_1_288:
	setx	0x3c0338, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_166:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 3689: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_289:
	setx	0x3e0039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_290:
	setx	0x3e0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa0820  ! 3704: FMOVA	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_190:
	mov	0x15, %r14
	.word 0xf8db8e60  ! 3705: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xbd3d2001  ! 3707: SRA_I	sra 	%r20, 0x0001, %r30
	.word 0xbd518000  ! 3708: RDPR_PSTATE	<illegal instruction>
T1_asi_reg_wr_167:
	mov	0x6, %r14
	.word 0xfef38e40  ! 3711: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_291:
	setx	0x3e002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 3713: RDPR_PIL	<illegal instruction>
	.word 0xbfab0820  ! 3714: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb9a408e0  ! 3717: FSUBq	dis not found

	.word 0xb3a508c0  ! 3718: FSUBd	fsubd	%f20, %f0, %f56
	.word 0xb9a589e0  ! 3721: FDIVq	dis not found

T1_asi_reg_rd_191:
	mov	0x35, %r14
	.word 0xf2db8e80  ! 3722: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_292:
	setx	0x3f000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_168:
	mov	0x1a, %r14
	.word 0xf4f389e0  ! 3725: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_wr_169:
	mov	0x38, %r14
	.word 0xf4f38400  ! 3726: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_rd_192:
	mov	0xd, %r14
	.word 0xf4db8e60  ! 3727: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_wr_170:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 3730: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbda548c0  ! 3734: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xb5aa4820  ! 3735: FMOVNE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_193:
	mov	0x5, %r14
	.word 0xfadb8e80  ! 3736: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb3a00560  ! 3738: FSQRTq	fsqrt	
cpu_intr_1_293:
	setx	0x3f0020, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_171:
	mov	0x31, %r14
	.word 0xfef38e40  ! 3741: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb5aa0820  ! 3742: FMOVA	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_194:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_294:
	setx	0x3d022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_195:
	mov	0x37, %r14
	.word 0xf2db8e40  ! 3747: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_295:
	setx	0x3f000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_196:
	mov	0xa, %r14
	.word 0xf0db8e40  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_172:
	mov	0x3c4, %r14
	.word 0xfaf38400  ! 3757: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_rd_197:
	mov	0x36, %r14
	.word 0xf2db8e40  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3a44920  ! 3759: FMULs	fmuls	%f17, %f0, %f25
	.word 0xb1a489e0  ! 3761: FDIVq	dis not found

	.word 0xb1a4c860  ! 3762: FADDq	dis not found

T1_asi_reg_rd_198:
	mov	0x33, %r14
	.word 0xfcdb84a0  ! 3763: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbfaa4820  ! 3765: FMOVNE	fmovs	%fcc1, %f0, %f31
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 13)
	.word 0xbbab4820  ! 3767: FMOVCC	fmovs	%fcc1, %f0, %f29
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 12)
	.word 0xbba48960  ! 3780: FMULq	dis not found

	.word 0xb9a94820  ! 3781: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbba4c940  ! 3782: FMULd	fmuld	%f50, %f0, %f60
	.word 0xbba40840  ! 3783: FADDd	faddd	%f16, %f0, %f60
T1_asi_reg_wr_173:
	mov	0x30, %r14
	.word 0xf0f384a0  ! 3784: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb5aa8820  ! 3785: FMOVG	fmovs	%fcc1, %f0, %f26
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_296:
	setx	0x3e0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 3793: FSQRTd	fsqrt	
	.word 0xb9a8c820  ! 3795: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb7a40920  ! 3797: FMULs	fmuls	%f16, %f0, %f27
T1_asi_reg_rd_199:
	mov	0x38, %r14
	.word 0xfedb8e80  ! 3799: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb9aac820  ! 3801: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbc24c000  ! 3804: SUB_R	sub 	%r19, %r0, %r30
	.word 0xb9a81820  ! 3808: FMOVRGZ	fmovs	%fcc3, %f0, %f28
cpu_intr_1_297:
	setx	0x3c011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa8820  ! 3810: FMOVG	fmovs	%fcc1, %f0, %f30
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 23)
	.word 0xb9a80820  ! 3813: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb7a00560  ! 3817: FSQRTq	fsqrt	
	.word 0xbfa488e0  ! 3821: FSUBq	dis not found

	.word 0xb9a44960  ! 3826: FMULq	dis not found

T1_asi_reg_rd_200:
	mov	0xf, %r14
	.word 0xf2db89e0  ! 3829: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbba508a0  ! 3838: FSUBs	fsubs	%f20, %f0, %f29
T1_asi_reg_wr_174:
	mov	0x15, %r14
	.word 0xf8f384a0  ! 3839: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb1ab4820  ! 3840: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb9a4c940  ! 3842: FMULd	fmuld	%f50, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbdab8820  ! 3846: FMOVPOS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_201:
	mov	0x3, %r14
	.word 0xfedb8e60  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbcc4c000  ! 3852: ADDCcc_R	addccc 	%r19, %r0, %r30
	.word 0xb9345000  ! 3856: SRLX_R	srlx	%r17, %r0, %r28
cpu_intr_1_298:
	setx	0x3c033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a588e0  ! 3858: FSUBq	dis not found

iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_299:
	setx	0x3f0332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_300:
	setx	0x3f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb3a449a0  ! 3867: FDIVs	fdivs	%f17, %f0, %f25
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, c)
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_301:
	setx	0x3f0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48820  ! 3880: FADDs	fadds	%f18, %f0, %f26
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 24)
	.word 0xb7a4c9e0  ! 3899: FDIVq	dis not found

	.word 0xbc25c000  ! 3900: SUB_R	sub 	%r23, %r0, %r30
cpu_intr_1_302:
	setx	0x3c001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 3904: FMOVVS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_202:
	mov	0x2a, %r14
	.word 0xfcdb8400  ! 3906: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb1a88820  ! 3908: FMOVLE	fmovs	%fcc1, %f0, %f24
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 29)
	.word 0xb1a589a0  ! 3915: FDIVs	fdivs	%f22, %f0, %f24
cpu_intr_1_303:
	setx	0x3d0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb495e07f  ! 3917: ORcc_I	orcc 	%r23, 0x007f, %r26
T1_asi_reg_rd_203:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 3919: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, c)
	.word 0xbba81c20  ! 3924: FMOVRGEZ	dis not found

cpu_intr_1_304:
	setx	0x3f002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a58820  ! 3926: FADDs	fadds	%f22, %f0, %f25
	.word 0xb3a80820  ! 3927: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb9ab4820  ! 3930: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb1a58960  ! 3932: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_204:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 3934: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_1_305:
	setx	0x3f0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 3936: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbf520000  ! 3938: RDPR_PIL	<illegal instruction>
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 6)
	.word 0xb1aa0820  ! 3942: FMOVA	fmovs	%fcc1, %f0, %f24
cpu_intr_1_306:
	setx	0x3f0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a81820  ! 3946: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb6b5e09d  ! 3949: SUBCcc_I	orncc 	%r23, 0x009d, %r27
	.word 0xb9ab0820  ! 3951: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb1a81420  ! 3952: FMOVRNZ	dis not found

iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 39)
	.word 0xbb2d9000  ! 3959: SLLX_R	sllx	%r22, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_307:
	setx	0x3e0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda588e0  ! 3963: FSUBq	dis not found

T1_asi_reg_rd_205:
	mov	0xd, %r14
	.word 0xfadb89e0  ! 3964: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_wr_175:
	mov	0x12, %r14
	.word 0xf0f389e0  ! 3965: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbd35a001  ! 3967: SRL_I	srl 	%r22, 0x0001, %r30
	.word 0xb6ada115  ! 3971: ANDNcc_I	andncc 	%r22, 0x0115, %r27
cpu_intr_1_308:
	setx	0x3e022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 3975: FMOVRZ	dis not found

cpu_intr_1_309:
	setx	0x3f0133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_310:
	setx	0x3d0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a588c0  ! 3978: FSUBd	fsubd	%f22, %f0, %f58
T1_asi_reg_rd_206:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 3980: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbc0ca070  ! 3981: AND_I	and 	%r18, 0x0070, %r30
	.word 0xb92d0000  ! 3984: SLL_R	sll 	%r20, %r0, %r28
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 28)
	.word 0xb7a549c0  ! 3988: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xb9a48840  ! 3989: FADDd	faddd	%f18, %f0, %f28
cpu_intr_1_311:
	setx	0x3c0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a9c820  ! 3997: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb5a9c820  ! 3998: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_176:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 4003: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_rd_207:
	mov	0x35, %r14
	.word 0xfedb89e0  ! 4006: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_wr_177:
	mov	0x11, %r14
	.word 0xfcf38e40  ! 4009: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbba80c20  ! 4010: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbabc820  ! 4017: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbba4c9a0  ! 4019: FDIVs	fdivs	%f19, %f0, %f29
	.word 0xbfa58960  ! 4021: FMULq	dis not found

iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, a)
	.word 0xb3a549c0  ! 4025: FDIVd	fdivd	%f52, %f0, %f56
T1_asi_reg_wr_178:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 4027: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbfaa8820  ! 4028: FMOVG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_312:
	setx	0x3d0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda588a0  ! 4030: FSUBs	fsubs	%f22, %f0, %f30
	.word 0xbba00040  ! 4031: FMOVd	fmovd	%f0, %f60
	.word 0xb13df001  ! 4034: SRAX_I	srax	%r23, 0x0001, %r24
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, b)
	.word 0xb3ab8820  ! 4038: FMOVPOS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_208:
	mov	0x3c8, %r14
	.word 0xf4db89e0  ! 4039: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb3347001  ! 4042: SRLX_I	srlx	%r17, 0x0001, %r25
cpu_intr_1_313:
	setx	0x3f0010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 33)
	.word 0xbda00040  ! 4045: FMOVd	fmovd	%f0, %f30
cpu_intr_1_314:
	setx	0x3e000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_315:
	setx	0x3c0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a98820  ! 4051: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbeb52079  ! 4052: SUBCcc_I	orncc 	%r20, 0x0079, %r31
	.word 0xb9a80420  ! 4054: FMOVRZ	dis not found

	.word 0xbda00020  ! 4057: FMOVs	fmovs	%f0, %f30
	.word 0xb3a5c9e0  ! 4058: FDIVq	dis not found

T1_asi_reg_rd_209:
	mov	0x4, %r14
	.word 0xf0db8e40  ! 4059: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_316:
	setx	0x3f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 37)
	.word 0xb0bda011  ! 4068: XNORcc_I	xnorcc 	%r22, 0x0011, %r24
	.word 0xb3a5c940  ! 4070: FMULd	fmuld	%f54, %f0, %f56
T1_asi_reg_wr_179:
	mov	0x7, %r14
	.word 0xf6f384a0  ! 4071: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_317:
	setx	0x3c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_318:
	setx	0x3e0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_180:
	mov	0x1f, %r14
	.word 0xfcf389e0  ! 4075: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_wr_181:
	mov	0x8, %r14
	.word 0xf2f38e80  ! 4078: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb7a80420  ! 4079: FMOVRZ	dis not found

iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_182:
	mov	0x17, %r14
	.word 0xf8f389e0  ! 4084: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_wr_183:
	mov	0x23, %r14
	.word 0xf6f38e40  ! 4087: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_319:
	setx	0x3f0007, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_184:
	mov	0x5, %r14
	.word 0xf4f38e80  ! 4089: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb4c4e1ee  ! 4090: ADDCcc_I	addccc 	%r19, 0x01ee, %r26
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_320:
	setx	0x3d0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_321:
	setx	0x3c030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01d60f1  ! 4099: XOR_I	xor 	%r21, 0x00f1, %r24
	.word 0xb3a81420  ! 4100: FMOVRNZ	dis not found

	.word 0xbba00520  ! 4101: FSQRTs	fsqrt	
cpu_intr_1_322:
	setx	0x430203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 4105: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbba80420  ! 4108: FMOVRZ	dis not found

cpu_intr_1_323:
	setx	0x43010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 4110: FMOVVC	fmovs	%fcc1, %f0, %f27
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 25)
	.word 0xb7a80420  ! 4112: FMOVRZ	dis not found

	.word 0xbc34a036  ! 4117: SUBC_I	orn 	%r18, 0x0036, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a40920  ! 4119: FMULs	fmuls	%f16, %f0, %f26
T1_asi_reg_wr_185:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 4122: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb295e1eb  ! 4126: ORcc_I	orcc 	%r23, 0x01eb, %r25
T1_asi_reg_rd_210:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 4129: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbda00040  ! 4130: FMOVd	fmovd	%f0, %f30
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, b)
	.word 0xb1a5c940  ! 4138: FMULd	fmuld	%f54, %f0, %f24
T1_asi_reg_rd_211:
	mov	0x18, %r14
	.word 0xf4db8e60  ! 4142: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb3aac820  ! 4144: FMOVGE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_324:
	setx	0x41033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 4146: FMOVN	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_212:
	mov	0x1b, %r14
	.word 0xfadb8e60  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb844a14d  ! 4149: ADDC_I	addc 	%r18, 0x014d, %r28
	.word 0xbf50c000  ! 4151: RDPR_TT	<illegal instruction>
	.word 0xb5a4c8e0  ! 4154: FSUBq	dis not found

iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_rd_213:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 4156: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_325:
	setx	0x420306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a488a0  ! 4159: FSUBs	fsubs	%f18, %f0, %f26
	.word 0xbdab0820  ! 4160: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbcbcc000  ! 4161: XNORcc_R	xnorcc 	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_214:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 4165: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_215:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 4168: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0x8595613c  ! 4175: WRPR_TSTATE_I	wrpr	%r21, 0x013c, %tstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa448e0  ! 4179: FSUBq	dis not found

cpu_intr_1_326:
	setx	0x41011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 4182: FSQRTq	fsqrt	
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, a)
	.word 0xbda81820  ! 4191: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb7a00020  ! 4192: FMOVs	fmovs	%f0, %f27
	.word 0xb1a00520  ! 4193: FSQRTs	fsqrt	
T1_asi_reg_rd_216:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 4194: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_rd_217:
	mov	0x2f, %r14
	.word 0xfedb84a0  ! 4195: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_1_327:
	setx	0x430233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_328:
	setx	0x410201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_329:
	setx	0x410218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 4209: FMOVL	fmovs	%fcc1, %f0, %f27
cpu_intr_1_330:
	setx	0x430120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72d8000  ! 4214: SLL_R	sll 	%r22, %r0, %r27
	.word 0xb5a408e0  ! 4218: FSUBq	dis not found

	.word 0xb8a40000  ! 4221: SUBcc_R	subcc 	%r16, %r0, %r28
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_218:
	mov	0x3c2, %r14
	.word 0xf0db89e0  ! 4226: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_wr_186:
	mov	0x2a, %r14
	.word 0xf2f38e60  ! 4227: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_wr_187:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 4232: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb3a448e0  ! 4234: FSUBq	dis not found

	.word 0xb1ab4820  ! 4235: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb7a81420  ! 4236: FMOVRNZ	dis not found

iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 34)
	.word 0xb9a00520  ! 4239: FSQRTs	fsqrt	
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb9a81420  ! 4251: FMOVRNZ	dis not found

iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 28)
	.word 0xbfa94820  ! 4255: FMOVCS	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_331:
	setx	0x42011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a408e0  ! 4262: FSUBq	dis not found

	.word 0xbba84820  ! 4264: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a5c9e0  ! 4265: FDIVq	dis not found

T1_asi_reg_wr_188:
	mov	0xf, %r14
	.word 0xf2f384a0  ! 4268: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb3aac820  ! 4278: FMOVGE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_332:
	setx	0x430118, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_189:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 4282: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb0940000  ! 4283: ORcc_R	orcc 	%r16, %r0, %r24
T1_asi_reg_wr_190:
	mov	0x30, %r14
	.word 0xf8f389e0  ! 4284: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_219:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 4287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_191:
	mov	0x0, %r14
	.word 0xfef38e80  ! 4289: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb3a00520  ! 4290: FSQRTs	fsqrt	
	.word 0xb3a81c20  ! 4292: FMOVRGEZ	dis not found

cpu_intr_1_333:
	setx	0x400201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_334:
	setx	0x430028, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_192:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 4296: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb60d203a  ! 4298: AND_I	and 	%r20, 0x003a, %r27
	.word 0xb7ab0820  ! 4301: FMOVGU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_193:
	mov	0x3c2, %r14
	.word 0xf2f384a0  ! 4303: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_wr_194:
	mov	0x22, %r14
	.word 0xf8f38e60  ! 4304: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 38)
	.word 0xb3a90820  ! 4310: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb1a8c820  ! 4317: FMOVL	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_195:
	mov	0x28, %r14
	.word 0xf2f38e80  ! 4319: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1a00520  ! 4321: FSQRTs	fsqrt	
	.word 0xb7a48860  ! 4322: FADDq	dis not found

	.word 0xbba548c0  ! 4323: FSUBd	fsubd	%f52, %f0, %f60
	.word 0xbec461e0  ! 4326: ADDCcc_I	addccc 	%r17, 0x01e0, %r31
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb094218e  ! 4329: ORcc_I	orcc 	%r16, 0x018e, %r24
cpu_intr_1_335:
	setx	0x420318, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_220:
	mov	0x32, %r14
	.word 0xfcdb84a0  ! 4332: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbfa44940  ! 4335: FMULd	fmuld	%f48, %f0, %f62
T1_asi_reg_wr_196:
	mov	0x2d, %r14
	.word 0xf2f38e60  ! 4337: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbfa80420  ! 4339: FMOVRZ	dis not found

	.word 0xbfabc820  ! 4342: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb7a4c9a0  ! 4343: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb3a588e0  ! 4344: FSUBq	dis not found

	.word 0xb7a589a0  ! 4345: FDIVs	fdivs	%f22, %f0, %f27
	.word 0xb9a5c820  ! 4350: FADDs	fadds	%f23, %f0, %f28
T1_asi_reg_rd_221:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 4353: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_222:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_wr_197:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 4358: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbc8d21ec  ! 4364: ANDcc_I	andcc 	%r20, 0x01ec, %r30
	.word 0xb3a00520  ! 4365: FSQRTs	fsqrt	
cpu_intr_1_336:
	setx	0x43001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_198:
	mov	0x1a, %r14
	.word 0xf8f38e60  ! 4370: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb1a548a0  ! 4374: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xbba5c9c0  ! 4375: FDIVd	fdivd	%f54, %f0, %f60
T1_asi_reg_wr_199:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 4380: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_rd_223:
	mov	0x36, %r14
	.word 0xfcdb8e40  ! 4381: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_200:
	mov	0x38, %r14
	.word 0xf2f389e0  ! 4387: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_rd_224:
	mov	0x1f, %r14
	.word 0xfedb8e80  ! 4389: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, f)
	.word 0xba3c4000  ! 4396: XNOR_R	xnor 	%r17, %r0, %r29
T1_asi_reg_rd_225:
	mov	0x3c4, %r14
	.word 0xf6db84a0  ! 4401: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_337:
	setx	0x400337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa0820  ! 4404: FMOVA	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_226:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 4407: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1a81420  ! 4408: FMOVRNZ	dis not found

iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 30)
	.word 0xbba44960  ! 4410: FMULq	dis not found

	.word 0xb7a81420  ! 4411: FMOVRNZ	dis not found

	.word 0xbdab4820  ! 4412: FMOVCC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_338:
	setx	0x410212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_339:
	setx	0x420128, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb510000  ! 4422: RDPR_TICK	<illegal instruction>
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 19)
	.word 0xb3a00020  ! 4426: FMOVs	fmovs	%f0, %f25
	.word 0xb9a00520  ! 4429: FSQRTs	fsqrt	
	.word 0xbbab8820  ! 4431: FMOVPOS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_340:
	setx	0x400229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 4434: FMOVE	fmovs	%fcc1, %f0, %f24
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, f)
	.word 0xb0a44000  ! 4439: SUBcc_R	subcc 	%r17, %r0, %r24
	.word 0xb7a8c820  ! 4442: FMOVL	fmovs	%fcc1, %f0, %f27
cpu_intr_1_341:
	setx	0x410016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a44860  ! 4446: FADDq	dis not found

iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfa8c820  ! 4452: FMOVL	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_227:
	mov	0x12, %r14
	.word 0xfedb89e0  ! 4453: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb7aac820  ! 4455: FMOVGE	fmovs	%fcc1, %f0, %f27
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, c)
	.word 0xb7a588c0  ! 4457: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xbe1d0000  ! 4458: XOR_R	xor 	%r20, %r0, %r31
cpu_intr_1_342:
	setx	0x43010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_343:
	setx	0x40002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c8a0  ! 4467: FSUBs	fsubs	%f23, %f0, %f29
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 1b)
	.word 0xa1902001  ! 4469: WRPR_GL_I	wrpr	%r0, 0x0001, %-
T1_asi_reg_wr_201:
	mov	0x3c5, %r14
	.word 0xf2f384a0  ! 4473: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb4a48000  ! 4475: SUBcc_R	subcc 	%r18, %r0, %r26
T1_asi_reg_rd_228:
	mov	0x3c0, %r14
	.word 0xfadb8400  ! 4479: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbd358000  ! 4482: SRL_R	srl 	%r22, %r0, %r30
	.word 0xbda4c9c0  ! 4483: FDIVd	fdivd	%f50, %f0, %f30
T1_asi_reg_rd_229:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 4485: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb5a9c820  ! 4487: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbda58960  ! 4489: FMULq	dis not found

cpu_intr_1_344:
	setx	0x410338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3643801  ! 4492: MOVcc_I	<illegal instruction>
T1_asi_reg_wr_202:
	mov	0x7, %r14
	.word 0xfaf38e40  ! 4494: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbba80c20  ! 4496: FMOVRLZ	dis not found

	.word 0xb7a4c9c0  ! 4498: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xbe8c8000  ! 4501: ANDcc_R	andcc 	%r18, %r0, %r31
	.word 0xb3a509e0  ! 4504: FDIVq	dis not found

cpu_intr_1_345:
	setx	0x400031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a84820  ! 4506: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbba88820  ! 4507: FMOVLE	fmovs	%fcc1, %f0, %f29
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 33)
	.word 0xbdab0820  ! 4510: FMOVGU	fmovs	%fcc1, %f0, %f30
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_203:
	mov	0x3c1, %r14
	.word 0xf8f389e0  ! 4514: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbf3c3001  ! 4515: SRAX_I	srax	%r16, 0x0001, %r31
	.word 0xb5a00520  ! 4516: FSQRTs	fsqrt	
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_230:
	mov	0x17, %r14
	.word 0xf2db84a0  ! 4518: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_346:
	setx	0x420131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_347:
	setx	0x420030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aac820  ! 4523: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb0344000  ! 4527: SUBC_R	orn 	%r17, %r0, %r24
	.word 0xbfa00540  ! 4528: FSQRTd	fsqrt	
	.word 0xb9a94820  ! 4529: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb5a80420  ! 4533: FMOVRZ	dis not found

cpu_intr_1_348:
	setx	0x41010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 4535: FSQRTd	fsqrt	
T1_asi_reg_wr_204:
	mov	0x2a, %r14
	.word 0xfcf38400  ! 4536: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_349:
	setx	0x410213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_350:
	setx	0x430035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a408e0  ! 4543: FSUBq	dis not found

	.word 0xb1abc820  ! 4544: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb3a9c820  ! 4547: FMOVVS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_205:
	mov	0x37, %r14
	.word 0xfaf384a0  ! 4549: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb2c44000  ! 4550: ADDCcc_R	addccc 	%r17, %r0, %r25
	.word 0xbcacc000  ! 4551: ANDNcc_R	andncc 	%r19, %r0, %r30
	.word 0xb9a40920  ! 4552: FMULs	fmuls	%f16, %f0, %f28
	.word 0xbba54820  ! 4554: FADDs	fadds	%f21, %f0, %f29
T1_asi_reg_wr_206:
	mov	0x1, %r14
	.word 0xf4f38e40  ! 4556: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_351:
	setx	0x440015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 4563: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbda9c820  ! 4569: FMOVVS	fmovs	%fcc1, %f0, %f30
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_352:
	setx	0x46033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa4820  ! 4573: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbda81420  ! 4578: FMOVRNZ	dis not found

T1_asi_reg_wr_207:
	mov	0x32, %r14
	.word 0xf2f389e0  ! 4579: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_353:
	setx	0x46010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda509c0  ! 4593: FDIVd	fdivd	%f20, %f0, %f30
T1_asi_reg_wr_208:
	mov	0x20, %r14
	.word 0xfef38400  ! 4596: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_354:
	setx	0x450225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_355:
	setx	0x440035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_356:
	setx	0x460325, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_231:
	mov	0x1e, %r14
	.word 0xfadb8e60  ! 4605: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb3a94820  ! 4608: FMOVCS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_209:
	mov	0x3c4, %r14
	.word 0xf2f38400  ! 4614: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb7a44920  ! 4615: FMULs	fmuls	%f17, %f0, %f27
cpu_intr_1_357:
	setx	0x45023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_210:
	mov	0x1, %r14
	.word 0xfef38e40  ! 4618: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3a88820  ! 4619: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_211:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 4622: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_358:
	setx	0x45023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_359:
	setx	0x470221, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_232:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 4627: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_360:
	setx	0x47012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a488c0  ! 4630: FSUBd	fsubd	%f18, %f0, %f24
	.word 0xb77de401  ! 4632: MOVR_I	movre	%r23, 0x1, %r27
	.word 0xb9a4c9e0  ! 4633: FDIVq	dis not found

cpu_intr_1_361:
	setx	0x470214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 28)
	.word 0xb3a5c8e0  ! 4638: FSUBq	dis not found

T1_asi_reg_wr_212:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 4642: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfa94820  ! 4645: FMOVCS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_362:
	setx	0x440038, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_233:
	mov	0x7, %r14
	.word 0xf2db8e60  ! 4648: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 7)
	.word 0xbba488a0  ! 4657: FSUBs	fsubs	%f18, %f0, %f29
T1_asi_reg_wr_213:
	mov	0x2c, %r14
	.word 0xf4f38e60  ! 4659: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 11)
	.word 0xb9a94820  ! 4672: FMOVCS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_214:
	mov	0x2c, %r14
	.word 0xf2f38e60  ! 4675: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbd340000  ! 4676: SRL_R	srl 	%r16, %r0, %r30
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_363:
	setx	0x44030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 4679: FMOVVC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_364:
	setx	0x47013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_365:
	setx	0x470037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_215:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 4696: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_234:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 4697: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb1a408e0  ! 4699: FSUBq	dis not found

cpu_intr_1_366:
	setx	0x470002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_235:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 4705: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_1_367:
	setx	0x44002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 4708: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb13db001  ! 4709: SRAX_I	srax	%r22, 0x0001, %r24
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 35)
	.word 0xbab40000  ! 4711: ORNcc_R	orncc 	%r16, %r0, %r29
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 33)
	.word 0xb5aa8820  ! 4714: FMOVG	fmovs	%fcc1, %f0, %f26
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_216:
	mov	0x26, %r14
	.word 0xf2f38e80  ! 4719: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb43d20a7  ! 4720: XNOR_I	xnor 	%r20, 0x00a7, %r26
	.word 0xb3480000  ! 4721: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
T1_asi_reg_rd_236:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 4722: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb1a54960  ! 4723: FMULq	dis not found

cpu_intr_1_368:
	setx	0x44020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a448c0  ! 4727: FSUBd	fsubd	%f48, %f0, %f24
	.word 0xb9a58840  ! 4728: FADDd	faddd	%f22, %f0, %f28
	.word 0xba24e04e  ! 4729: SUB_I	sub 	%r19, 0x004e, %r29
	.word 0xb1ab0820  ! 4731: FMOVGU	fmovs	%fcc1, %f0, %f24
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_369:
	setx	0x450222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_370:
	setx	0x300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc958000  ! 4737: ORcc_R	orcc 	%r22, %r0, %r30
	.word 0xb3a80820  ! 4740: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, f)
	.word 0xb7aac820  ! 4749: FMOVGE	fmovs	%fcc1, %f0, %f27
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 19)
	.word 0xbf35a001  ! 4753: SRL_I	srl 	%r22, 0x0001, %r31
	.word 0xb1a80820  ! 4756: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
cpu_intr_1_371:
	setx	0x460009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda9c820  ! 4761: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb5abc820  ! 4763: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbba408a0  ! 4764: FSUBs	fsubs	%f16, %f0, %f29
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, d)
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, c)
	.word 0xbfaa8820  ! 4775: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbc0dc000  ! 4778: AND_R	and 	%r23, %r0, %r30
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9358000  ! 4784: SRL_R	srl 	%r22, %r0, %r28
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbe1c61fc  ! 4790: XOR_I	xor 	%r17, 0x01fc, %r31
	.word 0xb3540000  ! 4792: RDPR_GL	<illegal instruction>
T1_asi_reg_wr_217:
	mov	0x3c7, %r14
	.word 0xf2f384a0  ! 4793: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 1d)
	lda	[%r23 + %g0] 0xf0, %f2
cpu_intr_1_372:
	setx	0x46000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1abc820  ! 4799: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbba88820  ! 4800: FMOVLE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_373:
	setx	0x45023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13cf001  ! 4802: SRAX_I	srax	%r19, 0x0001, %r24
T1_asi_reg_rd_237:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T1_asi_reg_rd_238:
	mov	0xf, %r14
	.word 0xf4db89e0  ! 4807: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbfab0820  ! 4808: FMOVGU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_374:
	setx	0x440032, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_239:
	mov	0x28, %r14
	.word 0xf2db8e40  ! 4811: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5a58920  ! 4815: FMULs	fmuls	%f22, %f0, %f26
T1_asi_reg_wr_218:
	mov	0x26, %r14
	.word 0xfef38e80  ! 4820: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 36)
	.word 0xb7a00020  ! 4823: FMOVs	fmovs	%f0, %f27
	.word 0xa1902000  ! 4824: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xb3a489a0  ! 4826: FDIVs	fdivs	%f18, %f0, %f25
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_375:
	setx	0x440037, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7aa8820  ! 4833: FMOVG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_219:
	mov	0x1d, %r14
	.word 0xf0f38e40  ! 4836: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7aa0820  ! 4842: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb1a5c9c0  ! 4843: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xbfa4c960  ! 4846: FMULq	dis not found

	.word 0xb7a00520  ! 4848: FSQRTs	fsqrt	
	.word 0xbda88820  ! 4850: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbdaa8820  ! 4853: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb5a4c8c0  ! 4858: FSUBd	fsubd	%f50, %f0, %f26
T1_asi_reg_rd_240:
	mov	0x3c6, %r14
	.word 0xf4db8e80  ! 4860: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_376:
	setx	0x440125, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_241:
	mov	0x35, %r14
	.word 0xf6db8e40  ! 4866: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_377:
	setx	0x460316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_378:
	setx	0x440109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80c20  ! 4873: FMOVRLZ	dis not found

	.word 0xb1a00020  ! 4874: FMOVs	fmovs	%f0, %f24
T1_asi_reg_wr_220:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 4875: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_242:
	mov	0x14, %r14
	.word 0xfcdb8e80  ! 4877: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb9a00020  ! 4878: FMOVs	fmovs	%f0, %f28
	.word 0xb7a88820  ! 4881: FMOVLE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_379:
	setx	0x47021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 4887: FMOVRZ	dis not found

	.word 0xb6c48000  ! 4888: ADDCcc_R	addccc 	%r18, %r0, %r27
	.word 0xb1ab4820  ! 4889: FMOVCC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_380:
	setx	0x440313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 4893: FSQRTq	fsqrt	
cpu_intr_1_381:
	setx	0x44011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3ce001  ! 4895: SRA_I	sra 	%r19, 0x0001, %r29
	.word 0xbba48940  ! 4896: FMULd	fmuld	%f18, %f0, %f60
iob_intr_1_396:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_396), 16, 16)) -> intp(1, 0, 6)
	.word 0xbba00520  ! 4901: FSQRTs	fsqrt	
	.word 0xbda54920  ! 4904: FMULs	fmuls	%f21, %f0, %f30
iob_intr_1_397:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_397), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_221:
	mov	0x3c0, %r14
	.word 0xfef38e80  ! 4915: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb0bd2069  ! 4916: XNORcc_I	xnorcc 	%r20, 0x0069, %r24
	.word 0xbc1c4000  ! 4917: XOR_R	xor 	%r17, %r0, %r30
T1_asi_reg_wr_222:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 4919: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_398:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_398), 16, 16)) -> intp(1, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_243:
	mov	0xf, %r14
	.word 0xf0db8e40  ! 4926: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_399:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_399), 16, 16)) -> intp(1, 0, 4)
	.word 0xb225c000  ! 4928: SUB_R	sub 	%r23, %r0, %r25
	.word 0xb5a90820  ! 4929: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb5a9c820  ! 4930: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_400:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_400), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_382:
	setx	0x450220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81420  ! 4939: FMOVRNZ	dis not found

	.word 0xb5a4c8c0  ! 4942: FSUBd	fsubd	%f50, %f0, %f26
cpu_intr_1_383:
	setx	0x44021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_244:
	mov	0x12, %r14
	.word 0xfedb89e0  ! 4944: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_245:
	mov	0x22, %r14
	.word 0xfcdb8e60  ! 4945: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_401:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_401), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_384:
	setx	0x45010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41c0000  ! 4948: XOR_R	xor 	%r16, %r0, %r26
cpu_intr_1_385:
	setx	0x45010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 4956: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a48860  ! 4958: FADDq	dis not found

iob_intr_1_402:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_402), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_246:
	mov	0x12, %r14
	.word 0xfcdb8e60  ! 4962: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbba81420  ! 4964: FMOVRNZ	dis not found

	.word 0xb1a81420  ! 4965: FMOVRNZ	dis not found

	.word 0xbfa8c820  ! 4966: FMOVL	fmovs	%fcc1, %f0, %f31
iob_intr_1_403:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_403), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_386:
	setx	0x440111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_387:
	setx	0x460012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 4975: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb7a588e0  ! 4980: FSUBq	dis not found

T1_asi_reg_wr_223:
	mov	0xb, %r14
	.word 0xf4f38e80  ! 4982: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb7a4c8c0  ! 4987: FSUBd	fsubd	%f50, %f0, %f58
T1_asi_reg_wr_224:
	mov	0x28, %r14
	.word 0xfaf38400  ! 4989: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_388:
	setx	0x470039, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_247:
	mov	0x25, %r14
	.word 0xf0db8e60  ! 4992: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_1_404:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_404), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_248:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 4996: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_rd_249:
	mov	0x1e, %r14
	.word 0xf6db8e40  ! 4997: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_405:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_405), 16, 16)) -> intp(1, 0, 37)

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

	.xword	0x6683ffb040af19b8
	.xword	0x37beb9e466130cf6
	.xword	0xe386be71c2e053b6
	.xword	0x8ed6e302e66033a6
	.xword	0xd59b4dc7f11fac2e
	.xword	0x7ec4a9230ef52fcb
	.xword	0xe7faf1c945af5ae0
	.xword	0x081bb272afda9928
	.xword	0x0dad3118f3482a85
	.xword	0xbe90ba31afcbd23a
	.xword	0x48d1e21deeb352eb
	.xword	0x7a471f196e5db5e0
	.xword	0xc6c169e6d97db536
	.xword	0x6e7a58965816706f
	.xword	0x497acac0433e2341
	.xword	0xa3a26d691323491b
	.xword	0xf27d20a167142855
	.xword	0x623bd2fca971e6aa
	.xword	0x379e2454f4f3163a
	.xword	0x4f43399050723d20
	.xword	0xf683c6a56d3458b4
	.xword	0xe6d05dc46b0264e0
	.xword	0x360995601f31614d
	.xword	0xd878f5b12f719733
	.xword	0xd464a109e289c2e6
	.xword	0x9e27da2d063a0bf7
	.xword	0x6e487e3eae1269fd
	.xword	0xd00c75fa188d3204
	.xword	0xf9b2f8f45c51fe61
	.xword	0x8efc611b81a20d1a
	.xword	0xacf614832fa4429b
	.xword	0x8b2b82cd1b3b3566
	.xword	0x454e28b5bbbd2fc8
	.xword	0xb1cde8d9d7d099c3
	.xword	0x77a33611d6caf0a0
	.xword	0xb3fda5fbda429da6
	.xword	0x4994c0bd51cc1e49
	.xword	0x5ab56da23e6ef132
	.xword	0xf5679d770b5a65d7
	.xword	0x4404c3ff62eb922a
	.xword	0xaec9959470955f0e
	.xword	0x9fdaac929ff26b39
	.xword	0x99730125e7c75bab
	.xword	0xc508ad8aa1c1c14e
	.xword	0xfc3012151249fe71
	.xword	0x9c4720e152050387
	.xword	0x5a1efce568b5b7c3
	.xword	0x4118e4773ce88284
	.xword	0x9d41e79a73da9944
	.xword	0x7135fea7799ba2bf
	.xword	0x0b328b27d3cc099d
	.xword	0xe8b3dbb555bb68c6
	.xword	0x2b5f619cf6a2103e
	.xword	0x1db1e3412c3d0204
	.xword	0x41df481796e3346e
	.xword	0x3c50e703d27ba59d
	.xword	0x581d2af9e091a2e2
	.xword	0x42134a8ef5888432
	.xword	0x23be111055b36329
	.xword	0xa3b4ff7c3805e1a2
	.xword	0xf24dcc7f16fe77bb
	.xword	0xd0da0be12bad515e
	.xword	0x07f1a0534a927864
	.xword	0x49b47f1e5ed8e328
	.xword	0x27a5aa49c7c4f5fe
	.xword	0x3c738e77c3ad4eeb
	.xword	0xf77b191c973b9ab5
	.xword	0x31fd37e5ff6da314
	.xword	0x126cd1073c1d1e1c
	.xword	0xb0e56596742ef3ea
	.xword	0x8740f3bfa6729928
	.xword	0x44c55e76de718ff1
	.xword	0x8bd532185a4bd0b6
	.xword	0x94d367d51e70ba37
	.xword	0x35c45436d079212d
	.xword	0x1aad1b29e5043e3a
	.xword	0xd21496668d7c8b9f
	.xword	0x6c636f8985ab895c
	.xword	0x8f40e4be61164d68
	.xword	0xd378012ba874beef
	.xword	0x75738fa830dc2c56
	.xword	0x21407f98dba33d87
	.xword	0xbab5b07b0ef6961c
	.xword	0x7beb07255a771909
	.xword	0xae5cb11e0a83d963
	.xword	0x4fa6ec50aaa19a4d
	.xword	0xc3e0a63af3803ada
	.xword	0xaa1ed8a6cddcbe14
	.xword	0x25c0b143045a2773
	.xword	0xe43c8a905d1126c7
	.xword	0x3dc813471323de2e
	.xword	0xa12b858d4086511a
	.xword	0x2eecb58962740909
	.xword	0x325375e2d6318d56
	.xword	0x4ff12e6db8fe4b92
	.xword	0x0b2172b42e89d7e8
	.xword	0xba8ec1425f9ec855
	.xword	0x7a9d4c485cfc0904
	.xword	0x65257dde3199b064
	.xword	0xf9692da251bb6361
	.xword	0x53803eca9a06720f
	.xword	0xbf11c6036eb10f6a
	.xword	0xd31b5a32b55cb0e9
	.xword	0xbc9c4f69f98fb64f
	.xword	0x1793c69fe08022a0
	.xword	0xd5334315f1cf46bc
	.xword	0x5a98c222c90a3763
	.xword	0x6482d4c930b77d6f
	.xword	0xc5c09b46469be7d4
	.xword	0x96f945f74a778385
	.xword	0x5b27b28b7f468cbc
	.xword	0x0c9ee04d6248d944
	.xword	0x44664a4e841fd5f3
	.xword	0x5d31ea2f2e17bc1a
	.xword	0xc9011cdf1efe5f64
	.xword	0xea609d08a657cb24
	.xword	0x8b6c07aaeb0f8776
	.xword	0xb794920a78a41f3c
	.xword	0xdb7b3f20017a7819
	.xword	0x2c7859daa4354c4f
	.xword	0xe489da47fc7726f5
	.xword	0x214b57704ddd2141
	.xword	0x1ece46eaca7b617b
	.xword	0x63c7b8eebf928a7d
	.xword	0x35e15d2854880dc5
	.xword	0x0013fd0b2cd9c2be
	.xword	0xd586cc2dcc6044b2
	.xword	0x29e816a646687348
	.xword	0x3b502f7e1b8fa333
	.xword	0xebca28bc13c4078d
	.xword	0x5d5a325003f5a684
	.xword	0x4830b78164d897cb
	.xword	0xc357f27363d3a7a9
	.xword	0x8585a419a49d3a5d
	.xword	0x0a12688f74bdbad7
	.xword	0x6897f5c135060b33
	.xword	0xc49a06a5d9c37eb8
	.xword	0x0625243e2c1b4c6d
	.xword	0xb67bdcf309feec19
	.xword	0x11b5e827238e7b75
	.xword	0xee23df0edefcbe22
	.xword	0xb80881d85b95082e
	.xword	0x07fe54f7611b48e5
	.xword	0xdb9049b8799f5a40
	.xword	0x535c2e5a2e50c90b
	.xword	0x92fe2d341a0f216e
	.xword	0x0d37c7d61c3949a3
	.xword	0x165026642fb7be7d
	.xword	0x3704205084fd46c6
	.xword	0x26229a37282a494a
	.xword	0x34ea4befff833490
	.xword	0xe335cc9314f02cbe
	.xword	0x7a483ed7b23ab8fb
	.xword	0xe3a133348af600e2
	.xword	0xd5dfea37fd059a8e
	.xword	0xba3fd8a73228d119
	.xword	0x0d5d3ab2f0b35adb
	.xword	0x07c53ad1278d4e3f
	.xword	0x3723c6f7c12f55ca
	.xword	0x21a782c4b85b010d
	.xword	0xdcfaea04951a5c9b
	.xword	0x65e92175afe2ae87
	.xword	0xa8af91d49517c24a
	.xword	0xd9bdda5973f263b3
	.xword	0x96f3d2245a2e622c
	.xword	0x664629ee450d2dd5
	.xword	0xa17f26e1275e4245
	.xword	0xe0dfbcb54f748d28
	.xword	0x880c6f7c73181bcc
	.xword	0x8c43e29384d5f3fd
	.xword	0x61abf804f57711cb
	.xword	0x5570e2457e55ad40
	.xword	0xa1130a0879308470
	.xword	0x1872f54fc4b31cd6
	.xword	0xa266e16d6da71220
	.xword	0xe69bd6d4efd6fe00
	.xword	0xb6598a9bb351a5c3
	.xword	0x5f7e28b10e2fc9ef
	.xword	0xfbeb08c099d4a2cc
	.xword	0x9e5ac0886b5fa819
	.xword	0x7746300a62f65afc
	.xword	0x442266f3acbbfa4d
	.xword	0x7df25f7df2ae21a0
	.xword	0x8b2018436a01349c
	.xword	0x0e08729171a2751b
	.xword	0x9587b6ca558d2570
	.xword	0x2c0033f9760c4e35
	.xword	0xbba6fd1839f93e1c
	.xword	0x125bd9a862f1c838
	.xword	0x416aedb91dc2340a
	.xword	0x1c506a60a1833a71
	.xword	0x134a5f4665cdc619
	.xword	0x9e332bacb882c7de
	.xword	0xfd3ecae2a8650afc
	.xword	0x01a57ca7a99e73fe
	.xword	0x487fd78379be0e1f
	.xword	0xd915df408ccbc002
	.xword	0xd8391037e72cf3b3
	.xword	0xae989c4189357dc6
	.xword	0x8834574a75f30163
	.xword	0x4b2ec2217093c193
	.xword	0xb519acddbbb0d15a
	.xword	0x53b95b8e942d743a
	.xword	0xce8ed3626971d96a
	.xword	0xf64ceaf850a88fd8
	.xword	0x76e31c274ca3bbf5
	.xword	0xfb1ba536f5a6338f
	.xword	0xb238e27583809ec4
	.xword	0x24e16a296182785f
	.xword	0x320ebdb855e81630
	.xword	0x4146db0e071e7bfc
	.xword	0x8e226316c9a6c53a
	.xword	0x83a2c08b390d0ab3
	.xword	0xa57573a898e90f60
	.xword	0xca2f097a89541467
	.xword	0x6d66f59f42e655b4
	.xword	0x91d27290a563b014
	.xword	0x37aebd3a111fdba1
	.xword	0xc83deb26e223501d
	.xword	0x4f79885754010df1
	.xword	0xcb8eda69d1b95bad
	.xword	0x0d873fd61c871fc6
	.xword	0x1b0fdcaa5961192a
	.xword	0x0d1312ffd19fefc1
	.xword	0xb7259677906ae699
	.xword	0x7cb76e60291fa5de
	.xword	0x5003ceb5479348dc
	.xword	0xd0e2a3566d458eb9
	.xword	0x40df424a31d2e5e1
	.xword	0x51eeb19ba1576ce5
	.xword	0xdd89a4200e4e32c6
	.xword	0x9419d23c668ef9d2
	.xword	0x4df2d17d36eee503
	.xword	0x375300300ea0fee6
	.xword	0x69ca077207214929
	.xword	0x5d484f01ca1f2414
	.xword	0x25cf6528d7cd7901
	.xword	0x3ad177b895fa4021
	.xword	0x11d027a1214d4f23
	.xword	0xb3e255aba34eab53
	.xword	0xadb342ebc5453997
	.xword	0x290c0d50d8ea9cf6
	.xword	0x6689b63fff4f5c6f
	.xword	0xd8451b6562534ad2
	.xword	0x669e64d6b49320bc
	.xword	0x2c35abc6f13890d8
	.xword	0x722cf6ef7a72747d
	.xword	0x8b9e5079c0209797
	.xword	0x1fcadf19ba4be761
	.xword	0x91205192bc4433a6
	.xword	0x334ff8f8da7e724b
	.xword	0xb000590f39712bda
	.xword	0xec3ff0020d6163ac
	.xword	0x1ecc954d8ecd2303
	.xword	0xc321a074ed35a8d9
	.xword	0xd8b3f166cacdf6ce
	.align 0x2000
	.data
data_start_1:

	.xword	0x6b34f65c96552885
	.xword	0x26b599827bb1e540
	.xword	0x2285cfbb8886ad2e
	.xword	0xaccc11228e0655de
	.xword	0xff50fd43f7533e85
	.xword	0xd27d1764b2348b97
	.xword	0xe1ac96d8bc220df3
	.xword	0x702ad8f24d152f72
	.xword	0xb40e9f3d6c2bdf7e
	.xword	0x2e0a995993109f99
	.xword	0x827165dd00857eca
	.xword	0xe3db8df0f69cf317
	.xword	0xb8d4d268e178efc0
	.xword	0x12b2e8190d0e03d4
	.xword	0x4139e5f0dce2b413
	.xword	0x01f93575ca164a8f
	.xword	0x67bffc8f243ee3cb
	.xword	0x1e42a0b472780e21
	.xword	0x4ade7f450c871eb9
	.xword	0x6226b60b5d34cb3e
	.xword	0xe18999167457b716
	.xword	0x0cc742b6037b8663
	.xword	0x69dc5ace97448b2f
	.xword	0xaaa6e6167a9bd711
	.xword	0x11dd3076ebdc3b0b
	.xword	0x40c55b9707789c90
	.xword	0x8046a97a81700818
	.xword	0x10dd96faceee8050
	.xword	0xd491a5e45d9c348c
	.xword	0xf9ee355305d51eeb
	.xword	0x56f535d254def2ca
	.xword	0x301c1dce9b2cb3df
	.xword	0x82cc6b5019a577fa
	.xword	0xf22bf92c183747b8
	.xword	0xf6f761ce776c8950
	.xword	0x91745a1af0e46eae
	.xword	0xd600b26e563b91e8
	.xword	0x81f46cc4ac1012f0
	.xword	0x763b894daebf47b8
	.xword	0x0ae452772976f274
	.xword	0xb913c38bc00e88a3
	.xword	0xea6a931fad407ce6
	.xword	0x76d2572edcc54046
	.xword	0x58dbb0b0f822f9c4
	.xword	0x3860d37d695e86ff
	.xword	0x76332e83e4854a86
	.xword	0xe7fc944cdf0ba5be
	.xword	0x1f0949b01bd4c405
	.xword	0x6ff2b9c53b03517a
	.xword	0xe301db2c5e885aee
	.xword	0x3ccf5581b9d709f3
	.xword	0x06084c5299ce6b74
	.xword	0x90eca4309e053cb0
	.xword	0xfde4e6dfbefaf2c6
	.xword	0x4baf38db899a38fa
	.xword	0xbec17c1dbdb5a391
	.xword	0x41d15b6dedc5fab4
	.xword	0xb9e1ca35abae8448
	.xword	0xd751ebb13cdf3760
	.xword	0xd61e33011ac926ad
	.xword	0xc1c362388d20832f
	.xword	0x75f914a569bf8862
	.xword	0xf9307cb79b3636c9
	.xword	0xc83043490fc46f9b
	.xword	0x5f6b1aba01ca0e6c
	.xword	0xbf1cf9ed58d45658
	.xword	0xba9845fd74af436f
	.xword	0x3206e78539893c5b
	.xword	0xa6ef00b0eeedf898
	.xword	0x5bba788a547434d7
	.xword	0x03a1d20b8685af47
	.xword	0x0d82fd71ede9cdf6
	.xword	0x022eefd36a8851b6
	.xword	0x74ea1c3885bfbad6
	.xword	0x610aa5d0cfcb3cfd
	.xword	0x805785f2786ca68b
	.xword	0x731cada5e04049ed
	.xword	0x1c64c7c618c855f0
	.xword	0x20e64c9de7bd4f84
	.xword	0xe7c64209499bc59c
	.xword	0xc27ead64ced3b0d7
	.xword	0x2321b1247112def5
	.xword	0x4da6f2f57af8b268
	.xword	0x7493ef7f8102c706
	.xword	0xf78157afd48c629e
	.xword	0xab91496f3763c096
	.xword	0x15218a93efca9477
	.xword	0xd0b0e085338e6b7a
	.xword	0x29a88fd1fc07b098
	.xword	0xd0a7eb014762ddf5
	.xword	0x495634c8d9d4956c
	.xword	0x2579efcad8826b4a
	.xword	0x28f32beeb898de74
	.xword	0x361a718b91885b8f
	.xword	0xca8841b6ff003ea0
	.xword	0x23e782ca185f6265
	.xword	0x5642d2a0c1ea5618
	.xword	0x57111b06f2513a66
	.xword	0x584150add3d020a6
	.xword	0xdf555b8c4fb4f7f6
	.xword	0xda539b07467467fd
	.xword	0x93a446e100784582
	.xword	0x1cefc69e80462bc1
	.xword	0x463173f98e2c7cab
	.xword	0xcb9f782dd396f8fd
	.xword	0xf7afeb30d7d9db67
	.xword	0xabe2ab888d37fd49
	.xword	0xb69b6bf450cc4505
	.xword	0x81393517b5c5150b
	.xword	0xdf10233c37a54e82
	.xword	0xacb626e6c7917c44
	.xword	0x7f072785353ead46
	.xword	0xd9397392cd3d5c1a
	.xword	0xc75e5dea6f05ffce
	.xword	0x4a87cda6dc244f27
	.xword	0xd6b99449612ddd33
	.xword	0x67b54802ce518453
	.xword	0xe27e6d6a5aa83c84
	.xword	0x570fb63c2e6a14bc
	.xword	0x71a25ebe58e09a9c
	.xword	0x5afbdc32095f7ea1
	.xword	0xf792ec0dae313b1e
	.xword	0x53dd75ea97ea7cff
	.xword	0x9ebbc0039c88e91d
	.xword	0x838ddd3560f722b7
	.xword	0x77ff187c25e32232
	.xword	0xbd1816631e05c383
	.xword	0x54bba606523a4264
	.xword	0x57840837aa387a55
	.xword	0xfb4b8f948f8892a7
	.xword	0xb765a0c306bdc804
	.xword	0xd0bab24e1d63f2de
	.xword	0xafb5a5e8c44916b1
	.xword	0x3dfe1fe3d9c5293f
	.xword	0x33c9f06781e22173
	.xword	0x9d83fcd3a4c9327b
	.xword	0xc5c649722c3e66be
	.xword	0xd4f25c72431be9bc
	.xword	0x95736313a4e7c8e5
	.xword	0x6b6067114d9bb9e3
	.xword	0x7be8f57e1b0955de
	.xword	0x8a9e2b14a0d8b044
	.xword	0x3a6acd3434f29d86
	.xword	0x49fd515d3f4e3dbc
	.xword	0x6cdcf0d4fd418bfd
	.xword	0x676279569ad5a306
	.xword	0x709bdb96be876363
	.xword	0xd30d81e4a76428e5
	.xword	0x51484969b3bd0bc4
	.xword	0xe4ef4496e8c4d04c
	.xword	0xb8b0d9ecb4d2b3ce
	.xword	0x0cdf4f7f48cd9794
	.xword	0x8f26e9ed5c065ad6
	.xword	0x80a3bc05c6ab9bab
	.xword	0xd5730b512bc63e86
	.xword	0x84727614b44027bc
	.xword	0xa91cd7c2a5318e77
	.xword	0xd2f7ccb22db3a893
	.xword	0x17d2de6ae29c6311
	.xword	0xdb46ba5c87cd40b9
	.xword	0x1ec849703fa53abd
	.xword	0x4a27f7bb8df0ada2
	.xword	0xe238538ed896d0a8
	.xword	0xcb8dd977eb082777
	.xword	0x200b881a977c65af
	.xword	0x8cdf09c8f810f367
	.xword	0xdc2524ad8d342b2a
	.xword	0xee7d91ce657b2a9e
	.xword	0x1edb8c4b8dbf91ef
	.xword	0x1dfbee65763d8eb2
	.xword	0xfe1bafcd0c6d4e77
	.xword	0x5428b4cb7e01dd40
	.xword	0x7631f858f95d1877
	.xword	0x45e3b7785bfb9b96
	.xword	0xe3d8b0daaabbb946
	.xword	0x277d1ea1d4dc38ff
	.xword	0xd42e6c5e7d44349a
	.xword	0x2f6d336b3a957d3f
	.xword	0xed762a65be94833a
	.xword	0x5d96916c90f69efb
	.xword	0x4a0f8df00dcb3dc6
	.xword	0xd11415b688de47e2
	.xword	0xa463f65d95f4161c
	.xword	0xcc70d8e3323c3594
	.xword	0xef5bc07ed3f2948e
	.xword	0x5afad4f4963a4c5d
	.xword	0x453c7da150a1139e
	.xword	0x944c659671f04155
	.xword	0x55b209cf00bc4860
	.xword	0x7fdca6789b375842
	.xword	0xc1ea65bb033f38f4
	.xword	0xefcf8937e922e81d
	.xword	0x3256ffb15646586a
	.xword	0x7bcbe0c632e7b590
	.xword	0x26a25001df5ac445
	.xword	0xa9389afe51ee8c20
	.xword	0xcebfb44052ac6778
	.xword	0x61450b0b7b0103fe
	.xword	0x77a05a889f736611
	.xword	0xa62e0f9476e9cf33
	.xword	0x48bc0d024c8b5e54
	.xword	0x8f0c2e16f51fd328
	.xword	0x267836ce6334d29e
	.xword	0x323b06dc22a1f9e7
	.xword	0x14eac383553a8cd3
	.xword	0x75eabe8cd9517f04
	.xword	0x0897f13bdb9c30c8
	.xword	0xeefe975dda37e1a4
	.xword	0xe01d6783f576952e
	.xword	0x305c44061ce7b086
	.xword	0x4df063863e234ea8
	.xword	0x8ea36cc80dfcf6f7
	.xword	0x8ea87811f6a3bca6
	.xword	0xc19ee0f368cb25d9
	.xword	0xf69e8f19fa773bc6
	.xword	0xebf4cb8e2eb30a31
	.xword	0xa36986bbb5959c84
	.xword	0x4a828c0bfbc14705
	.xword	0x16b09a33549945ee
	.xword	0xffdda59a84331855
	.xword	0xb12a00a61413e32b
	.xword	0x721c33348d048a63
	.xword	0x2513fd068a57b345
	.xword	0x4b20df24559c4bb8
	.xword	0xb4654281f5fe3559
	.xword	0xf7b1f3fb69347d10
	.xword	0x2d8cdf61ee7bb00e
	.xword	0xebad115fb52b7838
	.xword	0x304193da5eeb5fe3
	.xword	0xfc75936f97b534a3
	.xword	0x2432e27f09ff0e34
	.xword	0xfb56e11154f0e96d
	.xword	0xa142d96c727fd7e0
	.xword	0xb19c0e088f8314c4
	.xword	0x33150309559c2602
	.xword	0x5bcde5b5993437f8
	.xword	0x9663cebf7706e086
	.xword	0x1fbe09c86d06253c
	.xword	0x82d2020886f32d77
	.xword	0x4d2a60e6d79a4cc1
	.xword	0xe6fb0618d81c6b4c
	.xword	0xacae0f8614186c06
	.xword	0xc2253616d9a028bc
	.xword	0x83587f77bb9b9f1f
	.xword	0xb6ea74eab006083c
	.xword	0x47228adbd44c0a90
	.xword	0x018f50e13e34928a
	.xword	0x0013f59a2075b105
	.xword	0x0d0e1e90979d2510
	.xword	0xa54c5480125c7a42
	.xword	0x6072db8024980573
	.xword	0x29f1c835f175ce72
	.xword	0x631a53fcf05029d7
	.xword	0x8e2e3858e48788ae
	.xword	0x63c7644fff566ec3
	.xword	0x9958d5f7f28f5e45
	.align 0x4000
	.data
data_start_2:

	.xword	0x8c24b20a6091bed4
	.xword	0x9e25e11e176fdc8e
	.xword	0x249e40158b92f2af
	.xword	0xe3489c2fc74ef38f
	.xword	0x69106299c4a101f9
	.xword	0x8cd02bbbeedf6299
	.xword	0x46368863a9faf84a
	.xword	0x7834a1009d31f872
	.xword	0x0cd9f67e7aec1d24
	.xword	0x18edcc3ac0d7f55f
	.xword	0x857e851a4f8ee7e0
	.xword	0x27fc4ebe8b576882
	.xword	0x8b6e4602c8ae77d5
	.xword	0x65eebbd9ffd34ed4
	.xword	0x63539193dca92c71
	.xword	0x20d944f540f2bc2f
	.xword	0x0ed7d14f5aaa022b
	.xword	0xafd3e0d2ea929f5d
	.xword	0x18b7f5b49478c4bb
	.xword	0x0fc3dc77a95108bc
	.xword	0x90d308bc567e9a08
	.xword	0x4d752887f41a6472
	.xword	0x7757017e93c456df
	.xword	0x3f2c9e9875667bf1
	.xword	0x3f31168917c0153a
	.xword	0x6ba3955ac8d8c611
	.xword	0xd53ee2a0a7e1c696
	.xword	0xb6e4319277cbc9a0
	.xword	0x06601c654982b63f
	.xword	0xd87a346249b3731d
	.xword	0xa143b3381a34e730
	.xword	0xac412cd6c78836dd
	.xword	0x6500b3bef3ceb513
	.xword	0x4a7bed74ba9bc775
	.xword	0x16103cc6bacae0ce
	.xword	0x6a15821322e0d577
	.xword	0xd0802a3e39db832f
	.xword	0x8874667cc57174c1
	.xword	0x0c835bbf95e8219d
	.xword	0x6c447901bdd64e7c
	.xword	0x36af749516bd952e
	.xword	0x83ee1a8719adf361
	.xword	0x2748bb8e20ebf341
	.xword	0x481aefcb90cbe1d1
	.xword	0x7de3eaec96ac5582
	.xword	0x5ce0592914acdd03
	.xword	0xa206f92be1890b6c
	.xword	0xb7536706524b65d8
	.xword	0x81a8434f888f3b2e
	.xword	0x7bd034b057e7616f
	.xword	0xf08ac5bbbbd6d7b6
	.xword	0x1c1074ffc777f084
	.xword	0xe8b43cff43d6d235
	.xword	0xd2a44c43a5b3f40d
	.xword	0xfb3a07772060d82e
	.xword	0xa088407e0c76ab64
	.xword	0x5ab237b6e272748d
	.xword	0x4c4c61a8d7cd0a30
	.xword	0x464b0a6875fc527a
	.xword	0xc1ac1aae94379325
	.xword	0x00b3aab95819ad20
	.xword	0x1ac49f01568ff653
	.xword	0xc51576614fa8dffc
	.xword	0x7510e42719eeeab6
	.xword	0xb82ca561de99eebd
	.xword	0xee16076304672d58
	.xword	0xf7189c86b3822e81
	.xword	0xd9c1df296dfa141e
	.xword	0x26e92fb5edd1b4d6
	.xword	0x0ee3e729db8efbb0
	.xword	0x790b708ac284c5ba
	.xword	0x029e0263c10a619b
	.xword	0x22ee0f41970fd3cb
	.xword	0x1c9ca1fd6a8f8187
	.xword	0x6ebf6ed77432f0df
	.xword	0x4a506df05a836fe7
	.xword	0x0073f8d539aec13f
	.xword	0xd7b8dc3b2476f2da
	.xword	0x9a32a343b53e990e
	.xword	0xec9b7b3e3ee9aeb6
	.xword	0x948a4c5f8b694b4e
	.xword	0xc51871f758490a47
	.xword	0xaaac51bf189f0edf
	.xword	0x5debbeeafee28e75
	.xword	0x335eac2ead7c2e06
	.xword	0x5a2b93e10a0e6b7e
	.xword	0xc49232606cfbe890
	.xword	0xaa96e04a53f94cc3
	.xword	0xcfc5fc35fb0e6761
	.xword	0xbeafa6fc66040bd6
	.xword	0x38f76e153f0c8f83
	.xword	0x5723aaf9998393d6
	.xword	0xe3a2994699a1d8dd
	.xword	0xc15c4cba9685796f
	.xword	0x6cd4929702733f9b
	.xword	0x9292ef4ab754a9be
	.xword	0x23b9891f7eaee030
	.xword	0x60f1c8577dac590c
	.xword	0x11f5dfb5f5ee8e6b
	.xword	0x14f6dc1b9943ea32
	.xword	0xca00407b86568c80
	.xword	0xedbda4b1135a5b15
	.xword	0x74976042a781f23c
	.xword	0x1f9c11cfacdf09f6
	.xword	0x26e33a2b23196a58
	.xword	0xc1a890a4302617a6
	.xword	0x24023c23a5b7636a
	.xword	0x7b3a9aee33ebddbe
	.xword	0x47095e5738707186
	.xword	0x4adb81c954b0b1f7
	.xword	0x71caa55364ad5fab
	.xword	0xf95159036d9ba46e
	.xword	0x1600855e58995948
	.xword	0x7b31e19df050b810
	.xword	0xdf4b5fd55435a7ba
	.xword	0x355ec1f08be822fe
	.xword	0x199d69188a78e0c2
	.xword	0x863200091dc69dd8
	.xword	0xa6eaba7dc8e4ffbb
	.xword	0x379d258dd1b5b35a
	.xword	0xf85e2ed92f85228a
	.xword	0xb32118a65cfa2e94
	.xword	0x76f8a26692741ffa
	.xword	0xb58f904ccc677586
	.xword	0xc5ce4a5dd20fb4db
	.xword	0x54c57d485614b9df
	.xword	0x9c7dfbe07a1e65f3
	.xword	0xb88b5b3cf5ee9417
	.xword	0xb92ed4a03aa05034
	.xword	0x9f09bd1d18691b37
	.xword	0x067ba9c6125e4961
	.xword	0x20d2e75271eba859
	.xword	0x43758f663b3ab78d
	.xword	0x155d679debcdb220
	.xword	0x0fc607a80544b1bd
	.xword	0x87ebff4f090d4f8f
	.xword	0x533eb81acbda968f
	.xword	0xca6b4f73c6740c63
	.xword	0xf1b76b68594de251
	.xword	0x190df6d9a01c10ea
	.xword	0xf8cbe378c0eed459
	.xword	0xc11769976429294a
	.xword	0xd54ea9aa604305bf
	.xword	0x3c71452747ddcdf3
	.xword	0x2be6cec75e5af62e
	.xword	0xabd0326100259f5f
	.xword	0xda1516e3b1668eb9
	.xword	0xa19f17ff67b4f716
	.xword	0x7d99ed098877696e
	.xword	0x41692c88c7e02cda
	.xword	0x47e6a1a541e87753
	.xword	0x72a3f4e399aa08fa
	.xword	0x6ead8312a826980f
	.xword	0xe72984dec9b0be51
	.xword	0x901d207d86894312
	.xword	0x7f9312c2080d6ac0
	.xword	0x8825e079b4462348
	.xword	0x5050f2ac2bb2410e
	.xword	0x09333b3055e4bd3a
	.xword	0xf0a91b9764ac63e0
	.xword	0x050a6b9a21cd2610
	.xword	0x262290a546409e43
	.xword	0x782960814ce74724
	.xword	0xbf881ff7953ae1e8
	.xword	0x7f371a4b2a416d41
	.xword	0x5bf1e888999fb738
	.xword	0x2e7e5a0130f5c908
	.xword	0x0a57c69ee2b6cda5
	.xword	0xa4aaf70ae5ac5a45
	.xword	0x51678568d1a04f5e
	.xword	0x0997384c7799133b
	.xword	0xaeed21083f2db6af
	.xword	0x7d17a2811934d2b4
	.xword	0xbe10586b4a7401a0
	.xword	0xf51d8636c84d1bf3
	.xword	0x8ff468b306d4a710
	.xword	0xd6063f01886d3218
	.xword	0x4a6bea69abf7dd07
	.xword	0x7011e92cf4122375
	.xword	0x17e0683129f706d9
	.xword	0x630800d2f70b9db4
	.xword	0xe9e47a2d9d21555d
	.xword	0xa79a8ccedc279ea1
	.xword	0x14dcc2cf62f71fed
	.xword	0xfc687168e5866c6a
	.xword	0x82167bda823daf69
	.xword	0x18a562f272d5743a
	.xword	0x5c4bd217e65c5f98
	.xword	0xf787f51a7f8c46f6
	.xword	0xe5d4ce61e67c4d5a
	.xword	0x456ca9db68cdd11a
	.xword	0x2e1bd7957e0ae0dd
	.xword	0x2e18ffa41a317b17
	.xword	0xc178bf25f1631569
	.xword	0xf17f2a8b74df1d2b
	.xword	0xbb4f827e2e6bbde2
	.xword	0x8dc23b255edd5fa2
	.xword	0xa1907de6e3987ebb
	.xword	0x690bbb9eaf639ca6
	.xword	0x87d0ca3e89ff268d
	.xword	0xa32f56dc04d06b88
	.xword	0xf96a487f5191c63c
	.xword	0xbc5bd4f4e0c75c9b
	.xword	0xaef7c87b583b679c
	.xword	0x05b6842b9bfde4e5
	.xword	0x366aa325a0ec9691
	.xword	0xc28aecf512aa2d80
	.xword	0xa0c82fc39225f5ff
	.xword	0x678e213fc39c367e
	.xword	0xe3161daf732804d9
	.xword	0x94f58fe1cc738233
	.xword	0x59e40b5194eb4666
	.xword	0xa6c26bb66d09b03f
	.xword	0xe4cf82cdad1d6c07
	.xword	0x3f9c61b85f4fa428
	.xword	0xc2311c1214554f9b
	.xword	0x454b8cca811b0f13
	.xword	0x982a4659f3d3f706
	.xword	0xb8f7543eec18af37
	.xword	0xb8046230a648d90d
	.xword	0xf85de278e279544c
	.xword	0x196008c70e1aee72
	.xword	0xd3d0ad9db0df42a2
	.xword	0x6f1a5a7aebb4cc63
	.xword	0xa7287e94be2d2460
	.xword	0xe6b28a6db659b61a
	.xword	0x75025e27250fbddb
	.xword	0xcf68fb002847c9d1
	.xword	0xd97868d72ce18710
	.xword	0xf9485457c8fe7659
	.xword	0xc1eba95b7ae8221d
	.xword	0xfb2057eb4a7bf6c7
	.xword	0xca9ce5681c9765fa
	.xword	0x084563b34183c09d
	.xword	0xdadee81034d9d0c1
	.xword	0x91660349adfbfb68
	.xword	0x3fcbf1d55b8a4a75
	.xword	0xe298db76f68216fe
	.xword	0x6d8b63cf78732fc4
	.xword	0x5eb45cd91541722c
	.xword	0x2ca14790e7220927
	.xword	0x9d0a35cbef44d663
	.xword	0xe4b83a52bba27d0f
	.xword	0x4825d74decb3a76c
	.xword	0x5a9de306016e1a93
	.xword	0x9aae75ee6b326c46
	.xword	0xd323d7adf8577bc4
	.xword	0x1326e4e52e9f9bd5
	.xword	0xb1f8bac81ed7692c
	.xword	0x3995f83c54e1fa83
	.xword	0xf2512697750dfb77
	.xword	0xcb62ba27ebb9b666
	.xword	0xdd624105c76b3cb3
	.xword	0xf82c3cfbe558940f
	.xword	0xaccc608a787cc882
	.xword	0xf841556ab9d5929f
	.align 0x8000
	.data
data_start_3:

	.xword	0x088e186ae81c5952
	.xword	0x136e89f3544e76b7
	.xword	0x22bb41b9c0639722
	.xword	0x4f411606c10602db
	.xword	0x487fca324f535cc5
	.xword	0x40f2377b931a5368
	.xword	0x58cc6087ff59771e
	.xword	0x32d8e5e78505e728
	.xword	0xa9cbd3ba71ad0ec5
	.xword	0xfd1c474b531ecfb0
	.xword	0xd4eb9a4389ecc151
	.xword	0xa003559447a93dcf
	.xword	0x0d59c9df3a150347
	.xword	0x7862dcd1b26320b0
	.xword	0x97ce8a23a039af53
	.xword	0x5c793d2729be8a98
	.xword	0x2ad63f16ed1007aa
	.xword	0xdc23186d4681a8e8
	.xword	0xea2172457ad6fc5b
	.xword	0x298f8e6d6479ce3f
	.xword	0x4612973127ad1252
	.xword	0x24559796abf1a194
	.xword	0x2c1bf5b735adfe8e
	.xword	0x52acf674f02ef2e7
	.xword	0x58d128a6925276c0
	.xword	0x1a076f5c58fffa2b
	.xword	0xf2ea861811916114
	.xword	0x8486897ed8e1011c
	.xword	0x6b9215ae6c9704af
	.xword	0xd0149e175392377e
	.xword	0x4d030e2a17f152ae
	.xword	0xa81695329b51b948
	.xword	0x445c6e8854a5fd41
	.xword	0xdeb58e8f8449a6e4
	.xword	0x127349069c7025bf
	.xword	0x9758eada795c8c99
	.xword	0xd3c617298a996e35
	.xword	0xa01d41e221928b03
	.xword	0x5610a4e349df63a6
	.xword	0x97878a5ef0e3d03b
	.xword	0xd5b0ba3bc1de81d1
	.xword	0x01064d77488aa261
	.xword	0x97f0537286f30e58
	.xword	0xde2bf6a21dfe857e
	.xword	0x481b5ade21c46a55
	.xword	0x95afa8e20d84acb5
	.xword	0x9f20dd538ac443eb
	.xword	0x578ae31dcffc0b9e
	.xword	0x4c401d00b9b84f8d
	.xword	0x943f8c9dfa15fc3c
	.xword	0xeb5a02225e42297f
	.xword	0xec70431bc88f97cf
	.xword	0x079b5d8bc59d57a2
	.xword	0x9e408385f9f9b633
	.xword	0xb2de960812f86a97
	.xword	0xf1b011a492f501dd
	.xword	0x3fff454719df1050
	.xword	0x861aa47d7308b36c
	.xword	0x1b460a71e1e1609f
	.xword	0xf2fafcc33864807d
	.xword	0xbca0d6f4ac00d89e
	.xword	0xdd5ea9a63a31c6fc
	.xword	0xf5c3bb3663453bae
	.xword	0x7681edbf5c7fdba3
	.xword	0x86b6dd5f45f3c95b
	.xword	0x0c27fd599a13d737
	.xword	0x70b4fa1fd29d5825
	.xword	0xafc602036d8852b4
	.xword	0x88351b3fdd2856d0
	.xword	0x0a86798eaf720909
	.xword	0x7b249729577f327e
	.xword	0xa125b5934362fcf0
	.xword	0x199b8c4713e6672c
	.xword	0xf0e17364104012d2
	.xword	0xa358eb2fd08fc734
	.xword	0x69916abac06977d7
	.xword	0xfe9a4014a48fa6e4
	.xword	0x2e76ff30cf3eb69a
	.xword	0xe026c0ec2cff0844
	.xword	0xfd521301118c4760
	.xword	0xb031cca65c2d4686
	.xword	0x56751934a7f2ab59
	.xword	0xe0806d15a09fe219
	.xword	0x57c58c571a4ef40b
	.xword	0xefe31ace69ccba79
	.xword	0x74b20ce4475ed642
	.xword	0x5b845e300179dc99
	.xword	0x79359050c533873d
	.xword	0xdf952c018abe3f16
	.xword	0x7782506f257c6739
	.xword	0x3ffcd2a15d357f6e
	.xword	0xf4ff808877bd17ea
	.xword	0x3dcc07b526ecbe50
	.xword	0xe61cd086cf726c91
	.xword	0x9456e334a5a37abd
	.xword	0xcbe33cfdc7184f47
	.xword	0x299f9cf65117fd0c
	.xword	0xf2645a23a1a40795
	.xword	0x2b4df2b04dad4a82
	.xword	0xe558e941559c4549
	.xword	0x6f0cf0d688223e22
	.xword	0x1cb898cfb80a205c
	.xword	0x6114060cc59266e6
	.xword	0x06e3d164f3877590
	.xword	0xd1b3d5259cf7ac6f
	.xword	0x6c779a8b720f215a
	.xword	0x62bd9b2841bd08e0
	.xword	0x3f3c5b43b6a3c843
	.xword	0x60662959b5635c60
	.xword	0x3171f9f752ff2b83
	.xword	0x2313868562f91b7a
	.xword	0x0c10f421191ddd74
	.xword	0x3f2476b1701867b0
	.xword	0x0ca30afe9c62d17e
	.xword	0x2a38c9f7e4973732
	.xword	0x244af5c694aa54e3
	.xword	0x6e0bf8285e1ffe44
	.xword	0x703fdeb88948cb89
	.xword	0x36500bcd0119971c
	.xword	0x5ee23ca8c3ec1332
	.xword	0xc4ae7aaf601d7be3
	.xword	0x20a57a72304888e8
	.xword	0xc191a773d4ac8773
	.xword	0x1fcb79bab1e912f6
	.xword	0xffebc9da8e63ed7b
	.xword	0xd57921f5b4d84bf3
	.xword	0xbdfff8c612927f8a
	.xword	0x73f3b4e3c3c1a169
	.xword	0x27768f9cd6981abd
	.xword	0x9341add750250ecd
	.xword	0x3bcaf46ffd8c02d9
	.xword	0xe63f724da1c5b0fe
	.xword	0xba781baeda3ff5e5
	.xword	0x47efd65c83756234
	.xword	0xa56ef75b2229b014
	.xword	0xdd58bd8b6a2cbe7c
	.xword	0x5bae7147eb4372c0
	.xword	0x0c712e0506359e7a
	.xword	0x7ac1d8720f1a7ff1
	.xword	0x6ea0d96d27baa86f
	.xword	0xd1d3e14ff854afb8
	.xword	0x9ed5209e0c66da33
	.xword	0x0b39aba9a2131579
	.xword	0x45d285e48ff6d068
	.xword	0x6b2da7aab663a133
	.xword	0x25f97016eb0533c5
	.xword	0xcdf3d486515c7053
	.xword	0x3b818140c318fa3a
	.xword	0xfbe4bc0b66f9d6ee
	.xword	0x9c4e554c4aea9400
	.xword	0x277811b638296ed1
	.xword	0xba82e4343b9378f5
	.xword	0x0e19f29b2c3130fc
	.xword	0x48717d20aafac0b9
	.xword	0xda1ab80729253be0
	.xword	0x0e361b30361175cb
	.xword	0x28f021358d0b25f1
	.xword	0x2ff911fe0d124c9f
	.xword	0x774a1c04d76d920b
	.xword	0x5fa012ddaf339846
	.xword	0x84857f47b8a93c95
	.xword	0x617f8f1e7d630e25
	.xword	0x85f6b9b0e052c593
	.xword	0xa744906758299a19
	.xword	0x38230d556a884a24
	.xword	0x3687628615fa2177
	.xword	0xbdd57616b71ef022
	.xword	0x2e04fa51300a1c87
	.xword	0xaa642d4bd9f61f14
	.xword	0x41af554fd7e03cdd
	.xword	0xd4cf3b19431abf74
	.xword	0xc651f09a1b5c3838
	.xword	0x29c7511268c987ca
	.xword	0x93c87f2c18336875
	.xword	0xa94840a275f59161
	.xword	0x1ec63374977d44df
	.xword	0xf562a910064f06cf
	.xword	0x23d090c1dc80548c
	.xword	0x4dfcf8b725d0c9f0
	.xword	0x1132825da9bffb56
	.xword	0xd376896b3def5f0b
	.xword	0x228db6e6445bf0c3
	.xword	0xa620aac223fe1ae0
	.xword	0x8f7b7e0fc026481e
	.xword	0x856cddf4179cc02b
	.xword	0x585a6af7f43d0a7f
	.xword	0x96a8e18d5770bc49
	.xword	0xdb26a1096ca5e494
	.xword	0x23bcd7ab0db5c9be
	.xword	0xa291a7c4a482e3a6
	.xword	0x0731595b8c98e0f2
	.xword	0xde2f59767147fbb3
	.xword	0xed1d94fdaa0abae6
	.xword	0x6cb14326c52ba918
	.xword	0x2de6005980fc6a5d
	.xword	0xcc7d81e678ba48b2
	.xword	0x8ac77bf1223c99d0
	.xword	0x417563689a368005
	.xword	0xe2308a36a9351ce3
	.xword	0x9a7d47777af2cc23
	.xword	0x77413e60f259d932
	.xword	0x58959f0c145e75d6
	.xword	0x4e7795d2af52d73b
	.xword	0x7e9802976a0406c5
	.xword	0x12ddd80b78578119
	.xword	0x19f406f3338bc43c
	.xword	0x62c9625eb7b01738
	.xword	0x9b9bac36c17f0ef6
	.xword	0xc1a3cc060438df22
	.xword	0xc989f9b74ef9e348
	.xword	0x3014ae3810a814cd
	.xword	0x381e933dd18a47e2
	.xword	0xa4e6b160071fd2d0
	.xword	0x69ff2dd8f0c88537
	.xword	0x495b33ebc3ed5ec5
	.xword	0x86bec4c69f41f680
	.xword	0xdf66bd0c513b0237
	.xword	0x84254bd76032104d
	.xword	0xc00f19f7861bbcf2
	.xword	0x337bcc462d7dcd4d
	.xword	0x0aa66f7d19db82b8
	.xword	0x2b410be117433f41
	.xword	0xe9d4fb28dc4c2e72
	.xword	0xaf5531912f03a90a
	.xword	0xfb2b8c18e2cfd3ca
	.xword	0x6e9ae9ad69f4b592
	.xword	0xcb43f8430a0eb752
	.xword	0x075d351eb2ac9274
	.xword	0x4ce1f2933ec23c02
	.xword	0x9f51e7caa92f20ba
	.xword	0x415a5b3faed5ebcd
	.xword	0xe92ffeddfee47a08
	.xword	0xb52f31b78c0449ef
	.xword	0x605eea54d90b66ea
	.xword	0xd9926eb11f2caae6
	.xword	0xdba39650c7408874
	.xword	0x870b5f0f0d6b849e
	.xword	0x9a4d6e10e11ff0c2
	.xword	0xff2d974b3c86b148
	.xword	0x97d87481eee0d656
	.xword	0x1c07956f74f620f5
	.xword	0xb131d1eb59aa9092
	.xword	0x867122c2145a0972
	.xword	0x2595a8ffd704cd46
	.xword	0x5c70d869e389652d
	.xword	0x76b6191ddb9f0dfc
	.xword	0x5a58cfcf50c14637
	.xword	0xac500208c29917d1
	.xword	0x5c02e90568ffb975
	.xword	0x291643845f98c212
	.xword	0x2f2a1c2eb031660f
	.xword	0x152a42246d1a0aed
	.xword	0x46b5b007ca9b484a
	.xword	0x0b31f8aede388940
	.xword	0xfb7cdf0ea154035f
	.xword	0xc5f5d9215e1bbf03
	.align 0x10000
	.data
data_start_4:

	.xword	0x12fa9e716970bd1a
	.xword	0x08b8f52087efc68b
	.xword	0xc54f90004b9affae
	.xword	0x9f8068e3d64c8521
	.xword	0x32da367d6a67b8aa
	.xword	0x2375ed3f4d8ca3bb
	.xword	0xfdf3ba304fd7972e
	.xword	0x5a5edbb5e273c0c8
	.xword	0xb16ac1e02e490086
	.xword	0x259ff9f945e732a4
	.xword	0x5e697e2ca89bfe86
	.xword	0x7e030fe0773ce376
	.xword	0x11d6d67b9fd3ce6b
	.xword	0xc835a9cb4695e2f4
	.xword	0x1b200476b22b8933
	.xword	0x27c13fdf167dd2e0
	.xword	0xc56eb30c043e809f
	.xword	0x0ff9e1d206528f79
	.xword	0xd064ad431d17203e
	.xword	0x7e73524d321222e1
	.xword	0x6bbf94430f9560b0
	.xword	0xeec1138a2f39a249
	.xword	0x03f6c27bead3fbca
	.xword	0x106691a796b72db9
	.xword	0x758eef318696cdbc
	.xword	0xafc53e2e788f80c9
	.xword	0x5c27351bb734b77e
	.xword	0xde64cf69b4f60d76
	.xword	0x5b29fc78eafb8dde
	.xword	0x4aa2547081aa2fd8
	.xword	0x4bfd8a1f4aec77e4
	.xword	0x1493d4afcee09e93
	.xword	0xa3970a86ff3ee5fb
	.xword	0x01d9a49d11b50d3e
	.xword	0x8d7138609bf648c5
	.xword	0xfa4bc364192c9882
	.xword	0x538ac1a79d599816
	.xword	0x02e2e2eca808dee8
	.xword	0xdaf665714b1a72b4
	.xword	0xd379656868801fbb
	.xword	0xd529b982d1f27eca
	.xword	0x49cc84630b63c51a
	.xword	0x796df8ec6004e1bb
	.xword	0x0142f0e7c5c77ec8
	.xword	0x459ae173bd8f3c89
	.xword	0x0da467b9c4bcfcae
	.xword	0x3deaa7d696ad6210
	.xword	0x86fe82a0e410847b
	.xword	0x0c39b0fe71c1aa23
	.xword	0x743369ef49196c72
	.xword	0x223585e96643b7d6
	.xword	0x1d95d0fcbb3cda3b
	.xword	0xe73c5314d929c602
	.xword	0xb422ec0538a7cb25
	.xword	0xbf1e7c17e400ef79
	.xword	0xa262cfec634bb855
	.xword	0xc9ad68a1b463b357
	.xword	0xa90c5a3d96b3f543
	.xword	0xc9afa3e7f6714324
	.xword	0xd2a13cc9aa4deea0
	.xword	0x55eb0715f4c9bfb5
	.xword	0xa5a5449517f6dfef
	.xword	0x2895eb212100cae2
	.xword	0xeb01923159f2d32c
	.xword	0xed249918fc088f04
	.xword	0x3e23511f052b97f1
	.xword	0xfe303970b9680c91
	.xword	0x7b67598dd8239ab8
	.xword	0xb05ae3b4fa3361e1
	.xword	0x26447e7d75984d12
	.xword	0x423404f7d6931977
	.xword	0x35c50ec9e4750b1a
	.xword	0xc034ca488354651d
	.xword	0xfd76cea168525d9b
	.xword	0xdb83dd8f0681a58d
	.xword	0x9cdfe24cdf8aab39
	.xword	0x882573d2417e789c
	.xword	0x6142bcdff234109b
	.xword	0x2668a618d880273a
	.xword	0x2f30bc0309854c8b
	.xword	0x15adbce449178f45
	.xword	0xabda17519771ffe0
	.xword	0x8781f142b6870650
	.xword	0x0c8db9eeaed258a9
	.xword	0x43e3ad6ce1394ca6
	.xword	0x7468113c33ff5bf1
	.xword	0x2062bcb080566e51
	.xword	0x8303ca6d82ed3a6c
	.xword	0xb1d61ce20c80e0e7
	.xword	0x57d8c9dcdf225b43
	.xword	0x46871df126b54137
	.xword	0xcd278a2bfbaa55cd
	.xword	0x3535e9e3c667f702
	.xword	0xdb2fa03d4ae0fc12
	.xword	0xdcf458574b1d14fc
	.xword	0x957b2cdd13508e6d
	.xword	0x964a0d9f8351a260
	.xword	0xc3f0a72b5a5520f2
	.xword	0x10ce5fc03d868d01
	.xword	0x8149a48b66cef1a6
	.xword	0x164d334d68b9076f
	.xword	0x5c612ba1e98d83a9
	.xword	0xa6104e0c1dee3a4b
	.xword	0xb0da397767e49bec
	.xword	0x4ad1396d56036ea9
	.xword	0xeb22b80e4714c231
	.xword	0xcc53f2852b37a5ef
	.xword	0x77b889a741d49530
	.xword	0x267e159fd1cbf9c6
	.xword	0x4155c45a68baa66b
	.xword	0x11616ae2e3671906
	.xword	0x4150b88bcb9d4157
	.xword	0x0bcbcb1c4b558b48
	.xword	0x36101b37dc074909
	.xword	0x2fd706908420dabe
	.xword	0xda397065f76403b8
	.xword	0x2bcc781a59bcd721
	.xword	0x8e84389238c50ca3
	.xword	0xd4537dc744f600af
	.xword	0xb12ac0ed36fbe94a
	.xword	0xc0c1bf304b904288
	.xword	0x7deebe12a295a309
	.xword	0x2eed8559fa9d7938
	.xword	0x82171ace55341db3
	.xword	0x821502143490cef2
	.xword	0x131f8cbe80079e6d
	.xword	0xd9cb52191efbff80
	.xword	0x422d209d49b900a2
	.xword	0x2280c6279c2f8f72
	.xword	0x89a1580da17c8bf9
	.xword	0x0552b29ce5f80a65
	.xword	0xfa8d15d438477c43
	.xword	0xbecc3abc464a2cb2
	.xword	0xe014e4b5cdf86162
	.xword	0x2f2cd496442be2ff
	.xword	0x9614e7ced261bfbb
	.xword	0xe5f407066f56f90d
	.xword	0x8854132ffd5bdb6b
	.xword	0x53fb611d5b0e072a
	.xword	0xf351e67665b70443
	.xword	0x4d74967b5540fb66
	.xword	0xbb3b26eeb8742c8d
	.xword	0xdaed8fd1d5f2970d
	.xword	0x96a685f3de2e348c
	.xword	0x694aa4e52a98aa76
	.xword	0x0eb33327fccbdc83
	.xword	0xe3e46f855372983d
	.xword	0x4b0e0169f65c937f
	.xword	0x51a5325965975fc3
	.xword	0xa7e2e063b0b4ee1a
	.xword	0x537fbff748d8769f
	.xword	0xd8f9c6a7a7e90ddb
	.xword	0xe8e0269bafac412e
	.xword	0x9ca29e754c3c098f
	.xword	0xe720b9c34fe64063
	.xword	0x55e9cfbd1f8e8e47
	.xword	0xed63f9e21683cd62
	.xword	0x3b29844a3091cf4f
	.xword	0xed92202574eefadb
	.xword	0x4acdbe23c56b0ece
	.xword	0x14ec39a8339ea62f
	.xword	0x7dfa35192d7de3c4
	.xword	0xecd066e7ffb5f984
	.xword	0x8db054be0c5b98b9
	.xword	0x6f99d1ac15fc9ab6
	.xword	0xb009201e05a6e340
	.xword	0xc047b684a30c2ce1
	.xword	0x0661399ed5ce5ba9
	.xword	0xee9011fe46f54432
	.xword	0x2faf8b45579a359c
	.xword	0xc8f3179988d459be
	.xword	0x0bd191b9a814780f
	.xword	0x4e5c5d3b5c900c96
	.xword	0x59272c3095cd94fe
	.xword	0x597f174f07f9e8a5
	.xword	0x72d26a1c06566d9c
	.xword	0xd312c304d4b989e2
	.xword	0x5901dcc20262f2bb
	.xword	0x82f54b5b2f6b2d05
	.xword	0x4fb2db0d08e4bd63
	.xword	0xbabba3c43e173747
	.xword	0xcbba04c6ac6058f0
	.xword	0x76d56c20df60ff25
	.xword	0x9a3522acb0c4b66f
	.xword	0x79e6e923779e255c
	.xword	0x0ea5e5b618c3d08d
	.xword	0x9d83ae34d84d1663
	.xword	0xd5a9786aad221a98
	.xword	0x1b7af619633efc0b
	.xword	0xec88cace38f2af1c
	.xword	0x7fccff5976e5a5c3
	.xword	0x5fc8acec5e5d4a05
	.xword	0xdf02ca14c66bbdee
	.xword	0x22227fd0b66cfa39
	.xword	0x12a5b8f83aaad116
	.xword	0x98e89b229d7607f8
	.xword	0x997f575e073e7c01
	.xword	0xb73798fc4a42cac2
	.xword	0x13a84aa87e1345f4
	.xword	0xed7fd7873e3ed88d
	.xword	0x451c13d90789eb52
	.xword	0x3b73ee24fe015928
	.xword	0x97579b19b229ee3d
	.xword	0x37d762fa91145a4e
	.xword	0x1be119cf1b9c813e
	.xword	0xdaf0353f6b0ccbf2
	.xword	0x5843d6688ad588a0
	.xword	0xc0583eb913e1bf2f
	.xword	0xb3ea3843e346f7f7
	.xword	0x418406bba6074f10
	.xword	0x088bd121ee2fb0e3
	.xword	0x82414936af057276
	.xword	0xfba8ea78da6fca10
	.xword	0x019c4d2edcb33335
	.xword	0x762c195d5e6e5f80
	.xword	0x95c4ef42482eb6a2
	.xword	0x374bf2a883a49d40
	.xword	0x07df9a4ca4a47ef0
	.xword	0xfd85166bf75e7af8
	.xword	0x0eca226bcfa35723
	.xword	0x9d43d0edfb5ac5fe
	.xword	0xef0a240469098dca
	.xword	0x04b91710a3244112
	.xword	0x05f22bea8f59cd91
	.xword	0x5b308fbb07231036
	.xword	0x02f93126a9ffc587
	.xword	0xba9c7f8df2afbb1d
	.xword	0xf13f8f1988af28e3
	.xword	0xe7d0b076ab25f43b
	.xword	0xfd5573c48e0b093b
	.xword	0x281e2b7803358bca
	.xword	0xa5be910535d0bdd9
	.xword	0xbd997b949e5e0cc6
	.xword	0xf36e315a79d787fe
	.xword	0x1d5cbf1b37649491
	.xword	0x29503fd258fc0941
	.xword	0x6e6250a3fe192b8d
	.xword	0x650b1b0d933a1430
	.xword	0x6a03d3e0134957ea
	.xword	0xc3279b10fdf4a75f
	.xword	0xb59af42f76511ed6
	.xword	0x99fec8c9c30d417b
	.xword	0xa41746f0c346cfee
	.xword	0xd91581b20db24f50
	.xword	0x35b5987713cef652
	.xword	0x51288ca5ab921d6d
	.xword	0x7eeb863916b41676
	.xword	0xa4baab1fe3f85509
	.xword	0x52af93f89d4f7c70
	.xword	0x97359f54a5e40666
	.xword	0xd2e39ad6d2e2cfbe
	.xword	0xd1a0684b08b268d0
	.xword	0xa7680802c76bd5d9
	.xword	0xd898c0b0329ac6d5
	.xword	0x0ff00a6b05a38316
	.xword	0xe5000b4473f0ea10
	.align 0x20000
	.data
data_start_5:

	.xword	0xf545005dfe84ec4f
	.xword	0x0d20964af6b971d0
	.xword	0x77e7cf2985e31c13
	.xword	0x1fe2e6416db56c84
	.xword	0xd70846373af9e04d
	.xword	0x1cb2c4b2f33d867e
	.xword	0x82aa5eca8b915fe1
	.xword	0xf74aac418111098d
	.xword	0x4c78c18e04ad4445
	.xword	0xd9a469c7451f9ff0
	.xword	0x4d5cb11cc8c08c12
	.xword	0xe2a141914f8fd6d7
	.xword	0x169df14996f8a4e8
	.xword	0x30b0c56a64c6e2d1
	.xword	0x42f11bd81cfdcd40
	.xword	0xa1ff9e23c97fcea9
	.xword	0xba4c0c0d0b000a82
	.xword	0x6a8ac6afeda58fed
	.xword	0xf17c5e6b5ccfa440
	.xword	0xa87d1e51e3edc43d
	.xword	0xb30baf15501cd8b6
	.xword	0x202dd12ff66e3114
	.xword	0x5c052d51dd451881
	.xword	0xe50da9ae8281a62f
	.xword	0xd0bbb9c2073c19df
	.xword	0x4149dbea66c80eac
	.xword	0x977a22fddb694cf5
	.xword	0x5779bddfdb3fd594
	.xword	0x2c082f0c7add85fc
	.xword	0x7f010b5f6ded988b
	.xword	0xb69ca7f212fd7474
	.xword	0xf6a7101941c664ef
	.xword	0xd74de293f5865bbd
	.xword	0xf8de074223b050a8
	.xword	0xc1d184f9176bc5b1
	.xword	0x4482965138253ce4
	.xword	0x3f3b2730741985d2
	.xword	0x9a11df3698e026bf
	.xword	0x9f0c65a72baea32b
	.xword	0xedff26ea3c7e4b4a
	.xword	0xed6a4001d3ff7b76
	.xword	0xcd07a28ac435eeba
	.xword	0x0248906d7845f167
	.xword	0x77a15b5b3aa4d9f9
	.xword	0xc306fa1999dec484
	.xword	0xb495e1e22bbaa8c2
	.xword	0x2b25ba84a152a6df
	.xword	0x7cf61d750c45d872
	.xword	0x9aba3f8cc03a4279
	.xword	0xbb682f67f320610f
	.xword	0x0db797564cb33128
	.xword	0x8c103669890ab787
	.xword	0xc7303f05629d8115
	.xword	0x1b7b64911acb3ef5
	.xword	0xd4f76c713d042c36
	.xword	0xb2d0ffb4ad07ff4b
	.xword	0x6b648fe0eb3ebbe7
	.xword	0x9803d98ff7f2a138
	.xword	0x12500c14d8fd7343
	.xword	0xa088d74a6036f22c
	.xword	0xf7460070710e9fda
	.xword	0x83cc5d6a009a7cb8
	.xword	0xbe2e2cfec36fbf25
	.xword	0x4f5870864aef8237
	.xword	0xc838d805af814482
	.xword	0xbd2111aa0ab9edc4
	.xword	0x9d16669942629245
	.xword	0x6d071b160ab443c5
	.xword	0xfa02ffb84aac4842
	.xword	0x3a0695cc12b0bb12
	.xword	0x6d8c3087776d0bce
	.xword	0xf6f9a7b88360935d
	.xword	0x18a4c4e3b17f4667
	.xword	0x4f9983f2cd099293
	.xword	0x2d22b7292aa0ddcc
	.xword	0x58813c5bed9fd3b7
	.xword	0x736980e25715c65f
	.xword	0x05840532e5aa0eea
	.xword	0xc5c12c2cae8eee39
	.xword	0xe4b83c6d6c81d3dd
	.xword	0x19c1f0770dfe2bd0
	.xword	0xbab36bf592c41b6a
	.xword	0xe3b3bd8d327b8fab
	.xword	0x540a3d4deaefc153
	.xword	0xc5f6322413bf5cf0
	.xword	0xd7b87f2de666a528
	.xword	0xaa1a431edae2d3d3
	.xword	0xc9044a09df7f6651
	.xword	0x62f7f783090cc523
	.xword	0x829044f4cd7b8f1e
	.xword	0xf5c61a82c104b862
	.xword	0x169c6a073bb7ed7f
	.xword	0x250ad033eac64ee7
	.xword	0x0286b0199c7fc008
	.xword	0xa15dcc7eef74e587
	.xword	0x246becb155419cca
	.xword	0x9c042e62393a5a83
	.xword	0xc912d3e6dda132c6
	.xword	0x86f6fd5e165b8b2f
	.xword	0x8991336c56e950be
	.xword	0x47933b9d4632043c
	.xword	0x5773309eee89fd19
	.xword	0x6408e49a8a28f0b7
	.xword	0xfe4161698566e95b
	.xword	0x98bb9bc5529cc7de
	.xword	0x1e89ae08bde841e9
	.xword	0xf3c375f322c8d151
	.xword	0x399b1d9b0543a8a5
	.xword	0x6916089675810eda
	.xword	0x9fb0f39f433aa5b6
	.xword	0x7c8d73a834005e71
	.xword	0xa0da8a0d7bf3bff5
	.xword	0xc7190026b4216156
	.xword	0x9f1c5a1cbb1a119a
	.xword	0x4ab70c00b84931de
	.xword	0xd9f2202b0bc0bf97
	.xword	0xbc0e29b06f52db83
	.xword	0xd84c02afc50cbc96
	.xword	0xce90a349324210ee
	.xword	0xb3691fcd59e0a40f
	.xword	0x5e9e4a52c9a42eb1
	.xword	0xc4df1984a8cf6b6c
	.xword	0x35093ffe2efffd87
	.xword	0x8edadb9bf1c28e6e
	.xword	0x0b2d24e15db4c45e
	.xword	0x553818b5d5c3d088
	.xword	0xe54b0a9715cad206
	.xword	0x12b9fe19a3a29930
	.xword	0xd34434a54c7a25de
	.xword	0xd3e2f8818367467a
	.xword	0x20a0c9a5d0d8db9d
	.xword	0xc72a5c04b4b23b79
	.xword	0x5a1526578c958be6
	.xword	0x5de29402dc74bda7
	.xword	0x713f6e75280792d8
	.xword	0xfbb9c99b5a38a273
	.xword	0x59c36001d735a458
	.xword	0xa0affd4b461344e3
	.xword	0x40fa3fc2c0ebcd50
	.xword	0x740ce5e0737dafea
	.xword	0x638ab7240a824c6c
	.xword	0xd0cd5349fe8d1422
	.xword	0x1cc53fb2a741ebda
	.xword	0xdb27d66cfa0094ea
	.xword	0x5ef5e589dfaf6c92
	.xword	0x3e5f3f3c0a5455da
	.xword	0x9d7157b5c75d486f
	.xword	0x1e2fe9da10f027c6
	.xword	0x6cacce1eb7535b1e
	.xword	0x71fe6294e5cc3beb
	.xword	0x3088acefe82be61f
	.xword	0x4fdb456da0b6cf4e
	.xword	0x437e46f23b564f8a
	.xword	0xce925f31831d2060
	.xword	0x3cf83d5c5fa4e3f4
	.xword	0x4ac83b2ba40d9574
	.xword	0x6597375d1b8f8705
	.xword	0xa0a7d0973ca64ef4
	.xword	0x39ccd340d5f15637
	.xword	0x0805469e385595fe
	.xword	0x7f9071b059ec81e6
	.xword	0x517bd28679cb07cc
	.xword	0x8206ec2a50a722ba
	.xword	0x2bf08a4daa0234ad
	.xword	0x8d85c7ed7530860c
	.xword	0xbd0875465b7fccb1
	.xword	0x3c7eb85811946e73
	.xword	0x0672940fd1ffaf50
	.xword	0x54cc55dcb9293e17
	.xword	0xb39739e06e6df5fe
	.xword	0x3b23b845d7d1cf67
	.xword	0x03f1af69b3f6bdbe
	.xword	0xa1ad359a70b47f4c
	.xword	0x4a8fa99ef96f3ccf
	.xword	0xd7004ab199a10346
	.xword	0xe8280a936b05de28
	.xword	0x8709a99ae8e78ce2
	.xword	0xd4cbf621db164fdc
	.xword	0x04bdcc7ca911f764
	.xword	0x3542cf40e24c772c
	.xword	0xd7faf25ac087fca1
	.xword	0x9dcfc8ab0e8fd6a1
	.xword	0xebe13dbd324e1c8d
	.xword	0xf8e67ceb6874d867
	.xword	0xeae957401a10ff0c
	.xword	0x3f5dfe51722843b5
	.xword	0xcb1ecac7887034e0
	.xword	0x1319b5d2af1499c9
	.xword	0x4f4fb1db6d817b09
	.xword	0xb9325fbb19b9604c
	.xword	0xb329ea564d4fab87
	.xword	0xff5347216d9b9a5c
	.xword	0xf5ad4b26a20e8b05
	.xword	0x7e56951bfea948c8
	.xword	0xcc9f2547030fca85
	.xword	0x78460750ef5edc8c
	.xword	0x89bb2d7bc73653f0
	.xword	0x0e3c3c2a9071088d
	.xword	0x7fa3f601490dce26
	.xword	0x3d8afac9c6884a7b
	.xword	0x23e486877221a150
	.xword	0xf9bf4706f871ca54
	.xword	0x5165b1ad3e4c8a32
	.xword	0x62d24b2f0fa778a0
	.xword	0x8f718910a80b050a
	.xword	0xa10bb50e1de8ffa3
	.xword	0x691900a829a694f8
	.xword	0x01dcd1adeec0c7b2
	.xword	0x4db5eee4c30f2cd9
	.xword	0xe7bfff966a602c8e
	.xword	0x94d112d65769d5d0
	.xword	0x73a3a322c34dd4a6
	.xword	0xd7b312aace0f893e
	.xword	0x80610181b0669037
	.xword	0x22ec30e12583a3cb
	.xword	0x77557ad359111e14
	.xword	0x3e5923b35a2c6c80
	.xword	0x8cad463dd9476e7d
	.xword	0xf253125fa8ff053b
	.xword	0x730d87f8daf3381c
	.xword	0xe35368e3f36f52e9
	.xword	0x761589ad178e2b93
	.xword	0x96893cd673d301ad
	.xword	0x611efdf5e659c58c
	.xword	0x56b85668dd4d8672
	.xword	0xee538784dad8e9ec
	.xword	0xc8b533abcdf5f242
	.xword	0x178109a26db889ec
	.xword	0x0eee2743b7a73e6a
	.xword	0x5402a77ec2e8e49e
	.xword	0x32fc22b6c1715754
	.xword	0x187e1bc96a443df9
	.xword	0xbfff86541ea67d0e
	.xword	0xb9b22d8bde661234
	.xword	0x82d90ff6e5939b48
	.xword	0xd010fa0490b1a9c1
	.xword	0x89a3b4682d7f0f94
	.xword	0x458e72431419cfe1
	.xword	0xa08cde00294bf092
	.xword	0x412d89bf432aced4
	.xword	0x8ca2ab818adafd1c
	.xword	0x90a008a76e37eb69
	.xword	0x14a1a9fd92b3dffa
	.xword	0x76c953aebd6353fa
	.xword	0xbf2b7ef5ec638c59
	.xword	0x3ff9a1cee4f46c9c
	.xword	0xc89537003917a64e
	.xword	0x13a42ea1c892897f
	.xword	0x7c8355f7befbb956
	.xword	0x758051c02b79a067
	.xword	0xa45ee5922a6326c7
	.xword	0xff2d851758a6a1f4
	.xword	0xa0cacf3ade96c90d
	.xword	0x25bece04a041972d
	.xword	0xc216442203444081
	.xword	0xafc72fb8ea6306cc
	.align 0x40000
	.data
data_start_6:

	.xword	0x0b938281f5b0a79a
	.xword	0xcbb351f835ec56dd
	.xword	0x9aee93ac1f5a5a1f
	.xword	0x5876c7cefca5d4ec
	.xword	0xe3cbfa0788b3720f
	.xword	0xe905b9feb81887d9
	.xword	0x01f7dfac9b0ab36f
	.xword	0x0dd45e6cc797d087
	.xword	0x59998ec99f2b9b6a
	.xword	0xb4054b0a0d561e4a
	.xword	0x64c1954253e3aed1
	.xword	0x1c9b679aa5e2e2bc
	.xword	0x316be6a338a682e6
	.xword	0x63394c6babd9201e
	.xword	0x32abfa6412f1a21b
	.xword	0x6689d0d470f52db6
	.xword	0x9d405078edbf547d
	.xword	0xd2b225306b78ac12
	.xword	0xad507b72307e4a83
	.xword	0x6ca0455143619a42
	.xword	0x4aede596ff38f533
	.xword	0x6729a5d7e384edc7
	.xword	0xdeb9c91ee5ab205e
	.xword	0x9cfd4f4650df34d9
	.xword	0xdfba62efe80609ce
	.xword	0x401e1a8bee2e2fd8
	.xword	0x0e6bee36ec2a51d9
	.xword	0x1207907eb2e2bb9e
	.xword	0x901350a22c3f5d13
	.xword	0xc3eaeb5dabdee30b
	.xword	0x179e7b84c60525b3
	.xword	0xd447cb78099071e0
	.xword	0x9433a6bd80fc77be
	.xword	0x0dbc4ed38773cf81
	.xword	0xebf9d1e4e1b71ecd
	.xword	0xa44d67737552b8c6
	.xword	0x3502adc40469e62c
	.xword	0xf7b5202d03a45c52
	.xword	0x417f27cf1a1145d1
	.xword	0x66bbe8b941f84367
	.xword	0x7e7f893b2e90aaa4
	.xword	0x289c53f8d5952076
	.xword	0x5c73be140af8d231
	.xword	0x395901f72fba9ec4
	.xword	0x4a4be266c442e56b
	.xword	0x6ffadd3a4a3e4158
	.xword	0x45af93b77232543b
	.xword	0x8b3595f23d96f2e9
	.xword	0xa174bdfdb8a5f089
	.xword	0x7ceded678bf53af4
	.xword	0x77b3d1021cd73b10
	.xword	0xb72639c2443e0272
	.xword	0x55369761885083aa
	.xword	0xc8ffe483e17c951a
	.xword	0x7d1dbe573d980748
	.xword	0xc8bbc141972c1603
	.xword	0xb5890d9f5faa8f2d
	.xword	0x5e3cdc8d03ef23fb
	.xword	0xfa36d8a60c58cd82
	.xword	0x0f82c83e1de28941
	.xword	0xc5180fc77df728d0
	.xword	0xe994680f806b7639
	.xword	0x9c20f4ff249f59f1
	.xword	0x42f308e30b82ed62
	.xword	0xbb482b13f58eb9b7
	.xword	0x13944fdc875da8ad
	.xword	0xb8097ddfc5096ac6
	.xword	0x0c2d01867662e10f
	.xword	0xcbdda9f76fbbd66a
	.xword	0x21cbed6ac01277e9
	.xword	0x30c71b3cd1100f2a
	.xword	0x95c6dccc8bf6d339
	.xword	0x8e9590feabd6b8df
	.xword	0xd1d49a979ac6458e
	.xword	0x1390968b103527bd
	.xword	0xdecb6432895302f4
	.xword	0xefd2360f220d910f
	.xword	0x777f62d4a951b041
	.xword	0x9a551921c033c8ef
	.xword	0x1c0b7ba4cefc1073
	.xword	0x28c54ded3011ec51
	.xword	0x379e038be87f249a
	.xword	0x8c33ae276a2a6322
	.xword	0xcdbfc9b5276f40cb
	.xword	0x7fc08320d1400009
	.xword	0xb983cf8f2aa32c9d
	.xword	0x0d2159e069e4e4fd
	.xword	0xc6c17e21d4b4b291
	.xword	0xf9aa499f603807e2
	.xword	0xe76033e72ed07cfa
	.xword	0xcbad37cac706bea7
	.xword	0x8ebdda652311cebf
	.xword	0x97169aa8e486cd60
	.xword	0xb1f91c6a9c37015e
	.xword	0xd6f18af0ca7a0a6a
	.xword	0x93151adc03f589ce
	.xword	0x3e6830417c318d52
	.xword	0x8279123c03fe825b
	.xword	0x8cd90689826f54cb
	.xword	0xb23543db24d4bec6
	.xword	0x68ad509ab20f1652
	.xword	0xab2a2550fc35df1c
	.xword	0x444fd9380648ecfa
	.xword	0x6503d21641dbe40c
	.xword	0xb8f3e3ee755492b2
	.xword	0xcdc020e358d019e9
	.xword	0xbca7ddd261c06eb5
	.xword	0x40cebdce25469e00
	.xword	0x0a5baf37a6636c79
	.xword	0xb06667da816ffd64
	.xword	0x23d33464bb327d8f
	.xword	0x25d951ec3440d3f4
	.xword	0x4119328e128ac9d5
	.xword	0x99f7cf1edb934d7a
	.xword	0x3c3b462070613f48
	.xword	0x0a2e97a9d559f160
	.xword	0xcf3fc7f90788fd69
	.xword	0x91c17c16642fec3f
	.xword	0xbc44954f1961621b
	.xword	0x7aca011c4af42190
	.xword	0xb82c8456a91a868c
	.xword	0xdcff1e6b33ea64b3
	.xword	0x8f563002e011415a
	.xword	0xe5f2fc4b8181cd6a
	.xword	0x06d62f37208d9909
	.xword	0x372f7a8372261cea
	.xword	0xeb6d19792fad3b8d
	.xword	0xf1e62aac61a9a6ab
	.xword	0xc46b9299eb7dad85
	.xword	0x891af79d5866101e
	.xword	0xcc43360312bbf311
	.xword	0xe68d8dac42d85f54
	.xword	0x85a81ed3258b941d
	.xword	0x2a707c671417fad7
	.xword	0xab6cb797628cc591
	.xword	0xd326976a4b7635c6
	.xword	0xfa400001c68f03f6
	.xword	0xb164a8ed76de0aa4
	.xword	0x3b1f6b6f39f493d3
	.xword	0xf55c92b7816f051f
	.xword	0x16e26f22f6e43837
	.xword	0x1edd1ecaa7a01ce8
	.xword	0xaa9dfce7c73a403b
	.xword	0x583f4d22113d8e95
	.xword	0x63dd8a27afbb4565
	.xword	0xe6a36a583169d772
	.xword	0x1b00b6387c59fce1
	.xword	0x7fc98490b56a0d5a
	.xword	0x78ed1f001064a745
	.xword	0x20173e16f076e014
	.xword	0x6b7b956b655de96e
	.xword	0x5cde5aef81f58725
	.xword	0x843d91979cf541ad
	.xword	0x9f258989484f5574
	.xword	0x1d4827e88a3815ae
	.xword	0xba57e91519a24be5
	.xword	0x3a71449fd91376fb
	.xword	0xf97797a251dd0ffa
	.xword	0xa967b256fadef241
	.xword	0xb8d05c10418f1d89
	.xword	0x51ff59ecc035b13a
	.xword	0x0b8f7b9e58d68940
	.xword	0x6f6f3be3b2a0f7ed
	.xword	0x7f7364b491e07f7f
	.xword	0xe4f5ac17085aaf20
	.xword	0xffe2983caa781389
	.xword	0x4b37586c97d7747d
	.xword	0x965decd797b3d55b
	.xword	0x015948463218568f
	.xword	0xe7cfeb900fb0940f
	.xword	0x52b7ac530a5b0809
	.xword	0xb7d59f20522da101
	.xword	0x4ab0c1d84127ea6c
	.xword	0xe50bd11dc7f60bdb
	.xword	0xff2f3aaca4246601
	.xword	0x7c3c3c3a2472e32b
	.xword	0x0da59209d72ee21b
	.xword	0x756a35ef32408966
	.xword	0x2bde449d4108ec17
	.xword	0xeeb838337cbfd8d9
	.xword	0x38fcb9ccfbb3f0a0
	.xword	0x2d92b9ad1514cb16
	.xword	0x1200c1c66ac9d5df
	.xword	0x7a800ac1f1d16816
	.xword	0x1fc3cf089857a1d0
	.xword	0x2af82bf45f795529
	.xword	0xd8309520f83ddcfb
	.xword	0xea0a17b4131baee9
	.xword	0x6e0c32c88995fb4b
	.xword	0xa9fe9b63c265017f
	.xword	0x6335cc0b820bae3d
	.xword	0x98631963ac7105f4
	.xword	0x03df9651dd804492
	.xword	0x95c030a692d07ab1
	.xword	0xede4e555e070944a
	.xword	0x05797fc488332b94
	.xword	0x97f1451329bbaccc
	.xword	0x2e597a2841b9f4d4
	.xword	0x7543bd4b6b3391c1
	.xword	0x1fc05c05749cbb35
	.xword	0x20e5e7bd207230ff
	.xword	0xf4f8fa811b4549e1
	.xword	0x0e2fc15b5e779d44
	.xword	0x64b7664e8cfdedb6
	.xword	0x5608c9e24ab23676
	.xword	0xa3794d44be081028
	.xword	0x524b5c89169b3ad6
	.xword	0x1c9fc844673cdb8f
	.xword	0x8d95e5337f696bdf
	.xword	0xf58a899ca0c106a7
	.xword	0xc0082a2f2c5aaac2
	.xword	0x11d6fe4d8126887d
	.xword	0x0e5336a2b19d0e0e
	.xword	0x9dcf743a5d3eae78
	.xword	0x2b95b3fa83672e72
	.xword	0x2855d3e0a662ba71
	.xword	0xca973ffab0b19ee3
	.xword	0x671d74c869223939
	.xword	0x95e89da2653550d8
	.xword	0x1bb8842e40daf5b8
	.xword	0x9d013548d7bd3bfa
	.xword	0x80c7f1765ff6a158
	.xword	0xc19b4caeb93813bd
	.xword	0xbfb2fbfe3b290b71
	.xword	0x40b3ab885c7eedcc
	.xword	0x3aa65472e48761e4
	.xword	0xc74dc5b6dae223bb
	.xword	0xfdae5a19eb67f513
	.xword	0xaaed6028a9a6fe02
	.xword	0x559f3ec33bcca658
	.xword	0xe9e996ff7e974235
	.xword	0x1d137dbde17270e2
	.xword	0x291d1c5bcaaaf2f8
	.xword	0x83cf64c89bdf0b98
	.xword	0x4fc5a3502be3f1ea
	.xword	0xb5fb53832ebb9867
	.xword	0x6e8bb4900d1e9595
	.xword	0xf21ca5893431d0f0
	.xword	0xc825c48370f00f59
	.xword	0xafb1e6a126ca8a01
	.xword	0xda31020cb2be3ed9
	.xword	0x4023e94e8ad82db4
	.xword	0x64f014b1da5aeec8
	.xword	0xfa57eaaa9c6f62ad
	.xword	0x030b5187f718fd10
	.xword	0xe2e66777cbc187e7
	.xword	0xab2e83f862796491
	.xword	0x25f914455247a29c
	.xword	0x61b0ab442ee711b7
	.xword	0x54227d00e6fe1e10
	.xword	0x4f3388fafa2289be
	.xword	0x33fba5bd796654fd
	.xword	0x8f85f8a92711c394
	.xword	0xef1a8d05a822ca79
	.xword	0x1d32ff27def76126
	.xword	0x4014bda83ed41dd4
	.align 0x80000
	.data
data_start_7:

	.xword	0x53c49f45eed8d673
	.xword	0x29abc282adae26f8
	.xword	0x872f9850c793d341
	.xword	0x692caa05abadf684
	.xword	0xc3104e7557de4002
	.xword	0x51c3e979e72766cc
	.xword	0x968e42ef46a7e68a
	.xword	0xd1a40b42b953dd00
	.xword	0xdfde548e662e3eeb
	.xword	0x0026b1e0f16350c6
	.xword	0xff56b7fb02a7485b
	.xword	0x590b6d65fe5072fc
	.xword	0x077ac4ea2ff41dbd
	.xword	0xcee3cb3c952ee655
	.xword	0xab6b9d042b61be5f
	.xword	0xf7e20fa0402c95bb
	.xword	0x2318325d1e64f35a
	.xword	0x59b67227abc67f19
	.xword	0xd9f103fb498f615f
	.xword	0x30721910126e2997
	.xword	0x848b8cf8aa908daf
	.xword	0x30abf00eb7528d35
	.xword	0xba11d869500fe70a
	.xword	0x185213a7ffad8ac9
	.xword	0xac38d1d1981a51d7
	.xword	0x0b50a71d2610e79d
	.xword	0x6cfc05fcdb49a5f7
	.xword	0x978e4a9c28af0cd9
	.xword	0x2fdb23cbb3c6b586
	.xword	0x34cbdfdba929de02
	.xword	0xf27f30b564ea06a5
	.xword	0x670c6a26f3675b35
	.xword	0xb79e5ff115a54ade
	.xword	0xa81e251cc7bf946b
	.xword	0xcca9c64f5739604c
	.xword	0x35ca52f85239987c
	.xword	0xb77f6bc3669f04ae
	.xword	0x0b74e01681bd3e1b
	.xword	0xbd29c0163e76f61e
	.xword	0x87b064ed2166ac80
	.xword	0x61726baf45014d17
	.xword	0x2f078b2a08921b1e
	.xword	0xa5e0b4371631f357
	.xword	0xdd2d75e2c1a80122
	.xword	0xb22782628911378f
	.xword	0xab0a77b4443cfbf6
	.xword	0xba688caca561e443
	.xword	0xb7fe24b4c83bd88d
	.xword	0xa620348a2df596bd
	.xword	0x64277d16d7e69356
	.xword	0xfeb864bc080d823f
	.xword	0xc96c0185bcfc22aa
	.xword	0xbbead9b5814d6b77
	.xword	0x47eefed48b292cc2
	.xword	0x88f1443dc145ece2
	.xword	0x6269d6fe66b3dd30
	.xword	0x62eaf50ddd934ec6
	.xword	0xb68972f4a0cea281
	.xword	0x2ab98c0e49cca2d2
	.xword	0x15afa5315fd53d2c
	.xword	0x0d0da1cb0919e583
	.xword	0x68022b80dd02393f
	.xword	0xeb80d497b7651887
	.xword	0x587237969a9a53dd
	.xword	0x9068396d126722f9
	.xword	0xe49369d3cd75f666
	.xword	0xfcc41b76dc3e5d39
	.xword	0xc93665aed8e6384b
	.xword	0xc0d60f4d53f27246
	.xword	0x6d41734fcab83391
	.xword	0x56d2f3fa9f4c60a1
	.xword	0x58a8575a8fb1fe22
	.xword	0x7cedaca4765adb67
	.xword	0xfd23dff1cdc84d2b
	.xword	0xef4fb912c00390f3
	.xword	0xd1867e7fe323015e
	.xword	0x8a5b02936237e291
	.xword	0x14ed0c8eb474a223
	.xword	0x5e588ed3390cd02a
	.xword	0x5db8c1afc2f91833
	.xword	0x3cb21521a1d78d87
	.xword	0xd2a90ad4d13931a0
	.xword	0xdeabada9b785ad4e
	.xword	0x419534d513564370
	.xword	0x0943c0d7e26bbeb3
	.xword	0xa717a4d20371a38e
	.xword	0xa9aea28f037281ae
	.xword	0xe9be408c390eceab
	.xword	0x7071f929cbf41b84
	.xword	0x08f637416e58b2cd
	.xword	0x0d40cf454ee46f6a
	.xword	0x4ba488b1956b5ebc
	.xword	0xdedcd8a5d7a815e7
	.xword	0xe370aaf6c37cf19c
	.xword	0xc17e004cb38a0fdd
	.xword	0x3cc188a56679460b
	.xword	0x1dba56b886f90cfc
	.xword	0x6b8bcca98945c209
	.xword	0x998cfc580da9a0c0
	.xword	0x7cab2a45f3e65ec3
	.xword	0x665f0a751c0f8887
	.xword	0x6769a5bc23cde5d9
	.xword	0x89e6e0d55ef38fe0
	.xword	0x67d3d88e622c9352
	.xword	0x262461375f51c63b
	.xword	0x5e72522d495747c8
	.xword	0x6ed477534e230b31
	.xword	0x1ca63e7ec63679f6
	.xword	0x7bc900ac09c84bee
	.xword	0xa8385b4f2728c38b
	.xword	0x167a8a69666bf746
	.xword	0xdba01a911fda3212
	.xword	0x06ada1ba565a3c10
	.xword	0xa33abdd695d314cd
	.xword	0x3d773b6e8b89157b
	.xword	0x0e281e3757dcd862
	.xword	0x58d650ebeb2caa11
	.xword	0x66e552abd031f16c
	.xword	0x6e7f564b6e28d34e
	.xword	0xb8cb1e1008981be9
	.xword	0xe5da2493da7ff8b0
	.xword	0x6cfdac85a2a75974
	.xword	0xf0c49136a65c1759
	.xword	0xdd244339dae03dce
	.xword	0x80eaa84c38cbc02f
	.xword	0x7f9e264e652f9e07
	.xword	0x79590058198d625b
	.xword	0x00cae69e10129eaf
	.xword	0x1dcc7b07626e44e1
	.xword	0x3667f53529b7715f
	.xword	0xad286d0bd16a9847
	.xword	0x920781d6b33758e4
	.xword	0x4233ec901d4d09aa
	.xword	0xda1a91fbeac19fc6
	.xword	0x470412dc80279557
	.xword	0xec5fdfd595c5d770
	.xword	0xbf843e47de72636d
	.xword	0x5ce8431fca14bbba
	.xword	0xca71719d722ccd2b
	.xword	0x0df3bdf4915caf73
	.xword	0x8901532058fccd83
	.xword	0x642e37daea8d34da
	.xword	0x1b74e3b5321907ba
	.xword	0xde23b73eec990725
	.xword	0xcb4850c6a2abd740
	.xword	0x58f0c1e6997efd54
	.xword	0xf7f7a256207d091e
	.xword	0x62b1adcaf33120e5
	.xword	0xf8e0dcae1aa3daae
	.xword	0x1a909a00366c513f
	.xword	0xe04001b0d3b5675b
	.xword	0xefe4715af3549ed1
	.xword	0x0e78538a797a6137
	.xword	0x2bb945133fa95d30
	.xword	0xab34fa7dd78e05d0
	.xword	0x57c358c9b5c5b51e
	.xword	0xcc3f2d9d80f78b0d
	.xword	0x6e210e01cf87fd8e
	.xword	0xb32eeca5857e2180
	.xword	0x0dba56f22f554398
	.xword	0x3c45a06e18f4a0a2
	.xword	0x27bd741777ba4ae0
	.xword	0x111ae4850981cdc5
	.xword	0x4ad4c753c4bfc117
	.xword	0xa222d7c81a13d22b
	.xword	0x6f03e5fe8caff860
	.xword	0xb16009cca80bd7b4
	.xword	0xdffb7e3ac8d6d6c5
	.xword	0x43ff263b6dbeb7ed
	.xword	0x2747c8b53e022a46
	.xword	0xa3afb4118b694363
	.xword	0xb371c9651cdb495f
	.xword	0x6e333f7ec49caee1
	.xword	0xbbe707422d9308c4
	.xword	0xcd95891191418fea
	.xword	0x84d35f25677c63a9
	.xword	0xb1cdc76e863a9b32
	.xword	0xd64928ab24f1a86a
	.xword	0xa2d611b5ec25fb86
	.xword	0x85f6047cb04b6167
	.xword	0x7c0f14aa684efb3f
	.xword	0x99052023adb53da1
	.xword	0x89f562179f85d3b9
	.xword	0xad085524a83a1da9
	.xword	0xb2ad12f6975b0d0c
	.xword	0x1b2a83601efbd4a4
	.xword	0xb24ff8ed65f1dc73
	.xword	0xf9a12fed1e3ff326
	.xword	0xd77aecef20c0f5c2
	.xword	0x4321bd923757a624
	.xword	0x2392aea319cfae5a
	.xword	0xc26e7e14169b4b64
	.xword	0x1e767e8ee5b59bb6
	.xword	0xc8174de66f6803d7
	.xword	0x42ec4a357275ff49
	.xword	0x2e5e387bb726b32c
	.xword	0x7ff4d07b2deaafab
	.xword	0x95e665e9d65b07c4
	.xword	0xcf5fb6730ec2b507
	.xword	0x5d8f7b10809364db
	.xword	0x9130ba23e677aec0
	.xword	0xf571f19c04f301be
	.xword	0xf7c53411ba0bc69d
	.xword	0x314b0c9b7b62647a
	.xword	0x48e45462f689e254
	.xword	0x85af6fb16e33db51
	.xword	0x5228c3c6e1cf8000
	.xword	0x93a85823fe956f02
	.xword	0x213f4ea151c8d51f
	.xword	0xb7dd2568b32fa5d5
	.xword	0xe4ec3dd1bb5b84b0
	.xword	0xc7db4846e84bc5fb
	.xword	0xca731144126e0453
	.xword	0x6250d46d8823ab91
	.xword	0x2c79c0aecfe343a0
	.xword	0x61a81a44d046c46c
	.xword	0xd96de3b407b28092
	.xword	0x7f7ba36e7a5ea07b
	.xword	0xde1407edb35a9eba
	.xword	0xcf063a26dad60dda
	.xword	0x40e6e87b3ef2fa2e
	.xword	0xb09562db4f63a26f
	.xword	0x16e826530ee566c9
	.xword	0x06aea05163bcb702
	.xword	0xdc8443f9c89d2eef
	.xword	0xb399ac97d27b6397
	.xword	0xfd0a4e50fe1b65b1
	.xword	0x77b8f91a13dacccd
	.xword	0xf53a10f35d1e9337
	.xword	0x306ffe46f152f0f1
	.xword	0x64eddc8762c09fe8
	.xword	0xa44c65d0c3614946
	.xword	0xda5a9be2102f85be
	.xword	0x0c104d1bccb70019
	.xword	0xff9a1853d7d33844
	.xword	0x626bafbb36540c36
	.xword	0x30510a55de3cc07a
	.xword	0x671f0173c23151b8
	.xword	0xe49888a55e1ba63c
	.xword	0xb520fb8907ab6e44
	.xword	0xd74fd430055d4685
	.xword	0x72cdf1b66b7ddce9
	.xword	0xefc87d742dd62ca2
	.xword	0xb778fd7e7e321b87
	.xword	0xd661b6d70b3983ee
	.xword	0xf1730bbc364ce0bb
	.xword	0xc7fb8908132e3c0f
	.xword	0xdb7dafde5c3a9301
	.xword	0xdf74d077dd1d5f21
	.xword	0x338d27677894691d
	.xword	0x9ca301fc1b7dc48f
	.xword	0x139ac099f534b635
	.xword	0x4e89efffdee447c6
	.xword	0x3c01faff9a46b614
	.xword	0xaaa8bb72a7556bed
	.xword	0x1a4b7bc6b709a950



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
