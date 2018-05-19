// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_92.s
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
   random seed:	310516357
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

	setx 0x8104daeae351a75a, %g1, %g0
	setx 0x71be38e0a7c99d00, %g1, %g1
	setx 0x1dbceb852826b240, %g1, %g2
	setx 0xd6b7fb48439e9078, %g1, %g3
	setx 0xa20d1de4b005160c, %g1, %g4
	setx 0x558b56299b31d6e0, %g1, %g5
	setx 0x6ec46ea07bd01f83, %g1, %g6
	setx 0x00b8034520bb6a52, %g1, %g7
	setx 0xdbe829ea4fead290, %g1, %r16
	setx 0x750fd725eebc3e4c, %g1, %r17
	setx 0xb584d6106ec125d7, %g1, %r18
	setx 0xe1eff6298c122908, %g1, %r19
	setx 0xa7d71dc9c01d39cc, %g1, %r20
	setx 0x221a2a122c97e41b, %g1, %r21
	setx 0x9f82a4f49e24bef2, %g1, %r22
	setx 0xfa3b5f77812bfc8e, %g1, %r23
	setx 0xe1d8167ea074adb1, %g1, %r24
	setx 0x366e576631faa586, %g1, %r25
	setx 0x7cb604f94505b9f5, %g1, %r26
	setx 0xc486a671fa3ca5c9, %g1, %r27
	setx 0xc71bd35f0f252084, %g1, %r28
	setx 0xc2092e25659ce6a9, %g1, %r29
	setx 0xebd74f4805cfb2f9, %g1, %r30
	setx 0x6b764b4ede6fd53c, %g1, %r31
	save
	setx 0xf43019c17f8081b9, %g1, %r16
	setx 0x0c5a1671de6057c3, %g1, %r17
	setx 0x6b1080c8178a36e0, %g1, %r18
	setx 0x8570426d8406595e, %g1, %r19
	setx 0xf1c4829991fa2a8f, %g1, %r20
	setx 0xb80df65eaafb99a6, %g1, %r21
	setx 0x68c9903278ecf9c4, %g1, %r22
	setx 0x252353901187a3d1, %g1, %r23
	setx 0x8261d44cfa3a7aba, %g1, %r24
	setx 0xbdbb153c1a989276, %g1, %r25
	setx 0xc4d6fbdd4c36fa39, %g1, %r26
	setx 0x4ff28021facdf3a3, %g1, %r27
	setx 0x269a175dff98b693, %g1, %r28
	setx 0xd305a39097f2382b, %g1, %r29
	setx 0xba8ffcac253d7517, %g1, %r30
	setx 0xb2d0b481e5cc42b5, %g1, %r31
	save
	setx 0x402b25270fb80365, %g1, %r16
	setx 0xde62120aad3232e2, %g1, %r17
	setx 0x76be21d6b8ac714b, %g1, %r18
	setx 0x84d2c526dfdcaba0, %g1, %r19
	setx 0x5b09698c4ad332a5, %g1, %r20
	setx 0x10e5b4f544e48090, %g1, %r21
	setx 0x5debe2b6a52d52f3, %g1, %r22
	setx 0x19813da054532db1, %g1, %r23
	setx 0x434857539fa84081, %g1, %r24
	setx 0x0716ba170b5fcc22, %g1, %r25
	setx 0x2a161227a1418dcf, %g1, %r26
	setx 0x939936b3ee5cb9c5, %g1, %r27
	setx 0xe42e2ff0d436a337, %g1, %r28
	setx 0x9168c08403ccf409, %g1, %r29
	setx 0xa59d2a9674bf75d7, %g1, %r30
	setx 0xbcf9f3550c317cca, %g1, %r31
	save
	setx 0xf4828872514dec0d, %g1, %r16
	setx 0x5113a79245a2e456, %g1, %r17
	setx 0x7272ea7fb47a668a, %g1, %r18
	setx 0xd6f4c6932093e10e, %g1, %r19
	setx 0xa6acb750fdd86529, %g1, %r20
	setx 0x823f4253108ab1fd, %g1, %r21
	setx 0x36febcb9213f1e02, %g1, %r22
	setx 0x6899a1af25b845fe, %g1, %r23
	setx 0x9bcab842f4793ad1, %g1, %r24
	setx 0x463f07616da76dc0, %g1, %r25
	setx 0xfdc27a15fcb56451, %g1, %r26
	setx 0xbc056f8a2bbf40d4, %g1, %r27
	setx 0x949c911a35ce591b, %g1, %r28
	setx 0xd9d20abd6f455c95, %g1, %r29
	setx 0x5579a1c47a7bc028, %g1, %r30
	setx 0x8cc93674fb7737e3, %g1, %r31
	save
	setx 0x430df6f080ca60fa, %g1, %r16
	setx 0x5b168a8dd767234a, %g1, %r17
	setx 0xbe48791f77c2935f, %g1, %r18
	setx 0x391ebe9354718259, %g1, %r19
	setx 0xa6382777fbbe43b0, %g1, %r20
	setx 0xbf7ef2344b80fbdb, %g1, %r21
	setx 0xaca9c50aecedf892, %g1, %r22
	setx 0xdf1f9d88e18e5ab1, %g1, %r23
	setx 0x2a902a52e471b8ad, %g1, %r24
	setx 0x32ae6e2e6f532b4b, %g1, %r25
	setx 0x34d522e04a24af39, %g1, %r26
	setx 0xd7b787bd46c0e11d, %g1, %r27
	setx 0x89ba58ebc75e34ee, %g1, %r28
	setx 0xa1405d62ecf878dd, %g1, %r29
	setx 0x3e276ffa116a141d, %g1, %r30
	setx 0xac68549706af9a5f, %g1, %r31
	save
	setx 0xb77bc6a458d8210d, %g1, %r16
	setx 0x6ab3b9cf73a74af6, %g1, %r17
	setx 0x93a9ca621c652e37, %g1, %r18
	setx 0xe1eb2b204bd95372, %g1, %r19
	setx 0x5e7b01f2060907f9, %g1, %r20
	setx 0x9e4b489ac0a585a4, %g1, %r21
	setx 0x7c5dacfc983bb639, %g1, %r22
	setx 0xf5dc56208dd36005, %g1, %r23
	setx 0x56927bc5a624c80e, %g1, %r24
	setx 0x73672b0c070d5ff2, %g1, %r25
	setx 0x1ae6d85dbda57792, %g1, %r26
	setx 0x6ee9f1737b7969b8, %g1, %r27
	setx 0xff42752a4d193a4c, %g1, %r28
	setx 0xd7cfa4ccafa36f51, %g1, %r29
	setx 0xe889fbe039252364, %g1, %r30
	setx 0xa74042427e2dd155, %g1, %r31
	save
	setx 0xb8fa128aae98f05a, %g1, %r16
	setx 0xcb6fc51c5b4a2801, %g1, %r17
	setx 0xb7781ea70b74aacc, %g1, %r18
	setx 0xc06d6889f4742d07, %g1, %r19
	setx 0x19e92dc5ac7c7166, %g1, %r20
	setx 0x4af66d63a68138ea, %g1, %r21
	setx 0xc258c43c4a8a1173, %g1, %r22
	setx 0x963bf6faba10ace2, %g1, %r23
	setx 0xee0f395ad7fa2a33, %g1, %r24
	setx 0x0708c61199e9138b, %g1, %r25
	setx 0x928dd7564b217f39, %g1, %r26
	setx 0x0f77e4d391c03812, %g1, %r27
	setx 0x1e91254b154b259f, %g1, %r28
	setx 0xe729815786cd473d, %g1, %r29
	setx 0x03dc61c8ca5d32d4, %g1, %r30
	setx 0xf7db55410a490b77, %g1, %r31
	save
	setx 0xc3acf563d8e7f4c6, %g1, %r16
	setx 0x42e587db01ff1b06, %g1, %r17
	setx 0x4500c4fc5c2dc487, %g1, %r18
	setx 0xe59eae0f7c90e605, %g1, %r19
	setx 0x640dfb6f05edea1a, %g1, %r20
	setx 0x2e3e09878ffca92a, %g1, %r21
	setx 0xf5beb827780ba1d5, %g1, %r22
	setx 0x9bdd5208c14a18ec, %g1, %r23
	setx 0x070f6545c7bbe319, %g1, %r24
	setx 0xcac3a997cd0e7ad7, %g1, %r25
	setx 0x8b52736ab71c9d40, %g1, %r26
	setx 0xa192d5c615227902, %g1, %r27
	setx 0x3aaa18a05b0b7c10, %g1, %r28
	setx 0xa89a345bd268ff8b, %g1, %r29
	setx 0x076ca18b48df1a6a, %g1, %r30
	setx 0xcc9e1605c182536d, %g1, %r31
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
	.word 0xbca521a8  ! 1: SUBcc_I	subcc 	%r20, 0x01a8, %r30
	.word 0xbb7c8400  ! 2: MOVR_R	movre	%r18, %r0, %r29
	.word 0xb9e56079  ! 3: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde5a124  ! 9: SAVE_I	save	%r22, 0x0001, %r30
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 12)
	.word 0xb3e5a0cd  ! 13: SAVE_I	save	%r22, 0x0001, %r25
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbde4e076  ! 16: SAVE_I	save	%r19, 0x0001, %r30
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 21)
	.word 0xbabd61fc  ! 18: XNORcc_I	xnorcc 	%r21, 0x01fc, %r29
	.word 0x8395e144  ! 19: WRPR_TNPC_I	wrpr	%r23, 0x0144, %tnpc
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 1)
	setx	0x6a3f62ba00009849, %g1, %r10
	.word 0x819a8000  ! 24: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0, %r12
	.word 0x8f930000  ! 28: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 3)
	.word 0xb3e5e02a  ! 36: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5520000  ! 39: RDPR_PIL	<illegal instruction>
	setx	0xa8bae590000cb86, %g1, %r10
	.word 0x819a8000  ! 40: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7504000  ! 42: RDPR_TNPC	<illegal instruction>
	.word 0xb7500000  ! 43: RDPR_TPC	<illegal instruction>
	.word 0xb32db001  ! 44: SLLX_I	sllx	%r22, 0x0001, %r25
	.word 0x839560c3  ! 45: WRPR_TNPC_I	wrpr	%r21, 0x00c3, %tnpc
	.word 0xb5e5200e  ! 46: SAVE_I	save	%r20, 0x0001, %r26
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 37)
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 2c)
	.word 0x8794e0d0  ! 52: WRPR_TT_I	wrpr	%r19, 0x00d0, %tt
	.word 0xbc3c0000  ! 53: XNOR_R	xnor 	%r16, %r0, %r30
	setx	0xa7d8367300005f53, %g1, %r10
	.word 0x819a8000  ! 54: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbf50c000  ! 58: RDPR_TT	<illegal instruction>
	.word 0xb0b4e199  ! 62: ORNcc_I	orncc 	%r19, 0x0199, %r24
	.word 0xb7e4a169  ! 66: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e4e08a  ! 68: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5518000  ! 70: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e520ec  ! 72: SAVE_I	save	%r20, 0x0001, %r25
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 29)
	.word 0xb3518000  ! 77: RDPR_PSTATE	<illegal instruction>
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 13)
	.word 0xbbe46009  ! 80: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e4a1c0  ! 82: SAVE_I	save	%r18, 0x0001, %r26
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 3)
	.word 0xbd35b001  ! 88: SRLX_I	srlx	%r22, 0x0001, %r30
	.word 0xbde4a05e  ! 90: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e5e01e  ! 93: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde56036  ! 96: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e4a0b2  ! 97: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e4e1dd  ! 98: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e4a145  ! 99: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe5217c  ! 101: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbf510000  ! 102: RDPR_TICK	<illegal instruction>
	.word 0xb13d1000  ! 103: SRAX_R	srax	%r20, %r0, %r24
	.word 0xbbe460a6  ! 109: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e4e0ed  ! 114: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9e56098  ! 117: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbb51c000  ! 120: RDPR_TL	<illegal instruction>
	.word 0xb9e4a0f1  ! 121: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e4a177  ! 122: SAVE_I	save	%r18, 0x0001, %r26
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb4ac60e9  ! 124: ANDNcc_I	andncc 	%r17, 0x00e9, %r26
	.word 0xb7e5a10b  ! 128: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1508000  ! 135: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e5a1f8  ! 137: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbb3df001  ! 138: SRAX_I	srax	%r23, 0x0001, %r29
	.word 0xb7e56162  ! 140: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e46070  ! 141: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e4a188  ! 142: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7518000  ! 143: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e5e1d0  ! 144: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x8d9560a1  ! 145: WRPR_PSTATE_I	wrpr	%r21, 0x00a1, %pstate
	.word 0xb5e52103  ! 147: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e520f7  ! 149: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5614d  ! 155: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e4a043  ! 158: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbb540000  ! 160: RDPR_GL	<illegal instruction>
	.word 0xbfe56156  ! 161: SAVE_I	save	%r21, 0x0001, %r31
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, a)
	.word 0xb2940000  ! 165: ORcc_R	orcc 	%r16, %r0, %r25
	setx	0x48a3989a00003d93, %g1, %r10
	.word 0x819a8000  ! 166: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe42034  ! 167: SAVE_I	save	%r16, 0x0001, %r31
	mov	2, %r12
	.word 0x8f930000  ! 171: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe4e10e  ! 176: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe4e087  ! 177: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e561ae  ! 180: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb4b4a0a0  ! 183: SUBCcc_I	orncc 	%r18, 0x00a0, %r26
	.word 0xbfe4619b  ! 185: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e5a1ea  ! 186: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1520000  ! 188: RDPR_PIL	<illegal instruction>
	setx	0xebb2ce9500009d4e, %g1, %r10
	.word 0x839a8000  ! 189: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e5e1cb  ! 199: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8794a11c  ! 201: WRPR_TT_I	wrpr	%r18, 0x011c, %tt
	.word 0xb3e521a1  ! 202: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5480000  ! 204: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 0)
	.word 0xbc34c000  ! 207: ORN_R	orn 	%r19, %r0, %r30
	.word 0xb9518000  ! 209: RDPR_PSTATE	<illegal instruction>
	.word 0xb63d0000  ! 210: XNOR_R	xnor 	%r20, %r0, %r27
	.word 0x8d94a0f5  ! 212: WRPR_PSTATE_I	wrpr	%r18, 0x00f5, %pstate
	.word 0xb7e521f3  ! 216: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e42172  ! 217: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb13ce001  ! 218: SRA_I	sra 	%r19, 0x0001, %r24
	.word 0xb7641800  ! 219: MOVcc_R	<illegal instruction>
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 4)
	mov	2, %r12
	.word 0xa1930000  ! 223: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x879560fd  ! 224: WRPR_TT_I	wrpr	%r21, 0x00fd, %tt
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 12)
	.word 0xbe2dc000  ! 226: ANDN_R	andn 	%r23, %r0, %r31
	.word 0xb5e461a8  ! 229: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1510000  ! 238: RDPR_TICK	<illegal instruction>
	.word 0xb5e4a141  ! 241: SAVE_I	save	%r18, 0x0001, %r26
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 23)
	.word 0xb9e5e009  ! 245: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e4a094  ! 249: SAVE_I	save	%r18, 0x0001, %r24
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbb520000  ! 251: RDPR_PIL	<illegal instruction>
	setx	0xa71c9a00009855, %g1, %r10
	.word 0x819a8000  ! 252: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb480000  ! 256: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x85942044  ! 257: WRPR_TSTATE_I	wrpr	%r16, 0x0044, %tstate
	.word 0xbbe4e0b3  ! 259: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe56094  ! 260: SAVE_I	save	%r21, 0x0001, %r29
	setx	0xe5dc6900005e02, %g1, %r10
	.word 0x819a8000  ! 264: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e46181  ! 265: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e4a198  ! 268: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe5e003  ! 273: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe42059  ! 276: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe52130  ! 279: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbd518000  ! 282: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe4a0f4  ! 283: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8195a08d  ! 285: WRPR_TPC_I	wrpr	%r22, 0x008d, %tpc
	.word 0xb0240000  ! 288: SUB_R	sub 	%r16, %r0, %r24
	.word 0xb1e52122  ! 290: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3510000  ! 295: RDPR_TICK	<illegal instruction>
	.word 0xbd540000  ! 298: RDPR_GL	<illegal instruction>
	.word 0x91956172  ! 306: WRPR_PIL_I	wrpr	%r21, 0x0172, %pil
	.word 0xbfe4a169  ! 309: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb2a40000  ! 313: SUBcc_R	subcc 	%r16, %r0, %r25
	.word 0xb1e56196  ! 314: SAVE_I	save	%r21, 0x0001, %r24
	setx	data_start_6, %g1, %r22
	.word 0xb3e561f2  ! 318: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8794e15a  ! 321: WRPR_TT_I	wrpr	%r19, 0x015a, %tt
	.word 0xb7e4e062  ! 323: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde5e0f0  ! 326: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3504000  ! 328: RDPR_TNPC	<illegal instruction>
	.word 0xbbe5e103  ! 329: SAVE_I	save	%r23, 0x0001, %r29
	mov	2, %r12
	.word 0x8f930000  ! 334: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x81956135  ! 340: WRPR_TPC_I	wrpr	%r21, 0x0135, %tpc
	.word 0x89942158  ! 345: WRPR_TICK_I	wrpr	%r16, 0x0158, %tick
	.word 0x87952067  ! 347: WRPR_TT_I	wrpr	%r20, 0x0067, %tt
	setx	data_start_6, %g1, %r19
	.word 0xb3508000  ! 350: RDPR_TSTATE	<illegal instruction>
	.word 0xb5347001  ! 352: SRLX_I	srlx	%r17, 0x0001, %r26
	.word 0xbfe5a108  ! 355: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbc154000  ! 356: OR_R	or 	%r21, %r0, %r30
	.word 0xb3e4217d  ! 359: SAVE_I	save	%r16, 0x0001, %r25
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 30)
	.word 0xb9e5a1fc  ! 369: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e4a0fd  ! 371: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e56171  ! 372: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e5217c  ! 373: SAVE_I	save	%r20, 0x0001, %r26
	mov	1, %r12
	.word 0xa1930000  ! 375: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8d95a039  ! 377: WRPR_PSTATE_I	wrpr	%r22, 0x0039, %pstate
	.word 0xb89561f9  ! 378: ORcc_I	orcc 	%r21, 0x01f9, %r28
	.word 0x819460cf  ! 379: WRPR_TPC_I	wrpr	%r17, 0x00cf, %tpc
	.word 0xb5e4e07b  ! 380: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe5e1ae  ! 381: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e4e111  ! 382: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e46151  ! 384: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb351c000  ! 390: RDPR_TL	<illegal instruction>
	.word 0xb5643801  ! 391: MOVcc_I	<illegal instruction>
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 38)
	.word 0xb13da001  ! 394: SRA_I	sra 	%r22, 0x0001, %r24
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbbe46000  ! 406: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e42140  ! 412: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb62c0000  ! 413: ANDN_R	andn 	%r16, %r0, %r27
	setx	data_start_3, %g1, %r18
	.word 0xbfe5a0b6  ! 419: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e4a140  ! 421: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbec54000  ! 426: ADDCcc_R	addccc 	%r21, %r0, %r31
	.word 0xb9e56191  ! 427: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x81946091  ! 428: WRPR_TPC_I	wrpr	%r17, 0x0091, %tpc
	.word 0xb7e5a05c  ! 433: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e4a126  ! 434: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbe34c000  ! 436: ORN_R	orn 	%r19, %r0, %r31
	.word 0xbde4a0ec  ! 437: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde560d1  ! 440: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e4a124  ! 441: SAVE_I	save	%r18, 0x0001, %r26
	mov	0, %r12
	.word 0x8f930000  ! 445: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe421a2  ! 446: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe521c5  ! 447: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8d9521c4  ! 448: WRPR_PSTATE_I	wrpr	%r20, 0x01c4, %pstate
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 35)
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbde421e6  ! 457: SAVE_I	save	%r16, 0x0001, %r30
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb9518000  ! 462: RDPR_PSTATE	<illegal instruction>
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 9)
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 5)
	setx	0x5c819b0e00002f40, %g1, %r10
	.word 0x839a8000  ! 468: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e56176  ! 471: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e421d7  ! 472: SAVE_I	save	%r16, 0x0001, %r28
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb1e4a168  ! 474: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e52030  ! 475: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x87946012  ! 476: WRPR_TT_I	wrpr	%r17, 0x0012, %tt
	mov	2, %r12
	.word 0xa1930000  ! 479: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe5e047  ! 481: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde420a9  ! 482: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5518000  ! 487: RDPR_PSTATE	<illegal instruction>
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb1e421f4  ! 491: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8994218d  ! 492: WRPR_TICK_I	wrpr	%r16, 0x018d, %tick
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 35)
	.word 0xbde46100  ! 496: SAVE_I	save	%r17, 0x0001, %r30
	setx	0xee229c6900005a59, %g1, %r10
	.word 0x819a8000  ! 497: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe421b8  ! 500: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x819521d5  ! 503: WRPR_TPC_I	wrpr	%r20, 0x01d5, %tpc
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 20)
	.word 0xb7520000  ! 508: RDPR_PIL	<illegal instruction>
	.word 0xb3e52003  ! 513: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e56015  ! 515: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e5603d  ! 522: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb834e0e1  ! 527: SUBC_I	orn 	%r19, 0x00e1, %r28
	.word 0xba8da037  ! 528: ANDcc_I	andcc 	%r22, 0x0037, %r29
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 1)
	.word 0xb41c4000  ! 533: XOR_R	xor 	%r17, %r0, %r26
	.word 0xb9504000  ! 536: RDPR_TNPC	<illegal instruction>
	.word 0xb7e5e189  ! 537: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe4601d  ! 538: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e4a099  ! 539: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e4a075  ! 546: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e4a08f  ! 547: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb64421fc  ! 550: ADDC_I	addc 	%r16, 0x01fc, %r27
	.word 0xb1643801  ! 551: MOVcc_I	<illegal instruction>
	.word 0xbf51c000  ! 552: RDPR_TL	<illegal instruction>
	.word 0xb5500000  ! 553: RDPR_TPC	<illegal instruction>
	.word 0xb5480000  ! 554: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 35)
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 28)
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 10)
	.word 0xb1e4a198  ! 561: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e561c3  ! 568: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e4619f  ! 571: SAVE_I	save	%r17, 0x0001, %r28
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 37)
	.word 0xb1518000  ! 574: RDPR_PSTATE	<illegal instruction>
	.word 0xb151c000  ! 579: RDPR_TL	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 580: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8d94e0ff  ! 584: WRPR_PSTATE_I	wrpr	%r19, 0x00ff, %pstate
	.word 0xb1480000  ! 587: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	mov	1, %r12
	.word 0xa1930000  ! 588: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb6bd0000  ! 589: XNORcc_R	xnorcc 	%r20, %r0, %r27
	.word 0xbde5a019  ! 591: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb750c000  ! 592: RDPR_TT	<illegal instruction>
	.word 0xbde460d6  ! 593: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7500000  ! 595: RDPR_TPC	<illegal instruction>
	.word 0xb1500000  ! 596: RDPR_TPC	<illegal instruction>
	.word 0xbfe46199  ! 600: SAVE_I	save	%r17, 0x0001, %r31
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 28)
	.word 0xbb51c000  ! 603: RDPR_TL	<illegal instruction>
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbfe4a1fe  ! 606: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e4214e  ! 607: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e5e115  ! 609: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe56019  ! 610: SAVE_I	save	%r21, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb83d20cf  ! 615: XNOR_I	xnor 	%r20, 0x00cf, %r28
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 0)
	.word 0xbfe5e19b  ! 617: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e42182  ! 618: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e4e152  ! 619: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb8ac214e  ! 621: ANDNcc_I	andncc 	%r16, 0x014e, %r28
	.word 0xb3e5218d  ! 622: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb425a0b1  ! 627: SUB_I	sub 	%r22, 0x00b1, %r26
	.word 0xb1e56026  ! 629: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb4b561d1  ! 631: SUBCcc_I	orncc 	%r21, 0x01d1, %r26
	.word 0xb3e4a1ae  ! 632: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbca58000  ! 641: SUBcc_R	subcc 	%r22, %r0, %r30
	.word 0xb3e56093  ! 645: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb405c000  ! 646: ADD_R	add 	%r23, %r0, %r26
	.word 0xb1e4a059  ! 647: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e5217c  ! 648: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e5e11e  ! 649: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x9195a178  ! 651: WRPR_PIL_I	wrpr	%r22, 0x0178, %pil
	.word 0x879461a3  ! 654: WRPR_TT_I	wrpr	%r17, 0x01a3, %tt
	.word 0xbbe460af  ! 656: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x83952083  ! 657: WRPR_TNPC_I	wrpr	%r20, 0x0083, %tnpc
	.word 0xb5500000  ! 660: RDPR_TPC	<illegal instruction>
	.word 0xb1e460f6  ! 662: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe461db  ! 663: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e5a00a  ! 665: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e46060  ! 666: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1518000  ! 669: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e461f8  ! 670: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbb518000  ! 675: RDPR_PSTATE	<illegal instruction>
	.word 0xb73dc000  ! 676: SRA_R	sra 	%r23, %r0, %r27
	setx	data_start_3, %g1, %r20
	.word 0xbb34a001  ! 685: SRL_I	srl 	%r18, 0x0001, %r29
	mov	1, %r12
	.word 0x8f930000  ! 686: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e520f9  ! 690: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e5e1e5  ! 693: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e421dd  ! 695: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e561b2  ! 698: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e5e096  ! 699: SAVE_I	save	%r23, 0x0001, %r28
	setx	data_start_1, %g1, %r18
	.word 0xb7e560a2  ! 708: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9518000  ! 709: RDPR_PSTATE	<illegal instruction>
	.word 0xbac50000  ! 711: ADDCcc_R	addccc 	%r20, %r0, %r29
	.word 0xbb2c7001  ! 713: SLLX_I	sllx	%r17, 0x0001, %r29
	.word 0xbf500000  ! 719: RDPR_TPC	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 721: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3e5605b  ! 722: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb21d4000  ! 726: XOR_R	xor 	%r21, %r0, %r25
	.word 0xb7e5e156  ! 727: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e4a077  ! 731: SAVE_I	save	%r18, 0x0001, %r24
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 36)
	.word 0xbbe5e1aa  ! 733: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbde4a087  ! 738: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb424a11e  ! 739: SUB_I	sub 	%r18, 0x011e, %r26
	.word 0xbfe561d1  ! 746: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xba9d6018  ! 749: XORcc_I	xorcc 	%r21, 0x0018, %r29
	.word 0xbbe4603b  ! 753: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb62d60b0  ! 755: ANDN_I	andn 	%r21, 0x00b0, %r27
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, d)
	.word 0xb1540000  ! 758: RDPR_GL	<illegal instruction>
	.word 0xbca44000  ! 764: SUBcc_R	subcc 	%r17, %r0, %r30
	.word 0xb3e561d0  ! 765: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xba2c4000  ! 769: ANDN_R	andn 	%r17, %r0, %r29
	.word 0xbde4e084  ! 770: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e421fa  ! 771: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e461c4  ! 773: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbb504000  ! 776: RDPR_TNPC	<illegal instruction>
	.word 0x8994e04b  ! 777: WRPR_TICK_I	wrpr	%r19, 0x004b, %tick
	.word 0xb3520000  ! 780: RDPR_PIL	<illegal instruction>
	.word 0x8d956116  ! 782: WRPR_PSTATE_I	wrpr	%r21, 0x0116, %pstate
	.word 0xb7e46015  ! 784: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe5e00b  ! 785: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbd518000  ! 790: RDPR_PSTATE	<illegal instruction>
	.word 0x9195a1fd  ! 794: WRPR_PIL_I	wrpr	%r22, 0x01fd, %pil
	.word 0xb5520000  ! 795: RDPR_PIL	<illegal instruction>
	.word 0xb3e420a2  ! 796: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x8595e044  ! 797: WRPR_TSTATE_I	wrpr	%r23, 0x0044, %tstate
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 28)
	.word 0xb1e4e08d  ! 806: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbebcc000  ! 807: XNORcc_R	xnorcc 	%r19, %r0, %r31
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbbe560e5  ! 818: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x8794a13a  ! 824: WRPR_TT_I	wrpr	%r18, 0x013a, %tt
	.word 0xb5518000  ! 825: RDPR_PSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r16
	setx	0xfb4f1f2d00003fd4, %g1, %r10
	.word 0x819a8000  ! 831: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9e4a18c  ! 832: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e4e021  ! 842: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e5219d  ! 843: SAVE_I	save	%r20, 0x0001, %r28
	mov	0, %r12
	.word 0x8f930000  ! 846: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x6934c88300009add, %g1, %r10
	.word 0x839a8000  ! 847: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7e520df  ! 853: SAVE_I	save	%r20, 0x0001, %r27
	setx	data_start_7, %g1, %r22
	.word 0xbbe4611b  ! 856: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7508000  ! 861: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e52187  ! 864: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e4a1e3  ! 867: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb73c8000  ! 871: SRA_R	sra 	%r18, %r0, %r27
	.word 0xbde520bd  ! 873: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe421ff  ! 874: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e56107  ! 876: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e4e012  ! 878: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde561ac  ! 879: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x81946169  ! 880: WRPR_TPC_I	wrpr	%r17, 0x0169, %tpc
	.word 0xb5e4200e  ! 885: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe5e182  ! 886: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x8994210b  ! 889: WRPR_TICK_I	wrpr	%r16, 0x010b, %tick
	.word 0xb5e4a17d  ! 892: SAVE_I	save	%r18, 0x0001, %r26
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 14)
	.word 0x8995e0f2  ! 895: WRPR_TICK_I	wrpr	%r23, 0x00f2, %tick
	.word 0x85946143  ! 896: WRPR_TSTATE_I	wrpr	%r17, 0x0143, %tstate
	.word 0x899561c3  ! 898: WRPR_TICK_I	wrpr	%r21, 0x01c3, %tick
	.word 0x8594e027  ! 901: WRPR_TSTATE_I	wrpr	%r19, 0x0027, %tstate
	.word 0xbfe5a0e6  ! 902: SAVE_I	save	%r22, 0x0001, %r31
	mov	0, %r12
	.word 0x8f930000  ! 904: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe420e3  ! 908: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8195e134  ! 910: WRPR_TPC_I	wrpr	%r23, 0x0134, %tpc
	.word 0x919460ae  ! 912: WRPR_PIL_I	wrpr	%r17, 0x00ae, %pil
	.word 0xb1e461a0  ! 913: SAVE_I	save	%r17, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e460e5  ! 919: SAVE_I	save	%r17, 0x0001, %r24
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe46027  ! 925: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5540000  ! 928: RDPR_GL	<illegal instruction>
	.word 0x859460bb  ! 930: WRPR_TSTATE_I	wrpr	%r17, 0x00bb, %tstate
	.word 0xb8a5c000  ! 933: SUBcc_R	subcc 	%r23, %r0, %r28
	mov	0, %r12
	.word 0x8f930000  ! 935: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x83952043  ! 936: WRPR_TNPC_I	wrpr	%r20, 0x0043, %tnpc
	.word 0xb9e42143  ! 938: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe5a059  ! 940: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e42001  ! 941: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbd510000  ! 946: RDPR_TICK	<illegal instruction>
	.word 0xbcac60d5  ! 948: ANDNcc_I	andncc 	%r17, 0x00d5, %r30
	.word 0xb1e460ee  ! 949: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xba9de18c  ! 950: XORcc_I	xorcc 	%r23, 0x018c, %r29
	.word 0xb1e461ea  ! 951: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e42034  ! 952: SAVE_I	save	%r16, 0x0001, %r28
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, b)
	.word 0xb48c8000  ! 959: ANDcc_R	andcc 	%r18, %r0, %r26
	.word 0x8d942197  ! 962: WRPR_PSTATE_I	wrpr	%r16, 0x0197, %pstate
	.word 0xbbe4214d  ! 965: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbd540000  ! 966: RDPR_GL	<illegal instruction>
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 0)
	.word 0xb9e5e115  ! 968: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9510000  ! 969: RDPR_TICK	<illegal instruction>
	.word 0xbde461a0  ! 970: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x89946090  ! 972: WRPR_TICK_I	wrpr	%r17, 0x0090, %tick
	.word 0x81956160  ! 974: WRPR_TPC_I	wrpr	%r21, 0x0160, %tpc
	.word 0xbbe5606b  ! 975: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe561e6  ! 978: SAVE_I	save	%r21, 0x0001, %r29
	mov	2, %r12
	.word 0xa1930000  ! 979: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3510000  ! 984: RDPR_TICK	<illegal instruction>
	.word 0xb044a1d2  ! 987: ADDC_I	addc 	%r18, 0x01d2, %r24
	.word 0xb3e5a09c  ! 993: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe46182  ! 995: SAVE_I	save	%r17, 0x0001, %r31
