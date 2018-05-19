// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_39.s
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
   random seed:	857910156
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

	setx 0x6b8bb419ad3af7ba, %g1, %g0
	setx 0x9cce0712274f1862, %g1, %g1
	setx 0x961e85058a7cc758, %g1, %g2
	setx 0x3b1a16247d1094d8, %g1, %g3
	setx 0x442c5e9d41a3648f, %g1, %g4
	setx 0xb0a33a1550bcb093, %g1, %g5
	setx 0x019502352e0e33d2, %g1, %g6
	setx 0xa9e2188f7a3efd24, %g1, %g7
	setx 0x8918575ee0018aeb, %g1, %r16
	setx 0x233f420f5b8d45c6, %g1, %r17
	setx 0xa6f41542660d9d20, %g1, %r18
	setx 0xc9ab609c61e3581a, %g1, %r19
	setx 0x92e30636cc065d1f, %g1, %r20
	setx 0xd2c2c3e0099f4442, %g1, %r21
	setx 0x8538e3268563caa7, %g1, %r22
	setx 0xf5ab6c9339a77530, %g1, %r23
	setx 0x828c525a9952b6e1, %g1, %r24
	setx 0x928a71c65194a3ad, %g1, %r25
	setx 0x3fe6b4b487c643f5, %g1, %r26
	setx 0x3a1ac134dd00b4d7, %g1, %r27
	setx 0x3a44e74c5b4367f6, %g1, %r28
	setx 0x250366ebbe5f7b4e, %g1, %r29
	setx 0xb62a2ccc0ad30735, %g1, %r30
	setx 0xf96e542c27fcf537, %g1, %r31
	save
	setx 0x31d54e716c977725, %g1, %r16
	setx 0x0c416a46f3fb0027, %g1, %r17
	setx 0x5b513021a168fe7d, %g1, %r18
	setx 0x495255b642bd6d0b, %g1, %r19
	setx 0x92e64da9625affce, %g1, %r20
	setx 0xf64dbb5b7c7ee5e5, %g1, %r21
	setx 0x36910ddd47f28902, %g1, %r22
	setx 0x32c0aa99918ff86f, %g1, %r23
	setx 0x5634b8ff3604649c, %g1, %r24
	setx 0x7e78b5bd4e12fd47, %g1, %r25
	setx 0x5d122e2ab2da2293, %g1, %r26
	setx 0xb9b351253c6afae7, %g1, %r27
	setx 0x3b38d6625198e79e, %g1, %r28
	setx 0x67c785f034be70ec, %g1, %r29
	setx 0x6f750180b5b90772, %g1, %r30
	setx 0xebb470449911ab3d, %g1, %r31
	save
	setx 0x00e62659021bbb84, %g1, %r16
	setx 0xbdcc011a88aa777a, %g1, %r17
	setx 0xea02ef4aae7d6c27, %g1, %r18
	setx 0x6860874952e149f5, %g1, %r19
	setx 0x531d570def0d4e20, %g1, %r20
	setx 0x53a66e1510fef45a, %g1, %r21
	setx 0x0acc40ab371084d9, %g1, %r22
	setx 0xf3b9465f0a39626d, %g1, %r23
	setx 0x8e376e753741995b, %g1, %r24
	setx 0x93f025b0479cb46d, %g1, %r25
	setx 0x8b43d42bc96e151a, %g1, %r26
	setx 0x1bdebb57001452ac, %g1, %r27
	setx 0x1ca78c43eacf0383, %g1, %r28
	setx 0xf29a2fc4d12f417d, %g1, %r29
	setx 0x9072ffbafbaa3584, %g1, %r30
	setx 0xadb3f60f04d0b1f4, %g1, %r31
	save
	setx 0x6d0a22d8e85801a7, %g1, %r16
	setx 0x74b73d16f72bcb40, %g1, %r17
	setx 0x4a32e6457d5b0d99, %g1, %r18
	setx 0x5861422c72bc735d, %g1, %r19
	setx 0xa6c8ec4be454be2e, %g1, %r20
	setx 0x3be69bb72622f3fd, %g1, %r21
	setx 0xe123a1da4cfcc687, %g1, %r22
	setx 0xd6c021c4c4ce334b, %g1, %r23
	setx 0x7abc91a1a5a7da2d, %g1, %r24
	setx 0x60ab7ea75383f77a, %g1, %r25
	setx 0x3e3f701fa9223ab2, %g1, %r26
	setx 0xba7f0c7cfd4ea400, %g1, %r27
	setx 0x37ecedc39d30b55f, %g1, %r28
	setx 0xaf62ad751b7655e4, %g1, %r29
	setx 0xe9f1107ecdec1363, %g1, %r30
	setx 0x0a80c1eab1942764, %g1, %r31
	save
	setx 0x2031f932f270f6a3, %g1, %r16
	setx 0x04eedb585be46327, %g1, %r17
	setx 0xef489062fd5a594c, %g1, %r18
	setx 0xb6ddbab5f34faae8, %g1, %r19
	setx 0x54be5671974863f4, %g1, %r20
	setx 0x970c32e3f52f3c74, %g1, %r21
	setx 0x3f045dea4bbb9feb, %g1, %r22
	setx 0x3087745aa2554c56, %g1, %r23
	setx 0xe94fc775c5dd32e9, %g1, %r24
	setx 0x5ebe179560d5c527, %g1, %r25
	setx 0x5602f5372b47c6ba, %g1, %r26
	setx 0xf3dd48695c69301e, %g1, %r27
	setx 0x2f00881ae6183d4b, %g1, %r28
	setx 0xe38a53f9911407cd, %g1, %r29
	setx 0xbd1cf4b5aba22db8, %g1, %r30
	setx 0xb9e113f4d6cbd6b2, %g1, %r31
	save
	setx 0x773d337f45ebb067, %g1, %r16
	setx 0x6769ab01f9cfbd82, %g1, %r17
	setx 0x353f53b59e3b5ae9, %g1, %r18
	setx 0xf3edf87d004692e7, %g1, %r19
	setx 0x75080dc1b02c9b05, %g1, %r20
	setx 0x1d667e738620410a, %g1, %r21
	setx 0xe1f186d9227f4c8d, %g1, %r22
	setx 0x511f41c6597a1804, %g1, %r23
	setx 0x231b5326952ce8fe, %g1, %r24
	setx 0xf0e4713066cda70b, %g1, %r25
	setx 0x755844e8d9bc7d08, %g1, %r26
	setx 0xa47046f9ecc246a0, %g1, %r27
	setx 0xed4bfcfa48bacc07, %g1, %r28
	setx 0x55d8c34484425db6, %g1, %r29
	setx 0xae7e143688990281, %g1, %r30
	setx 0xc335f5e43e217d57, %g1, %r31
	save
	setx 0x5ee4b0988f86b52d, %g1, %r16
	setx 0x37de91da04965a7b, %g1, %r17
	setx 0x78753741942d8d15, %g1, %r18
	setx 0x3f08d07a2c8839a0, %g1, %r19
	setx 0xcf7d210e871913ed, %g1, %r20
	setx 0xbb7e514af4f64c30, %g1, %r21
	setx 0x2931f969a6424482, %g1, %r22
	setx 0xf7ace5995108e8ae, %g1, %r23
	setx 0xf7738b90dd24382b, %g1, %r24
	setx 0xc090e4c396c117e5, %g1, %r25
	setx 0xba39797aa86dec15, %g1, %r26
	setx 0x6600b33662edda39, %g1, %r27
	setx 0x4307b3ee3ab4281a, %g1, %r28
	setx 0xd2052606cf72fc05, %g1, %r29
	setx 0xbbbbc8c0fd552ff0, %g1, %r30
	setx 0xf0a1d99fbb16d05e, %g1, %r31
	save
	setx 0x37bb6b2efe8ff02f, %g1, %r16
	setx 0xe943e9c0da1af44a, %g1, %r17
	setx 0xc9c063cc1c0664fa, %g1, %r18
	setx 0xa357458678bea08f, %g1, %r19
	setx 0x05f594985f4925a1, %g1, %r20
	setx 0xd59f73c82f1a3a97, %g1, %r21
	setx 0xda334047edd80961, %g1, %r22
	setx 0x81b8fcf39341e449, %g1, %r23
	setx 0xf3e83b0126d30b0b, %g1, %r24
	setx 0xd21cf6cccaa126e9, %g1, %r25
	setx 0x1d4a111f98447abc, %g1, %r26
	setx 0x520262ccb804d3cb, %g1, %r27
	setx 0xe7e0ec38fefab71b, %g1, %r28
	setx 0xef9c276b43c09db1, %g1, %r29
	setx 0x4d5ce9a9a32095c2, %g1, %r30
	setx 0x0b9882e7592e3612, %g1, %r31
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
	setx	0x465b18eb0000cb82, %g1, %r10
	.word 0x839a8000  ! 3: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbde4a17d  ! 5: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e4e06e  ! 7: SAVE_I	save	%r19, 0x0001, %r24
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 22)
	.word 0xb9e421e4  ! 13: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7500000  ! 14: RDPR_TPC	<illegal instruction>
	.word 0x87942138  ! 16: WRPR_TT_I	wrpr	%r16, 0x0138, %tt
	.word 0xb7e521e9  ! 18: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e5202c  ! 19: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e4207e  ! 20: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde5e06d  ! 21: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8d9560c3  ! 24: WRPR_PSTATE_I	wrpr	%r21, 0x00c3, %pstate
	.word 0xb950c000  ! 26: RDPR_TT	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 29: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x7efa9c1500002e0d, %g1, %r10
	.word 0x839a8000  ! 33: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbde420cf  ! 35: SAVE_I	save	%r16, 0x0001, %r30
	setx	0xcb49086c0000efc2, %g1, %r10
	.word 0x839a8000  ! 41: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb3cc000  ! 42: SRA_R	sra 	%r19, %r0, %r29
	setx	0x1ee027ee0000e85b, %g1, %r10
	.word 0x839a8000  ! 44: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbde4213e  ! 47: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbd500000  ! 49: RDPR_TPC	<illegal instruction>
	.word 0xb3e460a8  ! 53: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x8d94e085  ! 56: WRPR_PSTATE_I	wrpr	%r19, 0x0085, %pstate
	.word 0xb9e5602d  ! 59: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x8d94a0c3  ! 62: WRPR_PSTATE_I	wrpr	%r18, 0x00c3, %pstate
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 29)
	.word 0xb5e4e0c8  ! 64: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7480000  ! 67: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	mov	0, %r12
	.word 0xa1930000  ! 71: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb644e1d1  ! 72: ADDC_I	addc 	%r19, 0x01d1, %r27
	.word 0xbc9de055  ! 73: XORcc_I	xorcc 	%r23, 0x0055, %r30
	.word 0xb5e56032  ! 74: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe4a034  ! 76: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde560c0  ! 77: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e560c3  ! 79: SAVE_I	save	%r21, 0x0001, %r26
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 12)
	.word 0xb3e420f9  ! 85: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde5a062  ! 92: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e5a01b  ! 96: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7508000  ! 99: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e5a103  ! 100: SAVE_I	save	%r22, 0x0001, %r24
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 1d)
	mov	0, %r12
	.word 0x8f930000  ! 104: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x85956078  ! 106: WRPR_TSTATE_I	wrpr	%r21, 0x0078, %tstate
	.word 0xb3e520ca  ! 107: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb935f001  ! 108: SRLX_I	srlx	%r23, 0x0001, %r28
	.word 0xb3e4e024  ! 110: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e4203f  ! 111: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e4e0d2  ! 114: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x9194a027  ! 115: WRPR_PIL_I	wrpr	%r18, 0x0027, %pil
	.word 0xb5504000  ! 122: RDPR_TNPC	<illegal instruction>
	.word 0xb1e521ff  ! 125: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e42173  ! 127: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e460b4  ! 131: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e56193  ! 132: SAVE_I	save	%r21, 0x0001, %r25
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 2f)
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 2b)
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, e)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4617a  ! 148: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7504000  ! 149: RDPR_TNPC	<illegal instruction>
	.word 0xbde4a1cc  ! 150: SAVE_I	save	%r18, 0x0001, %r30
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 30)
	.word 0xbbe4a0bf  ! 161: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe4e093  ! 162: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x85942068  ! 163: WRPR_TSTATE_I	wrpr	%r16, 0x0068, %tstate
	setx	0x13c339bb00006c43, %g1, %r10
	.word 0x839a8000  ! 164: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e4e095  ! 171: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe5e060  ! 173: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x91952124  ! 174: WRPR_PIL_I	wrpr	%r20, 0x0124, %pil
	.word 0xbd35c000  ! 179: SRL_R	srl 	%r23, %r0, %r30
	.word 0xb3e4619e  ! 187: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbf500000  ! 191: RDPR_TPC	<illegal instruction>
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 14)
	.word 0xbd480000  ! 193: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb1540000  ! 194: RDPR_GL	<illegal instruction>
	.word 0x8995e098  ! 195: WRPR_TICK_I	wrpr	%r23, 0x0098, %tick
	.word 0x87946164  ! 197: WRPR_TT_I	wrpr	%r17, 0x0164, %tt
	.word 0xb9500000  ! 199: RDPR_TPC	<illegal instruction>
	.word 0xb7e42181  ! 203: SAVE_I	save	%r16, 0x0001, %r27
	setx	data_start_2, %g1, %r17
	.word 0xb751c000  ! 205: RDPR_TL	<illegal instruction>
	.word 0xbd508000  ! 206: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe420ce  ! 208: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde56086  ! 212: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xba9c4000  ! 217: XORcc_R	xorcc 	%r17, %r0, %r29
	.word 0xb1e4a013  ! 222: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e4e121  ! 223: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe4e133  ! 227: SAVE_I	save	%r19, 0x0001, %r31
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 1)
	.word 0xbeb5206b  ! 238: ORNcc_I	orncc 	%r20, 0x006b, %r31
	.word 0xbd51c000  ! 239: RDPR_TL	<illegal instruction>
	.word 0xb5e52109  ! 240: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb01dc000  ! 242: XOR_R	xor 	%r23, %r0, %r24
	.word 0xb350c000  ! 243: RDPR_TT	<illegal instruction>
	.word 0xbbe5e162  ! 248: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e5a017  ! 252: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e5e09d  ! 257: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e561f7  ! 260: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x8395e038  ! 263: WRPR_TNPC_I	wrpr	%r23, 0x0038, %tnpc
	.word 0xb1e56062  ! 264: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e56085  ! 266: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e5e014  ! 268: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb62c4000  ! 278: ANDN_R	andn 	%r17, %r0, %r27
	.word 0xb5e520f4  ! 280: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e56147  ! 285: SAVE_I	save	%r21, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5a096  ! 289: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe5e002  ! 291: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x91952187  ! 294: WRPR_PIL_I	wrpr	%r20, 0x0187, %pil
	.word 0xb1e4e002  ! 295: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e460e0  ! 296: SAVE_I	save	%r17, 0x0001, %r26
	setx	data_start_3, %g1, %r18
	.word 0xbd508000  ! 301: RDPR_TSTATE	<illegal instruction>
	.word 0xbde5e06d  ! 302: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe4a1f6  ! 303: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb52d0000  ! 304: SLL_R	sll 	%r20, %r0, %r26
	.word 0xb9e5e089  ! 305: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e56133  ! 312: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e460e5  ! 313: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e460fb  ! 314: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9349000  ! 316: SRLX_R	srlx	%r18, %r0, %r28
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb7e420d4  ! 323: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e46184  ! 325: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbe1d21cf  ! 329: XOR_I	xor 	%r20, 0x01cf, %r31
	.word 0xbc9461eb  ! 330: ORcc_I	orcc 	%r17, 0x01eb, %r30
	.word 0xb5e5a1b4  ! 332: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde520c4  ! 334: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1520000  ! 338: RDPR_PIL	<illegal instruction>
	.word 0xb1e5a074  ! 339: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde5a05a  ! 340: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe4a095  ! 342: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8794614c  ! 343: WRPR_TT_I	wrpr	%r17, 0x014c, %tt
	.word 0x8395a1a1  ! 344: WRPR_TNPC_I	wrpr	%r22, 0x01a1, %tnpc
	.word 0xb1e5e16c  ! 347: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe56002  ! 349: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e5e071  ! 350: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe5e0f0  ! 356: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe520e8  ! 357: SAVE_I	save	%r20, 0x0001, %r31
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 18)
	.word 0x839461f0  ! 361: WRPR_TNPC_I	wrpr	%r17, 0x01f0, %tnpc
	.word 0xb7e5e0e2  ! 364: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbb540000  ! 367: RDPR_GL	<illegal instruction>
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 19)
	.word 0xb3e5a051  ! 372: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e5a17e  ! 374: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e5217c  ! 375: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb2848000  ! 376: ADDcc_R	addcc 	%r18, %r0, %r25
	.word 0xbbe4a0b8  ! 377: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8395a16c  ! 379: WRPR_TNPC_I	wrpr	%r22, 0x016c, %tnpc
	.word 0xb9e4e1ad  ! 383: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb80dc000  ! 385: AND_R	and 	%r23, %r0, %r28
	setx	data_start_2, %g1, %r18
	.word 0xbde5e158  ! 390: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbb3c0000  ! 391: SRA_R	sra 	%r16, %r0, %r29
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 14)
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 10)
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e5a141  ! 404: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e5e05e  ! 408: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e46005  ! 413: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8d94e1c8  ! 416: WRPR_PSTATE_I	wrpr	%r19, 0x01c8, %pstate
	.word 0xbfe4a08f  ! 417: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e560b8  ! 420: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x87942037  ! 421: WRPR_TT_I	wrpr	%r16, 0x0037, %tt
	.word 0xb28c0000  ! 422: ANDcc_R	andcc 	%r16, %r0, %r25
	.word 0xbbe4a1a2  ! 423: SAVE_I	save	%r18, 0x0001, %r29
	setx	0xe6054f4f00008980, %g1, %r10
	.word 0x819a8000  ! 425: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e520a4  ! 427: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe5e01a  ! 428: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x705475d90000da84, %g1, %r10
	.word 0x839a8000  ! 431: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x879420ec  ! 432: WRPR_TT_I	wrpr	%r16, 0x00ec, %tt
	.word 0xb5345000  ! 434: SRLX_R	srlx	%r17, %r0, %r26
	.word 0xbd50c000  ! 435: RDPR_TT	<illegal instruction>
	.word 0xb5e5a18e  ! 439: SAVE_I	save	%r22, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf500000  ! 441: RDPR_TPC	<illegal instruction>
	.word 0xb9e52002  ! 442: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe52128  ! 443: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb49d0000  ! 447: XORcc_R	xorcc 	%r20, %r0, %r26
	.word 0xb9e52195  ! 449: SAVE_I	save	%r20, 0x0001, %r28
	setx	data_start_5, %g1, %r17
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb3e421b3  ! 459: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e420c6  ! 462: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb334f001  ! 464: SRLX_I	srlx	%r19, 0x0001, %r25
	.word 0xb5e46102  ! 468: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e4615c  ! 470: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbb50c000  ! 473: RDPR_TT	<illegal instruction>
	.word 0xb3e5a13f  ! 476: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde4a085  ! 479: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e4e13c  ! 481: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e46006  ! 482: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1520000  ! 486: RDPR_PIL	rdpr	%pil, %r24
	setx	data_start_6, %g1, %r20
	.word 0x9194606e  ! 488: WRPR_PIL_I	wrpr	%r17, 0x006e, %pil
	.word 0xbb480000  ! 494: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbde4a1ce  ! 495: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e4a1ce  ! 497: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e460b9  ! 502: SAVE_I	save	%r17, 0x0001, %r26
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 36)
	.word 0x8d95a193  ! 505: WRPR_PSTATE_I	wrpr	%r22, 0x0193, %pstate
	.word 0x8194e1c0  ! 506: WRPR_TPC_I	wrpr	%r19, 0x01c0, %tpc
	.word 0xb3e5210f  ! 507: SAVE_I	save	%r20, 0x0001, %r25
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 17)
	.word 0xb9e5e07a  ! 511: SAVE_I	save	%r23, 0x0001, %r28
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 11)
	.word 0xbbe4602c  ! 514: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e4a06d  ! 515: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe5612d  ! 518: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x8d9421bc  ! 519: WRPR_PSTATE_I	wrpr	%r16, 0x01bc, %pstate
	.word 0xb9e56060  ! 520: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e4a168  ! 522: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbf510000  ! 524: RDPR_TICK	<illegal instruction>
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 1)
	.word 0xbfe4207e  ! 531: SAVE_I	save	%r16, 0x0001, %r31
	setx	data_start_1, %g1, %r17
	.word 0xb9e5e04e  ! 536: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb8b48000  ! 537: ORNcc_R	orncc 	%r18, %r0, %r28
	.word 0xb7e56144  ! 540: SAVE_I	save	%r21, 0x0001, %r27
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 12)
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 35)
	.word 0xbaad207c  ! 543: ANDNcc_I	andncc 	%r20, 0x007c, %r29
	.word 0xb7e52089  ! 546: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xba45c000  ! 547: ADDC_R	addc 	%r23, %r0, %r29
	.word 0xb215e047  ! 551: OR_I	or 	%r23, 0x0047, %r25
	.word 0xb9e5a14a  ! 553: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7540000  ! 559: RDPR_GL	<illegal instruction>
	.word 0xb0b44000  ! 562: SUBCcc_R	orncc 	%r17, %r0, %r24
	.word 0xb004c000  ! 564: ADD_R	add 	%r19, %r0, %r24
	.word 0x8394e00f  ! 565: WRPR_TNPC_I	wrpr	%r19, 0x000f, %tnpc
	.word 0xb7540000  ! 569: RDPR_GL	<illegal instruction>
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb1518000  ! 572: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e46185  ! 578: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1520000  ! 580: RDPR_PIL	<illegal instruction>
	.word 0xbfe4a014  ! 591: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbb518000  ! 592: RDPR_PSTATE	<illegal instruction>
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 16)
	setx	0xc1dad7f000002b57, %g1, %r10
	.word 0x839a8000  ! 595: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d94a01c  ! 601: WRPR_PSTATE_I	wrpr	%r18, 0x001c, %pstate
	.word 0xb3e461c3  ! 604: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e4a1e0  ! 605: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x8395204f  ! 607: WRPR_TNPC_I	wrpr	%r20, 0x004f, %tnpc
	.word 0xbe34e0dc  ! 613: SUBC_I	orn 	%r19, 0x00dc, %r31
	.word 0x89942180  ! 614: WRPR_TICK_I	wrpr	%r16, 0x0180, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e521cb  ! 617: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe4618f  ! 619: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8395a067  ! 620: WRPR_TNPC_I	wrpr	%r22, 0x0067, %tnpc
	.word 0xbfe560d3  ! 621: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e521be  ! 622: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e4a1da  ! 623: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e4203d  ! 624: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5520000  ! 625: RDPR_PIL	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 626: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1e420d2  ! 627: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e561c7  ! 630: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb42c200d  ! 633: ANDN_I	andn 	%r16, 0x000d, %r26
	.word 0xbfe46084  ! 634: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbb35a001  ! 635: SRL_I	srl 	%r22, 0x0001, %r29
	.word 0xb9e561f2  ! 638: SAVE_I	save	%r21, 0x0001, %r28
	setx	data_start_7, %g1, %r21
	.word 0xb9e5a0c1  ! 641: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbb540000  ! 644: RDPR_GL	<illegal instruction>
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb12d2001  ! 646: SLL_I	sll 	%r20, 0x0001, %r24
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 37)
	.word 0xb7e560f7  ! 652: SAVE_I	save	%r21, 0x0001, %r27
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 3c)
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e4a0f7  ! 659: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8d95a1f2  ! 660: WRPR_PSTATE_I	wrpr	%r22, 0x01f2, %pstate
	.word 0xb7e4e0a9  ! 661: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde5a1a6  ! 662: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x839460b5  ! 665: WRPR_TNPC_I	wrpr	%r17, 0x00b5, %tnpc
	.word 0xb0a4c000  ! 668: SUBcc_R	subcc 	%r19, %r0, %r24
	.word 0xb8458000  ! 669: ADDC_R	addc 	%r22, %r0, %r28
	.word 0xbfe4603f  ! 670: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbb480000  ! 672: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x859561b8  ! 673: WRPR_TSTATE_I	wrpr	%r21, 0x01b8, %tstate
	setx	0xe09c96df00008e0e, %g1, %r10
	.word 0x819a8000  ! 676: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5504000  ! 680: RDPR_TNPC	<illegal instruction>
	.word 0xb5e5e000  ! 683: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x9195e006  ! 685: WRPR_PIL_I	wrpr	%r23, 0x0006, %pil
	setx	data_start_1, %g1, %r18
	.word 0xb9e4e0cc  ! 690: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9e5a0e6  ! 696: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e5a145  ! 703: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde4a142  ! 704: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbe040000  ! 708: ADD_R	add 	%r16, %r0, %r31
	.word 0xb4344000  ! 710: SUBC_R	orn 	%r17, %r0, %r26
	.word 0x879520ea  ! 712: WRPR_TT_I	wrpr	%r20, 0x00ea, %tt
	.word 0xbbe4a0ad  ! 714: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe52014  ! 717: SAVE_I	save	%r20, 0x0001, %r31
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 2c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e4e0b4  ! 727: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e42191  ! 728: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb20c4000  ! 729: AND_R	and 	%r17, %r0, %r25
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbb35c000  ! 732: SRL_R	srl 	%r23, %r0, %r29
	.word 0xb83de009  ! 734: XNOR_I	xnor 	%r23, 0x0009, %r28
	.word 0xb5e561c8  ! 735: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8795a17e  ! 736: WRPR_TT_I	wrpr	%r22, 0x017e, %tt
	.word 0xb3e46012  ! 738: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe4a105  ! 741: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e5a01f  ! 742: SAVE_I	save	%r22, 0x0001, %r27
	setx	data_start_6, %g1, %r16
	.word 0xb9e46087  ! 750: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7540000  ! 752: RDPR_GL	<illegal instruction>
	.word 0xb3e5a1ec  ! 754: SAVE_I	save	%r22, 0x0001, %r25
	setx	data_start_1, %g1, %r19
	.word 0xb9e4a043  ! 757: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9e5a1e5  ! 763: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1540000  ! 765: RDPR_GL	<illegal instruction>
	.word 0xb7e561de  ! 767: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3480000  ! 770: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8d94600b  ! 773: WRPR_PSTATE_I	wrpr	%r17, 0x000b, %pstate
	.word 0x859521fe  ! 777: WRPR_TSTATE_I	wrpr	%r20, 0x01fe, %tstate
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 27)
	.word 0xb9508000  ! 782: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e5612f  ! 783: SAVE_I	save	%r21, 0x0001, %r28
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb3e4e1e8  ! 786: SAVE_I	save	%r19, 0x0001, %r25
	setx	data_start_4, %g1, %r19
	.word 0xbb500000  ! 791: RDPR_TPC	<illegal instruction>
	.word 0xb1520000  ! 795: RDPR_PIL	<illegal instruction>
	.word 0xbc3d4000  ! 801: XNOR_R	xnor 	%r21, %r0, %r30
	.word 0x8d94a171  ! 803: WRPR_PSTATE_I	wrpr	%r18, 0x0171, %pstate
	.word 0xb7e4e1c8  ! 804: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x9194a0fd  ! 806: WRPR_PIL_I	wrpr	%r18, 0x00fd, %pil
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, d)
	.word 0x8194205a  ! 811: WRPR_TPC_I	wrpr	%r16, 0x005a, %tpc
	.word 0xb3480000  ! 819: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbfe4a1c4  ! 821: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e5e09b  ! 822: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbb520000  ! 825: RDPR_PIL	<illegal instruction>
	.word 0xb1e561ca  ! 829: SAVE_I	save	%r21, 0x0001, %r24
	setx	0xec4105250000f84e, %g1, %r10
	.word 0x819a8000  ! 830: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3e46115  ! 833: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e4614d  ! 836: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb8bd61cc  ! 841: XNORcc_I	xnorcc 	%r21, 0x01cc, %r28
	.word 0xb5e5a047  ! 843: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x919560b7  ! 845: WRPR_PIL_I	wrpr	%r21, 0x00b7, %pil
	.word 0xbbe4207b  ! 846: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e5e11e  ! 847: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e56094  ! 850: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e56076  ! 851: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8794e037  ! 853: WRPR_TT_I	wrpr	%r19, 0x0037, %tt
	.word 0x8195e080  ! 854: WRPR_TPC_I	wrpr	%r23, 0x0080, %tpc
	.word 0xb9e4a1ef  ! 855: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe42092  ! 857: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e5a193  ! 860: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7e4617d  ! 863: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8d95e178  ! 864: WRPR_PSTATE_I	wrpr	%r23, 0x0178, %pstate
	.word 0xbfe561b7  ! 866: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e4e0ff  ! 868: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe5613e  ! 870: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde56065  ! 871: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e5e1c4  ! 872: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe4614b  ! 875: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e56174  ! 880: SAVE_I	save	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8d95e062  ! 883: WRPR_PSTATE_I	wrpr	%r23, 0x0062, %pstate
	.word 0xbbe52114  ! 886: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe5e106  ! 890: SAVE_I	save	%r23, 0x0001, %r31
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 30)
	setx	0x7303fe7b00001e91, %g1, %r10
	.word 0x839a8000  ! 892: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbe3d61bd  ! 897: XNOR_I	xnor 	%r21, 0x01bd, %r31
	.word 0xb5e42157  ! 898: SAVE_I	save	%r16, 0x0001, %r26
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 18)
	.word 0xb7e5a0de  ! 901: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x85956019  ! 902: WRPR_TSTATE_I	wrpr	%r21, 0x0019, %tstate
	.word 0xbde520e8  ! 904: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe4202c  ! 905: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbf643801  ! 912: MOVcc_I	<illegal instruction>
	.word 0xb13cd000  ! 916: SRAX_R	srax	%r19, %r0, %r24
	.word 0xb1e5a016  ! 920: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e4e0f6  ! 928: SAVE_I	save	%r19, 0x0001, %r25
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 39)
	.word 0xbde461ae  ! 934: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe5217e  ! 939: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e421e8  ! 941: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e420ef  ! 942: SAVE_I	save	%r16, 0x0001, %r24
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 17)
	.word 0xbbe4a090  ! 950: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1508000  ! 952: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e5a1bf  ! 955: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1500000  ! 959: RDPR_TPC	<illegal instruction>
	setx	0x7c39029f0000eb5d, %g1, %r10
	.word 0x819a8000  ! 961: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde4a0f2  ! 962: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde561b8  ! 968: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbd508000  ! 969: RDPR_TSTATE	<illegal instruction>
	.word 0x9195e15e  ! 971: WRPR_PIL_I	wrpr	%r23, 0x015e, %pil
	mov	0, %r12
	.word 0x8f930000  ! 974: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xb810d3da0000eade, %g1, %r10
	.word 0x839a8000  ! 975: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7e4e051  ! 978: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe5e077  ! 980: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbd34d000  ! 981: SRLX_R	srlx	%r19, %r0, %r30
	setx	data_start_0, %g1, %r18
	.word 0xb4144000  ! 987: OR_R	or 	%r17, %r0, %r26
	.word 0xbebde0d5  ! 989: XNORcc_I	xnorcc 	%r23, 0x00d5, %r31
	.word 0xbfe52008  ! 991: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe56097  ! 992: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb0340000  ! 993: SUBC_R	orn 	%r16, %r0, %r24
	.word 0xbbe4e0fd  ! 995: SAVE_I	save	%r19, 0x0001, %r29
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
	.word 0xfa2d4000  ! 1: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xff3cc000  ! 2: STDF_R	std	%f31, [%r0, %r19]
	setx	0x9ca5a1b40000ad15, %g1, %r10
	.word 0x839a8000  ! 3: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc3da11a  ! 6: STD_I	std	%r30, [%r22 + 0x011a]
	.word 0xf4750000  ! 10: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xf425a08c  ! 11: STW_I	stw	%r26, [%r22 + 0x008c]
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 11)
	.word 0xb3500000  ! 14: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf73ca147  ! 15: STDF_I	std	%f27, [0x0147, %r18]
	.word 0x879520e8  ! 16: WRPR_TT_I	wrpr	%r20, 0x00e8, %tt
	.word 0xfc2c8000  ! 22: STB_R	stb	%r30, [%r18 + %r0]
	.word 0x8d9520e4  ! 24: WRPR_PSTATE_I	wrpr	%r20, 0x00e4, %pstate
	.word 0xb150c000  ! 26: RDPR_TT	rdpr	%tt, %r24
	mov	2, %r12
	.word 0xa1930000  ! 29: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe2d4000  ! 32: STB_R	stb	%r31, [%r21 + %r0]
	setx	0x5982e19600002ac2, %g1, %r10
	.word 0x839a8000  ! 33: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf634e1c2  ! 37: STH_I	sth	%r27, [%r19 + 0x01c2]
	setx	0x7c637b8c0000691e, %g1, %r10
	.word 0x839a8000  ! 41: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb33c8000  ! 42: SRA_R	sra 	%r18, %r0, %r25
	setx	0x299705db00006b05, %g1, %r10
	.word 0x839a8000  ! 44: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5500000  ! 49: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xfa2dc000  ! 51: STB_R	stb	%r29, [%r23 + %r0]
	.word 0x8d9421a4  ! 56: WRPR_PSTATE_I	wrpr	%r16, 0x01a4, %pstate
	.word 0xfb3da09b  ! 57: STDF_I	std	%f29, [0x009b, %r22]
	.word 0x8d95a1df  ! 62: WRPR_PSTATE_I	wrpr	%r22, 0x01df, %pstate
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, f)
	.word 0xfe2c4000  ! 65: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xb3480000  ! 67: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	mov	1, %r12
	.word 0xa1930000  ! 71: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb84560c9  ! 72: ADDC_I	addc 	%r21, 0x00c9, %r28
	.word 0xbc9d2164  ! 73: XORcc_I	xorcc 	%r20, 0x0164, %r30
	.word 0xfe2cc000  ! 78: STB_R	stb	%r31, [%r19 + %r0]
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 6)
	.word 0xf0350000  ! 89: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xf275c000  ! 90: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xf825e054  ! 93: STW_I	stw	%r28, [%r23 + 0x0054]
	.word 0xbf508000  ! 99: RDPR_TSTATE	rdpr	%tstate, %r31
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 12)
	mov	2, %r12
	.word 0x8f930000  ! 104: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa3c8000  ! 105: STD_R	std	%r29, [%r18 + %r0]
	.word 0x8594e160  ! 106: WRPR_TSTATE_I	wrpr	%r19, 0x0160, %tstate
	.word 0xbf35f001  ! 108: SRLX_I	srlx	%r23, 0x0001, %r31
	.word 0xfa758000  ! 112: STX_R	stx	%r29, [%r22 + %r0]
	.word 0x919560e7  ! 115: WRPR_PIL_I	wrpr	%r21, 0x00e7, %pil
	.word 0xfc24e0b2  ! 118: STW_I	stw	%r30, [%r19 + 0x00b2]
	.word 0xf82ce19e  ! 119: STB_I	stb	%r28, [%r19 + 0x019e]
	.word 0xb1504000  ! 122: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xf42d613b  ! 124: STB_I	stb	%r26, [%r21 + 0x013b]
	.word 0xfd3dc000  ! 129: STDF_R	std	%f30, [%r0, %r23]
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 3a)
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, b)
	.word 0xf0752073  ! 141: STX_I	stx	%r24, [%r20 + 0x0073]
	.word 0xf224c000  ! 142: STW_R	stw	%r25, [%r19 + %r0]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 6)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf03c8000  ! 145: STD_R	std	%r24, [%r18 + %r0]
	.word 0xb7504000  ! 149: RDPR_TNPC	<illegal instruction>
	.word 0xfb3da002  ! 151: STDF_I	std	%f29, [0x0002, %r22]
	.word 0xfc2420aa  ! 153: STW_I	stw	%r30, [%r16 + 0x00aa]
	.word 0xf63d21fe  ! 154: STD_I	std	%r27, [%r20 + 0x01fe]
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 35)
	.word 0x859420fd  ! 163: WRPR_TSTATE_I	wrpr	%r16, 0x00fd, %tstate
	setx	0x6b9905b200006fd3, %g1, %r10
	.word 0x839a8000  ! 164: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe3c0000  ! 167: STD_R	std	%r31, [%r16 + %r0]
	.word 0xf0258000  ! 169: STW_R	stw	%r24, [%r22 + %r0]
	.word 0x9194e0dd  ! 174: WRPR_PIL_I	wrpr	%r19, 0x00dd, %pil
	.word 0xf93ce1bf  ! 176: STDF_I	std	%f28, [0x01bf, %r19]
	.word 0xfa750000  ! 177: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xb1350000  ! 179: SRL_R	srl 	%r20, %r0, %r24
	.word 0xf674c000  ! 182: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xfd3d0000  ! 183: STDF_R	std	%f30, [%r0, %r20]
	.word 0xfc3d8000  ! 184: STD_R	std	%r30, [%r22 + %r0]
	.word 0xfe346127  ! 188: STH_I	sth	%r31, [%r17 + 0x0127]
	.word 0xbd500000  ! 191: RDPR_TPC	rdpr	%tpc, %r30
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 31)
	.word 0xb5480000  ! 193: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb7540000  ! 194: RDPR_GL	<illegal instruction>
	.word 0x899420bb  ! 195: WRPR_TICK_I	wrpr	%r16, 0x00bb, %tick
	.word 0x8795e170  ! 197: WRPR_TT_I	wrpr	%r23, 0x0170, %tt
	.word 0xb1500000  ! 199: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf83ca051  ! 202: STD_I	std	%r28, [%r18 + 0x0051]
	setx	data_start_5, %g1, %r17
	.word 0xbd51c000  ! 205: RDPR_TL	<illegal instruction>
	.word 0xbb508000  ! 206: RDPR_TSTATE	<illegal instruction>
	.word 0xfd3c8000  ! 207: STDF_R	std	%f30, [%r0, %r18]
	.word 0xf8744000  ! 209: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xf074c000  ! 211: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xfe3c21a5  ! 213: STD_I	std	%r31, [%r16 + 0x01a5]
	.word 0xf33d612b  ! 216: STDF_I	std	%f25, [0x012b, %r21]
	.word 0xb09c0000  ! 217: XORcc_R	xorcc 	%r16, %r0, %r24
	.word 0xf53c20be  ! 220: STDF_I	std	%f26, [0x00be, %r16]
	.word 0xf235c000  ! 221: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xf8254000  ! 226: STW_R	stw	%r28, [%r21 + %r0]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 2d)
	.word 0xbeb520f2  ! 238: ORNcc_I	orncc 	%r20, 0x00f2, %r31
	.word 0xb551c000  ! 239: RDPR_TL	<illegal instruction>
	.word 0xfc74608f  ! 241: STX_I	stx	%r30, [%r17 + 0x008f]
	.word 0xba1d0000  ! 242: XOR_R	xor 	%r20, %r0, %r29
	.word 0xb950c000  ! 243: RDPR_TT	<illegal instruction>
	.word 0xf835a04a  ! 245: STH_I	sth	%r28, [%r22 + 0x004a]
	.word 0xf23ce015  ! 255: STD_I	std	%r25, [%r19 + 0x0015]
	.word 0xfa3da098  ! 256: STD_I	std	%r29, [%r22 + 0x0098]
	.word 0xf2250000  ! 258: STW_R	stw	%r25, [%r20 + %r0]
	.word 0x8395e085  ! 263: WRPR_TNPC_I	wrpr	%r23, 0x0085, %tnpc
	.word 0xf42521ed  ! 265: STW_I	stw	%r26, [%r20 + 0x01ed]
	.word 0xf62c8000  ! 267: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf0750000  ! 269: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xfd3c4000  ! 270: STDF_R	std	%f30, [%r0, %r17]
	.word 0xff3da076  ! 272: STDF_I	std	%f31, [0x0076, %r22]
	.word 0xff3ca1f2  ! 277: STDF_I	std	%f31, [0x01f2, %r18]
	.word 0xb22c8000  ! 278: ANDN_R	andn 	%r18, %r0, %r25
	.word 0xfe258000  ! 281: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xf625c000  ! 282: STW_R	stw	%r27, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc34e0a3  ! 290: STH_I	sth	%r30, [%r19 + 0x00a3]
	.word 0xf33c4000  ! 292: STDF_R	std	%f25, [%r0, %r17]
	.word 0x91956033  ! 294: WRPR_PIL_I	wrpr	%r21, 0x0033, %pil
	setx	data_start_1, %g1, %r18
	.word 0xfe240000  ! 298: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xb7508000  ! 301: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb72cc000  ! 304: SLL_R	sll 	%r19, %r0, %r27
	.word 0xf674c000  ! 307: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xf225c000  ! 309: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xb9355000  ! 316: SRLX_R	srlx	%r21, %r0, %r28
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, a)
	.word 0xfa2ca0bc  ! 324: STB_I	stb	%r29, [%r18 + 0x00bc]
	.word 0xb41ca0f3  ! 329: XOR_I	xor 	%r18, 0x00f3, %r26
	.word 0xb895e08f  ! 330: ORcc_I	orcc 	%r23, 0x008f, %r28
	.word 0xf274c000  ! 335: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf02c4000  ! 337: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xb7520000  ! 338: RDPR_PIL	<illegal instruction>
	.word 0x8795a074  ! 343: WRPR_TT_I	wrpr	%r22, 0x0074, %tt
	.word 0x8394e157  ! 344: WRPR_TNPC_I	wrpr	%r19, 0x0157, %tnpc
	.word 0xf835a14f  ! 348: STH_I	sth	%r28, [%r22 + 0x014f]
	.word 0xf82d2137  ! 354: STB_I	stb	%r28, [%r20 + 0x0137]
	.word 0xf83da062  ! 355: STD_I	std	%r28, [%r22 + 0x0062]
	.word 0xf43c8000  ! 358: STD_R	std	%r26, [%r18 + %r0]
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 21)
	.word 0x83956022  ! 361: WRPR_TNPC_I	wrpr	%r21, 0x0022, %tnpc
	.word 0xf93d616c  ! 365: STDF_I	std	%f28, [0x016c, %r21]
	.word 0xb3540000  ! 367: RDPR_GL	rdpr	%-, %r25
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 8)
	.word 0xb6858000  ! 376: ADDcc_R	addcc 	%r22, %r0, %r27
	.word 0xf33cc000  ! 378: STDF_R	std	%f25, [%r0, %r19]
	.word 0x839561b9  ! 379: WRPR_TNPC_I	wrpr	%r21, 0x01b9, %tnpc
	.word 0xf83c0000  ! 381: STD_R	std	%r28, [%r16 + %r0]
	.word 0xb00c0000  ! 385: AND_R	and 	%r16, %r0, %r24
	setx	data_start_2, %g1, %r19
	.word 0xb93d0000  ! 391: SRA_R	sra 	%r20, %r0, %r28
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 3f)
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 2e)
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfd3c61da  ! 409: STDF_I	std	%f30, [0x01da, %r17]
	.word 0xf62ce139  ! 410: STB_I	stb	%r27, [%r19 + 0x0139]
	.word 0xfc3ca0f3  ! 412: STD_I	std	%r30, [%r18 + 0x00f3]
	.word 0xff3dc000  ! 414: STDF_R	std	%f31, [%r0, %r23]
	.word 0x8d9561dd  ! 416: WRPR_PSTATE_I	wrpr	%r21, 0x01dd, %pstate
	.word 0xf23ca1b8  ! 418: STD_I	std	%r25, [%r18 + 0x01b8]
	.word 0xf4254000  ! 419: STW_R	stw	%r26, [%r21 + %r0]
	.word 0x87956010  ! 421: WRPR_TT_I	wrpr	%r21, 0x0010, %tt
	.word 0xb68dc000  ! 422: ANDcc_R	andcc 	%r23, %r0, %r27
	.word 0xfe344000  ! 424: STH_R	sth	%r31, [%r17 + %r0]
	setx	0xe988f4cc0000ca96, %g1, %r10
	.word 0x819a8000  ! 425: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa348000  ! 429: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xfa34c000  ! 430: STH_R	sth	%r29, [%r19 + %r0]
	setx	0x3429ae6500008d4b, %g1, %r10
	.word 0x839a8000  ! 431: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8794e185  ! 432: WRPR_TT_I	wrpr	%r19, 0x0185, %tt
	.word 0xfa2c606e  ! 433: STB_I	stb	%r29, [%r17 + 0x006e]
	.word 0xb935d000  ! 434: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xbd50c000  ! 435: RDPR_TT	rdpr	%tt, %r30
	.word 0xf02c8000  ! 437: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xf22d0000  ! 438: STB_R	stb	%r25, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1500000  ! 441: RDPR_TPC	<illegal instruction>
	.word 0xf82460e3  ! 444: STW_I	stw	%r28, [%r17 + 0x00e3]
	.word 0xf73d0000  ! 446: STDF_R	std	%f27, [%r0, %r20]
	.word 0xbe9d0000  ! 447: XORcc_R	xorcc 	%r20, %r0, %r31
	.word 0xf43c8000  ! 448: STD_R	std	%r26, [%r18 + %r0]
	.word 0xff3c6087  ! 450: STDF_I	std	%f31, [0x0087, %r17]
	setx	data_start_6, %g1, %r21
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 23)
	.word 0xf224207d  ! 456: STW_I	stw	%r25, [%r16 + 0x007d]
	.word 0xfc3d0000  ! 457: STD_R	std	%r30, [%r20 + %r0]
	.word 0xf82421ff  ! 460: STW_I	stw	%r28, [%r16 + 0x01ff]
	.word 0xb1343001  ! 464: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xf13de1cf  ! 465: STDF_I	std	%f24, [0x01cf, %r23]
	.word 0xf824e199  ! 471: STW_I	stw	%r28, [%r19 + 0x0199]
	.word 0xb550c000  ! 473: RDPR_TT	<illegal instruction>
	.word 0xf93ca090  ! 483: STDF_I	std	%f28, [0x0090, %r18]
	.word 0xb3520000  ! 486: RDPR_PIL	<illegal instruction>
	setx	data_start_0, %g1, %r22
	.word 0x919520cb  ! 488: WRPR_PIL_I	wrpr	%r20, 0x00cb, %pil
	.word 0xfe744000  ! 490: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xfc24c000  ! 492: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xbd480000  ! 494: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf4258000  ! 496: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xf6240000  ! 498: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xfc2c4000  ! 499: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xfa350000  ! 501: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xf73d4000  ! 503: STDF_R	std	%f27, [%r0, %r21]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, e)
	.word 0x8d9521ce  ! 505: WRPR_PSTATE_I	wrpr	%r20, 0x01ce, %pstate
	.word 0x81942151  ! 506: WRPR_TPC_I	wrpr	%r16, 0x0151, %tpc
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 17)
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 6)
	.word 0x8d942115  ! 519: WRPR_PSTATE_I	wrpr	%r16, 0x0115, %pstate
	.word 0xb9510000  ! 524: RDPR_TICK	rdpr	%tick, %r28
	.word 0xfe3ca1df  ! 527: STD_I	std	%r31, [%r18 + 0x01df]
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfe2ce10c  ! 532: STB_I	stb	%r31, [%r19 + 0x010c]
	setx	data_start_6, %g1, %r19
	.word 0xb4b58000  ! 537: ORNcc_R	orncc 	%r22, %r0, %r26
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 29)
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 20)
	.word 0xbcaca108  ! 543: ANDNcc_I	andncc 	%r18, 0x0108, %r30
	.word 0xb2444000  ! 547: ADDC_R	addc 	%r17, %r0, %r25
	.word 0xfc3d6195  ! 549: STD_I	std	%r30, [%r21 + 0x0195]
	.word 0xf625c000  ! 550: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xba14a1d2  ! 551: OR_I	or 	%r18, 0x01d2, %r29
	.word 0xbf540000  ! 559: RDPR_GL	<illegal instruction>
	.word 0xf0752121  ! 560: STX_I	stx	%r24, [%r20 + 0x0121]
	.word 0xfc3ce008  ! 561: STD_I	std	%r30, [%r19 + 0x0008]
	.word 0xbcb40000  ! 562: SUBCcc_R	orncc 	%r16, %r0, %r30
	.word 0xb0040000  ! 564: ADD_R	add 	%r16, %r0, %r24
	.word 0x8394e051  ! 565: WRPR_TNPC_I	wrpr	%r19, 0x0051, %tnpc
	.word 0xb3540000  ! 569: RDPR_GL	rdpr	%-, %r25
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 1f)
	.word 0xb1518000  ! 572: RDPR_PSTATE	<illegal instruction>
	.word 0xf43d21b9  ! 573: STD_I	std	%r26, [%r20 + 0x01b9]
	.word 0xf6252017  ! 575: STW_I	stw	%r27, [%r20 + 0x0017]
	.word 0xbd520000  ! 580: RDPR_PIL	<illegal instruction>
	.word 0xf22dc000  ! 581: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xf43de095  ! 582: STD_I	std	%r26, [%r23 + 0x0095]
	.word 0xfe2d0000  ! 585: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xbf518000  ! 592: RDPR_PSTATE	<illegal instruction>
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 31)
	setx	0xe51daa220000cf84, %g1, %r10
	.word 0x839a8000  ! 595: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d9560da  ! 601: WRPR_PSTATE_I	wrpr	%r21, 0x00da, %pstate
	.word 0x8395a041  ! 607: WRPR_TNPC_I	wrpr	%r22, 0x0041, %tnpc
	.word 0xbe35a0fd  ! 613: SUBC_I	orn 	%r22, 0x00fd, %r31
	.word 0x8994e117  ! 614: WRPR_TICK_I	wrpr	%r19, 0x0117, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8394a021  ! 620: WRPR_TNPC_I	wrpr	%r18, 0x0021, %tnpc
	.word 0xb3520000  ! 625: RDPR_PIL	rdpr	%pil, %r25
	mov	2, %r12
	.word 0xa1930000  ! 626: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf2342061  ! 628: STH_I	sth	%r25, [%r16 + 0x0061]
	.word 0xb82d619f  ! 633: ANDN_I	andn 	%r21, 0x019f, %r28
	.word 0xb7346001  ! 635: SRL_I	srl 	%r17, 0x0001, %r27
	setx	data_start_4, %g1, %r21
	.word 0xf2354000  ! 640: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xf83c6085  ! 642: STD_I	std	%r28, [%r17 + 0x0085]
	.word 0xbb540000  ! 644: RDPR_GL	rdpr	%-, %r29
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 3f)
	.word 0xb32c6001  ! 646: SLL_I	sll 	%r17, 0x0001, %r25
	.word 0xf63561c4  ! 647: STH_I	sth	%r27, [%r21 + 0x01c4]
	.word 0xf33d6159  ! 649: STDF_I	std	%f25, [0x0159, %r21]
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfc3420d9  ! 651: STH_I	sth	%r30, [%r16 + 0x00d9]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 22)
	.word 0xf62c8000  ! 656: STB_R	stb	%r27, [%r18 + %r0]
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfc344000  ! 658: STH_R	sth	%r30, [%r17 + %r0]
	.word 0x8d95e0a6  ! 660: WRPR_PSTATE_I	wrpr	%r23, 0x00a6, %pstate
	.word 0x839460ca  ! 665: WRPR_TNPC_I	wrpr	%r17, 0x00ca, %tnpc
	.word 0xf03c8000  ! 666: STD_R	std	%r24, [%r18 + %r0]
	.word 0xbea40000  ! 668: SUBcc_R	subcc 	%r16, %r0, %r31
	.word 0xb444c000  ! 669: ADDC_R	addc 	%r19, %r0, %r26
	.word 0xb3480000  ! 672: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8595e04d  ! 673: WRPR_TSTATE_I	wrpr	%r23, 0x004d, %tstate
	.word 0xf02d61b8  ! 674: STB_I	stb	%r24, [%r21 + 0x01b8]
	.word 0xf03dc000  ! 675: STD_R	std	%r24, [%r23 + %r0]
	setx	0xf98b27e100001c0d, %g1, %r10
	.word 0x819a8000  ! 676: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf034e0bc  ! 677: STH_I	sth	%r24, [%r19 + 0x00bc]
	.word 0xfe250000  ! 678: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xf73ca03c  ! 679: STDF_I	std	%f27, [0x003c, %r18]
	.word 0xbb504000  ! 680: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xfe34a025  ! 681: STH_I	sth	%r31, [%r18 + 0x0025]
	.word 0xf635a06e  ! 682: STH_I	sth	%r27, [%r22 + 0x006e]
	.word 0xf03de0d8  ! 684: STD_I	std	%r24, [%r23 + 0x00d8]
	.word 0x9195613d  ! 685: WRPR_PIL_I	wrpr	%r21, 0x013d, %pil
	setx	data_start_7, %g1, %r16
	.word 0xf42d20d9  ! 693: STB_I	stb	%r26, [%r20 + 0x00d9]
	.word 0xfc24a1cb  ! 699: STW_I	stw	%r30, [%r18 + 0x01cb]
	.word 0xf62cc000  ! 700: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xf42d60f8  ! 701: STB_I	stb	%r26, [%r21 + 0x00f8]
	.word 0xfc34c000  ! 702: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xf53d0000  ! 706: STDF_R	std	%f26, [%r0, %r20]
	.word 0xb8040000  ! 708: ADD_R	add 	%r16, %r0, %r28
	.word 0xf2252182  ! 709: STW_I	stw	%r25, [%r20 + 0x0182]
	.word 0xb8350000  ! 710: SUBC_R	orn 	%r20, %r0, %r28
	.word 0x8794e1df  ! 712: WRPR_TT_I	wrpr	%r19, 0x01df, %tt
	.word 0xfe242140  ! 715: STW_I	stw	%r31, [%r16 + 0x0140]
	.word 0xf035a044  ! 716: STH_I	sth	%r24, [%r22 + 0x0044]
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 0)
	.word 0xbc0d8000  ! 729: AND_R	and 	%r22, %r0, %r30
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 11)
	.word 0xbd34c000  ! 732: SRL_R	srl 	%r19, %r0, %r30
	.word 0xb23ca056  ! 734: XNOR_I	xnor 	%r18, 0x0056, %r25
	.word 0x8795e0a5  ! 736: WRPR_TT_I	wrpr	%r23, 0x00a5, %tt
	.word 0xf13dc000  ! 744: STDF_R	std	%f24, [%r0, %r23]
	setx	data_start_7, %g1, %r21
	.word 0xfc24e0cf  ! 748: STW_I	stw	%r30, [%r19 + 0x00cf]
	.word 0xbd540000  ! 752: RDPR_GL	rdpr	%-, %r30
	.word 0xf43c4000  ! 753: STD_R	std	%r26, [%r17 + %r0]
	setx	data_start_6, %g1, %r21
	.word 0xf02c4000  ! 761: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xbd540000  ! 765: RDPR_GL	<illegal instruction>
	.word 0xfe2ce0ea  ! 769: STB_I	stb	%r31, [%r19 + 0x00ea]
	.word 0xbb480000  ! 770: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf4256042  ! 772: STW_I	stw	%r26, [%r21 + 0x0042]
	.word 0x8d942027  ! 773: WRPR_PSTATE_I	wrpr	%r16, 0x0027, %pstate
	.word 0xff3d61da  ! 776: STDF_I	std	%f31, [0x01da, %r21]
	.word 0x8594e048  ! 777: WRPR_TSTATE_I	wrpr	%r19, 0x0048, %tstate
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfa35610c  ! 779: STH_I	sth	%r29, [%r21 + 0x010c]
	.word 0xf03421a2  ! 781: STH_I	sth	%r24, [%r16 + 0x01a2]
	.word 0xb3508000  ! 782: RDPR_TSTATE	rdpr	%tstate, %r25
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 33)
	.word 0xf2740000  ! 787: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf83ca018  ! 788: STD_I	std	%r28, [%r18 + 0x0018]
	setx	data_start_0, %g1, %r23
	.word 0xbb500000  ! 791: RDPR_TPC	<illegal instruction>
	.word 0xb3520000  ! 795: RDPR_PIL	<illegal instruction>
	.word 0xf2256185  ! 796: STW_I	stw	%r25, [%r21 + 0x0185]
	.word 0xfe250000  ! 798: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xb43c0000  ! 801: XNOR_R	xnor 	%r16, %r0, %r26
	.word 0x8d95203f  ! 803: WRPR_PSTATE_I	wrpr	%r20, 0x003f, %pstate
	.word 0x9195209b  ! 806: WRPR_PIL_I	wrpr	%r20, 0x009b, %pil
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 14)
	.word 0xfa2da033  ! 809: STB_I	stb	%r29, [%r22 + 0x0033]
	.word 0xfc75a138  ! 810: STX_I	stx	%r30, [%r22 + 0x0138]
	.word 0x8194a137  ! 811: WRPR_TPC_I	wrpr	%r18, 0x0137, %tpc
	.word 0xf62561f9  ! 817: STW_I	stw	%r27, [%r21 + 0x01f9]
	.word 0xb7480000  ! 819: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf8350000  ! 820: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xfa75e1a3  ! 824: STX_I	stx	%r29, [%r23 + 0x01a3]
	.word 0xb9520000  ! 825: RDPR_PIL	<illegal instruction>
	.word 0xf22cc000  ! 827: STB_R	stb	%r25, [%r19 + %r0]
	setx	0x70ab53af0000be58, %g1, %r10
	.word 0x819a8000  ! 830: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf875c000  ! 832: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xbabde108  ! 841: XNORcc_I	xnorcc 	%r23, 0x0108, %r29
	.word 0x9195a042  ! 845: WRPR_PIL_I	wrpr	%r22, 0x0042, %pil
	.word 0xf0758000  ! 848: STX_R	stx	%r24, [%r22 + %r0]
	.word 0x879421dd  ! 853: WRPR_TT_I	wrpr	%r16, 0x01dd, %tt
	.word 0x81946076  ! 854: WRPR_TPC_I	wrpr	%r17, 0x0076, %tpc
	.word 0x8d9561c7  ! 864: WRPR_PSTATE_I	wrpr	%r21, 0x01c7, %pstate
	.word 0xf63d619f  ! 873: STD_I	std	%r27, [%r21 + 0x019f]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf43ce1b9  ! 882: STD_I	std	%r26, [%r19 + 0x01b9]
	.word 0x8d94a17c  ! 883: WRPR_PSTATE_I	wrpr	%r18, 0x017c, %pstate
	.word 0xf62d0000  ! 884: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xfe35e187  ! 888: STH_I	sth	%r31, [%r23 + 0x0187]
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 38)
	setx	0xeb58ac2300000ecd, %g1, %r10
	.word 0x839a8000  ! 892: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf02460de  ! 895: STW_I	stw	%r24, [%r17 + 0x00de]
	.word 0xfa3c605f  ! 896: STD_I	std	%r29, [%r17 + 0x005f]
	.word 0xbe3d61d0  ! 897: XNOR_I	xnor 	%r21, 0x01d0, %r31
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 10)
	.word 0x8595a10e  ! 902: WRPR_TSTATE_I	wrpr	%r22, 0x010e, %tstate
	.word 0xfb3d2098  ! 903: STDF_I	std	%f29, [0x0098, %r20]
	.word 0xf8250000  ! 906: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf675216f  ! 908: STX_I	stx	%r27, [%r20 + 0x016f]
	.word 0xbf643801  ! 912: MOVcc_I	<illegal instruction>
	.word 0xf0242146  ! 915: STW_I	stw	%r24, [%r16 + 0x0146]
	.word 0xb73dd000  ! 916: SRAX_R	srax	%r23, %r0, %r27
	.word 0xf13c61a9  ! 917: STDF_I	std	%f24, [0x01a9, %r17]
	.word 0xfc250000  ! 919: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf62c4000  ! 921: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xfe758000  ! 923: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xf0344000  ! 927: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xf0342133  ! 929: STH_I	sth	%r24, [%r16 + 0x0133]
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 34)
	.word 0xf234c000  ! 932: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xf63d4000  ! 938: STD_R	std	%r27, [%r21 + %r0]
	.word 0xfa2cc000  ! 945: STB_R	stb	%r29, [%r19 + %r0]
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 1)
	.word 0xf83d215a  ! 947: STD_I	std	%r28, [%r20 + 0x015a]
	.word 0xfa2c0000  ! 948: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xb5508000  ! 952: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xfc2dc000  ! 958: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xb5500000  ! 959: RDPR_TPC	<illegal instruction>
	.word 0xfb3c4000  ! 960: STDF_R	std	%f29, [%r0, %r17]
	setx	0x8f5025840000cc11, %g1, %r10
	.word 0x819a8000  ! 961: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf53dc000  ! 965: STDF_R	std	%f26, [%r0, %r23]
	.word 0xb1508000  ! 969: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x9195e1fa  ! 971: WRPR_PIL_I	wrpr	%r23, 0x01fa, %pil
	.word 0xfd3de1bf  ! 972: STDF_I	std	%f30, [0x01bf, %r23]
	mov	1, %r12
	.word 0x8f930000  ! 974: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xb91334580000eb83, %g1, %r10
	.word 0x839a8000  ! 975: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf43c8000  ! 977: STD_R	std	%r26, [%r18 + %r0]
	.word 0xbb349000  ! 981: SRLX_R	srlx	%r18, %r0, %r29
	setx	data_start_2, %g1, %r16
	.word 0xf62cc000  ! 986: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xb6150000  ! 987: OR_R	or 	%r20, %r0, %r27
	.word 0xf43c4000  ! 988: STD_R	std	%r26, [%r17 + %r0]
	.word 0xb8bca19b  ! 989: XNORcc_I	xnorcc 	%r18, 0x019b, %r28
	.word 0xfa3ca01a  ! 990: STD_I	std	%r29, [%r18 + 0x001a]
	.word 0xbc354000  ! 993: SUBC_R	orn 	%r21, %r0, %r30
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
	setx	0x666839a0000089da, %g1, %r10
	.word 0x839a8000  ! 3: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 11)
	.word 0xb5500000  ! 14: RDPR_TPC	<illegal instruction>
	.word 0x8794e0cc  ! 16: WRPR_TT_I	wrpr	%r19, 0x00cc, %tt
	.word 0xf31d4000  ! 17: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0x8d94e0f8  ! 24: WRPR_PSTATE_I	wrpr	%r19, 0x00f8, %pstate
	.word 0xf41d8000  ! 25: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0xb150c000  ! 26: RDPR_TT	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 29: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf45da072  ! 31: LDX_I	ldx	[%r22 + 0x0072], %r26
	setx	0x358b141f0000aa4f, %g1, %r10
	.word 0x839a8000  ! 33: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe4c60fd  ! 40: LDSB_I	ldsb	[%r17 + 0x00fd], %r31
	setx	0x27b6c85d00000910, %g1, %r10
	.word 0x839a8000  ! 41: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb53d0000  ! 42: SRA_R	sra 	%r20, %r0, %r26
	.word 0xf25d213e  ! 43: LDX_I	ldx	[%r20 + 0x013e], %r25
	setx	0x823c393c00000a88, %g1, %r10
	.word 0x839a8000  ! 44: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf414a044  ! 46: LDUH_I	lduh	[%r18 + 0x0044], %r26
	.word 0xb5500000  ! 49: RDPR_TPC	<illegal instruction>
	.word 0xfc452087  ! 50: LDSW_I	ldsw	[%r20 + 0x0087], %r30
	.word 0xfa0ce075  ! 55: LDUB_I	ldub	[%r19 + 0x0075], %r29
	.word 0x8d9520ef  ! 56: WRPR_PSTATE_I	wrpr	%r20, 0x00ef, %pstate
	.word 0xff1c8000  ! 61: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0x8d95e0a9  ! 62: WRPR_PSTATE_I	wrpr	%r23, 0x00a9, %pstate
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 2b)
	.word 0xb5480000  ! 67: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfa0461b6  ! 70: LDUW_I	lduw	[%r17 + 0x01b6], %r29
	mov	2, %r12
	.word 0xa1930000  ! 71: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb445a1ff  ! 72: ADDC_I	addc 	%r22, 0x01ff, %r26
	.word 0xb49ce1f4  ! 73: XORcc_I	xorcc 	%r19, 0x01f4, %r26
	.word 0xf804a1c5  ! 80: LDUW_I	lduw	[%r18 + 0x01c5], %r28
	.word 0xf71dc000  ! 81: LDDF_R	ldd	[%r23, %r0], %f27
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 0)
	.word 0xfc5c8000  ! 87: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xf84d0000  ! 88: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0xf21d8000  ! 94: LDD_R	ldd	[%r22 + %r0], %r25
	.word 0xb3508000  ! 99: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xf2044000  ! 101: LDUW_R	lduw	[%r17 + %r0], %r25
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 25)
	mov	2, %r12
	.word 0x8f930000  ! 104: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8594613a  ! 106: WRPR_TSTATE_I	wrpr	%r17, 0x013a, %tstate
	.word 0xbb35b001  ! 108: SRLX_I	srlx	%r22, 0x0001, %r29
	.word 0x9194e0c2  ! 115: WRPR_PIL_I	wrpr	%r19, 0x00c2, %pil
	.word 0xf445e131  ! 117: LDSW_I	ldsw	[%r23 + 0x0131], %r26
	.word 0xf214e1ce  ! 121: LDUH_I	lduh	[%r19 + 0x01ce], %r25
	.word 0xb5504000  ! 122: RDPR_TNPC	<illegal instruction>
	.word 0xf05c4000  ! 126: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0xfa140000  ! 128: LDUH_R	lduh	[%r16 + %r0], %r29
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 36)
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 23)
	.word 0xf84d20f3  ! 138: LDSB_I	ldsb	[%r20 + 0x00f3], %r28
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 36)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2056147  ! 146: LDUW_I	lduw	[%r21 + 0x0147], %r25
	.word 0xfa5d6111  ! 147: LDX_I	ldx	[%r21 + 0x0111], %r29
	.word 0xbb504000  ! 149: RDPR_TNPC	<illegal instruction>
	.word 0xf214e14d  ! 152: LDUH_I	lduh	[%r19 + 0x014d], %r25
	.word 0xf01c6197  ! 155: LDD_I	ldd	[%r17 + 0x0197], %r24
	.word 0xf2446181  ! 156: LDSW_I	ldsw	[%r17 + 0x0181], %r25
	.word 0xf814c000  ! 157: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xf40c8000  ! 158: LDUB_R	ldub	[%r18 + %r0], %r26
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 36)
	.word 0x8595e12d  ! 163: WRPR_TSTATE_I	wrpr	%r23, 0x012d, %tstate
	setx	0x5e48853f00003f16, %g1, %r10
	.word 0x839a8000  ! 164: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc04e123  ! 165: LDUW_I	lduw	[%r19 + 0x0123], %r30
	.word 0xf11c61e3  ! 170: LDDF_I	ldd	[%r17, 0x01e3], %f24
	.word 0x9195e096  ! 174: WRPR_PIL_I	wrpr	%r23, 0x0096, %pil
	.word 0xf71c201f  ! 175: LDDF_I	ldd	[%r16, 0x001f], %f27
	.word 0xb5344000  ! 179: SRL_R	srl 	%r17, %r0, %r26
	.word 0xf04c6095  ! 180: LDSB_I	ldsb	[%r17 + 0x0095], %r24
	.word 0xf80dc000  ! 181: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xfb1c4000  ! 185: LDDF_R	ldd	[%r17, %r0], %f29
	.word 0xf0058000  ! 186: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xbf500000  ! 191: RDPR_TPC	<illegal instruction>
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 28)
	.word 0xb1480000  ! 193: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbf540000  ! 194: RDPR_GL	<illegal instruction>
	.word 0x8994a19d  ! 195: WRPR_TICK_I	wrpr	%r18, 0x019d, %tick
	.word 0x8794a0ef  ! 197: WRPR_TT_I	wrpr	%r18, 0x00ef, %tt
	.word 0xb9500000  ! 199: RDPR_TPC	<illegal instruction>
	setx	data_start_0, %g1, %r18
	.word 0xb151c000  ! 205: RDPR_TL	<illegal instruction>
	.word 0xb9508000  ! 206: RDPR_TSTATE	<illegal instruction>
	.word 0xfc15611a  ! 210: LDUH_I	lduh	[%r21 + 0x011a], %r30
	.word 0xf65421cf  ! 214: LDSH_I	ldsh	[%r16 + 0x01cf], %r27
	.word 0xf05dc000  ! 215: LDX_R	ldx	[%r23 + %r0], %r24
	.word 0xbc9d4000  ! 217: XORcc_R	xorcc 	%r21, %r0, %r30
	.word 0xf40421dc  ! 218: LDUW_I	lduw	[%r16 + 0x01dc], %r26
	.word 0xfa5dc000  ! 228: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xf21c0000  ! 229: LDD_R	ldd	[%r16 + %r0], %r25
	.word 0xff1d61a3  ! 230: LDDF_I	ldd	[%r21, 0x01a3], %f31
	.word 0xf05d8000  ! 233: LDX_R	ldx	[%r22 + %r0], %r24
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 30)
	.word 0xf20dc000  ! 237: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xb4b52156  ! 238: ORNcc_I	orncc 	%r20, 0x0156, %r26
	.word 0xb151c000  ! 239: RDPR_TL	<illegal instruction>
	.word 0xb81d0000  ! 242: XOR_R	xor 	%r20, %r0, %r28
	.word 0xbd50c000  ! 243: RDPR_TT	<illegal instruction>
	.word 0xf84de025  ! 244: LDSB_I	ldsb	[%r23 + 0x0025], %r28
	.word 0xff1ce0b6  ! 246: LDDF_I	ldd	[%r19, 0x00b6], %f31
	.word 0xfc444000  ! 249: LDSW_R	ldsw	[%r17 + %r0], %r30
	.word 0xf405c000  ! 251: LDUW_R	lduw	[%r23 + %r0], %r26
	.word 0xf31cc000  ! 254: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xfe4da0b4  ! 261: LDSB_I	ldsb	[%r22 + 0x00b4], %r31
	.word 0x8394212b  ! 263: WRPR_TNPC_I	wrpr	%r16, 0x012b, %tnpc
	.word 0xfa55607f  ! 271: LDSH_I	ldsh	[%r21 + 0x007f], %r29
	.word 0xfa546125  ! 274: LDSH_I	ldsh	[%r17 + 0x0125], %r29
	.word 0xb22c4000  ! 278: ANDN_R	andn 	%r17, %r0, %r25
	.word 0xf31dc000  ! 283: LDDF_R	ldd	[%r23, %r0], %f25
	.word 0xfa4c6069  ! 284: LDSB_I	ldsb	[%r17 + 0x0069], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0544000  ! 288: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0xfc458000  ! 293: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0x9195619e  ! 294: WRPR_PIL_I	wrpr	%r21, 0x019e, %pil
	setx	data_start_5, %g1, %r23
	.word 0xf2148000  ! 299: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xfe1d4000  ! 300: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0xb7508000  ! 301: RDPR_TSTATE	<illegal instruction>
	.word 0xb52c4000  ! 304: SLL_R	sll 	%r17, %r0, %r26
	.word 0xff1d21a4  ! 308: LDDF_I	ldd	[%r20, 0x01a4], %f31
	.word 0xf654a0f3  ! 310: LDSH_I	ldsh	[%r18 + 0x00f3], %r27
	.word 0xfe04c000  ! 311: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xf44c0000  ! 315: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xb7349000  ! 316: SRLX_R	srlx	%r18, %r0, %r27
	.word 0xf254201a  ! 318: LDSH_I	ldsh	[%r16 + 0x001a], %r25
	.word 0xfc1421d6  ! 319: LDUH_I	lduh	[%r16 + 0x01d6], %r30
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 20)
	.word 0xf815e08d  ! 322: LDUH_I	lduh	[%r23 + 0x008d], %r28
	.word 0xf4052010  ! 328: LDUW_I	lduw	[%r20 + 0x0010], %r26
	.word 0xb01d60c6  ! 329: XOR_I	xor 	%r21, 0x00c6, %r24
	.word 0xb094e0f2  ! 330: ORcc_I	orcc 	%r19, 0x00f2, %r24
	.word 0xbd520000  ! 338: RDPR_PIL	<illegal instruction>
	.word 0x8794603b  ! 343: WRPR_TT_I	wrpr	%r17, 0x003b, %tt
	.word 0x8394a1b3  ! 344: WRPR_TNPC_I	wrpr	%r18, 0x01b3, %tnpc
	.word 0xf604e062  ! 346: LDUW_I	lduw	[%r19 + 0x0062], %r27
	.word 0xf45c2105  ! 352: LDX_I	ldx	[%r16 + 0x0105], %r26
	.word 0xfd1d6020  ! 353: LDDF_I	ldd	[%r21, 0x0020], %f30
	.word 0xfe440000  ! 359: LDSW_R	ldsw	[%r16 + %r0], %r31
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 15)
	.word 0x8394205c  ! 361: WRPR_TNPC_I	wrpr	%r16, 0x005c, %tnpc
	.word 0xf205c000  ! 366: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xb7540000  ! 367: RDPR_GL	<illegal instruction>
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, b)
	.word 0xfe154000  ! 369: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xf65d6173  ! 373: LDX_I	ldx	[%r21 + 0x0173], %r27
	.word 0xb4848000  ! 376: ADDcc_R	addcc 	%r18, %r0, %r26
	.word 0x8394e131  ! 379: WRPR_TNPC_I	wrpr	%r19, 0x0131, %tnpc
	.word 0xf64c214b  ! 380: LDSB_I	ldsb	[%r16 + 0x014b], %r27
	.word 0xb00dc000  ! 385: AND_R	and 	%r23, %r0, %r24
	setx	data_start_4, %g1, %r21
	.word 0xf814c000  ! 388: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xf81ce0f8  ! 389: LDD_I	ldd	[%r19 + 0x00f8], %r28
	.word 0xb73d8000  ! 391: SRA_R	sra 	%r22, %r0, %r27
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 22)
	.word 0xfb1d6088  ! 393: LDDF_I	ldd	[%r21, 0x0088], %f29
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 26)
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf854214c  ! 397: LDSH_I	ldsh	[%r16 + 0x014c], %r28
	.word 0xf31c4000  ! 398: LDDF_R	ldd	[%r17, %r0], %f25
	.word 0xfc4cc000  ! 399: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xf91c60a5  ! 402: LDDF_I	ldd	[%r17, 0x00a5], %f28
	.word 0xfe4c0000  ! 405: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xf64ce100  ! 407: LDSB_I	ldsb	[%r19 + 0x0100], %r27
	.word 0x8d94a0d3  ! 416: WRPR_PSTATE_I	wrpr	%r18, 0x00d3, %pstate
	.word 0x8794a043  ! 421: WRPR_TT_I	wrpr	%r18, 0x0043, %tt
	.word 0xbc8c0000  ! 422: ANDcc_R	andcc 	%r16, %r0, %r30
	setx	0xb2f47adc00004cdb, %g1, %r10
	.word 0x819a8000  ! 425: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf85c0000  ! 426: LDX_R	ldx	[%r16 + %r0], %r28
	setx	0x579589c500007bdb, %g1, %r10
	.word 0x839a8000  ! 431: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8795a1d6  ! 432: WRPR_TT_I	wrpr	%r22, 0x01d6, %tt
	.word 0xb5349000  ! 434: SRLX_R	srlx	%r18, %r0, %r26
	.word 0xb750c000  ! 435: RDPR_TT	<illegal instruction>
	.word 0xf80c8000  ! 436: LDUB_R	ldub	[%r18 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9500000  ! 441: RDPR_TPC	<illegal instruction>
	.word 0xb69d8000  ! 447: XORcc_R	xorcc 	%r22, %r0, %r27
	setx	data_start_6, %g1, %r19
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf244c000  ! 461: LDSW_R	ldsw	[%r19 + %r0], %r25
	.word 0xbb34b001  ! 464: SRLX_I	srlx	%r18, 0x0001, %r29
	.word 0xfe140000  ! 467: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0xfc05203a  ! 472: LDUW_I	lduw	[%r20 + 0x003a], %r30
	.word 0xbb50c000  ! 473: RDPR_TT	<illegal instruction>
	.word 0xfc4520e5  ! 474: LDSW_I	ldsw	[%r20 + 0x00e5], %r30
	.word 0xfc44a136  ! 480: LDSW_I	ldsw	[%r18 + 0x0136], %r30
	.word 0xfe4d600e  ! 484: LDSB_I	ldsb	[%r21 + 0x000e], %r31
	.word 0xb1520000  ! 486: RDPR_PIL	<illegal instruction>
	setx	data_start_5, %g1, %r22
	.word 0x91956051  ! 488: WRPR_PIL_I	wrpr	%r21, 0x0051, %pil
	.word 0xfb1d0000  ! 489: LDDF_R	ldd	[%r20, %r0], %f29
	.word 0xf0454000  ! 493: LDSW_R	ldsw	[%r21 + %r0], %r24
	.word 0xbd480000  ! 494: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 2c)
	.word 0x8d95e17d  ! 505: WRPR_PSTATE_I	wrpr	%r23, 0x017d, %pstate
	.word 0x81946031  ! 506: WRPR_TPC_I	wrpr	%r17, 0x0031, %tpc
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 12)
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 7)
	.word 0xf51c4000  ! 513: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0xf40420a8  ! 517: LDUW_I	lduw	[%r16 + 0x00a8], %r26
	.word 0x8d95e138  ! 519: WRPR_PSTATE_I	wrpr	%r23, 0x0138, %pstate
	.word 0xf6454000  ! 523: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xb3510000  ! 524: RDPR_TICK	<illegal instruction>
	.word 0xf41dc000  ! 526: LDD_R	ldd	[%r23 + %r0], %r26
	.word 0xfe0c0000  ! 528: LDUB_R	ldub	[%r16 + %r0], %r31
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 38)
	.word 0xfe0d4000  ! 534: LDUB_R	ldub	[%r21 + %r0], %r31
	setx	data_start_5, %g1, %r19
	.word 0xbab44000  ! 537: ORNcc_R	orncc 	%r17, %r0, %r29
	.word 0xf85461ee  ! 538: LDSH_I	ldsh	[%r17 + 0x01ee], %r28
	.word 0xfa454000  ! 539: LDSW_R	ldsw	[%r21 + %r0], %r29
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, c)
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 9)
	.word 0xb4ada10d  ! 543: ANDNcc_I	andncc 	%r22, 0x010d, %r26
	.word 0xb244c000  ! 547: ADDC_R	addc 	%r19, %r0, %r25
	.word 0xb014e11f  ! 551: OR_I	or 	%r19, 0x011f, %r24
	.word 0xf11dc000  ! 555: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0xf20d0000  ! 556: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xfe540000  ! 558: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xb1540000  ! 559: RDPR_GL	<illegal instruction>
	.word 0xbcb54000  ! 562: SUBCcc_R	orncc 	%r21, %r0, %r30
	.word 0xfd1c0000  ! 563: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0xbe044000  ! 564: ADD_R	add 	%r17, %r0, %r31
	.word 0x839560ce  ! 565: WRPR_TNPC_I	wrpr	%r21, 0x00ce, %tnpc
	.word 0xf254a13a  ! 567: LDSH_I	ldsh	[%r18 + 0x013a], %r25
	.word 0xb1540000  ! 569: RDPR_GL	<illegal instruction>
	.word 0xf85c6078  ! 570: LDX_I	ldx	[%r17 + 0x0078], %r28
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 3)
	.word 0xbf518000  ! 572: RDPR_PSTATE	<illegal instruction>
	.word 0xfc1de0f3  ! 574: LDD_I	ldd	[%r23 + 0x00f3], %r30
	.word 0xf21d205b  ! 576: LDD_I	ldd	[%r20 + 0x005b], %r25
	.word 0xbf520000  ! 580: RDPR_PIL	<illegal instruction>
	.word 0xf055a032  ! 586: LDSH_I	ldsh	[%r22 + 0x0032], %r24
	.word 0xf245c000  ! 590: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xbf518000  ! 592: RDPR_PSTATE	<illegal instruction>
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 39)
	.word 0xf44d2161  ! 594: LDSB_I	ldsb	[%r20 + 0x0161], %r26
	setx	0xadd560eb00009a0f, %g1, %r10
	.word 0x839a8000  ! 595: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe458000  ! 596: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xf414c000  ! 599: LDUH_R	lduh	[%r19 + %r0], %r26
	.word 0x8d952070  ! 601: WRPR_PSTATE_I	wrpr	%r20, 0x0070, %pstate
	.word 0xf64ca186  ! 606: LDSB_I	ldsb	[%r18 + 0x0186], %r27
	.word 0x8395a03f  ! 607: WRPR_TNPC_I	wrpr	%r22, 0x003f, %tnpc
	.word 0xf815a180  ! 608: LDUH_I	lduh	[%r22 + 0x0180], %r28
	.word 0xf11ce047  ! 610: LDDF_I	ldd	[%r19, 0x0047], %f24
	.word 0xbe34e1fb  ! 613: SUBC_I	orn 	%r19, 0x01fb, %r31
	.word 0x8995208d  ! 614: WRPR_TICK_I	wrpr	%r20, 0x008d, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xff1dc000  ! 618: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0x839520b5  ! 620: WRPR_TNPC_I	wrpr	%r20, 0x00b5, %tnpc
	.word 0xb3520000  ! 625: RDPR_PIL	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 626: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe040000  ! 629: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0xfc4d60dd  ! 632: LDSB_I	ldsb	[%r21 + 0x00dd], %r30
	.word 0xbe2da0e6  ! 633: ANDN_I	andn 	%r22, 0x00e6, %r31
	.word 0xb1356001  ! 635: SRL_I	srl 	%r21, 0x0001, %r24
	.word 0xf81cc000  ! 636: LDD_R	ldd	[%r19 + %r0], %r28
	setx	data_start_0, %g1, %r22
	.word 0xb7540000  ! 644: RDPR_GL	<illegal instruction>
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 2d)
	.word 0xbf2c6001  ! 646: SLL_I	sll 	%r17, 0x0001, %r31
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 5)
	.word 0xfe4da0f9  ! 653: LDSB_I	ldsb	[%r22 + 0x00f9], %r31
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 4)
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 24)
	.word 0x8d9521b8  ! 660: WRPR_PSTATE_I	wrpr	%r20, 0x01b8, %pstate
	.word 0xf0048000  ! 663: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0x8395a072  ! 665: WRPR_TNPC_I	wrpr	%r22, 0x0072, %tnpc
	.word 0xb4a40000  ! 668: SUBcc_R	subcc 	%r16, %r0, %r26
	.word 0xb2450000  ! 669: ADDC_R	addc 	%r20, %r0, %r25
	.word 0xf25c8000  ! 671: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xb5480000  ! 672: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x85946115  ! 673: WRPR_TSTATE_I	wrpr	%r17, 0x0115, %tstate
	setx	0xd591dce80000bb44, %g1, %r10
	.word 0x819a8000  ! 676: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb504000  ! 680: RDPR_TNPC	<illegal instruction>
	.word 0x919420d1  ! 685: WRPR_PIL_I	wrpr	%r16, 0x00d1, %pil
	.word 0xf4058000  ! 686: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xfe050000  ! 687: LDUW_R	lduw	[%r20 + %r0], %r31
	setx	data_start_3, %g1, %r23
	.word 0xf4148000  ! 689: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xfa1d61dc  ! 694: LDD_I	ldd	[%r21 + 0x01dc], %r29
	.word 0xfc4cc000  ! 695: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xb8040000  ! 708: ADD_R	add 	%r16, %r0, %r28
	.word 0xb8344000  ! 710: SUBC_R	orn 	%r17, %r0, %r28
	.word 0x8795a19d  ! 712: WRPR_TT_I	wrpr	%r22, 0x019d, %tt
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 3f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf85c8000  ! 721: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xf0444000  ! 723: LDSW_R	ldsw	[%r17 + %r0], %r24
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfe4d0000  ! 725: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xb40c0000  ! 729: AND_R	and 	%r16, %r0, %r26
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 22)
	.word 0xbd350000  ! 732: SRL_R	srl 	%r20, %r0, %r30
	.word 0xb03de1da  ! 734: XNOR_I	xnor 	%r23, 0x01da, %r24
	.word 0x87956063  ! 736: WRPR_TT_I	wrpr	%r21, 0x0063, %tt
	.word 0xf0150000  ! 737: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xfc4d607d  ! 739: LDSB_I	ldsb	[%r21 + 0x007d], %r30
	.word 0xf804611d  ! 740: LDUW_I	lduw	[%r17 + 0x011d], %r28
	.word 0xf8140000  ! 743: LDUH_R	lduh	[%r16 + %r0], %r28
	setx	data_start_7, %g1, %r19
	.word 0xf04dc000  ! 747: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xf8548000  ! 751: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xbd540000  ! 752: RDPR_GL	<illegal instruction>
	setx	data_start_0, %g1, %r21
	.word 0xf45c8000  ! 758: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xfc454000  ! 762: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xbd540000  ! 765: RDPR_GL	<illegal instruction>
	.word 0xfa5ce143  ! 766: LDX_I	ldx	[%r19 + 0x0143], %r29
	.word 0xf85421a1  ! 768: LDSH_I	ldsh	[%r16 + 0x01a1], %r28
	.word 0xb9480000  ! 770: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfa5c2164  ! 771: LDX_I	ldx	[%r16 + 0x0164], %r29
	.word 0x8d95206a  ! 773: WRPR_PSTATE_I	wrpr	%r20, 0x006a, %pstate
	.word 0xf2554000  ! 774: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xf91c6084  ! 775: LDDF_I	ldd	[%r17, 0x0084], %f28
	.word 0x8594e1c7  ! 777: WRPR_TSTATE_I	wrpr	%r19, 0x01c7, %tstate
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 14)
	.word 0xfa4d8000  ! 780: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xb1508000  ! 782: RDPR_TSTATE	<illegal instruction>
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 2b)
	setx	data_start_7, %g1, %r20
	.word 0xb5500000  ! 791: RDPR_TPC	<illegal instruction>
	.word 0xf015c000  ! 792: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xf41c2136  ! 794: LDD_I	ldd	[%r16 + 0x0136], %r26
	.word 0xb3520000  ! 795: RDPR_PIL	<illegal instruction>
	.word 0xf00ce04a  ! 799: LDUB_I	ldub	[%r19 + 0x004a], %r24
	.word 0xbe3c4000  ! 801: XNOR_R	xnor 	%r17, %r0, %r31
	.word 0x8d95e0b3  ! 803: WRPR_PSTATE_I	wrpr	%r23, 0x00b3, %pstate
	.word 0xf71d0000  ! 805: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0x9194205c  ! 806: WRPR_PIL_I	wrpr	%r16, 0x005c, %pil
	.word 0xf6458000  ! 807: LDSW_R	ldsw	[%r22 + %r0], %r27
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 3b)
	.word 0x8195a041  ! 811: WRPR_TPC_I	wrpr	%r22, 0x0041, %tpc
	.word 0xf054612f  ! 812: LDSH_I	ldsh	[%r17 + 0x012f], %r24
	.word 0xf40da1c9  ! 815: LDUB_I	ldub	[%r22 + 0x01c9], %r26
	.word 0xfc14c000  ! 816: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xf11dc000  ! 818: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0xb7480000  ! 819: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf8450000  ! 823: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xbd520000  ! 825: RDPR_PIL	<illegal instruction>
	setx	0x8b35def40000df02, %g1, %r10
	.word 0x819a8000  ! 830: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf01da181  ! 831: LDD_I	ldd	[%r22 + 0x0181], %r24
	.word 0xfc5c0000  ! 834: LDX_R	ldx	[%r16 + %r0], %r30
	.word 0xf4042080  ! 839: LDUW_I	lduw	[%r16 + 0x0080], %r26
	.word 0xbcbce1ff  ! 841: XNORcc_I	xnorcc 	%r19, 0x01ff, %r30
	.word 0xfa448000  ! 844: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0x91942196  ! 845: WRPR_PIL_I	wrpr	%r16, 0x0196, %pil
	.word 0xf8046145  ! 852: LDUW_I	lduw	[%r17 + 0x0145], %r28
	.word 0x8795e128  ! 853: WRPR_TT_I	wrpr	%r23, 0x0128, %tt
	.word 0x8195a1ba  ! 854: WRPR_TPC_I	wrpr	%r22, 0x01ba, %tpc
	.word 0xfe4cc000  ! 856: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xfa4c8000  ! 858: LDSB_R	ldsb	[%r18 + %r0], %r29
	.word 0xfa0420da  ! 859: LDUW_I	lduw	[%r16 + 0x00da], %r29
	.word 0xf41d0000  ! 862: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0x8d942105  ! 864: WRPR_PSTATE_I	wrpr	%r16, 0x0105, %pstate
	.word 0xfc0d201d  ! 865: LDUB_I	ldub	[%r20 + 0x001d], %r30
	.word 0xf80d8000  ! 867: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xf60d4000  ! 869: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xf604c000  ! 874: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0xfc0d8000  ! 878: LDUB_R	ldub	[%r22 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8d94e195  ! 883: WRPR_PSTATE_I	wrpr	%r19, 0x0195, %pstate
	.word 0xfa0c4000  ! 889: LDUB_R	ldub	[%r17 + %r0], %r29
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 14)
	setx	0x80802e3e0000cb48, %g1, %r10
	.word 0x839a8000  ! 892: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb83c61f9  ! 897: XNOR_I	xnor 	%r17, 0x01f9, %r28
	.word 0xfc4de17b  ! 899: LDSB_I	ldsb	[%r23 + 0x017b], %r30
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 1c)
	.word 0x85946197  ! 902: WRPR_TSTATE_I	wrpr	%r17, 0x0197, %tstate
	.word 0xfa1d4000  ! 907: LDD_R	ldd	[%r21 + %r0], %r29
	.word 0xf81da128  ! 909: LDD_I	ldd	[%r22 + 0x0128], %r28
	.word 0xf81cc000  ! 910: LDD_R	ldd	[%r19 + %r0], %r28
	.word 0xbf643801  ! 912: MOVcc_I	<illegal instruction>
	.word 0xf45461e4  ! 913: LDSH_I	ldsh	[%r17 + 0x01e4], %r26
	.word 0xf45ce0ef  ! 914: LDX_I	ldx	[%r19 + 0x00ef], %r26
	.word 0xb53d1000  ! 916: SRAX_R	srax	%r20, %r0, %r26
	.word 0xfc4de020  ! 922: LDSB_I	ldsb	[%r23 + 0x0020], %r30
	.word 0xfc1ca1a0  ! 924: LDD_I	ldd	[%r18 + 0x01a0], %r30
	.word 0xf45d2180  ! 926: LDX_I	ldx	[%r20 + 0x0180], %r26
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 13)
	.word 0xf51d4000  ! 935: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0xfa54a0b2  ! 937: LDSH_I	ldsh	[%r18 + 0x00b2], %r29
	.word 0xf0040000  ! 940: LDUW_R	lduw	[%r16 + %r0], %r24
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf25cc000  ! 949: LDX_R	ldx	[%r19 + %r0], %r25
	.word 0xfa150000  ! 951: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xb9508000  ! 952: RDPR_TSTATE	<illegal instruction>
	.word 0xf05cc000  ! 953: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xf4544000  ! 956: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xf44ca093  ! 957: LDSB_I	ldsb	[%r18 + 0x0093], %r26
	.word 0xb3500000  ! 959: RDPR_TPC	<illegal instruction>
	setx	0xa715607f000059cd, %g1, %r10
	.word 0x819a8000  ! 961: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9508000  ! 969: RDPR_TSTATE	<illegal instruction>
	.word 0xf64d21bf  ! 970: LDSB_I	ldsb	[%r20 + 0x01bf], %r27
	.word 0x9195e068  ! 971: WRPR_PIL_I	wrpr	%r23, 0x0068, %pil
	.word 0xfc050000  ! 973: LDUW_R	lduw	[%r20 + %r0], %r30
	mov	0, %r12
	.word 0x8f930000  ! 974: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xdef422f400005dc4, %g1, %r10
	.word 0x839a8000  ! 975: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa5c0000  ! 976: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xb1351000  ! 981: SRLX_R	srlx	%r20, %r0, %r24
	setx	data_start_6, %g1, %r18
	.word 0xf01d4000  ! 984: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0xfe1cc000  ! 985: LDD_R	ldd	[%r19 + %r0], %r31
	.word 0xb2148000  ! 987: OR_R	or 	%r18, %r0, %r25
	.word 0xbcbda19c  ! 989: XNORcc_I	xnorcc 	%r22, 0x019c, %r30
	.word 0xbe354000  ! 993: SUBC_R	orn 	%r21, %r0, %r31
	.word 0xf2054000  ! 997: LDUW_R	lduw	[%r21 + %r0], %r25
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx	0x1a994a9c00003815, %g1, %r10
	.word 0x839a8000  ! 3: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a488e0  ! 4: FSUBq	dis not found

	.word 0xb3a90820  ! 8: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbba58960  ! 9: FMULq	dis not found

hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb9500000  ! 14: RDPR_TPC	<illegal instruction>
	.word 0x87956002  ! 16: WRPR_TT_I	wrpr	%r21, 0x0002, %tt
	.word 0xb5a00560  ! 23: FSQRTq	fsqrt	
	.word 0x8d9520de  ! 24: WRPR_PSTATE_I	wrpr	%r20, 0x00de, %pstate
	.word 0xb950c000  ! 26: RDPR_TT	<illegal instruction>
	.word 0xb7a80c20  ! 27: FMOVRLZ	dis not found

	.word 0xbfa449c0  ! 28: FDIVd	fdivd	%f48, %f0, %f62
	mov	2, %r12
	.word 0xa1930000  ! 29: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a81c20  ! 30: FMOVRGEZ	dis not found

	setx	0x7a339b60000ac88, %g1, %r10
	.word 0x839a8000  ! 33: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a5c920  ! 34: FMULs	fmuls	%f23, %f0, %f26
	.word 0xb1a00560  ! 36: FSQRTq	fsqrt	
	.word 0xb7abc820  ! 38: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb7ab0820  ! 39: FMOVGU	fmovs	%fcc1, %f0, %f27
	setx	0x4d3b3a8500005bd4, %g1, %r10
	.word 0x839a8000  ! 41: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb13c0000  ! 42: SRA_R	sra 	%r16, %r0, %r24
	setx	0x280b6d670000db8f, %g1, %r10
	.word 0x839a8000  ! 44: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbdab4820  ! 45: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb1a9c820  ! 48: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb1500000  ! 49: RDPR_TPC	<illegal instruction>
	.word 0xb7a548c0  ! 52: FSUBd	fsubd	%f52, %f0, %f58
	.word 0xb1a509c0  ! 54: FDIVd	fdivd	%f20, %f0, %f24
	.word 0x8d94a156  ! 56: WRPR_PSTATE_I	wrpr	%r18, 0x0156, %pstate
	.word 0xb1a589e0  ! 58: FDIVq	dis not found

	.word 0xbfa548c0  ! 60: FSUBd	fsubd	%f52, %f0, %f62
	.word 0x8d95208a  ! 62: WRPR_PSTATE_I	wrpr	%r20, 0x008a, %pstate
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 18)
	.word 0xb9a54940  ! 66: FMULd	fmuld	%f52, %f0, %f28
	.word 0xb9480000  ! 67: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb3ab4820  ! 68: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb7ab4820  ! 69: FMOVCC	fmovs	%fcc1, %f0, %f27
	mov	1, %r12
	.word 0xa1930000  ! 71: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb445e168  ! 72: ADDC_I	addc 	%r23, 0x0168, %r26
	.word 0xba9d61a7  ! 73: XORcc_I	xorcc 	%r21, 0x01a7, %r29
	.word 0xbba508e0  ! 75: FSUBq	dis not found

hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbbaa4820  ! 83: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a44920  ! 84: FMULs	fmuls	%f17, %f0, %f27
	.word 0xbfa84820  ! 86: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbda44940  ! 91: FMULd	fmuld	%f48, %f0, %f30
	.word 0xb7a00560  ! 95: FSQRTq	fsqrt	
	.word 0xb9a4c9e0  ! 97: FDIVq	dis not found

	.word 0xb5a449a0  ! 98: FDIVs	fdivs	%f17, %f0, %f26
	.word 0xb3508000  ! 99: RDPR_TSTATE	<illegal instruction>
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 10)
	.word 0xb5a489e0  ! 103: FDIVq	dis not found

	mov	2, %r12
	.word 0x8f930000  ! 104: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8595209c  ! 106: WRPR_TSTATE_I	wrpr	%r20, 0x009c, %tstate
	.word 0xbb343001  ! 108: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0xbbab8820  ! 109: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a40960  ! 113: FMULq	dis not found

	.word 0x9195a0d0  ! 115: WRPR_PIL_I	wrpr	%r22, 0x00d0, %pil
	.word 0xb9a50920  ! 116: FMULs	fmuls	%f20, %f0, %f28
	.word 0xb5a00560  ! 120: FSQRTq	fsqrt	
	.word 0xb1504000  ! 122: RDPR_TNPC	<illegal instruction>
	.word 0xb5a84820  ! 123: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb3aa0820  ! 130: FMOVA	fmovs	%fcc1, %f0, %f25
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 26)
	.word 0xbfa548e0  ! 134: FSUBq	dis not found

	.word 0xbdaa0820  ! 135: FMOVA	fmovs	%fcc1, %f0, %f30
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbba94820  ! 137: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb5a80420  ! 139: FMOVRZ	dis not found

	.word 0xbba44960  ! 140: FMULq	dis not found

hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 3f)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5504000  ! 149: RDPR_TNPC	<illegal instruction>
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, a)
	.word 0xbfaa8820  ! 160: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0x85952197  ! 163: WRPR_TSTATE_I	wrpr	%r20, 0x0197, %tstate
	setx	0xa8c6fe0200009b0d, %g1, %r10
	.word 0x839a8000  ! 164: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbda94820  ! 166: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbba44840  ! 168: FADDd	faddd	%f48, %f0, %f60
	.word 0xb5a00040  ! 172: FMOVd	fmovd	%f0, %f26
	.word 0x91952135  ! 174: WRPR_PIL_I	wrpr	%r20, 0x0135, %pil
	.word 0xbfa5c9a0  ! 178: FDIVs	fdivs	%f23, %f0, %f31
	.word 0xbb35c000  ! 179: SRL_R	srl 	%r23, %r0, %r29
	.word 0xb7a98820  ! 189: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb3a8c820  ! 190: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb1500000  ! 191: RDPR_TPC	<illegal instruction>
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 18)
	.word 0xb3480000  ! 193: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbb540000  ! 194: RDPR_GL	<illegal instruction>
	.word 0x8994e05e  ! 195: WRPR_TICK_I	wrpr	%r19, 0x005e, %tick
	.word 0xb9a98820  ! 196: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0x8795a0d8  ! 197: WRPR_TT_I	wrpr	%r22, 0x00d8, %tt
	.word 0xb9a4c8a0  ! 198: FSUBs	fsubs	%f19, %f0, %f28
	.word 0xb9500000  ! 199: RDPR_TPC	<illegal instruction>
	.word 0xb1a81820  ! 200: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb9a00020  ! 201: FMOVs	fmovs	%f0, %f28
	setx	data_start_5, %g1, %r20
	.word 0xb551c000  ! 205: RDPR_TL	<illegal instruction>
	.word 0xb1508000  ! 206: RDPR_TSTATE	<illegal instruction>
	.word 0xbc9d0000  ! 217: XORcc_R	xorcc 	%r20, %r0, %r30
	.word 0xbfa50960  ! 219: FMULq	dis not found

	.word 0xb1aa4820  ! 224: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbda40960  ! 225: FMULq	dis not found

	.word 0xb9a00520  ! 231: FSQRTs	fsqrt	
	.word 0xbda488a0  ! 232: FSUBs	fsubs	%f18, %f0, %f30
	.word 0xbfa81420  ! 234: FMOVRNZ	dis not found

hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 20)
	.word 0xbba00560  ! 236: FSQRTq	fsqrt	
	.word 0xb0b5a089  ! 238: ORNcc_I	orncc 	%r22, 0x0089, %r24
	.word 0xbd51c000  ! 239: RDPR_TL	<illegal instruction>
	.word 0xbc1d0000  ! 242: XOR_R	xor 	%r20, %r0, %r30
	.word 0xb950c000  ! 243: RDPR_TT	<illegal instruction>
	.word 0xb7a81c20  ! 247: FMOVRGEZ	dis not found

	.word 0xb7a00540  ! 250: FSQRTd	fsqrt	
	.word 0xb7ab8820  ! 253: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb3a4c840  ! 259: FADDd	faddd	%f50, %f0, %f56
	.word 0xbfa00520  ! 262: FSQRTs	fsqrt	
	.word 0x8395610e  ! 263: WRPR_TNPC_I	wrpr	%r21, 0x010e, %tnpc
	.word 0xbba50860  ! 273: FADDq	dis not found

	.word 0xbfa4c9a0  ! 275: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xb1a81820  ! 276: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb42d0000  ! 278: ANDN_R	andn 	%r20, %r0, %r26
	.word 0xb1a48840  ! 279: FADDd	faddd	%f18, %f0, %f24
	.word 0xb3a84820  ! 286: FMOVE	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9195200b  ! 294: WRPR_PIL_I	wrpr	%r20, 0x000b, %pil
	setx	data_start_0, %g1, %r19
	.word 0xbb508000  ! 301: RDPR_TSTATE	<illegal instruction>
	.word 0xbf2d4000  ! 304: SLL_R	sll 	%r21, %r0, %r31
	.word 0xb3a84820  ! 306: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbb359000  ! 316: SRLX_R	srlx	%r22, %r0, %r29
	.word 0xb1a00520  ! 317: FSQRTs	fsqrt	
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 10)
	.word 0xb7a81420  ! 321: FMOVRNZ	dis not found

	.word 0xb1a48820  ! 326: FADDs	fadds	%f18, %f0, %f24
	.word 0xb3a40840  ! 327: FADDd	faddd	%f16, %f0, %f56
	.word 0xb61da11f  ! 329: XOR_I	xor 	%r22, 0x011f, %r27
	.word 0xb695a052  ! 330: ORcc_I	orcc 	%r22, 0x0052, %r27
	.word 0xbba80c20  ! 331: FMOVRLZ	dis not found

	.word 0xb9a81820  ! 333: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbbab8820  ! 336: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbf520000  ! 338: RDPR_PIL	<illegal instruction>
	.word 0xb1a98820  ! 341: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0x8795e14d  ! 343: WRPR_TT_I	wrpr	%r23, 0x014d, %tt
	.word 0x839520f4  ! 344: WRPR_TNPC_I	wrpr	%r20, 0x00f4, %tnpc
	.word 0xbba00560  ! 345: FSQRTq	fsqrt	
	.word 0xb7a5c9c0  ! 351: FDIVd	fdivd	%f54, %f0, %f58
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 38)
	.word 0x839420f6  ! 361: WRPR_TNPC_I	wrpr	%r16, 0x00f6, %tnpc
	.word 0xb9a589a0  ! 362: FDIVs	fdivs	%f22, %f0, %f28
	.word 0xb1ab8820  ! 363: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb7540000  ! 367: RDPR_GL	<illegal instruction>
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 19)
	.word 0xbda489a0  ! 370: FDIVs	fdivs	%f18, %f0, %f30
	.word 0xb7aa4820  ! 371: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb284c000  ! 376: ADDcc_R	addcc 	%r19, %r0, %r25
	.word 0x8394a183  ! 379: WRPR_TNPC_I	wrpr	%r18, 0x0183, %tnpc
	.word 0xb7abc820  ! 382: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbfabc820  ! 384: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xba0cc000  ! 385: AND_R	and 	%r19, %r0, %r29
	setx	data_start_6, %g1, %r16
	.word 0xb1a80820  ! 387: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb73d0000  ! 391: SRA_R	sra 	%r20, %r0, %r27
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 24)
	.word 0xbfa80c20  ! 394: FMOVRLZ	dis not found

hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, b)
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 9)
	.word 0xbfa48940  ! 400: FMULd	fmuld	%f18, %f0, %f62
	.word 0xb9a00540  ! 401: FSQRTd	fsqrt	
	.word 0xb1aa4820  ! 403: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbda81c20  ! 406: FMOVRGEZ	dis not found

	.word 0xb7a88820  ! 411: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a81820  ! 415: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0x8d95a08e  ! 416: WRPR_PSTATE_I	wrpr	%r22, 0x008e, %pstate
	.word 0x8794a017  ! 421: WRPR_TT_I	wrpr	%r18, 0x0017, %tt
	.word 0xb68d4000  ! 422: ANDcc_R	andcc 	%r21, %r0, %r27
	setx	0x2f641d0900009e49, %g1, %r10
	.word 0x819a8000  ! 425: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xa6efd09300008906, %g1, %r10
	.word 0x839a8000  ! 431: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8795e122  ! 432: WRPR_TT_I	wrpr	%r23, 0x0122, %tt
	.word 0xbf345000  ! 434: SRLX_R	srlx	%r17, %r0, %r31
	.word 0xb550c000  ! 435: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb500000  ! 441: RDPR_TPC	<illegal instruction>
	.word 0xbfab8820  ! 445: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbc9cc000  ! 447: XORcc_R	xorcc 	%r19, %r0, %r30
	setx	data_start_3, %g1, %r17
	.word 0xb7a44860  ! 452: FADDq	dis not found

	.word 0xbfa4c840  ! 453: FADDd	faddd	%f50, %f0, %f62
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 18)
	.word 0xb9a00560  ! 455: FSQRTq	fsqrt	
	.word 0xb7a00560  ! 458: FSQRTq	fsqrt	
	.word 0xb3a509c0  ! 463: FDIVd	fdivd	%f20, %f0, %f56
	.word 0xb9347001  ! 464: SRLX_I	srlx	%r17, 0x0001, %r28
	.word 0xb7a54920  ! 466: FMULs	fmuls	%f21, %f0, %f27
	.word 0xb9aac820  ! 469: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbf50c000  ! 473: RDPR_TT	<illegal instruction>
	.word 0xb3a4c9e0  ! 475: FDIVq	dis not found

	.word 0xb3ab0820  ! 477: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a81420  ! 478: FMOVRNZ	dis not found

	.word 0xb3aac820  ! 485: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb1520000  ! 486: RDPR_PIL	<illegal instruction>
	setx	data_start_1, %g1, %r20
	.word 0x91952160  ! 488: WRPR_PIL_I	wrpr	%r20, 0x0160, %pil
	.word 0xb3ab4820  ! 491: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb3480000  ! 494: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb9aa0820  ! 500: FMOVA	fmovs	%fcc1, %f0, %f28
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 2d)
	.word 0x8d95a1cf  ! 505: WRPR_PSTATE_I	wrpr	%r22, 0x01cf, %pstate
	.word 0x819561a8  ! 506: WRPR_TPC_I	wrpr	%r21, 0x01a8, %tpc
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 19)
	.word 0xbfa44920  ! 509: FMULs	fmuls	%f17, %f0, %f31
	.word 0xb5ab8820  ! 510: FMOVPOS	fmovs	%fcc1, %f0, %f26
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9a94820  ! 516: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0x8d95a0a0  ! 519: WRPR_PSTATE_I	wrpr	%r22, 0x00a0, %pstate
	.word 0xb1ab0820  ! 521: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb1510000  ! 524: RDPR_TICK	<illegal instruction>
	.word 0xbda00540  ! 525: FSQRTd	fsqrt	
	.word 0xb7a58920  ! 529: FMULs	fmuls	%f22, %f0, %f27
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 12)
	.word 0xb5a588c0  ! 533: FSUBd	fsubd	%f22, %f0, %f26
	setx	data_start_5, %g1, %r20
	.word 0xb6b44000  ! 537: ORNcc_R	orncc 	%r17, %r0, %r27
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 3c)
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 13)
	.word 0xb2ada05f  ! 543: ANDNcc_I	andncc 	%r22, 0x005f, %r25
	.word 0xb9a589e0  ! 544: FDIVq	dis not found

	.word 0xb3a00020  ! 545: FMOVs	fmovs	%f0, %f25
	.word 0xb045c000  ! 547: ADDC_R	addc 	%r23, %r0, %r24
	.word 0xb5a4c9e0  ! 548: FDIVq	dis not found

	.word 0xb615e13a  ! 551: OR_I	or 	%r23, 0x013a, %r27
	.word 0xb3a81820  ! 552: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb1a488e0  ! 554: FSUBq	dis not found

	.word 0xbfa409a0  ! 557: FDIVs	fdivs	%f16, %f0, %f31
	.word 0xbf540000  ! 559: RDPR_GL	<illegal instruction>
	.word 0xb0b44000  ! 562: SUBCcc_R	orncc 	%r17, %r0, %r24
	.word 0xb005c000  ! 564: ADD_R	add 	%r23, %r0, %r24
	.word 0x8394e0b8  ! 565: WRPR_TNPC_I	wrpr	%r19, 0x00b8, %tnpc
	.word 0xb3a80420  ! 566: FMOVRZ	dis not found

	.word 0xb3a90820  ! 568: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb3540000  ! 569: RDPR_GL	<illegal instruction>
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 36)
	.word 0xbd518000  ! 572: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a489c0  ! 577: FDIVd	fdivd	%f18, %f0, %f24
	.word 0xb3a5c9a0  ! 579: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xb1520000  ! 580: RDPR_PIL	<illegal instruction>
	.word 0xb1a8c820  ! 583: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb1a81c20  ! 584: FMOVRGEZ	dis not found

	.word 0xbda549e0  ! 587: FDIVq	dis not found

	.word 0xb5a58940  ! 588: FMULd	fmuld	%f22, %f0, %f26
	.word 0xbba80820  ! 589: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbf518000  ! 592: RDPR_PSTATE	<illegal instruction>
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 8)
	setx	0x7e0fa81200004a0e, %g1, %r10
	.word 0x839a8000  ! 595: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9a80820  ! 597: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb5a80c20  ! 598: FMOVRLZ	dis not found

	.word 0xbba5c9c0  ! 600: FDIVd	fdivd	%f54, %f0, %f60
	.word 0x8d956078  ! 601: WRPR_PSTATE_I	wrpr	%r21, 0x0078, %pstate
	.word 0xbda448a0  ! 602: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xbda40860  ! 603: FADDq	dis not found

	.word 0x8395201e  ! 607: WRPR_TNPC_I	wrpr	%r20, 0x001e, %tnpc
	.word 0xb3a448a0  ! 609: FSUBs	fsubs	%f17, %f0, %f25
	.word 0xb7a408c0  ! 611: FSUBd	fsubd	%f16, %f0, %f58
	.word 0xbfa00520  ! 612: FSQRTs	fsqrt	
	.word 0xb435e107  ! 613: SUBC_I	orn 	%r23, 0x0107, %r26
	.word 0x8994a0ea  ! 614: WRPR_TICK_I	wrpr	%r18, 0x00ea, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a84820  ! 616: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0x8395e020  ! 620: WRPR_TNPC_I	wrpr	%r23, 0x0020, %tnpc
	.word 0xb3520000  ! 625: RDPR_PIL	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 626: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a4c940  ! 631: FMULd	fmuld	%f50, %f0, %f58
	.word 0xb82d2088  ! 633: ANDN_I	andn 	%r20, 0x0088, %r28
	.word 0xb1352001  ! 635: SRL_I	srl 	%r20, 0x0001, %r24
	.word 0xbba81820  ! 637: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	setx	data_start_2, %g1, %r17
	.word 0xbda4c8e0  ! 643: FSUBq	dis not found

	.word 0xb7540000  ! 644: RDPR_GL	<illegal instruction>
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb92c6001  ! 646: SLL_I	sll 	%r17, 0x0001, %r28
	.word 0xb1a00540  ! 648: FSQRTd	fsqrt	
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 21)
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb3a8c820  ! 655: FMOVL	fmovs	%fcc1, %f0, %f25
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 1)
	.word 0x8d95a111  ! 660: WRPR_PSTATE_I	wrpr	%r22, 0x0111, %pstate
	.word 0xbdaa0820  ! 664: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0x83956068  ! 665: WRPR_TNPC_I	wrpr	%r21, 0x0068, %tnpc
	.word 0xb5a88820  ! 667: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb0a58000  ! 668: SUBcc_R	subcc 	%r22, %r0, %r24
	.word 0xb0440000  ! 669: ADDC_R	addc 	%r16, %r0, %r24
	.word 0xb3480000  ! 672: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8595a08a  ! 673: WRPR_TSTATE_I	wrpr	%r22, 0x008a, %tstate
	setx	0xc1992f5100007a48, %g1, %r10
	.word 0x819a8000  ! 676: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7504000  ! 680: RDPR_TNPC	<illegal instruction>
	.word 0x9194607c  ! 685: WRPR_PIL_I	wrpr	%r17, 0x007c, %pil
	setx	data_start_5, %g1, %r18
	.word 0xb1a449e0  ! 691: FDIVq	dis not found

	.word 0xb1a90820  ! 692: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbda00540  ! 697: FSQRTd	fsqrt	
	.word 0xbba90820  ! 698: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb7a81c20  ! 705: FMOVRGEZ	dis not found

	.word 0xb9a00040  ! 707: FMOVd	fmovd	%f0, %f28
	.word 0xb0040000  ! 708: ADD_R	add 	%r16, %r0, %r24
	.word 0xb6350000  ! 710: SUBC_R	orn 	%r20, %r0, %r27
	.word 0xbda00020  ! 711: FMOVs	fmovs	%f0, %f30
	.word 0x8794e0b0  ! 712: WRPR_TT_I	wrpr	%r19, 0x00b0, %tt
	.word 0xbfa488a0  ! 713: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xbda4c820  ! 718: FADDs	fadds	%f19, %f0, %f30
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 37)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a9c820  ! 722: FMOVVS	fmovs	%fcc1, %f0, %f27
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 5)
	.word 0xbfa408c0  ! 726: FSUBd	fsubd	%f16, %f0, %f62
	.word 0xbe0dc000  ! 729: AND_R	and 	%r23, %r0, %r31
	.word 0xbba80820  ! 730: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 21)
	.word 0xb3358000  ! 732: SRL_R	srl 	%r22, %r0, %r25
	.word 0xb1aac820  ! 733: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb03d6190  ! 734: XNOR_I	xnor 	%r21, 0x0190, %r24
	.word 0x8794e05b  ! 736: WRPR_TT_I	wrpr	%r19, 0x005b, %tt
	setx	data_start_7, %g1, %r16
	.word 0xbbab8820  ! 746: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbda81c20  ! 749: FMOVRGEZ	dis not found

	.word 0xb5540000  ! 752: RDPR_GL	<illegal instruction>
	setx	data_start_3, %g1, %r19
	.word 0xbfa8c820  ! 756: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb9a4c920  ! 759: FMULs	fmuls	%f19, %f0, %f28
	.word 0xbba80420  ! 760: FMOVRZ	dis not found

	.word 0xbdab8820  ! 764: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbb540000  ! 765: RDPR_GL	<illegal instruction>
	.word 0xbd480000  ! 770: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x8d95e1e8  ! 773: WRPR_PSTATE_I	wrpr	%r23, 0x01e8, %pstate
	.word 0x859560a7  ! 777: WRPR_TSTATE_I	wrpr	%r21, 0x00a7, %tstate
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 12)
	.word 0xb9508000  ! 782: RDPR_TSTATE	<illegal instruction>
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 32)
	.word 0xb7ab4820  ! 785: FMOVCC	fmovs	%fcc1, %f0, %f27
	setx	data_start_1, %g1, %r23
	.word 0xbba58840  ! 790: FADDd	faddd	%f22, %f0, %f60
	.word 0xb3500000  ! 791: RDPR_TPC	<illegal instruction>
	.word 0xb9a81c20  ! 793: FMOVRGEZ	dis not found

	.word 0xb5520000  ! 795: RDPR_PIL	<illegal instruction>
	.word 0xb3a88820  ! 797: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a00560  ! 800: FSQRTq	fsqrt	
	.word 0xbc3c4000  ! 801: XNOR_R	xnor 	%r17, %r0, %r30
	.word 0xbfa54920  ! 802: FMULs	fmuls	%f21, %f0, %f31
	.word 0x8d94605f  ! 803: WRPR_PSTATE_I	wrpr	%r17, 0x005f, %pstate
	.word 0x91952150  ! 806: WRPR_PIL_I	wrpr	%r20, 0x0150, %pil
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 25)
	.word 0x8195615a  ! 811: WRPR_TPC_I	wrpr	%r21, 0x015a, %tpc
	.word 0xb5a54960  ! 813: FMULq	dis not found

	.word 0xb1a81c20  ! 814: FMOVRGEZ	dis not found

	.word 0xbd480000  ! 819: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbf520000  ! 825: RDPR_PIL	<illegal instruction>
	.word 0xb9a549a0  ! 826: FDIVs	fdivs	%f21, %f0, %f28
	.word 0xb1a80c20  ! 828: FMOVRLZ	dis not found

	setx	0xf2cca3190000fec6, %g1, %r10
	.word 0x819a8000  ! 830: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1a84820  ! 835: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a408e0  ! 837: FSUBq	dis not found

	.word 0xb3a4c9a0  ! 838: FDIVs	fdivs	%f19, %f0, %f25
	.word 0xbfa80820  ! 840: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb6bde027  ! 841: XNORcc_I	xnorcc 	%r23, 0x0027, %r27
	.word 0xb1a80420  ! 842: FMOVRZ	dis not found

	.word 0x919521fc  ! 845: WRPR_PIL_I	wrpr	%r20, 0x01fc, %pil
	.word 0xbdab0820  ! 849: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0x8795a0b6  ! 853: WRPR_TT_I	wrpr	%r22, 0x00b6, %tt
	.word 0x8194a1d0  ! 854: WRPR_TPC_I	wrpr	%r18, 0x01d0, %tpc
	.word 0xbbabc820  ! 861: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0x8d946102  ! 864: WRPR_PSTATE_I	wrpr	%r17, 0x0102, %pstate
	.word 0xb5a448c0  ! 876: FSUBd	fsubd	%f48, %f0, %f26
	.word 0xb9a449e0  ! 877: FDIVq	dis not found

	.word 0xbfa4c860  ! 879: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8d952051  ! 883: WRPR_PSTATE_I	wrpr	%r20, 0x0051, %pstate
	.word 0xb7a5c9a0  ! 885: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xb9a8c820  ! 887: FMOVL	fmovs	%fcc1, %f0, %f28
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 36)
	setx	0x386cd5630000fb82, %g1, %r10
	.word 0x839a8000  ! 892: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a84820  ! 893: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a48960  ! 894: FMULq	dis not found

	.word 0xb03ca117  ! 897: XNOR_I	xnor 	%r18, 0x0117, %r24
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 10)
	.word 0x8594616e  ! 902: WRPR_TSTATE_I	wrpr	%r17, 0x016e, %tstate
	.word 0xb3a549e0  ! 911: FDIVq	dis not found

	.word 0xb5643801  ! 912: MOVcc_I	<illegal instruction>
	.word 0xb13d9000  ! 916: SRAX_R	srax	%r22, %r0, %r24
	.word 0xb5aac820  ! 918: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a5c840  ! 925: FADDd	faddd	%f54, %f0, %f56
	.word 0xb9a9c820  ! 930: FMOVVS	fmovs	%fcc1, %f0, %f28
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 18)
	.word 0xb1a548e0  ! 933: FSUBq	dis not found

	.word 0xb3a48820  ! 936: FADDs	fadds	%f18, %f0, %f25
	.word 0xbda00560  ! 943: FSQRTq	fsqrt	
	.word 0xb3a00520  ! 944: FSQRTs	fsqrt	
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 0)
	.word 0xbf508000  ! 952: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a00520  ! 954: FSQRTs	fsqrt	
	.word 0xb3500000  ! 959: RDPR_TPC	<illegal instruction>
	setx	0x7679e8600002d0b, %g1, %r10
	.word 0x819a8000  ! 961: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbda448a0  ! 963: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xbda50820  ! 964: FADDs	fadds	%f20, %f0, %f30
	.word 0xbbab0820  ! 966: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb5a44820  ! 967: FADDs	fadds	%f17, %f0, %f26
	.word 0xbb508000  ! 969: RDPR_TSTATE	<illegal instruction>
	.word 0x9195e1b8  ! 971: WRPR_PIL_I	wrpr	%r23, 0x01b8, %pil
	mov	1, %r12
	.word 0x8f930000  ! 974: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xf4268dd400008a1c, %g1, %r10
	.word 0x839a8000  ! 975: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbba81820  ! 979: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb335d000  ! 981: SRLX_R	srlx	%r23, %r0, %r25
	.word 0xbfa5c8c0  ! 982: FSUBd	fsubd	%f54, %f0, %f62
	setx	data_start_7, %g1, %r23
	.word 0xbc158000  ! 987: OR_R	or 	%r22, %r0, %r30
	.word 0xbcbca16a  ! 989: XNORcc_I	xnorcc 	%r18, 0x016a, %r30
	.word 0xbc348000  ! 993: SUBC_R	orn 	%r18, %r0, %r30
	.word 0xb3a4c840  ! 994: FADDd	faddd	%f50, %f0, %f56
	.word 0xbfa50840  ! 996: FADDd	faddd	%f20, %f0, %f62
	.word 0xb5a84820  ! 998: FMOVE	fmovs	%fcc1, %f0, %f26

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

	.xword	0x4b859e2047bc8a5d
	.xword	0x78bed07b7d7ca9ef
	.xword	0x8082632fe39a0710
	.xword	0xc975698228633cab
	.xword	0x00c58d910ffb287f
	.xword	0x40a23eae28716cf2
	.xword	0xe2fb44c64efe5f38
	.xword	0x7db101e3ab607dad
	.xword	0x2ca04f9b3a2f5ba7
	.xword	0x428c2d162d41be62
	.xword	0x495ce875bd7a9f1c
	.xword	0x3001c8acf5102e52
	.xword	0x9a6c8514cf61f364
	.xword	0x9d369f40cf85a2eb
	.xword	0xbf51b33a6dd25a35
	.xword	0x5d1d78a4acd87721
	.xword	0x7428d49ab5dfb3cf
	.xword	0x5db1d8c938c99f64
	.xword	0x656b7bb41eba388f
	.xword	0x636c616f4fc78838
	.xword	0xb266f3c001dd61d6
	.xword	0xe22ba996f8ac27f7
	.xword	0xa84934e6f779fcf2
	.xword	0x4b8bb8362b2d6736
	.xword	0x8fa2221d8f71f372
	.xword	0x67ff56e25c6abcb4
	.xword	0xe953b8d1e62094b6
	.xword	0x6dcefff2d92cfdc5
	.xword	0x071671e11c933a2c
	.xword	0x0ed1de8fe46cef68
	.xword	0x38db881bf59bd4fc
	.xword	0x2728424048f30abb
	.xword	0xb79bdeffdc905262
	.xword	0xc3defb120191bc09
	.xword	0x729cfa69729e1ddd
	.xword	0x28e0ffdb3f42ef0c
	.xword	0x6f9ce9c86fc3260f
	.xword	0x31cd86bf80774546
	.xword	0xbc9ed6b39fd8951a
	.xword	0xe531edf10dd19d60
	.xword	0xd17faeaa307e3134
	.xword	0xf7c8145c9a5900d4
	.xword	0xb7df142dc6f021df
	.xword	0x99a86f8308bad264
	.xword	0xb45e279b8ccc72e2
	.xword	0xe894485fd8c3e559
	.xword	0x1e77f1780bb8e193
	.xword	0x57dce727900d88ac
	.xword	0xddd512ff1da9fa9a
	.xword	0x2d54b9824b83ead5
	.xword	0xf8f48beca0e3a808
	.xword	0xda1641e7fddeb461
	.xword	0xab83eb03dc7a5c4b
	.xword	0xa032bf61b508d93d
	.xword	0xea44bc5a1416fca8
	.xword	0xc76c0f3935fd6384
	.xword	0xc8c46120b711031f
	.xword	0xb3074ec0d640a735
	.xword	0x7aee3b7749cca78f
	.xword	0xba5d9bc2dc58a402
	.xword	0xf78915e90b26f4fd
	.xword	0xb236fe0a14443286
	.xword	0xddbe67884165ba51
	.xword	0xb0dc7a2049bad3b0
	.xword	0xbf870e2f5030cd73
	.xword	0x2042825ba8fd0618
	.xword	0x8d5d591efa3c8f59
	.xword	0x3062d5874c0d6a6c
	.xword	0x05ed4978bf41c0af
	.xword	0x22bbf55563ec9c14
	.xword	0xeed88b510e8ce2b9
	.xword	0xbb444f21e27f0fac
	.xword	0x73954375844d2ad5
	.xword	0x52f02a2c11bec162
	.xword	0x105ddbe48afe628e
	.xword	0x3753e283451d1f18
	.xword	0x29f2763281f56c7e
	.xword	0x620c1edb87a3e133
	.xword	0xb8925e1cbd9f2387
	.xword	0x640fc727fd924c09
	.xword	0x997818db67ff3591
	.xword	0xdff172f768b047ed
	.xword	0xda522a32f3377255
	.xword	0xb26f44e6f290dac1
	.xword	0xf52326332c0d3195
	.xword	0xe3fd094053197aa2
	.xword	0x7dee51f87c876520
	.xword	0x5eaacd84ec164348
	.xword	0xf82f55c756aa1448
	.xword	0xc86a142aa1e407bb
	.xword	0x40f151d12469145b
	.xword	0xe3f036031719d374
	.xword	0xffbf17f2beeb52b3
	.xword	0xd18dae6cd4c75945
	.xword	0xba57a732dab84f2c
	.xword	0xe1132daba29d913f
	.xword	0x71d9b4a290c628dd
	.xword	0x6e9b356951d6f752
	.xword	0x273808154654dbe8
	.xword	0x7516da7a51a9acd1
	.xword	0x6c12405c3f3b9b33
	.xword	0xad694bc539b078e0
	.xword	0x8d7c6bb7f59c4e4a
	.xword	0x62e445c3a9077366
	.xword	0x933ffa5bc2e9271a
	.xword	0x6e99d49dc7a91c96
	.xword	0x60192878faa55e8b
	.xword	0xfd7bc6c55444b058
	.xword	0x7f1db7125d7d63cb
	.xword	0x1d9a5e98039524a2
	.xword	0x4e729b949dd14c9c
	.xword	0xd42661fa7c514c6d
	.xword	0x216a8d02d869cb6e
	.xword	0x729d1929a9f8020f
	.xword	0x4f15a2651535b695
	.xword	0xa2aada8043e2c00b
	.xword	0xf6f384966d168479
	.xword	0xe221bfd50b751cf6
	.xword	0xed6f3e791c89190c
	.xword	0x4e3b9aec5c0b5b7e
	.xword	0xbdb8b1f377216570
	.xword	0x63602454392a3606
	.xword	0xf6d9fa12d3dea9c2
	.xword	0xf76340612e7e1ccd
	.xword	0x1034870641887c5f
	.xword	0x3bef0a293e045e85
	.xword	0xd01e1820d5b0a5fc
	.xword	0x316317f23c96fbc5
	.xword	0x7aa674b8b1e183b5
	.xword	0x4b523a71a18fe3bb
	.xword	0x9028983afab0afc3
	.xword	0x2bc4891dbd20bcaf
	.xword	0x66052fd76fc4016e
	.xword	0xeb32634d2b38b122
	.xword	0xb9c6f6c55f8e4b47
	.xword	0x869de1555d832e93
	.xword	0xe07cd83746fd8a3b
	.xword	0xc56f28e487c26b02
	.xword	0x930fe75a3a6525ac
	.xword	0x27ac40d55ee5ebda
	.xword	0x6679c7d521a982d3
	.xword	0x656644bff5e40252
	.xword	0x8b18b23fcc334f57
	.xword	0xb6c164547ffaafb9
	.xword	0x2af0790ba52a3b34
	.xword	0x9e84c35e81a2c8ca
	.xword	0x7772caedf95b7a2d
	.xword	0x403fde306b10a34b
	.xword	0xcdf2aaf1e9a2614c
	.xword	0x51dd893794522614
	.xword	0x9ef49588b9ab9520
	.xword	0x56650b5291b5bff0
	.xword	0xfed06181d753db33
	.xword	0x531db5c35f59daec
	.xword	0x19058f8ca148a976
	.xword	0xae98547970e22fa4
	.xword	0x5b4dfdba6b3d8c30
	.xword	0xa27f80c5d98d768a
	.xword	0x5c75f805322f7284
	.xword	0x23f541de82e43e7b
	.xword	0xa0c9120a972d50c8
	.xword	0x8327b51263ab59a3
	.xword	0xf44106afcf9a0be0
	.xword	0xa2ccdfa873561dab
	.xword	0xc2d96d805d2e1b54
	.xword	0x14831b683b1fc854
	.xword	0x046d1df5c123df7a
	.xword	0xf1e95e49a8add036
	.xword	0xca5bfd66b5c0cddd
	.xword	0x9a48066be297de4b
	.xword	0x584f952ed5097c2a
	.xword	0xc680d9b4885d49c3
	.xword	0x9498371d94171003
	.xword	0xd43e6f0a4d36d2bd
	.xword	0x0e22075c15ef9c47
	.xword	0xd18e11fd9bc3168f
	.xword	0x01ace8f5b045bf26
	.xword	0x6601f50443b2e5bb
	.xword	0x2a6264eb98c39c82
	.xword	0x5cfca38a8abd02fd
	.xword	0x76a783a8e1955bc0
	.xword	0xe5ec8540d823c29a
	.xword	0x14e5b4f3b51f1f34
	.xword	0x8bc577c39999a9ad
	.xword	0x2fdb7768b0d2d19b
	.xword	0x1ee501fdfd18e292
	.xword	0x7b338c1809b0790b
	.xword	0x3402d3ab21bf903f
	.xword	0xafc75423e848d433
	.xword	0x8227948e56bc9c2d
	.xword	0x42e8a62a19b04a4e
	.xword	0x836e91099aaad917
	.xword	0xf87feb0782209733
	.xword	0x6b643aba8cd40d23
	.xword	0xc16763d86f1d6c29
	.xword	0x83dfb7d73993cf4f
	.xword	0x86c821870f813024
	.xword	0x861eba421e2d0aa1
	.xword	0x45265bf7567baa8e
	.xword	0xb517bd94e732efad
	.xword	0x52200a1af1bd32ca
	.xword	0x959ce507f10d4af4
	.xword	0x9ffebf4800e7d806
	.xword	0x2a685d9f61740aa6
	.xword	0xf81e05c463b39812
	.xword	0xc9acba80fce94558
	.xword	0xab06e1ec25e936c6
	.xword	0x692a518a4369271d
	.xword	0x4cbe39092bbb86c8
	.xword	0x15e9f90fda34dc72
	.xword	0x9a9a91cab7598794
	.xword	0x1535146e1558430b
	.xword	0xca73a385b6ab6a27
	.xword	0xc596e9911313ce3e
	.xword	0x863874d4bab79f33
	.xword	0x020cbe6cfa36c14f
	.xword	0xe7b8bdcdbc174b6b
	.xword	0x1962e12efe074cef
	.xword	0x3b6729285a862876
	.xword	0x1dc12a7d432dd353
	.xword	0xaa0e8b71dba1e10c
	.xword	0x045abf573a515c42
	.xword	0x8216ea331fb87344
	.xword	0x021fef01c7d01da0
	.xword	0x59c838750d7c65e3
	.xword	0xf86a1b33654c9e12
	.xword	0x55f7d7df09a5345b
	.xword	0xf45c15e90bf6c580
	.xword	0x5c89e6aff90e5d56
	.xword	0x8d813aa67a6b252f
	.xword	0x4519002e39de1a06
	.xword	0xe817a780b3169445
	.xword	0x5feff319a9a18713
	.xword	0x1a2d36f0bc060aba
	.xword	0xa5394c13224e9a06
	.xword	0xb713dac57f07548b
	.xword	0x8b80ea461ce57980
	.xword	0x602e47ff7d57fdc0
	.xword	0xdbaf7139d74f61c3
	.xword	0xf02fde7906931ab9
	.xword	0x3d30824ff8a50b87
	.xword	0xa768d1119194a933
	.xword	0xbdebd2fd52dfd7df
	.xword	0xde541a2f168a6e97
	.xword	0x008ac1e5a3cf8322
	.xword	0x1bf5fbf8e21f88eb
	.xword	0x3bd3c295be4a3349
	.xword	0x2224da85d810f494
	.xword	0x60d092ff36c019bc
	.xword	0x005be472b79fad7d
	.xword	0xae01f2d05eeb54b8
	.xword	0xcf14d412caab0959
	.xword	0x95bebf6284f4863e
	.xword	0x5310a5da4a3bb55a
	.xword	0x8b8ed3be019f15c1
	.xword	0x973db91eae981b23
	.align 0x2000
	.data
