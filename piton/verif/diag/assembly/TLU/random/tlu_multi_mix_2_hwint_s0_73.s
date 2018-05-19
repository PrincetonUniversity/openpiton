// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_73.s
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
   random seed:	428375244
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

	setx 0x9b59b979161f3fba, %g1, %g0
	setx 0xdb017d723ee5a0e2, %g1, %g1
	setx 0x8e42650525f160f8, %g1, %g2
	setx 0x3ea31b2445e262b8, %g1, %g3
	setx 0xce8202fd5e83c6cf, %g1, %g4
	setx 0x3501cb15649f5a33, %g1, %g5
	setx 0x706ca675c1c44312, %g1, %g6
	setx 0x43f819af0568ffa4, %g1, %g7
	setx 0xe592e3fed38ab32b, %g1, %r16
	setx 0x7d2e408fc5945ce6, %g1, %r17
	setx 0xbd6e9ec296ac08c0, %g1, %r18
	setx 0x7b7172bce77d437a, %g1, %r19
	setx 0xbbba9df6bdc6ecbf, %g1, %r20
	setx 0x6e979960b3487d62, %g1, %r21
	setx 0x31ce354645e68167, %g1, %r22
	setx 0x7283d39312f45fb0, %g1, %r23
	setx 0x0356e15a9c9df2e1, %g1, %r24
	setx 0x1f5b39c6303ac40d, %g1, %r25
	setx 0x30d19a5425069df5, %g1, %r26
	setx 0xdd3575547d0a1657, %g1, %r27
	setx 0x3114bd8c2a097a76, %g1, %r28
	setx 0x78e81e8bb790076e, %g1, %r29
	setx 0x0d9c7e6c9ca99595, %g1, %r30
	setx 0x37703bacd50bdbd7, %g1, %r31
	save
	setx 0x00867a71acffb625, %g1, %r16
	setx 0x78b346867921bd27, %g1, %r17
	setx 0x63a609c1d20325bd, %g1, %r18
	setx 0xc4688b76d3e2714b, %g1, %r19
	setx 0xe2e05dc9c02406ee, %g1, %r20
	setx 0xfefaa39bb81ed8a5, %g1, %r21
	setx 0x1197c99dbfb09982, %g1, %r22
	setx 0x2a81b7f966adfc0f, %g1, %r23
	setx 0x0f6ffa5fea33a51c, %g1, %r24
	setx 0xa40d1e7d2ea37687, %g1, %r25
	setx 0xb6bfc26a79303d13, %g1, %r26
	setx 0x6f97c825fdc807e7, %g1, %r27
	setx 0xdd7dc0220f3ba47e, %g1, %r28
	setx 0x0d9a07f0db382dcc, %g1, %r29
	setx 0x862bbb2089332732, %g1, %r30
	setx 0xd2fd8684870eb33d, %g1, %r31
	save
	setx 0x2ed12ab913fdec44, %g1, %r16
	setx 0x2248b51abda17ada, %g1, %r17
	setx 0xc4e0e64a31f9b127, %g1, %r18
	setx 0x7b8d96a925314735, %g1, %r19
	setx 0xae4a2a2dc2cb5660, %g1, %r20
	setx 0xe1e856f5047b7bda, %g1, %r21
	setx 0x599954cb70238059, %g1, %r22
	setx 0x775b457f2711016d, %g1, %r23
	setx 0x119962553dd2d13b, %g1, %r24
	setx 0xd7604d70969037cd, %g1, %r25
	setx 0x04c317cb3211ff5a, %g1, %r26
	setx 0x9d121e578708076c, %g1, %r27
	setx 0xa9fe78832c114c83, %g1, %r28
	setx 0x7b7c6fc4280a1add, %g1, %r29
	setx 0x45ed94bae9be1644, %g1, %r30
	setx 0xdb755a8fed075714, %g1, %r31
	save
	setx 0xe59b8858aa613327, %g1, %r16
	setx 0xe2f979f63dfa4220, %g1, %r17
	setx 0x013aa165ae5cd859, %g1, %r18
	setx 0xf793750c64b3ec1d, %g1, %r19
	setx 0x6422a82b188226ce, %g1, %r20
	setx 0xe4e9d0d797bcdb9d, %g1, %r21
	setx 0x6cc06a9a60fe70e7, %g1, %r22
	setx 0xa686afa468734feb, %g1, %r23
	setx 0xafc6df613ac0a48d, %g1, %r24
	setx 0xdffb70471330a01a, %g1, %r25
	setx 0xe205e39f15b1f012, %g1, %r26
	setx 0xf450159cb4986d00, %g1, %r27
	setx 0x1e03220349926bff, %g1, %r28
	setx 0x81e05975c0a28524, %g1, %r29
	setx 0x0501229eaeae1003, %g1, %r30
	setx 0xa8d6d16ac29168a4, %g1, %r31
	save
	setx 0x81a10b52941999e3, %g1, %r16
	setx 0x46c93f9858186587, %g1, %r17
	setx 0x5eac27a21f60296c, %g1, %r18
	setx 0x937ecd35fc0db228, %g1, %r19
	setx 0x70193b51384cfef4, %g1, %r20
	setx 0x941e45a39b5b8094, %g1, %r21
	setx 0xc7da25ea9a26c58b, %g1, %r22
	setx 0x4971a1dac809e7f6, %g1, %r23
	setx 0xd7a1fcb57212f7e9, %g1, %r24
	setx 0xbfc486b5a4a90827, %g1, %r25
	setx 0x22f3a697bee8ad9a, %g1, %r26
	setx 0x05dcc769e4f5d1fe, %g1, %r27
	setx 0x188c3b5ab0e50ceb, %g1, %r28
	setx 0xea397cd9fa40d36d, %g1, %r29
	setx 0x44587a1542959df8, %g1, %r30
	setx 0x3beb93b4c9d35cf2, %g1, %r31
	save
	setx 0x51664f9fbcc0b7e7, %g1, %r16
	setx 0xaad3f7e1adc08882, %g1, %r17
	setx 0x31cdf1153d533a69, %g1, %r18
	setx 0x2855e9bd9ec0b207, %g1, %r19
	setx 0x51794fa1c9a41c05, %g1, %r20
	setx 0xdb2ea5334f689d8a, %g1, %r21
	setx 0xdacdc61996d7b58d, %g1, %r22
	setx 0x9aeaf02655eba924, %g1, %r23
	setx 0x66f174666c59ccfe, %g1, %r24
	setx 0x7cb499905e97064b, %g1, %r25
	setx 0x210ca088a3911a68, %g1, %r26
	setx 0x7c1b2c79af7b74a0, %g1, %r27
	setx 0x1575defa39540027, %g1, %r28
	setx 0x628747441eda53d6, %g1, %r29
	setx 0xea811eb6208abcc1, %g1, %r30
	setx 0x1ba644c44d2e47d7, %g1, %r31
	save
	setx 0x6cadfdf8fc2b15ed, %g1, %r16
	setx 0x5c2ec25ae2ebf75b, %g1, %r17
	setx 0x34e732c1f9ad4575, %g1, %r18
	setx 0xc52f193a014f4260, %g1, %r19
	setx 0x6d5da5cea673ac0d, %g1, %r20
	setx 0x3252678ace2281d0, %g1, %r21
	setx 0x354043a96fde87a2, %g1, %r22
	setx 0x1b6cc7597bf19c0e, %g1, %r23
	setx 0xb805f8b073180e4b, %g1, %r24
	setx 0xe53f5d4344ed3065, %g1, %r25
	setx 0xe2af621a876c37b5, %g1, %r26
	setx 0x3aee7d7678f3d119, %g1, %r27
	setx 0x2cb4932e7247663a, %g1, %r28
	setx 0x057e67468b069c65, %g1, %r29
	setx 0xa7f562c0b49f5650, %g1, %r30
	setx 0x53eb95ff2fa8057e, %g1, %r31
	save
	setx 0x85386f6e8f5406cf, %g1, %r16
	setx 0x96fabf80da40fbea, %g1, %r17
	setx 0x2413546ce140d4ba, %g1, %r18
	setx 0xf15d84c6407ed00f, %g1, %r19
	setx 0x6277a7f83b943701, %g1, %r20
	setx 0x91089c886677a0b7, %g1, %r21
	setx 0x9a2086476ea39a01, %g1, %r22
	setx 0x3c6e5a539030fbe9, %g1, %r23
	setx 0x1f36520172aa4b2b, %g1, %r24
	setx 0x572b448c7f81d969, %g1, %r25
	setx 0xdac9053f46462dbc, %g1, %r26
	setx 0x18ba182cc65b068b, %g1, %r27
	setx 0x095b3c389d30b8fb, %g1, %r28
	setx 0x9fd2016b65f78b91, %g1, %r29
	setx 0x064d06290bd3cbc2, %g1, %r30
	setx 0x07717bc7bed7aed2, %g1, %r31
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
	.word 0xbbe5603d  ! 1: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde5a148  ! 4: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x839421f0  ! 5: WRPR_TNPC_I	wrpr	%r16, 0x01f0, %tnpc
	.word 0x8795e1f9  ! 9: WRPR_TT_I	wrpr	%r23, 0x01f9, %tt
	.word 0xb635c000  ! 12: ORN_R	orn 	%r23, %r0, %r27
	.word 0xb5e560dc  ! 14: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb8154000  ! 17: OR_R	or 	%r21, %r0, %r28
	.word 0xb751c000  ! 18: RDPR_TL	<illegal instruction>
	.word 0xbde5e0e2  ! 19: SAVE_I	save	%r23, 0x0001, %r30
	mov	1, %r12
	.word 0x8f930000  ! 21: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e5e08a  ! 23: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb33ca001  ! 24: SRA_I	sra 	%r18, 0x0001, %r25
	.word 0xb5e46104  ! 31: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5518000  ! 35: RDPR_PSTATE	<illegal instruction>
	.word 0xbd480000  ! 40: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 7)
	.word 0xbbe421be  ! 44: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7520000  ! 50: RDPR_PIL	<illegal instruction>
	.word 0xb1e5216a  ! 52: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e460c7  ! 54: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbc9d6031  ! 55: XORcc_I	xorcc 	%r21, 0x0031, %r30
	.word 0xb3e5e1f5  ! 57: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e5e1a1  ! 58: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e5605b  ! 61: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e4e081  ! 62: SAVE_I	save	%r19, 0x0001, %r24
	mov	1, %r12
	.word 0x8f930000  ! 63: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e4e125  ! 65: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde5e0a1  ! 68: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x899560bc  ! 69: WRPR_TICK_I	wrpr	%r21, 0x00bc, %tick
	.word 0xb1e5e1c8  ! 72: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e420fc  ! 73: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e4e0fd  ! 74: SAVE_I	save	%r19, 0x0001, %r25
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 3d)
	mov	2, %r12
	.word 0xa1930000  ! 78: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e420c7  ! 80: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e4e003  ! 81: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e5a0a0  ! 84: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbb480000  ! 86: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_0, %g1, %r18
	.word 0xb7500000  ! 91: RDPR_TPC	<illegal instruction>
	.word 0xb5e52168  ! 92: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e5a11b  ! 93: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e4a1bf  ! 94: SAVE_I	save	%r18, 0x0001, %r25
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbde46016  ! 97: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e4e0c9  ! 99: SAVE_I	save	%r19, 0x0001, %r28
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 19)
	.word 0x8994215d  ! 103: WRPR_TICK_I	wrpr	%r16, 0x015d, %tick
	.word 0xb9e4e0a1  ! 105: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e4605c  ! 110: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e5e018  ! 113: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe4a08b  ! 115: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e5e1eb  ! 118: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e560c6  ! 120: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e4e0e3  ! 123: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e421c3  ! 129: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb0bcc000  ! 130: XNORcc_R	xnorcc 	%r19, %r0, %r24
	.word 0xb150c000  ! 131: RDPR_TT	<illegal instruction>
	.word 0xb404a124  ! 134: ADD_I	add 	%r18, 0x0124, %r26
	.word 0xb7e5e1df  ! 135: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xba456066  ! 136: ADDC_I	addc 	%r21, 0x0066, %r29
	.word 0xb69c4000  ! 139: XORcc_R	xorcc 	%r17, %r0, %r27
	.word 0xb7510000  ! 141: RDPR_TICK	<illegal instruction>
	.word 0xb750c000  ! 142: RDPR_TT	<illegal instruction>
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 25)
	.word 0xb5e4e1b5  ! 145: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe5a092  ! 146: SAVE_I	save	%r22, 0x0001, %r31
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 36)
	.word 0xbf508000  ! 150: RDPR_TSTATE	<illegal instruction>
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 19)
	.word 0xb1e5e199  ! 154: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 30)
	.word 0xbbe5e160  ! 156: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbd504000  ! 160: RDPR_TNPC	<illegal instruction>
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 2)
	setx	data_start_3, %g1, %r17
	.word 0xbbe56082  ! 170: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e4a139  ! 171: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb4b44000  ! 177: SUBCcc_R	orncc 	%r17, %r0, %r26
	.word 0xb1e56183  ! 181: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e5e1e8  ! 185: SAVE_I	save	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e4a045  ! 198: SAVE_I	save	%r18, 0x0001, %r28
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 11)
	.word 0xb7e52153  ! 204: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe421f9  ! 206: SAVE_I	save	%r16, 0x0001, %r31
	setx	0xa4e41a0800008880, %g1, %r10
	.word 0x819a8000  ! 209: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb695a1a7  ! 212: ORcc_I	orcc 	%r22, 0x01a7, %r27
	.word 0xbde561a4  ! 213: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbb2d9000  ! 224: SLLX_R	sllx	%r22, %r0, %r29
	.word 0xb3e46074  ! 226: SAVE_I	save	%r17, 0x0001, %r25
	setx	0xd2d458d50000388c, %g1, %r10
	.word 0x839a8000  ! 230: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1504000  ! 231: RDPR_TNPC	<illegal instruction>
	.word 0xb7e461b6  ! 234: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe4a1df  ! 240: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde4216b  ! 255: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9518000  ! 256: RDPR_PSTATE	<illegal instruction>
	.word 0xb12d6001  ! 257: SLL_I	sll 	%r21, 0x0001, %r24
	.word 0x879420f8  ! 258: WRPR_TT_I	wrpr	%r16, 0x00f8, %tt
	.word 0xbbe46084  ! 263: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e421a8  ! 265: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbde461ba  ! 266: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde46056  ! 268: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde46138  ! 272: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8395a142  ! 275: WRPR_TNPC_I	wrpr	%r22, 0x0142, %tnpc
	.word 0xb1e4e1c8  ! 280: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbd518000  ! 281: RDPR_PSTATE	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 285: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8595a1f1  ! 287: WRPR_TSTATE_I	wrpr	%r22, 0x01f1, %tstate
	.word 0xbfe520da  ! 289: SAVE_I	save	%r20, 0x0001, %r31
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, b)
	.word 0xbde4a0ad  ! 298: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x81942073  ! 303: WRPR_TPC_I	wrpr	%r16, 0x0073, %tpc
	setx	0x68ebe8020000bed2, %g1, %r10
	.word 0x819a8000  ! 305: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e4e0df  ! 306: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbb520000  ! 308: RDPR_PIL	<illegal instruction>
	.word 0xb3500000  ! 309: RDPR_TPC	<illegal instruction>
	.word 0xb9e5e05f  ! 311: SAVE_I	save	%r23, 0x0001, %r28
	setx	0x978b34b70000fa5b, %g1, %r10
	.word 0x839a8000  ! 313: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7e52054  ! 317: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e460e9  ! 320: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e56190  ! 325: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde5a133  ! 329: SAVE_I	save	%r22, 0x0001, %r30
	mov	2, %r12
	.word 0xa1930000  ! 335: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe5e135  ! 339: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e460f5  ! 343: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde421be  ! 344: SAVE_I	save	%r16, 0x0001, %r30
	mov	1, %r12
	.word 0x8f930000  ! 345: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbde5a040  ! 347: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e461ca  ! 349: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e4e1f7  ! 350: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde5e133  ! 351: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e5e102  ! 353: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e4a008  ! 362: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e420ac  ! 363: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e5e1ec  ! 365: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe461c8  ! 366: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe560e8  ! 368: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe4a002  ! 372: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde5a0f0  ! 375: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1510000  ! 376: RDPR_TICK	<illegal instruction>
	.word 0xb1e56083  ! 378: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e4e01e  ! 379: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x83956135  ! 381: WRPR_TNPC_I	wrpr	%r21, 0x0135, %tnpc
	.word 0xb1e42114  ! 382: SAVE_I	save	%r16, 0x0001, %r24
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 22)
	.word 0xb3e4e033  ! 388: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5504000  ! 394: RDPR_TNPC	<illegal instruction>
	.word 0xb3e561ab  ! 396: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe560f2  ! 398: SAVE_I	save	%r21, 0x0001, %r31
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, a)
	.word 0xb9e4604d  ! 402: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e5e1be  ! 403: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8d94e1c1  ! 404: WRPR_PSTATE_I	wrpr	%r19, 0x01c1, %pstate
	.word 0xb7480000  ! 407: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 33)
	.word 0xb9e421d6  ! 410: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9518000  ! 418: RDPR_PSTATE	<illegal instruction>
	.word 0x839561ac  ! 420: WRPR_TNPC_I	wrpr	%r21, 0x01ac, %tnpc
	.word 0x81942038  ! 422: WRPR_TPC_I	wrpr	%r16, 0x0038, %tpc
	.word 0xb7e56064  ! 424: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x21d6c0900006a56, %g1, %r10
	.word 0x839a8000  ! 427: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbbe421cb  ! 428: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x819561ea  ! 429: WRPR_TPC_I	wrpr	%r21, 0x01ea, %tpc
	setx	0xd6bc373b0000dd95, %g1, %r10
	.word 0x819a8000  ! 431: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e5a190  ! 432: SAVE_I	save	%r22, 0x0001, %r26
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 9)
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 9)
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 12)
	.word 0x81952122  ! 439: WRPR_TPC_I	wrpr	%r20, 0x0122, %tpc
	.word 0xb1e5600c  ! 440: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde460b6  ! 441: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e46074  ! 446: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8d9460a5  ! 447: WRPR_PSTATE_I	wrpr	%r17, 0x00a5, %pstate
	setx	0xb47bfab000008883, %g1, %r10
	.word 0x839a8000  ! 448: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e4a1f0  ! 450: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8d94a018  ! 453: WRPR_PSTATE_I	wrpr	%r18, 0x0018, %pstate
	.word 0xb550c000  ! 454: RDPR_TT	<illegal instruction>
	.word 0xbde5a06f  ! 456: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e42073  ! 461: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe4e136  ! 465: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3358000  ! 466: SRL_R	srl 	%r22, %r0, %r25
	mov	0, %r12
	.word 0xa1930000  ! 468: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbd540000  ! 469: RDPR_GL	<illegal instruction>
	.word 0x8795204f  ! 470: WRPR_TT_I	wrpr	%r20, 0x004f, %tt
	.word 0x8d94e026  ! 472: WRPR_PSTATE_I	wrpr	%r19, 0x0026, %pstate
	.word 0xbb354000  ! 473: SRL_R	srl 	%r21, %r0, %r29
	.word 0xb32d7001  ! 476: SLLX_I	sllx	%r21, 0x0001, %r25
	.word 0xb9510000  ! 479: RDPR_TICK	<illegal instruction>
	.word 0xb5e5a085  ! 483: SAVE_I	save	%r22, 0x0001, %r26
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, d)
	.word 0xb7e4a1cd  ! 487: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e5a0ae  ! 491: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1518000  ! 493: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e46032  ! 497: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbb504000  ! 501: RDPR_TNPC	<illegal instruction>
	.word 0xbbe5a1aa  ! 502: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7508000  ! 505: RDPR_TSTATE	<illegal instruction>
	.word 0xbde46142  ! 509: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbd518000  ! 510: RDPR_PSTATE	<illegal instruction>
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 23)
	.word 0xb1e56143  ! 517: SAVE_I	save	%r21, 0x0001, %r24
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 1e)
	setx	0x577c9d690000aa16, %g1, %r10
	.word 0x819a8000  ! 520: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb2042180  ! 522: ADD_I	add 	%r16, 0x0180, %r25
	.word 0xb1e52014  ! 526: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde46070  ! 527: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde5215a  ! 529: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x89946181  ! 535: WRPR_TICK_I	wrpr	%r17, 0x0181, %tick
	.word 0xb3e42108  ! 536: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbd2d0000  ! 537: SLL_R	sll 	%r20, %r0, %r30
	.word 0x859460ce  ! 543: WRPR_TSTATE_I	wrpr	%r17, 0x00ce, %tstate
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 29)
	mov	2, %r12
	.word 0xa1930000  ! 548: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8194e095  ! 551: WRPR_TPC_I	wrpr	%r19, 0x0095, %tpc
	.word 0xb035c000  ! 557: SUBC_R	orn 	%r23, %r0, %r24
	.word 0xb1e4a103  ! 560: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3504000  ! 562: RDPR_TNPC	<illegal instruction>
	.word 0x879561fd  ! 567: WRPR_TT_I	wrpr	%r21, 0x01fd, %tt
	.word 0x8595e1f9  ! 569: WRPR_TSTATE_I	wrpr	%r23, 0x01f9, %tstate
	.word 0x859460d7  ! 570: WRPR_TSTATE_I	wrpr	%r17, 0x00d7, %tstate
	.word 0xb5518000  ! 571: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe52143  ! 572: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb01cc000  ! 573: XOR_R	xor 	%r19, %r0, %r24
	setx	0x978c410e00007a99, %g1, %r10
	.word 0x839a8000  ! 577: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 15)
	.word 0xb3e52193  ! 579: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1540000  ! 581: RDPR_GL	<illegal instruction>
	.word 0xbd504000  ! 582: RDPR_TNPC	<illegal instruction>
	.word 0xbbe4218a  ! 584: SAVE_I	save	%r16, 0x0001, %r29
	mov	2, %r12
	.word 0x8f930000  ! 585: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9504000  ! 587: RDPR_TNPC	<illegal instruction>
	.word 0xb7e5a10c  ! 589: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbb508000  ! 592: RDPR_TSTATE	<illegal instruction>
	.word 0xb62dc000  ! 593: ANDN_R	andn 	%r23, %r0, %r27
	.word 0xb7e52000  ! 598: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9540000  ! 600: RDPR_GL	<illegal instruction>
	.word 0xb9e4a053  ! 601: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8594e11e  ! 602: WRPR_TSTATE_I	wrpr	%r19, 0x011e, %tstate
	.word 0xb9e56030  ! 603: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb01d2053  ! 604: XOR_I	xor 	%r20, 0x0053, %r24
	.word 0x8395610d  ! 605: WRPR_TNPC_I	wrpr	%r21, 0x010d, %tnpc
	.word 0xbde5e004  ! 609: SAVE_I	save	%r23, 0x0001, %r30
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 2d)
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 7)
	.word 0x919420c0  ! 614: WRPR_PIL_I	wrpr	%r16, 0x00c0, %pil
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbbe4607a  ! 621: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde5a173  ! 622: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb350c000  ! 623: RDPR_TT	<illegal instruction>
	.word 0xb9e42176  ! 625: SAVE_I	save	%r16, 0x0001, %r28
	mov	0, %r12
	.word 0x8f930000  ! 626: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe460a3  ! 627: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbd480000  ! 633: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 24)
	.word 0xbde52147  ! 637: SAVE_I	save	%r20, 0x0001, %r30
	mov	1, %r12
	.word 0xa1930000  ! 639: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 33)
	.word 0xb9e421b4  ! 651: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe4619e  ! 652: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e561ab  ! 653: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5510000  ! 654: RDPR_TICK	<illegal instruction>
	.word 0xb494c000  ! 655: ORcc_R	orcc 	%r19, %r0, %r26
	.word 0xb3e52059  ! 656: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e5a1d7  ! 658: SAVE_I	save	%r22, 0x0001, %r28
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 16)
	.word 0x8394a03f  ! 661: WRPR_TNPC_I	wrpr	%r18, 0x003f, %tnpc
	.word 0xb3e4e03f  ! 663: SAVE_I	save	%r19, 0x0001, %r25
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 24)
	setx	data_start_6, %g1, %r20
	.word 0xbfe421b6  ! 666: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbb510000  ! 669: RDPR_TICK	<illegal instruction>
	.word 0xb1e4a14e  ! 670: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e4a008  ! 671: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e5a0c6  ! 672: SAVE_I	save	%r22, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e4a0f2  ! 676: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e56167  ! 682: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb6bcc000  ! 684: XNORcc_R	xnorcc 	%r19, %r0, %r27
	.word 0xb7e4e179  ! 685: SAVE_I	save	%r19, 0x0001, %r27
	setx	data_start_4, %g1, %r19
	.word 0xb9e4e0b8  ! 689: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe5e16b  ! 690: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e52080  ! 692: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e4212e  ! 693: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x83956000  ! 694: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbd3ca001  ! 697: SRA_I	sra 	%r18, 0x0001, %r30
	setx	data_start_6, %g1, %r23
	.word 0xb7e5e1d7  ! 710: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe56159  ! 711: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e420ed  ! 713: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e5e17b  ! 714: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb92d1000  ! 715: SLLX_R	sllx	%r20, %r0, %r28
	.word 0xb9e520d0  ! 716: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbc150000  ! 717: OR_R	or 	%r20, %r0, %r30
	.word 0xb7e421c8  ! 718: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x9ede07590000089e, %g1, %r10
	.word 0x839a8000  ! 719: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbeb421c4  ! 720: SUBCcc_I	orncc 	%r16, 0x01c4, %r31
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbbe5a11e  ! 726: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x8194a137  ! 727: WRPR_TPC_I	wrpr	%r18, 0x0137, %tpc
	.word 0xb1e4e1e0  ! 733: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e4e165  ! 736: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e4e03b  ! 740: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e4e0a2  ! 747: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e4601d  ! 749: SAVE_I	save	%r17, 0x0001, %r26
	setx	data_start_2, %g1, %r17
	.word 0xbd3d2001  ! 752: SRA_I	sra 	%r20, 0x0001, %r30
	.word 0xb3e5a07e  ! 755: SAVE_I	save	%r22, 0x0001, %r25
	mov	0, %r12
	.word 0xa1930000  ! 757: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 36)
	.word 0xbde4606e  ! 763: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e5a17e  ! 764: SAVE_I	save	%r22, 0x0001, %r27
	mov	0, %r12
	.word 0x8f930000  ! 765: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbb518000  ! 767: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e5a1f3  ! 773: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e4613b  ! 774: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e560b5  ! 775: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7510000  ! 776: RDPR_TICK	<illegal instruction>
	.word 0xbbe42051  ! 778: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e5a01c  ! 780: SAVE_I	save	%r22, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e560bc  ! 784: SAVE_I	save	%r21, 0x0001, %r28
	mov	1, %r12
	.word 0x8f930000  ! 788: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbde4e05e  ! 790: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde42154  ! 792: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb4c5606f  ! 793: ADDCcc_I	addccc 	%r21, 0x006f, %r26
	.word 0xbfe5e089  ! 794: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbf520000  ! 795: RDPR_PIL	<illegal instruction>
	setx	data_start_4, %g1, %r21
	.word 0xb9e5609d  ! 797: SAVE_I	save	%r21, 0x0001, %r28
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb8940000  ! 800: ORcc_R	orcc 	%r16, %r0, %r28
	.word 0xb2b5a176  ! 804: SUBCcc_I	orncc 	%r22, 0x0176, %r25
	.word 0xbbe46150  ! 805: SAVE_I	save	%r17, 0x0001, %r29
	setx	data_start_1, %g1, %r22
	.word 0xbfe4e125  ! 812: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e421ef  ! 813: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x8ababcf6000028d0, %g1, %r10
	.word 0x839a8000  ! 814: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_7, %g1, %r17
	.word 0x8395e074  ! 819: WRPR_TNPC_I	wrpr	%r23, 0x0074, %tnpc
	.word 0xb3e4e0af  ! 821: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8795a187  ! 824: WRPR_TT_I	wrpr	%r22, 0x0187, %tt
	.word 0x839561c4  ! 827: WRPR_TNPC_I	wrpr	%r21, 0x01c4, %tnpc
	.word 0x8395e03e  ! 830: WRPR_TNPC_I	wrpr	%r23, 0x003e, %tnpc
	mov	2, %r12
	.word 0x8f930000  ! 832: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 35)
	.word 0xb7e4e062  ! 837: SAVE_I	save	%r19, 0x0001, %r27
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe4e0cb  ! 840: SAVE_I	save	%r19, 0x0001, %r31
	setx	0xb84666ad00004c82, %g1, %r10
	.word 0x819a8000  ! 842: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb520000  ! 843: RDPR_PIL	<illegal instruction>
	.word 0xb551c000  ! 844: RDPR_TL	<illegal instruction>
	.word 0xb5e56130  ! 845: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x495155530000cf8b, %g1, %r10
	.word 0x819a8000  ! 846: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x3af28eec000039c5, %g1, %r10
	.word 0x819a8000  ! 849: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e421a6  ! 854: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e5610a  ! 856: SAVE_I	save	%r21, 0x0001, %r28
	setx	0xbb22e00f0000188c, %g1, %r10
	.word 0x839a8000  ! 860: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5e4605a  ! 862: SAVE_I	save	%r17, 0x0001, %r26
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb4452161  ! 865: ADDC_I	addc 	%r20, 0x0161, %r26
	setx	0x959abeaf00001fc3, %g1, %r10
	.word 0x819a8000  ! 866: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x81946194  ! 867: WRPR_TPC_I	wrpr	%r17, 0x0194, %tpc
	.word 0xbc058000  ! 875: ADD_R	add 	%r22, %r0, %r30
	.word 0xbde420dd  ! 879: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe5e179  ! 880: SAVE_I	save	%r23, 0x0001, %r31
	setx	data_start_7, %g1, %r16
	.word 0xb9e5e0eb  ! 887: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbb641800  ! 891: MOVcc_R	<illegal instruction>
	.word 0x8795e057  ! 896: WRPR_TT_I	wrpr	%r23, 0x0057, %tt
	.word 0xbb480000  ! 903: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbde5a0a2  ! 905: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde4a1fa  ! 910: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e4a013  ! 920: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde5e029  ! 925: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e4a17a  ! 928: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x879460ce  ! 929: WRPR_TT_I	wrpr	%r17, 0x00ce, %tt
	.word 0xb5e4a0d5  ! 931: SAVE_I	save	%r18, 0x0001, %r26
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 1b)
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 1d)
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 6)
	.word 0xb3e4a1cd  ! 936: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e521e4  ! 937: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e420e3  ! 945: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbc1d8000  ! 948: XOR_R	xor 	%r22, %r0, %r30
	.word 0xb3e4610a  ! 951: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e460e0  ! 954: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e5a151  ! 955: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb89d21ea  ! 956: XORcc_I	xorcc 	%r20, 0x01ea, %r28
	setx	data_start_2, %g1, %r16
	.word 0xb5500000  ! 965: RDPR_TPC	<illegal instruction>
	.word 0xbbe5a03f  ! 966: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbbe5a176  ! 968: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5500000  ! 969: RDPR_TPC	<illegal instruction>
	.word 0xb7e5e02f  ! 970: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb150c000  ! 973: RDPR_TT	<illegal instruction>
	.word 0xb48ce1b5  ! 974: ANDcc_I	andcc 	%r19, 0x01b5, %r26
	setx	0x95a019d400006814, %g1, %r10
	.word 0x819a8000  ! 980: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb1e5a154  ! 983: SAVE_I	save	%r22, 0x0001, %r24
	mov	1, %r12
	.word 0xa1930000  ! 985: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbcb48000  ! 986: SUBCcc_R	orncc 	%r18, %r0, %r30
	.word 0x839421ba  ! 987: WRPR_TNPC_I	wrpr	%r16, 0x01ba, %tnpc
	.word 0xbcc48000  ! 988: ADDCcc_R	addccc 	%r18, %r0, %r30
	.word 0x8794a15c  ! 990: WRPR_TT_I	wrpr	%r18, 0x015c, %tt
	.word 0xb3e4a008  ! 991: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb2346135  ! 995: SUBC_I	orn 	%r17, 0x0135, %r25
	.word 0xb33cf001  ! 996: SRAX_I	srax	%r19, 0x0001, %r25
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
	.word 0xf13c0000  ! 2: STDF_R	std	%f24, [%r0, %r16]
	.word 0xf4740000  ! 3: STX_R	stx	%r26, [%r16 + %r0]
	.word 0x83946029  ! 5: WRPR_TNPC_I	wrpr	%r17, 0x0029, %tnpc
	.word 0x8794a04d  ! 9: WRPR_TT_I	wrpr	%r18, 0x004d, %tt
	.word 0xb635c000  ! 12: ORN_R	orn 	%r23, %r0, %r27
	.word 0xf8244000  ! 15: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xf53d8000  ! 16: STDF_R	std	%f26, [%r0, %r22]
	.word 0xb2150000  ! 17: OR_R	or 	%r20, %r0, %r25
	.word 0xb951c000  ! 18: RDPR_TL	rdpr	%tl, %r28
	.word 0xfa34c000  ! 20: STH_R	sth	%r29, [%r19 + %r0]
	mov	2, %r12
	.word 0x8f930000  ! 21: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf3c6001  ! 24: SRA_I	sra 	%r17, 0x0001, %r31
	.word 0xf63ca1e7  ! 25: STD_I	std	%r27, [%r18 + 0x01e7]
	.word 0xf235e0c0  ! 26: STH_I	sth	%r25, [%r23 + 0x00c0]
	.word 0xfa24a027  ! 27: STW_I	stw	%r29, [%r18 + 0x0027]
	.word 0xf43c8000  ! 32: STD_R	std	%r26, [%r18 + %r0]
	.word 0xf33ce1e6  ! 33: STDF_I	std	%f25, [0x01e6, %r19]
	.word 0xf83c8000  ! 34: STD_R	std	%r28, [%r18 + %r0]
	.word 0xb5518000  ! 35: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xf83d0000  ! 36: STD_R	std	%r28, [%r20 + %r0]
	.word 0xb5480000  ! 40: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 31)
	.word 0xf875c000  ! 49: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xb7520000  ! 50: RDPR_PIL	<illegal instruction>
	.word 0xfd3ce082  ! 51: STDF_I	std	%f30, [0x0082, %r19]
	.word 0xb69ce0d3  ! 55: XORcc_I	xorcc 	%r19, 0x00d3, %r27
	mov	2, %r12
	.word 0x8f930000  ! 63: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x899560b1  ! 69: WRPR_TICK_I	wrpr	%r21, 0x00b1, %tick
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 11)
	mov	1, %r12
	.word 0xa1930000  ! 78: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf03c4000  ! 79: STD_R	std	%r24, [%r17 + %r0]
	.word 0xfe34a0f9  ! 82: STH_I	sth	%r31, [%r18 + 0x00f9]
	.word 0xbb480000  ! 86: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf53cc000  ! 87: STDF_R	std	%f26, [%r0, %r19]
	setx	data_start_2, %g1, %r16
	.word 0xf53da145  ! 89: STDF_I	std	%f26, [0x0145, %r22]
	.word 0xb7500000  ! 91: RDPR_TPC	<illegal instruction>
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 13)
	.word 0xf13c20bd  ! 100: STDF_I	std	%f24, [0x00bd, %r16]
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 3a)
	.word 0x8995a0f7  ! 103: WRPR_TICK_I	wrpr	%r22, 0x00f7, %tick
	.word 0xf0356134  ! 104: STH_I	sth	%r24, [%r21 + 0x0134]
	.word 0xf83d4000  ! 106: STD_R	std	%r28, [%r21 + %r0]
	.word 0xf834202c  ! 114: STH_I	sth	%r28, [%r16 + 0x002c]
	.word 0xfb3da0f1  ! 121: STDF_I	std	%f29, [0x00f1, %r22]
	.word 0xfe258000  ! 125: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xf824a107  ! 126: STW_I	stw	%r28, [%r18 + 0x0107]
	.word 0xf43d61f4  ! 127: STD_I	std	%r26, [%r21 + 0x01f4]
	.word 0xb0bcc000  ! 130: XNORcc_R	xnorcc 	%r19, %r0, %r24
	.word 0xb950c000  ! 131: RDPR_TT	rdpr	%tt, %r28
	.word 0xfc2ca04f  ! 133: STB_I	stb	%r30, [%r18 + 0x004f]
	.word 0xbe05a1e6  ! 134: ADD_I	add 	%r22, 0x01e6, %r31
	.word 0xbe456163  ! 136: ADDC_I	addc 	%r21, 0x0163, %r31
	.word 0xb49d4000  ! 139: XORcc_R	xorcc 	%r21, %r0, %r26
	.word 0xb1510000  ! 141: RDPR_TICK	<illegal instruction>
	.word 0xb750c000  ! 142: RDPR_TT	<illegal instruction>
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, e)
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 18)
	.word 0xf874e189  ! 148: STX_I	stx	%r28, [%r19 + 0x0189]
	.word 0xb1508000  ! 150: RDPR_TSTATE	<illegal instruction>
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 6)
	.word 0xf8356012  ! 153: STH_I	sth	%r28, [%r21 + 0x0012]
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 5)
	.word 0xf82c6128  ! 158: STB_I	stb	%r28, [%r17 + 0x0128]
	.word 0xb3504000  ! 160: RDPR_TNPC	<illegal instruction>
	.word 0xf034e1c9  ! 161: STH_I	sth	%r24, [%r19 + 0x01c9]
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 2f)
	setx	data_start_6, %g1, %r19
	.word 0xb6b54000  ! 177: SUBCcc_R	orncc 	%r21, %r0, %r27
	.word 0xfa3d20bd  ! 178: STD_I	std	%r29, [%r20 + 0x00bd]
	.word 0xfe248000  ! 186: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xf23d2151  ! 187: STD_I	std	%r25, [%r20 + 0x0151]
	.word 0xf53c8000  ! 188: STDF_R	std	%f26, [%r0, %r18]
	.word 0xf13c4000  ! 189: STDF_R	std	%f24, [%r0, %r17]
	.word 0xf42d0000  ! 195: STB_R	stb	%r26, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf6240000  ! 200: STW_R	stw	%r27, [%r16 + %r0]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf93dc000  ! 205: STDF_R	std	%f28, [%r0, %r23]
	.word 0xf425200a  ! 207: STW_I	stw	%r26, [%r20 + 0x000a]
	setx	0x583427140000ad15, %g1, %r10
	.word 0x819a8000  ! 209: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbc95605e  ! 212: ORcc_I	orcc 	%r21, 0x005e, %r30
	.word 0xfe35e1ea  ! 215: STH_I	sth	%r31, [%r23 + 0x01ea]
	.word 0xfd3ca1fe  ! 216: STDF_I	std	%f30, [0x01fe, %r18]
	.word 0xf274600b  ! 221: STX_I	stx	%r25, [%r17 + 0x000b]
	.word 0xfa2c4000  ! 222: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xbf2c9000  ! 224: SLLX_R	sllx	%r18, %r0, %r31
	.word 0xf0248000  ! 227: STW_R	stw	%r24, [%r18 + %r0]
	setx	0x1f15465e00006a47, %g1, %r10
	.word 0x839a8000  ! 230: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9504000  ! 231: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xf635c000  ! 235: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xf225c000  ! 236: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xfa3de197  ! 239: STD_I	std	%r29, [%r23 + 0x0197]
	.word 0xf82d6116  ! 244: STB_I	stb	%r28, [%r21 + 0x0116]
	.word 0xf8342027  ! 245: STH_I	sth	%r28, [%r16 + 0x0027]
	.word 0xfe3c0000  ! 247: STD_R	std	%r31, [%r16 + %r0]
	.word 0xf42de06d  ! 248: STB_I	stb	%r26, [%r23 + 0x006d]
	.word 0xfe252125  ! 249: STW_I	stw	%r31, [%r20 + 0x0125]
	.word 0xfd3d0000  ! 250: STDF_R	std	%f30, [%r0, %r20]
	.word 0xf2254000  ! 252: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xf2252191  ! 253: STW_I	stw	%r25, [%r20 + 0x0191]
	.word 0xbf518000  ! 256: RDPR_PSTATE	<illegal instruction>
	.word 0xbd2d2001  ! 257: SLL_I	sll 	%r20, 0x0001, %r30
	.word 0x8795210e  ! 258: WRPR_TT_I	wrpr	%r20, 0x010e, %tt
	.word 0xf824c000  ! 259: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf22c610f  ! 260: STB_I	stb	%r25, [%r17 + 0x010f]
	.word 0xf82d0000  ! 264: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xf02d4000  ! 269: STB_R	stb	%r24, [%r21 + %r0]
	.word 0x839560f3  ! 275: WRPR_TNPC_I	wrpr	%r21, 0x00f3, %tnpc
	.word 0xfc3de185  ! 276: STD_I	std	%r30, [%r23 + 0x0185]
	.word 0xb5518000  ! 281: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xf475204d  ! 282: STX_I	stx	%r26, [%r20 + 0x004d]
	.word 0xfe74e067  ! 283: STX_I	stx	%r31, [%r19 + 0x0067]
	.word 0xf02c60b8  ! 284: STB_I	stb	%r24, [%r17 + 0x00b8]
	mov	2, %r12
	.word 0x8f930000  ! 285: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf474e1c7  ! 286: STX_I	stx	%r26, [%r19 + 0x01c7]
	.word 0x859561eb  ! 287: WRPR_TSTATE_I	wrpr	%r21, 0x01eb, %tstate
	.word 0xff3de061  ! 288: STDF_I	std	%f31, [0x0061, %r23]
	.word 0xf234603c  ! 292: STH_I	sth	%r25, [%r17 + 0x003c]
	.word 0xf43d60a7  ! 293: STD_I	std	%r26, [%r21 + 0x00a7]
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 17)
	.word 0xfe2c2119  ! 301: STB_I	stb	%r31, [%r16 + 0x0119]
	.word 0x8194e05b  ! 303: WRPR_TPC_I	wrpr	%r19, 0x005b, %tpc
	.word 0xfb3ca178  ! 304: STDF_I	std	%f29, [0x0178, %r18]
	setx	0xe3a563c400009e8b, %g1, %r10
	.word 0x819a8000  ! 305: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe24e085  ! 307: STW_I	stw	%r31, [%r19 + 0x0085]
	.word 0xb3520000  ! 308: RDPR_PIL	rdpr	%pil, %r25
	.word 0xb9500000  ! 309: RDPR_TPC	<illegal instruction>
	setx	0xab34a38600005e5b, %g1, %r10
	.word 0x839a8000  ! 313: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf8754000  ! 315: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xf834617f  ! 316: STH_I	sth	%r28, [%r17 + 0x017f]
	.word 0xf23d0000  ! 323: STD_R	std	%r25, [%r20 + %r0]
	.word 0xfc2561bf  ! 327: STW_I	stw	%r30, [%r21 + 0x01bf]
	.word 0xf435210c  ! 328: STH_I	sth	%r26, [%r20 + 0x010c]
	.word 0xf635c000  ! 330: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xfd3dc000  ! 331: STDF_R	std	%f30, [%r0, %r23]
	.word 0xf33d4000  ! 333: STDF_R	std	%f25, [%r0, %r21]
	mov	0, %r12
	.word 0xa1930000  ! 335: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf43520b0  ! 336: STH_I	sth	%r26, [%r20 + 0x00b0]
	.word 0xf93d8000  ! 338: STDF_R	std	%f28, [%r0, %r22]
	.word 0xf8258000  ! 340: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xf83c2112  ! 342: STD_I	std	%r28, [%r16 + 0x0112]
	mov	2, %r12
	.word 0x8f930000  ! 345: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5510000  ! 376: RDPR_TICK	rdpr	%tick, %r26
	.word 0x83942186  ! 381: WRPR_TNPC_I	wrpr	%r16, 0x0186, %tnpc
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf474a00f  ! 386: STX_I	stx	%r26, [%r18 + 0x000f]
	.word 0xf03cc000  ! 389: STD_R	std	%r24, [%r19 + %r0]
	.word 0xf33c61ba  ! 390: STDF_I	std	%f25, [0x01ba, %r17]
	.word 0xb9504000  ! 394: RDPR_TNPC	rdpr	%tnpc, %r28
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 33)
	.word 0xf53c0000  ! 401: STDF_R	std	%f26, [%r0, %r16]
	.word 0x8d95e172  ! 404: WRPR_PSTATE_I	wrpr	%r23, 0x0172, %pstate
	.word 0xbf480000  ! 407: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 34)
	.word 0xf83d20e2  ! 409: STD_I	std	%r28, [%r20 + 0x00e2]
	.word 0xfa3d0000  ! 413: STD_R	std	%r29, [%r20 + %r0]
	.word 0xbb518000  ! 418: RDPR_PSTATE	<illegal instruction>
	.word 0x8394614b  ! 420: WRPR_TNPC_I	wrpr	%r17, 0x014b, %tnpc
	.word 0x819460ef  ! 422: WRPR_TPC_I	wrpr	%r17, 0x00ef, %tpc
	.word 0xfe2da04e  ! 426: STB_I	stb	%r31, [%r22 + 0x004e]
	setx	0x41efb5ca00001e96, %g1, %r10
	.word 0x839a8000  ! 427: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x81956055  ! 429: WRPR_TPC_I	wrpr	%r21, 0x0055, %tpc
	.word 0xfa3cc000  ! 430: STD_R	std	%r29, [%r19 + %r0]
	setx	0x12d51a7d00002e1c, %g1, %r10
	.word 0x819a8000  ! 431: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 5)
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 14)
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 1)
	.word 0x8194613f  ! 439: WRPR_TPC_I	wrpr	%r17, 0x013f, %tpc
	.word 0xf435210e  ! 442: STH_I	sth	%r26, [%r20 + 0x010e]
	.word 0x8d942099  ! 447: WRPR_PSTATE_I	wrpr	%r16, 0x0099, %pstate
	setx	0x3c800c370000ef18, %g1, %r10
	.word 0x839a8000  ! 448: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d94e066  ! 453: WRPR_PSTATE_I	wrpr	%r19, 0x0066, %pstate
	.word 0xb750c000  ! 454: RDPR_TT	rdpr	%tt, %r27
	.word 0xf824c000  ! 459: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xfd3ce036  ! 460: STDF_I	std	%f30, [0x0036, %r19]
	.word 0xf2750000  ! 463: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xfa240000  ! 464: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xb335c000  ! 466: SRL_R	srl 	%r23, %r0, %r25
	.word 0xf22de1b1  ! 467: STB_I	stb	%r25, [%r23 + 0x01b1]
	mov	2, %r12
	.word 0xa1930000  ! 468: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3540000  ! 469: RDPR_GL	rdpr	%-, %r25
	.word 0x8795e084  ! 470: WRPR_TT_I	wrpr	%r23, 0x0084, %tt
	.word 0xf8758000  ! 471: STX_R	stx	%r28, [%r22 + %r0]
	.word 0x8d95a020  ! 472: WRPR_PSTATE_I	wrpr	%r22, 0x0020, %pstate
	.word 0xbd358000  ! 473: SRL_R	srl 	%r22, %r0, %r30
	.word 0xbd2d3001  ! 476: SLLX_I	sllx	%r20, 0x0001, %r30
	.word 0xf42d214b  ! 478: STB_I	stb	%r26, [%r20 + 0x014b]
	.word 0xbf510000  ! 479: RDPR_TICK	rdpr	%tick, %r31
	.word 0xf33c4000  ! 484: STDF_R	std	%f25, [%r0, %r17]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, d)
	.word 0xfe2da0c4  ! 488: STB_I	stb	%r31, [%r22 + 0x00c4]
	.word 0xf83c0000  ! 489: STD_R	std	%r28, [%r16 + %r0]
	.word 0xf43ca07f  ! 490: STD_I	std	%r26, [%r18 + 0x007f]
	.word 0xbd518000  ! 493: RDPR_PSTATE	<illegal instruction>
	.word 0xbd504000  ! 501: RDPR_TNPC	<illegal instruction>
	.word 0xfc3c614c  ! 504: STD_I	std	%r30, [%r17 + 0x014c]
	.word 0xbf508000  ! 505: RDPR_TSTATE	<illegal instruction>
	.word 0xfc340000  ! 508: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xbf518000  ! 510: RDPR_PSTATE	<illegal instruction>
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfb3c0000  ! 514: STDF_R	std	%f29, [%r0, %r16]
	.word 0xf025e165  ! 518: STW_I	stw	%r24, [%r23 + 0x0165]
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 0)
	setx	0x1d69aa9900000e87, %g1, %r10
	.word 0x819a8000  ! 520: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb605a0cc  ! 522: ADD_I	add 	%r22, 0x00cc, %r27
	.word 0xf02c6199  ! 525: STB_I	stb	%r24, [%r17 + 0x0199]
	.word 0xf0350000  ! 531: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xf02460b0  ! 532: STW_I	stw	%r24, [%r17 + 0x00b0]
	.word 0x8994e060  ! 535: WRPR_TICK_I	wrpr	%r19, 0x0060, %tick
	.word 0xb52c8000  ! 537: SLL_R	sll 	%r18, %r0, %r26
	.word 0xfe34e19a  ! 538: STH_I	sth	%r31, [%r19 + 0x019a]
	.word 0xfa3c20df  ! 539: STD_I	std	%r29, [%r16 + 0x00df]
	.word 0x8594205f  ! 543: WRPR_TSTATE_I	wrpr	%r16, 0x005f, %tstate
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 2a)
	mov	1, %r12
	.word 0xa1930000  ! 548: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x81952038  ! 551: WRPR_TPC_I	wrpr	%r20, 0x0038, %tpc
	.word 0xf33c4000  ! 552: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf53c4000  ! 553: STDF_R	std	%f26, [%r0, %r17]
	.word 0xf82d8000  ! 555: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xf224e1c5  ! 556: STW_I	stw	%r25, [%r19 + 0x01c5]
	.word 0xba34c000  ! 557: SUBC_R	orn 	%r19, %r0, %r29
	.word 0xfa74e167  ! 558: STX_I	stx	%r29, [%r19 + 0x0167]
	.word 0xf2752189  ! 561: STX_I	stx	%r25, [%r20 + 0x0189]
	.word 0xb1504000  ! 562: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x8794e0ff  ! 567: WRPR_TT_I	wrpr	%r19, 0x00ff, %tt
	.word 0x8595a0c4  ! 569: WRPR_TSTATE_I	wrpr	%r22, 0x00c4, %tstate
	.word 0x859420f8  ! 570: WRPR_TSTATE_I	wrpr	%r16, 0x00f8, %tstate
	.word 0xb9518000  ! 571: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xb41c8000  ! 573: XOR_R	xor 	%r18, %r0, %r26
	.word 0xf025a015  ! 574: STW_I	stw	%r24, [%r22 + 0x0015]
	setx	0xb5b1869600004d8d, %g1, %r10
	.word 0x839a8000  ! 577: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 0)
	.word 0xbb540000  ! 581: RDPR_GL	rdpr	%-, %r29
	.word 0xbb504000  ! 582: RDPR_TNPC	<illegal instruction>
	.word 0xf8344000  ! 583: STH_R	sth	%r28, [%r17 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 585: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7504000  ! 587: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xfe744000  ! 590: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xbb508000  ! 592: RDPR_TSTATE	<illegal instruction>
	.word 0xbe2d0000  ! 593: ANDN_R	andn 	%r20, %r0, %r31
	.word 0xf53c213c  ! 594: STDF_I	std	%f26, [0x013c, %r16]
	.word 0xf8744000  ! 597: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xb3540000  ! 600: RDPR_GL	<illegal instruction>
	.word 0x8594e1e8  ! 602: WRPR_TSTATE_I	wrpr	%r19, 0x01e8, %tstate
	.word 0xb21ca02c  ! 604: XOR_I	xor 	%r18, 0x002c, %r25
	.word 0x8394e117  ! 605: WRPR_TNPC_I	wrpr	%r19, 0x0117, %tnpc
	.word 0xfa3420cc  ! 606: STH_I	sth	%r29, [%r16 + 0x00cc]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 13)
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 4)
	.word 0xfa344000  ! 612: STH_R	sth	%r29, [%r17 + %r0]
	.word 0x9194e128  ! 614: WRPR_PIL_I	wrpr	%r19, 0x0128, %pil
	.word 0xfa74c000  ! 615: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xfa350000  ! 616: STH_R	sth	%r29, [%r20 + %r0]
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf03d600b  ! 620: STD_I	std	%r24, [%r21 + 0x000b]
	.word 0xb550c000  ! 623: RDPR_TT	rdpr	%tt, %r26
	mov	2, %r12
	.word 0x8f930000  ! 626: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc3c60fa  ! 629: STD_I	std	%r30, [%r17 + 0x00fa]
	.word 0xfc2c8000  ! 630: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xfe2461e9  ! 631: STW_I	stw	%r31, [%r17 + 0x01e9]
	.word 0xbf480000  ! 633: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfa3ce0f6  ! 634: STD_I	std	%r29, [%r19 + 0x00f6]
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 10)
	mov	0, %r12
	.word 0xa1930000  ! 639: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc3de0f7  ! 640: STD_I	std	%r30, [%r23 + 0x00f7]
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 16)
	.word 0xfd3c4000  ! 645: STDF_R	std	%f30, [%r0, %r17]
	.word 0xfe24e00c  ! 646: STW_I	stw	%r31, [%r19 + 0x000c]
	.word 0xb1510000  ! 654: RDPR_TICK	rdpr	%tick, %r24
	.word 0xbe94c000  ! 655: ORcc_R	orcc 	%r19, %r0, %r31
	.word 0xfa2d2103  ! 659: STB_I	stb	%r29, [%r20 + 0x0103]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 3)
	.word 0x8394a002  ! 661: WRPR_TNPC_I	wrpr	%r18, 0x0002, %tnpc
	.word 0xfd3cc000  ! 662: STDF_R	std	%f30, [%r0, %r19]
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 28)
	setx	data_start_4, %g1, %r20
	.word 0xf074217b  ! 667: STX_I	stx	%r24, [%r16 + 0x017b]
	.word 0xb3510000  ! 669: RDPR_TICK	rdpr	%tick, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe35c000  ! 677: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xf8340000  ! 678: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xf43de17d  ! 681: STD_I	std	%r26, [%r23 + 0x017d]
	.word 0xf73ca0b2  ! 683: STDF_I	std	%f27, [0x00b2, %r18]
	.word 0xbabdc000  ! 684: XNORcc_R	xnorcc 	%r23, %r0, %r29
	setx	data_start_2, %g1, %r18
	.word 0xfa2c61f5  ! 691: STB_I	stb	%r29, [%r17 + 0x01f5]
	.word 0x8394a081  ! 694: WRPR_TNPC_I	wrpr	%r18, 0x0081, %tnpc
	.word 0xfa254000  ! 696: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xbb3ca001  ! 697: SRA_I	sra 	%r18, 0x0001, %r29
	.word 0xf024c000  ! 702: STW_R	stw	%r24, [%r19 + %r0]
	setx	data_start_5, %g1, %r21
	.word 0xfa3cc000  ! 709: STD_R	std	%r29, [%r19 + %r0]
	.word 0xf2344000  ! 712: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xb52d9000  ! 715: SLLX_R	sllx	%r22, %r0, %r26
	.word 0xb6148000  ! 717: OR_R	or 	%r18, %r0, %r27
	setx	0x648a045200001d05, %g1, %r10
	.word 0x839a8000  ! 719: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb0b5e02b  ! 720: SUBCcc_I	orncc 	%r23, 0x002b, %r24
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 20)
	.word 0x819420f6  ! 727: WRPR_TPC_I	wrpr	%r16, 0x00f6, %tpc
	.word 0xf13dc000  ! 737: STDF_R	std	%f24, [%r0, %r23]
	.word 0xf43c608c  ! 746: STD_I	std	%r26, [%r17 + 0x008c]
	.word 0xff3c0000  ! 748: STDF_R	std	%f31, [%r0, %r16]
	setx	data_start_5, %g1, %r22
	.word 0xb93de001  ! 752: SRA_I	sra 	%r23, 0x0001, %r28
	.word 0xf4758000  ! 753: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xfc258000  ! 756: STW_R	stw	%r30, [%r22 + %r0]
	mov	1, %r12
	.word 0xa1930000  ! 757: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 1)
	.word 0xfc2421c7  ! 760: STW_I	stw	%r30, [%r16 + 0x01c7]
	.word 0xfe2c8000  ! 762: STB_R	stb	%r31, [%r18 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 765: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf518000  ! 767: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf2344000  ! 769: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xfa2cc000  ! 770: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xf0344000  ! 771: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xb9510000  ! 776: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	2, %r12
	.word 0x8f930000  ! 788: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb0c4a015  ! 793: ADDCcc_I	addccc 	%r18, 0x0015, %r24
	.word 0xb5520000  ! 795: RDPR_PIL	rdpr	%pil, %r26
	setx	data_start_5, %g1, %r23
	.word 0xf03cc000  ! 798: STD_R	std	%r24, [%r19 + %r0]
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 2)
	.word 0xb6940000  ! 800: ORcc_R	orcc 	%r16, %r0, %r27
	.word 0xf02c0000  ! 801: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xf33d8000  ! 802: STDF_R	std	%f25, [%r0, %r22]
	.word 0xb6b4e13b  ! 804: SUBCcc_I	orncc 	%r19, 0x013b, %r27
	.word 0xf73d4000  ! 810: STDF_R	std	%f27, [%r0, %r21]
	setx	data_start_1, %g1, %r17
	setx	0xc9a0448700004f9b, %g1, %r10
	.word 0x839a8000  ! 814: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf6340000  ! 815: STH_R	sth	%r27, [%r16 + %r0]
	setx	data_start_1, %g1, %r17
	.word 0x83942058  ! 819: WRPR_TNPC_I	wrpr	%r16, 0x0058, %tnpc
	.word 0xfa258000  ! 820: STW_R	stw	%r29, [%r22 + %r0]
	.word 0x87946084  ! 824: WRPR_TT_I	wrpr	%r17, 0x0084, %tt
	.word 0x8394a198  ! 827: WRPR_TNPC_I	wrpr	%r18, 0x0198, %tnpc
	.word 0x8394e029  ! 830: WRPR_TNPC_I	wrpr	%r19, 0x0029, %tnpc
	mov	1, %r12
	.word 0x8f930000  ! 832: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, c)
	.word 0xfe2cc000  ! 836: STB_R	stb	%r31, [%r19 + %r0]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 4)
	setx	0xcce618000000c8db, %g1, %r10
	.word 0x819a8000  ! 842: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9520000  ! 843: RDPR_PIL	rdpr	%pil, %r28
	.word 0xb551c000  ! 844: RDPR_TL	<illegal instruction>
	setx	0x32e8de260000bd92, %g1, %r10
	.word 0x819a8000  ! 846: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xcef5ab0300007bcd, %g1, %r10
	.word 0x819a8000  ! 849: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe75e1d6  ! 857: STX_I	stx	%r31, [%r23 + 0x01d6]
	setx	0x37c17d640000fc1c, %g1, %r10
	.word 0x839a8000  ! 860: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 14)
	.word 0xf234e1ff  ! 864: STH_I	sth	%r25, [%r19 + 0x01ff]
	.word 0xb244e1d2  ! 865: ADDC_I	addc 	%r19, 0x01d2, %r25
	setx	0xe8a16f7100006cd3, %g1, %r10
	.word 0x819a8000  ! 866: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x819421e4  ! 867: WRPR_TPC_I	wrpr	%r16, 0x01e4, %tpc
	.word 0xba04c000  ! 875: ADD_R	add 	%r19, %r0, %r29
	.word 0xf4244000  ! 876: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xfc24a002  ! 877: STW_I	stw	%r30, [%r18 + 0x0002]
	.word 0xf83d8000  ! 881: STD_R	std	%r28, [%r22 + %r0]
	.word 0xf23d6023  ! 884: STD_I	std	%r25, [%r21 + 0x0023]
	setx	data_start_1, %g1, %r21
	.word 0xb5641800  ! 891: MOVcc_R	<illegal instruction>
	.word 0xf075218c  ! 894: STX_I	stx	%r24, [%r20 + 0x018c]
	.word 0x8795a131  ! 896: WRPR_TT_I	wrpr	%r22, 0x0131, %tt
	.word 0xfb3c4000  ! 898: STDF_R	std	%f29, [%r0, %r17]
	.word 0xfa3c4000  ! 899: STD_R	std	%r29, [%r17 + %r0]
	.word 0xfe358000  ! 900: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xf2340000  ! 902: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xb3480000  ! 903: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf874c000  ! 904: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf83d4000  ! 906: STD_R	std	%r28, [%r21 + %r0]
	.word 0x87942091  ! 929: WRPR_TT_I	wrpr	%r16, 0x0091, %tt
	.word 0xf33dc000  ! 930: STDF_R	std	%f25, [%r0, %r23]
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 3d)
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 1f)
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 24)
	.word 0xb41d4000  ! 948: XOR_R	xor 	%r21, %r0, %r26
	.word 0xfe3ce151  ! 949: STD_I	std	%r31, [%r19 + 0x0151]
	.word 0xf2346061  ! 950: STH_I	sth	%r25, [%r17 + 0x0061]
	.word 0xf23c6119  ! 953: STD_I	std	%r25, [%r17 + 0x0119]
	.word 0xbe9da094  ! 956: XORcc_I	xorcc 	%r22, 0x0094, %r31
	setx	data_start_3, %g1, %r19
	.word 0xf53c8000  ! 958: STDF_R	std	%f26, [%r0, %r18]
	.word 0xf13c6164  ! 959: STDF_I	std	%f24, [0x0164, %r17]
	.word 0xf33ce0f3  ! 960: STDF_I	std	%f25, [0x00f3, %r19]
	.word 0xfa3d60aa  ! 961: STD_I	std	%r29, [%r21 + 0x00aa]
	.word 0xf83461a9  ! 962: STH_I	sth	%r28, [%r17 + 0x01a9]
	.word 0xbb500000  ! 965: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xbd500000  ! 969: RDPR_TPC	<illegal instruction>
	.word 0xb550c000  ! 973: RDPR_TT	<illegal instruction>
	.word 0xba8da06c  ! 974: ANDcc_I	andcc 	%r22, 0x006c, %r29
	setx	0xaaf1a48d00007d54, %g1, %r10
	.word 0x819a8000  ! 980: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf4352085  ! 981: STH_I	sth	%r26, [%r20 + 0x0085]
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 24)
	.word 0xfc348000  ! 984: STH_R	sth	%r30, [%r18 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 985: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbab58000  ! 986: SUBCcc_R	orncc 	%r22, %r0, %r29
	.word 0x8395610e  ! 987: WRPR_TNPC_I	wrpr	%r21, 0x010e, %tnpc
	.word 0xb2c5c000  ! 988: ADDCcc_R	addccc 	%r23, %r0, %r25
	.word 0xf22c4000  ! 989: STB_R	stb	%r25, [%r17 + %r0]
	.word 0x879521a2  ! 990: WRPR_TT_I	wrpr	%r20, 0x01a2, %tt
	.word 0xbc35a11a  ! 995: SUBC_I	orn 	%r22, 0x011a, %r30
	.word 0xb93cb001  ! 996: SRAX_I	srax	%r18, 0x0001, %r28
	.word 0xfe75e161  ! 997: STX_I	stx	%r31, [%r23 + 0x0161]
	.word 0xfe252114  ! 998: STW_I	stw	%r31, [%r20 + 0x0114]
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
	.word 0x8394a0ab  ! 5: WRPR_TNPC_I	wrpr	%r18, 0x00ab, %tnpc
	.word 0xf20ce104  ! 8: LDUB_I	ldub	[%r19 + 0x0104], %r25
	.word 0x879560e6  ! 9: WRPR_TT_I	wrpr	%r21, 0x00e6, %tt
	.word 0xfa4d0000  ! 11: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xb0344000  ! 12: ORN_R	orn 	%r17, %r0, %r24
	.word 0xbe150000  ! 17: OR_R	or 	%r20, %r0, %r31
	.word 0xb151c000  ! 18: RDPR_TL	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 21: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb93ca001  ! 24: SRA_I	sra 	%r18, 0x0001, %r28
	.word 0xfa0c21f1  ! 28: LDUB_I	ldub	[%r16 + 0x01f1], %r29
	.word 0xf91ce19e  ! 30: LDDF_I	ldd	[%r19, 0x019e], %f28
	.word 0xbd518000  ! 35: RDPR_PSTATE	<illegal instruction>
	.word 0xf64420b9  ! 38: LDSW_I	ldsw	[%r16 + 0x00b9], %r27
	.word 0xb7480000  ! 40: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf31c0000  ! 45: LDDF_R	ldd	[%r16, %r0], %f25
	.word 0xf205a11c  ! 46: LDUW_I	lduw	[%r22 + 0x011c], %r25
	.word 0xb3520000  ! 50: RDPR_PIL	<illegal instruction>
	.word 0xf60c4000  ! 53: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xb69c60e4  ! 55: XORcc_I	xorcc 	%r17, 0x00e4, %r27
	.word 0xfa040000  ! 59: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xfb1dc000  ! 60: LDDF_R	ldd	[%r23, %r0], %f29
	mov	1, %r12
	.word 0x8f930000  ! 63: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf05c0000  ! 64: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xff1de0a9  ! 66: LDDF_I	ldd	[%r23, 0x00a9], %f31
	.word 0x89942182  ! 69: WRPR_TICK_I	wrpr	%r16, 0x0182, %tick
	.word 0xf65ca0a2  ! 71: LDX_I	ldx	[%r18 + 0x00a2], %r27
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 29)
	mov	0, %r12
	.word 0xa1930000  ! 78: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5480000  ! 86: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	data_start_6, %g1, %r22
	.word 0xf44de076  ! 90: LDSB_I	ldsb	[%r23 + 0x0076], %r26
	.word 0xb5500000  ! 91: RDPR_TPC	<illegal instruction>
	.word 0xfa0c8000  ! 95: LDUB_R	ldub	[%r18 + %r0], %r29
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 1)
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 9)
	.word 0x899560f3  ! 103: WRPR_TICK_I	wrpr	%r21, 0x00f3, %tick
	.word 0xf0554000  ! 107: LDSH_R	ldsh	[%r21 + %r0], %r24
	.word 0xf854a198  ! 108: LDSH_I	ldsh	[%r18 + 0x0198], %r28
	.word 0xf2156089  ! 112: LDUH_I	lduh	[%r21 + 0x0089], %r25
	.word 0xfa146187  ! 116: LDUH_I	lduh	[%r17 + 0x0187], %r29
	.word 0xfc0d8000  ! 117: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xfa444000  ! 122: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xff1c8000  ! 124: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xf604c000  ! 128: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0xb4bd0000  ! 130: XNORcc_R	xnorcc 	%r20, %r0, %r26
	.word 0xb750c000  ! 131: RDPR_TT	<illegal instruction>
	.word 0xf6044000  ! 132: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xba0461c9  ! 134: ADD_I	add 	%r17, 0x01c9, %r29
	.word 0xbc45a01c  ! 136: ADDC_I	addc 	%r22, 0x001c, %r30
	.word 0xfa0c4000  ! 138: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0xbe9c8000  ! 139: XORcc_R	xorcc 	%r18, %r0, %r31
	.word 0xfb1c0000  ! 140: LDDF_R	ldd	[%r16, %r0], %f29
	.word 0xb5510000  ! 141: RDPR_TICK	<illegal instruction>
	.word 0xb350c000  ! 142: RDPR_TT	<illegal instruction>
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 2f)
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 34)
	.word 0xb3508000  ! 150: RDPR_TSTATE	<illegal instruction>
	.word 0xf445e0d5  ! 151: LDSW_I	ldsw	[%r23 + 0x00d5], %r26
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 6)
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, c)
	.word 0xf20ce0b3  ! 157: LDUB_I	ldub	[%r19 + 0x00b3], %r25
	.word 0xfe5de090  ! 159: LDX_I	ldx	[%r23 + 0x0090], %r31
	.word 0xbd504000  ! 160: RDPR_TNPC	<illegal instruction>
	.word 0xf6058000  ! 162: LDUW_R	lduw	[%r22 + %r0], %r27
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 2d)
	setx	data_start_6, %g1, %r17
	.word 0xfc4d0000  ! 167: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xfb1d0000  ! 168: LDDF_R	ldd	[%r20, %r0], %f29
	.word 0xfa0d8000  ! 172: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xfc4ce045  ! 175: LDSB_I	ldsb	[%r19 + 0x0045], %r30
	.word 0xb0b54000  ! 177: SUBCcc_R	orncc 	%r21, %r0, %r24
	.word 0xfc4cc000  ! 180: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xfe55a19a  ! 184: LDSH_I	ldsh	[%r22 + 0x019a], %r31
	.word 0xf11de15d  ! 190: LDDF_I	ldd	[%r23, 0x015d], %f24
	.word 0xf84d4000  ! 191: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xf8450000  ! 192: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xfa0de17e  ! 194: LDUB_I	ldub	[%r23 + 0x017e], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa4d4000  ! 202: LDSB_R	ldsb	[%r21 + %r0], %r29
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 19)
	.word 0xf21dc000  ! 208: LDD_R	ldd	[%r23 + %r0], %r25
	setx	0x35def1c700004e13, %g1, %r10
	.word 0x819a8000  ! 209: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc5da0ca  ! 210: LDX_I	ldx	[%r22 + 0x00ca], %r30
	.word 0xbe95e043  ! 212: ORcc_I	orcc 	%r23, 0x0043, %r31
	.word 0xf6156091  ! 214: LDUH_I	lduh	[%r21 + 0x0091], %r27
	.word 0xf444c000  ! 217: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xf25ca10c  ! 220: LDX_I	ldx	[%r18 + 0x010c], %r25
	.word 0xbd2d9000  ! 224: SLLX_R	sllx	%r22, %r0, %r30
	.word 0xf21dc000  ! 229: LDD_R	ldd	[%r23 + %r0], %r25
	setx	0x202cc97c00003a55, %g1, %r10
	.word 0x839a8000  ! 230: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1504000  ! 231: RDPR_TNPC	<illegal instruction>
	.word 0xf05d207c  ! 233: LDX_I	ldx	[%r20 + 0x007c], %r24
	.word 0xf004608f  ! 237: LDUW_I	lduw	[%r17 + 0x008f], %r24
	.word 0xf054a005  ! 243: LDSH_I	ldsh	[%r18 + 0x0005], %r24
	.word 0xf815a10e  ! 251: LDUH_I	lduh	[%r22 + 0x010e], %r28
	.word 0xfc050000  ! 254: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xbf518000  ! 256: RDPR_PSTATE	<illegal instruction>
	.word 0xb92ca001  ! 257: SLL_I	sll 	%r18, 0x0001, %r28
	.word 0x8795217b  ! 258: WRPR_TT_I	wrpr	%r20, 0x017b, %tt
	.word 0xfc0d6053  ! 262: LDUB_I	ldub	[%r21 + 0x0053], %r30
	.word 0xf20dc000  ! 267: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xfc1c218d  ! 270: LDD_I	ldd	[%r16 + 0x018d], %r30
	.word 0xfb1c2046  ! 271: LDDF_I	ldd	[%r16, 0x0046], %f29
	.word 0xfc048000  ! 273: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xf61c203e  ! 274: LDD_I	ldd	[%r16 + 0x003e], %r27
	.word 0x83956172  ! 275: WRPR_TNPC_I	wrpr	%r21, 0x0172, %tnpc
	.word 0xff1c8000  ! 277: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xb3518000  ! 281: RDPR_PSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 285: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8595e10f  ! 287: WRPR_TSTATE_I	wrpr	%r23, 0x010f, %tstate
	.word 0xf4048000  ! 291: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0xfa4c60b1  ! 294: LDSB_I	ldsb	[%r17 + 0x00b1], %r29
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf215e1f1  ! 296: LDUH_I	lduh	[%r23 + 0x01f1], %r25
	.word 0xff1da01a  ! 299: LDDF_I	ldd	[%r22, 0x001a], %f31
	.word 0x8195e082  ! 303: WRPR_TPC_I	wrpr	%r23, 0x0082, %tpc
	setx	0x69256f420000ea0a, %g1, %r10
	.word 0x819a8000  ! 305: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1520000  ! 308: RDPR_PIL	<illegal instruction>
	.word 0xb7500000  ! 309: RDPR_TPC	<illegal instruction>
	.word 0xfc14a0a7  ! 310: LDUH_I	lduh	[%r18 + 0x00a7], %r30
	setx	0x2e9f6c9200009b40, %g1, %r10
	.word 0x839a8000  ! 313: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf45c608a  ! 319: LDX_I	ldx	[%r17 + 0x008a], %r26
	.word 0xfe04e0f1  ! 321: LDUW_I	lduw	[%r19 + 0x00f1], %r31
	.word 0xf51de0cd  ! 322: LDDF_I	ldd	[%r23, 0x00cd], %f26
	.word 0xfc45e1ab  ! 326: LDSW_I	ldsw	[%r23 + 0x01ab], %r30
	.word 0xf0444000  ! 332: LDSW_R	ldsw	[%r17 + %r0], %r24
	mov	0, %r12
	.word 0xa1930000  ! 335: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf8450000  ! 341: LDSW_R	ldsw	[%r20 + %r0], %r28
	mov	0, %r12
	.word 0x8f930000  ! 345: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf60c2024  ! 348: LDUB_I	ldub	[%r16 + 0x0024], %r27
	.word 0xfc4d0000  ! 356: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xf8048000  ! 357: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xf81dc000  ! 358: LDD_R	ldd	[%r23 + %r0], %r28
	.word 0xfe4d8000  ! 361: LDSB_R	ldsb	[%r22 + %r0], %r31
	.word 0xfe04c000  ! 364: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xf45c8000  ! 370: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xf2046058  ! 371: LDUW_I	lduw	[%r17 + 0x0058], %r25
	.word 0xfe1d2055  ! 373: LDD_I	ldd	[%r20 + 0x0055], %r31
	.word 0xf91d8000  ! 374: LDDF_R	ldd	[%r22, %r0], %f28
	.word 0xbf510000  ! 376: RDPR_TICK	<illegal instruction>
	.word 0xfa444000  ! 380: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0x839460f8  ! 381: WRPR_TNPC_I	wrpr	%r17, 0x00f8, %tnpc
	.word 0xf855611a  ! 383: LDSH_I	ldsh	[%r21 + 0x011a], %r28
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf61ce0c2  ! 387: LDD_I	ldd	[%r19 + 0x00c2], %r27
	.word 0xfa44e04a  ! 391: LDSW_I	ldsw	[%r19 + 0x004a], %r29
	.word 0xfe05c000  ! 393: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xbf504000  ! 394: RDPR_TNPC	<illegal instruction>
	.word 0xf11c2007  ! 395: LDDF_I	ldd	[%r16, 0x0007], %f24
	.word 0xf01c60c5  ! 397: LDD_I	ldd	[%r17 + 0x00c5], %r24
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 3c)
	.word 0x8d94203a  ! 404: WRPR_PSTATE_I	wrpr	%r16, 0x003a, %pstate
	.word 0xfa458000  ! 405: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xf51dc000  ! 406: LDDF_R	ldd	[%r23, %r0], %f26
	.word 0xbf480000  ! 407: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 15)
	.word 0xfc45e116  ! 411: LDSW_I	ldsw	[%r23 + 0x0116], %r30
	.word 0xf6150000  ! 412: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xf24d8000  ! 415: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xfe1ca18f  ! 416: LDD_I	ldd	[%r18 + 0x018f], %r31
	.word 0xb3518000  ! 418: RDPR_PSTATE	<illegal instruction>
	.word 0x8394a199  ! 420: WRPR_TNPC_I	wrpr	%r18, 0x0199, %tnpc
	.word 0x8194e1ff  ! 422: WRPR_TPC_I	wrpr	%r19, 0x01ff, %tpc
	.word 0xf24ce196  ! 423: LDSB_I	ldsb	[%r19 + 0x0196], %r25
	.word 0xf41c4000  ! 425: LDD_R	ldd	[%r17 + %r0], %r26
	setx	0x4dd12d6400008e53, %g1, %r10
	.word 0x839a8000  ! 427: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x81942155  ! 429: WRPR_TPC_I	wrpr	%r16, 0x0155, %tpc
	setx	0x3488f74000008b58, %g1, %r10
	.word 0x819a8000  ! 431: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 23)
	.word 0xf60c60c5  ! 434: LDUB_I	ldub	[%r17 + 0x00c5], %r27
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf65da1f9  ! 437: LDX_I	ldx	[%r22 + 0x01f9], %r27
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 3b)
	.word 0x8194a13a  ! 439: WRPR_TPC_I	wrpr	%r18, 0x013a, %tpc
	.word 0x8d95e09b  ! 447: WRPR_PSTATE_I	wrpr	%r23, 0x009b, %pstate
	setx	0xeee28a4b0000fe87, %g1, %r10
	.word 0x839a8000  ! 448: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe5d6136  ! 452: LDX_I	ldx	[%r21 + 0x0136], %r31
	.word 0x8d946189  ! 453: WRPR_PSTATE_I	wrpr	%r17, 0x0189, %pstate
	.word 0xb150c000  ! 454: RDPR_TT	<illegal instruction>
	.word 0xfc5c0000  ! 462: LDX_R	ldx	[%r16 + %r0], %r30
	.word 0xbd35c000  ! 466: SRL_R	srl 	%r23, %r0, %r30
	mov	0, %r12
	.word 0xa1930000  ! 468: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3540000  ! 469: RDPR_GL	<illegal instruction>
	.word 0x8795a1e4  ! 470: WRPR_TT_I	wrpr	%r22, 0x01e4, %tt
	.word 0x8d95e0fc  ! 472: WRPR_PSTATE_I	wrpr	%r23, 0x00fc, %pstate
	.word 0xb135c000  ! 473: SRL_R	srl 	%r23, %r0, %r24
	.word 0xf04c4000  ! 475: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xbb2cf001  ! 476: SLLX_I	sllx	%r19, 0x0001, %r29
	.word 0xfc050000  ! 477: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xbd510000  ! 479: RDPR_TICK	rdpr	%tick, %r30
	.word 0xfa554000  ! 481: LDSH_R	ldsh	[%r21 + %r0], %r29
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 1d)
	.word 0xb7518000  ! 493: RDPR_PSTATE	<illegal instruction>
	.word 0xf01d6054  ! 495: LDD_I	ldd	[%r21 + 0x0054], %r24
	.word 0xbd504000  ! 501: RDPR_TNPC	<illegal instruction>
	.word 0xf25c0000  ! 503: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xb5508000  ! 505: RDPR_TSTATE	<illegal instruction>
	.word 0xbb518000  ! 510: RDPR_PSTATE	<illegal instruction>
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfe442043  ! 516: LDSW_I	ldsw	[%r16 + 0x0043], %r31
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 26)
	setx	0x81d02ee700006e1a, %g1, %r10
	.word 0x819a8000  ! 520: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf61ca0c9  ! 521: LDD_I	ldd	[%r18 + 0x00c9], %r27
	.word 0xbc0561d3  ! 522: ADD_I	add 	%r21, 0x01d3, %r30
	.word 0xf255612e  ! 524: LDSH_I	ldsh	[%r21 + 0x012e], %r25
	.word 0x8995e0a1  ! 535: WRPR_TICK_I	wrpr	%r23, 0x00a1, %tick
	.word 0xbb2c4000  ! 537: SLL_R	sll 	%r17, %r0, %r29
	.word 0xf61520ba  ! 540: LDUH_I	lduh	[%r20 + 0x00ba], %r27
	.word 0xf4046006  ! 541: LDUW_I	lduw	[%r17 + 0x0006], %r26
	.word 0x8595e121  ! 543: WRPR_TSTATE_I	wrpr	%r23, 0x0121, %tstate
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf85dc000  ! 545: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xf214c000  ! 547: LDUH_R	lduh	[%r19 + %r0], %r25
	mov	2, %r12
	.word 0xa1930000  ! 548: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8195a069  ! 551: WRPR_TPC_I	wrpr	%r22, 0x0069, %tpc
	.word 0xbe350000  ! 557: SUBC_R	orn 	%r20, %r0, %r31
	.word 0xbd504000  ! 562: RDPR_TNPC	<illegal instruction>
	.word 0xf20c61c0  ! 566: LDUB_I	ldub	[%r17 + 0x01c0], %r25
	.word 0x8794a077  ! 567: WRPR_TT_I	wrpr	%r18, 0x0077, %tt
	.word 0x85956073  ! 569: WRPR_TSTATE_I	wrpr	%r21, 0x0073, %tstate
	.word 0x8595a1f3  ! 570: WRPR_TSTATE_I	wrpr	%r22, 0x01f3, %tstate
	.word 0xb7518000  ! 571: RDPR_PSTATE	<illegal instruction>
	.word 0xb81cc000  ! 573: XOR_R	xor 	%r19, %r0, %r28
	setx	0xe448ff5d00009e5f, %g1, %r10
	.word 0x839a8000  ! 577: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 27)
	.word 0xf80c6088  ! 580: LDUB_I	ldub	[%r17 + 0x0088], %r28
	.word 0xbf540000  ! 581: RDPR_GL	<illegal instruction>
	.word 0xb1504000  ! 582: RDPR_TNPC	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 585: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3504000  ! 587: RDPR_TNPC	<illegal instruction>
	.word 0xf60d8000  ! 588: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0xbd508000  ! 592: RDPR_TSTATE	<illegal instruction>
	.word 0xb22c8000  ! 593: ANDN_R	andn 	%r18, %r0, %r25
	.word 0xf05c20cb  ! 599: LDX_I	ldx	[%r16 + 0x00cb], %r24
	.word 0xbd540000  ! 600: RDPR_GL	<illegal instruction>
	.word 0x85956136  ! 602: WRPR_TSTATE_I	wrpr	%r21, 0x0136, %tstate
	.word 0xb01ce151  ! 604: XOR_I	xor 	%r19, 0x0151, %r24
	.word 0x8395e0a8  ! 605: WRPR_TNPC_I	wrpr	%r23, 0x00a8, %tnpc
	.word 0xf45c20be  ! 607: LDX_I	ldx	[%r16 + 0x00be], %r26
	.word 0xf24ce0df  ! 608: LDSB_I	ldsb	[%r19 + 0x00df], %r25
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 22)
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 0)
	.word 0x9195200d  ! 614: WRPR_PIL_I	wrpr	%r20, 0x000d, %pil
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfc1460ab  ! 618: LDUH_I	lduh	[%r17 + 0x00ab], %r30
	.word 0xf80ce0cb  ! 619: LDUB_I	ldub	[%r19 + 0x00cb], %r28
	.word 0xb950c000  ! 623: RDPR_TT	<illegal instruction>
	.word 0xf81dc000  ! 624: LDD_R	ldd	[%r23 + %r0], %r28
	mov	1, %r12
	.word 0x8f930000  ! 626: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc1dc000  ! 632: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0xbf480000  ! 633: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 26)
	mov	0, %r12
	.word 0xa1930000  ! 639: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf04c0000  ! 642: LDSB_R	ldsb	[%r16 + %r0], %r24
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 15)
	.word 0xfe1d606f  ! 648: LDD_I	ldd	[%r21 + 0x006f], %r31
	.word 0xbf510000  ! 654: RDPR_TICK	<illegal instruction>
	.word 0xb8948000  ! 655: ORcc_R	orcc 	%r18, %r0, %r28
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 2)
	.word 0x83946036  ! 661: WRPR_TNPC_I	wrpr	%r17, 0x0036, %tnpc
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 10)
	setx	data_start_5, %g1, %r22
	.word 0xf20ca0fd  ! 668: LDUB_I	ldub	[%r18 + 0x00fd], %r25
	.word 0xb7510000  ! 669: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbabcc000  ! 684: XNORcc_R	xnorcc 	%r19, %r0, %r29
	.word 0xf20d20b7  ! 686: LDUB_I	ldub	[%r20 + 0x00b7], %r25
	setx	data_start_4, %g1, %r23
	.word 0x8395616e  ! 694: WRPR_TNPC_I	wrpr	%r21, 0x016e, %tnpc
	.word 0xb53d2001  ! 697: SRA_I	sra 	%r20, 0x0001, %r26
	.word 0xfc0c4000  ! 698: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xf64de036  ! 701: LDSB_I	ldsb	[%r23 + 0x0036], %r27
	.word 0xf24c0000  ! 703: LDSB_R	ldsb	[%r16 + %r0], %r25
	setx	data_start_5, %g1, %r16
	.word 0xb12cd000  ! 715: SLLX_R	sllx	%r19, %r0, %r24
	.word 0xb2144000  ! 717: OR_R	or 	%r17, %r0, %r25
	setx	0xf96645ca0000fd99, %g1, %r10
	.word 0x839a8000  ! 719: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbeb5e1d3  ! 720: SUBCcc_I	orncc 	%r23, 0x01d3, %r31
	.word 0xf0440000  ! 721: LDSW_R	ldsw	[%r16 + %r0], %r24
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 38)
	.word 0x8195a0a5  ! 727: WRPR_TPC_I	wrpr	%r22, 0x00a5, %tpc
	.word 0xfc4c60fb  ! 729: LDSB_I	ldsb	[%r17 + 0x00fb], %r30
	.word 0xf805a168  ! 731: LDUW_I	lduw	[%r22 + 0x0168], %r28
	.word 0xf645a18c  ! 732: LDSW_I	ldsw	[%r22 + 0x018c], %r27
	.word 0xf04de0e9  ! 742: LDSB_I	ldsb	[%r23 + 0x00e9], %r24
	.word 0xf644a001  ! 744: LDSW_I	ldsw	[%r18 + 0x0001], %r27
	setx	data_start_5, %g1, %r23
	.word 0xbd3d6001  ! 752: SRA_I	sra 	%r21, 0x0001, %r30
	.word 0xfc4420b2  ! 754: LDSW_I	ldsw	[%r16 + 0x00b2], %r30
	mov	1, %r12
	.word 0xa1930000  ! 757: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf85dc000  ! 761: LDX_R	ldx	[%r23 + %r0], %r28
	mov	2, %r12
	.word 0x8f930000  ! 765: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf518000  ! 767: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf71c0000  ! 768: LDDF_R	ldd	[%r16, %r0], %f27
	.word 0xb5510000  ! 776: RDPR_TICK	<illegal instruction>
	.word 0xfc5c8000  ! 777: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xf24ca0e2  ! 779: LDSB_I	ldsb	[%r18 + 0x00e2], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6550000  ! 782: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xf45de063  ! 785: LDX_I	ldx	[%r23 + 0x0063], %r26
	.word 0xf64d4000  ! 786: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xf6054000  ! 787: LDUW_R	lduw	[%r21 + %r0], %r27
	mov	2, %r12
	.word 0x8f930000  ! 788: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf24cc000  ! 789: LDSB_R	ldsb	[%r19 + %r0], %r25
	.word 0xfc0cc000  ! 791: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xb8c4a091  ! 793: ADDCcc_I	addccc 	%r18, 0x0091, %r28
	.word 0xbf520000  ! 795: RDPR_PIL	<illegal instruction>
	setx	data_start_7, %g1, %r18
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 15)
	.word 0xb2954000  ! 800: ORcc_R	orcc 	%r21, %r0, %r25
	.word 0xb4b4a1ed  ! 804: SUBCcc_I	orncc 	%r18, 0x01ed, %r26
	.word 0xfa146093  ! 807: LDUH_I	lduh	[%r17 + 0x0093], %r29
	.word 0xfa1da139  ! 808: LDD_I	ldd	[%r22 + 0x0139], %r29
	.word 0xf2556148  ! 809: LDSH_I	ldsh	[%r21 + 0x0148], %r25
	setx	data_start_4, %g1, %r18
	setx	0xc3181aed00009ad6, %g1, %r10
	.word 0x839a8000  ! 814: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc0d20e3  ! 816: LDUB_I	ldub	[%r20 + 0x00e3], %r30
	setx	data_start_4, %g1, %r17
	.word 0x83946118  ! 819: WRPR_TNPC_I	wrpr	%r17, 0x0118, %tnpc
	.word 0x8794a1c6  ! 824: WRPR_TT_I	wrpr	%r18, 0x01c6, %tt
	.word 0x839520c1  ! 827: WRPR_TNPC_I	wrpr	%r20, 0x00c1, %tnpc
	.word 0xf84c4000  ! 828: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0x8395e0ae  ! 830: WRPR_TNPC_I	wrpr	%r23, 0x00ae, %tnpc
	mov	0, %r12
	.word 0x8f930000  ! 832: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfa5d8000  ! 834: LDX_R	ldx	[%r22 + %r0], %r29
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, b)
	setx	0x1bcc061000005e14, %g1, %r10
	.word 0x819a8000  ! 842: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb520000  ! 843: RDPR_PIL	rdpr	%pil, %r29
	.word 0xb151c000  ! 844: RDPR_TL	<illegal instruction>
	setx	0xa480bd9a0000ba19, %g1, %r10
	.word 0x819a8000  ! 846: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf014206c  ! 847: LDUH_I	lduh	[%r16 + 0x006c], %r24
	.word 0xfe45c000  ! 848: LDSW_R	ldsw	[%r23 + %r0], %r31
	setx	0x933b1e250000c919, %g1, %r10
	.word 0x819a8000  ! 849: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa4d4000  ! 850: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf21dc000  ! 851: LDD_R	ldd	[%r23 + %r0], %r25
	.word 0xf41ce073  ! 855: LDD_I	ldd	[%r19 + 0x0073], %r26
	.word 0xfb1c6109  ! 858: LDDF_I	ldd	[%r17, 0x0109], %f29
	.word 0xfc448000  ! 859: LDSW_R	ldsw	[%r18 + %r0], %r30
	setx	0xd313e56700005a56, %g1, %r10
	.word 0x839a8000  ! 860: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 12)
	.word 0xb845a04d  ! 865: ADDC_I	addc 	%r22, 0x004d, %r28
	setx	0x4779c70b000019da, %g1, %r10
	.word 0x819a8000  ! 866: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x81946094  ! 867: WRPR_TPC_I	wrpr	%r17, 0x0094, %tpc
	.word 0xfc54a1dc  ! 869: LDSH_I	ldsh	[%r18 + 0x01dc], %r30
	.word 0xf04c0000  ! 870: LDSB_R	ldsb	[%r16 + %r0], %r24
	.word 0xb2058000  ! 875: ADD_R	add 	%r22, %r0, %r25
	setx	data_start_0, %g1, %r20
	.word 0xbb641800  ! 891: MOVcc_R	<illegal instruction>
	.word 0xfc554000  ! 892: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0x8795a155  ! 896: WRPR_TT_I	wrpr	%r22, 0x0155, %tt
	.word 0xf8548000  ! 901: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xb3480000  ! 903: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf40d0000  ! 909: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xfc5d4000  ! 913: LDX_R	ldx	[%r21 + %r0], %r30
	.word 0xfa4c4000  ! 916: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xf04460e8  ! 917: LDSW_I	ldsw	[%r17 + 0x00e8], %r24
	.word 0xf0542000  ! 922: LDSH_I	ldsh	[%r16 + 0x0000], %r24
	.word 0xfe044000  ! 923: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xfa0d4000  ! 924: LDUB_R	ldub	[%r21 + %r0], %r29
	.word 0xf8550000  ! 926: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0x879420b4  ! 929: WRPR_TT_I	wrpr	%r16, 0x00b4, %tt
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 26)
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 26)
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfa5ca0e6  ! 940: LDX_I	ldx	[%r18 + 0x00e6], %r29
	.word 0xfc044000  ! 941: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0xfc0d618d  ! 942: LDUB_I	ldub	[%r21 + 0x018d], %r30
	.word 0xf64dc000  ! 943: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xf455a065  ! 944: LDSH_I	ldsh	[%r22 + 0x0065], %r26
	.word 0xfa5d2187  ! 946: LDX_I	ldx	[%r20 + 0x0187], %r29
	.word 0xb21dc000  ! 948: XOR_R	xor 	%r23, %r0, %r25
	.word 0xf44c20ae  ! 952: LDSB_I	ldsb	[%r16 + 0x00ae], %r26
	.word 0xb09ca041  ! 956: XORcc_I	xorcc 	%r18, 0x0041, %r24
	setx	data_start_6, %g1, %r22
	.word 0xfa154000  ! 963: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xf41c4000  ! 964: LDD_R	ldd	[%r17 + %r0], %r26
	.word 0xb9500000  ! 965: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 969: RDPR_TPC	<illegal instruction>
	.word 0xf24c8000  ! 971: LDSB_R	ldsb	[%r18 + %r0], %r25
	.word 0xb350c000  ! 973: RDPR_TT	<illegal instruction>
	.word 0xb28d61f1  ! 974: ANDcc_I	andcc 	%r21, 0x01f1, %r25
	.word 0xf054213e  ! 976: LDSH_I	ldsh	[%r16 + 0x013e], %r24
	.word 0xf24dc000  ! 977: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xf60561ce  ! 978: LDUW_I	lduw	[%r21 + 0x01ce], %r27
	.word 0xfa450000  ! 979: LDSW_R	ldsw	[%r20 + %r0], %r29
	setx	0xb2e3bda200008ad8, %g1, %r10
	.word 0x819a8000  ! 980: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 8)
	mov	1, %r12
	.word 0xa1930000  ! 985: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb4b54000  ! 986: SUBCcc_R	orncc 	%r21, %r0, %r26
	.word 0x839420b0  ! 987: WRPR_TNPC_I	wrpr	%r16, 0x00b0, %tnpc
	.word 0xbac44000  ! 988: ADDCcc_R	addccc 	%r17, %r0, %r29
	.word 0x879460ce  ! 990: WRPR_TT_I	wrpr	%r17, 0x00ce, %tt
	.word 0xf60d6107  ! 993: LDUB_I	ldub	[%r21 + 0x0107], %r27
	.word 0xfc0461ba  ! 994: LDUW_I	lduw	[%r17 + 0x01ba], %r30
	.word 0xb434e1a9  ! 995: SUBC_I	orn 	%r19, 0x01a9, %r26
	.word 0xbb3cf001  ! 996: SRAX_I	srax	%r19, 0x0001, %r29
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0x8395a0fc  ! 5: WRPR_TNPC_I	wrpr	%r22, 0x00fc, %tnpc
	.word 0xbba84820  ! 6: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb3a54840  ! 7: FADDd	faddd	%f52, %f0, %f56
	.word 0x879421f9  ! 9: WRPR_TT_I	wrpr	%r16, 0x01f9, %tt
	.word 0xb7a80c20  ! 10: FMOVRLZ	dis not found

	.word 0xb4340000  ! 12: ORN_R	orn 	%r16, %r0, %r26
	.word 0xbfa00560  ! 13: FSQRTq	fsqrt	
	.word 0xbc15c000  ! 17: OR_R	or 	%r23, %r0, %r30
	.word 0xb151c000  ! 18: RDPR_TL	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 21: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda50860  ! 22: FADDq	dis not found

	.word 0xb33ca001  ! 24: SRA_I	sra 	%r18, 0x0001, %r25
	.word 0xb5a40860  ! 29: FADDq	dis not found

	.word 0xb9518000  ! 35: RDPR_PSTATE	<illegal instruction>
	.word 0xbba4c9a0  ! 37: FDIVs	fdivs	%f19, %f0, %f29
	.word 0xbda4c840  ! 39: FADDd	faddd	%f50, %f0, %f30
	.word 0xb7480000  ! 40: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbba81820  ! 41: FMOVRGZ	fmovs	%fcc3, %f0, %f29
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 29)
	.word 0xb9aac820  ! 43: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb5aa0820  ! 47: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb5a00520  ! 48: FSQRTs	fsqrt	
	.word 0xb5520000  ! 50: RDPR_PIL	<illegal instruction>
	.word 0xbc9ce10f  ! 55: XORcc_I	xorcc 	%r19, 0x010f, %r30
	.word 0xbfa4c8a0  ! 56: FSUBs	fsubs	%f19, %f0, %f31
	mov	2, %r12
	.word 0x8f930000  ! 63: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1ab0820  ! 67: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0x8994e09c  ! 69: WRPR_TICK_I	wrpr	%r19, 0x009c, %tick
	.word 0xbba00520  ! 70: FSQRTs	fsqrt	
	.word 0xb3a44920  ! 75: FMULs	fmuls	%f17, %f0, %f25
	.word 0xbfabc820  ! 76: FMOVVC	fmovs	%fcc1, %f0, %f31
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 35)
	mov	1, %r12
	.word 0xa1930000  ! 78: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3aa0820  ! 83: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbfa88820  ! 85: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb5480000  ! 86: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	data_start_3, %g1, %r21
	.word 0xb7500000  ! 91: RDPR_TPC	<illegal instruction>
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 19)
	.word 0xb1aa0820  ! 98: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb9aa4820  ! 101: FMOVNE	fmovs	%fcc1, %f0, %f28
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 1d)
	.word 0x899420b6  ! 103: WRPR_TICK_I	wrpr	%r16, 0x00b6, %tick
	.word 0xb5a50940  ! 109: FMULd	fmuld	%f20, %f0, %f26
	.word 0xb9aa4820  ! 111: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a80c20  ! 119: FMOVRLZ	dis not found

	.word 0xb4bd8000  ! 130: XNORcc_R	xnorcc 	%r22, %r0, %r26
	.word 0xb350c000  ! 131: RDPR_TT	<illegal instruction>
	.word 0xba04a01b  ! 134: ADD_I	add 	%r18, 0x001b, %r29
	.word 0xb444e04c  ! 136: ADDC_I	addc 	%r19, 0x004c, %r26
	.word 0xbda81c20  ! 137: FMOVRGEZ	dis not found

	.word 0xba9dc000  ! 139: XORcc_R	xorcc 	%r23, %r0, %r29
	.word 0xb9510000  ! 141: RDPR_TICK	<illegal instruction>
	.word 0xb950c000  ! 142: RDPR_TT	<illegal instruction>
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 10)
	.word 0xbfaa8820  ! 144: FMOVG	fmovs	%fcc1, %f0, %f31
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbda00560  ! 149: FSQRTq	fsqrt	
	.word 0xb5508000  ! 150: RDPR_TSTATE	<illegal instruction>
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 3b)
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 7)
	.word 0xbb504000  ! 160: RDPR_TNPC	<illegal instruction>
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 21)
	setx	data_start_4, %g1, %r19
	.word 0xb1aa4820  ! 165: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbda88820  ! 166: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb1ab8820  ! 169: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb9a81420  ! 173: FMOVRNZ	dis not found

	.word 0xb7a548e0  ! 174: FSUBq	dis not found

	.word 0xb5a00020  ! 176: FMOVs	fmovs	%f0, %f26
	.word 0xb6b40000  ! 177: SUBCcc_R	orncc 	%r16, %r0, %r27
	.word 0xb9a00520  ! 179: FSQRTs	fsqrt	
	.word 0xb5a508c0  ! 182: FSUBd	fsubd	%f20, %f0, %f26
	.word 0xbbab0820  ! 183: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb7a548e0  ! 193: FSUBq	dis not found

	.word 0xb1a5c920  ! 196: FMULs	fmuls	%f23, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba00020  ! 199: FMOVs	fmovs	%f0, %f29
	.word 0xb5a5c820  ! 201: FADDs	fadds	%f23, %f0, %f26
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, b)
	setx	0x19fa21c700008a8b, %g1, %r10
	.word 0x819a8000  ! 209: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfab4820  ! 211: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb295e1e7  ! 212: ORcc_I	orcc 	%r23, 0x01e7, %r25
	.word 0xb7a00520  ! 218: FSQRTs	fsqrt	
	.word 0xbba00540  ! 219: FSQRTd	fsqrt	
	.word 0xb9a00020  ! 223: FMOVs	fmovs	%f0, %f28
	.word 0xb92d5000  ! 224: SLLX_R	sllx	%r21, %r0, %r28
	.word 0xbda5c960  ! 225: FMULq	dis not found

	.word 0xbba9c820  ! 228: FMOVVS	fmovs	%fcc1, %f0, %f29
	setx	0x372b35a700008e1e, %g1, %r10
	.word 0x839a8000  ! 230: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3504000  ! 231: RDPR_TNPC	<illegal instruction>
	.word 0xb5a00560  ! 232: FSQRTq	fsqrt	
	.word 0xbda54940  ! 238: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb1a5c840  ! 241: FADDd	faddd	%f54, %f0, %f24
	.word 0xbba81820  ! 242: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xbda00040  ! 246: FMOVd	fmovd	%f0, %f30
	.word 0xbb518000  ! 256: RDPR_PSTATE	<illegal instruction>
	.word 0xb52da001  ! 257: SLL_I	sll 	%r22, 0x0001, %r26
	.word 0x87942199  ! 258: WRPR_TT_I	wrpr	%r16, 0x0199, %tt
	.word 0xb1aa4820  ! 261: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0x8395e006  ! 275: WRPR_TNPC_I	wrpr	%r23, 0x0006, %tnpc
	.word 0xb7a449e0  ! 278: FDIVq	dis not found

	.word 0xbfa84820  ! 279: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb1518000  ! 281: RDPR_PSTATE	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 285: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8594a139  ! 287: WRPR_TSTATE_I	wrpr	%r18, 0x0139, %tstate
	.word 0xb7a488a0  ! 290: FSUBs	fsubs	%f18, %f0, %f27
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 28)
	.word 0xb3ab0820  ! 297: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb7a448c0  ! 300: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xb9a00560  ! 302: FSQRTq	fsqrt	
	.word 0x81946197  ! 303: WRPR_TPC_I	wrpr	%r17, 0x0197, %tpc
	setx	0x9231c40b000038c7, %g1, %r10
	.word 0x819a8000  ! 305: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3520000  ! 308: RDPR_PIL	<illegal instruction>
	.word 0xb1500000  ! 309: RDPR_TPC	<illegal instruction>
	.word 0xb3a00520  ! 312: FSQRTs	fsqrt	
	setx	0x8a5daa8100008884, %g1, %r10
	.word 0x839a8000  ! 313: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3a44840  ! 314: FADDd	faddd	%f48, %f0, %f56
	.word 0xb9a489a0  ! 318: FDIVs	fdivs	%f18, %f0, %f28
	.word 0xbfa84820  ! 324: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbda00520  ! 334: FSQRTs	fsqrt	
	mov	1, %r12
	.word 0xa1930000  ! 335: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5a80820  ! 337: FMOVN	fmovs	%fcc1, %f0, %f26
	mov	2, %r12
	.word 0x8f930000  ! 345: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda58820  ! 346: FADDs	fadds	%f22, %f0, %f30
	.word 0xb3a80820  ! 352: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbba00560  ! 354: FSQRTq	fsqrt	
	.word 0xb9a80820  ! 355: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbfa40860  ! 359: FADDq	dis not found

	.word 0xb3aac820  ! 360: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbda81c20  ! 367: FMOVRGEZ	dis not found

	.word 0xbfa588c0  ! 369: FSUBd	fsubd	%f22, %f0, %f62
	.word 0xbd510000  ! 376: RDPR_TICK	<illegal instruction>
	.word 0xb1a00020  ! 377: FMOVs	fmovs	%f0, %f24
	.word 0x8394218e  ! 381: WRPR_TNPC_I	wrpr	%r16, 0x018e, %tnpc
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 11)
	.word 0xb1a448c0  ! 385: FSUBd	fsubd	%f48, %f0, %f24
	.word 0xb5a40860  ! 392: FADDq	dis not found

	.word 0xb9504000  ! 394: RDPR_TNPC	<illegal instruction>
	.word 0xbda5c9a0  ! 399: FDIVs	fdivs	%f23, %f0, %f30
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 26)
	.word 0x8d95e046  ! 404: WRPR_PSTATE_I	wrpr	%r23, 0x0046, %pstate
	.word 0xb9480000  ! 407: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 1)
	.word 0xbfa54860  ! 414: FADDq	dis not found

	.word 0xb1a44860  ! 417: FADDq	dis not found

	.word 0xb9518000  ! 418: RDPR_PSTATE	<illegal instruction>
	.word 0xb7aa4820  ! 419: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0x8394a059  ! 420: WRPR_TNPC_I	wrpr	%r18, 0x0059, %tnpc
	.word 0xb3a589e0  ! 421: FDIVq	dis not found

	.word 0x819561ec  ! 422: WRPR_TPC_I	wrpr	%r21, 0x01ec, %tpc
	setx	0xf7f0eb140000bbcf, %g1, %r10
	.word 0x839a8000  ! 427: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8194a0fa  ! 429: WRPR_TPC_I	wrpr	%r18, 0x00fa, %tpc
	setx	0x19d2c8300000ac18, %g1, %r10
	.word 0x819a8000  ! 431: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 3)
	.word 0xb5a00040  ! 435: FMOVd	fmovd	%f0, %f26
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 21)
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 1a)
	.word 0x8194216f  ! 439: WRPR_TPC_I	wrpr	%r16, 0x016f, %tpc
	.word 0xb3a98820  ! 443: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb1a00520  ! 444: FSQRTs	fsqrt	
	.word 0xb3a5c8c0  ! 445: FSUBd	fsubd	%f54, %f0, %f56
	.word 0x8d95e013  ! 447: WRPR_PSTATE_I	wrpr	%r23, 0x0013, %pstate
	setx	0x9c03648600009810, %g1, %r10
	.word 0x839a8000  ! 448: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a84820  ! 449: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbda00560  ! 451: FSQRTq	fsqrt	
	.word 0x8d9421da  ! 453: WRPR_PSTATE_I	wrpr	%r16, 0x01da, %pstate
	.word 0xbf50c000  ! 454: RDPR_TT	<illegal instruction>
	.word 0xbba54960  ! 455: FMULq	dis not found

	.word 0xbda80820  ! 457: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb7a5c8e0  ! 458: FSUBq	dis not found

	.word 0xb5350000  ! 466: SRL_R	srl 	%r20, %r0, %r26
	mov	1, %r12
	.word 0xa1930000  ! 468: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1540000  ! 469: RDPR_GL	<illegal instruction>
	.word 0x8794a0f3  ! 470: WRPR_TT_I	wrpr	%r18, 0x00f3, %tt
	.word 0x8d9561b6  ! 472: WRPR_PSTATE_I	wrpr	%r21, 0x01b6, %pstate
	.word 0xb3354000  ! 473: SRL_R	srl 	%r21, %r0, %r25
	.word 0xb9ab4820  ! 474: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb72cb001  ! 476: SLLX_I	sllx	%r18, 0x0001, %r27
	.word 0xbd510000  ! 479: RDPR_TICK	<illegal instruction>
	.word 0xbfa84820  ! 480: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb3aa4820  ! 482: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbba589c0  ! 485: FDIVd	fdivd	%f22, %f0, %f60
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 3)
	.word 0xb1a81420  ! 492: FMOVRNZ	dis not found

	.word 0xbd518000  ! 493: RDPR_PSTATE	<illegal instruction>
	.word 0xb5ab4820  ! 494: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbda00520  ! 496: FSQRTs	fsqrt	
	.word 0xbda00020  ! 498: FMOVs	fmovs	%f0, %f30
	.word 0xbda44820  ! 499: FADDs	fadds	%f17, %f0, %f30
	.word 0xb7a80c20  ! 500: FMOVRLZ	dis not found

	.word 0xb9504000  ! 501: RDPR_TNPC	<illegal instruction>
	.word 0xb1508000  ! 505: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a548a0  ! 506: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xb9a488c0  ! 507: FSUBd	fsubd	%f18, %f0, %f28
	.word 0xbd518000  ! 510: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a509c0  ! 511: FDIVd	fdivd	%f20, %f0, %f28
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 12)
	.word 0xbfa81820  ! 513: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbfa449a0  ! 515: FDIVs	fdivs	%f17, %f0, %f31
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 9)
	setx	0x46a2c07a0000ee57, %g1, %r10
	.word 0x819a8000  ! 520: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb805a12b  ! 522: ADD_I	add 	%r22, 0x012b, %r28
	.word 0xb5a50960  ! 523: FMULq	dis not found

	.word 0xb1aa0820  ! 528: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbfa44940  ! 530: FMULd	fmuld	%f48, %f0, %f62
	.word 0xbfa98820  ! 533: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbba488e0  ! 534: FSUBq	dis not found

	.word 0x8995a18d  ! 535: WRPR_TICK_I	wrpr	%r22, 0x018d, %tick
	.word 0xbb2d4000  ! 537: SLL_R	sll 	%r21, %r0, %r29
	.word 0xb7aa8820  ! 542: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0x859520ac  ! 543: WRPR_TSTATE_I	wrpr	%r20, 0x00ac, %tstate
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb9a548c0  ! 546: FSUBd	fsubd	%f52, %f0, %f28
	mov	0, %r12
	.word 0xa1930000  ! 548: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfa44940  ! 549: FMULd	fmuld	%f48, %f0, %f62
	.word 0xbfa84820  ! 550: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0x81956023  ! 551: WRPR_TPC_I	wrpr	%r21, 0x0023, %tpc
	.word 0xbba5c9e0  ! 554: FDIVq	dis not found

	.word 0xbc35c000  ! 557: SUBC_R	orn 	%r23, %r0, %r30
	.word 0xb1a81820  ! 559: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb5504000  ! 562: RDPR_TNPC	<illegal instruction>
	.word 0xb7a408a0  ! 563: FSUBs	fsubs	%f16, %f0, %f27
	.word 0xbfa00520  ! 564: FSQRTs	fsqrt	
	.word 0xbfab8820  ! 565: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0x879460a4  ! 567: WRPR_TT_I	wrpr	%r17, 0x00a4, %tt
	.word 0xb3a00020  ! 568: FMOVs	fmovs	%f0, %f25
	.word 0x859520e9  ! 569: WRPR_TSTATE_I	wrpr	%r20, 0x00e9, %tstate
	.word 0x85946098  ! 570: WRPR_TSTATE_I	wrpr	%r17, 0x0098, %tstate
	.word 0xbf518000  ! 571: RDPR_PSTATE	<illegal instruction>
	.word 0xbc1c4000  ! 573: XOR_R	xor 	%r17, %r0, %r30
	.word 0xbda81420  ! 575: FMOVRNZ	dis not found

	.word 0xb7a00020  ! 576: FMOVs	fmovs	%f0, %f27
	setx	0x6bf8ecbe0000cf58, %g1, %r10
	.word 0x839a8000  ! 577: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 37)
	.word 0xb5540000  ! 581: RDPR_GL	<illegal instruction>
	.word 0xb7504000  ! 582: RDPR_TNPC	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 585: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3a4c920  ! 586: FMULs	fmuls	%f19, %f0, %f25
	.word 0xb1504000  ! 587: RDPR_TNPC	<illegal instruction>
	.word 0xbda80420  ! 591: FMOVRZ	dis not found

	.word 0xb5508000  ! 592: RDPR_TSTATE	<illegal instruction>
	.word 0xb82dc000  ! 593: ANDN_R	andn 	%r23, %r0, %r28
	.word 0xbba80420  ! 595: FMOVRZ	dis not found

	.word 0xb7a50820  ! 596: FADDs	fadds	%f20, %f0, %f27
	.word 0xbb540000  ! 600: RDPR_GL	<illegal instruction>
	.word 0x8595206b  ! 602: WRPR_TSTATE_I	wrpr	%r20, 0x006b, %tstate
	.word 0xb01c206b  ! 604: XOR_I	xor 	%r16, 0x006b, %r24
	.word 0x8394e040  ! 605: WRPR_TNPC_I	wrpr	%r19, 0x0040, %tnpc
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 2f)
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3a8c820  ! 613: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0x9194a00a  ! 614: WRPR_PIL_I	wrpr	%r18, 0x000a, %pil
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 34)
	.word 0xb150c000  ! 623: RDPR_TT	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 626: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbba00540  ! 628: FSQRTd	fsqrt	
	.word 0xbd480000  ! 633: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb1a98820  ! 635: FMOVNEG	fmovs	%fcc1, %f0, %f24
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 7)
	.word 0xbfa90820  ! 638: FMOVLEU	fmovs	%fcc1, %f0, %f31
	mov	2, %r12
	.word 0xa1930000  ! 639: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbba5c8a0  ! 641: FSUBs	fsubs	%f23, %f0, %f29
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbda549c0  ! 644: FDIVd	fdivd	%f52, %f0, %f30
	.word 0xbdaa8820  ! 647: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbda98820  ! 649: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb7a5c9c0  ! 650: FDIVd	fdivd	%f54, %f0, %f58
	.word 0xb7510000  ! 654: RDPR_TICK	<illegal instruction>
	.word 0xb494c000  ! 655: ORcc_R	orcc 	%r19, %r0, %r26
	.word 0xb9a40940  ! 657: FMULd	fmuld	%f16, %f0, %f28
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 3b)
	.word 0x839560cc  ! 661: WRPR_TNPC_I	wrpr	%r21, 0x00cc, %tnpc
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, c)
	setx	data_start_7, %g1, %r20
	.word 0xb9510000  ! 669: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba80820  ! 674: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb7a00040  ! 675: FMOVd	fmovd	%f0, %f58
	.word 0xb5a448c0  ! 679: FSUBd	fsubd	%f48, %f0, %f26
	.word 0xbba80820  ! 680: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb2bcc000  ! 684: XNORcc_R	xnorcc 	%r19, %r0, %r25
	setx	data_start_3, %g1, %r16
	.word 0xbba5c940  ! 688: FMULd	fmuld	%f54, %f0, %f60
	.word 0x8394a01a  ! 694: WRPR_TNPC_I	wrpr	%r18, 0x001a, %tnpc
	.word 0xbba9c820  ! 695: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb93ce001  ! 697: SRA_I	sra 	%r19, 0x0001, %r28
	.word 0xb9a00560  ! 699: FSQRTq	fsqrt	
	.word 0xbda90820  ! 700: FMOVLEU	fmovs	%fcc1, %f0, %f30
	setx	data_start_3, %g1, %r19
	.word 0xbda5c840  ! 705: FADDd	faddd	%f54, %f0, %f30
	.word 0xbdaac820  ! 706: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb3aa0820  ! 707: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbfaa4820  ! 708: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbf2cd000  ! 715: SLLX_R	sllx	%r19, %r0, %r31
	.word 0xba150000  ! 717: OR_R	or 	%r20, %r0, %r29
	setx	0x7101f75800006b51, %g1, %r10
	.word 0x839a8000  ! 719: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbcb520b7  ! 720: SUBCcc_I	orncc 	%r20, 0x00b7, %r30
	.word 0xb5a40860  ! 722: FADDq	dis not found

	.word 0xb9a8c820  ! 723: FMOVL	fmovs	%fcc1, %f0, %f28
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 13)
	.word 0xbfab0820  ! 725: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0x8195e010  ! 727: WRPR_TPC_I	wrpr	%r23, 0x0010, %tpc
	.word 0xb1a408c0  ! 728: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xbba00040  ! 730: FMOVd	fmovd	%f0, %f60
	.word 0xb3a58840  ! 734: FADDd	faddd	%f22, %f0, %f56
	.word 0xb1a84820  ! 735: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xbba489c0  ! 738: FDIVd	fdivd	%f18, %f0, %f60
	.word 0xb9a81420  ! 739: FMOVRNZ	dis not found

	.word 0xb5a4c9a0  ! 741: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xb3a84820  ! 743: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb3a549a0  ! 745: FDIVs	fdivs	%f21, %f0, %f25
	setx	data_start_1, %g1, %r20
	.word 0xb7a50940  ! 751: FMULd	fmuld	%f20, %f0, %f58
	.word 0xb93d2001  ! 752: SRA_I	sra 	%r20, 0x0001, %r28
	mov	1, %r12
	.word 0xa1930000  ! 757: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a54840  ! 758: FADDd	faddd	%f52, %f0, %f28
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 2a)
	mov	1, %r12
	.word 0x8f930000  ! 765: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1a81420  ! 766: FMOVRNZ	dis not found

	.word 0xb7518000  ! 767: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xbfab8820  ! 772: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbd510000  ! 776: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3ab8820  ! 783: FMOVPOS	fmovs	%fcc1, %f0, %f25
	mov	2, %r12
	.word 0x8f930000  ! 788: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbac42186  ! 793: ADDCcc_I	addccc 	%r16, 0x0186, %r29
	.word 0xbb520000  ! 795: RDPR_PIL	<illegal instruction>
	setx	data_start_2, %g1, %r17
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 38)
	.word 0xbe948000  ! 800: ORcc_R	orcc 	%r18, %r0, %r31
	.word 0xb9a00520  ! 803: FSQRTs	fsqrt	
	.word 0xbeb4202e  ! 804: SUBCcc_I	orncc 	%r16, 0x002e, %r31
	.word 0xb5a448e0  ! 806: FSUBq	dis not found

	setx	data_start_2, %g1, %r19
	setx	0x4d3d9e8000004c55, %g1, %r10
	.word 0x839a8000  ! 814: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbba00540  ! 817: FSQRTd	fsqrt	
	setx	data_start_5, %g1, %r16
	.word 0x8395210b  ! 819: WRPR_TNPC_I	wrpr	%r20, 0x010b, %tnpc
	.word 0xbda549c0  ! 822: FDIVd	fdivd	%f52, %f0, %f30
	.word 0xb7aa8820  ! 823: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0x8795e0d7  ! 824: WRPR_TT_I	wrpr	%r23, 0x00d7, %tt
	.word 0xbba58820  ! 825: FADDs	fadds	%f22, %f0, %f29
	.word 0xbda98820  ! 826: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0x83956096  ! 827: WRPR_TNPC_I	wrpr	%r21, 0x0096, %tnpc
	.word 0xb9a00560  ! 829: FSQRTq	fsqrt	
	.word 0x8395e084  ! 830: WRPR_TNPC_I	wrpr	%r23, 0x0084, %tnpc
	.word 0xbba44820  ! 831: FADDs	fadds	%f17, %f0, %f29
	mov	2, %r12
	.word 0x8f930000  ! 832: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9a508c0  ! 835: FSUBd	fsubd	%f20, %f0, %f28
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 7)
	.word 0xb7a549e0  ! 839: FDIVq	dis not found

	.word 0xb1a80420  ! 841: FMOVRZ	dis not found

	setx	0xb48e257500006d0c, %g1, %r10
	.word 0x819a8000  ! 842: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9520000  ! 843: RDPR_PIL	<illegal instruction>
	.word 0xbd51c000  ! 844: RDPR_TL	<illegal instruction>
	setx	0x3f2c4d07000038d2, %g1, %r10
	.word 0x819a8000  ! 846: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xb661bed500001dc5, %g1, %r10
	.word 0x819a8000  ! 849: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5a44920  ! 852: FMULs	fmuls	%f17, %f0, %f26
	.word 0xbda549e0  ! 853: FDIVq	dis not found

	setx	0xd3a54cae0000fb46, %g1, %r10
	.word 0x839a8000  ! 860: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfab0820  ! 861: FMOVGU	fmovs	%fcc1, %f0, %f31
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 8)
	.word 0xb0452140  ! 865: ADDC_I	addc 	%r20, 0x0140, %r24
	setx	0x67d2a9c200008c47, %g1, %r10
	.word 0x819a8000  ! 866: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8195618c  ! 867: WRPR_TPC_I	wrpr	%r21, 0x018c, %tpc
	.word 0xb9a408a0  ! 868: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xb7a81c20  ! 871: FMOVRGEZ	dis not found

	.word 0xb5a4c9a0  ! 872: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xbfa509e0  ! 873: FDIVq	dis not found

	.word 0xb1a8c820  ! 874: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb804c000  ! 875: ADD_R	add 	%r19, %r0, %r28
	.word 0xb9a00560  ! 878: FSQRTq	fsqrt	
	.word 0xbda408e0  ! 882: FSUBq	dis not found

	.word 0xbdab8820  ! 883: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb3a448e0  ! 885: FSUBq	dis not found

	setx	data_start_7, %g1, %r16
	.word 0xb9a00560  ! 888: FSQRTq	fsqrt	
	.word 0xbba80820  ! 889: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbfa448e0  ! 890: FSUBq	dis not found

	.word 0xb7641800  ! 891: MOVcc_R	<illegal instruction>
	.word 0xb5a00020  ! 893: FMOVs	fmovs	%f0, %f26
	.word 0xbfa98820  ! 895: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0x879461c6  ! 896: WRPR_TT_I	wrpr	%r17, 0x01c6, %tt
	.word 0xbda4c8a0  ! 897: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xb3480000  ! 903: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbba50940  ! 907: FMULd	fmuld	%f20, %f0, %f60
	.word 0xb3a48840  ! 908: FADDd	faddd	%f18, %f0, %f56
	.word 0xbfa5c9e0  ! 911: FDIVq	dis not found

	.word 0xbdaa0820  ! 912: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb9a50940  ! 914: FMULd	fmuld	%f20, %f0, %f28
	.word 0xbbaa4820  ! 915: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbda5c820  ! 918: FADDs	fadds	%f23, %f0, %f30
	.word 0xb1a44840  ! 919: FADDd	faddd	%f48, %f0, %f24
	.word 0xb9a4c840  ! 921: FADDd	faddd	%f50, %f0, %f28
	.word 0xb1a80420  ! 927: FMOVRZ	dis not found

	.word 0x87946199  ! 929: WRPR_TT_I	wrpr	%r17, 0x0199, %tt
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 1)
	.word 0xb3a50840  ! 933: FADDd	faddd	%f20, %f0, %f56
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 3e)
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 30)
	.word 0xb9a81420  ! 938: FMOVRNZ	dis not found

	.word 0xbba90820  ! 939: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb3a00520  ! 947: FSQRTs	fsqrt	
	.word 0xba1d8000  ! 948: XOR_R	xor 	%r22, %r0, %r29
	.word 0xb09da033  ! 956: XORcc_I	xorcc 	%r22, 0x0033, %r24
	setx	data_start_5, %g1, %r17
	.word 0xb3500000  ! 965: RDPR_TPC	<illegal instruction>
	.word 0xb5aac820  ! 967: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb1500000  ! 969: RDPR_TPC	<illegal instruction>
	.word 0xb5a489a0  ! 972: FDIVs	fdivs	%f18, %f0, %f26
	.word 0xb550c000  ! 973: RDPR_TT	<illegal instruction>
	.word 0xb28d601f  ! 974: ANDcc_I	andcc 	%r21, 0x001f, %r25
	.word 0xbda4c820  ! 975: FADDs	fadds	%f19, %f0, %f30
	setx	0x7c5f1e490000bdde, %g1, %r10
	.word 0x819a8000  ! 980: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 32)
	mov	2, %r12
	.word 0xa1930000  ! 985: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb2b4c000  ! 986: SUBCcc_R	orncc 	%r19, %r0, %r25
	.word 0x83942099  ! 987: WRPR_TNPC_I	wrpr	%r16, 0x0099, %tnpc
	.word 0xb4c5c000  ! 988: ADDCcc_R	addccc 	%r23, %r0, %r26
	.word 0x8795209e  ! 990: WRPR_TT_I	wrpr	%r20, 0x009e, %tt
	.word 0xb7a58920  ! 992: FMULs	fmuls	%f22, %f0, %f27
	.word 0xb035606f  ! 995: SUBC_I	orn 	%r21, 0x006f, %r24
	.word 0xb13cb001  ! 996: SRAX_I	srax	%r18, 0x0001, %r24

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

	.xword	0x1c7744209d9fe37d
	.xword	0x497fa404668053a1
	.xword	0x776b59bad4bb770f
	.xword	0x19ae51491807b0e4
	.xword	0x7dc6c3d46db3594f
	.xword	0x7880aa4ff04d29b8
	.xword	0x7f46864020704556
	.xword	0xfedbb8b649a99477
	.xword	0xee6eee66ee784052
	.xword	0x3f071a76755af196
	.xword	0xf21a097d6a308d72
	.xword	0x52684d825f44ae54
	.xword	0x27561751a21ea236
	.xword	0xa7e515d29eb6c105
	.xword	0x48127901b290120c
	.xword	0xaaac754f7690d468
	.xword	0xaa82da9b83c8d6fc
	.xword	0x2f169a4061da671b
	.xword	0x32a5c11fe0748282
	.xword	0x87cc3852df7bae29
	.xword	0x7c7c26e9bb61005d
	.xword	0x624a869ba46997ac
	.xword	0xd52a5c489a64642f
	.xword	0x638ed2bf1ed8e146
	.xword	0x6c9ac3b352c6587a
	.xword	0x1cd0a631d0b93d40
	.xword	0xf35a462a0c1fc894
	.xword	0xa79b091cf78d3df4
	.xword	0x73a06cad7e0a389f
	.xword	0xa88b4a2352b945a4
	.xword	0x11bd1a3b0789ac22
	.xword	0x87a2ca7ff8907559
	.xword	0x559cec382b2cf013
	.xword	0xfb193987f1b870ec
	.xword	0xfe6c4fbf82333bda
	.xword	0xa3db48c2e15e5f15
	.xword	0xa5e80dacf18dff08
	.xword	0xfdb7ee27f3d60821
	.xword	0xc02899a3f8c08e4b
	.xword	0x5939dd41f9425a9d
	.xword	0xd12fc29a1d3fc9e8
	.xword	0x615079d9db8651e4
	.xword	0x3305e8c0b139f9ff
	.xword	0x593aa5c0c24a03b5
	.xword	0xbf852e97c968c90f
	.xword	0x5d5492a2518efb02
	.xword	0x1a6748a9ab69bcfd
	.xword	0x0411c60a5f86ca86
	.xword	0xb80a5d28cc16a031
	.xword	0xbb6eee20c43ad6b0
	.xword	0xe5475d8f517ac273
	.xword	0xb49c755b776cbbf8
	.xword	0xa4b4803e10d090d9
	.xword	0xebb782c77443802c
	.xword	0x7ff27e587047c74f
	.xword	0x4b2a87950277c154
	.xword	0x01e44cb1463c45b9
	.xword	0xd7602421d54b086c
	.xword	0xeffe5495ab5e5435
	.xword	0xc4c8296c6cc3b1c2
	.xword	0x1b4ca2249b29878e
	.xword	0x7023c20358b50598
	.xword	0xebea8e1252d6445e
	.xword	0x86c9327ba7a110d3
	.xword	0x1d2ec97c60f0ccc7
	.xword	0xb13fdd47ea169349
	.xword	0xa7a37ebb72dbd431
	.xword	0x37032cd7f39ac80d
	.xword	0xee650cd216f2d795
	.xword	0xc66499a639c75d41
	.xword	0x18dd4d53d6d7c495
	.xword	0x48ebcdc0ff9ae462
	.xword	0x0e3945f8a7697700
	.xword	0xecb0258456dae688
	.xword	0xb8d3c50723b17b68
	.xword	0x0c90074a2500a9bb
	.xword	0x80cec511cfe5b07b
	.xword	0x21e7ef23381051f4
	.xword	0xba1a5032d6f71993
	.xword	0xf0bb4d6cbeeb8fe5
	.xword	0x59dcf452f8aa876c
	.xword	0x6f66daeb9dfbe7bf
	.xword	0x97055582544bab5d
	.xword	0x4487a3895de9a292
	.xword	0xcfd93d15f466f528
	.xword	0x7d883eda54b9e271
	.xword	0x2ff73d5c53c75b53
	.xword	0x1667554521015c20
	.xword	0xa906ed57fcb886ca
	.xword	0xc28f9a435b83d266
	.xword	0xf27d647b24b217ba
	.xword	0x9316bbdd60d45476
	.xword	0xee6aac18fa7aa0cb
	.xword	0xbdfffba58ae028b8
	.xword	0x6a61a4727583e92b
	.xword	0xcbdc3098fce41462
	.xword	0xd92407f4ada9a95c
	.xword	0x5ac05f1a3b231cad
	.xword	0xa9ed8fa29a4b3ece
	.xword	0xfb42e169c4ec836f
	.xword	0x47e2216597b32c55
	.xword	0x7bb03380314c494b
	.xword	0x179dce160a5d9499
	.xword	0xd9c0cb55f12268f6
	.xword	0x5005af39b0c2bbec
	.xword	0x4a789eac7eb62c5e
	.xword	0x1c68431334ca0eb0
	.xword	0xfa5f2af4e45607e6
	.xword	0x757e30327ea41fc2
	.xword	0xea507f8150c77b4d
	.xword	0xff0b6ea6abca2cdf
	.xword	0xd7196f291847ea85
	.xword	0x04375de0610ffe7c
	.xword	0xa3309db2a58e6d45
	.xword	0x4d091f58d9ca0f35
	.xword	0xebe4dbd170ea987b
	.xword	0x88d9fe9aa32f1063
	.xword	0xb59ed73d9c477e6f
	.xword	0x5a6b4a77537d58ce
	.xword	0xff04de8d5e8e70a2
	.xword	0xc283d80528f632e7
	.xword	0xb9019255da086e33
	.xword	0x5dd41eb78732ee9b
	.xword	0x791ae904f727a722
	.xword	0xe1297e1a7a82762c
	.xword	0x7bf001559324d67a
	.xword	0xdc318db512b58dd3
	.xword	0x21e0dbbf6f4fc332
	.xword	0x77100aff506b6357
	.xword	0xbbb3bcd477d1ae79
	.xword	0x83d169cb19b8cc34
	.xword	0xa196cb5e3f0328ca
	.xword	0xfeeac92d099082ed
	.xword	0x070d6bb031c2bc6b
	.xword	0x0d271d312ad056ec
	.xword	0xdf5b10b7d02597b4
	.xword	0xa0096808508d97a0
	.xword	0xa52a233280d40b70
	.xword	0x4c759881a518d8b3
	.xword	0xde4c9a43ae760cec
	.xword	0xdc9b8f0c09d1d936
	.xword	0xe3f6be99d6a9d424
	.xword	0xf928fd5ae20bd930
	.xword	0x7400eb457ae0710a
	.xword	0xed78a1857a0dd744
	.xword	0x13a98ddecf2257bb
	.xword	0xb862b22a9837ce88
	.xword	0x1a2e1352d2f31743
	.xword	0xc72886ef86003700
	.xword	0x8853a2e802f7024b
	.xword	0x15c24d0062ced1f4
	.xword	0x97abd728a584fdd4
	.xword	0x945222f595a3e31a
	.xword	0x763f9cc933c8c356
	.xword	0xfb92dd46f14b7c7d
	.xword	0x00baec8b0c3561ab
	.xword	0xec9c57aedfd593ea
	.xword	0x1f8d69d4e69b3903
	.xword	0x785746ddb645fdc3
	.xword	0xe130efaa0c2c987d
	.xword	0x75b2565c60c4bcc7
	.xword	0x1d9957dd878ea78f
	.xword	0x932c1bb59e70c266
	.xword	0x1468256495632ffb
	.xword	0x89d96ceb3b304a22
	.xword	0x182774aadbd9c03d
	.xword	0x44e5eb28787dedc0
	.xword	0x606f25605dde8afa
	.xword	0x43135c53dad46714
	.xword	0x4ef2b2c34adda6ed
	.xword	0x32860c682a7b635b
	.xword	0xa70308dd3f32f532
	.xword	0xe7144c58f02a152b
	.xword	0x6743176b416973ff
	.xword	0x934d488358ed34b3
	.xword	0xbe1d88ee3be35c0d
	.xword	0x4b0ebdaaf1b8292e
	.xword	0x283c5ae961219b17
	.xword	0x8aad10077375f853
	.xword	0xfbe6bf5a39f89d03
	.xword	0x3ff918d83edcfac9
	.xword	0x5d829e377299ec8f
	.xword	0xa145514728272ea4
	.xword	0x6930d12213ed4ba1
	.xword	0x23885c3789e775ae
	.xword	0x028c6554116dbc6d
	.xword	0xf0d9fc9acd76a90a
	.xword	0x41789c47f05796d4
	.xword	0x0d4c54e8fd1eb9a6
	.xword	0x87f71fff428721e6
	.xword	0x88cbb024e85d9a52
	.xword	0x65cc252021623ff8
	.xword	0x9f54a86c8ed2b026
	.xword	0x18ec810ae220691d
	.xword	0xba3a6e49cbb20948
	.xword	0x0d736c0ff2a14832
	.xword	0x8d91146a55c86694
	.xword	0x52bce48e4fb8490b
	.xword	0x8ca577e5e63853c7
	.xword	0x7dcd97d191fb213e
	.xword	0x8b4c45d49569ded3
	.xword	0x6fdaec8c8af0154f
	.xword	0xc28fe9cd5c39f1eb
	.xword	0x2dbf580e1e5e552f
	.xword	0xd2e59e68c13ed5f6
	.xword	0x665830bdd61063d3
	.xword	0x64950871c228abec
	.xword	0x1b5667d703227b02
	.xword	0xb477f653513c0f64
	.xword	0xa53bf3e13ee47c40
	.xword	0xe5d63495f8f45303
	.xword	0x53b9ac53f8fb9912
	.xword	0xcdd11a1f23f6935b
	.xword	0xa51dd76918240f60
	.xword	0xc8e04a6f6ece6db6
	.xword	0x30dbce264680d10f
	.xword	0xcad7382e93eaba66
	.xword	0xb6ba9d801caf40e5
	.xword	0x1b3969190525c493
	.xword	0xa4a58410a563ce1a
	.xword	0xd3823ad36bb75c46
	.xword	0x5afcd945d733e42b
	.xword	0xa5082886652a2da0
	.xword	0x5f7bc37f5fa63220
	.xword	0xc1c4df39c37264a3
	.xword	0x6ea8d5f9817a8c19
	.xword	0x82154f4f2bff7767
	.xword	0x5cd459f101ffcb93
	.xword	0xdcddeefd6973dcff
	.xword	0xd300436f88a4bbd7
	.xword	0x7fb20c8545ec3822
	.xword	0xb0f684585a25872b
	.xword	0x4f62c4b5351eb8c9
	.xword	0x6db8412582e99654
	.xword	0xca0da0bf63059d3c
	.xword	0x26cb5672fd57c8fd
	.xword	0x0a00db308fb3b138
	.xword	0xa6d5d9b27ebe3539
	.xword	0x10d1d1e2590ef8de
	.xword	0x7f2d0aba11175c7a
	.xword	0x1c8b099ef1c964c1
	.xword	0x1bf8577e9dc36903
	.xword	0x0b6e993e390181e4
	.xword	0xc620fa0502181c51
	.xword	0x8d9cdfafa061269d
	.xword	0xded87f05f0d8a048
	.xword	0x87977facb64bb4ed
	.xword	0xe53848e030cc5c0b
	.xword	0x55092924f0afe366
	.xword	0xaada417dcee6bc8a
	.xword	0x6729dfc446aa2df2
	.xword	0xcc78d806ba8c0e0d
	.xword	0xedda2ece150747e3
	.xword	0x47868b01a686444c
	.xword	0x047e80a29e11624f
	.xword	0x75ed0c3b6bba71db
	.align 0x2000
	.data