hwintr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_45), 16, 16)) -> intp(0, 0, 13)
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
	.word 0xb0a4215c  ! 1: SUBcc_I	subcc 	%r16, 0x015c, %r24
	.word 0xb17c4400  ! 2: MOVR_R	movre	%r17, %r0, %r24
	.word 0xf475600a  ! 4: STX_I	stx	%r26, [%r21 + 0x000a]
	.word 0xff3da1f9  ! 6: STDF_I	std	%f31, [0x01f9, %r22]
	.word 0xf62c6148  ! 8: STB_I	stb	%r27, [%r17 + 0x0148]
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 24)
	.word 0xf53da145  ! 12: STDF_I	std	%f26, [0x0145, %r22]
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 2a)
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 2)
	.word 0xbabc2154  ! 18: XNORcc_I	xnorcc 	%r16, 0x0154, %r29
	.word 0x8394a140  ! 19: WRPR_TNPC_I	wrpr	%r18, 0x0140, %tnpc
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 3a)
	setx	0xb307d4a400008fc3, %g1, %r10
	.word 0x819a8000  ! 24: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0, %r12
	.word 0x8f930000  ! 28: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf4344000  ! 30: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xf63d4000  ! 32: STD_R	std	%r27, [%r21 + %r0]
	.word 0xf82da18c  ! 34: STB_I	stb	%r28, [%r22 + 0x018c]
	.word 0xfc348000  ! 35: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xfe2da10a  ! 37: STB_I	stb	%r31, [%r22 + 0x010a]
	.word 0xb7520000  ! 39: RDPR_PIL	rdpr	%pil, %r27
	setx	0xa8eda8ed00006d53, %g1, %r10
	.word 0x819a8000  ! 40: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf4350000  ! 41: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xb3504000  ! 42: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xbf500000  ! 43: RDPR_TPC	<illegal instruction>
	.word 0xbd2d7001  ! 44: SLLX_I	sllx	%r21, 0x0001, %r30
	.word 0x839560ad  ! 45: WRPR_TNPC_I	wrpr	%r21, 0x00ad, %tnpc
	.word 0xf13c4000  ! 47: STDF_R	std	%f24, [%r0, %r17]
	.word 0xfe3c4000  ! 48: STD_R	std	%r31, [%r17 + %r0]
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 30)
	.word 0xf82cc000  ! 50: STB_R	stb	%r28, [%r19 + %r0]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 0)
	.word 0x8794e001  ! 52: WRPR_TT_I	wrpr	%r19, 0x0001, %tt
	.word 0xb43d0000  ! 53: XNOR_R	xnor 	%r20, %r0, %r26
	setx	0xcd4926400000bd9b, %g1, %r10
	.word 0x819a8000  ! 54: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb750c000  ! 58: RDPR_TT	rdpr	%tt, %r27
	.word 0xf53c4000  ! 60: STDF_R	std	%f26, [%r0, %r17]
	.word 0xb0b421e1  ! 62: ORNcc_I	orncc 	%r16, 0x01e1, %r24
	.word 0xfc3c8000  ! 67: STD_R	std	%r30, [%r18 + %r0]
	.word 0xfa344000  ! 69: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xbd518000  ! 70: RDPR_PSTATE	<illegal instruction>
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, b)
	.word 0xf2242139  ! 75: STW_I	stw	%r25, [%r16 + 0x0139]
	.word 0xbb518000  ! 77: RDPR_PSTATE	<illegal instruction>
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 37)
	.word 0xfc244000  ! 81: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xf4240000  ! 85: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xf675e089  ! 86: STX_I	stx	%r27, [%r23 + 0x0089]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb934f001  ! 88: SRLX_I	srlx	%r19, 0x0001, %r28
	.word 0xf4340000  ! 91: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xfa2d8000  ! 95: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xf23d0000  ! 100: STD_R	std	%r25, [%r20 + %r0]
	.word 0xbd510000  ! 102: RDPR_TICK	<illegal instruction>
	.word 0xb13cd000  ! 103: SRAX_R	srax	%r19, %r0, %r24
	.word 0xf4340000  ! 104: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xfa2d4000  ! 105: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xf23c0000  ! 112: STD_R	std	%r25, [%r16 + %r0]
	.word 0xb751c000  ! 120: RDPR_TL	<illegal instruction>
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 29)
	.word 0xbeac2023  ! 124: ANDNcc_I	andncc 	%r16, 0x0023, %r31
	.word 0xf03de0c8  ! 126: STD_I	std	%r24, [%r23 + 0x00c8]
	.word 0xfa2ca0e2  ! 127: STB_I	stb	%r29, [%r18 + 0x00e2]
	.word 0xf03dc000  ! 129: STD_R	std	%r24, [%r23 + %r0]
	.word 0xf43ce000  ! 131: STD_I	std	%r26, [%r19 + 0x0000]
	.word 0xb5508000  ! 135: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xbb3df001  ! 138: SRAX_I	srax	%r23, 0x0001, %r29
	.word 0xbd518000  ! 143: RDPR_PSTATE	<illegal instruction>
	.word 0x8d94e192  ! 145: WRPR_PSTATE_I	wrpr	%r19, 0x0192, %pstate
	.word 0xf53da115  ! 146: STDF_I	std	%f26, [0x0115, %r22]
	.word 0xfc2d6097  ! 150: STB_I	stb	%r30, [%r21 + 0x0097]
	.word 0xfa2cc000  ! 153: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xf6248000  ! 157: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xbf540000  ! 160: RDPR_GL	rdpr	%-, %r31
	.word 0xf93dc000  ! 162: STDF_R	std	%f28, [%r0, %r23]
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 3b)
	.word 0xb6950000  ! 165: ORcc_R	orcc 	%r20, %r0, %r27
	setx	0xf29b622200005c4f, %g1, %r10
	.word 0x819a8000  ! 166: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0, %r12
	.word 0x8f930000  ! 171: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc24e169  ! 172: STW_I	stw	%r30, [%r19 + 0x0169]
	.word 0xf43d6030  ! 174: STD_I	std	%r26, [%r21 + 0x0030]
	.word 0xf33d0000  ! 178: STDF_R	std	%f25, [%r0, %r20]
	.word 0xb8b4e06d  ! 183: SUBCcc_I	orncc 	%r19, 0x006d, %r28
	.word 0xfe3d6157  ! 184: STD_I	std	%r31, [%r21 + 0x0157]
	.word 0xfc348000  ! 187: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xb9520000  ! 188: RDPR_PIL	rdpr	%pil, %r28
	setx	0x135b134300005c54, %g1, %r10
	.word 0x839a8000  ! 189: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf13d6185  ! 191: STDF_I	std	%f24, [0x0185, %r21]
	.word 0xfa254000  ! 193: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xfe74a0a1  ! 195: STX_I	stx	%r31, [%r18 + 0x00a1]
	.word 0xfe750000  ! 196: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf42da056  ! 198: STB_I	stb	%r26, [%r22 + 0x0056]
	.word 0x8794e079  ! 201: WRPR_TT_I	wrpr	%r19, 0x0079, %tt
	.word 0xb5480000  ! 204: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 28)
	.word 0xba34c000  ! 207: ORN_R	orn 	%r19, %r0, %r29
	.word 0xf0252036  ! 208: STW_I	stw	%r24, [%r20 + 0x0036]
	.word 0xb3518000  ! 209: RDPR_PSTATE	<illegal instruction>
	.word 0xb63d4000  ! 210: XNOR_R	xnor 	%r21, %r0, %r27
	.word 0xf73d61a4  ! 211: STDF_I	std	%f27, [0x01a4, %r21]
	.word 0x8d942099  ! 212: WRPR_PSTATE_I	wrpr	%r16, 0x0099, %pstate
	.word 0xbd3c6001  ! 218: SRA_I	sra 	%r17, 0x0001, %r30
	.word 0xbf641800  ! 219: MOVcc_R	<illegal instruction>
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 16)
	mov	2, %r12
	.word 0xa1930000  ! 223: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x879420a8  ! 224: WRPR_TT_I	wrpr	%r16, 0x00a8, %tt
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 20)
	.word 0xb82c8000  ! 226: ANDN_R	andn 	%r18, %r0, %r28
	.word 0xf024e022  ! 227: STW_I	stw	%r24, [%r19 + 0x0022]
	.word 0xfa2c8000  ! 233: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xfe2ca195  ! 236: STB_I	stb	%r31, [%r18 + 0x0195]
	.word 0xb1510000  ! 238: RDPR_TICK	rdpr	%tick, %r24
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 35)
	.word 0xfe24c000  ! 247: STW_R	stw	%r31, [%r19 + %r0]
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 32)
	.word 0xb5520000  ! 251: RDPR_PIL	<illegal instruction>
	setx	0x2f8f339f00005d13, %g1, %r10
	.word 0x819a8000  ! 252: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xff3d4000  ! 253: STDF_R	std	%f31, [%r0, %r21]
	.word 0xbf480000  ! 256: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x8594212a  ! 257: WRPR_TSTATE_I	wrpr	%r16, 0x012a, %tstate
	setx	0x79e5282500004c94, %g1, %r10
	.word 0x819a8000  ! 264: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf53d8000  ! 272: STDF_R	std	%f26, [%r0, %r22]
	.word 0xfc3dc000  ! 277: STD_R	std	%r30, [%r23 + %r0]
	.word 0xb5518000  ! 282: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0x8194205b  ! 285: WRPR_TPC_I	wrpr	%r16, 0x005b, %tpc
	.word 0xfe746168  ! 287: STX_I	stx	%r31, [%r17 + 0x0168]
	.word 0xb625c000  ! 288: SUB_R	sub 	%r23, %r0, %r27
	.word 0xbb510000  ! 295: RDPR_TICK	rdpr	%tick, %r29
	.word 0xbd540000  ! 298: RDPR_GL	<illegal instruction>
	.word 0xf874a081  ! 301: STX_I	stx	%r28, [%r18 + 0x0081]
	.word 0xf6258000  ! 303: STW_R	stw	%r27, [%r22 + %r0]
	.word 0x9194a133  ! 306: WRPR_PIL_I	wrpr	%r18, 0x0133, %pil
	.word 0xfa340000  ! 311: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xbaa44000  ! 313: SUBcc_R	subcc 	%r17, %r0, %r29
	setx	data_start_4, %g1, %r16
	.word 0xf8248000  ! 317: STW_R	stw	%r28, [%r18 + %r0]
	.word 0x8795e070  ! 321: WRPR_TT_I	wrpr	%r23, 0x0070, %tt
	.word 0xb7504000  ! 328: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xf22de082  ! 331: STB_I	stb	%r25, [%r23 + 0x0082]
	mov	2, %r12
	.word 0x8f930000  ! 334: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf73cc000  ! 335: STDF_R	std	%f27, [%r0, %r19]
	.word 0xf0344000  ! 339: STH_R	sth	%r24, [%r17 + %r0]
	.word 0x819460ee  ! 340: WRPR_TPC_I	wrpr	%r17, 0x00ee, %tpc
	.word 0xf025e1d7  ! 342: STW_I	stw	%r24, [%r23 + 0x01d7]
	.word 0x8995209c  ! 345: WRPR_TICK_I	wrpr	%r20, 0x009c, %tick
	.word 0x8794619a  ! 347: WRPR_TT_I	wrpr	%r17, 0x019a, %tt
	setx	data_start_4, %g1, %r22
	.word 0xb7508000  ! 350: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb5347001  ! 352: SRLX_I	srlx	%r17, 0x0001, %r26
	.word 0xb2144000  ! 356: OR_R	or 	%r17, %r0, %r25
	.word 0xf2750000  ! 358: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xf13cc000  ! 362: STDF_R	std	%f24, [%r0, %r19]
	.word 0xfe2d6184  ! 365: STB_I	stb	%r31, [%r21 + 0x0184]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfe2c212b  ! 374: STB_I	stb	%r31, [%r16 + 0x012b]
	mov	2, %r12
	.word 0xa1930000  ! 375: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8d956108  ! 377: WRPR_PSTATE_I	wrpr	%r21, 0x0108, %pstate
	.word 0xb094e1d7  ! 378: ORcc_I	orcc 	%r19, 0x01d7, %r24
	.word 0x819521a6  ! 379: WRPR_TPC_I	wrpr	%r20, 0x01a6, %tpc
	.word 0xfc24a0f8  ! 386: STW_I	stw	%r30, [%r18 + 0x00f8]
	.word 0xf875e163  ! 387: STX_I	stx	%r28, [%r23 + 0x0163]
	.word 0xf875c000  ! 389: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xbf51c000  ! 390: RDPR_TL	rdpr	%tl, %r31
	.word 0xb5643801  ! 391: MOVcc_I	<illegal instruction>
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf93dc000  ! 393: STDF_R	std	%f28, [%r0, %r23]
	.word 0xb33ce001  ! 394: SRA_I	sra 	%r19, 0x0001, %r25
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf6746040  ! 399: STX_I	stx	%r27, [%r17 + 0x0040]
	.word 0xfc740000  ! 407: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xfa34c000  ! 408: STH_R	sth	%r29, [%r19 + %r0]
	.word 0xf13ca00f  ! 410: STDF_I	std	%f24, [0x000f, %r18]
	.word 0xb02c8000  ! 413: ANDN_R	andn 	%r18, %r0, %r24
	.word 0xf2344000  ! 417: STH_R	sth	%r25, [%r17 + %r0]
	setx	data_start_4, %g1, %r19
	.word 0xf03dc000  ! 420: STD_R	std	%r24, [%r23 + %r0]
	.word 0xb4c44000  ! 426: ADDCcc_R	addccc 	%r17, %r0, %r26
	.word 0x8195a1c7  ! 428: WRPR_TPC_I	wrpr	%r22, 0x01c7, %tpc
	.word 0xf0358000  ! 429: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xf025e07c  ! 430: STW_I	stw	%r24, [%r23 + 0x007c]
	.word 0xb0358000  ! 436: ORN_R	orn 	%r22, %r0, %r24
	.word 0xfa34207a  ! 444: STH_I	sth	%r29, [%r16 + 0x007a]
	mov	0, %r12
	.word 0x8f930000  ! 445: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8d95a105  ! 448: WRPR_PSTATE_I	wrpr	%r22, 0x0105, %pstate
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 34)
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 16)
	.word 0xf875a01a  ! 452: STX_I	stx	%r28, [%r22 + 0x001a]
	.word 0xf6240000  ! 454: STW_R	stw	%r27, [%r16 + %r0]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, a)
	.word 0xbf518000  ! 462: RDPR_PSTATE	rdpr	%pstate, %r31
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 27)
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 35)
	.word 0xff3ce04d  ! 467: STDF_I	std	%f31, [0x004d, %r19]
	setx	0xcc987200007e02, %g1, %r10
	.word 0x839a8000  ! 468: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 2a)
	.word 0x8794a0a0  ! 476: WRPR_TT_I	wrpr	%r18, 0x00a0, %tt
	.word 0xfc2d8000  ! 478: STB_R	stb	%r30, [%r22 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 479: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe2dc000  ! 483: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xf03d4000  ! 484: STD_R	std	%r24, [%r21 + %r0]
	.word 0xf0350000  ! 486: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xb3518000  ! 487: RDPR_PSTATE	rdpr	%pstate, %r25
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 15)
	.word 0x8994e11c  ! 492: WRPR_TICK_I	wrpr	%r19, 0x011c, %tick
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 9)
	.word 0xf03ca0b3  ! 494: STD_I	std	%r24, [%r18 + 0x00b3]
	setx	0xcae35ff50000688b, %g1, %r10
	.word 0x819a8000  ! 497: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x81946157  ! 503: WRPR_TPC_I	wrpr	%r17, 0x0157, %tpc
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 13)
	.word 0xf62d20c4  ! 505: STB_I	stb	%r27, [%r20 + 0x00c4]
	.word 0xf874211c  ! 506: STX_I	stx	%r28, [%r16 + 0x011c]
	.word 0xbf520000  ! 508: RDPR_PIL	rdpr	%pil, %r31
	.word 0xf475202e  ! 510: STX_I	stx	%r26, [%r20 + 0x002e]
	.word 0xf53c6061  ! 514: STDF_I	std	%f26, [0x0061, %r17]
	.word 0xf6244000  ! 517: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xf02460b8  ! 518: STW_I	stw	%r24, [%r17 + 0x00b8]
	.word 0xf674e02f  ! 520: STX_I	stx	%r27, [%r19 + 0x002f]
	.word 0xfa2c8000  ! 521: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xfc2de1db  ! 523: STB_I	stb	%r30, [%r23 + 0x01db]
	.word 0xf8752131  ! 526: STX_I	stx	%r28, [%r20 + 0x0131]
	.word 0xb835607b  ! 527: SUBC_I	orn 	%r21, 0x007b, %r28
	.word 0xb08ce1b0  ! 528: ANDcc_I	andcc 	%r19, 0x01b0, %r24
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 15)
	.word 0xf22ca031  ! 531: STB_I	stb	%r25, [%r18 + 0x0031]
	.word 0xb01d4000  ! 533: XOR_R	xor 	%r21, %r0, %r24
	.word 0xf875c000  ! 535: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xbf504000  ! 536: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf53d4000  ! 542: STDF_R	std	%f26, [%r0, %r21]
	.word 0xf224e13a  ! 548: STW_I	stw	%r25, [%r19 + 0x013a]
	.word 0xb04560a1  ! 550: ADDC_I	addc 	%r21, 0x00a1, %r24
	.word 0xbb643801  ! 551: MOVcc_I	<illegal instruction>
	.word 0xb551c000  ! 552: RDPR_TL	<illegal instruction>
	.word 0xbf500000  ! 553: RDPR_TPC	<illegal instruction>
	.word 0xb5480000  ! 554: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 25)
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 24)
	.word 0xf07461af  ! 557: STX_I	stx	%r24, [%r17 + 0x01af]
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfa3d60cd  ! 560: STD_I	std	%r29, [%r21 + 0x00cd]
	.word 0xfb3c0000  ! 563: STDF_R	std	%f29, [%r0, %r16]
	.word 0xff3d200a  ! 564: STDF_I	std	%f31, [0x000a, %r20]
	.word 0xfc3c8000  ! 565: STD_R	std	%r30, [%r18 + %r0]
	.word 0xfe2c61b2  ! 569: STB_I	stb	%r31, [%r17 + 0x01b2]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 19)
	.word 0xb3518000  ! 574: RDPR_PSTATE	<illegal instruction>
	.word 0xfe75a1aa  ! 576: STX_I	stx	%r31, [%r22 + 0x01aa]
	.word 0xbf51c000  ! 579: RDPR_TL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 580: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf03c4000  ! 583: STD_R	std	%r24, [%r17 + %r0]
	.word 0x8d95e048  ! 584: WRPR_PSTATE_I	wrpr	%r23, 0x0048, %pstate
	.word 0xb7480000  ! 587: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	mov	0, %r12
	.word 0xa1930000  ! 588: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb4bd8000  ! 589: XNORcc_R	xnorcc 	%r22, %r0, %r26
	.word 0xb550c000  ! 592: RDPR_TT	rdpr	%tt, %r26
	.word 0xb5500000  ! 595: RDPR_TPC	<illegal instruction>
	.word 0xbb500000  ! 596: RDPR_TPC	<illegal instruction>
	.word 0xfe250000  ! 597: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xf13c4000  ! 598: STDF_R	std	%f24, [%r0, %r17]
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 35)
	.word 0xbd51c000  ! 603: RDPR_TL	<illegal instruction>
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 38)
	.word 0xf2246189  ! 608: STW_I	stw	%r25, [%r17 + 0x0189]
	.word 0xfa348000  ! 611: STH_R	sth	%r29, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf63c6015  ! 614: STD_I	std	%r27, [%r17 + 0x0015]
	.word 0xb03d6139  ! 615: XNOR_I	xnor 	%r21, 0x0139, %r24
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfc248000  ! 620: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xb6ad60d0  ! 621: ANDNcc_I	andncc 	%r21, 0x00d0, %r27
	.word 0xf13da13f  ! 624: STDF_I	std	%f24, [0x013f, %r22]
	.word 0xf63da00f  ! 625: STD_I	std	%r27, [%r22 + 0x000f]
	.word 0xb6242039  ! 627: SUB_I	sub 	%r16, 0x0039, %r27
	.word 0xfe2d2113  ! 628: STB_I	stb	%r31, [%r20 + 0x0113]
	.word 0xb4b4a01b  ! 631: SUBCcc_I	orncc 	%r18, 0x001b, %r26
	.word 0xff3da02f  ! 640: STDF_I	std	%f31, [0x002f, %r22]
	.word 0xb8a54000  ! 641: SUBcc_R	subcc 	%r21, %r0, %r28
	.word 0xb205c000  ! 646: ADD_R	add 	%r23, %r0, %r25
	.word 0x9194614f  ! 651: WRPR_PIL_I	wrpr	%r17, 0x014f, %pil
	.word 0xf22ce1ad  ! 653: STB_I	stb	%r25, [%r19 + 0x01ad]
	.word 0x879421b2  ! 654: WRPR_TT_I	wrpr	%r16, 0x01b2, %tt
	.word 0xf13c0000  ! 655: STDF_R	std	%f24, [%r0, %r16]
	.word 0x839521f0  ! 657: WRPR_TNPC_I	wrpr	%r20, 0x01f0, %tnpc
	.word 0xf23c8000  ! 658: STD_R	std	%r25, [%r18 + %r0]
	.word 0xb5500000  ! 660: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xb9518000  ! 669: RDPR_PSTATE	<illegal instruction>
	.word 0xfc2ca017  ! 672: STB_I	stb	%r30, [%r18 + 0x0017]
	.word 0xf43ca12a  ! 674: STD_I	std	%r26, [%r18 + 0x012a]
	.word 0xbd518000  ! 675: RDPR_PSTATE	<illegal instruction>
	.word 0xb33dc000  ! 676: SRA_R	sra 	%r23, %r0, %r25
	.word 0xf6758000  ! 679: STX_R	stx	%r27, [%r22 + %r0]
	setx	data_start_7, %g1, %r23
	.word 0xf82ce159  ! 683: STB_I	stb	%r28, [%r19 + 0x0159]
	.word 0xf63c0000  ! 684: STD_R	std	%r27, [%r16 + %r0]
	.word 0xb7342001  ! 685: SRL_I	srl 	%r16, 0x0001, %r27
	mov	1, %r12
	.word 0x8f930000  ! 686: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc2de18f  ! 697: STB_I	stb	%r30, [%r23 + 0x018f]
	.word 0xfa2da062  ! 703: STB_I	stb	%r29, [%r22 + 0x0062]
	setx	data_start_7, %g1, %r16
	.word 0xbb518000  ! 709: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xfe344000  ! 710: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xbcc50000  ! 711: ADDCcc_R	addccc 	%r20, %r0, %r30
	.word 0xb92db001  ! 713: SLLX_I	sllx	%r22, 0x0001, %r28
	.word 0xf83d8000  ! 717: STD_R	std	%r28, [%r22 + %r0]
	.word 0xbf500000  ! 719: RDPR_TPC	<illegal instruction>
	.word 0xf33d20f4  ! 720: STDF_I	std	%f25, [0x00f4, %r20]
	mov	1, %r12
	.word 0x8f930000  ! 721: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb21c8000  ! 726: XOR_R	xor 	%r18, %r0, %r25
	.word 0xfa3c212e  ! 729: STD_I	std	%r29, [%r16 + 0x012e]
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, b)
	.word 0xb424e0af  ! 739: SUB_I	sub 	%r19, 0x00af, %r26
	.word 0xfc3d4000  ! 741: STD_R	std	%r30, [%r21 + %r0]
	.word 0xf43d8000  ! 742: STD_R	std	%r26, [%r22 + %r0]
	.word 0xfa74a1e6  ! 743: STX_I	stx	%r29, [%r18 + 0x01e6]
	.word 0xb69c6190  ! 749: XORcc_I	xorcc 	%r17, 0x0190, %r27
	.word 0xf225a076  ! 752: STW_I	stw	%r25, [%r22 + 0x0076]
	.word 0xfa2520cb  ! 754: STW_I	stw	%r29, [%r20 + 0x00cb]
	.word 0xbc2c6171  ! 755: ANDN_I	andn 	%r17, 0x0171, %r30
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 26)
	.word 0xf73ca1a4  ! 757: STDF_I	std	%f27, [0x01a4, %r18]
	.word 0xb5540000  ! 758: RDPR_GL	rdpr	%-, %r26
	.word 0xf475a079  ! 762: STX_I	stx	%r26, [%r22 + 0x0079]
	.word 0xb2a58000  ! 764: SUBcc_R	subcc 	%r22, %r0, %r25
	.word 0xf6250000  ! 766: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xf8748000  ! 767: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xb42cc000  ! 769: ANDN_R	andn 	%r19, %r0, %r26
	.word 0xf73d60e6  ! 772: STDF_I	std	%f27, [0x00e6, %r21]
	.word 0xb5504000  ! 776: RDPR_TNPC	<illegal instruction>
	.word 0x8994a06b  ! 777: WRPR_TICK_I	wrpr	%r18, 0x006b, %tick
	.word 0xb5520000  ! 780: RDPR_PIL	rdpr	%pil, %r26
	.word 0x8d94a024  ! 782: WRPR_PSTATE_I	wrpr	%r18, 0x0024, %pstate
	.word 0xf42d61e5  ! 787: STB_I	stb	%r26, [%r21 + 0x01e5]
	.word 0xfc3ca1e9  ! 788: STD_I	std	%r30, [%r18 + 0x01e9]
	.word 0xb1518000  ! 790: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0x9194a1c2  ! 794: WRPR_PIL_I	wrpr	%r18, 0x01c2, %pil
	.word 0xb3520000  ! 795: RDPR_PIL	rdpr	%pil, %r25
	.word 0x85956083  ! 797: WRPR_TSTATE_I	wrpr	%r21, 0x0083, %tstate
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 3)
	.word 0xb8bcc000  ! 807: XNORcc_R	xnorcc 	%r19, %r0, %r28
	.word 0xfe340000  ! 808: STH_R	sth	%r31, [%r16 + %r0]
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 28)
	.word 0xfb3d8000  ! 814: STDF_R	std	%f29, [%r0, %r22]
	.word 0xf6254000  ! 820: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xfa354000  ! 823: STH_R	sth	%r29, [%r21 + %r0]
	.word 0x8794a123  ! 824: WRPR_TT_I	wrpr	%r18, 0x0123, %tt
	.word 0xb5518000  ! 825: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xfc3ce1ab  ! 826: STD_I	std	%r30, [%r19 + 0x01ab]
	setx	data_start_0, %g1, %r18
	setx	0xff1ea44600009c00, %g1, %r10
	.word 0x819a8000  ! 831: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf4254000  ! 838: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf03ce165  ! 840: STD_I	std	%r24, [%r19 + 0x0165]
	.word 0xf2742021  ! 845: STX_I	stx	%r25, [%r16 + 0x0021]
	mov	0, %r12
	.word 0x8f930000  ! 846: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x7239208a00000e54, %g1, %r10
	.word 0x839a8000  ! 847: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf6742107  ! 854: STX_I	stx	%r27, [%r16 + 0x0107]
	setx	data_start_7, %g1, %r20
	.word 0xf02de159  ! 858: STB_I	stb	%r24, [%r23 + 0x0159]
	.word 0xfa74e1d1  ! 859: STX_I	stx	%r29, [%r19 + 0x01d1]
	.word 0xf43cc000  ! 860: STD_R	std	%r26, [%r19 + %r0]
	.word 0xbb508000  ! 861: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf23c0000  ! 869: STD_R	std	%r25, [%r16 + %r0]
	.word 0xbd3c8000  ! 871: SRA_R	sra 	%r18, %r0, %r30
	.word 0x8194a0e2  ! 880: WRPR_TPC_I	wrpr	%r18, 0x00e2, %tpc
	.word 0xfe3dc000  ! 881: STD_R	std	%r31, [%r23 + %r0]
	.word 0xf825e0ff  ! 882: STW_I	stw	%r28, [%r23 + 0x00ff]
	.word 0x8994e106  ! 889: WRPR_TICK_I	wrpr	%r19, 0x0106, %tick
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 1f)
	.word 0x899461a7  ! 895: WRPR_TICK_I	wrpr	%r17, 0x01a7, %tick
	.word 0x8595202c  ! 896: WRPR_TSTATE_I	wrpr	%r20, 0x002c, %tstate
	.word 0x8994e1f5  ! 898: WRPR_TICK_I	wrpr	%r19, 0x01f5, %tick
	.word 0xf83d4000  ! 900: STD_R	std	%r28, [%r21 + %r0]
	.word 0x8594215b  ! 901: WRPR_TSTATE_I	wrpr	%r16, 0x015b, %tstate
	mov	1, %r12
	.word 0x8f930000  ! 904: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf8352101  ! 906: STH_I	sth	%r28, [%r20 + 0x0101]
	.word 0x81946178  ! 910: WRPR_TPC_I	wrpr	%r17, 0x0178, %tpc
	.word 0x919461bb  ! 912: WRPR_PIL_I	wrpr	%r17, 0x01bb, %pil
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf13ce099  ! 916: STDF_I	std	%f24, [0x0099, %r19]
	.word 0xf73da1ee  ! 917: STDF_I	std	%f27, [0x01ee, %r22]
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 15)
	.word 0xf03dc000  ! 923: STD_R	std	%r24, [%r23 + %r0]
	.word 0xfe2c0000  ! 924: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xb9540000  ! 928: RDPR_GL	rdpr	%-, %r28
	.word 0xfe3cc000  ! 929: STD_R	std	%r31, [%r19 + %r0]
	.word 0x85942050  ! 930: WRPR_TSTATE_I	wrpr	%r16, 0x0050, %tstate
	.word 0xfa3cc000  ! 932: STD_R	std	%r29, [%r19 + %r0]
	.word 0xbea58000  ! 933: SUBcc_R	subcc 	%r22, %r0, %r31
	.word 0xfc3d607b  ! 934: STD_I	std	%r30, [%r21 + 0x007b]
	mov	2, %r12
	.word 0x8f930000  ! 935: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8395a03a  ! 936: WRPR_TNPC_I	wrpr	%r22, 0x003a, %tnpc
	.word 0xf2350000  ! 942: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xbb510000  ! 946: RDPR_TICK	rdpr	%tick, %r29
	.word 0xbcaca021  ! 948: ANDNcc_I	andncc 	%r18, 0x0021, %r30
	.word 0xb49ca117  ! 950: XORcc_I	xorcc 	%r18, 0x0117, %r26
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 20)
	.word 0xf83d4000  ! 954: STD_R	std	%r28, [%r21 + %r0]
	.word 0xf074e11a  ! 956: STX_I	stx	%r24, [%r19 + 0x011a]
	.word 0xb28d4000  ! 959: ANDcc_R	andcc 	%r21, %r0, %r25
	.word 0x8d95a14c  ! 962: WRPR_PSTATE_I	wrpr	%r22, 0x014c, %pstate
	.word 0xf83de13e  ! 963: STD_I	std	%r28, [%r23 + 0x013e]
	.word 0xf2758000  ! 964: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xb7540000  ! 966: RDPR_GL	rdpr	%-, %r27
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, 16)
	.word 0xb9510000  ! 969: RDPR_TICK	<illegal instruction>
	.word 0xf6248000  ! 971: STW_R	stw	%r27, [%r18 + %r0]
	.word 0x8994a197  ! 972: WRPR_TICK_I	wrpr	%r18, 0x0197, %tick
	.word 0x81952005  ! 974: WRPR_TPC_I	wrpr	%r20, 0x0005, %tpc
	mov	2, %r12
	.word 0xa1930000  ! 979: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe3c6036  ! 981: STD_I	std	%r31, [%r17 + 0x0036]
	.word 0xf82cc000  ! 982: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xf13c6010  ! 983: STDF_I	std	%f24, [0x0010, %r17]
	.word 0xb9510000  ! 984: RDPR_TICK	rdpr	%tick, %r28
	.word 0xb0452091  ! 987: ADDC_I	addc 	%r20, 0x0091, %r24
	.word 0xfe2da101  ! 989: STB_I	stb	%r31, [%r22 + 0x0101]
	.word 0xfa744000  ! 991: STX_R	stx	%r29, [%r17 + %r0]
