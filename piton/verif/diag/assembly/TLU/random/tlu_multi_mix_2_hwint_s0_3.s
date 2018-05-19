// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_3.s
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
   random seed:	904663085
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

	setx 0xe1e517861b56f05a, %g1, %g0
	setx 0xd853c87cee8b5770, %g1, %g1
	setx 0x4acecb8564cff1cc, %g1, %g2
	setx 0x0ee9ada8dcef15e4, %g1, %g3
	setx 0xc3bcc0b02c3dbd54, %g1, %g4
	setx 0x9d59ce09ec9fd074, %g1, %g5
	setx 0x892424b8c09a98eb, %g1, %g6
	setx 0x550f3569b862b582, %g1, %g7
	setx 0xaa9464becf62f358, %g1, %r16
	setx 0x8b585815b4d10b90, %g1, %r17
	setx 0xeb0d8c60dcb5d3c3, %g1, %r18
	setx 0xce36b9a57242116c, %g1, %r19
	setx 0xd7b4f24152823de0, %g1, %r20
	setx 0xee2dc5c2aa744237, %g1, %r21
	setx 0xdb619a705a389eea, %g1, %r22
	setx 0xc7f1dd97c126335e, %g1, %r23
	setx 0xba9016de5dab5d31, %g1, %r24
	setx 0x06d75866ce39741a, %g1, %r25
	setx 0x38c2f3f503e672b5, %g1, %r26
	setx 0xaf43a68d1a4af319, %g1, %r27
	setx 0xa984c7174b23ce34, %g1, %r28
	setx 0x5dbd3fe94035bb6d, %g1, %r29
	setx 0xd288cbb45b38a6cd, %g1, %r30
	setx 0x8213d61e5161c038, %g1, %r31
	save
	setx 0xec4da641d17fdf19, %g1, %r16
	setx 0xe43c29698c33d363, %g1, %r17
	setx 0xcd7161ace530ecf8, %g1, %r18
	setx 0x389b114520f5afd6, %g1, %r19
	setx 0xccb5db25780fc92b, %g1, %r20
	setx 0x84b021d6044a7e8e, %g1, %r21
	setx 0xeb625b3a661ee254, %g1, %r22
	setx 0x241e0af4d895d495, %g1, %r23
	setx 0x0e37162032c40bea, %g1, %r24
	setx 0x7f260a94912649ce, %g1, %r25
	setx 0xa0c566d5179e7ca9, %g1, %r26
	setx 0x23e5e74190489403, %g1, %r27
	setx 0x680bb615875a68cf, %g1, %r28
	setx 0x4d9a83d0f0ba69cf, %g1, %r29
	setx 0xf82402187cd3cf9f, %g1, %r30
	setx 0x145df349d4b21e35, %g1, %r31
	save
	setx 0x7215decbe5225ecd, %g1, %r16
	setx 0xdd64998a9eb1816e, %g1, %r17
	setx 0xb51d52f64a4550ab, %g1, %r18
	setx 0x985cd15a9cf07798, %g1, %r19
	setx 0xe94aed7071f2092d, %g1, %r20
	setx 0xdde2dd29aeffe0c0, %g1, %r21
	setx 0x943f1d7aa9b2ba83, %g1, %r22
	setx 0xea7dc8fc4c4a6911, %g1, %r23
	setx 0x06fbbf2ff1372fbd, %g1, %r24
	setx 0xd50a2b8f158b6516, %g1, %r25
	setx 0x44aa2d7353cafa97, %g1, %r26
	setx 0x6c3d4413be24f0ad, %g1, %r27
	setx 0x0dd1b07819aa9fd7, %g1, %r28
	setx 0xfdce7a843c05ebbd, %g1, %r29
	setx 0xf48db0765f526c2f, %g1, %r30
	setx 0xe4a3e2c5e9467346, %g1, %r31
	save
	setx 0x736fab42020555dd, %g1, %r16
	setx 0xd6092e3e94c343ba, %g1, %r17
	setx 0xfaecab5b2b9ff7b2, %g1, %r18
	setx 0x886554b7dc1296f6, %g1, %r19
	setx 0xc0f3750ca2bb8095, %g1, %r20
	setx 0x33463f7f110c7031, %g1, %r21
	setx 0xd11c04911a7a7106, %g1, %r22
	setx 0x5c7551338903eb4a, %g1, %r23
	setx 0x20bc7c6a7377687d, %g1, %r24
	setx 0x119030650a0adfe4, %g1, %r25
	setx 0xfb044705fc6312dd, %g1, %r26
	setx 0x314373c6c7bdd6b4, %g1, %r27
	setx 0x034d56b2dcb5ac8f, %g1, %r28
	setx 0xbb7de53d502cb33d, %g1, %r29
	setx 0xd98e30c08344917c, %g1, %r30
	setx 0xa50aa3049fc5f2bb, %g1, %r31
	save
	setx 0x160c896cb32b0cd2, %g1, %r16
	setx 0x318adbf5e8e7ce36, %g1, %r17
	setx 0xda074c07e0890463, %g1, %r18
	setx 0x7cbb5aa3bdf284c1, %g1, %r19
	setx 0xf898c55b988c5510, %g1, %r20
	setx 0x4001b19cd074d107, %g1, %r21
	setx 0x8557720a52b5941e, %g1, %r22
	setx 0xcf4f9f181e45899d, %g1, %r23
	setx 0xef2f911a8fd3b54d, %g1, %r24
	setx 0x3aca5e0af11fc0eb, %g1, %r25
	setx 0x5eaf0d948505d45d, %g1, %r26
	setx 0x5b432e5d9933c601, %g1, %r27
	setx 0x3a5e86d39fedab1a, %g1, %r28
	setx 0x02a7e7be4a73a9e9, %g1, %r29
	setx 0xc1a3e7eefc4ef9a5, %g1, %r30
	setx 0x1ca9a38f7b046007, %g1, %r31
	save
	setx 0x8e4e00602a67c3fd, %g1, %r16
	setx 0xa29f8693f008fed6, %g1, %r17
	setx 0x4ae30c167b88fe47, %g1, %r18
	setx 0xb39722b8755f79b6, %g1, %r19
	setx 0xe3c231c6953cac99, %g1, %r20
	setx 0xd0fc4df23fc0bb34, %g1, %r21
	setx 0x979fc7747c0aee19, %g1, %r22
	setx 0x45b8f93cfbcd98a1, %g1, %r23
	setx 0x087565bdf47a248e, %g1, %r24
	setx 0x2d3b1e601f429e4a, %g1, %r25
	setx 0x53c7d61932038a0e, %g1, %r26
	setx 0x90481b2301189078, %g1, %r27
	setx 0x3cd62dea06a51408, %g1, %r28
	setx 0x77bc5d4ca81fed55, %g1, %r29
	setx 0x4abb8a504f69093c, %g1, %r30
	setx 0x94b654a6ca6f8705, %g1, %r31
	save
	setx 0xaf33916660c75b42, %g1, %r16
	setx 0x0da5642c35202da5, %g1, %r17
	setx 0xa77051d76dcfabb8, %g1, %r18
	setx 0x2ed52c61abe4f45f, %g1, %r19
	setx 0xd9492d5de679c1c2, %g1, %r20
	setx 0xd6f053cb14fe71ee, %g1, %r21
	setx 0x84186b74e33c6f4f, %g1, %r22
	setx 0x7b63c5225c66aa4e, %g1, %r23
	setx 0xd5bad176c21579bf, %g1, %r24
	setx 0xfaa8680143c0c67b, %g1, %r25
	setx 0xaa43214aad160c6d, %g1, %r26
	setx 0xd691081bbe7c3cce, %g1, %r27
	setx 0xdae6b0f33e803e9b, %g1, %r28
	setx 0x10efcabfd8e618e9, %g1, %r29
	setx 0x9e0b10882b1bb760, %g1, %r30
	setx 0x9bf9c4051e897ed3, %g1, %r31
	save
	setx 0xc52fc16b67281372, %g1, %r16
	setx 0xc7b35b13c9f72c3a, %g1, %r17
	setx 0xf988edc80a34140f, %g1, %r18
	setx 0xdb912eb76a52d935, %g1, %r19
	setx 0x48dbf6d3c3ff578e, %g1, %r20
	setx 0x0396719f4bdef52e, %g1, %r21
	setx 0xa5c4e4e750b28901, %g1, %r22
	setx 0xd7b821bc7489d5b8, %g1, %r23
	setx 0x16a39f65780e3ad5, %g1, %r24
	setx 0xd80caf6fc2f51427, %g1, %r25
	setx 0x5a196bae89d29ae0, %g1, %r26
	setx 0x21ffbde2b503009a, %g1, %r27
	setx 0x9eb19aa05d93d6cc, %g1, %r28
	setx 0xa487dc1b298e2a8f, %g1, %r29
	setx 0x36a73abba0593daa, %g1, %r30
	setx 0xd1d3d3a96226bde5, %g1, %r31
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
	.word 0xb9e5e074  ! 1: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x8195e05c  ! 3: WRPR_TPC_I	wrpr	%r23, 0x005c, %tpc
	.word 0xb3643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb150c000  ! 5: RDPR_TT	<illegal instruction>
	.word 0xbd500000  ! 11: RDPR_TPC	<illegal instruction>
	.word 0xb7e4e1d6  ! 17: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbcad4000  ! 19: ANDNcc_R	andncc 	%r21, %r0, %r30
	.word 0x8594a104  ! 22: WRPR_TSTATE_I	wrpr	%r18, 0x0104, %tstate
	.word 0x8795a038  ! 23: WRPR_TT_I	wrpr	%r22, 0x0038, %tt
	.word 0xbfe4213a  ! 26: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e52093  ! 30: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e46086  ! 32: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e4a06b  ! 37: SAVE_I	save	%r18, 0x0001, %r25
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 31)
	.word 0xbfe52039  ! 43: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e56077  ! 44: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe4a13f  ! 45: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb62c8000  ! 46: ANDN_R	andn 	%r18, %r0, %r27
	.word 0xb9e461c5  ! 47: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe4602f  ! 54: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb23d2163  ! 55: XNOR_I	xnor 	%r20, 0x0163, %r25
	.word 0xb3500000  ! 56: RDPR_TPC	<illegal instruction>
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 28)
	.word 0xb9e46049  ! 60: SAVE_I	save	%r17, 0x0001, %r28
	setx	data_start_4, %g1, %r22
	.word 0xb5e4a06d  ! 70: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e4216f  ! 71: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe52006  ! 79: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbe448000  ! 83: ADDC_R	addc 	%r18, %r0, %r31
	.word 0xb7504000  ! 84: RDPR_TNPC	<illegal instruction>
	.word 0xb3540000  ! 90: RDPR_GL	<illegal instruction>
	.word 0xb7351000  ! 91: SRLX_R	srlx	%r20, %r0, %r27
	.word 0xb7508000  ! 92: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e4a021  ! 93: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbb540000  ! 100: RDPR_GL	<illegal instruction>
	.word 0xbd518000  ! 105: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e4206e  ! 112: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e4a09f  ! 113: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e56017  ! 117: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb62da0b6  ! 118: ANDN_I	andn 	%r22, 0x00b6, %r27
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbf518000  ! 123: RDPR_PSTATE	<illegal instruction>
	.word 0xbde56048  ! 127: SAVE_I	save	%r21, 0x0001, %r30
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 31)
	.word 0xb3e5a06f  ! 131: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x8d946034  ! 138: WRPR_PSTATE_I	wrpr	%r17, 0x0034, %pstate
	.word 0xbde5e14e  ! 139: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e4a0d9  ! 142: SAVE_I	save	%r18, 0x0001, %r24
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 31)
	.word 0xbbe5e083  ! 145: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e5e16e  ! 147: SAVE_I	save	%r23, 0x0001, %r27
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 20)
	.word 0xb5e4600a  ! 150: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x9195a091  ! 151: WRPR_PIL_I	wrpr	%r22, 0x0091, %pil
	.word 0xb7e5e1de  ! 154: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbd520000  ! 156: RDPR_PIL	<illegal instruction>
	.word 0xb150c000  ! 157: RDPR_TT	<illegal instruction>
	.word 0x8194e10f  ! 164: WRPR_TPC_I	wrpr	%r19, 0x010f, %tpc
	.word 0xbe9c0000  ! 165: XORcc_R	xorcc 	%r16, %r0, %r31
	.word 0x8995a1ab  ! 166: WRPR_TICK_I	wrpr	%r22, 0x01ab, %tick
	.word 0xbde5e12c  ! 167: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb00461c2  ! 169: ADD_I	add 	%r17, 0x01c2, %r24
	.word 0xbfe5a1a0  ! 172: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1518000  ! 173: RDPR_PSTATE	<illegal instruction>
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbfe5e137  ! 178: SAVE_I	save	%r23, 0x0001, %r31
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 11)
	.word 0x9195a070  ! 186: WRPR_PIL_I	wrpr	%r22, 0x0070, %pil
	.word 0xbe8d6076  ! 187: ANDcc_I	andcc 	%r21, 0x0076, %r31
	.word 0xbfe5e007  ! 192: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe4e05a  ! 195: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e521aa  ! 198: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe5214b  ! 200: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb294209c  ! 207: ORcc_I	orcc 	%r16, 0x009c, %r25
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, e)
	.word 0xb9e561bf  ! 218: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x8395a081  ! 223: WRPR_TNPC_I	wrpr	%r22, 0x0081, %tnpc
	.word 0xb9e561e5  ! 224: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb551c000  ! 227: RDPR_TL	<illegal instruction>
	.word 0xb5e52128  ! 233: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb29521bf  ! 236: ORcc_I	orcc 	%r20, 0x01bf, %r25
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 2a)
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 20)
	.word 0xb5518000  ! 243: RDPR_PSTATE	<illegal instruction>
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 24)
	mov	2, %r12
	.word 0xa1930000  ! 246: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb518000  ! 247: RDPR_PSTATE	<illegal instruction>
	setx	0x79e422b700001dcc, %g1, %r10
	.word 0x839a8000  ! 255: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbbe52166  ! 257: SAVE_I	save	%r20, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0848000  ! 262: ADDcc_R	addcc 	%r18, %r0, %r24
	.word 0xb9e460bc  ! 266: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e5613b  ! 268: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1540000  ! 274: RDPR_GL	<illegal instruction>
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 8)
	.word 0xb7518000  ! 277: RDPR_PSTATE	<illegal instruction>
	.word 0xbf3d1000  ! 279: SRAX_R	srax	%r20, %r0, %r31
	.word 0xb1e4a17d  ! 280: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde5a11e  ! 281: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe461ac  ! 284: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbf3de001  ! 286: SRA_I	sra 	%r23, 0x0001, %r31
	.word 0xb950c000  ! 287: RDPR_TT	<illegal instruction>
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbe2da0f5  ! 290: ANDN_I	andn 	%r22, 0x00f5, %r31
	.word 0xb2c5e1c7  ! 292: ADDCcc_I	addccc 	%r23, 0x01c7, %r25
	.word 0xb5e5e041  ! 294: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x9cb3a08600004805, %g1, %r10
	.word 0x819a8000  ! 295: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb520000  ! 298: RDPR_PIL	<illegal instruction>
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 26)
	.word 0xb1e5e02f  ! 300: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x54c2795e0000ad5f, %g1, %r10
	.word 0x819a8000  ! 301: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 39)
	.word 0xb9500000  ! 303: RDPR_TPC	<illegal instruction>
	.word 0xb1e42070  ! 306: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e5616b  ! 308: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e4e149  ! 312: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e460f2  ! 313: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e5a1b8  ! 314: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe4a0a8  ! 316: SAVE_I	save	%r18, 0x0001, %r29
	setx	data_start_1, %g1, %r17
	.word 0xb1e46157  ! 320: SAVE_I	save	%r17, 0x0001, %r24
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 18)
	.word 0xbf51c000  ! 326: RDPR_TL	<illegal instruction>
	.word 0xb350c000  ! 331: RDPR_TT	<illegal instruction>
	.word 0x919420da  ! 334: WRPR_PIL_I	wrpr	%r16, 0x00da, %pil
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 9)
	.word 0xbfe5e1d5  ! 342: SAVE_I	save	%r23, 0x0001, %r31
	mov	1, %r12
	.word 0x8f930000  ! 345: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe4e0b2  ! 353: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5504000  ! 355: RDPR_TNPC	<illegal instruction>
	.word 0xb7e52082  ! 356: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e4a179  ! 360: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e4e129  ! 361: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbd3c6001  ! 362: SRA_I	sra 	%r17, 0x0001, %r30
	.word 0x839420c8  ! 363: WRPR_TNPC_I	wrpr	%r16, 0x00c8, %tnpc
	.word 0xbf345000  ! 366: SRLX_R	srlx	%r17, %r0, %r31
	.word 0xbbe42099  ! 369: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde4e121  ! 371: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e5e104  ! 372: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbeb4e192  ! 383: ORNcc_I	orncc 	%r19, 0x0192, %r31
	.word 0xbde4e060  ! 384: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e4606a  ! 389: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe5e17a  ! 391: SAVE_I	save	%r23, 0x0001, %r31
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 3f)
	.word 0x8394a093  ! 400: WRPR_TNPC_I	wrpr	%r18, 0x0093, %tnpc
	.word 0x8795e1a3  ! 402: WRPR_TT_I	wrpr	%r23, 0x01a3, %tt
	.word 0xb1e5a14a  ! 403: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e5a0d7  ! 404: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e4a04d  ! 405: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7508000  ! 406: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e56170  ! 414: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e46098  ! 416: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e561d9  ! 418: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e560a6  ! 421: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb73d7001  ! 427: SRAX_I	srax	%r21, 0x0001, %r27
	.word 0xb9e4e096  ! 428: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe4215d  ! 429: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb135d000  ! 430: SRLX_R	srlx	%r23, %r0, %r24
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, c)
	.word 0xb3540000  ! 434: RDPR_GL	<illegal instruction>
	.word 0xbbe4615b  ! 436: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe5e102  ! 438: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e460f9  ! 440: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe5e0cb  ! 450: SAVE_I	save	%r23, 0x0001, %r31
	setx	data_start_2, %g1, %r17
	.word 0xb7e42056  ! 453: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e5a0ba  ! 454: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb750c000  ! 460: RDPR_TT	<illegal instruction>
	.word 0xb04561b1  ! 462: ADDC_I	addc 	%r21, 0x01b1, %r24
	.word 0x89942108  ! 469: WRPR_TICK_I	wrpr	%r16, 0x0108, %tick
	.word 0x8395a1a9  ! 471: WRPR_TNPC_I	wrpr	%r22, 0x01a9, %tnpc
	.word 0xbe3c4000  ! 473: XNOR_R	xnor 	%r17, %r0, %r31
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 4)
	.word 0xb3e42183  ! 476: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5500000  ! 477: RDPR_TPC	<illegal instruction>
	.word 0xbb540000  ! 478: RDPR_GL	<illegal instruction>
	.word 0xb1e4a0e9  ! 481: SAVE_I	save	%r18, 0x0001, %r24
	setx	data_start_3, %g1, %r19
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 32)
	.word 0xb550c000  ! 488: RDPR_TT	<illegal instruction>
	setx	data_start_1, %g1, %r18
	.word 0xb9e5e1df  ! 491: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb73c8000  ! 494: SRA_R	sra 	%r18, %r0, %r27
	.word 0xb23dc000  ! 495: XNOR_R	xnor 	%r23, %r0, %r25
	.word 0xbbe5e06f  ! 496: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7508000  ! 500: RDPR_TSTATE	<illegal instruction>
	.word 0xbf356001  ! 501: SRL_I	srl 	%r21, 0x0001, %r31
	.word 0xb1e42057  ! 503: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbcb4e1ac  ! 504: SUBCcc_I	orncc 	%r19, 0x01ac, %r30
	.word 0xb9e5e025  ! 506: SAVE_I	save	%r23, 0x0001, %r28
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 16)
	setx	data_start_2, %g1, %r23
	.word 0xb1540000  ! 512: RDPR_GL	<illegal instruction>
	.word 0xb49521e0  ! 514: ORcc_I	orcc 	%r20, 0x01e0, %r26
	.word 0xb22c20ff  ! 520: ANDN_I	andn 	%r16, 0x00ff, %r25
	.word 0xb5e56129  ! 521: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e461bd  ! 522: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e5e0ac  ! 523: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e5a043  ! 529: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3480000  ! 531: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb9e420c7  ! 533: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5e4a0b7  ! 534: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e560f9  ! 536: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e520fd  ! 538: SAVE_I	save	%r20, 0x0001, %r26
	mov	1, %r12
	.word 0xa1930000  ! 541: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3504000  ! 542: RDPR_TNPC	<illegal instruction>
	.word 0xbf504000  ! 543: RDPR_TNPC	<illegal instruction>
	.word 0xb3e4e077  ! 548: SAVE_I	save	%r19, 0x0001, %r25
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 12)
	.word 0x8795a060  ! 551: WRPR_TT_I	wrpr	%r22, 0x0060, %tt
	.word 0xb5e5a038  ! 552: SAVE_I	save	%r22, 0x0001, %r26
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 8)
	.word 0xb7e5a03b  ! 555: SAVE_I	save	%r22, 0x0001, %r27
	mov	0, %r12
	.word 0xa1930000  ! 556: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e4601d  ! 557: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe5a011  ! 559: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e521ef  ! 562: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb350c000  ! 563: RDPR_TT	<illegal instruction>
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb1e4610b  ! 567: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe4e1ab  ! 569: SAVE_I	save	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbf510000  ! 571: RDPR_TICK	<illegal instruction>
	.word 0xbb508000  ! 575: RDPR_TSTATE	<illegal instruction>
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 13)
	.word 0x879421f2  ! 577: WRPR_TT_I	wrpr	%r16, 0x01f2, %tt
	.word 0xb7e421e1  ! 578: SAVE_I	save	%r16, 0x0001, %r27
	setx	data_start_1, %g1, %r21
	setx	0x8a6b04c700000fd8, %g1, %r10
	.word 0x819a8000  ! 581: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbd3cb001  ! 582: SRAX_I	srax	%r18, 0x0001, %r30
	.word 0xb5e4e18c  ! 583: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbca50000  ! 584: SUBcc_R	subcc 	%r20, %r0, %r30
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, e)
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb7e520a8  ! 596: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe5e087  ! 597: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbf504000  ! 598: RDPR_TNPC	<illegal instruction>
	.word 0xb3e560cf  ! 602: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x83956061  ! 606: WRPR_TNPC_I	wrpr	%r21, 0x0061, %tnpc
	.word 0xb41c216d  ! 608: XOR_I	xor 	%r16, 0x016d, %r26
	setx	data_start_7, %g1, %r23
	.word 0xb9e420e4  ! 613: SAVE_I	save	%r16, 0x0001, %r28
	setx	data_start_1, %g1, %r18
	.word 0xb3e52042  ! 620: SAVE_I	save	%r20, 0x0001, %r25
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 39)
	.word 0xbbe5604a  ! 625: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb950c000  ! 627: RDPR_TT	<illegal instruction>
	.word 0xbf641800  ! 629: MOVcc_R	<illegal instruction>
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 8)
	.word 0xb1e560bb  ! 633: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe420c8  ! 638: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb951c000  ! 639: RDPR_TL	<illegal instruction>
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, e)
	.word 0xb9508000  ! 646: RDPR_TSTATE	<illegal instruction>
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 3a)
	.word 0x8d946074  ! 650: WRPR_PSTATE_I	wrpr	%r17, 0x0074, %pstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb6b56118  ! 659: ORNcc_I	orncc 	%r21, 0x0118, %r27
	.word 0xb3508000  ! 662: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e4a15a  ! 663: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e5e1cb  ! 668: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe520c7  ! 672: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe4a1fe  ! 673: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x3a188b6a00002fca, %g1, %r10
	.word 0x839a8000  ! 675: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb4b4209a  ! 677: SUBCcc_I	orncc 	%r16, 0x009a, %r26
	.word 0x91952159  ! 686: WRPR_PIL_I	wrpr	%r20, 0x0159, %pil
	.word 0xb7e561c5  ! 687: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe4a1de  ! 688: SAVE_I	save	%r18, 0x0001, %r31
	setx	data_start_6, %g1, %r18
	.word 0xb53da001  ! 691: SRA_I	sra 	%r22, 0x0001, %r26
	.word 0xb9e4a023  ! 693: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb43dc000  ! 694: XNOR_R	xnor 	%r23, %r0, %r26
	.word 0xbbe5616f  ! 696: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e5206b  ! 697: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe52044  ! 699: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb095e132  ! 700: ORcc_I	orcc 	%r23, 0x0132, %r24
	.word 0xbfe52149  ! 701: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1480000  ! 702: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb7e42035  ! 705: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e5e1ff  ! 707: SAVE_I	save	%r23, 0x0001, %r24
	setx	0xe06ae6cd0000ac05, %g1, %r10
	.word 0x819a8000  ! 708: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e4e003  ! 710: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e52195  ! 711: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8d9521b1  ! 714: WRPR_PSTATE_I	wrpr	%r20, 0x01b1, %pstate
	.word 0xbfe4a16c  ! 719: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbd520000  ! 724: RDPR_PIL	<illegal instruction>
	.word 0xb3e521a2  ! 732: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe42162  ! 738: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e5a0d8  ! 742: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb2342110  ! 744: SUBC_I	orn 	%r16, 0x0110, %r25
	.word 0xb9e5a0fb  ! 745: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbd3db001  ! 747: SRAX_I	srax	%r22, 0x0001, %r30
	.word 0xbfe5e0bc  ! 748: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e5a16a  ! 750: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbf7d8400  ! 751: MOVR_R	movre	%r22, %r0, %r31
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 3)
	.word 0xb1e42103  ! 755: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb351c000  ! 757: RDPR_TL	<illegal instruction>
	.word 0xbb500000  ! 762: RDPR_TPC	<illegal instruction>
	.word 0xb1e4201f  ! 767: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde4a038  ! 768: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe4e1b1  ! 769: SAVE_I	save	%r19, 0x0001, %r29
	mov	1, %r12
	.word 0x8f930000  ! 774: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	1, %r12
	.word 0xa1930000  ! 775: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e520f0  ! 777: SAVE_I	save	%r20, 0x0001, %r27
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 3b)
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 15)
	.word 0xbde5219e  ! 781: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb43421e3  ! 782: ORN_I	orn 	%r16, 0x01e3, %r26
	.word 0xbd520000  ! 785: RDPR_PIL	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 786: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbde4606d  ! 788: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde42175  ! 789: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e56176  ! 790: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e521f2  ! 794: SAVE_I	save	%r20, 0x0001, %r24
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 13)
	.word 0xbcb5a17b  ! 797: SUBCcc_I	orncc 	%r22, 0x017b, %r30
	.word 0xb5e5202a  ! 798: SAVE_I	save	%r20, 0x0001, %r26
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb7e52096  ! 800: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde5e164  ! 809: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbf50c000  ! 810: RDPR_TT	<illegal instruction>
	.word 0xb1e521fa  ! 816: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e561c1  ! 817: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e5a044  ! 819: SAVE_I	save	%r22, 0x0001, %r25
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 28)
	.word 0xbaa58000  ! 827: SUBcc_R	subcc 	%r22, %r0, %r29
	.word 0xb5504000  ! 829: RDPR_TNPC	<illegal instruction>
	.word 0x8d94a074  ! 831: WRPR_PSTATE_I	wrpr	%r18, 0x0074, %pstate
	.word 0x8395e04e  ! 832: WRPR_TNPC_I	wrpr	%r23, 0x004e, %tnpc
	.word 0xb444c000  ! 833: ADDC_R	addc 	%r19, %r0, %r26
	.word 0xb9e420d5  ! 835: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1508000  ! 836: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e520dc  ! 839: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbb500000  ! 848: RDPR_TPC	<illegal instruction>
	.word 0xbbe5a1a8  ! 851: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5480000  ! 852: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbfe5a11b  ! 856: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe4615c  ! 857: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe5a02f  ! 858: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe4e070  ! 867: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8195a11b  ! 868: WRPR_TPC_I	wrpr	%r22, 0x011b, %tpc
	.word 0xb3e46122  ! 870: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e46020  ! 874: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x81942088  ! 880: WRPR_TPC_I	wrpr	%r16, 0x0088, %tpc
	.word 0x8595a174  ! 882: WRPR_TSTATE_I	wrpr	%r22, 0x0174, %tstate
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e4a02b  ! 886: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde4a0b6  ! 887: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9500000  ! 889: RDPR_TPC	<illegal instruction>
	.word 0xbc250000  ! 891: SUB_R	sub 	%r20, %r0, %r30
	.word 0xb7e4a041  ! 894: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e56181  ! 895: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e56027  ! 897: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1500000  ! 898: RDPR_TPC	<illegal instruction>
	.word 0xbbe4a196  ! 899: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe46180  ! 900: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbaa5e11b  ! 901: SUBcc_I	subcc 	%r23, 0x011b, %r29
	.word 0xbde4e006  ! 904: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe4a0fd  ! 906: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e4a0e9  ! 907: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e4e04a  ! 909: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb2348000  ! 910: ORN_R	orn 	%r18, %r0, %r25
	.word 0xbbe460d6  ! 911: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e42151  ! 912: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e5612d  ! 913: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb2140000  ! 915: OR_R	or 	%r16, %r0, %r25
	.word 0xb5e420bc  ! 917: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e46103  ! 918: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 29)
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 16)
	.word 0xb5e52137  ! 922: SAVE_I	save	%r20, 0x0001, %r26
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, e)
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, f)
	.word 0xb3e4610e  ! 933: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e4611b  ! 937: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e5a02d  ! 938: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7480000  ! 940: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb81c8000  ! 942: XOR_R	xor 	%r18, %r0, %r28
	.word 0xbde4a169  ! 948: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe460ee  ! 949: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb92dd000  ! 951: SLLX_R	sllx	%r23, %r0, %r28
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 1a)
hwintr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_45), 16, 16)) -> intp(0, 0, 24)
	.word 0xb5e5203e  ! 958: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe5e0fb  ! 959: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e42117  ! 960: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e421ca  ! 964: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e4a0c6  ! 971: SAVE_I	save	%r18, 0x0001, %r26
	setx	data_start_1, %g1, %r20
	setx	data_start_5, %g1, %r21
	.word 0xb1e42160  ! 984: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb814e1ad  ! 987: OR_I	or 	%r19, 0x01ad, %r28
	.word 0x9195a132  ! 989: WRPR_PIL_I	wrpr	%r22, 0x0132, %pil