data_start_1:

	.xword	0xffa2405e93913864
	.xword	0x70f1946c67e19b59
	.xword	0xd31bdd2c0d3c9e4b
	.xword	0x4f60fb46492c259c
	.xword	0x13314621b1ab2843
	.xword	0xbeeb02ee25dcbcbc
	.xword	0xb42556d9ffc9b0e2
	.xword	0x9774a2d28d2fb0ab
	.xword	0xe5d5c62b7e628e28
	.xword	0x92aca60c6ae6a9eb
	.xword	0xc945b95c795750b3
	.xword	0xb9e74148f2cf0b4d
	.xword	0xbece649829acd02e
	.xword	0xf32cf85429e0e7a4
	.xword	0xfc888c785908759d
	.xword	0xda6d284cb6376f1e
	.xword	0xb5eee06ae05dff6e
	.xword	0xd16f1a063433e86e
	.xword	0x7b39a70b1f9b18c8
	.xword	0xe4c45cd77f6d0808
	.xword	0x624f61b275700ddf
	.xword	0x24e45322ac1055eb
	.xword	0x85a8202d6f3658fe
	.xword	0x29d0d4fac233c535
	.xword	0x0b7fda7c80e8f9f3
	.xword	0x436fb57a31944f3d
	.xword	0xe3c6f97a72aab62e
	.xword	0x6a2ef206c8ff61de
	.xword	0x1298f9b38d640d19
	.xword	0xd21ee521140ae624
	.xword	0xcfda4ca6f5be3520
	.xword	0xac848eac748f3604
	.xword	0x3bd0b696ad6236d8
	.xword	0x3c62920ab523ebcc
	.xword	0xf89080be2704711c
	.xword	0x6085f1e317fde7eb
	.xword	0xbf1992341bfb5e70
	.xword	0xf1a039900f1bf1f0
	.xword	0xfd1420be9d0754d1
	.xword	0x8da45f70a53276f9
	.xword	0x4fa2af23f08ab650
	.xword	0xc31aa846d0df8e91
	.xword	0x143873c3c28ddd7a
	.xword	0xecc2abaa61812d5b
	.xword	0x7bdd6bf130f63c2a
	.xword	0xcfc8991cd7adf9ce
	.xword	0x219fb5afdf7ed650
	.xword	0xa466bc1b5c6a5a18
	.xword	0xbfca5cd2ca7c74ff
	.xword	0xe9acf6091df3bafa
	.xword	0x978bd7cdda934f31
	.xword	0x9a6378c05618460d
	.xword	0x971ed7c5b01c6e61
	.xword	0x055f5f6380599689
	.xword	0x0d8394372c9f7805
	.xword	0xbdc64e7dda0e5584
	.xword	0x5127c9f2d3f3f448
	.xword	0x603965cd266aea08
	.xword	0x725fc08654adf7e0
	.xword	0x5990bc16c38e636e
	.xword	0x1666624a7a6f93b8
	.xword	0x34d3a8d58f626d08
	.xword	0x01929858563b440f
	.xword	0x2a907a2c039fbb0b
	.xword	0xd055a20eeca50256
	.xword	0xf40df0b969872677
	.xword	0x85ac4b215b80c563
	.xword	0x8db5608a10d41cad
	.xword	0xdaa271a69d355a56
	.xword	0x06ca7d7f7a7010ab
	.xword	0xe2543986e9a29938
	.xword	0x1d47d16aa1dc49e2
	.xword	0xd508ce879a4b3535
	.xword	0x0956fda4df0fa8be
	.xword	0x8ac76728b84e66d9
	.xword	0x613d48d705d3bb45
	.xword	0xc665cceb3bcb409f
	.xword	0x46bfb95561d9b767
	.xword	0xf16cfcfd0ef13524
	.xword	0xdb12801042051f59
	.xword	0xc3d84d54221171de
	.xword	0x4dca030bfd8799fe
	.xword	0xafb687b0b53687bb
	.xword	0xc865a18be16262ad
	.xword	0x5529e5d74d2464a0
	.xword	0x66026411b45b9138
	.xword	0x83074199f15e1b33
	.xword	0xfc20d089d40e3469
	.xword	0xbc3abf0ea636e756
	.xword	0x7a9a7c55670ccaf7
	.xword	0xfb36474e9d14016f
	.xword	0x004984dfc13272fc
	.xword	0xf7ffab1e00ca7de9
	.xword	0xb7466df9073e4222
	.xword	0xa768fe750821717c
	.xword	0x7712bc7d55f99360
	.xword	0x2e3a8d558b9e7e1e
	.xword	0x35a0f83b3779618f
	.xword	0x17d599c55e82cdcf
	.xword	0xc9395a9ca1f360b9
	.xword	0x17fd285ecda6d0f1
	.xword	0x252e9e580d1ed513
	.xword	0x268ed0b1d942a7d7
	.xword	0x275ddf39ddac3033
	.xword	0x7b79c50af5bcefec
	.xword	0xa6d779b95b237a00
	.xword	0x49bb721d8c1b4521
	.xword	0xb8f4633623250ce5
	.xword	0xa022f47e7f7a1e43
	.xword	0xb4c648e7ba0d2163
	.xword	0x1fcde1f2263102de
	.xword	0xc55a8791dfbf53bc
	.xword	0xdb471518c7c15731
	.xword	0x0be92787900a6064
	.xword	0x53922ee08d81019c
	.xword	0x7c224e6d70247140
	.xword	0x28483c1d0b4615ff
	.xword	0x3d7248b78d28c841
	.xword	0xda0fc70edbd3edd2
	.xword	0x49a4d25db5b6351d
	.xword	0xf53d414b956d39a8
	.xword	0x96f7a8a4cddc3acc
	.xword	0x28b8cd289d6979a1
	.xword	0x031f47a4e9a89180
	.xword	0x6cc831039d5a88db
	.xword	0xe49e0a42c5821b2a
	.xword	0x98072d5ba8ded45c
	.xword	0xb72273c25f4fb014
	.xword	0x0a096f48680ba783
	.xword	0x2df622ce3bceef72
	.xword	0x82c3d46d35e5296f
	.xword	0x72880b241117c6f2
	.xword	0x5726eca611bbc0da
	.xword	0x131133c7160b3131
	.xword	0x5a31adf605039eac
	.xword	0x50abdb4b9539e72d
	.xword	0x60e35d21f0996a2f
	.xword	0xdd3509e524dbc910
	.xword	0x7efad27b6a02c8f2
	.xword	0x7f3a6849618e1a2c
	.xword	0x8eb045e04bbe65a3
	.xword	0xf10ce3767cc8f18b
	.xword	0xe7990794f11258af
	.xword	0x5ec4f9f9b57a1095
	.xword	0xd0faf7c45fa1c43c
	.xword	0xc76569ea47176365
	.xword	0x1d365d92c6a6a670
	.xword	0xc4acc55f4a8474d9
	.xword	0x88449e25acdc1181
	.xword	0xd646a0d7094421d5
	.xword	0x01239d1631e8a9cc
	.xword	0xf5a6a69e452637a5
	.xword	0x9ab2c0c139863a93
	.xword	0xf1c622296385fd16
	.xword	0xa8b4afd91a945ccd
	.xword	0x79122e7ef6c569b3
	.xword	0xfe4a79512825f221
	.xword	0xc3fcf861bc8d6a1b
	.xword	0x4c71185560fc2b67
	.xword	0x5c23e093800b0a04
	.xword	0x5f230b74db96f8f5
	.xword	0xc085c989a428e704
	.xword	0xc41d52a876798900
	.xword	0x6921906b39844c6a
	.xword	0x208b1e948f6a089c
	.xword	0xb6c599c2378c0df2
	.xword	0x3dff9e85c5322c8d
	.xword	0xdacd5cd224d73d17
	.xword	0xbedaece33944d050
	.xword	0x6646ed4cc81dd898
	.xword	0xff58fa916f84284b
	.xword	0xfecb76aa23b8615b
	.xword	0xfd6bab60a3dc6730
	.xword	0xf2152d2052918221
	.xword	0xc213c08327f29ea7
	.xword	0x5b287dfb20db37c4
	.xword	0xa91c544439d67cd7
	.xword	0x4c37b221f59e8ad3
	.xword	0x4c304ed56294a67a
	.xword	0x2fb3797897f44bdc
	.xword	0xbedde674764cacfd
	.xword	0x391a87032738e51f
	.xword	0xa9f499c64d6a72f9
	.xword	0xb58f7387e5842d34
	.xword	0x8d34d6b671ea1223
	.xword	0x8e335daee4f92767
	.xword	0x640362ec91444ec6
	.xword	0xba96e5bf147db60a
	.xword	0x6de01e2f0daf3327
	.xword	0x3fbe63b557f7b9af
	.xword	0xb5ba18a8ddc47542
	.xword	0xec488633e5d1fa7c
	.xword	0x7201b4e272511cd3
	.xword	0xf81caf5b327bbdfa
	.xword	0x3b66d9a909f17511
	.xword	0x490ee2efcf06bd43
	.xword	0x69da2cd6b20310c6
	.xword	0x2cdf34fff390882d
	.xword	0x5743e17575e2b374
	.xword	0x74c319810c2d0b98
	.xword	0xeb16edd672e8298a
	.xword	0xe6bc00c7d490a735
	.xword	0xc51892d898988daa
	.xword	0x1031f3ee3292bce5
	.xword	0xd27e5cb64e7ada5a
	.xword	0xed1bd6a32414a008
	.xword	0x6b84813b0d18e03d
	.xword	0x1d9687c719901d0d
	.xword	0x8e96d9cc9989a5f5
	.xword	0x0ef7cc65b369d572
	.xword	0x98d2c9e8b057384c
	.xword	0xa4f95468f8240435
	.xword	0x752e945b454da02a
	.xword	0x54f5f260af93193f
	.xword	0x55ae82588ca88abd
	.xword	0x7a9ba58e546680e0
	.xword	0x4b64fa47a33dfbbb
	.xword	0x9e594b39398d015a
	.xword	0x55d5b411976821e0
	.xword	0x9c4fd44420f53a4c
	.xword	0xedfb7377e918ff44
	.xword	0xb7b6cdc0a5f570ad
	.xword	0xe40323dba25ab6b4
	.xword	0xa531d3ec9976e639
	.xword	0x22000928098cd302
	.xword	0x2fa03f91847909b6
	.xword	0x31242c91c3f09986
	.xword	0xe7aed001d3d0b440
	.xword	0x47c081954129d1cb
	.xword	0x55fce7c8044f72ff
	.xword	0x6017e94ffbbfb3a2
	.xword	0x19522148a5949c8e
	.xword	0xac02900416451fdd
	.xword	0x23fab73175d0efed
	.xword	0x42676a58840c19ea
	.xword	0xb25f01bc7aa6cd8b
	.xword	0x42a12d36cce51289
	.xword	0x4510a574fbd723d6
	.xword	0xfbbef220a24922a6
	.xword	0x554d248579bcfc80
	.xword	0xe81fc4124b703485
	.xword	0xf2374c57ab3746fc
	.xword	0xf910ab272466f81c
	.xword	0xd223484968256f3a
	.xword	0x0af18effb4a5ef1c
	.xword	0x71c1a23b7f48f7b0
	.xword	0x0447be869df82304
	.xword	0x006156a41eef1cfb
	.xword	0xa98b6c1b32f3eabb
	.xword	0x4d832b8def92aa3b
	.xword	0x27dca542629d41c1
	.xword	0x06b519c9ec9f3c0b
	.xword	0xb8619b03710040a3
	.xword	0xb168ddc1a43753b6
	.xword	0x610a222d42898e83
	.xword	0x9c39e98dc44ea13a
	.align 0x4000
	.data