hwintr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_45), 16, 16)) -> intp(3, 0, 31)
	.word 0xf834c000  ! 998: STH_R	sth	%r28, [%r19 + %r0]
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
	.word 0xbaa56094  ! 1: SUBcc_I	subcc 	%r21, 0x0094, %r29
	.word 0xb17dc400  ! 2: MOVR_R	movre	%r23, %r0, %r24
	.word 0xfa454000  ! 10: LDSW_R	ldsw	[%r21 + %r0], %r29
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 36)
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 24)
	.word 0xf0040000  ! 15: LDUW_R	lduw	[%r16 + %r0], %r24
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 12)
	.word 0xb6bce093  ! 18: XNORcc_I	xnorcc 	%r19, 0x0093, %r27
	.word 0x8395a1ba  ! 19: WRPR_TNPC_I	wrpr	%r22, 0x01ba, %tnpc
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 7)
	.word 0xfc4c0000  ! 23: LDSB_R	ldsb	[%r16 + %r0], %r30
	setx	0x9a194c3c0000098d, %g1, %r10
	.word 0x819a8000  ! 24: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc1c0000  ! 25: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xf20d6047  ! 27: LDUB_I	ldub	[%r21 + 0x0047], %r25
	mov	2, %r12
	.word 0x8f930000  ! 28: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf05d20b5  ! 31: LDX_I	ldx	[%r20 + 0x00b5], %r24
	.word 0xbb520000  ! 39: RDPR_PIL	<illegal instruction>
	setx	0xb4a948e400009844, %g1, %r10
	.word 0x819a8000  ! 40: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3504000  ! 42: RDPR_TNPC	<illegal instruction>
	.word 0xbd500000  ! 43: RDPR_TPC	<illegal instruction>
	.word 0xb32cb001  ! 44: SLLX_I	sllx	%r18, 0x0001, %r25
	.word 0x839421c9  ! 45: WRPR_TNPC_I	wrpr	%r16, 0x01c9, %tnpc
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 22)
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 2d)
	.word 0x879520c0  ! 52: WRPR_TT_I	wrpr	%r20, 0x00c0, %tt
	.word 0xbe3c4000  ! 53: XNOR_R	xnor 	%r17, %r0, %r31
	setx	0x98f90a710000ddca, %g1, %r10
	.word 0x819a8000  ! 54: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc5c0000  ! 55: LDX_R	ldx	[%r16 + %r0], %r30
	.word 0xf61ca1c2  ! 56: LDD_I	ldd	[%r18 + 0x01c2], %r27
	.word 0xbf50c000  ! 58: RDPR_TT	<illegal instruction>
	.word 0xfe5c2141  ! 59: LDX_I	ldx	[%r16 + 0x0141], %r31
	.word 0xb2b4e0e6  ! 62: ORNcc_I	orncc 	%r19, 0x00e6, %r25
	.word 0xf65d0000  ! 63: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xb7518000  ! 70: RDPR_PSTATE	<illegal instruction>
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 6)
	.word 0xbf518000  ! 77: RDPR_PSTATE	<illegal instruction>
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 9)
	.word 0xf25c610c  ! 79: LDX_I	ldx	[%r17 + 0x010c], %r25
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 24)
	.word 0xb1343001  ! 88: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xfc4c8000  ! 94: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xb5510000  ! 102: RDPR_TICK	<illegal instruction>
	.word 0xbf3cd000  ! 103: SRAX_R	srax	%r19, %r0, %r31
	.word 0xfe4de038  ! 107: LDSB_I	ldsb	[%r23 + 0x0038], %r31
	.word 0xfa5420fc  ! 108: LDSH_I	ldsh	[%r16 + 0x00fc], %r29
	.word 0xf21ca16d  ! 110: LDD_I	ldd	[%r18 + 0x016d], %r25
	.word 0xf815e1ce  ! 111: LDUH_I	lduh	[%r23 + 0x01ce], %r28
	.word 0xf45d612f  ! 113: LDX_I	ldx	[%r21 + 0x012f], %r26
	.word 0xf20dc000  ! 115: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xfb1d20b8  ! 116: LDDF_I	ldd	[%r20, 0x00b8], %f29
	.word 0xfe4d8000  ! 118: LDSB_R	ldsb	[%r22 + %r0], %r31
	.word 0xf84ca05d  ! 119: LDSB_I	ldsb	[%r18 + 0x005d], %r28
	.word 0xbb51c000  ! 120: RDPR_TL	<illegal instruction>
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 1d)
	.word 0xbcace1be  ! 124: ANDNcc_I	andncc 	%r19, 0x01be, %r30
	.word 0xf41c4000  ! 125: LDD_R	ldd	[%r17 + %r0], %r26
	.word 0xfe5c6065  ! 130: LDX_I	ldx	[%r17 + 0x0065], %r31
	.word 0xf20cc000  ! 132: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xfc452032  ! 133: LDSW_I	ldsw	[%r20 + 0x0032], %r30
	.word 0xf8450000  ! 134: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xb7508000  ! 135: RDPR_TSTATE	<illegal instruction>
	.word 0xb33cf001  ! 138: SRAX_I	srax	%r19, 0x0001, %r25
	.word 0xbd518000  ! 143: RDPR_PSTATE	<illegal instruction>
	.word 0x8d94600f  ! 145: WRPR_PSTATE_I	wrpr	%r17, 0x000f, %pstate
	.word 0xf41d61e4  ! 148: LDD_I	ldd	[%r21 + 0x01e4], %r26
	.word 0xf4440000  ! 152: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xfe0cc000  ! 154: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xf0058000  ! 156: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xfa5ca005  ! 159: LDX_I	ldx	[%r18 + 0x0005], %r29
	.word 0xb3540000  ! 160: RDPR_GL	rdpr	%-, %r25
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, e)
	.word 0xf64d2161  ! 164: LDSB_I	ldsb	[%r20 + 0x0161], %r27
	.word 0xb294c000  ! 165: ORcc_R	orcc 	%r19, %r0, %r25
	setx	0xb06d392e00001f1c, %g1, %r10
	.word 0x819a8000  ! 166: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf444209f  ! 168: LDSW_I	ldsw	[%r16 + 0x009f], %r26
	.word 0xf61d4000  ! 170: LDD_R	ldd	[%r21 + %r0], %r27
	mov	2, %r12
	.word 0x8f930000  ! 171: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa4da04a  ! 173: LDSB_I	ldsb	[%r22 + 0x004a], %r29
	.word 0xf51de02d  ! 175: LDDF_I	ldd	[%r23, 0x002d], %f26
	.word 0xf71d8000  ! 179: LDDF_R	ldd	[%r22, %r0], %f27
	.word 0xb8b521a7  ! 183: SUBCcc_I	orncc 	%r20, 0x01a7, %r28
	.word 0xb5520000  ! 188: RDPR_PIL	<illegal instruction>
	setx	0xfe997910000058c6, %g1, %r10
	.word 0x839a8000  ! 189: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf00d4000  ! 190: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xfe4dc000  ! 194: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xf25d601e  ! 197: LDX_I	ldx	[%r21 + 0x001e], %r25
	.word 0x8795a1ca  ! 201: WRPR_TT_I	wrpr	%r22, 0x01ca, %tt
	.word 0xf11c0000  ! 203: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xb7480000  ! 204: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb2344000  ! 207: ORN_R	orn 	%r17, %r0, %r25
	.word 0xb7518000  ! 209: RDPR_PSTATE	<illegal instruction>
	.word 0xb83c8000  ! 210: XNOR_R	xnor 	%r18, %r0, %r28
	.word 0x8d9460f9  ! 212: WRPR_PSTATE_I	wrpr	%r17, 0x00f9, %pstate
	.word 0xb53da001  ! 218: SRA_I	sra 	%r22, 0x0001, %r26
	.word 0xb3641800  ! 219: MOVcc_R	<illegal instruction>
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 21)
	.word 0xfa15a188  ! 222: LDUH_I	lduh	[%r22 + 0x0188], %r29
	mov	1, %r12
	.word 0xa1930000  ! 223: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x879561a1  ! 224: WRPR_TT_I	wrpr	%r21, 0x01a1, %tt
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 0)
	.word 0xba2dc000  ! 226: ANDN_R	andn 	%r23, %r0, %r29
	.word 0xf21da02e  ! 228: LDD_I	ldd	[%r22 + 0x002e], %r25
	.word 0xf205201c  ! 230: LDUW_I	lduw	[%r20 + 0x001c], %r25
	.word 0xfc54205e  ! 231: LDSH_I	ldsh	[%r16 + 0x005e], %r30
	.word 0xf414e1c6  ! 232: LDUH_I	lduh	[%r19 + 0x01c6], %r26
	.word 0xfe150000  ! 235: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xf11da1c8  ! 237: LDDF_I	ldd	[%r22, 0x01c8], %f24
	.word 0xb1510000  ! 238: RDPR_TICK	<illegal instruction>
	.word 0xf415e0e6  ! 239: LDUH_I	lduh	[%r23 + 0x00e6], %r26
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf25dc000  ! 243: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0xfb1d0000  ! 246: LDDF_R	ldd	[%r20, %r0], %f29
	.word 0xfe4520a7  ! 248: LDSW_I	ldsw	[%r20 + 0x00a7], %r31
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 13)
	.word 0xbb520000  ! 251: RDPR_PIL	<illegal instruction>
	setx	0xf33a328100006d59, %g1, %r10
	.word 0x819a8000  ! 252: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf25da00d  ! 254: LDX_I	ldx	[%r22 + 0x000d], %r25
	.word 0xb9480000  ! 256: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x859560a9  ! 257: WRPR_TSTATE_I	wrpr	%r21, 0x00a9, %tstate
	.word 0xf815610f  ! 262: LDUH_I	lduh	[%r21 + 0x010f], %r28
	.word 0xf80dc000  ! 263: LDUB_R	ldub	[%r23 + %r0], %r28
	setx	0xb27cf0580000184f, %g1, %r10
	.word 0x819a8000  ! 264: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf4050000  ! 267: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xfa0ce155  ! 275: LDUB_I	ldub	[%r19 + 0x0155], %r29
	.word 0xb7518000  ! 282: RDPR_PSTATE	<illegal instruction>
	.word 0xfc140000  ! 284: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0x8194a12e  ! 285: WRPR_TPC_I	wrpr	%r18, 0x012e, %tpc
	.word 0xb8254000  ! 288: SUB_R	sub 	%r21, %r0, %r28
	.word 0xf014e18a  ! 292: LDUH_I	lduh	[%r19 + 0x018a], %r24
	.word 0xf215a057  ! 293: LDUH_I	lduh	[%r22 + 0x0057], %r25
	.word 0xbf510000  ! 295: RDPR_TICK	<illegal instruction>
	.word 0xf444a125  ! 296: LDSW_I	ldsw	[%r18 + 0x0125], %r26
	.word 0xbb540000  ! 298: RDPR_GL	<illegal instruction>
	.word 0xfc1c0000  ! 299: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xfd1ce10e  ! 300: LDDF_I	ldd	[%r19, 0x010e], %f30
	.word 0xf0556004  ! 302: LDSH_I	ldsh	[%r21 + 0x0004], %r24
	.word 0xf6046122  ! 304: LDUW_I	lduw	[%r17 + 0x0122], %r27
	.word 0x9194e09d  ! 306: WRPR_PIL_I	wrpr	%r19, 0x009d, %pil
	.word 0xfa1d4000  ! 310: LDD_R	ldd	[%r21 + %r0], %r29
	.word 0xb4a5c000  ! 313: SUBcc_R	subcc 	%r23, %r0, %r26
	setx	data_start_2, %g1, %r17
	.word 0xf41c6064  ! 319: LDD_I	ldd	[%r17 + 0x0064], %r26
	.word 0x879561b3  ! 321: WRPR_TT_I	wrpr	%r21, 0x01b3, %tt
	.word 0xb1504000  ! 328: RDPR_TNPC	<illegal instruction>
	.word 0xfc44e0ce  ! 330: LDSW_I	ldsw	[%r19 + 0x00ce], %r30
	.word 0xfe45c000  ! 333: LDSW_R	ldsw	[%r23 + %r0], %r31
	mov	2, %r12
	.word 0x8f930000  ! 334: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf204a0aa  ! 336: LDUW_I	lduw	[%r18 + 0x00aa], %r25
	.word 0xf605a088  ! 338: LDUW_I	lduw	[%r22 + 0x0088], %r27
	.word 0x8195a1ce  ! 340: WRPR_TPC_I	wrpr	%r22, 0x01ce, %tpc
	.word 0xf01c6179  ! 341: LDD_I	ldd	[%r17 + 0x0179], %r24
	.word 0xf71cc000  ! 344: LDDF_R	ldd	[%r19, %r0], %f27
	.word 0x8995a0d7  ! 345: WRPR_TICK_I	wrpr	%r22, 0x00d7, %tick
	.word 0x8795e18c  ! 347: WRPR_TT_I	wrpr	%r23, 0x018c, %tt
	setx	data_start_2, %g1, %r18
	.word 0xbb508000  ! 350: RDPR_TSTATE	<illegal instruction>
	.word 0xf44cc000  ! 351: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xbb353001  ! 352: SRLX_I	srlx	%r20, 0x0001, %r29
	.word 0xf04c6171  ! 354: LDSB_I	ldsb	[%r17 + 0x0171], %r24
	.word 0xb415c000  ! 356: OR_R	or 	%r23, %r0, %r26
	.word 0xf40c8000  ! 364: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xf45d8000  ! 366: LDX_R	ldx	[%r22 + %r0], %r26
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 11)
	.word 0xf41420c4  ! 368: LDUH_I	lduh	[%r16 + 0x00c4], %r26
	mov	2, %r12
	.word 0xa1930000  ! 375: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc44a057  ! 376: LDSW_I	ldsw	[%r18 + 0x0057], %r30
	.word 0x8d94605a  ! 377: WRPR_PSTATE_I	wrpr	%r17, 0x005a, %pstate
	.word 0xb0956131  ! 378: ORcc_I	orcc 	%r21, 0x0131, %r24
	.word 0x81952131  ! 379: WRPR_TPC_I	wrpr	%r20, 0x0131, %tpc
	.word 0xff1cc000  ! 388: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0xb751c000  ! 390: RDPR_TL	rdpr	%tl, %r27
	.word 0xb7643801  ! 391: MOVcc_I	<illegal instruction>
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 4)
	.word 0xb93ca001  ! 394: SRA_I	sra 	%r18, 0x0001, %r28
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 1)
	.word 0xf04de112  ! 396: LDSB_I	ldsb	[%r23 + 0x0112], %r24
	.word 0xf045c000  ! 397: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xfc540000  ! 398: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xf00460cf  ! 400: LDUW_I	lduw	[%r17 + 0x00cf], %r24
	.word 0xf81ca14c  ! 401: LDD_I	ldd	[%r18 + 0x014c], %r28
	.word 0xfc5d4000  ! 402: LDX_R	ldx	[%r21 + %r0], %r30
	.word 0xfb1d8000  ! 405: LDDF_R	ldd	[%r22, %r0], %f29
	.word 0xf91cc000  ! 409: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0xb42c8000  ! 413: ANDN_R	andn 	%r18, %r0, %r26
	.word 0xf2444000  ! 415: LDSW_R	ldsw	[%r17 + %r0], %r25
	setx	data_start_3, %g1, %r20
	.word 0xb6c58000  ! 426: ADDCcc_R	addccc 	%r22, %r0, %r27
	.word 0x819421de  ! 428: WRPR_TPC_I	wrpr	%r16, 0x01de, %tpc
	.word 0xfa1cc000  ! 432: LDD_R	ldd	[%r19 + %r0], %r29
	.word 0xb2358000  ! 436: ORN_R	orn 	%r22, %r0, %r25
	.word 0xfe048000  ! 438: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xf11d21d2  ! 439: LDDF_I	ldd	[%r20, 0x01d2], %f24
	.word 0xf2152199  ! 443: LDUH_I	lduh	[%r20 + 0x0199], %r25
	mov	0, %r12
	.word 0x8f930000  ! 445: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8d95e0fb  ! 448: WRPR_PSTATE_I	wrpr	%r23, 0x00fb, %pstate
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, e)
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 20)
	.word 0xf01c213e  ! 453: LDD_I	ldd	[%r16 + 0x013e], %r24
	.word 0xf11c4000  ! 456: LDDF_R	ldd	[%r17, %r0], %f24
	.word 0xfe458000  ! 458: LDSW_R	ldsw	[%r22 + %r0], %r31
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 34)
	.word 0xf25d6018  ! 460: LDX_I	ldx	[%r21 + 0x0018], %r25
	.word 0xb5518000  ! 462: RDPR_PSTATE	rdpr	%pstate, %r26
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 38)
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 19)
	setx	0x324aa2ee00003dcd, %g1, %r10
	.word 0x839a8000  ! 468: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf91c602e  ! 470: LDDF_I	ldd	[%r17, 0x002e], %f28
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 1b)
	.word 0x8794e0be  ! 476: WRPR_TT_I	wrpr	%r19, 0x00be, %tt
	.word 0xf20da004  ! 477: LDUB_I	ldub	[%r22 + 0x0004], %r25
	mov	0, %r12
	.word 0xa1930000  ! 479: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe55a056  ! 485: LDSH_I	ldsh	[%r22 + 0x0056], %r31
	.word 0xbf518000  ! 487: RDPR_PSTATE	<illegal instruction>
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, d)
	.word 0xfa144000  ! 490: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0x8995e012  ! 492: WRPR_TICK_I	wrpr	%r23, 0x0012, %tick
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, b)
	setx	0x6fb25cec0000f883, %g1, %r10
	.word 0x819a8000  ! 497: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc444000  ! 499: LDSW_R	ldsw	[%r17 + %r0], %r30
	.word 0xf405a06d  ! 501: LDUW_I	lduw	[%r22 + 0x006d], %r26
	.word 0x8195615a  ! 503: WRPR_TPC_I	wrpr	%r21, 0x015a, %tpc
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 36)
	.word 0xfe052011  ! 507: LDUW_I	lduw	[%r20 + 0x0011], %r31
	.word 0xb3520000  ! 508: RDPR_PIL	rdpr	%pil, %r25
	.word 0xf24c8000  ! 511: LDSB_R	ldsb	[%r18 + %r0], %r25
	.word 0xf51c210b  ! 512: LDDF_I	ldd	[%r16, 0x010b], %f26
	.word 0xfc44c000  ! 524: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xf85da138  ! 525: LDX_I	ldx	[%r22 + 0x0138], %r28
	.word 0xb2342087  ! 527: SUBC_I	orn 	%r16, 0x0087, %r25
	.word 0xb68ce02f  ! 528: ANDcc_I	andcc 	%r19, 0x002f, %r27
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 17)
	.word 0xb41d0000  ! 533: XOR_R	xor 	%r20, %r0, %r26
	.word 0xfc1d4000  ! 534: LDD_R	ldd	[%r21 + %r0], %r30
	.word 0xbb504000  ! 536: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xf01c4000  ! 544: LDD_R	ldd	[%r17 + %r0], %r24
	.word 0xfc4de0e6  ! 549: LDSB_I	ldsb	[%r23 + 0x00e6], %r30
	.word 0xb6452083  ! 550: ADDC_I	addc 	%r20, 0x0083, %r27
	.word 0xbf643801  ! 551: MOVcc_I	<illegal instruction>
	.word 0xbb51c000  ! 552: RDPR_TL	<illegal instruction>
	.word 0xbf500000  ! 553: RDPR_TPC	<illegal instruction>
	.word 0xbb480000  ! 554: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 1f)
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 19)
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 28)
	.word 0xf4448000  ! 562: LDSW_R	ldsw	[%r18 + %r0], %r26
	.word 0xf615e087  ! 567: LDUH_I	lduh	[%r23 + 0x0087], %r27
	.word 0xf60c4000  ! 570: LDUB_R	ldub	[%r17 + %r0], %r27
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 28)
	.word 0xfa5c0000  ! 573: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xb3518000  ! 574: RDPR_PSTATE	<illegal instruction>
	.word 0xfe1d60f8  ! 577: LDD_I	ldd	[%r21 + 0x00f8], %r31
	.word 0xb351c000  ! 579: RDPR_TL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 580: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa0d8000  ! 581: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xf845e031  ! 582: LDSW_I	ldsw	[%r23 + 0x0031], %r28
	.word 0x8d94e050  ! 584: WRPR_PSTATE_I	wrpr	%r19, 0x0050, %pstate
	.word 0xfc5d0000  ! 585: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0xfe4c21e1  ! 586: LDSB_I	ldsb	[%r16 + 0x01e1], %r31
	.word 0xbb480000  ! 587: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	mov	0, %r12
	.word 0xa1930000  ! 588: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb4bd0000  ! 589: XNORcc_R	xnorcc 	%r20, %r0, %r26
	.word 0xfe554000  ! 590: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xb350c000  ! 592: RDPR_TT	<illegal instruction>
	.word 0xb7500000  ! 595: RDPR_TPC	<illegal instruction>
	.word 0xb3500000  ! 596: RDPR_TPC	<illegal instruction>
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, a)
	.word 0xfe548000  ! 602: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xb751c000  ! 603: RDPR_TL	<illegal instruction>
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 37)
	.word 0xf65c8000  ! 612: LDX_R	ldx	[%r18 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb43ca1e2  ! 615: XNOR_I	xnor 	%r18, 0x01e2, %r26
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 3c)
	.word 0xbcac20b3  ! 621: ANDNcc_I	andncc 	%r16, 0x00b3, %r30
	.word 0xf04da137  ! 623: LDSB_I	ldsb	[%r22 + 0x0137], %r24
	.word 0xf25d6042  ! 626: LDX_I	ldx	[%r21 + 0x0042], %r25
	.word 0xb424e0fb  ! 627: SUB_I	sub 	%r19, 0x00fb, %r26
	.word 0xbab56054  ! 631: SUBCcc_I	orncc 	%r21, 0x0054, %r29
	.word 0xf8544000  ! 634: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xfe4d4000  ! 635: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xb0a40000  ! 641: SUBcc_R	subcc 	%r16, %r0, %r24
	.word 0xf0150000  ! 642: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xba040000  ! 646: ADD_R	add 	%r16, %r0, %r29
	.word 0xf4158000  ! 650: LDUH_R	lduh	[%r22 + %r0], %r26
	.word 0x919421cd  ! 651: WRPR_PIL_I	wrpr	%r16, 0x01cd, %pil
	.word 0x8794a088  ! 654: WRPR_TT_I	wrpr	%r18, 0x0088, %tt
	.word 0x83946032  ! 657: WRPR_TNPC_I	wrpr	%r17, 0x0032, %tnpc
	.word 0xb9500000  ! 660: RDPR_TPC	<illegal instruction>
	.word 0xf6552149  ! 661: LDSH_I	ldsh	[%r20 + 0x0149], %r27
	.word 0xfc54e041  ! 667: LDSH_I	ldsh	[%r19 + 0x0041], %r30
	.word 0xfc14203e  ! 668: LDUH_I	lduh	[%r16 + 0x003e], %r30
	.word 0xbf518000  ! 669: RDPR_PSTATE	<illegal instruction>
	.word 0xf24cc000  ! 671: LDSB_R	ldsb	[%r19 + %r0], %r25
	.word 0xbb518000  ! 675: RDPR_PSTATE	<illegal instruction>
	.word 0xbd3cc000  ! 676: SRA_R	sra 	%r19, %r0, %r30
	.word 0xfb1d61ce  ! 677: LDDF_I	ldd	[%r21, 0x01ce], %f29
	setx	data_start_3, %g1, %r22
	.word 0xb934a001  ! 685: SRL_I	srl 	%r18, 0x0001, %r28
	mov	0, %r12
	.word 0x8f930000  ! 686: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe44e058  ! 692: LDSW_I	ldsw	[%r19 + 0x0058], %r31
	.word 0xf2052034  ! 694: LDUW_I	lduw	[%r20 + 0x0034], %r25
	.word 0xf44d2020  ! 696: LDSB_I	ldsb	[%r20 + 0x0020], %r26
	.word 0xfc446125  ! 700: LDSW_I	ldsw	[%r17 + 0x0125], %r30
	.word 0xf01c213f  ! 701: LDD_I	ldd	[%r16 + 0x013f], %r24
	setx	data_start_0, %g1, %r20
	.word 0xf31ce154  ! 706: LDDF_I	ldd	[%r19, 0x0154], %f25
	.word 0xbf518000  ! 709: RDPR_PSTATE	<illegal instruction>
	.word 0xb4c50000  ! 711: ADDCcc_R	addccc 	%r20, %r0, %r26
	.word 0xb92d7001  ! 713: SLLX_I	sllx	%r21, 0x0001, %r28
	.word 0xf4148000  ! 716: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xb7500000  ! 719: RDPR_TPC	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 721: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfe0d0000  ! 724: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0xb41c0000  ! 726: XOR_R	xor 	%r16, %r0, %r26
	.word 0xfc0ce110  ! 728: LDUB_I	ldub	[%r19 + 0x0110], %r30
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, a)
	.word 0xf844e055  ! 734: LDSW_I	ldsw	[%r19 + 0x0055], %r28
	.word 0xf01ce0ce  ! 735: LDD_I	ldd	[%r19 + 0x00ce], %r24
	.word 0xfa150000  ! 737: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xb62521d5  ! 739: SUB_I	sub 	%r20, 0x01d5, %r27
	.word 0xfe0ce0b6  ! 740: LDUB_I	ldub	[%r19 + 0x00b6], %r31
	.word 0xf455e008  ! 744: LDSH_I	ldsh	[%r23 + 0x0008], %r26
	.word 0xf6544000  ! 747: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xbc9ce05c  ! 749: XORcc_I	xorcc 	%r19, 0x005c, %r30
	.word 0xba2ca033  ! 755: ANDN_I	andn 	%r18, 0x0033, %r29
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 6)
	.word 0xb9540000  ! 758: RDPR_GL	<illegal instruction>
	.word 0xf01561c2  ! 760: LDUH_I	lduh	[%r21 + 0x01c2], %r24
	.word 0xf2542049  ! 761: LDSH_I	ldsh	[%r16 + 0x0049], %r25
	.word 0xb8a58000  ! 764: SUBcc_R	subcc 	%r22, %r0, %r28
	.word 0xf84d0000  ! 768: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0xb42d0000  ! 769: ANDN_R	andn 	%r20, %r0, %r26
	.word 0xfc4d8000  ! 774: LDSB_R	ldsb	[%r22 + %r0], %r30
	.word 0xbd504000  ! 776: RDPR_TNPC	<illegal instruction>
	.word 0x899561ba  ! 777: WRPR_TICK_I	wrpr	%r21, 0x01ba, %tick
	.word 0xf0158000  ! 778: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xb7520000  ! 780: RDPR_PIL	<illegal instruction>
	.word 0xfc1d8000  ! 781: LDD_R	ldd	[%r22 + %r0], %r30
	.word 0x8d94a072  ! 782: WRPR_PSTATE_I	wrpr	%r18, 0x0072, %pstate
	.word 0xb1518000  ! 790: RDPR_PSTATE	<illegal instruction>
	.word 0xfc0d61e0  ! 791: LDUB_I	ldub	[%r21 + 0x01e0], %r30
	.word 0xf01dc000  ! 792: LDD_R	ldd	[%r23 + %r0], %r24
	.word 0xf614c000  ! 793: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0x9195e019  ! 794: WRPR_PIL_I	wrpr	%r23, 0x0019, %pil
	.word 0xb1520000  ! 795: RDPR_PIL	<illegal instruction>
	.word 0x8595e06a  ! 797: WRPR_TSTATE_I	wrpr	%r23, 0x006a, %tstate
	.word 0xf614a06e  ! 799: LDUH_I	lduh	[%r18 + 0x006e], %r27
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf2052040  ! 801: LDUW_I	lduw	[%r20 + 0x0040], %r25
	.word 0xf25c0000  ! 802: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xfd1cc000  ! 803: LDDF_R	ldd	[%r19, %r0], %f30
	.word 0xf245a044  ! 804: LDSW_I	ldsw	[%r22 + 0x0044], %r25
	.word 0xf31d8000  ! 805: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0xb0bc4000  ! 807: XNORcc_R	xnorcc 	%r17, %r0, %r24
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf85c21f5  ! 811: LDX_I	ldx	[%r16 + 0x01f5], %r28
	.word 0xf404a035  ! 813: LDUW_I	lduw	[%r18 + 0x0035], %r26
	.word 0xf01ce0b0  ! 815: LDD_I	ldd	[%r19 + 0x00b0], %r24
	.word 0xfa1c4000  ! 816: LDD_R	ldd	[%r17 + %r0], %r29
	.word 0xfa0c20ff  ! 821: LDUB_I	ldub	[%r16 + 0x00ff], %r29
	.word 0xfa14e065  ! 822: LDUH_I	lduh	[%r19 + 0x0065], %r29
	.word 0x8794a1c3  ! 824: WRPR_TT_I	wrpr	%r18, 0x01c3, %tt
	.word 0xbf518000  ! 825: RDPR_PSTATE	<illegal instruction>
	.word 0xfe55a05e  ! 827: LDSH_I	ldsh	[%r22 + 0x005e], %r31
	.word 0xf04c8000  ! 828: LDSB_R	ldsb	[%r18 + %r0], %r24
	setx	data_start_1, %g1, %r20
	.word 0xfc542086  ! 830: LDSH_I	ldsh	[%r16 + 0x0086], %r30
	setx	0xa7c5dc1a0000c814, %g1, %r10
	.word 0x819a8000  ! 831: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfb1de128  ! 833: LDDF_I	ldd	[%r23, 0x0128], %f29
	.word 0xfa14e06b  ! 834: LDUH_I	lduh	[%r19 + 0x006b], %r29
	.word 0xfc048000  ! 837: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xfc4d0000  ! 839: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xf80ca1a9  ! 844: LDUB_I	ldub	[%r18 + 0x01a9], %r28
	mov	0, %r12
	.word 0x8f930000  ! 846: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x2cb5542a00008bc9, %g1, %r10
	.word 0x839a8000  ! 847: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf85c0000  ! 852: LDX_R	ldx	[%r16 + %r0], %r28
	setx	data_start_6, %g1, %r20
	.word 0xf405e0dd  ! 857: LDUW_I	lduw	[%r23 + 0x00dd], %r26
	.word 0xb1508000  ! 861: RDPR_TSTATE	<illegal instruction>
	.word 0xf814c000  ! 865: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xb13c4000  ! 871: SRA_R	sra 	%r17, %r0, %r24
	.word 0xf00c0000  ! 877: LDUB_R	ldub	[%r16 + %r0], %r24
	.word 0x819420c1  ! 880: WRPR_TPC_I	wrpr	%r16, 0x00c1, %tpc
	.word 0xf21ca1cd  ! 887: LDD_I	ldd	[%r18 + 0x01cd], %r25
	.word 0x8994e0ea  ! 889: WRPR_TICK_I	wrpr	%r19, 0x00ea, %tick
	.word 0xfe04e06e  ! 890: LDUW_I	lduw	[%r19 + 0x006e], %r31
	.word 0xf855c000  ! 891: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xfa15a1b9  ! 893: LDUH_I	lduh	[%r22 + 0x01b9], %r29
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 34)
	.word 0x8994e0f2  ! 895: WRPR_TICK_I	wrpr	%r19, 0x00f2, %tick
	.word 0x859461bf  ! 896: WRPR_TSTATE_I	wrpr	%r17, 0x01bf, %tstate
	.word 0x89942016  ! 898: WRPR_TICK_I	wrpr	%r16, 0x0016, %tick
	.word 0xf445a1a7  ! 899: LDSW_I	ldsw	[%r22 + 0x01a7], %r26
	.word 0x8594a1f3  ! 901: WRPR_TSTATE_I	wrpr	%r18, 0x01f3, %tstate
	mov	1, %r12
	.word 0x8f930000  ! 904: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf8058000  ! 907: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xf2544000  ! 909: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0x8194210f  ! 910: WRPR_TPC_I	wrpr	%r16, 0x010f, %tpc
	.word 0x9195e137  ! 912: WRPR_PIL_I	wrpr	%r23, 0x0137, %pil
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf64d2038  ! 920: LDSB_I	ldsb	[%r20 + 0x0038], %r27
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 39)
	.word 0xbf540000  ! 928: RDPR_GL	<illegal instruction>
	.word 0x859461e4  ! 930: WRPR_TSTATE_I	wrpr	%r17, 0x01e4, %tstate
	.word 0xb8a44000  ! 933: SUBcc_R	subcc 	%r17, %r0, %r28
	mov	2, %r12
	.word 0x8f930000  ! 935: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8395e000  ! 936: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xfc04a04a  ! 944: LDUW_I	lduw	[%r18 + 0x004a], %r30
	.word 0xf31c8000  ! 945: LDDF_R	ldd	[%r18, %r0], %f25
	.word 0xbf510000  ! 946: RDPR_TICK	<illegal instruction>
	.word 0xb4ad2135  ! 948: ANDNcc_I	andncc 	%r20, 0x0135, %r26
	.word 0xb89ce083  ! 950: XORcc_I	xorcc 	%r19, 0x0083, %r28
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 39)
	.word 0xf64c0000  ! 958: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xb88d8000  ! 959: ANDcc_R	andcc 	%r22, %r0, %r28
	.word 0xf804e177  ! 961: LDUW_I	lduw	[%r19 + 0x0177], %r28
	.word 0x8d94e010  ! 962: WRPR_PSTATE_I	wrpr	%r19, 0x0010, %pstate
	.word 0xb7540000  ! 966: RDPR_GL	<illegal instruction>
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 2e)
	.word 0xb5510000  ! 969: RDPR_TICK	<illegal instruction>
	.word 0x8994e130  ! 972: WRPR_TICK_I	wrpr	%r19, 0x0130, %tick
	.word 0x819561c8  ! 974: WRPR_TPC_I	wrpr	%r21, 0x01c8, %tpc
	.word 0xfc0c0000  ! 977: LDUB_R	ldub	[%r16 + %r0], %r30
	mov	0, %r12
	.word 0xa1930000  ! 979: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe044000  ! 980: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xbf510000  ! 984: RDPR_TICK	<illegal instruction>
	.word 0xf44c2015  ! 986: LDSB_I	ldsb	[%r16 + 0x0015], %r26
	.word 0xbc45605e  ! 987: ADDC_I	addc 	%r21, 0x005e, %r30
	.word 0xf4144000  ! 990: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xfe5d4000  ! 994: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xf415c000  ! 996: LDUH_R	lduh	[%r23 + %r0], %r26
