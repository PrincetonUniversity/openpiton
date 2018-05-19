// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug4017.s
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
   random seed:	404724121
   Jal ld.j:	
********************************************************************************/


#define MAIN_PAGE_HV_ALSO
#define NO_TRAPCHECK
#define ALL_MY_INTR_HANDLERS
#include "my_intr_handlers.s"
#include "enable_traps.h"
#include "hboot.s"

!SIMS: -non_shared
!SIMS: +spis

.text
.global main

main:

	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x1
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000840, %g1, %r17
        setx  0x682eecc560aa0786, %g1, %r0
        setx  0x55a1ef691f7eef1f, %g1, %r1
        setx  0x2d48de4e42b65e90, %g1, %r2
        setx  0x8e755d8a005e2a7f, %g1, %r3
        setx  0xe83fd5de4812880d, %g1, %r4
        setx  0x21a4d654cb0ed9d4, %g1, %r5
        setx  0xe8a277197adc0feb, %g1, %r6
        setx  0xc6ab50fd54bdd6c9, %g1, %r7
        setx  0xd8b70d6c08b1bd40, %g1, %r8
        setx  0xfc9d1ab4d4527d35, %g1, %r9
        setx  0x28f93017314cfdb6, %g1, %r10
        setx  0x3fac910efb4562f0, %g1, %r11
        setx  0x908ec092328bc74a, %g1, %r12
        setx  0xfb132482afe82960, %g1, %r13
        setx  0x4cc5c237cad3dfcb, %g1, %r14
        setx  0x96dfa885e133b779, %g1, %r15
        setx  0x88a2d92ee0b5659b, %g1, %r18
        setx  0xaca967a0ab031f32, %g1, %r19
        setx  0x24269b2e212bd52c, %g1, %r20
        setx  0x53f65d5c763948d1, %g1, %r21
        setx  0x25c1708807daeeb3, %g1, %r22
        setx  0x85f0079b2671dd52, %g1, %r23
        setx  0x65837941d7615740, %g1, %r24
        setx  0xbcc6c7ebdf7fdfec, %g1, %r25
        setx  0x55441b34df8a7c3d, %g1, %r26
        setx  0x2e0bbb2efb32e568, %g1, %r27
        setx  0xdb3ff5315b728948, %g1, %r28
        setx  0x83231c35a4c44a57, %g1, %r29
        setx  0xd6bfc99e508e8421, %g1, %r30
        setx  0x20514eef351e1a76, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000400, %g1, %r17
        setx  0x90916c78f641746a, %g1, %r0
        setx  0xd1336ceebbca9c26, %g1, %r1
        setx  0x5160824b959e1d7c, %g1, %r2
        setx  0x6c860dca62977b22, %g1, %r3
        setx  0x03dc455707fb5bd9, %g1, %r4
        setx  0xcb9e4c76cd45df85, %g1, %r5
        setx  0x2fbd3ab7525e3a64, %g1, %r6
        setx  0xfcfa1e29951aa2d2, %g1, %r7
        setx  0xdeb56207a5c6dc14, %g1, %r8
        setx  0x98c86397082652ff, %g1, %r9
        setx  0x4e1ea43abc3f5c44, %g1, %r10
        setx  0x50b66454e9ac57ee, %g1, %r11
        setx  0x5247f8c8d343101f, %g1, %r12
        setx  0x15bc7fed54803ad6, %g1, %r13
        setx  0xf2bcf5af946e549a, %g1, %r14
        setx  0xb7f6f5cf6fcab383, %g1, %r15
        setx  0xed93b5fdf00e8ae9, %g1, %r18
        setx  0x0cbc1af9d9bd1ea8, %g1, %r19
        setx  0x74e631100d5c15e5, %g1, %r20
        setx  0x9b8b2a24b683113d, %g1, %r21
        setx  0x558911001325207e, %g1, %r22
        setx  0x835b0cbd76d96dfd, %g1, %r23
        setx  0xfee9a86994f120c4, %g1, %r24
        setx  0xf55586194199c79c, %g1, %r25
        setx  0x999dc83afb0a6802, %g1, %r26
        setx  0xdc56852a9e6d500d, %g1, %r27
        setx  0x587b1cf03879c163, %g1, %r28
        setx  0x6153894598c55840, %g1, %r29
        setx  0x23969b81c3fcccc5, %g1, %r30
        setx  0x110fe5613b7abe3c, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000005c0, %g1, %r17
        setx  0xfbd3224e3e86e58e, %g1, %r0
        setx  0x9a3d782c4270d917, %g1, %r1
        setx  0x73efb00d5b5cfef4, %g1, %r2
        setx  0x3af0ee691b2d6422, %g1, %r3
        setx  0x93a240380c1f67b5, %g1, %r4
        setx  0x3843869713b40a64, %g1, %r5
        setx  0x1fc994e1b3d46ffe, %g1, %r6
        setx  0x99baafa771648381, %g1, %r7
        setx  0xbe5bec2e0269670a, %g1, %r8
        setx  0xc9aa08fd445a2af5, %g1, %r9
        setx  0x6997d13722961353, %g1, %r10
        setx  0x3a72661ab4596a3c, %g1, %r11
        setx  0x4cc06c23ff8014bf, %g1, %r12
        setx  0xce581cbae5f283a3, %g1, %r13
        setx  0x1f93efd11d670fe0, %g1, %r14
        setx  0x7247c862967c61dc, %g1, %r15
        setx  0x11252ccb41f92790, %g1, %r18
        setx  0x8e3b2a23850e40cb, %g1, %r19
        setx  0xb4138a5c580639a8, %g1, %r20
        setx  0xf36afd59934a7dda, %g1, %r21
        setx  0x456f0864ccd3e047, %g1, %r22
        setx  0x735437d1b20a5f57, %g1, %r23
        setx  0x38218e47e8099676, %g1, %r24
        setx  0x94d86b6785c5c3ab, %g1, %r25
        setx  0x2c46827d2a174218, %g1, %r26
        setx  0x773e950d8a65f6f6, %g1, %r27
        setx  0xff2bfe3e5263beff, %g1, %r28
        setx  0xe3e7c7814b588b4e, %g1, %r29
        setx  0x7791cf4bc6cb9523, %g1, %r30
        setx  0xfab1be6a5aa94e9c, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000970, %g1, %r17
        setx  0xeb03dffe3bd4da5b, %g1, %r0
        setx  0x83cf5cd58261d401, %g1, %r1
        setx  0x1a75391f2c1c4c47, %g1, %r2
        setx  0xc461b73192854aa1, %g1, %r3
        setx  0xb4c1b3d20f19cf78, %g1, %r4
        setx  0x7426130bd1692a94, %g1, %r5
        setx  0xe82464cd472a088d, %g1, %r6
        setx  0xe9b0d365f993583e, %g1, %r7
        setx  0x1be08710bd1a842d, %g1, %r8
        setx  0xaf261b76b0f28569, %g1, %r9
        setx  0x98cd431b0ba9f69b, %g1, %r10
        setx  0x39fa40635d990f13, %g1, %r11
        setx  0x9c47f78c39d9226f, %g1, %r12
        setx  0xb382e62f65984943, %g1, %r13
        setx  0xca067eac49fef75e, %g1, %r14
        setx  0x09c4b706af8afc9f, %g1, %r15
        setx  0x41987a656d410a3c, %g1, %r18
        setx  0x40ab9635d9f123a8, %g1, %r19
        setx  0x29b0b0be1306ea77, %g1, %r20
        setx  0xe91ab35930d192f8, %g1, %r21
        setx  0x7ae4f644ecca60c8, %g1, %r22
        setx  0x13004ad0916b384a, %g1, %r23
        setx  0x7ffcd56d71a134c6, %g1, %r24
        setx  0x55bec8b82db0301f, %g1, %r25
        setx  0x652d60156e5d207e, %g1, %r26
        setx  0xcb7e556a49223638, %g1, %r27
        setx  0x90016fa319aa8179, %g1, %r28
        setx  0x311cb8e2c6233221, %g1, %r29
        setx  0xc3d51bc019758ab9, %g1, %r30
        setx  0x410a186c547dc06e, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000400, %g1, %r17
        setx  0x33c1c6e2770af186, %g1, %r0
        setx  0xe42b956454bc8f89, %g1, %r1
        setx  0xf7fe16ee2479deaa, %g1, %r2
        setx  0xc9301196df20c868, %g1, %r3
        setx  0x2a3ffecc26accfa9, %g1, %r4
        setx  0x933c1fce20fdad4b, %g1, %r5
        setx  0xbe007964f931cd13, %g1, %r6
        setx  0x18389be7882f02f7, %g1, %r7
        setx  0x544a0eff94834842, %g1, %r8
        setx  0x1dc2dbc2c0889e20, %g1, %r9
        setx  0x9ecab0c68c0bf9e2, %g1, %r10
        setx  0x84fe1cd36b489183, %g1, %r11
        setx  0x1e24bea3bd2b7a8d, %g1, %r12
        setx  0xf11a967ef34332cf, %g1, %r13
        setx  0x2e8327301a15fbb4, %g1, %r14
        setx  0x66bfa778df07fbcd, %g1, %r15
        setx  0x52225edecb5d3b22, %g1, %r18
        setx  0x5774ee9666110dcc, %g1, %r19
        setx  0x810021e7344821fa, %g1, %r20
        setx  0x4ef72571e2e65d6d, %g1, %r21
        setx  0xc2128688ffe1c7b4, %g1, %r22
        setx  0xad1947693c797bba, %g1, %r23
        setx  0x127dc1d4788df1ef, %g1, %r24
        setx  0xe2329e8044c96ed6, %g1, %r25
        setx  0x69f687a3ad72b458, %g1, %r26
        setx  0xa0b6949e7d7acb0d, %g1, %r27
        setx  0x6c1cb5262b5b7831, %g1, %r28
        setx  0x340aaa7b8af21760, %g1, %r29
        setx  0x1dbadba5299cc229, %g1, %r30
        setx  0x612adc30d8030dc4, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000500, %g1, %r17
        setx  0x4b79d0728fbc8498, %g1, %r0
        setx  0xd37d54fd1e05c05e, %g1, %r1
        setx  0x8dc52546b2b71688, %g1, %r2
        setx  0x151a6cde26cced2b, %g1, %r3
        setx  0x3ef5ab672afc4090, %g1, %r4
        setx  0xf9531ee735b162b2, %g1, %r5
        setx  0x6635f06471531272, %g1, %r6
        setx  0xb45485632d609c8d, %g1, %r7
        setx  0xb5b7a42f3ecb7a8a, %g1, %r8
        setx  0xd7379e8526ebcabe, %g1, %r9
        setx  0xc5d597a444a84373, %g1, %r10
        setx  0x5f04420ea73e0515, %g1, %r11
        setx  0x6284bf089e57e8c3, %g1, %r12
        setx  0xb2b00ee895b6c90e, %g1, %r13
        setx  0xd3f2ebbbe92d4883, %g1, %r14
        setx  0xd834e5e671503545, %g1, %r15
        setx  0xb56cc06f1e0e2f32, %g1, %r18
        setx  0x57cf028a054bd366, %g1, %r19
        setx  0xbdde2fa4499fd82e, %g1, %r20
        setx  0x210179653e54e605, %g1, %r21
        setx  0xfd3275107b0ae6b9, %g1, %r22
        setx  0xc25d2331a3101c28, %g1, %r23
        setx  0x74dfbb8616d76345, %g1, %r24
        setx  0xc6fc4b79442d6566, %g1, %r25
        setx  0xab1a0e66ab14fb14, %g1, %r26
        setx  0xd8c434b27ca123bf, %g1, %r27
        setx  0x0ab08f857bb45bf8, %g1, %r28
        setx  0xebcfa8242dc50b7e, %g1, %r29
        setx  0xded497bacd3d7afa, %g1, %r30
        setx  0x522f3fac068fc9e8, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000650, %g1, %r17
        setx  0x03b8222c12aeb6a9, %g1, %r0
        setx  0x29d135438f5fbd8e, %g1, %r1
        setx  0x1c11a5aa1fa89cff, %g1, %r2
        setx  0xf21ca8e540133ffa, %g1, %r3
        setx  0xe9eb6e1dc584d71f, %g1, %r4
        setx  0x105a83777ed8df1f, %g1, %r5
        setx  0xb710eb2b84559ce7, %g1, %r6
        setx  0xd91fa1689800c18e, %g1, %r7
        setx  0x114d6ad42b3a82ea, %g1, %r8
        setx  0x1d5dd8094fbccced, %g1, %r9
        setx  0x0493690f92d65d26, %g1, %r10
        setx  0xdedb498524039630, %g1, %r11
        setx  0x47a4eec7048c86e3, %g1, %r12
        setx  0x0c4d066f4d73034d, %g1, %r13
        setx  0x445dacba12d30cf1, %g1, %r14
        setx  0x137d853092366e32, %g1, %r15
        setx  0xa2c39ca50a9c68f5, %g1, %r18
        setx  0xfe10eea7ab2282d9, %g1, %r19
        setx  0x58371d297c3101b8, %g1, %r20
        setx  0xaad141d4c154cf53, %g1, %r21
        setx  0x55433d0ddfb189a6, %g1, %r22
        setx  0x0840da92d8500213, %g1, %r23
        setx  0x80c5c2c47ff9af79, %g1, %r24
        setx  0x98550bb31d288cdf, %g1, %r25
        setx  0x71abfe333cb66359, %g1, %r26
        setx  0xebb09af3ca0f5d7f, %g1, %r27
        setx  0x44b0b96edd104c68, %g1, %r28
        setx  0x523a67076e745bc3, %g1, %r29
        setx  0xd6a0ac65919711cd, %g1, %r30
        setx  0x268bda7ae4e223dc, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000b20, %g1, %r17
        setx  0x9a35de71e6c37d24, %g1, %r0
        setx  0xa5740ec10c26317b, %g1, %r1
        setx  0xfeee1c1074bf969d, %g1, %r2
        setx  0x601543f195e43e44, %g1, %r3
        setx  0x232e0cc9684023a5, %g1, %r4
        setx  0x28441a32bce3f670, %g1, %r5
        setx  0x526b51c439db566d, %g1, %r6
        setx  0xf0bcb94a4aa71cb4, %g1, %r7
        setx  0x0b47b2f8da719ee4, %g1, %r8
        setx  0xff21de2c53fe212b, %g1, %r9
        setx  0xe2c8374752b6d9c2, %g1, %r10
        setx  0x87723df9e22684b4, %g1, %r11
        setx  0xac08c7a366f30074, %g1, %r12
        setx  0xa34f5c6c287557db, %g1, %r13
        setx  0x86d3c958a53f98a1, %g1, %r14
        setx  0xd25ae4c55e51a9e8, %g1, %r15
        setx  0x2c69de2073647306, %g1, %r18
        setx  0x9f6b473c553a3aac, %g1, %r19
        setx  0x3829b3d0ee39b49a, %g1, %r20
        setx  0x7273d4c2f6d29313, %g1, %r21
        setx  0xdc8c0621275e3276, %g1, %r22
        setx  0xdad3791a116b67bb, %g1, %r23
        setx  0x561b38280527582d, %g1, %r24
        setx  0x9e8a471e5b3f57e2, %g1, %r25
        setx  0x3fa8f92074e90114, %g1, %r26
        setx  0x38cfe3c1b257b96d, %g1, %r27
        setx  0x1757d55a8c6f296f, %g1, %r28
        setx  0x51512bea3e908d61, %g1, %r29
        setx  0xc1703eb1a738a799, %g1, %r30
        setx  0xa636c6bac41a7eb1, %g1, %r31
	save %r0, %r0, %r31
thr3_nuke_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_0), 16, 16)) -> intp(2, 2, 1)
	.word 0xb81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r28
	.word 0x9cac237f  ! 1: ANDNcc_I	andncc 	%r16, 0x037f, %r14
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(2, 3, 1)
	.word 0x949c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0xa6b42d33  ! 1: ORNcc_I	orncc 	%r16, 0x0d33, %r19
thr3_nuke_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_2), 16, 16)) -> intp(2, 2, 1)
	.word 0x8ec42bf5  ! 1: ADDCcc_I	addccc 	%r16, 0x0bf5, %r7
	.word 0x8c040011  ! 1: ADD_R	add 	%r16, %r17, %r6
	.word 0x8a842b6a  ! 1: ADDcc_I	addcc 	%r16, 0x0b6a, %r5
thr3_resum_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_3), 16, 16)) -> intp(2, 3, 1)
	.word 0x983c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0xb73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r27
	.word 0xb53c1011  ! 1: SRAX_R	srax	%r16, %r17, %r26
thr3_hw_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_4), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c842cc5  ! 1: ADDcc_I	addcc 	%r16, 0x0cc5, %r14
	.word 0xb20420dd  ! 1: ADD_I	add 	%r16, 0x00dd, %r25
	.word 0x9b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r13
thr3_nuke_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_5), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a8c20dc  ! 1: ANDcc_I	andcc 	%r16, 0x00dc, %r5
thr3_resum_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_6), 16, 16)) -> intp(0, 3, 1)
	.word 0xab2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r21
thr3_hw_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_7), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa942602  ! 1: ORcc_I	orcc 	%r16, 0x0602, %r21
	.word 0x9d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r14
	.word 0xb12c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0x96340011  ! 1: ORN_R	orn 	%r16, %r17, %r11
thr3_nuke_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_8), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa3c24b0  ! 1: XNOR_I	xnor 	%r16, 0x04b0, %r21
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
thr3_resum_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_9), 16, 16)) -> intp(0, 3, 1)
	.word 0xba340011  ! 1: ORN_R	orn 	%r16, %r17, %r29
	.word 0x82340011  ! 1: ORN_R	orn 	%r16, %r17, %r1
thr3_hw_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_10), 16, 16)) -> intp(2, 0, 1)
	.word 0x8b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r5
thr3_nuke_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_11), 16, 16)) -> intp(2, 2, 1)
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
	.word 0xb9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r28
	.word 0x96840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r11
thr3_resum_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_12), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x8ab42f98  ! 1: ORNcc_I	orncc 	%r16, 0x0f98, %r5
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
thr3_hw_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_13), 16, 16)) -> intp(2, 0, 1)
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
thr3_nuke_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_14), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
thr3_resum_intr_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_15), 16, 16)) -> intp(1, 3, 1)
	.word 0x82442149  ! 1: ADDC_I	addc 	%r16, 0x0149, %r1
thr3_nuke_intr_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_16), 16, 16)) -> intp(0, 2, 1)
	.word 0x8f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r7
thr3_resum_intr_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_17), 16, 16)) -> intp(0, 3, 1)
	.word 0xa68c2efb  ! 1: ANDcc_I	andcc 	%r16, 0x0efb, %r19
thr3_nuke_intr_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_18), 16, 16)) -> intp(2, 2, 1)
	.word 0x90442f23  ! 1: ADDC_I	addc 	%r16, 0x0f23, %r8
	.word 0x8a8c2b06  ! 1: ANDcc_I	andcc 	%r16, 0x0b06, %r5
	.word 0x9b643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_19), 16, 16)) -> intp(2, 3, 1)
	.word 0xa6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r19
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
	.word 0x8eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r7
thr3_hw_intr_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_20), 16, 16)) -> intp(0, 0, 1)
	.word 0x8eb424d6  ! 1: ORNcc_I	orncc 	%r16, 0x04d6, %r7
	.word 0xa6340011  ! 1: ORN_R	orn 	%r16, %r17, %r19
thr3_nuke_intr_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_21), 16, 16)) -> intp(2, 2, 1)
	.word 0xa72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0x94c422b3  ! 1: ADDCcc_I	addccc 	%r16, 0x02b3, %r10
thr3_resum_intr_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_22), 16, 16)) -> intp(2, 3, 1)
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0xaa3c2020  ! 1: XNOR_I	xnor 	%r16, 0x0020, %r21
thr3_hw_intr_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_23), 16, 16)) -> intp(1, 0, 1)
	.word 0xa6840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x9c042f44  ! 1: ADD_I	add 	%r16, 0x0f44, %r14
thr3_hw_intr_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_24), 16, 16)) -> intp(2, 0, 1)
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0xa72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r19
	.word 0x92bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x9e44201c  ! 1: ADDC_I	addc 	%r16, 0x001c, %r15
thr3_nuke_intr_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_25), 16, 16)) -> intp(2, 2, 1)
	.word 0xb32c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r25
thr3_resum_intr_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_26), 16, 16)) -> intp(2, 3, 1)
	.word 0x94b428af  ! 1: ORNcc_I	orncc 	%r16, 0x08af, %r10
thr3_nuke_intr_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_27), 16, 16)) -> intp(2, 2, 1)
	.word 0x960422a5  ! 1: ADD_I	add 	%r16, 0x02a5, %r11
	.word 0x9e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r15
	.word 0xac8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0xb5342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r26
thr3_resum_intr_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_28), 16, 16)) -> intp(2, 3, 1)
	.word 0x99340011  ! 1: SRL_R	srl 	%r16, %r17, %r12
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0xae9c23b7  ! 1: XORcc_I	xorcc 	%r16, 0x03b7, %r23
	.word 0x861426d3  ! 1: OR_I	or 	%r16, 0x06d3, %r3
thr3_hw_intr_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_29), 16, 16)) -> intp(0, 0, 1)
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
thr3_hw_intr_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_30), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa3c242e  ! 1: XNOR_I	xnor 	%r16, 0x042e, %r21
	.word 0x843c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0x923c261c  ! 1: XNOR_I	xnor 	%r16, 0x061c, %r9
thr3_nuke_intr_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_31), 16, 16)) -> intp(2, 2, 1)
	.word 0xa81c2e93  ! 1: XOR_I	xor 	%r16, 0x0e93, %r20
thr3_resum_intr_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_32), 16, 16)) -> intp(2, 3, 1)
	.word 0x9a0c257b  ! 1: AND_I	and 	%r16, 0x057b, %r13
thr3_hw_intr_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_33), 16, 16)) -> intp(0, 0, 1)
	.word 0x901c0011  ! 1: XOR_R	xor 	%r16, %r17, %r8
thr3_nuke_intr_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_34), 16, 16)) -> intp(2, 2, 1)
	.word 0xa81420db  ! 1: OR_I	or 	%r16, 0x00db, %r20
thr3_resum_intr_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_35), 16, 16)) -> intp(2, 3, 1)
	.word 0x84140011  ! 1: OR_R	or 	%r16, %r17, %r2
thr3_nuke_intr_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_36), 16, 16)) -> intp(2, 2, 1)
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0xa7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xac842086  ! 1: ADDcc_I	addcc 	%r16, 0x0086, %r22
thr3_resum_intr_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_37), 16, 16)) -> intp(2, 3, 1)
	.word 0xa6342dba  ! 1: ORN_I	orn 	%r16, 0x0dba, %r19
	.word 0x9ac421c5  ! 1: ADDCcc_I	addccc 	%r16, 0x01c5, %r13
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
thr3_hw_intr_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_38), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c340011  ! 1: ORN_R	orn 	%r16, %r17, %r14
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
thr3_nuke_intr_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_39), 16, 16)) -> intp(2, 2, 1)
	.word 0x9b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xbb342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r29
thr3_resum_intr_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_40), 16, 16)) -> intp(2, 3, 1)
	.word 0x962c2f9c  ! 1: ANDN_I	andn 	%r16, 0x0f9c, %r11
	.word 0x9b7c2401  ! 1: MOVR_I	move	%r16, 0xffffff9c, %r13
thr3_hw_intr_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_41), 16, 16)) -> intp(2, 0, 1)
	.word 0x96842701  ! 1: ADDcc_I	addcc 	%r16, 0x0701, %r11
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
thr3_nuke_intr_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_42), 16, 16)) -> intp(0, 2, 1)
	.word 0x8ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r5
thr3_resum_intr_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_43), 16, 16)) -> intp(0, 3, 1)
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
thr3_hw_intr_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_44), 16, 16)) -> intp(2, 0, 1)
	.word 0x91343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0xa81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r20
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
thr3_nuke_intr_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_45), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0xaa3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r21
thr3_resum_intr_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_46), 16, 16)) -> intp(2, 3, 1)
	.word 0xb5641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x889c2cff  ! 1: XORcc_I	xorcc 	%r16, 0x0cff, %r4
thr3_nuke_intr_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_47), 16, 16)) -> intp(1, 2, 1)
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0xb0c42a39  ! 1: ADDCcc_I	addccc 	%r16, 0x0a39, %r24
	.word 0x87342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
thr3_resum_intr_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_48), 16, 16)) -> intp(1, 3, 1)
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0xaf2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r23
	.word 0xb6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
thr3_nuke_intr_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_49), 16, 16)) -> intp(1, 2, 1)
	.word 0x90b4236a  ! 1: ORNcc_I	orncc 	%r16, 0x036a, %r8
	.word 0x8a94274a  ! 1: ORcc_I	orcc 	%r16, 0x074a, %r5
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
thr3_resum_intr_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_50), 16, 16)) -> intp(1, 3, 1)
	.word 0x90042dc8  ! 1: ADD_I	add 	%r16, 0x0dc8, %r8
	.word 0x92b42c76  ! 1: ORNcc_I	orncc 	%r16, 0x0c76, %r9
	.word 0xaa440011  ! 1: ADDC_R	addc 	%r16, %r17, %r21
thr3_nuke_intr_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_51), 16, 16)) -> intp(2, 2, 1)
	.word 0x989c231b  ! 1: XORcc_I	xorcc 	%r16, 0x031b, %r12
	.word 0xa6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r19
thr3_resum_intr_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_52), 16, 16)) -> intp(2, 3, 1)
	.word 0x9a9c2887  ! 1: XORcc_I	xorcc 	%r16, 0x0887, %r13
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
thr3_nuke_intr_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_53), 16, 16)) -> intp(2, 2, 1)
	.word 0xb4ac267d  ! 1: ANDNcc_I	andncc 	%r16, 0x067d, %r26
	.word 0x94c4269f  ! 1: ADDCcc_I	addccc 	%r16, 0x069f, %r10
	.word 0xacb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r22
thr3_resum_intr_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_54), 16, 16)) -> intp(2, 3, 1)
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x8a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0x888c28db  ! 1: ANDcc_I	andcc 	%r16, 0x08db, %r4
thr3_nuke_intr_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_55), 16, 16)) -> intp(0, 2, 1)
	.word 0xaec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0x92940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0xa6840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
thr3_resum_intr_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_56), 16, 16)) -> intp(0, 3, 1)
	.word 0xb4ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0x93340011  ! 1: SRL_R	srl 	%r16, %r17, %r9
	.word 0x98842731  ! 1: ADDcc_I	addcc 	%r16, 0x0731, %r12
	.word 0x9a942deb  ! 1: ORcc_I	orcc 	%r16, 0x0deb, %r13
thr3_nuke_intr_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_57), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0xad3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r22
thr3_resum_intr_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_58), 16, 16)) -> intp(0, 3, 1)
	.word 0x989c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0xa8942cd0  ! 1: ORcc_I	orcc 	%r16, 0x0cd0, %r20
thr3_hw_intr_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_59), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x96c423e2  ! 1: ADDCcc_I	addccc 	%r16, 0x03e2, %r11
	.word 0x962c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r11
thr3_nuke_intr_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_60), 16, 16)) -> intp(1, 2, 1)
	.word 0xba940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0x9e3c2461  ! 1: XNOR_I	xnor 	%r16, 0x0461, %r15
thr3_resum_intr_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_61), 16, 16)) -> intp(1, 3, 1)
	.word 0x957c2401  ! 1: MOVR_I	move	%r16, 0x461, %r10
	.word 0xa69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x952c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r10
	.word 0xb9643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_62), 16, 16)) -> intp(2, 2, 1)
	.word 0x83643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_63), 16, 16)) -> intp(2, 3, 1)
	.word 0x980c2790  ! 1: AND_I	and 	%r16, 0x0790, %r12
thr3_hw_intr_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_64), 16, 16)) -> intp(1, 0, 1)
	.word 0xb8940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r28
	.word 0xb82c2312  ! 1: ANDN_I	andn 	%r16, 0x0312, %r28
	.word 0x8a8428e5  ! 1: ADDcc_I	addcc 	%r16, 0x08e5, %r5
thr3_nuke_intr_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_65), 16, 16)) -> intp(0, 2, 1)
	.word 0x94342845  ! 1: ORN_I	orn 	%r16, 0x0845, %r10
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
	.word 0x84ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x892c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r4
thr3_resum_intr_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_66), 16, 16)) -> intp(0, 3, 1)
	.word 0x98b4288e  ! 1: ORNcc_I	orncc 	%r16, 0x088e, %r12
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x9e9c2b2a  ! 1: XORcc_I	xorcc 	%r16, 0x0b2a, %r15
	.word 0xac940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r22
thr3_hw_intr_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_67), 16, 16)) -> intp(0, 0, 1)
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0xae0c21a9  ! 1: AND_I	and 	%r16, 0x01a9, %r23
thr3_nuke_intr_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_68), 16, 16)) -> intp(2, 2, 1)
	.word 0xb7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r27
thr3_resum_intr_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_69), 16, 16)) -> intp(2, 3, 1)
	.word 0x82b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r1
thr3_hw_intr_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_70), 16, 16)) -> intp(0, 0, 1)
	.word 0xaf341011  ! 1: SRLX_R	srlx	%r16, %r17, %r23
thr3_nuke_intr_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_71), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
	.word 0x880c2cc9  ! 1: AND_I	and 	%r16, 0x0cc9, %r4
	.word 0xaa142058  ! 1: OR_I	or 	%r16, 0x0058, %r21
	.word 0xa61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r19
thr3_resum_intr_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_72), 16, 16)) -> intp(1, 3, 1)
	.word 0xb37c0411  ! 1: MOVR_R	move	%r16, %r17, %r25
	.word 0x9ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0xb22c2162  ! 1: ANDN_I	andn 	%r16, 0x0162, %r25
	.word 0x993c0011  ! 1: SRA_R	sra 	%r16, %r17, %r12
thr3_nuke_intr_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_73), 16, 16)) -> intp(0, 2, 1)
	.word 0x8f641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_74), 16, 16)) -> intp(0, 3, 1)
	.word 0x989c2eb6  ! 1: XORcc_I	xorcc 	%r16, 0x0eb6, %r12
thr3_hw_intr_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_75), 16, 16)) -> intp(2, 0, 1)
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x9e342c40  ! 1: ORN_I	orn 	%r16, 0x0c40, %r15
thr3_hw_intr_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_76), 16, 16)) -> intp(1, 0, 1)
	.word 0x943c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0xa7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r19
thr3_nuke_intr_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_77), 16, 16)) -> intp(2, 2, 1)
	.word 0x88142bea  ! 1: OR_I	or 	%r16, 0x0bea, %r4
	.word 0x928c2657  ! 1: ANDcc_I	andcc 	%r16, 0x0657, %r9
thr3_resum_intr_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_78), 16, 16)) -> intp(2, 3, 1)
	.word 0x928c2092  ! 1: ANDcc_I	andcc 	%r16, 0x0092, %r9
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
thr3_nuke_intr_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_79), 16, 16)) -> intp(0, 2, 1)
	.word 0x88142e94  ! 1: OR_I	or 	%r16, 0x0e94, %r4
	.word 0xaec42297  ! 1: ADDCcc_I	addccc 	%r16, 0x0297, %r23
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
thr3_resum_intr_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_80), 16, 16)) -> intp(0, 3, 1)
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
	.word 0xb03c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r24
thr3_nuke_intr_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_81), 16, 16)) -> intp(2, 2, 1)
	.word 0x9abc2bee  ! 1: XNORcc_I	xnorcc 	%r16, 0x0bee, %r13
	.word 0xb6042d35  ! 1: ADD_I	add 	%r16, 0x0d35, %r27
	.word 0xae0c2341  ! 1: AND_I	and 	%r16, 0x0341, %r23
thr3_resum_intr_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_82), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c0c23cd  ! 1: AND_I	and 	%r16, 0x03cd, %r6
	.word 0xb4b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0x88ac256d  ! 1: ANDNcc_I	andncc 	%r16, 0x056d, %r4
thr3_hw_intr_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_83), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
thr3_hw_intr_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_84), 16, 16)) -> intp(1, 0, 1)
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
thr3_hw_intr_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_85), 16, 16)) -> intp(2, 0, 1)
	.word 0x8f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r7
	.word 0xaa040011  ! 1: ADD_R	add 	%r16, %r17, %r21
	.word 0x953c0011  ! 1: SRA_R	sra 	%r16, %r17, %r10
thr3_hw_intr_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_86), 16, 16)) -> intp(1, 0, 1)
	.word 0x932c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x9b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r13
thr3_hw_intr_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_87), 16, 16)) -> intp(1, 0, 1)
	.word 0x9f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x953c0011  ! 1: SRA_R	sra 	%r16, %r17, %r10
	.word 0xb6442e65  ! 1: ADDC_I	addc 	%r16, 0x0e65, %r27
thr3_hw_intr_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_88), 16, 16)) -> intp(2, 0, 1)
	.word 0x8b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r5
thr3_hw_intr_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_89), 16, 16)) -> intp(0, 0, 1)
	.word 0x980c2a3d  ! 1: AND_I	and 	%r16, 0x0a3d, %r12
thr3_nuke_intr_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_90), 16, 16)) -> intp(2, 2, 1)
	.word 0xaa0424f7  ! 1: ADD_I	add 	%r16, 0x04f7, %r21
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
	.word 0x921c2da0  ! 1: XOR_I	xor 	%r16, 0x0da0, %r9
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
thr3_resum_intr_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_91), 16, 16)) -> intp(2, 3, 1)
	.word 0xb5641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0x993c0011  ! 1: SRA_R	sra 	%r16, %r17, %r12
	.word 0x982c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r12
thr3_nuke_intr_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_92), 16, 16)) -> intp(1, 2, 1)
	.word 0xad3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
	.word 0xa93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r20
thr3_resum_intr_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_93), 16, 16)) -> intp(1, 3, 1)
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0xb8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r28
	.word 0xaa3c2210  ! 1: XNOR_I	xnor 	%r16, 0x0210, %r21
thr3_nuke_intr_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_94), 16, 16)) -> intp(1, 2, 1)
	.word 0x88042da2  ! 1: ADD_I	add 	%r16, 0x0da2, %r4
thr3_resum_intr_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_95), 16, 16)) -> intp(1, 3, 1)
	.word 0x9b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r13
thr3_hw_intr_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_96), 16, 16)) -> intp(0, 0, 1)
	.word 0xb52c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0x932c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0xb4942238  ! 1: ORcc_I	orcc 	%r16, 0x0238, %r26
	.word 0x821c2cff  ! 1: XOR_I	xor 	%r16, 0x0cff, %r1
thr3_hw_intr_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_97), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r14
thr3_nuke_intr_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_98), 16, 16)) -> intp(2, 2, 1)
	.word 0xb12c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0xaa8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r21
thr3_resum_intr_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_99), 16, 16)) -> intp(2, 3, 1)
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0xae942b36  ! 1: ORcc_I	orcc 	%r16, 0x0b36, %r23
thr3_hw_intr_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_100), 16, 16)) -> intp(2, 0, 1)
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0x952c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r10
thr3_nuke_intr_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_101), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a9c2b82  ! 1: XORcc_I	xorcc 	%r16, 0x0b82, %r5
	.word 0x8c342697  ! 1: ORN_I	orn 	%r16, 0x0697, %r6
	.word 0xb4040011  ! 1: ADD_R	add 	%r16, %r17, %r26
thr3_resum_intr_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_102), 16, 16)) -> intp(0, 3, 1)
	.word 0x943c2e6e  ! 1: XNOR_I	xnor 	%r16, 0x0e6e, %r10
	.word 0x842c2e59  ! 1: ANDN_I	andn 	%r16, 0x0e59, %r2
	.word 0xb0442ea2  ! 1: ADDC_I	addc 	%r16, 0x0ea2, %r24
thr3_hw_intr_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_103), 16, 16)) -> intp(2, 0, 1)
	.word 0x983c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0xb884249d  ! 1: ADDcc_I	addcc 	%r16, 0x049d, %r28
	.word 0x8d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r6
thr3_nuke_intr_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_104), 16, 16)) -> intp(0, 2, 1)
	.word 0x92c42dad  ! 1: ADDCcc_I	addccc 	%r16, 0x0dad, %r9
	.word 0x8ec42994  ! 1: ADDCcc_I	addccc 	%r16, 0x0994, %r7
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_105), 16, 16)) -> intp(0, 3, 1)
	.word 0x96042bf0  ! 1: ADD_I	add 	%r16, 0x0bf0, %r11
	.word 0x86942e22  ! 1: ORcc_I	orcc 	%r16, 0x0e22, %r3
	.word 0x868c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r3
thr3_nuke_intr_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_106), 16, 16)) -> intp(0, 2, 1)
	.word 0xaabc2a03  ! 1: XNORcc_I	xnorcc 	%r16, 0x0a03, %r21
thr3_resum_intr_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_107), 16, 16)) -> intp(0, 3, 1)
	.word 0x9cbc2764  ! 1: XNORcc_I	xnorcc 	%r16, 0x0764, %r14
thr3_nuke_intr_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_108), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
thr3_resum_intr_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_109), 16, 16)) -> intp(1, 3, 1)
	.word 0x9cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r14
thr3_hw_intr_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_110), 16, 16)) -> intp(1, 0, 1)
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r7
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
thr3_nuke_intr_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_111), 16, 16)) -> intp(2, 2, 1)
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
	.word 0xaa842ef6  ! 1: ADDcc_I	addcc 	%r16, 0x0ef6, %r21
thr3_resum_intr_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_112), 16, 16)) -> intp(2, 3, 1)
	.word 0xae040011  ! 1: ADD_R	add 	%r16, %r17, %r23
	.word 0xb8340011  ! 1: ORN_R	orn 	%r16, %r17, %r28
thr3_hw_intr_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_113), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7340011  ! 1: SRL_R	srl 	%r16, %r17, %r27
	.word 0x869c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0x9ebc2e29  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e29, %r15
thr3_hw_intr_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_114), 16, 16)) -> intp(0, 0, 1)
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x9f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x8ec425e7  ! 1: ADDCcc_I	addccc 	%r16, 0x05e7, %r7
thr3_nuke_intr_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_115), 16, 16)) -> intp(0, 2, 1)
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
thr3_resum_intr_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_116), 16, 16)) -> intp(0, 3, 1)
	.word 0xb88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r28
thr3_hw_intr_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_117), 16, 16)) -> intp(2, 0, 1)
	.word 0x888c29f2  ! 1: ANDcc_I	andcc 	%r16, 0x09f2, %r4
thr3_nuke_intr_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_118), 16, 16)) -> intp(1, 2, 1)
	.word 0xb8842190  ! 1: ADDcc_I	addcc 	%r16, 0x0190, %r28
	.word 0x842c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x8ab42d55  ! 1: ORNcc_I	orncc 	%r16, 0x0d55, %r5
thr3_resum_intr_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_119), 16, 16)) -> intp(1, 3, 1)
	.word 0x943420bd  ! 1: ORN_I	orn 	%r16, 0x00bd, %r10
	.word 0x9c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x90ac2828  ! 1: ANDNcc_I	andncc 	%r16, 0x0828, %r8
thr3_nuke_intr_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_120), 16, 16)) -> intp(0, 2, 1)
	.word 0x909c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0x9a442289  ! 1: ADDC_I	addc 	%r16, 0x0289, %r13
	.word 0xb9641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
thr3_resum_intr_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_121), 16, 16)) -> intp(0, 3, 1)
	.word 0x953c0011  ! 1: SRA_R	sra 	%r16, %r17, %r10
	.word 0x9c342b14  ! 1: ORN_I	orn 	%r16, 0x0b14, %r14
	.word 0x9a942779  ! 1: ORcc_I	orcc 	%r16, 0x0779, %r13
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
thr3_nuke_intr_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_122), 16, 16)) -> intp(2, 2, 1)
	.word 0x94bc25ac  ! 1: XNORcc_I	xnorcc 	%r16, 0x05ac, %r10
	.word 0xad7c2401  ! 1: MOVR_I	move	%r16, 0x5ac, %r22
thr3_resum_intr_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_123), 16, 16)) -> intp(2, 3, 1)
	.word 0x972c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r11
	.word 0x828c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r1
thr3_hw_intr_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_124), 16, 16)) -> intp(2, 0, 1)
	.word 0xa63427ac  ! 1: ORN_I	orn 	%r16, 0x07ac, %r19
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
	.word 0x8e2c2767  ! 1: ANDN_I	andn 	%r16, 0x0767, %r7
thr3_hw_intr_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_125), 16, 16)) -> intp(2, 0, 1)
	.word 0x8b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r5
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_126), 16, 16)) -> intp(0, 0, 1)
	.word 0xba3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r29
thr3_nuke_intr_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_127), 16, 16)) -> intp(1, 2, 1)
	.word 0xb7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r27
	.word 0x832c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
thr3_resum_intr_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_128), 16, 16)) -> intp(1, 3, 1)
	.word 0xad342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0xb00c0011  ! 1: AND_R	and 	%r16, %r17, %r24
	.word 0x9e140011  ! 1: OR_R	or 	%r16, %r17, %r15
	.word 0x8c340011  ! 1: ORN_R	orn 	%r16, %r17, %r6
thr3_hw_intr_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_129), 16, 16)) -> intp(2, 0, 1)
	.word 0xaac42fd1  ! 1: ADDCcc_I	addccc 	%r16, 0x0fd1, %r21
	.word 0xb8340011  ! 1: ORN_R	orn 	%r16, %r17, %r28
	.word 0x8e0c2646  ! 1: AND_I	and 	%r16, 0x0646, %r7
	.word 0xb13c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r24
thr3_nuke_intr_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_130), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb341011  ! 1: SRLX_R	srlx	%r16, %r17, %r29
	.word 0x8c042678  ! 1: ADD_I	add 	%r16, 0x0678, %r6
	.word 0x96840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0x84142287  ! 1: OR_I	or 	%r16, 0x0287, %r2
thr3_resum_intr_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_131), 16, 16)) -> intp(0, 3, 1)
	.word 0x96042a02  ! 1: ADD_I	add 	%r16, 0x0a02, %r11
	.word 0xad341011  ! 1: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x82342dd1  ! 1: ORN_I	orn 	%r16, 0x0dd1, %r1
	.word 0xb4bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r26
thr3_hw_intr_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_132), 16, 16)) -> intp(1, 0, 1)
	.word 0x9b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r13
thr3_hw_intr_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_133), 16, 16)) -> intp(0, 0, 1)
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0x90b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0xa8ac2718  ! 1: ANDNcc_I	andncc 	%r16, 0x0718, %r20
thr3_hw_intr_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_134), 16, 16)) -> intp(2, 0, 1)
	.word 0xba8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r29
thr3_hw_intr_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_135), 16, 16)) -> intp(2, 0, 1)
	.word 0x9a1c2c1c  ! 1: XOR_I	xor 	%r16, 0x0c1c, %r13
thr3_nuke_intr_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_136), 16, 16)) -> intp(2, 2, 1)
	.word 0x96040011  ! 1: ADD_R	add 	%r16, %r17, %r11
	.word 0xa6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0xb4b42f8a  ! 1: ORNcc_I	orncc 	%r16, 0x0f8a, %r26
	.word 0xb83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r28
thr3_resum_intr_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_137), 16, 16)) -> intp(2, 3, 1)
	.word 0xb08c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0xae0c2b9f  ! 1: AND_I	and 	%r16, 0x0b9f, %r23
	.word 0x9cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0xad641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_138), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa2c24d8  ! 1: ANDN_I	andn 	%r16, 0x04d8, %r21
	.word 0x89641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_139), 16, 16)) -> intp(0, 2, 1)
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0x9b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0x8b7c2401  ! 1: MOVR_I	move	%r16, 0x1, %r5
thr3_resum_intr_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_140), 16, 16)) -> intp(0, 3, 1)
	.word 0xaf2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0x93341011  ! 1: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x9a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r13
thr3_hw_intr_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_141), 16, 16)) -> intp(2, 0, 1)
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
thr3_hw_intr_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_142), 16, 16)) -> intp(0, 0, 1)
	.word 0x853c1011  ! 1: SRAX_R	srax	%r16, %r17, %r2
	.word 0x90842539  ! 1: ADDcc_I	addcc 	%r16, 0x0539, %r8
thr3_nuke_intr_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_143), 16, 16)) -> intp(2, 2, 1)
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x961424f2  ! 1: OR_I	or 	%r16, 0x04f2, %r11
	.word 0x9a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0xb1643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_144), 16, 16)) -> intp(2, 3, 1)
	.word 0xb8340011  ! 1: ORN_R	orn 	%r16, %r17, %r28
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x86342cb5  ! 1: ORN_I	orn 	%r16, 0x0cb5, %r3
	.word 0xab343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r21
thr3_nuke_intr_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_145), 16, 16)) -> intp(0, 2, 1)
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
thr3_resum_intr_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_146), 16, 16)) -> intp(0, 3, 1)
	.word 0xa7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r19
thr3_nuke_intr_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_147), 16, 16)) -> intp(0, 2, 1)
	.word 0x873c0011  ! 1: SRA_R	sra 	%r16, %r17, %r3
	.word 0x92042e2e  ! 1: ADD_I	add 	%r16, 0x0e2e, %r9
thr3_resum_intr_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_148), 16, 16)) -> intp(0, 3, 1)
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x940423c2  ! 1: ADD_I	add 	%r16, 0x03c2, %r10
thr3_nuke_intr_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_149), 16, 16)) -> intp(2, 2, 1)
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
	.word 0x90140011  ! 1: OR_R	or 	%r16, %r17, %r8
	.word 0xa6b426d7  ! 1: ORNcc_I	orncc 	%r16, 0x06d7, %r19
thr3_resum_intr_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_150), 16, 16)) -> intp(2, 3, 1)
	.word 0xad3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r22
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x8a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r5
thr3_nuke_intr_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_151), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
	.word 0x9e342d83  ! 1: ORN_I	orn 	%r16, 0x0d83, %r15
	.word 0xba442392  ! 1: ADDC_I	addc 	%r16, 0x0392, %r29
thr3_resum_intr_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_152), 16, 16)) -> intp(1, 3, 1)
	.word 0x897c0411  ! 1: MOVR_R	move	%r16, %r17, %r4
	.word 0xb32c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0x82ac255b  ! 1: ANDNcc_I	andncc 	%r16, 0x055b, %r1
thr3_hw_intr_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_153), 16, 16)) -> intp(0, 0, 1)
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
thr3_nuke_intr_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_154), 16, 16)) -> intp(2, 2, 1)
	.word 0x99340011  ! 1: SRL_R	srl 	%r16, %r17, %r12
	.word 0xb72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r27
thr3_resum_intr_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_155), 16, 16)) -> intp(2, 3, 1)
	.word 0x880c0011  ! 1: AND_R	and 	%r16, %r17, %r4
	.word 0x9abc2092  ! 1: XNORcc_I	xnorcc 	%r16, 0x0092, %r13
thr3_hw_intr_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_156), 16, 16)) -> intp(2, 0, 1)
	.word 0x8c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r6
thr3_nuke_intr_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_157), 16, 16)) -> intp(1, 2, 1)
	.word 0x823c2034  ! 1: XNOR_I	xnor 	%r16, 0x0034, %r1
	.word 0x88442ec5  ! 1: ADDC_I	addc 	%r16, 0x0ec5, %r4
thr3_resum_intr_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_158), 16, 16)) -> intp(1, 3, 1)
	.word 0x9694241c  ! 1: ORcc_I	orcc 	%r16, 0x041c, %r11
	.word 0x941c0011  ! 1: XOR_R	xor 	%r16, %r17, %r10
thr3_hw_intr_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_159), 16, 16)) -> intp(2, 0, 1)
	.word 0xba442a59  ! 1: ADDC_I	addc 	%r16, 0x0a59, %r29
thr3_nuke_intr_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_160), 16, 16)) -> intp(0, 2, 1)
	.word 0x9a342280  ! 1: ORN_I	orn 	%r16, 0x0280, %r13
	.word 0x88b42e66  ! 1: ORNcc_I	orncc 	%r16, 0x0e66, %r4
	.word 0xb6b421f2  ! 1: ORNcc_I	orncc 	%r16, 0x01f2, %r27
	.word 0x9e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r15
thr3_resum_intr_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_161), 16, 16)) -> intp(0, 3, 1)
	.word 0x92bc2a84  ! 1: XNORcc_I	xnorcc 	%r16, 0x0a84, %r9
	.word 0xbb7c2401  ! 1: MOVR_I	move	%r16, 0xfffffe84, %r29
	.word 0xaeac2240  ! 1: ANDNcc_I	andncc 	%r16, 0x0240, %r23
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
thr3_nuke_intr_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_162), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e44284f  ! 1: ADDC_I	addc 	%r16, 0x084f, %r15
	.word 0x9a9c293f  ! 1: XORcc_I	xorcc 	%r16, 0x093f, %r13
	.word 0x86440011  ! 1: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x82440011  ! 1: ADDC_R	addc 	%r16, %r17, %r1
thr3_resum_intr_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_163), 16, 16)) -> intp(1, 3, 1)
	.word 0xac340011  ! 1: ORN_R	orn 	%r16, %r17, %r22
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x903c2ca1  ! 1: XNOR_I	xnor 	%r16, 0x0ca1, %r8
	.word 0xaa8c2c15  ! 1: ANDcc_I	andcc 	%r16, 0x0c15, %r21
thr3_nuke_intr_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_164), 16, 16)) -> intp(2, 2, 1)
	.word 0x828c2e09  ! 1: ANDcc_I	andcc 	%r16, 0x0e09, %r1
	.word 0x8e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r7
thr3_resum_intr_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_165), 16, 16)) -> intp(2, 3, 1)
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0x8a140011  ! 1: OR_R	or 	%r16, %r17, %r5
thr3_hw_intr_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_166), 16, 16)) -> intp(1, 0, 1)
	.word 0xb5342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0x90940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x83341011  ! 1: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x917c0411  ! 1: MOVR_R	move	%r16, %r17, %r8
thr3_hw_intr_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_167), 16, 16)) -> intp(0, 0, 1)
	.word 0xb41c0011  ! 1: XOR_R	xor 	%r16, %r17, %r26
	.word 0x8404220a  ! 1: ADD_I	add 	%r16, 0x020a, %r2
	.word 0x8cc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r6
thr3_nuke_intr_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_168), 16, 16)) -> intp(1, 2, 1)
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
	.word 0x888c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0xa7340011  ! 1: SRL_R	srl 	%r16, %r17, %r19
thr3_resum_intr_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_169), 16, 16)) -> intp(1, 3, 1)
	.word 0x9d643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xaf342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r23
	.word 0xb37c0411  ! 1: MOVR_R	move	%r16, %r17, %r25
thr3_hw_intr_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_170), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0xb3641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_171), 16, 16)) -> intp(0, 2, 1)
	.word 0xb9641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x929425de  ! 1: ORcc_I	orcc 	%r16, 0x05de, %r9
thr3_resum_intr_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_172), 16, 16)) -> intp(0, 3, 1)
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0x877c0411  ! 1: MOVR_R	move	%r16, %r17, %r3
thr3_nuke_intr_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_173), 16, 16)) -> intp(2, 2, 1)
	.word 0xb0b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x8a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r5
thr3_resum_intr_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_174), 16, 16)) -> intp(2, 3, 1)
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
	.word 0xba442273  ! 1: ADDC_I	addc 	%r16, 0x0273, %r29
	.word 0x94b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r10
thr3_hw_intr_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_175), 16, 16)) -> intp(0, 0, 1)
	.word 0x89343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x960c28b7  ! 1: AND_I	and 	%r16, 0x08b7, %r11
thr3_hw_intr_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_176), 16, 16)) -> intp(2, 0, 1)
	.word 0xb0b42ace  ! 1: ORNcc_I	orncc 	%r16, 0x0ace, %r24
	.word 0x8644274f  ! 1: ADDC_I	addc 	%r16, 0x074f, %r3
thr3_hw_intr_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_177), 16, 16)) -> intp(0, 0, 1)
	.word 0x8f641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x8a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0x94b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r10
thr3_hw_intr_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_178), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
thr3_hw_intr_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_179), 16, 16)) -> intp(1, 0, 1)
	.word 0x880421c2  ! 1: ADD_I	add 	%r16, 0x01c2, %r4
	.word 0xb37c0411  ! 1: MOVR_R	move	%r16, %r17, %r25
thr3_nuke_intr_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_180), 16, 16)) -> intp(0, 2, 1)
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x9e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r15
thr3_resum_intr_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_181), 16, 16)) -> intp(0, 3, 1)
	.word 0xad3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r22
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
thr3_nuke_intr_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_182), 16, 16)) -> intp(2, 2, 1)
	.word 0xacb42ab5  ! 1: ORNcc_I	orncc 	%r16, 0x0ab5, %r22
	.word 0xaf3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r23
thr3_resum_intr_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_183), 16, 16)) -> intp(2, 3, 1)
	.word 0x8ebc2147  ! 1: XNORcc_I	xnorcc 	%r16, 0x0147, %r7
	.word 0xbabc2a77  ! 1: XNORcc_I	xnorcc 	%r16, 0x0a77, %r29
thr3_hw_intr_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_184), 16, 16)) -> intp(2, 0, 1)
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
thr3_nuke_intr_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_185), 16, 16)) -> intp(2, 2, 1)
	.word 0xbb340011  ! 1: SRL_R	srl 	%r16, %r17, %r29
thr3_resum_intr_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_186), 16, 16)) -> intp(2, 3, 1)
	.word 0xb7643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_187), 16, 16)) -> intp(1, 2, 1)
	.word 0xab2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r21
	.word 0xb0440011  ! 1: ADDC_R	addc 	%r16, %r17, %r24
	.word 0xb0040011  ! 1: ADD_R	add 	%r16, %r17, %r24
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_188), 16, 16)) -> intp(1, 3, 1)
	.word 0x86ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0xaa1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r21
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xaa442b3d  ! 1: ADDC_I	addc 	%r16, 0x0b3d, %r21
thr3_hw_intr_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_189), 16, 16)) -> intp(1, 0, 1)
	.word 0xb2c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r25
thr3_nuke_intr_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_190), 16, 16)) -> intp(2, 2, 1)
	.word 0xb2bc257a  ! 1: XNORcc_I	xnorcc 	%r16, 0x057a, %r25
thr3_resum_intr_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_191), 16, 16)) -> intp(2, 3, 1)
	.word 0x84340011  ! 1: ORN_R	orn 	%r16, %r17, %r2
thr3_nuke_intr_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_192), 16, 16)) -> intp(0, 2, 1)
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
	.word 0xad2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r22
thr3_resum_intr_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_193), 16, 16)) -> intp(0, 3, 1)
	.word 0x8d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r6
	.word 0xacac2dcb  ! 1: ANDNcc_I	andncc 	%r16, 0x0dcb, %r22
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
thr3_nuke_intr_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_194), 16, 16)) -> intp(2, 2, 1)
	.word 0x920c2074  ! 1: AND_I	and 	%r16, 0x0074, %r9
	.word 0x863c22b9  ! 1: XNOR_I	xnor 	%r16, 0x02b9, %r3
thr3_resum_intr_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_195), 16, 16)) -> intp(2, 3, 1)
	.word 0x864427cc  ! 1: ADDC_I	addc 	%r16, 0x07cc, %r3
	.word 0x91340011  ! 1: SRL_R	srl 	%r16, %r17, %r8
thr3_hw_intr_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_196), 16, 16)) -> intp(1, 0, 1)
	.word 0x9cac2703  ! 1: ANDNcc_I	andncc 	%r16, 0x0703, %r14
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0x90b42f91  ! 1: ORNcc_I	orncc 	%r16, 0x0f91, %r8
thr3_nuke_intr_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_197), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a340011  ! 1: ORN_R	orn 	%r16, %r17, %r5
	.word 0xac142afd  ! 1: OR_I	or 	%r16, 0x0afd, %r22
	.word 0x86b42201  ! 1: ORNcc_I	orncc 	%r16, 0x0201, %r3
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
thr3_resum_intr_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_198), 16, 16)) -> intp(0, 3, 1)
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x823c2b42  ! 1: XNOR_I	xnor 	%r16, 0x0b42, %r1
	.word 0x9e442789  ! 1: ADDC_I	addc 	%r16, 0x0789, %r15
	.word 0xb8ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r28
thr3_nuke_intr_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_199), 16, 16)) -> intp(2, 2, 1)
	.word 0xab2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r21
thr3_resum_intr_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_200), 16, 16)) -> intp(2, 3, 1)
	.word 0x909c2530  ! 1: XORcc_I	xorcc 	%r16, 0x0530, %r8
thr3_hw_intr_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_201), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c042653  ! 1: ADD_I	add 	%r16, 0x0653, %r6
	.word 0x8c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r6
	.word 0x989c225a  ! 1: XORcc_I	xorcc 	%r16, 0x025a, %r12
thr3_nuke_intr_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_202), 16, 16)) -> intp(0, 2, 1)
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
	.word 0xae2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r23
thr3_resum_intr_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_203), 16, 16)) -> intp(0, 3, 1)
	.word 0x9e2c29f3  ! 1: ANDN_I	andn 	%r16, 0x09f3, %r15
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
thr3_hw_intr_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_204), 16, 16)) -> intp(1, 0, 1)
	.word 0xb00c21df  ! 1: AND_I	and 	%r16, 0x01df, %r24
	.word 0x9c1429d3  ! 1: OR_I	or 	%r16, 0x09d3, %r14
	.word 0x9c342b19  ! 1: ORN_I	orn 	%r16, 0x0b19, %r14
thr3_nuke_intr_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_205), 16, 16)) -> intp(1, 2, 1)
	.word 0xb1343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xad2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r22
thr3_resum_intr_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_206), 16, 16)) -> intp(1, 3, 1)
	.word 0x98940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0xb5641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_207), 16, 16)) -> intp(0, 0, 1)
	.word 0x88b429b8  ! 1: ORNcc_I	orncc 	%r16, 0x09b8, %r4
thr3_hw_intr_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_208), 16, 16)) -> intp(0, 0, 1)
	.word 0x828c2798  ! 1: ANDcc_I	andcc 	%r16, 0x0798, %r1
	.word 0x9f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xaa8425b1  ! 1: ADDcc_I	addcc 	%r16, 0x05b1, %r21
	.word 0xb49c2cbe  ! 1: XORcc_I	xorcc 	%r16, 0x0cbe, %r26
thr3_nuke_intr_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_209), 16, 16)) -> intp(1, 2, 1)
	.word 0x92bc2eba  ! 1: XNORcc_I	xnorcc 	%r16, 0x0eba, %r9
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
	.word 0xbb340011  ! 1: SRL_R	srl 	%r16, %r17, %r29
	.word 0xa9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r20
thr3_resum_intr_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_210), 16, 16)) -> intp(1, 3, 1)
	.word 0x92840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0x8d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0xa97c0411  ! 1: MOVR_R	move	%r16, %r17, %r20
	.word 0xb12c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r24
thr3_nuke_intr_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_211), 16, 16)) -> intp(2, 2, 1)
	.word 0x829c2060  ! 1: XORcc_I	xorcc 	%r16, 0x0060, %r1
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
thr3_resum_intr_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_212), 16, 16)) -> intp(2, 3, 1)
	.word 0x90940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0xa93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x8c0c0011  ! 1: AND_R	and 	%r16, %r17, %r6
thr3_hw_intr_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_213), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a1c2d97  ! 1: XOR_I	xor 	%r16, 0x0d97, %r5
	.word 0xb33c1011  ! 1: SRAX_R	srax	%r16, %r17, %r25
	.word 0xac3c21ad  ! 1: XNOR_I	xnor 	%r16, 0x01ad, %r22
thr3_hw_intr_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_214), 16, 16)) -> intp(0, 0, 1)
	.word 0xb12c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r24
	.word 0x903c2407  ! 1: XNOR_I	xnor 	%r16, 0x0407, %r8
thr3_hw_intr_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_215), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c340011  ! 1: ORN_R	orn 	%r16, %r17, %r14
	.word 0xae442888  ! 1: ADDC_I	addc 	%r16, 0x0888, %r23
	.word 0x9ec4217d  ! 1: ADDCcc_I	addccc 	%r16, 0x017d, %r15
thr3_hw_intr_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_216), 16, 16)) -> intp(0, 0, 1)
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x8a3c2f8f  ! 1: XNOR_I	xnor 	%r16, 0x0f8f, %r5
	.word 0x8e140011  ! 1: OR_R	or 	%r16, %r17, %r7
thr3_hw_intr_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_217), 16, 16)) -> intp(2, 0, 1)
	.word 0xacb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0x9b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r13
thr3_hw_intr_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_218), 16, 16)) -> intp(2, 0, 1)
	.word 0xb1341011  ! 1: SRLX_R	srlx	%r16, %r17, %r24
	.word 0xab342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x96840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r11
thr3_hw_intr_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_219), 16, 16)) -> intp(1, 0, 1)
	.word 0x88342662  ! 1: ORN_I	orn 	%r16, 0x0662, %r4
	.word 0xad3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0x9a8427ca  ! 1: ADDcc_I	addcc 	%r16, 0x07ca, %r13
	.word 0x829420d8  ! 1: ORcc_I	orcc 	%r16, 0x00d8, %r1
thr3_hw_intr_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_220), 16, 16)) -> intp(2, 0, 1)
	.word 0x8a8422e4  ! 1: ADDcc_I	addcc 	%r16, 0x02e4, %r5
thr3_hw_intr_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_221), 16, 16)) -> intp(1, 0, 1)
	.word 0xab7c0411  ! 1: MOVR_R	move	%r16, %r17, %r21
thr3_hw_intr_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_222), 16, 16)) -> intp(1, 0, 1)
	.word 0x8cb42080  ! 1: ORNcc_I	orncc 	%r16, 0x0080, %r6
	.word 0x9c0c0011  ! 1: AND_R	and 	%r16, %r17, %r14
	.word 0xb4b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r26
thr3_hw_intr_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_223), 16, 16)) -> intp(2, 0, 1)
	.word 0x9c1c2c96  ! 1: XOR_I	xor 	%r16, 0x0c96, %r14
	.word 0x98ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0xba340011  ! 1: ORN_R	orn 	%r16, %r17, %r29
thr3_nuke_intr_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_224), 16, 16)) -> intp(0, 2, 1)
	.word 0xb63c2401  ! 1: XNOR_I	xnor 	%r16, 0x0401, %r27
	.word 0xb49c20b1  ! 1: XORcc_I	xorcc 	%r16, 0x00b1, %r26
thr3_resum_intr_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_225), 16, 16)) -> intp(0, 3, 1)
	.word 0x92ac2682  ! 1: ANDNcc_I	andncc 	%r16, 0x0682, %r9
	.word 0xb8b42448  ! 1: ORNcc_I	orncc 	%r16, 0x0448, %r28
thr3_nuke_intr_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_226), 16, 16)) -> intp(0, 2, 1)
	.word 0xa62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r19
thr3_resum_intr_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_227), 16, 16)) -> intp(0, 3, 1)
	.word 0xa69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r19
thr3_hw_intr_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_228), 16, 16)) -> intp(0, 0, 1)
	.word 0xac2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r22
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
thr3_hw_intr_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_229), 16, 16)) -> intp(2, 0, 1)
	.word 0xae442331  ! 1: ADDC_I	addc 	%r16, 0x0331, %r23
	.word 0x837c2401  ! 1: MOVR_I	move	%r16, 0xffffff31, %r1
	.word 0xb6c42517  ! 1: ADDCcc_I	addccc 	%r16, 0x0517, %r27
	.word 0xae0c0011  ! 1: AND_R	and 	%r16, %r17, %r23
thr3_nuke_intr_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_230), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e8c20e1  ! 1: ANDcc_I	andcc 	%r16, 0x00e1, %r15
thr3_resum_intr_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_231), 16, 16)) -> intp(1, 3, 1)
	.word 0xb3342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r25
thr3_nuke_intr_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_232), 16, 16)) -> intp(1, 2, 1)
	.word 0x900c2807  ! 1: AND_I	and 	%r16, 0x0807, %r8
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
thr3_resum_intr_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_233), 16, 16)) -> intp(1, 3, 1)
	.word 0x8a9c2246  ! 1: XORcc_I	xorcc 	%r16, 0x0246, %r5
	.word 0xa8b426d8  ! 1: ORNcc_I	orncc 	%r16, 0x06d8, %r20
thr3_hw_intr_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_234), 16, 16)) -> intp(2, 0, 1)
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x90442d00  ! 1: ADDC_I	addc 	%r16, 0x0d00, %r8
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
	.word 0x9eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r15
thr3_nuke_intr_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_235), 16, 16)) -> intp(1, 2, 1)
	.word 0xad641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x90bc2d30  ! 1: XNORcc_I	xnorcc 	%r16, 0x0d30, %r8
	.word 0xa7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0x872c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r3
thr3_resum_intr_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_236), 16, 16)) -> intp(1, 3, 1)
	.word 0xa6bc299a  ! 1: XNORcc_I	xnorcc 	%r16, 0x099a, %r19
	.word 0xb4340011  ! 1: ORN_R	orn 	%r16, %r17, %r26
	.word 0x988c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
thr3_nuke_intr_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_237), 16, 16)) -> intp(0, 2, 1)
	.word 0x861c2b9d  ! 1: XOR_I	xor 	%r16, 0x0b9d, %r3
	.word 0xb4142f9e  ! 1: OR_I	or 	%r16, 0x0f9e, %r26
thr3_resum_intr_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_238), 16, 16)) -> intp(0, 3, 1)
	.word 0xab340011  ! 1: SRL_R	srl 	%r16, %r17, %r21
	.word 0xa61c2a73  ! 1: XOR_I	xor 	%r16, 0x0a73, %r19
thr3_hw_intr_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_239), 16, 16)) -> intp(1, 0, 1)
	.word 0x8b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r5
thr3_nuke_intr_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_240), 16, 16)) -> intp(0, 2, 1)
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
thr3_resum_intr_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_241), 16, 16)) -> intp(0, 3, 1)
	.word 0xb7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
thr3_nuke_intr_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_242), 16, 16)) -> intp(1, 2, 1)
	.word 0x89340011  ! 1: SRL_R	srl 	%r16, %r17, %r4
	.word 0x86442577  ! 1: ADDC_I	addc 	%r16, 0x0577, %r3
	.word 0x923c25ff  ! 1: XNOR_I	xnor 	%r16, 0x05ff, %r9
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
thr3_resum_intr_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_243), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x828c2f12  ! 1: ANDcc_I	andcc 	%r16, 0x0f12, %r1
	.word 0xb8c42da2  ! 1: ADDCcc_I	addccc 	%r16, 0x0da2, %r28
	.word 0xb8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r28
thr3_hw_intr_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_244), 16, 16)) -> intp(2, 0, 1)
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
	.word 0x8a3c24d9  ! 1: XNOR_I	xnor 	%r16, 0x04d9, %r5
	.word 0x9e342e7f  ! 1: ORN_I	orn 	%r16, 0x0e7f, %r15
thr3_hw_intr_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_245), 16, 16)) -> intp(1, 0, 1)
	.word 0x9b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r13
thr3_nuke_intr_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_246), 16, 16)) -> intp(1, 2, 1)
	.word 0xb3641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_247), 16, 16)) -> intp(1, 3, 1)
	.word 0x98bc2b2c  ! 1: XNORcc_I	xnorcc 	%r16, 0x0b2c, %r12
thr3_hw_intr_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_248), 16, 16)) -> intp(1, 0, 1)
	.word 0xa72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r19
	.word 0xaf2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x912c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x8b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r5
thr3_hw_intr_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_249), 16, 16)) -> intp(2, 0, 1)
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
thr3_nuke_intr_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_250), 16, 16)) -> intp(1, 2, 1)
	.word 0xab3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r21
thr3_resum_intr_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_251), 16, 16)) -> intp(1, 3, 1)
	.word 0xb33c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r25
thr3_hw_intr_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_252), 16, 16)) -> intp(0, 0, 1)
	.word 0x95343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0x883421e3  ! 1: ORN_I	orn 	%r16, 0x01e3, %r4
thr3_nuke_intr_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_253), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c2c2bce  ! 1: ANDN_I	andn 	%r16, 0x0bce, %r6
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x9d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0xaa9c2c28  ! 1: XORcc_I	xorcc 	%r16, 0x0c28, %r21
thr3_resum_intr_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_254), 16, 16)) -> intp(2, 3, 1)
	.word 0xa89c2726  ! 1: XORcc_I	xorcc 	%r16, 0x0726, %r20
	.word 0xb414297c  ! 1: OR_I	or 	%r16, 0x097c, %r26
	.word 0xb8142dd8  ! 1: OR_I	or 	%r16, 0x0dd8, %r28
	.word 0x8ec4271c  ! 1: ADDCcc_I	addccc 	%r16, 0x071c, %r7
thr3_nuke_intr_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_255), 16, 16)) -> intp(0, 2, 1)
	.word 0x980c29d5  ! 1: AND_I	and 	%r16, 0x09d5, %r12
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
thr3_resum_intr_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_256), 16, 16)) -> intp(0, 3, 1)
	.word 0x89343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0xa69c27c5  ! 1: XORcc_I	xorcc 	%r16, 0x07c5, %r19
thr3_nuke_intr_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_257), 16, 16)) -> intp(0, 2, 1)
	.word 0x981c0011  ! 1: XOR_R	xor 	%r16, %r17, %r12
thr3_resum_intr_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_258), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6140011  ! 1: OR_R	or 	%r16, %r17, %r27
thr3_nuke_intr_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_259), 16, 16)) -> intp(0, 2, 1)
	.word 0x86c427b9  ! 1: ADDCcc_I	addccc 	%r16, 0x07b9, %r3
	.word 0x8b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0xab7c2401  ! 1: MOVR_I	move	%r16, 0x1, %r21
thr3_resum_intr_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_260), 16, 16)) -> intp(0, 3, 1)
	.word 0x95643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x8e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r7
thr3_nuke_intr_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_261), 16, 16)) -> intp(2, 2, 1)
	.word 0xb29c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0x868c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x9c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r14
thr3_resum_intr_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_262), 16, 16)) -> intp(2, 3, 1)
	.word 0xaa1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r21
	.word 0x94ac2b46  ! 1: ANDNcc_I	andncc 	%r16, 0x0b46, %r10
	.word 0x962c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r11
thr3_hw_intr_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_263), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x88442bb0  ! 1: ADDC_I	addc 	%r16, 0x0bb0, %r4
	.word 0xacc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r22
thr3_hw_intr_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_264), 16, 16)) -> intp(1, 0, 1)
	.word 0x90442c86  ! 1: ADDC_I	addc 	%r16, 0x0c86, %r8
thr3_hw_intr_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_265), 16, 16)) -> intp(0, 0, 1)
	.word 0x8e0c2066  ! 1: AND_I	and 	%r16, 0x0066, %r7
	.word 0x901c0011  ! 1: XOR_R	xor 	%r16, %r17, %r8
thr3_nuke_intr_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_266), 16, 16)) -> intp(1, 2, 1)
	.word 0x8f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x82842392  ! 1: ADDcc_I	addcc 	%r16, 0x0392, %r1
	.word 0x8d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r6
thr3_resum_intr_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_267), 16, 16)) -> intp(1, 3, 1)
	.word 0xb62c2bf1  ! 1: ANDN_I	andn 	%r16, 0x0bf1, %r27
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
	.word 0xae3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r23
thr3_nuke_intr_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_268), 16, 16)) -> intp(0, 2, 1)
	.word 0x94b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0x8ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
	.word 0x85643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_269), 16, 16)) -> intp(0, 3, 1)
	.word 0xa88426e0  ! 1: ADDcc_I	addcc 	%r16, 0x06e0, %r20
	.word 0x89340011  ! 1: SRL_R	srl 	%r16, %r17, %r4
	.word 0x8d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x8c340011  ! 1: ORN_R	orn 	%r16, %r17, %r6
thr3_hw_intr_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_270), 16, 16)) -> intp(0, 0, 1)
	.word 0x841c0011  ! 1: XOR_R	xor 	%r16, %r17, %r2
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
	.word 0x9c140011  ! 1: OR_R	or 	%r16, %r17, %r14
thr3_hw_intr_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_271), 16, 16)) -> intp(1, 0, 1)
	.word 0x873c1011  ! 1: SRAX_R	srax	%r16, %r17, %r3
thr3_nuke_intr_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_272), 16, 16)) -> intp(1, 2, 1)
	.word 0x99643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x862c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r3
	.word 0xb2940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r25
thr3_resum_intr_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_273), 16, 16)) -> intp(1, 3, 1)
	.word 0x941c2826  ! 1: XOR_I	xor 	%r16, 0x0826, %r10
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x9f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r15
thr3_hw_intr_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_274), 16, 16)) -> intp(2, 0, 1)
	.word 0xad7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r22
	.word 0xb57c0411  ! 1: MOVR_R	move	%r16, %r17, %r26
thr3_nuke_intr_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_275), 16, 16)) -> intp(0, 2, 1)
	.word 0xb5342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0x940c24c8  ! 1: AND_I	and 	%r16, 0x04c8, %r10
thr3_resum_intr_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_276), 16, 16)) -> intp(0, 3, 1)
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
	.word 0xaa040011  ! 1: ADD_R	add 	%r16, %r17, %r21
	.word 0xaa1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r21
thr3_hw_intr_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_277), 16, 16)) -> intp(1, 0, 1)
	.word 0x88842572  ! 1: ADDcc_I	addcc 	%r16, 0x0572, %r4
	.word 0x908c2fa5  ! 1: ANDcc_I	andcc 	%r16, 0x0fa5, %r8
	.word 0xb6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r27
thr3_nuke_intr_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_278), 16, 16)) -> intp(2, 2, 1)
	.word 0x8e442cba  ! 1: ADDC_I	addc 	%r16, 0x0cba, %r7
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
	.word 0x99343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r12
thr3_resum_intr_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_279), 16, 16)) -> intp(2, 3, 1)
	.word 0x897c0411  ! 1: MOVR_R	move	%r16, %r17, %r4
	.word 0xa68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
thr3_hw_intr_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_280), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e8c2c71  ! 1: ANDcc_I	andcc 	%r16, 0x0c71, %r7
thr3_hw_intr_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_281), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c942fe4  ! 1: ORcc_I	orcc 	%r16, 0x0fe4, %r14
thr3_nuke_intr_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_282), 16, 16)) -> intp(2, 2, 1)
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
	.word 0x93341011  ! 1: SRLX_R	srlx	%r16, %r17, %r9
	.word 0xac9c2de5  ! 1: XORcc_I	xorcc 	%r16, 0x0de5, %r22
	.word 0x9c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r14
thr3_resum_intr_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_283), 16, 16)) -> intp(2, 3, 1)
	.word 0xacc42f33  ! 1: ADDCcc_I	addccc 	%r16, 0x0f33, %r22
	.word 0x90140011  ! 1: OR_R	or 	%r16, %r17, %r8
	.word 0x94ac2bfc  ! 1: ANDNcc_I	andncc 	%r16, 0x0bfc, %r10
	.word 0x929c2de6  ! 1: XORcc_I	xorcc 	%r16, 0x0de6, %r9
thr3_hw_intr_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_284), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a040011  ! 1: ADD_R	add 	%r16, %r17, %r5
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x9e2c2379  ! 1: ANDN_I	andn 	%r16, 0x0379, %r15
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
thr3_nuke_intr_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_285), 16, 16)) -> intp(2, 2, 1)
	.word 0xb2ac25e8  ! 1: ANDNcc_I	andncc 	%r16, 0x05e8, %r25
	.word 0xb484268b  ! 1: ADDcc_I	addcc 	%r16, 0x068b, %r26
thr3_resum_intr_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_286), 16, 16)) -> intp(2, 3, 1)
	.word 0x8cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x820c2370  ! 1: AND_I	and 	%r16, 0x0370, %r1
thr3_nuke_intr_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_287), 16, 16)) -> intp(0, 2, 1)
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
thr3_resum_intr_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_288), 16, 16)) -> intp(0, 3, 1)
	.word 0x96042501  ! 1: ADD_I	add 	%r16, 0x0501, %r11
thr3_hw_intr_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_289), 16, 16)) -> intp(2, 0, 1)
	.word 0x86ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r3
thr3_hw_intr_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_290), 16, 16)) -> intp(1, 0, 1)
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
	.word 0xad3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r22
thr3_hw_intr_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_291), 16, 16)) -> intp(2, 0, 1)
	.word 0xaf3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r23
	.word 0xb8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0xb92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r28
thr3_nuke_intr_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_292), 16, 16)) -> intp(2, 2, 1)
	.word 0x8b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r5
	.word 0x9e1c2d3c  ! 1: XOR_I	xor 	%r16, 0x0d3c, %r15
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
thr3_resum_intr_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_293), 16, 16)) -> intp(2, 3, 1)
	.word 0x88b42004  ! 1: ORNcc_I	orncc 	%r16, 0x0004, %r4
	.word 0xa68429d2  ! 1: ADDcc_I	addcc 	%r16, 0x09d2, %r19
	.word 0xb52c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r26
thr3_nuke_intr_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_294), 16, 16)) -> intp(0, 2, 1)
	.word 0x849c2d44  ! 1: XORcc_I	xorcc 	%r16, 0x0d44, %r2
	.word 0x8a04218f  ! 1: ADD_I	add 	%r16, 0x018f, %r5
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0xaeb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r23
thr3_resum_intr_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_295), 16, 16)) -> intp(0, 3, 1)
	.word 0x95342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x9e8c221b  ! 1: ANDcc_I	andcc 	%r16, 0x021b, %r15
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
	.word 0xae9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r23
thr3_hw_intr_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_296), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0xb41c0011  ! 1: XOR_R	xor 	%r16, %r17, %r26
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0xae142773  ! 1: OR_I	or 	%r16, 0x0773, %r23
thr3_hw_intr_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_297), 16, 16)) -> intp(0, 0, 1)
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x8e3428c4  ! 1: ORN_I	orn 	%r16, 0x08c4, %r7
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xba0c204a  ! 1: AND_I	and 	%r16, 0x004a, %r29
thr3_hw_intr_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_298), 16, 16)) -> intp(2, 0, 1)
	.word 0xbb7c0411  ! 1: MOVR_R	move	%r16, %r17, %r29
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x988c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r12
thr3_nuke_intr_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_299), 16, 16)) -> intp(2, 2, 1)
	.word 0xb2ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0xb9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r28
	.word 0x8a842217  ! 1: ADDcc_I	addcc 	%r16, 0x0217, %r5
	.word 0xb9342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r28
thr3_resum_intr_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_300), 16, 16)) -> intp(2, 3, 1)
	.word 0xb3342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
	.word 0x8a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x821c0011  ! 1: XOR_R	xor 	%r16, %r17, %r1
thr3_nuke_intr_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_301), 16, 16)) -> intp(0, 2, 1)
	.word 0x981c0011  ! 1: XOR_R	xor 	%r16, %r17, %r12
thr3_resum_intr_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_302), 16, 16)) -> intp(0, 3, 1)
	.word 0x9e44211a  ! 1: ADDC_I	addc 	%r16, 0x011a, %r15
thr3_nuke_intr_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_303), 16, 16)) -> intp(0, 2, 1)
	.word 0x877c0411  ! 1: MOVR_R	move	%r16, %r17, %r3
	.word 0x949c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0xacc4232f  ! 1: ADDCcc_I	addccc 	%r16, 0x032f, %r22
	.word 0x9044236b  ! 1: ADDC_I	addc 	%r16, 0x036b, %r8
thr3_resum_intr_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_304), 16, 16)) -> intp(0, 3, 1)
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
	.word 0x8ec422c1  ! 1: ADDCcc_I	addccc 	%r16, 0x02c1, %r7
	.word 0x9b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xb4bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r26
thr3_hw_intr_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_305), 16, 16)) -> intp(1, 0, 1)
	.word 0x9d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x881422a2  ! 1: OR_I	or 	%r16, 0x02a2, %r4
	.word 0xb0842aa9  ! 1: ADDcc_I	addcc 	%r16, 0x0aa9, %r24
	.word 0xb83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r28
thr3_nuke_intr_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_306), 16, 16)) -> intp(1, 2, 1)
	.word 0x8d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r6
	.word 0xb2b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0x9a9c299b  ! 1: XORcc_I	xorcc 	%r16, 0x099b, %r13
	.word 0x8e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r7
thr3_resum_intr_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_307), 16, 16)) -> intp(1, 3, 1)
	.word 0xbb340011  ! 1: SRL_R	srl 	%r16, %r17, %r29
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
	.word 0xb68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r27
thr3_hw_intr_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_308), 16, 16)) -> intp(2, 0, 1)
	.word 0x9a3c2980  ! 1: XNOR_I	xnor 	%r16, 0x0980, %r13
thr3_hw_intr_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_309), 16, 16)) -> intp(1, 0, 1)
	.word 0xa6442d5b  ! 1: ADDC_I	addc 	%r16, 0x0d5b, %r19
thr3_nuke_intr_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_310), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r29
	.word 0x8b7c0411  ! 1: MOVR_R	move	%r16, %r17, %r5
	.word 0xb81c2e67  ! 1: XOR_I	xor 	%r16, 0x0e67, %r28
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
thr3_resum_intr_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_311), 16, 16)) -> intp(0, 3, 1)
	.word 0x98bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x909c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
	.word 0x983c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r12
thr3_hw_intr_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_312), 16, 16)) -> intp(1, 0, 1)
	.word 0x98440011  ! 1: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r7
thr3_hw_intr_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_313), 16, 16)) -> intp(2, 0, 1)
	.word 0xb72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r27
thr3_hw_intr_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_314), 16, 16)) -> intp(2, 0, 1)
	.word 0x973c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r11
thr3_nuke_intr_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_315), 16, 16)) -> intp(0, 2, 1)
	.word 0xb21c25b0  ! 1: XOR_I	xor 	%r16, 0x05b0, %r25
thr3_resum_intr_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_316), 16, 16)) -> intp(0, 3, 1)
	.word 0x90c42b46  ! 1: ADDCcc_I	addccc 	%r16, 0x0b46, %r8
thr3_nuke_intr_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_317), 16, 16)) -> intp(1, 2, 1)
	.word 0x8eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0xa84421a7  ! 1: ADDC_I	addc 	%r16, 0x01a7, %r20
thr3_resum_intr_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_318), 16, 16)) -> intp(1, 3, 1)
	.word 0xb5342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0x8ab427d5  ! 1: ORNcc_I	orncc 	%r16, 0x07d5, %r5
thr3_nuke_intr_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_319), 16, 16)) -> intp(1, 2, 1)
	.word 0x9b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x8e142df7  ! 1: OR_I	or 	%r16, 0x0df7, %r7
	.word 0x860c2122  ! 1: AND_I	and 	%r16, 0x0122, %r3
	.word 0x9a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r13
thr3_resum_intr_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_320), 16, 16)) -> intp(1, 3, 1)
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
	.word 0x96940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0x83341011  ! 1: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x87342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r3
thr3_hw_intr_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_321), 16, 16)) -> intp(1, 0, 1)
	.word 0xb13c1011  ! 1: SRAX_R	srax	%r16, %r17, %r24
thr3_nuke_intr_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_322), 16, 16)) -> intp(0, 2, 1)
	.word 0xae840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r23
thr3_resum_intr_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_323), 16, 16)) -> intp(0, 3, 1)
	.word 0xb1342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r24
thr3_hw_intr_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_324), 16, 16)) -> intp(0, 0, 1)
	.word 0xb53c1011  ! 1: SRAX_R	srax	%r16, %r17, %r26
	.word 0x98040011  ! 1: ADD_R	add 	%r16, %r17, %r12
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
thr3_hw_intr_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_325), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r26
thr3_nuke_intr_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_326), 16, 16)) -> intp(2, 2, 1)
	.word 0xad342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
thr3_resum_intr_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_327), 16, 16)) -> intp(2, 3, 1)
	.word 0x862c2a0d  ! 1: ANDN_I	andn 	%r16, 0x0a0d, %r3
	.word 0xb7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x9234204d  ! 1: ORN_I	orn 	%r16, 0x004d, %r9
thr3_nuke_intr_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_328), 16, 16)) -> intp(2, 2, 1)
	.word 0x9e442e99  ! 1: ADDC_I	addc 	%r16, 0x0e99, %r15
	.word 0x8ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x973c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x9c8c225a  ! 1: ANDcc_I	andcc 	%r16, 0x025a, %r14
thr3_resum_intr_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_329), 16, 16)) -> intp(2, 3, 1)
	.word 0xb0942b7c  ! 1: ORcc_I	orcc 	%r16, 0x0b7c, %r24
	.word 0xad641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x952c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
thr3_hw_intr_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_330), 16, 16)) -> intp(2, 0, 1)
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x88442cb9  ! 1: ADDC_I	addc 	%r16, 0x0cb9, %r4
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0xcb9, %r7
thr3_hw_intr_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_331), 16, 16)) -> intp(2, 0, 1)
	.word 0xa68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0xae1c2447  ! 1: XOR_I	xor 	%r16, 0x0447, %r23
thr3_nuke_intr_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_332), 16, 16)) -> intp(2, 2, 1)
	.word 0xae1c23a6  ! 1: XOR_I	xor 	%r16, 0x03a6, %r23
	.word 0xaf2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r23
	.word 0xb82c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r28
thr3_resum_intr_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_333), 16, 16)) -> intp(2, 3, 1)
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x85340011  ! 1: SRL_R	srl 	%r16, %r17, %r2
	.word 0xaac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r21
thr3_nuke_intr_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_334), 16, 16)) -> intp(0, 2, 1)
	.word 0xb09c2e80  ! 1: XORcc_I	xorcc 	%r16, 0x0e80, %r24
thr3_resum_intr_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_335), 16, 16)) -> intp(0, 3, 1)
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
thr3_nuke_intr_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_336), 16, 16)) -> intp(2, 2, 1)
	.word 0x9b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r13
thr3_resum_intr_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_337), 16, 16)) -> intp(2, 3, 1)
	.word 0x84b42414  ! 1: ORNcc_I	orncc 	%r16, 0x0414, %r2
thr3_nuke_intr_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_338), 16, 16)) -> intp(2, 2, 1)
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
thr3_resum_intr_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_339), 16, 16)) -> intp(2, 3, 1)
	.word 0x86ac2d8d  ! 1: ANDNcc_I	andncc 	%r16, 0x0d8d, %r3
thr3_nuke_intr_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_340), 16, 16)) -> intp(0, 2, 1)
	.word 0x84c421f4  ! 1: ADDCcc_I	addccc 	%r16, 0x01f4, %r2
	.word 0x96bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
thr3_resum_intr_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_341), 16, 16)) -> intp(0, 3, 1)
	.word 0x8a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0xa6442007  ! 1: ADDC_I	addc 	%r16, 0x0007, %r19
	.word 0x96b425ed  ! 1: ORNcc_I	orncc 	%r16, 0x05ed, %r11
thr3_nuke_intr_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_342), 16, 16)) -> intp(0, 2, 1)
	.word 0xae040011  ! 1: ADD_R	add 	%r16, %r17, %r23
thr3_resum_intr_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_343), 16, 16)) -> intp(0, 3, 1)
	.word 0x9f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r15
thr3_hw_intr_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_344), 16, 16)) -> intp(2, 0, 1)
	.word 0xaa3c24a9  ! 1: XNOR_I	xnor 	%r16, 0x04a9, %r21
	.word 0x86b42617  ! 1: ORNcc_I	orncc 	%r16, 0x0617, %r3
	.word 0x8c442fa9  ! 1: ADDC_I	addc 	%r16, 0x0fa9, %r6
thr3_nuke_intr_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_345), 16, 16)) -> intp(1, 2, 1)
	.word 0xb43c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0xaeac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r23
thr3_resum_intr_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_346), 16, 16)) -> intp(1, 3, 1)
	.word 0x841c234f  ! 1: XOR_I	xor 	%r16, 0x034f, %r2
	.word 0xb43c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r26
thr3_hw_intr_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_347), 16, 16)) -> intp(1, 0, 1)
	.word 0xaaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0x9e34231a  ! 1: ORN_I	orn 	%r16, 0x031a, %r15
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
thr3_nuke_intr_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_348), 16, 16)) -> intp(1, 2, 1)
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9ebc2fdd  ! 1: XNORcc_I	xnorcc 	%r16, 0x0fdd, %r15
thr3_resum_intr_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_349), 16, 16)) -> intp(1, 3, 1)
	.word 0x833c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0xb93c0011  ! 1: SRA_R	sra 	%r16, %r17, %r28
thr3_nuke_intr_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_350), 16, 16)) -> intp(1, 2, 1)
	.word 0x88142c0d  ! 1: OR_I	or 	%r16, 0x0c0d, %r4
thr3_resum_intr_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_351), 16, 16)) -> intp(1, 3, 1)
	.word 0x897c2401  ! 1: MOVR_I	move	%r16, 0xc0d, %r4
thr3_nuke_intr_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_352), 16, 16)) -> intp(1, 2, 1)
	.word 0x87343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0xb72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r27
thr3_resum_intr_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_353), 16, 16)) -> intp(1, 3, 1)
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0xa8942d69  ! 1: ORcc_I	orcc 	%r16, 0x0d69, %r20
thr3_nuke_intr_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_354), 16, 16)) -> intp(0, 2, 1)
	.word 0x86340011  ! 1: ORN_R	orn 	%r16, %r17, %r3
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
thr3_resum_intr_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_355), 16, 16)) -> intp(0, 3, 1)
	.word 0xb82c28bf  ! 1: ANDN_I	andn 	%r16, 0x08bf, %r28
	.word 0xb2040011  ! 1: ADD_R	add 	%r16, %r17, %r25
thr3_hw_intr_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_356), 16, 16)) -> intp(2, 0, 1)
	.word 0x908c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0xaa8c2c65  ! 1: ANDcc_I	andcc 	%r16, 0x0c65, %r21
thr3_hw_intr_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_357), 16, 16)) -> intp(2, 0, 1)
	.word 0xab2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r21
thr3_hw_intr_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_358), 16, 16)) -> intp(1, 0, 1)
	.word 0x90bc2059  ! 1: XNORcc_I	xnorcc 	%r16, 0x0059, %r8
thr3_hw_intr_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_359), 16, 16)) -> intp(0, 0, 1)
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x91641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_360), 16, 16)) -> intp(1, 0, 1)
	.word 0xb0c42859  ! 1: ADDCcc_I	addccc 	%r16, 0x0859, %r24
	.word 0xba3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0xb7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
thr3_hw_intr_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_361), 16, 16)) -> intp(2, 0, 1)
	.word 0xa8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r20
thr3_nuke_intr_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_362), 16, 16)) -> intp(1, 2, 1)
	.word 0x8d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r6
	.word 0x84840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r2
thr3_resum_intr_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_363), 16, 16)) -> intp(1, 3, 1)
	.word 0xb32c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0x8eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r7
thr3_nuke_intr_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_364), 16, 16)) -> intp(0, 2, 1)
	.word 0x92ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xb89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r28
thr3_resum_intr_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_365), 16, 16)) -> intp(0, 3, 1)
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0xb2940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r25
thr3_nuke_intr_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_366), 16, 16)) -> intp(0, 2, 1)
	.word 0x872c0011  ! 1: SLL_R	sll 	%r16, %r17, %r3
	.word 0xb72c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r27
thr3_resum_intr_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_367), 16, 16)) -> intp(0, 3, 1)
	.word 0xab342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0xaa1c29a4  ! 1: XOR_I	xor 	%r16, 0x09a4, %r21
thr3_nuke_intr_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_368), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf340011  ! 1: SRL_R	srl 	%r16, %r17, %r23
	.word 0xbab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x8a9c20c0  ! 1: XORcc_I	xorcc 	%r16, 0x00c0, %r5
	.word 0x92042546  ! 1: ADD_I	add 	%r16, 0x0546, %r9
thr3_resum_intr_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_369), 16, 16)) -> intp(0, 3, 1)
	.word 0x8ebc2544  ! 1: XNORcc_I	xnorcc 	%r16, 0x0544, %r7
	.word 0x9a9c2ff9  ! 1: XORcc_I	xorcc 	%r16, 0x0ff9, %r13
	.word 0xb13c0011  ! 1: SRA_R	sra 	%r16, %r17, %r24
	.word 0xaf343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r23
thr3_nuke_intr_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_370), 16, 16)) -> intp(1, 2, 1)
	.word 0x9b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r13
	.word 0xa8040011  ! 1: ADD_R	add 	%r16, %r17, %r20
	.word 0xb09c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r24
thr3_resum_intr_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_371), 16, 16)) -> intp(1, 3, 1)
	.word 0x9c1c2614  ! 1: XOR_I	xor 	%r16, 0x0614, %r14
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
thr3_nuke_intr_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_372), 16, 16)) -> intp(2, 2, 1)
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
	.word 0xac1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r22
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0xac8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r22
thr3_resum_intr_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_373), 16, 16)) -> intp(2, 3, 1)
	.word 0xaf2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r23
	.word 0xb2342cf7  ! 1: ORN_I	orn 	%r16, 0x0cf7, %r25
	.word 0xa83c20b9  ! 1: XNOR_I	xnor 	%r16, 0x00b9, %r20
	.word 0x8e84241e  ! 1: ADDcc_I	addcc 	%r16, 0x041e, %r7
thr3_hw_intr_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_374), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
thr3_nuke_intr_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_375), 16, 16)) -> intp(0, 2, 1)
	.word 0x940c284b  ! 1: AND_I	and 	%r16, 0x084b, %r10
thr3_resum_intr_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_376), 16, 16)) -> intp(0, 3, 1)
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
thr3_nuke_intr_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_377), 16, 16)) -> intp(2, 2, 1)
	.word 0x86bc2eae  ! 1: XNORcc_I	xnorcc 	%r16, 0x0eae, %r3
	.word 0xaf340011  ! 1: SRL_R	srl 	%r16, %r17, %r23
thr3_resum_intr_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_378), 16, 16)) -> intp(2, 3, 1)
	.word 0x849c2d71  ! 1: XORcc_I	xorcc 	%r16, 0x0d71, %r2
	.word 0xaabc251b  ! 1: XNORcc_I	xnorcc 	%r16, 0x051b, %r21
thr3_nuke_intr_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_379), 16, 16)) -> intp(1, 2, 1)
	.word 0xb88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r28
thr3_resum_intr_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_380), 16, 16)) -> intp(1, 3, 1)
	.word 0x8d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r6
thr3_nuke_intr_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_381), 16, 16)) -> intp(2, 2, 1)
	.word 0x94b422e1  ! 1: ORNcc_I	orncc 	%r16, 0x02e1, %r10
	.word 0x82042cb2  ! 1: ADD_I	add 	%r16, 0x0cb2, %r1
	.word 0x9d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x86942961  ! 1: ORcc_I	orcc 	%r16, 0x0961, %r3
thr3_resum_intr_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_382), 16, 16)) -> intp(2, 3, 1)
	.word 0x972c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0xb8340011  ! 1: ORN_R	orn 	%r16, %r17, %r28
	.word 0xbb2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0xa644202d  ! 1: ADDC_I	addc 	%r16, 0x002d, %r19
thr3_hw_intr_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_383), 16, 16)) -> intp(1, 0, 1)
	.word 0x8a0c21fc  ! 1: AND_I	and 	%r16, 0x01fc, %r5
	.word 0x8d643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xbb7c2401  ! 1: MOVR_I	move	%r16, 0x1fc, %r29
	.word 0xbaac2543  ! 1: ANDNcc_I	andncc 	%r16, 0x0543, %r29
thr3_nuke_intr_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_384), 16, 16)) -> intp(0, 2, 1)
	.word 0x997c0411  ! 1: MOVR_R	move	%r16, %r17, %r12
	.word 0x85643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x86842399  ! 1: ADDcc_I	addcc 	%r16, 0x0399, %r3
	.word 0x94440011  ! 1: ADDC_R	addc 	%r16, %r17, %r10
thr3_resum_intr_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_385), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb7c0411  ! 1: MOVR_R	move	%r16, %r17, %r29
	.word 0xa82c21bc  ! 1: ANDN_I	andn 	%r16, 0x01bc, %r20
	.word 0x8ebc2345  ! 1: XNORcc_I	xnorcc 	%r16, 0x0345, %r7
	.word 0x928c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r9
thr3_nuke_intr_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_386), 16, 16)) -> intp(1, 2, 1)
	.word 0xa80c28a6  ! 1: AND_I	and 	%r16, 0x08a6, %r20
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x86bc2b1d  ! 1: XNORcc_I	xnorcc 	%r16, 0x0b1d, %r3
thr3_resum_intr_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_387), 16, 16)) -> intp(1, 3, 1)
	.word 0x821427b3  ! 1: OR_I	or 	%r16, 0x07b3, %r1
	.word 0x94c42ca9  ! 1: ADDCcc_I	addccc 	%r16, 0x0ca9, %r10
	.word 0x8d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r6
thr3_nuke_intr_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_388), 16, 16)) -> intp(2, 2, 1)
	.word 0xaab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0x94bc20a4  ! 1: XNORcc_I	xnorcc 	%r16, 0x00a4, %r10
	.word 0x96842d87  ! 1: ADDcc_I	addcc 	%r16, 0x0d87, %r11
	.word 0x86bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r3
thr3_resum_intr_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_389), 16, 16)) -> intp(2, 3, 1)
	.word 0x942c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x908c2ca3  ! 1: ANDcc_I	andcc 	%r16, 0x0ca3, %r8
	.word 0xac3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r22
thr3_hw_intr_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_390), 16, 16)) -> intp(0, 0, 1)
	.word 0x82842c44  ! 1: ADDcc_I	addcc 	%r16, 0x0c44, %r1
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0x92b420dd  ! 1: ORNcc_I	orncc 	%r16, 0x00dd, %r9
	.word 0x94940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r10
thr3_hw_intr_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_391), 16, 16)) -> intp(2, 0, 1)
	.word 0xba1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r29
thr3_nuke_intr_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_392), 16, 16)) -> intp(1, 2, 1)
	.word 0x85343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r2
thr3_resum_intr_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_393), 16, 16)) -> intp(1, 3, 1)
	.word 0xae440011  ! 1: ADDC_R	addc 	%r16, %r17, %r23
thr3_hw_intr_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_394), 16, 16)) -> intp(0, 0, 1)
	.word 0x8d3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0x90bc23f6  ! 1: XNORcc_I	xnorcc 	%r16, 0x03f6, %r8
thr3_nuke_intr_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_395), 16, 16)) -> intp(0, 2, 1)
	.word 0x9e140011  ! 1: OR_R	or 	%r16, %r17, %r15
	.word 0xb61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r27
	.word 0xac04244e  ! 1: ADD_I	add 	%r16, 0x044e, %r22
thr3_resum_intr_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_396), 16, 16)) -> intp(0, 3, 1)
	.word 0x8f643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8f641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
thr3_nuke_intr_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_397), 16, 16)) -> intp(2, 2, 1)
	.word 0xb29c2fc9  ! 1: XORcc_I	xorcc 	%r16, 0x0fc9, %r25
	.word 0x8eb42cc6  ! 1: ORNcc_I	orncc 	%r16, 0x0cc6, %r7
thr3_resum_intr_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_398), 16, 16)) -> intp(2, 3, 1)
	.word 0x92bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x88040011  ! 1: ADD_R	add 	%r16, %r17, %r4
thr3_nuke_intr_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_399), 16, 16)) -> intp(0, 2, 1)
	.word 0xbac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0x942c2f97  ! 1: ANDN_I	andn 	%r16, 0x0f97, %r10
	.word 0x82440011  ! 1: ADDC_R	addc 	%r16, %r17, %r1
	.word 0xac0c0011  ! 1: AND_R	and 	%r16, %r17, %r22
thr3_resum_intr_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_400), 16, 16)) -> intp(0, 3, 1)
	.word 0x961c29b9  ! 1: XOR_I	xor 	%r16, 0x09b9, %r11
	.word 0x93641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
thr3_hw_intr_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_401), 16, 16)) -> intp(0, 0, 1)
	.word 0x821c284b  ! 1: XOR_I	xor 	%r16, 0x084b, %r1
	.word 0xa60c0011  ! 1: AND_R	and 	%r16, %r17, %r19
	.word 0x993c1011  ! 1: SRAX_R	srax	%r16, %r17, %r12
	.word 0x92040011  ! 1: ADD_R	add 	%r16, %r17, %r9
thr3_hw_intr_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_402), 16, 16)) -> intp(2, 0, 1)
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
thr3_hw_intr_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_403), 16, 16)) -> intp(1, 0, 1)
	.word 0x9f643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x93641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9c1426f1  ! 1: OR_I	or 	%r16, 0x06f1, %r14
	.word 0x9c142629  ! 1: OR_I	or 	%r16, 0x0629, %r14
thr3_nuke_intr_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_404), 16, 16)) -> intp(0, 2, 1)
	.word 0x82342639  ! 1: ORN_I	orn 	%r16, 0x0639, %r1
thr3_resum_intr_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_405), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
thr3_hw_intr_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_406), 16, 16)) -> intp(2, 0, 1)
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x9d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r14
thr3_hw_intr_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_407), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa0c237c  ! 1: AND_I	and 	%r16, 0x037c, %r21
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
	.word 0x9b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9d641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_408), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a942b33  ! 1: ORcc_I	orcc 	%r16, 0x0b33, %r5
thr3_resum_intr_409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_409), 16, 16)) -> intp(2, 3, 1)
	.word 0xa60c0011  ! 1: AND_R	and 	%r16, %r17, %r19
thr3_nuke_intr_410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_410), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r23
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
thr3_resum_intr_411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_411), 16, 16)) -> intp(0, 3, 1)
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
	.word 0xb5341011  ! 1: SRLX_R	srlx	%r16, %r17, %r26
thr3_hw_intr_412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_412), 16, 16)) -> intp(0, 0, 1)
	.word 0x8c3425e2  ! 1: ORN_I	orn 	%r16, 0x05e2, %r6
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
	.word 0x96042226  ! 1: ADD_I	add 	%r16, 0x0226, %r11
thr3_nuke_intr_413:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_413), 16, 16)) -> intp(0, 2, 1)
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
	.word 0xb00424b0  ! 1: ADD_I	add 	%r16, 0x04b0, %r24
	.word 0xb77c0411  ! 1: MOVR_R	move	%r16, %r17, %r27
thr3_resum_intr_414:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_414), 16, 16)) -> intp(0, 3, 1)
	.word 0x94440011  ! 1: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x98440011  ! 1: ADDC_R	addc 	%r16, %r17, %r12
	.word 0xae040011  ! 1: ADD_R	add 	%r16, %r17, %r23
thr3_nuke_intr_415:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_415), 16, 16)) -> intp(1, 2, 1)
	.word 0x8f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r7
	.word 0x9a3c2669  ! 1: XNOR_I	xnor 	%r16, 0x0669, %r13
thr3_resum_intr_416:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_416), 16, 16)) -> intp(1, 3, 1)
	.word 0x863c2c3d  ! 1: XNOR_I	xnor 	%r16, 0x0c3d, %r3
	.word 0xad3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r22
thr3_hw_intr_417:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_417), 16, 16)) -> intp(0, 0, 1)
	.word 0x9604295a  ! 1: ADD_I	add 	%r16, 0x095a, %r11
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
	.word 0xb6342ba4  ! 1: ORN_I	orn 	%r16, 0x0ba4, %r27
	.word 0xba840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r29
thr3_nuke_intr_418:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_418), 16, 16)) -> intp(0, 2, 1)
	.word 0xac3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x940c2f61  ! 1: AND_I	and 	%r16, 0x0f61, %r10
	.word 0x97641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_419:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_419), 16, 16)) -> intp(0, 3, 1)
	.word 0x832c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x8c042d26  ! 1: ADD_I	add 	%r16, 0x0d26, %r6
	.word 0x8e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r7
thr3_hw_intr_420:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_420), 16, 16)) -> intp(0, 0, 1)
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x989c23d0  ! 1: XORcc_I	xorcc 	%r16, 0x03d0, %r12
	.word 0x9a2c2e48  ! 1: ANDN_I	andn 	%r16, 0x0e48, %r13
thr3_hw_intr_421:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_421), 16, 16)) -> intp(2, 0, 1)
	.word 0xae842464  ! 1: ADDcc_I	addcc 	%r16, 0x0464, %r23
	.word 0x943c260d  ! 1: XNOR_I	xnor 	%r16, 0x060d, %r10
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
thr3_nuke_intr_422:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_422), 16, 16)) -> intp(1, 2, 1)
	.word 0x977c2401  ! 1: MOVR_I	move	%r16, 0x11, %r11
	.word 0x82ac28a6  ! 1: ANDNcc_I	andncc 	%r16, 0x08a6, %r1
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
thr3_resum_intr_423:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_423), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
	.word 0x98340011  ! 1: ORN_R	orn 	%r16, %r17, %r12
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
thr3_hw_intr_424:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_424), 16, 16)) -> intp(2, 0, 1)
	.word 0xb01426bb  ! 1: OR_I	or 	%r16, 0x06bb, %r24
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
thr3_hw_intr_425:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_425), 16, 16)) -> intp(2, 0, 1)
	.word 0xba9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r29
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
thr3_hw_intr_426:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_426), 16, 16)) -> intp(0, 0, 1)
	.word 0x89340011  ! 1: SRL_R	srl 	%r16, %r17, %r4
	.word 0x8c1429a4  ! 1: OR_I	or 	%r16, 0x09a4, %r6
	.word 0x8f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r7
thr3_nuke_intr_427:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_427), 16, 16)) -> intp(2, 2, 1)
	.word 0x9b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x87343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r3
thr3_resum_intr_428:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_428), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a1c22d2  ! 1: XOR_I	xor 	%r16, 0x02d2, %r5
	.word 0xb28c239b  ! 1: ANDcc_I	andcc 	%r16, 0x039b, %r25
thr3_nuke_intr_429:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_429), 16, 16)) -> intp(1, 2, 1)
	.word 0x8ac42a85  ! 1: ADDCcc_I	addccc 	%r16, 0x0a85, %r5
thr3_resum_intr_430:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_430), 16, 16)) -> intp(1, 3, 1)
	.word 0x848c2716  ! 1: ANDcc_I	andcc 	%r16, 0x0716, %r2
thr3_hw_intr_431:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_431), 16, 16)) -> intp(1, 0, 1)
	.word 0x8d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r6
	.word 0x88340011  ! 1: ORN_R	orn 	%r16, %r17, %r4
thr3_nuke_intr_432:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_432), 16, 16)) -> intp(1, 2, 1)
	.word 0x96bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r11
thr3_resum_intr_433:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_433), 16, 16)) -> intp(1, 3, 1)
	.word 0x92040011  ! 1: ADD_R	add 	%r16, %r17, %r9
thr3_nuke_intr_434:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_434), 16, 16)) -> intp(1, 2, 1)
	.word 0x9484290d  ! 1: ADDcc_I	addcc 	%r16, 0x090d, %r10
	.word 0xb0442473  ! 1: ADDC_I	addc 	%r16, 0x0473, %r24
	.word 0x82c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0xb82c2a1f  ! 1: ANDN_I	andn 	%r16, 0x0a1f, %r28
thr3_resum_intr_435:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_435), 16, 16)) -> intp(1, 3, 1)
	.word 0xb2140011  ! 1: OR_R	or 	%r16, %r17, %r25
	.word 0x97643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb0040011  ! 1: ADD_R	add 	%r16, %r17, %r24
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
thr3_nuke_intr_436:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_436), 16, 16)) -> intp(2, 2, 1)
	.word 0xa6140011  ! 1: OR_R	or 	%r16, %r17, %r19
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x8c1c2866  ! 1: XOR_I	xor 	%r16, 0x0866, %r6
thr3_resum_intr_437:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_437), 16, 16)) -> intp(2, 3, 1)
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0x909c2678  ! 1: XORcc_I	xorcc 	%r16, 0x0678, %r8
thr3_hw_intr_438:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_438), 16, 16)) -> intp(1, 0, 1)
	.word 0x9a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r13
thr3_hw_intr_439:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_439), 16, 16)) -> intp(2, 0, 1)
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0x8cb4257a  ! 1: ORNcc_I	orncc 	%r16, 0x057a, %r6
	.word 0x917c0411  ! 1: MOVR_R	move	%r16, %r17, %r8
thr3_nuke_intr_440:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_440), 16, 16)) -> intp(1, 2, 1)
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
thr3_resum_intr_441:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_441), 16, 16)) -> intp(1, 3, 1)
	.word 0x89341011  ! 1: SRLX_R	srlx	%r16, %r17, %r4
	.word 0xac040011  ! 1: ADD_R	add 	%r16, %r17, %r22
thr3_hw_intr_442:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_442), 16, 16)) -> intp(1, 0, 1)
	.word 0x8a34243e  ! 1: ORN_I	orn 	%r16, 0x043e, %r5
thr3_nuke_intr_443:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_443), 16, 16)) -> intp(0, 2, 1)
	.word 0x8b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x9f340011  ! 1: SRL_R	srl 	%r16, %r17, %r15
	.word 0x8c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x86440011  ! 1: ADDC_R	addc 	%r16, %r17, %r3
thr3_resum_intr_444:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_444), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x868c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x9e9c281b  ! 1: XORcc_I	xorcc 	%r16, 0x081b, %r15
thr3_nuke_intr_445:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_445), 16, 16)) -> intp(1, 2, 1)
	.word 0xb2bc24eb  ! 1: XNORcc_I	xnorcc 	%r16, 0x04eb, %r25
thr3_resum_intr_446:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_446), 16, 16)) -> intp(1, 3, 1)
	.word 0x852c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r2
thr3_hw_intr_447:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_447), 16, 16)) -> intp(1, 0, 1)
	.word 0x93342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r9
thr3_hw_intr_448:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_448), 16, 16)) -> intp(0, 0, 1)
	.word 0xb29c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0x9f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x828c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r1
thr3_nuke_intr_449:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_449), 16, 16)) -> intp(1, 2, 1)
	.word 0xba1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r29
	.word 0xaf340011  ! 1: SRL_R	srl 	%r16, %r17, %r23
	.word 0xb33c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r25
thr3_resum_intr_450:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_450), 16, 16)) -> intp(1, 3, 1)
	.word 0xb0c423b8  ! 1: ADDCcc_I	addccc 	%r16, 0x03b8, %r24
	.word 0x89643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r28
thr3_nuke_intr_451:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_451), 16, 16)) -> intp(2, 2, 1)
	.word 0x8abc2a2b  ! 1: XNORcc_I	xnorcc 	%r16, 0x0a2b, %r5
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
	.word 0xb0340011  ! 1: ORN_R	orn 	%r16, %r17, %r24
thr3_resum_intr_452:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_452), 16, 16)) -> intp(2, 3, 1)
	.word 0x868c2548  ! 1: ANDcc_I	andcc 	%r16, 0x0548, %r3
	.word 0x8f340011  ! 1: SRL_R	srl 	%r16, %r17, %r7
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
thr3_nuke_intr_453:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_453), 16, 16)) -> intp(0, 2, 1)
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
	.word 0x9a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r13
	.word 0xaa2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r21
thr3_resum_intr_454:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_454), 16, 16)) -> intp(0, 3, 1)
	.word 0x8f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r7
	.word 0xaf3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r23
	.word 0x823c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r1
thr3_nuke_intr_455:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_455), 16, 16)) -> intp(2, 2, 1)
	.word 0xaab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
thr3_resum_intr_456:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_456), 16, 16)) -> intp(2, 3, 1)
	.word 0x94c423fc  ! 1: ADDCcc_I	addccc 	%r16, 0x03fc, %r10
	.word 0xb92c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r28
thr3_nuke_intr_457:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_457), 16, 16)) -> intp(2, 2, 1)
	.word 0xb214205a  ! 1: OR_I	or 	%r16, 0x005a, %r25
	.word 0xb2bc2a69  ! 1: XNORcc_I	xnorcc 	%r16, 0x0a69, %r25
	.word 0x86040011  ! 1: ADD_R	add 	%r16, %r17, %r3
thr3_resum_intr_458:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_458), 16, 16)) -> intp(2, 3, 1)
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x881420a0  ! 1: OR_I	or 	%r16, 0x00a0, %r4
	.word 0xb63420dd  ! 1: ORN_I	orn 	%r16, 0x00dd, %r27
thr3_hw_intr_459:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_459), 16, 16)) -> intp(1, 0, 1)
	.word 0xb32c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r25
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xac4428ab  ! 1: ADDC_I	addc 	%r16, 0x08ab, %r22
	.word 0xab2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r21
thr3_hw_intr_460:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_460), 16, 16)) -> intp(2, 0, 1)
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x94142af3  ! 1: OR_I	or 	%r16, 0x0af3, %r10
thr3_nuke_intr_461:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_461), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa0c2ac7  ! 1: AND_I	and 	%r16, 0x0ac7, %r21
thr3_resum_intr_462:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_462), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r29
thr3_nuke_intr_463:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_463), 16, 16)) -> intp(1, 2, 1)
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0xb2140011  ! 1: OR_R	or 	%r16, %r17, %r25
thr3_resum_intr_464:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_464), 16, 16)) -> intp(1, 3, 1)
	.word 0x861c20a4  ! 1: XOR_I	xor 	%r16, 0x00a4, %r3
	.word 0x8c140011  ! 1: OR_R	or 	%r16, %r17, %r6
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
thr3_hw_intr_465:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_465), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c140011  ! 1: OR_R	or 	%r16, %r17, %r14
	.word 0x96042051  ! 1: ADD_I	add 	%r16, 0x0051, %r11
	.word 0x97641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
thr3_nuke_intr_466:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_466), 16, 16)) -> intp(0, 2, 1)
	.word 0x94942cc3  ! 1: ORcc_I	orcc 	%r16, 0x0cc3, %r10
	.word 0x920c20ec  ! 1: AND_I	and 	%r16, 0x00ec, %r9
	.word 0x82c42743  ! 1: ADDCcc_I	addccc 	%r16, 0x0743, %r1
	.word 0x9eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r15
thr3_resum_intr_467:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_467), 16, 16)) -> intp(0, 3, 1)
	.word 0x8abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0x8284292a  ! 1: ADDcc_I	addcc 	%r16, 0x092a, %r1
	.word 0x977c2401  ! 1: MOVR_I	move	%r16, 0x92a, %r11
	.word 0x8d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r6
thr3_nuke_intr_468:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_468), 16, 16)) -> intp(0, 2, 1)
	.word 0x90b42f04  ! 1: ORNcc_I	orncc 	%r16, 0x0f04, %r8
	.word 0x8ebc2c30  ! 1: XNORcc_I	xnorcc 	%r16, 0x0c30, %r7
	.word 0x9b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x93341011  ! 1: SRLX_R	srlx	%r16, %r17, %r9
thr3_resum_intr_469:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_469), 16, 16)) -> intp(0, 3, 1)
	.word 0x9c8427b1  ! 1: ADDcc_I	addcc 	%r16, 0x07b1, %r14
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x88040011  ! 1: ADD_R	add 	%r16, %r17, %r4
thr3_hw_intr_470:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_470), 16, 16)) -> intp(2, 0, 1)
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
thr3_nuke_intr_471:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_471), 16, 16)) -> intp(1, 2, 1)
	.word 0x8e1c2b7b  ! 1: XOR_I	xor 	%r16, 0x0b7b, %r7
	.word 0x9aac200a  ! 1: ANDNcc_I	andncc 	%r16, 0x000a, %r13
	.word 0xa73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r19
	.word 0x8ebc2661  ! 1: XNORcc_I	xnorcc 	%r16, 0x0661, %r7
thr3_resum_intr_472:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_472), 16, 16)) -> intp(1, 3, 1)
	.word 0x9cbc25df  ! 1: XNORcc_I	xnorcc 	%r16, 0x05df, %r14
	.word 0xba2c212c  ! 1: ANDN_I	andn 	%r16, 0x012c, %r29
	.word 0xb1343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0x8b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r5
thr3_nuke_intr_473:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_473), 16, 16)) -> intp(1, 2, 1)
	.word 0xab3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r21
thr3_resum_intr_474:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_474), 16, 16)) -> intp(1, 3, 1)
	.word 0xaac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r21
thr3_hw_intr_475:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_475), 16, 16)) -> intp(0, 0, 1)
	.word 0xb8342ea1  ! 1: ORN_I	orn 	%r16, 0x0ea1, %r28
thr3_hw_intr_476:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_476), 16, 16)) -> intp(2, 0, 1)
	.word 0xb63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0xb52c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r26
thr3_hw_intr_477:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_477), 16, 16)) -> intp(2, 0, 1)
	.word 0x9b340011  ! 1: SRL_R	srl 	%r16, %r17, %r13
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
	.word 0xae3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r23
thr3_hw_intr_478:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_478), 16, 16)) -> intp(0, 0, 1)
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x86bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r3
thr3_nuke_intr_479:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_479), 16, 16)) -> intp(1, 2, 1)
	.word 0x98ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r12
thr3_resum_intr_480:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_480), 16, 16)) -> intp(1, 3, 1)
	.word 0x9c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r14
thr3_hw_intr_481:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_481), 16, 16)) -> intp(2, 0, 1)
	.word 0xa68c2264  ! 1: ANDcc_I	andcc 	%r16, 0x0264, %r19
thr3_hw_intr_482:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_482), 16, 16)) -> intp(1, 0, 1)
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
thr3_nuke_intr_483:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_483), 16, 16)) -> intp(0, 2, 1)
	.word 0x992c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x953c0011  ! 1: SRA_R	sra 	%r16, %r17, %r10
	.word 0xa8442dd6  ! 1: ADDC_I	addc 	%r16, 0x0dd6, %r20
	.word 0x8d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r6
thr3_resum_intr_484:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_484), 16, 16)) -> intp(0, 3, 1)
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r7
	.word 0x841c0011  ! 1: XOR_R	xor 	%r16, %r17, %r2
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0xa6ac27e3  ! 1: ANDNcc_I	andncc 	%r16, 0x07e3, %r19
thr3_hw_intr_485:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_485), 16, 16)) -> intp(0, 0, 1)
	.word 0x9f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r15
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
thr3_nuke_intr_486:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_486), 16, 16)) -> intp(0, 2, 1)
	.word 0xb2c42149  ! 1: ADDCcc_I	addccc 	%r16, 0x0149, %r25
thr3_resum_intr_487:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_487), 16, 16)) -> intp(0, 3, 1)
	.word 0x8c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r6
thr3_hw_intr_488:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_488), 16, 16)) -> intp(1, 0, 1)
	.word 0xb4442bb0  ! 1: ADDC_I	addc 	%r16, 0x0bb0, %r26
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
thr3_nuke_intr_489:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_489), 16, 16)) -> intp(0, 2, 1)
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xac8c22d1  ! 1: ANDcc_I	andcc 	%r16, 0x02d1, %r22
	.word 0xb82c21de  ! 1: ANDN_I	andn 	%r16, 0x01de, %r28
thr3_resum_intr_490:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_490), 16, 16)) -> intp(0, 3, 1)
	.word 0x889c204c  ! 1: XORcc_I	xorcc 	%r16, 0x004c, %r4
	.word 0x829c2423  ! 1: XORcc_I	xorcc 	%r16, 0x0423, %r1
	.word 0x8d7c2401  ! 1: MOVR_I	move	%r16, 0x423, %r6
thr3_nuke_intr_491:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_491), 16, 16)) -> intp(2, 2, 1)
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_492:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_492), 16, 16)) -> intp(2, 3, 1)
	.word 0xb1641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_493:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_493), 16, 16)) -> intp(1, 2, 1)
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0xb42c249d  ! 1: ANDN_I	andn 	%r16, 0x049d, %r26
	.word 0xab343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0x8b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r5
thr3_resum_intr_494:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_494), 16, 16)) -> intp(1, 3, 1)
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
	.word 0xa6942c8b  ! 1: ORcc_I	orcc 	%r16, 0x0c8b, %r19
	.word 0x8a442d9d  ! 1: ADDC_I	addc 	%r16, 0x0d9d, %r5
	.word 0xae1c2fad  ! 1: XOR_I	xor 	%r16, 0x0fad, %r23
thr3_hw_intr_495:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_495), 16, 16)) -> intp(0, 0, 1)
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xad342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r22
thr3_nuke_intr_496:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_496), 16, 16)) -> intp(0, 2, 1)
	.word 0x9a3c2950  ! 1: XNOR_I	xnor 	%r16, 0x0950, %r13
thr3_resum_intr_497:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_497), 16, 16)) -> intp(0, 3, 1)
	.word 0xac440011  ! 1: ADDC_R	addc 	%r16, %r17, %r22
thr3_nuke_intr_498:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_498), 16, 16)) -> intp(1, 2, 1)
	.word 0xac042a21  ! 1: ADD_I	add 	%r16, 0x0a21, %r22
thr3_resum_intr_499:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_499), 16, 16)) -> intp(1, 3, 1)
	.word 0x903422c7  ! 1: ORN_I	orn 	%r16, 0x02c7, %r8
thr3_hw_intr_500:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_500), 16, 16)) -> intp(2, 0, 1)
	.word 0xb72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
thr3_hw_intr_501:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_501), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e942a7f  ! 1: ORcc_I	orcc 	%r16, 0x0a7f, %r15
thr3_hw_intr_502:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_502), 16, 16)) -> intp(1, 0, 1)
	.word 0x93343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x8f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
thr3_hw_intr_503:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_503), 16, 16)) -> intp(0, 0, 1)
	.word 0x888c296a  ! 1: ANDcc_I	andcc 	%r16, 0x096a, %r4
	.word 0x93641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x8a2c2d0f  ! 1: ANDN_I	andn 	%r16, 0x0d0f, %r5
	.word 0x857c0411  ! 1: MOVR_R	move	%r16, %r17, %r2
thr3_nuke_intr_504:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_504), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c9c276e  ! 1: XORcc_I	xorcc 	%r16, 0x076e, %r6
	.word 0x96442239  ! 1: ADDC_I	addc 	%r16, 0x0239, %r11
	.word 0x84340011  ! 1: ORN_R	orn 	%r16, %r17, %r2
	.word 0x972c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r11
thr3_resum_intr_505:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_505), 16, 16)) -> intp(1, 3, 1)
	.word 0x949c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0x9e040011  ! 1: ADD_R	add 	%r16, %r17, %r15
	.word 0x8f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x9cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r14
thr3_nuke_intr_506:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_506), 16, 16)) -> intp(2, 2, 1)
	.word 0xb00c0011  ! 1: AND_R	and 	%r16, %r17, %r24
thr3_resum_intr_507:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_507), 16, 16)) -> intp(2, 3, 1)
	.word 0x912c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r8
thr3_hw_intr_508:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_508), 16, 16)) -> intp(2, 0, 1)
	.word 0x97643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x99643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x84bc26ee  ! 1: XNORcc_I	xnorcc 	%r16, 0x06ee, %r2
	.word 0x860c2db4  ! 1: AND_I	and 	%r16, 0x0db4, %r3
thr3_nuke_intr_509:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_509), 16, 16)) -> intp(2, 2, 1)
	.word 0x8b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r5
thr3_resum_intr_510:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_510), 16, 16)) -> intp(2, 3, 1)
	.word 0x9d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r14
thr3_hw_intr_511:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_511), 16, 16)) -> intp(1, 0, 1)
	.word 0x949426e1  ! 1: ORcc_I	orcc 	%r16, 0x06e1, %r10
	.word 0x8d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
thr3_hw_intr_512:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_512), 16, 16)) -> intp(0, 0, 1)
	.word 0x96bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0xb88c23db  ! 1: ANDcc_I	andcc 	%r16, 0x03db, %r28
	.word 0xb62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x87643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_513:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_513), 16, 16)) -> intp(2, 2, 1)
	.word 0xb52c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xb48c2814  ! 1: ANDcc_I	andcc 	%r16, 0x0814, %r26
	.word 0x88840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r4
thr3_resum_intr_514:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_514), 16, 16)) -> intp(2, 3, 1)
	.word 0xb4142aea  ! 1: OR_I	or 	%r16, 0x0aea, %r26
	.word 0x89341011  ! 1: SRLX_R	srlx	%r16, %r17, %r4
	.word 0xae442867  ! 1: ADDC_I	addc 	%r16, 0x0867, %r23
thr3_nuke_intr_515:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_515), 16, 16)) -> intp(0, 2, 1)
	.word 0xb77c2401  ! 1: MOVR_I	move	%r16, 0x867, %r27
	.word 0x937c2401  ! 1: MOVR_I	move	%r16, 0x867, %r9
	.word 0x8e442f3b  ! 1: ADDC_I	addc 	%r16, 0x0f3b, %r7
thr3_resum_intr_516:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_516), 16, 16)) -> intp(0, 3, 1)
	.word 0xb23c254e  ! 1: XNOR_I	xnor 	%r16, 0x054e, %r25
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
	.word 0xba2c2626  ! 1: ANDN_I	andn 	%r16, 0x0626, %r29
thr3_nuke_intr_517:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_517), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8040011  ! 1: ADD_R	add 	%r16, %r17, %r20
	.word 0x9b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r13
thr3_resum_intr_518:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_518), 16, 16)) -> intp(1, 3, 1)
	.word 0xac8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0x9b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r13
thr3_nuke_intr_519:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_519), 16, 16)) -> intp(1, 2, 1)
	.word 0xa73c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r19
thr3_resum_intr_520:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_520), 16, 16)) -> intp(1, 3, 1)
	.word 0x903c26ff  ! 1: XNOR_I	xnor 	%r16, 0x06ff, %r8
thr3_hw_intr_521:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_521), 16, 16)) -> intp(1, 0, 1)
	.word 0x9294259c  ! 1: ORcc_I	orcc 	%r16, 0x059c, %r9
thr3_nuke_intr_522:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_522), 16, 16)) -> intp(1, 2, 1)
	.word 0x84b424e2  ! 1: ORNcc_I	orncc 	%r16, 0x04e2, %r2
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
	.word 0xb2140011  ! 1: OR_R	or 	%r16, %r17, %r25
thr3_resum_intr_523:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_523), 16, 16)) -> intp(1, 3, 1)
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x9c9c2ace  ! 1: XORcc_I	xorcc 	%r16, 0x0ace, %r14
	.word 0xb49c2b4a  ! 1: XORcc_I	xorcc 	%r16, 0x0b4a, %r26
thr3_hw_intr_524:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_524), 16, 16)) -> intp(2, 0, 1)
	.word 0xb40c286c  ! 1: AND_I	and 	%r16, 0x086c, %r26
	.word 0x84342eb5  ! 1: ORN_I	orn 	%r16, 0x0eb5, %r2
	.word 0x8a8c2571  ! 1: ANDcc_I	andcc 	%r16, 0x0571, %r5
	.word 0x9ac423d5  ! 1: ADDCcc_I	addccc 	%r16, 0x03d5, %r13
thr3_hw_intr_525:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_525), 16, 16)) -> intp(1, 0, 1)
	.word 0x8a8c2360  ! 1: ANDcc_I	andcc 	%r16, 0x0360, %r5
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
thr3_nuke_intr_526:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_526), 16, 16)) -> intp(2, 2, 1)
	.word 0x8cbc288d  ! 1: XNORcc_I	xnorcc 	%r16, 0x088d, %r6
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
thr3_resum_intr_527:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_527), 16, 16)) -> intp(2, 3, 1)
	.word 0x8ebc2bfa  ! 1: XNORcc_I	xnorcc 	%r16, 0x0bfa, %r7
	.word 0x9f340011  ! 1: SRL_R	srl 	%r16, %r17, %r15
	.word 0xae1c229f  ! 1: XOR_I	xor 	%r16, 0x029f, %r23
thr3_nuke_intr_528:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_528), 16, 16)) -> intp(0, 2, 1)
	.word 0xab7c0411  ! 1: MOVR_R	move	%r16, %r17, %r21
	.word 0xb72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r27
thr3_resum_intr_529:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_529), 16, 16)) -> intp(0, 3, 1)
	.word 0xb02c2341  ! 1: ANDN_I	andn 	%r16, 0x0341, %r24
	.word 0xbb341011  ! 1: SRLX_R	srlx	%r16, %r17, %r29
thr3_nuke_intr_530:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_530), 16, 16)) -> intp(0, 2, 1)
	.word 0x96c429ef  ! 1: ADDCcc_I	addccc 	%r16, 0x09ef, %r11
thr3_resum_intr_531:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_531), 16, 16)) -> intp(0, 3, 1)
	.word 0x92840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r9
thr3_hw_intr_532:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_532), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c340011  ! 1: ORN_R	orn 	%r16, %r17, %r14
	.word 0x823c294c  ! 1: XNOR_I	xnor 	%r16, 0x094c, %r1
	.word 0xb44425bc  ! 1: ADDC_I	addc 	%r16, 0x05bc, %r26
thr3_hw_intr_533:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_533), 16, 16)) -> intp(2, 0, 1)
	.word 0xac9c2041  ! 1: XORcc_I	xorcc 	%r16, 0x0041, %r22
thr3_hw_intr_534:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_534), 16, 16)) -> intp(0, 0, 1)
	.word 0x821423f6  ! 1: OR_I	or 	%r16, 0x03f6, %r1
thr3_nuke_intr_535:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_535), 16, 16)) -> intp(2, 2, 1)
	.word 0xa72c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x8e342c4f  ! 1: ORN_I	orn 	%r16, 0x0c4f, %r7
thr3_resum_intr_536:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_536), 16, 16)) -> intp(2, 3, 1)
	.word 0xa72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0x903c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x9e4427c0  ! 1: ADDC_I	addc 	%r16, 0x07c0, %r15
	.word 0x8e3c2248  ! 1: XNOR_I	xnor 	%r16, 0x0248, %r7
thr3_nuke_intr_537:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_537), 16, 16)) -> intp(2, 2, 1)
	.word 0xb1341011  ! 1: SRLX_R	srlx	%r16, %r17, %r24
	.word 0xab3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r21
	.word 0x94b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r10
thr3_resum_intr_538:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_538), 16, 16)) -> intp(2, 3, 1)
	.word 0x922c2328  ! 1: ANDN_I	andn 	%r16, 0x0328, %r9
	.word 0x821c2e79  ! 1: XOR_I	xor 	%r16, 0x0e79, %r1
	.word 0xb8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r28
thr3_nuke_intr_539:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_539), 16, 16)) -> intp(1, 2, 1)
	.word 0x8e0c22ce  ! 1: AND_I	and 	%r16, 0x02ce, %r7
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x8c8c2fef  ! 1: ANDcc_I	andcc 	%r16, 0x0fef, %r6
	.word 0xbb341011  ! 1: SRLX_R	srlx	%r16, %r17, %r29
thr3_resum_intr_540:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_540), 16, 16)) -> intp(1, 3, 1)
	.word 0x942c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x98bc2f30  ! 1: XNORcc_I	xnorcc 	%r16, 0x0f30, %r12
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x8a8c22d3  ! 1: ANDcc_I	andcc 	%r16, 0x02d3, %r5
thr3_hw_intr_541:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_541), 16, 16)) -> intp(0, 0, 1)
	.word 0x8e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0xa92c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r20
	.word 0x86840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r3
thr3_nuke_intr_542:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_542), 16, 16)) -> intp(0, 2, 1)
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x864427c6  ! 1: ADDC_I	addc 	%r16, 0x07c6, %r3
	.word 0x9b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r13
	.word 0xac0c2f9a  ! 1: AND_I	and 	%r16, 0x0f9a, %r22
thr3_resum_intr_543:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_543), 16, 16)) -> intp(0, 3, 1)
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
	.word 0x92942316  ! 1: ORcc_I	orcc 	%r16, 0x0316, %r9
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
	.word 0x84ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r2
thr3_nuke_intr_544:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_544), 16, 16)) -> intp(2, 2, 1)
	.word 0x85341011  ! 1: SRLX_R	srlx	%r16, %r17, %r2
thr3_resum_intr_545:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_545), 16, 16)) -> intp(2, 3, 1)
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
thr3_hw_intr_546:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_546), 16, 16)) -> intp(2, 0, 1)
	.word 0xb69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0x9d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0xb2042386  ! 1: ADD_I	add 	%r16, 0x0386, %r25
thr3_nuke_intr_547:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_547), 16, 16)) -> intp(1, 2, 1)
	.word 0xb2b42294  ! 1: ORNcc_I	orncc 	%r16, 0x0294, %r25
	.word 0x8b7c2401  ! 1: MOVR_I	move	%r16, 0xfffffe94, %r5
thr3_resum_intr_548:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_548), 16, 16)) -> intp(1, 3, 1)
	.word 0xa684227c  ! 1: ADDcc_I	addcc 	%r16, 0x027c, %r19
	.word 0x84ac2745  ! 1: ANDNcc_I	andncc 	%r16, 0x0745, %r2
thr3_nuke_intr_549:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_549), 16, 16)) -> intp(1, 2, 1)
	.word 0x9634299b  ! 1: ORN_I	orn 	%r16, 0x099b, %r11
	.word 0x9c04286e  ! 1: ADD_I	add 	%r16, 0x086e, %r14
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
thr3_resum_intr_550:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_550), 16, 16)) -> intp(1, 3, 1)
	.word 0x8a942f92  ! 1: ORcc_I	orcc 	%r16, 0x0f92, %r5
	.word 0xb6bc2fb9  ! 1: XNORcc_I	xnorcc 	%r16, 0x0fb9, %r27
	.word 0x8b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r5
thr3_hw_intr_551:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_551), 16, 16)) -> intp(0, 0, 1)
	.word 0xa7340011  ! 1: SRL_R	srl 	%r16, %r17, %r19
	.word 0x842c24a7  ! 1: ANDN_I	andn 	%r16, 0x04a7, %r2
	.word 0xb8142062  ! 1: OR_I	or 	%r16, 0x0062, %r28
	.word 0x8cc428cf  ! 1: ADDCcc_I	addccc 	%r16, 0x08cf, %r6
thr3_nuke_intr_552:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_552), 16, 16)) -> intp(2, 2, 1)
	.word 0x85343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r2
thr3_resum_intr_553:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_553), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c442ed5  ! 1: ADDC_I	addc 	%r16, 0x0ed5, %r6
thr3_nuke_intr_554:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_554), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a040011  ! 1: ADD_R	add 	%r16, %r17, %r5
	.word 0xb00c0011  ! 1: AND_R	and 	%r16, %r17, %r24
thr3_resum_intr_555:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_555), 16, 16)) -> intp(0, 3, 1)
	.word 0xb41c24a8  ! 1: XOR_I	xor 	%r16, 0x04a8, %r26
	.word 0x85341011  ! 1: SRLX_R	srlx	%r16, %r17, %r2
thr3_nuke_intr_556:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_556), 16, 16)) -> intp(1, 2, 1)
	.word 0xad3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r22
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
thr3_resum_intr_557:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_557), 16, 16)) -> intp(1, 3, 1)
	.word 0x924422be  ! 1: ADDC_I	addc 	%r16, 0x02be, %r9
	.word 0x8a3421a0  ! 1: ORN_I	orn 	%r16, 0x01a0, %r5
thr3_nuke_intr_558:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_558), 16, 16)) -> intp(2, 2, 1)
	.word 0x853c0011  ! 1: SRA_R	sra 	%r16, %r17, %r2
	.word 0x912c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x9b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r13
thr3_resum_intr_559:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_559), 16, 16)) -> intp(2, 3, 1)
	.word 0x872c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r3
	.word 0xb81c218f  ! 1: XOR_I	xor 	%r16, 0x018f, %r28
	.word 0xb37c0411  ! 1: MOVR_R	move	%r16, %r17, %r25
thr3_nuke_intr_560:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_560), 16, 16)) -> intp(0, 2, 1)
	.word 0x9d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r14
	.word 0xb92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r28
thr3_resum_intr_561:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_561), 16, 16)) -> intp(0, 3, 1)
	.word 0xae3c2ee8  ! 1: XNOR_I	xnor 	%r16, 0x0ee8, %r23
	.word 0x8eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r7
thr3_nuke_intr_562:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_562), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c1c2497  ! 1: XOR_I	xor 	%r16, 0x0497, %r6
thr3_resum_intr_563:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_563), 16, 16)) -> intp(1, 3, 1)
	.word 0xba84210b  ! 1: ADDcc_I	addcc 	%r16, 0x010b, %r29
thr3_nuke_intr_564:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_564), 16, 16)) -> intp(2, 2, 1)
	.word 0x95641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x863c25b1  ! 1: XNOR_I	xnor 	%r16, 0x05b1, %r3
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
	.word 0xac440011  ! 1: ADDC_R	addc 	%r16, %r17, %r22
thr3_resum_intr_565:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_565), 16, 16)) -> intp(2, 3, 1)
	.word 0x85643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9c042e20  ! 1: ADD_I	add 	%r16, 0x0e20, %r14
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xa7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r19
thr3_hw_intr_566:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_566), 16, 16)) -> intp(1, 0, 1)
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0xb034215f  ! 1: ORN_I	orn 	%r16, 0x015f, %r24
	.word 0x8d340011  ! 1: SRL_R	srl 	%r16, %r17, %r6
thr3_nuke_intr_567:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_567), 16, 16)) -> intp(1, 2, 1)
	.word 0x9c842f98  ! 1: ADDcc_I	addcc 	%r16, 0x0f98, %r14
thr3_resum_intr_568:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_568), 16, 16)) -> intp(1, 3, 1)
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
thr3_nuke_intr_569:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_569), 16, 16)) -> intp(2, 2, 1)
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x828c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r1
thr3_resum_intr_570:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_570), 16, 16)) -> intp(2, 3, 1)
	.word 0x989c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x9aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r13
thr3_nuke_intr_571:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_571), 16, 16)) -> intp(2, 2, 1)
	.word 0xb8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r28
thr3_resum_intr_572:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_572), 16, 16)) -> intp(2, 3, 1)
	.word 0x940421fc  ! 1: ADD_I	add 	%r16, 0x01fc, %r10
thr3_hw_intr_573:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_573), 16, 16)) -> intp(2, 0, 1)
	.word 0x85340011  ! 1: SRL_R	srl 	%r16, %r17, %r2
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x85641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_574:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_574), 16, 16)) -> intp(2, 0, 1)
	.word 0xaf341011  ! 1: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xa77c0411  ! 1: MOVR_R	move	%r16, %r17, %r19
	.word 0x8d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r6
	.word 0x92ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r9
thr3_nuke_intr_575:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_575), 16, 16)) -> intp(0, 2, 1)
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0xb28c2b93  ! 1: ANDcc_I	andcc 	%r16, 0x0b93, %r25
	.word 0x8c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r6
thr3_resum_intr_576:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_576), 16, 16)) -> intp(0, 3, 1)
	.word 0xad2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r22
	.word 0x94c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
thr3_hw_intr_577:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_577), 16, 16)) -> intp(0, 0, 1)
	.word 0x94c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
thr3_nuke_intr_578:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_578), 16, 16)) -> intp(1, 2, 1)
	.word 0x9ab42252  ! 1: ORNcc_I	orncc 	%r16, 0x0252, %r13
	.word 0x9e2c22f6  ! 1: ANDN_I	andn 	%r16, 0x02f6, %r15
	.word 0x82ac2cd3  ! 1: ANDNcc_I	andncc 	%r16, 0x0cd3, %r1
	.word 0xad3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r22
thr3_resum_intr_579:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_579), 16, 16)) -> intp(1, 3, 1)
	.word 0x96b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0xb62c2535  ! 1: ANDN_I	andn 	%r16, 0x0535, %r27
	.word 0x983c2ba4  ! 1: XNOR_I	xnor 	%r16, 0x0ba4, %r12
	.word 0x9b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r13
thr3_nuke_intr_580:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_580), 16, 16)) -> intp(2, 2, 1)
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x8b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0x90ac2b7f  ! 1: ANDNcc_I	andncc 	%r16, 0x0b7f, %r8
thr3_resum_intr_581:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_581), 16, 16)) -> intp(2, 3, 1)
	.word 0xb48c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0xb23c2f27  ! 1: XNOR_I	xnor 	%r16, 0x0f27, %r25
	.word 0xb5341011  ! 1: SRLX_R	srlx	%r16, %r17, %r26
	.word 0xb68c26fc  ! 1: ANDcc_I	andcc 	%r16, 0x06fc, %r27
thr3_nuke_intr_582:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_582), 16, 16)) -> intp(1, 2, 1)
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
	.word 0x83643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xacb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r22
thr3_resum_intr_583:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_583), 16, 16)) -> intp(1, 3, 1)
	.word 0x9d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x9c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
thr3_nuke_intr_584:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_584), 16, 16)) -> intp(2, 2, 1)
	.word 0x98bc2ad1  ! 1: XNORcc_I	xnorcc 	%r16, 0x0ad1, %r12
thr3_resum_intr_585:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_585), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e340011  ! 1: ORN_R	orn 	%r16, %r17, %r15
thr3_hw_intr_586:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_586), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa8842ae9  ! 1: ADDcc_I	addcc 	%r16, 0x0ae9, %r20
thr3_hw_intr_587:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_587), 16, 16)) -> intp(1, 0, 1)
	.word 0xb8b42f63  ! 1: ORNcc_I	orncc 	%r16, 0x0f63, %r28
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0xb7340011  ! 1: SRL_R	srl 	%r16, %r17, %r27
	.word 0xaf7c0411  ! 1: MOVR_R	move	%r16, %r17, %r23
thr3_hw_intr_588:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_588), 16, 16)) -> intp(0, 0, 1)
	.word 0x880c210c  ! 1: AND_I	and 	%r16, 0x010c, %r4
	.word 0x89643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x92bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
thr3_nuke_intr_589:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_589), 16, 16)) -> intp(0, 2, 1)
	.word 0x94942b6a  ! 1: ORcc_I	orcc 	%r16, 0x0b6a, %r10
thr3_resum_intr_590:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_590), 16, 16)) -> intp(0, 3, 1)
	.word 0xba2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r29
thr3_hw_intr_591:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_591), 16, 16)) -> intp(1, 0, 1)
	.word 0x869c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0xb5342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0x962c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r11
thr3_nuke_intr_592:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_592), 16, 16)) -> intp(1, 2, 1)
	.word 0x8ebc234c  ! 1: XNORcc_I	xnorcc 	%r16, 0x034c, %r7
thr3_resum_intr_593:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_593), 16, 16)) -> intp(1, 3, 1)
	.word 0xb02c2093  ! 1: ANDN_I	andn 	%r16, 0x0093, %r24
thr3_nuke_intr_594:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_594), 16, 16)) -> intp(2, 2, 1)
	.word 0xa72c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0x848c26da  ! 1: ANDcc_I	andcc 	%r16, 0x06da, %r2
	.word 0x8a142e18  ! 1: OR_I	or 	%r16, 0x0e18, %r5
thr3_resum_intr_595:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_595), 16, 16)) -> intp(2, 3, 1)
	.word 0x8f340011  ! 1: SRL_R	srl 	%r16, %r17, %r7
	.word 0xa8940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r20
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
thr3_nuke_intr_596:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_596), 16, 16)) -> intp(2, 2, 1)
	.word 0x9e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r15
thr3_resum_intr_597:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_597), 16, 16)) -> intp(2, 3, 1)
	.word 0xa61c2084  ! 1: XOR_I	xor 	%r16, 0x0084, %r19
thr3_nuke_intr_598:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_598), 16, 16)) -> intp(2, 2, 1)
	.word 0x897c2401  ! 1: MOVR_I	move	%r16, 0x84, %r4
	.word 0x90142722  ! 1: OR_I	or 	%r16, 0x0722, %r8
	.word 0xb8042b2c  ! 1: ADD_I	add 	%r16, 0x0b2c, %r28
	.word 0xa81c257e  ! 1: XOR_I	xor 	%r16, 0x057e, %r20
thr3_resum_intr_599:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_599), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0xba940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x8cc42fe1  ! 1: ADDCcc_I	addccc 	%r16, 0x0fe1, %r6
	.word 0x880c2bec  ! 1: AND_I	and 	%r16, 0x0bec, %r4
thr3_hw_intr_600:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_600), 16, 16)) -> intp(1, 0, 1)
	.word 0xb29c258b  ! 1: XORcc_I	xorcc 	%r16, 0x058b, %r25
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
	.word 0xb2c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0xba1c23cb  ! 1: XOR_I	xor 	%r16, 0x03cb, %r29
thr3_hw_intr_601:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_601), 16, 16)) -> intp(1, 0, 1)
	.word 0x87341011  ! 1: SRLX_R	srlx	%r16, %r17, %r3
thr3_nuke_intr_602:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_602), 16, 16)) -> intp(1, 2, 1)
	.word 0x86ac2635  ! 1: ANDNcc_I	andncc 	%r16, 0x0635, %r3
	.word 0x902c2007  ! 1: ANDN_I	andn 	%r16, 0x0007, %r8
	.word 0x98040011  ! 1: ADD_R	add 	%r16, %r17, %r12
	.word 0x84ac219e  ! 1: ANDNcc_I	andncc 	%r16, 0x019e, %r2
thr3_resum_intr_603:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_603), 16, 16)) -> intp(1, 3, 1)
	.word 0x9b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
thr3_nuke_intr_604:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_604), 16, 16)) -> intp(0, 2, 1)
	.word 0x9ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x8a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r5
thr3_resum_intr_605:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_605), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6340011  ! 1: ORN_R	orn 	%r16, %r17, %r27
	.word 0x90442073  ! 1: ADDC_I	addc 	%r16, 0x0073, %r8
thr3_hw_intr_606:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_606), 16, 16)) -> intp(1, 0, 1)
	.word 0x98bc225d  ! 1: XNORcc_I	xnorcc 	%r16, 0x025d, %r12
	.word 0xb60c27a8  ! 1: AND_I	and 	%r16, 0x07a8, %r27
	.word 0x929420af  ! 1: ORcc_I	orcc 	%r16, 0x00af, %r9
thr3_nuke_intr_607:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_607), 16, 16)) -> intp(0, 2, 1)
	.word 0x9e340011  ! 1: ORN_R	orn 	%r16, %r17, %r15
thr3_resum_intr_608:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_608), 16, 16)) -> intp(0, 3, 1)
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
thr3_nuke_intr_609:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_609), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x872c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x90040011  ! 1: ADD_R	add 	%r16, %r17, %r8
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
thr3_resum_intr_610:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_610), 16, 16)) -> intp(0, 3, 1)
	.word 0x94840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0xba2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r29
	.word 0x8a942b11  ! 1: ORcc_I	orcc 	%r16, 0x0b11, %r5
	.word 0x8cac2e48  ! 1: ANDNcc_I	andncc 	%r16, 0x0e48, %r6
thr3_hw_intr_611:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_611), 16, 16)) -> intp(0, 0, 1)
	.word 0x889c2aa1  ! 1: XORcc_I	xorcc 	%r16, 0x0aa1, %r4
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
thr3_hw_intr_612:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_612), 16, 16)) -> intp(0, 0, 1)
	.word 0xa6042780  ! 1: ADD_I	add 	%r16, 0x0780, %r19
	.word 0x8e94250d  ! 1: ORcc_I	orcc 	%r16, 0x050d, %r7
thr3_hw_intr_613:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_613), 16, 16)) -> intp(2, 0, 1)
	.word 0x972c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0xad3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r22
	.word 0xb3343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xb93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r28
thr3_hw_intr_614:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_614), 16, 16)) -> intp(2, 0, 1)
	.word 0x88340011  ! 1: ORN_R	orn 	%r16, %r17, %r4
	.word 0x99643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0x8a0c0011  ! 1: AND_R	and 	%r16, %r17, %r5
thr3_nuke_intr_615:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_615), 16, 16)) -> intp(2, 2, 1)
	.word 0x84bc2184  ! 1: XNORcc_I	xnorcc 	%r16, 0x0184, %r2
	.word 0x88142314  ! 1: OR_I	or 	%r16, 0x0314, %r4
	.word 0xa63c29cb  ! 1: XNOR_I	xnor 	%r16, 0x09cb, %r19
thr3_resum_intr_616:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_616), 16, 16)) -> intp(2, 3, 1)
	.word 0x9cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x877c2401  ! 1: MOVR_I	move	%r16, 0x11, %r3
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
thr3_hw_intr_617:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_617), 16, 16)) -> intp(2, 0, 1)
	.word 0x9b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
thr3_nuke_intr_618:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_618), 16, 16)) -> intp(2, 2, 1)
	.word 0xb0140011  ! 1: OR_R	or 	%r16, %r17, %r24
	.word 0x88140011  ! 1: OR_R	or 	%r16, %r17, %r4
	.word 0xaf3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r23
	.word 0xa8142e84  ! 1: OR_I	or 	%r16, 0x0e84, %r20
thr3_resum_intr_619:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_619), 16, 16)) -> intp(2, 3, 1)
	.word 0xa9641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x8e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0xb20c0011  ! 1: AND_R	and 	%r16, %r17, %r25
	.word 0xb09c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r24
thr3_nuke_intr_620:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_620), 16, 16)) -> intp(0, 2, 1)
	.word 0x8cc429a2  ! 1: ADDCcc_I	addccc 	%r16, 0x09a2, %r6
	.word 0xb61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r27
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
thr3_resum_intr_621:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_621), 16, 16)) -> intp(0, 3, 1)
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
	.word 0xac3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r22
thr3_nuke_intr_622:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_622), 16, 16)) -> intp(0, 2, 1)
	.word 0xac440011  ! 1: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x92bc274b  ! 1: XNORcc_I	xnorcc 	%r16, 0x074b, %r9
thr3_resum_intr_623:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_623), 16, 16)) -> intp(0, 3, 1)
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0x8b643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_624:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_624), 16, 16)) -> intp(1, 2, 1)
	.word 0x9c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r14
	.word 0xa92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r20
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xb44429e4  ! 1: ADDC_I	addc 	%r16, 0x09e4, %r26
thr3_resum_intr_625:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_625), 16, 16)) -> intp(1, 3, 1)
	.word 0xb57c0411  ! 1: MOVR_R	move	%r16, %r17, %r26
	.word 0xa97c2401  ! 1: MOVR_I	move	%r16, 0x9e4, %r20
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
	.word 0xb12c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r24
thr3_hw_intr_626:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_626), 16, 16)) -> intp(0, 0, 1)
	.word 0xa6340011  ! 1: ORN_R	orn 	%r16, %r17, %r19
thr3_hw_intr_627:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_627), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e34243b  ! 1: ORN_I	orn 	%r16, 0x043b, %r7
thr3_nuke_intr_628:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_628), 16, 16)) -> intp(0, 2, 1)
	.word 0xbaac285d  ! 1: ANDNcc_I	andncc 	%r16, 0x085d, %r29
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0xb8ac2009  ! 1: ANDNcc_I	andncc 	%r16, 0x0009, %r28
thr3_resum_intr_629:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_629), 16, 16)) -> intp(0, 3, 1)
	.word 0x8c142a80  ! 1: OR_I	or 	%r16, 0x0a80, %r6
	.word 0x8eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0x982c272a  ! 1: ANDN_I	andn 	%r16, 0x072a, %r12
thr3_nuke_intr_630:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_630), 16, 16)) -> intp(2, 2, 1)
	.word 0x942c2316  ! 1: ANDN_I	andn 	%r16, 0x0316, %r10
	.word 0x8c8c2eef  ! 1: ANDcc_I	andcc 	%r16, 0x0eef, %r6
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
thr3_resum_intr_631:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_631), 16, 16)) -> intp(2, 3, 1)
	.word 0x8cac2a6e  ! 1: ANDNcc_I	andncc 	%r16, 0x0a6e, %r6
	.word 0x8d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
thr3_hw_intr_632:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_632), 16, 16)) -> intp(2, 0, 1)
	.word 0x821c2885  ! 1: XOR_I	xor 	%r16, 0x0885, %r1
	.word 0xbb342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
thr3_hw_intr_633:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_633), 16, 16)) -> intp(0, 0, 1)
	.word 0x94b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0x8e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0xb60c0011  ! 1: AND_R	and 	%r16, %r17, %r27
	.word 0x98ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r12
thr3_hw_intr_634:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_634), 16, 16)) -> intp(1, 0, 1)
	.word 0xad3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r22
	.word 0xaa2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r21
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x937c2401  ! 1: MOVR_I	move	%r16, 0x1, %r9
thr3_hw_intr_635:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_635), 16, 16)) -> intp(1, 0, 1)
	.word 0xa93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x909c272f  ! 1: XORcc_I	xorcc 	%r16, 0x072f, %r8
thr3_hw_intr_636:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_636), 16, 16)) -> intp(0, 0, 1)
	.word 0xb3641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x872c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r3
thr3_hw_intr_637:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_637), 16, 16)) -> intp(1, 0, 1)
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
	.word 0x9834275d  ! 1: ORN_I	orn 	%r16, 0x075d, %r12
thr3_hw_intr_638:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_638), 16, 16)) -> intp(2, 0, 1)
	.word 0x863c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0x943c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x9b641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_639:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_639), 16, 16)) -> intp(2, 0, 1)
	.word 0xac3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r22
thr3_hw_intr_640:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_640), 16, 16)) -> intp(0, 0, 1)
	.word 0x86940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x9c8c2835  ! 1: ANDcc_I	andcc 	%r16, 0x0835, %r14
	.word 0xb83c20c7  ! 1: XNOR_I	xnor 	%r16, 0x00c7, %r28
thr3_nuke_intr_641:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_641), 16, 16)) -> intp(1, 2, 1)
	.word 0x88bc2cb9  ! 1: XNORcc_I	xnorcc 	%r16, 0x0cb9, %r4
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
	.word 0x98042ccf  ! 1: ADD_I	add 	%r16, 0x0ccf, %r12
thr3_resum_intr_642:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_642), 16, 16)) -> intp(1, 3, 1)
	.word 0xae440011  ! 1: ADDC_R	addc 	%r16, %r17, %r23
	.word 0x822c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
thr3_hw_intr_643:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_643), 16, 16)) -> intp(1, 0, 1)
	.word 0x89343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x922c22ac  ! 1: ANDN_I	andn 	%r16, 0x02ac, %r9
	.word 0x943c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0xb08c25f2  ! 1: ANDcc_I	andcc 	%r16, 0x05f2, %r24
thr3_nuke_intr_644:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_644), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r29
	.word 0xab2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r21
thr3_resum_intr_645:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_645), 16, 16)) -> intp(0, 3, 1)
	.word 0x90ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0xa9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r20
thr3_nuke_intr_646:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_646), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf340011  ! 1: SRL_R	srl 	%r16, %r17, %r23
	.word 0x9e2c2328  ! 1: ANDN_I	andn 	%r16, 0x0328, %r15
	.word 0xa92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r20
thr3_resum_intr_647:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_647), 16, 16)) -> intp(0, 3, 1)
	.word 0x96bc2362  ! 1: XNORcc_I	xnorcc 	%r16, 0x0362, %r11
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
thr3_nuke_intr_648:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_648), 16, 16)) -> intp(0, 2, 1)
	.word 0xa97c2401  ! 1: MOVR_I	move	%r16, 0x11, %r20
	.word 0x988c2ae1  ! 1: ANDcc_I	andcc 	%r16, 0x0ae1, %r12
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
thr3_resum_intr_649:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_649), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r7
	.word 0x963c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0xb32c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r25
thr3_nuke_intr_650:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_650), 16, 16)) -> intp(0, 2, 1)
	.word 0x84840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x897c0411  ! 1: MOVR_R	move	%r16, %r17, %r4
thr3_resum_intr_651:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_651), 16, 16)) -> intp(0, 3, 1)
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
thr3_nuke_intr_652:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_652), 16, 16)) -> intp(1, 2, 1)
	.word 0x9eb4260b  ! 1: ORNcc_I	orncc 	%r16, 0x060b, %r15
thr3_resum_intr_653:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_653), 16, 16)) -> intp(1, 3, 1)
	.word 0xa8c426b0  ! 1: ADDCcc_I	addccc 	%r16, 0x06b0, %r20
thr3_nuke_intr_654:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_654), 16, 16)) -> intp(2, 2, 1)
	.word 0xb6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x82c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r1
thr3_resum_intr_655:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_655), 16, 16)) -> intp(2, 3, 1)
	.word 0x96440011  ! 1: ADDC_R	addc 	%r16, %r17, %r11
	.word 0xae840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r23
thr3_hw_intr_656:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_656), 16, 16)) -> intp(2, 0, 1)
	.word 0x96c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r11
thr3_nuke_intr_657:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_657), 16, 16)) -> intp(0, 2, 1)
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x8d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
thr3_resum_intr_658:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_658), 16, 16)) -> intp(0, 3, 1)
	.word 0x9c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x94b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r10
thr3_hw_intr_659:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_659), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa9c2565  ! 1: XORcc_I	xorcc 	%r16, 0x0565, %r21
	.word 0x88b420ac  ! 1: ORNcc_I	orncc 	%r16, 0x00ac, %r4
thr3_hw_intr_660:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_660), 16, 16)) -> intp(1, 0, 1)
	.word 0x881c2ff7  ! 1: XOR_I	xor 	%r16, 0x0ff7, %r4
	.word 0xb63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r27
thr3_nuke_intr_661:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_661), 16, 16)) -> intp(1, 2, 1)
	.word 0x95342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r10
thr3_resum_intr_662:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_662), 16, 16)) -> intp(1, 3, 1)
	.word 0x99341011  ! 1: SRLX_R	srlx	%r16, %r17, %r12
thr3_nuke_intr_663:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_663), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r26
thr3_resum_intr_664:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_664), 16, 16)) -> intp(0, 3, 1)
	.word 0x997c0411  ! 1: MOVR_R	move	%r16, %r17, %r12
thr3_nuke_intr_665:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_665), 16, 16)) -> intp(1, 2, 1)
	.word 0x9cb428e3  ! 1: ORNcc_I	orncc 	%r16, 0x08e3, %r14
	.word 0xba9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r29
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
thr3_resum_intr_666:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_666), 16, 16)) -> intp(1, 3, 1)
	.word 0x85643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
thr3_hw_intr_667:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_667), 16, 16)) -> intp(0, 0, 1)
	.word 0x900c0011  ! 1: AND_R	and 	%r16, %r17, %r8
thr3_hw_intr_668:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_668), 16, 16)) -> intp(0, 0, 1)
	.word 0x86ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r3
thr3_hw_intr_669:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_669), 16, 16)) -> intp(2, 0, 1)
	.word 0xad7c0411  ! 1: MOVR_R	move	%r16, %r17, %r22
	.word 0xb48c27b4  ! 1: ANDcc_I	andcc 	%r16, 0x07b4, %r26
thr3_nuke_intr_670:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_670), 16, 16)) -> intp(0, 2, 1)
	.word 0x869c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0xa6140011  ! 1: OR_R	or 	%r16, %r17, %r19
	.word 0x880c203b  ! 1: AND_I	and 	%r16, 0x003b, %r4
thr3_resum_intr_671:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_671), 16, 16)) -> intp(0, 3, 1)
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
	.word 0xb2040011  ! 1: ADD_R	add 	%r16, %r17, %r25
	.word 0x82440011  ! 1: ADDC_R	addc 	%r16, %r17, %r1
thr3_hw_intr_672:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_672), 16, 16)) -> intp(0, 0, 1)
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_673:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_673), 16, 16)) -> intp(0, 0, 1)
	.word 0xba340011  ! 1: ORN_R	orn 	%r16, %r17, %r29
thr3_hw_intr_674:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_674), 16, 16)) -> intp(0, 0, 1)
	.word 0xae140011  ! 1: OR_R	or 	%r16, %r17, %r23
	.word 0x8c0c0011  ! 1: AND_R	and 	%r16, %r17, %r6
	.word 0x89340011  ! 1: SRL_R	srl 	%r16, %r17, %r4
thr3_hw_intr_675:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_675), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e942079  ! 1: ORcc_I	orcc 	%r16, 0x0079, %r7
	.word 0xac9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0xb82c20f8  ! 1: ANDN_I	andn 	%r16, 0x00f8, %r28
thr3_nuke_intr_676:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_676), 16, 16)) -> intp(0, 2, 1)
	.word 0x88440011  ! 1: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x9cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r14
thr3_resum_intr_677:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_677), 16, 16)) -> intp(0, 3, 1)
	.word 0x87643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x99643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_678:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_678), 16, 16)) -> intp(1, 0, 1)
	.word 0x988c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0xb92c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r28
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
thr3_hw_intr_679:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_679), 16, 16)) -> intp(2, 0, 1)
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
thr3_nuke_intr_680:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_680), 16, 16)) -> intp(2, 2, 1)
	.word 0x90940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0xba1423eb  ! 1: OR_I	or 	%r16, 0x03eb, %r29
thr3_resum_intr_681:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_681), 16, 16)) -> intp(2, 3, 1)
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x900c2f22  ! 1: AND_I	and 	%r16, 0x0f22, %r8
thr3_hw_intr_682:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_682), 16, 16)) -> intp(1, 0, 1)
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
	.word 0xbb7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r29
	.word 0x92140011  ! 1: OR_R	or 	%r16, %r17, %r9
thr3_hw_intr_683:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_683), 16, 16)) -> intp(0, 0, 1)
	.word 0x88ac2726  ! 1: ANDNcc_I	andncc 	%r16, 0x0726, %r4
thr3_nuke_intr_684:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_684), 16, 16)) -> intp(2, 2, 1)
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x909c20ba  ! 1: XORcc_I	xorcc 	%r16, 0x00ba, %r8
	.word 0x9f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r15
thr3_resum_intr_685:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_685), 16, 16)) -> intp(2, 3, 1)
	.word 0x94c42ccf  ! 1: ADDCcc_I	addccc 	%r16, 0x0ccf, %r10
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
	.word 0x9eac2ad9  ! 1: ANDNcc_I	andncc 	%r16, 0x0ad9, %r15
thr3_hw_intr_686:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_686), 16, 16)) -> intp(2, 0, 1)
	.word 0xb0940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r24
thr3_hw_intr_687:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_687), 16, 16)) -> intp(0, 0, 1)
	.word 0x8d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r6
	.word 0x932c0011  ! 1: SLL_R	sll 	%r16, %r17, %r9
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
thr3_nuke_intr_688:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_688), 16, 16)) -> intp(0, 2, 1)
	.word 0x997c0411  ! 1: MOVR_R	move	%r16, %r17, %r12
thr3_resum_intr_689:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_689), 16, 16)) -> intp(0, 3, 1)
	.word 0x841c0011  ! 1: XOR_R	xor 	%r16, %r17, %r2
thr3_hw_intr_690:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_690), 16, 16)) -> intp(2, 0, 1)
	.word 0xa77c0411  ! 1: MOVR_R	move	%r16, %r17, %r19
	.word 0x9834284d  ! 1: ORN_I	orn 	%r16, 0x084d, %r12
thr3_nuke_intr_691:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_691), 16, 16)) -> intp(1, 2, 1)
	.word 0xba1c2ecb  ! 1: XOR_I	xor 	%r16, 0x0ecb, %r29
	.word 0xba0c2da4  ! 1: AND_I	and 	%r16, 0x0da4, %r29
	.word 0x84340011  ! 1: ORN_R	orn 	%r16, %r17, %r2
	.word 0xb2942fe2  ! 1: ORcc_I	orcc 	%r16, 0x0fe2, %r25
thr3_resum_intr_692:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_692), 16, 16)) -> intp(1, 3, 1)
	.word 0xa8940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r20
	.word 0xac3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0xb32c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0xa93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r20
thr3_nuke_intr_693:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_693), 16, 16)) -> intp(0, 2, 1)
	.word 0xad2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r22
	.word 0x888427d3  ! 1: ADDcc_I	addcc 	%r16, 0x07d3, %r4
	.word 0x9b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x9e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r15
thr3_resum_intr_694:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_694), 16, 16)) -> intp(0, 3, 1)
	.word 0x93340011  ! 1: SRL_R	srl 	%r16, %r17, %r9
	.word 0xb73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r27
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x9b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r13
thr3_nuke_intr_695:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_695), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a0c229d  ! 1: AND_I	and 	%r16, 0x029d, %r5
	.word 0xb0840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0x953c0011  ! 1: SRA_R	sra 	%r16, %r17, %r10
thr3_resum_intr_696:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_696), 16, 16)) -> intp(0, 3, 1)
	.word 0x9b7c0411  ! 1: MOVR_R	move	%r16, %r17, %r13
	.word 0xa88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
thr3_hw_intr_697:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_697), 16, 16)) -> intp(0, 0, 1)
	.word 0x86ac203b  ! 1: ANDNcc_I	andncc 	%r16, 0x003b, %r3
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0xa69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0xb80c0011  ! 1: AND_R	and 	%r16, %r17, %r28
thr3_hw_intr_698:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_698), 16, 16)) -> intp(1, 0, 1)
	.word 0x9cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x9e342cc7  ! 1: ORN_I	orn 	%r16, 0x0cc7, %r15
thr3_nuke_intr_699:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_699), 16, 16)) -> intp(2, 2, 1)
	.word 0x9d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0x988428ea  ! 1: ADDcc_I	addcc 	%r16, 0x08ea, %r12
	.word 0xaf3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r23
thr3_resum_intr_700:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_700), 16, 16)) -> intp(2, 3, 1)
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x89341011  ! 1: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x9234262a  ! 1: ORN_I	orn 	%r16, 0x062a, %r9
thr3_hw_intr_701:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_701), 16, 16)) -> intp(0, 0, 1)
	.word 0xa8ac2ba8  ! 1: ANDNcc_I	andncc 	%r16, 0x0ba8, %r20
thr3_hw_intr_702:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_702), 16, 16)) -> intp(1, 0, 1)
	.word 0xa9641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
	.word 0xac440011  ! 1: ADDC_R	addc 	%r16, %r17, %r22
thr3_hw_intr_703:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_703), 16, 16)) -> intp(0, 0, 1)
	.word 0xba042bd1  ! 1: ADD_I	add 	%r16, 0x0bd1, %r29
thr3_hw_intr_704:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_704), 16, 16)) -> intp(2, 0, 1)
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
	.word 0x942c278e  ! 1: ANDN_I	andn 	%r16, 0x078e, %r10
	.word 0x821c2ba8  ! 1: XOR_I	xor 	%r16, 0x0ba8, %r1
thr3_hw_intr_705:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_705), 16, 16)) -> intp(1, 0, 1)
	.word 0xae9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x940c2dba  ! 1: AND_I	and 	%r16, 0x0dba, %r10
	.word 0xac340011  ! 1: ORN_R	orn 	%r16, %r17, %r22
thr3_hw_intr_706:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_706), 16, 16)) -> intp(0, 0, 1)
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
thr3_nuke_intr_707:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_707), 16, 16)) -> intp(2, 2, 1)
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x87342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0xa8340011  ! 1: ORN_R	orn 	%r16, %r17, %r20
thr3_resum_intr_708:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_708), 16, 16)) -> intp(2, 3, 1)
	.word 0x8d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r6
	.word 0xb80429fb  ! 1: ADD_I	add 	%r16, 0x09fb, %r28
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0xb42c28ef  ! 1: ANDN_I	andn 	%r16, 0x08ef, %r26
thr3_hw_intr_709:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_709), 16, 16)) -> intp(1, 0, 1)
	.word 0x86940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x9b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r13
thr3_hw_intr_710:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_710), 16, 16)) -> intp(2, 0, 1)
	.word 0xa61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r19
	.word 0x957c0411  ! 1: MOVR_R	move	%r16, %r17, %r10
	.word 0xae2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r23
	.word 0x8b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r5
thr3_nuke_intr_711:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_711), 16, 16)) -> intp(2, 2, 1)
	.word 0x90bc2af3  ! 1: XNORcc_I	xnorcc 	%r16, 0x0af3, %r8
	.word 0x92c4263b  ! 1: ADDCcc_I	addccc 	%r16, 0x063b, %r9
thr3_resum_intr_712:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_712), 16, 16)) -> intp(2, 3, 1)
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
thr3_hw_intr_713:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_713), 16, 16)) -> intp(1, 0, 1)
	.word 0xb80c0011  ! 1: AND_R	and 	%r16, %r17, %r28
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x832c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0x92040011  ! 1: ADD_R	add 	%r16, %r17, %r9
thr3_hw_intr_714:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_714), 16, 16)) -> intp(0, 0, 1)
	.word 0x92840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0x984420a3  ! 1: ADDC_I	addc 	%r16, 0x00a3, %r12
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x989c2f61  ! 1: XORcc_I	xorcc 	%r16, 0x0f61, %r12
thr3_nuke_intr_715:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_715), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a1425a5  ! 1: OR_I	or 	%r16, 0x05a5, %r5
thr3_resum_intr_716:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_716), 16, 16)) -> intp(1, 3, 1)
	.word 0x83342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r1
thr3_nuke_intr_717:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_717), 16, 16)) -> intp(0, 2, 1)
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_718:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_718), 16, 16)) -> intp(0, 3, 1)
	.word 0x94042ab9  ! 1: ADD_I	add 	%r16, 0x0ab9, %r10
thr3_nuke_intr_719:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_719), 16, 16)) -> intp(0, 2, 1)
	.word 0x9c3c2dc9  ! 1: XNOR_I	xnor 	%r16, 0x0dc9, %r14
thr3_resum_intr_720:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_720), 16, 16)) -> intp(0, 3, 1)
	.word 0x903c213c  ! 1: XNOR_I	xnor 	%r16, 0x013c, %r8
thr3_nuke_intr_721:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_721), 16, 16)) -> intp(2, 2, 1)
	.word 0x9b641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_722:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_722), 16, 16)) -> intp(2, 3, 1)
	.word 0x9ebc2d11  ! 1: XNORcc_I	xnorcc 	%r16, 0x0d11, %r15
thr3_hw_intr_723:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_723), 16, 16)) -> intp(0, 0, 1)
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
thr3_nuke_intr_724:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_724), 16, 16)) -> intp(2, 2, 1)
	.word 0x8cb4223a  ! 1: ORNcc_I	orncc 	%r16, 0x023a, %r6
	.word 0x96bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0xb1340011  ! 1: SRL_R	srl 	%r16, %r17, %r24
	.word 0xaac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r21
thr3_resum_intr_725:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_725), 16, 16)) -> intp(2, 3, 1)
	.word 0xae3c22e3  ! 1: XNOR_I	xnor 	%r16, 0x02e3, %r23
	.word 0x963c2dfa  ! 1: XNOR_I	xnor 	%r16, 0x0dfa, %r11
	.word 0xba1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r29
	.word 0xb42c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r26
thr3_nuke_intr_726:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_726), 16, 16)) -> intp(1, 2, 1)
	.word 0xae94204c  ! 1: ORcc_I	orcc 	%r16, 0x004c, %r23
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
	.word 0xb4040011  ! 1: ADD_R	add 	%r16, %r17, %r26
thr3_resum_intr_727:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_727), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa1c25ef  ! 1: XOR_I	xor 	%r16, 0x05ef, %r21
	.word 0x96bc277d  ! 1: XNORcc_I	xnorcc 	%r16, 0x077d, %r11
	.word 0x932c0011  ! 1: SLL_R	sll 	%r16, %r17, %r9
thr3_nuke_intr_728:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_728), 16, 16)) -> intp(0, 2, 1)
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
	.word 0xb49c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r7
	.word 0xb9340011  ! 1: SRL_R	srl 	%r16, %r17, %r28
thr3_resum_intr_729:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_729), 16, 16)) -> intp(0, 3, 1)
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
	.word 0x9214268b  ! 1: OR_I	or 	%r16, 0x068b, %r9
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x8a042955  ! 1: ADD_I	add 	%r16, 0x0955, %r5
thr3_hw_intr_730:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_730), 16, 16)) -> intp(2, 0, 1)
	.word 0x8d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xaa1c250b  ! 1: XOR_I	xor 	%r16, 0x050b, %r21
	.word 0x96c42a85  ! 1: ADDCcc_I	addccc 	%r16, 0x0a85, %r11
thr3_hw_intr_731:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_731), 16, 16)) -> intp(1, 0, 1)
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
thr3_hw_intr_732:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_732), 16, 16)) -> intp(1, 0, 1)
	.word 0x823c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0xaa2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r21
thr3_hw_intr_733:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_733), 16, 16)) -> intp(2, 0, 1)
	.word 0x903c2fc5  ! 1: XNOR_I	xnor 	%r16, 0x0fc5, %r8
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
thr3_nuke_intr_734:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_734), 16, 16)) -> intp(0, 2, 1)
	.word 0xae9c2c99  ! 1: XORcc_I	xorcc 	%r16, 0x0c99, %r23
thr3_resum_intr_735:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_735), 16, 16)) -> intp(0, 3, 1)
	.word 0x962c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r11
thr3_nuke_intr_736:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_736), 16, 16)) -> intp(0, 2, 1)
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
thr3_resum_intr_737:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_737), 16, 16)) -> intp(0, 3, 1)
	.word 0x96040011  ! 1: ADD_R	add 	%r16, %r17, %r11
thr3_hw_intr_738:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_738), 16, 16)) -> intp(0, 0, 1)
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xb6340011  ! 1: ORN_R	orn 	%r16, %r17, %r27
	.word 0x869c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r3
thr3_nuke_intr_739:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_739), 16, 16)) -> intp(0, 2, 1)
	.word 0xaeac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0xb42c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r26
	.word 0x90142457  ! 1: OR_I	or 	%r16, 0x0457, %r8
thr3_resum_intr_740:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_740), 16, 16)) -> intp(0, 3, 1)
	.word 0x997c0411  ! 1: MOVR_R	move	%r16, %r17, %r12
	.word 0x8f340011  ! 1: SRL_R	srl 	%r16, %r17, %r7
	.word 0x90142768  ! 1: OR_I	or 	%r16, 0x0768, %r8
thr3_hw_intr_741:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_741), 16, 16)) -> intp(2, 0, 1)
	.word 0xb2ac2ec0  ! 1: ANDNcc_I	andncc 	%r16, 0x0ec0, %r25
	.word 0x881c0011  ! 1: XOR_R	xor 	%r16, %r17, %r4
thr3_hw_intr_742:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_742), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x9d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
	.word 0x9e340011  ! 1: ORN_R	orn 	%r16, %r17, %r15
thr3_nuke_intr_743:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_743), 16, 16)) -> intp(2, 2, 1)
	.word 0x841c0011  ! 1: XOR_R	xor 	%r16, %r17, %r2
	.word 0x9b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r13
	.word 0x92c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r9
thr3_resum_intr_744:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_744), 16, 16)) -> intp(2, 3, 1)
	.word 0x9f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0xbabc273d  ! 1: XNORcc_I	xnorcc 	%r16, 0x073d, %r29
	.word 0xb6042fed  ! 1: ADD_I	add 	%r16, 0x0fed, %r27
thr3_hw_intr_745:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_745), 16, 16)) -> intp(1, 0, 1)
	.word 0xa9641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xaac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r21
thr3_nuke_intr_746:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_746), 16, 16)) -> intp(0, 2, 1)
	.word 0x98b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r12
thr3_resum_intr_747:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_747), 16, 16)) -> intp(0, 3, 1)
	.word 0x928c2154  ! 1: ANDcc_I	andcc 	%r16, 0x0154, %r9
thr3_nuke_intr_748:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_748), 16, 16)) -> intp(1, 2, 1)
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
thr3_resum_intr_749:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_749), 16, 16)) -> intp(1, 3, 1)
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
thr3_hw_intr_750:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_750), 16, 16)) -> intp(2, 0, 1)
	.word 0x98040011  ! 1: ADD_R	add 	%r16, %r17, %r12
	.word 0xb61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r27
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
thr3_hw_intr_751:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_751), 16, 16)) -> intp(0, 0, 1)
	.word 0x920424ff  ! 1: ADD_I	add 	%r16, 0x04ff, %r9
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
thr3_nuke_intr_752:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_752), 16, 16)) -> intp(2, 2, 1)
	.word 0x89342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r4
thr3_resum_intr_753:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_753), 16, 16)) -> intp(2, 3, 1)
	.word 0xb3342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r25
thr3_nuke_intr_754:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_754), 16, 16)) -> intp(2, 2, 1)
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
	.word 0x903423a6  ! 1: ORN_I	orn 	%r16, 0x03a6, %r8
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
	.word 0x949c232e  ! 1: XORcc_I	xorcc 	%r16, 0x032e, %r10
thr3_resum_intr_755:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_755), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c0c0011  ! 1: AND_R	and 	%r16, %r17, %r6
	.word 0x8abc29e6  ! 1: XNORcc_I	xnorcc 	%r16, 0x09e6, %r5
	.word 0xba840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0x92c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r9
thr3_nuke_intr_756:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_756), 16, 16)) -> intp(1, 2, 1)
	.word 0xb5641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xb6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r27
thr3_resum_intr_757:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_757), 16, 16)) -> intp(1, 3, 1)
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x97641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x94bc2888  ! 1: XNORcc_I	xnorcc 	%r16, 0x0888, %r10
thr3_hw_intr_758:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_758), 16, 16)) -> intp(0, 0, 1)
	.word 0xb2342e53  ! 1: ORN_I	orn 	%r16, 0x0e53, %r25
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x9a942553  ! 1: ORcc_I	orcc 	%r16, 0x0553, %r13
	.word 0xad641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_759:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_759), 16, 16)) -> intp(1, 2, 1)
	.word 0x9ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x9e8c26e7  ! 1: ANDcc_I	andcc 	%r16, 0x06e7, %r15
	.word 0xae0c20b7  ! 1: AND_I	and 	%r16, 0x00b7, %r23
	.word 0xb28c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r25
thr3_resum_intr_760:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_760), 16, 16)) -> intp(1, 3, 1)
	.word 0x893c1011  ! 1: SRAX_R	srax	%r16, %r17, %r4
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
	.word 0x8c342a0e  ! 1: ORN_I	orn 	%r16, 0x0a0e, %r6
	.word 0xbb2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r29
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000a10, %g1, %r17
        setx  0xbfcf43e69126d3bd, %g1, %r0
        setx  0xbd71eaec70f0f293, %g1, %r1
        setx  0x18e602fedb0fe97b, %g1, %r2
        setx  0xbee183f329d5b6c5, %g1, %r3
        setx  0xa0b76813dd2d3f65, %g1, %r4
        setx  0x9c1d5b8c3a640c2c, %g1, %r5
        setx  0x27f7ed63a331dbda, %g1, %r6
        setx  0xed244da33420ccfc, %g1, %r7
        setx  0xdd95a2706093b8a6, %g1, %r8
        setx  0x7ebe818c7b2c0f73, %g1, %r9
        setx  0xc315ae0f6c77a2ad, %g1, %r10
        setx  0xa46e9fada8d155b8, %g1, %r11
        setx  0xf0fe5aa5b59f11dd, %g1, %r12
        setx  0xa88737650eedc0b6, %g1, %r13
        setx  0x509ff3ff4610a011, %g1, %r14
        setx  0x9136f582a8a83db9, %g1, %r15
        setx  0x67a51d045460a858, %g1, %r18
        setx  0xc8c1cf32089f1139, %g1, %r19
        setx  0xd9da1ca3b24aa04d, %g1, %r20
        setx  0x8353e0d83c3a8e6d, %g1, %r21
        setx  0x4046aea5d928de28, %g1, %r22
        setx  0x91f1b049388c1dc2, %g1, %r23
        setx  0x3e7a888a5dfc2b9f, %g1, %r24
        setx  0x4067c1d3b8b6735c, %g1, %r25
        setx  0x76101ee8beaa1b1f, %g1, %r26
        setx  0x6512d71fab9c428d, %g1, %r27
        setx  0x6989096bc4c3fde6, %g1, %r28
        setx  0xd0a95fc465f97f05, %g1, %r29
        setx  0x5900e3e9f2aba7ee, %g1, %r30
        setx  0x3439919bccf62e48, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000a40, %g1, %r17
        setx  0x64692c3cb29fa6ff, %g1, %r0
        setx  0x2e80dac79f009031, %g1, %r1
        setx  0x4567dc1a76633bc7, %g1, %r2
        setx  0x08859c28439d75e0, %g1, %r3
        setx  0xddba7b46661ebcf2, %g1, %r4
        setx  0x979573a077f534b7, %g1, %r5
        setx  0x3d73e75271401ea2, %g1, %r6
        setx  0x91bfeb8da9519bea, %g1, %r7
        setx  0x9a7aa311e359ccf7, %g1, %r8
        setx  0x9f23bd38fb0ceae8, %g1, %r9
        setx  0x9e3879ac50605bcf, %g1, %r10
        setx  0x544dffdfdbf5b848, %g1, %r11
        setx  0xb56796f6fbde8807, %g1, %r12
        setx  0x58ed9908df9bc0b8, %g1, %r13
        setx  0x826691e3ab0c64b0, %g1, %r14
        setx  0x3d7b36404528c223, %g1, %r15
        setx  0x3f16c45c594340e8, %g1, %r18
        setx  0x6994c203caf8a48f, %g1, %r19
        setx  0x3b1e80bae51b1728, %g1, %r20
        setx  0x897db157c04057da, %g1, %r21
        setx  0x8484d52beaf88c11, %g1, %r22
        setx  0xf07095214dbee331, %g1, %r23
        setx  0x2a0243dc08f75ca6, %g1, %r24
        setx  0x75e0304f377d44b6, %g1, %r25
        setx  0x1875441c77a4571d, %g1, %r26
        setx  0xa58722460300ca65, %g1, %r27
        setx  0x4f5a7a8ce5c50b56, %g1, %r28
        setx  0xd2a8c430434f3735, %g1, %r29
        setx  0x832b0192a542587e, %g1, %r30
        setx  0xd929be656b99d6ef, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000160, %g1, %r17
        setx  0x1be09ba43f8c0e66, %g1, %r0
        setx  0x46830ff21d826ac7, %g1, %r1
        setx  0xc6855eee39280afb, %g1, %r2
        setx  0xf21e5dd8023c342a, %g1, %r3
        setx  0xae21fc4b707feae2, %g1, %r4
        setx  0xaf1676bdd5e1b59d, %g1, %r5
        setx  0x7f775db591391152, %g1, %r6
        setx  0x6dca9b792956183e, %g1, %r7
        setx  0xe101a92ce64e8d0a, %g1, %r8
        setx  0x32ba8ad73518b5b9, %g1, %r9
        setx  0xf02a4a10a5f14067, %g1, %r10
        setx  0x8fba62b37cdcdce0, %g1, %r11
        setx  0x12c6ec50982bd4fa, %g1, %r12
        setx  0x04e5ce7e681388d2, %g1, %r13
        setx  0x94fcf277f49eaf74, %g1, %r14
        setx  0x047a15fa090aa721, %g1, %r15
        setx  0xb106a70bafbfb6a0, %g1, %r18
        setx  0xd29f7c7922ca2554, %g1, %r19
        setx  0xb46d72d912791892, %g1, %r20
        setx  0x384e582943b2bf6d, %g1, %r21
        setx  0x70667da555f586a6, %g1, %r22
        setx  0xdaeda293ebb3e742, %g1, %r23
        setx  0xa3b7cbde6aa24da6, %g1, %r24
        setx  0x8dee85514bb9cd63, %g1, %r25
        setx  0xec0f62f657da52e9, %g1, %r26
        setx  0xda0bef371d1b924a, %g1, %r27
        setx  0xfb75e715e6b9404e, %g1, %r28
        setx  0xcce20a3c463f3980, %g1, %r29
        setx  0xbb775bb0317f1ecb, %g1, %r30
        setx  0x76d6676c0555c67f, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000710, %g1, %r17
        setx  0x777cd380729af041, %g1, %r0
        setx  0x7601a01410752a5c, %g1, %r1
        setx  0xaaf775780cf1e599, %g1, %r2
        setx  0x967f71dceea1fa77, %g1, %r3
        setx  0x887f2f7726b18f00, %g1, %r4
        setx  0x1c7e5a0ad3cc4064, %g1, %r5
        setx  0x40b98bbfef7602dc, %g1, %r6
        setx  0x41fd73282e915475, %g1, %r7
        setx  0x238adef5534779d1, %g1, %r8
        setx  0xe7229524a796b2ed, %g1, %r9
        setx  0x9bf79fed068edb2f, %g1, %r10
        setx  0xd3637753fda3eb03, %g1, %r11
        setx  0xcd34d77b8c82c3e4, %g1, %r12
        setx  0x4c01ac5fb19c4526, %g1, %r13
        setx  0x54c9f96a8a555ac2, %g1, %r14
        setx  0x47db8906b0200877, %g1, %r15
        setx  0x317e1cbfc49f991c, %g1, %r18
        setx  0xd321f964f633f158, %g1, %r19
        setx  0x56751ece6489d251, %g1, %r20
        setx  0xb0c0c582bbb9cbc1, %g1, %r21
        setx  0x9163734e44a1c316, %g1, %r22
        setx  0xb9cece0a190ce7dd, %g1, %r23
        setx  0x244ccfe596ed07b4, %g1, %r24
        setx  0x3ceffaff3b76498d, %g1, %r25
        setx  0x8eef5925d7094cd8, %g1, %r26
        setx  0x1d9985ab1f1e2cad, %g1, %r27
        setx  0x8d480ac8fd058185, %g1, %r28
        setx  0x4d886f38dbbd12d9, %g1, %r29
        setx  0x49b07a1f0bf91eae, %g1, %r30
        setx  0x9c7c1652f8caf303, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000e30, %g1, %r17
        setx  0x1405fe2f61d81184, %g1, %r0
        setx  0x4b8b91b7191dd548, %g1, %r1
        setx  0xccede41028bfdce5, %g1, %r2
        setx  0x1e41edc460e5c992, %g1, %r3
        setx  0x67cbb7c1b0d9197e, %g1, %r4
        setx  0x3bba500b83c5f6cb, %g1, %r5
        setx  0x2cf723b3f4b0a352, %g1, %r6
        setx  0x237443bc23f1f1bc, %g1, %r7
        setx  0x171e6492078a7738, %g1, %r8
        setx  0x033dea361a136ec2, %g1, %r9
        setx  0x72b5e67984972247, %g1, %r10
        setx  0xf9957313d8797599, %g1, %r11
        setx  0xcbc07f3a81285f3c, %g1, %r12
        setx  0x140ec3dbe2ae5bbf, %g1, %r13
        setx  0xdeffde36cf5f2362, %g1, %r14
        setx  0x8ff7a72f832d3894, %g1, %r15
        setx  0x51371c253edc3cf1, %g1, %r18
        setx  0x4d1abe51bcb32ba0, %g1, %r19
        setx  0x184fa47cbe61e152, %g1, %r20
        setx  0x51d1fc8713a7bc7f, %g1, %r21
        setx  0xe16131ff25342f2e, %g1, %r22
        setx  0xb06e2705f6a5fc6a, %g1, %r23
        setx  0xb73b5dfd197d9037, %g1, %r24
        setx  0x93f9f56ee2a1eb24, %g1, %r25
        setx  0x9e269261143f27fd, %g1, %r26
        setx  0xdd58cc5cacb6b124, %g1, %r27
        setx  0x0e7f7877f89002eb, %g1, %r28
        setx  0x47de9bfe0b7086f1, %g1, %r29
        setx  0xb6dcfba5948ba0db, %g1, %r30
        setx  0xfc642e2a4a107598, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000b40, %g1, %r17
        setx  0x26d73da4d44c7a2a, %g1, %r0
        setx  0x21864b38135119d7, %g1, %r1
        setx  0xf05bb95fe3a7352d, %g1, %r2
        setx  0x712ec8e98e2298f5, %g1, %r3
        setx  0x2c938ec73d262baa, %g1, %r4
        setx  0xf87d30a9284ef79c, %g1, %r5
        setx  0x1b96038f8af4644d, %g1, %r6
        setx  0x01e039b8a2eabcd3, %g1, %r7
        setx  0xeeea7f6005f76252, %g1, %r8
        setx  0xc3504f8b40ee1d85, %g1, %r9
        setx  0xdaee2e6d62c6cb99, %g1, %r10
        setx  0x5f88ce616ef9d5de, %g1, %r11
        setx  0xbb7001639100daea, %g1, %r12
        setx  0x3f9670f8437d572c, %g1, %r13
        setx  0x737d04efd80f8fea, %g1, %r14
        setx  0xbac9e388ec36d64f, %g1, %r15
        setx  0x5258065393b5bfca, %g1, %r18
        setx  0x7cee50d51f286d58, %g1, %r19
        setx  0x34872cf3d54b3113, %g1, %r20
        setx  0x6f323760d7d758b7, %g1, %r21
        setx  0x1fd204c1ee257578, %g1, %r22
        setx  0x3a037ecd3406edce, %g1, %r23
        setx  0xb13d85fd913a4c5c, %g1, %r24
        setx  0x43487cc1bc62bc60, %g1, %r25
        setx  0x89efcc9f9440bf5a, %g1, %r26
        setx  0x607ba3692621c904, %g1, %r27
        setx  0x375a17489f0d2a4e, %g1, %r28
        setx  0x6cdbe2935e66be09, %g1, %r29
        setx  0x8b2b793a9a864c6c, %g1, %r30
        setx  0xd78398a2036b4ce3, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000003b0, %g1, %r17
        setx  0x05561dd1825eb00f, %g1, %r0
        setx  0x3a3066136860507d, %g1, %r1
        setx  0x3f40e831ee4fefa5, %g1, %r2
        setx  0x89ea6bad8731f6fa, %g1, %r3
        setx  0xa5085908f9112e74, %g1, %r4
        setx  0x2e8c54a2fc655b55, %g1, %r5
        setx  0xa3cb2776a306e916, %g1, %r6
        setx  0x3e26275b1de78b30, %g1, %r7
        setx  0x207fd9f5a13e5cfd, %g1, %r8
        setx  0x60172cc32876a065, %g1, %r9
        setx  0xdbdcd4d6a7d37a30, %g1, %r10
        setx  0x2c4fc66168cf3215, %g1, %r11
        setx  0xc5bacf71f2dae8aa, %g1, %r12
        setx  0x3b7da6c27ea5a925, %g1, %r13
        setx  0x55c6301137f0c3ae, %g1, %r14
        setx  0x203fc3d627efb510, %g1, %r15
        setx  0xbf38cf741623f321, %g1, %r18
        setx  0xa378ec3d3fa7a77f, %g1, %r19
        setx  0xd11129011e4bb9fe, %g1, %r20
        setx  0xce7a009cea95647c, %g1, %r21
        setx  0xe36735e5c3b4ec40, %g1, %r22
        setx  0x0a9892dbe6044187, %g1, %r23
        setx  0x869179ffa8d0583b, %g1, %r24
        setx  0x312c672086f21619, %g1, %r25
        setx  0xd7790cd9da892f57, %g1, %r26
        setx  0x9a7b4785b0fac2ea, %g1, %r27
        setx  0x7424382506cda305, %g1, %r28
        setx  0x3210d6adda9bb57a, %g1, %r29
        setx  0x9c9fdf2a9b0f2ea4, %g1, %r30
        setx  0x41b8f741e4d4d040, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000002e0, %g1, %r17
        setx  0xd4923feb40ba23de, %g1, %r0
        setx  0x6a2557c1d6351b84, %g1, %r1
        setx  0xdb7a7146ea19154e, %g1, %r2
        setx  0x44d52b24ca81b4e8, %g1, %r3
        setx  0xd209e41eab88778a, %g1, %r4
        setx  0x7f6b91e77eb057fe, %g1, %r5
        setx  0x5c4c89aeef3c3879, %g1, %r6
        setx  0x7370a0cddf488021, %g1, %r7
        setx  0xfee9f81cb98f80f7, %g1, %r8
        setx  0xe1f24585c46ad18c, %g1, %r9
        setx  0xb793995823af795b, %g1, %r10
        setx  0xca99f29a45c9049b, %g1, %r11
        setx  0x31396b65419134d4, %g1, %r12
        setx  0x1bbd622a0ccc8152, %g1, %r13
        setx  0x0c20450868c450dd, %g1, %r14
        setx  0x2144d95ded4ee299, %g1, %r15
        setx  0x06546010e6fcafdc, %g1, %r18
        setx  0x9dbe9e6b223d0e53, %g1, %r19
        setx  0x95b92284f318a1e1, %g1, %r20
        setx  0x57e7dfa55152259f, %g1, %r21
        setx  0x60489bb096f91e69, %g1, %r22
        setx  0x3bc58b8c187940e8, %g1, %r23
        setx  0xcdbdcd885557e47e, %g1, %r24
        setx  0xc91263977e87dcf3, %g1, %r25
        setx  0xfd9400d49bc34a39, %g1, %r26
        setx  0x32dafd268e88cd81, %g1, %r27
        setx  0x2e4dbc35b9333168, %g1, %r28
        setx  0xe006d60dd99ea830, %g1, %r29
        setx  0x1467c747bcbdd51b, %g1, %r30
        setx  0x7209b80d98bd878a, %g1, %r31
	save %r0, %r0, %r31
        wr  %g0, 0x80, %asi
        wr %g0, 0x4, %fprs
	ldd	[%r16 + 0], %f0
	ldd	[%r16 + 8], %f2
	ldd	[%r16 + 16], %f4
	ldd	[%r16 + 24], %f6
	ldd	[%r16 + 32], %f8
	ldd	[%r16 + 40], %f10
	ldd	[%r16 + 48], %f12
	ldd	[%r16 + 56], %f14
	ldd	[%r16 + 64], %f16
	ldd	[%r16 + 72], %f18
	ldd	[%r16 + 80], %f20
	ldd	[%r16 + 88], %f22
	ldd	[%r16 + 96], %f24
	ldd	[%r16 + 104], %f26
	ldd	[%r16 + 112], %f28
	ldd	[%r16 + 120], %f30
	ldd	[%r16 + 128], %f32
	ldd	[%r16 + 136], %f34
	ldd	[%r16 + 144], %f36
	ldd	[%r16 + 152], %f38
	ldd	[%r16 + 160], %f40
	ldd	[%r16 + 168], %f42
	ldd	[%r16 + 176], %f44
	ldd	[%r16 + 184], %f46
	ldd	[%r16 + 192], %f48
	ldd	[%r16 + 200], %f50
	ldd	[%r16 + 208], %f52
	ldd	[%r16 + 216], %f54
	ldd	[%r16 + 224], %f56
	ldd	[%r16 + 232], %f58
	ldd	[%r16 + 240], %f60
	ldd	[%r16 + 248], %f62
	.word 0xf61c0011  ! 2: LDD_R	ldd	[%r16 + %r17], %r27
thr2_irf_ce_0:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_0), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xd64c235c  ! 4: LDSB_I	ldsb	[%r16 + 0x035c], %r11
	.word 0x89641811  ! 6: MOVcc_R	<illegal instruction>
	.word 0x8a9c2a06  ! 6: XORcc_I	xorcc 	%r16, 0x0a06, %r5
	.word 0xb28c2644  ! 6: ANDcc_I	andcc 	%r16, 0x0644, %r25
	.word 0xaa340011  ! 6: ORN_R	orn 	%r16, %r17, %r21
	.word 0x98c42fdf  ! 6: ADDCcc_I	addccc 	%r16, 0x0fdf, %r12
	.word 0xae9c0011  ! 6: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x9d2c0011  ! 6: SLL_R	sll 	%r16, %r17, %r14
	.word 0xb23c29c3  ! 6: XNOR_I	xnor 	%r16, 0x09c3, %r25
	.word 0xc21429df  ! 7: LDUH_I	lduh	[%r16 + 0x09df], %r1
thr2_irf_ce_1:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_1), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xc88c1011  ! 9: LDUBA_R	lduba	[%r16, %r17] 0x80, %r4
	.word 0x90bc0011  ! 11: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0xb63c2614  ! 11: XNOR_I	xnor 	%r16, 0x0614, %r27
	.word 0x9a442794  ! 11: ADDC_I	addc 	%r16, 0x0794, %r13
	.word 0x98140011  ! 11: OR_R	or 	%r16, %r17, %r12
	.word 0xb8140011  ! 11: OR_R	or 	%r16, %r17, %r28
	.word 0xb60c2fca  ! 11: AND_I	and 	%r16, 0x0fca, %r27
	.word 0x981c0011  ! 11: XOR_R	xor 	%r16, %r17, %r12
thr2_dc_err_0:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_0), 16, 16),1,DC_DATA,68)
	.word 0xde9c2da8  ! 13: LDDA_I	ldda	[%r16, + 0x0da8] %asi, %r15
	ta	T_CHANGE_PRIV	! macro
	.word 0x84c42733  ! 17: ADDCcc_I	addccc 	%r16, 0x0733, %r2
	.word 0xb8c40011  ! 17: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0x9d340011  ! 17: SRL_R	srl 	%r16, %r17, %r14
	.word 0x98c429e8  ! 17: ADDCcc_I	addccc 	%r16, 0x09e8, %r12
	.word 0x82440011  ! 17: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x84040011  ! 17: ADD_R	add 	%r16, %r17, %r2
	.word 0xc2140011  ! 18: LDUH_R	lduh	[%r16 + %r17], %r1
thr2_irf_ce_2:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_2), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xe8942989  ! 20: LDUHA_I	lduha	[%r16, + 0x0989] %asi, %r20
	.word 0xa8042c3d  ! 22: ADD_I	add 	%r16, 0x0c3d, %r20
	.word 0x94c42941  ! 22: ADDCcc_I	addccc 	%r16, 0x0941, %r10
	.word 0x9d643801  ! 22: MOVcc_I	<illegal instruction>
	.word 0x8abc2bf3  ! 22: XNORcc_I	xnorcc 	%r16, 0x0bf3, %r5
	.word 0x8a3c0011  ! 22: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x90bc0011  ! 22: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0xab2c1011  ! 22: SLLX_R	sllx	%r16, %r17, %r21
	.word 0xac3c0011  ! 22: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0xca5c0011  ! 23: LDX_R	ldx	[%r16 + %r17], %r5
thr2_irf_ce_3:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_3), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xd44c29b0  ! 25: LDSB_I	ldsb	[%r16 + 0x09b0], %r10
	.word 0x960c2b16  ! 27: AND_I	and 	%r16, 0x0b16, %r11
	.word 0x913c0011  ! 27: SRA_R	sra 	%r16, %r17, %r8
	.word 0x93641811  ! 27: MOVcc_R	<illegal instruction>
	.word 0xa8040011  ! 27: ADD_R	add 	%r16, %r17, %r20
	.word 0xaf3c2001  ! 27: SRA_I	sra 	%r16, 0x0001, %r23
	.word 0x8d340011  ! 27: SRL_R	srl 	%r16, %r17, %r6
	.word 0x957c2401  ! 27: MOVR_I	move	%r16, 0x7fff9c24, %r10
	.word 0x83343001  ! 27: SRLX_I	srlx	%r16, 0x0001, %r1
thr2_dc_err_1:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_1), 16, 16),1,DC_DATA,27)
	.word 0xf01c0000  ! 29: LDD_R	ldd	[%r16 + %r0], %r24
thr2_irf_ce_4:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_4), 16, 16),1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xcf841011  ! 31: LDFA_R	lda	[%r16, %r17], %f7
	.word 0xa77c2401  ! 33: MOVR_I	move	%r16, 0x7fff9c24, %r19
	.word 0x903425c3  ! 33: ORN_I	orn 	%r16, 0x05c3, %r8
	.word 0xb43c0011  ! 33: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0xac8c0011  ! 33: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0xb4c40011  ! 33: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0xb89c0011  ! 33: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0x8d3c0011  ! 33: SRA_R	sra 	%r16, %r17, %r6
	.word 0x8c0c2747  ! 33: AND_I	and 	%r16, 0x0747, %r6
	.word 0xf48c1011  ! 34: LDUBA_R	lduba	[%r16, %r17] 0x80, %r26
	.word 0xdf142d62  ! 36: LDQF_I	-	[%r16, 0x0d62], %f15
	.word 0x841c25ce  ! 38: XOR_I	xor 	%r16, 0x05ce, %r2
	.word 0xad2c0011  ! 38: SLL_R	sll 	%r16, %r17, %r22
	.word 0xba842ec1  ! 38: ADDcc_I	addcc 	%r16, 0x0ec1, %r29
	.word 0x89341011  ! 38: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x9c04222e  ! 38: ADD_I	add 	%r16, 0x022e, %r14
	.word 0x94940011  ! 38: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x993c0011  ! 38: SRA_R	sra 	%r16, %r17, %r12
thr2_dc_err_2:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_2), 16, 16),1,DC_DATA,2)
	.word 0xc24c0000  ! 40: LDSB_R	ldsb	[%r16 + %r0], %r1
	.word 0xc5042460  ! 42: LDF_I	ld	[%r16, 0x0460], %f2
	.word 0x9eac2d61  ! 44: ANDNcc_I	andncc 	%r16, 0x0d61, %r15
	.word 0x9e840011  ! 44: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x88b40011  ! 44: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0xa8142ab7  ! 44: OR_I	or 	%r16, 0x0ab7, %r20
	.word 0xa81c20a9  ! 44: XOR_I	xor 	%r16, 0x00a9, %r20
	.word 0x957c2401  ! 44: MOVR_I	move	%r16, 0x7fff9c24, %r10
	.word 0xb32c3001  ! 44: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0x90442349  ! 44: ADDC_I	addc 	%r16, 0x0349, %r8
	.word 0xeb1c0011  ! 45: LDDF_R	ldd	[%r16, %r17], %f21
thr2_irf_ce_5:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_5), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xc8242388  ! 49: STW_I	stw	%r4, [%r16 + 0x0388]
	.word 0xb72c2001  ! 51: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0x84c42954  ! 51: ADDCcc_I	addccc 	%r16, 0x0954, %r2
	.word 0xab343001  ! 51: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0xb804299b  ! 51: ADD_I	add 	%r16, 0x099b, %r28
	.word 0xb20c0011  ! 51: AND_R	and 	%r16, %r17, %r25
	.word 0x932c2001  ! 51: SLL_I	sll 	%r16, 0x0001, %r9
thr2_dc_err_3:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_3), 16, 16),1,DC_DATA,33)
	.word 0xd2042d70  ! 53: LDUW_I	lduw	[%r16 + 0x0d70], %r9
	.word 0xd40c275b  ! 55: LDUB_I	ldub	[%r16 + 0x075b], %r10
	.word 0x86bc0011  ! 57: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0xb8840011  ! 57: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0xa88424dd  ! 57: ADDcc_I	addcc 	%r16, 0x04dd, %r20
	.word 0x997c0411  ! 57: MOVR_R	move	%r16, %r17, %r12
	.word 0x8e0c0011  ! 57: AND_R	and 	%r16, %r17, %r7
	.word 0xb2342ea0  ! 57: ORN_I	orn 	%r16, 0x0ea0, %r25
	.word 0x8f2c2001  ! 57: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0xa7342001  ! 57: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0xdf1c25e2  ! 58: LDDF_I	ldd	[%r16, 0x05e2], %f15
thr2_irf_ce_6:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_6), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb57c2401  ! 62: MOVR_I	move	%r16, 0x7fff9c24, %r26
	.word 0xa8340011  ! 62: ORN_R	orn 	%r16, %r17, %r20
	.word 0x83342001  ! 62: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x8abc2798  ! 62: XNORcc_I	xnorcc 	%r16, 0x0798, %r5
	.word 0xa80c2a50  ! 62: AND_I	and 	%r16, 0x0a50, %r20
	.word 0xaa940011  ! 62: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0xb4940011  ! 62: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0xa93c2001  ! 62: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0xc60c272a  ! 63: LDUB_I	ldub	[%r16 + 0x072a], %r3
	.word 0x20800004  ! 65: BN	bn,a	<label_0x4>
	.word 0xacc42800  ! 67: ADDCcc_I	addccc 	%r16, 0x0800, %r22
	.word 0x8c0c23a3  ! 67: AND_I	and 	%r16, 0x03a3, %r6
	.word 0xbb342001  ! 67: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0xa6142e18  ! 67: OR_I	or 	%r16, 0x0e18, %r19
	.word 0xb3342001  ! 67: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x9a44238b  ! 67: ADDC_I	addc 	%r16, 0x038b, %r13
	.word 0xaf643801  ! 67: MOVcc_I	<illegal instruction>
	.word 0x892c2001  ! 67: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0xce9c202d  ! 68: LDDA_I	ldda	[%r16, + 0x002d] %asi, %r7
thr2_irf_ce_7:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_7), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	wr      %r0, 0x1, %asr26
	.word 0x92340011  ! 72: ORN_R	orn 	%r16, %r17, %r9
	.word 0x869c0011  ! 72: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0x87641811  ! 72: MOVcc_R	<illegal instruction>
	.word 0x92940011  ! 72: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0xb52c2001  ! 72: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xaf7c2401  ! 72: MOVR_I	move	%r16, 0x7fff9c24, %r23
	.word 0x932c2001  ! 72: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0xdb841011  ! 73: LDFA_R	lda	[%r16, %r17], %f13
!Illinst store
	.word 0xc8340011  ! 75: STH_R	sth	%r4, [%r16 + %r17]
	.word 0x8c3c0011  ! 77: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0xb0c4222e  ! 77: ADDCcc_I	addccc 	%r16, 0x022e, %r24
	.word 0x94840011  ! 77: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0x92142660  ! 77: OR_I	or 	%r16, 0x0660, %r9
	.word 0xad3c1011  ! 77: SRAX_R	srax	%r16, %r17, %r22
	.word 0xacbc0011  ! 77: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0xae140011  ! 77: OR_R	or 	%r16, %r17, %r23
	.word 0xab343001  ! 77: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0xd3841011  ! 78: LDFA_R	lda	[%r16, %r17], %f9
!Illinst alu
	.word 0xac842a7a  ! 80: ADDcc_I	addcc 	%r16, 0x0a7a, %r22
	.word 0x872c3001  ! 82: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0xa6840011  ! 82: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0xb9340011  ! 82: SRL_R	srl 	%r16, %r17, %r28
	.word 0x943424b6  ! 82: ORN_I	orn 	%r16, 0x04b6, %r10
	.word 0xb21c0011  ! 82: XOR_R	xor 	%r16, %r17, %r25
thr2_dc_err_4:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_4), 16, 16),1,DC_DATA,40)
	.word 0xc2c424d3  ! 84: LDSWA_I	ldswa	[%r16, + 0x04d3] %asi, %r1
	.word 0xf08424e4  ! 86: LDUWA_I	lduwa	[%r16, + 0x04e4] %asi, %r24
	.word 0x8b643801  ! 88: MOVcc_I	<illegal instruction>
	.word 0x8a9c0011  ! 88: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0xb61420df  ! 88: OR_I	or 	%r16, 0x00df, %r27
	.word 0xbb3c2001  ! 88: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0x992c0011  ! 88: SLL_R	sll 	%r16, %r17, %r12
	.word 0xbb2c3001  ! 88: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xd8c42edd  ! 89: LDSWA_I	ldswa	[%r16, + 0x0edd] %asi, %r12
	.word 0xd3941011  ! 91: LDQFA_R	-	[%r16, %r17], %f9
	.word 0x9834228c  ! 93: ORN_I	orn 	%r16, 0x028c, %r12
	.word 0x8eb42909  ! 93: ORNcc_I	orncc 	%r16, 0x0909, %r7
	.word 0xaeac0011  ! 93: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0x868c0011  ! 93: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x82342983  ! 93: ORN_I	orn 	%r16, 0x0983, %r1
	.word 0xb08c0011  ! 93: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0xaeb422d8  ! 93: ORNcc_I	orncc 	%r16, 0x02d8, %r23
	.word 0x99341011  ! 93: SRLX_R	srlx	%r16, %r17, %r12
	.word 0xfacc1011  ! 94: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r29
thr2_irf_ce_8:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_8), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xdcdc1011  ! 96: LDXA_R	ldxa	[%r16, %r17] 0x80, %r14
	.word 0xa89c2849  ! 98: XORcc_I	xorcc 	%r16, 0x0849, %r20
	.word 0x96340011  ! 98: ORN_R	orn 	%r16, %r17, %r11
	.word 0x872c1011  ! 98: SLLX_R	sllx	%r16, %r17, %r3
	.word 0x90c40011  ! 98: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0xb33c2001  ! 98: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0xf2440011  ! 99: LDSW_R	ldsw	[%r16 + %r17], %r25
thr2_irf_ce_9:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_9), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xe79c1011  ! 101: LDDFA_R	ldda	[%r16, %r17], %f19
	.word 0x888c2a56  ! 103: ANDcc_I	andcc 	%r16, 0x0a56, %r4
	.word 0x888c0011  ! 103: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0x88040011  ! 103: ADD_R	add 	%r16, %r17, %r4
	.word 0x83340011  ! 103: SRL_R	srl 	%r16, %r17, %r1
	.word 0x880c2b47  ! 103: AND_I	and 	%r16, 0x0b47, %r4
	.word 0x9e842a31  ! 103: ADDcc_I	addcc 	%r16, 0x0a31, %r15
	.word 0x8ec42994  ! 103: ADDCcc_I	addccc 	%r16, 0x0994, %r7
thr2_dc_err_5:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_5), 16, 16),1,DC_DATA,57)
	.word 0xf69c22af  ! 105: LDDA_I	ldda	[%r16, + 0x02af] %asi, %r27
thr2_irf_ce_10:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_10), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xf8342219  ! 109: STH_I	sth	%r28, [%r16 + 0x0219]
	.word 0x849c20a8  ! 111: XORcc_I	xorcc 	%r16, 0x00a8, %r2
	.word 0xba440011  ! 111: ADDC_R	addc 	%r16, %r17, %r29
	.word 0x901420b3  ! 111: OR_I	or 	%r16, 0x00b3, %r8
	.word 0xb48c0011  ! 111: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0x8a2c2239  ! 111: ANDN_I	andn 	%r16, 0x0239, %r5
	.word 0x8a942cd0  ! 111: ORcc_I	orcc 	%r16, 0x0cd0, %r5
	.word 0x912c1011  ! 111: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x86c42092  ! 111: ADDCcc_I	addccc 	%r16, 0x0092, %r3
	.word 0xc8140011  ! 112: LDUH_R	lduh	[%r16 + %r17], %r4
	.word 0xeefc1011  ! 114: SWAPA_R	swapa	%r23, [%r16 + %r17] 0x80
	.word 0x9f2c3001  ! 116: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x873c0011  ! 116: SRA_R	sra 	%r16, %r17, %r3
	.word 0x8f2c2001  ! 116: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0xa68c277f  ! 116: ANDcc_I	andcc 	%r16, 0x077f, %r19
	.word 0x8a2c0011  ! 116: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xb72c2001  ! 116: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xb33c2001  ! 116: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0x90442c58  ! 116: ADDC_I	addc 	%r16, 0x0c58, %r8
thr2_dc_err_6:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_6), 16, 16),1,DC_DATA,36)
	.word 0xd1140000  ! 118: LDQF_R	-	[%r16, %r0], %f8
thr2_irf_ce_11:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_11), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xc3941011  ! 120: LDQFA_R	-	[%r16, %r17], %f1
	.word 0x8d7c2401  ! 122: MOVR_I	move	%r16, 0x7fff9c24, %r6
	.word 0x9e9c25dc  ! 122: XORcc_I	xorcc 	%r16, 0x05dc, %r15
	.word 0x9b342001  ! 122: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0xb43c0011  ! 122: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x8c2c26b6  ! 122: ANDN_I	andn 	%r16, 0x06b6, %r6
thr2_dc_err_7:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_7), 16, 16),1,DC_DATA,57)
	.word 0xc5040000  ! 124: LDF_R	ld	[%r16, %r0], %f2
thr2_irf_ce_12:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_12), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xdd142364  ! 126: LDQF_I	-	[%r16, 0x0364], %f14
	.word 0xb88c2c61  ! 128: ANDcc_I	andcc 	%r16, 0x0c61, %r28
	.word 0xb72c1011  ! 128: SLLX_R	sllx	%r16, %r17, %r27
	.word 0xad341011  ! 128: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x8d341011  ! 128: SRLX_R	srlx	%r16, %r17, %r6
	.word 0x99340011  ! 128: SRL_R	srl 	%r16, %r17, %r12
	.word 0xacb42d41  ! 128: ORNcc_I	orncc 	%r16, 0x0d41, %r22
	.word 0x85643801  ! 128: MOVcc_I	<illegal instruction>
	.word 0x9eb40011  ! 128: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0xc71c0011  ! 129: LDDF_R	ldd	[%r16, %r17], %f3
thr2_irf_ce_13:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_13), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xd11c2e6d  ! 131: LDDF_I	ldd	[%r16, 0x0e6d], %f8
	.word 0x89643801  ! 133: MOVcc_I	<illegal instruction>
	.word 0x961c0011  ! 133: XOR_R	xor 	%r16, %r17, %r11
	.word 0x86c423ad  ! 133: ADDCcc_I	addccc 	%r16, 0x03ad, %r3
	.word 0x9f342001  ! 133: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xa6840011  ! 133: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x942c0011  ! 133: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x9a842ec3  ! 133: ADDcc_I	addcc 	%r16, 0x0ec3, %r13
thr2_dc_err_8:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_8), 16, 16),1,DC_DATA,43)
	.word 0xcf941000  ! 135: LDQFA_R	-	[%r16, %r0], %f7
thr2_irf_ce_14:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_14), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xde040011  ! 137: LDUW_R	lduw	[%r16 + %r17], %r15
	.word 0xb2340011  ! 139: ORN_R	orn 	%r16, %r17, %r25
	.word 0xb09c2f13  ! 139: XORcc_I	xorcc 	%r16, 0x0f13, %r24
	.word 0x8e842468  ! 139: ADDcc_I	addcc 	%r16, 0x0468, %r7
	.word 0x9e2c2d25  ! 139: ANDN_I	andn 	%r16, 0x0d25, %r15
	.word 0x96bc0011  ! 139: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x98940011  ! 139: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x880c2c72  ! 139: AND_I	and 	%r16, 0x0c72, %r4
	.word 0xde1c0011  ! 140: LDD_R	ldd	[%r16 + %r17], %r15
	.word 0xcec426ea  ! 142: LDSWA_I	ldswa	[%r16, + 0x06ea] %asi, %r7
	.word 0x93340011  ! 144: SRL_R	srl 	%r16, %r17, %r9
	.word 0x9cc40011  ! 144: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0x8f2c3001  ! 144: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x88440011  ! 144: ADDC_R	addc 	%r16, %r17, %r4
	.word 0xa9342001  ! 144: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0x961c256d  ! 144: XOR_I	xor 	%r16, 0x056d, %r11
	.word 0xc91c0011  ! 145: LDDF_R	ldd	[%r16, %r17], %f4
!Illinst alu
	.word 0x86440011  ! 147: ADDC_R	addc 	%r16, %r17, %r3
	.word 0xb0c42b21  ! 149: ADDCcc_I	addccc 	%r16, 0x0b21, %r24
	.word 0xac940011  ! 149: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0x94840011  ! 149: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0xac1c0011  ! 149: XOR_R	xor 	%r16, %r17, %r22
	.word 0xb2342bc1  ! 149: ORN_I	orn 	%r16, 0x0bc1, %r25
	.word 0xb81c2dcc  ! 149: XOR_I	xor 	%r16, 0x0dcc, %r28
	.word 0xba8c0011  ! 149: ANDcc_R	andcc 	%r16, %r17, %r29
	.word 0xb4340011  ! 149: ORN_R	orn 	%r16, %r17, %r26
	.word 0xe8dc1011  ! 150: LDXA_R	ldxa	[%r16, %r17] 0x80, %r20
thr2_irf_ce_15:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_15), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xf6540011  ! 152: LDSH_R	ldsh	[%r16 + %r17], %r27
	.word 0x8c040011  ! 154: ADD_R	add 	%r16, %r17, %r6
	.word 0x893c0011  ! 154: SRA_R	sra 	%r16, %r17, %r4
	.word 0x8cbc23f6  ! 154: XNORcc_I	xnorcc 	%r16, 0x03f6, %r6
	.word 0x9604238f  ! 154: ADD_I	add 	%r16, 0x038f, %r11
	.word 0xae9c0011  ! 154: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x98ac0011  ! 154: ANDNcc_R	andncc 	%r16, %r17, %r12
thr2_dc_err_9:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_9), 16, 16),1,DC_DATA,52)
	.word 0xdf841000  ! 156: LDFA_R	lda	[%r16, %r0], %f15
thr2_irf_ce_16:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_16), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xce4c0011  ! 158: LDSB_R	ldsb	[%r16 + %r17], %r7
	.word 0x8a340011  ! 160: ORN_R	orn 	%r16, %r17, %r5
	.word 0x90ac0011  ! 160: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x90ac20a5  ! 160: ANDNcc_I	andncc 	%r16, 0x00a5, %r8
	.word 0xae040011  ! 160: ADD_R	add 	%r16, %r17, %r23
	.word 0x869c2083  ! 160: XORcc_I	xorcc 	%r16, 0x0083, %r3
	.word 0x9ec4250d  ! 160: ADDCcc_I	addccc 	%r16, 0x050d, %r15
	.word 0x9e442ca9  ! 160: ADDC_I	addc 	%r16, 0x0ca9, %r15
	.word 0x9c3c0011  ! 160: XNOR_R	xnor 	%r16, %r17, %r14
thr2_dc_err_10:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_10), 16, 16),1,DC_DATA,29)
	.word 0xcb9c1000  ! 162: LDDFA_R	ldda	[%r16, %r0], %f5
thr2_irf_ce_17:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_17), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xd4cc1011  ! 164: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r10
	.word 0x92442da6  ! 166: ADDC_I	addc 	%r16, 0x0da6, %r9
	.word 0xa89c28b7  ! 166: XORcc_I	xorcc 	%r16, 0x08b7, %r20
	.word 0xb6442eee  ! 166: ADDC_I	addc 	%r16, 0x0eee, %r27
	.word 0x880c2185  ! 166: AND_I	and 	%r16, 0x0185, %r4
	.word 0x872c3001  ! 166: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x9f2c3001  ! 166: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0xac340011  ! 166: ORN_R	orn 	%r16, %r17, %r22
	.word 0xc79c1011  ! 167: LDDFA_R	ldda	[%r16, %r17], %f3
	.word 0xc4440011  ! 169: LDSW_R	ldsw	[%r16 + %r17], %r2
	.word 0xb03c0011  ! 171: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0x9e142d1e  ! 171: OR_I	or 	%r16, 0x0d1e, %r15
	.word 0x8abc21d6  ! 171: XNORcc_I	xnorcc 	%r16, 0x01d6, %r5
	.word 0x969420e2  ! 171: ORcc_I	orcc 	%r16, 0x00e2, %r11
	.word 0xb5643801  ! 171: MOVcc_I	<illegal instruction>
	.word 0x99342001  ! 171: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x9b7c2401  ! 171: MOVR_I	move	%r16, 0x7fff9c24, %r13
	.word 0x9c8c0011  ! 171: ANDcc_R	andcc 	%r16, %r17, %r14
thr2_dc_err_11:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_11), 16, 16),1,DC_DATA,0)
	.word 0xdccc2c5a  ! 173: LDSBA_I	ldsba	[%r16, + 0x0c5a] %asi, %r14
thr2_irf_ce_18:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_18), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xda5c2835  ! 175: LDX_I	ldx	[%r16 + 0x0835], %r13
	.word 0xa61c0011  ! 177: XOR_R	xor 	%r16, %r17, %r19
	.word 0xa83c0011  ! 177: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0xb80c0011  ! 177: AND_R	and 	%r16, %r17, %r28
	.word 0x8e2c0011  ! 177: ANDN_R	andn 	%r16, %r17, %r7
	.word 0x9aac0011  ! 177: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x84440011  ! 177: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x968c283e  ! 177: ANDcc_I	andcc 	%r16, 0x083e, %r11
	.word 0xf88c1011  ! 178: LDUBA_R	lduba	[%r16, %r17] 0x80, %r28
	.word 0xd2dc1011  ! 180: LDXA_R	ldxa	[%r16, %r17] 0x80, %r9
	.word 0x8d3c2001  ! 182: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0xb4442fec  ! 182: ADDC_I	addc 	%r16, 0x0fec, %r26
	.word 0xab2c1011  ! 182: SLLX_R	sllx	%r16, %r17, %r21
	.word 0x8f641811  ! 182: MOVcc_R	<illegal instruction>
	.word 0x8f340011  ! 182: SRL_R	srl 	%r16, %r17, %r7
thr2_dc_err_12:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_12), 16, 16),1,DC_DATA,22)
	.word 0xdf1c2f19  ! 184: LDDF_I	ldd	[%r16, 0x0f19], %f15
	.word 0xf7040011  ! 186: LDF_R	ld	[%r16, %r17], %f27
	.word 0xaa342d08  ! 188: ORN_I	orn 	%r16, 0x0d08, %r21
	.word 0xaebc29e2  ! 188: XNORcc_I	xnorcc 	%r16, 0x09e2, %r23
	.word 0x9b340011  ! 188: SRL_R	srl 	%r16, %r17, %r13
	.word 0x8c440011  ! 188: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x96840011  ! 188: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0x8c842f55  ! 188: ADDcc_I	addcc 	%r16, 0x0f55, %r6
	.word 0x8b2c2001  ! 188: SLL_I	sll 	%r16, 0x0001, %r5
thr2_dc_err_13:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_13), 16, 16),1,DC_DATA,48)
	.word 0xdadc1000  ! 190: LDXA_R	ldxa	[%r16, %r0] 0x80, %r13
thr2_irf_ce_19:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_19), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xf0ec1011  ! 192: LDSTUBA_R	ldstuba	%r24, [%r16 + %r17] 0x80
	.word 0xb60c0011  ! 194: AND_R	and 	%r16, %r17, %r27
	.word 0x9a842616  ! 194: ADDcc_I	addcc 	%r16, 0x0616, %r13
	.word 0x933c0011  ! 194: SRA_R	sra 	%r16, %r17, %r9
	.word 0x9a1422cb  ! 194: OR_I	or 	%r16, 0x02cb, %r13
	.word 0x823c0011  ! 194: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x862c2361  ! 194: ANDN_I	andn 	%r16, 0x0361, %r3
thr2_dc_err_14:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_14), 16, 16),1,DC_DATA,6)
	.word 0xf00c0000  ! 196: LDUB_R	ldub	[%r16 + %r0], %r24
thr2_irf_ce_20:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_20), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xce5c2e2c  ! 198: LDX_I	ldx	[%r16 + 0x0e2c], %r7
	.word 0x8c1c0011  ! 200: XOR_R	xor 	%r16, %r17, %r6
	.word 0xb0ac0011  ! 200: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0xa9643801  ! 200: MOVcc_I	<illegal instruction>
	.word 0xb814214d  ! 200: OR_I	or 	%r16, 0x014d, %r28
	.word 0xae140011  ! 200: OR_R	or 	%r16, %r17, %r23
	.word 0xb1641811  ! 200: MOVcc_R	<illegal instruction>
	.word 0xb69c2b16  ! 200: XORcc_I	xorcc 	%r16, 0x0b16, %r27
	.word 0xd39c1011  ! 201: LDDFA_R	ldda	[%r16, %r17], %f9
thr2_irf_ce_21:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_21), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	wr      %r0, 0x1, %asr26
	.word 0xaa3c0011  ! 205: XNOR_R	xnor 	%r16, %r17, %r21
	.word 0x8cac2bd5  ! 205: ANDNcc_I	andncc 	%r16, 0x0bd5, %r6
	.word 0x832c1011  ! 205: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x8e042347  ! 205: ADD_I	add 	%r16, 0x0347, %r7
	.word 0xaa140011  ! 205: OR_R	or 	%r16, %r17, %r21
	.word 0x8b2c2001  ! 205: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0xb62c0011  ! 205: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x88040011  ! 205: ADD_R	add 	%r16, %r17, %r4
thr2_dc_err_15:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_15), 16, 16),1,DC_DATA,69)
	.word 0xd11c26b0  ! 207: LDDF_I	ldd	[%r16, 0x06b0], %f8
	.word 0xd2d4292e  ! 209: LDSHA_I	ldsha	[%r16, + 0x092e] %asi, %r9
	.word 0x8c840011  ! 211: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xb4c40011  ! 211: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0x8a0c29d1  ! 211: AND_I	and 	%r16, 0x09d1, %r5
	.word 0x8b7c0411  ! 211: MOVR_R	move	%r16, %r17, %r5
	.word 0xacbc2d96  ! 211: XNORcc_I	xnorcc 	%r16, 0x0d96, %r22
	.word 0xd65c0011  ! 212: LDX_R	ldx	[%r16 + %r17], %r11
	.word 0xccc41011  ! 214: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r6
	.word 0x94340011  ! 216: ORN_R	orn 	%r16, %r17, %r10
	.word 0x87342001  ! 216: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0xaf2c3001  ! 216: SLLX_I	sllx	%r16, 0x0001, %r23
	.word 0x820c0011  ! 216: AND_R	and 	%r16, %r17, %r1
	.word 0x923c2999  ! 216: XNOR_I	xnor 	%r16, 0x0999, %r9
	.word 0xb72c1011  ! 216: SLLX_R	sllx	%r16, %r17, %r27
	.word 0xd48c1011  ! 217: LDUBA_R	lduba	[%r16, %r17] 0x80, %r10
	.word 0xdd841011  ! 219: LDFA_R	lda	[%r16, %r17], %f14
	.word 0x8c9c26c4  ! 221: XORcc_I	xorcc 	%r16, 0x06c4, %r6
	.word 0x840c0011  ! 221: AND_R	and 	%r16, %r17, %r2
	.word 0xac3c0011  ! 221: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0xad641811  ! 221: MOVcc_R	<illegal instruction>
	.word 0x9eb40011  ! 221: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x84ac2c14  ! 221: ANDNcc_I	andncc 	%r16, 0x0c14, %r2
	.word 0x9e2c0011  ! 221: ANDN_R	andn 	%r16, %r17, %r15
thr2_dc_err_16:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_16), 16, 16),1,DC_DATA,22)
	.word 0xd51c0000  ! 223: LDDF_R	ldd	[%r16, %r0], %f10
thr2_irf_ce_22:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_22), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xde342711  ! 227: STH_I	sth	%r15, [%r16 + 0x0711]
	.word 0xa93c1011  ! 229: SRAX_R	srax	%r16, %r17, %r20
	.word 0x983c2d8f  ! 229: XNOR_I	xnor 	%r16, 0x0d8f, %r12
	.word 0xae440011  ! 229: ADDC_R	addc 	%r16, %r17, %r23
	.word 0x95341011  ! 229: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x8cc40011  ! 229: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0xb5341011  ! 229: SRLX_R	srlx	%r16, %r17, %r26
	.word 0xd2dc1011  ! 230: LDXA_R	ldxa	[%r16, %r17] 0x80, %r9
	.word 0xc8841011  ! 232: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r4
	.word 0x980c2afa  ! 234: AND_I	and 	%r16, 0x0afa, %r12
	.word 0x9834288a  ! 234: ORN_I	orn 	%r16, 0x088a, %r12
	.word 0xb0c42b5f  ! 234: ADDCcc_I	addccc 	%r16, 0x0b5f, %r24
	.word 0xaa1c0011  ! 234: XOR_R	xor 	%r16, %r17, %r21
	.word 0xb83c0011  ! 234: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xa80c2a67  ! 234: AND_I	and 	%r16, 0x0a67, %r20
	.word 0x8e940011  ! 234: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0x893c1011  ! 234: SRAX_R	srax	%r16, %r17, %r4
thr2_dc_err_17:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_17), 16, 16),1,DC_DATA,56)
	.word 0xc7142e23  ! 236: LDQF_I	-	[%r16, 0x0e23], %f3
	.word 0xd4942283  ! 238: LDUHA_I	lduha	[%r16, + 0x0283] %asi, %r10
	.word 0x94340011  ! 240: ORN_R	orn 	%r16, %r17, %r10
	.word 0x95643801  ! 240: MOVcc_I	<illegal instruction>
	.word 0xac3c2cad  ! 240: XNOR_I	xnor 	%r16, 0x0cad, %r22
	.word 0xa72c2001  ! 240: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0x882c2eba  ! 240: ANDN_I	andn 	%r16, 0x0eba, %r4
	.word 0xb93c2001  ! 240: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0x828c20a6  ! 240: ANDcc_I	andcc 	%r16, 0x00a6, %r1
thr2_dc_err_18:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_18), 16, 16),1,DC_DATA,4)
	.word 0xf4042378  ! 242: LDUW_I	lduw	[%r16 + 0x0378], %r26
	.word 0xc59c1011  ! 244: LDDFA_R	ldda	[%r16, %r17], %f2
	.word 0x8e840011  ! 246: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0xae1c2cf3  ! 246: XOR_I	xor 	%r16, 0x0cf3, %r23
	.word 0xba1c2c10  ! 246: XOR_I	xor 	%r16, 0x0c10, %r29
	.word 0x9a2c2528  ! 246: ANDN_I	andn 	%r16, 0x0528, %r13
	.word 0x8d2c3001  ! 246: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0xa61c25b7  ! 246: XOR_I	xor 	%r16, 0x05b7, %r19
thr2_dc_err_19:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_19), 16, 16),1,DC_DATA,15)
	.word 0xd2d421d8  ! 248: LDSHA_I	ldsha	[%r16, + 0x01d8] %asi, %r9
thr2_irf_ce_23:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_23), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xf2c41011  ! 250: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r25
	.word 0x993c1011  ! 252: SRAX_R	srax	%r16, %r17, %r12
	.word 0x9eb42a3a  ! 252: ORNcc_I	orncc 	%r16, 0x0a3a, %r15
	.word 0x8a340011  ! 252: ORN_R	orn 	%r16, %r17, %r5
	.word 0xacac0011  ! 252: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0x86bc0011  ! 252: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0xb2ac2e53  ! 252: ANDNcc_I	andncc 	%r16, 0x0e53, %r25
thr2_dc_err_20:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_20), 16, 16),1,DC_DATA,39)
	.word 0xca4c2744  ! 254: LDSB_I	ldsb	[%r16 + 0x0744], %r5
thr2_irf_ce_24:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_24), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xd11c20dc  ! 256: LDDF_I	ldd	[%r16, 0x00dc], %f8
	.word 0x8c0427fc  ! 258: ADD_I	add 	%r16, 0x07fc, %r6
	.word 0x889428c9  ! 258: ORcc_I	orcc 	%r16, 0x08c9, %r4
	.word 0xa8442540  ! 258: ADDC_I	addc 	%r16, 0x0540, %r20
	.word 0x9e442d49  ! 258: ADDC_I	addc 	%r16, 0x0d49, %r15
	.word 0x92ac2c29  ! 258: ANDNcc_I	andncc 	%r16, 0x0c29, %r9
	.word 0x91340011  ! 258: SRL_R	srl 	%r16, %r17, %r8
	.word 0xb2b42f40  ! 258: ORNcc_I	orncc 	%r16, 0x0f40, %r25
thr2_dc_err_21:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_21), 16, 16),1,DC_DATA,31)
	.word 0xef140000  ! 260: LDQF_R	-	[%r16, %r0], %f23
	.word 0xec0c2412  ! 262: LDUB_I	ldub	[%r16 + 0x0412], %r22
	.word 0x88c4214f  ! 264: ADDCcc_I	addccc 	%r16, 0x014f, %r4
	.word 0x9a140011  ! 264: OR_R	or 	%r16, %r17, %r13
	.word 0x89641811  ! 264: MOVcc_R	<illegal instruction>
	.word 0x8cb40011  ! 264: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0xbb7c0411  ! 264: MOVR_R	move	%r16, %r17, %r29
	.word 0x9a2c2bcf  ! 264: ANDN_I	andn 	%r16, 0x0bcf, %r13
	.word 0x993c2001  ! 264: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x9f341011  ! 264: SRLX_R	srlx	%r16, %r17, %r15
	.word 0xc20c2c6c  ! 265: LDUB_I	ldub	[%r16 + 0x0c6c], %r1
	.word 0xc88426e3  ! 267: LDUWA_I	lduwa	[%r16, + 0x06e3] %asi, %r4
	.word 0xaf3c0011  ! 269: SRA_R	sra 	%r16, %r17, %r23
	.word 0xaa8c2f4c  ! 269: ANDcc_I	andcc 	%r16, 0x0f4c, %r21
	.word 0x8e9c0011  ! 269: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x848c0011  ! 269: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x98040011  ! 269: ADD_R	add 	%r16, %r17, %r12
	.word 0xb82c21d1  ! 269: ANDN_I	andn 	%r16, 0x01d1, %r28
	.word 0xb68c0011  ! 269: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x8eb4298e  ! 270: ORNcc_I	orncc 	%r16, 0x098e, %r7
	.word 0xae940011  ! 270: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0x8e042fc4  ! 270: ADD_I	add 	%r16, 0x0fc4, %r7
	.word 0x92040011  ! 270: ADD_R	add 	%r16, %r17, %r9
	.word 0xa97c2401  ! 270: MOVR_I	move	%r16, 0x7fff9c24, %r20
	.word 0xb0bc2c89  ! 270: XNORcc_I	xnorcc 	%r16, 0x0c89, %r24
	.word 0x960c0011  ! 270: AND_R	and 	%r16, %r17, %r11
	rd      %pc, %r18
	set     0x20, %r17
thr2_dc_err_22:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_22), 16, 16),1,DC_DATA,12)
	.word 0xd2dc1000  ! 271: LDXA_R	ldxa	[%r16, %r0] 0x80, %r9
thr2_irf_ce_25:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_25), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	return     %r18 + 0x20
	.word 0x91641811  ! 274: MOVcc_R	<illegal instruction>
	.word 0xaa840011  ! 274: ADDcc_R	addcc 	%r16, %r17, %r21
	.word 0x993c2001  ! 274: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0xb52c0011  ! 274: SLL_R	sll 	%r16, %r17, %r26
	.word 0xb09c0011  ! 274: XORcc_R	xorcc 	%r16, %r17, %r24
thr2_dc_err_23:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_23), 16, 16),1,DC_DATA,53)
	.word 0xc91420bc  ! 276: LDQF_I	-	[%r16, 0x00bc], %f4
thr2_irf_ce_26:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_26), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xf65c2505  ! 278: LDX_I	ldx	[%r16 + 0x0505], %r27
	.word 0x840c0011  ! 280: AND_R	and 	%r16, %r17, %r2
	.word 0xaa9c2353  ! 280: XORcc_I	xorcc 	%r16, 0x0353, %r21
	.word 0xbb3c2001  ! 280: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0x83340011  ! 280: SRL_R	srl 	%r16, %r17, %r1
	.word 0x94340011  ! 280: ORN_R	orn 	%r16, %r17, %r10
	.word 0x9444234d  ! 280: ADDC_I	addc 	%r16, 0x034d, %r10
thr2_dc_err_24:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_24), 16, 16),1,DC_DATA,4)
	.word 0xc2140000  ! 282: LDUH_R	lduh	[%r16 + %r0], %r1
	.word 0xd65420b1  ! 284: LDSH_I	ldsh	[%r16 + 0x00b1], %r11
	.word 0xb33c1011  ! 286: SRAX_R	srax	%r16, %r17, %r25
	.word 0x9a940011  ! 286: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0xaf341011  ! 286: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xb72c3001  ! 286: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0xba8c0011  ! 286: ANDcc_R	andcc 	%r16, %r17, %r29
	.word 0xae8424f9  ! 286: ADDcc_I	addcc 	%r16, 0x04f9, %r23
	.word 0x9c942aa2  ! 286: ORcc_I	orcc 	%r16, 0x0aa2, %r14
	.word 0xb0442213  ! 286: ADDC_I	addc 	%r16, 0x0213, %r24
	.word 0xd0cc1011  ! 287: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r8
thr2_irf_ce_27:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_27), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xcc8c224b  ! 289: LDUBA_I	lduba	[%r16, + 0x024b] %asi, %r6
	.word 0x842c0011  ! 291: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x9a3c2875  ! 291: XNOR_I	xnor 	%r16, 0x0875, %r13
	.word 0xb12c2001  ! 291: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0x94ac2f5e  ! 291: ANDNcc_I	andncc 	%r16, 0x0f5e, %r10
	.word 0xb83c0011  ! 291: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xaaac0011  ! 291: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0x9c442a09  ! 291: ADDC_I	addc 	%r16, 0x0a09, %r14
	.word 0xc7841011  ! 292: LDFA_R	lda	[%r16, %r17], %f3
thr2_irf_ce_28:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_28), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xd2dc1011  ! 294: LDXA_R	ldxa	[%r16, %r17] 0x80, %r9
	.word 0x90bc2fa8  ! 296: XNORcc_I	xnorcc 	%r16, 0x0fa8, %r8
	.word 0x8f2c2001  ! 296: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0xad2c2001  ! 296: SLL_I	sll 	%r16, 0x0001, %r22
	.word 0x9a1c0011  ! 296: XOR_R	xor 	%r16, %r17, %r13
	.word 0x94042b23  ! 296: ADD_I	add 	%r16, 0x0b23, %r10
	.word 0x9b2c3001  ! 296: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x98c42949  ! 296: ADDCcc_I	addccc 	%r16, 0x0949, %r12
	.word 0xf8140011  ! 297: LDUH_R	lduh	[%r16 + %r17], %r28
thr2_irf_ce_29:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_29), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xce941011  ! 299: LDUHA_R	lduha	[%r16, %r17] 0x80, %r7
	.word 0x8e340011  ! 301: ORN_R	orn 	%r16, %r17, %r7
	.word 0xaaac28bb  ! 301: ANDNcc_I	andncc 	%r16, 0x08bb, %r21
	.word 0xab340011  ! 301: SRL_R	srl 	%r16, %r17, %r21
	.word 0x8e340011  ! 301: ORN_R	orn 	%r16, %r17, %r7
	.word 0x86c424ca  ! 301: ADDCcc_I	addccc 	%r16, 0x04ca, %r3
	.word 0x82b40011  ! 301: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0xaabc0011  ! 301: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0xd2d4272d  ! 302: LDSHA_I	ldsha	[%r16, + 0x072d] %asi, %r9
thr2_irf_ce_30:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_30), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xf1040011  ! 304: LDF_R	ld	[%r16, %r17], %f24
	.word 0x928c0011  ! 306: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0x91342001  ! 306: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0xa63c2864  ! 306: XNOR_I	xnor 	%r16, 0x0864, %r19
	.word 0x94440011  ! 306: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x9a8c0011  ! 306: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x8c842842  ! 306: ADDcc_I	addcc 	%r16, 0x0842, %r6
	.word 0x9a042b89  ! 306: ADD_I	add 	%r16, 0x0b89, %r13
	.word 0x88840011  ! 306: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0xc3841011  ! 307: LDFA_R	lda	[%r16, %r17], %f1
thr2_irf_ce_31:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_31), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xed1c26bd  ! 309: LDDF_I	ldd	[%r16, 0x06bd], %f22
	.word 0x8e2c2295  ! 311: ANDN_I	andn 	%r16, 0x0295, %r7
	.word 0xb2440011  ! 311: ADDC_R	addc 	%r16, %r17, %r25
	.word 0xb33c2001  ! 311: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0xb4440011  ! 311: ADDC_R	addc 	%r16, %r17, %r26
	.word 0xa92c0011  ! 311: SLL_R	sll 	%r16, %r17, %r20
	.word 0xde5c2f3c  ! 312: LDX_I	ldx	[%r16 + 0x0f3c], %r15
	.word 0xd89c1011  ! 314: LDDA_R	ldda	[%r16, %r17] 0x80, %r12
	.word 0x8a8c0011  ! 316: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0xa9342001  ! 316: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0x9cb424db  ! 316: ORNcc_I	orncc 	%r16, 0x04db, %r14
	.word 0x9a942ff2  ! 316: ORcc_I	orcc 	%r16, 0x0ff2, %r13
	.word 0xb5641811  ! 316: MOVcc_R	<illegal instruction>
	.word 0xb61c2b43  ! 316: XOR_I	xor 	%r16, 0x0b43, %r27
	.word 0xbb643801  ! 316: MOVcc_I	<illegal instruction>
thr2_dc_err_25:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_25), 16, 16),1,DC_DATA,5)
	.word 0xc2cc27f1  ! 318: LDSBA_I	ldsba	[%r16, + 0x07f1] %asi, %r1
thr2_irf_ce_32:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_32), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0x8143e029  ! 320: MEMBAR	membar	#LoadLoad | #StoreStore | #MemIssue 
	.word 0x94ac0011  ! 322: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xb2bc0011  ! 322: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0x8ebc2622  ! 322: XNORcc_I	xnorcc 	%r16, 0x0622, %r7
	.word 0xb6040011  ! 322: ADD_R	add 	%r16, %r17, %r27
	.word 0x8b7c2401  ! 322: MOVR_I	move	%r16, 0x7fff9c24, %r5
	.word 0xaab40011  ! 322: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0x9b7c0411  ! 322: MOVR_R	move	%r16, %r17, %r13
	.word 0x992c3001  ! 322: SLLX_I	sllx	%r16, 0x0001, %r12
thr2_dc_err_26:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_26), 16, 16),1,DC_DATA,47)
	.word 0xf8c42d6b  ! 324: LDSWA_I	ldswa	[%r16, + 0x0d6b] %asi, %r28
thr2_irf_ce_33:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_33), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xcc042ea0  ! 326: LDUW_I	lduw	[%r16 + 0x0ea0], %r6
	.word 0x883c2269  ! 328: XNOR_I	xnor 	%r16, 0x0269, %r4
	.word 0x84940011  ! 328: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x98440011  ! 328: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x88442585  ! 328: ADDC_I	addc 	%r16, 0x0585, %r4
	.word 0x86342611  ! 328: ORN_I	orn 	%r16, 0x0611, %r3
	.word 0x86040011  ! 328: ADD_R	add 	%r16, %r17, %r3
	.word 0x8a1424b6  ! 328: OR_I	or 	%r16, 0x04b6, %r5
	.word 0xf11c20bf  ! 329: LDDF_I	ldd	[%r16, 0x00bf], %f24
thr2_irf_ce_34:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_34), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xf4d429cf  ! 331: LDSHA_I	ldsha	[%r16, + 0x09cf] %asi, %r26
	.word 0x893c0011  ! 333: SRA_R	sra 	%r16, %r17, %r4
	.word 0x9b343001  ! 333: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0x9b3c2001  ! 333: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x9d641811  ! 333: MOVcc_R	<illegal instruction>
	.word 0xae9c0011  ! 333: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x973c2001  ! 333: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0xf64c2769  ! 334: LDSB_I	ldsb	[%r16 + 0x0769], %r27
	.word 0xc88424c9  ! 336: LDUWA_I	lduwa	[%r16, + 0x04c9] %asi, %r4
	.word 0x9f7c2401  ! 338: MOVR_I	move	%r16, 0x7fff9c24, %r15
	.word 0x873c1011  ! 338: SRAX_R	srax	%r16, %r17, %r3
	.word 0xb4940011  ! 338: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0x87343001  ! 338: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0xa82c2a29  ! 338: ANDN_I	andn 	%r16, 0x0a29, %r20
	.word 0x9e2c2ede  ! 338: ANDN_I	andn 	%r16, 0x0ede, %r15
thr2_dc_err_27:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_27), 16, 16),1,DC_DATA,46)
	.word 0xda5c2ab0  ! 340: LDX_I	ldx	[%r16 + 0x0ab0], %r13
thr2_irf_ce_35:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_35), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xd314286c  ! 342: LDQF_I	-	[%r16, 0x086c], %f9
	.word 0x843c0011  ! 344: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0x853c2001  ! 344: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0x8c2c285b  ! 344: ANDN_I	andn 	%r16, 0x085b, %r6
	.word 0x9b341011  ! 344: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x8abc0011  ! 344: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0x98040011  ! 344: ADD_R	add 	%r16, %r17, %r12
	.word 0xea4c2cff  ! 345: LDSB_I	ldsb	[%r16 + 0x0cff], %r21
thr2_irf_ce_36:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_36), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xc36c0011  ! 347: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0x917c0411  ! 349: MOVR_R	move	%r16, %r17, %r8
	.word 0x820c0011  ! 349: AND_R	and 	%r16, %r17, %r1
	.word 0x93643801  ! 349: MOVcc_I	<illegal instruction>
	.word 0xbabc2807  ! 349: XNORcc_I	xnorcc 	%r16, 0x0807, %r29
	.word 0x89343001  ! 349: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x90bc0011  ! 349: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0xe71c0011  ! 350: LDDF_R	ldd	[%r16, %r17], %f19
!Illinst alu
	.word 0xaa140011  ! 352: OR_R	or 	%r16, %r17, %r21
	.word 0x88940011  ! 354: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0xab7c2401  ! 354: MOVR_I	move	%r16, 0x7fff9c24, %r21
	.word 0x89340011  ! 354: SRL_R	srl 	%r16, %r17, %r4
	.word 0x8f2c3001  ! 354: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x8c3c0011  ! 354: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0xc6140011  ! 355: LDUH_R	lduh	[%r16 + %r17], %r3
	wr      %r0, 0x1, %asr26
	.word 0xae9c0011  ! 359: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x8e3c0011  ! 359: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xa92c1011  ! 359: SLLX_R	sllx	%r16, %r17, %r20
	.word 0x94bc2db0  ! 359: XNORcc_I	xnorcc 	%r16, 0x0db0, %r10
	.word 0x8234283d  ! 359: ORN_I	orn 	%r16, 0x083d, %r1
	.word 0x9e9c2897  ! 359: XORcc_I	xorcc 	%r16, 0x0897, %r15
	.word 0xea4c0011  ! 360: LDSB_R	ldsb	[%r16 + %r17], %r21
thr2_irf_ce_37:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_37), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xfa442a49  ! 362: LDSW_I	ldsw	[%r16 + 0x0a49], %r29
	.word 0x88140011  ! 364: OR_R	or 	%r16, %r17, %r4
	.word 0x901c0011  ! 364: XOR_R	xor 	%r16, %r17, %r8
	.word 0x9ebc25b1  ! 364: XNORcc_I	xnorcc 	%r16, 0x05b1, %r15
	.word 0x87340011  ! 364: SRL_R	srl 	%r16, %r17, %r3
	.word 0x937c0411  ! 364: MOVR_R	move	%r16, %r17, %r9
	.word 0xb8942454  ! 364: ORcc_I	orcc 	%r16, 0x0454, %r28
	.word 0x897c0411  ! 364: MOVR_R	move	%r16, %r17, %r4
	.word 0x923c25e1  ! 364: XNOR_I	xnor 	%r16, 0x05e1, %r9
	.word 0xdf941011  ! 365: LDQFA_R	-	[%r16, %r17], %f15
	.word 0xd1040011  ! 367: LDF_R	ld	[%r16, %r17], %f8
	.word 0xbb342001  ! 369: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0x92040011  ! 369: ADD_R	add 	%r16, %r17, %r9
	.word 0x8a040011  ! 369: ADD_R	add 	%r16, %r17, %r5
	.word 0x8d3c2001  ! 369: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0xb52c1011  ! 369: SLLX_R	sllx	%r16, %r17, %r26
	.word 0x9d7c2401  ! 369: MOVR_I	move	%r16, 0x7fff9c24, %r14
	.word 0xc9841011  ! 370: LDFA_R	lda	[%r16, %r17], %f4
thr2_irf_ce_38:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_38), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xf5040011  ! 372: LDF_R	ld	[%r16, %r17], %f26
	.word 0xb0142e72  ! 374: OR_I	or 	%r16, 0x0e72, %r24
	.word 0x8f3c2001  ! 374: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x9a1c0011  ! 374: XOR_R	xor 	%r16, %r17, %r13
	.word 0x982c2112  ! 374: ANDN_I	andn 	%r16, 0x0112, %r12
	.word 0x86b40011  ! 374: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0x86842ca6  ! 374: ADDcc_I	addcc 	%r16, 0x0ca6, %r3
	.word 0x9c1c0011  ! 374: XOR_R	xor 	%r16, %r17, %r14
	.word 0xd0040011  ! 375: LDUW_R	lduw	[%r16 + %r17], %r8
thr2_irf_ce_39:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_39), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xc644261d  ! 377: LDSW_I	ldsw	[%r16 + 0x061d], %r3
	.word 0x98342f3c  ! 379: ORN_I	orn 	%r16, 0x0f3c, %r12
	.word 0x968c0011  ! 379: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0xaa9c2c9d  ! 379: XORcc_I	xorcc 	%r16, 0x0c9d, %r21
	.word 0xb81c20cb  ! 379: XOR_I	xor 	%r16, 0x00cb, %r28
	.word 0x861c25f4  ! 379: XOR_I	xor 	%r16, 0x05f4, %r3
	.word 0x912c3001  ! 380: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x8c3c252c  ! 380: XNOR_I	xnor 	%r16, 0x052c, %r6
	.word 0x933c0011  ! 380: SRA_R	sra 	%r16, %r17, %r9
	.word 0x8f7c2401  ! 380: MOVR_I	move	%r16, 0x7fff9c24, %r7
	.word 0xb02c0011  ! 380: ANDN_R	andn 	%r16, %r17, %r24
	.word 0x90b42fe0  ! 380: ORNcc_I	orncc 	%r16, 0x0fe0, %r8
	.word 0x99342001  ! 380: SRL_I	srl 	%r16, 0x0001, %r12
	rd      %pc, %r18
	set     0x20, %r17
thr2_dc_err_28:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_28), 16, 16),1,DC_DATA,13)
	.word 0xed841000  ! 381: LDFA_R	lda	[%r16, %r0], %f22
thr2_irf_ce_40:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_40), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	return     %r18 + %r17
	.word 0x85340011  ! 384: SRL_R	srl 	%r16, %r17, %r2
	.word 0x888c0011  ! 384: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0xb40c0011  ! 384: AND_R	and 	%r16, %r17, %r26
	.word 0x92340011  ! 384: ORN_R	orn 	%r16, %r17, %r9
	.word 0xb0c42c1d  ! 384: ADDCcc_I	addccc 	%r16, 0x0c1d, %r24
	.word 0xa9643801  ! 384: MOVcc_I	<illegal instruction>
	.word 0x8aac0011  ! 384: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0xd8dc1011  ! 385: LDXA_R	ldxa	[%r16, %r17] 0x80, %r12
thr2_irf_ce_41:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_41), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xd22c218a  ! 389: STB_I	stb	%r9, [%r16 + 0x018a]
	.word 0xb92c2001  ! 391: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0x89342001  ! 391: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x881c264e  ! 391: XOR_I	xor 	%r16, 0x064e, %r4
	.word 0x8f3c2001  ! 391: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x9c3c0011  ! 391: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x88c426e8  ! 391: ADDCcc_I	addccc 	%r16, 0x06e8, %r4
	.word 0x949c21f4  ! 391: XORcc_I	xorcc 	%r16, 0x01f4, %r10
	.word 0x83343001  ! 391: SRLX_I	srlx	%r16, 0x0001, %r1
thr2_dc_err_29:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_29), 16, 16),1,DC_DATA,28)
	.word 0xecc41000  ! 393: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r22
	.word 0xdc5c0011  ! 395: LDX_R	ldx	[%r16 + %r17], %r14
	.word 0xba1c2142  ! 397: XOR_I	xor 	%r16, 0x0142, %r29
	.word 0x8cac0011  ! 397: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0xb12c0011  ! 397: SLL_R	sll 	%r16, %r17, %r24
	.word 0x943c0011  ! 397: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x96440011  ! 397: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x893c1011  ! 397: SRAX_R	srax	%r16, %r17, %r4
	.word 0x8b2c3001  ! 397: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x97340011  ! 397: SRL_R	srl 	%r16, %r17, %r11
	.word 0xdf04267b  ! 398: LDF_I	ld	[%r16, 0x067b], %f15
thr2_irf_ce_42:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_42), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xc8042030  ! 400: LDUW_I	lduw	[%r16 + 0x0030], %r4
	.word 0x941c0011  ! 402: XOR_R	xor 	%r16, %r17, %r10
	.word 0x99341011  ! 402: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x8d7c2401  ! 402: MOVR_I	move	%r16, 0x7fff9c24, %r6
	.word 0x82940011  ! 402: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x937c0411  ! 402: MOVR_R	move	%r16, %r17, %r9
	.word 0x8b7c2401  ! 402: MOVR_I	move	%r16, 0x7fff9c24, %r5
	.word 0x8ab40011  ! 402: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xb8bc0011  ! 402: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0xc4dc1011  ! 403: LDXA_R	ldxa	[%r16, %r17] 0x80, %r2
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0xb1343001  ! 407: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0x872c3001  ! 407: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x8d343001  ! 407: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0xae3c2f07  ! 407: XNOR_I	xnor 	%r16, 0x0f07, %r23
	.word 0x97641811  ! 407: MOVcc_R	<illegal instruction>
	.word 0xb7343001  ! 407: SRLX_I	srlx	%r16, 0x0001, %r27
thr2_dc_err_30:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_30), 16, 16),1,DC_DATA,7)
	.word 0xd19c1000  ! 409: LDDFA_R	ldda	[%r16, %r0], %f8
thr2_irf_ce_43:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_43), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xc7242dc8  ! 411: STF_I	st	%f3, [0x0dc8, %r16]
	.word 0x92142837  ! 413: OR_I	or 	%r16, 0x0837, %r9
	.word 0xbb341011  ! 413: SRLX_R	srlx	%r16, %r17, %r29
	.word 0x9e140011  ! 413: OR_R	or 	%r16, %r17, %r15
	.word 0x82bc232d  ! 413: XNORcc_I	xnorcc 	%r16, 0x032d, %r1
	.word 0xae140011  ! 413: OR_R	or 	%r16, %r17, %r23
	.word 0xc4d42f22  ! 414: LDSHA_I	ldsha	[%r16, + 0x0f22] %asi, %r2
	.word 0xf5040011  ! 416: LDF_R	ld	[%r16, %r17], %f26
	.word 0x922c2f8f  ! 418: ANDN_I	andn 	%r16, 0x0f8f, %r9
	.word 0xb4140011  ! 418: OR_R	or 	%r16, %r17, %r26
	.word 0x85342001  ! 418: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x93341011  ! 418: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x8cb40011  ! 418: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0xae3c0011  ! 418: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x8b3c1011  ! 418: SRAX_R	srax	%r16, %r17, %r5
	.word 0xded41011  ! 419: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r15
	.word 0xd4540011  ! 421: LDSH_R	ldsh	[%r16 + %r17], %r10
	.word 0xae140011  ! 423: OR_R	or 	%r16, %r17, %r23
	.word 0x86040011  ! 423: ADD_R	add 	%r16, %r17, %r3
	.word 0xa8ac289f  ! 423: ANDNcc_I	andncc 	%r16, 0x089f, %r20
	.word 0xa9341011  ! 423: SRLX_R	srlx	%r16, %r17, %r20
	.word 0x90c42944  ! 423: ADDCcc_I	addccc 	%r16, 0x0944, %r8
	.word 0xb33c0011  ! 423: SRA_R	sra 	%r16, %r17, %r25
	.word 0xd8140011  ! 424: LDUH_R	lduh	[%r16 + %r17], %r12
	.word 0xc36c2e00  ! 426: PREFETCH_I	prefetch	[%r16 + 0x0e00], #one_read
	.word 0xacb40011  ! 428: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0x82ac0011  ! 428: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x933c2001  ! 428: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x92140011  ! 428: OR_R	or 	%r16, %r17, %r9
	.word 0xb12c0011  ! 428: SLL_R	sll 	%r16, %r17, %r24
	.word 0x96bc0011  ! 428: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x873c0011  ! 428: SRA_R	sra 	%r16, %r17, %r3
	.word 0x8b3c0011  ! 428: SRA_R	sra 	%r16, %r17, %r5
	.word 0xc2941011  ! 429: LDUHA_R	lduha	[%r16, %r17] 0x80, %r1
thr2_irf_ce_44:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_44), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xc2742bb8  ! 433: STX_I	stx	%r1, [%r16 + 0x0bb8]
	.word 0xb6340011  ! 435: ORN_R	orn 	%r16, %r17, %r27
	.word 0xa8ac0011  ! 435: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0x933c2001  ! 435: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x977c0411  ! 435: MOVR_R	move	%r16, %r17, %r11
	.word 0x9d2c1011  ! 435: SLLX_R	sllx	%r16, %r17, %r14
thr2_dc_err_31:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_31), 16, 16),1,DC_DATA,30)
	.word 0xea042764  ! 437: LDUW_I	lduw	[%r16 + 0x0764], %r21
thr2_irf_ce_45:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_45), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xd1140011  ! 439: LDQF_R	-	[%r16, %r17], %f8
	.word 0x92140011  ! 441: OR_R	or 	%r16, %r17, %r9
	.word 0xb49c2ab9  ! 441: XORcc_I	xorcc 	%r16, 0x0ab9, %r26
	.word 0x8a042f93  ! 441: ADD_I	add 	%r16, 0x0f93, %r5
	.word 0xb88c0011  ! 441: ANDcc_R	andcc 	%r16, %r17, %r28
	.word 0x9cac0011  ! 441: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0xd88424b4  ! 442: LDUWA_I	lduwa	[%r16, + 0x04b4] %asi, %r12
thr2_irf_ce_46:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_46), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xf61c2f4c  ! 444: LDD_I	ldd	[%r16 + 0x0f4c], %r27
	.word 0xbac40011  ! 446: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0xac142c43  ! 446: OR_I	or 	%r16, 0x0c43, %r22
	.word 0x933c1011  ! 446: SRAX_R	srax	%r16, %r17, %r9
	.word 0x9d3c2001  ! 446: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x948c2135  ! 446: ANDcc_I	andcc 	%r16, 0x0135, %r10
	.word 0xc70420d8  ! 447: LDF_I	ld	[%r16, 0x00d8], %f3
thr2_irf_ce_47:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_47), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xecc41011  ! 449: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r22
	.word 0x9e442549  ! 451: ADDC_I	addc 	%r16, 0x0549, %r15
	.word 0xb6bc0011  ! 451: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0x8e942d77  ! 451: ORcc_I	orcc 	%r16, 0x0d77, %r7
	.word 0xba1c0011  ! 451: XOR_R	xor 	%r16, %r17, %r29
	.word 0xb2b40011  ! 451: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0x82ac24cf  ! 451: ANDNcc_I	andncc 	%r16, 0x04cf, %r1
	.word 0x942c2c0d  ! 451: ANDN_I	andn 	%r16, 0x0c0d, %r10
	.word 0x921c0011  ! 451: XOR_R	xor 	%r16, %r17, %r9
	.word 0xdc1c0011  ! 452: LDD_R	ldd	[%r16 + %r17], %r14
	.word 0xd6dc1011  ! 454: LDXA_R	ldxa	[%r16, %r17] 0x80, %r11
	.word 0x9cbc0011  ! 456: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0x87342001  ! 456: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0x96042a4c  ! 456: ADD_I	add 	%r16, 0x0a4c, %r11
	.word 0xb29c262f  ! 456: XORcc_I	xorcc 	%r16, 0x062f, %r25
	.word 0x9d342001  ! 456: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0xb08c0011  ! 456: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0xaebc26dc  ! 456: XNORcc_I	xnorcc 	%r16, 0x06dc, %r23
	.word 0x963c2fb3  ! 456: XNOR_I	xnor 	%r16, 0x0fb3, %r11
	.word 0xcd040011  ! 457: LDF_R	ld	[%r16, %r17], %f6
	.word 0xd6fc1011  ! 459: SWAPA_R	swapa	%r11, [%r16 + %r17] 0x80
	.word 0x962c2508  ! 461: ANDN_I	andn 	%r16, 0x0508, %r11
	.word 0x94140011  ! 461: OR_R	or 	%r16, %r17, %r10
	.word 0x82140011  ! 461: OR_R	or 	%r16, %r17, %r1
	.word 0x832c3001  ! 461: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x98bc0011  ! 461: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x88b40011  ! 461: ORNcc_R	orncc 	%r16, %r17, %r4
thr2_dc_err_32:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_32), 16, 16),1,DC_DATA,33)
	.word 0xf0cc1000  ! 463: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r24
!Illinst alu
	.word 0x8cac2c1a  ! 465: ANDNcc_I	andncc 	%r16, 0x0c1a, %r6
	.word 0x889c2bdb  ! 467: XORcc_I	xorcc 	%r16, 0x0bdb, %r4
	.word 0x952c1011  ! 467: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x9d3c1011  ! 467: SRAX_R	srax	%r16, %r17, %r14
	.word 0xba2c24d5  ! 467: ANDN_I	andn 	%r16, 0x04d5, %r29
	.word 0x940c2ed5  ! 467: AND_I	and 	%r16, 0x0ed5, %r10
	.word 0x9d2c1011  ! 467: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x881c2ed3  ! 467: XOR_I	xor 	%r16, 0x0ed3, %r4
	.word 0xf3941011  ! 468: LDQFA_R	-	[%r16, %r17], %f25
thr2_irf_ce_48:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_48), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xda941011  ! 470: LDUHA_R	lduha	[%r16, %r17] 0x80, %r13
	.word 0x932c2001  ! 472: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x8e2c2601  ! 472: ANDN_I	andn 	%r16, 0x0601, %r7
	.word 0x98ac0011  ! 472: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x84ac2c1d  ! 472: ANDNcc_I	andncc 	%r16, 0x0c1d, %r2
	.word 0x8c04297c  ! 472: ADD_I	add 	%r16, 0x097c, %r6
	.word 0xaab428f2  ! 472: ORNcc_I	orncc 	%r16, 0x08f2, %r21
	.word 0x86340011  ! 472: ORN_R	orn 	%r16, %r17, %r3
thr2_dc_err_33:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_33), 16, 16),1,DC_DATA,19)
	.word 0xcccc1000  ! 474: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r6
thr2_irf_ce_49:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_49), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xe624226e  ! 478: STW_I	stw	%r19, [%r16 + 0x026e]
	.word 0xb09c2377  ! 480: XORcc_I	xorcc 	%r16, 0x0377, %r24
	.word 0x98140011  ! 480: OR_R	or 	%r16, %r17, %r12
	.word 0xac9c295b  ! 480: XORcc_I	xorcc 	%r16, 0x095b, %r22
	.word 0xae3c0011  ! 480: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0xba442a7d  ! 480: ADDC_I	addc 	%r16, 0x0a7d, %r29
	.word 0x841c0011  ! 480: XOR_R	xor 	%r16, %r17, %r2
	.word 0x9aac0011  ! 480: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0xcac41011  ! 481: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r5
	.word 0xdf9c1011  ! 483: LDDFA_R	ldda	[%r16, %r17], %f15
	.word 0x98ac2564  ! 485: ANDNcc_I	andncc 	%r16, 0x0564, %r12
	.word 0x9e04297c  ! 485: ADD_I	add 	%r16, 0x097c, %r15
	.word 0x844421d1  ! 485: ADDC_I	addc 	%r16, 0x01d1, %r2
	.word 0x8e8c2c49  ! 485: ANDcc_I	andcc 	%r16, 0x0c49, %r7
	.word 0x952c2001  ! 485: SLL_I	sll 	%r16, 0x0001, %r10
thr2_dc_err_34:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_34), 16, 16),1,DC_DATA,20)
	.word 0xc5142be9  ! 487: LDQF_I	-	[%r16, 0x0be9], %f2
	.word 0xc2ec1011  ! 489: LDSTUBA_R	ldstuba	%r1, [%r16 + %r17] 0x80
	.word 0xb52c1011  ! 491: SLLX_R	sllx	%r16, %r17, %r26
	.word 0x980c2633  ! 491: AND_I	and 	%r16, 0x0633, %r12
	.word 0xa82c0011  ! 491: ANDN_R	andn 	%r16, %r17, %r20
	.word 0x977c0411  ! 491: MOVR_R	move	%r16, %r17, %r11
	.word 0xb6342ad0  ! 491: ORN_I	orn 	%r16, 0x0ad0, %r27
	.word 0xb2840011  ! 491: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0x937c0411  ! 491: MOVR_R	move	%r16, %r17, %r9
	.word 0x892c1011  ! 491: SLLX_R	sllx	%r16, %r17, %r4
	.word 0xc20c0011  ! 492: LDUB_R	ldub	[%r16 + %r17], %r1
	.word 0xd99c1011  ! 494: LDDFA_R	ldda	[%r16, %r17], %f12
	.word 0x868c27fd  ! 496: ANDcc_I	andcc 	%r16, 0x07fd, %r3
	.word 0x869c0011  ! 496: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0x908c2e55  ! 496: ANDcc_I	andcc 	%r16, 0x0e55, %r8
	.word 0x868c2004  ! 496: ANDcc_I	andcc 	%r16, 0x0004, %r3
	.word 0x9d7c0411  ! 496: MOVR_R	move	%r16, %r17, %r14
	.word 0x9f2c2001  ! 496: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0xd71c21a4  ! 497: LDDF_I	ldd	[%r16, 0x01a4], %f11
	.word 0xd3841011  ! 499: LDFA_R	lda	[%r16, %r17], %f9
	.word 0x90c4263e  ! 501: ADDCcc_I	addccc 	%r16, 0x063e, %r8
	.word 0xa72c2001  ! 501: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0xb4b4298f  ! 501: ORNcc_I	orncc 	%r16, 0x098f, %r26
	.word 0x993c1011  ! 501: SRAX_R	srax	%r16, %r17, %r12
	.word 0x95341011  ! 501: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x9c0c0011  ! 501: AND_R	and 	%r16, %r17, %r14
	.word 0x9a3c0011  ! 501: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x93341011  ! 501: SRLX_R	srlx	%r16, %r17, %r9
	.word 0xfa0c2685  ! 502: LDUB_I	ldub	[%r16 + 0x0685], %r29
        wr %g0, 0x4, %fprs
	.word 0xae1c2683  ! 506: XOR_I	xor 	%r16, 0x0683, %r23
	.word 0xb4940011  ! 506: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0x85343001  ! 506: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0xac042a46  ! 506: ADD_I	add 	%r16, 0x0a46, %r22
	.word 0x90940011  ! 506: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0xb17c2401  ! 506: MOVR_I	move	%r16, 0x7fff9c24, %r24
	.word 0x857c0411  ! 506: MOVR_R	move	%r16, %r17, %r2
	.word 0xb5643801  ! 506: MOVcc_I	<illegal instruction>
	.word 0xf61c238d  ! 507: LDD_I	ldd	[%r16 + 0x038d], %r27
	.word 0xd91c2e6e  ! 509: LDDF_I	ldd	[%r16, 0x0e6e], %f12
	.word 0xaeac0011  ! 511: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0x92b420c6  ! 511: ORNcc_I	orncc 	%r16, 0x00c6, %r9
	.word 0x82042335  ! 511: ADD_I	add 	%r16, 0x0335, %r1
	.word 0xa82c29a8  ! 511: ANDN_I	andn 	%r16, 0x09a8, %r20
	.word 0x941c2676  ! 511: XOR_I	xor 	%r16, 0x0676, %r10
	.word 0x88842697  ! 511: ADDcc_I	addcc 	%r16, 0x0697, %r4
	.word 0x98ac2554  ! 511: ANDNcc_I	andncc 	%r16, 0x0554, %r12
thr2_dc_err_35:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_35), 16, 16),1,DC_DATA,28)
	.word 0xdf841000  ! 513: LDFA_R	lda	[%r16, %r0], %f15
        wr %g0, 0x4, %fprs
	.word 0x8b2c2001  ! 517: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0xba3c0011  ! 517: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x93343001  ! 517: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x909c2e4e  ! 517: XORcc_I	xorcc 	%r16, 0x0e4e, %r8
	.word 0x8f2c0011  ! 517: SLL_R	sll 	%r16, %r17, %r7
	.word 0xb4b426b3  ! 517: ORNcc_I	orncc 	%r16, 0x06b3, %r26
	.word 0xaa4423a1  ! 517: ADDC_I	addc 	%r16, 0x03a1, %r21
	.word 0xca5c0011  ! 518: LDX_R	ldx	[%r16 + %r17], %r5
thr2_irf_ce_50:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_50), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xcad41011  ! 520: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r5
	.word 0xb32c3001  ! 522: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0xacbc0011  ! 522: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0x93641811  ! 522: MOVcc_R	<illegal instruction>
	.word 0x87341011  ! 522: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x8a3c0011  ! 522: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xc7140011  ! 523: LDQF_R	-	[%r16, %r17], %f3
!Illinst store
	.word 0xd0240011  ! 525: STW_R	stw	%r8, [%r16 + %r17]
	.word 0xb77c2401  ! 527: MOVR_I	move	%r16, 0x7fff9c24, %r27
	.word 0x864426de  ! 527: ADDC_I	addc 	%r16, 0x06de, %r3
	.word 0x832c2001  ! 527: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0x8f7c0411  ! 527: MOVR_R	move	%r16, %r17, %r7
	.word 0x912c3001  ! 527: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0xa80c0011  ! 527: AND_R	and 	%r16, %r17, %r20
	.word 0xa9343001  ! 527: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0xa81c293f  ! 527: XOR_I	xor 	%r16, 0x093f, %r20
thr2_dc_err_36:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_36), 16, 16),1,DC_DATA,52)
	.word 0xd59c1000  ! 529: LDDFA_R	ldda	[%r16, %r0], %f10
thr2_irf_ce_51:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_51), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xc84c257e  ! 531: LDSB_I	ldsb	[%r16 + 0x057e], %r4
	.word 0xb8b40011  ! 533: ORNcc_R	orncc 	%r16, %r17, %r28
	.word 0xae44238c  ! 533: ADDC_I	addc 	%r16, 0x038c, %r23
	.word 0x8e1c2a62  ! 533: XOR_I	xor 	%r16, 0x0a62, %r7
	.word 0x873c0011  ! 533: SRA_R	sra 	%r16, %r17, %r3
	.word 0xaeb42786  ! 533: ORNcc_I	orncc 	%r16, 0x0786, %r23
	.word 0xac140011  ! 533: OR_R	or 	%r16, %r17, %r22
	.word 0x9aac0011  ! 533: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0xecdc2e8e  ! 534: LDXA_I	ldxa	[%r16, + 0x0e8e] %asi, %r22
	.word 0xda0429bc  ! 536: LDUW_I	lduw	[%r16 + 0x09bc], %r13
	.word 0x91643801  ! 538: MOVcc_I	<illegal instruction>
	.word 0x8cb40011  ! 538: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x889c0011  ! 538: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0xbb3c0011  ! 538: SRA_R	sra 	%r16, %r17, %r29
	.word 0xaec429f1  ! 538: ADDCcc_I	addccc 	%r16, 0x09f1, %r23
thr2_dc_err_37:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_37), 16, 16),1,DC_DATA,46)
	.word 0xd89c1000  ! 540: LDDA_R	ldda	[%r16, %r0] 0x80, %r12
thr2_irf_ce_52:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_52), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd2742aab  ! 544: STX_I	stx	%r9, [%r16 + 0x0aab]
	.word 0x88340011  ! 546: ORN_R	orn 	%r16, %r17, %r4
	.word 0x90840011  ! 546: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x82b4234b  ! 546: ORNcc_I	orncc 	%r16, 0x034b, %r1
	.word 0x8e8c2526  ! 546: ANDcc_I	andcc 	%r16, 0x0526, %r7
	.word 0xb53c0011  ! 546: SRA_R	sra 	%r16, %r17, %r26
	.word 0xe7040011  ! 547: LDF_R	ld	[%r16, %r17], %f19
	.word 0x87a00151  ! 549: FABSd	fabsd	%f48, %f34
	.word 0x8eb427b4  ! 551: ORNcc_I	orncc 	%r16, 0x07b4, %r7
	.word 0x8e3c0011  ! 551: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x98142e3f  ! 551: OR_I	or 	%r16, 0x0e3f, %r12
	.word 0x9ec40011  ! 551: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0xb62c0011  ! 551: ANDN_R	andn 	%r16, %r17, %r27
	.word 0xd44421b3  ! 552: LDSW_I	ldsw	[%r16 + 0x01b3], %r10
	.word 0xf47425e9  ! 556: STX_I	stx	%r26, [%r16 + 0x05e9]
	.word 0x8b2c0011  ! 558: SLL_R	sll 	%r16, %r17, %r5
	.word 0x9cc40011  ! 558: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0xac3422eb  ! 558: ORN_I	orn 	%r16, 0x02eb, %r22
	.word 0x8d341011  ! 558: SRLX_R	srlx	%r16, %r17, %r6
	.word 0xbabc2168  ! 558: XNORcc_I	xnorcc 	%r16, 0x0168, %r29
	.word 0x888c2d12  ! 558: ANDcc_I	andcc 	%r16, 0x0d12, %r4
thr2_dc_err_38:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_38), 16, 16),1,DC_DATA,5)
	.word 0xd1140000  ! 560: LDQF_R	-	[%r16, %r0], %f8
	.word 0xa65c0011  ! 562: SMUL_R	smul 	%r16, %r17, %r19
	.word 0x9b7c2401  ! 564: MOVR_I	move	%r16, 0x7fff9c24, %r13
	.word 0x9c942375  ! 564: ORcc_I	orcc 	%r16, 0x0375, %r14
	.word 0x84942cbb  ! 564: ORcc_I	orcc 	%r16, 0x0cbb, %r2
	.word 0x972c0011  ! 564: SLL_R	sll 	%r16, %r17, %r11
	.word 0x822c0011  ! 564: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x921c2f33  ! 564: XOR_I	xor 	%r16, 0x0f33, %r9
	.word 0x849c2237  ! 564: XORcc_I	xorcc 	%r16, 0x0237, %r2
	.word 0x92c42367  ! 564: ADDCcc_I	addccc 	%r16, 0x0367, %r9
thr2_dc_err_39:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_39), 16, 16),1,DC_DATA,8)
	.word 0xc99c1000  ! 566: LDDFA_R	ldda	[%r16, %r0], %f4
thr2_irf_ce_53:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_53), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xcccc1011  ! 568: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r6
	.word 0xb21c0011  ! 570: XOR_R	xor 	%r16, %r17, %r25
	.word 0xaa1c0011  ! 570: XOR_R	xor 	%r16, %r17, %r21
	.word 0x968c0011  ! 570: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x8894200b  ! 570: ORcc_I	orcc 	%r16, 0x000b, %r4
	.word 0xb0940011  ! 570: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0xb6bc0011  ! 570: XNORcc_R	xnorcc 	%r16, %r17, %r27
thr2_dc_err_40:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_40), 16, 16),1,DC_DATA,1)
	.word 0xcc4c0000  ! 572: LDSB_R	ldsb	[%r16 + %r0], %r6
	.word 0x8143e004  ! 574: MEMBAR	membar	#LoadStore 
	.word 0xa97c2401  ! 576: MOVR_I	move	%r16, 0x7fff9c24, %r20
	.word 0x98140011  ! 576: OR_R	or 	%r16, %r17, %r12
	.word 0x8e442abc  ! 576: ADDC_I	addc 	%r16, 0x0abc, %r7
	.word 0x928c2c6b  ! 576: ANDcc_I	andcc 	%r16, 0x0c6b, %r9
	.word 0x98340011  ! 576: ORN_R	orn 	%r16, %r17, %r12
	.word 0xf6540011  ! 577: LDSH_R	ldsh	[%r16 + %r17], %r27
thr2_irf_ce_54:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_54), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xdb841011  ! 579: LDFA_R	lda	[%r16, %r17], %f13
	.word 0x841c2c90  ! 581: XOR_I	xor 	%r16, 0x0c90, %r2
	.word 0x8a0c2d5b  ! 581: AND_I	and 	%r16, 0x0d5b, %r5
	.word 0x9d341011  ! 581: SRLX_R	srlx	%r16, %r17, %r14
	.word 0xb52c0011  ! 581: SLL_R	sll 	%r16, %r17, %r26
	.word 0x8e2c2218  ! 581: ANDN_I	andn 	%r16, 0x0218, %r7
	.word 0xfa9c2e73  ! 582: LDDA_I	ldda	[%r16, + 0x0e73] %asi, %r29
thr2_irf_ce_55:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_55), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xe9040011  ! 584: LDF_R	ld	[%r16, %r17], %f20
	.word 0xb69c0011  ! 586: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0x8d2c0011  ! 586: SLL_R	sll 	%r16, %r17, %r6
	.word 0x868c0011  ! 586: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xa83c2a59  ! 586: XNOR_I	xnor 	%r16, 0x0a59, %r20
	.word 0x852c3001  ! 586: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0x8e840011  ! 586: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x853c1011  ! 586: SRAX_R	srax	%r16, %r17, %r2
thr2_dc_err_41:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_41), 16, 16),1,DC_DATA,1)
	.word 0xcac42053  ! 588: LDSWA_I	ldswa	[%r16, + 0x0053] %asi, %r5
thr2_irf_ce_56:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_56), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0x9cdc2b0c  ! 590: SMULcc_I	smulcc 	%r16, 0x0b0c, %r14
	.word 0x88040011  ! 592: ADD_R	add 	%r16, %r17, %r4
	.word 0x89341011  ! 592: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x8a1c0011  ! 592: XOR_R	xor 	%r16, %r17, %r5
	.word 0x8e0c22a7  ! 592: AND_I	and 	%r16, 0x02a7, %r7
	.word 0x96040011  ! 592: ADD_R	add 	%r16, %r17, %r11
thr2_dc_err_42:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_42), 16, 16),1,DC_DATA,50)
	.word 0xd3140000  ! 594: LDQF_R	-	[%r16, %r0], %f9
thr2_irf_ce_57:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_57), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xca4c2386  ! 596: LDSB_I	ldsb	[%r16 + 0x0386], %r5
	.word 0x983c0011  ! 598: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0x952c1011  ! 598: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x98140011  ! 598: OR_R	or 	%r16, %r17, %r12
	.word 0x89643801  ! 598: MOVcc_I	<illegal instruction>
	.word 0xa64428e3  ! 598: ADDC_I	addc 	%r16, 0x08e3, %r19
	.word 0x913c1011  ! 598: SRAX_R	srax	%r16, %r17, %r8
	.word 0x892c0011  ! 598: SLL_R	sll 	%r16, %r17, %r4
	.word 0xb0ac0011  ! 598: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0xe69c1011  ! 599: LDDA_R	ldda	[%r16, %r17] 0x80, %r19
	.word 0xf80c0011  ! 601: LDUB_R	ldub	[%r16 + %r17], %r28
	.word 0xb5341011  ! 603: SRLX_R	srlx	%r16, %r17, %r26
	.word 0x93341011  ! 603: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x9e2c0011  ! 603: ANDN_R	andn 	%r16, %r17, %r15
	.word 0xaf341011  ! 603: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xa7342001  ! 603: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0x88440011  ! 603: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x9eac0011  ! 603: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x8a9c0011  ! 603: XORcc_R	xorcc 	%r16, %r17, %r5
thr2_dc_err_43:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_43), 16, 16),1,DC_DATA,18)
	.word 0xce5c0000  ! 605: LDX_R	ldx	[%r16 + %r0], %r7
thr2_irf_ce_58:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_58), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xc3841011  ! 607: LDFA_R	lda	[%r16, %r17], %f1
	.word 0x972c1011  ! 609: SLLX_R	sllx	%r16, %r17, %r11
	.word 0x9a040011  ! 609: ADD_R	add 	%r16, %r17, %r13
	.word 0xb6b42c49  ! 609: ORNcc_I	orncc 	%r16, 0x0c49, %r27
	.word 0x997c0411  ! 609: MOVR_R	move	%r16, %r17, %r12
	.word 0x91641811  ! 609: MOVcc_R	<illegal instruction>
	.word 0xb404269e  ! 609: ADD_I	add 	%r16, 0x069e, %r26
	.word 0xb8842cdd  ! 609: ADDcc_I	addcc 	%r16, 0x0cdd, %r28
	.word 0x82142d14  ! 609: OR_I	or 	%r16, 0x0d14, %r1
thr2_dc_err_44:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_44), 16, 16),1,DC_DATA,22)
	.word 0xea442bfa  ! 611: LDSW_I	ldsw	[%r16 + 0x0bfa], %r21
thr2_irf_ce_59:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_59), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93340011  ! 615: SRL_R	srl 	%r16, %r17, %r9
	.word 0x953c0011  ! 615: SRA_R	sra 	%r16, %r17, %r10
	.word 0x9a940011  ! 615: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0xad341011  ! 615: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x98942100  ! 615: ORcc_I	orcc 	%r16, 0x0100, %r12
	.word 0x8aac0011  ! 615: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x94bc0011  ! 615: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0xd89425a7  ! 616: LDUHA_I	lduha	[%r16, + 0x05a7] %asi, %r12
thr2_irf_ce_60:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_60), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xfb140011  ! 618: LDQF_R	-	[%r16, %r17], %f29
	.word 0x9f343001  ! 620: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x9e042282  ! 620: ADD_I	add 	%r16, 0x0282, %r15
	.word 0xa83c0011  ! 620: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0x9e8c0011  ! 620: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x8a440011  ! 620: ADDC_R	addc 	%r16, %r17, %r5
	.word 0xb7643801  ! 620: MOVcc_I	<illegal instruction>
thr2_dc_err_45:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_45), 16, 16),1,DC_DATA,35)
	.word 0xde5c0000  ! 622: LDX_R	ldx	[%r16 + %r0], %r15
thr2_irf_ce_61:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_61), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xd85c2be2  ! 624: LDX_I	ldx	[%r16 + 0x0be2], %r12
	.word 0x880c0011  ! 626: AND_R	and 	%r16, %r17, %r4
	.word 0x92440011  ! 626: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x92342af8  ! 626: ORN_I	orn 	%r16, 0x0af8, %r9
	.word 0xa8c40011  ! 626: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x969c256b  ! 626: XORcc_I	xorcc 	%r16, 0x056b, %r11
	.word 0xba042ab2  ! 626: ADD_I	add 	%r16, 0x0ab2, %r29
	.word 0x9ac40011  ! 626: ADDCcc_R	addccc 	%r16, %r17, %r13
thr2_dc_err_46:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_46), 16, 16),1,DC_DATA,9)
	.word 0xdc941000  ! 628: LDUHA_R	lduha	[%r16, %r0] 0x80, %r14
thr2_irf_ce_62:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_62), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xc3ec1011  ! 630: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x86340011  ! 632: ORN_R	orn 	%r16, %r17, %r3
	.word 0x8cb40011  ! 632: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0xba940011  ! 632: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0xb4140011  ! 632: OR_R	or 	%r16, %r17, %r26
	.word 0x842c2e3a  ! 632: ANDN_I	andn 	%r16, 0x0e3a, %r2
	.word 0xcf14242e  ! 633: LDQF_I	-	[%r16, 0x042e], %f7
thr2_irf_ce_63:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_63), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xd8842e55  ! 635: LDUWA_I	lduwa	[%r16, + 0x0e55] %asi, %r12
	.word 0x972c2001  ! 637: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x8b2c3001  ! 637: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0xae8424ad  ! 637: ADDcc_I	addcc 	%r16, 0x04ad, %r23
	.word 0x98840011  ! 637: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0xb80c2bee  ! 637: AND_I	and 	%r16, 0x0bee, %r28
	.word 0x9d2c2001  ! 637: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0xde0429aa  ! 638: LDUW_I	lduw	[%r16 + 0x09aa], %r15
thr2_irf_ce_64:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_64), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xd71c2dae  ! 640: LDDF_I	ldd	[%r16, 0x0dae], %f11
	.word 0x889c0011  ! 642: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x90b426f6  ! 642: ORNcc_I	orncc 	%r16, 0x06f6, %r8
	.word 0xac3c28af  ! 642: XNOR_I	xnor 	%r16, 0x08af, %r22
	.word 0x8f3c1011  ! 642: SRAX_R	srax	%r16, %r17, %r7
	.word 0xac1c0011  ! 642: XOR_R	xor 	%r16, %r17, %r22
	.word 0xc49c1011  ! 643: LDDA_R	ldda	[%r16, %r17] 0x80, %r2
        wr %g0, 0x4, %fprs
	.word 0xab2c2001  ! 647: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0x9c440011  ! 647: ADDC_R	addc 	%r16, %r17, %r14
	.word 0x8e142c6b  ! 647: OR_I	or 	%r16, 0x0c6b, %r7
	.word 0x82040011  ! 647: ADD_R	add 	%r16, %r17, %r1
	.word 0x8eb40011  ! 647: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0xcf042a07  ! 648: LDF_I	ld	[%r16, 0x0a07], %f7
thr2_irf_ce_65:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_65), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
        wr %g0, 0x4, %fprs
	.word 0xba8427bf  ! 652: ADDcc_I	addcc 	%r16, 0x07bf, %r29
	.word 0x900c0011  ! 652: AND_R	and 	%r16, %r17, %r8
	.word 0xab342001  ! 652: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x9e9c2352  ! 652: XORcc_I	xorcc 	%r16, 0x0352, %r15
	.word 0xbb3c2001  ! 652: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0xf9142b51  ! 653: LDQF_I	-	[%r16, 0x0b51], %f28
	.word 0xdf841011  ! 655: LDFA_R	lda	[%r16, %r17], %f15
	.word 0x8c3c2d6d  ! 657: XNOR_I	xnor 	%r16, 0x0d6d, %r6
	.word 0xa8ac0011  ! 657: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0x85643801  ! 657: MOVcc_I	<illegal instruction>
	.word 0xae34296b  ! 657: ORN_I	orn 	%r16, 0x096b, %r23
	.word 0xa7341011  ! 657: SRLX_R	srlx	%r16, %r17, %r19
	.word 0xf2542e64  ! 658: LDSH_I	ldsh	[%r16 + 0x0e64], %r25
	.word 0xc39c1011  ! 660: LDDFA_R	ldda	[%r16, %r17], %f1
	.word 0xad7c2401  ! 662: MOVR_I	move	%r16, 0x7fff9c24, %r22
	.word 0x8eac0011  ! 662: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x9f643801  ! 662: MOVcc_I	<illegal instruction>
	.word 0xaa2c0011  ! 662: ANDN_R	andn 	%r16, %r17, %r21
	.word 0x8b2c3001  ! 662: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x92342890  ! 662: ORN_I	orn 	%r16, 0x0890, %r9
thr2_dc_err_47:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_47), 16, 16),1,DC_DATA,53)
	.word 0xc60c0000  ! 664: LDUB_R	ldub	[%r16 + %r0], %r3
thr2_irf_ce_66:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_66), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xd31426e2  ! 666: LDQF_I	-	[%r16, 0x06e2], %f9
	.word 0x9c2c0011  ! 668: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x96142e02  ! 668: OR_I	or 	%r16, 0x0e02, %r11
	.word 0xad3c2001  ! 668: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0x89342001  ! 668: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0xa634239e  ! 668: ORN_I	orn 	%r16, 0x039e, %r19
	.word 0xb72c0011  ! 668: SLL_R	sll 	%r16, %r17, %r27
	.word 0x94140011  ! 668: OR_R	or 	%r16, %r17, %r10
	.word 0x9c940011  ! 668: ORcc_R	orcc 	%r16, %r17, %r14
thr2_dc_err_48:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_48), 16, 16),1,DC_DATA,48)
	.word 0xe8540000  ! 670: LDSH_R	ldsh	[%r16 + %r0], %r20
	.word 0xc89c1011  ! 672: LDDA_R	ldda	[%r16, %r17] 0x80, %r4
	.word 0xb8c42fe1  ! 674: ADDCcc_I	addccc 	%r16, 0x0fe1, %r28
	.word 0x900c0011  ! 674: AND_R	and 	%r16, %r17, %r8
	.word 0x982c2b4c  ! 674: ANDN_I	andn 	%r16, 0x0b4c, %r12
	.word 0xaa440011  ! 674: ADDC_R	addc 	%r16, %r17, %r21
	.word 0x957c2401  ! 674: MOVR_I	move	%r16, 0x7fff9c24, %r10
thr2_dc_err_49:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_49), 16, 16),1,DC_DATA,32)
	.word 0xf0140000  ! 676: LDUH_R	lduh	[%r16 + %r0], %r24
thr2_irf_ce_67:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_67), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xde5c0011  ! 678: LDX_R	ldx	[%r16 + %r17], %r15
	.word 0x9b3c0011  ! 680: SRA_R	sra 	%r16, %r17, %r13
	.word 0xad643801  ! 680: MOVcc_I	<illegal instruction>
	.word 0x889c0011  ! 680: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0xb9343001  ! 680: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0xaa342af1  ! 680: ORN_I	orn 	%r16, 0x0af1, %r21
thr2_dc_err_50:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_50), 16, 16),1,DC_DATA,35)
	.word 0xdb140000  ! 682: LDQF_R	-	[%r16, %r0], %f13
	.word 0xd9841011  ! 684: LDFA_R	lda	[%r16, %r17], %f12
	.word 0xb2b40011  ! 686: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0x822c254c  ! 686: ANDN_I	andn 	%r16, 0x054c, %r1
	.word 0x8f3c2001  ! 686: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0xbb343001  ! 686: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0x9b2c3001  ! 686: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0xb93c1011  ! 686: SRAX_R	srax	%r16, %r17, %r28
	.word 0x9b340011  ! 686: SRL_R	srl 	%r16, %r17, %r13
	.word 0x8b7c0411  ! 686: MOVR_R	move	%r16, %r17, %r5
	.word 0xd8dc2c4a  ! 687: LDXA_I	ldxa	[%r16, + 0x0c4a] %asi, %r12
thr2_irf_ce_68:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_68), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xc3ec29bd  ! 689: PREFETCHA_I	prefetcha	[%r16, + 0x09bd] %asi, #one_read
	.word 0x9b3c2001  ! 691: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0xb43c2eff  ! 691: XNOR_I	xnor 	%r16, 0x0eff, %r26
	.word 0xa8140011  ! 691: OR_R	or 	%r16, %r17, %r20
	.word 0xb8842af8  ! 691: ADDcc_I	addcc 	%r16, 0x0af8, %r28
	.word 0x91643801  ! 691: MOVcc_I	<illegal instruction>
	.word 0x9f3c0011  ! 691: SRA_R	sra 	%r16, %r17, %r15
	.word 0xc4c42b77  ! 692: LDSWA_I	ldswa	[%r16, + 0x0b77] %asi, %r2
	.word 0xd0942473  ! 694: LDUHA_I	lduha	[%r16, + 0x0473] %asi, %r8
	.word 0xb2140011  ! 696: OR_R	or 	%r16, %r17, %r25
	.word 0xb20c2085  ! 696: AND_I	and 	%r16, 0x0085, %r25
	.word 0x8b342001  ! 696: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x822c2a38  ! 696: ANDN_I	andn 	%r16, 0x0a38, %r1
	.word 0x9c340011  ! 696: ORN_R	orn 	%r16, %r17, %r14
	.word 0x9a842ca2  ! 696: ADDcc_I	addcc 	%r16, 0x0ca2, %r13
	.word 0xad2c1011  ! 696: SLLX_R	sllx	%r16, %r17, %r22
	.word 0x8e442461  ! 696: ADDC_I	addc 	%r16, 0x0461, %r7
thr2_dc_err_51:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_51), 16, 16),1,DC_DATA,40)
	.word 0xd65c0000  ! 698: LDX_R	ldx	[%r16 + %r0], %r11
	.word 0xcb1c2f2e  ! 700: LDDF_I	ldd	[%r16, 0x0f2e], %f5
	.word 0x93342001  ! 702: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x8d341011  ! 702: SRLX_R	srlx	%r16, %r17, %r6
	.word 0x962c2f82  ! 702: ANDN_I	andn 	%r16, 0x0f82, %r11
	.word 0x822c2c0e  ! 702: ANDN_I	andn 	%r16, 0x0c0e, %r1
	.word 0xb93c0011  ! 702: SRA_R	sra 	%r16, %r17, %r28
	.word 0x98b4260e  ! 702: ORNcc_I	orncc 	%r16, 0x060e, %r12
	.word 0x943c0011  ! 702: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x9f343001  ! 702: SRLX_I	srlx	%r16, 0x0001, %r15
thr2_dc_err_52:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_52), 16, 16),1,DC_DATA,65)
	.word 0xc4cc238d  ! 704: LDSBA_I	ldsba	[%r16, + 0x038d] %asi, %r2
	.word 0xc9142493  ! 706: LDQF_I	-	[%r16, 0x0493], %f4
	.word 0xb13c2001  ! 708: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0xb53c1011  ! 708: SRAX_R	srax	%r16, %r17, %r26
	.word 0xa6142f86  ! 708: OR_I	or 	%r16, 0x0f86, %r19
	.word 0x843c0011  ! 708: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0x9c442f6f  ! 708: ADDC_I	addc 	%r16, 0x0f6f, %r14
	.word 0xae040011  ! 708: ADD_R	add 	%r16, %r17, %r23
thr2_dc_err_53:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_53), 16, 16),1,DC_DATA,39)
	.word 0xd80c2714  ! 710: LDUB_I	ldub	[%r16 + 0x0714], %r12
thr2_irf_ce_69:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_69), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xc25c0011  ! 712: LDX_R	ldx	[%r16 + %r17], %r1
	.word 0x932c1011  ! 714: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x86140011  ! 714: OR_R	or 	%r16, %r17, %r3
	.word 0x8f343001  ! 714: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x8d3c2001  ! 714: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0xb43c0011  ! 714: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x8a440011  ! 714: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x9d7c2401  ! 714: MOVR_I	move	%r16, 0x7fff9c24, %r14
	.word 0xb09c2b63  ! 714: XORcc_I	xorcc 	%r16, 0x0b63, %r24
thr2_dc_err_54:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_54), 16, 16),1,DC_DATA,23)
	.word 0xd79c1000  ! 716: LDDFA_R	ldda	[%r16, %r0], %f11
thr2_irf_ce_70:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_70), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xec2c2fcc  ! 720: STB_I	stb	%r22, [%r16 + 0x0fcc]
	.word 0x889428cf  ! 722: ORcc_I	orcc 	%r16, 0x08cf, %r4
	.word 0xb72c0011  ! 722: SLL_R	sll 	%r16, %r17, %r27
	.word 0x92bc294a  ! 722: XNORcc_I	xnorcc 	%r16, 0x094a, %r9
	.word 0xb32c2001  ! 722: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0x88842e84  ! 722: ADDcc_I	addcc 	%r16, 0x0e84, %r4
thr2_dc_err_55:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_55), 16, 16),1,DC_DATA,62)
	.word 0xd6c427a5  ! 724: LDSWA_I	ldswa	[%r16, + 0x07a5] %asi, %r11
thr2_irf_ce_71:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_71), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xef140011  ! 726: LDQF_R	-	[%r16, %r17], %f23
	.word 0x9eac0011  ! 728: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x93340011  ! 728: SRL_R	srl 	%r16, %r17, %r9
	.word 0x997c0411  ! 728: MOVR_R	move	%r16, %r17, %r12
	.word 0x9c9c2bdb  ! 728: XORcc_I	xorcc 	%r16, 0x0bdb, %r14
	.word 0x948c0011  ! 728: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0xbb643801  ! 728: MOVcc_I	<illegal instruction>
	.word 0x84142e75  ! 728: OR_I	or 	%r16, 0x0e75, %r2
thr2_dc_err_56:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_56), 16, 16),1,DC_DATA,52)
	.word 0xd8c41000  ! 730: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r12
thr2_irf_ce_72:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_72), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0x9a742691  ! 732: UDIV_I	udiv 	%r16, 0x0691, %r13
	.word 0x9a342f32  ! 734: ORN_I	orn 	%r16, 0x0f32, %r13
	.word 0xa68c0011  ! 734: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0x98442576  ! 734: ADDC_I	addc 	%r16, 0x0576, %r12
	.word 0x84840011  ! 734: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x849c2559  ! 734: XORcc_I	xorcc 	%r16, 0x0559, %r2
thr2_dc_err_57:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_57), 16, 16),1,DC_DATA,63)
	.word 0xf28c1000  ! 736: LDUBA_R	lduba	[%r16, %r0] 0x80, %r25
thr2_irf_ce_73:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_73), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0x94d42080  ! 738: UMULcc_I	umulcc 	%r16, 0x0080, %r10
	.word 0x86c42b1e  ! 740: ADDCcc_I	addccc 	%r16, 0x0b1e, %r3
	.word 0xa89c2fe7  ! 740: XORcc_I	xorcc 	%r16, 0x0fe7, %r20
	.word 0x8e2c2250  ! 740: ANDN_I	andn 	%r16, 0x0250, %r7
	.word 0xac440011  ! 740: ADDC_R	addc 	%r16, %r17, %r22
	.word 0xb6ac0011  ! 740: ANDNcc_R	andncc 	%r16, %r17, %r27
thr2_dc_err_58:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_58), 16, 16),1,DC_DATA,71)
	.word 0xd9042575  ! 742: LDF_I	ld	[%r16, 0x0575], %f12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xaa1c2e76  ! 746: XOR_I	xor 	%r16, 0x0e76, %r21
	.word 0xb63c2e18  ! 746: XNOR_I	xnor 	%r16, 0x0e18, %r27
	.word 0x8d341011  ! 746: SRLX_R	srlx	%r16, %r17, %r6
	.word 0x8a142222  ! 746: OR_I	or 	%r16, 0x0222, %r5
	.word 0x913c1011  ! 746: SRAX_R	srax	%r16, %r17, %r8
	.word 0x9c1c2bcd  ! 746: XOR_I	xor 	%r16, 0x0bcd, %r14
	.word 0x95643801  ! 746: MOVcc_I	<illegal instruction>
	.word 0xdac41011  ! 747: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r13
thr2_irf_ce_74:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_74), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
thr2_resum_intr_761:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_761), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0xaabc2643  ! 751: XNORcc_I	xnorcc 	%r16, 0x0643, %r21
	.word 0xb40c0011  ! 751: AND_R	and 	%r16, %r17, %r26
	.word 0x8b3c0011  ! 751: SRA_R	sra 	%r16, %r17, %r5
	.word 0xb73c1011  ! 751: SRAX_R	srax	%r16, %r17, %r27
	.word 0x8d3c2001  ! 751: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0x897c2401  ! 751: MOVR_I	move	%r16, 0x7fff9c24, %r4
	.word 0xaeac2017  ! 751: ANDNcc_I	andncc 	%r16, 0x0017, %r23
	.word 0x961c2ac5  ! 751: XOR_I	xor 	%r16, 0x0ac5, %r11
	.word 0xca9c251e  ! 752: LDDA_I	ldda	[%r16, + 0x051e] %asi, %r5
        wr %g0, 0x4, %fprs
	.word 0x8e8c0011  ! 756: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x9cac0011  ! 756: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0x9a1c2141  ! 756: XOR_I	xor 	%r16, 0x0141, %r13
	.word 0x8c2c268b  ! 756: ANDN_I	andn 	%r16, 0x068b, %r6
	.word 0x962c2e98  ! 756: ANDN_I	andn 	%r16, 0x0e98, %r11
	.word 0xbab42155  ! 756: ORNcc_I	orncc 	%r16, 0x0155, %r29
	.word 0x8e3c2a12  ! 756: XNOR_I	xnor 	%r16, 0x0a12, %r7
	.word 0x9ab40011  ! 757: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0xb5641811  ! 757: MOVcc_R	<illegal instruction>
	.word 0xa72c3001  ! 757: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0xac442eea  ! 757: ADDC_I	addc 	%r16, 0x0eea, %r22
	.word 0x912c0011  ! 757: SLL_R	sll 	%r16, %r17, %r8
	.word 0xaf7c2401  ! 757: MOVR_I	move	%r16, 0x7fff9c24, %r23
	.word 0x872c0011  ! 757: SLL_R	sll 	%r16, %r17, %r3
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xc31c0011  ! 757: LDDF_R	ldd	[%r16, %r17], %f1
thr2_irf_ce_75:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_75), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	return     %r18 + %r17
	.word 0x9f2c3001  ! 760: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x8c9c2202  ! 760: XORcc_I	xorcc 	%r16, 0x0202, %r6
	.word 0x8b3c2001  ! 760: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0xacb4242a  ! 760: ORNcc_I	orncc 	%r16, 0x042a, %r22
	.word 0x9f342001  ! 760: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x8f7c2401  ! 760: MOVR_I	move	%r16, 0x7fff9c24, %r7
	.word 0x9c2c2b37  ! 760: ANDN_I	andn 	%r16, 0x0b37, %r14
	.word 0xc5042a5a  ! 761: LDF_I	ld	[%r16, 0x0a5a], %f2
	.word 0xc28c1011  ! 763: LDUBA_R	lduba	[%r16, %r17] 0x80, %r1
	.word 0xa6ac0011  ! 765: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0x940c0011  ! 765: AND_R	and 	%r16, %r17, %r10
	.word 0xb2840011  ! 765: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0x842c0011  ! 765: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x9484256e  ! 765: ADDcc_I	addcc 	%r16, 0x056e, %r10
thr2_dc_err_59:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_59), 16, 16),1,DC_DATA,18)
	.word 0xc8c42df3  ! 767: LDSWA_I	ldswa	[%r16, + 0x0df3] %asi, %r4
	wr      %r0, 0x5, %asr26
	.word 0xb4ac260b  ! 771: ANDNcc_I	andncc 	%r16, 0x060b, %r26
	.word 0x988c25f3  ! 771: ANDcc_I	andcc 	%r16, 0x05f3, %r12
	.word 0xbb7c0411  ! 771: MOVR_R	move	%r16, %r17, %r29
	.word 0x9a3c2953  ! 771: XNOR_I	xnor 	%r16, 0x0953, %r13
	.word 0x9d2c0011  ! 771: SLL_R	sll 	%r16, %r17, %r14
	.word 0xd4942ae7  ! 772: LDUHA_I	lduha	[%r16, + 0x0ae7] %asi, %r10
        wr %g0, 0x4, %fprs
	.word 0x9f643801  ! 776: MOVcc_I	<illegal instruction>
	.word 0x8cb422fb  ! 776: ORNcc_I	orncc 	%r16, 0x02fb, %r6
	.word 0xb8b42d78  ! 776: ORNcc_I	orncc 	%r16, 0x0d78, %r28
	.word 0x9d3c2001  ! 776: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x8c3c0011  ! 776: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0xa8842907  ! 776: ADDcc_I	addcc 	%r16, 0x0907, %r20
	.word 0xf2dc2ae3  ! 777: LDXA_I	ldxa	[%r16, + 0x0ae3] %asi, %r25
	.word 0xd9841011  ! 779: LDFA_R	lda	[%r16, %r17], %f12
	.word 0x8f7c2401  ! 781: MOVR_I	move	%r16, 0x7fff9c24, %r7
	.word 0x8aac0011  ! 781: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x849c0011  ! 781: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x8d3c2001  ! 781: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0x902c0011  ! 781: ANDN_R	andn 	%r16, %r17, %r8
	.word 0xced41011  ! 782: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r7
thr2_irf_ce_76:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_76), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xef841011  ! 784: LDFA_R	lda	[%r16, %r17], %f23
	.word 0x86840011  ! 786: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0xac3c0011  ! 786: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x9e042ee2  ! 786: ADD_I	add 	%r16, 0x0ee2, %r15
	.word 0x888c2241  ! 786: ANDcc_I	andcc 	%r16, 0x0241, %r4
	.word 0x960c0011  ! 786: AND_R	and 	%r16, %r17, %r11
	.word 0x9a0c0011  ! 786: AND_R	and 	%r16, %r17, %r13
	.word 0x9a2c0011  ! 786: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x8e8c2951  ! 786: ANDcc_I	andcc 	%r16, 0x0951, %r7
	.word 0xfb040011  ! 787: LDF_R	ld	[%r16, %r17], %f29
thr2_irf_ce_77:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_77), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xcc3428ab  ! 791: STH_I	sth	%r6, [%r16 + 0x08ab]
	.word 0xb12c1011  ! 793: SLLX_R	sllx	%r16, %r17, %r24
	.word 0x88040011  ! 793: ADD_R	add 	%r16, %r17, %r4
	.word 0x89343001  ! 793: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x941c0011  ! 793: XOR_R	xor 	%r16, %r17, %r10
	.word 0xb73c0011  ! 793: SRA_R	sra 	%r16, %r17, %r27
	.word 0x9a1c2f1d  ! 793: XOR_I	xor 	%r16, 0x0f1d, %r13
	.word 0xb4ac2f40  ! 793: ANDNcc_I	andncc 	%r16, 0x0f40, %r26
	.word 0xb2c40011  ! 793: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0xd294219d  ! 794: LDUHA_I	lduha	[%r16, + 0x019d] %asi, %r9
thr2_irf_ce_78:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_78), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xcd9c1011  ! 796: LDDFA_R	ldda	[%r16, %r17], %f6
	.word 0x843c271d  ! 798: XNOR_I	xnor 	%r16, 0x071d, %r2
	.word 0xa69c0011  ! 798: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x96bc2cbf  ! 798: XNORcc_I	xnorcc 	%r16, 0x0cbf, %r11
	.word 0x8a3c21d1  ! 798: XNOR_I	xnor 	%r16, 0x01d1, %r5
	.word 0x98c40011  ! 798: ADDCcc_R	addccc 	%r16, %r17, %r12
thr2_dc_err_60:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_60), 16, 16),1,DC_DATA,41)
	.word 0xec9c1000  ! 800: LDDA_R	ldda	[%r16, %r0] 0x80, %r22
thr2_irf_ce_79:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_79), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	ta	T_CHANGE_HPRIV	! macro
	.word 0x92842284  ! 804: ADDcc_I	addcc 	%r16, 0x0284, %r9
	.word 0xb33c2001  ! 804: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0x9a3c0011  ! 804: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0xac142886  ! 804: OR_I	or 	%r16, 0x0886, %r22
	.word 0x992c0011  ! 804: SLL_R	sll 	%r16, %r17, %r12
	.word 0xd85c0011  ! 805: LDX_R	ldx	[%r16 + %r17], %r12
thr2_irf_ce_80:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_80), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xda442cd0  ! 807: LDSW_I	ldsw	[%r16 + 0x0cd0], %r13
	.word 0x880c0011  ! 809: AND_R	and 	%r16, %r17, %r4
	.word 0x828c262e  ! 809: ANDcc_I	andcc 	%r16, 0x062e, %r1
	.word 0x96340011  ! 809: ORN_R	orn 	%r16, %r17, %r11
	.word 0x832c1011  ! 809: SLLX_R	sllx	%r16, %r17, %r1
	.word 0xb60c2fbc  ! 809: AND_I	and 	%r16, 0x0fbc, %r27
	.word 0x93643801  ! 809: MOVcc_I	<illegal instruction>
	.word 0xb2bc2eae  ! 809: XNORcc_I	xnorcc 	%r16, 0x0eae, %r25
	.word 0xaa1c0011  ! 809: XOR_R	xor 	%r16, %r17, %r21
	.word 0xda4422b4  ! 810: LDSW_I	ldsw	[%r16 + 0x02b4], %r13
thr2_irf_ce_81:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_81), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0x06800003  ! 812: BL	bl  	<label_0x3>
	.word 0xb4042ac9  ! 814: ADD_I	add 	%r16, 0x0ac9, %r26
	.word 0xb4840011  ! 814: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0xb00c2500  ! 814: AND_I	and 	%r16, 0x0500, %r24
	.word 0x86040011  ! 814: ADD_R	add 	%r16, %r17, %r3
	.word 0x992c2001  ! 814: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0xef1c0011  ! 815: LDDF_R	ldd	[%r16, %r17], %f23
thr2_irf_ce_82:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_82), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xc9941011  ! 817: LDQFA_R	-	[%r16, %r17], %f4
	.word 0x8e1423e5  ! 819: OR_I	or 	%r16, 0x03e5, %r7
	.word 0x8f2c3001  ! 819: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0xa7643801  ! 819: MOVcc_I	<illegal instruction>
	.word 0x9eb40011  ! 819: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0xb6040011  ! 819: ADD_R	add 	%r16, %r17, %r27
	.word 0x9c342cf6  ! 819: ORN_I	orn 	%r16, 0x0cf6, %r14
	.word 0x8ec40011  ! 819: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0x9e942407  ! 819: ORcc_I	orcc 	%r16, 0x0407, %r15
	.word 0xcb140011  ! 820: LDQF_R	-	[%r16, %r17], %f5
!Illinst store
	.word 0xec340011  ! 822: STH_R	sth	%r22, [%r16 + %r17]
	.word 0x8e4428c0  ! 824: ADDC_I	addc 	%r16, 0x08c0, %r7
	.word 0xaf2c3001  ! 824: SLLX_I	sllx	%r16, 0x0001, %r23
	.word 0xac440011  ! 824: ADDC_R	addc 	%r16, %r17, %r22
	.word 0xac042ed1  ! 824: ADD_I	add 	%r16, 0x0ed1, %r22
	.word 0xac0c0011  ! 824: AND_R	and 	%r16, %r17, %r22
	.word 0x94c426f5  ! 824: ADDCcc_I	addccc 	%r16, 0x06f5, %r10
	.word 0x9e3c0011  ! 824: XNOR_R	xnor 	%r16, %r17, %r15
thr2_dc_err_61:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_61), 16, 16),1,DC_DATA,7)
	.word 0xf31c25f2  ! 826: LDDF_I	ldd	[%r16, 0x05f2], %f25
	.word 0x16800004  ! 828: BGE	bge  	<label_0x4>
	.word 0x8d3c2001  ! 830: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0x849c28ca  ! 830: XORcc_I	xorcc 	%r16, 0x08ca, %r2
	.word 0x8eb40011  ! 830: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0x9c1c2793  ! 830: XOR_I	xor 	%r16, 0x0793, %r14
	.word 0x840c0011  ! 830: AND_R	and 	%r16, %r17, %r2
thr2_dc_err_62:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_62), 16, 16),1,DC_DATA,34)
	.word 0xf2dc1000  ! 832: LDXA_R	ldxa	[%r16, %r0] 0x80, %r25
	.word 0xca842afc  ! 834: LDUWA_I	lduwa	[%r16, + 0x0afc] %asi, %r5
	.word 0x832c0011  ! 836: SLL_R	sll 	%r16, %r17, %r1
	.word 0x92ac0011  ! 836: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x96ac2647  ! 836: ANDNcc_I	andncc 	%r16, 0x0647, %r11
	.word 0xac8c2ce0  ! 836: ANDcc_I	andcc 	%r16, 0x0ce0, %r22
	.word 0x8884262d  ! 836: ADDcc_I	addcc 	%r16, 0x062d, %r4
thr2_dc_err_63:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_63), 16, 16),1,DC_DATA,50)
	.word 0xcf140000  ! 838: LDQF_R	-	[%r16, %r0], %f7
	.word 0xc41428ec  ! 840: LDUH_I	lduh	[%r16 + 0x08ec], %r2
	.word 0x941c0011  ! 842: XOR_R	xor 	%r16, %r17, %r10
	.word 0xac140011  ! 842: OR_R	or 	%r16, %r17, %r22
	.word 0x9e3427fd  ! 842: ORN_I	orn 	%r16, 0x07fd, %r15
	.word 0x943c0011  ! 842: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x9f340011  ! 842: SRL_R	srl 	%r16, %r17, %r15
	.word 0x953c2001  ! 842: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0xea9c2473  ! 843: LDDA_I	ldda	[%r16, + 0x0473] %asi, %r21
	.word 0xdcd42360  ! 845: LDSHA_I	ldsha	[%r16, + 0x0360] %asi, %r14
	.word 0x9a84279f  ! 847: ADDcc_I	addcc 	%r16, 0x079f, %r13
	.word 0xb8c424af  ! 847: ADDCcc_I	addccc 	%r16, 0x04af, %r28
	.word 0xaf7c0411  ! 847: MOVR_R	move	%r16, %r17, %r23
	.word 0xb8440011  ! 847: ADDC_R	addc 	%r16, %r17, %r28
	.word 0x96340011  ! 847: ORN_R	orn 	%r16, %r17, %r11
	.word 0xb9342001  ! 848: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0xa72c1011  ! 848: SLLX_R	sllx	%r16, %r17, %r19
	.word 0x832c0011  ! 848: SLL_R	sll 	%r16, %r17, %r1
	.word 0x882c0011  ! 848: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x9c1c245c  ! 848: XOR_I	xor 	%r16, 0x045c, %r14
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xdf042b51  ! 848: LDF_I	ld	[%r16, 0x0b51], %f15
thr2_irf_ce_83:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_83), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	return     %r18 + 0x20
	.word 0x9c8c0011  ! 851: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x953c0011  ! 851: SRA_R	sra 	%r16, %r17, %r10
	.word 0xb93c1011  ! 851: SRAX_R	srax	%r16, %r17, %r28
	.word 0x87340011  ! 851: SRL_R	srl 	%r16, %r17, %r3
	.word 0x84442422  ! 851: ADDC_I	addc 	%r16, 0x0422, %r2
	.word 0x840420f0  ! 851: ADD_I	add 	%r16, 0x00f0, %r2
	.word 0x8d641811  ! 851: MOVcc_R	<illegal instruction>
	.word 0xb0340011  ! 851: ORN_R	orn 	%r16, %r17, %r24
thr2_dc_err_64:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_64), 16, 16),1,DC_DATA,28)
	.word 0xce0c0000  ! 853: LDUB_R	ldub	[%r16 + %r0], %r7
	.word 0x9f242529  ! 855: MULScc_I	mulscc 	%r16, 0x0529, %r15
	.word 0x952c0011  ! 857: SLL_R	sll 	%r16, %r17, %r10
	.word 0x8e3c0011  ! 857: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x9f341011  ! 857: SRLX_R	srlx	%r16, %r17, %r15
	.word 0xa72c3001  ! 857: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0x99342001  ! 857: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x91341011  ! 857: SRLX_R	srlx	%r16, %r17, %r8
	.word 0x848c0011  ! 857: ANDcc_R	andcc 	%r16, %r17, %r2
thr2_dc_err_65:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_65), 16, 16),1,DC_DATA,20)
	.word 0xc4dc2b10  ! 859: LDXA_I	ldxa	[%r16, + 0x0b10] %asi, %r2
thr2_irf_ce_84:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_84), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xf08c2fbb  ! 861: LDUBA_I	lduba	[%r16, + 0x0fbb] %asi, %r24
	.word 0x90442eef  ! 863: ADDC_I	addc 	%r16, 0x0eef, %r8
	.word 0xac840011  ! 863: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0x963c0011  ! 863: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x9ec42788  ! 863: ADDCcc_I	addccc 	%r16, 0x0788, %r15
	.word 0x9d2c2001  ! 863: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0xaa2c2088  ! 863: ANDN_I	andn 	%r16, 0x0088, %r21
	.word 0x988c2842  ! 863: ANDcc_I	andcc 	%r16, 0x0842, %r12
	.word 0xd9941011  ! 864: LDQFA_R	-	[%r16, %r17], %f12
	.word 0xd39c1011  ! 866: LDDFA_R	ldda	[%r16, %r17], %f9
	.word 0xac8c0011  ! 868: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0xb22c222d  ! 868: ANDN_I	andn 	%r16, 0x022d, %r25
	.word 0x9c1c0011  ! 868: XOR_R	xor 	%r16, %r17, %r14
	.word 0xaf2c2001  ! 868: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0x940c2e38  ! 868: AND_I	and 	%r16, 0x0e38, %r10
	.word 0x88940011  ! 868: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0xcc941011  ! 869: LDUHA_R	lduha	[%r16, %r17] 0x80, %r6
	.word 0xf6dc2fd6  ! 871: LDXA_I	ldxa	[%r16, + 0x0fd6] %asi, %r27
	.word 0x8f3c2001  ! 873: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0xb43c2d8c  ! 873: XNOR_I	xnor 	%r16, 0x0d8c, %r26
	.word 0x892c2001  ! 873: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0xba3c0011  ! 873: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x880c0011  ! 873: AND_R	and 	%r16, %r17, %r4
thr2_dc_err_66:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_66), 16, 16),1,DC_DATA,59)
	.word 0xdd841000  ! 875: LDFA_R	lda	[%r16, %r0], %f14
thr2_irf_ce_85:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_85), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xc2841011  ! 877: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r1
	.word 0xae042c1e  ! 879: ADD_I	add 	%r16, 0x0c1e, %r23
	.word 0x932c0011  ! 879: SLL_R	sll 	%r16, %r17, %r9
	.word 0x8f343001  ! 879: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x9a3c2841  ! 879: XNOR_I	xnor 	%r16, 0x0841, %r13
	.word 0x8c440011  ! 879: ADDC_R	addc 	%r16, %r17, %r6
	.word 0xda8c2c56  ! 880: LDUBA_I	lduba	[%r16, + 0x0c56] %asi, %r13
thr2_irf_ce_86:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_86), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xccd41011  ! 882: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r6
	.word 0x8d3c0011  ! 884: SRA_R	sra 	%r16, %r17, %r6
	.word 0x84bc26d2  ! 884: XNORcc_I	xnorcc 	%r16, 0x06d2, %r2
	.word 0xa61c0011  ! 884: XOR_R	xor 	%r16, %r17, %r19
	.word 0x8f2c2001  ! 884: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x893c1011  ! 884: SRAX_R	srax	%r16, %r17, %r4
	.word 0x84ac0011  ! 884: ANDNcc_R	andncc 	%r16, %r17, %r2
thr2_dc_err_67:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_67), 16, 16),1,DC_DATA,34)
	.word 0xdc9c2dfd  ! 886: LDDA_I	ldda	[%r16, + 0x0dfd] %asi, %r14
	.word 0xd04c0011  ! 888: LDSB_R	ldsb	[%r16 + %r17], %r8
	.word 0x82b4269e  ! 890: ORNcc_I	orncc 	%r16, 0x069e, %r1
	.word 0x86340011  ! 890: ORN_R	orn 	%r16, %r17, %r3
	.word 0xb49c2390  ! 890: XORcc_I	xorcc 	%r16, 0x0390, %r26
	.word 0x97343001  ! 890: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0x88c42b62  ! 890: ADDCcc_I	addccc 	%r16, 0x0b62, %r4
	.word 0x8f342001  ! 890: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x86c428fd  ! 890: ADDCcc_I	addccc 	%r16, 0x08fd, %r3
	.word 0x9f643801  ! 890: MOVcc_I	<illegal instruction>
thr2_dc_err_68:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_68), 16, 16),1,DC_DATA,13)
	.word 0xeed42e26  ! 892: LDSHA_I	ldsha	[%r16, + 0x0e26] %asi, %r23
	.word 0xd01426c3  ! 894: LDUH_I	lduh	[%r16 + 0x06c3], %r8
	.word 0xb8140011  ! 896: OR_R	or 	%r16, %r17, %r28
	.word 0x86ac275b  ! 896: ANDNcc_I	andncc 	%r16, 0x075b, %r3
	.word 0xaa842506  ! 896: ADDcc_I	addcc 	%r16, 0x0506, %r21
	.word 0x8eb4259b  ! 896: ORNcc_I	orncc 	%r16, 0x059b, %r7
	.word 0x94c40011  ! 896: ADDCcc_R	addccc 	%r16, %r17, %r10
thr2_dc_err_69:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_69), 16, 16),1,DC_DATA,1)
	.word 0xcc1c0000  ! 898: LDD_R	ldd	[%r16 + %r0], %r6
	.word 0xd21c2798  ! 900: LDD_I	ldd	[%r16 + 0x0798], %r9
	.word 0xaa0c0011  ! 902: AND_R	and 	%r16, %r17, %r21
	.word 0x8b2c1011  ! 902: SLLX_R	sllx	%r16, %r17, %r5
	.word 0x9a8c0011  ! 902: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x8e440011  ! 902: ADDC_R	addc 	%r16, %r17, %r7
	.word 0x8aac2cc4  ! 902: ANDNcc_I	andncc 	%r16, 0x0cc4, %r5
	.word 0xaeac2712  ! 902: ANDNcc_I	andncc 	%r16, 0x0712, %r23
	.word 0x8eb40011  ! 902: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0xea94245b  ! 903: LDUHA_I	lduha	[%r16, + 0x045b] %asi, %r21
thr2_irf_ce_87:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_87), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xe6942fbf  ! 905: LDUHA_I	lduha	[%r16, + 0x0fbf] %asi, %r19
	.word 0x98040011  ! 907: ADD_R	add 	%r16, %r17, %r12
	.word 0x94040011  ! 907: ADD_R	add 	%r16, %r17, %r10
	.word 0x900c0011  ! 907: AND_R	and 	%r16, %r17, %r8
	.word 0x988c229a  ! 907: ANDcc_I	andcc 	%r16, 0x029a, %r12
	.word 0x912c0011  ! 907: SLL_R	sll 	%r16, %r17, %r8
thr2_dc_err_70:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_70), 16, 16),1,DC_DATA,48)
	.word 0xc51c0000  ! 909: LDDF_R	ldd	[%r16, %r0], %f2
thr2_irf_ce_88:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_88), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xcf240011  ! 911: STF_R	st	%f7, [%r17, %r16]
	.word 0x8c3c0011  ! 913: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0xb0bc2d30  ! 913: XNORcc_I	xnorcc 	%r16, 0x0d30, %r24
	.word 0x9c04282e  ! 913: ADD_I	add 	%r16, 0x082e, %r14
	.word 0x9c140011  ! 913: OR_R	or 	%r16, %r17, %r14
	.word 0x969c0011  ! 913: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x96040011  ! 913: ADD_R	add 	%r16, %r17, %r11
	.word 0x84842617  ! 913: ADDcc_I	addcc 	%r16, 0x0617, %r2
	.word 0xf5140011  ! 914: LDQF_R	-	[%r16, %r17], %f26
	.word 0xf29c2837  ! 916: LDDA_I	ldda	[%r16, + 0x0837] %asi, %r25
	.word 0xbac40011  ! 918: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0xb2440011  ! 918: ADDC_R	addc 	%r16, %r17, %r25
	.word 0x9004212f  ! 918: ADD_I	add 	%r16, 0x012f, %r8
	.word 0x9ac40011  ! 918: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x852c3001  ! 918: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0x9b340011  ! 918: SRL_R	srl 	%r16, %r17, %r13
	.word 0xa97c2401  ! 918: MOVR_I	move	%r16, 0x7fff9c24, %r20
thr2_dc_err_71:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_71), 16, 16),1,DC_DATA,70)
	.word 0xf9042a09  ! 920: LDF_I	ld	[%r16, 0x0a09], %f28
	.word 0xc6941011  ! 922: LDUHA_R	lduha	[%r16, %r17] 0x80, %r3
	.word 0x8e9422db  ! 924: ORcc_I	orcc 	%r16, 0x02db, %r7
	.word 0x96440011  ! 924: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x98040011  ! 924: ADD_R	add 	%r16, %r17, %r12
	.word 0x9eac0011  ! 924: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x94942204  ! 924: ORcc_I	orcc 	%r16, 0x0204, %r10
	.word 0x8c44207a  ! 924: ADDC_I	addc 	%r16, 0x007a, %r6
	.word 0x9aac0011  ! 924: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x9c0c0011  ! 924: AND_R	and 	%r16, %r17, %r14
thr2_dc_err_72:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_72), 16, 16),1,DC_DATA,43)
	.word 0xcb1c22ab  ! 926: LDDF_I	ldd	[%r16, 0x02ab], %f5
thr2_irf_ce_89:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_89), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xb64c29af  ! 928: MULX_I	mulx 	%r16, 0x09af, %r27
	.word 0x84bc259a  ! 930: XNORcc_I	xnorcc 	%r16, 0x059a, %r2
	.word 0x84b40011  ! 930: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0x9a1c0011  ! 930: XOR_R	xor 	%r16, %r17, %r13
	.word 0x8e9c2a67  ! 930: XORcc_I	xorcc 	%r16, 0x0a67, %r7
	.word 0xb7342001  ! 930: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xdb1c2316  ! 931: LDDF_I	ldd	[%r16, 0x0316], %f13
	.word 0xe91c0011  ! 933: LDDF_R	ldd	[%r16, %r17], %f20
	.word 0x92b42ac1  ! 935: ORNcc_I	orncc 	%r16, 0x0ac1, %r9
	.word 0xb6040011  ! 935: ADD_R	add 	%r16, %r17, %r27
	.word 0xab341011  ! 935: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x8d3c0011  ! 935: SRA_R	sra 	%r16, %r17, %r6
	.word 0xb02c2285  ! 935: ANDN_I	andn 	%r16, 0x0285, %r24
	.word 0x9f641811  ! 935: MOVcc_R	<illegal instruction>
	.word 0x9c9c272a  ! 935: XORcc_I	xorcc 	%r16, 0x072a, %r14
	.word 0x988c0011  ! 935: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0xf60426ce  ! 936: LDUW_I	lduw	[%r16 + 0x06ce], %r27
thr2_irf_ce_90:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_90), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xf25c0011  ! 938: LDX_R	ldx	[%r16 + %r17], %r25
	.word 0x9c2c0011  ! 940: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x9c8c0011  ! 940: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x86840011  ! 940: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0x94442782  ! 940: ADDC_I	addc 	%r16, 0x0782, %r10
	.word 0x8c9c21ea  ! 940: XORcc_I	xorcc 	%r16, 0x01ea, %r6
	.word 0x8c3420a5  ! 940: ORN_I	orn 	%r16, 0x00a5, %r6
	.word 0x9ab4275a  ! 940: ORNcc_I	orncc 	%r16, 0x075a, %r13
	.word 0xaaac0011  ! 940: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0xd9042087  ! 941: LDF_I	ld	[%r16, 0x0087], %f12
thr2_irf_ce_91:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_91), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0x02800004  ! 943: BE	be  	<label_0x4>
	.word 0xac4425f2  ! 945: ADDC_I	addc 	%r16, 0x05f2, %r22
	.word 0xa69c0011  ! 945: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x8aac2fc0  ! 945: ANDNcc_I	andncc 	%r16, 0x0fc0, %r5
	.word 0xa93c0011  ! 945: SRA_R	sra 	%r16, %r17, %r20
	.word 0x828c2f53  ! 945: ANDcc_I	andcc 	%r16, 0x0f53, %r1
	.word 0x92c42bc3  ! 945: ADDCcc_I	addccc 	%r16, 0x0bc3, %r9
	.word 0xb28c24e5  ! 945: ANDcc_I	andcc 	%r16, 0x04e5, %r25
thr2_dc_err_73:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_73), 16, 16),1,DC_DATA,37)
	.word 0xd1040000  ! 947: LDF_R	ld	[%r16, %r0], %f8
thr2_irf_ce_92:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_92), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xeb1c213e  ! 949: LDDF_I	ldd	[%r16, 0x013e], %f21
	.word 0x88c40011  ! 951: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x852c2001  ! 951: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0xb08c0011  ! 951: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0x98c40011  ! 951: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x897c2401  ! 951: MOVR_I	move	%r16, 0x7fff9c24, %r4
	.word 0x868426b3  ! 951: ADDcc_I	addcc 	%r16, 0x06b3, %r3
	.word 0x86442963  ! 951: ADDC_I	addc 	%r16, 0x0963, %r3
	.word 0x93343001  ! 951: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0xf1142d0c  ! 952: LDQF_I	-	[%r16, 0x0d0c], %f24
	.word 0xec5c0011  ! 954: LDX_R	ldx	[%r16 + %r17], %r22
	.word 0x848428f3  ! 956: ADDcc_I	addcc 	%r16, 0x08f3, %r2
	.word 0x8e9422dc  ! 956: ORcc_I	orcc 	%r16, 0x02dc, %r7
	.word 0xacbc2951  ! 956: XNORcc_I	xnorcc 	%r16, 0x0951, %r22
	.word 0x8ac42443  ! 956: ADDCcc_I	addccc 	%r16, 0x0443, %r5
	.word 0xac1c24ec  ! 956: XOR_I	xor 	%r16, 0x04ec, %r22
	.word 0x952c2001  ! 956: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0x849c0011  ! 956: XORcc_R	xorcc 	%r16, %r17, %r2
thr2_dc_err_74:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_74), 16, 16),1,DC_DATA,28)
	.word 0xea8420c5  ! 958: LDUWA_I	lduwa	[%r16, + 0x00c5] %asi, %r21
	.word 0xcf0426f5  ! 960: LDF_I	ld	[%r16, 0x06f5], %f7
	.word 0xb6b40011  ! 962: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0x8b2c3001  ! 962: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x848c0011  ! 962: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x929c0011  ! 962: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0xaa9c2025  ! 962: XORcc_I	xorcc 	%r16, 0x0025, %r21
thr2_dc_err_75:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_75), 16, 16),1,DC_DATA,40)
	.word 0xda0426a0  ! 964: LDUW_I	lduw	[%r16 + 0x06a0], %r13
!Illinst alu
	.word 0xba340011  ! 966: ORN_R	orn 	%r16, %r17, %r29
	.word 0x8834292b  ! 968: ORN_I	orn 	%r16, 0x092b, %r4
	.word 0xb72c1011  ! 968: SLLX_R	sllx	%r16, %r17, %r27
	.word 0x84342bdf  ! 968: ORN_I	orn 	%r16, 0x0bdf, %r2
	.word 0x957c2401  ! 968: MOVR_I	move	%r16, 0x7fff9c24, %r10
	.word 0x9f3c2001  ! 968: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x82b424e7  ! 968: ORNcc_I	orncc 	%r16, 0x04e7, %r1
	.word 0x821c20a9  ! 968: XOR_I	xor 	%r16, 0x00a9, %r1
	.word 0x8e8c0011  ! 968: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0xcf941011  ! 969: LDQFA_R	-	[%r16, %r17], %f7
	.word 0xc7040011  ! 971: LDF_R	ld	[%r16, %r17], %f3
	.word 0x988c2045  ! 973: ANDcc_I	andcc 	%r16, 0x0045, %r12
	.word 0x84840011  ! 973: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x92942434  ! 973: ORcc_I	orcc 	%r16, 0x0434, %r9
	.word 0xb37c2401  ! 973: MOVR_I	move	%r16, 0x7fff9c24, %r25
	.word 0xae0424f8  ! 973: ADD_I	add 	%r16, 0x04f8, %r23
	.word 0xb8440011  ! 973: ADDC_R	addc 	%r16, %r17, %r28
	.word 0xf8040011  ! 974: LDUW_R	lduw	[%r16 + %r17], %r28
thr2_irf_ce_93:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_93), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xd08c1011  ! 976: LDUBA_R	lduba	[%r16, %r17] 0x80, %r8
	.word 0x8aac0011  ! 978: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x880c23c8  ! 978: AND_I	and 	%r16, 0x03c8, %r4
	.word 0xb2ac0011  ! 978: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0xa9342001  ! 978: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0x8e4426d3  ! 978: ADDC_I	addc 	%r16, 0x06d3, %r7
	.word 0xd69421a1  ! 979: LDUHA_I	lduha	[%r16, + 0x01a1] %asi, %r11
!Illinst store
	.word 0xfa340011  ! 981: STH_R	sth	%r29, [%r16 + %r17]
	.word 0x822c0011  ! 983: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x90940011  ! 983: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0xac940011  ! 983: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0xb41c2863  ! 983: XOR_I	xor 	%r16, 0x0863, %r26
	.word 0x98bc2c36  ! 983: XNORcc_I	xnorcc 	%r16, 0x0c36, %r12
	.word 0x95343001  ! 983: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0xe80c0011  ! 984: LDUB_R	ldub	[%r16 + %r17], %r20
thr2_irf_ce_94:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_94), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xc8540011  ! 986: LDSH_R	ldsh	[%r16 + %r17], %r4
	.word 0x941c0011  ! 988: XOR_R	xor 	%r16, %r17, %r10
	.word 0x98940011  ! 988: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x8e442a58  ! 988: ADDC_I	addc 	%r16, 0x0a58, %r7
	.word 0x9a940011  ! 988: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x9e3422ff  ! 988: ORN_I	orn 	%r16, 0x02ff, %r15
	.word 0x833c2001  ! 988: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0x932c0011  ! 988: SLL_R	sll 	%r16, %r17, %r9
	.word 0xae9c0011  ! 988: XORcc_R	xorcc 	%r16, %r17, %r23
thr2_dc_err_76:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_76), 16, 16),1,DC_DATA,69)
	.word 0xd0440000  ! 990: LDSW_R	ldsw	[%r16 + %r0], %r8
        wr  %g0, 0x80, %asi
	.word 0x9c942c78  ! 994: ORcc_I	orcc 	%r16, 0x0c78, %r14
	.word 0x940424d1  ! 994: ADD_I	add 	%r16, 0x04d1, %r10
	.word 0x86440011  ! 994: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x933c2001  ! 994: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0xba0422c8  ! 994: ADD_I	add 	%r16, 0x02c8, %r29
	.word 0xcc1c21db  ! 995: LDD_I	ldd	[%r16 + 0x01db], %r6
	.word 0x2e800004  ! 997: BVS	bvs,a	<label_0x4>
	.word 0x889c0011  ! 999: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0xb43c28b2  ! 999: XNOR_I	xnor 	%r16, 0x08b2, %r26
	.word 0x92ac0011  ! 999: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x988c0011  ! 999: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x9e3c0011  ! 999: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0x9eac2245  ! 999: ANDNcc_I	andncc 	%r16, 0x0245, %r15
thr2_dc_err_77:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_77), 16, 16),1,DC_DATA,13)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000004d0, %g1, %r17
        setx  0xa2ec6c8f7adbccbb, %g1, %r0
        setx  0x0a032b69cbabfbcb, %g1, %r1
        setx  0x7a555aa0b942e85c, %g1, %r2
        setx  0x2717a6c09d0370db, %g1, %r3
        setx  0xdab5bc72aa0fbfac, %g1, %r4
        setx  0x70a93a6154e5829f, %g1, %r5
        setx  0xa2dc1963e9f53ef7, %g1, %r6
        setx  0x7bb4990a73134f33, %g1, %r7
        setx  0x7fb0d38b19df9d76, %g1, %r8
        setx  0x7495d98bcadb1c6f, %g1, %r9
        setx  0xaab8dfb0f5dd49a1, %g1, %r10
        setx  0x19f01d8ab62cff03, %g1, %r11
        setx  0x23d6749b8db06b3a, %g1, %r12
        setx  0xb332a44a9024b955, %g1, %r13
        setx  0xf3f5811b3da5cf36, %g1, %r14
        setx  0xe2f280178b02ead2, %g1, %r15
        setx  0xa09b14779ab4dd3f, %g1, %r18
        setx  0x586b1daf9e797bb0, %g1, %r19
        setx  0xb0162ad328b45a7a, %g1, %r20
        setx  0x898f4a14cb1ab685, %g1, %r21
        setx  0xf6a1fdd723a5a22c, %g1, %r22
        setx  0xab77557934bcfd52, %g1, %r23
        setx  0x98c85c6bc7e6fe44, %g1, %r24
        setx  0xb32657857c8a8e3b, %g1, %r25
        setx  0x2f140c59daa89d7b, %g1, %r26
        setx  0xed7f4fd81422b31f, %g1, %r27
        setx  0xa73001e98f77b440, %g1, %r28
        setx  0xc4762ca76d73e369, %g1, %r29
        setx  0xeb56e441c1388486, %g1, %r30
        setx  0x74758a8edb3ec703, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000007f0, %g1, %r17
        setx  0x223a0916c4f1bb61, %g1, %r0
        setx  0xb1c9f4649287bd4c, %g1, %r1
        setx  0xce4767a415faeeed, %g1, %r2
        setx  0x3796ef80534a10af, %g1, %r3
        setx  0x80944b66d7c95ba3, %g1, %r4
        setx  0x08e63f5afd4e1c14, %g1, %r5
        setx  0x9a5d21ca182975e4, %g1, %r6
        setx  0x7d5f047a0b1cb225, %g1, %r7
        setx  0xf609fcd281b14896, %g1, %r8
        setx  0x29093e5dadc301f8, %g1, %r9
        setx  0x589de52d5c75658f, %g1, %r10
        setx  0x3285510733fc6686, %g1, %r11
        setx  0x8c19aaff2eac1344, %g1, %r12
        setx  0x291a122be9856b4a, %g1, %r13
        setx  0x2c62d03cc30e9162, %g1, %r14
        setx  0x6f7d54ae46af7633, %g1, %r15
        setx  0x7be79ee23b35231a, %g1, %r18
        setx  0x504be543af7f6002, %g1, %r19
        setx  0x86f432c40e26ab4e, %g1, %r20
        setx  0x7575c4ad2a83d8eb, %g1, %r21
        setx  0x505f842cc7d3da73, %g1, %r22
        setx  0xccea1027a844ba52, %g1, %r23
        setx  0x31f07d826efb73da, %g1, %r24
        setx  0xff8029f7ed5d5617, %g1, %r25
        setx  0xeeedf1cc0c35e758, %g1, %r26
        setx  0x5f2862827dfbeb8c, %g1, %r27
        setx  0xca95ecd4822da277, %g1, %r28
        setx  0x0c6d2e366ecb49dc, %g1, %r29
        setx  0xa19b66b3196f06a1, %g1, %r30
        setx  0x8453dbdd93d35321, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000bc0, %g1, %r17
        setx  0x914f9f5d716539a4, %g1, %r0
        setx  0xb7c03f7438e3ebf8, %g1, %r1
        setx  0x07804369bfcec6ac, %g1, %r2
        setx  0xc4514850b21be934, %g1, %r3
        setx  0x720b7e724f7bd99d, %g1, %r4
        setx  0xf5bfae2ad0183406, %g1, %r5
        setx  0x3a28f93feb435ce6, %g1, %r6
        setx  0x0d3d69e09561e885, %g1, %r7
        setx  0xd8333abf76c99f36, %g1, %r8
        setx  0x8d4b2bfa5d5c4f43, %g1, %r9
        setx  0x806d40cdae6d8378, %g1, %r10
        setx  0xc2709276127f1b5d, %g1, %r11
        setx  0x8c5f5bf5613267c4, %g1, %r12
        setx  0x5001f40992d9b14f, %g1, %r13
        setx  0x789c8dc867c00858, %g1, %r14
        setx  0x2e86834da5b07951, %g1, %r15
        setx  0x445eec3794f66ca2, %g1, %r18
        setx  0xdd2f27bd1f9e574b, %g1, %r19
        setx  0x1cec91151ee651f1, %g1, %r20
        setx  0x99a2ea2fb081c163, %g1, %r21
        setx  0x08bcf8b148b899e8, %g1, %r22
        setx  0xe2e7c4be96ba446c, %g1, %r23
        setx  0x2d37fb9a4fa977b4, %g1, %r24
        setx  0xa00db0f019c23bb7, %g1, %r25
        setx  0x6024609b4f305694, %g1, %r26
        setx  0x45b10ded50df08a1, %g1, %r27
        setx  0xddc6bd09ac467e71, %g1, %r28
        setx  0x3e8971ae026ef87d, %g1, %r29
        setx  0xfc42ea2071d481f5, %g1, %r30
        setx  0x2816067ad7db8dad, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000001c0, %g1, %r17
        setx  0x3acbb0019d7b75f2, %g1, %r0
        setx  0x9de158b6bc1c6ed9, %g1, %r1
        setx  0x93b49ae9ad08fb88, %g1, %r2
        setx  0x1ff770d4c57dbb95, %g1, %r3
        setx  0x31e51866e4443395, %g1, %r4
        setx  0xf10677259b5fa7c4, %g1, %r5
        setx  0xaeb267a3455b5b22, %g1, %r6
        setx  0xfa2bd63eddcb9c6c, %g1, %r7
        setx  0x632e5be8bb315cb7, %g1, %r8
        setx  0x541faa44e639a1f7, %g1, %r9
        setx  0xd59e864838d3747f, %g1, %r10
        setx  0x9ebfd55f6a7650b3, %g1, %r11
        setx  0x3de06dd97b8ebbab, %g1, %r12
        setx  0x673990ff2dfc0449, %g1, %r13
        setx  0x492fa850454ed902, %g1, %r14
        setx  0x7d1a0a5a5951d226, %g1, %r15
        setx  0xe65a6dcfa47206c2, %g1, %r18
        setx  0xe8daccaad58fc7e5, %g1, %r19
        setx  0x6cd240c0b296f965, %g1, %r20
        setx  0xefe5addd5ba570f6, %g1, %r21
        setx  0xdea7bb8b9290f1ab, %g1, %r22
        setx  0xad6772f51efc01df, %g1, %r23
        setx  0xb98852c28fa04cee, %g1, %r24
        setx  0x38664aca7d116050, %g1, %r25
        setx  0x0132c0746c85db5c, %g1, %r26
        setx  0xfd4a17ad7e2d728d, %g1, %r27
        setx  0x70b07f23e182b744, %g1, %r28
        setx  0xb5f21885165a9b7c, %g1, %r29
        setx  0x07f415d5b444df29, %g1, %r30
        setx  0x4f3dae32032d3170, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000150, %g1, %r17
        setx  0x51022881039ac101, %g1, %r0
        setx  0x69927243991dee1a, %g1, %r1
        setx  0xf8df56c333dadf46, %g1, %r2
        setx  0x21e6e8473f79cf9e, %g1, %r3
        setx  0x3567011b50f8c1d8, %g1, %r4
        setx  0x4cad32b296b179a0, %g1, %r5
        setx  0x425c6cd7fb29434f, %g1, %r6
        setx  0x8f074021cd167510, %g1, %r7
        setx  0xd2e777d53d681c09, %g1, %r8
        setx  0xdd144e36ee704296, %g1, %r9
        setx  0x8186b7f30602aeb7, %g1, %r10
        setx  0x43c781c25d915b7c, %g1, %r11
        setx  0xf06c6c6fc47a7fe3, %g1, %r12
        setx  0x2e0583ba57a6ed06, %g1, %r13
        setx  0x8e19ce1ee9b1110d, %g1, %r14
        setx  0x85989a62fd6192ab, %g1, %r15
        setx  0xf05db74a83f21886, %g1, %r18
        setx  0x39f914e8a99c64bb, %g1, %r19
        setx  0xd6397a33ea5137d0, %g1, %r20
        setx  0x5ca4e73b9d2ae2de, %g1, %r21
        setx  0xb06ee533749005e9, %g1, %r22
        setx  0x353ee46982a77c10, %g1, %r23
        setx  0x4b25695f18834ca8, %g1, %r24
        setx  0xa0813f180276933d, %g1, %r25
        setx  0x952b05705ce66536, %g1, %r26
        setx  0xef4760587050458d, %g1, %r27
        setx  0x7744a3328f193780, %g1, %r28
        setx  0x6020df5cc010b5a4, %g1, %r29
        setx  0x7af9eada0c091500, %g1, %r30
        setx  0x362c3cd356ae9367, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000004f0, %g1, %r17
        setx  0x4b938e01d04a83e2, %g1, %r0
        setx  0x0d4c1e6f6158260f, %g1, %r1
        setx  0x91d8032c6b92ccee, %g1, %r2
        setx  0x765dce2bd8c9258e, %g1, %r3
        setx  0xc174b0570ae2f6e5, %g1, %r4
        setx  0x47a8addde6aede47, %g1, %r5
        setx  0x03e82e7d50c93143, %g1, %r6
        setx  0xa9954384d33bbf74, %g1, %r7
        setx  0xa4114ba1ae4c3abd, %g1, %r8
        setx  0xee4eff453d491d52, %g1, %r9
        setx  0xd7c6229fcda519c2, %g1, %r10
        setx  0xd1cc9fabdde7660d, %g1, %r11
        setx  0x61526db4bf3bf2f6, %g1, %r12
        setx  0x019dbec3d40b3c17, %g1, %r13
        setx  0xd5970c837729f0c4, %g1, %r14
        setx  0xe24db5999195ab8a, %g1, %r15
        setx  0xd3a7b5587fae09e9, %g1, %r18
        setx  0x183424cb655ee576, %g1, %r19
        setx  0xb562e4209cd275aa, %g1, %r20
        setx  0x8f26d748ad67431e, %g1, %r21
        setx  0x6e03c0795803ea73, %g1, %r22
        setx  0x28d49cf6010acfac, %g1, %r23
        setx  0xf2aba7face11cba5, %g1, %r24
        setx  0xaae64b1980fb93c1, %g1, %r25
        setx  0x6d2ecbea6cd0fa59, %g1, %r26
        setx  0x07138d3869a5d7c8, %g1, %r27
        setx  0x2d180928656ab49e, %g1, %r28
        setx  0x7c8aa108e808d7b1, %g1, %r29
        setx  0x479b6e7267696290, %g1, %r30
        setx  0x1850812b84ddd244, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000510, %g1, %r17
        setx  0x1f6f2ec7ed18d60c, %g1, %r0
        setx  0xb809bdb45fe7cf93, %g1, %r1
        setx  0x2c5c3052d3b6c85b, %g1, %r2
        setx  0xa1a347295660d3ba, %g1, %r3
        setx  0xcee2ccf5fb12b455, %g1, %r4
        setx  0x66c10a4c0ccc7ab1, %g1, %r5
        setx  0x78d136309f4e04a9, %g1, %r6
        setx  0x8a71cbfaf46b46de, %g1, %r7
        setx  0x05995fd3ca8391bd, %g1, %r8
        setx  0x748a18268006cf18, %g1, %r9
        setx  0xfb0598b2ec4d7934, %g1, %r10
        setx  0xd8741ae223d33a1d, %g1, %r11
        setx  0x855f44ec3c482455, %g1, %r12
        setx  0x87a71a9afcd04450, %g1, %r13
        setx  0x211844db90bc2532, %g1, %r14
        setx  0xb63384f67acc3803, %g1, %r15
        setx  0x136110b0895c62b0, %g1, %r18
        setx  0x82afce8b87151dba, %g1, %r19
        setx  0x2b9f93972e749729, %g1, %r20
        setx  0x510eedcbf6e5a0bd, %g1, %r21
        setx  0x34167ee7a07e2d97, %g1, %r22
        setx  0x2580d4740bd2e1d4, %g1, %r23
        setx  0x000389c24b29aabc, %g1, %r24
        setx  0x96fa1fc7fdcca00e, %g1, %r25
        setx  0x81efd9ba7d8634f2, %g1, %r26
        setx  0x7c99040ea5b6d7f5, %g1, %r27
        setx  0x9d9ac05b830244bd, %g1, %r28
        setx  0x54c71fed2e2be033, %g1, %r29
        setx  0xa795f2b9f51e975d, %g1, %r30
        setx  0x7d9f8bf7216a4600, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000930, %g1, %r17
        setx  0x944e514b38c8c780, %g1, %r0
        setx  0xb6e435bf7875ef05, %g1, %r1
        setx  0xdbd76de5a8164319, %g1, %r2
        setx  0xd1afcf3f7d110244, %g1, %r3
        setx  0xcfed5ef3f64ae67a, %g1, %r4
        setx  0x20de5a656a8754b2, %g1, %r5
        setx  0xec6b728d6e166be2, %g1, %r6
        setx  0x826832fdd0c83743, %g1, %r7
        setx  0x0090da47f0c4d331, %g1, %r8
        setx  0x12dcebcad812a295, %g1, %r9
        setx  0x8031a0368e556f2f, %g1, %r10
        setx  0x8474b27b3ce08e8b, %g1, %r11
        setx  0xb76f3d91102182d9, %g1, %r12
        setx  0xaf1a45c071f1d4d9, %g1, %r13
        setx  0xf6ce601a2a5b6d08, %g1, %r14
        setx  0xe586651e5f3ef953, %g1, %r15
        setx  0x22fc20d75fc15b5b, %g1, %r18
        setx  0x9676162b624e403b, %g1, %r19
        setx  0xda27417918e8abf6, %g1, %r20
        setx  0x3407dc0ba648c81e, %g1, %r21
        setx  0x4b78a46de0f83761, %g1, %r22
        setx  0x5658cba3139e91a0, %g1, %r23
        setx  0x769940c43f84ba3a, %g1, %r24
        setx  0x8f8c93d2d92faa97, %g1, %r25
        setx  0x9076760fdb7a6324, %g1, %r26
        setx  0xbb251dfcc4c282bf, %g1, %r27
        setx  0x3e4604fdcf9d8282, %g1, %r28
        setx  0xbe1eba07933d0d67, %g1, %r29
        setx  0x0d79babfe49139be, %g1, %r30
        setx  0x5dea1449ac6d7efb, %g1, %r31
	save %r0, %r0, %r31
        wr  %g0, 0x80, %asi
        wr %g0, 0x4, %fprs
	ldd	[%r16 + 0], %f0
	ldd	[%r16 + 8], %f2
	ldd	[%r16 + 16], %f4
	ldd	[%r16 + 24], %f6
	ldd	[%r16 + 32], %f8
	ldd	[%r16 + 40], %f10
	ldd	[%r16 + 48], %f12
	ldd	[%r16 + 56], %f14
	ldd	[%r16 + 64], %f16
	ldd	[%r16 + 72], %f18
	ldd	[%r16 + 80], %f20
	ldd	[%r16 + 88], %f22
	ldd	[%r16 + 96], %f24
	ldd	[%r16 + 104], %f26
	ldd	[%r16 + 112], %f28
	ldd	[%r16 + 120], %f30
	ldd	[%r16 + 128], %f32
	ldd	[%r16 + 136], %f34
	ldd	[%r16 + 144], %f36
	ldd	[%r16 + 152], %f38
	ldd	[%r16 + 160], %f40
	ldd	[%r16 + 168], %f42
	ldd	[%r16 + 176], %f44
	ldd	[%r16 + 184], %f46
	ldd	[%r16 + 192], %f48
	ldd	[%r16 + 200], %f50
	ldd	[%r16 + 208], %f52
	ldd	[%r16 + 216], %f54
	ldd	[%r16 + 224], %f56
	ldd	[%r16 + 232], %f58
	ldd	[%r16 + 240], %f60
	ldd	[%r16 + 248], %f62
	.word 0xc61c0011  ! 2: LDD_R	ldd	[%r16 + %r17], %r3
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xe84c2d99  ! 4: LDSB_I	ldsb	[%r16 + 0x0d99], %r20
	.word 0x83641811  ! 6: MOVcc_R	<illegal instruction>
	.word 0x9a9c2679  ! 6: XORcc_I	xorcc 	%r16, 0x0679, %r13
	.word 0x928c2d84  ! 6: ANDcc_I	andcc 	%r16, 0x0d84, %r9
	.word 0xb8340011  ! 6: ORN_R	orn 	%r16, %r17, %r28
	.word 0x92c42497  ! 6: ADDCcc_I	addccc 	%r16, 0x0497, %r9
	.word 0xb69c0011  ! 6: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0x9f2c0011  ! 6: SLL_R	sll 	%r16, %r17, %r15
	.word 0x823c2461  ! 6: XNOR_I	xnor 	%r16, 0x0461, %r1
	.word 0xda142174  ! 7: LDUH_I	lduh	[%r16 + 0x0174], %r13
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xca8c1011  ! 9: LDUBA_R	lduba	[%r16, %r17] 0x80, %r5
	.word 0x94bc0011  ! 11: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x943c2313  ! 11: XNOR_I	xnor 	%r16, 0x0313, %r10
	.word 0x9a442ccd  ! 11: ADDC_I	addc 	%r16, 0x0ccd, %r13
	.word 0x8c140011  ! 11: OR_R	or 	%r16, %r17, %r6
	.word 0x9a140011  ! 11: OR_R	or 	%r16, %r17, %r13
	.word 0x8a0c2362  ! 11: AND_I	and 	%r16, 0x0362, %r5
	.word 0x9a1c0011  ! 11: XOR_R	xor 	%r16, %r17, %r13
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,68)
	.word 0xde9c2da8  ! 13: LDDA_I	ldda	[%r16, + 0x0da8] %asi, %r15
	ta	T_CHANGE_PRIV	! macro
	.word 0x9ec42e1a  ! 17: ADDCcc_I	addccc 	%r16, 0x0e1a, %r15
	.word 0x8ac40011  ! 17: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0xbb340011  ! 17: SRL_R	srl 	%r16, %r17, %r29
	.word 0xb0c423dc  ! 17: ADDCcc_I	addccc 	%r16, 0x03dc, %r24
	.word 0xb4440011  ! 17: ADDC_R	addc 	%r16, %r17, %r26
	.word 0xba040011  ! 17: ADD_R	add 	%r16, %r17, %r29
	.word 0xc8140011  ! 18: LDUH_R	lduh	[%r16 + %r17], %r4
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xe69427b6  ! 20: LDUHA_I	lduha	[%r16, + 0x07b6] %asi, %r19
	.word 0x98042973  ! 22: ADD_I	add 	%r16, 0x0973, %r12
	.word 0xb6c428da  ! 22: ADDCcc_I	addccc 	%r16, 0x08da, %r27
	.word 0x83643801  ! 22: MOVcc_I	<illegal instruction>
	.word 0x8cbc28e1  ! 22: XNORcc_I	xnorcc 	%r16, 0x08e1, %r6
	.word 0x9c3c0011  ! 22: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x8ebc0011  ! 22: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x8d2c1011  ! 22: SLLX_R	sllx	%r16, %r17, %r6
	.word 0xae3c0011  ! 22: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0xf65c0011  ! 23: LDX_R	ldx	[%r16 + %r17], %r27
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xde4c2697  ! 25: LDSB_I	ldsb	[%r16 + 0x0697], %r15
	.word 0xb00c2545  ! 27: AND_I	and 	%r16, 0x0545, %r24
	.word 0xb33c0011  ! 27: SRA_R	sra 	%r16, %r17, %r25
	.word 0x85641811  ! 27: MOVcc_R	<illegal instruction>
	.word 0xae040011  ! 27: ADD_R	add 	%r16, %r17, %r23
	.word 0x853c2001  ! 27: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0xb7340011  ! 27: SRL_R	srl 	%r16, %r17, %r27
	.word 0x9f7c2401  ! 27: MOVR_I	move	%r16, 0x7fff9c24, %r15
	.word 0x9b343001  ! 27: SRLX_I	srlx	%r16, 0x0001, %r13
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,27)
	.word 0xf01c0000  ! 29: LDD_R	ldd	[%r16 + %r0], %r24
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xc9841011  ! 31: LDFA_R	lda	[%r16, %r17], %f4
	.word 0x957c2401  ! 33: MOVR_I	move	%r16, 0x7fff9c24, %r10
	.word 0x823429dd  ! 33: ORN_I	orn 	%r16, 0x09dd, %r1
	.word 0x9a3c0011  ! 33: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x8a8c0011  ! 33: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0xb4c40011  ! 33: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0x869c0011  ! 33: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0x833c0011  ! 33: SRA_R	sra 	%r16, %r17, %r1
	.word 0x8a0c27e8  ! 33: AND_I	and 	%r16, 0x07e8, %r5
	.word 0xec8c1011  ! 34: LDUBA_R	lduba	[%r16, %r17] 0x80, %r22
	.word 0xf1142e48  ! 36: LDQF_I	-	[%r16, 0x0e48], %f24
	.word 0xac1c2162  ! 38: XOR_I	xor 	%r16, 0x0162, %r22
	.word 0xab2c0011  ! 38: SLL_R	sll 	%r16, %r17, %r21
	.word 0xa6842be8  ! 38: ADDcc_I	addcc 	%r16, 0x0be8, %r19
	.word 0x95341011  ! 38: SRLX_R	srlx	%r16, %r17, %r10
	.word 0xb2042d1b  ! 38: ADD_I	add 	%r16, 0x0d1b, %r25
	.word 0xb8940011  ! 38: ORcc_R	orcc 	%r16, %r17, %r28
	.word 0x913c0011  ! 38: SRA_R	sra 	%r16, %r17, %r8
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,2)
	.word 0xc24c0000  ! 40: LDSB_R	ldsb	[%r16 + %r0], %r1
	.word 0xf10425e4  ! 42: LDF_I	ld	[%r16, 0x05e4], %f24
	.word 0xacac2875  ! 44: ANDNcc_I	andncc 	%r16, 0x0875, %r22
	.word 0xa8840011  ! 44: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0x84b40011  ! 44: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xaa1428c4  ! 44: OR_I	or 	%r16, 0x08c4, %r21
	.word 0x821c2d60  ! 44: XOR_I	xor 	%r16, 0x0d60, %r1
	.word 0x8d7c2401  ! 44: MOVR_I	move	%r16, 0x7fff9c24, %r6
	.word 0x952c3001  ! 44: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0xb6442f74  ! 44: ADDC_I	addc 	%r16, 0x0f74, %r27
	.word 0xc91c0011  ! 45: LDDF_R	ldd	[%r16, %r17], %f4
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xd8242215  ! 49: STW_I	stw	%r12, [%r16 + 0x0215]
	.word 0xb92c2001  ! 51: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0x86c42307  ! 51: ADDCcc_I	addccc 	%r16, 0x0307, %r3
	.word 0xb3343001  ! 51: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xae0427ed  ! 51: ADD_I	add 	%r16, 0x07ed, %r23
	.word 0xb20c0011  ! 51: AND_R	and 	%r16, %r17, %r25
	.word 0x8f2c2001  ! 51: SLL_I	sll 	%r16, 0x0001, %r7
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,33)
	.word 0xd2042d70  ! 53: LDUW_I	lduw	[%r16 + 0x0d70], %r9
	.word 0xc40c2d56  ! 55: LDUB_I	ldub	[%r16 + 0x0d56], %r2
	.word 0xa6bc0011  ! 57: XNORcc_R	xnorcc 	%r16, %r17, %r19
	.word 0xb4840011  ! 57: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0x9a842283  ! 57: ADDcc_I	addcc 	%r16, 0x0283, %r13
	.word 0x8b7c0411  ! 57: MOVR_R	move	%r16, %r17, %r5
	.word 0x8c0c0011  ! 57: AND_R	and 	%r16, %r17, %r6
	.word 0x8a34217c  ! 57: ORN_I	orn 	%r16, 0x017c, %r5
	.word 0xbb2c2001  ! 57: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0x91342001  ! 57: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0xdd1c2bad  ! 58: LDDF_I	ldd	[%r16, 0x0bad], %f14
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xab7c2401  ! 62: MOVR_I	move	%r16, 0x7fff9c24, %r21
	.word 0x88340011  ! 62: ORN_R	orn 	%r16, %r17, %r4
	.word 0x87342001  ! 62: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0x96bc2e2a  ! 62: XNORcc_I	xnorcc 	%r16, 0x0e2a, %r11
	.word 0xa60c2d71  ! 62: AND_I	and 	%r16, 0x0d71, %r19
	.word 0xb2940011  ! 62: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0x98940011  ! 62: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0xb53c2001  ! 62: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0xee0c2994  ! 63: LDUB_I	ldub	[%r16 + 0x0994], %r23
	.word 0x20800003  ! 65: BN	bn,a	<label_0x3>
	.word 0x94c42338  ! 67: ADDCcc_I	addccc 	%r16, 0x0338, %r10
	.word 0xb80c294e  ! 67: AND_I	and 	%r16, 0x094e, %r28
	.word 0xab342001  ! 67: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x96142600  ! 67: OR_I	or 	%r16, 0x0600, %r11
	.word 0xb5342001  ! 67: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0x9c442f88  ! 67: ADDC_I	addc 	%r16, 0x0f88, %r14
	.word 0xb7643801  ! 67: MOVcc_I	<illegal instruction>
	.word 0xb72c2001  ! 67: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xde9c2adc  ! 68: LDDA_I	ldda	[%r16, + 0x0adc] %asi, %r15
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	wr      %r0, 0x1, %asr26
	.word 0x9c340011  ! 72: ORN_R	orn 	%r16, %r17, %r14
	.word 0xb89c0011  ! 72: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0xb5641811  ! 72: MOVcc_R	<illegal instruction>
	.word 0xb8940011  ! 72: ORcc_R	orcc 	%r16, %r17, %r28
	.word 0x912c2001  ! 72: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0xaf7c2401  ! 72: MOVR_I	move	%r16, 0x7fff9c24, %r23
	.word 0xab2c2001  ! 72: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0xd7841011  ! 73: LDFA_R	lda	[%r16, %r17], %f11
!Illinst store
	.word 0xf4340011  ! 75: STH_R	sth	%r26, [%r16 + %r17]
	.word 0x9a3c0011  ! 77: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x8ec42ad4  ! 77: ADDCcc_I	addccc 	%r16, 0x0ad4, %r7
	.word 0x9a840011  ! 77: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x9c142c5b  ! 77: OR_I	or 	%r16, 0x0c5b, %r14
	.word 0xb33c1011  ! 77: SRAX_R	srax	%r16, %r17, %r25
	.word 0x82bc0011  ! 77: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0xae140011  ! 77: OR_R	or 	%r16, %r17, %r23
	.word 0x9f343001  ! 77: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0xf9841011  ! 78: LDFA_R	lda	[%r16, %r17], %f28
!Illinst alu
	.word 0x92842a28  ! 80: ADDcc_I	addcc 	%r16, 0x0a28, %r9
	.word 0x952c3001  ! 82: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x9e840011  ! 82: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x93340011  ! 82: SRL_R	srl 	%r16, %r17, %r9
	.word 0x9a342c9d  ! 82: ORN_I	orn 	%r16, 0x0c9d, %r13
	.word 0x8e1c0011  ! 82: XOR_R	xor 	%r16, %r17, %r7
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,40)
	.word 0xc2c424d3  ! 84: LDSWA_I	ldswa	[%r16, + 0x04d3] %asi, %r1
	.word 0xe88428da  ! 86: LDUWA_I	lduwa	[%r16, + 0x08da] %asi, %r20
	.word 0x8f643801  ! 88: MOVcc_I	<illegal instruction>
	.word 0x949c0011  ! 88: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0x98142002  ! 88: OR_I	or 	%r16, 0x0002, %r12
	.word 0x8d3c2001  ! 88: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0x832c0011  ! 88: SLL_R	sll 	%r16, %r17, %r1
	.word 0x9b2c3001  ! 88: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0xd6c42ef1  ! 89: LDSWA_I	ldswa	[%r16, + 0x0ef1] %asi, %r11
	.word 0xc3941011  ! 91: LDQFA_R	-	[%r16, %r17], %f1
	.word 0x9434294e  ! 93: ORN_I	orn 	%r16, 0x094e, %r10
	.word 0xb2b42058  ! 93: ORNcc_I	orncc 	%r16, 0x0058, %r25
	.word 0xa6ac0011  ! 93: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0xb48c0011  ! 93: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0xac342730  ! 93: ORN_I	orn 	%r16, 0x0730, %r22
	.word 0x908c0011  ! 93: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x94b42715  ! 93: ORNcc_I	orncc 	%r16, 0x0715, %r10
	.word 0x95341011  ! 93: SRLX_R	srlx	%r16, %r17, %r10
	.word 0xd0cc1011  ! 94: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r8
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xe8dc1011  ! 96: LDXA_R	ldxa	[%r16, %r17] 0x80, %r20
	.word 0x929c2093  ! 98: XORcc_I	xorcc 	%r16, 0x0093, %r9
	.word 0x8a340011  ! 98: ORN_R	orn 	%r16, %r17, %r5
	.word 0x8d2c1011  ! 98: SLLX_R	sllx	%r16, %r17, %r6
	.word 0x86c40011  ! 98: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x833c2001  ! 98: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0xd6440011  ! 99: LDSW_R	ldsw	[%r16 + %r17], %r11
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xdf9c1011  ! 101: LDDFA_R	ldda	[%r16, %r17], %f15
	.word 0xb88c2a50  ! 103: ANDcc_I	andcc 	%r16, 0x0a50, %r28
	.word 0xac8c0011  ! 103: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0xac040011  ! 103: ADD_R	add 	%r16, %r17, %r22
	.word 0x83340011  ! 103: SRL_R	srl 	%r16, %r17, %r1
	.word 0x8a0c2628  ! 103: AND_I	and 	%r16, 0x0628, %r5
	.word 0x90842fce  ! 103: ADDcc_I	addcc 	%r16, 0x0fce, %r8
	.word 0x9ac420f7  ! 103: ADDCcc_I	addccc 	%r16, 0x00f7, %r13
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,57)
	.word 0xf69c22af  ! 105: LDDA_I	ldda	[%r16, + 0x02af] %asi, %r27
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xf63420e4  ! 109: STH_I	sth	%r27, [%r16 + 0x00e4]
	.word 0x9c9c2734  ! 111: XORcc_I	xorcc 	%r16, 0x0734, %r14
	.word 0x94440011  ! 111: ADDC_R	addc 	%r16, %r17, %r10
	.word 0xaa142b46  ! 111: OR_I	or 	%r16, 0x0b46, %r21
	.word 0xb68c0011  ! 111: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x862c293a  ! 111: ANDN_I	andn 	%r16, 0x093a, %r3
	.word 0x9a94221a  ! 111: ORcc_I	orcc 	%r16, 0x021a, %r13
	.word 0x952c1011  ! 111: SLLX_R	sllx	%r16, %r17, %r10
	.word 0xb8c42933  ! 111: ADDCcc_I	addccc 	%r16, 0x0933, %r28
	.word 0xee140011  ! 112: LDUH_R	lduh	[%r16 + %r17], %r23
	.word 0xc8fc1011  ! 114: SWAPA_R	swapa	%r4, [%r16 + %r17] 0x80
	.word 0xa72c3001  ! 116: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0x9d3c0011  ! 116: SRA_R	sra 	%r16, %r17, %r14
	.word 0x912c2001  ! 116: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0x8a8c2f11  ! 116: ANDcc_I	andcc 	%r16, 0x0f11, %r5
	.word 0x862c0011  ! 116: ANDN_R	andn 	%r16, %r17, %r3
	.word 0xb72c2001  ! 116: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0x893c2001  ! 116: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0xb04421ed  ! 116: ADDC_I	addc 	%r16, 0x01ed, %r24
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,36)
	.word 0xd1140000  ! 118: LDQF_R	-	[%r16, %r0], %f8
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xd9941011  ! 120: LDQFA_R	-	[%r16, %r17], %f12
	.word 0x917c2401  ! 122: MOVR_I	move	%r16, 0x7fff9c24, %r8
	.word 0xaa9c2ca7  ! 122: XORcc_I	xorcc 	%r16, 0x0ca7, %r21
	.word 0xaf342001  ! 122: SRL_I	srl 	%r16, 0x0001, %r23
	.word 0x8e3c0011  ! 122: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x962c239d  ! 122: ANDN_I	andn 	%r16, 0x039d, %r11
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,57)
	.word 0xc5040000  ! 124: LDF_R	ld	[%r16, %r0], %f2
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xc914228e  ! 126: LDQF_I	-	[%r16, 0x028e], %f4
	.word 0xb08c25fd  ! 128: ANDcc_I	andcc 	%r16, 0x05fd, %r24
	.word 0xaf2c1011  ! 128: SLLX_R	sllx	%r16, %r17, %r23
	.word 0xad341011  ! 128: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x99341011  ! 128: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x83340011  ! 128: SRL_R	srl 	%r16, %r17, %r1
	.word 0xa8b420be  ! 128: ORNcc_I	orncc 	%r16, 0x00be, %r20
	.word 0x99643801  ! 128: MOVcc_I	<illegal instruction>
	.word 0x8ab40011  ! 128: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xe91c0011  ! 129: LDDF_R	ldd	[%r16, %r17], %f20
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xf31c2db2  ! 131: LDDF_I	ldd	[%r16, 0x0db2], %f25
	.word 0x97643801  ! 133: MOVcc_I	<illegal instruction>
	.word 0xac1c0011  ! 133: XOR_R	xor 	%r16, %r17, %r22
	.word 0x8ec42dfd  ! 133: ADDCcc_I	addccc 	%r16, 0x0dfd, %r7
	.word 0x95342001  ! 133: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x8a840011  ! 133: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0xaa2c0011  ! 133: ANDN_R	andn 	%r16, %r17, %r21
	.word 0x8a842553  ! 133: ADDcc_I	addcc 	%r16, 0x0553, %r5
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,43)
	.word 0xcf941000  ! 135: LDQFA_R	-	[%r16, %r0], %f7
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xd6040011  ! 137: LDUW_R	lduw	[%r16 + %r17], %r11
	.word 0xa8340011  ! 139: ORN_R	orn 	%r16, %r17, %r20
	.word 0xb69c2235  ! 139: XORcc_I	xorcc 	%r16, 0x0235, %r27
	.word 0x96842a44  ! 139: ADDcc_I	addcc 	%r16, 0x0a44, %r11
	.word 0xb42c24d6  ! 139: ANDN_I	andn 	%r16, 0x04d6, %r26
	.word 0xacbc0011  ! 139: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0x8a940011  ! 139: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0xb60c268e  ! 139: AND_I	and 	%r16, 0x068e, %r27
	.word 0xcc1c0011  ! 140: LDD_R	ldd	[%r16 + %r17], %r6
	.word 0xfac42a9c  ! 142: LDSWA_I	ldswa	[%r16, + 0x0a9c] %asi, %r29
	.word 0x97340011  ! 144: SRL_R	srl 	%r16, %r17, %r11
	.word 0x84c40011  ! 144: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x9b2c3001  ! 144: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x84440011  ! 144: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x9b342001  ! 144: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x8e1c2680  ! 144: XOR_I	xor 	%r16, 0x0680, %r7
	.word 0xf11c0011  ! 145: LDDF_R	ldd	[%r16, %r17], %f24
!Illinst alu
	.word 0xb0440011  ! 147: ADDC_R	addc 	%r16, %r17, %r24
	.word 0xb6c42329  ! 149: ADDCcc_I	addccc 	%r16, 0x0329, %r27
	.word 0xae940011  ! 149: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0xb2840011  ! 149: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0xb61c0011  ! 149: XOR_R	xor 	%r16, %r17, %r27
	.word 0x9e3428db  ! 149: ORN_I	orn 	%r16, 0x08db, %r15
	.word 0x8c1c2cbf  ! 149: XOR_I	xor 	%r16, 0x0cbf, %r6
	.word 0x8e8c0011  ! 149: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x9c340011  ! 149: ORN_R	orn 	%r16, %r17, %r14
	.word 0xd4dc1011  ! 150: LDXA_R	ldxa	[%r16, %r17] 0x80, %r10
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xcc540011  ! 152: LDSH_R	ldsh	[%r16 + %r17], %r6
	.word 0x82040011  ! 154: ADD_R	add 	%r16, %r17, %r1
	.word 0x9d3c0011  ! 154: SRA_R	sra 	%r16, %r17, %r14
	.word 0xb0bc2962  ! 154: XNORcc_I	xnorcc 	%r16, 0x0962, %r24
	.word 0xa604260b  ! 154: ADD_I	add 	%r16, 0x060b, %r19
	.word 0x869c0011  ! 154: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0x86ac0011  ! 154: ANDNcc_R	andncc 	%r16, %r17, %r3
thr1_dc_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_9), 16, 16),1,DC_DATA,52)
	.word 0xdf841000  ! 156: LDFA_R	lda	[%r16, %r0], %f15
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xf64c0011  ! 158: LDSB_R	ldsb	[%r16 + %r17], %r27
	.word 0x92340011  ! 160: ORN_R	orn 	%r16, %r17, %r9
	.word 0xb4ac0011  ! 160: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0x8aac29c0  ! 160: ANDNcc_I	andncc 	%r16, 0x09c0, %r5
	.word 0x82040011  ! 160: ADD_R	add 	%r16, %r17, %r1
	.word 0x989c2965  ! 160: XORcc_I	xorcc 	%r16, 0x0965, %r12
	.word 0xb8c42df8  ! 160: ADDCcc_I	addccc 	%r16, 0x0df8, %r28
	.word 0x82442468  ! 160: ADDC_I	addc 	%r16, 0x0468, %r1
	.word 0xb83c0011  ! 160: XNOR_R	xnor 	%r16, %r17, %r28
thr1_dc_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_10), 16, 16),1,DC_DATA,29)
	.word 0xcb9c1000  ! 162: LDDFA_R	ldda	[%r16, %r0], %f5
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xe8cc1011  ! 164: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r20
	.word 0xb6442691  ! 166: ADDC_I	addc 	%r16, 0x0691, %r27
	.word 0xb69c2c01  ! 166: XORcc_I	xorcc 	%r16, 0x0c01, %r27
	.word 0xb244221b  ! 166: ADDC_I	addc 	%r16, 0x021b, %r25
	.word 0xac0c267b  ! 166: AND_I	and 	%r16, 0x067b, %r22
	.word 0x892c3001  ! 166: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0x9f2c3001  ! 166: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0xba340011  ! 166: ORN_R	orn 	%r16, %r17, %r29
	.word 0xcd9c1011  ! 167: LDDFA_R	ldda	[%r16, %r17], %f6
	.word 0xde440011  ! 169: LDSW_R	ldsw	[%r16 + %r17], %r15
	.word 0xb83c0011  ! 171: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0x9e142808  ! 171: OR_I	or 	%r16, 0x0808, %r15
	.word 0x94bc2927  ! 171: XNORcc_I	xnorcc 	%r16, 0x0927, %r10
	.word 0x8c942595  ! 171: ORcc_I	orcc 	%r16, 0x0595, %r6
	.word 0x83643801  ! 171: MOVcc_I	<illegal instruction>
	.word 0x8b342001  ! 171: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x9d7c2401  ! 171: MOVR_I	move	%r16, 0x7fff9c24, %r14
	.word 0x8e8c0011  ! 171: ANDcc_R	andcc 	%r16, %r17, %r7
thr1_dc_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_11), 16, 16),1,DC_DATA,0)
	.word 0xdccc2c5a  ! 173: LDSBA_I	ldsba	[%r16, + 0x0c5a] %asi, %r14
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xd45c27a9  ! 175: LDX_I	ldx	[%r16 + 0x07a9], %r10
	.word 0xb21c0011  ! 177: XOR_R	xor 	%r16, %r17, %r25
	.word 0xb03c0011  ! 177: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0x980c0011  ! 177: AND_R	and 	%r16, %r17, %r12
	.word 0x882c0011  ! 177: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xa8ac0011  ! 177: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0xb8440011  ! 177: ADDC_R	addc 	%r16, %r17, %r28
	.word 0x848c2e76  ! 177: ANDcc_I	andcc 	%r16, 0x0e76, %r2
	.word 0xcc8c1011  ! 178: LDUBA_R	lduba	[%r16, %r17] 0x80, %r6
	.word 0xdcdc1011  ! 180: LDXA_R	ldxa	[%r16, %r17] 0x80, %r14
	.word 0xa93c2001  ! 182: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x92442de2  ! 182: ADDC_I	addc 	%r16, 0x0de2, %r9
	.word 0x9f2c1011  ! 182: SLLX_R	sllx	%r16, %r17, %r15
	.word 0xa9641811  ! 182: MOVcc_R	<illegal instruction>
	.word 0x95340011  ! 182: SRL_R	srl 	%r16, %r17, %r10
thr1_dc_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_12), 16, 16),1,DC_DATA,22)
	.word 0xdf1c2f19  ! 184: LDDF_I	ldd	[%r16, 0x0f19], %f15
	.word 0xd5040011  ! 186: LDF_R	ld	[%r16, %r17], %f10
	.word 0x9e342afd  ! 188: ORN_I	orn 	%r16, 0x0afd, %r15
	.word 0xbabc25f1  ! 188: XNORcc_I	xnorcc 	%r16, 0x05f1, %r29
	.word 0x9f340011  ! 188: SRL_R	srl 	%r16, %r17, %r15
	.word 0xa6440011  ! 188: ADDC_R	addc 	%r16, %r17, %r19
	.word 0xb6840011  ! 188: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0xb08427d0  ! 188: ADDcc_I	addcc 	%r16, 0x07d0, %r24
	.word 0x872c2001  ! 188: SLL_I	sll 	%r16, 0x0001, %r3
thr1_dc_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_13), 16, 16),1,DC_DATA,48)
	.word 0xdadc1000  ! 190: LDXA_R	ldxa	[%r16, %r0] 0x80, %r13
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xeeec1011  ! 192: LDSTUBA_R	ldstuba	%r23, [%r16 + %r17] 0x80
	.word 0x8a0c0011  ! 194: AND_R	and 	%r16, %r17, %r5
	.word 0xb684272c  ! 194: ADDcc_I	addcc 	%r16, 0x072c, %r27
	.word 0x9b3c0011  ! 194: SRA_R	sra 	%r16, %r17, %r13
	.word 0x8a14268a  ! 194: OR_I	or 	%r16, 0x068a, %r5
	.word 0x843c0011  ! 194: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0x842c2ba5  ! 194: ANDN_I	andn 	%r16, 0x0ba5, %r2
thr1_dc_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_14), 16, 16),1,DC_DATA,6)
	.word 0xf00c0000  ! 196: LDUB_R	ldub	[%r16 + %r0], %r24
thr1_irf_ce_20:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_20), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xdc5c2cb2  ! 198: LDX_I	ldx	[%r16 + 0x0cb2], %r14
	.word 0x8c1c0011  ! 200: XOR_R	xor 	%r16, %r17, %r6
	.word 0x88ac0011  ! 200: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x9b643801  ! 200: MOVcc_I	<illegal instruction>
	.word 0x82142b3c  ! 200: OR_I	or 	%r16, 0x0b3c, %r1
	.word 0xa8140011  ! 200: OR_R	or 	%r16, %r17, %r20
	.word 0x97641811  ! 200: MOVcc_R	<illegal instruction>
	.word 0xac9c200c  ! 200: XORcc_I	xorcc 	%r16, 0x000c, %r22
	.word 0xdb9c1011  ! 201: LDDFA_R	ldda	[%r16, %r17], %f13
thr1_irf_ce_21:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_21), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	wr      %r0, 0x1, %asr26
	.word 0x8c3c0011  ! 205: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0xb2ac2b88  ! 205: ANDNcc_I	andncc 	%r16, 0x0b88, %r25
	.word 0x992c1011  ! 205: SLLX_R	sllx	%r16, %r17, %r12
	.word 0xae04250a  ! 205: ADD_I	add 	%r16, 0x050a, %r23
	.word 0x84140011  ! 205: OR_R	or 	%r16, %r17, %r2
	.word 0xaf2c2001  ! 205: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0x9a2c0011  ! 205: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x86040011  ! 205: ADD_R	add 	%r16, %r17, %r3
thr1_dc_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_15), 16, 16),1,DC_DATA,69)
	.word 0xd11c26b0  ! 207: LDDF_I	ldd	[%r16, 0x06b0], %f8
	.word 0xe6d42283  ! 209: LDSHA_I	ldsha	[%r16, + 0x0283] %asi, %r19
	.word 0x8e840011  ! 211: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0xb2c40011  ! 211: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0x940c2ed2  ! 211: AND_I	and 	%r16, 0x0ed2, %r10
	.word 0xaf7c0411  ! 211: MOVR_R	move	%r16, %r17, %r23
	.word 0x92bc28ff  ! 211: XNORcc_I	xnorcc 	%r16, 0x08ff, %r9
	.word 0xda5c0011  ! 212: LDX_R	ldx	[%r16 + %r17], %r13
	.word 0xdec41011  ! 214: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r15
	.word 0xaa340011  ! 216: ORN_R	orn 	%r16, %r17, %r21
	.word 0xb9342001  ! 216: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0x9b2c3001  ! 216: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x920c0011  ! 216: AND_R	and 	%r16, %r17, %r9
	.word 0x843c2c1f  ! 216: XNOR_I	xnor 	%r16, 0x0c1f, %r2
	.word 0x9b2c1011  ! 216: SLLX_R	sllx	%r16, %r17, %r13
	.word 0xd48c1011  ! 217: LDUBA_R	lduba	[%r16, %r17] 0x80, %r10
	.word 0xcd841011  ! 219: LDFA_R	lda	[%r16, %r17], %f6
	.word 0x949c2537  ! 221: XORcc_I	xorcc 	%r16, 0x0537, %r10
	.word 0xb20c0011  ! 221: AND_R	and 	%r16, %r17, %r25
	.word 0xb83c0011  ! 221: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xbb641811  ! 221: MOVcc_R	<illegal instruction>
	.word 0x84b40011  ! 221: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0x8cac2e37  ! 221: ANDNcc_I	andncc 	%r16, 0x0e37, %r6
	.word 0x902c0011  ! 221: ANDN_R	andn 	%r16, %r17, %r8
thr1_dc_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_16), 16, 16),1,DC_DATA,22)
	.word 0xd51c0000  ! 223: LDDF_R	ldd	[%r16, %r0], %f10
thr1_irf_ce_22:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_22), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xf03421eb  ! 227: STH_I	sth	%r24, [%r16 + 0x01eb]
	.word 0x833c1011  ! 229: SRAX_R	srax	%r16, %r17, %r1
	.word 0x883c2e51  ! 229: XNOR_I	xnor 	%r16, 0x0e51, %r4
	.word 0x90440011  ! 229: ADDC_R	addc 	%r16, %r17, %r8
	.word 0xa7341011  ! 229: SRLX_R	srlx	%r16, %r17, %r19
	.word 0x96c40011  ! 229: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x95341011  ! 229: SRLX_R	srlx	%r16, %r17, %r10
	.word 0xc8dc1011  ! 230: LDXA_R	ldxa	[%r16, %r17] 0x80, %r4
	.word 0xca841011  ! 232: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r5
	.word 0x9c0c256a  ! 234: AND_I	and 	%r16, 0x056a, %r14
	.word 0x8c3428bc  ! 234: ORN_I	orn 	%r16, 0x08bc, %r6
	.word 0x94c42bf3  ! 234: ADDCcc_I	addccc 	%r16, 0x0bf3, %r10
	.word 0x961c0011  ! 234: XOR_R	xor 	%r16, %r17, %r11
	.word 0x963c0011  ! 234: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x9c0c277e  ! 234: AND_I	and 	%r16, 0x077e, %r14
	.word 0xa6940011  ! 234: ORcc_R	orcc 	%r16, %r17, %r19
	.word 0x853c1011  ! 234: SRAX_R	srax	%r16, %r17, %r2
thr1_dc_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_17), 16, 16),1,DC_DATA,56)
	.word 0xc7142e23  ! 236: LDQF_I	-	[%r16, 0x0e23], %f3
	.word 0xdc942a38  ! 238: LDUHA_I	lduha	[%r16, + 0x0a38] %asi, %r14
	.word 0x8c340011  ! 240: ORN_R	orn 	%r16, %r17, %r6
	.word 0x87643801  ! 240: MOVcc_I	<illegal instruction>
	.word 0x8a3c2bbd  ! 240: XNOR_I	xnor 	%r16, 0x0bbd, %r5
	.word 0xb92c2001  ! 240: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0x982c2076  ! 240: ANDN_I	andn 	%r16, 0x0076, %r12
	.word 0x933c2001  ! 240: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x9e8c236e  ! 240: ANDcc_I	andcc 	%r16, 0x036e, %r15
thr1_dc_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_18), 16, 16),1,DC_DATA,4)
	.word 0xf4042378  ! 242: LDUW_I	lduw	[%r16 + 0x0378], %r26
	.word 0xd99c1011  ! 244: LDDFA_R	ldda	[%r16, %r17], %f12
	.word 0x9e840011  ! 246: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xb81c2871  ! 246: XOR_I	xor 	%r16, 0x0871, %r28
	.word 0x981c28fd  ! 246: XOR_I	xor 	%r16, 0x08fd, %r12
	.word 0xaa2c2106  ! 246: ANDN_I	andn 	%r16, 0x0106, %r21
	.word 0x972c3001  ! 246: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x901c290a  ! 246: XOR_I	xor 	%r16, 0x090a, %r8
thr1_dc_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_19), 16, 16),1,DC_DATA,15)
	.word 0xd2d421d8  ! 248: LDSHA_I	ldsha	[%r16, + 0x01d8] %asi, %r9
thr1_irf_ce_23:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_23), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xcac41011  ! 250: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r5
	.word 0x8d3c1011  ! 252: SRAX_R	srax	%r16, %r17, %r6
	.word 0x8ab42457  ! 252: ORNcc_I	orncc 	%r16, 0x0457, %r5
	.word 0xb8340011  ! 252: ORN_R	orn 	%r16, %r17, %r28
	.word 0x8aac0011  ! 252: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x82bc0011  ! 252: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x8cac24da  ! 252: ANDNcc_I	andncc 	%r16, 0x04da, %r6
thr1_dc_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_20), 16, 16),1,DC_DATA,39)
	.word 0xca4c2744  ! 254: LDSB_I	ldsb	[%r16 + 0x0744], %r5
thr1_irf_ce_24:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_24), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xcf1c2c07  ! 256: LDDF_I	ldd	[%r16, 0x0c07], %f7
	.word 0x8a042e75  ! 258: ADD_I	add 	%r16, 0x0e75, %r5
	.word 0x9894261a  ! 258: ORcc_I	orcc 	%r16, 0x061a, %r12
	.word 0x88442791  ! 258: ADDC_I	addc 	%r16, 0x0791, %r4
	.word 0x94442861  ! 258: ADDC_I	addc 	%r16, 0x0861, %r10
	.word 0x84ac2285  ! 258: ANDNcc_I	andncc 	%r16, 0x0285, %r2
	.word 0x99340011  ! 258: SRL_R	srl 	%r16, %r17, %r12
	.word 0x86b42904  ! 258: ORNcc_I	orncc 	%r16, 0x0904, %r3
thr1_dc_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_21), 16, 16),1,DC_DATA,31)
	.word 0xef140000  ! 260: LDQF_R	-	[%r16, %r0], %f23
	.word 0xfa0c2fc5  ! 262: LDUB_I	ldub	[%r16 + 0x0fc5], %r29
	.word 0xaec42453  ! 264: ADDCcc_I	addccc 	%r16, 0x0453, %r23
	.word 0x88140011  ! 264: OR_R	or 	%r16, %r17, %r4
	.word 0x8d641811  ! 264: MOVcc_R	<illegal instruction>
	.word 0x84b40011  ! 264: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0x9f7c0411  ! 264: MOVR_R	move	%r16, %r17, %r15
	.word 0x922c288e  ! 264: ANDN_I	andn 	%r16, 0x088e, %r9
	.word 0x993c2001  ! 264: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x85341011  ! 264: SRLX_R	srlx	%r16, %r17, %r2
	.word 0xdc0c2844  ! 265: LDUB_I	ldub	[%r16 + 0x0844], %r14
	.word 0xf28427b9  ! 267: LDUWA_I	lduwa	[%r16, + 0x07b9] %asi, %r25
	.word 0x9f3c0011  ! 269: SRA_R	sra 	%r16, %r17, %r15
	.word 0x8a8c2652  ! 269: ANDcc_I	andcc 	%r16, 0x0652, %r5
	.word 0x889c0011  ! 269: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0xb48c0011  ! 269: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0x9c040011  ! 269: ADD_R	add 	%r16, %r17, %r14
	.word 0x8c2c2bc8  ! 269: ANDN_I	andn 	%r16, 0x0bc8, %r6
	.word 0x948c0011  ! 269: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x92b42232  ! 270: ORNcc_I	orncc 	%r16, 0x0232, %r9
	.word 0x92940011  ! 270: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x8a042676  ! 270: ADD_I	add 	%r16, 0x0676, %r5
	.word 0xaa040011  ! 270: ADD_R	add 	%r16, %r17, %r21
	.word 0xb57c2401  ! 270: MOVR_I	move	%r16, 0x7fff9c24, %r26
	.word 0x8ebc26c8  ! 270: XNORcc_I	xnorcc 	%r16, 0x06c8, %r7
	.word 0x860c0011  ! 270: AND_R	and 	%r16, %r17, %r3
	rd      %pc, %r18
	set     0x20, %r17
thr1_dc_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_22), 16, 16),1,DC_DATA,12)
	.word 0xd2dc1000  ! 271: LDXA_R	ldxa	[%r16, %r0] 0x80, %r9
thr1_irf_ce_25:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_25), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	return     %r18 + 0x20
	.word 0x85641811  ! 274: MOVcc_R	<illegal instruction>
	.word 0x92840011  ! 274: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0xaf3c2001  ! 274: SRA_I	sra 	%r16, 0x0001, %r23
	.word 0xb52c0011  ! 274: SLL_R	sll 	%r16, %r17, %r26
	.word 0xb89c0011  ! 274: XORcc_R	xorcc 	%r16, %r17, %r28
thr1_dc_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_23), 16, 16),1,DC_DATA,53)
	.word 0xc91420bc  ! 276: LDQF_I	-	[%r16, 0x00bc], %f4
thr1_irf_ce_26:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_26), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xc85c2d6c  ! 278: LDX_I	ldx	[%r16 + 0x0d6c], %r4
	.word 0x9e0c0011  ! 280: AND_R	and 	%r16, %r17, %r15
	.word 0x949c2727  ! 280: XORcc_I	xorcc 	%r16, 0x0727, %r10
	.word 0xbb3c2001  ! 280: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0x91340011  ! 280: SRL_R	srl 	%r16, %r17, %r8
	.word 0x8e340011  ! 280: ORN_R	orn 	%r16, %r17, %r7
	.word 0x9244230c  ! 280: ADDC_I	addc 	%r16, 0x030c, %r9
thr1_dc_err_24:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_24), 16, 16),1,DC_DATA,4)
	.word 0xc2140000  ! 282: LDUH_R	lduh	[%r16 + %r0], %r1
	.word 0xea542082  ! 284: LDSH_I	ldsh	[%r16 + 0x0082], %r21
	.word 0x8d3c1011  ! 286: SRAX_R	srax	%r16, %r17, %r6
	.word 0xb2940011  ! 286: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0xad341011  ! 286: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x992c3001  ! 286: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x908c0011  ! 286: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x9c842b1d  ! 286: ADDcc_I	addcc 	%r16, 0x0b1d, %r14
	.word 0xaa942d33  ! 286: ORcc_I	orcc 	%r16, 0x0d33, %r21
	.word 0x90442e45  ! 286: ADDC_I	addc 	%r16, 0x0e45, %r8
	.word 0xe8cc1011  ! 287: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r20
thr1_irf_ce_27:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_27), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xd88c2ae2  ! 289: LDUBA_I	lduba	[%r16, + 0x0ae2] %asi, %r12
	.word 0x9c2c0011  ! 291: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x9e3c23c4  ! 291: XNOR_I	xnor 	%r16, 0x03c4, %r15
	.word 0x912c2001  ! 291: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0x90ac24fd  ! 291: ANDNcc_I	andncc 	%r16, 0x04fd, %r8
	.word 0x903c0011  ! 291: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x9cac0011  ! 291: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0x9c442da5  ! 291: ADDC_I	addc 	%r16, 0x0da5, %r14
	.word 0xd1841011  ! 292: LDFA_R	lda	[%r16, %r17], %f8
thr1_irf_ce_28:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_28), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xdcdc1011  ! 294: LDXA_R	ldxa	[%r16, %r17] 0x80, %r14
	.word 0xb4bc2a10  ! 296: XNORcc_I	xnorcc 	%r16, 0x0a10, %r26
	.word 0x8b2c2001  ! 296: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x832c2001  ! 296: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0x881c0011  ! 296: XOR_R	xor 	%r16, %r17, %r4
	.word 0x94042eaf  ! 296: ADD_I	add 	%r16, 0x0eaf, %r10
	.word 0x892c3001  ! 296: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0xb8c423ff  ! 296: ADDCcc_I	addccc 	%r16, 0x03ff, %r28
	.word 0xd6140011  ! 297: LDUH_R	lduh	[%r16 + %r17], %r11
thr1_irf_ce_29:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_29), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xf8941011  ! 299: LDUHA_R	lduha	[%r16, %r17] 0x80, %r28
	.word 0x8e340011  ! 301: ORN_R	orn 	%r16, %r17, %r7
	.word 0xbaac24de  ! 301: ANDNcc_I	andncc 	%r16, 0x04de, %r29
	.word 0xb7340011  ! 301: SRL_R	srl 	%r16, %r17, %r27
	.word 0xb2340011  ! 301: ORN_R	orn 	%r16, %r17, %r25
	.word 0x8cc42597  ! 301: ADDCcc_I	addccc 	%r16, 0x0597, %r6
	.word 0x9eb40011  ! 301: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x8ebc0011  ! 301: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0xccd42a31  ! 302: LDSHA_I	ldsha	[%r16, + 0x0a31] %asi, %r6
thr1_irf_ce_30:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_30), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xeb040011  ! 304: LDF_R	ld	[%r16, %r17], %f21
	.word 0x948c0011  ! 306: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x9f342001  ! 306: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x9c3c20ab  ! 306: XNOR_I	xnor 	%r16, 0x00ab, %r14
	.word 0x84440011  ! 306: ADDC_R	addc 	%r16, %r17, %r2
	.word 0xba8c0011  ! 306: ANDcc_R	andcc 	%r16, %r17, %r29
	.word 0x9a84219b  ! 306: ADDcc_I	addcc 	%r16, 0x019b, %r13
	.word 0xb2042533  ! 306: ADD_I	add 	%r16, 0x0533, %r25
	.word 0x96840011  ! 306: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0xf1841011  ! 307: LDFA_R	lda	[%r16, %r17], %f24
thr1_irf_ce_31:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_31), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xf91c2d97  ! 309: LDDF_I	ldd	[%r16, 0x0d97], %f28
	.word 0x842c22fe  ! 311: ANDN_I	andn 	%r16, 0x02fe, %r2
	.word 0x88440011  ! 311: ADDC_R	addc 	%r16, %r17, %r4
	.word 0xb53c2001  ! 311: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0xb6440011  ! 311: ADDC_R	addc 	%r16, %r17, %r27
	.word 0x9d2c0011  ! 311: SLL_R	sll 	%r16, %r17, %r14
	.word 0xdc5c2ee3  ! 312: LDX_I	ldx	[%r16 + 0x0ee3], %r14
	.word 0xd69c1011  ! 314: LDDA_R	ldda	[%r16, %r17] 0x80, %r11
	.word 0x908c0011  ! 316: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x8f342001  ! 316: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0xa8b4294d  ! 316: ORNcc_I	orncc 	%r16, 0x094d, %r20
	.word 0xb2942fc8  ! 316: ORcc_I	orcc 	%r16, 0x0fc8, %r25
	.word 0x85641811  ! 316: MOVcc_R	<illegal instruction>
	.word 0xac1c24e8  ! 316: XOR_I	xor 	%r16, 0x04e8, %r22
	.word 0xb3643801  ! 316: MOVcc_I	<illegal instruction>
thr1_dc_err_25:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_25), 16, 16),1,DC_DATA,5)
	.word 0xc2cc27f1  ! 318: LDSBA_I	ldsba	[%r16, + 0x07f1] %asi, %r1
thr1_irf_ce_32:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_32), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0x8143e042  ! 320: MEMBAR	membar	#StoreLoad | #Sync 
	.word 0xaaac0011  ! 322: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0x8abc0011  ! 322: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0xa6bc20c4  ! 322: XNORcc_I	xnorcc 	%r16, 0x00c4, %r19
	.word 0x84040011  ! 322: ADD_R	add 	%r16, %r17, %r2
	.word 0x8d7c2401  ! 322: MOVR_I	move	%r16, 0x7fff9c24, %r6
	.word 0x82b40011  ! 322: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x937c0411  ! 322: MOVR_R	move	%r16, %r17, %r9
	.word 0x832c3001  ! 322: SLLX_I	sllx	%r16, 0x0001, %r1
thr1_dc_err_26:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_26), 16, 16),1,DC_DATA,47)
	.word 0xf8c42d6b  ! 324: LDSWA_I	ldswa	[%r16, + 0x0d6b] %asi, %r28
thr1_irf_ce_33:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_33), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xcc042046  ! 326: LDUW_I	lduw	[%r16 + 0x0046], %r6
	.word 0x963c2843  ! 328: XNOR_I	xnor 	%r16, 0x0843, %r11
	.word 0xb0940011  ! 328: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0xb2440011  ! 328: ADDC_R	addc 	%r16, %r17, %r25
	.word 0x88442375  ! 328: ADDC_I	addc 	%r16, 0x0375, %r4
	.word 0x983423e9  ! 328: ORN_I	orn 	%r16, 0x03e9, %r12
	.word 0xb4040011  ! 328: ADD_R	add 	%r16, %r17, %r26
	.word 0xb21425ef  ! 328: OR_I	or 	%r16, 0x05ef, %r25
	.word 0xdd1c2da6  ! 329: LDDF_I	ldd	[%r16, 0x0da6], %f14
thr1_irf_ce_34:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_34), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xd6d42502  ! 331: LDSHA_I	ldsha	[%r16, + 0x0502] %asi, %r11
	.word 0x853c0011  ! 333: SRA_R	sra 	%r16, %r17, %r2
	.word 0x97343001  ! 333: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0x873c2001  ! 333: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x83641811  ! 333: MOVcc_R	<illegal instruction>
	.word 0x8c9c0011  ! 333: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0x8b3c2001  ! 333: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0xda4c216a  ! 334: LDSB_I	ldsb	[%r16 + 0x016a], %r13
	.word 0xd484263a  ! 336: LDUWA_I	lduwa	[%r16, + 0x063a] %asi, %r10
	.word 0xbb7c2401  ! 338: MOVR_I	move	%r16, 0x7fff9c24, %r29
	.word 0x8d3c1011  ! 338: SRAX_R	srax	%r16, %r17, %r6
	.word 0x98940011  ! 338: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x9d343001  ! 338: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x8a2c27f1  ! 338: ANDN_I	andn 	%r16, 0x07f1, %r5
	.word 0x882c2c97  ! 338: ANDN_I	andn 	%r16, 0x0c97, %r4
thr1_dc_err_27:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_27), 16, 16),1,DC_DATA,46)
	.word 0xda5c2ab0  ! 340: LDX_I	ldx	[%r16 + 0x0ab0], %r13
thr1_irf_ce_35:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_35), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xc5142b8c  ! 342: LDQF_I	-	[%r16, 0x0b8c], %f2
	.word 0x9a3c0011  ! 344: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x8f3c2001  ! 344: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x862c2a83  ! 344: ANDN_I	andn 	%r16, 0x0a83, %r3
	.word 0x87341011  ! 344: SRLX_R	srlx	%r16, %r17, %r3
	.word 0xb8bc0011  ! 344: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0x96040011  ! 344: ADD_R	add 	%r16, %r17, %r11
	.word 0xca4c24a5  ! 345: LDSB_I	ldsb	[%r16 + 0x04a5], %r5
thr1_irf_ce_36:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_36), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xc36c0011  ! 347: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0xa77c0411  ! 349: MOVR_R	move	%r16, %r17, %r19
	.word 0x820c0011  ! 349: AND_R	and 	%r16, %r17, %r1
	.word 0x93643801  ! 349: MOVcc_I	<illegal instruction>
	.word 0xacbc2cb9  ! 349: XNORcc_I	xnorcc 	%r16, 0x0cb9, %r22
	.word 0xaf343001  ! 349: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0xb2bc0011  ! 349: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0xdd1c0011  ! 350: LDDF_R	ldd	[%r16, %r17], %f14
!Illinst alu
	.word 0x90140011  ! 352: OR_R	or 	%r16, %r17, %r8
	.word 0xb4940011  ! 354: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0x977c2401  ! 354: MOVR_I	move	%r16, 0x7fff9c24, %r11
	.word 0x97340011  ! 354: SRL_R	srl 	%r16, %r17, %r11
	.word 0x8d2c3001  ! 354: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0x983c0011  ! 354: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0xc6140011  ! 355: LDUH_R	lduh	[%r16 + %r17], %r3
	wr      %r0, 0x1, %asr26
	.word 0xb49c0011  ! 359: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0x863c0011  ! 359: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0xb32c1011  ! 359: SLLX_R	sllx	%r16, %r17, %r25
	.word 0x98bc29f2  ! 359: XNORcc_I	xnorcc 	%r16, 0x09f2, %r12
	.word 0x8e342f21  ! 359: ORN_I	orn 	%r16, 0x0f21, %r7
	.word 0x8a9c2704  ! 359: XORcc_I	xorcc 	%r16, 0x0704, %r5
	.word 0xda4c0011  ! 360: LDSB_R	ldsb	[%r16 + %r17], %r13
thr1_irf_ce_37:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_37), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xd4442996  ! 362: LDSW_I	ldsw	[%r16 + 0x0996], %r10
	.word 0xa8140011  ! 364: OR_R	or 	%r16, %r17, %r20
	.word 0x9e1c0011  ! 364: XOR_R	xor 	%r16, %r17, %r15
	.word 0x8cbc221d  ! 364: XNORcc_I	xnorcc 	%r16, 0x021d, %r6
	.word 0xaf340011  ! 364: SRL_R	srl 	%r16, %r17, %r23
	.word 0x8d7c0411  ! 364: MOVR_R	move	%r16, %r17, %r6
	.word 0x9694264b  ! 364: ORcc_I	orcc 	%r16, 0x064b, %r11
	.word 0x857c0411  ! 364: MOVR_R	move	%r16, %r17, %r2
	.word 0x983c2da3  ! 364: XNOR_I	xnor 	%r16, 0x0da3, %r12
	.word 0xd5941011  ! 365: LDQFA_R	-	[%r16, %r17], %f10
	.word 0xf9040011  ! 367: LDF_R	ld	[%r16, %r17], %f28
	.word 0x8d342001  ! 369: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x82040011  ! 369: ADD_R	add 	%r16, %r17, %r1
	.word 0xa6040011  ! 369: ADD_R	add 	%r16, %r17, %r19
	.word 0x8b3c2001  ! 369: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x8b2c1011  ! 369: SLLX_R	sllx	%r16, %r17, %r5
	.word 0x937c2401  ! 369: MOVR_I	move	%r16, 0x7fff9c24, %r9
	.word 0xd7841011  ! 370: LDFA_R	lda	[%r16, %r17], %f11
thr1_irf_ce_38:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_38), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xe7040011  ! 372: LDF_R	ld	[%r16, %r17], %f19
	.word 0x8e142a38  ! 374: OR_I	or 	%r16, 0x0a38, %r7
	.word 0x9b3c2001  ! 374: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0xb21c0011  ! 374: XOR_R	xor 	%r16, %r17, %r25
	.word 0x942c24d1  ! 374: ANDN_I	andn 	%r16, 0x04d1, %r10
	.word 0x86b40011  ! 374: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0x8c842273  ! 374: ADDcc_I	addcc 	%r16, 0x0273, %r6
	.word 0xb21c0011  ! 374: XOR_R	xor 	%r16, %r17, %r25
	.word 0xca040011  ! 375: LDUW_R	lduw	[%r16 + %r17], %r5
thr1_irf_ce_39:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_39), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xd8442e73  ! 377: LDSW_I	ldsw	[%r16 + 0x0e73], %r12
	.word 0x9c342543  ! 379: ORN_I	orn 	%r16, 0x0543, %r14
	.word 0x8a8c0011  ! 379: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0xa89c2d71  ! 379: XORcc_I	xorcc 	%r16, 0x0d71, %r20
	.word 0x8e1c2b25  ! 379: XOR_I	xor 	%r16, 0x0b25, %r7
	.word 0x941c28a4  ! 379: XOR_I	xor 	%r16, 0x08a4, %r10
	.word 0x972c3001  ! 380: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x8e3c2241  ! 380: XNOR_I	xnor 	%r16, 0x0241, %r7
	.word 0x8b3c0011  ! 380: SRA_R	sra 	%r16, %r17, %r5
	.word 0xb77c2401  ! 380: MOVR_I	move	%r16, 0x7fff9c24, %r27
	.word 0xb82c0011  ! 380: ANDN_R	andn 	%r16, %r17, %r28
	.word 0x8eb42a4c  ! 380: ORNcc_I	orncc 	%r16, 0x0a4c, %r7
	.word 0x87342001  ! 380: SRL_I	srl 	%r16, 0x0001, %r3
	rd      %pc, %r18
	set     0x20, %r17
thr1_dc_err_28:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_28), 16, 16),1,DC_DATA,13)
	.word 0xed841000  ! 381: LDFA_R	lda	[%r16, %r0], %f22
thr1_irf_ce_40:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_40), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	return     %r18 + %r17
	.word 0xb5340011  ! 384: SRL_R	srl 	%r16, %r17, %r26
	.word 0xb68c0011  ! 384: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x980c0011  ! 384: AND_R	and 	%r16, %r17, %r12
	.word 0x9a340011  ! 384: ORN_R	orn 	%r16, %r17, %r13
	.word 0xb0c422bf  ! 384: ADDCcc_I	addccc 	%r16, 0x02bf, %r24
	.word 0x99643801  ! 384: MOVcc_I	<illegal instruction>
	.word 0xa8ac0011  ! 384: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0xd4dc1011  ! 385: LDXA_R	ldxa	[%r16, %r17] 0x80, %r10
thr1_irf_ce_41:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_41), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xf42c2b8e  ! 389: STB_I	stb	%r26, [%r16 + 0x0b8e]
	.word 0x972c2001  ! 391: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x97342001  ! 391: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0x961c2f80  ! 391: XOR_I	xor 	%r16, 0x0f80, %r11
	.word 0xb33c2001  ! 391: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0x9a3c0011  ! 391: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0xb4c42054  ! 391: ADDCcc_I	addccc 	%r16, 0x0054, %r26
	.word 0xb09c2bb8  ! 391: XORcc_I	xorcc 	%r16, 0x0bb8, %r24
	.word 0x83343001  ! 391: SRLX_I	srlx	%r16, 0x0001, %r1
thr1_dc_err_29:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_29), 16, 16),1,DC_DATA,28)
	.word 0xecc41000  ! 393: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r22
	.word 0xd25c0011  ! 395: LDX_R	ldx	[%r16 + %r17], %r9
	.word 0x861c26f6  ! 397: XOR_I	xor 	%r16, 0x06f6, %r3
	.word 0xa8ac0011  ! 397: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0x892c0011  ! 397: SLL_R	sll 	%r16, %r17, %r4
	.word 0xb03c0011  ! 397: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0x9e440011  ! 397: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x993c1011  ! 397: SRAX_R	srax	%r16, %r17, %r12
	.word 0xa92c3001  ! 397: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0x9f340011  ! 397: SRL_R	srl 	%r16, %r17, %r15
	.word 0xd5042101  ! 398: LDF_I	ld	[%r16, 0x0101], %f10
thr1_irf_ce_42:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_42), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xd40425bb  ! 400: LDUW_I	lduw	[%r16 + 0x05bb], %r10
	.word 0x9a1c0011  ! 402: XOR_R	xor 	%r16, %r17, %r13
	.word 0x93341011  ! 402: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x877c2401  ! 402: MOVR_I	move	%r16, 0x7fff9c24, %r3
	.word 0x84940011  ! 402: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x8d7c0411  ! 402: MOVR_R	move	%r16, %r17, %r6
	.word 0x897c2401  ! 402: MOVR_I	move	%r16, 0x7fff9c24, %r4
	.word 0x82b40011  ! 402: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x98bc0011  ! 402: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0xc2dc1011  ! 403: LDXA_R	ldxa	[%r16, %r17] 0x80, %r1
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0xb5343001  ! 407: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0x852c3001  ! 407: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0x8f343001  ! 407: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0xa83c2412  ! 407: XNOR_I	xnor 	%r16, 0x0412, %r20
	.word 0xaf641811  ! 407: MOVcc_R	<illegal instruction>
	.word 0x83343001  ! 407: SRLX_I	srlx	%r16, 0x0001, %r1
thr1_dc_err_30:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_30), 16, 16),1,DC_DATA,7)
	.word 0xd19c1000  ! 409: LDDFA_R	ldda	[%r16, %r0], %f8
thr1_irf_ce_43:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_43), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xc92422dd  ! 411: STF_I	st	%f4, [0x02dd, %r16]
	.word 0x961429cf  ! 413: OR_I	or 	%r16, 0x09cf, %r11
	.word 0x9b341011  ! 413: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x94140011  ! 413: OR_R	or 	%r16, %r17, %r10
	.word 0xbabc2c8a  ! 413: XNORcc_I	xnorcc 	%r16, 0x0c8a, %r29
	.word 0x88140011  ! 413: OR_R	or 	%r16, %r17, %r4
	.word 0xd4d423b9  ! 414: LDSHA_I	ldsha	[%r16, + 0x03b9] %asi, %r10
	.word 0xfb040011  ! 416: LDF_R	ld	[%r16, %r17], %f29
	.word 0xa82c2040  ! 418: ANDN_I	andn 	%r16, 0x0040, %r20
	.word 0x88140011  ! 418: OR_R	or 	%r16, %r17, %r4
	.word 0x89342001  ! 418: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0xb3341011  ! 418: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x8ab40011  ! 418: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0x963c0011  ! 418: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x953c1011  ! 418: SRAX_R	srax	%r16, %r17, %r10
	.word 0xccd41011  ! 419: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r6
	.word 0xcc540011  ! 421: LDSH_R	ldsh	[%r16 + %r17], %r6
	.word 0xb0140011  ! 423: OR_R	or 	%r16, %r17, %r24
	.word 0x90040011  ! 423: ADD_R	add 	%r16, %r17, %r8
	.word 0x8aac24ae  ! 423: ANDNcc_I	andncc 	%r16, 0x04ae, %r5
	.word 0xb7341011  ! 423: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x9ac42528  ! 423: ADDCcc_I	addccc 	%r16, 0x0528, %r13
	.word 0x8d3c0011  ! 423: SRA_R	sra 	%r16, %r17, %r6
	.word 0xf0140011  ! 424: LDUH_R	lduh	[%r16 + %r17], %r24
	.word 0xc36c2880  ! 426: PREFETCH_I	prefetch	[%r16 + 0x0880], #one_read
	.word 0x92b40011  ! 428: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0x8aac0011  ! 428: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x953c2001  ! 428: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x8c140011  ! 428: OR_R	or 	%r16, %r17, %r6
	.word 0xb52c0011  ! 428: SLL_R	sll 	%r16, %r17, %r26
	.word 0x88bc0011  ! 428: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0x853c0011  ! 428: SRA_R	sra 	%r16, %r17, %r2
	.word 0x873c0011  ! 428: SRA_R	sra 	%r16, %r17, %r3
	.word 0xfa941011  ! 429: LDUHA_R	lduha	[%r16, %r17] 0x80, %r29
thr1_irf_ce_44:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_44), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xf6742411  ! 433: STX_I	stx	%r27, [%r16 + 0x0411]
	.word 0x8e340011  ! 435: ORN_R	orn 	%r16, %r17, %r7
	.word 0x9cac0011  ! 435: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0xaf3c2001  ! 435: SRA_I	sra 	%r16, 0x0001, %r23
	.word 0x897c0411  ! 435: MOVR_R	move	%r16, %r17, %r4
	.word 0xb72c1011  ! 435: SLLX_R	sllx	%r16, %r17, %r27
thr1_dc_err_31:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_31), 16, 16),1,DC_DATA,30)
	.word 0xea042764  ! 437: LDUW_I	lduw	[%r16 + 0x0764], %r21
thr1_irf_ce_45:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_45), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xcf140011  ! 439: LDQF_R	-	[%r16, %r17], %f7
	.word 0xba140011  ! 441: OR_R	or 	%r16, %r17, %r29
	.word 0xb49c2f29  ! 441: XORcc_I	xorcc 	%r16, 0x0f29, %r26
	.word 0x88042b02  ! 441: ADD_I	add 	%r16, 0x0b02, %r4
	.word 0x908c0011  ! 441: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x8cac0011  ! 441: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0xc2842cbd  ! 442: LDUWA_I	lduwa	[%r16, + 0x0cbd] %asi, %r1
thr1_irf_ce_46:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_46), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xd01c28ef  ! 444: LDD_I	ldd	[%r16 + 0x08ef], %r8
	.word 0x8ac40011  ! 446: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0xb2142b36  ! 446: OR_I	or 	%r16, 0x0b36, %r25
	.word 0xa93c1011  ! 446: SRAX_R	srax	%r16, %r17, %r20
	.word 0x853c2001  ! 446: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0x988c2429  ! 446: ANDcc_I	andcc 	%r16, 0x0429, %r12
	.word 0xc9042b46  ! 447: LDF_I	ld	[%r16, 0x0b46], %f4
thr1_irf_ce_47:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_47), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xc8c41011  ! 449: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r4
	.word 0x8e4421b9  ! 451: ADDC_I	addc 	%r16, 0x01b9, %r7
	.word 0xb4bc0011  ! 451: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0x88942fa3  ! 451: ORcc_I	orcc 	%r16, 0x0fa3, %r4
	.word 0x8e1c0011  ! 451: XOR_R	xor 	%r16, %r17, %r7
	.word 0xbab40011  ! 451: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x90ac2741  ! 451: ANDNcc_I	andncc 	%r16, 0x0741, %r8
	.word 0x902c2ccb  ! 451: ANDN_I	andn 	%r16, 0x0ccb, %r8
	.word 0xb41c0011  ! 451: XOR_R	xor 	%r16, %r17, %r26
	.word 0xce1c0011  ! 452: LDD_R	ldd	[%r16 + %r17], %r7
	.word 0xdedc1011  ! 454: LDXA_R	ldxa	[%r16, %r17] 0x80, %r15
	.word 0xb8bc0011  ! 456: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0x8d342001  ! 456: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x8604251b  ! 456: ADD_I	add 	%r16, 0x051b, %r3
	.word 0xaa9c2251  ! 456: XORcc_I	xorcc 	%r16, 0x0251, %r21
	.word 0x85342001  ! 456: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0xb68c0011  ! 456: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0xa6bc282c  ! 456: XNORcc_I	xnorcc 	%r16, 0x082c, %r19
	.word 0x9e3c2b60  ! 456: XNOR_I	xnor 	%r16, 0x0b60, %r15
	.word 0xc9040011  ! 457: LDF_R	ld	[%r16, %r17], %f4
	.word 0xc6fc1011  ! 459: SWAPA_R	swapa	%r3, [%r16 + %r17] 0x80
	.word 0x8c2c2f4b  ! 461: ANDN_I	andn 	%r16, 0x0f4b, %r6
	.word 0x88140011  ! 461: OR_R	or 	%r16, %r17, %r4
	.word 0xb2140011  ! 461: OR_R	or 	%r16, %r17, %r25
	.word 0xb12c3001  ! 461: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0xb2bc0011  ! 461: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0xacb40011  ! 461: ORNcc_R	orncc 	%r16, %r17, %r22
thr1_dc_err_32:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_32), 16, 16),1,DC_DATA,33)
	.word 0xf0cc1000  ! 463: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r24
!Illinst alu
	.word 0xacac2d7f  ! 465: ANDNcc_I	andncc 	%r16, 0x0d7f, %r22
	.word 0x889c22cf  ! 467: XORcc_I	xorcc 	%r16, 0x02cf, %r4
	.word 0x852c1011  ! 467: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x973c1011  ! 467: SRAX_R	srax	%r16, %r17, %r11
	.word 0x962c21d6  ! 467: ANDN_I	andn 	%r16, 0x01d6, %r11
	.word 0xac0c214c  ! 467: AND_I	and 	%r16, 0x014c, %r22
	.word 0x9f2c1011  ! 467: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x901c2b8d  ! 467: XOR_I	xor 	%r16, 0x0b8d, %r8
	.word 0xe9941011  ! 468: LDQFA_R	-	[%r16, %r17], %f20
thr1_irf_ce_48:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_48), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xcc941011  ! 470: LDUHA_R	lduha	[%r16, %r17] 0x80, %r6
	.word 0xb12c2001  ! 472: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0x822c2514  ! 472: ANDN_I	andn 	%r16, 0x0514, %r1
	.word 0xb4ac0011  ! 472: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0xaaac2ec7  ! 472: ANDNcc_I	andncc 	%r16, 0x0ec7, %r21
	.word 0x9a042999  ! 472: ADD_I	add 	%r16, 0x0999, %r13
	.word 0xacb42e7b  ! 472: ORNcc_I	orncc 	%r16, 0x0e7b, %r22
	.word 0xba340011  ! 472: ORN_R	orn 	%r16, %r17, %r29
thr1_dc_err_33:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_33), 16, 16),1,DC_DATA,19)
	.word 0xcccc1000  ! 474: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r6
thr1_irf_ce_49:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_49), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xd4242dd4  ! 478: STW_I	stw	%r10, [%r16 + 0x0dd4]
	.word 0x909c2e9b  ! 480: XORcc_I	xorcc 	%r16, 0x0e9b, %r8
	.word 0x94140011  ! 480: OR_R	or 	%r16, %r17, %r10
	.word 0x9e9c2073  ! 480: XORcc_I	xorcc 	%r16, 0x0073, %r15
	.word 0x883c0011  ! 480: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0xb6442b17  ! 480: ADDC_I	addc 	%r16, 0x0b17, %r27
	.word 0x8e1c0011  ! 480: XOR_R	xor 	%r16, %r17, %r7
	.word 0x9eac0011  ! 480: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xdcc41011  ! 481: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r14
	.word 0xd79c1011  ! 483: LDDFA_R	ldda	[%r16, %r17], %f11
	.word 0x8cac234d  ! 485: ANDNcc_I	andncc 	%r16, 0x034d, %r6
	.word 0xb8042fd1  ! 485: ADD_I	add 	%r16, 0x0fd1, %r28
	.word 0x9c44241d  ! 485: ADDC_I	addc 	%r16, 0x041d, %r14
	.word 0xb08c2c9b  ! 485: ANDcc_I	andcc 	%r16, 0x0c9b, %r24
	.word 0x992c2001  ! 485: SLL_I	sll 	%r16, 0x0001, %r12
thr1_dc_err_34:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_34), 16, 16),1,DC_DATA,20)
	.word 0xc5142be9  ! 487: LDQF_I	-	[%r16, 0x0be9], %f2
	.word 0xdcec1011  ! 489: LDSTUBA_R	ldstuba	%r14, [%r16 + %r17] 0x80
	.word 0x952c1011  ! 491: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x9a0c2195  ! 491: AND_I	and 	%r16, 0x0195, %r13
	.word 0x862c0011  ! 491: ANDN_R	andn 	%r16, %r17, %r3
	.word 0xaf7c0411  ! 491: MOVR_R	move	%r16, %r17, %r23
	.word 0xb634289a  ! 491: ORN_I	orn 	%r16, 0x089a, %r27
	.word 0x82840011  ! 491: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xad7c0411  ! 491: MOVR_R	move	%r16, %r17, %r22
	.word 0x9f2c1011  ! 491: SLLX_R	sllx	%r16, %r17, %r15
	.word 0xec0c0011  ! 492: LDUB_R	ldub	[%r16 + %r17], %r22
	.word 0xc39c1011  ! 494: LDDFA_R	ldda	[%r16, %r17], %f1
	.word 0x888c2326  ! 496: ANDcc_I	andcc 	%r16, 0x0326, %r4
	.word 0x869c0011  ! 496: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0x9a8c239c  ! 496: ANDcc_I	andcc 	%r16, 0x039c, %r13
	.word 0x8a8c2326  ! 496: ANDcc_I	andcc 	%r16, 0x0326, %r5
	.word 0x8f7c0411  ! 496: MOVR_R	move	%r16, %r17, %r7
	.word 0x8d2c2001  ! 496: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0xc71c236c  ! 497: LDDF_I	ldd	[%r16, 0x036c], %f3
	.word 0xf9841011  ! 499: LDFA_R	lda	[%r16, %r17], %f28
	.word 0x84c4251b  ! 501: ADDCcc_I	addccc 	%r16, 0x051b, %r2
	.word 0x912c2001  ! 501: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0x8ab429a8  ! 501: ORNcc_I	orncc 	%r16, 0x09a8, %r5
	.word 0xb13c1011  ! 501: SRAX_R	srax	%r16, %r17, %r24
	.word 0xa9341011  ! 501: SRLX_R	srlx	%r16, %r17, %r20
	.word 0xb80c0011  ! 501: AND_R	and 	%r16, %r17, %r28
	.word 0x9e3c0011  ! 501: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0x95341011  ! 501: SRLX_R	srlx	%r16, %r17, %r10
	.word 0xf00c2ac4  ! 502: LDUB_I	ldub	[%r16 + 0x0ac4], %r24
        wr %g0, 0x4, %fprs
	.word 0x941c2f66  ! 506: XOR_I	xor 	%r16, 0x0f66, %r10
	.word 0x9e940011  ! 506: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x95343001  ! 506: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0xae042513  ! 506: ADD_I	add 	%r16, 0x0513, %r23
	.word 0xae940011  ! 506: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0xb77c2401  ! 506: MOVR_I	move	%r16, 0x7fff9c24, %r27
	.word 0x877c0411  ! 506: MOVR_R	move	%r16, %r17, %r3
	.word 0x99643801  ! 506: MOVcc_I	<illegal instruction>
	.word 0xe81c2897  ! 507: LDD_I	ldd	[%r16 + 0x0897], %r20
	.word 0xc71c29c2  ! 509: LDDF_I	ldd	[%r16, 0x09c2], %f3
	.word 0xacac0011  ! 511: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0x86b42dd0  ! 511: ORNcc_I	orncc 	%r16, 0x0dd0, %r3
	.word 0xb80429e1  ! 511: ADD_I	add 	%r16, 0x09e1, %r28
	.word 0xba2c2f71  ! 511: ANDN_I	andn 	%r16, 0x0f71, %r29
	.word 0xb21c2cc7  ! 511: XOR_I	xor 	%r16, 0x0cc7, %r25
	.word 0x84842f29  ! 511: ADDcc_I	addcc 	%r16, 0x0f29, %r2
	.word 0x9cac2363  ! 511: ANDNcc_I	andncc 	%r16, 0x0363, %r14
thr1_dc_err_35:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_35), 16, 16),1,DC_DATA,28)
	.word 0xdf841000  ! 513: LDFA_R	lda	[%r16, %r0], %f15
        wr %g0, 0x4, %fprs
	.word 0x912c2001  ! 517: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0x9e3c0011  ! 517: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0x99343001  ! 517: SRLX_I	srlx	%r16, 0x0001, %r12
	.word 0x849c2dc9  ! 517: XORcc_I	xorcc 	%r16, 0x0dc9, %r2
	.word 0x852c0011  ! 517: SLL_R	sll 	%r16, %r17, %r2
	.word 0x8ab42972  ! 517: ORNcc_I	orncc 	%r16, 0x0972, %r5
	.word 0xb2442473  ! 517: ADDC_I	addc 	%r16, 0x0473, %r25
	.word 0xf05c0011  ! 518: LDX_R	ldx	[%r16 + %r17], %r24
thr1_irf_ce_50:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_50), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xeed41011  ! 520: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r23
	.word 0x832c3001  ! 522: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x8ebc0011  ! 522: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x99641811  ! 522: MOVcc_R	<illegal instruction>
	.word 0x8f341011  ! 522: SRLX_R	srlx	%r16, %r17, %r7
	.word 0xb03c0011  ! 522: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0xc3140011  ! 523: LDQF_R	-	[%r16, %r17], %f1
!Illinst store
	.word 0xec240011  ! 525: STW_R	stw	%r22, [%r16 + %r17]
	.word 0x8f7c2401  ! 527: MOVR_I	move	%r16, 0x7fff9c24, %r7
	.word 0xb6442494  ! 527: ADDC_I	addc 	%r16, 0x0494, %r27
	.word 0x8b2c2001  ! 527: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0xa97c0411  ! 527: MOVR_R	move	%r16, %r17, %r20
	.word 0x8b2c3001  ! 527: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0xa80c0011  ! 527: AND_R	and 	%r16, %r17, %r20
	.word 0x95343001  ! 527: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0x8e1c2bb1  ! 527: XOR_I	xor 	%r16, 0x0bb1, %r7
thr1_dc_err_36:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_36), 16, 16),1,DC_DATA,52)
	.word 0xd59c1000  ! 529: LDDFA_R	ldda	[%r16, %r0], %f10
thr1_irf_ce_51:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_51), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xc64c2d18  ! 531: LDSB_I	ldsb	[%r16 + 0x0d18], %r3
	.word 0x8eb40011  ! 533: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0xb64423d0  ! 533: ADDC_I	addc 	%r16, 0x03d0, %r27
	.word 0xac1c240c  ! 533: XOR_I	xor 	%r16, 0x040c, %r22
	.word 0x973c0011  ! 533: SRA_R	sra 	%r16, %r17, %r11
	.word 0xaab42c75  ! 533: ORNcc_I	orncc 	%r16, 0x0c75, %r21
	.word 0x9e140011  ! 533: OR_R	or 	%r16, %r17, %r15
	.word 0xbaac0011  ! 533: ANDNcc_R	andncc 	%r16, %r17, %r29
	.word 0xc8dc233c  ! 534: LDXA_I	ldxa	[%r16, + 0x033c] %asi, %r4
	.word 0xc8042700  ! 536: LDUW_I	lduw	[%r16 + 0x0700], %r4
	.word 0x8f643801  ! 538: MOVcc_I	<illegal instruction>
	.word 0x96b40011  ! 538: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0x8a9c0011  ! 538: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0xa93c0011  ! 538: SRA_R	sra 	%r16, %r17, %r20
	.word 0x8ec42777  ! 538: ADDCcc_I	addccc 	%r16, 0x0777, %r7
thr1_dc_err_37:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_37), 16, 16),1,DC_DATA,46)
	.word 0xd89c1000  ! 540: LDDA_R	ldda	[%r16, %r0] 0x80, %r12
thr1_irf_ce_52:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_52), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xc2742994  ! 544: STX_I	stx	%r1, [%r16 + 0x0994]
	.word 0x84340011  ! 546: ORN_R	orn 	%r16, %r17, %r2
	.word 0x9e840011  ! 546: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xacb42e45  ! 546: ORNcc_I	orncc 	%r16, 0x0e45, %r22
	.word 0xb88c2a10  ! 546: ANDcc_I	andcc 	%r16, 0x0a10, %r28
	.word 0x953c0011  ! 546: SRA_R	sra 	%r16, %r17, %r10
	.word 0xdf040011  ! 547: LDF_R	ld	[%r16, %r17], %f15
	.word 0x97a00151  ! 549: FABSd	fabsd	%f48, %f42
	.word 0x82b429a3  ! 551: ORNcc_I	orncc 	%r16, 0x09a3, %r1
	.word 0x8c3c0011  ! 551: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x9e142775  ! 551: OR_I	or 	%r16, 0x0775, %r15
	.word 0x94c40011  ! 551: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0xb42c0011  ! 551: ANDN_R	andn 	%r16, %r17, %r26
	.word 0xda44251b  ! 552: LDSW_I	ldsw	[%r16 + 0x051b], %r13
	.word 0xf47422a9  ! 556: STX_I	stx	%r26, [%r16 + 0x02a9]
	.word 0x852c0011  ! 558: SLL_R	sll 	%r16, %r17, %r2
	.word 0xbac40011  ! 558: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0x863423bb  ! 558: ORN_I	orn 	%r16, 0x03bb, %r3
	.word 0xad341011  ! 558: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x9abc221a  ! 558: XNORcc_I	xnorcc 	%r16, 0x021a, %r13
	.word 0xaa8c2e32  ! 558: ANDcc_I	andcc 	%r16, 0x0e32, %r21
thr1_dc_err_38:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_38), 16, 16),1,DC_DATA,5)
	.word 0xd1140000  ! 560: LDQF_R	-	[%r16, %r0], %f8
	.word 0x905c0011  ! 562: SMUL_R	smul 	%r16, %r17, %r8
	.word 0xaf7c2401  ! 564: MOVR_I	move	%r16, 0x7fff9c24, %r23
	.word 0xae942a05  ! 564: ORcc_I	orcc 	%r16, 0x0a05, %r23
	.word 0x98942618  ! 564: ORcc_I	orcc 	%r16, 0x0618, %r12
	.word 0x8d2c0011  ! 564: SLL_R	sll 	%r16, %r17, %r6
	.word 0x922c0011  ! 564: ANDN_R	andn 	%r16, %r17, %r9
	.word 0xb01c20fb  ! 564: XOR_I	xor 	%r16, 0x00fb, %r24
	.word 0xa89c2363  ! 564: XORcc_I	xorcc 	%r16, 0x0363, %r20
	.word 0xaec4211c  ! 564: ADDCcc_I	addccc 	%r16, 0x011c, %r23
thr1_dc_err_39:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_39), 16, 16),1,DC_DATA,8)
	.word 0xc99c1000  ! 566: LDDFA_R	ldda	[%r16, %r0], %f4
thr1_irf_ce_53:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_53), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xeecc1011  ! 568: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r23
	.word 0xb21c0011  ! 570: XOR_R	xor 	%r16, %r17, %r25
	.word 0x8c1c0011  ! 570: XOR_R	xor 	%r16, %r17, %r6
	.word 0xb48c0011  ! 570: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0xa89424c4  ! 570: ORcc_I	orcc 	%r16, 0x04c4, %r20
	.word 0xa8940011  ! 570: ORcc_R	orcc 	%r16, %r17, %r20
	.word 0xaebc0011  ! 570: XNORcc_R	xnorcc 	%r16, %r17, %r23
thr1_dc_err_40:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_40), 16, 16),1,DC_DATA,1)
	.word 0xcc4c0000  ! 572: LDSB_R	ldsb	[%r16 + %r0], %r6
	.word 0x8143e049  ! 574: MEMBAR	membar	#LoadLoad | #StoreStore | #Sync 
	.word 0x897c2401  ! 576: MOVR_I	move	%r16, 0x7fff9c24, %r4
	.word 0x9a140011  ! 576: OR_R	or 	%r16, %r17, %r13
	.word 0x88442717  ! 576: ADDC_I	addc 	%r16, 0x0717, %r4
	.word 0x848c2806  ! 576: ANDcc_I	andcc 	%r16, 0x0806, %r2
	.word 0xb0340011  ! 576: ORN_R	orn 	%r16, %r17, %r24
	.word 0xf2540011  ! 577: LDSH_R	ldsh	[%r16 + %r17], %r25
thr1_irf_ce_54:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_54), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xdf841011  ! 579: LDFA_R	lda	[%r16, %r17], %f15
	.word 0x961c20a3  ! 581: XOR_I	xor 	%r16, 0x00a3, %r11
	.word 0xb80c2d27  ! 581: AND_I	and 	%r16, 0x0d27, %r28
	.word 0x99341011  ! 581: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x8d2c0011  ! 581: SLL_R	sll 	%r16, %r17, %r6
	.word 0x922c26c2  ! 581: ANDN_I	andn 	%r16, 0x06c2, %r9
	.word 0xda9c26b4  ! 582: LDDA_I	ldda	[%r16, + 0x06b4] %asi, %r13
thr1_irf_ce_55:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_55), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xd5040011  ! 584: LDF_R	ld	[%r16, %r17], %f10
	.word 0xb89c0011  ! 586: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0xa92c0011  ! 586: SLL_R	sll 	%r16, %r17, %r20
	.word 0x8c8c0011  ! 586: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0x9e3c2dfd  ! 586: XNOR_I	xnor 	%r16, 0x0dfd, %r15
	.word 0x952c3001  ! 586: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x96840011  ! 586: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0xab3c1011  ! 586: SRAX_R	srax	%r16, %r17, %r21
thr1_dc_err_41:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_41), 16, 16),1,DC_DATA,1)
	.word 0xcac42053  ! 588: LDSWA_I	ldswa	[%r16, + 0x0053] %asi, %r5
thr1_irf_ce_56:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_56), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0x84dc2b2b  ! 590: SMULcc_I	smulcc 	%r16, 0x0b2b, %r2
	.word 0x92040011  ! 592: ADD_R	add 	%r16, %r17, %r9
	.word 0xb5341011  ! 592: SRLX_R	srlx	%r16, %r17, %r26
	.word 0x9c1c0011  ! 592: XOR_R	xor 	%r16, %r17, %r14
	.word 0xaa0c212e  ! 592: AND_I	and 	%r16, 0x012e, %r21
	.word 0xa6040011  ! 592: ADD_R	add 	%r16, %r17, %r19
thr1_dc_err_42:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_42), 16, 16),1,DC_DATA,50)
	.word 0xd3140000  ! 594: LDQF_R	-	[%r16, %r0], %f9
thr1_irf_ce_57:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_57), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xcc4c292d  ! 596: LDSB_I	ldsb	[%r16 + 0x092d], %r6
	.word 0x843c0011  ! 598: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0xa92c1011  ! 598: SLLX_R	sllx	%r16, %r17, %r20
	.word 0x86140011  ! 598: OR_R	or 	%r16, %r17, %r3
	.word 0x9d643801  ! 598: MOVcc_I	<illegal instruction>
	.word 0x904424ce  ! 598: ADDC_I	addc 	%r16, 0x04ce, %r8
	.word 0x8f3c1011  ! 598: SRAX_R	srax	%r16, %r17, %r7
	.word 0xa72c0011  ! 598: SLL_R	sll 	%r16, %r17, %r19
	.word 0x96ac0011  ! 598: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0xc29c1011  ! 599: LDDA_R	ldda	[%r16, %r17] 0x80, %r1
	.word 0xf60c0011  ! 601: LDUB_R	ldub	[%r16 + %r17], %r27
	.word 0x87341011  ! 603: SRLX_R	srlx	%r16, %r17, %r3
	.word 0xb1341011  ! 603: SRLX_R	srlx	%r16, %r17, %r24
	.word 0x822c0011  ! 603: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x9b341011  ! 603: SRLX_R	srlx	%r16, %r17, %r13
	.word 0xab342001  ! 603: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x88440011  ! 603: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x96ac0011  ! 603: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x969c0011  ! 603: XORcc_R	xorcc 	%r16, %r17, %r11
thr1_dc_err_43:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_43), 16, 16),1,DC_DATA,18)
	.word 0xce5c0000  ! 605: LDX_R	ldx	[%r16 + %r0], %r7
thr1_irf_ce_58:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_58), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xf1841011  ! 607: LDFA_R	lda	[%r16, %r17], %f24
	.word 0xb12c1011  ! 609: SLLX_R	sllx	%r16, %r17, %r24
	.word 0x9c040011  ! 609: ADD_R	add 	%r16, %r17, %r14
	.word 0x92b42257  ! 609: ORNcc_I	orncc 	%r16, 0x0257, %r9
	.word 0x897c0411  ! 609: MOVR_R	move	%r16, %r17, %r4
	.word 0x9d641811  ! 609: MOVcc_R	<illegal instruction>
	.word 0xac042a42  ! 609: ADD_I	add 	%r16, 0x0a42, %r22
	.word 0x9e842cc9  ! 609: ADDcc_I	addcc 	%r16, 0x0cc9, %r15
	.word 0xaa142682  ! 609: OR_I	or 	%r16, 0x0682, %r21
thr1_dc_err_44:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_44), 16, 16),1,DC_DATA,22)
	.word 0xea442bfa  ! 611: LDSW_I	ldsw	[%r16 + 0x0bfa], %r21
thr1_irf_ce_59:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_59), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97340011  ! 615: SRL_R	srl 	%r16, %r17, %r11
	.word 0x933c0011  ! 615: SRA_R	sra 	%r16, %r17, %r9
	.word 0x8c940011  ! 615: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0xaf341011  ! 615: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xa8942d47  ! 615: ORcc_I	orcc 	%r16, 0x0d47, %r20
	.word 0xa8ac0011  ! 615: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0x9cbc0011  ! 615: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0xd29424bc  ! 616: LDUHA_I	lduha	[%r16, + 0x04bc] %asi, %r9
thr1_irf_ce_60:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_60), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xf5140011  ! 618: LDQF_R	-	[%r16, %r17], %f26
	.word 0x91343001  ! 620: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0x94042021  ! 620: ADD_I	add 	%r16, 0x0021, %r10
	.word 0xae3c0011  ! 620: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x908c0011  ! 620: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0xae440011  ! 620: ADDC_R	addc 	%r16, %r17, %r23
	.word 0x97643801  ! 620: MOVcc_I	<illegal instruction>
thr1_dc_err_45:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_45), 16, 16),1,DC_DATA,35)
	.word 0xde5c0000  ! 622: LDX_R	ldx	[%r16 + %r0], %r15
thr1_irf_ce_61:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_61), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xc25c2e73  ! 624: LDX_I	ldx	[%r16 + 0x0e73], %r1
	.word 0x980c0011  ! 626: AND_R	and 	%r16, %r17, %r12
	.word 0x92440011  ! 626: ADDC_R	addc 	%r16, %r17, %r9
	.word 0xb6342f37  ! 626: ORN_I	orn 	%r16, 0x0f37, %r27
	.word 0xb4c40011  ! 626: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0xba9c237d  ! 626: XORcc_I	xorcc 	%r16, 0x037d, %r29
	.word 0x8404211f  ! 626: ADD_I	add 	%r16, 0x011f, %r2
	.word 0x92c40011  ! 626: ADDCcc_R	addccc 	%r16, %r17, %r9
thr1_dc_err_46:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_46), 16, 16),1,DC_DATA,9)
	.word 0xdc941000  ! 628: LDUHA_R	lduha	[%r16, %r0] 0x80, %r14
thr1_irf_ce_62:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_62), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xc3ec1011  ! 630: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x90340011  ! 632: ORN_R	orn 	%r16, %r17, %r8
	.word 0x94b40011  ! 632: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0x84940011  ! 632: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0xaa140011  ! 632: OR_R	or 	%r16, %r17, %r21
	.word 0x882c2b61  ! 632: ANDN_I	andn 	%r16, 0x0b61, %r4
	.word 0xd51422da  ! 633: LDQF_I	-	[%r16, 0x02da], %f10
thr1_irf_ce_63:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_63), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xc4842352  ! 635: LDUWA_I	lduwa	[%r16, + 0x0352] %asi, %r2
	.word 0x8b2c2001  ! 637: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x8f2c3001  ! 637: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0xaa842eca  ! 637: ADDcc_I	addcc 	%r16, 0x0eca, %r21
	.word 0xaa840011  ! 637: ADDcc_R	addcc 	%r16, %r17, %r21
	.word 0xb00c25cb  ! 637: AND_I	and 	%r16, 0x05cb, %r24
	.word 0xb32c2001  ! 637: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0xea042fbf  ! 638: LDUW_I	lduw	[%r16 + 0x0fbf], %r21
thr1_irf_ce_64:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_64), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xf11c26dd  ! 640: LDDF_I	ldd	[%r16, 0x06dd], %f24
	.word 0xb49c0011  ! 642: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xb4b42a75  ! 642: ORNcc_I	orncc 	%r16, 0x0a75, %r26
	.word 0xb83c2148  ! 642: XNOR_I	xnor 	%r16, 0x0148, %r28
	.word 0x9f3c1011  ! 642: SRAX_R	srax	%r16, %r17, %r15
	.word 0x961c0011  ! 642: XOR_R	xor 	%r16, %r17, %r11
	.word 0xe69c1011  ! 643: LDDA_R	ldda	[%r16, %r17] 0x80, %r19
        wr %g0, 0x4, %fprs
	.word 0xa72c2001  ! 647: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0xaa440011  ! 647: ADDC_R	addc 	%r16, %r17, %r21
	.word 0xb8142a66  ! 647: OR_I	or 	%r16, 0x0a66, %r28
	.word 0xb8040011  ! 647: ADD_R	add 	%r16, %r17, %r28
	.word 0x9cb40011  ! 647: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0xf3042362  ! 648: LDF_I	ld	[%r16, 0x0362], %f25
thr1_irf_ce_65:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_65), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
        wr %g0, 0x4, %fprs
	.word 0x8e84204d  ! 652: ADDcc_I	addcc 	%r16, 0x004d, %r7
	.word 0xb40c0011  ! 652: AND_R	and 	%r16, %r17, %r26
	.word 0xb1342001  ! 652: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0x949c29f1  ! 652: XORcc_I	xorcc 	%r16, 0x09f1, %r10
	.word 0x853c2001  ! 652: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0xfb142346  ! 653: LDQF_I	-	[%r16, 0x0346], %f29
	.word 0xdd841011  ! 655: LDFA_R	lda	[%r16, %r17], %f14
	.word 0xb43c2919  ! 657: XNOR_I	xnor 	%r16, 0x0919, %r26
	.word 0x90ac0011  ! 657: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0xb9643801  ! 657: MOVcc_I	<illegal instruction>
	.word 0x90342997  ! 657: ORN_I	orn 	%r16, 0x0997, %r8
	.word 0x91341011  ! 657: SRLX_R	srlx	%r16, %r17, %r8
	.word 0xc254215f  ! 658: LDSH_I	ldsh	[%r16 + 0x015f], %r1
	.word 0xeb9c1011  ! 660: LDDFA_R	ldda	[%r16, %r17], %f21
	.word 0x997c2401  ! 662: MOVR_I	move	%r16, 0x7fff9c24, %r12
	.word 0x90ac0011  ! 662: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0xb3643801  ! 662: MOVcc_I	<illegal instruction>
	.word 0x962c0011  ! 662: ANDN_R	andn 	%r16, %r17, %r11
	.word 0xb52c3001  ! 662: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0x9e342cce  ! 662: ORN_I	orn 	%r16, 0x0cce, %r15
thr1_dc_err_47:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_47), 16, 16),1,DC_DATA,53)
	.word 0xc60c0000  ! 664: LDUB_R	ldub	[%r16 + %r0], %r3
thr1_irf_ce_66:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_66), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xd1142137  ! 666: LDQF_I	-	[%r16, 0x0137], %f8
	.word 0xb82c0011  ! 668: ANDN_R	andn 	%r16, %r17, %r28
	.word 0xb01424cb  ! 668: OR_I	or 	%r16, 0x04cb, %r24
	.word 0xaf3c2001  ! 668: SRA_I	sra 	%r16, 0x0001, %r23
	.word 0xb5342001  ! 668: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0x82342fb6  ! 668: ORN_I	orn 	%r16, 0x0fb6, %r1
	.word 0x9f2c0011  ! 668: SLL_R	sll 	%r16, %r17, %r15
	.word 0x9a140011  ! 668: OR_R	or 	%r16, %r17, %r13
	.word 0x9e940011  ! 668: ORcc_R	orcc 	%r16, %r17, %r15
thr1_dc_err_48:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_48), 16, 16),1,DC_DATA,48)
	.word 0xe8540000  ! 670: LDSH_R	ldsh	[%r16 + %r0], %r20
	.word 0xca9c1011  ! 672: LDDA_R	ldda	[%r16, %r17] 0x80, %r5
	.word 0xb4c42634  ! 674: ADDCcc_I	addccc 	%r16, 0x0634, %r26
	.word 0x860c0011  ! 674: AND_R	and 	%r16, %r17, %r3
	.word 0x942c26f4  ! 674: ANDN_I	andn 	%r16, 0x06f4, %r10
	.word 0x8c440011  ! 674: ADDC_R	addc 	%r16, %r17, %r6
	.word 0xb57c2401  ! 674: MOVR_I	move	%r16, 0x7fff9c24, %r26
thr1_dc_err_49:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_49), 16, 16),1,DC_DATA,32)
	.word 0xf0140000  ! 676: LDUH_R	lduh	[%r16 + %r0], %r24
thr1_irf_ce_67:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_67), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xdc5c0011  ! 678: LDX_R	ldx	[%r16 + %r17], %r14
	.word 0xb93c0011  ! 680: SRA_R	sra 	%r16, %r17, %r28
	.word 0xa7643801  ! 680: MOVcc_I	<illegal instruction>
	.word 0xb89c0011  ! 680: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0x83343001  ! 680: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x8234252d  ! 680: ORN_I	orn 	%r16, 0x052d, %r1
thr1_dc_err_50:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_50), 16, 16),1,DC_DATA,35)
	.word 0xdb140000  ! 682: LDQF_R	-	[%r16, %r0], %f13
	.word 0xcf841011  ! 684: LDFA_R	lda	[%r16, %r17], %f7
	.word 0xa8b40011  ! 686: ORNcc_R	orncc 	%r16, %r17, %r20
	.word 0x822c2cbd  ! 686: ANDN_I	andn 	%r16, 0x0cbd, %r1
	.word 0x9d3c2001  ! 686: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x9b343001  ! 686: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xbb2c3001  ! 686: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xbb3c1011  ! 686: SRAX_R	srax	%r16, %r17, %r29
	.word 0x8b340011  ! 686: SRL_R	srl 	%r16, %r17, %r5
	.word 0x9f7c0411  ! 686: MOVR_R	move	%r16, %r17, %r15
	.word 0xccdc2143  ! 687: LDXA_I	ldxa	[%r16, + 0x0143] %asi, %r6
thr1_irf_ce_68:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_68), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xc3ec256f  ! 689: PREFETCHA_I	prefetcha	[%r16, + 0x056f] %asi, #one_read
	.word 0x873c2001  ! 691: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x963c2a1d  ! 691: XNOR_I	xnor 	%r16, 0x0a1d, %r11
	.word 0xa8140011  ! 691: OR_R	or 	%r16, %r17, %r20
	.word 0xaa842c11  ! 691: ADDcc_I	addcc 	%r16, 0x0c11, %r21
	.word 0x99643801  ! 691: MOVcc_I	<illegal instruction>
	.word 0x9d3c0011  ! 691: SRA_R	sra 	%r16, %r17, %r14
	.word 0xc2c428b4  ! 692: LDSWA_I	ldswa	[%r16, + 0x08b4] %asi, %r1
	.word 0xc4942738  ! 694: LDUHA_I	lduha	[%r16, + 0x0738] %asi, %r2
	.word 0x8e140011  ! 696: OR_R	or 	%r16, %r17, %r7
	.word 0x9e0c2d58  ! 696: AND_I	and 	%r16, 0x0d58, %r15
	.word 0xab342001  ! 696: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x982c2a91  ! 696: ANDN_I	andn 	%r16, 0x0a91, %r12
	.word 0x82340011  ! 696: ORN_R	orn 	%r16, %r17, %r1
	.word 0x86842a9f  ! 696: ADDcc_I	addcc 	%r16, 0x0a9f, %r3
	.word 0xa72c1011  ! 696: SLLX_R	sllx	%r16, %r17, %r19
	.word 0x8a44247f  ! 696: ADDC_I	addc 	%r16, 0x047f, %r5
thr1_dc_err_51:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_51), 16, 16),1,DC_DATA,40)
	.word 0xd65c0000  ! 698: LDX_R	ldx	[%r16 + %r0], %r11
	.word 0xe91c276b  ! 700: LDDF_I	ldd	[%r16, 0x076b], %f20
	.word 0xb7342001  ! 702: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xb5341011  ! 702: SRLX_R	srlx	%r16, %r17, %r26
	.word 0x8e2c2c00  ! 702: ANDN_I	andn 	%r16, 0x0c00, %r7
	.word 0xb02c26d6  ! 702: ANDN_I	andn 	%r16, 0x06d6, %r24
	.word 0x8f3c0011  ! 702: SRA_R	sra 	%r16, %r17, %r7
	.word 0xb8b42b30  ! 702: ORNcc_I	orncc 	%r16, 0x0b30, %r28
	.word 0xb43c0011  ! 702: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x93343001  ! 702: SRLX_I	srlx	%r16, 0x0001, %r9
thr1_dc_err_52:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_52), 16, 16),1,DC_DATA,65)
	.word 0xc4cc238d  ! 704: LDSBA_I	ldsba	[%r16, + 0x038d] %asi, %r2
	.word 0xcd142e50  ! 706: LDQF_I	-	[%r16, 0x0e50], %f6
	.word 0xb33c2001  ! 708: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0x933c1011  ! 708: SRAX_R	srax	%r16, %r17, %r9
	.word 0x9c142940  ! 708: OR_I	or 	%r16, 0x0940, %r14
	.word 0x8c3c0011  ! 708: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x904424e6  ! 708: ADDC_I	addc 	%r16, 0x04e6, %r8
	.word 0x8c040011  ! 708: ADD_R	add 	%r16, %r17, %r6
thr1_dc_err_53:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_53), 16, 16),1,DC_DATA,39)
	.word 0xd80c2714  ! 710: LDUB_I	ldub	[%r16 + 0x0714], %r12
thr1_irf_ce_69:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_69), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xec5c0011  ! 712: LDX_R	ldx	[%r16 + %r17], %r22
	.word 0xb72c1011  ! 714: SLLX_R	sllx	%r16, %r17, %r27
	.word 0x8c140011  ! 714: OR_R	or 	%r16, %r17, %r6
	.word 0x9b343001  ! 714: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0x853c2001  ! 714: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0x8c3c0011  ! 714: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x84440011  ! 714: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x917c2401  ! 714: MOVR_I	move	%r16, 0x7fff9c24, %r8
	.word 0x9a9c2dfc  ! 714: XORcc_I	xorcc 	%r16, 0x0dfc, %r13
thr1_dc_err_54:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_54), 16, 16),1,DC_DATA,23)
	.word 0xd79c1000  ! 716: LDDFA_R	ldda	[%r16, %r0], %f11
thr1_irf_ce_70:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_70), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xd82c24fd  ! 720: STB_I	stb	%r12, [%r16 + 0x04fd]
	.word 0x96942eea  ! 722: ORcc_I	orcc 	%r16, 0x0eea, %r11
	.word 0xb92c0011  ! 722: SLL_R	sll 	%r16, %r17, %r28
	.word 0x92bc2718  ! 722: XNORcc_I	xnorcc 	%r16, 0x0718, %r9
	.word 0xa92c2001  ! 722: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0xb6842908  ! 722: ADDcc_I	addcc 	%r16, 0x0908, %r27
thr1_dc_err_55:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_55), 16, 16),1,DC_DATA,62)
	.word 0xd6c427a5  ! 724: LDSWA_I	ldswa	[%r16, + 0x07a5] %asi, %r11
thr1_irf_ce_71:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_71), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xcd140011  ! 726: LDQF_R	-	[%r16, %r17], %f6
	.word 0x9cac0011  ! 728: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0x93340011  ! 728: SRL_R	srl 	%r16, %r17, %r9
	.word 0x9f7c0411  ! 728: MOVR_R	move	%r16, %r17, %r15
	.word 0x889c2f53  ! 728: XORcc_I	xorcc 	%r16, 0x0f53, %r4
	.word 0x948c0011  ! 728: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0xa9643801  ! 728: MOVcc_I	<illegal instruction>
	.word 0xb0142b1e  ! 728: OR_I	or 	%r16, 0x0b1e, %r24
thr1_dc_err_56:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_56), 16, 16),1,DC_DATA,52)
	.word 0xd8c41000  ! 730: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r12
thr1_irf_ce_72:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_72), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0x90742187  ! 732: UDIV_I	udiv 	%r16, 0x0187, %r8
	.word 0x8c342dac  ! 734: ORN_I	orn 	%r16, 0x0dac, %r6
	.word 0xaa8c0011  ! 734: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0xb8442d27  ! 734: ADDC_I	addc 	%r16, 0x0d27, %r28
	.word 0x8c840011  ! 734: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x929c21bf  ! 734: XORcc_I	xorcc 	%r16, 0x01bf, %r9
thr1_dc_err_57:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_57), 16, 16),1,DC_DATA,63)
	.word 0xf28c1000  ! 736: LDUBA_R	lduba	[%r16, %r0] 0x80, %r25
thr1_irf_ce_73:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_73), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0x84d426af  ! 738: UMULcc_I	umulcc 	%r16, 0x06af, %r2
	.word 0x8cc42718  ! 740: ADDCcc_I	addccc 	%r16, 0x0718, %r6
	.word 0x889c29a5  ! 740: XORcc_I	xorcc 	%r16, 0x09a5, %r4
	.word 0x862c25b2  ! 740: ANDN_I	andn 	%r16, 0x05b2, %r3
	.word 0x96440011  ! 740: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x9aac0011  ! 740: ANDNcc_R	andncc 	%r16, %r17, %r13
thr1_dc_err_58:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_58), 16, 16),1,DC_DATA,71)
	.word 0xd9042575  ! 742: LDF_I	ld	[%r16, 0x0575], %f12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x861c297c  ! 746: XOR_I	xor 	%r16, 0x097c, %r3
	.word 0xba3c2e7e  ! 746: XNOR_I	xnor 	%r16, 0x0e7e, %r29
	.word 0x95341011  ! 746: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x88142644  ! 746: OR_I	or 	%r16, 0x0644, %r4
	.word 0x993c1011  ! 746: SRAX_R	srax	%r16, %r17, %r12
	.word 0x881c223c  ! 746: XOR_I	xor 	%r16, 0x023c, %r4
	.word 0x9d643801  ! 746: MOVcc_I	<illegal instruction>
	.word 0xd0c41011  ! 747: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r8
thr1_irf_ce_74:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_74), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
thr1_resum_intr_761:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_761), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x9ebc24b4  ! 751: XNORcc_I	xnorcc 	%r16, 0x04b4, %r15
	.word 0x880c0011  ! 751: AND_R	and 	%r16, %r17, %r4
	.word 0x8b3c0011  ! 751: SRA_R	sra 	%r16, %r17, %r5
	.word 0x973c1011  ! 751: SRAX_R	srax	%r16, %r17, %r11
	.word 0x913c2001  ! 751: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0xb77c2401  ! 751: MOVR_I	move	%r16, 0x7fff9c24, %r27
	.word 0x8cac25b8  ! 751: ANDNcc_I	andncc 	%r16, 0x05b8, %r6
	.word 0xb81c2266  ! 751: XOR_I	xor 	%r16, 0x0266, %r28
	.word 0xea9c2518  ! 752: LDDA_I	ldda	[%r16, + 0x0518] %asi, %r21
        wr %g0, 0x4, %fprs
	.word 0x828c0011  ! 756: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0xa8ac0011  ! 756: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0x881c2425  ! 756: XOR_I	xor 	%r16, 0x0425, %r4
	.word 0xb62c2f61  ! 756: ANDN_I	andn 	%r16, 0x0f61, %r27
	.word 0x842c2812  ! 756: ANDN_I	andn 	%r16, 0x0812, %r2
	.word 0x9ab42aba  ! 756: ORNcc_I	orncc 	%r16, 0x0aba, %r13
	.word 0x8a3c28a0  ! 756: XNOR_I	xnor 	%r16, 0x08a0, %r5
	.word 0x9eb40011  ! 757: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x91641811  ! 757: MOVcc_R	<illegal instruction>
	.word 0x892c3001  ! 757: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0x82442915  ! 757: ADDC_I	addc 	%r16, 0x0915, %r1
	.word 0x952c0011  ! 757: SLL_R	sll 	%r16, %r17, %r10
	.word 0x897c2401  ! 757: MOVR_I	move	%r16, 0x7fff9c24, %r4
	.word 0x8b2c0011  ! 757: SLL_R	sll 	%r16, %r17, %r5
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd51c0011  ! 757: LDDF_R	ldd	[%r16, %r17], %f10
thr1_irf_ce_75:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_75), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	return     %r18 + %r17
	.word 0xab2c3001  ! 760: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0xac9c22f7  ! 760: XORcc_I	xorcc 	%r16, 0x02f7, %r22
	.word 0x893c2001  ! 760: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0x90b42cad  ! 760: ORNcc_I	orncc 	%r16, 0x0cad, %r8
	.word 0x89342001  ! 760: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x937c2401  ! 760: MOVR_I	move	%r16, 0x7fff9c24, %r9
	.word 0x902c2ca1  ! 760: ANDN_I	andn 	%r16, 0x0ca1, %r8
	.word 0xdf0428aa  ! 761: LDF_I	ld	[%r16, 0x08aa], %f15
	.word 0xd28c1011  ! 763: LDUBA_R	lduba	[%r16, %r17] 0x80, %r9
	.word 0x8aac0011  ! 765: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x8c0c0011  ! 765: AND_R	and 	%r16, %r17, %r6
	.word 0xa6840011  ! 765: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x9e2c0011  ! 765: ANDN_R	andn 	%r16, %r17, %r15
	.word 0xb6842623  ! 765: ADDcc_I	addcc 	%r16, 0x0623, %r27
thr1_dc_err_59:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_59), 16, 16),1,DC_DATA,18)
	.word 0xc8c42df3  ! 767: LDSWA_I	ldswa	[%r16, + 0x0df3] %asi, %r4
	wr      %r0, 0x5, %asr26
	.word 0x9cac258b  ! 771: ANDNcc_I	andncc 	%r16, 0x058b, %r14
	.word 0x8c8c223b  ! 771: ANDcc_I	andcc 	%r16, 0x023b, %r6
	.word 0x957c0411  ! 771: MOVR_R	move	%r16, %r17, %r10
	.word 0x943c2dca  ! 771: XNOR_I	xnor 	%r16, 0x0dca, %r10
	.word 0x852c0011  ! 771: SLL_R	sll 	%r16, %r17, %r2
	.word 0xde942fe5  ! 772: LDUHA_I	lduha	[%r16, + 0x0fe5] %asi, %r15
        wr %g0, 0x4, %fprs
	.word 0x8d643801  ! 776: MOVcc_I	<illegal instruction>
	.word 0x8cb424dc  ! 776: ORNcc_I	orncc 	%r16, 0x04dc, %r6
	.word 0xb2b426d6  ! 776: ORNcc_I	orncc 	%r16, 0x06d6, %r25
	.word 0x8f3c2001  ! 776: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x843c0011  ! 776: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0x8a842f18  ! 776: ADDcc_I	addcc 	%r16, 0x0f18, %r5
	.word 0xccdc2109  ! 777: LDXA_I	ldxa	[%r16, + 0x0109] %asi, %r6
	.word 0xcb841011  ! 779: LDFA_R	lda	[%r16, %r17], %f5
	.word 0xa97c2401  ! 781: MOVR_I	move	%r16, 0x7fff9c24, %r20
	.word 0x8eac0011  ! 781: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x849c0011  ! 781: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x9f3c2001  ! 781: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0xb42c0011  ! 781: ANDN_R	andn 	%r16, %r17, %r26
	.word 0xe6d41011  ! 782: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r19
thr1_irf_ce_76:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_76), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xed841011  ! 784: LDFA_R	lda	[%r16, %r17], %f22
	.word 0xae840011  ! 786: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x863c0011  ! 786: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0x84042c0f  ! 786: ADD_I	add 	%r16, 0x0c0f, %r2
	.word 0x8e8c2338  ! 786: ANDcc_I	andcc 	%r16, 0x0338, %r7
	.word 0x880c0011  ! 786: AND_R	and 	%r16, %r17, %r4
	.word 0x9e0c0011  ! 786: AND_R	and 	%r16, %r17, %r15
	.word 0xb82c0011  ! 786: ANDN_R	andn 	%r16, %r17, %r28
	.word 0x9e8c263b  ! 786: ANDcc_I	andcc 	%r16, 0x063b, %r15
	.word 0xcb040011  ! 787: LDF_R	ld	[%r16, %r17], %f5
thr1_irf_ce_77:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_77), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xf834285a  ! 791: STH_I	sth	%r28, [%r16 + 0x085a]
	.word 0xa92c1011  ! 793: SLLX_R	sllx	%r16, %r17, %r20
	.word 0xb0040011  ! 793: ADD_R	add 	%r16, %r17, %r24
	.word 0xb9343001  ! 793: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0xae1c0011  ! 793: XOR_R	xor 	%r16, %r17, %r23
	.word 0x833c0011  ! 793: SRA_R	sra 	%r16, %r17, %r1
	.word 0x8e1c2e67  ! 793: XOR_I	xor 	%r16, 0x0e67, %r7
	.word 0xb8ac2e8f  ! 793: ANDNcc_I	andncc 	%r16, 0x0e8f, %r28
	.word 0x8cc40011  ! 793: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0xea942e3f  ! 794: LDUHA_I	lduha	[%r16, + 0x0e3f] %asi, %r21
thr1_irf_ce_78:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_78), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xe99c1011  ! 796: LDDFA_R	ldda	[%r16, %r17], %f20
	.word 0x9a3c20f2  ! 798: XNOR_I	xnor 	%r16, 0x00f2, %r13
	.word 0x849c0011  ! 798: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x86bc233d  ! 798: XNORcc_I	xnorcc 	%r16, 0x033d, %r3
	.word 0x823c2eaa  ! 798: XNOR_I	xnor 	%r16, 0x0eaa, %r1
	.word 0xb2c40011  ! 798: ADDCcc_R	addccc 	%r16, %r17, %r25
thr1_dc_err_60:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_60), 16, 16),1,DC_DATA,41)
	.word 0xec9c1000  ! 800: LDDA_R	ldda	[%r16, %r0] 0x80, %r22
thr1_irf_ce_79:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_79), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9e842dc0  ! 804: ADDcc_I	addcc 	%r16, 0x0dc0, %r15
	.word 0xad3c2001  ! 804: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0xaa3c0011  ! 804: XNOR_R	xnor 	%r16, %r17, %r21
	.word 0x921422b1  ! 804: OR_I	or 	%r16, 0x02b1, %r9
	.word 0xab2c0011  ! 804: SLL_R	sll 	%r16, %r17, %r21
	.word 0xec5c0011  ! 805: LDX_R	ldx	[%r16 + %r17], %r22
thr1_irf_ce_80:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_80), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xc64428db  ! 807: LDSW_I	ldsw	[%r16 + 0x08db], %r3
	.word 0x920c0011  ! 809: AND_R	and 	%r16, %r17, %r9
	.word 0x9a8c2836  ! 809: ANDcc_I	andcc 	%r16, 0x0836, %r13
	.word 0x98340011  ! 809: ORN_R	orn 	%r16, %r17, %r12
	.word 0x9b2c1011  ! 809: SLLX_R	sllx	%r16, %r17, %r13
	.word 0x8c0c29bd  ! 809: AND_I	and 	%r16, 0x09bd, %r6
	.word 0xa9643801  ! 809: MOVcc_I	<illegal instruction>
	.word 0x82bc2fb6  ! 809: XNORcc_I	xnorcc 	%r16, 0x0fb6, %r1
	.word 0xac1c0011  ! 809: XOR_R	xor 	%r16, %r17, %r22
	.word 0xf4442294  ! 810: LDSW_I	ldsw	[%r16 + 0x0294], %r26
thr1_irf_ce_81:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_81), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0x26800003  ! 812: BL	bl,a	<label_0x3>
	.word 0x9a042118  ! 814: ADD_I	add 	%r16, 0x0118, %r13
	.word 0x9e840011  ! 814: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xa60c2ebe  ! 814: AND_I	and 	%r16, 0x0ebe, %r19
	.word 0xb2040011  ! 814: ADD_R	add 	%r16, %r17, %r25
	.word 0x932c2001  ! 814: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0xcd1c0011  ! 815: LDDF_R	ldd	[%r16, %r17], %f6
thr1_irf_ce_82:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_82), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xd5941011  ! 817: LDQFA_R	-	[%r16, %r17], %f10
	.word 0x96142399  ! 819: OR_I	or 	%r16, 0x0399, %r11
	.word 0xa72c3001  ! 819: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0x8b643801  ! 819: MOVcc_I	<illegal instruction>
	.word 0x9eb40011  ! 819: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x86040011  ! 819: ADD_R	add 	%r16, %r17, %r3
	.word 0x94342be5  ! 819: ORN_I	orn 	%r16, 0x0be5, %r10
	.word 0x96c40011  ! 819: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x92942c3c  ! 819: ORcc_I	orcc 	%r16, 0x0c3c, %r9
	.word 0xd9140011  ! 820: LDQF_R	-	[%r16, %r17], %f12
!Illinst store
	.word 0xcc340011  ! 822: STH_R	sth	%r6, [%r16 + %r17]
	.word 0x9a442e90  ! 824: ADDC_I	addc 	%r16, 0x0e90, %r13
	.word 0x9f2c3001  ! 824: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x9e440011  ! 824: ADDC_R	addc 	%r16, %r17, %r15
	.word 0xb00422b3  ! 824: ADD_I	add 	%r16, 0x02b3, %r24
	.word 0x960c0011  ! 824: AND_R	and 	%r16, %r17, %r11
	.word 0x9cc42fb3  ! 824: ADDCcc_I	addccc 	%r16, 0x0fb3, %r14
	.word 0x983c0011  ! 824: XNOR_R	xnor 	%r16, %r17, %r12
thr1_dc_err_61:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_61), 16, 16),1,DC_DATA,7)
	.word 0xf31c25f2  ! 826: LDDF_I	ldd	[%r16, 0x05f2], %f25
	.word 0x16800003  ! 828: BGE	bge  	<label_0x3>
	.word 0x993c2001  ! 830: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x929c21a1  ! 830: XORcc_I	xorcc 	%r16, 0x01a1, %r9
	.word 0x9eb40011  ! 830: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x981c2959  ! 830: XOR_I	xor 	%r16, 0x0959, %r12
	.word 0x8a0c0011  ! 830: AND_R	and 	%r16, %r17, %r5
thr1_dc_err_62:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_62), 16, 16),1,DC_DATA,34)
	.word 0xf2dc1000  ! 832: LDXA_R	ldxa	[%r16, %r0] 0x80, %r25
	.word 0xcc8427bd  ! 834: LDUWA_I	lduwa	[%r16, + 0x07bd] %asi, %r6
	.word 0x952c0011  ! 836: SLL_R	sll 	%r16, %r17, %r10
	.word 0xb6ac0011  ! 836: ANDNcc_R	andncc 	%r16, %r17, %r27
	.word 0xa8ac22cd  ! 836: ANDNcc_I	andncc 	%r16, 0x02cd, %r20
	.word 0x828c26bb  ! 836: ANDcc_I	andcc 	%r16, 0x06bb, %r1
	.word 0x92842682  ! 836: ADDcc_I	addcc 	%r16, 0x0682, %r9
thr1_dc_err_63:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_63), 16, 16),1,DC_DATA,50)
	.word 0xcf140000  ! 838: LDQF_R	-	[%r16, %r0], %f7
	.word 0xf0142777  ! 840: LDUH_I	lduh	[%r16 + 0x0777], %r24
	.word 0xb41c0011  ! 842: XOR_R	xor 	%r16, %r17, %r26
	.word 0x84140011  ! 842: OR_R	or 	%r16, %r17, %r2
	.word 0x9c34280a  ! 842: ORN_I	orn 	%r16, 0x080a, %r14
	.word 0x9c3c0011  ! 842: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x8d340011  ! 842: SRL_R	srl 	%r16, %r17, %r6
	.word 0xa93c2001  ! 842: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0xd49c2255  ! 843: LDDA_I	ldda	[%r16, + 0x0255] %asi, %r10
	.word 0xf6d426ae  ! 845: LDSHA_I	ldsha	[%r16, + 0x06ae] %asi, %r27
	.word 0x92842ad1  ! 847: ADDcc_I	addcc 	%r16, 0x0ad1, %r9
	.word 0x82c42c33  ! 847: ADDCcc_I	addccc 	%r16, 0x0c33, %r1
	.word 0x877c0411  ! 847: MOVR_R	move	%r16, %r17, %r3
	.word 0x96440011  ! 847: ADDC_R	addc 	%r16, %r17, %r11
	.word 0xb4340011  ! 847: ORN_R	orn 	%r16, %r17, %r26
	.word 0x9f342001  ! 848: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xa92c1011  ! 848: SLLX_R	sllx	%r16, %r17, %r20
	.word 0xad2c0011  ! 848: SLL_R	sll 	%r16, %r17, %r22
	.word 0xaa2c0011  ! 848: ANDN_R	andn 	%r16, %r17, %r21
	.word 0x981c2f5e  ! 848: XOR_I	xor 	%r16, 0x0f5e, %r12
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xeb042f7f  ! 848: LDF_I	ld	[%r16, 0x0f7f], %f21
thr1_irf_ce_83:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_83), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	return     %r18 + 0x20
	.word 0x9a8c0011  ! 851: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x913c0011  ! 851: SRA_R	sra 	%r16, %r17, %r8
	.word 0xb53c1011  ! 851: SRAX_R	srax	%r16, %r17, %r26
	.word 0x87340011  ! 851: SRL_R	srl 	%r16, %r17, %r3
	.word 0x86442475  ! 851: ADDC_I	addc 	%r16, 0x0475, %r3
	.word 0x960427c3  ! 851: ADD_I	add 	%r16, 0x07c3, %r11
	.word 0x83641811  ! 851: MOVcc_R	<illegal instruction>
	.word 0x92340011  ! 851: ORN_R	orn 	%r16, %r17, %r9
thr1_dc_err_64:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_64), 16, 16),1,DC_DATA,28)
	.word 0xce0c0000  ! 853: LDUB_R	ldub	[%r16 + %r0], %r7
	.word 0x89242c3e  ! 855: MULScc_I	mulscc 	%r16, 0x0c3e, %r4
	.word 0x832c0011  ! 857: SLL_R	sll 	%r16, %r17, %r1
	.word 0x9c3c0011  ! 857: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0xb3341011  ! 857: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x8f2c3001  ! 857: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0xa7342001  ! 857: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0x89341011  ! 857: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x8c8c0011  ! 857: ANDcc_R	andcc 	%r16, %r17, %r6
thr1_dc_err_65:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_65), 16, 16),1,DC_DATA,20)
	.word 0xc4dc2b10  ! 859: LDXA_I	ldxa	[%r16, + 0x0b10] %asi, %r2
thr1_irf_ce_84:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_84), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd48c2479  ! 861: LDUBA_I	lduba	[%r16, + 0x0479] %asi, %r10
	.word 0x92442b27  ! 863: ADDC_I	addc 	%r16, 0x0b27, %r9
	.word 0x84840011  ! 863: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x9c3c0011  ! 863: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x94c424bb  ! 863: ADDCcc_I	addccc 	%r16, 0x04bb, %r10
	.word 0x9f2c2001  ! 863: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0xb82c28b5  ! 863: ANDN_I	andn 	%r16, 0x08b5, %r28
	.word 0xaa8c2bcc  ! 863: ANDcc_I	andcc 	%r16, 0x0bcc, %r21
	.word 0xd5941011  ! 864: LDQFA_R	-	[%r16, %r17], %f10
	.word 0xeb9c1011  ! 866: LDDFA_R	ldda	[%r16, %r17], %f21
	.word 0xb08c0011  ! 868: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0x8e2c2e5b  ! 868: ANDN_I	andn 	%r16, 0x0e5b, %r7
	.word 0x841c0011  ! 868: XOR_R	xor 	%r16, %r17, %r2
	.word 0x952c2001  ! 868: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0x980c2d99  ! 868: AND_I	and 	%r16, 0x0d99, %r12
	.word 0x92940011  ! 868: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0xf0941011  ! 869: LDUHA_R	lduha	[%r16, %r17] 0x80, %r24
	.word 0xc4dc2df7  ! 871: LDXA_I	ldxa	[%r16, + 0x0df7] %asi, %r2
	.word 0x9b3c2001  ! 873: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x863c2aa6  ! 873: XNOR_I	xnor 	%r16, 0x0aa6, %r3
	.word 0x832c2001  ! 873: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0xa63c0011  ! 873: XNOR_R	xnor 	%r16, %r17, %r19
	.word 0xb20c0011  ! 873: AND_R	and 	%r16, %r17, %r25
thr1_dc_err_66:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_66), 16, 16),1,DC_DATA,59)
	.word 0xdd841000  ! 875: LDFA_R	lda	[%r16, %r0], %f14
thr1_irf_ce_85:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_85), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xca841011  ! 877: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r5
	.word 0xb4042361  ! 879: ADD_I	add 	%r16, 0x0361, %r26
	.word 0xa72c0011  ! 879: SLL_R	sll 	%r16, %r17, %r19
	.word 0x9b343001  ! 879: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xb83c2304  ! 879: XNOR_I	xnor 	%r16, 0x0304, %r28
	.word 0x9e440011  ! 879: ADDC_R	addc 	%r16, %r17, %r15
	.word 0xd28c27f3  ! 880: LDUBA_I	lduba	[%r16, + 0x07f3] %asi, %r9
thr1_irf_ce_86:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_86), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xd6d41011  ! 882: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r11
	.word 0x833c0011  ! 884: SRA_R	sra 	%r16, %r17, %r1
	.word 0x9ebc26be  ! 884: XNORcc_I	xnorcc 	%r16, 0x06be, %r15
	.word 0x981c0011  ! 884: XOR_R	xor 	%r16, %r17, %r12
	.word 0x9f2c2001  ! 884: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0x9f3c1011  ! 884: SRAX_R	srax	%r16, %r17, %r15
	.word 0xaaac0011  ! 884: ANDNcc_R	andncc 	%r16, %r17, %r21
thr1_dc_err_67:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_67), 16, 16),1,DC_DATA,34)
	.word 0xdc9c2dfd  ! 886: LDDA_I	ldda	[%r16, + 0x0dfd] %asi, %r14
	.word 0xce4c0011  ! 888: LDSB_R	ldsb	[%r16 + %r17], %r7
	.word 0xa6b42d7f  ! 890: ORNcc_I	orncc 	%r16, 0x0d7f, %r19
	.word 0xa6340011  ! 890: ORN_R	orn 	%r16, %r17, %r19
	.word 0xb69c2eb0  ! 890: XORcc_I	xorcc 	%r16, 0x0eb0, %r27
	.word 0xb7343001  ! 890: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0x96c42efc  ! 890: ADDCcc_I	addccc 	%r16, 0x0efc, %r11
	.word 0x95342001  ! 890: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0xb0c42424  ! 890: ADDCcc_I	addccc 	%r16, 0x0424, %r24
	.word 0x8f643801  ! 890: MOVcc_I	<illegal instruction>
thr1_dc_err_68:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_68), 16, 16),1,DC_DATA,13)
	.word 0xeed42e26  ! 892: LDSHA_I	ldsha	[%r16, + 0x0e26] %asi, %r23
	.word 0xf2142633  ! 894: LDUH_I	lduh	[%r16 + 0x0633], %r25
	.word 0x88140011  ! 896: OR_R	or 	%r16, %r17, %r4
	.word 0x8eac2c12  ! 896: ANDNcc_I	andncc 	%r16, 0x0c12, %r7
	.word 0x9484297e  ! 896: ADDcc_I	addcc 	%r16, 0x097e, %r10
	.word 0xb6b429ea  ! 896: ORNcc_I	orncc 	%r16, 0x09ea, %r27
	.word 0xb4c40011  ! 896: ADDCcc_R	addccc 	%r16, %r17, %r26
thr1_dc_err_69:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_69), 16, 16),1,DC_DATA,1)
	.word 0xcc1c0000  ! 898: LDD_R	ldd	[%r16 + %r0], %r6
	.word 0xc81c213f  ! 900: LDD_I	ldd	[%r16 + 0x013f], %r4
	.word 0xa80c0011  ! 902: AND_R	and 	%r16, %r17, %r20
	.word 0x9d2c1011  ! 902: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x8c8c0011  ! 902: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0xb4440011  ! 902: ADDC_R	addc 	%r16, %r17, %r26
	.word 0xa6ac24ec  ! 902: ANDNcc_I	andncc 	%r16, 0x04ec, %r19
	.word 0x8cac27ff  ! 902: ANDNcc_I	andncc 	%r16, 0x07ff, %r6
	.word 0xb6b40011  ! 902: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0xdc942ed8  ! 903: LDUHA_I	lduha	[%r16, + 0x0ed8] %asi, %r14
thr1_irf_ce_87:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_87), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xd8942b96  ! 905: LDUHA_I	lduha	[%r16, + 0x0b96] %asi, %r12
	.word 0x9c040011  ! 907: ADD_R	add 	%r16, %r17, %r14
	.word 0xb6040011  ! 907: ADD_R	add 	%r16, %r17, %r27
	.word 0x920c0011  ! 907: AND_R	and 	%r16, %r17, %r9
	.word 0x888c28c2  ! 907: ANDcc_I	andcc 	%r16, 0x08c2, %r4
	.word 0x8f2c0011  ! 907: SLL_R	sll 	%r16, %r17, %r7
thr1_dc_err_70:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_70), 16, 16),1,DC_DATA,48)
	.word 0xc51c0000  ! 909: LDDF_R	ldd	[%r16, %r0], %f2
thr1_irf_ce_88:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_88), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf3240011  ! 911: STF_R	st	%f25, [%r17, %r16]
	.word 0x903c0011  ! 913: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x82bc23b0  ! 913: XNORcc_I	xnorcc 	%r16, 0x03b0, %r1
	.word 0x84042ef3  ! 913: ADD_I	add 	%r16, 0x0ef3, %r2
	.word 0xb0140011  ! 913: OR_R	or 	%r16, %r17, %r24
	.word 0x889c0011  ! 913: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x8c040011  ! 913: ADD_R	add 	%r16, %r17, %r6
	.word 0x908426f0  ! 913: ADDcc_I	addcc 	%r16, 0x06f0, %r8
	.word 0xe9140011  ! 914: LDQF_R	-	[%r16, %r17], %f20
	.word 0xf69c238f  ! 916: LDDA_I	ldda	[%r16, + 0x038f] %asi, %r27
	.word 0xb6c40011  ! 918: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0xb8440011  ! 918: ADDC_R	addc 	%r16, %r17, %r28
	.word 0x9c042f00  ! 918: ADD_I	add 	%r16, 0x0f00, %r14
	.word 0x8cc40011  ! 918: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x852c3001  ! 918: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0x97340011  ! 918: SRL_R	srl 	%r16, %r17, %r11
	.word 0x9b7c2401  ! 918: MOVR_I	move	%r16, 0x7fff9c24, %r13
thr1_dc_err_71:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_71), 16, 16),1,DC_DATA,70)
	.word 0xf9042a09  ! 920: LDF_I	ld	[%r16, 0x0a09], %f28
	.word 0xcc941011  ! 922: LDUHA_R	lduha	[%r16, %r17] 0x80, %r6
	.word 0x8e9427ab  ! 924: ORcc_I	orcc 	%r16, 0x07ab, %r7
	.word 0x8e440011  ! 924: ADDC_R	addc 	%r16, %r17, %r7
	.word 0x8e040011  ! 924: ADD_R	add 	%r16, %r17, %r7
	.word 0x94ac0011  ! 924: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xb0942576  ! 924: ORcc_I	orcc 	%r16, 0x0576, %r24
	.word 0xa6442828  ! 924: ADDC_I	addc 	%r16, 0x0828, %r19
	.word 0x8aac0011  ! 924: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x9c0c0011  ! 924: AND_R	and 	%r16, %r17, %r14
thr1_dc_err_72:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_72), 16, 16),1,DC_DATA,43)
	.word 0xcb1c22ab  ! 926: LDDF_I	ldd	[%r16, 0x02ab], %f5
thr1_irf_ce_89:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_89), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0x9a4c2f2a  ! 928: MULX_I	mulx 	%r16, 0x0f2a, %r13
	.word 0x98bc255b  ! 930: XNORcc_I	xnorcc 	%r16, 0x055b, %r12
	.word 0x9eb40011  ! 930: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0xaa1c0011  ! 930: XOR_R	xor 	%r16, %r17, %r21
	.word 0xac9c20e8  ! 930: XORcc_I	xorcc 	%r16, 0x00e8, %r22
	.word 0x8b342001  ! 930: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0xf71c21dc  ! 931: LDDF_I	ldd	[%r16, 0x01dc], %f27
	.word 0xd11c0011  ! 933: LDDF_R	ldd	[%r16, %r17], %f8
	.word 0x82b42366  ! 935: ORNcc_I	orncc 	%r16, 0x0366, %r1
	.word 0x8e040011  ! 935: ADD_R	add 	%r16, %r17, %r7
	.word 0x8f341011  ! 935: SRLX_R	srlx	%r16, %r17, %r7
	.word 0xb33c0011  ! 935: SRA_R	sra 	%r16, %r17, %r25
	.word 0xb62c2c53  ! 935: ANDN_I	andn 	%r16, 0x0c53, %r27
	.word 0x93641811  ! 935: MOVcc_R	<illegal instruction>
	.word 0xb49c2f1a  ! 935: XORcc_I	xorcc 	%r16, 0x0f1a, %r26
	.word 0x888c0011  ! 935: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0xf8042696  ! 936: LDUW_I	lduw	[%r16 + 0x0696], %r28
thr1_irf_ce_90:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_90), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xd45c0011  ! 938: LDX_R	ldx	[%r16 + %r17], %r10
	.word 0xb82c0011  ! 940: ANDN_R	andn 	%r16, %r17, %r28
	.word 0xa68c0011  ! 940: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0xb4840011  ! 940: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0xae442eb6  ! 940: ADDC_I	addc 	%r16, 0x0eb6, %r23
	.word 0x8c9c2390  ! 940: XORcc_I	xorcc 	%r16, 0x0390, %r6
	.word 0xa63424cf  ! 940: ORN_I	orn 	%r16, 0x04cf, %r19
	.word 0xb8b426ea  ! 940: ORNcc_I	orncc 	%r16, 0x06ea, %r28
	.word 0x9cac0011  ! 940: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0xeb042d12  ! 941: LDF_I	ld	[%r16, 0x0d12], %f21
thr1_irf_ce_91:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_91), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0x22800004  ! 943: BE	be,a	<label_0x4>
	.word 0x92442925  ! 945: ADDC_I	addc 	%r16, 0x0925, %r9
	.word 0xa89c0011  ! 945: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0xbaac236a  ! 945: ANDNcc_I	andncc 	%r16, 0x036a, %r29
	.word 0x893c0011  ! 945: SRA_R	sra 	%r16, %r17, %r4
	.word 0x9a8c28b8  ! 945: ANDcc_I	andcc 	%r16, 0x08b8, %r13
	.word 0x88c42016  ! 945: ADDCcc_I	addccc 	%r16, 0x0016, %r4
	.word 0x928c26d4  ! 945: ANDcc_I	andcc 	%r16, 0x06d4, %r9
thr1_dc_err_73:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_73), 16, 16),1,DC_DATA,37)
	.word 0xd1040000  ! 947: LDF_R	ld	[%r16, %r0], %f8
thr1_irf_ce_92:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_92), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xc31c2e37  ! 949: LDDF_I	ldd	[%r16, 0x0e37], %f1
	.word 0xbac40011  ! 951: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0xab2c2001  ! 951: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0x928c0011  ! 951: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0xb2c40011  ! 951: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0x917c2401  ! 951: MOVR_I	move	%r16, 0x7fff9c24, %r8
	.word 0x8e842a9f  ! 951: ADDcc_I	addcc 	%r16, 0x0a9f, %r7
	.word 0x8444259a  ! 951: ADDC_I	addc 	%r16, 0x059a, %r2
	.word 0x85343001  ! 951: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0xd1142b98  ! 952: LDQF_I	-	[%r16, 0x0b98], %f8
	.word 0xd25c0011  ! 954: LDX_R	ldx	[%r16 + %r17], %r9
	.word 0x9c84209c  ! 956: ADDcc_I	addcc 	%r16, 0x009c, %r14
	.word 0x8e942fd2  ! 956: ORcc_I	orcc 	%r16, 0x0fd2, %r7
	.word 0x8abc2f43  ! 956: XNORcc_I	xnorcc 	%r16, 0x0f43, %r5
	.word 0xa6c426ee  ! 956: ADDCcc_I	addccc 	%r16, 0x06ee, %r19
	.word 0xac1c2cf7  ! 956: XOR_I	xor 	%r16, 0x0cf7, %r22
	.word 0xad2c2001  ! 956: SLL_I	sll 	%r16, 0x0001, %r22
	.word 0x969c0011  ! 956: XORcc_R	xorcc 	%r16, %r17, %r11
thr1_dc_err_74:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_74), 16, 16),1,DC_DATA,28)
	.word 0xea8420c5  ! 958: LDUWA_I	lduwa	[%r16, + 0x00c5] %asi, %r21
	.word 0xcf042a4f  ! 960: LDF_I	ld	[%r16, 0x0a4f], %f7
	.word 0x90b40011  ! 962: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x852c3001  ! 962: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0xb68c0011  ! 962: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0xaa9c0011  ! 962: XORcc_R	xorcc 	%r16, %r17, %r21
	.word 0x829c2692  ! 962: XORcc_I	xorcc 	%r16, 0x0692, %r1
thr1_dc_err_75:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_75), 16, 16),1,DC_DATA,40)
	.word 0xda0426a0  ! 964: LDUW_I	lduw	[%r16 + 0x06a0], %r13
!Illinst alu
	.word 0x84340011  ! 966: ORN_R	orn 	%r16, %r17, %r2
	.word 0xb2342957  ! 968: ORN_I	orn 	%r16, 0x0957, %r25
	.word 0x872c1011  ! 968: SLLX_R	sllx	%r16, %r17, %r3
	.word 0x9a342470  ! 968: ORN_I	orn 	%r16, 0x0470, %r13
	.word 0x997c2401  ! 968: MOVR_I	move	%r16, 0x7fff9c24, %r12
	.word 0xad3c2001  ! 968: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0x9eb4264b  ! 968: ORNcc_I	orncc 	%r16, 0x064b, %r15
	.word 0xa61c2985  ! 968: XOR_I	xor 	%r16, 0x0985, %r19
	.word 0x868c0011  ! 968: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xd7941011  ! 969: LDQFA_R	-	[%r16, %r17], %f11
	.word 0xdb040011  ! 971: LDF_R	ld	[%r16, %r17], %f13
	.word 0x8e8c25fb  ! 973: ANDcc_I	andcc 	%r16, 0x05fb, %r7
	.word 0xae840011  ! 973: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x84942558  ! 973: ORcc_I	orcc 	%r16, 0x0558, %r2
	.word 0x9f7c2401  ! 973: MOVR_I	move	%r16, 0x7fff9c24, %r15
	.word 0x8204272e  ! 973: ADD_I	add 	%r16, 0x072e, %r1
	.word 0xaa440011  ! 973: ADDC_R	addc 	%r16, %r17, %r21
	.word 0xfa040011  ! 974: LDUW_R	lduw	[%r16 + %r17], %r29
thr1_irf_ce_93:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_93), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xf08c1011  ! 976: LDUBA_R	lduba	[%r16, %r17] 0x80, %r24
	.word 0xb4ac0011  ! 978: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0xb40c2665  ! 978: AND_I	and 	%r16, 0x0665, %r26
	.word 0xaaac0011  ! 978: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0xab342001  ! 978: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0xb24427e6  ! 978: ADDC_I	addc 	%r16, 0x07e6, %r25
	.word 0xc2942b6a  ! 979: LDUHA_I	lduha	[%r16, + 0x0b6a] %asi, %r1
!Illinst store
	.word 0xc4340011  ! 981: STH_R	sth	%r2, [%r16 + %r17]
	.word 0x902c0011  ! 983: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x86940011  ! 983: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x8e940011  ! 983: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0x9e1c2310  ! 983: XOR_I	xor 	%r16, 0x0310, %r15
	.word 0x92bc2076  ! 983: XNORcc_I	xnorcc 	%r16, 0x0076, %r9
	.word 0x89343001  ! 983: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0xd20c0011  ! 984: LDUB_R	ldub	[%r16 + %r17], %r9
thr1_irf_ce_94:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_94), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xe6540011  ! 986: LDSH_R	ldsh	[%r16 + %r17], %r19
	.word 0x821c0011  ! 988: XOR_R	xor 	%r16, %r17, %r1
	.word 0x98940011  ! 988: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x9a442742  ! 988: ADDC_I	addc 	%r16, 0x0742, %r13
	.word 0xb6940011  ! 988: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x94342525  ! 988: ORN_I	orn 	%r16, 0x0525, %r10
	.word 0x8f3c2001  ! 988: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x932c0011  ! 988: SLL_R	sll 	%r16, %r17, %r9
	.word 0x8e9c0011  ! 988: XORcc_R	xorcc 	%r16, %r17, %r7
thr1_dc_err_76:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_76), 16, 16),1,DC_DATA,69)
	.word 0xd0440000  ! 990: LDSW_R	ldsw	[%r16 + %r0], %r8
        wr  %g0, 0x80, %asi
	.word 0xae94249c  ! 994: ORcc_I	orcc 	%r16, 0x049c, %r23
	.word 0x82042d31  ! 994: ADD_I	add 	%r16, 0x0d31, %r1
	.word 0xac440011  ! 994: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x993c2001  ! 994: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0xb2042ed1  ! 994: ADD_I	add 	%r16, 0x0ed1, %r25
	.word 0xd21c2df6  ! 995: LDD_I	ldd	[%r16 + 0x0df6], %r9
	.word 0x2e800004  ! 997: BVS	bvs,a	<label_0x4>
	.word 0x949c0011  ! 999: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0x883c267d  ! 999: XNOR_I	xnor 	%r16, 0x067d, %r4
	.word 0xb2ac0011  ! 999: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0xb88c0011  ! 999: ANDcc_R	andcc 	%r16, %r17, %r28
	.word 0x983c0011  ! 999: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0x84ac26a4  ! 999: ANDNcc_I	andncc 	%r16, 0x06a4, %r2
thr1_dc_err_77:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_77), 16, 16),1,DC_DATA,13)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d30, %g1, %r17
        setx  0x52bc3d74f54e8aae, %g1, %r0
        setx  0x661715f3aedeeb56, %g1, %r1
        setx  0x16893e18f3618ab3, %g1, %r2
        setx  0x871b23ad4ef4863e, %g1, %r3
        setx  0x2058c7f337bf23eb, %g1, %r4
        setx  0x0c42b35828ce2ee0, %g1, %r5
        setx  0x0c5f24c0a94d38fb, %g1, %r6
        setx  0x482cb2e52c4c3810, %g1, %r7
        setx  0xc8475d3dc6c1168a, %g1, %r8
        setx  0xae15b16279b485f6, %g1, %r9
        setx  0x46ed2e0e39260fc0, %g1, %r10
        setx  0x536121e9f3629757, %g1, %r11
        setx  0x8f75cbbff58b9ae0, %g1, %r12
        setx  0x33f1985f8a8b8bd8, %g1, %r13
        setx  0x31b6463000d60faa, %g1, %r14
        setx  0xa5378cca7393af66, %g1, %r15
        setx  0x3e3542dd3e48de8c, %g1, %r18
        setx  0x4e9d62801c9090dc, %g1, %r19
        setx  0xc90626561ac71e5a, %g1, %r20
        setx  0x316ebd1ec7c1982d, %g1, %r21
        setx  0xf13f74cebe46e656, %g1, %r22
        setx  0x4ceb5135dedde296, %g1, %r23
        setx  0x390e6549e3a71cbb, %g1, %r24
        setx  0xe8846b6a9584448f, %g1, %r25
        setx  0x88526f7bcad42782, %g1, %r26
        setx  0x612f40bb9452a193, %g1, %r27
        setx  0x75c6aa37077565c7, %g1, %r28
        setx  0x8f0165be5d9fefd5, %g1, %r29
        setx  0x64a8b4278dcf93a1, %g1, %r30
        setx  0x9ffbc24fe259a219, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d50, %g1, %r17
        setx  0xa5c27146ba74b9d5, %g1, %r0
        setx  0x74a722c9de347b21, %g1, %r1
        setx  0x2c8a6548b39d59a6, %g1, %r2
        setx  0x274f16f6e87cf0f5, %g1, %r3
        setx  0xb2b2be0f57bca3dc, %g1, %r4
        setx  0x23d98bf98882b45b, %g1, %r5
        setx  0x00a4b8a282c850dd, %g1, %r6
        setx  0x82b88dac35aa141d, %g1, %r7
        setx  0xa9610871b5d765f5, %g1, %r8
        setx  0xd038461fdc843d69, %g1, %r9
        setx  0xd469fde91fff06f0, %g1, %r10
        setx  0x37e7df122395f1cc, %g1, %r11
        setx  0xbeac3f4253d17d55, %g1, %r12
        setx  0xfc15abe3b4aa00ea, %g1, %r13
        setx  0xd9025b83b5d1e1c3, %g1, %r14
        setx  0xfc959e2b66b1f2dd, %g1, %r15
        setx  0xdda14e31e92dedc8, %g1, %r18
        setx  0x8dffb82ee5ea3eea, %g1, %r19
        setx  0x0f3489dc51afe19e, %g1, %r20
        setx  0x97aedfa20c511784, %g1, %r21
        setx  0x8b87e6fc915bfd6f, %g1, %r22
        setx  0x23e233fad9e3383c, %g1, %r23
        setx  0xc645d8cb9a922836, %g1, %r24
        setx  0xa7f418650a17f139, %g1, %r25
        setx  0xc10150632712a969, %g1, %r26
        setx  0x59de22be55052a99, %g1, %r27
        setx  0xddcf7645ec0e6eef, %g1, %r28
        setx  0xcf4fc0d59502d79c, %g1, %r29
        setx  0x0e95d95b2c772a05, %g1, %r30
        setx  0x1308383aef707205, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000820, %g1, %r17
        setx  0xfbfcf6b40ba2776f, %g1, %r0
        setx  0x92b2dae86b5a3da0, %g1, %r1
        setx  0xdcce90779a496010, %g1, %r2
        setx  0x7286c2d08aa08149, %g1, %r3
        setx  0x191d580e03f06d4f, %g1, %r4
        setx  0x6835a145a243ba32, %g1, %r5
        setx  0x88e77231a831524f, %g1, %r6
        setx  0x683853db941106b1, %g1, %r7
        setx  0x7ff3d04ba089c8f9, %g1, %r8
        setx  0x9e6e5d2464b0c88f, %g1, %r9
        setx  0xa3a6ca29058b9a8e, %g1, %r10
        setx  0x24693ace3c20d05b, %g1, %r11
        setx  0x5190ec7d30b4c6a7, %g1, %r12
        setx  0x330d19c77e82ef2c, %g1, %r13
        setx  0x7ab5bc3ed138e383, %g1, %r14
        setx  0x6de5d23ed387af07, %g1, %r15
        setx  0x1de523b4c8cdd81d, %g1, %r18
        setx  0x149d685686a0d1dc, %g1, %r19
        setx  0xa31f40b0c3fca8b5, %g1, %r20
        setx  0x4f5580bdddc078f9, %g1, %r21
        setx  0xb2ba020c8382a984, %g1, %r22
        setx  0xe372bd65adae5a94, %g1, %r23
        setx  0x7c10d346028ef26d, %g1, %r24
        setx  0x4ee12c6a6c6b9a23, %g1, %r25
        setx  0x7116c6ea5076042b, %g1, %r26
        setx  0xab5b12b9e3394677, %g1, %r27
        setx  0x59adf04df3c01b2d, %g1, %r28
        setx  0x705ff296a6d187af, %g1, %r29
        setx  0x9e1105b1f49573b5, %g1, %r30
        setx  0xa237369eddb8a5ca, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000450, %g1, %r17
        setx  0xeeebe53ef091d04a, %g1, %r0
        setx  0x914dc81327a03280, %g1, %r1
        setx  0xa7eeffd9542ad8fe, %g1, %r2
        setx  0x91cd3e175578ccb9, %g1, %r3
        setx  0x086aac994ca75a13, %g1, %r4
        setx  0xae4130985ffd4d44, %g1, %r5
        setx  0x12f96ef36f9b3b21, %g1, %r6
        setx  0xc7344368edd1ccc1, %g1, %r7
        setx  0x8dbd8980a507d38a, %g1, %r8
        setx  0x43c790a32e6fd3f1, %g1, %r9
        setx  0x8e5dfb5422ecb3a6, %g1, %r10
        setx  0x28aea815b060f6ac, %g1, %r11
        setx  0x8edde2b50eb2e926, %g1, %r12
        setx  0xfdf20e7610e8423b, %g1, %r13
        setx  0x697e2e3cc0755e9f, %g1, %r14
        setx  0xd54dad70973ff29b, %g1, %r15
        setx  0x2587aace248cffb2, %g1, %r18
        setx  0xbe8e50d7a58b55a1, %g1, %r19
        setx  0x50a6f1442a34b739, %g1, %r20
        setx  0x7a5ec75fb4498a97, %g1, %r21
        setx  0x1915a88d8c6260bd, %g1, %r22
        setx  0xd49e5eed47e53691, %g1, %r23
        setx  0x165138b188913614, %g1, %r24
        setx  0xa84483e5498f900d, %g1, %r25
        setx  0x2b1766f086a8ad96, %g1, %r26
        setx  0x1bc0670952e368c9, %g1, %r27
        setx  0x1446a719686bcbf0, %g1, %r28
        setx  0x800f61154276df75, %g1, %r29
        setx  0x27e3852c871ef9c5, %g1, %r30
        setx  0xa985687a810ac0c0, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d70, %g1, %r17
        setx  0x8db48a066e75d29d, %g1, %r0
        setx  0xe04e4c7bfaf5848c, %g1, %r1
        setx  0x11d8e3836accb131, %g1, %r2
        setx  0xc829541193c3a061, %g1, %r3
        setx  0x8b0a9acb6cb11717, %g1, %r4
        setx  0x1063df6d01582a05, %g1, %r5
        setx  0xe805c91e84687803, %g1, %r6
        setx  0xeaad8c2f5798f29d, %g1, %r7
        setx  0xe3aac62922911f69, %g1, %r8
        setx  0x3ff948e5b03a1e35, %g1, %r9
        setx  0x0664995d468335a0, %g1, %r10
        setx  0x6c9ee229680be1b6, %g1, %r11
        setx  0x305942039ad0112a, %g1, %r12
        setx  0x7e829a3ab4ea56d4, %g1, %r13
        setx  0x7e7c2076df0404bb, %g1, %r14
        setx  0x2aa383aae65f6074, %g1, %r15
        setx  0x385fc7c09bffea29, %g1, %r18
        setx  0x25fe4f642043f866, %g1, %r19
        setx  0xd23d892578d7d214, %g1, %r20
        setx  0x99c478d014946a89, %g1, %r21
        setx  0x899506d7fd38e139, %g1, %r22
        setx  0xeb60cf1f15a9f22d, %g1, %r23
        setx  0xf1c95e950aeb6f48, %g1, %r24
        setx  0x386b6852df58b899, %g1, %r25
        setx  0x1d62d498d51ae27c, %g1, %r26
        setx  0x69ba925531eb4eff, %g1, %r27
        setx  0x81f51ee768f378a0, %g1, %r28
        setx  0x93716d2cec2d0b60, %g1, %r29
        setx  0x42776faf63a3b5c9, %g1, %r30
        setx  0x9d89fb70f7dfc646, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000bd0, %g1, %r17
        setx  0x65346486228ebb76, %g1, %r0
        setx  0x1b2c33e2bf3c6825, %g1, %r1
        setx  0xe9ff110672b49dcc, %g1, %r2
        setx  0xcfab2eed0a2d908b, %g1, %r3
        setx  0xe1169107c1154230, %g1, %r4
        setx  0xeb51fbbc4c046231, %g1, %r5
        setx  0xe762810c5cd2d0ae, %g1, %r6
        setx  0x748cb55e9f462cca, %g1, %r7
        setx  0x8bc5f53d6d27bb76, %g1, %r8
        setx  0x0ad737ec096985e2, %g1, %r9
        setx  0x34f59c7ef9eba046, %g1, %r10
        setx  0xc59c5b02073c9cdb, %g1, %r11
        setx  0x90fc4a05c85de378, %g1, %r12
        setx  0xe02925a42f38a9c3, %g1, %r13
        setx  0x93bdb132c90415a8, %g1, %r14
        setx  0x09e8762ebdaf77cd, %g1, %r15
        setx  0x7e12ec0796f7b689, %g1, %r18
        setx  0x839251b24f0791b6, %g1, %r19
        setx  0xe42cc66da0c6a471, %g1, %r20
        setx  0x605dc34a0d9909c3, %g1, %r21
        setx  0xef92e5fdd76b0802, %g1, %r22
        setx  0x359621a9d65595b6, %g1, %r23
        setx  0x30bafb449b4d28a2, %g1, %r24
        setx  0xeaec20fe4a80f9ba, %g1, %r25
        setx  0x4f55bca249063b6b, %g1, %r26
        setx  0xa9b62ba9e590d745, %g1, %r27
        setx  0x05bd5f067b156d94, %g1, %r28
        setx  0x75ece68a0fc3923e, %g1, %r29
        setx  0x20c9f5b84e388284, %g1, %r30
        setx  0xd14ca322a0cda46e, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000a50, %g1, %r17
        setx  0x36f247dda208fa91, %g1, %r0
        setx  0xf218c26de0369ea9, %g1, %r1
        setx  0x38ab194e6319feab, %g1, %r2
        setx  0x82649a00a0e350c3, %g1, %r3
        setx  0xba5d2e20f6ec89b8, %g1, %r4
        setx  0x66df5d9853bc4b7d, %g1, %r5
        setx  0xc1203545bc30f553, %g1, %r6
        setx  0x3a4823e152047d5c, %g1, %r7
        setx  0x61c65c2e27d7c775, %g1, %r8
        setx  0xb10857e36f50d8a9, %g1, %r9
        setx  0xb631c4aa3abf5862, %g1, %r10
        setx  0x5cbc4482fe3ced0d, %g1, %r11
        setx  0xdcb5f8ce70c01761, %g1, %r12
        setx  0xab7e8fd4304bfbbf, %g1, %r13
        setx  0xd9e5c31189360542, %g1, %r14
        setx  0x9465ef9943416940, %g1, %r15
        setx  0x1e03c1632286cbc0, %g1, %r18
        setx  0x3d37456164bd775a, %g1, %r19
        setx  0x2c10b92b256041ae, %g1, %r20
        setx  0x9d75dbca1055d922, %g1, %r21
        setx  0x4d853f049c34803e, %g1, %r22
        setx  0xcd243f637a456e9e, %g1, %r23
        setx  0x760f457c17288f27, %g1, %r24
        setx  0x011a5420fef9ceaa, %g1, %r25
        setx  0x355cd9a6a69b6385, %g1, %r26
        setx  0x97161fb00473d579, %g1, %r27
        setx  0x97b2c3d31ca3e0c6, %g1, %r28
        setx  0x697bd872df88000f, %g1, %r29
        setx  0xad0f2c509f947740, %g1, %r30
        setx  0x1b3df49e8e8716e5, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000002a0, %g1, %r17
        setx  0x2fa9547b03c514b6, %g1, %r0
        setx  0x29b4366d0da89a67, %g1, %r1
        setx  0xd5903c5375596720, %g1, %r2
        setx  0x8b6767a0207cf9a7, %g1, %r3
        setx  0x837a089816550c1d, %g1, %r4
        setx  0x149f42daf1aa876d, %g1, %r5
        setx  0x931be6d3a1e64df8, %g1, %r6
        setx  0xcd4e2a5f71fa84f1, %g1, %r7
        setx  0xb70216a24b6431b1, %g1, %r8
        setx  0x880a28d45b6e0ca4, %g1, %r9
        setx  0xc6c8a5cec2f19bc7, %g1, %r10
        setx  0xdfe0817fcee545b6, %g1, %r11
        setx  0xcec82e72f65cc0ae, %g1, %r12
        setx  0x8ce3657fb56455be, %g1, %r13
        setx  0xccb5750e351ff513, %g1, %r14
        setx  0xdc483e74730d41a8, %g1, %r15
        setx  0x5aedc200bc6b8df7, %g1, %r18
        setx  0x07658b3f9ccce73e, %g1, %r19
        setx  0x9b6c75100067aef1, %g1, %r20
        setx  0x63cd6fbfb1c3016d, %g1, %r21
        setx  0x03f59d7481f1260f, %g1, %r22
        setx  0xa0b673d96f6c60ef, %g1, %r23
        setx  0x876e9de8a340be7b, %g1, %r24
        setx  0xff3dcdc4db863a53, %g1, %r25
        setx  0xe957c2424a1687df, %g1, %r26
        setx  0xe16db26f3d7a225e, %g1, %r27
        setx  0x8053dba0e8761608, %g1, %r28
        setx  0x1ad8ca54381aba6d, %g1, %r29
        setx  0xfb7c608312316073, %g1, %r30
        setx  0x89e4df8c90961193, %g1, %r31
	save %r0, %r0, %r31
        wr  %g0, 0x80, %asi
        wr %g0, 0x4, %fprs
	ldd	[%r16 + 0], %f0
	ldd	[%r16 + 8], %f2
	ldd	[%r16 + 16], %f4
	ldd	[%r16 + 24], %f6
	ldd	[%r16 + 32], %f8
	ldd	[%r16 + 40], %f10
	ldd	[%r16 + 48], %f12
	ldd	[%r16 + 56], %f14
	ldd	[%r16 + 64], %f16
	ldd	[%r16 + 72], %f18
	ldd	[%r16 + 80], %f20
	ldd	[%r16 + 88], %f22
	ldd	[%r16 + 96], %f24
	ldd	[%r16 + 104], %f26
	ldd	[%r16 + 112], %f28
	ldd	[%r16 + 120], %f30
	ldd	[%r16 + 128], %f32
	ldd	[%r16 + 136], %f34
	ldd	[%r16 + 144], %f36
	ldd	[%r16 + 152], %f38
	ldd	[%r16 + 160], %f40
	ldd	[%r16 + 168], %f42
	ldd	[%r16 + 176], %f44
	ldd	[%r16 + 184], %f46
	ldd	[%r16 + 192], %f48
	ldd	[%r16 + 200], %f50
	ldd	[%r16 + 208], %f52
	ldd	[%r16 + 216], %f54
	ldd	[%r16 + 224], %f56
	ldd	[%r16 + 232], %f58
	ldd	[%r16 + 240], %f60
	ldd	[%r16 + 248], %f62
	.word 0xc61c0011  ! 2: LDD_R	ldd	[%r16 + %r17], %r3
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xd24c249f  ! 4: LDSB_I	ldsb	[%r16 + 0x049f], %r9
	.word 0x93641811  ! 6: MOVcc_R	<illegal instruction>
	.word 0x929c2e22  ! 6: XORcc_I	xorcc 	%r16, 0x0e22, %r9
	.word 0xa88c27f1  ! 6: ANDcc_I	andcc 	%r16, 0x07f1, %r20
	.word 0xa6340011  ! 6: ORN_R	orn 	%r16, %r17, %r19
	.word 0x94c421c4  ! 6: ADDCcc_I	addccc 	%r16, 0x01c4, %r10
	.word 0xac9c0011  ! 6: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0x9f2c0011  ! 6: SLL_R	sll 	%r16, %r17, %r15
	.word 0x903c2237  ! 6: XNOR_I	xnor 	%r16, 0x0237, %r8
	.word 0xc61421c6  ! 7: LDUH_I	lduh	[%r16 + 0x01c6], %r3
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xde8c1011  ! 9: LDUBA_R	lduba	[%r16, %r17] 0x80, %r15
	.word 0x9abc0011  ! 11: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x983c22f7  ! 11: XNOR_I	xnor 	%r16, 0x02f7, %r12
	.word 0x96442876  ! 11: ADDC_I	addc 	%r16, 0x0876, %r11
	.word 0x98140011  ! 11: OR_R	or 	%r16, %r17, %r12
	.word 0x90140011  ! 11: OR_R	or 	%r16, %r17, %r8
	.word 0xb60c2da8  ! 11: AND_I	and 	%r16, 0x0da8, %r27
	.word 0x9e1c0011  ! 11: XOR_R	xor 	%r16, %r17, %r15
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,68)
	.word 0xde9c2da8  ! 13: LDDA_I	ldda	[%r16, + 0x0da8] %asi, %r15
	ta	T_CHANGE_PRIV	! macro
	.word 0xb0c42c42  ! 17: ADDCcc_I	addccc 	%r16, 0x0c42, %r24
	.word 0x86c40011  ! 17: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x9d340011  ! 17: SRL_R	srl 	%r16, %r17, %r14
	.word 0x8ac426da  ! 17: ADDCcc_I	addccc 	%r16, 0x06da, %r5
	.word 0x84440011  ! 17: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x8e040011  ! 17: ADD_R	add 	%r16, %r17, %r7
	.word 0xde140011  ! 18: LDUH_R	lduh	[%r16 + %r17], %r15
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xd8942f91  ! 20: LDUHA_I	lduha	[%r16, + 0x0f91] %asi, %r12
	.word 0x9e042da0  ! 22: ADD_I	add 	%r16, 0x0da0, %r15
	.word 0x86c42355  ! 22: ADDCcc_I	addccc 	%r16, 0x0355, %r3
	.word 0x8d643801  ! 22: MOVcc_I	<illegal instruction>
	.word 0xacbc2072  ! 22: XNORcc_I	xnorcc 	%r16, 0x0072, %r22
	.word 0x9a3c0011  ! 22: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x82bc0011  ! 22: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x912c1011  ! 22: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x8a3c0011  ! 22: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xcc5c0011  ! 23: LDX_R	ldx	[%r16 + %r17], %r6
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xd04c2c14  ! 25: LDSB_I	ldsb	[%r16 + 0x0c14], %r8
	.word 0x9e0c2e9d  ! 27: AND_I	and 	%r16, 0x0e9d, %r15
	.word 0xa93c0011  ! 27: SRA_R	sra 	%r16, %r17, %r20
	.word 0x89641811  ! 27: MOVcc_R	<illegal instruction>
	.word 0x84040011  ! 27: ADD_R	add 	%r16, %r17, %r2
	.word 0x893c2001  ! 27: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0xa9340011  ! 27: SRL_R	srl 	%r16, %r17, %r20
	.word 0x957c2401  ! 27: MOVR_I	move	%r16, 0x7fff9c24, %r10
	.word 0xb1343001  ! 27: SRLX_I	srlx	%r16, 0x0001, %r24
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,27)
	.word 0xf01c0000  ! 29: LDD_R	ldd	[%r16 + %r0], %r24
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16),1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xf3841011  ! 31: LDFA_R	lda	[%r16, %r17], %f25
	.word 0x8f7c2401  ! 33: MOVR_I	move	%r16, 0x7fff9c24, %r7
	.word 0x963422fd  ! 33: ORN_I	orn 	%r16, 0x02fd, %r11
	.word 0xae3c0011  ! 33: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0xb48c0011  ! 33: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0xbac40011  ! 33: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0x989c0011  ! 33: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x9f3c0011  ! 33: SRA_R	sra 	%r16, %r17, %r15
	.word 0x980c2423  ! 33: AND_I	and 	%r16, 0x0423, %r12
	.word 0xcc8c1011  ! 34: LDUBA_R	lduba	[%r16, %r17] 0x80, %r6
	.word 0xcf1427dd  ! 36: LDQF_I	-	[%r16, 0x07dd], %f7
	.word 0x921c2f4d  ! 38: XOR_I	xor 	%r16, 0x0f4d, %r9
	.word 0x832c0011  ! 38: SLL_R	sll 	%r16, %r17, %r1
	.word 0xba84209f  ! 38: ADDcc_I	addcc 	%r16, 0x009f, %r29
	.word 0x91341011  ! 38: SRLX_R	srlx	%r16, %r17, %r8
	.word 0xa80426e7  ! 38: ADD_I	add 	%r16, 0x06e7, %r20
	.word 0xac940011  ! 38: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0x833c0011  ! 38: SRA_R	sra 	%r16, %r17, %r1
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,2)
	.word 0xc24c0000  ! 40: LDSB_R	ldsb	[%r16 + %r0], %r1
	.word 0xf1042c37  ! 42: LDF_I	ld	[%r16, 0x0c37], %f24
	.word 0x82ac2d2d  ! 44: ANDNcc_I	andncc 	%r16, 0x0d2d, %r1
	.word 0x9c840011  ! 44: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0x9cb40011  ! 44: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x94142c84  ! 44: OR_I	or 	%r16, 0x0c84, %r10
	.word 0x861c21bc  ! 44: XOR_I	xor 	%r16, 0x01bc, %r3
	.word 0x997c2401  ! 44: MOVR_I	move	%r16, 0x7fff9c24, %r12
	.word 0xb12c3001  ! 44: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0xb44420a0  ! 44: ADDC_I	addc 	%r16, 0x00a0, %r26
	.word 0xed1c0011  ! 45: LDDF_R	ldd	[%r16, %r17], %f22
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xde242d73  ! 49: STW_I	stw	%r15, [%r16 + 0x0d73]
	.word 0x852c2001  ! 51: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x86c42f8d  ! 51: ADDCcc_I	addccc 	%r16, 0x0f8d, %r3
	.word 0xab343001  ! 51: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0xb2042d70  ! 51: ADD_I	add 	%r16, 0x0d70, %r25
	.word 0xba0c0011  ! 51: AND_R	and 	%r16, %r17, %r29
	.word 0x932c2001  ! 51: SLL_I	sll 	%r16, 0x0001, %r9
thr0_dc_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_3), 16, 16),1,DC_DATA,33)
	.word 0xd2042d70  ! 53: LDUW_I	lduw	[%r16 + 0x0d70], %r9
	.word 0xf40c2afe  ! 55: LDUB_I	ldub	[%r16 + 0x0afe], %r26
	.word 0x96bc0011  ! 57: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x84840011  ! 57: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0xa68429e7  ! 57: ADDcc_I	addcc 	%r16, 0x09e7, %r19
	.word 0x857c0411  ! 57: MOVR_R	move	%r16, %r17, %r2
	.word 0x8c0c0011  ! 57: AND_R	and 	%r16, %r17, %r6
	.word 0x9c34208c  ! 57: ORN_I	orn 	%r16, 0x008c, %r14
	.word 0x9f2c2001  ! 57: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0x83342001  ! 57: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0xcf1c2944  ! 58: LDDF_I	ldd	[%r16, 0x0944], %f7
thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x917c2401  ! 62: MOVR_I	move	%r16, 0x7fff9c24, %r8
	.word 0x82340011  ! 62: ORN_R	orn 	%r16, %r17, %r1
	.word 0x83342001  ! 62: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x8abc2af2  ! 62: XNORcc_I	xnorcc 	%r16, 0x0af2, %r5
	.word 0x960c2525  ! 62: AND_I	and 	%r16, 0x0525, %r11
	.word 0xac940011  ! 62: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0xb8940011  ! 62: ORcc_R	orcc 	%r16, %r17, %r28
	.word 0x8b3c2001  ! 62: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0xf40c2d7d  ! 63: LDUB_I	ldub	[%r16 + 0x0d7d], %r26
	.word 0x20800003  ! 65: BN	bn,a	<label_0x3>
	.word 0x96c42f79  ! 67: ADDCcc_I	addccc 	%r16, 0x0f79, %r11
	.word 0x9e0c21ea  ! 67: AND_I	and 	%r16, 0x01ea, %r15
	.word 0x83342001  ! 67: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x94142cd7  ! 67: OR_I	or 	%r16, 0x0cd7, %r10
	.word 0x83342001  ! 67: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0xb04424b6  ! 67: ADDC_I	addc 	%r16, 0x04b6, %r24
	.word 0xb7643801  ! 67: MOVcc_I	<illegal instruction>
	.word 0xb72c2001  ! 67: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xc49c2d92  ! 68: LDDA_I	ldda	[%r16, + 0x0d92] %asi, %r2
thr0_irf_ce_7:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_7), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	wr      %r0, 0x1, %asr26
	.word 0x9e340011  ! 72: ORN_R	orn 	%r16, %r17, %r15
	.word 0xa69c0011  ! 72: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x89641811  ! 72: MOVcc_R	<illegal instruction>
	.word 0x98940011  ! 72: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x8b2c2001  ! 72: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x917c2401  ! 72: MOVR_I	move	%r16, 0x7fff9c24, %r8
	.word 0x9d2c2001  ! 72: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0xf9841011  ! 73: LDFA_R	lda	[%r16, %r17], %f28
!Illinst store
	.word 0xc8340011  ! 75: STH_R	sth	%r4, [%r16 + %r17]
	.word 0x9c3c0011  ! 77: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x9ec427f4  ! 77: ADDCcc_I	addccc 	%r16, 0x07f4, %r15
	.word 0x92840011  ! 77: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0x841420b3  ! 77: OR_I	or 	%r16, 0x00b3, %r2
	.word 0xaf3c1011  ! 77: SRAX_R	srax	%r16, %r17, %r23
	.word 0xb6bc0011  ! 77: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0xb2140011  ! 77: OR_R	or 	%r16, %r17, %r25
	.word 0x83343001  ! 77: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0xcf841011  ! 78: LDFA_R	lda	[%r16, %r17], %f7
!Illinst alu
	.word 0x9a84278a  ! 80: ADDcc_I	addcc 	%r16, 0x078a, %r13
	.word 0xa92c3001  ! 82: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0x88840011  ! 82: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x9d340011  ! 82: SRL_R	srl 	%r16, %r17, %r14
	.word 0x9a3424d3  ! 82: ORN_I	orn 	%r16, 0x04d3, %r13
	.word 0x821c0011  ! 82: XOR_R	xor 	%r16, %r17, %r1
thr0_dc_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_4), 16, 16),1,DC_DATA,40)
	.word 0xc2c424d3  ! 84: LDSWA_I	ldswa	[%r16, + 0x04d3] %asi, %r1
	.word 0xf0842da3  ! 86: LDUWA_I	lduwa	[%r16, + 0x0da3] %asi, %r24
	.word 0x99643801  ! 88: MOVcc_I	<illegal instruction>
	.word 0xa69c0011  ! 88: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0xb0142407  ! 88: OR_I	or 	%r16, 0x0407, %r24
	.word 0x973c2001  ! 88: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0xbb2c0011  ! 88: SLL_R	sll 	%r16, %r17, %r29
	.word 0x912c3001  ! 88: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0xcac429cd  ! 89: LDSWA_I	ldswa	[%r16, + 0x09cd] %asi, %r5
	.word 0xd3941011  ! 91: LDQFA_R	-	[%r16, %r17], %f9
	.word 0x943429cd  ! 93: ORN_I	orn 	%r16, 0x09cd, %r10
	.word 0x98b42938  ! 93: ORNcc_I	orncc 	%r16, 0x0938, %r12
	.word 0x90ac0011  ! 93: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0xaa8c0011  ! 93: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0x9e342388  ! 93: ORN_I	orn 	%r16, 0x0388, %r15
	.word 0x928c0011  ! 93: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0x90b42fd8  ! 93: ORNcc_I	orncc 	%r16, 0x0fd8, %r8
	.word 0x8b341011  ! 93: SRLX_R	srlx	%r16, %r17, %r5
	.word 0xcecc1011  ! 94: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r7
thr0_irf_ce_8:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_8), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xc6dc1011  ! 96: LDXA_R	ldxa	[%r16, %r17] 0x80, %r3
	.word 0xa89c28b1  ! 98: XORcc_I	xorcc 	%r16, 0x08b1, %r20
	.word 0x8c340011  ! 98: ORN_R	orn 	%r16, %r17, %r6
	.word 0xb12c1011  ! 98: SLLX_R	sllx	%r16, %r17, %r24
	.word 0xa6c40011  ! 98: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x9b3c2001  ! 98: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0xf6440011  ! 99: LDSW_R	ldsw	[%r16 + %r17], %r27
thr0_irf_ce_9:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_9), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xcd9c1011  ! 101: LDDFA_R	ldda	[%r16, %r17], %f6
	.word 0x9c8c210d  ! 103: ANDcc_I	andcc 	%r16, 0x010d, %r14
	.word 0x888c0011  ! 103: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0xb4040011  ! 103: ADD_R	add 	%r16, %r17, %r26
	.word 0x8d340011  ! 103: SRL_R	srl 	%r16, %r17, %r6
	.word 0x940c26c1  ! 103: AND_I	and 	%r16, 0x06c1, %r10
	.word 0x9a842407  ! 103: ADDcc_I	addcc 	%r16, 0x0407, %r13
	.word 0xb6c422af  ! 103: ADDCcc_I	addccc 	%r16, 0x02af, %r27
thr0_dc_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_5), 16, 16),1,DC_DATA,57)
	.word 0xf69c22af  ! 105: LDDA_I	ldda	[%r16, + 0x02af] %asi, %r27
thr0_irf_ce_10:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_10), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xd83421b8  ! 109: STH_I	sth	%r12, [%r16 + 0x01b8]
	.word 0xb69c2bbe  ! 111: XORcc_I	xorcc 	%r16, 0x0bbe, %r27
	.word 0xae440011  ! 111: ADDC_R	addc 	%r16, %r17, %r23
	.word 0x941428d2  ! 111: OR_I	or 	%r16, 0x08d2, %r10
	.word 0x948c0011  ! 111: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x902c25e1  ! 111: ANDN_I	andn 	%r16, 0x05e1, %r8
	.word 0x86942acf  ! 111: ORcc_I	orcc 	%r16, 0x0acf, %r3
	.word 0x9d2c1011  ! 111: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x90c42fc3  ! 111: ADDCcc_I	addccc 	%r16, 0x0fc3, %r8
	.word 0xcc140011  ! 112: LDUH_R	lduh	[%r16 + %r17], %r6
	.word 0xd8fc1011  ! 114: SWAPA_R	swapa	%r12, [%r16 + %r17] 0x80
	.word 0x912c3001  ! 116: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x913c0011  ! 116: SRA_R	sra 	%r16, %r17, %r8
	.word 0x972c2001  ! 116: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x948c2149  ! 116: ANDcc_I	andcc 	%r16, 0x0149, %r10
	.word 0x9c2c0011  ! 116: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x9d2c2001  ! 116: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x833c2001  ! 116: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0x90442c8a  ! 116: ADDC_I	addc 	%r16, 0x0c8a, %r8
thr0_dc_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_6), 16, 16),1,DC_DATA,36)
	.word 0xd1140000  ! 118: LDQF_R	-	[%r16, %r0], %f8
thr0_irf_ce_11:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_11), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xf3941011  ! 120: LDQFA_R	-	[%r16, %r17], %f25
	.word 0x9f7c2401  ! 122: MOVR_I	move	%r16, 0x7fff9c24, %r15
	.word 0xa69c2f5d  ! 122: XORcc_I	xorcc 	%r16, 0x0f5d, %r19
	.word 0x97342001  ! 122: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0x963c0011  ! 122: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x842c26ea  ! 122: ANDN_I	andn 	%r16, 0x06ea, %r2
thr0_dc_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_7), 16, 16),1,DC_DATA,57)
	.word 0xc5040000  ! 124: LDF_R	ld	[%r16, %r0], %f2
thr0_irf_ce_12:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_12), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xd9142a9a  ! 126: LDQF_I	-	[%r16, 0x0a9a], %f12
	.word 0xae8c240e  ! 128: ANDcc_I	andcc 	%r16, 0x040e, %r23
	.word 0x912c1011  ! 128: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x93341011  ! 128: SRLX_R	srlx	%r16, %r17, %r9
	.word 0xad341011  ! 128: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x8d340011  ! 128: SRL_R	srl 	%r16, %r17, %r6
	.word 0x86b42998  ! 128: ORNcc_I	orncc 	%r16, 0x0998, %r3
	.word 0x97643801  ! 128: MOVcc_I	<illegal instruction>
	.word 0xa8b40011  ! 128: ORNcc_R	orncc 	%r16, %r17, %r20
	.word 0xc71c0011  ! 129: LDDF_R	ldd	[%r16, %r17], %f3
thr0_irf_ce_13:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_13), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xcf1c2e0d  ! 131: LDDF_I	ldd	[%r16, 0x0e0d], %f7
	.word 0xab643801  ! 133: MOVcc_I	<illegal instruction>
	.word 0xb41c0011  ! 133: XOR_R	xor 	%r16, %r17, %r26
	.word 0xa6c422b3  ! 133: ADDCcc_I	addccc 	%r16, 0x02b3, %r19
	.word 0xb5342001  ! 133: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0x9c840011  ! 133: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0x882c0011  ! 133: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x8e8421a1  ! 133: ADDcc_I	addcc 	%r16, 0x01a1, %r7
thr0_dc_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_8), 16, 16),1,DC_DATA,43)
	.word 0xcf941000  ! 135: LDQFA_R	-	[%r16, %r0], %f7
thr0_irf_ce_14:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_14), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xd2040011  ! 137: LDUW_R	lduw	[%r16 + %r17], %r9
	.word 0x8a340011  ! 139: ORN_R	orn 	%r16, %r17, %r5
	.word 0xa69c264d  ! 139: XORcc_I	xorcc 	%r16, 0x064d, %r19
	.word 0x8c842f57  ! 139: ADDcc_I	addcc 	%r16, 0x0f57, %r6
	.word 0xb22c27d0  ! 139: ANDN_I	andn 	%r16, 0x07d0, %r25
	.word 0xa8bc0011  ! 139: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0xac940011  ! 139: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0x940c2fae  ! 139: AND_I	and 	%r16, 0x0fae, %r10
	.word 0xcc1c0011  ! 140: LDD_R	ldd	[%r16 + %r17], %r6
	.word 0xfac42f28  ! 142: LDSWA_I	ldswa	[%r16, + 0x0f28] %asi, %r29
	.word 0x87340011  ! 144: SRL_R	srl 	%r16, %r17, %r3
	.word 0x8cc40011  ! 144: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x8b2c3001  ! 144: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0xac440011  ! 144: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x9b342001  ! 144: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x8a1c2e5a  ! 144: XOR_I	xor 	%r16, 0x0e5a, %r5
	.word 0xdd1c0011  ! 145: LDDF_R	ldd	[%r16, %r17], %f14
!Illinst alu
	.word 0x9a440011  ! 147: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x84c42532  ! 149: ADDCcc_I	addccc 	%r16, 0x0532, %r2
	.word 0xb0940011  ! 149: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0xa6840011  ! 149: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x9c1c0011  ! 149: XOR_R	xor 	%r16, %r17, %r14
	.word 0x82342d86  ! 149: ORN_I	orn 	%r16, 0x0d86, %r1
	.word 0x881c2667  ! 149: XOR_I	xor 	%r16, 0x0667, %r4
	.word 0xb48c0011  ! 149: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0x90340011  ! 149: ORN_R	orn 	%r16, %r17, %r8
	.word 0xd4dc1011  ! 150: LDXA_R	ldxa	[%r16, %r17] 0x80, %r10
thr0_irf_ce_15:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_15), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xcc540011  ! 152: LDSH_R	ldsh	[%r16 + %r17], %r6
	.word 0x82040011  ! 154: ADD_R	add 	%r16, %r17, %r1
	.word 0x9f3c0011  ! 154: SRA_R	sra 	%r16, %r17, %r15
	.word 0xb2bc22f5  ! 154: XNORcc_I	xnorcc 	%r16, 0x02f5, %r25
	.word 0xb00420d9  ! 154: ADD_I	add 	%r16, 0x00d9, %r24
	.word 0x849c0011  ! 154: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x9eac0011  ! 154: ANDNcc_R	andncc 	%r16, %r17, %r15
thr0_dc_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_9), 16, 16),1,DC_DATA,52)
	.word 0xdf841000  ! 156: LDFA_R	lda	[%r16, %r0], %f15
thr0_irf_ce_16:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_16), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xf24c0011  ! 158: LDSB_R	ldsb	[%r16 + %r17], %r25
	.word 0x90340011  ! 160: ORN_R	orn 	%r16, %r17, %r8
	.word 0x9cac0011  ! 160: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0x9cac2a3c  ! 160: ANDNcc_I	andncc 	%r16, 0x0a3c, %r14
	.word 0x88040011  ! 160: ADD_R	add 	%r16, %r17, %r4
	.word 0x909c2a1a  ! 160: XORcc_I	xorcc 	%r16, 0x0a1a, %r8
	.word 0x8cc420a9  ! 160: ADDCcc_I	addccc 	%r16, 0x00a9, %r6
	.word 0x82442a5d  ! 160: ADDC_I	addc 	%r16, 0x0a5d, %r1
	.word 0x8a3c0011  ! 160: XNOR_R	xnor 	%r16, %r17, %r5
thr0_dc_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_10), 16, 16),1,DC_DATA,29)
	.word 0xcb9c1000  ! 162: LDDFA_R	ldda	[%r16, %r0], %f5
thr0_irf_ce_17:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_17), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xd4cc1011  ! 164: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r10
	.word 0x9c44265c  ! 166: ADDC_I	addc 	%r16, 0x065c, %r14
	.word 0xae9c267d  ! 166: XORcc_I	xorcc 	%r16, 0x067d, %r23
	.word 0xae44214f  ! 166: ADDC_I	addc 	%r16, 0x014f, %r23
	.word 0x9e0c2877  ! 166: AND_I	and 	%r16, 0x0877, %r15
	.word 0x9b2c3001  ! 166: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0xad2c3001  ! 166: SLLX_I	sllx	%r16, 0x0001, %r22
	.word 0x9c340011  ! 166: ORN_R	orn 	%r16, %r17, %r14
	.word 0xd59c1011  ! 167: LDDFA_R	ldda	[%r16, %r17], %f10
	.word 0xf0440011  ! 169: LDSW_R	ldsw	[%r16 + %r17], %r24
	.word 0xac3c0011  ! 171: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x9e1427d7  ! 171: OR_I	or 	%r16, 0x07d7, %r15
	.word 0xb2bc2eb3  ! 171: XNORcc_I	xnorcc 	%r16, 0x0eb3, %r25
	.word 0x9e942c5a  ! 171: ORcc_I	orcc 	%r16, 0x0c5a, %r15
	.word 0x9f643801  ! 171: MOVcc_I	<illegal instruction>
	.word 0x95342001  ! 171: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x9b7c2401  ! 171: MOVR_I	move	%r16, 0x7fff9c24, %r13
	.word 0x9c8c0011  ! 171: ANDcc_R	andcc 	%r16, %r17, %r14
thr0_dc_err_11:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_11), 16, 16),1,DC_DATA,0)
	.word 0xdccc2c5a  ! 173: LDSBA_I	ldsba	[%r16, + 0x0c5a] %asi, %r14
thr0_irf_ce_18:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_18), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xd65c25bc  ! 175: LDX_I	ldx	[%r16 + 0x05bc], %r11
	.word 0x901c0011  ! 177: XOR_R	xor 	%r16, %r17, %r8
	.word 0xb83c0011  ! 177: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xb20c0011  ! 177: AND_R	and 	%r16, %r17, %r25
	.word 0x9e2c0011  ! 177: ANDN_R	andn 	%r16, %r17, %r15
	.word 0xa8ac0011  ! 177: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0x96440011  ! 177: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x8a8c2217  ! 177: ANDcc_I	andcc 	%r16, 0x0217, %r5
	.word 0xf28c1011  ! 178: LDUBA_R	lduba	[%r16, %r17] 0x80, %r25
	.word 0xd4dc1011  ! 180: LDXA_R	ldxa	[%r16, %r17] 0x80, %r10
	.word 0x8f3c2001  ! 182: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x8a442f19  ! 182: ADDC_I	addc 	%r16, 0x0f19, %r5
	.word 0x912c1011  ! 182: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x8d641811  ! 182: MOVcc_R	<illegal instruction>
	.word 0x9f340011  ! 182: SRL_R	srl 	%r16, %r17, %r15
thr0_dc_err_12:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_12), 16, 16),1,DC_DATA,22)
	.word 0xdf1c2f19  ! 184: LDDF_I	ldd	[%r16, 0x0f19], %f15
	.word 0xf1040011  ! 186: LDF_R	ld	[%r16, %r17], %f24
	.word 0x9e342ceb  ! 188: ORN_I	orn 	%r16, 0x0ceb, %r15
	.word 0xa8bc224a  ! 188: XNORcc_I	xnorcc 	%r16, 0x024a, %r20
	.word 0xbb340011  ! 188: SRL_R	srl 	%r16, %r17, %r29
	.word 0xa8440011  ! 188: ADDC_R	addc 	%r16, %r17, %r20
	.word 0x92840011  ! 188: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0xb48427fa  ! 188: ADDcc_I	addcc 	%r16, 0x07fa, %r26
	.word 0x9b2c2001  ! 188: SLL_I	sll 	%r16, 0x0001, %r13
thr0_dc_err_13:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_13), 16, 16),1,DC_DATA,48)
	.word 0xdadc1000  ! 190: LDXA_R	ldxa	[%r16, %r0] 0x80, %r13
thr0_irf_ce_19:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_19), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xc6ec1011  ! 192: LDSTUBA_R	ldstuba	%r3, [%r16 + %r17] 0x80
	.word 0x9e0c0011  ! 194: AND_R	and 	%r16, %r17, %r15
	.word 0x88842f26  ! 194: ADDcc_I	addcc 	%r16, 0x0f26, %r4
	.word 0x973c0011  ! 194: SRA_R	sra 	%r16, %r17, %r11
	.word 0x8e142544  ! 194: OR_I	or 	%r16, 0x0544, %r7
	.word 0x8e3c0011  ! 194: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xb02c216f  ! 194: ANDN_I	andn 	%r16, 0x016f, %r24
thr0_dc_err_14:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_14), 16, 16),1,DC_DATA,6)
	.word 0xf00c0000  ! 196: LDUB_R	ldub	[%r16 + %r0], %r24
thr0_irf_ce_20:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_20), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xd05c273d  ! 198: LDX_I	ldx	[%r16 + 0x073d], %r8
	.word 0x901c0011  ! 200: XOR_R	xor 	%r16, %r17, %r8
	.word 0x88ac0011  ! 200: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x99643801  ! 200: MOVcc_I	<illegal instruction>
	.word 0xb6142d50  ! 200: OR_I	or 	%r16, 0x0d50, %r27
	.word 0x96140011  ! 200: OR_R	or 	%r16, %r17, %r11
	.word 0xab641811  ! 200: MOVcc_R	<illegal instruction>
	.word 0xba9c2e17  ! 200: XORcc_I	xorcc 	%r16, 0x0e17, %r29
	.word 0xf79c1011  ! 201: LDDFA_R	ldda	[%r16, %r17], %f27
thr0_irf_ce_21:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_21), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	wr      %r0, 0x1, %asr26
	.word 0x823c0011  ! 205: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x8eac298f  ! 205: ANDNcc_I	andncc 	%r16, 0x098f, %r7
	.word 0x832c1011  ! 205: SLLX_R	sllx	%r16, %r17, %r1
	.word 0xb20426b0  ! 205: ADD_I	add 	%r16, 0x06b0, %r25
	.word 0xb0140011  ! 205: OR_R	or 	%r16, %r17, %r24
	.word 0x8f2c2001  ! 205: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0xb02c0011  ! 205: ANDN_R	andn 	%r16, %r17, %r24
	.word 0x90040011  ! 205: ADD_R	add 	%r16, %r17, %r8
thr0_dc_err_15:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_15), 16, 16),1,DC_DATA,69)
	.word 0xd11c26b0  ! 207: LDDF_I	ldd	[%r16, 0x06b0], %f8
	.word 0xced42333  ! 209: LDSHA_I	ldsha	[%r16, + 0x0333] %asi, %r7
	.word 0x88840011  ! 211: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x94c40011  ! 211: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0xba0c2dfc  ! 211: AND_I	and 	%r16, 0x0dfc, %r29
	.word 0xaf7c0411  ! 211: MOVR_R	move	%r16, %r17, %r23
	.word 0xb0bc21e7  ! 211: XNORcc_I	xnorcc 	%r16, 0x01e7, %r24
	.word 0xee5c0011  ! 212: LDX_R	ldx	[%r16 + %r17], %r23
	.word 0xf8c41011  ! 214: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r28
	.word 0xb8340011  ! 216: ORN_R	orn 	%r16, %r17, %r28
	.word 0x99342001  ! 216: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x852c3001  ! 216: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0x8e0c0011  ! 216: AND_R	and 	%r16, %r17, %r7
	.word 0x943c2747  ! 216: XNOR_I	xnor 	%r16, 0x0747, %r10
	.word 0xad2c1011  ! 216: SLLX_R	sllx	%r16, %r17, %r22
	.word 0xda8c1011  ! 217: LDUBA_R	lduba	[%r16, %r17] 0x80, %r13
	.word 0xf3841011  ! 219: LDFA_R	lda	[%r16, %r17], %f25
	.word 0x9c9c2bf5  ! 221: XORcc_I	xorcc 	%r16, 0x0bf5, %r14
	.word 0x840c0011  ! 221: AND_R	and 	%r16, %r17, %r2
	.word 0x8e3c0011  ! 221: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xb9641811  ! 221: MOVcc_R	<illegal instruction>
	.word 0xaeb40011  ! 221: ORNcc_R	orncc 	%r16, %r17, %r23
	.word 0x96ac271a  ! 221: ANDNcc_I	andncc 	%r16, 0x071a, %r11
	.word 0x942c0011  ! 221: ANDN_R	andn 	%r16, %r17, %r10
thr0_dc_err_16:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_16), 16, 16),1,DC_DATA,22)
	.word 0xd51c0000  ! 223: LDDF_R	ldd	[%r16, %r0], %f10
thr0_irf_ce_22:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_22), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xfa342c7d  ! 227: STH_I	sth	%r29, [%r16 + 0x0c7d]
	.word 0x893c1011  ! 229: SRAX_R	srax	%r16, %r17, %r4
	.word 0x983c2b09  ! 229: XNOR_I	xnor 	%r16, 0x0b09, %r12
	.word 0x9e440011  ! 229: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x83341011  ! 229: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x8ec40011  ! 229: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0xa7341011  ! 229: SRLX_R	srlx	%r16, %r17, %r19
	.word 0xd2dc1011  ! 230: LDXA_R	ldxa	[%r16, %r17] 0x80, %r9
	.word 0xd2841011  ! 232: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r9
	.word 0xa80c2c65  ! 234: AND_I	and 	%r16, 0x0c65, %r20
	.word 0x92342f5c  ! 234: ORN_I	orn 	%r16, 0x0f5c, %r9
	.word 0x88c42093  ! 234: ADDCcc_I	addccc 	%r16, 0x0093, %r4
	.word 0xba1c0011  ! 234: XOR_R	xor 	%r16, %r17, %r29
	.word 0xb43c0011  ! 234: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x840c2e23  ! 234: AND_I	and 	%r16, 0x0e23, %r2
	.word 0x94940011  ! 234: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x873c1011  ! 234: SRAX_R	srax	%r16, %r17, %r3
thr0_dc_err_17:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_17), 16, 16),1,DC_DATA,56)
	.word 0xc7142e23  ! 236: LDQF_I	-	[%r16, 0x0e23], %f3
	.word 0xd8942edc  ! 238: LDUHA_I	lduha	[%r16, + 0x0edc] %asi, %r12
	.word 0x82340011  ! 240: ORN_R	orn 	%r16, %r17, %r1
	.word 0x9f643801  ! 240: MOVcc_I	<illegal instruction>
	.word 0xa83c2795  ! 240: XNOR_I	xnor 	%r16, 0x0795, %r20
	.word 0xa72c2001  ! 240: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0x8c2c2167  ! 240: ANDN_I	andn 	%r16, 0x0167, %r6
	.word 0x933c2001  ! 240: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0xb48c2378  ! 240: ANDcc_I	andcc 	%r16, 0x0378, %r26
thr0_dc_err_18:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_18), 16, 16),1,DC_DATA,4)
	.word 0xf4042378  ! 242: LDUW_I	lduw	[%r16 + 0x0378], %r26
	.word 0xcf9c1011  ! 244: LDDFA_R	ldda	[%r16, %r17], %f7
	.word 0xae840011  ! 246: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0xa81c2c54  ! 246: XOR_I	xor 	%r16, 0x0c54, %r20
	.word 0xa61c265b  ! 246: XOR_I	xor 	%r16, 0x065b, %r19
	.word 0x902c2553  ! 246: ANDN_I	andn 	%r16, 0x0553, %r8
	.word 0xb12c3001  ! 246: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x921c21d8  ! 246: XOR_I	xor 	%r16, 0x01d8, %r9
thr0_dc_err_19:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_19), 16, 16),1,DC_DATA,15)
	.word 0xd2d421d8  ! 248: LDSHA_I	ldsha	[%r16, + 0x01d8] %asi, %r9
thr0_irf_ce_23:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_23), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xc8c41011  ! 250: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r4
	.word 0x8b3c1011  ! 252: SRAX_R	srax	%r16, %r17, %r5
	.word 0x82b42671  ! 252: ORNcc_I	orncc 	%r16, 0x0671, %r1
	.word 0x96340011  ! 252: ORN_R	orn 	%r16, %r17, %r11
	.word 0x98ac0011  ! 252: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x9ebc0011  ! 252: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0x8aac2744  ! 252: ANDNcc_I	andncc 	%r16, 0x0744, %r5
thr0_dc_err_20:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_20), 16, 16),1,DC_DATA,39)
	.word 0xca4c2744  ! 254: LDSB_I	ldsb	[%r16 + 0x0744], %r5
thr0_irf_ce_24:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_24), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xcf1c2ddd  ! 256: LDDF_I	ldd	[%r16, 0x0ddd], %f7
	.word 0xac042443  ! 258: ADD_I	add 	%r16, 0x0443, %r22
	.word 0x869421b6  ! 258: ORcc_I	orcc 	%r16, 0x01b6, %r3
	.word 0x90442df2  ! 258: ADDC_I	addc 	%r16, 0x0df2, %r8
	.word 0x9e442497  ! 258: ADDC_I	addc 	%r16, 0x0497, %r15
	.word 0x9aac2d13  ! 258: ANDNcc_I	andncc 	%r16, 0x0d13, %r13
	.word 0xb3340011  ! 258: SRL_R	srl 	%r16, %r17, %r25
	.word 0xaeb424a1  ! 258: ORNcc_I	orncc 	%r16, 0x04a1, %r23
thr0_dc_err_21:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_21), 16, 16),1,DC_DATA,31)
	.word 0xef140000  ! 260: LDQF_R	-	[%r16, %r0], %f23
	.word 0xd40c246d  ! 262: LDUB_I	ldub	[%r16 + 0x046d], %r10
	.word 0xb0c426fb  ! 264: ADDCcc_I	addccc 	%r16, 0x06fb, %r24
	.word 0xa6140011  ! 264: OR_R	or 	%r16, %r17, %r19
	.word 0xb5641811  ! 264: MOVcc_R	<illegal instruction>
	.word 0x9eb40011  ! 264: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x997c0411  ! 264: MOVR_R	move	%r16, %r17, %r12
	.word 0x942c2a20  ! 264: ANDN_I	andn 	%r16, 0x0a20, %r10
	.word 0x913c2001  ! 264: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x9b341011  ! 264: SRLX_R	srlx	%r16, %r17, %r13
	.word 0xc80c2d6d  ! 265: LDUB_I	ldub	[%r16 + 0x0d6d], %r4
	.word 0xee842052  ! 267: LDUWA_I	lduwa	[%r16, + 0x0052] %asi, %r23
	.word 0x833c0011  ! 269: SRA_R	sra 	%r16, %r17, %r1
	.word 0x948c2713  ! 269: ANDcc_I	andcc 	%r16, 0x0713, %r10
	.word 0x8a9c0011  ! 269: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0xa68c0011  ! 269: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0xae040011  ! 269: ADD_R	add 	%r16, %r17, %r23
	.word 0xb02c252a  ! 269: ANDN_I	andn 	%r16, 0x052a, %r24
	.word 0xb48c0011  ! 269: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0x96b4214b  ! 270: ORNcc_I	orncc 	%r16, 0x014b, %r11
	.word 0x9a940011  ! 270: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x8a0424f0  ! 270: ADD_I	add 	%r16, 0x04f0, %r5
	.word 0xba040011  ! 270: ADD_R	add 	%r16, %r17, %r29
	.word 0xb17c2401  ! 270: MOVR_I	move	%r16, 0x7fff9c24, %r24
	.word 0xb6bc20bc  ! 270: XNORcc_I	xnorcc 	%r16, 0x00bc, %r27
	.word 0x920c0011  ! 270: AND_R	and 	%r16, %r17, %r9
	rd      %pc, %r18
	set     0x20, %r17
thr0_dc_err_22:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_22), 16, 16),1,DC_DATA,12)
	.word 0xd2dc1000  ! 271: LDXA_R	ldxa	[%r16, %r0] 0x80, %r9
thr0_irf_ce_25:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_25), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	return     %r18 + 0x20
	.word 0xab641811  ! 274: MOVcc_R	<illegal instruction>
	.word 0x86840011  ! 274: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0xad3c2001  ! 274: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0xad2c0011  ! 274: SLL_R	sll 	%r16, %r17, %r22
	.word 0x889c0011  ! 274: XORcc_R	xorcc 	%r16, %r17, %r4
thr0_dc_err_23:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_23), 16, 16),1,DC_DATA,53)
	.word 0xc91420bc  ! 276: LDQF_I	-	[%r16, 0x00bc], %f4
thr0_irf_ce_26:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_26), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xea5c22ba  ! 278: LDX_I	ldx	[%r16 + 0x02ba], %r21
	.word 0xba0c0011  ! 280: AND_R	and 	%r16, %r17, %r29
	.word 0xa89c2a65  ! 280: XORcc_I	xorcc 	%r16, 0x0a65, %r20
	.word 0x833c2001  ! 280: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0x93340011  ! 280: SRL_R	srl 	%r16, %r17, %r9
	.word 0xa6340011  ! 280: ORN_R	orn 	%r16, %r17, %r19
	.word 0x82442efd  ! 280: ADDC_I	addc 	%r16, 0x0efd, %r1
thr0_dc_err_24:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_24), 16, 16),1,DC_DATA,4)
	.word 0xc2140000  ! 282: LDUH_R	lduh	[%r16 + %r0], %r1
	.word 0xce542821  ! 284: LDSH_I	ldsh	[%r16 + 0x0821], %r7
	.word 0xb13c1011  ! 286: SRAX_R	srax	%r16, %r17, %r24
	.word 0xac940011  ! 286: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0xb5341011  ! 286: SRLX_R	srlx	%r16, %r17, %r26
	.word 0xb92c3001  ! 286: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0x868c0011  ! 286: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x9284221a  ! 286: ADDcc_I	addcc 	%r16, 0x021a, %r9
	.word 0xac9424ad  ! 286: ORcc_I	orcc 	%r16, 0x04ad, %r22
	.word 0xba442307  ! 286: ADDC_I	addc 	%r16, 0x0307, %r29
	.word 0xf8cc1011  ! 287: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r28
thr0_irf_ce_27:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_27), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xe68c27df  ! 289: LDUBA_I	lduba	[%r16, + 0x07df] %asi, %r19
	.word 0x942c0011  ! 291: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x903c2c9b  ! 291: XNOR_I	xnor 	%r16, 0x0c9b, %r8
	.word 0x992c2001  ! 291: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0xb2ac2f54  ! 291: ANDNcc_I	andncc 	%r16, 0x0f54, %r25
	.word 0xac3c0011  ! 291: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0xbaac0011  ! 291: ANDNcc_R	andncc 	%r16, %r17, %r29
	.word 0x90442d42  ! 291: ADDC_I	addc 	%r16, 0x0d42, %r8
	.word 0xcb841011  ! 292: LDFA_R	lda	[%r16, %r17], %f5
thr0_irf_ce_28:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_28), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xc4dc1011  ! 294: LDXA_R	ldxa	[%r16, %r17] 0x80, %r2
	.word 0xb0bc2ef8  ! 296: XNORcc_I	xnorcc 	%r16, 0x0ef8, %r24
	.word 0x9f2c2001  ! 296: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0xa72c2001  ! 296: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0x9c1c0011  ! 296: XOR_R	xor 	%r16, %r17, %r14
	.word 0x9e042754  ! 296: ADD_I	add 	%r16, 0x0754, %r15
	.word 0x952c3001  ! 296: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x84c42188  ! 296: ADDCcc_I	addccc 	%r16, 0x0188, %r2
	.word 0xd6140011  ! 297: LDUH_R	lduh	[%r16 + %r17], %r11
thr0_irf_ce_29:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_29), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xd8941011  ! 299: LDUHA_R	lduha	[%r16, %r17] 0x80, %r12
	.word 0x88340011  ! 301: ORN_R	orn 	%r16, %r17, %r4
	.word 0x86ac2769  ! 301: ANDNcc_I	andncc 	%r16, 0x0769, %r3
	.word 0x8f340011  ! 301: SRL_R	srl 	%r16, %r17, %r7
	.word 0xac340011  ! 301: ORN_R	orn 	%r16, %r17, %r22
	.word 0x8ac4242c  ! 301: ADDCcc_I	addccc 	%r16, 0x042c, %r5
	.word 0x84b40011  ! 301: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0x8abc0011  ! 301: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0xdcd42d1b  ! 302: LDSHA_I	ldsha	[%r16, + 0x0d1b] %asi, %r14
thr0_irf_ce_30:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_30), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd1040011  ! 304: LDF_R	ld	[%r16, %r17], %f8
	.word 0x868c0011  ! 306: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x8b342001  ! 306: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x9c3c29d6  ! 306: XNOR_I	xnor 	%r16, 0x09d6, %r14
	.word 0xac440011  ! 306: ADDC_R	addc 	%r16, %r17, %r22
	.word 0xae8c0011  ! 306: ANDcc_R	andcc 	%r16, %r17, %r23
	.word 0x8a8424a6  ! 306: ADDcc_I	addcc 	%r16, 0x04a6, %r5
	.word 0x980425cf  ! 306: ADD_I	add 	%r16, 0x05cf, %r12
	.word 0x8a840011  ! 306: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0xf5841011  ! 307: LDFA_R	lda	[%r16, %r17], %f26
thr0_irf_ce_31:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_31), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xcb1c2b92  ! 309: LDDF_I	ldd	[%r16, 0x0b92], %f5
	.word 0x9c2c2182  ! 311: ANDN_I	andn 	%r16, 0x0182, %r14
	.word 0x9e440011  ! 311: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x953c2001  ! 311: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x9a440011  ! 311: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x9f2c0011  ! 311: SLL_R	sll 	%r16, %r17, %r15
	.word 0xd25c2216  ! 312: LDX_I	ldx	[%r16 + 0x0216], %r9
	.word 0xc69c1011  ! 314: LDDA_R	ldda	[%r16, %r17] 0x80, %r3
	.word 0x828c0011  ! 316: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0xa7342001  ! 316: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0x88b4293b  ! 316: ORNcc_I	orncc 	%r16, 0x093b, %r4
	.word 0x86942d0b  ! 316: ORcc_I	orcc 	%r16, 0x0d0b, %r3
	.word 0x99641811  ! 316: MOVcc_R	<illegal instruction>
	.word 0x9a1c27f1  ! 316: XOR_I	xor 	%r16, 0x07f1, %r13
	.word 0x83643801  ! 316: MOVcc_I	<illegal instruction>
thr0_dc_err_25:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_25), 16, 16),1,DC_DATA,5)
	.word 0xc2cc27f1  ! 318: LDSBA_I	ldsba	[%r16, + 0x07f1] %asi, %r1
thr0_irf_ce_32:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_32), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0x8143e054  ! 320: MEMBAR	membar	#LoadStore | #Lookaside | #Sync 
	.word 0x84ac0011  ! 322: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x92bc0011  ! 322: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0xa6bc2d6b  ! 322: XNORcc_I	xnorcc 	%r16, 0x0d6b, %r19
	.word 0x88040011  ! 322: ADD_R	add 	%r16, %r17, %r4
	.word 0x8b7c2401  ! 322: MOVR_I	move	%r16, 0x7fff9c24, %r5
	.word 0x88b40011  ! 322: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0x877c0411  ! 322: MOVR_R	move	%r16, %r17, %r3
	.word 0xb92c3001  ! 322: SLLX_I	sllx	%r16, 0x0001, %r28
thr0_dc_err_26:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_26), 16, 16),1,DC_DATA,47)
	.word 0xf8c42d6b  ! 324: LDSWA_I	ldswa	[%r16, + 0x0d6b] %asi, %r28
thr0_irf_ce_33:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_33), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xc6042de3  ! 326: LDUW_I	lduw	[%r16 + 0x0de3], %r3
	.word 0xac3c2188  ! 328: XNOR_I	xnor 	%r16, 0x0188, %r22
	.word 0xaa940011  ! 328: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x84440011  ! 328: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x8a4427f5  ! 328: ADDC_I	addc 	%r16, 0x07f5, %r5
	.word 0xba342423  ! 328: ORN_I	orn 	%r16, 0x0423, %r29
	.word 0xb4040011  ! 328: ADD_R	add 	%r16, %r17, %r26
	.word 0x9814223e  ! 328: OR_I	or 	%r16, 0x023e, %r12
	.word 0xd91c2937  ! 329: LDDF_I	ldd	[%r16, 0x0937], %f12
thr0_irf_ce_34:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_34), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xc6d420fe  ! 331: LDSHA_I	ldsha	[%r16, + 0x00fe] %asi, %r3
	.word 0x9f3c0011  ! 333: SRA_R	sra 	%r16, %r17, %r15
	.word 0x91343001  ! 333: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0x973c2001  ! 333: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0xb9641811  ! 333: MOVcc_R	<illegal instruction>
	.word 0x9e9c0011  ! 333: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x913c2001  ! 333: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0xf44c2760  ! 334: LDSB_I	ldsb	[%r16 + 0x0760], %r26
	.word 0xce842e60  ! 336: LDUWA_I	lduwa	[%r16, + 0x0e60] %asi, %r7
	.word 0x9d7c2401  ! 338: MOVR_I	move	%r16, 0x7fff9c24, %r14
	.word 0xad3c1011  ! 338: SRAX_R	srax	%r16, %r17, %r22
	.word 0x90940011  ! 338: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0xad343001  ! 338: SRLX_I	srlx	%r16, 0x0001, %r22
	.word 0x882c2f2f  ! 338: ANDN_I	andn 	%r16, 0x0f2f, %r4
	.word 0x9a2c2ab0  ! 338: ANDN_I	andn 	%r16, 0x0ab0, %r13
thr0_dc_err_27:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_27), 16, 16),1,DC_DATA,46)
	.word 0xda5c2ab0  ! 340: LDX_I	ldx	[%r16 + 0x0ab0], %r13
thr0_irf_ce_35:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_35), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xd5142a4e  ! 342: LDQF_I	-	[%r16, 0x0a4e], %f10
	.word 0x9a3c0011  ! 344: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x893c2001  ! 344: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0xac2c2d9c  ! 344: ANDN_I	andn 	%r16, 0x0d9c, %r22
	.word 0x97341011  ! 344: SRLX_R	srlx	%r16, %r17, %r11
	.word 0x9ebc0011  ! 344: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0x98040011  ! 344: ADD_R	add 	%r16, %r17, %r12
	.word 0xc84c2b89  ! 345: LDSB_I	ldsb	[%r16 + 0x0b89], %r4
thr0_irf_ce_36:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_36), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xc36c0011  ! 347: PREFETCH_R	prefetch	[%r16 + %r17], #one_read
	.word 0x9f7c0411  ! 349: MOVR_R	move	%r16, %r17, %r15
	.word 0x980c0011  ! 349: AND_R	and 	%r16, %r17, %r12
	.word 0xb7643801  ! 349: MOVcc_I	<illegal instruction>
	.word 0x92bc23ba  ! 349: XNORcc_I	xnorcc 	%r16, 0x03ba, %r9
	.word 0x85343001  ! 349: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0xaebc0011  ! 349: XNORcc_R	xnorcc 	%r16, %r17, %r23
	.word 0xdf1c0011  ! 350: LDDF_R	ldd	[%r16, %r17], %f15
!Illinst alu
	.word 0x9a140011  ! 352: OR_R	or 	%r16, %r17, %r13
	.word 0xa6940011  ! 354: ORcc_R	orcc 	%r16, %r17, %r19
	.word 0x897c2401  ! 354: MOVR_I	move	%r16, 0x7fff9c24, %r4
	.word 0x9d340011  ! 354: SRL_R	srl 	%r16, %r17, %r14
	.word 0xb72c3001  ! 354: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0xb83c0011  ! 354: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xda140011  ! 355: LDUH_R	lduh	[%r16 + %r17], %r13
	wr      %r0, 0x1, %asr26
	.word 0x8e9c0011  ! 359: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0xba3c0011  ! 359: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x8f2c1011  ! 359: SLLX_R	sllx	%r16, %r17, %r7
	.word 0x9cbc2bd1  ! 359: XNORcc_I	xnorcc 	%r16, 0x0bd1, %r14
	.word 0x86342f27  ! 359: ORN_I	orn 	%r16, 0x0f27, %r3
	.word 0x8c9c2029  ! 359: XORcc_I	xorcc 	%r16, 0x0029, %r6
	.word 0xc84c0011  ! 360: LDSB_R	ldsb	[%r16 + %r17], %r4
thr0_irf_ce_37:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_37), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xde442f7a  ! 362: LDSW_I	ldsw	[%r16 + 0x0f7a], %r15
	.word 0x88140011  ! 364: OR_R	or 	%r16, %r17, %r4
	.word 0x881c0011  ! 364: XOR_R	xor 	%r16, %r17, %r4
	.word 0xacbc2db7  ! 364: XNORcc_I	xnorcc 	%r16, 0x0db7, %r22
	.word 0xb5340011  ! 364: SRL_R	srl 	%r16, %r17, %r26
	.word 0xb17c0411  ! 364: MOVR_R	move	%r16, %r17, %r24
	.word 0x9a942b7a  ! 364: ORcc_I	orcc 	%r16, 0x0b7a, %r13
	.word 0x897c0411  ! 364: MOVR_R	move	%r16, %r17, %r4
	.word 0x863c2a9c  ! 364: XNOR_I	xnor 	%r16, 0x0a9c, %r3
	.word 0xcf941011  ! 365: LDQFA_R	-	[%r16, %r17], %f7
	.word 0xc5040011  ! 367: LDF_R	ld	[%r16, %r17], %f2
	.word 0x95342001  ! 369: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0xb2040011  ! 369: ADD_R	add 	%r16, %r17, %r25
	.word 0xba040011  ! 369: ADD_R	add 	%r16, %r17, %r29
	.word 0xa73c2001  ! 369: SRA_I	sra 	%r16, 0x0001, %r19
	.word 0xa72c1011  ! 369: SLLX_R	sllx	%r16, %r17, %r19
	.word 0xbb7c2401  ! 369: MOVR_I	move	%r16, 0x7fff9c24, %r29
	.word 0xdd841011  ! 370: LDFA_R	lda	[%r16, %r17], %f14
thr0_irf_ce_38:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_38), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xdf040011  ! 372: LDF_R	ld	[%r16, %r17], %f15
	.word 0x821423e3  ! 374: OR_I	or 	%r16, 0x03e3, %r1
	.word 0x8d3c2001  ! 374: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0x8e1c0011  ! 374: XOR_R	xor 	%r16, %r17, %r7
	.word 0x8c2c2d24  ! 374: ANDN_I	andn 	%r16, 0x0d24, %r6
	.word 0x98b40011  ! 374: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x9a842976  ! 374: ADDcc_I	addcc 	%r16, 0x0976, %r13
	.word 0x881c0011  ! 374: XOR_R	xor 	%r16, %r17, %r4
	.word 0xe6040011  ! 375: LDUW_R	lduw	[%r16 + %r17], %r19
thr0_irf_ce_39:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_39), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xdc44270f  ! 377: LDSW_I	ldsw	[%r16 + 0x070f], %r14
	.word 0xae342213  ! 379: ORN_I	orn 	%r16, 0x0213, %r23
	.word 0xae8c0011  ! 379: ANDcc_R	andcc 	%r16, %r17, %r23
	.word 0x889c2efd  ! 379: XORcc_I	xorcc 	%r16, 0x0efd, %r4
	.word 0x9e1c2d60  ! 379: XOR_I	xor 	%r16, 0x0d60, %r15
	.word 0xb01c23e2  ! 379: XOR_I	xor 	%r16, 0x03e2, %r24
	.word 0x872c3001  ! 380: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x983c266b  ! 380: XNOR_I	xnor 	%r16, 0x066b, %r12
	.word 0x933c0011  ! 380: SRA_R	sra 	%r16, %r17, %r9
	.word 0x9f7c2401  ! 380: MOVR_I	move	%r16, 0x7fff9c24, %r15
	.word 0x862c0011  ! 380: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x98b42e16  ! 380: ORNcc_I	orncc 	%r16, 0x0e16, %r12
	.word 0xad342001  ! 380: SRL_I	srl 	%r16, 0x0001, %r22
	rd      %pc, %r18
	set     0x20, %r17
thr0_dc_err_28:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_28), 16, 16),1,DC_DATA,13)
	.word 0xed841000  ! 381: LDFA_R	lda	[%r16, %r0], %f22
thr0_irf_ce_40:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_40), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	return     %r18 + %r17
	.word 0xad340011  ! 384: SRL_R	srl 	%r16, %r17, %r22
	.word 0x9e8c0011  ! 384: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x940c0011  ! 384: AND_R	and 	%r16, %r17, %r10
	.word 0x9a340011  ! 384: ORN_R	orn 	%r16, %r17, %r13
	.word 0x9ec42fa2  ! 384: ADDCcc_I	addccc 	%r16, 0x0fa2, %r15
	.word 0xb5643801  ! 384: MOVcc_I	<illegal instruction>
	.word 0x84ac0011  ! 384: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0xe8dc1011  ! 385: LDXA_R	ldxa	[%r16, %r17] 0x80, %r20
thr0_irf_ce_41:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_41), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xc42c2f87  ! 389: STB_I	stb	%r2, [%r16 + 0x0f87]
	.word 0x872c2001  ! 391: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x8f342001  ! 391: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x9a1c2f98  ! 391: XOR_I	xor 	%r16, 0x0f98, %r13
	.word 0x9d3c2001  ! 391: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0xac3c0011  ! 391: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x94c42752  ! 391: ADDCcc_I	addccc 	%r16, 0x0752, %r10
	.word 0x8e9c25a0  ! 391: XORcc_I	xorcc 	%r16, 0x05a0, %r7
	.word 0xad343001  ! 391: SRLX_I	srlx	%r16, 0x0001, %r22
thr0_dc_err_29:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_29), 16, 16),1,DC_DATA,28)
	.word 0xecc41000  ! 393: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r22
	.word 0xf65c0011  ! 395: LDX_R	ldx	[%r16 + %r17], %r27
	.word 0x941c2735  ! 397: XOR_I	xor 	%r16, 0x0735, %r10
	.word 0xb4ac0011  ! 397: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0xad2c0011  ! 397: SLL_R	sll 	%r16, %r17, %r22
	.word 0x843c0011  ! 397: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0x92440011  ! 397: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x8b3c1011  ! 397: SRAX_R	srax	%r16, %r17, %r5
	.word 0xab2c3001  ! 397: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x89340011  ! 397: SRL_R	srl 	%r16, %r17, %r4
	.word 0xdf0426da  ! 398: LDF_I	ld	[%r16, 0x06da], %f15
thr0_irf_ce_42:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_42), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xee042d31  ! 400: LDUW_I	lduw	[%r16 + 0x0d31], %r23
	.word 0x961c0011  ! 402: XOR_R	xor 	%r16, %r17, %r11
	.word 0x8f341011  ! 402: SRLX_R	srlx	%r16, %r17, %r7
	.word 0xa97c2401  ! 402: MOVR_I	move	%r16, 0x7fff9c24, %r20
	.word 0x9a940011  ! 402: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0xa97c0411  ! 402: MOVR_R	move	%r16, %r17, %r20
	.word 0x9f7c2401  ! 402: MOVR_I	move	%r16, 0x7fff9c24, %r15
	.word 0x82b40011  ! 402: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x94bc0011  ! 402: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0xfadc1011  ! 403: LDXA_R	ldxa	[%r16, %r17] 0x80, %r29
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0x9b343001  ! 407: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xb12c3001  ! 407: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x97343001  ! 407: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0x963c2092  ! 407: XNOR_I	xnor 	%r16, 0x0092, %r11
	.word 0x9f641811  ! 407: MOVcc_R	<illegal instruction>
	.word 0x91343001  ! 407: SRLX_I	srlx	%r16, 0x0001, %r8
thr0_dc_err_30:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_30), 16, 16),1,DC_DATA,7)
	.word 0xd19c1000  ! 409: LDDFA_R	ldda	[%r16, %r0], %f8
thr0_irf_ce_43:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_43), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xdb2423a6  ! 411: STF_I	st	%f13, [0x03a6, %r16]
	.word 0x84142075  ! 413: OR_I	or 	%r16, 0x0075, %r2
	.word 0xaf341011  ! 413: SRLX_R	srlx	%r16, %r17, %r23
	.word 0x92140011  ! 413: OR_R	or 	%r16, %r17, %r9
	.word 0x8abc26c7  ! 413: XNORcc_I	xnorcc 	%r16, 0x06c7, %r5
	.word 0xaa140011  ! 413: OR_R	or 	%r16, %r17, %r21
	.word 0xcad42107  ! 414: LDSHA_I	ldsha	[%r16, + 0x0107] %asi, %r5
	.word 0xe9040011  ! 416: LDF_R	ld	[%r16, %r17], %f20
	.word 0x8a2c2b8d  ! 418: ANDN_I	andn 	%r16, 0x0b8d, %r5
	.word 0x9e140011  ! 418: OR_R	or 	%r16, %r17, %r15
	.word 0xad342001  ! 418: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0x85341011  ! 418: SRLX_R	srlx	%r16, %r17, %r2
	.word 0xbab40011  ! 418: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x883c0011  ! 418: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x8b3c1011  ! 418: SRAX_R	srax	%r16, %r17, %r5
	.word 0xecd41011  ! 419: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r22
	.word 0xf6540011  ! 421: LDSH_R	ldsh	[%r16 + %r17], %r27
	.word 0xb8140011  ! 423: OR_R	or 	%r16, %r17, %r28
	.word 0x9c040011  ! 423: ADD_R	add 	%r16, %r17, %r14
	.word 0x9aac2833  ! 423: ANDNcc_I	andncc 	%r16, 0x0833, %r13
	.word 0xbb341011  ! 423: SRLX_R	srlx	%r16, %r17, %r29
	.word 0x9cc42384  ! 423: ADDCcc_I	addccc 	%r16, 0x0384, %r14
	.word 0x993c0011  ! 423: SRA_R	sra 	%r16, %r17, %r12
	.word 0xd6140011  ! 424: LDUH_R	lduh	[%r16 + %r17], %r11
	.word 0xc36c2aff  ! 426: PREFETCH_I	prefetch	[%r16 + 0x0aff], #one_read
	.word 0x86b40011  ! 428: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0xaeac0011  ! 428: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0x993c2001  ! 428: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0xa6140011  ! 428: OR_R	or 	%r16, %r17, %r19
	.word 0x992c0011  ! 428: SLL_R	sll 	%r16, %r17, %r12
	.word 0x9abc0011  ! 428: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x9d3c0011  ! 428: SRA_R	sra 	%r16, %r17, %r14
	.word 0x913c0011  ! 428: SRA_R	sra 	%r16, %r17, %r8
	.word 0xd6941011  ! 429: LDUHA_R	lduha	[%r16, %r17] 0x80, %r11
thr0_irf_ce_44:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_44), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xda742764  ! 433: STX_I	stx	%r13, [%r16 + 0x0764]
	.word 0xb6340011  ! 435: ORN_R	orn 	%r16, %r17, %r27
	.word 0xaaac0011  ! 435: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0xad3c2001  ! 435: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0x917c0411  ! 435: MOVR_R	move	%r16, %r17, %r8
	.word 0xab2c1011  ! 435: SLLX_R	sllx	%r16, %r17, %r21
thr0_dc_err_31:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_31), 16, 16),1,DC_DATA,30)
	.word 0xea042764  ! 437: LDUW_I	lduw	[%r16 + 0x0764], %r21
thr0_irf_ce_45:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_45), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xc7140011  ! 439: LDQF_R	-	[%r16, %r17], %f3
	.word 0x90140011  ! 441: OR_R	or 	%r16, %r17, %r8
	.word 0x949c288e  ! 441: XORcc_I	xorcc 	%r16, 0x088e, %r10
	.word 0x92042ca2  ! 441: ADD_I	add 	%r16, 0x0ca2, %r9
	.word 0x868c0011  ! 441: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x9eac0011  ! 441: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xee842599  ! 442: LDUWA_I	lduwa	[%r16, + 0x0599] %asi, %r23
thr0_irf_ce_46:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_46), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xc41c26b5  ! 444: LDD_I	ldd	[%r16 + 0x06b5], %r2
	.word 0xb4c40011  ! 446: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0x86142057  ! 446: OR_I	or 	%r16, 0x0057, %r3
	.word 0x8d3c1011  ! 446: SRAX_R	srax	%r16, %r17, %r6
	.word 0x893c2001  ! 446: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0xb48c2ef3  ! 446: ANDcc_I	andcc 	%r16, 0x0ef3, %r26
	.word 0xfb042676  ! 447: LDF_I	ld	[%r16, 0x0676], %f29
thr0_irf_ce_47:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_47), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xecc41011  ! 449: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r22
	.word 0x9a442077  ! 451: ADDC_I	addc 	%r16, 0x0077, %r13
	.word 0x86bc0011  ! 451: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x98942daf  ! 451: ORcc_I	orcc 	%r16, 0x0daf, %r12
	.word 0xb01c0011  ! 451: XOR_R	xor 	%r16, %r17, %r24
	.word 0x96b40011  ! 451: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0xb2ac28d6  ! 451: ANDNcc_I	andncc 	%r16, 0x08d6, %r25
	.word 0xb42c2128  ! 451: ANDN_I	andn 	%r16, 0x0128, %r26
	.word 0x941c0011  ! 451: XOR_R	xor 	%r16, %r17, %r10
	.word 0xc61c0011  ! 452: LDD_R	ldd	[%r16 + %r17], %r3
	.word 0xd0dc1011  ! 454: LDXA_R	ldxa	[%r16, %r17] 0x80, %r8
	.word 0x8cbc0011  ! 456: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0xa9342001  ! 456: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0xb2042bc6  ! 456: ADD_I	add 	%r16, 0x0bc6, %r25
	.word 0xb49c2019  ! 456: XORcc_I	xorcc 	%r16, 0x0019, %r26
	.word 0x9b342001  ! 456: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0xae8c0011  ! 456: ANDcc_R	andcc 	%r16, %r17, %r23
	.word 0x9cbc27bc  ! 456: XNORcc_I	xnorcc 	%r16, 0x07bc, %r14
	.word 0xac3c2f99  ! 456: XNOR_I	xnor 	%r16, 0x0f99, %r22
	.word 0xc9040011  ! 457: LDF_R	ld	[%r16, %r17], %f4
	.word 0xd2fc1011  ! 459: SWAPA_R	swapa	%r9, [%r16 + %r17] 0x80
	.word 0x842c25b9  ! 461: ANDN_I	andn 	%r16, 0x05b9, %r2
	.word 0x90140011  ! 461: OR_R	or 	%r16, %r17, %r8
	.word 0xb6140011  ! 461: OR_R	or 	%r16, %r17, %r27
	.word 0x852c3001  ! 461: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0xb6bc0011  ! 461: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0xb0b40011  ! 461: ORNcc_R	orncc 	%r16, %r17, %r24
thr0_dc_err_32:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_32), 16, 16),1,DC_DATA,33)
	.word 0xf0cc1000  ! 463: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r24
!Illinst alu
	.word 0x92ac25c3  ! 465: ANDNcc_I	andncc 	%r16, 0x05c3, %r9
	.word 0x8c9c2957  ! 467: XORcc_I	xorcc 	%r16, 0x0957, %r6
	.word 0xa92c1011  ! 467: SLLX_R	sllx	%r16, %r17, %r20
	.word 0x853c1011  ! 467: SRAX_R	srax	%r16, %r17, %r2
	.word 0xac2c272f  ! 467: ANDN_I	andn 	%r16, 0x072f, %r22
	.word 0x920c2db9  ! 467: AND_I	and 	%r16, 0x0db9, %r9
	.word 0x952c1011  ! 467: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x9c1c284f  ! 467: XOR_I	xor 	%r16, 0x084f, %r14
	.word 0xf3941011  ! 468: LDQFA_R	-	[%r16, %r17], %f25
thr0_irf_ce_48:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_48), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xc2941011  ! 470: LDUHA_R	lduha	[%r16, %r17] 0x80, %r1
	.word 0xb92c2001  ! 472: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0x942c2382  ! 472: ANDN_I	andn 	%r16, 0x0382, %r10
	.word 0x82ac0011  ! 472: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0xbaac2694  ! 472: ANDNcc_I	andncc 	%r16, 0x0694, %r29
	.word 0xb404243e  ! 472: ADD_I	add 	%r16, 0x043e, %r26
	.word 0x8eb4223a  ! 472: ORNcc_I	orncc 	%r16, 0x023a, %r7
	.word 0x8c340011  ! 472: ORN_R	orn 	%r16, %r17, %r6
thr0_dc_err_33:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_33), 16, 16),1,DC_DATA,19)
	.word 0xcccc1000  ! 474: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r6
thr0_irf_ce_49:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_49), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xd4242927  ! 478: STW_I	stw	%r10, [%r16 + 0x0927]
	.word 0x989c2986  ! 480: XORcc_I	xorcc 	%r16, 0x0986, %r12
	.word 0x94140011  ! 480: OR_R	or 	%r16, %r17, %r10
	.word 0xb49c2643  ! 480: XORcc_I	xorcc 	%r16, 0x0643, %r26
	.word 0x903c0011  ! 480: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0xb2442b38  ! 480: ADDC_I	addc 	%r16, 0x0b38, %r25
	.word 0x8a1c0011  ! 480: XOR_R	xor 	%r16, %r17, %r5
	.word 0xa8ac0011  ! 480: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0xd0c41011  ! 481: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r8
	.word 0xcf9c1011  ! 483: LDDFA_R	ldda	[%r16, %r17], %f7
	.word 0x86ac2428  ! 485: ANDNcc_I	andncc 	%r16, 0x0428, %r3
	.word 0x8e042f2c  ! 485: ADD_I	add 	%r16, 0x0f2c, %r7
	.word 0x9a44200f  ! 485: ADDC_I	addc 	%r16, 0x000f, %r13
	.word 0x848c2be9  ! 485: ANDcc_I	andcc 	%r16, 0x0be9, %r2
	.word 0x852c2001  ! 485: SLL_I	sll 	%r16, 0x0001, %r2
thr0_dc_err_34:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_34), 16, 16),1,DC_DATA,20)
	.word 0xc5142be9  ! 487: LDQF_I	-	[%r16, 0x0be9], %f2
	.word 0xc4ec1011  ! 489: LDSTUBA_R	ldstuba	%r2, [%r16 + %r17] 0x80
	.word 0xad2c1011  ! 491: SLLX_R	sllx	%r16, %r17, %r22
	.word 0x940c20bf  ! 491: AND_I	and 	%r16, 0x00bf, %r10
	.word 0xac2c0011  ! 491: ANDN_R	andn 	%r16, %r17, %r22
	.word 0x977c0411  ! 491: MOVR_R	move	%r16, %r17, %r11
	.word 0x9c342cae  ! 491: ORN_I	orn 	%r16, 0x0cae, %r14
	.word 0x94840011  ! 491: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0xb17c0411  ! 491: MOVR_R	move	%r16, %r17, %r24
	.word 0x9b2c1011  ! 491: SLLX_R	sllx	%r16, %r17, %r13
	.word 0xc60c0011  ! 492: LDUB_R	ldub	[%r16 + %r17], %r3
	.word 0xfb9c1011  ! 494: LDDFA_R	ldda	[%r16, %r17], %f29
	.word 0x9e8c25f2  ! 496: ANDcc_I	andcc 	%r16, 0x05f2, %r15
	.word 0x829c0011  ! 496: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0xb48c236b  ! 496: ANDcc_I	andcc 	%r16, 0x036b, %r26
	.word 0x988c2084  ! 496: ANDcc_I	andcc 	%r16, 0x0084, %r12
	.word 0x937c0411  ! 496: MOVR_R	move	%r16, %r17, %r9
	.word 0x9b2c2001  ! 496: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0xe91c2f0d  ! 497: LDDF_I	ldd	[%r16, 0x0f0d], %f20
	.word 0xc9841011  ! 499: LDFA_R	lda	[%r16, %r17], %f4
	.word 0x84c42a88  ! 501: ADDCcc_I	addccc 	%r16, 0x0a88, %r2
	.word 0xb32c2001  ! 501: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0xaab425f2  ! 501: ORNcc_I	orncc 	%r16, 0x05f2, %r21
	.word 0xaf3c1011  ! 501: SRAX_R	srax	%r16, %r17, %r23
	.word 0x89341011  ! 501: SRLX_R	srlx	%r16, %r17, %r4
	.word 0xb40c0011  ! 501: AND_R	and 	%r16, %r17, %r26
	.word 0x923c0011  ! 501: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x85341011  ! 501: SRLX_R	srlx	%r16, %r17, %r2
	.word 0xca0c210a  ! 502: LDUB_I	ldub	[%r16 + 0x010a], %r5
        wr %g0, 0x4, %fprs
	.word 0x8e1c2c6c  ! 506: XOR_I	xor 	%r16, 0x0c6c, %r7
	.word 0x9a940011  ! 506: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x9b343001  ! 506: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0x8e0424cd  ! 506: ADD_I	add 	%r16, 0x04cd, %r7
	.word 0xb0940011  ! 506: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0xb77c2401  ! 506: MOVR_I	move	%r16, 0x7fff9c24, %r27
	.word 0x837c0411  ! 506: MOVR_R	move	%r16, %r17, %r1
	.word 0x99643801  ! 506: MOVcc_I	<illegal instruction>
	.word 0xd01c213e  ! 507: LDD_I	ldd	[%r16 + 0x013e], %r8
	.word 0xdd1c239d  ! 509: LDDF_I	ldd	[%r16, 0x039d], %f14
	.word 0x96ac0011  ! 511: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x9eb42744  ! 511: ORNcc_I	orncc 	%r16, 0x0744, %r15
	.word 0x8204269c  ! 511: ADD_I	add 	%r16, 0x069c, %r1
	.word 0x962c2c6c  ! 511: ANDN_I	andn 	%r16, 0x0c6c, %r11
	.word 0x8c1c2c51  ! 511: XOR_I	xor 	%r16, 0x0c51, %r6
	.word 0xba842c51  ! 511: ADDcc_I	addcc 	%r16, 0x0c51, %r29
	.word 0x9eac23d6  ! 511: ANDNcc_I	andncc 	%r16, 0x03d6, %r15
thr0_dc_err_35:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_35), 16, 16),1,DC_DATA,28)
	.word 0xdf841000  ! 513: LDFA_R	lda	[%r16, %r0], %f15
        wr %g0, 0x4, %fprs
	.word 0x932c2001  ! 517: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x9e3c0011  ! 517: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0x97343001  ! 517: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0xa69c2eb1  ! 517: XORcc_I	xorcc 	%r16, 0x0eb1, %r19
	.word 0xb32c0011  ! 517: SLL_R	sll 	%r16, %r17, %r25
	.word 0x9cb424d4  ! 517: ORNcc_I	orncc 	%r16, 0x04d4, %r14
	.word 0x88442c60  ! 517: ADDC_I	addc 	%r16, 0x0c60, %r4
	.word 0xf65c0011  ! 518: LDX_R	ldx	[%r16 + %r17], %r27
thr0_irf_ce_50:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_50), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xc4d41011  ! 520: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r2
	.word 0xad2c3001  ! 522: SLLX_I	sllx	%r16, 0x0001, %r22
	.word 0x94bc0011  ! 522: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x89641811  ! 522: MOVcc_R	<illegal instruction>
	.word 0x83341011  ! 522: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x903c0011  ! 522: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0xeb140011  ! 523: LDQF_R	-	[%r16, %r17], %f21
!Illinst store
	.word 0xd0240011  ! 525: STW_R	stw	%r8, [%r16 + %r17]
	.word 0xa97c2401  ! 527: MOVR_I	move	%r16, 0x7fff9c24, %r20
	.word 0x82442f60  ! 527: ADDC_I	addc 	%r16, 0x0f60, %r1
	.word 0x8d2c2001  ! 527: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0x957c0411  ! 527: MOVR_R	move	%r16, %r17, %r10
	.word 0x872c3001  ! 527: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0xb40c0011  ! 527: AND_R	and 	%r16, %r17, %r26
	.word 0x91343001  ! 527: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0x941c24ac  ! 527: XOR_I	xor 	%r16, 0x04ac, %r10
thr0_dc_err_36:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_36), 16, 16),1,DC_DATA,52)
	.word 0xd59c1000  ! 529: LDDFA_R	ldda	[%r16, %r0], %f10
thr0_irf_ce_51:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_51), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xc24c2097  ! 531: LDSB_I	ldsb	[%r16 + 0x0097], %r1
	.word 0xa6b40011  ! 533: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0x9c442a2b  ! 533: ADDC_I	addc 	%r16, 0x0a2b, %r14
	.word 0x9e1c204e  ! 533: XOR_I	xor 	%r16, 0x004e, %r15
	.word 0xa93c0011  ! 533: SRA_R	sra 	%r16, %r17, %r20
	.word 0xb8b42e66  ! 533: ORNcc_I	orncc 	%r16, 0x0e66, %r28
	.word 0x98140011  ! 533: OR_R	or 	%r16, %r17, %r12
	.word 0xb4ac0011  ! 533: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0xf2dc202b  ! 534: LDXA_I	ldxa	[%r16, + 0x002b] %asi, %r25
	.word 0xc8042cc9  ! 536: LDUW_I	lduw	[%r16 + 0x0cc9], %r4
	.word 0xad643801  ! 538: MOVcc_I	<illegal instruction>
	.word 0xb2b40011  ! 538: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0xb49c0011  ! 538: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0x993c0011  ! 538: SRA_R	sra 	%r16, %r17, %r12
	.word 0x98c42aeb  ! 538: ADDCcc_I	addccc 	%r16, 0x0aeb, %r12
thr0_dc_err_37:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_37), 16, 16),1,DC_DATA,46)
	.word 0xd89c1000  ! 540: LDDA_R	ldda	[%r16, %r0] 0x80, %r12
thr0_irf_ce_52:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_52), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xce7427a1  ! 544: STX_I	stx	%r7, [%r16 + 0x07a1]
	.word 0x8a340011  ! 546: ORN_R	orn 	%r16, %r17, %r5
	.word 0x84840011  ! 546: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x94b42dec  ! 546: ORNcc_I	orncc 	%r16, 0x0dec, %r10
	.word 0xaa8c2037  ! 546: ANDcc_I	andcc 	%r16, 0x0037, %r21
	.word 0x8f3c0011  ! 546: SRA_R	sra 	%r16, %r17, %r7
	.word 0xc5040011  ! 547: LDF_R	ld	[%r16, %r17], %f2
	.word 0xa7a00151  ! 549: FABSd	fabsd	%f48, %f50
	.word 0x90b42693  ! 551: ORNcc_I	orncc 	%r16, 0x0693, %r8
	.word 0xba3c0011  ! 551: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0xb2142cd6  ! 551: OR_I	or 	%r16, 0x0cd6, %r25
	.word 0x86c40011  ! 551: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x9e2c0011  ! 551: ANDN_R	andn 	%r16, %r17, %r15
	.word 0xf4442844  ! 552: LDSW_I	ldsw	[%r16 + 0x0844], %r26
	.word 0xf47428cf  ! 556: STX_I	stx	%r26, [%r16 + 0x08cf]
	.word 0x8d2c0011  ! 558: SLL_R	sll 	%r16, %r17, %r6
	.word 0xa8c40011  ! 558: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x9e3427de  ! 558: ORN_I	orn 	%r16, 0x07de, %r15
	.word 0xa7341011  ! 558: SRLX_R	srlx	%r16, %r17, %r19
	.word 0xacbc26d3  ! 558: XNORcc_I	xnorcc 	%r16, 0x06d3, %r22
	.word 0x908c262c  ! 558: ANDcc_I	andcc 	%r16, 0x062c, %r8
thr0_dc_err_38:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_38), 16, 16),1,DC_DATA,5)
	.word 0xd1140000  ! 560: LDQF_R	-	[%r16, %r0], %f8
	.word 0x9c5c0011  ! 562: SMUL_R	smul 	%r16, %r17, %r14
	.word 0x9f7c2401  ! 564: MOVR_I	move	%r16, 0x7fff9c24, %r15
	.word 0xac942670  ! 564: ORcc_I	orcc 	%r16, 0x0670, %r22
	.word 0x8a942820  ! 564: ORcc_I	orcc 	%r16, 0x0820, %r5
	.word 0xb32c0011  ! 564: SLL_R	sll 	%r16, %r17, %r25
	.word 0x9e2c0011  ! 564: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x821c28c8  ! 564: XOR_I	xor 	%r16, 0x08c8, %r1
	.word 0x9c9c23cc  ! 564: XORcc_I	xorcc 	%r16, 0x03cc, %r14
	.word 0x88c42815  ! 564: ADDCcc_I	addccc 	%r16, 0x0815, %r4
thr0_dc_err_39:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_39), 16, 16),1,DC_DATA,8)
	.word 0xc99c1000  ! 566: LDDFA_R	ldda	[%r16, %r0], %f4
thr0_irf_ce_53:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_53), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xc8cc1011  ! 568: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r4
	.word 0x9c1c0011  ! 570: XOR_R	xor 	%r16, %r17, %r14
	.word 0x921c0011  ! 570: XOR_R	xor 	%r16, %r17, %r9
	.word 0x848c0011  ! 570: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x9494256c  ! 570: ORcc_I	orcc 	%r16, 0x056c, %r10
	.word 0x8a940011  ! 570: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x8cbc0011  ! 570: XNORcc_R	xnorcc 	%r16, %r17, %r6
thr0_dc_err_40:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_40), 16, 16),1,DC_DATA,1)
	.word 0xcc4c0000  ! 572: LDSB_R	ldsb	[%r16 + %r0], %r6
	.word 0x8143e037  ! 574: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue 
	.word 0xad7c2401  ! 576: MOVR_I	move	%r16, 0x7fff9c24, %r22
	.word 0xb0140011  ! 576: OR_R	or 	%r16, %r17, %r24
	.word 0x9444236e  ! 576: ADDC_I	addc 	%r16, 0x036e, %r10
	.word 0xa88c203b  ! 576: ANDcc_I	andcc 	%r16, 0x003b, %r20
	.word 0x90340011  ! 576: ORN_R	orn 	%r16, %r17, %r8
	.word 0xd8540011  ! 577: LDSH_R	ldsh	[%r16 + %r17], %r12
thr0_irf_ce_54:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_54), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xdb841011  ! 579: LDFA_R	lda	[%r16, %r17], %f13
	.word 0xb81c28a5  ! 581: XOR_I	xor 	%r16, 0x08a5, %r28
	.word 0x880c2feb  ! 581: AND_I	and 	%r16, 0x0feb, %r4
	.word 0x89341011  ! 581: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x9d2c0011  ! 581: SLL_R	sll 	%r16, %r17, %r14
	.word 0x9c2c2d81  ! 581: ANDN_I	andn 	%r16, 0x0d81, %r14
	.word 0xd69c244e  ! 582: LDDA_I	ldda	[%r16, + 0x044e] %asi, %r11
thr0_irf_ce_55:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_55), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xd7040011  ! 584: LDF_R	ld	[%r16, %r17], %f11
	.word 0xb09c0011  ! 586: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x992c0011  ! 586: SLL_R	sll 	%r16, %r17, %r12
	.word 0xaa8c0011  ! 586: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0xae3c2053  ! 586: XNOR_I	xnor 	%r16, 0x0053, %r23
	.word 0xb92c3001  ! 586: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0x84840011  ! 586: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x8b3c1011  ! 586: SRAX_R	srax	%r16, %r17, %r5
thr0_dc_err_41:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_41), 16, 16),1,DC_DATA,1)
	.word 0xcac42053  ! 588: LDSWA_I	ldswa	[%r16, + 0x0053] %asi, %r5
thr0_irf_ce_56:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_56), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0x92dc2f01  ! 590: SMULcc_I	smulcc 	%r16, 0x0f01, %r9
	.word 0x9a040011  ! 592: ADD_R	add 	%r16, %r17, %r13
	.word 0x8b341011  ! 592: SRLX_R	srlx	%r16, %r17, %r5
	.word 0x9c1c0011  ! 592: XOR_R	xor 	%r16, %r17, %r14
	.word 0xba0c2eca  ! 592: AND_I	and 	%r16, 0x0eca, %r29
	.word 0x92040011  ! 592: ADD_R	add 	%r16, %r17, %r9
thr0_dc_err_42:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_42), 16, 16),1,DC_DATA,50)
	.word 0xd3140000  ! 594: LDQF_R	-	[%r16, %r0], %f9
thr0_irf_ce_57:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_57), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xca4c2645  ! 596: LDSB_I	ldsb	[%r16 + 0x0645], %r5
	.word 0x903c0011  ! 598: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x852c1011  ! 598: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x86140011  ! 598: OR_R	or 	%r16, %r17, %r3
	.word 0xad643801  ! 598: MOVcc_I	<illegal instruction>
	.word 0x9e44214e  ! 598: ADDC_I	addc 	%r16, 0x014e, %r15
	.word 0x9d3c1011  ! 598: SRAX_R	srax	%r16, %r17, %r14
	.word 0x9d2c0011  ! 598: SLL_R	sll 	%r16, %r17, %r14
	.word 0xaeac0011  ! 598: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0xce9c1011  ! 599: LDDA_R	ldda	[%r16, %r17] 0x80, %r7
	.word 0xc60c0011  ! 601: LDUB_R	ldub	[%r16 + %r17], %r3
	.word 0xaf341011  ! 603: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xb5341011  ! 603: SRLX_R	srlx	%r16, %r17, %r26
	.word 0xac2c0011  ! 603: ANDN_R	andn 	%r16, %r17, %r22
	.word 0x83341011  ! 603: SRLX_R	srlx	%r16, %r17, %r1
	.word 0xb9342001  ! 603: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0x8e440011  ! 603: ADDC_R	addc 	%r16, %r17, %r7
	.word 0x92ac0011  ! 603: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x8e9c0011  ! 603: XORcc_R	xorcc 	%r16, %r17, %r7
thr0_dc_err_43:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_43), 16, 16),1,DC_DATA,18)
	.word 0xce5c0000  ! 605: LDX_R	ldx	[%r16 + %r0], %r7
thr0_irf_ce_58:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_58), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xdb841011  ! 607: LDFA_R	lda	[%r16, %r17], %f13
	.word 0x9f2c1011  ! 609: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x9c040011  ! 609: ADD_R	add 	%r16, %r17, %r14
	.word 0x8eb4200c  ! 609: ORNcc_I	orncc 	%r16, 0x000c, %r7
	.word 0x917c0411  ! 609: MOVR_R	move	%r16, %r17, %r8
	.word 0x9f641811  ! 609: MOVcc_R	<illegal instruction>
	.word 0x920424f0  ! 609: ADD_I	add 	%r16, 0x04f0, %r9
	.word 0xb6842e24  ! 609: ADDcc_I	addcc 	%r16, 0x0e24, %r27
	.word 0xaa142bfa  ! 609: OR_I	or 	%r16, 0x0bfa, %r21
thr0_dc_err_44:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_44), 16, 16),1,DC_DATA,22)
	.word 0xea442bfa  ! 611: LDSW_I	ldsw	[%r16 + 0x0bfa], %r21
thr0_irf_ce_59:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_59), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d340011  ! 615: SRL_R	srl 	%r16, %r17, %r6
	.word 0xb53c0011  ! 615: SRA_R	sra 	%r16, %r17, %r26
	.word 0x9e940011  ! 615: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x85341011  ! 615: SRLX_R	srlx	%r16, %r17, %r2
	.word 0xba9429f5  ! 615: ORcc_I	orcc 	%r16, 0x09f5, %r29
	.word 0x9aac0011  ! 615: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0xb8bc0011  ! 615: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0xda942c4f  ! 616: LDUHA_I	lduha	[%r16, + 0x0c4f] %asi, %r13
thr0_irf_ce_60:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_60), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xf5140011  ! 618: LDQF_R	-	[%r16, %r17], %f26
	.word 0x93343001  ! 620: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x86042029  ! 620: ADD_I	add 	%r16, 0x0029, %r3
	.word 0x963c0011  ! 620: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x908c0011  ! 620: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x92440011  ! 620: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x9f643801  ! 620: MOVcc_I	<illegal instruction>
thr0_dc_err_45:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_45), 16, 16),1,DC_DATA,35)
	.word 0xde5c0000  ! 622: LDX_R	ldx	[%r16 + %r0], %r15
thr0_irf_ce_61:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_61), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xca5c2fd4  ! 624: LDX_I	ldx	[%r16 + 0x0fd4], %r5
	.word 0x9e0c0011  ! 626: AND_R	and 	%r16, %r17, %r15
	.word 0x9c440011  ! 626: ADDC_R	addc 	%r16, %r17, %r14
	.word 0xa83425d8  ! 626: ORN_I	orn 	%r16, 0x05d8, %r20
	.word 0x90c40011  ! 626: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0xaa9c2a2f  ! 626: XORcc_I	xorcc 	%r16, 0x0a2f, %r21
	.word 0xb20427c8  ! 626: ADD_I	add 	%r16, 0x07c8, %r25
	.word 0x9cc40011  ! 626: ADDCcc_R	addccc 	%r16, %r17, %r14
thr0_dc_err_46:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_46), 16, 16),1,DC_DATA,9)
	.word 0xdc941000  ! 628: LDUHA_R	lduha	[%r16, %r0] 0x80, %r14
thr0_irf_ce_62:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_62), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xc3ec1011  ! 630: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x92340011  ! 632: ORN_R	orn 	%r16, %r17, %r9
	.word 0xb8b40011  ! 632: ORNcc_R	orncc 	%r16, %r17, %r28
	.word 0xaa940011  ! 632: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x96140011  ! 632: OR_R	or 	%r16, %r17, %r11
	.word 0x862c2ec2  ! 632: ANDN_I	andn 	%r16, 0x0ec2, %r3
	.word 0xc7142b83  ! 633: LDQF_I	-	[%r16, 0x0b83], %f3
thr0_irf_ce_63:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_63), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xe68423b1  ! 635: LDUWA_I	lduwa	[%r16, + 0x03b1] %asi, %r19
	.word 0x9d2c2001  ! 637: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x852c3001  ! 637: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0x92842476  ! 637: ADDcc_I	addcc 	%r16, 0x0476, %r9
	.word 0xba840011  ! 637: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0xa60c22f4  ! 637: AND_I	and 	%r16, 0x02f4, %r19
	.word 0x872c2001  ! 637: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0xd4042482  ! 638: LDUW_I	lduw	[%r16 + 0x0482], %r10
thr0_irf_ce_64:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_64), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xc91c2e54  ! 640: LDDF_I	ldd	[%r16, 0x0e54], %f4
	.word 0x9a9c0011  ! 642: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0xb6b42543  ! 642: ORNcc_I	orncc 	%r16, 0x0543, %r27
	.word 0x923c28e0  ! 642: XNOR_I	xnor 	%r16, 0x08e0, %r9
	.word 0x8f3c1011  ! 642: SRAX_R	srax	%r16, %r17, %r7
	.word 0x8c1c0011  ! 642: XOR_R	xor 	%r16, %r17, %r6
	.word 0xe89c1011  ! 643: LDDA_R	ldda	[%r16, %r17] 0x80, %r20
        wr %g0, 0x4, %fprs
	.word 0xa92c2001  ! 647: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0x94440011  ! 647: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x9a14291c  ! 647: OR_I	or 	%r16, 0x091c, %r13
	.word 0xba040011  ! 647: ADD_R	add 	%r16, %r17, %r29
	.word 0x96b40011  ! 647: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0xf90424d8  ! 648: LDF_I	ld	[%r16, 0x04d8], %f28
thr0_irf_ce_65:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_65), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
        wr %g0, 0x4, %fprs
	.word 0x868421ca  ! 652: ADDcc_I	addcc 	%r16, 0x01ca, %r3
	.word 0xb40c0011  ! 652: AND_R	and 	%r16, %r17, %r26
	.word 0x85342001  ! 652: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x8a9c20ba  ! 652: XORcc_I	xorcc 	%r16, 0x00ba, %r5
	.word 0x9d3c2001  ! 652: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0xd514261c  ! 653: LDQF_I	-	[%r16, 0x061c], %f10
	.word 0xf3841011  ! 655: LDFA_R	lda	[%r16, %r17], %f25
	.word 0x963c2e25  ! 657: XNOR_I	xnor 	%r16, 0x0e25, %r11
	.word 0x82ac0011  ! 657: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x8f643801  ! 657: MOVcc_I	<illegal instruction>
	.word 0xb83426f6  ! 657: ORN_I	orn 	%r16, 0x06f6, %r28
	.word 0x93341011  ! 657: SRLX_R	srlx	%r16, %r17, %r9
	.word 0xf0542067  ! 658: LDSH_I	ldsh	[%r16 + 0x0067], %r24
	.word 0xc99c1011  ! 660: LDDFA_R	ldda	[%r16, %r17], %f4
	.word 0x8f7c2401  ! 662: MOVR_I	move	%r16, 0x7fff9c24, %r7
	.word 0x9cac0011  ! 662: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0xaf643801  ! 662: MOVcc_I	<illegal instruction>
	.word 0x962c0011  ! 662: ANDN_R	andn 	%r16, %r17, %r11
	.word 0x9d2c3001  ! 662: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0x863428fd  ! 662: ORN_I	orn 	%r16, 0x08fd, %r3
thr0_dc_err_47:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_47), 16, 16),1,DC_DATA,53)
	.word 0xc60c0000  ! 664: LDUB_R	ldub	[%r16 + %r0], %r3
thr0_irf_ce_66:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_66), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xfb142743  ! 666: LDQF_I	-	[%r16, 0x0743], %f29
	.word 0xa82c0011  ! 668: ANDN_R	andn 	%r16, %r17, %r20
	.word 0x9a142fb3  ! 668: OR_I	or 	%r16, 0x0fb3, %r13
	.word 0x9b3c2001  ! 668: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x9f342001  ! 668: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x923428fa  ! 668: ORN_I	orn 	%r16, 0x08fa, %r9
	.word 0x8b2c0011  ! 668: SLL_R	sll 	%r16, %r17, %r5
	.word 0xb0140011  ! 668: OR_R	or 	%r16, %r17, %r24
	.word 0xa8940011  ! 668: ORcc_R	orcc 	%r16, %r17, %r20
thr0_dc_err_48:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_48), 16, 16),1,DC_DATA,48)
	.word 0xe8540000  ! 670: LDSH_R	ldsh	[%r16 + %r0], %r20
	.word 0xce9c1011  ! 672: LDDA_R	ldda	[%r16, %r17] 0x80, %r7
	.word 0xb2c42991  ! 674: ADDCcc_I	addccc 	%r16, 0x0991, %r25
	.word 0x960c0011  ! 674: AND_R	and 	%r16, %r17, %r11
	.word 0x822c2e64  ! 674: ANDN_I	andn 	%r16, 0x0e64, %r1
	.word 0xb8440011  ! 674: ADDC_R	addc 	%r16, %r17, %r28
	.word 0xb17c2401  ! 674: MOVR_I	move	%r16, 0x7fff9c24, %r24
thr0_dc_err_49:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_49), 16, 16),1,DC_DATA,32)
	.word 0xf0140000  ! 676: LDUH_R	lduh	[%r16 + %r0], %r24
thr0_irf_ce_67:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_67), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xc65c0011  ! 678: LDX_R	ldx	[%r16 + %r17], %r3
	.word 0xb13c0011  ! 680: SRA_R	sra 	%r16, %r17, %r24
	.word 0x97643801  ! 680: MOVcc_I	<illegal instruction>
	.word 0x949c0011  ! 680: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0x83343001  ! 680: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x9a342779  ! 680: ORN_I	orn 	%r16, 0x0779, %r13
thr0_dc_err_50:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_50), 16, 16),1,DC_DATA,35)
	.word 0xdb140000  ! 682: LDQF_R	-	[%r16, %r0], %f13
	.word 0xcf841011  ! 684: LDFA_R	lda	[%r16, %r17], %f7
	.word 0x96b40011  ! 686: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0x902c2356  ! 686: ANDN_I	andn 	%r16, 0x0356, %r8
	.word 0xb53c2001  ! 686: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0x87343001  ! 686: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x892c3001  ! 686: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0xa93c1011  ! 686: SRAX_R	srax	%r16, %r17, %r20
	.word 0x9d340011  ! 686: SRL_R	srl 	%r16, %r17, %r14
	.word 0x9d7c0411  ! 686: MOVR_R	move	%r16, %r17, %r14
	.word 0xdcdc23e4  ! 687: LDXA_I	ldxa	[%r16, + 0x03e4] %asi, %r14
thr0_irf_ce_68:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_68), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xc3ec29f1  ! 689: PREFETCHA_I	prefetcha	[%r16, + 0x09f1] %asi, #one_read
	.word 0xab3c2001  ! 691: SRA_I	sra 	%r16, 0x0001, %r21
	.word 0x923c2778  ! 691: XNOR_I	xnor 	%r16, 0x0778, %r9
	.word 0x96140011  ! 691: OR_R	or 	%r16, %r17, %r11
	.word 0xba842b97  ! 691: ADDcc_I	addcc 	%r16, 0x0b97, %r29
	.word 0xbb643801  ! 691: MOVcc_I	<illegal instruction>
	.word 0x993c0011  ! 691: SRA_R	sra 	%r16, %r17, %r12
	.word 0xe6c42f98  ! 692: LDSWA_I	ldswa	[%r16, + 0x0f98] %asi, %r19
	.word 0xd2942848  ! 694: LDUHA_I	lduha	[%r16, + 0x0848] %asi, %r9
	.word 0x8a140011  ! 696: OR_R	or 	%r16, %r17, %r5
	.word 0x9c0c260e  ! 696: AND_I	and 	%r16, 0x060e, %r14
	.word 0xb3342001  ! 696: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x8c2c2d94  ! 696: ANDN_I	andn 	%r16, 0x0d94, %r6
	.word 0xb2340011  ! 696: ORN_R	orn 	%r16, %r17, %r25
	.word 0x92842139  ! 696: ADDcc_I	addcc 	%r16, 0x0139, %r9
	.word 0xb12c1011  ! 696: SLLX_R	sllx	%r16, %r17, %r24
	.word 0x96442bc6  ! 696: ADDC_I	addc 	%r16, 0x0bc6, %r11
thr0_dc_err_51:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_51), 16, 16),1,DC_DATA,40)
	.word 0xd65c0000  ! 698: LDX_R	ldx	[%r16 + %r0], %r11
	.word 0xc51c2317  ! 700: LDDF_I	ldd	[%r16, 0x0317], %f2
	.word 0x99342001  ! 702: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x8d341011  ! 702: SRLX_R	srlx	%r16, %r17, %r6
	.word 0x962c2b86  ! 702: ANDN_I	andn 	%r16, 0x0b86, %r11
	.word 0x8c2c2509  ! 702: ANDN_I	andn 	%r16, 0x0509, %r6
	.word 0x873c0011  ! 702: SRA_R	sra 	%r16, %r17, %r3
	.word 0x88b4238d  ! 702: ORNcc_I	orncc 	%r16, 0x038d, %r4
	.word 0x903c0011  ! 702: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x85343001  ! 702: SRLX_I	srlx	%r16, 0x0001, %r2
thr0_dc_err_52:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_52), 16, 16),1,DC_DATA,65)
	.word 0xc4cc238d  ! 704: LDSBA_I	ldsba	[%r16, + 0x038d] %asi, %r2
	.word 0xd9142110  ! 706: LDQF_I	-	[%r16, 0x0110], %f12
	.word 0x953c2001  ! 708: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x973c1011  ! 708: SRAX_R	srax	%r16, %r17, %r11
	.word 0x88142bdb  ! 708: OR_I	or 	%r16, 0x0bdb, %r4
	.word 0xae3c0011  ! 708: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x9c442714  ! 708: ADDC_I	addc 	%r16, 0x0714, %r14
	.word 0x98040011  ! 708: ADD_R	add 	%r16, %r17, %r12
thr0_dc_err_53:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_53), 16, 16),1,DC_DATA,39)
	.word 0xd80c2714  ! 710: LDUB_I	ldub	[%r16 + 0x0714], %r12
thr0_irf_ce_69:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_69), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xd25c0011  ! 712: LDX_R	ldx	[%r16 + %r17], %r9
	.word 0x892c1011  ! 714: SLLX_R	sllx	%r16, %r17, %r4
	.word 0x98140011  ! 714: OR_R	or 	%r16, %r17, %r12
	.word 0xab343001  ! 714: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0x8b3c2001  ! 714: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x903c0011  ! 714: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x9e440011  ! 714: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x9f7c2401  ! 714: MOVR_I	move	%r16, 0x7fff9c24, %r15
	.word 0x969c218e  ! 714: XORcc_I	xorcc 	%r16, 0x018e, %r11
thr0_dc_err_54:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_54), 16, 16),1,DC_DATA,23)
	.word 0xd79c1000  ! 716: LDDFA_R	ldda	[%r16, %r0], %f11
thr0_irf_ce_70:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_70), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xee2c2590  ! 720: STB_I	stb	%r23, [%r16 + 0x0590]
	.word 0x9894289b  ! 722: ORcc_I	orcc 	%r16, 0x089b, %r12
	.word 0xab2c0011  ! 722: SLL_R	sll 	%r16, %r17, %r21
	.word 0xa6bc2960  ! 722: XNORcc_I	xnorcc 	%r16, 0x0960, %r19
	.word 0x8f2c2001  ! 722: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x968427a5  ! 722: ADDcc_I	addcc 	%r16, 0x07a5, %r11
thr0_dc_err_55:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_55), 16, 16),1,DC_DATA,62)
	.word 0xd6c427a5  ! 724: LDSWA_I	ldswa	[%r16, + 0x07a5] %asi, %r11
thr0_irf_ce_71:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_71), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xdf140011  ! 726: LDQF_R	-	[%r16, %r17], %f15
	.word 0x98ac0011  ! 728: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x8b340011  ! 728: SRL_R	srl 	%r16, %r17, %r5
	.word 0xb17c0411  ! 728: MOVR_R	move	%r16, %r17, %r24
	.word 0xa69c2b9b  ! 728: XORcc_I	xorcc 	%r16, 0x0b9b, %r19
	.word 0x828c0011  ! 728: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0xab643801  ! 728: MOVcc_I	<illegal instruction>
	.word 0x981422bb  ! 728: OR_I	or 	%r16, 0x02bb, %r12
thr0_dc_err_56:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_56), 16, 16),1,DC_DATA,52)
	.word 0xd8c41000  ! 730: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r12
thr0_irf_ce_72:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_72), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0x94742b4c  ! 732: UDIV_I	udiv 	%r16, 0x0b4c, %r10
	.word 0x883424c2  ! 734: ORN_I	orn 	%r16, 0x04c2, %r4
	.word 0x8a8c0011  ! 734: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0xa6442cfb  ! 734: ADDC_I	addc 	%r16, 0x0cfb, %r19
	.word 0x82840011  ! 734: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xb29c263c  ! 734: XORcc_I	xorcc 	%r16, 0x063c, %r25
thr0_dc_err_57:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_57), 16, 16),1,DC_DATA,63)
	.word 0xf28c1000  ! 736: LDUBA_R	lduba	[%r16, %r0] 0x80, %r25
thr0_irf_ce_73:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_73), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0x96d42c42  ! 738: UMULcc_I	umulcc 	%r16, 0x0c42, %r11
	.word 0x96c424ff  ! 740: ADDCcc_I	addccc 	%r16, 0x04ff, %r11
	.word 0x829c25fd  ! 740: XORcc_I	xorcc 	%r16, 0x05fd, %r1
	.word 0xae2c2575  ! 740: ANDN_I	andn 	%r16, 0x0575, %r23
	.word 0x8e440011  ! 740: ADDC_R	addc 	%r16, %r17, %r7
	.word 0x98ac0011  ! 740: ANDNcc_R	andncc 	%r16, %r17, %r12
thr0_dc_err_58:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_58), 16, 16),1,DC_DATA,71)
	.word 0xd9042575  ! 742: LDF_I	ld	[%r16, 0x0575], %f12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa61c2ca2  ! 746: XOR_I	xor 	%r16, 0x0ca2, %r19
	.word 0xb63c2726  ! 746: XNOR_I	xnor 	%r16, 0x0726, %r27
	.word 0xb5341011  ! 746: SRLX_R	srlx	%r16, %r17, %r26
	.word 0xa6142588  ! 746: OR_I	or 	%r16, 0x0588, %r19
	.word 0x9b3c1011  ! 746: SRAX_R	srax	%r16, %r17, %r13
	.word 0xb61c258e  ! 746: XOR_I	xor 	%r16, 0x058e, %r27
	.word 0x89643801  ! 746: MOVcc_I	<illegal instruction>
	.word 0xc2c41011  ! 747: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r1
thr0_irf_ce_74:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_74), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
thr0_resum_intr_761:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_761), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x9abc2b03  ! 751: XNORcc_I	xnorcc 	%r16, 0x0b03, %r13
	.word 0x9e0c0011  ! 751: AND_R	and 	%r16, %r17, %r15
	.word 0x853c0011  ! 751: SRA_R	sra 	%r16, %r17, %r2
	.word 0xad3c1011  ! 751: SRAX_R	srax	%r16, %r17, %r22
	.word 0x833c2001  ! 751: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0x9d7c2401  ! 751: MOVR_I	move	%r16, 0x7fff9c24, %r14
	.word 0xa6ac2039  ! 751: ANDNcc_I	andncc 	%r16, 0x0039, %r19
	.word 0x821c2801  ! 751: XOR_I	xor 	%r16, 0x0801, %r1
	.word 0xee9c2c68  ! 752: LDDA_I	ldda	[%r16, + 0x0c68] %asi, %r23
        wr %g0, 0x4, %fprs
	.word 0xa88c0011  ! 756: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0x82ac0011  ! 756: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0xae1c2a8d  ! 756: XOR_I	xor 	%r16, 0x0a8d, %r23
	.word 0x962c2141  ! 756: ANDN_I	andn 	%r16, 0x0141, %r11
	.word 0x862c2b02  ! 756: ANDN_I	andn 	%r16, 0x0b02, %r3
	.word 0x8eb4235f  ! 756: ORNcc_I	orncc 	%r16, 0x035f, %r7
	.word 0xaa3c2191  ! 756: XNOR_I	xnor 	%r16, 0x0191, %r21
	.word 0x82b40011  ! 757: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x87641811  ! 757: MOVcc_R	<illegal instruction>
	.word 0x9f2c3001  ! 757: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x8a442fb3  ! 757: ADDC_I	addc 	%r16, 0x0fb3, %r5
	.word 0xab2c0011  ! 757: SLL_R	sll 	%r16, %r17, %r21
	.word 0x9d7c2401  ! 757: MOVR_I	move	%r16, 0x7fff9c24, %r14
	.word 0x9b2c0011  ! 757: SLL_R	sll 	%r16, %r17, %r13
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd31c0011  ! 757: LDDF_R	ldd	[%r16, %r17], %f9
thr0_irf_ce_75:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_75), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	return     %r18 + %r17
	.word 0xbb2c3001  ! 760: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xb09c29b4  ! 760: XORcc_I	xorcc 	%r16, 0x09b4, %r24
	.word 0xb93c2001  ! 760: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0x9eb423cd  ! 760: ORNcc_I	orncc 	%r16, 0x03cd, %r15
	.word 0x8d342001  ! 760: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x837c2401  ! 760: MOVR_I	move	%r16, 0x7fff9c24, %r1
	.word 0xb62c2f12  ! 760: ANDN_I	andn 	%r16, 0x0f12, %r27
	.word 0xdb0422ac  ! 761: LDF_I	ld	[%r16, 0x02ac], %f13
	.word 0xd28c1011  ! 763: LDUBA_R	lduba	[%r16, %r17] 0x80, %r9
	.word 0x8aac0011  ! 765: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x9c0c0011  ! 765: AND_R	and 	%r16, %r17, %r14
	.word 0xae840011  ! 765: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x922c0011  ! 765: ANDN_R	andn 	%r16, %r17, %r9
	.word 0x88842df3  ! 765: ADDcc_I	addcc 	%r16, 0x0df3, %r4
thr0_dc_err_59:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_59), 16, 16),1,DC_DATA,18)
	.word 0xc8c42df3  ! 767: LDSWA_I	ldswa	[%r16, + 0x0df3] %asi, %r4
	wr      %r0, 0x5, %asr26
	.word 0x9cac239a  ! 771: ANDNcc_I	andncc 	%r16, 0x039a, %r14
	.word 0x8e8c2590  ! 771: ANDcc_I	andcc 	%r16, 0x0590, %r7
	.word 0x8d7c0411  ! 771: MOVR_R	move	%r16, %r17, %r6
	.word 0x8a3c29cb  ! 771: XNOR_I	xnor 	%r16, 0x09cb, %r5
	.word 0x832c0011  ! 771: SLL_R	sll 	%r16, %r17, %r1
	.word 0xd6942893  ! 772: LDUHA_I	lduha	[%r16, + 0x0893] %asi, %r11
        wr %g0, 0x4, %fprs
	.word 0x85643801  ! 776: MOVcc_I	<illegal instruction>
	.word 0x94b4218b  ! 776: ORNcc_I	orncc 	%r16, 0x018b, %r10
	.word 0xb2b42fd6  ! 776: ORNcc_I	orncc 	%r16, 0x0fd6, %r25
	.word 0xab3c2001  ! 776: SRA_I	sra 	%r16, 0x0001, %r21
	.word 0xac3c0011  ! 776: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x9a842e2b  ! 776: ADDcc_I	addcc 	%r16, 0x0e2b, %r13
	.word 0xdedc20d6  ! 777: LDXA_I	ldxa	[%r16, + 0x00d6] %asi, %r15
	.word 0xc3841011  ! 779: LDFA_R	lda	[%r16, %r17], %f1
	.word 0x9f7c2401  ! 781: MOVR_I	move	%r16, 0x7fff9c24, %r15
	.word 0x8cac0011  ! 781: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0x8e9c0011  ! 781: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x9d3c2001  ! 781: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0xba2c0011  ! 781: ANDN_R	andn 	%r16, %r17, %r29
	.word 0xf8d41011  ! 782: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r28
thr0_irf_ce_76:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_76), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xf1841011  ! 784: LDFA_R	lda	[%r16, %r17], %f24
	.word 0x86840011  ! 786: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0x983c0011  ! 786: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0x8a0426c4  ! 786: ADD_I	add 	%r16, 0x06c4, %r5
	.word 0x988c2513  ! 786: ANDcc_I	andcc 	%r16, 0x0513, %r12
	.word 0x900c0011  ! 786: AND_R	and 	%r16, %r17, %r8
	.word 0x9e0c0011  ! 786: AND_R	and 	%r16, %r17, %r15
	.word 0xb02c0011  ! 786: ANDN_R	andn 	%r16, %r17, %r24
	.word 0x868c24ba  ! 786: ANDcc_I	andcc 	%r16, 0x04ba, %r3
	.word 0xcb040011  ! 787: LDF_R	ld	[%r16, %r17], %f5
thr0_irf_ce_77:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_77), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xd034279a  ! 791: STH_I	sth	%r8, [%r16 + 0x079a]
	.word 0x8d2c1011  ! 793: SLLX_R	sllx	%r16, %r17, %r6
	.word 0xaa040011  ! 793: ADD_R	add 	%r16, %r17, %r21
	.word 0xb3343001  ! 793: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0x961c0011  ! 793: XOR_R	xor 	%r16, %r17, %r11
	.word 0x9f3c0011  ! 793: SRA_R	sra 	%r16, %r17, %r15
	.word 0x9c1c2bbe  ! 793: XOR_I	xor 	%r16, 0x0bbe, %r14
	.word 0xa6ac2638  ! 793: ANDNcc_I	andncc 	%r16, 0x0638, %r19
	.word 0xa8c40011  ! 793: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0xde942ab4  ! 794: LDUHA_I	lduha	[%r16, + 0x0ab4] %asi, %r15
thr0_irf_ce_78:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_78), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xf59c1011  ! 796: LDDFA_R	ldda	[%r16, %r17], %f26
	.word 0xba3c2b17  ! 798: XNOR_I	xnor 	%r16, 0x0b17, %r29
	.word 0xa89c0011  ! 798: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0x92bc2cf1  ! 798: XNORcc_I	xnorcc 	%r16, 0x0cf1, %r9
	.word 0xb23c2a2f  ! 798: XNOR_I	xnor 	%r16, 0x0a2f, %r25
	.word 0xacc40011  ! 798: ADDCcc_R	addccc 	%r16, %r17, %r22
thr0_dc_err_60:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_60), 16, 16),1,DC_DATA,41)
	.word 0xec9c1000  ! 800: LDDA_R	ldda	[%r16, %r0] 0x80, %r22
thr0_irf_ce_79:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_79), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	ta	T_CHANGE_HPRIV	! macro
	.word 0xb8842854  ! 804: ADDcc_I	addcc 	%r16, 0x0854, %r28
	.word 0x873c2001  ! 804: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x963c0011  ! 804: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x98142d34  ! 804: OR_I	or 	%r16, 0x0d34, %r12
	.word 0x8d2c0011  ! 804: SLL_R	sll 	%r16, %r17, %r6
	.word 0xd65c0011  ! 805: LDX_R	ldx	[%r16 + %r17], %r11
thr0_irf_ce_80:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_80), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xec4424ff  ! 807: LDSW_I	ldsw	[%r16 + 0x04ff], %r22
	.word 0x820c0011  ! 809: AND_R	and 	%r16, %r17, %r1
	.word 0x948c25c0  ! 809: ANDcc_I	andcc 	%r16, 0x05c0, %r10
	.word 0x84340011  ! 809: ORN_R	orn 	%r16, %r17, %r2
	.word 0xa92c1011  ! 809: SLLX_R	sllx	%r16, %r17, %r20
	.word 0x8c0c2df3  ! 809: AND_I	and 	%r16, 0x0df3, %r6
	.word 0x95643801  ! 809: MOVcc_I	<illegal instruction>
	.word 0x8ebc28c2  ! 809: XNORcc_I	xnorcc 	%r16, 0x08c2, %r7
	.word 0xb41c0011  ! 809: XOR_R	xor 	%r16, %r17, %r26
	.word 0xcc4423ae  ! 810: LDSW_I	ldsw	[%r16 + 0x03ae], %r6
thr0_irf_ce_81:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_81), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0x06800004  ! 812: BL	bl  	<label_0x4>
	.word 0x9c0428f8  ! 814: ADD_I	add 	%r16, 0x08f8, %r14
	.word 0x82840011  ! 814: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xb20c24bc  ! 814: AND_I	and 	%r16, 0x04bc, %r25
	.word 0xb0040011  ! 814: ADD_R	add 	%r16, %r17, %r24
	.word 0xaf2c2001  ! 814: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0xd71c0011  ! 815: LDDF_R	ldd	[%r16, %r17], %f11
thr0_irf_ce_82:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_82), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xf9941011  ! 817: LDQFA_R	-	[%r16, %r17], %f28
	.word 0x98142714  ! 819: OR_I	or 	%r16, 0x0714, %r12
	.word 0x8f2c3001  ! 819: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x99643801  ! 819: MOVcc_I	<illegal instruction>
	.word 0x8eb40011  ! 819: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0xac040011  ! 819: ADD_R	add 	%r16, %r17, %r22
	.word 0x883422aa  ! 819: ORN_I	orn 	%r16, 0x02aa, %r4
	.word 0xacc40011  ! 819: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0xb6942a8f  ! 819: ORcc_I	orcc 	%r16, 0x0a8f, %r27
	.word 0xcf140011  ! 820: LDQF_R	-	[%r16, %r17], %f7
!Illinst store
	.word 0xd2340011  ! 822: STH_R	sth	%r9, [%r16 + %r17]
	.word 0x824426e2  ! 824: ADDC_I	addc 	%r16, 0x06e2, %r1
	.word 0x992c3001  ! 824: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x98440011  ! 824: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x9204261a  ! 824: ADD_I	add 	%r16, 0x061a, %r9
	.word 0x880c0011  ! 824: AND_R	and 	%r16, %r17, %r4
	.word 0xa6c425f2  ! 824: ADDCcc_I	addccc 	%r16, 0x05f2, %r19
	.word 0xb23c0011  ! 824: XNOR_R	xnor 	%r16, %r17, %r25
thr0_dc_err_61:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_61), 16, 16),1,DC_DATA,7)
	.word 0xf31c25f2  ! 826: LDDF_I	ldd	[%r16, 0x05f2], %f25
	.word 0x36800003  ! 828: BGE	bge,a	<label_0x3>
	.word 0x8f3c2001  ! 830: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x969c2bea  ! 830: XORcc_I	xorcc 	%r16, 0x0bea, %r11
	.word 0x94b40011  ! 830: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0x981c2fa0  ! 830: XOR_I	xor 	%r16, 0x0fa0, %r12
	.word 0xb20c0011  ! 830: AND_R	and 	%r16, %r17, %r25
thr0_dc_err_62:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_62), 16, 16),1,DC_DATA,34)
	.word 0xf2dc1000  ! 832: LDXA_R	ldxa	[%r16, %r0] 0x80, %r25
	.word 0xd884234a  ! 834: LDUWA_I	lduwa	[%r16, + 0x034a] %asi, %r12
	.word 0x8d2c0011  ! 836: SLL_R	sll 	%r16, %r17, %r6
	.word 0x90ac0011  ! 836: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x9eac2a83  ! 836: ANDNcc_I	andncc 	%r16, 0x0a83, %r15
	.word 0x8a8c231b  ! 836: ANDcc_I	andcc 	%r16, 0x031b, %r5
	.word 0x8e8425f2  ! 836: ADDcc_I	addcc 	%r16, 0x05f2, %r7
thr0_dc_err_63:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_63), 16, 16),1,DC_DATA,50)
	.word 0xcf140000  ! 838: LDQF_R	-	[%r16, %r0], %f7
	.word 0xf01426fe  ! 840: LDUH_I	lduh	[%r16 + 0x06fe], %r24
	.word 0x941c0011  ! 842: XOR_R	xor 	%r16, %r17, %r10
	.word 0xba140011  ! 842: OR_R	or 	%r16, %r17, %r29
	.word 0x8a34241f  ! 842: ORN_I	orn 	%r16, 0x041f, %r5
	.word 0x903c0011  ! 842: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x9d340011  ! 842: SRL_R	srl 	%r16, %r17, %r14
	.word 0xad3c2001  ! 842: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0xca9c2039  ! 843: LDDA_I	ldda	[%r16, + 0x0039] %asi, %r5
	.word 0xd8d4230f  ! 845: LDSHA_I	ldsha	[%r16, + 0x030f] %asi, %r12
	.word 0x9484274f  ! 847: ADDcc_I	addcc 	%r16, 0x074f, %r10
	.word 0x92c42841  ! 847: ADDCcc_I	addccc 	%r16, 0x0841, %r9
	.word 0xaf7c0411  ! 847: MOVR_R	move	%r16, %r17, %r23
	.word 0xac440011  ! 847: ADDC_R	addc 	%r16, %r17, %r22
	.word 0xb4340011  ! 847: ORN_R	orn 	%r16, %r17, %r26
	.word 0xb3342001  ! 848: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x972c1011  ! 848: SLLX_R	sllx	%r16, %r17, %r11
	.word 0x9b2c0011  ! 848: SLL_R	sll 	%r16, %r17, %r13
	.word 0xb62c0011  ! 848: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x9e1c2ffc  ! 848: XOR_I	xor 	%r16, 0x0ffc, %r15
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xeb0429a1  ! 848: LDF_I	ld	[%r16, 0x09a1], %f21
thr0_irf_ce_83:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_83), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	return     %r18 + 0x20
	.word 0xaa8c0011  ! 851: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0x833c0011  ! 851: SRA_R	sra 	%r16, %r17, %r1
	.word 0x913c1011  ! 851: SRAX_R	srax	%r16, %r17, %r8
	.word 0x87340011  ! 851: SRL_R	srl 	%r16, %r17, %r3
	.word 0xba442459  ! 851: ADDC_I	addc 	%r16, 0x0459, %r29
	.word 0x940420cb  ! 851: ADD_I	add 	%r16, 0x00cb, %r10
	.word 0x8b641811  ! 851: MOVcc_R	<illegal instruction>
	.word 0x8e340011  ! 851: ORN_R	orn 	%r16, %r17, %r7
thr0_dc_err_64:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_64), 16, 16),1,DC_DATA,28)
	.word 0xce0c0000  ! 853: LDUB_R	ldub	[%r16 + %r0], %r7
	.word 0x9b242b10  ! 855: MULScc_I	mulscc 	%r16, 0x0b10, %r13
	.word 0x972c0011  ! 857: SLL_R	sll 	%r16, %r17, %r11
	.word 0x923c0011  ! 857: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x97341011  ! 857: SRLX_R	srlx	%r16, %r17, %r11
	.word 0xad2c3001  ! 857: SLLX_I	sllx	%r16, 0x0001, %r22
	.word 0x9b342001  ! 857: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0xb5341011  ! 857: SRLX_R	srlx	%r16, %r17, %r26
	.word 0x848c0011  ! 857: ANDcc_R	andcc 	%r16, %r17, %r2
thr0_dc_err_65:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_65), 16, 16),1,DC_DATA,20)
	.word 0xc4dc2b10  ! 859: LDXA_I	ldxa	[%r16, + 0x0b10] %asi, %r2
thr0_irf_ce_84:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_84), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd28c2642  ! 861: LDUBA_I	lduba	[%r16, + 0x0642] %asi, %r9
	.word 0xb64420b4  ! 863: ADDC_I	addc 	%r16, 0x00b4, %r27
	.word 0x8a840011  ! 863: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x823c0011  ! 863: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0xb8c42e2b  ! 863: ADDCcc_I	addccc 	%r16, 0x0e2b, %r28
	.word 0x852c2001  ! 863: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x8e2c2a8c  ! 863: ANDN_I	andn 	%r16, 0x0a8c, %r7
	.word 0x848c24de  ! 863: ANDcc_I	andcc 	%r16, 0x04de, %r2
	.word 0xc3941011  ! 864: LDQFA_R	-	[%r16, %r17], %f1
	.word 0xd19c1011  ! 866: LDDFA_R	ldda	[%r16, %r17], %f8
	.word 0x9c8c0011  ! 868: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0xb62c2801  ! 868: ANDN_I	andn 	%r16, 0x0801, %r27
	.word 0xb61c0011  ! 868: XOR_R	xor 	%r16, %r17, %r27
	.word 0x972c2001  ! 868: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x9c0c2579  ! 868: AND_I	and 	%r16, 0x0579, %r14
	.word 0xaa940011  ! 868: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0xd8941011  ! 869: LDUHA_R	lduha	[%r16, %r17] 0x80, %r12
	.word 0xc8dc208e  ! 871: LDXA_I	ldxa	[%r16, + 0x008e] %asi, %r4
	.word 0x873c2001  ! 873: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x903c236b  ! 873: XNOR_I	xnor 	%r16, 0x036b, %r8
	.word 0x8d2c2001  ! 873: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0x9a3c0011  ! 873: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x9c0c0011  ! 873: AND_R	and 	%r16, %r17, %r14
thr0_dc_err_66:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_66), 16, 16),1,DC_DATA,59)
	.word 0xdd841000  ! 875: LDFA_R	lda	[%r16, %r0], %f14
thr0_irf_ce_85:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_85), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xde841011  ! 877: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r15
	.word 0x92042b94  ! 879: ADD_I	add 	%r16, 0x0b94, %r9
	.word 0x932c0011  ! 879: SLL_R	sll 	%r16, %r17, %r9
	.word 0xab343001  ! 879: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0x863c2a94  ! 879: XNOR_I	xnor 	%r16, 0x0a94, %r3
	.word 0x9a440011  ! 879: ADDC_R	addc 	%r16, %r17, %r13
	.word 0xca8c2194  ! 880: LDUBA_I	lduba	[%r16, + 0x0194] %asi, %r5
thr0_irf_ce_86:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_86), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xf8d41011  ! 882: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r28
	.word 0xa93c0011  ! 884: SRA_R	sra 	%r16, %r17, %r20
	.word 0x8cbc2dfd  ! 884: XNORcc_I	xnorcc 	%r16, 0x0dfd, %r6
	.word 0xac1c0011  ! 884: XOR_R	xor 	%r16, %r17, %r22
	.word 0xb32c2001  ! 884: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0x8d3c1011  ! 884: SRAX_R	srax	%r16, %r17, %r6
	.word 0x9cac0011  ! 884: ANDNcc_R	andncc 	%r16, %r17, %r14
thr0_dc_err_67:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_67), 16, 16),1,DC_DATA,34)
	.word 0xdc9c2dfd  ! 886: LDDA_I	ldda	[%r16, + 0x0dfd] %asi, %r14
	.word 0xf44c0011  ! 888: LDSB_R	ldsb	[%r16 + %r17], %r26
	.word 0x88b4289f  ! 890: ORNcc_I	orncc 	%r16, 0x089f, %r4
	.word 0x8a340011  ! 890: ORN_R	orn 	%r16, %r17, %r5
	.word 0x8a9c2d16  ! 890: XORcc_I	xorcc 	%r16, 0x0d16, %r5
	.word 0xab343001  ! 890: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0x82c42a82  ! 890: ADDCcc_I	addccc 	%r16, 0x0a82, %r1
	.word 0xb1342001  ! 890: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0x90c42e26  ! 890: ADDCcc_I	addccc 	%r16, 0x0e26, %r8
	.word 0xaf643801  ! 890: MOVcc_I	<illegal instruction>
thr0_dc_err_68:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_68), 16, 16),1,DC_DATA,13)
	.word 0xeed42e26  ! 892: LDSHA_I	ldsha	[%r16, + 0x0e26] %asi, %r23
	.word 0xd0142465  ! 894: LDUH_I	lduh	[%r16 + 0x0465], %r8
	.word 0xba140011  ! 896: OR_R	or 	%r16, %r17, %r29
	.word 0xacac2d06  ! 896: ANDNcc_I	andncc 	%r16, 0x0d06, %r22
	.word 0x9e8426d5  ! 896: ADDcc_I	addcc 	%r16, 0x06d5, %r15
	.word 0xacb42e20  ! 896: ORNcc_I	orncc 	%r16, 0x0e20, %r22
	.word 0x8cc40011  ! 896: ADDCcc_R	addccc 	%r16, %r17, %r6
thr0_dc_err_69:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_69), 16, 16),1,DC_DATA,1)
	.word 0xcc1c0000  ! 898: LDD_R	ldd	[%r16 + %r0], %r6
	.word 0xca1c2668  ! 900: LDD_I	ldd	[%r16 + 0x0668], %r5
	.word 0x8e0c0011  ! 902: AND_R	and 	%r16, %r17, %r7
	.word 0x8d2c1011  ! 902: SLLX_R	sllx	%r16, %r17, %r6
	.word 0xba8c0011  ! 902: ANDcc_R	andcc 	%r16, %r17, %r29
	.word 0xba440011  ! 902: ADDC_R	addc 	%r16, %r17, %r29
	.word 0x86ac2c2c  ! 902: ANDNcc_I	andncc 	%r16, 0x0c2c, %r3
	.word 0x9cac276b  ! 902: ANDNcc_I	andncc 	%r16, 0x076b, %r14
	.word 0x82b40011  ! 902: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0xd4942ebf  ! 903: LDUHA_I	lduha	[%r16, + 0x0ebf] %asi, %r10
thr0_irf_ce_87:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_87), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xcc94247f  ! 905: LDUHA_I	lduha	[%r16, + 0x047f] %asi, %r6
	.word 0x90040011  ! 907: ADD_R	add 	%r16, %r17, %r8
	.word 0xa6040011  ! 907: ADD_R	add 	%r16, %r17, %r19
	.word 0xa80c0011  ! 907: AND_R	and 	%r16, %r17, %r20
	.word 0x848c2a9b  ! 907: ANDcc_I	andcc 	%r16, 0x0a9b, %r2
	.word 0x852c0011  ! 907: SLL_R	sll 	%r16, %r17, %r2
thr0_dc_err_70:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_70), 16, 16),1,DC_DATA,48)
	.word 0xc51c0000  ! 909: LDDF_R	ldd	[%r16, %r0], %f2
thr0_irf_ce_88:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_88), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf9240011  ! 911: STF_R	st	%f28, [%r17, %r16]
	.word 0x883c0011  ! 913: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x92bc232e  ! 913: XNORcc_I	xnorcc 	%r16, 0x032e, %r9
	.word 0xaa0423c6  ! 913: ADD_I	add 	%r16, 0x03c6, %r21
	.word 0x82140011  ! 913: OR_R	or 	%r16, %r17, %r1
	.word 0xb29c0011  ! 913: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0xb4040011  ! 913: ADD_R	add 	%r16, %r17, %r26
	.word 0x9c842a2d  ! 913: ADDcc_I	addcc 	%r16, 0x0a2d, %r14
	.word 0xd5140011  ! 914: LDQF_R	-	[%r16, %r17], %f10
	.word 0xcc9c2a7e  ! 916: LDDA_I	ldda	[%r16, + 0x0a7e] %asi, %r6
	.word 0xb2c40011  ! 918: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0x84440011  ! 918: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x90042a09  ! 918: ADD_I	add 	%r16, 0x0a09, %r8
	.word 0x90c40011  ! 918: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x872c3001  ! 918: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0xa9340011  ! 918: SRL_R	srl 	%r16, %r17, %r20
	.word 0xb97c2401  ! 918: MOVR_I	move	%r16, 0x7fff9c24, %r28
thr0_dc_err_71:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_71), 16, 16),1,DC_DATA,70)
	.word 0xf9042a09  ! 920: LDF_I	ld	[%r16, 0x0a09], %f28
	.word 0xec941011  ! 922: LDUHA_R	lduha	[%r16, %r17] 0x80, %r22
	.word 0xb4942fa8  ! 924: ORcc_I	orcc 	%r16, 0x0fa8, %r26
	.word 0xba440011  ! 924: ADDC_R	addc 	%r16, %r17, %r29
	.word 0x98040011  ! 924: ADD_R	add 	%r16, %r17, %r12
	.word 0x96ac0011  ! 924: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x84942122  ! 924: ORcc_I	orcc 	%r16, 0x0122, %r2
	.word 0x944422ab  ! 924: ADDC_I	addc 	%r16, 0x02ab, %r10
	.word 0x86ac0011  ! 924: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0x8a0c0011  ! 924: AND_R	and 	%r16, %r17, %r5
thr0_dc_err_72:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_72), 16, 16),1,DC_DATA,43)
	.word 0xcb1c22ab  ! 926: LDDF_I	ldd	[%r16, 0x02ab], %f5
thr0_irf_ce_89:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_89), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0x8e4c2f67  ! 928: MULX_I	mulx 	%r16, 0x0f67, %r7
	.word 0x8abc2c2e  ! 930: XNORcc_I	xnorcc 	%r16, 0x0c2e, %r5
	.word 0xb4b40011  ! 930: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0x881c0011  ! 930: XOR_R	xor 	%r16, %r17, %r4
	.word 0x949c24a8  ! 930: XORcc_I	xorcc 	%r16, 0x04a8, %r10
	.word 0x93342001  ! 930: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0xdd1c27f1  ! 931: LDDF_I	ldd	[%r16, 0x07f1], %f14
	.word 0xdd1c0011  ! 933: LDDF_R	ldd	[%r16, %r17], %f14
	.word 0x9eb42088  ! 935: ORNcc_I	orncc 	%r16, 0x0088, %r15
	.word 0x82040011  ! 935: ADD_R	add 	%r16, %r17, %r1
	.word 0x87341011  ! 935: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x9d3c0011  ! 935: SRA_R	sra 	%r16, %r17, %r14
	.word 0xba2c229a  ! 935: ANDN_I	andn 	%r16, 0x029a, %r29
	.word 0x8b641811  ! 935: MOVcc_R	<illegal instruction>
	.word 0x969c2bdb  ! 935: XORcc_I	xorcc 	%r16, 0x0bdb, %r11
	.word 0xb28c0011  ! 935: ANDcc_R	andcc 	%r16, %r17, %r25
	.word 0xd4042d8e  ! 936: LDUW_I	lduw	[%r16 + 0x0d8e], %r10
thr0_irf_ce_90:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_90), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xd85c0011  ! 938: LDX_R	ldx	[%r16 + %r17], %r12
	.word 0xb22c0011  ! 940: ANDN_R	andn 	%r16, %r17, %r25
	.word 0xb68c0011  ! 940: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0xa8840011  ! 940: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0x9644209b  ! 940: ADDC_I	addc 	%r16, 0x009b, %r11
	.word 0xae9c268a  ! 940: XORcc_I	xorcc 	%r16, 0x068a, %r23
	.word 0xac342530  ! 940: ORN_I	orn 	%r16, 0x0530, %r22
	.word 0x92b423dc  ! 940: ORNcc_I	orncc 	%r16, 0x03dc, %r9
	.word 0xa6ac0011  ! 940: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0xc70420f8  ! 941: LDF_I	ld	[%r16, 0x00f8], %f3
thr0_irf_ce_91:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_91), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0x02800003  ! 943: BE	be  	<label_0x3>
	.word 0xa8442c0d  ! 945: ADDC_I	addc 	%r16, 0x0c0d, %r20
	.word 0x829c0011  ! 945: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0xa8ac2676  ! 945: ANDNcc_I	andncc 	%r16, 0x0676, %r20
	.word 0x913c0011  ! 945: SRA_R	sra 	%r16, %r17, %r8
	.word 0x868c25d9  ! 945: ANDcc_I	andcc 	%r16, 0x05d9, %r3
	.word 0x86c42a6b  ! 945: ADDCcc_I	addccc 	%r16, 0x0a6b, %r3
	.word 0x908c2531  ! 945: ANDcc_I	andcc 	%r16, 0x0531, %r8
thr0_dc_err_73:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_73), 16, 16),1,DC_DATA,37)
	.word 0xd1040000  ! 947: LDF_R	ld	[%r16, %r0], %f8
thr0_irf_ce_92:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_92), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xe71c29fb  ! 949: LDDF_I	ldd	[%r16, 0x09fb], %f19
	.word 0x86c40011  ! 951: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x8d2c2001  ! 951: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0x948c0011  ! 951: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x96c40011  ! 951: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x937c2401  ! 951: MOVR_I	move	%r16, 0x7fff9c24, %r9
	.word 0x9c842cc8  ! 951: ADDcc_I	addcc 	%r16, 0x0cc8, %r14
	.word 0x9a442e1e  ! 951: ADDC_I	addc 	%r16, 0x0e1e, %r13
	.word 0x8d343001  ! 951: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0xdf142e10  ! 952: LDQF_I	-	[%r16, 0x0e10], %f15
	.word 0xe65c0011  ! 954: LDX_R	ldx	[%r16 + %r17], %r19
	.word 0x888424bf  ! 956: ADDcc_I	addcc 	%r16, 0x04bf, %r4
	.word 0xaa942b7b  ! 956: ORcc_I	orcc 	%r16, 0x0b7b, %r21
	.word 0x9abc2c21  ! 956: XNORcc_I	xnorcc 	%r16, 0x0c21, %r13
	.word 0x9ec42d4a  ! 956: ADDCcc_I	addccc 	%r16, 0x0d4a, %r15
	.word 0xa81c20c5  ! 956: XOR_I	xor 	%r16, 0x00c5, %r20
	.word 0x8b2c2001  ! 956: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0xaa9c0011  ! 956: XORcc_R	xorcc 	%r16, %r17, %r21
thr0_dc_err_74:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_74), 16, 16),1,DC_DATA,28)
	.word 0xea8420c5  ! 958: LDUWA_I	lduwa	[%r16, + 0x00c5] %asi, %r21
	.word 0xc3042f55  ! 960: LDF_I	ld	[%r16, 0x0f55], %f1
	.word 0x9ab40011  ! 962: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x9b2c3001  ! 962: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x8e8c0011  ! 962: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x849c0011  ! 962: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x9a9c26a0  ! 962: XORcc_I	xorcc 	%r16, 0x06a0, %r13
thr0_dc_err_75:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_75), 16, 16),1,DC_DATA,40)
	.word 0xda0426a0  ! 964: LDUW_I	lduw	[%r16 + 0x06a0], %r13
!Illinst alu
	.word 0x94340011  ! 966: ORN_R	orn 	%r16, %r17, %r10
	.word 0x86342ad7  ! 968: ORN_I	orn 	%r16, 0x0ad7, %r3
	.word 0x932c1011  ! 968: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x843428c5  ! 968: ORN_I	orn 	%r16, 0x08c5, %r2
	.word 0x877c2401  ! 968: MOVR_I	move	%r16, 0x7fff9c24, %r3
	.word 0x8f3c2001  ! 968: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x9ab4252b  ! 968: ORNcc_I	orncc 	%r16, 0x052b, %r13
	.word 0x8c1c2db3  ! 968: XOR_I	xor 	%r16, 0x0db3, %r6
	.word 0x848c0011  ! 968: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0xcb941011  ! 969: LDQFA_R	-	[%r16, %r17], %f5
	.word 0xdb040011  ! 971: LDF_R	ld	[%r16, %r17], %f13
	.word 0x8e8c29f0  ! 973: ANDcc_I	andcc 	%r16, 0x09f0, %r7
	.word 0xae840011  ! 973: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x8a942f65  ! 973: ORcc_I	orcc 	%r16, 0x0f65, %r5
	.word 0x997c2401  ! 973: MOVR_I	move	%r16, 0x7fff9c24, %r12
	.word 0x8e04220e  ! 973: ADD_I	add 	%r16, 0x020e, %r7
	.word 0x88440011  ! 973: ADDC_R	addc 	%r16, %r17, %r4
	.word 0xee040011  ! 974: LDUW_R	lduw	[%r16 + %r17], %r23
thr0_irf_ce_93:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_93), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xca8c1011  ! 976: LDUBA_R	lduba	[%r16, %r17] 0x80, %r5
	.word 0x86ac0011  ! 978: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0xb60c282b  ! 978: AND_I	and 	%r16, 0x082b, %r27
	.word 0x90ac0011  ! 978: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0xb3342001  ! 978: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x8c442b83  ! 978: ADDC_I	addc 	%r16, 0x0b83, %r6
	.word 0xd8942cce  ! 979: LDUHA_I	lduha	[%r16, + 0x0cce] %asi, %r12
!Illinst store
	.word 0xee340011  ! 981: STH_R	sth	%r23, [%r16 + %r17]
	.word 0x942c0011  ! 983: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x8e940011  ! 983: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0x9a940011  ! 983: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x9a1c2827  ! 983: XOR_I	xor 	%r16, 0x0827, %r13
	.word 0x8abc213f  ! 983: XNORcc_I	xnorcc 	%r16, 0x013f, %r5
	.word 0x9b343001  ! 983: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xf80c0011  ! 984: LDUB_R	ldub	[%r16 + %r17], %r28
thr0_irf_ce_94:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_94), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xea540011  ! 986: LDSH_R	ldsh	[%r16 + %r17], %r21
	.word 0xb61c0011  ! 988: XOR_R	xor 	%r16, %r17, %r27
	.word 0x98940011  ! 988: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0xb44423f2  ! 988: ADDC_I	addc 	%r16, 0x03f2, %r26
	.word 0xb6940011  ! 988: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0xac3429c4  ! 988: ORN_I	orn 	%r16, 0x09c4, %r22
	.word 0x953c2001  ! 988: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x8b2c0011  ! 988: SLL_R	sll 	%r16, %r17, %r5
	.word 0x909c0011  ! 988: XORcc_R	xorcc 	%r16, %r17, %r8
thr0_dc_err_76:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_76), 16, 16),1,DC_DATA,69)
	.word 0xd0440000  ! 990: LDSW_R	ldsw	[%r16 + %r0], %r8
        wr  %g0, 0x80, %asi
	.word 0x88942f6f  ! 994: ORcc_I	orcc 	%r16, 0x0f6f, %r4
	.word 0xa80429a1  ! 994: ADD_I	add 	%r16, 0x09a1, %r20
	.word 0x86440011  ! 994: ADDC_R	addc 	%r16, %r17, %r3
	.word 0xa73c2001  ! 994: SRA_I	sra 	%r16, 0x0001, %r19
	.word 0x900421ab  ! 994: ADD_I	add 	%r16, 0x01ab, %r8
	.word 0xd21c2afc  ! 995: LDD_I	ldd	[%r16 + 0x0afc], %r9
	.word 0x2e800003  ! 997: BVS	bvs,a	<label_0x3>
	.word 0x869c0011  ! 999: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0x9c3c251d  ! 999: XNOR_I	xnor 	%r16, 0x051d, %r14
	.word 0xa6ac0011  ! 999: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0x9a8c0011  ! 999: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0xae3c0011  ! 999: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x98ac2eaf  ! 999: ANDNcc_I	andncc 	%r16, 0x0eaf, %r12
thr0_dc_err_77:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_77), 16, 16),1,DC_DATA,13)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 16, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 24, 16, 16)) -> intp(3, 1, 1)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ta    T_GOOD_TRAP

.data
	.word  0x2c59e2ad,0xdabdc7cb,0x08ce472e,0xd33dc4ed
	.word  0x9f2c2309,0x34bb9423,0x15c55b43,0x1c8acd5e
	.word  0xa62557a5,0xf5119d11,0x0fd3d47f,0xb85c1c95
	.word  0x6682ffb3,0xfa862c6f,0x1a2bb9ac,0x4dd71336
	.word  0xb2bd0720,0x7f38e2f8,0x7d6e7ec5,0x0b066b7c
	.word  0x64b3f9a2,0xcfba64ce,0xf7bb6097,0xac3a4b8d
	.word  0xa5fbedef,0x0e39cd69,0x792457e0,0x28c2b432
	.word  0x6f224fec,0x1d079a10,0x3ab952b1,0x88e2ed97
	.word  0xc59adf61,0xc9a92927,0xbf6bb88e,0x3e4e8995
	.word  0x18588cb2,0xefb3bd55,0x05d5fb6e,0x0904df2a
	.word  0x0f488e48,0x971c5763,0x6ab4ea12,0x4ae3dc4a
	.word  0x71157372,0x89bf13e7,0x74d7c2e6,0xdf408f00
	.word  0x4ac36cfd,0xc26e95d0,0xa329b708,0x71bc7eed
	.word  0x4eb50c66,0x43467f68,0x71147476,0xc6e60303
	.word  0x25fa824c,0xbb22f144,0x93c9756a,0x915d11f8
	.word  0x6c2cc65f,0x472c8c12,0xa042829e,0xc67a1c21
	.word  0x378f83c4,0x8cc2307a,0x3d9d6f0e,0x172ebfd6
	.word  0x382b9751,0x8ecae653,0xcb3044cb,0xf738a9a9
	.word  0x4e91b96c,0x64a0572b,0x33a94a22,0xde20d359
	.word  0x63774b09,0xa51c9b90,0xdd5d24d5,0x7e794b1a
	.word  0x773a8645,0x0b1715be,0xfb93013d,0x53492f80
	.word  0xba8c2513,0x27e08c59,0x94f68259,0xe2ea6fa7
	.word  0x08c89989,0xc98f2eeb,0x4fee1f2f,0xc3a2dcba
	.word  0x5e96311f,0xbe5c5d57,0xb245aeb3,0x9987db29
	.word  0xcd0b1341,0x65ff4ea8,0x5fd1ebe6,0x2a597f94
	.word  0x3d49d142,0xcaee290b,0x280abbb3,0x3108d508
	.word  0xce105a42,0x7a827a6e,0xe042ffcf,0x3a01f68b
	.word  0x77439a40,0x0c0ae412,0x62915e3d,0xb51ddfe4
	.word  0x318bd48b,0x1957b1b0,0x004c49fd,0xf15cc4d7
	.word  0x80b4cb29,0xa8bf670d,0x81111d03,0xfdfbb972
	.word  0x12a52fb3,0x583b3784,0x216407db,0x9285335c
	.word  0x2c5e1dbb,0x8fee142e,0x11aa6882,0x4b63ca40
	.word  0x2b753119,0x1cb2bcc1,0xc18b7b6e,0xdd3c6905
	.word  0x7eafbb2a,0x19532571,0x59d0f30c,0x92c1e49b
	.word  0x587752e4,0xd30ac270,0x9bfe88c6,0x8913635e
	.word  0xdc0f8689,0x4a115d3f,0x48efd62c,0x7a2e107e
	.word  0xadde67dd,0xcc80040d,0xbaf5a83f,0xecd4042c
	.word  0x54b31691,0x32f5385e,0x250609b1,0xdaddd20b
	.word  0x86ebb5bd,0x63a99757,0xc386ee15,0x1081683b
	.word  0x8a46803d,0x6f283e33,0xb1c6278e,0xd8d8d2f9
	.word  0x2f64ffe2,0xbf6608d9,0x3e3c5520,0x98b57a7c
	.word  0x4b83cd8f,0x237218b1,0x8dd2bcd6,0xbbda3b92
	.word  0xfb43a323,0x0e76f21a,0x553de941,0x60bf2995
	.word  0x19ef4a24,0xb5de4128,0xa939b28a,0x9b049dd9
	.word  0x3921689f,0x53a138db,0x6f8b34f0,0xe1764986
	.word  0x3f5abe2c,0x02299790,0x9cf9ee13,0x909f5a88
	.word  0x6449eb26,0x75b116e5,0x6b204c6c,0x9f5b67c7
	.word  0x9b6817f6,0x42079bb3,0x661d1f5e,0xb6d948a1
	.word  0xc39871cd,0x823367e2,0xc05962ce,0x531dad87
	.word  0xb45f732c,0xb1f5d88d,0x2ca80fd0,0x918e0856
	.word  0xa752800e,0xe5721d79,0x2aa26daf,0x587d320c
	.word  0x36332209,0x6a0e8050,0x0d82ebc8,0x65fb2bf2
	.word  0x52aaf1df,0x4631bea3,0x79d6357c,0x91d33f86
	.word  0xaadd42c6,0xecba78f8,0xc9db6428,0x0c17bf37
	.word  0xd1a40ff7,0x10e32888,0x1872a4de,0xede6b9e1
	.word  0xb2af0e99,0x07b0472e,0x27118082,0x877a2f71
	.word  0x1ae5bd86,0x5011bb6e,0x74494672,0x42da5511
	.word  0xb459f24b,0x3d40ad32,0xccce01fd,0x21393fbc
	.word  0x0b1ce18c,0x707b8736,0x5b0925c6,0xd3105e6b
	.word  0x544a5653,0x7850fb48,0xda604ca1,0x0a28a1d4
	.word  0xa4cb2ec1,0x5abaa1f6,0xeee11e4b,0x1342a0a5
	.word  0x07aa25f0,0xd71c0b1f,0xfbcd204e,0xbd1d556b
	.word  0x6106be10,0x94e9ab93,0xc39889c0,0xb7da68b9
	.word  0x2fb97122,0x8d4c46d3,0x23259c31,0x7852848f
	.word  0x16ef6279,0x1f00f7f1,0x8ec23c0e,0x11c26c65
	.word  0x479edaa1,0x3117dcc3,0xa717fadc,0x11967b34
	.word  0x94f80167,0x23618c8b,0x411221f7,0xc363aed6
	.word  0x31e313a6,0x5603b639,0xf9ac25cd,0x7b0ecdab
	.word  0xc7d5234e,0x5aab954f,0xd8c7c146,0xb1aca9a7
	.word  0x7ef257a5,0x6da21540,0xb0277d97,0xbae70e21
	.word  0x42a6f809,0x353f6965,0x00e509d1,0x9f6efbb7
	.word  0x6ccf6e88,0x9769c1b5,0x229f47b4,0xec027256
	.word  0x665282a4,0x8a5a36db,0x6f618126,0xe370ed95
	.word  0x615f97fa,0x789517a4,0x4fb211a5,0x8c078dd0
	.word  0x296a8ae2,0x48487c88,0x17c2b55e,0x8d5d19da
	.word  0x207109aa,0x9fbaba47,0x307cf68c,0x950110d7
	.word  0xc59812f5,0xda01f153,0xe4fc045f,0x31dadeec
	.word  0x4b626f81,0xe7c1e413,0x90aec18f,0xc8d6271e
	.word  0x76ac1d0f,0x50bcb176,0xc3d40291,0x204483f2
	.word  0x7b1714b1,0x83ce4f14,0x2234576b,0x7452befe
	.word  0x54df5240,0xe67ab7a7,0x31a65c3f,0x101cc87b
	.word  0x4631cb93,0x631c8c20,0xc079abc3,0xfad1ad50
	.word  0x3259f4dc,0x2fdf0844,0x6515e27f,0xd17fe01b
	.word  0xf7798f8a,0x73ace93a,0x6f9a53d7,0xa16d5a79
	.word  0x2546d82e,0x18fa6521,0xf06c3f35,0xfdd45333
	.word  0x71256d88,0x21f811c6,0xe0981905,0x5fc6808e
	.word  0x2432a1fb,0x596c53ff,0x804b617e,0x651b9a69
	.word  0x35dd9908,0x56399903,0x38b9f911,0x1d1529df
	.word  0x3d3eb756,0x5c1465ef,0x230c342a,0x7f937541
	.word  0x36a1a446,0x8b965c7a,0xd98e7c78,0x73f65e95
	.word  0x5169b622,0x09f3612c,0xd1dbae99,0x06dd212f
	.word  0x35aa5946,0x7986def3,0xa208aabd,0x246c099d
	.word  0x2f4222ef,0xdfdda97b,0x86e7b5b0,0xeeddefba
	.word  0x409948a0,0x9dc5b006,0xaf717002,0x73b4921a
	.word  0xbc246e74,0xbc4bc041,0xb532e363,0x900d7455
	.word  0xb0cdfc08,0x2e0a22fb,0xc5a917ed,0x9f80682d
	.word  0x17b01a9d,0x26f227ff,0x87cebb36,0x3a3fdca4
	.word  0x30c3631e,0x4375d4d4,0x6b6bfc36,0xd25b4821
	.word  0xa9d7b873,0xcc17f4da,0x1a15b9ac,0xfb99e704
	.word  0x9a224d28,0xaaeef376,0x41c7a885,0x6ec7e072
	.word  0xe25d842b,0xe8ca0ede,0x29652691,0x51c82b30
	.word  0xcbde5d1f,0x30434083,0xa0c171b9,0x9202b456
	.word  0x37f6db26,0xe6ceab84,0x423e1990,0xfc6c3391
	.word  0xffa9fd33,0xede10ab0,0xa176d218,0x233e3a14
	.word  0xe6fc469e,0x99a81424,0x796ce279,0x8a205404
	.word  0xa36609dd,0xb49e7a35,0xaf8b4e5e,0xb7e4cea0
	.word  0x4976f3b3,0x424aafeb,0x8ab6c57b,0xdf2f2682
	.word  0xe671f387,0x0c0ffe54,0x4032567e,0xfcc132a2
	.word  0x78d243bc,0x308aa127,0xacd8e72b,0xafc53221
	.word  0xbbf98e3f,0x609d262d,0x0ed8ebf5,0x44e6f319
	.word  0x7a61c107,0x4ca3e2a1,0x0d432932,0x55b3a7ad
	.word  0x03037911,0xabd70960,0xde0d5edd,0xd61657ce
	.word  0x225818f1,0x39d7da73,0xe67d3699,0x15dec8b1
	.word  0xa0db1978,0x07f7d087,0xd8c6e9e3,0x4de75a73
	.word  0x82d0de43,0x9ce3b9c0,0x4d62c9f0,0xa6441bcd
	.word  0x16ca76e7,0xba922de3,0x430395e6,0x4bc64129
	.word  0x2118338a,0x55f2ee5a,0x04ec7497,0xe93bb20a
	.word  0x3587cb36,0x75526474,0x2eddefb4,0x73c2a5d7
	.word  0xa41ce716,0xcb4d9b2e,0xff264876,0x1e0da4a5
	.word  0xfd14892d,0x4f8262a6,0x6fc57d8f,0x1b406af3
	.word  0xd31f28c0,0x31d33034,0xb2f8d929,0xdd8bd9f3
	.word  0xb6afd46e,0x5b753047,0x1101e121,0x4ce78aca
	.word  0x9c682ba8,0x43174b3b,0xc73b4cda,0x1e12268e
	.word  0xeb90775d,0x66f0ee0f,0x0e397408,0xafcbdebb
	.word  0x0377609a,0x22743c51,0x0fc8431a,0x408a0af9
	.word  0x63a67106,0xaba1f185,0x10954bcc,0x841126fe
	.word  0xe2dc9922,0x11969c05,0xfc814733,0x3633eebd
	.word  0x23ca9562,0x0363e853,0x074da78a,0x871d44d0
	.word  0xd5f38f11,0xef6abab6,0x045680cc,0x45a6e37c
	.word  0x17fa4e17,0x1e87ca95,0x577a032c,0x82678d66
	.word  0xa811b1d6,0x2f6e9648,0xd70e82f3,0xa1146544
	.word  0x5a80a961,0xb6cba4cb,0xe08999f3,0xa189a723
	.word  0xa12cb117,0x64287443,0xb668a3e6,0xa27b0b9d
	.word  0xba2fe6c6,0x86a3c7fd,0x2aad4855,0xe93fbe61
	.word  0x66448309,0x11585342,0x2fa3128e,0x38f5bf3e
	.word  0x2d9e7e77,0x56781456,0xc90c755f,0xbfdd0508
	.word  0xf7b37b1d,0x26af78ed,0x39238f9d,0x7ba17e17
	.word  0x384a3bfc,0xd3140ff8,0x6e37ec63,0x84ecd156
	.word  0xde31a6b4,0x1ed41bee,0x16d0db28,0xad46ccc3
	.word  0x33cb05be,0x094fde75,0x49f1ceb0,0x2581dd2a
	.word  0x4943c71c,0x1f847659,0x4354f1d0,0xb0307c53
	.word  0xf19cfaac,0x9289f1f4,0x5375651f,0x132b37ae
	.word  0xed3d5c64,0x4c482fb5,0xa9135357,0x98f123ab
	.word  0xa0a2ee51,0xc6d33d8b,0x11d7670f,0x42283bad
	.word  0xc7526566,0xa72902b9,0xa3bae6aa,0x67a8bd27
	.word  0xdcf953d9,0xe4690566,0x28dd9d51,0x9bdb6122
	.word  0x1c0456f9,0xa458564b,0x74c37e60,0x3e33ad41
	.word  0xec0408fc,0xa48f05ba,0x845aebb5,0xeb0be0a4
	.word  0x2ba6eb08,0xe28a6219,0x8a96908d,0x2da83d9b
	.word  0x8c903b53,0xac4fe63a,0x004df719,0xfde6b6bb
	.word  0x9e03c0fa,0x99afb42c,0x18c2ce52,0x649f4643
	.word  0x3fe48edd,0x600ede8d,0x728d9b5c,0x68bc3c73
	.word  0x727ce25b,0x6d93b97f,0xe6fc5c4f,0xcd958bbd
	.word  0x7714841f,0x8bd81826,0x2b6e6fd4,0x2887e787
	.word  0x33dd5ee5,0xca8e9dc5,0x639a5b75,0x96538895
	.word  0x8a5683db,0x715b2b96,0xe61d97aa,0x18e639f4
	.word  0x1018f40c,0xce4e3317,0xf2025e57,0x0f3eebbe
	.word  0x79e415bc,0x41914945,0x1603ae60,0x6cc33875
	.word  0xf92b7eef,0x80a35981,0x8b02b597,0x2e9b1061
	.word  0xe636b609,0x3716ebaa,0xb111021d,0x783a8340
	.word  0xec6cf4fa,0x9bee1cbf,0xf5536bde,0x55b01750
	.word  0x18f31dc3,0x72e2cfad,0xf2f52661,0x5015dc25
	.word  0x66bda847,0x25d7bff2,0x88d6a0c8,0xed1fce40
	.word  0xdf03965d,0x99a13cee,0xd4276c02,0x7e122434
	.word  0xd9e4ac5a,0xc3d741a0,0xfadd28d4,0xd64913cb
	.word  0x7888fdee,0x10975fe5,0x008ba47d,0x64fe1e41
	.word  0x91ae4326,0x009ea7cc,0x46ecbfb0,0x82abfb36
	.word  0x7febef1a,0x129c0c43,0x9bcf74cd,0x630a7bea
	.word  0x44029f7f,0x54fa0764,0xc96c6a5a,0x8404f291
	.word  0x9662970e,0x4cecbf26,0x1bebdd77,0x7e5a8884
	.word  0x4abba3dc,0x6981c233,0xa5235b7e,0xae3c857b
	.word  0xe7ea582a,0x06b9d898,0x9f3340c1,0x7ca04eb3
	.word  0x51005b5f,0x362452b4,0x99be27bb,0xeb917b40
	.word  0x6f97aeb2,0x1f9e7db7,0x897c8f78,0xf52547f0
	.word  0xcbfc62c1,0x96bfefe1,0xa664488e,0xf05fd8c5
	.word  0xd99f637c,0x87836495,0x87047e57,0x844b57e4
	.word  0x894b52a0,0xb78522ba,0x46c11f8a,0x06262bb2
	.word  0x50a79f35,0x685e4fd4,0xf0da25ac,0x60d790c3
	.word  0x78e4aaf3,0x70deaf02,0x07969863,0xab19711f
	.word  0x0391b6ba,0x23c9b268,0x6d1de444,0x270b7ad8
	.word  0xf48d4dcb,0x6b71b4c3,0xd57010cf,0xbdf14c35
	.word  0x23a4628a,0xea0b37b5,0x2bedad76,0xb753ba55
	.word  0xdca31cae,0x34aafbd6,0xf21f7afa,0x971e9917
	.word  0x2a24dfb7,0xb61f50f5,0x366b0984,0x76687286
	.word  0xde73701b,0xc7c2a9ac,0x3692c873,0xe9614401
	.word  0x1cb63241,0xfed98269,0x9fe29973,0x9a4a7754
	.word  0x5a2d51e5,0x7f76d611,0xb9ecca11,0xa2ac7171
	.word  0x56eb6a1c,0x71736909,0x1442929b,0x6b807539
	.word  0x3ab1ecd7,0x3307b6d4,0xd0806d54,0x6b8c3ea8
	.word  0xebde39b0,0xca132810,0x4edd7876,0xeb86a8c1
	.word  0xb6fab1f6,0x187162a5,0xf854eed8,0x76ea7819
	.word  0x0dbd34ab,0xf632c5aa,0x66030d96,0x43c54918
	.word  0x9dd3821a,0x598dfa4b,0x73f78c70,0xc0f68ba1
	.word  0x21e5a997,0xfac43b2e,0x5daf904f,0x95c86cee
	.word  0xd5191209,0x17eb7558,0x9729f98a,0xd9c56136
	.word  0x1ca3ed59,0x3ae07e0e,0x0519a5b2,0x140bb900
	.word  0xed2873c9,0xc5562dc3,0xb7ee1363,0x80e72ca0
	.word  0xc46b0c2f,0x52a472d5,0x6f77ef23,0x6018e9b9
	.word  0xfcff8e03,0x17d47852,0x52e56d9a,0xf250ba0d
	.word  0x725f394a,0xab828c53,0x4a9a96e3,0x75617cb1
	.word  0x2c245d84,0x70139543,0x99b95bad,0x721d7550
	.word  0x293fc074,0x16d3d2a5,0xe1b3fce1,0x30aea892
	.word  0xe6209d1a,0x8bb35ea2,0xb6550b12,0x41e6a430
	.word  0xbd7eded0,0x90810e09,0x867afd04,0xad8898f9
	.word  0x45ec12f6,0x6acd26af,0x38480ebd,0xa75a7ae2
	.word  0x2d1bc7b7,0xaa621189,0x75ab7559,0x395098db
	.word  0x6b84cc57,0x316ed140,0xfe8d4ea5,0x01a2157b
	.word  0xc11e8dfc,0x39676f98,0x368ba974,0xd6f83764
	.word  0x0421233f,0xaea2e8b0,0xebc76a55,0xcb19cb26
	.word  0xf5fe8419,0x40a69ca3,0x60802450,0xfe05a230
	.word  0xfe32f946,0x3125172c,0x2da5c423,0x5210e582
	.word  0xef18f89c,0xc14cd40e,0x90fc0f87,0x6576d477
	.word  0x4fdb3614,0x6cc1e1b0,0xd939320c,0x1056a98a
	.word  0x57810bdb,0x5be10d17,0x5395d83a,0x3696a16c
	.word  0xbcd5d432,0x888c1396,0x27147f68,0xcb1315ea
	.word  0x716718a2,0x5fe7eaaa,0xdf6e17d1,0xe9e82949
	.word  0x59bf875a,0x6b84a0e3,0xe64c55f6,0x61f893a0
	.word  0xb7e5dd15,0xea491ced,0xc6125711,0x10fb6fa0
	.word  0x9f61fcea,0x613638f8,0x51606313,0x8acc9b8e
	.word  0x73f85c9d,0x7ddf7267,0x1655efa3,0xbb8bf3ef
	.word  0x61eabffc,0x4d0893f5,0x3da931a9,0x05570b39
	.word  0x52867855,0x78ff9108,0x9d6142be,0xb053ba9f
	.word  0xacdfa672,0x7c003bb1,0x9c56bcc6,0x7a49394f
	.word  0x650c645d,0x18fbcfaf,0x25c9c24c,0x765a6639
	.word  0x0eea8b33,0x0de2d83c,0xcbfd5ca0,0xed8789af
	.word  0x618988db,0x5090a86a,0xd39e517f,0x97e889b7
	.word  0x239ed563,0xa984741b,0x4f695a60,0x31dbee28
	.word  0x65849444,0x4a4d74dd,0xd4f5039a,0xe4687823
	.word  0x63f508bf,0x593c6e9a,0x65956b0a,0x45498d9f
	.word  0x64782ac2,0x5eb30f4c,0xeaf1aa10,0x15a962e8
	.word  0xa9ec6fdd,0x92d11199,0xa4c01267,0x51a4dc61
	.word  0xfe948a23,0x6301b104,0x79dc8f3f,0x88aea6fe
	.word  0xd58503a3,0xa39a6c28,0x46a2c4c1,0x81249db3
	.word  0x812d975d,0xd8453838,0x141cf056,0xef11eb6f
	.word  0x04097640,0xdb68481a,0x78c6a273,0x4d4531bf
	.word  0x055e811e,0x489da0fd,0xc11a0731,0xaa85199e
	.word  0x1ca8643e,0xd912088d,0x729a518e,0xccc95d47
	.word  0x84e68e58,0x64a6c0ed,0x8514ab7b,0xa014988d
	.word  0x2b50f3f0,0x91706c9f,0xf539e01a,0x3274380c
	.word  0x1c9c72ce,0x5a2c3f91,0xc5a620f7,0xdc2afc87
	.word  0x3ed48ade,0x6146d7cc,0x94d1e9ca,0x33d8d07b
	.word  0x3ffd8195,0xf0111fd9,0x210281b6,0xb052a0d6
	.word  0x2b298859,0x3dd92f6e,0x107f7592,0xb723ad95
	.word  0x821cdafd,0xe3853f0c,0x4c0fb42b,0xf75dd3c3
	.word  0xaf6b6811,0xa456ec13,0xea1049c2,0x31d4b7dd
	.word  0x47051629,0x2ce195b6,0x7f355f57,0x7fa0a870
	.word  0x930e3f80,0x2bd1d8a7,0xf4eb9dcc,0x06d5d429
	.word  0x648323e6,0x755c5ba1,0x14a097bc,0xa01bed9b
	.word  0x6caba203,0x17e45ba6,0x51ad4c75,0x89cec617
	.word  0xeb7b3768,0xa964cd3d,0xc6c3a07a,0x0e53f23f
	.word  0xae01d822,0x213db4d7,0x08c99a04,0xa6bbede8
	.word  0xc7cb90d8,0x1f9ae38b,0x014ce751,0x1215c1f7
	.word  0x2b5fbc5b,0x9ff2b43e,0xb3b56063,0xa644d257
	.word  0xb719d7c9,0x5bd8f7a3,0x5ea07688,0xcd0d7842
	.word  0xa4135466,0xb56fd676,0xcc7f5c58,0xd67de8ca
	.word  0xfa6ca4d8,0x61550bc9,0xae57c59a,0xd58d962e



#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   int i, j;
!!#   int irf_err_cnt = 0;
!!#   int dc_err_cnt = 0;
!!#   int intr_cnt = 0;
!!#   int thrid;
!!#   int burst_cnt = 0;
!!#   int bitnum = 0;
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
!!#   printf ("**********************************\n");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 51, ijdefault, Ft_Rs1, "{16}");
!!#   IJ_set_ropr_fld ("diag.j", 52, ijdefault, Ft_Rs2, "{17}");
!!#   IJ_set_ropr_fld ("diag.j", 53, ijdefault, Ft_Rd, "{1..15, 19..29}");
!!# //  IJ_set_ropr_fld (ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld ("diag.j", 55, ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!# //  IJ_set_ropr_fld (ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld ("diag.j", 57, ijdefault, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld ("diag.j", 58, ijdefault, Ft_Cc1_f2, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 59, ijdefault, Ft_Cc0_f2, "1'b0");
!!#   IJ_set_ropr_fld ("diag.j", 60, ijdefault, Ft_P, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 61, ijdefault, Ft_A, "1'br");  
!!#   IJ_set_ropr_fld ("diag.j", 62, ijdefault, Ft_D16, "{0x3, 0x4}");
!!#   IJ_set_ropr_fld ("diag.j", 63, ijdefault, Ft_Disp22, "{0x3, 0x4}");
!!#   IJ_set_ropr_fld ("diag.j", 64, ijdefault, Ft_Disp19, "{0x3, 0x4}");
!!#   IJ_set_ropr_fld ("diag.j", 65, ijdefault, Ft_Disp30, "{0x3, 0x4}");
!!#   IJ_set_ropr_fld ("diag.j", 66, ijdefault, Ft_Cmask, "3'brrr");
!!#   IJ_set_ropr_fld ("diag.j", 67, ijdefault, Ft_Mmask, "4'brrrr");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 69, Ro_unaligned_addr, Fm_align_Simm13, "3'b000");
!!#   IJ_set_ropr_fld ("diag.j", 70, Ro_unaligned_addr, Ft_Simm13, "13'b0rrrrrrrrrrr1");
!!# 
!!#   IJ_copy_ropr ("diag.j", 72, Ro_rsvd_set, ijdefault);
!!#   IJ_set_ropr_fld ("diag.j", 73, Ro_rsvd_set, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_bits ("diag.j", 74, Ro_rsvd_set, 0x1fe0, "13'b1r1r1rr100000");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 76, Ro_dev_null, Ft_Rd, "{0}");  
!!#   IJ_set_ropr_fld ("diag.j", 77, Ro_dcerr, Ft_Rs2, "{0}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 79, th_evnt, 0x7);
!!# //  IJ_bind_thread_group(th_evnt, 0xf);
!!#   IJ_bind_thread_group("diag.j", 81, th_intr, 0x8);
!!#   IJ_bind_thread_group("diag.j", 82, th_all, 0xf);
!!#   IJ_th_fork_group ("diag.j", 83, th_all);
!!# 
!!#   for (j = 0; j < 8; j++) {
!!# 
!!#      IJ_set_rvar ("diag.j", 87, reg_rand_init, "64'h0000000000000rr0");
!!# 
!!#      IJ_printf ("diag.j", 89, th_all, "        setx  MAIN_BASE_DATA_VA, %%r1, %%r16\n");
!!#      IJ_printf ("diag.j", 90, th_all, "        setx  0x%016llrx, %%g1, %%r17\n", reg_rand_init);
!!# 
!!#      IJ_set_rvar ("diag.j", 92, reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!# 
!!#      for (i = 0; i < 16; i++) {
!!#        IJ_printf ("diag.j", 95, th_all, "        setx  0x%016llrx, %%g1, %%r%d\n", reg_rand_init, i);
!!#      }
!!#      for (i = 18; i < 32; i++) {
!!#        IJ_printf ("diag.j", 98, th_all, "        setx  0x%016llrx, %%g1, %%r%d\n", reg_rand_init, i);
!!#      }
!!# 
!!#      IJ_printf ("diag.j", 101, th_all, "	save %%r0, %%r0, %%r31\n");
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 104, th_evnt, "        wr  %%g0, 0x80, %%asi\n");
!!#   IJ_printf ("diag.j", 105, th_evnt, "        wr %%g0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs ("diag.j", 106, th_evnt, 16);
!!#   IJ_set_default_rule_wt_rvar ("diag.j", 107,"{20}");
!!#   IJ_set_rvar ("diag.j", 108, low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 109, mid_wt, "{5}");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!#   IJ_printf ("diag.j", 112, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 113, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 114, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 115, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 116, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 117, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 118, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 119, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 120, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 121, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 122, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 123, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 124, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 125, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 126, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 127, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 128, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 129, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 130, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 131, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 132, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 133, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 134, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 135, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 136, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 137, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 138, th_all, "	nop\n");
!!#   IJ_th_join ("diag.j", 139,0xf);
!!#   IJ_th_start ("diag.j", 140,Seq_Start, NULL, 2); 
!!#   IJ_printf ("diag.j", 141, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 142, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 143, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 144, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 145, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 146, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 147, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 148, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 149, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 150, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 151, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 152, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 153, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 154, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 155, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 156, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 157, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 158, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 159, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 160, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 161, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 162, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 163, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 164, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 165, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 166, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 167, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 168, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 169, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 170, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 171, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 172, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 173, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 174, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 175, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 176, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 177, th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 179, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 180, th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 182, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 183, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#   }
!!# ;
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
!!# diag: intr_block inst_block
!!# ;
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!#             ;
!!# 
!!# inst_type: d45 loads rb_slt alu_burst
!!# 	   | d10 loads jmpl alu_burst %rvar  low_wt
!!# 	   | d20 loads_err rb_slt alu_burst
!!# 	   | d10 loads_err jmpl alu_burst %rvar  low_wt
!!# ;	  
!!# 
!!# loads: load
!!# 	{IJ_generate ("diag.j", 221, th_evnt, $1);}
!!#        | asi_load
!!# 	{IJ_generate ("diag.j", 223, th_evnt, $1);}
!!#        | ldfp
!!# 	{IJ_generate ("diag.j", 225, th_evnt, $1);}
!!# ;
!!# 
!!# loads_err: dcerr load %ropr  Ro_dcerr
!!#             {IJ_generate ("diag.j", 229, th_evnt, $2);}
!!# 	   | dcerr asi_load %ropr  Ro_dcerr
!!#             {IJ_generate ("diag.j", 231, th_evnt, $2);}
!!# 	   | dcerr ldfp %ropr  Ro_dcerr
!!#             {IJ_generate ("diag.j", 233, th_evnt, $2);}
!!# ;
!!# 
!!# dcerr: mMETA5
!!# {
!!#    IJ_printf ("diag.j", 238, th_evnt, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#    bitnum = random () % 72;
!!#    IJ_printf ("diag.j", 240, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_dc_err_%d), 16, 16),1,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# rb_slt: irferr inst
!!#            {
!!#                 IJ_generate ("diag.j", 247, th_evnt, $2);
!!#            }
!!# 	 | d90 inst
!!#            {
!!#                 IJ_generate ("diag.j", 251, th_evnt, $2);
!!#            }
!!# 	 | d101 flhw %rvar  mid_wt
!!# ;
!!# 
!!# d45: mMETA200
!!# ;
!!# 
!!# d101: mMETA101
!!# ;
!!# 
!!# d90: mMETA90
!!# ;
!!# 
!!# d100: mMETA100
!!# ;
!!# 
!!# d20: mMETA20
!!# ;
!!# 
!!# d30: mMETA30
!!# ;
!!# 
!!# flhw: d0 st_irferr_unalgn | rsvd_illinst %ropr  Ro_rsvd_set
!!# ;
!!# 
!!# jmpl: mMETAjmpl
!!#       {
!!#          if (random () % 2 == 0) {
!!#            IJ_printf ("diag.j", 280, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#            bitnum = random () % 72;
!!#            IJ_printf ("diag.j", 282, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#            irf_err_cnt++;	 
!!#          }
!!# 
!!#          if ((i = random () % 4) == 0) {
!!#            IJ_printf ("diag.j", 287, th_evnt, "\tjmpl     %%r18 + %%r17, %%r31\n");
!!#          } else if (i ==1) {
!!#            IJ_printf ("diag.j", 289, th_evnt, "\treturn     %%r18 + %%r17\n");
!!#          } else if (i == 2) {
!!# 	   IJ_printf ("diag.j", 291, th_evnt, "\tjmpl     %%r18 + 0x20, %%r31\n");
!!# 	 } else {
!!# 	   IJ_printf ("diag.j", 293, th_evnt, "\treturn     %%r18 + 0x20\n");	   
!!#          }
!!#       }
!!# ;
!!# 
!!# d10: mMETA10
!!# {
!!#        burst_cnt = random () % 3 + 5;
!!#        IJ_generate_from_token ("diag.j", 301,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;
!!#        IJ_printf ("diag.j", 302, th_evnt, "\trd      %%pc, %%r18\n");
!!#        IJ_printf ("diag.j", 303, th_evnt, "\tset     0x20, %%r17\n");  
!!# }
!!# ;
!!# 
!!# rsvd_illinst: alu_tokens %ropr  Ro_rsvd_set
!!# 		{IJ_printf ("diag.j", 308, th_evnt, "!Illinst alu\n");
!!# 		 IJ_generate ("diag.j", 309, th_evnt, $1);}
!!# 	      | store_r %ropr  Ro_rsvd_set
!!# 		{IJ_printf ("diag.j", 311, th_evnt, "!Illinst store\n");
!!# 		 IJ_generate ("diag.j", 312, th_evnt, $1);}
!!# ;
!!# 
!!# intr_block: mMETA18
!!# {
!!#       for (i = 0; i < 500; i++) {
!!#          burst_cnt = random () % 4 + 1;
!!#          thrid = random () % 3;
!!#          if (random () % 2 == 1) {
!!#            IJ_printf ("diag.j", 321, th_intr, "thr%y_nuke_intr_%d:\n", intr_cnt); 
!!#            IJ_printf ("diag.j", 322, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_nuke_intr_%d), 16, 16)) -> intp(%d, 2, 1)\n", intr_cnt,thrid);
!!#            intr_cnt++;
!!#            IJ_generate_from_token ("diag.j", 324,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;	
!!#            IJ_printf ("diag.j", 325, th_intr, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#            IJ_printf ("diag.j", 326, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(%d, 3, 1)\n", intr_cnt,thrid);
!!#            intr_cnt++;	   
!!#            IJ_generate_from_token ("diag.j", 328,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;	
!!#          } else {
!!#            IJ_printf ("diag.j", 330, th_intr, "thr%y_hw_intr_%d:\n", intr_cnt); 
!!#       	   IJ_printf ("diag.j", 331, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_hw_intr_%d), 16, 16)) -> intp(%d, 0, 1)\n", intr_cnt,thrid);  
!!#            burst_cnt = random () % 4 + 1;
!!# 	   intr_cnt++;
!!#            IJ_generate_from_token ("diag.j", 334,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;	
!!# 
!!#          }
!!#     }
!!# }
!!# ;
!!# 
!!# alu_burst: mMETA17
!!# { 
!!#    burst_cnt = random () % 4 + 5; 
!!#    if (burst_cnt > 0) {
!!#       IJ_generate_from_token ("diag.j", 345,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;
!!#    }
!!# }
!!# ;
!!# 
!!# st_irferr_unalgn: irferr store_i 
!!# 		    {
!!# 		       IJ_generate ("diag.j", 352, th_evnt, $2);
!!# 		    }
!!#                   |
!!# 		 d5 store_i %ropr  Ro_unaligned_addr
!!#                     {
!!# 		      IJ_generate ("diag.j", 357, th_evnt, $2);
!!#                     }
!!# 		  | d6 irferr store_i %ropr  Ro_unaligned_addr
!!#                     {
!!# 		      IJ_generate ("diag.j", 361, th_evnt, $3);
!!#                     }
!!# ;
!!# 
!!# irferr: mMETA100
!!# {
!!#      IJ_printf ("diag.j", 367, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf ("diag.j", 369, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# inst: mul | div | fpop | load | asi_load | asi_st | br_tokens | membar | atomic | flush | prefetch | halt | privop %ropr  Ro_dev_null | chpriv | win | fpdis | rdasr | wrasr | wrasi | ldfp
!!# ;
!!# 
!!# rdasr: mMETArdasr
!!# {
!!#        IJ_printf ("diag.j", 379, th_evnt, "\trd      %%asr26, %%r31\n");
!!#        IJ_printf ("diag.j", 380, th_evnt, "\tset     0x01f05, %%r30\n");
!!#        IJ_printf ("diag.j", 381, th_evnt, "\tand     %%r31, %%r30, %%r31\n");
!!# }
!!# ;
!!# 
!!# wrasi: mMETAwrasi
!!# {
!!#    IJ_printf ("diag.j", 387, th_evnt, "        wr  %%g0, 0x80, %%asi\n");
!!# }
!!# ;
!!# 
!!# wrasr: mMETAwrasr
!!# {
!!#      if (random () % 2 == 1) {
!!#        IJ_printf ("diag.j", 394, th_evnt, "\twr      %%r0, 0x1, %%asr26\n");
!!#      } else {
!!#        IJ_printf ("diag.j", 396, th_evnt, "\twr      %%r0, 0x5, %%asr26\n");
!!#      }
!!# }
!!# ;
!!# 
!!# fpdis: mMETAfpdis
!!# {
!!#   IJ_printf ("diag.j", 403, th_evnt, "        wr %%g0, 0x4, %%fprs\n");
!!# }
!!# ;
!!# 
!!# privop: tRDPR_TPC | tRDPR_TNPC | tRDPR_TSTATE | tRDPR_TT | tRDPR_TICK | tRDPR_TBA | tRDPR_PSTATE | tRDPR_TL | tRDPR_PIL | tRDPR_CWP | tRDPR_CANSAVE | tRDPR_CANRESTORE | tRDPR_CLEANWIN | tRDPR_OTHERWIN | tRDPR_WSTATE | tRDPR_FQ | tRDPR_VER | tRDY | tRDCCR | tRDASI | tRDTICK | tRDPC | tRDFPRS %ropr  Ro_dev_null | tRDHPR_HPSTATE | tRDHPR_HTSTATE | tRDHPR_HINTP | tRDHPR_HTBA | tWRPR_TICK_R | tWRY_R | tWRCCR_R | tWRTICK_R | tWRFPRS_R
!!# ;
!!# 
!!# chpriv: tCHANGE_PRIV | tCHANGE_NONPRIV | tCHANGE_HPRIV | tCHANGE_NONHPRIV
!!# ;
!!# 
!!# fpop:st_fp | arith_fp
!!# ;
!!# 
!!# mul: tMULX_R | tMULX_I | tUMUL_R | tUMUL_I | tSMUL_R | tSMUL_I | tUMULcc_R | tUMULcc_I | tSMULcc_R | tSMULcc_I | tMULScc_R | tMULScc_I
!!# ;
!!# 
!!# div: tUDIV_I | tUDIV_R | tSDIV_I | tSDIV_R | tSDIVX_R | tSDIVX_I | tUDIVX_R | tUDIVX_I | tUDIVcc_I | tUDIVcc_R | tSDIVcc_I | tSDIVcc_R
!!# ;
!!# 
!!# load: tLDSB_R | tLDSB_I | tLDSH_R | tLDSH_I | tLDSW_R | tLDSW_I | tLDUB_R | tLDUB_I | tLDUH_R | tLDUH_I | tLDUW_R | tLDUW_I | tLDX_R | tLDX_I | tLDD_R | tLDD_I 
!!# ;
!!# 
!!# asi_load: tLDSBA_R | tLDSBA_I | tLDSHA_R | tLDSHA_I | tLDSWA_R | tLDSWA_I | tLDUBA_R | tLDUBA_I | tLDUHA_R | tLDUHA_I | tLDUWA_R | tLDUWA_I | tLDXA_R | tLDXA_I | tLDDA_R | tLDDA_I 
!!# ;
!!# 
!!# asi_st: tSTBA_R | tSTBA_I | tSTHA_R | tSTHA_I | tSTWA_R | tSTWA_I | tSTXA_R | tSTXA_I | tSTDA_R | tSTDA_I 
!!# ;
!!# 
!!# br_tokens: tBA | tBN | tBNE | tBE | tBG | tBLE | tBGE | tBL | tBGU | 
!!#     tBLEU | tBCC | tBCS | tBPOS | tBNEG | tBVC | tBVS | tBRZ |
!!#     tBRLEZ | tBRLZ | tBRNZ | tBRGZ | tBRGEZ | tCALL 
!!# ;
!!# 
!!# membar: tMEMBAR | tSTBAR
!!# ;
!!# 
!!# atomic: tCASA_R | tCASA_I | tCASXA_R | tCASXA_I | tLDSTUBA_I | tLDSTUB_I | tLDSTUB_R | tLDSTUBA_R | tSWAP_I | tSWAP_R | tSWAPA_I | tSWAPA_R
!!# ;
!!# 
!!# st_fp: tSTF_R | tSTF_I | tSTDF_I | tSTDF_R
!!# ;
!!# 
!!# ldfp: tLDF_R | tLDF_I | tLDDF_R | tLDDF_I | tLDQF_R | tLDQF_I | tLDFA_R | tLDDFA_R | tLDQFA_R
!!# ;
!!# 
!!# arith_fp: tFADDs | tFXNORS | tFADDd | tFADDq | tFSUBs | tFMOVA | tFSUBd | tFMOVN | tFSUBq | tFMOVNE | tFCMPs | tFMOVE | tFCMPd | tFMOVG | tFCMPq | tFMOVLE | tFCMPEs | tFMOVGE | tFCMPEd | tFMOVL | tFCMPEq | tFMOVGU | tFsTOx | tFMOVLEU | tFdTOx | tFMOVCC | tFqTOx | tFMOVCS | tFsTOi | tFMOVPOS | tFdTOi | tFMOVNEG | tFqTOi | tFMOVVC | tFsTOd | tFMOVVS | tFsTOq | tFMOVRZ | tFdTOs | tFMOVRLEZ | tFdTOq | tFMOVRLZ | tFqTOs | tFMOVRNZ | tFqTOd | tFMOVRGZ | tFxTOs | tFMOVRGEZ | tFxTOd | tFxTOq | tFiTOs | tFiTOd | tFiTOq | tFMOVs | tFMOVd | tFMOVq | tFNEGs | tFNEGd | tFNEGq | tFABSs | tFABSd | tFABSq | tFMULs | tFMULd | tFMULq | tFsMULd | tFdMULq | tFDIVs | tFDIVd | tFDIVq | tFSQRTs | tFSQRTd | tFSQRTq | tFBA | tFBN | tFBU | tFBG | tFBL | tFBUL | tFBLG | tFBNE | tFBE | tFBUE | tFBGE | tFBUG | tFBLE | tFBO | tFBPA | tFBPN | tFBPE | tFBPG | tFBPU | tFBPL | tFBPO 
!!# ;
!!# 
!!# prefetch: tPREFETCH_I | tPREFETCH_R | tPREFETCHA_I | tPREFETCHA_R
!!# ;
!!# 
!!# flush: tFLUSH_I | tFLUSH_R | tFLUSHW
!!# ;
!!# 
!!# win: tSAVE_R | tRESTORE_R | tSAVED | tRESTORED
!!# ;
!!# 
!!# store_i: tSTB_I | tSTH_I | tSTW_I | tSTX_I 
!!# ;
!!# 
!!# store_r: tSTB_R | tSTH_R | tSTW_R | tSTX_R 
!!# ;
!!# 
!!# halt: mMETAhalt
!!# {
!!#      IJ_printf ("diag.j", 468, th_evnt, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#      IJ_printf ("diag.j", 469, th_evnt, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(%y, 3, 1)\n", intr_cnt);
!!#      if (random () % 2 == 1) {
!!#        IJ_printf ("diag.j", 471, th_evnt, "\twr      %%r0, 0x0, %%asr26\n");
!!#      } else {
!!#        IJ_printf ("diag.j", 473, th_evnt, "\twr      %%r0, 0x4, %%asr26\n");
!!#      }
!!#      intr_cnt++;
!!# }
!!# ;
!!# 
!!# d5: mMETA5
!!# ;
!!# 
!!# d6: mMETA6
!!# ;
!!# 
!!# alu_tokens: tADD_R | tADD_I | tADDcc_R 
!!# 			 |  tADDcc_I | tADDC_R | tADDC_I | tADDCcc_R | tADDCcc_I | tAND_R 
!!# 			 |  tAND_I | tANDcc_R | tANDcc_I | tANDN_R | tANDN_I | tANDNcc_R 
!!#                          |  tANDNcc_I | tOR_R | tOR_I | tORcc_R | tORcc_I | tORN_R | tORN_I 
!!#  			 |  tORNcc_R | tORNcc_I | tXOR_R | tXOR_I | tXORcc_R | tXORcc_I 
!!# 			 |  tXNOR_R | tXNOR_I | tXNORcc_R | tXNORcc_I | tMOVcc_R | tMOVcc_I 
!!#                        |  tMOVR_R | tMOVR_I | tSLL_R | tSLL_I | tSRL_R | tSRL_I | tSRA_R 
!!#                        |  tSRA_I | tSLLX_R | tSLLX_I | tSRLX_R | tSRLX_I | tSRAX_R 
!!#                        |  tSRAX_I | tSUB_R | tSUB_I | tSUBcc_R | tSUBcc_I | tSUBC_R | tSUBC_I 
!!# ;
!!# 
!!# d0: mMETA0
!!# ;
!!# 
!!# 
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif

