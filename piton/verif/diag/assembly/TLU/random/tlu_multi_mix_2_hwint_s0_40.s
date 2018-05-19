// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_40.s
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
   random seed:	599273681
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

	setx 0x0dcb4a2c70ba00da, %g1, %g0
	setx 0x773cb072dfb3be48, %g1, %g1
	setx 0x289fd785c244e76a, %g1, %g2
	setx 0x62a8f9b81e838a02, %g1, %g3
	setx 0x006aa16eb42bcf08, %g1, %g4
	setx 0xa60980b9f24ef226, %g1, %g5
	setx 0x6f940a84731c2bef, %g1, %g6
	setx 0xdaf5724307e264ba, %g1, %g7
	setx 0xf81c6b90a5fedbcc, %g1, %r16
	setx 0x71ecb20d8c10164a, %g1, %r17
	setx 0x359559389a96afe1, %g1, %r18
	setx 0xb80bae7be4c2af26, %g1, %r19
	setx 0xd1e23fad640bc472, %g1, %r20
	setx 0xe2b0a30a92449d3d, %g1, %r21
	setx 0x3137d8e6c25f4f56, %g1, %r22
	setx 0x44a2a6e7aa1a4dd6, %g1, %r23
	setx 0xf0cf720e00b653f1, %g1, %r24
	setx 0x60811b6611a3e23c, %g1, %r25
	setx 0xf69ddf2b7f7e2c55, %g1, %r26
	setx 0xce35c6a3eb78e661, %g1, %r27
	setx 0xf9c079039a33dfec, %g1, %r28
	setx 0xef842b137ac91477, %g1, %r29
	setx 0xbacf8ec2c8b8167f, %g1, %r30
	setx 0x2f039166cc6e6cce, %g1, %r31
	save
	setx 0x2a7c3d01a881ba89, %g1, %r16
	setx 0xc5267915db47a613, %g1, %r17
	setx 0x2f1ee046e3737a04, %g1, %r18
	setx 0x9ad0d3617d46c8c2, %g1, %r19
	setx 0x5147f9e3bd6fd091, %g1, %r20
	setx 0x8fc70e42907204f2, %g1, %r21
	setx 0xab98aa2ea392237c, %g1, %r22
	setx 0xaea2172e059a1f7f, %g1, %r23
	setx 0x5f1cbf1234dec5e2, %g1, %r24
	setx 0xbc6438307ca59a4a, %g1, %r25
	setx 0xda7f56e105fe4201, %g1, %r26
	setx 0x806b65f1dd0eeb13, %g1, %r27
	setx 0x244704814d1ae0a5, %g1, %r28
	setx 0xd5089870ef515409, %g1, %r29
	setx 0xe51413e6a196d7f3, %g1, %r30
	setx 0x8fdbe49d23887d35, %g1, %r31
	save
	setx 0x0b4352e58c4db931, %g1, %r16
	setx 0xd868f1ca8beb714c, %g1, %r17
	setx 0x1bd1b7866809f61b, %g1, %r18
	setx 0xb372ab8c8eb53724, %g1, %r19
	setx 0x9c3dbdaac640de01, %g1, %r20
	setx 0xdb9c2f2be7f6db78, %g1, %r21
	setx 0x4d927804fe52d96b, %g1, %r22
	setx 0xb15a02a26890c101, %g1, %r23
	setx 0x5a267d05fe61bb13, %g1, %r24
	setx 0xdbcde50bab96ab48, %g1, %r25
	setx 0x6c6ee401573f11cb, %g1, %r26
	setx 0x8b761be3e2cd8371, %g1, %r27
	setx 0xeaacdaac9b8dad87, %g1, %r28
	setx 0x8416ce84a96c0daf, %g1, %r29
	setx 0xc3627d062afbfefb, %g1, %r30
	setx 0xb33b825d1af68d5c, %g1, %r31
	save
	setx 0xabbab38a70b72055, %g1, %r16
	setx 0x5b218d0c81576b94, %g1, %r17
	setx 0xa06e504195571e16, %g1, %r18
	setx 0x8eb079d102bd437a, %g1, %r19
	setx 0x399e92e256e5a703, %g1, %r20
	setx 0x9e1b1e4d189c6333, %g1, %r21
	setx 0x79d155ed4d7b56d0, %g1, %r22
	setx 0x8e7a36bd757dfbd8, %g1, %r23
	setx 0x9559868e5c43f44b, %g1, %r24
	setx 0x872863af85cf7a5e, %g1, %r25
	setx 0xb48c3d5d2bacf43b, %g1, %r26
	setx 0x6bf0ed1cb8c77e24, %g1, %r27
	setx 0x07d6a96e1f53d041, %g1, %r28
	setx 0x57184c3db3b74d21, %g1, %r29
	setx 0x23f195b6536ce24e, %g1, %r30
	setx 0xa52075accba03f57, %g1, %r31
	save
	setx 0xe97645629abdb1ce, %g1, %r16
	setx 0x406972e91d0f4a44, %g1, %r17
	setx 0xfdb8383bd3e72f4d, %g1, %r18
	setx 0x4ea02a5bbdd8f2c5, %g1, %r19
	setx 0x27930135c74145e0, %g1, %r20
	setx 0xd9a735007f4acec5, %g1, %r21
	setx 0x20f2098a81cb5cfc, %g1, %r22
	setx 0x6029743058a2142b, %g1, %r23
	setx 0xd19471ae272183fd, %g1, %r24
	setx 0x995bc210b9f6fa7b, %g1, %r25
	setx 0x3d98ca3699e6a757, %g1, %r26
	setx 0x96121e2dd59581bb, %g1, %r27
	setx 0xbeb73bf746745548, %g1, %r28
	setx 0x6a2d8164678cfe27, %g1, %r29
	setx 0xd5f10960a5b90079, %g1, %r30
	setx 0x403fe93b8be01f1b, %g1, %r31
	save
	setx 0x0f09455607012c95, %g1, %r16
	setx 0x13fda08d6f4c0146, %g1, %r17
	setx 0xfaeb03a8fe618a7f, %g1, %r18
	setx 0xf7a813c4e6f6c300, %g1, %r19
	setx 0x33db32e85b8683c9, %g1, %r20
	setx 0xd0d7c9ceffe7dddc, %g1, %r21
	setx 0x8406e0c021eae649, %g1, %r22
	setx 0x062fd382db104087, %g1, %r23
	setx 0x9d1f299988a1f9ce, %g1, %r24
	setx 0xe4772ad22487b286, %g1, %r25
	setx 0xc7ff866fe90ea2f4, %g1, %r26
	setx 0x44664a2bad8bcdd8, %g1, %r27
	setx 0x3498248a44529a3e, %g1, %r28
	setx 0xe3deecccf294a69f, %g1, %r29
	setx 0x06822cd84e06eae8, %g1, %r30
	setx 0x154cfdc008623dbd, %g1, %r31
	save
	setx 0xf19d98cc634f42b6, %g1, %r16
	setx 0x39d799340f063c9f, %g1, %r17
	setx 0x82e4ef4fadc8db36, %g1, %r18
	setx 0x89a5177d9374453b, %g1, %r19
	setx 0xe1758d193c419fe8, %g1, %r20
	setx 0xa6e12eafc8ced838, %g1, %r21
	setx 0x2e49bec0f11f4d95, %g1, %r22
	setx 0xad7c754605a7bc7c, %g1, %r23
	setx 0xddffa1dcf455d89d, %g1, %r24
	setx 0x6acc90d99ddbfd73, %g1, %r25
	setx 0xf3f9351c7a6b171f, %g1, %r26
	setx 0x2095c54f5f26f154, %g1, %r27
	setx 0x56421f2754029d51, %g1, %r28
	setx 0xdf0d3f2319b38767, %g1, %r29
	setx 0xc9dd7568cc7a8cae, %g1, %r30
	setx 0x401c55efd8a2ae79, %g1, %r31
	save
	setx 0x8f91b51f0c3727d0, %g1, %r16
	setx 0x68e82b1f412675ec, %g1, %r17
	setx 0xae376f663562b8e3, %g1, %r18
	setx 0x9f613efbca1397cd, %g1, %r19
	setx 0xd9fc460d97e71930, %g1, %r20
	setx 0x7121b65ba0e20338, %g1, %r21
	setx 0x1847adc7a063b1af, %g1, %r22
	setx 0x96e1a24e227d25c6, %g1, %r23
	setx 0x845b55157ffea10b, %g1, %r24
	setx 0xa88b761b3065ce7f, %g1, %r25
	setx 0x4e5ff258182aea90, %g1, %r26
	setx 0xd33737e8235c5e96, %g1, %r27
	setx 0x0f9b3e60dd246be2, %g1, %r28
	setx 0x3cab4bbbba6301f9, %g1, %r29
	setx 0xd35f8ea3774e91ca, %g1, %r30
	setx 0xf9a257030988b2b1, %g1, %r31
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
	setx	data_start_0, %g1, %r23
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 2)
	.word 0xbc34a1c2  ! 5: SUBC_I	orn 	%r18, 0x01c2, %r30
	.word 0xbfe42098  ! 8: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5510000  ! 10: RDPR_TICK	<illegal instruction>
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 39)
	.word 0xbde4a1b7  ! 13: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb29c0000  ! 14: XORcc_R	xorcc 	%r16, %r0, %r25
	.word 0xb83d0000  ! 16: XNOR_R	xnor 	%r20, %r0, %r28
	.word 0xbfe42129  ! 18: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbd7d8400  ! 20: MOVR_R	movre	%r22, %r0, %r30
	.word 0xb225a0dc  ! 22: SUB_I	sub 	%r22, 0x00dc, %r25
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 12)
	.word 0xbbe5a19b  ! 26: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde4e16d  ! 27: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e461a4  ! 31: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe52125  ! 39: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde4608f  ! 43: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8994a15b  ! 44: WRPR_TICK_I	wrpr	%r18, 0x015b, %tick
	.word 0xbbe52158  ! 46: SAVE_I	save	%r20, 0x0001, %r29
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 23)
	.word 0xb5342001  ! 53: SRL_I	srl 	%r16, 0x0001, %r26
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 13)
	.word 0xb6ad4000  ! 58: ANDNcc_R	andncc 	%r21, %r0, %r27
	.word 0xb3e5a077  ! 59: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe5e1e4  ! 61: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e4619a  ! 62: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb2a44000  ! 66: SUBcc_R	subcc 	%r17, %r0, %r25
	mov	0, %r12
	.word 0xa1930000  ! 67: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1518000  ! 69: RDPR_PSTATE	<illegal instruction>
	.word 0xbd520000  ! 72: RDPR_PIL	<illegal instruction>
	setx	0xf0f5993b00006fde, %g1, %r10
	.word 0x819a8000  ! 73: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe5e09f  ! 76: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e4206d  ! 80: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb17c6401  ! 82: MOVR_I	movre	%r17, 0x1, %r24
	.word 0xbfe5e13a  ! 86: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb835209d  ! 88: ORN_I	orn 	%r20, 0x009d, %r28
	.word 0xbde42133  ! 90: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e56174  ! 91: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e420d1  ! 94: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e4e08d  ! 95: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x9194a1fc  ! 97: WRPR_PIL_I	wrpr	%r18, 0x01fc, %pil
	.word 0xbb2c0000  ! 98: SLL_R	sll 	%r16, %r0, %r29
	.word 0xbfe521f8  ! 101: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e4202a  ! 104: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e421b3  ! 105: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7518000  ! 109: RDPR_PSTATE	<illegal instruction>
	setx	0x2ea256090000e840, %g1, %r10
	.word 0x819a8000  ! 111: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbbe420a3  ! 113: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e4616a  ! 114: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e4a0e2  ! 115: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe5617b  ! 120: SAVE_I	save	%r21, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb6354000  ! 124: ORN_R	orn 	%r21, %r0, %r27
	.word 0xb4146191  ! 125: OR_I	or 	%r17, 0x0191, %r26
	.word 0xb3500000  ! 126: RDPR_TPC	<illegal instruction>
	.word 0xb3e4e025  ! 128: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x4263591200005dca, %g1, %r10
	.word 0x819a8000  ! 130: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 17)
	.word 0xba2cc000  ! 132: ANDN_R	andn 	%r19, %r0, %r29
	.word 0x819560ca  ! 137: WRPR_TPC_I	wrpr	%r21, 0x00ca, %tpc
	.word 0xb1e5a111  ! 138: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e4e0a8  ! 139: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e5e170  ! 140: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xba34a160  ! 141: ORN_I	orn 	%r18, 0x0160, %r29
	.word 0xbbe5a18e  ! 151: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e421bf  ! 153: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe56192  ! 155: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x8195a183  ! 156: WRPR_TPC_I	wrpr	%r22, 0x0183, %tpc
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 1a)
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 7)
	.word 0xb1e4e05f  ! 161: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e561aa  ! 165: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e4e06d  ! 169: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e46091  ! 171: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e4608a  ! 173: SAVE_I	save	%r17, 0x0001, %r26
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 34)
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 20)
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 3c)
	setx	data_start_6, %g1, %r21
	.word 0x8394a1a2  ! 185: WRPR_TNPC_I	wrpr	%r18, 0x01a2, %tnpc
	.word 0xbf7c8400  ! 187: MOVR_R	movre	%r18, %r0, %r31
	.word 0x879461d8  ! 189: WRPR_TT_I	wrpr	%r17, 0x01d8, %tt
	.word 0xb7e4e114  ! 190: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xba340000  ! 192: ORN_R	orn 	%r16, %r0, %r29
	.word 0xb3e4e021  ! 193: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e4605a  ! 194: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5508000  ! 195: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_2, %g1, %r17
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, e)
	mov	2, %r12
	.word 0x8f930000  ! 208: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1e5e1af  ! 209: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8795e195  ! 212: WRPR_TT_I	wrpr	%r23, 0x0195, %tt
	.word 0xba0c4000  ! 214: AND_R	and 	%r17, %r0, %r29
	setx	data_start_0, %g1, %r19
	.word 0xb1e4601e  ! 217: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe4a1ad  ! 219: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e420b6  ! 220: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e5606f  ! 222: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe4e034  ! 227: SAVE_I	save	%r19, 0x0001, %r31
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 10)
	.word 0xb3e460cd  ! 233: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e4e0c9  ! 240: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e5212b  ! 242: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e56005  ! 243: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e5206d  ! 250: SAVE_I	save	%r20, 0x0001, %r27
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 37)
	.word 0xb1520000  ! 254: RDPR_PIL	<illegal instruction>
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 30)
	.word 0xb0b52109  ! 259: ORNcc_I	orncc 	%r20, 0x0109, %r24
	.word 0xb151c000  ! 266: RDPR_TL	<illegal instruction>
	.word 0xb9e5e151  ! 267: SAVE_I	save	%r23, 0x0001, %r28
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, a)
	.word 0x9195a089  ! 273: WRPR_PIL_I	wrpr	%r22, 0x0089, %pil
	.word 0xb1e56184  ! 274: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5518000  ! 275: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe5609e  ! 276: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9504000  ! 279: RDPR_TNPC	<illegal instruction>
	.word 0xb3540000  ! 282: RDPR_GL	<illegal instruction>
	.word 0xbde5e103  ! 291: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbcbd0000  ! 292: XNORcc_R	xnorcc 	%r20, %r0, %r30
	.word 0xbde52156  ! 295: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7504000  ! 296: RDPR_TNPC	<illegal instruction>
	.word 0xb750c000  ! 298: RDPR_TT	<illegal instruction>
	.word 0xb1e520eb  ! 300: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e5a1bb  ! 303: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbab5a0e0  ! 305: ORNcc_I	orncc 	%r22, 0x00e0, %r29
	.word 0xb7e4a116  ! 307: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbf500000  ! 311: RDPR_TPC	<illegal instruction>
	.word 0xbe3d4000  ! 312: XNOR_R	xnor 	%r21, %r0, %r31
	mov	1, %r12
	.word 0x8f930000  ! 313: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb6344000  ! 318: ORN_R	orn 	%r17, %r0, %r27
	.word 0xb134e001  ! 319: SRL_I	srl 	%r19, 0x0001, %r24
	.word 0xbfe4a1d9  ! 322: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe5a155  ! 323: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e5a1e9  ! 328: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e46104  ! 331: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde42109  ! 336: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbe2c0000  ! 337: ANDN_R	andn 	%r16, %r0, %r31
	.word 0xb1355000  ! 339: SRLX_R	srlx	%r21, %r0, %r24
	.word 0xb1540000  ! 344: RDPR_GL	<illegal instruction>
	.word 0xb7e420ee  ! 345: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e5a062  ! 346: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x8794a14a  ! 347: WRPR_TT_I	wrpr	%r18, 0x014a, %tt
	.word 0xb1e4e15a  ! 350: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde4a1b9  ! 358: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe5e11b  ! 359: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde520d4  ! 360: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb205e1c0  ! 361: ADD_I	add 	%r23, 0x01c0, %r25
	.word 0xbca5e00d  ! 364: SUBcc_I	subcc 	%r23, 0x000d, %r30
	.word 0xb6854000  ! 365: ADDcc_R	addcc 	%r21, %r0, %r27
	.word 0xb5e4a1a3  ! 367: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e4601a  ! 371: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb3e4a093  ! 373: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e5a15d  ! 374: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe4a020  ! 375: SAVE_I	save	%r18, 0x0001, %r29
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 14)
	.word 0xb150c000  ! 385: RDPR_TT	<illegal instruction>
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbfe46069  ! 387: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbf50c000  ! 388: RDPR_TT	<illegal instruction>
	.word 0xbde5e055  ! 389: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe4a000  ! 392: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe42159  ! 393: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e56036  ! 397: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde5a19d  ! 398: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x13b215c000008b8c, %g1, %r10
	.word 0x819a8000  ! 403: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb750c000  ! 405: RDPR_TT	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 406: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0xb70cdba30000fa91, %g1, %r10
	.word 0x839a8000  ! 408: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9540000  ! 412: RDPR_GL	<illegal instruction>
	.word 0xb13cc000  ! 419: SRA_R	sra 	%r19, %r0, %r24
	setx	0x3071b2cd0000bdcf, %g1, %r10
	.word 0x819a8000  ! 424: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xa755c40200004a03, %g1, %r10
	.word 0x819a8000  ! 425: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	2, %r12
	.word 0xa1930000  ! 429: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x9194e1a4  ! 435: WRPR_PIL_I	wrpr	%r19, 0x01a4, %pil
	.word 0xbbe4a079  ! 437: SAVE_I	save	%r18, 0x0001, %r29
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 34)
	.word 0x8395a021  ! 451: WRPR_TNPC_I	wrpr	%r22, 0x0021, %tnpc
	.word 0xb9e5211a  ! 455: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb72c4000  ! 457: SLL_R	sll 	%r17, %r0, %r27
	.word 0xbe144000  ! 458: OR_R	or 	%r17, %r0, %r31
	.word 0x819461c7  ! 459: WRPR_TPC_I	wrpr	%r17, 0x01c7, %tpc
	.word 0x8595e18a  ! 461: WRPR_TSTATE_I	wrpr	%r23, 0x018a, %tstate
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 38)
	.word 0xb3e4e180  ! 464: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde46175  ! 466: SAVE_I	save	%r17, 0x0001, %r30
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 25)
	setx	data_start_3, %g1, %r17
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 13)
	.word 0xbbe4e1e0  ! 477: SAVE_I	save	%r19, 0x0001, %r29
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 15)
	.word 0xb5e4e09f  ! 481: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e560d5  ! 482: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1508000  ! 483: RDPR_TSTATE	<illegal instruction>
	.word 0xbd51c000  ! 487: RDPR_TL	<illegal instruction>
	.word 0xbde4a02f  ! 489: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e5e0fa  ! 494: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xba04c000  ! 495: ADD_R	add 	%r19, %r0, %r29
	.word 0xb9e5e1bb  ! 496: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e4e094  ! 504: SAVE_I	save	%r19, 0x0001, %r26
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 1a)
	setx	0x52bda6af00009817, %g1, %r10
	.word 0x819a8000  ! 509: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb8b56088  ! 510: SUBCcc_I	orncc 	%r21, 0x0088, %r28
	.word 0xb7e46091  ! 511: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e46072  ! 513: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbd508000  ! 515: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e5a19c  ! 518: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9341000  ! 522: SRLX_R	srlx	%r16, %r0, %r28
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 2b)
	.word 0x8395601f  ! 530: WRPR_TNPC_I	wrpr	%r21, 0x001f, %tnpc
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 39)
	.word 0xbd504000  ! 535: RDPR_TNPC	<illegal instruction>
	.word 0x9194e0cc  ! 538: WRPR_PIL_I	wrpr	%r19, 0x00cc, %pil
	.word 0xbde52034  ! 539: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e4a15d  ! 543: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e4a19b  ! 546: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e4a186  ! 547: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbd540000  ! 551: RDPR_GL	<illegal instruction>
	.word 0xbbe5203f  ! 556: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e5a1e2  ! 557: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e4e127  ! 558: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe460ef  ! 560: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe5e1de  ! 561: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e5a109  ! 563: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x4a835af00000aa1e, %g1, %r10
	.word 0x839a8000  ! 568: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbc45607b  ! 569: ADDC_I	addc 	%r21, 0x007b, %r30
	.word 0xb7e46148  ! 571: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8395a199  ! 575: WRPR_TNPC_I	wrpr	%r22, 0x0199, %tnpc
	.word 0xbb3c6001  ! 576: SRA_I	sra 	%r17, 0x0001, %r29
	.word 0xbc44611a  ! 584: ADDC_I	addc 	%r17, 0x011a, %r30
	.word 0xb3e560b8  ! 585: SAVE_I	save	%r21, 0x0001, %r25
	setx	0x20e01fc60000fd5c, %g1, %r10
	.word 0x839a8000  ! 587: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb20ce00c  ! 589: AND_I	and 	%r19, 0x000c, %r25
	.word 0x85952174  ! 597: WRPR_TSTATE_I	wrpr	%r20, 0x0174, %tstate
	.word 0xb3e460a1  ! 598: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb2a44000  ! 599: SUBcc_R	subcc 	%r17, %r0, %r25
	.word 0xbf500000  ! 601: RDPR_TPC	<illegal instruction>
	.word 0x83952145  ! 602: WRPR_TNPC_I	wrpr	%r20, 0x0145, %tnpc
	.word 0x9195a1ff  ! 603: WRPR_PIL_I	wrpr	%r22, 0x01ff, %pil
	.word 0xbbe52156  ! 605: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x9a8cc2660000690b, %g1, %r10
	.word 0x819a8000  ! 608: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe5a0c0  ! 609: SAVE_I	save	%r22, 0x0001, %r31
	setx	0xaf8f4b8c0000ebd1, %g1, %r10
	.word 0x839a8000  ! 614: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xba04c000  ! 621: ADD_R	add 	%r19, %r0, %r29
	setx	data_start_4, %g1, %r19
	.word 0xb350c000  ! 625: RDPR_TT	<illegal instruction>
	.word 0xb6142188  ! 632: OR_I	or 	%r16, 0x0188, %r27
	.word 0x8395e0f5  ! 636: WRPR_TNPC_I	wrpr	%r23, 0x00f5, %tnpc
	.word 0xbfe4a06c  ! 640: SAVE_I	save	%r18, 0x0001, %r31
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbfe46189  ! 642: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde5e113  ! 644: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e46072  ! 649: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5520000  ! 653: RDPR_PIL	<illegal instruction>
	.word 0x8d95e0e3  ! 654: WRPR_PSTATE_I	wrpr	%r23, 0x00e3, %pstate
	.word 0xbfe560f1  ! 655: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde4e11b  ! 656: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbf500000  ! 659: RDPR_TPC	<illegal instruction>
	.word 0xb5e561a8  ! 663: SAVE_I	save	%r21, 0x0001, %r26
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb5e5a0bf  ! 673: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde4a047  ! 674: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde4e0c5  ! 678: SAVE_I	save	%r19, 0x0001, %r30
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 26)
	.word 0xba3d0000  ! 682: XNOR_R	xnor 	%r20, %r0, %r29
	.word 0xbfe4618f  ! 685: SAVE_I	save	%r17, 0x0001, %r31
	mov	0, %r12
	.word 0x8f930000  ! 689: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbd510000  ! 692: RDPR_TICK	<illegal instruction>
	.word 0xbbe5e0a8  ! 693: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e560ba  ! 694: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e42158  ! 700: SAVE_I	save	%r16, 0x0001, %r26
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 33)
	.word 0xb5e5e14c  ! 707: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x9195a186  ! 710: WRPR_PIL_I	wrpr	%r22, 0x0186, %pil
	.word 0xbfe56188  ! 712: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe5e135  ! 716: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e460e3  ! 717: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x899421c6  ! 718: WRPR_TICK_I	wrpr	%r16, 0x01c6, %tick
	.word 0xbbe460f9  ! 721: SAVE_I	save	%r17, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe4e005  ! 730: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb750c000  ! 732: RDPR_TT	<illegal instruction>
	.word 0xb7e461ac  ! 743: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e42189  ! 744: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe420f2  ! 747: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e42091  ! 748: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e56151  ! 753: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e4a182  ! 758: SAVE_I	save	%r18, 0x0001, %r26
	mov	1, %r12
	.word 0xa1930000  ! 759: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1e5e17b  ! 760: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe4e10a  ! 761: SAVE_I	save	%r19, 0x0001, %r29
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, b)
	.word 0xb1e4e022  ! 769: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e421f9  ! 773: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x819521ab  ! 777: WRPR_TPC_I	wrpr	%r20, 0x01ab, %tpc
	.word 0xbfe560ea  ! 778: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e4209e  ! 779: SAVE_I	save	%r16, 0x0001, %r24
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 31)
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb9518000  ! 787: RDPR_PSTATE	<illegal instruction>
	.word 0xba1d2022  ! 788: XOR_I	xor 	%r20, 0x0022, %r29
	.word 0xb1e5e157  ! 790: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8595a0ef  ! 793: WRPR_TSTATE_I	wrpr	%r22, 0x00ef, %tstate
	.word 0xbfe5a014  ! 795: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde5e17c  ! 796: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e420ea  ! 797: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe5e189  ! 803: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbbe421b7  ! 806: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb134a001  ! 808: SRL_I	srl 	%r18, 0x0001, %r24
	.word 0xbde5a10e  ! 811: SAVE_I	save	%r22, 0x0001, %r30
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 29)
	setx	data_start_0, %g1, %r17
	.word 0xb88c2059  ! 818: ANDcc_I	andcc 	%r16, 0x0059, %r28
	.word 0x899420a3  ! 820: WRPR_TICK_I	wrpr	%r16, 0x00a3, %tick
	.word 0xb9e4e1e3  ! 825: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x859521c3  ! 831: WRPR_TSTATE_I	wrpr	%r20, 0x01c3, %tstate
	.word 0xb5e5e1c5  ! 832: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8795a1d4  ! 834: WRPR_TT_I	wrpr	%r22, 0x01d4, %tt
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 27)
	.word 0xbfe5617e  ! 838: SAVE_I	save	%r21, 0x0001, %r31
	setx	data_start_1, %g1, %r21
	.word 0xb5e4a155  ! 843: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e461c1  ! 844: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e5a0fe  ! 845: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde5e09d  ! 848: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9510000  ! 849: RDPR_TICK	<illegal instruction>
	.word 0xbbe4e148  ! 851: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e4a03b  ! 852: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb32c0000  ! 854: SLL_R	sll 	%r16, %r0, %r25
	mov	0, %r12
	.word 0xa1930000  ! 855: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbe46185  ! 860: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e4a172  ! 865: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e460b9  ! 872: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe5213b  ! 873: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e4216c  ! 874: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e4e1df  ! 881: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe5e109  ! 883: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e521d3  ! 885: SAVE_I	save	%r20, 0x0001, %r27
	setx	data_start_5, %g1, %r18
	setx	data_start_4, %g1, %r23
	.word 0xb77c6401  ! 889: MOVR_I	movre	%r17, 0x1, %r27
	.word 0xbfe4a0b8  ! 891: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x859560cb  ! 892: WRPR_TSTATE_I	wrpr	%r21, 0x00cb, %tstate
	.word 0xbfe5e004  ! 894: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde4a18f  ! 896: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8994e07b  ! 897: WRPR_TICK_I	wrpr	%r19, 0x007b, %tick
	.word 0xbde4e11a  ! 902: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbb504000  ! 903: RDPR_TNPC	<illegal instruction>
	.word 0xbde461cc  ! 906: SAVE_I	save	%r17, 0x0001, %r30
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 28)
	.word 0x89952086  ! 909: WRPR_TICK_I	wrpr	%r20, 0x0086, %tick
	.word 0xb1e560f8  ! 912: SAVE_I	save	%r21, 0x0001, %r24
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, a)
	.word 0xb9e4a036  ! 916: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbd508000  ! 917: RDPR_TSTATE	<illegal instruction>
	.word 0x8995a000  ! 924: WRPR_TICK_I	wrpr	%r22, 0x0000, %tick
	.word 0xbde5e03b  ! 929: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde4a044  ! 932: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb03dc000  ! 933: XNOR_R	xnor 	%r23, %r0, %r24
	.word 0xb1e420f8  ! 934: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e5a1f1  ! 936: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde5a0ab  ! 938: SAVE_I	save	%r22, 0x0001, %r30
	setx	data_start_2, %g1, %r22
	.word 0xb7e560c2  ! 943: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde4e1b0  ! 945: SAVE_I	save	%r19, 0x0001, %r30
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbabce0fa  ! 952: XNORcc_I	xnorcc 	%r19, 0x00fa, %r29
	mov	1, %r12
	.word 0x8f930000  ! 954: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, e)
	.word 0x8595a037  ! 956: WRPR_TSTATE_I	wrpr	%r22, 0x0037, %tstate
	.word 0xb7e5a10c  ! 958: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde560b0  ! 959: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8395e037  ! 962: WRPR_TNPC_I	wrpr	%r23, 0x0037, %tnpc
	setx	data_start_5, %g1, %r16
	.word 0xbbe5a053  ! 969: SAVE_I	save	%r22, 0x0001, %r29
	setx	0x7faa5fcf0000ba59, %g1, %r10
	.word 0x839a8000  ! 972: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x6395429300000e01, %g1, %r10
	.word 0x819a8000  ! 977: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde56051  ! 978: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7520000  ! 980: RDPR_PIL	<illegal instruction>
	.word 0xbfe5a1d7  ! 983: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e5e0e6  ! 985: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e4601a  ! 987: SAVE_I	save	%r17, 0x0001, %r28
	setx	data_start_1, %g1, %r23
	.word 0xbfe46022  ! 991: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e4a10f  ! 993: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb2b461d0  ! 995: ORNcc_I	orncc 	%r17, 0x01d0, %r25
	.word 0xb750c000  ! 996: RDPR_TT	<illegal instruction>
	.word 0xb3e5603a  ! 997: SAVE_I	save	%r21, 0x0001, %r25
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
	setx	data_start_2, %g1, %r20
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 3e)
	.word 0xb435e0b0  ! 5: SUBC_I	orn 	%r23, 0x00b0, %r26
	.word 0xb1510000  ! 10: RDPR_TICK	rdpr	%tick, %r24
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 9)
	.word 0xb29d0000  ! 14: XORcc_R	xorcc 	%r20, %r0, %r25
	.word 0xba3cc000  ! 16: XNOR_R	xnor 	%r19, %r0, %r29
	.word 0xf6242011  ! 17: STW_I	stw	%r27, [%r16 + 0x0011]
	.word 0xb17d8400  ! 20: MOVR_R	movre	%r22, %r0, %r24
	.word 0xbe24e18f  ! 22: SUB_I	sub 	%r19, 0x018f, %r31
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 14)
	.word 0xfe350000  ! 33: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xf63dc000  ! 34: STD_R	std	%r27, [%r23 + %r0]
	.word 0xfe3d6185  ! 37: STD_I	std	%r31, [%r21 + 0x0185]
	.word 0x8995e009  ! 44: WRPR_TICK_I	wrpr	%r23, 0x0009, %tick
	.word 0xfa2c8000  ! 48: STB_R	stb	%r29, [%r18 + %r0]
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfa75e122  ! 50: STX_I	stx	%r29, [%r23 + 0x0122]
	.word 0xb134a001  ! 53: SRL_I	srl 	%r18, 0x0001, %r24
	.word 0xf835e0e6  ! 54: STH_I	sth	%r28, [%r23 + 0x00e6]
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 32)
	.word 0xbcacc000  ! 58: ANDNcc_R	andncc 	%r19, %r0, %r30
	.word 0xfe2da03f  ! 63: STB_I	stb	%r31, [%r22 + 0x003f]
	.word 0xf475e0cd  ! 65: STX_I	stx	%r26, [%r23 + 0x00cd]
	.word 0xbaa5c000  ! 66: SUBcc_R	subcc 	%r23, %r0, %r29
	mov	2, %r12
	.word 0xa1930000  ! 67: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3518000  ! 69: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xb9520000  ! 72: RDPR_PIL	<illegal instruction>
	setx	0x77673a9a00006e4b, %g1, %r10
	.word 0x819a8000  ! 73: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf8356196  ! 75: STH_I	sth	%r28, [%r21 + 0x0196]
	.word 0xf47460d6  ! 78: STX_I	stx	%r26, [%r17 + 0x00d6]
	.word 0xb97c2401  ! 82: MOVR_I	movre	%r16, 0x1, %r28
	.word 0xf83d8000  ! 84: STD_R	std	%r28, [%r22 + %r0]
	.word 0xbc34e17e  ! 88: ORN_I	orn 	%r19, 0x017e, %r30
	.word 0x91946190  ! 97: WRPR_PIL_I	wrpr	%r17, 0x0190, %pil
	.word 0xbb2dc000  ! 98: SLL_R	sll 	%r23, %r0, %r29
	.word 0xfa34c000  ! 99: STH_R	sth	%r29, [%r19 + %r0]
	.word 0xf93d8000  ! 102: STDF_R	std	%f28, [%r0, %r22]
	.word 0xfe3ce023  ! 103: STD_I	std	%r31, [%r19 + 0x0023]
	.word 0xf83d8000  ! 106: STD_R	std	%r28, [%r22 + %r0]
	.word 0xf225c000  ! 108: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xb5518000  ! 109: RDPR_PSTATE	rdpr	%pstate, %r26
	setx	0xe01218820000ce51, %g1, %r10
	.word 0x819a8000  ! 111: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf2354000  ! 112: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xf834a082  ! 119: STH_I	sth	%r28, [%r18 + 0x0082]
	.word 0xf43c8000  ! 121: STD_R	std	%r26, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbc354000  ! 124: ORN_R	orn 	%r21, %r0, %r30
	.word 0xb6152184  ! 125: OR_I	or 	%r20, 0x0184, %r27
	.word 0xb7500000  ! 126: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xfa35a052  ! 129: STH_I	sth	%r29, [%r22 + 0x0052]
	setx	0x6a41369000048d9, %g1, %r10
	.word 0x819a8000  ! 130: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 11)
	.word 0xbe2d4000  ! 132: ANDN_R	andn 	%r21, %r0, %r31
	.word 0xfa25c000  ! 136: STW_R	stw	%r29, [%r23 + %r0]
	.word 0x8195a11d  ! 137: WRPR_TPC_I	wrpr	%r22, 0x011d, %tpc
	.word 0xb634206b  ! 141: ORN_I	orn 	%r16, 0x006b, %r27
	.word 0xf33da01d  ! 142: STDF_I	std	%f25, [0x001d, %r22]
	.word 0xf825604f  ! 145: STW_I	stw	%r28, [%r21 + 0x004f]
	.word 0xf83d20fd  ! 154: STD_I	std	%r28, [%r20 + 0x00fd]
	.word 0x81942119  ! 156: WRPR_TPC_I	wrpr	%r16, 0x0119, %tpc
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 16)
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, f)
	.word 0xf634a1d9  ! 162: STH_I	sth	%r27, [%r18 + 0x01d9]
	.word 0xf13c0000  ! 163: STDF_R	std	%f24, [%r0, %r16]
	.word 0xfa748000  ! 167: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xf22d204a  ! 170: STB_I	stb	%r25, [%r20 + 0x004a]
	.word 0xf33ce122  ! 172: STDF_I	std	%f25, [0x0122, %r19]
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfc3d2007  ! 175: STD_I	std	%r30, [%r20 + 0x0007]
	.word 0xf025a00d  ! 178: STW_I	stw	%r24, [%r22 + 0x000d]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 3)
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf8250000  ! 182: STW_R	stw	%r28, [%r20 + %r0]
	setx	data_start_3, %g1, %r17
	.word 0x8395e1dc  ! 185: WRPR_TNPC_I	wrpr	%r23, 0x01dc, %tnpc
	.word 0xb97d0400  ! 187: MOVR_R	movre	%r20, %r0, %r28
	.word 0x8795a03e  ! 189: WRPR_TT_I	wrpr	%r22, 0x003e, %tt
	.word 0xff3c0000  ! 191: STDF_R	std	%f31, [%r0, %r16]
	.word 0xb8340000  ! 192: ORN_R	orn 	%r16, %r0, %r28
	.word 0xbd508000  ! 195: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xf42560a1  ! 197: STW_I	stw	%r26, [%r21 + 0x00a1]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2d6127  ! 199: STB_I	stb	%r29, [%r21 + 0x0127]
	.word 0xf025a1c4  ! 201: STW_I	stw	%r24, [%r22 + 0x01c4]
	setx	data_start_5, %g1, %r17
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 14)
	mov	2, %r12
	.word 0x8f930000  ! 208: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf4754000  ! 210: STX_R	stx	%r26, [%r21 + %r0]
	.word 0x8794e0ad  ! 212: WRPR_TT_I	wrpr	%r19, 0x00ad, %tt
	.word 0xb20dc000  ! 214: AND_R	and 	%r23, %r0, %r25
	setx	data_start_4, %g1, %r23
	.word 0xfe35e040  ! 221: STH_I	sth	%r31, [%r23 + 0x0040]
	.word 0xf634c000  ! 223: STH_R	sth	%r27, [%r19 + %r0]
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 18)
	.word 0xf93d8000  ! 231: STDF_R	std	%f28, [%r0, %r22]
	.word 0xf2342116  ! 235: STH_I	sth	%r25, [%r16 + 0x0116]
	.word 0xf8740000  ! 246: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xf4254000  ! 251: STW_R	stw	%r26, [%r21 + %r0]
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 2)
	.word 0xb9520000  ! 254: RDPR_PIL	rdpr	%pil, %r28
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 1e)
	.word 0xbeb4e172  ! 259: ORNcc_I	orncc 	%r19, 0x0172, %r31
	.word 0xf874a043  ! 261: STX_I	stx	%r28, [%r18 + 0x0043]
	.word 0xf42521ae  ! 262: STW_I	stw	%r26, [%r20 + 0x01ae]
	.word 0xfa3461c2  ! 264: STH_I	sth	%r29, [%r17 + 0x01c2]
	.word 0xf43d4000  ! 265: STD_R	std	%r26, [%r21 + %r0]
	.word 0xb551c000  ! 266: RDPR_TL	<illegal instruction>
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 7)
	.word 0xf4342163  ! 272: STH_I	sth	%r26, [%r16 + 0x0163]
	.word 0x9194a14c  ! 273: WRPR_PIL_I	wrpr	%r18, 0x014c, %pil
	.word 0xb7518000  ! 275: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xf475e09e  ! 277: STX_I	stx	%r26, [%r23 + 0x009e]
	.word 0xb7504000  ! 279: RDPR_TNPC	<illegal instruction>
	.word 0xfe2d20f3  ! 280: STB_I	stb	%r31, [%r20 + 0x00f3]
	.word 0xf83ce185  ! 281: STD_I	std	%r28, [%r19 + 0x0185]
	.word 0xb3540000  ! 282: RDPR_GL	<illegal instruction>
	.word 0xfc254000  ! 283: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xf875a066  ! 285: STX_I	stx	%r28, [%r22 + 0x0066]
	.word 0xf22d0000  ! 289: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xfa2c4000  ! 290: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xbcbdc000  ! 292: XNORcc_R	xnorcc 	%r23, %r0, %r30
	.word 0xb5504000  ! 296: RDPR_TNPC	<illegal instruction>
	.word 0xf8754000  ! 297: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xbd50c000  ! 298: RDPR_TT	<illegal instruction>
	.word 0xfd3c60b9  ! 299: STDF_I	std	%f30, [0x00b9, %r17]
	.word 0xf82de121  ! 302: STB_I	stb	%r28, [%r23 + 0x0121]
	.word 0xf8758000  ! 304: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xbeb42047  ! 305: ORNcc_I	orncc 	%r16, 0x0047, %r31
	.word 0xf625e0fa  ! 309: STW_I	stw	%r27, [%r23 + 0x00fa]
	.word 0xb3500000  ! 311: RDPR_TPC	<illegal instruction>
	.word 0xb03c8000  ! 312: XNOR_R	xnor 	%r18, %r0, %r24
	mov	1, %r12
	.word 0x8f930000  ! 313: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf03dc000  ! 317: STD_R	std	%r24, [%r23 + %r0]
	.word 0xb034c000  ! 318: ORN_R	orn 	%r19, %r0, %r24
	.word 0xbd342001  ! 319: SRL_I	srl 	%r16, 0x0001, %r30
	.word 0xfa2dc000  ! 320: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf73c6035  ! 326: STDF_I	std	%f27, [0x0035, %r17]
	.word 0xff3cc000  ! 330: STDF_R	std	%f31, [%r0, %r19]
	.word 0xfc75c000  ! 332: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xbe2dc000  ! 337: ANDN_R	andn 	%r23, %r0, %r31
	.word 0xb7349000  ! 339: SRLX_R	srlx	%r18, %r0, %r27
	.word 0xf2754000  ! 340: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xb7540000  ! 344: RDPR_GL	rdpr	%-, %r27
	.word 0x8795216f  ! 347: WRPR_TT_I	wrpr	%r20, 0x016f, %tt
	.word 0xf035c000  ! 351: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xf874c000  ! 353: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf2248000  ! 355: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xf02c215c  ! 357: STB_I	stb	%r24, [%r16 + 0x015c]
	.word 0xb60521a9  ! 361: ADD_I	add 	%r20, 0x01a9, %r27
	.word 0xbaa4e06a  ! 364: SUBcc_I	subcc 	%r19, 0x006a, %r29
	.word 0xb884c000  ! 365: ADDcc_R	addcc 	%r19, %r0, %r28
	.word 0xf2358000  ! 366: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xfa2dc000  ! 369: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf075e178  ! 370: STX_I	stx	%r24, [%r23 + 0x0178]
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 17)
	.word 0xf33ce003  ! 376: STDF_I	std	%f25, [0x0003, %r19]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 7)
	.word 0xfe3c60a4  ! 381: STD_I	std	%r31, [%r17 + 0x00a4]
	.word 0xf274e1e9  ! 384: STX_I	stx	%r25, [%r19 + 0x01e9]
	.word 0xbb50c000  ! 385: RDPR_TT	rdpr	%tt, %r29
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 37)
	.word 0xb750c000  ! 388: RDPR_TT	<illegal instruction>
	.word 0xf93c6173  ! 390: STDF_I	std	%f28, [0x0173, %r17]
	.word 0xfe75e19b  ! 395: STX_I	stx	%r31, [%r23 + 0x019b]
	.word 0xf02d6009  ! 401: STB_I	stb	%r24, [%r21 + 0x0009]
	setx	0x35313e340000fd96, %g1, %r10
	.word 0x819a8000  ! 403: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb50c000  ! 405: RDPR_TT	rdpr	%tt, %r29
	mov	2, %r12
	.word 0xa1930000  ! 406: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x4a6e6f1d00008889, %g1, %r10
	.word 0x839a8000  ! 408: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa35e0db  ! 410: STH_I	sth	%r29, [%r23 + 0x00db]
	.word 0xb3540000  ! 412: RDPR_GL	rdpr	%-, %r25
	.word 0xf274a193  ! 414: STX_I	stx	%r25, [%r18 + 0x0193]
	.word 0xfa3c0000  ! 416: STD_R	std	%r29, [%r16 + %r0]
	.word 0xbf3c4000  ! 419: SRA_R	sra 	%r17, %r0, %r31
	.word 0xf43c4000  ! 420: STD_R	std	%r26, [%r17 + %r0]
	.word 0xfc2c204e  ! 423: STB_I	stb	%r30, [%r16 + 0x004e]
	setx	0x9d31c0010000b8c0, %g1, %r10
	.word 0x819a8000  ! 424: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xadb2fe1d0000ad1d, %g1, %r10
	.word 0x819a8000  ! 425: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa252118  ! 426: STW_I	stw	%r29, [%r20 + 0x0118]
	.word 0xf73d0000  ! 428: STDF_R	std	%f27, [%r0, %r20]
	mov	0, %r12
	.word 0xa1930000  ! 429: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf635c000  ! 430: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xf635a032  ! 433: STH_I	sth	%r27, [%r22 + 0x0032]
	.word 0xf47421b4  ! 434: STX_I	stx	%r26, [%r16 + 0x01b4]
	.word 0x919421be  ! 435: WRPR_PIL_I	wrpr	%r16, 0x01be, %pil
	.word 0xfa244000  ! 436: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xf834c000  ! 438: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xfc74205f  ! 441: STX_I	stx	%r30, [%r16 + 0x005f]
	.word 0xfa3c8000  ! 443: STD_R	std	%r29, [%r18 + %r0]
	.word 0xf2354000  ! 444: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xf4342022  ! 446: STH_I	sth	%r26, [%r16 + 0x0022]
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 27)
	.word 0xf6248000  ! 450: STW_R	stw	%r27, [%r18 + %r0]
	.word 0x83952084  ! 451: WRPR_TNPC_I	wrpr	%r20, 0x0084, %tnpc
	.word 0xf034a162  ! 452: STH_I	sth	%r24, [%r18 + 0x0162]
	.word 0xf02d0000  ! 453: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xb12c0000  ! 457: SLL_R	sll 	%r16, %r0, %r24
	.word 0xbe148000  ! 458: OR_R	or 	%r18, %r0, %r31
	.word 0x8194e035  ! 459: WRPR_TPC_I	wrpr	%r19, 0x0035, %tpc
	.word 0x85952174  ! 461: WRPR_TSTATE_I	wrpr	%r20, 0x0174, %tstate
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 28)
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 11)
	.word 0xf43ca014  ! 472: STD_I	std	%r26, [%r18 + 0x0014]
	setx	data_start_6, %g1, %r22
	.word 0xf83da1a2  ! 475: STD_I	std	%r28, [%r22 + 0x01a2]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 27)
	.word 0xfb3d4000  ! 478: STDF_R	std	%f29, [%r0, %r21]
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 3c)
	.word 0xbb508000  ! 483: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf33c20f2  ! 485: STDF_I	std	%f25, [0x00f2, %r16]
	.word 0xf8754000  ! 486: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xb751c000  ! 487: RDPR_TL	<illegal instruction>
	.word 0xb6040000  ! 495: ADD_R	add 	%r16, %r0, %r27
	.word 0xf02c60a4  ! 498: STB_I	stb	%r24, [%r17 + 0x00a4]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 37)
	.word 0xf0248000  ! 508: STW_R	stw	%r24, [%r18 + %r0]
	setx	0xa52742a20000c9df, %g1, %r10
	.word 0x819a8000  ! 509: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbcb4e0ec  ! 510: SUBCcc_I	orncc 	%r19, 0x00ec, %r30
	.word 0xf82c8000  ! 512: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xb9508000  ! 515: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xfc25a010  ! 516: STW_I	stw	%r30, [%r22 + 0x0010]
	.word 0xf23c4000  ! 517: STD_R	std	%r25, [%r17 + %r0]
	.word 0xfc2d216a  ! 519: STB_I	stb	%r30, [%r20 + 0x016a]
	.word 0xff3dc000  ! 521: STDF_R	std	%f31, [%r0, %r23]
	.word 0xb3355000  ! 522: SRLX_R	srlx	%r21, %r0, %r25
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 20)
	.word 0xfa74e14f  ! 527: STX_I	stx	%r29, [%r19 + 0x014f]
	.word 0xf4258000  ! 529: STW_R	stw	%r26, [%r22 + %r0]
	.word 0x8395a180  ! 530: WRPR_TNPC_I	wrpr	%r22, 0x0180, %tnpc
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 2e)
	.word 0xbf504000  ! 535: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf225e143  ! 537: STW_I	stw	%r25, [%r23 + 0x0143]
	.word 0x9194e1af  ! 538: WRPR_PIL_I	wrpr	%r19, 0x01af, %pil
	.word 0xf43c0000  ! 541: STD_R	std	%r26, [%r16 + %r0]
	.word 0xf6748000  ! 549: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xb7540000  ! 551: RDPR_GL	rdpr	%-, %r27
	.word 0xf834e00d  ! 553: STH_I	sth	%r28, [%r19 + 0x000d]
	.word 0xf4250000  ! 562: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xfa3de1c5  ! 566: STD_I	std	%r29, [%r23 + 0x01c5]
	.word 0xf83d611e  ! 567: STD_I	std	%r28, [%r21 + 0x011e]
	setx	0x41e8d79d00000f5a, %g1, %r10
	.word 0x839a8000  ! 568: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xba442124  ! 569: ADDC_I	addc 	%r16, 0x0124, %r29
	.word 0xf0344000  ! 570: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xfc75a171  ! 573: STX_I	stx	%r30, [%r22 + 0x0171]
	.word 0x8394e06a  ! 575: WRPR_TNPC_I	wrpr	%r19, 0x006a, %tnpc
	.word 0xb73de001  ! 576: SRA_I	sra 	%r23, 0x0001, %r27
	.word 0xf034e183  ! 577: STH_I	sth	%r24, [%r19 + 0x0183]
	.word 0xf83cc000  ! 579: STD_R	std	%r28, [%r19 + %r0]
	.word 0xfa74201c  ! 580: STX_I	stx	%r29, [%r16 + 0x001c]
	.word 0xf8748000  ! 583: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xba44a05d  ! 584: ADDC_I	addc 	%r18, 0x005d, %r29
	setx	0x2e063a220000f9c3, %g1, %r10
	.word 0x839a8000  ! 587: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf4354000  ! 588: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xb40c20d4  ! 589: AND_I	and 	%r16, 0x00d4, %r26
	.word 0xf824a050  ! 591: STW_I	stw	%r28, [%r18 + 0x0050]
	.word 0xfc342052  ! 593: STH_I	sth	%r30, [%r16 + 0x0052]
	.word 0x85952017  ! 597: WRPR_TSTATE_I	wrpr	%r20, 0x0017, %tstate
	.word 0xb6a5c000  ! 599: SUBcc_R	subcc 	%r23, %r0, %r27
	.word 0xb1500000  ! 601: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x8395a13c  ! 602: WRPR_TNPC_I	wrpr	%r22, 0x013c, %tnpc
	.word 0x919461f6  ! 603: WRPR_PIL_I	wrpr	%r17, 0x01f6, %pil
	.word 0xf6358000  ! 607: STH_R	sth	%r27, [%r22 + %r0]
	setx	0x84bbd4d0000019dd, %g1, %r10
	.word 0x819a8000  ! 608: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x1e8ac4c500008d53, %g1, %r10
	.word 0x839a8000  ! 614: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf074e12a  ! 616: STX_I	stx	%r24, [%r19 + 0x012a]
	.word 0xf2754000  ! 617: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf67421dc  ! 618: STX_I	stx	%r27, [%r16 + 0x01dc]
	.word 0xf0254000  ! 619: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xb0044000  ! 621: ADD_R	add 	%r17, %r0, %r24
	setx	data_start_2, %g1, %r20
	.word 0xbd50c000  ! 625: RDPR_TT	rdpr	%tt, %r30
	.word 0xfc74e162  ! 626: STX_I	stx	%r30, [%r19 + 0x0162]
	.word 0xbe14a08c  ! 632: OR_I	or 	%r18, 0x008c, %r31
	.word 0xfe2d4000  ! 635: STB_R	stb	%r31, [%r21 + %r0]
	.word 0x839521cf  ! 636: WRPR_TNPC_I	wrpr	%r20, 0x01cf, %tnpc
	.word 0xf2250000  ! 638: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xfd3dc000  ! 639: STDF_R	std	%f30, [%r0, %r23]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 5)
	.word 0xfa358000  ! 645: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xf23c0000  ! 646: STD_R	std	%r25, [%r16 + %r0]
	.word 0xf42de1d6  ! 651: STB_I	stb	%r26, [%r23 + 0x01d6]
	.word 0xbd520000  ! 653: RDPR_PIL	rdpr	%pil, %r30
	.word 0x8d942037  ! 654: WRPR_PSTATE_I	wrpr	%r16, 0x0037, %pstate
	.word 0xbb500000  ! 659: RDPR_TPC	rdpr	%tpc, %r29
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 12)
	.word 0xf13da1b5  ! 667: STDF_I	std	%f24, [0x01b5, %r22]
	.word 0xfa2c4000  ! 669: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xf63d0000  ! 677: STD_R	std	%r27, [%r20 + %r0]
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 28)
	.word 0xf02c2072  ! 680: STB_I	stb	%r24, [%r16 + 0x0072]
	.word 0xbe3d0000  ! 682: XNOR_R	xnor 	%r20, %r0, %r31
	.word 0xf8756069  ! 688: STX_I	stx	%r28, [%r21 + 0x0069]
	mov	2, %r12
	.word 0x8f930000  ! 689: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbd510000  ! 692: RDPR_TICK	rdpr	%tick, %r30
	.word 0xf4358000  ! 701: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xf275a05c  ! 702: STX_I	stx	%r25, [%r22 + 0x005c]
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, b)
	.word 0xfc2c8000  ! 708: STB_R	stb	%r30, [%r18 + %r0]
	.word 0x91956051  ! 710: WRPR_PIL_I	wrpr	%r21, 0x0051, %pil
	.word 0x8994e07e  ! 718: WRPR_TICK_I	wrpr	%r19, 0x007e, %tick
	.word 0xf4252192  ! 723: STW_I	stw	%r26, [%r20 + 0x0192]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe3d618d  ! 726: STD_I	std	%r31, [%r21 + 0x018d]
	.word 0xf42de129  ! 731: STB_I	stb	%r26, [%r23 + 0x0129]
	.word 0xb950c000  ! 732: RDPR_TT	rdpr	%tt, %r28
	.word 0xfa3c0000  ! 733: STD_R	std	%r29, [%r16 + %r0]
	.word 0xf82c0000  ! 739: STB_R	stb	%r28, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa3de1af  ! 750: STD_I	std	%r29, [%r23 + 0x01af]
	.word 0xfe7560b0  ! 752: STX_I	stx	%r31, [%r21 + 0x00b0]
	.word 0xfa75c000  ! 756: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xf33d6157  ! 757: STDF_I	std	%f25, [0x0157, %r21]
	mov	2, %r12
	.word 0xa1930000  ! 759: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 33)
	.word 0xfe7561b1  ! 766: STX_I	stx	%r31, [%r21 + 0x01b1]
	.word 0xf8354000  ! 768: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf835e17c  ! 776: STH_I	sth	%r28, [%r23 + 0x017c]
	.word 0x8195e134  ! 777: WRPR_TPC_I	wrpr	%r23, 0x0134, %tpc
	.word 0xf0348000  ! 780: STH_R	sth	%r24, [%r18 + %r0]
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 3a)
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 17)
	.word 0xbd518000  ! 787: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xb01d2052  ! 788: XOR_I	xor 	%r20, 0x0052, %r24
	.word 0x8595e0a4  ! 793: WRPR_TSTATE_I	wrpr	%r23, 0x00a4, %tstate
	.word 0xfc240000  ! 799: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xbb352001  ! 808: SRL_I	srl 	%r20, 0x0001, %r29
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 26)
	.word 0xf13d20dd  ! 813: STDF_I	std	%f24, [0x00dd, %r20]
	setx	data_start_0, %g1, %r22
	.word 0xfd3c4000  ! 817: STDF_R	std	%f30, [%r0, %r17]
	.word 0xb08de1ca  ! 818: ANDcc_I	andcc 	%r23, 0x01ca, %r24
	.word 0x8994a16c  ! 820: WRPR_TICK_I	wrpr	%r18, 0x016c, %tick
	.word 0xf62c616c  ! 821: STB_I	stb	%r27, [%r17 + 0x016c]
	.word 0xf33c4000  ! 828: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf93d6192  ! 829: STDF_I	std	%f28, [0x0192, %r21]
	.word 0x8594e1d9  ! 831: WRPR_TSTATE_I	wrpr	%r19, 0x01d9, %tstate
	.word 0x879460d2  ! 834: WRPR_TT_I	wrpr	%r17, 0x00d2, %tt
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 9)
	setx	data_start_5, %g1, %r23
	.word 0xb9510000  ! 849: RDPR_TICK	rdpr	%tick, %r28
	.word 0xb32d8000  ! 854: SLL_R	sll 	%r22, %r0, %r25
	mov	1, %r12
	.word 0xa1930000  ! 855: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe2c8000  ! 857: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf8250000  ! 861: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xff3c8000  ! 862: STDF_R	std	%f31, [%r0, %r18]
	.word 0xfc3d6062  ! 866: STD_I	std	%r30, [%r21 + 0x0062]
	.word 0xfa744000  ! 870: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xf43c4000  ! 871: STD_R	std	%r26, [%r17 + %r0]
	.word 0xf62dc000  ! 877: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xfe35e145  ! 882: STH_I	sth	%r31, [%r23 + 0x0145]
	setx	data_start_5, %g1, %r16
	setx	data_start_1, %g1, %r22
	.word 0xb57c2401  ! 889: MOVR_I	movre	%r16, 0x1, %r26
	.word 0x8594a1fc  ! 892: WRPR_TSTATE_I	wrpr	%r18, 0x01fc, %tstate
	.word 0xfa740000  ! 895: STX_R	stx	%r29, [%r16 + %r0]
	.word 0x8995614d  ! 897: WRPR_TICK_I	wrpr	%r21, 0x014d, %tick
	.word 0xff3ca117  ! 899: STDF_I	std	%f31, [0x0117, %r18]
	.word 0xf07520f6  ! 900: STX_I	stx	%r24, [%r20 + 0x00f6]
	.word 0xfe3c0000  ! 901: STD_R	std	%r31, [%r16 + %r0]
	.word 0xb3504000  ! 903: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xf82d4000  ! 907: STB_R	stb	%r28, [%r21 + %r0]
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 7)
	.word 0x8994a1dc  ! 909: WRPR_TICK_I	wrpr	%r18, 0x01dc, %tick
	.word 0xfe346195  ! 910: STH_I	sth	%r31, [%r17 + 0x0195]
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 2d)
	.word 0xb7508000  ! 917: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x89942043  ! 924: WRPR_TICK_I	wrpr	%r16, 0x0043, %tick
	.word 0xff3d61ce  ! 931: STDF_I	std	%f31, [0x01ce, %r21]
	.word 0xb03d4000  ! 933: XNOR_R	xnor 	%r21, %r0, %r24
	.word 0xf0344000  ! 935: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xf42560ad  ! 937: STW_I	stw	%r26, [%r21 + 0x00ad]
	.word 0xf03c8000  ! 939: STD_R	std	%r24, [%r18 + %r0]
	setx	data_start_7, %g1, %r22
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, b)
	.word 0xfa2ca1df  ! 951: STB_I	stb	%r29, [%r18 + 0x01df]
	.word 0xb6bc6000  ! 952: XNORcc_I	xnorcc 	%r17, 0x0000, %r27
	mov	0, %r12
	.word 0x8f930000  ! 954: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 14)
	.word 0x85956123  ! 956: WRPR_TSTATE_I	wrpr	%r21, 0x0123, %tstate
	.word 0xf0342001  ! 957: STH_I	sth	%r24, [%r16 + 0x0001]
	.word 0x83952155  ! 962: WRPR_TNPC_I	wrpr	%r20, 0x0155, %tnpc
	.word 0xf33c8000  ! 964: STDF_R	std	%f25, [%r0, %r18]
	.word 0xf82c6143  ! 965: STB_I	stb	%r28, [%r17 + 0x0143]
	setx	data_start_3, %g1, %r21
	setx	0x243e1f3c00004e93, %g1, %r10
	.word 0x839a8000  ! 972: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf43cc000  ! 974: STD_R	std	%r26, [%r19 + %r0]
	setx	0x4b2c80b400006a80, %g1, %r10
	.word 0x819a8000  ! 977: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5520000  ! 980: RDPR_PIL	rdpr	%pil, %r26
	setx	data_start_1, %g1, %r19
	.word 0xb0b4a0ea  ! 995: ORNcc_I	orncc 	%r18, 0x00ea, %r24
	.word 0xb950c000  ! 996: RDPR_TT	<illegal instruction>
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
	setx	data_start_1, %g1, %r23
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf4050000  ! 4: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xb435a1a0  ! 5: SUBC_I	orn 	%r22, 0x01a0, %r26
	.word 0xf04520f9  ! 7: LDSW_I	ldsw	[%r20 + 0x00f9], %r24
	.word 0xf65c4000  ! 9: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xbb510000  ! 10: RDPR_TICK	<illegal instruction>
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 30)
	.word 0xb69d4000  ! 14: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0xb23dc000  ! 16: XNOR_R	xnor 	%r23, %r0, %r25
	.word 0xfe5dc000  ! 19: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xb57d8400  ! 20: MOVR_R	movre	%r22, %r0, %r26
	.word 0xb62420fd  ! 22: SUB_I	sub 	%r16, 0x00fd, %r27
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf24d61b9  ! 25: LDSB_I	ldsb	[%r21 + 0x01b9], %r25
	.word 0xf455e1e7  ! 28: LDSH_I	ldsh	[%r23 + 0x01e7], %r26
	.word 0xfc1421f0  ! 30: LDUH_I	lduh	[%r16 + 0x01f0], %r30
	.word 0xfc5d21a8  ! 36: LDX_I	ldx	[%r20 + 0x01a8], %r30
	.word 0xf214a1af  ! 38: LDUH_I	lduh	[%r18 + 0x01af], %r25
	.word 0xfc0d4000  ! 40: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xf6044000  ! 41: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0x89942086  ! 44: WRPR_TICK_I	wrpr	%r16, 0x0086, %tick
	.word 0xf04460d9  ! 45: LDSW_I	ldsw	[%r17 + 0x00d9], %r24
	.word 0xfe4c8000  ! 47: LDSB_R	ldsb	[%r18 + %r0], %r31
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 17)
	.word 0xf60d0000  ! 51: LDUB_R	ldub	[%r20 + %r0], %r27
	.word 0xb1342001  ! 53: SRL_I	srl 	%r16, 0x0001, %r24
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 4)
	.word 0xbcadc000  ! 58: ANDNcc_R	andncc 	%r23, %r0, %r30
	.word 0xf8446057  ! 60: LDSW_I	ldsw	[%r17 + 0x0057], %r28
	.word 0xbaa48000  ! 66: SUBcc_R	subcc 	%r18, %r0, %r29
	mov	0, %r12
	.word 0xa1930000  ! 67: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3518000  ! 69: RDPR_PSTATE	<illegal instruction>
	.word 0xf04de038  ! 70: LDSB_I	ldsb	[%r23 + 0x0038], %r24
	.word 0xfa0de12c  ! 71: LDUB_I	ldub	[%r23 + 0x012c], %r29
	.word 0xb9520000  ! 72: RDPR_PIL	<illegal instruction>
	setx	0x62a0ce300000f984, %g1, %r10
	.word 0x819a8000  ! 73: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf44da070  ! 77: LDSB_I	ldsb	[%r22 + 0x0070], %r26
	.word 0xfa0ce0c5  ! 81: LDUB_I	ldub	[%r19 + 0x00c5], %r29
	.word 0xb77d2401  ! 82: MOVR_I	movre	%r20, 0x1, %r27
	.word 0xf4054000  ! 85: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xb235a137  ! 88: ORN_I	orn 	%r22, 0x0137, %r25
	.word 0x919421b8  ! 97: WRPR_PIL_I	wrpr	%r16, 0x01b8, %pil
	.word 0xb92cc000  ! 98: SLL_R	sll 	%r19, %r0, %r28
	.word 0xfa15a0f2  ! 100: LDUH_I	lduh	[%r22 + 0x00f2], %r29
	.word 0xbb518000  ! 109: RDPR_PSTATE	<illegal instruction>
	.word 0xf205617d  ! 110: LDUW_I	lduw	[%r21 + 0x017d], %r25
	setx	0xdf6dc16900005f16, %g1, %r10
	.word 0x819a8000  ! 111: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf0440000  ! 116: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xfa55a13c  ! 117: LDSH_I	ldsh	[%r22 + 0x013c], %r29
	.word 0xf05d21ee  ! 118: LDX_I	ldx	[%r20 + 0x01ee], %r24
	.word 0xfa0da00d  ! 122: LDUB_I	ldub	[%r22 + 0x000d], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb034c000  ! 124: ORN_R	orn 	%r19, %r0, %r24
	.word 0xb214a0ac  ! 125: OR_I	or 	%r18, 0x00ac, %r25
	.word 0xb3500000  ! 126: RDPR_TPC	<illegal instruction>
	.word 0xf31ce1df  ! 127: LDDF_I	ldd	[%r19, 0x01df], %f25
	setx	0x3fb2349400006c09, %g1, %r10
	.word 0x819a8000  ! 130: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 29)
	.word 0xbe2d8000  ! 132: ANDN_R	andn 	%r22, %r0, %r31
	.word 0xf4552009  ! 133: LDSH_I	ldsh	[%r20 + 0x0009], %r26
	.word 0xf844e107  ! 134: LDSW_I	ldsw	[%r19 + 0x0107], %r28
	.word 0x819521a8  ! 137: WRPR_TPC_I	wrpr	%r20, 0x01a8, %tpc
	.word 0xb234e01d  ! 141: ORN_I	orn 	%r19, 0x001d, %r25
	.word 0xfc044000  ! 143: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0xfc546139  ! 144: LDSH_I	ldsh	[%r17 + 0x0139], %r30
	.word 0xfc450000  ! 147: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xf8148000  ! 148: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xf415e0be  ! 149: LDUH_I	lduh	[%r23 + 0x00be], %r26
	.word 0x8194a11b  ! 156: WRPR_TPC_I	wrpr	%r18, 0x011b, %tpc
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 2)
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 39)
	.word 0xf84d4000  ! 164: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xfe0ca12f  ! 166: LDUB_I	ldub	[%r18 + 0x012f], %r31
	.word 0xf014e165  ! 168: LDUH_I	lduh	[%r19 + 0x0165], %r24
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 18)
	.word 0xf01d21ee  ! 177: LDD_I	ldd	[%r20 + 0x01ee], %r24
	.word 0xf81ca054  ! 179: LDD_I	ldd	[%r18 + 0x0054], %r28
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 8)
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, b)
	setx	data_start_4, %g1, %r18
	.word 0x839561f0  ! 185: WRPR_TNPC_I	wrpr	%r21, 0x01f0, %tnpc
	.word 0xf65c0000  ! 186: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0xb77d8400  ! 187: MOVR_R	movre	%r22, %r0, %r27
	.word 0x87942087  ! 189: WRPR_TT_I	wrpr	%r16, 0x0087, %tt
	.word 0xb635c000  ! 192: ORN_R	orn 	%r23, %r0, %r27
	.word 0xb3508000  ! 195: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfb1c2072  ! 200: LDDF_I	ldd	[%r16, 0x0072], %f29
	setx	data_start_4, %g1, %r22
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, e)
	.word 0xf40ce0e3  ! 207: LDUB_I	ldub	[%r19 + 0x00e3], %r26
	mov	0, %r12
	.word 0x8f930000  ! 208: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x87942129  ! 212: WRPR_TT_I	wrpr	%r16, 0x0129, %tt
	.word 0xf05da111  ! 213: LDX_I	ldx	[%r22 + 0x0111], %r24
	.word 0xba0c0000  ! 214: AND_R	and 	%r16, %r0, %r29
	.word 0xf2558000  ! 215: LDSH_R	ldsh	[%r22 + %r0], %r25
	setx	data_start_0, %g1, %r20
	.word 0xf0458000  ! 225: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xf40c4000  ! 228: LDUB_R	ldub	[%r17 + %r0], %r26
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 23)
	.word 0xf8440000  ! 232: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xfe4c61c5  ! 234: LDSB_I	ldsb	[%r17 + 0x01c5], %r31
	.word 0xf00c603c  ! 236: LDUB_I	ldub	[%r17 + 0x003c], %r24
	.word 0xf24c0000  ! 237: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xfc140000  ! 241: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xff1de14c  ! 244: LDDF_I	ldd	[%r23, 0x014c], %f31
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 31)
	.word 0xb9520000  ! 254: RDPR_PIL	<illegal instruction>
	.word 0xfc558000  ! 255: LDSH_R	ldsh	[%r22 + %r0], %r30
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf6558000  ! 257: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xbcb5a1bb  ! 259: ORNcc_I	orncc 	%r22, 0x01bb, %r30
	.word 0xbb51c000  ! 266: RDPR_TL	<illegal instruction>
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 0)
	.word 0xf31dc000  ! 269: LDDF_R	ldd	[%r23, %r0], %f25
	.word 0xf855e0a4  ! 270: LDSH_I	ldsh	[%r23 + 0x00a4], %r28
	.word 0xf645e0b2  ! 271: LDSW_I	ldsw	[%r23 + 0x00b2], %r27
	.word 0x9195600d  ! 273: WRPR_PIL_I	wrpr	%r21, 0x000d, %pil
	.word 0xbd518000  ! 275: RDPR_PSTATE	<illegal instruction>
	.word 0xbd504000  ! 279: RDPR_TNPC	<illegal instruction>
	.word 0xb7540000  ! 282: RDPR_GL	<illegal instruction>
	.word 0xf31ce041  ! 284: LDDF_I	ldd	[%r19, 0x0041], %f25
	.word 0xf80de04b  ! 287: LDUB_I	ldub	[%r23 + 0x004b], %r28
	.word 0xb2bd0000  ! 292: XNORcc_R	xnorcc 	%r20, %r0, %r25
	.word 0xfa0c0000  ! 293: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0xfa040000  ! 294: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xb5504000  ! 296: RDPR_TNPC	<illegal instruction>
	.word 0xbd50c000  ! 298: RDPR_TT	<illegal instruction>
	.word 0xf01d2109  ! 301: LDD_I	ldd	[%r20 + 0x0109], %r24
	.word 0xbcb521b2  ! 305: ORNcc_I	orncc 	%r20, 0x01b2, %r30
	.word 0xfc55611b  ! 308: LDSH_I	ldsh	[%r21 + 0x011b], %r30
	.word 0xb1500000  ! 311: RDPR_TPC	<illegal instruction>
	.word 0xba3dc000  ! 312: XNOR_R	xnor 	%r23, %r0, %r29
	mov	0, %r12
	.word 0x8f930000  ! 313: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf05ce144  ! 314: LDX_I	ldx	[%r19 + 0x0144], %r24
	.word 0xf844e198  ! 316: LDSW_I	ldsw	[%r19 + 0x0198], %r28
	.word 0xb0344000  ! 318: ORN_R	orn 	%r17, %r0, %r24
	.word 0xbd35a001  ! 319: SRL_I	srl 	%r22, 0x0001, %r30
	.word 0xf05ce13c  ! 329: LDX_I	ldx	[%r19 + 0x013c], %r24
	.word 0xf05d8000  ! 333: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0xf21cc000  ! 334: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0xfb1d6022  ! 335: LDDF_I	ldd	[%r21, 0x0022], %f29
	.word 0xb82d8000  ! 337: ANDN_R	andn 	%r22, %r0, %r28
	.word 0xfc540000  ! 338: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xbb34d000  ! 339: SRLX_R	srlx	%r19, %r0, %r29
	.word 0xfc05c000  ! 341: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xf61dc000  ! 342: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xf85d0000  ! 343: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xb5540000  ! 344: RDPR_GL	<illegal instruction>
	.word 0x87956017  ! 347: WRPR_TT_I	wrpr	%r21, 0x0017, %tt
	.word 0xf0544000  ! 348: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0xf91de0e4  ! 349: LDDF_I	ldd	[%r23, 0x00e4], %f28
	.word 0xfe4c0000  ! 354: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xf055a1da  ! 356: LDSH_I	ldsh	[%r22 + 0x01da], %r24
	.word 0xba046012  ! 361: ADD_I	add 	%r17, 0x0012, %r29
	.word 0xf31d4000  ! 363: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xb8a4a091  ! 364: SUBcc_I	subcc 	%r18, 0x0091, %r28
	.word 0xbc850000  ! 365: ADDcc_R	addcc 	%r20, %r0, %r30
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf05c2057  ! 377: LDX_I	ldx	[%r16 + 0x0057], %r24
	.word 0xfe15e094  ! 378: LDUH_I	lduh	[%r23 + 0x0094], %r31
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 33)
	.word 0xf01cc000  ! 383: LDD_R	ldd	[%r19 + %r0], %r24
	.word 0xbb50c000  ! 385: RDPR_TT	<illegal instruction>
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 39)
	.word 0xb750c000  ! 388: RDPR_TT	<illegal instruction>
	.word 0xf31d8000  ! 391: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0xfe1d61b3  ! 394: LDD_I	ldd	[%r21 + 0x01b3], %r31
	.word 0xf0444000  ! 396: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xf2440000  ! 399: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xfa4ca02f  ! 400: LDSB_I	ldsb	[%r18 + 0x002f], %r29
	.word 0xf4444000  ! 402: LDSW_R	ldsw	[%r17 + %r0], %r26
	setx	0xb778bcd700000b8b, %g1, %r10
	.word 0x819a8000  ! 403: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb50c000  ! 405: RDPR_TT	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 406: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x3bb738990000bb44, %g1, %r10
	.word 0x839a8000  ! 408: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9540000  ! 412: RDPR_GL	<illegal instruction>
	.word 0xbf3d4000  ! 419: SRA_R	sra 	%r21, %r0, %r31
	setx	0x39ffea8c0000bb1a, %g1, %r10
	.word 0x819a8000  ! 424: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x919de5e60000e9c8, %g1, %r10
	.word 0x819a8000  ! 425: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	1, %r12
	.word 0xa1930000  ! 429: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf605c000  ! 431: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xfe554000  ! 432: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0x9195a1d0  ! 435: WRPR_PIL_I	wrpr	%r22, 0x01d0, %pil
	.word 0xfe55c000  ! 447: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xfc54a154  ! 448: LDSH_I	ldsh	[%r18 + 0x0154], %r30
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 25)
	.word 0x839460f9  ! 451: WRPR_TNPC_I	wrpr	%r17, 0x00f9, %tnpc
	.word 0xf84c0000  ! 456: LDSB_R	ldsb	[%r16 + %r0], %r28
	.word 0xb72d4000  ! 457: SLL_R	sll 	%r21, %r0, %r27
	.word 0xb8154000  ! 458: OR_R	or 	%r21, %r0, %r28
	.word 0x8194e0af  ! 459: WRPR_TPC_I	wrpr	%r19, 0x00af, %tpc
	.word 0x8594e137  ! 461: WRPR_TSTATE_I	wrpr	%r19, 0x0137, %tstate
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, e)
	.word 0xf054e0ff  ! 465: LDSH_I	ldsh	[%r19 + 0x00ff], %r24
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf04c4000  ! 469: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xf8552152  ! 470: LDSH_I	ldsh	[%r20 + 0x0152], %r28
	.word 0xf04c20cc  ! 471: LDSB_I	ldsb	[%r16 + 0x00cc], %r24
	setx	data_start_2, %g1, %r23
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 0)
	.word 0xf05ca04c  ! 479: LDX_I	ldx	[%r18 + 0x004c], %r24
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 28)
	.word 0xbf508000  ! 483: RDPR_TSTATE	<illegal instruction>
	.word 0xfa4560cb  ! 484: LDSW_I	ldsw	[%r21 + 0x00cb], %r29
	.word 0xb351c000  ! 487: RDPR_TL	<illegal instruction>
	.word 0xf41420f4  ! 490: LDUH_I	lduh	[%r16 + 0x00f4], %r26
	.word 0xbc04c000  ! 495: ADD_R	add 	%r19, %r0, %r30
	.word 0xf415a099  ! 497: LDUH_I	lduh	[%r22 + 0x0099], %r26
	.word 0xf804e061  ! 499: LDUW_I	lduw	[%r19 + 0x0061], %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf91c2159  ! 502: LDDF_I	ldd	[%r16, 0x0159], %f28
	.word 0xfe54a0e3  ! 505: LDSH_I	ldsh	[%r18 + 0x00e3], %r31
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 23)
	setx	0xa430fb4800001e50, %g1, %r10
	.word 0x819a8000  ! 509: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb2b4a120  ! 510: SUBCcc_I	orncc 	%r18, 0x0120, %r25
	.word 0xf51ca154  ! 514: LDDF_I	ldd	[%r18, 0x0154], %f26
	.word 0xbd508000  ! 515: RDPR_TSTATE	<illegal instruction>
	.word 0xfa05a0a8  ! 520: LDUW_I	lduw	[%r22 + 0x00a8], %r29
	.word 0xbd359000  ! 522: SRLX_R	srlx	%r22, %r0, %r30
	.word 0xfa44e1bc  ! 524: LDSW_I	ldsw	[%r19 + 0x01bc], %r29
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 2c)
	.word 0x8395a17e  ! 530: WRPR_TNPC_I	wrpr	%r22, 0x017e, %tnpc
	.word 0xf21d60d4  ! 531: LDD_I	ldd	[%r21 + 0x00d4], %r25
	.word 0xf11dc000  ! 532: LDDF_R	ldd	[%r23, %r0], %f24
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb7504000  ! 535: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xfa542100  ! 536: LDSH_I	ldsh	[%r16 + 0x0100], %r29
	.word 0x9195e0fa  ! 538: WRPR_PIL_I	wrpr	%r23, 0x00fa, %pil
	.word 0xf84d0000  ! 540: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0xfc1c0000  ! 542: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xb5540000  ! 551: RDPR_GL	<illegal instruction>
	.word 0xfc458000  ! 552: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xfe04609d  ! 559: LDUW_I	lduw	[%r17 + 0x009d], %r31
	.word 0xfa4c6170  ! 564: LDSB_I	ldsb	[%r17 + 0x0170], %r29
	setx	0x92ca267b00006dc4, %g1, %r10
	.word 0x839a8000  ! 568: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb4446163  ! 569: ADDC_I	addc 	%r17, 0x0163, %r26
	.word 0x83942183  ! 575: WRPR_TNPC_I	wrpr	%r16, 0x0183, %tnpc
	.word 0xbb3c2001  ! 576: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0xf44c6199  ! 578: LDSB_I	ldsb	[%r17 + 0x0199], %r26
	.word 0xfc1c8000  ! 582: LDD_R	ldd	[%r18 + %r0], %r30
	.word 0xba45a19a  ! 584: ADDC_I	addc 	%r22, 0x019a, %r29
	.word 0xf84de01c  ! 586: LDSB_I	ldsb	[%r23 + 0x001c], %r28
	setx	0xe37a246e00001f9c, %g1, %r10
	.word 0x839a8000  ! 587: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xba0d60c0  ! 589: AND_I	and 	%r21, 0x00c0, %r29
	.word 0xf91d6048  ! 595: LDDF_I	ldd	[%r21, 0x0048], %f28
	.word 0xf41d61a7  ! 596: LDD_I	ldd	[%r21 + 0x01a7], %r26
	.word 0x8595a0d3  ! 597: WRPR_TSTATE_I	wrpr	%r22, 0x00d3, %tstate
	.word 0xb0a48000  ! 599: SUBcc_R	subcc 	%r18, %r0, %r24
	.word 0xb3500000  ! 601: RDPR_TPC	<illegal instruction>
	.word 0x8394e070  ! 602: WRPR_TNPC_I	wrpr	%r19, 0x0070, %tnpc
	.word 0x91956178  ! 603: WRPR_PIL_I	wrpr	%r21, 0x0178, %pil
	.word 0xf2144000  ! 604: LDUH_R	lduh	[%r17 + %r0], %r25
	setx	0x69dc7000002bc5, %g1, %r10
	.word 0x819a8000  ! 608: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf214e0a6  ! 610: LDUH_I	lduh	[%r19 + 0x00a6], %r25
	.word 0xfc4c21e0  ! 611: LDSB_I	ldsb	[%r16 + 0x01e0], %r30
	.word 0xfe15211f  ! 612: LDUH_I	lduh	[%r20 + 0x011f], %r31
	setx	0x5ba1baad0000adcc, %g1, %r10
	.word 0x839a8000  ! 614: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf255a0fe  ! 615: LDSH_I	ldsh	[%r22 + 0x00fe], %r25
	.word 0xfc45a13a  ! 620: LDSW_I	ldsw	[%r22 + 0x013a], %r30
	.word 0xb404c000  ! 621: ADD_R	add 	%r19, %r0, %r26
	setx	data_start_1, %g1, %r16
	.word 0xf84cc000  ! 623: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xb150c000  ! 625: RDPR_TT	<illegal instruction>
	.word 0xf71d8000  ! 629: LDDF_R	ldd	[%r22, %r0], %f27
	.word 0xf51ce03b  ! 630: LDDF_I	ldd	[%r19, 0x003b], %f26
	.word 0xb214606c  ! 632: OR_I	or 	%r17, 0x006c, %r25
	.word 0xf65c0000  ! 633: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0xf614a16c  ! 634: LDUH_I	lduh	[%r18 + 0x016c], %r27
	.word 0x8394a1cb  ! 636: WRPR_TNPC_I	wrpr	%r18, 0x01cb, %tnpc
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 26)
	.word 0xf65d6029  ! 643: LDX_I	ldx	[%r21 + 0x0029], %r27
	.word 0xf6150000  ! 652: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xb7520000  ! 653: RDPR_PIL	<illegal instruction>
	.word 0x8d95a053  ! 654: WRPR_PSTATE_I	wrpr	%r22, 0x0053, %pstate
	.word 0xf804e042  ! 657: LDUW_I	lduw	[%r19 + 0x0042], %r28
	.word 0xfe45207a  ! 658: LDSW_I	ldsw	[%r20 + 0x007a], %r31
	.word 0xbf500000  ! 659: RDPR_TPC	<illegal instruction>
	.word 0xfd1d4000  ! 660: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xfe0d4000  ! 665: LDUB_R	ldub	[%r21 + %r0], %r31
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 15)
	.word 0xf84de161  ! 672: LDSB_I	ldsb	[%r23 + 0x0161], %r28
	.word 0xfe1dc000  ! 675: LDD_R	ldd	[%r23 + %r0], %r31
	.word 0xfa04c000  ! 676: LDUW_R	lduw	[%r19 + %r0], %r29
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 11)
	.word 0xfa4dc000  ! 681: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xb63cc000  ! 682: XNOR_R	xnor 	%r19, %r0, %r27
	.word 0xf24ce03f  ! 683: LDSB_I	ldsb	[%r19 + 0x003f], %r25
	.word 0xf60ca059  ! 686: LDUB_I	ldub	[%r18 + 0x0059], %r27
	.word 0xf644c000  ! 687: LDSW_R	ldsw	[%r19 + %r0], %r27
	mov	0, %r12
	.word 0x8f930000  ! 689: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1510000  ! 692: RDPR_TICK	<illegal instruction>
	.word 0xf11c0000  ! 695: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xfc450000  ! 697: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xfa5de11d  ! 699: LDX_I	ldx	[%r23 + 0x011d], %r29
	.word 0xf25d0000  ! 704: LDX_R	ldx	[%r20 + %r0], %r25
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 3c)
	.word 0x9194a0f5  ! 710: WRPR_PIL_I	wrpr	%r18, 0x00f5, %pil
	.word 0xf8450000  ! 713: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xfc052000  ! 714: LDUW_I	lduw	[%r20 + 0x0000], %r30
	.word 0x8994a08a  ! 718: WRPR_TICK_I	wrpr	%r18, 0x008a, %tick
	.word 0xf254c000  ! 719: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xfd1da029  ! 720: LDDF_I	ldd	[%r22, 0x0029], %f30
	.word 0xff1cc000  ! 722: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0xf4450000  ! 724: LDSW_R	ldsw	[%r20 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe1ca1aa  ! 727: LDD_I	ldd	[%r18 + 0x01aa], %r31
	.word 0xf8148000  ! 728: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xf64ca1a9  ! 729: LDSB_I	ldsb	[%r18 + 0x01a9], %r27
	.word 0xbf50c000  ! 732: RDPR_TT	<illegal instruction>
	.word 0xf0540000  ! 734: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xf41de143  ! 735: LDD_I	ldd	[%r23 + 0x0143], %r26
	.word 0xfc1c4000  ! 736: LDD_R	ldd	[%r17 + %r0], %r30
	.word 0xf654216e  ! 737: LDSH_I	ldsh	[%r16 + 0x016e], %r27
	.word 0xfc5dc000  ! 740: LDX_R	ldx	[%r23 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf014e0c6  ! 749: LDUH_I	lduh	[%r19 + 0x00c6], %r24
	.word 0xf65c2085  ! 751: LDX_I	ldx	[%r16 + 0x0085], %r27
	.word 0xf2044000  ! 754: LDUW_R	lduw	[%r17 + %r0], %r25
	mov	0, %r12
	.word 0xa1930000  ! 759: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf24d4000  ! 762: LDSB_R	ldsb	[%r21 + %r0], %r25
	.word 0xf64c8000  ! 763: LDSB_R	ldsb	[%r18 + %r0], %r27
	.word 0xf014e01f  ! 764: LDUH_I	lduh	[%r19 + 0x001f], %r24
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 28)
	.word 0xf61d20d1  ! 770: LDD_I	ldd	[%r20 + 0x00d1], %r27
	.word 0xf60c0000  ! 771: LDUB_R	ldub	[%r16 + %r0], %r27
	.word 0xfc05a0a4  ! 772: LDUW_I	lduw	[%r22 + 0x00a4], %r30
	.word 0xf6152035  ! 775: LDUH_I	lduh	[%r20 + 0x0035], %r27
	.word 0x8194609f  ! 777: WRPR_TPC_I	wrpr	%r17, 0x009f, %tpc
	.word 0xf01d0000  ! 782: LDD_R	ldd	[%r20 + %r0], %r24
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 12)
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, c)
	.word 0xb1518000  ! 787: RDPR_PSTATE	<illegal instruction>
	.word 0xb21c6161  ! 788: XOR_I	xor 	%r17, 0x0161, %r25
	.word 0xf81c61d6  ! 791: LDD_I	ldd	[%r17 + 0x01d6], %r28
	.word 0x859421e8  ! 793: WRPR_TSTATE_I	wrpr	%r16, 0x01e8, %tstate
	.word 0xf84dc000  ! 794: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xf91d0000  ! 798: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0xf64420b2  ! 800: LDSW_I	ldsw	[%r16 + 0x00b2], %r27
	.word 0xfc542074  ! 804: LDSH_I	ldsh	[%r16 + 0x0074], %r30
	.word 0xf044605c  ! 805: LDSW_I	ldsw	[%r17 + 0x005c], %r24
	.word 0xf85dc000  ! 807: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xb5352001  ! 808: SRL_I	srl 	%r20, 0x0001, %r26
	.word 0xf8142123  ! 809: LDUH_I	lduh	[%r16 + 0x0123], %r28
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, e)
	setx	data_start_7, %g1, %r17
	.word 0xfa4de18f  ! 816: LDSB_I	ldsb	[%r23 + 0x018f], %r29
	.word 0xb88c2156  ! 818: ANDcc_I	andcc 	%r16, 0x0156, %r28
	.word 0x8994a05f  ! 820: WRPR_TICK_I	wrpr	%r18, 0x005f, %tick
	.word 0xf51da028  ! 822: LDDF_I	ldd	[%r22, 0x0028], %f26
	.word 0xf00c8000  ! 823: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xf0440000  ! 824: LDSW_R	ldsw	[%r16 + %r0], %r24
	.word 0xfe4d61bc  ! 826: LDSB_I	ldsb	[%r21 + 0x01bc], %r31
	.word 0xf20520fb  ! 830: LDUW_I	lduw	[%r20 + 0x00fb], %r25
	.word 0x8595a1bb  ! 831: WRPR_TSTATE_I	wrpr	%r22, 0x01bb, %tstate
	.word 0xfd1ce113  ! 833: LDDF_I	ldd	[%r19, 0x0113], %f30
	.word 0x879421cd  ! 834: WRPR_TT_I	wrpr	%r16, 0x01cd, %tt
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfc444000  ! 837: LDSW_R	ldsw	[%r17 + %r0], %r30
	setx	data_start_1, %g1, %r20
	.word 0xfc550000  ! 841: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xbb510000  ! 849: RDPR_TICK	<illegal instruction>
	.word 0xff1ca1cd  ! 850: LDDF_I	ldd	[%r18, 0x01cd], %f31
	.word 0xf6442042  ! 853: LDSW_I	ldsw	[%r16 + 0x0042], %r27
	.word 0xb72d0000  ! 854: SLL_R	sll 	%r20, %r0, %r27
	mov	1, %r12
	.word 0xa1930000  ! 855: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf40ce1c2  ! 856: LDUB_I	ldub	[%r19 + 0x01c2], %r26
	.word 0xf24da0c4  ! 863: LDSB_I	ldsb	[%r22 + 0x00c4], %r25
	.word 0xf01d8000  ! 867: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xf8448000  ! 868: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xf85d8000  ! 878: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xf71cc000  ! 879: LDDF_R	ldd	[%r19, %r0], %f27
	.word 0xf64460d7  ! 880: LDSW_I	ldsw	[%r17 + 0x00d7], %r27
	setx	data_start_7, %g1, %r23
	setx	data_start_5, %g1, %r21
	.word 0xbd7d2401  ! 889: MOVR_I	movre	%r20, 0x1, %r30
	.word 0x8594e158  ! 892: WRPR_TSTATE_I	wrpr	%r19, 0x0158, %tstate
	.word 0x8994a1dd  ! 897: WRPR_TICK_I	wrpr	%r18, 0x01dd, %tick
	.word 0xf6548000  ! 898: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0xb7504000  ! 903: RDPR_TNPC	<illegal instruction>
	.word 0xf6046017  ! 905: LDUW_I	lduw	[%r17 + 0x0017], %r27
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 25)
	.word 0x8994a078  ! 909: WRPR_TICK_I	wrpr	%r18, 0x0078, %tick
	.word 0xfa04611f  ! 911: LDUW_I	lduw	[%r17 + 0x011f], %r29
	.word 0xf25de16b  ! 913: LDX_I	ldx	[%r23 + 0x016b], %r25
	.word 0xf015e09a  ! 914: LDUH_I	lduh	[%r23 + 0x009a], %r24
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 34)
	.word 0xb5508000  ! 917: RDPR_TSTATE	<illegal instruction>
	.word 0xf00d613b  ! 919: LDUB_I	ldub	[%r21 + 0x013b], %r24
	.word 0xf25d0000  ! 920: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xf51d606f  ! 921: LDDF_I	ldd	[%r21, 0x006f], %f26
	.word 0x8995e166  ! 924: WRPR_TICK_I	wrpr	%r23, 0x0166, %tick
	.word 0xff1da13d  ! 926: LDDF_I	ldd	[%r22, 0x013d], %f31
	.word 0xfa542185  ! 930: LDSH_I	ldsh	[%r16 + 0x0185], %r29
	.word 0xb43d4000  ! 933: XNOR_R	xnor 	%r21, %r0, %r26
	setx	data_start_3, %g1, %r16
	.word 0xf8552179  ! 944: LDSH_I	ldsh	[%r20 + 0x0179], %r28
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, f)
	.word 0xfc1d0000  ! 948: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xbabda031  ! 952: XNORcc_I	xnorcc 	%r22, 0x0031, %r29
	.word 0xf4042174  ! 953: LDUW_I	lduw	[%r16 + 0x0174], %r26
	mov	2, %r12
	.word 0x8f930000  ! 954: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 22)
	.word 0x85942187  ! 956: WRPR_TSTATE_I	wrpr	%r16, 0x0187, %tstate
	.word 0xfd1d2155  ! 961: LDDF_I	ldd	[%r20, 0x0155], %f30
	.word 0x8395e1b3  ! 962: WRPR_TNPC_I	wrpr	%r23, 0x01b3, %tnpc
	.word 0xf4454000  ! 963: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xf65dc000  ! 967: LDX_R	ldx	[%r23 + %r0], %r27
	setx	data_start_6, %g1, %r20
	.word 0xfa5d8000  ! 971: LDX_R	ldx	[%r22 + %r0], %r29
	setx	0xadb0d5b500001f5a, %g1, %r10
	.word 0x839a8000  ! 972: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf65dc000  ! 973: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xf00d60e0  ! 975: LDUB_I	ldub	[%r21 + 0x00e0], %r24
	setx	0x63178ee10000a848, %g1, %r10
	.word 0x819a8000  ! 977: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa0c8000  ! 979: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xb9520000  ! 980: RDPR_PIL	<illegal instruction>
	setx	data_start_4, %g1, %r16
	.word 0xfd1d8000  ! 989: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xf64d0000  ! 994: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xb4b5611b  ! 995: ORNcc_I	orncc 	%r21, 0x011b, %r26
	.word 0xbb50c000  ! 996: RDPR_TT	<illegal instruction>
	.word 0xfc05c000  ! 998: LDUW_R	lduw	[%r23 + %r0], %r30
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx	data_start_5, %g1, %r19
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb9a4c9a0  ! 3: FDIVs	fdivs	%f19, %f0, %f28
	.word 0xb835e01c  ! 5: SUBC_I	orn 	%r23, 0x001c, %r28
	.word 0xbda409a0  ! 6: FDIVs	fdivs	%f16, %f0, %f30
	.word 0xb9510000  ! 10: RDPR_TICK	<illegal instruction>
	.word 0xb7a00560  ! 11: FSQRTq	fsqrt	
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 7)
	.word 0xb69d4000  ! 14: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0xb9aa4820  ! 15: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb03dc000  ! 16: XNOR_R	xnor 	%r23, %r0, %r24
	.word 0xb77d8400  ! 20: MOVR_R	movre	%r22, %r0, %r27
	.word 0xb3a81c20  ! 21: FMOVRGEZ	dis not found

	.word 0xb425a1d1  ! 22: SUB_I	sub 	%r22, 0x01d1, %r26
	.word 0xb9a00540  ! 23: FSQRTd	fsqrt	
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 20)
	.word 0xbda40820  ! 29: FADDs	fadds	%f16, %f0, %f30
	.word 0xbda58860  ! 32: FADDq	dis not found

	.word 0xbda90820  ! 35: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb7a508a0  ! 42: FSUBs	fsubs	%f20, %f0, %f27
	.word 0x8995a0f5  ! 44: WRPR_TICK_I	wrpr	%r22, 0x00f5, %tick
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 23)
	.word 0xbda488c0  ! 52: FSUBd	fsubd	%f18, %f0, %f30
	.word 0xbb35e001  ! 53: SRL_I	srl 	%r23, 0x0001, %r29
	.word 0xb9a4c8c0  ! 55: FSUBd	fsubd	%f50, %f0, %f28
	.word 0xbbab4820  ! 56: FMOVCC	fmovs	%fcc1, %f0, %f29
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 6)
	.word 0xbcac4000  ! 58: ANDNcc_R	andncc 	%r17, %r0, %r30
	.word 0xb5a4c820  ! 64: FADDs	fadds	%f19, %f0, %f26
	.word 0xbaa58000  ! 66: SUBcc_R	subcc 	%r22, %r0, %r29
	mov	2, %r12
	.word 0xa1930000  ! 67: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbba508a0  ! 68: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xb9518000  ! 69: RDPR_PSTATE	<illegal instruction>
	.word 0xb1520000  ! 72: RDPR_PIL	<illegal instruction>
	setx	0xc517c67c00001e0b, %g1, %r10
	.word 0x819a8000  ! 73: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa588a0  ! 74: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xbda54940  ! 79: FMULd	fmuld	%f52, %f0, %f30
	.word 0xbb7ce401  ! 82: MOVR_I	movre	%r19, 0x1, %r29
	.word 0xb9a98820  ! 83: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb9a81820  ! 87: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb635614b  ! 88: ORN_I	orn 	%r21, 0x014b, %r27
	.word 0xbbab8820  ! 89: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbda44840  ! 92: FADDd	faddd	%f48, %f0, %f30
	.word 0xb5a44820  ! 93: FADDs	fadds	%f17, %f0, %f26
	.word 0xb1a589e0  ! 96: FDIVq	dis not found

	.word 0x9194a1cc  ! 97: WRPR_PIL_I	wrpr	%r18, 0x01cc, %pil
	.word 0xbd2d4000  ! 98: SLL_R	sll 	%r21, %r0, %r30
	.word 0xbba4c9a0  ! 107: FDIVs	fdivs	%f19, %f0, %f29
	.word 0xbf518000  ! 109: RDPR_PSTATE	<illegal instruction>
	setx	0x6647d01d000099df, %g1, %r10
	.word 0x819a8000  ! 111: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb4354000  ! 124: ORN_R	orn 	%r21, %r0, %r26
	.word 0xb2156193  ! 125: OR_I	or 	%r21, 0x0193, %r25
	.word 0xb9500000  ! 126: RDPR_TPC	<illegal instruction>
	setx	0x24b2d4840000dd1f, %g1, %r10
	.word 0x819a8000  ! 130: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, a)
	.word 0xb42d0000  ! 132: ANDN_R	andn 	%r20, %r0, %r26
	.word 0xbfa44920  ! 135: FMULs	fmuls	%f17, %f0, %f31
	.word 0x8194e12b  ! 137: WRPR_TPC_I	wrpr	%r19, 0x012b, %tpc
	.word 0xb435a012  ! 141: ORN_I	orn 	%r22, 0x0012, %r26
	.word 0xb7a9c820  ! 146: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a80820  ! 150: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb5aa4820  ! 152: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0x8195a185  ! 156: WRPR_TPC_I	wrpr	%r22, 0x0185, %tpc
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 18)
	.word 0xb5a50860  ! 158: FADDq	dis not found

	.word 0xb5a84820  ! 159: FMOVE	fmovs	%fcc1, %f0, %f26
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 0)
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 10)
	.word 0xbba5c820  ! 176: FADDs	fadds	%f23, %f0, %f29
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 22)
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, b)
	setx	data_start_7, %g1, %r19
	.word 0xbdabc820  ! 184: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0x83946122  ! 185: WRPR_TNPC_I	wrpr	%r17, 0x0122, %tnpc
	.word 0xb97dc400  ! 187: MOVR_R	movre	%r23, %r0, %r28
	.word 0xbda80820  ! 188: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0x879460a0  ! 189: WRPR_TT_I	wrpr	%r17, 0x00a0, %tt
	.word 0xb2344000  ! 192: ORN_R	orn 	%r17, %r0, %r25
	.word 0xbb508000  ! 195: RDPR_TSTATE	<illegal instruction>
	.word 0xb3ab0820  ! 196: FMOVGU	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_7, %g1, %r17
	.word 0xb9ab0820  ! 203: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbda549c0  ! 204: FDIVd	fdivd	%f52, %f0, %f30
	.word 0xb1a81820  ! 205: FMOVRGZ	fmovs	%fcc3, %f0, %f24
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 1e)
	mov	2, %r12
	.word 0x8f930000  ! 208: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3a548e0  ! 211: FSUBq	dis not found

	.word 0x879560ae  ! 212: WRPR_TT_I	wrpr	%r21, 0x00ae, %tt
	.word 0xb80c4000  ! 214: AND_R	and 	%r17, %r0, %r28
	setx	data_start_0, %g1, %r18
	.word 0xb3a98820  ! 218: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbda81c20  ! 224: FMOVRGEZ	dis not found

	.word 0xb7a589e0  ! 226: FDIVq	dis not found

hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb3a4c840  ! 230: FADDd	faddd	%f50, %f0, %f56
	.word 0xb5a448e0  ! 238: FSUBq	dis not found

	.word 0xbfa81420  ! 239: FMOVRNZ	dis not found

	.word 0xb1a98820  ! 245: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb1a4c8c0  ! 247: FSUBd	fsubd	%f50, %f0, %f24
	.word 0xb3ab4820  ! 248: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbba98820  ! 249: FMOVNEG	fmovs	%fcc1, %f0, %f29
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 13)
	.word 0xb5a488e0  ! 253: FSUBq	dis not found

	.word 0xb1520000  ! 254: RDPR_PIL	<illegal instruction>
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 24)
	.word 0xbda98820  ! 258: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbcb4e146  ! 259: ORNcc_I	orncc 	%r19, 0x0146, %r30
	.word 0xb3a58960  ! 260: FMULq	dis not found

	.word 0xb9a489e0  ! 263: FDIVq	dis not found

	.word 0xb951c000  ! 266: RDPR_TL	<illegal instruction>
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 0)
	.word 0x9194202e  ! 273: WRPR_PIL_I	wrpr	%r16, 0x002e, %pil
	.word 0xb5518000  ! 275: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa40860  ! 278: FADDq	dis not found

	.word 0xb7504000  ! 279: RDPR_TNPC	<illegal instruction>
	.word 0xbf540000  ! 282: RDPR_GL	<illegal instruction>
	.word 0xb5a44940  ! 286: FMULd	fmuld	%f48, %f0, %f26
	.word 0xb3a488a0  ! 288: FSUBs	fsubs	%f18, %f0, %f25
	.word 0xb2bd4000  ! 292: XNORcc_R	xnorcc 	%r21, %r0, %r25
	.word 0xb7504000  ! 296: RDPR_TNPC	<illegal instruction>
	.word 0xb950c000  ! 298: RDPR_TT	<illegal instruction>
	.word 0xbeb4e151  ! 305: ORNcc_I	orncc 	%r19, 0x0151, %r31
	.word 0xb9a408e0  ! 306: FSUBq	dis not found

	.word 0xbba88820  ! 310: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbb500000  ! 311: RDPR_TPC	<illegal instruction>
	.word 0xbc3d4000  ! 312: XNOR_R	xnor 	%r21, %r0, %r30
	mov	2, %r12
	.word 0x8f930000  ! 313: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9a81820  ! 315: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb4354000  ! 318: ORN_R	orn 	%r21, %r0, %r26
	.word 0xb134e001  ! 319: SRL_I	srl 	%r19, 0x0001, %r24
	.word 0xb7aa0820  ! 321: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb3a409a0  ! 324: FDIVs	fdivs	%f16, %f0, %f25
	.word 0xb7aac820  ! 325: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a489c0  ! 327: FDIVd	fdivd	%f18, %f0, %f56
	.word 0xb82c8000  ! 337: ANDN_R	andn 	%r18, %r0, %r28
	.word 0xbf359000  ! 339: SRLX_R	srlx	%r22, %r0, %r31
	.word 0xb3540000  ! 344: RDPR_GL	<illegal instruction>
	.word 0x8794a0cf  ! 347: WRPR_TT_I	wrpr	%r18, 0x00cf, %tt
	.word 0xb9a8c820  ! 352: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb004a0e8  ! 361: ADD_I	add 	%r18, 0x00e8, %r24
	.word 0xb9a509a0  ! 362: FDIVs	fdivs	%f20, %f0, %f28
	.word 0xb4a4a15c  ! 364: SUBcc_I	subcc 	%r18, 0x015c, %r26
	.word 0xb8850000  ! 365: ADDcc_R	addcc 	%r20, %r0, %r28
	.word 0xbfaa4820  ! 368: FMOVNE	fmovs	%fcc1, %f0, %f31
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, b)
	.word 0xbda00540  ! 379: FSQRTd	fsqrt	
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, a)
	.word 0xb5ab0820  ! 382: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbf50c000  ! 385: RDPR_TT	<illegal instruction>
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 31)
	.word 0xbf50c000  ! 388: RDPR_TT	<illegal instruction>
	setx	0x7888aca500002ddc, %g1, %r10
	.word 0x819a8000  ! 403: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba448e0  ! 404: FSUBq	dis not found

	.word 0xbb50c000  ! 405: RDPR_TT	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 406: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a81420  ! 407: FMOVRNZ	dis not found

	setx	0xf2341b5000009a0c, %g1, %r10
	.word 0x839a8000  ! 408: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a84820  ! 409: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a00040  ! 411: FMOVd	fmovd	%f0, %f58
	.word 0xb9540000  ! 412: RDPR_GL	<illegal instruction>
	.word 0xbfa88820  ! 413: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a84820  ! 415: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a90820  ! 417: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb3a509a0  ! 418: FDIVs	fdivs	%f20, %f0, %f25
	.word 0xbf3d8000  ! 419: SRA_R	sra 	%r22, %r0, %r31
	.word 0xbfa58840  ! 421: FADDd	faddd	%f22, %f0, %f62
	.word 0xb5a00560  ! 422: FSQRTq	fsqrt	
	setx	0xe55b47b10000ea0f, %g1, %r10
	.word 0x819a8000  ! 424: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x7525cb2600002c96, %g1, %r10
	.word 0x819a8000  ! 425: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a90820  ! 427: FMOVLEU	fmovs	%fcc1, %f0, %f28
	mov	1, %r12
	.word 0xa1930000  ! 429: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x919561a4  ! 435: WRPR_PIL_I	wrpr	%r21, 0x01a4, %pil
	.word 0xb9a4c960  ! 439: FMULq	dis not found

	.word 0xbba80820  ! 440: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb7a00540  ! 442: FSQRTd	fsqrt	
	.word 0xb5a81c20  ! 445: FMOVRGEZ	dis not found

hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 3f)
	.word 0x8394e1be  ! 451: WRPR_TNPC_I	wrpr	%r19, 0x01be, %tnpc
	.word 0xb9a54920  ! 454: FMULs	fmuls	%f21, %f0, %f28
	.word 0xb12cc000  ! 457: SLL_R	sll 	%r19, %r0, %r24
	.word 0xbc140000  ! 458: OR_R	or 	%r16, %r0, %r30
	.word 0x8195606b  ! 459: WRPR_TPC_I	wrpr	%r21, 0x006b, %tpc
	.word 0xbba448c0  ! 460: FSUBd	fsubd	%f48, %f0, %f60
	.word 0x8595a04b  ! 461: WRPR_TSTATE_I	wrpr	%r22, 0x004b, %tstate
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 12)
	.word 0xbba549c0  ! 463: FDIVd	fdivd	%f52, %f0, %f60
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb1a00560  ! 468: FSQRTq	fsqrt	
	.word 0xbda84820  ! 473: FMOVE	fmovs	%fcc1, %f0, %f30
	setx	data_start_0, %g1, %r21
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 3d)
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbb508000  ! 483: RDPR_TSTATE	<illegal instruction>
	.word 0xbd51c000  ! 487: RDPR_TL	<illegal instruction>
	.word 0xb3a40920  ! 488: FMULs	fmuls	%f16, %f0, %f25
	.word 0xb7a8c820  ! 491: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb3a98820  ! 492: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbba80c20  ! 493: FMOVRLZ	dis not found

	.word 0xbc054000  ! 495: ADD_R	add 	%r21, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a4c8a0  ! 501: FSUBs	fsubs	%f19, %f0, %f28
	.word 0xbfabc820  ! 503: FMOVVC	fmovs	%fcc1, %f0, %f31
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, b)
	.word 0xb1ab8820  ! 507: FMOVPOS	fmovs	%fcc1, %f0, %f24
	setx	0xc4738f3900006802, %g1, %r10
	.word 0x819a8000  ! 509: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbab5a1c9  ! 510: SUBCcc_I	orncc 	%r22, 0x01c9, %r29
	.word 0xbd508000  ! 515: RDPR_TSTATE	<illegal instruction>
	.word 0xb535d000  ! 522: SRLX_R	srlx	%r23, %r0, %r26
	.word 0xbfa80c20  ! 523: FMOVRLZ	dis not found

hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 13)
	.word 0xb9a00020  ! 526: FMOVs	fmovs	%f0, %f28
	.word 0xbba54920  ! 528: FMULs	fmuls	%f21, %f0, %f29
	.word 0x8395e0a3  ! 530: WRPR_TNPC_I	wrpr	%r23, 0x00a3, %tnpc
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, d)
	.word 0xb5a50940  ! 534: FMULd	fmuld	%f20, %f0, %f26
	.word 0xbd504000  ! 535: RDPR_TNPC	<illegal instruction>
	.word 0x9195a169  ! 538: WRPR_PIL_I	wrpr	%r22, 0x0169, %pil
	.word 0xb9aa8820  ! 544: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbda54920  ! 545: FMULs	fmuls	%f21, %f0, %f30
	.word 0xbba58860  ! 548: FADDq	dis not found

	.word 0xbfa9c820  ! 550: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbf540000  ! 551: RDPR_GL	<illegal instruction>
	.word 0xb5a48940  ! 554: FMULd	fmuld	%f18, %f0, %f26
	.word 0xb9a8c820  ! 555: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbda5c920  ! 565: FMULs	fmuls	%f23, %f0, %f30
	setx	0x6df97e2c0000a906, %g1, %r10
	.word 0x839a8000  ! 568: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xba4560d1  ! 569: ADDC_I	addc 	%r21, 0x00d1, %r29
	.word 0xb7a448c0  ! 572: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xb7a98820  ! 574: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0x8394601e  ! 575: WRPR_TNPC_I	wrpr	%r17, 0x001e, %tnpc
	.word 0xbb3de001  ! 576: SRA_I	sra 	%r23, 0x0001, %r29
	.word 0xb7a409c0  ! 581: FDIVd	fdivd	%f16, %f0, %f58
	.word 0xb645613d  ! 584: ADDC_I	addc 	%r21, 0x013d, %r27
	setx	0xe61a9f6c00007f9c, %g1, %r10
	.word 0x839a8000  ! 587: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb60ca067  ! 589: AND_I	and 	%r18, 0x0067, %r27
	.word 0xb3a81420  ! 590: FMOVRNZ	dis not found

	.word 0xb5aa0820  ! 592: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbfa00540  ! 594: FSQRTd	fsqrt	
	.word 0x8595a1b1  ! 597: WRPR_TSTATE_I	wrpr	%r22, 0x01b1, %tstate
	.word 0xbea58000  ! 599: SUBcc_R	subcc 	%r22, %r0, %r31
	.word 0xb3a548a0  ! 600: FSUBs	fsubs	%f21, %f0, %f25
	.word 0xbf500000  ! 601: RDPR_TPC	<illegal instruction>
	.word 0x839560e3  ! 602: WRPR_TNPC_I	wrpr	%r21, 0x00e3, %tnpc
	.word 0x919561a6  ! 603: WRPR_PIL_I	wrpr	%r21, 0x01a6, %pil
	.word 0xbfa40920  ! 606: FMULs	fmuls	%f16, %f0, %f31
	setx	0x88d9da7000058c4, %g1, %r10
	.word 0x819a8000  ! 608: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba00540  ! 613: FSQRTd	fsqrt	
	setx	0x187e456d00001c8b, %g1, %r10
	.word 0x839a8000  ! 614: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xba040000  ! 621: ADD_R	add 	%r16, %r0, %r29
	setx	data_start_6, %g1, %r17
	.word 0xb5a54920  ! 624: FMULs	fmuls	%f21, %f0, %f26
	.word 0xb550c000  ! 625: RDPR_TT	<illegal instruction>
	.word 0xbba9c820  ! 627: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb7a44940  ! 628: FMULd	fmuld	%f48, %f0, %f58
	.word 0xbfa80820  ! 631: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbc14209e  ! 632: OR_I	or 	%r16, 0x009e, %r30
	.word 0x8395214e  ! 636: WRPR_TNPC_I	wrpr	%r20, 0x014e, %tnpc
	.word 0xbba40840  ! 637: FADDd	faddd	%f16, %f0, %f60
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 4)
	.word 0xb5a5c9e0  ! 647: FDIVq	dis not found

	.word 0xb5a5c8a0  ! 648: FSUBs	fsubs	%f23, %f0, %f26
	.word 0xb5a509c0  ! 650: FDIVd	fdivd	%f20, %f0, %f26
	.word 0xbb520000  ! 653: RDPR_PIL	<illegal instruction>
	.word 0x8d942184  ! 654: WRPR_PSTATE_I	wrpr	%r16, 0x0184, %pstate
	.word 0xb7500000  ! 659: RDPR_TPC	<illegal instruction>
	.word 0xb5a54960  ! 661: FMULq	dis not found

	.word 0xb1aa8820  ! 662: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb3a80820  ! 664: FMOVN	fmovs	%fcc1, %f0, %f25
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 20)
	.word 0xb3ab4820  ! 668: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb7a81c20  ! 670: FMOVRGEZ	dis not found

	.word 0xb7a588c0  ! 671: FSUBd	fsubd	%f22, %f0, %f58
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 26)
	.word 0xb43dc000  ! 682: XNOR_R	xnor 	%r23, %r0, %r26
	.word 0xbda50820  ! 684: FADDs	fadds	%f20, %f0, %f30
	mov	1, %r12
	.word 0x8f930000  ! 689: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda5c820  ! 690: FADDs	fadds	%f23, %f0, %f30
	.word 0xb3a44840  ! 691: FADDd	faddd	%f48, %f0, %f56
	.word 0xbd510000  ! 692: RDPR_TICK	<illegal instruction>
	.word 0xb9a449a0  ! 696: FDIVs	fdivs	%f17, %f0, %f28
	.word 0xb9a5c940  ! 698: FMULd	fmuld	%f54, %f0, %f28
	.word 0xbda81820  ! 703: FMOVRGZ	fmovs	%fcc3, %f0, %f30
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 28)
	.word 0xb7a00560  ! 706: FSQRTq	fsqrt	
	.word 0xbfa81820  ! 709: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0x9194203e  ! 710: WRPR_PIL_I	wrpr	%r16, 0x003e, %pil
	.word 0xbfa80820  ! 711: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb1a589a0  ! 715: FDIVs	fdivs	%f22, %f0, %f24
	.word 0x8994e095  ! 718: WRPR_TICK_I	wrpr	%r19, 0x0095, %tick
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd50c000  ! 732: RDPR_TT	<illegal instruction>
	.word 0xb5a81420  ! 738: FMOVRNZ	dis not found

	.word 0xb9a54860  ! 741: FADDq	dis not found

	.word 0xbda5c940  ! 742: FMULd	fmuld	%f54, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a80c20  ! 746: FMOVRLZ	dis not found

	.word 0xb5a489a0  ! 755: FDIVs	fdivs	%f18, %f0, %f26
	mov	2, %r12
	.word 0xa1930000  ! 759: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 6)
	.word 0xb3ab8820  ! 767: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a449e0  ! 774: FDIVq	dis not found

	.word 0x81952161  ! 777: WRPR_TPC_I	wrpr	%r20, 0x0161, %tpc
	.word 0xb5a80820  ! 781: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb3a44940  ! 783: FMULd	fmuld	%f48, %f0, %f56
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 37)
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 7)
	.word 0xbda408c0  ! 786: FSUBd	fsubd	%f16, %f0, %f30
	.word 0xbb518000  ! 787: RDPR_PSTATE	<illegal instruction>
	.word 0xb21c61a0  ! 788: XOR_I	xor 	%r17, 0x01a0, %r25
	.word 0xb1a80820  ! 789: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb9a54940  ! 792: FMULd	fmuld	%f52, %f0, %f28
	.word 0x85942184  ! 793: WRPR_TSTATE_I	wrpr	%r16, 0x0184, %tstate
	.word 0xbdab8820  ! 801: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a508e0  ! 802: FSUBq	dis not found

	.word 0xb5342001  ! 808: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0xbbabc820  ! 810: FMOVVC	fmovs	%fcc1, %f0, %f29
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 36)
	setx	data_start_2, %g1, %r23
	.word 0xb9a54920  ! 815: FMULs	fmuls	%f21, %f0, %f28
	.word 0xbe8c20f9  ! 818: ANDcc_I	andcc 	%r16, 0x00f9, %r31
	.word 0xb1a80420  ! 819: FMOVRZ	dis not found

	.word 0x8994a1e0  ! 820: WRPR_TICK_I	wrpr	%r18, 0x01e0, %tick
	.word 0xb1a448e0  ! 827: FSUBq	dis not found

	.word 0x8594a0c0  ! 831: WRPR_TSTATE_I	wrpr	%r18, 0x00c0, %tstate
	.word 0x8794a0f7  ! 834: WRPR_TT_I	wrpr	%r18, 0x00f7, %tt
	.word 0xb7a5c860  ! 835: FADDq	dis not found

hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 4)
	.word 0xb5a549c0  ! 839: FDIVd	fdivd	%f52, %f0, %f26
	setx	data_start_6, %g1, %r21
	.word 0xb5a5c940  ! 842: FMULd	fmuld	%f54, %f0, %f26
	.word 0xb9a90820  ! 846: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbfa94820  ! 847: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb1510000  ! 849: RDPR_TICK	<illegal instruction>
	.word 0xb92d0000  ! 854: SLL_R	sll 	%r20, %r0, %r28
	mov	2, %r12
	.word 0xa1930000  ! 855: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a98820  ! 858: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbda58840  ! 859: FADDd	faddd	%f22, %f0, %f30
	.word 0xb1a80820  ! 864: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbda4c860  ! 869: FADDq	dis not found

	.word 0xb1a00540  ! 875: FSQRTd	fsqrt	
	.word 0xb7a509a0  ! 876: FDIVs	fdivs	%f20, %f0, %f27
	.word 0xb7a50840  ! 884: FADDd	faddd	%f20, %f0, %f58
	setx	data_start_3, %g1, %r21
	.word 0xbfa94820  ! 887: FMOVCS	fmovs	%fcc1, %f0, %f31
	setx	data_start_4, %g1, %r19
	.word 0xb37d6401  ! 889: MOVR_I	movre	%r21, 0x1, %r25
	.word 0xb9a80820  ! 890: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0x8594206d  ! 892: WRPR_TSTATE_I	wrpr	%r16, 0x006d, %tstate
	.word 0xb9a48820  ! 893: FADDs	fadds	%f18, %f0, %f28
	.word 0x8994a1dc  ! 897: WRPR_TICK_I	wrpr	%r18, 0x01dc, %tick
	.word 0xbf504000  ! 903: RDPR_TNPC	<illegal instruction>
	.word 0xb5a00560  ! 904: FSQRTq	fsqrt	
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 29)
	.word 0x89952057  ! 909: WRPR_TICK_I	wrpr	%r20, 0x0057, %tick
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, e)
	.word 0xbd508000  ! 917: RDPR_TSTATE	<illegal instruction>
	.word 0xbdab8820  ! 918: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb9ab0820  ! 922: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbfa54960  ! 923: FMULq	dis not found

	.word 0x899561d4  ! 924: WRPR_TICK_I	wrpr	%r21, 0x01d4, %tick
	.word 0xbda81c20  ! 925: FMOVRGEZ	dis not found

	.word 0xb5a40860  ! 927: FADDq	dis not found

	.word 0xb1a80820  ! 928: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb23d0000  ! 933: XNOR_R	xnor 	%r20, %r0, %r25
	.word 0xb5ab0820  ! 940: FMOVGU	fmovs	%fcc1, %f0, %f26
	setx	data_start_0, %g1, %r23
	.word 0xb7aa0820  ! 942: FMOVA	fmovs	%fcc1, %f0, %f27
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbda00520  ! 947: FSQRTs	fsqrt	
	.word 0xb3a00560  ! 949: FSQRTq	fsqrt	
	.word 0xb9a00520  ! 950: FSQRTs	fsqrt	
	.word 0xbcbd21a3  ! 952: XNORcc_I	xnorcc 	%r20, 0x01a3, %r30
	mov	2, %r12
	.word 0x8f930000  ! 954: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 25)
	.word 0x859420c8  ! 956: WRPR_TSTATE_I	wrpr	%r16, 0x00c8, %tstate
	.word 0xb3a8c820  ! 960: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0x839460a9  ! 962: WRPR_TNPC_I	wrpr	%r17, 0x00a9, %tnpc
	.word 0xb3a81820  ! 966: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	setx	data_start_7, %g1, %r21
	.word 0xbfa54960  ! 970: FMULq	dis not found

	setx	0x76aa9d6300006d00, %g1, %r10
	.word 0x839a8000  ! 972: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9a408c0  ! 976: FSUBd	fsubd	%f16, %f0, %f28
	setx	0xe4617fe200007c0a, %g1, %r10
	.word 0x819a8000  ! 977: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9520000  ! 980: RDPR_PIL	<illegal instruction>
	.word 0xb5a81820  ! 981: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbfa408c0  ! 982: FSUBd	fsubd	%f16, %f0, %f62
	.word 0xbba94820  ! 984: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbfa548e0  ! 986: FSUBq	dis not found

	setx	data_start_6, %g1, %r18
	.word 0xb5a80820  ! 990: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb7a94820  ! 992: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbcb4e00b  ! 995: ORNcc_I	orncc 	%r19, 0x000b, %r30
	.word 0xbb50c000  ! 996: RDPR_TT	<illegal instruction>

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

	.xword	0x14f535483e0f6cb1
	.xword	0x5bf982dabdc50bd6
	.xword	0x47ecf85049833de6
	.xword	0xab7267818886d60c
	.xword	0x458d4bcccdfb0973
	.xword	0xb406e29dab98b3c2
	.xword	0xd653405208c0e76d
	.xword	0x828eb5fc5cb6b919
	.xword	0xd5cffc9857f6bb69
	.xword	0x745fa27473a13b77
	.xword	0x885fbe4d4c557ff7
	.xword	0x8a0dd44cf0debca1
	.xword	0xc6c0298c71c87e3b
	.xword	0x88d6c111f6eba692
	.xword	0xd19fde2cd36c71d2
	.xword	0xd408d330f9659d69
	.xword	0x46ddbc8fae154c48
	.xword	0x67cf962ff919e517
	.xword	0x7f091fe0c7684f3f
	.xword	0x83dfe136c2f090ec
	.xword	0x0cdb8107e0d81218
	.xword	0xd1d9a3dfbc53a1eb
	.xword	0x6e4f40b2901265a9
	.xword	0xebb27c01cd375f4f
	.xword	0xed558b0cc6c8116a
	.xword	0x13da322d3c4e6049
	.xword	0x61478b81e9345a89
	.xword	0xcaabaaa1e0b9dd99
	.xword	0xfd03554d589d4bbc
	.xword	0xda246233c59c6499
	.xword	0x8c7de79f4bf8b193
	.xword	0x1fa7ef82d3e35e63
	.xword	0x226cb7e4bf373725
	.xword	0x4071c8f03f50c09d
	.xword	0xf6372103fef68b94
	.xword	0x8fada05ff48a4916
	.xword	0x020ca1f5f695f881
	.xword	0x036c77d46b0a3749
	.xword	0x25f544338caac4f4
	.xword	0xfef7d8e335cfd5b9
	.xword	0xc6a263652d46f34c
	.xword	0x956ea30e459e79f1
	.xword	0x7e56371dd1a14203
	.xword	0x41b20fa6039732c4
	.xword	0xc05db7bfa5e7da70
	.xword	0x43cf73a4140a6a38
	.xword	0x1ca1d91702b2f449
	.xword	0xb5cf6fa0296710a5
	.xword	0x89a7f5cf1050e38d
	.xword	0x0c092d3b49ab4dec
	.xword	0xb36b9cf187488222
	.xword	0xa122a0f717b23d12
	.xword	0x7cf0362d0095f33e
	.xword	0x0733f48b9b636ddb
	.xword	0xf8065e2c602445b2
	.xword	0xf4cbd62570cb2890
	.xword	0xf4975a0af7aa4e7b
	.xword	0xe01052ee6ad0b0ee
	.xword	0x14a9a6dec03117a8
	.xword	0xea35e4a806413fe3
	.xword	0x0d77571acae1fa72
	.xword	0xcac0f1fcb84fe03c
	.xword	0xb1e05fa38880ea7d
	.xword	0x9316e4f6330c1f8c
	.xword	0x91d348bebc734f73
	.xword	0x60323b93468593cc
	.xword	0xeb9000e1c6511d62
	.xword	0xc6916f1bb5689cd9
	.xword	0x26ccc4c7ccf09ce8
	.xword	0x8ae91fc5cc548ba0
	.xword	0xd50e64150d3ae651
	.xword	0xe397a50386a9e7cc
	.xword	0x80525f6368d0dff5
	.xword	0x0fd52e8e44a8ce9b
	.xword	0xde6be9eec3d83702
	.xword	0x09038f33ad8aaa9f
	.xword	0xf0a6bc2d4215373b
	.xword	0x5dab93213e67da2e
	.xword	0x6b55e8eb0424b3e6
	.xword	0x4bbf5705fdda07f1
	.xword	0x2f43b10f7be1e136
	.xword	0x52337e8a556f1c85
	.xword	0x9313abdc3f2fb8d4
	.xword	0xf195d1494ee29310
	.xword	0x073a3aa04941bcb5
	.xword	0x3346393a5ec03e1a
	.xword	0xee297604ae404579
	.xword	0x5abb2af4c162dd9a
	.xword	0xdbfd7da417be0603
	.xword	0x312ed2aff4f73438
	.xword	0xdfbea12354d87032
	.xword	0x76a2ddf901519b82
	.xword	0x72ef52733ce1f2c3
	.xword	0x70be6db60eeae331
	.xword	0xe2f7616cff437037
	.xword	0x5279ff0a152a6b4c
	.xword	0xb8ddaaaa5ee1b400
	.xword	0xb4ea6e28a52ee161
	.xword	0x83f5ebc19b75c9cc
	.xword	0xe689d36e211d0792
	.xword	0xb698b79af5cdbca6
	.xword	0xfcc73e9a6591cb82
	.xword	0x5adbefd1ed67797e
	.xword	0x14869bc73c7b4dcd
	.xword	0xe56120ea4a210ee0
	.xword	0x609c64bf75bdfcf2
	.xword	0x8e8133ddc2078c13
	.xword	0xdcfd275d10c699ef
	.xword	0xee296f16c0aad18c
	.xword	0x8e6e7ddb29b54f7f
	.xword	0x32418c87280c4056
	.xword	0xcdbdbfb0b6041590
	.xword	0x2c98ed501ca50a4b
	.xword	0x2c0faf9cccdf6024
	.xword	0x6c314f876133ab35
	.xword	0xf82dfaecdd6ca889
	.xword	0x41d28b50bd9d30d5
	.xword	0xff37609dc215242a
	.xword	0x99e4ec85b81b19e9
	.xword	0xa83ac8297dd76fef
	.xword	0x14169d66b1150d70
	.xword	0x2d85d970a767c60c
	.xword	0xb176bacfe3aa0f2f
	.xword	0xcb2633dfabf1bccf
	.xword	0x755cb3279696fa74
	.xword	0xfbfdeab2832fd87a
	.xword	0x90d43fd094e92b42
	.xword	0x5b72d78aa6020e28
	.xword	0xa6ffa80ad7ce5e94
	.xword	0x8c2f882f31c34c22
	.xword	0xb29afa1d499835dd
	.xword	0x13410256bd968d0e
	.xword	0xff491f5e1a562cba
	.xword	0x497da31a85411256
	.xword	0x07f8730d63571eea
	.xword	0x81ef1d346e4f0595
	.xword	0x98cb79971eee50c7
	.xword	0xd4b8f0e2437a569d
	.xword	0x4ecacf1c144f212b
	.xword	0x75d8e788c3f63245
	.xword	0x809b4ae9b0095b05
	.xword	0xe41dfb94c9f7d0f8
	.xword	0x4abbd2514b39786f
	.xword	0x03ae2abda0537dee
	.xword	0x093a1499f0b26451
	.xword	0xe9ee806d1fbdcaf4
	.xword	0x049aeb45347f4868
	.xword	0x5c39754295660310
	.xword	0xaec14a730b7b822e
	.xword	0xa099e90a06398de7
	.xword	0xfccf4cc3b9eb06a6
	.xword	0xa2f3d8fa27bed4de
	.xword	0xd44c9dc52eace8f2
	.xword	0x50bedcce119fa382
	.xword	0x9047a674faf217d9
	.xword	0xe56fd1b678f01193
	.xword	0x9520610d26f901d3
	.xword	0xa29758938ae5f696
	.xword	0x1e513111f8695ed1
	.xword	0xd024168489b819bb
	.xword	0x76c62ddd69dbd1d9
	.xword	0x56327e68263f37d4
	.xword	0xd9c994084e6e8fe5
	.xword	0x7a101851455074c4
	.xword	0xd153c5d4189c0370
	.xword	0x7d65b5e03e82b06d
	.xword	0x0705e5323159b5c6
	.xword	0x7f577449266f55b7
	.xword	0xefb1b4dbdffa8738
	.xword	0xa9a290f8e48df7a7
	.xword	0xc57dfe0df2dedf82
	.xword	0x20bdd00ee8f2fea2
	.xword	0xb464fa99b8a72f4b
	.xword	0x4793029fa2f15bfa
	.xword	0xd06034fd6ed41c63
	.xword	0xfafc444ae80609ff
	.xword	0x2749c16a81756020
	.xword	0xfc7488b08116917a
	.xword	0x23bc948e7a495bf4
	.xword	0xe117037dd4969c13
	.xword	0x2a18ae02413909f9
	.xword	0xa0d4a4c85760ad0f
	.xword	0x93e75e19ad95c2c5
	.xword	0x9e14b204ce4b0ad6
	.xword	0x914ba3c0705a9383
	.xword	0xbe6770fb88c95db2
	.xword	0xf8a863992aa518be
	.xword	0xf24bd0e5dfd81c9f
	.xword	0x5d80d329d7a12495
	.xword	0x460c1135ae6940d8
	.xword	0x6a693c1e9b0504fc
	.xword	0xc71dcd5b1aae7cd0
	.xword	0xe2009608f9163636
	.xword	0x7bf6b133129bd4bf
	.xword	0xdaa6db0143582060
	.xword	0xf63d654204a59703
	.xword	0x9b925930bfa31a02
	.xword	0x6ffb9637e9f837bf
	.xword	0xe15d94559dbaa911
	.xword	0xa1d8ba442268ae3f
	.xword	0x5bc93ca8e681b5b1
	.xword	0x6a7e10119b992f0c
	.xword	0x10d2c2297648c88e
	.xword	0xbc1f5bed8c3985fb
	.xword	0xb075b7bcbf82543f
	.xword	0xa52e7eb5daeda9b8
	.xword	0x4f880a80cc1c30a1
	.xword	0x4a899a46e839f372
	.xword	0x01762bff1ce4a6b9
	.xword	0x6838348f1ee05515
	.xword	0xfb448962b5f3cf56
	.xword	0xf5b1ba97c264f239
	.xword	0xe82bc5de07f1b56d
	.xword	0x39d878bb9ac033ea
	.xword	0x735da5e13e67033e
	.xword	0x94a65f88435fbb6b
	.xword	0xe20447e5e55f1dcd
	.xword	0x902fc62dd98fdabf
	.xword	0x025bf9f0ca9e6cfe
	.xword	0xfde099f828e68c70
	.xword	0x05b45d30e99e1162
	.xword	0xf9be407063057ef2
	.xword	0x802f3be096dc93c7
	.xword	0x5f51d76e3aec0c25
	.xword	0x5142b33386e7cf19
	.xword	0x44a2596c0ffb75e3
	.xword	0xe99bec763c86e907
	.xword	0xc2b507be1605e33b
	.xword	0xcdff836f587a3de1
	.xword	0xbb3b531bd1765825
	.xword	0xd2619736cdda78ee
	.xword	0xbd8b521bdd5f34e0
	.xword	0x9c5de50e2c6ba3ac
	.xword	0x067445f0ed0f0474
	.xword	0xa27a7c6893a4ede6
	.xword	0xbdba6337457e538f
	.xword	0xfef65b65f5b0fb29
	.xword	0xa095cfd439b4f239
	.xword	0xcbd026fab31a2412
	.xword	0xeb55640a82d77f3e
	.xword	0x8dcb6324e1f33e73
	.xword	0x9971e1cd742fc53b
	.xword	0x28b62ce919ac6103
	.xword	0x2c7762589e7878cc
	.xword	0x23ea06ac70484a41
	.xword	0xf45bb8f80554cd10
	.xword	0x6e5b520cb091fa16
	.xword	0xd5f2a8a0a61a1ed0
	.xword	0xa2fd7cec564e4019
	.xword	0x5238427b2c6c3803
	.xword	0x33ac8ca90075de5b
	.xword	0x5d18bd91494b8bee
	.xword	0x491c0dd091a2a675
	.xword	0x0f6472b8b97a7d51
	.xword	0xcc87fc9a46858e55
	.xword	0xcb192f0acd950b23
	.align 0x2000
	.data