hwintr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_45), 16, 16)) -> intp(2, 0, 1b)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb6a5a13d  ! 1: SUBcc_I	subcc 	%r22, 0x013d, %r27
	.word 0xb37c8400  ! 2: MOVR_R	movre	%r18, %r0, %r25
	.word 0xb7ab8820  ! 5: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a88820  ! 7: FMOVLE	fmovs	%fcc1, %f0, %f28
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 32)
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 17)
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 5)
	.word 0xb0bce1f5  ! 18: XNORcc_I	xnorcc 	%r19, 0x01f5, %r24
	.word 0x839420cc  ! 19: WRPR_TNPC_I	wrpr	%r16, 0x00cc, %tnpc
	.word 0xb5a449a0  ! 20: FDIVs	fdivs	%f17, %f0, %f26
	.word 0xbdab4820  ! 21: FMOVCC	fmovs	%fcc1, %f0, %f30
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 25)
	setx	0x3413299b0000d8c4, %g1, %r10
	.word 0x819a8000  ! 24: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbda40820  ! 26: FADDs	fadds	%f16, %f0, %f30
	mov	0, %r12
	.word 0x8f930000  ! 28: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb3a00540  ! 33: FSQRTd	fsqrt	
	.word 0xbba00040  ! 38: FMOVd	fmovd	%f0, %f60
	.word 0xbd520000  ! 39: RDPR_PIL	<illegal instruction>
	setx	0x936459050000fad0, %g1, %r10
	.word 0x819a8000  ! 40: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7504000  ! 42: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 43: RDPR_TPC	<illegal instruction>
	.word 0xb12db001  ! 44: SLLX_I	sllx	%r22, 0x0001, %r24
	.word 0x8395e1ec  ! 45: WRPR_TNPC_I	wrpr	%r23, 0x01ec, %tnpc
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 8)
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, e)
	.word 0x8795e04a  ! 52: WRPR_TT_I	wrpr	%r23, 0x004a, %tt
	.word 0xb03c8000  ! 53: XNOR_R	xnor 	%r18, %r0, %r24
	setx	0xd1e10ccd00006dd8, %g1, %r10
	.word 0x819a8000  ! 54: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a4c960  ! 57: FMULq	dis not found

	.word 0xbf50c000  ! 58: RDPR_TT	<illegal instruction>
	.word 0xbfa40920  ! 61: FMULs	fmuls	%f16, %f0, %f31
	.word 0xbeb5a1ce  ! 62: ORNcc_I	orncc 	%r22, 0x01ce, %r31
	.word 0xb1aa8820  ! 64: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb1a4c9a0  ! 65: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xbf518000  ! 70: RDPR_PSTATE	<illegal instruction>
	.word 0xbda5c960  ! 71: FMULq	dis not found

hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 37)
	.word 0xb3a4c960  ! 74: FMULq	dis not found

	.word 0xbba409a0  ! 76: FDIVs	fdivs	%f16, %f0, %f29
	.word 0xb1518000  ! 77: RDPR_PSTATE	<illegal instruction>
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbdaa0820  ! 83: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00520  ! 84: FSQRTs	fsqrt	
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 20)
	.word 0xb934b001  ! 88: SRLX_I	srlx	%r18, 0x0001, %r28
	.word 0xb7a448a0  ! 89: FSUBs	fsubs	%f17, %f0, %f27
	.word 0xbba408c0  ! 92: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xb3510000  ! 102: RDPR_TICK	<illegal instruction>
	.word 0xb73d1000  ! 103: SRAX_R	srax	%r20, %r0, %r27
	.word 0xbda8c820  ! 106: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb951c000  ! 120: RDPR_TL	<illegal instruction>
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 11)
	.word 0xbeada191  ! 124: ANDNcc_I	andncc 	%r22, 0x0191, %r31
	.word 0xbd508000  ! 135: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa00540  ! 136: FSQRTd	fsqrt	
	.word 0xbb3cf001  ! 138: SRAX_I	srax	%r19, 0x0001, %r29
	.word 0xbfa54940  ! 139: FMULd	fmuld	%f52, %f0, %f62
	.word 0xb3518000  ! 143: RDPR_PSTATE	<illegal instruction>
	.word 0x8d946196  ! 145: WRPR_PSTATE_I	wrpr	%r17, 0x0196, %pstate
	.word 0xb9aa8820  ! 151: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbf540000  ! 160: RDPR_GL	<illegal instruction>
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 37)
	.word 0xbc948000  ! 165: ORcc_R	orcc 	%r18, %r0, %r30
	setx	0x9123b0ed0000a918, %g1, %r10
	.word 0x819a8000  ! 166: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbbabc820  ! 169: FMOVVC	fmovs	%fcc1, %f0, %f29
	mov	0, %r12
	.word 0x8f930000  ! 171: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1a94820  ! 181: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb5a409c0  ! 182: FDIVd	fdivd	%f16, %f0, %f26
	.word 0xb6b5a160  ! 183: SUBCcc_I	orncc 	%r22, 0x0160, %r27
	.word 0xb3520000  ! 188: RDPR_PIL	<illegal instruction>
	setx	0xfcfa33bd0000df48, %g1, %r10
	.word 0x839a8000  ! 189: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a00540  ! 192: FSQRTd	fsqrt	
	.word 0xbba80c20  ! 200: FMOVRLZ	dis not found

	.word 0x879460d8  ! 201: WRPR_TT_I	wrpr	%r17, 0x00d8, %tt
	.word 0xb9480000  ! 204: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 29)
	.word 0xbbab0820  ! 206: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xba350000  ! 207: ORN_R	orn 	%r20, %r0, %r29
	.word 0xb3518000  ! 209: RDPR_PSTATE	<illegal instruction>
	.word 0xbc3c0000  ! 210: XNOR_R	xnor 	%r16, %r0, %r30
	.word 0x8d946041  ! 212: WRPR_PSTATE_I	wrpr	%r17, 0x0041, %pstate
	.word 0xb9a8c820  ! 213: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb1a488e0  ! 214: FSUBq	dis not found

	.word 0xbfa80420  ! 215: FMOVRZ	dis not found

	.word 0xb93c2001  ! 218: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xb5641800  ! 219: MOVcc_R	<illegal instruction>
	.word 0xbba00560  ! 220: FSQRTq	fsqrt	
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 2e)
	mov	1, %r12
	.word 0xa1930000  ! 223: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8794213a  ! 224: WRPR_TT_I	wrpr	%r16, 0x013a, %tt
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 20)
	.word 0xb82d8000  ! 226: ANDN_R	andn 	%r22, %r0, %r28
	.word 0xb3a80420  ! 234: FMOVRZ	dis not found

	.word 0xb1510000  ! 238: RDPR_TICK	<illegal instruction>
	.word 0xb7a48940  ! 240: FMULd	fmuld	%f18, %f0, %f58
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb5a44940  ! 244: FMULd	fmuld	%f48, %f0, %f26
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 0)
	.word 0xb1520000  ! 251: RDPR_PIL	<illegal instruction>
	setx	0xf418e45500007801, %g1, %r10
	.word 0x819a8000  ! 252: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba40840  ! 255: FADDd	faddd	%f16, %f0, %f60
	.word 0xb5480000  ! 256: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x8594e1c4  ! 257: WRPR_TSTATE_I	wrpr	%r19, 0x01c4, %tstate
	.word 0xbba54940  ! 258: FMULd	fmuld	%f52, %f0, %f60
	.word 0xb3a8c820  ! 261: FMOVL	fmovs	%fcc1, %f0, %f25
	setx	0x708acf4f0000cf41, %g1, %r10
	.word 0x819a8000  ! 264: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3a00040  ! 266: FMOVd	fmovd	%f0, %f56
	.word 0xb7a00040  ! 269: FMOVd	fmovd	%f0, %f58
	.word 0xbda54920  ! 270: FMULs	fmuls	%f21, %f0, %f30
	.word 0xbfa80c20  ! 271: FMOVRLZ	dis not found

	.word 0xb9a90820  ! 274: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb7a94820  ! 278: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a00040  ! 280: FMOVd	fmovd	%f0, %f26
	.word 0xb3a80820  ! 281: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbf518000  ! 282: RDPR_PSTATE	<illegal instruction>
	.word 0x8194e0f6  ! 285: WRPR_TPC_I	wrpr	%r19, 0x00f6, %tpc
	.word 0xbfa00560  ! 286: FSQRTq	fsqrt	
	.word 0xbe258000  ! 288: SUB_R	sub 	%r22, %r0, %r31
	.word 0xb3a00540  ! 289: FSQRTd	fsqrt	
	.word 0xb9a80820  ! 291: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbda81c20  ! 294: FMOVRGEZ	dis not found

	.word 0xbb510000  ! 295: RDPR_TICK	<illegal instruction>
	.word 0xb9a84820  ! 297: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbf540000  ! 298: RDPR_GL	<illegal instruction>
	.word 0xbda00540  ! 305: FSQRTd	fsqrt	
	.word 0x91942031  ! 306: WRPR_PIL_I	wrpr	%r16, 0x0031, %pil
	.word 0xb3aa0820  ! 307: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb7a84820  ! 308: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a508e0  ! 312: FSUBq	dis not found

	.word 0xbca40000  ! 313: SUBcc_R	subcc 	%r16, %r0, %r30
	.word 0xb3a408e0  ! 315: FSUBq	dis not found

	setx	data_start_7, %g1, %r21
	.word 0xb5a90820  ! 320: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0x8794a1ae  ! 321: WRPR_TT_I	wrpr	%r18, 0x01ae, %tt
	.word 0xb7a00040  ! 322: FMOVd	fmovd	%f0, %f58
	.word 0xb7a81c20  ! 324: FMOVRGEZ	dis not found

	.word 0xbba00560  ! 325: FSQRTq	fsqrt	
	.word 0xb9a00520  ! 327: FSQRTs	fsqrt	
	.word 0xb9504000  ! 328: RDPR_TNPC	<illegal instruction>
	.word 0xbba4c840  ! 332: FADDd	faddd	%f50, %f0, %f60
	mov	1, %r12
	.word 0x8f930000  ! 334: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda00520  ! 337: FSQRTs	fsqrt	
	.word 0x81956174  ! 340: WRPR_TPC_I	wrpr	%r21, 0x0174, %tpc
	.word 0xb5a00520  ! 343: FSQRTs	fsqrt	
	.word 0x89946157  ! 345: WRPR_TICK_I	wrpr	%r17, 0x0157, %tick
	.word 0xb3a5c960  ! 346: FMULq	dis not found

	.word 0x8795a199  ! 347: WRPR_TT_I	wrpr	%r22, 0x0199, %tt
	.word 0xbda9c820  ! 348: FMOVVS	fmovs	%fcc1, %f0, %f30
	setx	data_start_6, %g1, %r20
	.word 0xb1508000  ! 350: RDPR_TSTATE	<illegal instruction>
	.word 0xb5347001  ! 352: SRLX_I	srlx	%r17, 0x0001, %r26
	.word 0xb3aa4820  ! 353: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbc144000  ! 356: OR_R	or 	%r17, %r0, %r30
	.word 0xbba50920  ! 357: FMULs	fmuls	%f20, %f0, %f29
	.word 0xb5a40920  ! 360: FMULs	fmuls	%f16, %f0, %f26
	.word 0xb1a5c820  ! 361: FADDs	fadds	%f23, %f0, %f24
	.word 0xbda81420  ! 363: FMOVRNZ	dis not found

hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 16)
	.word 0xb5a48960  ! 370: FMULq	dis not found

	mov	0, %r12
	.word 0xa1930000  ! 375: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8d952011  ! 377: WRPR_PSTATE_I	wrpr	%r20, 0x0011, %pstate
	.word 0xb294a0af  ! 378: ORcc_I	orcc 	%r18, 0x00af, %r25
	.word 0x8194205f  ! 379: WRPR_TPC_I	wrpr	%r16, 0x005f, %tpc
	.word 0xbfa9c820  ! 383: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb7a80820  ! 385: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbd51c000  ! 390: RDPR_TL	<illegal instruction>
	.word 0xbf643801  ! 391: MOVcc_I	<illegal instruction>
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 12)
	.word 0xb33c2001  ! 394: SRA_I	sra 	%r16, 0x0001, %r25
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 32)
	.word 0xb1abc820  ! 403: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb3a489a0  ! 404: FDIVs	fdivs	%f18, %f0, %f25
	.word 0xbba80820  ! 411: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb22c4000  ! 413: ANDN_R	andn 	%r17, %r0, %r25
	.word 0xb9a508a0  ! 414: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xbfa589c0  ! 416: FDIVd	fdivd	%f22, %f0, %f62
	setx	data_start_7, %g1, %r18
	.word 0xbfa44920  ! 422: FMULs	fmuls	%f17, %f0, %f31
	.word 0xb7a5c9e0  ! 423: FDIVq	dis not found

	.word 0xbfa90820  ! 424: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb9a588e0  ! 425: FSUBq	dis not found

	.word 0xb4c4c000  ! 426: ADDCcc_R	addccc 	%r19, %r0, %r26
	.word 0x8194e111  ! 428: WRPR_TPC_I	wrpr	%r19, 0x0111, %tpc
	.word 0xb1a00040  ! 431: FMOVd	fmovd	%f0, %f24
	.word 0xb9a44820  ! 435: FADDs	fadds	%f17, %f0, %f28
	.word 0xb235c000  ! 436: ORN_R	orn 	%r23, %r0, %r25
	.word 0xb9ab0820  ! 442: FMOVGU	fmovs	%fcc1, %f0, %f28
	mov	1, %r12
	.word 0x8f930000  ! 445: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8d94e039  ! 448: WRPR_PSTATE_I	wrpr	%r19, 0x0039, %pstate
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbba448a0  ! 450: FSUBs	fsubs	%f17, %f0, %f29
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, e)
	.word 0xb7aa8820  ! 455: FMOVG	fmovs	%fcc1, %f0, %f27
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 35)
	.word 0xbda80c20  ! 461: FMOVRLZ	dis not found

	.word 0xb1518000  ! 462: RDPR_PSTATE	<illegal instruction>
	.word 0xb9aa8820  ! 463: FMOVG	fmovs	%fcc1, %f0, %f28
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 17)
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 21)
	.word 0xb1a489c0  ! 466: FDIVd	fdivd	%f18, %f0, %f24
	setx	0xca3f57c000003d94, %g1, %r10
	.word 0x839a8000  ! 468: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3a00560  ! 469: FSQRTq	fsqrt	
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 18)
	.word 0x8795a1a1  ! 476: WRPR_TT_I	wrpr	%r22, 0x01a1, %tt
	mov	2, %r12
	.word 0xa1930000  ! 479: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfa88820  ! 480: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb7518000  ! 487: RDPR_PSTATE	<illegal instruction>
	.word 0xbba94820  ! 488: FMOVCS	fmovs	%fcc1, %f0, %f29
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 9)
	.word 0x8994e0e5  ! 492: WRPR_TICK_I	wrpr	%r19, 0x00e5, %tick
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, b)
	.word 0xbfa44860  ! 495: FADDq	dis not found

	setx	0x6e52878f000098c5, %g1, %r10
	.word 0x819a8000  ! 497: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3a448e0  ! 498: FSUBq	dis not found

	.word 0xbba5c840  ! 502: FADDd	faddd	%f54, %f0, %f60
	.word 0x8194e0a5  ! 503: WRPR_TPC_I	wrpr	%r19, 0x00a5, %tpc
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 26)
	.word 0xbf520000  ! 508: RDPR_PIL	<illegal instruction>
	.word 0xb5a4c9e0  ! 509: FDIVq	dis not found

	.word 0xb3a448c0  ! 516: FSUBd	fsubd	%f48, %f0, %f56
	.word 0xbda4c8e0  ! 519: FSUBq	dis not found

	.word 0xb63421a7  ! 527: SUBC_I	orn 	%r16, 0x01a7, %r27
	.word 0xbc8ca0c5  ! 528: ANDcc_I	andcc 	%r18, 0x00c5, %r30
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, c)
	.word 0xb9a509e0  ! 530: FDIVq	dis not found

	.word 0xbfaa0820  ! 532: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb41cc000  ! 533: XOR_R	xor 	%r19, %r0, %r26
	.word 0xb7504000  ! 536: RDPR_TNPC	<illegal instruction>
	.word 0xb1a88820  ! 540: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbba4c840  ! 541: FADDd	faddd	%f50, %f0, %f60
	.word 0xb9abc820  ! 543: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbba8c820  ! 545: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb0456037  ! 550: ADDC_I	addc 	%r21, 0x0037, %r24
	.word 0xb1643801  ! 551: MOVcc_I	<illegal instruction>
	.word 0xb351c000  ! 552: RDPR_TL	<illegal instruction>
	.word 0xb5500000  ! 553: RDPR_TPC	<illegal instruction>
	.word 0xbf480000  ! 554: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 13)
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 9)
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 7)
	.word 0xb9a00520  ! 559: FSQRTs	fsqrt	
	.word 0xbbab4820  ! 566: FMOVCC	fmovs	%fcc1, %f0, %f29
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 33)
	.word 0xb3518000  ! 574: RDPR_PSTATE	<illegal instruction>
	.word 0xbba00520  ! 575: FSQRTs	fsqrt	
	.word 0xb7a44860  ! 578: FADDq	dis not found

	.word 0xb751c000  ! 579: RDPR_TL	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 580: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8d95a1b5  ! 584: WRPR_PSTATE_I	wrpr	%r22, 0x01b5, %pstate
	.word 0xbb480000  ! 587: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	mov	2, %r12
	.word 0xa1930000  ! 588: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb0bdc000  ! 589: XNORcc_R	xnorcc 	%r23, %r0, %r24
	.word 0xbd50c000  ! 592: RDPR_TT	<illegal instruction>
	.word 0xb1a488e0  ! 594: FSUBq	dis not found

	.word 0xb3500000  ! 595: RDPR_TPC	<illegal instruction>
	.word 0xbb500000  ! 596: RDPR_TPC	<illegal instruction>
	.word 0xbfab0820  ! 599: FMOVGU	fmovs	%fcc1, %f0, %f31
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbb51c000  ! 603: RDPR_TL	<illegal instruction>
	.word 0xb5a80420  ! 604: FMOVRZ	dis not found

hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb23c21e2  ! 615: XNOR_I	xnor 	%r16, 0x01e2, %r25
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb8ac2163  ! 621: ANDNcc_I	andncc 	%r16, 0x0163, %r28
	.word 0xba242129  ! 627: SUB_I	sub 	%r16, 0x0129, %r29
	.word 0xb7aa0820  ! 630: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbab4a114  ! 631: SUBCcc_I	orncc 	%r18, 0x0114, %r29
	.word 0xbba5c9c0  ! 633: FDIVd	fdivd	%f54, %f0, %f60
	.word 0xb3a80c20  ! 636: FMOVRLZ	dis not found

	.word 0xbfa408a0  ! 637: FSUBs	fsubs	%f16, %f0, %f31
	.word 0xbfa489a0  ! 638: FDIVs	fdivs	%f18, %f0, %f31
	.word 0xb5a40840  ! 639: FADDd	faddd	%f16, %f0, %f26
	.word 0xbca4c000  ! 641: SUBcc_R	subcc 	%r19, %r0, %r30
	.word 0xb5a4c9c0  ! 643: FDIVd	fdivd	%f50, %f0, %f26
	.word 0xb5a00040  ! 644: FMOVd	fmovd	%f0, %f26
	.word 0xb0048000  ! 646: ADD_R	add 	%r18, %r0, %r24
	.word 0x91946003  ! 651: WRPR_PIL_I	wrpr	%r17, 0x0003, %pil
	.word 0xb7a489a0  ! 652: FDIVs	fdivs	%f18, %f0, %f27
	.word 0x8795e179  ! 654: WRPR_TT_I	wrpr	%r23, 0x0179, %tt
	.word 0x839560ba  ! 657: WRPR_TNPC_I	wrpr	%r21, 0x00ba, %tnpc
	.word 0xb5abc820  ! 659: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb7500000  ! 660: RDPR_TPC	<illegal instruction>
	.word 0xbfa489a0  ! 664: FDIVs	fdivs	%f18, %f0, %f31
	.word 0xb1518000  ! 669: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a48960  ! 673: FMULq	dis not found

	.word 0xb9518000  ! 675: RDPR_PSTATE	<illegal instruction>
	.word 0xbf3c0000  ! 676: SRA_R	sra 	%r16, %r0, %r31
	.word 0xbfaac820  ! 678: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a588e0  ! 680: FSUBq	dis not found

	setx	data_start_7, %g1, %r19
	.word 0xb5a81820  ! 682: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb1342001  ! 685: SRL_I	srl 	%r16, 0x0001, %r24
	mov	1, %r12
	.word 0x8f930000  ! 686: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9a488c0  ! 687: FSUBd	fsubd	%f18, %f0, %f28
	.word 0xb7a81820  ! 688: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb7a548a0  ! 689: FSUBs	fsubs	%f21, %f0, %f27
	.word 0xb3a90820  ! 691: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a9c820  ! 702: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a548a0  ! 704: FSUBs	fsubs	%f21, %f0, %f24
	setx	data_start_5, %g1, %r18
	.word 0xbfa00540  ! 707: FSQRTd	fsqrt	
	.word 0xbf518000  ! 709: RDPR_PSTATE	<illegal instruction>
	.word 0xb8c5c000  ! 711: ADDCcc_R	addccc 	%r23, %r0, %r28
	.word 0xb5a4c9a0  ! 712: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xb32df001  ! 713: SLLX_I	sllx	%r23, 0x0001, %r25
	.word 0xb3aa8820  ! 714: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb1abc820  ! 715: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbba488a0  ! 718: FSUBs	fsubs	%f18, %f0, %f29
	.word 0xbb500000  ! 719: RDPR_TPC	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 721: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfa00520  ! 723: FSQRTs	fsqrt	
	.word 0xbda8c820  ! 725: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbc1d4000  ! 726: XOR_R	xor 	%r21, %r0, %r30
	.word 0xb5a40920  ! 730: FMULs	fmuls	%f16, %f0, %f26
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 5)
	.word 0xbfa80820  ! 736: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb224e0e2  ! 739: SUB_I	sub 	%r19, 0x00e2, %r25
	.word 0xb9a40820  ! 745: FADDs	fadds	%f16, %f0, %f28
	.word 0xb1a80820  ! 748: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb29d2172  ! 749: XORcc_I	xorcc 	%r20, 0x0172, %r25
	.word 0xb1a80820  ! 750: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb7a00540  ! 751: FSQRTd	fsqrt	
	.word 0xb42de065  ! 755: ANDN_I	andn 	%r23, 0x0065, %r26
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 16)
	.word 0xb1540000  ! 758: RDPR_GL	<illegal instruction>
	.word 0xb9a00520  ! 759: FSQRTs	fsqrt	
	.word 0xb1a4c8c0  ! 763: FSUBd	fsubd	%f50, %f0, %f24
	.word 0xbca50000  ! 764: SUBcc_R	subcc 	%r20, %r0, %r30
	.word 0xba2d0000  ! 769: ANDN_R	andn 	%r20, %r0, %r29
	.word 0xb5a00560  ! 775: FSQRTq	fsqrt	
	.word 0xb7504000  ! 776: RDPR_TNPC	<illegal instruction>
	.word 0x899460f5  ! 777: WRPR_TICK_I	wrpr	%r17, 0x00f5, %tick
	.word 0xbfa00020  ! 779: FMOVs	fmovs	%f0, %f31
	.word 0xbb520000  ! 780: RDPR_PIL	<illegal instruction>
	.word 0x8d952136  ! 782: WRPR_PSTATE_I	wrpr	%r20, 0x0136, %pstate
	.word 0xb5a94820  ! 783: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb5a81420  ! 786: FMOVRNZ	dis not found

	.word 0xb7aa0820  ! 789: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb9518000  ! 790: RDPR_PSTATE	<illegal instruction>
	.word 0x9194a072  ! 794: WRPR_PIL_I	wrpr	%r18, 0x0072, %pil
	.word 0xb5520000  ! 795: RDPR_PIL	<illegal instruction>
	.word 0x8595e0ca  ! 797: WRPR_TSTATE_I	wrpr	%r23, 0x00ca, %tstate
	.word 0xbba5c940  ! 798: FMULd	fmuld	%f54, %f0, %f60
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 32)
	.word 0xb0bd4000  ! 807: XNORcc_R	xnorcc 	%r21, %r0, %r24
	.word 0xbda588c0  ! 809: FSUBd	fsubd	%f22, %f0, %f30
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 6)
	.word 0xb3a84820  ! 812: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb9a00560  ! 817: FSQRTq	fsqrt	
	.word 0xb5a4c960  ! 819: FMULq	dis not found

	.word 0x879520f0  ! 824: WRPR_TT_I	wrpr	%r20, 0x00f0, %tt
	.word 0xbb518000  ! 825: RDPR_PSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r19
	setx	0x62022aa50000cf5f, %g1, %r10
	.word 0x819a8000  ! 831: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5a4c9c0  ! 835: FDIVd	fdivd	%f50, %f0, %f26
	.word 0xb9a84820  ! 836: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a00040  ! 841: FMOVd	fmovd	%f0, %f26
	mov	1, %r12
	.word 0x8f930000  ! 846: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x7145c2280000894d, %g1, %r10
	.word 0x839a8000  ! 847: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a5c9a0  ! 848: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xbba4c9c0  ! 849: FDIVd	fdivd	%f50, %f0, %f60
	.word 0xb9a80820  ! 850: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb1a448e0  ! 851: FSUBq	dis not found

	setx	data_start_4, %g1, %r19
	.word 0xb7508000  ! 861: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a50960  ! 862: FMULq	dis not found

	.word 0xb3aa4820  ! 863: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb9a4c820  ! 866: FADDs	fadds	%f19, %f0, %f28
	.word 0xbda5c9c0  ! 868: FDIVd	fdivd	%f54, %f0, %f30
	.word 0xb9a40840  ! 870: FADDd	faddd	%f16, %f0, %f28
	.word 0xb73c8000  ! 871: SRA_R	sra 	%r18, %r0, %r27
	.word 0xbfa449a0  ! 872: FDIVs	fdivs	%f17, %f0, %f31
	.word 0xbda81c20  ! 875: FMOVRGEZ	dis not found

	.word 0x81956091  ! 880: WRPR_TPC_I	wrpr	%r21, 0x0091, %tpc
	.word 0xb3a8c820  ! 883: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb3a588e0  ! 884: FSUBq	dis not found

	.word 0xb3a54840  ! 888: FADDd	faddd	%f52, %f0, %f56
	.word 0x89952097  ! 889: WRPR_TICK_I	wrpr	%r20, 0x0097, %tick
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 39)
	.word 0x8995a160  ! 895: WRPR_TICK_I	wrpr	%r22, 0x0160, %tick
	.word 0x85952057  ! 896: WRPR_TSTATE_I	wrpr	%r20, 0x0057, %tstate
	.word 0xb7a00020  ! 897: FMOVs	fmovs	%f0, %f27
	.word 0x89952096  ! 898: WRPR_TICK_I	wrpr	%r20, 0x0096, %tick
	.word 0x85952066  ! 901: WRPR_TSTATE_I	wrpr	%r20, 0x0066, %tstate
	.word 0xb7a00540  ! 903: FSQRTd	fsqrt	
	mov	2, %r12
	.word 0x8f930000  ! 904: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5a90820  ! 905: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0x8194a166  ! 910: WRPR_TPC_I	wrpr	%r18, 0x0166, %tpc
	.word 0xbfa00520  ! 911: FSQRTs	fsqrt	
	.word 0x91952129  ! 912: WRPR_PIL_I	wrpr	%r20, 0x0129, %pil
	.word 0xb5aac820  ! 914: FMOVGE	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a58960  ! 918: FMULq	dis not found

hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 37)
	.word 0xbda5c9e0  ! 922: FDIVq	dis not found

	.word 0xbba94820  ! 926: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb5ab8820  ! 927: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbf540000  ! 928: RDPR_GL	<illegal instruction>
	.word 0x8594e0e1  ! 930: WRPR_TSTATE_I	wrpr	%r19, 0x00e1, %tstate
	.word 0xb7a00520  ! 931: FSQRTs	fsqrt	
	.word 0xb4a5c000  ! 933: SUBcc_R	subcc 	%r23, %r0, %r26
	mov	2, %r12
	.word 0x8f930000  ! 935: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8394e1a7  ! 936: WRPR_TNPC_I	wrpr	%r19, 0x01a7, %tnpc
	.word 0xb3a588e0  ! 937: FSUBq	dis not found

	.word 0xb3a4c920  ! 939: FMULs	fmuls	%f19, %f0, %f25
	.word 0xb5a5c9a0  ! 943: FDIVs	fdivs	%f23, %f0, %f26
	.word 0xb9510000  ! 946: RDPR_TICK	<illegal instruction>
	.word 0xbda548c0  ! 947: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xbaac60aa  ! 948: ANDNcc_I	andncc 	%r17, 0x00aa, %r29
	.word 0xbe9ca1bb  ! 950: XORcc_I	xorcc 	%r18, 0x01bb, %r31
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 32)
	.word 0xb7aa8820  ! 955: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbbab4820  ! 957: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbe8d8000  ! 959: ANDcc_R	andcc 	%r22, %r0, %r31
	.word 0xbda548a0  ! 960: FSUBs	fsubs	%f21, %f0, %f30
	.word 0x8d952112  ! 962: WRPR_PSTATE_I	wrpr	%r20, 0x0112, %pstate
	.word 0xbf540000  ! 966: RDPR_GL	<illegal instruction>
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 0)
	.word 0xb5510000  ! 969: RDPR_TICK	<illegal instruction>
	.word 0x8995618c  ! 972: WRPR_TICK_I	wrpr	%r21, 0x018c, %tick
	.word 0xb5a00540  ! 973: FSQRTd	fsqrt	
	.word 0x81942103  ! 974: WRPR_TPC_I	wrpr	%r16, 0x0103, %tpc
	.word 0xbfaa4820  ! 976: FMOVNE	fmovs	%fcc1, %f0, %f31
	mov	0, %r12
	.word 0xa1930000  ! 979: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbb510000  ! 984: RDPR_TICK	<illegal instruction>
	.word 0xb3a00560  ! 985: FSQRTq	fsqrt	
	.word 0xbe45e03a  ! 987: ADDC_I	addc 	%r23, 0x003a, %r31
	.word 0xb1a90820  ! 988: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb7a549c0  ! 992: FDIVd	fdivd	%f52, %f0, %f58
hwintr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_45), 16, 16)) -> intp(1, 0, 26)

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

	.xword	0xf3a961288c946633
	.xword	0x2daaa4c8c8a4af94
	.xword	0xf838957ad2382d77
	.xword	0xc61e0ea9900a98bb
	.xword	0x9393b7d2e1a8809f
	.xword	0x70e88e87b312309f
	.xword	0x09be6d07d806d693
	.xword	0x2a01ace4a63e3f1c
	.xword	0x1335c9a4fad92c04
	.xword	0xf2bd49e159a8a11c
	.xword	0x1e216b33b17dfded
	.xword	0xca7ecb616d084c06
	.xword	0x8e2779a175ef921d
	.xword	0x6a9b3209b8a4050c
	.xword	0xd869f56a5a9fbec6
	.xword	0xab543cfc8b2868ca
	.xword	0x99654de7bc9824db
	.xword	0xffe36f8b56292200
	.xword	0x5e70096187447b85
	.xword	0x0478b37d98189a31
	.xword	0xc028d7309340a232
	.xword	0xf0e06ef1cd36177f
	.xword	0x5de0fb78b962e908
	.xword	0xa7566508959df165
	.xword	0x0d438c8870d43551
	.xword	0xe68bd7d13238253f
	.xword	0x9ca80b341fcf6b24
	.xword	0x2923854643672727
	.xword	0x775b2988d3129c27
	.xword	0x2f5d69ecbfe65df0
	.xword	0xf5e7a22863c2a6fe
	.xword	0xcadb6bf5b998edb1
	.xword	0x12ad8c91ea40eec6
	.xword	0x531e9c273db85dec
	.xword	0xedb8638b79b29a3e
	.xword	0x25620ce39037e30e
	.xword	0x90ad8bf174722cab
	.xword	0xb7bf3682d3f64fa8
	.xword	0x4e072d6e8656607f
	.xword	0x067d772b5736c145
	.xword	0x652aef9f925524ca
	.xword	0x03de9f375bf94d2b
	.xword	0xc076bf619ed32fb7
	.xword	0xb3f1dd08fcf3349c
	.xword	0x83713bd3f910f16f
	.xword	0x0eaab7d45240ebf7
	.xword	0xbd23d71e788d2c56
	.xword	0x89ba1a6ab994fdad
	.xword	0x683cf987c9b70607
	.xword	0xdff771638c649e4e
	.xword	0xae3f165be4a890d2
	.xword	0x50a1c708cb4e74b7
	.xword	0xe6265f272760c9d9
	.xword	0x7187177072935116
	.xword	0xc0d91765a90424bf
	.xword	0xd91fb44ce1b95e20
	.xword	0x62830818162c381f
	.xword	0x80ead89601f8d0e9
	.xword	0x27f55a4334fd5516
	.xword	0x21b7fdba9a339583
	.xword	0xb63035af80d17262
	.xword	0x35c1d457bb75951b
	.xword	0x944bdb552e45e640
	.xword	0x56a861225dcab0c5
	.xword	0xa58b53439fd419de
	.xword	0x795a53c317e4230f
	.xword	0x9c2a62c025327c23
	.xword	0x51067e95d299e044
	.xword	0xdf0470806e086dfd
	.xword	0x34e661acedd2d886
	.xword	0x698dd592cbdd1f0c
	.xword	0x14248fe7b2859267
	.xword	0x3a6f4c8bd60c23eb
	.xword	0xf1d7ca2694508075
	.xword	0xbe6c2d20408c2db5
	.xword	0x22a3cb504a461b6a
	.xword	0xe949d6cbbfea207e
	.xword	0x742e27a8f30ea450
	.xword	0xe6f4fef321d53cb2
	.xword	0xdff10f2b3f9e6c3a
	.xword	0x71030c4f31b58504
	.xword	0x73924465ab599e5d
	.xword	0x2f0a9540dd9daede
	.xword	0xf9e52c89177c24b1
	.xword	0x2c9a8ccbbe6140a1
	.xword	0x334f14a3640b257e
	.xword	0xf65ddbf410cc7571
	.xword	0x8aa6e329996baa2c
	.xword	0xa0c687fcb002e81a
	.xword	0x2d19f9feceb537d6
	.xword	0x4d43f5c79dc3894f
	.xword	0xfc74af3894b93bde
	.xword	0xd8f7b0bca64fc139
	.xword	0xfb8a34f13cd0299d
	.xword	0xb28b2ddec29a200b
	.xword	0x0cdf0b5091aea5f1
	.xword	0x8eae67fcaf580c0e
	.xword	0x78b5d45e0d13e17b
	.xword	0x92f090674134869f
	.xword	0xd820033b2caa7fb8
	.xword	0xa56388ec88901806
	.xword	0x8e6cb963c3b363ce
	.xword	0xb09fbba964042a5d
	.xword	0xf36dc1dbccf1663a
	.xword	0x7fa11cff91bab7cd
	.xword	0x04d809e3406921a7
	.xword	0x5a804d00a6d95d6c
	.xword	0xfed93bbf0ad01980
	.xword	0xcbb5b27f1b7020ba
	.xword	0xca4573b61c0f4520
	.xword	0x1faae8b5edc2265b
	.xword	0x1e7b06a7938dc800
	.xword	0xacc701ba414c2d43
	.xword	0xe41320cdcdc10b23
	.xword	0xb92a524f387be1f3
	.xword	0xecc9d88eb5ccbf25
	.xword	0xd49a80dd661612be
	.xword	0xa6f1748a96d23cf5
	.xword	0x7c5f961bd80e9734
	.xword	0x56502fb2e082d52b
	.xword	0x5ee87d90908139d3
	.xword	0xc5ac0f3f991b3f0f
	.xword	0x80c667a0b7fadb55
	.xword	0xd4fed60adf37fe98
	.xword	0x843d7d6b8dca8fc6
	.xword	0xca48a602cc544bef
	.xword	0x77834b2bc4b3d6f8
	.xword	0xf98d4e17fb623e33
	.xword	0x2d3c787486c7b43f
	.xword	0xd37cc77c8e99d596
	.xword	0x23f9a1cd4d33ac3b
	.xword	0x15e758faef41367b
	.xword	0x500ad662270ada55
	.xword	0xd261408a9d7f45e5
	.xword	0x7381cab3e8bd1057
	.xword	0xd9c8695107c0af82
	.xword	0x9885a4d14919db86
	.xword	0xc3073c5d076edcf2
	.xword	0xe634a4e28bac8fb2
	.xword	0xbc8766a05e5f92cc
	.xword	0xd9e4d2d2ae2cdaf4
	.xword	0x5e7ae9f4f9e22f0d
	.xword	0x487c1ae39602b4b6
	.xword	0xe8ee0d2dbacf8038
	.xword	0x62d317c99313501a
	.xword	0x43ed67f75bd9f773
	.xword	0x406d8b1e5613e5c8
	.xword	0x978d22c4cbbd2764
	.xword	0xdda3a785344cbf44
	.xword	0xaa31ab4d0d7567e6
	.xword	0x135a0c469c685fd9
	.xword	0x4ab2294ea1dae9bc
	.xword	0x7f7c7a2dfb99a3cb
	.xword	0xdf48c5d4c7752ee4
	.xword	0xd8060666a51120b2
	.xword	0xdaf7b1e381b64ffb
	.xword	0xcb74352dddaed6af
	.xword	0xb6a820cb39fdb54d
	.xword	0x24558eef8850ff89
	.xword	0x5f765e01cf1389c3
	.xword	0xb8d234fe625ea630
	.xword	0xe02cd64fe93e7103
	.xword	0x0972ea339fd448cd
	.xword	0x16d018429168735d
	.xword	0x41cf770b7127a5a9
	.xword	0x91f9b8bcbfc7db5a
	.xword	0x2aa37487ce4aa2d4
	.xword	0xa88259ab761af268
	.xword	0xa057bea4aa645242
	.xword	0x9b775669b1e9ff52
	.xword	0x43cc086af38ef26a
	.xword	0x5228a4fd6c234182
	.xword	0xdb26c7e91a5b237c
	.xword	0xfec41d9f236523ad
	.xword	0xad0fbcba47efd762
	.xword	0x0ee0c3ecf3b46d2a
	.xword	0x24ee0b44b6227b5f
	.xword	0xaa1c038ce35e78db
	.xword	0x0aaa283c36573e38
	.xword	0xea9f437b0f57c564
	.xword	0xaf575d8d2f0dc328
	.xword	0xc527b1494c66ea4d
	.xword	0x09cb6950dd6c9feb
	.xword	0x040cd002611cf534
	.xword	0xbfb41f94a7950038
	.xword	0xf002f539be8223fd
	.xword	0xe3d8c2d6baa5bd2f
	.xword	0x0a4e65abf31d03ef
	.xword	0x77f4d616cf294349
	.xword	0xe15f200395b83c2c
	.xword	0xad0a4e4094168131
	.xword	0x29fbf4ba7ada312b
	.xword	0x0555d5f2bd2812ff
	.xword	0x87af68d071e9a15c
	.xword	0x7e549477cac10104
	.xword	0x939a807cf2e4fdb9
	.xword	0x92312f8f867066d0
	.xword	0x04daccf8b1e94fef
	.xword	0xe0fc08243de3cdab
	.xword	0xb558f00601ca47e4
	.xword	0x9c0902c40681aa47
	.xword	0x68a8d1572004ee41
	.xword	0x52e8e651c9ad4759
	.xword	0x429e2d9a07248dc6
	.xword	0xfbf87fcb981e47dd
	.xword	0x4db1fd3c2069e42e
	.xword	0xb64b07c31eda6dd6
	.xword	0x3870ded1a024ae9b
	.xword	0x15e8c7631b466eae
	.xword	0x763cd248d981ccec
	.xword	0xbda7210540b0198b
	.xword	0xfd395e9ea77b1b90
	.xword	0x29ed43b14a1d6efb
	.xword	0xdefab2fffdf747f1
	.xword	0xde0b67d773688236
	.xword	0xc4a801fdbe1d8df0
	.xword	0x6dfe4d821a4ba543
	.xword	0x88af4aefe41dd174
	.xword	0xe3ce49a37c08ba60
	.xword	0x99666ba23515c5ba
	.xword	0x05b196751d0e208d
	.xword	0x6662791d0b87536b
	.xword	0xcdfd703321290d22
	.xword	0x7e40a8f918f42662
	.xword	0xd853e48324ec7472
	.xword	0xa1ad1c4e89a0c85d
	.xword	0xb8cf46a8174fae27
	.xword	0xd42a1432326741e6
	.xword	0x310946e8c987605b
	.xword	0xad364a293778122d
	.xword	0x251ccc25ed99cda6
	.xword	0xe959e16c43c109dd
	.xword	0x2c8d43cbf3fa14a5
	.xword	0x7ef17471fe0a25ba
	.xword	0x7aac684855c1b8ce
	.xword	0x53b5d1ed42cb88bf
	.xword	0xad95b60fbb9bbd2d
	.xword	0xde64cffba768c3ef
	.xword	0xd0d08754049c37a5
	.xword	0x157c2f0a97cf3131
	.xword	0x52cab6789a5250d5
	.xword	0xc7507f51d80923c0
	.xword	0xb4f3f00320cbc54c
	.xword	0xbc4cd7a07a7003e8
	.xword	0xf94bf75ceb967c69
	.xword	0x9e4984f69d2ea2db
	.xword	0xe45d23ff36e76042
	.xword	0xb645d0c07dbd21dc
	.xword	0xa12190f63bb6a127
	.xword	0xd528b2836a02c93f
	.xword	0x9f5c4b7fd5a84ada
	.xword	0x70edc682c4223e6c
	.xword	0x6949468ee70e86a0
	.xword	0x86d4269a4b4c1cfc
	.xword	0x77fba010b10ac7d0
	.xword	0x6a6e3508b435a811
	.align 0x2000
	.data