data_start_2:

	.xword	0x21dc8148dc8b5065
	.xword	0x9468738f57b360a0
	.xword	0xc88f8c9abb1938fb
	.xword	0x4fde34356b7c9d19
	.xword	0xa91e79f96f9b7819
	.xword	0xd63910d902b5dbe9
	.xword	0x91dcb3a794ec06e1
	.xword	0x420a5b5fa7679f1b
	.xword	0x62fcfaed80ccfb2c
	.xword	0x4da3a48efb0eede7
	.xword	0x4d70cf24b33cd243
	.xword	0x1aa2ee71051f248e
	.xword	0x7195530002c11f56
	.xword	0xfb5a94d07eb3c43f
	.xword	0x87cb43272255d3a7
	.xword	0x87e4ffbfb580532a
	.xword	0xf9e6a23c5ae72b4a
	.xword	0x1625a910b85ab63e
	.xword	0x61cac0df22ffc873
	.xword	0xe3fd3ccccbc5fcf0
	.xword	0xc7b0b9c8f33c91af
	.xword	0x6e1ada52957e2c6f
	.xword	0x89772eb94a983116
	.xword	0xadce58524fbb6e56
	.xword	0x7d5c45b782abcda6
	.xword	0x818a6a5e9cf2676b
	.xword	0x7e3718f46a914dc1
	.xword	0xefb6648dc3aa8f6b
	.xword	0x260ae1d2040dbe62
	.xword	0x49f6552296f2fb00
	.xword	0x9dbe6a0ac21a7ddc
	.xword	0x4546099dddce63b8
	.xword	0xea0857a474025ab8
	.xword	0x1da3b6a61efb5114
	.xword	0xaedbc4333e4d22d4
	.xword	0x51922cbe93c371e9
	.xword	0x9c7533ab80ca568b
	.xword	0xf07cb63efe01d424
	.xword	0xc71419a4487aad85
	.xword	0xa784a799f0464e4b
	.xword	0x6dbec26d934a41ff
	.xword	0xfb1c61165d9f4424
	.xword	0x826cc8fa9ae10d67
	.xword	0x9a341892203ccee5
	.xword	0x523e0857b7edb57d
	.xword	0xf997ca22af19920f
	.xword	0x996541d47c45345e
	.xword	0x4450fa0b1febebfd
	.xword	0xdc957b3e92f4713c
	.xword	0x06ed053a5524a17c
	.xword	0xf558ca9fc2920b1d
	.xword	0x739c1c00a66c760d
	.xword	0x47ce9f6dc010708f
	.xword	0x1983d7adcb1f1b9a
	.xword	0xedf07ef94be6306f
	.xword	0xe6f0c0cb56dce6f1
	.xword	0x88584f82f22afa9b
	.xword	0x0784921037bdeea5
	.xword	0x52e168da9382475e
	.xword	0x74081b66dfa2d1e5
	.xword	0x02b47215b1a664a7
	.xword	0x47dd0b2bd8846fa6
	.xword	0x79eb72a160572332
	.xword	0x493b85194182573d
	.xword	0x72f16ab3a8f26731
	.xword	0xf499ff7fb47cda63
	.xword	0x925e227d01789f62
	.xword	0x8af5fc99cf32d9a1
	.xword	0x1f359004d6b0cae8
	.xword	0x9be3165bc48d113b
	.xword	0x741dac29db148025
	.xword	0xa66bc98da4888a1f
	.xword	0x0b06c36159e275e3
	.xword	0x16e3eaf199ee57bf
	.xword	0x48cba9e099ba6326
	.xword	0x599536917959c111
	.xword	0x442176f34eb421e6
	.xword	0x5cb2326a53f0bb78
	.xword	0x606653b36d5de95d
	.xword	0x60f4db8388c4bed4
	.xword	0x9f2dc64d414911e8
	.xword	0xba1a3864f99e3dba
	.xword	0x86b3383693c973fa
	.xword	0xc6df868f8c99f261
	.xword	0x97dd89f866eeb17d
	.xword	0x4a996eb5e444a9c2
	.xword	0xc0caad60c7eb3548
	.xword	0x8938196c250169b0
	.xword	0x63e1363c06576621
	.xword	0x459f0064d181639d
	.xword	0x9ea4319161b8952e
	.xword	0x7672584fc633014e
	.xword	0xa7868cbfb15abcff
	.xword	0xba6179960e237783
	.xword	0xe0cc6aa48d67a308
	.xword	0x83450039eb5cbad2
	.xword	0x23cdeb0b779f05bd
	.xword	0x69f1849d0645861a
	.xword	0x1b8066a684e5190d
	.xword	0x6ad616f30139567a
	.xword	0x2dbbb2fd1ceb7e9f
	.xword	0xcdce6c6061369a0b
	.xword	0x60818f43a3a21026
	.xword	0x7afb50d24c741294
	.xword	0x0ee7b6e126667eeb
	.xword	0xc679f3efc74e9043
	.xword	0x6e789beb55f003dd
	.xword	0xc6fe7178e49564e2
	.xword	0x7acb3409fd5ac446
	.xword	0x64cc35e315101b96
	.xword	0x37dcd8a104245cbc
	.xword	0x226f4feef6090890
	.xword	0xdd33e9044d3dc5d2
	.xword	0xddfd24c02d7846f4
	.xword	0x58686cb237f868f8
	.xword	0xd4aed383bf5e90c2
	.xword	0x318096eec615b642
	.xword	0x36c8f4de7202c485
	.xword	0xb724dfd32479d317
	.xword	0xacff773c52575f03
	.xword	0x68d3e95afe3e9b30
	.xword	0xe1b07228adefb604
	.xword	0x16a859fa1e966cf3
	.xword	0xd2bb9779d3b16964
	.xword	0xac205304333e8293
	.xword	0x22f258e8937bf029
	.xword	0x29047f3bb7245c0f
	.xword	0x01d997a1157e54af
	.xword	0xe0a0632f4d2dec82
	.xword	0x8de6b526418f0042
	.xword	0x9199db760314e022
	.xword	0x17ef49a5aa15341d
	.xword	0x58d9710d8bddbaa0
	.xword	0x51dc6ef3f47efa16
	.xword	0xd06eec49c7fb4c6a
	.xword	0xdf64a141ab0a3ef8
	.xword	0xb72f9befa43bd3b9
	.xword	0x827900f5ad569b85
	.xword	0xbe52551df3bcdaaa
	.xword	0xd9eb2a3a5c13af8b
	.xword	0x3927ee9acdba890b
	.xword	0x7034e7d695352778
	.xword	0x4c81eb0e85d6e261
	.xword	0x9b8671147d101a62
	.xword	0x73e9a7e50dcc7dc9
	.xword	0x617b895834947b01
	.xword	0xdaebb99344c3b6c0
	.xword	0xdf18da0178a50d4b
	.xword	0xacd1528a56e61425
	.xword	0x29c4b43d02d90c7d
	.xword	0xa9f2e4827b5aa862
	.xword	0x61e6c78c2567f60c
	.xword	0x79788dff3119257a
	.xword	0xe38125150c72d912
	.xword	0x36ea40ef51a0f33f
	.xword	0xd57a3c17bbadb8fc
	.xword	0xcca757067fa3116c
	.xword	0x1c9d88efe1e381c6
	.xword	0x20514535f09fde7f
	.xword	0x6236157d3915e207
	.xword	0x445f7bb66048501a
	.xword	0x8fbf51b484426d24
	.xword	0xa6223c815b8f7642
	.xword	0xff88f07455c7018b
	.xword	0xeb7871c0ceb2ee8d
	.xword	0xee47228ea71673df
	.xword	0xec020a1ad8ef4a22
	.xword	0xf5631b51a9d0fa01
	.xword	0x78734ad07eabbd96
	.xword	0x018020f14ad93b2b
	.xword	0xb49ade61b105dc6c
	.xword	0xbaf005a5f04220ec
	.xword	0xce22e14a52c1c482
	.xword	0x98a2ed7548ab1aeb
	.xword	0xb060b9165c954a20
	.xword	0xd9092b3b1a3c6aa2
	.xword	0x6abc1d69c317c05e
	.xword	0x27b087eca04b0ef1
	.xword	0x87442602d6abb67f
	.xword	0x379d96f4ad0a2016
	.xword	0xdb13e4d6d6afcbfc
	.xword	0xee308583d3addd18
	.xword	0x3a129c0018fd19e5
	.xword	0x10202deafd6fb189
	.xword	0x0199215be1117dd2
	.xword	0xda865449dae8ed60
	.xword	0x232342b596ba7701
	.xword	0x5f1499570afe6063
	.xword	0x34b5b0d88939c540
	.xword	0x5575896435e7dbaf
	.xword	0xfa7060ca603b2ac1
	.xword	0x44a228be52cd095f
	.xword	0x2be860e42ddff313
	.xword	0xad7f4268aac369d6
	.xword	0x78e900d502a0b140
	.xword	0x8bed4b292324b331
	.xword	0x846f40d1b101fbdb
	.xword	0x852694494ada93ac
	.xword	0x9b6c3f1d92fd0d74
	.xword	0x42b60c096e14943e
	.xword	0xb558db96fe810b83
	.xword	0x9f800062776a07d4
	.xword	0x2a9fe695c20d72d6
	.xword	0x68f79d4d24eb03e3
	.xword	0x43bb6f419d87862d
	.xword	0x81ceacf288f183d0
	.xword	0xa60e1aa2cca4b933
	.xword	0x1885f61118949b33
	.xword	0x36f617dfbb9b0893
	.xword	0x9bee3248ca794ef0
	.xword	0x6fe59c5fca419301
	.xword	0x31e1de10bde67b19
	.xword	0x37b2536a0e93f2a3
	.xword	0x4725e83a99dc8a54
	.xword	0xbe5d5cbaadfe4377
	.xword	0x1a8a08686095c63b
	.xword	0xed7514f6e547921f
	.xword	0xd97a6f62e310d592
	.xword	0x6991fd9b408bc204
	.xword	0x0236bcf460a77d82
	.xword	0xc21e4b03865bc202
	.xword	0x4fbb6a13a5a00882
	.xword	0xead2c0039c38bf84
	.xword	0x3dc57e31370a8ea6
	.xword	0xd374fd3492a33e36
	.xword	0x937ef8a04350b9be
	.xword	0x397a381dd6207bd8
	.xword	0xe01f380d711e52f8
	.xword	0xb5dadd6a7549a392
	.xword	0xebb5e032b40e5579
	.xword	0x5771667eef64366d
	.xword	0x3bdffd6ca3474914
	.xword	0x64f5dea3e6e23a36
	.xword	0x3806e774fa733a97
	.xword	0x8eea17924f1bca97
	.xword	0xaec0971ee2683538
	.xword	0x834f73731346c8dc
	.xword	0x67d0badb09bfbc08
	.xword	0xcb2a2df055bb8cfe
	.xword	0x44b6bb5d6ed970e1
	.xword	0x36803704ef57e195
	.xword	0xf919e3001a4f15ce
	.xword	0x7a63c42f2ba982ef
	.xword	0xf3f2ead5d20c1230
	.xword	0x6ee4e022091525d5
	.xword	0x1324561fd6e30612
	.xword	0x6a5ac9f0886e24b7
	.xword	0xc1ee4a53b5e4db19
	.xword	0x1d6744c83d72dbdc
	.xword	0x1147f55a25bcc22c
	.xword	0x13cea814b6b2f2c9
	.xword	0x7cb097a1edfa0af3
	.xword	0x0ae99772eaafe314
	.xword	0xc4b491167bfc67da
	.xword	0x59c662a851dd31fe
	.xword	0x26bf2eed83fb2929
	.align 0x8000
	.data