hwintr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_46), 16, 16)) -> intp(0, 0, 12)
	.word 0xb7e52073  ! 997: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e561ce  ! 998: SAVE_I	save	%r21, 0x0001, %r25
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
	.word 0x81946120  ! 3: WRPR_TPC_I	wrpr	%r17, 0x0120, %tpc
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xbf50c000  ! 5: RDPR_TT	rdpr	%tt, %r31
	.word 0xf674e043  ! 6: STX_I	stx	%r27, [%r19 + 0x0043]
	.word 0xf83c605a  ! 8: STD_I	std	%r28, [%r17 + 0x005a]
	.word 0xfc2d2080  ! 10: STB_I	stb	%r30, [%r20 + 0x0080]
	.word 0xb3500000  ! 11: RDPR_TPC	<illegal instruction>
	.word 0xf73c4000  ! 12: STDF_R	std	%f27, [%r0, %r17]
	.word 0xf53d2130  ! 13: STDF_I	std	%f26, [0x0130, %r20]
	.word 0xbeacc000  ! 19: ANDNcc_R	andncc 	%r19, %r0, %r31
	.word 0xf63d8000  ! 21: STD_R	std	%r27, [%r22 + %r0]
	.word 0x859460d5  ! 22: WRPR_TSTATE_I	wrpr	%r17, 0x00d5, %tstate
	.word 0x8794e130  ! 23: WRPR_TT_I	wrpr	%r19, 0x0130, %tt
	.word 0xfa2c2173  ! 27: STB_I	stb	%r29, [%r16 + 0x0173]
	.word 0xf87421f7  ! 29: STX_I	stx	%r28, [%r16 + 0x01f7]
	.word 0xfa240000  ! 31: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xfa25c000  ! 33: STW_R	stw	%r29, [%r23 + %r0]
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 30)
	.word 0xfa3c61cc  ! 40: STD_I	std	%r29, [%r17 + 0x01cc]
	.word 0xfc3c2014  ! 42: STD_I	std	%r30, [%r16 + 0x0014]
	.word 0xbc2c4000  ! 46: ANDN_R	andn 	%r17, %r0, %r30
	.word 0xf234603d  ! 50: STH_I	sth	%r25, [%r17 + 0x003d]
	.word 0xf82dc000  ! 51: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xb63ca165  ! 55: XNOR_I	xnor 	%r18, 0x0165, %r27
	.word 0xb5500000  ! 56: RDPR_TPC	rdpr	%tpc, %r26
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 0)
	setx	data_start_7, %g1, %r17
	.word 0xf93de013  ! 64: STDF_I	std	%f28, [0x0013, %r23]
	.word 0xf33ce11d  ! 65: STDF_I	std	%f25, [0x011d, %r19]
	.word 0xf825a1c3  ! 69: STW_I	stw	%r28, [%r22 + 0x01c3]
	.word 0xff3d6194  ! 76: STDF_I	std	%f31, [0x0194, %r21]
	.word 0xf63d6094  ! 81: STD_I	std	%r27, [%r21 + 0x0094]
	.word 0xf6758000  ! 82: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xbc448000  ! 83: ADDC_R	addc 	%r18, %r0, %r30
	.word 0xb1504000  ! 84: RDPR_TNPC	<illegal instruction>
	.word 0xf83c8000  ! 86: STD_R	std	%r28, [%r18 + %r0]
	.word 0xf73de145  ! 87: STDF_I	std	%f27, [0x0145, %r23]
	.word 0xbb540000  ! 90: RDPR_GL	<illegal instruction>
	.word 0xb1355000  ! 91: SRLX_R	srlx	%r21, %r0, %r24
	.word 0xb3508000  ! 92: RDPR_TSTATE	<illegal instruction>
	.word 0xf93d8000  ! 98: STDF_R	std	%f28, [%r0, %r22]
	.word 0xbd540000  ! 100: RDPR_GL	<illegal instruction>
	.word 0xbd518000  ! 105: RDPR_PSTATE	<illegal instruction>
	.word 0xfe3dc000  ! 106: STD_R	std	%r31, [%r23 + %r0]
	.word 0xfc7420b8  ! 110: STX_I	stx	%r30, [%r16 + 0x00b8]
	.word 0xbc2c2035  ! 118: ANDN_I	andn 	%r16, 0x0035, %r30
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 36)
	.word 0xf93c0000  ! 121: STDF_R	std	%f28, [%r0, %r16]
	.word 0xf82d2174  ! 122: STB_I	stb	%r28, [%r20 + 0x0174]
	.word 0xb1518000  ! 123: RDPR_PSTATE	<illegal instruction>
	.word 0xfc348000  ! 128: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xf6744000  ! 129: STX_R	stx	%r27, [%r17 + %r0]
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, b)
	.word 0xf4740000  ! 132: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xf33dc000  ! 135: STDF_R	std	%f25, [%r0, %r23]
	.word 0xf33d0000  ! 136: STDF_R	std	%f25, [%r0, %r20]
	.word 0x8d9420dd  ! 138: WRPR_PSTATE_I	wrpr	%r16, 0x00dd, %pstate
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, d)
	.word 0xf82c4000  ! 146: STB_R	stb	%r28, [%r17 + %r0]
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 1a)
	.word 0x919520ca  ! 151: WRPR_PIL_I	wrpr	%r20, 0x00ca, %pil
	.word 0xf8740000  ! 152: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xbd520000  ! 156: RDPR_PIL	rdpr	%pil, %r30
	.word 0xb950c000  ! 157: RDPR_TT	<illegal instruction>
	.word 0xf82cc000  ! 159: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xfe348000  ! 161: STH_R	sth	%r31, [%r18 + %r0]
	.word 0x81952054  ! 164: WRPR_TPC_I	wrpr	%r20, 0x0054, %tpc
	.word 0xb49d4000  ! 165: XORcc_R	xorcc 	%r21, %r0, %r26
	.word 0x89952018  ! 166: WRPR_TICK_I	wrpr	%r20, 0x0018, %tick
	.word 0xb0056107  ! 169: ADD_I	add 	%r21, 0x0107, %r24
	.word 0xf23c6090  ! 170: STD_I	std	%r25, [%r17 + 0x0090]
	.word 0xb3518000  ! 173: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xf224c000  ! 176: STW_R	stw	%r25, [%r19 + %r0]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 29)
	.word 0xfa2dc000  ! 179: STB_R	stb	%r29, [%r23 + %r0]
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfe3cc000  ! 185: STD_R	std	%r31, [%r19 + %r0]
	.word 0x919420fc  ! 186: WRPR_PIL_I	wrpr	%r16, 0x00fc, %pil
	.word 0xb68d6104  ! 187: ANDcc_I	andcc 	%r21, 0x0104, %r27
	.word 0xfe354000  ! 196: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf13cc000  ! 203: STDF_R	std	%f24, [%r0, %r19]
	.word 0xf63ca1a3  ! 205: STD_I	std	%r27, [%r18 + 0x01a3]
	.word 0xfb3ca0b1  ! 206: STDF_I	std	%f29, [0x00b1, %r18]
	.word 0xb49560da  ! 207: ORcc_I	orcc 	%r21, 0x00da, %r26
	.word 0xf03d61b9  ! 208: STD_I	std	%r24, [%r21 + 0x01b9]
	.word 0xfa24c000  ! 211: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf03da078  ! 212: STD_I	std	%r24, [%r22 + 0x0078]
	.word 0xf635e070  ! 215: STH_I	sth	%r27, [%r23 + 0x0070]
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, e)
	.word 0xf035c000  ! 221: STH_R	sth	%r24, [%r23 + %r0]
	.word 0x839421d3  ! 223: WRPR_TNPC_I	wrpr	%r16, 0x01d3, %tnpc
	.word 0xbf51c000  ! 227: RDPR_TL	rdpr	%tl, %r31
	.word 0xf73d4000  ! 228: STDF_R	std	%f27, [%r0, %r21]
	.word 0xfa240000  ! 234: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xb295a10e  ! 236: ORcc_I	orcc 	%r22, 0x010e, %r25
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 18)
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 22)
	.word 0xb9518000  ! 243: RDPR_PSTATE	<illegal instruction>
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 38)
	mov	2, %r12
	.word 0xa1930000  ! 246: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb518000  ! 247: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xf93c4000  ! 250: STDF_R	std	%f28, [%r0, %r17]
	setx	0x31d31b80000cad3, %g1, %r10
	.word 0x839a8000  ! 255: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf4740000  ! 259: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xf6740000  ! 260: STX_R	stx	%r27, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc85c000  ! 262: ADDcc_R	addcc 	%r23, %r0, %r30
	.word 0xf6350000  ! 263: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xf874c000  ! 270: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xb7540000  ! 274: RDPR_GL	rdpr	%-, %r27
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb7518000  ! 277: RDPR_PSTATE	<illegal instruction>
	.word 0xfc354000  ! 278: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xbf3d9000  ! 279: SRAX_R	srax	%r22, %r0, %r31
	.word 0xf03d2051  ! 283: STD_I	std	%r24, [%r20 + 0x0051]
	.word 0xf93ca003  ! 285: STDF_I	std	%f28, [0x0003, %r18]
	.word 0xbb3de001  ! 286: SRA_I	sra 	%r23, 0x0001, %r29
	.word 0xb150c000  ! 287: RDPR_TT	<illegal instruction>
	.word 0xfa2c2079  ! 288: STB_I	stb	%r29, [%r16 + 0x0079]
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 1b)
	.word 0xb62ce0c8  ! 290: ANDN_I	andn 	%r19, 0x00c8, %r27
	.word 0xfe254000  ! 291: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xbcc5a128  ! 292: ADDCcc_I	addccc 	%r22, 0x0128, %r30
	setx	0x37959a3e00001f00, %g1, %r10
	.word 0x819a8000  ! 295: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbd520000  ! 298: RDPR_PIL	rdpr	%pil, %r30
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 5)
	setx	0x8dd2e12b0000ed5b, %g1, %r10
	.word 0x819a8000  ! 301: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 2b)
	.word 0xbf500000  ! 303: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf82c612e  ! 304: STB_I	stb	%r28, [%r17 + 0x012e]
	.word 0xf8242111  ! 305: STW_I	stw	%r28, [%r16 + 0x0111]
	.word 0xfe7461bc  ! 307: STX_I	stx	%r31, [%r17 + 0x01bc]
	.word 0xf434c000  ! 311: STH_R	sth	%r26, [%r19 + %r0]
	setx	data_start_5, %g1, %r20
	.word 0xfe754000  ! 321: STX_R	stx	%r31, [%r21 + %r0]
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfd3d0000  ! 323: STDF_R	std	%f30, [%r0, %r20]
	.word 0xf0358000  ! 325: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xbf51c000  ! 326: RDPR_TL	<illegal instruction>
	.word 0xb950c000  ! 331: RDPR_TT	<illegal instruction>
	.word 0xfe35209e  ! 332: STH_I	sth	%r31, [%r20 + 0x009e]
	.word 0x919461bf  ! 334: WRPR_PIL_I	wrpr	%r17, 0x01bf, %pil
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 30)
	.word 0xfe3de175  ! 340: STD_I	std	%r31, [%r23 + 0x0175]
	mov	1, %r12
	.word 0x8f930000  ! 345: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe2c8000  ! 350: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf8744000  ! 354: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xbb504000  ! 355: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xf6254000  ! 358: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xb93c6001  ! 362: SRA_I	sra 	%r17, 0x0001, %r28
	.word 0x8395a18a  ! 363: WRPR_TNPC_I	wrpr	%r22, 0x018a, %tnpc
	.word 0xbf34d000  ! 366: SRLX_R	srlx	%r19, %r0, %r31
	.word 0xf875a185  ! 376: STX_I	stx	%r28, [%r22 + 0x0185]
	.word 0xf93c21af  ! 381: STDF_I	std	%f28, [0x01af, %r16]
	.word 0xfc2c0000  ! 382: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xb8b420f4  ! 383: ORNcc_I	orncc 	%r16, 0x00f4, %r28
	.word 0xf23ce17d  ! 386: STD_I	std	%r25, [%r19 + 0x017d]
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 11)
	.word 0xf42d0000  ! 393: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xf8758000  ! 399: STX_R	stx	%r28, [%r22 + %r0]
	.word 0x8395a019  ! 400: WRPR_TNPC_I	wrpr	%r22, 0x0019, %tnpc
	.word 0x879561a9  ! 402: WRPR_TT_I	wrpr	%r21, 0x01a9, %tt
	.word 0xb3508000  ! 406: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xf62c8000  ! 408: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xfc748000  ! 409: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf02d212a  ! 413: STB_I	stb	%r24, [%r20 + 0x012a]
	.word 0xf4356020  ! 422: STH_I	sth	%r26, [%r21 + 0x0020]
	.word 0xf875e074  ! 424: STX_I	stx	%r28, [%r23 + 0x0074]
	.word 0xbf3df001  ! 427: SRAX_I	srax	%r23, 0x0001, %r31
	.word 0xbf349000  ! 430: SRLX_R	srlx	%r18, %r0, %r31
	.word 0xf23c4000  ! 431: STD_R	std	%r25, [%r17 + %r0]
	.word 0xf82c4000  ! 432: STB_R	stb	%r28, [%r17 + %r0]
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 12)
	.word 0xb3540000  ! 434: RDPR_GL	<illegal instruction>
	.word 0xfc2d4000  ! 435: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xfd3c8000  ! 446: STDF_R	std	%f30, [%r0, %r18]
	.word 0xfb3c4000  ! 447: STDF_R	std	%f29, [%r0, %r17]
	.word 0xf63561b1  ! 448: STH_I	sth	%r27, [%r21 + 0x01b1]
	setx	data_start_7, %g1, %r20
	.word 0xfe75e1fb  ! 456: STX_I	stx	%r31, [%r23 + 0x01fb]
	.word 0xf275c000  ! 458: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xbb50c000  ! 460: RDPR_TT	<illegal instruction>
	.word 0xb04561db  ! 462: ADDC_I	addc 	%r21, 0x01db, %r24
	.word 0xfe2561ee  ! 468: STW_I	stw	%r31, [%r21 + 0x01ee]
	.word 0x899461e1  ! 469: WRPR_TICK_I	wrpr	%r17, 0x01e1, %tick
	.word 0x83946062  ! 471: WRPR_TNPC_I	wrpr	%r17, 0x0062, %tnpc
	.word 0xbe3d0000  ! 473: XNOR_R	xnor 	%r20, %r0, %r31
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 21)
	.word 0xfa75e11c  ! 475: STX_I	stx	%r29, [%r23 + 0x011c]
	.word 0xb3500000  ! 477: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xb3540000  ! 478: RDPR_GL	<illegal instruction>
	.word 0xf835a1be  ! 482: STH_I	sth	%r28, [%r22 + 0x01be]
	setx	data_start_5, %g1, %r19
	.word 0xfc3d8000  ! 486: STD_R	std	%r30, [%r22 + %r0]
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 30)
	.word 0xb350c000  ! 488: RDPR_TT	<illegal instruction>
	setx	data_start_0, %g1, %r23
	.word 0xfb3c0000  ! 493: STDF_R	std	%f29, [%r0, %r16]
	.word 0xb53d4000  ! 494: SRA_R	sra 	%r21, %r0, %r26
	.word 0xbc3cc000  ! 495: XNOR_R	xnor 	%r19, %r0, %r30
	.word 0xf8240000  ! 497: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xf82dc000  ! 499: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xb9508000  ! 500: RDPR_TSTATE	<illegal instruction>
	.word 0xbd34a001  ! 501: SRL_I	srl 	%r18, 0x0001, %r30
	.word 0xf0246106  ! 502: STW_I	stw	%r24, [%r17 + 0x0106]
	.word 0xbeb560a1  ! 504: SUBCcc_I	orncc 	%r21, 0x00a1, %r31
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 23)
	setx	data_start_4, %g1, %r17
	.word 0xb1540000  ! 512: RDPR_GL	<illegal instruction>
	.word 0xbe942058  ! 514: ORcc_I	orcc 	%r16, 0x0058, %r31
	.word 0xf274c000  ! 515: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf43d4000  ! 516: STD_R	std	%r26, [%r21 + %r0]
	.word 0xf474c000  ! 517: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xbc2da037  ! 520: ANDN_I	andn 	%r22, 0x0037, %r30
	.word 0xfd3ce1ea  ! 524: STDF_I	std	%f30, [0x01ea, %r19]
	.word 0xb9480000  ! 531: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xff3c6037  ! 537: STDF_I	std	%f31, [0x0037, %r17]
	.word 0xf82de090  ! 539: STB_I	stb	%r28, [%r23 + 0x0090]
	mov	2, %r12
	.word 0xa1930000  ! 541: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3504000  ! 542: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xb7504000  ! 543: RDPR_TNPC	<illegal instruction>
	.word 0xf2744000  ! 546: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xfe2d6012  ! 549: STB_I	stb	%r31, [%r21 + 0x0012]
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 3e)
	.word 0x8795a0ee  ! 551: WRPR_TT_I	wrpr	%r22, 0x00ee, %tt
	.word 0xfa3c8000  ! 553: STD_R	std	%r29, [%r18 + %r0]
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 0)
	mov	0, %r12
	.word 0xa1930000  ! 556: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf73c0000  ! 560: STDF_R	std	%f27, [%r0, %r16]
	.word 0xb150c000  ! 563: RDPR_TT	rdpr	%tt, %r24
	.word 0xf22c0000  ! 564: STB_R	stb	%r25, [%r16 + %r0]
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 30)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb510000  ! 571: RDPR_TICK	<illegal instruction>
	.word 0xbd508000  ! 575: RDPR_TSTATE	<illegal instruction>
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 2)
	.word 0x87946190  ! 577: WRPR_TT_I	wrpr	%r17, 0x0190, %tt
	setx	data_start_5, %g1, %r18
	setx	0xb4df75400000a9df, %g1, %r10
	.word 0x819a8000  ! 581: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb93d7001  ! 582: SRAX_I	srax	%r21, 0x0001, %r28
	.word 0xbaa4c000  ! 584: SUBcc_R	subcc 	%r19, %r0, %r29
	.word 0xf43c0000  ! 586: STD_R	std	%r26, [%r16 + %r0]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 11)
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 3)
	.word 0xf42420a0  ! 595: STW_I	stw	%r26, [%r16 + 0x00a0]
	.word 0xbb504000  ! 598: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xf82cc000  ! 604: STB_R	stb	%r28, [%r19 + %r0]
	.word 0x8394a0ab  ! 606: WRPR_TNPC_I	wrpr	%r18, 0x00ab, %tnpc
	.word 0xb61c6160  ! 608: XOR_I	xor 	%r17, 0x0160, %r27
	.word 0xf8354000  ! 609: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf82da05b  ! 611: STB_I	stb	%r28, [%r22 + 0x005b]
	setx	data_start_0, %g1, %r19
	.word 0xfe3cc000  ! 614: STD_R	std	%r31, [%r19 + %r0]
	.word 0xf42c207a  ! 616: STB_I	stb	%r26, [%r16 + 0x007a]
	setx	data_start_0, %g1, %r17
	.word 0xf2246190  ! 619: STW_I	stw	%r25, [%r17 + 0x0190]
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 1)
	.word 0xf0354000  ! 626: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xb950c000  ! 627: RDPR_TT	rdpr	%tt, %r28
	.word 0xbd641800  ! 629: MOVcc_R	<illegal instruction>
	.word 0xf8750000  ! 630: STX_R	stx	%r28, [%r20 + %r0]
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, b)
	.word 0xfa34a0f2  ! 635: STH_I	sth	%r29, [%r18 + 0x00f2]
	.word 0xff3d6126  ! 636: STDF_I	std	%f31, [0x0126, %r21]
	.word 0xbb51c000  ! 639: RDPR_TL	<illegal instruction>
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 11)
	.word 0xff3d2066  ! 641: STDF_I	std	%f31, [0x0066, %r20]
	.word 0xfa74c000  ! 644: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xf8254000  ! 645: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xb7508000  ! 646: RDPR_TSTATE	<illegal instruction>
	.word 0xfa248000  ! 648: STW_R	stw	%r29, [%r18 + %r0]
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 6)
	.word 0x8d95a046  ! 650: WRPR_PSTATE_I	wrpr	%r22, 0x0046, %pstate
	.word 0xfa24a079  ! 656: STW_I	stw	%r29, [%r18 + 0x0079]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf035e0d3  ! 658: STH_I	sth	%r24, [%r23 + 0x00d3]
	.word 0xb6b42195  ! 659: ORNcc_I	orncc 	%r16, 0x0195, %r27
	.word 0xf73dc000  ! 660: STDF_R	std	%f27, [%r0, %r23]
	.word 0xfd3de172  ! 661: STDF_I	std	%f30, [0x0172, %r23]
	.word 0xb1508000  ! 662: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf93c4000  ! 665: STDF_R	std	%f28, [%r0, %r17]
	.word 0xf8752178  ! 666: STX_I	stx	%r28, [%r20 + 0x0178]
	.word 0xfa3c606d  ! 667: STD_I	std	%r29, [%r17 + 0x006d]
	.word 0xf02d8000  ! 671: STB_R	stb	%r24, [%r22 + %r0]
	setx	0xb7ac5bfb0000399b, %g1, %r10
	.word 0x839a8000  ! 675: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb8b5205e  ! 677: SUBCcc_I	orncc 	%r20, 0x005e, %r28
	.word 0xfc3461ed  ! 683: STH_I	sth	%r30, [%r17 + 0x01ed]
	.word 0xf4348000  ! 685: STH_R	sth	%r26, [%r18 + %r0]
	.word 0x9194e162  ! 686: WRPR_PIL_I	wrpr	%r19, 0x0162, %pil
	setx	data_start_5, %g1, %r16
	.word 0xbf3d6001  ! 691: SRA_I	sra 	%r21, 0x0001, %r31
	.word 0xb23c8000  ! 694: XNOR_R	xnor 	%r18, %r0, %r25
	.word 0xb6952192  ! 700: ORcc_I	orcc 	%r20, 0x0192, %r27
	.word 0xb3480000  ! 702: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf82d60b6  ! 703: STB_I	stb	%r28, [%r21 + 0x00b6]
	setx	0xe452a7fd0000da06, %g1, %r10
	.word 0x819a8000  ! 708: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe74e0fe  ! 709: STX_I	stx	%r31, [%r19 + 0x00fe]
	.word 0xf024a1fe  ! 713: STW_I	stw	%r24, [%r18 + 0x01fe]
	.word 0x8d95a0e8  ! 714: WRPR_PSTATE_I	wrpr	%r22, 0x00e8, %pstate
	.word 0xf235a179  ! 716: STH_I	sth	%r25, [%r22 + 0x0179]
	.word 0xf83de195  ! 717: STD_I	std	%r28, [%r23 + 0x0195]
	.word 0xf234c000  ! 720: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xbf520000  ! 724: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf6744000  ! 726: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xfa356139  ! 737: STH_I	sth	%r29, [%r21 + 0x0139]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2758000  ! 740: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xf8244000  ! 743: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xb434e079  ! 744: SUBC_I	orn 	%r19, 0x0079, %r26
	.word 0xf82de156  ! 746: STB_I	stb	%r28, [%r23 + 0x0156]
	.word 0xbd3cb001  ! 747: SRAX_I	srax	%r18, 0x0001, %r30
	.word 0xbd7d8400  ! 751: MOVR_R	movre	%r22, %r0, %r30
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 39)
	.word 0xb151c000  ! 757: RDPR_TL	<illegal instruction>
	.word 0xfe75a0c8  ! 759: STX_I	stx	%r31, [%r22 + 0x00c8]
	.word 0xfc746020  ! 761: STX_I	stx	%r30, [%r17 + 0x0020]
	.word 0xbd500000  ! 762: RDPR_TPC	<illegal instruction>
	.word 0xfe3ca0de  ! 765: STD_I	std	%r31, [%r18 + 0x00de]
	.word 0xf93c8000  ! 771: STDF_R	std	%f28, [%r0, %r18]
	.word 0xff3da18b  ! 772: STDF_I	std	%f31, [0x018b, %r22]
	mov	0, %r12
	.word 0x8f930000  ! 774: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0, %r12
	.word 0xa1930000  ! 775: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 3e)
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 12)
	.word 0xbe35606e  ! 782: ORN_I	orn 	%r21, 0x006e, %r31
	.word 0xf62dc000  ! 784: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xb5520000  ! 785: RDPR_PIL	rdpr	%pil, %r26
	mov	0, %r12
	.word 0x8f930000  ! 786: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa354000  ! 787: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf63dc000  ! 791: STD_R	std	%r27, [%r23 + %r0]
	.word 0xf0258000  ! 793: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xf27521bc  ! 795: STX_I	stx	%r25, [%r20 + 0x01bc]
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 33)
	.word 0xb6b421c1  ! 797: SUBCcc_I	orncc 	%r16, 0x01c1, %r27
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf424e014  ! 801: STW_I	stw	%r26, [%r19 + 0x0014]
	.word 0xf634a093  ! 802: STH_I	sth	%r27, [%r18 + 0x0093]
	.word 0xfe35a13e  ! 808: STH_I	sth	%r31, [%r22 + 0x013e]
	.word 0xbf50c000  ! 810: RDPR_TT	rdpr	%tt, %r31
	.word 0xf33cc000  ! 811: STDF_R	std	%f25, [%r0, %r19]
	.word 0xfe2dc000  ! 812: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xfe24c000  ! 813: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xfc2ca0a6  ! 815: STB_I	stb	%r30, [%r18 + 0x00a6]
	.word 0xf434e1c9  ! 820: STH_I	sth	%r26, [%r19 + 0x01c9]
	.word 0xf53c4000  ! 822: STDF_R	std	%f26, [%r0, %r17]
	.word 0xfe744000  ! 823: STX_R	stx	%r31, [%r17 + %r0]
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 37)
	.word 0xb2a58000  ! 827: SUBcc_R	subcc 	%r22, %r0, %r25
	.word 0xf82421b1  ! 828: STW_I	stw	%r28, [%r16 + 0x01b1]
	.word 0xbb504000  ! 829: RDPR_TNPC	<illegal instruction>
	.word 0x8d9421db  ! 831: WRPR_PSTATE_I	wrpr	%r16, 0x01db, %pstate
	.word 0x83956031  ! 832: WRPR_TNPC_I	wrpr	%r21, 0x0031, %tnpc
	.word 0xb8444000  ! 833: ADDC_R	addc 	%r17, %r0, %r28
	.word 0xbb508000  ! 836: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xfc74e11a  ! 837: STX_I	stx	%r30, [%r19 + 0x011a]
	.word 0xf034a1a3  ! 838: STH_I	sth	%r24, [%r18 + 0x01a3]
	.word 0xfa3ce1b6  ! 840: STD_I	std	%r29, [%r19 + 0x01b6]
	.word 0xfe756022  ! 843: STX_I	stx	%r31, [%r21 + 0x0022]
	.word 0xfc34c000  ! 846: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xbd500000  ! 848: RDPR_TPC	<illegal instruction>
	.word 0xb1480000  ! 852: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf0256171  ! 859: STW_I	stw	%r24, [%r21 + 0x0171]
	.word 0xf074203f  ! 861: STX_I	stx	%r24, [%r16 + 0x003f]
	.word 0xf43c60e6  ! 865: STD_I	std	%r26, [%r17 + 0x00e6]
	.word 0x8194e08e  ! 868: WRPR_TPC_I	wrpr	%r19, 0x008e, %tpc
	.word 0xf53d0000  ! 872: STDF_R	std	%f26, [%r0, %r20]
	.word 0xf43c6160  ! 875: STD_I	std	%r26, [%r17 + 0x0160]
	.word 0x8194e057  ! 880: WRPR_TPC_I	wrpr	%r19, 0x0057, %tpc
	.word 0x85956015  ! 882: WRPR_TSTATE_I	wrpr	%r21, 0x0015, %tstate
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf53da0f3  ! 885: STDF_I	std	%f26, [0x00f3, %r22]
	.word 0xb9500000  ! 889: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xb4258000  ! 891: SUB_R	sub 	%r22, %r0, %r26
	.word 0xf624c000  ! 892: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xf8742197  ! 896: STX_I	stx	%r28, [%r16 + 0x0197]
	.word 0xb9500000  ! 898: RDPR_TPC	<illegal instruction>
	.word 0xb2a4e116  ! 901: SUBcc_I	subcc 	%r19, 0x0116, %r25
	.word 0xf6250000  ! 902: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xfa24e0e1  ! 903: STW_I	stw	%r29, [%r19 + 0x00e1]
	.word 0xfc358000  ! 908: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xb0348000  ! 910: ORN_R	orn 	%r18, %r0, %r24
	.word 0xb4150000  ! 915: OR_R	or 	%r20, %r0, %r26
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 32)
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 31)
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 21)
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 21)
	.word 0xf83d8000  ! 926: STD_R	std	%r28, [%r22 + %r0]
	.word 0xf8354000  ! 928: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xfc756061  ! 929: STX_I	stx	%r30, [%r21 + 0x0061]
	.word 0xf834c000  ! 939: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xbb480000  ! 940: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbe1c8000  ! 942: XOR_R	xor 	%r18, %r0, %r31
	.word 0xbb2c5000  ! 951: SLLX_R	sllx	%r17, %r0, %r29
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, d)
hwintr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_45), 16, 16)) -> intp(3, 0, 25)
	.word 0xf02d2039  ! 957: STB_I	stb	%r24, [%r20 + 0x0039]
	.word 0xfe356144  ! 961: STH_I	sth	%r31, [%r21 + 0x0144]
	.word 0xf4242042  ! 970: STW_I	stw	%r26, [%r16 + 0x0042]
	setx	data_start_7, %g1, %r18
	setx	data_start_5, %g1, %r23
	.word 0xfb3cc000  ! 979: STDF_R	std	%f29, [%r0, %r19]
	.word 0xf4354000  ! 982: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xfc2de1ec  ! 985: STB_I	stb	%r30, [%r23 + 0x01ec]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb2142016  ! 987: OR_I	or 	%r16, 0x0016, %r25
	.word 0xff3c0000  ! 988: STDF_R	std	%f31, [%r0, %r16]
	.word 0x9195a1a0  ! 989: WRPR_PIL_I	wrpr	%r22, 0x01a0, %pil
	.word 0xf4254000  ! 994: STW_R	stw	%r26, [%r21 + %r0]