data_start_1:

	.xword	0x8e01db86a39681ce
	.xword	0xb1ce99b70c693e1a
	.xword	0x0b9bdc654a660c16
	.xword	0xe024c062ade09af8
	.xword	0xae6e60f0d0f700e5
	.xword	0x325bea02170aa8b9
	.xword	0x2251c84c384017f9
	.xword	0xd259e1fcfaebc646
	.xword	0x1c5c60088271db00
	.xword	0x9706d2983b4e0fa1
	.xword	0x0aa7c4abaff7de47
	.xword	0x7c6e761e7d8e84cf
	.xword	0x0b12028a92273891
	.xword	0x410910abc23ee6dd
	.xword	0x9d819d0f86514471
	.xword	0x468a94c2912803fb
	.xword	0x5a7dcb1ac9bb47a3
	.xword	0x256c278f103119f0
	.xword	0x597df8ff2b7b5046
	.xword	0x2d50e8fc6325839f
	.xword	0xf9d8195241e39405
	.xword	0xd3c7e56e6cec24ae
	.xword	0xd181c31ca26e3e3e
	.xword	0x81fb0c7338492333
	.xword	0x9f4a5c816ba8bf78
	.xword	0xc0288815a86243b2
	.xword	0xcf67b5457a8df93c
	.xword	0xe356047c641274b2
	.xword	0xb2e9481d48246f3a
	.xword	0xfc402c7eb8f24e67
	.xword	0xa579362b2f88ca6c
	.xword	0x775293176e5028fb
	.xword	0xc06e7a1af4d4a466
	.xword	0x8a58f1eb95add63b
	.xword	0x03900ac87a682098
	.xword	0x21843527cf60815c
	.xword	0xd8a4c560185b85f2
	.xword	0x46977b45feda17c0
	.xword	0x764bb61b3c13776e
	.xword	0x55cefdb7a584a218
	.xword	0xc3825a6e5ed65ffa
	.xword	0x2a02715fcfeeabd8
	.xword	0x109faab4e1c3e56e
	.xword	0x0ced875d86e86843
	.xword	0x6e61f44f971cce57
	.xword	0xe099181c2459b9a9
	.xword	0x690a0c24218986d9
	.xword	0x44a3581325bd71f4
	.xword	0xb3c52314830a0fa8
	.xword	0x5f522c1178e569ba
	.xword	0x81fcde8dbb25dd00
	.xword	0x6560f267ddbe5879
	.xword	0xc3e431fcecf3d97a
	.xword	0x0e9591697f1396b6
	.xword	0x47283d209d38c9a7
	.xword	0x3667748059f647e3
	.xword	0x8d4d2be5c1eaf32c
	.xword	0x9e98b9ded56f43a7
	.xword	0x2a6c2c0262651a7b
	.xword	0xc3cf97d773417d53
	.xword	0xf3cd82f52c8bea2a
	.xword	0xfeb7754eb5565381
	.xword	0x6e31995b8563d28b
	.xword	0xc19bb622dd4a1e7c
	.xword	0x6ebc031ce800a8ca
	.xword	0xf1b797c01c0404ad
	.xword	0x29c48065693ae0b8
	.xword	0x445deebfb59ee454
	.xword	0xf8b1a17a39c28572
	.xword	0x1c1c83a13988191b
	.xword	0x4df91eaefb94d20d
	.xword	0x252873f42f5b7ca4
	.xword	0x6d94e8a3e3baee69
	.xword	0x25ecc3921d7941e0
	.xword	0x37e6bea7a332b831
	.xword	0xf2bd4874051cdcbe
	.xword	0x17fdb033883fd868
	.xword	0x47af0329d1ff3a84
	.xword	0xb8495fc7a8bd7c30
	.xword	0xe94f6b5269888ed3
	.xword	0x5463956ac559485c
	.xword	0x09eec4c9e37b7d3f
	.xword	0x36be2808ccfbf091
	.xword	0xae3eb15a8c41f5f7
	.xword	0xa5bc6944fb6e16af
	.xword	0x9786c010afcf3b08
	.xword	0x0d6ab6670c66975c
	.xword	0xc4ede175a6119ffc
	.xword	0xc0d15181b7fd1e63
	.xword	0x592facffb3d89ae2
	.xword	0x6feda7391b001174
	.xword	0x3d88fa7a5fb3cdcb
	.xword	0x8dfb908da84cd597
	.xword	0x607a09eea30d07ce
	.xword	0x713c9b5cb7019568
	.xword	0x1b07fb0c4b7cacf5
	.xword	0x65c03f13f2196dc2
	.xword	0x59a52104c90d25b8
	.xword	0x2f9789d2badb8180
	.xword	0x800c67b260693418
	.xword	0x13627341c8fe2377
	.xword	0xb5d0557734f3c30c
	.xword	0x9221c79368dc4595
	.xword	0x373138178dcd3c5d
	.xword	0xe5b9822307ce6ca4
	.xword	0x5411804fc03ceed1
	.xword	0xe8e3d164364d6f8e
	.xword	0x0ff37df2736ceb72
	.xword	0xa4dccce9dfcaff24
	.xword	0x05c117b21a564e5b
	.xword	0xa2ac2473e62ab9ea
	.xword	0x87b4b51adbc8aaa0
	.xword	0x64196b6e51d2ffa3
	.xword	0x2652a14a2503e9a7
	.xword	0x50cdabcdf0052743
	.xword	0x68d7390a45b454eb
	.xword	0x4845405e4cd36c94
	.xword	0xf2fa1cdf7d0f52e4
	.xword	0x6c457773e56d67c0
	.xword	0x6b03480e0ea05405
	.xword	0x2f28995130f041ac
	.xword	0xf597b5d95751c038
	.xword	0x06ca84688435608d
	.xword	0x430ba362ae0a38ad
	.xword	0x8e572694f57b0ea1
	.xword	0x439aada8b1c2ce8c
	.xword	0x571c8dd1e715ff88
	.xword	0xe8280b74274083f0
	.xword	0xd4250452580c784f
	.xword	0x35c3bdc7bf331c44
	.xword	0x94ea9eaa3e12452b
	.xword	0x9db532e1df3f1d54
	.xword	0xaf35158e6fae4b2b
	.xword	0x2135f47d8dd16ed6
	.xword	0x5b5c1726db73649d
	.xword	0x3df81e59b458cd32
	.xword	0x8d85a1a78f30e348
	.xword	0x99bc226f85755aa6
	.xword	0xb0c4733a67f7e0fe
	.xword	0xf17fa9a0fca77eed
	.xword	0x52504342fddf5dcf
	.xword	0x0bab01d9e7864d28
	.xword	0x8cf42bc7843eee24
	.xword	0x77c715c6f824b569
	.xword	0x85a9a706057b8c69
	.xword	0xbfd87715b847a4ef
	.xword	0x845438989c3f442e
	.xword	0x700c9037b80d75ed
	.xword	0x5aa7e69b6fcd6b6a
	.xword	0x1ce819624923c6c2
	.xword	0x512f58dbe4a02b39
	.xword	0x5276f2bdf7495545
	.xword	0x697c0b529896eff5
	.xword	0x7d2555edf795fb4c
	.xword	0xa1726a0d12bbacb7
	.xword	0x4ddbd90d1edbaf64
	.xword	0x9ae8ea419d85f7c7
	.xword	0xc24d9b77433f688a
	.xword	0xa78eef324956abb8
	.xword	0xa55af93474d42f7c
	.xword	0xb6fe1c264bdf2247
	.xword	0x8e40b90c142e2bdf
	.xword	0x41021300a5257e1f
	.xword	0x7d7554cec0dd7e7d
	.xword	0x0d1eaa2759a0f8a4
	.xword	0x64445817541b3456
	.xword	0xc07db90364b9e3d3
	.xword	0xe3db0ad9e9f1a815
	.xword	0xffb607d0c5451089
	.xword	0xd6f2fe470db89c0f
	.xword	0x60b7300a6313aab8
	.xword	0x13ac6b15c80e5738
	.xword	0x1fb27aa17dc4b07a
	.xword	0xc3baa894d8f0974f
	.xword	0x0d1eae6f0a3093c5
	.xword	0x6cd3c0a7821347f0
	.xword	0x2bff78b10ba357c3
	.xword	0x7e7f3e4a11312f27
	.xword	0x4e2bd4e255a01b85
	.xword	0x75b682476e58ff94
	.xword	0xe4c4ffb3304e4ebc
	.xword	0xba1314ec59256a75
	.xword	0xbf680211dbbf5098
	.xword	0x429f770ff7fd744d
	.xword	0xef7ebdf6b006cf22
	.xword	0x7b2d4b6d604ef85b
	.xword	0x9f8a8ebf810f798d
	.xword	0x6f4ff8335f4cf5fd
	.xword	0x1691d67350ae24f3
	.xword	0x1aa5870143e94c85
	.xword	0xd1277fd61ccf6c5a
	.xword	0x3e474a858b82ae18
	.xword	0x7d16ecf2ec86efa3
	.xword	0x3c5e15cf3399d2bf
	.xword	0x1bb5c27b0244b629
	.xword	0x6e5eeeeebacc7e6b
	.xword	0xc06a1c33a8c9516e
	.xword	0x164851d0bcb1698d
	.xword	0x3a1ed2ed208747d8
	.xword	0x6131d785f531d80a
	.xword	0xe547d3d1da130f39
	.xword	0xe380031acb020636
	.xword	0xa07d0a4ce8c7114e
	.xword	0x2d8bc4ea054ab406
	.xword	0xb97738c31ad0347d
	.xword	0x7f033695cf45a5ad
	.xword	0x2dd40b1c2215c460
	.xword	0x9358f504a7d3e30d
	.xword	0x30a265cd575ad79f
	.xword	0x63e5dd38bbb78b2b
	.xword	0xeba6b20cbfa6fa5a
	.xword	0xfe5017b75aa68f3e
	.xword	0xbb7c8da57c7fde68
	.xword	0x1c92ee137ac1394a
	.xword	0x881655dd03f6974e
	.xword	0x349c43e385e20477
	.xword	0x1a7bc78434062bbe
	.xword	0x03d5f97f8b619f8a
	.xword	0x5fec71a30d69bfed
	.xword	0xc091e0f7dc7e3e0d
	.xword	0xffd51a86b8719b2f
	.xword	0xbe4f3ccbe367eb68
	.xword	0xa82a86ec5e7f7c4b
	.xword	0x8ff04a3be0fa380d
	.xword	0xd1adf8b192e3f8f5
	.xword	0xa32b7ee717ec393f
	.xword	0xc4d61a2623d2bb2a
	.xword	0xefaeefe59ff8b65c
	.xword	0x7ba40b035b5d91ae
	.xword	0x987545abbfba3dd4
	.xword	0x523a5149a68c2795
	.xword	0xcda7615a20d74d63
	.xword	0x7ddc0f3872ccaf5b
	.xword	0x63ca76efc4ea2697
	.xword	0xa9e98beb11d77c02
	.xword	0x13360211f338caa3
	.xword	0x67d836bc35cd2d7d
	.xword	0xa9adb758664d827e
	.xword	0x8973ae67fea14448
	.xword	0x71ed5e62ffb1dd24
	.xword	0x475a363358e72ce5
	.xword	0xc96c3e0381784f39
	.xword	0x1e46003b2a8047e9
	.xword	0xc453ef9ba1aff729
	.xword	0x844186d4543afcde
	.xword	0x5d19f8e0584e0aae
	.xword	0x6a78732fc5d05c17
	.xword	0xd90e08f644009f95
	.xword	0xfadc1199c7464589
	.xword	0x858e8a38b5b465f3
	.xword	0x0a7af5dbbf150d8d
	.xword	0x4af8786606a6840a
	.xword	0x23bec52fb0752fc8
	.xword	0xa09f09d0bbf8445f
	.xword	0x7a99332e33374e7c
	.xword	0x870c637812ad7b0d
	.align 0x4000
	.data
data_start_2:

	.xword	0x3d44987fdcfc2af7
	.xword	0xb1ee7b1537d2f557
	.xword	0x8293c4abd6e2f815
	.xword	0x40328bfdc7055f68
	.xword	0x3aab6136b23d988a
	.xword	0x30004125e569c2d1
	.xword	0x091014901f5ca389
	.xword	0xcfd80f01ae408c29
	.xword	0x90fe52a8587e1879
	.xword	0xe4181d84654aca32
	.xword	0x16b633b92e3acfcc
	.xword	0xde801e1021b460bd
	.xword	0x1021b0aacaa5f558
	.xword	0xdb71242d390716af
	.xword	0xa347bd00721cfd0d
	.xword	0x60abc7f16d17db7d
	.xword	0x1ba0e1ef5f89c76b
	.xword	0x37a83d512a3c72ca
	.xword	0x8d70eaae768bbb9f
	.xword	0x3db331a12bc5d871
	.xword	0x32577d1994dfce5d
	.xword	0x6c973f2225b38fda
	.xword	0xa0edbbf012f028e4
	.xword	0x0bcd2723bca09aee
	.xword	0x672d7fe8ce30d1d2
	.xword	0x528fcb248671ec3b
	.xword	0x3db37c5d662416b1
	.xword	0xef60baa9cdfccc20
	.xword	0xdab00ad87c555433
	.xword	0x90965ebe5ebedde1
	.xword	0x3216981e98e2eff9
	.xword	0x6e6def702aa28ba9
	.xword	0x81b540a97b61a859
	.xword	0xba50457cdc701152
	.xword	0xe03b23e098458efd
	.xword	0xad1db1e26b4ff907
	.xword	0x971a3a1317a6c125
	.xword	0x41dd576678b85b87
	.xword	0xf0236b13e70cf065
	.xword	0xb17b1939d2d9a4a5
	.xword	0x6aeb28b6d6e10711
	.xword	0x6daca04c267150be
	.xword	0x3679a703c49e2d36
	.xword	0x6adec6a4acf05106
	.xword	0x6b11017f5fa534c0
	.xword	0x4d9ecd88807d7ed2
	.xword	0x3a6fabc092224460
	.xword	0xd551c6b4de5e3322
	.xword	0x597421ca1d91b82b
	.xword	0xc944a47bd3de380b
	.xword	0x1e26baa3dda41ec6
	.xword	0x3c2ecb2d967477ae
	.xword	0xaaf10924b1dca128
	.xword	0x0d2771f41692116d
	.xword	0xaa7eafeeee7be407
	.xword	0x92d79dd85d4ca1c0
	.xword	0x2b71bbaa540e8ae3
	.xword	0x53adf05a69bd1ea8
	.xword	0x6030872af281ae4f
	.xword	0x7c31fd7229a05b6b
	.xword	0xed4e88107a4eefad
	.xword	0xb44566d2821a289a
	.xword	0x14d0344910abf1f3
	.xword	0x960f4959a5f89551
	.xword	0x0a3c8c60ce6e81f0
	.xword	0xfd8765866cec8eca
	.xword	0x4117f778e8b4e464
	.xword	0x99038ecf2bccbab3
	.xword	0xc872ea323590bc3a
	.xword	0xaef80ab427cd53fd
	.xword	0x778e37fef53ae655
	.xword	0xf038b1f37f06b390
	.xword	0xfcad440d52b91091
	.xword	0x3c2e1d02e3d4f6a9
	.xword	0x29eab787a47a4a7c
	.xword	0xcb4e042e77920ffd
	.xword	0x1a6b93b4e168e825
	.xword	0xc6ebebc819c64569
	.xword	0xd11be98ba10e9c92
	.xword	0xa891897f97027fc7
	.xword	0xfb466ac47cce644a
	.xword	0xa93daf670ce2ba40
	.xword	0x495db523ba44d324
	.xword	0x6f2476e94eabba49
	.xword	0xd63d81c5b9a87161
	.xword	0x7815f8f663be1358
	.xword	0xcda89d14f12f0e87
	.xword	0x343592778657e09d
	.xword	0xf0e5abb262c3df9a
	.xword	0x1181c175257fd98a
	.xword	0xa6aad2e3efb87ba3
	.xword	0x1dd30071ba7c760c
	.xword	0x4cb403d6797e06f8
	.xword	0x21809ef9a791e3d9
	.xword	0x70b034f695c3b56e
	.xword	0x9f3c6b8c037ba43a
	.xword	0x94ff191c4d243b11
	.xword	0xaa4df3819362dfbb
	.xword	0x556f9ecd63484de7
	.xword	0x5c13588f994c6461
	.xword	0xf064422fda683280
	.xword	0x11849a1cd427343a
	.xword	0x35ac25f02cd7989c
	.xword	0xf8fcc8bca44e5546
	.xword	0x34edf49d47b30166
	.xword	0xac3351de3f315998
	.xword	0x8687851a08703924
	.xword	0x148207742a9ff6ff
	.xword	0x95e96ebd54dac56d
	.xword	0x3028ea36cf3efa14
	.xword	0xe41a1f45987e67e6
	.xword	0x688ef8163b9c53f6
	.xword	0x65a7120332a16ffd
	.xword	0x0671b41287c6bb87
	.xword	0xd8cf38204fb3ffd1
	.xword	0xdbc12cba09e051f5
	.xword	0xf7ec8971ef7db95e
	.xword	0x6cf92d002d4d92fe
	.xword	0xeea746b925d15ec3
	.xword	0x35660626df4b65f2
	.xword	0xdfee4ff49d43e527
	.xword	0x3d4b48c6bf8d1703
	.xword	0xadba6418630428dc
	.xword	0x1c5f0fb0d3745eef
	.xword	0x5dc3f6a3b2e7f252
	.xword	0xd414b2f749b43288
	.xword	0x37034c18f5eb837c
	.xword	0xebef4e014a1204c0
	.xword	0xe7d95dc2e7fb7128
	.xword	0xc6c8ec291e5bf7e1
	.xword	0x9cfb1d5b29584273
	.xword	0xa17f89c6409877d2
	.xword	0xf3d22550a6e961d7
	.xword	0x9d960ae08546e212
	.xword	0x5d8794ca7e447d27
	.xword	0xe4c5df34796853e1
	.xword	0x6df00650be2c9099
	.xword	0x39fe870338ca94b1
	.xword	0xd6cea37fe9913208
	.xword	0x2736a0749cd146ed
	.xword	0xee7a8eec2a62536d
	.xword	0x146048fe2d4be907
	.xword	0x2a1bd0649abf2dcd
	.xword	0x99130c890fc2ea14
	.xword	0xc1bb76a0d0330ca6
	.xword	0x75ba0984734c96a0
	.xword	0xc817e0690ea2d11e
	.xword	0xfa4cbbcbcbe5ab94
	.xword	0x86fc2008c0901a84
	.xword	0xb4f3554cacfdb8da
	.xword	0x5b99961c18737d18
	.xword	0x574b3fcb70e18a8c
	.xword	0xdcdd8498c01c1a71
	.xword	0x211dcce1cae669be
	.xword	0x613c979a28dc9f39
	.xword	0x4c3508d0e0241b43
	.xword	0x4eb0a87c7279d55e
	.xword	0x3c6c6c84e8f819b0
	.xword	0x82e0f41085dfad16
	.xword	0xa02317f3c130d189
	.xword	0x3457594875b7dffb
	.xword	0x33758f87c6561e8c
	.xword	0x136f1b387c6212e3
	.xword	0x4c72b04f534701ed
	.xword	0x222c02470fbd37ef
	.xword	0xe095962550c554f5
	.xword	0x5283711fd2e1517a
	.xword	0xee9a3fcfdd9c9a80
	.xword	0xa395cd311a8c1f15
	.xword	0xa3a71ca02b23204c
	.xword	0x3bff717163cc6928
	.xword	0x79e116d84977975a
	.xword	0x626db09e7083fe88
	.xword	0x60baf8b8c23d3f0f
	.xword	0xdbe827edc4edbb77
	.xword	0xbe791400c022316c
	.xword	0x5906ddedf64c6776
	.xword	0x6eb70b3dce2933d5
	.xword	0x4947b5aa6b836208
	.xword	0x893393b8751f7d3b
	.xword	0xdcbdd82e0f3dfbdd
	.xword	0xa4f849944d71db46
	.xword	0x6b8bd4887abee21b
	.xword	0x05c3071b3300ce02
	.xword	0xecb1eee5670b621c
	.xword	0x54c5756593c40637
	.xword	0x719599404f65bc8f
	.xword	0x9e069db7c43d7833
	.xword	0x04e3c75567ca1f4a
	.xword	0x689de168dc80fd25
	.xword	0x24b09fa5fed04cd7
	.xword	0x9adc653191b71100
	.xword	0xf20f82f3e15ccc99
	.xword	0x07f5a49f7be5864f
	.xword	0xd9da294d8d115edc
	.xword	0x60657419a8a35076
	.xword	0x166f0292e3e2c37a
	.xword	0x3d95fb0ab4537772
	.xword	0x88a2a80a952e34bb
	.xword	0x36a0fe04934cdcd0
	.xword	0x68e5df8f38327bea
	.xword	0x393c14c61656a1b4
	.xword	0x2e1d89bb3d9262c3
	.xword	0x8378e3991b4ead11
	.xword	0xe339974651c9a7ee
	.xword	0x984b65782bd78786
	.xword	0xadeaa9d235850deb
	.xword	0xe710cb51538e0481
	.xword	0x3bebce87073f32c2
	.xword	0xaee82d91385b7353
	.xword	0xe784b04495614638
	.xword	0x5ad007f33eb190c0
	.xword	0x6cf1b14f1ea4dd8b
	.xword	0xb3828765af605717
	.xword	0x671cef4fbfa8b93b
	.xword	0xbba4100081cb6a79
	.xword	0xb540e6f24f6f4758
	.xword	0x0d1b93fa2200cff7
	.xword	0x311c131228c076d7
	.xword	0x3015e1af52675dbf
	.xword	0xd40a177002da209b
	.xword	0x6bf98c49a9ef03d4
	.xword	0x0805e8391caa264c
	.xword	0xec70251d5e46d60a
	.xword	0xce91527f844907bb
	.xword	0xe91381222f6c3d00
	.xword	0x4fc0369b9813023a
	.xword	0xd8c6ab97f5707844
	.xword	0x80a26695e52b6df5
	.xword	0x0eb87f7a70622b29
	.xword	0xd992e87354431120
	.xword	0x01218770cb293f04
	.xword	0xf4b45ad50cbbfe6e
	.xword	0x4f73802d6e7fc251
	.xword	0x32367bb3aed7942a
	.xword	0x9a39f8d92af69f12
	.xword	0xd1afb7873e3aba21
	.xword	0x3bb50808d9e75af0
	.xword	0x6c877da81ad1f464
	.xword	0xf4ffa43fb72852b7
	.xword	0x302ecc16d7f6ea52
	.xword	0x4e74388c7e5e62c7
	.xword	0xf32040da55e3b456
	.xword	0x57d0d9732ef86b0a
	.xword	0x775edd58b0fe9185
	.xword	0x5088ffc208f029e6
	.xword	0xf707b008ea94fe7b
	.xword	0xc6720913a5500df7
	.xword	0x0514e7dba5312640
	.xword	0x65b534acbab42704
	.xword	0x1588071220ae5f50
	.xword	0x77a60addb439cdd1
	.xword	0xa9308896cbe6cbc3
	.xword	0x21b1b9c6d7cc0389
	.xword	0x1f290fc98ddaae59
	.xword	0xf8c08d2c5ee49e01
	.align 0x8000
	.data