data_start_3:

	.xword	0x2a35be4cda997e7c
	.xword	0x531ab92b598d799e
	.xword	0x3bcf18a4efea2230
	.xword	0x566a4b719ade04d8
	.xword	0xba16dbeb3243a65d
	.xword	0x7907d6beed9bee93
	.xword	0x8a1d6fe63537ab8c
	.xword	0x63873f473e863c87
	.xword	0xd9b9873ea0931d85
	.xword	0x1c89097f7a3d1101
	.xword	0x0d653ab3c6e2ae62
	.xword	0x9b601badf2ccf978
	.xword	0x94c8f468253c8f9c
	.xword	0x4ab81f419d88e3a1
	.xword	0xa2972e32113731e0
	.xword	0x04578c1ff8539650
	.xword	0xd1928bf85650f7fa
	.xword	0x808a5c38ab8f0569
	.xword	0xbc5032326117c30d
	.xword	0xd60e6a4670541ebb
	.xword	0x4ee337279d7259b3
	.xword	0xf93478b217d2a719
	.xword	0x6dc9442b0ae73e17
	.xword	0xa2adec1124bfc3dc
	.xword	0x695d95d2305c0081
	.xword	0x1ad5e1bb7b3698de
	.xword	0xebaaeaae9a07d6d4
	.xword	0x9a2544741db6fbad
	.xword	0x289f3dfdda305cf9
	.xword	0x8735d96766243136
	.xword	0x90c2aaf06fa140cd
	.xword	0x326a71b3d75fccef
	.xword	0x19b2e90c811390a8
	.xword	0xb0e29b03df4258d8
	.xword	0x0e92ecf9729e2ff8
	.xword	0x366bfc1537fe5100
	.xword	0x8cc48170ab2d8e8e
	.xword	0x3fed0a4da83b8600
	.xword	0x0509a1fdc52d190b
	.xword	0x62ba171d387fcfb0
	.xword	0x0d7c629befc11c5d
	.xword	0x2db5668341332adc
	.xword	0x2a05b07f2642b80a
	.xword	0x1b384c1ee389a14c
	.xword	0x13420a3b3a9e2cf4
	.xword	0xa8569e02212897ab
	.xword	0x99c071e260499a5d
	.xword	0x32cc189b856395da
	.xword	0x732538b78e5a596c
	.xword	0xbd13dda7453645d5
	.xword	0xa85f9a10c6592eb1
	.xword	0x9db1dfef153fc952
	.xword	0xece08b211f18ed7a
	.xword	0xbd86f3b0c619ca0d
	.xword	0x2b2b22d74ec9d2ed
	.xword	0x668b3752e4328311
	.xword	0x9562dd2bd9c6e658
	.xword	0xc2846ecc2964455b
	.xword	0x8fc1c53cd9875ffc
	.xword	0xc2c9ce7931de58b3
	.xword	0x48594bece5e37ec9
	.xword	0x876596386ed00765
	.xword	0x6f3254c53deebdfc
	.xword	0x60e8cfc8f4c229ab
	.xword	0x4f589339f862eefa
	.xword	0xfcbe8acaf7b2364b
	.xword	0xec076643f50563bf
	.xword	0x1ecf82a0bd57f105
	.xword	0x41a7fea825162662
	.xword	0xb106d15a8ed2d6a7
	.xword	0x9f9160bd6f9b1b4d
	.xword	0xcb864298c9f43592
	.xword	0x9fe5f203997da476
	.xword	0xdcf568cecfd1dbd7
	.xword	0x80a3bfc995a32942
	.xword	0x7e34d4fd74712149
	.xword	0xbe4689f687d5c245
	.xword	0x30c4e6d2afe756d6
	.xword	0xccf6508adcea7c78
	.xword	0x2a2fd711b9e019d2
	.xword	0xca6976b4b2c7b6db
	.xword	0x6a3b71633c0f9d5b
	.xword	0x891d3a66d594bc44
	.xword	0x9a18dc37ed9e5c90
	.xword	0xa5b87b87409d9165
	.xword	0x6e86d89928a28834
	.xword	0x77208f4493606fbc
	.xword	0x9d2ddf7e5a3ebece
	.xword	0x962d3b46ee8854dd
	.xword	0x7c7b8994b817144a
	.xword	0x51c208778da545c4
	.xword	0x9265d5f0cb321b91
	.xword	0x2bf049b9d6c3f5a9
	.xword	0x48e6e3004a258cf9
	.xword	0xbe52bca0ede8b386
	.xword	0x7eb961d01bdd7978
	.xword	0xf296519607915291
	.xword	0xdb279cc198cf362e
	.xword	0x017259203a6966a5
	.xword	0x52ae53a56c522552
	.xword	0xc2b73136b84c22dd
	.xword	0x055dbd085c99d878
	.xword	0xdbf00d42465e7ad6
	.xword	0xf5f8e577e9e0440f
	.xword	0xa6ed21056220b573
	.xword	0xb51149dbb0bf5ddf
	.xword	0xaef15a0b053c95bb
	.xword	0x981c44ee676d056c
	.xword	0x03dd64cfa8779d33
	.xword	0x3b2c9aef91bdeb11
	.xword	0xe36ef613be284121
	.xword	0xb3bea3f4be01681b
	.xword	0x88fdc18a28c31055
	.xword	0x7d4ce1eec6f27039
	.xword	0x76bbcea8bcfa8121
	.xword	0xba9ff29ffb16c44a
	.xword	0x775bf29aab1ac7eb
	.xword	0x0f51d72dd87d6d8d
	.xword	0xe529ce35789f0ce5
	.xword	0x534a735977c24ef7
	.xword	0xdc18baaa5febe1a1
	.xword	0x65e87071c7c177f7
	.xword	0xeb60d8ba5a7cdc1c
	.xword	0x46eb8a8af743d176
	.xword	0x6dbf46d65f94d248
	.xword	0xe3abe9b899864036
	.xword	0x6e4401632af669fe
	.xword	0xa2f29ddf20f4463a
	.xword	0xf94f8c252cd16ecd
	.xword	0x32a1100e58089a5b
	.xword	0x55bdb22e78762db1
	.xword	0x3b179ed9f976857d
	.xword	0x5d82db9600e0020e
	.xword	0xb5238f79babbe394
	.xword	0x12bc1bb6212b971a
	.xword	0x14d80ae22ca6ec9a
	.xword	0x1b1042ba9307d5fa
	.xword	0x94e0e3a76ab82982
	.xword	0x040e54aabe1a7ff7
	.xword	0x250a40431d380ec6
	.xword	0x65225a5b2d2e63e1
	.xword	0xc85c2a162cc944dc
	.xword	0x6eb449eec9b0ab77
	.xword	0x83b591b3f26c9353
	.xword	0x8da8ea512154470b
	.xword	0x9f5414942a697b3d
	.xword	0xda72445f12893b52
	.xword	0x5aad3943296cd696
	.xword	0xe1bfa043ad907a39
	.xword	0xfd1eb81a89f3fe77
	.xword	0x7416e2a817a095bd
	.xword	0xad73309f4d9262af
	.xword	0x5bda00b274d2a275
	.xword	0x1917ce6bcffbf01f
	.xword	0xb0a8df928f8ebf42
	.xword	0x24c3ddb62bbdeb7a
	.xword	0x31e4e99650826e92
	.xword	0x554f3b50ad2189a4
	.xword	0x01ebac2643f73d41
	.xword	0x8ebeeb0ecca634e7
	.xword	0xbc4fb624dde2bb39
	.xword	0xaaffaa15f6a3f68c
	.xword	0xd5b32430857ece94
	.xword	0xaaae357de53c711a
	.xword	0xee3e16fd92fae5d6
	.xword	0x14f2ba087939556d
	.xword	0xa847b9344846df16
	.xword	0xbb7c6dd8aa9c6baf
	.xword	0xd133591793339659
	.xword	0xe4809af0219acbc4
	.xword	0x775209ddfff40861
	.xword	0xf6b6a8a085604d94
	.xword	0x4f214ca17b2bb83b
	.xword	0x597b3659b43ca648
	.xword	0xfecdab224bb7f25e
	.xword	0x9f117df0d3bf83e2
	.xword	0x2c2eeaeacbf8d567
	.xword	0x62291b16c83fd8fa
	.xword	0x26bcecb44c154f07
	.xword	0x9c1e51b90dd5f0ef
	.xword	0x7e02a2db69d9f881
	.xword	0x1730d880fe11baa4
	.xword	0xac9ba1534f8e8966
	.xword	0x48f70a7352e3d212
	.xword	0x0f288a76f7dd4a7f
	.xword	0x1b95c62efbe6ff0c
	.xword	0x87207dc2cec496e6
	.xword	0xd4a10583f21050dd
	.xword	0x8f3290ca93d2add0
	.xword	0x78b804c44c6e60e9
	.xword	0x44bf8320b096dc14
	.xword	0x2c1b1ed85e905555
	.xword	0xb1f95a7d1030f517
	.xword	0xfd6b6e76e811830d
	.xword	0xb66630e69bdc60e2
	.xword	0x44331d18ae8f8a65
	.xword	0x0bb18ba9aa170b88
	.xword	0x0cc483b2fe00bb2e
	.xword	0x0d8952f2d262c175
	.xword	0x71b0da1ccad267d3
	.xword	0x8298a44aa4ecdf3b
	.xword	0x8c9daf3e7ed908e6
	.xword	0x85743450efe45b83
	.xword	0x69bb615a4b30e377
	.xword	0x3b9a31f998350276
	.xword	0x3b3893abb9e0fa12
	.xword	0x7efac66b1f11c519
	.xword	0x57a8f6879c1bb1e8
	.xword	0x14f22fb47a28732f
	.xword	0x6f2d803702a79224
	.xword	0xa4d3244d1d14895c
	.xword	0x2d8e5781a2b144ec
	.xword	0x4729f7ea3f7d2987
	.xword	0xd659117d34970048
	.xword	0x184d0780223305dd
	.xword	0x2080d2d80527372f
	.xword	0x39bb4bc9d8e9c297
	.xword	0xcfa5772e9b3f58e4
	.xword	0x91a0c5a84a2da643
	.xword	0xb049f95e75c68085
	.xword	0x6d199ff4359bfd18
	.xword	0x91460bc18584d019
	.xword	0xa980827a30e26a2d
	.xword	0x1051546083b5d90d
	.xword	0xb2efc45336316063
	.xword	0xb3a81ef1465d004c
	.xword	0x7eb37a416f4aaeee
	.xword	0x0704f0f007fc7782
	.xword	0x1e494e041bbb4fb7
	.xword	0x30e81cf19b0aca33
	.xword	0x215f7500ab695259
	.xword	0x0fac423e42269bfb
	.xword	0x340f2bbd0dae4f98
	.xword	0xa05f2ac8b7066c9c
	.xword	0xeac58b6539182c7a
	.xword	0x5964b1b5c231d41e
	.xword	0xa71441a8e6afc336
	.xword	0x9f75e92977896504
	.xword	0x9d24a34c33acc202
	.xword	0xc2efc9ea24e04727
	.xword	0x715bf83fa4c8d487
	.xword	0x38329fd71c1fc2ef
	.xword	0xf578b77aeb8f24fb
	.xword	0xf75caa3847449b7c
	.xword	0x68e9d9a7e8328038
	.xword	0x9049bda503a3763f
	.xword	0xc5d4652059286da1
	.xword	0x2cb6e356c7a178bc
	.xword	0x7ae2e12188f6e09f
	.xword	0xa7dbd1067c3f9e99
	.xword	0xe76c2120342d8454
	.xword	0x5fab502b746ee561
	.xword	0x949337367470e519
	.xword	0x0ba3f5d288b41760
	.xword	0x82a63038a09d4c8b
	.xword	0x4a6ecc707a3c2640
	.align 0x10000
	.data
data_start_4:

	.xword	0xdf55e38c1772ce03
	.xword	0xe37b14f6b7fc3e3c
	.xword	0x450a03d812457af0
	.xword	0x5af5b3cb4a3520f7
	.xword	0x2000c19a4703c7c1
	.xword	0xac73675348c70d75
	.xword	0x6021c4348e5800f5
	.xword	0x5cbb645e2c9e5762
	.xword	0xb55a0d5ead90f25b
	.xword	0x15ef2e319ddf04ee
	.xword	0x6edbd0e839453b26
	.xword	0xec50364fbf1eafdb
	.xword	0xcb61044f23290a5d
	.xword	0x67eb6a4b9f8dee96
	.xword	0x80116063a7f8fa52
	.xword	0x609e3e152e1f13bf
	.xword	0xa5cdc3b0bef63072
	.xword	0x596d32bb4ae6cfd8
	.xword	0x63e54e6da41130d7
	.xword	0x96ab9dc282314c70
	.xword	0xf1162653a3879ff8
	.xword	0xa7211dd9a45888a3
	.xword	0x3e0b33da8757f2f5
	.xword	0x4c9dfd0327abf813
	.xword	0x8b56960d4fbdeb8d
	.xword	0xbb629a0effb30561
	.xword	0xe99deba5d3d5dea1
	.xword	0x20185c8440d33dd3
	.xword	0x379623d8cc50e670
	.xword	0xc6f1319affb6b8c2
	.xword	0xbab949a57e1806c1
	.xword	0xe8c78df7646f1fb2
	.xword	0x5c53a025f0fcca7e
	.xword	0xc0049f4ccc7afd6f
	.xword	0xfda25c7da919bb65
	.xword	0x3c9cc258d2f67da4
	.xword	0x10f74bb66819dcf4
	.xword	0x4dc473db8b99a22d
	.xword	0xe18c3737c9ebfda6
	.xword	0xec089da18795e2f9
	.xword	0x8d30a2146607404b
	.xword	0xf893978a6173b326
	.xword	0x183147fca3408daf
	.xword	0x1fdcf45063bb8a0a
	.xword	0xe848fee9ade92a57
	.xword	0xd6e75a39637e0868
	.xword	0xe411e6c9a65be57b
	.xword	0x32e52050b9865150
	.xword	0x719d06272447cd2c
	.xword	0x0448767c32e107ed
	.xword	0x54276ee7ed4f8a71
	.xword	0x13d41446e364deb5
	.xword	0x09401f196c33e27c
	.xword	0x1eaa424d53cc79f3
	.xword	0x612900c5c2532480
	.xword	0xb4e733a7ea5a4ad3
	.xword	0x2aa767ff05ad66f3
	.xword	0x93be635796072aec
	.xword	0xd1c582633500c06d
	.xword	0xe930ec13766916e4
	.xword	0x00438458967bee66
	.xword	0x7354f65248901065
	.xword	0xadd9cb94c6d3d978
	.xword	0x8c95bb5aeb8f8ae5
	.xword	0x006eaf9bb8b49707
	.xword	0x8721cd69f435b51c
	.xword	0x54fb0971bbb79da9
	.xword	0xf3fa45813f3e8b98
	.xword	0xabf975f9d0164ad8
	.xword	0x85e0452164e2be0a
	.xword	0x3fa6e607f81b565d
	.xword	0xd2c11a06510fc051
	.xword	0x2f137b34576eac05
	.xword	0xacedaaeba7ddf66b
	.xword	0xfb97dd1aaebef956
	.xword	0xc5783714201d6384
	.xword	0x4fc626e77d3e096a
	.xword	0x26b71eb936fe07c1
	.xword	0x1fb6394989691ef4
	.xword	0xaf20aae76d858f3e
	.xword	0x2eb1bfd6a5929082
	.xword	0xf772955808ebfa19
	.xword	0x60afb0a02b0284a9
	.xword	0xff5682c0f7375742
	.xword	0x555bbecd74fab187
	.xword	0x05aba5c8259519e3
	.xword	0x538ef4942cd83e3c
	.xword	0x05d447049d79f0b5
	.xword	0x9b0223d60672279d
	.xword	0xea5b071829403c70
	.xword	0x39850c72b2b48d3b
	.xword	0x4ca5a6f9eab7fd68
	.xword	0x4673a391f8e96985
	.xword	0xe9540f339a0238e6
	.xword	0x7c48a96377587ed0
	.xword	0x847e16ee1ff86dd6
	.xword	0x245852de2a8d11ec
	.xword	0x0224f66550e23037
	.xword	0xd3f30bb883294e68
	.xword	0x67bbef43e48f28eb
	.xword	0xa00ad2aaa9a3de57
	.xword	0x8026d8bf85d56afb
	.xword	0xd6ac8a133c12ac64
	.xword	0x966fa1be8af5f1df
	.xword	0xad65a08c79264022
	.xword	0xbb6d90e7ed48134d
	.xword	0xe98baff3be3d7ff6
	.xword	0x10729a753cc38252
	.xword	0x2cae11d2ef08e900
	.xword	0x8cc25999bb5e7936
	.xword	0x48f7e52bf57fe6df
	.xword	0x8815e26b7298ea01
	.xword	0xe43797f30c68107c
	.xword	0x82b0af823c5a88bc
	.xword	0x0cc771035c9a11c6
	.xword	0x28533ce7fb868852
	.xword	0x7f7156b669b314f8
	.xword	0x78946984e6327e33
	.xword	0xa3bf9f65edf8111b
	.xword	0x42c5a76d841ac982
	.xword	0xd5b9454b09339dc3
	.xword	0x9d574a095536d04c
	.xword	0xb4071ce4d77aae36
	.xword	0x281b8b660b116c3f
	.xword	0xc3f7367b811b5d42
	.xword	0xe5b91bf25d42c6e2
	.xword	0xc6b1cfc0b0505c7b
	.xword	0x6c34457c380ab09f
	.xword	0xf1ba3ed5ed60009d
	.xword	0xed4f97f3f15c7432
	.xword	0x646237d477033406
	.xword	0x664f3661ba07ca5a
	.xword	0xa94aba80aa180140
	.xword	0x86a8762a7e748970
	.xword	0x5e3df1b967839e13
	.xword	0xb774f5f2d106a8ed
	.xword	0x13f7b73cda373104
	.xword	0x52d3ffe9e3cb7ef0
	.xword	0x26f6dc5e9bf76a44
	.xword	0x543f441ac33d785a
	.xword	0xbe85788455b7fb52
	.xword	0xe6337daa2443e02b
	.xword	0x0572c46a00e76d80
	.xword	0x166073f2e684897e
	.xword	0x5c1a894c6db461af
	.xword	0x5c96d2ba438410c5
	.xword	0xc7bf30e29c0c67ca
	.xword	0x4d860c8c73e9dec1
	.xword	0xaf8a45aeb8dc37c4
	.xword	0x2c5d800ec443ebec
	.xword	0x690b02a78ce76b7f
	.xword	0x12e8ef05c73359e3
	.xword	0xd9c42860853122a7
	.xword	0xf3aeb73d015da22c
	.xword	0xa590225c75eefe7f
	.xword	0xfe1cba64a1cd9275
	.xword	0x37bd9d37cb4f5192
	.xword	0x7263f1fa67fb8899
	.xword	0x01ec44da8d3408a3
	.xword	0x1d97849ee8aaec34
	.xword	0x3518cc2a574da5f6
	.xword	0xf6e906aa4eca36fc
	.xword	0xec0e44c3ba04b228
	.xword	0x1f8227c3bf5e3ab5
	.xword	0x927df213185d5930
	.xword	0x6d25c581ce52b4bd
	.xword	0x43c2b9b54928a01e
	.xword	0x0bcd0d1c7396db45
	.xword	0x5460a20ccdbd1744
	.xword	0xd910fa467626f838
	.xword	0x8d516b4ac06487ee
	.xword	0x413827a2f1504fb7
	.xword	0x5cd60cec42e4e806
	.xword	0x6d3afc22f6c9cc94
	.xword	0x07d6c966d20a4968
	.xword	0x5a439dddf5f4e23f
	.xword	0x1cae94094c9652da
	.xword	0xdd1f682e09fa973b
	.xword	0x1218220f8e72d21c
	.xword	0x9bae5a388797aa22
	.xword	0x336156b3fa0a3e75
	.xword	0x3c9e7f749a240774
	.xword	0xe53a6554a7233fb1
	.xword	0xc74ddd75e3b22321
	.xword	0xc6caa8b6d08cf5b6
	.xword	0x2795438faea8500b
	.xword	0xa6bd8330dc63ea9e
	.xword	0x0c74fff007ff533a
	.xword	0xde24af4ace135eab
	.xword	0x5ea6a14d11e32dfd
	.xword	0x90b785de7e1dc98b
	.xword	0xa89d97d1eaa920e7
	.xword	0xde97bcb4e09785c9
	.xword	0x4e24d3f1802e7fc3
	.xword	0x5b3fc9154c9ad18e
	.xword	0x35c9c3149cd4b570
	.xword	0xaf70b12761cfe28b
	.xword	0xbc46ad944aba080f
	.xword	0xf9e27b88c7df8cf1
	.xword	0x11d649d93063f373
	.xword	0xfb27a50f2d85d367
	.xword	0x1f2a3fed3ddd1cbe
	.xword	0x70ddc1e64e45d9b9
	.xword	0x4762a048bcad89a8
	.xword	0xa5c31e25d0f72027
	.xword	0x952c3ed70f400493
	.xword	0xefb37dd93aadaa8b
	.xword	0xab77fee87f13758a
	.xword	0xddfa2ed2f5bf2400
	.xword	0x3913ff272e79203f
	.xword	0x40692da1ad794b26
	.xword	0x7579e8f83b229c49
	.xword	0x8cfcb1f5b1178be1
	.xword	0x6f7ce6c0af97ab01
	.xword	0x3c0a500ba2b11c41
	.xword	0xf4cf8f4659c708f1
	.xword	0xfaf94f3ed368141f
	.xword	0xb49681a13bff434c
	.xword	0x47776bef05be5e08
	.xword	0x8edd6b9e4061cb31
	.xword	0xbbac1c0d30f00bae
	.xword	0x34c16702919e878e
	.xword	0xa931c0e2bbdc2203
	.xword	0x50653908a949fc2c
	.xword	0x5cdd65620c4459b3
	.xword	0x3363d6c3e5533bd1
	.xword	0xfb3a6e545908face
	.xword	0xc7f834e050f6b2b8
	.xword	0x120884ea077e9d06
	.xword	0x3119788918cf1df2
	.xword	0xd0072bab40b0fc99
	.xword	0x8c72f21de2afadbd
	.xword	0x349a7adf7393c3a8
	.xword	0x10d73f9781c8433b
	.xword	0x182aea6b2dda09bc
	.xword	0xc992fab40e73d34a
	.xword	0x51b343987fadee24
	.xword	0xbfdcecc739f6e346
	.xword	0x3520e5fc07cb6b69
	.xword	0xd57720522b42139d
	.xword	0xb6d8e1c02d68b91d
	.xword	0x284444d0f72cac5e
	.xword	0x5adb1a4a3b6cf024
	.xword	0x87dd85ab85c1af90
	.xword	0x512c0282ee1bbe4a
	.xword	0xe899c3a7c797ce9d
	.xword	0x9bdfa9e33e7f5f07
	.xword	0x5465a7db1ea6cbeb
	.xword	0x695244266b0abae0
	.xword	0x244dc73ea257d6f5
	.xword	0x1d88ce01bc327d79
	.xword	0x47e69ddc25cd4872
	.xword	0x3425dda94995233e
	.xword	0xbebb4a23c01ccec0
	.xword	0x4ecc650dec8c2117
	.xword	0x907663f1f4adad17
	.align 0x20000
	.data