hwintr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_46), 16, 16)) -> intp(3, 0, 23)
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
	.word 0x8194617e  ! 3: WRPR_TPC_I	wrpr	%r17, 0x017e, %tpc
	.word 0xbb643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb950c000  ! 5: RDPR_TT	rdpr	%tt, %r28
	.word 0xf45d4000  ! 7: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xb5500000  ! 11: RDPR_TPC	<illegal instruction>
	.word 0xf444e1d7  ! 14: LDSW_I	ldsw	[%r19 + 0x01d7], %r26
	.word 0xfc15e0d8  ! 15: LDUH_I	lduh	[%r23 + 0x00d8], %r30
	.word 0xb2ac8000  ! 19: ANDNcc_R	andncc 	%r18, %r0, %r25
	.word 0xf00c4000  ! 20: LDUB_R	ldub	[%r17 + %r0], %r24
	.word 0x8594e1dc  ! 22: WRPR_TSTATE_I	wrpr	%r19, 0x01dc, %tstate
	.word 0x8794a1f4  ! 23: WRPR_TT_I	wrpr	%r18, 0x01f4, %tt
	.word 0xfe546196  ! 28: LDSH_I	ldsh	[%r17 + 0x0196], %r31
	.word 0xf44da060  ! 34: LDSB_I	ldsb	[%r22 + 0x0060], %r26
	.word 0xf41ce0fd  ! 35: LDD_I	ldd	[%r19 + 0x00fd], %r26
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 32)
	.word 0xf855201c  ! 39: LDSH_I	ldsh	[%r20 + 0x001c], %r28
	.word 0xb02d4000  ! 46: ANDN_R	andn 	%r21, %r0, %r24
	.word 0xb43c6074  ! 55: XNOR_I	xnor 	%r17, 0x0074, %r26
	.word 0xbd500000  ! 56: RDPR_TPC	<illegal instruction>
	.word 0xfc5ca169  ! 57: LDX_I	ldx	[%r18 + 0x0169], %r30
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 20)
	setx	data_start_0, %g1, %r21
	.word 0xfa4c61e5  ! 63: LDSB_I	ldsb	[%r17 + 0x01e5], %r29
	.word 0xf2050000  ! 66: LDUW_R	lduw	[%r20 + %r0], %r25
	.word 0xf414e0ce  ! 67: LDUH_I	lduh	[%r19 + 0x00ce], %r26
	.word 0xfc1cc000  ! 75: LDD_R	ldd	[%r19 + %r0], %r30
	.word 0xbe458000  ! 83: ADDC_R	addc 	%r22, %r0, %r31
	.word 0xbb504000  ! 84: RDPR_TNPC	<illegal instruction>
	.word 0xf24d619f  ! 88: LDSB_I	ldsb	[%r21 + 0x019f], %r25
	.word 0xbd540000  ! 90: RDPR_GL	<illegal instruction>
	.word 0xb3359000  ! 91: SRLX_R	srlx	%r22, %r0, %r25
	.word 0xbd508000  ! 92: RDPR_TSTATE	<illegal instruction>
	.word 0xfa15e1c1  ! 99: LDUH_I	lduh	[%r23 + 0x01c1], %r29
	.word 0xb7540000  ! 100: RDPR_GL	<illegal instruction>
	.word 0xfa1d21f4  ! 102: LDD_I	ldd	[%r20 + 0x01f4], %r29
	.word 0xb9518000  ! 105: RDPR_PSTATE	<illegal instruction>
	.word 0xfa1d4000  ! 107: LDD_R	ldd	[%r21 + %r0], %r29
	.word 0xf84c606c  ! 108: LDSB_I	ldsb	[%r17 + 0x006c], %r28
	.word 0xf91dc000  ! 111: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xf80460e7  ! 114: LDUW_I	lduw	[%r17 + 0x00e7], %r28
	.word 0xb22d218c  ! 118: ANDN_I	andn 	%r20, 0x018c, %r25
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 3d)
	.word 0xb1518000  ! 123: RDPR_PSTATE	<illegal instruction>
	.word 0xfa5c0000  ! 125: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xf84d0000  ! 126: LDSB_R	ldsb	[%r20 + %r0], %r28
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 39)
	.word 0xf6054000  ! 137: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0x8d942065  ! 138: WRPR_PSTATE_I	wrpr	%r16, 0x0065, %pstate
	.word 0xfc058000  ! 140: LDUW_R	lduw	[%r22 + %r0], %r30
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, a)
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf844c000  ! 149: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0x9194e1b9  ! 151: WRPR_PIL_I	wrpr	%r19, 0x01b9, %pil
	.word 0xb3520000  ! 156: RDPR_PIL	<illegal instruction>
	.word 0xb950c000  ! 157: RDPR_TT	<illegal instruction>
	.word 0xfd1dc000  ! 158: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0x81956196  ! 164: WRPR_TPC_I	wrpr	%r21, 0x0196, %tpc
	.word 0xb49d0000  ! 165: XORcc_R	xorcc 	%r20, %r0, %r26
	.word 0x8994a1c5  ! 166: WRPR_TICK_I	wrpr	%r18, 0x01c5, %tick
	.word 0xb604e123  ! 169: ADD_I	add 	%r19, 0x0123, %r27
	.word 0xb3518000  ! 173: RDPR_PSTATE	<illegal instruction>
	.word 0xf80ce096  ! 174: LDUB_I	ldub	[%r19 + 0x0096], %r28
	.word 0xf84ce0b3  ! 175: LDSB_I	ldsb	[%r19 + 0x00b3], %r28
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 17)
	.word 0xf24da097  ! 180: LDSB_I	ldsb	[%r22 + 0x0097], %r25
	.word 0xf2548000  ! 181: LDSH_R	ldsh	[%r18 + %r0], %r25
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 7)
	.word 0xfa554000  ! 184: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0x9195a126  ! 186: WRPR_PIL_I	wrpr	%r22, 0x0126, %pil
	.word 0xb88ca10a  ! 187: ANDcc_I	andcc 	%r18, 0x010a, %r28
	.word 0xfa55203e  ! 188: LDSH_I	ldsh	[%r20 + 0x003e], %r29
	.word 0xf61ca0a8  ! 191: LDD_I	ldd	[%r18 + 0x00a8], %r27
	.word 0xf51d60b2  ! 193: LDDF_I	ldd	[%r21, 0x00b2], %f26
	.word 0xfe5cc000  ! 197: LDX_R	ldx	[%r19 + %r0], %r31
	.word 0xfc456077  ! 201: LDSW_I	ldsw	[%r21 + 0x0077], %r30
	.word 0xf04560b6  ! 202: LDSW_I	ldsw	[%r21 + 0x00b6], %r24
	.word 0xba956179  ! 207: ORcc_I	orcc 	%r21, 0x0179, %r29
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 34)
	.word 0xfc5d4000  ! 217: LDX_R	ldx	[%r21 + %r0], %r30
	.word 0xf205611f  ! 219: LDUW_I	lduw	[%r21 + 0x011f], %r25
	.word 0xfa14c000  ! 220: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0xfa140000  ! 222: LDUH_R	lduh	[%r16 + %r0], %r29
	.word 0x8395a177  ! 223: WRPR_TNPC_I	wrpr	%r22, 0x0177, %tnpc
	.word 0xb151c000  ! 227: RDPR_TL	rdpr	%tl, %r24
	.word 0xfe55e0b8  ! 232: LDSH_I	ldsh	[%r23 + 0x00b8], %r31
	.word 0xba942057  ! 236: ORcc_I	orcc 	%r16, 0x0057, %r29
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, a)
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 12)
	.word 0xb7518000  ! 243: RDPR_PSTATE	<illegal instruction>
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 2)
	mov	2, %r12
	.word 0xa1930000  ! 246: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbf518000  ! 247: RDPR_PSTATE	<illegal instruction>
	.word 0xf05d2087  ! 249: LDX_I	ldx	[%r20 + 0x0087], %r24
	setx	0x63b6fba0000b843, %g1, %r10
	.word 0x839a8000  ! 255: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf11d4000  ! 256: LDDF_R	ldd	[%r21, %r0], %f24
	.word 0xf855206f  ! 258: LDSH_I	ldsh	[%r20 + 0x006f], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb2858000  ! 262: ADDcc_R	addcc 	%r22, %r0, %r25
	.word 0xf84de09d  ! 264: LDSB_I	ldsb	[%r23 + 0x009d], %r28
	.word 0xfa050000  ! 265: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xfc4d2199  ! 267: LDSB_I	ldsb	[%r20 + 0x0199], %r30
	.word 0xf614c000  ! 271: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xf654c000  ! 273: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0xb7540000  ! 274: RDPR_GL	<illegal instruction>
	.word 0xf25c4000  ! 275: LDX_R	ldx	[%r17 + %r0], %r25
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 1c)
	.word 0xbd518000  ! 277: RDPR_PSTATE	<illegal instruction>
	.word 0xb13d9000  ! 279: SRAX_R	srax	%r22, %r0, %r24
	.word 0xfa0ca017  ! 282: LDUB_I	ldub	[%r18 + 0x0017], %r29
	.word 0xb93d6001  ! 286: SRA_I	sra 	%r21, 0x0001, %r28
	.word 0xbb50c000  ! 287: RDPR_TT	<illegal instruction>
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 5)
	.word 0xb22d2171  ! 290: ANDN_I	andn 	%r20, 0x0171, %r25
	.word 0xb4c4a01d  ! 292: ADDCcc_I	addccc 	%r18, 0x001d, %r26
	setx	0x2bf917550000fb8e, %g1, %r10
	.word 0x819a8000  ! 295: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf65d61b9  ! 296: LDX_I	ldx	[%r21 + 0x01b9], %r27
	.word 0xb5520000  ! 298: RDPR_PIL	<illegal instruction>
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 3b)
	setx	0xbc35faa0000ac45, %g1, %r10
	.word 0x819a8000  ! 301: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, c)
	.word 0xb5500000  ! 303: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xfe158000  ! 310: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0xf20c0000  ! 317: LDUB_R	ldub	[%r16 + %r0], %r25
	setx	data_start_5, %g1, %r21
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, f)
	.word 0xb151c000  ! 326: RDPR_TL	<illegal instruction>
	.word 0xfe1c8000  ! 327: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xf84d4000  ! 328: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xf25d8000  ! 329: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xbf50c000  ! 331: RDPR_TT	<illegal instruction>
	.word 0xf44d60dd  ! 333: LDSB_I	ldsb	[%r21 + 0x00dd], %r26
	.word 0x91946179  ! 334: WRPR_PIL_I	wrpr	%r17, 0x0179, %pil
	.word 0xf61de1a1  ! 335: LDD_I	ldd	[%r23 + 0x01a1], %r27
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 2)
	mov	1, %r12
	.word 0x8f930000  ! 345: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf41521af  ! 347: LDUH_I	lduh	[%r20 + 0x01af], %r26
	.word 0xfe54e176  ! 349: LDSH_I	ldsh	[%r19 + 0x0176], %r31
	.word 0xb7504000  ! 355: RDPR_TNPC	<illegal instruction>
	.word 0xf40d617d  ! 357: LDUB_I	ldub	[%r21 + 0x017d], %r26
	.word 0xb73da001  ! 362: SRA_I	sra 	%r22, 0x0001, %r27
	.word 0x8395e05c  ! 363: WRPR_TNPC_I	wrpr	%r23, 0x005c, %tnpc
	.word 0xb5355000  ! 366: SRLX_R	srlx	%r21, %r0, %r26
	.word 0xfe5dc000  ! 367: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xf245e0b2  ! 370: LDSW_I	ldsw	[%r23 + 0x00b2], %r25
	.word 0xf255616e  ! 373: LDSH_I	ldsh	[%r21 + 0x016e], %r25
	.word 0xfc0d21fb  ! 374: LDUB_I	ldub	[%r20 + 0x01fb], %r30
	.word 0xfd1d4000  ! 375: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xf00560f9  ! 377: LDUW_I	lduw	[%r21 + 0x00f9], %r24
	.word 0xb2b5e163  ! 383: ORNcc_I	orncc 	%r23, 0x0163, %r25
	.word 0xf31de156  ! 387: LDDF_I	ldd	[%r23, 0x0156], %f25
	.word 0xf05c8000  ! 388: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0xf4150000  ! 390: LDUH_R	lduh	[%r20 + %r0], %r26
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 12)
	.word 0xfa158000  ! 398: LDUH_R	lduh	[%r22 + %r0], %r29
	.word 0x8394e14f  ! 400: WRPR_TNPC_I	wrpr	%r19, 0x014f, %tnpc
	.word 0x8794e035  ! 402: WRPR_TT_I	wrpr	%r19, 0x0035, %tt
	.word 0xb3508000  ! 406: RDPR_TSTATE	<illegal instruction>
	.word 0xf51d4000  ! 411: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0xf045c000  ! 412: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xf44ce1df  ! 417: LDSB_I	ldsb	[%r19 + 0x01df], %r26
	.word 0xf65c0000  ! 426: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0xbf3d7001  ! 427: SRAX_I	srax	%r21, 0x0001, %r31
	.word 0xb7359000  ! 430: SRLX_R	srlx	%r22, %r0, %r27
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, c)
	.word 0xb3540000  ! 434: RDPR_GL	<illegal instruction>
	.word 0xfc14a0d1  ! 437: LDUH_I	lduh	[%r18 + 0x00d1], %r30
	.word 0xf2052022  ! 439: LDUW_I	lduw	[%r20 + 0x0022], %r25
	.word 0xf51de0ba  ! 444: LDDF_I	ldd	[%r23, 0x00ba], %f26
	.word 0xfa15e0bd  ! 449: LDUH_I	lduh	[%r23 + 0x00bd], %r29
	setx	data_start_0, %g1, %r18
	.word 0xf61c6079  ! 452: LDD_I	ldd	[%r17 + 0x0079], %r27
	.word 0xb550c000  ! 460: RDPR_TT	<illegal instruction>
	.word 0xf2052077  ! 461: LDUW_I	lduw	[%r20 + 0x0077], %r25
	.word 0xb4456165  ! 462: ADDC_I	addc 	%r21, 0x0165, %r26
	.word 0xf414a1a0  ! 464: LDUH_I	lduh	[%r18 + 0x01a0], %r26
	.word 0xf805217b  ! 465: LDUW_I	lduw	[%r20 + 0x017b], %r28
	.word 0xf055c000  ! 467: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0x8995a129  ! 469: WRPR_TICK_I	wrpr	%r22, 0x0129, %tick
	.word 0xf04da08e  ! 470: LDSB_I	ldsb	[%r22 + 0x008e], %r24
	.word 0x8395a1ca  ! 471: WRPR_TNPC_I	wrpr	%r22, 0x01ca, %tnpc
	.word 0xfa5ce06c  ! 472: LDX_I	ldx	[%r19 + 0x006c], %r29
	.word 0xb03cc000  ! 473: XNOR_R	xnor 	%r19, %r0, %r24
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 2a)
	.word 0xbb500000  ! 477: RDPR_TPC	<illegal instruction>
	.word 0xb9540000  ! 478: RDPR_GL	<illegal instruction>
	.word 0xf24c8000  ! 483: LDSB_R	ldsb	[%r18 + %r0], %r25
	setx	data_start_3, %g1, %r23
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 23)
	.word 0xb750c000  ! 488: RDPR_TT	<illegal instruction>
	setx	data_start_4, %g1, %r19
	.word 0xf015a0a0  ! 490: LDUH_I	lduh	[%r22 + 0x00a0], %r24
	.word 0xb33d0000  ! 494: SRA_R	sra 	%r20, %r0, %r25
	.word 0xba3cc000  ! 495: XNOR_R	xnor 	%r19, %r0, %r29
	.word 0xfc1de023  ! 498: LDD_I	ldd	[%r23 + 0x0023], %r30
	.word 0xb1508000  ! 500: RDPR_TSTATE	<illegal instruction>
	.word 0xb135a001  ! 501: SRL_I	srl 	%r22, 0x0001, %r24
	.word 0xb0b5a09d  ! 504: SUBCcc_I	orncc 	%r22, 0x009d, %r24
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 2)
	.word 0xfe5da132  ! 510: LDX_I	ldx	[%r22 + 0x0132], %r31
	setx	data_start_2, %g1, %r21
	.word 0xb5540000  ! 512: RDPR_GL	<illegal instruction>
	.word 0xf2554000  ! 513: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xb295204a  ! 514: ORcc_I	orcc 	%r20, 0x004a, %r25
	.word 0xfa5c0000  ! 518: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xba2d20b7  ! 520: ANDN_I	andn 	%r20, 0x00b7, %r29
	.word 0xf04d2046  ! 525: LDSB_I	ldsb	[%r20 + 0x0046], %r24
	.word 0xfc1d6156  ! 527: LDD_I	ldd	[%r21 + 0x0156], %r30
	.word 0xfe45e1d0  ! 528: LDSW_I	ldsw	[%r23 + 0x01d0], %r31
	.word 0xb3480000  ! 531: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf11c203a  ! 540: LDDF_I	ldd	[%r16, 0x003a], %f24
	mov	2, %r12
	.word 0xa1930000  ! 541: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9504000  ! 542: RDPR_TNPC	<illegal instruction>
	.word 0xb5504000  ! 543: RDPR_TNPC	<illegal instruction>
	.word 0xfe0c4000  ! 547: LDUB_R	ldub	[%r17 + %r0], %r31
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 1b)
	.word 0x879521c3  ! 551: WRPR_TT_I	wrpr	%r20, 0x01c3, %tt
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 1d)
	mov	0, %r12
	.word 0xa1930000  ! 556: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb750c000  ! 563: RDPR_TT	<illegal instruction>
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 19)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3510000  ! 571: RDPR_TICK	<illegal instruction>
	.word 0xf85d615c  ! 573: LDX_I	ldx	[%r21 + 0x015c], %r28
	.word 0xb1508000  ! 575: RDPR_TSTATE	<illegal instruction>
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 32)
	.word 0x879521c0  ! 577: WRPR_TT_I	wrpr	%r20, 0x01c0, %tt
	setx	data_start_1, %g1, %r23
	.word 0xfc544000  ! 580: LDSH_R	ldsh	[%r17 + %r0], %r30
	setx	0x1cd4ae990000ddd5, %g1, %r10
	.word 0x819a8000  ! 581: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb93d7001  ! 582: SRAX_I	srax	%r21, 0x0001, %r28
	.word 0xb6a48000  ! 584: SUBcc_R	subcc 	%r18, %r0, %r27
	.word 0xfd1c4000  ! 587: LDDF_R	ldd	[%r17, %r0], %f30
	.word 0xfe1c8000  ! 588: LDD_R	ldd	[%r18 + %r0], %r31
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 1)
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 1)
	.word 0xb3504000  ! 598: RDPR_TNPC	<illegal instruction>
	.word 0xf41d8000  ! 600: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0xfe150000  ! 603: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xf41c60c7  ! 605: LDD_I	ldd	[%r17 + 0x00c7], %r26
	.word 0x839521e7  ! 606: WRPR_TNPC_I	wrpr	%r20, 0x01e7, %tnpc
	.word 0xfc15e05c  ! 607: LDUH_I	lduh	[%r23 + 0x005c], %r30
	.word 0xbc1c20b2  ! 608: XOR_I	xor 	%r16, 0x00b2, %r30
	.word 0xfa0c0000  ! 610: LDUB_R	ldub	[%r16 + %r0], %r29
	setx	data_start_0, %g1, %r20
	setx	data_start_1, %g1, %r23
	.word 0xf44c2128  ! 618: LDSB_I	ldsb	[%r16 + 0x0128], %r26
	.word 0xfa15e196  ! 621: LDUH_I	lduh	[%r23 + 0x0196], %r29
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 3)
	.word 0xbd50c000  ! 627: RDPR_TT	<illegal instruction>
	.word 0xfc1de040  ! 628: LDD_I	ldd	[%r23 + 0x0040], %r30
	.word 0xbd641800  ! 629: MOVcc_R	<illegal instruction>
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf804c000  ! 634: LDUW_R	lduw	[%r19 + %r0], %r28
	.word 0xfe4c8000  ! 637: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xb151c000  ! 639: RDPR_TL	<illegal instruction>
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf31cc000  ! 642: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xf0558000  ! 643: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xb9508000  ! 646: RDPR_TSTATE	<illegal instruction>
	.word 0xf40461d1  ! 647: LDUW_I	lduw	[%r17 + 0x01d1], %r26
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, a)
	.word 0x8d9460c6  ! 650: WRPR_PSTATE_I	wrpr	%r17, 0x00c6, %pstate
	.word 0xf0054000  ! 651: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xf51ca044  ! 653: LDDF_I	ldd	[%r18, 0x0044], %f26
	.word 0xfe4c0000  ! 654: LDSB_R	ldsb	[%r16 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb2b5612f  ! 659: ORNcc_I	orncc 	%r21, 0x012f, %r25
	.word 0xbd508000  ! 662: RDPR_TSTATE	<illegal instruction>
	.word 0xf85d61b3  ! 664: LDX_I	ldx	[%r21 + 0x01b3], %r28
	.word 0xf445e0c2  ! 674: LDSW_I	ldsw	[%r23 + 0x00c2], %r26
	setx	0x337810be00009ccf, %g1, %r10
	.word 0x839a8000  ! 675: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe54a017  ! 676: LDSH_I	ldsh	[%r18 + 0x0017], %r31
	.word 0xbab5616d  ! 677: SUBCcc_I	orncc 	%r21, 0x016d, %r29
	.word 0xf00ce179  ! 678: LDUB_I	ldub	[%r19 + 0x0179], %r24
	.word 0x9194a190  ! 686: WRPR_PIL_I	wrpr	%r18, 0x0190, %pil
	setx	data_start_7, %g1, %r17
	.word 0xf05461a4  ! 690: LDSH_I	ldsh	[%r17 + 0x01a4], %r24
	.word 0xb53c2001  ! 691: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0xba3d4000  ! 694: XNOR_R	xnor 	%r21, %r0, %r29
	.word 0xfe4c611a  ! 695: LDSB_I	ldsb	[%r17 + 0x011a], %r31
	.word 0xfc4ce035  ! 698: LDSB_I	ldsb	[%r19 + 0x0035], %r30
	.word 0xbc94e161  ! 700: ORcc_I	orcc 	%r19, 0x0161, %r30
	.word 0xb1480000  ! 702: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfe4da1aa  ! 704: LDSB_I	ldsb	[%r22 + 0x01aa], %r31
	setx	0xbb44a39d00004857, %g1, %r10
	.word 0x819a8000  ! 708: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf01421c8  ! 712: LDUH_I	lduh	[%r16 + 0x01c8], %r24
	.word 0x8d94e0a6  ! 714: WRPR_PSTATE_I	wrpr	%r19, 0x00a6, %pstate
	.word 0xf71d0000  ! 718: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xf40521a8  ! 722: LDUW_I	lduw	[%r20 + 0x01a8], %r26
	.word 0xf80d4000  ! 723: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xbb520000  ! 724: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf21c8000  ! 725: LDD_R	ldd	[%r18 + %r0], %r25
	.word 0xfa5c60b2  ! 728: LDX_I	ldx	[%r17 + 0x00b2], %r29
	.word 0xfa14e066  ! 730: LDUH_I	lduh	[%r19 + 0x0066], %r29
	.word 0xf244a16e  ! 731: LDSW_I	ldsw	[%r18 + 0x016e], %r25
	.word 0xf81461de  ! 736: LDUH_I	lduh	[%r17 + 0x01de], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb835e0a8  ! 744: SUBC_I	orn 	%r23, 0x00a8, %r28
	.word 0xbd3cf001  ! 747: SRAX_I	srax	%r19, 0x0001, %r30
	.word 0xb17dc400  ! 751: MOVR_R	movre	%r23, %r0, %r24
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 13)
	.word 0xfe45c000  ! 753: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xfe1560dd  ! 756: LDUH_I	lduh	[%r21 + 0x00dd], %r31
	.word 0xb151c000  ! 757: RDPR_TL	<illegal instruction>
	.word 0xbb500000  ! 762: RDPR_TPC	<illegal instruction>
	.word 0xf2540000  ! 766: LDSH_R	ldsh	[%r16 + %r0], %r25
	mov	2, %r12
	.word 0x8f930000  ! 774: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0, %r12
	.word 0xa1930000  ! 775: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 13)
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 15)
	.word 0xb634a081  ! 782: ORN_I	orn 	%r18, 0x0081, %r27
	.word 0xfc1dc000  ! 783: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0xb7520000  ! 785: RDPR_PIL	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 786: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf04cc000  ! 792: LDSB_R	ldsb	[%r19 + %r0], %r24
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 1f)
	.word 0xbcb421d8  ! 797: SUBCcc_I	orncc 	%r16, 0x01d8, %r30
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfb1d61c5  ! 803: LDDF_I	ldd	[%r21, 0x01c5], %f29
	.word 0xfc548000  ! 804: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xfc15608e  ! 805: LDUH_I	lduh	[%r21 + 0x008e], %r30
	.word 0xb750c000  ! 810: RDPR_TT	rdpr	%tt, %r27
	.word 0xfe442028  ! 814: LDSW_I	ldsw	[%r16 + 0x0028], %r31
	.word 0xf6444000  ! 821: LDSW_R	ldsw	[%r17 + %r0], %r27
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 0)
	.word 0xf40d60df  ! 825: LDUB_I	ldub	[%r21 + 0x00df], %r26
	.word 0xb6a54000  ! 827: SUBcc_R	subcc 	%r21, %r0, %r27
	.word 0xbd504000  ! 829: RDPR_TNPC	<illegal instruction>
	.word 0x8d94e115  ! 831: WRPR_PSTATE_I	wrpr	%r19, 0x0115, %pstate
	.word 0x83946151  ! 832: WRPR_TNPC_I	wrpr	%r17, 0x0151, %tnpc
	.word 0xbc458000  ! 833: ADDC_R	addc 	%r22, %r0, %r30
	.word 0xb5508000  ! 836: RDPR_TSTATE	<illegal instruction>
	.word 0xf81d4000  ! 841: LDD_R	ldd	[%r21 + %r0], %r28
	.word 0xf2058000  ! 845: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xfa4d0000  ! 847: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xb1500000  ! 848: RDPR_TPC	<illegal instruction>
	.word 0xf25d61f8  ! 849: LDX_I	ldx	[%r21 + 0x01f8], %r25
	.word 0xb1480000  ! 852: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf85ca185  ! 853: LDX_I	ldx	[%r18 + 0x0185], %r28
	.word 0x819560d2  ! 868: WRPR_TPC_I	wrpr	%r21, 0x00d2, %tpc
	.word 0xfa45219c  ! 869: LDSW_I	ldsw	[%r20 + 0x019c], %r29
	.word 0xf6554000  ! 871: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xf6448000  ! 873: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0xf71ca02f  ! 878: LDDF_I	ldd	[%r18, 0x002f], %f27
	.word 0x8194e0d5  ! 880: WRPR_TPC_I	wrpr	%r19, 0x00d5, %tpc
	.word 0xfe4dc000  ! 881: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0x8595604b  ! 882: WRPR_TSTATE_I	wrpr	%r21, 0x004b, %tstate
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf04c2153  ! 884: LDSB_I	ldsb	[%r16 + 0x0153], %r24
	.word 0xf0454000  ! 888: LDSW_R	ldsw	[%r21 + %r0], %r24
	.word 0xb7500000  ! 889: RDPR_TPC	<illegal instruction>
	.word 0xb625c000  ! 891: SUB_R	sub 	%r23, %r0, %r27
	.word 0xf45cc000  ! 893: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xbf500000  ! 898: RDPR_TPC	<illegal instruction>
	.word 0xbaa5213a  ! 901: SUBcc_I	subcc 	%r20, 0x013a, %r29
	.word 0xf25c8000  ! 905: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xbe358000  ! 910: ORN_R	orn 	%r22, %r0, %r31
	.word 0xfc54c000  ! 914: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xb0158000  ! 915: OR_R	or 	%r22, %r0, %r24
	.word 0xf44c6134  ! 916: LDSB_I	ldsb	[%r17 + 0x0134], %r26
	.word 0xf2148000  ! 919: LDUH_R	lduh	[%r18 + %r0], %r25
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 34)
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 3f)
	.word 0xff1de117  ! 923: LDDF_I	ldd	[%r23, 0x0117], %f31
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 36)
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfa5d2190  ! 930: LDX_I	ldx	[%r20 + 0x0190], %r29
	.word 0xf80561ac  ! 932: LDUW_I	lduw	[%r21 + 0x01ac], %r28
	.word 0xfe1de088  ! 936: LDD_I	ldd	[%r23 + 0x0088], %r31
	.word 0xb5480000  ! 940: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbe1dc000  ! 942: XOR_R	xor 	%r23, %r0, %r31
	.word 0xf01cc000  ! 946: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xf454a0ad  ! 947: LDSH_I	ldsh	[%r18 + 0x00ad], %r26
	.word 0xf204a006  ! 950: LDUW_I	lduw	[%r18 + 0x0006], %r25
	.word 0xbf2d1000  ! 951: SLLX_R	sllx	%r20, %r0, %r31
	.word 0xf2156015  ! 952: LDUH_I	lduh	[%r21 + 0x0015], %r25
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 3a)
hwintr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_45), 16, 16)) -> intp(2, 0, 36)
	.word 0xfe450000  ! 956: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0xf00d6076  ! 965: LDUB_I	ldub	[%r21 + 0x0076], %r24
	.word 0xf4446098  ! 967: LDSW_I	ldsw	[%r17 + 0x0098], %r26
	.word 0xf40d0000  ! 972: LDUB_R	ldub	[%r20 + %r0], %r26
	setx	data_start_1, %g1, %r22
	.word 0xfe54c000  ! 975: LDSH_R	ldsh	[%r19 + %r0], %r31
	setx	data_start_5, %g1, %r18
	.word 0xf2040000  ! 980: LDUW_R	lduw	[%r16 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8152038  ! 987: OR_I	or 	%r20, 0x0038, %r28
	.word 0x91952118  ! 989: WRPR_PIL_I	wrpr	%r20, 0x0118, %pil
	.word 0xfc558000  ! 993: LDSH_R	ldsh	[%r22 + %r0], %r30
hwintr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_46), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfc044000  ! 996: LDUW_R	lduw	[%r17 + %r0], %r30
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbfa00560  ! 2: FSQRTq	fsqrt	
	.word 0x8195e12d  ! 3: WRPR_TPC_I	wrpr	%r23, 0x012d, %tpc
	.word 0xbd643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb350c000  ! 5: RDPR_TT	<illegal instruction>
	.word 0xbbabc820  ! 9: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbd500000  ! 11: RDPR_TPC	<illegal instruction>
	.word 0xb3a40920  ! 16: FMULs	fmuls	%f16, %f0, %f25
	.word 0xb5a00020  ! 18: FMOVs	fmovs	%f0, %f26
	.word 0xbeacc000  ! 19: ANDNcc_R	andncc 	%r19, %r0, %r31
	.word 0x8595a0ca  ! 22: WRPR_TSTATE_I	wrpr	%r22, 0x00ca, %tstate
	.word 0x8795a10a  ! 23: WRPR_TT_I	wrpr	%r22, 0x010a, %tt
	.word 0xb9a58840  ! 24: FADDd	faddd	%f22, %f0, %f28
	.word 0xb5a58940  ! 25: FMULd	fmuld	%f22, %f0, %f26
	.word 0xb9a81420  ! 36: FMOVRNZ	dis not found

hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 38)
	.word 0xb3a84820  ! 41: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb02c0000  ! 46: ANDN_R	andn 	%r16, %r0, %r24
	.word 0xb3aa8820  ! 48: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb9a00560  ! 49: FSQRTq	fsqrt	
	.word 0xbdaa0820  ! 52: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb7a00560  ! 53: FSQRTq	fsqrt	
	.word 0xb03ca123  ! 55: XNOR_I	xnor 	%r18, 0x0123, %r24
	.word 0xb3500000  ! 56: RDPR_TPC	<illegal instruction>
	.word 0xbba80820  ! 58: FMOVN	fmovs	%fcc1, %f0, %f29
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, e)
	.word 0xbfa00020  ! 61: FMOVs	fmovs	%f0, %f31
	setx	data_start_3, %g1, %r18
	.word 0xbbaa8820  ! 68: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb1a54860  ! 72: FADDq	dis not found

	.word 0xb5a44940  ! 73: FMULd	fmuld	%f48, %f0, %f26
	.word 0xb3a54960  ! 74: FMULq	dis not found

	.word 0xbda00560  ! 77: FSQRTq	fsqrt	
	.word 0xb5a44960  ! 78: FMULq	dis not found

	.word 0xbfa94820  ! 80: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb6450000  ! 83: ADDC_R	addc 	%r20, %r0, %r27
	.word 0xb7504000  ! 84: RDPR_TNPC	<illegal instruction>
	.word 0xb9a90820  ! 85: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbdab8820  ! 89: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb9540000  ! 90: RDPR_GL	<illegal instruction>
	.word 0xbd35d000  ! 91: SRLX_R	srlx	%r23, %r0, %r30
	.word 0xbd508000  ! 92: RDPR_TSTATE	<illegal instruction>
	.word 0xbba90820  ! 94: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb1a44920  ! 95: FMULs	fmuls	%f17, %f0, %f24
	.word 0xbbaa0820  ! 96: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbfa5c820  ! 97: FADDs	fadds	%f23, %f0, %f31
	.word 0xbb540000  ! 100: RDPR_GL	<illegal instruction>
	.word 0xbdaac820  ! 101: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbdaa8820  ! 103: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbdab8820  ! 104: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbd518000  ! 105: RDPR_PSTATE	<illegal instruction>
	.word 0xb5ab8820  ! 109: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbba4c8e0  ! 115: FSUBq	dis not found

	.word 0xbba409e0  ! 116: FDIVq	dis not found

	.word 0xb22ca19e  ! 118: ANDN_I	andn 	%r18, 0x019e, %r25
	.word 0xb1ab8820  ! 119: FMOVPOS	fmovs	%fcc1, %f0, %f24
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 12)
	.word 0xbf518000  ! 123: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a4c9c0  ! 124: FDIVd	fdivd	%f50, %f0, %f28
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 21)
	.word 0xb1a00560  ! 133: FSQRTq	fsqrt	
	.word 0xb3aac820  ! 134: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0x8d9521f8  ! 138: WRPR_PSTATE_I	wrpr	%r20, 0x01f8, %pstate
	.word 0xb1a94820  ! 141: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbda58920  ! 143: FMULs	fmuls	%f22, %f0, %f30
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 6)
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 32)
	.word 0x91956063  ! 151: WRPR_PIL_I	wrpr	%r21, 0x0063, %pil
	.word 0xb5a81820  ! 153: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb3aa8820  ! 155: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb9520000  ! 156: RDPR_PIL	<illegal instruction>
	.word 0xbb50c000  ! 157: RDPR_TT	<illegal instruction>
	.word 0xb1a00020  ! 160: FMOVs	fmovs	%f0, %f24
	.word 0xbda40960  ! 162: FMULq	dis not found

	.word 0xbda489a0  ! 163: FDIVs	fdivs	%f18, %f0, %f30
	.word 0x8194e04d  ! 164: WRPR_TPC_I	wrpr	%r19, 0x004d, %tpc
	.word 0xb69c8000  ! 165: XORcc_R	xorcc 	%r18, %r0, %r27
	.word 0x8995a05e  ! 166: WRPR_TICK_I	wrpr	%r22, 0x005e, %tick
	.word 0xb3a44960  ! 168: FMULq	dis not found

	.word 0xb804a1be  ! 169: ADD_I	add 	%r18, 0x01be, %r28
	.word 0xbba5c8c0  ! 171: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xbd518000  ! 173: RDPR_PSTATE	<illegal instruction>
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 23)
	.word 0xb1a408c0  ! 182: FSUBd	fsubd	%f16, %f0, %f24
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 39)
	.word 0x91956196  ! 186: WRPR_PIL_I	wrpr	%r21, 0x0196, %pil
	.word 0xb68ca0ba  ! 187: ANDcc_I	andcc 	%r18, 0x00ba, %r27
	.word 0xb3a81820  ! 189: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb7a88820  ! 190: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbfa00560  ! 194: FSQRTq	fsqrt	
	.word 0xbdab8820  ! 199: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb1ab4820  ! 204: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb29461b0  ! 207: ORcc_I	orcc 	%r17, 0x01b0, %r25
	.word 0xb9a00560  ! 209: FSQRTq	fsqrt	
	.word 0xbba449a0  ! 210: FDIVs	fdivs	%f17, %f0, %f29
	.word 0xbda8c820  ! 213: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb7a98820  ! 214: FMOVNEG	fmovs	%fcc1, %f0, %f27
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 34)
	.word 0x8394a182  ! 223: WRPR_TNPC_I	wrpr	%r18, 0x0182, %tnpc
	.word 0xbfa00540  ! 225: FSQRTd	fsqrt	
	.word 0xb9a488e0  ! 226: FSUBq	dis not found

	.word 0xb151c000  ! 227: RDPR_TL	<illegal instruction>
	.word 0xbbab8820  ! 229: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a00540  ! 230: FSQRTd	fsqrt	
	.word 0xbbabc820  ! 231: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbda00520  ! 235: FSQRTs	fsqrt	
	.word 0xbc95e0cf  ! 236: ORcc_I	orcc 	%r23, 0x00cf, %r30
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, d)
	.word 0xb5a54960  ! 238: FMULq	dis not found

	.word 0xb3a00040  ! 239: FMOVd	fmovd	%f0, %f56
	.word 0xb3a00540  ! 240: FSQRTd	fsqrt	
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 31)
	.word 0xb9a00040  ! 242: FMOVd	fmovd	%f0, %f28
	.word 0xbf518000  ! 243: RDPR_PSTATE	<illegal instruction>
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 4)
	.word 0xb7a81c20  ! 245: FMOVRGEZ	dis not found

	mov	1, %r12
	.word 0xa1930000  ! 246: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7518000  ! 247: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a00520  ! 248: FSQRTs	fsqrt	
	.word 0xb7abc820  ! 251: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbfa80820  ! 252: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb9aa0820  ! 253: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbfa50860  ! 254: FADDq	dis not found

	setx	0x5e93faa100005f83, %g1, %r10
	.word 0x839a8000  ! 255: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb2854000  ! 262: ADDcc_R	addcc 	%r21, %r0, %r25
	.word 0xb1a88820  ! 269: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbda58820  ! 272: FADDs	fadds	%f22, %f0, %f30
	.word 0xb5540000  ! 274: RDPR_GL	<illegal instruction>
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, f)
	.word 0xb3518000  ! 277: RDPR_PSTATE	<illegal instruction>
	.word 0xb73dd000  ! 279: SRAX_R	srax	%r23, %r0, %r27
	.word 0xb93de001  ! 286: SRA_I	sra 	%r23, 0x0001, %r28
	.word 0xb950c000  ! 287: RDPR_TT	<illegal instruction>
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbe2ce061  ! 290: ANDN_I	andn 	%r19, 0x0061, %r31
	.word 0xb8c52063  ! 292: ADDCcc_I	addccc 	%r20, 0x0063, %r28
	.word 0xb3a98820  ! 293: FMOVNEG	fmovs	%fcc1, %f0, %f25
	setx	0x27703b520000f88a, %g1, %r10
	.word 0x819a8000  ! 295: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1a90820  ! 297: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb7520000  ! 298: RDPR_PIL	<illegal instruction>
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 7)
	setx	0xf6f3ef930000ce45, %g1, %r10
	.word 0x819a8000  ! 301: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 5)
	.word 0xb3500000  ! 303: RDPR_TPC	<illegal instruction>
	.word 0xb1a00520  ! 309: FSQRTs	fsqrt	
	.word 0xbba448e0  ! 315: FSUBq	dis not found

	.word 0xb7a80820  ! 318: FMOVN	fmovs	%fcc1, %f0, %f27
	setx	data_start_0, %g1, %r17
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb3a44860  ! 324: FADDq	dis not found

	.word 0xb551c000  ! 326: RDPR_TL	<illegal instruction>
	.word 0xbba00040  ! 330: FMOVd	fmovd	%f0, %f60
	.word 0xbb50c000  ! 331: RDPR_TT	<illegal instruction>
	.word 0x919461ac  ! 334: WRPR_PIL_I	wrpr	%r17, 0x01ac, %pil
	.word 0xb3a80820  ! 336: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbba90820  ! 337: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb5a80c20  ! 338: FMOVRLZ	dis not found

hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 12)
	.word 0xbda00560  ! 341: FSQRTq	fsqrt	
	.word 0xb5a81820  ! 343: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb1abc820  ! 344: FMOVVC	fmovs	%fcc1, %f0, %f24
	mov	2, %r12
	.word 0x8f930000  ! 345: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbaa8820  ! 346: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb7ab4820  ! 348: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbda549e0  ! 351: FDIVq	dis not found

	.word 0xb3a50940  ! 352: FMULd	fmuld	%f20, %f0, %f56
	.word 0xb9504000  ! 355: RDPR_TNPC	<illegal instruction>
	.word 0xbfa5c9e0  ! 359: FDIVq	dis not found

	.word 0xb73d6001  ! 362: SRA_I	sra 	%r21, 0x0001, %r27
	.word 0x8394a16d  ! 363: WRPR_TNPC_I	wrpr	%r18, 0x016d, %tnpc
	.word 0xbfa40940  ! 364: FMULd	fmuld	%f16, %f0, %f62
	.word 0xb5a00020  ! 365: FMOVs	fmovs	%f0, %f26
	.word 0xbd34d000  ! 366: SRLX_R	srlx	%r19, %r0, %r30
	.word 0xb1a00540  ! 368: FSQRTd	fsqrt	
	.word 0xbfa5c860  ! 378: FADDq	dis not found

	.word 0xb5abc820  ! 379: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb5a408c0  ! 380: FSUBd	fsubd	%f16, %f0, %f26
	.word 0xb4b42021  ! 383: ORNcc_I	orncc 	%r16, 0x0021, %r26
	.word 0xbfa48820  ! 385: FADDs	fadds	%f18, %f0, %f31
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 17)
	.word 0xbfab0820  ! 394: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb9a9c820  ! 395: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb1a44960  ! 396: FMULq	dis not found

	.word 0xbba549e0  ! 397: FDIVq	dis not found

	.word 0x8394a11f  ! 400: WRPR_TNPC_I	wrpr	%r18, 0x011f, %tnpc
	.word 0xb7a00540  ! 401: FSQRTd	fsqrt	
	.word 0x87942047  ! 402: WRPR_TT_I	wrpr	%r16, 0x0047, %tt
	.word 0xb9508000  ! 406: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a4c960  ! 407: FMULq	dis not found

	.word 0xb9a00540  ! 410: FSQRTd	fsqrt	
	.word 0xbfa00560  ! 415: FSQRTq	fsqrt	
	.word 0xbda00560  ! 419: FSQRTq	fsqrt	
	.word 0xb9a84820  ! 420: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbda9c820  ! 423: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbda81820  ! 425: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbf3d7001  ! 427: SRAX_I	srax	%r21, 0x0001, %r31
	.word 0xbb349000  ! 430: SRLX_R	srlx	%r18, %r0, %r29
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 15)
	.word 0xb1540000  ! 434: RDPR_GL	<illegal instruction>
	.word 0xb1a84820  ! 441: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xbfa80420  ! 442: FMOVRZ	dis not found

	.word 0xbda90820  ! 443: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbba80820  ! 445: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	setx	data_start_4, %g1, %r22
	.word 0xb5a5c9e0  ! 455: FDIVq	dis not found

	.word 0xb1a409a0  ! 457: FDIVs	fdivs	%f16, %f0, %f24
	.word 0xb5a80820  ! 459: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbf50c000  ! 460: RDPR_TT	<illegal instruction>
	.word 0xb64521de  ! 462: ADDC_I	addc 	%r20, 0x01de, %r27
	.word 0xbfa5c9c0  ! 463: FDIVd	fdivd	%f54, %f0, %f62
	.word 0xb1a00560  ! 466: FSQRTq	fsqrt	
	.word 0x8994e1dc  ! 469: WRPR_TICK_I	wrpr	%r19, 0x01dc, %tick
	.word 0x839460d8  ! 471: WRPR_TNPC_I	wrpr	%r17, 0x00d8, %tnpc
	.word 0xba3d4000  ! 473: XNOR_R	xnor 	%r21, %r0, %r29
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 11)
	.word 0xbf500000  ! 477: RDPR_TPC	<illegal instruction>
	.word 0xbf540000  ! 478: RDPR_GL	<illegal instruction>
	.word 0xb1a94820  ! 479: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbda00540  ! 480: FSQRTd	fsqrt	
	setx	data_start_4, %g1, %r19
	.word 0xb3a58840  ! 485: FADDd	faddd	%f22, %f0, %f56
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 0)
	.word 0xbb50c000  ! 488: RDPR_TT	<illegal instruction>
	setx	data_start_3, %g1, %r16
	.word 0xbfa40920  ! 492: FMULs	fmuls	%f16, %f0, %f31
	.word 0xb93dc000  ! 494: SRA_R	sra 	%r23, %r0, %r28
	.word 0xb23dc000  ! 495: XNOR_R	xnor 	%r23, %r0, %r25
	.word 0xbd508000  ! 500: RDPR_TSTATE	<illegal instruction>
	.word 0xb934a001  ! 501: SRL_I	srl 	%r18, 0x0001, %r28
	.word 0xb8b5a12e  ! 504: SUBCcc_I	orncc 	%r22, 0x012e, %r28
	.word 0xb5a44860  ! 505: FADDq	dis not found

	.word 0xbda94820  ! 507: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb5a44920  ! 508: FMULs	fmuls	%f17, %f0, %f26
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 2e)
	setx	data_start_6, %g1, %r16
	.word 0xbf540000  ! 512: RDPR_GL	<illegal instruction>
	.word 0xb495e0ce  ! 514: ORcc_I	orcc 	%r23, 0x00ce, %r26
	.word 0xb5a448c0  ! 519: FSUBd	fsubd	%f48, %f0, %f26
	.word 0xb02ca090  ! 520: ANDN_I	andn 	%r18, 0x0090, %r24
	.word 0xb9a44960  ! 526: FMULq	dis not found

	.word 0xb1a81c20  ! 530: FMOVRGEZ	dis not found

	.word 0xb3480000  ! 531: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbba81420  ! 532: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0, %r12
	.word 0xa1930000  ! 541: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9504000  ! 542: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 543: RDPR_TNPC	<illegal instruction>
	.word 0xb7a81420  ! 544: FMOVRNZ	dis not found

	.word 0xb3a00520  ! 545: FSQRTs	fsqrt	
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 3)
	.word 0x8795e0e5  ! 551: WRPR_TT_I	wrpr	%r23, 0x00e5, %tt
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 7)
	mov	2, %r12
	.word 0xa1930000  ! 556: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a80420  ! 558: FMOVRZ	dis not found

	.word 0xbda00520  ! 561: FSQRTs	fsqrt	
	.word 0xb950c000  ! 563: RDPR_TT	<illegal instruction>
	.word 0xbbaa4820  ! 565: FMOVNE	fmovs	%fcc1, %f0, %f29
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, f)
	.word 0xb7a80820  ! 568: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9510000  ! 571: RDPR_TICK	<illegal instruction>
	.word 0xb1a448a0  ! 572: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xbba5c9e0  ! 574: FDIVq	dis not found

	.word 0xb5508000  ! 575: RDPR_TSTATE	<illegal instruction>
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 22)
	.word 0x8795a106  ! 577: WRPR_TT_I	wrpr	%r22, 0x0106, %tt
	setx	data_start_6, %g1, %r19
	setx	0x215b577a0000980d, %g1, %r10
	.word 0x819a8000  ! 581: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb33c7001  ! 582: SRAX_I	srax	%r17, 0x0001, %r25
	.word 0xb4a54000  ! 584: SUBcc_R	subcc 	%r21, %r0, %r26
	.word 0xbbab0820  ! 585: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbfab4820  ! 589: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbda80c20  ! 590: FMOVRLZ	dis not found

	.word 0xbda549c0  ! 591: FDIVd	fdivd	%f52, %f0, %f30
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 31)
	.word 0xbda00520  ! 593: FSQRTs	fsqrt	
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 24)
	.word 0xb5504000  ! 598: RDPR_TNPC	<illegal instruction>
	.word 0xb5a80820  ! 599: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbda94820  ! 601: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0x83952158  ! 606: WRPR_TNPC_I	wrpr	%r20, 0x0158, %tnpc
	.word 0xb01da1c8  ! 608: XOR_I	xor 	%r22, 0x01c8, %r24
	setx	data_start_0, %g1, %r21
	.word 0xb1a94820  ! 615: FMOVCS	fmovs	%fcc1, %f0, %f24
	setx	data_start_1, %g1, %r18
	.word 0xbba00540  ! 622: FSQRTd	fsqrt	
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb9a81820  ! 624: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbf50c000  ! 627: RDPR_TT	<illegal instruction>
	.word 0xbb641800  ! 629: MOVcc_R	<illegal instruction>
	.word 0xbda408e0  ! 631: FSUBq	dis not found

hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 24)
	.word 0xb951c000  ! 639: RDPR_TL	<illegal instruction>
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 21)
	.word 0xb5508000  ! 646: RDPR_TSTATE	<illegal instruction>
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 1c)
	.word 0x8d95a0d2  ! 650: WRPR_PSTATE_I	wrpr	%r22, 0x00d2, %pstate
	.word 0xb3a40840  ! 652: FADDd	faddd	%f16, %f0, %f56
	.word 0xb3aac820  ! 655: FMOVGE	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb0b52065  ! 659: ORNcc_I	orncc 	%r20, 0x0065, %r24
	.word 0xb9508000  ! 662: RDPR_TSTATE	<illegal instruction>
	.word 0xbdaa4820  ! 669: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbba94820  ! 670: FMOVCS	fmovs	%fcc1, %f0, %f29
	setx	0xf079f0ec0000cbdd, %g1, %r10
	.word 0x839a8000  ! 675: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb2b5215c  ! 677: SUBCcc_I	orncc 	%r20, 0x015c, %r25
	.word 0xb7a58860  ! 679: FADDq	dis not found

	.word 0xbdab8820  ! 680: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a98820  ! 681: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00520  ! 682: FSQRTs	fsqrt	
	.word 0xbbaac820  ! 684: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0x9194a070  ! 686: WRPR_PIL_I	wrpr	%r18, 0x0070, %pil
	setx	data_start_2, %g1, %r16
	.word 0xb93da001  ! 691: SRA_I	sra 	%r22, 0x0001, %r28
	.word 0xbfab0820  ! 692: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb63c0000  ! 694: XNOR_R	xnor 	%r16, %r0, %r27
	.word 0xb495215f  ! 700: ORcc_I	orcc 	%r20, 0x015f, %r26
	.word 0xbf480000  ! 702: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb7a80c20  ! 706: FMOVRLZ	dis not found

	setx	0xfec1f60e0000fc85, %g1, %r10
	.word 0x819a8000  ! 708: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d9420c6  ! 714: WRPR_PSTATE_I	wrpr	%r16, 0x00c6, %pstate
	.word 0xb3a90820  ! 715: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbbaa0820  ! 721: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb9520000  ! 724: RDPR_PIL	<illegal instruction>
	.word 0xb5ab0820  ! 727: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbfa00020  ! 729: FMOVs	fmovs	%f0, %f31
	.word 0xbba58960  ! 733: FMULq	dis not found

	.word 0xb7a489c0  ! 734: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xb3a5c860  ! 735: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a90820  ! 741: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb034e1bf  ! 744: SUBC_I	orn 	%r19, 0x01bf, %r24
	.word 0xbd3cb001  ! 747: SRAX_I	srax	%r18, 0x0001, %r30
	.word 0xb1a81820  ! 749: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb37c4400  ! 751: MOVR_R	movre	%r17, %r0, %r25
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 37)
	.word 0xbda589a0  ! 754: FDIVs	fdivs	%f22, %f0, %f30
	.word 0xbf51c000  ! 757: RDPR_TL	<illegal instruction>
	.word 0xb9a98820  ! 758: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb5a9c820  ! 760: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbb500000  ! 762: RDPR_TPC	<illegal instruction>
	.word 0xb9aac820  ! 763: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a81820  ! 764: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb1aa0820  ! 770: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb7a00540  ! 773: FSQRTd	fsqrt	
	mov	1, %r12
	.word 0x8f930000  ! 774: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0, %r12
	.word 0xa1930000  ! 775: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a81420  ! 776: FMOVRNZ	dis not found

hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 1b)
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbfa81c20  ! 780: FMOVRGEZ	dis not found

	.word 0xba346109  ! 782: ORN_I	orn 	%r17, 0x0109, %r29
	.word 0xbb520000  ! 785: RDPR_PIL	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 786: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 11)
	.word 0xb2b561dd  ! 797: SUBCcc_I	orncc 	%r21, 0x01dd, %r25
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 2)
	.word 0xb1a44860  ! 806: FADDq	dis not found

	.word 0xbda40860  ! 807: FADDq	dis not found

	.word 0xb150c000  ! 810: RDPR_TT	<illegal instruction>
	.word 0xb3ab0820  ! 818: FMOVGU	fmovs	%fcc1, %f0, %f25
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 23)
	.word 0xbdaa0820  ! 826: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbca58000  ! 827: SUBcc_R	subcc 	%r22, %r0, %r30
	.word 0xbf504000  ! 829: RDPR_TNPC	<illegal instruction>
	.word 0xbfa9c820  ! 830: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0x8d95a0a4  ! 831: WRPR_PSTATE_I	wrpr	%r22, 0x00a4, %pstate
	.word 0x83946044  ! 832: WRPR_TNPC_I	wrpr	%r17, 0x0044, %tnpc
	.word 0xbc440000  ! 833: ADDC_R	addc 	%r16, %r0, %r30
	.word 0xbda81c20  ! 834: FMOVRGEZ	dis not found

	.word 0xbb508000  ! 836: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a489a0  ! 842: FDIVs	fdivs	%f18, %f0, %f25
	.word 0xb1a5c9c0  ! 844: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xbd500000  ! 848: RDPR_TPC	<illegal instruction>
	.word 0xb9a80820  ! 850: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb7480000  ! 852: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb7a80c20  ! 854: FMOVRLZ	dis not found

	.word 0xb7a8c820  ! 855: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb7a48860  ! 860: FADDq	dis not found

	.word 0xb3a44920  ! 862: FMULs	fmuls	%f17, %f0, %f25
	.word 0xb5aa4820  ! 863: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbfabc820  ! 864: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb1a409e0  ! 866: FDIVq	dis not found

	.word 0x819520c8  ! 868: WRPR_TPC_I	wrpr	%r20, 0x00c8, %tpc
	.word 0xb7a00560  ! 876: FSQRTq	fsqrt	
	.word 0xbfa00020  ! 877: FMOVs	fmovs	%f0, %f31
	.word 0xb5aa0820  ! 879: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0x81946138  ! 880: WRPR_TPC_I	wrpr	%r17, 0x0138, %tpc
	.word 0x8594e1e5  ! 882: WRPR_TSTATE_I	wrpr	%r19, 0x01e5, %tstate
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 9)
	.word 0xbb500000  ! 889: RDPR_TPC	<illegal instruction>
	.word 0xb9a449e0  ! 890: FDIVq	dis not found

	.word 0xb0250000  ! 891: SUB_R	sub 	%r20, %r0, %r24
	.word 0xb3500000  ! 898: RDPR_TPC	<illegal instruction>
	.word 0xb4a520d9  ! 901: SUBcc_I	subcc 	%r20, 0x00d9, %r26
	.word 0xb4350000  ! 910: ORN_R	orn 	%r20, %r0, %r26
	.word 0xb6144000  ! 915: OR_R	or 	%r17, %r0, %r27
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 26)
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 23)
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 22)
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 37)
	.word 0xb5aa0820  ! 927: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb7a94820  ! 931: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbda80420  ! 934: FMOVRZ	dis not found

	.word 0xb1a50960  ! 935: FMULq	dis not found

	.word 0xb7480000  ! 940: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb5a588e0  ! 941: FSUBq	dis not found

	.word 0xbe1cc000  ! 942: XOR_R	xor 	%r19, %r0, %r31
	.word 0xbfa80c20  ! 943: FMOVRLZ	dis not found

	.word 0xbfa549e0  ! 944: FDIVq	dis not found

	.word 0xb5a40860  ! 945: FADDq	dis not found

	.word 0xb12c1000  ! 951: SLLX_R	sllx	%r16, %r0, %r24
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, c)
hwintr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_45), 16, 16)) -> intp(1, 0, 3)
	.word 0xb3a4c920  ! 955: FMULs	fmuls	%f19, %f0, %f25
	.word 0xbfa98820  ! 962: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbba84820  ! 963: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbba4c9e0  ! 966: FDIVq	dis not found

	.word 0xbdaac820  ! 968: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbba80820  ! 969: FMOVN	fmovs	%fcc1, %f0, %f29
	setx	data_start_1, %g1, %r17
	.word 0xbda81420  ! 974: FMOVRNZ	dis not found

	.word 0xb1a48960  ! 976: FMULq	dis not found

	setx	data_start_5, %g1, %r16
	.word 0xbbab8820  ! 978: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbba88820  ! 981: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a40920  ! 983: FMULs	fmuls	%f16, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb615211e  ! 987: OR_I	or 	%r20, 0x011e, %r27
	.word 0x9194618d  ! 989: WRPR_PIL_I	wrpr	%r17, 0x018d, %pil
	.word 0xbda50920  ! 990: FMULs	fmuls	%f20, %f0, %f30
	.word 0xb3a50960  ! 991: FMULq	dis not found

	.word 0xb9abc820  ! 992: FMOVVC	fmovs	%fcc1, %f0, %f28
hwintr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_46), 16, 16)) -> intp(1, 0, 25)

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

	.xword	0xff1c946888b50bd7
	.xword	0xdc440caa683f5950
	.xword	0xcacbd9c5d6aeff5d
	.xword	0x3b539a5a1756cf5e
	.xword	0x1a3fd1e66f0724bc
	.xword	0x011bb0481a61a41c
	.xword	0xd9bc86373c648aeb
	.xword	0xb79c38861b357c80
	.xword	0x2ba81da9e6b46480
	.xword	0x13b266645d4dbda3
	.xword	0xaa7389281a900a56
	.xword	0x9170df3333e4f9e0
	.xword	0x93f4586a5d4eb8e5
	.xword	0xfd748915ff57052f
	.xword	0xa5f86080ee689ee4
	.xword	0xc308d7cc30c2bcd4
	.xword	0x3a777ce0b17905ba
	.xword	0x1fb20318a5611f5c
	.xword	0x4f5f431327a929f4
	.xword	0x532663aa59a802d8
	.xword	0x76addf0fa2a49009
	.xword	0x759decdfb533664e
	.xword	0x512d422afb37aded
	.xword	0x0147d891b051786f
	.xword	0x10880d9927909ef4
	.xword	0xbafa751e9712a2ec
	.xword	0xc75ca7a1974575c5
	.xword	0x11669c6f4bb78a49
	.xword	0x84d1de7000014154
	.xword	0x78a27441f889e1f3
	.xword	0xd37ba55f285b0278
	.xword	0xd19d3c4bc31f2e53
	.xword	0xbac9fbcc97d3dd0b
	.xword	0x434589aa2b3f4dca
	.xword	0x1bb40915132e5c70
	.xword	0x36bd88e708555160
	.xword	0xab4d7cf657b5a20d
	.xword	0xb7a3d453c6485818
	.xword	0x4eedef307cb064fc
	.xword	0x1e8d1eb38df57a20
	.xword	0x61be6a6c812a58fe
	.xword	0xa175ae8aa809f25d
	.xword	0x0148e4f2e4184335
	.xword	0x758d283d701aa44d
	.xword	0x15e451bfec07a4e1
	.xword	0x87758950331d10e5
	.xword	0x8468a7a6b977fbc6
	.xword	0x2d8908f688f3da22
	.xword	0xc33fccf74f6ccf0d
	.xword	0xf8b00f817f6ca4d0
	.xword	0xacd9d4522fe64868
	.xword	0x1f7dec91ad89aa1e
	.xword	0x3f31ee52bf7b591e
	.xword	0x1fd5111b42a63642
	.xword	0x35429c95367e5185
	.xword	0xe2a96c8b28771e68
	.xword	0xce8533693b41c8ff
	.xword	0x3c1a8fc49547d439
	.xword	0xd0fb35ecd40c19f9
	.xword	0x98b975a29c323fba
	.xword	0x36fc1e0e662a5873
	.xword	0xf895a74f193be87d
	.xword	0x3acdd157faa1ad9a
	.xword	0xd10b9f36e1e8cf2d
	.xword	0xc4d8af309dacc6f1
	.xword	0x5abe8e00e489a572
	.xword	0x7b0ef7ba778d2f8e
	.xword	0x004b1963371f3f28
	.xword	0x56319fdbeace7367
	.xword	0x5681b24d8ab881a0
	.xword	0xcb170d12e41ca208
	.xword	0x0d555df899a4aebd
	.xword	0x713b0227e72a90f5
	.xword	0x1e85b081ca05d54e
	.xword	0x660dcb4252c7a63c
	.xword	0x623bc1cf1436a5e0
	.xword	0x97355123a9e56e25
	.xword	0x85fa19ddf3173ab7
	.xword	0x39f17e81e7a843f2
	.xword	0xa150332cae841767
	.xword	0x9c16403f5d0e8349
	.xword	0x8090147d6f11f7ee
	.xword	0xf64122875f3daa8f
	.xword	0x37ed1aa5950e6628
	.xword	0xf6789a0e745579e5
	.xword	0xe90443fcacdb9cf8
	.xword	0x298ef7a5a01c5f9e
	.xword	0x63f48dd6da7b3f25
	.xword	0x2f71e1c1ad5c6530
	.xword	0xef451e07be3fd279
	.xword	0x8acb4a9b74d1ee1f
	.xword	0x8996dcfdb65df493
	.xword	0x5e5894df625125d0
	.xword	0xdf57cafeb6138785
	.xword	0xde87c1455a16e22c
	.xword	0x20671ea23137ba48
	.xword	0xb9d4ff7c44e1ad21
	.xword	0x43dd2d8dbd2ac2eb
	.xword	0xa7026f4da8020af7
	.xword	0x64331e84090f50ce
	.xword	0xa2dd9b5c7f8e28df
	.xword	0xfe95453f5ceb3ae0
	.xword	0x74746eac8aee4705
	.xword	0x968cdf48b29a184f
	.xword	0xa0f9c827522f3769
	.xword	0x008c40f71a5cdec6
	.xword	0x432fc438038bb377
	.xword	0x5c6736a37ff74520
	.xword	0x7800178b2218d2f0
	.xword	0x645261039615bde6
	.xword	0x1c7fcc93496845ac
	.xword	0x30b8f102be8fb2c6
	.xword	0x624a4eee7ffd05ac
	.xword	0x2d1e14a830a0f115
	.xword	0xb11be41130e7b42f
	.xword	0xebff1f9ac3740673
	.xword	0x9dc1cc2f0480ab45
	.xword	0xfb31e8f8f96046b2
	.xword	0x95a5e2910f3c8e1d
	.xword	0xbdfb9205961d53eb
	.xword	0x1bba9f59f4d16fe8
	.xword	0x56e1c3b5c13d748d
	.xword	0x35a2c7f53c2e8e24
	.xword	0xa81552aa8cef4b1e
	.xword	0xd3a8549a6ffa8f11
	.xword	0xb173b9958d90001d
	.xword	0x786eded7ade8f9ae
	.xword	0xbd002dbdc9974983
	.xword	0x3d0455fe7523999a
	.xword	0xc40f30e32b94ed24
	.xword	0x9f7c1306d86cc254
	.xword	0x05f800e1e1fd270e
	.xword	0x37d984a484125f68
	.xword	0x7f98826d476441f3
	.xword	0x42c544fcf6071df2
	.xword	0xf7d060879af9cb8d
	.xword	0xa4a30f4aa3b707cf
	.xword	0x6c1c6f41bdfa5edd
	.xword	0x3ae0709a9066359b
	.xword	0xce5b77aa03e61fa3
	.xword	0x277d9daa1ac29c7f
	.xword	0x7349cac16d337139
	.xword	0x42d68648167d80fa
	.xword	0x6f011f1adb60b38b
	.xword	0xe6bdcf53b73def35
	.xword	0x666cbb045da3e4e3
	.xword	0xc497dc77cef57e2a
	.xword	0x83bf200088a7268e
	.xword	0x31ad2be66cb97f60
	.xword	0x6c62b4b49c6db161
	.xword	0x5681d6329ce95120
	.xword	0x9ea4e64ee167b5d8
	.xword	0x26fc3a2d9777f34b
	.xword	0x92e2c9ae616c276c
	.xword	0x541be86a5b8be4b5
	.xword	0x67fc751ea143c472
	.xword	0xdd951c62ddc1a2d2
	.xword	0x160427f83f76e92a
	.xword	0xb885ee52d56b0dfc
	.xword	0x1139474de45ab25b
	.xword	0xf013d194a48eb8b3
	.xword	0x4dacc08dce386336
	.xword	0x85968aeedcaa1686
	.xword	0x553206a9848346c8
	.xword	0xdb6b86f0d3bed39f
	.xword	0x885ac30285fabaf4
	.xword	0xff52c91b7be7e487
	.xword	0x8a1328b03ca68e4a
	.xword	0x05a4173edf026a8f
	.xword	0xfc7c847d169511f2
	.xword	0x45dc19cef56a3e7b
	.xword	0x57930078c6ce67c2
	.xword	0x83667dc496ed7b26
	.xword	0x745186d1cdff3a33
	.xword	0xa0a7e9fb0ea811e6
	.xword	0xd85a92f974c3ea62
	.xword	0xa9056ab425fefd56
	.xword	0xb99a8dec577f6108
	.xword	0x079e06f2f0eb8d15
	.xword	0x94adb5d252cdbebb
	.xword	0x99c39234e2966e25
	.xword	0xbd9c04461258e3eb
	.xword	0x474b8a0b90e02c5c
	.xword	0xfebff0ab08b25dfe
	.xword	0x82c8ee6a4f78a0ff
	.xword	0x2286da0f35eb42ef
	.xword	0x8eb6fea8cf41afe5
	.xword	0xac5d0944e6b934da
	.xword	0xb79912b5f1d36bd1
	.xword	0x990b6abd56ac5af8
	.xword	0x6b5aafbfba2ae907
	.xword	0x7e63d60e101b08ff
	.xword	0xc66477450be2a892
	.xword	0x67b11635d7860342
	.xword	0x2b611dfa11ceef98
	.xword	0xdb564d37bd4497a4
	.xword	0xde5a955fe5230dff
	.xword	0x0f65935aeefc0ffd
	.xword	0x819de5182d155c05
	.xword	0xd3ea76d28433e366
	.xword	0x672f083a3714c0dc
	.xword	0xfd1f046c7210f86b
	.xword	0xe6aa0e20151626e4
	.xword	0x2ac5697349e077d8
	.xword	0x653eb95f0ce8cbb8
	.xword	0x6aebe797670faefe
	.xword	0x3e53d1a796bde308
	.xword	0xf59157b7e9c329da
	.xword	0xb1ac51c09f35b567
	.xword	0x8ff9929c6c042b73
	.xword	0x5098d724e3d2cfa2
	.xword	0x3312912d0454d575
	.xword	0xd0aef51a0e8a644c
	.xword	0xd1f56e9199cf8a00
	.xword	0x9d143cc4d344b7c9
	.xword	0xa7fa2a3e370e64a3
	.xword	0x6a6835bec1970f61
	.xword	0x1093352b6dbdc034
	.xword	0x99648d24cdf201a6
	.xword	0x950264513c09c355
	.xword	0x5c0bba053ca7b1fd
	.xword	0x0f0f43763008407a
	.xword	0x826383ffe9a3b06c
	.xword	0xf2f449a0580f8233
	.xword	0x635be01dd06f93f2
	.xword	0xdf5d7c994fa85863
	.xword	0x0335ea3ba874ab11
	.xword	0x2cdf39dcea5dbede
	.xword	0xba87fa0fc1f3b62a
	.xword	0x8840694bfbb79255
	.xword	0x32418b301eee541b
	.xword	0x8b569526c324b7ac
	.xword	0xfc7399a9303af873
	.xword	0x9827372a10a50c3f
	.xword	0x32478d4c8ac36695
	.xword	0xb36dfb9e4397ba06
	.xword	0x7a9bcdfabcdafe4a
	.xword	0x5d603db7a4b082b1
	.xword	0x21410374ef967993
	.xword	0x81150aff0d5364c4
	.xword	0xfaf83ca5de583dea
	.xword	0x36e2a47e5298886f
	.xword	0xe17c703f5c91da62
	.xword	0x2d5cd33320205cca
	.xword	0xa6de003c95d51c02
	.xword	0x09720a4f7a16f456
	.xword	0x179fe0b39a6dc476
	.xword	0xe095ddeee4fa4374
	.xword	0x3b556851273682b2
	.xword	0x5bc96ed32cdab18a
	.xword	0xd6805f52a2a047ce
	.xword	0x80e6f41204e3779c
	.xword	0x8a4319a3a91007e8
	.xword	0x7c288c410eae5d57
	.xword	0xb7fea6c284dfd021
	.xword	0xf4256d47c102f996
	.align 0x2000
	.data