data_start_3:

	.xword	0x8f2196475ea169dc
	.xword	0x180c4a2def383031
	.xword	0x3efc176d040ffc58
	.xword	0xc7f6f75482d4ea81
	.xword	0x79f7edf293240abc
	.xword	0x974797a67d92a1d7
	.xword	0xbaf38d875f20a079
	.xword	0x196d68f0b152c9a3
	.xword	0x3b18eca86c504939
	.xword	0x2a78efdf0b816cae
	.xword	0x4f3829066f71ed1f
	.xword	0x168d759ab6f38144
	.xword	0xfe7d9336263d1424
	.xword	0x9153890363f76545
	.xword	0xd657f4b15b65a2b8
	.xword	0x34edccf2a295d23d
	.xword	0x12d4f9446603d0e4
	.xword	0x6a2c64bed8876216
	.xword	0x3f26da1d57b27e42
	.xword	0x57e4d6bf187ebc68
	.xword	0xb145e21f37105d39
	.xword	0x2cbc874119247c45
	.xword	0x321b91e3c72cb59a
	.xword	0xdc2c18b1e054f7eb
	.xword	0x7d993f28b40b6d88
	.xword	0x43294666e0b0f0f9
	.xword	0xdcd4e6d9be2cc4b3
	.xword	0x5bc7ffc3c5f671b1
	.xword	0x5210165645423e6f
	.xword	0x16e9aeaae6ea2a5e
	.xword	0xd10b75ca7da7129b
	.xword	0x74dbfa8fd7ad1183
	.xword	0x44502506f8989a3b
	.xword	0x2f6db7b98f25f479
	.xword	0x4a32c028b2a29c16
	.xword	0xa0acc53b11306fb3
	.xword	0x3c662dc5850d229d
	.xword	0xcb7cf645b12df6a0
	.xword	0xf6442ea26a514f86
	.xword	0x08800bbeda72199e
	.xword	0x968f333f096f8b4f
	.xword	0x6547a8de680eaa4f
	.xword	0x71792509766e4529
	.xword	0xa325be8aba81eaf2
	.xword	0xa3e26f6eec624f0e
	.xword	0x77a0ee5f2c8c5109
	.xword	0x7ea02b3ef10dd521
	.xword	0xa4b7db5f0b448dc3
	.xword	0x7a7edec2e35a7c3e
	.xword	0x938e5b98afd61120
	.xword	0xc593ddd4d6faa189
	.xword	0x75a4a9d791cf93e4
	.xword	0xb3a147e8f439f0c0
	.xword	0x1a8f2523b1398933
	.xword	0x92276e722242bb42
	.xword	0x7a6c24376de028f8
	.xword	0x304f71ef7ae20328
	.xword	0x59170bf994e873d3
	.xword	0x8ec5486e8fd97bc1
	.xword	0xb8c30025086bf401
	.xword	0x6945c394ae1059b9
	.xword	0x9a5411bd20e11496
	.xword	0x9ca7af340f9a1c74
	.xword	0x91eeb4f82c7aaa75
	.xword	0x9f550dee3c45337f
	.xword	0x021dbf02ea68d3f6
	.xword	0xeb3cfdd729512883
	.xword	0x8d1f9ed7b8c9e912
	.xword	0x8581674635713efb
	.xword	0x1141b26c629d5b3a
	.xword	0x8de209aaa866d220
	.xword	0xb3b1696d630dd932
	.xword	0x47294ddf35b24f41
	.xword	0x182605e06f2d40da
	.xword	0x9163f3e3ead295eb
	.xword	0x5b4d6550a076a42a
	.xword	0x1074c3eb7e8b2578
	.xword	0x1a20cd9d2988217f
	.xword	0xfccde777a0d20c9a
	.xword	0xe2297d2507363f30
	.xword	0x8d7893419d1b16d3
	.xword	0x9bf6ee293cd93c50
	.xword	0x89520a31ad007f9b
	.xword	0x836933a9c93ee827
	.xword	0x2f6f407b9cbf394f
	.xword	0x137cb13fc5b7c505
	.xword	0xd1579616693e5dda
	.xword	0xa33e5ac48e5f64c2
	.xword	0x9513ac48ae1a46ca
	.xword	0x2e0b3511c18f6e62
	.xword	0xd4c4d12a94bc1cc1
	.xword	0xf4e1a6313c8ba1c1
	.xword	0x479b45bbf0cac31d
	.xword	0x17831e8fc6b4c0d3
	.xword	0x061586fe5af787b6
	.xword	0xea4d66118f36b14a
	.xword	0xf21bdd8fa0fde1c9
	.xword	0x687de7d60c56246e
	.xword	0x017a0777e5f23c9d
	.xword	0x7d86c702892248b4
	.xword	0x2c48947978fa8e36
	.xword	0x4074cbc9632a7552
	.xword	0xbd7e37845b71a1b2
	.xword	0xf409e48b8a195617
	.xword	0x9c0d84e8f61338ed
	.xword	0x1fb153a4778dbb63
	.xword	0xa435212ecfcec93f
	.xword	0x012e2f0d435c78e1
	.xword	0x461300656f8dbcb7
	.xword	0xcecbb43f7f15b1db
	.xword	0xa8144af3c5de9e0b
	.xword	0x7f9880499145e083
	.xword	0xe077cf659e0a91ce
	.xword	0x703ba76f2fa71a3d
	.xword	0x1a11f28671553ad0
	.xword	0xbcf4b5cf74aebcba
	.xword	0x57510c45442f1e9b
	.xword	0x2ced1eb7def72d88
	.xword	0xaf8da73642040488
	.xword	0x989da165b27e1d74
	.xword	0x6a278b81b50c8fbb
	.xword	0xbbce0aeedb89404c
	.xword	0xaad5e52c0b214f9c
	.xword	0xd8faac03636ad4fe
	.xword	0xfaea7aba32a12471
	.xword	0x1a52aad5259258ac
	.xword	0x39379ca7892adcf0
	.xword	0xbcaae79ca29f9311
	.xword	0x7e5fa69fd4bb1f7c
	.xword	0xb7497ffad512aa59
	.xword	0xa0b78463e3a99cb8
	.xword	0xb157b76ad69e195c
	.xword	0x7ec212e7263369bf
	.xword	0x3c8a15b5beb4aaab
	.xword	0x79052371aecd953b
	.xword	0x21bca6c2d26ff769
	.xword	0xba4c286d2fb51353
	.xword	0x95a509198386fc17
	.xword	0xe8a3fa6ca7bc4d18
	.xword	0xe6efdbc58e348f3d
	.xword	0x7208b5787e573d98
	.xword	0x4097e7cd8d5ea6ff
	.xword	0xc809313fa5de238c
	.xword	0xf57604ce0d0f07a8
	.xword	0xe6719bdc2dffbffe
	.xword	0x4c5f0eab9c4a1e8c
	.xword	0x68de8d924eac9330
	.xword	0xa54e881b863e667e
	.xword	0xffdd770fb2ccdaa3
	.xword	0x9bad9aa27a5fcf17
	.xword	0xd50230fccc354c1a
	.xword	0x4aa739c00cd70296
	.xword	0xa543ee138f6f8fbf
	.xword	0x02b7e18491bed574
	.xword	0xefdb3e539552cbf0
	.xword	0x9458e27fe3fc5f96
	.xword	0xd6f42d1aac91cd60
	.xword	0xb9b0fddbf8d07519
	.xword	0x35f57d45c00b2b6b
	.xword	0x4931589dfdc9def0
	.xword	0x66fd6b532a5de1b4
	.xword	0xcc873f03e55177a8
	.xword	0xd72ca56af5ce5f80
	.xword	0xf0f96e758312c3d2
	.xword	0x0e67c1ed4dcb5d6c
	.xword	0x701a9a312ca2360d
	.xword	0x1142e3b4fbc7526a
	.xword	0x660c777eed1122fd
	.xword	0xde65e91d27eac7d8
	.xword	0x02d60fce39e35298
	.xword	0xaca8296068eddc54
	.xword	0x94b576ec93f979c8
	.xword	0xf6eef71cdf4f0a7f
	.xword	0x60a916693c24f3bc
	.xword	0xc2ac916bb82d9e4d
	.xword	0xb4c755589d79d2e9
	.xword	0x3cf9a66a76275c66
	.xword	0x8c7246897f8529ad
	.xword	0xd82ff6f4c458897e
	.xword	0x773fa0ee8aae73da
	.xword	0x456bd256da78c0b9
	.xword	0xbb779bdcda8fdd2f
	.xword	0xc8575acdd3fbfa69
	.xword	0xdfc9c7c92bfe976b
	.xword	0x2cb4f224d69d6a85
	.xword	0xb8bc4310a6d3d18a
	.xword	0x62fdeb17057e590b
	.xword	0x9d4a5fbcdf5b2224
	.xword	0x2ef9b7ea07d8713d
	.xword	0x9ad38889963b1498
	.xword	0x806e736a6d35b62e
	.xword	0x757148c9ef7f3585
	.xword	0x2e2f03b7f2c8cd4a
	.xword	0xbe9e9b7b8af1240a
	.xword	0xb2274984181318f8
	.xword	0x92fed87d482bc627
	.xword	0x8395840784c7ed4f
	.xword	0x9c79abbd71988c36
	.xword	0xcddb8705fc6ac63d
	.xword	0x5432141e429e8c94
	.xword	0x90cc97e62bbf140b
	.xword	0xfbf01ac4821632ee
	.xword	0x16c6f7508ea3b67a
	.xword	0x8f53a33a1f0ae231
	.xword	0x6cd8c1a4d7974159
	.xword	0x34a32f1455b1014c
	.xword	0x9b8db9efe2667b5d
	.xword	0x47c9562e0a32d28b
	.xword	0x8e74a6497c35122b
	.xword	0xb225aeb58ff9b7be
	.xword	0x25a6a42250cd1ab2
	.xword	0x95f63340dd0c6e1a
	.xword	0xdeae7d722e1ac1be
	.xword	0x18b1cff79a82c8e9
	.xword	0xa5ca2050b3181392
	.xword	0x190502434016efa6
	.xword	0xfb699aa157d90aed
	.xword	0xa801e798b794400c
	.xword	0x4a05961d3321ffd3
	.xword	0x723f1c1931dd694d
	.xword	0x7ad47f9691c79ebd
	.xword	0x78769d8f570dafad
	.xword	0xba2671a136832519
	.xword	0x6f3ed4a86548329b
	.xword	0x99e23581332a7889
	.xword	0x1f1fa10234d2ed16
	.xword	0x2c26bd943b6a0d21
	.xword	0x24455df307459d5c
	.xword	0x83b63c2c5dd58309
	.xword	0xac767a12c10d53a9
	.xword	0x2d6c60d21af321e0
	.xword	0x30c267e467626df7
	.xword	0xac41d96835bbd397
	.xword	0xa4808e2111cc838b
	.xword	0xc6b9a367adb3c710
	.xword	0x4330ed22c7cfa7c6
	.xword	0x5ac1bcaf29bb3681
	.xword	0x0e2a30e58781a0a8
	.xword	0x1ea46fa971d31508
	.xword	0x95c3a89a017fe425
	.xword	0x9bce27f4187d691d
	.xword	0xce97882cc044a62c
	.xword	0x18ab33806a538fc2
	.xword	0xc15423021a21b40d
	.xword	0xc9d38a98f51283e6
	.xword	0x06081c1564c9828a
	.xword	0x66737e4c10d49694
	.xword	0x33fe4f7b57a72e2f
	.xword	0xc6e412d5d05973f0
	.xword	0x142e0ee0f491073d
	.xword	0x57d1d0267c841d5e
	.xword	0x1ff19d0860a26a44
	.xword	0x91fbe1a44da94cf1
	.xword	0x8e650167150bd823
	.xword	0x3a9aa8bacf9f52e4
	.xword	0x98d6f63b7c4ec31c
	.align 0x10000
	.data
data_start_4:

	.xword	0xaf5023cc7c981c79
	.xword	0xc2fc8f7275db9170
	.xword	0xe10b8ebdb1754283
	.xword	0x06d7faf7a3c4772f
	.xword	0xf2398ae968184ece
	.xword	0xc4730421a800915c
	.xword	0xc22c3ffa18ba5f52
	.xword	0xe9008e1903907bbb
	.xword	0x8db960d50050b3c6
	.xword	0x8ec0836fa22ce095
	.xword	0x054d1e8e00c7f9bd
	.xword	0xdb24f9b0b6268c14
	.xword	0xc7e2eb951d4ac1e2
	.xword	0x57e42c2c4ce30604
	.xword	0xb4585b9bbb327b9e
	.xword	0xe9f676fcb798e85d
	.xword	0x6776bb29539a291d
	.xword	0x77c0a8da02afd944
	.xword	0x6eb5e643258faa41
	.xword	0x6ab292c52b827eaa
	.xword	0x0c278648e0835e9d
	.xword	0x29f21115a54158f4
	.xword	0xf023b92653825874
	.xword	0x791269eaa1262736
	.xword	0xeef0f6c181ed4917
	.xword	0x3f33b65850624261
	.xword	0x7e2252ae9258b806
	.xword	0x3fd763e313e0ee69
	.xword	0x289713ee9c7afd61
	.xword	0xe28cafbe73a3a252
	.xword	0x76aa056b0a40c4c8
	.xword	0x39e1bcd3a4ccbb46
	.xword	0x4cea345cb26b4606
	.xword	0x3d75367096f1fc3b
	.xword	0x06beeb31c97d3764
	.xword	0xddb084fd94062c1e
	.xword	0xc3eaa061f0c494da
	.xword	0x30e5239b062a129c
	.xword	0x649eeb34108f221e
	.xword	0x2108c26f84c56e27
	.xword	0x258e26a8bd1d1673
	.xword	0xd41a244414d06337
	.xword	0x6d84a238a9fc3e3d
	.xword	0x07d2a0ead4c0cba9
	.xword	0x46fbb29415a9744c
	.xword	0x5505aac4850938e5
	.xword	0x96a93643344edf36
	.xword	0x471c325625f69104
	.xword	0xeaac28d66c95ada4
	.xword	0xcb16caf18543a4f7
	.xword	0x81b565e793716437
	.xword	0x3dcb1af192a637e0
	.xword	0xdba23c9860977f52
	.xword	0x007a63563916fa4e
	.xword	0x64be12f81954b209
	.xword	0x0f832ab2366fdf35
	.xword	0xc50fc10b5ce81fb7
	.xword	0x6901e7f8c90f19b6
	.xword	0xdfc628352d521797
	.xword	0xe76f015c31183eff
	.xword	0x3c5b0d1b5ca4fe1a
	.xword	0xcc85c05ebb58db18
	.xword	0x768c23315bc2ee2f
	.xword	0xfc49c07c01ccf4ad
	.xword	0x7d7a100ee2dc3dd0
	.xword	0x523f4c2e7411f04c
	.xword	0x0c018dc92b31db89
	.xword	0x07cb9f2812f0c80f
	.xword	0x2e0a6caaa5e8d0c6
	.xword	0xec4d7f1aa9c1f005
	.xword	0x1c0d49576fcd9dd7
	.xword	0xc50565c9d9cde645
	.xword	0xebb5237b274504ce
	.xword	0xca482fdb0adf8524
	.xword	0x96ab184193a880eb
	.xword	0x4a950cd75f127d28
	.xword	0xe007194e63cfbc1d
	.xword	0x9edf3714d01be5b5
	.xword	0xeb6750056fbc3e80
	.xword	0x25754c0287142acf
	.xword	0x442a0e97db28e6e6
	.xword	0xe294e65dd6d97f55
	.xword	0xc9d61e1783e64a00
	.xword	0xd60bc6a274458ad7
	.xword	0xe0e7d3c5b710deb0
	.xword	0xc405822b10ad060e
	.xword	0x88c9ea0ae5a248ce
	.xword	0xbfbf6275c9cb08b7
	.xword	0x0ed2e02b451bb230
	.xword	0xa9c5559d755e96c3
	.xword	0xd0dc42d9da9aa059
	.xword	0xe9c42426cda040a4
	.xword	0x442e73a406d616a8
	.xword	0x9849eafdc65f59e1
	.xword	0x8d4914c5865d0d76
	.xword	0x5014eb332e1d1524
	.xword	0x9b9f1cf4acafb79c
	.xword	0x224cfd43232d65c3
	.xword	0xecbf3c7fe18c0184
	.xword	0x3d6316f146937f72
	.xword	0x0567d21636a5c892
	.xword	0x6fc4b23675eb76cf
	.xword	0x810bd2cf7887f1bf
	.xword	0xbbc7fa20ce43e9f8
	.xword	0x7d89b20047bc90ed
	.xword	0x1aefdb09d452cc8c
	.xword	0x18bdb101f20ec28c
	.xword	0xfb798adef8cc4a54
	.xword	0xd4e42bea902f0835
	.xword	0xd7b7d9928c142496
	.xword	0xa5ee22f3d09eacdc
	.xword	0xe041f3b113b16375
	.xword	0x478dfd9c0b00b7c7
	.xword	0xa14a7105febdc96c
	.xword	0xc8aad0affc5329ba
	.xword	0xe45a88f38064f167
	.xword	0x3a3832f538a76fd5
	.xword	0xcf97c402d0cd2f95
	.xword	0xaf1667d3320e04d7
	.xword	0x0c75e7133d729f79
	.xword	0x28dc68f1a1ad3a5f
	.xword	0x32357f9debc51ef9
	.xword	0xbc439549a8b14d8b
	.xword	0xeb71a430dca05fee
	.xword	0x2cc375a72ee18a69
	.xword	0xb8b3c254c4f712b0
	.xword	0xb73793ff256be29e
	.xword	0x1e5c137c447f86aa
	.xword	0x631602f95db3b3af
	.xword	0xe783363b871ab56a
	.xword	0xe5cc872729141553
	.xword	0x6068f76364122daa
	.xword	0x6b60f9fd06830bbf
	.xword	0xb56ee99b521b31cb
	.xword	0x2e2339352bdce360
	.xword	0x97d3bfc5215aecd2
	.xword	0x2be53db061c2780e
	.xword	0x87f1230a0ed5bbc5
	.xword	0xda7bc0f65378febf
	.xword	0x5c17c2d45f0e55bb
	.xword	0x47d9fd238d518ea1
	.xword	0x38d8ef1da05751bf
	.xword	0xfff6348708bd0813
	.xword	0x09df3001a1a7a8ef
	.xword	0x52d7ddd08c4efbbf
	.xword	0x96ba4c3565d0bb07
	.xword	0xfea71bc59ec30344
	.xword	0x6acb606759156c70
	.xword	0x19b51365130a8731
	.xword	0x36008971ac475180
	.xword	0x9ca70710a97f00ae
	.xword	0x6e23e7dd4b996de6
	.xword	0xf63c7a1e761154aa
	.xword	0xfe53446ca97950ef
	.xword	0x6ca0695337fd92c6
	.xword	0x07ea73f1edc071d8
	.xword	0xa5af5a12fc560df2
	.xword	0xe46f0f9e4dc5efe1
	.xword	0xaa04489475d4da21
	.xword	0x93858046affc4720
	.xword	0x81091a404a9aca00
	.xword	0xd524fd0cca93db9d
	.xword	0xc13ed3c5484acfa7
	.xword	0x69c8a64d6c5c4748
	.xword	0x89b7322e2c965ce3
	.xword	0xb802b00e0d6301e9
	.xword	0x146c0727f9205fc0
	.xword	0x728b9ab8789e360a
	.xword	0xd9370df9d0295f28
	.xword	0x5b74d0b6a36e4507
	.xword	0xb9a8841e32daf7c4
	.xword	0x5a349a63aa122af0
	.xword	0xde97861227d81f9a
	.xword	0xf86e7e2bfbfc20d3
	.xword	0x1e6f7d6824bb1833
	.xword	0x35eeed34a132c56b
	.xword	0xd9cdb4c53e5ae9b5
	.xword	0x091fd30900b790b7
	.xword	0x0ede6fbcce05462a
	.xword	0x281cb59cb2b96040
	.xword	0xe99e531841f9499c
	.xword	0x0678fb40d93a7119
	.xword	0x7e18b4f89ca18ea2
	.xword	0xf5e3c3bc27a5dff2
	.xword	0x8a3946d076ea6bcc
	.xword	0xcf3d555fe4d9ccb0
	.xword	0x1331034deb2c8d61
	.xword	0x2484cbbb3cd05b6c
	.xword	0xaf710cea4df848d3
	.xword	0xc04b93c7668c2e51
	.xword	0x7f6e3a9f9a4ba862
	.xword	0xe4e8fdbe81ceee82
	.xword	0x2e281d797fa5c208
	.xword	0xac8e85b6210b33a2
	.xword	0xf8fbf06da1d00b34
	.xword	0xac55ae2cd6696df5
	.xword	0xa03087682b332f29
	.xword	0xb25d21ebbfdba772
	.xword	0x14e807c2e2dc633e
	.xword	0xf034626f2396e6c4
	.xword	0x391d9f70f2468c89
	.xword	0x034b6c4e4d69428b
	.xword	0xccf3e287cfc1a032
	.xword	0xfb5cef6c891472b2
	.xword	0x866aebd0b54c536a
	.xword	0xc3fa784be7fc74f8
	.xword	0x7bb242ffdfb11df6
	.xword	0x0fd9dab47bfe454c
	.xword	0x7555b5650124a0a8
	.xword	0xc2a6c7a72775b56e
	.xword	0x7ea0a8b4681cf66c
	.xword	0xe58fa067e9d87173
	.xword	0x1923f099bf56587d
	.xword	0x60acbc465d931b4d
	.xword	0xce5c51e24f815f9f
	.xword	0x4b97fb2d6a12a066
	.xword	0x00f3577abaea4be0
	.xword	0x51b6e98924a16314
	.xword	0x29d63d5d2aa921be
	.xword	0x10edc5390791aba6
	.xword	0xb0129fae1cde258c
	.xword	0xaa58e65fdd8f2a78
	.xword	0x9563a700d4aa137f
	.xword	0xd31f37d21fde0740
	.xword	0xf858a20769046aa7
	.xword	0x91b0f8f442438eef
	.xword	0xa7389d3f93eb2d51
	.xword	0x6865242698f641b0
	.xword	0xb5fd71ba41582ad4
	.xword	0xe7981b157bd7bfb4
	.xword	0xcfad2a1164c45bbe
	.xword	0x184fe783c4e082fe
	.xword	0xe1e080e0378baddd
	.xword	0x1353748cda23af16
	.xword	0xdaec4648a8cd82cc
	.xword	0xf836228735717dd8
	.xword	0x36a4d09c34de3d7b
	.xword	0xd983308fa913ae72
	.xword	0x25d2bdc5629eedc5
	.xword	0xe54b8601ee310e1d
	.xword	0xd4c3a8cd3c6e6065
	.xword	0x8aa8f537c78472b4
	.xword	0xb87194aec776f5ef
	.xword	0x025967afd9d8c95a
	.xword	0x723e481b4623550a
	.xword	0x3d7480193f8098d2
	.xword	0x291d1e89c7a38ad8
	.xword	0xf3c23d8f5a31e6ad
	.xword	0xe7adc0bd12700780
	.xword	0x26ce539d44413a40
	.xword	0x7aceff415b799768
	.xword	0xb1997542e20db7f0
	.xword	0x4da7ea95fdd793e2
	.xword	0x62cfc17ffd1dce42
	.xword	0xbd10dbe093ff24f8
	.xword	0x72031dbe12142f53
	.align 0x20000
	.data
data_start_5:

	.xword	0x13772ccfbab1d8dd
	.xword	0x5e8705096fccae3b
	.xword	0xb22a5a266f21e642
	.xword	0x7b456178d3b2ec41
	.xword	0xec7a20c9618002dd
	.xword	0xbebfeeb74b99a613
	.xword	0x5cc70e726e153fe7
	.xword	0x8f55fa86c7f11805
	.xword	0xedd83e3cc6507d93
	.xword	0xbe603864666e9a31
	.xword	0xb3e0f698d06e085a
	.xword	0x1de40d16175a074c
	.xword	0xb20223037063e8f4
	.xword	0x1ab9e35d396c491b
	.xword	0x19129fe4f3f170b3
	.xword	0xb3849c2bc8645d33
	.xword	0x25b7dc54a7f52ec7
	.xword	0x0170e5c55b89f12e
	.xword	0x19973604b80be378
	.xword	0x07b76c2a695812cd
	.xword	0x9fbd5d04c66d4ae0
	.xword	0x8d7ae4acd3eaeee8
	.xword	0x77e84ecc630aab34
	.xword	0xf95c56682812e502
	.xword	0x27499e71353e3c14
	.xword	0xa082178ac853c51f
	.xword	0x1e4b6a9c7c0cb2a4
	.xword	0x1ff666d1d094f1a2
	.xword	0x92799b2999187a1c
	.xword	0xe33485ad017f0bd3
	.xword	0x2ee4071ec0c08dc2
	.xword	0xda01d196a94db4e3
	.xword	0xac2da5eb1c875db4
	.xword	0x4f944f6b19e074ce
	.xword	0xd8c9275140ea7532
	.xword	0xded61c5d84330920
	.xword	0xce1e51d4587fd3e9
	.xword	0xe2d11adceeb07a38
	.xword	0xdc41de3dc87f983c
	.xword	0x7962e13b6bbd4e9e
	.xword	0x69b0c3123c379071
	.xword	0xce3a35791886fd04
	.xword	0xd2d3f743c12bdd0d
	.xword	0x9afacf814df4e0d9
	.xword	0xb6be335c2e097000
	.xword	0xaed5a2abd270d86e
	.xword	0x880de40b6f8a080c
	.xword	0xaa7064e2c7098f48
	.xword	0x0e8d22668a21db90
	.xword	0x19466743d0bca187
	.xword	0x5697993453437136
	.xword	0xb2acca0d4cb2d015
	.xword	0x6c43bacd963782f8
	.xword	0x570aec93e4268f27
	.xword	0x840bf5b1b2f1e23f
	.xword	0xb32d9db51ea53fb3
	.xword	0xde95c57c257944a6
	.xword	0x3d20f1df52afe8c5
	.xword	0x654a78d604f1152d
	.xword	0x0f3dc43b358817fe
	.xword	0xb5465ad68ad207ad
	.xword	0xe59383518cd566b1
	.xword	0x0146846b496e8d51
	.xword	0x824c720753c68e9c
	.xword	0x1684d25920a27211
	.xword	0x3340019272ea0aac
	.xword	0x9cf47ee0259780c1
	.xword	0x4faed34bfadffa15
	.xword	0xf5da87b93cf0801c
	.xword	0xc287c823ee74473f
	.xword	0xee28501078a3cd48
	.xword	0xd1d949e5e166d8ad
	.xword	0x95e27772d051c6fd
	.xword	0xb56e2ebca974f911
	.xword	0xb06eee08c5c0a2d0
	.xword	0xafe9509067bf3e09
	.xword	0x83151b7b6b46f113
	.xword	0x5f78e93842a38c4a
	.xword	0x0057005015998b20
	.xword	0xd7e5acbe80ba5a1d
	.xword	0x0310960ab33db938
	.xword	0x78e36ce924c3bd72
	.xword	0xe2dfafddee07efa1
	.xword	0xbb42e8e895f5e98d
	.xword	0xb9da4e8d47bd1d7e
	.xword	0xfcf4c875c6adebc7
	.xword	0x54a8db50f5dbc3cc
	.xword	0xb9c6b51baad91595
	.xword	0x13d8bc9e49ba0921
	.xword	0x40fe86ac5974d68f
	.xword	0x6b1525ee91490c65
	.xword	0xb44a5beaa3a47b95
	.xword	0x46abb58329a1de06
	.xword	0x02c0489ca2a5a23c
	.xword	0x7af927bef7a9226a
	.xword	0xca497a5aee86d2c0
	.xword	0xb2c199308ebc1207
	.xword	0x80b0521c4fd1db3f
	.xword	0xfc4dc6bf987d55fa
	.xword	0xc79602a061bd0bb5
	.xword	0x91b62e15132fcdf1
	.xword	0x5427cf89c6d32860
	.xword	0xf426218ea698e4da
	.xword	0x08e20e0b9c702905
	.xword	0x2384f8c625edcb14
	.xword	0x8a7f4a400ace3c96
	.xword	0xc23afae6e5075eb2
	.xword	0x377bceba115a4876
	.xword	0x01aebf8d9cd69e5a
	.xword	0x1555e5c03200f757
	.xword	0x1a81dcecde99038e
	.xword	0x06d13c871c00ac1e
	.xword	0xe1670e5f20c5d1b9
	.xword	0x0655bfce96ba5a68
	.xword	0xfc3e5ec1f0f48452
	.xword	0x67680a18a677ca8c
	.xword	0x0ecfa70759ba84b0
	.xword	0x3621047299d5c471
	.xword	0x9e8eb07e0fe120c1
	.xword	0xe9f9a568c2d1b3f4
	.xword	0xd0fd8f0a02302ebb
	.xword	0xddb54ab1e60a975a
	.xword	0x7c0d719c9ab95b83
	.xword	0xa5f31a4813ef2f64
	.xword	0x06de21a4e2a5dce5
	.xword	0x2ebfd1fbf29924df
	.xword	0x2133094e5c33c2a4
	.xword	0x6450037f1b95c150
	.xword	0x698de937deffe3e3
	.xword	0x95de8ff7113892db
	.xword	0x8b016e126c6be62b
	.xword	0xd27c4a7fb243e9b2
	.xword	0xd26e42c435730c68
	.xword	0xca52839f23023cce
	.xword	0x56bc29553481e134
	.xword	0xe348949ef5860e6b
	.xword	0xa1472a07f9738818
	.xword	0x8f484100e5c33653
	.xword	0xda42eee03812288a
	.xword	0xef90544ea0ca8485
	.xword	0x22dee7e433e17a21
	.xword	0x5d27a8d93f2d8a70
	.xword	0x6cab90cf84c8550a
	.xword	0xbc4cdbae153ef6b0
	.xword	0xdea5f2fd05b1235f
	.xword	0xb98176652fb9bf44
	.xword	0x191cae98dd2bbb81
	.xword	0xb329073c6cd437ca
	.xword	0x5e4f5bfbf293f8e5
	.xword	0x74285a0831fc3e7d
	.xword	0xb429977a8d42737b
	.xword	0xd350b83d11ed0525
	.xword	0x99b6736c53f9b19a
	.xword	0x4a2fb5766c52e684
	.xword	0x1b5e8b4683240f6b
	.xword	0x9927c776af9d9c8c
	.xword	0xa2b7b8155e641c68
	.xword	0x89366db24b40f88b
	.xword	0x7d7720cce647a8b2
	.xword	0x3c9bf321cb893323
	.xword	0xec21d8f6662df078
	.xword	0xb681d088df7872d1
	.xword	0xbd16ecf4dd16a0b3
	.xword	0x897c60695799c074
	.xword	0x5eeb4ba1bed535c8
	.xword	0xb14e775d83c9862f
	.xword	0xe678d40b24998ce4
	.xword	0xc141cf290b5bd084
	.xword	0xc2f1d92cafcc872b
	.xword	0xa69fe03364315de2
	.xword	0x37e0f6ecb336b89a
	.xword	0xbdb2579a27dfc514
	.xword	0x90af39c1781dd9bb
	.xword	0x1eac4036e4f68c20
	.xword	0xc98e09d861f1c1d6
	.xword	0xb14ba695deb9d704
	.xword	0x1d3b90aa1a1d7747
	.xword	0xa90c7aeb28db2218
	.xword	0x43b16d9011395636
	.xword	0x36b11ac30c6f3876
	.xword	0x15f9b4780b517c4c
	.xword	0x59b732fc0ce687fe
	.xword	0x1551c3ee8a451b97
	.xword	0x13a0ee277b87bb41
	.xword	0xfff86b8af733a0ae
	.xword	0x0ab7957b7fcff07c
	.xword	0x5988ba3f15bb7787
	.xword	0xd2be99dfa04040c4
	.xword	0x23c419b713a7dcea
	.xword	0x525a3bfdfe2ed5c7
	.xword	0x7d68950e63418af2
	.xword	0x1e289bf0c51f2e6a
	.xword	0x135fd97f6e154395
	.xword	0x8891096a8735f662
	.xword	0x0ec15b64e195936e
	.xword	0xdd9ebc7335f80530
	.xword	0x864c6eddfd718bed
	.xword	0xca0a2228bb1cbd93
	.xword	0xfe01da6d56cc1fbe
	.xword	0x4c7dec130db74b5f
	.xword	0x4440be3a7b6256e2
	.xword	0xc92815dafbb93b0a
	.xword	0xbd595dff45654ef1
	.xword	0xc86bdc78e7dc59e8
	.xword	0x107b2ae65bb9fc88
	.xword	0x7c00ba3e5e2465d6
	.xword	0x0e8de8e7286bba1f
	.xword	0x4a6f07a8f5892f2f
	.xword	0xbc4c83783abd97ff
	.xword	0x71bbd8a756559a70
	.xword	0xac494d657bf4cb71
	.xword	0x816155f794e284cc
	.xword	0x2eea9882e2d1d99e
	.xword	0xdd4679115adb62ee
	.xword	0x683e3c7fa9e9e2b8
	.xword	0x5e9af1a35017ba81
	.xword	0x262ac52e6208e2a1
	.xword	0x36789fcf7faaa565
	.xword	0x10f69b08084178ac
	.xword	0xba73988f77e23804
	.xword	0x665227555af8ec9a
	.xword	0x4a4fd4fccc8928c3
	.xword	0x9e9a5e9d01267374
	.xword	0xf1df78e71701bb0b
	.xword	0x72b3a377921a09a4
	.xword	0x177825d0d72380f1
	.xword	0x7e08e0b5978c97d8
	.xword	0xd472ebecd801dbe0
	.xword	0xa7664dd78e8f988d
	.xword	0x3ce4f9321c4fadbf
	.xword	0xfa1039b0f61aa677
	.xword	0xe432e4ae7fdaa98d
	.xword	0xe8c0d493f4f1a5a7
	.xword	0x6a087d36380dbf3a
	.xword	0xdbba06d13104ae51
	.xword	0xccc42869e9bbd7b9
	.xword	0x61c043bc9829d23b
	.xword	0x851972c550e5d8d1
	.xword	0xdd79d3d125b49fbc
	.xword	0xa8d1f48deb4ac6b5
	.xword	0x62ada2fb76f1ab4f
	.xword	0x0b03ef94b7d0963a
	.xword	0xc32529d049c04ec3
	.xword	0xcbf4d774460bf3dc
	.xword	0x13af8bd8193b9922
	.xword	0x47c8f618714522b6
	.xword	0xddcfd92dd7fae470
	.xword	0xf08560bc5dfb25cf
	.xword	0xb09c0cf379415b8c
	.xword	0xbfc92d768f7f74fd
	.xword	0x44a5f7b84a34d384
	.xword	0xd1d0fb5b9ca218d3
	.xword	0x4f9672a9cfed2eb5
	.xword	0x2121a5b60ee41c4e
	.xword	0xc1a85b2945a76ab5
	.xword	0x3d0a82b9532b0d77
	.align 0x40000
	.data