data_start_5:

	.xword	0x2882a8883ddfdf09
	.xword	0x89639b3503a3bf7d
	.xword	0x3e597f44c7431532
	.xword	0x3b060ea7dd5ff229
	.xword	0x1aea043a83828140
	.xword	0x131cb959c3cf9cc1
	.xword	0xfa43df50f8f91d4f
	.xword	0xc34d8129165b69b2
	.xword	0x08bf26abbf16b0cd
	.xword	0xb003fd80266a7dfd
	.xword	0x95f49b13dbca752b
	.xword	0x4387a928c99df27a
	.xword	0xb0bf2d37bf4fff88
	.xword	0x26bb2bd2ac457d3b
	.xword	0xc7085e640029b4fd
	.xword	0xec0ff971e8574cb6
	.xword	0x8673ef3c76c5227d
	.xword	0x8f63c43d35f049e7
	.xword	0xe5a108449b91991e
	.xword	0x41f154e619cdbb8a
	.xword	0x8b1df8e866a0f02a
	.xword	0x41f7f0a85ea0f5ee
	.xword	0x58b6c89217de6962
	.xword	0x8897a157c09e7981
	.xword	0x2c7bffea0e9976b5
	.xword	0xb4cb08e417a80320
	.xword	0x50f51a0654c445a0
	.xword	0xd45ff292d1156f65
	.xword	0x260227b546f3ae66
	.xword	0xa13a7cf865c3f381
	.xword	0x5d4a7a387f887bb1
	.xword	0x6f5ddf6bc151b25f
	.xword	0xa39a8880e40518a2
	.xword	0xed30d2c2ec2b1b52
	.xword	0x43aaa429d2c2caf0
	.xword	0xccd0f84fa588ea75
	.xword	0x5d2da00dbb2e0471
	.xword	0xa2275df4726a6a20
	.xword	0x5229bb6ce1c46e80
	.xword	0x1f657ac35fd9313b
	.xword	0x0768d4d4a8fce684
	.xword	0xda9cc8c1b06cadb2
	.xword	0xa96ea4c3914bd8b5
	.xword	0xfd114cc9cfd991c6
	.xword	0xc0ba4c6a88c97d63
	.xword	0x501db3e9f6afb65c
	.xword	0x823a8c0b2aab9d02
	.xword	0x2e5f9c51a2baaed2
	.xword	0xbd5ec582d3d9158e
	.xword	0xe7472ce097c9e859
	.xword	0x2d3874cbe33bb453
	.xword	0xb3a0d7d8b8ff0277
	.xword	0xf37e0d3adea35375
	.xword	0x7ac5a656ea1299a6
	.xword	0x02d218563127b94c
	.xword	0x2b3fa06319d996f3
	.xword	0xb5a53c43cfba5d79
	.xword	0x1c68714f3228e1f6
	.xword	0x9152375db973f112
	.xword	0x585ead7f9f42c6f3
	.xword	0xddd9bd6e6ba9eba6
	.xword	0x89319432e136e19c
	.xword	0xfa38e03a7e4ab978
	.xword	0x6774f6d371d5691c
	.xword	0x799ee2c0fa8a0176
	.xword	0xe51636c2b9b01698
	.xword	0x5347e1ae337920b0
	.xword	0xc8872f4838663ddf
	.xword	0x6121ebe0c5a85ec2
	.xword	0x1c4ab81aed1d4947
	.xword	0x01b3268e21249a70
	.xword	0xb256f5b1e76782cd
	.xword	0x7c3889a1237311dc
	.xword	0xcbad9f22acdb1a48
	.xword	0xf13b7ec907b0f8b2
	.xword	0x4b6868745795c794
	.xword	0x0dbfe9b3e53e8967
	.xword	0x8c754458c926a5f5
	.xword	0x66452116c07143ac
	.xword	0x0fb0b874a63e48d7
	.xword	0x2ad9f8e9d4ed7c9b
	.xword	0xf86e825c5125dd7b
	.xword	0x19e5751e98558dbf
	.xword	0xf5636ea51e8df4f6
	.xword	0xd2ec3ab6a5d01730
	.xword	0x67799d874c991117
	.xword	0x30d34b147abc00c0
	.xword	0x6ff342047dc37246
	.xword	0x75cae7dcd8d4a9a4
	.xword	0x5744536963060449
	.xword	0x97e40f122369b2d8
	.xword	0xc63e03d4c45ae6a7
	.xword	0x345acd0ca18eaeba
	.xword	0x69acac7cc9866498
	.xword	0x2e5c354c65b01354
	.xword	0x86322f81d03144c7
	.xword	0x32eff4dbe99ae969
	.xword	0x0f5769949cb4c2d3
	.xword	0x645138b429cd7964
	.xword	0x0edbc1777bf08a1f
	.xword	0x5214bc750962d957
	.xword	0x9d116002668538db
	.xword	0xe83b8a784904c559
	.xword	0x989b39e9fa23e163
	.xword	0x5d1166ea665f3435
	.xword	0x2867200348e92081
	.xword	0xea5f82da5219351c
	.xword	0xc4302511982fee1b
	.xword	0x807f655237a0112e
	.xword	0xd16b42f3a211d4a7
	.xword	0x928c3cabb1c0c8c3
	.xword	0xa9570d85ad3d2dc1
	.xword	0x785d5d1202ed1511
	.xword	0x8a7239c03931ea1c
	.xword	0x94e5ae154cbaecd5
	.xword	0x2ebc3e0f42f6e400
	.xword	0x0d4d6893d8f6382e
	.xword	0x90b6cc015e1143a1
	.xword	0xf21225d527d97d4b
	.xword	0x94f1edb4d205ad24
	.xword	0xed55d3bbf3fc0b9c
	.xword	0xc09e94857603fecc
	.xword	0xc0d81b7a6b0ac435
	.xword	0xcc18b0a02500bd7c
	.xword	0xc55358317a1389f6
	.xword	0x66f4ecffddae90ed
	.xword	0x5b719a65b56b2bab
	.xword	0x96a401403ad58c68
	.xword	0xc2ad5daf4f9dcf01
	.xword	0xde4454ba482ee7a5
	.xword	0x9f0841aac86608fd
	.xword	0xfcafea09ba98a3eb
	.xword	0x2112594e817e6fde
	.xword	0x946638a030e91e51
	.xword	0x537badeaa92999db
	.xword	0x5a8d66fb07a3ddb0
	.xword	0x7b235293ebea0c70
	.xword	0x448f214ea4531227
	.xword	0x59707625be1ff0da
	.xword	0x52586bfcd46f25ad
	.xword	0x86c2950e1dd8abd4
	.xword	0x89522ba3bf81e04d
	.xword	0xe61c418fbf3cd997
	.xword	0x7dae5c80c612622b
	.xword	0x569488d119c98edb
	.xword	0x668c3293b7ad1bbf
	.xword	0x3453ed138c1cfb44
	.xword	0xe20d2db33dc3b288
	.xword	0xb5f934ebbba47b09
	.xword	0xe8448f6c722cae58
	.xword	0x46b784374349efb2
	.xword	0x3d39ffbf903940ea
	.xword	0x48b17b12f7fbd2db
	.xword	0x949a89d8591fa0c8
	.xword	0xd675e3cc8e9029db
	.xword	0xeab9393376c7c7e1
	.xword	0xc5e6f17ac46d95ed
	.xword	0xfa4485373f648ac0
	.xword	0xa7b6984b616c04a8
	.xword	0x55b22f64881e8d84
	.xword	0x43fb90853c450c83
	.xword	0xfef6cf7c347265b5
	.xword	0x0f46e1aee780c400
	.xword	0x6878ee554fab6aea
	.xword	0x20b39a7db08934ec
	.xword	0xf044bce24c621446
	.xword	0x079bd1825f205c78
	.xword	0x492f5a7920a61703
	.xword	0x5e8b37b2ba4a97c5
	.xword	0x0d803fca88425aed
	.xword	0xf4c8e917c756045f
	.xword	0x293bb6104f41ef6f
	.xword	0x429093bb9fec908b
	.xword	0x5e2494954df90217
	.xword	0x79c500d1a525520f
	.xword	0x8b5ea322894617b9
	.xword	0x47ed67b39a0c6fc3
	.xword	0x28df77896d714ea8
	.xword	0x36fc5bd46abbf8bd
	.xword	0xd782935897572698
	.xword	0x23da4c6b30661bf3
	.xword	0x23d4572a41c2db50
	.xword	0x2ff0f5a63cca1059
	.xword	0x11f58d90fa954e8f
	.xword	0x98d611f257673def
	.xword	0x6aeba3cddded5c00
	.xword	0x71b123a35897381a
	.xword	0xb149164b59bd6498
	.xword	0x158e671e8d9ce18d
	.xword	0x6a2f535d8e3ff605
	.xword	0x47f70deb1fb5b762
	.xword	0xfb7564be5a23723e
	.xword	0x5b01cbddd9f53be4
	.xword	0x4c4b9b364a3f098d
	.xword	0xda9ec6e813c21662
	.xword	0x1233758bd649dc5e
	.xword	0xa234f298b901dc8c
	.xword	0x24c6e824f5cf50ff
	.xword	0x3b69b821ddbffe24
	.xword	0x47c6c01cbff0cf21
	.xword	0x07090cd03e67484f
	.xword	0x4335668a118da39d
	.xword	0x1df0c436c6075078
	.xword	0x9ca928b79a0a0392
	.xword	0x6e1c84409f83eb10
	.xword	0xc3cb84fd30e2e84d
	.xword	0x10ee55fbb8fee948
	.xword	0xf817cbfc9e11ef2e
	.xword	0x22fc7cb7c9850caa
	.xword	0x982a370fc5998f4f
	.xword	0x82d35839b8276a50
	.xword	0xa30d83e43f94fd78
	.xword	0x93114276da5d042c
	.xword	0x0fe541ff20cf2107
	.xword	0x29c40b30fe9ac963
	.xword	0x461a7a47c2a11eb0
	.xword	0xdb570c9e00ecf56e
	.xword	0x80fa9795c6163db6
	.xword	0x94bac25f8666cd4b
	.xword	0x707b8f133ffc0c5c
	.xword	0xf6d5bd81b75e8025
	.xword	0xd98be453229ae357
	.xword	0x93e79655c586351e
	.xword	0xaf7daf186545cf23
	.xword	0x0d6c6d88114daaba
	.xword	0xe446357805b5cba7
	.xword	0xda1be079338dac47
	.xword	0x354f57d018e92286
	.xword	0x462b0b7098122f7b
	.xword	0x1e35db01eff1271f
	.xword	0xc9149f40fb19fba6
	.xword	0xbd88b0e735dd4f44
	.xword	0x47a33b320814f67d
	.xword	0xbaf144e1c11ee60c
	.xword	0x8871f090b0d45853
	.xword	0xf78152d114f2f6a2
	.xword	0xfc3dc593baeb15dc
	.xword	0x865f58d5cb53d340
	.xword	0xda0a016b70b80fc3
	.xword	0xf7de38da7864c2fe
	.xword	0x8c8bd8a4388a3571
	.xword	0x50b2e2f0b891b9cc
	.xword	0x9505806a4bc9679d
	.xword	0xd121c77d86c636a4
	.xword	0xae7f0be88bc99655
	.xword	0xf129d1f647c56b46
	.xword	0x6c7ec5e202bf2f2b
	.xword	0x48e133aa95fca606
	.xword	0xd2aa7cafb43d6176
	.xword	0xbbeccdc06ce0894a
	.xword	0xce650c52ffa8ce97
	.xword	0x0290e36012222084
	.xword	0x46af06929bbb3456
	.xword	0x5f447aa187f921b5
	.xword	0x3926191335f093ba
	.xword	0x1ad39c23ac98eadb
	.align 0x40000
	.data