data_start_1:

	.xword	0x60bd4ff3a8aafc1c
	.xword	0x2520ba261f690af1
	.xword	0x696d2472a7f80fdb
	.xword	0xf24a422866eb6bcd
	.xword	0x3734b85ef903f77b
	.xword	0x018b73b3180dd6c6
	.xword	0x036cceeec6268921
	.xword	0x0d2b50082b8c6b06
	.xword	0x3407a97af21c46ff
	.xword	0xc13682c8fe935a96
	.xword	0xe7ee2593fa664266
	.xword	0x5d8510bd755ff7d2
	.xword	0x5cf7ca7ee2cce4ff
	.xword	0xa3d7dc63026f0b4d
	.xword	0x801251301d471f8f
	.xword	0x7dd4dbdb883ccdb6
	.xword	0x1355709a9311980e
	.xword	0x5799c2a4a291166b
	.xword	0x8f5deced2cd4fec2
	.xword	0xcba48e2a36c85fdb
	.xword	0x08766a1aba257b46
	.xword	0xb97a36ec0e24b465
	.xword	0xacb5da4bb4e76f1d
	.xword	0x6d05e530dae88ac0
	.xword	0x1718d5c50b830e4b
	.xword	0x04bd50a7c5a1f251
	.xword	0x869512fd9eead61f
	.xword	0x4d99b82c8e5257a7
	.xword	0x5d43c06ee8216a87
	.xword	0x610625cc7d0c7595
	.xword	0xa6d9d0b8d2fdbcc9
	.xword	0x5a2cd25cd8c678e4
	.xword	0x099e977489babafc
	.xword	0x44b725f406e36e7d
	.xword	0xac70468daf553e39
	.xword	0xa5113905d530e6b1
	.xword	0x633db2ef05b12fc8
	.xword	0x77bceee6fa23c7fe
	.xword	0xe14896df2aa65ca1
	.xword	0xc3b6c82da7c1c42c
	.xword	0x5455c0c96ae825ba
	.xword	0x9b4d7c592b1e28ee
	.xword	0xb7be01a6e67c6c4a
	.xword	0x93fce365e688fe65
	.xword	0x664280172f0801b8
	.xword	0x373094539350c872
	.xword	0xbbe05d5c7681999d
	.xword	0x9090d505d7c801f7
	.xword	0xe83a93948dbe007b
	.xword	0x588dc979d9ff5ec4
	.xword	0x2966613408d970b2
	.xword	0xa7a841168f936fe7
	.xword	0xe8c2b822f92ec4bf
	.xword	0xb0f2111b6447b59b
	.xword	0x72bfd7c7da174d20
	.xword	0xd7d4d85ae3b3b219
	.xword	0xfba1306dd8cf982d
	.xword	0x2c51ede58439b2e9
	.xword	0x8b572076eaf2736d
	.xword	0xbb1de5ebf23a9591
	.xword	0x9b55f1d79e6822b6
	.xword	0x6861d1751ea8bc01
	.xword	0xc85b6d23ae0058cc
	.xword	0x214a492ec33d52d7
	.xword	0xb8d8c18d32c26990
	.xword	0x0f7d32c18b3cf911
	.xword	0x3c99f3e8232872d5
	.xword	0xedd7a6ef79ee6425
	.xword	0x8e3e0f27b62f3128
	.xword	0xc84cc77605b05af1
	.xword	0x58ff5b4ae0ec59d4
	.xword	0x3f1c3fa82e17c933
	.xword	0x5180490fca8c0ccf
	.xword	0xd78d48900b2b0d97
	.xword	0xbfbd9f7f02d2c2f1
	.xword	0x12f78ff707b56ab7
	.xword	0xff50244ce2818d45
	.xword	0xcb358177d023d140
	.xword	0xb127fb4b0f2e4488
	.xword	0xe25a4c885a4f123c
	.xword	0x60720114ad3e9b1d
	.xword	0xddc4ae751bb9e467
	.xword	0xe3fb96a625bc7ee2
	.xword	0xff326096064699b6
	.xword	0x4db0bd0e2a29d1db
	.xword	0xa46e98d92c385957
	.xword	0x71fb343cc822c0ef
	.xword	0x7a63184852582299
	.xword	0x2313c7ff620bb1b2
	.xword	0xb462d937a72130c3
	.xword	0xecc295d72dd90212
	.xword	0x552a6584ca3474c3
	.xword	0xa55ad04b9f0989e5
	.xword	0x210a38a4dc5bc0bf
	.xword	0x71531c5dc912ce3c
	.xword	0x119da798c31c5185
	.xword	0x383674d357676220
	.xword	0x58db274f1a2893e8
	.xword	0x95b2dcfbc36477fd
	.xword	0xa9f40b71df72d4a5
	.xword	0x73223f7ad6fc0280
	.xword	0xde3df36317093dd4
	.xword	0xca7cb3c47e60c21d
	.xword	0x97d84d87c5affc80
	.xword	0xe48b3d9a94fd7121
	.xword	0x5db8d9875dd11c07
	.xword	0xbf832b8f4674c9df
	.xword	0x5ce4eed635a67675
	.xword	0x8882fe60b5270dbd
	.xword	0x8ce3b74ac486f6f7
	.xword	0x8baf71e3b429de68
	.xword	0x23e1b96ce40cb1b4
	.xword	0x9a5e61cf62572470
	.xword	0x9d8d5ce0839a0cff
	.xword	0xf4d08aa7318a4a09
	.xword	0x8de740a1062ac7f4
	.xword	0x0a7499f56e74f373
	.xword	0x085becca4891108d
	.xword	0x01788487e6b97e14
	.xword	0xbf69ec7ef2ba8965
	.xword	0xce90c222c12e5db9
	.xword	0xf308cadabbfb9331
	.xword	0x040533e276127fcd
	.xword	0x84e6b247eadd38d2
	.xword	0xea50b22baa011aca
	.xword	0xbbbe4c751ec12ba8
	.xword	0x79ef2ff5ebb47faf
	.xword	0x4a0e0fdf55d3b2c9
	.xword	0x84f932b48599d56c
	.xword	0x1283d250a5b0d6c2
	.xword	0x03b6310464683406
	.xword	0x5c84bbfdd4503a62
	.xword	0x1687d48389f06d64
	.xword	0x7b22e8a448ec53cd
	.xword	0xbe9040b88283f3c0
	.xword	0x9bec5aade107fb74
	.xword	0xd5fdb992a966c61f
	.xword	0xe22128368a2ca82d
	.xword	0xd298710f02bae4b7
	.xword	0x6fdceb2e1a76b492
	.xword	0xc8e03c4eb76cb117
	.xword	0xe2c7b8c9b159f5d6
	.xword	0xeedca247cd281e30
	.xword	0x00f173fda6cf8ceb
	.xword	0xb09be5e1d3aa4d82
	.xword	0x698a7d46d322af82
	.xword	0x882dcee54a46bf17
	.xword	0x8975c12d8b1b3f8c
	.xword	0x6c3acdd81597a4da
	.xword	0x535fd0fefda139ce
	.xword	0xe13215d31b15c01b
	.xword	0xa6350ef9f1d44ba3
	.xword	0xba03e19efeb50d3c
	.xword	0xae2395fe7340c3e5
	.xword	0xbf4f18a5a6190936
	.xword	0x5ee60250ee6e3b96
	.xword	0xbb73fc96833525bb
	.xword	0x76695c6d2717c0e9
	.xword	0x78930e93dce97977
	.xword	0x4e6a4b7dce8d9332
	.xword	0x8d943d4f066274ce
	.xword	0x1741e91406eeff22
	.xword	0x6e9dc604416d21de
	.xword	0xd053b759891e6a7b
	.xword	0xe8242eb6abdd028b
	.xword	0x05123526518f22f6
	.xword	0x33dbc829268521af
	.xword	0x582a6cbc831d3e7d
	.xword	0xab6c7e50dbd7b88f
	.xword	0x13ee4803c2ea9fb2
	.xword	0x391dc42f4830ce8b
	.xword	0x833f5c0da0d54073
	.xword	0xbb941fcd93de5284
	.xword	0x7cff9a1fee774d7e
	.xword	0x4647abd002d06628
	.xword	0x068092b9bed056fe
	.xword	0x06d7dda9ae4a60fe
	.xword	0x1c2e178fb17af0cb
	.xword	0xe1602e785f75e8c9
	.xword	0x93ecc1becb6d3880
	.xword	0xe544d856f0697357
	.xword	0xa3292ec667c43cd6
	.xword	0x76fc1e2b9507cf19
	.xword	0x6811d4a0f4a05a3d
	.xword	0xa4eba83c744e8dec
	.xword	0xa59d59093c589749
	.xword	0xb96b30a9be473a43
	.xword	0x0b98c8c0c747d25f
	.xword	0x8251f824992885d9
	.xword	0x2c668e9ed29e81f5
	.xword	0x65d469081bb23611
	.xword	0xcec866eb373e68c2
	.xword	0x9357ef17f1af7c90
	.xword	0xf1166baee478dc96
	.xword	0x8e0c72d792a461ad
	.xword	0x68033f0cd180c3e3
	.xword	0x20784524773527fe
	.xword	0x2763e1aa62033a00
	.xword	0x759db56dcb9a4c59
	.xword	0xa2ea7eb79542af77
	.xword	0x85373467e0baebaf
	.xword	0x758675efd819bcfd
	.xword	0xbaa2e9c5b9a93d79
	.xword	0xe600b908e48fdea9
	.xword	0x7226be5238cc1c5d
	.xword	0xd18379f02b53a96f
	.xword	0x0b693308551a595c
	.xword	0x238ac464eeed1234
	.xword	0xe73eb4482d3bb947
	.xword	0xd5997be0753ebfb5
	.xword	0x837ab516c1bd0be9
	.xword	0x94ad5c1872c7b8fb
	.xword	0x16ae519f89247c1d
	.xword	0x100bad3acff2ae5a
	.xword	0xbb3bca1c87f806a4
	.xword	0xb8de5ee49ccc4915
	.xword	0x5de856582450533d
	.xword	0x86e1f78d91528e0b
	.xword	0xaa36663273ad0a02
	.xword	0xc2d675ba7f097374
	.xword	0xd158e9330eab2038
	.xword	0x0e67417d717ab164
	.xword	0x37c63fe452c0c352
	.xword	0x5a9479baa97765f0
	.xword	0x8c330c08cc471168
	.xword	0x8671584779c72fd3
	.xword	0x5563864948358d46
	.xword	0xde3ccb616039e7e6
	.xword	0x9e938817381155aa
	.xword	0xfad9931658beaca2
	.xword	0x75db4342216a5b04
	.xword	0xc8b13115fc964a06
	.xword	0xcea8e1fcefb71cfd
	.xword	0xb575915a278d2b12
	.xword	0x0bc6140e80fb5933
	.xword	0x188abc8a4993866b
	.xword	0x69f97866d3f671f1
	.xword	0x3090456c6f34139c
	.xword	0xd96f8554860c5665
	.xword	0x32a57e5d75bc8dfa
	.xword	0xf6b22a1b77a88164
	.xword	0x24f1e810b955619f
	.xword	0x0f9f3fe7e4a45c34
	.xword	0xba9dd048c33b8024
	.xword	0x3b42eee9e40bbfa5
	.xword	0xa1937cd931f1c060
	.xword	0xcef65aa46de3c449
	.xword	0x976b4ce80c28f1ad
	.xword	0x771f3ef4aab1bb47
	.xword	0xc573fd7e7169ae2f
	.xword	0xf4e63cb964b27ecf
	.xword	0x3bdec7b32bb781c8
	.xword	0x9d352951334736ca
	.xword	0xcdc3ce4eff2a5b91
	.xword	0xbfbaddba2a3cf944
	.xword	0x896aa642580c8e20
	.align 0x4000
	.data
data_start_2:

	.xword	0x60d464befaf13136
	.xword	0x3fb452dc0068f5d0
	.xword	0xa13b1cc9a36e0a6f
	.xword	0xb61c68e87239cac1
	.xword	0x91f8899abf794e34
	.xword	0x4b86f67b30621106
	.xword	0x901cbfe0504b05e4
	.xword	0xcc95b80e5234fc4e
	.xword	0xba199a1650e8d97c
	.xword	0xc043cd3510525ee9
	.xword	0x91fc042d14d7ecaa
	.xword	0x5eeae6477c573e12
	.xword	0x457b772d3d5be34e
	.xword	0x7c39f6cc333b0901
	.xword	0x8bbfcfba7eb4a4bf
	.xword	0xf8a614e63da6fdb7
	.xword	0xc48b9528f45c636f
	.xword	0x1118e50e20c84b26
	.xword	0xfa96c0809cb7b73b
	.xword	0x0f91425cac2ac8da
	.xword	0xa8de3ed97f455d6f
	.xword	0x70fd91e3b98fcbbf
	.xword	0xcbd9525e7e135b0a
	.xword	0x9c63ce71553be578
	.xword	0xc373289cf98904ee
	.xword	0x58c3c08557b45a7c
	.xword	0x81b5ff28fa64b428
	.xword	0xd98a630dca59fc60
	.xword	0x6eee27f302663ce0
	.xword	0x648c4c097b050021
	.xword	0xfaebcdfacbaff1fe
	.xword	0x47a9094d693c6848
	.xword	0x7bf0d5aadaada779
	.xword	0x6d62a9c285a12b52
	.xword	0x5749fdfd73c35251
	.xword	0xfa3720e1637e42f1
	.xword	0x69c1768984a56d98
	.xword	0x1ad10a6b79c07e75
	.xword	0x55a6a252f03950a2
	.xword	0x5214f0e79f117ff1
	.xword	0x788aa38f1d7e1b22
	.xword	0x0ae0f241309e4037
	.xword	0x243b24a1e4e8c15e
	.xword	0x1f1bfe5062570bf8
	.xword	0xc6686197aa1c97b7
	.xword	0xb6c898ddb9f8f523
	.xword	0x83234ee59c270a98
	.xword	0x0cfc2be9f2c6bdc4
	.xword	0x7ea79ce2aad30678
	.xword	0x5ecbc9d3005a72ae
	.xword	0xf27a705f41f651bc
	.xword	0xfc0a4413eb61fcfc
	.xword	0x4be09f1bbb884932
	.xword	0x881c841dcda52d26
	.xword	0xa9774a0df42593e8
	.xword	0xde95e699f0f4022f
	.xword	0x7e647cf175808c76
	.xword	0xcda5abe4cec6c743
	.xword	0x3e88359ab7eb787c
	.xword	0xb07e1dbcf8f8c56e
	.xword	0x230492618cc2e107
	.xword	0xbe5950208c022ba6
	.xword	0x80f7e00ec3cadf7a
	.xword	0x75f6fd69dc2b5376
	.xword	0x72ea42714a51932a
	.xword	0x71530c0bfd6e19fb
	.xword	0xf68ce0e840f5bbe1
	.xword	0x4fd352d15164ce7a
	.xword	0xbc15cb2d61e4b20e
	.xword	0xc4a673b5f6cb376c
	.xword	0xa4fcaaad7a65ce20
	.xword	0xb40ba0c58661fd48
	.xword	0x9d3a969a465a2efb
	.xword	0xaa11edab8f8f850a
	.xword	0x2a40e5b1962a5b8f
	.xword	0xad8fde526bab7240
	.xword	0xc95097ef9cc2f69c
	.xword	0xcd786491ab28f9df
	.xword	0x2133e77b42f32488
	.xword	0x67031382d9bbccea
	.xword	0xe6da1523b1e62e5c
	.xword	0x7d7340c5a989b801
	.xword	0x29041af6177dfa13
	.xword	0xdfada8ebc4422fa5
	.xword	0x6207f453559df8d7
	.xword	0xcfff59727d3761c6
	.xword	0xe447e98b63a0158d
	.xword	0x56848b594c294163
	.xword	0xc5497a5bad7393cf
	.xword	0x10133c053291ef45
	.xword	0x7acc1dc2519fab92
	.xword	0x63bef553330b7fdf
	.xword	0xbf639c28498f252a
	.xword	0x758a31d69df21a64
	.xword	0xe1d85dff22586c44
	.xword	0x81bf0657e2c730a4
	.xword	0x06b8b03095479110
	.xword	0x3313e388c8989d68
	.xword	0xeaa26864854c6e0d
	.xword	0xb2350883d2a10583
	.xword	0xb3b87e02b6b15aa9
	.xword	0xe8604ad35d516c75
	.xword	0x4c8a94645ad4b06d
	.xword	0xc099b3ea9b1c8b69
	.xword	0x74b4f555f3d71128
	.xword	0x722fe14d1d9b0247
	.xword	0x184e28fb061c7512
	.xword	0xd622131526a59dc4
	.xword	0x29c9fef26d86db78
	.xword	0x31195105cb77a275
	.xword	0x9c704d49a37f9205
	.xword	0x252a09bdbb399858
	.xword	0x254b406700321eda
	.xword	0x6cfe638f3b4cebc3
	.xword	0xc540239dd10a5daa
	.xword	0x3200d12f17cce283
	.xword	0x5a59cd0977998e60
	.xword	0x25fdf040b14dc220
	.xword	0x196594bcf2d86f0c
	.xword	0xd44e422b972e9848
	.xword	0x86a8c2b530352efc
	.xword	0x58879b94b177f978
	.xword	0xf993aaaa69e18898
	.xword	0x3ae68a77f43d6394
	.xword	0x2cad03fb78d8688b
	.xword	0x741ac05aab309233
	.xword	0x0b95a42a6cb2593c
	.xword	0x49e69e4e46fec683
	.xword	0x3976a0152f3c126b
	.xword	0xfdaf374a1a4a27c8
	.xword	0xfdbe0b9cb25acadf
	.xword	0xb75920e238c83f6f
	.xword	0xc38fa2c6e1968c66
	.xword	0xaf33b1620e56ad32
	.xword	0x51836059540f7d37
	.xword	0xd7f4f14a6a17571a
	.xword	0x2a49af96a621df3e
	.xword	0xf4f7a89bb3f0d3bf
	.xword	0x6bd8a991863ca230
	.xword	0xd67a4a3a10552812
	.xword	0x35242bceb6604ac4
	.xword	0xc06ebdb83e78e9f5
	.xword	0x68b7634627f11a8c
	.xword	0x0878705a861e37e0
	.xword	0xb243811eca76484a
	.xword	0x2680cc15353faaec
	.xword	0xffe90dad460ed2f1
	.xword	0x34a4dbf731963803
	.xword	0x8378442172c0ef04
	.xword	0x33b545411a7e6257
	.xword	0xa8890da29f472357
	.xword	0x361cb469784d839e
	.xword	0x2bf6d70891a1feb0
	.xword	0x19010ff63a43f09c
	.xword	0xf387667b23e4bad4
	.xword	0x58590a53287e25ff
	.xword	0x142f5bf1ee26f4af
	.xword	0xacb75c2c7185ddf8
	.xword	0xd46e1996f1921871
	.xword	0xc469a23c12483d0e
	.xword	0x2977e6c0a59f2957
	.xword	0x053cffa939b58558
	.xword	0x6be3e4c005409a70
	.xword	0xbbb46b247d98be2d
	.xword	0xc0b8e20c16102561
	.xword	0x0e8b896defb2ae98
	.xword	0x488840ff971018b9
	.xword	0xe100b577f99f4d67
	.xword	0x5bd48d93e7b04a13
	.xword	0x6249c4badaed20f7
	.xword	0x3e255377845e662b
	.xword	0x4eb61280eaaa7878
	.xword	0x3edfdeab6c12429f
	.xword	0x623316ec02cdd8bd
	.xword	0x421cae5eda6d4036
	.xword	0x3d116f3726e311df
	.xword	0x9c43e6670cdc618e
	.xword	0xac6c9802e50b0982
	.xword	0x4b7d63d672cb7a40
	.xword	0x995a21ced013d86d
	.xword	0x8aaccd11cb039153
	.xword	0x796096780af38d71
	.xword	0x4a68f35250da25cc
	.xword	0xae74ce455d87d6c4
	.xword	0xd2a054d7abb856b5
	.xword	0xa0584788239ed118
	.xword	0xb2405a6e64fcba5d
	.xword	0x29944669b50e54fa
	.xword	0x986d8d989aac68a3
	.xword	0x1b277f81b1a44e66
	.xword	0x977707c2395f6d54
	.xword	0x1b490e020d67fe5d
	.xword	0x46a8b1921d79cfac
	.xword	0x3e100d80f43a27cd
	.xword	0xb8f3bf387a53ef95
	.xword	0x83c2634bbbd26a95
	.xword	0xedc3b3fc97bcf313
	.xword	0xc934565ccd9b683a
	.xword	0x73ea7be3a52feb8e
	.xword	0xccdb8577e840d4d3
	.xword	0xf82f7a159b83c35b
	.xword	0x7e567397d6d33cdd
	.xword	0x4a7ddc05611dd9d5
	.xword	0x8d7795ff2eea77c8
	.xword	0x3cfe4ee52abeb769
	.xword	0x888f1eee3b3b961d
	.xword	0x1fd20854ead96d17
	.xword	0x6056b1e2ef04330b
	.xword	0x699c53dd56b5d492
	.xword	0x0c48ab22b397a5b5
	.xword	0xb774ad2139cdbb0d
	.xword	0x05da34e232126ae8
	.xword	0x5225366c5b79a1c5
	.xword	0x301808c4cd8f7524
	.xword	0x534e797e3a9c0101
	.xword	0x69a89ba26db10212
	.xword	0xb21bf546a250df8a
	.xword	0xc1babfa28a7e5a7c
	.xword	0xa23f40fc3f062cab
	.xword	0x13b03a801d9660a5
	.xword	0x33363e4cfed16129
	.xword	0xf4a998f2d2a8eb5c
	.xword	0x373715ee80e01b0f
	.xword	0x36e70da74deeeb62
	.xword	0xdc0ba93280bc7724
	.xword	0xefdcd3af03401cae
	.xword	0xabe4e1e28c8380e0
	.xword	0x0b26ca47bf3847b7
	.xword	0xac86dbe51c1f207d
	.xword	0xf1c359f30f521ae0
	.xword	0x650dfb88f56937e3
	.xword	0xbcdf07d26f11c572
	.xword	0x514477a5a291690a
	.xword	0x6bc0d3a0fe86549e
	.xword	0x0e0344b4c25ebb41
	.xword	0xfb64ae503c731b56
	.xword	0x3cf7eccd38a646be
	.xword	0x6e4d0b16ce7ea50d
	.xword	0x9ffbd3c925132055
	.xword	0x34ba3eee76bf9e93
	.xword	0x01f0d9b4a3f5050b
	.xword	0x467ffa9b47e2015a
	.xword	0x2efde2431d0d2b96
	.xword	0x82560f97b72ec491
	.xword	0x8c517e96743ddbfb
	.xword	0xf303338cccd5c622
	.xword	0x2f741561d06f1ea0
	.xword	0xfb4aaf29ce534b80
	.xword	0x8ba5d34b1c962403
	.xword	0x70fe58c0dfc1080c
	.xword	0x9f76d0e27a6255d6
	.xword	0x4eda0ea7ee0031c4
	.xword	0x5e44928426c0dc05
	.xword	0x24a55269c83b4801
	.xword	0xc7800755f6459b42
	.xword	0xcd6a10a01567695a
	.align 0x8000
	.data