data_start_1:

	.xword	0x077ac3a46ad080c0
	.xword	0x52ac4873db8b7edf
	.xword	0xb906e6f96a899eee
	.xword	0xbc703106e9b917fa
	.xword	0x5af7eff305dafc66
	.xword	0x417ea132d0ca090a
	.xword	0x6f26cdfb7a13f365
	.xword	0x2115fe6067e4bae3
	.xword	0x35c6fc21690a674b
	.xword	0xc4c7f7a2e0100e97
	.xword	0x7fd675b70aaf32a9
	.xword	0xc4eae8bfaff030d3
	.xword	0xe256d698110b23af
	.xword	0xec8f61a16d23816a
	.xword	0xb410c8eaff16692c
	.xword	0xc02c3be8d9ef18d6
	.xword	0xad0dc06f10953b12
	.xword	0x00eed4273f797bbd
	.xword	0xeb5688f179fa6056
	.xword	0x643cb61d7a1628f8
	.xword	0xac83e90a5a1d7284
	.xword	0x02d6211e0e7769db
	.xword	0xaf926270c01ed6c2
	.xword	0xe6b7f5d699cabf28
	.xword	0xca45773ac204c9e2
	.xword	0xeecf10ccd11fbba4
	.xword	0x24251711f99bebe1
	.xword	0xcb3472268d8271b9
	.xword	0x97ab3cad0e306178
	.xword	0x244ae27dffdd937d
	.xword	0x0024f8ae3db7c7bd
	.xword	0x039d191dc2b99ea5
	.xword	0xd19f2998ceae8a4d
	.xword	0x1c56c5b27c5e0d95
	.xword	0x1d6c11b66f2812f5
	.xword	0x15d212ab87659130
	.xword	0xfcf8ceeaf6b6b06a
	.xword	0x894d5429c44d75e3
	.xword	0xab135ce584a3b691
	.xword	0xb8679473598f6ab3
	.xword	0x1cae202de3a212a0
	.xword	0xae8e19eab94b73bd
	.xword	0xee7214e78509b58d
	.xword	0x0d025f37bb8e8fda
	.xword	0xfe7b09d483466ed5
	.xword	0xfe288e2206924a08
	.xword	0xdaa1475a0eb96c43
	.xword	0xdcc6aeb9b19460d1
	.xword	0x4b2824a2db9a0fbd
	.xword	0x819784a193bae8e7
	.xword	0x4eed127f00ae95e5
	.xword	0x53eafbc8d88abb35
	.xword	0x7b489620781ade6e
	.xword	0x9b6d76168a9ba05c
	.xword	0x1083a624adfa9567
	.xword	0x61048b3361f254f8
	.xword	0x59ac1078745e2adc
	.xword	0x3f38233bbb67c7a3
	.xword	0x2d9cd7635ed58f84
	.xword	0x4412fa6767c6f761
	.xword	0x20b403cdb50c92ba
	.xword	0xc22c0e6a0affe339
	.xword	0x030b3ba1b7448ff7
	.xword	0xc8e7c3a86ed3d8df
	.xword	0xe356652f38adeea9
	.xword	0xb14bdb575d7f1141
	.xword	0x14771e372f8abe14
	.xword	0xd26b78e94c1c00d4
	.xword	0x4f4fd588a5476b36
	.xword	0x6088dd92616b2762
	.xword	0x7b36a88f14d154f0
	.xword	0x4398d4d8b3747ca1
	.xword	0x24b9e55b1b31c27a
	.xword	0x4ad55be3857526e7
	.xword	0xdb3ee61240e86164
	.xword	0x34cfbe1f36fcf6d8
	.xword	0x795acecb6662994e
	.xword	0x4b7d7d598bdbb8f6
	.xword	0xec42c7010d9e5b5f
	.xword	0xdcbdb927475fba11
	.xword	0x1d7538567359c6ab
	.xword	0x2779ac26a4cd313f
	.xword	0x087d7e5ac07cb7b0
	.xword	0x7dce2f063d19a48f
	.xword	0x47f4409457cc1757
	.xword	0x90c1e404ca270a4a
	.xword	0x7b7c2ac9d5b41977
	.xword	0x66f9dffae436bec3
	.xword	0xd07ec5285a2e9431
	.xword	0x78dcfa426ceeb868
	.xword	0xd449f5831f139d43
	.xword	0x69c6cd6822488c6a
	.xword	0x4791869060a234da
	.xword	0x57b9e95cf715928a
	.xword	0x6e5c4f2e12242f41
	.xword	0xe640d231a465d58b
	.xword	0x3b9bbe202e094701
	.xword	0x7d777dc7925d015b
	.xword	0xbf61f2c886ffb12e
	.xword	0xf65304a6a1c8a27b
	.xword	0x1933338b937df7c2
	.xword	0xfb6d8b77dca13ede
	.xword	0x93d70e1168430db1
	.xword	0x212a27257486f0d7
	.xword	0xd2c3129f10ca12d2
	.xword	0x78bc47603ac7f8ca
	.xword	0x7d7320cfd337090c
	.xword	0xb537db2d43606f29
	.xword	0x38f92695cd5bc707
	.xword	0xcd52c801bcd93fb8
	.xword	0x3840550ad2985618
	.xword	0xb5b757e8c75cc4f7
	.xword	0xb8de0f74c73e315f
	.xword	0x8832f4b207b7c649
	.xword	0xe7879f96910791de
	.xword	0x4b76c99a243a03a7
	.xword	0x991e37cec0b84984
	.xword	0x769e84c009071a28
	.xword	0x06b2e89108502e7d
	.xword	0xd0af372ebf7ccd51
	.xword	0x08d259ee5bb38428
	.xword	0x5b570a937f66c0ea
	.xword	0x4bd1353fac660771
	.xword	0xb0f37bb060964f09
	.xword	0x1812463cb9da7bfc
	.xword	0x64a4c754ddd7551e
	.xword	0x70f217891cd2f0be
	.xword	0xec68b66fdde18a07
	.xword	0x752cc1c48b1ad210
	.xword	0xa6d930540cf2611c
	.xword	0x9f4da511af0226dc
	.xword	0x4ea92fbfb90c399a
	.xword	0x4b7a508f63db71a9
	.xword	0x63c60d212bf39156
	.xword	0xead7fa00e6403b2a
	.xword	0x73b8691132c99118
	.xword	0xd077df0718739e8e
	.xword	0x32aac213eb98c823
	.xword	0xcb27faa498dbf45b
	.xword	0xae6358ac88a0a0a5
	.xword	0xeb77456514213878
	.xword	0x6bb034ccc612a3fb
	.xword	0x636d703b2ab45b26
	.xword	0xee54e7c39a91cb50
	.xword	0x2fcd94fc736ec00e
	.xword	0x90f5949f2face018
	.xword	0x8fa304398b963576
	.xword	0x9b9a2e85e515da13
	.xword	0x0a4e959ea5131460
	.xword	0x17856dad0d61efd1
	.xword	0xc3b20e168135a5af
	.xword	0xbfce3622dc3b0ab9
	.xword	0xbca9a2936cf2d6fe
	.xword	0xfcc21c8ed8a722ed
	.xword	0x762e8fc0ecf05ee7
	.xword	0xd29d5fb7fad1567f
	.xword	0xc6b952dcfaad05e0
	.xword	0x7499582b94a19fe8
	.xword	0xe9caa02d588a8e5d
	.xword	0x3530f8fe37afcb9a
	.xword	0xa28dd0e0cf8436d4
	.xword	0xace82aeba3ce77c3
	.xword	0xde6d725424597118
	.xword	0x2ae09db091dc3ddc
	.xword	0xf42d98d21ad3ea4b
	.xword	0x78ae95c9a2ad49d4
	.xword	0x8b6db3b763238e1c
	.xword	0x74f064be119fd785
	.xword	0x2c6c662a9d139488
	.xword	0x359e853af59e4afa
	.xword	0x0f555d39927554a4
	.xword	0x49be27c75505502a
	.xword	0x55a1f0965c367866
	.xword	0xca2d68ebdfd5a670
	.xword	0x47598fad18dd6969
	.xword	0x4e38f926f0bb5e37
	.xword	0xa9d18555282409bf
	.xword	0x48567a750a756d33
	.xword	0x431a595e0e8181bd
	.xword	0x62dbd77a92adb2bb
	.xword	0xeab78cc74d0255b7
	.xword	0x1f724525b4b83ea0
	.xword	0xf67639f77afecebd
	.xword	0x504f8655204e19f4
	.xword	0x1ebd62699ac03bfa
	.xword	0x9d810189645dae84
	.xword	0xa0029c08a43d931f
	.xword	0xf8087504ca8ec143
	.xword	0x1ce1919c61375833
	.xword	0x9772ac01285f0389
	.xword	0xefdee0c70075e738
	.xword	0xee5351c223e47c40
	.xword	0x6e344f289285242e
	.xword	0x01c587670796eadc
	.xword	0x3ae7eca3e11fa9bd
	.xword	0x6f81cbda477d8aca
	.xword	0xc70bb4449b149cea
	.xword	0xf510a4f888ae86a7
	.xword	0x24cde398586c13a7
	.xword	0x0a9a58ec3515b726
	.xword	0x6b46642156556745
	.xword	0xf0bfcb8a2c446674
	.xword	0xe31124f206d0cab1
	.xword	0x1502e1eaa6c7cf55
	.xword	0x6203cc009fcd26e8
	.xword	0x4e6af471668787f4
	.xword	0x4df959b1f3a2d754
	.xword	0xa66a23150731383a
	.xword	0xdfa59456de587a2d
	.xword	0x5ed166904ef76c0d
	.xword	0x98aad721ac144300
	.xword	0xbccdb1776aeaeab6
	.xword	0x66f7db172f7dd330
	.xword	0x3e316f41c24dc87b
	.xword	0xbffa1e8dfe11d134
	.xword	0x988e2f313cfea0dd
	.xword	0xf4df4d47eafff395
	.xword	0x68d2a867ae68010f
	.xword	0x457ed758c14a0cb1
	.xword	0x1b90501a9d4fc6ef
	.xword	0xd1dda017c117ac5f
	.xword	0x321f247daf7897f4
	.xword	0x164b4cea1dcc2ecf
	.xword	0x5ede83e6415ae3b8
	.xword	0xc321a64716be498c
	.xword	0x9757ca9c5755f6c5
	.xword	0xef608d0a1035c568
	.xword	0xf0b663a46a466433
	.xword	0x7196cf4ed8d8441c
	.xword	0x1f822c5a4530649e
	.xword	0x9ec8e5d7077a7d7f
	.xword	0x54fca8c8ed2f3330
	.xword	0x559b9ae3c930a28d
	.xword	0x11e7ec42ff8f78dc
	.xword	0x7bf5d0bfcf578bc6
	.xword	0x5c11950855f695af
	.xword	0xa57389a098f92127
	.xword	0xcc62156a128bfab9
	.xword	0x899bc340e17583d5
	.xword	0x23c62222b31105b6
	.xword	0x2a2a82a4d90e4495
	.xword	0x0f187202a038893c
	.xword	0xfbcec04862d284cf
	.xword	0x6129661a86342034
	.xword	0x0453ba671c992b39
	.xword	0x2761a0b7cd4adbff
	.xword	0x7cb8eba9f428e2cd
	.xword	0x15bc2b31bd9cec76
	.xword	0x1d2185c8fc342e27
	.xword	0x7d59d19c6199a734
	.xword	0xe31c1c762c03f1a8
	.xword	0x6adb75ec82f800ba
	.xword	0xeb161fed69b5dacc
	.xword	0xf028faa206ba6044
	.xword	0x28d0f57600ae426b
	.xword	0x51b6944f960cc99d
	.align 0x4000
	.data
data_start_2:

	.xword	0xd9b0f5b7f067fd68
	.xword	0xf9f251d03f864fc7
	.xword	0x485cce97e5d9cdff
	.xword	0xbb899b375cd8a117
	.xword	0x465010cba95a5b7d
	.xword	0x66ab77662dc83532
	.xword	0x648177c506cd37e3
	.xword	0xbbe925f3a4b229ea
	.xword	0xc8e71148c6b024bc
	.xword	0x55bfe53eaaff3eca
	.xword	0x72c062ed6c9e608c
	.xword	0x1397056c4ef9d2b9
	.xword	0x5c40d9ecda634746
	.xword	0xd00a2eb61698c36a
	.xword	0x38aa2a973db7de96
	.xword	0x679311096f0227f6
	.xword	0xf0c582980d313e6e
	.xword	0x07ba4b9d0aae2679
	.xword	0x34b958305b60b6d5
	.xword	0x1afdb1e5869d3bc5
	.xword	0xc3b028c67a88f147
	.xword	0xd49a290cfcac0a83
	.xword	0x06862494b2e68836
	.xword	0xd3a35ae8800aa1a8
	.xword	0xde29125bd2313bee
	.xword	0x08964ea886b084c8
	.xword	0x2aee5b971040718f
	.xword	0xa4e6596972942bf0
	.xword	0x7eb152834205ef86
	.xword	0xfef752ab7974c987
	.xword	0x5ad77748dde19e1b
	.xword	0xf5a27548ac405aaa
	.xword	0x802b78b0d3d25d1e
	.xword	0xf04d5beb014f140b
	.xword	0x5d97f14e117c92e6
	.xword	0x0ed67e84413b4f56
	.xword	0xedafe553eafb5744
	.xword	0x5a559bd75a9a3617
	.xword	0xb3870c36cb7ca3d4
	.xword	0x1db7aca4a7aa4e87
	.xword	0x61f346459047dec1
	.xword	0xc2e01f1eb1a6a4fd
	.xword	0xb7540fd42858d041
	.xword	0x55f851c8b6da8471
	.xword	0x2ac44b54e5dbc590
	.xword	0xea89256b512e258d
	.xword	0xa4b7d670a7bf3a8f
	.xword	0x199df8bdd5ad5a08
	.xword	0xb66ee0e1df65462a
	.xword	0x83d7a224b6257a1b
	.xword	0x33c6c679f996a24b
	.xword	0xace09c2a785a56a7
	.xword	0x48f396a2bf588bfa
	.xword	0x48d6e248f5c3edf0
	.xword	0xedb5f2db86be4dec
	.xword	0xf1031cce2ae3ab9e
	.xword	0x58a85b546ecfc327
	.xword	0x5e2cc053026b6259
	.xword	0x2eb65fb778a589a5
	.xword	0x6e411b8b26c57ebe
	.xword	0x23efa8b766ba6f7d
	.xword	0x028930e0c0b8cf9b
	.xword	0x162a46180e2c996a
	.xword	0x14e340d034d01ac7
	.xword	0x3b5db6958419de4c
	.xword	0x440d53b4702cefd7
	.xword	0x9e8e5ad037048628
	.xword	0xe5ff41cd8aafac59
	.xword	0x83e35f85e3c1c6af
	.xword	0xef4bb1e1fafa3907
	.xword	0xddfe1c0827286810
	.xword	0x6f50b4dc980d6f5b
	.xword	0x5096b9d4a12c281c
	.xword	0x2073aedffc8efaf9
	.xword	0xfe2717a439471b76
	.xword	0xaeee4f2bd1fa7852
	.xword	0x84ab687062576234
	.xword	0x7ad247e36e28f69b
	.xword	0x23d91e020f6c8d94
	.xword	0xff3f34218bf2011c
	.xword	0x4fd3b4f2a500e338
	.xword	0xb54bdf202974ff46
	.xword	0x4bdcae4e34f839b0
	.xword	0xc753960ec6748149
	.xword	0x7ba2b3b165f2fe42
	.xword	0x83d00e836fa4b610
	.xword	0x9fa1e3346c93451f
	.xword	0x98eb8634d93816a9
	.xword	0xa5cfd0d9ad518518
	.xword	0xe6c5fc2d923790e2
	.xword	0x0926666310884441
	.xword	0x878a2b3a2093d13c
	.xword	0xbebaeb0d95297480
	.xword	0x750bd216e6402bb2
	.xword	0x8762fb1aa7690478
	.xword	0x018f9addb62bd4cd
	.xword	0x42f476e552e0bfb2
	.xword	0x59b4c449a9043fa5
	.xword	0x64c9874c398628fd
	.xword	0x089610a3ce29ca7f
	.xword	0xb15602d487ae7e41
	.xword	0xa6bf7a4f11095487
	.xword	0x199f35228c4f1ff8
	.xword	0x557aa9140050cac9
	.xword	0xea833fc020792ef6
	.xword	0x4b46b0af95947c86
	.xword	0x077e5a4729fb8895
	.xword	0x5990efcf68593bf5
	.xword	0x32ff54cd8ddf0d5d
	.xword	0x209b3c40e8b12af1
	.xword	0xcb702716b3733432
	.xword	0xac94caf785fe3949
	.xword	0x191f01fdaa131693
	.xword	0xc03bbc156c931d13
	.xword	0x51028417c516180a
	.xword	0x91056c404df7e1a0
	.xword	0x6fc580b021000d2d
	.xword	0x5db1a52e1c3b03af
	.xword	0xdf644b5bd6e3a1ac
	.xword	0x2c89a64d2b08a272
	.xword	0x42a75aecd8d0285e
	.xword	0x3983e937e676fce0
	.xword	0x6bee87a3e36af2f0
	.xword	0xadd95f694eec3bf6
	.xword	0x7dc91ccc0720f95d
	.xword	0x67b44c14da0c6acc
	.xword	0xa73cd69532b4788f
	.xword	0xdd87ad00f153fc32
	.xword	0xd0c674895240cad1
	.xword	0xdf934236dc93a3d5
	.xword	0x16aa99ff44ccc550
	.xword	0xba629c09dc409379
	.xword	0xf5b174012e627b56
	.xword	0x99d93a8f7e055096
	.xword	0x85bb8eb561e72606
	.xword	0xeeff4186fc7458d5
	.xword	0x949cf788ea8874d2
	.xword	0x30ef94d71a689d10
	.xword	0xd4a8e23737a0cdc8
	.xword	0x2d05c1e5a3dd0610
	.xword	0xb7a0b37fd5671a14
	.xword	0x91bc0daedf6282f7
	.xword	0xc4eaab213cc596b4
	.xword	0x7c8a4e60494d76ea
	.xword	0xc4a4622a610f64a5
	.xword	0x2609690d79592fbf
	.xword	0x2d9f20e24b78ccc6
	.xword	0xf941213e01c0066e
	.xword	0x8c21c14adcad653f
	.xword	0xe85dc241f714c676
	.xword	0xd10c5bdd8033fa59
	.xword	0xc8c47fecbaeaf5e3
	.xword	0xbb78f9d1df498f7c
	.xword	0x7abd99ebeaf06518
	.xword	0xecc11f4b67272232
	.xword	0xff6c99eaf38bfab9
	.xword	0xae72c1e224f000a4
	.xword	0xec32f94ceaccf4d2
	.xword	0x5954b39a19d06d80
	.xword	0x7351622ac87e0132
	.xword	0xfa2e51c3027bb401
	.xword	0xf68b209a0acf0533
	.xword	0x9940eaa2557656e7
	.xword	0x16a1ba49e777fd99
	.xword	0x661d46a9f7327f07
	.xword	0x523c9397478feb0f
	.xword	0x119eae1c0689c8b9
	.xword	0xf0328a632b2d5deb
	.xword	0x981bb9854a0b7e23
	.xword	0xfe9359f1b6a1fad5
	.xword	0x7c686e77db261f5d
	.xword	0x3e3705caabb083de
	.xword	0xbad367c8decdfd98
	.xword	0x002c753eed817d58
	.xword	0x31306830e26e66fd
	.xword	0xee55ed0dec45bd8a
	.xword	0x05a60afbe8d3fdca
	.xword	0xcbf50b83e277f097
	.xword	0xa0b08f37c6745d74
	.xword	0x340d0a9e17f77184
	.xword	0xc82dc9e30cdbaa3d
	.xword	0x3d3c08e1df1e30f4
	.xword	0xd962bf1ae0baa8b4
	.xword	0xf3c1786c32254ab1
	.xword	0x73edd90ca65932ef
	.xword	0xade91b85736d9ff6
	.xword	0x72068f7d7ebaf05a
	.xword	0x2832c9114447f1ae
	.xword	0xa00593017469f384
	.xword	0x4d504fda61ff01bf
	.xword	0x25ce50461381bf51
	.xword	0xd219dcb71900b481
	.xword	0x9b9289c5345b3c52
	.xword	0x6b731109682b74bc
	.xword	0x5bacf56f1d88eea0
	.xword	0x8e31933545c088e5
	.xword	0x85dd8a2e50bc5e11
	.xword	0x8107c564519b94de
	.xword	0x66379ab7099a1529
	.xword	0xd64530dc2bdcf8b3
	.xword	0xa2ca2b95da09f610
	.xword	0x9c96bbef2e5e78a4
	.xword	0x11b7855fb559d258
	.xword	0xcb03625114fec521
	.xword	0x496e98ac0b2bf90c
	.xword	0x00c2f25eb4f88009
	.xword	0x6e17313d962a4426
	.xword	0x6f57337dbfe184c4
	.xword	0x2fc32abd51c70a29
	.xword	0xf9c8168592ffb038
	.xword	0x17930bb2c8221ed1
	.xword	0x66062184eedb8963
	.xword	0xdfcbee9d297ec503
	.xword	0xe5b0629c2cc5e21e
	.xword	0x6fe62bff84b93beb
	.xword	0xecee1fe9b4457c01
	.xword	0xb258f375907b7482
	.xword	0xdfadc133d91ffb70
	.xword	0x54dedd7edf9ac982
	.xword	0x52d069cb9e801ba2
	.xword	0x236bfa0dac0a35dc
	.xword	0x4e53a2d96e4fe003
	.xword	0xbce45d565e10dbdf
	.xword	0x9b05c040461786d6
	.xword	0x7dcbe96aa2d01eb2
	.xword	0x2d5b79dad7690af7
	.xword	0x5561a57bb9241e7f
	.xword	0x4f9c0aa9a044734f
	.xword	0x1b4ef7bcb61a125f
	.xword	0x5f791bef2791ec31
	.xword	0x4ceb9ba1ee5b7f47
	.xword	0x1ae258911ef18e00
	.xword	0x3250fd2d027ad200
	.xword	0x550fa4a57b110783
	.xword	0x894404c68c103015
	.xword	0xffddd58dae10d873
	.xword	0xd05045bb75658f12
	.xword	0x7c7afb31b57aa433
	.xword	0x47945bd3706d377a
	.xword	0x1739058d3a90ea91
	.xword	0xa05262912848b69b
	.xword	0x440b5df1cec16fa9
	.xword	0x9a6f884a7994b1e6
	.xword	0xf505ad564a8b067f
	.xword	0x58f1951ef60c572b
	.xword	0x6b6f96c4f6bb5e5a
	.xword	0xb7cc564ad5b10079
	.xword	0x942b2b9cc8058b8b
	.xword	0x0e588b8297f6c474
	.xword	0x0365e3931a275fc9
	.xword	0x5bfe3f7bec88eca0
	.xword	0xf9f3b7a240ad41c1
	.xword	0x135cefae9b8931f4
	.xword	0xc2300870ae2034c2
	.xword	0xb2b0e75d5428dd84
	.xword	0xe3ff788361d29be7
	.align 0x8000
	.data