data_start_1:

	.xword	0xc211e1be85810864
	.xword	0x60012bc56c335671
	.xword	0xe8a97acf87af827d
	.xword	0x16d03225083d5928
	.xword	0x325ac7eca372ffed
	.xword	0x0b05562074c0e92b
	.xword	0x9d48fc048c59df06
	.xword	0xe61ae61d7610410a
	.xword	0x798203640e54db52
	.xword	0x7ad55de65bd4a54d
	.xword	0x0d1c05eee4a491a3
	.xword	0x344ee5e1ea80518c
	.xword	0x998c26c2871334af
	.xword	0x7ce1b55bc334695b
	.xword	0x37cee37e68d99b64
	.xword	0x37f4f50c8e5f2b99
	.xword	0xd8c0ed6ccc124c2b
	.xword	0x2ac42a46d95e981c
	.xword	0x32608fc19ade8c63
	.xword	0xbfddc6aed1a0953c
	.xword	0x2508af99f6df1682
	.xword	0xc762c61258aa41eb
	.xword	0x52d42d4bf8f445c8
	.xword	0xe36cbaacad488beb
	.xword	0xde80729cbde45413
	.xword	0x7b28aa6879060e0d
	.xword	0xa4cfab384fff152e
	.xword	0x691e30942f959ca4
	.xword	0x9670001835b3193d
	.xword	0xce96626c21b79d7e
	.xword	0xe2963e4ad0b6ab0e
	.xword	0xec506426773d434e
	.xword	0xc4c1da6b46c32ac8
	.xword	0xc8c38f97c5599768
	.xword	0x9cb44c12189d263f
	.xword	0x06fc06a27a86cd2b
	.xword	0x8a29c38da33042de
	.xword	0x520ae1dab02411d5
	.xword	0x4500585cebb54333
	.xword	0x8094e17a11fe0add
	.xword	0x8355ae9ae48256ee
	.xword	0x4c829b66c5c0bd3e
	.xword	0xfc7c0a534cb9e419
	.xword	0xd1a07c213ebb05e4
	.xword	0x1275f646d6811400
	.xword	0x3e6b544c3a17a624
	.xword	0xe6f90c363cc64d58
	.xword	0x727693aaec02a32c
	.xword	0x9a57ac5e4d50681c
	.xword	0xbe628563f829c22b
	.xword	0x1aa24c3463da9790
	.xword	0x2f12d6705a06caf0
	.xword	0x8e4a021e5e8867f1
	.xword	0x809484d04303fdd9
	.xword	0xa89990e32a802e90
	.xword	0x85a8210626ee6a71
	.xword	0x418369c3cf2b8dba
	.xword	0x493aaf8a161c7bfb
	.xword	0x16271251233a34ea
	.xword	0x354285fc511d188e
	.xword	0x2c14572f59e8c9d0
	.xword	0xac2b003b354b6d38
	.xword	0x6c7575f2f98d3cff
	.xword	0xeda155a9e70dfb5a
	.xword	0x609d582db07aaed1
	.xword	0x48adbac0a6bbd86d
	.xword	0x124be14554baf301
	.xword	0x6acb96638057fa89
	.xword	0x4f4ad517bca1fda5
	.xword	0x9cf2643db1a0fa04
	.xword	0x3f32655218b51ec8
	.xword	0xb93bdc6d0276c6a8
	.xword	0xe1ea58e6828047a0
	.xword	0x4e2965966dde244e
	.xword	0x02ef244ab3d1bef8
	.xword	0xb5699915c683e448
	.xword	0xad78f278f6b2b84f
	.xword	0x1d293f6ceb77230b
	.xword	0xa566914ee7aa50b6
	.xword	0x2d17a23916175e97
	.xword	0x2ed8d2219a32e563
	.xword	0x1e1a1d8a79f9fe8d
	.xword	0x0f5323c6cfdcc996
	.xword	0x68a5813f2f25f32b
	.xword	0xd37c7046bf3e6d38
	.xword	0x3a44ab8a72651d22
	.xword	0x4b7813e7d4bb9695
	.xword	0x74715b24dd1ea09e
	.xword	0xcf809688299d2af9
	.xword	0xbc05433702f6f825
	.xword	0xf1cbb44b1e1436ff
	.xword	0xb33a56354a1acb07
	.xword	0x479a00bd5a9a7a64
	.xword	0x6b67c9f04aba57d9
	.xword	0xf3b3ec340a324c5e
	.xword	0xd495666be846b39e
	.xword	0x4b7b85508a0a6bbb
	.xword	0x493f0beb9987846d
	.xword	0xe38df0373d5a1980
	.xword	0x102a7d11ed9c9078
	.xword	0x08327b99a84fe693
	.xword	0xf2cd98094fd20fa9
	.xword	0x93d8c56ea8bdfd56
	.xword	0x01f44255d3dd5357
	.xword	0x07cdf36e8b58942f
	.xword	0x2758a41fc05657dc
	.xword	0x9d417c7e66c65069
	.xword	0x870fee599f01bd42
	.xword	0x3f9911f58177323c
	.xword	0x2a33d1fdaca51c60
	.xword	0xe7b8a9f52e68d8de
	.xword	0xfd73e21b6b4eea4f
	.xword	0xd078ce0516deb6af
	.xword	0xb7916b3c8e596899
	.xword	0x565389de01df3271
	.xword	0x1c2462f8d6a9e213
	.xword	0x25138d111c44c8b7
	.xword	0x1b2135197ec0a1b3
	.xword	0x3ef60c6ae417236c
	.xword	0xf23baff9961fa3c0
	.xword	0x7ff063bd4d266441
	.xword	0x77d21116232bac65
	.xword	0x8838671eb5ff9803
	.xword	0x014125c75f50a283
	.xword	0xff5ee6726d9728fe
	.xword	0xfdc26ef12f54fd3c
	.xword	0x7e5847f89a25e291
	.xword	0x939147a7431cbfe4
	.xword	0x46d3d560e9aa51fc
	.xword	0x7d25c7cde4dec260
	.xword	0xa17439dd725a43ff
	.xword	0x7201a197d9db1821
	.xword	0xe03152ce8fc67292
	.xword	0x6502771dd94e803d
	.xword	0x3eac12ab935e2608
	.xword	0xf5680224d9a2e84c
	.xword	0x81b55788a76dcb41
	.xword	0x0071428493a3a800
	.xword	0x38eab023956e2a9b
	.xword	0xbc035022117884ca
	.xword	0x057ae8bb55099dfc
	.xword	0xa2478c8280203554
	.xword	0x016ef468f5a07583
	.xword	0xef9e338e54807e32
	.xword	0xbd583d6d82baedcf
	.xword	0x1840da04403d9312
	.xword	0xe1ee47e65d6e585a
	.xword	0xb8df1087c28088d1
	.xword	0x6193d436a8438cac
	.xword	0x3435bcab9590d3cd
	.xword	0x8d78ae8110d7c72f
	.xword	0x2925d545752fa610
	.xword	0x0b1cb7fb51c1de52
	.xword	0xcf4c0c694cc7324c
	.xword	0x4877abc0a5b257c3
	.xword	0xa6909db6151dd44b
	.xword	0x499119f48fbef2af
	.xword	0x2ddf9f99e513b655
	.xword	0xebd6f3649fbe11bc
	.xword	0x85a57fcaf1367005
	.xword	0xebae0c5255aa4430
	.xword	0x1ce7935fdce535b9
	.xword	0x84dc0fa540fe63a1
	.xword	0x17fcf6d7c9495515
	.xword	0x135ccad6eb1a55ac
	.xword	0xe9df643ed5fb3bc5
	.xword	0xb2ad39e1100f0dd3
	.xword	0x45874089b2da3136
	.xword	0x1ec9fed938130d4d
	.xword	0xb95d1bde1dc936d3
	.xword	0x15566b7177dcf881
	.xword	0x8f3120c1dff503bb
	.xword	0x4a212bb5eef5a2c7
	.xword	0x1a0ff253dfe70964
	.xword	0x4a92f334705fde95
	.xword	0x132cf929023d1944
	.xword	0x0fcfe2e8817ef620
	.xword	0xda82d7cba46bbb2a
	.xword	0x9757ead4dcbac65c
	.xword	0x43a29de29e569a12
	.xword	0x3265f865ca5c644d
	.xword	0x6d3f11b2973db7b7
	.xword	0x2faf3ae31b66d9d0
	.xword	0xefebc54c6a16a718
	.xword	0x293326d14ea771cb
	.xword	0x337aafca8ecdf1fb
	.xword	0x76eabb80a15d6710
	.xword	0x5677f8806d181aa1
	.xword	0x33fd0743e611bca7
	.xword	0xb2f5dfdb96af3d64
	.xword	0x051d34a4f43e9a57
	.xword	0x88e373a1d8c73ff3
	.xword	0x85e96e1526fa839a
	.xword	0xaf6c8218f973b27c
	.xword	0xa52c4354ff09991d
	.xword	0xf242f1037a5a431f
	.xword	0xeec74226adf83719
	.xword	0x08a96fa718b34fb4
	.xword	0x5581f1969ade9963
	.xword	0x18e4920eef2b5d47
	.xword	0xf8c43e6ccac4ef06
	.xword	0x83e4ca5f672ac48a
	.xword	0x824a500f5be7f467
	.xword	0x74165215f08c3a4f
	.xword	0xcb72150848a72d82
	.xword	0xdf60475391dd5f7c
	.xword	0x55ad61224df5c0b3
	.xword	0x643074db087e98fa
	.xword	0x6cdc446991aa65f1
	.xword	0x863f106f4223dd43
	.xword	0x00349d761ed63406
	.xword	0xbf53693fd516c38d
	.xword	0xe2d647b53266edb4
	.xword	0xccedd8218c1562b8
	.xword	0x98d3a2f6bbc5b00a
	.xword	0x5669d38783b48655
	.xword	0x5f1564f8bc76fd4a
	.xword	0x5344118e954c7545
	.xword	0x2bbb31564b134fba
	.xword	0x9cf37743c67e9028
	.xword	0xe2ae7a3ba03f263d
	.xword	0x842b20a7fbc9cdcd
	.xword	0xabf5398c6711dcb5
	.xword	0x9571efc57ec7ee92
	.xword	0x8880fdc84dbceb4c
	.xword	0xcbf3fbc89dc28875
	.xword	0xd60f2c3bf970138a
	.xword	0x7afb9360f45c89ff
	.xword	0xded97eb8463b509d
	.xword	0x8341072ecd3ebce0
	.xword	0x8b4b61e72cf33abb
	.xword	0x8b99d0d9e490f13a
	.xword	0xb8056cd1c5264ac0
	.xword	0xa3daa1240784a04c
	.xword	0xd4885dd71a7cb824
	.xword	0xae0855a0ef9d86ad
	.xword	0x07f4261b543e7854
	.xword	0x1fc0c06ca0818859
	.xword	0xe4f389887f385742
	.xword	0x236800f11912ed16
	.xword	0x5c77ac91b9970c06
	.xword	0xe58db0e132f98520
	.xword	0x26f0861522f8c6eb
	.xword	0x7a5fb728855146ff
	.xword	0x37651c6fcc01ff02
	.xword	0x2a7ccbe8b134c74e
	.xword	0xa82825e4561b0c5d
	.xword	0x0af1c9f1e4e209ad
	.xword	0x9fb94278df1cea0a
	.xword	0xa13854dc2bfe0e0b
	.xword	0xe08b2e96da2f0049
	.xword	0xf52b35942711b836
	.xword	0xa7d327e08f9e5ec6
	.xword	0x6b00b645fc15e400
	.xword	0x3ff3a6d24ada3d65
	.xword	0x28f5eaf77e5512fc
	.align 0x4000
	.data
data_start_2:

	.xword	0xeac6de27f8571a3c
	.xword	0x8aa2ce49ab90b99a
	.xword	0x9b69401f01bbe15c
	.xword	0xd2e5ffbb77151750
	.xword	0x0db9850691f61444
	.xword	0xf42299242956111b
	.xword	0x29adf7bb13b3fc5b
	.xword	0x047a482df746b1db
	.xword	0xdc92d422d9a430e1
	.xword	0x3ae13ec9cbca2ecb
	.xword	0x29748623bd0a8ee3
	.xword	0xa3afc601e592c7b6
	.xword	0x7374170d7d51bd63
	.xword	0x160836adb1cc131a
	.xword	0xd87832a8b1e70505
	.xword	0x477b13ef57bbde00
	.xword	0x29a8be9a8da4c2bb
	.xword	0x3f718875e86f9579
	.xword	0x057d87793cd08959
	.xword	0x656c52799f022129
	.xword	0xe09c22678e0e3a81
	.xword	0x94a4e01f3aee4bbb
	.xword	0x28dc4e8da5f277ac
	.xword	0x656dcdce0ddbd6c7
	.xword	0xcecd76a46b48ec83
	.xword	0x28d35271048c82ee
	.xword	0x3cde1a60f3a1f776
	.xword	0xbdf1bd70c94e3f9f
	.xword	0x0ab3bce7832d7707
	.xword	0xbe57c8bfa3e346ea
	.xword	0xc9136c3c508d2d8a
	.xword	0xeadafed0a18ef5be
	.xword	0x31b1825fdfd82993
	.xword	0x423ce12c33361010
	.xword	0x84e4b2a80264d64f
	.xword	0x24505092740fbf8f
	.xword	0x1474eaf9c0413096
	.xword	0x1196815283f811f6
	.xword	0x995d9d57cc392906
	.xword	0x06e8795ea70b570b
	.xword	0x179d98d4195984e1
	.xword	0x309c162def4d6ecb
	.xword	0xef1689d219a3c102
	.xword	0x58d72502e16849c0
	.xword	0x01c786ea1e2cf6bc
	.xword	0x1135087d0a321918
	.xword	0x7e381de43a040fd8
	.xword	0x180a95661051fff4
	.xword	0x84186fd3991d1054
	.xword	0xdb112b1edd5c58e9
	.xword	0x30e9388bb044deab
	.xword	0x9264779e434f44a4
	.xword	0x5c8a1004f4aa3985
	.xword	0xeebc8819afe00eeb
	.xword	0xd9123aadecd7407f
	.xword	0xb5f303364325f3c4
	.xword	0x94805e5aad883807
	.xword	0x8b299c32d7c35d05
	.xword	0x82bd28d7fe2f31fd
	.xword	0x515d592282a8566f
	.xword	0x1244ecb4dee41f9e
	.xword	0x69d0876b130ca8dd
	.xword	0x146bb6fe62674bfc
	.xword	0x802cea7a46badbbc
	.xword	0xd0fa429f0dcd9d1d
	.xword	0x8fa126e041533f2d
	.xword	0x01dd044d994f3dcf
	.xword	0xa91033ad725771ba
	.xword	0x932e5bf92619f98f
	.xword	0x6d21c84b7191c091
	.xword	0x39bdc18268ad0c9b
	.xword	0x0035a77050a64285
	.xword	0xb4d6c39a086ac57e
	.xword	0xeba1fec61aa1c0c5
	.xword	0xb508d8356aee1847
	.xword	0x35e5294bce1cdc26
	.xword	0xca8f632161a91b52
	.xword	0x92a0519949c26f5d
	.xword	0x61436f5383ce2b11
	.xword	0x44b84a3f0dd1c503
	.xword	0x788ac73d307eda02
	.xword	0xd6b1af99d56e19a1
	.xword	0x52a51f240b001ca8
	.xword	0x0b94c8db731c151b
	.xword	0xe1bf5b89b7cc00e5
	.xword	0x19ee1ccda71ead7f
	.xword	0x8e7b5be191c6b803
	.xword	0x1bdd18f164d010df
	.xword	0x798b754041531f66
	.xword	0x8d4346f105661e11
	.xword	0xe2469973ff8ebce6
	.xword	0x04d0394a431857b8
	.xword	0xf5ebacd3db31d67d
	.xword	0x099855c3bb070374
	.xword	0x4fe438cde32b8028
	.xword	0x2f4f144489469d7a
	.xword	0x2a491af6d5cb41ba
	.xword	0x61daf2cf1e188a21
	.xword	0x65d957982c78f01d
	.xword	0x7400e655935a7882
	.xword	0x951611e033274ac8
	.xword	0xc125d26c1007b890
	.xword	0xee55f6bc97b0e2a1
	.xword	0xa02d6aa40c317edd
	.xword	0x29782d31b1f8d3ee
	.xword	0x643d990fef33662e
	.xword	0xc06d58bfa6485d9f
	.xword	0x9a53ee760d85ef23
	.xword	0x5a1997049af33588
	.xword	0x826db41914fe2af2
	.xword	0x10d227eb77d1545d
	.xword	0xad356cbd8e95097a
	.xword	0xe1a8e2c6e2c0cbad
	.xword	0x4f9aab333de9809a
	.xword	0x1bf2d6bd8a31905f
	.xword	0xc2f356606cf0f8cb
	.xword	0x5ebfa9432bb2c1a6
	.xword	0x7f6b6f92e0802874
	.xword	0xf5784ba1d6c52a2b
	.xword	0xace9c20f73fd3263
	.xword	0x7b309fabd4da901d
	.xword	0xe131f8989e7870c2
	.xword	0xe325af2966b32886
	.xword	0x5f4bb883469927d6
	.xword	0xfbeef2c17510ba7c
	.xword	0x1fe4720eac22b1d0
	.xword	0xbc6aa84447459fd2
	.xword	0xba7b9e80c49fc734
	.xword	0x5333be52d3926b38
	.xword	0x62933403d43381a2
	.xword	0xacb5e2ae0bcc0722
	.xword	0x3a434a7ebca72605
	.xword	0xf48831b3a479bab7
	.xword	0x9dd2c2fc93b81c03
	.xword	0xf01e241a41e74f50
	.xword	0x12d3ed280c7f4d04
	.xword	0x37b2c8fa8adb0e33
	.xword	0x6171da79e71af8a4
	.xword	0xd9fb8f2475aa10f3
	.xword	0x568012e86d60c889
	.xword	0x6b14d33bc9a9b56f
	.xword	0x7eff4961ba9fa4af
	.xword	0x5d32e08f8a37cce2
	.xword	0x9d0f68e6869f4c62
	.xword	0xb9a0851616082e02
	.xword	0x03f93465d5a47a7d
	.xword	0xc1fb56ad9a5c35c0
	.xword	0x71f88273014fb776
	.xword	0xacc82d29033b8fea
	.xword	0x128b3a410943de78
	.xword	0x23f0bd6fa2288d79
	.xword	0x93e31315208ae145
	.xword	0xb393d55d3c68868a
	.xword	0x97bc687a9f4bb7ab
	.xword	0x5808c65af58204cb
	.xword	0xb6b3e8761d994238
	.xword	0x5c4c968e1bc6f041
	.xword	0x93b7eaf4e4b3ae02
	.xword	0xff8a3665a11a0e89
	.xword	0x68afa7184208d1c1
	.xword	0xf68094735176d340
	.xword	0x3d01cca15cd490eb
	.xword	0xeea5392adaa08045
	.xword	0xe6ac413d6fd7dd9d
	.xword	0xd0fada42c215ed82
	.xword	0x5cdd862ca564e94c
	.xword	0xccbb361f33e7d13a
	.xword	0xd183bf151acddd32
	.xword	0x8de76befe5c1cc5f
	.xword	0xb32132970124055c
	.xword	0x91b34a8660162a6c
	.xword	0xeab0e9af0254efe6
	.xword	0x7157cd756eab9f7f
	.xword	0xae15c0dd934ad707
	.xword	0xba90fa160a4c11da
	.xword	0x4e704cd417bccb04
	.xword	0xd0310021bc6fa142
	.xword	0xdd7c9074e9911dcb
	.xword	0xa5ef7340692633cd
	.xword	0x84e74a4e75116b5f
	.xword	0x29ebcadaa8cfe3a2
	.xword	0x45365f11868b5341
	.xword	0xfc05cdf0169e5e16
	.xword	0x5da5d091c561438b
	.xword	0xdce0e2216dd381ac
	.xword	0x932b5425981385cc
	.xword	0x473dceca5690a642
	.xword	0xbb67e6b5ee2666ab
	.xword	0xaa2badf693700ce0
	.xword	0xb8a9b7db8241c522
	.xword	0x32623029e0a89b1e
	.xword	0x2737d44cab8e1331
	.xword	0x3060e462c1fae01f
	.xword	0xed80d9d4b6298056
	.xword	0x340c60b67bd2f8bc
	.xword	0x94b5dca3d4af2398
	.xword	0x3f4f97c0d1c21425
	.xword	0x1c90f98a6d1bd0c9
	.xword	0xf414a09b714595f2
	.xword	0x936a4d299d7e7360
	.xword	0x07aabeb5478393c1
	.xword	0x12c37437671182c3
	.xword	0xbb7d4a586f780f00
	.xword	0x34a8a384ec65380f
	.xword	0xd504d0aa23b0d101
	.xword	0xa345a8de52e5dbff
	.xword	0x271f13645ad55c73
	.xword	0x4331ae4864938e16
	.xword	0xba924555e075afc0
	.xword	0x54319e89572eaf91
	.xword	0x7794ff915d3d91bb
	.xword	0x7696c929de75d0ac
	.xword	0x48ef005d8964c274
	.xword	0xe2a4b2497ccde9de
	.xword	0xfd6fa516b171b5c3
	.xword	0x222d226202966ff4
	.xword	0x39c67b954a071476
	.xword	0x2abbd88d976bece3
	.xword	0x9923da018f06b62d
	.xword	0x75fc059200b03830
	.xword	0x14d71822003d0d53
	.xword	0x2ab68c3105f75633
	.xword	0x363cfbbf2216dd13
	.xword	0xc06e60e880869970
	.xword	0x8b53a0dfc3a60841
	.xword	0x2ca7c9306be481d9
	.xword	0x720a4bcae806c823
	.xword	0xa11055ba29fc35d4
	.xword	0x8323fb5a6a2f3ef7
	.xword	0x8db46628c35cff9b
	.xword	0xc36e1e761d46b7ff
	.xword	0x117f8bc239de0712
	.xword	0xd120ac5b3e7c88a4
	.xword	0xeba5f654b8e11f82
	.xword	0xf93ff8e36157f102
	.xword	0xdd9e5233f1085962
	.xword	0x54e8c103d9a76b84
	.xword	0xf11060f12dd43f26
	.xword	0x09191b34ba105356
	.xword	0xbe8a07e09949195e
	.xword	0x368df4bd9ceb41b8
	.xword	0xd27cf1ed884ddf38
	.xword	0xa83c5c8af9e29392
	.xword	0x115fb252c39e81d9
	.xword	0x5f094a5e67b4412d
	.xword	0x5cb0fc8cd4ca0674
	.xword	0x797ea60360f82c96
	.xword	0xc27bc894586df3b7
	.xword	0x627febf2c68e70b7
	.xword	0x8deb783e38184398
	.xword	0xf0cf61333d39fc9c
	.xword	0x54f2115b8686da28
	.xword	0x17582530deaa1e7e
	.xword	0xfb7787fda88114c1
	.xword	0xed8cb184668e0995
	.xword	0x85320c60d89b922e
	.align 0x8000
	.data