data_start_3:

	.xword	0x09a7f00de212eafe
	.xword	0xfb2343bdbfef3963
	.xword	0x62ba37812aa4430e
	.xword	0x6385d76154bffe9d
	.xword	0x2a2dcd7393bdffd6
	.xword	0x7b88b5c970b004b1
	.xword	0x90d1939349178015
	.xword	0xd2476221356d28b0
	.xword	0x1b35c05d32343782
	.xword	0x600c746304b8e75b
	.xword	0x4e12f5c205fc818d
	.xword	0x80c7460548795cbe
	.xword	0xa68cfd39ae54c0e2
	.xword	0x321ad64739a573bd
	.xword	0xe358b760db62b403
	.xword	0xac40583018d103b1
	.xword	0xfacf6aa57cbaf379
	.xword	0x1098bd1b583179f3
	.xword	0x217791cc6a5c624a
	.xword	0x6414ac28671d1b56
	.xword	0x78ec5661b08b82fd
	.xword	0x1b4b9587ca74e1a3
	.xword	0xf0479586bb1dfcae
	.xword	0x0a895a49e2ee2dfc
	.xword	0xa3f29f4177e646b4
	.xword	0xb52020103caeb6e2
	.xword	0x439a5d430ed193f3
	.xword	0xd160096390163e7c
	.xword	0xc3d3081b7e16b5d9
	.xword	0x4c12c9ef3d1f098d
	.xword	0xf1e21dfe7a155c31
	.xword	0x02e930088e7ffb64
	.xword	0xad2c1f0dd392d555
	.xword	0x575e9adee4e4deb7
	.xword	0x6e5324fe4f1dbd2a
	.xword	0xc73d0a9aa5ed399e
	.xword	0x52e8ced33d983eb1
	.xword	0xaa034969540be377
	.xword	0xbdfd6b319a5c1f6e
	.xword	0x734028c8dc119d6d
	.xword	0x4bf8cc9e6297e4cf
	.xword	0xc22e390b21a86d29
	.xword	0x0d9df09849371baf
	.xword	0xb0840f35c512c4e6
	.xword	0xd62224a21dd68118
	.xword	0xd1cf444f4c34819a
	.xword	0x9d6f9b4e562b89c0
	.xword	0xb5764a551a96b9e2
	.xword	0x0599b4102230bd2c
	.xword	0x27e2779eb4d97f90
	.xword	0x8efb7f2b178b1571
	.xword	0x262659b182659ad5
	.xword	0xdb9ff64ea852d887
	.xword	0xe715b8e722d93335
	.xword	0x4aa933fdb3997691
	.xword	0x78ea68079c63a99d
	.xword	0xc5bd5cbde07f4a54
	.xword	0x736d975537bee0ad
	.xword	0x648266a912067bb4
	.xword	0x39520a41706d6735
	.xword	0xb27e10d24a75605c
	.xword	0x25932ff9bab5644a
	.xword	0xe96eb823e9c9976d
	.xword	0x82a088a9bfa61106
	.xword	0xa099734209104d09
	.xword	0x560655b29b83673b
	.xword	0xc68b517142866cb1
	.xword	0x2ffdceb0e52c8111
	.xword	0x5ad7cbf3f93e0ab9
	.xword	0x4f68be124128a488
	.xword	0x84c5c27147855a1f
	.xword	0xb23456c412d03cb3
	.xword	0x1fd64424e308beae
	.xword	0x032136451ebd9e67
	.xword	0x69e97d0e5c33ed06
	.xword	0x264e0b39397f8658
	.xword	0x3fe1c1059d79a56b
	.xword	0x2ab1a96fd5c41c66
	.xword	0x32c8582438d7c4fe
	.xword	0x9a373c715ed8bc5d
	.xword	0xc7aeb695694eb2c6
	.xword	0x19c264df657687ed
	.xword	0x4c5d38ab6757c0b7
	.xword	0x3ad85ffb74db09f4
	.xword	0xd60db046d9b7e7f3
	.xword	0x8454d30d5c432cf6
	.xword	0x9dc26fb2e0e22b08
	.xword	0xb4a2b82fc4ba462e
	.xword	0x424da4a917a79792
	.xword	0x5fa5a532f3588332
	.xword	0xe712022d825a3d56
	.xword	0xd217c850419b2549
	.xword	0x2c5b81232d50e9eb
	.xword	0x0dc69f3f6c35d398
	.xword	0xfc8b1b4342af437a
	.xword	0xdc26dc6e2e2a3717
	.xword	0xdaf157c49ed6b519
	.xword	0x0ccfadcab2cb32dd
	.xword	0xc14c668259704da6
	.xword	0xe44de3a8c997b928
	.xword	0xf623a0dcb85b8254
	.xword	0x1859927aa855d425
	.xword	0xc90d756f145989da
	.xword	0x597725a133970d64
	.xword	0x06ce153e18b48724
	.xword	0x4f46d8b5e960b6c0
	.xword	0xe883ead73ff4c2b7
	.xword	0x0c6e73721cccb608
	.xword	0x7ee4105cb3f03a00
	.xword	0x79d127bbfb966848
	.xword	0x31a5f48330bde769
	.xword	0x703be0847ab96d99
	.xword	0x685dd30747e74eea
	.xword	0x9f45a24b8086aa86
	.xword	0xa276d56b4a7afdd1
	.xword	0x962c13e649f856cb
	.xword	0xaa32c53345c4f9b6
	.xword	0xe0c36adeea1a6a54
	.xword	0x102c8e58096d8729
	.xword	0x12a55fc3163e6c76
	.xword	0x967e77e758a9bb12
	.xword	0x96134f60df1a384c
	.xword	0x3e93c68347b9fba9
	.xword	0x96a994bf2ec0f3e7
	.xword	0x209ac0b26249a5b2
	.xword	0xfcc8beac7c48ff76
	.xword	0x0e2fc61315539263
	.xword	0xb55c387e53d96a2a
	.xword	0x1b849b8a2b22b8db
	.xword	0xbce2c15879817134
	.xword	0x6d9a2c5cde3ecaaf
	.xword	0xe0a33f3d0fa20089
	.xword	0x9a6d66f8fdffe1d4
	.xword	0x84d352695ad0df9f
	.xword	0x0def8a52c3b26dce
	.xword	0xd437591462304c5d
	.xword	0x1dac75d7d89eac68
	.xword	0x34583eb5d70f9e95
	.xword	0x9d1aed93b645eba9
	.xword	0x59787ab0c49e5b71
	.xword	0x13b1ed26d15d0cc2
	.xword	0xa0eb069434e49581
	.xword	0x4b98bedc7b5ed177
	.xword	0x8bf68393df5338b3
	.xword	0x1808234da966df52
	.xword	0xf99ee1794d504243
	.xword	0xc81bdf36fe3fc197
	.xword	0xfaf705a03c313a18
	.xword	0x185cb601f74efc96
	.xword	0x95fd4936f2f58afd
	.xword	0x5bdca7f2f761aed8
	.xword	0xb74e8e27caf06d03
	.xword	0xa3e9125bfdcebaf7
	.xword	0x4d4748610e92100c
	.xword	0x31c1a9a8129ce8a9
	.xword	0x2fcd51ee43dc2f59
	.xword	0xe091a8a2252468df
	.xword	0xcb80687d78ac8dfd
	.xword	0x74f8552d287bed4c
	.xword	0x78bbbed620c13dbb
	.xword	0x23e17dd45d3f5165
	.xword	0xfc3c78f6165b78e3
	.xword	0x8ea8e814ec0b299f
	.xword	0xdcb4c4e5c99ead8e
	.xword	0x697efcd955660d45
	.xword	0x0ed8314c4b0a920e
	.xword	0x2cafb70baa71b944
	.xword	0x931f950a9b48e737
	.xword	0x9b3b83109a8a539e
	.xword	0x407e906cb7f4e8ce
	.xword	0x29f3276476195f78
	.xword	0x8e7845c258f4b569
	.xword	0x11c645c57c454080
	.xword	0x90f52f80de22f392
	.xword	0x5b6fc0b2d6e43b34
	.xword	0xf68bbaf93d12bb87
	.xword	0xe55a1777a609eff5
	.xword	0xab58d0f223b45805
	.xword	0x8ba28be17a5567e5
	.xword	0x34755b892de2cf6f
	.xword	0xd1d83c65541148ad
	.xword	0xf014b355a8034e25
	.xword	0x18d0f0cac95c8692
	.xword	0xd425d5a4aa8d0e9d
	.xword	0x0767c9dd9cd7f999
	.xword	0x27f522095a53ded0
	.xword	0x43875e378f2c58da
	.xword	0xe295679ef0080bee
	.xword	0xbaf4a85fac46fc2a
	.xword	0xb13c26e707320356
	.xword	0x1876dd193d34e6fe
	.xword	0x810c75b416fffc69
	.xword	0xcd0a4b79552ffc37
	.xword	0x97142c6b8dd9d892
	.xword	0x0406db78af173293
	.xword	0xe89a614629443cc4
	.xword	0xd9895f35ef496ea5
	.xword	0x1f1f1db9d3f1cd65
	.xword	0xb090f8d3dc14f1b2
	.xword	0x315842b157dbe841
	.xword	0xe5157e5b70d147c2
	.xword	0x9bdf6649c1506245
	.xword	0xf0e113ecbca482b3
	.xword	0x86db392d2e36ef74
	.xword	0xe520d2a5ed1f7742
	.xword	0xd1b06a237db6766e
	.xword	0xdb959f68f56391ee
	.xword	0x374f3c25c2285dfb
	.xword	0x95f5322e7b7c08f5
	.xword	0x456ae0c9c5c7782e
	.xword	0x23a2c678885ec7be
	.xword	0xfcdc7eba7e8ef742
	.xword	0xd0d4d950e1fa2b97
	.xword	0x432d05aa448db687
	.xword	0xdd5d3e200dcd0388
	.xword	0x69ccc5af2aa168b0
	.xword	0x2e2701c83c1a876f
	.xword	0x0d6fee51fa588a16
	.xword	0x928fc500b8350030
	.xword	0x1c00a25ca8f063a5
	.xword	0x28c43847566dfa62
	.xword	0x3cef013bf067867f
	.xword	0xb9a11b12258b3298
	.xword	0x8720af0414efaac2
	.xword	0x008ad5ba2cd217f4
	.xword	0x6d9945ae2c8d49c2
	.xword	0x4db0502dafaeee61
	.xword	0x89f07f785924ff8f
	.xword	0x1ea74bd02ce1ce7f
	.xword	0xdf11d405ab757aba
	.xword	0x444ab7bc1f7c1684
	.xword	0x30a5149cd979a8ff
	.xword	0xd43516ed5f2e2e7b
	.xword	0x0f68ea54c978113d
	.xword	0xfeaf9c61da281225
	.xword	0x1d5efaa774f18413
	.xword	0x9d1b171f9103173f
	.xword	0xc3111bf251ce4a99
	.xword	0x1ba63787d786822b
	.xword	0xaa879c98f8b643f6
	.xword	0x89ed1df2f2039365
	.xword	0x3651b299191c7029
	.xword	0x536065212e193371
	.xword	0xc90aa235a929e855
	.xword	0xf5efef4f64a1fd15
	.xword	0x1c48ec9de6959235
	.xword	0x74aa3c9305e497c4
	.xword	0x4862effa2c8db8b1
	.xword	0xadbcb26db84dc004
	.xword	0xc36ad67f57a46aef
	.xword	0xf4e5dffe9b10c651
	.xword	0xabcc451007563a2a
	.xword	0xd61e2e3e7fdbb6ce
	.xword	0x4fee7256c7927eed
	.xword	0xc662ea1028f03821
	.xword	0x9276dda6ed3440ac
	.align 0x10000
	.data
data_start_4:

	.xword	0x7b1a0378fcc66a9b
	.xword	0xbfdb12ae2a03494f
	.xword	0xe6445d87c963fa04
	.xword	0xc74f31f34ee3779b
	.xword	0xb66f20dcb18310c9
	.xword	0x8ecbe5aaeb7ec84d
	.xword	0xcd65d2b5e82e5b08
	.xword	0xff4adea038eb13c6
	.xword	0x4bb6799498734e10
	.xword	0xe52f4f1b42d4b2f0
	.xword	0x8684bc5fbaf72ddd
	.xword	0x7bc8faa0d1c058f6
	.xword	0x632ab82495fba92c
	.xword	0x264faeb65a2dcb25
	.xword	0xe8ac1eeb17e93a26
	.xword	0xd47dd80ea425d9c0
	.xword	0x1bc4bad605b93834
	.xword	0xaf9e202b84309388
	.xword	0x3327eb4655bd7448
	.xword	0x00e1174b4a792756
	.xword	0xf43c87e7d3142918
	.xword	0x9e2b8db7ebe89e42
	.xword	0x3a3cc8eabbe3e570
	.xword	0x8b59cd2975b6e37d
	.xword	0xbbc664fb27aa9c98
	.xword	0x6e2b2099dc8e3ca4
	.xword	0xe8b06436fa75d63c
	.xword	0x0557c00f74f03c3f
	.xword	0xf605b85352fbbb52
	.xword	0x42f4e7fdf16689de
	.xword	0xb2ea577532000870
	.xword	0x6e6c4b4ef5bc1aff
	.xword	0x2319f44a37820626
	.xword	0xcb08a63f1a0de5d5
	.xword	0xb7a4881ccc3a974b
	.xword	0x33470e9e0501e7cb
	.xword	0xa8983d621b9e501d
	.xword	0x5bd7f697d3bfbec7
	.xword	0xb789a426225740e2
	.xword	0x84c5916dda23305d
	.xword	0x8972500fd13c4465
	.xword	0x04e718ebbb680d13
	.xword	0xe629dceba214ee60
	.xword	0xbcc45ffd4363a589
	.xword	0x9d3fb458e1d6ff50
	.xword	0x12aa166cf0402a79
	.xword	0xac6e956e202dcbbf
	.xword	0x79c8ba76b9d51c72
	.xword	0xdf83fc5baa7f158c
	.xword	0xfbe115c251c66bf0
	.xword	0x26e597308a5a7a92
	.xword	0xc67ee10ce77975e5
	.xword	0x4768ccf907779e50
	.xword	0xba840ac00cee707a
	.xword	0x38e9ef0c8f4ce5a8
	.xword	0x4a465ab66f37e736
	.xword	0xb459503ea5c6a090
	.xword	0xd318f470f67fd691
	.xword	0x91f95d57951d0d9f
	.xword	0x97a4db6ea4e30063
	.xword	0x3e4c2ab05db703bf
	.xword	0x64952b6b922d556c
	.xword	0x3bced6da4070b7b6
	.xword	0xfe152e968ba8ea13
	.xword	0x0f8f520e2c9d86d6
	.xword	0xe8a12c3269fde9e5
	.xword	0xac659039ac92862a
	.xword	0xed1bb9215359f514
	.xword	0x726daae40e052b99
	.xword	0x2ee8056efe210916
	.xword	0x4a8547b77564eec1
	.xword	0xd8811a7d4e29caa5
	.xword	0x8d0e42cef8baba47
	.xword	0x9dbe5b36990910a1
	.xword	0xdb3c854f809e8acb
	.xword	0xa13329c92578ff67
	.xword	0x1e0b7bd03fec8121
	.xword	0x480f69f78d9fca4f
	.xword	0x1a4750873564bb24
	.xword	0x53c88447847413aa
	.xword	0x1f71ceea6e8bc42e
	.xword	0xe9d4a6797fe32762
	.xword	0x741dcea901198cc0
	.xword	0x04f55470255166e9
	.xword	0x03a2777cc946d356
	.xword	0x904f0d07bd3728a7
	.xword	0x0f64910f19733ab7
	.xword	0x7a324af386e14bf9
	.xword	0xc851a675c564d2a7
	.xword	0x8def5c1ff5ff8d74
	.xword	0xc13d3067c63a0e79
	.xword	0x47628c96b85f81b4
	.xword	0x06b553eae4f12565
	.xword	0xb4f21dd8018cfa33
	.xword	0x35b3d3913488e946
	.xword	0x275cb82f8064c20a
	.xword	0xab1c5f025da6e65f
	.xword	0x94bd01ce3e9b6fb8
	.xword	0x1bceb8904e629cc1
	.xword	0x156f7611277bfa7c
	.xword	0x19cea29df070c1d7
	.xword	0x7ddc200d8e35e11c
	.xword	0xa9f9d7d797cc72bc
	.xword	0xdf583439a2f40038
	.xword	0x689f20a14592f00c
	.xword	0x27b820837dbed39e
	.xword	0xd1fa722106dceaa2
	.xword	0xcbfff53c5f110d75
	.xword	0x53e8c256db8061de
	.xword	0x904db3c0cadc9a0e
	.xword	0x13b1738a74bdac5d
	.xword	0x703dd57f23038265
	.xword	0xeb13d3a66d2dd51a
	.xword	0xf2d027040767bbcf
	.xword	0x25c28678d942c283
	.xword	0xd1bc202602bd6ec8
	.xword	0x9cc7194698382b16
	.xword	0x283345e0fa5552bb
	.xword	0x1153e0db52453b03
	.xword	0xc266d8426475da5f
	.xword	0x45979e226628fdce
	.xword	0xa36adcc8ee5a4fd6
	.xword	0x7b5e0fc9a4b13646
	.xword	0xf78457b81a938ee7
	.xword	0xb62de2ed99a83e09
	.xword	0x6f241736ee370eb6
	.xword	0x36f226e0db5cc646
	.xword	0x718cb4baaf431236
	.xword	0x3f1c1d95e377e0e7
	.xword	0x77d31a98e13f8d69
	.xword	0xa1d5fe1dd08e688c
	.xword	0xad257cc69d79b3be
	.xword	0x996b99433760ecae
	.xword	0xd77b034a6eecefb7
	.xword	0xb1638ee8bfb7b19c
	.xword	0xf814efa38efcf9bd
	.xword	0xe6c50d21f3840eaf
	.xword	0x1fcaf558e35a5218
	.xword	0xe4354d8da6132b31
	.xword	0x6859fe17626c510f
	.xword	0x869c1f8486ab62b5
	.xword	0xe12daa40a2defcf5
	.xword	0x61810297862a2509
	.xword	0x003765faf72a3e9c
	.xword	0x96a81b607b24b933
	.xword	0x08fc8dbb274d4da9
	.xword	0xf235aa824bce0173
	.xword	0x8357a23d815ffdb4
	.xword	0xefc9344d094ffe88
	.xword	0xbdf089dd5d1334d8
	.xword	0x52213bb50b0f1bfa
	.xword	0x5d6d97acf27c06e4
	.xword	0x04fb5a96f3e13216
	.xword	0xf017dee30dc43468
	.xword	0x74a732f8e9c42a7b
	.xword	0xdfbbee4805181a38
	.xword	0xeaf4477108561972
	.xword	0x8b07544f94f9865b
	.xword	0x9857dc986439a13c
	.xword	0x7cf0e0eb9ecaceaa
	.xword	0x998c2d436cdeac9e
	.xword	0x460486303c0011d0
	.xword	0xb578e72afa215d72
	.xword	0x6ed75f3a7972de04
	.xword	0x16e4aa831e8abc19
	.xword	0x4e4532277cec3580
	.xword	0x47360606b69f3c14
	.xword	0x52bf12248a465d43
	.xword	0x5b83b9a8ae790167
	.xword	0x5fb5b05f20dc98d0
	.xword	0xdf4db4691412c444
	.xword	0xfb0f68fa8b126682
	.xword	0xacd6efcabf68111f
	.xword	0x78dcc63fcd78185d
	.xword	0x9a2798a4626f1c15
	.xword	0x5d4cf59c9379c692
	.xword	0x0dd95edb17a77ca6
	.xword	0x8b667b0972b751e0
	.xword	0x1386890106e47b83
	.xword	0xabdbd19609e44209
	.xword	0xfd1aa05b38617ab8
	.xword	0x9c9baf660de7c11c
	.xword	0x785a6d55c653d803
	.xword	0xd728b982b179074f
	.xword	0xac0bd04cdc46363a
	.xword	0x28012e19c9f679ad
	.xword	0x4c2dbec65ab235da
	.xword	0xcdea41f5b4ea3e86
	.xword	0xed3759fa7e225d4d
	.xword	0x196329ebddf17fd9
	.xword	0x1120b69b1d3fb64c
	.xword	0x5e68f12e2fbb397a
	.xword	0x6d12ffb40c34636b
	.xword	0x86e656e324453a3e
	.xword	0x6dcff4211fded28b
	.xword	0xe82273e8a07dde6a
	.xword	0xf391d62d73125f3b
	.xword	0xa95e2270ca880baf
	.xword	0x849eaeafb91b2cf3
	.xword	0xafe52ffb7d8a43ae
	.xword	0x275a42a5e8f9eecb
	.xword	0x6002318649c4dbb3
	.xword	0xefd288c4870a1b1e
	.xword	0x5364ade7e1c77b24
	.xword	0xc246a18531a5a38f
	.xword	0x2e3ecd3b3c4f0e18
	.xword	0xf759b93f89645e8f
	.xword	0x185a14f82de2cd62
	.xword	0x43a74c66b9c572fb
	.xword	0x166cb533174a7658
	.xword	0x6c8839f1d4bfb484
	.xword	0x4994835eeeb9674a
	.xword	0x1022120e8b94757e
	.xword	0x30e6370f30709406
	.xword	0x6bb536aed3ce012f
	.xword	0x28427d4a4e6a7fa2
	.xword	0xfdbacb332f5a6d2d
	.xword	0xd6b09c8f4c9248e3
	.xword	0x743cf36c9be3e705
	.xword	0x86cb02ca872b7974
	.xword	0x13fbff14d7aac63c
	.xword	0x32725156b970b776
	.xword	0x358d898f2c9dcc38
	.xword	0x6173d214389b9c67
	.xword	0xe054374d4dac8057
	.xword	0xdb5da489e664629d
	.xword	0x6c6f0c0fb1850d5e
	.xword	0xa01db176a715e01b
	.xword	0x29a8f81f8c927c4e
	.xword	0x40c5f94f31c4a3ab
	.xword	0xccd094a4caae3789
	.xword	0x75b6a22da49322c0
	.xword	0x1e2e1c9895d5b773
	.xword	0xcd7bcbf99dbd8ac1
	.xword	0xde9afd5f7a567374
	.xword	0xc9ed60e2abc684a3
	.xword	0x3bcf90ad3cc71155
	.xword	0xfdd7d8ef488901fa
	.xword	0xdb29b1fa5c3312c2
	.xword	0xb96f070f84bb7fa8
	.xword	0x502639fb9864207f
	.xword	0x18acd9724d443609
	.xword	0x86450bc4e1a1c32e
	.xword	0xebf264a5a466e79a
	.xword	0x3643aaed3b8a55ae
	.xword	0x5b785336cb5dd667
	.xword	0xfebf16b3c73a4386
	.xword	0xcde3d4eb79382bab
	.xword	0x5f1c980948f7757f
	.xword	0x6d9b9ab04838fba3
	.xword	0xd4572a79591181da
	.xword	0x2cb1f3e186333abb
	.xword	0x27431aa17c83c342
	.xword	0xa567314c5d05c9f0
	.xword	0xc32479857d18baaf
	.xword	0x09da0f8add573f6c
	.align 0x20000
	.data
data_start_5:

	.xword	0x9202a0a69d62d96d
	.xword	0x116c74fdfa94cb54
	.xword	0x3f1aea073f62f933
	.xword	0xc6204b49a52d0113
	.xword	0x5efca58b2670294a
	.xword	0x623ceb125f9f664c
	.xword	0xd52c067ac773103f
	.xword	0x5e0752c659fb3428
	.xword	0x588415ecefac7d8a
	.xword	0x708e1351c21489dc
	.xword	0x3f89c5ee693af387
	.xword	0xf6ba6ad778d6d878
	.xword	0x8e226af3ad61b7bd
	.xword	0xf76b70bbb8bc0461
	.xword	0xc502d0647c6c1cca
	.xword	0xcdfd0adfa1ec376e
	.xword	0xc15e64b8aafe275c
	.xword	0x3a3e180fdd7dc8c7
	.xword	0xf06bee5e59619ef7
	.xword	0x8edbd58763362e45
	.xword	0x38aaf89421807a79
	.xword	0xa455cefaf3153616
	.xword	0x2af7e9c564b52129
	.xword	0xba6c4125720d24e3
	.xword	0xbee83c5266d8c2f7
	.xword	0x1c7100b7d610ae90
	.xword	0xf7e92a4c888669ce
	.xword	0x09845228398e4843
	.xword	0x2b1a4a1aed27fd1d
	.xword	0x048d7e212ba98b2d
	.xword	0xab208d454c95872b
	.xword	0x456d54d0a1bfc5de
	.xword	0x294d3a6f6604831d
	.xword	0x0995a513db0e67ae
	.xword	0x68365ecab0fae14f
	.xword	0x1c09b8e95a467557
	.xword	0x4e86651c3d51ed82
	.xword	0x87e61a05faf93745
	.xword	0x7ecc0bad036a8dcd
	.xword	0xebf63158175dfa1e
	.xword	0x46426a2f3f27ff97
	.xword	0xaf20d03c02fd21cf
	.xword	0x42c5edaee1a75b42
	.xword	0x4a4b52df3e95515b
	.xword	0x6f4f9a59cd787252
	.xword	0x118f259feb16f40a
	.xword	0xb0d922610814fb70
	.xword	0xf6c5ad2106943dab
	.xword	0x0e7790a8b71c51dc
	.xword	0xf9bc84c5273acd18
	.xword	0xbc17b7f0e3a586cb
	.xword	0x819a08f92e9dc4b6
	.xword	0x9ce1f694817e38a8
	.xword	0x37dffbeca0bb344d
	.xword	0x752f506e8cd00e83
	.xword	0x1b7a6a39764e5be2
	.xword	0x79b54f0fe24f9e6e
	.xword	0xcd3856851c3f6a3f
	.xword	0x7a9957b043126460
	.xword	0x2b8ae321cf36b116
	.xword	0x9b30eccf7cd54f60
	.xword	0xd5cac731d0916c38
	.xword	0x7f5ae82dcec0d252
	.xword	0x2354f700fa3de58b
	.xword	0x4cef6f71788a6271
	.xword	0x31133b2b67ba764c
	.xword	0x26c328a2d021a00b
	.xword	0x10796cce7d704719
	.xword	0xee632bd0afc78ed9
	.xword	0xd49f3a4b817eb425
	.xword	0x392cac76b111347a
	.xword	0xb95a37a64b47b403
	.xword	0x033a17393e6b191a
	.xword	0x0d982eeb3c01f7f7
	.xword	0x3ee2afdbb702e606
	.xword	0x3036d4e8bb33ba62
	.xword	0x387464e1bee1c452
	.xword	0x16b153bc25b66db8
	.xword	0xa186103fd420070c
	.xword	0x5ca81adcfc919bb4
	.xword	0x3a292c519bbbd8e5
	.xword	0x9e94337522de6d58
	.xword	0xe1bc92c59159d3dd
	.xword	0xbd8583bf0b9b7a2b
	.xword	0x0f9e6b1e12a3beb9
	.xword	0xfe2bcf350db69d7a
	.xword	0x741a66862f177d59
	.xword	0xe3fcf944704d43bf
	.xword	0x0fc1caa725f6562d
	.xword	0x13875168a353c732
	.xword	0xd075f14f362bc819
	.xword	0x361e9363c85d114f
	.xword	0x800a0bbb78e903ed
	.xword	0xde5cfe3010d28d09
	.xword	0xad385bb719db8c7a
	.xword	0xfb15cbf62f19f034
	.xword	0x6d5abdb92f46071e
	.xword	0x4c718c250497ba3e
	.xword	0x7ba7bc6e7e84958b
	.xword	0x5e54a97a326c4f0e
	.xword	0xce9565b9f8d6a52c
	.xword	0x636f36cbe0badc40
	.xword	0xd7045bd5b6a8173d
	.xword	0xd83dc3e4f3be7d8a
	.xword	0x684327786a3a28c9
	.xword	0x58dc5cfc53ad2447
	.xword	0x0ff57a5565c1c333
	.xword	0x4b721327ebfafed0
	.xword	0x2ad304385531a526
	.xword	0xb7c1c6f0bf287564
	.xword	0xa649ff46a36944ef
	.xword	0xc17feead6c4cf478
	.xword	0xbcce34d0e6004103
	.xword	0x47f4bc65ea328cbd
	.xword	0xa7f74a9b4a6ad933
	.xword	0xd1e60bbd30700aeb
	.xword	0x26cf4d7b3d2de546
	.xword	0xd411af0f59f1a318
	.xword	0xbc0732314eb93e82
	.xword	0xb9ebfd0a05c87798
	.xword	0xfa62eb6e79bbc346
	.xword	0x01aed428c976c112
	.xword	0x614ca1a345e2f12d
	.xword	0x8e2d142d9d381ff0
	.xword	0x1aa6974503f21619
	.xword	0x7c4bede292586059
	.xword	0x0876399e5321baba
	.xword	0xe6ae166fa9af2f8c
	.xword	0xb8cad979138bdd23
	.xword	0x3992522913aef6e3
	.xword	0x3a7df1d65a0a8426
	.xword	0x5012fefc3890a865
	.xword	0x8a0558725231070d
	.xword	0x59ca297ee21611ec
	.xword	0xd2c2fd68e1b2aeac
	.xword	0xf27156c88248c4de
	.xword	0x184576485bdb8311
	.xword	0x04d3242d41d2edd1
	.xword	0xa55d2cc012880e15
	.xword	0x6c081fcdb30254df
	.xword	0x85de9a7d08a97eaf
	.xword	0x74f9df4c24d2efa0
	.xword	0xaa21bf9e5fa60a0d
	.xword	0x6846e32e1d055218
	.xword	0x993ffb890161c17e
	.xword	0xc7cbbf856854678b
	.xword	0xda6474e61a8ade86
	.xword	0xdf1044ec37142012
	.xword	0x0a86e5fd8e07316f
	.xword	0x9156c1058b2a9c12
	.xword	0xcf53fface6715b62
	.xword	0x9f0929f3d115fd13
	.xword	0xa6160e0861b5de29
	.xword	0x8f1cc85b2b154b0b
	.xword	0x969c1755a387213c
	.xword	0x3724de6ad239ac9c
	.xword	0xda5883eae54f3791
	.xword	0x83f251e417a1ba76
	.xword	0x0d084da8f685c6c8
	.xword	0x12dfed939aec4c97
	.xword	0x614a2ae26e20b8fe
	.xword	0xc96bdd6ac4f802b3
	.xword	0xa4224a48e84bae07
	.xword	0x30d04378fbc8b853
	.xword	0xaabee8ced55f7c46
	.xword	0x0683452a182cd657
	.xword	0x62cf597817bc1ac6
	.xword	0x1b91f94ccc3730fe
	.xword	0xcd2f341a98843c4f
	.xword	0xc3001fb876cef8b3
	.xword	0xc65d5e382b00f02d
	.xword	0x6956cf2106664440
	.xword	0xf328332fa56f7e1c
	.xword	0xcc3f5b609068f386
	.xword	0x2ab7e9cec68a9767
	.xword	0x81c291f90e5de4bb
	.xword	0x43e4d01948e2f704
	.xword	0x8aa6b843d6f6f557
	.xword	0x61c9c26c628458b7
	.xword	0x6bdaade22e1be8a5
	.xword	0x5adf5d6dfe95a833
	.xword	0x50499ef48683d3c9
	.xword	0xec0beac144c9d9ed
	.xword	0xbae5cf22adde0b5b
	.xword	0xfc277bcb6bbc04b5
	.xword	0x098511e9150219cc
	.xword	0x80f567e9b7a4d153
	.xword	0xdf13161ee59078d9
	.xword	0xfd4778a7cbb6f6df
	.xword	0x5a2846ab3b2de8d8
	.xword	0x3994812425dfb702
	.xword	0x1da9a29be2956dae
	.xword	0xb19ce9d317afc382
	.xword	0xb2be01bacecd903b
	.xword	0x50bb593c407e11f4
	.xword	0x3439d3fab180c0b4
	.xword	0x6c2ea082ce1ed25f
	.xword	0xafa71ef1279fd666
	.xword	0xa08202b1604e4e18
	.xword	0xcacb931edd543920
	.xword	0x50a9044ae1e982b8
	.xword	0x17584c4c16dc5bd2
	.xword	0x31169f6e211a8f87
	.xword	0x40e2e9b858ed20f2
	.xword	0x5f1eba7e29cc7bb7
	.xword	0x99c70a805729580b
	.xword	0x4cefb2a8c74a8204
	.xword	0x22debddd6f9b43e3
	.xword	0x2dd3a82cedc69bab
	.xword	0xfcb5e3c56cb77ada
	.xword	0x8647a899ea1a5037
	.xword	0x5571ccda748bdcd8
	.xword	0x5e334e62d606d8f9
	.xword	0x14a94ddd11972a1a
	.xword	0x50c497646c0d3722
	.xword	0x039f397a6defcf75
	.xword	0xbf8a6503bbe11a64
	.xword	0xbad6bc7449839dbd
	.xword	0x09a4bb9cb8529759
	.xword	0xd7ab19dd96bb1354
	.xword	0x027bb0ab133cee77
	.xword	0x0f8b1999310d56d5
	.xword	0xa46d5ca79de6568f
	.xword	0xa02e950a92ffbf14
	.xword	0x65f14b2f8546217b
	.xword	0x3d44657c3191ee30
	.xword	0x7d58d83cd041d6d5
	.xword	0x43b26ab303dc94d7
	.xword	0xb3e1f84573660966
	.xword	0x4daf5106a309870c
	.xword	0x7d27c38af9401fd9
	.xword	0x17d29213aa78fd4b
	.xword	0x8a5092142c3755a7
	.xword	0x67edb26df8c0a41d
	.xword	0x62585466b9447e13
	.xword	0x0c752437c41ed9ed
	.xword	0xd0ba3b1dee46a1e6
	.xword	0xd278bc2e3c246253
	.xword	0xd017a0e2f7cab6ec
	.xword	0x00fafd4fcaa2a033
	.xword	0x4dfd519d83a5e27e
	.xword	0x20b32a5d5a4c18ad
	.xword	0x9c25fbcf51975eb4
	.xword	0x0cd97f806fdac145
	.xword	0x025009d101604420
	.xword	0xf90268980e66206c
	.xword	0x136d027a6049accd
	.xword	0xd3f0e936d6fcff7a
	.xword	0x7538b3f1cbc07931
	.xword	0xadd37ece6f610027
	.xword	0x1a8c77da686b1530
	.xword	0x604b41e45b753a48
	.xword	0xd36e2e364f901604
	.xword	0xfa2a5564055ed1c7
	.xword	0x2d1ea72232ed2c75
	.xword	0xd235056fe4611c26
	.align 0x40000
	.data
