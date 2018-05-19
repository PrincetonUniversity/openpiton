// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug4330.s
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
   random seed:	948059082
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
        setx  0x0000000000000c40, %g1, %r17
        setx  0xd76f251b0a637b63, %g1, %r0
        setx  0xc591ae1d60bb1272, %g1, %r1
        setx  0x5528889e12c6f8d4, %g1, %r2
        setx  0x3d10a1b48410a438, %g1, %r3
        setx  0x9beb2d33c477313d, %g1, %r4
        setx  0x6b7a0e52c4b900fe, %g1, %r5
        setx  0xb343a85413c8f7f1, %g1, %r6
        setx  0x54b8599762f6d929, %g1, %r7
        setx  0xbaf17f9851d83c2a, %g1, %r8
        setx  0xe0691ad85a5f9d51, %g1, %r9
        setx  0xd9b20ef8d9c258d5, %g1, %r10
        setx  0xd4d9e5087cd40b9a, %g1, %r11
        setx  0xdc80312c70ce69db, %g1, %r12
        setx  0xb380f73b167ee044, %g1, %r13
        setx  0x13d5c9f74421eb70, %g1, %r14
        setx  0xffd5bd859b64033b, %g1, %r15
        setx  0x8c44ca3b5b8cbb06, %g1, %r18
        setx  0xb01bd908cdcfcd7b, %g1, %r19
        setx  0xce78dd26241d90b0, %g1, %r20
        setx  0xeefc49443fb0dc5b, %g1, %r21
        setx  0x728c9bdd93462bdd, %g1, %r22
        setx  0x56630224a026c8da, %g1, %r23
        setx  0x68b2cf4efebafd06, %g1, %r24
        setx  0x9db26851ea5235af, %g1, %r25
        setx  0x76c73cf1ad638216, %g1, %r26
        setx  0x65632c951ccff414, %g1, %r27
        setx  0x4f1068fde2177943, %g1, %r28
        setx  0xedc055aa445491db, %g1, %r29
        setx  0xce3c019405c5e877, %g1, %r30
        setx  0xa3d38b604b78e1d9, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000003d0, %g1, %r17
        setx  0x0e2c8f081aa93495, %g1, %r0
        setx  0xaf8ebd8183fb1038, %g1, %r1
        setx  0x3913aa1aa9b17647, %g1, %r2
        setx  0x1876033fcc3bd30a, %g1, %r3
        setx  0xee2be9e223e82ef4, %g1, %r4
        setx  0xeb2c3115545c6a88, %g1, %r5
        setx  0x83fc9905900180c6, %g1, %r6
        setx  0x2e8e55ee3b34cc43, %g1, %r7
        setx  0x12cfa9e5b3014d72, %g1, %r8
        setx  0xfe023d07dbde8b57, %g1, %r9
        setx  0x02688549fae9fae6, %g1, %r10
        setx  0xf8071d29614b57df, %g1, %r11
        setx  0xb434f8fcae414922, %g1, %r12
        setx  0x6531be28af25d686, %g1, %r13
        setx  0x8de7879f9248c384, %g1, %r14
        setx  0x867753107c1279c8, %g1, %r15
        setx  0xa88d8bac96f57800, %g1, %r18
        setx  0xa1ddb7c95b87255b, %g1, %r19
        setx  0x1e22411794b1a463, %g1, %r20
        setx  0x64b866998a6a41c5, %g1, %r21
        setx  0xacca1cfd4c60af13, %g1, %r22
        setx  0xca4986b7fd54d5f4, %g1, %r23
        setx  0x46bf913af49fa0fd, %g1, %r24
        setx  0xd7a05193f413a538, %g1, %r25
        setx  0xef02adfb5d9888b3, %g1, %r26
        setx  0x947b0b937ea3d692, %g1, %r27
        setx  0x41bc01dd695bd5ad, %g1, %r28
        setx  0x327aa9491bc455a2, %g1, %r29
        setx  0x0af0fcc311144ed3, %g1, %r30
        setx  0x715cad7e9f00ec3e, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000060, %g1, %r17
        setx  0x1c5cee70c335b0a5, %g1, %r0
        setx  0x53d8c317f60ecf02, %g1, %r1
        setx  0x4fa85ab56348e9c8, %g1, %r2
        setx  0x4e667bfe0df658c3, %g1, %r3
        setx  0xedaa5ddd64dbd906, %g1, %r4
        setx  0xc068368d31b7aba8, %g1, %r5
        setx  0x84aa648e43358107, %g1, %r6
        setx  0xc819ed79154abacb, %g1, %r7
        setx  0x9938918557322e33, %g1, %r8
        setx  0x6679b32b6c5e8549, %g1, %r9
        setx  0xcf2f8e8ea3287e9d, %g1, %r10
        setx  0xd41b6acb057ece51, %g1, %r11
        setx  0x74176b2707df1b5a, %g1, %r12
        setx  0x149e11d6a3ea2810, %g1, %r13
        setx  0x5fd64a6626118756, %g1, %r14
        setx  0x4212401c83ba42eb, %g1, %r15
        setx  0x25621b5670f6eb2e, %g1, %r18
        setx  0x1ae46bca91459ef8, %g1, %r19
        setx  0x85b572a34ab9cc33, %g1, %r20
        setx  0x214547faa1aef215, %g1, %r21
        setx  0xe03fe9f1fce14a36, %g1, %r22
        setx  0xc9262957e01e08ed, %g1, %r23
        setx  0x2df436a6b3941e5e, %g1, %r24
        setx  0x9db43d10af7c090f, %g1, %r25
        setx  0x7c3230aee7e2304f, %g1, %r26
        setx  0x0a5f81d9f98a4def, %g1, %r27
        setx  0x83e6d46797b89f7e, %g1, %r28
        setx  0xfc7f46586702850d, %g1, %r29
        setx  0x969b97208d48ec63, %g1, %r30
        setx  0x60c017e624042de1, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000002e0, %g1, %r17
        setx  0xbe3f77cebdb855e8, %g1, %r0
        setx  0x260ebe017e6413b3, %g1, %r1
        setx  0x8ba5a8a6c51f703c, %g1, %r2
        setx  0x02404aea6705cd38, %g1, %r3
        setx  0x55903ec79b8a5c27, %g1, %r4
        setx  0x46c9342b8d19a5d6, %g1, %r5
        setx  0x82e310d55907792b, %g1, %r6
        setx  0x9e09c2e28d35d782, %g1, %r7
        setx  0x17844d99da630b85, %g1, %r8
        setx  0x7fc3babaca92aef2, %g1, %r9
        setx  0x7f20c06bbfb9e3e0, %g1, %r10
        setx  0xb76f04ab837dbf71, %g1, %r11
        setx  0xc6673026b00323dc, %g1, %r12
        setx  0x5a72b54765408689, %g1, %r13
        setx  0x8d52180563b0a18a, %g1, %r14
        setx  0xc858dce1874d3ee0, %g1, %r15
        setx  0x38273bc53f4d1fc0, %g1, %r18
        setx  0x85cc6ad40915dfdc, %g1, %r19
        setx  0x33f9c3d4ab8e043a, %g1, %r20
        setx  0x4a6fd4439c482c53, %g1, %r21
        setx  0xb16c73d0f2542868, %g1, %r22
        setx  0x4f716acdc7384584, %g1, %r23
        setx  0xbf57df6ccb3dfcf9, %g1, %r24
        setx  0x4db9eec36e501faa, %g1, %r25
        setx  0x89c3c2529db41ef4, %g1, %r26
        setx  0xc5eb85d6be1983b7, %g1, %r27
        setx  0x81df5a1572b55477, %g1, %r28
        setx  0xd4a6cddf8909eb53, %g1, %r29
        setx  0x0a9ebf05b22606d7, %g1, %r30
        setx  0x7b063dae755d79b2, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000800, %g1, %r17
        setx  0x604e10a4ac1a28d1, %g1, %r0
        setx  0x73272a54c96f9a48, %g1, %r1
        setx  0x3461ecbda84c2b98, %g1, %r2
        setx  0xa18860c03a78f575, %g1, %r3
        setx  0x85738ff597c56124, %g1, %r4
        setx  0xf461822f5fbe49c3, %g1, %r5
        setx  0x8ad0f78367d4eddb, %g1, %r6
        setx  0x4d2667e6b26880ca, %g1, %r7
        setx  0x0455e2b30baa8922, %g1, %r8
        setx  0xbafad1a650f03fe4, %g1, %r9
        setx  0xa5878ace8422faae, %g1, %r10
        setx  0xcd70e34fc3570bea, %g1, %r11
        setx  0x9ed1e41f3dca3994, %g1, %r12
        setx  0x43ea2c4383ea368f, %g1, %r13
        setx  0xe5ae84fc80432cae, %g1, %r14
        setx  0x9a34332120c58bbb, %g1, %r15
        setx  0x517be0a30a796d20, %g1, %r18
        setx  0x4fc0e94ca8b4fd51, %g1, %r19
        setx  0xad6eada0224782b7, %g1, %r20
        setx  0x68ba7062de69c6c6, %g1, %r21
        setx  0x0ae587ab652414a6, %g1, %r22
        setx  0xd83daeabc7da1e1e, %g1, %r23
        setx  0x44b06521790c4d26, %g1, %r24
        setx  0x591b6882be2c4a26, %g1, %r25
        setx  0x732d25947de2e8c9, %g1, %r26
        setx  0xb1029ea2203c39dc, %g1, %r27
        setx  0xcf8d2f5fc56fb6b2, %g1, %r28
        setx  0xd38cb52f5ebc2f5e, %g1, %r29
        setx  0xaf8e0d05f519c894, %g1, %r30
        setx  0xf5bbea2718e3cc09, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000004f0, %g1, %r17
        setx  0xed73ad5d80a34f62, %g1, %r0
        setx  0x0b11cf18e65ca369, %g1, %r1
        setx  0x0df86dd1808c3523, %g1, %r2
        setx  0x266123345b5060d4, %g1, %r3
        setx  0xbf6aad3c11927323, %g1, %r4
        setx  0x422befbfbd7a970d, %g1, %r5
        setx  0x0ce772c4937e369a, %g1, %r6
        setx  0xc3bdf4aba00f4ef2, %g1, %r7
        setx  0xfc1894f7e9bd61fd, %g1, %r8
        setx  0x3272d8386d7f7c6c, %g1, %r9
        setx  0xf7c5d67f4bd5135d, %g1, %r10
        setx  0xb4a65551b411e441, %g1, %r11
        setx  0xec7c4b1f4308c40a, %g1, %r12
        setx  0xc9a23b04af974c9e, %g1, %r13
        setx  0x7f9dca4bc70ea02a, %g1, %r14
        setx  0xa1269f3ea789026f, %g1, %r15
        setx  0x90231160fc6c7100, %g1, %r18
        setx  0x64bdb49b197fcef0, %g1, %r19
        setx  0xc1957dc105e327f0, %g1, %r20
        setx  0xfd9f3d49bb75c7c7, %g1, %r21
        setx  0x0dffedc54999bb09, %g1, %r22
        setx  0x267e1d2e6cd11408, %g1, %r23
        setx  0x00843e49a906bc10, %g1, %r24
        setx  0xb5f1c2cea78dd419, %g1, %r25
        setx  0x8fadbc03157d6636, %g1, %r26
        setx  0x9cdd57038162fb9e, %g1, %r27
        setx  0x92d363da66164ebe, %g1, %r28
        setx  0x337a61c87ca29cee, %g1, %r29
        setx  0xcc64d61be02d18e8, %g1, %r30
        setx  0x3ec809b24c258c52, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000ef0, %g1, %r17
        setx  0xa7c38ad106fa914c, %g1, %r0
        setx  0xa5bf23f5528bf3f7, %g1, %r1
        setx  0xc1deef11e685f5b0, %g1, %r2
        setx  0x0d7d0725e98340c8, %g1, %r3
        setx  0xa3a110a40642c567, %g1, %r4
        setx  0x9ff6a3e783e81c03, %g1, %r5
        setx  0xaa7a18a3cb1e1c9e, %g1, %r6
        setx  0x9f6275d6bcb0630d, %g1, %r7
        setx  0x98a6d73ff222c369, %g1, %r8
        setx  0x15d31bbd4fcadeb4, %g1, %r9
        setx  0x43b2f1ab01cf2a76, %g1, %r10
        setx  0xb9da7f93b5966a60, %g1, %r11
        setx  0xbb372348900ace0a, %g1, %r12
        setx  0x6b61ea71222cabdc, %g1, %r13
        setx  0x994d9cb5a7ed5d72, %g1, %r14
        setx  0x836a902b6ef9621f, %g1, %r15
        setx  0x8b2564c5fa492f8b, %g1, %r18
        setx  0x597a436eae985716, %g1, %r19
        setx  0xd54b19bd5f856e5c, %g1, %r20
        setx  0x85352a72c9bb7c31, %g1, %r21
        setx  0xc69469a26813b950, %g1, %r22
        setx  0x0f8d4a8856118eb5, %g1, %r23
        setx  0xb7fc4e0ef7587419, %g1, %r24
        setx  0xdaad50cf79828c38, %g1, %r25
        setx  0x2bd74bbda903beab, %g1, %r26
        setx  0x2fca2a7e615a2724, %g1, %r27
        setx  0x2f4e1fb50c971f1c, %g1, %r28
        setx  0xf90aa462f3cb5faf, %g1, %r29
        setx  0x70572f3bdb046ae1, %g1, %r30
        setx  0xf3b968d11623ff89, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000f40, %g1, %r17
        setx  0xf3ee18293d307dba, %g1, %r0
        setx  0x448d259ae08d1db4, %g1, %r1
        setx  0xc7a01388267bd6b6, %g1, %r2
        setx  0x7409e6ad9755547e, %g1, %r3
        setx  0xaa9a49cb7f7f6d47, %g1, %r4
        setx  0x643ead61914d7d66, %g1, %r5
        setx  0x1c1a8a44c3befd47, %g1, %r6
        setx  0x88fcf9ef8f2341a4, %g1, %r7
        setx  0x2d2765124f82e919, %g1, %r8
        setx  0xd70e8c9c5b4d0359, %g1, %r9
        setx  0x79632237bb62090f, %g1, %r10
        setx  0x710e43541cffb78d, %g1, %r11
        setx  0xce57d8b2b753c5fb, %g1, %r12
        setx  0xf5217e759977c8ce, %g1, %r13
        setx  0x39b794016b42983e, %g1, %r14
        setx  0x95676e43d0dbcd54, %g1, %r15
        setx  0x9e4213c8cae7eea7, %g1, %r18
        setx  0xd9fae651b72bc25e, %g1, %r19
        setx  0x486f4de7b411acae, %g1, %r20
        setx  0x2500ab0b99b7d0de, %g1, %r21
        setx  0xad6373d9ffd0ad54, %g1, %r22
        setx  0x20662e51eb691c40, %g1, %r23
        setx  0xeec9848a47793b90, %g1, %r24
        setx  0xef00c56a0c3fa1cd, %g1, %r25
        setx  0xd3900b138742d6bb, %g1, %r26
        setx  0x0b76db6299ace0f4, %g1, %r27
        setx  0x6e53eac00576a2e2, %g1, %r28
        setx  0x678b1e18cd8c7be9, %g1, %r29
        setx  0x45e567a6d340b88d, %g1, %r30
        setx  0xd8559a25a4ee44e4, %g1, %r31
	save %r0, %r0, %r31
thr3_hw_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_0), 16, 16)) -> intp(1, 0, 1)
	.word 0xacc42208  ! 1: ADDCcc_I	addccc 	%r16, 0x0208, %r22
	.word 0xaa0c0011  ! 1: AND_R	and 	%r16, %r17, %r21
thr3_hw_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1), 16, 16)) -> intp(1, 0, 1)
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
thr3_hw_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_2), 16, 16)) -> intp(1, 0, 1)
	.word 0x892c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r4
thr3_nuke_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_3), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x8a842108  ! 1: ADDcc_I	addcc 	%r16, 0x0108, %r5
	.word 0xab340011  ! 1: SRL_R	srl 	%r16, %r17, %r21
	.word 0x843c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r2
thr3_resum_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
	.word 0x90bc2c5f  ! 1: XNORcc_I	xnorcc 	%r16, 0x0c5f, %r8
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
	.word 0xae9c2316  ! 1: XORcc_I	xorcc 	%r16, 0x0316, %r23
	.word 0xb04420cc  ! 1: ADDC_I	addc 	%r16, 0x00cc, %r24
thr3_nuke_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_5), 16, 16)) -> intp(0, 2, 1)
	.word 0xb42c2df0  ! 1: ANDN_I	andn 	%r16, 0x0df0, %r26
	.word 0xb68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r27
thr3_resum_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_6), 16, 16)) -> intp(0, 3, 1)
	.word 0xa9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r20
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0xb89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r28
thr3_nuke_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_7), 16, 16)) -> intp(0, 2, 1)
	.word 0xaeac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
	.word 0xac8c21ca  ! 1: ANDcc_I	andcc 	%r16, 0x01ca, %r22
thr3_resum_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_8), 16, 16)) -> intp(0, 3, 1)
	.word 0xb72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r27
	.word 0x8c9c201e  ! 1: XORcc_I	xorcc 	%r16, 0x001e, %r6
	.word 0x9cc42992  ! 1: ADDCcc_I	addccc 	%r16, 0x0992, %r14
thr3_hw_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_9), 16, 16)) -> intp(2, 0, 1)
	.word 0x901c0011  ! 1: XOR_R	xor 	%r16, %r17, %r8
	.word 0xb9643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb8042d6a  ! 1: ADD_I	add 	%r16, 0x0d6a, %r28
thr3_hw_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_10), 16, 16)) -> intp(2, 0, 1)
	.word 0xb73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r27
	.word 0x977c2401  ! 1: MOVR_I	move	%r16, 0x11, %r11
thr3_nuke_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_11), 16, 16)) -> intp(2, 2, 1)
	.word 0x98b429bc  ! 1: ORNcc_I	orncc 	%r16, 0x09bc, %r12
	.word 0xaa940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0xae0c0011  ! 1: AND_R	and 	%r16, %r17, %r23
thr3_resum_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_12), 16, 16)) -> intp(2, 3, 1)
	.word 0x9eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x9aac21a0  ! 1: ANDNcc_I	andncc 	%r16, 0x01a0, %r13
thr3_hw_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_13), 16, 16)) -> intp(2, 0, 1)
	.word 0xb7340011  ! 1: SRL_R	srl 	%r16, %r17, %r27
	.word 0xb13c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r24
thr3_nuke_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_14), 16, 16)) -> intp(0, 2, 1)
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
	.word 0x9c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0xae9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r23
thr3_resum_intr_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_15), 16, 16)) -> intp(0, 3, 1)
	.word 0x88bc2311  ! 1: XNORcc_I	xnorcc 	%r16, 0x0311, %r4
	.word 0x87643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
thr3_hw_intr_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_16), 16, 16)) -> intp(0, 0, 1)
	.word 0x873c1011  ! 1: SRAX_R	srax	%r16, %r17, %r3
	.word 0x90c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x8cbc2ad7  ! 1: XNORcc_I	xnorcc 	%r16, 0x0ad7, %r6
	.word 0xb8140011  ! 1: OR_R	or 	%r16, %r17, %r28
thr3_nuke_intr_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_17), 16, 16)) -> intp(1, 2, 1)
	.word 0xba340011  ! 1: ORN_R	orn 	%r16, %r17, %r29
	.word 0x8b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0xb23c2d75  ! 1: XNOR_I	xnor 	%r16, 0x0d75, %r25
thr3_resum_intr_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_18), 16, 16)) -> intp(1, 3, 1)
	.word 0x820c2333  ! 1: AND_I	and 	%r16, 0x0333, %r1
	.word 0xae8c20aa  ! 1: ANDcc_I	andcc 	%r16, 0x00aa, %r23
	.word 0x9b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r13
	.word 0x9d641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_19), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xbb3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r29
	.word 0x957c2401  ! 1: MOVR_I	move	%r16, 0x11, %r10
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
thr3_nuke_intr_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_20), 16, 16)) -> intp(0, 2, 1)
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x9b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r13
thr3_resum_intr_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_21), 16, 16)) -> intp(0, 3, 1)
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
thr3_hw_intr_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_22), 16, 16)) -> intp(2, 0, 1)
	.word 0x8c0c2892  ! 1: AND_I	and 	%r16, 0x0892, %r6
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x99340011  ! 1: SRL_R	srl 	%r16, %r17, %r12
	.word 0xacb42e57  ! 1: ORNcc_I	orncc 	%r16, 0x0e57, %r22
thr3_hw_intr_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_23), 16, 16)) -> intp(0, 0, 1)
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
	.word 0xb52c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r26
thr3_hw_intr_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_24), 16, 16)) -> intp(0, 0, 1)
	.word 0x942c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x92442db7  ! 1: ADDC_I	addc 	%r16, 0x0db7, %r9
thr3_nuke_intr_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_25), 16, 16)) -> intp(2, 2, 1)
	.word 0x9e3c272d  ! 1: XNOR_I	xnor 	%r16, 0x072d, %r15
	.word 0x9cc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
thr3_resum_intr_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_26), 16, 16)) -> intp(2, 3, 1)
	.word 0xa6342830  ! 1: ORN_I	orn 	%r16, 0x0830, %r19
	.word 0xae2c2e84  ! 1: ANDN_I	andn 	%r16, 0x0e84, %r23
	.word 0xb42c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r26
	.word 0x948c20fb  ! 1: ANDcc_I	andcc 	%r16, 0x00fb, %r10
thr3_hw_intr_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_27), 16, 16)) -> intp(0, 0, 1)
	.word 0xae0c0011  ! 1: AND_R	and 	%r16, %r17, %r23
thr3_nuke_intr_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_28), 16, 16)) -> intp(1, 2, 1)
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x8b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0x862c22be  ! 1: ANDN_I	andn 	%r16, 0x02be, %r3
	.word 0x88c429f0  ! 1: ADDCcc_I	addccc 	%r16, 0x09f0, %r4
thr3_resum_intr_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_29), 16, 16)) -> intp(1, 3, 1)
	.word 0xb53c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0x9eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0xaeb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r23
thr3_nuke_intr_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_30), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c340011  ! 1: ORN_R	orn 	%r16, %r17, %r6
	.word 0xbac4220e  ! 1: ADDCcc_I	addccc 	%r16, 0x020e, %r29
	.word 0x92040011  ! 1: ADD_R	add 	%r16, %r17, %r9
thr3_resum_intr_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_31), 16, 16)) -> intp(1, 3, 1)
	.word 0xb12c0011  ! 1: SLL_R	sll 	%r16, %r17, %r24
	.word 0x88142699  ! 1: OR_I	or 	%r16, 0x0699, %r4
	.word 0x9e0c24dc  ! 1: AND_I	and 	%r16, 0x04dc, %r15
thr3_hw_intr_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_32), 16, 16)) -> intp(2, 0, 1)
	.word 0x99340011  ! 1: SRL_R	srl 	%r16, %r17, %r12
thr3_hw_intr_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_33), 16, 16)) -> intp(2, 0, 1)
	.word 0x8cac20c5  ! 1: ANDNcc_I	andncc 	%r16, 0x00c5, %r6
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0x9634245b  ! 1: ORN_I	orn 	%r16, 0x045b, %r11
thr3_hw_intr_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_34), 16, 16)) -> intp(0, 0, 1)
	.word 0x9b340011  ! 1: SRL_R	srl 	%r16, %r17, %r13
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
	.word 0xa8ac2e0d  ! 1: ANDNcc_I	andncc 	%r16, 0x0e0d, %r20
	.word 0xb2ac2fc9  ! 1: ANDNcc_I	andncc 	%r16, 0x0fc9, %r25
thr3_nuke_intr_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_35), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a0c0011  ! 1: AND_R	and 	%r16, %r17, %r5
	.word 0x881c2d42  ! 1: XOR_I	xor 	%r16, 0x0d42, %r4
	.word 0x84340011  ! 1: ORN_R	orn 	%r16, %r17, %r2
thr3_resum_intr_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_36), 16, 16)) -> intp(1, 3, 1)
	.word 0xacac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0x82b42c31  ! 1: ORNcc_I	orncc 	%r16, 0x0c31, %r1
	.word 0x88440011  ! 1: ADDC_R	addc 	%r16, %r17, %r4
thr3_nuke_intr_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_37), 16, 16)) -> intp(1, 2, 1)
	.word 0x94bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x9b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r13
	.word 0x9cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
thr3_resum_intr_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_38), 16, 16)) -> intp(1, 3, 1)
	.word 0xb4ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0xaa342d1f  ! 1: ORN_I	orn 	%r16, 0x0d1f, %r21
thr3_hw_intr_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_39), 16, 16)) -> intp(2, 0, 1)
	.word 0x9e340011  ! 1: ORN_R	orn 	%r16, %r17, %r15
thr3_hw_intr_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_40), 16, 16)) -> intp(2, 0, 1)
	.word 0x8f641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
thr3_hw_intr_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_41), 16, 16)) -> intp(0, 0, 1)
	.word 0x90040011  ! 1: ADD_R	add 	%r16, %r17, %r8
	.word 0x9a2c2407  ! 1: ANDN_I	andn 	%r16, 0x0407, %r13
thr3_hw_intr_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_42), 16, 16)) -> intp(2, 0, 1)
	.word 0x9cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r14
thr3_hw_intr_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_43), 16, 16)) -> intp(2, 0, 1)
	.word 0xaebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r23
	.word 0x8e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r7
	.word 0x873c1011  ! 1: SRAX_R	srax	%r16, %r17, %r3
	.word 0x96040011  ! 1: ADD_R	add 	%r16, %r17, %r11
thr3_hw_intr_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_44), 16, 16)) -> intp(1, 0, 1)
	.word 0x993c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x8cc42bf5  ! 1: ADDCcc_I	addccc 	%r16, 0x0bf5, %r6
thr3_nuke_intr_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_45), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6bc2f35  ! 1: XNORcc_I	xnorcc 	%r16, 0x0f35, %r27
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
thr3_resum_intr_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_46), 16, 16)) -> intp(0, 3, 1)
	.word 0x89643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9f7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r15
	.word 0x94bc20fe  ! 1: XNORcc_I	xnorcc 	%r16, 0x00fe, %r10
	.word 0x863c2866  ! 1: XNOR_I	xnor 	%r16, 0x0866, %r3
thr3_nuke_intr_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_47), 16, 16)) -> intp(0, 2, 1)
	.word 0x9b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r13
	.word 0x9c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r14
	.word 0x833c0011  ! 1: SRA_R	sra 	%r16, %r17, %r1
	.word 0xba140011  ! 1: OR_R	or 	%r16, %r17, %r29
thr3_resum_intr_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_48), 16, 16)) -> intp(0, 3, 1)
	.word 0xae2c2129  ! 1: ANDN_I	andn 	%r16, 0x0129, %r23
thr3_hw_intr_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_49), 16, 16)) -> intp(2, 0, 1)
	.word 0x82942e01  ! 1: ORcc_I	orcc 	%r16, 0x0e01, %r1
	.word 0xb20c0011  ! 1: AND_R	and 	%r16, %r17, %r25
thr3_hw_intr_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_50), 16, 16)) -> intp(1, 0, 1)
	.word 0x9eac2a62  ! 1: ANDNcc_I	andncc 	%r16, 0x0a62, %r15
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
thr3_nuke_intr_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_51), 16, 16)) -> intp(2, 2, 1)
	.word 0x932c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x91340011  ! 1: SRL_R	srl 	%r16, %r17, %r8
thr3_resum_intr_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_52), 16, 16)) -> intp(2, 3, 1)
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
thr3_nuke_intr_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_53), 16, 16)) -> intp(0, 2, 1)
	.word 0x90140011  ! 1: OR_R	or 	%r16, %r17, %r8
	.word 0xb40427ca  ! 1: ADD_I	add 	%r16, 0x07ca, %r26
thr3_resum_intr_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_54), 16, 16)) -> intp(0, 3, 1)
	.word 0xac3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0xa9340011  ! 1: SRL_R	srl 	%r16, %r17, %r20
thr3_nuke_intr_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_55), 16, 16)) -> intp(2, 2, 1)
	.word 0xb52c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
	.word 0x82bc2362  ! 1: XNORcc_I	xnorcc 	%r16, 0x0362, %r1
thr3_resum_intr_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_56), 16, 16)) -> intp(2, 3, 1)
	.word 0x904422ec  ! 1: ADDC_I	addc 	%r16, 0x02ec, %r8
	.word 0xaabc216d  ! 1: XNORcc_I	xnorcc 	%r16, 0x016d, %r21
	.word 0xb8ac2f7a  ! 1: ANDNcc_I	andncc 	%r16, 0x0f7a, %r28
thr3_hw_intr_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_57), 16, 16)) -> intp(2, 0, 1)
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x9a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0xb03c2934  ! 1: XNOR_I	xnor 	%r16, 0x0934, %r24
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
thr3_nuke_intr_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_58), 16, 16)) -> intp(0, 2, 1)
	.word 0xb08c2d5c  ! 1: ANDcc_I	andcc 	%r16, 0x0d5c, %r24
	.word 0x920c2579  ! 1: AND_I	and 	%r16, 0x0579, %r9
thr3_resum_intr_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_59), 16, 16)) -> intp(0, 3, 1)
	.word 0xb4c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r26
thr3_hw_intr_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_60), 16, 16)) -> intp(1, 0, 1)
	.word 0x923c2c1a  ! 1: XNOR_I	xnor 	%r16, 0x0c1a, %r9
	.word 0x92ac2c75  ! 1: ANDNcc_I	andncc 	%r16, 0x0c75, %r9
thr3_nuke_intr_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_61), 16, 16)) -> intp(2, 2, 1)
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
	.word 0x94c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r10
thr3_resum_intr_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_62), 16, 16)) -> intp(2, 3, 1)
	.word 0x943420c9  ! 1: ORN_I	orn 	%r16, 0x00c9, %r10
thr3_nuke_intr_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_63), 16, 16)) -> intp(1, 2, 1)
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
	.word 0x828c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x963c2128  ! 1: XNOR_I	xnor 	%r16, 0x0128, %r11
	.word 0xac0c2344  ! 1: AND_I	and 	%r16, 0x0344, %r22
thr3_resum_intr_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_64), 16, 16)) -> intp(1, 3, 1)
	.word 0x83641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_65), 16, 16)) -> intp(1, 0, 1)
	.word 0xa6bc233f  ! 1: XNORcc_I	xnorcc 	%r16, 0x033f, %r19
	.word 0x948c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r10
thr3_nuke_intr_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_66), 16, 16)) -> intp(2, 2, 1)
	.word 0xa9342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r20
thr3_resum_intr_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_67), 16, 16)) -> intp(2, 3, 1)
	.word 0x82442957  ! 1: ADDC_I	addc 	%r16, 0x0957, %r1
	.word 0x9f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r15
thr3_nuke_intr_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_68), 16, 16)) -> intp(2, 2, 1)
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0xb52c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xaa9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r21
thr3_resum_intr_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_69), 16, 16)) -> intp(2, 3, 1)
	.word 0x86b42f81  ! 1: ORNcc_I	orncc 	%r16, 0x0f81, %r3
	.word 0x9f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r15
thr3_hw_intr_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_70), 16, 16)) -> intp(0, 0, 1)
	.word 0xb37c0411  ! 1: MOVR_R	move	%r16, %r17, %r25
	.word 0xac2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r22
	.word 0xb9342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0x94ac2d74  ! 1: ANDNcc_I	andncc 	%r16, 0x0d74, %r10
thr3_hw_intr_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_71), 16, 16)) -> intp(1, 0, 1)
	.word 0x82942c3a  ! 1: ORcc_I	orcc 	%r16, 0x0c3a, %r1
thr3_nuke_intr_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_72), 16, 16)) -> intp(1, 2, 1)
	.word 0x9eb42b03  ! 1: ORNcc_I	orncc 	%r16, 0x0b03, %r15
thr3_resum_intr_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_73), 16, 16)) -> intp(1, 3, 1)
	.word 0xa62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r19
	.word 0x8e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r7
thr3_nuke_intr_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_74), 16, 16)) -> intp(1, 2, 1)
	.word 0x8d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r6
thr3_resum_intr_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_75), 16, 16)) -> intp(1, 3, 1)
	.word 0x94b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r10
thr3_nuke_intr_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_76), 16, 16)) -> intp(0, 2, 1)
	.word 0x9b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0x92c42f21  ! 1: ADDCcc_I	addccc 	%r16, 0x0f21, %r9
	.word 0x9e9c2d3f  ! 1: XORcc_I	xorcc 	%r16, 0x0d3f, %r15
thr3_resum_intr_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_77), 16, 16)) -> intp(0, 3, 1)
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0xad3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
thr3_hw_intr_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_78), 16, 16)) -> intp(0, 0, 1)
	.word 0x9f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0x90340011  ! 1: ORN_R	orn 	%r16, %r17, %r8
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
thr3_hw_intr_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_79), 16, 16)) -> intp(1, 0, 1)
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
	.word 0xb42c29a3  ! 1: ANDN_I	andn 	%r16, 0x09a3, %r26
thr3_nuke_intr_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_80), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a8c2fe0  ! 1: ANDcc_I	andcc 	%r16, 0x0fe0, %r13
	.word 0x86940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x96bc2386  ! 1: XNORcc_I	xnorcc 	%r16, 0x0386, %r11
	.word 0xa9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r20
thr3_resum_intr_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_81), 16, 16)) -> intp(2, 3, 1)
	.word 0xa8442035  ! 1: ADDC_I	addc 	%r16, 0x0035, %r20
	.word 0x82442a0d  ! 1: ADDC_I	addc 	%r16, 0x0a0d, %r1
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
thr3_nuke_intr_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_82), 16, 16)) -> intp(1, 2, 1)
	.word 0x97643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_83), 16, 16)) -> intp(1, 3, 1)
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
thr3_nuke_intr_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_84), 16, 16)) -> intp(0, 2, 1)
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
thr3_resum_intr_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_85), 16, 16)) -> intp(0, 3, 1)
	.word 0x99643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xacb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
thr3_nuke_intr_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_86), 16, 16)) -> intp(0, 2, 1)
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
thr3_resum_intr_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_87), 16, 16)) -> intp(0, 3, 1)
	.word 0x92840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0x820c242b  ! 1: AND_I	and 	%r16, 0x042b, %r1
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
thr3_hw_intr_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_88), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0xb49c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
thr3_hw_intr_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_89), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a3c2d32  ! 1: XNOR_I	xnor 	%r16, 0x0d32, %r13
	.word 0xac440011  ! 1: ADDC_R	addc 	%r16, %r17, %r22
	.word 0xb42c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r26
thr3_hw_intr_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_90), 16, 16)) -> intp(0, 0, 1)
	.word 0xb53c1011  ! 1: SRAX_R	srax	%r16, %r17, %r26
thr3_nuke_intr_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_91), 16, 16)) -> intp(0, 2, 1)
	.word 0x93643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_92), 16, 16)) -> intp(0, 3, 1)
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x952c0011  ! 1: SLL_R	sll 	%r16, %r17, %r10
	.word 0x90bc2ed7  ! 1: XNORcc_I	xnorcc 	%r16, 0x0ed7, %r8
thr3_nuke_intr_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_93), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x981c0011  ! 1: XOR_R	xor 	%r16, %r17, %r12
thr3_resum_intr_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_94), 16, 16)) -> intp(2, 3, 1)
	.word 0x82340011  ! 1: ORN_R	orn 	%r16, %r17, %r1
	.word 0x923c2f99  ! 1: XNOR_I	xnor 	%r16, 0x0f99, %r9
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
thr3_hw_intr_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_95), 16, 16)) -> intp(0, 0, 1)
	.word 0x861c2802  ! 1: XOR_I	xor 	%r16, 0x0802, %r3
	.word 0x84c4230a  ! 1: ADDCcc_I	addccc 	%r16, 0x030a, %r2
	.word 0xb00c2f3e  ! 1: AND_I	and 	%r16, 0x0f3e, %r24
thr3_nuke_intr_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_96), 16, 16)) -> intp(1, 2, 1)
	.word 0x908c2585  ! 1: ANDcc_I	andcc 	%r16, 0x0585, %r8
thr3_resum_intr_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_97), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r21
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
thr3_hw_intr_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_98), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
thr3_nuke_intr_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_99), 16, 16)) -> intp(0, 2, 1)
	.word 0xa81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r20
	.word 0x88440011  ! 1: ADDC_R	addc 	%r16, %r17, %r4
	.word 0xb0940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0x84140011  ! 1: OR_R	or 	%r16, %r17, %r2
thr3_resum_intr_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_100), 16, 16)) -> intp(0, 3, 1)
	.word 0x892c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r4
	.word 0x957c0411  ! 1: MOVR_R	move	%r16, %r17, %r10
	.word 0xb0b426de  ! 1: ORNcc_I	orncc 	%r16, 0x06de, %r24
	.word 0x869c2cd6  ! 1: XORcc_I	xorcc 	%r16, 0x0cd6, %r3
thr3_nuke_intr_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_101), 16, 16)) -> intp(1, 2, 1)
	.word 0xa83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0x86bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x92342702  ! 1: ORN_I	orn 	%r16, 0x0702, %r9
thr3_resum_intr_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_102), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c0423f3  ! 1: ADD_I	add 	%r16, 0x03f3, %r6
thr3_nuke_intr_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_103), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c942325  ! 1: ORcc_I	orcc 	%r16, 0x0325, %r6
	.word 0xb4840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r26
thr3_resum_intr_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_104), 16, 16)) -> intp(2, 3, 1)
	.word 0x9aac2891  ! 1: ANDNcc_I	andncc 	%r16, 0x0891, %r13
	.word 0x8b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r5
thr3_hw_intr_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_105), 16, 16)) -> intp(1, 0, 1)
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0x92c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r9
thr3_nuke_intr_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_106), 16, 16)) -> intp(0, 2, 1)
	.word 0x95343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0x9a2c26b1  ! 1: ANDN_I	andn 	%r16, 0x06b1, %r13
thr3_resum_intr_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_107), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
thr3_nuke_intr_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_108), 16, 16)) -> intp(1, 2, 1)
	.word 0xb77c2401  ! 1: MOVR_I	move	%r16, 0x11, %r27
	.word 0x9d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb6bc26bd  ! 1: XNORcc_I	xnorcc 	%r16, 0x06bd, %r27
	.word 0xae1c29e2  ! 1: XOR_I	xor 	%r16, 0x09e2, %r23
thr3_resum_intr_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_109), 16, 16)) -> intp(1, 3, 1)
	.word 0x8a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
thr3_nuke_intr_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_110), 16, 16)) -> intp(1, 2, 1)
	.word 0xbab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x96c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r11
thr3_resum_intr_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_111), 16, 16)) -> intp(1, 3, 1)
	.word 0x96b4287c  ! 1: ORNcc_I	orncc 	%r16, 0x087c, %r11
	.word 0xae042522  ! 1: ADD_I	add 	%r16, 0x0522, %r23
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
thr3_hw_intr_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_112), 16, 16)) -> intp(0, 0, 1)
	.word 0xaeac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0x9f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xad343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r22
	.word 0x9e842542  ! 1: ADDcc_I	addcc 	%r16, 0x0542, %r15
thr3_hw_intr_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_113), 16, 16)) -> intp(2, 0, 1)
	.word 0x8d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0xb12c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r24
	.word 0x8abc2db8  ! 1: XNORcc_I	xnorcc 	%r16, 0x0db8, %r5
thr3_hw_intr_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_114), 16, 16)) -> intp(0, 0, 1)
	.word 0x88942a06  ! 1: ORcc_I	orcc 	%r16, 0x0a06, %r4
	.word 0x840428da  ! 1: ADD_I	add 	%r16, 0x08da, %r2
thr3_nuke_intr_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_115), 16, 16)) -> intp(0, 2, 1)
	.word 0x8d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r6
thr3_resum_intr_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_116), 16, 16)) -> intp(0, 3, 1)
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
thr3_hw_intr_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_117), 16, 16)) -> intp(2, 0, 1)
	.word 0xa6040011  ! 1: ADD_R	add 	%r16, %r17, %r19
thr3_nuke_intr_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_118), 16, 16)) -> intp(2, 2, 1)
	.word 0x889c24f8  ! 1: XORcc_I	xorcc 	%r16, 0x04f8, %r4
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
	.word 0x832c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0xb12c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r24
thr3_resum_intr_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_119), 16, 16)) -> intp(2, 3, 1)
	.word 0xaf2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r23
thr3_hw_intr_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_120), 16, 16)) -> intp(2, 0, 1)
	.word 0x99343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r12
	.word 0xa6040011  ! 1: ADD_R	add 	%r16, %r17, %r19
	.word 0xaf3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r23
thr3_hw_intr_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_121), 16, 16)) -> intp(1, 0, 1)
	.word 0x8a042f9a  ! 1: ADD_I	add 	%r16, 0x0f9a, %r5
	.word 0xb60c0011  ! 1: AND_R	and 	%r16, %r17, %r27
	.word 0x9cc42006  ! 1: ADDCcc_I	addccc 	%r16, 0x0006, %r14
	.word 0x9f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r15
thr3_nuke_intr_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_122), 16, 16)) -> intp(0, 2, 1)
	.word 0xb40423c1  ! 1: ADD_I	add 	%r16, 0x03c1, %r26
	.word 0xa89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0xa88c2216  ! 1: ANDcc_I	andcc 	%r16, 0x0216, %r20
thr3_resum_intr_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_123), 16, 16)) -> intp(0, 3, 1)
	.word 0xa80c21da  ! 1: AND_I	and 	%r16, 0x01da, %r20
	.word 0x89641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_124), 16, 16)) -> intp(0, 2, 1)
	.word 0xad2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r22
thr3_resum_intr_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_125), 16, 16)) -> intp(0, 3, 1)
	.word 0x8ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x828c27c4  ! 1: ANDcc_I	andcc 	%r16, 0x07c4, %r1
thr3_nuke_intr_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_126), 16, 16)) -> intp(0, 2, 1)
	.word 0xa72c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r19
thr3_resum_intr_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_127), 16, 16)) -> intp(0, 3, 1)
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x9a442844  ! 1: ADDC_I	addc 	%r16, 0x0844, %r13
	.word 0xa8842085  ! 1: ADDcc_I	addcc 	%r16, 0x0085, %r20
	.word 0x98bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r12
thr3_nuke_intr_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_128), 16, 16)) -> intp(2, 2, 1)
	.word 0xa72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r19
	.word 0x99340011  ! 1: SRL_R	srl 	%r16, %r17, %r12
thr3_resum_intr_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_129), 16, 16)) -> intp(2, 3, 1)
	.word 0xae9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0xac842365  ! 1: ADDcc_I	addcc 	%r16, 0x0365, %r22
	.word 0x829c2ab9  ! 1: XORcc_I	xorcc 	%r16, 0x0ab9, %r1
	.word 0x88142c04  ! 1: OR_I	or 	%r16, 0x0c04, %r4
thr3_nuke_intr_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_130), 16, 16)) -> intp(2, 2, 1)
	.word 0x929c22d8  ! 1: XORcc_I	xorcc 	%r16, 0x02d8, %r9
	.word 0x82ac2a9a  ! 1: ANDNcc_I	andncc 	%r16, 0x0a9a, %r1
thr3_resum_intr_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_131), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r15
	.word 0x9ac42647  ! 1: ADDCcc_I	addccc 	%r16, 0x0647, %r13
	.word 0xb4140011  ! 1: OR_R	or 	%r16, %r17, %r26
	.word 0xb48c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r26
thr3_hw_intr_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_132), 16, 16)) -> intp(0, 0, 1)
	.word 0x9b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0x98c42522  ! 1: ADDCcc_I	addccc 	%r16, 0x0522, %r12
	.word 0x84840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r2
thr3_hw_intr_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_133), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb340011  ! 1: SRL_R	srl 	%r16, %r17, %r29
	.word 0xb92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0x8a040011  ! 1: ADD_R	add 	%r16, %r17, %r5
thr3_nuke_intr_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_134), 16, 16)) -> intp(0, 2, 1)
	.word 0x8b643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r19
thr3_resum_intr_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_135), 16, 16)) -> intp(0, 3, 1)
	.word 0xb53c1011  ! 1: SRAX_R	srax	%r16, %r17, %r26
	.word 0x93342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x9e842b4f  ! 1: ADDcc_I	addcc 	%r16, 0x0b4f, %r15
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
thr3_nuke_intr_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_136), 16, 16)) -> intp(1, 2, 1)
	.word 0x98b42b85  ! 1: ORNcc_I	orncc 	%r16, 0x0b85, %r12
	.word 0xb20c0011  ! 1: AND_R	and 	%r16, %r17, %r25
	.word 0x8abc244a  ! 1: XNORcc_I	xnorcc 	%r16, 0x044a, %r5
thr3_resum_intr_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_137), 16, 16)) -> intp(1, 3, 1)
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
	.word 0xb434261e  ! 1: ORN_I	orn 	%r16, 0x061e, %r26
	.word 0x928c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0x824427ee  ! 1: ADDC_I	addc 	%r16, 0x07ee, %r1
thr3_hw_intr_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_138), 16, 16)) -> intp(0, 0, 1)
	.word 0x868429bd  ! 1: ADDcc_I	addcc 	%r16, 0x09bd, %r3
	.word 0x833c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
	.word 0xba0c0011  ! 1: AND_R	and 	%r16, %r17, %r29
thr3_nuke_intr_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_139), 16, 16)) -> intp(1, 2, 1)
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
	.word 0x888c271c  ! 1: ANDcc_I	andcc 	%r16, 0x071c, %r4
thr3_resum_intr_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_140), 16, 16)) -> intp(1, 3, 1)
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
thr3_hw_intr_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_141), 16, 16)) -> intp(1, 0, 1)
	.word 0xab340011  ! 1: SRL_R	srl 	%r16, %r17, %r21
	.word 0x9a34200c  ! 1: ORN_I	orn 	%r16, 0x000c, %r13
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
	.word 0xaab42d7b  ! 1: ORNcc_I	orncc 	%r16, 0x0d7b, %r21
thr3_nuke_intr_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_142), 16, 16)) -> intp(2, 2, 1)
	.word 0xb6340011  ! 1: ORN_R	orn 	%r16, %r17, %r27
thr3_resum_intr_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_143), 16, 16)) -> intp(2, 3, 1)
	.word 0x8eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r7
thr3_hw_intr_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_144), 16, 16)) -> intp(2, 0, 1)
	.word 0x9f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r15
	.word 0xab2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r21
thr3_hw_intr_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_145), 16, 16)) -> intp(0, 0, 1)
	.word 0xb0840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r24
thr3_nuke_intr_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_146), 16, 16)) -> intp(0, 2, 1)
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x96b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r11
thr3_resum_intr_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_147), 16, 16)) -> intp(0, 3, 1)
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
thr3_hw_intr_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_148), 16, 16)) -> intp(0, 0, 1)
	.word 0x988c214d  ! 1: ANDcc_I	andcc 	%r16, 0x014d, %r12
thr3_hw_intr_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_149), 16, 16)) -> intp(0, 0, 1)
	.word 0x828c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x87343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
thr3_nuke_intr_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_150), 16, 16)) -> intp(1, 2, 1)
	.word 0x9b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0xb57c0411  ! 1: MOVR_R	move	%r16, %r17, %r26
thr3_resum_intr_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_151), 16, 16)) -> intp(1, 3, 1)
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0xaa140011  ! 1: OR_R	or 	%r16, %r17, %r21
	.word 0xa6b42be3  ! 1: ORNcc_I	orncc 	%r16, 0x0be3, %r19
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
thr3_nuke_intr_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_152), 16, 16)) -> intp(2, 2, 1)
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x908c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r8
thr3_resum_intr_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_153), 16, 16)) -> intp(2, 3, 1)
	.word 0xa6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0xb2c42717  ! 1: ADDCcc_I	addccc 	%r16, 0x0717, %r25
thr3_hw_intr_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_154), 16, 16)) -> intp(0, 0, 1)
	.word 0x8e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0xb42c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r26
	.word 0x837c2401  ! 1: MOVR_I	move	%r16, 0x11, %r1
	.word 0xb88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r28
thr3_nuke_intr_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_155), 16, 16)) -> intp(2, 2, 1)
	.word 0x841422de  ! 1: OR_I	or 	%r16, 0x02de, %r2
	.word 0x8c0c25b0  ! 1: AND_I	and 	%r16, 0x05b0, %r6
thr3_resum_intr_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_156), 16, 16)) -> intp(2, 3, 1)
	.word 0xac142287  ! 1: OR_I	or 	%r16, 0x0287, %r22
	.word 0x9b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xab641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_157), 16, 16)) -> intp(2, 2, 1)
	.word 0x87340011  ! 1: SRL_R	srl 	%r16, %r17, %r3
	.word 0x969c2418  ! 1: XORcc_I	xorcc 	%r16, 0x0418, %r11
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x8c1c27e8  ! 1: XOR_I	xor 	%r16, 0x07e8, %r6
thr3_resum_intr_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_158), 16, 16)) -> intp(2, 3, 1)
	.word 0x90342e9a  ! 1: ORN_I	orn 	%r16, 0x0e9a, %r8
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
thr3_nuke_intr_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_159), 16, 16)) -> intp(0, 2, 1)
	.word 0x941c0011  ! 1: XOR_R	xor 	%r16, %r17, %r10
	.word 0x9f340011  ! 1: SRL_R	srl 	%r16, %r17, %r15
	.word 0x832c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r1
	.word 0xb6442b67  ! 1: ADDC_I	addc 	%r16, 0x0b67, %r27
thr3_resum_intr_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_160), 16, 16)) -> intp(0, 3, 1)
	.word 0x841c0011  ! 1: XOR_R	xor 	%r16, %r17, %r2
	.word 0xb2142c79  ! 1: OR_I	or 	%r16, 0x0c79, %r25
	.word 0x897c2401  ! 1: MOVR_I	move	%r16, 0xc79, %r4
thr3_nuke_intr_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_161), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x86040011  ! 1: ADD_R	add 	%r16, %r17, %r3
	.word 0xad341011  ! 1: SRLX_R	srlx	%r16, %r17, %r22
thr3_resum_intr_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_162), 16, 16)) -> intp(1, 3, 1)
	.word 0x9e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xb42c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r26
	.word 0x8d7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r6
	.word 0x96940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r11
thr3_nuke_intr_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_163), 16, 16)) -> intp(2, 2, 1)
	.word 0x98bc26e6  ! 1: XNORcc_I	xnorcc 	%r16, 0x06e6, %r12
thr3_resum_intr_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_164), 16, 16)) -> intp(2, 3, 1)
	.word 0x9a340011  ! 1: ORN_R	orn 	%r16, %r17, %r13
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x9ab422ef  ! 1: ORNcc_I	orncc 	%r16, 0x02ef, %r13
thr3_nuke_intr_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_165), 16, 16)) -> intp(1, 2, 1)
	.word 0xaf342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r23
thr3_resum_intr_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_166), 16, 16)) -> intp(1, 3, 1)
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x88342703  ! 1: ORN_I	orn 	%r16, 0x0703, %r4
	.word 0x912c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0xa8bc2625  ! 1: XNORcc_I	xnorcc 	%r16, 0x0625, %r20
thr3_nuke_intr_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_167), 16, 16)) -> intp(0, 2, 1)
	.word 0xb7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xb0840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
thr3_resum_intr_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_168), 16, 16)) -> intp(0, 3, 1)
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
thr3_hw_intr_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_169), 16, 16)) -> intp(0, 0, 1)
	.word 0xb03c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0xb29423e7  ! 1: ORcc_I	orcc 	%r16, 0x03e7, %r25
	.word 0xb0840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0xa72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r19
thr3_hw_intr_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_170), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a8c2095  ! 1: ANDcc_I	andcc 	%r16, 0x0095, %r5
thr3_hw_intr_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_171), 16, 16)) -> intp(0, 0, 1)
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0xae9c23a8  ! 1: XORcc_I	xorcc 	%r16, 0x03a8, %r23
thr3_hw_intr_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_172), 16, 16)) -> intp(0, 0, 1)
	.word 0x90942a46  ! 1: ORcc_I	orcc 	%r16, 0x0a46, %r8
	.word 0x9f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r15
thr3_hw_intr_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_173), 16, 16)) -> intp(2, 0, 1)
	.word 0xb6340011  ! 1: ORN_R	orn 	%r16, %r17, %r27
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x9c9c2c5b  ! 1: XORcc_I	xorcc 	%r16, 0x0c5b, %r14
thr3_nuke_intr_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_174), 16, 16)) -> intp(2, 2, 1)
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x94140011  ! 1: OR_R	or 	%r16, %r17, %r10
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
thr3_resum_intr_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_175), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
thr3_hw_intr_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_176), 16, 16)) -> intp(1, 0, 1)
	.word 0x961c0011  ! 1: XOR_R	xor 	%r16, %r17, %r11
	.word 0xb3343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
thr3_nuke_intr_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_177), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e9c2faf  ! 1: XORcc_I	xorcc 	%r16, 0x0faf, %r7
	.word 0xaa440011  ! 1: ADDC_R	addc 	%r16, %r17, %r21
	.word 0x8c142382  ! 1: OR_I	or 	%r16, 0x0382, %r6
thr3_resum_intr_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_178), 16, 16)) -> intp(0, 3, 1)
	.word 0xb93c0011  ! 1: SRA_R	sra 	%r16, %r17, %r28
	.word 0x8d641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_179), 16, 16)) -> intp(1, 2, 1)
	.word 0xb53c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0x9e040011  ! 1: ADD_R	add 	%r16, %r17, %r15
	.word 0x86440011  ! 1: ADDC_R	addc 	%r16, %r17, %r3
	.word 0xad3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r22
thr3_resum_intr_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_180), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa3c206c  ! 1: XNOR_I	xnor 	%r16, 0x006c, %r21
thr3_nuke_intr_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_181), 16, 16)) -> intp(2, 2, 1)
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
thr3_resum_intr_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_182), 16, 16)) -> intp(2, 3, 1)
	.word 0xb63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0x9a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x941424b4  ! 1: OR_I	or 	%r16, 0x04b4, %r10
	.word 0x88140011  ! 1: OR_R	or 	%r16, %r17, %r4
thr3_nuke_intr_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_183), 16, 16)) -> intp(2, 2, 1)
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
thr3_resum_intr_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_184), 16, 16)) -> intp(2, 3, 1)
	.word 0xb9643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0x87341011  ! 1: SRLX_R	srlx	%r16, %r17, %r3
thr3_hw_intr_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_185), 16, 16)) -> intp(0, 0, 1)
	.word 0xb03c29d5  ! 1: XNOR_I	xnor 	%r16, 0x09d5, %r24
	.word 0xb32c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r25
thr3_nuke_intr_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_186), 16, 16)) -> intp(2, 2, 1)
	.word 0xac840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0xa7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r19
thr3_resum_intr_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_187), 16, 16)) -> intp(2, 3, 1)
	.word 0x993c1011  ! 1: SRAX_R	srax	%r16, %r17, %r12
	.word 0x9e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x882c24d6  ! 1: ANDN_I	andn 	%r16, 0x04d6, %r4
thr3_hw_intr_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_188), 16, 16)) -> intp(1, 0, 1)
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0x99641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xac340011  ! 1: ORN_R	orn 	%r16, %r17, %r22
	.word 0x98bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r12
thr3_hw_intr_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_189), 16, 16)) -> intp(0, 0, 1)
	.word 0x92ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r9
thr3_hw_intr_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_190), 16, 16)) -> intp(2, 0, 1)
	.word 0x828c2f92  ! 1: ANDcc_I	andcc 	%r16, 0x0f92, %r1
	.word 0xa61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r19
thr3_hw_intr_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_191), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c842eea  ! 1: ADDcc_I	addcc 	%r16, 0x0eea, %r6
thr3_nuke_intr_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_192), 16, 16)) -> intp(0, 2, 1)
	.word 0xaac42e4c  ! 1: ADDCcc_I	addccc 	%r16, 0x0e4c, %r21
	.word 0x8cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r6
thr3_resum_intr_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_193), 16, 16)) -> intp(0, 3, 1)
	.word 0x92842b44  ! 1: ADDcc_I	addcc 	%r16, 0x0b44, %r9
thr3_hw_intr_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_194), 16, 16)) -> intp(0, 0, 1)
	.word 0x848c22b7  ! 1: ANDcc_I	andcc 	%r16, 0x02b7, %r2
	.word 0x96042647  ! 1: ADD_I	add 	%r16, 0x0647, %r11
thr3_nuke_intr_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_195), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r27
thr3_resum_intr_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_196), 16, 16)) -> intp(1, 3, 1)
	.word 0x9a842f32  ! 1: ADDcc_I	addcc 	%r16, 0x0f32, %r13
thr3_nuke_intr_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_197), 16, 16)) -> intp(0, 2, 1)
	.word 0x969423bf  ! 1: ORcc_I	orcc 	%r16, 0x03bf, %r11
	.word 0xac8424b8  ! 1: ADDcc_I	addcc 	%r16, 0x04b8, %r22
thr3_resum_intr_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_198), 16, 16)) -> intp(0, 3, 1)
	.word 0x961c2b4c  ! 1: XOR_I	xor 	%r16, 0x0b4c, %r11
	.word 0x9e042213  ! 1: ADD_I	add 	%r16, 0x0213, %r15
	.word 0xb32c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
thr3_hw_intr_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_199), 16, 16)) -> intp(0, 0, 1)
	.word 0xb7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r27
thr3_hw_intr_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_200), 16, 16)) -> intp(2, 0, 1)
	.word 0x9cb42495  ! 1: ORNcc_I	orncc 	%r16, 0x0495, %r14
	.word 0x8eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x96ac2abb  ! 1: ANDNcc_I	andncc 	%r16, 0x0abb, %r11
	.word 0x8abc2edd  ! 1: XNORcc_I	xnorcc 	%r16, 0x0edd, %r5
thr3_nuke_intr_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_201), 16, 16)) -> intp(0, 2, 1)
	.word 0x853c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r2
thr3_resum_intr_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_202), 16, 16)) -> intp(0, 3, 1)
	.word 0x9e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r15
	.word 0xad3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0xa68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r19
thr3_nuke_intr_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_203), 16, 16)) -> intp(2, 2, 1)
	.word 0x984427f0  ! 1: ADDC_I	addc 	%r16, 0x07f0, %r12
	.word 0x9c2c2787  ! 1: ANDN_I	andn 	%r16, 0x0787, %r14
	.word 0xaf3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r23
	.word 0xb68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r27
thr3_resum_intr_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_204), 16, 16)) -> intp(2, 3, 1)
	.word 0x9b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0x94942b95  ! 1: ORcc_I	orcc 	%r16, 0x0b95, %r10
	.word 0xbb7c0411  ! 1: MOVR_R	move	%r16, %r17, %r29
	.word 0x98142252  ! 1: OR_I	or 	%r16, 0x0252, %r12
thr3_nuke_intr_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_205), 16, 16)) -> intp(0, 2, 1)
	.word 0xb234263b  ! 1: ORN_I	orn 	%r16, 0x063b, %r25
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x87342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r3
thr3_resum_intr_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_206), 16, 16)) -> intp(0, 3, 1)
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0xb0b42ee5  ! 1: ORNcc_I	orncc 	%r16, 0x0ee5, %r24
	.word 0x8ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x8f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r7
thr3_nuke_intr_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_207), 16, 16)) -> intp(1, 2, 1)
	.word 0xad340011  ! 1: SRL_R	srl 	%r16, %r17, %r22
thr3_resum_intr_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_208), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c84207c  ! 1: ADDcc_I	addcc 	%r16, 0x007c, %r6
	.word 0x92940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r9
thr3_nuke_intr_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_209), 16, 16)) -> intp(1, 2, 1)
	.word 0x853c0011  ! 1: SRA_R	sra 	%r16, %r17, %r2
	.word 0x868c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x8c2c26a9  ! 1: ANDN_I	andn 	%r16, 0x06a9, %r6
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
thr3_resum_intr_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_210), 16, 16)) -> intp(1, 3, 1)
	.word 0xa6142db2  ! 1: OR_I	or 	%r16, 0x0db2, %r19
	.word 0xb77c0411  ! 1: MOVR_R	move	%r16, %r17, %r27
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
	.word 0xab3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r21
thr3_hw_intr_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_211), 16, 16)) -> intp(2, 0, 1)
	.word 0xba942153  ! 1: ORcc_I	orcc 	%r16, 0x0153, %r29
	.word 0x93342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x8f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r7
	.word 0x90ac202e  ! 1: ANDNcc_I	andncc 	%r16, 0x002e, %r8
thr3_hw_intr_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_212), 16, 16)) -> intp(1, 0, 1)
	.word 0x8ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xa8442911  ! 1: ADDC_I	addc 	%r16, 0x0911, %r20
	.word 0x8e2c2161  ! 1: ANDN_I	andn 	%r16, 0x0161, %r7
thr3_nuke_intr_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_213), 16, 16)) -> intp(0, 2, 1)
	.word 0x869c2f1e  ! 1: XORcc_I	xorcc 	%r16, 0x0f1e, %r3
	.word 0x922c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r9
thr3_resum_intr_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_214), 16, 16)) -> intp(0, 3, 1)
	.word 0xb92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r28
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0x9aac23de  ! 1: ANDNcc_I	andncc 	%r16, 0x03de, %r13
thr3_hw_intr_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_215), 16, 16)) -> intp(1, 0, 1)
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x923c25f0  ! 1: XNOR_I	xnor 	%r16, 0x05f0, %r9
	.word 0xa88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r20
thr3_hw_intr_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_216), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0x86340011  ! 1: ORN_R	orn 	%r16, %r17, %r3
thr3_nuke_intr_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_217), 16, 16)) -> intp(2, 2, 1)
	.word 0x9f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x900425ec  ! 1: ADD_I	add 	%r16, 0x05ec, %r8
	.word 0x8e3421dd  ! 1: ORN_I	orn 	%r16, 0x01dd, %r7
thr3_resum_intr_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_218), 16, 16)) -> intp(2, 3, 1)
	.word 0xacb42e47  ! 1: ORNcc_I	orncc 	%r16, 0x0e47, %r22
	.word 0xa63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r19
thr3_hw_intr_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_219), 16, 16)) -> intp(0, 0, 1)
	.word 0x8eac23eb  ! 1: ANDNcc_I	andncc 	%r16, 0x03eb, %r7
	.word 0x837c0411  ! 1: MOVR_R	move	%r16, %r17, %r1
	.word 0x9cac233b  ! 1: ANDNcc_I	andncc 	%r16, 0x033b, %r14
	.word 0x820c2c39  ! 1: AND_I	and 	%r16, 0x0c39, %r1
thr3_hw_intr_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_220), 16, 16)) -> intp(1, 0, 1)
	.word 0x857c0411  ! 1: MOVR_R	move	%r16, %r17, %r2
	.word 0x88ac25a3  ! 1: ANDNcc_I	andncc 	%r16, 0x05a3, %r4
	.word 0xaa840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r21
thr3_hw_intr_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_221), 16, 16)) -> intp(1, 0, 1)
	.word 0x94840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0x94142cac  ! 1: OR_I	or 	%r16, 0x0cac, %r10
thr3_hw_intr_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_222), 16, 16)) -> intp(2, 0, 1)
	.word 0xb6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
thr3_nuke_intr_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_223), 16, 16)) -> intp(1, 2, 1)
	.word 0x837c2401  ! 1: MOVR_I	move	%r16, 0x1, %r1
thr3_resum_intr_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_224), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
	.word 0x9aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x9cbc271d  ! 1: XNORcc_I	xnorcc 	%r16, 0x071d, %r14
thr3_hw_intr_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_225), 16, 16)) -> intp(2, 0, 1)
	.word 0x86bc2f35  ! 1: XNORcc_I	xnorcc 	%r16, 0x0f35, %r3
	.word 0x9cac28f6  ! 1: ANDNcc_I	andncc 	%r16, 0x08f6, %r14
	.word 0x903c2342  ! 1: XNOR_I	xnor 	%r16, 0x0342, %r8
thr3_hw_intr_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_226), 16, 16)) -> intp(2, 0, 1)
	.word 0xae042b71  ! 1: ADD_I	add 	%r16, 0x0b71, %r23
	.word 0xa9342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r20
thr3_hw_intr_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_227), 16, 16)) -> intp(1, 0, 1)
	.word 0x8a0c24c1  ! 1: AND_I	and 	%r16, 0x04c1, %r5
	.word 0xaac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
thr3_nuke_intr_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_228), 16, 16)) -> intp(1, 2, 1)
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0x92842069  ! 1: ADDcc_I	addcc 	%r16, 0x0069, %r9
	.word 0xad641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_229), 16, 16)) -> intp(1, 3, 1)
	.word 0x98bc22c6  ! 1: XNORcc_I	xnorcc 	%r16, 0x02c6, %r12
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
thr3_nuke_intr_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_230), 16, 16)) -> intp(0, 2, 1)
	.word 0xb62c2a47  ! 1: ANDN_I	andn 	%r16, 0x0a47, %r27
	.word 0x85343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0xb5641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_231), 16, 16)) -> intp(0, 3, 1)
	.word 0xb49c2d01  ! 1: XORcc_I	xorcc 	%r16, 0x0d01, %r26
	.word 0x873c0011  ! 1: SRA_R	sra 	%r16, %r17, %r3
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
thr3_nuke_intr_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_232), 16, 16)) -> intp(2, 2, 1)
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
thr3_resum_intr_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_233), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r15
	.word 0x86c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r3
thr3_hw_intr_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_234), 16, 16)) -> intp(2, 0, 1)
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x9c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r14
	.word 0xb3343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xa6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r19
thr3_hw_intr_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_235), 16, 16)) -> intp(1, 0, 1)
	.word 0xb4342fd8  ! 1: ORN_I	orn 	%r16, 0x0fd8, %r26
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
	.word 0xba0c22eb  ! 1: AND_I	and 	%r16, 0x02eb, %r29
thr3_hw_intr_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_236), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
	.word 0xa6c42f5b  ! 1: ADDCcc_I	addccc 	%r16, 0x0f5b, %r19
	.word 0xad343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r22
thr3_nuke_intr_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_237), 16, 16)) -> intp(2, 2, 1)
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
thr3_resum_intr_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_238), 16, 16)) -> intp(2, 3, 1)
	.word 0x92342583  ! 1: ORN_I	orn 	%r16, 0x0583, %r9
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x849c2dad  ! 1: XORcc_I	xorcc 	%r16, 0x0dad, %r2
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
thr3_hw_intr_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_239), 16, 16)) -> intp(2, 0, 1)
	.word 0xb37c0411  ! 1: MOVR_R	move	%r16, %r17, %r25
	.word 0xab7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r21
thr3_hw_intr_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_240), 16, 16)) -> intp(2, 0, 1)
	.word 0x993c0011  ! 1: SRA_R	sra 	%r16, %r17, %r12
thr3_hw_intr_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_241), 16, 16)) -> intp(0, 0, 1)
	.word 0x90042adc  ! 1: ADD_I	add 	%r16, 0x0adc, %r8
	.word 0xb77c0411  ! 1: MOVR_R	move	%r16, %r17, %r27
	.word 0x868c2591  ! 1: ANDcc_I	andcc 	%r16, 0x0591, %r3
thr3_nuke_intr_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_242), 16, 16)) -> intp(0, 2, 1)
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
thr3_resum_intr_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_243), 16, 16)) -> intp(0, 3, 1)
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
	.word 0x9b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r13
thr3_nuke_intr_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_244), 16, 16)) -> intp(0, 2, 1)
	.word 0x941c0011  ! 1: XOR_R	xor 	%r16, %r17, %r10
thr3_resum_intr_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_245), 16, 16)) -> intp(0, 3, 1)
	.word 0x9c0c2b47  ! 1: AND_I	and 	%r16, 0x0b47, %r14
thr3_hw_intr_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_246), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e1c2224  ! 1: XOR_I	xor 	%r16, 0x0224, %r15
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0xb5340011  ! 1: SRL_R	srl 	%r16, %r17, %r26
	.word 0xb6142d3d  ! 1: OR_I	or 	%r16, 0x0d3d, %r27
thr3_hw_intr_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_247), 16, 16)) -> intp(2, 0, 1)
	.word 0xa8142c33  ! 1: OR_I	or 	%r16, 0x0c33, %r20
	.word 0x9e9c2081  ! 1: XORcc_I	xorcc 	%r16, 0x0081, %r15
	.word 0x9ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x82042411  ! 1: ADD_I	add 	%r16, 0x0411, %r1
thr3_hw_intr_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_248), 16, 16)) -> intp(2, 0, 1)
	.word 0x961c2913  ! 1: XOR_I	xor 	%r16, 0x0913, %r11
	.word 0xa60c0011  ! 1: AND_R	and 	%r16, %r17, %r19
	.word 0x8ebc2b9f  ! 1: XNORcc_I	xnorcc 	%r16, 0x0b9f, %r7
	.word 0xab2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r21
thr3_hw_intr_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_249), 16, 16)) -> intp(2, 0, 1)
	.word 0xa81c2ea1  ! 1: XOR_I	xor 	%r16, 0x0ea1, %r20
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
thr3_hw_intr_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_250), 16, 16)) -> intp(1, 0, 1)
	.word 0x8d643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb2940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0x9a0c2034  ! 1: AND_I	and 	%r16, 0x0034, %r13
thr3_hw_intr_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_251), 16, 16)) -> intp(1, 0, 1)
	.word 0x9a1c2a68  ! 1: XOR_I	xor 	%r16, 0x0a68, %r13
thr3_hw_intr_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_252), 16, 16)) -> intp(2, 0, 1)
	.word 0x86c4288f  ! 1: ADDCcc_I	addccc 	%r16, 0x088f, %r3
	.word 0xac3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r22
thr3_hw_intr_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_253), 16, 16)) -> intp(1, 0, 1)
	.word 0xa6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x8a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
thr3_nuke_intr_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_254), 16, 16)) -> intp(1, 2, 1)
	.word 0x997c2401  ! 1: MOVR_I	move	%r16, 0x11, %r12
thr3_resum_intr_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_255), 16, 16)) -> intp(1, 3, 1)
	.word 0x8ac42284  ! 1: ADDCcc_I	addccc 	%r16, 0x0284, %r5
	.word 0xad3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0x9eac25f3  ! 1: ANDNcc_I	andncc 	%r16, 0x05f3, %r15
thr3_nuke_intr_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_256), 16, 16)) -> intp(0, 2, 1)
	.word 0x86c42a02  ! 1: ADDCcc_I	addccc 	%r16, 0x0a02, %r3
	.word 0xb6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0xb40c0011  ! 1: AND_R	and 	%r16, %r17, %r26
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
thr3_resum_intr_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_257), 16, 16)) -> intp(0, 3, 1)
	.word 0xa68c2276  ! 1: ANDcc_I	andcc 	%r16, 0x0276, %r19
	.word 0x96842c85  ! 1: ADDcc_I	addcc 	%r16, 0x0c85, %r11
thr3_nuke_intr_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_258), 16, 16)) -> intp(1, 2, 1)
	.word 0x9c2c2d14  ! 1: ANDN_I	andn 	%r16, 0x0d14, %r14
	.word 0x8c442bb6  ! 1: ADDC_I	addc 	%r16, 0x0bb6, %r6
thr3_resum_intr_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_259), 16, 16)) -> intp(1, 3, 1)
	.word 0x9cbc2d23  ! 1: XNORcc_I	xnorcc 	%r16, 0x0d23, %r14
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x98c4220b  ! 1: ADDCcc_I	addccc 	%r16, 0x020b, %r12
thr3_hw_intr_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_260), 16, 16)) -> intp(0, 0, 1)
	.word 0xb6bc2fe4  ! 1: XNORcc_I	xnorcc 	%r16, 0x0fe4, %r27
	.word 0x9b7c2401  ! 1: MOVR_I	move	%r16, 0xffffffe4, %r13
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
thr3_nuke_intr_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_261), 16, 16)) -> intp(0, 2, 1)
	.word 0x909427b1  ! 1: ORcc_I	orcc 	%r16, 0x07b1, %r8
	.word 0xba440011  ! 1: ADDC_R	addc 	%r16, %r17, %r29
thr3_resum_intr_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_262), 16, 16)) -> intp(0, 3, 1)
	.word 0xb0042a99  ! 1: ADD_I	add 	%r16, 0x0a99, %r24
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
	.word 0x8f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x8c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r6
thr3_hw_intr_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_263), 16, 16)) -> intp(2, 0, 1)
	.word 0xa92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0xb2c42342  ! 1: ADDCcc_I	addccc 	%r16, 0x0342, %r25
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
thr3_hw_intr_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_264), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
	.word 0xbb7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r29
thr3_hw_intr_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_265), 16, 16)) -> intp(0, 0, 1)
	.word 0x8b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
thr3_nuke_intr_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_266), 16, 16)) -> intp(2, 2, 1)
	.word 0x9e040011  ! 1: ADD_R	add 	%r16, %r17, %r15
	.word 0x88040011  ! 1: ADD_R	add 	%r16, %r17, %r4
	.word 0x98040011  ! 1: ADD_R	add 	%r16, %r17, %r12
thr3_resum_intr_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_267), 16, 16)) -> intp(2, 3, 1)
	.word 0x937c2401  ! 1: MOVR_I	move	%r16, 0x11, %r9
	.word 0x909c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0x961c0011  ! 1: XOR_R	xor 	%r16, %r17, %r11
thr3_nuke_intr_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_268), 16, 16)) -> intp(2, 2, 1)
	.word 0xa93c0011  ! 1: SRA_R	sra 	%r16, %r17, %r20
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
thr3_resum_intr_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_269), 16, 16)) -> intp(2, 3, 1)
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x8cc42c9f  ! 1: ADDCcc_I	addccc 	%r16, 0x0c9f, %r6
	.word 0x833c0011  ! 1: SRA_R	sra 	%r16, %r17, %r1
	.word 0xb80c23bc  ! 1: AND_I	and 	%r16, 0x03bc, %r28
thr3_nuke_intr_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_270), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
thr3_resum_intr_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_271), 16, 16)) -> intp(0, 3, 1)
	.word 0x90442f8d  ! 1: ADDC_I	addc 	%r16, 0x0f8d, %r8
	.word 0x963c2131  ! 1: XNOR_I	xnor 	%r16, 0x0131, %r11
thr3_nuke_intr_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_272), 16, 16)) -> intp(0, 2, 1)
	.word 0x820c0011  ! 1: AND_R	and 	%r16, %r17, %r1
	.word 0x8804203a  ! 1: ADD_I	add 	%r16, 0x003a, %r4
thr3_resum_intr_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_273), 16, 16)) -> intp(0, 3, 1)
	.word 0xa83425b3  ! 1: ORN_I	orn 	%r16, 0x05b3, %r20
thr3_nuke_intr_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_274), 16, 16)) -> intp(1, 2, 1)
	.word 0x8b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r5
thr3_resum_intr_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_275), 16, 16)) -> intp(1, 3, 1)
	.word 0x8eb420ab  ! 1: ORNcc_I	orncc 	%r16, 0x00ab, %r7
	.word 0x942c21b8  ! 1: ANDN_I	andn 	%r16, 0x01b8, %r10
	.word 0xba2c27ed  ! 1: ANDN_I	andn 	%r16, 0x07ed, %r29
	.word 0xb8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r28
thr3_hw_intr_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_276), 16, 16)) -> intp(2, 0, 1)
	.word 0x98842cd9  ! 1: ADDcc_I	addcc 	%r16, 0x0cd9, %r12
thr3_hw_intr_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_277), 16, 16)) -> intp(2, 0, 1)
	.word 0x8a842f42  ! 1: ADDcc_I	addcc 	%r16, 0x0f42, %r5
	.word 0xaa1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r21
	.word 0x8e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r7
	.word 0xac3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r22
thr3_nuke_intr_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_278), 16, 16)) -> intp(1, 2, 1)
	.word 0x98c42a16  ! 1: ADDCcc_I	addccc 	%r16, 0x0a16, %r12
	.word 0x8c3c245d  ! 1: XNOR_I	xnor 	%r16, 0x045d, %r6
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0x8abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r5
thr3_resum_intr_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_279), 16, 16)) -> intp(1, 3, 1)
	.word 0xac9421c0  ! 1: ORcc_I	orcc 	%r16, 0x01c0, %r22
thr3_nuke_intr_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_280), 16, 16)) -> intp(2, 2, 1)
	.word 0x98940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r12
thr3_resum_intr_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_281), 16, 16)) -> intp(2, 3, 1)
	.word 0x9c3422a2  ! 1: ORN_I	orn 	%r16, 0x02a2, %r14
thr3_nuke_intr_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_282), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb22c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r25
thr3_resum_intr_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_283), 16, 16)) -> intp(0, 3, 1)
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
thr3_nuke_intr_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_284), 16, 16)) -> intp(0, 2, 1)
	.word 0x968c274a  ! 1: ANDcc_I	andcc 	%r16, 0x074a, %r11
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
	.word 0xb0bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r24
thr3_resum_intr_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_285), 16, 16)) -> intp(0, 3, 1)
	.word 0x9abc2f93  ! 1: XNORcc_I	xnorcc 	%r16, 0x0f93, %r13
	.word 0xb1342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0x93341011  ! 1: SRLX_R	srlx	%r16, %r17, %r9
	.word 0xaf2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r23
thr3_nuke_intr_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_286), 16, 16)) -> intp(1, 2, 1)
	.word 0x96bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r11
thr3_resum_intr_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_287), 16, 16)) -> intp(1, 3, 1)
	.word 0x99643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xba2c2346  ! 1: ANDN_I	andn 	%r16, 0x0346, %r29
	.word 0x9c0c20db  ! 1: AND_I	and 	%r16, 0x00db, %r14
thr3_nuke_intr_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_288), 16, 16)) -> intp(1, 2, 1)
	.word 0x993c0011  ! 1: SRA_R	sra 	%r16, %r17, %r12
	.word 0xa80c2ca5  ! 1: AND_I	and 	%r16, 0x0ca5, %r20
	.word 0xa7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x98942770  ! 1: ORcc_I	orcc 	%r16, 0x0770, %r12
thr3_resum_intr_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_289), 16, 16)) -> intp(1, 3, 1)
	.word 0x96440011  ! 1: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x90ac2ccb  ! 1: ANDNcc_I	andncc 	%r16, 0x0ccb, %r8
	.word 0x98bc2cf1  ! 1: XNORcc_I	xnorcc 	%r16, 0x0cf1, %r12
thr3_nuke_intr_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_290), 16, 16)) -> intp(0, 2, 1)
	.word 0x8d340011  ! 1: SRL_R	srl 	%r16, %r17, %r6
	.word 0xacb42ded  ! 1: ORNcc_I	orncc 	%r16, 0x0ded, %r22
thr3_resum_intr_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_291), 16, 16)) -> intp(0, 3, 1)
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x900c0011  ! 1: AND_R	and 	%r16, %r17, %r8
	.word 0x829c2aab  ! 1: XORcc_I	xorcc 	%r16, 0x0aab, %r1
thr3_nuke_intr_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_292), 16, 16)) -> intp(1, 2, 1)
	.word 0xae8c2509  ! 1: ANDcc_I	andcc 	%r16, 0x0509, %r23
	.word 0xb29c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
thr3_resum_intr_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_293), 16, 16)) -> intp(1, 3, 1)
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0x8c340011  ! 1: ORN_R	orn 	%r16, %r17, %r6
	.word 0xb7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r27
thr3_hw_intr_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_294), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
	.word 0x922c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r9
thr3_hw_intr_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_295), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e042ad1  ! 1: ADD_I	add 	%r16, 0x0ad1, %r7
thr3_hw_intr_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_296), 16, 16)) -> intp(2, 0, 1)
	.word 0x96b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0xaa2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r21
	.word 0x98440011  ! 1: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x8d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r6
thr3_nuke_intr_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_297), 16, 16)) -> intp(2, 2, 1)
	.word 0xa81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r20
thr3_resum_intr_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_298), 16, 16)) -> intp(2, 3, 1)
	.word 0x9a0c2d45  ! 1: AND_I	and 	%r16, 0x0d45, %r13
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
	.word 0x989c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0xaec42ca0  ! 1: ADDCcc_I	addccc 	%r16, 0x0ca0, %r23
thr3_hw_intr_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_299), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c3c2705  ! 1: XNOR_I	xnor 	%r16, 0x0705, %r14
	.word 0x98b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x91641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xbb2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r29
thr3_nuke_intr_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_300), 16, 16)) -> intp(2, 2, 1)
	.word 0x96bc256a  ! 1: XNORcc_I	xnorcc 	%r16, 0x056a, %r11
thr3_resum_intr_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_301), 16, 16)) -> intp(2, 3, 1)
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x828c288a  ! 1: ANDcc_I	andcc 	%r16, 0x088a, %r1
thr3_nuke_intr_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_302), 16, 16)) -> intp(2, 2, 1)
	.word 0xb0140011  ! 1: OR_R	or 	%r16, %r17, %r24
thr3_resum_intr_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_303), 16, 16)) -> intp(2, 3, 1)
	.word 0xb1343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r24
thr3_hw_intr_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_304), 16, 16)) -> intp(1, 0, 1)
	.word 0x9b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r13
	.word 0xac040011  ! 1: ADD_R	add 	%r16, %r17, %r22
thr3_hw_intr_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_305), 16, 16)) -> intp(0, 0, 1)
	.word 0x95643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x96942352  ! 1: ORcc_I	orcc 	%r16, 0x0352, %r11
	.word 0x9e140011  ! 1: OR_R	or 	%r16, %r17, %r15
	.word 0x9d3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r14
thr3_hw_intr_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_306), 16, 16)) -> intp(2, 0, 1)
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
	.word 0x8c3c28e8  ! 1: XNOR_I	xnor 	%r16, 0x08e8, %r6
	.word 0xb6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r27
	.word 0x8c342ff6  ! 1: ORN_I	orn 	%r16, 0x0ff6, %r6
thr3_hw_intr_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_307), 16, 16)) -> intp(2, 0, 1)
	.word 0xab3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r21
	.word 0xb1343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xa8942ac5  ! 1: ORcc_I	orcc 	%r16, 0x0ac5, %r20
	.word 0x9a142533  ! 1: OR_I	or 	%r16, 0x0533, %r13
thr3_hw_intr_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_308), 16, 16)) -> intp(2, 0, 1)
	.word 0xb3340011  ! 1: SRL_R	srl 	%r16, %r17, %r25
	.word 0x9e2c22d3  ! 1: ANDN_I	andn 	%r16, 0x02d3, %r15
thr3_hw_intr_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_309), 16, 16)) -> intp(2, 0, 1)
	.word 0x963c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r11
thr3_nuke_intr_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_310), 16, 16)) -> intp(0, 2, 1)
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0xa8b425e7  ! 1: ORNcc_I	orncc 	%r16, 0x05e7, %r20
thr3_resum_intr_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_311), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6ac20b7  ! 1: ANDNcc_I	andncc 	%r16, 0x00b7, %r27
thr3_hw_intr_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_312), 16, 16)) -> intp(0, 0, 1)
	.word 0x9484200a  ! 1: ADDcc_I	addcc 	%r16, 0x000a, %r10
	.word 0x8a3c2bd4  ! 1: XNOR_I	xnor 	%r16, 0x0bd4, %r5
thr3_nuke_intr_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_313), 16, 16)) -> intp(2, 2, 1)
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
	.word 0xb8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r28
thr3_resum_intr_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_314), 16, 16)) -> intp(2, 3, 1)
	.word 0xb6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0x841c2a89  ! 1: XOR_I	xor 	%r16, 0x0a89, %r2
thr3_nuke_intr_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_315), 16, 16)) -> intp(2, 2, 1)
	.word 0xaac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0xb60c0011  ! 1: AND_R	and 	%r16, %r17, %r27
thr3_resum_intr_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_316), 16, 16)) -> intp(2, 3, 1)
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0x8e042228  ! 1: ADD_I	add 	%r16, 0x0228, %r7
	.word 0x952c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0xb33c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r25
thr3_nuke_intr_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_317), 16, 16)) -> intp(1, 2, 1)
	.word 0x960c0011  ! 1: AND_R	and 	%r16, %r17, %r11
	.word 0x972c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x9a1c2376  ! 1: XOR_I	xor 	%r16, 0x0376, %r13
thr3_resum_intr_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_318), 16, 16)) -> intp(1, 3, 1)
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x96b420fd  ! 1: ORNcc_I	orncc 	%r16, 0x00fd, %r11
	.word 0x84042891  ! 1: ADD_I	add 	%r16, 0x0891, %r2
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
thr3_hw_intr_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_319), 16, 16)) -> intp(1, 0, 1)
	.word 0x90b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
thr3_nuke_intr_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_320), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8442a95  ! 1: ADDC_I	addc 	%r16, 0x0a95, %r20
	.word 0xa8140011  ! 1: OR_R	or 	%r16, %r17, %r20
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
	.word 0x820c228f  ! 1: AND_I	and 	%r16, 0x028f, %r1
thr3_resum_intr_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_321), 16, 16)) -> intp(0, 3, 1)
	.word 0x993c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x94c42fb9  ! 1: ADDCcc_I	addccc 	%r16, 0x0fb9, %r10
thr3_hw_intr_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_322), 16, 16)) -> intp(0, 0, 1)
	.word 0x901c275c  ! 1: XOR_I	xor 	%r16, 0x075c, %r8
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
thr3_nuke_intr_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_323), 16, 16)) -> intp(1, 2, 1)
	.word 0xaac42a28  ! 1: ADDCcc_I	addccc 	%r16, 0x0a28, %r21
	.word 0xba3c2951  ! 1: XNOR_I	xnor 	%r16, 0x0951, %r29
	.word 0xb2ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r25
thr3_resum_intr_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_324), 16, 16)) -> intp(1, 3, 1)
	.word 0x91641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xaec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r23
thr3_hw_intr_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_325), 16, 16)) -> intp(2, 0, 1)
	.word 0x98b4207f  ! 1: ORNcc_I	orncc 	%r16, 0x007f, %r12
	.word 0x8f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x948c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r10
thr3_nuke_intr_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_326), 16, 16)) -> intp(1, 2, 1)
	.word 0x940c2e80  ! 1: AND_I	and 	%r16, 0x0e80, %r10
thr3_resum_intr_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_327), 16, 16)) -> intp(1, 3, 1)
	.word 0xaabc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0xaebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r23
thr3_nuke_intr_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_328), 16, 16)) -> intp(0, 2, 1)
	.word 0x9c2c24e3  ! 1: ANDN_I	andn 	%r16, 0x04e3, %r14
	.word 0x997c2401  ! 1: MOVR_I	move	%r16, 0x4e3, %r12
	.word 0x8b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r5
thr3_resum_intr_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_329), 16, 16)) -> intp(0, 3, 1)
	.word 0x88ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
thr3_nuke_intr_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_330), 16, 16)) -> intp(1, 2, 1)
	.word 0x8f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x88842bf5  ! 1: ADDcc_I	addcc 	%r16, 0x0bf5, %r4
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
thr3_resum_intr_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_331), 16, 16)) -> intp(1, 3, 1)
	.word 0xa72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r19
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
thr3_hw_intr_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_332), 16, 16)) -> intp(1, 0, 1)
	.word 0xaec42177  ! 1: ADDCcc_I	addccc 	%r16, 0x0177, %r23
	.word 0x89341011  ! 1: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x98bc29b1  ! 1: XNORcc_I	xnorcc 	%r16, 0x09b1, %r12
thr3_hw_intr_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_333), 16, 16)) -> intp(1, 0, 1)
	.word 0xb4842de1  ! 1: ADDcc_I	addcc 	%r16, 0x0de1, %r26
	.word 0xa89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0xad7c0411  ! 1: MOVR_R	move	%r16, %r17, %r22
	.word 0x9e9c246a  ! 1: XORcc_I	xorcc 	%r16, 0x046a, %r15
thr3_nuke_intr_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_334), 16, 16)) -> intp(0, 2, 1)
	.word 0x8abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r5
thr3_resum_intr_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_335), 16, 16)) -> intp(0, 3, 1)
	.word 0x96840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r11
thr3_hw_intr_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_336), 16, 16)) -> intp(2, 0, 1)
	.word 0x903426df  ! 1: ORN_I	orn 	%r16, 0x06df, %r8
	.word 0xa88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r20
thr3_hw_intr_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_337), 16, 16)) -> intp(1, 0, 1)
	.word 0xb02c2d20  ! 1: ANDN_I	andn 	%r16, 0x0d20, %r24
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
thr3_nuke_intr_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_338), 16, 16)) -> intp(1, 2, 1)
	.word 0xa84425bd  ! 1: ADDC_I	addc 	%r16, 0x05bd, %r20
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
thr3_resum_intr_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_339), 16, 16)) -> intp(1, 3, 1)
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
	.word 0x88c423d3  ! 1: ADDCcc_I	addccc 	%r16, 0x03d3, %r4
	.word 0x928c2029  ! 1: ANDcc_I	andcc 	%r16, 0x0029, %r9
thr3_nuke_intr_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_340), 16, 16)) -> intp(0, 2, 1)
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0xb6140011  ! 1: OR_R	or 	%r16, %r17, %r27
	.word 0x8e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r7
	.word 0xb2c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r25
thr3_resum_intr_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_341), 16, 16)) -> intp(0, 3, 1)
	.word 0xac8423d4  ! 1: ADDcc_I	addcc 	%r16, 0x03d4, %r22
	.word 0x9c9422b0  ! 1: ORcc_I	orcc 	%r16, 0x02b0, %r14
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
thr3_hw_intr_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_342), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e140011  ! 1: OR_R	or 	%r16, %r17, %r15
	.word 0x829422b1  ! 1: ORcc_I	orcc 	%r16, 0x02b1, %r1
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
thr3_hw_intr_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_343), 16, 16)) -> intp(2, 0, 1)
	.word 0xa8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x988422e6  ! 1: ADDcc_I	addcc 	%r16, 0x02e6, %r12
	.word 0x997c2401  ! 1: MOVR_I	move	%r16, 0xfffffee6, %r12
thr3_hw_intr_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_344), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r5
	.word 0xb42c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r26
	.word 0xa89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r20
thr3_hw_intr_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_345), 16, 16)) -> intp(0, 0, 1)
	.word 0x86ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r3
thr3_hw_intr_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_346), 16, 16)) -> intp(1, 0, 1)
	.word 0x8f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0xb49c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xb0bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0xa8bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r20
thr3_hw_intr_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_347), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e140011  ! 1: OR_R	or 	%r16, %r17, %r7
	.word 0x8a2c29da  ! 1: ANDN_I	andn 	%r16, 0x09da, %r5
thr3_hw_intr_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_348), 16, 16)) -> intp(0, 0, 1)
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
thr3_hw_intr_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_349), 16, 16)) -> intp(2, 0, 1)
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xae942ed8  ! 1: ORcc_I	orcc 	%r16, 0x0ed8, %r23
	.word 0xba140011  ! 1: OR_R	or 	%r16, %r17, %r29
	.word 0xb48c27a1  ! 1: ANDcc_I	andcc 	%r16, 0x07a1, %r26
thr3_nuke_intr_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_350), 16, 16)) -> intp(0, 2, 1)
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0x8d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r6
	.word 0x88140011  ! 1: OR_R	or 	%r16, %r17, %r4
	.word 0x82942d7d  ! 1: ORcc_I	orcc 	%r16, 0x0d7d, %r1
thr3_resum_intr_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_351), 16, 16)) -> intp(0, 3, 1)
	.word 0x90b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x9d641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_352), 16, 16)) -> intp(0, 2, 1)
	.word 0x9a0426d9  ! 1: ADD_I	add 	%r16, 0x06d9, %r13
	.word 0x8e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x972c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r11
thr3_resum_intr_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_353), 16, 16)) -> intp(0, 3, 1)
	.word 0xa6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r19
thr3_hw_intr_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_354), 16, 16)) -> intp(1, 0, 1)
	.word 0x969c2b6d  ! 1: XORcc_I	xorcc 	%r16, 0x0b6d, %r11
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
	.word 0x99343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r12
thr3_nuke_intr_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_355), 16, 16)) -> intp(0, 2, 1)
	.word 0x9d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x877c0411  ! 1: MOVR_R	move	%r16, %r17, %r3
	.word 0xb4bc2678  ! 1: XNORcc_I	xnorcc 	%r16, 0x0678, %r26
thr3_resum_intr_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_356), 16, 16)) -> intp(0, 3, 1)
	.word 0xba9c23f3  ! 1: XORcc_I	xorcc 	%r16, 0x03f3, %r29
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
thr3_hw_intr_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_357), 16, 16)) -> intp(1, 0, 1)
	.word 0xb6ac2084  ! 1: ANDNcc_I	andncc 	%r16, 0x0084, %r27
	.word 0xa8140011  ! 1: OR_R	or 	%r16, %r17, %r20
	.word 0xb494243d  ! 1: ORcc_I	orcc 	%r16, 0x043d, %r26
	.word 0x8a842b75  ! 1: ADDcc_I	addcc 	%r16, 0x0b75, %r5
thr3_hw_intr_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_358), 16, 16)) -> intp(1, 0, 1)
	.word 0xa8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r20
	.word 0xacbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0xac9c21e3  ! 1: XORcc_I	xorcc 	%r16, 0x01e3, %r22
thr3_nuke_intr_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_359), 16, 16)) -> intp(2, 2, 1)
	.word 0xa6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0xb43c26b0  ! 1: XNOR_I	xnor 	%r16, 0x06b0, %r26
thr3_resum_intr_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_360), 16, 16)) -> intp(2, 3, 1)
	.word 0xb8b42ce9  ! 1: ORNcc_I	orncc 	%r16, 0x0ce9, %r28
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
thr3_nuke_intr_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_361), 16, 16)) -> intp(2, 2, 1)
	.word 0xa63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r19
thr3_resum_intr_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_362), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c0c2c6d  ! 1: AND_I	and 	%r16, 0x0c6d, %r6
	.word 0x923c22b9  ! 1: XNOR_I	xnor 	%r16, 0x02b9, %r9
thr3_hw_intr_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_363), 16, 16)) -> intp(2, 0, 1)
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
	.word 0xb4c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r26
thr3_nuke_intr_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_364), 16, 16)) -> intp(0, 2, 1)
	.word 0xa72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r19
thr3_resum_intr_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_365), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8042b78  ! 1: ADD_I	add 	%r16, 0x0b78, %r28
	.word 0xad3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0xb9342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r28
thr3_nuke_intr_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_366), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e442ffa  ! 1: ADDC_I	addc 	%r16, 0x0ffa, %r15
	.word 0x828c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
	.word 0xad7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r22
thr3_resum_intr_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_367), 16, 16)) -> intp(1, 3, 1)
	.word 0xaabc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
thr3_nuke_intr_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_368), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0x953c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x8b7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r5
thr3_resum_intr_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_369), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa942dd2  ! 1: ORcc_I	orcc 	%r16, 0x0dd2, %r21
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
thr3_nuke_intr_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_370), 16, 16)) -> intp(1, 2, 1)
	.word 0xb8ac29f8  ! 1: ANDNcc_I	andncc 	%r16, 0x09f8, %r28
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0x9f641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_371), 16, 16)) -> intp(1, 3, 1)
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
	.word 0xb0442dc5  ! 1: ADDC_I	addc 	%r16, 0x0dc5, %r24
	.word 0x9a0c240c  ! 1: AND_I	and 	%r16, 0x040c, %r13
thr3_hw_intr_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_372), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x8c1c2899  ! 1: XOR_I	xor 	%r16, 0x0899, %r6
	.word 0x98340011  ! 1: ORN_R	orn 	%r16, %r17, %r12
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
thr3_hw_intr_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_373), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa440011  ! 1: ADDC_R	addc 	%r16, %r17, %r21
	.word 0xa6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r19
thr3_nuke_intr_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_374), 16, 16)) -> intp(1, 2, 1)
	.word 0xa92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0xa77c0411  ! 1: MOVR_R	move	%r16, %r17, %r19
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
thr3_resum_intr_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_375), 16, 16)) -> intp(1, 3, 1)
	.word 0x94940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x9eb42a3b  ! 1: ORNcc_I	orncc 	%r16, 0x0a3b, %r15
thr3_hw_intr_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_376), 16, 16)) -> intp(2, 0, 1)
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x993c0011  ! 1: SRA_R	sra 	%r16, %r17, %r12
	.word 0xbb641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_377), 16, 16)) -> intp(2, 0, 1)
	.word 0x922c261b  ! 1: ANDN_I	andn 	%r16, 0x061b, %r9
	.word 0x9ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xb42c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r26
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
thr3_hw_intr_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_378), 16, 16)) -> intp(2, 0, 1)
	.word 0x937c0411  ! 1: MOVR_R	move	%r16, %r17, %r9
	.word 0x87343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
thr3_nuke_intr_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_379), 16, 16)) -> intp(0, 2, 1)
	.word 0x8cbc273f  ! 1: XNORcc_I	xnorcc 	%r16, 0x073f, %r6
	.word 0xaa9c2ded  ! 1: XORcc_I	xorcc 	%r16, 0x0ded, %r21
thr3_resum_intr_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_380), 16, 16)) -> intp(0, 3, 1)
	.word 0x9abc2bde  ! 1: XNORcc_I	xnorcc 	%r16, 0x0bde, %r13
thr3_hw_intr_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_381), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e340011  ! 1: ORN_R	orn 	%r16, %r17, %r15
	.word 0x8abc2bc5  ! 1: XNORcc_I	xnorcc 	%r16, 0x0bc5, %r5
	.word 0x8d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r6
	.word 0x940c23c3  ! 1: AND_I	and 	%r16, 0x03c3, %r10
thr3_hw_intr_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_382), 16, 16)) -> intp(2, 0, 1)
	.word 0xb8bc256f  ! 1: XNORcc_I	xnorcc 	%r16, 0x056f, %r28
thr3_hw_intr_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_383), 16, 16)) -> intp(0, 0, 1)
	.word 0xb42c299d  ! 1: ANDN_I	andn 	%r16, 0x099d, %r26
thr3_nuke_intr_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_384), 16, 16)) -> intp(2, 2, 1)
	.word 0xb57c0411  ! 1: MOVR_R	move	%r16, %r17, %r26
	.word 0xab7c0411  ! 1: MOVR_R	move	%r16, %r17, %r21
	.word 0xb77c2401  ! 1: MOVR_I	move	%r16, 0x99d, %r27
	.word 0xac042c65  ! 1: ADD_I	add 	%r16, 0x0c65, %r22
thr3_resum_intr_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_385), 16, 16)) -> intp(2, 3, 1)
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
	.word 0xa61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r19
thr3_nuke_intr_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_386), 16, 16)) -> intp(2, 2, 1)
	.word 0xae3c20b5  ! 1: XNOR_I	xnor 	%r16, 0x00b5, %r23
thr3_resum_intr_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_387), 16, 16)) -> intp(2, 3, 1)
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
	.word 0xaaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0x840c24b7  ! 1: AND_I	and 	%r16, 0x04b7, %r2
	.word 0x92b423ff  ! 1: ORNcc_I	orncc 	%r16, 0x03ff, %r9
thr3_nuke_intr_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_388), 16, 16)) -> intp(2, 2, 1)
	.word 0xb8bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0x92042a88  ! 1: ADD_I	add 	%r16, 0x0a88, %r9
	.word 0xb77c0411  ! 1: MOVR_R	move	%r16, %r17, %r27
	.word 0xb9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r28
thr3_resum_intr_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_389), 16, 16)) -> intp(2, 3, 1)
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
thr3_nuke_intr_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_390), 16, 16)) -> intp(0, 2, 1)
	.word 0xa89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0xb00c2080  ! 1: AND_I	and 	%r16, 0x0080, %r24
	.word 0x86042bf8  ! 1: ADD_I	add 	%r16, 0x0bf8, %r3
thr3_resum_intr_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_391), 16, 16)) -> intp(0, 3, 1)
	.word 0x8f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r7
thr3_nuke_intr_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_392), 16, 16)) -> intp(0, 2, 1)
	.word 0x9b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xac3421ec  ! 1: ORN_I	orn 	%r16, 0x01ec, %r22
thr3_resum_intr_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_393), 16, 16)) -> intp(0, 3, 1)
	.word 0x9c142f6b  ! 1: OR_I	or 	%r16, 0x0f6b, %r14
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
	.word 0xaf3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r23
	.word 0x924424f7  ! 1: ADDC_I	addc 	%r16, 0x04f7, %r9
thr3_nuke_intr_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_394), 16, 16)) -> intp(0, 2, 1)
	.word 0x86b421a6  ! 1: ORNcc_I	orncc 	%r16, 0x01a6, %r3
	.word 0x94b42649  ! 1: ORNcc_I	orncc 	%r16, 0x0649, %r10
	.word 0xacc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r22
thr3_resum_intr_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_395), 16, 16)) -> intp(0, 3, 1)
	.word 0x8d643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa8942a5c  ! 1: ORcc_I	orcc 	%r16, 0x0a5c, %r20
	.word 0xb9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r28
thr3_hw_intr_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_396), 16, 16)) -> intp(0, 0, 1)
	.word 0x9d643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x86ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
thr3_nuke_intr_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_397), 16, 16)) -> intp(1, 2, 1)
	.word 0x82442fae  ! 1: ADDC_I	addc 	%r16, 0x0fae, %r1
	.word 0xb72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r27
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
thr3_resum_intr_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_398), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
thr3_nuke_intr_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_399), 16, 16)) -> intp(0, 2, 1)
	.word 0x983c2324  ! 1: XNOR_I	xnor 	%r16, 0x0324, %r12
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xaaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r21
thr3_resum_intr_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_400), 16, 16)) -> intp(0, 3, 1)
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
thr3_hw_intr_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_401), 16, 16)) -> intp(0, 0, 1)
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
thr3_hw_intr_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_402), 16, 16)) -> intp(0, 0, 1)
	.word 0x9f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r15
thr3_nuke_intr_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_403), 16, 16)) -> intp(0, 2, 1)
	.word 0x93340011  ! 1: SRL_R	srl 	%r16, %r17, %r9
thr3_resum_intr_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_404), 16, 16)) -> intp(0, 3, 1)
	.word 0xac1428ac  ! 1: OR_I	or 	%r16, 0x08ac, %r22
	.word 0x963c2486  ! 1: XNOR_I	xnor 	%r16, 0x0486, %r11
thr3_nuke_intr_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_405), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r27
thr3_resum_intr_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_406), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x9b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
thr3_hw_intr_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_407), 16, 16)) -> intp(1, 0, 1)
	.word 0x820c25e4  ! 1: AND_I	and 	%r16, 0x05e4, %r1
	.word 0x88840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
thr3_nuke_intr_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_408), 16, 16)) -> intp(0, 2, 1)
	.word 0x8c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0x8e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0x96842c51  ! 1: ADDcc_I	addcc 	%r16, 0x0c51, %r11
	.word 0x997c2401  ! 1: MOVR_I	move	%r16, 0xc51, %r12
thr3_resum_intr_409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_409), 16, 16)) -> intp(0, 3, 1)
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0x82042de0  ! 1: ADD_I	add 	%r16, 0x0de0, %r1
thr3_nuke_intr_410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_410), 16, 16)) -> intp(1, 2, 1)
	.word 0xb33c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
thr3_resum_intr_411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_411), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0x92c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x98942e7b  ! 1: ORcc_I	orcc 	%r16, 0x0e7b, %r12
thr3_hw_intr_412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_412), 16, 16)) -> intp(1, 0, 1)
	.word 0xac440011  ! 1: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x901427fc  ! 1: OR_I	or 	%r16, 0x07fc, %r8
	.word 0xb21c0011  ! 1: XOR_R	xor 	%r16, %r17, %r25
thr3_hw_intr_413:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_413), 16, 16)) -> intp(0, 0, 1)
	.word 0x8b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0xb77c2401  ! 1: MOVR_I	move	%r16, 0x1, %r27
thr3_hw_intr_414:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_414), 16, 16)) -> intp(2, 0, 1)
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
	.word 0x940c29ee  ! 1: AND_I	and 	%r16, 0x09ee, %r10
	.word 0x992c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
thr3_nuke_intr_415:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_415), 16, 16)) -> intp(1, 2, 1)
	.word 0x9444206f  ! 1: ADDC_I	addc 	%r16, 0x006f, %r10
	.word 0xad3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0x9c2c2a79  ! 1: ANDN_I	andn 	%r16, 0x0a79, %r14
thr3_resum_intr_416:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_416), 16, 16)) -> intp(1, 3, 1)
	.word 0x89643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x92840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r9
thr3_hw_intr_417:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_417), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c842454  ! 1: ADDcc_I	addcc 	%r16, 0x0454, %r14
	.word 0x873c1011  ! 1: SRAX_R	srax	%r16, %r17, %r3
thr3_nuke_intr_418:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_418), 16, 16)) -> intp(2, 2, 1)
	.word 0xb1343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0x820420c6  ! 1: ADD_I	add 	%r16, 0x00c6, %r1
	.word 0x821c0011  ! 1: XOR_R	xor 	%r16, %r17, %r1
	.word 0x8e842b15  ! 1: ADDcc_I	addcc 	%r16, 0x0b15, %r7
thr3_resum_intr_419:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_419), 16, 16)) -> intp(2, 3, 1)
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
thr3_hw_intr_420:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_420), 16, 16)) -> intp(2, 0, 1)
	.word 0x86ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
thr3_hw_intr_421:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_421), 16, 16)) -> intp(2, 0, 1)
	.word 0x993c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0xaa2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r21
thr3_nuke_intr_422:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_422), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x8c0c0011  ! 1: AND_R	and 	%r16, %r17, %r6
thr3_resum_intr_423:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_423), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e2c2e73  ! 1: ANDN_I	andn 	%r16, 0x0e73, %r7
	.word 0x9cac249c  ! 1: ANDNcc_I	andncc 	%r16, 0x049c, %r14
thr3_nuke_intr_424:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_424), 16, 16)) -> intp(1, 2, 1)
	.word 0x941426c9  ! 1: OR_I	or 	%r16, 0x06c9, %r10
	.word 0xb57c2401  ! 1: MOVR_I	move	%r16, 0xfffffec9, %r26
	.word 0xa60c2258  ! 1: AND_I	and 	%r16, 0x0258, %r19
thr3_resum_intr_425:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_425), 16, 16)) -> intp(1, 3, 1)
	.word 0xb4342d66  ! 1: ORN_I	orn 	%r16, 0x0d66, %r26
thr3_nuke_intr_426:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_426), 16, 16)) -> intp(0, 2, 1)
	.word 0x92b42f87  ! 1: ORNcc_I	orncc 	%r16, 0x0f87, %r9
	.word 0xab7c0411  ! 1: MOVR_R	move	%r16, %r17, %r21
thr3_resum_intr_427:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_427), 16, 16)) -> intp(0, 3, 1)
	.word 0xba2c29d9  ! 1: ANDN_I	andn 	%r16, 0x09d9, %r29
	.word 0xb60c0011  ! 1: AND_R	and 	%r16, %r17, %r27
	.word 0x8a8429da  ! 1: ADDcc_I	addcc 	%r16, 0x09da, %r5
thr3_hw_intr_428:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_428), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e3c2993  ! 1: XNOR_I	xnor 	%r16, 0x0993, %r15
	.word 0x922c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r9
	.word 0x8a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r5
thr3_nuke_intr_429:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_429), 16, 16)) -> intp(1, 2, 1)
	.word 0x92c42dff  ! 1: ADDCcc_I	addccc 	%r16, 0x0dff, %r9
	.word 0xaabc2173  ! 1: XNORcc_I	xnorcc 	%r16, 0x0173, %r21
thr3_resum_intr_430:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_430), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r23
	.word 0x8cac223d  ! 1: ANDNcc_I	andncc 	%r16, 0x023d, %r6
	.word 0x841c27ca  ! 1: XOR_I	xor 	%r16, 0x07ca, %r2
thr3_nuke_intr_431:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_431), 16, 16)) -> intp(0, 2, 1)
	.word 0x952c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r10
thr3_resum_intr_432:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_432), 16, 16)) -> intp(0, 3, 1)
	.word 0x84140011  ! 1: OR_R	or 	%r16, %r17, %r2
	.word 0x90842edc  ! 1: ADDcc_I	addcc 	%r16, 0x0edc, %r8
	.word 0xaa2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r21
	.word 0xa7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r19
thr3_nuke_intr_433:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_433), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8c4228d  ! 1: ADDCcc_I	addccc 	%r16, 0x028d, %r20
	.word 0x8e3c21ea  ! 1: XNOR_I	xnor 	%r16, 0x01ea, %r7
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
thr3_resum_intr_434:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_434), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8b42c34  ! 1: ORNcc_I	orncc 	%r16, 0x0c34, %r28
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
thr3_nuke_intr_435:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_435), 16, 16)) -> intp(0, 2, 1)
	.word 0x89342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x92b42e7b  ! 1: ORNcc_I	orncc 	%r16, 0x0e7b, %r9
thr3_resum_intr_436:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_436), 16, 16)) -> intp(0, 3, 1)
	.word 0x9c3c29f5  ! 1: XNOR_I	xnor 	%r16, 0x09f5, %r14
	.word 0xb43c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
	.word 0x823c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r1
thr3_nuke_intr_437:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_437), 16, 16)) -> intp(0, 2, 1)
	.word 0xb02c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r24
	.word 0x857c0411  ! 1: MOVR_R	move	%r16, %r17, %r2
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
thr3_resum_intr_438:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_438), 16, 16)) -> intp(0, 3, 1)
	.word 0xb64428dc  ! 1: ADDC_I	addc 	%r16, 0x08dc, %r27
thr3_nuke_intr_439:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_439), 16, 16)) -> intp(0, 2, 1)
	.word 0xb33c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0x98b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0xaa2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r21
thr3_resum_intr_440:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_440), 16, 16)) -> intp(0, 3, 1)
	.word 0xb2ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
thr3_nuke_intr_441:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_441), 16, 16)) -> intp(0, 2, 1)
	.word 0x92b4283e  ! 1: ORNcc_I	orncc 	%r16, 0x083e, %r9
	.word 0x98b423f9  ! 1: ORNcc_I	orncc 	%r16, 0x03f9, %r12
thr3_resum_intr_442:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_442), 16, 16)) -> intp(0, 3, 1)
	.word 0x8cc42088  ! 1: ADDCcc_I	addccc 	%r16, 0x0088, %r6
	.word 0xb57c2401  ! 1: MOVR_I	move	%r16, 0x88, %r26
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0xb0140011  ! 1: OR_R	or 	%r16, %r17, %r24
thr3_nuke_intr_443:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_443), 16, 16)) -> intp(0, 2, 1)
	.word 0x821429ce  ! 1: OR_I	or 	%r16, 0x09ce, %r1
	.word 0xab342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x8c9c274b  ! 1: XORcc_I	xorcc 	%r16, 0x074b, %r6
thr3_resum_intr_444:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_444), 16, 16)) -> intp(0, 3, 1)
	.word 0xb2042afc  ! 1: ADD_I	add 	%r16, 0x0afc, %r25
	.word 0xbb341011  ! 1: SRLX_R	srlx	%r16, %r17, %r29
	.word 0xb22c23d5  ! 1: ANDN_I	andn 	%r16, 0x03d5, %r25
thr3_nuke_intr_445:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_445), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4c420bd  ! 1: ADDCcc_I	addccc 	%r16, 0x00bd, %r26
	.word 0xbb3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r29
thr3_resum_intr_446:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_446), 16, 16)) -> intp(0, 3, 1)
	.word 0x82442265  ! 1: ADDC_I	addc 	%r16, 0x0265, %r1
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x9cac258d  ! 1: ANDNcc_I	andncc 	%r16, 0x058d, %r14
	.word 0x9c142cca  ! 1: OR_I	or 	%r16, 0x0cca, %r14
thr3_hw_intr_447:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_447), 16, 16)) -> intp(0, 0, 1)
	.word 0xab643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
	.word 0xb8942cee  ! 1: ORcc_I	orcc 	%r16, 0x0cee, %r28
	.word 0x8cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r6
thr3_nuke_intr_448:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_448), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa440011  ! 1: ADDC_R	addc 	%r16, %r17, %r21
thr3_resum_intr_449:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_449), 16, 16)) -> intp(1, 3, 1)
	.word 0x837c0411  ! 1: MOVR_R	move	%r16, %r17, %r1
	.word 0x8d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r6
	.word 0xb12c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
thr3_nuke_intr_450:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_450), 16, 16)) -> intp(2, 2, 1)
	.word 0x86840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r3
thr3_resum_intr_451:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_451), 16, 16)) -> intp(2, 3, 1)
	.word 0xb0840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0x9a342518  ! 1: ORN_I	orn 	%r16, 0x0518, %r13
	.word 0xac4429c4  ! 1: ADDC_I	addc 	%r16, 0x09c4, %r22
thr3_nuke_intr_452:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_452), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
thr3_resum_intr_453:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_453), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a3c26a9  ! 1: XNOR_I	xnor 	%r16, 0x06a9, %r5
thr3_hw_intr_454:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_454), 16, 16)) -> intp(0, 0, 1)
	.word 0x917c0411  ! 1: MOVR_R	move	%r16, %r17, %r8
	.word 0x900c0011  ! 1: AND_R	and 	%r16, %r17, %r8
	.word 0xa97c2401  ! 1: MOVR_I	move	%r16, 0x11, %r20
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
thr3_hw_intr_455:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_455), 16, 16)) -> intp(0, 0, 1)
	.word 0xae340011  ! 1: ORN_R	orn 	%r16, %r17, %r23
thr3_hw_intr_456:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_456), 16, 16)) -> intp(2, 0, 1)
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
thr3_nuke_intr_457:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_457), 16, 16)) -> intp(0, 2, 1)
	.word 0x917c0411  ! 1: MOVR_R	move	%r16, %r17, %r8
	.word 0x90b4297b  ! 1: ORNcc_I	orncc 	%r16, 0x097b, %r8
thr3_resum_intr_458:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_458), 16, 16)) -> intp(0, 3, 1)
	.word 0x9e8c2146  ! 1: ANDcc_I	andcc 	%r16, 0x0146, %r15
	.word 0xb4b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0xb72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r27
thr3_hw_intr_459:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_459), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa942541  ! 1: ORcc_I	orcc 	%r16, 0x0541, %r21
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0xb8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r28
	.word 0xb48c2283  ! 1: ANDcc_I	andcc 	%r16, 0x0283, %r26
thr3_nuke_intr_460:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_460), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r21
	.word 0x92c42c37  ! 1: ADDCcc_I	addccc 	%r16, 0x0c37, %r9
thr3_resum_intr_461:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_461), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r15
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
	.word 0xaf7c0411  ! 1: MOVR_R	move	%r16, %r17, %r23
	.word 0x909c2884  ! 1: XORcc_I	xorcc 	%r16, 0x0884, %r8
thr3_hw_intr_462:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_462), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
thr3_hw_intr_463:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_463), 16, 16)) -> intp(1, 0, 1)
	.word 0x9a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0xb0bc2594  ! 1: XNORcc_I	xnorcc 	%r16, 0x0594, %r24
thr3_nuke_intr_464:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_464), 16, 16)) -> intp(2, 2, 1)
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
	.word 0xb2840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0x8e3c28c1  ! 1: XNOR_I	xnor 	%r16, 0x08c1, %r7
	.word 0x957c2401  ! 1: MOVR_I	move	%r16, 0x8c1, %r10
thr3_resum_intr_465:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_465), 16, 16)) -> intp(2, 3, 1)
	.word 0xb40c0011  ! 1: AND_R	and 	%r16, %r17, %r26
	.word 0x82340011  ! 1: ORN_R	orn 	%r16, %r17, %r1
	.word 0xaebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r23
	.word 0xb00c2360  ! 1: AND_I	and 	%r16, 0x0360, %r24
thr3_hw_intr_466:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_466), 16, 16)) -> intp(2, 0, 1)
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
	.word 0x9c342d71  ! 1: ORN_I	orn 	%r16, 0x0d71, %r14
	.word 0x84942c5b  ! 1: ORcc_I	orcc 	%r16, 0x0c5b, %r2
thr3_nuke_intr_467:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_467), 16, 16)) -> intp(1, 2, 1)
	.word 0xab641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_468:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_468), 16, 16)) -> intp(1, 3, 1)
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
	.word 0xad3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r22
	.word 0x90ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x85641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_469:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_469), 16, 16)) -> intp(2, 0, 1)
	.word 0x9ab42a34  ! 1: ORNcc_I	orncc 	%r16, 0x0a34, %r13
	.word 0xb6842ac8  ! 1: ADDcc_I	addcc 	%r16, 0x0ac8, %r27
	.word 0x86442350  ! 1: ADDC_I	addc 	%r16, 0x0350, %r3
thr3_nuke_intr_470:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_470), 16, 16)) -> intp(2, 2, 1)
	.word 0xa7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r19
thr3_resum_intr_471:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_471), 16, 16)) -> intp(2, 3, 1)
	.word 0xae942888  ! 1: ORcc_I	orcc 	%r16, 0x0888, %r23
	.word 0x832c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x8c042881  ! 1: ADD_I	add 	%r16, 0x0881, %r6
thr3_nuke_intr_472:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_472), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e1c28b9  ! 1: XOR_I	xor 	%r16, 0x08b9, %r15
	.word 0xbab42653  ! 1: ORNcc_I	orncc 	%r16, 0x0653, %r29
thr3_resum_intr_473:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_473), 16, 16)) -> intp(1, 3, 1)
	.word 0xb68c2317  ! 1: ANDcc_I	andcc 	%r16, 0x0317, %r27
	.word 0xba840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0x942c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r10
thr3_nuke_intr_474:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_474), 16, 16)) -> intp(2, 2, 1)
	.word 0xb3641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x863c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r3
thr3_resum_intr_475:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_475), 16, 16)) -> intp(2, 3, 1)
	.word 0xb4bc2193  ! 1: XNORcc_I	xnorcc 	%r16, 0x0193, %r26
	.word 0x8e8c247b  ! 1: ANDcc_I	andcc 	%r16, 0x047b, %r7
	.word 0xba2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r29
	.word 0x881c2707  ! 1: XOR_I	xor 	%r16, 0x0707, %r4
thr3_nuke_intr_476:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_476), 16, 16)) -> intp(2, 2, 1)
	.word 0x993c1011  ! 1: SRAX_R	srax	%r16, %r17, %r12
thr3_resum_intr_477:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_477), 16, 16)) -> intp(2, 3, 1)
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
	.word 0x8cb42117  ! 1: ORNcc_I	orncc 	%r16, 0x0117, %r6
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
thr3_nuke_intr_478:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_478), 16, 16)) -> intp(1, 2, 1)
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
thr3_resum_intr_479:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_479), 16, 16)) -> intp(1, 3, 1)
	.word 0xa6340011  ! 1: ORN_R	orn 	%r16, %r17, %r19
	.word 0x9884267a  ! 1: ADDcc_I	addcc 	%r16, 0x067a, %r12
thr3_hw_intr_480:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_480), 16, 16)) -> intp(2, 0, 1)
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
	.word 0xae040011  ! 1: ADD_R	add 	%r16, %r17, %r23
	.word 0x90ac2a7a  ! 1: ANDNcc_I	andncc 	%r16, 0x0a7a, %r8
thr3_nuke_intr_481:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_481), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
	.word 0x94bc231d  ! 1: XNORcc_I	xnorcc 	%r16, 0x031d, %r10
	.word 0x8c0c206f  ! 1: AND_I	and 	%r16, 0x006f, %r6
thr3_resum_intr_482:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_482), 16, 16)) -> intp(2, 3, 1)
	.word 0x8d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0xb4b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r26
thr3_hw_intr_483:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_483), 16, 16)) -> intp(1, 0, 1)
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
thr3_hw_intr_484:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_484), 16, 16)) -> intp(1, 0, 1)
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
	.word 0xbb2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r29
thr3_hw_intr_485:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_485), 16, 16)) -> intp(1, 0, 1)
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x8a3c2d13  ! 1: XNOR_I	xnor 	%r16, 0x0d13, %r5
	.word 0xb0042ae4  ! 1: ADD_I	add 	%r16, 0x0ae4, %r24
thr3_hw_intr_486:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_486), 16, 16)) -> intp(2, 0, 1)
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
	.word 0xb2942eff  ! 1: ORcc_I	orcc 	%r16, 0x0eff, %r25
	.word 0x948c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0xa7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r19
thr3_hw_intr_487:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_487), 16, 16)) -> intp(2, 0, 1)
	.word 0x9a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x86c42b2a  ! 1: ADDCcc_I	addccc 	%r16, 0x0b2a, %r3
thr3_hw_intr_488:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_488), 16, 16)) -> intp(0, 0, 1)
	.word 0x94042ace  ! 1: ADD_I	add 	%r16, 0x0ace, %r10
thr3_hw_intr_489:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_489), 16, 16)) -> intp(2, 0, 1)
	.word 0x8b643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_490:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_490), 16, 16)) -> intp(0, 0, 1)
	.word 0xb2bc200b  ! 1: XNORcc_I	xnorcc 	%r16, 0x000b, %r25
thr3_nuke_intr_491:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_491), 16, 16)) -> intp(0, 2, 1)
	.word 0x88142cac  ! 1: OR_I	or 	%r16, 0x0cac, %r4
	.word 0xa8bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
thr3_resum_intr_492:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_492), 16, 16)) -> intp(0, 3, 1)
	.word 0x8b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r5
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
thr3_hw_intr_493:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_493), 16, 16)) -> intp(2, 0, 1)
	.word 0x92442967  ! 1: ADDC_I	addc 	%r16, 0x0967, %r9
	.word 0x89343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r4
thr3_hw_intr_494:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_494), 16, 16)) -> intp(1, 0, 1)
	.word 0xb29c202e  ! 1: XORcc_I	xorcc 	%r16, 0x002e, %r25
	.word 0xb4340011  ! 1: ORN_R	orn 	%r16, %r17, %r26
	.word 0xa8ac2423  ! 1: ANDNcc_I	andncc 	%r16, 0x0423, %r20
thr3_hw_intr_495:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_495), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c142528  ! 1: OR_I	or 	%r16, 0x0528, %r14
	.word 0x88b42a65  ! 1: ORNcc_I	orncc 	%r16, 0x0a65, %r4
thr3_hw_intr_496:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_496), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e140011  ! 1: OR_R	or 	%r16, %r17, %r15
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x9e0426e7  ! 1: ADD_I	add 	%r16, 0x06e7, %r15
thr3_hw_intr_497:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_497), 16, 16)) -> intp(2, 0, 1)
	.word 0x872c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x84ac210e  ! 1: ANDNcc_I	andncc 	%r16, 0x010e, %r2
thr3_nuke_intr_498:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_498), 16, 16)) -> intp(1, 2, 1)
	.word 0xb5643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
thr3_resum_intr_499:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_499), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x823428c3  ! 1: ORN_I	orn 	%r16, 0x08c3, %r1
thr3_hw_intr_500:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_500), 16, 16)) -> intp(1, 0, 1)
	.word 0x829c2822  ! 1: XORcc_I	xorcc 	%r16, 0x0822, %r1
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
thr3_nuke_intr_501:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_501), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0x94c42fe2  ! 1: ADDCcc_I	addccc 	%r16, 0x0fe2, %r10
	.word 0xb72c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0x98140011  ! 1: OR_R	or 	%r16, %r17, %r12
thr3_resum_intr_502:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_502), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r28
	.word 0x9cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0x9a142a6a  ! 1: OR_I	or 	%r16, 0x0a6a, %r13
	.word 0xa92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r20
thr3_nuke_intr_503:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_503), 16, 16)) -> intp(0, 2, 1)
	.word 0x8cc42490  ! 1: ADDCcc_I	addccc 	%r16, 0x0490, %r6
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x9d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0x9c04220e  ! 1: ADD_I	add 	%r16, 0x020e, %r14
thr3_resum_intr_504:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_504), 16, 16)) -> intp(0, 3, 1)
	.word 0x9f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r15
thr3_hw_intr_505:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_505), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r24
thr3_hw_intr_506:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_506), 16, 16)) -> intp(1, 0, 1)
	.word 0x97641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_507:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_507), 16, 16)) -> intp(0, 0, 1)
	.word 0x853c1011  ! 1: SRAX_R	srax	%r16, %r17, %r2
	.word 0xb8bc28a8  ! 1: XNORcc_I	xnorcc 	%r16, 0x08a8, %r28
	.word 0x9b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r13
	.word 0xb53c1011  ! 1: SRAX_R	srax	%r16, %r17, %r26
thr3_hw_intr_508:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_508), 16, 16)) -> intp(1, 0, 1)
	.word 0x88342007  ! 1: ORN_I	orn 	%r16, 0x0007, %r4
thr3_nuke_intr_509:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_509), 16, 16)) -> intp(2, 2, 1)
	.word 0x909c2b89  ! 1: XORcc_I	xorcc 	%r16, 0x0b89, %r8
thr3_resum_intr_510:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_510), 16, 16)) -> intp(2, 3, 1)
	.word 0x932c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0xb0842456  ! 1: ADDcc_I	addcc 	%r16, 0x0456, %r24
thr3_nuke_intr_511:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_511), 16, 16)) -> intp(0, 2, 1)
	.word 0x8eac20b5  ! 1: ANDNcc_I	andncc 	%r16, 0x00b5, %r7
	.word 0x8c1c26d6  ! 1: XOR_I	xor 	%r16, 0x06d6, %r6
thr3_resum_intr_512:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_512), 16, 16)) -> intp(0, 3, 1)
	.word 0x861c279b  ! 1: XOR_I	xor 	%r16, 0x079b, %r3
	.word 0x8d340011  ! 1: SRL_R	srl 	%r16, %r17, %r6
thr3_nuke_intr_513:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_513), 16, 16)) -> intp(2, 2, 1)
	.word 0x94842e48  ! 1: ADDcc_I	addcc 	%r16, 0x0e48, %r10
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
thr3_resum_intr_514:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_514), 16, 16)) -> intp(2, 3, 1)
	.word 0x9d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r14
	.word 0x85643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x92342c2f  ! 1: ORN_I	orn 	%r16, 0x0c2f, %r9
thr3_hw_intr_515:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_515), 16, 16)) -> intp(1, 0, 1)
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0xb33c1011  ! 1: SRAX_R	srax	%r16, %r17, %r25
	.word 0xb03422db  ! 1: ORN_I	orn 	%r16, 0x02db, %r24
thr3_nuke_intr_516:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_516), 16, 16)) -> intp(1, 2, 1)
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0xb3342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x832c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r1
thr3_resum_intr_517:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_517), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e0423cb  ! 1: ADD_I	add 	%r16, 0x03cb, %r7
	.word 0xba340011  ! 1: ORN_R	orn 	%r16, %r17, %r29
thr3_nuke_intr_518:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_518), 16, 16)) -> intp(2, 2, 1)
	.word 0x88ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0xaf3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r23
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x9a9c286d  ! 1: XORcc_I	xorcc 	%r16, 0x086d, %r13
thr3_resum_intr_519:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_519), 16, 16)) -> intp(2, 3, 1)
	.word 0x997c0411  ! 1: MOVR_R	move	%r16, %r17, %r12
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
thr3_nuke_intr_520:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_520), 16, 16)) -> intp(0, 2, 1)
	.word 0x93641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
thr3_resum_intr_521:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_521), 16, 16)) -> intp(0, 3, 1)
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
	.word 0x9a8c2a45  ! 1: ANDcc_I	andcc 	%r16, 0x0a45, %r13
thr3_hw_intr_522:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_522), 16, 16)) -> intp(1, 0, 1)
	.word 0x900c0011  ! 1: AND_R	and 	%r16, %r17, %r8
	.word 0xb12c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0xba8c22af  ! 1: ANDcc_I	andcc 	%r16, 0x02af, %r29
	.word 0x9eac2e0d  ! 1: ANDNcc_I	andncc 	%r16, 0x0e0d, %r15
thr3_nuke_intr_523:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_523), 16, 16)) -> intp(0, 2, 1)
	.word 0x9e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r15
	.word 0xbabc21de  ! 1: XNORcc_I	xnorcc 	%r16, 0x01de, %r29
	.word 0x9eac285b  ! 1: ANDNcc_I	andncc 	%r16, 0x085b, %r15
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
thr3_resum_intr_524:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_524), 16, 16)) -> intp(0, 3, 1)
	.word 0xa83c2460  ! 1: XNOR_I	xnor 	%r16, 0x0460, %r20
	.word 0xb3641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb21c2054  ! 1: XOR_I	xor 	%r16, 0x0054, %r25
thr3_hw_intr_525:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_525), 16, 16)) -> intp(0, 0, 1)
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xa6040011  ! 1: ADD_R	add 	%r16, %r17, %r19
thr3_hw_intr_526:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_526), 16, 16)) -> intp(0, 0, 1)
	.word 0x8b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r5
	.word 0x952c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x8eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r7
thr3_nuke_intr_527:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_527), 16, 16)) -> intp(1, 2, 1)
	.word 0x90942da5  ! 1: ORcc_I	orcc 	%r16, 0x0da5, %r8
	.word 0x98b42086  ! 1: ORNcc_I	orncc 	%r16, 0x0086, %r12
	.word 0x84340011  ! 1: ORN_R	orn 	%r16, %r17, %r2
	.word 0x8a0c260b  ! 1: AND_I	and 	%r16, 0x060b, %r5
thr3_resum_intr_528:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_528), 16, 16)) -> intp(1, 3, 1)
	.word 0xb8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0xb0bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0x857c0411  ! 1: MOVR_R	move	%r16, %r17, %r2
thr3_hw_intr_529:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_529), 16, 16)) -> intp(1, 0, 1)
	.word 0x840c0011  ! 1: AND_R	and 	%r16, %r17, %r2
	.word 0xac140011  ! 1: OR_R	or 	%r16, %r17, %r22
	.word 0x96bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0xb0142111  ! 1: OR_I	or 	%r16, 0x0111, %r24
thr3_hw_intr_530:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_530), 16, 16)) -> intp(1, 0, 1)
	.word 0x949c2fb1  ! 1: XORcc_I	xorcc 	%r16, 0x0fb1, %r10
thr3_nuke_intr_531:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_531), 16, 16)) -> intp(1, 2, 1)
	.word 0xbab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r29
thr3_resum_intr_532:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_532), 16, 16)) -> intp(1, 3, 1)
	.word 0x8b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r5
thr3_nuke_intr_533:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_533), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r13
	.word 0x8a0c0011  ! 1: AND_R	and 	%r16, %r17, %r5
thr3_resum_intr_534:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_534), 16, 16)) -> intp(2, 3, 1)
	.word 0xad342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0xac2c230b  ! 1: ANDN_I	andn 	%r16, 0x030b, %r22
thr3_nuke_intr_535:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_535), 16, 16)) -> intp(1, 2, 1)
	.word 0x997c2401  ! 1: MOVR_I	move	%r16, 0xffffff0b, %r12
	.word 0x897c2401  ! 1: MOVR_I	move	%r16, 0xffffff0b, %r4
	.word 0x853c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0x843c217f  ! 1: XNOR_I	xnor 	%r16, 0x017f, %r2
thr3_resum_intr_536:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_536), 16, 16)) -> intp(1, 3, 1)
	.word 0xb08c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r24
thr3_hw_intr_537:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_537), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
thr3_hw_intr_538:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_538), 16, 16)) -> intp(0, 0, 1)
	.word 0x8e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0xb0ac27c3  ! 1: ANDNcc_I	andncc 	%r16, 0x07c3, %r24
	.word 0xa8842877  ! 1: ADDcc_I	addcc 	%r16, 0x0877, %r20
thr3_hw_intr_539:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_539), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r29
	.word 0xaeb42004  ! 1: ORNcc_I	orncc 	%r16, 0x0004, %r23
	.word 0xb09c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x823c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r1
thr3_nuke_intr_540:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_540), 16, 16)) -> intp(1, 2, 1)
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
	.word 0xac3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
thr3_resum_intr_541:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_541), 16, 16)) -> intp(1, 3, 1)
	.word 0xa88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0x9a3c2fcf  ! 1: XNOR_I	xnor 	%r16, 0x0fcf, %r13
	.word 0x9c942e4e  ! 1: ORcc_I	orcc 	%r16, 0x0e4e, %r14
	.word 0xa80422c8  ! 1: ADD_I	add 	%r16, 0x02c8, %r20
thr3_hw_intr_542:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_542), 16, 16)) -> intp(2, 0, 1)
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x8f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r7
thr3_hw_intr_543:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_543), 16, 16)) -> intp(0, 0, 1)
	.word 0x9eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
	.word 0xac1c21f7  ! 1: XOR_I	xor 	%r16, 0x01f7, %r22
thr3_nuke_intr_544:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_544), 16, 16)) -> intp(0, 2, 1)
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x94942dda  ! 1: ORcc_I	orcc 	%r16, 0x0dda, %r10
thr3_resum_intr_545:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_545), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x877c2401  ! 1: MOVR_I	move	%r16, 0x11, %r3
	.word 0xb8042598  ! 1: ADD_I	add 	%r16, 0x0598, %r28
	.word 0xb49c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r26
thr3_hw_intr_546:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_546), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a342114  ! 1: ORN_I	orn 	%r16, 0x0114, %r13
	.word 0xb69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0xaebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r23
	.word 0x9eac2ca6  ! 1: ANDNcc_I	andncc 	%r16, 0x0ca6, %r15
thr3_nuke_intr_547:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_547), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a2c230d  ! 1: ANDN_I	andn 	%r16, 0x030d, %r5
	.word 0x9a142fc0  ! 1: OR_I	or 	%r16, 0x0fc0, %r13
	.word 0x9eb4236c  ! 1: ORNcc_I	orncc 	%r16, 0x036c, %r15
	.word 0x903c2763  ! 1: XNOR_I	xnor 	%r16, 0x0763, %r8
thr3_resum_intr_548:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_548), 16, 16)) -> intp(2, 3, 1)
	.word 0x82340011  ! 1: ORN_R	orn 	%r16, %r17, %r1
	.word 0x8a3c21af  ! 1: XNOR_I	xnor 	%r16, 0x01af, %r5
	.word 0x96142a40  ! 1: OR_I	or 	%r16, 0x0a40, %r11
thr3_nuke_intr_549:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_549), 16, 16)) -> intp(2, 2, 1)
	.word 0xaabc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0xaa14221a  ! 1: OR_I	or 	%r16, 0x021a, %r21
	.word 0x821c0011  ! 1: XOR_R	xor 	%r16, %r17, %r1
	.word 0x893c1011  ! 1: SRAX_R	srax	%r16, %r17, %r4
thr3_resum_intr_550:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_550), 16, 16)) -> intp(2, 3, 1)
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0xae142382  ! 1: OR_I	or 	%r16, 0x0382, %r23
thr3_hw_intr_551:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_551), 16, 16)) -> intp(1, 0, 1)
	.word 0xb13c0011  ! 1: SRA_R	sra 	%r16, %r17, %r24
	.word 0x8c342e05  ! 1: ORN_I	orn 	%r16, 0x0e05, %r6
thr3_nuke_intr_552:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_552), 16, 16)) -> intp(0, 2, 1)
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x92c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xae3420f5  ! 1: ORN_I	orn 	%r16, 0x00f5, %r23
thr3_resum_intr_553:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_553), 16, 16)) -> intp(0, 3, 1)
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x89643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r27
thr3_hw_intr_554:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_554), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a442bd8  ! 1: ADDC_I	addc 	%r16, 0x0bd8, %r13
	.word 0x9e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0x937c0411  ! 1: MOVR_R	move	%r16, %r17, %r9
thr3_hw_intr_555:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_555), 16, 16)) -> intp(2, 0, 1)
	.word 0xac040011  ! 1: ADD_R	add 	%r16, %r17, %r22
	.word 0x98bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x828c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r1
thr3_hw_intr_556:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_556), 16, 16)) -> intp(2, 0, 1)
	.word 0x92ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r9
thr3_hw_intr_557:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_557), 16, 16)) -> intp(0, 0, 1)
	.word 0xb48c2794  ! 1: ANDcc_I	andcc 	%r16, 0x0794, %r26
	.word 0x949c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0x923c2eeb  ! 1: XNOR_I	xnor 	%r16, 0x0eeb, %r9
thr3_nuke_intr_558:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_558), 16, 16)) -> intp(1, 2, 1)
	.word 0x83641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xac340011  ! 1: ORN_R	orn 	%r16, %r17, %r22
thr3_resum_intr_559:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_559), 16, 16)) -> intp(1, 3, 1)
	.word 0x98842e3d  ! 1: ADDcc_I	addcc 	%r16, 0x0e3d, %r12
	.word 0x98c42de0  ! 1: ADDCcc_I	addccc 	%r16, 0x0de0, %r12
	.word 0xaa042230  ! 1: ADD_I	add 	%r16, 0x0230, %r21
thr3_nuke_intr_560:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_560), 16, 16)) -> intp(1, 2, 1)
	.word 0x8ac42446  ! 1: ADDCcc_I	addccc 	%r16, 0x0446, %r5
	.word 0x8c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r6
	.word 0x8abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
thr3_resum_intr_561:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_561), 16, 16)) -> intp(1, 3, 1)
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x8f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r7
	.word 0xa63428ac  ! 1: ORN_I	orn 	%r16, 0x08ac, %r19
thr3_hw_intr_562:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_562), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
	.word 0xa9340011  ! 1: SRL_R	srl 	%r16, %r17, %r20
	.word 0x889c2088  ! 1: XORcc_I	xorcc 	%r16, 0x0088, %r4
thr3_nuke_intr_563:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_563), 16, 16)) -> intp(2, 2, 1)
	.word 0xb8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0x91340011  ! 1: SRL_R	srl 	%r16, %r17, %r8
thr3_resum_intr_564:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_564), 16, 16)) -> intp(2, 3, 1)
	.word 0xb4040011  ! 1: ADD_R	add 	%r16, %r17, %r26
	.word 0x9e9c2c59  ! 1: XORcc_I	xorcc 	%r16, 0x0c59, %r15
	.word 0xab3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r21
thr3_nuke_intr_565:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_565), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
thr3_resum_intr_566:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_566), 16, 16)) -> intp(2, 3, 1)
	.word 0x95341011  ! 1: SRLX_R	srlx	%r16, %r17, %r10
	.word 0xaeac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0x853c1011  ! 1: SRAX_R	srax	%r16, %r17, %r2
thr3_nuke_intr_567:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_567), 16, 16)) -> intp(0, 2, 1)
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0xad7c2401  ! 1: MOVR_I	move	%r16, 0x1, %r22
thr3_resum_intr_568:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_568), 16, 16)) -> intp(0, 3, 1)
	.word 0xa82c257a  ! 1: ANDN_I	andn 	%r16, 0x057a, %r20
	.word 0x8a1c2529  ! 1: XOR_I	xor 	%r16, 0x0529, %r5
thr3_nuke_intr_569:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_569), 16, 16)) -> intp(1, 2, 1)
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
	.word 0x9cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0x82c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
thr3_resum_intr_570:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_570), 16, 16)) -> intp(1, 3, 1)
	.word 0x98440011  ! 1: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x9b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r13
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
thr3_nuke_intr_571:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_571), 16, 16)) -> intp(2, 2, 1)
	.word 0xacc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x97343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0xbb343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r29
thr3_resum_intr_572:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_572), 16, 16)) -> intp(2, 3, 1)
	.word 0xb23c22c1  ! 1: XNOR_I	xnor 	%r16, 0x02c1, %r25
	.word 0x88842f62  ! 1: ADDcc_I	addcc 	%r16, 0x0f62, %r4
	.word 0x9c842cff  ! 1: ADDcc_I	addcc 	%r16, 0x0cff, %r14
	.word 0x98b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r12
thr3_hw_intr_573:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_573), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r26
thr3_hw_intr_574:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_574), 16, 16)) -> intp(0, 0, 1)
	.word 0x94142c52  ! 1: OR_I	or 	%r16, 0x0c52, %r10
	.word 0xb41c2674  ! 1: XOR_I	xor 	%r16, 0x0674, %r26
thr3_hw_intr_575:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_575), 16, 16)) -> intp(2, 0, 1)
	.word 0xb0bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0x92040011  ! 1: ADD_R	add 	%r16, %r17, %r9
thr3_hw_intr_576:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_576), 16, 16)) -> intp(0, 0, 1)
	.word 0xb8040011  ! 1: ADD_R	add 	%r16, %r17, %r28
	.word 0xac040011  ! 1: ADD_R	add 	%r16, %r17, %r22
	.word 0x902c263a  ! 1: ANDN_I	andn 	%r16, 0x063a, %r8
	.word 0x9eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r15
thr3_nuke_intr_577:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_577), 16, 16)) -> intp(2, 2, 1)
	.word 0x94c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x923c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0xaf340011  ! 1: SRL_R	srl 	%r16, %r17, %r23
thr3_resum_intr_578:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_578), 16, 16)) -> intp(2, 3, 1)
	.word 0x86940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x84342018  ! 1: ORN_I	orn 	%r16, 0x0018, %r2
	.word 0xab2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x948c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r10
thr3_hw_intr_579:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_579), 16, 16)) -> intp(2, 0, 1)
	.word 0x86942b69  ! 1: ORcc_I	orcc 	%r16, 0x0b69, %r3
	.word 0x928426b3  ! 1: ADDcc_I	addcc 	%r16, 0x06b3, %r9
	.word 0x94142785  ! 1: OR_I	or 	%r16, 0x0785, %r10
	.word 0xb4042104  ! 1: ADD_I	add 	%r16, 0x0104, %r26
thr3_hw_intr_580:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_580), 16, 16)) -> intp(0, 0, 1)
	.word 0xa8340011  ! 1: ORN_R	orn 	%r16, %r17, %r20
	.word 0x8f643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xad342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r22
thr3_hw_intr_581:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_581), 16, 16)) -> intp(0, 0, 1)
	.word 0x92040011  ! 1: ADD_R	add 	%r16, %r17, %r9
	.word 0x962c2dec  ! 1: ANDN_I	andn 	%r16, 0x0dec, %r11
	.word 0xb80422a3  ! 1: ADD_I	add 	%r16, 0x02a3, %r28
thr3_hw_intr_582:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_582), 16, 16)) -> intp(2, 0, 1)
	.word 0x84bc2c6c  ! 1: XNORcc_I	xnorcc 	%r16, 0x0c6c, %r2
	.word 0x96442439  ! 1: ADDC_I	addc 	%r16, 0x0439, %r11
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
thr3_nuke_intr_583:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_583), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa440011  ! 1: ADDC_R	addc 	%r16, %r17, %r21
	.word 0x880c2e00  ! 1: AND_I	and 	%r16, 0x0e00, %r4
	.word 0x8f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r7
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
thr3_resum_intr_584:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_584), 16, 16)) -> intp(0, 3, 1)
	.word 0x88840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x8b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x997c0411  ! 1: MOVR_R	move	%r16, %r17, %r12
thr3_nuke_intr_585:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_585), 16, 16)) -> intp(2, 2, 1)
	.word 0xb20c0011  ! 1: AND_R	and 	%r16, %r17, %r25
	.word 0xba3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x881c0011  ! 1: XOR_R	xor 	%r16, %r17, %r4
	.word 0xba9c295a  ! 1: XORcc_I	xorcc 	%r16, 0x095a, %r29
thr3_resum_intr_586:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_586), 16, 16)) -> intp(2, 3, 1)
	.word 0xb0340011  ! 1: ORN_R	orn 	%r16, %r17, %r24
	.word 0xb4b4271e  ! 1: ORNcc_I	orncc 	%r16, 0x071e, %r26
	.word 0xacb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0x8c9c208e  ! 1: XORcc_I	xorcc 	%r16, 0x008e, %r6
thr3_nuke_intr_587:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_587), 16, 16)) -> intp(1, 2, 1)
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x993c1011  ! 1: SRAX_R	srax	%r16, %r17, %r12
	.word 0x9e340011  ! 1: ORN_R	orn 	%r16, %r17, %r15
thr3_resum_intr_588:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_588), 16, 16)) -> intp(1, 3, 1)
	.word 0x98040011  ! 1: ADD_R	add 	%r16, %r17, %r12
	.word 0xae9c26f9  ! 1: XORcc_I	xorcc 	%r16, 0x06f9, %r23
thr3_hw_intr_589:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_589), 16, 16)) -> intp(2, 0, 1)
	.word 0x89643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x95641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_590:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_590), 16, 16)) -> intp(1, 2, 1)
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x9414290c  ! 1: OR_I	or 	%r16, 0x090c, %r10
	.word 0xb12c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x9c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r14
thr3_resum_intr_591:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_591), 16, 16)) -> intp(1, 3, 1)
	.word 0x9004299d  ! 1: ADD_I	add 	%r16, 0x099d, %r8
	.word 0x8eac24eb  ! 1: ANDNcc_I	andncc 	%r16, 0x04eb, %r7
	.word 0x8e1c2ee0  ! 1: XOR_I	xor 	%r16, 0x0ee0, %r7
	.word 0xa6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r19
thr3_nuke_intr_592:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_592), 16, 16)) -> intp(1, 2, 1)
	.word 0x94c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x98040011  ! 1: ADD_R	add 	%r16, %r17, %r12
	.word 0xb2840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
thr3_resum_intr_593:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_593), 16, 16)) -> intp(1, 3, 1)
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
	.word 0xb4bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0xab3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r21
thr3_hw_intr_594:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_594), 16, 16)) -> intp(0, 0, 1)
	.word 0x821c0011  ! 1: XOR_R	xor 	%r16, %r17, %r1
	.word 0x8c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0xb82c2040  ! 1: ANDN_I	andn 	%r16, 0x0040, %r28
thr3_nuke_intr_595:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_595), 16, 16)) -> intp(0, 2, 1)
	.word 0x82bc270a  ! 1: XNORcc_I	xnorcc 	%r16, 0x070a, %r1
	.word 0x9f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r15
	.word 0x8e942d54  ! 1: ORcc_I	orcc 	%r16, 0x0d54, %r7
thr3_resum_intr_596:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_596), 16, 16)) -> intp(0, 3, 1)
	.word 0x88142b3c  ! 1: OR_I	or 	%r16, 0x0b3c, %r4
	.word 0xae0c2695  ! 1: AND_I	and 	%r16, 0x0695, %r23
thr3_nuke_intr_597:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_597), 16, 16)) -> intp(1, 2, 1)
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x97343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0x953c0011  ! 1: SRA_R	sra 	%r16, %r17, %r10
thr3_resum_intr_598:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_598), 16, 16)) -> intp(1, 3, 1)
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x9e140011  ! 1: OR_R	or 	%r16, %r17, %r15
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
thr3_nuke_intr_599:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_599), 16, 16)) -> intp(0, 2, 1)
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
thr3_resum_intr_600:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_600), 16, 16)) -> intp(0, 3, 1)
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
thr3_nuke_intr_601:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_601), 16, 16)) -> intp(0, 2, 1)
	.word 0x84342adf  ! 1: ORN_I	orn 	%r16, 0x0adf, %r2
thr3_resum_intr_602:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_602), 16, 16)) -> intp(0, 3, 1)
	.word 0x983424c8  ! 1: ORN_I	orn 	%r16, 0x04c8, %r12
thr3_nuke_intr_603:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_603), 16, 16)) -> intp(0, 2, 1)
	.word 0x848c22d1  ! 1: ANDcc_I	andcc 	%r16, 0x02d1, %r2
	.word 0x857c2401  ! 1: MOVR_I	move	%r16, 0xfffffed1, %r2
	.word 0x837c0411  ! 1: MOVR_R	move	%r16, %r17, %r1
	.word 0x833c1011  ! 1: SRAX_R	srax	%r16, %r17, %r1
thr3_resum_intr_604:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_604), 16, 16)) -> intp(0, 3, 1)
	.word 0x86940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x8cc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r6
thr3_nuke_intr_605:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_605), 16, 16)) -> intp(2, 2, 1)
	.word 0x94342f5a  ! 1: ORN_I	orn 	%r16, 0x0f5a, %r10
	.word 0xb83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xb32c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r25
thr3_resum_intr_606:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_606), 16, 16)) -> intp(2, 3, 1)
	.word 0xb5643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb28c2e96  ! 1: ANDcc_I	andcc 	%r16, 0x0e96, %r25
	.word 0xb7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r27
thr3_hw_intr_607:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_607), 16, 16)) -> intp(1, 0, 1)
	.word 0x9e340011  ! 1: ORN_R	orn 	%r16, %r17, %r15
	.word 0xaf3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r23
thr3_nuke_intr_608:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_608), 16, 16)) -> intp(1, 2, 1)
	.word 0x968c2d45  ! 1: ANDcc_I	andcc 	%r16, 0x0d45, %r11
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
	.word 0x969c2220  ! 1: XORcc_I	xorcc 	%r16, 0x0220, %r11
thr3_resum_intr_609:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_609), 16, 16)) -> intp(1, 3, 1)
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
thr3_nuke_intr_610:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_610), 16, 16)) -> intp(1, 2, 1)
	.word 0x94142891  ! 1: OR_I	or 	%r16, 0x0891, %r10
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0x9084299b  ! 1: ADDcc_I	addcc 	%r16, 0x099b, %r8
	.word 0x9a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r13
thr3_resum_intr_611:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_611), 16, 16)) -> intp(1, 3, 1)
	.word 0x83641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_612:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_612), 16, 16)) -> intp(2, 0, 1)
	.word 0x98b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x869c217d  ! 1: XORcc_I	xorcc 	%r16, 0x017d, %r3
	.word 0x98340011  ! 1: ORN_R	orn 	%r16, %r17, %r12
thr3_hw_intr_613:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_613), 16, 16)) -> intp(0, 0, 1)
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
thr3_nuke_intr_614:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_614), 16, 16)) -> intp(2, 2, 1)
	.word 0xba342ecb  ! 1: ORN_I	orn 	%r16, 0x0ecb, %r29
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
	.word 0x837c2401  ! 1: MOVR_I	move	%r16, 0x11, %r1
	.word 0xb6bc22d2  ! 1: XNORcc_I	xnorcc 	%r16, 0x02d2, %r27
thr3_resum_intr_615:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_615), 16, 16)) -> intp(2, 3, 1)
	.word 0x8b7c2401  ! 1: MOVR_I	move	%r16, 0xfffffed2, %r5
	.word 0xb2c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0xaa140011  ! 1: OR_R	or 	%r16, %r17, %r21
	.word 0x9f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r15
thr3_hw_intr_616:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_616), 16, 16)) -> intp(2, 0, 1)
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
thr3_nuke_intr_617:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_617), 16, 16)) -> intp(0, 2, 1)
	.word 0x9c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x8b643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x90140011  ! 1: OR_R	or 	%r16, %r17, %r8
thr3_resum_intr_618:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_618), 16, 16)) -> intp(0, 3, 1)
	.word 0x9ac4217b  ! 1: ADDCcc_I	addccc 	%r16, 0x017b, %r13
	.word 0xa6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r19
thr3_hw_intr_619:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_619), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c140011  ! 1: OR_R	or 	%r16, %r17, %r14
thr3_hw_intr_620:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_620), 16, 16)) -> intp(0, 0, 1)
	.word 0xaac42874  ! 1: ADDCcc_I	addccc 	%r16, 0x0874, %r21
thr3_hw_intr_621:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_621), 16, 16)) -> intp(2, 0, 1)
	.word 0x9c3c24e4  ! 1: XNOR_I	xnor 	%r16, 0x04e4, %r14
	.word 0xb29c284a  ! 1: XORcc_I	xorcc 	%r16, 0x084a, %r25
	.word 0xb49c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r26
thr3_nuke_intr_622:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_622), 16, 16)) -> intp(0, 2, 1)
	.word 0x84b42dcd  ! 1: ORNcc_I	orncc 	%r16, 0x0dcd, %r2
	.word 0x82ac229f  ! 1: ANDNcc_I	andncc 	%r16, 0x029f, %r1
	.word 0xa8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r20
thr3_resum_intr_623:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_623), 16, 16)) -> intp(0, 3, 1)
	.word 0xb37c0411  ! 1: MOVR_R	move	%r16, %r17, %r25
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0x9d3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r14
thr3_nuke_intr_624:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_624), 16, 16)) -> intp(0, 2, 1)
	.word 0xae342eda  ! 1: ORN_I	orn 	%r16, 0x0eda, %r23
thr3_resum_intr_625:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_625), 16, 16)) -> intp(0, 3, 1)
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x857c0411  ! 1: MOVR_R	move	%r16, %r17, %r2
	.word 0x90040011  ! 1: ADD_R	add 	%r16, %r17, %r8
thr3_hw_intr_626:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_626), 16, 16)) -> intp(1, 0, 1)
	.word 0x888c25e3  ! 1: ANDcc_I	andcc 	%r16, 0x05e3, %r4
	.word 0xb13c0011  ! 1: SRA_R	sra 	%r16, %r17, %r24
	.word 0x9f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r15
	.word 0x8c2c2676  ! 1: ANDN_I	andn 	%r16, 0x0676, %r6
thr3_nuke_intr_627:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_627), 16, 16)) -> intp(1, 2, 1)
	.word 0xa63424c8  ! 1: ORN_I	orn 	%r16, 0x04c8, %r19
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x90040011  ! 1: ADD_R	add 	%r16, %r17, %r8
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
thr3_resum_intr_628:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_628), 16, 16)) -> intp(1, 3, 1)
	.word 0xa62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r19
	.word 0xaa8c2a7f  ! 1: ANDcc_I	andcc 	%r16, 0x0a7f, %r21
	.word 0x9c8427a7  ! 1: ADDcc_I	addcc 	%r16, 0x07a7, %r14
	.word 0x94142bfc  ! 1: OR_I	or 	%r16, 0x0bfc, %r10
thr3_hw_intr_629:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_629), 16, 16)) -> intp(2, 0, 1)
	.word 0x9eb4212c  ! 1: ORNcc_I	orncc 	%r16, 0x012c, %r15
	.word 0x94b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0xb5643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_630:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_630), 16, 16)) -> intp(0, 2, 1)
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0xb2ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0xb6340011  ! 1: ORN_R	orn 	%r16, %r17, %r27
thr3_resum_intr_631:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_631), 16, 16)) -> intp(0, 3, 1)
	.word 0xb4ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0x9cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
thr3_nuke_intr_632:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_632), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xb49c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r26
thr3_resum_intr_633:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_633), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r28
	.word 0xb92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r28
thr3_hw_intr_634:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_634), 16, 16)) -> intp(1, 0, 1)
	.word 0x92bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r9
thr3_hw_intr_635:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_635), 16, 16)) -> intp(2, 0, 1)
	.word 0x8cac2fb1  ! 1: ANDNcc_I	andncc 	%r16, 0x0fb1, %r6
	.word 0x99641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa93c0011  ! 1: SRA_R	sra 	%r16, %r17, %r20
	.word 0x94bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r10
thr3_nuke_intr_636:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_636), 16, 16)) -> intp(2, 2, 1)
	.word 0xb72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r27
	.word 0xae340011  ! 1: ORN_R	orn 	%r16, %r17, %r23
thr3_resum_intr_637:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_637), 16, 16)) -> intp(2, 3, 1)
	.word 0x98842489  ! 1: ADDcc_I	addcc 	%r16, 0x0489, %r12
	.word 0xb7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xb8040011  ! 1: ADD_R	add 	%r16, %r17, %r28
thr3_nuke_intr_638:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_638), 16, 16)) -> intp(2, 2, 1)
	.word 0xb5340011  ! 1: SRL_R	srl 	%r16, %r17, %r26
	.word 0xb40c2ce2  ! 1: AND_I	and 	%r16, 0x0ce2, %r26
	.word 0x9ab42943  ! 1: ORNcc_I	orncc 	%r16, 0x0943, %r13
thr3_resum_intr_639:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_639), 16, 16)) -> intp(2, 3, 1)
	.word 0xab2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r21
thr3_hw_intr_640:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_640), 16, 16)) -> intp(0, 0, 1)
	.word 0x923c2662  ! 1: XNOR_I	xnor 	%r16, 0x0662, %r9
	.word 0xb41c0011  ! 1: XOR_R	xor 	%r16, %r17, %r26
	.word 0xb1641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
thr3_hw_intr_641:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_641), 16, 16)) -> intp(1, 0, 1)
	.word 0x9eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xa73c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r19
	.word 0x8c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r6
thr3_nuke_intr_642:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_642), 16, 16)) -> intp(2, 2, 1)
	.word 0x8cb429b1  ! 1: ORNcc_I	orncc 	%r16, 0x09b1, %r6
	.word 0xaa8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r21
thr3_resum_intr_643:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_643), 16, 16)) -> intp(2, 3, 1)
	.word 0x90c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x98ac2d76  ! 1: ANDNcc_I	andncc 	%r16, 0x0d76, %r12
	.word 0x8cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r6
thr3_hw_intr_644:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_644), 16, 16)) -> intp(1, 0, 1)
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
thr3_hw_intr_645:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_645), 16, 16)) -> intp(2, 0, 1)
	.word 0x95342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0xb604227e  ! 1: ADD_I	add 	%r16, 0x027e, %r27
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
thr3_nuke_intr_646:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_646), 16, 16)) -> intp(0, 2, 1)
	.word 0x869c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0xa80c0011  ! 1: AND_R	and 	%r16, %r17, %r20
	.word 0x853c1011  ! 1: SRAX_R	srax	%r16, %r17, %r2
	.word 0xaa942c07  ! 1: ORcc_I	orcc 	%r16, 0x0c07, %r21
thr3_resum_intr_647:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_647), 16, 16)) -> intp(0, 3, 1)
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0xb29c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0xad3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r22
thr3_nuke_intr_648:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_648), 16, 16)) -> intp(1, 2, 1)
	.word 0xac0c0011  ! 1: AND_R	and 	%r16, %r17, %r22
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
thr3_resum_intr_649:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_649), 16, 16)) -> intp(1, 3, 1)
	.word 0xb2c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0x9b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r13
thr3_hw_intr_650:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_650), 16, 16)) -> intp(1, 0, 1)
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0xb80428e0  ! 1: ADD_I	add 	%r16, 0x08e0, %r28
	.word 0x8a94226f  ! 1: ORcc_I	orcc 	%r16, 0x026f, %r5
	.word 0xb40c23a3  ! 1: AND_I	and 	%r16, 0x03a3, %r26
thr3_hw_intr_651:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_651), 16, 16)) -> intp(2, 0, 1)
	.word 0x90340011  ! 1: ORN_R	orn 	%r16, %r17, %r8
	.word 0xb83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r28
thr3_hw_intr_652:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_652), 16, 16)) -> intp(2, 0, 1)
	.word 0x829c2acf  ! 1: XORcc_I	xorcc 	%r16, 0x0acf, %r1
	.word 0xb08c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0x94ac2be7  ! 1: ANDNcc_I	andncc 	%r16, 0x0be7, %r10
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
thr3_nuke_intr_653:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_653), 16, 16)) -> intp(1, 2, 1)
	.word 0x88442d59  ! 1: ADDC_I	addc 	%r16, 0x0d59, %r4
	.word 0x957c0411  ! 1: MOVR_R	move	%r16, %r17, %r10
	.word 0xb22c2768  ! 1: ANDN_I	andn 	%r16, 0x0768, %r25
	.word 0x8d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r6
thr3_resum_intr_654:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_654), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e3c2d71  ! 1: XNOR_I	xnor 	%r16, 0x0d71, %r7
	.word 0x89643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x940c2af1  ! 1: AND_I	and 	%r16, 0x0af1, %r10
	.word 0x82442c99  ! 1: ADDC_I	addc 	%r16, 0x0c99, %r1
thr3_hw_intr_655:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_655), 16, 16)) -> intp(2, 0, 1)
	.word 0x917c0411  ! 1: MOVR_R	move	%r16, %r17, %r8
	.word 0x983c24d3  ! 1: XNOR_I	xnor 	%r16, 0x04d3, %r12
	.word 0x988c26e6  ! 1: ANDcc_I	andcc 	%r16, 0x06e6, %r12
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
thr3_hw_intr_656:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_656), 16, 16)) -> intp(2, 0, 1)
	.word 0x992c0011  ! 1: SLL_R	sll 	%r16, %r17, %r12
thr3_hw_intr_657:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_657), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c8c2eed  ! 1: ANDcc_I	andcc 	%r16, 0x0eed, %r6
thr3_nuke_intr_658:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_658), 16, 16)) -> intp(0, 2, 1)
	.word 0x922c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r9
	.word 0x89340011  ! 1: SRL_R	srl 	%r16, %r17, %r4
thr3_resum_intr_659:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_659), 16, 16)) -> intp(0, 3, 1)
	.word 0xb03c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
thr3_nuke_intr_660:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_660), 16, 16)) -> intp(0, 2, 1)
	.word 0xb0c42698  ! 1: ADDCcc_I	addccc 	%r16, 0x0698, %r24
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
	.word 0x952c0011  ! 1: SLL_R	sll 	%r16, %r17, %r10
	.word 0xb62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r27
thr3_resum_intr_661:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_661), 16, 16)) -> intp(0, 3, 1)
	.word 0x9f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x9a340011  ! 1: ORN_R	orn 	%r16, %r17, %r13
	.word 0xb8042033  ! 1: ADD_I	add 	%r16, 0x0033, %r28
	.word 0x86942613  ! 1: ORcc_I	orcc 	%r16, 0x0613, %r3
thr3_nuke_intr_662:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_662), 16, 16)) -> intp(1, 2, 1)
	.word 0xac9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0x84840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0xaab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0x862c2019  ! 1: ANDN_I	andn 	%r16, 0x0019, %r3
thr3_resum_intr_663:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_663), 16, 16)) -> intp(1, 3, 1)
	.word 0xb2840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0x9e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x8d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r6
	.word 0xae2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r23
thr3_nuke_intr_664:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_664), 16, 16)) -> intp(2, 2, 1)
	.word 0xa844289c  ! 1: ADDC_I	addc 	%r16, 0x089c, %r20
	.word 0x9c0c0011  ! 1: AND_R	and 	%r16, %r17, %r14
	.word 0xa89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r20
thr3_resum_intr_665:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_665), 16, 16)) -> intp(2, 3, 1)
	.word 0x993c1011  ! 1: SRAX_R	srax	%r16, %r17, %r12
	.word 0xac1c21e0  ! 1: XOR_I	xor 	%r16, 0x01e0, %r22
thr3_nuke_intr_666:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_666), 16, 16)) -> intp(2, 2, 1)
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
thr3_resum_intr_667:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_667), 16, 16)) -> intp(2, 3, 1)
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
	.word 0xb4b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0x8cc42b0c  ! 1: ADDCcc_I	addccc 	%r16, 0x0b0c, %r6
thr3_nuke_intr_668:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_668), 16, 16)) -> intp(0, 2, 1)
	.word 0x992c0011  ! 1: SLL_R	sll 	%r16, %r17, %r12
	.word 0x88440011  ! 1: ADDC_R	addc 	%r16, %r17, %r4
	.word 0xbb7c0411  ! 1: MOVR_R	move	%r16, %r17, %r29
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
thr3_resum_intr_669:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_669), 16, 16)) -> intp(0, 3, 1)
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x8d641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_670:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_670), 16, 16)) -> intp(0, 0, 1)
	.word 0xb72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r27
thr3_nuke_intr_671:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_671), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
thr3_resum_intr_672:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_672), 16, 16)) -> intp(2, 3, 1)
	.word 0xae3421a4  ! 1: ORN_I	orn 	%r16, 0x01a4, %r23
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
thr3_hw_intr_673:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_673), 16, 16)) -> intp(1, 0, 1)
	.word 0xa68c211d  ! 1: ANDcc_I	andcc 	%r16, 0x011d, %r19
thr3_nuke_intr_674:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_674), 16, 16)) -> intp(0, 2, 1)
	.word 0x92bc2e79  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e79, %r9
	.word 0xb9342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
thr3_resum_intr_675:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_675), 16, 16)) -> intp(0, 3, 1)
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
thr3_nuke_intr_676:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_676), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8942916  ! 1: ORcc_I	orcc 	%r16, 0x0916, %r20
	.word 0xa6bc25ee  ! 1: XNORcc_I	xnorcc 	%r16, 0x05ee, %r19
	.word 0xae340011  ! 1: ORN_R	orn 	%r16, %r17, %r23
thr3_resum_intr_677:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_677), 16, 16)) -> intp(1, 3, 1)
	.word 0x8d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r6
	.word 0x89341011  ! 1: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x822c2849  ! 1: ANDN_I	andn 	%r16, 0x0849, %r1
thr3_nuke_intr_678:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_678), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a942049  ! 1: ORcc_I	orcc 	%r16, 0x0049, %r13
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
thr3_resum_intr_679:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_679), 16, 16)) -> intp(1, 3, 1)
	.word 0xa9641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_680:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_680), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a140011  ! 1: OR_R	or 	%r16, %r17, %r5
	.word 0x8244235b  ! 1: ADDC_I	addc 	%r16, 0x035b, %r1
thr3_hw_intr_681:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_681), 16, 16)) -> intp(2, 0, 1)
	.word 0x868c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xae3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0xaa9c259d  ! 1: XORcc_I	xorcc 	%r16, 0x059d, %r21
	.word 0x840c0011  ! 1: AND_R	and 	%r16, %r17, %r2
thr3_hw_intr_682:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_682), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e942533  ! 1: ORcc_I	orcc 	%r16, 0x0533, %r7
	.word 0x8f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r7
	.word 0x9f641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x908c21f5  ! 1: ANDcc_I	andcc 	%r16, 0x01f5, %r8
thr3_nuke_intr_683:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_683), 16, 16)) -> intp(0, 2, 1)
	.word 0x963c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x8a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r5
	.word 0xaf641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_684:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_684), 16, 16)) -> intp(0, 3, 1)
	.word 0xba8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r29
	.word 0xb2b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0xa77c0411  ! 1: MOVR_R	move	%r16, %r17, %r19
thr3_hw_intr_685:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_685), 16, 16)) -> intp(0, 0, 1)
	.word 0x9b340011  ! 1: SRL_R	srl 	%r16, %r17, %r13
thr3_nuke_intr_686:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_686), 16, 16)) -> intp(1, 2, 1)
	.word 0x860c2f7a  ! 1: AND_I	and 	%r16, 0x0f7a, %r3
	.word 0x84340011  ! 1: ORN_R	orn 	%r16, %r17, %r2
	.word 0xbab4279c  ! 1: ORNcc_I	orncc 	%r16, 0x079c, %r29
thr3_resum_intr_687:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_687), 16, 16)) -> intp(1, 3, 1)
	.word 0xa6842ad8  ! 1: ADDcc_I	addcc 	%r16, 0x0ad8, %r19
	.word 0xae142705  ! 1: OR_I	or 	%r16, 0x0705, %r23
thr3_hw_intr_688:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_688), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a142152  ! 1: OR_I	or 	%r16, 0x0152, %r5
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
thr3_nuke_intr_689:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_689), 16, 16)) -> intp(1, 2, 1)
	.word 0xb4c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0x9aac2376  ! 1: ANDNcc_I	andncc 	%r16, 0x0376, %r13
thr3_resum_intr_690:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_690), 16, 16)) -> intp(1, 3, 1)
	.word 0xb62c260c  ! 1: ANDN_I	andn 	%r16, 0x060c, %r27
	.word 0xba8c2231  ! 1: ANDcc_I	andcc 	%r16, 0x0231, %r29
	.word 0x92ac2140  ! 1: ANDNcc_I	andncc 	%r16, 0x0140, %r9
	.word 0x937c0411  ! 1: MOVR_R	move	%r16, %r17, %r9
thr3_nuke_intr_691:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_691), 16, 16)) -> intp(0, 2, 1)
	.word 0xb0840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
thr3_resum_intr_692:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_692), 16, 16)) -> intp(0, 3, 1)
	.word 0x820c299b  ! 1: AND_I	and 	%r16, 0x099b, %r1
thr3_hw_intr_693:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_693), 16, 16)) -> intp(2, 0, 1)
	.word 0xb52c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0x960c2f0a  ! 1: AND_I	and 	%r16, 0x0f0a, %r11
	.word 0xb32c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r25
thr3_hw_intr_694:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_694), 16, 16)) -> intp(2, 0, 1)
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0xa6140011  ! 1: OR_R	or 	%r16, %r17, %r19
	.word 0xaf643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_695:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_695), 16, 16)) -> intp(0, 0, 1)
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
	.word 0xba1c2d4b  ! 1: XOR_I	xor 	%r16, 0x0d4b, %r29
	.word 0x9cac2072  ! 1: ANDNcc_I	andncc 	%r16, 0x0072, %r14
thr3_hw_intr_696:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_696), 16, 16)) -> intp(0, 0, 1)
	.word 0x92442447  ! 1: ADDC_I	addc 	%r16, 0x0447, %r9
thr3_hw_intr_697:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_697), 16, 16)) -> intp(0, 0, 1)
	.word 0x95641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x8604226a  ! 1: ADD_I	add 	%r16, 0x026a, %r3
thr3_hw_intr_698:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_698), 16, 16)) -> intp(1, 0, 1)
	.word 0xb4940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
thr3_hw_intr_699:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_699), 16, 16)) -> intp(2, 0, 1)
	.word 0x9a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x9e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
thr3_nuke_intr_700:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_700), 16, 16)) -> intp(2, 2, 1)
	.word 0x86340011  ! 1: ORN_R	orn 	%r16, %r17, %r3
	.word 0x9e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x96ac2a99  ! 1: ANDNcc_I	andncc 	%r16, 0x0a99, %r11
thr3_resum_intr_701:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_701), 16, 16)) -> intp(2, 3, 1)
	.word 0x9b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0xa8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r20
thr3_hw_intr_702:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_702), 16, 16)) -> intp(1, 0, 1)
	.word 0xb5343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0x84bc2937  ! 1: XNORcc_I	xnorcc 	%r16, 0x0937, %r2
thr3_nuke_intr_703:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_703), 16, 16)) -> intp(2, 2, 1)
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
thr3_resum_intr_704:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_704), 16, 16)) -> intp(2, 3, 1)
	.word 0x843424f9  ! 1: ORN_I	orn 	%r16, 0x04f9, %r2
	.word 0x820c0011  ! 1: AND_R	and 	%r16, %r17, %r1
	.word 0xacac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r22
thr3_hw_intr_705:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_705), 16, 16)) -> intp(1, 0, 1)
	.word 0x922c2cf9  ! 1: ANDN_I	andn 	%r16, 0x0cf9, %r9
	.word 0xa6042457  ! 1: ADD_I	add 	%r16, 0x0457, %r19
	.word 0x9d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r14
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
thr3_nuke_intr_706:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_706), 16, 16)) -> intp(1, 2, 1)
	.word 0x843c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0xa60c0011  ! 1: AND_R	and 	%r16, %r17, %r19
	.word 0xb5340011  ! 1: SRL_R	srl 	%r16, %r17, %r26
thr3_resum_intr_707:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_707), 16, 16)) -> intp(1, 3, 1)
	.word 0x922c2e70  ! 1: ANDN_I	andn 	%r16, 0x0e70, %r9
thr3_nuke_intr_708:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_708), 16, 16)) -> intp(0, 2, 1)
	.word 0x9034284d  ! 1: ORN_I	orn 	%r16, 0x084d, %r8
thr3_resum_intr_709:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_709), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
	.word 0xb83c2d31  ! 1: XNOR_I	xnor 	%r16, 0x0d31, %r28
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
thr3_hw_intr_710:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_710), 16, 16)) -> intp(2, 0, 1)
	.word 0x83641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_711:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_711), 16, 16)) -> intp(2, 0, 1)
	.word 0x982c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r12
thr3_hw_intr_712:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_712), 16, 16)) -> intp(1, 0, 1)
	.word 0x92b42bad  ! 1: ORNcc_I	orncc 	%r16, 0x0bad, %r9
	.word 0xaeac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0x82c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r1
thr3_hw_intr_713:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_713), 16, 16)) -> intp(1, 0, 1)
	.word 0xaec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0xaa840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r21
thr3_hw_intr_714:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_714), 16, 16)) -> intp(2, 0, 1)
	.word 0xb92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0xb77c2401  ! 1: MOVR_I	move	%r16, 0x1, %r27
thr3_hw_intr_715:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_715), 16, 16)) -> intp(2, 0, 1)
	.word 0x822c2b9f  ! 1: ANDN_I	andn 	%r16, 0x0b9f, %r1
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
thr3_nuke_intr_716:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_716), 16, 16)) -> intp(1, 2, 1)
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0x96142d0d  ! 1: OR_I	or 	%r16, 0x0d0d, %r11
	.word 0x9eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r15
thr3_resum_intr_717:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_717), 16, 16)) -> intp(1, 3, 1)
	.word 0xba940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x902c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r8
thr3_hw_intr_718:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_718), 16, 16)) -> intp(2, 0, 1)
	.word 0x85342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0xb4bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r26
thr3_nuke_intr_719:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_719), 16, 16)) -> intp(2, 2, 1)
	.word 0xa61c2f96  ! 1: XOR_I	xor 	%r16, 0x0f96, %r19
	.word 0xb2440011  ! 1: ADDC_R	addc 	%r16, %r17, %r25
	.word 0xb004219a  ! 1: ADD_I	add 	%r16, 0x019a, %r24
	.word 0x96940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r11
thr3_resum_intr_720:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_720), 16, 16)) -> intp(2, 3, 1)
	.word 0x8e8c2a1f  ! 1: ANDcc_I	andcc 	%r16, 0x0a1f, %r7
	.word 0xb60c291c  ! 1: AND_I	and 	%r16, 0x091c, %r27
	.word 0x88440011  ! 1: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x9b340011  ! 1: SRL_R	srl 	%r16, %r17, %r13
thr3_nuke_intr_721:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_721), 16, 16)) -> intp(2, 2, 1)
	.word 0xbb2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r29
thr3_resum_intr_722:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_722), 16, 16)) -> intp(2, 3, 1)
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
thr3_nuke_intr_723:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_723), 16, 16)) -> intp(2, 2, 1)
	.word 0x997c2401  ! 1: MOVR_I	move	%r16, 0x1, %r12
thr3_resum_intr_724:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_724), 16, 16)) -> intp(2, 3, 1)
	.word 0x900c2ec2  ! 1: AND_I	and 	%r16, 0x0ec2, %r8
thr3_hw_intr_725:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_725), 16, 16)) -> intp(2, 0, 1)
	.word 0xb7340011  ! 1: SRL_R	srl 	%r16, %r17, %r27
	.word 0xae9c2498  ! 1: XORcc_I	xorcc 	%r16, 0x0498, %r23
	.word 0x9d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
thr3_hw_intr_726:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_726), 16, 16)) -> intp(2, 0, 1)
	.word 0xb04427c5  ! 1: ADDC_I	addc 	%r16, 0x07c5, %r24
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x88c42319  ! 1: ADDCcc_I	addccc 	%r16, 0x0319, %r4
thr3_nuke_intr_727:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_727), 16, 16)) -> intp(1, 2, 1)
	.word 0xb97c0411  ! 1: MOVR_R	move	%r16, %r17, %r28
	.word 0x98042869  ! 1: ADD_I	add 	%r16, 0x0869, %r12
thr3_resum_intr_728:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_728), 16, 16)) -> intp(1, 3, 1)
	.word 0x8aac24f4  ! 1: ANDNcc_I	andncc 	%r16, 0x04f4, %r5
	.word 0x881c0011  ! 1: XOR_R	xor 	%r16, %r17, %r4
	.word 0x8b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
thr3_hw_intr_729:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_729), 16, 16)) -> intp(1, 0, 1)
	.word 0xac8c239a  ! 1: ANDcc_I	andcc 	%r16, 0x039a, %r22
	.word 0x89340011  ! 1: SRL_R	srl 	%r16, %r17, %r4
thr3_nuke_intr_730:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_730), 16, 16)) -> intp(2, 2, 1)
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
thr3_resum_intr_731:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_731), 16, 16)) -> intp(2, 3, 1)
	.word 0x82ac2463  ! 1: ANDNcc_I	andncc 	%r16, 0x0463, %r1
thr3_hw_intr_732:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_732), 16, 16)) -> intp(2, 0, 1)
	.word 0x837c0411  ! 1: MOVR_R	move	%r16, %r17, %r1
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xb8842eaf  ! 1: ADDcc_I	addcc 	%r16, 0x0eaf, %r28
thr3_hw_intr_733:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_733), 16, 16)) -> intp(0, 0, 1)
	.word 0x98342f65  ! 1: ORN_I	orn 	%r16, 0x0f65, %r12
	.word 0xb73c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r27
thr3_nuke_intr_734:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_734), 16, 16)) -> intp(2, 2, 1)
	.word 0x881c2953  ! 1: XOR_I	xor 	%r16, 0x0953, %r4
	.word 0x86040011  ! 1: ADD_R	add 	%r16, %r17, %r3
	.word 0x8c3c287f  ! 1: XNOR_I	xnor 	%r16, 0x087f, %r6
	.word 0x98bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r12
thr3_resum_intr_735:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_735), 16, 16)) -> intp(2, 3, 1)
	.word 0x917c2401  ! 1: MOVR_I	move	%r16, 0x11, %r8
thr3_nuke_intr_736:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_736), 16, 16)) -> intp(1, 2, 1)
	.word 0x92840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0x888c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r4
thr3_resum_intr_737:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_737), 16, 16)) -> intp(1, 3, 1)
	.word 0xa9643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8a1c242c  ! 1: XOR_I	xor 	%r16, 0x042c, %r5
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x9e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r15
thr3_hw_intr_738:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_738), 16, 16)) -> intp(2, 0, 1)
	.word 0xac1c2bd7  ! 1: XOR_I	xor 	%r16, 0x0bd7, %r22
	.word 0x924420a1  ! 1: ADDC_I	addc 	%r16, 0x00a1, %r9
thr3_hw_intr_739:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_739), 16, 16)) -> intp(2, 0, 1)
	.word 0xb93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r28
thr3_nuke_intr_740:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_740), 16, 16)) -> intp(0, 2, 1)
	.word 0x9c9c20c9  ! 1: XORcc_I	xorcc 	%r16, 0x00c9, %r14
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
	.word 0xa83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0xac4420a3  ! 1: ADDC_I	addc 	%r16, 0x00a3, %r22
thr3_resum_intr_741:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_741), 16, 16)) -> intp(0, 3, 1)
	.word 0x8cc4236a  ! 1: ADDCcc_I	addccc 	%r16, 0x036a, %r6
	.word 0x99343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r12
thr3_hw_intr_742:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_742), 16, 16)) -> intp(2, 0, 1)
	.word 0xa77c0411  ! 1: MOVR_R	move	%r16, %r17, %r19
thr3_nuke_intr_743:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_743), 16, 16)) -> intp(1, 2, 1)
	.word 0xb1641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x912c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0xb2bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r25
thr3_resum_intr_744:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_744), 16, 16)) -> intp(1, 3, 1)
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
thr3_nuke_intr_745:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_745), 16, 16)) -> intp(1, 2, 1)
	.word 0x93342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x94c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r10
thr3_resum_intr_746:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_746), 16, 16)) -> intp(1, 3, 1)
	.word 0xba0c2617  ! 1: AND_I	and 	%r16, 0x0617, %r29
thr3_hw_intr_747:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_747), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a342af9  ! 1: ORN_I	orn 	%r16, 0x0af9, %r13
thr3_hw_intr_748:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_748), 16, 16)) -> intp(1, 0, 1)
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
thr3_nuke_intr_749:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_749), 16, 16)) -> intp(2, 2, 1)
	.word 0xb884254e  ! 1: ADDcc_I	addcc 	%r16, 0x054e, %r28
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0xb5641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_750:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_750), 16, 16)) -> intp(2, 3, 1)
	.word 0x86840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
thr3_nuke_intr_751:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_751), 16, 16)) -> intp(1, 2, 1)
	.word 0xacb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0xbb341011  ! 1: SRLX_R	srlx	%r16, %r17, %r29
	.word 0x96c42cd8  ! 1: ADDCcc_I	addccc 	%r16, 0x0cd8, %r11
	.word 0x8d641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_752:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_752), 16, 16)) -> intp(1, 3, 1)
	.word 0x8cbc2d9a  ! 1: XNORcc_I	xnorcc 	%r16, 0x0d9a, %r6
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
	.word 0xaf341011  ! 1: SRLX_R	srlx	%r16, %r17, %r23
thr3_hw_intr_753:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_753), 16, 16)) -> intp(0, 0, 1)
	.word 0x992c0011  ! 1: SLL_R	sll 	%r16, %r17, %r12
thr3_hw_intr_754:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_754), 16, 16)) -> intp(2, 0, 1)
	.word 0xb8042ef0  ! 1: ADD_I	add 	%r16, 0x0ef0, %r28
	.word 0x8b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r5
thr3_hw_intr_755:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_755), 16, 16)) -> intp(1, 0, 1)
	.word 0x920c22f7  ! 1: AND_I	and 	%r16, 0x02f7, %r9
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
thr3_nuke_intr_756:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_756), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a9c212b  ! 1: XORcc_I	xorcc 	%r16, 0x012b, %r5
	.word 0x8cc42da9  ! 1: ADDCcc_I	addccc 	%r16, 0x0da9, %r6
	.word 0x953c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r10
thr3_resum_intr_757:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_757), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8c42530  ! 1: ADDCcc_I	addccc 	%r16, 0x0530, %r28
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x92940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r9
thr3_hw_intr_758:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_758), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa140011  ! 1: OR_R	or 	%r16, %r17, %r21
	.word 0xb88c23cf  ! 1: ANDcc_I	andcc 	%r16, 0x03cf, %r28
	.word 0xad3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0xbb643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_759:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_759), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a342695  ! 1: ORN_I	orn 	%r16, 0x0695, %r5
thr3_hw_intr_760:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_760), 16, 16)) -> intp(1, 0, 1)
	.word 0x83643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x87341011  ! 1: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
	.word 0xb6c42b97  ! 1: ADDCcc_I	addccc 	%r16, 0x0b97, %r27
thr3_hw_intr_761:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_761), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0xa93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x89343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r4
thr3_hw_intr_762:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_762), 16, 16)) -> intp(2, 0, 1)
	.word 0xad641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_763:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_763), 16, 16)) -> intp(2, 0, 1)
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
	.word 0x892c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r4
thr3_nuke_intr_764:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_764), 16, 16)) -> intp(2, 2, 1)
	.word 0x953c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x9f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r15
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xaf2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r23
thr3_resum_intr_765:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_765), 16, 16)) -> intp(2, 3, 1)
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
	.word 0x900c2a8c  ! 1: AND_I	and 	%r16, 0x0a8c, %r8
thr3_nuke_intr_766:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_766), 16, 16)) -> intp(1, 2, 1)
	.word 0xb7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0x94342bdd  ! 1: ORN_I	orn 	%r16, 0x0bdd, %r10
	.word 0xbb643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
thr3_resum_intr_767:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_767), 16, 16)) -> intp(1, 3, 1)
	.word 0x943c2c5c  ! 1: XNOR_I	xnor 	%r16, 0x0c5c, %r10
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
thr3_nuke_intr_768:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_768), 16, 16)) -> intp(0, 2, 1)
	.word 0x87643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r5
thr3_resum_intr_769:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_769), 16, 16)) -> intp(0, 3, 1)
	.word 0xb53c0011  ! 1: SRA_R	sra 	%r16, %r17, %r26
	.word 0xab3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r21
	.word 0x96842ad7  ! 1: ADDcc_I	addcc 	%r16, 0x0ad7, %r11
thr3_nuke_intr_770:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_770), 16, 16)) -> intp(1, 2, 1)
	.word 0x943423c7  ! 1: ORN_I	orn 	%r16, 0x03c7, %r10
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
thr3_resum_intr_771:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_771), 16, 16)) -> intp(1, 3, 1)
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
	.word 0x9a3c21ce  ! 1: XNOR_I	xnor 	%r16, 0x01ce, %r13
	.word 0xa63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r19
	.word 0xb6ac2f5f  ! 1: ANDNcc_I	andncc 	%r16, 0x0f5f, %r27
thr3_hw_intr_772:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_772), 16, 16)) -> intp(2, 0, 1)
	.word 0x85340011  ! 1: SRL_R	srl 	%r16, %r17, %r2
thr3_hw_intr_773:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_773), 16, 16)) -> intp(0, 0, 1)
	.word 0x8b7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r5
thr3_nuke_intr_774:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_774), 16, 16)) -> intp(2, 2, 1)
	.word 0x90b42cb1  ! 1: ORNcc_I	orncc 	%r16, 0x0cb1, %r8
	.word 0x8eb428ec  ! 1: ORNcc_I	orncc 	%r16, 0x08ec, %r7
	.word 0x9d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r14
thr3_resum_intr_775:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_775), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c1c2af7  ! 1: XOR_I	xor 	%r16, 0x0af7, %r6
	.word 0xa92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r20
thr3_nuke_intr_776:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_776), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6340011  ! 1: ORN_R	orn 	%r16, %r17, %r27
	.word 0x820c0011  ! 1: AND_R	and 	%r16, %r17, %r1
thr3_resum_intr_777:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_777), 16, 16)) -> intp(1, 3, 1)
	.word 0x917c2401  ! 1: MOVR_I	move	%r16, 0x11, %r8
	.word 0xb33c1011  ! 1: SRAX_R	srax	%r16, %r17, %r25
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
thr3_hw_intr_778:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_778), 16, 16)) -> intp(0, 0, 1)
	.word 0xb9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r28
thr3_nuke_intr_779:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_779), 16, 16)) -> intp(2, 2, 1)
	.word 0x83341011  ! 1: SRLX_R	srlx	%r16, %r17, %r1
	.word 0xa6c42cb0  ! 1: ADDCcc_I	addccc 	%r16, 0x0cb0, %r19
thr3_resum_intr_780:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_780), 16, 16)) -> intp(2, 3, 1)
	.word 0x823c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0xb6bc2e36  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e36, %r27
thr3_nuke_intr_781:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_781), 16, 16)) -> intp(1, 2, 1)
	.word 0x90ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x90940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0xb08c2455  ! 1: ANDcc_I	andcc 	%r16, 0x0455, %r24
	.word 0x853c0011  ! 1: SRA_R	sra 	%r16, %r17, %r2
thr3_resum_intr_782:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_782), 16, 16)) -> intp(1, 3, 1)
	.word 0xb414250b  ! 1: OR_I	or 	%r16, 0x050b, %r26
	.word 0xb2bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
	.word 0xb77c0411  ! 1: MOVR_R	move	%r16, %r17, %r27
thr3_hw_intr_783:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_783), 16, 16)) -> intp(1, 0, 1)
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x92c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r9
thr3_nuke_intr_784:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_784), 16, 16)) -> intp(2, 2, 1)
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
thr3_resum_intr_785:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_785), 16, 16)) -> intp(2, 3, 1)
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8e3428b9  ! 1: ORN_I	orn 	%r16, 0x08b9, %r7
thr3_hw_intr_786:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_786), 16, 16)) -> intp(0, 0, 1)
	.word 0x96c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x94c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
thr3_hw_intr_787:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_787), 16, 16)) -> intp(0, 0, 1)
	.word 0xb92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xb0940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r24
thr3_hw_intr_788:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_788), 16, 16)) -> intp(2, 0, 1)
	.word 0x9e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0xb77c2401  ! 1: MOVR_I	move	%r16, 0x11, %r27
	.word 0x881425c9  ! 1: OR_I	or 	%r16, 0x05c9, %r4
	.word 0x8a9c24d4  ! 1: XORcc_I	xorcc 	%r16, 0x04d4, %r5
thr3_nuke_intr_789:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_789), 16, 16)) -> intp(0, 2, 1)
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
thr3_resum_intr_790:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_790), 16, 16)) -> intp(0, 3, 1)
	.word 0x92bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
	.word 0x9d7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r14
thr3_hw_intr_791:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_791), 16, 16)) -> intp(0, 0, 1)
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
thr3_hw_intr_792:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_792), 16, 16)) -> intp(0, 0, 1)
	.word 0xb81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r28
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
thr3_nuke_intr_793:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_793), 16, 16)) -> intp(1, 2, 1)
	.word 0x8d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0xb0bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0xae04208b  ! 1: ADD_I	add 	%r16, 0x008b, %r23
	.word 0x993c0011  ! 1: SRA_R	sra 	%r16, %r17, %r12
thr3_resum_intr_794:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_794), 16, 16)) -> intp(1, 3, 1)
	.word 0x912c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r8
thr3_hw_intr_795:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_795), 16, 16)) -> intp(0, 0, 1)
	.word 0x962c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r11
thr3_hw_intr_796:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_796), 16, 16)) -> intp(1, 0, 1)
	.word 0x842c2a7e  ! 1: ANDN_I	andn 	%r16, 0x0a7e, %r2
	.word 0x8c342839  ! 1: ORN_I	orn 	%r16, 0x0839, %r6
thr3_hw_intr_797:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_797), 16, 16)) -> intp(2, 0, 1)
	.word 0x98342201  ! 1: ORN_I	orn 	%r16, 0x0201, %r12
	.word 0x86340011  ! 1: ORN_R	orn 	%r16, %r17, %r3
	.word 0x8b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r5
thr3_hw_intr_798:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_798), 16, 16)) -> intp(0, 0, 1)
	.word 0x8c2c2b5e  ! 1: ANDN_I	andn 	%r16, 0x0b5e, %r6
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
thr3_hw_intr_799:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_799), 16, 16)) -> intp(1, 0, 1)
	.word 0xb42c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r26
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
thr3_hw_intr_800:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_800), 16, 16)) -> intp(2, 0, 1)
	.word 0x868c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r3
thr3_hw_intr_801:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_801), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c1c2eea  ! 1: XOR_I	xor 	%r16, 0x0eea, %r6
	.word 0x9cb42d66  ! 1: ORNcc_I	orncc 	%r16, 0x0d66, %r14
thr3_nuke_intr_802:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_802), 16, 16)) -> intp(1, 2, 1)
	.word 0x83342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0xa72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r19
thr3_resum_intr_803:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_803), 16, 16)) -> intp(1, 3, 1)
	.word 0x9c8c29f9  ! 1: ANDcc_I	andcc 	%r16, 0x09f9, %r14
	.word 0x84842a09  ! 1: ADDcc_I	addcc 	%r16, 0x0a09, %r2
	.word 0x8cb42fdf  ! 1: ORNcc_I	orncc 	%r16, 0x0fdf, %r6
thr3_nuke_intr_804:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_804), 16, 16)) -> intp(0, 2, 1)
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
	.word 0x82ac28a6  ! 1: ANDNcc_I	andncc 	%r16, 0x08a6, %r1
	.word 0xbb3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r29
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
thr3_resum_intr_805:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_805), 16, 16)) -> intp(0, 3, 1)
	.word 0x88040011  ! 1: ADD_R	add 	%r16, %r17, %r4
	.word 0x8c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r6
thr3_nuke_intr_806:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_806), 16, 16)) -> intp(1, 2, 1)
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
thr3_resum_intr_807:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_807), 16, 16)) -> intp(1, 3, 1)
	.word 0x86ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0xb68429af  ! 1: ADDcc_I	addcc 	%r16, 0x09af, %r27
	.word 0xaa0c0011  ! 1: AND_R	and 	%r16, %r17, %r21
thr3_nuke_intr_808:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_808), 16, 16)) -> intp(2, 2, 1)
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
thr3_resum_intr_809:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_809), 16, 16)) -> intp(2, 3, 1)
	.word 0xb92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
	.word 0xb8040011  ! 1: ADD_R	add 	%r16, %r17, %r28
thr3_nuke_intr_810:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_810), 16, 16)) -> intp(1, 2, 1)
	.word 0xb83c250a  ! 1: XNOR_I	xnor 	%r16, 0x050a, %r28
thr3_resum_intr_811:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_811), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r21
thr3_hw_intr_812:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_812), 16, 16)) -> intp(2, 0, 1)
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
	.word 0x86840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0x96bc2ee5  ! 1: XNORcc_I	xnorcc 	%r16, 0x0ee5, %r11
	.word 0x88c42d74  ! 1: ADDCcc_I	addccc 	%r16, 0x0d74, %r4
thr3_hw_intr_813:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_813), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
	.word 0x868c21e2  ! 1: ANDcc_I	andcc 	%r16, 0x01e2, %r3
	.word 0x903c2431  ! 1: XNOR_I	xnor 	%r16, 0x0431, %r8
thr3_hw_intr_814:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_814), 16, 16)) -> intp(2, 0, 1)
	.word 0x9f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r15
thr3_hw_intr_815:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_815), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r7
thr3_hw_intr_816:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_816), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
	.word 0xae2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r23
thr3_hw_intr_817:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_817), 16, 16)) -> intp(0, 0, 1)
	.word 0xb48c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0x821c0011  ! 1: XOR_R	xor 	%r16, %r17, %r1
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
thr3_nuke_intr_818:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_818), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6ac2214  ! 1: ANDNcc_I	andncc 	%r16, 0x0214, %r27
thr3_resum_intr_819:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_819), 16, 16)) -> intp(0, 3, 1)
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0xa8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r20
thr3_nuke_intr_820:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_820), 16, 16)) -> intp(2, 2, 1)
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x897c0411  ! 1: MOVR_R	move	%r16, %r17, %r4
thr3_resum_intr_821:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_821), 16, 16)) -> intp(2, 3, 1)
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0xab2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r21
	.word 0xb64425f7  ! 1: ADDC_I	addc 	%r16, 0x05f7, %r27
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
thr3_nuke_intr_822:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_822), 16, 16)) -> intp(2, 2, 1)
	.word 0xad3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r22
	.word 0x84b42e53  ! 1: ORNcc_I	orncc 	%r16, 0x0e53, %r2
	.word 0x94b424e5  ! 1: ORNcc_I	orncc 	%r16, 0x04e5, %r10
thr3_resum_intr_823:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_823), 16, 16)) -> intp(2, 3, 1)
	.word 0x96bc2838  ! 1: XNORcc_I	xnorcc 	%r16, 0x0838, %r11
	.word 0x92bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x8c2c286b  ! 1: ANDN_I	andn 	%r16, 0x086b, %r6
thr3_nuke_intr_824:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_824), 16, 16)) -> intp(1, 2, 1)
	.word 0x901c0011  ! 1: XOR_R	xor 	%r16, %r17, %r8
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x873c1011  ! 1: SRAX_R	srax	%r16, %r17, %r3
	.word 0x8e9c22e2  ! 1: XORcc_I	xorcc 	%r16, 0x02e2, %r7
thr3_resum_intr_825:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_825), 16, 16)) -> intp(1, 3, 1)
	.word 0x863c27ef  ! 1: XNOR_I	xnor 	%r16, 0x07ef, %r3
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
thr3_hw_intr_826:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_826), 16, 16)) -> intp(0, 0, 1)
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0xb32c0011  ! 1: SLL_R	sll 	%r16, %r17, %r25
thr3_nuke_intr_827:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_827), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r21
thr3_resum_intr_828:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_828), 16, 16)) -> intp(1, 3, 1)
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0xae0c2b1d  ! 1: AND_I	and 	%r16, 0x0b1d, %r23
	.word 0x862c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r3
thr3_nuke_intr_829:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_829), 16, 16)) -> intp(0, 2, 1)
	.word 0x9ec42c3d  ! 1: ADDCcc_I	addccc 	%r16, 0x0c3d, %r15
	.word 0x93340011  ! 1: SRL_R	srl 	%r16, %r17, %r9
	.word 0xa77c0411  ! 1: MOVR_R	move	%r16, %r17, %r19
	.word 0x822c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r1
thr3_resum_intr_830:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_830), 16, 16)) -> intp(0, 3, 1)
	.word 0x9cc4213e  ! 1: ADDCcc_I	addccc 	%r16, 0x013e, %r14
	.word 0x860c26fd  ! 1: AND_I	and 	%r16, 0x06fd, %r3
thr3_hw_intr_831:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_831), 16, 16)) -> intp(1, 0, 1)
	.word 0x841c0011  ! 1: XOR_R	xor 	%r16, %r17, %r2
	.word 0x8cb42d87  ! 1: ORNcc_I	orncc 	%r16, 0x0d87, %r6
thr3_nuke_intr_832:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_832), 16, 16)) -> intp(2, 2, 1)
	.word 0x90b4232d  ! 1: ORNcc_I	orncc 	%r16, 0x032d, %r8
	.word 0x98140011  ! 1: OR_R	or 	%r16, %r17, %r12
thr3_resum_intr_833:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_833), 16, 16)) -> intp(2, 3, 1)
	.word 0xa69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x902c2eaa  ! 1: ANDN_I	andn 	%r16, 0x0eaa, %r8
	.word 0x9a0c22f5  ! 1: AND_I	and 	%r16, 0x02f5, %r13
	.word 0xb4342010  ! 1: ORN_I	orn 	%r16, 0x0010, %r26
thr3_nuke_intr_834:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_834), 16, 16)) -> intp(1, 2, 1)
	.word 0xa9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0x8c9c2c00  ! 1: XORcc_I	xorcc 	%r16, 0x0c00, %r6
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
thr3_resum_intr_835:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_835), 16, 16)) -> intp(1, 3, 1)
	.word 0xb9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r28
	.word 0x9e14235b  ! 1: OR_I	or 	%r16, 0x035b, %r15
thr3_nuke_intr_836:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_836), 16, 16)) -> intp(1, 2, 1)
	.word 0x82b42468  ! 1: ORNcc_I	orncc 	%r16, 0x0468, %r1
	.word 0x9c0c2d6c  ! 1: AND_I	and 	%r16, 0x0d6c, %r14
thr3_resum_intr_837:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_837), 16, 16)) -> intp(1, 3, 1)
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
thr3_nuke_intr_838:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_838), 16, 16)) -> intp(1, 2, 1)
	.word 0x9b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x88040011  ! 1: ADD_R	add 	%r16, %r17, %r4
	.word 0xb61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r27
thr3_resum_intr_839:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_839), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e140011  ! 1: OR_R	or 	%r16, %r17, %r7
	.word 0x820c21ef  ! 1: AND_I	and 	%r16, 0x01ef, %r1
	.word 0x963c27fd  ! 1: XNOR_I	xnor 	%r16, 0x07fd, %r11
thr3_hw_intr_840:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_840), 16, 16)) -> intp(1, 0, 1)
	.word 0x8d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
	.word 0xb13c1011  ! 1: SRAX_R	srax	%r16, %r17, %r24
	.word 0xb63c2eeb  ! 1: XNOR_I	xnor 	%r16, 0x0eeb, %r27
thr3_hw_intr_841:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_841), 16, 16)) -> intp(2, 0, 1)
	.word 0xb92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xb13c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0x94042e7e  ! 1: ADD_I	add 	%r16, 0x0e7e, %r10
	.word 0x8e342b8a  ! 1: ORN_I	orn 	%r16, 0x0b8a, %r7
thr3_hw_intr_842:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_842), 16, 16)) -> intp(0, 0, 1)
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0xb48c2f2b  ! 1: ANDcc_I	andcc 	%r16, 0x0f2b, %r26
thr3_nuke_intr_843:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_843), 16, 16)) -> intp(2, 2, 1)
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x94142198  ! 1: OR_I	or 	%r16, 0x0198, %r10
	.word 0xb2c42b01  ! 1: ADDCcc_I	addccc 	%r16, 0x0b01, %r25
	.word 0x983423cd  ! 1: ORN_I	orn 	%r16, 0x03cd, %r12
thr3_resum_intr_844:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_844), 16, 16)) -> intp(2, 3, 1)
	.word 0xb63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0xaec42e6a  ! 1: ADDCcc_I	addccc 	%r16, 0x0e6a, %r23
	.word 0xba842a7d  ! 1: ADDcc_I	addcc 	%r16, 0x0a7d, %r29
thr3_nuke_intr_845:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_845), 16, 16)) -> intp(1, 2, 1)
	.word 0xb2840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r25
thr3_resum_intr_846:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_846), 16, 16)) -> intp(1, 3, 1)
	.word 0xacac22f5  ! 1: ANDNcc_I	andncc 	%r16, 0x02f5, %r22
	.word 0x9f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r15
thr3_nuke_intr_847:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_847), 16, 16)) -> intp(0, 2, 1)
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x9b7c0411  ! 1: MOVR_R	move	%r16, %r17, %r13
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
thr3_resum_intr_848:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_848), 16, 16)) -> intp(0, 3, 1)
	.word 0x8cc42fed  ! 1: ADDCcc_I	addccc 	%r16, 0x0fed, %r6
thr3_nuke_intr_849:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_849), 16, 16)) -> intp(1, 2, 1)
	.word 0xaaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r21
thr3_resum_intr_850:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_850), 16, 16)) -> intp(1, 3, 1)
	.word 0x89643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xae040011  ! 1: ADD_R	add 	%r16, %r17, %r23
	.word 0x8e842fa8  ! 1: ADDcc_I	addcc 	%r16, 0x0fa8, %r7
	.word 0xba9c203d  ! 1: XORcc_I	xorcc 	%r16, 0x003d, %r29
thr3_nuke_intr_851:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_851), 16, 16)) -> intp(2, 2, 1)
	.word 0xb92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r28
	.word 0x868c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r3
thr3_resum_intr_852:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_852), 16, 16)) -> intp(2, 3, 1)
	.word 0x929c2ed7  ! 1: XORcc_I	xorcc 	%r16, 0x0ed7, %r9
	.word 0xab643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_853:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_853), 16, 16)) -> intp(1, 2, 1)
	.word 0xa97c0411  ! 1: MOVR_R	move	%r16, %r17, %r20
	.word 0x96040011  ! 1: ADD_R	add 	%r16, %r17, %r11
	.word 0xba4426f9  ! 1: ADDC_I	addc 	%r16, 0x06f9, %r29
thr3_resum_intr_854:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_854), 16, 16)) -> intp(1, 3, 1)
	.word 0x88040011  ! 1: ADD_R	add 	%r16, %r17, %r4
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
thr3_hw_intr_855:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_855), 16, 16)) -> intp(1, 0, 1)
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
thr3_hw_intr_856:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_856), 16, 16)) -> intp(1, 0, 1)
	.word 0x843c2cf1  ! 1: XNOR_I	xnor 	%r16, 0x0cf1, %r2
	.word 0xb8340011  ! 1: ORN_R	orn 	%r16, %r17, %r28
thr3_hw_intr_857:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_857), 16, 16)) -> intp(2, 0, 1)
	.word 0x8cb4266c  ! 1: ORNcc_I	orncc 	%r16, 0x066c, %r6
thr3_hw_intr_858:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_858), 16, 16)) -> intp(1, 0, 1)
	.word 0x828c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r1
thr3_nuke_intr_859:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_859), 16, 16)) -> intp(2, 2, 1)
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x881c2795  ! 1: XOR_I	xor 	%r16, 0x0795, %r4
thr3_resum_intr_860:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_860), 16, 16)) -> intp(2, 3, 1)
	.word 0xbabc2c82  ! 1: XNORcc_I	xnorcc 	%r16, 0x0c82, %r29
	.word 0xab3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r21
	.word 0x833c0011  ! 1: SRA_R	sra 	%r16, %r17, %r1
	.word 0x8d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r6
thr3_nuke_intr_861:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_861), 16, 16)) -> intp(0, 2, 1)
	.word 0x9aac2f34  ! 1: ANDNcc_I	andncc 	%r16, 0x0f34, %r13
	.word 0x840420fb  ! 1: ADD_I	add 	%r16, 0x00fb, %r2
	.word 0x88040011  ! 1: ADD_R	add 	%r16, %r17, %r4
	.word 0xb82c21ef  ! 1: ANDN_I	andn 	%r16, 0x01ef, %r28
thr3_resum_intr_862:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_862), 16, 16)) -> intp(0, 3, 1)
	.word 0xae842fb7  ! 1: ADDcc_I	addcc 	%r16, 0x0fb7, %r23
thr3_nuke_intr_863:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_863), 16, 16)) -> intp(1, 2, 1)
	.word 0xaf643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x897c0411  ! 1: MOVR_R	move	%r16, %r17, %r4
thr3_resum_intr_864:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_864), 16, 16)) -> intp(1, 3, 1)
	.word 0x90042537  ! 1: ADD_I	add 	%r16, 0x0537, %r8
	.word 0xa8bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0xaa8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r21
thr3_nuke_intr_865:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_865), 16, 16)) -> intp(2, 2, 1)
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0xacc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0xad340011  ! 1: SRL_R	srl 	%r16, %r17, %r22
thr3_resum_intr_866:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_866), 16, 16)) -> intp(2, 3, 1)
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
	.word 0x8f641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb1341011  ! 1: SRLX_R	srlx	%r16, %r17, %r24
	.word 0x8e0c2d9c  ! 1: AND_I	and 	%r16, 0x0d9c, %r7
thr3_nuke_intr_867:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_867), 16, 16)) -> intp(0, 2, 1)
	.word 0x902c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x89341011  ! 1: SRLX_R	srlx	%r16, %r17, %r4
	.word 0xb6842154  ! 1: ADDcc_I	addcc 	%r16, 0x0154, %r27
thr3_resum_intr_868:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_868), 16, 16)) -> intp(0, 3, 1)
	.word 0xb01c2519  ! 1: XOR_I	xor 	%r16, 0x0519, %r24
	.word 0x853c1011  ! 1: SRAX_R	srax	%r16, %r17, %r2
	.word 0x97641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_869:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_869), 16, 16)) -> intp(1, 2, 1)
	.word 0xae2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r23
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0xab7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r21
	.word 0xaa8c2f48  ! 1: ANDcc_I	andcc 	%r16, 0x0f48, %r21
thr3_resum_intr_870:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_870), 16, 16)) -> intp(1, 3, 1)
	.word 0x997c0411  ! 1: MOVR_R	move	%r16, %r17, %r12
	.word 0x842c2b4d  ! 1: ANDN_I	andn 	%r16, 0x0b4d, %r2
	.word 0x9f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0xa6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r19
thr3_nuke_intr_871:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_871), 16, 16)) -> intp(0, 2, 1)
	.word 0x8cac2da7  ! 1: ANDNcc_I	andncc 	%r16, 0x0da7, %r6
	.word 0xab3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r21
	.word 0x94bc278f  ! 1: XNORcc_I	xnorcc 	%r16, 0x078f, %r10
thr3_resum_intr_872:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_872), 16, 16)) -> intp(0, 3, 1)
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
	.word 0x9e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r15
thr3_nuke_intr_873:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_873), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
thr3_resum_intr_874:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_874), 16, 16)) -> intp(0, 3, 1)
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
	.word 0xbb641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x820c0011  ! 1: AND_R	and 	%r16, %r17, %r1
	.word 0x8f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r7
thr3_nuke_intr_875:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_875), 16, 16)) -> intp(0, 2, 1)
	.word 0xa9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r20
thr3_resum_intr_876:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_876), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e942ce4  ! 1: ORcc_I	orcc 	%r16, 0x0ce4, %r7
	.word 0xae3c2e94  ! 1: XNOR_I	xnor 	%r16, 0x0e94, %r23
thr3_hw_intr_877:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_877), 16, 16)) -> intp(1, 0, 1)
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
thr3_hw_intr_878:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_878), 16, 16)) -> intp(0, 0, 1)
	.word 0x8eac2de3  ! 1: ANDNcc_I	andncc 	%r16, 0x0de3, %r7
	.word 0xae2c2702  ! 1: ANDN_I	andn 	%r16, 0x0702, %r23
thr3_nuke_intr_879:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_879), 16, 16)) -> intp(0, 2, 1)
	.word 0xb93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r28
thr3_resum_intr_880:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_880), 16, 16)) -> intp(0, 3, 1)
	.word 0x8434236c  ! 1: ORN_I	orn 	%r16, 0x036c, %r2
	.word 0xa73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r19
thr3_hw_intr_881:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_881), 16, 16)) -> intp(2, 0, 1)
	.word 0x88bc232e  ! 1: XNORcc_I	xnorcc 	%r16, 0x032e, %r4
thr3_hw_intr_882:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_882), 16, 16)) -> intp(2, 0, 1)
	.word 0x8a8c2a99  ! 1: ANDcc_I	andcc 	%r16, 0x0a99, %r5
	.word 0x823c2990  ! 1: XNOR_I	xnor 	%r16, 0x0990, %r1
	.word 0xb2942aeb  ! 1: ORcc_I	orcc 	%r16, 0x0aeb, %r25
thr3_hw_intr_883:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_883), 16, 16)) -> intp(2, 0, 1)
	.word 0x86bc27a9  ! 1: XNORcc_I	xnorcc 	%r16, 0x07a9, %r3
	.word 0xaa8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0xba042461  ! 1: ADD_I	add 	%r16, 0x0461, %r29
thr3_hw_intr_884:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_884), 16, 16)) -> intp(1, 0, 1)
	.word 0xbabc2108  ! 1: XNORcc_I	xnorcc 	%r16, 0x0108, %r29
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x8ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x873c0011  ! 1: SRA_R	sra 	%r16, %r17, %r3
thr3_hw_intr_885:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_885), 16, 16)) -> intp(0, 0, 1)
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x917c2401  ! 1: MOVR_I	move	%r16, 0x1, %r8
thr3_hw_intr_886:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_886), 16, 16)) -> intp(1, 0, 1)
	.word 0xa80c253e  ! 1: AND_I	and 	%r16, 0x053e, %r20
	.word 0x982c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r12
thr3_nuke_intr_887:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_887), 16, 16)) -> intp(0, 2, 1)
	.word 0xb02c206a  ! 1: ANDN_I	andn 	%r16, 0x006a, %r24
	.word 0xb0040011  ! 1: ADD_R	add 	%r16, %r17, %r24
	.word 0xb2042239  ! 1: ADD_I	add 	%r16, 0x0239, %r25
	.word 0xb4040011  ! 1: ADD_R	add 	%r16, %r17, %r26
thr3_resum_intr_888:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_888), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa440011  ! 1: ADDC_R	addc 	%r16, %r17, %r21
thr3_hw_intr_889:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_889), 16, 16)) -> intp(1, 0, 1)
	.word 0x963c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
thr3_nuke_intr_890:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_890), 16, 16)) -> intp(1, 2, 1)
	.word 0x833c1011  ! 1: SRAX_R	srax	%r16, %r17, %r1
	.word 0x8cc42860  ! 1: ADDCcc_I	addccc 	%r16, 0x0860, %r6
	.word 0x9a3c292b  ! 1: XNOR_I	xnor 	%r16, 0x092b, %r13
thr3_resum_intr_891:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_891), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r6
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
	.word 0x840c0011  ! 1: AND_R	and 	%r16, %r17, %r2
	.word 0xac1c2d66  ! 1: XOR_I	xor 	%r16, 0x0d66, %r22
thr3_hw_intr_892:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_892), 16, 16)) -> intp(1, 0, 1)
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
thr3_hw_intr_893:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_893), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c4420f5  ! 1: ADDC_I	addc 	%r16, 0x00f5, %r14
	.word 0x8e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0xa8842165  ! 1: ADDcc_I	addcc 	%r16, 0x0165, %r20
thr3_hw_intr_894:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_894), 16, 16)) -> intp(1, 0, 1)
	.word 0xb2142dc4  ! 1: OR_I	or 	%r16, 0x0dc4, %r25
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x973c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0xbb3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r29
thr3_hw_intr_895:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_895), 16, 16)) -> intp(0, 0, 1)
	.word 0xb6bc2307  ! 1: XNORcc_I	xnorcc 	%r16, 0x0307, %r27
thr3_hw_intr_896:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_896), 16, 16)) -> intp(2, 0, 1)
	.word 0xb43c2b0f  ! 1: XNOR_I	xnor 	%r16, 0x0b0f, %r26
	.word 0xa6342161  ! 1: ORN_I	orn 	%r16, 0x0161, %r19
thr3_nuke_intr_897:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_897), 16, 16)) -> intp(0, 2, 1)
	.word 0x9ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
thr3_resum_intr_898:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_898), 16, 16)) -> intp(0, 3, 1)
	.word 0x862c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r3
thr3_hw_intr_899:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_899), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e042971  ! 1: ADD_I	add 	%r16, 0x0971, %r7
	.word 0x8e142187  ! 1: OR_I	or 	%r16, 0x0187, %r7
	.word 0x8b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x96840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r11
thr3_nuke_intr_900:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_900), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r20
	.word 0x90b420f9  ! 1: ORNcc_I	orncc 	%r16, 0x00f9, %r8
	.word 0x84842441  ! 1: ADDcc_I	addcc 	%r16, 0x0441, %r2
thr3_resum_intr_901:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_901), 16, 16)) -> intp(1, 3, 1)
	.word 0xb73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r27
	.word 0xb2442f8d  ! 1: ADDC_I	addc 	%r16, 0x0f8d, %r25
	.word 0x912c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r8
thr3_hw_intr_902:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_902), 16, 16)) -> intp(2, 0, 1)
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x8ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x9d3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r14
thr3_nuke_intr_903:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_903), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a142153  ! 1: OR_I	or 	%r16, 0x0153, %r13
	.word 0x8ab4246e  ! 1: ORNcc_I	orncc 	%r16, 0x046e, %r5
	.word 0x9a442e8c  ! 1: ADDC_I	addc 	%r16, 0x0e8c, %r13
thr3_resum_intr_904:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_904), 16, 16)) -> intp(2, 3, 1)
	.word 0x922c273e  ! 1: ANDN_I	andn 	%r16, 0x073e, %r9
	.word 0x9cac2929  ! 1: ANDNcc_I	andncc 	%r16, 0x0929, %r14
	.word 0xb69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r27
thr3_nuke_intr_905:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_905), 16, 16)) -> intp(2, 2, 1)
	.word 0x98040011  ! 1: ADD_R	add 	%r16, %r17, %r12
	.word 0x86940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r3
thr3_resum_intr_906:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_906), 16, 16)) -> intp(2, 3, 1)
	.word 0xba14221c  ! 1: OR_I	or 	%r16, 0x021c, %r29
	.word 0xac8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
thr3_nuke_intr_907:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_907), 16, 16)) -> intp(0, 2, 1)
	.word 0x94942799  ! 1: ORcc_I	orcc 	%r16, 0x0799, %r10
	.word 0x8c2c2629  ! 1: ANDN_I	andn 	%r16, 0x0629, %r6
thr3_resum_intr_908:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_908), 16, 16)) -> intp(0, 3, 1)
	.word 0x90c427de  ! 1: ADDCcc_I	addccc 	%r16, 0x07de, %r8
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0xb62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
thr3_hw_intr_909:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_909), 16, 16)) -> intp(1, 0, 1)
	.word 0xb62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x98842dc6  ! 1: ADDcc_I	addcc 	%r16, 0x0dc6, %r12
	.word 0x903c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r8
thr3_nuke_intr_910:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_910), 16, 16)) -> intp(1, 2, 1)
	.word 0xac1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r22
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x8f641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_911:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_911), 16, 16)) -> intp(1, 3, 1)
	.word 0x923c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r9
thr3_nuke_intr_912:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_912), 16, 16)) -> intp(0, 2, 1)
	.word 0x881c0011  ! 1: XOR_R	xor 	%r16, %r17, %r4
	.word 0x953c0011  ! 1: SRA_R	sra 	%r16, %r17, %r10
	.word 0x90ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0xa8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r20
thr3_resum_intr_913:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_913), 16, 16)) -> intp(0, 3, 1)
	.word 0xa68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0x8a9c2118  ! 1: XORcc_I	xorcc 	%r16, 0x0118, %r5
	.word 0x83641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_914:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_914), 16, 16)) -> intp(0, 0, 1)
	.word 0x8d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r6
	.word 0x923c2b96  ! 1: XNOR_I	xnor 	%r16, 0x0b96, %r9
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
thr3_hw_intr_915:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_915), 16, 16)) -> intp(1, 0, 1)
	.word 0x94140011  ! 1: OR_R	or 	%r16, %r17, %r10
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
	.word 0x9c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r14
	.word 0xae840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r23
thr3_hw_intr_916:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_916), 16, 16)) -> intp(2, 0, 1)
	.word 0x96bc2bec  ! 1: XNORcc_I	xnorcc 	%r16, 0x0bec, %r11
	.word 0x85343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r2
thr3_hw_intr_917:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_917), 16, 16)) -> intp(1, 0, 1)
	.word 0x989c222b  ! 1: XORcc_I	xorcc 	%r16, 0x022b, %r12
thr3_nuke_intr_918:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_918), 16, 16)) -> intp(1, 2, 1)
	.word 0x96c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r11
thr3_resum_intr_919:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_919), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e2c2175  ! 1: ANDN_I	andn 	%r16, 0x0175, %r7
	.word 0xaeac2ec8  ! 1: ANDNcc_I	andncc 	%r16, 0x0ec8, %r23
	.word 0x88440011  ! 1: ADDC_R	addc 	%r16, %r17, %r4
thr3_hw_intr_920:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_920), 16, 16)) -> intp(0, 0, 1)
	.word 0x969c25d8  ! 1: XORcc_I	xorcc 	%r16, 0x05d8, %r11
thr3_hw_intr_921:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_921), 16, 16)) -> intp(0, 0, 1)
	.word 0x90c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x863c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r3
thr3_nuke_intr_922:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_922), 16, 16)) -> intp(2, 2, 1)
	.word 0xb83422de  ! 1: ORN_I	orn 	%r16, 0x02de, %r28
	.word 0xb6340011  ! 1: ORN_R	orn 	%r16, %r17, %r27
thr3_resum_intr_923:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_923), 16, 16)) -> intp(2, 3, 1)
	.word 0x980c2b45  ! 1: AND_I	and 	%r16, 0x0b45, %r12
	.word 0x84942825  ! 1: ORcc_I	orcc 	%r16, 0x0825, %r2
	.word 0xbb340011  ! 1: SRL_R	srl 	%r16, %r17, %r29
thr3_nuke_intr_924:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_924), 16, 16)) -> intp(2, 2, 1)
	.word 0xa6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0xb6c42372  ! 1: ADDCcc_I	addccc 	%r16, 0x0372, %r27
thr3_resum_intr_925:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_925), 16, 16)) -> intp(2, 3, 1)
	.word 0xac942b71  ! 1: ORcc_I	orcc 	%r16, 0x0b71, %r22
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
thr3_hw_intr_926:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_926), 16, 16)) -> intp(0, 0, 1)
	.word 0xb21c0011  ! 1: XOR_R	xor 	%r16, %r17, %r25
	.word 0xa88c213c  ! 1: ANDcc_I	andcc 	%r16, 0x013c, %r20
	.word 0x8b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r5
	.word 0x93343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r9
thr3_nuke_intr_927:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_927), 16, 16)) -> intp(1, 2, 1)
	.word 0xb80c2789  ! 1: AND_I	and 	%r16, 0x0789, %r28
thr3_resum_intr_928:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_928), 16, 16)) -> intp(1, 3, 1)
	.word 0x98040011  ! 1: ADD_R	add 	%r16, %r17, %r12
	.word 0xb8ac2f9d  ! 1: ANDNcc_I	andncc 	%r16, 0x0f9d, %r28
thr3_hw_intr_929:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_929), 16, 16)) -> intp(2, 0, 1)
	.word 0x902c2141  ! 1: ANDN_I	andn 	%r16, 0x0141, %r8
	.word 0x980c28ee  ! 1: AND_I	and 	%r16, 0x08ee, %r12
	.word 0x9d7c2401  ! 1: MOVR_I	move	%r16, 0x8ee, %r14
thr3_nuke_intr_930:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_930), 16, 16)) -> intp(1, 2, 1)
	.word 0x933c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
thr3_resum_intr_931:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_931), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r15
	.word 0xa8ac292f  ! 1: ANDNcc_I	andncc 	%r16, 0x092f, %r20
thr3_nuke_intr_932:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_932), 16, 16)) -> intp(2, 2, 1)
	.word 0x9cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0x9444242a  ! 1: ADDC_I	addc 	%r16, 0x042a, %r10
	.word 0xb48428d8  ! 1: ADDcc_I	addcc 	%r16, 0x08d8, %r26
thr3_resum_intr_933:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_933), 16, 16)) -> intp(2, 3, 1)
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
	.word 0x861c2cb2  ! 1: XOR_I	xor 	%r16, 0x0cb2, %r3
	.word 0x9f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r15
thr3_hw_intr_934:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_934), 16, 16)) -> intp(1, 0, 1)
	.word 0xa69c23e1  ! 1: XORcc_I	xorcc 	%r16, 0x03e1, %r19
thr3_nuke_intr_935:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_935), 16, 16)) -> intp(2, 2, 1)
	.word 0x841c2133  ! 1: XOR_I	xor 	%r16, 0x0133, %r2
thr3_resum_intr_936:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_936), 16, 16)) -> intp(2, 3, 1)
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
thr3_hw_intr_937:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_937), 16, 16)) -> intp(0, 0, 1)
	.word 0x98ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x8d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0xa68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0xaf3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r23
thr3_nuke_intr_938:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_938), 16, 16)) -> intp(0, 2, 1)
	.word 0x98142232  ! 1: OR_I	or 	%r16, 0x0232, %r12
thr3_resum_intr_939:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_939), 16, 16)) -> intp(0, 3, 1)
	.word 0x963c25d5  ! 1: XNOR_I	xnor 	%r16, 0x05d5, %r11
	.word 0x942c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r10
	.word 0xb2b4208c  ! 1: ORNcc_I	orncc 	%r16, 0x008c, %r25
thr3_nuke_intr_940:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_940), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8c42c72  ! 1: ADDCcc_I	addccc 	%r16, 0x0c72, %r20
thr3_resum_intr_941:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_941), 16, 16)) -> intp(0, 3, 1)
	.word 0xaeac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r23
thr3_hw_intr_942:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_942), 16, 16)) -> intp(0, 0, 1)
	.word 0x8ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xac3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x82342c34  ! 1: ORN_I	orn 	%r16, 0x0c34, %r1
thr3_nuke_intr_943:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_943), 16, 16)) -> intp(1, 2, 1)
	.word 0x821c25a7  ! 1: XOR_I	xor 	%r16, 0x05a7, %r1
	.word 0xb2840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r25
thr3_resum_intr_944:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_944), 16, 16)) -> intp(1, 3, 1)
	.word 0xb0b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0xab343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r21
thr3_hw_intr_945:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_945), 16, 16)) -> intp(1, 0, 1)
	.word 0x84142885  ! 1: OR_I	or 	%r16, 0x0885, %r2
	.word 0xab643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_946:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_946), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_947:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_947), 16, 16)) -> intp(0, 2, 1)
	.word 0xba142850  ! 1: OR_I	or 	%r16, 0x0850, %r29
thr3_resum_intr_948:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_948), 16, 16)) -> intp(0, 3, 1)
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0xb8142ac3  ! 1: OR_I	or 	%r16, 0x0ac3, %r28
thr3_nuke_intr_949:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_949), 16, 16)) -> intp(2, 2, 1)
	.word 0x84bc235d  ! 1: XNORcc_I	xnorcc 	%r16, 0x035d, %r2
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
thr3_resum_intr_950:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_950), 16, 16)) -> intp(2, 3, 1)
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0xa8c42ebd  ! 1: ADDCcc_I	addccc 	%r16, 0x0ebd, %r20
	.word 0x9d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r14
thr3_hw_intr_951:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_951), 16, 16)) -> intp(0, 0, 1)
	.word 0x903c2e60  ! 1: XNOR_I	xnor 	%r16, 0x0e60, %r8
thr3_hw_intr_952:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_952), 16, 16)) -> intp(0, 0, 1)
	.word 0x8e8c2cdc  ! 1: ANDcc_I	andcc 	%r16, 0x0cdc, %r7
thr3_nuke_intr_953:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_953), 16, 16)) -> intp(1, 2, 1)
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
thr3_resum_intr_954:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_954), 16, 16)) -> intp(1, 3, 1)
	.word 0xaec42c9e  ! 1: ADDCcc_I	addccc 	%r16, 0x0c9e, %r23
	.word 0x961c0011  ! 1: XOR_R	xor 	%r16, %r17, %r11
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0xad7c0411  ! 1: MOVR_R	move	%r16, %r17, %r22
thr3_nuke_intr_955:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_955), 16, 16)) -> intp(1, 2, 1)
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x8a2c2824  ! 1: ANDN_I	andn 	%r16, 0x0824, %r5
thr3_resum_intr_956:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_956), 16, 16)) -> intp(1, 3, 1)
	.word 0x95341011  ! 1: SRLX_R	srlx	%r16, %r17, %r10
thr3_nuke_intr_957:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_957), 16, 16)) -> intp(2, 2, 1)
	.word 0xb88c211e  ! 1: ANDcc_I	andcc 	%r16, 0x011e, %r28
	.word 0x8b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x90ac2ac0  ! 1: ANDNcc_I	andncc 	%r16, 0x0ac0, %r8
	.word 0xb42c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r26
thr3_resum_intr_958:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_958), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x88340011  ! 1: ORN_R	orn 	%r16, %r17, %r4
thr3_nuke_intr_959:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_959), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb341011  ! 1: SRLX_R	srlx	%r16, %r17, %r29
	.word 0x96440011  ! 1: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x93340011  ! 1: SRL_R	srl 	%r16, %r17, %r9
thr3_resum_intr_960:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_960), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r29
	.word 0x842c2562  ! 1: ANDN_I	andn 	%r16, 0x0562, %r2
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
thr3_hw_intr_961:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_961), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa340011  ! 1: ORN_R	orn 	%r16, %r17, %r21
	.word 0xb4342bab  ! 1: ORN_I	orn 	%r16, 0x0bab, %r26
	.word 0xb92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r28
thr3_nuke_intr_962:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_962), 16, 16)) -> intp(1, 2, 1)
	.word 0x953c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0xb0840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0x8e0c29d5  ! 1: AND_I	and 	%r16, 0x09d5, %r7
thr3_resum_intr_963:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_963), 16, 16)) -> intp(1, 3, 1)
	.word 0xae940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r23
thr3_hw_intr_964:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_964), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e34249c  ! 1: ORN_I	orn 	%r16, 0x049c, %r7
thr3_nuke_intr_965:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_965), 16, 16)) -> intp(2, 2, 1)
	.word 0xb7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r27
thr3_resum_intr_966:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_966), 16, 16)) -> intp(2, 3, 1)
	.word 0xb0b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0xa6840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r19
thr3_nuke_intr_967:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_967), 16, 16)) -> intp(2, 2, 1)
	.word 0xad340011  ! 1: SRL_R	srl 	%r16, %r17, %r22
	.word 0x8cbc267f  ! 1: XNORcc_I	xnorcc 	%r16, 0x067f, %r6
	.word 0x853c0011  ! 1: SRA_R	sra 	%r16, %r17, %r2
	.word 0x96bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r11
thr3_resum_intr_968:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_968), 16, 16)) -> intp(2, 3, 1)
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
thr3_hw_intr_969:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_969), 16, 16)) -> intp(0, 0, 1)
	.word 0x8c140011  ! 1: OR_R	or 	%r16, %r17, %r6
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
	.word 0xb4840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r26
thr3_nuke_intr_970:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_970), 16, 16)) -> intp(2, 2, 1)
	.word 0x96842d13  ! 1: ADDcc_I	addcc 	%r16, 0x0d13, %r11
thr3_resum_intr_971:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_971), 16, 16)) -> intp(2, 3, 1)
	.word 0x8d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r6
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x84942350  ! 1: ORcc_I	orcc 	%r16, 0x0350, %r2
thr3_nuke_intr_972:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_972), 16, 16)) -> intp(2, 2, 1)
	.word 0x989c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
thr3_resum_intr_973:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_973), 16, 16)) -> intp(2, 3, 1)
	.word 0x981c20cc  ! 1: XOR_I	xor 	%r16, 0x00cc, %r12
	.word 0x989428c1  ! 1: ORcc_I	orcc 	%r16, 0x08c1, %r12
	.word 0xb1343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r24
thr3_hw_intr_974:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_974), 16, 16)) -> intp(2, 0, 1)
	.word 0x95343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0xa7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r19
	.word 0xa81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r20
	.word 0x9e0427ef  ! 1: ADD_I	add 	%r16, 0x07ef, %r15
thr3_nuke_intr_975:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_975), 16, 16)) -> intp(2, 2, 1)
	.word 0x8d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r6
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
thr3_resum_intr_976:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_976), 16, 16)) -> intp(2, 3, 1)
	.word 0x997c0411  ! 1: MOVR_R	move	%r16, %r17, %r12
thr3_hw_intr_977:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_977), 16, 16)) -> intp(2, 0, 1)
	.word 0x943c2d46  ! 1: XNOR_I	xnor 	%r16, 0x0d46, %r10
	.word 0x868c2135  ! 1: ANDcc_I	andcc 	%r16, 0x0135, %r3
	.word 0xb0342109  ! 1: ORN_I	orn 	%r16, 0x0109, %r24
	.word 0xa72c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r19
thr3_nuke_intr_978:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_978), 16, 16)) -> intp(2, 2, 1)
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
	.word 0x8f643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
	.word 0x94442b9f  ! 1: ADDC_I	addc 	%r16, 0x0b9f, %r10
thr3_resum_intr_979:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_979), 16, 16)) -> intp(2, 3, 1)
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
	.word 0xaf340011  ! 1: SRL_R	srl 	%r16, %r17, %r23
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
thr3_nuke_intr_980:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_980), 16, 16)) -> intp(0, 2, 1)
	.word 0x868423da  ! 1: ADDcc_I	addcc 	%r16, 0x03da, %r3
	.word 0xb0c42386  ! 1: ADDCcc_I	addccc 	%r16, 0x0386, %r24
	.word 0x962c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r11
thr3_resum_intr_981:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_981), 16, 16)) -> intp(0, 3, 1)
	.word 0xac040011  ! 1: ADD_R	add 	%r16, %r17, %r22
	.word 0xb53c0011  ! 1: SRA_R	sra 	%r16, %r17, %r26
thr3_hw_intr_982:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_982), 16, 16)) -> intp(0, 0, 1)
	.word 0x981c0011  ! 1: XOR_R	xor 	%r16, %r17, %r12
thr3_nuke_intr_983:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_983), 16, 16)) -> intp(2, 2, 1)
	.word 0xb3340011  ! 1: SRL_R	srl 	%r16, %r17, %r25
thr3_resum_intr_984:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_984), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c942e14  ! 1: ORcc_I	orcc 	%r16, 0x0e14, %r6
thr3_hw_intr_985:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_985), 16, 16)) -> intp(1, 0, 1)
	.word 0x8a040011  ! 1: ADD_R	add 	%r16, %r17, %r5
	.word 0x889c214d  ! 1: XORcc_I	xorcc 	%r16, 0x014d, %r4
	.word 0x96040011  ! 1: ADD_R	add 	%r16, %r17, %r11
thr3_nuke_intr_986:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_986), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
thr3_resum_intr_987:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_987), 16, 16)) -> intp(0, 3, 1)
	.word 0x92140011  ! 1: OR_R	or 	%r16, %r17, %r9
	.word 0x90342cd0  ! 1: ORN_I	orn 	%r16, 0x0cd0, %r8
	.word 0x87342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r3
thr3_hw_intr_988:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_988), 16, 16)) -> intp(1, 0, 1)
	.word 0x82342fc3  ! 1: ORN_I	orn 	%r16, 0x0fc3, %r1
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
	.word 0x857c2401  ! 1: MOVR_I	move	%r16, 0x11, %r2
thr3_hw_intr_989:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_989), 16, 16)) -> intp(2, 0, 1)
	.word 0x96040011  ! 1: ADD_R	add 	%r16, %r17, %r11
thr3_nuke_intr_990:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_990), 16, 16)) -> intp(1, 2, 1)
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x912c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r8
thr3_resum_intr_991:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_991), 16, 16)) -> intp(1, 3, 1)
	.word 0xab342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0xbb7c2401  ! 1: MOVR_I	move	%r16, 0x1, %r29
	.word 0x8d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x94142aff  ! 1: OR_I	or 	%r16, 0x0aff, %r10
thr3_nuke_intr_992:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_992), 16, 16)) -> intp(0, 2, 1)
	.word 0x943c25ff  ! 1: XNOR_I	xnor 	%r16, 0x05ff, %r10
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
	.word 0x98bc2a7a  ! 1: XNORcc_I	xnorcc 	%r16, 0x0a7a, %r12
thr3_resum_intr_993:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_993), 16, 16)) -> intp(0, 3, 1)
	.word 0x862c2f97  ! 1: ANDN_I	andn 	%r16, 0x0f97, %r3
	.word 0x963c28b2  ! 1: XNOR_I	xnor 	%r16, 0x08b2, %r11
	.word 0xaa440011  ! 1: ADDC_R	addc 	%r16, %r17, %r21
	.word 0x8e942604  ! 1: ORcc_I	orcc 	%r16, 0x0604, %r7
thr3_hw_intr_994:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_994), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c1c2ff2  ! 1: XOR_I	xor 	%r16, 0x0ff2, %r14
	.word 0xae9c2548  ! 1: XORcc_I	xorcc 	%r16, 0x0548, %r23
thr3_hw_intr_995:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_995), 16, 16)) -> intp(1, 0, 1)
	.word 0xab2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0xaeb424e6  ! 1: ORNcc_I	orncc 	%r16, 0x04e6, %r23
	.word 0x9ab421e8  ! 1: ORNcc_I	orncc 	%r16, 0x01e8, %r13
thr3_hw_intr_996:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_996), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7340011  ! 1: SRL_R	srl 	%r16, %r17, %r27
	.word 0xa81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r20
	.word 0x8c9423bc  ! 1: ORcc_I	orcc 	%r16, 0x03bc, %r6
thr3_nuke_intr_997:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_997), 16, 16)) -> intp(0, 2, 1)
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x84140011  ! 1: OR_R	or 	%r16, %r17, %r2
thr3_resum_intr_998:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_998), 16, 16)) -> intp(0, 3, 1)
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
thr3_nuke_intr_999:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_999), 16, 16)) -> intp(1, 2, 1)
	.word 0xa69c2b3e  ! 1: XORcc_I	xorcc 	%r16, 0x0b3e, %r19
	.word 0xae8c2fa2  ! 1: ANDcc_I	andcc 	%r16, 0x0fa2, %r23
thr3_resum_intr_1000:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1000), 16, 16)) -> intp(1, 3, 1)
	.word 0x9ac42505  ! 1: ADDCcc_I	addccc 	%r16, 0x0505, %r13
thr3_hw_intr_1001:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1001), 16, 16)) -> intp(1, 0, 1)
	.word 0xb72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r27
thr3_nuke_intr_1002:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1002), 16, 16)) -> intp(1, 2, 1)
	.word 0xa6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r19
thr3_resum_intr_1003:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1003), 16, 16)) -> intp(1, 3, 1)
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
	.word 0x9c942fe5  ! 1: ORcc_I	orcc 	%r16, 0x0fe5, %r14
	.word 0x832c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r1
thr3_nuke_intr_1004:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1004), 16, 16)) -> intp(2, 2, 1)
	.word 0xae3c203d  ! 1: XNOR_I	xnor 	%r16, 0x003d, %r23
	.word 0xac9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r22
thr3_resum_intr_1005:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1005), 16, 16)) -> intp(2, 3, 1)
	.word 0x828c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r1
thr3_nuke_intr_1006:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1006), 16, 16)) -> intp(1, 2, 1)
	.word 0x9c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0xb93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r28
thr3_resum_intr_1007:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1007), 16, 16)) -> intp(1, 3, 1)
	.word 0x8ebc2bd2  ! 1: XNORcc_I	xnorcc 	%r16, 0x0bd2, %r7
	.word 0xb8c4251e  ! 1: ADDCcc_I	addccc 	%r16, 0x051e, %r28
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
thr3_nuke_intr_1008:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1008), 16, 16)) -> intp(1, 2, 1)
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
	.word 0x8abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r5
thr3_resum_intr_1009:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1009), 16, 16)) -> intp(1, 3, 1)
	.word 0x877c0411  ! 1: MOVR_R	move	%r16, %r17, %r3
	.word 0x8a4422ba  ! 1: ADDC_I	addc 	%r16, 0x02ba, %r5
	.word 0xb1342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0x8a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r5
thr3_nuke_intr_1010:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1010), 16, 16)) -> intp(2, 2, 1)
	.word 0x88b428e8  ! 1: ORNcc_I	orncc 	%r16, 0x08e8, %r4
thr3_resum_intr_1011:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1011), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e140011  ! 1: OR_R	or 	%r16, %r17, %r15
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
thr3_hw_intr_1012:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1012), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r28
thr3_nuke_intr_1013:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1013), 16, 16)) -> intp(2, 2, 1)
	.word 0x949c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0xb32c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0x949c2ace  ! 1: XORcc_I	xorcc 	%r16, 0x0ace, %r10
thr3_resum_intr_1014:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1014), 16, 16)) -> intp(2, 3, 1)
	.word 0xbb340011  ! 1: SRL_R	srl 	%r16, %r17, %r29
thr3_nuke_intr_1015:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1015), 16, 16)) -> intp(0, 2, 1)
	.word 0x92ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r9
thr3_resum_intr_1016:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1016), 16, 16)) -> intp(0, 3, 1)
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x87643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r13
thr3_hw_intr_1017:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1017), 16, 16)) -> intp(2, 0, 1)
	.word 0x9e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r15
thr3_hw_intr_1018:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1018), 16, 16)) -> intp(2, 0, 1)
	.word 0xaf343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0xb8142218  ! 1: OR_I	or 	%r16, 0x0218, %r28
	.word 0x9e942fad  ! 1: ORcc_I	orcc 	%r16, 0x0fad, %r15
	.word 0x86340011  ! 1: ORN_R	orn 	%r16, %r17, %r3
thr3_nuke_intr_1019:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1019), 16, 16)) -> intp(1, 2, 1)
	.word 0x869c2dfa  ! 1: XORcc_I	xorcc 	%r16, 0x0dfa, %r3
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
	.word 0xa8140011  ! 1: OR_R	or 	%r16, %r17, %r20
thr3_resum_intr_1020:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1020), 16, 16)) -> intp(1, 3, 1)
	.word 0xac140011  ! 1: OR_R	or 	%r16, %r17, %r22
	.word 0x972c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r11
	.word 0x8f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x93343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r9
thr3_nuke_intr_1021:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1021), 16, 16)) -> intp(0, 2, 1)
	.word 0x823429b3  ! 1: ORN_I	orn 	%r16, 0x09b3, %r1
thr3_resum_intr_1022:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1022), 16, 16)) -> intp(0, 3, 1)
	.word 0x9a9427ec  ! 1: ORcc_I	orcc 	%r16, 0x07ec, %r13
thr3_nuke_intr_1023:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1023), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0xb3343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0x82bc2dde  ! 1: XNORcc_I	xnorcc 	%r16, 0x0dde, %r1
thr3_resum_intr_1024:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1024), 16, 16)) -> intp(2, 3, 1)
	.word 0x92c4213e  ! 1: ADDCcc_I	addccc 	%r16, 0x013e, %r9
	.word 0x84840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r2
thr3_hw_intr_1025:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1025), 16, 16)) -> intp(0, 0, 1)
	.word 0x96340011  ! 1: ORN_R	orn 	%r16, %r17, %r11
thr3_hw_intr_1026:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1026), 16, 16)) -> intp(0, 0, 1)
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x893c1011  ! 1: SRAX_R	srax	%r16, %r17, %r4
	.word 0xb61422df  ! 1: OR_I	or 	%r16, 0x02df, %r27
	.word 0x87343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r3
thr3_hw_intr_1027:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1027), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a842064  ! 1: ADDcc_I	addcc 	%r16, 0x0064, %r5
thr3_nuke_intr_1028:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1028), 16, 16)) -> intp(1, 2, 1)
	.word 0xb21c0011  ! 1: XOR_R	xor 	%r16, %r17, %r25
	.word 0xaf342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r23
thr3_resum_intr_1029:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1029), 16, 16)) -> intp(1, 3, 1)
	.word 0xb0b42a9a  ! 1: ORNcc_I	orncc 	%r16, 0x0a9a, %r24
thr3_nuke_intr_1030:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1030), 16, 16)) -> intp(1, 2, 1)
	.word 0x893c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r4
thr3_resum_intr_1031:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1031), 16, 16)) -> intp(1, 3, 1)
	.word 0x86c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x91343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0xbabc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r29
thr3_nuke_intr_1032:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1032), 16, 16)) -> intp(2, 2, 1)
	.word 0x98142951  ! 1: OR_I	or 	%r16, 0x0951, %r12
thr3_resum_intr_1033:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1033), 16, 16)) -> intp(2, 3, 1)
	.word 0xa8ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0x9b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r13
	.word 0xb8bc2c66  ! 1: XNORcc_I	xnorcc 	%r16, 0x0c66, %r28
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
thr3_nuke_intr_1034:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1034), 16, 16)) -> intp(2, 2, 1)
	.word 0x9f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r15
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
thr3_resum_intr_1035:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1035), 16, 16)) -> intp(2, 3, 1)
	.word 0x8e140011  ! 1: OR_R	or 	%r16, %r17, %r7
	.word 0xb8942037  ! 1: ORcc_I	orcc 	%r16, 0x0037, %r28
thr3_nuke_intr_1036:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1036), 16, 16)) -> intp(2, 2, 1)
	.word 0x93340011  ! 1: SRL_R	srl 	%r16, %r17, %r9
	.word 0x837c2401  ! 1: MOVR_I	move	%r16, 0x11, %r1
	.word 0x92040011  ! 1: ADD_R	add 	%r16, %r17, %r9
thr3_resum_intr_1037:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1037), 16, 16)) -> intp(2, 3, 1)
	.word 0x9d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0xa72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0xa6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r19
	.word 0x8d643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_1038:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1038), 16, 16)) -> intp(1, 0, 1)
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
thr3_nuke_intr_1039:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1039), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
thr3_resum_intr_1040:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1040), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f340011  ! 1: SRL_R	srl 	%r16, %r17, %r15
thr3_nuke_intr_1041:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1041), 16, 16)) -> intp(2, 2, 1)
	.word 0x981c0011  ! 1: XOR_R	xor 	%r16, %r17, %r12
thr3_resum_intr_1042:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1042), 16, 16)) -> intp(2, 3, 1)
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0xb8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r28
thr3_hw_intr_1043:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1043), 16, 16)) -> intp(1, 0, 1)
	.word 0x932c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r9
thr3_hw_intr_1044:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1044), 16, 16)) -> intp(0, 0, 1)
	.word 0xb43c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x912c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x86340011  ! 1: ORN_R	orn 	%r16, %r17, %r3
thr3_hw_intr_1045:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1045), 16, 16)) -> intp(2, 0, 1)
	.word 0x881c24fa  ! 1: XOR_I	xor 	%r16, 0x04fa, %r4
thr3_nuke_intr_1046:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1046), 16, 16)) -> intp(1, 2, 1)
	.word 0xae3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x86440011  ! 1: ADDC_R	addc 	%r16, %r17, %r3
	.word 0xa6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r19
thr3_resum_intr_1047:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1047), 16, 16)) -> intp(1, 3, 1)
	.word 0x89643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0xb42c2d6e  ! 1: ANDN_I	andn 	%r16, 0x0d6e, %r26
	.word 0x96440011  ! 1: ADDC_R	addc 	%r16, %r17, %r11
thr3_nuke_intr_1048:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1048), 16, 16)) -> intp(1, 2, 1)
	.word 0xaebc2b18  ! 1: XNORcc_I	xnorcc 	%r16, 0x0b18, %r23
	.word 0x8c342646  ! 1: ORN_I	orn 	%r16, 0x0646, %r6
thr3_resum_intr_1049:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1049), 16, 16)) -> intp(1, 3, 1)
	.word 0xa73c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r19
	.word 0x96340011  ! 1: ORN_R	orn 	%r16, %r17, %r11
	.word 0x8a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
thr3_nuke_intr_1050:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1050), 16, 16)) -> intp(2, 2, 1)
	.word 0x98ac261e  ! 1: ANDNcc_I	andncc 	%r16, 0x061e, %r12
	.word 0x897c0411  ! 1: MOVR_R	move	%r16, %r17, %r4
thr3_resum_intr_1051:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1051), 16, 16)) -> intp(2, 3, 1)
	.word 0x8eb427a2  ! 1: ORNcc_I	orncc 	%r16, 0x07a2, %r7
thr3_hw_intr_1052:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1052), 16, 16)) -> intp(0, 0, 1)
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0xb83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0x94c42a06  ! 1: ADDCcc_I	addccc 	%r16, 0x0a06, %r10
	.word 0x962c2409  ! 1: ANDN_I	andn 	%r16, 0x0409, %r11
thr3_hw_intr_1053:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1053), 16, 16)) -> intp(2, 0, 1)
	.word 0x842c2e22  ! 1: ANDN_I	andn 	%r16, 0x0e22, %r2
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
thr3_nuke_intr_1054:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1054), 16, 16)) -> intp(1, 2, 1)
	.word 0x88ac299c  ! 1: ANDNcc_I	andncc 	%r16, 0x099c, %r4
thr3_resum_intr_1055:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1055), 16, 16)) -> intp(1, 3, 1)
	.word 0xac2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r22
	.word 0xb02c28fc  ! 1: ANDN_I	andn 	%r16, 0x08fc, %r24
thr3_hw_intr_1056:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1056), 16, 16)) -> intp(2, 0, 1)
	.word 0xa92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0xa61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r19
	.word 0xb6140011  ! 1: OR_R	or 	%r16, %r17, %r27
	.word 0x92140011  ! 1: OR_R	or 	%r16, %r17, %r9
thr3_nuke_intr_1057:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1057), 16, 16)) -> intp(0, 2, 1)
	.word 0xab3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r21
thr3_resum_intr_1058:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1058), 16, 16)) -> intp(0, 3, 1)
	.word 0xa6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0x89342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x841426a6  ! 1: OR_I	or 	%r16, 0x06a6, %r2
thr3_nuke_intr_1059:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1059), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
thr3_resum_intr_1060:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1060), 16, 16)) -> intp(1, 3, 1)
	.word 0xb23c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0x957c2401  ! 1: MOVR_I	move	%r16, 0x11, %r10
thr3_nuke_intr_1061:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1061), 16, 16)) -> intp(2, 2, 1)
	.word 0xa60c0011  ! 1: AND_R	and 	%r16, %r17, %r19
	.word 0x9b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0xb93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r28
thr3_resum_intr_1062:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1062), 16, 16)) -> intp(2, 3, 1)
	.word 0x837c0411  ! 1: MOVR_R	move	%r16, %r17, %r1
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
thr3_nuke_intr_1063:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1063), 16, 16)) -> intp(0, 2, 1)
	.word 0x9cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x9cbc21c2  ! 1: XNORcc_I	xnorcc 	%r16, 0x01c2, %r14
thr3_resum_intr_1064:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1064), 16, 16)) -> intp(0, 3, 1)
	.word 0xbab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x880c2861  ! 1: AND_I	and 	%r16, 0x0861, %r4
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
	.word 0x9b643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_1065:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1065), 16, 16)) -> intp(0, 2, 1)
	.word 0x881c2d85  ! 1: XOR_I	xor 	%r16, 0x0d85, %r4
	.word 0x96040011  ! 1: ADD_R	add 	%r16, %r17, %r11
	.word 0x8ebc2f06  ! 1: XNORcc_I	xnorcc 	%r16, 0x0f06, %r7
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
thr3_resum_intr_1066:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1066), 16, 16)) -> intp(0, 3, 1)
	.word 0x92ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x949c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0x881c0011  ! 1: XOR_R	xor 	%r16, %r17, %r4
thr3_hw_intr_1067:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1067), 16, 16)) -> intp(2, 0, 1)
	.word 0x9c140011  ! 1: OR_R	or 	%r16, %r17, %r14
	.word 0x8ab42e99  ! 1: ORNcc_I	orncc 	%r16, 0x0e99, %r5
thr3_nuke_intr_1068:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1068), 16, 16)) -> intp(0, 2, 1)
	.word 0x8614219d  ! 1: OR_I	or 	%r16, 0x019d, %r3
	.word 0xaf3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r23
	.word 0x8b641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_1069:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1069), 16, 16)) -> intp(0, 3, 1)
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
	.word 0x90c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x9d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xaabc2ced  ! 1: XNORcc_I	xnorcc 	%r16, 0x0ced, %r21
thr3_nuke_intr_1070:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1070), 16, 16)) -> intp(2, 2, 1)
	.word 0xa97c2401  ! 1: MOVR_I	move	%r16, 0xced, %r20
	.word 0x9d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r14
	.word 0x840c0011  ! 1: AND_R	and 	%r16, %r17, %r2
thr3_resum_intr_1071:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1071), 16, 16)) -> intp(2, 3, 1)
	.word 0xb6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r27
thr3_nuke_intr_1072:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1072), 16, 16)) -> intp(0, 2, 1)
	.word 0x8f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x842c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r2
	.word 0xb6ac2751  ! 1: ANDNcc_I	andncc 	%r16, 0x0751, %r27
thr3_resum_intr_1073:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1073), 16, 16)) -> intp(0, 3, 1)
	.word 0xaeac2193  ! 1: ANDNcc_I	andncc 	%r16, 0x0193, %r23
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x8e9c21a1  ! 1: XORcc_I	xorcc 	%r16, 0x01a1, %r7
	.word 0xb92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r28
thr3_hw_intr_1074:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1074), 16, 16)) -> intp(2, 0, 1)
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x828c2e72  ! 1: ANDcc_I	andcc 	%r16, 0x0e72, %r1
thr3_hw_intr_1075:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1075), 16, 16)) -> intp(0, 0, 1)
	.word 0x94042b88  ! 1: ADD_I	add 	%r16, 0x0b88, %r10
thr3_nuke_intr_1076:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1076), 16, 16)) -> intp(2, 2, 1)
	.word 0xa93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x900c2d22  ! 1: AND_I	and 	%r16, 0x0d22, %r8
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
thr3_resum_intr_1077:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1077), 16, 16)) -> intp(2, 3, 1)
	.word 0xba3420d0  ! 1: ORN_I	orn 	%r16, 0x00d0, %r29
	.word 0x9f641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x840c2f81  ! 1: AND_I	and 	%r16, 0x0f81, %r2
	.word 0xb08c2191  ! 1: ANDcc_I	andcc 	%r16, 0x0191, %r24
thr3_nuke_intr_1078:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1078), 16, 16)) -> intp(0, 2, 1)
	.word 0x861426b4  ! 1: OR_I	or 	%r16, 0x06b4, %r3
thr3_resum_intr_1079:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1079), 16, 16)) -> intp(0, 3, 1)
	.word 0xa92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r20
thr3_hw_intr_1080:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1080), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7340011  ! 1: SRL_R	srl 	%r16, %r17, %r27
	.word 0x863429ec  ! 1: ORN_I	orn 	%r16, 0x09ec, %r3
thr3_hw_intr_1081:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1081), 16, 16)) -> intp(2, 0, 1)
	.word 0x8a9c22ad  ! 1: XORcc_I	xorcc 	%r16, 0x02ad, %r5
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb80c0011  ! 1: AND_R	and 	%r16, %r17, %r28
	.word 0xb37c0411  ! 1: MOVR_R	move	%r16, %r17, %r25
thr3_hw_intr_1082:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1082), 16, 16)) -> intp(0, 0, 1)
	.word 0xa72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r19
	.word 0x9a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r13
thr3_nuke_intr_1083:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1083), 16, 16)) -> intp(0, 2, 1)
	.word 0xb00c0011  ! 1: AND_R	and 	%r16, %r17, %r24
thr3_resum_intr_1084:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1084), 16, 16)) -> intp(0, 3, 1)
	.word 0x823c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0xacb42907  ! 1: ORNcc_I	orncc 	%r16, 0x0907, %r22
	.word 0xa61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r19
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
thr3_hw_intr_1085:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1085), 16, 16)) -> intp(1, 0, 1)
	.word 0x988c2414  ! 1: ANDcc_I	andcc 	%r16, 0x0414, %r12
	.word 0x942c272f  ! 1: ANDN_I	andn 	%r16, 0x072f, %r10
	.word 0x88840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r4
thr3_nuke_intr_1086:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1086), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xa9641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x872c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r3
	.word 0x880c0011  ! 1: AND_R	and 	%r16, %r17, %r4
thr3_resum_intr_1087:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1087), 16, 16)) -> intp(0, 3, 1)
	.word 0x8a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r5
	.word 0xa8340011  ! 1: ORN_R	orn 	%r16, %r17, %r20
thr3_nuke_intr_1088:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1088), 16, 16)) -> intp(2, 2, 1)
	.word 0x86440011  ! 1: ADDC_R	addc 	%r16, %r17, %r3
thr3_resum_intr_1089:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1089), 16, 16)) -> intp(2, 3, 1)
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x90340011  ! 1: ORN_R	orn 	%r16, %r17, %r8
thr3_nuke_intr_1090:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1090), 16, 16)) -> intp(0, 2, 1)
	.word 0x8cc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x9a0c2533  ! 1: AND_I	and 	%r16, 0x0533, %r13
	.word 0x94140011  ! 1: OR_R	or 	%r16, %r17, %r10
	.word 0xb21c2fb3  ! 1: XOR_I	xor 	%r16, 0x0fb3, %r25
thr3_resum_intr_1091:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1091), 16, 16)) -> intp(0, 3, 1)
	.word 0x8f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r7
thr3_hw_intr_1092:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1092), 16, 16)) -> intp(0, 0, 1)
	.word 0x861c2bc9  ! 1: XOR_I	xor 	%r16, 0x0bc9, %r3
thr3_hw_intr_1093:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1093), 16, 16)) -> intp(1, 0, 1)
	.word 0xae1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r23
	.word 0xa62c2126  ! 1: ANDN_I	andn 	%r16, 0x0126, %r19
thr3_nuke_intr_1094:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1094), 16, 16)) -> intp(2, 2, 1)
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0xb72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r27
	.word 0xb6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x93341011  ! 1: SRLX_R	srlx	%r16, %r17, %r9
thr3_resum_intr_1095:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1095), 16, 16)) -> intp(2, 3, 1)
	.word 0x953c0011  ! 1: SRA_R	sra 	%r16, %r17, %r10
	.word 0xb4040011  ! 1: ADD_R	add 	%r16, %r17, %r26
thr3_hw_intr_1096:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1096), 16, 16)) -> intp(1, 0, 1)
	.word 0x98042ee6  ! 1: ADD_I	add 	%r16, 0x0ee6, %r12
	.word 0xb0b42014  ! 1: ORNcc_I	orncc 	%r16, 0x0014, %r24
	.word 0x892c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r4
thr3_hw_intr_1097:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1097), 16, 16)) -> intp(2, 0, 1)
	.word 0x929c2e77  ! 1: XORcc_I	xorcc 	%r16, 0x0e77, %r9
	.word 0x86c4255a  ! 1: ADDCcc_I	addccc 	%r16, 0x055a, %r3
thr3_nuke_intr_1098:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1098), 16, 16)) -> intp(0, 2, 1)
	.word 0x9e140011  ! 1: OR_R	or 	%r16, %r17, %r15
	.word 0x9e2c2bdd  ! 1: ANDN_I	andn 	%r16, 0x0bdd, %r15
	.word 0xb844270f  ! 1: ADDC_I	addc 	%r16, 0x070f, %r28
thr3_resum_intr_1099:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1099), 16, 16)) -> intp(0, 3, 1)
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x929c2bcb  ! 1: XORcc_I	xorcc 	%r16, 0x0bcb, %r9
thr3_hw_intr_1100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1100), 16, 16)) -> intp(0, 0, 1)
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0xbb340011  ! 1: SRL_R	srl 	%r16, %r17, %r29
thr3_nuke_intr_1101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1101), 16, 16)) -> intp(0, 2, 1)
	.word 0x8abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0xb8042d4a  ! 1: ADD_I	add 	%r16, 0x0d4a, %r28
thr3_resum_intr_1102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1102), 16, 16)) -> intp(0, 3, 1)
	.word 0x82c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x8ac42b2e  ! 1: ADDCcc_I	addccc 	%r16, 0x0b2e, %r5
thr3_nuke_intr_1103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1103), 16, 16)) -> intp(0, 2, 1)
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0xab2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r21
thr3_resum_intr_1104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1104), 16, 16)) -> intp(0, 3, 1)
	.word 0xb23c2e56  ! 1: XNOR_I	xnor 	%r16, 0x0e56, %r25
	.word 0x84c42587  ! 1: ADDCcc_I	addccc 	%r16, 0x0587, %r2
thr3_hw_intr_1105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1105), 16, 16)) -> intp(1, 0, 1)
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
thr3_hw_intr_1106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1106), 16, 16)) -> intp(0, 0, 1)
	.word 0x9b7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r13
	.word 0xb08429cf  ! 1: ADDcc_I	addcc 	%r16, 0x09cf, %r24
thr3_hw_intr_1107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1107), 16, 16)) -> intp(1, 0, 1)
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x972c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x89342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r4
thr3_hw_intr_1108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1108), 16, 16)) -> intp(0, 0, 1)
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
	.word 0x82bc2df9  ! 1: XNORcc_I	xnorcc 	%r16, 0x0df9, %r1
thr3_hw_intr_1109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1109), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
	.word 0xb4b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r26
thr3_hw_intr_1110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1110), 16, 16)) -> intp(2, 0, 1)
	.word 0x897c0411  ! 1: MOVR_R	move	%r16, %r17, %r4
	.word 0x98442709  ! 1: ADDC_I	addc 	%r16, 0x0709, %r12
	.word 0x9c3c2d46  ! 1: XNOR_I	xnor 	%r16, 0x0d46, %r14
thr3_hw_intr_1111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1111), 16, 16)) -> intp(1, 0, 1)
	.word 0x96440011  ! 1: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x94ac2538  ! 1: ANDNcc_I	andncc 	%r16, 0x0538, %r10
	.word 0x9b641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_1112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1112), 16, 16)) -> intp(2, 0, 1)
	.word 0x9b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
thr3_nuke_intr_1113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1113), 16, 16)) -> intp(2, 2, 1)
	.word 0x908c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x9034201e  ! 1: ORN_I	orn 	%r16, 0x001e, %r8
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
thr3_resum_intr_1114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1114), 16, 16)) -> intp(2, 3, 1)
	.word 0xac040011  ! 1: ADD_R	add 	%r16, %r17, %r22
	.word 0x92040011  ! 1: ADD_R	add 	%r16, %r17, %r9
thr3_nuke_intr_1115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1115), 16, 16)) -> intp(2, 2, 1)
	.word 0xacbc2571  ! 1: XNORcc_I	xnorcc 	%r16, 0x0571, %r22
	.word 0xb684237f  ! 1: ADDcc_I	addcc 	%r16, 0x037f, %r27
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x90042e3f  ! 1: ADD_I	add 	%r16, 0x0e3f, %r8
thr3_resum_intr_1116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1116), 16, 16)) -> intp(2, 3, 1)
	.word 0xb52c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x97343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0x8cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r6
thr3_hw_intr_1117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1117), 16, 16)) -> intp(2, 0, 1)
	.word 0x98b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r12
thr3_hw_intr_1118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1118), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9340011  ! 1: SRL_R	srl 	%r16, %r17, %r28
	.word 0x877c2401  ! 1: MOVR_I	move	%r16, 0x11, %r3
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0xaf7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r23
thr3_nuke_intr_1119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1119), 16, 16)) -> intp(1, 2, 1)
	.word 0x8f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x993c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r12
thr3_resum_intr_1120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1120), 16, 16)) -> intp(1, 3, 1)
	.word 0x92942a2b  ! 1: ORcc_I	orcc 	%r16, 0x0a2b, %r9
thr3_nuke_intr_1121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1121), 16, 16)) -> intp(1, 2, 1)
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0xa6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r19
thr3_resum_intr_1122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1122), 16, 16)) -> intp(1, 3, 1)
	.word 0xb7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x982c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r12
thr3_nuke_intr_1123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1123), 16, 16)) -> intp(1, 2, 1)
	.word 0xb52c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0x90142e11  ! 1: OR_I	or 	%r16, 0x0e11, %r8
	.word 0xb03c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0xb9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r28
thr3_resum_intr_1124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1124), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x96940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x981c0011  ! 1: XOR_R	xor 	%r16, %r17, %r12
thr3_hw_intr_1125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1125), 16, 16)) -> intp(1, 0, 1)
	.word 0xa8ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r20
thr3_hw_intr_1126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1126), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa040011  ! 1: ADD_R	add 	%r16, %r17, %r21
thr3_hw_intr_1127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1127), 16, 16)) -> intp(1, 0, 1)
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0xae440011  ! 1: ADDC_R	addc 	%r16, %r17, %r23
thr3_nuke_intr_1128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1128), 16, 16)) -> intp(0, 2, 1)
	.word 0xb21428ee  ! 1: OR_I	or 	%r16, 0x08ee, %r25
	.word 0x960c2c57  ! 1: AND_I	and 	%r16, 0x0c57, %r11
	.word 0x842c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r2
thr3_resum_intr_1129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1129), 16, 16)) -> intp(0, 3, 1)
	.word 0x84c42256  ! 1: ADDCcc_I	addccc 	%r16, 0x0256, %r2
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0x90442ed6  ! 1: ADDC_I	addc 	%r16, 0x0ed6, %r8
	.word 0xb72c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r27
thr3_nuke_intr_1130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1130), 16, 16)) -> intp(2, 2, 1)
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
thr3_resum_intr_1131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1131), 16, 16)) -> intp(2, 3, 1)
	.word 0x961424c9  ! 1: OR_I	or 	%r16, 0x04c9, %r11
	.word 0x9cac294e  ! 1: ANDNcc_I	andncc 	%r16, 0x094e, %r14
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
thr3_hw_intr_1132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1132), 16, 16)) -> intp(0, 0, 1)
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
	.word 0xb8bc2bdb  ! 1: XNORcc_I	xnorcc 	%r16, 0x0bdb, %r28
	.word 0xb17c2401  ! 1: MOVR_I	move	%r16, 0xffffffdb, %r24
thr3_hw_intr_1133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1133), 16, 16)) -> intp(1, 0, 1)
	.word 0x8cc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r6
thr3_nuke_intr_1134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1134), 16, 16)) -> intp(2, 2, 1)
	.word 0x96842936  ! 1: ADDcc_I	addcc 	%r16, 0x0936, %r11
thr3_resum_intr_1135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1135), 16, 16)) -> intp(2, 3, 1)
	.word 0x9ebc279a  ! 1: XNORcc_I	xnorcc 	%r16, 0x079a, %r15
	.word 0xaeb42fc4  ! 1: ORNcc_I	orncc 	%r16, 0x0fc4, %r23
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
thr3_nuke_intr_1136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1136), 16, 16)) -> intp(0, 2, 1)
	.word 0x889425b5  ! 1: ORcc_I	orcc 	%r16, 0x05b5, %r4
	.word 0x8c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r6
thr3_resum_intr_1137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1137), 16, 16)) -> intp(0, 3, 1)
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0x948c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r10
thr3_nuke_intr_1138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1138), 16, 16)) -> intp(2, 2, 1)
	.word 0xaf3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r23
	.word 0xb61c2499  ! 1: XOR_I	xor 	%r16, 0x0499, %r27
	.word 0x87343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0xaa3426b7  ! 1: ORN_I	orn 	%r16, 0x06b7, %r21
thr3_resum_intr_1139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1139), 16, 16)) -> intp(2, 3, 1)
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
thr3_hw_intr_1140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1140), 16, 16)) -> intp(0, 0, 1)
	.word 0x909c228d  ! 1: XORcc_I	xorcc 	%r16, 0x028d, %r8
	.word 0x822c266b  ! 1: ANDN_I	andn 	%r16, 0x066b, %r1
thr3_nuke_intr_1141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1141), 16, 16)) -> intp(1, 2, 1)
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
thr3_resum_intr_1142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1142), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0xab3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r21
	.word 0x9a1c2556  ! 1: XOR_I	xor 	%r16, 0x0556, %r13
thr3_hw_intr_1143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1143), 16, 16)) -> intp(1, 0, 1)
	.word 0x99340011  ! 1: SRL_R	srl 	%r16, %r17, %r12
	.word 0x91343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0xb0bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r24
thr3_nuke_intr_1144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1144), 16, 16)) -> intp(1, 2, 1)
	.word 0xb9641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9c042fd5  ! 1: ADD_I	add 	%r16, 0x0fd5, %r14
thr3_resum_intr_1145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1145), 16, 16)) -> intp(1, 3, 1)
	.word 0x99643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_1146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1146), 16, 16)) -> intp(2, 2, 1)
	.word 0x82842982  ! 1: ADDcc_I	addcc 	%r16, 0x0982, %r1
thr3_resum_intr_1147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1147), 16, 16)) -> intp(2, 3, 1)
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x84ac2c63  ! 1: ANDNcc_I	andncc 	%r16, 0x0c63, %r2
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
	.word 0xaeac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r23
thr3_hw_intr_1148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1148), 16, 16)) -> intp(0, 0, 1)
	.word 0xae340011  ! 1: ORN_R	orn 	%r16, %r17, %r23
thr3_hw_intr_1149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1149), 16, 16)) -> intp(0, 0, 1)
	.word 0x94042eb0  ! 1: ADD_I	add 	%r16, 0x0eb0, %r10
	.word 0x8c9c232f  ! 1: XORcc_I	xorcc 	%r16, 0x032f, %r6
thr3_hw_intr_1150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1150), 16, 16)) -> intp(0, 0, 1)
	.word 0xa69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r19
thr3_nuke_intr_1151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1151), 16, 16)) -> intp(1, 2, 1)
	.word 0x8abc29c2  ! 1: XNORcc_I	xnorcc 	%r16, 0x09c2, %r5
thr3_resum_intr_1152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1152), 16, 16)) -> intp(1, 3, 1)
	.word 0x9cbc270e  ! 1: XNORcc_I	xnorcc 	%r16, 0x070e, %r14
	.word 0x9c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r14
thr3_hw_intr_1153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1153), 16, 16)) -> intp(0, 0, 1)
	.word 0xbac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r29
thr3_hw_intr_1154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1154), 16, 16)) -> intp(0, 0, 1)
	.word 0x9aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
thr3_nuke_intr_1155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1155), 16, 16)) -> intp(2, 2, 1)
	.word 0xb62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
	.word 0x92040011  ! 1: ADD_R	add 	%r16, %r17, %r9
	.word 0x8eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r7
thr3_resum_intr_1156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1156), 16, 16)) -> intp(2, 3, 1)
	.word 0x848c28af  ! 1: ANDcc_I	andcc 	%r16, 0x08af, %r2
	.word 0xb89421ef  ! 1: ORcc_I	orcc 	%r16, 0x01ef, %r28
thr3_hw_intr_1157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1157), 16, 16)) -> intp(1, 0, 1)
	.word 0x96842628  ! 1: ADDcc_I	addcc 	%r16, 0x0628, %r11
	.word 0xb8bc2eae  ! 1: XNORcc_I	xnorcc 	%r16, 0x0eae, %r28
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
thr3_nuke_intr_1158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1158), 16, 16)) -> intp(0, 2, 1)
	.word 0x96bc22d1  ! 1: XNORcc_I	xnorcc 	%r16, 0x02d1, %r11
	.word 0x98ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xba0426d0  ! 1: ADD_I	add 	%r16, 0x06d0, %r29
thr3_resum_intr_1159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1159), 16, 16)) -> intp(0, 3, 1)
	.word 0x9c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r14
thr3_nuke_intr_1160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1160), 16, 16)) -> intp(2, 2, 1)
	.word 0x9b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0xa82c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r20
	.word 0x949c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r10
thr3_resum_intr_1161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1161), 16, 16)) -> intp(2, 3, 1)
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
thr3_nuke_intr_1162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1162), 16, 16)) -> intp(1, 2, 1)
	.word 0x832c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0xa77c0411  ! 1: MOVR_R	move	%r16, %r17, %r19
thr3_resum_intr_1163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1163), 16, 16)) -> intp(1, 3, 1)
	.word 0x8a142fac  ! 1: OR_I	or 	%r16, 0x0fac, %r5
	.word 0x82440011  ! 1: ADDC_R	addc 	%r16, %r17, %r1
thr3_nuke_intr_1164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1164), 16, 16)) -> intp(1, 2, 1)
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x848c2648  ! 1: ANDcc_I	andcc 	%r16, 0x0648, %r2
thr3_resum_intr_1165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1165), 16, 16)) -> intp(1, 3, 1)
	.word 0x86ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r3
thr3_nuke_intr_1166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1166), 16, 16)) -> intp(1, 2, 1)
	.word 0xba940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x94942938  ! 1: ORcc_I	orcc 	%r16, 0x0938, %r10
thr3_resum_intr_1167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1167), 16, 16)) -> intp(1, 3, 1)
	.word 0x833c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r1
thr3_hw_intr_1168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1168), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r29
thr3_nuke_intr_1169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1169), 16, 16)) -> intp(0, 2, 1)
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
	.word 0x94c42824  ! 1: ADDCcc_I	addccc 	%r16, 0x0824, %r10
thr3_resum_intr_1170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1170), 16, 16)) -> intp(0, 3, 1)
	.word 0x82340011  ! 1: ORN_R	orn 	%r16, %r17, %r1
	.word 0xb42c2af9  ! 1: ANDN_I	andn 	%r16, 0x0af9, %r26
	.word 0xb8bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0xb93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r28
thr3_nuke_intr_1171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1171), 16, 16)) -> intp(0, 2, 1)
	.word 0xb93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r28
thr3_resum_intr_1172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1172), 16, 16)) -> intp(0, 3, 1)
	.word 0x9a3c2475  ! 1: XNOR_I	xnor 	%r16, 0x0475, %r13
	.word 0xb28c2d53  ! 1: ANDcc_I	andcc 	%r16, 0x0d53, %r25
	.word 0x9e9c2b3c  ! 1: XORcc_I	xorcc 	%r16, 0x0b3c, %r15
	.word 0x8c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r6
thr3_nuke_intr_1173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1173), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e0c204d  ! 1: AND_I	and 	%r16, 0x004d, %r15
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
thr3_resum_intr_1174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1174), 16, 16)) -> intp(1, 3, 1)
	.word 0xb80c0011  ! 1: AND_R	and 	%r16, %r17, %r28
	.word 0xb0040011  ! 1: ADD_R	add 	%r16, %r17, %r24
	.word 0xb4bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0x8b7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r5
thr3_nuke_intr_1175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1175), 16, 16)) -> intp(2, 2, 1)
	.word 0x8abc2781  ! 1: XNORcc_I	xnorcc 	%r16, 0x0781, %r5
thr3_resum_intr_1176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1176), 16, 16)) -> intp(2, 3, 1)
	.word 0xb49c2baf  ! 1: XORcc_I	xorcc 	%r16, 0x0baf, %r26
thr3_hw_intr_1177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1177), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e94213c  ! 1: ORcc_I	orcc 	%r16, 0x013c, %r7
thr3_hw_intr_1178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1178), 16, 16)) -> intp(0, 0, 1)
	.word 0x981c2a5b  ! 1: XOR_I	xor 	%r16, 0x0a5b, %r12
	.word 0x86342a21  ! 1: ORN_I	orn 	%r16, 0x0a21, %r3
	.word 0x9f7c2401  ! 1: MOVR_I	move	%r16, 0xfffffe21, %r15
thr3_nuke_intr_1179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1179), 16, 16)) -> intp(0, 2, 1)
	.word 0x90c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r8
thr3_resum_intr_1180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1180), 16, 16)) -> intp(0, 3, 1)
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
	.word 0xa80c2335  ! 1: AND_I	and 	%r16, 0x0335, %r20
	.word 0xaa14280c  ! 1: OR_I	or 	%r16, 0x080c, %r21
	.word 0x90142139  ! 1: OR_I	or 	%r16, 0x0139, %r8
thr3_hw_intr_1181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1181), 16, 16)) -> intp(1, 0, 1)
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0xb33c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0x849c2e6e  ! 1: XORcc_I	xorcc 	%r16, 0x0e6e, %r2
thr3_nuke_intr_1182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1182), 16, 16)) -> intp(0, 2, 1)
	.word 0xbab42d2e  ! 1: ORNcc_I	orncc 	%r16, 0x0d2e, %r29
	.word 0xa6ac2d60  ! 1: ANDNcc_I	andncc 	%r16, 0x0d60, %r19
	.word 0x9c0c0011  ! 1: AND_R	and 	%r16, %r17, %r14
	.word 0xab3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r21
thr3_resum_intr_1183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1183), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
thr3_nuke_intr_1184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1184), 16, 16)) -> intp(0, 2, 1)
	.word 0xa6c42efa  ! 1: ADDCcc_I	addccc 	%r16, 0x0efa, %r19
thr3_resum_intr_1185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1185), 16, 16)) -> intp(0, 3, 1)
	.word 0xaf343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0x84ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0xb2940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
thr3_nuke_intr_1186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1186), 16, 16)) -> intp(0, 2, 1)
	.word 0x93343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0xb09c2e10  ! 1: XORcc_I	xorcc 	%r16, 0x0e10, %r24
	.word 0x86c420da  ! 1: ADDCcc_I	addccc 	%r16, 0x00da, %r3
thr3_resum_intr_1187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1187), 16, 16)) -> intp(0, 3, 1)
	.word 0x87341011  ! 1: SRLX_R	srlx	%r16, %r17, %r3
	.word 0xaeac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
thr3_nuke_intr_1188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1188), 16, 16)) -> intp(0, 2, 1)
	.word 0x8eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0xa9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r20
	.word 0x942c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x89343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r4
thr3_resum_intr_1189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1189), 16, 16)) -> intp(0, 3, 1)
	.word 0xba94207b  ! 1: ORcc_I	orcc 	%r16, 0x007b, %r29
	.word 0xb8042905  ! 1: ADD_I	add 	%r16, 0x0905, %r28
	.word 0xb7340011  ! 1: SRL_R	srl 	%r16, %r17, %r27
	.word 0x8b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r5
thr3_nuke_intr_1190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1190), 16, 16)) -> intp(1, 2, 1)
	.word 0xa93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x84ac2e2e  ! 1: ANDNcc_I	andncc 	%r16, 0x0e2e, %r2
	.word 0x8b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x893c1011  ! 1: SRAX_R	srax	%r16, %r17, %r4
thr3_resum_intr_1191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1191), 16, 16)) -> intp(1, 3, 1)
	.word 0x9c9c2225  ! 1: XORcc_I	xorcc 	%r16, 0x0225, %r14
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x9b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r13
thr3_hw_intr_1192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1192), 16, 16)) -> intp(1, 0, 1)
	.word 0xacac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0x8b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r5
thr3_hw_intr_1193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1193), 16, 16)) -> intp(0, 0, 1)
	.word 0x90940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r8
thr3_nuke_intr_1194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1194), 16, 16)) -> intp(1, 2, 1)
	.word 0x96bc2ad3  ! 1: XNORcc_I	xnorcc 	%r16, 0x0ad3, %r11
	.word 0x86040011  ! 1: ADD_R	add 	%r16, %r17, %r3
	.word 0xae440011  ! 1: ADDC_R	addc 	%r16, %r17, %r23
	.word 0xacc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r22
thr3_resum_intr_1195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1195), 16, 16)) -> intp(1, 3, 1)
	.word 0xb6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0x932c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r9
thr3_hw_intr_1196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1196), 16, 16)) -> intp(0, 0, 1)
	.word 0xb92c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r28
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
thr3_hw_intr_1197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1197), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x8a140011  ! 1: OR_R	or 	%r16, %r17, %r5
thr3_hw_intr_1198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1198), 16, 16)) -> intp(2, 0, 1)
	.word 0x90342d1b  ! 1: ORN_I	orn 	%r16, 0x0d1b, %r8
thr3_hw_intr_1199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1199), 16, 16)) -> intp(2, 0, 1)
	.word 0xac9422ba  ! 1: ORcc_I	orcc 	%r16, 0x02ba, %r22
	.word 0xab2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0xb48c2f34  ! 1: ANDcc_I	andcc 	%r16, 0x0f34, %r26
	.word 0xb0940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r24
thr3_nuke_intr_1200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1200), 16, 16)) -> intp(2, 2, 1)
	.word 0x8e442bb8  ! 1: ADDC_I	addc 	%r16, 0x0bb8, %r7
thr3_resum_intr_1201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1201), 16, 16)) -> intp(2, 3, 1)
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
	.word 0xa81c2756  ! 1: XOR_I	xor 	%r16, 0x0756, %r20
thr3_nuke_intr_1202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1202), 16, 16)) -> intp(2, 2, 1)
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
thr3_resum_intr_1203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1203), 16, 16)) -> intp(2, 3, 1)
	.word 0x86ac22a7  ! 1: ANDNcc_I	andncc 	%r16, 0x02a7, %r3
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x903c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x932c0011  ! 1: SLL_R	sll 	%r16, %r17, %r9
thr3_hw_intr_1204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1204), 16, 16)) -> intp(2, 0, 1)
	.word 0x86ac22d4  ! 1: ANDNcc_I	andncc 	%r16, 0x02d4, %r3
	.word 0xa9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r20
	.word 0xb93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r28
thr3_hw_intr_1205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1205), 16, 16)) -> intp(2, 0, 1)
	.word 0x883420c1  ! 1: ORN_I	orn 	%r16, 0x00c1, %r4
thr3_nuke_intr_1206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1206), 16, 16)) -> intp(2, 2, 1)
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
thr3_resum_intr_1207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1207), 16, 16)) -> intp(2, 3, 1)
	.word 0xaa9c29c9  ! 1: XORcc_I	xorcc 	%r16, 0x09c9, %r21
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
	.word 0x88ac235d  ! 1: ANDNcc_I	andncc 	%r16, 0x035d, %r4
thr3_hw_intr_1208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1208), 16, 16)) -> intp(0, 0, 1)
	.word 0x873c0011  ! 1: SRA_R	sra 	%r16, %r17, %r3
	.word 0xb7641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_1209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1209), 16, 16)) -> intp(1, 2, 1)
	.word 0x8ac42a05  ! 1: ADDCcc_I	addccc 	%r16, 0x0a05, %r5
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
thr3_resum_intr_1210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1210), 16, 16)) -> intp(1, 3, 1)
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
thr3_hw_intr_1211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1211), 16, 16)) -> intp(0, 0, 1)
	.word 0xbaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r29
	.word 0x843c2ef3  ! 1: XNOR_I	xnor 	%r16, 0x0ef3, %r2
	.word 0x90140011  ! 1: OR_R	or 	%r16, %r17, %r8
thr3_nuke_intr_1212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1212), 16, 16)) -> intp(0, 2, 1)
	.word 0x862c2b88  ! 1: ANDN_I	andn 	%r16, 0x0b88, %r3
thr3_resum_intr_1213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1213), 16, 16)) -> intp(0, 3, 1)
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xae0c0011  ! 1: AND_R	and 	%r16, %r17, %r23
	.word 0x86bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r3
thr3_nuke_intr_1214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1214), 16, 16)) -> intp(0, 2, 1)
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
thr3_resum_intr_1215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1215), 16, 16)) -> intp(0, 3, 1)
	.word 0x872c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r3
thr3_nuke_intr_1216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1216), 16, 16)) -> intp(0, 2, 1)
	.word 0xb8940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r28
	.word 0x88342437  ! 1: ORN_I	orn 	%r16, 0x0437, %r4
	.word 0x908c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r8
thr3_resum_intr_1217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1217), 16, 16)) -> intp(0, 3, 1)
	.word 0xa97c0411  ! 1: MOVR_R	move	%r16, %r17, %r20
	.word 0xaab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0x8b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r5
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
thr3_nuke_intr_1218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1218), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r15
thr3_resum_intr_1219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1219), 16, 16)) -> intp(1, 3, 1)
	.word 0xb8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r28
	.word 0x9b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0xb53c0011  ! 1: SRA_R	sra 	%r16, %r17, %r26
	.word 0x877c0411  ! 1: MOVR_R	move	%r16, %r17, %r3
thr3_hw_intr_1220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1220), 16, 16)) -> intp(2, 0, 1)
	.word 0xa68c29b9  ! 1: ANDcc_I	andcc 	%r16, 0x09b9, %r19
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
thr3_hw_intr_1221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1221), 16, 16)) -> intp(0, 0, 1)
	.word 0x863c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0x842c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
thr3_hw_intr_1222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1222), 16, 16)) -> intp(1, 0, 1)
	.word 0xaebc2bf0  ! 1: XNORcc_I	xnorcc 	%r16, 0x0bf0, %r23
thr3_hw_intr_1223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1223), 16, 16)) -> intp(1, 0, 1)
	.word 0x8a3c23e3  ! 1: XNOR_I	xnor 	%r16, 0x03e3, %r5
	.word 0xae0c0011  ! 1: AND_R	and 	%r16, %r17, %r23
thr3_nuke_intr_1224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1224), 16, 16)) -> intp(1, 2, 1)
	.word 0xba940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x903c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
thr3_resum_intr_1225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1225), 16, 16)) -> intp(1, 3, 1)
	.word 0x968c2ab2  ! 1: ANDcc_I	andcc 	%r16, 0x0ab2, %r11
thr3_nuke_intr_1226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1226), 16, 16)) -> intp(2, 2, 1)
	.word 0x9f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x828c257a  ! 1: ANDcc_I	andcc 	%r16, 0x057a, %r1
	.word 0x9d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r14
	.word 0xb4940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r26
thr3_resum_intr_1227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1227), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a340011  ! 1: ORN_R	orn 	%r16, %r17, %r5
	.word 0xb52c0011  ! 1: SLL_R	sll 	%r16, %r17, %r26
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x8e1420d1  ! 1: OR_I	or 	%r16, 0x00d1, %r7
thr3_hw_intr_1228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1228), 16, 16)) -> intp(1, 0, 1)
	.word 0x823c2a24  ! 1: XNOR_I	xnor 	%r16, 0x0a24, %r1
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
	.word 0xbaac2261  ! 1: ANDNcc_I	andncc 	%r16, 0x0261, %r29
thr3_nuke_intr_1229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1229), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c8c2635  ! 1: ANDcc_I	andcc 	%r16, 0x0635, %r6
	.word 0xa8140011  ! 1: OR_R	or 	%r16, %r17, %r20
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
thr3_resum_intr_1230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1230), 16, 16)) -> intp(2, 3, 1)
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x8b7c0411  ! 1: MOVR_R	move	%r16, %r17, %r5
	.word 0xb6840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0x9a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r13
thr3_hw_intr_1231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1231), 16, 16)) -> intp(1, 0, 1)
	.word 0xad343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r22
thr3_nuke_intr_1232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1232), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a042ea9  ! 1: ADD_I	add 	%r16, 0x0ea9, %r13
thr3_resum_intr_1233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1233), 16, 16)) -> intp(2, 3, 1)
	.word 0x863c2f65  ! 1: XNOR_I	xnor 	%r16, 0x0f65, %r3
	.word 0xa69428c4  ! 1: ORcc_I	orcc 	%r16, 0x08c4, %r19
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
thr3_hw_intr_1234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1234), 16, 16)) -> intp(1, 0, 1)
	.word 0xaac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
thr3_hw_intr_1235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1235), 16, 16)) -> intp(0, 0, 1)
	.word 0xba9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r29
thr3_hw_intr_1236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1236), 16, 16)) -> intp(2, 0, 1)
	.word 0xa6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0xaf340011  ! 1: SRL_R	srl 	%r16, %r17, %r23
thr3_hw_intr_1237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1237), 16, 16)) -> intp(0, 0, 1)
	.word 0x880c0011  ! 1: AND_R	and 	%r16, %r17, %r4
thr3_hw_intr_1238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1238), 16, 16)) -> intp(0, 0, 1)
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x997c2401  ! 1: MOVR_I	move	%r16, 0x11, %r12
thr3_nuke_intr_1239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1239), 16, 16)) -> intp(2, 2, 1)
	.word 0x87343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x857c0411  ! 1: MOVR_R	move	%r16, %r17, %r2
	.word 0xb2bc27a5  ! 1: XNORcc_I	xnorcc 	%r16, 0x07a5, %r25
thr3_resum_intr_1240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1240), 16, 16)) -> intp(2, 3, 1)
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
thr3_nuke_intr_1241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1241), 16, 16)) -> intp(1, 2, 1)
	.word 0x98842ca5  ! 1: ADDcc_I	addcc 	%r16, 0x0ca5, %r12
thr3_resum_intr_1242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1242), 16, 16)) -> intp(1, 3, 1)
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
thr3_nuke_intr_1243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1243), 16, 16)) -> intp(2, 2, 1)
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
	.word 0xaf7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r23
thr3_resum_intr_1244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1244), 16, 16)) -> intp(2, 3, 1)
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
thr3_nuke_intr_1245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1245), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
thr3_resum_intr_1246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1246), 16, 16)) -> intp(0, 3, 1)
	.word 0xb61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r27
	.word 0x828c2223  ! 1: ANDcc_I	andcc 	%r16, 0x0223, %r1
thr3_hw_intr_1247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1247), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c442bd2  ! 1: ADDC_I	addc 	%r16, 0x0bd2, %r14
	.word 0x840c0011  ! 1: AND_R	and 	%r16, %r17, %r2
	.word 0xac8c2671  ! 1: ANDcc_I	andcc 	%r16, 0x0671, %r22
	.word 0xb8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r28
thr3_nuke_intr_1248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1248), 16, 16)) -> intp(2, 2, 1)
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x92c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r9
thr3_resum_intr_1249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1249), 16, 16)) -> intp(2, 3, 1)
	.word 0x9a0425ec  ! 1: ADD_I	add 	%r16, 0x05ec, %r13
	.word 0x9f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r15
	.word 0xae340011  ! 1: ORN_R	orn 	%r16, %r17, %r23
	.word 0x9c142567  ! 1: OR_I	or 	%r16, 0x0567, %r14
thr3_nuke_intr_1250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1250), 16, 16)) -> intp(2, 2, 1)
	.word 0x877c2401  ! 1: MOVR_I	move	%r16, 0x567, %r3
	.word 0x908c219d  ! 1: ANDcc_I	andcc 	%r16, 0x019d, %r8
	.word 0x98042672  ! 1: ADD_I	add 	%r16, 0x0672, %r12
thr3_resum_intr_1251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1251), 16, 16)) -> intp(2, 3, 1)
	.word 0x9c9c2b95  ! 1: XORcc_I	xorcc 	%r16, 0x0b95, %r14
	.word 0xa84420cd  ! 1: ADDC_I	addc 	%r16, 0x00cd, %r20
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
thr3_nuke_intr_1252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1252), 16, 16)) -> intp(0, 2, 1)
	.word 0x8c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xa8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r20
thr3_resum_intr_1253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1253), 16, 16)) -> intp(0, 3, 1)
	.word 0xb63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r27
thr3_hw_intr_1254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1254), 16, 16)) -> intp(2, 0, 1)
	.word 0x833c1011  ! 1: SRAX_R	srax	%r16, %r17, %r1
	.word 0x9e942a8d  ! 1: ORcc_I	orcc 	%r16, 0x0a8d, %r15
	.word 0x8e142289  ! 1: OR_I	or 	%r16, 0x0289, %r7
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
thr3_hw_intr_1255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1255), 16, 16)) -> intp(0, 0, 1)
	.word 0xb68c20f0  ! 1: ANDcc_I	andcc 	%r16, 0x00f0, %r27
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
	.word 0x9cbc2b8a  ! 1: XNORcc_I	xnorcc 	%r16, 0x0b8a, %r14
	.word 0x888429c8  ! 1: ADDcc_I	addcc 	%r16, 0x09c8, %r4
thr3_nuke_intr_1256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1256), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
	.word 0x96042d0e  ! 1: ADD_I	add 	%r16, 0x0d0e, %r11
thr3_resum_intr_1257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1257), 16, 16)) -> intp(0, 3, 1)
	.word 0x9f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xa8b428a6  ! 1: ORNcc_I	orncc 	%r16, 0x08a6, %r20
	.word 0x922c2d2f  ! 1: ANDN_I	andn 	%r16, 0x0d2f, %r9
thr3_nuke_intr_1258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1258), 16, 16)) -> intp(0, 2, 1)
	.word 0x86142619  ! 1: OR_I	or 	%r16, 0x0619, %r3
	.word 0xaa9c2508  ! 1: XORcc_I	xorcc 	%r16, 0x0508, %r21
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xae3423c1  ! 1: ORN_I	orn 	%r16, 0x03c1, %r23
thr3_resum_intr_1259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1259), 16, 16)) -> intp(0, 3, 1)
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
	.word 0xb5343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r26
thr3_nuke_intr_1260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1260), 16, 16)) -> intp(0, 2, 1)
	.word 0x837c2401  ! 1: MOVR_I	move	%r16, 0x1, %r1
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0x8e142086  ! 1: OR_I	or 	%r16, 0x0086, %r7
thr3_resum_intr_1261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1261), 16, 16)) -> intp(0, 3, 1)
	.word 0xacb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
	.word 0x820c2b8b  ! 1: AND_I	and 	%r16, 0x0b8b, %r1
thr3_hw_intr_1262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1262), 16, 16)) -> intp(0, 0, 1)
	.word 0x88442039  ! 1: ADDC_I	addc 	%r16, 0x0039, %r4
	.word 0xab2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r21
	.word 0x823c2d1e  ! 1: XNOR_I	xnor 	%r16, 0x0d1e, %r1
	.word 0xb73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r27
thr3_nuke_intr_1263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1263), 16, 16)) -> intp(1, 2, 1)
	.word 0xaeb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r23
	.word 0xae1c22c9  ! 1: XOR_I	xor 	%r16, 0x02c9, %r23
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x9eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r15
thr3_resum_intr_1264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1264), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c040011  ! 1: ADD_R	add 	%r16, %r17, %r6
	.word 0xb23c2e87  ! 1: XNOR_I	xnor 	%r16, 0x0e87, %r25
	.word 0x8a2c2555  ! 1: ANDN_I	andn 	%r16, 0x0555, %r5
	.word 0xb88c205c  ! 1: ANDcc_I	andcc 	%r16, 0x005c, %r28
thr3_nuke_intr_1265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1265), 16, 16)) -> intp(2, 2, 1)
	.word 0x862c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r3
thr3_resum_intr_1266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1266), 16, 16)) -> intp(2, 3, 1)
	.word 0x98142a01  ! 1: OR_I	or 	%r16, 0x0a01, %r12
	.word 0x820c2778  ! 1: AND_I	and 	%r16, 0x0778, %r1
thr3_hw_intr_1267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1267), 16, 16)) -> intp(2, 0, 1)
	.word 0xaf343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
	.word 0x84442d49  ! 1: ADDC_I	addc 	%r16, 0x0d49, %r2
thr3_nuke_intr_1268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1268), 16, 16)) -> intp(1, 2, 1)
	.word 0x88bc26e6  ! 1: XNORcc_I	xnorcc 	%r16, 0x06e6, %r4
	.word 0xb0ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0x9d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xba940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r29
thr3_resum_intr_1269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1269), 16, 16)) -> intp(1, 3, 1)
	.word 0x912c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x820c0011  ! 1: AND_R	and 	%r16, %r17, %r1
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
thr3_nuke_intr_1270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1270), 16, 16)) -> intp(0, 2, 1)
	.word 0x8b643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xaa942f6a  ! 1: ORcc_I	orcc 	%r16, 0x0f6a, %r21
	.word 0x963c228d  ! 1: XNOR_I	xnor 	%r16, 0x028d, %r11
thr3_resum_intr_1271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1271), 16, 16)) -> intp(0, 3, 1)
	.word 0x933c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r9
thr3_hw_intr_1272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1272), 16, 16)) -> intp(2, 0, 1)
	.word 0xb52c0011  ! 1: SLL_R	sll 	%r16, %r17, %r26
thr3_nuke_intr_1273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1273), 16, 16)) -> intp(2, 2, 1)
	.word 0x86bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0xac440011  ! 1: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x96c4205b  ! 1: ADDCcc_I	addccc 	%r16, 0x005b, %r11
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
thr3_resum_intr_1274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1274), 16, 16)) -> intp(2, 3, 1)
	.word 0x82c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
thr3_hw_intr_1275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1275), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa0c230f  ! 1: AND_I	and 	%r16, 0x030f, %r21
	.word 0x92bc2993  ! 1: XNORcc_I	xnorcc 	%r16, 0x0993, %r9
	.word 0x8d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
thr3_hw_intr_1276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1276), 16, 16)) -> intp(2, 0, 1)
	.word 0xb4ac2151  ! 1: ANDNcc_I	andncc 	%r16, 0x0151, %r26
thr3_hw_intr_1277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1277), 16, 16)) -> intp(2, 0, 1)
	.word 0x91343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0x88342725  ! 1: ORN_I	orn 	%r16, 0x0725, %r4
	.word 0x8eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r7
thr3_nuke_intr_1278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1278), 16, 16)) -> intp(0, 2, 1)
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x86bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x9d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r14
thr3_resum_intr_1279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1279), 16, 16)) -> intp(0, 3, 1)
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
	.word 0x89643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_1280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1280), 16, 16)) -> intp(1, 0, 1)
	.word 0x90ac2a1c  ! 1: ANDNcc_I	andncc 	%r16, 0x0a1c, %r8
	.word 0x9c342d4c  ! 1: ORN_I	orn 	%r16, 0x0d4c, %r14
	.word 0x923c2d61  ! 1: XNOR_I	xnor 	%r16, 0x0d61, %r9
	.word 0xb60c0011  ! 1: AND_R	and 	%r16, %r17, %r27
thr3_nuke_intr_1281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1281), 16, 16)) -> intp(0, 2, 1)
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
thr3_resum_intr_1282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1282), 16, 16)) -> intp(0, 3, 1)
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
	.word 0x952c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r10
thr3_nuke_intr_1283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1283), 16, 16)) -> intp(2, 2, 1)
	.word 0x877c2401  ! 1: MOVR_I	move	%r16, 0x1, %r3
	.word 0x8f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0xbac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r29
thr3_resum_intr_1284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1284), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
thr3_nuke_intr_1285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1285), 16, 16)) -> intp(1, 2, 1)
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0x1, %r7
	.word 0xab2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
thr3_resum_intr_1286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1286), 16, 16)) -> intp(1, 3, 1)
	.word 0xac140011  ! 1: OR_R	or 	%r16, %r17, %r22
	.word 0xa63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r19
thr3_nuke_intr_1287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1287), 16, 16)) -> intp(2, 2, 1)
	.word 0x993c1011  ! 1: SRAX_R	srax	%r16, %r17, %r12
	.word 0x920c2618  ! 1: AND_I	and 	%r16, 0x0618, %r9
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
thr3_resum_intr_1288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1288), 16, 16)) -> intp(2, 3, 1)
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0xb48c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0x9cc42dfa  ! 1: ADDCcc_I	addccc 	%r16, 0x0dfa, %r14
	.word 0x872c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r3
thr3_nuke_intr_1289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1289), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6bc2f08  ! 1: XNORcc_I	xnorcc 	%r16, 0x0f08, %r27
	.word 0x892c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0xa8140011  ! 1: OR_R	or 	%r16, %r17, %r20
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
thr3_resum_intr_1290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1290), 16, 16)) -> intp(0, 3, 1)
	.word 0x917c0411  ! 1: MOVR_R	move	%r16, %r17, %r8
	.word 0x943c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r10
thr3_nuke_intr_1291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1291), 16, 16)) -> intp(2, 2, 1)
	.word 0x872c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r3
thr3_resum_intr_1292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1292), 16, 16)) -> intp(2, 3, 1)
	.word 0xb33c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0x9aac26d5  ! 1: ANDNcc_I	andncc 	%r16, 0x06d5, %r13
	.word 0x862c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r3
thr3_hw_intr_1293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1293), 16, 16)) -> intp(0, 0, 1)
	.word 0xac8420da  ! 1: ADDcc_I	addcc 	%r16, 0x00da, %r22
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0xb12c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r24
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
thr3_hw_intr_1294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1294), 16, 16)) -> intp(2, 0, 1)
	.word 0x8c1c2c31  ! 1: XOR_I	xor 	%r16, 0x0c31, %r6
	.word 0xa7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
thr3_hw_intr_1295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1295), 16, 16)) -> intp(0, 0, 1)
	.word 0x9cc42b72  ! 1: ADDCcc_I	addccc 	%r16, 0x0b72, %r14
thr3_nuke_intr_1296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1296), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
	.word 0x9c0c2e36  ! 1: AND_I	and 	%r16, 0x0e36, %r14
thr3_resum_intr_1297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1297), 16, 16)) -> intp(2, 3, 1)
	.word 0xba0c2d78  ! 1: AND_I	and 	%r16, 0x0d78, %r29
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
thr3_nuke_intr_1298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1298), 16, 16)) -> intp(1, 2, 1)
	.word 0xa81c2c69  ! 1: XOR_I	xor 	%r16, 0x0c69, %r20
thr3_resum_intr_1299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1299), 16, 16)) -> intp(1, 3, 1)
	.word 0xbb3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r29
	.word 0x8d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0xb33c1011  ! 1: SRAX_R	srax	%r16, %r17, %r25
	.word 0xaa0c29a1  ! 1: AND_I	and 	%r16, 0x09a1, %r21
thr3_hw_intr_1300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1300), 16, 16)) -> intp(0, 0, 1)
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
thr3_nuke_intr_1301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1301), 16, 16)) -> intp(2, 2, 1)
	.word 0x9f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r15
thr3_resum_intr_1302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1302), 16, 16)) -> intp(2, 3, 1)
	.word 0x87342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0x9c2c2a6d  ! 1: ANDN_I	andn 	%r16, 0x0a6d, %r14
thr3_hw_intr_1303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1303), 16, 16)) -> intp(2, 0, 1)
	.word 0x8f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r7
thr3_hw_intr_1304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1304), 16, 16)) -> intp(1, 0, 1)
	.word 0x86842f09  ! 1: ADDcc_I	addcc 	%r16, 0x0f09, %r3
	.word 0xa9342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
thr3_nuke_intr_1305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1305), 16, 16)) -> intp(0, 2, 1)
	.word 0x8ec42989  ! 1: ADDCcc_I	addccc 	%r16, 0x0989, %r7
	.word 0xb8c427dc  ! 1: ADDCcc_I	addccc 	%r16, 0x07dc, %r28
	.word 0x941c0011  ! 1: XOR_R	xor 	%r16, %r17, %r10
thr3_resum_intr_1306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1306), 16, 16)) -> intp(0, 3, 1)
	.word 0x8a94288a  ! 1: ORcc_I	orcc 	%r16, 0x088a, %r5
	.word 0xa6342f5b  ! 1: ORN_I	orn 	%r16, 0x0f5b, %r19
	.word 0x93641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_1307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1307), 16, 16)) -> intp(0, 2, 1)
	.word 0x98b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0xb1641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r15
	.word 0xaec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r23
thr3_resum_intr_1308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1308), 16, 16)) -> intp(0, 3, 1)
	.word 0xa7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r19
	.word 0x9b7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r13
	.word 0xa92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r20
thr3_nuke_intr_1309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1309), 16, 16)) -> intp(0, 2, 1)
	.word 0x8cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
thr3_resum_intr_1310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1310), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa842cf8  ! 1: ADDcc_I	addcc 	%r16, 0x0cf8, %r21
thr3_nuke_intr_1311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1311), 16, 16)) -> intp(1, 2, 1)
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x98442ce3  ! 1: ADDC_I	addc 	%r16, 0x0ce3, %r12
thr3_resum_intr_1312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1312), 16, 16)) -> intp(1, 3, 1)
	.word 0x963c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r11
thr3_nuke_intr_1313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1313), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6b42058  ! 1: ORNcc_I	orncc 	%r16, 0x0058, %r27
	.word 0xa60c2ffb  ! 1: AND_I	and 	%r16, 0x0ffb, %r19
	.word 0x9c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r14
thr3_resum_intr_1314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1314), 16, 16)) -> intp(1, 3, 1)
	.word 0x88942899  ! 1: ORcc_I	orcc 	%r16, 0x0899, %r4
thr3_hw_intr_1315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1315), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xaa1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r21
	.word 0x8ac42980  ! 1: ADDCcc_I	addccc 	%r16, 0x0980, %r5
	.word 0xa9643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_1316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1316), 16, 16)) -> intp(2, 0, 1)
	.word 0x86142bbb  ! 1: OR_I	or 	%r16, 0x0bbb, %r3
thr3_nuke_intr_1317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1317), 16, 16)) -> intp(2, 2, 1)
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
	.word 0x9c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r14
	.word 0xb3340011  ! 1: SRL_R	srl 	%r16, %r17, %r25
	.word 0x872c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r3
thr3_resum_intr_1318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1318), 16, 16)) -> intp(2, 3, 1)
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
thr3_hw_intr_1319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1319), 16, 16)) -> intp(2, 0, 1)
	.word 0xa844268b  ! 1: ADDC_I	addc 	%r16, 0x068b, %r20
	.word 0xb3340011  ! 1: SRL_R	srl 	%r16, %r17, %r25
	.word 0xba342b33  ! 1: ORN_I	orn 	%r16, 0x0b33, %r29
	.word 0xac3c28b1  ! 1: XNOR_I	xnor 	%r16, 0x08b1, %r22
thr3_nuke_intr_1320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1320), 16, 16)) -> intp(0, 2, 1)
	.word 0xab3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r21
thr3_resum_intr_1321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1321), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e342027  ! 1: ORN_I	orn 	%r16, 0x0027, %r7
thr3_nuke_intr_1322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1322), 16, 16)) -> intp(1, 2, 1)
	.word 0xb97c0411  ! 1: MOVR_R	move	%r16, %r17, %r28
thr3_resum_intr_1323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1323), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c040011  ! 1: ADD_R	add 	%r16, %r17, %r6
	.word 0x8cc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x9e3c25a6  ! 1: XNOR_I	xnor 	%r16, 0x05a6, %r15
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
thr3_hw_intr_1324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1324), 16, 16)) -> intp(2, 0, 1)
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x8c0c0011  ! 1: AND_R	and 	%r16, %r17, %r6
	.word 0x8e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r7
	.word 0xb33c0011  ! 1: SRA_R	sra 	%r16, %r17, %r25
thr3_hw_intr_1325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1325), 16, 16)) -> intp(1, 0, 1)
	.word 0x869c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r3
thr3_nuke_intr_1326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1326), 16, 16)) -> intp(0, 2, 1)
	.word 0xacb427d6  ! 1: ORNcc_I	orncc 	%r16, 0x07d6, %r22
thr3_resum_intr_1327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1327), 16, 16)) -> intp(0, 3, 1)
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0x86842f46  ! 1: ADDcc_I	addcc 	%r16, 0x0f46, %r3
	.word 0x8a342ae2  ! 1: ORN_I	orn 	%r16, 0x0ae2, %r5
thr3_hw_intr_1328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1328), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a2c20bf  ! 1: ANDN_I	andn 	%r16, 0x00bf, %r13
	.word 0xa8142127  ! 1: OR_I	or 	%r16, 0x0127, %r20
	.word 0x92ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xacb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r22
thr3_nuke_intr_1329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1329), 16, 16)) -> intp(2, 2, 1)
	.word 0xb40c2eda  ! 1: AND_I	and 	%r16, 0x0eda, %r26
	.word 0x88340011  ! 1: ORN_R	orn 	%r16, %r17, %r4
thr3_resum_intr_1330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1330), 16, 16)) -> intp(2, 3, 1)
	.word 0x872c0011  ! 1: SLL_R	sll 	%r16, %r17, %r3
	.word 0x8d643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_1331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1331), 16, 16)) -> intp(0, 2, 1)
	.word 0x8cc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x8a9c2ed4  ! 1: XORcc_I	xorcc 	%r16, 0x0ed4, %r5
	.word 0x9c84211a  ! 1: ADDcc_I	addcc 	%r16, 0x011a, %r14
thr3_resum_intr_1332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1332), 16, 16)) -> intp(0, 3, 1)
	.word 0x853c1011  ! 1: SRAX_R	srax	%r16, %r17, %r2
thr3_nuke_intr_1333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1333), 16, 16)) -> intp(1, 2, 1)
	.word 0xb0bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
thr3_resum_intr_1334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1334), 16, 16)) -> intp(1, 3, 1)
	.word 0xb0b42b29  ! 1: ORNcc_I	orncc 	%r16, 0x0b29, %r24
	.word 0xba3c2919  ! 1: XNOR_I	xnor 	%r16, 0x0919, %r29
	.word 0x88040011  ! 1: ADD_R	add 	%r16, %r17, %r4
thr3_nuke_intr_1335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1335), 16, 16)) -> intp(0, 2, 1)
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0xa7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9abc2655  ! 1: XNORcc_I	xnorcc 	%r16, 0x0655, %r13
thr3_resum_intr_1336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1336), 16, 16)) -> intp(0, 3, 1)
	.word 0x9f7c2401  ! 1: MOVR_I	move	%r16, 0xfffffe55, %r15
	.word 0xb60c0011  ! 1: AND_R	and 	%r16, %r17, %r27
	.word 0x8f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r7
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
thr3_hw_intr_1337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1337), 16, 16)) -> intp(1, 0, 1)
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x9cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r14
thr3_nuke_intr_1338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1338), 16, 16)) -> intp(0, 2, 1)
	.word 0xa73c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r19
thr3_resum_intr_1339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1339), 16, 16)) -> intp(0, 3, 1)
	.word 0x964420ee  ! 1: ADDC_I	addc 	%r16, 0x00ee, %r11
thr3_hw_intr_1340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1340), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x94942134  ! 1: ORcc_I	orcc 	%r16, 0x0134, %r10
	.word 0x82842218  ! 1: ADDcc_I	addcc 	%r16, 0x0218, %r1
	.word 0xaa0c257a  ! 1: AND_I	and 	%r16, 0x057a, %r21
thr3_hw_intr_1341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1341), 16, 16)) -> intp(0, 0, 1)
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
thr3_hw_intr_1342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1342), 16, 16)) -> intp(0, 0, 1)
	.word 0xa634280d  ! 1: ORN_I	orn 	%r16, 0x080d, %r19
	.word 0x933c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r9
thr3_hw_intr_1343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1343), 16, 16)) -> intp(1, 0, 1)
	.word 0x90c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x888c25c7  ! 1: ANDcc_I	andcc 	%r16, 0x05c7, %r4
	.word 0xb8042335  ! 1: ADD_I	add 	%r16, 0x0335, %r28
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
thr3_hw_intr_1344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1344), 16, 16)) -> intp(2, 0, 1)
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
thr3_nuke_intr_1345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1345), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a8c2e20  ! 1: ANDcc_I	andcc 	%r16, 0x0e20, %r5
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0xaf643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x961c2d2c  ! 1: XOR_I	xor 	%r16, 0x0d2c, %r11
thr3_resum_intr_1346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1346), 16, 16)) -> intp(2, 3, 1)
	.word 0x91343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0x88342824  ! 1: ORN_I	orn 	%r16, 0x0824, %r4
thr3_hw_intr_1347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1347), 16, 16)) -> intp(1, 0, 1)
	.word 0x9b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r13
thr3_hw_intr_1348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1348), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x8f641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_1349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1349), 16, 16)) -> intp(0, 2, 1)
	.word 0x961c0011  ! 1: XOR_R	xor 	%r16, %r17, %r11
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
	.word 0xa89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0x863c29b5  ! 1: XNOR_I	xnor 	%r16, 0x09b5, %r3
thr3_resum_intr_1350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1350), 16, 16)) -> intp(0, 3, 1)
	.word 0x960c2005  ! 1: AND_I	and 	%r16, 0x0005, %r11
	.word 0x929c225d  ! 1: XORcc_I	xorcc 	%r16, 0x025d, %r9
	.word 0x828423bd  ! 1: ADDcc_I	addcc 	%r16, 0x03bd, %r1
thr3_hw_intr_1351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1351), 16, 16)) -> intp(1, 0, 1)
	.word 0xab3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r21
thr3_nuke_intr_1352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1352), 16, 16)) -> intp(2, 2, 1)
	.word 0xa8140011  ! 1: OR_R	or 	%r16, %r17, %r20
	.word 0x96842813  ! 1: ADDcc_I	addcc 	%r16, 0x0813, %r11
	.word 0x832c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0x903c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r8
thr3_resum_intr_1353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1353), 16, 16)) -> intp(2, 3, 1)
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0xb2440011  ! 1: ADDC_R	addc 	%r16, %r17, %r25
	.word 0xaab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0xb84422ba  ! 1: ADDC_I	addc 	%r16, 0x02ba, %r28
thr3_hw_intr_1354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1354), 16, 16)) -> intp(2, 0, 1)
	.word 0x9b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x833c0011  ! 1: SRA_R	sra 	%r16, %r17, %r1
	.word 0x90ac2c3a  ! 1: ANDNcc_I	andncc 	%r16, 0x0c3a, %r8
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
thr3_hw_intr_1355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1355), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c8c202e  ! 1: ANDcc_I	andcc 	%r16, 0x002e, %r6
thr3_hw_intr_1356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1356), 16, 16)) -> intp(0, 0, 1)
	.word 0x90b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x963c28f2  ! 1: XNOR_I	xnor 	%r16, 0x08f2, %r11
	.word 0xa8940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r20
thr3_nuke_intr_1357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1357), 16, 16)) -> intp(0, 2, 1)
	.word 0xba3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x89343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0xb0040011  ! 1: ADD_R	add 	%r16, %r17, %r24
thr3_resum_intr_1358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1358), 16, 16)) -> intp(0, 3, 1)
	.word 0x903c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0xba3429bc  ! 1: ORN_I	orn 	%r16, 0x09bc, %r29
	.word 0x844426c0  ! 1: ADDC_I	addc 	%r16, 0x06c0, %r2
	.word 0x9a8c2c40  ! 1: ANDcc_I	andcc 	%r16, 0x0c40, %r13
thr3_hw_intr_1359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1359), 16, 16)) -> intp(2, 0, 1)
	.word 0x84340011  ! 1: ORN_R	orn 	%r16, %r17, %r2
	.word 0xb6342cd8  ! 1: ORN_I	orn 	%r16, 0x0cd8, %r27
thr3_hw_intr_1360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1360), 16, 16)) -> intp(1, 0, 1)
	.word 0xb6340011  ! 1: ORN_R	orn 	%r16, %r17, %r27
	.word 0xb20c0011  ! 1: AND_R	and 	%r16, %r17, %r25
thr3_nuke_intr_1361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1361), 16, 16)) -> intp(0, 2, 1)
	.word 0x83341011  ! 1: SRLX_R	srlx	%r16, %r17, %r1
	.word 0xb6342a11  ! 1: ORN_I	orn 	%r16, 0x0a11, %r27
	.word 0xb93c0011  ! 1: SRA_R	sra 	%r16, %r17, %r28
thr3_resum_intr_1362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1362), 16, 16)) -> intp(0, 3, 1)
	.word 0x9b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r13
thr3_nuke_intr_1363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1363), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r13
	.word 0x8a0c0011  ! 1: AND_R	and 	%r16, %r17, %r5
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
thr3_resum_intr_1364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1364), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
thr3_hw_intr_1365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1365), 16, 16)) -> intp(1, 0, 1)
	.word 0xa83c2aa2  ! 1: XNOR_I	xnor 	%r16, 0x0aa2, %r20
	.word 0xb97c2401  ! 1: MOVR_I	move	%r16, 0xfffffea2, %r28
	.word 0x8c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0x9aac21d6  ! 1: ANDNcc_I	andncc 	%r16, 0x01d6, %r13
thr3_hw_intr_1366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1366), 16, 16)) -> intp(1, 0, 1)
	.word 0x82440011  ! 1: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x8c140011  ! 1: OR_R	or 	%r16, %r17, %r6
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
thr3_nuke_intr_1367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1367), 16, 16)) -> intp(2, 2, 1)
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
	.word 0x8c842c3d  ! 1: ADDcc_I	addcc 	%r16, 0x0c3d, %r6
	.word 0x8c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r6
thr3_resum_intr_1368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1368), 16, 16)) -> intp(2, 3, 1)
	.word 0x9414212e  ! 1: OR_I	or 	%r16, 0x012e, %r10
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0x89343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r4
thr3_nuke_intr_1369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1369), 16, 16)) -> intp(2, 2, 1)
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0x89342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r4
thr3_resum_intr_1370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1370), 16, 16)) -> intp(2, 3, 1)
	.word 0x82440011  ! 1: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
thr3_hw_intr_1371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1371), 16, 16)) -> intp(0, 0, 1)
	.word 0x8b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r5
thr3_hw_intr_1372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1372), 16, 16)) -> intp(2, 0, 1)
	.word 0x928c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r9
thr3_nuke_intr_1373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1373), 16, 16)) -> intp(2, 2, 1)
	.word 0xb8442569  ! 1: ADDC_I	addc 	%r16, 0x0569, %r28
	.word 0x8e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r7
thr3_resum_intr_1374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1374), 16, 16)) -> intp(2, 3, 1)
	.word 0x98342eab  ! 1: ORN_I	orn 	%r16, 0x0eab, %r12
thr3_hw_intr_1375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1375), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
thr3_nuke_intr_1376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1376), 16, 16)) -> intp(1, 2, 1)
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0xb2b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0xbb2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xab2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r21
thr3_resum_intr_1377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1377), 16, 16)) -> intp(1, 3, 1)
	.word 0x9b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r13
	.word 0x863c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0x9ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x9b340011  ! 1: SRL_R	srl 	%r16, %r17, %r13
thr3_nuke_intr_1378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1378), 16, 16)) -> intp(2, 2, 1)
	.word 0xb2342d03  ! 1: ORN_I	orn 	%r16, 0x0d03, %r25
	.word 0xb2ac2767  ! 1: ANDNcc_I	andncc 	%r16, 0x0767, %r25
thr3_resum_intr_1379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1379), 16, 16)) -> intp(2, 3, 1)
	.word 0xaeb42862  ! 1: ORNcc_I	orncc 	%r16, 0x0862, %r23
thr3_hw_intr_1380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1380), 16, 16)) -> intp(2, 0, 1)
	.word 0xb20c248c  ! 1: AND_I	and 	%r16, 0x048c, %r25
thr3_hw_intr_1381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1381), 16, 16)) -> intp(2, 0, 1)
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
thr3_nuke_intr_1382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1382), 16, 16)) -> intp(1, 2, 1)
	.word 0xb52c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r26
thr3_resum_intr_1383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1383), 16, 16)) -> intp(1, 3, 1)
	.word 0x88c42498  ! 1: ADDCcc_I	addccc 	%r16, 0x0498, %r4
	.word 0xae1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r23
thr3_hw_intr_1384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1384), 16, 16)) -> intp(0, 0, 1)
	.word 0xb09c2ed3  ! 1: XORcc_I	xorcc 	%r16, 0x0ed3, %r24
	.word 0x8d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r6
	.word 0xb92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0xb8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r28
thr3_nuke_intr_1385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1385), 16, 16)) -> intp(1, 2, 1)
	.word 0x933c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r9
thr3_resum_intr_1386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1386), 16, 16)) -> intp(1, 3, 1)
	.word 0x840c0011  ! 1: AND_R	and 	%r16, %r17, %r2
	.word 0x960c2ceb  ! 1: AND_I	and 	%r16, 0x0ceb, %r11
	.word 0x88440011  ! 1: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x903420cb  ! 1: ORN_I	orn 	%r16, 0x00cb, %r8
thr3_nuke_intr_1387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1387), 16, 16)) -> intp(1, 2, 1)
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0xb72c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r27
thr3_resum_intr_1388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1388), 16, 16)) -> intp(1, 3, 1)
	.word 0x8eb421b6  ! 1: ORNcc_I	orncc 	%r16, 0x01b6, %r7
	.word 0x8c8c2718  ! 1: ANDcc_I	andcc 	%r16, 0x0718, %r6
	.word 0xa62c25f8  ! 1: ANDN_I	andn 	%r16, 0x05f8, %r19
thr3_hw_intr_1389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1389), 16, 16)) -> intp(2, 0, 1)
	.word 0x9cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0x901c0011  ! 1: XOR_R	xor 	%r16, %r17, %r8
	.word 0x852c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0xb43c2a2f  ! 1: XNOR_I	xnor 	%r16, 0x0a2f, %r26
thr3_hw_intr_1390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1390), 16, 16)) -> intp(1, 0, 1)
	.word 0x952c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x9e14239a  ! 1: OR_I	or 	%r16, 0x039a, %r15
thr3_hw_intr_1391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1391), 16, 16)) -> intp(1, 0, 1)
	.word 0x90842b0e  ! 1: ADDcc_I	addcc 	%r16, 0x0b0e, %r8
	.word 0xba940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x937c0411  ! 1: MOVR_R	move	%r16, %r17, %r9
	.word 0x9c4424e3  ! 1: ADDC_I	addc 	%r16, 0x04e3, %r14
thr3_hw_intr_1392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1392), 16, 16)) -> intp(1, 0, 1)
	.word 0x9e4420c5  ! 1: ADDC_I	addc 	%r16, 0x00c5, %r15
	.word 0x94440011  ! 1: ADDC_R	addc 	%r16, %r17, %r10
	.word 0xa9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r20
	.word 0x8eac2011  ! 1: ANDNcc_I	andncc 	%r16, 0x0011, %r7
thr3_hw_intr_1393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1393), 16, 16)) -> intp(1, 0, 1)
	.word 0x952c0011  ! 1: SLL_R	sll 	%r16, %r17, %r10
thr3_hw_intr_1394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1394), 16, 16)) -> intp(1, 0, 1)
	.word 0xb6ac2b63  ! 1: ANDNcc_I	andncc 	%r16, 0x0b63, %r27
	.word 0xba4429aa  ! 1: ADDC_I	addc 	%r16, 0x09aa, %r29
	.word 0xad2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r22
thr3_hw_intr_1395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1395), 16, 16)) -> intp(2, 0, 1)
	.word 0x84bc24e3  ! 1: XNORcc_I	xnorcc 	%r16, 0x04e3, %r2
	.word 0xa8040011  ! 1: ADD_R	add 	%r16, %r17, %r20
thr3_hw_intr_1396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1396), 16, 16)) -> intp(2, 0, 1)
	.word 0x98342451  ! 1: ORN_I	orn 	%r16, 0x0451, %r12
thr3_hw_intr_1397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1397), 16, 16)) -> intp(1, 0, 1)
	.word 0x928c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r9
thr3_nuke_intr_1398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1398), 16, 16)) -> intp(1, 2, 1)
	.word 0x90340011  ! 1: ORN_R	orn 	%r16, %r17, %r8
	.word 0x9b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r13
thr3_resum_intr_1399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1399), 16, 16)) -> intp(1, 3, 1)
	.word 0x8cac267b  ! 1: ANDNcc_I	andncc 	%r16, 0x067b, %r6
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
thr3_hw_intr_1400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1400), 16, 16)) -> intp(2, 0, 1)
	.word 0x983424da  ! 1: ORN_I	orn 	%r16, 0x04da, %r12
	.word 0x9b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r13
thr3_nuke_intr_1401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1401), 16, 16)) -> intp(0, 2, 1)
	.word 0xb48c2341  ! 1: ANDcc_I	andcc 	%r16, 0x0341, %r26
	.word 0x957c2401  ! 1: MOVR_I	move	%r16, 0xffffff41, %r10
	.word 0xb40c2081  ! 1: AND_I	and 	%r16, 0x0081, %r26
	.word 0x89342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r4
thr3_resum_intr_1402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1402), 16, 16)) -> intp(0, 3, 1)
	.word 0xaf3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r23
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
thr3_hw_intr_1403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1403), 16, 16)) -> intp(2, 0, 1)
	.word 0xa81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r20
thr3_nuke_intr_1404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1404), 16, 16)) -> intp(2, 2, 1)
	.word 0xa81c258a  ! 1: XOR_I	xor 	%r16, 0x058a, %r20
	.word 0x8a9c2421  ! 1: XORcc_I	xorcc 	%r16, 0x0421, %r5
	.word 0xa7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r19
	.word 0x8e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r7
thr3_resum_intr_1405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1405), 16, 16)) -> intp(2, 3, 1)
	.word 0x833c0011  ! 1: SRA_R	sra 	%r16, %r17, %r1
thr3_nuke_intr_1406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1406), 16, 16)) -> intp(2, 2, 1)
	.word 0x9c9c2b95  ! 1: XORcc_I	xorcc 	%r16, 0x0b95, %r14
thr3_resum_intr_1407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1407), 16, 16)) -> intp(2, 3, 1)
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
	.word 0xb09c2e98  ! 1: XORcc_I	xorcc 	%r16, 0x0e98, %r24
thr3_nuke_intr_1408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1408), 16, 16)) -> intp(2, 2, 1)
	.word 0x820c252b  ! 1: AND_I	and 	%r16, 0x052b, %r1
thr3_resum_intr_1409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1409), 16, 16)) -> intp(2, 3, 1)
	.word 0x909c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0xb6c42f36  ! 1: ADDCcc_I	addccc 	%r16, 0x0f36, %r27
thr3_hw_intr_1410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1410), 16, 16)) -> intp(0, 0, 1)
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x842c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x88340011  ! 1: ORN_R	orn 	%r16, %r17, %r4
thr3_hw_intr_1411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1411), 16, 16)) -> intp(2, 0, 1)
	.word 0xb0ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0xb28c2b81  ! 1: ANDcc_I	andcc 	%r16, 0x0b81, %r25
	.word 0x8eac2792  ! 1: ANDNcc_I	andncc 	%r16, 0x0792, %r7
thr3_nuke_intr_1412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1412), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a340011  ! 1: ORN_R	orn 	%r16, %r17, %r13
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
	.word 0xb32c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r25
thr3_resum_intr_1413:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1413), 16, 16)) -> intp(2, 3, 1)
	.word 0x942c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r10
	.word 0xb6ac2c86  ! 1: ANDNcc_I	andncc 	%r16, 0x0c86, %r27
	.word 0xb8ac2af5  ! 1: ANDNcc_I	andncc 	%r16, 0x0af5, %r28
thr3_hw_intr_1414:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1414), 16, 16)) -> intp(0, 0, 1)
	.word 0x893c1011  ! 1: SRAX_R	srax	%r16, %r17, %r4
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
thr3_hw_intr_1415:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1415), 16, 16)) -> intp(0, 0, 1)
	.word 0x96940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
	.word 0x92842743  ! 1: ADDcc_I	addcc 	%r16, 0x0743, %r9
thr3_nuke_intr_1416:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1416), 16, 16)) -> intp(1, 2, 1)
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
	.word 0xb6b42cc0  ! 1: ORNcc_I	orncc 	%r16, 0x0cc0, %r27
	.word 0x832c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r1
thr3_resum_intr_1417:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1417), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0x9d3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0xaa3c299b  ! 1: XNOR_I	xnor 	%r16, 0x099b, %r21
thr3_hw_intr_1418:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1418), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e342503  ! 1: ORN_I	orn 	%r16, 0x0503, %r15
thr3_hw_intr_1419:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1419), 16, 16)) -> intp(2, 0, 1)
	.word 0x98942a1a  ! 1: ORcc_I	orcc 	%r16, 0x0a1a, %r12
	.word 0x82c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x957c0411  ! 1: MOVR_R	move	%r16, %r17, %r10
thr3_nuke_intr_1420:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1420), 16, 16)) -> intp(2, 2, 1)
	.word 0x9694235a  ! 1: ORcc_I	orcc 	%r16, 0x035a, %r11
thr3_resum_intr_1421:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1421), 16, 16)) -> intp(2, 3, 1)
	.word 0x992c0011  ! 1: SLL_R	sll 	%r16, %r17, %r12
	.word 0x9cac2302  ! 1: ANDNcc_I	andncc 	%r16, 0x0302, %r14
thr3_nuke_intr_1422:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1422), 16, 16)) -> intp(2, 2, 1)
	.word 0x89641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x83342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r1
thr3_resum_intr_1423:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1423), 16, 16)) -> intp(2, 3, 1)
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x823c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0xac342e98  ! 1: ORN_I	orn 	%r16, 0x0e98, %r22
thr3_nuke_intr_1424:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1424), 16, 16)) -> intp(1, 2, 1)
	.word 0x832c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x93643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x86142e16  ! 1: OR_I	or 	%r16, 0x0e16, %r3
thr3_resum_intr_1425:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1425), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r15
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
thr3_hw_intr_1426:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1426), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a340011  ! 1: ORN_R	orn 	%r16, %r17, %r5
	.word 0x8d7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r6
thr3_nuke_intr_1427:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1427), 16, 16)) -> intp(0, 2, 1)
	.word 0xa92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0x953c0011  ! 1: SRA_R	sra 	%r16, %r17, %r10
thr3_resum_intr_1428:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1428), 16, 16)) -> intp(0, 3, 1)
	.word 0xae940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r23
thr3_nuke_intr_1429:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1429), 16, 16)) -> intp(1, 2, 1)
	.word 0xb094252c  ! 1: ORcc_I	orcc 	%r16, 0x052c, %r24
	.word 0x9e0c243d  ! 1: AND_I	and 	%r16, 0x043d, %r15
	.word 0xae94266c  ! 1: ORcc_I	orcc 	%r16, 0x066c, %r23
	.word 0x820c0011  ! 1: AND_R	and 	%r16, %r17, %r1
thr3_resum_intr_1430:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1430), 16, 16)) -> intp(1, 3, 1)
	.word 0x880c0011  ! 1: AND_R	and 	%r16, %r17, %r4
	.word 0x96b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r11
thr3_nuke_intr_1431:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1431), 16, 16)) -> intp(2, 2, 1)
	.word 0xb6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0x91343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r8
thr3_resum_intr_1432:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1432), 16, 16)) -> intp(2, 3, 1)
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
thr3_hw_intr_1433:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1433), 16, 16)) -> intp(2, 0, 1)
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
	.word 0xa6340011  ! 1: ORN_R	orn 	%r16, %r17, %r19
thr3_nuke_intr_1434:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1434), 16, 16)) -> intp(2, 2, 1)
	.word 0x86b429d9  ! 1: ORNcc_I	orncc 	%r16, 0x09d9, %r3
	.word 0xb17c2401  ! 1: MOVR_I	move	%r16, 0x9d9, %r24
	.word 0xa73c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r19
	.word 0xb23c2924  ! 1: XNOR_I	xnor 	%r16, 0x0924, %r25
thr3_resum_intr_1435:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1435), 16, 16)) -> intp(2, 3, 1)
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
thr3_nuke_intr_1436:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1436), 16, 16)) -> intp(0, 2, 1)
	.word 0xb2b42c58  ! 1: ORNcc_I	orncc 	%r16, 0x0c58, %r25
thr3_resum_intr_1437:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1437), 16, 16)) -> intp(0, 3, 1)
	.word 0x823c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0xb9340011  ! 1: SRL_R	srl 	%r16, %r17, %r28
	.word 0x8cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r6
thr3_hw_intr_1438:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1438), 16, 16)) -> intp(1, 0, 1)
	.word 0x8f641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb4bc211b  ! 1: XNORcc_I	xnorcc 	%r16, 0x011b, %r26
	.word 0x912c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0xbb2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r29
thr3_nuke_intr_1439:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1439), 16, 16)) -> intp(1, 2, 1)
	.word 0x948c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x95343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r10
thr3_resum_intr_1440:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1440), 16, 16)) -> intp(1, 3, 1)
	.word 0xb4140011  ! 1: OR_R	or 	%r16, %r17, %r26
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
	.word 0x92140011  ! 1: OR_R	or 	%r16, %r17, %r9
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
thr3_hw_intr_1441:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1441), 16, 16)) -> intp(1, 0, 1)
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0xae140011  ! 1: OR_R	or 	%r16, %r17, %r23
	.word 0x892c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r4
	.word 0xae0c2aa0  ! 1: AND_I	and 	%r16, 0x0aa0, %r23
thr3_hw_intr_1442:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1442), 16, 16)) -> intp(1, 0, 1)
	.word 0x8d7c2401  ! 1: MOVR_I	move	%r16, 0xfffffea0, %r6
	.word 0x8cbc2f4f  ! 1: XNORcc_I	xnorcc 	%r16, 0x0f4f, %r6
	.word 0x820c0011  ! 1: AND_R	and 	%r16, %r17, %r1
thr3_nuke_intr_1443:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1443), 16, 16)) -> intp(0, 2, 1)
	.word 0xb77c2401  ! 1: MOVR_I	move	%r16, 0x11, %r27
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0xb43c22f7  ! 1: XNOR_I	xnor 	%r16, 0x02f7, %r26
thr3_resum_intr_1444:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1444), 16, 16)) -> intp(0, 3, 1)
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x8ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r5
thr3_nuke_intr_1445:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1445), 16, 16)) -> intp(2, 2, 1)
	.word 0x95643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xba040011  ! 1: ADD_R	add 	%r16, %r17, %r29
	.word 0xa6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r19
thr3_resum_intr_1446:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1446), 16, 16)) -> intp(2, 3, 1)
	.word 0xaa8c2e53  ! 1: ANDcc_I	andcc 	%r16, 0x0e53, %r21
	.word 0x872c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r3
thr3_hw_intr_1447:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1447), 16, 16)) -> intp(1, 0, 1)
	.word 0xaf2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x837c0411  ! 1: MOVR_R	move	%r16, %r17, %r1
thr3_nuke_intr_1448:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1448), 16, 16)) -> intp(0, 2, 1)
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
	.word 0xb02c28d0  ! 1: ANDN_I	andn 	%r16, 0x08d0, %r24
thr3_resum_intr_1449:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1449), 16, 16)) -> intp(0, 3, 1)
	.word 0x937c2401  ! 1: MOVR_I	move	%r16, 0x8d0, %r9
	.word 0xb08c2631  ! 1: ANDcc_I	andcc 	%r16, 0x0631, %r24
	.word 0xb8942976  ! 1: ORcc_I	orcc 	%r16, 0x0976, %r28
	.word 0x82ac2915  ! 1: ANDNcc_I	andncc 	%r16, 0x0915, %r1
thr3_nuke_intr_1450:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1450), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a8427bb  ! 1: ADDcc_I	addcc 	%r16, 0x07bb, %r13
thr3_resum_intr_1451:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1451), 16, 16)) -> intp(2, 3, 1)
	.word 0x8e1428de  ! 1: OR_I	or 	%r16, 0x08de, %r7
	.word 0xb6340011  ! 1: ORN_R	orn 	%r16, %r17, %r27
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
	.word 0x84142ae4  ! 1: OR_I	or 	%r16, 0x0ae4, %r2
thr3_nuke_intr_1452:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1452), 16, 16)) -> intp(1, 2, 1)
	.word 0xba2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r29
	.word 0x8eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x903428b5  ! 1: ORN_I	orn 	%r16, 0x08b5, %r8
thr3_resum_intr_1453:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1453), 16, 16)) -> intp(1, 3, 1)
	.word 0xbb3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r29
	.word 0x8e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r7
	.word 0xb8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r28
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
thr3_nuke_intr_1454:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1454), 16, 16)) -> intp(0, 2, 1)
	.word 0xacb42dac  ! 1: ORNcc_I	orncc 	%r16, 0x0dac, %r22
thr3_resum_intr_1455:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1455), 16, 16)) -> intp(0, 3, 1)
	.word 0xb89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r28
thr3_hw_intr_1456:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1456), 16, 16)) -> intp(0, 0, 1)
	.word 0xacac22df  ! 1: ANDNcc_I	andncc 	%r16, 0x02df, %r22
	.word 0x933c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r9
thr3_nuke_intr_1457:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1457), 16, 16)) -> intp(2, 2, 1)
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x93643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_1458:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1458), 16, 16)) -> intp(2, 3, 1)
	.word 0x9a942666  ! 1: ORcc_I	orcc 	%r16, 0x0666, %r13
	.word 0xba9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r29
thr3_hw_intr_1459:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1459), 16, 16)) -> intp(0, 0, 1)
	.word 0xb0840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0x940c2eea  ! 1: AND_I	and 	%r16, 0x0eea, %r10
	.word 0x88440011  ! 1: ADDC_R	addc 	%r16, %r17, %r4
thr3_hw_intr_1460:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1460), 16, 16)) -> intp(1, 0, 1)
	.word 0xb1641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa6140011  ! 1: OR_R	or 	%r16, %r17, %r19
	.word 0x912c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x97641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_1461:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1461), 16, 16)) -> intp(0, 2, 1)
	.word 0x841c0011  ! 1: XOR_R	xor 	%r16, %r17, %r2
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
thr3_resum_intr_1462:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1462), 16, 16)) -> intp(0, 3, 1)
	.word 0x9c2c254b  ! 1: ANDN_I	andn 	%r16, 0x054b, %r14
	.word 0x9c042bc9  ! 1: ADD_I	add 	%r16, 0x0bc9, %r14
	.word 0x94142bdd  ! 1: OR_I	or 	%r16, 0x0bdd, %r10
thr3_hw_intr_1463:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1463), 16, 16)) -> intp(0, 0, 1)
	.word 0x94b42dae  ! 1: ORNcc_I	orncc 	%r16, 0x0dae, %r10
	.word 0xa68c2c99  ! 1: ANDcc_I	andcc 	%r16, 0x0c99, %r19
thr3_hw_intr_1464:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1464), 16, 16)) -> intp(2, 0, 1)
	.word 0x8a342cbc  ! 1: ORN_I	orn 	%r16, 0x0cbc, %r5
thr3_hw_intr_1465:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1465), 16, 16)) -> intp(1, 0, 1)
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x91343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0x9c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r14
thr3_hw_intr_1466:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1466), 16, 16)) -> intp(1, 0, 1)
	.word 0x86ac2922  ! 1: ANDNcc_I	andncc 	%r16, 0x0922, %r3
	.word 0x96ac2592  ! 1: ANDNcc_I	andncc 	%r16, 0x0592, %r11
	.word 0x9c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0xa9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r20
thr3_nuke_intr_1467:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1467), 16, 16)) -> intp(1, 2, 1)
	.word 0xac0c20da  ! 1: AND_I	and 	%r16, 0x00da, %r22
thr3_resum_intr_1468:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1468), 16, 16)) -> intp(1, 3, 1)
	.word 0xb694205e  ! 1: ORcc_I	orcc 	%r16, 0x005e, %r27
thr3_nuke_intr_1469:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1469), 16, 16)) -> intp(2, 2, 1)
	.word 0x96b42f94  ! 1: ORNcc_I	orncc 	%r16, 0x0f94, %r11
thr3_resum_intr_1470:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1470), 16, 16)) -> intp(2, 3, 1)
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xb02c2053  ! 1: ANDN_I	andn 	%r16, 0x0053, %r24
	.word 0x902c2bd0  ! 1: ANDN_I	andn 	%r16, 0x0bd0, %r8
thr3_nuke_intr_1471:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1471), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r15
	.word 0xb02c2f40  ! 1: ANDN_I	andn 	%r16, 0x0f40, %r24
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
thr3_resum_intr_1472:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1472), 16, 16)) -> intp(1, 3, 1)
	.word 0x853c0011  ! 1: SRA_R	sra 	%r16, %r17, %r2
	.word 0x94ac255f  ! 1: ANDNcc_I	andncc 	%r16, 0x055f, %r10
	.word 0xb12c0011  ! 1: SLL_R	sll 	%r16, %r17, %r24
thr3_nuke_intr_1473:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1473), 16, 16)) -> intp(1, 2, 1)
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x8f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r7
thr3_resum_intr_1474:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1474), 16, 16)) -> intp(1, 3, 1)
	.word 0xab2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x9ebc289c  ! 1: XNORcc_I	xnorcc 	%r16, 0x089c, %r15
	.word 0xb61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r27
	.word 0xb68c24fd  ! 1: ANDcc_I	andcc 	%r16, 0x04fd, %r27
thr3_hw_intr_1475:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1475), 16, 16)) -> intp(1, 0, 1)
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_1476:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1476), 16, 16)) -> intp(2, 0, 1)
	.word 0xb6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r27
thr3_hw_intr_1477:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1477), 16, 16)) -> intp(0, 0, 1)
	.word 0x989c25cb  ! 1: XORcc_I	xorcc 	%r16, 0x05cb, %r12
thr3_hw_intr_1478:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1478), 16, 16)) -> intp(2, 0, 1)
	.word 0x983c29ae  ! 1: XNOR_I	xnor 	%r16, 0x09ae, %r12
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x94840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r10
thr3_hw_intr_1479:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1479), 16, 16)) -> intp(1, 0, 1)
	.word 0x86c424f7  ! 1: ADDCcc_I	addccc 	%r16, 0x04f7, %r3
thr3_nuke_intr_1480:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1480), 16, 16)) -> intp(0, 2, 1)
	.word 0xb89c217c  ! 1: XORcc_I	xorcc 	%r16, 0x017c, %r28
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
thr3_resum_intr_1481:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1481), 16, 16)) -> intp(0, 3, 1)
	.word 0xae0c2793  ! 1: AND_I	and 	%r16, 0x0793, %r23
	.word 0xb97c2401  ! 1: MOVR_I	move	%r16, 0xffffff93, %r28
thr3_hw_intr_1482:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1482), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r28
thr3_nuke_intr_1483:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1483), 16, 16)) -> intp(1, 2, 1)
	.word 0x8b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r5
	.word 0x8b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0x86ac224d  ! 1: ANDNcc_I	andncc 	%r16, 0x024d, %r3
thr3_resum_intr_1484:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1484), 16, 16)) -> intp(1, 3, 1)
	.word 0xa7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r19
thr3_hw_intr_1485:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1485), 16, 16)) -> intp(0, 0, 1)
	.word 0xae9c2df0  ! 1: XORcc_I	xorcc 	%r16, 0x0df0, %r23
	.word 0xb4bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0x922c26af  ! 1: ANDN_I	andn 	%r16, 0x06af, %r9
	.word 0xac940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r22
thr3_hw_intr_1486:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1486), 16, 16)) -> intp(2, 0, 1)
	.word 0x888c254c  ! 1: ANDcc_I	andcc 	%r16, 0x054c, %r4
thr3_nuke_intr_1487:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1487), 16, 16)) -> intp(1, 2, 1)
	.word 0xb3340011  ! 1: SRL_R	srl 	%r16, %r17, %r25
	.word 0xb01c2b76  ! 1: XOR_I	xor 	%r16, 0x0b76, %r24
thr3_resum_intr_1488:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1488), 16, 16)) -> intp(1, 3, 1)
	.word 0x84340011  ! 1: ORN_R	orn 	%r16, %r17, %r2
thr3_nuke_intr_1489:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1489), 16, 16)) -> intp(2, 2, 1)
	.word 0x923c2df9  ! 1: XNOR_I	xnor 	%r16, 0x0df9, %r9
	.word 0xa8842256  ! 1: ADDcc_I	addcc 	%r16, 0x0256, %r20
	.word 0x9a9429a7  ! 1: ORcc_I	orcc 	%r16, 0x09a7, %r13
thr3_resum_intr_1490:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1490), 16, 16)) -> intp(2, 3, 1)
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9a2c2887  ! 1: ANDN_I	andn 	%r16, 0x0887, %r13
	.word 0x902c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r8
thr3_hw_intr_1491:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1491), 16, 16)) -> intp(0, 0, 1)
	.word 0xae9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x90c42e2d  ! 1: ADDCcc_I	addccc 	%r16, 0x0e2d, %r8
thr3_hw_intr_1492:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1492), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0x8d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r6
	.word 0x9e8c2374  ! 1: ANDcc_I	andcc 	%r16, 0x0374, %r15
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
thr3_nuke_intr_1493:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1493), 16, 16)) -> intp(0, 2, 1)
	.word 0xa81c2122  ! 1: XOR_I	xor 	%r16, 0x0122, %r20
thr3_resum_intr_1494:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1494), 16, 16)) -> intp(0, 3, 1)
	.word 0x823c270e  ! 1: XNOR_I	xnor 	%r16, 0x070e, %r1
	.word 0xaa2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r21
	.word 0xa72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r19
thr3_hw_intr_1495:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1495), 16, 16)) -> intp(2, 0, 1)
	.word 0x8814268a  ! 1: OR_I	or 	%r16, 0x068a, %r4
	.word 0x942c2288  ! 1: ANDN_I	andn 	%r16, 0x0288, %r10
thr3_nuke_intr_1496:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1496), 16, 16)) -> intp(2, 2, 1)
	.word 0x90140011  ! 1: OR_R	or 	%r16, %r17, %r8
	.word 0x8e842724  ! 1: ADDcc_I	addcc 	%r16, 0x0724, %r7
	.word 0x84340011  ! 1: ORN_R	orn 	%r16, %r17, %r2
thr3_resum_intr_1497:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1497), 16, 16)) -> intp(2, 3, 1)
	.word 0xb5342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r26
thr3_nuke_intr_1498:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1498), 16, 16)) -> intp(0, 2, 1)
	.word 0x982c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r12
thr3_resum_intr_1499:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1499), 16, 16)) -> intp(0, 3, 1)
	.word 0x9b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9c3425ad  ! 1: ORN_I	orn 	%r16, 0x05ad, %r14
	.word 0x9e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0x9c1c2f3e  ! 1: XOR_I	xor 	%r16, 0x0f3e, %r14
thr3_nuke_intr_1500:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1500), 16, 16)) -> intp(2, 2, 1)
	.word 0xb4342f06  ! 1: ORN_I	orn 	%r16, 0x0f06, %r26
	.word 0x932c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x8a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x9f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r15
thr3_resum_intr_1501:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1501), 16, 16)) -> intp(2, 3, 1)
	.word 0x9f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r15
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x86ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r3
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
        setx  0x00000000000001e0, %g1, %r17
        setx  0x135f4ecac0e4335b, %g1, %r0
        setx  0xdd7c1df6291a5293, %g1, %r1
        setx  0x1687ce3d1ac355ed, %g1, %r2
        setx  0x1dfd1c3991926212, %g1, %r3
        setx  0xa5e27456d46ac41a, %g1, %r4
        setx  0x16b9e6f37cefbafa, %g1, %r5
        setx  0x9bf261a9ca260aac, %g1, %r6
        setx  0x866353bed47159a6, %g1, %r7
        setx  0xe7ef5fa93db79601, %g1, %r8
        setx  0x92a948babbb086f7, %g1, %r9
        setx  0x0861d36d75aec16f, %g1, %r10
        setx  0xb6a39df46ba57e10, %g1, %r11
        setx  0xb6d732d8df8f4e75, %g1, %r12
        setx  0x3efa64b83e76c917, %g1, %r13
        setx  0xb66af7b19c398608, %g1, %r14
        setx  0x0e385a9473f39493, %g1, %r15
        setx  0xd0e41b49b29664ad, %g1, %r18
        setx  0xa655ffb1e9e94dbc, %g1, %r19
        setx  0x3594e3f40409e873, %g1, %r20
        setx  0x7e5268c1440d1131, %g1, %r21
        setx  0x1c8c41e7b45d947c, %g1, %r22
        setx  0x899a2007b80399a0, %g1, %r23
        setx  0x1b37da7cbca68fb9, %g1, %r24
        setx  0x0c937be04ebcb386, %g1, %r25
        setx  0x26a6d26e64215fa9, %g1, %r26
        setx  0xfc7878c9ebad1cc1, %g1, %r27
        setx  0x33dd84241b566daa, %g1, %r28
        setx  0xda88605080dc6205, %g1, %r29
        setx  0xa83765be71c3f2aa, %g1, %r30
        setx  0x0961e9f33169d3e7, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000003a0, %g1, %r17
        setx  0x78363a7624c91b6a, %g1, %r0
        setx  0x1bbfe536d087c0f2, %g1, %r1
        setx  0xbe2644a9d4f7a7ae, %g1, %r2
        setx  0x6da514ca048f8d3e, %g1, %r3
        setx  0xbf5c5d720711bfd5, %g1, %r4
        setx  0x7cb9975b172d4b57, %g1, %r5
        setx  0x9037ad14fc28225f, %g1, %r6
        setx  0x64fe91a6dd15647a, %g1, %r7
        setx  0xa8883e63ed41b3d1, %g1, %r8
        setx  0x3bb6ac3634cc51e2, %g1, %r9
        setx  0x3f441380bd03837d, %g1, %r10
        setx  0x5a235a4ac3078f42, %g1, %r11
        setx  0xe7a21240cab47d75, %g1, %r12
        setx  0xe80d64012241f2c0, %g1, %r13
        setx  0x6c7b13189a330137, %g1, %r14
        setx  0x47b1c29cad435790, %g1, %r15
        setx  0x8b4a2f102099b806, %g1, %r18
        setx  0x9ef9e5818c486bd0, %g1, %r19
        setx  0x7c4bf72cb0d679cd, %g1, %r20
        setx  0xb41fdf7ed47c9397, %g1, %r21
        setx  0x7d289655b3ea5e87, %g1, %r22
        setx  0x9750255a0b51d82d, %g1, %r23
        setx  0xea9434796bbb0046, %g1, %r24
        setx  0xb320610d4e07276c, %g1, %r25
        setx  0xc95638fad5a965d9, %g1, %r26
        setx  0x2c7c517350062bc0, %g1, %r27
        setx  0xa425669778c8c320, %g1, %r28
        setx  0xb62bcc6a2fdeb697, %g1, %r29
        setx  0xc73b555531abe114, %g1, %r30
        setx  0xc0319c63a3a17cd6, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000004e0, %g1, %r17
        setx  0xb30b181b8822c203, %g1, %r0
        setx  0x37e15eac62a5892c, %g1, %r1
        setx  0x82cb92d1a9a8fc0c, %g1, %r2
        setx  0x884ff650c9e33321, %g1, %r3
        setx  0xf1a9b9283500dcf4, %g1, %r4
        setx  0xc3473ac632d9a169, %g1, %r5
        setx  0xfb53747e9e47b72f, %g1, %r6
        setx  0xdaffd5d330daf487, %g1, %r7
        setx  0x2e109817655b5b59, %g1, %r8
        setx  0x8c4c07fbf35cbbee, %g1, %r9
        setx  0x6174471d70bc7f73, %g1, %r10
        setx  0x84f45224f4c7124c, %g1, %r11
        setx  0x3cc4473b003144b3, %g1, %r12
        setx  0x557a93b87dfdedc8, %g1, %r13
        setx  0xa31a3cabe7365a9c, %g1, %r14
        setx  0x1e7658a59286cf0f, %g1, %r15
        setx  0xc96b6bb25f09a8a3, %g1, %r18
        setx  0x685d8a6374af335f, %g1, %r19
        setx  0x3ec3376b82b427dd, %g1, %r20
        setx  0x99a44c126dcd41fa, %g1, %r21
        setx  0x40a2d58d95bda915, %g1, %r22
        setx  0xa7c5cf37297cfde4, %g1, %r23
        setx  0x035f6ea9e76df141, %g1, %r24
        setx  0x60f6e1700deec58b, %g1, %r25
        setx  0x55d5aa01695fad5f, %g1, %r26
        setx  0x614d13d4ba36775d, %g1, %r27
        setx  0x281e6e5b35b1690e, %g1, %r28
        setx  0x4db9e91ffed1a47b, %g1, %r29
        setx  0xa04ce64f00f93ece, %g1, %r30
        setx  0x78e9630b23fb5a55, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000005a0, %g1, %r17
        setx  0xb157799accee0976, %g1, %r0
        setx  0x77ede1e87ae7d126, %g1, %r1
        setx  0xcb8075fc3005528f, %g1, %r2
        setx  0x3061e7ebd634d5e9, %g1, %r3
        setx  0xda6cb16d29cdbfaa, %g1, %r4
        setx  0x407887e489619b90, %g1, %r5
        setx  0xd8e39bad09fa131f, %g1, %r6
        setx  0xb1fe5c9a2e63b2c3, %g1, %r7
        setx  0xc7be52e6696ccf35, %g1, %r8
        setx  0x46d36419da24ed66, %g1, %r9
        setx  0x1049b05c69bb70cf, %g1, %r10
        setx  0x7c7048033b855ff2, %g1, %r11
        setx  0xb57abd15ba7608b3, %g1, %r12
        setx  0x20ec845df4444ccb, %g1, %r13
        setx  0x3631e0887ddeac6c, %g1, %r14
        setx  0x324c34fba0be95d4, %g1, %r15
        setx  0xcbb3cd651b9fa90d, %g1, %r18
        setx  0x15c9dec833a85a1c, %g1, %r19
        setx  0xa7975f0191b86b56, %g1, %r20
        setx  0x43d5f4f7e872f0fb, %g1, %r21
        setx  0xa6f8c2e9704ff9d1, %g1, %r22
        setx  0x3a63242f1f14e302, %g1, %r23
        setx  0xec8fe15569a7f01c, %g1, %r24
        setx  0x092e44b3a6788d7e, %g1, %r25
        setx  0xf86cfc88fac3aa1b, %g1, %r26
        setx  0x8b3532a5ab3dfea5, %g1, %r27
        setx  0xbd0de15cc11d3267, %g1, %r28
        setx  0xe92cb00dc91ade4a, %g1, %r29
        setx  0xc7a1090915629b2e, %g1, %r30
        setx  0x22ff1842bd9b4fc2, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d70, %g1, %r17
        setx  0x138301db41561626, %g1, %r0
        setx  0x53473e63e9d22a00, %g1, %r1
        setx  0x3e12ea084678751d, %g1, %r2
        setx  0xa1049e3a04ed077b, %g1, %r3
        setx  0x1b74ff2315346159, %g1, %r4
        setx  0xb4e3501e9f7df375, %g1, %r5
        setx  0x7f7eeb6542af66d7, %g1, %r6
        setx  0x68a2f0373f639bdc, %g1, %r7
        setx  0x289bdcbdbcfecb95, %g1, %r8
        setx  0xcfb67df227fe9489, %g1, %r9
        setx  0xd0b8abbc01c14833, %g1, %r10
        setx  0xc2f31f5e6a3651ea, %g1, %r11
        setx  0xde858157f1295994, %g1, %r12
        setx  0x79129614f17f4b2e, %g1, %r13
        setx  0x4ed7308bc3c41683, %g1, %r14
        setx  0xbcf5b0f28ebfdbd3, %g1, %r15
        setx  0x501f961feb21f043, %g1, %r18
        setx  0xc090ce6401b85e5c, %g1, %r19
        setx  0x1064f1c9ab08a329, %g1, %r20
        setx  0x9e8a128d09a8f50a, %g1, %r21
        setx  0x09d251c8e4a5d41f, %g1, %r22
        setx  0xc27caf537841f276, %g1, %r23
        setx  0x54a7bd5c5f3d89d0, %g1, %r24
        setx  0x13512526644cce06, %g1, %r25
        setx  0xc18f6235840f2b14, %g1, %r26
        setx  0x27ae1e9323d71ed5, %g1, %r27
        setx  0xc9b4e132bce595c4, %g1, %r28
        setx  0x142ce4f194443455, %g1, %r29
        setx  0x16ed02df724f7990, %g1, %r30
        setx  0x3c7b6b7be5b434b9, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000550, %g1, %r17
        setx  0x7b40aa44565c0463, %g1, %r0
        setx  0x70cdf670cb4a693a, %g1, %r1
        setx  0x568e861e9e4a5a36, %g1, %r2
        setx  0x9c8f7649f01e8ea0, %g1, %r3
        setx  0xfa571a949d8179af, %g1, %r4
        setx  0x8f9b43ae99f4da24, %g1, %r5
        setx  0xb5e24178c4cc6042, %g1, %r6
        setx  0x0f48f69c5e2ab8f2, %g1, %r7
        setx  0xbb09babf4a5c7821, %g1, %r8
        setx  0xed82c762538be0bb, %g1, %r9
        setx  0xa00adb0a85d3f488, %g1, %r10
        setx  0x0af524ff289c0c34, %g1, %r11
        setx  0x3cc573a8a8a15161, %g1, %r12
        setx  0xe993e347c62dd41a, %g1, %r13
        setx  0x7cfa1d33db3d5a11, %g1, %r14
        setx  0x9f4f39a8797d8c4d, %g1, %r15
        setx  0x841376e45992e437, %g1, %r18
        setx  0xab6f38e32c91c934, %g1, %r19
        setx  0xfab4125c96c6d3f1, %g1, %r20
        setx  0xecc26a9051b737bb, %g1, %r21
        setx  0x3adf9a2145f3a209, %g1, %r22
        setx  0xeb0b4d8ed30ad522, %g1, %r23
        setx  0xb8aceafd1edbe6f8, %g1, %r24
        setx  0x54caa35693963c13, %g1, %r25
        setx  0x21cf89928161ebd0, %g1, %r26
        setx  0xf395e6c49430b94a, %g1, %r27
        setx  0xcdebc47c7347074b, %g1, %r28
        setx  0xfac231bf9356502b, %g1, %r29
        setx  0x8a74faeb92fa864a, %g1, %r30
        setx  0x3b3dcdd13b4cb626, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000a80, %g1, %r17
        setx  0x2ff2e0217e3d0b66, %g1, %r0
        setx  0xb87a993c87cfbfc0, %g1, %r1
        setx  0x77f2b00c4360d743, %g1, %r2
        setx  0x316a032bfd86ea2c, %g1, %r3
        setx  0x22abea1f8b1d1457, %g1, %r4
        setx  0xfe7be352c524b8e6, %g1, %r5
        setx  0xcfdc5a35c06f1be6, %g1, %r6
        setx  0x41db205115e70e78, %g1, %r7
        setx  0x8638d3fef60e073c, %g1, %r8
        setx  0x933a7d5ff293e202, %g1, %r9
        setx  0xc5500df19b21ca9b, %g1, %r10
        setx  0x50fa73efcb2e0f00, %g1, %r11
        setx  0xe2d2477018f8d412, %g1, %r12
        setx  0x89f514751a47f796, %g1, %r13
        setx  0x165580e5fcd55627, %g1, %r14
        setx  0x028327a3d6511d45, %g1, %r15
        setx  0xd2cc78cedc80bff0, %g1, %r18
        setx  0x5c271917df85d4c8, %g1, %r19
        setx  0x962be2526bba1bf7, %g1, %r20
        setx  0x386b268c509bc241, %g1, %r21
        setx  0xf59b1a9545339fee, %g1, %r22
        setx  0x3c9e2590cd321ca1, %g1, %r23
        setx  0xf4455c8022983e33, %g1, %r24
        setx  0x7c67bd96753a63be, %g1, %r25
        setx  0x71c28c62e25c63e2, %g1, %r26
        setx  0x92c08d2916b6fabe, %g1, %r27
        setx  0xb76c59fad9247e76, %g1, %r28
        setx  0xc04ea81d4522b52d, %g1, %r29
        setx  0x3042546aa6e8a6ec, %g1, %r30
        setx  0xdc521a1110433ed4, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000cf0, %g1, %r17
        setx  0xb81c3229e809fd26, %g1, %r0
        setx  0xc88496d3a8d22cca, %g1, %r1
        setx  0x190421aca470bc30, %g1, %r2
        setx  0xc46a89ee8e7abcec, %g1, %r3
        setx  0x46bd03a331ec3b76, %g1, %r4
        setx  0x95eedd6bc496f992, %g1, %r5
        setx  0x8555de1544c751eb, %g1, %r6
        setx  0x469a27035d567293, %g1, %r7
        setx  0x88b6c1da2728be6e, %g1, %r8
        setx  0x4014758065c0778f, %g1, %r9
        setx  0x259dcc15a6fcc3b8, %g1, %r10
        setx  0xad13b9e2c353e7b5, %g1, %r11
        setx  0x76fb414373c5b3e4, %g1, %r12
        setx  0x872790ef3af86902, %g1, %r13
        setx  0xe6e8cfa2b80a4d85, %g1, %r14
        setx  0x13ed09d6a5b33080, %g1, %r15
        setx  0xa8387020445033dc, %g1, %r18
        setx  0xe101618f35b1ace7, %g1, %r19
        setx  0xf06a22f72acc41a2, %g1, %r20
        setx  0x62c24b475222148c, %g1, %r21
        setx  0xbb73bc4cd86e1c7b, %g1, %r22
        setx  0x63959c5aaf3da135, %g1, %r23
        setx  0x29186ae5294315e8, %g1, %r24
        setx  0x474134f50ae922cb, %g1, %r25
        setx  0xe851013792225321, %g1, %r26
        setx  0x0c8663e707a6a657, %g1, %r27
        setx  0x976ae85a3c522793, %g1, %r28
        setx  0xbbe1c61676cf3e2d, %g1, %r29
        setx  0xecbd1da43272eef6, %g1, %r30
        setx  0xc0871e8838a1b417, %g1, %r31
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
thr2_dc_err_0:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_0), 16, 16),1,DC_DATA,65)
	.word 0xc6942f06  ! 3: LDUHA_I	lduha	[%r16, + 0x0f06] %asi, %r3
thr2_irf_ce_0:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_0), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xce941011  ! 5: LDUHA_R	lduha	[%r16, %r17] 0x80, %r7
	.word 0x9ec40011  ! 7: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x969c0011  ! 7: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x84b42796  ! 7: ORNcc_I	orncc 	%r16, 0x0796, %r2
	.word 0xb7643801  ! 7: MOVcc_I	<illegal instruction>
	.word 0x949c0011  ! 7: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0xb03c2e5d  ! 7: XNOR_I	xnor 	%r16, 0x0e5d, %r24
	.word 0xbabc245b  ! 7: XNORcc_I	xnorcc 	%r16, 0x045b, %r29
	.word 0xd894243c  ! 8: LDUHA_I	lduha	[%r16, + 0x043c] %asi, %r12
thr2_irf_ce_1:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_1), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xe7142e2c  ! 10: LDQF_I	-	[%r16, 0x0e2c], %f19
	.word 0xb6342915  ! 12: ORN_I	orn 	%r16, 0x0915, %r27
	.word 0xb40c0011  ! 12: AND_R	and 	%r16, %r17, %r26
	.word 0xb6442561  ! 12: ADDC_I	addc 	%r16, 0x0561, %r27
	.word 0xb97c2401  ! 12: MOVR_I	move	%r16, 0xfffffe34, %r28
	.word 0x893c1011  ! 12: SRAX_R	srax	%r16, %r17, %r4
	.word 0x922c2fdf  ! 12: ANDN_I	andn 	%r16, 0x0fdf, %r9
	.word 0xb644260d  ! 12: ADDC_I	addc 	%r16, 0x060d, %r27
	.word 0xd90420ea  ! 13: LDF_I	ld	[%r16, 0x00ea], %f12
thr2_irf_ce_2:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_2), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xf5841011  ! 15: LDFA_R	lda	[%r16, %r17], %f26
	.word 0xa6442236  ! 17: ADDC_I	addc 	%r16, 0x0236, %r19
	.word 0xb23c27f2  ! 17: XNOR_I	xnor 	%r16, 0x07f2, %r25
	.word 0x912c3001  ! 17: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x8c440011  ! 17: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x901c2142  ! 17: XOR_I	xor 	%r16, 0x0142, %r8
	.word 0x8c140011  ! 17: OR_R	or 	%r16, %r17, %r6
	.word 0x82c426c1  ! 17: ADDCcc_I	addccc 	%r16, 0x06c1, %r1
	.word 0xb4b40011  ! 17: ORNcc_R	orncc 	%r16, %r17, %r26
thr2_dc_err_1:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_1), 16, 16),1,DC_DATA,16)
	.word 0xfa8c2153  ! 19: LDUBA_I	lduba	[%r16, + 0x0153] %asi, %r29
	.word 0xda4c0011  ! 21: LDSB_R	ldsb	[%r16 + %r17], %r13
	.word 0x8e44229e  ! 23: ADDC_I	addc 	%r16, 0x029e, %r7
	.word 0xbb342001  ! 23: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0x9e8c2f2d  ! 23: ANDcc_I	andcc 	%r16, 0x0f2d, %r15
	.word 0x912c1011  ! 23: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x95643801  ! 23: MOVcc_I	<illegal instruction>
	.word 0x909c20fe  ! 23: XORcc_I	xorcc 	%r16, 0x00fe, %r8
	.word 0x8c4423a1  ! 23: ADDC_I	addc 	%r16, 0x03a1, %r6
	.word 0x8c4425d9  ! 23: ADDC_I	addc 	%r16, 0x05d9, %r6
	.word 0xf30420aa  ! 24: LDF_I	ld	[%r16, 0x00aa], %f25
thr2_irf_ce_3:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_3), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xc4140011  ! 26: LDUH_R	lduh	[%r16 + %r17], %r2
	.word 0x9e142765  ! 28: OR_I	or 	%r16, 0x0765, %r15
	.word 0x917c2401  ! 28: MOVR_I	move	%r16, 0xfffffe34, %r8
	.word 0x9b643801  ! 28: MOVcc_I	<illegal instruction>
	.word 0xb3341011  ! 28: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x83341011  ! 28: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x8d2c1011  ! 28: SLLX_R	sllx	%r16, %r17, %r6
	.word 0xab343001  ! 28: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0xf0d42a9e  ! 29: LDSHA_I	ldsha	[%r16, + 0x0a9e] %asi, %r24
thr2_irf_ce_4:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_4), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xd2841011  ! 31: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r9
	.word 0x97340011  ! 33: SRL_R	srl 	%r16, %r17, %r11
	.word 0x829c0011  ! 33: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x943c0011  ! 33: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0xb284217a  ! 33: ADDcc_I	addcc 	%r16, 0x017a, %r25
	.word 0xb6142a72  ! 33: OR_I	or 	%r16, 0x0a72, %r27
	.word 0xad7c2401  ! 33: MOVR_I	move	%r16, 0xfffffe34, %r22
	.word 0x9c140011  ! 33: OR_R	or 	%r16, %r17, %r14
	.word 0xf28c1011  ! 34: LDUBA_R	lduba	[%r16, %r17] 0x80, %r25
thr2_irf_ce_5:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_5), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xec1425d5  ! 36: LDUH_I	lduh	[%r16 + 0x05d5], %r22
	.word 0x863c2f8d  ! 38: XNOR_I	xnor 	%r16, 0x0f8d, %r3
	.word 0x9b7c0411  ! 38: MOVR_R	move	%r16, %r17, %r13
	.word 0x9c8c0011  ! 38: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x8a94271d  ! 38: ORcc_I	orcc 	%r16, 0x071d, %r5
	.word 0xb8142cf5  ! 38: OR_I	or 	%r16, 0x0cf5, %r28
	.word 0xa92c3001  ! 38: SLLX_I	sllx	%r16, 0x0001, %r20
thr2_dc_err_2:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_2), 16, 16),1,DC_DATA,46)
	.word 0xcf1c0000  ! 40: LDDF_R	ldd	[%r16, %r0], %f7
	.word 0xc2841011  ! 42: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r1
	.word 0xb2140011  ! 44: OR_R	or 	%r16, %r17, %r25
	.word 0x962c0011  ! 44: ANDN_R	andn 	%r16, %r17, %r11
	.word 0x8d7c0411  ! 44: MOVR_R	move	%r16, %r17, %r6
	.word 0x929c0011  ! 44: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0x837c2401  ! 44: MOVR_I	move	%r16, 0xfffffe34, %r1
thr2_dc_err_3:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_3), 16, 16),1,DC_DATA,19)
	.word 0xe79c1000  ! 46: LDDFA_R	ldda	[%r16, %r0], %f19
thr2_irf_ce_6:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_6), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xcd941011  ! 48: LDQFA_R	-	[%r16, %r17], %f6
	.word 0x8a340011  ! 50: ORN_R	orn 	%r16, %r17, %r5
	.word 0xa81c0011  ! 50: XOR_R	xor 	%r16, %r17, %r20
	.word 0x84b42bf5  ! 50: ORNcc_I	orncc 	%r16, 0x0bf5, %r2
	.word 0x8c1c2a25  ! 50: XOR_I	xor 	%r16, 0x0a25, %r6
	.word 0x86b42c67  ! 50: ORNcc_I	orncc 	%r16, 0x0c67, %r3
	.word 0x9cac0011  ! 50: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0xab2c1011  ! 50: SLLX_R	sllx	%r16, %r17, %r21
	.word 0xc79c1011  ! 51: LDDFA_R	ldda	[%r16, %r17], %f3
thr2_irf_ce_7:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_7), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xdf042e60  ! 53: LDF_I	ld	[%r16, 0x0e60], %f15
	.word 0xac1c0011  ! 55: XOR_R	xor 	%r16, %r17, %r22
	.word 0x972c3001  ! 55: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x909c0011  ! 55: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0xab2c1011  ! 55: SLLX_R	sllx	%r16, %r17, %r21
	.word 0xb1343001  ! 55: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xde442a78  ! 56: LDSW_I	ldsw	[%r16 + 0x0a78], %r15
thr2_irf_ce_8:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_8), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xeacc1011  ! 58: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r21
	.word 0x9eb429ab  ! 60: ORNcc_I	orncc 	%r16, 0x09ab, %r15
	.word 0xb8340011  ! 60: ORN_R	orn 	%r16, %r17, %r28
	.word 0xba040011  ! 60: ADD_R	add 	%r16, %r17, %r29
	.word 0x868c2061  ! 60: ANDcc_I	andcc 	%r16, 0x0061, %r3
	.word 0x8634203e  ! 60: ORN_I	orn 	%r16, 0x003e, %r3
	.word 0xaf2c0011  ! 60: SLL_R	sll 	%r16, %r17, %r23
	.word 0x948c2f10  ! 60: ANDcc_I	andcc 	%r16, 0x0f10, %r10
	.word 0x8b2c0011  ! 60: SLL_R	sll 	%r16, %r17, %r5
thr2_dc_err_4:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_4), 16, 16),1,DC_DATA,33)
	.word 0xca5c0000  ! 62: LDX_R	ldx	[%r16 + %r0], %r5
thr2_irf_ce_9:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_9), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xd0b41011  ! 64: STHA_R	stha	%r8, [%r16 + %r17] 0x80
	.word 0x92940011  ! 66: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x82bc2447  ! 66: XNORcc_I	xnorcc 	%r16, 0x0447, %r1
	.word 0x84bc0011  ! 66: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0xb0bc29fa  ! 66: XNORcc_I	xnorcc 	%r16, 0x09fa, %r24
	.word 0x90140011  ! 66: OR_R	or 	%r16, %r17, %r8
	.word 0x90bc2670  ! 66: XNORcc_I	xnorcc 	%r16, 0x0670, %r8
	.word 0x877c0411  ! 66: MOVR_R	move	%r16, %r17, %r3
thr2_dc_err_5:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_5), 16, 16),1,DC_DATA,65)
	.word 0xd91c0000  ! 68: LDDF_R	ldd	[%r16, %r0], %f12
	.word 0xd3941011  ! 70: LDQFA_R	-	[%r16, %r17], %f9
	.word 0x842c0011  ! 72: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x9d3c1011  ! 72: SRAX_R	srax	%r16, %r17, %r14
	.word 0x9cac2924  ! 72: ANDNcc_I	andncc 	%r16, 0x0924, %r14
	.word 0x9e040011  ! 72: ADD_R	add 	%r16, %r17, %r15
	.word 0x9a142a54  ! 72: OR_I	or 	%r16, 0x0a54, %r13
	.word 0x84140011  ! 72: OR_R	or 	%r16, %r17, %r2
	.word 0xb0040011  ! 72: ADD_R	add 	%r16, %r17, %r24
thr2_dc_err_6:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_6), 16, 16),1,DC_DATA,58)
	.word 0xca4c22d9  ! 74: LDSB_I	ldsb	[%r16 + 0x02d9], %r5
thr2_irf_ce_10:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_10), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xcb1c0011  ! 76: LDDF_R	ldd	[%r16, %r17], %f5
	.word 0xb4bc23c3  ! 78: XNORcc_I	xnorcc 	%r16, 0x03c3, %r26
	.word 0x89343001  ! 78: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0xb0842909  ! 78: ADDcc_I	addcc 	%r16, 0x0909, %r24
	.word 0x84140011  ! 78: OR_R	or 	%r16, %r17, %r2
	.word 0x857c2401  ! 78: MOVR_I	move	%r16, 0xfffffe34, %r2
	.word 0x9f340011  ! 78: SRL_R	srl 	%r16, %r17, %r15
thr2_dc_err_7:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_7), 16, 16),1,DC_DATA,25)
	.word 0xca8c2c1c  ! 80: LDUBA_I	lduba	[%r16, + 0x0c1c] %asi, %r5
	.word 0xc7142bd8  ! 82: LDQF_I	-	[%r16, 0x0bd8], %f3
	.word 0x8e1c0011  ! 84: XOR_R	xor 	%r16, %r17, %r7
	.word 0x89643801  ! 84: MOVcc_I	<illegal instruction>
	.word 0x9f2c1011  ! 84: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x8c2c0011  ! 84: ANDN_R	andn 	%r16, %r17, %r6
	.word 0x98c40011  ! 84: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0xb29c2e79  ! 84: XORcc_I	xorcc 	%r16, 0x0e79, %r25
	.word 0xd48c2161  ! 85: LDUBA_I	lduba	[%r16, + 0x0161] %asi, %r10
	.word 0xeb9c1011  ! 87: LDDFA_R	ldda	[%r16, %r17], %f21
	.word 0xb73c0011  ! 89: SRA_R	sra 	%r16, %r17, %r27
	.word 0x94840011  ! 89: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0x993c1011  ! 89: SRAX_R	srax	%r16, %r17, %r12
	.word 0xbb7c0411  ! 89: MOVR_R	move	%r16, %r17, %r29
	.word 0x8abc0011  ! 89: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0xbabc2e71  ! 89: XNORcc_I	xnorcc 	%r16, 0x0e71, %r29
	.word 0x9d341011  ! 89: SRLX_R	srlx	%r16, %r17, %r14
thr2_dc_err_8:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_8), 16, 16),1,DC_DATA,39)
	.word 0xde1c0000  ! 91: LDD_R	ldd	[%r16 + %r0], %r15
	.word 0xf9f42011  ! 93: CASXA_R	casxa	[%r16]%asi, %r17, %r28
	.word 0x943c2ec7  ! 95: XNOR_I	xnor 	%r16, 0x0ec7, %r10
	.word 0x9d3c1011  ! 95: SRAX_R	srax	%r16, %r17, %r14
	.word 0x92340011  ! 95: ORN_R	orn 	%r16, %r17, %r9
	.word 0x8c040011  ! 95: ADD_R	add 	%r16, %r17, %r6
	.word 0xb43c0011  ! 95: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x9b643801  ! 95: MOVcc_I	<illegal instruction>
	.word 0xf504257f  ! 96: LDF_I	ld	[%r16, 0x057f], %f26
        wr %g0, 0x4, %fprs
	.word 0x944423a9  ! 100: ADDC_I	addc 	%r16, 0x03a9, %r10
	.word 0xb88c2404  ! 100: ANDcc_I	andcc 	%r16, 0x0404, %r28
	.word 0x842c0011  ! 100: ANDN_R	andn 	%r16, %r17, %r2
	.word 0xa6840011  ! 100: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x9ac40011  ! 100: ADDCcc_R	addccc 	%r16, %r17, %r13
thr2_dc_err_9:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_9), 16, 16),1,DC_DATA,30)
	.word 0xdd841000  ! 102: LDFA_R	lda	[%r16, %r0], %f14
	.word 0xc6c41011  ! 104: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r3
	.word 0xae0428ab  ! 106: ADD_I	add 	%r16, 0x08ab, %r23
	.word 0x8a842909  ! 106: ADDcc_I	addcc 	%r16, 0x0909, %r5
	.word 0x98140011  ! 106: OR_R	or 	%r16, %r17, %r12
	.word 0xb0942791  ! 106: ORcc_I	orcc 	%r16, 0x0791, %r24
	.word 0x8b7c2401  ! 106: MOVR_I	move	%r16, 0xfffffe34, %r5
	.word 0xb0b4258a  ! 106: ORNcc_I	orncc 	%r16, 0x058a, %r24
	.word 0xb9341011  ! 106: SRLX_R	srlx	%r16, %r17, %r28
	.word 0xb0142c27  ! 106: OR_I	or 	%r16, 0x0c27, %r24
	.word 0xcd941011  ! 107: LDQFA_R	-	[%r16, %r17], %f6
	.word 0xc4f42641  ! 109: STXA_I	stxa	%r2, [%r16 + 0x0641] %asi
	.word 0xbaac22ed  ! 111: ANDNcc_I	andncc 	%r16, 0x02ed, %r29
	.word 0x82840011  ! 111: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xaf341011  ! 111: SRLX_R	srlx	%r16, %r17, %r23
	.word 0x9e1c23d4  ! 111: XOR_I	xor 	%r16, 0x03d4, %r15
	.word 0x8a342c9e  ! 111: ORN_I	orn 	%r16, 0x0c9e, %r5
	.word 0x9f7c2401  ! 111: MOVR_I	move	%r16, 0xfffffe34, %r15
	.word 0xae3c21d0  ! 111: XNOR_I	xnor 	%r16, 0x01d0, %r23
	.word 0xfa542e15  ! 112: LDSH_I	ldsh	[%r16 + 0x0e15], %r29
thr2_irf_ce_11:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_11), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0x945c2904  ! 114: SMUL_I	smul 	%r16, 0x0904, %r10
	.word 0x88842eaa  ! 116: ADDcc_I	addcc 	%r16, 0x0eaa, %r4
	.word 0x912c3001  ! 116: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x96ac2f9f  ! 116: ANDNcc_I	andncc 	%r16, 0x0f9f, %r11
	.word 0x9b340011  ! 116: SRL_R	srl 	%r16, %r17, %r13
	.word 0x9e042358  ! 116: ADD_I	add 	%r16, 0x0358, %r15
	.word 0x84942c7f  ! 117: ORcc_I	orcc 	%r16, 0x0c7f, %r2
	.word 0x853c2001  ! 117: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0xb48c0011  ! 117: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0xae442ea1  ! 117: ADDC_I	addc 	%r16, 0x0ea1, %r23
	.word 0x82c429d5  ! 117: ADDCcc_I	addccc 	%r16, 0x09d5, %r1
	.word 0xb41c2513  ! 117: XOR_I	xor 	%r16, 0x0513, %r26
	.word 0x8b3c1011  ! 117: SRAX_R	srax	%r16, %r17, %r5
	rd      %pc, %r18
	set     0x20, %r17
thr2_dc_err_10:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_10), 16, 16),1,DC_DATA,31)
	.word 0xdcc41000  ! 118: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r14
	return     %r18 + 0x20
	.word 0x88440011  ! 121: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x92042fe0  ! 121: ADD_I	add 	%r16, 0x0fe0, %r9
	.word 0xa68c2a82  ! 121: ANDcc_I	andcc 	%r16, 0x0a82, %r19
	.word 0x953c2001  ! 121: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x8444266a  ! 121: ADDC_I	addc 	%r16, 0x066a, %r2
	.word 0x923c2adf  ! 121: XNOR_I	xnor 	%r16, 0x0adf, %r9
	.word 0xb48c2f11  ! 121: ANDcc_I	andcc 	%r16, 0x0f11, %r26
	.word 0xcccc1011  ! 122: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r6
thr2_irf_ce_12:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_12), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xdc1c2f44  ! 124: LDD_I	ldd	[%r16 + 0x0f44], %r14
	.word 0x8d2c3001  ! 126: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0x997c0411  ! 126: MOVR_R	move	%r16, %r17, %r12
	.word 0x90940011  ! 126: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x88bc255f  ! 126: XNORcc_I	xnorcc 	%r16, 0x055f, %r4
	.word 0x924423fe  ! 126: ADDC_I	addc 	%r16, 0x03fe, %r9
	.word 0x9604250b  ! 126: ADD_I	add 	%r16, 0x050b, %r11
	.word 0xaeb42dae  ! 126: ORNcc_I	orncc 	%r16, 0x0dae, %r23
	.word 0xde4c0011  ! 127: LDSB_R	ldsb	[%r16 + %r17], %r15
thr2_irf_ce_13:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_13), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xdd1429e4  ! 129: LDQF_I	-	[%r16, 0x09e4], %f14
	.word 0x8c340011  ! 131: ORN_R	orn 	%r16, %r17, %r6
	.word 0xb28c0011  ! 131: ANDcc_R	andcc 	%r16, %r17, %r25
	.word 0xb6c40011  ! 131: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x841c2a60  ! 131: XOR_I	xor 	%r16, 0x0a60, %r2
	.word 0x932c3001  ! 131: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0xf704276f  ! 132: LDF_I	ld	[%r16, 0x076f], %f27
!Illinst alu
	.word 0xa894286c  ! 134: ORcc_I	orcc 	%r16, 0x086c, %r20
	.word 0x923c2f40  ! 136: XNOR_I	xnor 	%r16, 0x0f40, %r9
	.word 0xa6140011  ! 136: OR_R	or 	%r16, %r17, %r19
	.word 0xb6142672  ! 136: OR_I	or 	%r16, 0x0672, %r27
	.word 0x8e3c0011  ! 136: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xb63c0011  ! 136: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0xf20429c0  ! 137: LDUW_I	lduw	[%r16 + 0x09c0], %r25
thr2_irf_ce_14:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_14), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xf0c41011  ! 139: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r24
	.word 0x960c2ad5  ! 141: AND_I	and 	%r16, 0x0ad5, %r11
	.word 0x86040011  ! 141: ADD_R	add 	%r16, %r17, %r3
	.word 0x86ac0011  ! 141: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0x869c0011  ! 141: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0xb0b40011  ! 141: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0xbac42944  ! 141: ADDCcc_I	addccc 	%r16, 0x0944, %r29
	.word 0xac2c2c20  ! 141: ANDN_I	andn 	%r16, 0x0c20, %r22
	.word 0x94c40011  ! 141: ADDCcc_R	addccc 	%r16, %r17, %r10
thr2_dc_err_11:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_11), 16, 16),1,DC_DATA,0)
	.word 0xda9c224a  ! 143: LDDA_I	ldda	[%r16, + 0x024a] %asi, %r13
	.word 0xde040011  ! 145: LDUW_R	lduw	[%r16 + %r17], %r15
	.word 0xa72c0011  ! 147: SLL_R	sll 	%r16, %r17, %r19
	.word 0xae3c0011  ! 147: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x99341011  ! 147: SRLX_R	srlx	%r16, %r17, %r12
	.word 0xb37c0411  ! 147: MOVR_R	move	%r16, %r17, %r25
	.word 0xa63c26f8  ! 147: XNOR_I	xnor 	%r16, 0x06f8, %r19
thr2_dc_err_12:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_12), 16, 16),1,DC_DATA,20)
	.word 0xeb042856  ! 149: LDF_I	ld	[%r16, 0x0856], %f21
	.word 0xce5c25cc  ! 151: LDX_I	ldx	[%r16 + 0x05cc], %r7
	.word 0xb8c42320  ! 153: ADDCcc_I	addccc 	%r16, 0x0320, %r28
	.word 0x9a940011  ! 153: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x8c4427a9  ! 153: ADDC_I	addc 	%r16, 0x07a9, %r6
	.word 0x900422e8  ! 153: ADD_I	add 	%r16, 0x02e8, %r8
	.word 0x95641811  ! 153: MOVcc_R	<illegal instruction>
	.word 0xae0c2340  ! 153: AND_I	and 	%r16, 0x0340, %r23
	.word 0x9f643801  ! 153: MOVcc_I	<illegal instruction>
	.word 0xaabc0011  ! 153: XNORcc_R	xnorcc 	%r16, %r17, %r21
thr2_dc_err_13:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_13), 16, 16),1,DC_DATA,29)
	.word 0xe80c28d1  ! 155: LDUB_I	ldub	[%r16 + 0x08d1], %r20
thr2_irf_ce_15:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_15), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xd19c1011  ! 157: LDDFA_R	ldda	[%r16, %r17], %f8
	.word 0x96342fcb  ! 159: ORN_I	orn 	%r16, 0x0fcb, %r11
	.word 0xaa1c0011  ! 159: XOR_R	xor 	%r16, %r17, %r21
	.word 0xa73c0011  ! 159: SRA_R	sra 	%r16, %r17, %r19
	.word 0x9f641811  ! 159: MOVcc_R	<illegal instruction>
	.word 0x84942957  ! 159: ORcc_I	orcc 	%r16, 0x0957, %r2
	.word 0xf2cc2fc8  ! 160: LDSBA_I	ldsba	[%r16, + 0x0fc8] %asi, %r25
thr2_irf_ce_16:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_16), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xc474257e  ! 164: STX_I	stx	%r2, [%r16 + 0x057e]
	.word 0x8a1429af  ! 166: OR_I	or 	%r16, 0x09af, %r5
	.word 0x94b4267d  ! 166: ORNcc_I	orncc 	%r16, 0x067d, %r10
	.word 0xb29c0011  ! 166: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0x9d643801  ! 166: MOVcc_I	<illegal instruction>
	.word 0x9e94247f  ! 166: ORcc_I	orcc 	%r16, 0x047f, %r15
	.word 0xb60c25a3  ! 166: AND_I	and 	%r16, 0x05a3, %r27
	.word 0x86c40011  ! 166: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0xea1c220a  ! 167: LDD_I	ldd	[%r16 + 0x020a], %r21
thr2_irf_ce_17:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_17), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xd07423a5  ! 171: STX_I	stx	%r8, [%r16 + 0x03a5]
	.word 0x873c0011  ! 173: SRA_R	sra 	%r16, %r17, %r3
	.word 0x9c2c0011  ! 173: ANDN_R	andn 	%r16, %r17, %r14
	.word 0xad2c0011  ! 173: SLL_R	sll 	%r16, %r17, %r22
	.word 0xa834283b  ! 173: ORN_I	orn 	%r16, 0x083b, %r20
	.word 0x9c842878  ! 173: ADDcc_I	addcc 	%r16, 0x0878, %r14
	.word 0xa6340011  ! 173: ORN_R	orn 	%r16, %r17, %r19
	.word 0xb3340011  ! 173: SRL_R	srl 	%r16, %r17, %r25
	.word 0xf2cc1011  ! 174: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r25
	.word 0xe8540011  ! 176: LDSH_R	ldsh	[%r16 + %r17], %r20
	.word 0x840c2917  ! 178: AND_I	and 	%r16, 0x0917, %r2
	.word 0xb63428e3  ! 178: ORN_I	orn 	%r16, 0x08e3, %r27
	.word 0x923c28a0  ! 178: XNOR_I	xnor 	%r16, 0x08a0, %r9
	.word 0xad341011  ! 178: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x892c2001  ! 178: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0xb57c2401  ! 178: MOVR_I	move	%r16, 0xfffffe34, %r26
	.word 0x86142db0  ! 178: OR_I	or 	%r16, 0x0db0, %r3
	.word 0xa93c1011  ! 178: SRAX_R	srax	%r16, %r17, %r20
	.word 0xdc1c2bd2  ! 179: LDD_I	ldd	[%r16 + 0x0bd2], %r14
thr2_irf_ce_18:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_18), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xf9140011  ! 181: LDQF_R	-	[%r16, %r17], %f28
	.word 0x88b40011  ! 183: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0xab643801  ! 183: MOVcc_I	<illegal instruction>
	.word 0x8b643801  ! 183: MOVcc_I	<illegal instruction>
	.word 0xa6c40011  ! 183: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x861c23d0  ! 183: XOR_I	xor 	%r16, 0x03d0, %r3
	.word 0x8e9c2dba  ! 183: XORcc_I	xorcc 	%r16, 0x0dba, %r7
	.word 0x86c40011  ! 183: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0xb2440011  ! 183: ADDC_R	addc 	%r16, %r17, %r25
	.word 0xd68c261c  ! 184: LDUBA_I	lduba	[%r16, + 0x061c] %asi, %r11
thr2_irf_ce_19:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_19), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xcc440011  ! 186: LDSW_R	ldsw	[%r16 + %r17], %r6
	.word 0x861c0011  ! 188: XOR_R	xor 	%r16, %r17, %r3
	.word 0x993c1011  ! 188: SRAX_R	srax	%r16, %r17, %r12
	.word 0xa7342001  ! 188: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0x9ebc0011  ! 188: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0xb60c0011  ! 188: AND_R	and 	%r16, %r17, %r27
	.word 0xa82c2bbb  ! 189: ANDN_I	andn 	%r16, 0x0bbb, %r20
	.word 0xad341011  ! 189: SRLX_R	srlx	%r16, %r17, %r22
	.word 0xb09c290c  ! 189: XORcc_I	xorcc 	%r16, 0x090c, %r24
	.word 0x87342001  ! 189: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0xbb641811  ! 189: MOVcc_R	<illegal instruction>
	.word 0x8f643801  ! 189: MOVcc_I	<illegal instruction>
	.word 0xac442cc6  ! 189: ADDC_I	addc 	%r16, 0x0cc6, %r22
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd45c23da  ! 189: LDX_I	ldx	[%r16 + 0x03da], %r10
thr2_irf_ce_20:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_20), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0x99641811  ! 192: MOVcc_R	<illegal instruction>
	.word 0x8c8c0011  ! 192: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0xb80c0011  ! 192: AND_R	and 	%r16, %r17, %r28
	.word 0x89340011  ! 192: SRL_R	srl 	%r16, %r17, %r4
	.word 0x8e3c0011  ! 192: XNOR_R	xnor 	%r16, %r17, %r7
thr2_dc_err_14:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_14), 16, 16),1,DC_DATA,62)
	.word 0xde841000  ! 194: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r15
thr2_irf_ce_21:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_21), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xca742984  ! 198: STX_I	stx	%r5, [%r16 + 0x0984]
	.word 0x94940011  ! 200: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0xac94246c  ! 200: ORcc_I	orcc 	%r16, 0x046c, %r22
	.word 0x8b3c0011  ! 200: SRA_R	sra 	%r16, %r17, %r5
	.word 0x820c2d49  ! 200: AND_I	and 	%r16, 0x0d49, %r1
	.word 0x8b7c2401  ! 200: MOVR_I	move	%r16, 0xfffffe34, %r5
	.word 0xa8c422e5  ! 200: ADDCcc_I	addccc 	%r16, 0x02e5, %r20
	.word 0x9e440011  ! 200: ADDC_R	addc 	%r16, %r17, %r15
	.word 0xb8040011  ! 200: ADD_R	add 	%r16, %r17, %r28
thr2_dc_err_15:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_15), 16, 16),1,DC_DATA,29)
	.word 0xf71c0000  ! 202: LDDF_R	ldd	[%r16, %r0], %f27
thr2_irf_ce_22:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_22), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xca540011  ! 204: LDSH_R	ldsh	[%r16 + %r17], %r5
	.word 0x84340011  ! 206: ORN_R	orn 	%r16, %r17, %r2
	.word 0x92c40011  ! 206: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xb4bc0011  ! 206: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0x9e940011  ! 206: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0xab7c2401  ! 206: MOVR_I	move	%r16, 0xfffffe34, %r21
	.word 0xd8c41011  ! 207: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r12
	.word 0xd51c271e  ! 209: LDDF_I	ldd	[%r16, 0x071e], %f10
	.word 0x9c142931  ! 211: OR_I	or 	%r16, 0x0931, %r14
	.word 0xad2c1011  ! 211: SLLX_R	sllx	%r16, %r17, %r22
	.word 0x87341011  ! 211: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x96340011  ! 211: ORN_R	orn 	%r16, %r17, %r11
	.word 0xae2c0011  ! 211: ANDN_R	andn 	%r16, %r17, %r23
	.word 0xb93c1011  ! 211: SRAX_R	srax	%r16, %r17, %r28
	.word 0x889c2973  ! 211: XORcc_I	xorcc 	%r16, 0x0973, %r4
	.word 0xa634214d  ! 211: ORN_I	orn 	%r16, 0x014d, %r19
thr2_dc_err_16:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_16), 16, 16),1,DC_DATA,65)
	.word 0xd7040000  ! 213: LDF_R	ld	[%r16, %r0], %f11
thr2_irf_ce_23:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_23), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xf3841011  ! 215: LDFA_R	lda	[%r16, %r17], %f25
	.word 0x8a8c0011  ! 217: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0xbaac2c05  ! 217: ANDNcc_I	andncc 	%r16, 0x0c05, %r29
	.word 0x9e9c0011  ! 217: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0xb4bc23a1  ! 217: XNORcc_I	xnorcc 	%r16, 0x03a1, %r26
	.word 0x8d342001  ! 217: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0xab3c0011  ! 217: SRA_R	sra 	%r16, %r17, %r21
	.word 0x8e8c0011  ! 217: ANDcc_R	andcc 	%r16, %r17, %r7
thr2_dc_err_17:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_17), 16, 16),1,DC_DATA,11)
	.word 0xdf1c0000  ! 219: LDDF_R	ldd	[%r16, %r0], %f15
thr2_irf_ce_24:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_24), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xef941011  ! 221: LDQFA_R	-	[%r16, %r17], %f23
	.word 0x849c0011  ! 223: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x8c440011  ! 223: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x912c1011  ! 223: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x82340011  ! 223: ORN_R	orn 	%r16, %r17, %r1
	.word 0x9a8c23c5  ! 223: ANDcc_I	andcc 	%r16, 0x03c5, %r13
	.word 0x8c140011  ! 223: OR_R	or 	%r16, %r17, %r6
	.word 0x973c0011  ! 223: SRA_R	sra 	%r16, %r17, %r11
	.word 0xaf341011  ! 223: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xe60c0011  ! 224: LDUB_R	ldub	[%r16 + %r17], %r19
	.word 0xc36c2210  ! 226: PREFETCH_I	prefetch	[%r16 + 0x0210], #one_read
	.word 0x8d3c1011  ! 228: SRAX_R	srax	%r16, %r17, %r6
	.word 0x932c0011  ! 228: SLL_R	sll 	%r16, %r17, %r9
	.word 0x992c0011  ! 228: SLL_R	sll 	%r16, %r17, %r12
	.word 0xa8b42991  ! 228: ORNcc_I	orncc 	%r16, 0x0991, %r20
	.word 0xa6ac0011  ! 228: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0x8f7c0411  ! 228: MOVR_R	move	%r16, %r17, %r7
	.word 0xb03c0011  ! 228: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0x992c0011  ! 228: SLL_R	sll 	%r16, %r17, %r12
	.word 0xd48c2c62  ! 229: LDUBA_I	lduba	[%r16, + 0x0c62] %asi, %r10
thr2_irf_ce_25:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_25), 16, 16),1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xd85c2089  ! 231: LDX_I	ldx	[%r16 + 0x0089], %r12
	.word 0x972c2001  ! 233: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0xac3c0011  ! 233: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x82ac0011  ! 233: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x88140011  ! 233: OR_R	or 	%r16, %r17, %r4
	.word 0x9c3c24b8  ! 233: XNOR_I	xnor 	%r16, 0x04b8, %r14
	.word 0x888c0011  ! 233: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0x96b40011  ! 233: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0xda140011  ! 234: LDUH_R	lduh	[%r16 + %r17], %r13
thr2_irf_ce_26:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_26), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0x81534000  ! 236: RDPR_OTHERWIN	rdpr	%otherwin, %r0
	.word 0x943c203a  ! 238: XNOR_I	xnor 	%r16, 0x003a, %r10
	.word 0x8a3c0011  ! 238: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x9eb420ba  ! 238: ORNcc_I	orncc 	%r16, 0x00ba, %r15
	.word 0xb7341011  ! 238: SRLX_R	srlx	%r16, %r17, %r27
	.word 0xb23c262d  ! 238: XNOR_I	xnor 	%r16, 0x062d, %r25
thr2_dc_err_18:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_18), 16, 16),1,DC_DATA,54)
	.word 0xc51c0000  ! 240: LDDF_R	ldd	[%r16, %r0], %f2
thr2_irf_ce_27:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_27), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xeac42e96  ! 242: LDSWA_I	ldswa	[%r16, + 0x0e96] %asi, %r21
	.word 0xbb7c2401  ! 244: MOVR_I	move	%r16, 0xfffffe34, %r29
	.word 0xae0c2daf  ! 244: AND_I	and 	%r16, 0x0daf, %r23
	.word 0xb9342001  ! 244: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0xab341011  ! 244: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x9b2c0011  ! 244: SLL_R	sll 	%r16, %r17, %r13
	.word 0x9e942e5f  ! 244: ORcc_I	orcc 	%r16, 0x0e5f, %r15
	.word 0x88042b91  ! 244: ADD_I	add 	%r16, 0x0b91, %r4
	.word 0xd4c42a12  ! 245: LDSWA_I	ldswa	[%r16, + 0x0a12] %asi, %r10
thr2_irf_ce_28:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_28), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xcc0c23e2  ! 247: LDUB_I	ldub	[%r16 + 0x03e2], %r6
	.word 0x973c0011  ! 249: SRA_R	sra 	%r16, %r17, %r11
	.word 0x893c2001  ! 249: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0x9c940011  ! 249: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0x8e8421d6  ! 249: ADDcc_I	addcc 	%r16, 0x01d6, %r7
	.word 0x989c0011  ! 249: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x94042041  ! 249: ADD_I	add 	%r16, 0x0041, %r10
	.word 0x9e8c0011  ! 249: ANDcc_R	andcc 	%r16, %r17, %r15
thr2_dc_err_19:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_19), 16, 16),1,DC_DATA,55)
	.word 0xee5c0000  ! 251: LDX_R	ldx	[%r16 + %r0], %r23
	.word 0xd51c2eb9  ! 253: LDDF_I	ldd	[%r16, 0x0eb9], %f10
	.word 0xba940011  ! 255: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x92bc0011  ! 255: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0xb6c42e5b  ! 255: ADDCcc_I	addccc 	%r16, 0x0e5b, %r27
	.word 0xa63c0011  ! 255: XNOR_R	xnor 	%r16, %r17, %r19
	.word 0xb4842656  ! 255: ADDcc_I	addcc 	%r16, 0x0656, %r26
	.word 0xdf040011  ! 256: LDF_R	ld	[%r16, %r17], %f15
!Illinst alu
	.word 0x9c94265a  ! 258: ORcc_I	orcc 	%r16, 0x065a, %r14
	.word 0x837c0411  ! 260: MOVR_R	move	%r16, %r17, %r1
	.word 0x92042a6c  ! 260: ADD_I	add 	%r16, 0x0a6c, %r9
	.word 0x90840011  ! 260: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x8e0c2cee  ! 260: AND_I	and 	%r16, 0x0cee, %r7
	.word 0x908c0011  ! 260: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0xb08c20f0  ! 260: ANDcc_I	andcc 	%r16, 0x00f0, %r24
	.word 0xb6040011  ! 260: ADD_R	add 	%r16, %r17, %r27
thr2_dc_err_20:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_20), 16, 16),1,DC_DATA,49)
	.word 0xe9941000  ! 262: LDQFA_R	-	[%r16, %r0], %f20
	.word 0xd85c0011  ! 264: LDX_R	ldx	[%r16 + %r17], %r12
	.word 0x972c2001  ! 266: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0xaeac2d5c  ! 266: ANDNcc_I	andncc 	%r16, 0x0d5c, %r23
	.word 0x8c3c0011  ! 266: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0xad342001  ! 266: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0x917c2401  ! 266: MOVR_I	move	%r16, 0xfffffe34, %r8
	.word 0x872c2001  ! 266: SLL_I	sll 	%r16, 0x0001, %r3
thr2_dc_err_21:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_21), 16, 16),1,DC_DATA,59)
	.word 0xc59c1000  ! 268: LDDFA_R	ldda	[%r16, %r0], %f2
	.word 0xd84425e6  ! 270: LDSW_I	ldsw	[%r16 + 0x05e6], %r12
	.word 0xb61c0011  ! 272: XOR_R	xor 	%r16, %r17, %r27
	.word 0x90bc0011  ! 272: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0xb52c3001  ! 272: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0x8ec4224a  ! 272: ADDCcc_I	addccc 	%r16, 0x024a, %r7
	.word 0xb09c0011  ! 272: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x9ec40011  ! 272: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0xef042fe9  ! 273: LDF_I	ld	[%r16, 0x0fe9], %f23
	.word 0xce4c2be5  ! 275: LDSB_I	ldsb	[%r16 + 0x0be5], %r7
	.word 0x8e0425bb  ! 277: ADD_I	add 	%r16, 0x05bb, %r7
	.word 0xa7643801  ! 277: MOVcc_I	<illegal instruction>
	.word 0x968c0011  ! 277: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x9a9c2a33  ! 277: XORcc_I	xorcc 	%r16, 0x0a33, %r13
	.word 0x8e0c22e5  ! 277: AND_I	and 	%r16, 0x02e5, %r7
	.word 0xc7140011  ! 278: LDQF_R	-	[%r16, %r17], %f3
	.word 0xc61425ba  ! 280: LDUH_I	lduh	[%r16 + 0x05ba], %r3
	.word 0xb2040011  ! 282: ADD_R	add 	%r16, %r17, %r25
	.word 0x9ec40011  ! 282: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x90842e53  ! 282: ADDcc_I	addcc 	%r16, 0x0e53, %r8
	.word 0xaa0c22e8  ! 282: AND_I	and 	%r16, 0x02e8, %r21
	.word 0xac840011  ! 282: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0xd44425ad  ! 283: LDSW_I	ldsw	[%r16 + 0x05ad], %r10
thr2_irf_ce_29:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_29), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xe89c23d3  ! 285: LDDA_I	ldda	[%r16, + 0x03d3] %asi, %r20
	.word 0x9b7c2401  ! 287: MOVR_I	move	%r16, 0xfffffe34, %r13
	.word 0x828c0011  ! 287: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x9a9c2429  ! 287: XORcc_I	xorcc 	%r16, 0x0429, %r13
	.word 0x9e840011  ! 287: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xaa940011  ! 287: ORcc_R	orcc 	%r16, %r17, %r21
thr2_dc_err_22:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_22), 16, 16),1,DC_DATA,69)
	.word 0xf104267e  ! 289: LDF_I	ld	[%r16, 0x067e], %f24
	.word 0xb2fc2872  ! 291: SDIVcc_I	sdivcc 	%r16, 0x0872, %r25
	.word 0x82040011  ! 293: ADD_R	add 	%r16, %r17, %r1
	.word 0xb444233e  ! 293: ADDC_I	addc 	%r16, 0x033e, %r26
	.word 0xb4842f80  ! 293: ADDcc_I	addcc 	%r16, 0x0f80, %r26
	.word 0x99342001  ! 293: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0xab342001  ! 293: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0xab2c2001  ! 293: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0x8a1c0011  ! 293: XOR_R	xor 	%r16, %r17, %r5
	.word 0xf71c0011  ! 294: LDDF_R	ldd	[%r16, %r17], %f27
	.word 0xd5040011  ! 296: LDF_R	ld	[%r16, %r17], %f10
	.word 0x843c2e80  ! 298: XNOR_I	xnor 	%r16, 0x0e80, %r2
	.word 0xb8bc2a3a  ! 298: XNORcc_I	xnorcc 	%r16, 0x0a3a, %r28
	.word 0x953c0011  ! 298: SRA_R	sra 	%r16, %r17, %r10
	.word 0x94940011  ! 298: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x8f3c2001  ! 298: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0xbb643801  ! 298: MOVcc_I	<illegal instruction>
thr2_dc_err_23:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_23), 16, 16),1,DC_DATA,5)
	.word 0xd7941000  ! 300: LDQFA_R	-	[%r16, %r0], %f11
thr2_irf_ce_30:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_30), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xd8fc1011  ! 302: SWAPA_R	swapa	%r12, [%r16 + %r17] 0x80
	.word 0x91342001  ! 304: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0x8c1c21c0  ! 304: XOR_I	xor 	%r16, 0x01c0, %r6
	.word 0x973c1011  ! 304: SRAX_R	srax	%r16, %r17, %r11
	.word 0xb6940011  ! 304: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x8a8c0011  ! 304: ANDcc_R	andcc 	%r16, %r17, %r5
thr2_dc_err_24:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_24), 16, 16),1,DC_DATA,35)
	.word 0xdf140000  ! 306: LDQF_R	-	[%r16, %r0], %f15
!Illinst store
	.word 0xd0740011  ! 308: STX_R	stx	%r8, [%r16 + %r17]
	.word 0xb2040011  ! 310: ADD_R	add 	%r16, %r17, %r25
	.word 0x94b42af4  ! 310: ORNcc_I	orncc 	%r16, 0x0af4, %r10
	.word 0x9f342001  ! 310: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x9a140011  ! 310: OR_R	or 	%r16, %r17, %r13
	.word 0xb43c0011  ! 310: XNOR_R	xnor 	%r16, %r17, %r26
thr2_dc_err_25:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_25), 16, 16),1,DC_DATA,53)
	.word 0xc6440000  ! 312: LDSW_R	ldsw	[%r16 + %r0], %r3
	.word 0xfb142c10  ! 314: LDQF_I	-	[%r16, 0x0c10], %f29
	.word 0xb6042ac8  ! 316: ADD_I	add 	%r16, 0x0ac8, %r27
	.word 0x8c9c2c4e  ! 316: XORcc_I	xorcc 	%r16, 0x0c4e, %r6
	.word 0xb4bc0011  ! 316: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0x9eb40011  ! 316: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x9e8c2188  ! 316: ANDcc_I	andcc 	%r16, 0x0188, %r15
	.word 0x84940011  ! 316: ORcc_R	orcc 	%r16, %r17, %r2
thr2_dc_err_26:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_26), 16, 16),1,DC_DATA,9)
	.word 0xd6140000  ! 318: LDUH_R	lduh	[%r16 + %r0], %r11
thr2_irf_ce_31:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_31), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xd29c1011  ! 320: LDDA_R	ldda	[%r16, %r17] 0x80, %r9
	.word 0x84842ef7  ! 322: ADDcc_I	addcc 	%r16, 0x0ef7, %r2
	.word 0x88b40011  ! 322: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0x908c2213  ! 322: ANDcc_I	andcc 	%r16, 0x0213, %r8
	.word 0x8c9c0011  ! 322: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0xae140011  ! 322: OR_R	or 	%r16, %r17, %r23
	.word 0x8e142463  ! 322: OR_I	or 	%r16, 0x0463, %r7
	.word 0xae1c2cea  ! 322: XOR_I	xor 	%r16, 0x0cea, %r23
	.word 0x863c0011  ! 322: XNOR_R	xnor 	%r16, %r17, %r3
thr2_dc_err_27:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_27), 16, 16),1,DC_DATA,25)
	.word 0xdadc1000  ! 324: LDXA_R	ldxa	[%r16, %r0] 0x80, %r13
	.word 0xe79c1011  ! 326: LDDFA_R	ldda	[%r16, %r17], %f19
	.word 0xb77c2401  ! 328: MOVR_I	move	%r16, 0xfffffe34, %r27
	.word 0xab341011  ! 328: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x8a9c0011  ! 328: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0x96840011  ! 328: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0x82440011  ! 328: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x992c2001  ! 328: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x948c2a4d  ! 328: ANDcc_I	andcc 	%r16, 0x0a4d, %r10
thr2_dc_err_28:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_28), 16, 16),1,DC_DATA,60)
	.word 0xdd941000  ! 330: LDQFA_R	-	[%r16, %r0], %f14
thr2_irf_ce_32:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_32), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xe88c1011  ! 332: LDUBA_R	lduba	[%r16, %r17] 0x80, %r20
	.word 0x8a840011  ! 334: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0xaf3c0011  ! 334: SRA_R	sra 	%r16, %r17, %r23
	.word 0x92bc2542  ! 334: XNORcc_I	xnorcc 	%r16, 0x0542, %r9
	.word 0x9a8c2a9b  ! 334: ANDcc_I	andcc 	%r16, 0x0a9b, %r13
	.word 0xb4940011  ! 334: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0x93341011  ! 334: SRLX_R	srlx	%r16, %r17, %r9
thr2_dc_err_29:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_29), 16, 16),1,DC_DATA,46)
	.word 0xd20c0000  ! 336: LDUB_R	ldub	[%r16 + %r0], %r9
thr2_irf_ce_33:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_33), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xc31c0011  ! 338: LDDF_R	ldd	[%r16, %r17], %f1
	.word 0x86ac2767  ! 340: ANDNcc_I	andncc 	%r16, 0x0767, %r3
	.word 0x85342001  ! 340: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x9f3c1011  ! 340: SRAX_R	srax	%r16, %r17, %r15
	.word 0x96142dbb  ! 340: OR_I	or 	%r16, 0x0dbb, %r11
	.word 0xb62c0011  ! 340: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x98940011  ! 340: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x8e0c0011  ! 340: AND_R	and 	%r16, %r17, %r7
	.word 0xf6d41011  ! 341: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r27
thr2_irf_ce_34:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_34), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xe6742d00  ! 345: STX_I	stx	%r19, [%r16 + 0x0d00]
	.word 0xaf643801  ! 347: MOVcc_I	<illegal instruction>
	.word 0x9e2c2c4a  ! 347: ANDN_I	andn 	%r16, 0x0c4a, %r15
	.word 0x8ac4246f  ! 347: ADDCcc_I	addccc 	%r16, 0x046f, %r5
	.word 0x873c0011  ! 347: SRA_R	sra 	%r16, %r17, %r3
	.word 0xa61c0011  ! 347: XOR_R	xor 	%r16, %r17, %r19
	.word 0x84ac2a99  ! 347: ANDNcc_I	andncc 	%r16, 0x0a99, %r2
	.word 0xf3042f2c  ! 348: LDF_I	ld	[%r16, 0x0f2c], %f25
	.word 0xf60c2ff8  ! 350: LDUB_I	ldub	[%r16 + 0x0ff8], %r27
	.word 0x893c1011  ! 352: SRAX_R	srax	%r16, %r17, %r4
	.word 0x993c0011  ! 352: SRA_R	sra 	%r16, %r17, %r12
	.word 0x8f3c0011  ! 352: SRA_R	sra 	%r16, %r17, %r7
	.word 0xaf641811  ! 352: MOVcc_R	<illegal instruction>
	.word 0x969429ce  ! 352: ORcc_I	orcc 	%r16, 0x09ce, %r11
	.word 0xd81c0011  ! 353: LDD_R	ldd	[%r16 + %r17], %r12
	.word 0xc7841011  ! 355: LDFA_R	lda	[%r16, %r17], %f3
	.word 0x937c2401  ! 357: MOVR_I	move	%r16, 0xfffffe34, %r9
	.word 0x8c9c2b8e  ! 357: XORcc_I	xorcc 	%r16, 0x0b8e, %r6
	.word 0x897c0411  ! 357: MOVR_R	move	%r16, %r17, %r4
	.word 0xb22c0011  ! 357: ANDN_R	andn 	%r16, %r17, %r25
	.word 0x8d7c0411  ! 357: MOVR_R	move	%r16, %r17, %r6
thr2_dc_err_30:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_30), 16, 16),1,DC_DATA,68)
	.word 0xc2c4262c  ! 359: LDSWA_I	ldswa	[%r16, + 0x062c] %asi, %r1
thr2_irf_ce_35:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_35), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xc2742787  ! 363: STX_I	stx	%r1, [%r16 + 0x0787]
	.word 0x88ac0011  ! 365: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x872c1011  ! 365: SLLX_R	sllx	%r16, %r17, %r3
	.word 0x84842fc5  ! 365: ADDcc_I	addcc 	%r16, 0x0fc5, %r2
	.word 0x8f340011  ! 365: SRL_R	srl 	%r16, %r17, %r7
	.word 0x889c2df7  ! 365: XORcc_I	xorcc 	%r16, 0x0df7, %r4
	.word 0xe91c2bb2  ! 366: LDDF_I	ldd	[%r16, 0x0bb2], %f20
thr2_irf_ce_36:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_36), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xcc242b87  ! 370: STW_I	stw	%r6, [%r16 + 0x0b87]
	.word 0xa8bc26ad  ! 372: XNORcc_I	xnorcc 	%r16, 0x06ad, %r20
	.word 0xb23c0011  ! 372: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0x937c0411  ! 372: MOVR_R	move	%r16, %r17, %r9
	.word 0x96ac2156  ! 372: ANDNcc_I	andncc 	%r16, 0x0156, %r11
	.word 0x9f7c0411  ! 372: MOVR_R	move	%r16, %r17, %r15
	.word 0x8e940011  ! 372: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0xb8c40011  ! 372: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0x84ac27f3  ! 372: ANDNcc_I	andncc 	%r16, 0x07f3, %r2
thr2_dc_err_31:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_31), 16, 16),1,DC_DATA,53)
	.word 0xdac41000  ! 374: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r13
	.word 0xc2442f24  ! 376: LDSW_I	ldsw	[%r16 + 0x0f24], %r1
	.word 0xba3c2f08  ! 378: XNOR_I	xnor 	%r16, 0x0f08, %r29
	.word 0x8b343001  ! 378: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0xad2c1011  ! 378: SLLX_R	sllx	%r16, %r17, %r22
	.word 0x82c4289e  ! 378: ADDCcc_I	addccc 	%r16, 0x089e, %r1
	.word 0x85641811  ! 378: MOVcc_R	<illegal instruction>
	.word 0xac9c0011  ! 378: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0xcc8c1011  ! 379: LDUBA_R	lduba	[%r16, %r17] 0x80, %r6
thr2_irf_ce_37:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_37), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0xad341011  ! 383: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x97641811  ! 383: MOVcc_R	<illegal instruction>
	.word 0x9a1c27a0  ! 383: XOR_I	xor 	%r16, 0x07a0, %r13
	.word 0xacbc0011  ! 383: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0xb5340011  ! 383: SRL_R	srl 	%r16, %r17, %r26
thr2_dc_err_32:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_32), 16, 16),1,DC_DATA,59)
	.word 0xe81c0000  ! 385: LDD_R	ldd	[%r16 + %r0], %r20
!Illinst store
	.word 0xce2c0011  ! 387: STB_R	stb	%r7, [%r16 + %r17]
	.word 0xac04298d  ! 389: ADD_I	add 	%r16, 0x098d, %r22
	.word 0x828423d1  ! 389: ADDcc_I	addcc 	%r16, 0x03d1, %r1
	.word 0x908c0011  ! 389: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0xb4bc0011  ! 389: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0x83340011  ! 389: SRL_R	srl 	%r16, %r17, %r1
	.word 0xaaac2170  ! 389: ANDNcc_I	andncc 	%r16, 0x0170, %r21
	.word 0xd11c2526  ! 390: LDDF_I	ldd	[%r16, 0x0526], %f8
thr2_irf_ce_38:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_38), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
        wr %g0, 0x4, %fprs
	.word 0x928c0011  ! 394: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0x94c40011  ! 394: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x9b343001  ! 394: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xacb423b4  ! 394: ORNcc_I	orncc 	%r16, 0x03b4, %r22
	.word 0x90b40011  ! 394: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x932c3001  ! 394: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x8d3c0011  ! 394: SRA_R	sra 	%r16, %r17, %r6
	.word 0x9e8c2db6  ! 394: ANDcc_I	andcc 	%r16, 0x0db6, %r15
thr2_dc_err_33:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_33), 16, 16),1,DC_DATA,47)
	.word 0xc2142c54  ! 396: LDUH_I	lduh	[%r16 + 0x0c54], %r1
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0x8a3423b7  ! 400: ORN_I	orn 	%r16, 0x03b7, %r5
	.word 0x9c1423ff  ! 400: OR_I	or 	%r16, 0x03ff, %r14
	.word 0x948c24c0  ! 400: ANDcc_I	andcc 	%r16, 0x04c0, %r10
	.word 0x9c2c2866  ! 400: ANDN_I	andn 	%r16, 0x0866, %r14
	.word 0xb0b42010  ! 400: ORNcc_I	orncc 	%r16, 0x0010, %r24
	.word 0xd81c0011  ! 401: LDD_R	ldd	[%r16 + %r17], %r12
thr2_irf_ce_39:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_39), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
        wr %g0, 0x4, %fprs
	.word 0x88142454  ! 405: OR_I	or 	%r16, 0x0454, %r4
	.word 0x8c2c2079  ! 405: ANDN_I	andn 	%r16, 0x0079, %r6
	.word 0x9c9c0011  ! 405: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0xaf341011  ! 405: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xba940011  ! 405: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0xa8ac2331  ! 405: ANDNcc_I	andncc 	%r16, 0x0331, %r20
	.word 0xb8b40011  ! 405: ORNcc_R	orncc 	%r16, %r17, %r28
	.word 0x9c840011  ! 405: ADDcc_R	addcc 	%r16, %r17, %r14
thr2_dc_err_34:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_34), 16, 16),1,DC_DATA,12)
	.word 0xea042a9c  ! 407: LDUW_I	lduw	[%r16 + 0x0a9c], %r21
	.word 0xc65c2bc0  ! 409: LDX_I	ldx	[%r16 + 0x0bc0], %r3
	.word 0x89343001  ! 411: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0xac140011  ! 411: OR_R	or 	%r16, %r17, %r22
	.word 0x86840011  ! 411: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0xba140011  ! 411: OR_R	or 	%r16, %r17, %r29
	.word 0xa8c40011  ! 411: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x8e9c0011  ! 411: XORcc_R	xorcc 	%r16, %r17, %r7
thr2_dc_err_35:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_35), 16, 16),1,DC_DATA,40)
	.word 0xdf140000  ! 413: LDQF_R	-	[%r16, %r0], %f15
thr2_irf_ce_40:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_40), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xf2a41011  ! 415: STWA_R	stwa	%r25, [%r16 + %r17] 0x80
	.word 0x9e040011  ! 417: ADD_R	add 	%r16, %r17, %r15
	.word 0xba3c2aea  ! 417: XNOR_I	xnor 	%r16, 0x0aea, %r29
	.word 0xb88c2a02  ! 417: ANDcc_I	andcc 	%r16, 0x0a02, %r28
	.word 0x90940011  ! 417: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x963c244e  ! 417: XNOR_I	xnor 	%r16, 0x044e, %r11
	.word 0xad641811  ! 417: MOVcc_R	<illegal instruction>
thr2_dc_err_36:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_36), 16, 16),1,DC_DATA,64)
	.word 0xd504204d  ! 419: LDF_I	ld	[%r16, 0x004d], %f10
	.word 0xc91c26f8  ! 421: LDDF_I	ldd	[%r16, 0x06f8], %f4
	.word 0x9b7c2401  ! 423: MOVR_I	move	%r16, 0xfffffe34, %r13
	.word 0x9c042c49  ! 423: ADD_I	add 	%r16, 0x0c49, %r14
	.word 0xacac2000  ! 423: ANDNcc_I	andncc 	%r16, 0x0000, %r22
	.word 0xb2040011  ! 423: ADD_R	add 	%r16, %r17, %r25
	.word 0xaac42fbd  ! 423: ADDCcc_I	addccc 	%r16, 0x0fbd, %r21
	.word 0x89343001  ! 423: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x8c1c0011  ! 423: XOR_R	xor 	%r16, %r17, %r6
	.word 0xd08429b9  ! 424: LDUWA_I	lduwa	[%r16, + 0x09b9] %asi, %r8
	.word 0xd31425f6  ! 426: LDQF_I	-	[%r16, 0x05f6], %f9
	.word 0xb82c0011  ! 428: ANDN_R	andn 	%r16, %r17, %r28
	.word 0x8d341011  ! 428: SRLX_R	srlx	%r16, %r17, %r6
	.word 0x84440011  ! 428: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x8a1c0011  ! 428: XOR_R	xor 	%r16, %r17, %r5
	.word 0x8e94214f  ! 428: ORcc_I	orcc 	%r16, 0x014f, %r7
	.word 0x96440011  ! 428: ADDC_R	addc 	%r16, %r17, %r11
	.word 0xec4c233c  ! 429: LDSB_I	ldsb	[%r16 + 0x033c], %r22
thr2_irf_ce_41:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_41), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xf5142157  ! 431: LDQF_I	-	[%r16, 0x0157], %f26
	.word 0x97341011  ! 433: SRLX_R	srlx	%r16, %r17, %r11
	.word 0xb1643801  ! 433: MOVcc_I	<illegal instruction>
	.word 0xb0442a76  ! 433: ADDC_I	addc 	%r16, 0x0a76, %r24
	.word 0x872c1011  ! 433: SLLX_R	sllx	%r16, %r17, %r3
	.word 0x848c2b0a  ! 433: ANDcc_I	andcc 	%r16, 0x0b0a, %r2
	.word 0xb6b40011  ! 433: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0xb4c40011  ! 433: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0xb7643801  ! 433: MOVcc_I	<illegal instruction>
	.word 0xced41011  ! 434: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r7
thr2_irf_ce_42:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_42), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xd3140011  ! 436: LDQF_R	-	[%r16, %r17], %f9
	.word 0xacac0011  ! 438: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0x92042e30  ! 438: ADD_I	add 	%r16, 0x0e30, %r9
	.word 0x8494258a  ! 438: ORcc_I	orcc 	%r16, 0x058a, %r2
	.word 0xb6c42cf1  ! 438: ADDCcc_I	addccc 	%r16, 0x0cf1, %r27
	.word 0xa89c0011  ! 438: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0x989c2568  ! 438: XORcc_I	xorcc 	%r16, 0x0568, %r12
	.word 0xae1c0011  ! 438: XOR_R	xor 	%r16, %r17, %r23
	.word 0xc2941011  ! 439: LDUHA_R	lduha	[%r16, %r17] 0x80, %r1
	.word 0x824c2eef  ! 441: MULX_I	mulx 	%r16, 0x0eef, %r1
	.word 0xa6bc2917  ! 443: XNORcc_I	xnorcc 	%r16, 0x0917, %r19
	.word 0x98ac2f40  ! 443: ANDNcc_I	andncc 	%r16, 0x0f40, %r12
	.word 0x92342245  ! 443: ORN_I	orn 	%r16, 0x0245, %r9
	.word 0x869c277d  ! 443: XORcc_I	xorcc 	%r16, 0x077d, %r3
	.word 0x9eac203f  ! 443: ANDNcc_I	andncc 	%r16, 0x003f, %r15
	.word 0xaa0c2d60  ! 443: AND_I	and 	%r16, 0x0d60, %r21
	.word 0x8e440011  ! 443: ADDC_R	addc 	%r16, %r17, %r7
thr2_dc_err_37:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_37), 16, 16),1,DC_DATA,46)
	.word 0xf81c2391  ! 445: LDD_I	ldd	[%r16 + 0x0391], %r28
	.word 0xd11c2371  ! 447: LDDF_I	ldd	[%r16, 0x0371], %f8
	.word 0x9abc0011  ! 449: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x9c9c0011  ! 449: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x96b40011  ! 449: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0xb09c0011  ! 449: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x843c2a8a  ! 449: XNOR_I	xnor 	%r16, 0x0a8a, %r2
	.word 0xb4ac2334  ! 449: ANDNcc_I	andncc 	%r16, 0x0334, %r26
thr2_dc_err_38:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_38), 16, 16),1,DC_DATA,29)
	.word 0xec5c0000  ! 451: LDX_R	ldx	[%r16 + %r0], %r22
	.word 0xd88c1011  ! 453: LDUBA_R	lduba	[%r16, %r17] 0x80, %r12
	.word 0xa6942347  ! 455: ORcc_I	orcc 	%r16, 0x0347, %r19
	.word 0xa60c0011  ! 455: AND_R	and 	%r16, %r17, %r19
	.word 0xac4429af  ! 455: ADDC_I	addc 	%r16, 0x09af, %r22
	.word 0x9eac0011  ! 455: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x9084282e  ! 455: ADDcc_I	addcc 	%r16, 0x082e, %r8
	.word 0xa6b40011  ! 455: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0xec5c0011  ! 456: LDX_R	ldx	[%r16 + %r17], %r22
thr2_irf_ce_43:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_43), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xc71c2d80  ! 458: LDDF_I	ldd	[%r16, 0x0d80], %f3
	.word 0xb4942c4f  ! 460: ORcc_I	orcc 	%r16, 0x0c4f, %r26
	.word 0x908c266e  ! 460: ANDcc_I	andcc 	%r16, 0x066e, %r8
	.word 0x980c0011  ! 460: AND_R	and 	%r16, %r17, %r12
	.word 0x933c2001  ! 460: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x8f340011  ! 460: SRL_R	srl 	%r16, %r17, %r7
	.word 0x8aac0011  ! 460: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x8f2c1011  ! 460: SLLX_R	sllx	%r16, %r17, %r7
	.word 0xc9841011  ! 461: LDFA_R	lda	[%r16, %r17], %f4
thr2_irf_ce_44:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_44), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0xac940011  ! 465: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0x832c3001  ! 465: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x8c142826  ! 465: OR_I	or 	%r16, 0x0826, %r6
	.word 0xb88c2535  ! 465: ANDcc_I	andcc 	%r16, 0x0535, %r28
	.word 0x9cb40011  ! 465: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0xb40c0011  ! 466: AND_R	and 	%r16, %r17, %r26
	.word 0xb2940011  ! 466: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0x943c27a1  ! 466: XNOR_I	xnor 	%r16, 0x07a1, %r10
	.word 0x92ac2881  ! 466: ANDNcc_I	andncc 	%r16, 0x0881, %r9
	.word 0xaabc0011  ! 466: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0x833c2001  ! 466: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0xaa842694  ! 466: ADDcc_I	addcc 	%r16, 0x0694, %r21
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd3941011  ! 466: LDQFA_R	-	[%r16, %r17], %f9
thr2_irf_ce_45:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_45), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0x8e8429e0  ! 469: ADDcc_I	addcc 	%r16, 0x09e0, %r7
	.word 0x9ac40011  ! 469: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xa8140011  ! 469: OR_R	or 	%r16, %r17, %r20
	.word 0x889c2252  ! 469: XORcc_I	xorcc 	%r16, 0x0252, %r4
	.word 0x94942bf4  ! 469: ORcc_I	orcc 	%r16, 0x0bf4, %r10
	.word 0x962c0011  ! 469: ANDN_R	andn 	%r16, %r17, %r11
	.word 0xa8b42c90  ! 469: ORNcc_I	orncc 	%r16, 0x0c90, %r20
	.word 0x983420ea  ! 469: ORN_I	orn 	%r16, 0x00ea, %r12
thr2_dc_err_39:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_39), 16, 16),1,DC_DATA,28)
	.word 0xd81c2560  ! 471: LDD_I	ldd	[%r16 + 0x0560], %r12
thr2_irf_ce_46:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_46), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xd80423c5  ! 473: LDUW_I	lduw	[%r16 + 0x03c5], %r12
	.word 0x872c2001  ! 475: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x981c0011  ! 475: XOR_R	xor 	%r16, %r17, %r12
	.word 0x93643801  ! 475: MOVcc_I	<illegal instruction>
	.word 0xb42c0011  ! 475: ANDN_R	andn 	%r16, %r17, %r26
	.word 0x9f341011  ! 475: SRLX_R	srlx	%r16, %r17, %r15
thr2_dc_err_40:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_40), 16, 16),1,DC_DATA,36)
	.word 0xec0c200e  ! 477: LDUB_I	ldub	[%r16 + 0x000e], %r22
!Illinst alu
	.word 0xaca40011  ! 479: SUBcc_R	subcc 	%r16, %r17, %r22
	.word 0xaf341011  ! 481: SRLX_R	srlx	%r16, %r17, %r23
	.word 0x98340011  ! 481: ORN_R	orn 	%r16, %r17, %r12
	.word 0x83641811  ! 481: MOVcc_R	<illegal instruction>
	.word 0x9a3c0011  ! 481: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0xb8c423da  ! 481: ADDCcc_I	addccc 	%r16, 0x03da, %r28
	.word 0x841c232b  ! 481: XOR_I	xor 	%r16, 0x032b, %r2
	.word 0x8cc40011  ! 481: ADDCcc_R	addccc 	%r16, %r17, %r6
thr2_dc_err_41:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_41), 16, 16),1,DC_DATA,61)
	.word 0xc68c1000  ! 483: LDUBA_R	lduba	[%r16, %r0] 0x80, %r3
thr2_irf_ce_47:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_47), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xec7429fa  ! 487: STX_I	stx	%r22, [%r16 + 0x09fa]
	.word 0xb72c3001  ! 489: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0xb7341011  ! 489: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x92440011  ! 489: ADDC_R	addc 	%r16, %r17, %r9
	.word 0xaa0c0011  ! 489: AND_R	and 	%r16, %r17, %r21
	.word 0xbb343001  ! 489: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0x8d3c0011  ! 489: SRA_R	sra 	%r16, %r17, %r6
	.word 0x93641811  ! 489: MOVcc_R	<illegal instruction>
	.word 0x912c2001  ! 489: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0xca1c0011  ! 490: LDD_R	ldd	[%r16 + %r17], %r5
thr2_irf_ce_48:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_48), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	wr      %r0, 0x5, %asr26
	.word 0xa72c1011  ! 494: SLLX_R	sllx	%r16, %r17, %r19
	.word 0xacb40011  ! 494: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0x8a84210a  ! 494: ADDcc_I	addcc 	%r16, 0x010a, %r5
	.word 0x8a840011  ! 494: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x9414231a  ! 494: OR_I	or 	%r16, 0x031a, %r10
	.word 0x9ac40011  ! 494: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x86b42a54  ! 494: ORNcc_I	orncc 	%r16, 0x0a54, %r3
	.word 0x86842dfa  ! 494: ADDcc_I	addcc 	%r16, 0x0dfa, %r3
thr2_dc_err_42:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_42), 16, 16),1,DC_DATA,14)
	.word 0xd91c0000  ! 496: LDDF_R	ldd	[%r16, %r0], %f12
thr2_irf_ce_49:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_49), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0x81dc27e6  ! 498: FLUSH_I	flush
	.word 0x8a342542  ! 500: ORN_I	orn 	%r16, 0x0542, %r5
	.word 0x880c0011  ! 500: AND_R	and 	%r16, %r17, %r4
	.word 0xa6ac0011  ! 500: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0x82840011  ! 500: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xb52c3001  ! 500: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xb42c21d3  ! 500: ANDN_I	andn 	%r16, 0x01d3, %r26
	.word 0xdac41011  ! 501: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r13
	.word 0xcb9c1011  ! 503: LDDFA_R	ldda	[%r16, %r17], %f5
	.word 0x8a040011  ! 505: ADD_R	add 	%r16, %r17, %r5
	.word 0xb4ac2305  ! 505: ANDNcc_I	andncc 	%r16, 0x0305, %r26
	.word 0xb6840011  ! 505: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0x9c0c0011  ! 505: AND_R	and 	%r16, %r17, %r14
	.word 0xae9c0011  ! 505: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x832c3001  ! 505: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0xda941011  ! 506: LDUHA_R	lduha	[%r16, %r17] 0x80, %r13
thr2_irf_ce_50:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_50), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xd9042dd1  ! 508: LDF_I	ld	[%r16, 0x0dd1], %f12
	.word 0x8cc42039  ! 510: ADDCcc_I	addccc 	%r16, 0x0039, %r6
	.word 0xac1c22c1  ! 510: XOR_I	xor 	%r16, 0x02c1, %r22
	.word 0x9c142fc9  ! 510: OR_I	or 	%r16, 0x0fc9, %r14
	.word 0x8b342001  ! 510: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0xbb341011  ! 510: SRLX_R	srlx	%r16, %r17, %r29
	.word 0xaf7c0411  ! 510: MOVR_R	move	%r16, %r17, %r23
thr2_dc_err_43:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_43), 16, 16),1,DC_DATA,61)
	.word 0xd0c428e6  ! 512: LDSWA_I	ldswa	[%r16, + 0x08e6] %asi, %r8
thr2_irf_ce_51:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_51), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xccdc2ad2  ! 514: LDXA_I	ldxa	[%r16, + 0x0ad2] %asi, %r6
	.word 0x988c29a0  ! 516: ANDcc_I	andcc 	%r16, 0x09a0, %r12
	.word 0xb92c1011  ! 516: SLLX_R	sllx	%r16, %r17, %r28
	.word 0x97340011  ! 516: SRL_R	srl 	%r16, %r17, %r11
	.word 0x840c2529  ! 516: AND_I	and 	%r16, 0x0529, %r2
	.word 0x96bc2c3a  ! 516: XNORcc_I	xnorcc 	%r16, 0x0c3a, %r11
	.word 0x84040011  ! 516: ADD_R	add 	%r16, %r17, %r2
	.word 0x98340011  ! 516: ORN_R	orn 	%r16, %r17, %r12
	.word 0xf19c1011  ! 517: LDDFA_R	ldda	[%r16, %r17], %f24
	.word 0xf49c1011  ! 519: LDDA_R	ldda	[%r16, %r17] 0x80, %r26
	.word 0xb41c21b7  ! 521: XOR_I	xor 	%r16, 0x01b7, %r26
	.word 0xa73c2001  ! 521: SRA_I	sra 	%r16, 0x0001, %r19
	.word 0xb4140011  ! 521: OR_R	or 	%r16, %r17, %r26
	.word 0xb13c2001  ! 521: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0x98b42af4  ! 521: ORNcc_I	orncc 	%r16, 0x0af4, %r12
	.word 0x89641811  ! 521: MOVcc_R	<illegal instruction>
	.word 0xdc4c2428  ! 522: LDSB_I	ldsb	[%r16 + 0x0428], %r14
	.word 0xcad41011  ! 524: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r5
	.word 0xaa940011  ! 526: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0xb9341011  ! 526: SRLX_R	srlx	%r16, %r17, %r28
	.word 0xae140011  ! 526: OR_R	or 	%r16, %r17, %r23
	.word 0xaa2c2a22  ! 526: ANDN_I	andn 	%r16, 0x0a22, %r21
	.word 0xb1643801  ! 526: MOVcc_I	<illegal instruction>
	.word 0x8eb42b53  ! 526: ORNcc_I	orncc 	%r16, 0x0b53, %r7
	.word 0xdc8c1011  ! 527: LDUBA_R	lduba	[%r16, %r17] 0x80, %r14
thr2_irf_ce_52:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_52), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xc8c41011  ! 529: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r4
	.word 0x8e842e69  ! 531: ADDcc_I	addcc 	%r16, 0x0e69, %r7
	.word 0xb62c0011  ! 531: ANDN_R	andn 	%r16, %r17, %r27
	.word 0xba0c0011  ! 531: AND_R	and 	%r16, %r17, %r29
	.word 0x8e1c0011  ! 531: XOR_R	xor 	%r16, %r17, %r7
	.word 0x8ec42ce2  ! 531: ADDCcc_I	addccc 	%r16, 0x0ce2, %r7
thr2_dc_err_44:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_44), 16, 16),1,DC_DATA,57)
	.word 0xd8841000  ! 533: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r12
thr2_irf_ce_53:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_53), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xe80c21a9  ! 535: LDUB_I	ldub	[%r16 + 0x01a9], %r20
	.word 0xad2c0011  ! 537: SLL_R	sll 	%r16, %r17, %r22
	.word 0x862c2934  ! 537: ANDN_I	andn 	%r16, 0x0934, %r3
	.word 0x922c0011  ! 537: ANDN_R	andn 	%r16, %r17, %r9
	.word 0x908c2948  ! 537: ANDcc_I	andcc 	%r16, 0x0948, %r8
	.word 0x90ac2a6c  ! 537: ANDNcc_I	andncc 	%r16, 0x0a6c, %r8
	.word 0x9a1c2206  ! 537: XOR_I	xor 	%r16, 0x0206, %r13
	.word 0x88c40011  ! 537: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xae342324  ! 537: ORN_I	orn 	%r16, 0x0324, %r23
	.word 0xcd040011  ! 538: LDF_R	ld	[%r16, %r17], %f6
!Illinst store
	.word 0xf2240011  ! 540: STW_R	stw	%r25, [%r16 + %r17]
	.word 0x91643801  ! 542: MOVcc_I	<illegal instruction>
	.word 0x852c2001  ! 542: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x893c1011  ! 542: SRAX_R	srax	%r16, %r17, %r4
	.word 0x9ebc260a  ! 542: XNORcc_I	xnorcc 	%r16, 0x060a, %r15
	.word 0x98140011  ! 542: OR_R	or 	%r16, %r17, %r12
	.word 0x9e1c2eee  ! 542: XOR_I	xor 	%r16, 0x0eee, %r15
	.word 0x9e140011  ! 542: OR_R	or 	%r16, %r17, %r15
	.word 0xde040011  ! 543: LDUW_R	lduw	[%r16 + %r17], %r15
thr2_irf_ce_54:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_54), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xd48c1011  ! 545: LDUBA_R	lduba	[%r16, %r17] 0x80, %r10
	.word 0xb1343001  ! 547: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0x9a8c24a9  ! 547: ANDcc_I	andcc 	%r16, 0x04a9, %r13
	.word 0x90c420d2  ! 547: ADDCcc_I	addccc 	%r16, 0x00d2, %r8
	.word 0x88b42ca0  ! 547: ORNcc_I	orncc 	%r16, 0x0ca0, %r4
	.word 0xae0c0011  ! 547: AND_R	and 	%r16, %r17, %r23
	.word 0x8e9c0011  ! 547: XORcc_R	xorcc 	%r16, %r17, %r7
thr2_dc_err_45:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_45), 16, 16),1,DC_DATA,30)
	.word 0xc80c269a  ! 549: LDUB_I	ldub	[%r16 + 0x069a], %r4
	.word 0xf9042c6b  ! 551: LDF_I	ld	[%r16, 0x0c6b], %f28
	.word 0x912c2001  ! 553: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0x921c2624  ! 553: XOR_I	xor 	%r16, 0x0624, %r9
	.word 0xa7641811  ! 553: MOVcc_R	<illegal instruction>
	.word 0xb4c40011  ! 553: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0x98b40011  ! 553: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x84942670  ! 553: ORcc_I	orcc 	%r16, 0x0670, %r2
thr2_dc_err_46:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_46), 16, 16),1,DC_DATA,63)
	.word 0xf41c26e4  ! 555: LDD_I	ldd	[%r16 + 0x06e4], %r26
thr2_irf_ce_55:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_55), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xd0dc1011  ! 557: LDXA_R	ldxa	[%r16, %r17] 0x80, %r8
	.word 0xa6340011  ! 559: ORN_R	orn 	%r16, %r17, %r19
	.word 0x98840011  ! 559: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x849c28a7  ! 559: XORcc_I	xorcc 	%r16, 0x08a7, %r2
	.word 0xb8440011  ! 559: ADDC_R	addc 	%r16, %r17, %r28
	.word 0xac0c0011  ! 559: AND_R	and 	%r16, %r17, %r22
	.word 0x8e3c0011  ! 559: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xb01c2b74  ! 559: XOR_I	xor 	%r16, 0x0b74, %r24
thr2_dc_err_47:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_47), 16, 16),1,DC_DATA,62)
	.word 0xdc440000  ! 561: LDSW_R	ldsw	[%r16 + %r0], %r14
thr2_irf_ce_56:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_56), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xd2c41011  ! 563: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r9
	.word 0x90042687  ! 565: ADD_I	add 	%r16, 0x0687, %r8
	.word 0x8eb42e03  ! 565: ORNcc_I	orncc 	%r16, 0x0e03, %r7
	.word 0xb93c2001  ! 565: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0x822c0011  ! 565: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x900c0011  ! 565: AND_R	and 	%r16, %r17, %r8
	.word 0x882c282c  ! 565: ANDN_I	andn 	%r16, 0x082c, %r4
	.word 0x8a0c2a07  ! 565: AND_I	and 	%r16, 0x0a07, %r5
	.word 0xd79c1011  ! 566: LDDFA_R	ldda	[%r16, %r17], %f11
	.word 0xeb1424b2  ! 568: LDQF_I	-	[%r16, 0x04b2], %f21
	.word 0x8b7c0411  ! 570: MOVR_R	move	%r16, %r17, %r5
	.word 0x98c40011  ! 570: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0xae140011  ! 570: OR_R	or 	%r16, %r17, %r23
	.word 0x84c40011  ! 570: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x8a940011  ! 570: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x8ac40011  ! 570: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x943c2c23  ! 570: XNOR_I	xnor 	%r16, 0x0c23, %r10
	.word 0xa93c0011  ! 570: SRA_R	sra 	%r16, %r17, %r20
	.word 0xf9841011  ! 571: LDFA_R	lda	[%r16, %r17], %f28
thr2_irf_ce_57:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_57), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xc61c214c  ! 573: LDD_I	ldd	[%r16 + 0x014c], %r3
	.word 0x94c40011  ! 575: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x993c2001  ! 575: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x903c0011  ! 575: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x953c1011  ! 575: SRAX_R	srax	%r16, %r17, %r10
	.word 0xb6942486  ! 575: ORcc_I	orcc 	%r16, 0x0486, %r27
	.word 0x91340011  ! 575: SRL_R	srl 	%r16, %r17, %r8
	.word 0xaeb422c5  ! 575: ORNcc_I	orncc 	%r16, 0x02c5, %r23
	.word 0xd7941011  ! 576: LDQFA_R	-	[%r16, %r17], %f11
thr2_irf_ce_58:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_58), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xcccc1011  ! 578: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r6
	.word 0x923c249d  ! 580: XNOR_I	xnor 	%r16, 0x049d, %r9
	.word 0x9a9c22d3  ! 580: XORcc_I	xorcc 	%r16, 0x02d3, %r13
	.word 0x9eac269e  ! 580: ANDNcc_I	andncc 	%r16, 0x069e, %r15
	.word 0x92442157  ! 580: ADDC_I	addc 	%r16, 0x0157, %r9
	.word 0x909426b9  ! 580: ORcc_I	orcc 	%r16, 0x06b9, %r8
	.word 0x98c40011  ! 580: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x923422bf  ! 580: ORN_I	orn 	%r16, 0x02bf, %r9
	.word 0xea1c0011  ! 581: LDD_R	ldd	[%r16 + %r17], %r21
	.word 0xcd1c0011  ! 583: LDDF_R	ldd	[%r16, %r17], %f6
	.word 0x822c2fdc  ! 585: ANDN_I	andn 	%r16, 0x0fdc, %r1
	.word 0x973c1011  ! 585: SRAX_R	srax	%r16, %r17, %r11
	.word 0x8f7c2401  ! 585: MOVR_I	move	%r16, 0xfffffe34, %r7
	.word 0x873c0011  ! 585: SRA_R	sra 	%r16, %r17, %r3
	.word 0xb72c3001  ! 585: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0x85341011  ! 585: SRLX_R	srlx	%r16, %r17, %r2
	.word 0x873c1011  ! 585: SRAX_R	srax	%r16, %r17, %r3
thr2_dc_err_48:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_48), 16, 16),1,DC_DATA,22)
	.word 0xda1c2e4d  ! 587: LDD_I	ldd	[%r16 + 0x0e4d], %r13
thr2_irf_ce_59:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_59), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xc2542b0c  ! 589: LDSH_I	ldsh	[%r16 + 0x0b0c], %r1
	.word 0xaac40011  ! 591: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0xb48c2c52  ! 591: ANDcc_I	andcc 	%r16, 0x0c52, %r26
	.word 0x88040011  ! 591: ADD_R	add 	%r16, %r17, %r4
	.word 0x933c2001  ! 591: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0xa72c3001  ! 591: SLLX_I	sllx	%r16, 0x0001, %r19
thr2_dc_err_49:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_49), 16, 16),1,DC_DATA,55)
	.word 0xcf841000  ! 593: LDFA_R	lda	[%r16, %r0], %f7
	.word 0xce442a74  ! 595: LDSW_I	ldsw	[%r16 + 0x0a74], %r7
	.word 0xb40c2c37  ! 597: AND_I	and 	%r16, 0x0c37, %r26
	.word 0xad7c0411  ! 597: MOVR_R	move	%r16, %r17, %r22
	.word 0xa6940011  ! 597: ORcc_R	orcc 	%r16, %r17, %r19
	.word 0x9c3c0011  ! 597: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0xba042356  ! 597: ADD_I	add 	%r16, 0x0356, %r29
	.word 0xe7140011  ! 598: LDQF_R	-	[%r16, %r17], %f19
	.word 0x81880000  ! 600: SAVED	saved
	.word 0x91343001  ! 602: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0xaf643801  ! 602: MOVcc_I	<illegal instruction>
	.word 0x888c2095  ! 602: ANDcc_I	andcc 	%r16, 0x0095, %r4
	.word 0x9a1c2b92  ! 602: XOR_I	xor 	%r16, 0x0b92, %r13
	.word 0x842c0011  ! 602: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x94942b81  ! 602: ORcc_I	orcc 	%r16, 0x0b81, %r10
	.word 0xa6c42b7a  ! 602: ADDCcc_I	addccc 	%r16, 0x0b7a, %r19
	.word 0xbb643801  ! 602: MOVcc_I	<illegal instruction>
	.word 0xde5c0011  ! 603: LDX_R	ldx	[%r16 + %r17], %r15
thr2_irf_ce_60:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_60), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xd22425ec  ! 607: STW_I	stw	%r9, [%r16 + 0x05ec]
	.word 0x993c1011  ! 609: SRAX_R	srax	%r16, %r17, %r12
	.word 0x992c3001  ! 609: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x9c9c0011  ! 609: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x8cb42c3f  ! 609: ORNcc_I	orncc 	%r16, 0x0c3f, %r6
	.word 0x952c0011  ! 609: SLL_R	sll 	%r16, %r17, %r10
	.word 0xba3c0011  ! 609: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0xc59c1011  ! 610: LDDFA_R	ldda	[%r16, %r17], %f2
	.word 0xde1c230b  ! 612: LDD_I	ldd	[%r16 + 0x030b], %r15
	.word 0xa60c0011  ! 614: AND_R	and 	%r16, %r17, %r19
	.word 0xaa442a18  ! 614: ADDC_I	addc 	%r16, 0x0a18, %r21
	.word 0x90840011  ! 614: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0xb48c2502  ! 614: ANDcc_I	andcc 	%r16, 0x0502, %r26
	.word 0x85341011  ! 614: SRLX_R	srlx	%r16, %r17, %r2
	.word 0xf1941011  ! 615: LDQFA_R	-	[%r16, %r17], %f24
thr2_irf_ce_61:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_61), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xd21c27d5  ! 617: LDD_I	ldd	[%r16 + 0x07d5], %r9
	.word 0xa6140011  ! 619: OR_R	or 	%r16, %r17, %r19
	.word 0x9ab42d89  ! 619: ORNcc_I	orncc 	%r16, 0x0d89, %r13
	.word 0x993c0011  ! 619: SRA_R	sra 	%r16, %r17, %r12
	.word 0x99340011  ! 619: SRL_R	srl 	%r16, %r17, %r12
	.word 0x8e840011  ! 619: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0xd8dc285d  ! 620: LDXA_I	ldxa	[%r16, + 0x085d] %asi, %r12
thr2_resum_intr_1502:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_1502), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x85343001  ! 624: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0x9d343001  ! 624: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x8e0c213b  ! 624: AND_I	and 	%r16, 0x013b, %r7
	.word 0x969c2024  ! 624: XORcc_I	xorcc 	%r16, 0x0024, %r11
	.word 0x909c224b  ! 624: XORcc_I	xorcc 	%r16, 0x024b, %r8
thr2_dc_err_50:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_50), 16, 16),1,DC_DATA,46)
	.word 0xdc8424d4  ! 626: LDUWA_I	lduwa	[%r16, + 0x04d4] %asi, %r14
thr2_irf_ce_62:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_62), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xcc442f70  ! 628: LDSW_I	ldsw	[%r16 + 0x0f70], %r6
	.word 0x90042dea  ! 630: ADD_I	add 	%r16, 0x0dea, %r8
	.word 0x97340011  ! 630: SRL_R	srl 	%r16, %r17, %r11
	.word 0x9d2c2001  ! 630: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x9b342001  ! 630: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0xb4940011  ! 630: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0xb9342001  ! 630: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0x8f7c0411  ! 630: MOVR_R	move	%r16, %r17, %r7
	.word 0xb64422a5  ! 630: ADDC_I	addc 	%r16, 0x02a5, %r27
	.word 0xd9140011  ! 631: LDQF_R	-	[%r16, %r17], %f12
thr2_irf_ce_63:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_63), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xf6342abf  ! 635: STH_I	sth	%r27, [%r16 + 0x0abf]
	.word 0x973c1011  ! 637: SRAX_R	srax	%r16, %r17, %r11
	.word 0x88bc2547  ! 637: XNORcc_I	xnorcc 	%r16, 0x0547, %r4
	.word 0xb21c0011  ! 637: XOR_R	xor 	%r16, %r17, %r25
	.word 0xb92c2001  ! 637: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0x9b3c2001  ! 637: SRA_I	sra 	%r16, 0x0001, %r13
thr2_dc_err_51:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_51), 16, 16),1,DC_DATA,33)
	.word 0xd28c1000  ! 639: LDUBA_R	lduba	[%r16, %r0] 0x80, %r9
thr2_irf_ce_64:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_64), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xd4342221  ! 643: STH_I	sth	%r10, [%r16 + 0x0221]
	.word 0x8a940011  ! 645: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0xad643801  ! 645: MOVcc_I	<illegal instruction>
	.word 0x9b2c1011  ! 645: SLLX_R	sllx	%r16, %r17, %r13
	.word 0x868c0011  ! 645: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x8cc40011  ! 645: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x8e042274  ! 645: ADD_I	add 	%r16, 0x0274, %r7
	.word 0x9eac2885  ! 645: ANDNcc_I	andncc 	%r16, 0x0885, %r15
	.word 0x87343001  ! 645: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0xd9142275  ! 646: LDQF_I	-	[%r16, 0x0275], %f12
thr2_irf_ce_65:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_65), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xda1c221b  ! 648: LDD_I	ldd	[%r16 + 0x021b], %r13
	.word 0x84bc0011  ! 650: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x9f343001  ! 650: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x9ac40011  ! 650: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x8ebc0011  ! 650: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0xad3c1011  ! 650: SRAX_R	srax	%r16, %r17, %r22
thr2_dc_err_52:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_52), 16, 16),1,DC_DATA,42)
	.word 0xf884261b  ! 652: LDUWA_I	lduwa	[%r16, + 0x061b] %asi, %r28
thr2_irf_ce_66:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_66), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xf9040011  ! 654: LDF_R	ld	[%r16, %r17], %f28
	.word 0x8c8c0011  ! 656: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0x95641811  ! 656: MOVcc_R	<illegal instruction>
	.word 0x892c0011  ! 656: SLL_R	sll 	%r16, %r17, %r4
	.word 0xb2bc0011  ! 656: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0xa92c1011  ! 656: SLLX_R	sllx	%r16, %r17, %r20
	.word 0x95643801  ! 656: MOVcc_I	<illegal instruction>
thr2_dc_err_53:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_53), 16, 16),1,DC_DATA,53)
	.word 0xee1c261b  ! 658: LDD_I	ldd	[%r16 + 0x061b], %r23
	.word 0xecc4280e  ! 660: LDSWA_I	ldswa	[%r16, + 0x080e] %asi, %r22
	.word 0xae940011  ! 662: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0xaf7c0411  ! 662: MOVR_R	move	%r16, %r17, %r23
	.word 0xbb643801  ! 662: MOVcc_I	<illegal instruction>
	.word 0x88ac0011  ! 662: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x840c2f76  ! 662: AND_I	and 	%r16, 0x0f76, %r2
	.word 0xf60c0011  ! 663: LDUB_R	ldub	[%r16 + %r17], %r27
	.word 0xf9140011  ! 665: LDQF_R	-	[%r16, %r17], %f28
	.word 0x8b641811  ! 667: MOVcc_R	<illegal instruction>
	.word 0x9a8c2bee  ! 667: ANDcc_I	andcc 	%r16, 0x0bee, %r13
	.word 0x8f343001  ! 667: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x8b2c3001  ! 667: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x9a0c236f  ! 667: AND_I	and 	%r16, 0x036f, %r13
	.word 0x9e942f9e  ! 667: ORcc_I	orcc 	%r16, 0x0f9e, %r15
	.word 0xae340011  ! 667: ORN_R	orn 	%r16, %r17, %r23
	.word 0x842c0011  ! 667: ANDN_R	andn 	%r16, %r17, %r2
	.word 0xd89c25cb  ! 668: LDDA_I	ldda	[%r16, + 0x05cb] %asi, %r12
thr2_irf_ce_67:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_67), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xce140011  ! 670: LDUH_R	lduh	[%r16 + %r17], %r7
	.word 0x963c28b8  ! 672: XNOR_I	xnor 	%r16, 0x08b8, %r11
	.word 0x833c0011  ! 672: SRA_R	sra 	%r16, %r17, %r1
	.word 0x917c0411  ! 672: MOVR_R	move	%r16, %r17, %r8
	.word 0x892c1011  ! 672: SLLX_R	sllx	%r16, %r17, %r4
	.word 0x94042984  ! 672: ADD_I	add 	%r16, 0x0984, %r10
	.word 0xb89426da  ! 672: ORcc_I	orcc 	%r16, 0x06da, %r28
thr2_dc_err_54:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_54), 16, 16),1,DC_DATA,58)
	.word 0xe90424f6  ! 674: LDF_I	ld	[%r16, 0x04f6], %f20
	.word 0xc3ec1011  ! 676: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x972c3001  ! 678: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x9f2c0011  ! 678: SLL_R	sll 	%r16, %r17, %r15
	.word 0x881c2376  ! 678: XOR_I	xor 	%r16, 0x0376, %r4
	.word 0x8aac0011  ! 678: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x8a3c2557  ! 678: XNOR_I	xnor 	%r16, 0x0557, %r5
thr2_dc_err_55:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_55), 16, 16),1,DC_DATA,60)
	.word 0xfadc1000  ! 680: LDXA_R	ldxa	[%r16, %r0] 0x80, %r29
	.word 0xe8cc226d  ! 682: LDSBA_I	ldsba	[%r16, + 0x026d] %asi, %r20
	.word 0xb32c0011  ! 684: SLL_R	sll 	%r16, %r17, %r25
	.word 0x98c40011  ! 684: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x98b40011  ! 684: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x9b343001  ! 684: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xa8940011  ! 684: ORcc_R	orcc 	%r16, %r17, %r20
	.word 0xa81c22fd  ! 684: XOR_I	xor 	%r16, 0x02fd, %r20
thr2_dc_err_56:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_56), 16, 16),1,DC_DATA,30)
	.word 0xc6442130  ! 686: LDSW_I	ldsw	[%r16 + 0x0130], %r3
thr2_irf_ce_68:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_68), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xca1c2442  ! 688: LDD_I	ldd	[%r16 + 0x0442], %r5
	.word 0x9a3c0011  ! 690: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x8d2c1011  ! 690: SLLX_R	sllx	%r16, %r17, %r6
	.word 0x90b42375  ! 690: ORNcc_I	orncc 	%r16, 0x0375, %r8
	.word 0x880c0011  ! 690: AND_R	and 	%r16, %r17, %r4
	.word 0xa72c0011  ! 690: SLL_R	sll 	%r16, %r17, %r19
	.word 0xb2342f26  ! 690: ORN_I	orn 	%r16, 0x0f26, %r25
thr2_dc_err_57:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_57), 16, 16),1,DC_DATA,18)
	.word 0xcc5c287b  ! 692: LDX_I	ldx	[%r16 + 0x087b], %r6
thr2_irf_ce_69:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_69), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xe67c0011  ! 694: SWAP_R	swap	%r19, [%r16 + %r17]
	.word 0x9d2c3001  ! 696: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0xb8c42860  ! 696: ADDCcc_I	addccc 	%r16, 0x0860, %r28
	.word 0x8a340011  ! 696: ORN_R	orn 	%r16, %r17, %r5
	.word 0x8d2c3001  ! 696: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0xa68c2763  ! 696: ANDcc_I	andcc 	%r16, 0x0763, %r19
	.word 0xba3c2a1c  ! 696: XNOR_I	xnor 	%r16, 0x0a1c, %r29
thr2_dc_err_58:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_58), 16, 16),1,DC_DATA,56)
	.word 0xf00c0000  ! 698: LDUB_R	ldub	[%r16 + %r0], %r24
thr2_irf_ce_70:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_70), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xc71c0011  ! 700: LDDF_R	ldd	[%r16, %r17], %f3
	.word 0x9eac0011  ! 702: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x913c0011  ! 702: SRA_R	sra 	%r16, %r17, %r8
	.word 0xac940011  ! 702: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0xbb2c3001  ! 702: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xbb341011  ! 702: SRLX_R	srlx	%r16, %r17, %r29
	.word 0x9a8c0011  ! 702: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x9e1c0011  ! 702: XOR_R	xor 	%r16, %r17, %r15
thr2_dc_err_59:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_59), 16, 16),1,DC_DATA,27)
	.word 0xd2cc202f  ! 704: LDSBA_I	ldsba	[%r16, + 0x002f] %asi, %r9
	.word 0xea8c2fda  ! 706: LDUBA_I	lduba	[%r16, + 0x0fda] %asi, %r21
	.word 0x86c42da4  ! 708: ADDCcc_I	addccc 	%r16, 0x0da4, %r3
	.word 0xab340011  ! 708: SRL_R	srl 	%r16, %r17, %r21
	.word 0x953c2001  ! 708: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x8cac2941  ! 708: ANDNcc_I	andncc 	%r16, 0x0941, %r6
	.word 0x8a9c0011  ! 708: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0x92b40011  ! 708: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0x86042049  ! 708: ADD_I	add 	%r16, 0x0049, %r3
thr2_dc_err_60:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_60), 16, 16),1,DC_DATA,43)
	.word 0xf0440000  ! 710: LDSW_R	ldsw	[%r16 + %r0], %r24
thr2_irf_ce_71:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_71), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xfa2c24f7  ! 714: STB_I	stb	%r29, [%r16 + 0x04f7]
	.word 0xba440011  ! 716: ADDC_R	addc 	%r16, %r17, %r29
	.word 0x9e1c0011  ! 716: XOR_R	xor 	%r16, %r17, %r15
	.word 0x85641811  ! 716: MOVcc_R	<illegal instruction>
	.word 0xba140011  ! 716: OR_R	or 	%r16, %r17, %r29
	.word 0x828c20c6  ! 716: ANDcc_I	andcc 	%r16, 0x00c6, %r1
	.word 0x932c1011  ! 716: SLLX_R	sllx	%r16, %r17, %r9
	.word 0xad3c0011  ! 716: SRA_R	sra 	%r16, %r17, %r22
	.word 0x9d7c2401  ! 716: MOVR_I	move	%r16, 0xfffffe34, %r14
thr2_dc_err_61:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_61), 16, 16),1,DC_DATA,5)
	.word 0xf2540000  ! 718: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xf3841011  ! 720: LDFA_R	lda	[%r16, %r17], %f25
	.word 0x8c0c0011  ! 722: AND_R	and 	%r16, %r17, %r6
	.word 0x94b422c0  ! 722: ORNcc_I	orncc 	%r16, 0x02c0, %r10
	.word 0x88bc0011  ! 722: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0xb41c28d1  ! 722: XOR_I	xor 	%r16, 0x08d1, %r26
	.word 0x9ec40011  ! 722: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x983c0011  ! 722: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0xb6c40011  ! 722: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x957c2401  ! 722: MOVR_I	move	%r16, 0xfffffe34, %r10
	.word 0xd5841011  ! 723: LDFA_R	lda	[%r16, %r17], %f10
thr2_irf_ce_72:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_72), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xdb9c1011  ! 725: LDDFA_R	ldda	[%r16, %r17], %f13
	.word 0x952c0011  ! 727: SLL_R	sll 	%r16, %r17, %r10
	.word 0xae2c205c  ! 727: ANDN_I	andn 	%r16, 0x005c, %r23
	.word 0xb0942828  ! 727: ORcc_I	orcc 	%r16, 0x0828, %r24
	.word 0xa77c2401  ! 727: MOVR_I	move	%r16, 0xfffffe34, %r19
	.word 0x90b40011  ! 727: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x84b423a1  ! 727: ORNcc_I	orncc 	%r16, 0x03a1, %r2
	.word 0xee1c0011  ! 728: LDD_R	ldd	[%r16 + %r17], %r23
thr2_irf_ce_73:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_73), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xfa9c2735  ! 730: LDDA_I	ldda	[%r16, + 0x0735] %asi, %r29
	.word 0x9b7c0411  ! 732: MOVR_R	move	%r16, %r17, %r13
	.word 0xb81c0011  ! 732: XOR_R	xor 	%r16, %r17, %r28
	.word 0xb12c2001  ! 732: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0x92ac2c7c  ! 732: ANDNcc_I	andncc 	%r16, 0x0c7c, %r9
	.word 0x90442f36  ! 732: ADDC_I	addc 	%r16, 0x0f36, %r8
	.word 0x952c1011  ! 732: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x977c2401  ! 732: MOVR_I	move	%r16, 0xfffffe34, %r11
	.word 0x980c0011  ! 732: AND_R	and 	%r16, %r17, %r12
thr2_dc_err_62:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_62), 16, 16),1,DC_DATA,70)
	.word 0xf0040000  ! 734: LDUW_R	lduw	[%r16 + %r0], %r24
thr2_irf_ce_74:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_74), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xc61c0011  ! 736: LDD_R	ldd	[%r16 + %r17], %r3
	.word 0x892c0011  ! 738: SLL_R	sll 	%r16, %r17, %r4
	.word 0x893c1011  ! 738: SRAX_R	srax	%r16, %r17, %r4
	.word 0x969422bd  ! 738: ORcc_I	orcc 	%r16, 0x02bd, %r11
	.word 0x880c0011  ! 738: AND_R	and 	%r16, %r17, %r4
	.word 0x9e140011  ! 738: OR_R	or 	%r16, %r17, %r15
	.word 0x8e340011  ! 738: ORN_R	orn 	%r16, %r17, %r7
	.word 0x992c1011  ! 738: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x9f641811  ! 739: MOVcc_R	<illegal instruction>
	.word 0x90942f2e  ! 739: ORcc_I	orcc 	%r16, 0x0f2e, %r8
	.word 0xa80421de  ! 739: ADD_I	add 	%r16, 0x01de, %r20
	.word 0xa62c2788  ! 739: ANDN_I	andn 	%r16, 0x0788, %r19
	.word 0xab3c1011  ! 739: SRAX_R	srax	%r16, %r17, %r21
	.word 0xaa0c0011  ! 739: AND_R	and 	%r16, %r17, %r21
	.word 0x9c1c0011  ! 739: XOR_R	xor 	%r16, %r17, %r14
	rd      %pc, %r18
	set     0x20, %r17
thr2_dc_err_63:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_63), 16, 16),1,DC_DATA,39)
	.word 0xf9040000  ! 740: LDF_R	ld	[%r16, %r0], %f28
thr2_irf_ce_75:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_75), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0xb5343001  ! 743: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0xaa340011  ! 743: ORN_R	orn 	%r16, %r17, %r21
	.word 0x87643801  ! 743: MOVcc_I	<illegal instruction>
	.word 0x91342001  ! 743: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0x9d3c0011  ! 743: SRA_R	sra 	%r16, %r17, %r14
	.word 0xba940011  ! 743: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0xb43c0011  ! 743: XNOR_R	xnor 	%r16, %r17, %r26
thr2_dc_err_64:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_64), 16, 16),1,DC_DATA,64)
	.word 0xe89c2c89  ! 745: LDDA_I	ldda	[%r16, + 0x0c89] %asi, %r20
	.word 0xc2b41011  ! 747: STHA_R	stha	%r1, [%r16 + %r17] 0x80
	.word 0xb73c1011  ! 749: SRAX_R	srax	%r16, %r17, %r27
	.word 0xaa342203  ! 749: ORN_I	orn 	%r16, 0x0203, %r21
	.word 0xb6440011  ! 749: ADDC_R	addc 	%r16, %r17, %r27
	.word 0x86440011  ! 749: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x9844277d  ! 749: ADDC_I	addc 	%r16, 0x077d, %r12
	.word 0xb12c0011  ! 749: SLL_R	sll 	%r16, %r17, %r24
	.word 0x872c3001  ! 749: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x893c2001  ! 749: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0xd1941011  ! 750: LDQFA_R	-	[%r16, %r17], %f8
	.word 0xd1042cf0  ! 752: LDF_I	ld	[%r16, 0x0cf0], %f8
	.word 0x9c1c0011  ! 754: XOR_R	xor 	%r16, %r17, %r14
	.word 0xb63c0011  ! 754: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0xad641811  ! 754: MOVcc_R	<illegal instruction>
	.word 0x8a342790  ! 754: ORN_I	orn 	%r16, 0x0790, %r5
	.word 0xb3342001  ! 754: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0xba8c0011  ! 754: ANDcc_R	andcc 	%r16, %r17, %r29
	.word 0xa92c2001  ! 754: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0x982c0011  ! 754: ANDN_R	andn 	%r16, %r17, %r12
	.word 0xcd9c1011  ! 755: LDDFA_R	ldda	[%r16, %r17], %f6
thr2_irf_ce_76:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_76), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xe6040011  ! 757: LDUW_R	lduw	[%r16 + %r17], %r19
	.word 0x90042c01  ! 759: ADD_I	add 	%r16, 0x0c01, %r8
	.word 0x9c840011  ! 759: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0xab343001  ! 759: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0x82b40011  ! 759: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x84942c1b  ! 759: ORcc_I	orcc 	%r16, 0x0c1b, %r2
	.word 0x9c1c0011  ! 759: XOR_R	xor 	%r16, %r17, %r14
	.word 0x849c2616  ! 759: XORcc_I	xorcc 	%r16, 0x0616, %r2
	.word 0xcec41011  ! 760: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r7
thr2_irf_ce_77:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_77), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xf0fc2491  ! 762: SWAPA_I	swapa	%r24, [%r16 + 0x0491] %asi
	.word 0x929c0011  ! 764: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0x89641811  ! 764: MOVcc_R	<illegal instruction>
	.word 0x86940011  ! 764: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0xb17c0411  ! 764: MOVR_R	move	%r16, %r17, %r24
	.word 0x96ac2abf  ! 764: ANDNcc_I	andncc 	%r16, 0x0abf, %r11
thr2_dc_err_65:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_65), 16, 16),1,DC_DATA,70)
	.word 0xfa540000  ! 766: LDSH_R	ldsh	[%r16 + %r0], %r29
thr2_irf_ce_78:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_78), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xee2c292f  ! 770: STB_I	stb	%r23, [%r16 + 0x092f]
	.word 0x9c342cf6  ! 772: ORN_I	orn 	%r16, 0x0cf6, %r14
	.word 0x913c1011  ! 772: SRAX_R	srax	%r16, %r17, %r8
	.word 0x9e8c20a3  ! 772: ANDcc_I	andcc 	%r16, 0x00a3, %r15
	.word 0x8d7c0411  ! 772: MOVR_R	move	%r16, %r17, %r6
	.word 0x8c9c2394  ! 772: XORcc_I	xorcc 	%r16, 0x0394, %r6
thr2_dc_err_66:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_66), 16, 16),1,DC_DATA,15)
	.word 0xd0dc2c1b  ! 774: LDXA_I	ldxa	[%r16, + 0x0c1b] %asi, %r8
thr2_irf_ce_79:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_79), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xda942661  ! 776: LDUHA_I	lduha	[%r16, + 0x0661] %asi, %r13
	.word 0xa62c0011  ! 778: ANDN_R	andn 	%r16, %r17, %r19
	.word 0xb2840011  ! 778: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0x9e940011  ! 778: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x9c3422d8  ! 778: ORN_I	orn 	%r16, 0x02d8, %r14
	.word 0xaaac22e7  ! 778: ANDNcc_I	andncc 	%r16, 0x02e7, %r21
	.word 0x82040011  ! 778: ADD_R	add 	%r16, %r17, %r1
	.word 0xf60c0011  ! 779: LDUB_R	ldub	[%r16 + %r17], %r27
thr2_irf_ce_80:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_80), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xea5c2986  ! 781: LDX_I	ldx	[%r16 + 0x0986], %r21
	.word 0x901c26b7  ! 783: XOR_I	xor 	%r16, 0x06b7, %r8
	.word 0x949c0011  ! 783: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0x942c0011  ! 783: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x85643801  ! 783: MOVcc_I	<illegal instruction>
	.word 0xb57c2401  ! 783: MOVR_I	move	%r16, 0xfffffe34, %r26
	.word 0xb8b40011  ! 783: ORNcc_R	orncc 	%r16, %r17, %r28
thr2_dc_err_67:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_67), 16, 16),1,DC_DATA,9)
	.word 0xf6442a98  ! 785: LDSW_I	ldsw	[%r16 + 0x0a98], %r27
	.word 0xd1040011  ! 787: LDF_R	ld	[%r16, %r17], %f8
	.word 0x833c0011  ! 789: SRA_R	sra 	%r16, %r17, %r1
	.word 0x8e3c29eb  ! 789: XNOR_I	xnor 	%r16, 0x09eb, %r7
	.word 0xbb343001  ! 789: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0x8e9c0011  ! 789: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0xb6ac2e43  ! 789: ANDNcc_I	andncc 	%r16, 0x0e43, %r27
	.word 0x8a440011  ! 789: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x8e440011  ! 789: ADDC_R	addc 	%r16, %r17, %r7
	.word 0x92142878  ! 789: OR_I	or 	%r16, 0x0878, %r9
thr2_dc_err_68:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_68), 16, 16),1,DC_DATA,60)
	.word 0xce140000  ! 791: LDUH_R	lduh	[%r16 + %r0], %r7
	.word 0xc4c42ab3  ! 793: LDSWA_I	ldswa	[%r16, + 0x0ab3] %asi, %r2
	.word 0x92b42dce  ! 795: ORNcc_I	orncc 	%r16, 0x0dce, %r9
	.word 0x940c0011  ! 795: AND_R	and 	%r16, %r17, %r10
	.word 0x8c3c0011  ! 795: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x8c8c29be  ! 795: ANDcc_I	andcc 	%r16, 0x09be, %r6
	.word 0x9a140011  ! 795: OR_R	or 	%r16, %r17, %r13
	.word 0x84042b3f  ! 795: ADD_I	add 	%r16, 0x0b3f, %r2
	.word 0xce1c0011  ! 796: LDD_R	ldd	[%r16 + %r17], %r7
	.word 0x9e540011  ! 798: UMUL_R	umul 	%r16, %r17, %r15
	.word 0xb4c42783  ! 800: ADDCcc_I	addccc 	%r16, 0x0783, %r26
	.word 0xa88c0011  ! 800: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0x9d7c2401  ! 800: MOVR_I	move	%r16, 0xfffffe34, %r14
	.word 0x8b342001  ! 800: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x923c0011  ! 800: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x8c440011  ! 800: ADDC_R	addc 	%r16, %r17, %r6
	.word 0xbb2c1011  ! 801: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x872c1011  ! 801: SLLX_R	sllx	%r16, %r17, %r3
	.word 0x94940011  ! 801: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0xad3c2001  ! 801: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0x92940011  ! 801: ORcc_R	orcc 	%r16, %r17, %r9
	rd      %pc, %r18
	set     0x20, %r17
thr2_dc_err_69:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_69), 16, 16),1,DC_DATA,62)
	.word 0xc9841000  ! 802: LDFA_R	lda	[%r16, %r0], %f4
	return     %r18 + %r17
	.word 0x84140011  ! 805: OR_R	or 	%r16, %r17, %r2
	.word 0xae3c0011  ! 805: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x913c0011  ! 805: SRA_R	sra 	%r16, %r17, %r8
	.word 0xb88c0011  ! 805: ANDcc_R	andcc 	%r16, %r17, %r28
	.word 0x833c0011  ! 805: SRA_R	sra 	%r16, %r17, %r1
	.word 0x92b40011  ! 805: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0x913c0011  ! 805: SRA_R	sra 	%r16, %r17, %r8
	.word 0xdf140011  ! 806: LDQF_R	-	[%r16, %r17], %f15
!Illinst store
	.word 0xdc2c0011  ! 808: STB_R	stb	%r14, [%r16 + %r17]
	.word 0x98940011  ! 810: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x82440011  ! 810: ADDC_R	addc 	%r16, %r17, %r1
	.word 0xae340011  ! 810: ORN_R	orn 	%r16, %r17, %r23
	.word 0xa7342001  ! 810: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0x9c942106  ! 810: ORcc_I	orcc 	%r16, 0x0106, %r14
	.word 0x957c0411  ! 810: MOVR_R	move	%r16, %r17, %r10
	.word 0x8c94241c  ! 810: ORcc_I	orcc 	%r16, 0x041c, %r6
	.word 0x88b40011  ! 810: ORNcc_R	orncc 	%r16, %r17, %r4
thr2_dc_err_70:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_70), 16, 16),1,DC_DATA,19)
	.word 0xda4c0000  ! 812: LDSB_R	ldsb	[%r16 + %r0], %r13
thr2_irf_ce_81:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_81), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd48c2a08  ! 814: LDUBA_I	lduba	[%r16, + 0x0a08] %asi, %r10
	.word 0x96c40011  ! 816: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x853c0011  ! 816: SRA_R	sra 	%r16, %r17, %r2
	.word 0x883423d6  ! 816: ORN_I	orn 	%r16, 0x03d6, %r4
	.word 0xb3342001  ! 816: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x923426a8  ! 816: ORN_I	orn 	%r16, 0x06a8, %r9
	.word 0x8e9c207b  ! 816: XORcc_I	xorcc 	%r16, 0x007b, %r7
	.word 0xba942aaf  ! 816: ORcc_I	orcc 	%r16, 0x0aaf, %r29
thr2_dc_err_71:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_71), 16, 16),1,DC_DATA,34)
	.word 0xf0040000  ! 818: LDUW_R	lduw	[%r16 + %r0], %r24
thr2_irf_ce_82:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_82), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xd1e41011  ! 820: CASA_I	casa	[%r16] 0x80, %r17, %r8
	.word 0x93641811  ! 822: MOVcc_R	<illegal instruction>
	.word 0x98ac2bff  ! 822: ANDNcc_I	andncc 	%r16, 0x0bff, %r12
	.word 0xb82c2a1f  ! 822: ANDN_I	andn 	%r16, 0x0a1f, %r28
	.word 0xb6342220  ! 822: ORN_I	orn 	%r16, 0x0220, %r27
	.word 0x9ab40011  ! 822: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x8834231a  ! 822: ORN_I	orn 	%r16, 0x031a, %r4
	.word 0x90b40011  ! 822: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0xd8042ed9  ! 823: LDUW_I	lduw	[%r16 + 0x0ed9], %r12
	.word 0xf0cc1011  ! 825: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r24
	.word 0xb03c25ce  ! 827: XNOR_I	xnor 	%r16, 0x05ce, %r24
	.word 0xaa1c0011  ! 827: XOR_R	xor 	%r16, %r17, %r21
	.word 0xaac4223b  ! 827: ADDCcc_I	addccc 	%r16, 0x023b, %r21
	.word 0x82bc0011  ! 827: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x8e842ef1  ! 827: ADDcc_I	addcc 	%r16, 0x0ef1, %r7
	.word 0x94842711  ! 827: ADDcc_I	addcc 	%r16, 0x0711, %r10
	.word 0xae340011  ! 827: ORN_R	orn 	%r16, %r17, %r23
thr2_dc_err_72:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_72), 16, 16),1,DC_DATA,39)
	.word 0xf69c1000  ! 829: LDDA_R	ldda	[%r16, %r0] 0x80, %r27
	.word 0xcc042228  ! 831: LDUW_I	lduw	[%r16 + 0x0228], %r6
	.word 0xba442f71  ! 833: ADDC_I	addc 	%r16, 0x0f71, %r29
	.word 0x8e44258e  ! 833: ADDC_I	addc 	%r16, 0x058e, %r7
	.word 0xb12c1011  ! 833: SLLX_R	sllx	%r16, %r17, %r24
	.word 0xbb2c2001  ! 833: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0x99341011  ! 833: SRLX_R	srlx	%r16, %r17, %r12
	.word 0xbb341011  ! 833: SRLX_R	srlx	%r16, %r17, %r29
	.word 0xa89c2bf2  ! 833: XORcc_I	xorcc 	%r16, 0x0bf2, %r20
	.word 0xdacc1011  ! 834: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r13
	.word 0xdf142074  ! 836: LDQF_I	-	[%r16, 0x0074], %f15
	.word 0xa6bc2fea  ! 838: XNORcc_I	xnorcc 	%r16, 0x0fea, %r19
	.word 0x96bc2cc7  ! 838: XNORcc_I	xnorcc 	%r16, 0x0cc7, %r11
	.word 0x8d3c1011  ! 838: SRAX_R	srax	%r16, %r17, %r6
	.word 0xb4040011  ! 838: ADD_R	add 	%r16, %r17, %r26
	.word 0xb57c2401  ! 838: MOVR_I	move	%r16, 0xfffffe34, %r26
	.word 0xb43c0011  ! 838: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x8c1c2065  ! 838: XOR_I	xor 	%r16, 0x0065, %r6
thr2_dc_err_73:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_73), 16, 16),1,DC_DATA,45)
	.word 0xd85c0000  ! 840: LDX_R	ldx	[%r16 + %r0], %r12
	.word 0xd7042f8b  ! 842: LDF_I	ld	[%r16, 0x0f8b], %f11
	.word 0xaa942db1  ! 844: ORcc_I	orcc 	%r16, 0x0db1, %r21
	.word 0x86bc23ce  ! 844: XNORcc_I	xnorcc 	%r16, 0x03ce, %r3
	.word 0x8b342001  ! 844: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x962c0011  ! 844: ANDN_R	andn 	%r16, %r17, %r11
	.word 0xb17c0411  ! 844: MOVR_R	move	%r16, %r17, %r24
	.word 0x9c9c0011  ! 844: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x8cac21fb  ! 844: ANDNcc_I	andncc 	%r16, 0x01fb, %r6
	.word 0xac440011  ! 844: ADDC_R	addc 	%r16, %r17, %r22
	.word 0xc4d42b4f  ! 845: LDSHA_I	ldsha	[%r16, + 0x0b4f] %asi, %r2
!Illinst alu
	.word 0x9c140011  ! 847: OR_R	or 	%r16, %r17, %r14
	.word 0xab342001  ! 849: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x8a8c0011  ! 849: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0x82940011  ! 849: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x873c1011  ! 849: SRAX_R	srax	%r16, %r17, %r3
	.word 0xba0c0011  ! 849: AND_R	and 	%r16, %r17, %r29
thr2_dc_err_74:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_74), 16, 16),1,DC_DATA,34)
	.word 0xd4c42539  ! 851: LDSWA_I	ldswa	[%r16, + 0x0539] %asi, %r10
thr2_irf_ce_83:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_83), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xd0d4252c  ! 853: LDSHA_I	ldsha	[%r16, + 0x052c] %asi, %r8
	.word 0x881c2f95  ! 855: XOR_I	xor 	%r16, 0x0f95, %r4
	.word 0x94c40011  ! 855: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0xac0c0011  ! 855: AND_R	and 	%r16, %r17, %r22
	.word 0x8e0424f0  ! 855: ADD_I	add 	%r16, 0x04f0, %r7
	.word 0xa69c2710  ! 855: XORcc_I	xorcc 	%r16, 0x0710, %r19
	.word 0x9c9c0011  ! 855: XORcc_R	xorcc 	%r16, %r17, %r14
thr2_dc_err_75:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_75), 16, 16),1,DC_DATA,46)
	.word 0xfb841000  ! 857: LDFA_R	lda	[%r16, %r0], %f29
        wr  %g0, 0x80, %asi
	.word 0x877c2401  ! 861: MOVR_I	move	%r16, 0xfffffe34, %r3
	.word 0x8d2c1011  ! 861: SLLX_R	sllx	%r16, %r17, %r6
	.word 0x8d3c0011  ! 861: SRA_R	sra 	%r16, %r17, %r6
	.word 0x9c9c247f  ! 861: XORcc_I	xorcc 	%r16, 0x047f, %r14
	.word 0x8c040011  ! 861: ADD_R	add 	%r16, %r17, %r6
	.word 0x912c3001  ! 861: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0xaa0428b4  ! 861: ADD_I	add 	%r16, 0x08b4, %r21
	.word 0x9d343001  ! 862: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x8c142c7a  ! 862: OR_I	or 	%r16, 0x0c7a, %r6
	.word 0xb72c2001  ! 862: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xbb343001  ! 862: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0xb5343001  ! 862: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0x9ac4282c  ! 862: ADDCcc_I	addccc 	%r16, 0x082c, %r13
	.word 0xad641811  ! 862: MOVcc_R	<illegal instruction>
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd51c0011  ! 862: LDDF_R	ldd	[%r16, %r17], %f10
thr2_irf_ce_84:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_84), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0x829c0011  ! 865: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x8a8422af  ! 865: ADDcc_I	addcc 	%r16, 0x02af, %r5
	.word 0x829c2812  ! 865: XORcc_I	xorcc 	%r16, 0x0812, %r1
	.word 0x9b340011  ! 865: SRL_R	srl 	%r16, %r17, %r13
	.word 0x869c28a0  ! 865: XORcc_I	xorcc 	%r16, 0x08a0, %r3
	.word 0xfb841011  ! 866: LDFA_R	lda	[%r16, %r17], %f29
thr2_irf_ce_85:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_85), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0x81580000  ! 868: FLUSHW	flushw
	.word 0xb2942296  ! 870: ORcc_I	orcc 	%r16, 0x0296, %r25
	.word 0x8a440011  ! 870: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x9a0c29b3  ! 870: AND_I	and 	%r16, 0x09b3, %r13
	.word 0x96342099  ! 870: ORN_I	orn 	%r16, 0x0099, %r11
	.word 0xb41c0011  ! 870: XOR_R	xor 	%r16, %r17, %r26
	.word 0xa89c0011  ! 870: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0x88bc0011  ! 870: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0xb6ac2530  ! 870: ANDNcc_I	andncc 	%r16, 0x0530, %r27
	.word 0xcf0428bd  ! 871: LDF_I	ld	[%r16, 0x08bd], %f7
	.word 0xcf142aa8  ! 873: LDQF_I	-	[%r16, 0x0aa8], %f7
	.word 0xb61424b1  ! 875: OR_I	or 	%r16, 0x04b1, %r27
	.word 0x823421c6  ! 875: ORN_I	orn 	%r16, 0x01c6, %r1
	.word 0x84bc20d3  ! 875: XNORcc_I	xnorcc 	%r16, 0x00d3, %r2
	.word 0xb32c0011  ! 875: SLL_R	sll 	%r16, %r17, %r25
	.word 0x9eac2fc4  ! 875: ANDNcc_I	andncc 	%r16, 0x0fc4, %r15
	.word 0x82b42059  ! 875: ORNcc_I	orncc 	%r16, 0x0059, %r1
	.word 0xd0542993  ! 876: LDSH_I	ldsh	[%r16 + 0x0993], %r8
thr2_irf_ce_86:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_86), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xe89c2d25  ! 878: LDDA_I	ldda	[%r16, + 0x0d25] %asi, %r20
	.word 0x8b641811  ! 880: MOVcc_R	<illegal instruction>
	.word 0x8cc42266  ! 880: ADDCcc_I	addccc 	%r16, 0x0266, %r6
	.word 0x92440011  ! 880: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x852c2001  ! 880: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0xb22c0011  ! 880: ANDN_R	andn 	%r16, %r17, %r25
	.word 0x881c0011  ! 880: XOR_R	xor 	%r16, %r17, %r4
	.word 0x8a440011  ! 880: ADDC_R	addc 	%r16, %r17, %r5
	.word 0xc2140011  ! 881: LDUH_R	lduh	[%r16 + %r17], %r1
	.word 0xd4f42a46  ! 883: STXA_I	stxa	%r10, [%r16 + 0x0a46] %asi
	.word 0x9f3c1011  ! 885: SRAX_R	srax	%r16, %r17, %r15
	.word 0x99340011  ! 885: SRL_R	srl 	%r16, %r17, %r12
	.word 0x9b641811  ! 885: MOVcc_R	<illegal instruction>
	.word 0xab341011  ! 885: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x8c0424eb  ! 885: ADD_I	add 	%r16, 0x04eb, %r6
	.word 0x8b340011  ! 885: SRL_R	srl 	%r16, %r17, %r5
	.word 0xee8c1011  ! 886: LDUBA_R	lduba	[%r16, %r17] 0x80, %r23
	.word 0xf6540011  ! 888: LDSH_R	ldsh	[%r16 + %r17], %r27
	.word 0x82440011  ! 890: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x88c42f32  ! 890: ADDCcc_I	addccc 	%r16, 0x0f32, %r4
	.word 0x89643801  ! 890: MOVcc_I	<illegal instruction>
	.word 0x96942aab  ! 890: ORcc_I	orcc 	%r16, 0x0aab, %r11
	.word 0x892c3001  ! 890: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0xde5c2524  ! 891: LDX_I	ldx	[%r16 + 0x0524], %r15
thr2_irf_ce_87:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_87), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xdc540011  ! 893: LDSH_R	ldsh	[%r16 + %r17], %r14
	.word 0xa8b40011  ! 895: ORNcc_R	orncc 	%r16, %r17, %r20
	.word 0x920c261e  ! 895: AND_I	and 	%r16, 0x061e, %r9
	.word 0xb8942f03  ! 895: ORcc_I	orcc 	%r16, 0x0f03, %r28
	.word 0xbb643801  ! 895: MOVcc_I	<illegal instruction>
	.word 0x8b2c0011  ! 895: SLL_R	sll 	%r16, %r17, %r5
	.word 0xc51c0011  ! 896: LDDF_R	ldd	[%r16, %r17], %f2
thr2_irf_ce_88:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_88), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xd25c2a8d  ! 898: LDX_I	ldx	[%r16 + 0x0a8d], %r9
	.word 0x91343001  ! 900: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0x972c0011  ! 900: SLL_R	sll 	%r16, %r17, %r11
	.word 0xb93c2001  ! 900: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xb0440011  ! 900: ADDC_R	addc 	%r16, %r17, %r24
	.word 0x848c2714  ! 900: ANDcc_I	andcc 	%r16, 0x0714, %r2
	.word 0xb62c0011  ! 900: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x92142202  ! 900: OR_I	or 	%r16, 0x0202, %r9
	.word 0x8d2c2001  ! 900: SLL_I	sll 	%r16, 0x0001, %r6
thr2_dc_err_76:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_76), 16, 16),1,DC_DATA,7)
	.word 0xdf1428b8  ! 902: LDQF_I	-	[%r16, 0x08b8], %f15
thr2_irf_ce_89:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_89), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xec1c257c  ! 904: LDD_I	ldd	[%r16 + 0x057c], %r22
	.word 0xb4b42066  ! 906: ORNcc_I	orncc 	%r16, 0x0066, %r26
	.word 0x8d3c1011  ! 906: SRAX_R	srax	%r16, %r17, %r6
	.word 0x8a040011  ! 906: ADD_R	add 	%r16, %r17, %r5
	.word 0xb6c40011  ! 906: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0xbb3c0011  ! 906: SRA_R	sra 	%r16, %r17, %r29
	.word 0xaf340011  ! 906: SRL_R	srl 	%r16, %r17, %r23
thr2_dc_err_77:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_77), 16, 16),1,DC_DATA,9)
	.word 0xd6440000  ! 908: LDSW_R	ldsw	[%r16 + %r0], %r11
	.word 0xc9941011  ! 910: LDQFA_R	-	[%r16, %r17], %f4
	.word 0xad641811  ! 912: MOVcc_R	<illegal instruction>
	.word 0x917c0411  ! 912: MOVR_R	move	%r16, %r17, %r8
	.word 0x9c3c0011  ! 912: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x86140011  ! 912: OR_R	or 	%r16, %r17, %r3
	.word 0x8a440011  ! 912: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x8b342001  ! 912: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0xdd941011  ! 913: LDQFA_R	-	[%r16, %r17], %f14
	.word 0xd4b41011  ! 915: STHA_R	stha	%r10, [%r16 + %r17] 0x80
	.word 0xb3342001  ! 917: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0xaa8c0011  ! 917: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0xb6340011  ! 917: ORN_R	orn 	%r16, %r17, %r27
	.word 0xb69427ad  ! 917: ORcc_I	orcc 	%r16, 0x07ad, %r27
	.word 0xaab4222a  ! 917: ORNcc_I	orncc 	%r16, 0x022a, %r21
	.word 0xb8b426af  ! 917: ORNcc_I	orncc 	%r16, 0x06af, %r28
	.word 0xf0cc1011  ! 918: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r24
thr2_irf_ce_90:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_90), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xc68c1011  ! 920: LDUBA_R	lduba	[%r16, %r17] 0x80, %r3
	.word 0xaa1c290e  ! 922: XOR_I	xor 	%r16, 0x090e, %r21
	.word 0x9ebc2715  ! 922: XNORcc_I	xnorcc 	%r16, 0x0715, %r15
	.word 0xacac2399  ! 922: ANDNcc_I	andncc 	%r16, 0x0399, %r22
	.word 0xaa3c0011  ! 922: XNOR_R	xnor 	%r16, %r17, %r21
	.word 0x9b340011  ! 922: SRL_R	srl 	%r16, %r17, %r13
	.word 0xb23c24a1  ! 922: XNOR_I	xnor 	%r16, 0x04a1, %r25
	.word 0x888c0011  ! 922: ANDcc_R	andcc 	%r16, %r17, %r4
thr2_dc_err_78:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_78), 16, 16),1,DC_DATA,40)
	.word 0xc59c1000  ! 924: LDDFA_R	ldda	[%r16, %r0], %f2
thr2_irf_ce_91:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_91), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0x907c2c4a  ! 926: SDIV_I	sdiv 	%r16, 0x0c4a, %r8
	.word 0x9cc4214b  ! 928: ADDCcc_I	addccc 	%r16, 0x014b, %r14
	.word 0x8a340011  ! 928: ORN_R	orn 	%r16, %r17, %r5
	.word 0xb9342001  ! 928: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0x85343001  ! 928: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0xbabc2a11  ! 928: XNORcc_I	xnorcc 	%r16, 0x0a11, %r29
	.word 0x943c2e66  ! 928: XNOR_I	xnor 	%r16, 0x0e66, %r10
thr2_dc_err_79:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_79), 16, 16),1,DC_DATA,50)
	.word 0xf6040000  ! 930: LDUW_R	lduw	[%r16 + %r0], %r27
thr2_irf_ce_92:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_92), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xc4842593  ! 932: LDUWA_I	lduwa	[%r16, + 0x0593] %asi, %r2
	.word 0x8b643801  ! 934: MOVcc_I	<illegal instruction>
	.word 0xa62c0011  ! 934: ANDN_R	andn 	%r16, %r17, %r19
	.word 0x98c422ed  ! 934: ADDCcc_I	addccc 	%r16, 0x02ed, %r12
	.word 0x949424f4  ! 934: ORcc_I	orcc 	%r16, 0x04f4, %r10
	.word 0xb21c230b  ! 934: XOR_I	xor 	%r16, 0x030b, %r25
thr2_dc_err_80:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_80), 16, 16),1,DC_DATA,24)
	.word 0xc4c426bb  ! 936: LDSWA_I	ldswa	[%r16, + 0x06bb] %asi, %r2
thr2_irf_ce_93:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_93), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xf854252b  ! 938: LDSH_I	ldsh	[%r16 + 0x052b], %r28
	.word 0x92c40011  ! 940: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xa73c0011  ! 940: SRA_R	sra 	%r16, %r17, %r19
	.word 0x917c2401  ! 940: MOVR_I	move	%r16, 0xfffffe34, %r8
	.word 0xacb40011  ! 940: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0x909c28f1  ! 940: XORcc_I	xorcc 	%r16, 0x08f1, %r8
	.word 0xf05c0011  ! 941: LDX_R	ldx	[%r16 + %r17], %r24
thr2_irf_ce_94:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_94), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xdac41011  ! 943: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r13
	.word 0x9f342001  ! 945: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xa7343001  ! 945: SRLX_I	srlx	%r16, 0x0001, %r19
	.word 0x8a9c0011  ! 945: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0xb22c2e39  ! 945: ANDN_I	andn 	%r16, 0x0e39, %r25
	.word 0xa8b428c9  ! 945: ORNcc_I	orncc 	%r16, 0x08c9, %r20
	.word 0x993c1011  ! 945: SRAX_R	srax	%r16, %r17, %r12
	.word 0xa9643801  ! 945: MOVcc_I	<illegal instruction>
thr2_dc_err_81:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_81), 16, 16),1,DC_DATA,4)
	.word 0xd05c2c5a  ! 947: LDX_I	ldx	[%r16 + 0x0c5a], %r8
	.word 0xe6540011  ! 949: LDSH_R	ldsh	[%r16 + %r17], %r19
	.word 0x9e042763  ! 951: ADD_I	add 	%r16, 0x0763, %r15
	.word 0xb6440011  ! 951: ADDC_R	addc 	%r16, %r17, %r27
	.word 0xb0c40011  ! 951: ADDCcc_R	addccc 	%r16, %r17, %r24
	.word 0x963c0011  ! 951: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x942c0011  ! 951: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x832c3001  ! 951: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x97341011  ! 951: SRLX_R	srlx	%r16, %r17, %r11
thr2_dc_err_82:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_82), 16, 16),1,DC_DATA,53)
	.word 0xc29424c1  ! 953: LDUHA_I	lduha	[%r16, + 0x04c1] %asi, %r1
thr2_irf_ce_95:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_95), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0x81580000  ! 955: FLUSHW	flushw
	.word 0x948c2077  ! 957: ANDcc_I	andcc 	%r16, 0x0077, %r10
	.word 0x8aac0011  ! 957: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x983c0011  ! 957: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0xac840011  ! 957: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0x940c264b  ! 957: AND_I	and 	%r16, 0x064b, %r10
	.word 0xb0142489  ! 957: OR_I	or 	%r16, 0x0489, %r24
	.word 0x8e140011  ! 957: OR_R	or 	%r16, %r17, %r7
thr2_dc_err_83:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_83), 16, 16),1,DC_DATA,13)
	.word 0xee4426b3  ! 959: LDSW_I	ldsw	[%r16 + 0x06b3], %r23
        wr  %g0, 0x80, %asi
	.word 0x94442036  ! 963: ADDC_I	addc 	%r16, 0x0036, %r10
	.word 0x82ac2c5d  ! 963: ANDNcc_I	andncc 	%r16, 0x0c5d, %r1
	.word 0x97340011  ! 963: SRL_R	srl 	%r16, %r17, %r11
	.word 0xb21c0011  ! 963: XOR_R	xor 	%r16, %r17, %r25
	.word 0x869c27d8  ! 963: XORcc_I	xorcc 	%r16, 0x07d8, %r3
	.word 0x880c2509  ! 963: AND_I	and 	%r16, 0x0509, %r4
	.word 0x8c9c2149  ! 963: XORcc_I	xorcc 	%r16, 0x0149, %r6
	.word 0xd4142c81  ! 964: LDUH_I	lduh	[%r16 + 0x0c81], %r10
	.word 0xc5040011  ! 966: LDF_R	ld	[%r16, %r17], %f2
	.word 0xa72c2001  ! 968: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0x8d343001  ! 968: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0x9d342001  ! 968: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0xb88c2557  ! 968: ANDcc_I	andcc 	%r16, 0x0557, %r28
	.word 0x9e3c25eb  ! 968: XNOR_I	xnor 	%r16, 0x05eb, %r15
	.word 0xae840011  ! 968: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x9b2c0011  ! 968: SLL_R	sll 	%r16, %r17, %r13
	.word 0x8d641811  ! 968: MOVcc_R	<illegal instruction>
	.word 0xd08c2525  ! 969: LDUBA_I	lduba	[%r16, + 0x0525] %asi, %r8
thr2_irf_ce_96:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_96), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xb45c0011  ! 971: SMUL_R	smul 	%r16, %r17, %r26
	.word 0x9abc2a88  ! 973: XNORcc_I	xnorcc 	%r16, 0x0a88, %r13
	.word 0xb60c2941  ! 973: AND_I	and 	%r16, 0x0941, %r27
	.word 0x98bc2f86  ! 973: XNORcc_I	xnorcc 	%r16, 0x0f86, %r12
	.word 0x882c0011  ! 973: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xaa0c0011  ! 973: AND_R	and 	%r16, %r17, %r21
	.word 0xb12c2001  ! 973: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0x8f2c2001  ! 973: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x8c9c2f58  ! 973: XORcc_I	xorcc 	%r16, 0x0f58, %r6
	.word 0xc44c239a  ! 974: LDSB_I	ldsb	[%r16 + 0x039a], %r2
thr2_resum_intr_1503:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_1503), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x8ec40011  ! 978: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0xaa440011  ! 978: ADDC_R	addc 	%r16, %r17, %r21
	.word 0x9e140011  ! 978: OR_R	or 	%r16, %r17, %r15
	.word 0x920c0011  ! 978: AND_R	and 	%r16, %r17, %r9
	.word 0x95343001  ! 978: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0x84840011  ! 978: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x94bc0011  ! 978: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0xdc040011  ! 979: LDUW_R	lduw	[%r16 + %r17], %r14
thr2_irf_ce_97:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_97), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xf6742613  ! 983: STX_I	stx	%r27, [%r16 + 0x0613]
	.word 0xb22c2849  ! 985: ANDN_I	andn 	%r16, 0x0849, %r25
	.word 0xa77c0411  ! 985: MOVR_R	move	%r16, %r17, %r19
	.word 0xad7c2401  ! 985: MOVR_I	move	%r16, 0xfffffe34, %r22
	.word 0x86c42b8f  ! 985: ADDCcc_I	addccc 	%r16, 0x0b8f, %r3
	.word 0x98ac29b1  ! 985: ANDNcc_I	andncc 	%r16, 0x09b1, %r12
	.word 0xd1140011  ! 986: LDQF_R	-	[%r16, %r17], %f8
thr2_irf_ce_98:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_98), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xd31c22cd  ! 988: LDDF_I	ldd	[%r16, 0x02cd], %f9
	.word 0x8ac40011  ! 990: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0xb7340011  ! 990: SRL_R	srl 	%r16, %r17, %r27
	.word 0x977c0411  ! 990: MOVR_R	move	%r16, %r17, %r11
	.word 0x9e942b22  ! 990: ORcc_I	orcc 	%r16, 0x0b22, %r15
	.word 0x9abc0011  ! 990: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x88940011  ! 990: ORcc_R	orcc 	%r16, %r17, %r4
thr2_dc_err_84:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_84), 16, 16),1,DC_DATA,14)
	.word 0xd4442d69  ! 992: LDSW_I	ldsw	[%r16 + 0x0d69], %r10
	.word 0xf4c41011  ! 994: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r26
	.word 0x98b40011  ! 996: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x941c29dc  ! 996: XOR_I	xor 	%r16, 0x09dc, %r10
	.word 0x96b42626  ! 996: ORNcc_I	orncc 	%r16, 0x0626, %r11
	.word 0xa97c2401  ! 996: MOVR_I	move	%r16, 0xfffffe34, %r20
	.word 0xab3c0011  ! 996: SRA_R	sra 	%r16, %r17, %r21
thr2_dc_err_85:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_85), 16, 16),1,DC_DATA,27)
	.word 0xcd0428ef  ! 998: LDF_I	ld	[%r16, 0x08ef], %f6
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
        setx  0x0000000000000220, %g1, %r17
        setx  0x58a3975d6ed0dda8, %g1, %r0
        setx  0x2f23b8659a36c927, %g1, %r1
        setx  0xceacd37d03861772, %g1, %r2
        setx  0x76ca374b12a4852d, %g1, %r3
        setx  0xf1bc72ced6aeddc1, %g1, %r4
        setx  0x83020937d600939a, %g1, %r5
        setx  0x39f4325473ffdc11, %g1, %r6
        setx  0x189eede1059cf456, %g1, %r7
        setx  0xb0d47540e941316f, %g1, %r8
        setx  0x74064f229068a022, %g1, %r9
        setx  0x700de7b4621bd4cc, %g1, %r10
        setx  0x8784fd920f9cb8c6, %g1, %r11
        setx  0xdaacf2b5b3204823, %g1, %r12
        setx  0xf8ed1a66ec70561f, %g1, %r13
        setx  0xa5c710ade701939a, %g1, %r14
        setx  0x0b672c8380de11aa, %g1, %r15
        setx  0xd52c8fa5c929a6f3, %g1, %r18
        setx  0x6b32bedb63f1efa1, %g1, %r19
        setx  0xe35138b5929f2e9a, %g1, %r20
        setx  0xbbcae2cfa5044369, %g1, %r21
        setx  0x336239087b31639d, %g1, %r22
        setx  0xe2a959bbaa1ab143, %g1, %r23
        setx  0xed54b60510c8c4d1, %g1, %r24
        setx  0xb2f834f86a42d29d, %g1, %r25
        setx  0x159a830e9762ee6e, %g1, %r26
        setx  0x904f69c22fb8de94, %g1, %r27
        setx  0xe968bd383818298f, %g1, %r28
        setx  0x9b242c75c9cd6302, %g1, %r29
        setx  0xfb9fd92bad70cebb, %g1, %r30
        setx  0x7246d003994e0313, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000880, %g1, %r17
        setx  0x1f2dab3e7bf0fe62, %g1, %r0
        setx  0x5205a17e271edecc, %g1, %r1
        setx  0x21274db316251d8b, %g1, %r2
        setx  0xb0fb5bafa8af84c0, %g1, %r3
        setx  0x3c8e4f2c74a8f63e, %g1, %r4
        setx  0x922dd058fa2db441, %g1, %r5
        setx  0xdd2c353636f5f003, %g1, %r6
        setx  0xba07c95dc6440b33, %g1, %r7
        setx  0x58e6ba20140583c0, %g1, %r8
        setx  0x6fb6665d44583bfc, %g1, %r9
        setx  0xac672447840cd9e7, %g1, %r10
        setx  0x5d6ce2ecd3f16f11, %g1, %r11
        setx  0x53228e591edfd6a3, %g1, %r12
        setx  0xafb4adfcd3cb6927, %g1, %r13
        setx  0xcc23456d976b9191, %g1, %r14
        setx  0x9761fa21b7f3309e, %g1, %r15
        setx  0x70b013a7de3889b0, %g1, %r18
        setx  0xbb0d466f5267f3d1, %g1, %r19
        setx  0x9c211f0bf16a8819, %g1, %r20
        setx  0x49a70aaf1ff9ad16, %g1, %r21
        setx  0x4b9059af8d3b6af7, %g1, %r22
        setx  0x8eaf4ac203974dbd, %g1, %r23
        setx  0xc643d2b35043f452, %g1, %r24
        setx  0x3c6446c4d7286a38, %g1, %r25
        setx  0x7ffbc54c95fb7027, %g1, %r26
        setx  0xfd726cc2d541a866, %g1, %r27
        setx  0xba8f8575632458ee, %g1, %r28
        setx  0x9679f17aafe2d21f, %g1, %r29
        setx  0x80d3792c243ab0bb, %g1, %r30
        setx  0x0c1f8a2ad3223011, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000150, %g1, %r17
        setx  0x199cfd801fae650a, %g1, %r0
        setx  0x4ce458a44487dd5b, %g1, %r1
        setx  0x48289bca0012a2ab, %g1, %r2
        setx  0x7960d0e72ac142d8, %g1, %r3
        setx  0xdafedaba902ec93a, %g1, %r4
        setx  0x7948d4bdb60c5df7, %g1, %r5
        setx  0x0c85ef1db10c1e26, %g1, %r6
        setx  0xf8ac134ec2764a36, %g1, %r7
        setx  0x10537b3dbf49dc60, %g1, %r8
        setx  0x4222892503dfb97c, %g1, %r9
        setx  0xa42a6172fdcecf50, %g1, %r10
        setx  0x4ebe6ea19b2c4957, %g1, %r11
        setx  0xde30374cac6d84c7, %g1, %r12
        setx  0x61c303cf87ac79cf, %g1, %r13
        setx  0xb6bcc54bea29dbf6, %g1, %r14
        setx  0x6a941b03924f2b16, %g1, %r15
        setx  0xa36b1d18cf03cd1c, %g1, %r18
        setx  0xf1a4f5b2c06b434c, %g1, %r19
        setx  0xfa88695bc9ab8f4b, %g1, %r20
        setx  0x76a8b262623b25da, %g1, %r21
        setx  0xdc9e2e9724a9a935, %g1, %r22
        setx  0x541808526563983d, %g1, %r23
        setx  0xc02b39796f23f989, %g1, %r24
        setx  0xcb077861737605a1, %g1, %r25
        setx  0xc82df3aeda400791, %g1, %r26
        setx  0x7cf0acfd397e5a85, %g1, %r27
        setx  0x976d3d5477d5dfd7, %g1, %r28
        setx  0xaab6108fec8ac7f8, %g1, %r29
        setx  0x1f81701a7ff2d816, %g1, %r30
        setx  0xaf788c0e0f0fa6fc, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000cc0, %g1, %r17
        setx  0x2170145829a9292b, %g1, %r0
        setx  0x3d9221a8457ab76f, %g1, %r1
        setx  0x664d936e9b76e249, %g1, %r2
        setx  0x368de6235e1580df, %g1, %r3
        setx  0x00f7ef44c71ac2de, %g1, %r4
        setx  0x563eb7cb0fa3090f, %g1, %r5
        setx  0x48195f69ab789782, %g1, %r6
        setx  0xdeb2444f4917bba4, %g1, %r7
        setx  0x73c200c376159cdb, %g1, %r8
        setx  0xabf00050a9c45c92, %g1, %r9
        setx  0xd7f4da6303915a25, %g1, %r10
        setx  0x827345cadac22176, %g1, %r11
        setx  0xfedda056681b7a78, %g1, %r12
        setx  0x1f10b5760666f912, %g1, %r13
        setx  0x61ae2226b289a073, %g1, %r14
        setx  0x12765fd562358463, %g1, %r15
        setx  0xd26a86bb56b5b5c3, %g1, %r18
        setx  0x0c30ab1ec750f238, %g1, %r19
        setx  0x0ad7f821f9cb686d, %g1, %r20
        setx  0xfd246f7f069f7c9b, %g1, %r21
        setx  0xa0af875d3c859b10, %g1, %r22
        setx  0x27ae5c40b0305b8b, %g1, %r23
        setx  0xe4c399c10226bf50, %g1, %r24
        setx  0x6e9726200b11f84a, %g1, %r25
        setx  0x5f280c5d24ce7d67, %g1, %r26
        setx  0x25734f2e02804d0d, %g1, %r27
        setx  0x1d2b5ed27b9d455d, %g1, %r28
        setx  0x7a239ebe9896824a, %g1, %r29
        setx  0x592d9885022b7757, %g1, %r30
        setx  0x8033d8114bcb6d27, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000006d0, %g1, %r17
        setx  0x47250e965d2c7a0c, %g1, %r0
        setx  0x9eac82a8c8e91140, %g1, %r1
        setx  0x485a38b01598b8c0, %g1, %r2
        setx  0xcaa237d430d2c5b7, %g1, %r3
        setx  0x85a9a2b5178e7a43, %g1, %r4
        setx  0x84bd9f66d89ff5ee, %g1, %r5
        setx  0x6f6269d4315c7e70, %g1, %r6
        setx  0xfba5d43d5ef957cf, %g1, %r7
        setx  0xa0fd2552cfbde91f, %g1, %r8
        setx  0xaeca9401174278a6, %g1, %r9
        setx  0xdb8e8a1991bb860d, %g1, %r10
        setx  0x18a7de2245542dbc, %g1, %r11
        setx  0x2fd8ce59caf1c647, %g1, %r12
        setx  0x800802f1a6c54b6e, %g1, %r13
        setx  0x19b0f216b6e6c1a5, %g1, %r14
        setx  0xfea84ba3c3666143, %g1, %r15
        setx  0x881c5fa07ffae0b5, %g1, %r18
        setx  0x23c3f3590606051b, %g1, %r19
        setx  0xa2382140abb171a1, %g1, %r20
        setx  0xafc5531305887413, %g1, %r21
        setx  0x35e57534f051578a, %g1, %r22
        setx  0xe83d22fa71864e04, %g1, %r23
        setx  0xcc827b968a63bbe1, %g1, %r24
        setx  0x2f20c593ad3d44ae, %g1, %r25
        setx  0xa967a586523bb882, %g1, %r26
        setx  0x949f72c458adb8a4, %g1, %r27
        setx  0x78be2d2a7eefd420, %g1, %r28
        setx  0xe200a91c2f5833a3, %g1, %r29
        setx  0xb59e2dcb796e26ec, %g1, %r30
        setx  0xb7e6a67fb3d2b8b1, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000e50, %g1, %r17
        setx  0x981a1f8bd22b2bd0, %g1, %r0
        setx  0xb024187000e79203, %g1, %r1
        setx  0x079dbc921dac9e41, %g1, %r2
        setx  0x69c9a291f184493e, %g1, %r3
        setx  0x0bc64d3092192811, %g1, %r4
        setx  0xbefaf419bc075aa2, %g1, %r5
        setx  0x86417b8779d904cd, %g1, %r6
        setx  0xf56273ef6d3c42e7, %g1, %r7
        setx  0xad751212dffbddcf, %g1, %r8
        setx  0x41b7a1ed359f6179, %g1, %r9
        setx  0xc39396f0dce39365, %g1, %r10
        setx  0x4d832baad9b19f29, %g1, %r11
        setx  0x1e5642b79b36d352, %g1, %r12
        setx  0x9ff5dc85b6c1908d, %g1, %r13
        setx  0xece0a43ded5533ff, %g1, %r14
        setx  0xfe45f7a1a58f5f53, %g1, %r15
        setx  0xa1ad63de3f0ce695, %g1, %r18
        setx  0xcc7cb833b140099e, %g1, %r19
        setx  0x3d44a36981315821, %g1, %r20
        setx  0xdcd6dc2b01a3605b, %g1, %r21
        setx  0xebaa2cd5bf48fa3c, %g1, %r22
        setx  0xd6def768e1f31ac0, %g1, %r23
        setx  0x1f827b5391968380, %g1, %r24
        setx  0x2021c384fcee11d2, %g1, %r25
        setx  0xd9859857363b4dbd, %g1, %r26
        setx  0x33e45bd7370bf551, %g1, %r27
        setx  0xb1ac2ec11e385ce8, %g1, %r28
        setx  0x838e640aef5dad05, %g1, %r29
        setx  0xb3c597c3d1cbfce4, %g1, %r30
        setx  0x37e89ab23766526e, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000e80, %g1, %r17
        setx  0xd81ab6444a513ca6, %g1, %r0
        setx  0x12706caa9e9c6b94, %g1, %r1
        setx  0x6bffdd9c8f50dda4, %g1, %r2
        setx  0x0f92cd3c08efe840, %g1, %r3
        setx  0x980c22bab5ce45f9, %g1, %r4
        setx  0x4b7672350e929898, %g1, %r5
        setx  0xec6e46d77003991c, %g1, %r6
        setx  0x7cda256b814684a0, %g1, %r7
        setx  0x2aa8f5f5816a5368, %g1, %r8
        setx  0xf69fa6e5a77cd3d3, %g1, %r9
        setx  0xa5e889a467c6a17a, %g1, %r10
        setx  0xe8bf6d968efba152, %g1, %r11
        setx  0x87081bfd9a791809, %g1, %r12
        setx  0x980fb15da3d26fa5, %g1, %r13
        setx  0x9c0924a4519bbc35, %g1, %r14
        setx  0xafa470705e1a094b, %g1, %r15
        setx  0xd9d0448b1b11e07c, %g1, %r18
        setx  0x196911005c1d0732, %g1, %r19
        setx  0x994af8ed761b351c, %g1, %r20
        setx  0x85177f25cdb96c5e, %g1, %r21
        setx  0xd826053c127b22d7, %g1, %r22
        setx  0xc60dd3298c740deb, %g1, %r23
        setx  0x071ba01269d462db, %g1, %r24
        setx  0x8a1e71bf132a5583, %g1, %r25
        setx  0x0778993e51b4f804, %g1, %r26
        setx  0x4a308ba85d609ba8, %g1, %r27
        setx  0xb43da352b14f07c9, %g1, %r28
        setx  0x31be1961a7ddd9f2, %g1, %r29
        setx  0x16373d5ee47d190b, %g1, %r30
        setx  0x8ab80fbd66df3196, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000080, %g1, %r17
        setx  0xc9b404c1b9069448, %g1, %r0
        setx  0xd5f85e04f5443747, %g1, %r1
        setx  0x46013b4219498d05, %g1, %r2
        setx  0x9e351d6f05e9d997, %g1, %r3
        setx  0xd9ba9d542e20b847, %g1, %r4
        setx  0xea4b6a0809236e1a, %g1, %r5
        setx  0xb2204b7289db1f64, %g1, %r6
        setx  0x8bde32f8366b1fc0, %g1, %r7
        setx  0x938b4970a3d2e628, %g1, %r8
        setx  0x04ffa06dc6a86448, %g1, %r9
        setx  0x6084a4d8e38ec38c, %g1, %r10
        setx  0x7f34c302b86270b9, %g1, %r11
        setx  0x66f6770f668eec5a, %g1, %r12
        setx  0x5534c66495e70f2f, %g1, %r13
        setx  0xdbc166a3f4369401, %g1, %r14
        setx  0x6c642ddce4d16bb7, %g1, %r15
        setx  0x4c96cf93801e7ead, %g1, %r18
        setx  0x7cae3d12831a1e66, %g1, %r19
        setx  0xedbc4ebab9a83d6b, %g1, %r20
        setx  0xa7efc6a3ab594849, %g1, %r21
        setx  0x34d615157eccc79d, %g1, %r22
        setx  0xb0f0be1d214e9545, %g1, %r23
        setx  0xf2ce812d2cd70ca3, %g1, %r24
        setx  0x80b06f39b2a288c1, %g1, %r25
        setx  0x989bc8d396d08ae1, %g1, %r26
        setx  0x8d08c1701927ed53, %g1, %r27
        setx  0x9a49b2547739633c, %g1, %r28
        setx  0x461a361556c221ea, %g1, %r29
        setx  0x3a6107d3c6adca54, %g1, %r30
        setx  0xc741cc6cf7993baa, %g1, %r31
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
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,65)
	.word 0xc6942f06  ! 3: LDUHA_I	lduha	[%r16, + 0x0f06] %asi, %r3
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xd0941011  ! 5: LDUHA_R	lduha	[%r16, %r17] 0x80, %r8
	.word 0x88c40011  ! 7: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xa69c0011  ! 7: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x86b422d9  ! 7: ORNcc_I	orncc 	%r16, 0x02d9, %r3
	.word 0x8f643801  ! 7: MOVcc_I	<illegal instruction>
	.word 0x969c0011  ! 7: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x943c23cb  ! 7: XNOR_I	xnor 	%r16, 0x03cb, %r10
	.word 0xacbc282c  ! 7: XNORcc_I	xnorcc 	%r16, 0x082c, %r22
	.word 0xda942f20  ! 8: LDUHA_I	lduha	[%r16, + 0x0f20] %asi, %r13
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xd1142e1f  ! 10: LDQF_I	-	[%r16, 0x0e1f], %f8
	.word 0xaa342285  ! 12: ORN_I	orn 	%r16, 0x0285, %r21
	.word 0xa60c0011  ! 12: AND_R	and 	%r16, %r17, %r19
	.word 0x8244237e  ! 12: ADDC_I	addc 	%r16, 0x037e, %r1
	.word 0x8f7c2401  ! 12: MOVR_I	move	%r16, 0xfffffe34, %r7
	.word 0xb33c1011  ! 12: SRAX_R	srax	%r16, %r17, %r25
	.word 0xb22c2ab2  ! 12: ANDN_I	andn 	%r16, 0x0ab2, %r25
	.word 0x9a442856  ! 12: ADDC_I	addc 	%r16, 0x0856, %r13
	.word 0xf704277c  ! 13: LDF_I	ld	[%r16, 0x077c], %f27
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xd5841011  ! 15: LDFA_R	lda	[%r16, %r17], %f10
	.word 0xae4427df  ! 17: ADDC_I	addc 	%r16, 0x07df, %r23
	.word 0xba3c27b8  ! 17: XNOR_I	xnor 	%r16, 0x07b8, %r29
	.word 0xab2c3001  ! 17: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x9c440011  ! 17: ADDC_R	addc 	%r16, %r17, %r14
	.word 0x9e1c27eb  ! 17: XOR_I	xor 	%r16, 0x07eb, %r15
	.word 0x88140011  ! 17: OR_R	or 	%r16, %r17, %r4
	.word 0xb8c42c55  ! 17: ADDCcc_I	addccc 	%r16, 0x0c55, %r28
	.word 0x8eb40011  ! 17: ORNcc_R	orncc 	%r16, %r17, %r7
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,16)
	.word 0xfa8c2153  ! 19: LDUBA_I	lduba	[%r16, + 0x0153] %asi, %r29
	.word 0xf64c0011  ! 21: LDSB_R	ldsb	[%r16 + %r17], %r27
	.word 0xba4421c3  ! 23: ADDC_I	addc 	%r16, 0x01c3, %r29
	.word 0x85342001  ! 23: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x8e8c280d  ! 23: ANDcc_I	andcc 	%r16, 0x080d, %r7
	.word 0x9f2c1011  ! 23: SLLX_R	sllx	%r16, %r17, %r15
	.word 0xa7643801  ! 23: MOVcc_I	<illegal instruction>
	.word 0xaa9c2242  ! 23: XORcc_I	xorcc 	%r16, 0x0242, %r21
	.word 0x94442463  ! 23: ADDC_I	addc 	%r16, 0x0463, %r10
	.word 0xa8442256  ! 23: ADDC_I	addc 	%r16, 0x0256, %r20
	.word 0xf904290a  ! 24: LDF_I	ld	[%r16, 0x090a], %f28
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xc4140011  ! 26: LDUH_R	lduh	[%r16 + %r17], %r2
	.word 0xb2142c96  ! 28: OR_I	or 	%r16, 0x0c96, %r25
	.word 0x9b7c2401  ! 28: MOVR_I	move	%r16, 0xfffffe34, %r13
	.word 0x85643801  ! 28: MOVcc_I	<illegal instruction>
	.word 0x89341011  ! 28: SRLX_R	srlx	%r16, %r17, %r4
	.word 0xb9341011  ! 28: SRLX_R	srlx	%r16, %r17, %r28
	.word 0xad2c1011  ! 28: SLLX_R	sllx	%r16, %r17, %r22
	.word 0x9f343001  ! 28: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0xd4d4297d  ! 29: LDSHA_I	ldsha	[%r16, + 0x097d] %asi, %r10
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xde841011  ! 31: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r15
	.word 0x8b340011  ! 33: SRL_R	srl 	%r16, %r17, %r5
	.word 0xaa9c0011  ! 33: XORcc_R	xorcc 	%r16, %r17, %r21
	.word 0x9e3c0011  ! 33: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0x96842f2b  ! 33: ADDcc_I	addcc 	%r16, 0x0f2b, %r11
	.word 0x90142a63  ! 33: OR_I	or 	%r16, 0x0a63, %r8
	.word 0x897c2401  ! 33: MOVR_I	move	%r16, 0xfffffe34, %r4
	.word 0xb8140011  ! 33: OR_R	or 	%r16, %r17, %r28
	.word 0xea8c1011  ! 34: LDUBA_R	lduba	[%r16, %r17] 0x80, %r21
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xc8142b5f  ! 36: LDUH_I	lduh	[%r16 + 0x0b5f], %r4
	.word 0x903c240e  ! 38: XNOR_I	xnor 	%r16, 0x040e, %r8
	.word 0x917c0411  ! 38: MOVR_R	move	%r16, %r17, %r8
	.word 0x948c0011  ! 38: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x88942da4  ! 38: ORcc_I	orcc 	%r16, 0x0da4, %r4
	.word 0x84142853  ! 38: OR_I	or 	%r16, 0x0853, %r2
	.word 0x9f2c3001  ! 38: SLLX_I	sllx	%r16, 0x0001, %r15
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,46)
	.word 0xcf1c0000  ! 40: LDDF_R	ldd	[%r16, %r0], %f7
	.word 0xfa841011  ! 42: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r29
	.word 0xa6140011  ! 44: OR_R	or 	%r16, %r17, %r19
	.word 0x8a2c0011  ! 44: ANDN_R	andn 	%r16, %r17, %r5
	.word 0x997c0411  ! 44: MOVR_R	move	%r16, %r17, %r12
	.word 0x829c0011  ! 44: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0xa77c2401  ! 44: MOVR_I	move	%r16, 0xfffffe34, %r19
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,19)
	.word 0xe79c1000  ! 46: LDDFA_R	ldda	[%r16, %r0], %f19
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xdf941011  ! 48: LDQFA_R	-	[%r16, %r17], %f15
	.word 0x90340011  ! 50: ORN_R	orn 	%r16, %r17, %r8
	.word 0xb21c0011  ! 50: XOR_R	xor 	%r16, %r17, %r25
	.word 0xaeb42f07  ! 50: ORNcc_I	orncc 	%r16, 0x0f07, %r23
	.word 0x9e1c2f39  ! 50: XOR_I	xor 	%r16, 0x0f39, %r15
	.word 0xbab4228b  ! 50: ORNcc_I	orncc 	%r16, 0x028b, %r29
	.word 0x9aac0011  ! 50: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x8d2c1011  ! 50: SLLX_R	sllx	%r16, %r17, %r6
	.word 0xc39c1011  ! 51: LDDFA_R	ldda	[%r16, %r17], %f1
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xeb042279  ! 53: LDF_I	ld	[%r16, 0x0279], %f21
	.word 0x961c0011  ! 55: XOR_R	xor 	%r16, %r17, %r11
	.word 0x972c3001  ! 55: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0xb09c0011  ! 55: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x8d2c1011  ! 55: SLLX_R	sllx	%r16, %r17, %r6
	.word 0x83343001  ! 55: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0xd04420b9  ! 56: LDSW_I	ldsw	[%r16 + 0x00b9], %r8
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xf0cc1011  ! 58: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r24
	.word 0xb6b429e8  ! 60: ORNcc_I	orncc 	%r16, 0x09e8, %r27
	.word 0xa8340011  ! 60: ORN_R	orn 	%r16, %r17, %r20
	.word 0x90040011  ! 60: ADD_R	add 	%r16, %r17, %r8
	.word 0x988c2423  ! 60: ANDcc_I	andcc 	%r16, 0x0423, %r12
	.word 0x9a342bfc  ! 60: ORN_I	orn 	%r16, 0x0bfc, %r13
	.word 0x892c0011  ! 60: SLL_R	sll 	%r16, %r17, %r4
	.word 0x828c2414  ! 60: ANDcc_I	andcc 	%r16, 0x0414, %r1
	.word 0x9f2c0011  ! 60: SLL_R	sll 	%r16, %r17, %r15
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,33)
	.word 0xca5c0000  ! 62: LDX_R	ldx	[%r16 + %r0], %r5
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xc4b41011  ! 64: STHA_R	stha	%r2, [%r16 + %r17] 0x80
	.word 0x82940011  ! 66: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x9ebc27ee  ! 66: XNORcc_I	xnorcc 	%r16, 0x07ee, %r15
	.word 0x9cbc0011  ! 66: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0x8abc23f3  ! 66: XNORcc_I	xnorcc 	%r16, 0x03f3, %r5
	.word 0x90140011  ! 66: OR_R	or 	%r16, %r17, %r8
	.word 0x8cbc2710  ! 66: XNORcc_I	xnorcc 	%r16, 0x0710, %r6
	.word 0x857c0411  ! 66: MOVR_R	move	%r16, %r17, %r2
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,65)
	.word 0xd91c0000  ! 68: LDDF_R	ldd	[%r16, %r0], %f12
	.word 0xd9941011  ! 70: LDQFA_R	-	[%r16, %r17], %f12
	.word 0xb22c0011  ! 72: ANDN_R	andn 	%r16, %r17, %r25
	.word 0xb33c1011  ! 72: SRAX_R	srax	%r16, %r17, %r25
	.word 0x8cac239b  ! 72: ANDNcc_I	andncc 	%r16, 0x039b, %r6
	.word 0xb2040011  ! 72: ADD_R	add 	%r16, %r17, %r25
	.word 0x94142402  ! 72: OR_I	or 	%r16, 0x0402, %r10
	.word 0xb0140011  ! 72: OR_R	or 	%r16, %r17, %r24
	.word 0xb4040011  ! 72: ADD_R	add 	%r16, %r17, %r26
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,58)
	.word 0xca4c22d9  ! 74: LDSB_I	ldsb	[%r16 + 0x02d9], %r5
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xcd1c0011  ! 76: LDDF_R	ldd	[%r16, %r17], %f6
	.word 0xb0bc2dc5  ! 78: XNORcc_I	xnorcc 	%r16, 0x0dc5, %r24
	.word 0xab343001  ! 78: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0x88842d41  ! 78: ADDcc_I	addcc 	%r16, 0x0d41, %r4
	.word 0x9a140011  ! 78: OR_R	or 	%r16, %r17, %r13
	.word 0x997c2401  ! 78: MOVR_I	move	%r16, 0xfffffe34, %r12
	.word 0x91340011  ! 78: SRL_R	srl 	%r16, %r17, %r8
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,25)
	.word 0xca8c2c1c  ! 80: LDUBA_I	lduba	[%r16, + 0x0c1c] %asi, %r5
	.word 0xf51423f0  ! 82: LDQF_I	-	[%r16, 0x03f0], %f26
	.word 0x821c0011  ! 84: XOR_R	xor 	%r16, %r17, %r1
	.word 0x85643801  ! 84: MOVcc_I	<illegal instruction>
	.word 0x912c1011  ! 84: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x8e2c0011  ! 84: ANDN_R	andn 	%r16, %r17, %r7
	.word 0x86c40011  ! 84: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x989c2d0f  ! 84: XORcc_I	xorcc 	%r16, 0x0d0f, %r12
	.word 0xe68c2a73  ! 85: LDUBA_I	lduba	[%r16, + 0x0a73] %asi, %r19
	.word 0xdf9c1011  ! 87: LDDFA_R	ldda	[%r16, %r17], %f15
	.word 0x873c0011  ! 89: SRA_R	sra 	%r16, %r17, %r3
	.word 0x8c840011  ! 89: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xab3c1011  ! 89: SRAX_R	srax	%r16, %r17, %r21
	.word 0x9b7c0411  ! 89: MOVR_R	move	%r16, %r17, %r13
	.word 0xb0bc0011  ! 89: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0xaebc2ce9  ! 89: XNORcc_I	xnorcc 	%r16, 0x0ce9, %r23
	.word 0x9b341011  ! 89: SRLX_R	srlx	%r16, %r17, %r13
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,39)
	.word 0xde1c0000  ! 91: LDD_R	ldd	[%r16 + %r0], %r15
	.word 0xd7f42011  ! 93: CASXA_R	casxa	[%r16]%asi, %r17, %r11
	.word 0x963c2919  ! 95: XNOR_I	xnor 	%r16, 0x0919, %r11
	.word 0xb33c1011  ! 95: SRAX_R	srax	%r16, %r17, %r25
	.word 0x9c340011  ! 95: ORN_R	orn 	%r16, %r17, %r14
	.word 0xb0040011  ! 95: ADD_R	add 	%r16, %r17, %r24
	.word 0x863c0011  ! 95: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0xbb643801  ! 95: MOVcc_I	<illegal instruction>
	.word 0xc3042e19  ! 96: LDF_I	ld	[%r16, 0x0e19], %f1
        wr %g0, 0x4, %fprs
	.word 0xac4425db  ! 100: ADDC_I	addc 	%r16, 0x05db, %r22
	.word 0xb68c2f60  ! 100: ANDcc_I	andcc 	%r16, 0x0f60, %r27
	.word 0x882c0011  ! 100: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xb2840011  ! 100: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0xaec40011  ! 100: ADDCcc_R	addccc 	%r16, %r17, %r23
thr1_dc_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_9), 16, 16),1,DC_DATA,30)
	.word 0xdd841000  ! 102: LDFA_R	lda	[%r16, %r0], %f14
	.word 0xdcc41011  ! 104: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r14
	.word 0x8c042a1e  ! 106: ADD_I	add 	%r16, 0x0a1e, %r6
	.word 0x9c842048  ! 106: ADDcc_I	addcc 	%r16, 0x0048, %r14
	.word 0x9c140011  ! 106: OR_R	or 	%r16, %r17, %r14
	.word 0x909427f8  ! 106: ORcc_I	orcc 	%r16, 0x07f8, %r8
	.word 0xb57c2401  ! 106: MOVR_I	move	%r16, 0xfffffe34, %r26
	.word 0xaeb42bc2  ! 106: ORNcc_I	orncc 	%r16, 0x0bc2, %r23
	.word 0x9f341011  ! 106: SRLX_R	srlx	%r16, %r17, %r15
	.word 0x88142ed1  ! 106: OR_I	or 	%r16, 0x0ed1, %r4
	.word 0xd9941011  ! 107: LDQFA_R	-	[%r16, %r17], %f12
	.word 0xf0f42b82  ! 109: STXA_I	stxa	%r24, [%r16 + 0x0b82] %asi
	.word 0xb0ac245e  ! 111: ANDNcc_I	andncc 	%r16, 0x045e, %r24
	.word 0x9a840011  ! 111: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0xb5341011  ! 111: SRLX_R	srlx	%r16, %r17, %r26
	.word 0x961c24a9  ! 111: XOR_I	xor 	%r16, 0x04a9, %r11
	.word 0xb6342d4a  ! 111: ORN_I	orn 	%r16, 0x0d4a, %r27
	.word 0x857c2401  ! 111: MOVR_I	move	%r16, 0xfffffe34, %r2
	.word 0xb03c2195  ! 111: XNOR_I	xnor 	%r16, 0x0195, %r24
	.word 0xde542b58  ! 112: LDSH_I	ldsh	[%r16 + 0x0b58], %r15
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0x8a5c2b53  ! 114: SMUL_I	smul 	%r16, 0x0b53, %r5
	.word 0x9c8423b6  ! 116: ADDcc_I	addcc 	%r16, 0x03b6, %r14
	.word 0x8f2c3001  ! 116: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x8eac2687  ! 116: ANDNcc_I	andncc 	%r16, 0x0687, %r7
	.word 0x9f340011  ! 116: SRL_R	srl 	%r16, %r17, %r15
	.word 0x8c042e62  ! 116: ADD_I	add 	%r16, 0x0e62, %r6
	.word 0x9e942e50  ! 117: ORcc_I	orcc 	%r16, 0x0e50, %r15
	.word 0x853c2001  ! 117: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0x848c0011  ! 117: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x8c4427c3  ! 117: ADDC_I	addc 	%r16, 0x07c3, %r6
	.word 0x82c42da0  ! 117: ADDCcc_I	addccc 	%r16, 0x0da0, %r1
	.word 0x9e1c20ca  ! 117: XOR_I	xor 	%r16, 0x00ca, %r15
	.word 0x853c1011  ! 117: SRAX_R	srax	%r16, %r17, %r2
	rd      %pc, %r18
	set     0x20, %r17
thr1_dc_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_10), 16, 16),1,DC_DATA,31)
	.word 0xdcc41000  ! 118: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r14
	return     %r18 + 0x20
	.word 0xb4440011  ! 121: ADDC_R	addc 	%r16, %r17, %r26
	.word 0x8a042110  ! 121: ADD_I	add 	%r16, 0x0110, %r5
	.word 0x8a8c230c  ! 121: ANDcc_I	andcc 	%r16, 0x030c, %r5
	.word 0x8f3c2001  ! 121: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0xaa442867  ! 121: ADDC_I	addc 	%r16, 0x0867, %r21
	.word 0x923c24c3  ! 121: XNOR_I	xnor 	%r16, 0x04c3, %r9
	.word 0x948c22bf  ! 121: ANDcc_I	andcc 	%r16, 0x02bf, %r10
	.word 0xdacc1011  ! 122: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r13
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xea1c2fcb  ! 124: LDD_I	ldd	[%r16 + 0x0fcb], %r21
	.word 0x972c3001  ! 126: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0xaf7c0411  ! 126: MOVR_R	move	%r16, %r17, %r23
	.word 0xba940011  ! 126: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x90bc2e2f  ! 126: XNORcc_I	xnorcc 	%r16, 0x0e2f, %r8
	.word 0xa6442073  ! 126: ADDC_I	addc 	%r16, 0x0073, %r19
	.word 0x8c0426d8  ! 126: ADD_I	add 	%r16, 0x06d8, %r6
	.word 0xb2b420bf  ! 126: ORNcc_I	orncc 	%r16, 0x00bf, %r25
	.word 0xe64c0011  ! 127: LDSB_R	ldsb	[%r16 + %r17], %r19
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xef1429c5  ! 129: LDQF_I	-	[%r16, 0x09c5], %f23
	.word 0x88340011  ! 131: ORN_R	orn 	%r16, %r17, %r4
	.word 0x848c0011  ! 131: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0xbac40011  ! 131: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0x841c25f3  ! 131: XOR_I	xor 	%r16, 0x05f3, %r2
	.word 0xa92c3001  ! 131: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0xf7042e02  ! 132: LDF_I	ld	[%r16, 0x0e02], %f27
!Illinst alu
	.word 0xb294223f  ! 134: ORcc_I	orcc 	%r16, 0x023f, %r25
	.word 0x903c2464  ! 136: XNOR_I	xnor 	%r16, 0x0464, %r8
	.word 0x92140011  ! 136: OR_R	or 	%r16, %r17, %r9
	.word 0x8a142015  ! 136: OR_I	or 	%r16, 0x0015, %r5
	.word 0x983c0011  ! 136: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0xa63c0011  ! 136: XNOR_R	xnor 	%r16, %r17, %r19
	.word 0xc404289a  ! 137: LDUW_I	lduw	[%r16 + 0x089a], %r2
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xcac41011  ! 139: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r5
	.word 0x880c21a7  ! 141: AND_I	and 	%r16, 0x01a7, %r4
	.word 0xac040011  ! 141: ADD_R	add 	%r16, %r17, %r22
	.word 0xb0ac0011  ! 141: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0x949c0011  ! 141: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0x8ab40011  ! 141: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0x96c42fa7  ! 141: ADDCcc_I	addccc 	%r16, 0x0fa7, %r11
	.word 0xb82c216b  ! 141: ANDN_I	andn 	%r16, 0x016b, %r28
	.word 0x92c40011  ! 141: ADDCcc_R	addccc 	%r16, %r17, %r9
thr1_dc_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_11), 16, 16),1,DC_DATA,0)
	.word 0xda9c224a  ! 143: LDDA_I	ldda	[%r16, + 0x024a] %asi, %r13
	.word 0xc6040011  ! 145: LDUW_R	lduw	[%r16 + %r17], %r3
	.word 0x9f2c0011  ! 147: SLL_R	sll 	%r16, %r17, %r15
	.word 0xac3c0011  ! 147: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x9b341011  ! 147: SRLX_R	srlx	%r16, %r17, %r13
	.word 0xad7c0411  ! 147: MOVR_R	move	%r16, %r17, %r22
	.word 0xba3c2a76  ! 147: XNOR_I	xnor 	%r16, 0x0a76, %r29
thr1_dc_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_12), 16, 16),1,DC_DATA,20)
	.word 0xeb042856  ! 149: LDF_I	ld	[%r16, 0x0856], %f21
	.word 0xf45c2559  ! 151: LDX_I	ldx	[%r16 + 0x0559], %r26
	.word 0xacc424a4  ! 153: ADDCcc_I	addccc 	%r16, 0x04a4, %r22
	.word 0xae940011  ! 153: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0xba44293d  ! 153: ADDC_I	addc 	%r16, 0x093d, %r29
	.word 0xba042736  ! 153: ADD_I	add 	%r16, 0x0736, %r29
	.word 0x83641811  ! 153: MOVcc_R	<illegal instruction>
	.word 0x900c265e  ! 153: AND_I	and 	%r16, 0x065e, %r8
	.word 0x8f643801  ! 153: MOVcc_I	<illegal instruction>
	.word 0xb0bc0011  ! 153: XNORcc_R	xnorcc 	%r16, %r17, %r24
thr1_dc_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_13), 16, 16),1,DC_DATA,29)
	.word 0xe80c28d1  ! 155: LDUB_I	ldub	[%r16 + 0x08d1], %r20
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xdf9c1011  ! 157: LDDFA_R	ldda	[%r16, %r17], %f15
	.word 0x9e3424cd  ! 159: ORN_I	orn 	%r16, 0x04cd, %r15
	.word 0xba1c0011  ! 159: XOR_R	xor 	%r16, %r17, %r29
	.word 0x853c0011  ! 159: SRA_R	sra 	%r16, %r17, %r2
	.word 0x95641811  ! 159: MOVcc_R	<illegal instruction>
	.word 0x98942fe2  ! 159: ORcc_I	orcc 	%r16, 0x0fe2, %r12
	.word 0xdecc2a3c  ! 160: LDSBA_I	ldsba	[%r16, + 0x0a3c] %asi, %r15
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xdc742b1c  ! 164: STX_I	stx	%r14, [%r16 + 0x0b1c]
	.word 0x9e1426ed  ! 166: OR_I	or 	%r16, 0x06ed, %r15
	.word 0x8ab429f1  ! 166: ORNcc_I	orncc 	%r16, 0x09f1, %r5
	.word 0x9e9c0011  ! 166: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0xb1643801  ! 166: MOVcc_I	<illegal instruction>
	.word 0x82942016  ! 166: ORcc_I	orcc 	%r16, 0x0016, %r1
	.word 0xaa0c21a4  ! 166: AND_I	and 	%r16, 0x01a4, %r21
	.word 0x9cc40011  ! 166: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0xf81c2adc  ! 167: LDD_I	ldd	[%r16 + 0x0adc], %r28
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xd4742544  ! 171: STX_I	stx	%r10, [%r16 + 0x0544]
	.word 0x873c0011  ! 173: SRA_R	sra 	%r16, %r17, %r3
	.word 0xba2c0011  ! 173: ANDN_R	andn 	%r16, %r17, %r29
	.word 0x852c0011  ! 173: SLL_R	sll 	%r16, %r17, %r2
	.word 0x84342655  ! 173: ORN_I	orn 	%r16, 0x0655, %r2
	.word 0x96842628  ! 173: ADDcc_I	addcc 	%r16, 0x0628, %r11
	.word 0x82340011  ! 173: ORN_R	orn 	%r16, %r17, %r1
	.word 0xb3340011  ! 173: SRL_R	srl 	%r16, %r17, %r25
	.word 0xcecc1011  ! 174: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r7
	.word 0xf8540011  ! 176: LDSH_R	ldsh	[%r16 + %r17], %r28
	.word 0x8c0c233c  ! 178: AND_I	and 	%r16, 0x033c, %r6
	.word 0x8e342a89  ! 178: ORN_I	orn 	%r16, 0x0a89, %r7
	.word 0x843c2b5a  ! 178: XNOR_I	xnor 	%r16, 0x0b5a, %r2
	.word 0xb5341011  ! 178: SRLX_R	srlx	%r16, %r17, %r26
	.word 0xb52c2001  ! 178: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0x897c2401  ! 178: MOVR_I	move	%r16, 0xfffffe34, %r4
	.word 0x92142780  ! 178: OR_I	or 	%r16, 0x0780, %r9
	.word 0x993c1011  ! 178: SRAX_R	srax	%r16, %r17, %r12
	.word 0xd81c2e1e  ! 179: LDD_I	ldd	[%r16 + 0x0e1e], %r12
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xf5140011  ! 181: LDQF_R	-	[%r16, %r17], %f26
	.word 0xb8b40011  ! 183: ORNcc_R	orncc 	%r16, %r17, %r28
	.word 0x9f643801  ! 183: MOVcc_I	<illegal instruction>
	.word 0xb5643801  ! 183: MOVcc_I	<illegal instruction>
	.word 0xaec40011  ! 183: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0x841c2cf7  ! 183: XOR_I	xor 	%r16, 0x0cf7, %r2
	.word 0xba9c22bc  ! 183: XORcc_I	xorcc 	%r16, 0x02bc, %r29
	.word 0xb2c40011  ! 183: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0x8e440011  ! 183: ADDC_R	addc 	%r16, %r17, %r7
	.word 0xd48c2757  ! 184: LDUBA_I	lduba	[%r16, + 0x0757] %asi, %r10
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xf8440011  ! 186: LDSW_R	ldsw	[%r16 + %r17], %r28
	.word 0xa81c0011  ! 188: XOR_R	xor 	%r16, %r17, %r20
	.word 0x833c1011  ! 188: SRAX_R	srax	%r16, %r17, %r1
	.word 0x8b342001  ! 188: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x98bc0011  ! 188: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x8a0c0011  ! 188: AND_R	and 	%r16, %r17, %r5
	.word 0xb02c2172  ! 189: ANDN_I	andn 	%r16, 0x0172, %r24
	.word 0x9f341011  ! 189: SRLX_R	srlx	%r16, %r17, %r15
	.word 0xa89c28f9  ! 189: XORcc_I	xorcc 	%r16, 0x08f9, %r20
	.word 0x89342001  ! 189: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x95641811  ! 189: MOVcc_R	<illegal instruction>
	.word 0xa7643801  ! 189: MOVcc_I	<illegal instruction>
	.word 0x90442c52  ! 189: ADDC_I	addc 	%r16, 0x0c52, %r8
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd25c2bf0  ! 189: LDX_I	ldx	[%r16 + 0x0bf0], %r9
thr1_irf_ce_20:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_20), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0x8d641811  ! 192: MOVcc_R	<illegal instruction>
	.word 0x908c0011  ! 192: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x8e0c0011  ! 192: AND_R	and 	%r16, %r17, %r7
	.word 0x83340011  ! 192: SRL_R	srl 	%r16, %r17, %r1
	.word 0x9e3c0011  ! 192: XNOR_R	xnor 	%r16, %r17, %r15
thr1_dc_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_14), 16, 16),1,DC_DATA,62)
	.word 0xde841000  ! 194: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r15
thr1_irf_ce_21:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_21), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xc8742bd9  ! 198: STX_I	stx	%r4, [%r16 + 0x0bd9]
	.word 0x82940011  ! 200: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x92942fdd  ! 200: ORcc_I	orcc 	%r16, 0x0fdd, %r9
	.word 0x9b3c0011  ! 200: SRA_R	sra 	%r16, %r17, %r13
	.word 0xae0c2f72  ! 200: AND_I	and 	%r16, 0x0f72, %r23
	.word 0x877c2401  ! 200: MOVR_I	move	%r16, 0xfffffe34, %r3
	.word 0x94c4200e  ! 200: ADDCcc_I	addccc 	%r16, 0x000e, %r10
	.word 0xb0440011  ! 200: ADDC_R	addc 	%r16, %r17, %r24
	.word 0x96040011  ! 200: ADD_R	add 	%r16, %r17, %r11
thr1_dc_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_15), 16, 16),1,DC_DATA,29)
	.word 0xf71c0000  ! 202: LDDF_R	ldd	[%r16, %r0], %f27
thr1_irf_ce_22:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_22), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xe8540011  ! 204: LDSH_R	ldsh	[%r16 + %r17], %r20
	.word 0xb0340011  ! 206: ORN_R	orn 	%r16, %r17, %r24
	.word 0x9ac40011  ! 206: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xa6bc0011  ! 206: XNORcc_R	xnorcc 	%r16, %r17, %r19
	.word 0x9c940011  ! 206: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0xb97c2401  ! 206: MOVR_I	move	%r16, 0xfffffe34, %r28
	.word 0xdcc41011  ! 207: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r14
	.word 0xf71c24ed  ! 209: LDDF_I	ldd	[%r16, 0x04ed], %f27
	.word 0xb814271f  ! 211: OR_I	or 	%r16, 0x071f, %r28
	.word 0xa72c1011  ! 211: SLLX_R	sllx	%r16, %r17, %r19
	.word 0xa7341011  ! 211: SRLX_R	srlx	%r16, %r17, %r19
	.word 0x86340011  ! 211: ORN_R	orn 	%r16, %r17, %r3
	.word 0x9c2c0011  ! 211: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x9b3c1011  ! 211: SRAX_R	srax	%r16, %r17, %r13
	.word 0xaa9c28b1  ! 211: XORcc_I	xorcc 	%r16, 0x08b1, %r21
	.word 0x9e342208  ! 211: ORN_I	orn 	%r16, 0x0208, %r15
thr1_dc_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_16), 16, 16),1,DC_DATA,65)
	.word 0xd7040000  ! 213: LDF_R	ld	[%r16, %r0], %f11
thr1_irf_ce_23:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_23), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xf9841011  ! 215: LDFA_R	lda	[%r16, %r17], %f28
	.word 0x908c0011  ! 217: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x9eac2906  ! 217: ANDNcc_I	andncc 	%r16, 0x0906, %r15
	.word 0x829c0011  ! 217: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x90bc29d0  ! 217: XNORcc_I	xnorcc 	%r16, 0x09d0, %r8
	.word 0xb7342001  ! 217: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xb13c0011  ! 217: SRA_R	sra 	%r16, %r17, %r24
	.word 0x8c8c0011  ! 217: ANDcc_R	andcc 	%r16, %r17, %r6
thr1_dc_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_17), 16, 16),1,DC_DATA,11)
	.word 0xdf1c0000  ! 219: LDDF_R	ldd	[%r16, %r0], %f15
thr1_irf_ce_24:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_24), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xd5941011  ! 221: LDQFA_R	-	[%r16, %r17], %f10
	.word 0xb89c0011  ! 223: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0xb8440011  ! 223: ADDC_R	addc 	%r16, %r17, %r28
	.word 0x8f2c1011  ! 223: SLLX_R	sllx	%r16, %r17, %r7
	.word 0xb4340011  ! 223: ORN_R	orn 	%r16, %r17, %r26
	.word 0x868c2be5  ! 223: ANDcc_I	andcc 	%r16, 0x0be5, %r3
	.word 0x8e140011  ! 223: OR_R	or 	%r16, %r17, %r7
	.word 0xa93c0011  ! 223: SRA_R	sra 	%r16, %r17, %r20
	.word 0x8b341011  ! 223: SRLX_R	srlx	%r16, %r17, %r5
	.word 0xcc0c0011  ! 224: LDUB_R	ldub	[%r16 + %r17], %r6
	.word 0xc36c2113  ! 226: PREFETCH_I	prefetch	[%r16 + 0x0113], #one_read
	.word 0xb53c1011  ! 228: SRAX_R	srax	%r16, %r17, %r26
	.word 0xb72c0011  ! 228: SLL_R	sll 	%r16, %r17, %r27
	.word 0x8f2c0011  ! 228: SLL_R	sll 	%r16, %r17, %r7
	.word 0x82b421ff  ! 228: ORNcc_I	orncc 	%r16, 0x01ff, %r1
	.word 0x94ac0011  ! 228: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xb57c0411  ! 228: MOVR_R	move	%r16, %r17, %r26
	.word 0x9a3c0011  ! 228: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x8d2c0011  ! 228: SLL_R	sll 	%r16, %r17, %r6
	.word 0xde8c2d68  ! 229: LDUBA_I	lduba	[%r16, + 0x0d68] %asi, %r15
thr1_irf_ce_25:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_25), 16, 16),1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xde5c2773  ! 231: LDX_I	ldx	[%r16 + 0x0773], %r15
	.word 0x8f2c2001  ! 233: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x843c0011  ! 233: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0x94ac0011  ! 233: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x9c140011  ! 233: OR_R	or 	%r16, %r17, %r14
	.word 0xb83c2b77  ! 233: XNOR_I	xnor 	%r16, 0x0b77, %r28
	.word 0xa88c0011  ! 233: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0x92b40011  ! 233: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xf2140011  ! 234: LDUH_R	lduh	[%r16 + %r17], %r25
thr1_irf_ce_26:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_26), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0x81534000  ! 236: RDPR_OTHERWIN	rdpr	%otherwin, %r0
	.word 0x8a3c24b8  ! 238: XNOR_I	xnor 	%r16, 0x04b8, %r5
	.word 0x8c3c0011  ! 238: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0xb2b42958  ! 238: ORNcc_I	orncc 	%r16, 0x0958, %r25
	.word 0x95341011  ! 238: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x9e3c2959  ! 238: XNOR_I	xnor 	%r16, 0x0959, %r15
thr1_dc_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_18), 16, 16),1,DC_DATA,54)
	.word 0xc51c0000  ! 240: LDDF_R	ldd	[%r16, %r0], %f2
thr1_irf_ce_27:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_27), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xccc42b9b  ! 242: LDSWA_I	ldswa	[%r16, + 0x0b9b] %asi, %r6
	.word 0xb37c2401  ! 244: MOVR_I	move	%r16, 0xfffffe34, %r25
	.word 0xa60c2aa9  ! 244: AND_I	and 	%r16, 0x0aa9, %r19
	.word 0x85342001  ! 244: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x97341011  ! 244: SRLX_R	srlx	%r16, %r17, %r11
	.word 0x9d2c0011  ! 244: SLL_R	sll 	%r16, %r17, %r14
	.word 0x8e9429e3  ! 244: ORcc_I	orcc 	%r16, 0x09e3, %r7
	.word 0xb6042778  ! 244: ADD_I	add 	%r16, 0x0778, %r27
	.word 0xe6c4272d  ! 245: LDSWA_I	ldswa	[%r16, + 0x072d] %asi, %r19
thr1_irf_ce_28:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_28), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xea0c2591  ! 247: LDUB_I	ldub	[%r16 + 0x0591], %r21
	.word 0xa73c0011  ! 249: SRA_R	sra 	%r16, %r17, %r19
	.word 0xb73c2001  ! 249: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0xaa940011  ! 249: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0xb0842bc8  ! 249: ADDcc_I	addcc 	%r16, 0x0bc8, %r24
	.word 0xb49c0011  ! 249: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xa6042bf7  ! 249: ADD_I	add 	%r16, 0x0bf7, %r19
	.word 0x848c0011  ! 249: ANDcc_R	andcc 	%r16, %r17, %r2
thr1_dc_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_19), 16, 16),1,DC_DATA,55)
	.word 0xee5c0000  ! 251: LDX_R	ldx	[%r16 + %r0], %r23
	.word 0xc51c2804  ! 253: LDDF_I	ldd	[%r16, 0x0804], %f2
	.word 0x9e940011  ! 255: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x92bc0011  ! 255: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0xb2c4260f  ! 255: ADDCcc_I	addccc 	%r16, 0x060f, %r25
	.word 0xb83c0011  ! 255: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0x92842ef3  ! 255: ADDcc_I	addcc 	%r16, 0x0ef3, %r9
	.word 0xc5040011  ! 256: LDF_R	ld	[%r16, %r17], %f2
!Illinst alu
	.word 0xac942399  ! 258: ORcc_I	orcc 	%r16, 0x0399, %r22
	.word 0x9b7c0411  ! 260: MOVR_R	move	%r16, %r17, %r13
	.word 0x960422be  ! 260: ADD_I	add 	%r16, 0x02be, %r11
	.word 0xb0840011  ! 260: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0xb00c2376  ! 260: AND_I	and 	%r16, 0x0376, %r24
	.word 0xb68c0011  ! 260: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x9a8c27eb  ! 260: ANDcc_I	andcc 	%r16, 0x07eb, %r13
	.word 0x82040011  ! 260: ADD_R	add 	%r16, %r17, %r1
thr1_dc_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_20), 16, 16),1,DC_DATA,49)
	.word 0xe9941000  ! 262: LDQFA_R	-	[%r16, %r0], %f20
	.word 0xd85c0011  ! 264: LDX_R	ldx	[%r16 + %r17], %r12
	.word 0x9f2c2001  ! 266: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0xb2ac2ef2  ! 266: ANDNcc_I	andncc 	%r16, 0x0ef2, %r25
	.word 0x863c0011  ! 266: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0x8d342001  ! 266: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x9f7c2401  ! 266: MOVR_I	move	%r16, 0xfffffe34, %r15
	.word 0x852c2001  ! 266: SLL_I	sll 	%r16, 0x0001, %r2
thr1_dc_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_21), 16, 16),1,DC_DATA,59)
	.word 0xc59c1000  ! 268: LDDFA_R	ldda	[%r16, %r0], %f2
	.word 0xca4428c1  ! 270: LDSW_I	ldsw	[%r16 + 0x08c1], %r5
	.word 0x8e1c0011  ! 272: XOR_R	xor 	%r16, %r17, %r7
	.word 0xa6bc0011  ! 272: XNORcc_R	xnorcc 	%r16, %r17, %r19
	.word 0x8d2c3001  ! 272: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0xb2c42032  ! 272: ADDCcc_I	addccc 	%r16, 0x0032, %r25
	.word 0xa69c0011  ! 272: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0xb0c40011  ! 272: ADDCcc_R	addccc 	%r16, %r17, %r24
	.word 0xd3042e8b  ! 273: LDF_I	ld	[%r16, 0x0e8b], %f9
	.word 0xd64c27f3  ! 275: LDSB_I	ldsb	[%r16 + 0x07f3], %r11
	.word 0x9a042f76  ! 277: ADD_I	add 	%r16, 0x0f76, %r13
	.word 0x97643801  ! 277: MOVcc_I	<illegal instruction>
	.word 0xb68c0011  ! 277: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x8a9c2d55  ! 277: XORcc_I	xorcc 	%r16, 0x0d55, %r5
	.word 0xb80c2b2b  ! 277: AND_I	and 	%r16, 0x0b2b, %r28
	.word 0xed140011  ! 278: LDQF_R	-	[%r16, %r17], %f22
	.word 0xd0142d47  ! 280: LDUH_I	lduh	[%r16 + 0x0d47], %r8
	.word 0x9a040011  ! 282: ADD_R	add 	%r16, %r17, %r13
	.word 0x9ac40011  ! 282: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xa68422b4  ! 282: ADDcc_I	addcc 	%r16, 0x02b4, %r19
	.word 0x840c2fa9  ! 282: AND_I	and 	%r16, 0x0fa9, %r2
	.word 0xac840011  ! 282: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0xdc442d00  ! 283: LDSW_I	ldsw	[%r16 + 0x0d00], %r14
thr1_irf_ce_29:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_29), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xea9c2745  ! 285: LDDA_I	ldda	[%r16, + 0x0745] %asi, %r21
	.word 0x8f7c2401  ! 287: MOVR_I	move	%r16, 0xfffffe34, %r7
	.word 0x988c0011  ! 287: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x9c9c261d  ! 287: XORcc_I	xorcc 	%r16, 0x061d, %r14
	.word 0x9e840011  ! 287: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xb6940011  ! 287: ORcc_R	orcc 	%r16, %r17, %r27
thr1_dc_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_22), 16, 16),1,DC_DATA,69)
	.word 0xf104267e  ! 289: LDF_I	ld	[%r16, 0x067e], %f24
	.word 0x84fc2a05  ! 291: SDIVcc_I	sdivcc 	%r16, 0x0a05, %r2
	.word 0x90040011  ! 293: ADD_R	add 	%r16, %r17, %r8
	.word 0x82442799  ! 293: ADDC_I	addc 	%r16, 0x0799, %r1
	.word 0x90842d78  ! 293: ADDcc_I	addcc 	%r16, 0x0d78, %r8
	.word 0x9f342001  ! 293: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x9f342001  ! 293: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xb32c2001  ! 293: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0x841c0011  ! 293: XOR_R	xor 	%r16, %r17, %r2
	.word 0xd51c0011  ! 294: LDDF_R	ldd	[%r16, %r17], %f10
	.word 0xf5040011  ! 296: LDF_R	ld	[%r16, %r17], %f26
	.word 0x843c2774  ! 298: XNOR_I	xnor 	%r16, 0x0774, %r2
	.word 0x92bc2486  ! 298: XNORcc_I	xnorcc 	%r16, 0x0486, %r9
	.word 0xb73c0011  ! 298: SRA_R	sra 	%r16, %r17, %r27
	.word 0xae940011  ! 298: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0x833c2001  ! 298: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0x83643801  ! 298: MOVcc_I	<illegal instruction>
thr1_dc_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_23), 16, 16),1,DC_DATA,5)
	.word 0xd7941000  ! 300: LDQFA_R	-	[%r16, %r0], %f11
thr1_irf_ce_30:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_30), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xf2fc1011  ! 302: SWAPA_R	swapa	%r25, [%r16 + %r17] 0x80
	.word 0x95342001  ! 304: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x9c1c20d3  ! 304: XOR_I	xor 	%r16, 0x00d3, %r14
	.word 0x9b3c1011  ! 304: SRAX_R	srax	%r16, %r17, %r13
	.word 0x82940011  ! 304: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0xae8c0011  ! 304: ANDcc_R	andcc 	%r16, %r17, %r23
thr1_dc_err_24:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_24), 16, 16),1,DC_DATA,35)
	.word 0xdf140000  ! 306: LDQF_R	-	[%r16, %r0], %f15
!Illinst store
	.word 0xf8740011  ! 308: STX_R	stx	%r28, [%r16 + %r17]
	.word 0x9a040011  ! 310: ADD_R	add 	%r16, %r17, %r13
	.word 0xaab42b09  ! 310: ORNcc_I	orncc 	%r16, 0x0b09, %r21
	.word 0xb5342001  ! 310: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0xb6140011  ! 310: OR_R	or 	%r16, %r17, %r27
	.word 0x843c0011  ! 310: XNOR_R	xnor 	%r16, %r17, %r2
thr1_dc_err_25:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_25), 16, 16),1,DC_DATA,53)
	.word 0xc6440000  ! 312: LDSW_R	ldsw	[%r16 + %r0], %r3
	.word 0xcb142c78  ! 314: LDQF_I	-	[%r16, 0x0c78], %f5
	.word 0x9c0422a1  ! 316: ADD_I	add 	%r16, 0x02a1, %r14
	.word 0x989c2e44  ! 316: XORcc_I	xorcc 	%r16, 0x0e44, %r12
	.word 0xa6bc0011  ! 316: XNORcc_R	xnorcc 	%r16, %r17, %r19
	.word 0x86b40011  ! 316: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0x908c2501  ! 316: ANDcc_I	andcc 	%r16, 0x0501, %r8
	.word 0x98940011  ! 316: ORcc_R	orcc 	%r16, %r17, %r12
thr1_dc_err_26:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_26), 16, 16),1,DC_DATA,9)
	.word 0xd6140000  ! 318: LDUH_R	lduh	[%r16 + %r0], %r11
thr1_irf_ce_31:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_31), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xec9c1011  ! 320: LDDA_R	ldda	[%r16, %r17] 0x80, %r22
	.word 0x82842712  ! 322: ADDcc_I	addcc 	%r16, 0x0712, %r1
	.word 0x86b40011  ! 322: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0xa68c2c8e  ! 322: ANDcc_I	andcc 	%r16, 0x0c8e, %r19
	.word 0x829c0011  ! 322: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x94140011  ! 322: OR_R	or 	%r16, %r17, %r10
	.word 0xb6142a1b  ! 322: OR_I	or 	%r16, 0x0a1b, %r27
	.word 0xaa1c2cdb  ! 322: XOR_I	xor 	%r16, 0x0cdb, %r21
	.word 0x923c0011  ! 322: XNOR_R	xnor 	%r16, %r17, %r9
thr1_dc_err_27:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_27), 16, 16),1,DC_DATA,25)
	.word 0xdadc1000  ! 324: LDXA_R	ldxa	[%r16, %r0] 0x80, %r13
	.word 0xf39c1011  ! 326: LDDFA_R	ldda	[%r16, %r17], %f25
	.word 0xbb7c2401  ! 328: MOVR_I	move	%r16, 0xfffffe34, %r29
	.word 0x8f341011  ! 328: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x829c0011  ! 328: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x90840011  ! 328: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0xa8440011  ! 328: ADDC_R	addc 	%r16, %r17, %r20
	.word 0xaf2c2001  ! 328: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0x8c8c259a  ! 328: ANDcc_I	andcc 	%r16, 0x059a, %r6
thr1_dc_err_28:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_28), 16, 16),1,DC_DATA,60)
	.word 0xdd941000  ! 330: LDQFA_R	-	[%r16, %r0], %f14
thr1_irf_ce_32:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_32), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xcc8c1011  ! 332: LDUBA_R	lduba	[%r16, %r17] 0x80, %r6
	.word 0x9e840011  ! 334: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x9f3c0011  ! 334: SRA_R	sra 	%r16, %r17, %r15
	.word 0x88bc2edf  ! 334: XNORcc_I	xnorcc 	%r16, 0x0edf, %r4
	.word 0xb08c2b1a  ! 334: ANDcc_I	andcc 	%r16, 0x0b1a, %r24
	.word 0x84940011  ! 334: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0xb9341011  ! 334: SRLX_R	srlx	%r16, %r17, %r28
thr1_dc_err_29:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_29), 16, 16),1,DC_DATA,46)
	.word 0xd20c0000  ! 336: LDUB_R	ldub	[%r16 + %r0], %r9
thr1_irf_ce_33:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_33), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xc51c0011  ! 338: LDDF_R	ldd	[%r16, %r17], %f2
	.word 0x9aac2561  ! 340: ANDNcc_I	andncc 	%r16, 0x0561, %r13
	.word 0x85342001  ! 340: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0xb53c1011  ! 340: SRAX_R	srax	%r16, %r17, %r26
	.word 0x98142b90  ! 340: OR_I	or 	%r16, 0x0b90, %r12
	.word 0x8a2c0011  ! 340: ANDN_R	andn 	%r16, %r17, %r5
	.word 0x92940011  ! 340: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x960c0011  ! 340: AND_R	and 	%r16, %r17, %r11
	.word 0xccd41011  ! 341: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r6
thr1_irf_ce_34:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_34), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xde742eda  ! 345: STX_I	stx	%r15, [%r16 + 0x0eda]
	.word 0x83643801  ! 347: MOVcc_I	<illegal instruction>
	.word 0x842c2035  ! 347: ANDN_I	andn 	%r16, 0x0035, %r2
	.word 0x88c42ae5  ! 347: ADDCcc_I	addccc 	%r16, 0x0ae5, %r4
	.word 0xbb3c0011  ! 347: SRA_R	sra 	%r16, %r17, %r29
	.word 0x8a1c0011  ! 347: XOR_R	xor 	%r16, %r17, %r5
	.word 0x8eac27d2  ! 347: ANDNcc_I	andncc 	%r16, 0x07d2, %r7
	.word 0xd904222b  ! 348: LDF_I	ld	[%r16, 0x022b], %f12
	.word 0xce0c2dc5  ! 350: LDUB_I	ldub	[%r16 + 0x0dc5], %r7
	.word 0x873c1011  ! 352: SRAX_R	srax	%r16, %r17, %r3
	.word 0x8b3c0011  ! 352: SRA_R	sra 	%r16, %r17, %r5
	.word 0x893c0011  ! 352: SRA_R	sra 	%r16, %r17, %r4
	.word 0xaf641811  ! 352: MOVcc_R	<illegal instruction>
	.word 0x9c9429ee  ! 352: ORcc_I	orcc 	%r16, 0x09ee, %r14
	.word 0xf81c0011  ! 353: LDD_R	ldd	[%r16 + %r17], %r28
	.word 0xd3841011  ! 355: LDFA_R	lda	[%r16, %r17], %f9
	.word 0x8b7c2401  ! 357: MOVR_I	move	%r16, 0xfffffe34, %r5
	.word 0x929c228a  ! 357: XORcc_I	xorcc 	%r16, 0x028a, %r9
	.word 0x917c0411  ! 357: MOVR_R	move	%r16, %r17, %r8
	.word 0x922c0011  ! 357: ANDN_R	andn 	%r16, %r17, %r9
	.word 0xaf7c0411  ! 357: MOVR_R	move	%r16, %r17, %r23
thr1_dc_err_30:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_30), 16, 16),1,DC_DATA,68)
	.word 0xc2c4262c  ! 359: LDSWA_I	ldswa	[%r16, + 0x062c] %asi, %r1
thr1_irf_ce_35:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_35), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xca742ab7  ! 363: STX_I	stx	%r5, [%r16 + 0x0ab7]
	.word 0xa8ac0011  ! 365: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0x8f2c1011  ! 365: SLLX_R	sllx	%r16, %r17, %r7
	.word 0x90842bff  ! 365: ADDcc_I	addcc 	%r16, 0x0bff, %r8
	.word 0x95340011  ! 365: SRL_R	srl 	%r16, %r17, %r10
	.word 0x909c290a  ! 365: XORcc_I	xorcc 	%r16, 0x090a, %r8
	.word 0xc31c2d06  ! 366: LDDF_I	ldd	[%r16, 0x0d06], %f1
thr1_irf_ce_36:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_36), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xc6242b34  ! 370: STW_I	stw	%r3, [%r16 + 0x0b34]
	.word 0x92bc2a20  ! 372: XNORcc_I	xnorcc 	%r16, 0x0a20, %r9
	.word 0xba3c0011  ! 372: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x8d7c0411  ! 372: MOVR_R	move	%r16, %r17, %r6
	.word 0x94ac23a2  ! 372: ANDNcc_I	andncc 	%r16, 0x03a2, %r10
	.word 0xa97c0411  ! 372: MOVR_R	move	%r16, %r17, %r20
	.word 0xb8940011  ! 372: ORcc_R	orcc 	%r16, %r17, %r28
	.word 0x90c40011  ! 372: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x9aac2fc5  ! 372: ANDNcc_I	andncc 	%r16, 0x0fc5, %r13
thr1_dc_err_31:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_31), 16, 16),1,DC_DATA,53)
	.word 0xdac41000  ! 374: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r13
	.word 0xd6442af5  ! 376: LDSW_I	ldsw	[%r16 + 0x0af5], %r11
	.word 0xb03c2f4b  ! 378: XNOR_I	xnor 	%r16, 0x0f4b, %r24
	.word 0x83343001  ! 378: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x912c1011  ! 378: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x86c427ac  ! 378: ADDCcc_I	addccc 	%r16, 0x07ac, %r3
	.word 0x87641811  ! 378: MOVcc_R	<illegal instruction>
	.word 0xba9c0011  ! 378: XORcc_R	xorcc 	%r16, %r17, %r29
	.word 0xf48c1011  ! 379: LDUBA_R	lduba	[%r16, %r17] 0x80, %r26
thr1_irf_ce_37:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_37), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0x85341011  ! 383: SRLX_R	srlx	%r16, %r17, %r2
	.word 0xb3641811  ! 383: MOVcc_R	<illegal instruction>
	.word 0x8a1c2ffa  ! 383: XOR_I	xor 	%r16, 0x0ffa, %r5
	.word 0x8cbc0011  ! 383: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0xab340011  ! 383: SRL_R	srl 	%r16, %r17, %r21
thr1_dc_err_32:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_32), 16, 16),1,DC_DATA,59)
	.word 0xe81c0000  ! 385: LDD_R	ldd	[%r16 + %r0], %r20
!Illinst store
	.word 0xc82c0011  ! 387: STB_R	stb	%r4, [%r16 + %r17]
	.word 0x820425ac  ! 389: ADD_I	add 	%r16, 0x05ac, %r1
	.word 0xac8429f4  ! 389: ADDcc_I	addcc 	%r16, 0x09f4, %r22
	.word 0xb08c0011  ! 389: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0x84bc0011  ! 389: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x8d340011  ! 389: SRL_R	srl 	%r16, %r17, %r6
	.word 0xb4ac215d  ! 389: ANDNcc_I	andncc 	%r16, 0x015d, %r26
	.word 0xe91c2299  ! 390: LDDF_I	ldd	[%r16, 0x0299], %f20
thr1_irf_ce_38:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_38), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
        wr %g0, 0x4, %fprs
	.word 0x8e8c0011  ! 394: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x9cc40011  ! 394: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0x91343001  ! 394: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0x8eb42153  ! 394: ORNcc_I	orncc 	%r16, 0x0153, %r7
	.word 0x8ab40011  ! 394: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xb92c3001  ! 394: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0x913c0011  ! 394: SRA_R	sra 	%r16, %r17, %r8
	.word 0x928c2f4b  ! 394: ANDcc_I	andcc 	%r16, 0x0f4b, %r9
thr1_dc_err_33:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_33), 16, 16),1,DC_DATA,47)
	.word 0xc2142c54  ! 396: LDUH_I	lduh	[%r16 + 0x0c54], %r1
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0x903423ae  ! 400: ORN_I	orn 	%r16, 0x03ae, %r8
	.word 0x9a14281c  ! 400: OR_I	or 	%r16, 0x081c, %r13
	.word 0xb28c259c  ! 400: ANDcc_I	andcc 	%r16, 0x059c, %r25
	.word 0xac2c294a  ! 400: ANDN_I	andn 	%r16, 0x094a, %r22
	.word 0x82b422e7  ! 400: ORNcc_I	orncc 	%r16, 0x02e7, %r1
	.word 0xcc1c0011  ! 401: LDD_R	ldd	[%r16 + %r17], %r6
thr1_irf_ce_39:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_39), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
        wr %g0, 0x4, %fprs
	.word 0x84142caf  ! 405: OR_I	or 	%r16, 0x0caf, %r2
	.word 0xb02c269f  ! 405: ANDN_I	andn 	%r16, 0x069f, %r24
	.word 0x829c0011  ! 405: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x83341011  ! 405: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x9a940011  ! 405: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0xaaac20ec  ! 405: ANDNcc_I	andncc 	%r16, 0x00ec, %r21
	.word 0x94b40011  ! 405: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0x8e840011  ! 405: ADDcc_R	addcc 	%r16, %r17, %r7
thr1_dc_err_34:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_34), 16, 16),1,DC_DATA,12)
	.word 0xea042a9c  ! 407: LDUW_I	lduw	[%r16 + 0x0a9c], %r21
	.word 0xca5c20dc  ! 409: LDX_I	ldx	[%r16 + 0x00dc], %r5
	.word 0x91343001  ! 411: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0xa8140011  ! 411: OR_R	or 	%r16, %r17, %r20
	.word 0x92840011  ! 411: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0xaa140011  ! 411: OR_R	or 	%r16, %r17, %r21
	.word 0xacc40011  ! 411: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0x849c0011  ! 411: XORcc_R	xorcc 	%r16, %r17, %r2
thr1_dc_err_35:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_35), 16, 16),1,DC_DATA,40)
	.word 0xdf140000  ! 413: LDQF_R	-	[%r16, %r0], %f15
thr1_irf_ce_40:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_40), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd4a41011  ! 415: STWA_R	stwa	%r10, [%r16 + %r17] 0x80
	.word 0x9a040011  ! 417: ADD_R	add 	%r16, %r17, %r13
	.word 0x8a3c2048  ! 417: XNOR_I	xnor 	%r16, 0x0048, %r5
	.word 0x888c2c33  ! 417: ANDcc_I	andcc 	%r16, 0x0c33, %r4
	.word 0x82940011  ! 417: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0xa63c25c0  ! 417: XNOR_I	xnor 	%r16, 0x05c0, %r19
	.word 0xb3641811  ! 417: MOVcc_R	<illegal instruction>
thr1_dc_err_36:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_36), 16, 16),1,DC_DATA,64)
	.word 0xd504204d  ! 419: LDF_I	ld	[%r16, 0x004d], %f10
	.word 0xfb1c212d  ! 421: LDDF_I	ldd	[%r16, 0x012d], %f29
	.word 0x957c2401  ! 423: MOVR_I	move	%r16, 0xfffffe34, %r10
	.word 0xb00427ba  ! 423: ADD_I	add 	%r16, 0x07ba, %r24
	.word 0x86ac27cf  ! 423: ANDNcc_I	andncc 	%r16, 0x07cf, %r3
	.word 0xba040011  ! 423: ADD_R	add 	%r16, %r17, %r29
	.word 0xb2c4295d  ! 423: ADDCcc_I	addccc 	%r16, 0x095d, %r25
	.word 0xab343001  ! 423: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0x841c0011  ! 423: XOR_R	xor 	%r16, %r17, %r2
	.word 0xd68423b6  ! 424: LDUWA_I	lduwa	[%r16, + 0x03b6] %asi, %r11
	.word 0xf114256d  ! 426: LDQF_I	-	[%r16, 0x056d], %f24
	.word 0xb82c0011  ! 428: ANDN_R	andn 	%r16, %r17, %r28
	.word 0xb7341011  ! 428: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x8e440011  ! 428: ADDC_R	addc 	%r16, %r17, %r7
	.word 0xb61c0011  ! 428: XOR_R	xor 	%r16, %r17, %r27
	.word 0x94942513  ! 428: ORcc_I	orcc 	%r16, 0x0513, %r10
	.word 0x84440011  ! 428: ADDC_R	addc 	%r16, %r17, %r2
	.word 0xd84c2950  ! 429: LDSB_I	ldsb	[%r16 + 0x0950], %r12
thr1_irf_ce_41:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_41), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xf9142a7d  ! 431: LDQF_I	-	[%r16, 0x0a7d], %f28
	.word 0x9f341011  ! 433: SRLX_R	srlx	%r16, %r17, %r15
	.word 0x8d643801  ! 433: MOVcc_I	<illegal instruction>
	.word 0x9a442fe1  ! 433: ADDC_I	addc 	%r16, 0x0fe1, %r13
	.word 0xab2c1011  ! 433: SLLX_R	sllx	%r16, %r17, %r21
	.word 0x8e8c2a50  ! 433: ANDcc_I	andcc 	%r16, 0x0a50, %r7
	.word 0xb4b40011  ! 433: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0x9cc40011  ! 433: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0xaf643801  ! 433: MOVcc_I	<illegal instruction>
	.word 0xd4d41011  ! 434: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r10
thr1_irf_ce_42:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_42), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xc7140011  ! 436: LDQF_R	-	[%r16, %r17], %f3
	.word 0x84ac0011  ! 438: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0xa6042920  ! 438: ADD_I	add 	%r16, 0x0920, %r19
	.word 0x9a94277c  ! 438: ORcc_I	orcc 	%r16, 0x077c, %r13
	.word 0x9ec42c84  ! 438: ADDCcc_I	addccc 	%r16, 0x0c84, %r15
	.word 0xa89c0011  ! 438: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0xb09c2f40  ! 438: XORcc_I	xorcc 	%r16, 0x0f40, %r24
	.word 0xb21c0011  ! 438: XOR_R	xor 	%r16, %r17, %r25
	.word 0xf2941011  ! 439: LDUHA_R	lduha	[%r16, %r17] 0x80, %r25
	.word 0xb24c2e19  ! 441: MULX_I	mulx 	%r16, 0x0e19, %r25
	.word 0xb0bc2562  ! 443: XNORcc_I	xnorcc 	%r16, 0x0562, %r24
	.word 0x92ac2012  ! 443: ANDNcc_I	andncc 	%r16, 0x0012, %r9
	.word 0xb63429fb  ! 443: ORN_I	orn 	%r16, 0x09fb, %r27
	.word 0xb89c2855  ! 443: XORcc_I	xorcc 	%r16, 0x0855, %r28
	.word 0x88ac2200  ! 443: ANDNcc_I	andncc 	%r16, 0x0200, %r4
	.word 0xb60c2581  ! 443: AND_I	and 	%r16, 0x0581, %r27
	.word 0x84440011  ! 443: ADDC_R	addc 	%r16, %r17, %r2
thr1_dc_err_37:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_37), 16, 16),1,DC_DATA,46)
	.word 0xf81c2391  ! 445: LDD_I	ldd	[%r16 + 0x0391], %r28
	.word 0xdd1c273f  ! 447: LDDF_I	ldd	[%r16, 0x073f], %f14
	.word 0xb2bc0011  ! 449: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0x929c0011  ! 449: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0x9ab40011  ! 449: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0xa89c0011  ! 449: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0x983c2d6e  ! 449: XNOR_I	xnor 	%r16, 0x0d6e, %r12
	.word 0x8cac2c58  ! 449: ANDNcc_I	andncc 	%r16, 0x0c58, %r6
thr1_dc_err_38:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_38), 16, 16),1,DC_DATA,29)
	.word 0xec5c0000  ! 451: LDX_R	ldx	[%r16 + %r0], %r22
	.word 0xf88c1011  ! 453: LDUBA_R	lduba	[%r16, %r17] 0x80, %r28
	.word 0xb8942941  ! 455: ORcc_I	orcc 	%r16, 0x0941, %r28
	.word 0xa80c0011  ! 455: AND_R	and 	%r16, %r17, %r20
	.word 0xac4425c3  ! 455: ADDC_I	addc 	%r16, 0x05c3, %r22
	.word 0x98ac0011  ! 455: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x8684233a  ! 455: ADDcc_I	addcc 	%r16, 0x033a, %r3
	.word 0x9ab40011  ! 455: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0xcc5c0011  ! 456: LDX_R	ldx	[%r16 + %r17], %r6
thr1_irf_ce_43:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_43), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xf11c2aa2  ! 458: LDDF_I	ldd	[%r16, 0x0aa2], %f24
	.word 0x8e942c1c  ! 460: ORcc_I	orcc 	%r16, 0x0c1c, %r7
	.word 0x868c2f9b  ! 460: ANDcc_I	andcc 	%r16, 0x0f9b, %r3
	.word 0xae0c0011  ! 460: AND_R	and 	%r16, %r17, %r23
	.word 0xbb3c2001  ! 460: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0x8d340011  ! 460: SRL_R	srl 	%r16, %r17, %r6
	.word 0x94ac0011  ! 460: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x9d2c1011  ! 460: SLLX_R	sllx	%r16, %r17, %r14
	.word 0xd1841011  ! 461: LDFA_R	lda	[%r16, %r17], %f8
thr1_irf_ce_44:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_44), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0x9e940011  ! 465: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x872c3001  ! 465: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x8414216f  ! 465: OR_I	or 	%r16, 0x016f, %r2
	.word 0x908c24bf  ! 465: ANDcc_I	andcc 	%r16, 0x04bf, %r8
	.word 0x92b40011  ! 465: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0x8a0c0011  ! 466: AND_R	and 	%r16, %r17, %r5
	.word 0x9e940011  ! 466: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x983c28d9  ! 466: XNOR_I	xnor 	%r16, 0x08d9, %r12
	.word 0xa6ac2bf2  ! 466: ANDNcc_I	andncc 	%r16, 0x0bf2, %r19
	.word 0x9abc0011  ! 466: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0xab3c2001  ! 466: SRA_I	sra 	%r16, 0x0001, %r21
	.word 0x9c8425f1  ! 466: ADDcc_I	addcc 	%r16, 0x05f1, %r14
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd7941011  ! 466: LDQFA_R	-	[%r16, %r17], %f11
thr1_irf_ce_45:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_45), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0x8e842c75  ! 469: ADDcc_I	addcc 	%r16, 0x0c75, %r7
	.word 0xb8c40011  ! 469: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0x84140011  ! 469: OR_R	or 	%r16, %r17, %r2
	.word 0x9c9c222f  ! 469: XORcc_I	xorcc 	%r16, 0x022f, %r14
	.word 0x96942cfe  ! 469: ORcc_I	orcc 	%r16, 0x0cfe, %r11
	.word 0xb02c0011  ! 469: ANDN_R	andn 	%r16, %r17, %r24
	.word 0x96b42787  ! 469: ORNcc_I	orncc 	%r16, 0x0787, %r11
	.word 0x983429ca  ! 469: ORN_I	orn 	%r16, 0x09ca, %r12
thr1_dc_err_39:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_39), 16, 16),1,DC_DATA,28)
	.word 0xd81c2560  ! 471: LDD_I	ldd	[%r16 + 0x0560], %r12
thr1_irf_ce_46:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_46), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xdc042370  ! 473: LDUW_I	lduw	[%r16 + 0x0370], %r14
	.word 0x872c2001  ! 475: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0xa61c0011  ! 475: XOR_R	xor 	%r16, %r17, %r19
	.word 0x85643801  ! 475: MOVcc_I	<illegal instruction>
	.word 0x982c0011  ! 475: ANDN_R	andn 	%r16, %r17, %r12
	.word 0xaf341011  ! 475: SRLX_R	srlx	%r16, %r17, %r23
thr1_dc_err_40:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_40), 16, 16),1,DC_DATA,36)
	.word 0xec0c200e  ! 477: LDUB_I	ldub	[%r16 + 0x000e], %r22
!Illinst alu
	.word 0x82a40011  ! 479: SUBcc_R	subcc 	%r16, %r17, %r1
	.word 0x93341011  ! 481: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x82340011  ! 481: ORN_R	orn 	%r16, %r17, %r1
	.word 0x95641811  ! 481: MOVcc_R	<illegal instruction>
	.word 0x843c0011  ! 481: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0x9ec42780  ! 481: ADDCcc_I	addccc 	%r16, 0x0780, %r15
	.word 0x881c2cde  ! 481: XOR_I	xor 	%r16, 0x0cde, %r4
	.word 0x96c40011  ! 481: ADDCcc_R	addccc 	%r16, %r17, %r11
thr1_dc_err_41:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_41), 16, 16),1,DC_DATA,61)
	.word 0xc68c1000  ! 483: LDUBA_R	lduba	[%r16, %r0] 0x80, %r3
thr1_irf_ce_47:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_47), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xd07421d9  ! 487: STX_I	stx	%r8, [%r16 + 0x01d9]
	.word 0x9b2c3001  ! 489: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0xb1341011  ! 489: SRLX_R	srlx	%r16, %r17, %r24
	.word 0x8e440011  ! 489: ADDC_R	addc 	%r16, %r17, %r7
	.word 0xa80c0011  ! 489: AND_R	and 	%r16, %r17, %r20
	.word 0xb9343001  ! 489: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x8f3c0011  ! 489: SRA_R	sra 	%r16, %r17, %r7
	.word 0x8f641811  ! 489: MOVcc_R	<illegal instruction>
	.word 0x9b2c2001  ! 489: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0xe61c0011  ! 490: LDD_R	ldd	[%r16 + %r17], %r19
thr1_irf_ce_48:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_48), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	wr      %r0, 0x5, %asr26
	.word 0xab2c1011  ! 494: SLLX_R	sllx	%r16, %r17, %r21
	.word 0x90b40011  ! 494: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x84842315  ! 494: ADDcc_I	addcc 	%r16, 0x0315, %r2
	.word 0x9e840011  ! 494: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x84142144  ! 494: OR_I	or 	%r16, 0x0144, %r2
	.word 0xb2c40011  ! 494: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0x9eb4240a  ! 494: ORNcc_I	orncc 	%r16, 0x040a, %r15
	.word 0x8a84240f  ! 494: ADDcc_I	addcc 	%r16, 0x040f, %r5
thr1_dc_err_42:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_42), 16, 16),1,DC_DATA,14)
	.word 0xd91c0000  ! 496: LDDF_R	ldd	[%r16, %r0], %f12
thr1_irf_ce_49:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_49), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0x81dc2b9b  ! 498: FLUSH_I	flush
	.word 0xb8342091  ! 500: ORN_I	orn 	%r16, 0x0091, %r28
	.word 0x820c0011  ! 500: AND_R	and 	%r16, %r17, %r1
	.word 0xa6ac0011  ! 500: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0x96840011  ! 500: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0x892c3001  ! 500: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0x902c2a6b  ! 500: ANDN_I	andn 	%r16, 0x0a6b, %r8
	.word 0xfac41011  ! 501: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r29
	.word 0xd99c1011  ! 503: LDDFA_R	ldda	[%r16, %r17], %f12
	.word 0x8e040011  ! 505: ADD_R	add 	%r16, %r17, %r7
	.word 0x88ac285e  ! 505: ANDNcc_I	andncc 	%r16, 0x085e, %r4
	.word 0x9e840011  ! 505: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x820c0011  ! 505: AND_R	and 	%r16, %r17, %r1
	.word 0xb89c0011  ! 505: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0x992c3001  ! 505: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0xce941011  ! 506: LDUHA_R	lduha	[%r16, %r17] 0x80, %r7
thr1_irf_ce_50:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_50), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xcb042953  ! 508: LDF_I	ld	[%r16, 0x0953], %f5
	.word 0x90c42caf  ! 510: ADDCcc_I	addccc 	%r16, 0x0caf, %r8
	.word 0xa61c2b66  ! 510: XOR_I	xor 	%r16, 0x0b66, %r19
	.word 0x82142c2d  ! 510: OR_I	or 	%r16, 0x0c2d, %r1
	.word 0x9f342001  ! 510: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x8f341011  ! 510: SRLX_R	srlx	%r16, %r17, %r7
	.word 0xab7c0411  ! 510: MOVR_R	move	%r16, %r17, %r21
thr1_dc_err_43:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_43), 16, 16),1,DC_DATA,61)
	.word 0xd0c428e6  ! 512: LDSWA_I	ldswa	[%r16, + 0x08e6] %asi, %r8
thr1_irf_ce_51:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_51), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xe6dc279a  ! 514: LDXA_I	ldxa	[%r16, + 0x079a] %asi, %r19
	.word 0x868c2db1  ! 516: ANDcc_I	andcc 	%r16, 0x0db1, %r3
	.word 0xb12c1011  ! 516: SLLX_R	sllx	%r16, %r17, %r24
	.word 0x8f340011  ! 516: SRL_R	srl 	%r16, %r17, %r7
	.word 0x9e0c22c6  ! 516: AND_I	and 	%r16, 0x02c6, %r15
	.word 0x8cbc2734  ! 516: XNORcc_I	xnorcc 	%r16, 0x0734, %r6
	.word 0x86040011  ! 516: ADD_R	add 	%r16, %r17, %r3
	.word 0x90340011  ! 516: ORN_R	orn 	%r16, %r17, %r8
	.word 0xd39c1011  ! 517: LDDFA_R	ldda	[%r16, %r17], %f9
	.word 0xca9c1011  ! 519: LDDA_R	ldda	[%r16, %r17] 0x80, %r5
	.word 0x9c1c2f1f  ! 521: XOR_I	xor 	%r16, 0x0f1f, %r14
	.word 0x973c2001  ! 521: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x8a140011  ! 521: OR_R	or 	%r16, %r17, %r5
	.word 0xbb3c2001  ! 521: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0x9eb42408  ! 521: ORNcc_I	orncc 	%r16, 0x0408, %r15
	.word 0xab641811  ! 521: MOVcc_R	<illegal instruction>
	.word 0xf64c2eb6  ! 522: LDSB_I	ldsb	[%r16 + 0x0eb6], %r27
	.word 0xc4d41011  ! 524: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r2
	.word 0x94940011  ! 526: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0xad341011  ! 526: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x88140011  ! 526: OR_R	or 	%r16, %r17, %r4
	.word 0x962c2aa2  ! 526: ANDN_I	andn 	%r16, 0x0aa2, %r11
	.word 0x97643801  ! 526: MOVcc_I	<illegal instruction>
	.word 0xacb42898  ! 526: ORNcc_I	orncc 	%r16, 0x0898, %r22
	.word 0xda8c1011  ! 527: LDUBA_R	lduba	[%r16, %r17] 0x80, %r13
thr1_irf_ce_52:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_52), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xcec41011  ! 529: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r7
	.word 0x8e842a31  ! 531: ADDcc_I	addcc 	%r16, 0x0a31, %r7
	.word 0xac2c0011  ! 531: ANDN_R	andn 	%r16, %r17, %r22
	.word 0x9e0c0011  ! 531: AND_R	and 	%r16, %r17, %r15
	.word 0x9c1c0011  ! 531: XOR_R	xor 	%r16, %r17, %r14
	.word 0x82c4245a  ! 531: ADDCcc_I	addccc 	%r16, 0x045a, %r1
thr1_dc_err_44:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_44), 16, 16),1,DC_DATA,57)
	.word 0xd8841000  ! 533: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r12
thr1_irf_ce_53:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_53), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xe60c2411  ! 535: LDUB_I	ldub	[%r16 + 0x0411], %r19
	.word 0x832c0011  ! 537: SLL_R	sll 	%r16, %r17, %r1
	.word 0xb02c221c  ! 537: ANDN_I	andn 	%r16, 0x021c, %r24
	.word 0x942c0011  ! 537: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x948c223c  ! 537: ANDcc_I	andcc 	%r16, 0x023c, %r10
	.word 0x9aac2970  ! 537: ANDNcc_I	andncc 	%r16, 0x0970, %r13
	.word 0xb81c2aac  ! 537: XOR_I	xor 	%r16, 0x0aac, %r28
	.word 0xb4c40011  ! 537: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0xa634209d  ! 537: ORN_I	orn 	%r16, 0x009d, %r19
	.word 0xd3040011  ! 538: LDF_R	ld	[%r16, %r17], %f9
!Illinst store
	.word 0xd8240011  ! 540: STW_R	stw	%r12, [%r16 + %r17]
	.word 0xaf643801  ! 542: MOVcc_I	<illegal instruction>
	.word 0x8b2c2001  ! 542: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x993c1011  ! 542: SRAX_R	srax	%r16, %r17, %r12
	.word 0x9ebc2352  ! 542: XNORcc_I	xnorcc 	%r16, 0x0352, %r15
	.word 0xb4140011  ! 542: OR_R	or 	%r16, %r17, %r26
	.word 0x941c2411  ! 542: XOR_I	xor 	%r16, 0x0411, %r10
	.word 0x9a140011  ! 542: OR_R	or 	%r16, %r17, %r13
	.word 0xce040011  ! 543: LDUW_R	lduw	[%r16 + %r17], %r7
thr1_irf_ce_54:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_54), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xea8c1011  ! 545: LDUBA_R	lduba	[%r16, %r17] 0x80, %r21
	.word 0x9f343001  ! 547: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0xb48c2502  ! 547: ANDcc_I	andcc 	%r16, 0x0502, %r26
	.word 0x82c423dc  ! 547: ADDCcc_I	addccc 	%r16, 0x03dc, %r1
	.word 0xacb42c00  ! 547: ORNcc_I	orncc 	%r16, 0x0c00, %r22
	.word 0x980c0011  ! 547: AND_R	and 	%r16, %r17, %r12
	.word 0x869c0011  ! 547: XORcc_R	xorcc 	%r16, %r17, %r3
thr1_dc_err_45:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_45), 16, 16),1,DC_DATA,30)
	.word 0xc80c269a  ! 549: LDUB_I	ldub	[%r16 + 0x069a], %r4
	.word 0xcf042837  ! 551: LDF_I	ld	[%r16, 0x0837], %f7
	.word 0xab2c2001  ! 553: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0xb41c2388  ! 553: XOR_I	xor 	%r16, 0x0388, %r26
	.word 0x99641811  ! 553: MOVcc_R	<illegal instruction>
	.word 0xaac40011  ! 553: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0xb4b40011  ! 553: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0x9a9428b2  ! 553: ORcc_I	orcc 	%r16, 0x08b2, %r13
thr1_dc_err_46:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_46), 16, 16),1,DC_DATA,63)
	.word 0xf41c26e4  ! 555: LDD_I	ldd	[%r16 + 0x06e4], %r26
thr1_irf_ce_55:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_55), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xeadc1011  ! 557: LDXA_R	ldxa	[%r16, %r17] 0x80, %r21
	.word 0x84340011  ! 559: ORN_R	orn 	%r16, %r17, %r2
	.word 0xa6840011  ! 559: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x969c29ef  ! 559: XORcc_I	xorcc 	%r16, 0x09ef, %r11
	.word 0x90440011  ! 559: ADDC_R	addc 	%r16, %r17, %r8
	.word 0x920c0011  ! 559: AND_R	and 	%r16, %r17, %r9
	.word 0x883c0011  ! 559: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x921c2d17  ! 559: XOR_I	xor 	%r16, 0x0d17, %r9
thr1_dc_err_47:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_47), 16, 16),1,DC_DATA,62)
	.word 0xdc440000  ! 561: LDSW_R	ldsw	[%r16 + %r0], %r14
thr1_irf_ce_56:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_56), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xcec41011  ! 563: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r7
	.word 0x8e0420a3  ! 565: ADD_I	add 	%r16, 0x00a3, %r7
	.word 0x8eb42109  ! 565: ORNcc_I	orncc 	%r16, 0x0109, %r7
	.word 0x913c2001  ! 565: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x9e2c0011  ! 565: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x940c0011  ! 565: AND_R	and 	%r16, %r17, %r10
	.word 0xb02c2a15  ! 565: ANDN_I	andn 	%r16, 0x0a15, %r24
	.word 0x9a0c26a7  ! 565: AND_I	and 	%r16, 0x06a7, %r13
	.word 0xdf9c1011  ! 566: LDDFA_R	ldda	[%r16, %r17], %f15
	.word 0xf3142a2c  ! 568: LDQF_I	-	[%r16, 0x0a2c], %f25
	.word 0x957c0411  ! 570: MOVR_R	move	%r16, %r17, %r10
	.word 0x90c40011  ! 570: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0xac140011  ! 570: OR_R	or 	%r16, %r17, %r22
	.word 0x9ac40011  ! 570: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x94940011  ! 570: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x8ac40011  ! 570: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0xa83c246d  ! 570: XNOR_I	xnor 	%r16, 0x046d, %r20
	.word 0x853c0011  ! 570: SRA_R	sra 	%r16, %r17, %r2
	.word 0xd1841011  ! 571: LDFA_R	lda	[%r16, %r17], %f8
thr1_irf_ce_57:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_57), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xf21c275f  ! 573: LDD_I	ldd	[%r16 + 0x075f], %r25
	.word 0x84c40011  ! 575: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x9d3c2001  ! 575: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x9c3c0011  ! 575: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x853c1011  ! 575: SRAX_R	srax	%r16, %r17, %r2
	.word 0xa8942986  ! 575: ORcc_I	orcc 	%r16, 0x0986, %r20
	.word 0x87340011  ! 575: SRL_R	srl 	%r16, %r17, %r3
	.word 0x96b42581  ! 575: ORNcc_I	orncc 	%r16, 0x0581, %r11
	.word 0xd9941011  ! 576: LDQFA_R	-	[%r16, %r17], %f12
thr1_irf_ce_58:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_58), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xeecc1011  ! 578: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r23
	.word 0xac3c2d81  ! 580: XNOR_I	xnor 	%r16, 0x0d81, %r22
	.word 0x8a9c2b7d  ! 580: XORcc_I	xorcc 	%r16, 0x0b7d, %r5
	.word 0x9aac2a40  ! 580: ANDNcc_I	andncc 	%r16, 0x0a40, %r13
	.word 0x8c442531  ! 580: ADDC_I	addc 	%r16, 0x0531, %r6
	.word 0x9494242b  ! 580: ORcc_I	orcc 	%r16, 0x042b, %r10
	.word 0x94c40011  ! 580: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x843427b5  ! 580: ORN_I	orn 	%r16, 0x07b5, %r2
	.word 0xea1c0011  ! 581: LDD_R	ldd	[%r16 + %r17], %r21
	.word 0xc71c0011  ! 583: LDDF_R	ldd	[%r16, %r17], %f3
	.word 0xac2c2e77  ! 585: ANDN_I	andn 	%r16, 0x0e77, %r22
	.word 0xa73c1011  ! 585: SRAX_R	srax	%r16, %r17, %r19
	.word 0xb77c2401  ! 585: MOVR_I	move	%r16, 0xfffffe34, %r27
	.word 0x9f3c0011  ! 585: SRA_R	sra 	%r16, %r17, %r15
	.word 0x932c3001  ! 585: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x8f341011  ! 585: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x8b3c1011  ! 585: SRAX_R	srax	%r16, %r17, %r5
thr1_dc_err_48:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_48), 16, 16),1,DC_DATA,22)
	.word 0xda1c2e4d  ! 587: LDD_I	ldd	[%r16 + 0x0e4d], %r13
thr1_irf_ce_59:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_59), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xf2542833  ! 589: LDSH_I	ldsh	[%r16 + 0x0833], %r25
	.word 0x84c40011  ! 591: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x9a8c2ab8  ! 591: ANDcc_I	andcc 	%r16, 0x0ab8, %r13
	.word 0x98040011  ! 591: ADD_R	add 	%r16, %r17, %r12
	.word 0x833c2001  ! 591: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0x892c3001  ! 591: SLLX_I	sllx	%r16, 0x0001, %r4
thr1_dc_err_49:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_49), 16, 16),1,DC_DATA,55)
	.word 0xcf841000  ! 593: LDFA_R	lda	[%r16, %r0], %f7
	.word 0xde442168  ! 595: LDSW_I	ldsw	[%r16 + 0x0168], %r15
	.word 0xb00c2d76  ! 597: AND_I	and 	%r16, 0x0d76, %r24
	.word 0x937c0411  ! 597: MOVR_R	move	%r16, %r17, %r9
	.word 0x88940011  ! 597: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x883c0011  ! 597: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0xb80423db  ! 597: ADD_I	add 	%r16, 0x03db, %r28
	.word 0xcd140011  ! 598: LDQF_R	-	[%r16, %r17], %f6
	.word 0x81880000  ! 600: SAVED	saved
	.word 0xa9343001  ! 602: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0x97643801  ! 602: MOVcc_I	<illegal instruction>
	.word 0x828c2f48  ! 602: ANDcc_I	andcc 	%r16, 0x0f48, %r1
	.word 0xa81c2b83  ! 602: XOR_I	xor 	%r16, 0x0b83, %r20
	.word 0x8c2c0011  ! 602: ANDN_R	andn 	%r16, %r17, %r6
	.word 0x94942a2f  ! 602: ORcc_I	orcc 	%r16, 0x0a2f, %r10
	.word 0x90c422be  ! 602: ADDCcc_I	addccc 	%r16, 0x02be, %r8
	.word 0x9b643801  ! 602: MOVcc_I	<illegal instruction>
	.word 0xc85c0011  ! 603: LDX_R	ldx	[%r16 + %r17], %r4
thr1_irf_ce_60:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_60), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xec242cbc  ! 607: STW_I	stw	%r22, [%r16 + 0x0cbc]
	.word 0x9f3c1011  ! 609: SRAX_R	srax	%r16, %r17, %r15
	.word 0xa72c3001  ! 609: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0xa69c0011  ! 609: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x98b422c2  ! 609: ORNcc_I	orncc 	%r16, 0x02c2, %r12
	.word 0xbb2c0011  ! 609: SLL_R	sll 	%r16, %r17, %r29
	.word 0x903c0011  ! 609: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0xd99c1011  ! 610: LDDFA_R	ldda	[%r16, %r17], %f12
	.word 0xf41c24f9  ! 612: LDD_I	ldd	[%r16 + 0x04f9], %r26
	.word 0x860c0011  ! 614: AND_R	and 	%r16, %r17, %r3
	.word 0x9e4424ec  ! 614: ADDC_I	addc 	%r16, 0x04ec, %r15
	.word 0xae840011  ! 614: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x8c8c2b6e  ! 614: ANDcc_I	andcc 	%r16, 0x0b6e, %r6
	.word 0x97341011  ! 614: SRLX_R	srlx	%r16, %r17, %r11
	.word 0xd9941011  ! 615: LDQFA_R	-	[%r16, %r17], %f12
thr1_irf_ce_61:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_61), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xd41c2a20  ! 617: LDD_I	ldd	[%r16 + 0x0a20], %r10
	.word 0xa6140011  ! 619: OR_R	or 	%r16, %r17, %r19
	.word 0xaeb42217  ! 619: ORNcc_I	orncc 	%r16, 0x0217, %r23
	.word 0x8f3c0011  ! 619: SRA_R	sra 	%r16, %r17, %r7
	.word 0x93340011  ! 619: SRL_R	srl 	%r16, %r17, %r9
	.word 0x9a840011  ! 619: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0xe6dc2eb0  ! 620: LDXA_I	ldxa	[%r16, + 0x0eb0] %asi, %r19
thr1_resum_intr_1502:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1502), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x97343001  ! 624: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0x85343001  ! 624: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0xae0c2b1e  ! 624: AND_I	and 	%r16, 0x0b1e, %r23
	.word 0x969c264d  ! 624: XORcc_I	xorcc 	%r16, 0x064d, %r11
	.word 0xa89c29a2  ! 624: XORcc_I	xorcc 	%r16, 0x09a2, %r20
thr1_dc_err_50:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_50), 16, 16),1,DC_DATA,46)
	.word 0xdc8424d4  ! 626: LDUWA_I	lduwa	[%r16, + 0x04d4] %asi, %r14
thr1_irf_ce_62:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_62), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xee442d95  ! 628: LDSW_I	ldsw	[%r16 + 0x0d95], %r23
	.word 0x94042132  ! 630: ADD_I	add 	%r16, 0x0132, %r10
	.word 0xa7340011  ! 630: SRL_R	srl 	%r16, %r17, %r19
	.word 0x912c2001  ! 630: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0x95342001  ! 630: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x86940011  ! 630: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x93342001  ! 630: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x857c0411  ! 630: MOVR_R	move	%r16, %r17, %r2
	.word 0xa6442461  ! 630: ADDC_I	addc 	%r16, 0x0461, %r19
	.word 0xe7140011  ! 631: LDQF_R	-	[%r16, %r17], %f19
thr1_irf_ce_63:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_63), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xdc342a07  ! 635: STH_I	sth	%r14, [%r16 + 0x0a07]
	.word 0x8f3c1011  ! 637: SRAX_R	srax	%r16, %r17, %r7
	.word 0xacbc2b85  ! 637: XNORcc_I	xnorcc 	%r16, 0x0b85, %r22
	.word 0xb21c0011  ! 637: XOR_R	xor 	%r16, %r17, %r25
	.word 0xad2c2001  ! 637: SLL_I	sll 	%r16, 0x0001, %r22
	.word 0x933c2001  ! 637: SRA_I	sra 	%r16, 0x0001, %r9
thr1_dc_err_51:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_51), 16, 16),1,DC_DATA,33)
	.word 0xd28c1000  ! 639: LDUBA_R	lduba	[%r16, %r0] 0x80, %r9
thr1_irf_ce_64:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_64), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xea3424cb  ! 643: STH_I	sth	%r21, [%r16 + 0x04cb]
	.word 0xb6940011  ! 645: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x95643801  ! 645: MOVcc_I	<illegal instruction>
	.word 0xaf2c1011  ! 645: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x8a8c0011  ! 645: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0x8ec40011  ! 645: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0x86042747  ! 645: ADD_I	add 	%r16, 0x0747, %r3
	.word 0x8aac2a19  ! 645: ANDNcc_I	andncc 	%r16, 0x0a19, %r5
	.word 0x87343001  ! 645: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0xd914239d  ! 646: LDQF_I	-	[%r16, 0x039d], %f12
thr1_irf_ce_65:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_65), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xe61c23ce  ! 648: LDD_I	ldd	[%r16 + 0x03ce], %r19
	.word 0xb4bc0011  ! 650: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0xb7343001  ! 650: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0xb6c40011  ! 650: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0xb2bc0011  ! 650: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0x993c1011  ! 650: SRAX_R	srax	%r16, %r17, %r12
thr1_dc_err_52:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_52), 16, 16),1,DC_DATA,42)
	.word 0xf884261b  ! 652: LDUWA_I	lduwa	[%r16, + 0x061b] %asi, %r28
thr1_irf_ce_66:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_66), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xef040011  ! 654: LDF_R	ld	[%r16, %r17], %f23
	.word 0xb48c0011  ! 656: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0x95641811  ! 656: MOVcc_R	<illegal instruction>
	.word 0x9b2c0011  ! 656: SLL_R	sll 	%r16, %r17, %r13
	.word 0x88bc0011  ! 656: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0xad2c1011  ! 656: SLLX_R	sllx	%r16, %r17, %r22
	.word 0x99643801  ! 656: MOVcc_I	<illegal instruction>
thr1_dc_err_53:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_53), 16, 16),1,DC_DATA,53)
	.word 0xee1c261b  ! 658: LDD_I	ldd	[%r16 + 0x061b], %r23
	.word 0xeac42e00  ! 660: LDSWA_I	ldswa	[%r16, + 0x0e00] %asi, %r21
	.word 0x96940011  ! 662: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0xbb7c0411  ! 662: MOVR_R	move	%r16, %r17, %r29
	.word 0x91643801  ! 662: MOVcc_I	<illegal instruction>
	.word 0x9aac0011  ! 662: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x840c2297  ! 662: AND_I	and 	%r16, 0x0297, %r2
	.word 0xf40c0011  ! 663: LDUB_R	ldub	[%r16 + %r17], %r26
	.word 0xf7140011  ! 665: LDQF_R	-	[%r16, %r17], %f27
	.word 0x95641811  ! 667: MOVcc_R	<illegal instruction>
	.word 0xa88c2b06  ! 667: ANDcc_I	andcc 	%r16, 0x0b06, %r20
	.word 0x9f343001  ! 667: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x852c3001  ! 667: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0xae0c2741  ! 667: AND_I	and 	%r16, 0x0741, %r23
	.word 0xb0942fae  ! 667: ORcc_I	orcc 	%r16, 0x0fae, %r24
	.word 0xb6340011  ! 667: ORN_R	orn 	%r16, %r17, %r27
	.word 0xb22c0011  ! 667: ANDN_R	andn 	%r16, %r17, %r25
	.word 0xd29c2da3  ! 668: LDDA_I	ldda	[%r16, + 0x0da3] %asi, %r9
thr1_irf_ce_67:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_67), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xec140011  ! 670: LDUH_R	lduh	[%r16 + %r17], %r22
	.word 0xa63c2f34  ! 672: XNOR_I	xnor 	%r16, 0x0f34, %r19
	.word 0x8f3c0011  ! 672: SRA_R	sra 	%r16, %r17, %r7
	.word 0x9d7c0411  ! 672: MOVR_R	move	%r16, %r17, %r14
	.word 0x872c1011  ! 672: SLLX_R	sllx	%r16, %r17, %r3
	.word 0x8a042aea  ! 672: ADD_I	add 	%r16, 0x0aea, %r5
	.word 0x8e942227  ! 672: ORcc_I	orcc 	%r16, 0x0227, %r7
thr1_dc_err_54:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_54), 16, 16),1,DC_DATA,58)
	.word 0xe90424f6  ! 674: LDF_I	ld	[%r16, 0x04f6], %f20
	.word 0xc3ec1011  ! 676: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x952c3001  ! 678: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x8b2c0011  ! 678: SLL_R	sll 	%r16, %r17, %r5
	.word 0x861c2480  ! 678: XOR_I	xor 	%r16, 0x0480, %r3
	.word 0xb2ac0011  ! 678: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0x943c2f66  ! 678: XNOR_I	xnor 	%r16, 0x0f66, %r10
thr1_dc_err_55:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_55), 16, 16),1,DC_DATA,60)
	.word 0xfadc1000  ! 680: LDXA_R	ldxa	[%r16, %r0] 0x80, %r29
	.word 0xc2cc2217  ! 682: LDSBA_I	ldsba	[%r16, + 0x0217] %asi, %r1
	.word 0x992c0011  ! 684: SLL_R	sll 	%r16, %r17, %r12
	.word 0x82c40011  ! 684: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x82b40011  ! 684: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x99343001  ! 684: SRLX_I	srlx	%r16, 0x0001, %r12
	.word 0x8e940011  ! 684: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0xaa1c2862  ! 684: XOR_I	xor 	%r16, 0x0862, %r21
thr1_dc_err_56:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_56), 16, 16),1,DC_DATA,30)
	.word 0xc6442130  ! 686: LDSW_I	ldsw	[%r16 + 0x0130], %r3
thr1_irf_ce_68:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_68), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xc61c2908  ! 688: LDD_I	ldd	[%r16 + 0x0908], %r3
	.word 0xb43c0011  ! 690: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x9d2c1011  ! 690: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x8cb42b16  ! 690: ORNcc_I	orncc 	%r16, 0x0b16, %r6
	.word 0x980c0011  ! 690: AND_R	and 	%r16, %r17, %r12
	.word 0x972c0011  ! 690: SLL_R	sll 	%r16, %r17, %r11
	.word 0xac342023  ! 690: ORN_I	orn 	%r16, 0x0023, %r22
thr1_dc_err_57:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_57), 16, 16),1,DC_DATA,18)
	.word 0xcc5c287b  ! 692: LDX_I	ldx	[%r16 + 0x087b], %r6
thr1_irf_ce_69:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_69), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xd07c0011  ! 694: SWAP_R	swap	%r8, [%r16 + %r17]
	.word 0xb12c3001  ! 696: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x92c42e65  ! 696: ADDCcc_I	addccc 	%r16, 0x0e65, %r9
	.word 0xb6340011  ! 696: ORN_R	orn 	%r16, %r17, %r27
	.word 0xa92c3001  ! 696: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0xb48c2794  ! 696: ANDcc_I	andcc 	%r16, 0x0794, %r26
	.word 0xa83c2416  ! 696: XNOR_I	xnor 	%r16, 0x0416, %r20
thr1_dc_err_58:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_58), 16, 16),1,DC_DATA,56)
	.word 0xf00c0000  ! 698: LDUB_R	ldub	[%r16 + %r0], %r24
thr1_irf_ce_70:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_70), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xfb1c0011  ! 700: LDDF_R	ldd	[%r16, %r17], %f29
	.word 0xaaac0011  ! 702: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0x913c0011  ! 702: SRA_R	sra 	%r16, %r17, %r8
	.word 0x94940011  ! 702: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x9f2c3001  ! 702: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x8f341011  ! 702: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x9a8c0011  ! 702: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x961c0011  ! 702: XOR_R	xor 	%r16, %r17, %r11
thr1_dc_err_59:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_59), 16, 16),1,DC_DATA,27)
	.word 0xd2cc202f  ! 704: LDSBA_I	ldsba	[%r16, + 0x002f] %asi, %r9
	.word 0xca8c21c9  ! 706: LDUBA_I	lduba	[%r16, + 0x01c9] %asi, %r5
	.word 0x84c4215d  ! 708: ADDCcc_I	addccc 	%r16, 0x015d, %r2
	.word 0x8d340011  ! 708: SRL_R	srl 	%r16, %r17, %r6
	.word 0xa93c2001  ! 708: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x92ac2630  ! 708: ANDNcc_I	andncc 	%r16, 0x0630, %r9
	.word 0xb89c0011  ! 708: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0xaab40011  ! 708: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0xb60422cf  ! 708: ADD_I	add 	%r16, 0x02cf, %r27
thr1_dc_err_60:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_60), 16, 16),1,DC_DATA,43)
	.word 0xf0440000  ! 710: LDSW_R	ldsw	[%r16 + %r0], %r24
thr1_irf_ce_71:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_71), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xde2c2f1d  ! 714: STB_I	stb	%r15, [%r16 + 0x0f1d]
	.word 0x96440011  ! 716: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x9e1c0011  ! 716: XOR_R	xor 	%r16, %r17, %r15
	.word 0xbb641811  ! 716: MOVcc_R	<illegal instruction>
	.word 0x84140011  ! 716: OR_R	or 	%r16, %r17, %r2
	.word 0x9c8c2508  ! 716: ANDcc_I	andcc 	%r16, 0x0508, %r14
	.word 0x912c1011  ! 716: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x8f3c0011  ! 716: SRA_R	sra 	%r16, %r17, %r7
	.word 0xaf7c2401  ! 716: MOVR_I	move	%r16, 0xfffffe34, %r23
thr1_dc_err_61:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_61), 16, 16),1,DC_DATA,5)
	.word 0xf2540000  ! 718: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xe9841011  ! 720: LDFA_R	lda	[%r16, %r17], %f20
	.word 0x880c0011  ! 722: AND_R	and 	%r16, %r17, %r4
	.word 0x98b425c9  ! 722: ORNcc_I	orncc 	%r16, 0x05c9, %r12
	.word 0x86bc0011  ! 722: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x9c1c2497  ! 722: XOR_I	xor 	%r16, 0x0497, %r14
	.word 0x9ac40011  ! 722: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x9c3c0011  ! 722: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0xb0c40011  ! 722: ADDCcc_R	addccc 	%r16, %r17, %r24
	.word 0xb77c2401  ! 722: MOVR_I	move	%r16, 0xfffffe34, %r27
	.word 0xcd841011  ! 723: LDFA_R	lda	[%r16, %r17], %f6
thr1_irf_ce_72:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_72), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xf79c1011  ! 725: LDDFA_R	ldda	[%r16, %r17], %f27
	.word 0x872c0011  ! 727: SLL_R	sll 	%r16, %r17, %r3
	.word 0x862c24a1  ! 727: ANDN_I	andn 	%r16, 0x04a1, %r3
	.word 0x94942f37  ! 727: ORcc_I	orcc 	%r16, 0x0f37, %r10
	.word 0x937c2401  ! 727: MOVR_I	move	%r16, 0xfffffe34, %r9
	.word 0x84b40011  ! 727: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0x82b42a10  ! 727: ORNcc_I	orncc 	%r16, 0x0a10, %r1
	.word 0xda1c0011  ! 728: LDD_R	ldd	[%r16 + %r17], %r13
thr1_irf_ce_73:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_73), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xc89c208d  ! 730: LDDA_I	ldda	[%r16, + 0x008d] %asi, %r4
	.word 0x9d7c0411  ! 732: MOVR_R	move	%r16, %r17, %r14
	.word 0x881c0011  ! 732: XOR_R	xor 	%r16, %r17, %r4
	.word 0xb12c2001  ! 732: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0x82ac23be  ! 732: ANDNcc_I	andncc 	%r16, 0x03be, %r1
	.word 0x8c442623  ! 732: ADDC_I	addc 	%r16, 0x0623, %r6
	.word 0x952c1011  ! 732: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x857c2401  ! 732: MOVR_I	move	%r16, 0xfffffe34, %r2
	.word 0x8e0c0011  ! 732: AND_R	and 	%r16, %r17, %r7
thr1_dc_err_62:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_62), 16, 16),1,DC_DATA,70)
	.word 0xf0040000  ! 734: LDUW_R	lduw	[%r16 + %r0], %r24
thr1_irf_ce_74:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_74), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xd01c0011  ! 736: LDD_R	ldd	[%r16 + %r17], %r8
	.word 0xa72c0011  ! 738: SLL_R	sll 	%r16, %r17, %r19
	.word 0x8d3c1011  ! 738: SRAX_R	srax	%r16, %r17, %r6
	.word 0x8a942a00  ! 738: ORcc_I	orcc 	%r16, 0x0a00, %r5
	.word 0xa80c0011  ! 738: AND_R	and 	%r16, %r17, %r20
	.word 0xac140011  ! 738: OR_R	or 	%r16, %r17, %r22
	.word 0x9a340011  ! 738: ORN_R	orn 	%r16, %r17, %r13
	.word 0xaf2c1011  ! 738: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x8d641811  ! 739: MOVcc_R	<illegal instruction>
	.word 0x9c942741  ! 739: ORcc_I	orcc 	%r16, 0x0741, %r14
	.word 0x92042bd0  ! 739: ADD_I	add 	%r16, 0x0bd0, %r9
	.word 0x982c2728  ! 739: ANDN_I	andn 	%r16, 0x0728, %r12
	.word 0x913c1011  ! 739: SRAX_R	srax	%r16, %r17, %r8
	.word 0xae0c0011  ! 739: AND_R	and 	%r16, %r17, %r23
	.word 0x841c0011  ! 739: XOR_R	xor 	%r16, %r17, %r2
	rd      %pc, %r18
	set     0x20, %r17
thr1_dc_err_63:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_63), 16, 16),1,DC_DATA,39)
	.word 0xf9040000  ! 740: LDF_R	ld	[%r16, %r0], %f28
thr1_irf_ce_75:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_75), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0x93343001  ! 743: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0xb0340011  ! 743: ORN_R	orn 	%r16, %r17, %r24
	.word 0x95643801  ! 743: MOVcc_I	<illegal instruction>
	.word 0xab342001  ! 743: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0xb73c0011  ! 743: SRA_R	sra 	%r16, %r17, %r27
	.word 0xa6940011  ! 743: ORcc_R	orcc 	%r16, %r17, %r19
	.word 0x9c3c0011  ! 743: XNOR_R	xnor 	%r16, %r17, %r14
thr1_dc_err_64:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_64), 16, 16),1,DC_DATA,64)
	.word 0xe89c2c89  ! 745: LDDA_I	ldda	[%r16, + 0x0c89] %asi, %r20
	.word 0xcab41011  ! 747: STHA_R	stha	%r5, [%r16 + %r17] 0x80
	.word 0x873c1011  ! 749: SRAX_R	srax	%r16, %r17, %r3
	.word 0xb83421e9  ! 749: ORN_I	orn 	%r16, 0x01e9, %r28
	.word 0xb6440011  ! 749: ADDC_R	addc 	%r16, %r17, %r27
	.word 0x9e440011  ! 749: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x98442522  ! 749: ADDC_I	addc 	%r16, 0x0522, %r12
	.word 0x912c0011  ! 749: SLL_R	sll 	%r16, %r17, %r8
	.word 0xa92c3001  ! 749: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0x8d3c2001  ! 749: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0xf3941011  ! 750: LDQFA_R	-	[%r16, %r17], %f25
	.word 0xf3042bdd  ! 752: LDF_I	ld	[%r16, 0x0bdd], %f25
	.word 0x821c0011  ! 754: XOR_R	xor 	%r16, %r17, %r1
	.word 0x863c0011  ! 754: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0x9f641811  ! 754: MOVcc_R	<illegal instruction>
	.word 0x9e3421c3  ! 754: ORN_I	orn 	%r16, 0x01c3, %r15
	.word 0x9f342001  ! 754: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xba8c0011  ! 754: ANDcc_R	andcc 	%r16, %r17, %r29
	.word 0x972c2001  ! 754: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x942c0011  ! 754: ANDN_R	andn 	%r16, %r17, %r10
	.word 0xcb9c1011  ! 755: LDDFA_R	ldda	[%r16, %r17], %f5
thr1_irf_ce_76:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_76), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xce040011  ! 757: LDUW_R	lduw	[%r16 + %r17], %r7
	.word 0x8204231f  ! 759: ADD_I	add 	%r16, 0x031f, %r1
	.word 0xb4840011  ! 759: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0x9d343001  ! 759: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0xb4b40011  ! 759: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0x8a94277a  ! 759: ORcc_I	orcc 	%r16, 0x077a, %r5
	.word 0x941c0011  ! 759: XOR_R	xor 	%r16, %r17, %r10
	.word 0xb49c2343  ! 759: XORcc_I	xorcc 	%r16, 0x0343, %r26
	.word 0xcec41011  ! 760: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r7
thr1_irf_ce_77:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_77), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xdefc20cf  ! 762: SWAPA_I	swapa	%r15, [%r16 + 0x00cf] %asi
	.word 0xae9c0011  ! 764: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x9b641811  ! 764: MOVcc_R	<illegal instruction>
	.word 0x84940011  ! 764: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0xb17c0411  ! 764: MOVR_R	move	%r16, %r17, %r24
	.word 0xb4ac2ced  ! 764: ANDNcc_I	andncc 	%r16, 0x0ced, %r26
thr1_dc_err_65:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_65), 16, 16),1,DC_DATA,70)
	.word 0xfa540000  ! 766: LDSH_R	ldsh	[%r16 + %r0], %r29
thr1_irf_ce_78:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_78), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xf42c236f  ! 770: STB_I	stb	%r26, [%r16 + 0x036f]
	.word 0xb4342523  ! 772: ORN_I	orn 	%r16, 0x0523, %r26
	.word 0x9d3c1011  ! 772: SRAX_R	srax	%r16, %r17, %r14
	.word 0x8e8c286f  ! 772: ANDcc_I	andcc 	%r16, 0x086f, %r7
	.word 0xb97c0411  ! 772: MOVR_R	move	%r16, %r17, %r28
	.word 0x849c2346  ! 772: XORcc_I	xorcc 	%r16, 0x0346, %r2
thr1_dc_err_66:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_66), 16, 16),1,DC_DATA,15)
	.word 0xd0dc2c1b  ! 774: LDXA_I	ldxa	[%r16, + 0x0c1b] %asi, %r8
thr1_irf_ce_79:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_79), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xde942d80  ! 776: LDUHA_I	lduha	[%r16, + 0x0d80] %asi, %r15
	.word 0x922c0011  ! 778: ANDN_R	andn 	%r16, %r17, %r9
	.word 0x94840011  ! 778: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0x8a940011  ! 778: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0xae3426fb  ! 778: ORN_I	orn 	%r16, 0x06fb, %r23
	.word 0x8aac2af3  ! 778: ANDNcc_I	andncc 	%r16, 0x0af3, %r5
	.word 0xb8040011  ! 778: ADD_R	add 	%r16, %r17, %r28
	.word 0xf20c0011  ! 779: LDUB_R	ldub	[%r16 + %r17], %r25
thr1_irf_ce_80:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_80), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xd25c2e71  ! 781: LDX_I	ldx	[%r16 + 0x0e71], %r9
	.word 0x9c1c2881  ! 783: XOR_I	xor 	%r16, 0x0881, %r14
	.word 0x9e9c0011  ! 783: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x822c0011  ! 783: ANDN_R	andn 	%r16, %r17, %r1
	.word 0xad643801  ! 783: MOVcc_I	<illegal instruction>
	.word 0x8b7c2401  ! 783: MOVR_I	move	%r16, 0xfffffe34, %r5
	.word 0x86b40011  ! 783: ORNcc_R	orncc 	%r16, %r17, %r3
thr1_dc_err_67:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_67), 16, 16),1,DC_DATA,9)
	.word 0xf6442a98  ! 785: LDSW_I	ldsw	[%r16 + 0x0a98], %r27
	.word 0xef040011  ! 787: LDF_R	ld	[%r16, %r17], %f23
	.word 0x8d3c0011  ! 789: SRA_R	sra 	%r16, %r17, %r6
	.word 0x9e3c2f66  ! 789: XNOR_I	xnor 	%r16, 0x0f66, %r15
	.word 0x8b343001  ! 789: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0x929c0011  ! 789: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0x84ac26fd  ! 789: ANDNcc_I	andncc 	%r16, 0x06fd, %r2
	.word 0x96440011  ! 789: ADDC_R	addc 	%r16, %r17, %r11
	.word 0xb8440011  ! 789: ADDC_R	addc 	%r16, %r17, %r28
	.word 0xa6142d5a  ! 789: OR_I	or 	%r16, 0x0d5a, %r19
thr1_dc_err_68:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_68), 16, 16),1,DC_DATA,60)
	.word 0xce140000  ! 791: LDUH_R	lduh	[%r16 + %r0], %r7
	.word 0xd8c42ccb  ! 793: LDSWA_I	ldswa	[%r16, + 0x0ccb] %asi, %r12
	.word 0x84b42f05  ! 795: ORNcc_I	orncc 	%r16, 0x0f05, %r2
	.word 0x900c0011  ! 795: AND_R	and 	%r16, %r17, %r8
	.word 0x9a3c0011  ! 795: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x9a8c21ae  ! 795: ANDcc_I	andcc 	%r16, 0x01ae, %r13
	.word 0x9c140011  ! 795: OR_R	or 	%r16, %r17, %r14
	.word 0x9a0428d5  ! 795: ADD_I	add 	%r16, 0x08d5, %r13
	.word 0xd41c0011  ! 796: LDD_R	ldd	[%r16 + %r17], %r10
	.word 0x82540011  ! 798: UMUL_R	umul 	%r16, %r17, %r1
	.word 0x88c42574  ! 800: ADDCcc_I	addccc 	%r16, 0x0574, %r4
	.word 0x8a8c0011  ! 800: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0x857c2401  ! 800: MOVR_I	move	%r16, 0xfffffe34, %r2
	.word 0x83342001  ! 800: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0xb23c0011  ! 800: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0x9e440011  ! 800: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x9d2c1011  ! 801: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x932c1011  ! 801: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x96940011  ! 801: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0xb53c2001  ! 801: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0x88940011  ! 801: ORcc_R	orcc 	%r16, %r17, %r4
	rd      %pc, %r18
	set     0x20, %r17
thr1_dc_err_69:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_69), 16, 16),1,DC_DATA,62)
	.word 0xc9841000  ! 802: LDFA_R	lda	[%r16, %r0], %f4
	return     %r18 + %r17
	.word 0x8a140011  ! 805: OR_R	or 	%r16, %r17, %r5
	.word 0xac3c0011  ! 805: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x993c0011  ! 805: SRA_R	sra 	%r16, %r17, %r12
	.word 0x868c0011  ! 805: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x933c0011  ! 805: SRA_R	sra 	%r16, %r17, %r9
	.word 0x84b40011  ! 805: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xb93c0011  ! 805: SRA_R	sra 	%r16, %r17, %r28
	.word 0xc5140011  ! 806: LDQF_R	-	[%r16, %r17], %f2
!Illinst store
	.word 0xe62c0011  ! 808: STB_R	stb	%r19, [%r16 + %r17]
	.word 0x96940011  ! 810: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0xae440011  ! 810: ADDC_R	addc 	%r16, %r17, %r23
	.word 0xba340011  ! 810: ORN_R	orn 	%r16, %r17, %r29
	.word 0xb5342001  ! 810: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0xaa942199  ! 810: ORcc_I	orcc 	%r16, 0x0199, %r21
	.word 0x997c0411  ! 810: MOVR_R	move	%r16, %r17, %r12
	.word 0x9e942aed  ! 810: ORcc_I	orcc 	%r16, 0x0aed, %r15
	.word 0x8ab40011  ! 810: ORNcc_R	orncc 	%r16, %r17, %r5
thr1_dc_err_70:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_70), 16, 16),1,DC_DATA,19)
	.word 0xda4c0000  ! 812: LDSB_R	ldsb	[%r16 + %r0], %r13
thr1_irf_ce_81:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_81), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd48c2762  ! 814: LDUBA_I	lduba	[%r16, + 0x0762] %asi, %r10
	.word 0x9ac40011  ! 816: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xab3c0011  ! 816: SRA_R	sra 	%r16, %r17, %r21
	.word 0x82342abf  ! 816: ORN_I	orn 	%r16, 0x0abf, %r1
	.word 0x9d342001  ! 816: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x8634268c  ! 816: ORN_I	orn 	%r16, 0x068c, %r3
	.word 0xb89c2afc  ! 816: XORcc_I	xorcc 	%r16, 0x0afc, %r28
	.word 0xae942e92  ! 816: ORcc_I	orcc 	%r16, 0x0e92, %r23
thr1_dc_err_71:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_71), 16, 16),1,DC_DATA,34)
	.word 0xf0040000  ! 818: LDUW_R	lduw	[%r16 + %r0], %r24
thr1_irf_ce_82:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_82), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xc9e41011  ! 820: CASA_I	casa	[%r16] 0x80, %r17, %r4
	.word 0x87641811  ! 822: MOVcc_R	<illegal instruction>
	.word 0x9eac2a45  ! 822: ANDNcc_I	andncc 	%r16, 0x0a45, %r15
	.word 0x8a2c29a0  ! 822: ANDN_I	andn 	%r16, 0x09a0, %r5
	.word 0xb03429c6  ! 822: ORN_I	orn 	%r16, 0x09c6, %r24
	.word 0x90b40011  ! 822: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x96342966  ! 822: ORN_I	orn 	%r16, 0x0966, %r11
	.word 0xb2b40011  ! 822: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0xc2042457  ! 823: LDUW_I	lduw	[%r16 + 0x0457], %r1
	.word 0xd8cc1011  ! 825: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r12
	.word 0x963c2092  ! 827: XNOR_I	xnor 	%r16, 0x0092, %r11
	.word 0x881c0011  ! 827: XOR_R	xor 	%r16, %r17, %r4
	.word 0xacc42fa7  ! 827: ADDCcc_I	addccc 	%r16, 0x0fa7, %r22
	.word 0xaabc0011  ! 827: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0x9c842e62  ! 827: ADDcc_I	addcc 	%r16, 0x0e62, %r14
	.word 0x9c8423a2  ! 827: ADDcc_I	addcc 	%r16, 0x03a2, %r14
	.word 0xb4340011  ! 827: ORN_R	orn 	%r16, %r17, %r26
thr1_dc_err_72:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_72), 16, 16),1,DC_DATA,39)
	.word 0xf69c1000  ! 829: LDDA_R	ldda	[%r16, %r0] 0x80, %r27
	.word 0xc60426f1  ! 831: LDUW_I	lduw	[%r16 + 0x06f1], %r3
	.word 0x8a4423f2  ! 833: ADDC_I	addc 	%r16, 0x03f2, %r5
	.word 0x8a442728  ! 833: ADDC_I	addc 	%r16, 0x0728, %r5
	.word 0xb12c1011  ! 833: SLLX_R	sllx	%r16, %r17, %r24
	.word 0xb72c2001  ! 833: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0x93341011  ! 833: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x8d341011  ! 833: SRLX_R	srlx	%r16, %r17, %r6
	.word 0x849c2606  ! 833: XORcc_I	xorcc 	%r16, 0x0606, %r2
	.word 0xdccc1011  ! 834: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r14
	.word 0xe9142ab4  ! 836: LDQF_I	-	[%r16, 0x0ab4], %f20
	.word 0xbabc26e0  ! 838: XNORcc_I	xnorcc 	%r16, 0x06e0, %r29
	.word 0x8cbc22cf  ! 838: XNORcc_I	xnorcc 	%r16, 0x02cf, %r6
	.word 0x953c1011  ! 838: SRAX_R	srax	%r16, %r17, %r10
	.word 0x96040011  ! 838: ADD_R	add 	%r16, %r17, %r11
	.word 0xa77c2401  ! 838: MOVR_I	move	%r16, 0xfffffe34, %r19
	.word 0xae3c0011  ! 838: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x981c2a0a  ! 838: XOR_I	xor 	%r16, 0x0a0a, %r12
thr1_dc_err_73:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_73), 16, 16),1,DC_DATA,45)
	.word 0xd85c0000  ! 840: LDX_R	ldx	[%r16 + %r0], %r12
	.word 0xe9042b77  ! 842: LDF_I	ld	[%r16, 0x0b77], %f20
	.word 0x8e942b10  ! 844: ORcc_I	orcc 	%r16, 0x0b10, %r7
	.word 0xb6bc2434  ! 844: XNORcc_I	xnorcc 	%r16, 0x0434, %r27
	.word 0x89342001  ! 844: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x982c0011  ! 844: ANDN_R	andn 	%r16, %r17, %r12
	.word 0xb77c0411  ! 844: MOVR_R	move	%r16, %r17, %r27
	.word 0xaa9c0011  ! 844: XORcc_R	xorcc 	%r16, %r17, %r21
	.word 0xb6ac2bc3  ! 844: ANDNcc_I	andncc 	%r16, 0x0bc3, %r27
	.word 0x86440011  ! 844: ADDC_R	addc 	%r16, %r17, %r3
	.word 0xd4d42eec  ! 845: LDSHA_I	ldsha	[%r16, + 0x0eec] %asi, %r10
!Illinst alu
	.word 0xae140011  ! 847: OR_R	or 	%r16, %r17, %r23
	.word 0xad342001  ! 849: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0xb68c0011  ! 849: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x9a940011  ! 849: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x933c1011  ! 849: SRAX_R	srax	%r16, %r17, %r9
	.word 0x820c0011  ! 849: AND_R	and 	%r16, %r17, %r1
thr1_dc_err_74:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_74), 16, 16),1,DC_DATA,34)
	.word 0xd4c42539  ! 851: LDSWA_I	ldswa	[%r16, + 0x0539] %asi, %r10
thr1_irf_ce_83:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_83), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xdad42683  ! 853: LDSHA_I	ldsha	[%r16, + 0x0683] %asi, %r13
	.word 0x981c21d3  ! 855: XOR_I	xor 	%r16, 0x01d3, %r12
	.word 0xb4c40011  ! 855: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0xb20c0011  ! 855: AND_R	and 	%r16, %r17, %r25
	.word 0xb6042eac  ! 855: ADD_I	add 	%r16, 0x0eac, %r27
	.word 0x849c25d5  ! 855: XORcc_I	xorcc 	%r16, 0x05d5, %r2
	.word 0x829c0011  ! 855: XORcc_R	xorcc 	%r16, %r17, %r1
thr1_dc_err_75:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_75), 16, 16),1,DC_DATA,46)
	.word 0xfb841000  ! 857: LDFA_R	lda	[%r16, %r0], %f29
        wr  %g0, 0x80, %asi
	.word 0xb17c2401  ! 861: MOVR_I	move	%r16, 0xfffffe34, %r24
	.word 0x852c1011  ! 861: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x8f3c0011  ! 861: SRA_R	sra 	%r16, %r17, %r7
	.word 0x869c2f2a  ! 861: XORcc_I	xorcc 	%r16, 0x0f2a, %r3
	.word 0xb2040011  ! 861: ADD_R	add 	%r16, %r17, %r25
	.word 0x892c3001  ! 861: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0xac042127  ! 861: ADD_I	add 	%r16, 0x0127, %r22
	.word 0x89343001  ! 862: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x8614236d  ! 862: OR_I	or 	%r16, 0x036d, %r3
	.word 0x972c2001  ! 862: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x8d343001  ! 862: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0xb7343001  ! 862: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0x8cc42398  ! 862: ADDCcc_I	addccc 	%r16, 0x0398, %r6
	.word 0x97641811  ! 862: MOVcc_R	<illegal instruction>
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xf51c0011  ! 862: LDDF_R	ldd	[%r16, %r17], %f26
thr1_irf_ce_84:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_84), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0x849c0011  ! 865: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0xa6842f17  ! 865: ADDcc_I	addcc 	%r16, 0x0f17, %r19
	.word 0xba9c284f  ! 865: XORcc_I	xorcc 	%r16, 0x084f, %r29
	.word 0xb5340011  ! 865: SRL_R	srl 	%r16, %r17, %r26
	.word 0x909c2e50  ! 865: XORcc_I	xorcc 	%r16, 0x0e50, %r8
	.word 0xd5841011  ! 866: LDFA_R	lda	[%r16, %r17], %f10
thr1_irf_ce_85:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_85), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0x81580000  ! 868: FLUSHW	flushw
	.word 0x989423e0  ! 870: ORcc_I	orcc 	%r16, 0x03e0, %r12
	.word 0xb6440011  ! 870: ADDC_R	addc 	%r16, %r17, %r27
	.word 0x820c2ed5  ! 870: AND_I	and 	%r16, 0x0ed5, %r1
	.word 0x8e342b30  ! 870: ORN_I	orn 	%r16, 0x0b30, %r7
	.word 0x941c0011  ! 870: XOR_R	xor 	%r16, %r17, %r10
	.word 0x9c9c0011  ! 870: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x94bc0011  ! 870: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0xa8ac239e  ! 870: ANDNcc_I	andncc 	%r16, 0x039e, %r20
	.word 0xc70428e6  ! 871: LDF_I	ld	[%r16, 0x08e6], %f3
	.word 0xdb14267b  ! 873: LDQF_I	-	[%r16, 0x067b], %f13
	.word 0xae142c21  ! 875: OR_I	or 	%r16, 0x0c21, %r23
	.word 0x84342a6e  ! 875: ORN_I	orn 	%r16, 0x0a6e, %r2
	.word 0xb0bc23a4  ! 875: XNORcc_I	xnorcc 	%r16, 0x03a4, %r24
	.word 0xaf2c0011  ! 875: SLL_R	sll 	%r16, %r17, %r23
	.word 0xaaac2552  ! 875: ANDNcc_I	andncc 	%r16, 0x0552, %r21
	.word 0xaeb423d6  ! 875: ORNcc_I	orncc 	%r16, 0x03d6, %r23
	.word 0xd65424b1  ! 876: LDSH_I	ldsh	[%r16 + 0x04b1], %r11
thr1_irf_ce_86:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_86), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd29c2c12  ! 878: LDDA_I	ldda	[%r16, + 0x0c12] %asi, %r9
	.word 0xb1641811  ! 880: MOVcc_R	<illegal instruction>
	.word 0x86c4230e  ! 880: ADDCcc_I	addccc 	%r16, 0x030e, %r3
	.word 0xb8440011  ! 880: ADDC_R	addc 	%r16, %r17, %r28
	.word 0x9d2c2001  ! 880: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x922c0011  ! 880: ANDN_R	andn 	%r16, %r17, %r9
	.word 0x8e1c0011  ! 880: XOR_R	xor 	%r16, %r17, %r7
	.word 0x94440011  ! 880: ADDC_R	addc 	%r16, %r17, %r10
	.word 0xde140011  ! 881: LDUH_R	lduh	[%r16 + %r17], %r15
	.word 0xc8f42b58  ! 883: STXA_I	stxa	%r4, [%r16 + 0x0b58] %asi
	.word 0xa73c1011  ! 885: SRAX_R	srax	%r16, %r17, %r19
	.word 0x8f340011  ! 885: SRL_R	srl 	%r16, %r17, %r7
	.word 0x99641811  ! 885: MOVcc_R	<illegal instruction>
	.word 0x93341011  ! 885: SRLX_R	srlx	%r16, %r17, %r9
	.word 0xac0428f7  ! 885: ADD_I	add 	%r16, 0x08f7, %r22
	.word 0x8d340011  ! 885: SRL_R	srl 	%r16, %r17, %r6
	.word 0xdc8c1011  ! 886: LDUBA_R	lduba	[%r16, %r17] 0x80, %r14
	.word 0xca540011  ! 888: LDSH_R	ldsh	[%r16 + %r17], %r5
	.word 0xb6440011  ! 890: ADDC_R	addc 	%r16, %r17, %r27
	.word 0x82c42cfc  ! 890: ADDCcc_I	addccc 	%r16, 0x0cfc, %r1
	.word 0x91643801  ! 890: MOVcc_I	<illegal instruction>
	.word 0x8a9427b0  ! 890: ORcc_I	orcc 	%r16, 0x07b0, %r5
	.word 0xbb2c3001  ! 890: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xca5c2afe  ! 891: LDX_I	ldx	[%r16 + 0x0afe], %r5
thr1_irf_ce_87:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_87), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xd6540011  ! 893: LDSH_R	ldsh	[%r16 + %r17], %r11
	.word 0x8cb40011  ! 895: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x960c21ab  ! 895: AND_I	and 	%r16, 0x01ab, %r11
	.word 0x8c942913  ! 895: ORcc_I	orcc 	%r16, 0x0913, %r6
	.word 0x91643801  ! 895: MOVcc_I	<illegal instruction>
	.word 0xb52c0011  ! 895: SLL_R	sll 	%r16, %r17, %r26
	.word 0xc31c0011  ! 896: LDDF_R	ldd	[%r16, %r17], %f1
thr1_irf_ce_88:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_88), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xda5c2a0d  ! 898: LDX_I	ldx	[%r16 + 0x0a0d], %r13
	.word 0x8b343001  ! 900: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0x8d2c0011  ! 900: SLL_R	sll 	%r16, %r17, %r6
	.word 0x9f3c2001  ! 900: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0xae440011  ! 900: ADDC_R	addc 	%r16, %r17, %r23
	.word 0x8a8c2b59  ! 900: ANDcc_I	andcc 	%r16, 0x0b59, %r5
	.word 0x9e2c0011  ! 900: ANDN_R	andn 	%r16, %r17, %r15
	.word 0xb6142de8  ! 900: OR_I	or 	%r16, 0x0de8, %r27
	.word 0xb72c2001  ! 900: SLL_I	sll 	%r16, 0x0001, %r27
thr1_dc_err_76:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_76), 16, 16),1,DC_DATA,7)
	.word 0xdf1428b8  ! 902: LDQF_I	-	[%r16, 0x08b8], %f15
thr1_irf_ce_89:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_89), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xda1c2a96  ! 904: LDD_I	ldd	[%r16 + 0x0a96], %r13
	.word 0x86b426e7  ! 906: ORNcc_I	orncc 	%r16, 0x06e7, %r3
	.word 0x8b3c1011  ! 906: SRAX_R	srax	%r16, %r17, %r5
	.word 0xa6040011  ! 906: ADD_R	add 	%r16, %r17, %r19
	.word 0x84c40011  ! 906: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xa93c0011  ! 906: SRA_R	sra 	%r16, %r17, %r20
	.word 0x9b340011  ! 906: SRL_R	srl 	%r16, %r17, %r13
thr1_dc_err_77:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_77), 16, 16),1,DC_DATA,9)
	.word 0xd6440000  ! 908: LDSW_R	ldsw	[%r16 + %r0], %r11
	.word 0xef941011  ! 910: LDQFA_R	-	[%r16, %r17], %f23
	.word 0x9b641811  ! 912: MOVcc_R	<illegal instruction>
	.word 0x8b7c0411  ! 912: MOVR_R	move	%r16, %r17, %r5
	.word 0x963c0011  ! 912: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x98140011  ! 912: OR_R	or 	%r16, %r17, %r12
	.word 0x86440011  ! 912: ADDC_R	addc 	%r16, %r17, %r3
	.word 0xa9342001  ! 912: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0xe7941011  ! 913: LDQFA_R	-	[%r16, %r17], %f19
	.word 0xd4b41011  ! 915: STHA_R	stha	%r10, [%r16 + %r17] 0x80
	.word 0x89342001  ! 917: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x868c0011  ! 917: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xaa340011  ! 917: ORN_R	orn 	%r16, %r17, %r21
	.word 0xb494250e  ! 917: ORcc_I	orcc 	%r16, 0x050e, %r26
	.word 0x9eb42156  ! 917: ORNcc_I	orncc 	%r16, 0x0156, %r15
	.word 0x9eb425d8  ! 917: ORNcc_I	orncc 	%r16, 0x05d8, %r15
	.word 0xeccc1011  ! 918: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r22
thr1_irf_ce_90:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_90), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xde8c1011  ! 920: LDUBA_R	lduba	[%r16, %r17] 0x80, %r15
	.word 0x941c2af5  ! 922: XOR_I	xor 	%r16, 0x0af5, %r10
	.word 0xb4bc202e  ! 922: XNORcc_I	xnorcc 	%r16, 0x002e, %r26
	.word 0x86ac22d3  ! 922: ANDNcc_I	andncc 	%r16, 0x02d3, %r3
	.word 0xb83c0011  ! 922: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xb5340011  ! 922: SRL_R	srl 	%r16, %r17, %r26
	.word 0x923c2376  ! 922: XNOR_I	xnor 	%r16, 0x0376, %r9
	.word 0x828c0011  ! 922: ANDcc_R	andcc 	%r16, %r17, %r1
thr1_dc_err_78:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_78), 16, 16),1,DC_DATA,40)
	.word 0xc59c1000  ! 924: LDDFA_R	ldda	[%r16, %r0], %f2
thr1_irf_ce_91:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_91), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xae7c2aef  ! 926: SDIV_I	sdiv 	%r16, 0x0aef, %r23
	.word 0x82c42ceb  ! 928: ADDCcc_I	addccc 	%r16, 0x0ceb, %r1
	.word 0x8e340011  ! 928: ORN_R	orn 	%r16, %r17, %r7
	.word 0x83342001  ! 928: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x87343001  ! 928: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0xacbc2879  ! 928: XNORcc_I	xnorcc 	%r16, 0x0879, %r22
	.word 0x8a3c2f43  ! 928: XNOR_I	xnor 	%r16, 0x0f43, %r5
thr1_dc_err_79:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_79), 16, 16),1,DC_DATA,50)
	.word 0xf6040000  ! 930: LDUW_R	lduw	[%r16 + %r0], %r27
thr1_irf_ce_92:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_92), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xc8842b2f  ! 932: LDUWA_I	lduwa	[%r16, + 0x0b2f] %asi, %r4
	.word 0x8b643801  ! 934: MOVcc_I	<illegal instruction>
	.word 0x902c0011  ! 934: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x8cc423db  ! 934: ADDCcc_I	addccc 	%r16, 0x03db, %r6
	.word 0x82942ecf  ! 934: ORcc_I	orcc 	%r16, 0x0ecf, %r1
	.word 0xac1c29a2  ! 934: XOR_I	xor 	%r16, 0x09a2, %r22
thr1_dc_err_80:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_80), 16, 16),1,DC_DATA,24)
	.word 0xc4c426bb  ! 936: LDSWA_I	ldswa	[%r16, + 0x06bb] %asi, %r2
thr1_irf_ce_93:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_93), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xec54285c  ! 938: LDSH_I	ldsh	[%r16 + 0x085c], %r22
	.word 0x88c40011  ! 940: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x893c0011  ! 940: SRA_R	sra 	%r16, %r17, %r4
	.word 0x9b7c2401  ! 940: MOVR_I	move	%r16, 0xfffffe34, %r13
	.word 0x8ab40011  ! 940: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0x949c2f88  ! 940: XORcc_I	xorcc 	%r16, 0x0f88, %r10
	.word 0xd85c0011  ! 941: LDX_R	ldx	[%r16 + %r17], %r12
thr1_irf_ce_94:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_94), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xc4c41011  ! 943: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r2
	.word 0x8b342001  ! 945: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x9b343001  ! 945: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xb09c0011  ! 945: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0xb02c22b4  ! 945: ANDN_I	andn 	%r16, 0x02b4, %r24
	.word 0x94b421a4  ! 945: ORNcc_I	orncc 	%r16, 0x01a4, %r10
	.word 0x853c1011  ! 945: SRAX_R	srax	%r16, %r17, %r2
	.word 0xaf643801  ! 945: MOVcc_I	<illegal instruction>
thr1_dc_err_81:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_81), 16, 16),1,DC_DATA,4)
	.word 0xd05c2c5a  ! 947: LDX_I	ldx	[%r16 + 0x0c5a], %r8
	.word 0xc8540011  ! 949: LDSH_R	ldsh	[%r16 + %r17], %r4
	.word 0x8a0425e4  ! 951: ADD_I	add 	%r16, 0x05e4, %r5
	.word 0x94440011  ! 951: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x96c40011  ! 951: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x943c0011  ! 951: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0xa62c0011  ! 951: ANDN_R	andn 	%r16, %r17, %r19
	.word 0x8f2c3001  ! 951: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x91341011  ! 951: SRLX_R	srlx	%r16, %r17, %r8
thr1_dc_err_82:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_82), 16, 16),1,DC_DATA,53)
	.word 0xc29424c1  ! 953: LDUHA_I	lduha	[%r16, + 0x04c1] %asi, %r1
thr1_irf_ce_95:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_95), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0x81580000  ! 955: FLUSHW	flushw
	.word 0xb88c24f7  ! 957: ANDcc_I	andcc 	%r16, 0x04f7, %r28
	.word 0x98ac0011  ! 957: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xae3c0011  ! 957: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0xb6840011  ! 957: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0x920c2e62  ! 957: AND_I	and 	%r16, 0x0e62, %r9
	.word 0x9a1428e9  ! 957: OR_I	or 	%r16, 0x08e9, %r13
	.word 0x88140011  ! 957: OR_R	or 	%r16, %r17, %r4
thr1_dc_err_83:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_83), 16, 16),1,DC_DATA,13)
	.word 0xee4426b3  ! 959: LDSW_I	ldsw	[%r16 + 0x06b3], %r23
        wr  %g0, 0x80, %asi
	.word 0x9c442103  ! 963: ADDC_I	addc 	%r16, 0x0103, %r14
	.word 0x8aac2366  ! 963: ANDNcc_I	andncc 	%r16, 0x0366, %r5
	.word 0xb1340011  ! 963: SRL_R	srl 	%r16, %r17, %r24
	.word 0xba1c0011  ! 963: XOR_R	xor 	%r16, %r17, %r29
	.word 0x909c23e0  ! 963: XORcc_I	xorcc 	%r16, 0x03e0, %r8
	.word 0x8a0c2c7d  ! 963: AND_I	and 	%r16, 0x0c7d, %r5
	.word 0x929c22df  ! 963: XORcc_I	xorcc 	%r16, 0x02df, %r9
	.word 0xcc142baf  ! 964: LDUH_I	lduh	[%r16 + 0x0baf], %r6
	.word 0xd3040011  ! 966: LDF_R	ld	[%r16, %r17], %f9
	.word 0x9d2c2001  ! 968: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0xb9343001  ! 968: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x97342001  ! 968: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0xa68c29a8  ! 968: ANDcc_I	andcc 	%r16, 0x09a8, %r19
	.word 0x9a3c2dea  ! 968: XNOR_I	xnor 	%r16, 0x0dea, %r13
	.word 0x8a840011  ! 968: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x852c0011  ! 968: SLL_R	sll 	%r16, %r17, %r2
	.word 0x8b641811  ! 968: MOVcc_R	<illegal instruction>
	.word 0xdc8c2047  ! 969: LDUBA_I	lduba	[%r16, + 0x0047] %asi, %r14
thr1_irf_ce_96:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_96), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xa65c0011  ! 971: SMUL_R	smul 	%r16, %r17, %r19
	.word 0xb2bc2780  ! 973: XNORcc_I	xnorcc 	%r16, 0x0780, %r25
	.word 0x880c2448  ! 973: AND_I	and 	%r16, 0x0448, %r4
	.word 0xaabc2d2c  ! 973: XNORcc_I	xnorcc 	%r16, 0x0d2c, %r21
	.word 0x9a2c0011  ! 973: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x840c0011  ! 973: AND_R	and 	%r16, %r17, %r2
	.word 0xbb2c2001  ! 973: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0x912c2001  ! 973: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0x9e9c2af5  ! 973: XORcc_I	xorcc 	%r16, 0x0af5, %r15
	.word 0xde4c2710  ! 974: LDSB_I	ldsb	[%r16 + 0x0710], %r15
thr1_resum_intr_1503:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1503), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x92c40011  ! 978: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x86440011  ! 978: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x90140011  ! 978: OR_R	or 	%r16, %r17, %r8
	.word 0x920c0011  ! 978: AND_R	and 	%r16, %r17, %r9
	.word 0xbb343001  ! 978: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0x9a840011  ! 978: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x84bc0011  ! 978: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0xdc040011  ! 979: LDUW_R	lduw	[%r16 + %r17], %r14
thr1_irf_ce_97:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_97), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xd8742ac3  ! 983: STX_I	stx	%r12, [%r16 + 0x0ac3]
	.word 0xa82c2d81  ! 985: ANDN_I	andn 	%r16, 0x0d81, %r20
	.word 0xaf7c0411  ! 985: MOVR_R	move	%r16, %r17, %r23
	.word 0x9f7c2401  ! 985: MOVR_I	move	%r16, 0xfffffe34, %r15
	.word 0x9ac42c59  ! 985: ADDCcc_I	addccc 	%r16, 0x0c59, %r13
	.word 0x88ac2dbb  ! 985: ANDNcc_I	andncc 	%r16, 0x0dbb, %r4
	.word 0xd5140011  ! 986: LDQF_R	-	[%r16, %r17], %f10
thr1_irf_ce_98:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_98), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xf71c26cf  ! 988: LDDF_I	ldd	[%r16, 0x06cf], %f27
	.word 0x84c40011  ! 990: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xab340011  ! 990: SRL_R	srl 	%r16, %r17, %r21
	.word 0xaf7c0411  ! 990: MOVR_R	move	%r16, %r17, %r23
	.word 0x92942de7  ! 990: ORcc_I	orcc 	%r16, 0x0de7, %r9
	.word 0x82bc0011  ! 990: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x92940011  ! 990: ORcc_R	orcc 	%r16, %r17, %r9
thr1_dc_err_84:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_84), 16, 16),1,DC_DATA,14)
	.word 0xd4442d69  ! 992: LDSW_I	ldsw	[%r16 + 0x0d69], %r10
	.word 0xdcc41011  ! 994: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r14
	.word 0x98b40011  ! 996: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x921c2147  ! 996: XOR_I	xor 	%r16, 0x0147, %r9
	.word 0x94b42d91  ! 996: ORNcc_I	orncc 	%r16, 0x0d91, %r10
	.word 0x897c2401  ! 996: MOVR_I	move	%r16, 0xfffffe34, %r4
	.word 0x933c0011  ! 996: SRA_R	sra 	%r16, %r17, %r9
thr1_dc_err_85:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_85), 16, 16),1,DC_DATA,27)
	.word 0xcd0428ef  ! 998: LDF_I	ld	[%r16, 0x08ef], %f6
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
        setx  0x00000000000000e0, %g1, %r17
        setx  0xabc359fab94f0b40, %g1, %r0
        setx  0x8a41d689fa3e97a7, %g1, %r1
        setx  0xeb3984f0e5a0eda3, %g1, %r2
        setx  0xca29d93bee6ddb7e, %g1, %r3
        setx  0x87b424e2bd7f0b43, %g1, %r4
        setx  0x5a6de96f2653241d, %g1, %r5
        setx  0xab8eeb7e2185b5ad, %g1, %r6
        setx  0xeaa96b83f91652db, %g1, %r7
        setx  0xd6e0ab43711eca19, %g1, %r8
        setx  0x2ae0436a5dea9edc, %g1, %r9
        setx  0xe656ebbd909b3394, %g1, %r10
        setx  0x364dc96c784bea05, %g1, %r11
        setx  0x4692a73d7782180c, %g1, %r12
        setx  0xb4d2522b7b6a68ab, %g1, %r13
        setx  0x271310ab347b4432, %g1, %r14
        setx  0xed9a47e77485f3e6, %g1, %r15
        setx  0x17970ce2b7bd43fa, %g1, %r18
        setx  0xe8414a8ce7eecfef, %g1, %r19
        setx  0x0d447f6d4cd2d69f, %g1, %r20
        setx  0xa0275ecb456c57b6, %g1, %r21
        setx  0x45dbb3032ccf1c98, %g1, %r22
        setx  0x0bf96048ddd4bf02, %g1, %r23
        setx  0x74a7ee4415716236, %g1, %r24
        setx  0xbdcf9ef836df8d14, %g1, %r25
        setx  0x9314456b8d06effa, %g1, %r26
        setx  0x162b7ad14c3211f0, %g1, %r27
        setx  0xa70c49445eb71482, %g1, %r28
        setx  0xfb0d201cb9bb0950, %g1, %r29
        setx  0x09d70112346eb2fc, %g1, %r30
        setx  0x0ff99b597e0bb0ce, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000ab0, %g1, %r17
        setx  0xae13e97992d393a1, %g1, %r0
        setx  0x165b96484cd2d14d, %g1, %r1
        setx  0x98a4a38ba233171c, %g1, %r2
        setx  0x97b10d66951d50dd, %g1, %r3
        setx  0x3d479089d2ed35f3, %g1, %r4
        setx  0xd065cafa13e53cde, %g1, %r5
        setx  0x7b96bf8ae9472e27, %g1, %r6
        setx  0x9a74c10d278a89c1, %g1, %r7
        setx  0xd9125a0f27c05b1a, %g1, %r8
        setx  0xdbb79ef5864e5642, %g1, %r9
        setx  0x62babb29a0a82083, %g1, %r10
        setx  0x23c9939999d1e33f, %g1, %r11
        setx  0x6cf22f69852e3041, %g1, %r12
        setx  0xc8b3520a9476c3ca, %g1, %r13
        setx  0x54ac91a4728fb548, %g1, %r14
        setx  0x5fa9a496e956ec74, %g1, %r15
        setx  0xffd23ac2da73c284, %g1, %r18
        setx  0x19b94e517c1bb1d3, %g1, %r19
        setx  0xd65b45244e7856cb, %g1, %r20
        setx  0xd5bfa001f04aa77b, %g1, %r21
        setx  0x71cdd161632f8911, %g1, %r22
        setx  0x313470851085c21c, %g1, %r23
        setx  0xf82d4d69a4e21c31, %g1, %r24
        setx  0xdf00ebf9ab58020a, %g1, %r25
        setx  0xfffc7bdfcdff1971, %g1, %r26
        setx  0x8561e69efadcd15e, %g1, %r27
        setx  0x05d4442fdacfc57a, %g1, %r28
        setx  0xcc57b92506461cb8, %g1, %r29
        setx  0x6dd0ec4567d33265, %g1, %r30
        setx  0xb0ab2d570b610c0d, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000007c0, %g1, %r17
        setx  0x225b20f70d128328, %g1, %r0
        setx  0x321d939adeeb217e, %g1, %r1
        setx  0x325bf46247d6a446, %g1, %r2
        setx  0x59e563ce7a503575, %g1, %r3
        setx  0xfca2d38ca0cb8b90, %g1, %r4
        setx  0xaef58f8f1aae5aab, %g1, %r5
        setx  0x3e0b3320225a62bc, %g1, %r6
        setx  0xdab92511655ba6ee, %g1, %r7
        setx  0x0932b59de3ad70e1, %g1, %r8
        setx  0xc04ef3b4dfd6edf1, %g1, %r9
        setx  0xd7f42ac9e266621c, %g1, %r10
        setx  0xe25c8834c26c366a, %g1, %r11
        setx  0xc9a0abe4e0bfbfe4, %g1, %r12
        setx  0x9796ac501ae1ae2e, %g1, %r13
        setx  0x51b0b2e9dd98e968, %g1, %r14
        setx  0x311ee5956eab029c, %g1, %r15
        setx  0x05b67ef74dcf427b, %g1, %r18
        setx  0x0a3847516b40c4c0, %g1, %r19
        setx  0x4a32106a1cc948fe, %g1, %r20
        setx  0x06a8d0c983bdbf84, %g1, %r21
        setx  0x900a2adf5ad00bd1, %g1, %r22
        setx  0x980fc6eb69dd0476, %g1, %r23
        setx  0x63008d7ac4594cef, %g1, %r24
        setx  0x786b7947c0af3a7e, %g1, %r25
        setx  0xd0c7573bc8fba9c1, %g1, %r26
        setx  0x65d40e111f53394b, %g1, %r27
        setx  0x9c1a9f4bac8f8bda, %g1, %r28
        setx  0xe60f43b91f92aea1, %g1, %r29
        setx  0xb8f43e6b15560fe0, %g1, %r30
        setx  0xbdf1883ba1125bc0, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000ba0, %g1, %r17
        setx  0x5eb496a48b3698fd, %g1, %r0
        setx  0xb045c701f8676170, %g1, %r1
        setx  0x3db7e9b998c57ede, %g1, %r2
        setx  0x2300b8572338f8ab, %g1, %r3
        setx  0x3ca098721190cb9d, %g1, %r4
        setx  0x499d6746f7158bf7, %g1, %r5
        setx  0xfc58400dcfa13d44, %g1, %r6
        setx  0xaf6f46b3395880a1, %g1, %r7
        setx  0x5e2eac85a148c7a8, %g1, %r8
        setx  0x74b2c0d48f423dff, %g1, %r9
        setx  0xdb2fd18c92b758a5, %g1, %r10
        setx  0x66f5b9b7f0338165, %g1, %r11
        setx  0x4ad088d8dc293d1b, %g1, %r12
        setx  0xfc9a5f614482551c, %g1, %r13
        setx  0x39d3b94257e2faac, %g1, %r14
        setx  0x66556e056a2138bf, %g1, %r15
        setx  0x67ed8f8f56eb2776, %g1, %r18
        setx  0x70b903197756ce2b, %g1, %r19
        setx  0x932ce477046fee33, %g1, %r20
        setx  0xd0bc20bc69ce880e, %g1, %r21
        setx  0xa6c55041d337b38a, %g1, %r22
        setx  0x92c06b58c8d2a9bc, %g1, %r23
        setx  0xa5ed48e0a23ec065, %g1, %r24
        setx  0xd33f98fb39510b48, %g1, %r25
        setx  0x153caf7a158a4022, %g1, %r26
        setx  0xf5f53854ec81e94c, %g1, %r27
        setx  0x6e5d4f4eb4e5e6cb, %g1, %r28
        setx  0xfd8322f7a0ef28a5, %g1, %r29
        setx  0xa6602f6efd930601, %g1, %r30
        setx  0xab9811409d34c852, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000040, %g1, %r17
        setx  0x24ac2f280707345b, %g1, %r0
        setx  0xa0706325bae76291, %g1, %r1
        setx  0x1ced58e28667edba, %g1, %r2
        setx  0x69f1548de5981e4b, %g1, %r3
        setx  0x71c09cc01eb8a726, %g1, %r4
        setx  0xb4cdc9efd0cbd4f3, %g1, %r5
        setx  0x28a5ebacae15dedf, %g1, %r6
        setx  0x2203ba3565e20654, %g1, %r7
        setx  0xcdecf944fee41d14, %g1, %r8
        setx  0xcd180667a641de14, %g1, %r9
        setx  0xe0453a7767b207ed, %g1, %r10
        setx  0x2eb04a9c52c540aa, %g1, %r11
        setx  0x797581d4864d8948, %g1, %r12
        setx  0x91a3ca0ce445da72, %g1, %r13
        setx  0x64120be2a96149d7, %g1, %r14
        setx  0xf8c465d2dc0acdd6, %g1, %r15
        setx  0x0304c4368205ca07, %g1, %r18
        setx  0xc3ddaa42978c0756, %g1, %r19
        setx  0x5a59a65f18f8a1c1, %g1, %r20
        setx  0x467d00e853ac1e81, %g1, %r21
        setx  0x6bcfab07598cd42d, %g1, %r22
        setx  0xf0bb0c1febefd7a1, %g1, %r23
        setx  0x1c15d579f4ac768f, %g1, %r24
        setx  0x5b593746bec4175c, %g1, %r25
        setx  0x839357089d9cb39b, %g1, %r26
        setx  0x6de5d924168d9b02, %g1, %r27
        setx  0x5d52506bf66d9dfe, %g1, %r28
        setx  0xe9177c181c468c22, %g1, %r29
        setx  0xa4f383d377f5ffdd, %g1, %r30
        setx  0x288e6fe5a2e40dfb, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000e20, %g1, %r17
        setx  0x7c883f157eb80e75, %g1, %r0
        setx  0xff8678c1ecd6b634, %g1, %r1
        setx  0x9e463f2ebe835df2, %g1, %r2
        setx  0x0e3bd25c15cbcf1e, %g1, %r3
        setx  0x6db932a379308d2f, %g1, %r4
        setx  0x546e69512b2072bd, %g1, %r5
        setx  0x63dd6915edf949e5, %g1, %r6
        setx  0xc4b3363b6fdeebc5, %g1, %r7
        setx  0xb1b8e55972149f10, %g1, %r8
        setx  0x4337a164334ed9cf, %g1, %r9
        setx  0x2fc7df01fe942251, %g1, %r10
        setx  0x3dfd6e5e96de2403, %g1, %r11
        setx  0x46cb53764b900f9b, %g1, %r12
        setx  0xd9c578f8a8dfe7d1, %g1, %r13
        setx  0x4fe92daa8d4b31a5, %g1, %r14
        setx  0xf4709f8b6dee1672, %g1, %r15
        setx  0x75ffb0693649fd61, %g1, %r18
        setx  0x803263b275b44de0, %g1, %r19
        setx  0xfd65c13fc6f7a3a0, %g1, %r20
        setx  0xede47c5d3f55dd73, %g1, %r21
        setx  0x805c7075d1e40ef3, %g1, %r22
        setx  0xc8755edb0c3934e9, %g1, %r23
        setx  0x38a4abd91abd3b29, %g1, %r24
        setx  0x7bbea0ae8e910c61, %g1, %r25
        setx  0x2ecb7b56c64ca718, %g1, %r26
        setx  0x9fd1372110f2e38c, %g1, %r27
        setx  0x82614a73f64134b3, %g1, %r28
        setx  0xcfd4063ebdbdf70f, %g1, %r29
        setx  0x7b7d3ba5d410513a, %g1, %r30
        setx  0x24e570d6c3f62fb5, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000960, %g1, %r17
        setx  0xe7a2631e568fa94a, %g1, %r0
        setx  0xc08d99d61d07f5cc, %g1, %r1
        setx  0x8540c5cbb1d09936, %g1, %r2
        setx  0x3d3b707b91851648, %g1, %r3
        setx  0x9daba07193bb0d6f, %g1, %r4
        setx  0x9b8e25fcc789d05c, %g1, %r5
        setx  0x89ff97098d4f84a9, %g1, %r6
        setx  0x7bbf48a04b3b4ae0, %g1, %r7
        setx  0xd3467426f6d77620, %g1, %r8
        setx  0xfe6a88c12ec8c9af, %g1, %r9
        setx  0x80da8beec62aa7f7, %g1, %r10
        setx  0x9e045dd46cd5afdb, %g1, %r11
        setx  0x9306ff38207c48d2, %g1, %r12
        setx  0x97c63f7f05d84f1b, %g1, %r13
        setx  0xe392ec76d319ec0a, %g1, %r14
        setx  0x852943d9034954e1, %g1, %r15
        setx  0x7eff75689a9ec192, %g1, %r18
        setx  0x55b4267c60d01298, %g1, %r19
        setx  0x924424bd9706bab5, %g1, %r20
        setx  0xa5a6021b96d2d2f0, %g1, %r21
        setx  0x0160f62e69a7718e, %g1, %r22
        setx  0x138b3d34d4d9b9d8, %g1, %r23
        setx  0xde822bf936db1d4a, %g1, %r24
        setx  0x55b3f7a1c1df2891, %g1, %r25
        setx  0x20abd4f1660a276d, %g1, %r26
        setx  0xba02781716bd2938, %g1, %r27
        setx  0x984c66bc0fff68a9, %g1, %r28
        setx  0x3631dfa961a859bd, %g1, %r29
        setx  0xa1a24a149d887bde, %g1, %r30
        setx  0x14e789823e75fa6c, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000610, %g1, %r17
        setx  0x8493b636bb9eb9c9, %g1, %r0
        setx  0x67d5d853cac5d2be, %g1, %r1
        setx  0x384845fa7007c2d6, %g1, %r2
        setx  0xeba426f57acbd256, %g1, %r3
        setx  0xec1fb9e5078259df, %g1, %r4
        setx  0x6874abf0d4d91cc5, %g1, %r5
        setx  0xc0b65e341dbfb2ef, %g1, %r6
        setx  0x5d4ff4e5478753d8, %g1, %r7
        setx  0x9a9359b570441d42, %g1, %r8
        setx  0x212a36ecfcf5cdfc, %g1, %r9
        setx  0x39d983ac14446411, %g1, %r10
        setx  0x9d4c69730499d6a2, %g1, %r11
        setx  0x47f674f645b750df, %g1, %r12
        setx  0x3c3a4cfc95245a13, %g1, %r13
        setx  0xd47f666c3b3db7a9, %g1, %r14
        setx  0x3137502308403793, %g1, %r15
        setx  0x57c0a8248598c1d2, %g1, %r18
        setx  0xd52436c31b19c95c, %g1, %r19
        setx  0x2f26931666bef69e, %g1, %r20
        setx  0x2503e931d1c2053f, %g1, %r21
        setx  0x412eb5dc600c88f0, %g1, %r22
        setx  0x69fdf24122c450b8, %g1, %r23
        setx  0x3ee972b104fdb635, %g1, %r24
        setx  0xe704457abad5d274, %g1, %r25
        setx  0x1ffe3fcc32c43be4, %g1, %r26
        setx  0x8180c0669427bca6, %g1, %r27
        setx  0xebc077eb3359c191, %g1, %r28
        setx  0xbd3e123e821edd0d, %g1, %r29
        setx  0x37917553ccb636f6, %g1, %r30
        setx  0x430b7ac00fee05a9, %g1, %r31
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
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,65)
	.word 0xc6942f06  ! 3: LDUHA_I	lduha	[%r16, + 0x0f06] %asi, %r3
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xe8941011  ! 5: LDUHA_R	lduha	[%r16, %r17] 0x80, %r20
	.word 0x90c40011  ! 7: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0xb49c0011  ! 7: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xaab42519  ! 7: ORNcc_I	orncc 	%r16, 0x0519, %r21
	.word 0x9d643801  ! 7: MOVcc_I	<illegal instruction>
	.word 0x849c0011  ! 7: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x963c291f  ! 7: XNOR_I	xnor 	%r16, 0x091f, %r11
	.word 0x8abc2ff3  ! 7: XNORcc_I	xnorcc 	%r16, 0x0ff3, %r5
	.word 0xc4942c57  ! 8: LDUHA_I	lduha	[%r16, + 0x0c57] %asi, %r2
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xe91423a9  ! 10: LDQF_I	-	[%r16, 0x03a9], %f20
	.word 0x8634203e  ! 12: ORN_I	orn 	%r16, 0x003e, %r3
	.word 0x900c0011  ! 12: AND_R	and 	%r16, %r17, %r8
	.word 0x9e442efd  ! 12: ADDC_I	addc 	%r16, 0x0efd, %r15
	.word 0x977c2401  ! 12: MOVR_I	move	%r16, 0xfffffe34, %r11
	.word 0x913c1011  ! 12: SRAX_R	srax	%r16, %r17, %r8
	.word 0xb42c2d62  ! 12: ANDN_I	andn 	%r16, 0x0d62, %r26
	.word 0xb84423a4  ! 12: ADDC_I	addc 	%r16, 0x03a4, %r28
	.word 0xf3042e71  ! 13: LDF_I	ld	[%r16, 0x0e71], %f25
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xd1841011  ! 15: LDFA_R	lda	[%r16, %r17], %f8
	.word 0xae442954  ! 17: ADDC_I	addc 	%r16, 0x0954, %r23
	.word 0xac3c2c45  ! 17: XNOR_I	xnor 	%r16, 0x0c45, %r22
	.word 0x972c3001  ! 17: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x9e440011  ! 17: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x841c2c04  ! 17: XOR_I	xor 	%r16, 0x0c04, %r2
	.word 0x9e140011  ! 17: OR_R	or 	%r16, %r17, %r15
	.word 0xacc42153  ! 17: ADDCcc_I	addccc 	%r16, 0x0153, %r22
	.word 0xbab40011  ! 17: ORNcc_R	orncc 	%r16, %r17, %r29
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,16)
	.word 0xfa8c2153  ! 19: LDUBA_I	lduba	[%r16, + 0x0153] %asi, %r29
	.word 0xf44c0011  ! 21: LDSB_R	ldsb	[%r16 + %r17], %r26
	.word 0x9c442c33  ! 23: ADDC_I	addc 	%r16, 0x0c33, %r14
	.word 0x91342001  ! 23: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0xb08c2df5  ! 23: ANDcc_I	andcc 	%r16, 0x0df5, %r24
	.word 0x9f2c1011  ! 23: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x89643801  ! 23: MOVcc_I	<illegal instruction>
	.word 0x969c2efe  ! 23: XORcc_I	xorcc 	%r16, 0x0efe, %r11
	.word 0xa64425ed  ! 23: ADDC_I	addc 	%r16, 0x05ed, %r19
	.word 0xa64426de  ! 23: ADDC_I	addc 	%r16, 0x06de, %r19
	.word 0xed042f9f  ! 24: LDF_I	ld	[%r16, 0x0f9f], %f22
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xda140011  ! 26: LDUH_R	lduh	[%r16 + %r17], %r13
	.word 0xac14272f  ! 28: OR_I	or 	%r16, 0x072f, %r22
	.word 0x917c2401  ! 28: MOVR_I	move	%r16, 0xfffffe34, %r8
	.word 0x8f643801  ! 28: MOVcc_I	<illegal instruction>
	.word 0xb7341011  ! 28: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x89341011  ! 28: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x832c1011  ! 28: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x99343001  ! 28: SRLX_I	srlx	%r16, 0x0001, %r12
	.word 0xd0d42d22  ! 29: LDSHA_I	ldsha	[%r16, + 0x0d22] %asi, %r8
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xc4841011  ! 31: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r2
	.word 0x9d340011  ! 33: SRL_R	srl 	%r16, %r17, %r14
	.word 0x909c0011  ! 33: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0x9c3c0011  ! 33: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x8e842928  ! 33: ADDcc_I	addcc 	%r16, 0x0928, %r7
	.word 0xb2142ba9  ! 33: OR_I	or 	%r16, 0x0ba9, %r25
	.word 0x8b7c2401  ! 33: MOVR_I	move	%r16, 0xfffffe34, %r5
	.word 0x84140011  ! 33: OR_R	or 	%r16, %r17, %r2
	.word 0xd28c1011  ! 34: LDUBA_R	lduba	[%r16, %r17] 0x80, %r9
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xdc1429c3  ! 36: LDUH_I	lduh	[%r16 + 0x09c3], %r14
	.word 0xb63c2ba7  ! 38: XNOR_I	xnor 	%r16, 0x0ba7, %r27
	.word 0x837c0411  ! 38: MOVR_R	move	%r16, %r17, %r1
	.word 0xac8c0011  ! 38: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0xb8942a1a  ! 38: ORcc_I	orcc 	%r16, 0x0a1a, %r28
	.word 0xb21423c8  ! 38: OR_I	or 	%r16, 0x03c8, %r25
	.word 0x8f2c3001  ! 38: SLLX_I	sllx	%r16, 0x0001, %r7
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,46)
	.word 0xcf1c0000  ! 40: LDDF_R	ldd	[%r16, %r0], %f7
	.word 0xce841011  ! 42: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r7
	.word 0xb2140011  ! 44: OR_R	or 	%r16, %r17, %r25
	.word 0xa82c0011  ! 44: ANDN_R	andn 	%r16, %r17, %r20
	.word 0x9d7c0411  ! 44: MOVR_R	move	%r16, %r17, %r14
	.word 0x869c0011  ! 44: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0xa77c2401  ! 44: MOVR_I	move	%r16, 0xfffffe34, %r19
thr0_dc_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_3), 16, 16),1,DC_DATA,19)
	.word 0xe79c1000  ! 46: LDDFA_R	ldda	[%r16, %r0], %f19
thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xd1941011  ! 48: LDQFA_R	-	[%r16, %r17], %f8
	.word 0x98340011  ! 50: ORN_R	orn 	%r16, %r17, %r12
	.word 0x8e1c0011  ! 50: XOR_R	xor 	%r16, %r17, %r7
	.word 0xa6b42aa6  ! 50: ORNcc_I	orncc 	%r16, 0x0aa6, %r19
	.word 0xae1c28a3  ! 50: XOR_I	xor 	%r16, 0x08a3, %r23
	.word 0xb0b427d1  ! 50: ORNcc_I	orncc 	%r16, 0x07d1, %r24
	.word 0x84ac0011  ! 50: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x952c1011  ! 50: SLLX_R	sllx	%r16, %r17, %r10
	.word 0xf99c1011  ! 51: LDDFA_R	ldda	[%r16, %r17], %f28
thr0_irf_ce_7:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_7), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xf3042830  ! 53: LDF_I	ld	[%r16, 0x0830], %f25
	.word 0x9e1c0011  ! 55: XOR_R	xor 	%r16, %r17, %r15
	.word 0x872c3001  ! 55: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0xa69c0011  ! 55: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x972c1011  ! 55: SLLX_R	sllx	%r16, %r17, %r11
	.word 0xbb343001  ! 55: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0xea442184  ! 56: LDSW_I	ldsw	[%r16 + 0x0184], %r21
thr0_irf_ce_8:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_8), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xdccc1011  ! 58: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r14
	.word 0xb6b42a52  ! 60: ORNcc_I	orncc 	%r16, 0x0a52, %r27
	.word 0x96340011  ! 60: ORN_R	orn 	%r16, %r17, %r11
	.word 0xb8040011  ! 60: ADD_R	add 	%r16, %r17, %r28
	.word 0x948c277d  ! 60: ANDcc_I	andcc 	%r16, 0x077d, %r10
	.word 0x8e34209d  ! 60: ORN_I	orn 	%r16, 0x009d, %r7
	.word 0x892c0011  ! 60: SLL_R	sll 	%r16, %r17, %r4
	.word 0x888c2724  ! 60: ANDcc_I	andcc 	%r16, 0x0724, %r4
	.word 0x8b2c0011  ! 60: SLL_R	sll 	%r16, %r17, %r5
thr0_dc_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_4), 16, 16),1,DC_DATA,33)
	.word 0xca5c0000  ! 62: LDX_R	ldx	[%r16 + %r0], %r5
thr0_irf_ce_9:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_9), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xdeb41011  ! 64: STHA_R	stha	%r15, [%r16 + %r17] 0x80
	.word 0x9a940011  ! 66: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x8abc29a8  ! 66: XNORcc_I	xnorcc 	%r16, 0x09a8, %r5
	.word 0x9ebc0011  ! 66: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0xb4bc2edf  ! 66: XNORcc_I	xnorcc 	%r16, 0x0edf, %r26
	.word 0x8e140011  ! 66: OR_R	or 	%r16, %r17, %r7
	.word 0xa8bc2419  ! 66: XNORcc_I	xnorcc 	%r16, 0x0419, %r20
	.word 0x997c0411  ! 66: MOVR_R	move	%r16, %r17, %r12
thr0_dc_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_5), 16, 16),1,DC_DATA,65)
	.word 0xd91c0000  ! 68: LDDF_R	ldd	[%r16, %r0], %f12
	.word 0xeb941011  ! 70: LDQFA_R	-	[%r16, %r17], %f21
	.word 0x8a2c0011  ! 72: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xb33c1011  ! 72: SRAX_R	srax	%r16, %r17, %r25
	.word 0xaaac26a4  ! 72: ANDNcc_I	andncc 	%r16, 0x06a4, %r21
	.word 0x94040011  ! 72: ADD_R	add 	%r16, %r17, %r10
	.word 0x8c1422d9  ! 72: OR_I	or 	%r16, 0x02d9, %r6
	.word 0x82140011  ! 72: OR_R	or 	%r16, %r17, %r1
	.word 0x8a040011  ! 72: ADD_R	add 	%r16, %r17, %r5
thr0_dc_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_6), 16, 16),1,DC_DATA,58)
	.word 0xca4c22d9  ! 74: LDSB_I	ldsb	[%r16 + 0x02d9], %r5
thr0_irf_ce_10:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_10), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xd51c0011  ! 76: LDDF_R	ldd	[%r16, %r17], %f10
	.word 0x86bc2507  ! 78: XNORcc_I	xnorcc 	%r16, 0x0507, %r3
	.word 0x87343001  ! 78: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0xb2842c1c  ! 78: ADDcc_I	addcc 	%r16, 0x0c1c, %r25
	.word 0x86140011  ! 78: OR_R	or 	%r16, %r17, %r3
	.word 0x877c2401  ! 78: MOVR_I	move	%r16, 0xfffffe34, %r3
	.word 0x8b340011  ! 78: SRL_R	srl 	%r16, %r17, %r5
thr0_dc_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_7), 16, 16),1,DC_DATA,25)
	.word 0xca8c2c1c  ! 80: LDUBA_I	lduba	[%r16, + 0x0c1c] %asi, %r5
	.word 0xc31427d3  ! 82: LDQF_I	-	[%r16, 0x07d3], %f1
	.word 0x841c0011  ! 84: XOR_R	xor 	%r16, %r17, %r2
	.word 0x97643801  ! 84: MOVcc_I	<illegal instruction>
	.word 0x892c1011  ! 84: SLLX_R	sllx	%r16, %r17, %r4
	.word 0x8c2c0011  ! 84: ANDN_R	andn 	%r16, %r17, %r6
	.word 0x9ac40011  ! 84: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x9a9c2d42  ! 84: XORcc_I	xorcc 	%r16, 0x0d42, %r13
	.word 0xc28c2170  ! 85: LDUBA_I	lduba	[%r16, + 0x0170] %asi, %r1
	.word 0xcf9c1011  ! 87: LDDFA_R	ldda	[%r16, %r17], %f7
	.word 0x9f3c0011  ! 89: SRA_R	sra 	%r16, %r17, %r15
	.word 0x90840011  ! 89: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x933c1011  ! 89: SRAX_R	srax	%r16, %r17, %r9
	.word 0x937c0411  ! 89: MOVR_R	move	%r16, %r17, %r9
	.word 0x8cbc0011  ! 89: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x8abc21a2  ! 89: XNORcc_I	xnorcc 	%r16, 0x01a2, %r5
	.word 0x9f341011  ! 89: SRLX_R	srlx	%r16, %r17, %r15
thr0_dc_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_8), 16, 16),1,DC_DATA,39)
	.word 0xde1c0000  ! 91: LDD_R	ldd	[%r16 + %r0], %r15
	.word 0xc3f42011  ! 93: CASXA_R	casxa	[%r16]%asi, %r17, %r1
	.word 0xb23c23c4  ! 95: XNOR_I	xnor 	%r16, 0x03c4, %r25
	.word 0x893c1011  ! 95: SRAX_R	srax	%r16, %r17, %r4
	.word 0x9a340011  ! 95: ORN_R	orn 	%r16, %r17, %r13
	.word 0x82040011  ! 95: ADD_R	add 	%r16, %r17, %r1
	.word 0x9c3c0011  ! 95: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x9b643801  ! 95: MOVcc_I	<illegal instruction>
	.word 0xdd042949  ! 96: LDF_I	ld	[%r16, 0x0949], %f14
        wr %g0, 0x4, %fprs
	.word 0xaa44264e  ! 100: ADDC_I	addc 	%r16, 0x064e, %r21
	.word 0xb48c2650  ! 100: ANDcc_I	andcc 	%r16, 0x0650, %r26
	.word 0x922c0011  ! 100: ANDN_R	andn 	%r16, %r17, %r9
	.word 0xba840011  ! 100: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0x9cc40011  ! 100: ADDCcc_R	addccc 	%r16, %r17, %r14
thr0_dc_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_9), 16, 16),1,DC_DATA,30)
	.word 0xdd841000  ! 102: LDFA_R	lda	[%r16, %r0], %f14
	.word 0xc8c41011  ! 104: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r4
	.word 0xba042a3e  ! 106: ADD_I	add 	%r16, 0x0a3e, %r29
	.word 0x948423ae  ! 106: ADDcc_I	addcc 	%r16, 0x03ae, %r10
	.word 0x88140011  ! 106: OR_R	or 	%r16, %r17, %r4
	.word 0x96942528  ! 106: ORcc_I	orcc 	%r16, 0x0528, %r11
	.word 0xb97c2401  ! 106: MOVR_I	move	%r16, 0xfffffe34, %r28
	.word 0x8ab42f5b  ! 106: ORNcc_I	orncc 	%r16, 0x0f5b, %r5
	.word 0x85341011  ! 106: SRLX_R	srlx	%r16, %r17, %r2
	.word 0xb6142d9e  ! 106: OR_I	or 	%r16, 0x0d9e, %r27
	.word 0xcb941011  ! 107: LDQFA_R	-	[%r16, %r17], %f5
	.word 0xfaf423d0  ! 109: STXA_I	stxa	%r29, [%r16 + 0x03d0] %asi
	.word 0xaeac26e5  ! 111: ANDNcc_I	andncc 	%r16, 0x06e5, %r23
	.word 0x94840011  ! 111: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0x91341011  ! 111: SRLX_R	srlx	%r16, %r17, %r8
	.word 0xa81c2998  ! 111: XOR_I	xor 	%r16, 0x0998, %r20
	.word 0x9634213c  ! 111: ORN_I	orn 	%r16, 0x013c, %r11
	.word 0x917c2401  ! 111: MOVR_I	move	%r16, 0xfffffe34, %r8
	.word 0x843c2cea  ! 111: XNOR_I	xnor 	%r16, 0x0cea, %r2
	.word 0xf0542f8c  ! 112: LDSH_I	ldsh	[%r16 + 0x0f8c], %r24
thr0_irf_ce_11:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_11), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0x8e5c2c3b  ! 114: SMUL_I	smul 	%r16, 0x0c3b, %r7
	.word 0xa6842f87  ! 116: ADDcc_I	addcc 	%r16, 0x0f87, %r19
	.word 0xb92c3001  ! 116: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0x90ac2ab6  ! 116: ANDNcc_I	andncc 	%r16, 0x0ab6, %r8
	.word 0xa7340011  ! 116: SRL_R	srl 	%r16, %r17, %r19
	.word 0xb2042280  ! 116: ADD_I	add 	%r16, 0x0280, %r25
	.word 0x989423a8  ! 117: ORcc_I	orcc 	%r16, 0x03a8, %r12
	.word 0x933c2001  ! 117: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x988c0011  ! 117: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x8a442f9e  ! 117: ADDC_I	addc 	%r16, 0x0f9e, %r5
	.word 0xaec420eb  ! 117: ADDCcc_I	addccc 	%r16, 0x00eb, %r23
	.word 0xa61c2cb3  ! 117: XOR_I	xor 	%r16, 0x0cb3, %r19
	.word 0x9d3c1011  ! 117: SRAX_R	srax	%r16, %r17, %r14
	rd      %pc, %r18
	set     0x20, %r17
thr0_dc_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_10), 16, 16),1,DC_DATA,31)
	.word 0xdcc41000  ! 118: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r14
	return     %r18 + 0x20
	.word 0x88440011  ! 121: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x92042950  ! 121: ADD_I	add 	%r16, 0x0950, %r9
	.word 0x9e8c28e1  ! 121: ANDcc_I	andcc 	%r16, 0x08e1, %r15
	.word 0x833c2001  ! 121: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0x8e442890  ! 121: ADDC_I	addc 	%r16, 0x0890, %r7
	.word 0x8a3c22ff  ! 121: XNOR_I	xnor 	%r16, 0x02ff, %r5
	.word 0x8a8c2173  ! 121: ANDcc_I	andcc 	%r16, 0x0173, %r5
	.word 0xcacc1011  ! 122: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r5
thr0_irf_ce_12:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_12), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xf61c2398  ! 124: LDD_I	ldd	[%r16 + 0x0398], %r27
	.word 0x992c3001  ! 126: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x9b7c0411  ! 126: MOVR_R	move	%r16, %r17, %r13
	.word 0x94940011  ! 126: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x82bc2aec  ! 126: XNORcc_I	xnorcc 	%r16, 0x0aec, %r1
	.word 0x9c4423af  ! 126: ADDC_I	addc 	%r16, 0x03af, %r14
	.word 0x9804236c  ! 126: ADD_I	add 	%r16, 0x036c, %r12
	.word 0x82b42e85  ! 126: ORNcc_I	orncc 	%r16, 0x0e85, %r1
	.word 0xd24c0011  ! 127: LDSB_R	ldsb	[%r16 + %r17], %r9
thr0_irf_ce_13:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_13), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xf3142cd4  ! 129: LDQF_I	-	[%r16, 0x0cd4], %f25
	.word 0x9a340011  ! 131: ORN_R	orn 	%r16, %r17, %r13
	.word 0x828c0011  ! 131: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0xa6c40011  ! 131: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x901c29ff  ! 131: XOR_I	xor 	%r16, 0x09ff, %r8
	.word 0x8d2c3001  ! 131: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0xef0421f4  ! 132: LDF_I	ld	[%r16, 0x01f4], %f23
!Illinst alu
	.word 0xb69426b3  ! 134: ORcc_I	orcc 	%r16, 0x06b3, %r27
	.word 0xb43c294b  ! 136: XNOR_I	xnor 	%r16, 0x094b, %r26
	.word 0xa6140011  ! 136: OR_R	or 	%r16, %r17, %r19
	.word 0x8e142a2f  ! 136: OR_I	or 	%r16, 0x0a2f, %r7
	.word 0xac3c0011  ! 136: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x863c0011  ! 136: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0xda04218a  ! 137: LDUW_I	lduw	[%r16 + 0x018a], %r13
thr0_irf_ce_14:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_14), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xdac41011  ! 139: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r13
	.word 0x9e0c2ea3  ! 141: AND_I	and 	%r16, 0x0ea3, %r15
	.word 0x82040011  ! 141: ADD_R	add 	%r16, %r17, %r1
	.word 0x88ac0011  ! 141: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x8a9c0011  ! 141: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0x94b40011  ! 141: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0x8ec42660  ! 141: ADDCcc_I	addccc 	%r16, 0x0660, %r7
	.word 0x962c224a  ! 141: ANDN_I	andn 	%r16, 0x024a, %r11
	.word 0x9ac40011  ! 141: ADDCcc_R	addccc 	%r16, %r17, %r13
thr0_dc_err_11:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_11), 16, 16),1,DC_DATA,0)
	.word 0xda9c224a  ! 143: LDDA_I	ldda	[%r16, + 0x024a] %asi, %r13
	.word 0xd8040011  ! 145: LDUW_R	lduw	[%r16 + %r17], %r12
	.word 0x872c0011  ! 147: SLL_R	sll 	%r16, %r17, %r3
	.word 0xb23c0011  ! 147: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0x99341011  ! 147: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x9b7c0411  ! 147: MOVR_R	move	%r16, %r17, %r13
	.word 0xaa3c2856  ! 147: XNOR_I	xnor 	%r16, 0x0856, %r21
thr0_dc_err_12:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_12), 16, 16),1,DC_DATA,20)
	.word 0xeb042856  ! 149: LDF_I	ld	[%r16, 0x0856], %f21
	.word 0xea5c277d  ! 151: LDX_I	ldx	[%r16 + 0x077d], %r21
	.word 0x88c4217e  ! 153: ADDCcc_I	addccc 	%r16, 0x017e, %r4
	.word 0xac940011  ! 153: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0x8c4429cb  ! 153: ADDC_I	addc 	%r16, 0x09cb, %r6
	.word 0xb6042484  ! 153: ADD_I	add 	%r16, 0x0484, %r27
	.word 0x89641811  ! 153: MOVcc_R	<illegal instruction>
	.word 0x960c28d1  ! 153: AND_I	and 	%r16, 0x08d1, %r11
	.word 0x85643801  ! 153: MOVcc_I	<illegal instruction>
	.word 0xa8bc0011  ! 153: XNORcc_R	xnorcc 	%r16, %r17, %r20
thr0_dc_err_13:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_13), 16, 16),1,DC_DATA,29)
	.word 0xe80c28d1  ! 155: LDUB_I	ldub	[%r16 + 0x08d1], %r20
thr0_irf_ce_15:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_15), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xc79c1011  ! 157: LDDFA_R	ldda	[%r16, %r17], %f3
	.word 0xb43422b7  ! 159: ORN_I	orn 	%r16, 0x02b7, %r26
	.word 0x8e1c0011  ! 159: XOR_R	xor 	%r16, %r17, %r7
	.word 0x953c0011  ! 159: SRA_R	sra 	%r16, %r17, %r10
	.word 0x97641811  ! 159: MOVcc_R	<illegal instruction>
	.word 0x8e9423a1  ! 159: ORcc_I	orcc 	%r16, 0x03a1, %r7
	.word 0xdacc2367  ! 160: LDSBA_I	ldsba	[%r16, + 0x0367] %asi, %r13
thr0_irf_ce_16:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_16), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xc274292e  ! 164: STX_I	stx	%r1, [%r16 + 0x092e]
	.word 0xaa14205f  ! 166: OR_I	or 	%r16, 0x005f, %r21
	.word 0xacb428e3  ! 166: ORNcc_I	orncc 	%r16, 0x08e3, %r22
	.word 0x989c0011  ! 166: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0xb7643801  ! 166: MOVcc_I	<illegal instruction>
	.word 0xb09420e7  ! 166: ORcc_I	orcc 	%r16, 0x00e7, %r24
	.word 0xba0c2717  ! 166: AND_I	and 	%r16, 0x0717, %r29
	.word 0x92c40011  ! 166: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xdc1c2355  ! 167: LDD_I	ldd	[%r16 + 0x0355], %r14
thr0_irf_ce_17:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_17), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xde7425c8  ! 171: STX_I	stx	%r15, [%r16 + 0x05c8]
	.word 0x973c0011  ! 173: SRA_R	sra 	%r16, %r17, %r11
	.word 0xae2c0011  ! 173: ANDN_R	andn 	%r16, %r17, %r23
	.word 0xab2c0011  ! 173: SLL_R	sll 	%r16, %r17, %r21
	.word 0xb43424e0  ! 173: ORN_I	orn 	%r16, 0x04e0, %r26
	.word 0xb4842e53  ! 173: ADDcc_I	addcc 	%r16, 0x0e53, %r26
	.word 0x86340011  ! 173: ORN_R	orn 	%r16, %r17, %r3
	.word 0xb9340011  ! 173: SRL_R	srl 	%r16, %r17, %r28
	.word 0xfacc1011  ! 174: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r29
	.word 0xf4540011  ! 176: LDSH_R	ldsh	[%r16 + %r17], %r26
	.word 0x820c2064  ! 178: AND_I	and 	%r16, 0x0064, %r1
	.word 0x9e342388  ! 178: ORN_I	orn 	%r16, 0x0388, %r15
	.word 0xa83c2086  ! 178: XNOR_I	xnor 	%r16, 0x0086, %r20
	.word 0xb7341011  ! 178: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x872c2001  ! 178: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x8b7c2401  ! 178: MOVR_I	move	%r16, 0xfffffe34, %r5
	.word 0xb81425c0  ! 178: OR_I	or 	%r16, 0x05c0, %r28
	.word 0x893c1011  ! 178: SRAX_R	srax	%r16, %r17, %r4
	.word 0xee1c2de9  ! 179: LDD_I	ldd	[%r16 + 0x0de9], %r23
thr0_irf_ce_18:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_18), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xc9140011  ! 181: LDQF_R	-	[%r16, %r17], %f4
	.word 0x8cb40011  ! 183: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0xa7643801  ! 183: MOVcc_I	<illegal instruction>
	.word 0xa7643801  ! 183: MOVcc_I	<illegal instruction>
	.word 0x86c40011  ! 183: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x8a1c2d50  ! 183: XOR_I	xor 	%r16, 0x0d50, %r5
	.word 0x909c2a96  ! 183: XORcc_I	xorcc 	%r16, 0x0a96, %r8
	.word 0x8ac40011  ! 183: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x9a440011  ! 183: ADDC_R	addc 	%r16, %r17, %r13
	.word 0xea8c2d23  ! 184: LDUBA_I	lduba	[%r16, + 0x0d23] %asi, %r21
thr0_irf_ce_19:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_19), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xfa440011  ! 186: LDSW_R	ldsw	[%r16 + %r17], %r29
	.word 0x861c0011  ! 188: XOR_R	xor 	%r16, %r17, %r3
	.word 0x9b3c1011  ! 188: SRAX_R	srax	%r16, %r17, %r13
	.word 0x8b342001  ! 188: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0xb0bc0011  ! 188: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0x940c0011  ! 188: AND_R	and 	%r16, %r17, %r10
	.word 0x882c246f  ! 189: ANDN_I	andn 	%r16, 0x046f, %r4
	.word 0x91341011  ! 189: SRLX_R	srlx	%r16, %r17, %r8
	.word 0xa89c2977  ! 189: XORcc_I	xorcc 	%r16, 0x0977, %r20
	.word 0x95342001  ! 189: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x8f641811  ! 189: MOVcc_R	<illegal instruction>
	.word 0x8b643801  ! 189: MOVcc_I	<illegal instruction>
	.word 0x9a44234e  ! 189: ADDC_I	addc 	%r16, 0x034e, %r13
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xe65c2cfa  ! 189: LDX_I	ldx	[%r16 + 0x0cfa], %r19
thr0_irf_ce_20:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_20), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0x83641811  ! 192: MOVcc_R	<illegal instruction>
	.word 0x848c0011  ! 192: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0xa60c0011  ! 192: AND_R	and 	%r16, %r17, %r19
	.word 0x99340011  ! 192: SRL_R	srl 	%r16, %r17, %r12
	.word 0x9e3c0011  ! 192: XNOR_R	xnor 	%r16, %r17, %r15
thr0_dc_err_14:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_14), 16, 16),1,DC_DATA,62)
	.word 0xde841000  ! 194: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r15
thr0_irf_ce_21:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_21), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xce7423b0  ! 198: STX_I	stx	%r7, [%r16 + 0x03b0]
	.word 0xae940011  ! 200: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0xae942e01  ! 200: ORcc_I	orcc 	%r16, 0x0e01, %r23
	.word 0xbb3c0011  ! 200: SRA_R	sra 	%r16, %r17, %r29
	.word 0x960c2dfe  ! 200: AND_I	and 	%r16, 0x0dfe, %r11
	.word 0x877c2401  ! 200: MOVR_I	move	%r16, 0xfffffe34, %r3
	.word 0xaac42cb9  ! 200: ADDCcc_I	addccc 	%r16, 0x0cb9, %r21
	.word 0xaa440011  ! 200: ADDC_R	addc 	%r16, %r17, %r21
	.word 0xb6040011  ! 200: ADD_R	add 	%r16, %r17, %r27
thr0_dc_err_15:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_15), 16, 16),1,DC_DATA,29)
	.word 0xf71c0000  ! 202: LDDF_R	ldd	[%r16, %r0], %f27
thr0_irf_ce_22:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_22), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xc6540011  ! 204: LDSH_R	ldsh	[%r16 + %r17], %r3
	.word 0xb4340011  ! 206: ORN_R	orn 	%r16, %r17, %r26
	.word 0x9cc40011  ! 206: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0xb6bc0011  ! 206: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0x84940011  ! 206: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x997c2401  ! 206: MOVR_I	move	%r16, 0xfffffe34, %r12
	.word 0xdcc41011  ! 207: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r14
	.word 0xdf1c2860  ! 209: LDDF_I	ldd	[%r16, 0x0860], %f15
	.word 0x8c142b25  ! 211: OR_I	or 	%r16, 0x0b25, %r6
	.word 0x972c1011  ! 211: SLLX_R	sllx	%r16, %r17, %r11
	.word 0x85341011  ! 211: SRLX_R	srlx	%r16, %r17, %r2
	.word 0x8a340011  ! 211: ORN_R	orn 	%r16, %r17, %r5
	.word 0x8c2c0011  ! 211: ANDN_R	andn 	%r16, %r17, %r6
	.word 0xab3c1011  ! 211: SRAX_R	srax	%r16, %r17, %r21
	.word 0x8e9c26fc  ! 211: XORcc_I	xorcc 	%r16, 0x06fc, %r7
	.word 0x9634272c  ! 211: ORN_I	orn 	%r16, 0x072c, %r11
thr0_dc_err_16:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_16), 16, 16),1,DC_DATA,65)
	.word 0xd7040000  ! 213: LDF_R	ld	[%r16, %r0], %f11
thr0_irf_ce_23:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_23), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xc9841011  ! 215: LDFA_R	lda	[%r16, %r17], %f4
	.word 0x888c0011  ! 217: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0x82ac2f97  ! 217: ANDNcc_I	andncc 	%r16, 0x0f97, %r1
	.word 0x969c0011  ! 217: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0xaebc2445  ! 217: XNORcc_I	xnorcc 	%r16, 0x0445, %r23
	.word 0xb1342001  ! 217: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0xb73c0011  ! 217: SRA_R	sra 	%r16, %r17, %r27
	.word 0x9e8c0011  ! 217: ANDcc_R	andcc 	%r16, %r17, %r15
thr0_dc_err_17:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_17), 16, 16),1,DC_DATA,11)
	.word 0xdf1c0000  ! 219: LDDF_R	ldd	[%r16, %r0], %f15
thr0_irf_ce_24:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_24), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xd1941011  ! 221: LDQFA_R	-	[%r16, %r17], %f8
	.word 0xb69c0011  ! 223: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0xb0440011  ! 223: ADDC_R	addc 	%r16, %r17, %r24
	.word 0xaf2c1011  ! 223: SLLX_R	sllx	%r16, %r17, %r23
	.word 0xae340011  ! 223: ORN_R	orn 	%r16, %r17, %r23
	.word 0x828c2e59  ! 223: ANDcc_I	andcc 	%r16, 0x0e59, %r1
	.word 0x84140011  ! 223: OR_R	or 	%r16, %r17, %r2
	.word 0xaf3c0011  ! 223: SRA_R	sra 	%r16, %r17, %r23
	.word 0xb7341011  ! 223: SRLX_R	srlx	%r16, %r17, %r27
	.word 0xc80c0011  ! 224: LDUB_R	ldub	[%r16 + %r17], %r4
	.word 0xc36c28a1  ! 226: PREFETCH_I	prefetch	[%r16 + 0x08a1], #one_read
	.word 0x893c1011  ! 228: SRAX_R	srax	%r16, %r17, %r4
	.word 0xad2c0011  ! 228: SLL_R	sll 	%r16, %r17, %r22
	.word 0xb12c0011  ! 228: SLL_R	sll 	%r16, %r17, %r24
	.word 0x84b42e73  ! 228: ORNcc_I	orncc 	%r16, 0x0e73, %r2
	.word 0xa6ac0011  ! 228: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0x8b7c0411  ! 228: MOVR_R	move	%r16, %r17, %r5
	.word 0x923c0011  ! 228: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0xaf2c0011  ! 228: SLL_R	sll 	%r16, %r17, %r23
	.word 0xf08c21b9  ! 229: LDUBA_I	lduba	[%r16, + 0x01b9] %asi, %r24
thr0_irf_ce_25:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_25), 16, 16),1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xd45c2c22  ! 231: LDX_I	ldx	[%r16 + 0x0c22], %r10
	.word 0x8f2c2001  ! 233: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0xb03c0011  ! 233: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0x9eac0011  ! 233: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x96140011  ! 233: OR_R	or 	%r16, %r17, %r11
	.word 0x983c225a  ! 233: XNOR_I	xnor 	%r16, 0x025a, %r12
	.word 0xaa8c0011  ! 233: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0xa6b40011  ! 233: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0xf8140011  ! 234: LDUH_R	lduh	[%r16 + %r17], %r28
thr0_irf_ce_26:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_26), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0x81534000  ! 236: RDPR_OTHERWIN	rdpr	%otherwin, %r0
	.word 0x8a3c2c72  ! 238: XNOR_I	xnor 	%r16, 0x0c72, %r5
	.word 0x963c0011  ! 238: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0xb2b42ce3  ! 238: ORNcc_I	orncc 	%r16, 0x0ce3, %r25
	.word 0xb7341011  ! 238: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x843c2481  ! 238: XNOR_I	xnor 	%r16, 0x0481, %r2
thr0_dc_err_18:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_18), 16, 16),1,DC_DATA,54)
	.word 0xc51c0000  ! 240: LDDF_R	ldd	[%r16, %r0], %f2
thr0_irf_ce_27:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_27), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xdac42cc1  ! 242: LDSWA_I	ldswa	[%r16, + 0x0cc1] %asi, %r13
	.word 0xb17c2401  ! 244: MOVR_I	move	%r16, 0xfffffe34, %r24
	.word 0x880c2d11  ! 244: AND_I	and 	%r16, 0x0d11, %r4
	.word 0xaf342001  ! 244: SRL_I	srl 	%r16, 0x0001, %r23
	.word 0x9f341011  ! 244: SRLX_R	srlx	%r16, %r17, %r15
	.word 0xb12c0011  ! 244: SLL_R	sll 	%r16, %r17, %r24
	.word 0xb8942c18  ! 244: ORcc_I	orcc 	%r16, 0x0c18, %r28
	.word 0xb0042a15  ! 244: ADD_I	add 	%r16, 0x0a15, %r24
	.word 0xd6c422e8  ! 245: LDSWA_I	ldswa	[%r16, + 0x02e8] %asi, %r11
thr0_irf_ce_28:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_28), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xf60c257b  ! 247: LDUB_I	ldub	[%r16 + 0x057b], %r27
	.word 0x993c0011  ! 249: SRA_R	sra 	%r16, %r17, %r12
	.word 0x933c2001  ! 249: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x8e940011  ! 249: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0x8884235e  ! 249: ADDcc_I	addcc 	%r16, 0x035e, %r4
	.word 0x989c0011  ! 249: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0xb60424a6  ! 249: ADD_I	add 	%r16, 0x04a6, %r27
	.word 0xae8c0011  ! 249: ANDcc_R	andcc 	%r16, %r17, %r23
thr0_dc_err_19:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_19), 16, 16),1,DC_DATA,55)
	.word 0xee5c0000  ! 251: LDX_R	ldx	[%r16 + %r0], %r23
	.word 0xd11c290c  ! 253: LDDF_I	ldd	[%r16, 0x090c], %f8
	.word 0xaa940011  ! 255: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0xb2bc0011  ! 255: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0x98c42a21  ! 255: ADDCcc_I	addccc 	%r16, 0x0a21, %r12
	.word 0x8c3c0011  ! 255: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x96842879  ! 255: ADDcc_I	addcc 	%r16, 0x0879, %r11
	.word 0xdd040011  ! 256: LDF_R	ld	[%r16, %r17], %f14
!Illinst alu
	.word 0x82942ee7  ! 258: ORcc_I	orcc 	%r16, 0x0ee7, %r1
	.word 0xb17c0411  ! 260: MOVR_R	move	%r16, %r17, %r24
	.word 0x9e042566  ! 260: ADD_I	add 	%r16, 0x0566, %r15
	.word 0x8c840011  ! 260: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xb40c2758  ! 260: AND_I	and 	%r16, 0x0758, %r26
	.word 0xb48c0011  ! 260: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0x828c2a3a  ! 260: ANDcc_I	andcc 	%r16, 0x0a3a, %r1
	.word 0xa8040011  ! 260: ADD_R	add 	%r16, %r17, %r20
thr0_dc_err_20:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_20), 16, 16),1,DC_DATA,49)
	.word 0xe9941000  ! 262: LDQFA_R	-	[%r16, %r0], %f20
	.word 0xf65c0011  ! 264: LDX_R	ldx	[%r16 + %r17], %r27
	.word 0xb72c2001  ! 266: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0x8eac2613  ! 266: ANDNcc_I	andncc 	%r16, 0x0613, %r7
	.word 0xb03c0011  ! 266: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0x9b342001  ! 266: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x917c2401  ! 266: MOVR_I	move	%r16, 0xfffffe34, %r8
	.word 0x852c2001  ! 266: SLL_I	sll 	%r16, 0x0001, %r2
thr0_dc_err_21:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_21), 16, 16),1,DC_DATA,59)
	.word 0xc59c1000  ! 268: LDDFA_R	ldda	[%r16, %r0], %f2
	.word 0xd8442ba9  ! 270: LDSW_I	ldsw	[%r16 + 0x0ba9], %r12
	.word 0xaa1c0011  ! 272: XOR_R	xor 	%r16, %r17, %r21
	.word 0x90bc0011  ! 272: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x9d2c3001  ! 272: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0x92c42ec1  ! 272: ADDCcc_I	addccc 	%r16, 0x0ec1, %r9
	.word 0x909c0011  ! 272: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0xacc40011  ! 272: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0xdf042446  ! 273: LDF_I	ld	[%r16, 0x0446], %f15
	.word 0xc24c2d42  ! 275: LDSB_I	ldsb	[%r16 + 0x0d42], %r1
	.word 0x9a04290e  ! 277: ADD_I	add 	%r16, 0x090e, %r13
	.word 0x95643801  ! 277: MOVcc_I	<illegal instruction>
	.word 0x908c0011  ! 277: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0xba9c2277  ! 277: XORcc_I	xorcc 	%r16, 0x0277, %r29
	.word 0x9e0c2221  ! 277: AND_I	and 	%r16, 0x0221, %r15
	.word 0xc9140011  ! 278: LDQF_R	-	[%r16, %r17], %f4
	.word 0xde142aab  ! 280: LDUH_I	lduh	[%r16 + 0x0aab], %r15
	.word 0x82040011  ! 282: ADD_R	add 	%r16, %r17, %r1
	.word 0x94c40011  ! 282: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x868423dc  ! 282: ADDcc_I	addcc 	%r16, 0x03dc, %r3
	.word 0x820c2bd6  ! 282: AND_I	and 	%r16, 0x0bd6, %r1
	.word 0x84840011  ! 282: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0xca442659  ! 283: LDSW_I	ldsw	[%r16 + 0x0659], %r5
thr0_irf_ce_29:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_29), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xf49c28d3  ! 285: LDDA_I	ldda	[%r16, + 0x08d3] %asi, %r26
	.word 0x937c2401  ! 287: MOVR_I	move	%r16, 0xfffffe34, %r9
	.word 0x968c0011  ! 287: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x8c9c267e  ! 287: XORcc_I	xorcc 	%r16, 0x067e, %r6
	.word 0x8a840011  ! 287: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0xb0940011  ! 287: ORcc_R	orcc 	%r16, %r17, %r24
thr0_dc_err_22:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_22), 16, 16),1,DC_DATA,69)
	.word 0xf104267e  ! 289: LDF_I	ld	[%r16, 0x067e], %f24
	.word 0xb0fc242f  ! 291: SDIVcc_I	sdivcc 	%r16, 0x042f, %r24
	.word 0xb2040011  ! 293: ADD_R	add 	%r16, %r17, %r25
	.word 0x84442021  ! 293: ADDC_I	addc 	%r16, 0x0021, %r2
	.word 0xb684284f  ! 293: ADDcc_I	addcc 	%r16, 0x084f, %r27
	.word 0x91342001  ! 293: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0x99342001  ! 293: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0xa92c2001  ! 293: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0x821c0011  ! 293: XOR_R	xor 	%r16, %r17, %r1
	.word 0xf11c0011  ! 294: LDDF_R	ldd	[%r16, %r17], %f24
	.word 0xf3040011  ! 296: LDF_R	ld	[%r16, %r17], %f25
	.word 0x863c227f  ! 298: XNOR_I	xnor 	%r16, 0x027f, %r3
	.word 0x96bc2886  ! 298: XNORcc_I	xnorcc 	%r16, 0x0886, %r11
	.word 0x953c0011  ! 298: SRA_R	sra 	%r16, %r17, %r10
	.word 0x96940011  ! 298: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0xbb3c2001  ! 298: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0x97643801  ! 298: MOVcc_I	<illegal instruction>
thr0_dc_err_23:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_23), 16, 16),1,DC_DATA,5)
	.word 0xd7941000  ! 300: LDQFA_R	-	[%r16, %r0], %f11
thr0_irf_ce_30:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_30), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xf0fc1011  ! 302: SWAPA_R	swapa	%r24, [%r16 + %r17] 0x80
	.word 0x95342001  ! 304: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x9e1c2892  ! 304: XOR_I	xor 	%r16, 0x0892, %r15
	.word 0x953c1011  ! 304: SRAX_R	srax	%r16, %r17, %r10
	.word 0x88940011  ! 304: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x9e8c0011  ! 304: ANDcc_R	andcc 	%r16, %r17, %r15
thr0_dc_err_24:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_24), 16, 16),1,DC_DATA,35)
	.word 0xdf140000  ! 306: LDQF_R	-	[%r16, %r0], %f15
!Illinst store
	.word 0xf8740011  ! 308: STX_R	stx	%r28, [%r16 + %r17]
	.word 0x84040011  ! 310: ADD_R	add 	%r16, %r17, %r2
	.word 0xa6b42a7b  ! 310: ORNcc_I	orncc 	%r16, 0x0a7b, %r19
	.word 0xad342001  ! 310: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0xa8140011  ! 310: OR_R	or 	%r16, %r17, %r20
	.word 0x863c0011  ! 310: XNOR_R	xnor 	%r16, %r17, %r3
thr0_dc_err_25:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_25), 16, 16),1,DC_DATA,53)
	.word 0xc6440000  ! 312: LDSW_R	ldsw	[%r16 + %r0], %r3
	.word 0xdf142010  ! 314: LDQF_I	-	[%r16, 0x0010], %f15
	.word 0xa80428b8  ! 316: ADD_I	add 	%r16, 0x08b8, %r20
	.word 0x9a9c24eb  ! 316: XORcc_I	xorcc 	%r16, 0x04eb, %r13
	.word 0x88bc0011  ! 316: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0x86b40011  ! 316: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0x9e8c28af  ! 316: ANDcc_I	andcc 	%r16, 0x08af, %r15
	.word 0x96940011  ! 316: ORcc_R	orcc 	%r16, %r17, %r11
thr0_dc_err_26:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_26), 16, 16),1,DC_DATA,9)
	.word 0xd6140000  ! 318: LDUH_R	lduh	[%r16 + %r0], %r11
thr0_irf_ce_31:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_31), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xd69c1011  ! 320: LDDA_R	ldda	[%r16, %r17] 0x80, %r11
	.word 0x86842e17  ! 322: ADDcc_I	addcc 	%r16, 0x0e17, %r3
	.word 0x9cb40011  ! 322: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0xac8c2cf5  ! 322: ANDcc_I	andcc 	%r16, 0x0cf5, %r22
	.word 0x829c0011  ! 322: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0xb0140011  ! 322: OR_R	or 	%r16, %r17, %r24
	.word 0x9e142035  ! 322: OR_I	or 	%r16, 0x0035, %r15
	.word 0x941c23d0  ! 322: XOR_I	xor 	%r16, 0x03d0, %r10
	.word 0x9a3c0011  ! 322: XNOR_R	xnor 	%r16, %r17, %r13
thr0_dc_err_27:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_27), 16, 16),1,DC_DATA,25)
	.word 0xdadc1000  ! 324: LDXA_R	ldxa	[%r16, %r0] 0x80, %r13
	.word 0xf19c1011  ! 326: LDDFA_R	ldda	[%r16, %r17], %f24
	.word 0x917c2401  ! 328: MOVR_I	move	%r16, 0xfffffe34, %r8
	.word 0x83341011  ! 328: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x989c0011  ! 328: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x98840011  ! 328: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x96440011  ! 328: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x9d2c2001  ! 328: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x9c8c283f  ! 328: ANDcc_I	andcc 	%r16, 0x083f, %r14
thr0_dc_err_28:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_28), 16, 16),1,DC_DATA,60)
	.word 0xdd941000  ! 330: LDQFA_R	-	[%r16, %r0], %f14
thr0_irf_ce_32:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_32), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf48c1011  ! 332: LDUBA_R	lduba	[%r16, %r17] 0x80, %r26
	.word 0x8c840011  ! 334: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xb33c0011  ! 334: SRA_R	sra 	%r16, %r17, %r25
	.word 0x90bc28f3  ! 334: XNORcc_I	xnorcc 	%r16, 0x08f3, %r8
	.word 0xb88c266b  ! 334: ANDcc_I	andcc 	%r16, 0x066b, %r28
	.word 0x9e940011  ! 334: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x93341011  ! 334: SRLX_R	srlx	%r16, %r17, %r9
thr0_dc_err_29:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_29), 16, 16),1,DC_DATA,46)
	.word 0xd20c0000  ! 336: LDUB_R	ldub	[%r16 + %r0], %r9
thr0_irf_ce_33:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_33), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xd71c0011  ! 338: LDDF_R	ldd	[%r16, %r17], %f11
	.word 0xacac2cb2  ! 340: ANDNcc_I	andncc 	%r16, 0x0cb2, %r22
	.word 0xb7342001  ! 340: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0x9b3c1011  ! 340: SRAX_R	srax	%r16, %r17, %r13
	.word 0x8a14240b  ! 340: OR_I	or 	%r16, 0x040b, %r5
	.word 0x962c0011  ! 340: ANDN_R	andn 	%r16, %r17, %r11
	.word 0x94940011  ! 340: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0xa80c0011  ! 340: AND_R	and 	%r16, %r17, %r20
	.word 0xc2d41011  ! 341: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r1
thr0_irf_ce_34:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_34), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xd6742273  ! 345: STX_I	stx	%r11, [%r16 + 0x0273]
	.word 0xb9643801  ! 347: MOVcc_I	<illegal instruction>
	.word 0x8a2c257b  ! 347: ANDN_I	andn 	%r16, 0x057b, %r5
	.word 0x96c42942  ! 347: ADDCcc_I	addccc 	%r16, 0x0942, %r11
	.word 0xa93c0011  ! 347: SRA_R	sra 	%r16, %r17, %r20
	.word 0xb01c0011  ! 347: XOR_R	xor 	%r16, %r17, %r24
	.word 0x86ac2830  ! 347: ANDNcc_I	andncc 	%r16, 0x0830, %r3
	.word 0xcb042808  ! 348: LDF_I	ld	[%r16, 0x0808], %f5
	.word 0xc20c2520  ! 350: LDUB_I	ldub	[%r16 + 0x0520], %r1
	.word 0xb13c1011  ! 352: SRAX_R	srax	%r16, %r17, %r24
	.word 0xad3c0011  ! 352: SRA_R	sra 	%r16, %r17, %r22
	.word 0x9d3c0011  ! 352: SRA_R	sra 	%r16, %r17, %r14
	.word 0x8b641811  ! 352: MOVcc_R	<illegal instruction>
	.word 0xa8942d2c  ! 352: ORcc_I	orcc 	%r16, 0x0d2c, %r20
	.word 0xf81c0011  ! 353: LDD_R	ldd	[%r16 + %r17], %r28
	.word 0xd1841011  ! 355: LDFA_R	lda	[%r16, %r17], %f8
	.word 0x9f7c2401  ! 357: MOVR_I	move	%r16, 0xfffffe34, %r15
	.word 0x909c262c  ! 357: XORcc_I	xorcc 	%r16, 0x062c, %r8
	.word 0x917c0411  ! 357: MOVR_R	move	%r16, %r17, %r8
	.word 0x862c0011  ! 357: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x837c0411  ! 357: MOVR_R	move	%r16, %r17, %r1
thr0_dc_err_30:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_30), 16, 16),1,DC_DATA,68)
	.word 0xc2c4262c  ! 359: LDSWA_I	ldswa	[%r16, + 0x062c] %asi, %r1
thr0_irf_ce_35:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_35), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xde742d97  ! 363: STX_I	stx	%r15, [%r16 + 0x0d97]
	.word 0x94ac0011  ! 365: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xbb2c1011  ! 365: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x86842982  ! 365: ADDcc_I	addcc 	%r16, 0x0982, %r3
	.word 0x8b340011  ! 365: SRL_R	srl 	%r16, %r17, %r5
	.word 0xb89c20be  ! 365: XORcc_I	xorcc 	%r16, 0x00be, %r28
	.word 0xd31c25ee  ! 366: LDDF_I	ldd	[%r16, 0x05ee], %f9
thr0_irf_ce_36:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_36), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xc4242399  ! 370: STW_I	stw	%r2, [%r16 + 0x0399]
	.word 0x92bc2109  ! 372: XNORcc_I	xnorcc 	%r16, 0x0109, %r9
	.word 0x863c0011  ! 372: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0x857c0411  ! 372: MOVR_R	move	%r16, %r17, %r2
	.word 0x96ac2275  ! 372: ANDNcc_I	andncc 	%r16, 0x0275, %r11
	.word 0xb97c0411  ! 372: MOVR_R	move	%r16, %r17, %r28
	.word 0x9a940011  ! 372: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x98c40011  ! 372: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x9aac2c0b  ! 372: ANDNcc_I	andncc 	%r16, 0x0c0b, %r13
thr0_dc_err_31:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_31), 16, 16),1,DC_DATA,53)
	.word 0xdac41000  ! 374: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r13
	.word 0xd2442e68  ! 376: LDSW_I	ldsw	[%r16 + 0x0e68], %r9
	.word 0x963c2690  ! 378: XNOR_I	xnor 	%r16, 0x0690, %r11
	.word 0x8b343001  ! 378: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0x8f2c1011  ! 378: SLLX_R	sllx	%r16, %r17, %r7
	.word 0x94c420d2  ! 378: ADDCcc_I	addccc 	%r16, 0x00d2, %r10
	.word 0xb3641811  ! 378: MOVcc_R	<illegal instruction>
	.word 0x889c0011  ! 378: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0xdc8c1011  ! 379: LDUBA_R	lduba	[%r16, %r17] 0x80, %r14
thr0_irf_ce_37:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_37), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0xa9341011  ! 383: SRLX_R	srlx	%r16, %r17, %r20
	.word 0x95641811  ! 383: MOVcc_R	<illegal instruction>
	.word 0xac1c214d  ! 383: XOR_I	xor 	%r16, 0x014d, %r22
	.word 0xb4bc0011  ! 383: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0xa9340011  ! 383: SRL_R	srl 	%r16, %r17, %r20
thr0_dc_err_32:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_32), 16, 16),1,DC_DATA,59)
	.word 0xe81c0000  ! 385: LDD_R	ldd	[%r16 + %r0], %r20
!Illinst store
	.word 0xd82c0011  ! 387: STB_R	stb	%r12, [%r16 + %r17]
	.word 0x8204221b  ! 389: ADD_I	add 	%r16, 0x021b, %r1
	.word 0x9e842e90  ! 389: ADDcc_I	addcc 	%r16, 0x0e90, %r15
	.word 0xaa8c0011  ! 389: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0x94bc0011  ! 389: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x9f340011  ! 389: SRL_R	srl 	%r16, %r17, %r15
	.word 0xb2ac2ae6  ! 389: ANDNcc_I	andncc 	%r16, 0x0ae6, %r25
	.word 0xdd1c2fe6  ! 390: LDDF_I	ldd	[%r16, 0x0fe6], %f14
thr0_irf_ce_38:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_38), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
        wr %g0, 0x4, %fprs
	.word 0xa88c0011  ! 394: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0x84c40011  ! 394: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x85343001  ! 394: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0x9eb425a4  ! 394: ORNcc_I	orncc 	%r16, 0x05a4, %r15
	.word 0x9cb40011  ! 394: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x952c3001  ! 394: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x993c0011  ! 394: SRA_R	sra 	%r16, %r17, %r12
	.word 0x828c2c54  ! 394: ANDcc_I	andcc 	%r16, 0x0c54, %r1
thr0_dc_err_33:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_33), 16, 16),1,DC_DATA,47)
	.word 0xc2142c54  ! 396: LDUH_I	lduh	[%r16 + 0x0c54], %r1
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0xb83423bb  ! 400: ORN_I	orn 	%r16, 0x03bb, %r28
	.word 0xae1429df  ! 400: OR_I	or 	%r16, 0x09df, %r23
	.word 0x988c2050  ! 400: ANDcc_I	andcc 	%r16, 0x0050, %r12
	.word 0x942c2507  ! 400: ANDN_I	andn 	%r16, 0x0507, %r10
	.word 0x90b42dbb  ! 400: ORNcc_I	orncc 	%r16, 0x0dbb, %r8
	.word 0xe81c0011  ! 401: LDD_R	ldd	[%r16 + %r17], %r20
thr0_irf_ce_39:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_39), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
        wr %g0, 0x4, %fprs
	.word 0x921424d6  ! 405: OR_I	or 	%r16, 0x04d6, %r9
	.word 0xb62c24f9  ! 405: ANDN_I	andn 	%r16, 0x04f9, %r27
	.word 0xa69c0011  ! 405: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x8b341011  ! 405: SRLX_R	srlx	%r16, %r17, %r5
	.word 0xb2940011  ! 405: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0x82ac2a9c  ! 405: ANDNcc_I	andncc 	%r16, 0x0a9c, %r1
	.word 0xa8b40011  ! 405: ORNcc_R	orncc 	%r16, %r17, %r20
	.word 0xaa840011  ! 405: ADDcc_R	addcc 	%r16, %r17, %r21
thr0_dc_err_34:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_34), 16, 16),1,DC_DATA,12)
	.word 0xea042a9c  ! 407: LDUW_I	lduw	[%r16 + 0x0a9c], %r21
	.word 0xdc5c27cf  ! 409: LDX_I	ldx	[%r16 + 0x07cf], %r14
	.word 0x97343001  ! 411: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0x98140011  ! 411: OR_R	or 	%r16, %r17, %r12
	.word 0x8e840011  ! 411: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x84140011  ! 411: OR_R	or 	%r16, %r17, %r2
	.word 0x94c40011  ! 411: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x9e9c0011  ! 411: XORcc_R	xorcc 	%r16, %r17, %r15
thr0_dc_err_35:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_35), 16, 16),1,DC_DATA,40)
	.word 0xdf140000  ! 413: LDQF_R	-	[%r16, %r0], %f15
thr0_irf_ce_40:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_40), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd0a41011  ! 415: STWA_R	stwa	%r8, [%r16 + %r17] 0x80
	.word 0x8c040011  ! 417: ADD_R	add 	%r16, %r17, %r6
	.word 0x8c3c2df7  ! 417: XNOR_I	xnor 	%r16, 0x0df7, %r6
	.word 0xac8c26b2  ! 417: ANDcc_I	andcc 	%r16, 0x06b2, %r22
	.word 0xb2940011  ! 417: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0x843c204d  ! 417: XNOR_I	xnor 	%r16, 0x004d, %r2
	.word 0x95641811  ! 417: MOVcc_R	<illegal instruction>
thr0_dc_err_36:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_36), 16, 16),1,DC_DATA,64)
	.word 0xd504204d  ! 419: LDF_I	ld	[%r16, 0x004d], %f10
	.word 0xcb1c270d  ! 421: LDDF_I	ldd	[%r16, 0x070d], %f5
	.word 0x997c2401  ! 423: MOVR_I	move	%r16, 0xfffffe34, %r12
	.word 0xb004221c  ! 423: ADD_I	add 	%r16, 0x021c, %r24
	.word 0x88ac206d  ! 423: ANDNcc_I	andncc 	%r16, 0x006d, %r4
	.word 0x9a040011  ! 423: ADD_R	add 	%r16, %r17, %r13
	.word 0x8ac423ac  ! 423: ADDCcc_I	addccc 	%r16, 0x03ac, %r5
	.word 0xbb343001  ! 423: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0x941c0011  ! 423: XOR_R	xor 	%r16, %r17, %r10
	.word 0xdc84293f  ! 424: LDUWA_I	lduwa	[%r16, + 0x093f] %asi, %r14
	.word 0xd1142edd  ! 426: LDQF_I	-	[%r16, 0x0edd], %f8
	.word 0x842c0011  ! 428: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x99341011  ! 428: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x96440011  ! 428: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x961c0011  ! 428: XOR_R	xor 	%r16, %r17, %r11
	.word 0x8894214c  ! 428: ORcc_I	orcc 	%r16, 0x014c, %r4
	.word 0xb6440011  ! 428: ADDC_R	addc 	%r16, %r17, %r27
	.word 0xea4c2cef  ! 429: LDSB_I	ldsb	[%r16 + 0x0cef], %r21
thr0_irf_ce_41:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_41), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xd9142764  ! 431: LDQF_I	-	[%r16, 0x0764], %f12
	.word 0xb1341011  ! 433: SRLX_R	srlx	%r16, %r17, %r24
	.word 0x83643801  ! 433: MOVcc_I	<illegal instruction>
	.word 0x9044213b  ! 433: ADDC_I	addc 	%r16, 0x013b, %r8
	.word 0x9d2c1011  ! 433: SLLX_R	sllx	%r16, %r17, %r14
	.word 0xac8c2cd3  ! 433: ANDcc_I	andcc 	%r16, 0x0cd3, %r22
	.word 0x98b40011  ! 433: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x8cc40011  ! 433: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x9b643801  ! 433: MOVcc_I	<illegal instruction>
	.word 0xe8d41011  ! 434: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r20
thr0_irf_ce_42:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_42), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xd3140011  ! 436: LDQF_R	-	[%r16, %r17], %f9
	.word 0xaeac0011  ! 438: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0xac0425cc  ! 438: ADD_I	add 	%r16, 0x05cc, %r22
	.word 0x829425a5  ! 438: ORcc_I	orcc 	%r16, 0x05a5, %r1
	.word 0x9ac42449  ! 438: ADDCcc_I	addccc 	%r16, 0x0449, %r13
	.word 0x969c0011  ! 438: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0xb09c2796  ! 438: XORcc_I	xorcc 	%r16, 0x0796, %r24
	.word 0xae1c0011  ! 438: XOR_R	xor 	%r16, %r17, %r23
	.word 0xec941011  ! 439: LDUHA_R	lduha	[%r16, %r17] 0x80, %r22
	.word 0xb84c2e11  ! 441: MULX_I	mulx 	%r16, 0x0e11, %r28
	.word 0x9abc266f  ! 443: XNORcc_I	xnorcc 	%r16, 0x066f, %r13
	.word 0x98ac2952  ! 443: ANDNcc_I	andncc 	%r16, 0x0952, %r12
	.word 0x98342249  ! 443: ORN_I	orn 	%r16, 0x0249, %r12
	.word 0xba9c2279  ! 443: XORcc_I	xorcc 	%r16, 0x0279, %r29
	.word 0x8cac27b2  ! 443: ANDNcc_I	andncc 	%r16, 0x07b2, %r6
	.word 0x8c0c2391  ! 443: AND_I	and 	%r16, 0x0391, %r6
	.word 0xb8440011  ! 443: ADDC_R	addc 	%r16, %r17, %r28
thr0_dc_err_37:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_37), 16, 16),1,DC_DATA,46)
	.word 0xf81c2391  ! 445: LDD_I	ldd	[%r16 + 0x0391], %r28
	.word 0xd31c24de  ! 447: LDDF_I	ldd	[%r16, 0x04de], %f9
	.word 0x84bc0011  ! 449: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x9e9c0011  ! 449: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x8cb40011  ! 449: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x9e9c0011  ! 449: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x843c2ecd  ! 449: XNOR_I	xnor 	%r16, 0x0ecd, %r2
	.word 0xacac2501  ! 449: ANDNcc_I	andncc 	%r16, 0x0501, %r22
thr0_dc_err_38:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_38), 16, 16),1,DC_DATA,29)
	.word 0xec5c0000  ! 451: LDX_R	ldx	[%r16 + %r0], %r22
	.word 0xc88c1011  ! 453: LDUBA_R	lduba	[%r16, %r17] 0x80, %r4
	.word 0x9894216e  ! 455: ORcc_I	orcc 	%r16, 0x016e, %r12
	.word 0xaa0c0011  ! 455: AND_R	and 	%r16, %r17, %r21
	.word 0x864424b2  ! 455: ADDC_I	addc 	%r16, 0x04b2, %r3
	.word 0xb0ac0011  ! 455: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0x9884278d  ! 455: ADDcc_I	addcc 	%r16, 0x078d, %r12
	.word 0x88b40011  ! 455: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0xca5c0011  ! 456: LDX_R	ldx	[%r16 + %r17], %r5
thr0_irf_ce_43:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_43), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xcf1c2bf7  ! 458: LDDF_I	ldd	[%r16, 0x0bf7], %f7
	.word 0x84942336  ! 460: ORcc_I	orcc 	%r16, 0x0336, %r2
	.word 0x948c20d1  ! 460: ANDcc_I	andcc 	%r16, 0x00d1, %r10
	.word 0x8e0c0011  ! 460: AND_R	and 	%r16, %r17, %r7
	.word 0xab3c2001  ! 460: SRA_I	sra 	%r16, 0x0001, %r21
	.word 0x95340011  ! 460: SRL_R	srl 	%r16, %r17, %r10
	.word 0x9aac0011  ! 460: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x972c1011  ! 460: SLLX_R	sllx	%r16, %r17, %r11
	.word 0xd1841011  ! 461: LDFA_R	lda	[%r16, %r17], %f8
thr0_irf_ce_44:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_44), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0x88940011  ! 465: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0xb32c3001  ! 465: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0x8e142c62  ! 465: OR_I	or 	%r16, 0x0c62, %r7
	.word 0x828c2ac2  ! 465: ANDcc_I	andcc 	%r16, 0x0ac2, %r1
	.word 0x8cb40011  ! 465: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x9c0c0011  ! 466: AND_R	and 	%r16, %r17, %r14
	.word 0x88940011  ! 466: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x983c293e  ! 466: XNOR_I	xnor 	%r16, 0x093e, %r12
	.word 0x8cac25fe  ! 466: ANDNcc_I	andncc 	%r16, 0x05fe, %r6
	.word 0x84bc0011  ! 466: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x8f3c2001  ! 466: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x88842e32  ! 466: ADDcc_I	addcc 	%r16, 0x0e32, %r4
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xc7941011  ! 466: LDQFA_R	-	[%r16, %r17], %f3
thr0_irf_ce_45:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_45), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0x8c842e67  ! 469: ADDcc_I	addcc 	%r16, 0x0e67, %r6
	.word 0x9ac40011  ! 469: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xa6140011  ! 469: OR_R	or 	%r16, %r17, %r19
	.word 0xb29c2444  ! 469: XORcc_I	xorcc 	%r16, 0x0444, %r25
	.word 0x94942c3b  ! 469: ORcc_I	orcc 	%r16, 0x0c3b, %r10
	.word 0x9c2c0011  ! 469: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x8eb42b0e  ! 469: ORNcc_I	orncc 	%r16, 0x0b0e, %r7
	.word 0x98342560  ! 469: ORN_I	orn 	%r16, 0x0560, %r12
thr0_dc_err_39:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_39), 16, 16),1,DC_DATA,28)
	.word 0xd81c2560  ! 471: LDD_I	ldd	[%r16 + 0x0560], %r12
thr0_irf_ce_46:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_46), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xec04200e  ! 473: LDUW_I	lduw	[%r16 + 0x000e], %r22
	.word 0x8b2c2001  ! 475: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x941c0011  ! 475: XOR_R	xor 	%r16, %r17, %r10
	.word 0x99643801  ! 475: MOVcc_I	<illegal instruction>
	.word 0x862c0011  ! 475: ANDN_R	andn 	%r16, %r17, %r3
	.word 0xad341011  ! 475: SRLX_R	srlx	%r16, %r17, %r22
thr0_dc_err_40:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_40), 16, 16),1,DC_DATA,36)
	.word 0xec0c200e  ! 477: LDUB_I	ldub	[%r16 + 0x000e], %r22
!Illinst alu
	.word 0x82a40011  ! 479: SUBcc_R	subcc 	%r16, %r17, %r1
	.word 0x8f341011  ! 481: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x98340011  ! 481: ORN_R	orn 	%r16, %r17, %r12
	.word 0x83641811  ! 481: MOVcc_R	<illegal instruction>
	.word 0xa83c0011  ! 481: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0xaec429bd  ! 481: ADDCcc_I	addccc 	%r16, 0x09bd, %r23
	.word 0xb61c251e  ! 481: XOR_I	xor 	%r16, 0x051e, %r27
	.word 0x86c40011  ! 481: ADDCcc_R	addccc 	%r16, %r17, %r3
thr0_dc_err_41:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_41), 16, 16),1,DC_DATA,61)
	.word 0xc68c1000  ! 483: LDUBA_R	lduba	[%r16, %r0] 0x80, %r3
thr0_irf_ce_47:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_47), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xc674296d  ! 487: STX_I	stx	%r3, [%r16 + 0x096d]
	.word 0x832c3001  ! 489: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x9f341011  ! 489: SRLX_R	srlx	%r16, %r17, %r15
	.word 0x9c440011  ! 489: ADDC_R	addc 	%r16, %r17, %r14
	.word 0x960c0011  ! 489: AND_R	and 	%r16, %r17, %r11
	.word 0xab343001  ! 489: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0x9f3c0011  ! 489: SRA_R	sra 	%r16, %r17, %r15
	.word 0x9f641811  ! 489: MOVcc_R	<illegal instruction>
	.word 0x9b2c2001  ! 489: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0xf01c0011  ! 490: LDD_R	ldd	[%r16 + %r17], %r24
thr0_irf_ce_48:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_48), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	wr      %r0, 0x5, %asr26
	.word 0x892c1011  ! 494: SLLX_R	sllx	%r16, %r17, %r4
	.word 0x9cb40011  ! 494: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x908424fe  ! 494: ADDcc_I	addcc 	%r16, 0x04fe, %r8
	.word 0x90840011  ! 494: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0xac142838  ! 494: OR_I	or 	%r16, 0x0838, %r22
	.word 0xb8c40011  ! 494: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0x94b427d8  ! 494: ORNcc_I	orncc 	%r16, 0x07d8, %r10
	.word 0x98842658  ! 494: ADDcc_I	addcc 	%r16, 0x0658, %r12
thr0_dc_err_42:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_42), 16, 16),1,DC_DATA,14)
	.word 0xd91c0000  ! 496: LDDF_R	ldd	[%r16, %r0], %f12
thr0_irf_ce_49:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_49), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0x81dc27d1  ! 498: FLUSH_I	flush
	.word 0x8e342e6f  ! 500: ORN_I	orn 	%r16, 0x0e6f, %r7
	.word 0x840c0011  ! 500: AND_R	and 	%r16, %r17, %r2
	.word 0x88ac0011  ! 500: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0xb2840011  ! 500: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0xab2c3001  ! 500: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x862c2a18  ! 500: ANDN_I	andn 	%r16, 0x0a18, %r3
	.word 0xdac41011  ! 501: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r13
	.word 0xd39c1011  ! 503: LDDFA_R	ldda	[%r16, %r17], %f9
	.word 0xba040011  ! 505: ADD_R	add 	%r16, %r17, %r29
	.word 0xaaac2426  ! 505: ANDNcc_I	andncc 	%r16, 0x0426, %r21
	.word 0x8e840011  ! 505: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0xba0c0011  ! 505: AND_R	and 	%r16, %r17, %r29
	.word 0xb89c0011  ! 505: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0xaf2c3001  ! 505: SLLX_I	sllx	%r16, 0x0001, %r23
	.word 0xc6941011  ! 506: LDUHA_R	lduha	[%r16, %r17] 0x80, %r3
thr0_irf_ce_50:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_50), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xc9042fa5  ! 508: LDF_I	ld	[%r16, 0x0fa5], %f4
	.word 0x86c42d4b  ! 510: ADDCcc_I	addccc 	%r16, 0x0d4b, %r3
	.word 0x9c1c2061  ! 510: XOR_I	xor 	%r16, 0x0061, %r14
	.word 0xa61428e6  ! 510: OR_I	or 	%r16, 0x08e6, %r19
	.word 0x85342001  ! 510: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0xbb341011  ! 510: SRLX_R	srlx	%r16, %r17, %r29
	.word 0x917c0411  ! 510: MOVR_R	move	%r16, %r17, %r8
thr0_dc_err_43:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_43), 16, 16),1,DC_DATA,61)
	.word 0xd0c428e6  ! 512: LDSWA_I	ldswa	[%r16, + 0x08e6] %asi, %r8
thr0_irf_ce_51:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_51), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xd8dc27e5  ! 514: LDXA_I	ldxa	[%r16, + 0x07e5] %asi, %r12
	.word 0x8c8c2204  ! 516: ANDcc_I	andcc 	%r16, 0x0204, %r6
	.word 0x972c1011  ! 516: SLLX_R	sllx	%r16, %r17, %r11
	.word 0x99340011  ! 516: SRL_R	srl 	%r16, %r17, %r12
	.word 0x9a0c275a  ! 516: AND_I	and 	%r16, 0x075a, %r13
	.word 0x82bc2be1  ! 516: XNORcc_I	xnorcc 	%r16, 0x0be1, %r1
	.word 0x92040011  ! 516: ADD_R	add 	%r16, %r17, %r9
	.word 0xb4340011  ! 516: ORN_R	orn 	%r16, %r17, %r26
	.word 0xcb9c1011  ! 517: LDDFA_R	ldda	[%r16, %r17], %f5
	.word 0xf29c1011  ! 519: LDDA_R	ldda	[%r16, %r17] 0x80, %r25
	.word 0x821c292d  ! 521: XOR_I	xor 	%r16, 0x092d, %r1
	.word 0x8d3c2001  ! 521: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0x8c140011  ! 521: OR_R	or 	%r16, %r17, %r6
	.word 0x893c2001  ! 521: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0x90b42bd4  ! 521: ORNcc_I	orncc 	%r16, 0x0bd4, %r8
	.word 0x8b641811  ! 521: MOVcc_R	<illegal instruction>
	.word 0xd84c2853  ! 522: LDSB_I	ldsb	[%r16 + 0x0853], %r12
	.word 0xd8d41011  ! 524: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r12
	.word 0x8c940011  ! 526: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0xab341011  ! 526: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x9a140011  ! 526: OR_R	or 	%r16, %r17, %r13
	.word 0x8a2c2f89  ! 526: ANDN_I	andn 	%r16, 0x0f89, %r5
	.word 0x99643801  ! 526: MOVcc_I	<illegal instruction>
	.word 0x90b423e1  ! 526: ORNcc_I	orncc 	%r16, 0x03e1, %r8
	.word 0xd28c1011  ! 527: LDUBA_R	lduba	[%r16, %r17] 0x80, %r9
thr0_irf_ce_52:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_52), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xc4c41011  ! 529: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r2
	.word 0xb0842fa8  ! 531: ADDcc_I	addcc 	%r16, 0x0fa8, %r24
	.word 0x9c2c0011  ! 531: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x840c0011  ! 531: AND_R	and 	%r16, %r17, %r2
	.word 0x941c0011  ! 531: XOR_R	xor 	%r16, %r17, %r10
	.word 0x98c42fa2  ! 531: ADDCcc_I	addccc 	%r16, 0x0fa2, %r12
thr0_dc_err_44:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_44), 16, 16),1,DC_DATA,57)
	.word 0xd8841000  ! 533: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r12
thr0_irf_ce_53:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_53), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xee0c21e0  ! 535: LDUB_I	ldub	[%r16 + 0x01e0], %r23
	.word 0x892c0011  ! 537: SLL_R	sll 	%r16, %r17, %r4
	.word 0x962c27ad  ! 537: ANDN_I	andn 	%r16, 0x07ad, %r11
	.word 0xa62c0011  ! 537: ANDN_R	andn 	%r16, %r17, %r19
	.word 0x828c2173  ! 537: ANDcc_I	andcc 	%r16, 0x0173, %r1
	.word 0x92ac2166  ! 537: ANDNcc_I	andncc 	%r16, 0x0166, %r9
	.word 0x881c2f4d  ! 537: XOR_I	xor 	%r16, 0x0f4d, %r4
	.word 0xb4c40011  ! 537: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0x8434213b  ! 537: ORN_I	orn 	%r16, 0x013b, %r2
	.word 0xd7040011  ! 538: LDF_R	ld	[%r16, %r17], %f11
!Illinst store
	.word 0xda240011  ! 540: STW_R	stw	%r13, [%r16 + %r17]
	.word 0x8b643801  ! 542: MOVcc_I	<illegal instruction>
	.word 0x8d2c2001  ! 542: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0x853c1011  ! 542: SRAX_R	srax	%r16, %r17, %r2
	.word 0x9ebc2417  ! 542: XNORcc_I	xnorcc 	%r16, 0x0417, %r15
	.word 0xac140011  ! 542: OR_R	or 	%r16, %r17, %r22
	.word 0xb61c2bfe  ! 542: XOR_I	xor 	%r16, 0x0bfe, %r27
	.word 0xaa140011  ! 542: OR_R	or 	%r16, %r17, %r21
	.word 0xd0040011  ! 543: LDUW_R	lduw	[%r16 + %r17], %r8
thr0_irf_ce_54:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_54), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xcc8c1011  ! 545: LDUBA_R	lduba	[%r16, %r17] 0x80, %r6
	.word 0xb7343001  ! 547: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0x888c24e0  ! 547: ANDcc_I	andcc 	%r16, 0x04e0, %r4
	.word 0xb4c425a3  ! 547: ADDCcc_I	addccc 	%r16, 0x05a3, %r26
	.word 0x88b4269a  ! 547: ORNcc_I	orncc 	%r16, 0x069a, %r4
	.word 0x860c0011  ! 547: AND_R	and 	%r16, %r17, %r3
	.word 0x889c0011  ! 547: XORcc_R	xorcc 	%r16, %r17, %r4
thr0_dc_err_45:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_45), 16, 16),1,DC_DATA,30)
	.word 0xc80c269a  ! 549: LDUB_I	ldub	[%r16 + 0x069a], %r4
	.word 0xc30426a5  ! 551: LDF_I	ld	[%r16, 0x06a5], %f1
	.word 0x872c2001  ! 553: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x8e1c217d  ! 553: XOR_I	xor 	%r16, 0x017d, %r7
	.word 0x83641811  ! 553: MOVcc_R	<illegal instruction>
	.word 0x94c40011  ! 553: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x90b40011  ! 553: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0xb49426e4  ! 553: ORcc_I	orcc 	%r16, 0x06e4, %r26
thr0_dc_err_46:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_46), 16, 16),1,DC_DATA,63)
	.word 0xf41c26e4  ! 555: LDD_I	ldd	[%r16 + 0x06e4], %r26
thr0_irf_ce_55:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_55), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xd8dc1011  ! 557: LDXA_R	ldxa	[%r16, %r17] 0x80, %r12
	.word 0x9c340011  ! 559: ORN_R	orn 	%r16, %r17, %r14
	.word 0xb4840011  ! 559: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0x889c2130  ! 559: XORcc_I	xorcc 	%r16, 0x0130, %r4
	.word 0xaa440011  ! 559: ADDC_R	addc 	%r16, %r17, %r21
	.word 0x8a0c0011  ! 559: AND_R	and 	%r16, %r17, %r5
	.word 0x903c0011  ! 559: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x9c1c2a78  ! 559: XOR_I	xor 	%r16, 0x0a78, %r14
thr0_dc_err_47:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_47), 16, 16),1,DC_DATA,62)
	.word 0xdc440000  ! 561: LDSW_R	ldsw	[%r16 + %r0], %r14
thr0_irf_ce_56:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_56), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xf2c41011  ! 563: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r25
	.word 0x980421d1  ! 565: ADD_I	add 	%r16, 0x01d1, %r12
	.word 0xb4b4240c  ! 565: ORNcc_I	orncc 	%r16, 0x040c, %r26
	.word 0x933c2001  ! 565: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x9e2c0011  ! 565: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x920c0011  ! 565: AND_R	and 	%r16, %r17, %r9
	.word 0x962c299e  ! 565: ANDN_I	andn 	%r16, 0x099e, %r11
	.word 0xa80c2d25  ! 565: AND_I	and 	%r16, 0x0d25, %r20
	.word 0xd59c1011  ! 566: LDDFA_R	ldda	[%r16, %r17], %f10
	.word 0xfb142d08  ! 568: LDQF_I	-	[%r16, 0x0d08], %f29
	.word 0x917c0411  ! 570: MOVR_R	move	%r16, %r17, %r8
	.word 0x8ac40011  ! 570: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0xae140011  ! 570: OR_R	or 	%r16, %r17, %r23
	.word 0x92c40011  ! 570: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x98940011  ! 570: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0xbac40011  ! 570: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0x923c2f0a  ! 570: XNOR_I	xnor 	%r16, 0x0f0a, %r9
	.word 0xab3c0011  ! 570: SRA_R	sra 	%r16, %r17, %r21
	.word 0xc5841011  ! 571: LDFA_R	lda	[%r16, %r17], %f2
thr0_irf_ce_57:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_57), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xf21c28ad  ! 573: LDD_I	ldd	[%r16 + 0x08ad], %r25
	.word 0x82c40011  ! 575: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x933c2001  ! 575: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x8c3c0011  ! 575: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0xb73c1011  ! 575: SRAX_R	srax	%r16, %r17, %r27
	.word 0x98942135  ! 575: ORcc_I	orcc 	%r16, 0x0135, %r12
	.word 0x91340011  ! 575: SRL_R	srl 	%r16, %r17, %r8
	.word 0x92b42d8e  ! 575: ORNcc_I	orncc 	%r16, 0x0d8e, %r9
	.word 0xeb941011  ! 576: LDQFA_R	-	[%r16, %r17], %f21
thr0_irf_ce_58:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_58), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xfacc1011  ! 578: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r29
	.word 0xa83c2ef8  ! 580: XNOR_I	xnor 	%r16, 0x0ef8, %r20
	.word 0x969c2747  ! 580: XORcc_I	xorcc 	%r16, 0x0747, %r11
	.word 0xa8ac2dbc  ! 580: ANDNcc_I	andncc 	%r16, 0x0dbc, %r20
	.word 0xa644225e  ! 580: ADDC_I	addc 	%r16, 0x025e, %r19
	.word 0x8e942649  ! 580: ORcc_I	orcc 	%r16, 0x0649, %r7
	.word 0x94c40011  ! 580: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x9c342025  ! 580: ORN_I	orn 	%r16, 0x0025, %r14
	.word 0xec1c0011  ! 581: LDD_R	ldd	[%r16 + %r17], %r22
	.word 0xcb1c0011  ! 583: LDDF_R	ldd	[%r16, %r17], %f5
	.word 0x922c2e4d  ! 585: ANDN_I	andn 	%r16, 0x0e4d, %r9
	.word 0x893c1011  ! 585: SRAX_R	srax	%r16, %r17, %r4
	.word 0x977c2401  ! 585: MOVR_I	move	%r16, 0xfffffe34, %r11
	.word 0xb53c0011  ! 585: SRA_R	sra 	%r16, %r17, %r26
	.word 0xb32c3001  ! 585: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0x99341011  ! 585: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x9b3c1011  ! 585: SRAX_R	srax	%r16, %r17, %r13
thr0_dc_err_48:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_48), 16, 16),1,DC_DATA,22)
	.word 0xda1c2e4d  ! 587: LDD_I	ldd	[%r16 + 0x0e4d], %r13
thr0_irf_ce_59:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_59), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xc25427c1  ! 589: LDSH_I	ldsh	[%r16 + 0x07c1], %r1
	.word 0x9ac40011  ! 591: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xaa8c29bb  ! 591: ANDcc_I	andcc 	%r16, 0x09bb, %r21
	.word 0x84040011  ! 591: ADD_R	add 	%r16, %r17, %r2
	.word 0x9b3c2001  ! 591: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x8f2c3001  ! 591: SLLX_I	sllx	%r16, 0x0001, %r7
thr0_dc_err_49:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_49), 16, 16),1,DC_DATA,55)
	.word 0xcf841000  ! 593: LDFA_R	lda	[%r16, %r0], %f7
	.word 0xf24428c2  ! 595: LDSW_I	ldsw	[%r16 + 0x08c2], %r25
	.word 0x900c24b1  ! 597: AND_I	and 	%r16, 0x04b1, %r8
	.word 0xbb7c0411  ! 597: MOVR_R	move	%r16, %r17, %r29
	.word 0xa6940011  ! 597: ORcc_R	orcc 	%r16, %r17, %r19
	.word 0x963c0011  ! 597: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x960429b6  ! 597: ADD_I	add 	%r16, 0x09b6, %r11
	.word 0xdf140011  ! 598: LDQF_R	-	[%r16, %r17], %f15
	.word 0x81880000  ! 600: SAVED	saved
	.word 0xb5343001  ! 602: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0xab643801  ! 602: MOVcc_I	<illegal instruction>
	.word 0xae8c2480  ! 602: ANDcc_I	andcc 	%r16, 0x0480, %r23
	.word 0x9c1c2a1a  ! 602: XOR_I	xor 	%r16, 0x0a1a, %r14
	.word 0xae2c0011  ! 602: ANDN_R	andn 	%r16, %r17, %r23
	.word 0x849423de  ! 602: ORcc_I	orcc 	%r16, 0x03de, %r2
	.word 0x94c42ae6  ! 602: ADDCcc_I	addccc 	%r16, 0x0ae6, %r10
	.word 0xb7643801  ! 602: MOVcc_I	<illegal instruction>
	.word 0xd65c0011  ! 603: LDX_R	ldx	[%r16 + %r17], %r11
thr0_irf_ce_60:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_60), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xf0242a21  ! 607: STW_I	stw	%r24, [%r16 + 0x0a21]
	.word 0xb73c1011  ! 609: SRAX_R	srax	%r16, %r17, %r27
	.word 0x912c3001  ! 609: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x889c0011  ! 609: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0xb2b42747  ! 609: ORNcc_I	orncc 	%r16, 0x0747, %r25
	.word 0xaf2c0011  ! 609: SLL_R	sll 	%r16, %r17, %r23
	.word 0x8a3c0011  ! 609: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xd79c1011  ! 610: LDDFA_R	ldda	[%r16, %r17], %f11
	.word 0xd81c2782  ! 612: LDD_I	ldd	[%r16 + 0x0782], %r12
	.word 0x8c0c0011  ! 614: AND_R	and 	%r16, %r17, %r6
	.word 0xae442b73  ! 614: ADDC_I	addc 	%r16, 0x0b73, %r23
	.word 0x9c840011  ! 614: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0x828c2a12  ! 614: ANDcc_I	andcc 	%r16, 0x0a12, %r1
	.word 0x9f341011  ! 614: SRLX_R	srlx	%r16, %r17, %r15
	.word 0xdd941011  ! 615: LDQFA_R	-	[%r16, %r17], %f14
thr0_irf_ce_61:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_61), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xcc1c2cdd  ! 617: LDD_I	ldd	[%r16 + 0x0cdd], %r6
	.word 0xaa140011  ! 619: OR_R	or 	%r16, %r17, %r21
	.word 0x82b42989  ! 619: ORNcc_I	orncc 	%r16, 0x0989, %r1
	.word 0xb93c0011  ! 619: SRA_R	sra 	%r16, %r17, %r28
	.word 0x91340011  ! 619: SRL_R	srl 	%r16, %r17, %r8
	.word 0x92840011  ! 619: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0xc4dc2989  ! 620: LDXA_I	ldxa	[%r16, + 0x0989] %asi, %r2
thr0_resum_intr_1502:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1502), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x91343001  ! 624: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0xad343001  ! 624: SRLX_I	srlx	%r16, 0x0001, %r22
	.word 0xae0c2606  ! 624: AND_I	and 	%r16, 0x0606, %r23
	.word 0x929c2774  ! 624: XORcc_I	xorcc 	%r16, 0x0774, %r9
	.word 0x9c9c24d4  ! 624: XORcc_I	xorcc 	%r16, 0x04d4, %r14
thr0_dc_err_50:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_50), 16, 16),1,DC_DATA,46)
	.word 0xdc8424d4  ! 626: LDUWA_I	lduwa	[%r16, + 0x04d4] %asi, %r14
thr0_irf_ce_62:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_62), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xde442132  ! 628: LDSW_I	ldsw	[%r16 + 0x0132], %r15
	.word 0x960423c4  ! 630: ADD_I	add 	%r16, 0x03c4, %r11
	.word 0x8d340011  ! 630: SRL_R	srl 	%r16, %r17, %r6
	.word 0x992c2001  ! 630: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x9f342001  ! 630: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xa8940011  ! 630: ORcc_R	orcc 	%r16, %r17, %r20
	.word 0x8b342001  ! 630: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x8d7c0411  ! 630: MOVR_R	move	%r16, %r17, %r6
	.word 0xa64421cf  ! 630: ADDC_I	addc 	%r16, 0x01cf, %r19
	.word 0xed140011  ! 631: LDQF_R	-	[%r16, %r17], %f22
thr0_irf_ce_63:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_63), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xd63427c6  ! 635: STH_I	sth	%r11, [%r16 + 0x07c6]
	.word 0x9f3c1011  ! 637: SRAX_R	srax	%r16, %r17, %r15
	.word 0x90bc2345  ! 637: XNORcc_I	xnorcc 	%r16, 0x0345, %r8
	.word 0xb21c0011  ! 637: XOR_R	xor 	%r16, %r17, %r25
	.word 0x872c2001  ! 637: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x933c2001  ! 637: SRA_I	sra 	%r16, 0x0001, %r9
thr0_dc_err_51:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_51), 16, 16),1,DC_DATA,33)
	.word 0xd28c1000  ! 639: LDUBA_R	lduba	[%r16, %r0] 0x80, %r9
thr0_irf_ce_64:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_64), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xc83424e7  ! 643: STH_I	sth	%r4, [%r16 + 0x04e7]
	.word 0xb8940011  ! 645: ORcc_R	orcc 	%r16, %r17, %r28
	.word 0x8f643801  ! 645: MOVcc_I	<illegal instruction>
	.word 0xa92c1011  ! 645: SLLX_R	sllx	%r16, %r17, %r20
	.word 0xb88c0011  ! 645: ANDcc_R	andcc 	%r16, %r17, %r28
	.word 0xbac40011  ! 645: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0x84042653  ! 645: ADD_I	add 	%r16, 0x0653, %r2
	.word 0xb2ac2bf2  ! 645: ANDNcc_I	andncc 	%r16, 0x0bf2, %r25
	.word 0xb3343001  ! 645: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xc3142d9b  ! 646: LDQF_I	-	[%r16, 0x0d9b], %f1
thr0_irf_ce_65:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_65), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xfa1c261b  ! 648: LDD_I	ldd	[%r16 + 0x061b], %r29
	.word 0x8ebc0011  ! 650: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0xb7343001  ! 650: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0x9ec40011  ! 650: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x8abc0011  ! 650: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0xb93c1011  ! 650: SRAX_R	srax	%r16, %r17, %r28
thr0_dc_err_52:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_52), 16, 16),1,DC_DATA,42)
	.word 0xf884261b  ! 652: LDUWA_I	lduwa	[%r16, + 0x061b] %asi, %r28
thr0_irf_ce_66:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_66), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xd1040011  ! 654: LDF_R	ld	[%r16, %r17], %f8
	.word 0x868c0011  ! 656: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xad641811  ! 656: MOVcc_R	<illegal instruction>
	.word 0xad2c0011  ! 656: SLL_R	sll 	%r16, %r17, %r22
	.word 0xb4bc0011  ! 656: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0x8f2c1011  ! 656: SLLX_R	sllx	%r16, %r17, %r7
	.word 0xaf643801  ! 656: MOVcc_I	<illegal instruction>
thr0_dc_err_53:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_53), 16, 16),1,DC_DATA,53)
	.word 0xee1c261b  ! 658: LDD_I	ldd	[%r16 + 0x061b], %r23
	.word 0xc4c4290e  ! 660: LDSWA_I	ldswa	[%r16, + 0x090e] %asi, %r2
	.word 0x84940011  ! 662: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x9f7c0411  ! 662: MOVR_R	move	%r16, %r17, %r15
	.word 0x99643801  ! 662: MOVcc_I	<illegal instruction>
	.word 0x86ac0011  ! 662: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0x900c2462  ! 662: AND_I	and 	%r16, 0x0462, %r8
	.word 0xea0c0011  ! 663: LDUB_R	ldub	[%r16 + %r17], %r21
	.word 0xdf140011  ! 665: LDQF_R	-	[%r16, %r17], %f15
	.word 0x93641811  ! 667: MOVcc_R	<illegal instruction>
	.word 0x908c2988  ! 667: ANDcc_I	andcc 	%r16, 0x0988, %r8
	.word 0x8f343001  ! 667: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0xa72c3001  ! 667: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0x820c288d  ! 667: AND_I	and 	%r16, 0x088d, %r1
	.word 0x9494231c  ! 667: ORcc_I	orcc 	%r16, 0x031c, %r10
	.word 0xb8340011  ! 667: ORN_R	orn 	%r16, %r17, %r28
	.word 0x902c0011  ! 667: ANDN_R	andn 	%r16, %r17, %r8
	.word 0xd09c25e5  ! 668: LDDA_I	ldda	[%r16, + 0x05e5] %asi, %r8
thr0_irf_ce_67:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_67), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xf2140011  ! 670: LDUH_R	lduh	[%r16 + %r17], %r25
	.word 0x943c2400  ! 672: XNOR_I	xnor 	%r16, 0x0400, %r10
	.word 0x8b3c0011  ! 672: SRA_R	sra 	%r16, %r17, %r5
	.word 0x917c0411  ! 672: MOVR_R	move	%r16, %r17, %r8
	.word 0x852c1011  ! 672: SLLX_R	sllx	%r16, %r17, %r2
	.word 0xa6042dc1  ! 672: ADD_I	add 	%r16, 0x0dc1, %r19
	.word 0xa89424f6  ! 672: ORcc_I	orcc 	%r16, 0x04f6, %r20
thr0_dc_err_54:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_54), 16, 16),1,DC_DATA,58)
	.word 0xe90424f6  ! 674: LDF_I	ld	[%r16, 0x04f6], %f20
	.word 0xc3ec1011  ! 676: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x9d2c3001  ! 678: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0xa92c0011  ! 678: SLL_R	sll 	%r16, %r17, %r20
	.word 0x821c22ab  ! 678: XOR_I	xor 	%r16, 0x02ab, %r1
	.word 0x82ac0011  ! 678: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0xba3c2a86  ! 678: XNOR_I	xnor 	%r16, 0x0a86, %r29
thr0_dc_err_55:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_55), 16, 16),1,DC_DATA,60)
	.word 0xfadc1000  ! 680: LDXA_R	ldxa	[%r16, %r0] 0x80, %r29
	.word 0xc8cc2b02  ! 682: LDSBA_I	ldsba	[%r16, + 0x0b02] %asi, %r4
	.word 0x8f2c0011  ! 684: SLL_R	sll 	%r16, %r17, %r7
	.word 0x96c40011  ! 684: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0xb2b40011  ! 684: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0x8f343001  ! 684: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x96940011  ! 684: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0x861c2130  ! 684: XOR_I	xor 	%r16, 0x0130, %r3
thr0_dc_err_56:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_56), 16, 16),1,DC_DATA,30)
	.word 0xc6442130  ! 686: LDSW_I	ldsw	[%r16 + 0x0130], %r3
thr0_irf_ce_68:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_68), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xc61c2af1  ! 688: LDD_I	ldd	[%r16 + 0x0af1], %r3
	.word 0x9e3c0011  ! 690: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0xb12c1011  ! 690: SLLX_R	sllx	%r16, %r17, %r24
	.word 0x82b42b20  ! 690: ORNcc_I	orncc 	%r16, 0x0b20, %r1
	.word 0x8c0c0011  ! 690: AND_R	and 	%r16, %r17, %r6
	.word 0xb32c0011  ! 690: SLL_R	sll 	%r16, %r17, %r25
	.word 0x8c34287b  ! 690: ORN_I	orn 	%r16, 0x087b, %r6
thr0_dc_err_57:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_57), 16, 16),1,DC_DATA,18)
	.word 0xcc5c287b  ! 692: LDX_I	ldx	[%r16 + 0x087b], %r6
thr0_irf_ce_69:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_69), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xe87c0011  ! 694: SWAP_R	swap	%r20, [%r16 + %r17]
	.word 0xb52c3001  ! 696: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xb0c42672  ! 696: ADDCcc_I	addccc 	%r16, 0x0672, %r24
	.word 0x96340011  ! 696: ORN_R	orn 	%r16, %r17, %r11
	.word 0x832c3001  ! 696: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0xa88c2b25  ! 696: ANDcc_I	andcc 	%r16, 0x0b25, %r20
	.word 0xb03c202f  ! 696: XNOR_I	xnor 	%r16, 0x002f, %r24
thr0_dc_err_58:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_58), 16, 16),1,DC_DATA,56)
	.word 0xf00c0000  ! 698: LDUB_R	ldub	[%r16 + %r0], %r24
thr0_irf_ce_70:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_70), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xcb1c0011  ! 700: LDDF_R	ldd	[%r16, %r17], %f5
	.word 0x9cac0011  ! 702: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0xb33c0011  ! 702: SRA_R	sra 	%r16, %r17, %r25
	.word 0x8a940011  ! 702: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0xb72c3001  ! 702: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0xa7341011  ! 702: SRLX_R	srlx	%r16, %r17, %r19
	.word 0x8a8c0011  ! 702: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0x921c0011  ! 702: XOR_R	xor 	%r16, %r17, %r9
thr0_dc_err_59:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_59), 16, 16),1,DC_DATA,27)
	.word 0xd2cc202f  ! 704: LDSBA_I	ldsba	[%r16, + 0x002f] %asi, %r9
	.word 0xf68c2c70  ! 706: LDUBA_I	lduba	[%r16, + 0x0c70] %asi, %r27
	.word 0x8cc42f29  ! 708: ADDCcc_I	addccc 	%r16, 0x0f29, %r6
	.word 0x83340011  ! 708: SRL_R	srl 	%r16, %r17, %r1
	.word 0x8b3c2001  ! 708: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x9aac28ba  ! 708: ANDNcc_I	andncc 	%r16, 0x08ba, %r13
	.word 0xba9c0011  ! 708: XORcc_R	xorcc 	%r16, %r17, %r29
	.word 0x84b40011  ! 708: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xb00427e0  ! 708: ADD_I	add 	%r16, 0x07e0, %r24
thr0_dc_err_60:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_60), 16, 16),1,DC_DATA,43)
	.word 0xf0440000  ! 710: LDSW_R	ldsw	[%r16 + %r0], %r24
thr0_irf_ce_71:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_71), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xe82c2da1  ! 714: STB_I	stb	%r20, [%r16 + 0x0da1]
	.word 0x98440011  ! 716: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x8e1c0011  ! 716: XOR_R	xor 	%r16, %r17, %r7
	.word 0x8d641811  ! 716: MOVcc_R	<illegal instruction>
	.word 0x8c140011  ! 716: OR_R	or 	%r16, %r17, %r6
	.word 0xba8c29ec  ! 716: ANDcc_I	andcc 	%r16, 0x09ec, %r29
	.word 0x972c1011  ! 716: SLLX_R	sllx	%r16, %r17, %r11
	.word 0x833c0011  ! 716: SRA_R	sra 	%r16, %r17, %r1
	.word 0xb37c2401  ! 716: MOVR_I	move	%r16, 0xfffffe34, %r25
thr0_dc_err_61:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_61), 16, 16),1,DC_DATA,5)
	.word 0xf2540000  ! 718: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xcb841011  ! 720: LDFA_R	lda	[%r16, %r17], %f5
	.word 0xa60c0011  ! 722: AND_R	and 	%r16, %r17, %r19
	.word 0x96b42b6a  ! 722: ORNcc_I	orncc 	%r16, 0x0b6a, %r11
	.word 0x92bc0011  ! 722: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x881c2e65  ! 722: XOR_I	xor 	%r16, 0x0e65, %r4
	.word 0x9ac40011  ! 722: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xb43c0011  ! 722: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x82c40011  ! 722: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0xb37c2401  ! 722: MOVR_I	move	%r16, 0xfffffe34, %r25
	.word 0xf9841011  ! 723: LDFA_R	lda	[%r16, %r17], %f28
thr0_irf_ce_72:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_72), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xd39c1011  ! 725: LDDFA_R	ldda	[%r16, %r17], %f9
	.word 0x952c0011  ! 727: SLL_R	sll 	%r16, %r17, %r10
	.word 0xb22c26d6  ! 727: ANDN_I	andn 	%r16, 0x06d6, %r25
	.word 0x869424de  ! 727: ORcc_I	orcc 	%r16, 0x04de, %r3
	.word 0x9d7c2401  ! 727: MOVR_I	move	%r16, 0xfffffe34, %r14
	.word 0xb4b40011  ! 727: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0x98b42119  ! 727: ORNcc_I	orncc 	%r16, 0x0119, %r12
	.word 0xf41c0011  ! 728: LDD_R	ldd	[%r16 + %r17], %r26
thr0_irf_ce_73:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_73), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xd29c22e6  ! 730: LDDA_I	ldda	[%r16, + 0x02e6] %asi, %r9
	.word 0xb57c0411  ! 732: MOVR_R	move	%r16, %r17, %r26
	.word 0x841c0011  ! 732: XOR_R	xor 	%r16, %r17, %r2
	.word 0x9d2c2001  ! 732: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x98ac2795  ! 732: ANDNcc_I	andncc 	%r16, 0x0795, %r12
	.word 0x98442bae  ! 732: ADDC_I	addc 	%r16, 0x0bae, %r12
	.word 0x8b2c1011  ! 732: SLLX_R	sllx	%r16, %r17, %r5
	.word 0x937c2401  ! 732: MOVR_I	move	%r16, 0xfffffe34, %r9
	.word 0xb00c0011  ! 732: AND_R	and 	%r16, %r17, %r24
thr0_dc_err_62:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_62), 16, 16),1,DC_DATA,70)
	.word 0xf0040000  ! 734: LDUW_R	lduw	[%r16 + %r0], %r24
thr0_irf_ce_74:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_74), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xe61c0011  ! 736: LDD_R	ldd	[%r16 + %r17], %r19
	.word 0x892c0011  ! 738: SLL_R	sll 	%r16, %r17, %r4
	.word 0x9f3c1011  ! 738: SRAX_R	srax	%r16, %r17, %r15
	.word 0xaa942d08  ! 738: ORcc_I	orcc 	%r16, 0x0d08, %r21
	.word 0x8e0c0011  ! 738: AND_R	and 	%r16, %r17, %r7
	.word 0x86140011  ! 738: OR_R	or 	%r16, %r17, %r3
	.word 0x82340011  ! 738: ORN_R	orn 	%r16, %r17, %r1
	.word 0x912c1011  ! 738: SLLX_R	sllx	%r16, %r17, %r8
	.word 0xb7641811  ! 739: MOVcc_R	<illegal instruction>
	.word 0x9a942660  ! 739: ORcc_I	orcc 	%r16, 0x0660, %r13
	.word 0x9804248e  ! 739: ADD_I	add 	%r16, 0x048e, %r12
	.word 0x9c2c2c89  ! 739: ANDN_I	andn 	%r16, 0x0c89, %r14
	.word 0x873c1011  ! 739: SRAX_R	srax	%r16, %r17, %r3
	.word 0x860c0011  ! 739: AND_R	and 	%r16, %r17, %r3
	.word 0xb81c0011  ! 739: XOR_R	xor 	%r16, %r17, %r28
	rd      %pc, %r18
	set     0x20, %r17
thr0_dc_err_63:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_63), 16, 16),1,DC_DATA,39)
	.word 0xf9040000  ! 740: LDF_R	ld	[%r16, %r0], %f28
thr0_irf_ce_75:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_75), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0xa9343001  ! 743: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0x9c340011  ! 743: ORN_R	orn 	%r16, %r17, %r14
	.word 0x97643801  ! 743: MOVcc_I	<illegal instruction>
	.word 0xb9342001  ! 743: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0x873c0011  ! 743: SRA_R	sra 	%r16, %r17, %r3
	.word 0xac940011  ! 743: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0xa83c0011  ! 743: XNOR_R	xnor 	%r16, %r17, %r20
thr0_dc_err_64:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_64), 16, 16),1,DC_DATA,64)
	.word 0xe89c2c89  ! 745: LDDA_I	ldda	[%r16, + 0x0c89] %asi, %r20
	.word 0xc8b41011  ! 747: STHA_R	stha	%r4, [%r16 + %r17] 0x80
	.word 0x8f3c1011  ! 749: SRAX_R	srax	%r16, %r17, %r7
	.word 0x86342581  ! 749: ORN_I	orn 	%r16, 0x0581, %r3
	.word 0xb0440011  ! 749: ADDC_R	addc 	%r16, %r17, %r24
	.word 0x8e440011  ! 749: ADDC_R	addc 	%r16, %r17, %r7
	.word 0x9c44294a  ! 749: ADDC_I	addc 	%r16, 0x094a, %r14
	.word 0xaf2c0011  ! 749: SLL_R	sll 	%r16, %r17, %r23
	.word 0xb52c3001  ! 749: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0x933c2001  ! 749: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0xc3941011  ! 750: LDQFA_R	-	[%r16, %r17], %f1
	.word 0xf7042f32  ! 752: LDF_I	ld	[%r16, 0x0f32], %f27
	.word 0xae1c0011  ! 754: XOR_R	xor 	%r16, %r17, %r23
	.word 0xba3c0011  ! 754: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x91641811  ! 754: MOVcc_R	<illegal instruction>
	.word 0x9434204d  ! 754: ORN_I	orn 	%r16, 0x004d, %r10
	.word 0x95342001  ! 754: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0xba8c0011  ! 754: ANDcc_R	andcc 	%r16, %r17, %r29
	.word 0x912c2001  ! 754: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0x9a2c0011  ! 754: ANDN_R	andn 	%r16, %r17, %r13
	.word 0xf39c1011  ! 755: LDDFA_R	ldda	[%r16, %r17], %f25
thr0_irf_ce_76:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_76), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xf6040011  ! 757: LDUW_R	lduw	[%r16 + %r17], %r27
	.word 0x8a04249e  ! 759: ADD_I	add 	%r16, 0x049e, %r5
	.word 0x94840011  ! 759: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0xb9343001  ! 759: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x90b40011  ! 759: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x82942c3f  ! 759: ORcc_I	orcc 	%r16, 0x0c3f, %r1
	.word 0xae1c0011  ! 759: XOR_R	xor 	%r16, %r17, %r23
	.word 0x8a9c2854  ! 759: XORcc_I	xorcc 	%r16, 0x0854, %r5
	.word 0xf4c41011  ! 760: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r26
thr0_irf_ce_77:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_77), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xcefc2368  ! 762: SWAPA_I	swapa	%r7, [%r16 + 0x0368] %asi
	.word 0x8c9c0011  ! 764: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0x8f641811  ! 764: MOVcc_R	<illegal instruction>
	.word 0xb8940011  ! 764: ORcc_R	orcc 	%r16, %r17, %r28
	.word 0x897c0411  ! 764: MOVR_R	move	%r16, %r17, %r4
	.word 0xbaac2e63  ! 764: ANDNcc_I	andncc 	%r16, 0x0e63, %r29
thr0_dc_err_65:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_65), 16, 16),1,DC_DATA,70)
	.word 0xfa540000  ! 766: LDSH_R	ldsh	[%r16 + %r0], %r29
thr0_irf_ce_78:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_78), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xca2c22a6  ! 770: STB_I	stb	%r5, [%r16 + 0x02a6]
	.word 0xac3424ee  ! 772: ORN_I	orn 	%r16, 0x04ee, %r22
	.word 0x913c1011  ! 772: SRAX_R	srax	%r16, %r17, %r8
	.word 0x8a8c2d97  ! 772: ANDcc_I	andcc 	%r16, 0x0d97, %r5
	.word 0xb77c0411  ! 772: MOVR_R	move	%r16, %r17, %r27
	.word 0x909c2c1b  ! 772: XORcc_I	xorcc 	%r16, 0x0c1b, %r8
thr0_dc_err_66:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_66), 16, 16),1,DC_DATA,15)
	.word 0xd0dc2c1b  ! 774: LDXA_I	ldxa	[%r16, + 0x0c1b] %asi, %r8
thr0_irf_ce_79:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_79), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd8942875  ! 776: LDUHA_I	lduha	[%r16, + 0x0875] %asi, %r12
	.word 0xb42c0011  ! 778: ANDN_R	andn 	%r16, %r17, %r26
	.word 0x9a840011  ! 778: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x88940011  ! 778: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x86342fe9  ! 778: ORN_I	orn 	%r16, 0x0fe9, %r3
	.word 0x92ac241f  ! 778: ANDNcc_I	andncc 	%r16, 0x041f, %r9
	.word 0x94040011  ! 778: ADD_R	add 	%r16, %r17, %r10
	.word 0xd40c0011  ! 779: LDUB_R	ldub	[%r16 + %r17], %r10
thr0_irf_ce_80:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_80), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xde5c25cb  ! 781: LDX_I	ldx	[%r16 + 0x05cb], %r15
	.word 0xba1c2a98  ! 783: XOR_I	xor 	%r16, 0x0a98, %r29
	.word 0xa69c0011  ! 783: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x8c2c0011  ! 783: ANDN_R	andn 	%r16, %r17, %r6
	.word 0xbb643801  ! 783: MOVcc_I	<illegal instruction>
	.word 0x9f7c2401  ! 783: MOVR_I	move	%r16, 0xfffffe34, %r15
	.word 0xb6b40011  ! 783: ORNcc_R	orncc 	%r16, %r17, %r27
thr0_dc_err_67:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_67), 16, 16),1,DC_DATA,9)
	.word 0xf6442a98  ! 785: LDSW_I	ldsw	[%r16 + 0x0a98], %r27
	.word 0xf5040011  ! 787: LDF_R	ld	[%r16, %r17], %f26
	.word 0xb53c0011  ! 789: SRA_R	sra 	%r16, %r17, %r26
	.word 0xba3c2ffe  ! 789: XNOR_I	xnor 	%r16, 0x0ffe, %r29
	.word 0x93343001  ! 789: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x9a9c0011  ! 789: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0xb2ac2e3a  ! 789: ANDNcc_I	andncc 	%r16, 0x0e3a, %r25
	.word 0x86440011  ! 789: ADDC_R	addc 	%r16, %r17, %r3
	.word 0xb0440011  ! 789: ADDC_R	addc 	%r16, %r17, %r24
	.word 0x8e142531  ! 789: OR_I	or 	%r16, 0x0531, %r7
thr0_dc_err_68:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_68), 16, 16),1,DC_DATA,60)
	.word 0xce140000  ! 791: LDUH_R	lduh	[%r16 + %r0], %r7
	.word 0xf2c42759  ! 793: LDSWA_I	ldswa	[%r16, + 0x0759] %asi, %r25
	.word 0x94b421a0  ! 795: ORNcc_I	orncc 	%r16, 0x01a0, %r10
	.word 0xae0c0011  ! 795: AND_R	and 	%r16, %r17, %r23
	.word 0x963c0011  ! 795: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x908c2d4f  ! 795: ANDcc_I	andcc 	%r16, 0x0d4f, %r8
	.word 0xa8140011  ! 795: OR_R	or 	%r16, %r17, %r20
	.word 0xac042812  ! 795: ADD_I	add 	%r16, 0x0812, %r22
	.word 0xc61c0011  ! 796: LDD_R	ldd	[%r16 + %r17], %r3
	.word 0x98540011  ! 798: UMUL_R	umul 	%r16, %r17, %r12
	.word 0x88c42614  ! 800: ADDCcc_I	addccc 	%r16, 0x0614, %r4
	.word 0x8e8c0011  ! 800: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x997c2401  ! 800: MOVR_I	move	%r16, 0xfffffe34, %r12
	.word 0x9f342001  ! 800: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xae3c0011  ! 800: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x98440011  ! 800: ADDC_R	addc 	%r16, %r17, %r12
	.word 0xb32c1011  ! 801: SLLX_R	sllx	%r16, %r17, %r25
	.word 0xaf2c1011  ! 801: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x9e940011  ! 801: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x873c2001  ! 801: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x88940011  ! 801: ORcc_R	orcc 	%r16, %r17, %r4
	rd      %pc, %r18
	set     0x20, %r17
thr0_dc_err_69:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_69), 16, 16),1,DC_DATA,62)
	.word 0xc9841000  ! 802: LDFA_R	lda	[%r16, %r0], %f4
	return     %r18 + %r17
	.word 0x92140011  ! 805: OR_R	or 	%r16, %r17, %r9
	.word 0xb23c0011  ! 805: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0xbb3c0011  ! 805: SRA_R	sra 	%r16, %r17, %r29
	.word 0x948c0011  ! 805: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x853c0011  ! 805: SRA_R	sra 	%r16, %r17, %r2
	.word 0xb6b40011  ! 805: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0xad3c0011  ! 805: SRA_R	sra 	%r16, %r17, %r22
	.word 0xf3140011  ! 806: LDQF_R	-	[%r16, %r17], %f25
!Illinst store
	.word 0xd22c0011  ! 808: STB_R	stb	%r9, [%r16 + %r17]
	.word 0x92940011  ! 810: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x86440011  ! 810: ADDC_R	addc 	%r16, %r17, %r3
	.word 0xa6340011  ! 810: ORN_R	orn 	%r16, %r17, %r19
	.word 0xab342001  ! 810: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x98942d06  ! 810: ORcc_I	orcc 	%r16, 0x0d06, %r12
	.word 0x8b7c0411  ! 810: MOVR_R	move	%r16, %r17, %r5
	.word 0x9494263a  ! 810: ORcc_I	orcc 	%r16, 0x063a, %r10
	.word 0x9ab40011  ! 810: ORNcc_R	orncc 	%r16, %r17, %r13
thr0_dc_err_70:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_70), 16, 16),1,DC_DATA,19)
	.word 0xda4c0000  ! 812: LDSB_R	ldsb	[%r16 + %r0], %r13
thr0_irf_ce_81:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_81), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd08c26d3  ! 814: LDUBA_I	lduba	[%r16, + 0x06d3] %asi, %r8
	.word 0x98c40011  ! 816: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0xa93c0011  ! 816: SRA_R	sra 	%r16, %r17, %r20
	.word 0xaa342d7c  ! 816: ORN_I	orn 	%r16, 0x0d7c, %r21
	.word 0x95342001  ! 816: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x903421e9  ! 816: ORN_I	orn 	%r16, 0x01e9, %r8
	.word 0x9a9c2212  ! 816: XORcc_I	xorcc 	%r16, 0x0212, %r13
	.word 0xb0942f3b  ! 816: ORcc_I	orcc 	%r16, 0x0f3b, %r24
thr0_dc_err_71:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_71), 16, 16),1,DC_DATA,34)
	.word 0xf0040000  ! 818: LDUW_R	lduw	[%r16 + %r0], %r24
thr0_irf_ce_82:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_82), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xd5e41011  ! 820: CASA_I	casa	[%r16] 0x80, %r17, %r10
	.word 0xb1641811  ! 822: MOVcc_R	<illegal instruction>
	.word 0x9cac27fe  ! 822: ANDNcc_I	andncc 	%r16, 0x07fe, %r14
	.word 0x982c2aa5  ! 822: ANDN_I	andn 	%r16, 0x0aa5, %r12
	.word 0xaa342108  ! 822: ORN_I	orn 	%r16, 0x0108, %r21
	.word 0x90b40011  ! 822: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0xb8342324  ! 822: ORN_I	orn 	%r16, 0x0324, %r28
	.word 0x86b40011  ! 822: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0xfa042383  ! 823: LDUW_I	lduw	[%r16 + 0x0383], %r29
	.word 0xd8cc1011  ! 825: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r12
	.word 0xb03c2b1c  ! 827: XNOR_I	xnor 	%r16, 0x0b1c, %r24
	.word 0x8c1c0011  ! 827: XOR_R	xor 	%r16, %r17, %r6
	.word 0x96c42be5  ! 827: ADDCcc_I	addccc 	%r16, 0x0be5, %r11
	.word 0xacbc0011  ! 827: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0x84842faa  ! 827: ADDcc_I	addcc 	%r16, 0x0faa, %r2
	.word 0x82842a07  ! 827: ADDcc_I	addcc 	%r16, 0x0a07, %r1
	.word 0xb6340011  ! 827: ORN_R	orn 	%r16, %r17, %r27
thr0_dc_err_72:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_72), 16, 16),1,DC_DATA,39)
	.word 0xf69c1000  ! 829: LDDA_R	ldda	[%r16, %r0] 0x80, %r27
	.word 0xc40421db  ! 831: LDUW_I	lduw	[%r16 + 0x01db], %r2
	.word 0x9c44238a  ! 833: ADDC_I	addc 	%r16, 0x038a, %r14
	.word 0x9c442c5a  ! 833: ADDC_I	addc 	%r16, 0x0c5a, %r14
	.word 0x852c1011  ! 833: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x932c2001  ! 833: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0xab341011  ! 833: SRLX_R	srlx	%r16, %r17, %r21
	.word 0xb7341011  ! 833: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x989c2e59  ! 833: XORcc_I	xorcc 	%r16, 0x0e59, %r12
	.word 0xd4cc1011  ! 834: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r10
	.word 0xf514266c  ! 836: LDQF_I	-	[%r16, 0x066c], %f26
	.word 0x84bc2e8c  ! 838: XNORcc_I	xnorcc 	%r16, 0x0e8c, %r2
	.word 0xbabc2592  ! 838: XNORcc_I	xnorcc 	%r16, 0x0592, %r29
	.word 0xab3c1011  ! 838: SRAX_R	srax	%r16, %r17, %r21
	.word 0xb0040011  ! 838: ADD_R	add 	%r16, %r17, %r24
	.word 0xb17c2401  ! 838: MOVR_I	move	%r16, 0xfffffe34, %r24
	.word 0x8e3c0011  ! 838: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x981c275a  ! 838: XOR_I	xor 	%r16, 0x075a, %r12
thr0_dc_err_73:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_73), 16, 16),1,DC_DATA,45)
	.word 0xd85c0000  ! 840: LDX_R	ldx	[%r16 + %r0], %r12
	.word 0xcf042045  ! 842: LDF_I	ld	[%r16, 0x0045], %f7
	.word 0xb69424d8  ! 844: ORcc_I	orcc 	%r16, 0x04d8, %r27
	.word 0x8cbc2bd6  ! 844: XNORcc_I	xnorcc 	%r16, 0x0bd6, %r6
	.word 0xa9342001  ! 844: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0xb02c0011  ! 844: ANDN_R	andn 	%r16, %r17, %r24
	.word 0x857c0411  ! 844: MOVR_R	move	%r16, %r17, %r2
	.word 0x8e9c0011  ! 844: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0xaeac2b35  ! 844: ANDNcc_I	andncc 	%r16, 0x0b35, %r23
	.word 0xa6440011  ! 844: ADDC_R	addc 	%r16, %r17, %r19
	.word 0xced42539  ! 845: LDSHA_I	ldsha	[%r16, + 0x0539] %asi, %r7
!Illinst alu
	.word 0xb2140011  ! 847: OR_R	or 	%r16, %r17, %r25
	.word 0x99342001  ! 849: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0xb08c0011  ! 849: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0x9e940011  ! 849: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x973c1011  ! 849: SRAX_R	srax	%r16, %r17, %r11
	.word 0x940c0011  ! 849: AND_R	and 	%r16, %r17, %r10
thr0_dc_err_74:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_74), 16, 16),1,DC_DATA,34)
	.word 0xd4c42539  ! 851: LDSWA_I	ldswa	[%r16, + 0x0539] %asi, %r10
thr0_irf_ce_83:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_83), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xdad4241c  ! 853: LDSHA_I	ldsha	[%r16, + 0x041c] %asi, %r13
	.word 0x8e1c279f  ! 855: XOR_I	xor 	%r16, 0x079f, %r7
	.word 0x92c40011  ! 855: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x960c0011  ! 855: AND_R	and 	%r16, %r17, %r11
	.word 0x820425e4  ! 855: ADD_I	add 	%r16, 0x05e4, %r1
	.word 0xb09c2909  ! 855: XORcc_I	xorcc 	%r16, 0x0909, %r24
	.word 0xba9c0011  ! 855: XORcc_R	xorcc 	%r16, %r17, %r29
thr0_dc_err_75:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_75), 16, 16),1,DC_DATA,46)
	.word 0xfb841000  ! 857: LDFA_R	lda	[%r16, %r0], %f29
        wr  %g0, 0x80, %asi
	.word 0x9b7c2401  ! 861: MOVR_I	move	%r16, 0xfffffe34, %r13
	.word 0x832c1011  ! 861: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x833c0011  ! 861: SRA_R	sra 	%r16, %r17, %r1
	.word 0x8a9c2bf9  ! 861: XORcc_I	xorcc 	%r16, 0x0bf9, %r5
	.word 0x9c040011  ! 861: ADD_R	add 	%r16, %r17, %r14
	.word 0x972c3001  ! 861: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x96042bb5  ! 861: ADD_I	add 	%r16, 0x0bb5, %r11
	.word 0x83343001  ! 862: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x8a142aa8  ! 862: OR_I	or 	%r16, 0x0aa8, %r5
	.word 0x932c2001  ! 862: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x93343001  ! 862: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x8f343001  ! 862: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x9ac42058  ! 862: ADDCcc_I	addccc 	%r16, 0x0058, %r13
	.word 0x83641811  ! 862: MOVcc_R	<illegal instruction>
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xcd1c0011  ! 862: LDDF_R	ldd	[%r16, %r17], %f6
thr0_irf_ce_84:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_84), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0x8e9c0011  ! 865: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x98842c13  ! 865: ADDcc_I	addcc 	%r16, 0x0c13, %r12
	.word 0xb49c21fe  ! 865: XORcc_I	xorcc 	%r16, 0x01fe, %r26
	.word 0xa9340011  ! 865: SRL_R	srl 	%r16, %r17, %r20
	.word 0x8c9c2abd  ! 865: XORcc_I	xorcc 	%r16, 0x0abd, %r6
	.word 0xd7841011  ! 866: LDFA_R	lda	[%r16, %r17], %f11
thr0_irf_ce_85:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_85), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0x81580000  ! 868: FLUSHW	flushw
	.word 0x989428dc  ! 870: ORcc_I	orcc 	%r16, 0x08dc, %r12
	.word 0x9e440011  ! 870: ADDC_R	addc 	%r16, %r17, %r15
	.word 0xae0c2583  ! 870: AND_I	and 	%r16, 0x0583, %r23
	.word 0xb0342f55  ! 870: ORN_I	orn 	%r16, 0x0f55, %r24
	.word 0x981c0011  ! 870: XOR_R	xor 	%r16, %r17, %r12
	.word 0x8c9c0011  ! 870: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0x8abc0011  ! 870: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0x8cac27b7  ! 870: ANDNcc_I	andncc 	%r16, 0x07b7, %r6
	.word 0xd10424de  ! 871: LDF_I	ld	[%r16, 0x04de], %f8
	.word 0xef14295e  ! 873: LDQF_I	-	[%r16, 0x095e], %f23
	.word 0x84142216  ! 875: OR_I	or 	%r16, 0x0216, %r2
	.word 0xba342634  ! 875: ORN_I	orn 	%r16, 0x0634, %r29
	.word 0x9abc22ec  ! 875: XNORcc_I	xnorcc 	%r16, 0x02ec, %r13
	.word 0xad2c0011  ! 875: SLL_R	sll 	%r16, %r17, %r22
	.word 0x94ac2499  ! 875: ANDNcc_I	andncc 	%r16, 0x0499, %r10
	.word 0x8eb4242d  ! 875: ORNcc_I	orncc 	%r16, 0x042d, %r7
	.word 0xe8542709  ! 876: LDSH_I	ldsh	[%r16 + 0x0709], %r20
thr0_irf_ce_86:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_86), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xce9c23fb  ! 878: LDDA_I	ldda	[%r16, + 0x03fb] %asi, %r7
	.word 0x8b641811  ! 880: MOVcc_R	<illegal instruction>
	.word 0x8cc42014  ! 880: ADDCcc_I	addccc 	%r16, 0x0014, %r6
	.word 0x88440011  ! 880: ADDC_R	addc 	%r16, %r17, %r4
	.word 0xaf2c2001  ! 880: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0xa62c0011  ! 880: ANDN_R	andn 	%r16, %r17, %r19
	.word 0xb41c0011  ! 880: XOR_R	xor 	%r16, %r17, %r26
	.word 0x8e440011  ! 880: ADDC_R	addc 	%r16, %r17, %r7
	.word 0xc4140011  ! 881: LDUH_R	lduh	[%r16 + %r17], %r2
	.word 0xc8f42076  ! 883: STXA_I	stxa	%r4, [%r16 + 0x0076] %asi
	.word 0x933c1011  ! 885: SRAX_R	srax	%r16, %r17, %r9
	.word 0xb1340011  ! 885: SRL_R	srl 	%r16, %r17, %r24
	.word 0xaf641811  ! 885: MOVcc_R	<illegal instruction>
	.word 0xb1341011  ! 885: SRLX_R	srlx	%r16, %r17, %r24
	.word 0xb2042bf7  ! 885: ADD_I	add 	%r16, 0x0bf7, %r25
	.word 0xa9340011  ! 885: SRL_R	srl 	%r16, %r17, %r20
	.word 0xf48c1011  ! 886: LDUBA_R	lduba	[%r16, %r17] 0x80, %r26
	.word 0xc8540011  ! 888: LDSH_R	ldsh	[%r16 + %r17], %r4
	.word 0x94440011  ! 890: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x82c42d16  ! 890: ADDCcc_I	addccc 	%r16, 0x0d16, %r1
	.word 0x91643801  ! 890: MOVcc_I	<illegal instruction>
	.word 0x8494221a  ! 890: ORcc_I	orcc 	%r16, 0x021a, %r2
	.word 0xb72c3001  ! 890: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0xc85c28b1  ! 891: LDX_I	ldx	[%r16 + 0x08b1], %r4
thr0_irf_ce_87:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_87), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xdc540011  ! 893: LDSH_R	ldsh	[%r16 + %r17], %r14
	.word 0x9ab40011  ! 895: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x8c0c2a11  ! 895: AND_I	and 	%r16, 0x0a11, %r6
	.word 0x909423fa  ! 895: ORcc_I	orcc 	%r16, 0x03fa, %r8
	.word 0x9d643801  ! 895: MOVcc_I	<illegal instruction>
	.word 0x832c0011  ! 895: SLL_R	sll 	%r16, %r17, %r1
	.word 0xdf1c0011  ! 896: LDDF_R	ldd	[%r16, %r17], %f15
thr0_irf_ce_88:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_88), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xc65c2309  ! 898: LDX_I	ldx	[%r16 + 0x0309], %r3
	.word 0x9b343001  ! 900: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xa92c0011  ! 900: SLL_R	sll 	%r16, %r17, %r20
	.word 0xb13c2001  ! 900: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0x84440011  ! 900: ADDC_R	addc 	%r16, %r17, %r2
	.word 0xa88c2bb3  ! 900: ANDcc_I	andcc 	%r16, 0x0bb3, %r20
	.word 0x902c0011  ! 900: ANDN_R	andn 	%r16, %r17, %r8
	.word 0xb01428b8  ! 900: OR_I	or 	%r16, 0x08b8, %r24
	.word 0x9f2c2001  ! 900: SLL_I	sll 	%r16, 0x0001, %r15
thr0_dc_err_76:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_76), 16, 16),1,DC_DATA,7)
	.word 0xdf1428b8  ! 902: LDQF_I	-	[%r16, 0x08b8], %f15
thr0_irf_ce_89:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_89), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xc61c2ddc  ! 904: LDD_I	ldd	[%r16 + 0x0ddc], %r3
	.word 0x94b4298f  ! 906: ORNcc_I	orncc 	%r16, 0x098f, %r10
	.word 0x8f3c1011  ! 906: SRAX_R	srax	%r16, %r17, %r7
	.word 0x9a040011  ! 906: ADD_R	add 	%r16, %r17, %r13
	.word 0x90c40011  ! 906: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x8d3c0011  ! 906: SRA_R	sra 	%r16, %r17, %r6
	.word 0x97340011  ! 906: SRL_R	srl 	%r16, %r17, %r11
thr0_dc_err_77:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_77), 16, 16),1,DC_DATA,9)
	.word 0xd6440000  ! 908: LDSW_R	ldsw	[%r16 + %r0], %r11
	.word 0xdb941011  ! 910: LDQFA_R	-	[%r16, %r17], %f13
	.word 0x87641811  ! 912: MOVcc_R	<illegal instruction>
	.word 0xb57c0411  ! 912: MOVR_R	move	%r16, %r17, %r26
	.word 0x823c0011  ! 912: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x94140011  ! 912: OR_R	or 	%r16, %r17, %r10
	.word 0xaa440011  ! 912: ADDC_R	addc 	%r16, %r17, %r21
	.word 0xab342001  ! 912: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0xf5941011  ! 913: LDQFA_R	-	[%r16, %r17], %f26
	.word 0xfab41011  ! 915: STHA_R	stha	%r29, [%r16 + %r17] 0x80
	.word 0x99342001  ! 917: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x908c0011  ! 917: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x9c340011  ! 917: ORN_R	orn 	%r16, %r17, %r14
	.word 0xb49429c2  ! 917: ORcc_I	orcc 	%r16, 0x09c2, %r26
	.word 0x88b4232e  ! 917: ORNcc_I	orncc 	%r16, 0x032e, %r4
	.word 0x98b42ffe  ! 917: ORNcc_I	orncc 	%r16, 0x0ffe, %r12
	.word 0xd6cc1011  ! 918: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r11
thr0_irf_ce_90:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_90), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xe88c1011  ! 920: LDUBA_R	lduba	[%r16, %r17] 0x80, %r20
	.word 0xb61c2ff6  ! 922: XOR_I	xor 	%r16, 0x0ff6, %r27
	.word 0x82bc2819  ! 922: XNORcc_I	xnorcc 	%r16, 0x0819, %r1
	.word 0xa6ac2ceb  ! 922: ANDNcc_I	andncc 	%r16, 0x0ceb, %r19
	.word 0x9a3c0011  ! 922: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x91340011  ! 922: SRL_R	srl 	%r16, %r17, %r8
	.word 0x9c3c2616  ! 922: XNOR_I	xnor 	%r16, 0x0616, %r14
	.word 0x848c0011  ! 922: ANDcc_R	andcc 	%r16, %r17, %r2
thr0_dc_err_78:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_78), 16, 16),1,DC_DATA,40)
	.word 0xc59c1000  ! 924: LDDFA_R	ldda	[%r16, %r0], %f2
thr0_irf_ce_91:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_91), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xb47c2311  ! 926: SDIV_I	sdiv 	%r16, 0x0311, %r26
	.word 0x8ec42ae6  ! 928: ADDCcc_I	addccc 	%r16, 0x0ae6, %r7
	.word 0x88340011  ! 928: ORN_R	orn 	%r16, %r17, %r4
	.word 0x9f342001  ! 928: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x87343001  ! 928: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x88bc2435  ! 928: XNORcc_I	xnorcc 	%r16, 0x0435, %r4
	.word 0xb63c2df7  ! 928: XNOR_I	xnor 	%r16, 0x0df7, %r27
thr0_dc_err_79:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_79), 16, 16),1,DC_DATA,50)
	.word 0xf6040000  ! 930: LDUW_R	lduw	[%r16 + %r0], %r27
thr0_irf_ce_92:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_92), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xc6842e8c  ! 932: LDUWA_I	lduwa	[%r16, + 0x0e8c] %asi, %r3
	.word 0x9d643801  ! 934: MOVcc_I	<illegal instruction>
	.word 0xb22c0011  ! 934: ANDN_R	andn 	%r16, %r17, %r25
	.word 0x88c42e85  ! 934: ADDCcc_I	addccc 	%r16, 0x0e85, %r4
	.word 0x8c94241d  ! 934: ORcc_I	orcc 	%r16, 0x041d, %r6
	.word 0x841c26bb  ! 934: XOR_I	xor 	%r16, 0x06bb, %r2
thr0_dc_err_80:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_80), 16, 16),1,DC_DATA,24)
	.word 0xc4c426bb  ! 936: LDSWA_I	ldswa	[%r16, + 0x06bb] %asi, %r2
thr0_irf_ce_93:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_93), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xdc542952  ! 938: LDSH_I	ldsh	[%r16 + 0x0952], %r14
	.word 0xb6c40011  ! 940: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x953c0011  ! 940: SRA_R	sra 	%r16, %r17, %r10
	.word 0xad7c2401  ! 940: MOVR_I	move	%r16, 0xfffffe34, %r22
	.word 0x9ab40011  ! 940: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x949c2d3f  ! 940: XORcc_I	xorcc 	%r16, 0x0d3f, %r10
	.word 0xc45c0011  ! 941: LDX_R	ldx	[%r16 + %r17], %r2
thr0_irf_ce_94:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_94), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xcec41011  ! 943: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r7
	.word 0xab342001  ! 945: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x8b343001  ! 945: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0x9c9c0011  ! 945: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x862c283e  ! 945: ANDN_I	andn 	%r16, 0x083e, %r3
	.word 0x9eb42c5a  ! 945: ORNcc_I	orncc 	%r16, 0x0c5a, %r15
	.word 0x993c1011  ! 945: SRAX_R	srax	%r16, %r17, %r12
	.word 0x91643801  ! 945: MOVcc_I	<illegal instruction>
thr0_dc_err_81:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_81), 16, 16),1,DC_DATA,4)
	.word 0xd05c2c5a  ! 947: LDX_I	ldx	[%r16 + 0x0c5a], %r8
	.word 0xcc540011  ! 949: LDSH_R	ldsh	[%r16 + %r17], %r6
	.word 0xa80424c1  ! 951: ADD_I	add 	%r16, 0x04c1, %r20
	.word 0x82440011  ! 951: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x98c40011  ! 951: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x8a3c0011  ! 951: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x842c0011  ! 951: ANDN_R	andn 	%r16, %r17, %r2
	.word 0xb32c3001  ! 951: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0x83341011  ! 951: SRLX_R	srlx	%r16, %r17, %r1
thr0_dc_err_82:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_82), 16, 16),1,DC_DATA,53)
	.word 0xc29424c1  ! 953: LDUHA_I	lduha	[%r16, + 0x04c1] %asi, %r1
thr0_irf_ce_95:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_95), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0x81580000  ! 955: FLUSHW	flushw
	.word 0x8c8c2d78  ! 957: ANDcc_I	andcc 	%r16, 0x0d78, %r6
	.word 0x82ac0011  ! 957: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0xa83c0011  ! 957: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0x9e840011  ! 957: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x880c2516  ! 957: AND_I	and 	%r16, 0x0516, %r4
	.word 0x8e1426b3  ! 957: OR_I	or 	%r16, 0x06b3, %r7
	.word 0xae140011  ! 957: OR_R	or 	%r16, %r17, %r23
thr0_dc_err_83:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_83), 16, 16),1,DC_DATA,13)
	.word 0xee4426b3  ! 959: LDSW_I	ldsw	[%r16 + 0x06b3], %r23
        wr  %g0, 0x80, %asi
	.word 0x84442cba  ! 963: ADDC_I	addc 	%r16, 0x0cba, %r2
	.word 0xaaac29dd  ! 963: ANDNcc_I	andncc 	%r16, 0x09dd, %r21
	.word 0xad340011  ! 963: SRL_R	srl 	%r16, %r17, %r22
	.word 0x921c0011  ! 963: XOR_R	xor 	%r16, %r17, %r9
	.word 0xb89c2da5  ! 963: XORcc_I	xorcc 	%r16, 0x0da5, %r28
	.word 0x960c2e4f  ! 963: AND_I	and 	%r16, 0x0e4f, %r11
	.word 0xaa9c2809  ! 963: XORcc_I	xorcc 	%r16, 0x0809, %r21
	.word 0xca142f2f  ! 964: LDUH_I	lduh	[%r16 + 0x0f2f], %r5
	.word 0xc5040011  ! 966: LDF_R	ld	[%r16, %r17], %f2
	.word 0x952c2001  ! 968: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0xa7343001  ! 968: SRLX_I	srlx	%r16, 0x0001, %r19
	.word 0xb3342001  ! 968: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x8a8c2936  ! 968: ANDcc_I	andcc 	%r16, 0x0936, %r5
	.word 0xac3c2194  ! 968: XNOR_I	xnor 	%r16, 0x0194, %r22
	.word 0x8e840011  ! 968: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x9b2c0011  ! 968: SLL_R	sll 	%r16, %r17, %r13
	.word 0xa9641811  ! 968: MOVcc_R	<illegal instruction>
	.word 0xca8c2f4d  ! 969: LDUBA_I	lduba	[%r16, + 0x0f4d] %asi, %r5
thr0_irf_ce_96:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_96), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0x9c5c0011  ! 971: SMUL_R	smul 	%r16, %r17, %r14
	.word 0x90bc22b2  ! 973: XNORcc_I	xnorcc 	%r16, 0x02b2, %r8
	.word 0xb80c2361  ! 973: AND_I	and 	%r16, 0x0361, %r28
	.word 0x94bc2e56  ! 973: XNORcc_I	xnorcc 	%r16, 0x0e56, %r10
	.word 0xb82c0011  ! 973: ANDN_R	andn 	%r16, %r17, %r28
	.word 0xac0c0011  ! 973: AND_R	and 	%r16, %r17, %r22
	.word 0x972c2001  ! 973: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x992c2001  ! 973: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x969c2948  ! 973: XORcc_I	xorcc 	%r16, 0x0948, %r11
	.word 0xf84c217d  ! 974: LDSB_I	ldsb	[%r16 + 0x017d], %r28
thr0_resum_intr_1503:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1503), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x92c40011  ! 978: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x9e440011  ! 978: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x86140011  ! 978: OR_R	or 	%r16, %r17, %r3
	.word 0x900c0011  ! 978: AND_R	and 	%r16, %r17, %r8
	.word 0xad343001  ! 978: SRLX_I	srlx	%r16, 0x0001, %r22
	.word 0x96840011  ! 978: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0xb8bc0011  ! 978: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0xcc040011  ! 979: LDUW_R	lduw	[%r16 + %r17], %r6
thr0_irf_ce_97:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_97), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xea7427f4  ! 983: STX_I	stx	%r21, [%r16 + 0x07f4]
	.word 0x882c2721  ! 985: ANDN_I	andn 	%r16, 0x0721, %r4
	.word 0x9d7c0411  ! 985: MOVR_R	move	%r16, %r17, %r14
	.word 0x8d7c2401  ! 985: MOVR_I	move	%r16, 0xfffffe34, %r6
	.word 0xb2c42401  ! 985: ADDCcc_I	addccc 	%r16, 0x0401, %r25
	.word 0x98ac2905  ! 985: ANDNcc_I	andncc 	%r16, 0x0905, %r12
	.word 0xc3140011  ! 986: LDQF_R	-	[%r16, %r17], %f1
thr0_irf_ce_98:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_98), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xd31c2870  ! 988: LDDF_I	ldd	[%r16, 0x0870], %f9
	.word 0xaec40011  ! 990: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0x91340011  ! 990: SRL_R	srl 	%r16, %r17, %r8
	.word 0xb97c0411  ! 990: MOVR_R	move	%r16, %r17, %r28
	.word 0x84942d69  ! 990: ORcc_I	orcc 	%r16, 0x0d69, %r2
	.word 0x96bc0011  ! 990: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x94940011  ! 990: ORcc_R	orcc 	%r16, %r17, %r10
thr0_dc_err_84:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_84), 16, 16),1,DC_DATA,14)
	.word 0xd4442d69  ! 992: LDSW_I	ldsw	[%r16 + 0x0d69], %r10
	.word 0xc8c41011  ! 994: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r4
	.word 0xaeb40011  ! 996: ORNcc_R	orncc 	%r16, %r17, %r23
	.word 0xac1c209a  ! 996: XOR_I	xor 	%r16, 0x009a, %r22
	.word 0xa6b428ef  ! 996: ORNcc_I	orncc 	%r16, 0x08ef, %r19
	.word 0xaf7c2401  ! 996: MOVR_I	move	%r16, 0xfffffe34, %r23
	.word 0x8d3c0011  ! 996: SRA_R	sra 	%r16, %r17, %r6
thr0_dc_err_85:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_85), 16, 16),1,DC_DATA,27)
	.word 0xcd0428ef  ! 998: LDF_I	ld	[%r16, 0x08ef], %f6
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
	.word  0xa2f54dce,0x8f4be1e3,0x3e5ca921,0xe2021577
	.word  0x89993ca2,0x8657107f,0xc5048ad1,0xe153cdf4
	.word  0xe8fd2e62,0x397fad68,0x4831d867,0x402ee82e
	.word  0x5899a1d2,0xe5935362,0x674ea2a3,0xa6fe1fc8
	.word  0x61e22fc4,0x95b4ac9e,0xa376d7c4,0x060fd4b7
	.word  0xee5cb91e,0x6c7dc265,0x7c4be0ef,0x6328cd65
	.word  0x8fcdc7ea,0x41458660,0x49d96b4a,0x115b6ec6
	.word  0x78b1e82e,0xfb9b80af,0x71f75721,0x0bcd7a24
	.word  0x0f2eeca9,0x039f4043,0x50389bca,0x4111e1a2
	.word  0xd572d41d,0xffbb2a02,0x7964fb9b,0x1b56e5a7
	.word  0xa2ae1713,0x2f20822c,0xf24cc3ee,0xc727bdcb
	.word  0x6ec417f6,0x922b9455,0x2f94e76e,0xd28b3793
	.word  0x8d33c4b4,0xb9468df6,0x235952a5,0x2d17c7a9
	.word  0x690964ed,0x093225dc,0x5392f29c,0xa30ae5c2
	.word  0xf3769473,0xf6beb0b7,0x3047556a,0xce9dd97c
	.word  0x047b32a5,0x3f1bf230,0x502a18b3,0x17f60a90
	.word  0x153643f6,0xb42bd98f,0x8e8d4d0f,0xa8d92f1e
	.word  0x931203cd,0xb8cb63af,0x2219d69c,0x90025dc6
	.word  0x2cdb1436,0x5c9f87c7,0x122de4dc,0x75dc431f
	.word  0xe1e75dc6,0x9199a374,0x6b59ea26,0x185c2192
	.word  0xc9acd058,0x9c44c689,0x0e23732b,0x7b64e5fe
	.word  0xc9c58300,0x4ff11261,0xf52a0901,0x50b2516e
	.word  0x9881ae53,0x011ddbc7,0x284e0964,0x3ec0eb6e
	.word  0xb3488561,0xe0162c74,0xab10fd7a,0x4d23bb4d
	.word  0xe4ae059f,0x947ffda2,0x0addcfbd,0x788f6828
	.word  0xd565ac34,0xb4ff24e5,0xcb168bf4,0xd275a09c
	.word  0xe9fc8ffd,0x32f7e25a,0x624c3c60,0xf63d54f2
	.word  0x1fb3cb0a,0xfe28c504,0x60fed686,0xc0b722bd
	.word  0xc779c179,0x41598fbb,0x64e7ec60,0xef42002c
	.word  0xc42520b4,0x2bec6ab8,0x0a09f22b,0x25a98486
	.word  0xde0c6eef,0xc3057afb,0xcae9633d,0xe578f3ff
	.word  0xfa55ce03,0xe46c56fc,0xdb9b4c66,0x96f2f8ca
	.word  0xb803e88c,0xc0f2193c,0x2548a772,0x9bb192cc
	.word  0x9402b44a,0xbdab336c,0x5010e7af,0xb2f526fd
	.word  0x9e899d09,0x63c733de,0xf17ec2b8,0xb96d9e23
	.word  0xa8b99a67,0x10195e72,0x4857f0fc,0x0132baf1
	.word  0x71c3cca3,0xdf23406a,0x411b7a1d,0xb4e1e419
	.word  0xdeb61988,0xe2c66a92,0x8aecfa60,0x39277886
	.word  0x4c783d50,0x03c19b37,0x04c04da0,0xb51a865e
	.word  0xaa606776,0x11f67b38,0xec9fae97,0x2194d64c
	.word  0xdc98f290,0x4cdeda10,0x3ad912f6,0xa0c6a627
	.word  0x3a7c4991,0xc7beb3aa,0x604c4e7f,0xbd6f1123
	.word  0xd7a25809,0xe1e5bab0,0x085b09dc,0xa8c36036
	.word  0xa80381b0,0xea7ba5f7,0xb39e1f12,0xfe1b3282
	.word  0xb62d4c57,0xbc75c85f,0x1c055a81,0xc6423a6c
	.word  0xae8129c8,0xec656e27,0xb52b820f,0xb324d933
	.word  0x93ec4c4f,0xbd9419f0,0xc2e15907,0xc3ee6ce8
	.word  0x34c1e46c,0x355fd61b,0x86f6ddb1,0x881de3b5
	.word  0x06efa5fb,0xf990ddb2,0x4e7d4df5,0x984a6572
	.word  0x592b2184,0xf5773d85,0xf1383e39,0x0e656f51
	.word  0x59fc16dc,0x6fd38d44,0x69dbdbee,0xe3f4aab2
	.word  0xbbbdf1d2,0x2e2a36fd,0x239ebfc9,0xc42728e3
	.word  0xf12b80e1,0xe0c438f5,0x596d3bab,0x7873fee9
	.word  0xe21285f2,0x4c30f0ac,0xcbb44a1a,0x5f6e24b5
	.word  0x031dcae4,0x89a1fc52,0x157974d0,0xcf3d7d95
	.word  0xe0ed1b0a,0x3c05f339,0xd1fa5e89,0x437665ff
	.word  0x345304ba,0x0406944a,0xf9907d0e,0x52198135
	.word  0xfbf92e00,0xc9aae671,0xd03a0caa,0xbcb1da9b
	.word  0x1612621b,0xdbb4c7e8,0x353ed852,0x58ad4a5b
	.word  0x729cebea,0xdb3bf8ed,0x3fdd2b1f,0xae19d0d9
	.word  0x427a23bb,0xe162c6dc,0xaaf68b3c,0x38b6aacb
	.word  0x00af78a9,0xc3ebd3bb,0x4ed9d722,0x810eb11f
	.word  0x844c2274,0xbbf32483,0x0301515c,0xcd0bd062
	.word  0x8396faa5,0x71b6f411,0xe2e5905f,0xa42b27e3
	.word  0x8618fad7,0x777d273f,0x10d694ab,0x58805fad
	.word  0xbd2ee8bc,0x3d50086b,0x90edde4d,0x261c011d
	.word  0x564f6769,0xa927e255,0xba3ad46b,0xa783ef96
	.word  0xd94079d2,0x8f772c6a,0xc7635800,0x014d99e2
	.word  0xf54b990c,0xc3e2ecab,0x23281ead,0xdb10a5c7
	.word  0x85b0bd15,0x88dbd965,0x1bb07cde,0x810de0db
	.word  0x62130957,0x850511e6,0x4579900b,0x0b4cbf80
	.word  0x99b4f942,0x62ea9a5e,0x88fec007,0xaa959e05
	.word  0x7731a8c8,0xa7a093fe,0x6c0b87c1,0x5eb95117
	.word  0x9ed81817,0x5c298696,0xee81c93e,0x472a78a8
	.word  0x061213cd,0x4634f80a,0x4079bcfd,0x3e4ec5d5
	.word  0xbf10f851,0xa8d9712d,0xbc110783,0xb822e630
	.word  0xcdd3efef,0x967797dd,0xe374f88d,0x06370dd7
	.word  0x6ee23f2c,0x3cddff65,0x4b7cc44b,0xde6d82d1
	.word  0x796c469a,0x553fa951,0x579edd62,0x1a01d8ee
	.word  0x31515e03,0xe564a4f7,0x4acd43c9,0xe882a493
	.word  0x26ff9d3c,0x0a6ccb36,0xc305ef08,0xaffd2200
	.word  0xbda6c1a5,0x7a2dfe0a,0x59a68321,0x446b3058
	.word  0x81ed6a61,0x5fbaac2e,0x121513ae,0x7a0d0de4
	.word  0xeba447ef,0x950432bb,0xc24cf835,0xf1e902c6
	.word  0x12f926cc,0x461bc8e4,0x95053eed,0x4fc98d1a
	.word  0x5593a9d2,0xf27b74a8,0x92cd4acb,0xc2f13461
	.word  0x6abd1531,0xaf78a273,0xbe068726,0x1ca9b1ed
	.word  0x69230e9f,0x8dd9e6cd,0xfe315fe6,0x5e472f5c
	.word  0x236bc2e9,0x51e69b56,0xd0b70e25,0x646ae26d
	.word  0xd903ff44,0xa69318f9,0x477522e7,0xa8787ed6
	.word  0x95e58489,0xdc0de001,0xf155ccb9,0x314fccdf
	.word  0x290b787b,0xa2b6869e,0x55d07ba1,0xbee174a7
	.word  0x4063e101,0x0154438b,0x4220ad63,0xee7dbc2c
	.word  0xd3d4bed4,0x60c01369,0xd9fe016c,0x0a387ebe
	.word  0xf701b31a,0x5a8764df,0x58f2970c,0x582fdf31
	.word  0x91388137,0x28430f6d,0xf7c04833,0x07718e65
	.word  0x0fc2ded6,0xd291e51f,0x24833422,0xc0b3a7f9
	.word  0x5f5c7bbe,0x20862132,0x5b42c2f7,0x26dcbad4
	.word  0x6806e35c,0x7388cd2f,0x51afd944,0x97a9972b
	.word  0x92e07dd0,0x6e2715a7,0xec30c06d,0x384d7856
	.word  0xa62534d6,0xc0270272,0x162a39bc,0xe736c93b
	.word  0xe40a7b6d,0x291b6f91,0x49463244,0xf54edd04
	.word  0x9fa11337,0xd73c20ac,0x6d8fa5b3,0xa2e5af94
	.word  0x9a0fe0e8,0x078d843f,0x1f5f1468,0xb942a954
	.word  0x7dfe3592,0x9f12cd5e,0x2fac7fda,0x490614c7
	.word  0x022e6d65,0xb62b7572,0xc93007b8,0xf168b2ff
	.word  0x5b4ddff5,0x686105e3,0x252893ac,0x5f804980
	.word  0x62dbb6c4,0xbbea7f3b,0x5665fdb7,0xc5fead95
	.word  0xc84bf116,0xd14b095e,0x73cfb2a7,0x48348e8f
	.word  0xa7c5adbc,0x0c810dc9,0x6d637681,0xe052d604
	.word  0x7dd68a07,0x2e14a9b1,0x7c8e114e,0xf58185e0
	.word  0x2733e3a3,0xe01fe1a4,0xddd77c1b,0x997ccfc3
	.word  0x44e57add,0x47504149,0xec8d39cf,0xa9e87712
	.word  0xf145a900,0x6fd9b70d,0xd9f22963,0x8a6514d6
	.word  0xaf6e2390,0x267284c0,0x8bd2880e,0x2ca0e4ba
	.word  0xb4f93757,0x8235a8e9,0xa507fe40,0xb8f225f7
	.word  0xa6f90c93,0x7dd18fd4,0x8ed17d75,0xf566ac19
	.word  0x15ccaf64,0x6e705f90,0xbe8a3de9,0x5c7aec20
	.word  0x010d7a1d,0x1fb495a9,0xe23c565a,0x3e5d4994
	.word  0xb34dd0fd,0xb2c09e3e,0xcd3073cd,0x91543908
	.word  0xd86a0f28,0xd2fc1283,0x553a3d55,0xac23dbd2
	.word  0xf1927621,0x5148aa58,0x5a2cc223,0x5a116cdf
	.word  0xaf715d6d,0x0a387995,0x7e9acae5,0x0e269ab5
	.word  0xa451145e,0xc5e123a3,0x9eb8bf0e,0x0fd1aab1
	.word  0x5ea8881b,0x58b46b68,0x3f2c1e8b,0x7d712435
	.word  0xe4cb7273,0x9bb6730d,0x0c8acda1,0xfb9142f2
	.word  0x0a18c0fd,0x08cdf37c,0x11f02568,0x5c763125
	.word  0xdd8294ad,0x54c00bbd,0xcf94f2db,0x23d9326c
	.word  0xc75a8163,0xa092f4f2,0x86b70598,0x941e175c
	.word  0xa4588810,0x33ea34f3,0xd86ce488,0x230e6c40
	.word  0x65685e10,0x8683426b,0x67aaa635,0x4020ea9a
	.word  0x9eee371f,0x36eeb4da,0x15c3f0ef,0x1eba1b44
	.word  0x9b06ff5e,0x11e95d2c,0x1db77bf5,0x0053e049
	.word  0x71d96fb0,0x67d2d7d2,0x53658419,0xedeab077
	.word  0xc3fcd2f8,0x04016fb9,0xe4a8945e,0xb058f6cb
	.word  0xf3cc69c6,0x43e9b066,0x1e14d648,0x72ba3820
	.word  0xb60ec404,0x652552a3,0x8fe66e1f,0x1475a31e
	.word  0x719455a2,0xd66afee0,0xd65ca5a3,0xe3dde6f2
	.word  0x1c283673,0x3318f5fe,0x9f255a88,0xddcfa798
	.word  0x48c2e04a,0x38cc8ec0,0x28035341,0x1fc86289
	.word  0xc931810c,0xf0f372af,0xd41f9abb,0x6c72978e
	.word  0xeef6bca3,0x17c866cf,0x7de9e2d2,0x23598020
	.word  0x3d21699f,0xd4efdf74,0x1808ea9f,0x344e27c0
	.word  0x258c8d54,0x74503af0,0x055ca7aa,0x66bdf437
	.word  0xb00ff520,0x926e026e,0xe65528b1,0x2dbb5768
	.word  0xb00afc7b,0x68069ef6,0xb31d008b,0x1eb0c2f3
	.word  0x4fc3d7d1,0x2a3f1259,0x18be7f82,0x0c8ee79b
	.word  0xe9409599,0x29adafca,0xfe205ffd,0x8a96f4be
	.word  0xe86f9b3e,0x6948ca86,0x6a067057,0xfb4f535d
	.word  0x738f8982,0x63733579,0x47856963,0x8bb2e019
	.word  0xa6bbd884,0xe2d061cd,0x9a8c51f0,0xe4a8bbf1
	.word  0x86880348,0x3e185c23,0xa8ed9f08,0xedd47ce8
	.word  0x2e9ecca7,0x59b0f14a,0x38b7d54e,0x68a6e77e
	.word  0x161c7098,0x5de0d761,0xd77a36ee,0x8c3e45cf
	.word  0xffffaf4d,0xc159bb51,0x9f7eab95,0x719cd5f6
	.word  0xd34d8ed3,0xe0b1ae42,0x27465782,0xa083ccfe
	.word  0xd204bb52,0x8669a47a,0xbf547faf,0xe69ad423
	.word  0x7834fdb1,0x880ccc18,0x0a907873,0x8a80bea6
	.word  0x195d0b1a,0xcc732c85,0x3e8edef1,0x98bc5197
	.word  0x5d19026b,0xddd29c6f,0xcefbdb6c,0x72afb800
	.word  0xc0af0d53,0xf48a3eb6,0x85b2d51d,0x8f1a2e65
	.word  0x9f20804c,0x3bb8bdca,0xd9a7f6ac,0xe1f83eb6
	.word  0x911e05db,0xf08abf6b,0xf0194436,0x0b34ecfa
	.word  0x791410e4,0x044dd8a1,0x238f6305,0xe9fa8d12
	.word  0xa15a6338,0x6533e946,0x45db82b9,0x731820a4
	.word  0x9457ede2,0x4030dafe,0x2f72f9ea,0xe102b28e
	.word  0xc1ad62dc,0xf026a95d,0xdbc00c3d,0x147c5e8a
	.word  0x10b5cf60,0x9d70c7ad,0x8a5c4f8f,0x0ad0e716
	.word  0xad799e33,0x7f81dd00,0xedd4e96c,0xe1314c64
	.word  0x677fb65a,0xdc5f9a66,0x17a1a457,0x4faefe3d
	.word  0x6442f301,0x1548770c,0x7ce63737,0xffb785c8
	.word  0x7c265585,0x7418dcda,0x90d5632a,0xdbc4fba7
	.word  0xe35b3315,0x01d22520,0x84319548,0xccd9880b
	.word  0x88964169,0x9db98597,0x7f01d79f,0xf6d84371
	.word  0x861077eb,0x97ca8c72,0xc0645e6b,0xea57ae3b
	.word  0x3eaf480e,0x24c5f7bf,0x45e814bd,0xd06f24f4
	.word  0x6e465acd,0xec4fdcd1,0x9cb4adb5,0x67d48656
	.word  0x6476bc4d,0x4c6096c6,0xcf606265,0xb54b0124
	.word  0x2765c247,0x0b006303,0xbabc98e1,0x327370a1
	.word  0x2aab1b67,0x0d87adbb,0x7f0224f6,0x10c2a80c
	.word  0xf4542748,0x77804166,0x101e7bd7,0xeb0afd99
	.word  0x7ae8f045,0x247fddc8,0x1a1bdf02,0x71f0177c
	.word  0xd4096b8e,0xcbe3e5ac,0xf4cb26f0,0x3c50b98a
	.word  0x8c29b084,0xcf8ce307,0x5119fb98,0x808773a5
	.word  0xc188dd96,0xe4272ded,0x30b83ff3,0xf8f864a3
	.word  0xe2ada9f9,0x67b87a1a,0xc05e5fa1,0xf76eab9b
	.word  0xb9326e5a,0x077f9969,0x5f311f79,0x829e3f2f
	.word  0x609e7bd0,0x223339f6,0x64aebb85,0x44419bd5
	.word  0xa1bcc92b,0x26662f7e,0x51c0c19b,0xf6b63e50
	.word  0xfcbe704e,0x1e86a79f,0x8bbbbecd,0x2cba6340
	.word  0x7abb652c,0x5a0e5038,0xdc577fad,0xcb4ba7da
	.word  0x32634a4d,0x026595c3,0x0f0c1eb0,0x0b1837cb
	.word  0xbe5a835f,0xb4a5f670,0xbd9ea136,0x1b010f4c
	.word  0x23f40035,0xe39c505d,0xcc3f5a4b,0x51d72cef
	.word  0x9d4ba388,0xc3969c42,0x0ac1281d,0xe485984b
	.word  0xb416f489,0xeec77f4f,0x83eda33b,0x1a68546d
	.word  0xdb4e0600,0xb31fe143,0x555e39e3,0xa20674f9
	.word  0x617bdfd6,0xad9b16b8,0x12d799b1,0xb9c51043
	.word  0x5ae1ce58,0x27932382,0x6eb0fe29,0x0f7cae54
	.word  0xafa0900c,0x3bf2d39e,0x75778b35,0x06ee358e
	.word  0x6a13c810,0x31b79206,0xafeba745,0x6bb7b392
	.word  0x5de52d67,0x752da5d7,0x8fb1ed12,0xabf13771
	.word  0x2203d165,0x7a78e946,0xbad13fb9,0x70d906c4
	.word  0x0039ceee,0xaf1d5309,0xb84d95f5,0x1423ec99
	.word  0x60393d3b,0x3fbfcc47,0xdf49c8e1,0xfc777bc9
	.word  0x2aa287d3,0xeb17c146,0xb34487c8,0x18428528
	.word  0x380c7035,0xf9c1754d,0xac5a1a51,0x53caabfe
	.word  0x0e1a5c98,0x08d58591,0x62e9e1ed,0xdc56bce7
	.word  0xae4c55a1,0x53c3d6ee,0x264a033d,0x2bbc6b87
	.word  0x6a49863d,0x9c36ae54,0x74194ac5,0x36868ada
	.word  0xbafa10ef,0xd1de7e65,0xd90d03c8,0x06d3edc4
	.word  0x51ed45b7,0x96bc1f66,0xc5cb5607,0x96927637
	.word  0xedeebca1,0x60dd651d,0xb7187c0a,0xa1ffce60
	.word  0xe047de63,0xc2837784,0xa83bec38,0x46bb4b0d
	.word  0x2667947f,0x0b11478e,0xf22bb271,0xd9d9d7be
	.word  0xf903bb23,0xa6a4b140,0xa34528ab,0x5dcaf716
	.word  0x4d237c99,0x7a2b4396,0xc3fed2ad,0x1aec78ea
	.word  0x48fafed1,0x103a1734,0x3d880964,0x59ad735f
	.word  0x1c5ce307,0xe22f7657,0x027fe615,0x26d7a482
	.word  0xe78716d1,0xdf5aeba8,0xdeb94a1f,0xff76beda
	.word  0x1e3d5ada,0x716289e6,0x667e2eb2,0xaa21402f
	.word  0xfb3e8349,0xd65bd90b,0x398f59c7,0xed994d8d
	.word  0x37d0ff27,0x5639e1f6,0x6a097483,0xaf71072c
	.word  0x334df262,0x9a137014,0x0bf07f3b,0x9ac718b2
	.word  0x72b403a2,0xf5a963a9,0x8b39c486,0xc7139c13
	.word  0x04010d2c,0xa76cedf5,0xaf47a84d,0x14926a3b
	.word  0x9aad9de3,0x7b312cf3,0x666abb45,0x1d0ce70b
	.word  0xc0043894,0x9e3b6b6a,0x9fa69c40,0x2c44a17c
	.word  0xc9fdf8f2,0xa9caef96,0x607a05be,0x706e838d
	.word  0x0eb6087f,0x371cc810,0x51833e48,0xe213a1d9
	.word  0x8d56aae4,0x348371c6,0x925ca087,0xded9fd68
	.word  0x80f4231a,0xe8b281e6,0x4742d0dc,0xcacdd7fd
	.word  0xfbf71648,0x4f3ea4ae,0x061da67a,0xf31cab31
	.word  0x4be567d2,0x0d91f570,0xb3c40bd9,0x87a16d92
	.word  0x7d1362c1,0x45af2d47,0x73208bae,0x443c93e0
	.word  0x29cfba5c,0x05ad6281,0x56e857ce,0x17f6adac
	.word  0xa3cc253e,0x9db92401,0xe4dd7452,0x2355c92a
	.word  0x09565019,0x81b43b05,0xdd80eeb8,0x1700591e
	.word  0xffc77ed1,0x18b4a5e3,0xae273ba2,0x83b1aeba
	.word  0x58b9583e,0xd851dd55,0x5d3556e8,0x7dddabb7
	.word  0x6629a7f6,0xf2c430ea,0xd73c942e,0xb4502473
	.word  0xd4d4aa06,0xb458efce,0xcd8d6c15,0xd6d26932
	.word  0x8dcac231,0xf8ace28c,0xa5a2e757,0x0772e570
	.word  0x184f25ca,0x4ae2a73c,0x398e0548,0xf9ce1848
	.word  0x0151b6a1,0xd29a7c47,0x97d386c0,0x3513a52a
	.word  0xebe55b94,0xc8670104,0x69b553f6,0xebe49e2f
	.word  0xe81f0eb0,0x11bc050b,0x81ede0c1,0x0ba52091
	.word  0x98e34acb,0x67d6b81a,0xdcc03244,0x92fe4dce
	.word  0xaed22485,0x4e9465d8,0xe87ca189,0x392116c9
	.word  0xa3ac9593,0x2ee4004a,0xc5ec38a5,0xf9bc9f85
	.word  0x426e3447,0xcaff5943,0x6944debd,0xa0014c32
	.word  0x466e2ef9,0x1703ba02,0xf3b97cdc,0x26b72848
	.word  0x8418bf63,0x5a6d408d,0x04258a44,0x7a06c25d
	.word  0x99e064af,0xe1b1a73d,0x860747fd,0xc4a0ce8f
	.word  0x4166b01e,0x47b131bb,0x92db7d14,0x49763636
	.word  0xe9aea4df,0x185926bc,0x25c79703,0x7bb63db7



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
!!# //  IJ_set_ropr_fld (ijdefault, Ft_Rcond, "3'b111");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 70, Ro_unaligned_addr, Fm_align_Simm13, "3'b000");
!!#   IJ_set_ropr_fld ("diag.j", 71, Ro_unaligned_addr, Ft_Simm13, "13'b0rrrrrrrrrrr1");
!!# 
!!#   IJ_copy_ropr ("diag.j", 73, Ro_rsvd_set, ijdefault);
!!#   IJ_set_ropr_fld ("diag.j", 74, Ro_rsvd_set, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_bits ("diag.j", 75, Ro_rsvd_set, 0x1fe0, "13'b1r1r1rr100000");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 77, Ro_dev_null, Ft_Rd, "{0}");  
!!#   IJ_set_ropr_fld ("diag.j", 78, Ro_dcerr, Ft_Rs2, "{0}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 80, th_evnt, 0x7);
!!# //  IJ_bind_thread_group(th_evnt, 0xf);
!!#   IJ_bind_thread_group("diag.j", 82, th_intr, 0x8);
!!#   IJ_bind_thread_group("diag.j", 83, th_all, 0xf);
!!#   IJ_th_fork_group ("diag.j", 84, th_all);
!!# 
!!#   for (j = 0; j < 8; j++) {
!!# 
!!#      IJ_set_rvar ("diag.j", 88, reg_rand_init, "64'h0000000000000rr0");
!!# 
!!#      IJ_printf ("diag.j", 90, th_all, "        setx  MAIN_BASE_DATA_VA, %%r1, %%r16\n");
!!#      IJ_printf ("diag.j", 91, th_all, "        setx  0x%016llrx, %%g1, %%r17\n", reg_rand_init);
!!# 
!!#      IJ_set_rvar ("diag.j", 93, reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!# 
!!#      for (i = 0; i < 16; i++) {
!!#        IJ_printf ("diag.j", 96, th_all, "        setx  0x%016llrx, %%g1, %%r%d\n", reg_rand_init, i);
!!#      }
!!#      for (i = 18; i < 32; i++) {
!!#        IJ_printf ("diag.j", 99, th_all, "        setx  0x%016llrx, %%g1, %%r%d\n", reg_rand_init, i);
!!#      }
!!# 
!!#      IJ_printf ("diag.j", 102, th_all, "	save %%r0, %%r0, %%r31\n");
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 105, th_evnt, "        wr  %%g0, 0x80, %%asi\n");
!!#   IJ_printf ("diag.j", 106, th_evnt, "        wr %%g0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs ("diag.j", 107, th_evnt, 16);
!!#   IJ_set_default_rule_wt_rvar ("diag.j", 108,"{20}");
!!#   IJ_set_rvar ("diag.j", 109, low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 110, mid_wt, "{5}");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
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
!!#   IJ_printf ("diag.j", 139, th_all, "	nop\n");
!!#   IJ_th_join ("diag.j", 140,0xf);
!!#   IJ_th_start ("diag.j", 141,Seq_Start, NULL, 2); 
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
!!#   IJ_printf ("diag.j", 177, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 178, th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 180, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 181, th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 183, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 184, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
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
!!# 	{IJ_generate ("diag.j", 222, th_evnt, $1);}
!!#        | asi_load
!!# 	{IJ_generate ("diag.j", 224, th_evnt, $1);}
!!#        | ldfp
!!# 	{IJ_generate ("diag.j", 226, th_evnt, $1);}
!!# ;
!!# 
!!# loads_err: dcerr load %ropr  Ro_dcerr
!!#             {IJ_generate ("diag.j", 230, th_evnt, $2);}
!!# 	   | dcerr asi_load %ropr  Ro_dcerr
!!#             {IJ_generate ("diag.j", 232, th_evnt, $2);}
!!# 	   | dcerr ldfp %ropr  Ro_dcerr
!!#             {IJ_generate ("diag.j", 234, th_evnt, $2);}
!!# ;
!!# 
!!# dcerr: mMETA5
!!# {
!!#    IJ_printf ("diag.j", 239, th_evnt, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#    bitnum = random () % 72;
!!#    IJ_printf ("diag.j", 241, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_dc_err_%d), 16, 16),1,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# rb_slt: irferr inst
!!#            {
!!#                 IJ_generate ("diag.j", 248, th_evnt, $2);
!!#            }
!!# 	 | d90 inst
!!#            {
!!#                 IJ_generate ("diag.j", 252, th_evnt, $2);
!!#            }
!!# 	 | d101 flhw %rvar  mid_wt
!!# //Add icerr
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
!!#            IJ_printf ("diag.j", 282, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#            bitnum = random () % 72;
!!#            IJ_printf ("diag.j", 284, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#            irf_err_cnt++;	 
!!#          }
!!# 
!!#          if ((i = random () % 4) == 0) {
!!#            IJ_printf ("diag.j", 289, th_evnt, "\tjmpl     %%r18 + %%r17, %%r31\n");
!!#          } else if (i ==1) {
!!#            IJ_printf ("diag.j", 291, th_evnt, "\treturn     %%r18 + %%r17\n");
!!#          } else if (i == 2) {
!!# 	   IJ_printf ("diag.j", 293, th_evnt, "\tjmpl     %%r18 + 0x20, %%r31\n");
!!# 	 } else {
!!# 	   IJ_printf ("diag.j", 295, th_evnt, "\treturn     %%r18 + 0x20\n");	   
!!#          }
!!#       }
!!# ;
!!# 
!!# d10: mMETA10
!!# {
!!#        burst_cnt = random () % 3 + 5;
!!#        IJ_generate_from_token ("diag.j", 303,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;
!!#        IJ_printf ("diag.j", 304, th_evnt, "\trd      %%pc, %%r18\n");
!!#        IJ_printf ("diag.j", 305, th_evnt, "\tset     0x20, %%r17\n");  
!!# }
!!# ;
!!# 
!!# rsvd_illinst: alu_tokens %ropr  Ro_rsvd_set
!!# 		{IJ_printf ("diag.j", 310, th_evnt, "!Illinst alu\n");
!!# 		 IJ_generate ("diag.j", 311, th_evnt, $1);}
!!# 	      | store_r %ropr  Ro_rsvd_set
!!# 		{IJ_printf ("diag.j", 313, th_evnt, "!Illinst store\n");
!!# 		 IJ_generate ("diag.j", 314, th_evnt, $1);}
!!# ;
!!# 
!!# intr_block: mMETA18
!!# {
!!#       for (i = 0; i < 1000; i++) {
!!#          burst_cnt = random () % 4 + 1;
!!#          thrid = random () % 3;
!!#          if (random () % 2 == 1) {
!!#            IJ_printf ("diag.j", 323, th_intr, "thr%y_nuke_intr_%d:\n", intr_cnt); 
!!#            IJ_printf ("diag.j", 324, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_nuke_intr_%d), 16, 16)) -> intp(%d, 2, 1)\n", intr_cnt,thrid);
!!#            intr_cnt++;
!!#            IJ_generate_from_token ("diag.j", 326,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;	
!!#            IJ_printf ("diag.j", 327, th_intr, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#            IJ_printf ("diag.j", 328, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(%d, 3, 1)\n", intr_cnt,thrid);
!!#            intr_cnt++;	   
!!# 	   burst_cnt = random () % 4 + 1;
!!#            IJ_generate_from_token ("diag.j", 331,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;	
!!#          } else {
!!#            IJ_printf ("diag.j", 333, th_intr, "thr%y_hw_intr_%d:\n", intr_cnt); 
!!#       	   IJ_printf ("diag.j", 334, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_hw_intr_%d), 16, 16)) -> intp(%d, 0, 1)\n", intr_cnt,thrid);            burst_cnt = random () % 4 + 1;
!!# 	   intr_cnt++;
!!#            IJ_generate_from_token ("diag.j", 336,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!#       IJ_generate_from_token ("diag.j", 347,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!# 		       IJ_generate ("diag.j", 354, th_evnt, $2);
!!# 		    }
!!#                   |
!!# 		 d5 store_i %ropr  Ro_unaligned_addr
!!#                     {
!!# 		      IJ_generate ("diag.j", 359, th_evnt, $2);
!!#                     }
!!# 		  | d6 irferr store_i %ropr  Ro_unaligned_addr
!!#                     {
!!# 		      IJ_generate ("diag.j", 363, th_evnt, $3);
!!#                     }
!!# ;
!!# 
!!# irferr: mMETA100
!!# {
!!#      IJ_printf ("diag.j", 369, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf ("diag.j", 371, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# inst: mul | div | fpop | load | asi_load | asi_st | br_tokens | membar | atomic | flush | prefetch | halt | privop %ropr  Ro_dev_null | chpriv | win | fpdis | rdasr | wrasr | wrasi | ldfp
!!# ;
!!# 
!!# rdasr: mMETArdasr
!!# {
!!#        IJ_printf ("diag.j", 381, th_evnt, "\trd      %%asr26, %%r31\n");
!!#        IJ_printf ("diag.j", 382, th_evnt, "\tset     0x01f05, %%r30\n");
!!#        IJ_printf ("diag.j", 383, th_evnt, "\tand     %%r31, %%r30, %%r31\n");
!!# }
!!# ;
!!# 
!!# wrasi: mMETAwrasi
!!# {
!!#    IJ_printf ("diag.j", 389, th_evnt, "        wr  %%g0, 0x80, %%asi\n");
!!# }
!!# ;
!!# 
!!# wrasr: mMETAwrasr
!!# {
!!#      if (random () % 2 == 1) {
!!#        IJ_printf ("diag.j", 396, th_evnt, "\twr      %%r0, 0x1, %%asr26\n");
!!#      } else {
!!#        IJ_printf ("diag.j", 398, th_evnt, "\twr      %%r0, 0x5, %%asr26\n");
!!#      }
!!# }
!!# ;
!!# 
!!# fpdis: mMETAfpdis
!!# {
!!#   IJ_printf ("diag.j", 405, th_evnt, "        wr %%g0, 0x4, %%fprs\n");
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
!!#      IJ_printf ("diag.j", 470, th_evnt, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#      IJ_printf ("diag.j", 471, th_evnt, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(%y, 3, 1)\n", intr_cnt);
!!#      if (random () % 2 == 1) {
!!#        IJ_printf ("diag.j", 473, th_evnt, "\twr      %%r0, 0x0, %%asr26\n");
!!#      } else {
!!#        IJ_printf ("diag.j", 475, th_evnt, "\twr      %%r0, 0x4, %%asr26\n");
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