data_start_6:

	.xword	0x13a920577ab8668d
	.xword	0x74fdc196f4c4970a
	.xword	0xdb54150ae9da5105
	.xword	0xa18d0c172b5da218
	.xword	0xcaf42767d07444ca
	.xword	0x8ceeb57af61caffb
	.xword	0xd621dbee2a61dd47
	.xword	0x9eeeadc6daa29163
	.xword	0x91d9820720ec6d23
	.xword	0x2d93388cb5e793b2
	.xword	0x7b48a94b3b8b3b5d
	.xword	0x8989d1e2f9809599
	.xword	0x71380413822e14dc
	.xword	0xc6a436356f5ef732
	.xword	0x7c98c236cdbe810f
	.xword	0x9a3d2b1dbb6951aa
	.xword	0xa75c104ba16c0e4e
	.xword	0xb531e9e2515afd38
	.xword	0x7eb58ad14583d106
	.xword	0x9a086ee0e7463995
	.xword	0xd07e2e6f2488e9c7
	.xword	0xeaaa26d7cf54df02
	.xword	0xd8ae05fdbcce5bd7
	.xword	0x84560519472881c1
	.xword	0xfde18ce65a0b99b6
	.xword	0x9aa24704b5e360df
	.xword	0xdb500cc60da65155
	.xword	0x34f7b4dcc204fd41
	.xword	0x7230b4a41ec8674c
	.xword	0x855281aebff03ad1
	.xword	0x57f51990a7fef504
	.xword	0x6d7589cb41303610
	.xword	0x05b13b12b4a2871b
	.xword	0xb5221fe1133e5ab8
	.xword	0xc239a56cda63dbb3
	.xword	0x92705fe0d0d2f43f
	.xword	0x344f76c36185177b
	.xword	0x017782dadacf98ac
	.xword	0x2b6ea57b51aa5bc4
	.xword	0x9c35b04eea094569
	.xword	0x8fc07de8c7f24e04
	.xword	0xc672df6963e2cee8
	.xword	0xb8f7a3e2516b286c
	.xword	0x7d76387d11fe17ba
	.xword	0x18ae0c4025274f03
	.xword	0x5302855060f81493
	.xword	0xf8f413847a684e50
	.xword	0xf60ac5bec89ad780
	.xword	0x1637983496cfbee0
	.xword	0xc3384ba7dfd4e0b0
	.xword	0x8b05586538e8c5f8
	.xword	0xf282098913f5587f
	.xword	0x379d248d3718a75b
	.xword	0x8708a0c173a34b64
	.xword	0xb345d22342ead03c
	.xword	0x1f1a2ef4e6e4d568
	.xword	0x678310f4d6d52671
	.xword	0x8e8cca6f893022a6
	.xword	0xbbb54b736da8c161
	.xword	0x9a8209479cfc5857
	.xword	0xc0a9ebe6888780be
	.xword	0x08e212c17dcb3697
	.xword	0x064095df90decb8a
	.xword	0x0245daae3d0f1868
	.xword	0x5b41c5d87ad8bb6d
	.xword	0x0d5606ef6dd3dba0
	.xword	0x962fc684d06c0b24
	.xword	0x1b5e16dd25a8f2d3
	.xword	0x55d1fc48204b9e19
	.xword	0xcf448402ea5a54da
	.xword	0x8fa7e67dbe4b0260
	.xword	0xc33d0a5e15d5503d
	.xword	0xa755ec6e246127ff
	.xword	0xab67e8c6141e8628
	.xword	0xc1e2f4f53890b0f9
	.xword	0x2b1a5b8139169c40
	.xword	0x9d38ea90c6797d27
	.xword	0x42e9ea6b40fcb885
	.xword	0x16c17f6f15fa4bc8
	.xword	0x61511cb44e8099e7
	.xword	0x901a3a62cfc0e9a6
	.xword	0xc1cad44c01dbd8ab
	.xword	0x067a397456370442
	.xword	0xc1ecb44c92333350
	.xword	0x251a273270a20248
	.xword	0xfd52f41afe72a4e7
	.xword	0x10bf81db86993f4b
	.xword	0x5b5f30e6adac2a54
	.xword	0xe5a95e4e60c924ed
	.xword	0xe690c3a7d72912f8
	.xword	0x8941893724977ac3
	.xword	0x214bdfe7bca0b492
	.xword	0x561be26c95b99b99
	.xword	0x4c9371ea529e9103
	.xword	0xb9493c60b85f80a3
	.xword	0x87d05dce5b160b55
	.xword	0x5401bc56d261ed3e
	.xword	0xf4511c7be3b77df5
	.xword	0x381af16cd96e8460
	.xword	0x66adffd10f1fed5c
	.xword	0x65a5158469bda5a7
	.xword	0xb7ebfab5d74249cc
	.xword	0xc0410d595b6f2cc8
	.xword	0x8a0220aa6c8ae3eb
	.xword	0x094ac42cf2f1d848
	.xword	0x65ae12efe4bf6415
	.xword	0x5c80e90d467fe4e9
	.xword	0xdff0bf4e8b6c51ee
	.xword	0x08e6ec943fa3d125
	.xword	0xd4a4fe51cb766358
	.xword	0xdb232a00723d0cdb
	.xword	0xe2b0fc6982bfab39
	.xword	0xf65f43387558e9dc
	.xword	0xead19222af7d4c5f
	.xword	0x1f842e252e429e2c
	.xword	0xf80ed056e6b950a8
	.xword	0x7ff48e69da61339e
	.xword	0x6332532144537965
	.xword	0xac34fb656394899c
	.xword	0xa5847334efa8b177
	.xword	0xeddc451369dfcde5
	.xword	0x275a492fa116da79
	.xword	0x3a7b0490a2894dc3
	.xword	0x000f0f2496dcbef7
	.xword	0x56c762d9e2ed8441
	.xword	0x48bbe8fe623b12b3
	.xword	0x2aa13c46f387ba88
	.xword	0x71f544912fa20a3d
	.xword	0xc899bbf00e5c6a32
	.xword	0x083bf8c19d93594a
	.xword	0x5f71ae9a60a5258a
	.xword	0x6d6776fe3a9d3133
	.xword	0xaae23698acadc6c7
	.xword	0xd71efdda1dc1c4eb
	.xword	0x0d149da149c7dd9c
	.xword	0x322dc3cdf996d4b4
	.xword	0x24ed5456ea03e397
	.xword	0x6252a34e79037f4f
	.xword	0xad12631595743bb2
	.xword	0xeccdf13848534895
	.xword	0xf17b17162186ba48
	.xword	0x15c841365ed4147e
	.xword	0xc7342e10bba20c39
	.xword	0x7343d1f0841cece1
	.xword	0x26f3fa6dacc9b9b0
	.xword	0x4a00c93427ece4d5
	.xword	0xe37fc268692b3b4c
	.xword	0x8160701e6c41186c
	.xword	0x189077973f532e9b
	.xword	0x39177f080d8ee4fb
	.xword	0xcf9b50c4a45e2393
	.xword	0x6945be8fa29fb9be
	.xword	0xe18a6fa855723dab
	.xword	0x6f4e9475916a07f8
	.xword	0xbd5aebe895fbc079
	.xword	0x55719b9798da7f20
	.xword	0x0348156814c3e63b
	.xword	0x8e7ea383aa8eaa29
	.xword	0xabad1ba83e6b26fa
	.xword	0xc037f45aed5effab
	.xword	0xbccb1b6e9aefc97b
	.xword	0xbf6bc64fa5aac6c1
	.xword	0xd1df5a65491beb55
	.xword	0xf209e53c4277b051
	.xword	0xf7d107b539a442ec
	.xword	0x4966e5d1428bb6dc
	.xword	0x519317fbb2f2c200
	.xword	0x3ccb76db9e809f6f
	.xword	0xe7d49121d66f1ea6
	.xword	0x0b2d48d4ecdbf6d0
	.xword	0xde9368f967d0a59a
	.xword	0xed01090f046eb95e
	.xword	0x6ad47fad0d7eebbb
	.xword	0x977be26b25a52618
	.xword	0x86181e8f7c621a73
	.xword	0x98db19264fc5d315
	.xword	0x1cb670fd4ca2af3d
	.xword	0x282e7f350fd96523
	.xword	0xc50877dc522fda66
	.xword	0x1995e03fce694293
	.xword	0x996e65bd7617526e
	.xword	0x25b0449f093d80ab
	.xword	0xd58955c7acfcbaf3
	.xword	0xa2cd72d77d8c2a6d
	.xword	0x5b2cce805f0f0bc3
	.xword	0xde3ce5979131b98d
	.xword	0x741f0f227a66851b
	.xword	0x0e903b46cdbdb1a1
	.xword	0x42ff8ec4eb665679
	.xword	0x93ac7aa3a7fd9f84
	.xword	0x003df0fcd88b5260
	.xword	0xf5b0276fca157a9e
	.xword	0xda16cb07d418a6cb
	.xword	0x9d5cd27092f339be
	.xword	0x3eccc1793a0b80b4
	.xword	0xf6a63c090f7dad9a
	.xword	0xb3f4c3b0ad0de664
	.xword	0xed86dcdff7438e02
	.xword	0xa26d850cdfa9c3de
	.xword	0x2696f8b3dfc53c15
	.xword	0x8732f19b42a419c8
	.xword	0xe987829b88d42739
	.xword	0xa410f9a02f94a407
	.xword	0x093ab12088e0fd0d
	.xword	0x3a81847e0019aa0f
	.xword	0xbeaf22040166c80e
	.xword	0x62950965648214f9
	.xword	0x438fb6d331febfc0
	.xword	0x76c9038db35e9469
	.xword	0x42663fadc6551f65
	.xword	0x2db379873312c8ae
	.xword	0x7658b7c1deed6517
	.xword	0xca8cacdf2b4b62ca
	.xword	0x9cd4df46b02c3f33
	.xword	0xe2777226f37626d7
	.xword	0x93bfd4087dba6605
	.xword	0xf198a95c037f4aa4
	.xword	0xcb42a74c08ac59a9
	.xword	0x936717e5efe960b4
	.xword	0x5499bf2e5bad4320
	.xword	0xcff05952f7787a19
	.xword	0xd800ca321b97b015
	.xword	0xa0af54b4a706b2c5
	.xword	0xeea66f8dfe39013a
	.xword	0x75a4d8f5f6e4553b
	.xword	0xa595340f7c479651
	.xword	0x9309a8a8f5f537e8
	.xword	0x5b391043a47aef7e
	.xword	0xd177301db479b9d5
	.xword	0x1657f677340d3c80
	.xword	0x67dbc4f4616fac29
	.xword	0x3fc8ca5b57d36d66
	.xword	0x38c5c2e0852b03c8
	.xword	0x4c56263672305c05
	.xword	0x0196d52648e52e08
	.xword	0x5bc8d4a2d379592b
	.xword	0x261972fab393c4c8
	.xword	0x5d2a66165a694fac
	.xword	0x24ba87777f03e552
	.xword	0x4382c7707830c45c
	.xword	0x139eb8babed6c705
	.xword	0xfa0205a4b4ae39a8
	.xword	0x6a39ffad108b7e3d
	.xword	0x5251b6599823c297
	.xword	0x702dd2c8be14af64
	.xword	0xdb7a8b536d981807
	.xword	0x3f922afa329ca1ce
	.xword	0xc2893e9491ad4286
	.xword	0xd451ba6925281528
	.xword	0x22c83863f452d08b
	.xword	0xa569ead4dfb821d9
	.xword	0x1593283952ea61a2
	.xword	0x1ecd39e72b8776c5
	.xword	0xe965a22ab2bcf4d1
	.xword	0xff7bac0418c21606
	.xword	0x1167c95c5ca9ef3f
	.align 0x80000
	.data
data_start_7:

	.xword	0x1978b45109335758
	.xword	0xfdf2c1c9e3232a24
	.xword	0xb3966fadd154bce1
	.xword	0xe9d57d0e9f8eed5e
	.xword	0xc43cb025525157f1
	.xword	0x440fa76b1f5ea998
	.xword	0x89197cc04a432e31
	.xword	0x82cbfe92df5416a7
	.xword	0x2028e8099568bfd0
	.xword	0x843209b51892dc37
	.xword	0x986508a6fbbe1646
	.xword	0xd378c28738486569
	.xword	0x3518426fdbb592a0
	.xword	0x6ee6d6604109f680
	.xword	0x52251165ea360a1b
	.xword	0xed786fbac453d820
	.xword	0x919a1af46ac13fe8
	.xword	0x1f0a04cb1e76636a
	.xword	0x7ee9bb7d180b39fe
	.xword	0x6a24a04127743f60
	.xword	0x50e04f24f22c6ed9
	.xword	0xdafe3600e7401c2d
	.xword	0x0b9699c002bd6da8
	.xword	0x33c654da1c8980c0
	.xword	0x0160af7d6ed6beee
	.xword	0x40dacc303bc58034
	.xword	0xd067c67933dce12b
	.xword	0x23535d29a3fde0db
	.xword	0x91264956fb92453a
	.xword	0x062acd53198eefc2
	.xword	0xc30050fd1cd9f9d9
	.xword	0x2b31a4bf52cac84d
	.xword	0xd4d501b1711e5ea4
	.xword	0x46795a89f30b434a
	.xword	0xece7926945b88e28
	.xword	0xb18781c7cb7f3740
	.xword	0x34efa3eb54d9cd84
	.xword	0x52277b411b9600a6
	.xword	0xb83bcfefb927848a
	.xword	0x9242090c2a6a5634
	.xword	0x79b62921c72e3f40
	.xword	0x2e200b1f9a67559c
	.xword	0x31831a35c533dd7e
	.xword	0x325e757909418b13
	.xword	0x128b7b8106e81661
	.xword	0x4eb90a62f8735929
	.xword	0x10e150998f6358f4
	.xword	0x7215bbd1cdb4938f
	.xword	0x662d6a8b4342e4f5
	.xword	0x7c44a60cb4057e2a
	.xword	0xb118b62fb73685e5
	.xword	0x5ab857599bce3b84
	.xword	0x7a60501e417679ff
	.xword	0x588b33a05f0bdeaf
	.xword	0xb6b8940796fd8ed0
	.xword	0x2f8afc1920e9d0d1
	.xword	0x4a7e71a4fffd7362
	.xword	0x33543a1fbbd4a618
	.xword	0x3d3d38d0b6ec1999
	.xword	0x4abbaeae53f156bf
	.xword	0x78008e57f8b0116b
	.xword	0xf1d558a64ab13aaf
	.xword	0xd69079c583de44c6
	.xword	0x624e502071d36c86
	.xword	0x59029e781aa77ed8
	.xword	0x87e8ad45c89436e0
	.xword	0xca2af252b6319353
	.xword	0xe7866cedae7b82e9
	.xword	0x958d6fe14b98794a
	.xword	0x20053e5aa758181a
	.xword	0x70d65832da429c8d
	.xword	0x7e90799212ee627e
	.xword	0x8534b7738782168b
	.xword	0xd4a2fb3e03147ef7
	.xword	0x1614c89b0f77c8ce
	.xword	0x47f2d675d2315001
	.xword	0xb6bac9f5aa7b496e
	.xword	0x7466f8a562207f7d
	.xword	0x7f07cbe115f89160
	.xword	0x50deea8ed9125b4d
	.xword	0xfc0501394d82e78c
	.xword	0xc9228c7212eb5ae5
	.xword	0x18638998802f2f2e
	.xword	0x00eb087c86752941
	.xword	0x40b159fee1017d1e
	.xword	0x53508496af7e20e8
	.xword	0x1261dae3f70eed71
	.xword	0x453cb85861ff913a
	.xword	0x26a0c5af5266cc19
	.xword	0xd5ea7df2e3a490e7
	.xword	0xf882b8c1c9528cb7
	.xword	0xdb9e6fabca13b8e8
	.xword	0x994a289f9b3436f4
	.xword	0x08ecc28a154d5faf
	.xword	0x9f5e4ddc4399743d
	.xword	0x224246f6e89dec65
	.xword	0xfbaa132354c605fd
	.xword	0x73b9f105c15c7c02
	.xword	0x540346bd7f818ebb
	.xword	0xc099cf036ff14895
	.xword	0x82ebb38eebe11523
	.xword	0x68738613cb08308f
	.xword	0xac2990749194c68d
	.xword	0x5127389d7aecacd6
	.xword	0x778ff157fbb030cb
	.xword	0xe39db858a1dbc119
	.xword	0x5c90cb9ef59dcc8a
	.xword	0x38e889e457f4854c
	.xword	0x1065ab4db88ec353
	.xword	0x5cc85576c0a66472
	.xword	0x91959228b7216a72
	.xword	0x35bb1a9968a6c33a
	.xword	0x26a6200c9883bd4d
	.xword	0x08106df1a96f6f3e
	.xword	0x357f6addf42cb976
	.xword	0x2245ab5aae6155d6
	.xword	0x4ae9897884538ae2
	.xword	0x7e648f0c2ffb5a5c
	.xword	0x8480b200decda1fa
	.xword	0xe0cd0c5deed19462
	.xword	0x578b57edef3e7f0a
	.xword	0xa817e6103b68eb25
	.xword	0x8b62f2986d47431c
	.xword	0x270804b99e7292f0
	.xword	0xe17d8b062862bffa
	.xword	0xdc06aaba2fff0ff9
	.xword	0xfc4b7107b49238a2
	.xword	0xfe9339c7d18ef707
	.xword	0xa39f45a8d25db83b
	.xword	0x4d394d07d73cb94c
	.xword	0x7f6ed3858c9d206e
	.xword	0xcd109658f9da5256
	.xword	0xe0740bc9f0e1cc2c
	.xword	0x86fd7bc955dfa07f
	.xword	0xf136ce517b79ca58
	.xword	0x74dab19cb9998884
	.xword	0x18c018ecd4dbaaba
	.xword	0xfeaac1dfdbc49128
	.xword	0x8f30624d0962572c
	.xword	0xeef535ccea5709c0
	.xword	0x82485e7e30fe9aa2
	.xword	0x0814f955dda75ddf
	.xword	0x1e1337bef82e1a52
	.xword	0xfdcb7f3c28423ec7
	.xword	0xff5460d345dc3690
	.xword	0x3c2af109df41d611
	.xword	0x9730eeb9be4a2d6f
	.xword	0x1e4e8d055d03341f
	.xword	0xb4a0db00a1938b83
	.xword	0xa6589752dfe130a8
	.xword	0x842f5c65d83ecac2
	.xword	0x6743c1006765ead4
	.xword	0xb5552387767f1639
	.xword	0xd629ec48cd352af5
	.xword	0xe4e501bbc7c3d1b2
	.xword	0x36a728dad4f380c2
	.xword	0x1fdced0dabe07b0c
	.xword	0x4d086c98abf02835
	.xword	0x565caf22777870f2
	.xword	0x40c0911a9564c630
	.xword	0x78a7e302d6cd0c1b
	.xword	0x5060f86ff53b9be7
	.xword	0xcc8706b148ccebb9
	.xword	0x360d8aa1d5266e47
	.xword	0xaf5fccd3881b925f
	.xword	0x6f6508e7eeca46c3
	.xword	0xcc6c705cedf80347
	.xword	0x9b078d292f2a4d42
	.xword	0x25934f96b9325e8c
	.xword	0x371f68f349eb7ba2
	.xword	0x986aab7e6cbcd4e0
	.xword	0x8353f347ee44a228
	.xword	0xdec66077b8aa56d6
	.xword	0xd0d8f3e73220ced2
	.xword	0x09285935adaab2cb
	.xword	0x5c0b49387c44a2b6
	.xword	0x11de4fdc193dc15c
	.xword	0x8c47edfbf8af4c4f
	.xword	0x6aca966c792beae6
	.xword	0x785fe21ced91be82
	.xword	0x563b79540f3ccee3
	.xword	0xa7c5fe8d1724c1fc
	.xword	0x50873e32784158b0
	.xword	0xbb5b6739ae837d55
	.xword	0xb246ad92f9c1492f
	.xword	0xf765afb937dcd3c6
	.xword	0x18cfec805fe0cef1
	.xword	0xf7c67e3f5487085d
	.xword	0x0c8fc3768dc018f3
	.xword	0xcc8c4c73f949046f
	.xword	0x497c84b0fbd6a2f9
	.xword	0x1d5d310cff48ffe9
	.xword	0x452c3ccfe76c30fd
	.xword	0x3b7e6107d8e6441f
	.xword	0x530f994536fe2a1b
	.xword	0x5580167e1ccce28d
	.xword	0xfe4332895d7d08f2
	.xword	0x2dbcbabd0c02ef6f
	.xword	0xb247858b1d60612f
	.xword	0xe0587c766ce92b4f
	.xword	0x0c3b5952109dd6b6
	.xword	0x33a26d17b71e8097
	.xword	0xf52415b296ee3b5f
	.xword	0x091049258b3f3537
	.xword	0x5eba2599da3f6b1f
	.xword	0xde234d636a80f962
	.xword	0x8f1452228939b9da
	.xword	0x1ba9338d4847091f
	.xword	0x2d69efa4254b7f01
	.xword	0xa8e8c6db62806979
	.xword	0xd7ea9efcfb5b05fe
	.xword	0x7e639b17d8d1097b
	.xword	0x9368e0b0adce5303
	.xword	0x9d7d3faa2d2ff784
	.xword	0xe55ee61d92d6340c
	.xword	0x6227c75a04f50c21
	.xword	0xcb646642040569ce
	.xword	0x15f9add489e639d0
	.xword	0x78c81b9970f6e70c
	.xword	0x1ed905f941e5fdad
	.xword	0x9d6ec18a7c0fc96b
	.xword	0x19f5ef913563a919
	.xword	0x42da4bb0405a0c42
	.xword	0xb2c4bb6c8b9325f7
	.xword	0x1a8aa60f86f87c9a
	.xword	0xa3f092ab0dd59c93
	.xword	0xd024b2bd54085829
	.xword	0xd7c36124771235e0
	.xword	0x3b7415ce1010eb83
	.xword	0x1bd20b2767042833
	.xword	0xf88df3bbe62c34b0
	.xword	0x36f432148314266f
	.xword	0x7a63e1596aae848f
	.xword	0x4a6d93774f006ebe
	.xword	0x429b082128b228a9
	.xword	0x1bd7822a4674389a
	.xword	0x12959ee1945836e1
	.xword	0x808564a707f6a987
	.xword	0x54b59feff69134fc
	.xword	0x6db348b90f003a70
	.xword	0x9e7c5227e42b97ba
	.xword	0xc959018858df0941
	.xword	0x18fa3a8ccf9e02b2
	.xword	0x59fcb3f666d51626
	.xword	0xb46b1f8e018e1288
	.xword	0xb67055867386a44f
	.xword	0x32aafc2b6afc7cb6
	.xword	0x3bad2182ae972eb8
	.xword	0xe986ed5e4591a13e
	.xword	0x85a14943da2548b9
	.xword	0x52c71221b217af1a
	.xword	0x0ae1e3b2d6e8c26c
	.xword	0x84915cc4bef4e915
	.xword	0x43440c684dc28b77
	.xword	0x8f4b66f59dbfe854
	.xword	0xd2ffbc1463bdbf82



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