data_start_3:

	.xword	0x25ced3ccb5242b88
	.xword	0x1f43e83b2c817996
	.xword	0x2f6188c8d15bd069
	.xword	0x3333c0879adbadc4
	.xword	0x2ffecf17ab221ddd
	.xword	0x0ba732719f12bb6f
	.xword	0xf56a558a145be00a
	.xword	0xb8e90b7f179fff56
	.xword	0xbc193f4da6b01528
	.xword	0x18c0e2945a5fd677
	.xword	0xc9bb118ede17c75c
	.xword	0xe2ba78bcb92203d4
	.xword	0x9ead881711e97f0f
	.xword	0x5c3f501ebf87e6f1
	.xword	0x7cc0bc4df670a4b9
	.xword	0x03c911714e928827
	.xword	0x9c05ced8f87dad52
	.xword	0x366d4a1957c83cf7
	.xword	0x2076f9f54ca9b538
	.xword	0x31f6f558c187c27e
	.xword	0xdcac81d1dc934659
	.xword	0x5a0066a144dcbb8b
	.xword	0xda89c6a1b9a49d1d
	.xword	0x9b1a2842607145d0
	.xword	0xde3fc9d377e1225c
	.xword	0x7267c356ee181ca1
	.xword	0x1b9700ec173c2c1a
	.xword	0x6d533c08fac04a6d
	.xword	0x0660ea4d702b5090
	.xword	0x6b85eb5dcd82675e
	.xword	0x7aa4bc88c1d8d139
	.xword	0x13dff7bb2b7b6f68
	.xword	0x3fe344250f732670
	.xword	0xdf6f12864da0a21c
	.xword	0x2bc3511a3fe045f2
	.xword	0xa0f31f03d84cb185
	.xword	0x194da4dc3bd360d9
	.xword	0x3d3835d808befcc1
	.xword	0x9948389dd34852ca
	.xword	0xe382e416df359579
	.xword	0x1ab835320b383ed0
	.xword	0x244c92a9794152de
	.xword	0x92c8fdbb118bb698
	.xword	0x79ef3dcb077c7491
	.xword	0xedfc5c49cd344407
	.xword	0xa7a9472c751bdafb
	.xword	0x5086481eccdedff9
	.xword	0x2aa810ccbd77c594
	.xword	0xcec1cc9634b2f674
	.xword	0x40a39bce686d3119
	.xword	0x920efcc423279869
	.xword	0x80dba494034d0f33
	.xword	0x78680aef1f2823e7
	.xword	0x0764b931f0c13a1a
	.xword	0x75ef33a8dc98059f
	.xword	0xef6c0e6aef2752af
	.xword	0xa19e03568b398c72
	.xword	0x683d649186fdbe97
	.xword	0xfdd77d1bdb8db408
	.xword	0xec11574d987c34ab
	.xword	0x1a9e6e152fdbe87b
	.xword	0x5e06e6e6384362f3
	.xword	0xd88e725636f3b6f8
	.xword	0x3ff4e40324a4c735
	.xword	0x20b4809e89fb7446
	.xword	0xd3e40e43e5e452ad
	.xword	0xaee6f8cb824f6dcd
	.xword	0xf328bf74300187a7
	.xword	0xa4d33e7b784dc7bd
	.xword	0x5f21f092f08d0197
	.xword	0x340daca4f4d4539c
	.xword	0xf791cf7462b5f826
	.xword	0xb616a054f9f347bd
	.xword	0xcbefb8309c88ebe9
	.xword	0x7a8a3c1917965fdd
	.xword	0xe609428fc35969e7
	.xword	0xdc34b1aa29db614b
	.xword	0x90b032f7a1bd99ca
	.xword	0x7cf191b6557980e1
	.xword	0x0e33df6b4849aac6
	.xword	0xe24e89d1cccde9d2
	.xword	0xa8d1d0adc9965b0a
	.xword	0xcc8af8b9be5f487f
	.xword	0x753088442377cd90
	.xword	0xa52a53f97224a076
	.xword	0xd7f0dc7122a35997
	.xword	0x476e18975b3392b9
	.xword	0x408131e5cbc7ce70
	.xword	0x9f3da18cd0c7f79d
	.xword	0x91e78422acb41499
	.xword	0xfe8c49a0d4812512
	.xword	0xd4aab8bae91565bc
	.xword	0x01ea7394d24a9c0e
	.xword	0x7ad8f558f2d68cd5
	.xword	0xfd584ecaa9d0de66
	.xword	0x34ba14f897b3fb31
	.xword	0x502da674f10df88b
	.xword	0x9c46593903f81f56
	.xword	0x15a4b08edd9558fb
	.xword	0xc15f4ffd79431567
	.xword	0x751f4ec778529b87
	.xword	0xcd664d9a5251717f
	.xword	0xab4af7fcd28d169c
	.xword	0xb14b944e944ebfcf
	.xword	0x4f3519f1f8f4753f
	.xword	0x254cdf873bc5ec18
	.xword	0x9f0137c4e4f51f44
	.xword	0x71c7feefccef044e
	.xword	0xa206b9ad216d124e
	.xword	0xd689133f960d8f91
	.xword	0x26bb729d95e5d0e1
	.xword	0x7608b27263352503
	.xword	0x2bd391647c4f7417
	.xword	0x3acf4ca9e25fedec
	.xword	0xf0ea5fe04ef9b984
	.xword	0x6c9f9a103ed401c5
	.xword	0xd7633f2e118b51c0
	.xword	0x4ad63fa081adc025
	.xword	0x08ebea7b828245ed
	.xword	0x975fdd273b9419bc
	.xword	0x59cf760cf7406bb4
	.xword	0x38061b6a2692b2f7
	.xword	0x398ce1c53fce055f
	.xword	0x8e599a342fcf3a2a
	.xword	0xe6a0f7afdcc36bbd
	.xword	0xe0fa7dd5452cb655
	.xword	0xe43edf8e2cc8e22f
	.xword	0xcb9b89e75a1b9efa
	.xword	0xd954fb967175e7b1
	.xword	0x9b58a1ac351332c9
	.xword	0x7ec555dba7cc19fa
	.xword	0xf86defbb8e31fa04
	.xword	0xca3df41ffc8dd2c1
	.xword	0x1842bef2861dcaec
	.xword	0x12679055b1de6a6e
	.xword	0x4f4ad2dbedd6db1e
	.xword	0x3adff450361327c4
	.xword	0xec92727d2c36905a
	.xword	0x1ae96663925d01ea
	.xword	0x269715e47950885e
	.xword	0xe3a7e676030ae89c
	.xword	0x39720056cf50ccb2
	.xword	0x1725a1468364b067
	.xword	0x4bbd067f31f4dd50
	.xword	0x49e89f00488ae3c7
	.xword	0x01aee97e50cc709d
	.xword	0xcdafdac47ad476c9
	.xword	0xc233412b2491280b
	.xword	0x2c123805a82c899a
	.xword	0xfe3d22166e1ae9af
	.xword	0x0bace4aac583aa14
	.xword	0x48375a8bea5891c0
	.xword	0x4ac5fbd9e961734d
	.xword	0x5c2db876a919e88f
	.xword	0x627a4fd387b15843
	.xword	0xdf02186099b5cb82
	.xword	0xe3105094f24a8fcb
	.xword	0xca5f339f333cd7d0
	.xword	0x7139c1dba1e5fe0b
	.xword	0x2ff7de332898077b
	.xword	0xa7d6a7617ff07ee7
	.xword	0x08eedca8bebe2f88
	.xword	0xadbc41db9e0ea3b8
	.xword	0xd3c2b87752434460
	.xword	0x59a7b9f3779ac812
	.xword	0xb5116ec3fdd75f7c
	.xword	0x615cf6dc58214254
	.xword	0x15206c98275de387
	.xword	0x9920daf2f109785e
	.xword	0x381488b3aa6aca87
	.xword	0x7979ca0cd7c7a321
	.xword	0xe72aa96e418bd4cc
	.xword	0x13361c98a2540493
	.xword	0x202d6bf52d3a95b4
	.xword	0x0551156544769207
	.xword	0xefe58bf071c8185e
	.xword	0xa0cbd4d428aeada8
	.xword	0x2ad1690aa94461cf
	.xword	0xeac50e65fa5f32a4
	.xword	0x738a7fde1e383db4
	.xword	0x4e2f24ce1e191dfe
	.xword	0x2f1b976908c9f355
	.xword	0xcb5e1e08ec12e357
	.xword	0x5753fa8025c94f48
	.xword	0xf9b0b6e77a11eeab
	.xword	0x7dd34f868e74811f
	.xword	0x6adaf22fdea4c29a
	.xword	0xe71405c6f371b404
	.xword	0xd5e42eaa180ec4ea
	.xword	0x211f9429ba2da9c7
	.xword	0xba11a8c208e504ba
	.xword	0x0f862703c8f7716c
	.xword	0xf5f7cf6f0fac26c1
	.xword	0xbf50881807b6b700
	.xword	0x6eacf23ca523a0af
	.xword	0x0b2b86fc51cf19b1
	.xword	0x0cf3125d0abae3a1
	.xword	0x2594068b129de8ae
	.xword	0xa8b997f56c40f6d6
	.xword	0xe97a6411cbe25ed8
	.xword	0x7e7fdb1dbcccf90f
	.xword	0x725ad978418abbad
	.xword	0x10f837354723d75a
	.xword	0xfa0eaa705e12f986
	.xword	0xd1141f9949df17ac
	.xword	0x4831c7b443d175f1
	.xword	0x357ca10f9361eefc
	.xword	0x76758b29183fab61
	.xword	0xf4fff73f002044e2
	.xword	0x166869493b57e1e4
	.xword	0xb6bf526e8df06db7
	.xword	0x61dbf3bfc369927c
	.xword	0xc4fe397cf94bab60
	.xword	0xa45e86ac27828372
	.xword	0x766ea429fa2422db
	.xword	0x49b49c5ccd2a1b25
	.xword	0xe14c7271c87e5a09
	.xword	0x7701a1409b5dc3df
	.xword	0x14775e723d82c8f3
	.xword	0x6884ef2e69d0d2aa
	.xword	0xdc0cb0b80e91f2f3
	.xword	0xf91fec3d715ab307
	.xword	0xe5366215199e314c
	.xword	0xca085516d93aba44
	.xword	0x021963d365f16eaf
	.xword	0x300d526c28f2bc6b
	.xword	0x5daea8952b2b260b
	.xword	0x7b115aefe74a7876
	.xword	0x19a5666d15a12e16
	.xword	0xcc99a277196e163e
	.xword	0xe924c45e63de861f
	.xword	0xfdb1027b41b4fa30
	.xword	0xa7b4862717102bc0
	.xword	0x4cc0d0dbfc68ae54
	.xword	0xef2fa6c5987222e3
	.xword	0x4f5d48761d10bb9b
	.xword	0x023cabff418c22d4
	.xword	0x966fb61dba27278a
	.xword	0xadcc801455511c03
	.xword	0x709fde1252ca16d6
	.xword	0xba706c3eef70ff5c
	.xword	0xfc5a49c7fdee6f9d
	.xword	0xf17016132764169e
	.xword	0xeef9efe546254c9c
	.xword	0x7073fcfa1e03d01d
	.xword	0x6b24768243060a41
	.xword	0x0d6769bd19829616
	.xword	0xe088f27d03f74db9
	.xword	0x35c4bf831402a9c8
	.xword	0x0ab0530286a086a0
	.xword	0x7fe6923cc22b4593
	.xword	0x9abc2af928d58a01
	.xword	0xb9547d70dcd90a71
	.xword	0xbe74117899bca616
	.xword	0xb56b581b487769cc
	.xword	0x57570856a82a4bee
	.align 0x10000
	.data
data_start_4:

	.xword	0xfd28d4101e5329cb
	.xword	0x1a5b870843f144a7
	.xword	0x221120a39a63fd7a
	.xword	0x74f2589574ad4954
	.xword	0x8095619d761df71c
	.xword	0x6f5a5269cfa067e3
	.xword	0x8cccd20683d8c432
	.xword	0xbdfc9664efc7a62d
	.xword	0x4741a25daa94c6bd
	.xword	0xb840c1fbbe4944d5
	.xword	0x39bdd3b218312586
	.xword	0xfdecb30fe90117b1
	.xword	0x684b8ec652fe3ecc
	.xword	0x32e343ebb2b8b361
	.xword	0x82ef0946c3c045aa
	.xword	0x16348b9034e5298f
	.xword	0x1eb9f21e535707dc
	.xword	0xc0611af5e86af13e
	.xword	0x94c30e5eeaa96870
	.xword	0x1016d507e39143ac
	.xword	0xe4e80dca6c417c13
	.xword	0xfd79f714edae7da6
	.xword	0xef4467ab007bae82
	.xword	0x0119a2ca24a02166
	.xword	0x6d2c5c4c82b70b5b
	.xword	0x10a9cb174b19298c
	.xword	0xe37c40a86595a069
	.xword	0x312d787f55272c38
	.xword	0xdafd9a77cd161c8d
	.xword	0x0356d2db8f285436
	.xword	0xb5feded903a981c3
	.xword	0xed5609524477cc91
	.xword	0x7c4a0342fced9a3e
	.xword	0x479df8b6763f5854
	.xword	0x25f3841255b4b516
	.xword	0x7fbd08d9398e9e0c
	.xword	0x6b4660ad050932b8
	.xword	0x804225e194f05387
	.xword	0x0a43fea34720165f
	.xword	0x36e14b86444be334
	.xword	0xc960c0f25bd37e09
	.xword	0x4ae5bc8df4513bb6
	.xword	0xaf29931627f0e0be
	.xword	0xc306fa6d8f0789d4
	.xword	0x075270a804db117a
	.xword	0x5eccfcbe6541dd4e
	.xword	0xa30db21ebb3e31f1
	.xword	0x32db569631174a6f
	.xword	0x7b2a56eb7b757961
	.xword	0xf8a89ff5c5094b7b
	.xword	0xc81ad71715e77507
	.xword	0xebe70c6732b67bbf
	.xword	0x53018b39d35387a5
	.xword	0xcc86db772a158719
	.xword	0x5db4a193d597ddba
	.xword	0x8feaad6747db16e9
	.xword	0x17eb3dc30f9ccbd4
	.xword	0xf1b094d2254efcdd
	.xword	0xc4f920a12992e3b2
	.xword	0x0238a9d0fc56caa5
	.xword	0x7f103656d49bdd94
	.xword	0x5dadb83fda69272d
	.xword	0x1c56b6104ad61b99
	.xword	0x182a59e06e9d3956
	.xword	0x1940f614b5be871d
	.xword	0xb939cec35ac9814b
	.xword	0xfc0a983ca83cead1
	.xword	0x814b8158e10f5df2
	.xword	0xa3a111aebf57d167
	.xword	0x4460f6ddc50296b3
	.xword	0x491975bc38d19dab
	.xword	0x738f2cecadb41ff7
	.xword	0xbc21c91d7d5d8568
	.xword	0x9ab923bcedeb5cb7
	.xword	0x4624b521381751b0
	.xword	0x97b1627880026f05
	.xword	0x22866454aee97c37
	.xword	0x8634422b83c5d331
	.xword	0x5c1012e3da04b205
	.xword	0x036a440b02fff390
	.xword	0x44796f550bda2d4a
	.xword	0xd12e8623ddb03d6b
	.xword	0x834a3f2b3383408f
	.xword	0xe1fc263023610f5e
	.xword	0x7fcc6a31530aab52
	.xword	0x22ce0e2023b47f97
	.xword	0xae282327283d867e
	.xword	0xbdd350e86452da9c
	.xword	0xf03137300462baaf
	.xword	0xc9f49b265c60e9b5
	.xword	0x4cd144d853c90513
	.xword	0x5c6356308412f4b1
	.xword	0x1a05d8163f77bfb3
	.xword	0xd092aa1739c2f5f8
	.xword	0x2d439ccb5eda5369
	.xword	0x1f47484270e100f0
	.xword	0x4cd7825645a2f2b3
	.xword	0x474529a36d14d2a9
	.xword	0x092afb5c86554689
	.xword	0xd78ee1444e34ae8c
	.xword	0xce7f5a3271fdbd3d
	.xword	0x509341a8e2a4cf26
	.xword	0xcb46744d3d2d2b73
	.xword	0x90ae48af1fd34f73
	.xword	0xa44454304b207e95
	.xword	0x1eb7d864c3d573c5
	.xword	0x5992a0749eb8e118
	.xword	0xa711ef046a64e752
	.xword	0xa338e48628ce1969
	.xword	0x2fb2044860f23e08
	.xword	0x23b90f99eaa747f8
	.xword	0x1ac1d052341167f6
	.xword	0x03e7b78dc2a16f0f
	.xword	0x22d171681b83a892
	.xword	0x6086f0500ff354d5
	.xword	0xa59247b899895054
	.xword	0xe2c2eed440d02600
	.xword	0x9c17297f53c31659
	.xword	0xf7bcb0409a08f90b
	.xword	0x8ee2bacd49d5edcf
	.xword	0x650eb8ed2d9c3a51
	.xword	0x0e0ca2225af011eb
	.xword	0xba44719d3e3f4c08
	.xword	0x9a486f4600af564b
	.xword	0x908bfc12b13e5e4a
	.xword	0x24229fdd3aa3f8e3
	.xword	0x9af47b23a27c5e1c
	.xword	0x882524b905b78cbe
	.xword	0xf636c6179b23b80e
	.xword	0xf7eb5c55a0bfbed0
	.xword	0x5d4034ca88001251
	.xword	0x16b01aab11870904
	.xword	0x302d22ecdfd07edb
	.xword	0xb29055c116f2cc14
	.xword	0x511c2e48365a47d7
	.xword	0x8eb3a7c22746530c
	.xword	0x4e144b9dcba358cd
	.xword	0x7c203f225ddd22a6
	.xword	0xf5052ffa5b0d9763
	.xword	0x9e1725dc63470722
	.xword	0x246ce3b7d9e790a0
	.xword	0x090e68d76d28396e
	.xword	0x5b6871cae013db52
	.xword	0x997fc7a98810cf29
	.xword	0x4c3498dcc79deafb
	.xword	0x98454803f37b9a28
	.xword	0x08bfffce8d00a86c
	.xword	0x741b5d86ae6557e1
	.xword	0xb08c5f9dce4ba1be
	.xword	0x3d79a3a527c250ef
	.xword	0x26e642a08891710a
	.xword	0x0de9e9fd8caf61ba
	.xword	0x111875efb19cef04
	.xword	0xcdb0d01b257c7cc2
	.xword	0x63fc279a50471990
	.xword	0xcdf6e64a3852b36b
	.xword	0xf9862b6adc0099f0
	.xword	0xe60bdb66b98d8df3
	.xword	0xfbbb09a17935259a
	.xword	0x8db16ccedb1fd012
	.xword	0xfbeddd9202487190
	.xword	0x72700675a0b53bdd
	.xword	0x6e603dccd0072f99
	.xword	0x85cd291796dc7fd3
	.xword	0x34b338e59c3b6245
	.xword	0xaf8989a9fc004d4d
	.xword	0x5de4f151e9a091e1
	.xword	0x4b433a398f1430c0
	.xword	0x9907348b47b3808b
	.xword	0x21ea55f5558d5ebc
	.xword	0x7d5993f6f5f7663c
	.xword	0x7e6f16a5c56336ff
	.xword	0x7f44414c4d29a6be
	.xword	0x3cdb42119ef699ee
	.xword	0xe0120ba15b82f9ed
	.xword	0x2c77e5c0bf80f6eb
	.xword	0x3df30a6f486c40f5
	.xword	0x9f4d707f2ac63326
	.xword	0x83d136979775dfa1
	.xword	0xe92300f8880a815b
	.xword	0x47787866ed210d75
	.xword	0x3e9055815c3bdfd3
	.xword	0xa22aefc00924f020
	.xword	0x27dc245c170b8745
	.xword	0x65be24693d8c9a25
	.xword	0x4e6f2da90b5ace51
	.xword	0x872a1e285c627b37
	.xword	0x346e1b3ebf86c1b8
	.xword	0x9a27ad497059d149
	.xword	0xff31ae6a28073296
	.xword	0xe415283a679be98d
	.xword	0xf89fe1107cac8e9e
	.xword	0xbe36d86f9bd21adf
	.xword	0x2e82be0ce0e06a38
	.xword	0x4ba017692f55c7d1
	.xword	0xab88fcae388f6954
	.xword	0x2e7b3248de998d05
	.xword	0xc8e6251dc668ca73
	.xword	0x3ec2eddb73bba3a6
	.xword	0x547edf04b6afa2b8
	.xword	0x86245a2c8716e70f
	.xword	0x4cc776b1876c8328
	.xword	0x0d41302c210ff661
	.xword	0xdcb6828f201ab314
	.xword	0xfa65099faefcdeba
	.xword	0x2c02ec3e07fb0f06
	.xword	0x1cb6d550df78a4ce
	.xword	0xca8d72ae47c04998
	.xword	0xf979200307a95075
	.xword	0xfe21e3325349e358
	.xword	0x1fb74fe5211d38c6
	.xword	0xf33cf8e9fc6c2ed3
	.xword	0x38e226ac7819077b
	.xword	0x567ac65e52647f3c
	.xword	0x2b83b79875e12f65
	.xword	0xc1f0d2322da5abba
	.xword	0x38fc93c530d2b757
	.xword	0xe83d4e39b2669385
	.xword	0x2f8c8848e603a553
	.xword	0xfe93a6bd0aad5cd6
	.xword	0x0e30c14a32e67cfb
	.xword	0xc037e09d9e009a65
	.xword	0x12bd80a4f32253f4
	.xword	0x04952154b9393696
	.xword	0xdeea5a2a8c4be616
	.xword	0x6a3e0d871dd93e92
	.xword	0x08a418bd1f5e7618
	.xword	0xb8673a2a74f6bcfc
	.xword	0x59a25905caa8db59
	.xword	0xfbfa9f1598b05e23
	.xword	0x74fb41ae303bc2a9
	.xword	0x47dc8cac62269c3f
	.xword	0xb921e1022500e4df
	.xword	0x803cfd5e60b8b92a
	.xword	0x99e1894f88f95311
	.xword	0x459c6a1409fcd36c
	.xword	0xc6fbb732f5d138e0
	.xword	0x49cb050e2e167791
	.xword	0xed57ee88e844b9fe
	.xword	0x10376322b4d9f6ec
	.xword	0x75437a670e8f8e46
	.xword	0xe292d34b21d5fc3c
	.xword	0x2bd4ab17ea9686b9
	.xword	0x903dd1fd805b2bc5
	.xword	0x2573dc6d287b084e
	.xword	0x83da43bca0d787d0
	.xword	0xc0745badb20df242
	.xword	0x330189da159b8db9
	.xword	0xea78b5d44de8f0c1
	.xword	0x62c64e7cf8fc8d37
	.xword	0x5144ec3759c3a0c0
	.xword	0xf99a8267eaca78c3
	.xword	0x2ddbabc04e86b1d0
	.xword	0x59596452a48c6c51
	.xword	0xa81a0b6e9695a493
	.xword	0x14352a6d0d3fcf32
	.align 0x20000
	.data
data_start_5:

	.xword	0x17fdced9aed2383e
	.xword	0xc5b73b03d6771663
	.xword	0xe310d726a5edb6c0
	.xword	0xca390d035b73f3e1
	.xword	0xab2f1d6b9aebb299
	.xword	0x69fa264efe2d065d
	.xword	0xcf7bfc105f5642cb
	.xword	0x4487378b213568ad
	.xword	0x4f4fe7ad29943ee5
	.xword	0x01144a3848eda083
	.xword	0xc38284201f062b44
	.xword	0xc6b7ee818843fc9b
	.xword	0x4b820937be732355
	.xword	0x7d176df60e489f08
	.xword	0x01724c99fea95857
	.xword	0xc05c7ba3b1bacb1a
	.xword	0xdacea1554e759894
	.xword	0x6c253f1ebd7e4230
	.xword	0x47297928ffb2ebfa
	.xword	0x14484a63d2205ec7
	.xword	0x715d6304ec99910f
	.xword	0xd03adf655a3efe93
	.xword	0x63c70e6d1ffc643a
	.xword	0x2e6bd0b41c45e697
	.xword	0x455e82db3bb2a5db
	.xword	0x742e3976bb1f98a5
	.xword	0x4b3b816d0b2bc306
	.xword	0xe527e4dc30a7f7cd
	.xword	0x34a0db5329e13d60
	.xword	0x211860385a7d397f
	.xword	0x1e651b2ac2cf482a
	.xword	0xf0389f9ae9ad12ea
	.xword	0xf3399db3e927937f
	.xword	0x90da8fccc231fa90
	.xword	0xf4f12f938583638d
	.xword	0xc402cb95f329a1a2
	.xword	0xf5310f10d09be185
	.xword	0xb264d2e87c489243
	.xword	0x8b3446b5355f984c
	.xword	0x4c7e7126c8665547
	.xword	0x19fa94107a6a666b
	.xword	0x53687770340a90a1
	.xword	0x66ffaf93e3fd8276
	.xword	0x14f705c411a646bc
	.xword	0x4c647ee6cfd12e3a
	.xword	0x14014a9a5f820c55
	.xword	0x3550f28ffe4aa666
	.xword	0x2326f94b8cea59a5
	.xword	0x1c0ccd9472bf03d0
	.xword	0x1db5df613433ddf0
	.xword	0x510467d0974005fd
	.xword	0x5e676d9c5f15a7c1
	.xword	0x677b8154893bede2
	.xword	0x242fb5d9b2320706
	.xword	0xf7b225fe79a9b296
	.xword	0x5bd6e2dcfedc6b92
	.xword	0x818addd9c2ca2455
	.xword	0x848b872302f03d14
	.xword	0x824b1c985cfbedb4
	.xword	0xd0be62aa0f93bbe9
	.xword	0x435f570fb2c09308
	.xword	0x216cd81d42b7da4f
	.xword	0x74f77461ee660fbb
	.xword	0xa94622af40269a56
	.xword	0xd9ce75e1014aa74a
	.xword	0x2ff1fdbb02eed074
	.xword	0xc29cd9c9ff5af7b9
	.xword	0x2ce9d9e3a55179d0
	.xword	0x16fb7c022a492710
	.xword	0x79b8a539c0e33250
	.xword	0x984090e4c7f27299
	.xword	0xbb3668da36af0191
	.xword	0x9803969e6740d40e
	.xword	0x2e2c9f8be8a5b146
	.xword	0x49ccbabe8de28057
	.xword	0x12a9d61b285eef1a
	.xword	0xe763359ab3abb279
	.xword	0xca24bacbd2010d14
	.xword	0x5e0bae6b4fc28500
	.xword	0xabcb8a3079f2db97
	.xword	0x4909e902daa5ab71
	.xword	0x1f38f4aa9110625b
	.xword	0x3c2ec0415fde5de4
	.xword	0xce4d9fbf031bff45
	.xword	0xc7201def65e244d5
	.xword	0x9a29f5a902365cda
	.xword	0x8047ecd3a17003ad
	.xword	0x75ff8e1f2fc0dc4d
	.xword	0x4235212b0daf4485
	.xword	0xe6c965df3d1c8b6d
	.xword	0x2fe303df6d36db25
	.xword	0x31e665e833c98b22
	.xword	0x3691ec4ccafa3f01
	.xword	0x285248450e34bd1b
	.xword	0xa8a89edcc92d16d2
	.xword	0xf6f5646a05dbe4be
	.xword	0xee03c916f96922ac
	.xword	0x99f0941a80756389
	.xword	0x9a1671a3e17757f7
	.xword	0x5131cc8e659dade0
	.xword	0x0728590c5aca0600
	.xword	0x24870cd6e29d340a
	.xword	0x2058ed7d3fbb8ca2
	.xword	0xd13ccdc13bef66bf
	.xword	0x029213ec9121eb92
	.xword	0xa03eecac61c549ae
	.xword	0x1a79daf595c389fa
	.xword	0xf601600f514a7178
	.xword	0x8098c040bcf733bc
	.xword	0xb6fef83b48136a0e
	.xword	0xe73dd85158cdec3c
	.xword	0x14f110d837deedd2
	.xword	0xfc1b6d062fc12ae2
	.xword	0x39cbfa78e880299d
	.xword	0xd37a74f380429da5
	.xword	0xfcbd2d604cec0bcd
	.xword	0xd1307460fe667411
	.xword	0xc909bbf6de888938
	.xword	0xfe6ed22f8599a8e4
	.xword	0x594e7dd717b89bab
	.xword	0xa433684778673369
	.xword	0x1ca4acb1c91c98ef
	.xword	0x80378e2795207faa
	.xword	0xa8d390fe3edde071
	.xword	0x33ed6ddc9734650c
	.xword	0x5f067b40183f369d
	.xword	0x3462c941e96a5b09
	.xword	0x62615a7a2d26fd11
	.xword	0xc060164e3cacf2c1
	.xword	0xc9620acc773503d0
	.xword	0x5f489884fb435598
	.xword	0x94e0334da4b3c492
	.xword	0x4ebc7350a59053eb
	.xword	0x50b513139496e1e9
	.xword	0x2e1108b1130966f5
	.xword	0x4ee489a26f88b17b
	.xword	0x754957be1aef9b67
	.xword	0x04f452d49dd213d0
	.xword	0x1a2be372157ca01b
	.xword	0x8754d90cf69cc0ae
	.xword	0xf90cca41b12b96c2
	.xword	0xcc3e652d5be692cb
	.xword	0xebf007a2112dc93d
	.xword	0xc8e9fb0a59490e15
	.xword	0xb0868404b73bf359
	.xword	0xde9425991a5f12f3
	.xword	0x402cc27bce0f4921
	.xword	0x19feb77211706904
	.xword	0x9b4442fe309d8f2b
	.xword	0x6303c58279ef5dd6
	.xword	0x0e1d35e0ea29ffc0
	.xword	0x7d5d65ee45f3ec91
	.xword	0xeb1ae258996eb75a
	.xword	0xe8d8f4bc7209bee5
	.xword	0x673920ea9f305fe9
	.xword	0xae94b47c9a0f8da1
	.xword	0x597d6ebfac2f21e3
	.xword	0x6880f405f745b2ce
	.xword	0x25ef3f7136c02838
	.xword	0x5ce63903f57d6699
	.xword	0x4a6c06e696aeaf42
	.xword	0x6887056c7056261f
	.xword	0x59d36de8817bde51
	.xword	0x63a4cdba68130b92
	.xword	0x225c59b2d8ad2ba9
	.xword	0x55bd4a183ab94118
	.xword	0x578de254f56d18ab
	.xword	0xd277ead7207b5b33
	.xword	0x487b25840db0e77f
	.xword	0x524edf476be3c82e
	.xword	0xb57465a333d4ad00
	.xword	0xc517a935659b7d73
	.xword	0x9b0e472c17e3206b
	.xword	0xa8e1c528e0838a43
	.xword	0x22f9a79407256d4c
	.xword	0x2083e79ea0a05c15
	.xword	0x488f88aaf229ed50
	.xword	0x42e936199005ad4c
	.xword	0x657fc0162e2350d5
	.xword	0x1d63024069a4e8f7
	.xword	0xf9324be8765ba9e5
	.xword	0x06280a17dd0af8f1
	.xword	0xbfd613e2e6f2542f
	.xword	0x132aebc5942681e0
	.xword	0x87de32c5fe8e840c
	.xword	0x5587a5b1a7422931
	.xword	0x9adea38880669abb
	.xword	0x96759dfbe53638f3
	.xword	0xd5e870c608149923
	.xword	0x2666bcf27e96fc3d
	.xword	0x539fa7fe03a2ed38
	.xword	0x47bec7501a51321e
	.xword	0xfe8e6a4d0d79a71c
	.xword	0x6393c2384c88d091
	.xword	0xcc5d91f44a94c025
	.xword	0xcefead00e18e72b8
	.xword	0x813fd4a82264b723
	.xword	0xe7f6a11aef921775
	.xword	0xda3bd50a48baccfd
	.xword	0x8378cf843166e8d9
	.xword	0x31e69da77ead36d2
	.xword	0xe350e4890920a797
	.xword	0x57e8f08328f28fbf
	.xword	0xed3bf996906d21bf
	.xword	0x8e99d6a5844710f3
	.xword	0x9cede2dde657ab61
	.xword	0x91b2f7938cba9b38
	.xword	0x32623a9f9171c80d
	.xword	0x0f417dd96e027b63
	.xword	0xbc69b3b7794bb05f
	.xword	0x9a99ae75d1644a48
	.xword	0x52f8fb56fc325661
	.xword	0x12690b94edc14120
	.xword	0x4fc8e7ecfc20cddb
	.xword	0x2e3a0d07d35bc038
	.xword	0x241d6417376f5625
	.xword	0x5fb3834f48d76a41
	.xword	0xf388b81f5018e344
	.xword	0xfc1cb83a9682abbc
	.xword	0xb1ad9fc40d977927
	.xword	0x0f857b8de715fe64
	.xword	0xd5f2153c12df2d48
	.xword	0x29745760a071ddd4
	.xword	0xa710fdd8d0c13eb2
	.xword	0xebe280a2f8ba06b2
	.xword	0x07aa7db465cf1c9d
	.xword	0x017682fbb8b9bcde
	.xword	0xc251caa08fbbf73e
	.xword	0xb4d4fe822605d429
	.xword	0xc7b4526c0efd7a4d
	.xword	0xbd1b49e3694fc83e
	.xword	0xb046f16625d643be
	.xword	0x8930f78b6307fa27
	.xword	0x0c9d8e803acd6481
	.xword	0x6167704a0af3c3ce
	.xword	0xa4ad5deef0709bb6
	.xword	0xc13f194496c56bfe
	.xword	0x2c324805dacb92fb
	.xword	0x39db053c2456f354
	.xword	0xed6478d4f73f4856
	.xword	0x37fe5da28e7422f4
	.xword	0x0a6f73bdb6e6337d
	.xword	0x1fd73f3883f81600
	.xword	0xd244db312f3f88c1
	.xword	0x0c3d7505939c363e
	.xword	0x27577338a07bf2c2
	.xword	0xd9ff4d3ab6ff11e3
	.xword	0x653929486ba40743
	.xword	0x33e0cd607c8c5b3f
	.xword	0x51b69eb471e454b6
	.xword	0x8aac9673f98254e8
	.xword	0x038d08266e6d504b
	.xword	0xd8958cb1d109059a
	.xword	0x18c2f5704136c879
	.xword	0x4a4c875f82ce4a5a
	.xword	0xad0e2833a5449311
	.align 0x40000
	.data