data_start_3:

	.xword	0x1b8b9b4f4010fd6f
	.xword	0xf0954b35cb7092d0
	.xword	0x68d9bdc2a39f1d95
	.xword	0xe4c5ce5ffcf333b2
	.xword	0x6213eeb000a8af97
	.xword	0xbb0fae33640998b9
	.xword	0xa945eb8816756ebc
	.xword	0x167f98baec85ac2c
	.xword	0x11a99bb4732f6ac9
	.xword	0xe36a0c01a1684553
	.xword	0x4b5a497298974f54
	.xword	0x2d0dd7d6b9ab25ba
	.xword	0x7d4ea3084793a0fe
	.xword	0xb82e1dcd82e609a9
	.xword	0x31c5e8cc4bd0d67c
	.xword	0xe4f6f2cb8909317e
	.xword	0x56e223845cb53110
	.xword	0xe1184011c5cb82d8
	.xword	0xcfd6372b66dd55bd
	.xword	0xe32ae81ef3498613
	.xword	0xe6add886ffe10c4c
	.xword	0x07276127d395b807
	.xword	0x6cace7bee28aca25
	.xword	0xdf04ca1f11a80101
	.xword	0x4701ded3b8253aa2
	.xword	0xe0f02aada8a8db18
	.xword	0xb59775280e20285c
	.xword	0x3c459d612d621d01
	.xword	0x14d90e327036a080
	.xword	0x5f38293fc4884e90
	.xword	0xe273f4d822f46f5a
	.xword	0xfcd56158ebc1fee9
	.xword	0xe353c4b266b3d24d
	.xword	0xeb91e166fd7ced1b
	.xword	0x5b56a167256bc533
	.xword	0x18fe5912d73c8799
	.xword	0xb68d05cb421535d7
	.xword	0xf98eeb51740eacbc
	.xword	0x4b2e9f3225fb0161
	.xword	0x0f48441b5c28a61e
	.xword	0x421d508ef7ce78b4
	.xword	0xb1306314627822ad
	.xword	0xa0050d9db07420f9
	.xword	0x3754f1e7f3aa3296
	.xword	0xb81deb50e1e6486d
	.xword	0x71e7b2330c6b4bef
	.xword	0x7195ff0ce4c64fc8
	.xword	0x8f1498c3683998b8
	.xword	0x1227b2196aaecb78
	.xword	0x8150b1b5a3ff4920
	.xword	0xc3b1dd1067fac6ce
	.xword	0x3ee7228df79fbbe0
	.xword	0x3492e29d56bc484b
	.xword	0x5a5853ddf55e3530
	.xword	0x1223d9dbe16ae8bd
	.xword	0xb361b843712c2e7c
	.xword	0x591287bf5c9b30ea
	.xword	0xb6e23d1ed23eec2c
	.xword	0x64eaeddbdfdd0374
	.xword	0x1590f622d3fe2e4b
	.xword	0x177cc302dc48ec9d
	.xword	0x40ba30dbd0772c1a
	.xword	0xcd5637173178f20c
	.xword	0x32fcee2766a30275
	.xword	0x211d4d105a55ae11
	.xword	0x20571e8ffbeb1832
	.xword	0x649721e1ae4261da
	.xword	0xd56bdcf01309586d
	.xword	0x6fa1a8b79ab3f06d
	.xword	0x40fd5cd2ad441531
	.xword	0xa1303d6bc755d6d8
	.xword	0xaab9c88c222a585b
	.xword	0x73f726dc0788a61c
	.xword	0xef4092b97a039793
	.xword	0xfe73808c76f379a9
	.xword	0x0d82f49881a60965
	.xword	0x12b289c5f5d7b8bc
	.xword	0x6f6aea082eced32b
	.xword	0x9b5a64590ca63f1a
	.xword	0x1437ed4a92b790ab
	.xword	0x7507c8c3f8a912df
	.xword	0x5fa638609cb66e25
	.xword	0x4b48ed68dad78462
	.xword	0x321c013ab905cbe7
	.xword	0x8cc1205df39e5e6d
	.xword	0x2511099823368d12
	.xword	0x31cecbc3fb85b536
	.xword	0x5726db2e03f3e297
	.xword	0x37933629ec1478a2
	.xword	0xec0ca61d007b3be9
	.xword	0x60d9ebb697391225
	.xword	0x845fb3327dcfc8b6
	.xword	0xda5f4d8af80e89d8
	.xword	0xc7658f91f3e2bd92
	.xword	0x99226554cd61123b
	.xword	0x40e9c743d129e23b
	.xword	0x576d83c686d0d4a4
	.xword	0x5d3d5bd7777ac2d0
	.xword	0x2f09ece72801ef45
	.xword	0xd6ac0bd9828ef0f4
	.xword	0xbafb850468b843fc
	.xword	0x33df899ed04cf9ee
	.xword	0xbf6b65e61372cabd
	.xword	0xf896d4f4c4b88aea
	.xword	0x564df9d7102af944
	.xword	0xcc633b307159e031
	.xword	0xe4e6f1996e992ba9
	.xword	0x88d390403f0ce759
	.xword	0x2109a240f29ba9c6
	.xword	0xd95d7530b05de978
	.xword	0xdb5388965d8e0611
	.xword	0x5e2ada012f54104e
	.xword	0x1a14a90080754925
	.xword	0xc0d4ee0582132472
	.xword	0xa9ad9e9632d5149d
	.xword	0xccd9fb086175aef8
	.xword	0x73c31582ce6d61f6
	.xword	0xabf3d957c8c59cef
	.xword	0xe0a14cc508844b33
	.xword	0x53316c5b2fbe8e3f
	.xword	0x467fbc0b8cb3cc9b
	.xword	0x42e6bbae2e4b80cc
	.xword	0x88f81eef2ed9b0f3
	.xword	0xc0dbcdcf0d18c831
	.xword	0x3d36a0d30de99ea1
	.xword	0x71e87c94399817db
	.xword	0x87af9d2a7efc8895
	.xword	0x363de58e3dadb759
	.xword	0xe38571283d3adec1
	.xword	0x278ac5ff9a427fea
	.xword	0x0a3abd5a0f5da08b
	.xword	0x387cd6cde27284ed
	.xword	0x66b63b1504b5c465
	.xword	0xa586c6399134fb57
	.xword	0x83176caaafe04c41
	.xword	0xc51722d15090af37
	.xword	0xdcfdcf7a8815177c
	.xword	0xdf57ba0a0c2c9db6
	.xword	0x381ebcf6ec680988
	.xword	0x589b54b837e47b96
	.xword	0x87eb6ca3745b0e1e
	.xword	0xde6714ff2ccfd37a
	.xword	0xda90a3c566f4bf6d
	.xword	0x1d30c0ee4d603b9b
	.xword	0xccc802ae5402d031
	.xword	0xedc99e796fe89d1d
	.xword	0xfef2b3966e51bb2e
	.xword	0x0a9bde598a3452b4
	.xword	0x3b60f15623fae79a
	.xword	0x439b7d62b93b9a5a
	.xword	0xc2c5ff7ae4ad367a
	.xword	0x3e2395071f6645e2
	.xword	0x0c5b730aeb59f437
	.xword	0x0034d82370464926
	.xword	0x9c5a31dbe3df3501
	.xword	0x1dd538d6282bfe1c
	.xword	0x0dd39cae4f977277
	.xword	0x2a733cd37df679b3
	.xword	0x01948a9173f5a64b
	.xword	0xa93bfe7419ccaf7d
	.xword	0x4a0987ffc162ffd2
	.xword	0x8e3e0ec3eeca91b6
	.xword	0x1cf62063f51e4139
	.xword	0x300d623a99495697
	.xword	0x18c3eb48bd744f1d
	.xword	0x055963bf2a72570f
	.xword	0xae809cf2f883c955
	.xword	0xc284932b0a81045f
	.xword	0x5a95ec72f3d5c342
	.xword	0x88742536d6ab065a
	.xword	0xe5f691b627775352
	.xword	0x53d30c9008b634e4
	.xword	0x323b4ba624ceaf61
	.xword	0xa6fae08ec728f4a7
	.xword	0x23f5dcc451f39299
	.xword	0xd35e17752d9a74cc
	.xword	0x3455c4d0421d02d4
	.xword	0x60d349dd48ec201a
	.xword	0x63ef0afd58118db6
	.xword	0xbc47a06883b1c10d
	.xword	0x9a2301b4deadbe96
	.xword	0x03d2d8f8c9c6362f
	.xword	0xe079b4b720603659
	.xword	0xe4e6a850fcdd25c4
	.xword	0xb7e6e9dd70e454c1
	.xword	0xdc2e1f601a0e0214
	.xword	0xc42c9d019fb92b9b
	.xword	0xf9d629b9ec336948
	.xword	0xa5caeb02aef574de
	.xword	0xcce07910958443c2
	.xword	0x0ec286aadd052787
	.xword	0x540d95b61adf527a
	.xword	0x5c7e4474b3a08ca7
	.xword	0x165014b9c6c71e6f
	.xword	0x0810a8dbe772ae01
	.xword	0x5548fbe0a4b1a624
	.xword	0x9c7149d37517f006
	.xword	0x404804133a448e52
	.xword	0x1c1f0bb659f845df
	.xword	0x1ab690ee84deb3cc
	.xword	0x191b81a203a827e6
	.xword	0xdaa39a03356cd33d
	.xword	0x006538ea79a09870
	.xword	0x55867584eaa6d0c9
	.xword	0x89101b80d6d3dd34
	.xword	0x8d2fe9783619b115
	.xword	0x9c5150ddda370717
	.xword	0x66d744b6216f526d
	.xword	0x12ee8e068ac76402
	.xword	0xeb092c18651911c5
	.xword	0x1d1aa5a947978148
	.xword	0x53eac892dc344a6e
	.xword	0x8c012b32956dc215
	.xword	0xe97d261ccf842a33
	.xword	0xd78be18aeddeb8bb
	.xword	0xc435083e0029dd06
	.xword	0x6d944f10cf4a9183
	.xword	0x91d65d7aea0fd8f7
	.xword	0xaef2e9b9e224f316
	.xword	0xe76d692b69418472
	.xword	0xde4d7ceb86017ab9
	.xword	0xcf2cef87ac837d28
	.xword	0xb8943d94b72e35af
	.xword	0xdacac997e04711e4
	.xword	0x5034f44d5e2ae05c
	.xword	0x47988141da5aa4ac
	.xword	0xe583d32abaf867c7
	.xword	0x1dbc5f3d584d2a28
	.xword	0x28c0afe02bf940fd
	.xword	0x6a70b7f8ae53f88f
	.xword	0xe04933c9a421d437
	.xword	0x954b0f0e86172344
	.xword	0x77273a28f13fc483
	.xword	0xb2386c5e18fd7665
	.xword	0x5e65c29458dc88f8
	.xword	0x7253da0154b96039
	.xword	0x0bb73afa16ca094d
	.xword	0xfa3f53a0a5a564ed
	.xword	0xd7474553d2e1b963
	.xword	0xaaaef351b6e2042c
	.xword	0x6c8d2ee1c752e60e
	.xword	0x7807a5301f23c902
	.xword	0xaac37924f7a93cf7
	.xword	0x8a0abcf123464b73
	.xword	0x3c808f200ff9a5b9
	.xword	0x0f3d8e7e6c9670db
	.xword	0x30e5b3ddadf8e278
	.xword	0xde93e00803b9fd7c
	.xword	0x92daaaa5fda7a69a
	.xword	0x355a94d53f55b49e
	.xword	0xf6c629884bd0a116
	.xword	0x42fa2f2958da3924
	.xword	0xfcfeb48c4696e9c2
	.xword	0x13d1c5aad8181d27
	.xword	0xa817bb5f797372a7
	.xword	0xb19951b764bf678f
	.align 0x10000
	.data
data_start_4:

	.xword	0xa6d92dfac570adfb
	.xword	0x517ee87874e4847c
	.xword	0xe64a074714e42bb8
	.xword	0x39b26725bea10a5f
	.xword	0xe7409c60a67a8fa1
	.xword	0xe17a3cb65f1f0c7c
	.xword	0x46189d211ea58c9f
	.xword	0x3ea7876694c05399
	.xword	0x9620e5208e756c34
	.xword	0x907c80abf44ee121
	.xword	0xd784c096617b6c19
	.xword	0x809f35b2e6f02fa0
	.xword	0x710f387881c65e2b
	.xword	0x9d3db8f00bc81ba0
	.xword	0x28a09e4c900be763
	.xword	0x6c202016bef5b7bc
	.xword	0x5f4f60f84c8b22f0
	.xword	0xbb78ceabbe220d17
	.xword	0x10337dba260c7be1
	.xword	0x9d47ce13aa6adb15
	.xword	0x8d25203484da5275
	.xword	0xdad00d9ed2d5b182
	.xword	0xc80b28de4013603b
	.xword	0x8acbb6713bff7b8e
	.xword	0x09863b0859ff5746
	.xword	0x5e81224fb01f1e9b
	.xword	0xfacd216fe18b71fd
	.xword	0x59bbdc0be02d8dd6
	.xword	0xe7289f83b6ee05f2
	.xword	0x68d786b5fe66039f
	.xword	0x258b6110763d1392
	.xword	0x0e164f5b1d759d78
	.xword	0xdc9fab4de2292d37
	.xword	0x46ba020233c215d0
	.xword	0x180a25d3dbe3f678
	.xword	0x15f724b90856a8a3
	.xword	0x40f3141afb0e7c55
	.xword	0x59eb7c230a9ef633
	.xword	0xb977526db4793b0d
	.xword	0xae60cc8e3c7cb801
	.xword	0x3c1abde5537a5ce1
	.xword	0x1df5e904afdb98b3
	.xword	0xcccdb3f82f6ca3b0
	.xword	0x7d47fcfafb70c402
	.xword	0x09a541e58e20fd01
	.xword	0x1d75abb75145c212
	.xword	0xb6674ea54a46d19e
	.xword	0x16c683ecb8d4fbef
	.xword	0xb4ce77fd6af17f45
	.xword	0xf3c8a9d82fb928c4
	.xword	0x95bbc0161f225754
	.xword	0x0643c5fb5e11868d
	.xword	0x2dca81379cf6e026
	.xword	0xf2dd15a194d68e19
	.xword	0x4b6c21f4cd62a06b
	.xword	0x3b75a44aec39b706
	.xword	0x50e227dc4af4750f
	.xword	0x22a612b0e7f2814a
	.xword	0x6e499be99357a257
	.xword	0x2071d8193ae6ed28
	.xword	0xb6c707e95131ff9b
	.xword	0x062356f00fa9d610
	.xword	0x7835c52703b2502c
	.xword	0x900aa79c9576082d
	.xword	0x3e8bd7e72b07f791
	.xword	0x6c8a81a617a77695
	.xword	0xa9f46c395777543c
	.xword	0x872541cdd5573793
	.xword	0x7975bbe59a540860
	.xword	0x3a79ba07a18af913
	.xword	0x5f666c7f26158f13
	.xword	0xd5db7dd7de4415ec
	.xword	0xc72ef1034d0b082d
	.xword	0x9c560953a156e804
	.xword	0x16767c58ffae4e86
	.xword	0x4ed35ef2fa1e6d25
	.xword	0x78442674e1651958
	.xword	0x42202f1a94e1fa85
	.xword	0x73dfb57b8bfb6ec7
	.xword	0xa3d3fde931e9913c
	.xword	0xac37a251b5226e49
	.xword	0x7804842137e2a278
	.xword	0x4c2d73998c84e158
	.xword	0x9f65860127f68c0a
	.xword	0x0d00b76765f08f5d
	.xword	0x1ded60862b3ef4b1
	.xword	0xc854a7f47cd5bcc5
	.xword	0xbc50752b4621d32b
	.xword	0x6d48e0ba0e9d48f6
	.xword	0xd38ec6f49fce7524
	.xword	0x5568c4c7e154426a
	.xword	0xd85a0479f5e8e4e1
	.xword	0x5f0fd5e9e58b7d34
	.xword	0x90149027c2c2081e
	.xword	0xde66991606c31902
	.xword	0x3ecfe6b81d664399
	.xword	0xcfa0f2e074be1229
	.xword	0x486f5440b5464802
	.xword	0x6f69d66d4cd366a7
	.xword	0x0b5971c80a150a63
	.xword	0x1b4ac8d450d24a9c
	.xword	0x257e68e40f4b2b95
	.xword	0xb73bb5367409bfdd
	.xword	0xc6f808381a4595b0
	.xword	0x02cdab92e1927e3b
	.xword	0x625b2e59c1d5e1c8
	.xword	0x02316ed10c193da5
	.xword	0x687d4f13890666c6
	.xword	0x3e786e23ee9edc90
	.xword	0x6e5da32eea299fd6
	.xword	0xd1a6e5fe9151406c
	.xword	0xd4d15365c1151a57
	.xword	0x866f5e38bc1713a8
	.xword	0x00777f039f58d78b
	.xword	0x30d33d4a2097db17
	.xword	0xe60015bf5be30b9b
	.xword	0xe75b9ab35757bf84
	.xword	0xfe8d92fed27aad5f
	.xword	0x2c1c91ac09ea91e2
	.xword	0x622698871718a34d
	.xword	0xe5c6ce13f3cc31d6
	.xword	0xbd20d6b55c2fc832
	.xword	0x463e1112eee6f960
	.xword	0x9fb3f3999c264896
	.xword	0x0c1c6bab61c4415f
	.xword	0x52e9cf6b353da8c1
	.xword	0xa83ad053d3c1efdc
	.xword	0x7db687a24b7b2b5c
	.xword	0xf436b8c34908c0c6
	.xword	0x4d998607770bd572
	.xword	0x716fda366649f378
	.xword	0x77b7bca41e711c73
	.xword	0xf3f51385c928c05b
	.xword	0xad1a04cd57d9f282
	.xword	0x45f8a48b560fa503
	.xword	0xa1416f694f04054c
	.xword	0xcb5f7284b3ef9f16
	.xword	0xac3bd7a6876d277f
	.xword	0xa211a49b14ff0d42
	.xword	0x72f18cb234611682
	.xword	0xaf120b20c35226db
	.xword	0x3666119ce16254df
	.xword	0x4c908d15adb07cfd
	.xword	0x1ad108b311634332
	.xword	0xc83ad1f47e988586
	.xword	0xef7d6de1535707ba
	.xword	0xb89e66a01d8e8180
	.xword	0x2bb0b24ac87f2d70
	.xword	0xeb6ce0b9c5bb07f3
	.xword	0xb1ebcb9202d01b4d
	.xword	0xc9dd045cf70d91c4
	.xword	0x2406b5c915e2f050
	.xword	0x920eb13eb35aeb64
	.xword	0x3c3cd9ba2293e6fa
	.xword	0xc4c41ae452c67912
	.xword	0x59bff24a7fa236eb
	.xword	0x380c3f0ae4714860
	.xword	0x2006aeb20501c33e
	.xword	0x20412c6c300b1e6f
	.xword	0x3768893ab5bdb825
	.xword	0x7aa2c362c436830a
	.xword	0xa1c17cac8aded0e1
	.xword	0x74ce0f2e985850c4
	.xword	0x0e12aa0ef404bf8c
	.xword	0x0833982784305bbf
	.xword	0xb0f28d054c213083
	.xword	0x5de1898091a79927
	.xword	0xb98e163dfc04746c
	.xword	0x5c39d37c73c64a1f
	.xword	0x4a62c204429b79d5
	.xword	0x0e7fd6b7491138b2
	.xword	0xca8923daba70b719
	.xword	0xde1e457ad03553e3
	.xword	0x6cb5aede70d7ab34
	.xword	0x62a2b0ea03895836
	.xword	0x4a8c2daa84e0f3bc
	.xword	0xd24db9c3b894fe08
	.xword	0x6117ba236d05bfd5
	.xword	0x28d94313e0580270
	.xword	0xc5b2c1e12c96f01d
	.xword	0xa593dcd566c8bbfe
	.xword	0x48da9dbcd9119e05
	.xword	0x76a4294c6e9996a4
	.xword	0xf71796e6fc3b5c58
	.xword	0x7264986aa2441f8e
	.xword	0x763f1582d24cee97
	.xword	0x2741ae2c89c14fa6
	.xword	0x97a164c22445c854
	.xword	0x0963a3a605f15fa8
	.xword	0x24b73b5d8f91811f
	.xword	0xaba56de9b5a616da
	.xword	0x9c491cce87163edb
	.xword	0x7d1c0bef5c8f5e3c
	.xword	0x5aa0979881d127a2
	.xword	0x4846a013dfb67cd5
	.xword	0xc30ec7d406c1a1b4
	.xword	0x4116b03496c8d9b1
	.xword	0xde9d40f5ec7a0601
	.xword	0x8fb87976eebcc496
	.xword	0x6149e24fcabf1f6b
	.xword	0xfc9c83d012eb3ade
	.xword	0xce2e4350016b7eda
	.xword	0xf662016a9692296b
	.xword	0x2a65948dc4135edd
	.xword	0x4c792e5e4ed33acb
	.xword	0xb826a0f1e521b447
	.xword	0x2bd59994ec4fb189
	.xword	0x77c3993153b161c3
	.xword	0xfc7d5cb5455de4ce
	.xword	0x234c6954b77e18f0
	.xword	0x87f71b27ca8c9eeb
	.xword	0x6895edd4d77fab0f
	.xword	0xcfddd1e8152aca11
	.xword	0xfa4f5bf92bdb9613
	.xword	0x5d9c6c6fe3a11807
	.xword	0xac66db6d1b7ee03e
	.xword	0xe6c30f064d405959
	.xword	0x0d1f11082e198e88
	.xword	0x942680e5a58f50a7
	.xword	0x593343b773e289d3
	.xword	0x1ab21b398de8e34b
	.xword	0x0cc033c8ca64a0ca
	.xword	0x92875f12f77e26a0
	.xword	0x5d7b10c74f8ea33f
	.xword	0x7fc357c17eee60c6
	.xword	0x1cf2551872a057a9
	.xword	0xfeea8435a78d18a1
	.xword	0xa7f54360ad667f81
	.xword	0x4915420bc1cf6041
	.xword	0x9ca27566517cf451
	.xword	0xcba58afe7ba203df
	.xword	0x7c79686133ead82c
	.xword	0x6f37e92fe42eb4a8
	.xword	0x536c747eab0f24f1
	.xword	0xc1b4462dc87f324e
	.xword	0x0f9551025f7efdce
	.xword	0xca9d24428f584843
	.xword	0x77648528215ec48c
	.xword	0xccd9a6a2f9251fd3
	.xword	0xb3285fa334298a91
	.xword	0x1685479401e8a88e
	.xword	0x5c9f27c0f1bb39b8
	.xword	0xa254fd2a1ad18ac6
	.xword	0x70c47589a99d5e12
	.xword	0x92d68cebcff61219
	.xword	0xd983c13d28f04bfd
	.xword	0x2238577f9a079bc8
	.xword	0x70b7b2b7ddda383b
	.xword	0x4693da4b2feeedbc
	.xword	0xef2fe1542124b22a
	.xword	0x5577785884584304
	.xword	0x50896f67c2b0c186
	.xword	0x14c3431c7d3718e9
	.xword	0x0856901285918c5d
	.xword	0xd78106603f962d1d
	.xword	0xe1d37e70f0dd723e
	.align 0x20000
	.data
data_start_5:

	.xword	0xe0f6d1aa539c3aa4
	.xword	0xc16f0b8b8d8249b0
	.xword	0xcbf71ac274261a0a
	.xword	0xe86c3c270fc0ae7d
	.xword	0xc35c11e3dba2dfa7
	.xword	0xc473851bd739bb6b
	.xword	0x921a7d262c8ccc00
	.xword	0x1370f13efbc8be15
	.xword	0x4de61161b77f53f9
	.xword	0x53b9d11cf031b3d2
	.xword	0x17288e8912c223fe
	.xword	0x549476c32da274e0
	.xword	0xfabaf5edf09bd9f7
	.xword	0x17fbc9119efc3cb7
	.xword	0x1aafe908b7bb16e9
	.xword	0x3b4ba6b52ad5315d
	.xword	0xa3353204227d2852
	.xword	0xf58452a70cedf209
	.xword	0xa5d341ba730b94c0
	.xword	0x3a0e6559729a55c1
	.xword	0x34dd1330519980af
	.xword	0xa53808699ecb19f2
	.xword	0xe64f056bff17e86d
	.xword	0xd2387f00f75b983d
	.xword	0x5ce6c97359fce96b
	.xword	0x262bb7883934c77a
	.xword	0x5eaaf7d79597a088
	.xword	0x0b8c65124ace39bb
	.xword	0xb1f0cea41d5b183d
	.xword	0xcf1976b13b8a6976
	.xword	0x7b105a9c9089e61d
	.xword	0x3223bb7d9bae0a87
	.xword	0x7316b6c4e05abdbe
	.xword	0x297dcbc6ffd8d42a
	.xword	0xe626d0487acdccaa
	.xword	0x6c60aea8627e360e
	.xword	0xd0555fd2d024d062
	.xword	0xb2d97d377eb2fb01
	.xword	0xdfa3e14a387148f5
	.xword	0xb156f6048e2dd7a0
	.xword	0x84899326f4d4fc40
	.xword	0x4de5439272d13d45
	.xword	0x277a5b15c6f2e506
	.xword	0xdb7adbd88d9a4101
	.xword	0x626d59d8cb02b711
	.xword	0x58af698b03e23a3f
	.xword	0x8e884fe0dfd3b882
	.xword	0x38420d224e173c92
	.xword	0x4653cec9e171bf90
	.xword	0xab89e62fe3afbdb5
	.xword	0x790ba8edcca4d491
	.xword	0x5b8991344e84c980
	.xword	0xeab71e2ca0ca1300
	.xword	0x99d59523eb037e9b
	.xword	0xe0136334dfc13e84
	.xword	0x908a6b21da031112
	.xword	0x54e242c31395fab5
	.xword	0x841eca6979635aa6
	.xword	0xab30a52aab75a663
	.xword	0xb9019609142d187c
	.xword	0xf5f1c00b7a90ba02
	.xword	0x4f0c18119cae7192
	.xword	0x8ca60de227ea0c4e
	.xword	0xa60894402f3c6ab9
	.xword	0x22cda1eb3164c0d3
	.xword	0x97c27458d99482d7
	.xword	0xb8df657a99f9be55
	.xword	0x377818368df0a366
	.xword	0x3d0cf0968ffae24c
	.xword	0xd3b5dde37a687c93
	.xword	0xcf263143ba1fd259
	.xword	0x670a38afda6ad316
	.xword	0xe93fdabd8dd92412
	.xword	0xb404f6dfa04ab853
	.xword	0xae97b3aef28eee66
	.xword	0x3b1e5612e08f15dc
	.xword	0x330ff71a78819578
	.xword	0x72dd12f384e57ffc
	.xword	0xe0373d004021c6d6
	.xword	0xc8d8f062f6db06f8
	.xword	0xfb9261ce10bf2610
	.xword	0x72fa27681914e51f
	.xword	0xbffd0040c22208a2
	.xword	0x1e73867a12ad1e47
	.xword	0xf5a9cf0e0bf04df0
	.xword	0x3eb0d2916827baad
	.xword	0xbb78cd414947d2dc
	.xword	0x593e57e216eca2e8
	.xword	0x853c3ce98f0da392
	.xword	0xaef0a1f42002ed14
	.xword	0x1bb815f315d56b07
	.xword	0xf29ce8384692bb75
	.xword	0x87818ef64bd12d0c
	.xword	0x5db15d94f3b52e97
	.xword	0x014e91a944f70a1b
	.xword	0x9ae0ea3c77bf04db
	.xword	0x35ba66de3e01adbf
	.xword	0x2c4dbd85582e0e76
	.xword	0x08f20556e3ced150
	.xword	0x628b2187e42aaab7
	.xword	0x7c10011469b917e0
	.xword	0xe8d23be44239bc06
	.xword	0xe1e625dc350b6904
	.xword	0x0f40dde920ebe949
	.xword	0x404166927fec4058
	.xword	0x258477d46e928147
	.xword	0x60bcae6c3ee7391a
	.xword	0x89bc8abc2f01b098
	.xword	0x1a850ccc5ec3c8b4
	.xword	0x36874da1dd95de27
	.xword	0x5e92579bd3d32589
	.xword	0xf3c1c3547955f213
	.xword	0xc51aeaf45c0007a4
	.xword	0x46ad65176325dcdf
	.xword	0x21cc8cb53ff867d7
	.xword	0x05adcda235def25b
	.xword	0x47ee999817d43af9
	.xword	0x95715649fbb73b03
	.xword	0x86e1494a1e988355
	.xword	0x34abf883c23d5001
	.xword	0xd4ea5b5a3d0260dc
	.xword	0x870b2071cd77a05b
	.xword	0x3717635205eadfae
	.xword	0x3fe1cb73857aab07
	.xword	0xdbcc85abdf5baf23
	.xword	0x3fad64058ff0ee41
	.xword	0xc91e81723d206ab1
	.xword	0xdb311e608c3fa71c
	.xword	0x6acc46351dcd8af5
	.xword	0xc034cb0ff04068a0
	.xword	0x4217ed131f8b634e
	.xword	0x4e3d5ae1fbab9ea1
	.xword	0xa9116a55949e5b4b
	.xword	0xd1be7d94db003564
	.xword	0xd8b83cbbb008d9dc
	.xword	0xd920c3650809570c
	.xword	0x53a1babad43e4115
	.xword	0x3876eae03b482ffc
	.xword	0xeed0be5183ee63d6
	.xword	0x040e37df4d1eca0d
	.xword	0xe95bf505b3a055cb
	.xword	0xb74a27a016beefa8
	.xword	0x5611de8f84a00e01
	.xword	0x00e1e29a8f35ea85
	.xword	0x044b51eabece9a9d
	.xword	0x4e9142c931625aeb
	.xword	0xa5e21c8e401ae69e
	.xword	0x161106403e7ff051
	.xword	0x95b0106a75578b7b
	.xword	0x9cc732bb3be56eb0
	.xword	0xa84fcf3393c9d7d0
	.xword	0x35ec82ee543838e7
	.xword	0x2067154547f289ba
	.xword	0x0fc70b1cf5db576d
	.xword	0xf7efb66e37734ad4
	.xword	0x1a8049c3b741ba4d
	.xword	0x2e66cfef14cc8657
	.xword	0xa81072c0e507674b
	.xword	0xeb2284f191708b7b
	.xword	0xd02c9633b7fd849f
	.xword	0x1367421394b334c4
	.xword	0xe5d9d67372726ee8
	.xword	0x51357aabdd801b09
	.xword	0x34cdb22c7d692978
	.xword	0xe188f71724b35ab2
	.xword	0x5b5c069f0fc89b8a
	.xword	0xcb76cd72e88a855b
	.xword	0xf705d4f8206e4188
	.xword	0x58978b6c0006ed3b
	.xword	0x4cb51633f5640b61
	.xword	0xd920fcdaf69d322d
	.xword	0x4f77a4d7d4a91580
	.xword	0xacfe0fabad75d168
	.xword	0xfa76a92472dd4f04
	.xword	0x0ce02ba558f6c723
	.xword	0x464ca5fcfceb3475
	.xword	0xd8a0f10e37ff73e0
	.xword	0x36ea7ad574514f2a
	.xword	0x753805fd847b5f4c
	.xword	0x9d9f1cc256f77aa6
	.xword	0xa41493e2b5678078
	.xword	0x11fd41991236e663
	.xword	0x7fa94e32d5686985
	.xword	0x29d9df2ae4746bad
	.xword	0x261261b7f07ee07f
	.xword	0x836e4fb0c6d5808f
	.xword	0x28d07c3b11b73c4b
	.xword	0x725d53b5349abad7
	.xword	0x5079ebd1411d3fcf
	.xword	0x38c4efa2ad3ee5d9
	.xword	0xcbe8bfb3a905b0c3
	.xword	0x3f64a249f92a1888
	.xword	0xef4b0a14edf3e4dd
	.xword	0x44f7e2d8b4843c58
	.xword	0x4ae462ab5ac15a93
	.xword	0x480156ca40292610
	.xword	0xe1de1fe63449a399
	.xword	0xa2096f10c520eb6f
	.xword	0x316fbcf25b50f48f
	.xword	0x9f2f7e2db608a760
	.xword	0xe78929c30f3de0ba
	.xword	0x43a1c7eb33d29238
	.xword	0x22d925de24c3f86d
	.xword	0x089fb2fdf1322525
	.xword	0x07fcaa2bffecc702
	.xword	0x603819fed7efda3e
	.xword	0x9a9a8f3d33673aa4
	.xword	0xe72bb5f6c6e4e40d
	.xword	0x379cafc8e79a4ce2
	.xword	0x982cd44b58e076fe
	.xword	0xa4829d98b75d4a4c
	.xword	0xd90045e4fe64f39f
	.xword	0x3bec8281c7d0f044
	.xword	0x487bc0bc6511e9e1
	.xword	0xda3374706d5c6d0f
	.xword	0xd7712c4a64b9aa9d
	.xword	0x44dc61964f707458
	.xword	0x8aa615779c4e6672
	.xword	0x7e112940f0a8a190
	.xword	0xc29d045d4c9b5b8d
	.xword	0x3df61cdb2889ffc8
	.xword	0xf2d1173c903f4bae
	.xword	0xd0035177db687f8a
	.xword	0xc496a36f5666d28f
	.xword	0x9e56e599205d8bb0
	.xword	0xa75f8424046c7e98
	.xword	0xc7f09816057e7c2c
	.xword	0xfbc9d33f361ed087
	.xword	0x551dfd50436274e3
	.xword	0xef87434742c60a10
	.xword	0x2196149e3cfd066e
	.xword	0x3e69cb55dc7b8976
	.xword	0x1a30d17f8141730b
	.xword	0xf02674b3e48b2dfc
	.xword	0x1f59c7e138f7aaa5
	.xword	0x2a655eb31ec71397
	.xword	0x7cddfab561d5e3fe
	.xword	0x3270e6d8bcee0643
	.xword	0x0166dcc8eb199efa
	.xword	0xee1a88b8a76a6727
	.xword	0x54d1ccf92c2d0a47
	.xword	0x213e7f1091e64b86
	.xword	0x6df37c70f9eaaa1b
	.xword	0xdba5356113a68e5f
	.xword	0x43997840c69df7c6
	.xword	0x5d67d127e8fa4d84
	.xword	0xf0c3061235baa65d
	.xword	0xab45cf61cd06376c
	.xword	0x34c507309c4e3233
	.xword	0x06e3711162855002
	.xword	0x2fc6e813d2a361bc
	.xword	0x05ec2a150e151e60
	.xword	0xe0c0c42b225612a3
	.xword	0x95656e5a59c7debe
	.xword	0x25373304d2dcbe71
	.xword	0x582730b05163334c
	.align 0x40000
	.data