data_start_6:

	.xword	0x17fd984866817a64
	.xword	0x885ac654ec14c766
	.xword	0xeb98d169ccbdc190
	.xword	0xe36f57aa197fd101
	.xword	0x702556e4e2bc0b1e
	.xword	0x87ec269eb4676a5e
	.xword	0x81f4d62a48c1b7a7
	.xword	0x20bd48bce19be975
	.xword	0x29dd14d5415f7597
	.xword	0x72267da640574639
	.xword	0x43d3dbcbea0d510c
	.xword	0x3dd352cb6a0823a5
	.xword	0x5032217828bf5480
	.xword	0xd6e3a24a3605065c
	.xword	0x6171a57f097f5dc0
	.xword	0x8e07a37866d88016
	.xword	0x546d3d8b0346603b
	.xword	0xed1c515ef6d4b4e7
	.xword	0xb00a8be0f764df5d
	.xword	0x6f9a3df8452f1b5d
	.xword	0x8ef4238ccf942287
	.xword	0x3227f8fe6e1c9aab
	.xword	0x8675816411449088
	.xword	0xc644fd7b44e77b63
	.xword	0x138b314b0d75b31a
	.xword	0x8ad97445daa91f3a
	.xword	0xa91b69e83a6a5396
	.xword	0x9a4d2c21e300a76b
	.xword	0x082b0aaaf24ab72b
	.xword	0x43b75d85a134ccec
	.xword	0xe248b935daa23144
	.xword	0x65cd9b61811605ec
	.xword	0xc96a50210a8975ab
	.xword	0x5b4866b72e1d9720
	.xword	0xaf4bc3f9af3f8cdc
	.xword	0xa7ff38404b94cfb9
	.xword	0x74be50e51d0dd80f
	.xword	0x221c3d93925b0f95
	.xword	0xa60a7bfe052b3789
	.xword	0xf169b0061ab92319
	.xword	0x7b4d7e7a2098f411
	.xword	0xc10e419c68fc76de
	.xword	0x8a31304495ba518c
	.xword	0xabf76193682cf8ba
	.xword	0xc88f2484c504eb0c
	.xword	0xd928d6b8659e4524
	.xword	0xf4b6af41284e5c39
	.xword	0xd446fa4b1a8c44c9
	.xword	0x53ef3e1ff4a76896
	.xword	0x40c320a783403094
	.xword	0xa833745473d7fb87
	.xword	0xaf72c2e5b840ac29
	.xword	0xe8514037dd2de712
	.xword	0x2c14be091e00b485
	.xword	0x78630132cea7516a
	.xword	0xadb3317e698ab9d7
	.xword	0x97591ef06e714761
	.xword	0x41f0b3edfc0f2f05
	.xword	0x00399c090b98b1d3
	.xword	0x39e75b3df853d12a
	.xword	0x288fb83c7b9e09a4
	.xword	0x52a218766e83a8bb
	.xword	0x113023253e4dfdbc
	.xword	0x3f0c255f1b651c8e
	.xword	0x73faabbe68ea718c
	.xword	0xdafa6ee543e905a7
	.xword	0xbcdb5eee849d09bc
	.xword	0x4b9021c912cd4e44
	.xword	0xc2d4ff6e5ae0cf51
	.xword	0xd73b28c1375f8e13
	.xword	0x7c09154817f1c71d
	.xword	0x903cbf98b099b790
	.xword	0x7edbfdee76e9744d
	.xword	0x725e1870b334d203
	.xword	0xf58e6ff62db3058d
	.xword	0x3028d964e48d947a
	.xword	0xaf6dd325357b4ece
	.xword	0xe9947629153771bc
	.xword	0x1ea172e60cd6573d
	.xword	0xf22c67b39d225536
	.xword	0x48764baa37ce5af3
	.xword	0x989e366a03fc293f
	.xword	0x41cdb2881caed6ab
	.xword	0xb80a39d39ec9c94c
	.xword	0x258ae53ae9aa92a7
	.xword	0x7496fc514c07805f
	.xword	0x665d83aae76d72b3
	.xword	0x1a17a837fa31755f
	.xword	0x6306859eadce85c6
	.xword	0x84bcc478fb43bdfc
	.xword	0xccb11e08f21938a1
	.xword	0x821d966e9c4c7135
	.xword	0x65115c754de9a02c
	.xword	0x68d5cb1436783f98
	.xword	0x3093bf8268f73ad2
	.xword	0xc2519a9f9888b798
	.xword	0xf5770907fb959f44
	.xword	0x33eba979955145e3
	.xword	0x26ac9cd6b3e7e9dc
	.xword	0xbfde088efd443870
	.xword	0x455870c4d9dcd6c3
	.xword	0x5352800eb525fdcc
	.xword	0xb1c07923b5ca812b
	.xword	0xc7d8a5f06d9fad5c
	.xword	0x1759b98623bfddd8
	.xword	0xbdecf79c24e8e5b1
	.xword	0x0f61c9e869b2c524
	.xword	0x825ead96aed28ba1
	.xword	0x05b4eaca136b5039
	.xword	0x2a6e553fa57399a1
	.xword	0xa448d46c5e94ba0c
	.xword	0x71b2ddcd9c467d73
	.xword	0x1ee216d7963bb323
	.xword	0xe44b6e3bcc955314
	.xword	0xdaffb203b0f32884
	.xword	0x4e6c023909b38de4
	.xword	0x7803a6551dbf84f8
	.xword	0x06f306a2c55dd654
	.xword	0x297cb1f9d8ced272
	.xword	0x6293afceb5e2c038
	.xword	0x970dc4d13f6519c8
	.xword	0x6d84b94f1fcda7ee
	.xword	0x45e777f2d8cb88ca
	.xword	0x89d787a477bd79c9
	.xword	0x594cd8140c431cbf
	.xword	0x0947a6b6480a08ba
	.xword	0x3693ded4dabaddde
	.xword	0x6944ebbb17a0a66b
	.xword	0x2f1371da07074d7f
	.xword	0xd5e11c27f55b54a4
	.xword	0x36917627727eb45d
	.xword	0xc65dae4bfce18092
	.xword	0xcbc9a3a48e913ec7
	.xword	0x6cabfdb167df61a1
	.xword	0xa28064ab95d4a331
	.xword	0xc70711f0ff825c96
	.xword	0x004403de735a9333
	.xword	0xefc6015be82bdb24
	.xword	0xef62603dbc45b958
	.xword	0x4655c2ed8d9a45e5
	.xword	0x9e92779fb44e522d
	.xword	0xe8e152dfba2056fa
	.xword	0x9f692570f10b0fc8
	.xword	0x4e6b0106fb9042cc
	.xword	0x3fbccc61a2ffa04e
	.xword	0x43463933d08b70eb
	.xword	0x3722e43ef1216073
	.xword	0x799351171686c9a5
	.xword	0xe881382211fff8e5
	.xword	0x53ddca564064672b
	.xword	0xed97a5d8a794c4ca
	.xword	0x9b06549402eb5a31
	.xword	0x43cf29ae1235766e
	.xword	0x509118facbb81ddb
	.xword	0x8ea17a20ee6d6ebb
	.xword	0xcc1974ded69e211b
	.xword	0x8eaec6fe009220ff
	.xword	0x8a28b74f6ab122d9
	.xword	0xd454104fc77b5b8d
	.xword	0xbfd426dcea50c896
	.xword	0x6ff647f106b3d1b6
	.xword	0xbeca943a7f16166a
	.xword	0x52c50c027ba48aa2
	.xword	0x0961c1f638e64289
	.xword	0xf17b8872db757488
	.xword	0xe1cb4aab2355457e
	.xword	0x6c4c684fafc9fb91
	.xword	0x164be7088e73d113
	.xword	0x375a8143077c3f9e
	.xword	0xf4c27b64c2258078
	.xword	0x4d7c29b1405d64df
	.xword	0x6d3421df697dab4b
	.xword	0xe65b6213ce7c2a96
	.xword	0xc6a903277ee23870
	.xword	0x7cfa7e3a1061d979
	.xword	0xdd27928672bae142
	.xword	0x7d78301ed1fe3287
	.xword	0x6a0679d09fb781a7
	.xword	0xce553d46e9a8f4c7
	.xword	0x4f0cd29a6357cde6
	.xword	0x9a3f125c44d40b05
	.xword	0xcf4d0cbc5749e053
	.xword	0x90a6276ef65fd605
	.xword	0x66bf0d03985cc8c0
	.xword	0x2a795a76f13b3907
	.xword	0x8328552afc4f4726
	.xword	0xe953a25c3cd42385
	.xword	0x73d79f9aabdfcf04
	.xword	0x5eb133e6080f0cb8
	.xword	0xfd70786523073c59
	.xword	0x12f621b057069b07
	.xword	0xbc004c345e762b1a
	.xword	0x68fd01ce72fa385e
	.xword	0x9b5043ad6c09932f
	.xword	0x0fc1d1c17cd709ce
	.xword	0x4f6493648f69cfd7
	.xword	0xbb6da33db2e38f68
	.xword	0xb1a884cc097ea90e
	.xword	0xbbd78d78a0406223
	.xword	0xb29a29431e4af451
	.xword	0x4bd8ec6f7901e03d
	.xword	0x67b81a187f4b842a
	.xword	0x9865cebe23a5942c
	.xword	0x7507de192cbc6abe
	.xword	0xcfc9371d5067ccda
	.xword	0x4037d3ee8e924eaf
	.xword	0xa8ed8cfdd660b3ec
	.xword	0xc4f9f6d3828cede1
	.xword	0xf423923d0b2a9a12
	.xword	0x8994f7c02c5894ce
	.xword	0xc8a8506542086080
	.xword	0xc6d3fd1414deef76
	.xword	0x079f8440a3445a92
	.xword	0x97e17c2f7444efee
	.xword	0x093696006f941c0a
	.xword	0xf2b73b4e88ddfebe
	.xword	0xdef271c60d5b4104
	.xword	0x1a0f3e922ad50048
	.xword	0x998224607faa7eca
	.xword	0x57cfc83c59c3b6c2
	.xword	0x5820640be7514515
	.xword	0x171edb1b834f408b
	.xword	0x69e5a11c322ac105
	.xword	0x65e37af64034c144
	.xword	0x9bea9b8f38dfd355
	.xword	0x88f527632c1fe6e1
	.xword	0x4280e41631980711
	.xword	0xfd5066891410ff13
	.xword	0x948ed0d3fdd71bd3
	.xword	0xbc2acf4c532ac25c
	.xword	0x73158e255fa78bb8
	.xword	0x2f6290b4766b7b8c
	.xword	0x3e25df764a9f3257
	.xword	0x25720a95f64d3c0d
	.xword	0x030fe46171c3e91a
	.xword	0x1d971b42758c273e
	.xword	0x514861ae5b35115b
	.xword	0xbcd7c8ffae1eb279
	.xword	0x6da827a53693e8e1
	.xword	0x6e885b1e6d0e0e37
	.xword	0x4e7595b41c5fe700
	.xword	0xc7c9b58cd68e59cf
	.xword	0xf7403ee68e7769b5
	.xword	0x3f7fd5b3ff57bdca
	.xword	0xbb3f091a7a259d45
	.xword	0x4a70d27a73603acf
	.xword	0xafc31767a4c3b7ae
	.xword	0x8842162e815675e0
	.xword	0x62162530e94fcc03
	.xword	0x00ad3e69e476c930
	.xword	0x3d46900814d5a041
	.xword	0x8311ca47dff36cd7
	.xword	0xb2fae1ac219404f0
	.xword	0x716930ebfba96941
	.xword	0x1bf43fd95b9a28e7
	.xword	0x9c7023d826640d63
	.align 0x80000
	.data