data_start_6:

	.xword	0x43476f47ae0e5a03
	.xword	0x3adfb02a4a135ae5
	.xword	0xc922f275398aab50
	.xword	0x2c40b485d57105f2
	.xword	0x6239be3ae479744f
	.xword	0x13f63a6150e3baf0
	.xword	0x67b925cd09acc9ca
	.xword	0x7537f98d683c1a20
	.xword	0xf79505a46dd95da4
	.xword	0xdd71f635e7f4c415
	.xword	0xd493afe87989adea
	.xword	0xbf3e52ad00911246
	.xword	0xcd12c18d365205fa
	.xword	0xec7747e80f075277
	.xword	0xc862539f610f8193
	.xword	0x164e4dc8e22efe71
	.xword	0x41fc19852ba3f826
	.xword	0x81b35979d4b0150a
	.xword	0x5f3830693ca89d89
	.xword	0x307b16f85f0a579d
	.xword	0x5f860585b05abde6
	.xword	0xc5b1d443a0c2da56
	.xword	0xf9b0e35a6a89013f
	.xword	0x15eaeaf4c1958128
	.xword	0x608b6185343a1870
	.xword	0x5ce25af873dc56c9
	.xword	0xdd84782e79b56084
	.xword	0xdd2a38f9140027a5
	.xword	0x6f29378164361850
	.xword	0xb3ab1f9ede500bbd
	.xword	0x0e84dc2ff3e23b7f
	.xword	0xc01a82ccd1f7acf5
	.xword	0x4cd32651cfa34efb
	.xword	0xff91fb858e9eb288
	.xword	0x28c4cba7059cc4f8
	.xword	0x48bcf0d95beef13b
	.xword	0xb30547b9819032d2
	.xword	0x4ed71362c2abe9ba
	.xword	0x206653f4597fba9f
	.xword	0x592257c2cfae7477
	.xword	0x3acb5bd8f93ce8da
	.xword	0xccc3f56bf344531b
	.xword	0xcad1ff6f3ed9eb4b
	.xword	0x82ec977605b4fd70
	.xword	0xe8e020f142f3994c
	.xword	0x723d8569ccfe89b2
	.xword	0xcd5597803c05bf7b
	.xword	0x9e7e3ff6233ce2fe
	.xword	0x75fb8d159439f502
	.xword	0x3ab77b58b814f4c5
	.xword	0x1e8bfbce53a87877
	.xword	0x7fd1c2624e7fcc26
	.xword	0xbb4218f22e7c00ea
	.xword	0xd0142e16553b1676
	.xword	0x856f2d43d78c67c4
	.xword	0x98898522bf243d9f
	.xword	0x26493d12fc72765b
	.xword	0xc0523d2906afd1d5
	.xword	0xf6eb40b00be95f2d
	.xword	0xba5e38aaf088e50d
	.xword	0x74ed5f4c9204e5fc
	.xword	0x5fd5b40007d2074c
	.xword	0x464421e95efb206d
	.xword	0x91b55c1d5e0be4a8
	.xword	0x8eb4be8cf238acdd
	.xword	0x9b80d9f7b6cd9637
	.xword	0xead7a16e9e2ef798
	.xword	0xc7274657ef3875d6
	.xword	0x2f87992456d24693
	.xword	0x4e6eff7508c1bc37
	.xword	0x91e4685b3c37cb3f
	.xword	0x1ce1627076c60f59
	.xword	0x40dc1514f427aa83
	.xword	0xdf26b59f3224e850
	.xword	0x671fe5fb5ac9e29e
	.xword	0x9ea3863749bc23a3
	.xword	0xc6c756da6f86dcb6
	.xword	0x159dcf5cb33ebdc4
	.xword	0xff98b90a709a7246
	.xword	0x940a8afccb503769
	.xword	0x43691d6fad589f20
	.xword	0x922e5418727e5ee6
	.xword	0x35363b6f11fcea73
	.xword	0xb5f4b25ea10cb9a9
	.xword	0xd50bb6f155bfb5ef
	.xword	0xa7104711ea752bcb
	.xword	0x32f9ba8c492728f4
	.xword	0x54c0c10e78f2bd59
	.xword	0x6b5cd238aa07bb45
	.xword	0x23021c9ff50f736d
	.xword	0x843615606feed474
	.xword	0xe29a8aa57e0a24c7
	.xword	0x52455e9ab7781d6d
	.xword	0x77d5fbc5463b6119
	.xword	0x0ec4d15daa39285d
	.xword	0x916b508b6276413a
	.xword	0x961af9999982c417
	.xword	0xd9e92cc20d534055
	.xword	0x8085744c262e3abc
	.xword	0x00649a4fbc6c82fd
	.xword	0xc40912a82defef3a
	.xword	0x96df130c1b771222
	.xword	0x988c7afb3ff635bd
	.xword	0x0d41fb461da016ff
	.xword	0xc1967cc7bee57568
	.xword	0xe902d488c1edffc0
	.xword	0x4a37275dd2be48fb
	.xword	0xfc336d23dfa4caa1
	.xword	0x8dfa690c732f26e6
	.xword	0x0707bd48a232d8c1
	.xword	0x1890b05ff63a146d
	.xword	0xbaa34430915a1f31
	.xword	0xc7194170e93387d6
	.xword	0x0e3b164fb7bfc3ce
	.xword	0x2e261e8a182b8da8
	.xword	0xb603c5a60951871b
	.xword	0x0cbdd64480cfb0b8
	.xword	0x6b23a09b921fa7b5
	.xword	0x5f5c86484565b292
	.xword	0x4efd3bded99b31a9
	.xword	0x3c889804211560e8
	.xword	0x14af289bb2858d74
	.xword	0x97ca7988c10a6386
	.xword	0x7466e1b2f613ef1a
	.xword	0x0fed57de56bad6d4
	.xword	0x53e0fc5099d61654
	.xword	0xa1dc647eacc214d4
	.xword	0x439af7efdd80bc3f
	.xword	0x3fec0db51bdfd2e0
	.xword	0xc9f70f5a06579855
	.xword	0x8329fab88f0d5c2a
	.xword	0xce6763ff0c5d9abe
	.xword	0x0dad7b40c354a89b
	.xword	0x1870d4e2158a751c
	.xword	0xd05fd37777ab80a7
	.xword	0xf243e2da241516de
	.xword	0xdebc2b8ab8063a63
	.xword	0x7bfb92911aa6dd99
	.xword	0x01071b168294786e
	.xword	0x3b10135691a77762
	.xword	0x98073070b90d5378
	.xword	0xdfc3a9211fe6f2ff
	.xword	0x787a9acb7a0c6aee
	.xword	0xc1f6b586967ba67e
	.xword	0x7283674fde3e39dd
	.xword	0x8e82226a683c9676
	.xword	0xe01552c64f3f2eab
	.xword	0xeb6c459543b4a91d
	.xword	0x6b753de0a63d813f
	.xword	0x6b8cb6707c5f3f33
	.xword	0xc27016c283e21278
	.xword	0xc58532d366e963ed
	.xword	0x4c96805326c87368
	.xword	0xd558d833f5d84d6e
	.xword	0x19b4ffa07d57e431
	.xword	0x56cf8a095489aff0
	.xword	0xabf295cc5a31f126
	.xword	0x45a6749e5761e933
	.xword	0x0a5ccf1648c605ec
	.xword	0x5c60d9c4b0496454
	.xword	0x88a7e56968a29b09
	.xword	0xc815c449cf8a0253
	.xword	0x863e9de1a3cd4a92
	.xword	0xf76e11dcd8d572f9
	.xword	0x81eac0d888c80cd8
	.xword	0xac1020b255bee368
	.xword	0x5ca34bbf4f2d7a10
	.xword	0xf14ce76417006396
	.xword	0xba3032fb85b3c0cd
	.xword	0x8a317214e78da6f9
	.xword	0x5647a091872ac6fd
	.xword	0x493ae6881959bfe6
	.xword	0xc908df24b47c250a
	.xword	0xeabac52131bdf974
	.xword	0xdfda49575b39a3f3
	.xword	0xfd4875cfbb1330c6
	.xword	0xfd57d3b10acabd11
	.xword	0x158f3fffe242e6c5
	.xword	0x662a3c0a38d59697
	.xword	0x22dd41ed59bcc811
	.xword	0xa4565c35ee3b8f8a
	.xword	0x8272814fdec6a49f
	.xword	0xc4d17fc190e7d4b1
	.xword	0xf0539608e0346ede
	.xword	0x577afab10501d781
	.xword	0xae5c171f32f95a8b
	.xword	0xc9ffb6ba547d2a7d
	.xword	0x01581fafb4b20a6e
	.xword	0x222a62c891de2cea
	.xword	0x176e174a80691089
	.xword	0xb67498ba919565ad
	.xword	0x2aa7fcf82a1852bd
	.xword	0xd8d1d513350e499e
	.xword	0xa09e2f18080d0027
	.xword	0x4e2cfb5dc8b3e5e9
	.xword	0xa7a4f9205e095930
	.xword	0x63a0cd4b46498ae4
	.xword	0xc27ff875f664d2a3
	.xword	0x8584bdfae4d11b9a
	.xword	0x888b1d89e2cbcdf1
	.xword	0x82c6835fc66066d3
	.xword	0xde4a644d562ab0d1
	.xword	0xb564ac56a7ed6b87
	.xword	0x9f2a1bfde7cf8c7b
	.xword	0x440368b05f30839b
	.xword	0xa15c1b3635519b16
	.xword	0xff44146f5259f1f7
	.xword	0x5902d3d336f78758
	.xword	0x7a3e07774ac0668f
	.xword	0x0d69e2efe9f9b14f
	.xword	0xbf8e5b3acf47c41c
	.xword	0x86bc112947f1bdd7
	.xword	0xb1943a8d2b1d0d89
	.xword	0x3d66793cd14f1773
	.xword	0x0f589cb6fc6ab2b9
	.xword	0xac9e213b487e4bc7
	.xword	0x423efeca83bde81c
	.xword	0xe9254bfe872d7d14
	.xword	0xe17b3e08bb3d87da
	.xword	0x32e67ffa411197fb
	.xword	0xb7354759439b7d2a
	.xword	0x789a15a3e87401ad
	.xword	0xb7bdec761262eba9
	.xword	0xba33a1b7b8e1d929
	.xword	0x1edf131d932f7132
	.xword	0x6fd452eeb229ce86
	.xword	0xb6bcc2775d6572be
	.xword	0xa1f08c61f071e8f3
	.xword	0xfb6d1345aa50316e
	.xword	0xaf88fb60d8fbe232
	.xword	0xfc9afd1973eb69c0
	.xword	0x2bc58e9caed4d7ab
	.xword	0xe0a9f04c20648dde
	.xword	0x3d78969be2ba2485
	.xword	0x23deacd47a2e3133
	.xword	0xa709e5d370d4191d
	.xword	0x0b4242374c71610c
	.xword	0xd9945ca3dcb97c5c
	.xword	0x74470518ecacf986
	.xword	0x9cb7aaa4e8233fa2
	.xword	0xe14e628154f568cc
	.xword	0x73bd19885f231509
	.xword	0xbf093cf8b2405ea3
	.xword	0xe7ce0cd415da75d2
	.xword	0xfda8a5b66dc5b355
	.xword	0xb6282c5333e8121c
	.xword	0xa88a0bdb573c5d43
	.xword	0x3d897c14c91255d8
	.xword	0x50a6ba4c48d4f47e
	.xword	0x15704b889f3f314c
	.xword	0x3235fc04df70f66e
	.xword	0x84fd658490c377f6
	.xword	0x1542437b70147d07
	.xword	0x4b8aeb13bb58bf4f
	.xword	0x6594281c58d33fc7
	.xword	0xad34186c3ba8f249
	.align 0x80000
	.data
data_start_7:

	.xword	0x06617cd07229e8d7
	.xword	0xbcdda8712165b4ff
	.xword	0xd222a5f257498ae6
	.xword	0xbd8cf001b0877801
	.xword	0x6db74fdfdf81abd3
	.xword	0x23c8f0824bb0c1f0
	.xword	0xe0fc71f313d5951b
	.xword	0x538916deea5de30d
	.xword	0x5953896448fc33e0
	.xword	0x71f590054ca3ef4c
	.xword	0x9be3bd502e0416e9
	.xword	0x1654e1b051abdba5
	.xword	0x330cf207d02e0875
	.xword	0x9b559535cb57e38c
	.xword	0x072bb61e62059454
	.xword	0x3e49e2d43005e6dd
	.xword	0xf15e481d64609660
	.xword	0x2b1586670f180ec9
	.xword	0x3f6509444fb9e1ce
	.xword	0x74b81d490c9bd499
	.xword	0x70debf24d677b09b
	.xword	0x4f7c440f98668930
	.xword	0x7115fab51fd46364
	.xword	0x073526c07da94d9d
	.xword	0xf7a0f43faac7dcc6
	.xword	0x2b0ad032aa63e716
	.xword	0x5fd695bb51f24c23
	.xword	0x8367c7aaf40e3ac9
	.xword	0xc03bbaecfc156453
	.xword	0x70bd831cdb677d3c
	.xword	0xa7904997913f8f0d
	.xword	0x4f72bb439adf9745
	.xword	0xfd643d68fe9cbb23
	.xword	0x690f4f8d4758bd13
	.xword	0xf9dfe4ec7ec7f72f
	.xword	0x3f33f8b37527403f
	.xword	0xb17a84627b3e7018
	.xword	0xb605b7a1724b2a2e
	.xword	0xc8eade7f92bd0f06
	.xword	0xe39c747b5f46c61a
	.xword	0x4864a369c0235817
	.xword	0x28d87df6444e1d68
	.xword	0x8601e8bd90fbcac0
	.xword	0x06d359c8a3620842
	.xword	0xcbb69cc8f3a23fef
	.xword	0x9581ceefeb47be5f
	.xword	0x5781ed247eea61e5
	.xword	0x812a3974d62c96cd
	.xword	0x718b8b7f8a134b6d
	.xword	0x2775f77cad1dbc7b
	.xword	0xee9446c974f33b04
	.xword	0x2c248fe9a6b9e71c
	.xword	0x1b72aa4e846149c4
	.xword	0xc5bb7b59af584d58
	.xword	0x89286f24a5c401ba
	.xword	0x7a297d03058aa928
	.xword	0xfe254535703a0628
	.xword	0xcec2f06c0329cfc9
	.xword	0x49bfc14ba2d96849
	.xword	0x895ba9782747ae27
	.xword	0xaf3ce4843c9cef71
	.xword	0xbc6f5992227ea44d
	.xword	0x59a899f15e02b20c
	.xword	0x33ee3a2c902a781a
	.xword	0x4fa51067e2ae0b92
	.xword	0x7a6423058227dd61
	.xword	0x21f404e9b31a37ea
	.xword	0x4ba5045be53a0518
	.xword	0x20b7275789df846e
	.xword	0xd578aabd92eeaf4e
	.xword	0xfce91ee715397c70
	.xword	0x5678626c94b57c02
	.xword	0x32a692990625ffac
	.xword	0x6fdf1ece1b0bb9e8
	.xword	0x46376a5e450f5bd1
	.xword	0xba5ea11a8fde8d82
	.xword	0xffce78cb60a55abf
	.xword	0x95e9cc7ba25a81cd
	.xword	0x7c5b8dcbc2c0b58d
	.xword	0xdf7acd6411f8f484
	.xword	0x2f3fcb944be5b390
	.xword	0x1dd14cf3ad501e21
	.xword	0xd5859b6bd052d233
	.xword	0x38e11142f9fd62ae
	.xword	0x8f98ea91ec752f90
	.xword	0x187badfcda8d4684
	.xword	0x2e1bd14eb8c2bf64
	.xword	0xa0b412e577b746f5
	.xword	0xefb5554956dc87bb
	.xword	0x969992602e62e2e9
	.xword	0x4d89a335936ea95a
	.xword	0xb31b1de8666da322
	.xword	0x217f7b7492c922ee
	.xword	0x53f2bcd343e37cf9
	.xword	0xa7afccbfa3eba815
	.xword	0xd4578d9f65e829c9
	.xword	0x7db7e6be4ddb10d0
	.xword	0x587e65830bf55cd9
	.xword	0xe9b42e2416389930
	.xword	0xe217614d37366831
	.xword	0x97407354c41ae4a7
	.xword	0x0021bd2b11ddd9de
	.xword	0x53cb983df979c3eb
	.xword	0x687b859eb50f3ab1
	.xword	0xf49a376f0c474d78
	.xword	0xef88c813d95208ce
	.xword	0xdf4e4271a548b745
	.xword	0x855d09c1d5f79def
	.xword	0x9cb6be19c3baeee4
	.xword	0xa9cc971090ad58b6
	.xword	0x98263ecc762fe21e
	.xword	0x5b55027c77ffd0e0
	.xword	0xd9d942cbf36176a0
	.xword	0x17a897c2d13068a7
	.xword	0x0a6135d415757308
	.xword	0xe537817a257fc47e
	.xword	0xa3feb7e25a8b0ead
	.xword	0xaf82a1034ed642ad
	.xword	0x36fc03c896ad70e0
	.xword	0x0e9cd8771d8834b1
	.xword	0x79ef95292fc53b3f
	.xword	0x9dfc95d561660d99
	.xword	0xddbdb93fbbf1dd7f
	.xword	0x1ba03c96a2105b47
	.xword	0x3d9ed1472c0e7bd2
	.xword	0x40ec05e2fbb08590
	.xword	0x324bc5cfa6c0a84c
	.xword	0xc12c643f0d132f22
	.xword	0xc01f0791709b9d2a
	.xword	0xae4a03db4fa71b8f
	.xword	0x9ce841d92a6eaa63
	.xword	0xdefb6bf72577ff07
	.xword	0xa20f4ad1c4cd7a75
	.xword	0x886d14adff657e13
	.xword	0xac2dc76029e5918b
	.xword	0x1c38cce468912cac
	.xword	0xc39e6b82fed69060
	.xword	0x6dceafef052f5183
	.xword	0x56f36c669f35e226
	.xword	0x2d97fb2417e22447
	.xword	0x459ddf729e7cef89
	.xword	0xb903d334d25e13df
	.xword	0x6fb9b05687f9bc07
	.xword	0x50c76bcef746ef84
	.xword	0x11f884051f00161f
	.xword	0xfac1f8b8ba5aa9fd
	.xword	0x9511142117cd3930
	.xword	0x49239843c761e756
	.xword	0x3fa343f9267467ac
	.xword	0x5a1023af6e021f9f
	.xword	0xbbb1f87a48d1af07
	.xword	0x4c7fcfad1ebf6971
	.xword	0x776d1990b88d14a0
	.xword	0x6508442550f336c7
	.xword	0x19811d65bf151659
	.xword	0x721e958ea59a6a31
	.xword	0x352419173344fc14
	.xword	0x880e5bde40ed74bf
	.xword	0x8d1ba5332165d58b
	.xword	0x937d4f07d6a3a64d
	.xword	0xfb116fa1bb5619a5
	.xword	0x064d0374cb643234
	.xword	0x831cbf214a1cc59b
	.xword	0x5a85ae3075fd3025
	.xword	0x74658f70572291ff
	.xword	0xc45efc41d0d076f5
	.xword	0x39c7000553413f1d
	.xword	0x0ffbedc16140da1c
	.xword	0x9a79ce324ed0ef8a
	.xword	0x30e2748f7cc55317
	.xword	0xd79485a9b7dda3ed
	.xword	0x8dadf8c492ec0def
	.xword	0x1b513c4ef19444e8
	.xword	0xf7255395d1b55d52
	.xword	0x132b7044353a96e6
	.xword	0x0e542ab573c09306
	.xword	0x66be21d6d59456ac
	.xword	0x430cd8988b3b818c
	.xword	0xa4477f9dabe470c9
	.xword	0x122464f40fe814e6
	.xword	0x4bf66a0f9945a137
	.xword	0x97d21bc443cc7112
	.xword	0xddaec0040b8914a2
	.xword	0xc2deca82f055810b
	.xword	0x8d2062846415565c
	.xword	0xd884620da4851d6e
	.xword	0xb7fe0cb002060561
	.xword	0xe1810f5dd2fa622d
	.xword	0x20d35813accde9c1
	.xword	0x374154a0c7940f76
	.xword	0x03c8b7ef8c756352
	.xword	0xb9b2193a4282d65f
	.xword	0x8c9bc1d6ad022e65
	.xword	0x04faad74bff79532
	.xword	0xa55821979b5428ff
	.xword	0x6e9b4a51365b9013
	.xword	0x9c4be4aa857ed02f
	.xword	0x2f42a0414bfa237e
	.xword	0xc1fa3d09d224924c
	.xword	0x2d525e6ad729108b
	.xword	0xad4b1983e4163a53
	.xword	0xa03cd4a8f69c8950
	.xword	0xfb9fdea893d95b36
	.xword	0xa35605a130b02eae
	.xword	0x73b4fdca2ca98c8d
	.xword	0x8d5e2c9da35cc18f
	.xword	0x1b6c346c7526d7e4
	.xword	0x76f3db5d8bf91b29
	.xword	0x279924c3d82e0805
	.xword	0x9eee4834e3f0982b
	.xword	0xb83ad647918da9f0
	.xword	0xfd7af8f278459ab0
	.xword	0x3457d47d804ed290
	.xword	0xa10fa6782ac3b3c5
	.xword	0x08a980d0b3db5a22
	.xword	0x4215152734ff7561
	.xword	0xb00eacf4fdbde62a
	.xword	0x7e448120a98e4626
	.xword	0x3997089a76c26168
	.xword	0x5e04133eea8c0114
	.xword	0x8d9f9e6c28fe691e
	.xword	0x4e75ce15f619d51d
	.xword	0xf9907119acc9c63a
	.xword	0x9f9c69e44645ee59
	.xword	0x50d5179814afc5cb
	.xword	0xff6f29aa33b3332d
	.xword	0xbdfbbd3cd5e505aa
	.xword	0x06500d57b34465a3
	.xword	0x966d302f3b1dd816
	.xword	0xd07599aa739b7f90
	.xword	0x5b8e4e96866db908
	.xword	0x81af71c5725aa11d
	.xword	0x2e28e325f3ab06b0
	.xword	0x434d3dd89e42ad2f
	.xword	0x6b7a12dab7c8c913
	.xword	0xac31dce03eeb7b73
	.xword	0xf3a81720d3c24b2a
	.xword	0xb374bcc080d8cf88
	.xword	0x7ee1d23e4c5154d2
	.xword	0xe93cd89aeb06f4f6
	.xword	0xb2ba8e842eff0c18
	.xword	0x211d9200a53bb55c
	.xword	0xe99f3ff0ee49ce48
	.xword	0xbd403cf64574d793
	.xword	0x79300a470a563edc
	.xword	0x70be5ec1c0b9fc55
	.xword	0x2323ffc9f5f2ebaf
	.xword	0x0d2ceb4cc57b4667
	.xword	0xf08e6b1794e5444f
	.xword	0xa95df27d5f2eb7fc
	.xword	0xccb84beac2889b93
	.xword	0x07bbc9f126161f10
	.xword	0x461ce09c677f8012
	.xword	0x6c5f4617ac88cfab
	.xword	0xba84afbff0631b21
	.xword	0x768e165822efb3fa



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