data_start_6:

	.xword	0xcf6ce8e5ddfa5b07
	.xword	0xb33538db6cfa7af7
	.xword	0x87087b4dc2596943
	.xword	0xc536fac20722c5bb
	.xword	0xab87d5e911f0e24a
	.xword	0x5ec1e401ab5e7775
	.xword	0x106ce7acda88b23d
	.xword	0xb9a39e78236a530f
	.xword	0xe86a8d630918c3b3
	.xword	0x7853116c0f710d3b
	.xword	0x5d47da243474e7d6
	.xword	0x09c3ac576c8a604c
	.xword	0x5ece31a0539130ca
	.xword	0xc6af0698f022bdf1
	.xword	0x28d31c14a981b7e3
	.xword	0x38a2bfbed0b61d1f
	.xword	0xede3cec0d5f87b5b
	.xword	0x20ec4af80e66f1c2
	.xword	0x7189a760270a618a
	.xword	0x144c9a9f0bf294be
	.xword	0xe4c3743a3b3e2312
	.xword	0xb22a8a39f624a8e4
	.xword	0xb426d14e701b5558
	.xword	0x5fa9f305ffd6d6f4
	.xword	0xb24574cd3c2799e5
	.xword	0x32b1066197a002e7
	.xword	0x10e6d04bdf1e9ec0
	.xword	0xb8cf2325fdd29b6a
	.xword	0x759f09b7a3b8eef2
	.xword	0x63b8cd27dbb6d3fc
	.xword	0xd7aec00cac551b33
	.xword	0x6287a32778f6b352
	.xword	0xe12695c1eb8a4901
	.xword	0xa6defbf9a898aa44
	.xword	0xf0a95632e7e0d267
	.xword	0x23350b21b5e153ef
	.xword	0xea4f9d235a67d63b
	.xword	0x95c60400c2463347
	.xword	0x0aa35c49c9e291aa
	.xword	0x1f3b7dace6554c44
	.xword	0xd673fbedea2a06ea
	.xword	0x7f449785d8a4effb
	.xword	0xdad73d6f54a9e0b4
	.xword	0xfa2e2bf3a26a105d
	.xword	0xaf2c7361f674e447
	.xword	0xb031e59795d2b5e2
	.xword	0x8d82dd89c68dd64a
	.xword	0x4fc1f87b05f07e20
	.xword	0x5aa1dc3bff432ca1
	.xword	0x5c24a73122b3e6a1
	.xword	0xad8f781d9d2f1ff1
	.xword	0x252dbd5406fda00d
	.xword	0x36b2a8c4df5e079e
	.xword	0x865a4ce1cae83b1d
	.xword	0x4a0eee36208b9b8b
	.xword	0x2c9a351ad6e9853f
	.xword	0x30c7a2e82d8c3687
	.xword	0xc4642673448ccd2b
	.xword	0x0e746d05fe0aea93
	.xword	0xd00653855e9dd6e7
	.xword	0x600aff9a85508dea
	.xword	0x4eb31b80cae8ab9d
	.xword	0x09683252efb26a98
	.xword	0x5f3d01576264e422
	.xword	0x1c657d3ea921a39b
	.xword	0x973c91575ed5ff44
	.xword	0xe599ad63f00da487
	.xword	0xf8eedca960fd11cf
	.xword	0x18dd15cd1cd69711
	.xword	0xda13c1ab550e4442
	.xword	0x70b3a309316c0f84
	.xword	0x194214df0d98ba04
	.xword	0x3d131e89e7003675
	.xword	0xa7704cb68a72a20a
	.xword	0xc51b7daf18948658
	.xword	0xd47b817f4625d5a8
	.xword	0xfec2c198442e0905
	.xword	0xe1fb3288e254805f
	.xword	0xac6aecb9e5c71ae1
	.xword	0x4bc98f757b24ac2d
	.xword	0xae1346e27381b23a
	.xword	0x83e56ff752dc7d1a
	.xword	0x65c72d59a4fbbc81
	.xword	0xb4ddd3ead8ae7e59
	.xword	0x552e601da9a61b66
	.xword	0xac7d1399316eb9d3
	.xword	0x12dd1c45464e454e
	.xword	0x1daaf1297ab9a1d2
	.xword	0xb169169db333ea91
	.xword	0x8b6345fe6a3b85f4
	.xword	0xf99d7ed915ef5d89
	.xword	0x0ff771a0304093ab
	.xword	0x6d8d06d2439bc005
	.xword	0xcbfdb06174ac80a4
	.xword	0xa5297eba5c5eb1e1
	.xword	0x695de36ca72aad88
	.xword	0xd196795386caf7f4
	.xword	0xde5a24929508e2de
	.xword	0x56f4da9765728765
	.xword	0x0600e3b03011c5f3
	.xword	0xde226fca689f3ab0
	.xword	0x8d00a95ee5a8c29f
	.xword	0xa320b5bf4f57ee1d
	.xword	0xc9a13239775ae3a9
	.xword	0x9ff397e46009d8c5
	.xword	0x31bb1ffd255e39d5
	.xword	0x7b35ec65b6fa9f1f
	.xword	0x3755b7e9a16f834b
	.xword	0x3dc4cc9144fa459f
	.xword	0x051c47b49c2e4c84
	.xword	0x737c3b196c928277
	.xword	0xc67888ff028afa6a
	.xword	0xeb5837faf81e697f
	.xword	0x0cf69fa62fe5e697
	.xword	0x227e94ffa0cb7239
	.xword	0x37c27e541aa47c2b
	.xword	0x78d18b3de78c432a
	.xword	0x27ea04fc78172d0f
	.xword	0x24cd2141f33b5e8b
	.xword	0x2e42a03e27850b50
	.xword	0x2d5c3e0befd64915
	.xword	0x64fe2a568f8fe05f
	.xword	0x7debd978af05df8e
	.xword	0xa5873513e9ad19f7
	.xword	0xd43ceb72c9f4beb3
	.xword	0x4e3294b8f8be3209
	.xword	0x5ddb1cbf08698377
	.xword	0x4b9543c87ed190ac
	.xword	0xe147558dc8f70284
	.xword	0xb09853420e68384e
	.xword	0x26895dc1eb610400
	.xword	0xed8294bcfe64b0ef
	.xword	0x2675add61e32d2ac
	.xword	0xfc50245252700ac2
	.xword	0x2f7034285c316c4b
	.xword	0xadcba388e864d6b2
	.xword	0x378c938cab894f5b
	.xword	0xb16288c527ec2c48
	.xword	0xdc172386920f3536
	.xword	0x64964ae7ddaa0bef
	.xword	0x1a93a9bd2a89fa76
	.xword	0xd52e00f775c443b0
	.xword	0x382960ef451caa63
	.xword	0xc51bf21029a45ca3
	.xword	0xb881a1105e2f3ffa
	.xword	0xc1075be9ccdd28ff
	.xword	0x2017207df738bff9
	.xword	0xf2171f948c2398fb
	.xword	0x5c27cb99a44b43aa
	.xword	0x70cc6526881b7a29
	.xword	0xcbdc0bb23ea20882
	.xword	0xe859db77d600c32f
	.xword	0x94ce3078e8d41b16
	.xword	0xedba9f127c85151c
	.xword	0x1ea45c6bba3b985f
	.xword	0xcbdea55cb4ce5fa9
	.xword	0x38b3c8ab89a85e48
	.xword	0x6c5c962d2f570ff3
	.xword	0x33158805a3d835f9
	.xword	0x63e3653f7e7be247
	.xword	0xfbb27f0f3b6dd32f
	.xword	0xe6aa413b32679363
	.xword	0xbc6a7c1fafd49e28
	.xword	0xe44c1d25887b923e
	.xword	0x78aabd8b21988bfb
	.xword	0x621d39342e20e37a
	.xword	0xf6a589711486f40c
	.xword	0xe60a31becae367aa
	.xword	0x75f51fa16b2d9351
	.xword	0xbe5e680e0627cf30
	.xword	0x180481b6dcbfce1b
	.xword	0xadc1af97529f21d1
	.xword	0xe91bd2506edf4e38
	.xword	0x3a290b36399415da
	.xword	0x4159d3912af8deaa
	.xword	0xdf537d971488262e
	.xword	0xfe588d8a090f4eef
	.xword	0x7f6d10b804073ab9
	.xword	0xa1e9dd28ec6e0040
	.xword	0x01280e5fdf2e5514
	.xword	0x695a59536c4d121f
	.xword	0x8c46a1d84b864eaa
	.xword	0xd245d6f48d23f8c4
	.xword	0x4017912969a18d8a
	.xword	0x3097dd2c7c556ef8
	.xword	0x4ada9ccf2f49d7e0
	.xword	0x9691cc50f83507ee
	.xword	0x67b760e1687e75c5
	.xword	0x83ebcaa130a3ab1f
	.xword	0x55047ddd2e307225
	.xword	0x2d5ba686608efe2f
	.xword	0xb77536a93db86777
	.xword	0x601f937c5390e60b
	.xword	0x1c616978a824de17
	.xword	0x422a6ee3e71f8c5d
	.xword	0xbc927dd130c2398f
	.xword	0x69d70038decef88d
	.xword	0x2cce195f35a4a971
	.xword	0x06a15e5e443e7454
	.xword	0x72ed260a18e1bb1d
	.xword	0x804d95cdefb4bfe4
	.xword	0x5c8897c21a3d08b9
	.xword	0xe91d239ef75985e2
	.xword	0xd4a9ab294b8b5f53
	.xword	0x9d75a8a78e9dd100
	.xword	0x26e37c7abd2d7673
	.xword	0x9a3212c93b6b00c1
	.xword	0x1ebb0dc2027a8757
	.xword	0x6654a9ca282ab9ef
	.xword	0x325f1a660466cf5b
	.xword	0x783293085dbd442c
	.xword	0x332a4381faaa4397
	.xword	0xd129064fd0e28151
	.xword	0x7d5fb723edc5faf1
	.xword	0xf81c93eaa2de3e0e
	.xword	0xb14f8c6a00baf035
	.xword	0xbaef9c07167f3fbc
	.xword	0xcbabde1bc0948343
	.xword	0xff0abee0aed587ce
	.xword	0x43c6eeee20302787
	.xword	0x22ba6f001056861c
	.xword	0xa0691819a4bae3f0
	.xword	0x6d806a7c93bf01d9
	.xword	0xf2e35c9238e09263
	.xword	0x77cb24686634b1fe
	.xword	0xf811d49d2d4ff6e7
	.xword	0xa9bbbe3e9d8eae4e
	.xword	0x91ad4d9bcf44fd33
	.xword	0x2a7acfe2dc35da6c
	.xword	0x42d112b1385c61e7
	.xword	0xa45387e6dd2f8c08
	.xword	0x880b097d549cc06f
	.xword	0x7fdba397843830a6
	.xword	0x40408332601930f9
	.xword	0xe2aa2cf08c20df1a
	.xword	0xc6c7c8df2bbb2d6f
	.xword	0x90e5faa6caad6ef1
	.xword	0x3e627e0a5d413d7b
	.xword	0xdd1bb0c6b6781e7c
	.xword	0xb70df08de9a06ddb
	.xword	0xcf002f2d53716092
	.xword	0xbca0a3ed56a514b7
	.xword	0x9912472fafbe2947
	.xword	0x0040c9852df454f5
	.xword	0xc974b7d47dd99352
	.xword	0x0ca1b8d3c518f7dd
	.xword	0xa97ce664e5ff7f9c
	.xword	0x0a4a38d819118c77
	.xword	0x7c92f40d6c12ae03
	.xword	0xb010c80e24832772
	.xword	0xd33dd3f032c6c63c
	.xword	0xa097c9de8b2b78f9
	.xword	0x13408308b8a66822
	.xword	0xc93230215978cb44
	.xword	0x50dd958876bd7b51
	.xword	0x4bdfce13baff17e4
	.align 0x80000
	.data
data_start_7:

	.xword	0xb62b69fbf787fb5c
	.xword	0xa8b9c7ab499ac888
	.xword	0xf08c2f6526ab8228
	.xword	0xac923d9a44a1a268
	.xword	0xb83034ec33818b06
	.xword	0x232f7bde4595e4ec
	.xword	0xa66e8e00324a7b7f
	.xword	0x109f8a325ffe409b
	.xword	0x55bd60036219dcc9
	.xword	0x7b89bf423ad612aa
	.xword	0x68ffd23a8d9e52c8
	.xword	0x41fdd6a89d0506b7
	.xword	0x42d39ae49495ec11
	.xword	0x2f36f6ed98aa3cad
	.xword	0xd191baf7a48f45c5
	.xword	0x19586384dcb64bc8
	.xword	0x4fcf434f8c218430
	.xword	0x025cad40461da8bb
	.xword	0x81c073c353d8916f
	.xword	0x69fcb9232369b66e
	.xword	0xdddf1170a1826ed9
	.xword	0x7c85854c248fb323
	.xword	0x1f1f38010225c77b
	.xword	0x3ffe74d75c1d4753
	.xword	0xa1ce4bd4a0fd31be
	.xword	0xb6b6e5989ff7a817
	.xword	0xce4fd5d378eac9ad
	.xword	0x7b650e34e332fc22
	.xword	0xf8187a97ead96a3d
	.xword	0x261be580dff82ac1
	.xword	0xf4b7abc7868a5829
	.xword	0xa63d50e1efe7aade
	.xword	0x6f46326e36a9c74a
	.xword	0x481d2cf62b44be07
	.xword	0xc0a4a329ffe33e2c
	.xword	0xa2d518df2728c3b1
	.xword	0x745deb7d8f571086
	.xword	0xd30b43503de68cc0
	.xword	0x7bc108b7ffaf6f73
	.xword	0xe36f1f76a861eeb5
	.xword	0xc302c5b44a63c41c
	.xword	0xdf94892865e5f869
	.xword	0x59df72ff9fae1c22
	.xword	0x30cb928d2f64b16f
	.xword	0x410077044edb47f2
	.xword	0xb364210eab596d11
	.xword	0xfa49b5cd710d19bd
	.xword	0xa3f80c56610e836e
	.xword	0xd8126bde6939271b
	.xword	0x6af2859a64cc5823
	.xword	0x22b7e43f61f1ec1a
	.xword	0x01190529855d4439
	.xword	0x3c87c1c4260d934b
	.xword	0xb2b369ebdb170337
	.xword	0xf189c653c36d06a5
	.xword	0x5a9f9633f66708ea
	.xword	0xd2a32d6aee837570
	.xword	0xc47d719686ac53a8
	.xword	0x24766fd3f387ac86
	.xword	0x2028cb366614ba88
	.xword	0xf479efd4eacacf8f
	.xword	0x81c692b56fef5cc0
	.xword	0x65674a076bdc5eac
	.xword	0xa55869274885584b
	.xword	0xdc72f2ffe6b14545
	.xword	0x200642946359ce72
	.xword	0x0b5ab6960c2a69b7
	.xword	0x3f571b7b245ad973
	.xword	0x1a1c9e4eba9a94aa
	.xword	0x442d23307a4f47e1
	.xword	0xc06b2ec0a4231b4a
	.xword	0x2a833e7a8596799a
	.xword	0x87ea207b35606501
	.xword	0x8496f9dbb5c2c486
	.xword	0xb044faf898b008fc
	.xword	0x0f0f4c85703e74e6
	.xword	0x382e4bd700ab3db0
	.xword	0x12f00bd42fee2738
	.xword	0x8ab59906eb90fa38
	.xword	0x5802c1259e4bef5a
	.xword	0xade362d9e6766c78
	.xword	0x38852598760ade28
	.xword	0x34ecb2f8b6cff180
	.xword	0x18a069fafe456bad
	.xword	0x167e4fa336d66f89
	.xword	0xaf99d55693d01c26
	.xword	0x2f7f970aa53f5f0f
	.xword	0x98ea2368e1b4b237
	.xword	0x12cd48e20c8e3bd6
	.xword	0x27a97cf65d4a5a99
	.xword	0x08801d35107eab3e
	.xword	0x421c9d4225a9f866
	.xword	0x6f9d46caef07b5e0
	.xword	0xa6f2ed4e731453fd
	.xword	0x98cf4811c45cc59c
	.xword	0xb6174db173466301
	.xword	0x20cf8886356cef44
	.xword	0xa401b1cbe0e9acbd
	.xword	0xb77d302ce77f9403
	.xword	0x4451c0749194166f
	.xword	0x052fc28ce8f5c6c5
	.xword	0x1b4229e3362cfb7a
	.xword	0xd9d83fab4520eb1e
	.xword	0x15d71838048e892f
	.xword	0x213c1e826c4e2269
	.xword	0xfc4509caf5e934ea
	.xword	0x79d651ce19891ea3
	.xword	0xfed1250f716b2f65
	.xword	0x704b948538da8e45
	.xword	0x4f301b708dc81f08
	.xword	0x848da5ba80c97ecf
	.xword	0x4466185966de67c0
	.xword	0x918085dbf134376d
	.xword	0x13a5ae18e68b7fc1
	.xword	0xf8a0a7496e644157
	.xword	0x33a93b27aa924cae
	.xword	0xdb1592ec7e8f014c
	.xword	0x6698a2cdbb754a07
	.xword	0x5f3afc2ee5396122
	.xword	0x1e0f74ea1a6a738c
	.xword	0x2ee9e16759761225
	.xword	0x1d516bbc2ae3060b
	.xword	0xb8ca35135f0f4a1e
	.xword	0x5975e7dddd8a9f57
	.xword	0x8e8b2a5656708cac
	.xword	0x38029c4e10ce72c5
	.xword	0xcb1a1c1641c82380
	.xword	0x54fcb73041b8e11d
	.xword	0xfd675f8ec24a978c
	.xword	0xe36fad52ecd74c91
	.xword	0x9b156bdbc0cdab8b
	.xword	0x4eac5aa56d90f594
	.xword	0xcf51a97da3e50510
	.xword	0x2de4a4f951c699a2
	.xword	0x61a59fafcc209d75
	.xword	0x054c3aaba7cd66f1
	.xword	0xe99472b80f751f37
	.xword	0x46753c1d8e780d48
	.xword	0xb78791d7bed4eba5
	.xword	0xeffbdb22240bdb9d
	.xword	0xacc1ab9b6bfaedf1
	.xword	0x80a5221d2c59dcc7
	.xword	0x52cf7e94aee9cc7c
	.xword	0xddc892ebe452dd7d
	.xword	0x936c83f0a658a4d1
	.xword	0x6d819b27cef70933
	.xword	0x2acbf8b221e5c5c5
	.xword	0x89c517c4a73e2f65
	.xword	0xefee7288ac3cbad3
	.xword	0x619b5b7dec37ff1e
	.xword	0xb83a4fab63f37ff4
	.xword	0x2c141f9e669dca7a
	.xword	0x08c2eb39a26c5cba
	.xword	0x1fe62daf315a7a32
	.xword	0x406c7b22673c14f6
	.xword	0x442cd885f56eb9ff
	.xword	0x60f46f7a87c5a3a2
	.xword	0x89688d3d8f125f7e
	.xword	0x766fd5605f041489
	.xword	0xa90dd65ec97aaa84
	.xword	0xeeb91e74e40aacf4
	.xword	0xc612dfea512655f9
	.xword	0xb2c20572451993fb
	.xword	0xe686d3e8c09058b3
	.xword	0x839583d19b7759f2
	.xword	0xe8f538ec2fc63c2a
	.xword	0x09f6d4bf7d5926a4
	.xword	0x2dec5c1e9759c681
	.xword	0x774f919998430cfb
	.xword	0x363eaf9693f4f46a
	.xword	0x313caf64bbccbd65
	.xword	0x35b05e40559a09c4
	.xword	0x9c966bb0c7607bba
	.xword	0xae27158f0db09a9c
	.xword	0x295d33f66549506c
	.xword	0x9921f9defdd959a4
	.xword	0x09ffaaa2acf963e7
	.xword	0x44774d1d6e74b1a9
	.xword	0xdaf6023679e72276
	.xword	0xce43858e1472921c
	.xword	0x7f0176aca575330e
	.xword	0x63882ed647400e20
	.xword	0xdb96046f406a270c
	.xword	0x68e6d23323edc07a
	.xword	0xdb762307ee067585
	.xword	0x28aebef78e467c85
	.xword	0x9f1e0f1d4aca35cb
	.xword	0xf41c5c2c87e8e66f
	.xword	0x88a483f37feee0f4
	.xword	0x53be03d2629151c2
	.xword	0x223fa1add9606bfe
	.xword	0x72ead4a910ec84ec
	.xword	0x459071ecee2dc83a
	.xword	0xe8c60dfaa3a59a6c
	.xword	0x1bc5f66bbc4dd43b
	.xword	0x4d42f020658d21e2
	.xword	0x60cdb0c998d70849
	.xword	0x342b31021e896646
	.xword	0xb372adfee95a3823
	.xword	0xf6f753fa2d9d7261
	.xword	0x0f1bcec0744eb99f
	.xword	0x482d2ba11bc462a8
	.xword	0xcab0492d99869181
	.xword	0x88f37cb643128808
	.xword	0x635a88aa0f67b5c2
	.xword	0xb5655be5d7437815
	.xword	0xb451bb7bca768e8f
	.xword	0xd63c1783056e0f71
	.xword	0xeb7582d47cf3e85c
	.xword	0x01785b9b4b7cfc13
	.xword	0x098fc95157b0c430
	.xword	0x6a8f227cef9e7313
	.xword	0xc44cfbdbbf01fccb
	.xword	0xd75824bc80dce33e
	.xword	0xbfa867ec981478e4
	.xword	0xd65d7eb9385c23c3
	.xword	0x5a9e7a620c529a6b
	.xword	0x7a01516e59525f6a
	.xword	0xb0cc9afbecab7a29
	.xword	0x8479163da291bfa0
	.xword	0x2bf96cc3d1bc16df
	.xword	0x6f2cb30f6d55ebb9
	.xword	0x060cb5bc7c3c7851
	.xword	0xd365a0bf5f53272a
	.xword	0x553beebf88f83dad
	.xword	0xc8f750f64641cfa4
	.xword	0x6236f144d57c7058
	.xword	0xba42bb4e666ad657
	.xword	0xbc00b91fa486bcb5
	.xword	0x833983c6693a632e
	.xword	0x8ad7a45fecf9782c
	.xword	0x651a5b8802a3a8a9
	.xword	0xccbd33b17ace7857
	.xword	0xb233f4a1237cdadf
	.xword	0xd6e976612fede277
	.xword	0x68b6dda309e73103
	.xword	0x326a1cab52fd7ed7
	.xword	0xf89d44d6d5869279
	.xword	0xe01cbd41af409077
	.xword	0x1176eed4b456408c
	.xword	0x662c4e65bca38f9f
	.xword	0x065437ac933e3530
	.xword	0x60e01dac1b15ffdc
	.xword	0xb838ceed0d3b187b
	.xword	0xb288dcc3559e8538
	.xword	0x95dd442d414903e9
	.xword	0xc52e4de0c3d0f9f8
	.xword	0xf1de3b3e01590990
	.xword	0x7076ac8e3f902a4a
	.xword	0xe80553831a87f1fd
	.xword	0x1b9105b3b98874e0
	.xword	0x2d8e4a379cf2c057
	.xword	0x5d89e19802e23cfc
	.xword	0x323c1eac303ebfb5
	.xword	0xe233e2983149bd57
	.xword	0x61251bf9bed1ea58



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