data_start_6:

	.xword	0x5607084a8aaea47d
	.xword	0x8b872c1d650bb144
	.xword	0x9010a268a2f9ba55
	.xword	0xdd2588964de15f86
	.xword	0x088238224d7e7a2b
	.xword	0x0d49fdca2d026686
	.xword	0xfe8dffaf06a42836
	.xword	0xd7105b409462bcca
	.xword	0xa142e7120a5c4ff7
	.xword	0x050cb0c0f5b1a424
	.xword	0x8067eed2ae4cc316
	.xword	0x4778afe1e8dd25d5
	.xword	0xcec519f36a384bda
	.xword	0x87b998436fadb11b
	.xword	0xc9b575887864a8e4
	.xword	0xc5faf0145055ffc6
	.xword	0x9c1a4a4985075df0
	.xword	0x1e16cf8adacdbae1
	.xword	0x12556484e7af66be
	.xword	0x3e6e863e39555d9e
	.xword	0x105bc4ca6e657127
	.xword	0x328e65fc85c96435
	.xword	0x0de1d895083c1637
	.xword	0x23428ae63c48ca39
	.xword	0xf2f0304ba71c2f0c
	.xword	0xb3feef0b100f5465
	.xword	0x4678c7f81dbfd760
	.xword	0x1d0881ca5a6f225c
	.xword	0x132ba4fffa342ce0
	.xword	0xb0df0718a41328d6
	.xword	0x50a40eabc706399b
	.xword	0x36e02a7e32230747
	.xword	0x3250a2e0d8bc61fd
	.xword	0x913d98385098cd7d
	.xword	0xc4e2ffccc1039ce7
	.xword	0x19beeb3e976e7f0b
	.xword	0xd08e9884e53bc6a8
	.xword	0x9598c69b1d28e083
	.xword	0xab1d490b369a0b7a
	.xword	0x07fa4a055e9fad7a
	.xword	0x4bc187e8479157b6
	.xword	0x57dd0d614cc763eb
	.xword	0xe0a3e7ea274254ab
	.xword	0xb92931e5b82bb1ac
	.xword	0xbe1f4eb5b4680584
	.xword	0xccc23fc112f38b2c
	.xword	0xe2d35ea1e4dd034b
	.xword	0xac06f1b7b00086e0
	.xword	0xf6628079281440dc
	.xword	0x4ef7b02075380a39
	.xword	0x53abc4654a6f638f
	.xword	0xc8f4c8d3564e2695
	.xword	0xd189aadee2252f49
	.xword	0xd70f24a6500506f9
	.xword	0x02cfacfab1f1a9b1
	.xword	0x0347cf9c4937e35e
	.xword	0x0529db640a85d64c
	.xword	0xb9ded5b3e5dc813a
	.xword	0x3e348cc4ec072ecc
	.xword	0x3cd71e38ccbcd544
	.xword	0x93d431c165d09199
	.xword	0x5fddc62ba2f6e329
	.xword	0x2506595fe4c375d6
	.xword	0xc40aaa0763106fb4
	.xword	0xbc431794bf19d567
	.xword	0xa47fc7c512baa049
	.xword	0x1d3046778c547bd2
	.xword	0xc6c0dbc9e7921765
	.xword	0x2a3b3832cc34f40a
	.xword	0x71caa6beb5799a37
	.xword	0x4a2d21f0b2d0e041
	.xword	0x6306062d1c3a0005
	.xword	0xa410b209bbb6e293
	.xword	0x602520bd3219ab0a
	.xword	0x094f08dc09d0e044
	.xword	0xeb61e1560ba5fcbb
	.xword	0x920753450ef8227c
	.xword	0x1ad219ff0a09aace
	.xword	0xa12333de03880b0c
	.xword	0xf35b5c85a1776967
	.xword	0xa90695ee9167f33c
	.xword	0x56cba88934231c84
	.xword	0xfce1d14ef3038211
	.xword	0xb921758112ce0d13
	.xword	0xc4d9cf48f39fe1bd
	.xword	0xeba88a38c03be050
	.xword	0xc4ba4fcebc2aecad
	.xword	0xacf05090e3e07203
	.xword	0xf26d617673f6a4ad
	.xword	0x0cae5124f6a0af3a
	.xword	0xf52646c596a1a10e
	.xword	0x441df7c95dcd5a3c
	.xword	0xe56717468ea69add
	.xword	0xaaf04513c828eb16
	.xword	0x5e1ccc2ab7f64313
	.xword	0xc340b2aa6f601b7f
	.xword	0x6fd0a4886513ba0b
	.xword	0x2a4760d3e414988c
	.xword	0x9bccbe7a7b5e4e67
	.xword	0x5ee06c5138aab45f
	.xword	0xf2cce8aa4c296e53
	.xword	0x9c635337a632661f
	.xword	0xf4acc7dee9b02466
	.xword	0xd01d17b8e29c94bc
	.xword	0xd5a110c87f8281a1
	.xword	0x70a8f70e07852c35
	.xword	0x957d1fb51f3e9fec
	.xword	0x66b5ac14278fc618
	.xword	0xd8ddaa42e3011e92
	.xword	0x869285bf0fd32398
	.xword	0xb134b2c7b5665bc4
	.xword	0xa9dda499b3b5b563
	.xword	0xf937f356473f405c
	.xword	0xdeef078ecdc32570
	.xword	0xba6127a4445e52c3
	.xword	0xcc48ac2ee1421c6c
	.xword	0xefb038c3125aeecb
	.xword	0x159adfb0a128627c
	.xword	0xe8b350a6339a7f78
	.xword	0x84df5c5c4c39b8f1
	.xword	0x3275dd08c6bd6264
	.xword	0xc07d27b68eda89c1
	.xword	0xef69b92a7c8bff99
	.xword	0x8521a27fb77c9081
	.xword	0xdbebe88ca6204a4c
	.xword	0xa214c24d31280ad3
	.xword	0x72543ab73a4a46a3
	.xword	0x80d16d3b70715314
	.xword	0xdd01c22377ca55a4
	.xword	0x586863391704be84
	.xword	0x4b97c075875d8178
	.xword	0x38aacde2ee2063b4
	.xword	0x574555d98cf4deb2
	.xword	0xc77f29ce624b0138
	.xword	0x8cfb15f19a8ab4e8
	.xword	0x77d9320f5c36ee0e
	.xword	0xc01abd3213d8150a
	.xword	0xc287bbc4483c9f09
	.xword	0x580a093440d083df
	.xword	0xe5c1e8364240b55a
	.xword	0x295e26b49811d15e
	.xword	0x516fbfbb033dea6b
	.xword	0xfb73ff1a1647a61f
	.xword	0x152c57c79b7ebf84
	.xword	0xcbf740c736827bdd
	.xword	0xfc2e7c6b5be6b612
	.xword	0x5d39c7644635c147
	.xword	0xfae7a2d135a65101
	.xword	0xb4eb57aba2dc9131
	.xword	0x0c5b14f06357e616
	.xword	0x283318fe294b25d3
	.xword	0x6590b29b78cfbec4
	.xword	0x291fb4bdb5d02f78
	.xword	0xd37e4b6d3a7846a5
	.xword	0x58e5339f7171320d
	.xword	0x06735a7f93e82a3a
	.xword	0x36699d10be0b0f48
	.xword	0xdd1680e68295d36c
	.xword	0xf9cc52c1951c666e
	.xword	0xfa2d0ef3cfd273cb
	.xword	0xd167763e2fbb6773
	.xword	0x593aa657b825fc65
	.xword	0x7ebdd3a292cc7d25
	.xword	0xce54b676f745c8ab
	.xword	0x8fb3e7787ed2e80a
	.xword	0x51199f7457779591
	.xword	0x448d9cce3101cbae
	.xword	0x361c391a14b5653b
	.xword	0xacc6442041b43b7b
	.xword	0x62bd5f3e3381d01b
	.xword	0xa674623eb3eb273f
	.xword	0x296fb48fc0313a99
	.xword	0x37e2136fecff200d
	.xword	0x2717027cfe090136
	.xword	0xa966c451735d0576
	.xword	0xd264053ac3c145ca
	.xword	0x6e6e11e26dfe31e2
	.xword	0xf8136636ffbacc69
	.xword	0xcd0e2bb2b5a44728
	.xword	0x875c4c8bf17432be
	.xword	0x46f7e7efba6e0411
	.xword	0x6819db28b0584b93
	.xword	0xda8e10234f3a743e
	.xword	0x1d7a8484cdccaf78
	.xword	0xd0c08e51941870bf
	.xword	0x59b0e4bf73af57ab
	.xword	0x0cee61d353d30d56
	.xword	0xb463c88706576bf0
	.xword	0x9ede909a3cdf1e39
	.xword	0xa2ce392657c55c22
	.xword	0x6f7e543e933132c7
	.xword	0x97b5cc700750ad87
	.xword	0x2bb950a605210547
	.xword	0x687e0cfa4e0411c6
	.xword	0x47fda7dc8514f9c5
	.xword	0xa2468c9c8bb5bcb3
	.xword	0x4610f7cee759a565
	.xword	0x691288e301226880
	.xword	0x1430b8f60ec2b427
	.xword	0x2c4cb76a50000da6
	.xword	0xf8de571c25a64265
	.xword	0xf79a105a2580dec4
	.xword	0x3165b0a6a1e2f958
	.xword	0xe3345385c59c34d9
	.xword	0xe73ba5b0a55165c7
	.xword	0x7a2cad7400b215fa
	.xword	0xf94a00eefc53899e
	.xword	0xa2b2e56ddf338f8f
	.xword	0x7aa4bfe1c505c1ae
	.xword	0xf8563e24bb3da037
	.xword	0x326c4a3d65c92048
	.xword	0x1bde11cccef68e6e
	.xword	0x673e5498f762fa43
	.xword	0x1fcb8e03fc3c1451
	.xword	0xddd3ac2ff58643fd
	.xword	0x39872c98f776016a
	.xword	0x402dc81eaeb0838c
	.xword	0xa85ebaf981bd525e
	.xword	0x02ea383df95f861a
	.xword	0x9801d4aeedf983ef
	.xword	0x9e9eee9d1ea28c6c
	.xword	0x227a7a73a36e7de1
	.xword	0x84420cdd378408f2
	.xword	0xc3c34a40fcddc9ee
	.xword	0xdccf5ec5a9dd1d60
	.xword	0x3e2f7294b7d15c96
	.xword	0x3cb28d006e159692
	.xword	0x2fe4576f082351ce
	.xword	0x09b94fe0ff7ec48a
	.xword	0xc969c8ae0768bc7e
	.xword	0x64a860c6a4d36a24
	.xword	0x4396401260fc0708
	.xword	0x2d6f60009ddae6aa
	.xword	0x471b20dc1451d4e2
	.xword	0x3b062e6b090c7f95
	.xword	0x62f38b7bba5be28b
	.xword	0xce7acf3c5edaa845
	.xword	0xef461a7614bfe9c4
	.xword	0xe748ef8f9fd416b5
	.xword	0xb55d27a395674ce1
	.xword	0x5bacbfd667bf5c51
	.xword	0x2de7c5c9efeea153
	.xword	0x00059b13a6f06533
	.xword	0x6657022c3f781c9c
	.xword	0x4f05604562cbddd8
	.xword	0x7c3de8f44d557fcc
	.xword	0x2e48b2f6436fb0f7
	.xword	0xec6064558f89056d
	.xword	0x317fb6c13775a83a
	.xword	0xe9275142a4fc9fde
	.xword	0xf1986a4ecbcc94bb
	.xword	0x2565171f1aab8299
	.xword	0x51247505be0f3a81
	.xword	0xb58d209e91e0a637
	.xword	0x4e2531b4867f89a0
	.xword	0x270b638c77c93e6f
	.align 0x80000
	.data
data_start_7:

	.xword	0x7df762e686389e55
	.xword	0x85eb5c73315a78ea
	.xword	0x424abc1a9a694945
	.xword	0x08ce84dacf93014f
	.xword	0xce573ba70bcbd54e
	.xword	0xfe37794efa492f20
	.xword	0xc763fd709cdbee23
	.xword	0xe4e667298580a850
	.xword	0xe3b478082c0de2a1
	.xword	0xd506eca73fa09137
	.xword	0x5b7f212c0f89fdd0
	.xword	0xf927012bb46a57a1
	.xword	0x3f79ea798550ae07
	.xword	0x6f822e78cede9c23
	.xword	0xa7a1ecdfba12fa05
	.xword	0x1c510e679e681eca
	.xword	0x1e0b8847a151f213
	.xword	0x717b3650855019f9
	.xword	0x0cec0cc02e82406d
	.xword	0x50c5752c030ab49f
	.xword	0x0558c92a06dd627e
	.xword	0xae6c74f240b89e1f
	.xword	0xb35b1f972da833d2
	.xword	0xe294ee1fcbaa8eda
	.xword	0x85c5d6bea4bdb21b
	.xword	0xd6d4890ef6426ab0
	.xword	0xd032c2f5fcbc23e3
	.xword	0xea8593b806f1b061
	.xword	0xb488b2a55ee950cf
	.xword	0xa6a546731a307163
	.xword	0x1fefc93901d9cbb0
	.xword	0x80c8dbf707fdbb01
	.xword	0xf05ad2dc6b457d27
	.xword	0x7a8fdf6512a10203
	.xword	0x883472f0bcedd365
	.xword	0x6e4c863f4a5a4c8e
	.xword	0x7dcd9f3741bd3ed3
	.xword	0x2d1a7739903ba320
	.xword	0xf7446effd6608c60
	.xword	0xc45cdb87748f650a
	.xword	0xcb85b0ef7c7c7f4e
	.xword	0xd9452083fa4c2754
	.xword	0x3395095cc0a87782
	.xword	0xc549754118fa563e
	.xword	0xb3aa3eddafa0c4c9
	.xword	0x04ce364fc96d9539
	.xword	0x5efa873ab750f79f
	.xword	0x7865627312f8b437
	.xword	0x102b65b3aba40209
	.xword	0x7bbe1db525e3db96
	.xword	0x655a4a7fd38db8b3
	.xword	0x93ef266ab5aebd1c
	.xword	0xc7d1f4a0f7896401
	.xword	0x04a8be7f14aa9ffc
	.xword	0x7370e6c483a56479
	.xword	0xeaa0d9f81baff412
	.xword	0xf8c86e82252dac9f
	.xword	0x023d7388a457a626
	.xword	0xba2f946f70fdc641
	.xword	0x135c62ef6243a0c7
	.xword	0x497554bf6a03bbcd
	.xword	0x24f9802d1a3cf57f
	.xword	0xb6cc42ed1d49e83e
	.xword	0xb3420d8622613ebb
	.xword	0x5f898358185d908c
	.xword	0xa7cf441a70e07361
	.xword	0xb39ad4e1f4d41d98
	.xword	0xa6ed173fcbb9eff8
	.xword	0x4d58800398956293
	.xword	0xfcf965771b6de363
	.xword	0x2c69967e599dc495
	.xword	0x56adcd738b9347c7
	.xword	0xbc0e9a8831f9f56e
	.xword	0x0945104eac6abda0
	.xword	0xbf3d0645ba9dfd0e
	.xword	0x463dbe955100f93e
	.xword	0x6bdb92697f874258
	.xword	0xd7a8d3ad70036fc4
	.xword	0x5eb325ef1fe807ae
	.xword	0xdce63de2e963dade
	.xword	0xed928c6ab278f27d
	.xword	0xd783a423bd452dac
	.xword	0x7e8fe2c2f7f5fdbd
	.xword	0xc758e8463ddc82e5
	.xword	0x7141e4ced217d784
	.xword	0x002473236468425e
	.xword	0xe0c47ab35182348b
	.xword	0xd7d9fc200efd59b0
	.xword	0x81f43537163e9d47
	.xword	0x5dc663cf8054efad
	.xword	0x6ff078f20fc1aa30
	.xword	0xd2b7da596828d7e1
	.xword	0xc1f681936d8b45e1
	.xword	0x21043d3fc53d1256
	.xword	0x3068aa27a7e949d7
	.xword	0x8400b0adcad48a05
	.xword	0x3975909cfa54d83a
	.xword	0x0bd4713e82c74a82
	.xword	0x79071f77e175913b
	.xword	0xed906c05d5f6e4d3
	.xword	0xd6ce5261f75ec3a4
	.xword	0x03cb15ec923f5662
	.xword	0x5a0b4bd5ae45b524
	.xword	0x0f9717eb4834af9e
	.xword	0x03eda4a640f609ca
	.xword	0x34b12a94f5777642
	.xword	0x11728f77faee84b0
	.xword	0x3c4ec2d2d5348774
	.xword	0xbcf03388ab57393b
	.xword	0xa89c58363e1332ba
	.xword	0xb227fce8a449ce78
	.xword	0xafbcef35d3ed9c2f
	.xword	0xe0f24cd8a5a615b4
	.xword	0x730a0f7045c81e68
	.xword	0xe726002c8830e01b
	.xword	0x0bb3e418dfa413dc
	.xword	0x681e8ff6f6f7ceba
	.xword	0x31a75e75e09dc0d4
	.xword	0xbd9d3a6b28bf1cb5
	.xword	0x42b7572af4e2b860
	.xword	0x21abadbef9f29b1b
	.xword	0xe85c33336da2e499
	.xword	0x66151ae3adcdc33f
	.xword	0x850a09c0158edb08
	.xword	0x44ac441c36022785
	.xword	0xe7aad707e77ed515
	.xword	0x039c1c2a5b95d795
	.xword	0xac4cf103bf90459c
	.xword	0x7757c5cefb0f2cc8
	.xword	0x7090cbe60fcaa570
	.xword	0x82b0eabd76c02c2b
	.xword	0x8f69c2dda7c92d0d
	.xword	0x47f659089ce7cba0
	.xword	0xc4c8ff11645b3696
	.xword	0x2b8d89e119506e13
	.xword	0xd50c13d053db0ddd
	.xword	0x2b1a409e8e2c269d
	.xword	0x22f80e10383b3d10
	.xword	0xad72c06446a9faa9
	.xword	0xfb6ee109bb5fe9e2
	.xword	0xa5e78f807a8a0e08
	.xword	0x69740dd5d7dd19ee
	.xword	0xddc4a617400d6efd
	.xword	0x9d3c5c9516984ffe
	.xword	0xe589ce08505e3257
	.xword	0x42b50321edbeca25
	.xword	0xfc5fa2f618d89469
	.xword	0x42b8373531204731
	.xword	0x543c374f30d9ac5e
	.xword	0xc2e4c4282bc98b2d
	.xword	0xd53e0ef55199048e
	.xword	0xea4775bb6b2c3a1f
	.xword	0x6419528240881aa3
	.xword	0x65e2b149ae3023c2
	.xword	0x330d6d292463e04a
	.xword	0xa749d7ec6d232893
	.xword	0x87f764ee1f488f16
	.xword	0xe07fd64bfb89ba3c
	.xword	0x38baa21e1b42141d
	.xword	0xa329ff82d7d55e81
	.xword	0xcb6ac98b0fa24950
	.xword	0xb7f2fe6f11ccbb04
	.xword	0x11266ec413991cee
	.xword	0x05de78bd0aa0c4fa
	.xword	0xa87b558509cc360a
	.xword	0x7b98565cbb94bd6d
	.xword	0x26bc4851dcbf18d1
	.xword	0xe4558fed23c2bd2a
	.xword	0x06ed2732384c3f8b
	.xword	0x358e199278636e2d
	.xword	0x33168f126b16af37
	.xword	0xe85c429fea9d20a8
	.xword	0xc95934b0a52110f7
	.xword	0xc72dc51e7b6e1fa8
	.xword	0xda694d3ccf9f6f82
	.xword	0xd7f9487fabd4ed4a
	.xword	0x14829ace84d84a19
	.xword	0x81ca83c4efde2af0
	.xword	0x5c075ffc936e27bd
	.xword	0x27e8496f0e8ff0e8
	.xword	0xf7849731a1e39241
	.xword	0xb7b5b8fd5970a83b
	.xword	0x2c39037da8ff1805
	.xword	0xf438a773475f8c05
	.xword	0xed4a3c410895c7f2
	.xword	0xcbfb57c680e6bf0f
	.xword	0x3d4deffe906d7f57
	.xword	0xf84af389f7025aae
	.xword	0xf4635a04bc57b60b
	.xword	0xece67c77877044bc
	.xword	0xd664bdab6fff5adf
	.xword	0x0cf0cf8eaf85c4f7
	.xword	0xd5b16b1681ccd106
	.xword	0xa9ab073a145c24b0
	.xword	0x307c30c92fc4e8be
	.xword	0x47b2293a6a1002f8
	.xword	0x03abd08ecac3ac05
	.xword	0x019844c57636fe9b
	.xword	0xee5074a411339efc
	.xword	0xab52478b24b400db
	.xword	0x1becadca0271512f
	.xword	0x6519d6ba87143941
	.xword	0x7a3ec36cf1917ce3
	.xword	0x19fac1112f6da77e
	.xword	0x237790d57c5e0a47
	.xword	0xd0213d673bfa2370
	.xword	0x8989b15710945a74
	.xword	0xcd5947a08bf30ae5
	.xword	0xf3542d27d0d25695
	.xword	0xda686d43d558171e
	.xword	0x42fac5310905082f
	.xword	0xbbbb639448272a5a
	.xword	0x94b33522ac2b35eb
	.xword	0x707059527310ca78
	.xword	0xb5a8179c80681bb5
	.xword	0x3adc428ddbabb74e
	.xword	0xff54ffec825706b4
	.xword	0xe6fcbaca60b09823
	.xword	0x328084decebdb543
	.xword	0xda50a9faa27b8388
	.xword	0x44b80855363cc2f9
	.xword	0x3a1bfb21171b1b52
	.xword	0x0d934d1938055f54
	.xword	0xc58d35642b0fba69
	.xword	0x495fc2eba44f137e
	.xword	0xc007092bd5a8cb12
	.xword	0x20a2a690c2816598
	.xword	0x84486ec4a9e8bc60
	.xword	0xdbf2c4a61064700d
	.xword	0x5a526fdd100c86ff
	.xword	0xc2846104ac9c59b1
	.xword	0xe2d3caed5c14bd61
	.xword	0x9472918410b6e9f7
	.xword	0x6b24aa3c061fe613
	.xword	0x2991f192e227c11c
	.xword	0xfee42547118014c3
	.xword	0x8d924ca99aa83d4e
	.xword	0x86e6ce9227bd7ff2
	.xword	0xd6075b4de7ff0a22
	.xword	0x8ab8bf9b11272004
	.xword	0x26927a9a12e803be
	.xword	0x2eb9bab5a9c3a4d6
	.xword	0xb8cf28c96e4540cc
	.xword	0x4e6de30374cf712c
	.xword	0xeacfeaf375f5b1ff
	.xword	0x29c25e4e0b78b3ef
	.xword	0x89927388c0ca1c51
	.xword	0x6805a3151588d7a4
	.xword	0x8b1aca27a802b79a
	.xword	0xdbfff0e0cefe1efc
	.xword	0x770503033c8382d3
	.xword	0x8a9426266a9bce23
	.xword	0x17e1ec31d5c0f3ca
	.xword	0x9af526fe73867335
	.xword	0xb29ebae609226bd3
	.xword	0xf00a3804f9053022



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