data_start_7:

	.xword	0xc6bbeb9ffd5b0b45
	.xword	0x20db7be7596f96ea
	.xword	0x87daefe730851db3
	.xword	0x71ec77f0df57a959
	.xword	0x84861de030340c0d
	.xword	0x2090216cbd38ab9f
	.xword	0xc061f3ea4df45dbe
	.xword	0x1d363e12b5589d5f
	.xword	0xc541b7f72255b572
	.xword	0xe2c361ff24fe6dda
	.xword	0x83e1fb5e96476b5b
	.xword	0x7094d60ed6713330
	.xword	0x1109701539d9cb83
	.xword	0x4aaadad8abae0e21
	.xword	0xa2d0dfe567777d6f
	.xword	0x7dc3867383b216c3
	.xword	0x89567c19e9f67090
	.xword	0x1ed18997e530d401
	.xword	0x0e24a35c497a73c7
	.xword	0x52e9cea54dd2a043
	.xword	0x292a1cb0db9b82c5
	.xword	0xd3838abf55be0fee
	.xword	0x950d86971c167ad3
	.xword	0xb23dcdd9f5b16c00
	.xword	0xbb79333f5ac93040
	.xword	0xc07fc287b491bfaa
	.xword	0x105d1f2f4d3bc40e
	.xword	0x65bc1e4331e5a674
	.xword	0x25984c5c1c8823e2
	.xword	0x05cc9ae132e008de
	.xword	0xc241569dc15f07a9
	.xword	0x4bbbcfefc2451999
	.xword	0x023f1d3a673b359f
	.xword	0x1ace933393a14997
	.xword	0x32e39b7347a19269
	.xword	0x25e224954caa4636
	.xword	0x0627a15fb0ef4bd3
	.xword	0x55f8c96a20701dbc
	.xword	0xe1b062c094416a61
	.xword	0xe457f65fe93fe93c
	.xword	0x3d2786a4a6558779
	.xword	0x817fccb82b2b05b2
	.xword	0x4cfc3ec292bcdb7f
	.xword	0x2591d6c88d4f6046
	.xword	0x2877204fa0180b61
	.xword	0x9ce112cf56105907
	.xword	0x98aa5aff3dfa3c6d
	.xword	0xc839068dbd1e82df
	.xword	0xb8565c0d6dd7b8be
	.xword	0xc66e7cc6cbb2759b
	.xword	0x0b8b6e189b9aa2cc
	.xword	0x6f862e3a1a7509a1
	.xword	0xd371de413ab90e18
	.xword	0xfbf4b39fa39d9a78
	.xword	0x59b558035dd25fb3
	.xword	0x40ab96b76bcb61e3
	.xword	0x546d7d9e12de96d5
	.xword	0x69a572530de5e727
	.xword	0xa6bf5b883715122e
	.xword	0xfc62990e04eff8e0
	.xword	0x47cb26053197e00e
	.xword	0xd0b23355bf104b5e
	.xword	0x881e16496ec09918
	.xword	0x4fcfe70d4d884964
	.xword	0x555f126f3765c80e
	.xword	0x62319aa212517cbe
	.xword	0x371fc62a0f9d0ffd
	.xword	0x5de6dd8329b14a4c
	.xword	0x92bc0422570cea5d
	.xword	0x8039cea657204745
	.xword	0x9d2fe68e56cfbd64
	.xword	0xc9f5a0030f06ff3e
	.xword	0xd7d23e733101c34b
	.xword	0x0e139540377bf7d0
	.xword	0xb6cd7e37f4f78b27
	.xword	0x3cacb08f0f63230d
	.xword	0x878287f256762510
	.xword	0x4dbb1e5994cb9261
	.xword	0xf5f522f3604c39c1
	.xword	0x718e213f9bd81816
	.xword	0x9098b947fdc881d7
	.xword	0x47f76d6d0b0558e5
	.xword	0xb53dfd9c5663deda
	.xword	0x5369ce3ec9cecc42
	.xword	0x06208457d260d3bb
	.xword	0x92603ae5f6dc9713
	.xword	0x629765a129e474a4
	.xword	0x250d1fcc4898f862
	.xword	0x8729a33529494504
	.xword	0xda3a0aab1552087e
	.xword	0x1bf7c2e6f35629ca
	.xword	0xb8ee0e741dee81c2
	.xword	0xbf7b42d77de3b230
	.xword	0xef8ffbf21b9a67f4
	.xword	0x9d4897c8cf9ff9db
	.xword	0x97c0cfb668009aba
	.xword	0x95083108ea0c1af8
	.xword	0x5f377a15abe50d8f
	.xword	0xdde682384c0c9c74
	.xword	0xc25b5770ddcc2828
	.xword	0x03b2490cacf9c3db
	.xword	0x2eae3158dcecdf7c
	.xword	0xb255fab6bda1653a
	.xword	0x8e95afd59b2d20b4
	.xword	0xb4c754ab25e62c95
	.xword	0x7e398f4aacec9a80
	.xword	0x8e45bcfe0e4bf71b
	.xword	0x9cf38293aae8bcb9
	.xword	0x337c41e324de2c7f
	.xword	0x8192c000b4a67c88
	.xword	0x7a2522bcc45171a5
	.xword	0xbaac5b87561492f5
	.xword	0x0d36cdca9efbf9f5
	.xword	0x5049a34353dbea9c
	.xword	0x1486ebee8a93cb48
	.xword	0x2197a986da3b5910
	.xword	0xa31c929d6d12324b
	.xword	0x5a4f2c7d8897f84d
	.xword	0x4e7068c8a6c001e0
	.xword	0xae4038b1147394d6
	.xword	0xe4260ca19ed4a673
	.xword	0x956424304ffc41fd
	.xword	0xe3e2743e3e8044dd
	.xword	0x463e13f06c9bea90
	.xword	0x55ff092452524a49
	.xword	0x2abb55891612a562
	.xword	0xd9163ba002f61728
	.xword	0x6e648515ae491dae
	.xword	0xebf72b97f7e520bd
	.xword	0xa5785795d58d69de
	.xword	0x3e8132887f8e4cb7
	.xword	0xbd59af8177b003e5
	.xword	0x835db6169dd8bb49
	.xword	0x184b5af5ab7b4df1
	.xword	0x52adf16f6b6fb19e
	.xword	0xc526302870f4a92d
	.xword	0x79cf5935982b8eee
	.xword	0xf285c15bf8d9d0ff
	.xword	0xfd264842e3727f83
	.xword	0x0427f5e90a4fbe22
	.xword	0x5654b2e9274697ea
	.xword	0xc4e54e2c4c534013
	.xword	0xf1c21e4e61a5feb6
	.xword	0xafc8ae8b5d25d3dc
	.xword	0xa7fc453e871b899d
	.xword	0x9f0d05621d7f5781
	.xword	0x3bcfb5ebba6ff050
	.xword	0x370b6d6fe0b1f4e4
	.xword	0x46c58ae4f80ddc4e
	.xword	0xc9dc20bde2170fba
	.xword	0xbfd847c550429e0a
	.xword	0xede0023cd066832d
	.xword	0x4f53f79122b764b1
	.xword	0x200e0d2d14d9a2ca
	.xword	0xf6ed82b2eaf6ad8b
	.xword	0x511927129881180d
	.xword	0x63bc1f9280bcaeb7
	.xword	0x153c0eff7b756368
	.xword	0x769b22d0a7edfd97
	.xword	0x28da841ecc7e2288
	.xword	0x11ab69fc6dd36462
	.xword	0x4a26bfdfb13f7f8a
	.xword	0x197d4e4e6ce8ac59
	.xword	0x10ed2444f0ebf070
	.xword	0xc5a16d5c0d3bb7fd
	.xword	0xb9fa55afd6992f68
	.xword	0x210c7b511392d401
	.xword	0x70636efd7d281d5b
	.xword	0x7653fe3d6f8fed05
	.xword	0x320ea55398ff2a45
	.xword	0x0a054c01ae3eea32
	.xword	0xb52664a6a92e03ef
	.xword	0x1dc1e73ec3974c37
	.xword	0x91f57f09f97d368e
	.xword	0x2c6e16a4f92c04cb
	.xword	0x6d776eb7fce5dfbc
	.xword	0xb32d3beb4f3b663f
	.xword	0x2bbd56ce3777ec97
	.xword	0x0662779658680ae6
	.xword	0xd411c05aeeb44230
	.xword	0xe2d676e952655bbe
	.xword	0xe52f3bfa10e889d8
	.xword	0xaedf34ee5a413225
	.xword	0x4c960f856a4dca3b
	.xword	0x597f91c4e3d5eafc
	.xword	0x2aa9ee4bd3cd219b
	.xword	0xf2722a6a2a33932f
	.xword	0x3697f1fa255dabc1
	.xword	0x06339a6c7e6a5de3
	.xword	0xedc90ad10182289e
	.xword	0x4ecfa51588a548c7
	.xword	0xdba8f16709812870
	.xword	0x0549d1778ee78414
	.xword	0xb5c7c740dc31d185
	.xword	0xcee009278597be95
	.xword	0x4209af234bb86bde
	.xword	0xd8267af105a25b4f
	.xword	0x3b094194bf30ea3a
	.xword	0x2838ea0246d39a0b
	.xword	0x946dbbb2e9ba0258
	.xword	0xe042dafc4c3c1755
	.xword	0x0d8b112d193ffc2e
	.xword	0x6a51336cff2e6b34
	.xword	0xacc9600ab57acb83
	.xword	0xefd1c33ec6d12823
	.xword	0x5532717a3cc917c8
	.xword	0xe8de09f5963407f9
	.xword	0xe7c1166100809052
	.xword	0x4639f0b97a2c9cf4
	.xword	0x407906e40adc5b69
	.xword	0x126fe36b5f8eca1e
	.xword	0x15339aab06ec7752
	.xword	0x7c3046101fe70a98
	.xword	0x27ef0a645e39cba0
	.xword	0x4bda0c064051292d
	.xword	0xe99a9f3d99be55df
	.xword	0xedc909e4461b1431
	.xword	0x8f3646edc37ecba1
	.xword	0x165517c47fb4a897
	.xword	0x0cd6809c47ae1cb3
	.xword	0x794f72f2536978bc
	.xword	0x3685c7077ef2abe3
	.xword	0x32fe8fe97d9549ee
	.xword	0xe5fe1352d36c0c32
	.xword	0xab700deda037ec02
	.xword	0xc847747be2fe26c4
	.xword	0x8e01eafa8d5d03de
	.xword	0x6f897e551462def6
	.xword	0xe6a41fa9ace67fec
	.xword	0x0a04bd8371c813ac
	.xword	0x00db05d35cc82c9f
	.xword	0x5cf9dd2e33e2db8f
	.xword	0x1e8f1ca8bcfb37f1
	.xword	0x976501b555e76644
	.xword	0xe7313907902cc65a
	.xword	0x7d8e3f20b7f2571c
	.xword	0x69879ac357587553
	.xword	0x5e211066a7d25143
	.xword	0xc3c8dab11a51830a
	.xword	0x82aaf51e52c8e4b5
	.xword	0x8908dd4678067733
	.xword	0x74a3a044ee820522
	.xword	0x75c3c41862681ab0
	.xword	0xa21253d58dae8ea8
	.xword	0xbffb01f5f4411d81
	.xword	0x2c47caf67aefc9b9
	.xword	0x69cf833dd28ab954
	.xword	0x6d3116ac6955421e
	.xword	0x89f2863dc748de4f
	.xword	0xc3c35df778d7057b
	.xword	0xaaf7d58df56d87ec
	.xword	0xb881b6549ec420ac
	.xword	0x5730dc268c685277
	.xword	0x3447a7fac3cc4d66
	.xword	0xff9a83a819f04b00
	.xword	0xdd75945515a7303b



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
