// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug4267.s
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
   random seed:	617919921
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
        setx  0x0000000000000f00, %g1, %r17
        setx  0x29d27bd58f4ed612, %g1, %r0
        setx  0x4b57ea498732b5db, %g1, %r1
        setx  0xf58de3ce86f60530, %g1, %r2
        setx  0x908908ee73180d97, %g1, %r3
        setx  0x5e403916db58e581, %g1, %r4
        setx  0xd6bcd59892482010, %g1, %r5
        setx  0x3b813a8d9d3146c7, %g1, %r6
        setx  0x09606481a590b4dd, %g1, %r7
        setx  0x137e4dc01bba0090, %g1, %r8
        setx  0x40dd11205bf2cba1, %g1, %r9
        setx  0x26ab397b03c8608a, %g1, %r10
        setx  0xbf2131b242fea4a0, %g1, %r11
        setx  0xca3b65623d62dcd6, %g1, %r12
        setx  0xd3d0f25a703f1a8c, %g1, %r13
        setx  0x612d70034be2e04f, %g1, %r14
        setx  0xffc030b901676bb5, %g1, %r15
        setx  0x2b0cb47a05646143, %g1, %r18
        setx  0x72b75df4ffcfcebe, %g1, %r19
        setx  0x6a4f612e26f9444c, %g1, %r20
        setx  0xac4ec31c84687721, %g1, %r21
        setx  0x625affcceab44dcf, %g1, %r22
        setx  0xf088563330f34746, %g1, %r23
        setx  0xb735e82d5082e284, %g1, %r24
        setx  0xc0c58ebb020b38d4, %g1, %r25
        setx  0xfad6a64c4efdf9e9, %g1, %r26
        setx  0x0a579ef61ff74b08, %g1, %r27
        setx  0x0a64f6dd5f86afc4, %g1, %r28
        setx  0xf7c4a541cf49d72b, %g1, %r29
        setx  0x01983ece7fcd3dbd, %g1, %r30
        setx  0xd08537c71e3cfa7e, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000ac0, %g1, %r17
        setx  0x58f7b704fed648b2, %g1, %r0
        setx  0xc944b5c211521116, %g1, %r1
        setx  0xa44f8773b69536c4, %g1, %r2
        setx  0x99e18b423f4dc26e, %g1, %r3
        setx  0xe19cfe9f6dab614d, %g1, %r4
        setx  0x31c561de38984d41, %g1, %r5
        setx  0x3d49e1fb239c74b4, %g1, %r6
        setx  0xdd304bf50b5b1c9e, %g1, %r7
        setx  0xdd408c3725d935b0, %g1, %r8
        setx  0x0428f9037559afab, %g1, %r9
        setx  0x1efe3822a52ac2d4, %g1, %r10
        setx  0xe401d91861f72292, %g1, %r11
        setx  0x4bf4b8142100ea47, %g1, %r12
        setx  0xd6aa5ca96d4e7ea2, %g1, %r13
        setx  0x7b17937b84594596, %g1, %r14
        setx  0x2ac55e5bb7ab37ef, %g1, %r15
        setx  0x4cd1b9f17a40e171, %g1, %r18
        setx  0x14a0e4792743789c, %g1, %r19
        setx  0xaf96720411ea2f55, %g1, %r20
        setx  0xef629e304ae3f831, %g1, %r21
        setx  0x542684d8f2155b02, %g1, %r22
        setx  0xf2318c796a7149a5, %g1, %r23
        setx  0xd100e181e02f6768, %g1, %r24
        setx  0xc5f1aba9917118bc, %g1, %r25
        setx  0x4675b452df0c09e6, %g1, %r26
        setx  0x26302042b6be4e05, %g1, %r27
        setx  0x3ee3e8a85164aa13, %g1, %r28
        setx  0xd8754fe54a38fb90, %g1, %r29
        setx  0x76392b255941d095, %g1, %r30
        setx  0x6a0530999b38150c, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000800, %g1, %r17
        setx  0xa25c740a9a72d5aa, %g1, %r0
        setx  0x24839a948435b053, %g1, %r1
        setx  0xd80ca401aade4e20, %g1, %r2
        setx  0x0b985321e282aeae, %g1, %r3
        setx  0x8f299c7c98a88099, %g1, %r4
        setx  0x4704825baee56af8, %g1, %r5
        setx  0xfda4c6994be4c056, %g1, %r6
        setx  0x50256063c58cfde5, %g1, %r7
        setx  0x5aef190a044ba6a2, %g1, %r8
        setx  0x4970a48d79bbcdd5, %g1, %r9
        setx  0xf3b1059ff68faef7, %g1, %r10
        setx  0x1a8fe7f2d20246b4, %g1, %r11
        setx  0x6a7e9cb7b975f247, %g1, %r12
        setx  0x357238dad093c33b, %g1, %r13
        setx  0x9893a5bdeffd0d1c, %g1, %r14
        setx  0xbce603b2e7a97484, %g1, %r15
        setx  0xe5940d479e93b3e0, %g1, %r18
        setx  0x23fb0a8b19e3b64f, %g1, %r19
        setx  0xa1ae62e42c87dd50, %g1, %r20
        setx  0x30ca0aa5939a1c22, %g1, %r21
        setx  0xa5c7807cc2a2d4a3, %g1, %r22
        setx  0x5d119fcd6bb71027, %g1, %r23
        setx  0x3b5038a3f7da4faa, %g1, %r24
        setx  0x52a9ac4b93b3a6cb, %g1, %r25
        setx  0x8f9aa8616cb562ec, %g1, %r26
        setx  0xef19906ddcb9590e, %g1, %r27
        setx  0x807ac7167e72569b, %g1, %r28
        setx  0xc5d7029d77c6b0f6, %g1, %r29
        setx  0x695d86038b4f54e3, %g1, %r30
        setx  0x1fdf1ed6c5041fa8, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000b30, %g1, %r17
        setx  0x86d51acabdb57e67, %g1, %r0
        setx  0x63a7c8896160b2bd, %g1, %r1
        setx  0xf43153136409763f, %g1, %r2
        setx  0xdf925629648a8b09, %g1, %r3
        setx  0x4426790a121b5ba0, %g1, %r4
        setx  0x0d5be74bb4bb10f8, %g1, %r5
        setx  0x3119a901861755e9, %g1, %r6
        setx  0x47ad26a97d9eeeea, %g1, %r7
        setx  0xed9888344197926d, %g1, %r8
        setx  0x3072a5622dd1da01, %g1, %r9
        setx  0xf87d74dbf32ff41f, %g1, %r10
        setx  0xb8cf0e1725f8b1ef, %g1, %r11
        setx  0x444cd47093081b5b, %g1, %r12
        setx  0xb10b546fcd28777f, %g1, %r13
        setx  0xcf1ec9844782703e, %g1, %r14
        setx  0xad34609a2927ed77, %g1, %r15
        setx  0xacc17a25a9eabadc, %g1, %r18
        setx  0x8f03e49d8c7990c8, %g1, %r19
        setx  0x442ee1da33d1533f, %g1, %r20
        setx  0xa6c9a515a7968acc, %g1, %r21
        setx  0xcfffaae498ebb6b4, %g1, %r22
        setx  0xbf28e27cf7413f6e, %g1, %r23
        setx  0xc521b121461f024e, %g1, %r24
        setx  0x95d37dc0096fbcdb, %g1, %r25
        setx  0xc9909e61a2de3c1a, %g1, %r26
        setx  0xca6a9d4a5bade880, %g1, %r27
        setx  0xaf2e6a93f0fb3b09, %g1, %r28
        setx  0xcbed27da2cad7071, %g1, %r29
        setx  0xb83707ac80e1bce9, %g1, %r30
        setx  0xb513ab9ceb9c121a, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000400, %g1, %r17
        setx  0x83ac0a32f24e615a, %g1, %r0
        setx  0xd6f0c198836e735d, %g1, %r1
        setx  0x9e5b3296987ceffa, %g1, %r2
        setx  0x329e21c64f2ac760, %g1, %r3
        setx  0x98548c646d1e4d7d, %g1, %r4
        setx  0xa41b6a2678c61857, %g1, %r5
        setx  0x68ee670060e63f9f, %g1, %r6
        setx  0x9325737b84f9547f, %g1, %r7
        setx  0x7dcd9cdff09990ce, %g1, %r8
        setx  0xacebc22248b87ccc, %g1, %r9
        setx  0x54fa401a8e3e5fc2, %g1, %r10
        setx  0xcf87dc7392745c1f, %g1, %r11
        setx  0xffeebf8f9c29c741, %g1, %r12
        setx  0x2c3ef836fd9b95cf, %g1, %r13
        setx  0x3964cc10ed6f8004, %g1, %r14
        setx  0x766731dc9c5fce9d, %g1, %r15
        setx  0xb8c62cd64e029d52, %g1, %r18
        setx  0xb5120b866db4c604, %g1, %r19
        setx  0x556f761325f99c46, %g1, %r20
        setx  0xbfb9fc69c3dcfc85, %g1, %r21
        setx  0x0283f67cb08a7758, %g1, %r22
        setx  0xf6e2fe99f701af66, %g1, %r23
        setx  0xca5c048c6358d863, %g1, %r24
        setx  0x9f40a1a430389562, %g1, %r25
        setx  0x4be4118714f0b6f0, %g1, %r26
        setx  0x3cd1613eef1e15f5, %g1, %r27
        setx  0x48d8bf726287dfd5, %g1, %r28
        setx  0x893eb14fc834c89c, %g1, %r29
        setx  0xf037929112333465, %g1, %r30
        setx  0xa11e69983f73d490, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000a40, %g1, %r17
        setx  0x561f0ccea438e3bc, %g1, %r0
        setx  0x142b1325dcde96c6, %g1, %r1
        setx  0x08fffd821f71cb04, %g1, %r2
        setx  0xad416a0201c600c3, %g1, %r3
        setx  0x09d72c2b49cfb44c, %g1, %r4
        setx  0xfbcd5fd34b66afba, %g1, %r5
        setx  0xc042b85893092ff2, %g1, %r6
        setx  0x336ffbe3c9884945, %g1, %r7
        setx  0xb53cd5232f93fbb2, %g1, %r8
        setx  0x42bf9f8d74feab8e, %g1, %r9
        setx  0x2f2575ec9bd34dcf, %g1, %r10
        setx  0x97d4cd0a727d8169, %g1, %r11
        setx  0x0dbe08701213d6b7, %g1, %r12
        setx  0x815fa49c814b0182, %g1, %r13
        setx  0xe199a17b028b2dff, %g1, %r14
        setx  0x3dfcada6b067ea75, %g1, %r15
        setx  0xe895610769685742, %g1, %r18
        setx  0xd07e5062b1bedaca, %g1, %r19
        setx  0xca948e7c78b389de, %g1, %r20
        setx  0x1c21f605a9d11829, %g1, %r21
        setx  0xa890b4c882d5e1e5, %g1, %r22
        setx  0xce5cdb9d5b3afa68, %g1, %r23
        setx  0xb790590e490d3dcd, %g1, %r24
        setx  0xd641dcc55bffd62e, %g1, %r25
        setx  0x94fb5a1ecdf71938, %g1, %r26
        setx  0xe62b0a0a6609531b, %g1, %r27
        setx  0x3c94cd3d7be7433c, %g1, %r28
        setx  0x87b63984ae62edfe, %g1, %r29
        setx  0x40514f1e58f40416, %g1, %r30
        setx  0xb3b551fc2ed66fd8, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000550, %g1, %r17
        setx  0x6bcbf0e4d1461971, %g1, %r0
        setx  0xbb2f042774a7a6e6, %g1, %r1
        setx  0x5bda2d52293c8a03, %g1, %r2
        setx  0xe977d8b94602022a, %g1, %r3
        setx  0x6ee304f992956fdf, %g1, %r4
        setx  0xd3fa83b774de48bf, %g1, %r5
        setx  0x35a659ebcf88e203, %g1, %r6
        setx  0x88733e380e2dac2a, %g1, %r7
        setx  0x6b92a89ca1156286, %g1, %r8
        setx  0x6d9ec1e9f5c94489, %g1, %r9
        setx  0x8dbec023e02ac55a, %g1, %r10
        setx  0xaa4022f502fc13f0, %g1, %r11
        setx  0x3f01ce33f6c8920b, %g1, %r12
        setx  0x6299112b42012d55, %g1, %r13
        setx  0xf30aa0ee94ea6d49, %g1, %r14
        setx  0xa9e3bb385d3d5aea, %g1, %r15
        setx  0x706e75a5625372a5, %g1, %r18
        setx  0xe203ce8fe77df751, %g1, %r19
        setx  0x3ae2513d78ae3058, %g1, %r20
        setx  0x447d69704f9c5583, %g1, %r21
        setx  0xabb3c6b9528bc9b6, %g1, %r22
        setx  0xe5f8c81657bdc70f, %g1, %r23
        setx  0x97ca5c6889431f8d, %g1, %r24
        setx  0x95edd6d3589d17c3, %g1, %r25
        setx  0xebf325e31e4e9f7d, %g1, %r26
        setx  0x774c0c7b510e72eb, %g1, %r27
        setx  0x95180b76bf7e5e7c, %g1, %r28
        setx  0x2dbb9503f13c4437, %g1, %r29
        setx  0x35534641411327ed, %g1, %r30
        setx  0x4c3552c20f9a1294, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000008e0, %g1, %r17
        setx  0xb79f0d715fe70e40, %g1, %r0
        setx  0x652bda59c8ea4553, %g1, %r1
        setx  0xdefab1a43b919e21, %g1, %r2
        setx  0x6e97d0c5c12f58c0, %g1, %r3
        setx  0x3e3e3db97bf60aa1, %g1, %r4
        setx  0xa87cc71acd60c174, %g1, %r5
        setx  0x1e34e6c4cd691431, %g1, %r6
        setx  0x240d3482c99e6780, %g1, %r7
        setx  0x36de52f43fce7390, %g1, %r8
        setx  0x561ba46c0e4e4daf, %g1, %r9
        setx  0xe085cec744b8347a, %g1, %r10
        setx  0x342b4cc126a4364c, %g1, %r11
        setx  0x1c7ee5bf9a1e9a5c, %g1, %r12
        setx  0x4c7ce5b0e5b9230f, %g1, %r13
        setx  0x35392830718c52b9, %g1, %r14
        setx  0x007d78356fd91af4, %g1, %r15
        setx  0x64f870604680c29e, %g1, %r18
        setx  0x45f5ed80700776e8, %g1, %r19
        setx  0x47191d0c5420782e, %g1, %r20
        setx  0x5bc2d2a6629c95af, %g1, %r21
        setx  0xf0f6f0ed1c4a1ce6, %g1, %r22
        setx  0xd8eca78272c53dbf, %g1, %r23
        setx  0xac94ac4c02daa069, %g1, %r24
        setx  0x4aeb343e72c8686a, %g1, %r25
        setx  0xcee0f168a42d2c3c, %g1, %r26
        setx  0xd46135a5d920ef61, %g1, %r27
        setx  0x0f93cecac91f2eeb, %g1, %r28
        setx  0x98245586a9b155ed, %g1, %r29
        setx  0x9e0fde09c20bfd39, %g1, %r30
        setx  0x723f3e36c8fd9cf9, %g1, %r31
	save %r0, %r0, %r31
thr3_nuke_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_0), 16, 16)) -> intp(1, 2, 1)
	.word 0x892c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r4
	.word 0xa6342ed7  ! 1: ORN_I	orn 	%r16, 0x0ed7, %r19
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0xaa440011  ! 1: ADDC_R	addc 	%r16, %r17, %r21
	.word 0x96040011  ! 1: ADD_R	add 	%r16, %r17, %r11
thr3_nuke_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_2), 16, 16)) -> intp(1, 2, 1)
	.word 0xa884245f  ! 1: ADDcc_I	addcc 	%r16, 0x045f, %r20
	.word 0x88ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0xb1641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	.word 0xa73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r19
	.word 0xaf641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_4), 16, 16)) -> intp(1, 0, 1)
	.word 0xb8bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xb2442f60  ! 1: ADDC_I	addc 	%r16, 0x0f60, %r25
thr3_nuke_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_5), 16, 16)) -> intp(2, 2, 1)
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
thr3_resum_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_6), 16, 16)) -> intp(2, 3, 1)
	.word 0xab3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r21
	.word 0x980c2f9d  ! 1: AND_I	and 	%r16, 0x0f9d, %r12
thr3_nuke_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_7), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
thr3_resum_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_8), 16, 16)) -> intp(2, 3, 1)
	.word 0x9c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r14
thr3_nuke_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_9), 16, 16)) -> intp(1, 2, 1)
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x86940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r3
thr3_resum_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_10), 16, 16)) -> intp(1, 3, 1)
	.word 0x9e2c2dd9  ! 1: ANDN_I	andn 	%r16, 0x0dd9, %r15
	.word 0x85643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x843c2c47  ! 1: XNOR_I	xnor 	%r16, 0x0c47, %r2
	.word 0x9a9c21d1  ! 1: XORcc_I	xorcc 	%r16, 0x01d1, %r13
thr3_hw_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_11), 16, 16)) -> intp(2, 0, 1)
	.word 0x96b42518  ! 1: ORNcc_I	orncc 	%r16, 0x0518, %r11
thr3_nuke_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_12), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a3428f4  ! 1: ORN_I	orn 	%r16, 0x08f4, %r13
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
thr3_resum_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_13), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa0c0011  ! 1: AND_R	and 	%r16, %r17, %r21
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_14), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r21
thr3_nuke_intr_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_15), 16, 16)) -> intp(2, 2, 1)
	.word 0x95342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r10
thr3_resum_intr_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_16), 16, 16)) -> intp(2, 3, 1)
	.word 0x8b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r5
thr3_nuke_intr_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_17), 16, 16)) -> intp(0, 2, 1)
	.word 0xaebc2d51  ! 1: XNORcc_I	xnorcc 	%r16, 0x0d51, %r23
thr3_resum_intr_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_18), 16, 16)) -> intp(0, 3, 1)
	.word 0x880c0011  ! 1: AND_R	and 	%r16, %r17, %r4
thr3_nuke_intr_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_19), 16, 16)) -> intp(1, 2, 1)
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x8c342633  ! 1: ORN_I	orn 	%r16, 0x0633, %r6
thr3_resum_intr_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_20), 16, 16)) -> intp(1, 3, 1)
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x8f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r7
	.word 0xa83420ab  ! 1: ORN_I	orn 	%r16, 0x00ab, %r20
thr3_nuke_intr_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_21), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x9a340011  ! 1: ORN_R	orn 	%r16, %r17, %r13
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x9d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r14
thr3_resum_intr_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_22), 16, 16)) -> intp(1, 3, 1)
	.word 0x997c2401  ! 1: MOVR_I	move	%r16, 0x11, %r12
thr3_hw_intr_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_23), 16, 16)) -> intp(0, 0, 1)
	.word 0x922c2132  ! 1: ANDN_I	andn 	%r16, 0x0132, %r9
	.word 0x902c2f25  ! 1: ANDN_I	andn 	%r16, 0x0f25, %r8
	.word 0xaf343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0x9c0c2d4f  ! 1: AND_I	and 	%r16, 0x0d4f, %r14
thr3_hw_intr_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_24), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e042b95  ! 1: ADD_I	add 	%r16, 0x0b95, %r7
	.word 0xb28c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r25
thr3_hw_intr_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_25), 16, 16)) -> intp(2, 0, 1)
	.word 0xab343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r21
thr3_nuke_intr_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_26), 16, 16)) -> intp(0, 2, 1)
	.word 0xad7c0411  ! 1: MOVR_R	move	%r16, %r17, %r22
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
	.word 0x908c2753  ! 1: ANDcc_I	andcc 	%r16, 0x0753, %r8
thr3_resum_intr_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_27), 16, 16)) -> intp(0, 3, 1)
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x94c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0xb40c0011  ! 1: AND_R	and 	%r16, %r17, %r26
	.word 0x880c2335  ! 1: AND_I	and 	%r16, 0x0335, %r4
thr3_nuke_intr_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_28), 16, 16)) -> intp(1, 2, 1)
	.word 0xba1c2445  ! 1: XOR_I	xor 	%r16, 0x0445, %r29
thr3_resum_intr_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_29), 16, 16)) -> intp(1, 3, 1)
	.word 0x900c0011  ! 1: AND_R	and 	%r16, %r17, %r8
	.word 0x993c1011  ! 1: SRAX_R	srax	%r16, %r17, %r12
thr3_hw_intr_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_30), 16, 16)) -> intp(2, 0, 1)
	.word 0x82142d54  ! 1: OR_I	or 	%r16, 0x0d54, %r1
thr3_nuke_intr_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_31), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
thr3_resum_intr_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_32), 16, 16)) -> intp(2, 3, 1)
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0xb9641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb4bc2a5b  ! 1: XNORcc_I	xnorcc 	%r16, 0x0a5b, %r26
	.word 0xbabc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r29
thr3_nuke_intr_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_33), 16, 16)) -> intp(1, 2, 1)
	.word 0x98142334  ! 1: OR_I	or 	%r16, 0x0334, %r12
	.word 0x8c140011  ! 1: OR_R	or 	%r16, %r17, %r6
	.word 0xb4bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r26
thr3_resum_intr_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_34), 16, 16)) -> intp(1, 3, 1)
	.word 0xba042a34  ! 1: ADD_I	add 	%r16, 0x0a34, %r29
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
	.word 0xac9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0x90ac209a  ! 1: ANDNcc_I	andncc 	%r16, 0x009a, %r8
thr3_hw_intr_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_35), 16, 16)) -> intp(2, 0, 1)
	.word 0xb7643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_36), 16, 16)) -> intp(2, 2, 1)
	.word 0x952c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0xb4140011  ! 1: OR_R	or 	%r16, %r17, %r26
	.word 0xb81c23d1  ! 1: XOR_I	xor 	%r16, 0x03d1, %r28
thr3_resum_intr_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_37), 16, 16)) -> intp(2, 3, 1)
	.word 0x84b42d01  ! 1: ORNcc_I	orncc 	%r16, 0x0d01, %r2
thr3_hw_intr_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_38), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r14
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
	.word 0x8a04225c  ! 1: ADD_I	add 	%r16, 0x025c, %r5
thr3_hw_intr_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_39), 16, 16)) -> intp(0, 0, 1)
	.word 0xb72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xb77c2401  ! 1: MOVR_I	move	%r16, 0x1, %r27
	.word 0xa97c2401  ! 1: MOVR_I	move	%r16, 0x1, %r20
thr3_nuke_intr_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_40), 16, 16)) -> intp(2, 2, 1)
	.word 0xb32c0011  ! 1: SLL_R	sll 	%r16, %r17, %r25
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
thr3_resum_intr_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_41), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x8b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0xa62c2db5  ! 1: ANDN_I	andn 	%r16, 0x0db5, %r19
thr3_hw_intr_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_42), 16, 16)) -> intp(1, 0, 1)
	.word 0xb89c200b  ! 1: XORcc_I	xorcc 	%r16, 0x000b, %r28
	.word 0xb9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r28
thr3_nuke_intr_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_43), 16, 16)) -> intp(2, 2, 1)
	.word 0xb88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r28
	.word 0xa6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r19
thr3_resum_intr_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_44), 16, 16)) -> intp(2, 3, 1)
	.word 0x828c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0xb13c0011  ! 1: SRA_R	sra 	%r16, %r17, %r24
	.word 0x837c0411  ! 1: MOVR_R	move	%r16, %r17, %r1
	.word 0x9f7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r15
thr3_nuke_intr_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_45), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4042676  ! 1: ADD_I	add 	%r16, 0x0676, %r26
	.word 0x8eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0xba942c30  ! 1: ORcc_I	orcc 	%r16, 0x0c30, %r29
thr3_resum_intr_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_46), 16, 16)) -> intp(0, 3, 1)
	.word 0xba0c0011  ! 1: AND_R	and 	%r16, %r17, %r29
thr3_nuke_intr_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_47), 16, 16)) -> intp(0, 2, 1)
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x9eb4218c  ! 1: ORNcc_I	orncc 	%r16, 0x018c, %r15
	.word 0xb73c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r27
thr3_resum_intr_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_48), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r7
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
	.word 0x843c2efd  ! 1: XNOR_I	xnor 	%r16, 0x0efd, %r2
thr3_nuke_intr_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_49), 16, 16)) -> intp(2, 2, 1)
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
	.word 0xac44239d  ! 1: ADDC_I	addc 	%r16, 0x039d, %r22
	.word 0xab3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r21
	.word 0xb2bc2626  ! 1: XNORcc_I	xnorcc 	%r16, 0x0626, %r25
thr3_resum_intr_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_50), 16, 16)) -> intp(2, 3, 1)
	.word 0x9c8c245a  ! 1: ANDcc_I	andcc 	%r16, 0x045a, %r14
	.word 0xac1c28ab  ! 1: XOR_I	xor 	%r16, 0x08ab, %r22
	.word 0xae440011  ! 1: ADDC_R	addc 	%r16, %r17, %r23
	.word 0x9c340011  ! 1: ORN_R	orn 	%r16, %r17, %r14
thr3_hw_intr_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_51), 16, 16)) -> intp(2, 0, 1)
	.word 0x86442cbe  ! 1: ADDC_I	addc 	%r16, 0x0cbe, %r3
	.word 0x95341011  ! 1: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x86440011  ! 1: ADDC_R	addc 	%r16, %r17, %r3
	.word 0xb23c246c  ! 1: XNOR_I	xnor 	%r16, 0x046c, %r25
thr3_hw_intr_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_52), 16, 16)) -> intp(2, 0, 1)
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0xa77c0411  ! 1: MOVR_R	move	%r16, %r17, %r19
	.word 0x88440011  ! 1: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x8f340011  ! 1: SRL_R	srl 	%r16, %r17, %r7
thr3_hw_intr_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_53), 16, 16)) -> intp(2, 0, 1)
	.word 0x8a0c0011  ! 1: AND_R	and 	%r16, %r17, %r5
thr3_hw_intr_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_54), 16, 16)) -> intp(1, 0, 1)
	.word 0x86942670  ! 1: ORcc_I	orcc 	%r16, 0x0670, %r3
thr3_nuke_intr_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_55), 16, 16)) -> intp(0, 2, 1)
	.word 0xb2442789  ! 1: ADDC_I	addc 	%r16, 0x0789, %r25
thr3_resum_intr_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_56), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e3c257b  ! 1: XNOR_I	xnor 	%r16, 0x057b, %r7
	.word 0x9ac42467  ! 1: ADDCcc_I	addccc 	%r16, 0x0467, %r13
	.word 0x868c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xb12c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r24
thr3_nuke_intr_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_57), 16, 16)) -> intp(0, 2, 1)
	.word 0x8cc4244b  ! 1: ADDCcc_I	addccc 	%r16, 0x044b, %r6
	.word 0x96842039  ! 1: ADDcc_I	addcc 	%r16, 0x0039, %r11
	.word 0xaa3c2496  ! 1: XNOR_I	xnor 	%r16, 0x0496, %r21
thr3_resum_intr_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_58), 16, 16)) -> intp(0, 3, 1)
	.word 0x86940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0xad341011  ! 1: SRLX_R	srlx	%r16, %r17, %r22
thr3_hw_intr_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_59), 16, 16)) -> intp(0, 0, 1)
	.word 0x8c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xac9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r22
thr3_hw_intr_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_60), 16, 16)) -> intp(2, 0, 1)
	.word 0xaa8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0xacac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0x8d643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r27
thr3_hw_intr_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_61), 16, 16)) -> intp(2, 0, 1)
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
	.word 0xb0b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
thr3_hw_intr_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_62), 16, 16)) -> intp(2, 0, 1)
	.word 0x86c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x840c2967  ! 1: AND_I	and 	%r16, 0x0967, %r2
thr3_hw_intr_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_63), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
	.word 0x962c2a2c  ! 1: ANDN_I	andn 	%r16, 0x0a2c, %r11
thr3_nuke_intr_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_64), 16, 16)) -> intp(2, 2, 1)
	.word 0x900c0011  ! 1: AND_R	and 	%r16, %r17, %r8
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0xb8842546  ! 1: ADDcc_I	addcc 	%r16, 0x0546, %r28
thr3_resum_intr_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_65), 16, 16)) -> intp(2, 3, 1)
	.word 0x84042eab  ! 1: ADD_I	add 	%r16, 0x0eab, %r2
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
thr3_hw_intr_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_66), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e3c2cbb  ! 1: XNOR_I	xnor 	%r16, 0x0cbb, %r7
	.word 0x8644292c  ! 1: ADDC_I	addc 	%r16, 0x092c, %r3
	.word 0x9cc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
thr3_nuke_intr_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_67), 16, 16)) -> intp(1, 2, 1)
	.word 0xb43427f2  ! 1: ORN_I	orn 	%r16, 0x07f2, %r26
	.word 0x917c0411  ! 1: MOVR_R	move	%r16, %r17, %r8
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
thr3_resum_intr_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_68), 16, 16)) -> intp(1, 3, 1)
	.word 0x86940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0xb12c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
thr3_nuke_intr_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_69), 16, 16)) -> intp(2, 2, 1)
	.word 0x90040011  ! 1: ADD_R	add 	%r16, %r17, %r8
	.word 0xb93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r28
	.word 0x8c04234b  ! 1: ADD_I	add 	%r16, 0x034b, %r6
thr3_resum_intr_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_70), 16, 16)) -> intp(2, 3, 1)
	.word 0x953c0011  ! 1: SRA_R	sra 	%r16, %r17, %r10
	.word 0xae2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r23
	.word 0x8ac4252b  ! 1: ADDCcc_I	addccc 	%r16, 0x052b, %r5
thr3_nuke_intr_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_71), 16, 16)) -> intp(1, 2, 1)
	.word 0x941c2d40  ! 1: XOR_I	xor 	%r16, 0x0d40, %r10
	.word 0x8d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r6
thr3_resum_intr_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_72), 16, 16)) -> intp(1, 3, 1)
	.word 0x8b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r5
thr3_hw_intr_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_73), 16, 16)) -> intp(0, 0, 1)
	.word 0x93342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0xb6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0xa8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r20
thr3_nuke_intr_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_74), 16, 16)) -> intp(2, 2, 1)
	.word 0x98042ce6  ! 1: ADD_I	add 	%r16, 0x0ce6, %r12
thr3_resum_intr_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_75), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
thr3_nuke_intr_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_76), 16, 16)) -> intp(0, 2, 1)
	.word 0x8c9c204b  ! 1: XORcc_I	xorcc 	%r16, 0x004b, %r6
	.word 0xa6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0xb6342081  ! 1: ORN_I	orn 	%r16, 0x0081, %r27
	.word 0x9414270e  ! 1: OR_I	or 	%r16, 0x070e, %r10
thr3_resum_intr_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_77), 16, 16)) -> intp(0, 3, 1)
	.word 0xa77c0411  ! 1: MOVR_R	move	%r16, %r17, %r19
thr3_hw_intr_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_78), 16, 16)) -> intp(0, 0, 1)
	.word 0xb01c2fe2  ! 1: XOR_I	xor 	%r16, 0x0fe2, %r24
thr3_hw_intr_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_79), 16, 16)) -> intp(1, 0, 1)
	.word 0x93342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x86942e4d  ! 1: ORcc_I	orcc 	%r16, 0x0e4d, %r3
	.word 0x8f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r7
thr3_nuke_intr_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_80), 16, 16)) -> intp(1, 2, 1)
	.word 0xb72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xb20c29cc  ! 1: AND_I	and 	%r16, 0x09cc, %r25
thr3_resum_intr_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_81), 16, 16)) -> intp(1, 3, 1)
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0xab340011  ! 1: SRL_R	srl 	%r16, %r17, %r21
thr3_nuke_intr_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_82), 16, 16)) -> intp(0, 2, 1)
	.word 0x8c140011  ! 1: OR_R	or 	%r16, %r17, %r6
	.word 0x949c2ff1  ! 1: XORcc_I	xorcc 	%r16, 0x0ff1, %r10
	.word 0xa9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r20
thr3_resum_intr_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_83), 16, 16)) -> intp(0, 3, 1)
	.word 0x8d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r6
thr3_nuke_intr_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_84), 16, 16)) -> intp(0, 2, 1)
	.word 0x989c20b3  ! 1: XORcc_I	xorcc 	%r16, 0x00b3, %r12
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
thr3_resum_intr_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_85), 16, 16)) -> intp(0, 3, 1)
	.word 0x942c26f2  ! 1: ANDN_I	andn 	%r16, 0x06f2, %r10
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
thr3_nuke_intr_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_86), 16, 16)) -> intp(2, 2, 1)
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0xb5641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x90940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r8
thr3_resum_intr_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_87), 16, 16)) -> intp(2, 3, 1)
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x90b42e27  ! 1: ORNcc_I	orncc 	%r16, 0x0e27, %r8
thr3_nuke_intr_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_88), 16, 16)) -> intp(2, 2, 1)
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
	.word 0xba0c0011  ! 1: AND_R	and 	%r16, %r17, %r29
	.word 0x8c442b59  ! 1: ADDC_I	addc 	%r16, 0x0b59, %r6
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
thr3_resum_intr_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_89), 16, 16)) -> intp(2, 3, 1)
	.word 0xb12c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
thr3_hw_intr_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_90), 16, 16)) -> intp(0, 0, 1)
	.word 0x821c2efc  ! 1: XOR_I	xor 	%r16, 0x0efc, %r1
thr3_nuke_intr_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_91), 16, 16)) -> intp(0, 2, 1)
	.word 0xae440011  ! 1: ADDC_R	addc 	%r16, %r17, %r23
	.word 0x84142cf8  ! 1: OR_I	or 	%r16, 0x0cf8, %r2
	.word 0xb0bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r24
thr3_resum_intr_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_92), 16, 16)) -> intp(0, 3, 1)
	.word 0xb884211e  ! 1: ADDcc_I	addcc 	%r16, 0x011e, %r28
	.word 0xb28c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r25
	.word 0xa6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r19
thr3_hw_intr_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_93), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a040011  ! 1: ADD_R	add 	%r16, %r17, %r5
	.word 0x8d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r6
	.word 0xb0140011  ! 1: OR_R	or 	%r16, %r17, %r24
thr3_hw_intr_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_94), 16, 16)) -> intp(2, 0, 1)
	.word 0x9c0c0011  ! 1: AND_R	and 	%r16, %r17, %r14
	.word 0x9eb4246c  ! 1: ORNcc_I	orncc 	%r16, 0x046c, %r15
	.word 0x8a9c29a1  ! 1: XORcc_I	xorcc 	%r16, 0x09a1, %r5
thr3_hw_intr_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_95), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb7c0411  ! 1: MOVR_R	move	%r16, %r17, %r29
	.word 0x8c0c2f27  ! 1: AND_I	and 	%r16, 0x0f27, %r6
	.word 0xae2c2591  ! 1: ANDN_I	andn 	%r16, 0x0591, %r23
	.word 0x9e442bb1  ! 1: ADDC_I	addc 	%r16, 0x0bb1, %r15
thr3_hw_intr_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_96), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
	.word 0x8c34202f  ! 1: ORN_I	orn 	%r16, 0x002f, %r6
	.word 0x82bc2c8a  ! 1: XNORcc_I	xnorcc 	%r16, 0x0c8a, %r1
thr3_nuke_intr_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_97), 16, 16)) -> intp(1, 2, 1)
	.word 0x9f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r15
	.word 0x840c0011  ! 1: AND_R	and 	%r16, %r17, %r2
thr3_resum_intr_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_98), 16, 16)) -> intp(1, 3, 1)
	.word 0x84340011  ! 1: ORN_R	orn 	%r16, %r17, %r2
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
	.word 0x980c235b  ! 1: AND_I	and 	%r16, 0x035b, %r12
thr3_hw_intr_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_99), 16, 16)) -> intp(1, 0, 1)
	.word 0xb0ac2710  ! 1: ANDNcc_I	andncc 	%r16, 0x0710, %r24
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
	.word 0x993c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r12
thr3_hw_intr_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_100), 16, 16)) -> intp(2, 0, 1)
	.word 0x848c284e  ! 1: ANDcc_I	andcc 	%r16, 0x084e, %r2
thr3_nuke_intr_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_101), 16, 16)) -> intp(0, 2, 1)
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
thr3_resum_intr_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_102), 16, 16)) -> intp(0, 3, 1)
	.word 0x95641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x88140011  ! 1: OR_R	or 	%r16, %r17, %r4
	.word 0x82442a80  ! 1: ADDC_I	addc 	%r16, 0x0a80, %r1
thr3_hw_intr_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_103), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
	.word 0x8e3425b4  ! 1: ORN_I	orn 	%r16, 0x05b4, %r7
	.word 0x8eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r7
thr3_hw_intr_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_104), 16, 16)) -> intp(0, 0, 1)
	.word 0xb13c1011  ! 1: SRAX_R	srax	%r16, %r17, %r24
thr3_nuke_intr_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_105), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x96bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0xaf643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xac040011  ! 1: ADD_R	add 	%r16, %r17, %r22
thr3_resum_intr_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_106), 16, 16)) -> intp(0, 3, 1)
	.word 0xb7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0x9c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r14
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
thr3_hw_intr_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_107), 16, 16)) -> intp(2, 0, 1)
	.word 0x93340011  ! 1: SRL_R	srl 	%r16, %r17, %r9
thr3_hw_intr_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_108), 16, 16)) -> intp(0, 0, 1)
	.word 0xa92c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r20
	.word 0x9b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r13
	.word 0xb22c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r25
thr3_hw_intr_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_109), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa8c232c  ! 1: ANDcc_I	andcc 	%r16, 0x032c, %r21
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
	.word 0xb6b42dd2  ! 1: ORNcc_I	orncc 	%r16, 0x0dd2, %r27
thr3_hw_intr_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_110), 16, 16)) -> intp(1, 0, 1)
	.word 0xad3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0x98ac2df0  ! 1: ANDNcc_I	andncc 	%r16, 0x0df0, %r12
	.word 0x9cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r14
thr3_hw_intr_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_111), 16, 16)) -> intp(1, 0, 1)
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
	.word 0x9a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x9c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r14
thr3_hw_intr_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_112), 16, 16)) -> intp(2, 0, 1)
	.word 0xaf340011  ! 1: SRL_R	srl 	%r16, %r17, %r23
	.word 0x94940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r10
thr3_hw_intr_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_113), 16, 16)) -> intp(2, 0, 1)
	.word 0x9cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0xb93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xba3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0xb68c26bf  ! 1: ANDcc_I	andcc 	%r16, 0x06bf, %r27
thr3_nuke_intr_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_114), 16, 16)) -> intp(2, 2, 1)
	.word 0x889c2859  ! 1: XORcc_I	xorcc 	%r16, 0x0859, %r4
	.word 0x9c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r14
	.word 0xb43c2c77  ! 1: XNOR_I	xnor 	%r16, 0x0c77, %r26
thr3_resum_intr_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_115), 16, 16)) -> intp(2, 3, 1)
	.word 0x892c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r4
	.word 0xb89425a2  ! 1: ORcc_I	orcc 	%r16, 0x05a2, %r28
	.word 0x872c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r3
thr3_nuke_intr_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_116), 16, 16)) -> intp(1, 2, 1)
	.word 0xa6042732  ! 1: ADD_I	add 	%r16, 0x0732, %r19
thr3_resum_intr_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_117), 16, 16)) -> intp(1, 3, 1)
	.word 0x9a1c25cb  ! 1: XOR_I	xor 	%r16, 0x05cb, %r13
thr3_hw_intr_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_118), 16, 16)) -> intp(1, 0, 1)
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
	.word 0xa7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r19
thr3_nuke_intr_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_119), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a042cf9  ! 1: ADD_I	add 	%r16, 0x0cf9, %r13
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
thr3_resum_intr_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_120), 16, 16)) -> intp(1, 3, 1)
	.word 0xa92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0x8a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0xb6340011  ! 1: ORN_R	orn 	%r16, %r17, %r27
	.word 0x969c24a5  ! 1: XORcc_I	xorcc 	%r16, 0x04a5, %r11
thr3_nuke_intr_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_121), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
thr3_resum_intr_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_122), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c2c20c6  ! 1: ANDN_I	andn 	%r16, 0x00c6, %r6
	.word 0x88040011  ! 1: ADD_R	add 	%r16, %r17, %r4
	.word 0x8c9c2d06  ! 1: XORcc_I	xorcc 	%r16, 0x0d06, %r6
thr3_hw_intr_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_123), 16, 16)) -> intp(1, 0, 1)
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
thr3_nuke_intr_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_124), 16, 16)) -> intp(2, 2, 1)
	.word 0xb9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0xa8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r20
	.word 0x86142c1d  ! 1: OR_I	or 	%r16, 0x0c1d, %r3
	.word 0x9c140011  ! 1: OR_R	or 	%r16, %r17, %r14
thr3_resum_intr_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_125), 16, 16)) -> intp(2, 3, 1)
	.word 0x9cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0xb3641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_126), 16, 16)) -> intp(0, 0, 1)
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
	.word 0x8abc2355  ! 1: XNORcc_I	xnorcc 	%r16, 0x0355, %r5
thr3_nuke_intr_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_127), 16, 16)) -> intp(1, 2, 1)
	.word 0x9ebc2fa1  ! 1: XNORcc_I	xnorcc 	%r16, 0x0fa1, %r15
thr3_resum_intr_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_128), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r23
	.word 0x923c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r9
thr3_hw_intr_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_129), 16, 16)) -> intp(0, 0, 1)
	.word 0x90b42246  ! 1: ORNcc_I	orncc 	%r16, 0x0246, %r8
thr3_hw_intr_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_130), 16, 16)) -> intp(0, 0, 1)
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
	.word 0xb8c42e93  ! 1: ADDCcc_I	addccc 	%r16, 0x0e93, %r28
	.word 0xb8042068  ! 1: ADD_I	add 	%r16, 0x0068, %r28
thr3_hw_intr_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_131), 16, 16)) -> intp(2, 0, 1)
	.word 0xb4c421d9  ! 1: ADDCcc_I	addccc 	%r16, 0x01d9, %r26
thr3_nuke_intr_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_132), 16, 16)) -> intp(0, 2, 1)
	.word 0x84bc2c23  ! 1: XNORcc_I	xnorcc 	%r16, 0x0c23, %r2
	.word 0x8cb42f6c  ! 1: ORNcc_I	orncc 	%r16, 0x0f6c, %r6
thr3_resum_intr_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_133), 16, 16)) -> intp(0, 3, 1)
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x900c2132  ! 1: AND_I	and 	%r16, 0x0132, %r8
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
thr3_hw_intr_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_134), 16, 16)) -> intp(1, 0, 1)
	.word 0xb88c2217  ! 1: ANDcc_I	andcc 	%r16, 0x0217, %r28
thr3_nuke_intr_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_135), 16, 16)) -> intp(2, 2, 1)
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0xb6bc29d8  ! 1: XNORcc_I	xnorcc 	%r16, 0x09d8, %r27
thr3_resum_intr_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_136), 16, 16)) -> intp(2, 3, 1)
	.word 0xb52c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0x8c0423a4  ! 1: ADD_I	add 	%r16, 0x03a4, %r6
	.word 0x8c8c2f52  ! 1: ANDcc_I	andcc 	%r16, 0x0f52, %r6
	.word 0x949c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r10
thr3_hw_intr_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_137), 16, 16)) -> intp(1, 0, 1)
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
thr3_hw_intr_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_138), 16, 16)) -> intp(2, 0, 1)
	.word 0xaa3c2c5d  ! 1: XNOR_I	xnor 	%r16, 0x0c5d, %r21
	.word 0x90340011  ! 1: ORN_R	orn 	%r16, %r17, %r8
thr3_hw_intr_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_139), 16, 16)) -> intp(0, 0, 1)
	.word 0xb41c2776  ! 1: XOR_I	xor 	%r16, 0x0776, %r26
	.word 0x901c22c9  ! 1: XOR_I	xor 	%r16, 0x02c9, %r8
thr3_nuke_intr_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_140), 16, 16)) -> intp(2, 2, 1)
	.word 0x9ac4211c  ! 1: ADDCcc_I	addccc 	%r16, 0x011c, %r13
thr3_resum_intr_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_141), 16, 16)) -> intp(2, 3, 1)
	.word 0x9c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x909c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0x8c842a03  ! 1: ADDcc_I	addcc 	%r16, 0x0a03, %r6
thr3_hw_intr_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_142), 16, 16)) -> intp(0, 0, 1)
	.word 0x90042c6f  ! 1: ADD_I	add 	%r16, 0x0c6f, %r8
	.word 0xbb341011  ! 1: SRLX_R	srlx	%r16, %r17, %r29
thr3_nuke_intr_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_143), 16, 16)) -> intp(0, 2, 1)
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x841c0011  ! 1: XOR_R	xor 	%r16, %r17, %r2
	.word 0x8eb42d5e  ! 1: ORNcc_I	orncc 	%r16, 0x0d5e, %r7
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
thr3_resum_intr_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_144), 16, 16)) -> intp(0, 3, 1)
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
thr3_hw_intr_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_145), 16, 16)) -> intp(1, 0, 1)
	.word 0xacc42a34  ! 1: ADDCcc_I	addccc 	%r16, 0x0a34, %r22
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x8c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0x963c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r11
thr3_nuke_intr_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_146), 16, 16)) -> intp(2, 2, 1)
	.word 0xaa9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r21
thr3_resum_intr_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_147), 16, 16)) -> intp(2, 3, 1)
	.word 0xb4940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0x8eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x98340011  ! 1: ORN_R	orn 	%r16, %r17, %r12
	.word 0x96940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r11
thr3_nuke_intr_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_148), 16, 16)) -> intp(0, 2, 1)
	.word 0x84ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0xac842a27  ! 1: ADDcc_I	addcc 	%r16, 0x0a27, %r22
thr3_resum_intr_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_149), 16, 16)) -> intp(0, 3, 1)
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
thr3_nuke_intr_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_150), 16, 16)) -> intp(1, 2, 1)
	.word 0x88142933  ! 1: OR_I	or 	%r16, 0x0933, %r4
	.word 0x9f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
thr3_resum_intr_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_151), 16, 16)) -> intp(1, 3, 1)
	.word 0x862c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x98940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0xa8340011  ! 1: ORN_R	orn 	%r16, %r17, %r20
thr3_hw_intr_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_152), 16, 16)) -> intp(2, 0, 1)
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x8a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r5
thr3_hw_intr_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_153), 16, 16)) -> intp(2, 0, 1)
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
	.word 0xb52c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0x9eb428e2  ! 1: ORNcc_I	orncc 	%r16, 0x08e2, %r15
thr3_nuke_intr_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_154), 16, 16)) -> intp(2, 2, 1)
	.word 0xb52c0011  ! 1: SLL_R	sll 	%r16, %r17, %r26
	.word 0xacbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
thr3_resum_intr_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_155), 16, 16)) -> intp(2, 3, 1)
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
	.word 0x833c1011  ! 1: SRAX_R	srax	%r16, %r17, %r1
thr3_nuke_intr_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_156), 16, 16)) -> intp(0, 2, 1)
	.word 0x9e942939  ! 1: ORcc_I	orcc 	%r16, 0x0939, %r15
	.word 0xaa2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r21
	.word 0x88840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r4
thr3_resum_intr_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_157), 16, 16)) -> intp(0, 3, 1)
	.word 0x988c2589  ! 1: ANDcc_I	andcc 	%r16, 0x0589, %r12
	.word 0x820c0011  ! 1: AND_R	and 	%r16, %r17, %r1
	.word 0x9a342d50  ! 1: ORN_I	orn 	%r16, 0x0d50, %r13
thr3_nuke_intr_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_158), 16, 16)) -> intp(1, 2, 1)
	.word 0xb2ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0xae940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0x841c2ddf  ! 1: XOR_I	xor 	%r16, 0x0ddf, %r2
	.word 0x9f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r15
thr3_resum_intr_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_159), 16, 16)) -> intp(1, 3, 1)
	.word 0x8d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r6
thr3_hw_intr_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_160), 16, 16)) -> intp(0, 0, 1)
	.word 0x8d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r6
	.word 0xb0ac284b  ! 1: ANDNcc_I	andncc 	%r16, 0x084b, %r24
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
	.word 0xad7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r22
thr3_nuke_intr_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_161), 16, 16)) -> intp(1, 2, 1)
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
	.word 0x82340011  ! 1: ORN_R	orn 	%r16, %r17, %r1
thr3_resum_intr_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_162), 16, 16)) -> intp(1, 3, 1)
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
thr3_hw_intr_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_163), 16, 16)) -> intp(1, 0, 1)
	.word 0xa88c2473  ! 1: ANDcc_I	andcc 	%r16, 0x0473, %r20
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
	.word 0x9ec42fa9  ! 1: ADDCcc_I	addccc 	%r16, 0x0fa9, %r15
	.word 0xa6140011  ! 1: OR_R	or 	%r16, %r17, %r19
thr3_hw_intr_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_164), 16, 16)) -> intp(0, 0, 1)
	.word 0x9b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r13
thr3_nuke_intr_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_165), 16, 16)) -> intp(2, 2, 1)
	.word 0x8d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0x82c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0xae2c2968  ! 1: ANDN_I	andn 	%r16, 0x0968, %r23
thr3_resum_intr_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_166), 16, 16)) -> intp(2, 3, 1)
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
thr3_nuke_intr_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_167), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0x888420c7  ! 1: ADDcc_I	addcc 	%r16, 0x00c7, %r4
	.word 0xa6840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r19
thr3_resum_intr_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_168), 16, 16)) -> intp(1, 3, 1)
	.word 0x88142c11  ! 1: OR_I	or 	%r16, 0x0c11, %r4
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
	.word 0x8d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r6
thr3_nuke_intr_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_169), 16, 16)) -> intp(0, 2, 1)
	.word 0x909c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0xb82c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r28
thr3_resum_intr_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_170), 16, 16)) -> intp(0, 3, 1)
	.word 0xac440011  ! 1: ADDC_R	addc 	%r16, %r17, %r22
	.word 0xa6ac2938  ! 1: ANDNcc_I	andncc 	%r16, 0x0938, %r19
	.word 0x992c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
thr3_nuke_intr_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_171), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0xad7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r22
	.word 0x96b421a9  ! 1: ORNcc_I	orncc 	%r16, 0x01a9, %r11
thr3_resum_intr_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_172), 16, 16)) -> intp(2, 3, 1)
	.word 0x900c2644  ! 1: AND_I	and 	%r16, 0x0644, %r8
thr3_nuke_intr_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_173), 16, 16)) -> intp(0, 2, 1)
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_174), 16, 16)) -> intp(0, 3, 1)
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x842c2440  ! 1: ANDN_I	andn 	%r16, 0x0440, %r2
	.word 0x86340011  ! 1: ORN_R	orn 	%r16, %r17, %r3
thr3_nuke_intr_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_175), 16, 16)) -> intp(0, 2, 1)
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
	.word 0xa72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r19
	.word 0xaa2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r21
	.word 0xaf2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r23
thr3_resum_intr_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_176), 16, 16)) -> intp(0, 3, 1)
	.word 0x92942f4c  ! 1: ORcc_I	orcc 	%r16, 0x0f4c, %r9
	.word 0x8c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0x843c254c  ! 1: XNOR_I	xnor 	%r16, 0x054c, %r2
thr3_hw_intr_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_177), 16, 16)) -> intp(0, 0, 1)
	.word 0x98c42e9a  ! 1: ADDCcc_I	addccc 	%r16, 0x0e9a, %r12
thr3_nuke_intr_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_178), 16, 16)) -> intp(0, 2, 1)
	.word 0xb0342687  ! 1: ORN_I	orn 	%r16, 0x0687, %r24
thr3_resum_intr_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_179), 16, 16)) -> intp(0, 3, 1)
	.word 0xb9340011  ! 1: SRL_R	srl 	%r16, %r17, %r28
	.word 0xb02c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r24
	.word 0x842c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r2
thr3_nuke_intr_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_180), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0x94342c6c  ! 1: ORN_I	orn 	%r16, 0x0c6c, %r10
	.word 0x9e2c2d40  ! 1: ANDN_I	andn 	%r16, 0x0d40, %r15
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
thr3_resum_intr_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_181), 16, 16)) -> intp(1, 3, 1)
	.word 0x96c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0xb0bc2bee  ! 1: XNORcc_I	xnorcc 	%r16, 0x0bee, %r24
	.word 0xb92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r28
thr3_hw_intr_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_182), 16, 16)) -> intp(0, 0, 1)
	.word 0x8444203d  ! 1: ADDC_I	addc 	%r16, 0x003d, %r2
	.word 0x997c0411  ! 1: MOVR_R	move	%r16, %r17, %r12
thr3_hw_intr_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_183), 16, 16)) -> intp(0, 0, 1)
	.word 0x89643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x964423b7  ! 1: ADDC_I	addc 	%r16, 0x03b7, %r11
	.word 0x9a9c20df  ! 1: XORcc_I	xorcc 	%r16, 0x00df, %r13
thr3_nuke_intr_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_184), 16, 16)) -> intp(0, 2, 1)
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x8c0c2342  ! 1: AND_I	and 	%r16, 0x0342, %r6
	.word 0xb17c2401  ! 1: MOVR_I	move	%r16, 0xffffff42, %r24
thr3_resum_intr_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_185), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb7c0411  ! 1: MOVR_R	move	%r16, %r17, %r29
	.word 0x8e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0xb6c420b7  ! 1: ADDCcc_I	addccc 	%r16, 0x00b7, %r27
thr3_nuke_intr_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_186), 16, 16)) -> intp(2, 2, 1)
	.word 0xa72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r19
thr3_resum_intr_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_187), 16, 16)) -> intp(2, 3, 1)
	.word 0xb48c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0x82340011  ! 1: ORN_R	orn 	%r16, %r17, %r1
	.word 0xab2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r21
thr3_hw_intr_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_188), 16, 16)) -> intp(2, 0, 1)
	.word 0xb28c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r25
	.word 0xb3641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_189), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
	.word 0x848c2610  ! 1: ANDcc_I	andcc 	%r16, 0x0610, %r2
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
thr3_hw_intr_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_190), 16, 16)) -> intp(0, 0, 1)
	.word 0x90b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x85342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0xba0c0011  ! 1: AND_R	and 	%r16, %r17, %r29
thr3_hw_intr_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_191), 16, 16)) -> intp(2, 0, 1)
	.word 0xa8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x95343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0xb73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r27
thr3_nuke_intr_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_192), 16, 16)) -> intp(1, 2, 1)
	.word 0x928c2f22  ! 1: ANDcc_I	andcc 	%r16, 0x0f22, %r9
	.word 0xb0ac2015  ! 1: ANDNcc_I	andncc 	%r16, 0x0015, %r24
thr3_resum_intr_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_193), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_194), 16, 16)) -> intp(1, 0, 1)
	.word 0xb5643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x988c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x9e2c2066  ! 1: ANDN_I	andn 	%r16, 0x0066, %r15
thr3_nuke_intr_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_195), 16, 16)) -> intp(1, 2, 1)
	.word 0x91340011  ! 1: SRL_R	srl 	%r16, %r17, %r8
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
thr3_resum_intr_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_196), 16, 16)) -> intp(1, 3, 1)
	.word 0xb53c1011  ! 1: SRAX_R	srax	%r16, %r17, %r26
	.word 0xb6b42469  ! 1: ORNcc_I	orncc 	%r16, 0x0469, %r27
	.word 0x82b4295e  ! 1: ORNcc_I	orncc 	%r16, 0x095e, %r1
thr3_hw_intr_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_197), 16, 16)) -> intp(2, 0, 1)
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0x95e, %r7
	.word 0xa69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x8a942f97  ! 1: ORcc_I	orcc 	%r16, 0x0f97, %r5
	.word 0x8cb42538  ! 1: ORNcc_I	orncc 	%r16, 0x0538, %r6
thr3_nuke_intr_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_198), 16, 16)) -> intp(2, 2, 1)
	.word 0xae940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0xba0424f3  ! 1: ADD_I	add 	%r16, 0x04f3, %r29
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
thr3_resum_intr_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_199), 16, 16)) -> intp(2, 3, 1)
	.word 0x89342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x902c2fad  ! 1: ANDN_I	andn 	%r16, 0x0fad, %r8
thr3_hw_intr_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_200), 16, 16)) -> intp(2, 0, 1)
	.word 0x8ab4288b  ! 1: ORNcc_I	orncc 	%r16, 0x088b, %r5
	.word 0xb49c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xb4040011  ! 1: ADD_R	add 	%r16, %r17, %r26
thr3_hw_intr_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_201), 16, 16)) -> intp(0, 0, 1)
	.word 0x9f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0x9a8c2817  ! 1: ANDcc_I	andcc 	%r16, 0x0817, %r13
thr3_nuke_intr_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_202), 16, 16)) -> intp(0, 2, 1)
	.word 0x9f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x968c23d3  ! 1: ANDcc_I	andcc 	%r16, 0x03d3, %r11
	.word 0x922c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r9
thr3_resum_intr_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_203), 16, 16)) -> intp(0, 3, 1)
	.word 0x8d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r6
	.word 0x920c2f21  ! 1: AND_I	and 	%r16, 0x0f21, %r9
	.word 0xb0340011  ! 1: ORN_R	orn 	%r16, %r17, %r24
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
thr3_nuke_intr_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_204), 16, 16)) -> intp(2, 2, 1)
	.word 0x993c0011  ! 1: SRA_R	sra 	%r16, %r17, %r12
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
	.word 0x820c20d6  ! 1: AND_I	and 	%r16, 0x00d6, %r1
	.word 0x82b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r1
thr3_resum_intr_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_205), 16, 16)) -> intp(2, 3, 1)
	.word 0x8e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r7
	.word 0xaf343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r23
thr3_hw_intr_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_206), 16, 16)) -> intp(0, 0, 1)
	.word 0xb72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r27
	.word 0xb404263e  ! 1: ADD_I	add 	%r16, 0x063e, %r26
	.word 0x840c2848  ! 1: AND_I	and 	%r16, 0x0848, %r2
thr3_hw_intr_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_207), 16, 16)) -> intp(0, 0, 1)
	.word 0x993c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r12
thr3_nuke_intr_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_208), 16, 16)) -> intp(0, 2, 1)
	.word 0x842c2a3d  ! 1: ANDN_I	andn 	%r16, 0x0a3d, %r2
thr3_resum_intr_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_209), 16, 16)) -> intp(0, 3, 1)
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
thr3_hw_intr_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_210), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c140011  ! 1: OR_R	or 	%r16, %r17, %r14
	.word 0x8f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r7
thr3_nuke_intr_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_211), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r27
	.word 0xb83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r28
thr3_resum_intr_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_212), 16, 16)) -> intp(1, 3, 1)
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x9a2c27a2  ! 1: ANDN_I	andn 	%r16, 0x07a2, %r13
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
thr3_hw_intr_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_213), 16, 16)) -> intp(0, 0, 1)
	.word 0x84842581  ! 1: ADDcc_I	addcc 	%r16, 0x0581, %r2
thr3_nuke_intr_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_214), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8bc2663  ! 1: XNORcc_I	xnorcc 	%r16, 0x0663, %r20
	.word 0x981422ce  ! 1: OR_I	or 	%r16, 0x02ce, %r12
	.word 0xb884296b  ! 1: ADDcc_I	addcc 	%r16, 0x096b, %r28
	.word 0xa63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r19
thr3_resum_intr_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_215), 16, 16)) -> intp(1, 3, 1)
	.word 0x929c2cff  ! 1: XORcc_I	xorcc 	%r16, 0x0cff, %r9
	.word 0x8a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r5
thr3_hw_intr_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_216), 16, 16)) -> intp(2, 0, 1)
	.word 0xb2940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0x94bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r10
thr3_nuke_intr_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_217), 16, 16)) -> intp(0, 2, 1)
	.word 0x8c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r6
	.word 0xb3641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r27
thr3_resum_intr_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_218), 16, 16)) -> intp(0, 3, 1)
	.word 0xb52c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xb93c0011  ! 1: SRA_R	sra 	%r16, %r17, %r28
thr3_hw_intr_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_219), 16, 16)) -> intp(2, 0, 1)
	.word 0x952c0011  ! 1: SLL_R	sll 	%r16, %r17, %r10
thr3_hw_intr_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_220), 16, 16)) -> intp(2, 0, 1)
	.word 0x928c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r9
thr3_hw_intr_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_221), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0xaa340011  ! 1: ORN_R	orn 	%r16, %r17, %r21
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
thr3_hw_intr_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_222), 16, 16)) -> intp(1, 0, 1)
	.word 0xae340011  ! 1: ORN_R	orn 	%r16, %r17, %r23
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
thr3_hw_intr_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_223), 16, 16)) -> intp(2, 0, 1)
	.word 0xacac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0xb92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r28
thr3_hw_intr_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_224), 16, 16)) -> intp(0, 0, 1)
	.word 0x95341011  ! 1: SRLX_R	srlx	%r16, %r17, %r10
	.word 0xa8040011  ! 1: ADD_R	add 	%r16, %r17, %r20
	.word 0x92c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r9
thr3_hw_intr_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_225), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c942707  ! 1: ORcc_I	orcc 	%r16, 0x0707, %r14
thr3_hw_intr_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_226), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c342a6f  ! 1: ORN_I	orn 	%r16, 0x0a6f, %r14
	.word 0xb8ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r28
thr3_hw_intr_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_227), 16, 16)) -> intp(1, 0, 1)
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r7
	.word 0xba1425b7  ! 1: OR_I	or 	%r16, 0x05b7, %r29
	.word 0x9f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r15
thr3_hw_intr_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_228), 16, 16)) -> intp(0, 0, 1)
	.word 0x881c0011  ! 1: XOR_R	xor 	%r16, %r17, %r4
	.word 0xba84225e  ! 1: ADDcc_I	addcc 	%r16, 0x025e, %r29
	.word 0xa7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r19
thr3_hw_intr_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_229), 16, 16)) -> intp(1, 0, 1)
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
thr3_hw_intr_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_230), 16, 16)) -> intp(2, 0, 1)
	.word 0x9e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r15
thr3_nuke_intr_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_231), 16, 16)) -> intp(0, 2, 1)
	.word 0x94b42258  ! 1: ORNcc_I	orncc 	%r16, 0x0258, %r10
thr3_resum_intr_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_232), 16, 16)) -> intp(0, 3, 1)
	.word 0x9cc42fc6  ! 1: ADDCcc_I	addccc 	%r16, 0x0fc6, %r14
	.word 0x888c256c  ! 1: ANDcc_I	andcc 	%r16, 0x056c, %r4
thr3_nuke_intr_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_233), 16, 16)) -> intp(0, 2, 1)
	.word 0x949c2b30  ! 1: XORcc_I	xorcc 	%r16, 0x0b30, %r10
	.word 0x833c1011  ! 1: SRAX_R	srax	%r16, %r17, %r1
	.word 0x8c040011  ! 1: ADD_R	add 	%r16, %r17, %r6
	.word 0x8c342fd9  ! 1: ORN_I	orn 	%r16, 0x0fd9, %r6
thr3_resum_intr_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_234), 16, 16)) -> intp(0, 3, 1)
	.word 0xb03c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
thr3_hw_intr_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_235), 16, 16)) -> intp(0, 0, 1)
	.word 0x821c0011  ! 1: XOR_R	xor 	%r16, %r17, %r1
	.word 0x901c201f  ! 1: XOR_I	xor 	%r16, 0x001f, %r8
	.word 0x96ac2a79  ! 1: ANDNcc_I	andncc 	%r16, 0x0a79, %r11
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
thr3_hw_intr_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_236), 16, 16)) -> intp(2, 0, 1)
	.word 0x9b340011  ! 1: SRL_R	srl 	%r16, %r17, %r13
	.word 0x92940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r9
thr3_hw_intr_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_237), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0x8cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0x8c140011  ! 1: OR_R	or 	%r16, %r17, %r6
thr3_hw_intr_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_238), 16, 16)) -> intp(0, 0, 1)
	.word 0xb2b42d78  ! 1: ORNcc_I	orncc 	%r16, 0x0d78, %r25
	.word 0xae042de6  ! 1: ADD_I	add 	%r16, 0x0de6, %r23
	.word 0xaa9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r21
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
thr3_nuke_intr_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_239), 16, 16)) -> intp(1, 2, 1)
	.word 0x948c2b19  ! 1: ANDcc_I	andcc 	%r16, 0x0b19, %r10
	.word 0xb4840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0xae04209f  ! 1: ADD_I	add 	%r16, 0x009f, %r23
thr3_resum_intr_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_240), 16, 16)) -> intp(1, 3, 1)
	.word 0x9b643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_241), 16, 16)) -> intp(1, 2, 1)
	.word 0xb08c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
thr3_resum_intr_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_242), 16, 16)) -> intp(1, 3, 1)
	.word 0x873c0011  ! 1: SRA_R	sra 	%r16, %r17, %r3
	.word 0xb4440011  ! 1: ADDC_R	addc 	%r16, %r17, %r26
	.word 0xaa2c25b6  ! 1: ANDN_I	andn 	%r16, 0x05b6, %r21
	.word 0x82ac2954  ! 1: ANDNcc_I	andncc 	%r16, 0x0954, %r1
thr3_nuke_intr_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_243), 16, 16)) -> intp(2, 2, 1)
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0x8a3c2e9c  ! 1: XNOR_I	xnor 	%r16, 0x0e9c, %r5
thr3_resum_intr_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_244), 16, 16)) -> intp(2, 3, 1)
	.word 0xa7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r19
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r15
thr3_hw_intr_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_245), 16, 16)) -> intp(2, 0, 1)
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
	.word 0xacac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
	.word 0xa9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r20
thr3_hw_intr_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_246), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r29
thr3_nuke_intr_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_247), 16, 16)) -> intp(1, 2, 1)
	.word 0x942c22cf  ! 1: ANDN_I	andn 	%r16, 0x02cf, %r10
thr3_resum_intr_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_248), 16, 16)) -> intp(1, 3, 1)
	.word 0xab7c2401  ! 1: MOVR_I	move	%r16, 0xfffffecf, %r21
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
thr3_nuke_intr_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_249), 16, 16)) -> intp(0, 2, 1)
	.word 0x94bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x949c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0xa60c2d7a  ! 1: AND_I	and 	%r16, 0x0d7a, %r19
	.word 0xb73c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r27
thr3_resum_intr_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_250), 16, 16)) -> intp(0, 3, 1)
	.word 0x933c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r9
thr3_nuke_intr_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_251), 16, 16)) -> intp(1, 2, 1)
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0x1, %r7
	.word 0xad341011  ! 1: SRLX_R	srlx	%r16, %r17, %r22
thr3_resum_intr_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_252), 16, 16)) -> intp(1, 3, 1)
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0xac84220a  ! 1: ADDcc_I	addcc 	%r16, 0x020a, %r22
thr3_nuke_intr_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_253), 16, 16)) -> intp(2, 2, 1)
	.word 0x8b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
thr3_resum_intr_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_254), 16, 16)) -> intp(2, 3, 1)
	.word 0xb83424ce  ! 1: ORN_I	orn 	%r16, 0x04ce, %r28
thr3_nuke_intr_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_255), 16, 16)) -> intp(0, 2, 1)
	.word 0xb49c2a0e  ! 1: XORcc_I	xorcc 	%r16, 0x0a0e, %r26
	.word 0x9e040011  ! 1: ADD_R	add 	%r16, %r17, %r15
	.word 0xb2040011  ! 1: ADD_R	add 	%r16, %r17, %r25
	.word 0xae840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r23
thr3_resum_intr_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_256), 16, 16)) -> intp(0, 3, 1)
	.word 0x9e140011  ! 1: OR_R	or 	%r16, %r17, %r15
thr3_nuke_intr_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_257), 16, 16)) -> intp(0, 2, 1)
	.word 0xb0b4247b  ! 1: ORNcc_I	orncc 	%r16, 0x047b, %r24
	.word 0x84ac2d0a  ! 1: ANDNcc_I	andncc 	%r16, 0x0d0a, %r2
	.word 0xb08c2ea6  ! 1: ANDcc_I	andcc 	%r16, 0x0ea6, %r24
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
thr3_resum_intr_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_258), 16, 16)) -> intp(0, 3, 1)
	.word 0x8a042306  ! 1: ADD_I	add 	%r16, 0x0306, %r5
thr3_nuke_intr_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_259), 16, 16)) -> intp(0, 2, 1)
	.word 0x82440011  ! 1: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
thr3_resum_intr_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_260), 16, 16)) -> intp(0, 3, 1)
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
	.word 0x90940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x9cbc2e5e  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e5e, %r14
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
thr3_hw_intr_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_261), 16, 16)) -> intp(1, 0, 1)
	.word 0xa62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r19
	.word 0x88ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r4
thr3_hw_intr_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_262), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e0c21e0  ! 1: AND_I	and 	%r16, 0x01e0, %r7
	.word 0x9f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r15
	.word 0xac340011  ! 1: ORN_R	orn 	%r16, %r17, %r22
	.word 0x897c0411  ! 1: MOVR_R	move	%r16, %r17, %r4
thr3_hw_intr_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_263), 16, 16)) -> intp(1, 0, 1)
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
thr3_hw_intr_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_264), 16, 16)) -> intp(2, 0, 1)
	.word 0x92840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0x94842034  ! 1: ADDcc_I	addcc 	%r16, 0x0034, %r10
thr3_nuke_intr_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_265), 16, 16)) -> intp(2, 2, 1)
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
thr3_resum_intr_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_266), 16, 16)) -> intp(2, 3, 1)
	.word 0x97643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_267), 16, 16)) -> intp(0, 2, 1)
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x9e3c29b8  ! 1: XNOR_I	xnor 	%r16, 0x09b8, %r15
	.word 0x953c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r10
thr3_resum_intr_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_268), 16, 16)) -> intp(0, 3, 1)
	.word 0x9b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r13
	.word 0xb6842ff6  ! 1: ADDcc_I	addcc 	%r16, 0x0ff6, %r27
	.word 0xb7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r27
thr3_hw_intr_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_269), 16, 16)) -> intp(2, 0, 1)
	.word 0xab340011  ! 1: SRL_R	srl 	%r16, %r17, %r21
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
thr3_nuke_intr_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_270), 16, 16)) -> intp(2, 2, 1)
	.word 0x8b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x903427d8  ! 1: ORN_I	orn 	%r16, 0x07d8, %r8
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
thr3_resum_intr_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_271), 16, 16)) -> intp(2, 3, 1)
	.word 0x8e042c4e  ! 1: ADD_I	add 	%r16, 0x0c4e, %r7
thr3_hw_intr_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_272), 16, 16)) -> intp(0, 0, 1)
	.word 0x8b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0xb52c0011  ! 1: SLL_R	sll 	%r16, %r17, %r26
	.word 0x900c2dc9  ! 1: AND_I	and 	%r16, 0x0dc9, %r8
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
thr3_nuke_intr_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_273), 16, 16)) -> intp(2, 2, 1)
	.word 0x881c0011  ! 1: XOR_R	xor 	%r16, %r17, %r4
	.word 0x90140011  ! 1: OR_R	or 	%r16, %r17, %r8
	.word 0x9eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r15
thr3_resum_intr_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_274), 16, 16)) -> intp(2, 3, 1)
	.word 0xa73c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r19
thr3_nuke_intr_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_275), 16, 16)) -> intp(1, 2, 1)
	.word 0x86040011  ! 1: ADD_R	add 	%r16, %r17, %r3
thr3_resum_intr_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_276), 16, 16)) -> intp(1, 3, 1)
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
thr3_hw_intr_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_277), 16, 16)) -> intp(0, 0, 1)
	.word 0xab2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r21
thr3_nuke_intr_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_278), 16, 16)) -> intp(1, 2, 1)
	.word 0xb52c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
thr3_resum_intr_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_279), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0xbab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r29
thr3_nuke_intr_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_280), 16, 16)) -> intp(1, 2, 1)
	.word 0xb5340011  ! 1: SRL_R	srl 	%r16, %r17, %r26
thr3_resum_intr_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_281), 16, 16)) -> intp(1, 3, 1)
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
thr3_hw_intr_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_282), 16, 16)) -> intp(1, 0, 1)
	.word 0x848421d5  ! 1: ADDcc_I	addcc 	%r16, 0x01d5, %r2
	.word 0x85340011  ! 1: SRL_R	srl 	%r16, %r17, %r2
thr3_nuke_intr_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_283), 16, 16)) -> intp(0, 2, 1)
	.word 0xa82c248d  ! 1: ANDN_I	andn 	%r16, 0x048d, %r20
	.word 0xaa9c2d39  ! 1: XORcc_I	xorcc 	%r16, 0x0d39, %r21
	.word 0xae3c2456  ! 1: XNOR_I	xnor 	%r16, 0x0456, %r23
	.word 0x9a1c2aa7  ! 1: XOR_I	xor 	%r16, 0x0aa7, %r13
thr3_resum_intr_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_284), 16, 16)) -> intp(0, 3, 1)
	.word 0x96bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0xb28c2d23  ! 1: ANDcc_I	andcc 	%r16, 0x0d23, %r25
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0xb1343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r24
thr3_hw_intr_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_285), 16, 16)) -> intp(0, 0, 1)
	.word 0x93343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0xa80c0011  ! 1: AND_R	and 	%r16, %r17, %r20
thr3_hw_intr_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_286), 16, 16)) -> intp(0, 0, 1)
	.word 0x94042307  ! 1: ADD_I	add 	%r16, 0x0307, %r10
	.word 0xb73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r27
	.word 0xb23c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r25
thr3_hw_intr_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_287), 16, 16)) -> intp(0, 0, 1)
	.word 0xb92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r28
	.word 0xb4340011  ! 1: ORN_R	orn 	%r16, %r17, %r26
thr3_nuke_intr_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_288), 16, 16)) -> intp(1, 2, 1)
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
	.word 0x90940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x90340011  ! 1: ORN_R	orn 	%r16, %r17, %r8
thr3_resum_intr_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_289), 16, 16)) -> intp(1, 3, 1)
	.word 0xb604263a  ! 1: ADD_I	add 	%r16, 0x063a, %r27
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
thr3_hw_intr_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_290), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r6
thr3_nuke_intr_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_291), 16, 16)) -> intp(2, 2, 1)
	.word 0x88140011  ! 1: OR_R	or 	%r16, %r17, %r4
	.word 0xb1340011  ! 1: SRL_R	srl 	%r16, %r17, %r24
	.word 0x9ac422de  ! 1: ADDCcc_I	addccc 	%r16, 0x02de, %r13
thr3_resum_intr_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_292), 16, 16)) -> intp(2, 3, 1)
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0xbb3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r29
	.word 0xab641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_293), 16, 16)) -> intp(1, 0, 1)
	.word 0xae8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r23
thr3_hw_intr_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_294), 16, 16)) -> intp(1, 0, 1)
	.word 0x960c2e43  ! 1: AND_I	and 	%r16, 0x0e43, %r11
thr3_hw_intr_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_295), 16, 16)) -> intp(2, 0, 1)
	.word 0x8a1c28ad  ! 1: XOR_I	xor 	%r16, 0x08ad, %r5
	.word 0x8f643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_296), 16, 16)) -> intp(1, 2, 1)
	.word 0x832c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x972c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r11
	.word 0x9ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
thr3_resum_intr_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_297), 16, 16)) -> intp(1, 3, 1)
	.word 0xb33c0011  ! 1: SRA_R	sra 	%r16, %r17, %r25
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
thr3_hw_intr_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_298), 16, 16)) -> intp(0, 0, 1)
	.word 0x91340011  ! 1: SRL_R	srl 	%r16, %r17, %r8
	.word 0x92940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0xad341011  ! 1: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
thr3_nuke_intr_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_299), 16, 16)) -> intp(1, 2, 1)
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
	.word 0xb32c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0x880c2e3e  ! 1: AND_I	and 	%r16, 0x0e3e, %r4
thr3_resum_intr_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_300), 16, 16)) -> intp(1, 3, 1)
	.word 0xb69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0x90340011  ! 1: ORN_R	orn 	%r16, %r17, %r8
thr3_nuke_intr_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_301), 16, 16)) -> intp(2, 2, 1)
	.word 0x8aac2fb1  ! 1: ANDNcc_I	andncc 	%r16, 0x0fb1, %r5
thr3_resum_intr_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_302), 16, 16)) -> intp(2, 3, 1)
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
	.word 0xb41c0011  ! 1: XOR_R	xor 	%r16, %r17, %r26
	.word 0x93641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_303), 16, 16)) -> intp(2, 0, 1)
	.word 0xa9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0x9e9c2d85  ! 1: XORcc_I	xorcc 	%r16, 0x0d85, %r15
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
thr3_nuke_intr_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_304), 16, 16)) -> intp(2, 2, 1)
	.word 0xba9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r29
	.word 0x873c1011  ! 1: SRAX_R	srax	%r16, %r17, %r3
	.word 0x861426a1  ! 1: OR_I	or 	%r16, 0x06a1, %r3
	.word 0x840c2f7c  ! 1: AND_I	and 	%r16, 0x0f7c, %r2
thr3_resum_intr_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_305), 16, 16)) -> intp(2, 3, 1)
	.word 0xba1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r29
thr3_nuke_intr_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_306), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r23
	.word 0xaa1c2169  ! 1: XOR_I	xor 	%r16, 0x0169, %r21
thr3_resum_intr_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_307), 16, 16)) -> intp(0, 3, 1)
	.word 0x92342d8d  ! 1: ORN_I	orn 	%r16, 0x0d8d, %r9
thr3_nuke_intr_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_308), 16, 16)) -> intp(1, 2, 1)
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x96b42a4a  ! 1: ORNcc_I	orncc 	%r16, 0x0a4a, %r11
	.word 0xaeac2cd5  ! 1: ANDNcc_I	andncc 	%r16, 0x0cd5, %r23
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
thr3_resum_intr_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_309), 16, 16)) -> intp(1, 3, 1)
	.word 0x8a8c2c46  ! 1: ANDcc_I	andcc 	%r16, 0x0c46, %r5
	.word 0x861c247d  ! 1: XOR_I	xor 	%r16, 0x047d, %r3
	.word 0xb88c2d53  ! 1: ANDcc_I	andcc 	%r16, 0x0d53, %r28
thr3_nuke_intr_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_310), 16, 16)) -> intp(2, 2, 1)
	.word 0x94b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0x94bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x9eac2a6e  ! 1: ANDNcc_I	andncc 	%r16, 0x0a6e, %r15
	.word 0x92040011  ! 1: ADD_R	add 	%r16, %r17, %r9
thr3_resum_intr_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_311), 16, 16)) -> intp(2, 3, 1)
	.word 0x862c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r3
thr3_hw_intr_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_312), 16, 16)) -> intp(0, 0, 1)
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
thr3_hw_intr_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_313), 16, 16)) -> intp(1, 0, 1)
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
	.word 0x908423c5  ! 1: ADDcc_I	addcc 	%r16, 0x03c5, %r8
thr3_nuke_intr_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_314), 16, 16)) -> intp(0, 2, 1)
	.word 0xa9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0xb4040011  ! 1: ADD_R	add 	%r16, %r17, %r26
	.word 0xb12c0011  ! 1: SLL_R	sll 	%r16, %r17, %r24
thr3_resum_intr_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_315), 16, 16)) -> intp(0, 3, 1)
	.word 0xad2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r22
thr3_nuke_intr_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_316), 16, 16)) -> intp(2, 2, 1)
	.word 0xa6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0xa69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r19
thr3_resum_intr_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_317), 16, 16)) -> intp(2, 3, 1)
	.word 0xae840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x863c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0xb82c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r28
thr3_hw_intr_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_318), 16, 16)) -> intp(0, 0, 1)
	.word 0xb17c0411  ! 1: MOVR_R	move	%r16, %r17, %r24
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0xb88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r28
	.word 0x8e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r7
thr3_hw_intr_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_319), 16, 16)) -> intp(0, 0, 1)
	.word 0x868c2093  ! 1: ANDcc_I	andcc 	%r16, 0x0093, %r3
	.word 0xaf341011  ! 1: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xba9c22ef  ! 1: XORcc_I	xorcc 	%r16, 0x02ef, %r29
thr3_nuke_intr_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_320), 16, 16)) -> intp(2, 2, 1)
	.word 0x9f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
thr3_resum_intr_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_321), 16, 16)) -> intp(2, 3, 1)
	.word 0xac2c2e6b  ! 1: ANDN_I	andn 	%r16, 0x0e6b, %r22
	.word 0xa9641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb4bc2852  ! 1: XNORcc_I	xnorcc 	%r16, 0x0852, %r26
	.word 0x91340011  ! 1: SRL_R	srl 	%r16, %r17, %r8
thr3_hw_intr_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_322), 16, 16)) -> intp(1, 0, 1)
	.word 0x842c27b9  ! 1: ANDN_I	andn 	%r16, 0x07b9, %r2
	.word 0x94440011  ! 1: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x90940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0xae840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r23
thr3_nuke_intr_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_323), 16, 16)) -> intp(1, 2, 1)
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
thr3_resum_intr_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_324), 16, 16)) -> intp(1, 3, 1)
	.word 0x8a9427e5  ! 1: ORcc_I	orcc 	%r16, 0x07e5, %r5
	.word 0x952c0011  ! 1: SLL_R	sll 	%r16, %r17, %r10
thr3_hw_intr_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_325), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0xba9c2206  ! 1: XORcc_I	xorcc 	%r16, 0x0206, %r29
	.word 0x962c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r11
	.word 0xb41c2ab7  ! 1: XOR_I	xor 	%r16, 0x0ab7, %r26
thr3_hw_intr_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_326), 16, 16)) -> intp(0, 0, 1)
	.word 0x8f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x8a2c24b5  ! 1: ANDN_I	andn 	%r16, 0x04b5, %r5
	.word 0x85343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0x8abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r5
thr3_nuke_intr_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_327), 16, 16)) -> intp(0, 2, 1)
	.word 0xb73c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0x9c8c23e8  ! 1: ANDcc_I	andcc 	%r16, 0x03e8, %r14
	.word 0x840c2d6e  ! 1: AND_I	and 	%r16, 0x0d6e, %r2
thr3_resum_intr_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_328), 16, 16)) -> intp(0, 3, 1)
	.word 0x842c2e14  ! 1: ANDN_I	andn 	%r16, 0x0e14, %r2
	.word 0xb4ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
thr3_hw_intr_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_329), 16, 16)) -> intp(0, 0, 1)
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
	.word 0x94940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x8aac2b89  ! 1: ANDNcc_I	andncc 	%r16, 0x0b89, %r5
thr3_nuke_intr_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_330), 16, 16)) -> intp(0, 2, 1)
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0x90142011  ! 1: OR_I	or 	%r16, 0x0011, %r8
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
thr3_resum_intr_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_331), 16, 16)) -> intp(0, 3, 1)
	.word 0x8f340011  ! 1: SRL_R	srl 	%r16, %r17, %r7
thr3_hw_intr_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_332), 16, 16)) -> intp(2, 0, 1)
	.word 0x86bc2a0c  ! 1: XNORcc_I	xnorcc 	%r16, 0x0a0c, %r3
	.word 0x90bc21b1  ! 1: XNORcc_I	xnorcc 	%r16, 0x01b1, %r8
	.word 0x9e140011  ! 1: OR_R	or 	%r16, %r17, %r15
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
thr3_hw_intr_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_333), 16, 16)) -> intp(0, 0, 1)
	.word 0xad3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r22
	.word 0xba940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r29
thr3_nuke_intr_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_334), 16, 16)) -> intp(2, 2, 1)
	.word 0xaa3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r21
	.word 0xbb341011  ! 1: SRLX_R	srlx	%r16, %r17, %r29
	.word 0xa7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0xb0140011  ! 1: OR_R	or 	%r16, %r17, %r24
thr3_resum_intr_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_335), 16, 16)) -> intp(2, 3, 1)
	.word 0x86042a81  ! 1: ADD_I	add 	%r16, 0x0a81, %r3
	.word 0xb13c1011  ! 1: SRAX_R	srax	%r16, %r17, %r24
thr3_hw_intr_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_336), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a442d26  ! 1: ADDC_I	addc 	%r16, 0x0d26, %r13
	.word 0x88c42474  ! 1: ADDCcc_I	addccc 	%r16, 0x0474, %r4
	.word 0x90ac2b7f  ! 1: ANDNcc_I	andncc 	%r16, 0x0b7f, %r8
	.word 0x90040011  ! 1: ADD_R	add 	%r16, %r17, %r8
thr3_nuke_intr_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_337), 16, 16)) -> intp(1, 2, 1)
	.word 0x949c2d51  ! 1: XORcc_I	xorcc 	%r16, 0x0d51, %r10
	.word 0x88340011  ! 1: ORN_R	orn 	%r16, %r17, %r4
thr3_resum_intr_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_338), 16, 16)) -> intp(1, 3, 1)
	.word 0xad3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r22
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
thr3_hw_intr_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_339), 16, 16)) -> intp(2, 0, 1)
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
	.word 0x9cb42d5b  ! 1: ORNcc_I	orncc 	%r16, 0x0d5b, %r14
	.word 0x9444247e  ! 1: ADDC_I	addc 	%r16, 0x047e, %r10
thr3_hw_intr_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_340), 16, 16)) -> intp(0, 0, 1)
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0xac042af0  ! 1: ADD_I	add 	%r16, 0x0af0, %r22
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
	.word 0xb6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r27
thr3_nuke_intr_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_341), 16, 16)) -> intp(0, 2, 1)
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x8a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xa6040011  ! 1: ADD_R	add 	%r16, %r17, %r19
thr3_resum_intr_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_342), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0xb21c20b5  ! 1: XOR_I	xor 	%r16, 0x00b5, %r25
thr3_hw_intr_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_343), 16, 16)) -> intp(0, 0, 1)
	.word 0x832c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r1
	.word 0xb60c0011  ! 1: AND_R	and 	%r16, %r17, %r27
	.word 0x972c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0xb1643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_344), 16, 16)) -> intp(1, 2, 1)
	.word 0xb72c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r27
thr3_resum_intr_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_345), 16, 16)) -> intp(1, 3, 1)
	.word 0xbaac2ea7  ! 1: ANDNcc_I	andncc 	%r16, 0x0ea7, %r29
	.word 0xa6040011  ! 1: ADD_R	add 	%r16, %r17, %r19
thr3_hw_intr_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_346), 16, 16)) -> intp(0, 0, 1)
	.word 0x88040011  ! 1: ADD_R	add 	%r16, %r17, %r4
	.word 0xae840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
thr3_nuke_intr_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_347), 16, 16)) -> intp(1, 2, 1)
	.word 0x963c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x9f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
	.word 0x9e9c2888  ! 1: XORcc_I	xorcc 	%r16, 0x0888, %r15
thr3_resum_intr_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_348), 16, 16)) -> intp(1, 3, 1)
	.word 0x88ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x8d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xaf3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r23
	.word 0x9cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r14
thr3_nuke_intr_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_349), 16, 16)) -> intp(1, 2, 1)
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
thr3_resum_intr_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_350), 16, 16)) -> intp(1, 3, 1)
	.word 0x9a0c251c  ! 1: AND_I	and 	%r16, 0x051c, %r13
	.word 0x9c340011  ! 1: ORN_R	orn 	%r16, %r17, %r14
thr3_hw_intr_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_351), 16, 16)) -> intp(2, 0, 1)
	.word 0x823c24a0  ! 1: XNOR_I	xnor 	%r16, 0x04a0, %r1
	.word 0x91343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0xb2c428df  ! 1: ADDCcc_I	addccc 	%r16, 0x08df, %r25
thr3_hw_intr_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_352), 16, 16)) -> intp(1, 0, 1)
	.word 0xb1341011  ! 1: SRLX_R	srlx	%r16, %r17, %r24
	.word 0x8b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r5
thr3_nuke_intr_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_353), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8942ca2  ! 1: ORcc_I	orcc 	%r16, 0x0ca2, %r20
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
	.word 0xb69c2b99  ! 1: XORcc_I	xorcc 	%r16, 0x0b99, %r27
thr3_resum_intr_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_354), 16, 16)) -> intp(1, 3, 1)
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0xffffff99, %r7
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x957c2401  ! 1: MOVR_I	move	%r16, 0x1, %r10
thr3_hw_intr_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_355), 16, 16)) -> intp(0, 0, 1)
	.word 0x90c42cba  ! 1: ADDCcc_I	addccc 	%r16, 0x0cba, %r8
	.word 0xb92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xac940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r22
thr3_nuke_intr_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_356), 16, 16)) -> intp(2, 2, 1)
	.word 0xa82c27b8  ! 1: ANDN_I	andn 	%r16, 0x07b8, %r20
	.word 0xa62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r19
thr3_resum_intr_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_357), 16, 16)) -> intp(2, 3, 1)
	.word 0x9f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0xa88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0xb53c1011  ! 1: SRAX_R	srax	%r16, %r17, %r26
thr3_hw_intr_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_358), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
	.word 0xaa9427b4  ! 1: ORcc_I	orcc 	%r16, 0x07b4, %r21
	.word 0x983c2ffb  ! 1: XNOR_I	xnor 	%r16, 0x0ffb, %r12
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
thr3_hw_intr_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_359), 16, 16)) -> intp(1, 0, 1)
	.word 0x941c2597  ! 1: XOR_I	xor 	%r16, 0x0597, %r10
	.word 0x9f7c2401  ! 1: MOVR_I	move	%r16, 0x597, %r15
	.word 0xac4429bd  ! 1: ADDC_I	addc 	%r16, 0x09bd, %r22
thr3_hw_intr_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_360), 16, 16)) -> intp(0, 0, 1)
	.word 0x8b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r5
	.word 0x95641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9b643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_361), 16, 16)) -> intp(0, 2, 1)
	.word 0xba140011  ! 1: OR_R	or 	%r16, %r17, %r29
	.word 0x86042110  ! 1: ADD_I	add 	%r16, 0x0110, %r3
	.word 0xb9340011  ! 1: SRL_R	srl 	%r16, %r17, %r28
	.word 0x860c2a97  ! 1: AND_I	and 	%r16, 0x0a97, %r3
thr3_resum_intr_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_362), 16, 16)) -> intp(0, 3, 1)
	.word 0xb33c1011  ! 1: SRAX_R	srax	%r16, %r17, %r25
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
thr3_nuke_intr_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_363), 16, 16)) -> intp(2, 2, 1)
	.word 0x940c2f9a  ! 1: AND_I	and 	%r16, 0x0f9a, %r10
	.word 0x89643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x977c2401  ! 1: MOVR_I	move	%r16, 0xffffff9a, %r11
thr3_resum_intr_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_364), 16, 16)) -> intp(2, 3, 1)
	.word 0xaeb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r23
	.word 0x9b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r13
	.word 0x91343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r8
thr3_nuke_intr_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_365), 16, 16)) -> intp(0, 2, 1)
	.word 0xa77c2401  ! 1: MOVR_I	move	%r16, 0x1, %r19
	.word 0xa6442a97  ! 1: ADDC_I	addc 	%r16, 0x0a97, %r19
thr3_resum_intr_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_366), 16, 16)) -> intp(0, 3, 1)
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
	.word 0xa92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r20
	.word 0xb08c2add  ! 1: ANDcc_I	andcc 	%r16, 0x0add, %r24
thr3_nuke_intr_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_367), 16, 16)) -> intp(2, 2, 1)
	.word 0x917c2401  ! 1: MOVR_I	move	%r16, 0xfffffedd, %r8
	.word 0x86442a6e  ! 1: ADDC_I	addc 	%r16, 0x0a6e, %r3
thr3_resum_intr_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_368), 16, 16)) -> intp(2, 3, 1)
	.word 0xb4b42300  ! 1: ORNcc_I	orncc 	%r16, 0x0300, %r26
thr3_nuke_intr_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_369), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r7
thr3_resum_intr_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_370), 16, 16)) -> intp(0, 3, 1)
	.word 0xb12c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r24
thr3_nuke_intr_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_371), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c9c2b3d  ! 1: XORcc_I	xorcc 	%r16, 0x0b3d, %r6
thr3_resum_intr_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_372), 16, 16)) -> intp(1, 3, 1)
	.word 0xb4b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0x8e142944  ! 1: OR_I	or 	%r16, 0x0944, %r7
thr3_nuke_intr_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_373), 16, 16)) -> intp(2, 2, 1)
	.word 0xba0c2093  ! 1: AND_I	and 	%r16, 0x0093, %r29
	.word 0x90342843  ! 1: ORN_I	orn 	%r16, 0x0843, %r8
thr3_resum_intr_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_374), 16, 16)) -> intp(2, 3, 1)
	.word 0x92ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xb00c0011  ! 1: AND_R	and 	%r16, %r17, %r24
	.word 0x83342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x8f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r7
thr3_hw_intr_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_375), 16, 16)) -> intp(2, 0, 1)
	.word 0xb52c0011  ! 1: SLL_R	sll 	%r16, %r17, %r26
	.word 0xbac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r29
thr3_nuke_intr_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_376), 16, 16)) -> intp(2, 2, 1)
	.word 0xaab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0x9c3c248e  ! 1: XNOR_I	xnor 	%r16, 0x048e, %r14
	.word 0x902c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r8
thr3_resum_intr_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_377), 16, 16)) -> intp(2, 3, 1)
	.word 0xa6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0xba342f21  ! 1: ORN_I	orn 	%r16, 0x0f21, %r29
	.word 0x888c2a1c  ! 1: ANDcc_I	andcc 	%r16, 0x0a1c, %r4
thr3_hw_intr_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_378), 16, 16)) -> intp(0, 0, 1)
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x833c0011  ! 1: SRA_R	sra 	%r16, %r17, %r1
	.word 0x889c2946  ! 1: XORcc_I	xorcc 	%r16, 0x0946, %r4
	.word 0x868c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r3
thr3_hw_intr_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_379), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0x9f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r15
thr3_hw_intr_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_380), 16, 16)) -> intp(1, 0, 1)
	.word 0x82ac27bc  ! 1: ANDNcc_I	andncc 	%r16, 0x07bc, %r1
	.word 0x8694263e  ! 1: ORcc_I	orcc 	%r16, 0x063e, %r3
	.word 0x8ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r5
thr3_hw_intr_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_381), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
thr3_nuke_intr_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_382), 16, 16)) -> intp(0, 2, 1)
	.word 0x841424ae  ! 1: OR_I	or 	%r16, 0x04ae, %r2
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
thr3_resum_intr_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_383), 16, 16)) -> intp(0, 3, 1)
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
thr3_nuke_intr_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_384), 16, 16)) -> intp(1, 2, 1)
	.word 0xad2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r22
thr3_resum_intr_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_385), 16, 16)) -> intp(1, 3, 1)
	.word 0x962c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r11
thr3_nuke_intr_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_386), 16, 16)) -> intp(0, 2, 1)
	.word 0x8894297b  ! 1: ORcc_I	orcc 	%r16, 0x097b, %r4
thr3_resum_intr_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_387), 16, 16)) -> intp(0, 3, 1)
	.word 0xaaac2d8d  ! 1: ANDNcc_I	andncc 	%r16, 0x0d8d, %r21
	.word 0x94c42a02  ! 1: ADDCcc_I	addccc 	%r16, 0x0a02, %r10
	.word 0x8a040011  ! 1: ADD_R	add 	%r16, %r17, %r5
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
thr3_hw_intr_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_388), 16, 16)) -> intp(0, 0, 1)
	.word 0x8e942014  ! 1: ORcc_I	orcc 	%r16, 0x0014, %r7
thr3_nuke_intr_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_389), 16, 16)) -> intp(0, 2, 1)
	.word 0x86bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
thr3_resum_intr_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_390), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa142067  ! 1: OR_I	or 	%r16, 0x0067, %r21
	.word 0x92bc28a4  ! 1: XNORcc_I	xnorcc 	%r16, 0x08a4, %r9
	.word 0xb60c263e  ! 1: AND_I	and 	%r16, 0x063e, %r27
thr3_hw_intr_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_391), 16, 16)) -> intp(0, 0, 1)
	.word 0xba1426c8  ! 1: OR_I	or 	%r16, 0x06c8, %r29
	.word 0xb1343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xb8ac2478  ! 1: ANDNcc_I	andncc 	%r16, 0x0478, %r28
thr3_nuke_intr_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_392), 16, 16)) -> intp(1, 2, 1)
	.word 0xaeb425a3  ! 1: ORNcc_I	orncc 	%r16, 0x05a3, %r23
	.word 0xba140011  ! 1: OR_R	or 	%r16, %r17, %r29
	.word 0xaf2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r23
thr3_resum_intr_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_393), 16, 16)) -> intp(1, 3, 1)
	.word 0x837c0411  ! 1: MOVR_R	move	%r16, %r17, %r1
	.word 0x9b7c0411  ! 1: MOVR_R	move	%r16, %r17, %r13
	.word 0x9a340011  ! 1: ORN_R	orn 	%r16, %r17, %r13
thr3_nuke_intr_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_394), 16, 16)) -> intp(1, 2, 1)
	.word 0x90442402  ! 1: ADDC_I	addc 	%r16, 0x0402, %r8
	.word 0x8c042491  ! 1: ADD_I	add 	%r16, 0x0491, %r6
	.word 0xb4940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0x9a3c2509  ! 1: XNOR_I	xnor 	%r16, 0x0509, %r13
thr3_resum_intr_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_395), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x8c0c2dc0  ! 1: AND_I	and 	%r16, 0x0dc0, %r6
thr3_hw_intr_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_396), 16, 16)) -> intp(2, 0, 1)
	.word 0x992c0011  ! 1: SLL_R	sll 	%r16, %r17, %r12
	.word 0xa8ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r20
thr3_hw_intr_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_397), 16, 16)) -> intp(0, 0, 1)
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
thr3_hw_intr_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_398), 16, 16)) -> intp(1, 0, 1)
	.word 0x90342f83  ! 1: ORN_I	orn 	%r16, 0x0f83, %r8
	.word 0xb89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r28
thr3_hw_intr_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_399), 16, 16)) -> intp(2, 0, 1)
	.word 0x822c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r1
	.word 0xaa0c0011  ! 1: AND_R	and 	%r16, %r17, %r21
thr3_nuke_intr_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_400), 16, 16)) -> intp(2, 2, 1)
	.word 0xad643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r14
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
	.word 0x9a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r13
thr3_resum_intr_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_401), 16, 16)) -> intp(2, 3, 1)
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
thr3_hw_intr_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_402), 16, 16)) -> intp(2, 0, 1)
	.word 0x9c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0x9a3c20e5  ! 1: XNOR_I	xnor 	%r16, 0x00e5, %r13
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
	.word 0x9cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r14
thr3_hw_intr_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_403), 16, 16)) -> intp(0, 0, 1)
	.word 0x9aac2eea  ! 1: ANDNcc_I	andncc 	%r16, 0x0eea, %r13
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x842c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r2
	.word 0xbac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r29
thr3_hw_intr_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_404), 16, 16)) -> intp(0, 0, 1)
	.word 0xa61425af  ! 1: OR_I	or 	%r16, 0x05af, %r19
thr3_nuke_intr_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_405), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a9c21ff  ! 1: XORcc_I	xorcc 	%r16, 0x01ff, %r5
	.word 0x892c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0x92c426e6  ! 1: ADDCcc_I	addccc 	%r16, 0x06e6, %r9
thr3_resum_intr_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_406), 16, 16)) -> intp(2, 3, 1)
	.word 0x9b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x848c2f4b  ! 1: ANDcc_I	andcc 	%r16, 0x0f4b, %r2
thr3_nuke_intr_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_407), 16, 16)) -> intp(2, 2, 1)
	.word 0x942c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x981c2240  ! 1: XOR_I	xor 	%r16, 0x0240, %r12
thr3_resum_intr_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_408), 16, 16)) -> intp(2, 3, 1)
	.word 0x912c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r8
thr3_nuke_intr_409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_409), 16, 16)) -> intp(1, 2, 1)
	.word 0xae940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0xb3343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0x8c140011  ! 1: OR_R	or 	%r16, %r17, %r6
thr3_resum_intr_410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_410), 16, 16)) -> intp(1, 3, 1)
	.word 0x88840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x8e042759  ! 1: ADD_I	add 	%r16, 0x0759, %r7
thr3_hw_intr_411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_411), 16, 16)) -> intp(2, 0, 1)
	.word 0xaa3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r21
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
thr3_nuke_intr_412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_412), 16, 16)) -> intp(2, 2, 1)
	.word 0x9b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r13
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
	.word 0xbab42e8d  ! 1: ORNcc_I	orncc 	%r16, 0x0e8d, %r29
	.word 0x943c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r10
thr3_resum_intr_413:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_413), 16, 16)) -> intp(2, 3, 1)
	.word 0x912c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x9b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r13
	.word 0xa6442cfb  ! 1: ADDC_I	addc 	%r16, 0x0cfb, %r19
thr3_hw_intr_414:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_414), 16, 16)) -> intp(1, 0, 1)
	.word 0x9e340011  ! 1: ORN_R	orn 	%r16, %r17, %r15
	.word 0x8d641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_415:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_415), 16, 16)) -> intp(1, 0, 1)
	.word 0x82042e46  ! 1: ADD_I	add 	%r16, 0x0e46, %r1
thr3_nuke_intr_416:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_416), 16, 16)) -> intp(1, 2, 1)
	.word 0xb72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0x86840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0xb7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r27
thr3_resum_intr_417:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_417), 16, 16)) -> intp(1, 3, 1)
	.word 0xb03c2835  ! 1: XNOR_I	xnor 	%r16, 0x0835, %r24
	.word 0x96940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0xac2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r22
thr3_hw_intr_418:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_418), 16, 16)) -> intp(1, 0, 1)
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xaa1423eb  ! 1: OR_I	or 	%r16, 0x03eb, %r21
thr3_nuke_intr_419:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_419), 16, 16)) -> intp(2, 2, 1)
	.word 0xa9643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xae8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r23
thr3_resum_intr_420:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_420), 16, 16)) -> intp(2, 3, 1)
	.word 0xba2c2c3e  ! 1: ANDN_I	andn 	%r16, 0x0c3e, %r29
thr3_hw_intr_421:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_421), 16, 16)) -> intp(2, 0, 1)
	.word 0x932c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
thr3_hw_intr_422:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_422), 16, 16)) -> intp(2, 0, 1)
	.word 0x9cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0xb4b42a8c  ! 1: ORNcc_I	orncc 	%r16, 0x0a8c, %r26
thr3_hw_intr_423:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_423), 16, 16)) -> intp(2, 0, 1)
	.word 0x8d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0xb0ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r24
thr3_hw_intr_424:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_424), 16, 16)) -> intp(1, 0, 1)
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
	.word 0xb72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r27
thr3_hw_intr_425:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_425), 16, 16)) -> intp(1, 0, 1)
	.word 0x9cb427da  ! 1: ORNcc_I	orncc 	%r16, 0x07da, %r14
	.word 0xb0042080  ! 1: ADD_I	add 	%r16, 0x0080, %r24
thr3_hw_intr_426:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_426), 16, 16)) -> intp(1, 0, 1)
	.word 0x9f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r15
thr3_nuke_intr_427:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_427), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xa9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r20
	.word 0x9a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0xb2142c53  ! 1: OR_I	or 	%r16, 0x0c53, %r25
thr3_resum_intr_428:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_428), 16, 16)) -> intp(1, 3, 1)
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
	.word 0x96b42c89  ! 1: ORNcc_I	orncc 	%r16, 0x0c89, %r11
	.word 0x9f641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x88040011  ! 1: ADD_R	add 	%r16, %r17, %r4
thr3_hw_intr_429:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_429), 16, 16)) -> intp(0, 0, 1)
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0xad2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r22
	.word 0x94942084  ! 1: ORcc_I	orcc 	%r16, 0x0084, %r10
	.word 0xb4bc232f  ! 1: XNORcc_I	xnorcc 	%r16, 0x032f, %r26
thr3_nuke_intr_430:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_430), 16, 16)) -> intp(1, 2, 1)
	.word 0xb4b42957  ! 1: ORNcc_I	orncc 	%r16, 0x0957, %r26
	.word 0xa63c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r19
thr3_resum_intr_431:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_431), 16, 16)) -> intp(1, 3, 1)
	.word 0x92ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x85641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb6140011  ! 1: OR_R	or 	%r16, %r17, %r27
	.word 0xb89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r28
thr3_nuke_intr_432:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_432), 16, 16)) -> intp(1, 2, 1)
	.word 0xa72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r19
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0xb4b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0xb6140011  ! 1: OR_R	or 	%r16, %r17, %r27
thr3_resum_intr_433:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_433), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c942c1b  ! 1: ORcc_I	orcc 	%r16, 0x0c1b, %r6
	.word 0xb63c26fc  ! 1: XNOR_I	xnor 	%r16, 0x06fc, %r27
thr3_hw_intr_434:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_434), 16, 16)) -> intp(0, 0, 1)
	.word 0x861421c5  ! 1: OR_I	or 	%r16, 0x01c5, %r3
	.word 0x9e040011  ! 1: ADD_R	add 	%r16, %r17, %r15
	.word 0x862c2c52  ! 1: ANDN_I	andn 	%r16, 0x0c52, %r3
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
thr3_nuke_intr_435:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_435), 16, 16)) -> intp(1, 2, 1)
	.word 0x921c2fea  ! 1: XOR_I	xor 	%r16, 0x0fea, %r9
	.word 0xaebc21f5  ! 1: XNORcc_I	xnorcc 	%r16, 0x01f5, %r23
	.word 0x8a040011  ! 1: ADD_R	add 	%r16, %r17, %r5
thr3_resum_intr_436:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_436), 16, 16)) -> intp(1, 3, 1)
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x8cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0xa8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0xb32c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r25
thr3_nuke_intr_437:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_437), 16, 16)) -> intp(2, 2, 1)
	.word 0xb1641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x8c340011  ! 1: ORN_R	orn 	%r16, %r17, %r6
	.word 0xb97c2401  ! 1: MOVR_I	move	%r16, 0x11, %r28
thr3_resum_intr_438:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_438), 16, 16)) -> intp(2, 3, 1)
	.word 0xb1643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9e3c26aa  ! 1: XNOR_I	xnor 	%r16, 0x06aa, %r15
thr3_nuke_intr_439:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_439), 16, 16)) -> intp(2, 2, 1)
	.word 0xb0040011  ! 1: ADD_R	add 	%r16, %r17, %r24
	.word 0xbab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0xa97c2401  ! 1: MOVR_I	move	%r16, 0x11, %r20
	.word 0x92142e51  ! 1: OR_I	or 	%r16, 0x0e51, %r9
thr3_resum_intr_440:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_440), 16, 16)) -> intp(2, 3, 1)
	.word 0xb77c2401  ! 1: MOVR_I	move	%r16, 0xfffffe51, %r27
	.word 0xb4842520  ! 1: ADDcc_I	addcc 	%r16, 0x0520, %r26
thr3_nuke_intr_441:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_441), 16, 16)) -> intp(0, 2, 1)
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
thr3_resum_intr_442:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_442), 16, 16)) -> intp(0, 3, 1)
	.word 0xae1c280c  ! 1: XOR_I	xor 	%r16, 0x080c, %r23
thr3_hw_intr_443:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_443), 16, 16)) -> intp(1, 0, 1)
	.word 0x902c2091  ! 1: ANDN_I	andn 	%r16, 0x0091, %r8
thr3_hw_intr_444:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_444), 16, 16)) -> intp(2, 0, 1)
	.word 0xb8bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
	.word 0xaa142048  ! 1: OR_I	or 	%r16, 0x0048, %r21
thr3_nuke_intr_445:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_445), 16, 16)) -> intp(0, 2, 1)
	.word 0x8d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r6
thr3_resum_intr_446:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_446), 16, 16)) -> intp(0, 3, 1)
	.word 0x849425ba  ! 1: ORcc_I	orcc 	%r16, 0x05ba, %r2
	.word 0xb1343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r24
thr3_nuke_intr_447:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_447), 16, 16)) -> intp(2, 2, 1)
	.word 0x9c9c25f9  ! 1: XORcc_I	xorcc 	%r16, 0x05f9, %r14
thr3_resum_intr_448:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_448), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c040011  ! 1: ADD_R	add 	%r16, %r17, %r6
	.word 0xae9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x82440011  ! 1: ADDC_R	addc 	%r16, %r17, %r1
	.word 0xbb341011  ! 1: SRLX_R	srlx	%r16, %r17, %r29
thr3_hw_intr_449:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_449), 16, 16)) -> intp(2, 0, 1)
	.word 0xbaac2093  ! 1: ANDNcc_I	andncc 	%r16, 0x0093, %r29
	.word 0x9e1423b6  ! 1: OR_I	or 	%r16, 0x03b6, %r15
	.word 0x8c342676  ! 1: ORN_I	orn 	%r16, 0x0676, %r6
thr3_nuke_intr_450:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_450), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a9c2373  ! 1: XORcc_I	xorcc 	%r16, 0x0373, %r5
	.word 0xb48c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r7
thr3_resum_intr_451:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_451), 16, 16)) -> intp(1, 3, 1)
	.word 0xad7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r22
	.word 0xbaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r29
	.word 0xaf2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r23
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
thr3_nuke_intr_452:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_452), 16, 16)) -> intp(0, 2, 1)
	.word 0x9d3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x8d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r6
	.word 0x86ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r3
thr3_resum_intr_453:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_453), 16, 16)) -> intp(0, 3, 1)
	.word 0x903c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r8
thr3_nuke_intr_454:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_454), 16, 16)) -> intp(0, 2, 1)
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
	.word 0x9ac42c95  ! 1: ADDCcc_I	addccc 	%r16, 0x0c95, %r13
thr3_resum_intr_455:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_455), 16, 16)) -> intp(0, 3, 1)
	.word 0xac040011  ! 1: ADD_R	add 	%r16, %r17, %r22
	.word 0x9c140011  ! 1: OR_R	or 	%r16, %r17, %r14
thr3_hw_intr_456:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_456), 16, 16)) -> intp(0, 0, 1)
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
	.word 0x941c2d20  ! 1: XOR_I	xor 	%r16, 0x0d20, %r10
	.word 0xae840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x96c42e15  ! 1: ADDCcc_I	addccc 	%r16, 0x0e15, %r11
thr3_hw_intr_457:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_457), 16, 16)) -> intp(2, 0, 1)
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x98942bfe  ! 1: ORcc_I	orcc 	%r16, 0x0bfe, %r12
thr3_nuke_intr_458:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_458), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8340011  ! 1: ORN_R	orn 	%r16, %r17, %r20
thr3_resum_intr_459:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_459), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8b42421  ! 1: ORNcc_I	orncc 	%r16, 0x0421, %r28
thr3_hw_intr_460:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_460), 16, 16)) -> intp(1, 0, 1)
	.word 0x8f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x993c1011  ! 1: SRAX_R	srax	%r16, %r17, %r12
	.word 0xb8ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r28
	.word 0x8c0c0011  ! 1: AND_R	and 	%r16, %r17, %r6
thr3_hw_intr_461:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_461), 16, 16)) -> intp(1, 0, 1)
	.word 0x88ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x9eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x8d340011  ! 1: SRL_R	srl 	%r16, %r17, %r6
	.word 0x972c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r11
thr3_nuke_intr_462:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_462), 16, 16)) -> intp(0, 2, 1)
	.word 0x9cb4229a  ! 1: ORNcc_I	orncc 	%r16, 0x029a, %r14
	.word 0x92940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x87342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
thr3_resum_intr_463:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_463), 16, 16)) -> intp(0, 3, 1)
	.word 0x889423f6  ! 1: ORcc_I	orcc 	%r16, 0x03f6, %r4
thr3_hw_intr_464:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_464), 16, 16)) -> intp(2, 0, 1)
	.word 0x8a140011  ! 1: OR_R	or 	%r16, %r17, %r5
	.word 0x9f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r15
thr3_hw_intr_465:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_465), 16, 16)) -> intp(1, 0, 1)
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0x8c04240d  ! 1: ADD_I	add 	%r16, 0x040d, %r6
	.word 0xacac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0xad641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_466:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_466), 16, 16)) -> intp(1, 2, 1)
	.word 0xba3426c0  ! 1: ORN_I	orn 	%r16, 0x06c0, %r29
	.word 0x920c23cf  ! 1: AND_I	and 	%r16, 0x03cf, %r9
	.word 0xac2c2139  ! 1: ANDN_I	andn 	%r16, 0x0139, %r22
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
thr3_resum_intr_467:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_467), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0x8cac28a5  ! 1: ANDNcc_I	andncc 	%r16, 0x08a5, %r6
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
thr3_nuke_intr_468:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_468), 16, 16)) -> intp(2, 2, 1)
	.word 0x962c20ca  ! 1: ANDN_I	andn 	%r16, 0x00ca, %r11
	.word 0xb8b42d56  ! 1: ORNcc_I	orncc 	%r16, 0x0d56, %r28
thr3_resum_intr_469:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_469), 16, 16)) -> intp(2, 3, 1)
	.word 0xb49c2ccd  ! 1: XORcc_I	xorcc 	%r16, 0x0ccd, %r26
	.word 0x897c0411  ! 1: MOVR_R	move	%r16, %r17, %r4
	.word 0xb73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r27
	.word 0x981426c4  ! 1: OR_I	or 	%r16, 0x06c4, %r12
thr3_hw_intr_470:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_470), 16, 16)) -> intp(1, 0, 1)
	.word 0x972c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r11
thr3_nuke_intr_471:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_471), 16, 16)) -> intp(2, 2, 1)
	.word 0x94ac2470  ! 1: ANDNcc_I	andncc 	%r16, 0x0470, %r10
	.word 0x869c211f  ! 1: XORcc_I	xorcc 	%r16, 0x011f, %r3
	.word 0x98ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xb60c21c1  ! 1: AND_I	and 	%r16, 0x01c1, %r27
thr3_resum_intr_472:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_472), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e4429c1  ! 1: ADDC_I	addc 	%r16, 0x09c1, %r15
	.word 0xbb2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xba84255c  ! 1: ADDcc_I	addcc 	%r16, 0x055c, %r29
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
thr3_nuke_intr_473:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_473), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
	.word 0xba140011  ! 1: OR_R	or 	%r16, %r17, %r29
thr3_resum_intr_474:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_474), 16, 16)) -> intp(1, 3, 1)
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0xb9643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_475:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_475), 16, 16)) -> intp(1, 0, 1)
	.word 0x86042a8a  ! 1: ADD_I	add 	%r16, 0x0a8a, %r3
thr3_hw_intr_476:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_476), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa342f4d  ! 1: ORN_I	orn 	%r16, 0x0f4d, %r21
	.word 0x917c2401  ! 1: MOVR_I	move	%r16, 0xffffff4d, %r8
	.word 0x9b7c2401  ! 1: MOVR_I	move	%r16, 0xffffff4d, %r13
	.word 0x9e442301  ! 1: ADDC_I	addc 	%r16, 0x0301, %r15
thr3_hw_intr_477:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_477), 16, 16)) -> intp(2, 0, 1)
	.word 0x943c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x8f641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_478:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_478), 16, 16)) -> intp(0, 0, 1)
	.word 0x94b425d1  ! 1: ORNcc_I	orncc 	%r16, 0x05d1, %r10
	.word 0xaf341011  ! 1: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xacc42256  ! 1: ADDCcc_I	addccc 	%r16, 0x0256, %r22
	.word 0x8c340011  ! 1: ORN_R	orn 	%r16, %r17, %r6
thr3_nuke_intr_479:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_479), 16, 16)) -> intp(0, 2, 1)
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0xb9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r28
thr3_resum_intr_480:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_480), 16, 16)) -> intp(0, 3, 1)
	.word 0xb4ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0xba8c2517  ! 1: ANDcc_I	andcc 	%r16, 0x0517, %r29
	.word 0x84ac2cf0  ! 1: ANDNcc_I	andncc 	%r16, 0x0cf0, %r2
thr3_nuke_intr_481:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_481), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4440011  ! 1: ADDC_R	addc 	%r16, %r17, %r26
	.word 0x957c0411  ! 1: MOVR_R	move	%r16, %r17, %r10
thr3_resum_intr_482:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_482), 16, 16)) -> intp(0, 3, 1)
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
	.word 0x84140011  ! 1: OR_R	or 	%r16, %r17, %r2
thr3_nuke_intr_483:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_483), 16, 16)) -> intp(1, 2, 1)
	.word 0xb69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0x9c842107  ! 1: ADDcc_I	addcc 	%r16, 0x0107, %r14
	.word 0x872c0011  ! 1: SLL_R	sll 	%r16, %r17, %r3
thr3_resum_intr_484:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_484), 16, 16)) -> intp(1, 3, 1)
	.word 0x8b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r5
thr3_hw_intr_485:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_485), 16, 16)) -> intp(2, 0, 1)
	.word 0x8abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r5
thr3_nuke_intr_486:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_486), 16, 16)) -> intp(0, 2, 1)
	.word 0xacac2478  ! 1: ANDNcc_I	andncc 	%r16, 0x0478, %r22
	.word 0xba940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r29
thr3_resum_intr_487:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_487), 16, 16)) -> intp(0, 3, 1)
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
	.word 0xa92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r20
	.word 0x8e8c2b3f  ! 1: ANDcc_I	andcc 	%r16, 0x0b3f, %r7
thr3_hw_intr_488:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_488), 16, 16)) -> intp(0, 0, 1)
	.word 0x8f641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x828c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x8ec42bfd  ! 1: ADDCcc_I	addccc 	%r16, 0x0bfd, %r7
	.word 0x9f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r15
thr3_hw_intr_489:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_489), 16, 16)) -> intp(1, 0, 1)
	.word 0x900c246c  ! 1: AND_I	and 	%r16, 0x046c, %r8
	.word 0x8f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x873c1011  ! 1: SRAX_R	srax	%r16, %r17, %r3
	.word 0x8b7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r5
thr3_hw_intr_490:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_490), 16, 16)) -> intp(1, 0, 1)
	.word 0xab340011  ! 1: SRL_R	srl 	%r16, %r17, %r21
	.word 0xaf343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0xb9342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r28
thr3_hw_intr_491:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_491), 16, 16)) -> intp(1, 0, 1)
	.word 0x943c26a6  ! 1: XNOR_I	xnor 	%r16, 0x06a6, %r10
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
thr3_hw_intr_492:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_492), 16, 16)) -> intp(0, 0, 1)
	.word 0x98442704  ! 1: ADDC_I	addc 	%r16, 0x0704, %r12
thr3_hw_intr_493:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_493), 16, 16)) -> intp(1, 0, 1)
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
thr3_nuke_intr_494:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_494), 16, 16)) -> intp(2, 2, 1)
	.word 0xab343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0x969c2256  ! 1: XORcc_I	xorcc 	%r16, 0x0256, %r11
	.word 0xb9340011  ! 1: SRL_R	srl 	%r16, %r17, %r28
	.word 0xaa340011  ! 1: ORN_R	orn 	%r16, %r17, %r21
thr3_resum_intr_495:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_495), 16, 16)) -> intp(2, 3, 1)
	.word 0x869c2937  ! 1: XORcc_I	xorcc 	%r16, 0x0937, %r3
thr3_hw_intr_496:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_496), 16, 16)) -> intp(0, 0, 1)
	.word 0xb32c0011  ! 1: SLL_R	sll 	%r16, %r17, %r25
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
thr3_nuke_intr_497:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_497), 16, 16)) -> intp(1, 2, 1)
	.word 0xac140011  ! 1: OR_R	or 	%r16, %r17, %r22
	.word 0x98bc2c51  ! 1: XNORcc_I	xnorcc 	%r16, 0x0c51, %r12
thr3_resum_intr_498:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_498), 16, 16)) -> intp(1, 3, 1)
	.word 0xa83c24db  ! 1: XNOR_I	xnor 	%r16, 0x04db, %r20
thr3_nuke_intr_499:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_499), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r27
thr3_resum_intr_500:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_500), 16, 16)) -> intp(0, 3, 1)
	.word 0x8b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0x9abc2dd0  ! 1: XNORcc_I	xnorcc 	%r16, 0x0dd0, %r13
thr3_hw_intr_501:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_501), 16, 16)) -> intp(0, 0, 1)
	.word 0xb0c42a8e  ! 1: ADDCcc_I	addccc 	%r16, 0x0a8e, %r24
	.word 0x8ebc2228  ! 1: XNORcc_I	xnorcc 	%r16, 0x0228, %r7
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
thr3_hw_intr_502:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_502), 16, 16)) -> intp(1, 0, 1)
	.word 0x823c2509  ! 1: XNOR_I	xnor 	%r16, 0x0509, %r1
	.word 0xb43c29af  ! 1: XNOR_I	xnor 	%r16, 0x09af, %r26
	.word 0x8894225d  ! 1: ORcc_I	orcc 	%r16, 0x025d, %r4
thr3_nuke_intr_503:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_503), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e9424f8  ! 1: ORcc_I	orcc 	%r16, 0x04f8, %r7
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
	.word 0xbab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r29
thr3_resum_intr_504:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_504), 16, 16)) -> intp(0, 3, 1)
	.word 0x90140011  ! 1: OR_R	or 	%r16, %r17, %r8
thr3_hw_intr_505:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_505), 16, 16)) -> intp(0, 0, 1)
	.word 0x9aac27f4  ! 1: ANDNcc_I	andncc 	%r16, 0x07f4, %r13
	.word 0xad3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r22
	.word 0xae0423d0  ! 1: ADD_I	add 	%r16, 0x03d0, %r23
	.word 0x960c280f  ! 1: AND_I	and 	%r16, 0x080f, %r11
thr3_hw_intr_506:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_506), 16, 16)) -> intp(1, 0, 1)
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x8f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r7
thr3_nuke_intr_507:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_507), 16, 16)) -> intp(1, 2, 1)
	.word 0x940c2527  ! 1: AND_I	and 	%r16, 0x0527, %r10
thr3_resum_intr_508:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_508), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x96442bf3  ! 1: ADDC_I	addc 	%r16, 0x0bf3, %r11
thr3_nuke_intr_509:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_509), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c0c2ad7  ! 1: AND_I	and 	%r16, 0x0ad7, %r6
thr3_resum_intr_510:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_510), 16, 16)) -> intp(2, 3, 1)
	.word 0x877c0411  ! 1: MOVR_R	move	%r16, %r17, %r3
thr3_hw_intr_511:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_511), 16, 16)) -> intp(2, 0, 1)
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0xa63c228b  ! 1: XNOR_I	xnor 	%r16, 0x028b, %r19
	.word 0xb89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r28
thr3_nuke_intr_512:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_512), 16, 16)) -> intp(2, 2, 1)
	.word 0x92040011  ! 1: ADD_R	add 	%r16, %r17, %r9
	.word 0x9c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r14
thr3_resum_intr_513:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_513), 16, 16)) -> intp(2, 3, 1)
	.word 0xb7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x86bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r3
thr3_hw_intr_514:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_514), 16, 16)) -> intp(0, 0, 1)
	.word 0x889c272b  ! 1: XORcc_I	xorcc 	%r16, 0x072b, %r4
	.word 0x91340011  ! 1: SRL_R	srl 	%r16, %r17, %r8
thr3_nuke_intr_515:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_515), 16, 16)) -> intp(2, 2, 1)
	.word 0xa7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r19
	.word 0xb17c2401  ! 1: MOVR_I	move	%r16, 0x1, %r24
thr3_resum_intr_516:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_516), 16, 16)) -> intp(2, 3, 1)
	.word 0x949c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0x872c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x8e0c2576  ! 1: AND_I	and 	%r16, 0x0576, %r7
thr3_hw_intr_517:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_517), 16, 16)) -> intp(0, 0, 1)
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
	.word 0xb0840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0xacbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r22
thr3_nuke_intr_518:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_518), 16, 16)) -> intp(1, 2, 1)
	.word 0x9cb42153  ! 1: ORNcc_I	orncc 	%r16, 0x0153, %r14
	.word 0xac0427a1  ! 1: ADD_I	add 	%r16, 0x07a1, %r22
	.word 0x984420b4  ! 1: ADDC_I	addc 	%r16, 0x00b4, %r12
thr3_resum_intr_519:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_519), 16, 16)) -> intp(1, 3, 1)
	.word 0x9cc42e48  ! 1: ADDCcc_I	addccc 	%r16, 0x0e48, %r14
	.word 0x96b42a32  ! 1: ORNcc_I	orncc 	%r16, 0x0a32, %r11
	.word 0xa6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r19
thr3_nuke_intr_520:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_520), 16, 16)) -> intp(2, 2, 1)
	.word 0x9b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r13
	.word 0x932c0011  ! 1: SLL_R	sll 	%r16, %r17, %r9
	.word 0x90b42265  ! 1: ORNcc_I	orncc 	%r16, 0x0265, %r8
	.word 0xa6040011  ! 1: ADD_R	add 	%r16, %r17, %r19
thr3_resum_intr_521:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_521), 16, 16)) -> intp(2, 3, 1)
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
	.word 0xae040011  ! 1: ADD_R	add 	%r16, %r17, %r23
	.word 0xb01c0011  ! 1: XOR_R	xor 	%r16, %r17, %r24
	.word 0x84840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r2
thr3_nuke_intr_522:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_522), 16, 16)) -> intp(2, 2, 1)
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
thr3_resum_intr_523:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_523), 16, 16)) -> intp(2, 3, 1)
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x8a1c2875  ! 1: XOR_I	xor 	%r16, 0x0875, %r5
thr3_hw_intr_524:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_524), 16, 16)) -> intp(0, 0, 1)
	.word 0xb57c2401  ! 1: MOVR_I	move	%r16, 0x875, %r26
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x822c2ec7  ! 1: ANDN_I	andn 	%r16, 0x0ec7, %r1
thr3_nuke_intr_525:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_525), 16, 16)) -> intp(0, 2, 1)
	.word 0x912c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0xb63422bb  ! 1: ORN_I	orn 	%r16, 0x02bb, %r27
	.word 0xaa140011  ! 1: OR_R	or 	%r16, %r17, %r21
thr3_resum_intr_526:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_526), 16, 16)) -> intp(0, 3, 1)
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
	.word 0x8c042de6  ! 1: ADD_I	add 	%r16, 0x0de6, %r6
	.word 0xae3428a9  ! 1: ORN_I	orn 	%r16, 0x08a9, %r23
	.word 0xb6442a3f  ! 1: ADDC_I	addc 	%r16, 0x0a3f, %r27
thr3_hw_intr_527:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_527), 16, 16)) -> intp(0, 0, 1)
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0x84ac2404  ! 1: ANDNcc_I	andncc 	%r16, 0x0404, %r2
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0xb52c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r26
thr3_nuke_intr_528:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_528), 16, 16)) -> intp(1, 2, 1)
	.word 0x97643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9294243a  ! 1: ORcc_I	orcc 	%r16, 0x043a, %r9
	.word 0x84140011  ! 1: OR_R	or 	%r16, %r17, %r2
thr3_resum_intr_529:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_529), 16, 16)) -> intp(1, 3, 1)
	.word 0xae940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0x952c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x9b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
thr3_nuke_intr_530:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_530), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x9eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xb6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r27
	.word 0xbb343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r29
thr3_resum_intr_531:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_531), 16, 16)) -> intp(1, 3, 1)
	.word 0x9b340011  ! 1: SRL_R	srl 	%r16, %r17, %r13
thr3_nuke_intr_532:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_532), 16, 16)) -> intp(0, 2, 1)
	.word 0x92940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0xb3641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_533:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_533), 16, 16)) -> intp(0, 3, 1)
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x88042aeb  ! 1: ADD_I	add 	%r16, 0x0aeb, %r4
	.word 0xbb343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
thr3_nuke_intr_534:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_534), 16, 16)) -> intp(0, 2, 1)
	.word 0x983c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0x929424df  ! 1: ORcc_I	orcc 	%r16, 0x04df, %r9
thr3_resum_intr_535:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_535), 16, 16)) -> intp(0, 3, 1)
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0xb4340011  ! 1: ORN_R	orn 	%r16, %r17, %r26
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
thr3_nuke_intr_536:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_536), 16, 16)) -> intp(1, 2, 1)
	.word 0xb5643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb32c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r25
thr3_resum_intr_537:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_537), 16, 16)) -> intp(1, 3, 1)
	.word 0x8cac2540  ! 1: ANDNcc_I	andncc 	%r16, 0x0540, %r6
thr3_nuke_intr_538:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_538), 16, 16)) -> intp(0, 2, 1)
	.word 0xb8bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
thr3_resum_intr_539:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_539), 16, 16)) -> intp(0, 3, 1)
	.word 0x86440011  ! 1: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
thr3_hw_intr_540:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_540), 16, 16)) -> intp(1, 0, 1)
	.word 0x8814242c  ! 1: OR_I	or 	%r16, 0x042c, %r4
	.word 0xa844278c  ! 1: ADDC_I	addc 	%r16, 0x078c, %r20
	.word 0x9e0c2bca  ! 1: AND_I	and 	%r16, 0x0bca, %r15
thr3_nuke_intr_541:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_541), 16, 16)) -> intp(1, 2, 1)
	.word 0xba940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x99641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_542:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_542), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
	.word 0x96342c19  ! 1: ORN_I	orn 	%r16, 0x0c19, %r11
	.word 0x8e04279e  ! 1: ADD_I	add 	%r16, 0x079e, %r7
thr3_hw_intr_543:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_543), 16, 16)) -> intp(2, 0, 1)
	.word 0x872c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0xa92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r20
thr3_nuke_intr_544:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_544), 16, 16)) -> intp(0, 2, 1)
	.word 0x861c2e9a  ! 1: XOR_I	xor 	%r16, 0x0e9a, %r3
	.word 0x8eac22bc  ! 1: ANDNcc_I	andncc 	%r16, 0x02bc, %r7
	.word 0xb37c2401  ! 1: MOVR_I	move	%r16, 0xfffffebc, %r25
thr3_resum_intr_545:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_545), 16, 16)) -> intp(0, 3, 1)
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
	.word 0xa77c2401  ! 1: MOVR_I	move	%r16, 0x11, %r19
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
thr3_nuke_intr_546:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_546), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a442e35  ! 1: ADDC_I	addc 	%r16, 0x0e35, %r5
	.word 0xb72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r27
	.word 0x928c2c3a  ! 1: ANDcc_I	andcc 	%r16, 0x0c3a, %r9
thr3_resum_intr_547:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_547), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x9a340011  ! 1: ORN_R	orn 	%r16, %r17, %r13
thr3_nuke_intr_548:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_548), 16, 16)) -> intp(0, 2, 1)
	.word 0x8b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r5
	.word 0x8c040011  ! 1: ADD_R	add 	%r16, %r17, %r6
	.word 0x86042a17  ! 1: ADD_I	add 	%r16, 0x0a17, %r3
	.word 0x8d641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_549:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_549), 16, 16)) -> intp(0, 3, 1)
	.word 0x9e140011  ! 1: OR_R	or 	%r16, %r17, %r15
thr3_nuke_intr_550:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_550), 16, 16)) -> intp(2, 2, 1)
	.word 0xa6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r19
	.word 0x96440011  ! 1: ADDC_R	addc 	%r16, %r17, %r11
thr3_resum_intr_551:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_551), 16, 16)) -> intp(2, 3, 1)
	.word 0xa80423e5  ! 1: ADD_I	add 	%r16, 0x03e5, %r20
thr3_hw_intr_552:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_552), 16, 16)) -> intp(0, 0, 1)
	.word 0xa93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
thr3_nuke_intr_553:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_553), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6140011  ! 1: OR_R	or 	%r16, %r17, %r27
	.word 0xaab42253  ! 1: ORNcc_I	orncc 	%r16, 0x0253, %r21
	.word 0xa92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r20
thr3_resum_intr_554:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_554), 16, 16)) -> intp(0, 3, 1)
	.word 0x9c0c0011  ! 1: AND_R	and 	%r16, %r17, %r14
	.word 0xb93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r28
	.word 0xacb42064  ! 1: ORNcc_I	orncc 	%r16, 0x0064, %r22
	.word 0x84942126  ! 1: ORcc_I	orcc 	%r16, 0x0126, %r2
thr3_hw_intr_555:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_555), 16, 16)) -> intp(0, 0, 1)
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x8eac2e00  ! 1: ANDNcc_I	andncc 	%r16, 0x0e00, %r7
	.word 0x902c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r8
thr3_hw_intr_556:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_556), 16, 16)) -> intp(1, 0, 1)
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
thr3_nuke_intr_557:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_557), 16, 16)) -> intp(2, 2, 1)
	.word 0x82340011  ! 1: ORN_R	orn 	%r16, %r17, %r1
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
thr3_resum_intr_558:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_558), 16, 16)) -> intp(2, 3, 1)
	.word 0xa6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r19
	.word 0xaeac2d7f  ! 1: ANDNcc_I	andncc 	%r16, 0x0d7f, %r23
	.word 0x96342917  ! 1: ORN_I	orn 	%r16, 0x0917, %r11
thr3_hw_intr_559:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_559), 16, 16)) -> intp(2, 0, 1)
	.word 0xb8842dc7  ! 1: ADDcc_I	addcc 	%r16, 0x0dc7, %r28
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0xaa340011  ! 1: ORN_R	orn 	%r16, %r17, %r21
thr3_hw_intr_560:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_560), 16, 16)) -> intp(0, 0, 1)
	.word 0xb53c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r26
thr3_nuke_intr_561:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_561), 16, 16)) -> intp(1, 2, 1)
	.word 0x9d643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_562:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_562), 16, 16)) -> intp(1, 3, 1)
	.word 0x82942de1  ! 1: ORcc_I	orcc 	%r16, 0x0de1, %r1
thr3_nuke_intr_563:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_563), 16, 16)) -> intp(1, 2, 1)
	.word 0x8cc42715  ! 1: ADDCcc_I	addccc 	%r16, 0x0715, %r6
	.word 0x93342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r9
thr3_resum_intr_564:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_564), 16, 16)) -> intp(1, 3, 1)
	.word 0x86c42071  ! 1: ADDCcc_I	addccc 	%r16, 0x0071, %r3
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
	.word 0xa88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r20
thr3_hw_intr_565:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_565), 16, 16)) -> intp(0, 0, 1)
	.word 0x8d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r6
thr3_hw_intr_566:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_566), 16, 16)) -> intp(0, 0, 1)
	.word 0x8c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0xab3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r21
thr3_nuke_intr_567:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_567), 16, 16)) -> intp(2, 2, 1)
	.word 0x943c2b80  ! 1: XNOR_I	xnor 	%r16, 0x0b80, %r10
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
thr3_resum_intr_568:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_568), 16, 16)) -> intp(2, 3, 1)
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0xb77c2401  ! 1: MOVR_I	move	%r16, 0x11, %r27
	.word 0x9e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r15
thr3_nuke_intr_569:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_569), 16, 16)) -> intp(0, 2, 1)
	.word 0x943c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x9c340011  ! 1: ORN_R	orn 	%r16, %r17, %r14
thr3_resum_intr_570:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_570), 16, 16)) -> intp(0, 3, 1)
	.word 0xa8342ced  ! 1: ORN_I	orn 	%r16, 0x0ced, %r20
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
	.word 0x8a1c289d  ! 1: XOR_I	xor 	%r16, 0x089d, %r5
thr3_nuke_intr_571:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_571), 16, 16)) -> intp(2, 2, 1)
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
thr3_resum_intr_572:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_572), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xba342b62  ! 1: ORN_I	orn 	%r16, 0x0b62, %r29
	.word 0x89342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r4
thr3_hw_intr_573:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_573), 16, 16)) -> intp(2, 0, 1)
	.word 0x848c2c01  ! 1: ANDcc_I	andcc 	%r16, 0x0c01, %r2
	.word 0xb02c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r24
	.word 0xb6c42ec5  ! 1: ADDCcc_I	addccc 	%r16, 0x0ec5, %r27
	.word 0x853c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r2
thr3_nuke_intr_574:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_574), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a8c2add  ! 1: ANDcc_I	andcc 	%r16, 0x0add, %r13
	.word 0x98c42af8  ! 1: ADDCcc_I	addccc 	%r16, 0x0af8, %r12
	.word 0xb1342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r24
thr3_resum_intr_575:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_575), 16, 16)) -> intp(1, 3, 1)
	.word 0x923c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r7
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
thr3_nuke_intr_576:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_576), 16, 16)) -> intp(0, 2, 1)
	.word 0x82c42250  ! 1: ADDCcc_I	addccc 	%r16, 0x0250, %r1
	.word 0x977c2401  ! 1: MOVR_I	move	%r16, 0xfffffe50, %r11
	.word 0x96342e05  ! 1: ORN_I	orn 	%r16, 0x0e05, %r11
	.word 0xac1c2a3a  ! 1: XOR_I	xor 	%r16, 0x0a3a, %r22
thr3_resum_intr_577:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_577), 16, 16)) -> intp(0, 3, 1)
	.word 0x96bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0xb80c0011  ! 1: AND_R	and 	%r16, %r17, %r28
	.word 0xaab42015  ! 1: ORNcc_I	orncc 	%r16, 0x0015, %r21
thr3_hw_intr_578:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_578), 16, 16)) -> intp(0, 0, 1)
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
thr3_nuke_intr_579:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_579), 16, 16)) -> intp(0, 2, 1)
	.word 0x9a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x8e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x9604289b  ! 1: ADD_I	add 	%r16, 0x089b, %r11
	.word 0xb28c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r25
thr3_resum_intr_580:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_580), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0xae0c0011  ! 1: AND_R	and 	%r16, %r17, %r23
	.word 0x8a1424a5  ! 1: OR_I	or 	%r16, 0x04a5, %r5
thr3_hw_intr_581:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_581), 16, 16)) -> intp(0, 0, 1)
	.word 0x94042571  ! 1: ADD_I	add 	%r16, 0x0571, %r10
thr3_hw_intr_582:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_582), 16, 16)) -> intp(1, 0, 1)
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
	.word 0xba9c2bac  ! 1: XORcc_I	xorcc 	%r16, 0x0bac, %r29
	.word 0x94442dcf  ! 1: ADDC_I	addc 	%r16, 0x0dcf, %r10
thr3_nuke_intr_583:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_583), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e1425ca  ! 1: OR_I	or 	%r16, 0x05ca, %r7
	.word 0x8b7c0411  ! 1: MOVR_R	move	%r16, %r17, %r5
	.word 0xa8142885  ! 1: OR_I	or 	%r16, 0x0885, %r20
thr3_resum_intr_584:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_584), 16, 16)) -> intp(0, 3, 1)
	.word 0xb1641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
thr3_nuke_intr_585:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_585), 16, 16)) -> intp(2, 2, 1)
	.word 0xa60c0011  ! 1: AND_R	and 	%r16, %r17, %r19
	.word 0xb03c2160  ! 1: XNOR_I	xnor 	%r16, 0x0160, %r24
	.word 0x840c29a6  ! 1: AND_I	and 	%r16, 0x09a6, %r2
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
thr3_resum_intr_586:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_586), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0xa814253f  ! 1: OR_I	or 	%r16, 0x053f, %r20
	.word 0x96b42039  ! 1: ORNcc_I	orncc 	%r16, 0x0039, %r11
	.word 0x87340011  ! 1: SRL_R	srl 	%r16, %r17, %r3
thr3_nuke_intr_587:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_587), 16, 16)) -> intp(1, 2, 1)
	.word 0x94bc2f72  ! 1: XNORcc_I	xnorcc 	%r16, 0x0f72, %r10
	.word 0x88842e11  ! 1: ADDcc_I	addcc 	%r16, 0x0e11, %r4
thr3_resum_intr_588:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_588), 16, 16)) -> intp(1, 3, 1)
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
thr3_nuke_intr_589:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_589), 16, 16)) -> intp(0, 2, 1)
	.word 0xad2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r22
	.word 0x853c1011  ! 1: SRAX_R	srax	%r16, %r17, %r2
	.word 0x86042944  ! 1: ADD_I	add 	%r16, 0x0944, %r3
thr3_resum_intr_590:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_590), 16, 16)) -> intp(0, 3, 1)
	.word 0x843c2f64  ! 1: XNOR_I	xnor 	%r16, 0x0f64, %r2
	.word 0xb2ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0xaf340011  ! 1: SRL_R	srl 	%r16, %r17, %r23
	.word 0x96bc22f6  ! 1: XNORcc_I	xnorcc 	%r16, 0x02f6, %r11
thr3_nuke_intr_591:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_591), 16, 16)) -> intp(0, 2, 1)
	.word 0xb7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
thr3_resum_intr_592:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_592), 16, 16)) -> intp(0, 3, 1)
	.word 0x8a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x882c2f70  ! 1: ANDN_I	andn 	%r16, 0x0f70, %r4
	.word 0xb094202d  ! 1: ORcc_I	orcc 	%r16, 0x002d, %r24
thr3_hw_intr_593:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_593), 16, 16)) -> intp(1, 0, 1)
	.word 0x841c2545  ! 1: XOR_I	xor 	%r16, 0x0545, %r2
	.word 0x9d643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
thr3_hw_intr_594:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_594), 16, 16)) -> intp(0, 0, 1)
	.word 0x8f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x8eac2e25  ! 1: ANDNcc_I	andncc 	%r16, 0x0e25, %r7
thr3_hw_intr_595:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_595), 16, 16)) -> intp(0, 0, 1)
	.word 0x993c1011  ! 1: SRAX_R	srax	%r16, %r17, %r12
thr3_nuke_intr_596:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_596), 16, 16)) -> intp(0, 2, 1)
	.word 0x8d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r6
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x900c0011  ! 1: AND_R	and 	%r16, %r17, %r8
thr3_resum_intr_597:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_597), 16, 16)) -> intp(0, 3, 1)
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x9a2c2aa0  ! 1: ANDN_I	andn 	%r16, 0x0aa0, %r13
	.word 0x9e442280  ! 1: ADDC_I	addc 	%r16, 0x0280, %r15
thr3_nuke_intr_598:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_598), 16, 16)) -> intp(2, 2, 1)
	.word 0x93341011  ! 1: SRLX_R	srlx	%r16, %r17, %r9
	.word 0xb5641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x82340011  ! 1: ORN_R	orn 	%r16, %r17, %r1
thr3_resum_intr_599:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_599), 16, 16)) -> intp(2, 3, 1)
	.word 0x9cb424f7  ! 1: ORNcc_I	orncc 	%r16, 0x04f7, %r14
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
	.word 0x9cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r14
thr3_nuke_intr_600:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_600), 16, 16)) -> intp(1, 2, 1)
	.word 0xb44424c9  ! 1: ADDC_I	addc 	%r16, 0x04c9, %r26
thr3_resum_intr_601:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_601), 16, 16)) -> intp(1, 3, 1)
	.word 0xaeb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r23
thr3_hw_intr_602:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_602), 16, 16)) -> intp(2, 0, 1)
	.word 0x900c29aa  ! 1: AND_I	and 	%r16, 0x09aa, %r8
	.word 0x888c2098  ! 1: ANDcc_I	andcc 	%r16, 0x0098, %r4
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
thr3_hw_intr_603:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_603), 16, 16)) -> intp(0, 0, 1)
	.word 0x85343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r2
thr3_nuke_intr_604:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_604), 16, 16)) -> intp(1, 2, 1)
	.word 0x949c2d03  ! 1: XORcc_I	xorcc 	%r16, 0x0d03, %r10
thr3_resum_intr_605:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_605), 16, 16)) -> intp(1, 3, 1)
	.word 0x821c2ce7  ! 1: XOR_I	xor 	%r16, 0x0ce7, %r1
	.word 0x9b340011  ! 1: SRL_R	srl 	%r16, %r17, %r13
thr3_hw_intr_606:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_606), 16, 16)) -> intp(1, 0, 1)
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0xb0bc2e15  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e15, %r24
	.word 0x9e140011  ! 1: OR_R	or 	%r16, %r17, %r15
thr3_nuke_intr_607:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_607), 16, 16)) -> intp(1, 2, 1)
	.word 0x880c2fb9  ! 1: AND_I	and 	%r16, 0x0fb9, %r4
thr3_resum_intr_608:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_608), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
thr3_nuke_intr_609:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_609), 16, 16)) -> intp(0, 2, 1)
	.word 0x93342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x9f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r15
thr3_resum_intr_610:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_610), 16, 16)) -> intp(0, 3, 1)
	.word 0xa9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r20
	.word 0x962c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r11
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x84442426  ! 1: ADDC_I	addc 	%r16, 0x0426, %r2
thr3_hw_intr_611:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_611), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4bc243d  ! 1: XNORcc_I	xnorcc 	%r16, 0x043d, %r26
	.word 0x8cb42f4f  ! 1: ORNcc_I	orncc 	%r16, 0x0f4f, %r6
	.word 0x892c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r4
thr3_nuke_intr_612:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_612), 16, 16)) -> intp(1, 2, 1)
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
	.word 0x9084278e  ! 1: ADDcc_I	addcc 	%r16, 0x078e, %r8
	.word 0xb0b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r24
thr3_resum_intr_613:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_613), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf340011  ! 1: SRL_R	srl 	%r16, %r17, %r23
thr3_nuke_intr_614:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_614), 16, 16)) -> intp(1, 2, 1)
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0xb0c42117  ! 1: ADDCcc_I	addccc 	%r16, 0x0117, %r24
thr3_resum_intr_615:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_615), 16, 16)) -> intp(1, 3, 1)
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
	.word 0x9a942464  ! 1: ORcc_I	orcc 	%r16, 0x0464, %r13
	.word 0x909c2029  ! 1: XORcc_I	xorcc 	%r16, 0x0029, %r8
	.word 0xbab42803  ! 1: ORNcc_I	orncc 	%r16, 0x0803, %r29
thr3_nuke_intr_616:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_616), 16, 16)) -> intp(0, 2, 1)
	.word 0x9a4420e4  ! 1: ADDC_I	addc 	%r16, 0x00e4, %r13
thr3_resum_intr_617:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_617), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8040011  ! 1: ADD_R	add 	%r16, %r17, %r28
	.word 0xae440011  ! 1: ADDC_R	addc 	%r16, %r17, %r23
	.word 0xb6140011  ! 1: OR_R	or 	%r16, %r17, %r27
thr3_nuke_intr_618:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_618), 16, 16)) -> intp(1, 2, 1)
	.word 0xa7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r19
thr3_resum_intr_619:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_619), 16, 16)) -> intp(1, 3, 1)
	.word 0xb0842afe  ! 1: ADDcc_I	addcc 	%r16, 0x0afe, %r24
	.word 0x937c0411  ! 1: MOVR_R	move	%r16, %r17, %r9
	.word 0xb62c2b8d  ! 1: ANDN_I	andn 	%r16, 0x0b8d, %r27
	.word 0x82c42ce4  ! 1: ADDCcc_I	addccc 	%r16, 0x0ce4, %r1
thr3_nuke_intr_620:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_620), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a0c2f17  ! 1: AND_I	and 	%r16, 0x0f17, %r5
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
	.word 0xb57c0411  ! 1: MOVR_R	move	%r16, %r17, %r26
thr3_resum_intr_621:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_621), 16, 16)) -> intp(1, 3, 1)
	.word 0xb92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
	.word 0xa6942cb6  ! 1: ORcc_I	orcc 	%r16, 0x0cb6, %r19
	.word 0x9e942f34  ! 1: ORcc_I	orcc 	%r16, 0x0f34, %r15
thr3_nuke_intr_622:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_622), 16, 16)) -> intp(1, 2, 1)
	.word 0xb4042caa  ! 1: ADD_I	add 	%r16, 0x0caa, %r26
	.word 0xb72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r27
	.word 0xb4840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r26
thr3_resum_intr_623:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_623), 16, 16)) -> intp(1, 3, 1)
	.word 0x96942432  ! 1: ORcc_I	orcc 	%r16, 0x0432, %r11
thr3_nuke_intr_624:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_624), 16, 16)) -> intp(1, 2, 1)
	.word 0x84c42a7e  ! 1: ADDCcc_I	addccc 	%r16, 0x0a7e, %r2
	.word 0x84bc2b5c  ! 1: XNORcc_I	xnorcc 	%r16, 0x0b5c, %r2
	.word 0xb03c2d42  ! 1: XNOR_I	xnor 	%r16, 0x0d42, %r24
	.word 0xb52c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r26
thr3_resum_intr_625:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_625), 16, 16)) -> intp(1, 3, 1)
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x94940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x932c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x960c0011  ! 1: AND_R	and 	%r16, %r17, %r11
thr3_hw_intr_626:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_626), 16, 16)) -> intp(0, 0, 1)
	.word 0xab3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r21
	.word 0x9a342101  ! 1: ORN_I	orn 	%r16, 0x0101, %r13
	.word 0x983c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0xa6b42b78  ! 1: ORNcc_I	orncc 	%r16, 0x0b78, %r19
thr3_nuke_intr_627:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_627), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a9c2d60  ! 1: XORcc_I	xorcc 	%r16, 0x0d60, %r5
	.word 0xab2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x897c0411  ! 1: MOVR_R	move	%r16, %r17, %r4
	.word 0x9494284e  ! 1: ORcc_I	orcc 	%r16, 0x084e, %r10
thr3_resum_intr_628:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_628), 16, 16)) -> intp(1, 3, 1)
	.word 0xb33c1011  ! 1: SRAX_R	srax	%r16, %r17, %r25
thr3_nuke_intr_629:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_629), 16, 16)) -> intp(0, 2, 1)
	.word 0x928426bb  ! 1: ADDcc_I	addcc 	%r16, 0x06bb, %r9
thr3_resum_intr_630:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_630), 16, 16)) -> intp(0, 3, 1)
	.word 0x88140011  ! 1: OR_R	or 	%r16, %r17, %r4
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x99643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_631:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_631), 16, 16)) -> intp(1, 2, 1)
	.word 0xa61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r19
	.word 0x853c1011  ! 1: SRAX_R	srax	%r16, %r17, %r2
	.word 0xb6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r27
thr3_resum_intr_632:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_632), 16, 16)) -> intp(1, 3, 1)
	.word 0xa6b424d9  ! 1: ORNcc_I	orncc 	%r16, 0x04d9, %r19
	.word 0xb5643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x922c2b16  ! 1: ANDN_I	andn 	%r16, 0x0b16, %r9
thr3_hw_intr_633:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_633), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1341011  ! 1: SRLX_R	srlx	%r16, %r17, %r24
	.word 0xad3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r22
	.word 0x94842f22  ! 1: ADDcc_I	addcc 	%r16, 0x0f22, %r10
thr3_nuke_intr_634:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_634), 16, 16)) -> intp(0, 2, 1)
	.word 0xb62c2543  ! 1: ANDN_I	andn 	%r16, 0x0543, %r27
	.word 0x90c420bc  ! 1: ADDCcc_I	addccc 	%r16, 0x00bc, %r8
thr3_resum_intr_635:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_635), 16, 16)) -> intp(0, 3, 1)
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
thr3_nuke_intr_636:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_636), 16, 16)) -> intp(2, 2, 1)
	.word 0xad3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r22
thr3_resum_intr_637:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_637), 16, 16)) -> intp(2, 3, 1)
	.word 0x83342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x8a942449  ! 1: ORcc_I	orcc 	%r16, 0x0449, %r5
thr3_hw_intr_638:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_638), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a942414  ! 1: ORcc_I	orcc 	%r16, 0x0414, %r5
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0x833c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0x820c0011  ! 1: AND_R	and 	%r16, %r17, %r1
thr3_nuke_intr_639:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_639), 16, 16)) -> intp(2, 2, 1)
	.word 0x98340011  ! 1: ORN_R	orn 	%r16, %r17, %r12
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
thr3_resum_intr_640:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_640), 16, 16)) -> intp(2, 3, 1)
	.word 0xb08c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0xbaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r29
thr3_hw_intr_641:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_641), 16, 16)) -> intp(2, 0, 1)
	.word 0x9f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xac140011  ! 1: OR_R	or 	%r16, %r17, %r22
	.word 0xab641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x98040011  ! 1: ADD_R	add 	%r16, %r17, %r12
thr3_nuke_intr_642:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_642), 16, 16)) -> intp(2, 2, 1)
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
thr3_resum_intr_643:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_643), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xb03c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r24
thr3_nuke_intr_644:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_644), 16, 16)) -> intp(0, 2, 1)
	.word 0x873c0011  ! 1: SRA_R	sra 	%r16, %r17, %r3
	.word 0xae340011  ! 1: ORN_R	orn 	%r16, %r17, %r23
	.word 0x997c0411  ! 1: MOVR_R	move	%r16, %r17, %r12
thr3_resum_intr_645:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_645), 16, 16)) -> intp(0, 3, 1)
	.word 0x9e442909  ! 1: ADDC_I	addc 	%r16, 0x0909, %r15
	.word 0x92b42e82  ! 1: ORNcc_I	orncc 	%r16, 0x0e82, %r9
thr3_nuke_intr_646:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_646), 16, 16)) -> intp(2, 2, 1)
	.word 0x983c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r12
thr3_resum_intr_647:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_647), 16, 16)) -> intp(2, 3, 1)
	.word 0x862c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x942c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r10
thr3_nuke_intr_648:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_648), 16, 16)) -> intp(0, 2, 1)
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x88442e3d  ! 1: ADDC_I	addc 	%r16, 0x0e3d, %r4
thr3_resum_intr_649:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_649), 16, 16)) -> intp(0, 3, 1)
	.word 0xa6ac28e6  ! 1: ANDNcc_I	andncc 	%r16, 0x08e6, %r19
	.word 0x8e4421e4  ! 1: ADDC_I	addc 	%r16, 0x01e4, %r7
	.word 0xb57c0411  ! 1: MOVR_R	move	%r16, %r17, %r26
thr3_nuke_intr_650:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_650), 16, 16)) -> intp(1, 2, 1)
	.word 0x900c0011  ! 1: AND_R	and 	%r16, %r17, %r8
thr3_resum_intr_651:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_651), 16, 16)) -> intp(1, 3, 1)
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x96042ee7  ! 1: ADD_I	add 	%r16, 0x0ee7, %r11
thr3_nuke_intr_652:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_652), 16, 16)) -> intp(1, 2, 1)
	.word 0x82c424d4  ! 1: ADDCcc_I	addccc 	%r16, 0x04d4, %r1
	.word 0xb40c0011  ! 1: AND_R	and 	%r16, %r17, %r26
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
	.word 0x92ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r9
thr3_resum_intr_653:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_653), 16, 16)) -> intp(1, 3, 1)
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
	.word 0xb63c2e2d  ! 1: XNOR_I	xnor 	%r16, 0x0e2d, %r27
thr3_nuke_intr_654:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_654), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8140011  ! 1: OR_R	or 	%r16, %r17, %r20
	.word 0x9a8420d3  ! 1: ADDcc_I	addcc 	%r16, 0x00d3, %r13
	.word 0x963c2c37  ! 1: XNOR_I	xnor 	%r16, 0x0c37, %r11
	.word 0xa62c22ac  ! 1: ANDN_I	andn 	%r16, 0x02ac, %r19
thr3_resum_intr_655:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_655), 16, 16)) -> intp(0, 3, 1)
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x9a342503  ! 1: ORN_I	orn 	%r16, 0x0503, %r13
	.word 0xa7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r19
thr3_nuke_intr_656:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_656), 16, 16)) -> intp(0, 2, 1)
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
thr3_resum_intr_657:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_657), 16, 16)) -> intp(0, 3, 1)
	.word 0x86340011  ! 1: ORN_R	orn 	%r16, %r17, %r3
	.word 0xbb342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r29
thr3_nuke_intr_658:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_658), 16, 16)) -> intp(0, 2, 1)
	.word 0x88c42ac3  ! 1: ADDCcc_I	addccc 	%r16, 0x0ac3, %r4
	.word 0xb40c0011  ! 1: AND_R	and 	%r16, %r17, %r26
	.word 0xa63c2653  ! 1: XNOR_I	xnor 	%r16, 0x0653, %r19
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
thr3_resum_intr_659:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_659), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa1c2e7f  ! 1: XOR_I	xor 	%r16, 0x0e7f, %r21
	.word 0x823c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
thr3_nuke_intr_660:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_660), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r29
thr3_resum_intr_661:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_661), 16, 16)) -> intp(0, 3, 1)
	.word 0xa88420a1  ! 1: ADDcc_I	addcc 	%r16, 0x00a1, %r20
	.word 0xb5340011  ! 1: SRL_R	srl 	%r16, %r17, %r26
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
thr3_nuke_intr_662:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_662), 16, 16)) -> intp(0, 2, 1)
	.word 0x8f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x8a1c2093  ! 1: XOR_I	xor 	%r16, 0x0093, %r5
	.word 0x9a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r13
thr3_resum_intr_663:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_663), 16, 16)) -> intp(0, 3, 1)
	.word 0xad643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_664:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_664), 16, 16)) -> intp(1, 2, 1)
	.word 0x8eac2341  ! 1: ANDNcc_I	andncc 	%r16, 0x0341, %r7
	.word 0xb2142e7d  ! 1: OR_I	or 	%r16, 0x0e7d, %r25
	.word 0x9e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0xb7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r27
thr3_resum_intr_665:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_665), 16, 16)) -> intp(1, 3, 1)
	.word 0xba3c2e85  ! 1: XNOR_I	xnor 	%r16, 0x0e85, %r29
thr3_hw_intr_666:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_666), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa9420af  ! 1: ORcc_I	orcc 	%r16, 0x00af, %r21
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
	.word 0x922c2718  ! 1: ANDN_I	andn 	%r16, 0x0718, %r9
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_667:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_667), 16, 16)) -> intp(2, 0, 1)
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
thr3_nuke_intr_668:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_668), 16, 16)) -> intp(0, 2, 1)
	.word 0x857c2401  ! 1: MOVR_I	move	%r16, 0x11, %r2
	.word 0x9d7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r14
	.word 0xb4ac2dde  ! 1: ANDNcc_I	andncc 	%r16, 0x0dde, %r26
thr3_resum_intr_669:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_669), 16, 16)) -> intp(0, 3, 1)
	.word 0x92ac2fb2  ! 1: ANDNcc_I	andncc 	%r16, 0x0fb2, %r9
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0x888c2458  ! 1: ANDcc_I	andcc 	%r16, 0x0458, %r4
thr3_hw_intr_670:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_670), 16, 16)) -> intp(2, 0, 1)
	.word 0x869c2d82  ! 1: XORcc_I	xorcc 	%r16, 0x0d82, %r3
thr3_hw_intr_671:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_671), 16, 16)) -> intp(1, 0, 1)
	.word 0xa81427b8  ! 1: OR_I	or 	%r16, 0x07b8, %r20
	.word 0x8e3421bf  ! 1: ORN_I	orn 	%r16, 0x01bf, %r7
	.word 0x92c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x933c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r9
thr3_nuke_intr_672:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_672), 16, 16)) -> intp(1, 2, 1)
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0xae8c2542  ! 1: ANDcc_I	andcc 	%r16, 0x0542, %r23
thr3_resum_intr_673:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_673), 16, 16)) -> intp(1, 3, 1)
	.word 0x99340011  ! 1: SRL_R	srl 	%r16, %r17, %r12
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
thr3_nuke_intr_674:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_674), 16, 16)) -> intp(1, 2, 1)
	.word 0x95342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0xab3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r21
thr3_resum_intr_675:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_675), 16, 16)) -> intp(1, 3, 1)
	.word 0x92040011  ! 1: ADD_R	add 	%r16, %r17, %r9
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
thr3_nuke_intr_676:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_676), 16, 16)) -> intp(1, 2, 1)
	.word 0x840c0011  ! 1: AND_R	and 	%r16, %r17, %r2
thr3_resum_intr_677:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_677), 16, 16)) -> intp(1, 3, 1)
	.word 0xb9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r28
thr3_nuke_intr_678:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_678), 16, 16)) -> intp(1, 2, 1)
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
	.word 0x99341011  ! 1: SRLX_R	srlx	%r16, %r17, %r12
thr3_resum_intr_679:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_679), 16, 16)) -> intp(1, 3, 1)
	.word 0xb01c0011  ! 1: XOR_R	xor 	%r16, %r17, %r24
	.word 0xb40c0011  ! 1: AND_R	and 	%r16, %r17, %r26
thr3_hw_intr_680:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_680), 16, 16)) -> intp(0, 0, 1)
	.word 0x988422cc  ! 1: ADDcc_I	addcc 	%r16, 0x02cc, %r12
	.word 0xaf343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r23
thr3_hw_intr_681:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_681), 16, 16)) -> intp(0, 0, 1)
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x893c1011  ! 1: SRAX_R	srax	%r16, %r17, %r4
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
thr3_hw_intr_682:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_682), 16, 16)) -> intp(0, 0, 1)
	.word 0xaf343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r23
thr3_hw_intr_683:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_683), 16, 16)) -> intp(1, 0, 1)
	.word 0xa8042d86  ! 1: ADD_I	add 	%r16, 0x0d86, %r20
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
	.word 0x869c223f  ! 1: XORcc_I	xorcc 	%r16, 0x023f, %r3
thr3_nuke_intr_684:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_684), 16, 16)) -> intp(1, 2, 1)
	.word 0xa80c2af8  ! 1: AND_I	and 	%r16, 0x0af8, %r20
	.word 0x97343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0x822c25b7  ! 1: ANDN_I	andn 	%r16, 0x05b7, %r1
thr3_resum_intr_685:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_685), 16, 16)) -> intp(1, 3, 1)
	.word 0xa8342060  ! 1: ORN_I	orn 	%r16, 0x0060, %r20
	.word 0x8494239c  ! 1: ORcc_I	orcc 	%r16, 0x039c, %r2
	.word 0x888424f3  ! 1: ADDcc_I	addcc 	%r16, 0x04f3, %r4
	.word 0x8b7c0411  ! 1: MOVR_R	move	%r16, %r17, %r5
thr3_hw_intr_686:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_686), 16, 16)) -> intp(1, 0, 1)
	.word 0x8a3c226a  ! 1: XNOR_I	xnor 	%r16, 0x026a, %r5
	.word 0xb52c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r26
	.word 0x8b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
thr3_hw_intr_687:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_687), 16, 16)) -> intp(2, 0, 1)
	.word 0x8c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0x86ac2631  ! 1: ANDNcc_I	andncc 	%r16, 0x0631, %r3
	.word 0xaf340011  ! 1: SRL_R	srl 	%r16, %r17, %r23
thr3_nuke_intr_688:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_688), 16, 16)) -> intp(2, 2, 1)
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0xb40c290e  ! 1: AND_I	and 	%r16, 0x090e, %r26
	.word 0xbabc2e21  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e21, %r29
thr3_resum_intr_689:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_689), 16, 16)) -> intp(2, 3, 1)
	.word 0x8cac2fa4  ! 1: ANDNcc_I	andncc 	%r16, 0x0fa4, %r6
	.word 0x94bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0xad341011  ! 1: SRLX_R	srlx	%r16, %r17, %r22
thr3_hw_intr_690:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_690), 16, 16)) -> intp(2, 0, 1)
	.word 0xaa940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x84bc20af  ! 1: XNORcc_I	xnorcc 	%r16, 0x00af, %r2
	.word 0x862c2316  ! 1: ANDN_I	andn 	%r16, 0x0316, %r3
thr3_hw_intr_691:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_691), 16, 16)) -> intp(1, 0, 1)
	.word 0x9f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r15
thr3_hw_intr_692:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_692), 16, 16)) -> intp(1, 0, 1)
	.word 0xba2c27a9  ! 1: ANDN_I	andn 	%r16, 0x07a9, %r29
	.word 0x9e14262e  ! 1: OR_I	or 	%r16, 0x062e, %r15
	.word 0xae840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r23
thr3_nuke_intr_693:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_693), 16, 16)) -> intp(0, 2, 1)
	.word 0x94c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x9b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
thr3_resum_intr_694:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_694), 16, 16)) -> intp(0, 3, 1)
	.word 0x98ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x8e9c267b  ! 1: XORcc_I	xorcc 	%r16, 0x067b, %r7
thr3_nuke_intr_695:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_695), 16, 16)) -> intp(2, 2, 1)
	.word 0x9c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x9a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x961c0011  ! 1: XOR_R	xor 	%r16, %r17, %r11
	.word 0x993c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r12
thr3_resum_intr_696:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_696), 16, 16)) -> intp(2, 3, 1)
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
	.word 0xae3c2b7c  ! 1: XNOR_I	xnor 	%r16, 0x0b7c, %r23
	.word 0xba342dfb  ! 1: ORN_I	orn 	%r16, 0x0dfb, %r29
thr3_nuke_intr_697:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_697), 16, 16)) -> intp(2, 2, 1)
	.word 0xacb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
thr3_resum_intr_698:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_698), 16, 16)) -> intp(2, 3, 1)
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
thr3_nuke_intr_699:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_699), 16, 16)) -> intp(0, 2, 1)
	.word 0xb09c28df  ! 1: XORcc_I	xorcc 	%r16, 0x08df, %r24
thr3_resum_intr_700:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_700), 16, 16)) -> intp(0, 3, 1)
	.word 0x8d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r6
	.word 0xbb3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r29
	.word 0x9e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r15
thr3_hw_intr_701:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_701), 16, 16)) -> intp(0, 0, 1)
	.word 0xb12c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r24
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
	.word 0xab643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_702:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_702), 16, 16)) -> intp(0, 2, 1)
	.word 0x9b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0xac140011  ! 1: OR_R	or 	%r16, %r17, %r22
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x96442391  ! 1: ADDC_I	addc 	%r16, 0x0391, %r11
thr3_resum_intr_703:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_703), 16, 16)) -> intp(0, 3, 1)
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
thr3_nuke_intr_704:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_704), 16, 16)) -> intp(0, 2, 1)
	.word 0xaaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0xb92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0xb8b427cf  ! 1: ORNcc_I	orncc 	%r16, 0x07cf, %r28
	.word 0xa9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r20
thr3_resum_intr_705:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_705), 16, 16)) -> intp(0, 3, 1)
	.word 0xb2140011  ! 1: OR_R	or 	%r16, %r17, %r25
	.word 0x82142138  ! 1: OR_I	or 	%r16, 0x0138, %r1
	.word 0xb81c2da4  ! 1: XOR_I	xor 	%r16, 0x0da4, %r28
	.word 0xba1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r29
thr3_nuke_intr_706:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_706), 16, 16)) -> intp(1, 2, 1)
	.word 0xb004237d  ! 1: ADD_I	add 	%r16, 0x037d, %r24
thr3_resum_intr_707:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_707), 16, 16)) -> intp(1, 3, 1)
	.word 0xb08c23c3  ! 1: ANDcc_I	andcc 	%r16, 0x03c3, %r24
	.word 0x9f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0x8d641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_708:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_708), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0x832c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0x9c2c2987  ! 1: ANDN_I	andn 	%r16, 0x0987, %r14
	.word 0x87342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r3
thr3_resum_intr_709:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_709), 16, 16)) -> intp(0, 3, 1)
	.word 0xa8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r20
thr3_nuke_intr_710:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_710), 16, 16)) -> intp(2, 2, 1)
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0xb23c2f39  ! 1: XNOR_I	xnor 	%r16, 0x0f39, %r25
	.word 0x8eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0x89343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r4
thr3_resum_intr_711:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_711), 16, 16)) -> intp(2, 3, 1)
	.word 0xaa2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r21
	.word 0xb93c0011  ! 1: SRA_R	sra 	%r16, %r17, %r28
thr3_hw_intr_712:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_712), 16, 16)) -> intp(0, 0, 1)
	.word 0x96840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r11
thr3_nuke_intr_713:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_713), 16, 16)) -> intp(1, 2, 1)
	.word 0xb89c2363  ! 1: XORcc_I	xorcc 	%r16, 0x0363, %r28
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
	.word 0x822c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x9e2c2cb7  ! 1: ANDN_I	andn 	%r16, 0x0cb7, %r15
thr3_resum_intr_714:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_714), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c0c0011  ! 1: AND_R	and 	%r16, %r17, %r6
thr3_nuke_intr_715:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_715), 16, 16)) -> intp(1, 2, 1)
	.word 0x937c2401  ! 1: MOVR_I	move	%r16, 0x11, %r9
	.word 0x8a0c0011  ! 1: AND_R	and 	%r16, %r17, %r5
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
thr3_resum_intr_716:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_716), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x868c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x98c42e93  ! 1: ADDCcc_I	addccc 	%r16, 0x0e93, %r12
thr3_hw_intr_717:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_717), 16, 16)) -> intp(2, 0, 1)
	.word 0x82842c4d  ! 1: ADDcc_I	addcc 	%r16, 0x0c4d, %r1
thr3_nuke_intr_718:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_718), 16, 16)) -> intp(2, 2, 1)
	.word 0xa7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r19
thr3_resum_intr_719:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_719), 16, 16)) -> intp(2, 3, 1)
	.word 0x82ac2399  ! 1: ANDNcc_I	andncc 	%r16, 0x0399, %r1
	.word 0x9e140011  ! 1: OR_R	or 	%r16, %r17, %r15
thr3_nuke_intr_720:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_720), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c842b2b  ! 1: ADDcc_I	addcc 	%r16, 0x0b2b, %r6
thr3_resum_intr_721:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_721), 16, 16)) -> intp(1, 3, 1)
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
thr3_hw_intr_722:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_722), 16, 16)) -> intp(2, 0, 1)
	.word 0x8d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r6
	.word 0xa73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r19
	.word 0x912c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x98340011  ! 1: ORN_R	orn 	%r16, %r17, %r12
thr3_hw_intr_723:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_723), 16, 16)) -> intp(2, 0, 1)
	.word 0x92140011  ! 1: OR_R	or 	%r16, %r17, %r9
	.word 0xab3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r21
	.word 0x8d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r6
thr3_nuke_intr_724:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_724), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r20
	.word 0x83643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_725:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_725), 16, 16)) -> intp(0, 3, 1)
	.word 0x8b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x8e84205c  ! 1: ADDcc_I	addcc 	%r16, 0x005c, %r7
	.word 0x9a4426cf  ! 1: ADDC_I	addc 	%r16, 0x06cf, %r13
thr3_nuke_intr_726:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_726), 16, 16)) -> intp(2, 2, 1)
	.word 0xa68c2434  ! 1: ANDcc_I	andcc 	%r16, 0x0434, %r19
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
	.word 0x92140011  ! 1: OR_R	or 	%r16, %r17, %r9
thr3_resum_intr_727:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_727), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
	.word 0xb00c2b6f  ! 1: AND_I	and 	%r16, 0x0b6f, %r24
	.word 0x9a34221d  ! 1: ORN_I	orn 	%r16, 0x021d, %r13
thr3_nuke_intr_728:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_728), 16, 16)) -> intp(0, 2, 1)
	.word 0x962c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r11
	.word 0xa72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0xb4942deb  ! 1: ORcc_I	orcc 	%r16, 0x0deb, %r26
thr3_resum_intr_729:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_729), 16, 16)) -> intp(0, 3, 1)
	.word 0x833c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0x8e442473  ! 1: ADDC_I	addc 	%r16, 0x0473, %r7
	.word 0x840c0011  ! 1: AND_R	and 	%r16, %r17, %r2
thr3_hw_intr_730:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_730), 16, 16)) -> intp(0, 0, 1)
	.word 0xba8c2aef  ! 1: ANDcc_I	andcc 	%r16, 0x0aef, %r29
	.word 0xb93c0011  ! 1: SRA_R	sra 	%r16, %r17, %r28
	.word 0x88842e2d  ! 1: ADDcc_I	addcc 	%r16, 0x0e2d, %r4
thr3_nuke_intr_731:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_731), 16, 16)) -> intp(0, 2, 1)
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
thr3_resum_intr_732:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_732), 16, 16)) -> intp(0, 3, 1)
	.word 0x9ebc20ff  ! 1: XNORcc_I	xnorcc 	%r16, 0x00ff, %r15
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
thr3_nuke_intr_733:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_733), 16, 16)) -> intp(1, 2, 1)
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
thr3_resum_intr_734:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_734), 16, 16)) -> intp(1, 3, 1)
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0xb32c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r25
	.word 0xaa1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r21
thr3_nuke_intr_735:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_735), 16, 16)) -> intp(1, 2, 1)
	.word 0xba8c2fe8  ! 1: ANDcc_I	andcc 	%r16, 0x0fe8, %r29
thr3_resum_intr_736:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_736), 16, 16)) -> intp(1, 3, 1)
	.word 0x96942218  ! 1: ORcc_I	orcc 	%r16, 0x0218, %r11
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
thr3_nuke_intr_737:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_737), 16, 16)) -> intp(2, 2, 1)
	.word 0xb2b424c8  ! 1: ORNcc_I	orncc 	%r16, 0x04c8, %r25
	.word 0x9a042044  ! 1: ADD_I	add 	%r16, 0x0044, %r13
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
	.word 0xb02c206d  ! 1: ANDN_I	andn 	%r16, 0x006d, %r24
thr3_resum_intr_738:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_738), 16, 16)) -> intp(2, 3, 1)
	.word 0xad2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r22
	.word 0x948c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r10
thr3_nuke_intr_739:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_739), 16, 16)) -> intp(1, 2, 1)
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0x9e142b3d  ! 1: OR_I	or 	%r16, 0x0b3d, %r15
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
thr3_resum_intr_740:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_740), 16, 16)) -> intp(1, 3, 1)
	.word 0x8f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r7
	.word 0x843c2eee  ! 1: XNOR_I	xnor 	%r16, 0x0eee, %r2
thr3_hw_intr_741:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_741), 16, 16)) -> intp(1, 0, 1)
	.word 0x8a340011  ! 1: ORN_R	orn 	%r16, %r17, %r5
thr3_hw_intr_742:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_742), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4c42a38  ! 1: ADDCcc_I	addccc 	%r16, 0x0a38, %r26
	.word 0xa72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r19
	.word 0xba440011  ! 1: ADDC_R	addc 	%r16, %r17, %r29
	.word 0x87343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r3
thr3_hw_intr_743:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_743), 16, 16)) -> intp(0, 0, 1)
	.word 0x96c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r11
thr3_nuke_intr_744:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_744), 16, 16)) -> intp(2, 2, 1)
	.word 0x8ab42eeb  ! 1: ORNcc_I	orncc 	%r16, 0x0eeb, %r5
	.word 0x872c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r3
	.word 0x892c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r4
	.word 0xb92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r28
thr3_resum_intr_745:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_745), 16, 16)) -> intp(2, 3, 1)
	.word 0x96bc2d49  ! 1: XNORcc_I	xnorcc 	%r16, 0x0d49, %r11
	.word 0xad7c2401  ! 1: MOVR_I	move	%r16, 0xd49, %r22
thr3_nuke_intr_746:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_746), 16, 16)) -> intp(0, 2, 1)
	.word 0x893c1011  ! 1: SRAX_R	srax	%r16, %r17, %r4
	.word 0x90340011  ! 1: ORN_R	orn 	%r16, %r17, %r8
	.word 0x889425b3  ! 1: ORcc_I	orcc 	%r16, 0x05b3, %r4
	.word 0x98142c7e  ! 1: OR_I	or 	%r16, 0x0c7e, %r12
thr3_resum_intr_747:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_747), 16, 16)) -> intp(0, 3, 1)
	.word 0xb13c0011  ! 1: SRA_R	sra 	%r16, %r17, %r24
thr3_hw_intr_748:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_748), 16, 16)) -> intp(1, 0, 1)
	.word 0xb80c257e  ! 1: AND_I	and 	%r16, 0x057e, %r28
	.word 0x99341011  ! 1: SRLX_R	srlx	%r16, %r17, %r12
	.word 0xaa842adc  ! 1: ADDcc_I	addcc 	%r16, 0x0adc, %r21
thr3_hw_intr_749:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_749), 16, 16)) -> intp(1, 0, 1)
	.word 0x952c0011  ! 1: SLL_R	sll 	%r16, %r17, %r10
	.word 0x872c0011  ! 1: SLL_R	sll 	%r16, %r17, %r3
	.word 0xb52c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r26
thr3_nuke_intr_750:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_750), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
thr3_resum_intr_751:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_751), 16, 16)) -> intp(0, 3, 1)
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0xb6842d3a  ! 1: ADDcc_I	addcc 	%r16, 0x0d3a, %r27
thr3_nuke_intr_752:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_752), 16, 16)) -> intp(2, 2, 1)
	.word 0x83643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb0842ad1  ! 1: ADDcc_I	addcc 	%r16, 0x0ad1, %r24
	.word 0x9f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r15
	.word 0xab7c0411  ! 1: MOVR_R	move	%r16, %r17, %r21
thr3_resum_intr_753:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_753), 16, 16)) -> intp(2, 3, 1)
	.word 0x88ac21de  ! 1: ANDNcc_I	andncc 	%r16, 0x01de, %r4
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
	.word 0xb62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x8b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r5
thr3_nuke_intr_754:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_754), 16, 16)) -> intp(2, 2, 1)
	.word 0x8f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r7
	.word 0x9b641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_755:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_755), 16, 16)) -> intp(2, 3, 1)
	.word 0xb2b420fc  ! 1: ORNcc_I	orncc 	%r16, 0x00fc, %r25
	.word 0xb8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0x96bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r11
thr3_nuke_intr_756:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_756), 16, 16)) -> intp(2, 2, 1)
	.word 0x992c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x9e2c2c48  ! 1: ANDN_I	andn 	%r16, 0x0c48, %r15
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0x820423e3  ! 1: ADD_I	add 	%r16, 0x03e3, %r1
thr3_resum_intr_757:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_757), 16, 16)) -> intp(2, 3, 1)
	.word 0x96b4236c  ! 1: ORNcc_I	orncc 	%r16, 0x036c, %r11
	.word 0x941c0011  ! 1: XOR_R	xor 	%r16, %r17, %r10
	.word 0x9f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r15
	.word 0xb20c20c2  ! 1: AND_I	and 	%r16, 0x00c2, %r25
thr3_hw_intr_758:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_758), 16, 16)) -> intp(1, 0, 1)
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0x942c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r10
thr3_nuke_intr_759:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_759), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa040011  ! 1: ADD_R	add 	%r16, %r17, %r21
	.word 0x903c2739  ! 1: XNOR_I	xnor 	%r16, 0x0739, %r8
	.word 0x86440011  ! 1: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
thr3_resum_intr_760:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_760), 16, 16)) -> intp(0, 3, 1)
	.word 0x988c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r12
thr3_hw_intr_761:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_761), 16, 16)) -> intp(2, 0, 1)
	.word 0x973c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
thr3_nuke_intr_762:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_762), 16, 16)) -> intp(1, 2, 1)
	.word 0xaf341011  ! 1: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xb32c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r25
thr3_resum_intr_763:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_763), 16, 16)) -> intp(1, 3, 1)
	.word 0x84ac2174  ! 1: ANDNcc_I	andncc 	%r16, 0x0174, %r2
	.word 0xae8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r23
thr3_nuke_intr_764:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_764), 16, 16)) -> intp(1, 2, 1)
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
thr3_resum_intr_765:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_765), 16, 16)) -> intp(1, 3, 1)
	.word 0x8f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0xb4142b74  ! 1: OR_I	or 	%r16, 0x0b74, %r26
	.word 0x8f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r7
	.word 0xac3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r22
thr3_nuke_intr_766:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_766), 16, 16)) -> intp(0, 2, 1)
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x9f7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r15
	.word 0x8e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r7
	.word 0xab3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r21
thr3_resum_intr_767:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_767), 16, 16)) -> intp(0, 3, 1)
	.word 0xa6c4220b  ! 1: ADDCcc_I	addccc 	%r16, 0x020b, %r19
	.word 0x96c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r11
thr3_hw_intr_768:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_768), 16, 16)) -> intp(0, 0, 1)
	.word 0x929c2902  ! 1: XORcc_I	xorcc 	%r16, 0x0902, %r9
thr3_nuke_intr_769:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_769), 16, 16)) -> intp(2, 2, 1)
	.word 0x829c2609  ! 1: XORcc_I	xorcc 	%r16, 0x0609, %r1
thr3_resum_intr_770:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_770), 16, 16)) -> intp(2, 3, 1)
	.word 0xb02c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r24
thr3_nuke_intr_771:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_771), 16, 16)) -> intp(2, 2, 1)
	.word 0xaa0c0011  ! 1: AND_R	and 	%r16, %r17, %r21
thr3_resum_intr_772:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_772), 16, 16)) -> intp(2, 3, 1)
	.word 0x849c2e9d  ! 1: XORcc_I	xorcc 	%r16, 0x0e9d, %r2
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0x9e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r15
	.word 0xaa9420a6  ! 1: ORcc_I	orcc 	%r16, 0x00a6, %r21
thr3_hw_intr_773:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_773), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a3c2127  ! 1: XNOR_I	xnor 	%r16, 0x0127, %r13
	.word 0x98042982  ! 1: ADD_I	add 	%r16, 0x0982, %r12
	.word 0x92b429b6  ! 1: ORNcc_I	orncc 	%r16, 0x09b6, %r9
thr3_hw_intr_774:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_774), 16, 16)) -> intp(0, 0, 1)
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x869c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0x962c2ad8  ! 1: ANDN_I	andn 	%r16, 0x0ad8, %r11
thr3_nuke_intr_775:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_775), 16, 16)) -> intp(1, 2, 1)
	.word 0x96442f15  ! 1: ADDC_I	addc 	%r16, 0x0f15, %r11
thr3_resum_intr_776:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_776), 16, 16)) -> intp(1, 3, 1)
	.word 0xab7c0411  ! 1: MOVR_R	move	%r16, %r17, %r21
	.word 0x843c2fbc  ! 1: XNOR_I	xnor 	%r16, 0x0fbc, %r2
	.word 0xaac42941  ! 1: ADDCcc_I	addccc 	%r16, 0x0941, %r21
thr3_hw_intr_777:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_777), 16, 16)) -> intp(2, 0, 1)
	.word 0x843c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r2
thr3_hw_intr_778:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_778), 16, 16)) -> intp(1, 0, 1)
	.word 0x952c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r10
	.word 0xb12c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x8c2c2bd2  ! 1: ANDN_I	andn 	%r16, 0x0bd2, %r6
thr3_hw_intr_779:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_779), 16, 16)) -> intp(2, 0, 1)
	.word 0xb4940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0xb5340011  ! 1: SRL_R	srl 	%r16, %r17, %r26
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
thr3_nuke_intr_780:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_780), 16, 16)) -> intp(1, 2, 1)
	.word 0x8b641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_781:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_781), 16, 16)) -> intp(1, 3, 1)
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x968c21f6  ! 1: ANDcc_I	andcc 	%r16, 0x01f6, %r11
thr3_hw_intr_782:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_782), 16, 16)) -> intp(0, 0, 1)
	.word 0xb2940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0xa93c0011  ! 1: SRA_R	sra 	%r16, %r17, %r20
	.word 0x833c0011  ! 1: SRA_R	sra 	%r16, %r17, %r1
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
thr3_hw_intr_783:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_783), 16, 16)) -> intp(2, 0, 1)
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0xa60c0011  ! 1: AND_R	and 	%r16, %r17, %r19
thr3_nuke_intr_784:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_784), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c842466  ! 1: ADDcc_I	addcc 	%r16, 0x0466, %r6
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x92342f27  ! 1: ORN_I	orn 	%r16, 0x0f27, %r9
	.word 0x992c0011  ! 1: SLL_R	sll 	%r16, %r17, %r12
thr3_resum_intr_785:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_785), 16, 16)) -> intp(2, 3, 1)
	.word 0xac342a43  ! 1: ORN_I	orn 	%r16, 0x0a43, %r22
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x9ebc2e0a  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e0a, %r15
	.word 0x97343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r11
thr3_hw_intr_786:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_786), 16, 16)) -> intp(0, 0, 1)
	.word 0x90142a76  ! 1: OR_I	or 	%r16, 0x0a76, %r8
	.word 0x8c842f52  ! 1: ADDcc_I	addcc 	%r16, 0x0f52, %r6
	.word 0x90c426cc  ! 1: ADDCcc_I	addccc 	%r16, 0x06cc, %r8
thr3_hw_intr_787:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_787), 16, 16)) -> intp(0, 0, 1)
	.word 0x90ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x9eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xbb2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
thr3_nuke_intr_788:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_788), 16, 16)) -> intp(0, 2, 1)
	.word 0x86c428aa  ! 1: ADDCcc_I	addccc 	%r16, 0x08aa, %r3
	.word 0xb93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r28
	.word 0x8f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r7
thr3_resum_intr_789:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_789), 16, 16)) -> intp(0, 3, 1)
	.word 0xa81c2315  ! 1: XOR_I	xor 	%r16, 0x0315, %r20
	.word 0x84ac22a1  ! 1: ANDNcc_I	andncc 	%r16, 0x02a1, %r2
	.word 0x8d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r6
thr3_hw_intr_790:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_790), 16, 16)) -> intp(1, 0, 1)
	.word 0xb29c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r25
thr3_nuke_intr_791:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_791), 16, 16)) -> intp(0, 2, 1)
	.word 0x9b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r13
	.word 0x84942a91  ! 1: ORcc_I	orcc 	%r16, 0x0a91, %r2
thr3_resum_intr_792:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_792), 16, 16)) -> intp(0, 3, 1)
	.word 0xa81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r20
	.word 0x9c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r14
thr3_hw_intr_793:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_793), 16, 16)) -> intp(0, 0, 1)
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
	.word 0x90b42125  ! 1: ORNcc_I	orncc 	%r16, 0x0125, %r8
	.word 0x9a1429b3  ! 1: OR_I	or 	%r16, 0x09b3, %r13
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
thr3_hw_intr_794:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_794), 16, 16)) -> intp(0, 0, 1)
	.word 0x988c25cc  ! 1: ANDcc_I	andcc 	%r16, 0x05cc, %r12
thr3_nuke_intr_795:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_795), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c942ee6  ! 1: ORcc_I	orcc 	%r16, 0x0ee6, %r6
	.word 0x86840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0xb244244c  ! 1: ADDC_I	addc 	%r16, 0x044c, %r25
	.word 0xb61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r27
thr3_resum_intr_796:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_796), 16, 16)) -> intp(1, 3, 1)
	.word 0xb88c291e  ! 1: ANDcc_I	andcc 	%r16, 0x091e, %r28
	.word 0x942c2c2a  ! 1: ANDN_I	andn 	%r16, 0x0c2a, %r10
	.word 0x823c20e7  ! 1: XNOR_I	xnor 	%r16, 0x00e7, %r1
thr3_nuke_intr_797:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_797), 16, 16)) -> intp(1, 2, 1)
	.word 0xba040011  ! 1: ADD_R	add 	%r16, %r17, %r29
thr3_resum_intr_798:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_798), 16, 16)) -> intp(1, 3, 1)
	.word 0xa60c24f2  ! 1: AND_I	and 	%r16, 0x04f2, %r19
	.word 0x822c2ffb  ! 1: ANDN_I	andn 	%r16, 0x0ffb, %r1
thr3_nuke_intr_799:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_799), 16, 16)) -> intp(2, 2, 1)
	.word 0x96840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r11
thr3_resum_intr_800:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_800), 16, 16)) -> intp(2, 3, 1)
	.word 0xacc42f33  ! 1: ADDCcc_I	addccc 	%r16, 0x0f33, %r22
	.word 0x96040011  ! 1: ADD_R	add 	%r16, %r17, %r11
	.word 0xae1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r23
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
thr3_hw_intr_801:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_801), 16, 16)) -> intp(2, 0, 1)
	.word 0xba340011  ! 1: ORN_R	orn 	%r16, %r17, %r29
	.word 0x94c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
thr3_hw_intr_802:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_802), 16, 16)) -> intp(1, 0, 1)
	.word 0x93340011  ! 1: SRL_R	srl 	%r16, %r17, %r9
thr3_hw_intr_803:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_803), 16, 16)) -> intp(2, 0, 1)
	.word 0x94940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0xba942c96  ! 1: ORcc_I	orcc 	%r16, 0x0c96, %r29
	.word 0x8e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r7
thr3_nuke_intr_804:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_804), 16, 16)) -> intp(1, 2, 1)
	.word 0x8444237a  ! 1: ADDC_I	addc 	%r16, 0x037a, %r2
	.word 0x84b42cd6  ! 1: ORNcc_I	orncc 	%r16, 0x0cd6, %r2
thr3_resum_intr_805:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_805), 16, 16)) -> intp(1, 3, 1)
	.word 0x900c265f  ! 1: AND_I	and 	%r16, 0x065f, %r8
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
	.word 0xbaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r29
thr3_hw_intr_806:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_806), 16, 16)) -> intp(1, 0, 1)
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0xb17c0411  ! 1: MOVR_R	move	%r16, %r17, %r24
	.word 0xaa1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r21
thr3_nuke_intr_807:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_807), 16, 16)) -> intp(0, 2, 1)
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x948c2d7e  ! 1: ANDcc_I	andcc 	%r16, 0x0d7e, %r10
	.word 0x993c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r12
thr3_resum_intr_808:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_808), 16, 16)) -> intp(0, 3, 1)
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
thr3_nuke_intr_809:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_809), 16, 16)) -> intp(2, 2, 1)
	.word 0x9c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0xb2b426c3  ! 1: ORNcc_I	orncc 	%r16, 0x06c3, %r25
thr3_resum_intr_810:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_810), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r5
thr3_nuke_intr_811:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_811), 16, 16)) -> intp(1, 2, 1)
	.word 0x92b42442  ! 1: ORNcc_I	orncc 	%r16, 0x0442, %r9
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
thr3_resum_intr_812:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_812), 16, 16)) -> intp(1, 3, 1)
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
thr3_nuke_intr_813:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_813), 16, 16)) -> intp(2, 2, 1)
	.word 0x9094217e  ! 1: ORcc_I	orcc 	%r16, 0x017e, %r8
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
	.word 0xad3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r22
thr3_resum_intr_814:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_814), 16, 16)) -> intp(2, 3, 1)
	.word 0xb13c1011  ! 1: SRAX_R	srax	%r16, %r17, %r24
	.word 0x9f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r15
	.word 0xa61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r19
thr3_hw_intr_815:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_815), 16, 16)) -> intp(2, 0, 1)
	.word 0xa8040011  ! 1: ADD_R	add 	%r16, %r17, %r20
	.word 0x8cb42f0d  ! 1: ORNcc_I	orncc 	%r16, 0x0f0d, %r6
	.word 0x953c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r10
thr3_hw_intr_816:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_816), 16, 16)) -> intp(0, 0, 1)
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
	.word 0x949c2e24  ! 1: XORcc_I	xorcc 	%r16, 0x0e24, %r10
thr3_hw_intr_817:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_817), 16, 16)) -> intp(2, 0, 1)
	.word 0x889c24c7  ! 1: XORcc_I	xorcc 	%r16, 0x04c7, %r4
thr3_hw_intr_818:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_818), 16, 16)) -> intp(1, 0, 1)
	.word 0xb92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0x908c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x98b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r12
thr3_nuke_intr_819:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_819), 16, 16)) -> intp(2, 2, 1)
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x948c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r10
thr3_resum_intr_820:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_820), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0xb8140011  ! 1: OR_R	or 	%r16, %r17, %r28
thr3_hw_intr_821:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_821), 16, 16)) -> intp(1, 0, 1)
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0xb6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r27
thr3_hw_intr_822:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_822), 16, 16)) -> intp(1, 0, 1)
	.word 0xa8842932  ! 1: ADDcc_I	addcc 	%r16, 0x0932, %r20
	.word 0x8d3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r6
thr3_hw_intr_823:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_823), 16, 16)) -> intp(0, 0, 1)
	.word 0x86bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x9ac42cb7  ! 1: ADDCcc_I	addccc 	%r16, 0x0cb7, %r13
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
thr3_nuke_intr_824:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_824), 16, 16)) -> intp(0, 2, 1)
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
thr3_resum_intr_825:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_825), 16, 16)) -> intp(0, 3, 1)
	.word 0xa8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r20
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x8f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0xa77c2401  ! 1: MOVR_I	move	%r16, 0x1, %r19
thr3_hw_intr_826:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_826), 16, 16)) -> intp(2, 0, 1)
	.word 0xaf343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0x9e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r15
thr3_hw_intr_827:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_827), 16, 16)) -> intp(1, 0, 1)
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
thr3_hw_intr_828:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_828), 16, 16)) -> intp(2, 0, 1)
	.word 0x8c142a81  ! 1: OR_I	or 	%r16, 0x0a81, %r6
thr3_nuke_intr_829:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_829), 16, 16)) -> intp(0, 2, 1)
	.word 0x868c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xa73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r19
	.word 0x972c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r11
thr3_resum_intr_830:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_830), 16, 16)) -> intp(0, 3, 1)
	.word 0xb5641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa634201b  ! 1: ORN_I	orn 	%r16, 0x001b, %r19
	.word 0x828c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r1
thr3_hw_intr_831:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_831), 16, 16)) -> intp(1, 0, 1)
	.word 0xb2042ada  ! 1: ADD_I	add 	%r16, 0x0ada, %r25
	.word 0x920425f9  ! 1: ADD_I	add 	%r16, 0x05f9, %r9
	.word 0x953c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r10
thr3_nuke_intr_832:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_832), 16, 16)) -> intp(0, 2, 1)
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
thr3_resum_intr_833:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_833), 16, 16)) -> intp(0, 3, 1)
	.word 0x98940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x9ac42ccb  ! 1: ADDCcc_I	addccc 	%r16, 0x0ccb, %r13
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x98ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r12
thr3_hw_intr_834:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_834), 16, 16)) -> intp(1, 0, 1)
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
thr3_hw_intr_835:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_835), 16, 16)) -> intp(2, 0, 1)
	.word 0x8d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r6
	.word 0x8e0422f3  ! 1: ADD_I	add 	%r16, 0x02f3, %r7
	.word 0x937c0411  ! 1: MOVR_R	move	%r16, %r17, %r9
	.word 0xb694204b  ! 1: ORcc_I	orcc 	%r16, 0x004b, %r27
thr3_hw_intr_836:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_836), 16, 16)) -> intp(2, 0, 1)
	.word 0xa72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0xb00423ae  ! 1: ADD_I	add 	%r16, 0x03ae, %r24
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
thr3_hw_intr_837:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_837), 16, 16)) -> intp(1, 0, 1)
	.word 0x8aac272e  ! 1: ANDNcc_I	andncc 	%r16, 0x072e, %r5
	.word 0xb33c0011  ! 1: SRA_R	sra 	%r16, %r17, %r25
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
thr3_nuke_intr_838:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_838), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a3c2e69  ! 1: XNOR_I	xnor 	%r16, 0x0e69, %r5
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
thr3_resum_intr_839:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_839), 16, 16)) -> intp(2, 3, 1)
	.word 0x840c240e  ! 1: AND_I	and 	%r16, 0x040e, %r2
	.word 0xb7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r27
thr3_nuke_intr_840:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_840), 16, 16)) -> intp(2, 2, 1)
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0xaf7c0411  ! 1: MOVR_R	move	%r16, %r17, %r23
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x9d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r14
thr3_resum_intr_841:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_841), 16, 16)) -> intp(2, 3, 1)
	.word 0xba140011  ! 1: OR_R	or 	%r16, %r17, %r29
thr3_hw_intr_842:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_842), 16, 16)) -> intp(2, 0, 1)
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
	.word 0xb7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x86bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r3
thr3_hw_intr_843:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_843), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a842d60  ! 1: ADDcc_I	addcc 	%r16, 0x0d60, %r13
	.word 0xb4140011  ! 1: OR_R	or 	%r16, %r17, %r26
	.word 0xb844242b  ! 1: ADDC_I	addc 	%r16, 0x042b, %r28
thr3_hw_intr_844:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_844), 16, 16)) -> intp(0, 0, 1)
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0xae2c2bb6  ! 1: ANDN_I	andn 	%r16, 0x0bb6, %r23
	.word 0xb13c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r24
thr3_hw_intr_845:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_845), 16, 16)) -> intp(2, 0, 1)
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
	.word 0x892c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r4
thr3_nuke_intr_846:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_846), 16, 16)) -> intp(2, 2, 1)
	.word 0x98340011  ! 1: ORN_R	orn 	%r16, %r17, %r12
	.word 0xb48c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0x9a9c287a  ! 1: XORcc_I	xorcc 	%r16, 0x087a, %r13
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
thr3_resum_intr_847:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_847), 16, 16)) -> intp(2, 3, 1)
	.word 0x9c1c25b1  ! 1: XOR_I	xor 	%r16, 0x05b1, %r14
	.word 0xb7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r27
thr3_nuke_intr_848:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_848), 16, 16)) -> intp(1, 2, 1)
	.word 0x823c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0xba342b25  ! 1: ORN_I	orn 	%r16, 0x0b25, %r29
	.word 0xb7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9b643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_849:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_849), 16, 16)) -> intp(1, 3, 1)
	.word 0x908c25ff  ! 1: ANDcc_I	andcc 	%r16, 0x05ff, %r8
	.word 0x9e842b26  ! 1: ADDcc_I	addcc 	%r16, 0x0b26, %r15
thr3_hw_intr_850:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_850), 16, 16)) -> intp(0, 0, 1)
	.word 0xa6340011  ! 1: ORN_R	orn 	%r16, %r17, %r19
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x862c266b  ! 1: ANDN_I	andn 	%r16, 0x066b, %r3
	.word 0x9f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r15
thr3_hw_intr_851:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_851), 16, 16)) -> intp(2, 0, 1)
	.word 0x963423c9  ! 1: ORN_I	orn 	%r16, 0x03c9, %r11
thr3_hw_intr_852:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_852), 16, 16)) -> intp(1, 0, 1)
	.word 0x92c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x923c2584  ! 1: XNOR_I	xnor 	%r16, 0x0584, %r9
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
thr3_nuke_intr_853:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_853), 16, 16)) -> intp(2, 2, 1)
	.word 0xba14275f  ! 1: OR_I	or 	%r16, 0x075f, %r29
	.word 0xb6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r27
	.word 0x96b4225e  ! 1: ORNcc_I	orncc 	%r16, 0x025e, %r11
thr3_resum_intr_854:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_854), 16, 16)) -> intp(2, 3, 1)
	.word 0x9cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x8ebc2b0d  ! 1: XNORcc_I	xnorcc 	%r16, 0x0b0d, %r7
	.word 0x9eac25e0  ! 1: ANDNcc_I	andncc 	%r16, 0x05e0, %r15
thr3_nuke_intr_855:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_855), 16, 16)) -> intp(0, 2, 1)
	.word 0x85643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
thr3_resum_intr_856:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_856), 16, 16)) -> intp(0, 3, 1)
	.word 0x989425b9  ! 1: ORcc_I	orcc 	%r16, 0x05b9, %r12
thr3_hw_intr_857:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_857), 16, 16)) -> intp(0, 0, 1)
	.word 0x963426ee  ! 1: ORN_I	orn 	%r16, 0x06ee, %r11
	.word 0x849424a8  ! 1: ORcc_I	orcc 	%r16, 0x04a8, %r2
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
	.word 0x8c442c40  ! 1: ADDC_I	addc 	%r16, 0x0c40, %r6
thr3_nuke_intr_858:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_858), 16, 16)) -> intp(2, 2, 1)
	.word 0xb6c4284e  ! 1: ADDCcc_I	addccc 	%r16, 0x084e, %r27
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
	.word 0xb60c0011  ! 1: AND_R	and 	%r16, %r17, %r27
thr3_resum_intr_859:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_859), 16, 16)) -> intp(2, 3, 1)
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
thr3_nuke_intr_860:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_860), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_861:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_861), 16, 16)) -> intp(0, 3, 1)
	.word 0xb62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
thr3_nuke_intr_862:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_862), 16, 16)) -> intp(2, 2, 1)
	.word 0xa7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r19
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
thr3_resum_intr_863:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_863), 16, 16)) -> intp(2, 3, 1)
	.word 0x8d643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xac2c2099  ! 1: ANDN_I	andn 	%r16, 0x0099, %r22
	.word 0xb8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r28
thr3_nuke_intr_864:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_864), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e040011  ! 1: ADD_R	add 	%r16, %r17, %r15
thr3_resum_intr_865:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_865), 16, 16)) -> intp(1, 3, 1)
	.word 0xac2c2b88  ! 1: ANDN_I	andn 	%r16, 0x0b88, %r22
	.word 0x9f340011  ! 1: SRL_R	srl 	%r16, %r17, %r15
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
	.word 0xb21c0011  ! 1: XOR_R	xor 	%r16, %r17, %r25
thr3_hw_intr_866:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_866), 16, 16)) -> intp(2, 0, 1)
	.word 0x968c2b56  ! 1: ANDcc_I	andcc 	%r16, 0x0b56, %r11
thr3_hw_intr_867:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_867), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c442767  ! 1: ADDC_I	addc 	%r16, 0x0767, %r6
	.word 0xa80c0011  ! 1: AND_R	and 	%r16, %r17, %r20
thr3_nuke_intr_868:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_868), 16, 16)) -> intp(2, 2, 1)
	.word 0x82c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
thr3_resum_intr_869:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_869), 16, 16)) -> intp(2, 3, 1)
	.word 0x884427d6  ! 1: ADDC_I	addc 	%r16, 0x07d6, %r4
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
thr3_hw_intr_870:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_870), 16, 16)) -> intp(2, 0, 1)
	.word 0x8c442b86  ! 1: ADDC_I	addc 	%r16, 0x0b86, %r6
	.word 0x861c2160  ! 1: XOR_I	xor 	%r16, 0x0160, %r3
thr3_hw_intr_871:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_871), 16, 16)) -> intp(1, 0, 1)
	.word 0x937c2401  ! 1: MOVR_I	move	%r16, 0x160, %r9
	.word 0x944425f6  ! 1: ADDC_I	addc 	%r16, 0x05f6, %r10
	.word 0x9e0c23a9  ! 1: AND_I	and 	%r16, 0x03a9, %r15
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
thr3_hw_intr_872:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_872), 16, 16)) -> intp(1, 0, 1)
	.word 0xa8c42675  ! 1: ADDCcc_I	addccc 	%r16, 0x0675, %r20
	.word 0x893c1011  ! 1: SRAX_R	srax	%r16, %r17, %r4
thr3_hw_intr_873:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_873), 16, 16)) -> intp(2, 0, 1)
	.word 0x969c29cf  ! 1: XORcc_I	xorcc 	%r16, 0x09cf, %r11
	.word 0x9b7c2401  ! 1: MOVR_I	move	%r16, 0x9cf, %r13
	.word 0xa8040011  ! 1: ADD_R	add 	%r16, %r17, %r20
thr3_hw_intr_874:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_874), 16, 16)) -> intp(0, 0, 1)
	.word 0x8ec427af  ! 1: ADDCcc_I	addccc 	%r16, 0x07af, %r7
	.word 0x8cac2d63  ! 1: ANDNcc_I	andncc 	%r16, 0x0d63, %r6
thr3_nuke_intr_875:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_875), 16, 16)) -> intp(0, 2, 1)
	.word 0x853c0011  ! 1: SRA_R	sra 	%r16, %r17, %r2
thr3_resum_intr_876:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_876), 16, 16)) -> intp(0, 3, 1)
	.word 0x889c267b  ! 1: XORcc_I	xorcc 	%r16, 0x067b, %r4
thr3_nuke_intr_877:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_877), 16, 16)) -> intp(1, 2, 1)
	.word 0xb3340011  ! 1: SRL_R	srl 	%r16, %r17, %r25
thr3_resum_intr_878:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_878), 16, 16)) -> intp(1, 3, 1)
	.word 0x9a8c2768  ! 1: ANDcc_I	andcc 	%r16, 0x0768, %r13
thr3_hw_intr_879:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_879), 16, 16)) -> intp(0, 0, 1)
	.word 0x837c2401  ! 1: MOVR_I	move	%r16, 0xffffff68, %r1
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
thr3_nuke_intr_880:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_880), 16, 16)) -> intp(2, 2, 1)
	.word 0x90c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r8
thr3_resum_intr_881:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_881), 16, 16)) -> intp(2, 3, 1)
	.word 0xa72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r19
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x949c2405  ! 1: XORcc_I	xorcc 	%r16, 0x0405, %r10
thr3_hw_intr_882:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_882), 16, 16)) -> intp(0, 0, 1)
	.word 0x92c42d34  ! 1: ADDCcc_I	addccc 	%r16, 0x0d34, %r9
	.word 0x90342909  ! 1: ORN_I	orn 	%r16, 0x0909, %r8
	.word 0x8f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r7
	.word 0x96942473  ! 1: ORcc_I	orcc 	%r16, 0x0473, %r11
thr3_nuke_intr_883:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_883), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9a3c219a  ! 1: XNOR_I	xnor 	%r16, 0x019a, %r13
thr3_resum_intr_884:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_884), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6442e00  ! 1: ADDC_I	addc 	%r16, 0x0e00, %r27
	.word 0x96c422ab  ! 1: ADDCcc_I	addccc 	%r16, 0x02ab, %r11
thr3_nuke_intr_885:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_885), 16, 16)) -> intp(1, 2, 1)
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
	.word 0x94140011  ! 1: OR_R	or 	%r16, %r17, %r10
	.word 0x9c3c2238  ! 1: XNOR_I	xnor 	%r16, 0x0238, %r14
thr3_resum_intr_886:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_886), 16, 16)) -> intp(1, 3, 1)
	.word 0xb72c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0xb12c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r24
thr3_hw_intr_887:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_887), 16, 16)) -> intp(1, 0, 1)
	.word 0x8f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r7
	.word 0x9e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0xb53c0011  ! 1: SRA_R	sra 	%r16, %r17, %r26
thr3_hw_intr_888:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_888), 16, 16)) -> intp(2, 0, 1)
	.word 0x942c22f8  ! 1: ANDN_I	andn 	%r16, 0x02f8, %r10
thr3_hw_intr_889:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_889), 16, 16)) -> intp(1, 0, 1)
	.word 0x88c42d2e  ! 1: ADDCcc_I	addccc 	%r16, 0x0d2e, %r4
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
thr3_hw_intr_890:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_890), 16, 16)) -> intp(0, 0, 1)
	.word 0x912c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r8
thr3_hw_intr_891:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_891), 16, 16)) -> intp(2, 0, 1)
	.word 0x912c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x83641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_892:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_892), 16, 16)) -> intp(2, 0, 1)
	.word 0x837c2401  ! 1: MOVR_I	move	%r16, 0x1, %r1
	.word 0xb52c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r26
thr3_nuke_intr_893:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_893), 16, 16)) -> intp(0, 2, 1)
	.word 0x9f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r15
	.word 0x941422a2  ! 1: OR_I	or 	%r16, 0x02a2, %r10
thr3_resum_intr_894:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_894), 16, 16)) -> intp(0, 3, 1)
	.word 0x942c2015  ! 1: ANDN_I	andn 	%r16, 0x0015, %r10
	.word 0x84ac2253  ! 1: ANDNcc_I	andncc 	%r16, 0x0253, %r2
	.word 0x837c0411  ! 1: MOVR_R	move	%r16, %r17, %r1
	.word 0x9cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r14
thr3_nuke_intr_895:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_895), 16, 16)) -> intp(1, 2, 1)
	.word 0x92c42d86  ! 1: ADDCcc_I	addccc 	%r16, 0x0d86, %r9
	.word 0x9f641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb0c422f1  ! 1: ADDCcc_I	addccc 	%r16, 0x02f1, %r24
thr3_resum_intr_896:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_896), 16, 16)) -> intp(1, 3, 1)
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0xfffffef1, %r7
	.word 0x837c2401  ! 1: MOVR_I	move	%r16, 0xfffffef1, %r1
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
thr3_nuke_intr_897:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_897), 16, 16)) -> intp(2, 2, 1)
	.word 0x98bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0xac340011  ! 1: ORN_R	orn 	%r16, %r17, %r22
	.word 0x932c0011  ! 1: SLL_R	sll 	%r16, %r17, %r9
	.word 0x8c842c73  ! 1: ADDcc_I	addcc 	%r16, 0x0c73, %r6
thr3_resum_intr_898:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_898), 16, 16)) -> intp(2, 3, 1)
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0xc73, %r7
	.word 0x901c0011  ! 1: XOR_R	xor 	%r16, %r17, %r8
	.word 0x873c0011  ! 1: SRA_R	sra 	%r16, %r17, %r3
thr3_nuke_intr_899:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_899), 16, 16)) -> intp(2, 2, 1)
	.word 0x909c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0x9a442866  ! 1: ADDC_I	addc 	%r16, 0x0866, %r13
	.word 0xb73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r27
thr3_resum_intr_900:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_900), 16, 16)) -> intp(2, 3, 1)
	.word 0x888c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0x997c2401  ! 1: MOVR_I	move	%r16, 0x11, %r12
	.word 0xb4942941  ! 1: ORcc_I	orcc 	%r16, 0x0941, %r26
thr3_nuke_intr_901:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_901), 16, 16)) -> intp(2, 2, 1)
	.word 0xae0c0011  ! 1: AND_R	and 	%r16, %r17, %r23
	.word 0xb32c0011  ! 1: SLL_R	sll 	%r16, %r17, %r25
thr3_resum_intr_902:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_902), 16, 16)) -> intp(2, 3, 1)
	.word 0x88840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x8c2c2e6d  ! 1: ANDN_I	andn 	%r16, 0x0e6d, %r6
	.word 0x9e340011  ! 1: ORN_R	orn 	%r16, %r17, %r15
thr3_nuke_intr_903:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_903), 16, 16)) -> intp(0, 2, 1)
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x980c27e4  ! 1: AND_I	and 	%r16, 0x07e4, %r12
thr3_resum_intr_904:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_904), 16, 16)) -> intp(0, 3, 1)
	.word 0x85343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0xa88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r20
thr3_nuke_intr_905:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_905), 16, 16)) -> intp(2, 2, 1)
	.word 0x9f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x973c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x929c26bb  ! 1: XORcc_I	xorcc 	%r16, 0x06bb, %r9
thr3_resum_intr_906:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_906), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e9c25e6  ! 1: XORcc_I	xorcc 	%r16, 0x05e6, %r15
	.word 0x882c2b5a  ! 1: ANDN_I	andn 	%r16, 0x0b5a, %r4
	.word 0xb4c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r26
thr3_hw_intr_907:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_907), 16, 16)) -> intp(2, 0, 1)
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
thr3_hw_intr_908:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_908), 16, 16)) -> intp(2, 0, 1)
	.word 0x94c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x96442058  ! 1: ADDC_I	addc 	%r16, 0x0058, %r11
thr3_hw_intr_909:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_909), 16, 16)) -> intp(1, 0, 1)
	.word 0x9a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r13
	.word 0x9c2c2c16  ! 1: ANDN_I	andn 	%r16, 0x0c16, %r14
	.word 0x8a0c0011  ! 1: AND_R	and 	%r16, %r17, %r5
	.word 0x92040011  ! 1: ADD_R	add 	%r16, %r17, %r9
thr3_hw_intr_910:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_910), 16, 16)) -> intp(1, 0, 1)
	.word 0x841c2cd5  ! 1: XOR_I	xor 	%r16, 0x0cd5, %r2
	.word 0x86842ce3  ! 1: ADDcc_I	addcc 	%r16, 0x0ce3, %r3
	.word 0x9abc20e3  ! 1: XNORcc_I	xnorcc 	%r16, 0x00e3, %r13
thr3_nuke_intr_911:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_911), 16, 16)) -> intp(1, 2, 1)
	.word 0x85341011  ! 1: SRLX_R	srlx	%r16, %r17, %r2
thr3_resum_intr_912:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_912), 16, 16)) -> intp(1, 3, 1)
	.word 0x972c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r11
	.word 0xae140011  ! 1: OR_R	or 	%r16, %r17, %r23
thr3_hw_intr_913:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_913), 16, 16)) -> intp(2, 0, 1)
	.word 0x88842e83  ! 1: ADDcc_I	addcc 	%r16, 0x0e83, %r4
	.word 0x902c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x9f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x9c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r14
thr3_nuke_intr_914:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_914), 16, 16)) -> intp(0, 2, 1)
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x928c27b5  ! 1: ANDcc_I	andcc 	%r16, 0x07b5, %r9
	.word 0x8e8422ad  ! 1: ADDcc_I	addcc 	%r16, 0x02ad, %r7
thr3_resum_intr_915:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_915), 16, 16)) -> intp(0, 3, 1)
	.word 0x8d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r6
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0xac940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0x98bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r12
thr3_hw_intr_916:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_916), 16, 16)) -> intp(0, 0, 1)
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
thr3_nuke_intr_917:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_917), 16, 16)) -> intp(0, 2, 1)
	.word 0x823c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r1
thr3_resum_intr_918:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_918), 16, 16)) -> intp(0, 3, 1)
	.word 0xa8c425a7  ! 1: ADDCcc_I	addccc 	%r16, 0x05a7, %r20
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x89340011  ! 1: SRL_R	srl 	%r16, %r17, %r4
	.word 0xb2040011  ! 1: ADD_R	add 	%r16, %r17, %r25
thr3_hw_intr_919:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_919), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a042d4b  ! 1: ADD_I	add 	%r16, 0x0d4b, %r13
	.word 0x84ac2ff4  ! 1: ANDNcc_I	andncc 	%r16, 0x0ff4, %r2
	.word 0x8aac26a5  ! 1: ANDNcc_I	andncc 	%r16, 0x06a5, %r5
	.word 0x9c942752  ! 1: ORcc_I	orcc 	%r16, 0x0752, %r14
thr3_nuke_intr_920:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_920), 16, 16)) -> intp(2, 2, 1)
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0xb6442545  ! 1: ADDC_I	addc 	%r16, 0x0545, %r27
thr3_resum_intr_921:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_921), 16, 16)) -> intp(2, 3, 1)
	.word 0xb2bc2c7c  ! 1: XNORcc_I	xnorcc 	%r16, 0x0c7c, %r25
thr3_nuke_intr_922:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_922), 16, 16)) -> intp(1, 2, 1)
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0xb4040011  ! 1: ADD_R	add 	%r16, %r17, %r26
thr3_resum_intr_923:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_923), 16, 16)) -> intp(1, 3, 1)
	.word 0x92840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0x98940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0xbaac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r29
	.word 0xae842eff  ! 1: ADDcc_I	addcc 	%r16, 0x0eff, %r23
thr3_hw_intr_924:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_924), 16, 16)) -> intp(0, 0, 1)
	.word 0xb41c2ed5  ! 1: XOR_I	xor 	%r16, 0x0ed5, %r26
	.word 0x94042b36  ! 1: ADD_I	add 	%r16, 0x0b36, %r10
thr3_hw_intr_925:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_925), 16, 16)) -> intp(2, 0, 1)
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x8e842592  ! 1: ADDcc_I	addcc 	%r16, 0x0592, %r7
	.word 0x8cc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x912c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r8
thr3_nuke_intr_926:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_926), 16, 16)) -> intp(1, 2, 1)
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x84ac2a01  ! 1: ANDNcc_I	andncc 	%r16, 0x0a01, %r2
	.word 0xb4c4269b  ! 1: ADDCcc_I	addccc 	%r16, 0x069b, %r26
thr3_resum_intr_927:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_927), 16, 16)) -> intp(1, 3, 1)
	.word 0xac3c26b2  ! 1: XNOR_I	xnor 	%r16, 0x06b2, %r22
	.word 0xac8427a0  ! 1: ADDcc_I	addcc 	%r16, 0x07a0, %r22
	.word 0xb4440011  ! 1: ADDC_R	addc 	%r16, %r17, %r26
	.word 0xa8bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r20
thr3_hw_intr_928:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_928), 16, 16)) -> intp(0, 0, 1)
	.word 0x92940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r9
thr3_hw_intr_929:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_929), 16, 16)) -> intp(0, 0, 1)
	.word 0xb83c2cfb  ! 1: XNOR_I	xnor 	%r16, 0x0cfb, %r28
thr3_nuke_intr_930:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_930), 16, 16)) -> intp(1, 2, 1)
	.word 0x928c2c59  ! 1: ANDcc_I	andcc 	%r16, 0x0c59, %r9
	.word 0x942c2c01  ! 1: ANDN_I	andn 	%r16, 0x0c01, %r10
	.word 0x8ec4213b  ! 1: ADDCcc_I	addccc 	%r16, 0x013b, %r7
thr3_resum_intr_931:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_931), 16, 16)) -> intp(1, 3, 1)
	.word 0xb8c42c99  ! 1: ADDCcc_I	addccc 	%r16, 0x0c99, %r28
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
thr3_hw_intr_932:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_932), 16, 16)) -> intp(0, 0, 1)
	.word 0xb6140011  ! 1: OR_R	or 	%r16, %r17, %r27
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
thr3_nuke_intr_933:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_933), 16, 16)) -> intp(2, 2, 1)
	.word 0x8f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r7
thr3_resum_intr_934:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_934), 16, 16)) -> intp(2, 3, 1)
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0xa8940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r20
thr3_nuke_intr_935:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_935), 16, 16)) -> intp(1, 2, 1)
	.word 0x922c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r9
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x897c0411  ! 1: MOVR_R	move	%r16, %r17, %r4
thr3_resum_intr_936:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_936), 16, 16)) -> intp(1, 3, 1)
	.word 0x997c0411  ! 1: MOVR_R	move	%r16, %r17, %r12
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
thr3_nuke_intr_937:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_937), 16, 16)) -> intp(2, 2, 1)
	.word 0xa8140011  ! 1: OR_R	or 	%r16, %r17, %r20
thr3_resum_intr_938:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_938), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e140011  ! 1: OR_R	or 	%r16, %r17, %r15
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x95341011  ! 1: SRLX_R	srlx	%r16, %r17, %r10
thr3_hw_intr_939:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_939), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e2c2a1e  ! 1: ANDN_I	andn 	%r16, 0x0a1e, %r7
	.word 0x973c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0xb4840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
thr3_nuke_intr_940:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_940), 16, 16)) -> intp(2, 2, 1)
	.word 0x9e3c2885  ! 1: XNOR_I	xnor 	%r16, 0x0885, %r15
	.word 0xae042cc9  ! 1: ADD_I	add 	%r16, 0x0cc9, %r23
thr3_resum_intr_941:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_941), 16, 16)) -> intp(2, 3, 1)
	.word 0x983c27d2  ! 1: XNOR_I	xnor 	%r16, 0x07d2, %r12
	.word 0xb9643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x920c235f  ! 1: AND_I	and 	%r16, 0x035f, %r9
thr3_hw_intr_942:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_942), 16, 16)) -> intp(2, 0, 1)
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
	.word 0xb6942144  ! 1: ORcc_I	orcc 	%r16, 0x0144, %r27
thr3_hw_intr_943:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_943), 16, 16)) -> intp(1, 0, 1)
	.word 0x95343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0x8a3c2f4f  ! 1: XNOR_I	xnor 	%r16, 0x0f4f, %r5
	.word 0x87340011  ! 1: SRL_R	srl 	%r16, %r17, %r3
thr3_hw_intr_944:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_944), 16, 16)) -> intp(1, 0, 1)
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
thr3_nuke_intr_945:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_945), 16, 16)) -> intp(2, 2, 1)
	.word 0xba2c2159  ! 1: ANDN_I	andn 	%r16, 0x0159, %r29
thr3_resum_intr_946:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_946), 16, 16)) -> intp(2, 3, 1)
	.word 0xbb3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0xbb3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0x862c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r3
thr3_hw_intr_947:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_947), 16, 16)) -> intp(0, 0, 1)
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0xaa3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r21
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
thr3_hw_intr_948:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_948), 16, 16)) -> intp(0, 0, 1)
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x957c0411  ! 1: MOVR_R	move	%r16, %r17, %r10
	.word 0xb3342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r25
thr3_hw_intr_949:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_949), 16, 16)) -> intp(1, 0, 1)
	.word 0x9a2c2612  ! 1: ANDN_I	andn 	%r16, 0x0612, %r13
thr3_hw_intr_950:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_950), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c442817  ! 1: ADDC_I	addc 	%r16, 0x0817, %r6
	.word 0xb80c0011  ! 1: AND_R	and 	%r16, %r17, %r28
	.word 0x86ac26a0  ! 1: ANDNcc_I	andncc 	%r16, 0x06a0, %r3
thr3_nuke_intr_951:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_951), 16, 16)) -> intp(0, 2, 1)
	.word 0x88440011  ! 1: ADDC_R	addc 	%r16, %r17, %r4
	.word 0xb0b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r24
thr3_resum_intr_952:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_952), 16, 16)) -> intp(0, 3, 1)
	.word 0x9234282e  ! 1: ORN_I	orn 	%r16, 0x082e, %r9
	.word 0x9c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r14
thr3_nuke_intr_953:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_953), 16, 16)) -> intp(1, 2, 1)
	.word 0xb7340011  ! 1: SRL_R	srl 	%r16, %r17, %r27
	.word 0x841c0011  ! 1: XOR_R	xor 	%r16, %r17, %r2
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
thr3_resum_intr_954:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_954), 16, 16)) -> intp(1, 3, 1)
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
thr3_hw_intr_955:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_955), 16, 16)) -> intp(0, 0, 1)
	.word 0xb80c0011  ! 1: AND_R	and 	%r16, %r17, %r28
	.word 0x84442972  ! 1: ADDC_I	addc 	%r16, 0x0972, %r2
	.word 0xb0ac2724  ! 1: ANDNcc_I	andncc 	%r16, 0x0724, %r24
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
thr3_hw_intr_956:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_956), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
	.word 0x843c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0x9e0c269e  ! 1: AND_I	and 	%r16, 0x069e, %r15
thr3_hw_intr_957:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_957), 16, 16)) -> intp(0, 0, 1)
	.word 0x957c0411  ! 1: MOVR_R	move	%r16, %r17, %r10
thr3_nuke_intr_958:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_958), 16, 16)) -> intp(0, 2, 1)
	.word 0x973c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r11
thr3_resum_intr_959:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_959), 16, 16)) -> intp(0, 3, 1)
	.word 0xae942bbe  ! 1: ORcc_I	orcc 	%r16, 0x0bbe, %r23
	.word 0x9b643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
thr3_nuke_intr_960:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_960), 16, 16)) -> intp(0, 2, 1)
	.word 0x972c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x9b7c0411  ! 1: MOVR_R	move	%r16, %r17, %r13
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
thr3_resum_intr_961:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_961), 16, 16)) -> intp(0, 3, 1)
	.word 0x953c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r10
thr3_hw_intr_962:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_962), 16, 16)) -> intp(1, 0, 1)
	.word 0x900c2dfc  ! 1: AND_I	and 	%r16, 0x0dfc, %r8
	.word 0x952c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x94440011  ! 1: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x9cb42a43  ! 1: ORNcc_I	orncc 	%r16, 0x0a43, %r14
thr3_hw_intr_963:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_963), 16, 16)) -> intp(1, 0, 1)
	.word 0xa7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r19
thr3_hw_intr_964:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_964), 16, 16)) -> intp(2, 0, 1)
	.word 0xacbc2c89  ! 1: XNORcc_I	xnorcc 	%r16, 0x0c89, %r22
thr3_nuke_intr_965:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_965), 16, 16)) -> intp(2, 2, 1)
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
thr3_resum_intr_966:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_966), 16, 16)) -> intp(2, 3, 1)
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0xb69423a1  ! 1: ORcc_I	orcc 	%r16, 0x03a1, %r27
	.word 0xb29c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r25
thr3_hw_intr_967:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_967), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c842fd5  ! 1: ADDcc_I	addcc 	%r16, 0x0fd5, %r14
thr3_hw_intr_968:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_968), 16, 16)) -> intp(1, 0, 1)
	.word 0x9a342152  ! 1: ORN_I	orn 	%r16, 0x0152, %r13
	.word 0xac842ab0  ! 1: ADDcc_I	addcc 	%r16, 0x0ab0, %r22
thr3_nuke_intr_969:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_969), 16, 16)) -> intp(0, 2, 1)
	.word 0x9e2c2243  ! 1: ANDN_I	andn 	%r16, 0x0243, %r15
	.word 0x821424b0  ! 1: OR_I	or 	%r16, 0x04b0, %r1
	.word 0x8e2c242d  ! 1: ANDN_I	andn 	%r16, 0x042d, %r7
	.word 0xb8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r28
thr3_resum_intr_970:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_970), 16, 16)) -> intp(0, 3, 1)
	.word 0xa8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x98ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xb2340011  ! 1: ORN_R	orn 	%r16, %r17, %r25
thr3_hw_intr_971:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_971), 16, 16)) -> intp(2, 0, 1)
	.word 0xa6142c1e  ! 1: OR_I	or 	%r16, 0x0c1e, %r19
thr3_hw_intr_972:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_972), 16, 16)) -> intp(1, 0, 1)
	.word 0x8d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0xbb643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
	.word 0x89341011  ! 1: SRLX_R	srlx	%r16, %r17, %r4
thr3_nuke_intr_973:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_973), 16, 16)) -> intp(2, 2, 1)
	.word 0xb33c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r25
thr3_resum_intr_974:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_974), 16, 16)) -> intp(2, 3, 1)
	.word 0x881c25ca  ! 1: XOR_I	xor 	%r16, 0x05ca, %r4
	.word 0x90142486  ! 1: OR_I	or 	%r16, 0x0486, %r8
thr3_nuke_intr_975:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_975), 16, 16)) -> intp(0, 2, 1)
	.word 0x961c0011  ! 1: XOR_R	xor 	%r16, %r17, %r11
	.word 0xb83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0x8f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r7
	.word 0x98340011  ! 1: ORN_R	orn 	%r16, %r17, %r12
thr3_resum_intr_976:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_976), 16, 16)) -> intp(0, 3, 1)
	.word 0xa6bc2b2f  ! 1: XNORcc_I	xnorcc 	%r16, 0x0b2f, %r19
	.word 0xa7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xaf2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r23
	.word 0xba842a63  ! 1: ADDcc_I	addcc 	%r16, 0x0a63, %r29
thr3_hw_intr_977:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_977), 16, 16)) -> intp(1, 0, 1)
	.word 0x901c2bd2  ! 1: XOR_I	xor 	%r16, 0x0bd2, %r8
thr3_nuke_intr_978:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_978), 16, 16)) -> intp(2, 2, 1)
	.word 0xb20423f9  ! 1: ADD_I	add 	%r16, 0x03f9, %r25
	.word 0x8a140011  ! 1: OR_R	or 	%r16, %r17, %r5
	.word 0x8e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r7
	.word 0xa60c21fa  ! 1: AND_I	and 	%r16, 0x01fa, %r19
thr3_resum_intr_979:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_979), 16, 16)) -> intp(2, 3, 1)
	.word 0x96040011  ! 1: ADD_R	add 	%r16, %r17, %r11
	.word 0x897c2401  ! 1: MOVR_I	move	%r16, 0x11, %r4
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
thr3_hw_intr_980:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_980), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0xac042275  ! 1: ADD_I	add 	%r16, 0x0275, %r22
	.word 0x9b7c2401  ! 1: MOVR_I	move	%r16, 0xfffffe75, %r13
	.word 0xac2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r22
thr3_nuke_intr_981:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_981), 16, 16)) -> intp(2, 2, 1)
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0xaf2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0xaa0c0011  ! 1: AND_R	and 	%r16, %r17, %r21
thr3_resum_intr_982:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_982), 16, 16)) -> intp(2, 3, 1)
	.word 0x9cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0x98ac25c5  ! 1: ANDNcc_I	andncc 	%r16, 0x05c5, %r12
	.word 0x96b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r11
thr3_hw_intr_983:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_983), 16, 16)) -> intp(0, 0, 1)
	.word 0x8c9427e8  ! 1: ORcc_I	orcc 	%r16, 0x07e8, %r6
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0xba3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r29
thr3_hw_intr_984:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_984), 16, 16)) -> intp(2, 0, 1)
	.word 0x9e142b60  ! 1: OR_I	or 	%r16, 0x0b60, %r15
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
thr3_hw_intr_985:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_985), 16, 16)) -> intp(2, 0, 1)
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
	.word 0x892c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r4
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
	.word 0x9a442fac  ! 1: ADDC_I	addc 	%r16, 0x0fac, %r13
thr3_hw_intr_986:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_986), 16, 16)) -> intp(0, 0, 1)
	.word 0x837c0411  ! 1: MOVR_R	move	%r16, %r17, %r1
	.word 0xb4142f79  ! 1: OR_I	or 	%r16, 0x0f79, %r26
	.word 0x8f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r7
	.word 0x8b641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_987:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_987), 16, 16)) -> intp(2, 0, 1)
	.word 0x8c3c2d67  ! 1: XNOR_I	xnor 	%r16, 0x0d67, %r6
	.word 0x88340011  ! 1: ORN_R	orn 	%r16, %r17, %r4
thr3_hw_intr_988:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_988), 16, 16)) -> intp(0, 0, 1)
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xaf2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x86440011  ! 1: ADDC_R	addc 	%r16, %r17, %r3
thr3_nuke_intr_989:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_989), 16, 16)) -> intp(2, 2, 1)
	.word 0xbaac20a7  ! 1: ANDNcc_I	andncc 	%r16, 0x00a7, %r29
thr3_resum_intr_990:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_990), 16, 16)) -> intp(2, 3, 1)
	.word 0xb12c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x928c2cb7  ! 1: ANDcc_I	andcc 	%r16, 0x0cb7, %r9
thr3_hw_intr_991:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_991), 16, 16)) -> intp(0, 0, 1)
	.word 0x8d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0xb32c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r25
thr3_hw_intr_992:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_992), 16, 16)) -> intp(0, 0, 1)
	.word 0x9d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0xaa340011  ! 1: ORN_R	orn 	%r16, %r17, %r21
thr3_hw_intr_993:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_993), 16, 16)) -> intp(2, 0, 1)
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0xb92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
thr3_nuke_intr_994:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_994), 16, 16)) -> intp(0, 2, 1)
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
thr3_resum_intr_995:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_995), 16, 16)) -> intp(0, 3, 1)
	.word 0xa97c0411  ! 1: MOVR_R	move	%r16, %r17, %r20
	.word 0xa6140011  ! 1: OR_R	or 	%r16, %r17, %r19
	.word 0x8d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r6
	.word 0x8aac2535  ! 1: ANDNcc_I	andncc 	%r16, 0x0535, %r5
thr3_hw_intr_996:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_996), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c342e66  ! 1: ORN_I	orn 	%r16, 0x0e66, %r14
	.word 0x9c0c0011  ! 1: AND_R	and 	%r16, %r17, %r14
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x960c0011  ! 1: AND_R	and 	%r16, %r17, %r11
thr3_nuke_intr_997:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_997), 16, 16)) -> intp(2, 2, 1)
	.word 0x8d7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r6
thr3_resum_intr_998:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_998), 16, 16)) -> intp(2, 3, 1)
	.word 0x92940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x941c0011  ! 1: XOR_R	xor 	%r16, %r17, %r10
	.word 0xa92c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r20
	.word 0x97641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_999:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_999), 16, 16)) -> intp(1, 0, 1)
	.word 0x821c2cf0  ! 1: XOR_I	xor 	%r16, 0x0cf0, %r1
	.word 0x880c2df0  ! 1: AND_I	and 	%r16, 0x0df0, %r4
	.word 0x841c0011  ! 1: XOR_R	xor 	%r16, %r17, %r2
thr3_hw_intr_1000:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1000), 16, 16)) -> intp(2, 0, 1)
	.word 0x89641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x820c2046  ! 1: AND_I	and 	%r16, 0x0046, %r1
thr3_nuke_intr_1001:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1001), 16, 16)) -> intp(0, 2, 1)
	.word 0xb68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r27
thr3_resum_intr_1002:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1002), 16, 16)) -> intp(0, 3, 1)
	.word 0xb89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r28
thr3_nuke_intr_1003:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1003), 16, 16)) -> intp(0, 2, 1)
	.word 0x93641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_1004:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1004), 16, 16)) -> intp(0, 3, 1)
	.word 0x96bc2e14  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e14, %r11
	.word 0x96142c47  ! 1: OR_I	or 	%r16, 0x0c47, %r11
thr3_hw_intr_1005:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1005), 16, 16)) -> intp(0, 0, 1)
	.word 0x972c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0xab7c0411  ! 1: MOVR_R	move	%r16, %r17, %r21
thr3_hw_intr_1006:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1006), 16, 16)) -> intp(1, 0, 1)
	.word 0xa6b42add  ! 1: ORNcc_I	orncc 	%r16, 0x0add, %r19
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
thr3_hw_intr_1007:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1007), 16, 16)) -> intp(1, 0, 1)
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x96442efb  ! 1: ADDC_I	addc 	%r16, 0x0efb, %r11
	.word 0x942c2973  ! 1: ANDN_I	andn 	%r16, 0x0973, %r10
thr3_hw_intr_1008:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1008), 16, 16)) -> intp(2, 0, 1)
	.word 0xb53c0011  ! 1: SRA_R	sra 	%r16, %r17, %r26
	.word 0x84ac2a46  ! 1: ANDNcc_I	andncc 	%r16, 0x0a46, %r2
thr3_nuke_intr_1009:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1009), 16, 16)) -> intp(2, 2, 1)
	.word 0xab3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r21
thr3_resum_intr_1010:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1010), 16, 16)) -> intp(2, 3, 1)
	.word 0x83641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x972c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x9cc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r14
thr3_nuke_intr_1011:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1011), 16, 16)) -> intp(0, 2, 1)
	.word 0x841c0011  ! 1: XOR_R	xor 	%r16, %r17, %r2
	.word 0xb6140011  ! 1: OR_R	or 	%r16, %r17, %r27
	.word 0x843c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r2
thr3_resum_intr_1012:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1012), 16, 16)) -> intp(0, 3, 1)
	.word 0x852c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0xb5643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9ec426ae  ! 1: ADDCcc_I	addccc 	%r16, 0x06ae, %r15
thr3_hw_intr_1013:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1013), 16, 16)) -> intp(2, 0, 1)
	.word 0x821c299f  ! 1: XOR_I	xor 	%r16, 0x099f, %r1
	.word 0x868425df  ! 1: ADDcc_I	addcc 	%r16, 0x05df, %r3
	.word 0xad2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r22
thr3_hw_intr_1014:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1014), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c142e51  ! 1: OR_I	or 	%r16, 0x0e51, %r14
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
thr3_hw_intr_1015:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1015), 16, 16)) -> intp(1, 0, 1)
	.word 0x972c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r11
	.word 0x9e2c2cf9  ! 1: ANDN_I	andn 	%r16, 0x0cf9, %r15
thr3_hw_intr_1016:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1016), 16, 16)) -> intp(1, 0, 1)
	.word 0x873c1011  ! 1: SRAX_R	srax	%r16, %r17, %r3
thr3_hw_intr_1017:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1017), 16, 16)) -> intp(2, 0, 1)
	.word 0x9c042b14  ! 1: ADD_I	add 	%r16, 0x0b14, %r14
	.word 0x8d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r6
	.word 0x8b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r5
thr3_hw_intr_1018:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1018), 16, 16)) -> intp(0, 0, 1)
	.word 0xb7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb4942d0f  ! 1: ORcc_I	orcc 	%r16, 0x0d0f, %r26
	.word 0xb0bc2e20  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e20, %r24
thr3_nuke_intr_1019:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1019), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x8e342436  ! 1: ORN_I	orn 	%r16, 0x0436, %r7
	.word 0x8a1c2e0c  ! 1: XOR_I	xor 	%r16, 0x0e0c, %r5
thr3_resum_intr_1020:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1020), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c042c19  ! 1: ADD_I	add 	%r16, 0x0c19, %r6
	.word 0x8ab425a2  ! 1: ORNcc_I	orncc 	%r16, 0x05a2, %r5
thr3_hw_intr_1021:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1021), 16, 16)) -> intp(2, 0, 1)
	.word 0x937c0411  ! 1: MOVR_R	move	%r16, %r17, %r9
	.word 0x9d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0xacbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r22
thr3_hw_intr_1022:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1022), 16, 16)) -> intp(2, 0, 1)
	.word 0x82842851  ! 1: ADDcc_I	addcc 	%r16, 0x0851, %r1
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
thr3_hw_intr_1023:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1023), 16, 16)) -> intp(2, 0, 1)
	.word 0xaa1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r21
	.word 0x84ac2e00  ! 1: ANDNcc_I	andncc 	%r16, 0x0e00, %r2
	.word 0xa92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
thr3_nuke_intr_1024:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1024), 16, 16)) -> intp(1, 2, 1)
	.word 0x961c0011  ! 1: XOR_R	xor 	%r16, %r17, %r11
	.word 0xb57c2401  ! 1: MOVR_I	move	%r16, 0x11, %r26
thr3_resum_intr_1025:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1025), 16, 16)) -> intp(1, 3, 1)
	.word 0x880c0011  ! 1: AND_R	and 	%r16, %r17, %r4
	.word 0x94ac2e72  ! 1: ANDNcc_I	andncc 	%r16, 0x0e72, %r10
	.word 0x8c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r6
thr3_hw_intr_1026:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1026), 16, 16)) -> intp(1, 0, 1)
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x86bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r3
thr3_nuke_intr_1027:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1027), 16, 16)) -> intp(0, 2, 1)
	.word 0x8cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0xb37c0411  ! 1: MOVR_R	move	%r16, %r17, %r25
	.word 0x9c0c0011  ! 1: AND_R	and 	%r16, %r17, %r14
thr3_resum_intr_1028:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1028), 16, 16)) -> intp(0, 3, 1)
	.word 0x9c3c2673  ! 1: XNOR_I	xnor 	%r16, 0x0673, %r14
thr3_hw_intr_1029:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1029), 16, 16)) -> intp(1, 0, 1)
	.word 0x8f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r7
	.word 0x87343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x9c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r14
thr3_nuke_intr_1030:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1030), 16, 16)) -> intp(0, 2, 1)
	.word 0xb2042f27  ! 1: ADD_I	add 	%r16, 0x0f27, %r25
thr3_resum_intr_1031:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1031), 16, 16)) -> intp(0, 3, 1)
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
	.word 0x842c2c15  ! 1: ANDN_I	andn 	%r16, 0x0c15, %r2
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0xba342fa1  ! 1: ORN_I	orn 	%r16, 0x0fa1, %r29
thr3_hw_intr_1032:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1032), 16, 16)) -> intp(1, 0, 1)
	.word 0xb01c0011  ! 1: XOR_R	xor 	%r16, %r17, %r24
thr3_hw_intr_1033:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1033), 16, 16)) -> intp(1, 0, 1)
	.word 0x84b42381  ! 1: ORNcc_I	orncc 	%r16, 0x0381, %r2
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
thr3_nuke_intr_1034:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1034), 16, 16)) -> intp(1, 2, 1)
	.word 0xba2c2f64  ! 1: ANDN_I	andn 	%r16, 0x0f64, %r29
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_1035:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1035), 16, 16)) -> intp(1, 3, 1)
	.word 0x85342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0xb81c2112  ! 1: XOR_I	xor 	%r16, 0x0112, %r28
	.word 0xa6ac2faa  ! 1: ANDNcc_I	andncc 	%r16, 0x0faa, %r19
	.word 0x92c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r9
thr3_nuke_intr_1036:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1036), 16, 16)) -> intp(0, 2, 1)
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x83342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r1
thr3_resum_intr_1037:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1037), 16, 16)) -> intp(0, 3, 1)
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
	.word 0xb8340011  ! 1: ORN_R	orn 	%r16, %r17, %r28
	.word 0x8e442a71  ! 1: ADDC_I	addc 	%r16, 0x0a71, %r7
thr3_nuke_intr_1038:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1038), 16, 16)) -> intp(1, 2, 1)
	.word 0xb4340011  ! 1: ORN_R	orn 	%r16, %r17, %r26
	.word 0x9f340011  ! 1: SRL_R	srl 	%r16, %r17, %r15
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
thr3_resum_intr_1039:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1039), 16, 16)) -> intp(1, 3, 1)
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
thr3_hw_intr_1040:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1040), 16, 16)) -> intp(2, 0, 1)
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
thr3_hw_intr_1041:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1041), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r29
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
thr3_nuke_intr_1042:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1042), 16, 16)) -> intp(2, 2, 1)
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x8d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r6
	.word 0x98c420f5  ! 1: ADDCcc_I	addccc 	%r16, 0x00f5, %r12
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
thr3_resum_intr_1043:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1043), 16, 16)) -> intp(2, 3, 1)
	.word 0xa8ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0xba8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r29
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
thr3_hw_intr_1044:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1044), 16, 16)) -> intp(0, 0, 1)
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xb5341011  ! 1: SRLX_R	srlx	%r16, %r17, %r26
thr3_nuke_intr_1045:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1045), 16, 16)) -> intp(0, 2, 1)
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x873c0011  ! 1: SRA_R	sra 	%r16, %r17, %r3
	.word 0xa92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r20
thr3_resum_intr_1046:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1046), 16, 16)) -> intp(0, 3, 1)
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
	.word 0xa6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r19
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
thr3_hw_intr_1047:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1047), 16, 16)) -> intp(1, 0, 1)
	.word 0xb72c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0x892c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
	.word 0xb23c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r25
thr3_hw_intr_1048:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1048), 16, 16)) -> intp(1, 0, 1)
	.word 0x902c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r8
	.word 0xae8c2951  ! 1: ANDcc_I	andcc 	%r16, 0x0951, %r23
thr3_hw_intr_1049:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1049), 16, 16)) -> intp(0, 0, 1)
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
thr3_nuke_intr_1050:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1050), 16, 16)) -> intp(0, 2, 1)
	.word 0x917c2401  ! 1: MOVR_I	move	%r16, 0x1, %r8
	.word 0xa9342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0x888c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r4
thr3_resum_intr_1051:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1051), 16, 16)) -> intp(0, 3, 1)
	.word 0xa634203d  ! 1: ORN_I	orn 	%r16, 0x003d, %r19
	.word 0xb1340011  ! 1: SRL_R	srl 	%r16, %r17, %r24
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
	.word 0x92442502  ! 1: ADDC_I	addc 	%r16, 0x0502, %r9
thr3_nuke_intr_1052:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1052), 16, 16)) -> intp(2, 2, 1)
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0xae3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x87643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_1053:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1053), 16, 16)) -> intp(2, 3, 1)
	.word 0x963423b3  ! 1: ORN_I	orn 	%r16, 0x03b3, %r11
	.word 0x84c4229e  ! 1: ADDCcc_I	addccc 	%r16, 0x029e, %r2
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x89342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r4
thr3_nuke_intr_1054:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1054), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0xba840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0x93641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_1055:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1055), 16, 16)) -> intp(1, 3, 1)
	.word 0x98bc214e  ! 1: XNORcc_I	xnorcc 	%r16, 0x014e, %r12
	.word 0xb82c2a1a  ! 1: ANDN_I	andn 	%r16, 0x0a1a, %r28
thr3_hw_intr_1056:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1056), 16, 16)) -> intp(0, 0, 1)
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
thr3_nuke_intr_1057:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1057), 16, 16)) -> intp(2, 2, 1)
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
	.word 0x962c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r11
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
thr3_resum_intr_1058:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1058), 16, 16)) -> intp(2, 3, 1)
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
	.word 0xb29c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0xb12c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r24
thr3_hw_intr_1059:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1059), 16, 16)) -> intp(0, 0, 1)
	.word 0x96ac2a2a  ! 1: ANDNcc_I	andncc 	%r16, 0x0a2a, %r11
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
thr3_nuke_intr_1060:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1060), 16, 16)) -> intp(0, 2, 1)
	.word 0xb08c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0xa6c42bdc  ! 1: ADDCcc_I	addccc 	%r16, 0x0bdc, %r19
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
thr3_resum_intr_1061:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1061), 16, 16)) -> intp(0, 3, 1)
	.word 0x989c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r12
thr3_nuke_intr_1062:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1062), 16, 16)) -> intp(0, 2, 1)
	.word 0x992c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x86340011  ! 1: ORN_R	orn 	%r16, %r17, %r3
thr3_resum_intr_1063:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1063), 16, 16)) -> intp(0, 3, 1)
	.word 0xa7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x97643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_1064:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1064), 16, 16)) -> intp(2, 2, 1)
	.word 0xb00c291a  ! 1: AND_I	and 	%r16, 0x091a, %r24
	.word 0xaf2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r23
	.word 0xad7c2401  ! 1: MOVR_I	move	%r16, 0x1, %r22
	.word 0x840c0011  ! 1: AND_R	and 	%r16, %r17, %r2
thr3_resum_intr_1065:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1065), 16, 16)) -> intp(2, 3, 1)
	.word 0x86bc2ff9  ! 1: XNORcc_I	xnorcc 	%r16, 0x0ff9, %r3
thr3_hw_intr_1066:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1066), 16, 16)) -> intp(2, 0, 1)
	.word 0x8a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xb57c0411  ! 1: MOVR_R	move	%r16, %r17, %r26
	.word 0xa7641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_1067:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1067), 16, 16)) -> intp(0, 2, 1)
	.word 0xae9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
thr3_resum_intr_1068:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1068), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8bc28c0  ! 1: XNORcc_I	xnorcc 	%r16, 0x08c0, %r28
	.word 0xa7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r19
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
thr3_hw_intr_1069:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1069), 16, 16)) -> intp(0, 0, 1)
	.word 0x8a0c2a29  ! 1: AND_I	and 	%r16, 0x0a29, %r5
	.word 0xbac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0xac340011  ! 1: ORN_R	orn 	%r16, %r17, %r22
thr3_hw_intr_1070:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1070), 16, 16)) -> intp(2, 0, 1)
	.word 0x832c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r1
thr3_hw_intr_1071:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1071), 16, 16)) -> intp(0, 0, 1)
	.word 0x92942f75  ! 1: ORcc_I	orcc 	%r16, 0x0f75, %r9
	.word 0x922c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r9
	.word 0xaa1c23d9  ! 1: XOR_I	xor 	%r16, 0x03d9, %r21
thr3_nuke_intr_1072:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1072), 16, 16)) -> intp(1, 2, 1)
	.word 0x99643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
thr3_resum_intr_1073:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1073), 16, 16)) -> intp(1, 3, 1)
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0xb88421d4  ! 1: ADDcc_I	addcc 	%r16, 0x01d4, %r28
	.word 0xa8842a31  ! 1: ADDcc_I	addcc 	%r16, 0x0a31, %r20
thr3_nuke_intr_1074:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1074), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x842c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x92bc237e  ! 1: XNORcc_I	xnorcc 	%r16, 0x037e, %r9
thr3_resum_intr_1075:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1075), 16, 16)) -> intp(1, 3, 1)
	.word 0x87643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8a040011  ! 1: ADD_R	add 	%r16, %r17, %r5
	.word 0x883420ff  ! 1: ORN_I	orn 	%r16, 0x00ff, %r4
	.word 0x88042449  ! 1: ADD_I	add 	%r16, 0x0449, %r4
thr3_hw_intr_1076:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1076), 16, 16)) -> intp(2, 0, 1)
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
	.word 0x912c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0xbb2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0x883420ef  ! 1: ORN_I	orn 	%r16, 0x00ef, %r4
thr3_hw_intr_1077:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1077), 16, 16)) -> intp(0, 0, 1)
	.word 0xa68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0x97643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xad641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_1078:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1078), 16, 16)) -> intp(1, 2, 1)
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
thr3_resum_intr_1079:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1079), 16, 16)) -> intp(1, 3, 1)
	.word 0xb7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x892c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0x92ac23da  ! 1: ANDNcc_I	andncc 	%r16, 0x03da, %r9
thr3_hw_intr_1080:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1080), 16, 16)) -> intp(0, 0, 1)
	.word 0x9aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r13
thr3_hw_intr_1081:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1081), 16, 16)) -> intp(0, 0, 1)
	.word 0x8b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r5
thr3_hw_intr_1082:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1082), 16, 16)) -> intp(1, 0, 1)
	.word 0x94340011  ! 1: ORN_R	orn 	%r16, %r17, %r10
thr3_nuke_intr_1083:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1083), 16, 16)) -> intp(1, 2, 1)
	.word 0x84840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r2
thr3_resum_intr_1084:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1084), 16, 16)) -> intp(1, 3, 1)
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
thr3_nuke_intr_1085:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1085), 16, 16)) -> intp(0, 2, 1)
	.word 0x9e3420f9  ! 1: ORN_I	orn 	%r16, 0x00f9, %r15
	.word 0xac942ff9  ! 1: ORcc_I	orcc 	%r16, 0x0ff9, %r22
	.word 0x981c0011  ! 1: XOR_R	xor 	%r16, %r17, %r12
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
thr3_resum_intr_1086:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1086), 16, 16)) -> intp(0, 3, 1)
	.word 0xb88c2905  ! 1: ANDcc_I	andcc 	%r16, 0x0905, %r28
	.word 0xba2c20ab  ! 1: ANDN_I	andn 	%r16, 0x00ab, %r29
	.word 0xba842d8e  ! 1: ADDcc_I	addcc 	%r16, 0x0d8e, %r29
	.word 0x84142ca5  ! 1: OR_I	or 	%r16, 0x0ca5, %r2
thr3_hw_intr_1087:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1087), 16, 16)) -> intp(0, 0, 1)
	.word 0xbab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x8a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r5
thr3_hw_intr_1088:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1088), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c1c2f05  ! 1: XOR_I	xor 	%r16, 0x0f05, %r6
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
	.word 0x92842a09  ! 1: ADDcc_I	addcc 	%r16, 0x0a09, %r9
thr3_hw_intr_1089:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1089), 16, 16)) -> intp(0, 0, 1)
	.word 0x98b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x89341011  ! 1: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x912c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0xac2c231e  ! 1: ANDN_I	andn 	%r16, 0x031e, %r22
thr3_hw_intr_1090:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1090), 16, 16)) -> intp(0, 0, 1)
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0xae340011  ! 1: ORN_R	orn 	%r16, %r17, %r23
	.word 0x922c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r9
	.word 0x82b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r1
thr3_nuke_intr_1091:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1091), 16, 16)) -> intp(0, 2, 1)
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
	.word 0xb2042b0f  ! 1: ADD_I	add 	%r16, 0x0b0f, %r25
	.word 0xb08c247a  ! 1: ANDcc_I	andcc 	%r16, 0x047a, %r24
thr3_resum_intr_1092:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1092), 16, 16)) -> intp(0, 3, 1)
	.word 0x9a140011  ! 1: OR_R	or 	%r16, %r17, %r13
thr3_hw_intr_1093:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1093), 16, 16)) -> intp(0, 0, 1)
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
thr3_nuke_intr_1094:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1094), 16, 16)) -> intp(0, 2, 1)
	.word 0xa61c22c0  ! 1: XOR_I	xor 	%r16, 0x02c0, %r19
	.word 0x83341011  ! 1: SRLX_R	srlx	%r16, %r17, %r1
	.word 0xb60c219f  ! 1: AND_I	and 	%r16, 0x019f, %r27
thr3_resum_intr_1095:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1095), 16, 16)) -> intp(0, 3, 1)
	.word 0xa61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r19
	.word 0xa68c2bb1  ! 1: ANDcc_I	andcc 	%r16, 0x0bb1, %r19
	.word 0xa83c2f53  ! 1: XNOR_I	xnor 	%r16, 0x0f53, %r20
	.word 0x8c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r6
thr3_hw_intr_1096:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1096), 16, 16)) -> intp(2, 0, 1)
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
	.word 0x86bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x88b42c7a  ! 1: ORNcc_I	orncc 	%r16, 0x0c7a, %r4
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
thr3_hw_intr_1097:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1097), 16, 16)) -> intp(0, 0, 1)
	.word 0x8e842542  ! 1: ADDcc_I	addcc 	%r16, 0x0542, %r7
	.word 0xbb342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r29
thr3_nuke_intr_1098:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1098), 16, 16)) -> intp(0, 2, 1)
	.word 0x833c1011  ! 1: SRAX_R	srax	%r16, %r17, %r1
thr3_resum_intr_1099:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1099), 16, 16)) -> intp(0, 3, 1)
	.word 0x83641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb0942c49  ! 1: ORcc_I	orcc 	%r16, 0x0c49, %r24
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
thr3_nuke_intr_1100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1100), 16, 16)) -> intp(0, 2, 1)
	.word 0xad3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r22
	.word 0x8c2c2444  ! 1: ANDN_I	andn 	%r16, 0x0444, %r6
thr3_resum_intr_1101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1101), 16, 16)) -> intp(0, 3, 1)
	.word 0xac3c2865  ! 1: XNOR_I	xnor 	%r16, 0x0865, %r22
	.word 0xad7c2401  ! 1: MOVR_I	move	%r16, 0x865, %r22
	.word 0x869c29e7  ! 1: XORcc_I	xorcc 	%r16, 0x09e7, %r3
thr3_nuke_intr_1102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1102), 16, 16)) -> intp(2, 2, 1)
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x93341011  ! 1: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x8804255f  ! 1: ADD_I	add 	%r16, 0x055f, %r4
thr3_resum_intr_1103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1103), 16, 16)) -> intp(2, 3, 1)
	.word 0xab340011  ! 1: SRL_R	srl 	%r16, %r17, %r21
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
	.word 0xa92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r20
thr3_nuke_intr_1104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1104), 16, 16)) -> intp(0, 2, 1)
	.word 0x952c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x9b7c0411  ! 1: MOVR_R	move	%r16, %r17, %r13
	.word 0xb0442cc1  ! 1: ADDC_I	addc 	%r16, 0x0cc1, %r24
	.word 0x9c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r14
thr3_resum_intr_1105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1105), 16, 16)) -> intp(0, 3, 1)
	.word 0x83342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x9d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x8b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x8c3c2cba  ! 1: XNOR_I	xnor 	%r16, 0x0cba, %r6
thr3_nuke_intr_1106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1106), 16, 16)) -> intp(2, 2, 1)
	.word 0x96ac29b3  ! 1: ANDNcc_I	andncc 	%r16, 0x09b3, %r11
	.word 0x92940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x969c2f96  ! 1: XORcc_I	xorcc 	%r16, 0x0f96, %r11
	.word 0x952c0011  ! 1: SLL_R	sll 	%r16, %r17, %r10
thr3_resum_intr_1107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1107), 16, 16)) -> intp(2, 3, 1)
	.word 0x90042704  ! 1: ADD_I	add 	%r16, 0x0704, %r8
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x95641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xba1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r29
thr3_hw_intr_1108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1108), 16, 16)) -> intp(1, 0, 1)
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
	.word 0x8b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r5
	.word 0x96bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
thr3_nuke_intr_1109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1109), 16, 16)) -> intp(2, 2, 1)
	.word 0x842c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x923c248d  ! 1: XNOR_I	xnor 	%r16, 0x048d, %r9
thr3_resum_intr_1110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1110), 16, 16)) -> intp(2, 3, 1)
	.word 0x900c0011  ! 1: AND_R	and 	%r16, %r17, %r8
	.word 0xaf7c0411  ! 1: MOVR_R	move	%r16, %r17, %r23
	.word 0x9a0c2c89  ! 1: AND_I	and 	%r16, 0x0c89, %r13
	.word 0x85340011  ! 1: SRL_R	srl 	%r16, %r17, %r2
thr3_nuke_intr_1111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1111), 16, 16)) -> intp(1, 2, 1)
	.word 0x880c0011  ! 1: AND_R	and 	%r16, %r17, %r4
	.word 0xa60c0011  ! 1: AND_R	and 	%r16, %r17, %r19
thr3_resum_intr_1112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1112), 16, 16)) -> intp(1, 3, 1)
	.word 0xa92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r20
	.word 0x989c27b4  ! 1: XORcc_I	xorcc 	%r16, 0x07b4, %r12
	.word 0x88342458  ! 1: ORN_I	orn 	%r16, 0x0458, %r4
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
thr3_hw_intr_1113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1113), 16, 16)) -> intp(2, 0, 1)
	.word 0xae4427db  ! 1: ADDC_I	addc 	%r16, 0x07db, %r23
thr3_hw_intr_1114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1114), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x8c04220b  ! 1: ADD_I	add 	%r16, 0x020b, %r6
thr3_nuke_intr_1115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1115), 16, 16)) -> intp(2, 2, 1)
	.word 0x94c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x8e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r7
	.word 0xb83c2ec2  ! 1: XNOR_I	xnor 	%r16, 0x0ec2, %r28
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
thr3_resum_intr_1116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1116), 16, 16)) -> intp(2, 3, 1)
	.word 0xad342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0xac3c2c85  ! 1: XNOR_I	xnor 	%r16, 0x0c85, %r22
thr3_nuke_intr_1117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1117), 16, 16)) -> intp(1, 2, 1)
	.word 0x84942ab0  ! 1: ORcc_I	orcc 	%r16, 0x0ab0, %r2
thr3_resum_intr_1118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1118), 16, 16)) -> intp(1, 3, 1)
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xa7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r19
	.word 0x92bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x86040011  ! 1: ADD_R	add 	%r16, %r17, %r3
thr3_hw_intr_1119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1119), 16, 16)) -> intp(0, 0, 1)
	.word 0x937c0411  ! 1: MOVR_R	move	%r16, %r17, %r9
	.word 0xa8b42f49  ! 1: ORNcc_I	orncc 	%r16, 0x0f49, %r20
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
thr3_hw_intr_1120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1120), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x9a3c2e80  ! 1: XNOR_I	xnor 	%r16, 0x0e80, %r13
thr3_nuke_intr_1121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1121), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a8c29de  ! 1: ANDcc_I	andcc 	%r16, 0x09de, %r5
thr3_resum_intr_1122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1122), 16, 16)) -> intp(1, 3, 1)
	.word 0xba040011  ! 1: ADD_R	add 	%r16, %r17, %r29
	.word 0x941c0011  ! 1: XOR_R	xor 	%r16, %r17, %r10
	.word 0x86b42da5  ! 1: ORNcc_I	orncc 	%r16, 0x0da5, %r3
thr3_nuke_intr_1123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1123), 16, 16)) -> intp(1, 2, 1)
	.word 0xab643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_1124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1124), 16, 16)) -> intp(1, 3, 1)
	.word 0xb8940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r28
thr3_hw_intr_1125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1125), 16, 16)) -> intp(0, 0, 1)
	.word 0xb13c0011  ! 1: SRA_R	sra 	%r16, %r17, %r24
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x8b7c2401  ! 1: MOVR_I	move	%r16, 0x1, %r5
thr3_hw_intr_1126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1126), 16, 16)) -> intp(2, 0, 1)
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0x1, %r7
	.word 0xa8ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0x888c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r4
thr3_hw_intr_1127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1127), 16, 16)) -> intp(0, 0, 1)
	.word 0x883c28e4  ! 1: XNOR_I	xnor 	%r16, 0x08e4, %r4
	.word 0x9c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x9c4423a6  ! 1: ADDC_I	addc 	%r16, 0x03a6, %r14
	.word 0x932c0011  ! 1: SLL_R	sll 	%r16, %r17, %r9
thr3_hw_intr_1128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1128), 16, 16)) -> intp(2, 0, 1)
	.word 0x8a342064  ! 1: ORN_I	orn 	%r16, 0x0064, %r5
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x8c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0x8c142dba  ! 1: OR_I	or 	%r16, 0x0dba, %r6
thr3_hw_intr_1129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1129), 16, 16)) -> intp(0, 0, 1)
	.word 0xa92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0x96142ca9  ! 1: OR_I	or 	%r16, 0x0ca9, %r11
	.word 0x941c22c6  ! 1: XOR_I	xor 	%r16, 0x02c6, %r10
thr3_nuke_intr_1130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1130), 16, 16)) -> intp(0, 2, 1)
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x98440011  ! 1: ADDC_R	addc 	%r16, %r17, %r12
	.word 0xb40c21a4  ! 1: AND_I	and 	%r16, 0x01a4, %r26
thr3_resum_intr_1131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1131), 16, 16)) -> intp(0, 3, 1)
	.word 0x9644224f  ! 1: ADDC_I	addc 	%r16, 0x024f, %r11
	.word 0x8e140011  ! 1: OR_R	or 	%r16, %r17, %r7
	.word 0x8a9c299d  ! 1: XORcc_I	xorcc 	%r16, 0x099d, %r5
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
thr3_nuke_intr_1132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1132), 16, 16)) -> intp(1, 2, 1)
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0xb6bc206c  ! 1: XNORcc_I	xnorcc 	%r16, 0x006c, %r27
	.word 0x921c262a  ! 1: XOR_I	xor 	%r16, 0x062a, %r9
thr3_resum_intr_1133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1133), 16, 16)) -> intp(1, 3, 1)
	.word 0x917c2401  ! 1: MOVR_I	move	%r16, 0xfffffe2a, %r8
	.word 0xaf3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r23
	.word 0xa93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r20
thr3_hw_intr_1134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1134), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a142ef2  ! 1: OR_I	or 	%r16, 0x0ef2, %r13
	.word 0xb9340011  ! 1: SRL_R	srl 	%r16, %r17, %r28
	.word 0x9e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0xaec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r23
thr3_hw_intr_1135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1135), 16, 16)) -> intp(2, 0, 1)
	.word 0xae2c2cb0  ! 1: ANDN_I	andn 	%r16, 0x0cb0, %r23
thr3_nuke_intr_1136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1136), 16, 16)) -> intp(2, 2, 1)
	.word 0x8b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0xab3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r21
	.word 0xae140011  ! 1: OR_R	or 	%r16, %r17, %r23
thr3_resum_intr_1137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1137), 16, 16)) -> intp(2, 3, 1)
	.word 0xb4840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r26
thr3_hw_intr_1138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1138), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c342b01  ! 1: ORN_I	orn 	%r16, 0x0b01, %r14
	.word 0xb6140011  ! 1: OR_R	or 	%r16, %r17, %r27
	.word 0xbaac2d37  ! 1: ANDNcc_I	andncc 	%r16, 0x0d37, %r29
	.word 0xaa0c2dc4  ! 1: AND_I	and 	%r16, 0x0dc4, %r21
thr3_hw_intr_1139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1139), 16, 16)) -> intp(1, 0, 1)
	.word 0xb49c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0x828c202a  ! 1: ANDcc_I	andcc 	%r16, 0x002a, %r1
	.word 0x8c142e91  ! 1: OR_I	or 	%r16, 0x0e91, %r6
thr3_hw_intr_1140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1140), 16, 16)) -> intp(0, 0, 1)
	.word 0x897c2401  ! 1: MOVR_I	move	%r16, 0xfffffe91, %r4
thr3_hw_intr_1141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1141), 16, 16)) -> intp(2, 0, 1)
	.word 0xb08c27d4  ! 1: ANDcc_I	andcc 	%r16, 0x07d4, %r24
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0xae2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r23
	.word 0x969c2e25  ! 1: XORcc_I	xorcc 	%r16, 0x0e25, %r11
thr3_hw_intr_1142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1142), 16, 16)) -> intp(2, 0, 1)
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
	.word 0x9abc29b0  ! 1: XNORcc_I	xnorcc 	%r16, 0x09b0, %r13
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
thr3_nuke_intr_1143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1143), 16, 16)) -> intp(0, 2, 1)
	.word 0x9cb4291a  ! 1: ORNcc_I	orncc 	%r16, 0x091a, %r14
	.word 0x9b7c0411  ! 1: MOVR_R	move	%r16, %r17, %r13
	.word 0x8a2c24f8  ! 1: ANDN_I	andn 	%r16, 0x04f8, %r5
thr3_resum_intr_1144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1144), 16, 16)) -> intp(0, 3, 1)
	.word 0x948c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x961c2f9f  ! 1: XOR_I	xor 	%r16, 0x0f9f, %r11
thr3_nuke_intr_1145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1145), 16, 16)) -> intp(1, 2, 1)
	.word 0x869c267a  ! 1: XORcc_I	xorcc 	%r16, 0x067a, %r3
	.word 0x960c22e7  ! 1: AND_I	and 	%r16, 0x02e7, %r11
thr3_resum_intr_1146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1146), 16, 16)) -> intp(1, 3, 1)
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0xae2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r23
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
thr3_nuke_intr_1147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1147), 16, 16)) -> intp(0, 2, 1)
	.word 0x98c424f6  ! 1: ADDCcc_I	addccc 	%r16, 0x04f6, %r12
	.word 0x8e3422b1  ! 1: ORN_I	orn 	%r16, 0x02b1, %r7
	.word 0x923c2bda  ! 1: XNOR_I	xnor 	%r16, 0x0bda, %r9
thr3_resum_intr_1148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1148), 16, 16)) -> intp(0, 3, 1)
	.word 0xb4ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r26
thr3_nuke_intr_1149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1149), 16, 16)) -> intp(0, 2, 1)
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0xb22c2b9f  ! 1: ANDN_I	andn 	%r16, 0x0b9f, %r25
	.word 0x981c0011  ! 1: XOR_R	xor 	%r16, %r17, %r12
	.word 0x9c842584  ! 1: ADDcc_I	addcc 	%r16, 0x0584, %r14
thr3_resum_intr_1150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1150), 16, 16)) -> intp(0, 3, 1)
	.word 0x9e340011  ! 1: ORN_R	orn 	%r16, %r17, %r15
thr3_hw_intr_1151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1151), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x901c2e63  ! 1: XOR_I	xor 	%r16, 0x0e63, %r8
thr3_nuke_intr_1152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1152), 16, 16)) -> intp(2, 2, 1)
	.word 0xa9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0xaa8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r21
thr3_resum_intr_1153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1153), 16, 16)) -> intp(2, 3, 1)
	.word 0x82ac2167  ! 1: ANDNcc_I	andncc 	%r16, 0x0167, %r1
thr3_nuke_intr_1154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1154), 16, 16)) -> intp(2, 2, 1)
	.word 0x9f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x82c42718  ! 1: ADDCcc_I	addccc 	%r16, 0x0718, %r1
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
thr3_resum_intr_1155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1155), 16, 16)) -> intp(2, 3, 1)
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
	.word 0x9b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r13
thr3_hw_intr_1156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1156), 16, 16)) -> intp(1, 0, 1)
	.word 0x98140011  ! 1: OR_R	or 	%r16, %r17, %r12
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
thr3_nuke_intr_1157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1157), 16, 16)) -> intp(0, 2, 1)
	.word 0x90040011  ! 1: ADD_R	add 	%r16, %r17, %r8
thr3_resum_intr_1158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1158), 16, 16)) -> intp(0, 3, 1)
	.word 0x8c040011  ! 1: ADD_R	add 	%r16, %r17, %r6
	.word 0xa93c0011  ! 1: SRA_R	sra 	%r16, %r17, %r20
thr3_nuke_intr_1159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1159), 16, 16)) -> intp(1, 2, 1)
	.word 0x94140011  ! 1: OR_R	or 	%r16, %r17, %r10
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
	.word 0x86440011  ! 1: ADDC_R	addc 	%r16, %r17, %r3
thr3_resum_intr_1160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1160), 16, 16)) -> intp(1, 3, 1)
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_1161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1161), 16, 16)) -> intp(0, 2, 1)
	.word 0xb2bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xa8040011  ! 1: ADD_R	add 	%r16, %r17, %r20
	.word 0xaf343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r23
thr3_resum_intr_1162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1162), 16, 16)) -> intp(0, 3, 1)
	.word 0x981c0011  ! 1: XOR_R	xor 	%r16, %r17, %r12
	.word 0x8d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r6
	.word 0x912c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
thr3_hw_intr_1163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1163), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0x8c340011  ! 1: ORN_R	orn 	%r16, %r17, %r6
	.word 0x823c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r1
thr3_nuke_intr_1164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1164), 16, 16)) -> intp(0, 2, 1)
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
	.word 0x8e042dc2  ! 1: ADD_I	add 	%r16, 0x0dc2, %r7
thr3_resum_intr_1165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1165), 16, 16)) -> intp(0, 3, 1)
	.word 0x97643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb9342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0xb6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0x8a040011  ! 1: ADD_R	add 	%r16, %r17, %r5
thr3_nuke_intr_1166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1166), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0xaa9c2ac1  ! 1: XORcc_I	xorcc 	%r16, 0x0ac1, %r21
	.word 0x95643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_1167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1167), 16, 16)) -> intp(2, 3, 1)
	.word 0xae040011  ! 1: ADD_R	add 	%r16, %r17, %r23
	.word 0xa93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r20
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
	.word 0xae842031  ! 1: ADDcc_I	addcc 	%r16, 0x0031, %r23
thr3_nuke_intr_1168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1168), 16, 16)) -> intp(0, 2, 1)
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
thr3_resum_intr_1169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1169), 16, 16)) -> intp(0, 3, 1)
	.word 0x98040011  ! 1: ADD_R	add 	%r16, %r17, %r12
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
	.word 0x90ac2971  ! 1: ANDNcc_I	andncc 	%r16, 0x0971, %r8
	.word 0xba1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r29
thr3_nuke_intr_1170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1170), 16, 16)) -> intp(2, 2, 1)
	.word 0xb0940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0x94142a11  ! 1: OR_I	or 	%r16, 0x0a11, %r10
	.word 0xb61422d3  ! 1: OR_I	or 	%r16, 0x02d3, %r27
	.word 0xacb422c7  ! 1: ORNcc_I	orncc 	%r16, 0x02c7, %r22
thr3_resum_intr_1171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1171), 16, 16)) -> intp(2, 3, 1)
	.word 0x85341011  ! 1: SRLX_R	srlx	%r16, %r17, %r2
	.word 0xbb3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0x9c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r14
thr3_nuke_intr_1172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1172), 16, 16)) -> intp(2, 2, 1)
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x99643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_1173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1173), 16, 16)) -> intp(2, 3, 1)
	.word 0xb5341011  ! 1: SRLX_R	srlx	%r16, %r17, %r26
thr3_hw_intr_1174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1174), 16, 16)) -> intp(1, 0, 1)
	.word 0xa72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r19
thr3_hw_intr_1175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1175), 16, 16)) -> intp(0, 0, 1)
	.word 0x993c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r12
thr3_nuke_intr_1176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1176), 16, 16)) -> intp(1, 2, 1)
	.word 0x920420f3  ! 1: ADD_I	add 	%r16, 0x00f3, %r9
thr3_resum_intr_1177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1177), 16, 16)) -> intp(1, 3, 1)
	.word 0xa7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0xab2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
thr3_hw_intr_1178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1178), 16, 16)) -> intp(1, 0, 1)
	.word 0xaf2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r23
	.word 0xa77c0411  ! 1: MOVR_R	move	%r16, %r17, %r19
thr3_nuke_intr_1179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1179), 16, 16)) -> intp(0, 2, 1)
	.word 0xb09c2be1  ! 1: XORcc_I	xorcc 	%r16, 0x0be1, %r24
	.word 0x8d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r6
	.word 0x9cc40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0xb88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r28
thr3_resum_intr_1180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1180), 16, 16)) -> intp(0, 3, 1)
	.word 0x94842004  ! 1: ADDcc_I	addcc 	%r16, 0x0004, %r10
	.word 0xa60426cb  ! 1: ADD_I	add 	%r16, 0x06cb, %r19
	.word 0xba9422da  ! 1: ORcc_I	orcc 	%r16, 0x02da, %r29
	.word 0xb0842c93  ! 1: ADDcc_I	addcc 	%r16, 0x0c93, %r24
thr3_nuke_intr_1181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1181), 16, 16)) -> intp(1, 2, 1)
	.word 0x943c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x8c2c219c  ! 1: ANDN_I	andn 	%r16, 0x019c, %r6
thr3_resum_intr_1182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1182), 16, 16)) -> intp(1, 3, 1)
	.word 0x90c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x9a9c2234  ! 1: XORcc_I	xorcc 	%r16, 0x0234, %r13
	.word 0xad341011  ! 1: SRLX_R	srlx	%r16, %r17, %r22
thr3_nuke_intr_1183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1183), 16, 16)) -> intp(0, 2, 1)
	.word 0xba442503  ! 1: ADDC_I	addc 	%r16, 0x0503, %r29
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
thr3_resum_intr_1184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1184), 16, 16)) -> intp(0, 3, 1)
	.word 0x8f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r7
thr3_hw_intr_1185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1185), 16, 16)) -> intp(2, 0, 1)
	.word 0x8d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r6
	.word 0xb68c28a5  ! 1: ANDcc_I	andcc 	%r16, 0x08a5, %r27
thr3_hw_intr_1186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1186), 16, 16)) -> intp(1, 0, 1)
	.word 0xac1c2335  ! 1: XOR_I	xor 	%r16, 0x0335, %r22
	.word 0xb81426e3  ! 1: OR_I	or 	%r16, 0x06e3, %r28
	.word 0x93342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r9
thr3_hw_intr_1187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1187), 16, 16)) -> intp(1, 0, 1)
	.word 0xab3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r21
	.word 0x8c2c2b88  ! 1: ANDN_I	andn 	%r16, 0x0b88, %r6
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
thr3_nuke_intr_1188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1188), 16, 16)) -> intp(2, 2, 1)
	.word 0xb7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xba0c2e38  ! 1: AND_I	and 	%r16, 0x0e38, %r29
thr3_resum_intr_1189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1189), 16, 16)) -> intp(2, 3, 1)
	.word 0x9f340011  ! 1: SRL_R	srl 	%r16, %r17, %r15
thr3_nuke_intr_1190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1190), 16, 16)) -> intp(2, 2, 1)
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x922c24d3  ! 1: ANDN_I	andn 	%r16, 0x04d3, %r9
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
thr3_resum_intr_1191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1191), 16, 16)) -> intp(2, 3, 1)
	.word 0xb8340011  ! 1: ORN_R	orn 	%r16, %r17, %r28
	.word 0xaebc2ca3  ! 1: XNORcc_I	xnorcc 	%r16, 0x0ca3, %r23
thr3_nuke_intr_1192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1192), 16, 16)) -> intp(1, 2, 1)
	.word 0xa80c2e43  ! 1: AND_I	and 	%r16, 0x0e43, %r20
	.word 0xa884237d  ! 1: ADDcc_I	addcc 	%r16, 0x037d, %r20
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
thr3_resum_intr_1193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1193), 16, 16)) -> intp(1, 3, 1)
	.word 0x98140011  ! 1: OR_R	or 	%r16, %r17, %r12
	.word 0x848c208a  ! 1: ANDcc_I	andcc 	%r16, 0x008a, %r2
thr3_nuke_intr_1194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1194), 16, 16)) -> intp(2, 2, 1)
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
thr3_resum_intr_1195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1195), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c9c2a21  ! 1: XORcc_I	xorcc 	%r16, 0x0a21, %r6
thr3_nuke_intr_1196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1196), 16, 16)) -> intp(1, 2, 1)
	.word 0x873c1011  ! 1: SRAX_R	srax	%r16, %r17, %r3
thr3_resum_intr_1197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1197), 16, 16)) -> intp(1, 3, 1)
	.word 0x857c0411  ! 1: MOVR_R	move	%r16, %r17, %r2
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
thr3_nuke_intr_1198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1198), 16, 16)) -> intp(0, 2, 1)
	.word 0x880c0011  ! 1: AND_R	and 	%r16, %r17, %r4
	.word 0xa77c0411  ! 1: MOVR_R	move	%r16, %r17, %r19
thr3_resum_intr_1199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1199), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
	.word 0xbac42cc0  ! 1: ADDCcc_I	addccc 	%r16, 0x0cc0, %r29
	.word 0x8f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r7
thr3_hw_intr_1200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1200), 16, 16)) -> intp(1, 0, 1)
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x9a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r13
thr3_hw_intr_1201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1201), 16, 16)) -> intp(1, 0, 1)
	.word 0x90140011  ! 1: OR_R	or 	%r16, %r17, %r8
thr3_hw_intr_1202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1202), 16, 16)) -> intp(1, 0, 1)
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
	.word 0x8284284a  ! 1: ADDcc_I	addcc 	%r16, 0x084a, %r1
thr3_hw_intr_1203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1203), 16, 16)) -> intp(1, 0, 1)
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x98442f41  ! 1: ADDC_I	addc 	%r16, 0x0f41, %r12
thr3_nuke_intr_1204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1204), 16, 16)) -> intp(2, 2, 1)
	.word 0xa62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r19
	.word 0xb1341011  ! 1: SRLX_R	srlx	%r16, %r17, %r24
	.word 0xa8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x96b42f4e  ! 1: ORNcc_I	orncc 	%r16, 0x0f4e, %r11
thr3_resum_intr_1205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1205), 16, 16)) -> intp(2, 3, 1)
	.word 0x872c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r3
	.word 0xb72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r27
thr3_hw_intr_1206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1206), 16, 16)) -> intp(0, 0, 1)
	.word 0x862c2ef0  ! 1: ANDN_I	andn 	%r16, 0x0ef0, %r3
	.word 0xb83c239f  ! 1: XNOR_I	xnor 	%r16, 0x039f, %r28
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
thr3_nuke_intr_1207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1207), 16, 16)) -> intp(1, 2, 1)
	.word 0x98c42b4d  ! 1: ADDCcc_I	addccc 	%r16, 0x0b4d, %r12
	.word 0x929c2b82  ! 1: XORcc_I	xorcc 	%r16, 0x0b82, %r9
thr3_resum_intr_1208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1208), 16, 16)) -> intp(1, 3, 1)
	.word 0x862c2d5d  ! 1: ANDN_I	andn 	%r16, 0x0d5d, %r3
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x9cc42dc3  ! 1: ADDCcc_I	addccc 	%r16, 0x0dc3, %r14
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
thr3_nuke_intr_1209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1209), 16, 16)) -> intp(2, 2, 1)
	.word 0x8204277f  ! 1: ADD_I	add 	%r16, 0x077f, %r1
	.word 0xaa94200a  ! 1: ORcc_I	orcc 	%r16, 0x000a, %r21
thr3_resum_intr_1210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1210), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a340011  ! 1: ORN_R	orn 	%r16, %r17, %r5
	.word 0x91342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r8
thr3_nuke_intr_1211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1211), 16, 16)) -> intp(1, 2, 1)
	.word 0x96340011  ! 1: ORN_R	orn 	%r16, %r17, %r11
	.word 0x8d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r6
thr3_resum_intr_1212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1212), 16, 16)) -> intp(1, 3, 1)
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0xba940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0xaa9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r21
thr3_hw_intr_1213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1213), 16, 16)) -> intp(2, 0, 1)
	.word 0x9a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x8c3c248e  ! 1: XNOR_I	xnor 	%r16, 0x048e, %r6
thr3_hw_intr_1214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1214), 16, 16)) -> intp(1, 0, 1)
	.word 0x857c0411  ! 1: MOVR_R	move	%r16, %r17, %r2
thr3_nuke_intr_1215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1215), 16, 16)) -> intp(0, 2, 1)
	.word 0x88ac2662  ! 1: ANDNcc_I	andncc 	%r16, 0x0662, %r4
thr3_resum_intr_1216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1216), 16, 16)) -> intp(0, 3, 1)
	.word 0x9b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r13
	.word 0xb49c241b  ! 1: XORcc_I	xorcc 	%r16, 0x041b, %r26
	.word 0xa6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0x8c0c2fc0  ! 1: AND_I	and 	%r16, 0x0fc0, %r6
thr3_nuke_intr_1217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1217), 16, 16)) -> intp(0, 2, 1)
	.word 0x82042f86  ! 1: ADD_I	add 	%r16, 0x0f86, %r1
thr3_resum_intr_1218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1218), 16, 16)) -> intp(0, 3, 1)
	.word 0xacac2dd2  ! 1: ANDNcc_I	andncc 	%r16, 0x0dd2, %r22
	.word 0x9f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x9a340011  ! 1: ORN_R	orn 	%r16, %r17, %r13
	.word 0x980c21e6  ! 1: AND_I	and 	%r16, 0x01e6, %r12
thr3_hw_intr_1219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1219), 16, 16)) -> intp(2, 0, 1)
	.word 0xb08c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0xb4ac2043  ! 1: ANDNcc_I	andncc 	%r16, 0x0043, %r26
thr3_hw_intr_1220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1220), 16, 16)) -> intp(2, 0, 1)
	.word 0xb2ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0x872c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x84442e7b  ! 1: ADDC_I	addc 	%r16, 0x0e7b, %r2
	.word 0xad7c2401  ! 1: MOVR_I	move	%r16, 0xfffffe7b, %r22
thr3_hw_intr_1221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1221), 16, 16)) -> intp(1, 0, 1)
	.word 0xba042da1  ! 1: ADD_I	add 	%r16, 0x0da1, %r29
	.word 0x882c2164  ! 1: ANDN_I	andn 	%r16, 0x0164, %r4
	.word 0x888429bf  ! 1: ADDcc_I	addcc 	%r16, 0x09bf, %r4
thr3_nuke_intr_1222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1222), 16, 16)) -> intp(1, 2, 1)
	.word 0xb4440011  ! 1: ADDC_R	addc 	%r16, %r17, %r26
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0x9a8c232f  ! 1: ANDcc_I	andcc 	%r16, 0x032f, %r13
thr3_resum_intr_1223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1223), 16, 16)) -> intp(1, 3, 1)
	.word 0x929c2992  ! 1: XORcc_I	xorcc 	%r16, 0x0992, %r9
	.word 0xa6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0x8e140011  ! 1: OR_R	or 	%r16, %r17, %r7
thr3_nuke_intr_1224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1224), 16, 16)) -> intp(2, 2, 1)
	.word 0xad2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r22
thr3_resum_intr_1225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1225), 16, 16)) -> intp(2, 3, 1)
	.word 0x892c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r4
thr3_hw_intr_1226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1226), 16, 16)) -> intp(1, 0, 1)
	.word 0x99341011  ! 1: SRLX_R	srlx	%r16, %r17, %r12
	.word 0xa8040011  ! 1: ADD_R	add 	%r16, %r17, %r20
	.word 0xa88c211c  ! 1: ANDcc_I	andcc 	%r16, 0x011c, %r20
thr3_nuke_intr_1227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1227), 16, 16)) -> intp(0, 2, 1)
	.word 0x8eac2c54  ! 1: ANDNcc_I	andncc 	%r16, 0x0c54, %r7
	.word 0x82ac21e2  ! 1: ANDNcc_I	andncc 	%r16, 0x01e2, %r1
thr3_resum_intr_1228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1228), 16, 16)) -> intp(0, 3, 1)
	.word 0x86c42cce  ! 1: ADDCcc_I	addccc 	%r16, 0x0cce, %r3
	.word 0x8604224e  ! 1: ADD_I	add 	%r16, 0x024e, %r3
thr3_hw_intr_1229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1229), 16, 16)) -> intp(2, 0, 1)
	.word 0x8d641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_1230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1230), 16, 16)) -> intp(1, 2, 1)
	.word 0x82142bfb  ! 1: OR_I	or 	%r16, 0x0bfb, %r1
	.word 0xa89c2e9e  ! 1: XORcc_I	xorcc 	%r16, 0x0e9e, %r20
	.word 0x832c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x90c42c8d  ! 1: ADDCcc_I	addccc 	%r16, 0x0c8d, %r8
thr3_resum_intr_1231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1231), 16, 16)) -> intp(1, 3, 1)
	.word 0x8cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0xb8040011  ! 1: ADD_R	add 	%r16, %r17, %r28
thr3_nuke_intr_1232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1232), 16, 16)) -> intp(2, 2, 1)
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
thr3_resum_intr_1233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1233), 16, 16)) -> intp(2, 3, 1)
	.word 0xa804206b  ! 1: ADD_I	add 	%r16, 0x006b, %r20
thr3_nuke_intr_1234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1234), 16, 16)) -> intp(1, 2, 1)
	.word 0xb2c423ae  ! 1: ADDCcc_I	addccc 	%r16, 0x03ae, %r25
	.word 0x9c04267f  ! 1: ADD_I	add 	%r16, 0x067f, %r14
thr3_resum_intr_1235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1235), 16, 16)) -> intp(1, 3, 1)
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x903c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
thr3_hw_intr_1236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1236), 16, 16)) -> intp(2, 0, 1)
	.word 0x86840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0xae440011  ! 1: ADDC_R	addc 	%r16, %r17, %r23
	.word 0x940c201f  ! 1: AND_I	and 	%r16, 0x001f, %r10
thr3_nuke_intr_1237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1237), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r27
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x848c2f0e  ! 1: ANDcc_I	andcc 	%r16, 0x0f0e, %r2
thr3_resum_intr_1238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1238), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x9f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r15
thr3_hw_intr_1239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1239), 16, 16)) -> intp(2, 0, 1)
	.word 0xb08c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0x9a342056  ! 1: ORN_I	orn 	%r16, 0x0056, %r13
	.word 0x863c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r3
thr3_hw_intr_1240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1240), 16, 16)) -> intp(0, 0, 1)
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
thr3_nuke_intr_1241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1241), 16, 16)) -> intp(1, 2, 1)
	.word 0x981420a2  ! 1: OR_I	or 	%r16, 0x00a2, %r12
	.word 0x8c340011  ! 1: ORN_R	orn 	%r16, %r17, %r6
	.word 0x853c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0x83641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_1242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1242), 16, 16)) -> intp(1, 3, 1)
	.word 0xb61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r27
thr3_hw_intr_1243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1243), 16, 16)) -> intp(2, 0, 1)
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
thr3_nuke_intr_1244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1244), 16, 16)) -> intp(2, 2, 1)
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
	.word 0xb7643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_1245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1245), 16, 16)) -> intp(2, 3, 1)
	.word 0x9d7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r14
	.word 0x86440011  ! 1: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x8c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r6
thr3_nuke_intr_1246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1246), 16, 16)) -> intp(2, 2, 1)
	.word 0x923c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0xa8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x98440011  ! 1: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x82c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r1
thr3_resum_intr_1247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1247), 16, 16)) -> intp(2, 3, 1)
	.word 0xa9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r20
	.word 0xa6340011  ! 1: ORN_R	orn 	%r16, %r17, %r19
	.word 0xb53c1011  ! 1: SRAX_R	srax	%r16, %r17, %r26
	.word 0xb4940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r26
thr3_hw_intr_1248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1248), 16, 16)) -> intp(1, 0, 1)
	.word 0xb6ac2e26  ! 1: ANDNcc_I	andncc 	%r16, 0x0e26, %r27
	.word 0xb8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r28
	.word 0xaf2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r23
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
thr3_nuke_intr_1249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1249), 16, 16)) -> intp(2, 2, 1)
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
	.word 0x844420e6  ! 1: ADDC_I	addc 	%r16, 0x00e6, %r2
	.word 0x852c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r2
thr3_resum_intr_1250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1250), 16, 16)) -> intp(2, 3, 1)
	.word 0xad643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xac04209c  ! 1: ADD_I	add 	%r16, 0x009c, %r22
	.word 0x957c0411  ! 1: MOVR_R	move	%r16, %r17, %r10
	.word 0x8abc2e78  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e78, %r5
thr3_hw_intr_1251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1251), 16, 16)) -> intp(1, 0, 1)
	.word 0xb28c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r25
	.word 0x96442504  ! 1: ADDC_I	addc 	%r16, 0x0504, %r11
	.word 0x8f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x8a942bcb  ! 1: ORcc_I	orcc 	%r16, 0x0bcb, %r5
thr3_hw_intr_1252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1252), 16, 16)) -> intp(2, 0, 1)
	.word 0x85341011  ! 1: SRLX_R	srlx	%r16, %r17, %r2
	.word 0xae2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r23
thr3_nuke_intr_1253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1253), 16, 16)) -> intp(0, 2, 1)
	.word 0xa6340011  ! 1: ORN_R	orn 	%r16, %r17, %r19
	.word 0xb4ac2fa2  ! 1: ANDNcc_I	andncc 	%r16, 0x0fa2, %r26
	.word 0xac1420e9  ! 1: OR_I	or 	%r16, 0x00e9, %r22
	.word 0xae942fb0  ! 1: ORcc_I	orcc 	%r16, 0x0fb0, %r23
thr3_resum_intr_1254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1254), 16, 16)) -> intp(0, 3, 1)
	.word 0xacb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0x8f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x9eac2559  ! 1: ANDNcc_I	andncc 	%r16, 0x0559, %r15
thr3_hw_intr_1255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1255), 16, 16)) -> intp(1, 0, 1)
	.word 0x882c22e1  ! 1: ANDN_I	andn 	%r16, 0x02e1, %r4
thr3_hw_intr_1256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1256), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e0c2ca7  ! 1: AND_I	and 	%r16, 0x0ca7, %r7
thr3_nuke_intr_1257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1257), 16, 16)) -> intp(1, 2, 1)
	.word 0x921429ac  ! 1: OR_I	or 	%r16, 0x09ac, %r9
	.word 0x9b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x94440011  ! 1: ADDC_R	addc 	%r16, %r17, %r10
thr3_resum_intr_1258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1258), 16, 16)) -> intp(1, 3, 1)
	.word 0x957c2401  ! 1: MOVR_I	move	%r16, 0x11, %r10
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
	.word 0x909c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r8
thr3_nuke_intr_1259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1259), 16, 16)) -> intp(1, 2, 1)
	.word 0x9eb4228b  ! 1: ORNcc_I	orncc 	%r16, 0x028b, %r15
	.word 0x96c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x8b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r5
	.word 0x9c942e90  ! 1: ORcc_I	orcc 	%r16, 0x0e90, %r14
thr3_resum_intr_1260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1260), 16, 16)) -> intp(1, 3, 1)
	.word 0xa6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r19
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
thr3_hw_intr_1261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1261), 16, 16)) -> intp(2, 0, 1)
	.word 0xbb3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0x962c2401  ! 1: ANDN_I	andn 	%r16, 0x0401, %r11
thr3_hw_intr_1262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1262), 16, 16)) -> intp(2, 0, 1)
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
	.word 0x9ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x989c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r12
thr3_nuke_intr_1263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1263), 16, 16)) -> intp(1, 2, 1)
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
thr3_resum_intr_1264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1264), 16, 16)) -> intp(1, 3, 1)
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
thr3_nuke_intr_1265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1265), 16, 16)) -> intp(1, 2, 1)
	.word 0x904429bd  ! 1: ADDC_I	addc 	%r16, 0x09bd, %r8
	.word 0x9a042f6c  ! 1: ADD_I	add 	%r16, 0x0f6c, %r13
	.word 0x9c9c2c79  ! 1: XORcc_I	xorcc 	%r16, 0x0c79, %r14
thr3_resum_intr_1266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1266), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c0c0011  ! 1: AND_R	and 	%r16, %r17, %r6
	.word 0x921c269c  ! 1: XOR_I	xor 	%r16, 0x069c, %r9
	.word 0xb6bc2e8b  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e8b, %r27
thr3_hw_intr_1267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1267), 16, 16)) -> intp(2, 0, 1)
	.word 0x862c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r3
	.word 0xaa040011  ! 1: ADD_R	add 	%r16, %r17, %r21
	.word 0x822c2135  ! 1: ANDN_I	andn 	%r16, 0x0135, %r1
thr3_nuke_intr_1268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1268), 16, 16)) -> intp(0, 2, 1)
	.word 0x9b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r13
	.word 0xba9c26c5  ! 1: XORcc_I	xorcc 	%r16, 0x06c5, %r29
thr3_resum_intr_1269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1269), 16, 16)) -> intp(0, 3, 1)
	.word 0x857c0411  ! 1: MOVR_R	move	%r16, %r17, %r2
	.word 0x90340011  ! 1: ORN_R	orn 	%r16, %r17, %r8
	.word 0x9d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r14
thr3_nuke_intr_1270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1270), 16, 16)) -> intp(0, 2, 1)
	.word 0x840c2fb9  ! 1: AND_I	and 	%r16, 0x0fb9, %r2
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
	.word 0xab641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_1271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1271), 16, 16)) -> intp(0, 3, 1)
	.word 0x98842928  ! 1: ADDcc_I	addcc 	%r16, 0x0928, %r12
	.word 0xab643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_1272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1272), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x85641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_1273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1273), 16, 16)) -> intp(2, 3, 1)
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
thr3_hw_intr_1274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1274), 16, 16)) -> intp(0, 0, 1)
	.word 0x821c0011  ! 1: XOR_R	xor 	%r16, %r17, %r1
thr3_nuke_intr_1275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1275), 16, 16)) -> intp(2, 2, 1)
	.word 0x88b427bd  ! 1: ORNcc_I	orncc 	%r16, 0x07bd, %r4
thr3_resum_intr_1276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1276), 16, 16)) -> intp(2, 3, 1)
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
thr3_hw_intr_1277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1277), 16, 16)) -> intp(1, 0, 1)
	.word 0x8444269e  ! 1: ADDC_I	addc 	%r16, 0x069e, %r2
thr3_nuke_intr_1278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1278), 16, 16)) -> intp(0, 2, 1)
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0xb0040011  ! 1: ADD_R	add 	%r16, %r17, %r24
thr3_resum_intr_1279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1279), 16, 16)) -> intp(0, 3, 1)
	.word 0x89341011  ! 1: SRLX_R	srlx	%r16, %r17, %r4
	.word 0xa68c221d  ! 1: ANDcc_I	andcc 	%r16, 0x021d, %r19
	.word 0x88bc264d  ! 1: XNORcc_I	xnorcc 	%r16, 0x064d, %r4
	.word 0x94342d36  ! 1: ORN_I	orn 	%r16, 0x0d36, %r10
thr3_nuke_intr_1280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1280), 16, 16)) -> intp(0, 2, 1)
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x9b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r13
	.word 0xb8842429  ! 1: ADDcc_I	addcc 	%r16, 0x0429, %r28
	.word 0xa6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r19
thr3_resum_intr_1281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1281), 16, 16)) -> intp(0, 3, 1)
	.word 0xba1c2111  ! 1: XOR_I	xor 	%r16, 0x0111, %r29
	.word 0x83342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
thr3_nuke_intr_1282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1282), 16, 16)) -> intp(2, 2, 1)
	.word 0x99643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9e342253  ! 1: ORN_I	orn 	%r16, 0x0253, %r15
	.word 0xba842324  ! 1: ADDcc_I	addcc 	%r16, 0x0324, %r29
thr3_resum_intr_1283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1283), 16, 16)) -> intp(2, 3, 1)
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
thr3_hw_intr_1284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1284), 16, 16)) -> intp(2, 0, 1)
	.word 0xba842de6  ! 1: ADDcc_I	addcc 	%r16, 0x0de6, %r29
thr3_nuke_intr_1285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1285), 16, 16)) -> intp(1, 2, 1)
	.word 0xb72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0x84042327  ! 1: ADD_I	add 	%r16, 0x0327, %r2
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r5
thr3_resum_intr_1286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1286), 16, 16)) -> intp(1, 3, 1)
	.word 0x952c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r10
	.word 0xb8442d39  ! 1: ADDC_I	addc 	%r16, 0x0d39, %r28
	.word 0x88340011  ! 1: ORN_R	orn 	%r16, %r17, %r4
	.word 0x928c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r9
thr3_hw_intr_1287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1287), 16, 16)) -> intp(1, 0, 1)
	.word 0xab343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0xb69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0x86bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r3
thr3_nuke_intr_1288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1288), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0xab7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r21
	.word 0xaf3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r23
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
thr3_resum_intr_1289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1289), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r21
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
	.word 0xb6142a98  ! 1: OR_I	or 	%r16, 0x0a98, %r27
	.word 0x9cac2fab  ! 1: ANDNcc_I	andncc 	%r16, 0x0fab, %r14
thr3_nuke_intr_1290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1290), 16, 16)) -> intp(0, 2, 1)
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
thr3_resum_intr_1291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1291), 16, 16)) -> intp(0, 3, 1)
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
	.word 0x8cb428d6  ! 1: ORNcc_I	orncc 	%r16, 0x08d6, %r6
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
thr3_hw_intr_1292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1292), 16, 16)) -> intp(0, 0, 1)
	.word 0x96b42e24  ! 1: ORNcc_I	orncc 	%r16, 0x0e24, %r11
	.word 0x97643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_1293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1293), 16, 16)) -> intp(2, 2, 1)
	.word 0x9b340011  ! 1: SRL_R	srl 	%r16, %r17, %r13
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
thr3_resum_intr_1294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1294), 16, 16)) -> intp(2, 3, 1)
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0xb60c23c1  ! 1: AND_I	and 	%r16, 0x03c1, %r27
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
thr3_hw_intr_1295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1295), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0x88bc2873  ! 1: XNORcc_I	xnorcc 	%r16, 0x0873, %r4
	.word 0x85342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0xba2c29f4  ! 1: ANDN_I	andn 	%r16, 0x09f4, %r29
thr3_hw_intr_1296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1296), 16, 16)) -> intp(0, 0, 1)
	.word 0x8f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r7
thr3_nuke_intr_1297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1297), 16, 16)) -> intp(1, 2, 1)
	.word 0xacac25cf  ! 1: ANDNcc_I	andncc 	%r16, 0x05cf, %r22
	.word 0x8414203e  ! 1: OR_I	or 	%r16, 0x003e, %r2
	.word 0xb42c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r26
thr3_resum_intr_1298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1298), 16, 16)) -> intp(1, 3, 1)
	.word 0x863422d0  ! 1: ORN_I	orn 	%r16, 0x02d0, %r3
	.word 0x90ac25b7  ! 1: ANDNcc_I	andncc 	%r16, 0x05b7, %r8
	.word 0xa6340011  ! 1: ORN_R	orn 	%r16, %r17, %r19
thr3_nuke_intr_1299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1299), 16, 16)) -> intp(2, 2, 1)
	.word 0xb4342b4b  ! 1: ORN_I	orn 	%r16, 0x0b4b, %r26
	.word 0xb33c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0xb52c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r26
thr3_resum_intr_1300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1300), 16, 16)) -> intp(2, 3, 1)
	.word 0xb62c2a00  ! 1: ANDN_I	andn 	%r16, 0x0a00, %r27
	.word 0x8c340011  ! 1: ORN_R	orn 	%r16, %r17, %r6
thr3_nuke_intr_1301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1301), 16, 16)) -> intp(1, 2, 1)
	.word 0x9f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r15
	.word 0x9cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x852c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r2
thr3_resum_intr_1302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1302), 16, 16)) -> intp(1, 3, 1)
	.word 0x9d7c2401  ! 1: MOVR_I	move	%r16, 0x1, %r14
	.word 0xb4ac2189  ! 1: ANDNcc_I	andncc 	%r16, 0x0189, %r26
	.word 0x863c28c8  ! 1: XNOR_I	xnor 	%r16, 0x08c8, %r3
thr3_nuke_intr_1303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1303), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x957c2401  ! 1: MOVR_I	move	%r16, 0x11, %r10
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
	.word 0x8c8c290f  ! 1: ANDcc_I	andcc 	%r16, 0x090f, %r6
thr3_resum_intr_1304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1304), 16, 16)) -> intp(1, 3, 1)
	.word 0xa61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r19
	.word 0xb2ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r25
thr3_nuke_intr_1305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1305), 16, 16)) -> intp(1, 2, 1)
	.word 0x88140011  ! 1: OR_R	or 	%r16, %r17, %r4
thr3_resum_intr_1306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1306), 16, 16)) -> intp(1, 3, 1)
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0x973c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r11
thr3_nuke_intr_1307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1307), 16, 16)) -> intp(2, 2, 1)
	.word 0x9ac422f4  ! 1: ADDCcc_I	addccc 	%r16, 0x02f4, %r13
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
thr3_resum_intr_1308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1308), 16, 16)) -> intp(2, 3, 1)
	.word 0x9eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0xb694299d  ! 1: ORcc_I	orcc 	%r16, 0x099d, %r27
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
thr3_hw_intr_1309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1309), 16, 16)) -> intp(2, 0, 1)
	.word 0xb23425cc  ! 1: ORN_I	orn 	%r16, 0x05cc, %r25
	.word 0x86042152  ! 1: ADD_I	add 	%r16, 0x0152, %r3
	.word 0x880c0011  ! 1: AND_R	and 	%r16, %r17, %r4
thr3_nuke_intr_1310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1310), 16, 16)) -> intp(2, 2, 1)
	.word 0xb97c2401  ! 1: MOVR_I	move	%r16, 0x11, %r28
	.word 0xaf341011  ! 1: SRLX_R	srlx	%r16, %r17, %r23
thr3_resum_intr_1311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1311), 16, 16)) -> intp(2, 3, 1)
	.word 0x95341011  ! 1: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
thr3_nuke_intr_1312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1312), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a042550  ! 1: ADD_I	add 	%r16, 0x0550, %r13
	.word 0xba8c25f5  ! 1: ANDcc_I	andcc 	%r16, 0x05f5, %r29
thr3_resum_intr_1313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1313), 16, 16)) -> intp(1, 3, 1)
	.word 0xae1c2053  ! 1: XOR_I	xor 	%r16, 0x0053, %r23
	.word 0x89343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x828c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r1
thr3_nuke_intr_1314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1314), 16, 16)) -> intp(0, 2, 1)
	.word 0xb21423e4  ! 1: OR_I	or 	%r16, 0x03e4, %r25
	.word 0x9a0424b5  ! 1: ADD_I	add 	%r16, 0x04b5, %r13
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
	.word 0x82b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r1
thr3_resum_intr_1315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1315), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r29
	.word 0xa82c233e  ! 1: ANDN_I	andn 	%r16, 0x033e, %r20
	.word 0xb2942efa  ! 1: ORcc_I	orcc 	%r16, 0x0efa, %r25
	.word 0x888c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r4
thr3_hw_intr_1316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1316), 16, 16)) -> intp(0, 0, 1)
	.word 0x941c2e36  ! 1: XOR_I	xor 	%r16, 0x0e36, %r10
	.word 0xac9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0xac8c28f0  ! 1: ANDcc_I	andcc 	%r16, 0x08f0, %r22
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
thr3_nuke_intr_1317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1317), 16, 16)) -> intp(0, 2, 1)
	.word 0x8f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r7
thr3_resum_intr_1318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1318), 16, 16)) -> intp(0, 3, 1)
	.word 0x837c0411  ! 1: MOVR_R	move	%r16, %r17, %r1
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x99340011  ! 1: SRL_R	srl 	%r16, %r17, %r12
	.word 0xb6140011  ! 1: OR_R	or 	%r16, %r17, %r27
thr3_hw_intr_1319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1319), 16, 16)) -> intp(1, 0, 1)
	.word 0x9a142576  ! 1: OR_I	or 	%r16, 0x0576, %r13
	.word 0x90140011  ! 1: OR_R	or 	%r16, %r17, %r8
thr3_hw_intr_1320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1320), 16, 16)) -> intp(0, 0, 1)
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
	.word 0xa8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0xb3342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x8d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r6
thr3_nuke_intr_1321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1321), 16, 16)) -> intp(2, 2, 1)
	.word 0xa8040011  ! 1: ADD_R	add 	%r16, %r17, %r20
	.word 0x9b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0x8c842e8c  ! 1: ADDcc_I	addcc 	%r16, 0x0e8c, %r6
thr3_resum_intr_1322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1322), 16, 16)) -> intp(2, 3, 1)
	.word 0xb08c2187  ! 1: ANDcc_I	andcc 	%r16, 0x0187, %r24
	.word 0x96040011  ! 1: ADD_R	add 	%r16, %r17, %r11
thr3_nuke_intr_1323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1323), 16, 16)) -> intp(2, 2, 1)
	.word 0x8b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0xac440011  ! 1: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x86340011  ! 1: ORN_R	orn 	%r16, %r17, %r3
thr3_resum_intr_1324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1324), 16, 16)) -> intp(2, 3, 1)
	.word 0x89342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0x84bc207a  ! 1: XNORcc_I	xnorcc 	%r16, 0x007a, %r2
thr3_hw_intr_1325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1325), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0xab7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r21
	.word 0x9c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r14
thr3_hw_intr_1326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1326), 16, 16)) -> intp(0, 0, 1)
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x9084298e  ! 1: ADDcc_I	addcc 	%r16, 0x098e, %r8
	.word 0xb0440011  ! 1: ADDC_R	addc 	%r16, %r17, %r24
thr3_nuke_intr_1327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1327), 16, 16)) -> intp(1, 2, 1)
	.word 0xb8bc2d1f  ! 1: XNORcc_I	xnorcc 	%r16, 0x0d1f, %r28
	.word 0x857c0411  ! 1: MOVR_R	move	%r16, %r17, %r2
	.word 0xa8ac24ea  ! 1: ANDNcc_I	andncc 	%r16, 0x04ea, %r20
	.word 0x8d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r6
thr3_resum_intr_1328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1328), 16, 16)) -> intp(1, 3, 1)
	.word 0x897c2401  ! 1: MOVR_I	move	%r16, 0x1, %r4
thr3_hw_intr_1329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1329), 16, 16)) -> intp(1, 0, 1)
	.word 0x9aac2f7a  ! 1: ANDNcc_I	andncc 	%r16, 0x0f7a, %r13
thr3_hw_intr_1330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1330), 16, 16)) -> intp(2, 0, 1)
	.word 0x882c2c35  ! 1: ANDN_I	andn 	%r16, 0x0c35, %r4
thr3_nuke_intr_1331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1331), 16, 16)) -> intp(0, 2, 1)
	.word 0x94440011  ! 1: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x84142c93  ! 1: OR_I	or 	%r16, 0x0c93, %r2
thr3_resum_intr_1332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1332), 16, 16)) -> intp(0, 3, 1)
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x8c442f71  ! 1: ADDC_I	addc 	%r16, 0x0f71, %r6
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
thr3_nuke_intr_1333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1333), 16, 16)) -> intp(2, 2, 1)
	.word 0xac8c213a  ! 1: ANDcc_I	andcc 	%r16, 0x013a, %r22
	.word 0xa9643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
thr3_resum_intr_1334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1334), 16, 16)) -> intp(2, 3, 1)
	.word 0x90ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x9f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r15
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
	.word 0xb0440011  ! 1: ADDC_R	addc 	%r16, %r17, %r24
thr3_nuke_intr_1335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1335), 16, 16)) -> intp(0, 2, 1)
	.word 0x9eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xa634291d  ! 1: ORN_I	orn 	%r16, 0x091d, %r19
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
thr3_resum_intr_1336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1336), 16, 16)) -> intp(0, 3, 1)
	.word 0x9d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x8a9c2f8c  ! 1: XORcc_I	xorcc 	%r16, 0x0f8c, %r5
	.word 0x87343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r3
thr3_hw_intr_1337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1337), 16, 16)) -> intp(1, 0, 1)
	.word 0x91641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb62c2ffa  ! 1: ANDN_I	andn 	%r16, 0x0ffa, %r27
	.word 0xbab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x88340011  ! 1: ORN_R	orn 	%r16, %r17, %r4
thr3_nuke_intr_1338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1338), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a942a49  ! 1: ORcc_I	orcc 	%r16, 0x0a49, %r13
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0xb8940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r28
thr3_resum_intr_1339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1339), 16, 16)) -> intp(2, 3, 1)
	.word 0x909c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
thr3_nuke_intr_1340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1340), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0xaaac2f3c  ! 1: ANDNcc_I	andncc 	%r16, 0x0f3c, %r21
	.word 0xb12c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0xae9421a7  ! 1: ORcc_I	orcc 	%r16, 0x01a7, %r23
thr3_resum_intr_1341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1341), 16, 16)) -> intp(0, 3, 1)
	.word 0x97343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0x9b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r13
	.word 0x8a140011  ! 1: OR_R	or 	%r16, %r17, %r5
thr3_nuke_intr_1342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1342), 16, 16)) -> intp(0, 2, 1)
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
	.word 0x881c247e  ! 1: XOR_I	xor 	%r16, 0x047e, %r4
	.word 0x97643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_1343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1343), 16, 16)) -> intp(0, 3, 1)
	.word 0x95343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r10
thr3_hw_intr_1344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1344), 16, 16)) -> intp(0, 0, 1)
	.word 0xb0140011  ! 1: OR_R	or 	%r16, %r17, %r24
	.word 0xac342448  ! 1: ORN_I	orn 	%r16, 0x0448, %r22
thr3_hw_intr_1345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1345), 16, 16)) -> intp(1, 0, 1)
	.word 0x9d643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
	.word 0xa72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r19
thr3_nuke_intr_1346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1346), 16, 16)) -> intp(2, 2, 1)
	.word 0x9eb422f3  ! 1: ORNcc_I	orncc 	%r16, 0x02f3, %r15
thr3_resum_intr_1347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1347), 16, 16)) -> intp(2, 3, 1)
	.word 0xb8b42089  ! 1: ORNcc_I	orncc 	%r16, 0x0089, %r28
	.word 0xa8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r20
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r7
	.word 0x92442287  ! 1: ADDC_I	addc 	%r16, 0x0287, %r9
thr3_hw_intr_1348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1348), 16, 16)) -> intp(0, 0, 1)
	.word 0x949c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r10
thr3_nuke_intr_1349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1349), 16, 16)) -> intp(1, 2, 1)
	.word 0xa6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x833c1011  ! 1: SRAX_R	srax	%r16, %r17, %r1
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
thr3_resum_intr_1350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1350), 16, 16)) -> intp(1, 3, 1)
	.word 0x8aac2697  ! 1: ANDNcc_I	andncc 	%r16, 0x0697, %r5
	.word 0x9e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
	.word 0x862c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r3
thr3_hw_intr_1351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1351), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
thr3_hw_intr_1352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1352), 16, 16)) -> intp(1, 0, 1)
	.word 0xb1641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x96b42ef3  ! 1: ORNcc_I	orncc 	%r16, 0x0ef3, %r11
	.word 0xb52c0011  ! 1: SLL_R	sll 	%r16, %r17, %r26
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
thr3_nuke_intr_1353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1353), 16, 16)) -> intp(2, 2, 1)
	.word 0x91641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0xb09c2777  ! 1: XORcc_I	xorcc 	%r16, 0x0777, %r24
	.word 0x8604233f  ! 1: ADD_I	add 	%r16, 0x033f, %r3
thr3_resum_intr_1354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1354), 16, 16)) -> intp(2, 3, 1)
	.word 0x8b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xa97c2401  ! 1: MOVR_I	move	%r16, 0x11, %r20
	.word 0xb17c2401  ! 1: MOVR_I	move	%r16, 0x11, %r24
thr3_hw_intr_1355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1355), 16, 16)) -> intp(1, 0, 1)
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
	.word 0xa93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r20
	.word 0xb8442e8c  ! 1: ADDC_I	addc 	%r16, 0x0e8c, %r28
	.word 0x873c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r3
thr3_hw_intr_1356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1356), 16, 16)) -> intp(1, 0, 1)
	.word 0xb8bc2811  ! 1: XNORcc_I	xnorcc 	%r16, 0x0811, %r28
	.word 0x9abc2fdc  ! 1: XNORcc_I	xnorcc 	%r16, 0x0fdc, %r13
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
	.word 0x9a2c205d  ! 1: ANDN_I	andn 	%r16, 0x005d, %r13
thr3_nuke_intr_1357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1357), 16, 16)) -> intp(2, 2, 1)
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
thr3_resum_intr_1358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1358), 16, 16)) -> intp(2, 3, 1)
	.word 0xb13c1011  ! 1: SRAX_R	srax	%r16, %r17, %r24
	.word 0x892c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r4
thr3_hw_intr_1359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1359), 16, 16)) -> intp(1, 0, 1)
	.word 0x8ac4290c  ! 1: ADDCcc_I	addccc 	%r16, 0x090c, %r5
	.word 0x8e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0xb2040011  ! 1: ADD_R	add 	%r16, %r17, %r25
	.word 0xba1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r29
thr3_nuke_intr_1360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1360), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
	.word 0x92bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
thr3_resum_intr_1361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1361), 16, 16)) -> intp(1, 3, 1)
	.word 0xb8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0x903c2548  ! 1: XNOR_I	xnor 	%r16, 0x0548, %r8
	.word 0x90442f83  ! 1: ADDC_I	addc 	%r16, 0x0f83, %r8
thr3_nuke_intr_1362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1362), 16, 16)) -> intp(1, 2, 1)
	.word 0x86bc28f1  ! 1: XNORcc_I	xnorcc 	%r16, 0x08f1, %r3
	.word 0x90ac2bd7  ! 1: ANDNcc_I	andncc 	%r16, 0x0bd7, %r8
	.word 0x83643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_1363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1363), 16, 16)) -> intp(1, 3, 1)
	.word 0xac1c24e1  ! 1: XOR_I	xor 	%r16, 0x04e1, %r22
	.word 0x88340011  ! 1: ORN_R	orn 	%r16, %r17, %r4
thr3_nuke_intr_1364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1364), 16, 16)) -> intp(2, 2, 1)
	.word 0xa83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r20
thr3_resum_intr_1365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1365), 16, 16)) -> intp(2, 3, 1)
	.word 0xb6bc2f77  ! 1: XNORcc_I	xnorcc 	%r16, 0x0f77, %r27
thr3_hw_intr_1366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1366), 16, 16)) -> intp(1, 0, 1)
	.word 0xb4c42428  ! 1: ADDCcc_I	addccc 	%r16, 0x0428, %r26
	.word 0x9b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x881c0011  ! 1: XOR_R	xor 	%r16, %r17, %r4
thr3_nuke_intr_1367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1367), 16, 16)) -> intp(0, 2, 1)
	.word 0x8d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r6
	.word 0xb6942951  ! 1: ORcc_I	orcc 	%r16, 0x0951, %r27
	.word 0x8d340011  ! 1: SRL_R	srl 	%r16, %r17, %r6
thr3_resum_intr_1368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1368), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
	.word 0xa72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r19
	.word 0xa8ac2a20  ! 1: ANDNcc_I	andncc 	%r16, 0x0a20, %r20
	.word 0x953c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r10
thr3_hw_intr_1369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1369), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa9c290a  ! 1: XORcc_I	xorcc 	%r16, 0x090a, %r21
	.word 0xa6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r19
	.word 0xb6140011  ! 1: OR_R	or 	%r16, %r17, %r27
thr3_nuke_intr_1370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1370), 16, 16)) -> intp(1, 2, 1)
	.word 0x92442c8c  ! 1: ADDC_I	addc 	%r16, 0x0c8c, %r9
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
thr3_resum_intr_1371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1371), 16, 16)) -> intp(1, 3, 1)
	.word 0x85340011  ! 1: SRL_R	srl 	%r16, %r17, %r2
thr3_hw_intr_1372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1372), 16, 16)) -> intp(0, 0, 1)
	.word 0x833c0011  ! 1: SRA_R	sra 	%r16, %r17, %r1
thr3_hw_intr_1373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1373), 16, 16)) -> intp(2, 0, 1)
	.word 0x837c0411  ! 1: MOVR_R	move	%r16, %r17, %r1
	.word 0xb8342036  ! 1: ORN_I	orn 	%r16, 0x0036, %r28
	.word 0x91343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r8
thr3_hw_intr_1374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1374), 16, 16)) -> intp(0, 0, 1)
	.word 0xae940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x9f340011  ! 1: SRL_R	srl 	%r16, %r17, %r15
	.word 0xb2142f3d  ! 1: OR_I	or 	%r16, 0x0f3d, %r25
thr3_nuke_intr_1375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1375), 16, 16)) -> intp(0, 2, 1)
	.word 0x903c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0xad643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xae0c0011  ! 1: AND_R	and 	%r16, %r17, %r23
	.word 0x832c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r1
thr3_resum_intr_1376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1376), 16, 16)) -> intp(0, 3, 1)
	.word 0x888c2291  ! 1: ANDcc_I	andcc 	%r16, 0x0291, %r4
thr3_nuke_intr_1377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1377), 16, 16)) -> intp(1, 2, 1)
	.word 0xb88426d2  ! 1: ADDcc_I	addcc 	%r16, 0x06d2, %r28
	.word 0xb03c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0x9a142358  ! 1: OR_I	or 	%r16, 0x0358, %r13
	.word 0xb2c423bf  ! 1: ADDCcc_I	addccc 	%r16, 0x03bf, %r25
thr3_resum_intr_1378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1378), 16, 16)) -> intp(1, 3, 1)
	.word 0x953c0011  ! 1: SRA_R	sra 	%r16, %r17, %r10
thr3_nuke_intr_1379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1379), 16, 16)) -> intp(2, 2, 1)
	.word 0xb0342990  ! 1: ORN_I	orn 	%r16, 0x0990, %r24
	.word 0x89343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0xb5340011  ! 1: SRL_R	srl 	%r16, %r17, %r26
thr3_resum_intr_1380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1380), 16, 16)) -> intp(2, 3, 1)
	.word 0x94042769  ! 1: ADD_I	add 	%r16, 0x0769, %r10
thr3_hw_intr_1381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1381), 16, 16)) -> intp(2, 0, 1)
	.word 0x952c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r10
	.word 0xbabc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
thr3_hw_intr_1382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1382), 16, 16)) -> intp(2, 0, 1)
	.word 0xad343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r22
	.word 0x84140011  ! 1: OR_R	or 	%r16, %r17, %r2
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
thr3_hw_intr_1383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1383), 16, 16)) -> intp(1, 0, 1)
	.word 0x9e040011  ! 1: ADD_R	add 	%r16, %r17, %r15
	.word 0xb23c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r25
thr3_hw_intr_1384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1384), 16, 16)) -> intp(2, 0, 1)
	.word 0xb0442da2  ! 1: ADDC_I	addc 	%r16, 0x0da2, %r24
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
thr3_nuke_intr_1385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1385), 16, 16)) -> intp(0, 2, 1)
	.word 0x869c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0xb2bc2226  ! 1: XNORcc_I	xnorcc 	%r16, 0x0226, %r25
	.word 0x883421b8  ! 1: ORN_I	orn 	%r16, 0x01b8, %r4
	.word 0x9a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r13
thr3_resum_intr_1386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1386), 16, 16)) -> intp(0, 3, 1)
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x9f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r15
thr3_hw_intr_1387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1387), 16, 16)) -> intp(1, 0, 1)
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
thr3_hw_intr_1388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1388), 16, 16)) -> intp(2, 0, 1)
	.word 0x8a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0x960c2d1d  ! 1: AND_I	and 	%r16, 0x0d1d, %r11
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
thr3_hw_intr_1389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1389), 16, 16)) -> intp(1, 0, 1)
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
thr3_hw_intr_1390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1390), 16, 16)) -> intp(1, 0, 1)
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
	.word 0x84942546  ! 1: ORcc_I	orcc 	%r16, 0x0546, %r2
	.word 0xba040011  ! 1: ADD_R	add 	%r16, %r17, %r29
	.word 0x9d2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r14
thr3_nuke_intr_1391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1391), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0xbb343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r29
thr3_resum_intr_1392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1392), 16, 16)) -> intp(0, 3, 1)
	.word 0x9a3c273d  ! 1: XNOR_I	xnor 	%r16, 0x073d, %r13
	.word 0x9e94251a  ! 1: ORcc_I	orcc 	%r16, 0x051a, %r15
thr3_hw_intr_1393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1393), 16, 16)) -> intp(1, 0, 1)
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x9c842431  ! 1: ADDcc_I	addcc 	%r16, 0x0431, %r14
	.word 0xab2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r21
thr3_hw_intr_1394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1394), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa8c20a6  ! 1: ANDcc_I	andcc 	%r16, 0x00a6, %r21
	.word 0x9c342b6d  ! 1: ORN_I	orn 	%r16, 0x0b6d, %r14
	.word 0x8c8c2ca8  ! 1: ANDcc_I	andcc 	%r16, 0x0ca8, %r6
	.word 0xbb342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r29
thr3_nuke_intr_1395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1395), 16, 16)) -> intp(2, 2, 1)
	.word 0x96840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r11
thr3_resum_intr_1396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1396), 16, 16)) -> intp(2, 3, 1)
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
thr3_nuke_intr_1397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1397), 16, 16)) -> intp(0, 2, 1)
	.word 0xb8ac2490  ! 1: ANDNcc_I	andncc 	%r16, 0x0490, %r28
thr3_resum_intr_1398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1398), 16, 16)) -> intp(0, 3, 1)
	.word 0x82c42100  ! 1: ADDCcc_I	addccc 	%r16, 0x0100, %r1
	.word 0x900c2e71  ! 1: AND_I	and 	%r16, 0x0e71, %r8
thr3_nuke_intr_1399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1399), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r27
thr3_resum_intr_1400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1400), 16, 16)) -> intp(1, 3, 1)
	.word 0xa89420bb  ! 1: ORcc_I	orcc 	%r16, 0x00bb, %r20
	.word 0xaa9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r21
	.word 0x97643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
thr3_hw_intr_1401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1401), 16, 16)) -> intp(2, 0, 1)
	.word 0x880c291f  ! 1: AND_I	and 	%r16, 0x091f, %r4
thr3_nuke_intr_1402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1402), 16, 16)) -> intp(2, 2, 1)
	.word 0x901421b7  ! 1: OR_I	or 	%r16, 0x01b7, %r8
	.word 0xb6040011  ! 1: ADD_R	add 	%r16, %r17, %r27
	.word 0xb12c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x8a8c2f57  ! 1: ANDcc_I	andcc 	%r16, 0x0f57, %r5
thr3_resum_intr_1403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1403), 16, 16)) -> intp(2, 3, 1)
	.word 0x92942c25  ! 1: ORcc_I	orcc 	%r16, 0x0c25, %r9
	.word 0x873c1011  ! 1: SRAX_R	srax	%r16, %r17, %r3
thr3_hw_intr_1404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1404), 16, 16)) -> intp(2, 0, 1)
	.word 0x8a1c210e  ! 1: XOR_I	xor 	%r16, 0x010e, %r5
	.word 0xb32c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r25
	.word 0x98440011  ! 1: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
thr3_nuke_intr_1405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1405), 16, 16)) -> intp(2, 2, 1)
	.word 0x8aac218b  ! 1: ANDNcc_I	andncc 	%r16, 0x018b, %r5
	.word 0x90ac21f2  ! 1: ANDNcc_I	andncc 	%r16, 0x01f2, %r8
thr3_resum_intr_1406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1406), 16, 16)) -> intp(2, 3, 1)
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
thr3_nuke_intr_1407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1407), 16, 16)) -> intp(1, 2, 1)
	.word 0x862c2346  ! 1: ANDN_I	andn 	%r16, 0x0346, %r3
	.word 0xb7641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_1408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1408), 16, 16)) -> intp(1, 3, 1)
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x87643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x9a9c24c1  ! 1: XORcc_I	xorcc 	%r16, 0x04c1, %r13
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
thr3_hw_intr_1409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1409), 16, 16)) -> intp(2, 0, 1)
	.word 0x972c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r11
thr3_hw_intr_1410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1410), 16, 16)) -> intp(2, 0, 1)
	.word 0xb2440011  ! 1: ADDC_R	addc 	%r16, %r17, %r25
	.word 0x9ab42f82  ! 1: ORNcc_I	orncc 	%r16, 0x0f82, %r13
	.word 0x90b42f3d  ! 1: ORNcc_I	orncc 	%r16, 0x0f3d, %r8
	.word 0xac1c2d2a  ! 1: XOR_I	xor 	%r16, 0x0d2a, %r22
thr3_nuke_intr_1411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1411), 16, 16)) -> intp(0, 2, 1)
	.word 0xae0c27ac  ! 1: AND_I	and 	%r16, 0x07ac, %r23
	.word 0x921c27af  ! 1: XOR_I	xor 	%r16, 0x07af, %r9
	.word 0x9abc2458  ! 1: XNORcc_I	xnorcc 	%r16, 0x0458, %r13
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
thr3_resum_intr_1412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1412), 16, 16)) -> intp(0, 3, 1)
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
thr3_hw_intr_1413:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1413), 16, 16)) -> intp(2, 0, 1)
	.word 0x85342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r2
thr3_hw_intr_1414:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1414), 16, 16)) -> intp(1, 0, 1)
	.word 0x99341011  ! 1: SRLX_R	srlx	%r16, %r17, %r12
	.word 0xa6842847  ! 1: ADDcc_I	addcc 	%r16, 0x0847, %r19
thr3_nuke_intr_1415:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1415), 16, 16)) -> intp(2, 2, 1)
	.word 0xb2c42c9a  ! 1: ADDCcc_I	addccc 	%r16, 0x0c9a, %r25
thr3_resum_intr_1416:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1416), 16, 16)) -> intp(2, 3, 1)
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
thr3_nuke_intr_1417:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1417), 16, 16)) -> intp(1, 2, 1)
	.word 0x8cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x993c0011  ! 1: SRA_R	sra 	%r16, %r17, %r12
thr3_resum_intr_1418:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1418), 16, 16)) -> intp(1, 3, 1)
	.word 0x84c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xa6140011  ! 1: OR_R	or 	%r16, %r17, %r19
thr3_hw_intr_1419:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1419), 16, 16)) -> intp(2, 0, 1)
	.word 0xba840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r29
thr3_hw_intr_1420:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1420), 16, 16)) -> intp(0, 0, 1)
	.word 0xb7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0x9c0c2c46  ! 1: AND_I	and 	%r16, 0x0c46, %r14
thr3_nuke_intr_1421:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1421), 16, 16)) -> intp(0, 2, 1)
	.word 0x86c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r3
thr3_resum_intr_1422:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1422), 16, 16)) -> intp(0, 3, 1)
	.word 0x93643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
thr3_nuke_intr_1423:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1423), 16, 16)) -> intp(2, 2, 1)
	.word 0x92b42602  ! 1: ORNcc_I	orncc 	%r16, 0x0602, %r9
thr3_resum_intr_1424:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1424), 16, 16)) -> intp(2, 3, 1)
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
	.word 0x9f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
thr3_nuke_intr_1425:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1425), 16, 16)) -> intp(0, 2, 1)
	.word 0x98942f7e  ! 1: ORcc_I	orcc 	%r16, 0x0f7e, %r12
thr3_resum_intr_1426:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1426), 16, 16)) -> intp(0, 3, 1)
	.word 0x988c2615  ! 1: ANDcc_I	andcc 	%r16, 0x0615, %r12
	.word 0x928426e8  ! 1: ADDcc_I	addcc 	%r16, 0x06e8, %r9
	.word 0x88c425bc  ! 1: ADDCcc_I	addccc 	%r16, 0x05bc, %r4
thr3_nuke_intr_1427:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1427), 16, 16)) -> intp(0, 2, 1)
	.word 0x961c2282  ! 1: XOR_I	xor 	%r16, 0x0282, %r11
	.word 0x8a040011  ! 1: ADD_R	add 	%r16, %r17, %r5
	.word 0x8cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r6
thr3_resum_intr_1428:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1428), 16, 16)) -> intp(0, 3, 1)
	.word 0x912c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x9c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
thr3_hw_intr_1429:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1429), 16, 16)) -> intp(1, 0, 1)
	.word 0x94c425bf  ! 1: ADDCcc_I	addccc 	%r16, 0x05bf, %r10
thr3_nuke_intr_1430:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1430), 16, 16)) -> intp(2, 2, 1)
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
thr3_resum_intr_1431:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1431), 16, 16)) -> intp(2, 3, 1)
	.word 0x977c2401  ! 1: MOVR_I	move	%r16, 0x11, %r11
	.word 0x989c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x92b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xab3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r21
thr3_nuke_intr_1432:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1432), 16, 16)) -> intp(1, 2, 1)
	.word 0xb1643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_1433:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1433), 16, 16)) -> intp(1, 3, 1)
	.word 0xb0340011  ! 1: ORN_R	orn 	%r16, %r17, %r24
	.word 0xa6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
thr3_hw_intr_1434:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1434), 16, 16)) -> intp(2, 0, 1)
	.word 0xba9c2880  ! 1: XORcc_I	xorcc 	%r16, 0x0880, %r29
	.word 0x94442176  ! 1: ADDC_I	addc 	%r16, 0x0176, %r10
thr3_nuke_intr_1435:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1435), 16, 16)) -> intp(2, 2, 1)
	.word 0xac8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0x9c0c24ff  ! 1: AND_I	and 	%r16, 0x04ff, %r14
	.word 0x9ebc2bf6  ! 1: XNORcc_I	xnorcc 	%r16, 0x0bf6, %r15
thr3_resum_intr_1436:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1436), 16, 16)) -> intp(2, 3, 1)
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
thr3_nuke_intr_1437:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1437), 16, 16)) -> intp(2, 2, 1)
	.word 0x9c1c2184  ! 1: XOR_I	xor 	%r16, 0x0184, %r14
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
thr3_resum_intr_1438:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1438), 16, 16)) -> intp(2, 3, 1)
	.word 0x940c2a4c  ! 1: AND_I	and 	%r16, 0x0a4c, %r10
	.word 0x96b42dc0  ! 1: ORNcc_I	orncc 	%r16, 0x0dc0, %r11
thr3_nuke_intr_1439:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1439), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0x8b7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r5
thr3_resum_intr_1440:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1440), 16, 16)) -> intp(1, 3, 1)
	.word 0x943c2955  ! 1: XNOR_I	xnor 	%r16, 0x0955, %r10
thr3_nuke_intr_1441:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1441), 16, 16)) -> intp(2, 2, 1)
	.word 0x93340011  ! 1: SRL_R	srl 	%r16, %r17, %r9
	.word 0xb68c2be0  ! 1: ANDcc_I	andcc 	%r16, 0x0be0, %r27
thr3_resum_intr_1442:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1442), 16, 16)) -> intp(2, 3, 1)
	.word 0xad340011  ! 1: SRL_R	srl 	%r16, %r17, %r22
thr3_hw_intr_1443:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1443), 16, 16)) -> intp(2, 0, 1)
	.word 0xb6b42b71  ! 1: ORNcc_I	orncc 	%r16, 0x0b71, %r27
	.word 0x8a04285d  ! 1: ADD_I	add 	%r16, 0x085d, %r5
	.word 0x8f643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r5
thr3_hw_intr_1444:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1444), 16, 16)) -> intp(0, 0, 1)
	.word 0x9ebc2de8  ! 1: XNORcc_I	xnorcc 	%r16, 0x0de8, %r15
	.word 0x82142ee4  ! 1: OR_I	or 	%r16, 0x0ee4, %r1
	.word 0x860c28e7  ! 1: AND_I	and 	%r16, 0x08e7, %r3
	.word 0xaec4224c  ! 1: ADDCcc_I	addccc 	%r16, 0x024c, %r23
thr3_hw_intr_1445:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1445), 16, 16)) -> intp(2, 0, 1)
	.word 0x857c2401  ! 1: MOVR_I	move	%r16, 0xfffffe4c, %r2
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
thr3_hw_intr_1446:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1446), 16, 16)) -> intp(1, 0, 1)
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x8d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r6
thr3_hw_intr_1447:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1447), 16, 16)) -> intp(0, 0, 1)
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
thr3_nuke_intr_1448:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1448), 16, 16)) -> intp(0, 2, 1)
	.word 0x88b42f57  ! 1: ORNcc_I	orncc 	%r16, 0x0f57, %r4
thr3_resum_intr_1449:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1449), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e142186  ! 1: OR_I	or 	%r16, 0x0186, %r7
	.word 0xb61c2cff  ! 1: XOR_I	xor 	%r16, 0x0cff, %r27
	.word 0x93343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x8b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r5
thr3_nuke_intr_1450:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1450), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a1c22fd  ! 1: XOR_I	xor 	%r16, 0x02fd, %r13
	.word 0xab2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r21
thr3_resum_intr_1451:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1451), 16, 16)) -> intp(1, 3, 1)
	.word 0xa6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0xb09c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x9e1c258f  ! 1: XOR_I	xor 	%r16, 0x058f, %r15
	.word 0x869c240b  ! 1: XORcc_I	xorcc 	%r16, 0x040b, %r3
thr3_nuke_intr_1452:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1452), 16, 16)) -> intp(1, 2, 1)
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
	.word 0xb8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r28
	.word 0xaec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r23
thr3_resum_intr_1453:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1453), 16, 16)) -> intp(1, 3, 1)
	.word 0xb2c428d4  ! 1: ADDCcc_I	addccc 	%r16, 0x08d4, %r25
	.word 0x908c2194  ! 1: ANDcc_I	andcc 	%r16, 0x0194, %r8
	.word 0x8d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r6
thr3_hw_intr_1454:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1454), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c3422e9  ! 1: ORN_I	orn 	%r16, 0x02e9, %r14
thr3_nuke_intr_1455:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1455), 16, 16)) -> intp(1, 2, 1)
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
thr3_resum_intr_1456:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1456), 16, 16)) -> intp(1, 3, 1)
	.word 0x82442f9b  ! 1: ADDC_I	addc 	%r16, 0x0f9b, %r1
	.word 0xba942182  ! 1: ORcc_I	orcc 	%r16, 0x0182, %r29
	.word 0xb73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r27
	.word 0xb03429fe  ! 1: ORN_I	orn 	%r16, 0x09fe, %r24
thr3_nuke_intr_1457:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1457), 16, 16)) -> intp(2, 2, 1)
	.word 0x94342214  ! 1: ORN_I	orn 	%r16, 0x0214, %r10
	.word 0x87643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
	.word 0xa61c268d  ! 1: XOR_I	xor 	%r16, 0x068d, %r19
thr3_resum_intr_1458:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1458), 16, 16)) -> intp(2, 3, 1)
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
thr3_nuke_intr_1459:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1459), 16, 16)) -> intp(0, 2, 1)
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x94c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r10
thr3_resum_intr_1460:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1460), 16, 16)) -> intp(0, 3, 1)
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
thr3_hw_intr_1461:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1461), 16, 16)) -> intp(2, 0, 1)
	.word 0x98bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r12
thr3_nuke_intr_1462:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1462), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r29
thr3_resum_intr_1463:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1463), 16, 16)) -> intp(0, 3, 1)
	.word 0x89342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xb00c24fc  ! 1: AND_I	and 	%r16, 0x04fc, %r24
	.word 0x95643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_1464:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1464), 16, 16)) -> intp(2, 0, 1)
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
thr3_nuke_intr_1465:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1465), 16, 16)) -> intp(2, 2, 1)
	.word 0x853c0011  ! 1: SRA_R	sra 	%r16, %r17, %r2
	.word 0x973c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x8b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0xb8b429c2  ! 1: ORNcc_I	orncc 	%r16, 0x09c2, %r28
thr3_resum_intr_1466:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1466), 16, 16)) -> intp(2, 3, 1)
	.word 0x96bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r11
thr3_nuke_intr_1467:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1467), 16, 16)) -> intp(0, 2, 1)
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x872c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x993c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x857c2401  ! 1: MOVR_I	move	%r16, 0x1, %r2
thr3_resum_intr_1468:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1468), 16, 16)) -> intp(0, 3, 1)
	.word 0x9f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
thr3_hw_intr_1469:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1469), 16, 16)) -> intp(0, 0, 1)
	.word 0xa80426c2  ! 1: ADD_I	add 	%r16, 0x06c2, %r20
	.word 0x92842a37  ! 1: ADDcc_I	addcc 	%r16, 0x0a37, %r9
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0xa92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r20
thr3_hw_intr_1470:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1470), 16, 16)) -> intp(0, 0, 1)
	.word 0xb23c29db  ! 1: XNOR_I	xnor 	%r16, 0x09db, %r25
thr3_hw_intr_1471:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1471), 16, 16)) -> intp(0, 0, 1)
	.word 0x95342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r10
thr3_nuke_intr_1472:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1472), 16, 16)) -> intp(0, 2, 1)
	.word 0x860c2e43  ! 1: AND_I	and 	%r16, 0x0e43, %r3
	.word 0xa93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x9f643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_1473:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1473), 16, 16)) -> intp(0, 3, 1)
	.word 0x93341011  ! 1: SRLX_R	srlx	%r16, %r17, %r9
thr3_nuke_intr_1474:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1474), 16, 16)) -> intp(0, 2, 1)
	.word 0x83341011  ! 1: SRLX_R	srlx	%r16, %r17, %r1
	.word 0xab2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0x98b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r12
thr3_resum_intr_1475:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1475), 16, 16)) -> intp(0, 3, 1)
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
thr3_nuke_intr_1476:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1476), 16, 16)) -> intp(2, 2, 1)
	.word 0xaa040011  ! 1: ADD_R	add 	%r16, %r17, %r21
	.word 0xb6442ac3  ! 1: ADDC_I	addc 	%r16, 0x0ac3, %r27
	.word 0x9eb42e1d  ! 1: ORNcc_I	orncc 	%r16, 0x0e1d, %r15
	.word 0x92b42590  ! 1: ORNcc_I	orncc 	%r16, 0x0590, %r9
thr3_resum_intr_1477:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1477), 16, 16)) -> intp(2, 3, 1)
	.word 0x8ab4265f  ! 1: ORNcc_I	orncc 	%r16, 0x065f, %r5
	.word 0x9a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r13
	.word 0x89341011  ! 1: SRLX_R	srlx	%r16, %r17, %r4
thr3_hw_intr_1478:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1478), 16, 16)) -> intp(0, 0, 1)
	.word 0xae14201e  ! 1: OR_I	or 	%r16, 0x001e, %r23
thr3_hw_intr_1479:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1479), 16, 16)) -> intp(1, 0, 1)
	.word 0x997c0411  ! 1: MOVR_R	move	%r16, %r17, %r12
	.word 0xa6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x85343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0x8a442002  ! 1: ADDC_I	addc 	%r16, 0x0002, %r5
thr3_nuke_intr_1480:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1480), 16, 16)) -> intp(0, 2, 1)
	.word 0xb2342269  ! 1: ORN_I	orn 	%r16, 0x0269, %r25
thr3_resum_intr_1481:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1481), 16, 16)) -> intp(0, 3, 1)
	.word 0xae442100  ! 1: ADDC_I	addc 	%r16, 0x0100, %r23
	.word 0x8f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r7
thr3_nuke_intr_1482:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1482), 16, 16)) -> intp(0, 2, 1)
	.word 0x9d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r14
	.word 0x949c2f78  ! 1: XORcc_I	xorcc 	%r16, 0x0f78, %r10
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
thr3_resum_intr_1483:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1483), 16, 16)) -> intp(0, 3, 1)
	.word 0x972c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r11
thr3_nuke_intr_1484:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1484), 16, 16)) -> intp(2, 2, 1)
	.word 0xb2440011  ! 1: ADDC_R	addc 	%r16, %r17, %r25
thr3_resum_intr_1485:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1485), 16, 16)) -> intp(2, 3, 1)
	.word 0x988429eb  ! 1: ADDcc_I	addcc 	%r16, 0x09eb, %r12
	.word 0x8c140011  ! 1: OR_R	or 	%r16, %r17, %r6
	.word 0x901c21bc  ! 1: XOR_I	xor 	%r16, 0x01bc, %r8
thr3_hw_intr_1486:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1486), 16, 16)) -> intp(0, 0, 1)
	.word 0xa7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0x9a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x86842e20  ! 1: ADDcc_I	addcc 	%r16, 0x0e20, %r3
thr3_hw_intr_1487:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1487), 16, 16)) -> intp(1, 0, 1)
	.word 0xba2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r29
	.word 0xb6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r27
	.word 0xbabc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0x9a340011  ! 1: ORN_R	orn 	%r16, %r17, %r13
thr3_nuke_intr_1488:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1488), 16, 16)) -> intp(1, 2, 1)
	.word 0x9eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r15
thr3_resum_intr_1489:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1489), 16, 16)) -> intp(1, 3, 1)
	.word 0xae3427ae  ! 1: ORN_I	orn 	%r16, 0x07ae, %r23
	.word 0x84ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0xa6340011  ! 1: ORN_R	orn 	%r16, %r17, %r19
thr3_hw_intr_1490:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1490), 16, 16)) -> intp(2, 0, 1)
	.word 0xb9340011  ! 1: SRL_R	srl 	%r16, %r17, %r28
	.word 0x823c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r1
thr3_hw_intr_1491:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1491), 16, 16)) -> intp(1, 0, 1)
	.word 0x98340011  ! 1: ORN_R	orn 	%r16, %r17, %r12
thr3_nuke_intr_1492:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1492), 16, 16)) -> intp(2, 2, 1)
	.word 0x962c285c  ! 1: ANDN_I	andn 	%r16, 0x085c, %r11
thr3_resum_intr_1493:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1493), 16, 16)) -> intp(2, 3, 1)
	.word 0xb00c2f56  ! 1: AND_I	and 	%r16, 0x0f56, %r24
	.word 0x90bc2927  ! 1: XNORcc_I	xnorcc 	%r16, 0x0927, %r8
	.word 0xb4942892  ! 1: ORcc_I	orcc 	%r16, 0x0892, %r26
thr3_nuke_intr_1494:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1494), 16, 16)) -> intp(2, 2, 1)
	.word 0xbb7c0411  ! 1: MOVR_R	move	%r16, %r17, %r29
	.word 0xb1342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x9abc2cca  ! 1: XNORcc_I	xnorcc 	%r16, 0x0cca, %r13
thr3_resum_intr_1495:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1495), 16, 16)) -> intp(2, 3, 1)
	.word 0x88c42584  ! 1: ADDCcc_I	addccc 	%r16, 0x0584, %r4
	.word 0xb29c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0x8a3c2552  ! 1: XNOR_I	xnor 	%r16, 0x0552, %r5
	.word 0xaa0c2ac8  ! 1: AND_I	and 	%r16, 0x0ac8, %r21
thr3_nuke_intr_1496:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1496), 16, 16)) -> intp(2, 2, 1)
	.word 0x94440011  ! 1: ADDC_R	addc 	%r16, %r17, %r10
thr3_resum_intr_1497:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1497), 16, 16)) -> intp(2, 3, 1)
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
	.word 0xae0c2ebd  ! 1: AND_I	and 	%r16, 0x0ebd, %r23
thr3_hw_intr_1498:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1498), 16, 16)) -> intp(0, 0, 1)
	.word 0x992c0011  ! 1: SLL_R	sll 	%r16, %r17, %r12
	.word 0x89341011  ! 1: SRLX_R	srlx	%r16, %r17, %r4
	.word 0xba0421a0  ! 1: ADD_I	add 	%r16, 0x01a0, %r29
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
thr3_nuke_intr_1499:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1499), 16, 16)) -> intp(2, 2, 1)
	.word 0x8ebc2511  ! 1: XNORcc_I	xnorcc 	%r16, 0x0511, %r7
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
	.word 0xb12c0011  ! 1: SLL_R	sll 	%r16, %r17, %r24
	.word 0xb0bc2348  ! 1: XNORcc_I	xnorcc 	%r16, 0x0348, %r24
thr3_resum_intr_1500:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1500), 16, 16)) -> intp(2, 3, 1)
	.word 0xa7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0x9f7c2401  ! 1: MOVR_I	move	%r16, 0x1, %r15
	.word 0x9c04257e  ! 1: ADD_I	add 	%r16, 0x057e, %r14
	.word 0xb60c0011  ! 1: AND_R	and 	%r16, %r17, %r27
thr3_hw_intr_1501:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1501), 16, 16)) -> intp(2, 0, 1)
	.word 0xaec42493  ! 1: ADDCcc_I	addccc 	%r16, 0x0493, %r23
	.word 0xaa040011  ! 1: ADD_R	add 	%r16, %r17, %r21
	.word 0x889c2929  ! 1: XORcc_I	xorcc 	%r16, 0x0929, %r4
thr3_hw_intr_1502:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1502), 16, 16)) -> intp(2, 0, 1)
	.word 0xb8842e9d  ! 1: ADDcc_I	addcc 	%r16, 0x0e9d, %r28
thr3_hw_intr_1503:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_1503), 16, 16)) -> intp(1, 0, 1)
	.word 0xa7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x82bc2aea  ! 1: XNORcc_I	xnorcc 	%r16, 0x0aea, %r1
	.word 0x9894255c  ! 1: ORcc_I	orcc 	%r16, 0x055c, %r12
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
        setx  0x0000000000000d90, %g1, %r17
        setx  0x07f3e2c69956c7cd, %g1, %r0
        setx  0xc9e38e9cabb2bc93, %g1, %r1
        setx  0x4768daa6b0e58e0b, %g1, %r2
        setx  0xaa5faf4feeb1c149, %g1, %r3
        setx  0x953b62ef523bbfdd, %g1, %r4
        setx  0x2d3a1d68c2360ab0, %g1, %r5
        setx  0x5f1fc9b3e73ab496, %g1, %r6
        setx  0x50e68f9704328060, %g1, %r7
        setx  0x9393d67c91fbd83a, %g1, %r8
        setx  0x578ec3e81d6ac913, %g1, %r9
        setx  0x2d35783f6e01c1bd, %g1, %r10
        setx  0x5e9da209ca110038, %g1, %r11
        setx  0x36c38d610092c45d, %g1, %r12
        setx  0xadbaeae18c97cb82, %g1, %r13
        setx  0xb509c78f65dec325, %g1, %r14
        setx  0x4ab31512a6771b49, %g1, %r15
        setx  0x174bab70931be644, %g1, %r18
        setx  0x410ff76ef9076aa1, %g1, %r19
        setx  0x6fd354af763a2591, %g1, %r20
        setx  0xd7a86bf06dd6eb0d, %g1, %r21
        setx  0xfc82ef750f567c7c, %g1, %r22
        setx  0xe1eb66398770e812, %g1, %r23
        setx  0x312778061dbce02f, %g1, %r24
        setx  0xc839fb6b3242b42c, %g1, %r25
        setx  0xdba3df585f2ffd9b, %g1, %r26
        setx  0x2ef4954febb97f6d, %g1, %r27
        setx  0x3cda63c3af208532, %g1, %r28
        setx  0x750dd6f814226bc5, %g1, %r29
        setx  0x0d6c59a1c54d2e8e, %g1, %r30
        setx  0x1d2d024f0f0f35d0, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d40, %g1, %r17
        setx  0xc1d8144ce97fe587, %g1, %r0
        setx  0x510081af03cdc2a9, %g1, %r1
        setx  0xb6ed41760f2f0263, %g1, %r2
        setx  0x434623ccafa6fef0, %g1, %r3
        setx  0x610b1aa64e5f4aba, %g1, %r4
        setx  0x6c8480e812019d77, %g1, %r5
        setx  0x5737e30ea71c9c9a, %g1, %r6
        setx  0xed8e3331b1cdb616, %g1, %r7
        setx  0x6a3b62a15db89b47, %g1, %r8
        setx  0xf19891c8aa073d78, %g1, %r9
        setx  0xdd6a797839a6272b, %g1, %r10
        setx  0x93ba0adb228922d8, %g1, %r11
        setx  0x5ea93ec6f6fc2b77, %g1, %r12
        setx  0x76d3d22019a02db8, %g1, %r13
        setx  0x77b9935b0b692b98, %g1, %r14
        setx  0x9369e9d4ad9cdf9b, %g1, %r15
        setx  0x5c661230aa1c15ec, %g1, %r18
        setx  0x0530e6139616ea27, %g1, %r19
        setx  0xcbf0bb3675a04220, %g1, %r20
        setx  0x11363f6b9726881e, %g1, %r21
        setx  0x652c6a0f48dbc20d, %g1, %r22
        setx  0xc7ee56d9e3721051, %g1, %r23
        setx  0xaad7a0086118a492, %g1, %r24
        setx  0x3de5403f97f97746, %g1, %r25
        setx  0x5f315b2c368e11b1, %g1, %r26
        setx  0xbebd341e2a85f36d, %g1, %r27
        setx  0x8a195ad47b797dd2, %g1, %r28
        setx  0x554ff3801f4121f1, %g1, %r29
        setx  0xe2d67e66e2569f2e, %g1, %r30
        setx  0xa81343a93d3d990b, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000020, %g1, %r17
        setx  0xe9cfc14044d9df9e, %g1, %r0
        setx  0x6efbbace5df0ba53, %g1, %r1
        setx  0x821332eae8895cd3, %g1, %r2
        setx  0x1892bc98395c5852, %g1, %r3
        setx  0x6691fa0346778f7e, %g1, %r4
        setx  0x0e9e6d55cf5305c9, %g1, %r5
        setx  0x07db1c01b16c89fe, %g1, %r6
        setx  0x8794e2c9627db8d6, %g1, %r7
        setx  0x6374fcb4bd7943b2, %g1, %r8
        setx  0x8a89610bc8003ec5, %g1, %r9
        setx  0xe88f9b08ed5d4e07, %g1, %r10
        setx  0x642e1fd7c0338640, %g1, %r11
        setx  0x07a22318fa5834a6, %g1, %r12
        setx  0x7bb09ee25e1cd116, %g1, %r13
        setx  0x3b8867035bb770b4, %g1, %r14
        setx  0x123f9b820db6005d, %g1, %r15
        setx  0xd65c17e748e1b79c, %g1, %r18
        setx  0xd33a45358f923e1c, %g1, %r19
        setx  0xdcff134925b5f9a6, %g1, %r20
        setx  0x4ea86281d6fb38d1, %g1, %r21
        setx  0xad71d851af81e7da, %g1, %r22
        setx  0x4a782973e477ee9e, %g1, %r23
        setx  0xcda2089a50f34eee, %g1, %r24
        setx  0x08d55a0daa452523, %g1, %r25
        setx  0xcba73e72a1a407ad, %g1, %r26
        setx  0x69dbc67b9aba7f9e, %g1, %r27
        setx  0x041ad8258d33524e, %g1, %r28
        setx  0xff32d8f876afd6c8, %g1, %r29
        setx  0x599d114cc006eff3, %g1, %r30
        setx  0x039ccbc811a029c3, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000fd0, %g1, %r17
        setx  0xc0669f7ca8b3b9d9, %g1, %r0
        setx  0xb4a46568b3d3dc58, %g1, %r1
        setx  0x3c1b3bd8cbc12175, %g1, %r2
        setx  0xa0037c38de9849e7, %g1, %r3
        setx  0x36097607e8b9bef0, %g1, %r4
        setx  0xa36e346e23391950, %g1, %r5
        setx  0xadc498e30e00e184, %g1, %r6
        setx  0xb9b9b378823d9c91, %g1, %r7
        setx  0x944f44ed4874b371, %g1, %r8
        setx  0x37973c68bbca3e05, %g1, %r9
        setx  0x1ccf72c9f4f988db, %g1, %r10
        setx  0xd42382e718eddfeb, %g1, %r11
        setx  0xcaaa70eb8ca3b0c0, %g1, %r12
        setx  0x588beae3eee26552, %g1, %r13
        setx  0xc582eb5aff0cc5a6, %g1, %r14
        setx  0x0b83d83eed48f203, %g1, %r15
        setx  0xc14caf63bce45234, %g1, %r18
        setx  0x53ee9038d356b324, %g1, %r19
        setx  0xfffc6fa2f4ca1d69, %g1, %r20
        setx  0xb61cd2860a8ec81d, %g1, %r21
        setx  0x4a82b262d9b0a58a, %g1, %r22
        setx  0x569aa4c20139bed5, %g1, %r23
        setx  0x66179665cc8ccdc0, %g1, %r24
        setx  0xc096e01f21707531, %g1, %r25
        setx  0xcacc46e1dc392eac, %g1, %r26
        setx  0xde7573e784d6fbed, %g1, %r27
        setx  0x0e23d728c94ad815, %g1, %r28
        setx  0x672d88bc2c6df371, %g1, %r29
        setx  0x203fa6a3f09c06ba, %g1, %r30
        setx  0x1c4d4fd26bb0a7ab, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000cf0, %g1, %r17
        setx  0xd6f7b4c36d5aafd4, %g1, %r0
        setx  0xe2d8266392b51074, %g1, %r1
        setx  0x6cf2fddc12a5d519, %g1, %r2
        setx  0xd47088c8515e3cb6, %g1, %r3
        setx  0x1d8d11fd38582b3a, %g1, %r4
        setx  0xae96da87014f08fb, %g1, %r5
        setx  0xe0098fef2fc22d7e, %g1, %r6
        setx  0x9b93e644f22ccb7c, %g1, %r7
        setx  0xc9d48fce5f3a213c, %g1, %r8
        setx  0xe0d590965edef476, %g1, %r9
        setx  0x534c55a161349533, %g1, %r10
        setx  0xa0447ecf599da831, %g1, %r11
        setx  0xf76577b2cd3387bc, %g1, %r12
        setx  0xf02ed93f18ce5dc7, %g1, %r13
        setx  0xf9f31eaef63e65fa, %g1, %r14
        setx  0xc3b22957cd1d9a3c, %g1, %r15
        setx  0x8e3c4555e2d74d4d, %g1, %r18
        setx  0x292ad8856bd46e40, %g1, %r19
        setx  0xbec659740e06263a, %g1, %r20
        setx  0x0df39617e17e56e7, %g1, %r21
        setx  0x9f4f772b93bd1272, %g1, %r22
        setx  0xa39d334930e22b56, %g1, %r23
        setx  0xed568005c89d832f, %g1, %r24
        setx  0x4cc044aeb00a4714, %g1, %r25
        setx  0x896db501d6ed4d25, %g1, %r26
        setx  0xbfcf86d005643bb0, %g1, %r27
        setx  0x75b38b7f9ca247b7, %g1, %r28
        setx  0x81955c46cab86505, %g1, %r29
        setx  0x3cb396f5c9008a53, %g1, %r30
        setx  0x1ea9ce02c391b030, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000006c0, %g1, %r17
        setx  0x3e178fa45f387b16, %g1, %r0
        setx  0xb97f6504be5b379f, %g1, %r1
        setx  0x1e549b3b2f6aca45, %g1, %r2
        setx  0xdb75c4a9498d7abd, %g1, %r3
        setx  0xba3e2e3f151dba2e, %g1, %r4
        setx  0x7ba8a0e1d434b1dc, %g1, %r5
        setx  0xb0e04de7fe5d1085, %g1, %r6
        setx  0x88e5dd181ce1346f, %g1, %r7
        setx  0x03ad645496a83dfa, %g1, %r8
        setx  0x1f4ac853949507e1, %g1, %r9
        setx  0x9fb66f6523efcb41, %g1, %r10
        setx  0xd748c5dd69beeaee, %g1, %r11
        setx  0x36c2815b54b93fc6, %g1, %r12
        setx  0xf6ba0aa0bdc9fe9c, %g1, %r13
        setx  0x9c6d0dbb0a48db9e, %g1, %r14
        setx  0xbd317e743ff887bf, %g1, %r15
        setx  0x549d285f90dbe136, %g1, %r18
        setx  0x166451a5e34c7b0c, %g1, %r19
        setx  0x910b4e6b1e79c8e3, %g1, %r20
        setx  0xf85827e0e3ddadd7, %g1, %r21
        setx  0x247d95cdbf768f90, %g1, %r22
        setx  0xef962925f68d9be2, %g1, %r23
        setx  0xe4d7adfdd3f52968, %g1, %r24
        setx  0x8b05fb858e47c4e8, %g1, %r25
        setx  0x2629c2278a28872a, %g1, %r26
        setx  0xabd2b8650c26daf4, %g1, %r27
        setx  0x0bf13b5c9537da46, %g1, %r28
        setx  0xb7f4b0f36bdb8699, %g1, %r29
        setx  0x0d1c755e388ecd7c, %g1, %r30
        setx  0x41c055be4cea886b, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000bf0, %g1, %r17
        setx  0x1829cc51e8562417, %g1, %r0
        setx  0xa2f33f9f1eb00825, %g1, %r1
        setx  0x2e8c5f8d2614e241, %g1, %r2
        setx  0xe8206b1d20af87de, %g1, %r3
        setx  0x680e77d0192956fc, %g1, %r4
        setx  0xb2694b22d83a726d, %g1, %r5
        setx  0xbfd3155e386fe92a, %g1, %r6
        setx  0xdc60841ff41722bc, %g1, %r7
        setx  0xf9e80a8d4fc8b919, %g1, %r8
        setx  0x52995423fda1a0a9, %g1, %r9
        setx  0x248123ded2ea1884, %g1, %r10
        setx  0xc250c8d17f718e5d, %g1, %r11
        setx  0x5c772245f561cd6a, %g1, %r12
        setx  0x1c726516be40b6f1, %g1, %r13
        setx  0xd626e47d497e4446, %g1, %r14
        setx  0x332840c26e2d9088, %g1, %r15
        setx  0x45b691c410880709, %g1, %r18
        setx  0x9980afedfce3e1d7, %g1, %r19
        setx  0xe7ef420d12c4d596, %g1, %r20
        setx  0xe735f21cf21f0334, %g1, %r21
        setx  0xe9fa4e71ac06201c, %g1, %r22
        setx  0x5d4b4493ef1f0243, %g1, %r23
        setx  0x85eb092b8e8d5e7b, %g1, %r24
        setx  0x7d2b3b64e24d5125, %g1, %r25
        setx  0x618d060550e3501f, %g1, %r26
        setx  0xe9701719e1a1c80a, %g1, %r27
        setx  0xedd8e5fdc44fb75d, %g1, %r28
        setx  0x2dac2161d0c882e2, %g1, %r29
        setx  0x3a6e1d7e51a97df8, %g1, %r30
        setx  0x0d3c17c10a8081a0, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000007a0, %g1, %r17
        setx  0xc078e5c7c9ac6092, %g1, %r0
        setx  0xc198eb25159f4514, %g1, %r1
        setx  0x7bb8404a6258205e, %g1, %r2
        setx  0x0773ece061828fd4, %g1, %r3
        setx  0x15d4312a46d2cdde, %g1, %r4
        setx  0xebbd5a87db7ee5de, %g1, %r5
        setx  0xa88a3f0abf7ed229, %g1, %r6
        setx  0x5715c7ddb1370b71, %g1, %r7
        setx  0x58f977c00c0d2fdf, %g1, %r8
        setx  0x411b6a19a11a2e94, %g1, %r9
        setx  0x7d5e6a1089069d13, %g1, %r10
        setx  0x0b2416da4f338a4b, %g1, %r11
        setx  0xca8bcca9f192a0e0, %g1, %r12
        setx  0x0d85e2221cc95512, %g1, %r13
        setx  0x037e39048b6b055d, %g1, %r14
        setx  0xd720de8973353ca1, %g1, %r15
        setx  0xf3a52790ae1b169c, %g1, %r18
        setx  0x6d26d8cbda07f273, %g1, %r19
        setx  0xa6ee00cc88918485, %g1, %r20
        setx  0x6b0693f5c4779523, %g1, %r21
        setx  0x6a9f0e9035effbe5, %g1, %r22
        setx  0xa25d2b30cb48dd14, %g1, %r23
        setx  0xe716ac009576478e, %g1, %r24
        setx  0xc6b982335a70e5ff, %g1, %r25
        setx  0x08ea4f108b60f2c5, %g1, %r26
        setx  0x6af9d84ac1aa1305, %g1, %r27
        setx  0xf67338edd7ed9ae4, %g1, %r28
        setx  0x7fe6c0791eafda28, %g1, %r29
        setx  0xa7a42dffcf31e08f, %g1, %r30
        setx  0x7a4a6509d596a182, %g1, %r31
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
	.word 0xd70426cb  ! 2: LDF_I	ld	[%r16, 0x06cb], %f11
	.word 0xd1841011  ! 4: LDFA_R	lda	[%r16, %r17], %f8
	.word 0xa61c2300  ! 6: XOR_I	xor 	%r16, 0x0300, %r19
	.word 0xb8c40011  ! 6: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0x94bc0011  ! 6: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x9d7c2401  ! 6: MOVR_I	move	%r16, 0xfffffe34, %r14
	.word 0x99343001  ! 6: SRLX_I	srlx	%r16, 0x0001, %r12
thr2_dc_err_0:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_0), 16, 16),1,DC_DATA,55)
	.word 0xe90427b9  ! 8: LDF_I	ld	[%r16, 0x07b9], %f20
thr2_irf_ce_0:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_0), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xc244232c  ! 10: LDSW_I	ldsw	[%r16 + 0x032c], %r1
	.word 0x852c0011  ! 12: SLL_R	sll 	%r16, %r17, %r2
	.word 0x84840011  ! 12: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x8a442a7c  ! 12: ADDC_I	addc 	%r16, 0x0a7c, %r5
	.word 0xb09c241c  ! 12: XORcc_I	xorcc 	%r16, 0x041c, %r24
	.word 0x9f2c3001  ! 12: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x8f3c1011  ! 12: SRAX_R	srax	%r16, %r17, %r7
	.word 0xaeb40011  ! 12: ORNcc_R	orncc 	%r16, %r17, %r23
	.word 0x8e9c20cd  ! 12: XORcc_I	xorcc 	%r16, 0x00cd, %r7
thr2_dc_err_1:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_1), 16, 16),1,DC_DATA,48)
	.word 0xf21c296e  ! 14: LDD_I	ldd	[%r16 + 0x096e], %r25
!Illinst alu
	.word 0x8aa42e87  ! 16: SUBcc_I	subcc 	%r16, 0x0e87, %r5
	.word 0x94b4281a  ! 18: ORNcc_I	orncc 	%r16, 0x081a, %r10
	.word 0xb4140011  ! 18: OR_R	or 	%r16, %r17, %r26
	.word 0xba2c27e9  ! 18: ANDN_I	andn 	%r16, 0x07e9, %r29
	.word 0x99643801  ! 18: MOVcc_I	<illegal instruction>
	.word 0x849c0011  ! 18: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0xb6440011  ! 18: ADDC_R	addc 	%r16, %r17, %r27
thr2_dc_err_2:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_2), 16, 16),1,DC_DATA,67)
	.word 0xd3140000  ! 20: LDQF_R	-	[%r16, %r0], %f9
	.word 0x8152c000  ! 22: RDPR_CANRESTORE	rdpr	%canrestore, %r0
	.word 0xacb427b4  ! 24: ORNcc_I	orncc 	%r16, 0x07b4, %r22
	.word 0x909c0011  ! 24: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0x853c0011  ! 24: SRA_R	sra 	%r16, %r17, %r2
	.word 0x9c8c0011  ! 24: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x897c2401  ! 24: MOVR_I	move	%r16, 0xfffffe34, %r4
	.word 0x88440011  ! 24: ADDC_R	addc 	%r16, %r17, %r4
	.word 0xf0cc21f4  ! 25: LDSBA_I	ldsba	[%r16, + 0x01f4] %asi, %r24
	.word 0xee842dc8  ! 27: LDUWA_I	lduwa	[%r16, + 0x0dc8] %asi, %r23
	.word 0xb08421bf  ! 29: ADDcc_I	addcc 	%r16, 0x01bf, %r24
	.word 0xa9343001  ! 29: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0x9a440011  ! 29: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x8a8c25a4  ! 29: ANDcc_I	andcc 	%r16, 0x05a4, %r5
	.word 0xaabc2e7c  ! 29: XNORcc_I	xnorcc 	%r16, 0x0e7c, %r21
	.word 0x9a3c0011  ! 29: XNOR_R	xnor 	%r16, %r17, %r13
thr2_dc_err_3:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_3), 16, 16),1,DC_DATA,65)
	.word 0xe89c2125  ! 31: LDDA_I	ldda	[%r16, + 0x0125] %asi, %r20
	.word 0x81580000  ! 33: FLUSHW	flushw
	.word 0x9d643801  ! 35: MOVcc_I	<illegal instruction>
	.word 0x9a142ff2  ! 35: OR_I	or 	%r16, 0x0ff2, %r13
	.word 0xb63c2fd9  ! 35: XNOR_I	xnor 	%r16, 0x0fd9, %r27
	.word 0xa8040011  ! 35: ADD_R	add 	%r16, %r17, %r20
	.word 0x952c2001  ! 35: SLL_I	sll 	%r16, 0x0001, %r10
thr2_dc_err_4:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_4), 16, 16),1,DC_DATA,38)
	.word 0xcf040000  ! 37: LDF_R	ld	[%r16, %r0], %f7
thr2_irf_ce_1:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_1), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0x81494000  ! 39: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0x8eac0011  ! 41: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0xa92c1011  ! 41: SLLX_R	sllx	%r16, %r17, %r20
	.word 0xb2140011  ! 41: OR_R	or 	%r16, %r17, %r25
	.word 0x963c0011  ! 41: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x82b4282d  ! 41: ORNcc_I	orncc 	%r16, 0x082d, %r1
	.word 0xc60c0011  ! 42: LDUB_R	ldub	[%r16 + %r17], %r3
	.word 0xd5841011  ! 44: LDFA_R	lda	[%r16, %r17], %f10
	.word 0x96942608  ! 46: ORcc_I	orcc 	%r16, 0x0608, %r11
	.word 0xae840011  ! 46: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x849c0011  ! 46: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0xb1643801  ! 46: MOVcc_I	<illegal instruction>
	.word 0x853c2001  ! 46: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0x83341011  ! 46: SRLX_R	srlx	%r16, %r17, %r1
	.word 0xb61c2003  ! 46: XOR_I	xor 	%r16, 0x0003, %r27
	.word 0x881c219e  ! 46: XOR_I	xor 	%r16, 0x019e, %r4
	.word 0xc8d42e31  ! 47: LDSHA_I	ldsha	[%r16, + 0x0e31] %asi, %r4
!Illinst alu
	.word 0x977c0411  ! 49: MOVR_R	move	%r16, %r17, %r11
	.word 0xb3341011  ! 51: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x82840011  ! 51: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xab7c2401  ! 51: MOVR_I	move	%r16, 0xfffffe34, %r21
	.word 0xa6c42cce  ! 51: ADDCcc_I	addccc 	%r16, 0x0cce, %r19
	.word 0xa93c0011  ! 51: SRA_R	sra 	%r16, %r17, %r20
	.word 0x85641811  ! 51: MOVcc_R	<illegal instruction>
thr2_dc_err_5:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_5), 16, 16),1,DC_DATA,32)
	.word 0xeb9c1000  ! 53: LDDFA_R	ldda	[%r16, %r0], %f21
thr2_irf_ce_2:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_2), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xdac42bfa  ! 55: LDSWA_I	ldswa	[%r16, + 0x0bfa] %asi, %r13
	.word 0x948c0011  ! 57: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x9a840011  ! 57: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0xba8c0011  ! 57: ANDcc_R	andcc 	%r16, %r17, %r29
	.word 0xb23429ca  ! 57: ORN_I	orn 	%r16, 0x09ca, %r25
	.word 0x8aac0011  ! 57: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0xd3040011  ! 58: LDF_R	ld	[%r16, %r17], %f9
thr2_irf_ce_3:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_3), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xc68c2424  ! 60: LDUBA_I	lduba	[%r16, + 0x0424] %asi, %r3
	.word 0x997c0411  ! 62: MOVR_R	move	%r16, %r17, %r12
	.word 0x840c2f28  ! 62: AND_I	and 	%r16, 0x0f28, %r2
	.word 0x94842656  ! 62: ADDcc_I	addcc 	%r16, 0x0656, %r10
	.word 0xad3c2001  ! 62: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0xb6940011  ! 62: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x9a040011  ! 62: ADD_R	add 	%r16, %r17, %r13
	.word 0x9d2c3001  ! 62: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0xae940011  ! 62: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0xcadc1011  ! 63: LDXA_R	ldxa	[%r16, %r17] 0x80, %r5
thr2_irf_ce_4:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_4), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xc6142600  ! 65: LDUH_I	lduh	[%r16 + 0x0600], %r3
	.word 0x97343001  ! 67: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0xa61425e8  ! 67: OR_I	or 	%r16, 0x05e8, %r19
	.word 0x86940011  ! 67: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x9b340011  ! 67: SRL_R	srl 	%r16, %r17, %r13
	.word 0x842c2e9e  ! 67: ANDN_I	andn 	%r16, 0x0e9e, %r2
	.word 0xa7342001  ! 67: SRL_I	srl 	%r16, 0x0001, %r19
thr2_dc_err_6:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_6), 16, 16),1,DC_DATA,12)
	.word 0xc85c2679  ! 69: LDX_I	ldx	[%r16 + 0x0679], %r4
thr2_irf_ce_5:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_5), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xd24c26cd  ! 71: LDSB_I	ldsb	[%r16 + 0x06cd], %r9
	.word 0xae1c2518  ! 73: XOR_I	xor 	%r16, 0x0518, %r23
	.word 0xa80c229e  ! 73: AND_I	and 	%r16, 0x029e, %r20
	.word 0xb13c2001  ! 73: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0x88040011  ! 73: ADD_R	add 	%r16, %r17, %r4
	.word 0x9ec42c1f  ! 73: ADDCcc_I	addccc 	%r16, 0x0c1f, %r15
	.word 0x948c2c34  ! 73: ANDcc_I	andcc 	%r16, 0x0c34, %r10
	.word 0x96b40011  ! 73: ORNcc_R	orncc 	%r16, %r17, %r11
thr2_dc_err_7:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_7), 16, 16),1,DC_DATA,53)
	.word 0xca4c2867  ! 75: LDSB_I	ldsb	[%r16 + 0x0867], %r5
thr2_irf_ce_6:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_6), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xdc342653  ! 79: STH_I	sth	%r14, [%r16 + 0x0653]
	.word 0x897c0411  ! 81: MOVR_R	move	%r16, %r17, %r4
	.word 0x92c40011  ! 81: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xb4ac0011  ! 81: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0xb01c2f3c  ! 81: XOR_I	xor 	%r16, 0x0f3c, %r24
	.word 0x90840011  ! 81: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x90042bd7  ! 81: ADD_I	add 	%r16, 0x0bd7, %r8
	.word 0x8a9426c8  ! 81: ORcc_I	orcc 	%r16, 0x06c8, %r5
	.word 0xcad4225f  ! 82: LDSHA_I	ldsha	[%r16, + 0x025f] %asi, %r5
	wr      %r0, 0x5, %asr26
	.word 0x85341011  ! 86: SRLX_R	srlx	%r16, %r17, %r2
	.word 0x92942977  ! 86: ORcc_I	orcc 	%r16, 0x0977, %r9
	.word 0x9e14205f  ! 86: OR_I	or 	%r16, 0x005f, %r15
	.word 0x96b42d3e  ! 86: ORNcc_I	orncc 	%r16, 0x0d3e, %r11
	.word 0x88442d93  ! 86: ADDC_I	addc 	%r16, 0x0d93, %r4
	.word 0xc8cc2495  ! 87: LDSBA_I	ldsba	[%r16, + 0x0495] %asi, %r4
	.word 0xf2dc1011  ! 89: LDXA_R	ldxa	[%r16, %r17] 0x80, %r25
	.word 0x90340011  ! 91: ORN_R	orn 	%r16, %r17, %r8
	.word 0x8e340011  ! 91: ORN_R	orn 	%r16, %r17, %r7
	.word 0xaa040011  ! 91: ADD_R	add 	%r16, %r17, %r21
	.word 0xac940011  ! 91: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0x98ac27a4  ! 91: ANDNcc_I	andncc 	%r16, 0x07a4, %r12
	.word 0xaec427b4  ! 91: ADDCcc_I	addccc 	%r16, 0x07b4, %r23
	.word 0x833c0011  ! 91: SRA_R	sra 	%r16, %r17, %r1
thr2_dc_err_8:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_8), 16, 16),1,DC_DATA,42)
	.word 0xd8942647  ! 93: LDUHA_I	lduha	[%r16, + 0x0647] %asi, %r12
	.word 0xd4841011  ! 95: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r10
	.word 0x8a8c0011  ! 97: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0x9d341011  ! 97: SRLX_R	srlx	%r16, %r17, %r14
	.word 0xb88c0011  ! 97: ANDcc_R	andcc 	%r16, %r17, %r28
	.word 0x9694276c  ! 97: ORcc_I	orcc 	%r16, 0x076c, %r11
	.word 0x861c2dae  ! 97: XOR_I	xor 	%r16, 0x0dae, %r3
thr2_dc_err_9:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_9), 16, 16),1,DC_DATA,69)
	.word 0xca5c0000  ! 99: LDX_R	ldx	[%r16 + %r0], %r5
thr2_irf_ce_7:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_7), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xce140011  ! 101: LDUH_R	lduh	[%r16 + %r17], %r7
	.word 0x92ac2e94  ! 103: ANDNcc_I	andncc 	%r16, 0x0e94, %r9
	.word 0x949c20d9  ! 103: XORcc_I	xorcc 	%r16, 0x00d9, %r10
	.word 0xaac40011  ! 103: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0x9d7c2401  ! 103: MOVR_I	move	%r16, 0xfffffe34, %r14
	.word 0xa9643801  ! 103: MOVcc_I	<illegal instruction>
	.word 0xc81c0011  ! 104: LDD_R	ldd	[%r16 + %r17], %r4
	.word 0xc61c226b  ! 106: LDD_I	ldd	[%r16 + 0x026b], %r3
	.word 0x8eb40011  ! 108: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0x8c1c2a30  ! 108: XOR_I	xor 	%r16, 0x0a30, %r6
	.word 0x82040011  ! 108: ADD_R	add 	%r16, %r17, %r1
	.word 0x96c429d5  ! 108: ADDCcc_I	addccc 	%r16, 0x09d5, %r11
	.word 0xb4940011  ! 108: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0x909c0011  ! 108: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0xa92c1011  ! 108: SLLX_R	sllx	%r16, %r17, %r20
thr2_dc_err_10:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_10), 16, 16),1,DC_DATA,40)
	.word 0xcc5c2dc6  ! 110: LDX_I	ldx	[%r16 + 0x0dc6], %r6
thr2_irf_ce_8:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_8), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xd4540011  ! 112: LDSH_R	ldsh	[%r16 + %r17], %r10
	.word 0x88042bdd  ! 114: ADD_I	add 	%r16, 0x0bdd, %r4
	.word 0xb9641811  ! 114: MOVcc_R	<illegal instruction>
	.word 0xa6c40011  ! 114: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x9e3c0011  ! 114: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0x94440011  ! 114: ADDC_R	addc 	%r16, %r17, %r10
	.word 0xd4842e28  ! 115: LDUWA_I	lduwa	[%r16, + 0x0e28] %asi, %r10
thr2_irf_ce_9:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_9), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xc31c0011  ! 117: LDDF_R	ldd	[%r16, %r17], %f1
	.word 0x94340011  ! 119: ORN_R	orn 	%r16, %r17, %r10
	.word 0x823c0011  ! 119: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x92940011  ! 119: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0xb72c1011  ! 119: SLLX_R	sllx	%r16, %r17, %r27
	.word 0x9e3c2a47  ! 119: XNOR_I	xnor 	%r16, 0x0a47, %r15
	.word 0xc28c1011  ! 120: LDUBA_R	lduba	[%r16, %r17] 0x80, %r1
        wr  %g0, 0x80, %asi
	.word 0xb4c42a24  ! 124: ADDCcc_I	addccc 	%r16, 0x0a24, %r26
	.word 0x9d2c0011  ! 124: SLL_R	sll 	%r16, %r17, %r14
	.word 0x821c21e2  ! 124: XOR_I	xor 	%r16, 0x01e2, %r1
	.word 0xa8440011  ! 124: ADDC_R	addc 	%r16, %r17, %r20
	.word 0x89340011  ! 124: SRL_R	srl 	%r16, %r17, %r4
	.word 0xb6c42dcc  ! 124: ADDCcc_I	addccc 	%r16, 0x0dcc, %r27
	.word 0xe71c269e  ! 125: LDDF_I	ldd	[%r16, 0x069e], %f19
thr2_irf_ce_10:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_10), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xd8dc1011  ! 127: LDXA_R	ldxa	[%r16, %r17] 0x80, %r12
	.word 0xa69c2d4c  ! 129: XORcc_I	xorcc 	%r16, 0x0d4c, %r19
	.word 0x872c0011  ! 129: SLL_R	sll 	%r16, %r17, %r3
	.word 0x87342001  ! 129: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0x877c0411  ! 129: MOVR_R	move	%r16, %r17, %r3
	.word 0x8f7c2401  ! 129: MOVR_I	move	%r16, 0xfffffe34, %r7
	.word 0x8ac427a2  ! 129: ADDCcc_I	addccc 	%r16, 0x07a2, %r5
	.word 0xdd040011  ! 130: LDF_R	ld	[%r16, %r17], %f14
	.word 0x81dc201e  ! 132: FLUSH_I	flush
	.word 0x8abc29f2  ! 134: XNORcc_I	xnorcc 	%r16, 0x09f2, %r5
	.word 0x928427c4  ! 134: ADDcc_I	addcc 	%r16, 0x07c4, %r9
	.word 0x94842f01  ! 134: ADDcc_I	addcc 	%r16, 0x0f01, %r10
	.word 0x922c2ab6  ! 134: ANDN_I	andn 	%r16, 0x0ab6, %r9
	.word 0x8e140011  ! 134: OR_R	or 	%r16, %r17, %r7
	.word 0x861c0011  ! 134: XOR_R	xor 	%r16, %r17, %r3
	.word 0xab341011  ! 134: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x96042c33  ! 134: ADD_I	add 	%r16, 0x0c33, %r11
thr2_dc_err_11:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_11), 16, 16),1,DC_DATA,58)
	.word 0xd6440000  ! 136: LDSW_R	ldsw	[%r16 + %r0], %r11
thr2_irf_ce_11:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_11), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xdb1c0011  ! 138: LDDF_R	ldd	[%r16, %r17], %f13
	.word 0x869425a3  ! 140: ORcc_I	orcc 	%r16, 0x05a3, %r3
	.word 0xb52c0011  ! 140: SLL_R	sll 	%r16, %r17, %r26
	.word 0x98bc2e01  ! 140: XNORcc_I	xnorcc 	%r16, 0x0e01, %r12
	.word 0x913c0011  ! 140: SRA_R	sra 	%r16, %r17, %r8
	.word 0x8e042817  ! 140: ADD_I	add 	%r16, 0x0817, %r7
thr2_dc_err_12:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_12), 16, 16),1,DC_DATA,71)
	.word 0xd2540000  ! 142: LDSH_R	ldsh	[%r16 + %r0], %r9
thr2_irf_ce_12:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_12), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xc854257f  ! 144: LDSH_I	ldsh	[%r16 + 0x057f], %r4
	.word 0xb894265f  ! 146: ORcc_I	orcc 	%r16, 0x065f, %r28
	.word 0xb93c1011  ! 146: SRAX_R	srax	%r16, %r17, %r28
	.word 0xbb2c1011  ! 146: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x94140011  ! 146: OR_R	or 	%r16, %r17, %r10
	.word 0x98bc2147  ! 146: XNORcc_I	xnorcc 	%r16, 0x0147, %r12
	.word 0x9c0c2439  ! 146: AND_I	and 	%r16, 0x0439, %r14
thr2_dc_err_13:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_13), 16, 16),1,DC_DATA,56)
	.word 0xe71c0000  ! 148: LDDF_R	ldd	[%r16, %r0], %f19
thr2_resum_intr_1504:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_1504), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x0, %asr26
	.word 0x9ebc2ec1  ! 152: XNORcc_I	xnorcc 	%r16, 0x0ec1, %r15
	.word 0x90bc0011  ! 152: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x8d643801  ! 152: MOVcc_I	<illegal instruction>
	.word 0x93643801  ! 152: MOVcc_I	<illegal instruction>
	.word 0x9c8c0011  ! 152: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0xba940011  ! 152: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0xda8c25c1  ! 153: LDUBA_I	lduba	[%r16, + 0x05c1] %asi, %r13
thr2_irf_ce_13:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_13), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xcadc24a4  ! 155: LDXA_I	ldxa	[%r16, + 0x04a4] %asi, %r5
	.word 0xa72c3001  ! 157: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0x89641811  ! 157: MOVcc_R	<illegal instruction>
	.word 0xb834203a  ! 157: ORN_I	orn 	%r16, 0x003a, %r28
	.word 0x9f3c0011  ! 157: SRA_R	sra 	%r16, %r17, %r15
	.word 0x84840011  ! 157: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0xab341011  ! 157: SRLX_R	srlx	%r16, %r17, %r21
thr2_dc_err_14:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_14), 16, 16),1,DC_DATA,23)
	.word 0xdf1c0000  ! 159: LDDF_R	ldd	[%r16, %r0], %f15
thr2_irf_ce_14:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_14), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xc84c0011  ! 161: LDSB_R	ldsb	[%r16 + %r17], %r4
	.word 0x922c0011  ! 163: ANDN_R	andn 	%r16, %r17, %r9
	.word 0x8ac40011  ! 163: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x8a840011  ! 163: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x9d3c1011  ! 163: SRAX_R	srax	%r16, %r17, %r14
	.word 0x8e3c2358  ! 163: XNOR_I	xnor 	%r16, 0x0358, %r7
	.word 0x962c0011  ! 163: ANDN_R	andn 	%r16, %r17, %r11
	.word 0xcedc1011  ! 164: LDXA_R	ldxa	[%r16, %r17] 0x80, %r7
	.word 0xc3ec1011  ! 166: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x837c0411  ! 168: MOVR_R	move	%r16, %r17, %r1
	.word 0x941c20bc  ! 168: XOR_I	xor 	%r16, 0x00bc, %r10
	.word 0x9b2c1011  ! 168: SLLX_R	sllx	%r16, %r17, %r13
	.word 0x961c0011  ! 168: XOR_R	xor 	%r16, %r17, %r11
	.word 0x8e44235f  ! 168: ADDC_I	addc 	%r16, 0x035f, %r7
	.word 0xacbc0011  ! 168: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0xb6340011  ! 168: ORN_R	orn 	%r16, %r17, %r27
	.word 0x8abc25ad  ! 168: XNORcc_I	xnorcc 	%r16, 0x05ad, %r5
	.word 0xd7142fb3  ! 169: LDQF_I	-	[%r16, 0x0fb3], %f11
	wr      %r0, 0x1, %asr26
	.word 0xaa040011  ! 173: ADD_R	add 	%r16, %r17, %r21
	.word 0xae8c2800  ! 173: ANDcc_I	andcc 	%r16, 0x0800, %r23
	.word 0x8b643801  ! 173: MOVcc_I	<illegal instruction>
	.word 0xab643801  ! 173: MOVcc_I	<illegal instruction>
	.word 0x8f2c1011  ! 173: SLLX_R	sllx	%r16, %r17, %r7
thr2_dc_err_15:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_15), 16, 16),1,DC_DATA,32)
	.word 0xe8841000  ! 175: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r20
	.word 0x88dc0011  ! 177: SMULcc_R	smulcc 	%r16, %r17, %r4
	.word 0x941421d1  ! 179: OR_I	or 	%r16, 0x01d1, %r10
	.word 0x9f2c3001  ! 179: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x893c2001  ! 179: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0xac8c0011  ! 179: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0x877c2401  ! 179: MOVR_I	move	%r16, 0xfffffe34, %r3
	.word 0xa63c0011  ! 179: XNOR_R	xnor 	%r16, %r17, %r19
	.word 0x82342ed5  ! 179: ORN_I	orn 	%r16, 0x0ed5, %r1
	.word 0x91343001  ! 179: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0xf314276b  ! 180: LDQF_I	-	[%r16, 0x076b], %f25
	.word 0xdd040011  ! 182: LDF_R	ld	[%r16, %r17], %f14
	.word 0x8a040011  ! 184: ADD_R	add 	%r16, %r17, %r5
	.word 0xb12c3001  ! 184: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x82042184  ! 184: ADD_I	add 	%r16, 0x0184, %r1
	.word 0xb8842456  ! 184: ADDcc_I	addcc 	%r16, 0x0456, %r28
	.word 0x89643801  ! 184: MOVcc_I	<illegal instruction>
	.word 0x88c429d3  ! 184: ADDCcc_I	addccc 	%r16, 0x09d3, %r4
thr2_dc_err_16:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_16), 16, 16),1,DC_DATA,67)
	.word 0xf48c1000  ! 186: LDUBA_R	lduba	[%r16, %r0] 0x80, %r26
	.word 0x9adc0011  ! 188: SMULcc_R	smulcc 	%r16, %r17, %r13
	.word 0x928428ef  ! 190: ADDcc_I	addcc 	%r16, 0x08ef, %r9
	.word 0x9a1423a0  ! 190: OR_I	or 	%r16, 0x03a0, %r13
	.word 0xa6040011  ! 190: ADD_R	add 	%r16, %r17, %r19
	.word 0x9d340011  ! 190: SRL_R	srl 	%r16, %r17, %r14
	.word 0xa83427fa  ! 190: ORN_I	orn 	%r16, 0x07fa, %r20
thr2_dc_err_17:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_17), 16, 16),1,DC_DATA,13)
	.word 0xd6841000  ! 192: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r11
thr2_irf_ce_15:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_15), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xda540011  ! 194: LDSH_R	ldsh	[%r16 + %r17], %r13
	.word 0x8c2c24f8  ! 196: ANDN_I	andn 	%r16, 0x04f8, %r6
	.word 0xba140011  ! 196: OR_R	or 	%r16, %r17, %r29
	.word 0x9a2c2787  ! 196: ANDN_I	andn 	%r16, 0x0787, %r13
	.word 0x90c422fd  ! 196: ADDCcc_I	addccc 	%r16, 0x02fd, %r8
	.word 0x8e142941  ! 196: OR_I	or 	%r16, 0x0941, %r7
	.word 0x9a340011  ! 196: ORN_R	orn 	%r16, %r17, %r13
thr2_dc_err_18:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_18), 16, 16),1,DC_DATA,45)
	.word 0xd684237d  ! 198: LDUWA_I	lduwa	[%r16, + 0x037d] %asi, %r11
	.word 0xc80c0011  ! 200: LDUB_R	ldub	[%r16 + %r17], %r4
	.word 0x9c1c2106  ! 202: XOR_I	xor 	%r16, 0x0106, %r14
	.word 0x8e0c0011  ! 202: AND_R	and 	%r16, %r17, %r7
	.word 0xb2840011  ! 202: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0x87641811  ! 202: MOVcc_R	<illegal instruction>
	.word 0x82ac0011  ! 202: ANDNcc_R	andncc 	%r16, %r17, %r1
thr2_dc_err_19:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_19), 16, 16),1,DC_DATA,29)
	.word 0xd9941000  ! 204: LDQFA_R	-	[%r16, %r0], %f12
thr2_irf_ce_16:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_16), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xc82c2259  ! 208: STB_I	stb	%r4, [%r16 + 0x0259]
	.word 0x8cb420f5  ! 210: ORNcc_I	orncc 	%r16, 0x00f5, %r6
	.word 0x8eb40011  ! 210: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0xb2440011  ! 210: ADDC_R	addc 	%r16, %r17, %r25
	.word 0x828c2d9c  ! 210: ANDcc_I	andcc 	%r16, 0x0d9c, %r1
	.word 0xab342001  ! 210: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x8b3c2001  ! 210: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x86840011  ! 210: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0xb6840011  ! 210: ADDcc_R	addcc 	%r16, %r17, %r27
thr2_dc_err_20:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_20), 16, 16),1,DC_DATA,48)
	.word 0xf9941000  ! 212: LDQFA_R	-	[%r16, %r0], %f28
!Illinst store
	.word 0xc82c0011  ! 214: STB_R	stb	%r4, [%r16 + %r17]
	.word 0xb01c2449  ! 216: XOR_I	xor 	%r16, 0x0449, %r24
	.word 0x86ac0011  ! 216: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0x8c14254e  ! 216: OR_I	or 	%r16, 0x054e, %r6
	.word 0xb72c2001  ! 216: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0x929c2c03  ! 216: XORcc_I	xorcc 	%r16, 0x0c03, %r9
	.word 0x8e440011  ! 216: ADDC_R	addc 	%r16, %r17, %r7
	.word 0xae8c237d  ! 216: ANDcc_I	andcc 	%r16, 0x037d, %r23
	.word 0xeacc1011  ! 217: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r21
thr2_irf_ce_17:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_17), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xf6d41011  ! 219: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r27
	.word 0x84c40011  ! 221: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x93341011  ! 221: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x8c840011  ! 221: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x832c0011  ! 221: SLL_R	sll 	%r16, %r17, %r1
	.word 0x9c3c0011  ! 221: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x973c0011  ! 221: SRA_R	sra 	%r16, %r17, %r11
	.word 0xe81c2dab  ! 222: LDD_I	ldd	[%r16 + 0x0dab], %r20
thr2_irf_ce_18:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_18), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xde9c1011  ! 224: LDDA_R	ldda	[%r16, %r17] 0x80, %r15
	.word 0xacac25a3  ! 226: ANDNcc_I	andncc 	%r16, 0x05a3, %r22
	.word 0x932c0011  ! 226: SLL_R	sll 	%r16, %r17, %r9
	.word 0x9e3c24b6  ! 226: XNOR_I	xnor 	%r16, 0x04b6, %r15
	.word 0x82840011  ! 226: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x8a0c29c6  ! 226: AND_I	and 	%r16, 0x09c6, %r5
	.word 0x92940011  ! 226: ORcc_R	orcc 	%r16, %r17, %r9
thr2_dc_err_21:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_21), 16, 16),1,DC_DATA,0)
	.word 0xce1c2be7  ! 228: LDD_I	ldd	[%r16 + 0x0be7], %r7
thr2_irf_ce_19:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_19), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0x8143e021  ! 230: MEMBAR	membar	#LoadLoad | #MemIssue 
	.word 0xad3c1011  ! 232: SRAX_R	srax	%r16, %r17, %r22
	.word 0x8eb42e28  ! 232: ORNcc_I	orncc 	%r16, 0x0e28, %r7
	.word 0x980428f2  ! 232: ADD_I	add 	%r16, 0x08f2, %r12
	.word 0x832c1011  ! 232: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x8c9c2500  ! 232: XORcc_I	xorcc 	%r16, 0x0500, %r6
	.word 0xa9343001  ! 232: SRLX_I	srlx	%r16, 0x0001, %r20
thr2_dc_err_22:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_22), 16, 16),1,DC_DATA,42)
	.word 0xf39c1000  ! 234: LDDFA_R	ldda	[%r16, %r0], %f25
thr2_irf_ce_20:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_20), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xc9040011  ! 236: LDF_R	ld	[%r16, %r17], %f4
	.word 0x8e1c0011  ! 238: XOR_R	xor 	%r16, %r17, %r7
	.word 0xae0c2731  ! 238: AND_I	and 	%r16, 0x0731, %r23
	.word 0xb9342001  ! 238: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0xb8840011  ! 238: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0x868c0011  ! 238: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x840c0011  ! 238: AND_R	and 	%r16, %r17, %r2
	.word 0x9c3c26f0  ! 238: XNOR_I	xnor 	%r16, 0x06f0, %r14
	.word 0xae040011  ! 238: ADD_R	add 	%r16, %r17, %r23
	.word 0xd0c42a74  ! 239: LDSWA_I	ldswa	[%r16, + 0x0a74] %asi, %r8
thr2_irf_ce_21:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_21), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	wr      %r0, 0x5, %asr26
	.word 0x862c0011  ! 243: ANDN_R	andn 	%r16, %r17, %r3
	.word 0xb61c0011  ! 243: XOR_R	xor 	%r16, %r17, %r27
	.word 0x88340011  ! 243: ORN_R	orn 	%r16, %r17, %r4
	.word 0x96840011  ! 243: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0x8e040011  ! 243: ADD_R	add 	%r16, %r17, %r7
	.word 0x88ac2802  ! 243: ANDNcc_I	andncc 	%r16, 0x0802, %r4
	.word 0x8d2c2001  ! 243: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0x8ab42cd1  ! 243: ORNcc_I	orncc 	%r16, 0x0cd1, %r5
thr2_dc_err_23:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_23), 16, 16),1,DC_DATA,31)
	.word 0xc80c2cb8  ! 245: LDUB_I	ldub	[%r16 + 0x0cb8], %r4
!Illinst alu
	.word 0x848c2bad  ! 247: ANDcc_I	andcc 	%r16, 0x0bad, %r2
	.word 0x86c427bb  ! 249: ADDCcc_I	addccc 	%r16, 0x07bb, %r3
	.word 0x9ec427da  ! 249: ADDCcc_I	addccc 	%r16, 0x07da, %r15
	.word 0x943c2ad1  ! 249: XNOR_I	xnor 	%r16, 0x0ad1, %r10
	.word 0x923c2844  ! 249: XNOR_I	xnor 	%r16, 0x0844, %r9
	.word 0xae142861  ! 249: OR_I	or 	%r16, 0x0861, %r23
	.word 0xd0dc1011  ! 250: LDXA_R	ldxa	[%r16, %r17] 0x80, %r8
!Illinst store
	.word 0xd6240011  ! 252: STW_R	stw	%r11, [%r16 + %r17]
	.word 0x9b2c2001  ! 254: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0x94440011  ! 254: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x980c0011  ! 254: AND_R	and 	%r16, %r17, %r12
	.word 0x923426da  ! 254: ORN_I	orn 	%r16, 0x06da, %r9
	.word 0x90140011  ! 254: OR_R	or 	%r16, %r17, %r8
	.word 0xe7040011  ! 255: LDF_R	ld	[%r16, %r17], %f19
!Illinst store
	.word 0xf6340011  ! 257: STH_R	sth	%r27, [%r16 + %r17]
	.word 0xb09c2e29  ! 259: XORcc_I	xorcc 	%r16, 0x0e29, %r24
	.word 0x92940011  ! 259: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0xb0ac2055  ! 259: ANDNcc_I	andncc 	%r16, 0x0055, %r24
	.word 0x963c2075  ! 259: XNOR_I	xnor 	%r16, 0x0075, %r11
	.word 0x8cc42d63  ! 259: ADDCcc_I	addccc 	%r16, 0x0d63, %r6
	.word 0x837c2401  ! 259: MOVR_I	move	%r16, 0xfffffe34, %r1
	.word 0xec140011  ! 260: LDUH_R	lduh	[%r16 + %r17], %r22
	.word 0xdcc41011  ! 262: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r14
	.word 0xb28c0011  ! 264: ANDcc_R	andcc 	%r16, %r17, %r25
	.word 0xae3c0011  ! 264: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0xb844290b  ! 264: ADDC_I	addc 	%r16, 0x090b, %r28
	.word 0x933c2001  ! 264: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x8c940011  ! 264: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0x9ec40011  ! 264: ADDCcc_R	addccc 	%r16, %r17, %r15
thr2_dc_err_24:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_24), 16, 16),1,DC_DATA,29)
	.word 0xf71c2733  ! 266: LDDF_I	ldd	[%r16, 0x0733], %f27
thr2_irf_ce_22:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_22), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xdb0425d0  ! 268: LDF_I	ld	[%r16, 0x05d0], %f13
	.word 0xaa3423b3  ! 270: ORN_I	orn 	%r16, 0x03b3, %r21
	.word 0x95343001  ! 270: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0x9a2c0011  ! 270: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x981c2860  ! 270: XOR_I	xor 	%r16, 0x0860, %r12
	.word 0x8a942ab6  ! 270: ORcc_I	orcc 	%r16, 0x0ab6, %r5
	.word 0x9a8426dd  ! 270: ADDcc_I	addcc 	%r16, 0x06dd, %r13
	.word 0x8d343001  ! 270: SRLX_I	srlx	%r16, 0x0001, %r6
thr2_dc_err_25:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_25), 16, 16),1,DC_DATA,15)
	.word 0xce1c0000  ! 272: LDD_R	ldd	[%r16 + %r0], %r7
thr2_irf_ce_23:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_23), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xdc540011  ! 274: LDSH_R	ldsh	[%r16 + %r17], %r14
	.word 0xb88c29b2  ! 276: ANDcc_I	andcc 	%r16, 0x09b2, %r28
	.word 0xb8bc2265  ! 276: XNORcc_I	xnorcc 	%r16, 0x0265, %r28
	.word 0x8d2c3001  ! 276: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0x92bc0011  ! 276: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x86340011  ! 276: ORN_R	orn 	%r16, %r17, %r3
	.word 0x88940011  ! 276: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x9ac40011  ! 276: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x8a9c2c73  ! 276: XORcc_I	xorcc 	%r16, 0x0c73, %r5
thr2_dc_err_26:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_26), 16, 16),1,DC_DATA,63)
	.word 0xe71c0000  ! 278: LDDF_R	ldd	[%r16, %r0], %f19
thr2_irf_ce_24:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_24), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xea841011  ! 280: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r21
	.word 0x84942f8e  ! 282: ORcc_I	orcc 	%r16, 0x0f8e, %r2
	.word 0xb83c2536  ! 282: XNOR_I	xnor 	%r16, 0x0536, %r28
	.word 0x82340011  ! 282: ORN_R	orn 	%r16, %r17, %r1
	.word 0xaaac0011  ! 282: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0xaabc0011  ! 282: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0xb0040011  ! 282: ADD_R	add 	%r16, %r17, %r24
	.word 0x924420c6  ! 282: ADDC_I	addc 	%r16, 0x00c6, %r9
	.word 0xce5c0011  ! 283: LDX_R	ldx	[%r16 + %r17], %r7
	.word 0xc44c0011  ! 285: LDSB_R	ldsb	[%r16 + %r17], %r2
	.word 0xac3c22ad  ! 287: XNOR_I	xnor 	%r16, 0x02ad, %r22
	.word 0xad342001  ! 287: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0x9eac2489  ! 287: ANDNcc_I	andncc 	%r16, 0x0489, %r15
	.word 0x9a340011  ! 287: ORN_R	orn 	%r16, %r17, %r13
	.word 0x85342001  ! 287: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0xaf3c2001  ! 287: SRA_I	sra 	%r16, 0x0001, %r23
	.word 0xb0440011  ! 287: ADDC_R	addc 	%r16, %r17, %r24
thr2_dc_err_27:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_27), 16, 16),1,DC_DATA,56)
	.word 0xd7841000  ! 289: LDFA_R	lda	[%r16, %r0], %f11
thr2_irf_ce_25:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_25), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xd28c1011  ! 291: LDUBA_R	lduba	[%r16, %r17] 0x80, %r9
	.word 0x94c424ee  ! 293: ADDCcc_I	addccc 	%r16, 0x04ee, %r10
	.word 0x9a840011  ! 293: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x961c0011  ! 293: XOR_R	xor 	%r16, %r17, %r11
	.word 0x937c0411  ! 293: MOVR_R	move	%r16, %r17, %r9
	.word 0x92940011  ! 293: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x8e8c2487  ! 293: ANDcc_I	andcc 	%r16, 0x0487, %r7
	.word 0x94ac27bb  ! 293: ANDNcc_I	andncc 	%r16, 0x07bb, %r10
	.word 0x912c2001  ! 293: SLL_I	sll 	%r16, 0x0001, %r8
thr2_dc_err_28:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_28), 16, 16),1,DC_DATA,70)
	.word 0xf01c0000  ! 295: LDD_R	ldd	[%r16 + %r0], %r24
thr2_irf_ce_26:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_26), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
        wr  %g0, 0x80, %asi
	.word 0x9814255d  ! 299: OR_I	or 	%r16, 0x055d, %r12
	.word 0x94c40011  ! 299: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0xb72c0011  ! 299: SLL_R	sll 	%r16, %r17, %r27
	.word 0xba942010  ! 299: ORcc_I	orcc 	%r16, 0x0010, %r29
	.word 0x8e0c0011  ! 299: AND_R	and 	%r16, %r17, %r7
	.word 0x94c4297c  ! 299: ADDCcc_I	addccc 	%r16, 0x097c, %r10
	.word 0xb8c40011  ! 299: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0xc48424aa  ! 300: LDUWA_I	lduwa	[%r16, + 0x04aa] %asi, %r2
!Illinst alu
	.word 0xb0ac0011  ! 302: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0x9cb40011  ! 304: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x8a3c2e45  ! 304: XNOR_I	xnor 	%r16, 0x0e45, %r5
	.word 0xaf2c2001  ! 304: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0x869c2172  ! 304: XORcc_I	xorcc 	%r16, 0x0172, %r3
	.word 0xb1343001  ! 304: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xa6c42b4c  ! 304: ADDCcc_I	addccc 	%r16, 0x0b4c, %r19
	.word 0xcadc2c22  ! 305: LDXA_I	ldxa	[%r16, + 0x0c22] %asi, %r5
	wr      %r0, 0x1, %asr26
	.word 0xa60c0011  ! 309: AND_R	and 	%r16, %r17, %r19
	.word 0x9f7c0411  ! 309: MOVR_R	move	%r16, %r17, %r15
	.word 0x902c0011  ! 309: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x84340011  ! 309: ORN_R	orn 	%r16, %r17, %r2
	.word 0x988c2aff  ! 309: ANDcc_I	andcc 	%r16, 0x0aff, %r12
	.word 0x8434211d  ! 309: ORN_I	orn 	%r16, 0x011d, %r2
	.word 0xa68425ce  ! 309: ADDcc_I	addcc 	%r16, 0x05ce, %r19
	.word 0x94140011  ! 309: OR_R	or 	%r16, %r17, %r10
	.word 0xde4c0011  ! 310: LDSB_R	ldsb	[%r16 + %r17], %r15
thr2_irf_ce_27:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_27), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xcf040011  ! 312: LDF_R	ld	[%r16, %r17], %f7
	.word 0x98842505  ! 314: ADDcc_I	addcc 	%r16, 0x0505, %r12
	.word 0x8ebc0011  ! 314: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x892c3001  ! 314: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0xb4340011  ! 314: ORN_R	orn 	%r16, %r17, %r26
	.word 0xae3c2fd8  ! 314: XNOR_I	xnor 	%r16, 0x0fd8, %r23
thr2_dc_err_29:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_29), 16, 16),1,DC_DATA,53)
	.word 0xcb140000  ! 316: LDQF_R	-	[%r16, %r0], %f5
	.word 0x81dc0011  ! 318: FLUSH_R	flush
	.word 0x960c0011  ! 320: AND_R	and 	%r16, %r17, %r11
	.word 0x952c3001  ! 320: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0xa8140011  ! 320: OR_R	or 	%r16, %r17, %r20
	.word 0xa614299b  ! 320: OR_I	or 	%r16, 0x099b, %r19
	.word 0xb2ac0011  ! 320: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0x94c42359  ! 320: ADDCcc_I	addccc 	%r16, 0x0359, %r10
	.word 0xcedc1011  ! 321: LDXA_R	ldxa	[%r16, %r17] 0x80, %r7
	.word 0xe7040011  ! 323: LDF_R	ld	[%r16, %r17], %f19
	.word 0xaeac0011  ! 325: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0x85341011  ! 325: SRLX_R	srlx	%r16, %r17, %r2
	.word 0xb84423bc  ! 325: ADDC_I	addc 	%r16, 0x03bc, %r28
	.word 0x829c2323  ! 325: XORcc_I	xorcc 	%r16, 0x0323, %r1
	.word 0x840426b2  ! 325: ADD_I	add 	%r16, 0x06b2, %r2
	.word 0x983c0011  ! 325: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0xb4940011  ! 325: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0xcb14221d  ! 326: LDQF_I	-	[%r16, 0x021d], %f5
thr2_irf_ce_28:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_28), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xd91c2da0  ! 328: LDDF_I	ldd	[%r16, 0x0da0], %f12
	.word 0x861421f3  ! 330: OR_I	or 	%r16, 0x01f3, %r3
	.word 0xa6bc2361  ! 330: XNORcc_I	xnorcc 	%r16, 0x0361, %r19
	.word 0xa77c0411  ! 330: MOVR_R	move	%r16, %r17, %r19
	.word 0x988c224b  ! 330: ANDcc_I	andcc 	%r16, 0x024b, %r12
	.word 0x9d641811  ! 330: MOVcc_R	<illegal instruction>
thr2_dc_err_30:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_30), 16, 16),1,DC_DATA,62)
	.word 0xdccc1000  ! 332: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r14
	.word 0x81880000  ! 334: SAVED	saved
	.word 0xb2440011  ! 336: ADDC_R	addc 	%r16, %r17, %r25
	.word 0x8f641811  ! 336: MOVcc_R	<illegal instruction>
	.word 0xac842441  ! 336: ADDcc_I	addcc 	%r16, 0x0441, %r22
	.word 0x99342001  ! 336: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x8e9c0011  ! 336: XORcc_R	xorcc 	%r16, %r17, %r7
thr2_dc_err_31:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_31), 16, 16),1,DC_DATA,61)
	.word 0xd31c25bf  ! 338: LDDF_I	ldd	[%r16, 0x05bf], %f9
thr2_irf_ce_29:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_29), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xda2c2d34  ! 342: STB_I	stb	%r13, [%r16 + 0x0d34]
	.word 0x9e8c0011  ! 344: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x860c2d77  ! 344: AND_I	and 	%r16, 0x0d77, %r3
	.word 0x83641811  ! 344: MOVcc_R	<illegal instruction>
	.word 0xaa2c0011  ! 344: ANDN_R	andn 	%r16, %r17, %r21
	.word 0x94ac0011  ! 344: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xdc9c1011  ! 345: LDDA_R	ldda	[%r16, %r17] 0x80, %r14
	.word 0xdc2c2819  ! 349: STB_I	stb	%r14, [%r16 + 0x0819]
	.word 0x96c42f99  ! 351: ADDCcc_I	addccc 	%r16, 0x0f99, %r11
	.word 0x8ac42102  ! 351: ADDCcc_I	addccc 	%r16, 0x0102, %r5
	.word 0x9e040011  ! 351: ADD_R	add 	%r16, %r17, %r15
	.word 0x93343001  ! 351: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0xaa840011  ! 351: ADDcc_R	addcc 	%r16, %r17, %r21
	.word 0xb12c3001  ! 351: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0xc65425b6  ! 352: LDSH_I	ldsh	[%r16 + 0x05b6], %r3
thr2_irf_ce_30:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_30), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xcc2420dc  ! 356: STW_I	stw	%r6, [%r16 + 0x00dc]
	.word 0x8f7c0411  ! 358: MOVR_R	move	%r16, %r17, %r7
	.word 0x98b40011  ! 358: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x842c0011  ! 358: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x9c342747  ! 358: ORN_I	orn 	%r16, 0x0747, %r14
	.word 0x9f340011  ! 358: SRL_R	srl 	%r16, %r17, %r15
	.word 0xc81c2243  ! 359: LDD_I	ldd	[%r16 + 0x0243], %r4
thr2_irf_ce_31:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_31), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xd01c0011  ! 361: LDD_R	ldd	[%r16 + %r17], %r8
	.word 0x8ec40011  ! 363: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0x9c3c2411  ! 363: XNOR_I	xnor 	%r16, 0x0411, %r14
	.word 0x973c0011  ! 363: SRA_R	sra 	%r16, %r17, %r11
	.word 0x82b40011  ! 363: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x96142077  ! 363: OR_I	or 	%r16, 0x0077, %r11
	.word 0x9d2c1011  ! 363: SLLX_R	sllx	%r16, %r17, %r14
	.word 0xba9c0011  ! 363: XORcc_R	xorcc 	%r16, %r17, %r29
	.word 0x92bc0011  ! 363: XNORcc_R	xnorcc 	%r16, %r17, %r9
thr2_dc_err_32:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_32), 16, 16),1,DC_DATA,36)
	.word 0xf64c0000  ! 365: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xf53c0011  ! 367: STDF_R	std	%f26, [%r17, %r16]
	.word 0x868c2a46  ! 369: ANDcc_I	andcc 	%r16, 0x0a46, %r3
	.word 0xba3c0011  ! 369: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x8ec42ecd  ! 369: ADDCcc_I	addccc 	%r16, 0x0ecd, %r7
	.word 0x8a340011  ! 369: ORN_R	orn 	%r16, %r17, %r5
	.word 0x992c1011  ! 369: SLLX_R	sllx	%r16, %r17, %r12
	.word 0xd8d42f27  ! 370: LDSHA_I	ldsha	[%r16, + 0x0f27] %asi, %r12
thr2_irf_ce_32:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_32), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
thr2_resum_intr_1505:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_1505), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x8cc4274d  ! 374: ADDCcc_I	addccc 	%r16, 0x074d, %r6
	.word 0x862c263f  ! 374: ANDN_I	andn 	%r16, 0x063f, %r3
	.word 0x9cc422c6  ! 374: ADDCcc_I	addccc 	%r16, 0x02c6, %r14
	.word 0x832c0011  ! 374: SLL_R	sll 	%r16, %r17, %r1
	.word 0x8f7c2401  ! 374: MOVR_I	move	%r16, 0xfffffe34, %r7
	.word 0xb03c2186  ! 374: XNOR_I	xnor 	%r16, 0x0186, %r24
	.word 0x89342001  ! 374: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0xae942cfc  ! 375: ORcc_I	orcc 	%r16, 0x0cfc, %r23
	.word 0xb8140011  ! 375: OR_R	or 	%r16, %r17, %r28
	.word 0xae940011  ! 375: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0x921c0011  ! 375: XOR_R	xor 	%r16, %r17, %r9
	.word 0x82442649  ! 375: ADDC_I	addc 	%r16, 0x0649, %r1
	.word 0x98940011  ! 375: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x9a8c24ca  ! 375: ANDcc_I	andcc 	%r16, 0x04ca, %r13
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xc3941011  ! 375: LDQFA_R	-	[%r16, %r17], %f1
	return     %r18 + 0x20
	.word 0xa82c2e0d  ! 378: ANDN_I	andn 	%r16, 0x0e0d, %r20
	.word 0x96b40011  ! 378: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0x8f641811  ! 378: MOVcc_R	<illegal instruction>
	.word 0x869421a5  ! 378: ORcc_I	orcc 	%r16, 0x01a5, %r3
	.word 0x909426e4  ! 378: ORcc_I	orcc 	%r16, 0x06e4, %r8
	.word 0xba34231c  ! 378: ORN_I	orn 	%r16, 0x031c, %r29
	.word 0xe8dc202c  ! 379: LDXA_I	ldxa	[%r16, + 0x002c] %asi, %r20
thr2_irf_ce_33:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_33), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xc3042d1d  ! 381: LDF_I	ld	[%r16, 0x0d1d], %f1
	.word 0xb8040011  ! 383: ADD_R	add 	%r16, %r17, %r28
	.word 0xb0bc20ac  ! 383: XNORcc_I	xnorcc 	%r16, 0x00ac, %r24
	.word 0xb62c2747  ! 383: ANDN_I	andn 	%r16, 0x0747, %r27
	.word 0x88c42988  ! 383: ADDCcc_I	addccc 	%r16, 0x0988, %r4
	.word 0x8a142d18  ! 383: OR_I	or 	%r16, 0x0d18, %r5
	.word 0x9b340011  ! 383: SRL_R	srl 	%r16, %r17, %r13
	.word 0x932c1011  ! 383: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x849c0011  ! 383: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0xed941011  ! 384: LDQFA_R	-	[%r16, %r17], %f22
thr2_irf_ce_34:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_34), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xef1c0011  ! 386: LDDF_R	ldd	[%r16, %r17], %f23
	.word 0x880c2b6f  ! 388: AND_I	and 	%r16, 0x0b6f, %r4
	.word 0xa7641811  ! 388: MOVcc_R	<illegal instruction>
	.word 0xb37c0411  ! 388: MOVR_R	move	%r16, %r17, %r25
	.word 0x90942200  ! 388: ORcc_I	orcc 	%r16, 0x0200, %r8
	.word 0xb2342b16  ! 388: ORN_I	orn 	%r16, 0x0b16, %r25
	.word 0x9a840011  ! 388: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x86040011  ! 388: ADD_R	add 	%r16, %r17, %r3
	.word 0xb80c25f2  ! 388: AND_I	and 	%r16, 0x05f2, %r28
thr2_dc_err_33:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_33), 16, 16),1,DC_DATA,40)
	.word 0xcb1c0000  ! 390: LDDF_R	ldd	[%r16, %r0], %f5
thr2_irf_ce_35:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_35), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
thr2_resum_intr_1506:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_1506), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x8ec4237f  ! 394: ADDCcc_I	addccc 	%r16, 0x037f, %r7
	.word 0x98ac0011  ! 394: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x98840011  ! 394: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x9d641811  ! 394: MOVcc_R	<illegal instruction>
	.word 0xb57c0411  ! 394: MOVR_R	move	%r16, %r17, %r26
	.word 0xcf9c1011  ! 395: LDDFA_R	ldda	[%r16, %r17], %f7
thr2_irf_ce_36:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_36), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xee4c2155  ! 397: LDSB_I	ldsb	[%r16 + 0x0155], %r23
	.word 0xb6140011  ! 399: OR_R	or 	%r16, %r17, %r27
	.word 0xa88c0011  ! 399: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0x93641811  ! 399: MOVcc_R	<illegal instruction>
	.word 0x96ac0011  ! 399: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x94ac0011  ! 399: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xbb3c1011  ! 399: SRAX_R	srax	%r16, %r17, %r29
	.word 0xc5040011  ! 400: LDF_R	ld	[%r16, %r17], %f2
	.word 0xc36c2478  ! 402: PREFETCH_I	prefetch	[%r16 + 0x0478], #one_read
	.word 0x82340011  ! 404: ORN_R	orn 	%r16, %r17, %r1
	.word 0x86142b20  ! 404: OR_I	or 	%r16, 0x0b20, %r3
	.word 0x8b7c0411  ! 404: MOVR_R	move	%r16, %r17, %r5
	.word 0xb2942dc6  ! 404: ORcc_I	orcc 	%r16, 0x0dc6, %r25
	.word 0x9f2c2001  ! 404: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0x90bc2da0  ! 404: XNORcc_I	xnorcc 	%r16, 0x0da0, %r8
	.word 0xaf7c2401  ! 404: MOVR_I	move	%r16, 0xfffffe34, %r23
thr2_dc_err_34:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_34), 16, 16),1,DC_DATA,67)
	.word 0xcecc2841  ! 406: LDSBA_I	ldsba	[%r16, + 0x0841] %asi, %r7
thr2_irf_ce_37:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_37), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xd71c0011  ! 408: LDDF_R	ldd	[%r16, %r17], %f11
	.word 0xa83c0011  ! 410: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0x893c2001  ! 410: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0x9e8c26ed  ! 410: ANDcc_I	andcc 	%r16, 0x06ed, %r15
	.word 0x8ec42f54  ! 410: ADDCcc_I	addccc 	%r16, 0x0f54, %r7
	.word 0xa63422a8  ! 410: ORN_I	orn 	%r16, 0x02a8, %r19
thr2_dc_err_35:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_35), 16, 16),1,DC_DATA,56)
	.word 0xd1142ac7  ! 412: LDQF_I	-	[%r16, 0x0ac7], %f8
thr2_irf_ce_38:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_38), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xde0c0011  ! 414: LDUB_R	ldub	[%r16 + %r17], %r15
	.word 0x9f2c3001  ! 416: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0xa80c0011  ! 416: AND_R	and 	%r16, %r17, %r20
	.word 0x88140011  ! 416: OR_R	or 	%r16, %r17, %r4
	.word 0x92b40011  ! 416: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xaaac0011  ! 416: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0x9a9421c1  ! 416: ORcc_I	orcc 	%r16, 0x01c1, %r13
thr2_dc_err_36:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_36), 16, 16),1,DC_DATA,64)
	.word 0xf8cc1000  ! 418: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r28
	.word 0x927c2fb3  ! 420: SDIV_I	sdiv 	%r16, 0x0fb3, %r9
	.word 0x8e2c0011  ! 422: ANDN_R	andn 	%r16, %r17, %r7
	.word 0x823c0011  ! 422: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x889c0011  ! 422: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x8a9427cf  ! 422: ORcc_I	orcc 	%r16, 0x07cf, %r5
	.word 0xb2942779  ! 422: ORcc_I	orcc 	%r16, 0x0779, %r25
	.word 0xb6bc0011  ! 422: XNORcc_R	xnorcc 	%r16, %r17, %r27
thr2_dc_err_37:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_37), 16, 16),1,DC_DATA,32)
	.word 0xd2942a31  ! 424: LDUHA_I	lduha	[%r16, + 0x0a31] %asi, %r9
thr2_irf_ce_39:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_39), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf83429c1  ! 428: STH_I	sth	%r28, [%r16 + 0x09c1]
	.word 0x94340011  ! 430: ORN_R	orn 	%r16, %r17, %r10
	.word 0x9e3c29e2  ! 430: XNOR_I	xnor 	%r16, 0x09e2, %r15
	.word 0xaebc2f40  ! 430: XNORcc_I	xnorcc 	%r16, 0x0f40, %r23
	.word 0x829c2af9  ! 430: XORcc_I	xorcc 	%r16, 0x0af9, %r1
	.word 0x88940011  ! 430: ORcc_R	orcc 	%r16, %r17, %r4
thr2_dc_err_38:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_38), 16, 16),1,DC_DATA,44)
	.word 0xde8c25dd  ! 432: LDUBA_I	lduba	[%r16, + 0x05dd] %asi, %r15
	.word 0xcec420b8  ! 434: LDSWA_I	ldswa	[%r16, + 0x00b8] %asi, %r7
	.word 0xacc40011  ! 436: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0xac040011  ! 436: ADD_R	add 	%r16, %r17, %r22
	.word 0xb9341011  ! 436: SRLX_R	srlx	%r16, %r17, %r28
	.word 0x968c2dc1  ! 436: ANDcc_I	andcc 	%r16, 0x0dc1, %r11
	.word 0x97340011  ! 436: SRL_R	srl 	%r16, %r17, %r11
	.word 0xbb343001  ! 436: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0xc59c1011  ! 437: LDDFA_R	ldda	[%r16, %r17], %f2
	.word 0xd09c1011  ! 439: LDDA_R	ldda	[%r16, %r17] 0x80, %r8
	.word 0xac8c2864  ! 441: ANDcc_I	andcc 	%r16, 0x0864, %r22
	.word 0x98140011  ! 441: OR_R	or 	%r16, %r17, %r12
	.word 0x9a3c26ed  ! 441: XNOR_I	xnor 	%r16, 0x06ed, %r13
	.word 0xbb2c0011  ! 441: SLL_R	sll 	%r16, %r17, %r29
	.word 0x9c2c2157  ! 441: ANDN_I	andn 	%r16, 0x0157, %r14
	.word 0x96c42fdc  ! 441: ADDCcc_I	addccc 	%r16, 0x0fdc, %r11
	.word 0x9f2c1011  ! 441: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x86840011  ! 441: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0xc81c24ee  ! 442: LDD_I	ldd	[%r16 + 0x04ee], %r4
	.word 0x81580000  ! 444: FLUSHW	flushw
	.word 0x933c0011  ! 446: SRA_R	sra 	%r16, %r17, %r9
	.word 0x8a0c232d  ! 446: AND_I	and 	%r16, 0x032d, %r5
	.word 0x943c0011  ! 446: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x89641811  ! 446: MOVcc_R	<illegal instruction>
	.word 0xac9c0011  ! 446: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0x97641811  ! 446: MOVcc_R	<illegal instruction>
	.word 0xf11c2918  ! 447: LDDF_I	ldd	[%r16, 0x0918], %f24
thr2_irf_ce_40:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_40), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xfa24281c  ! 451: STW_I	stw	%r29, [%r16 + 0x081c]
	.word 0xa63423f2  ! 453: ORN_I	orn 	%r16, 0x03f2, %r19
	.word 0x949c2b11  ! 453: XORcc_I	xorcc 	%r16, 0x0b11, %r10
	.word 0x8e9428a2  ! 453: ORcc_I	orcc 	%r16, 0x08a2, %r7
	.word 0x9c342e66  ! 453: ORN_I	orn 	%r16, 0x0e66, %r14
	.word 0xae0c0011  ! 453: AND_R	and 	%r16, %r17, %r23
	.word 0xe7941011  ! 454: LDQFA_R	-	[%r16, %r17], %f19
thr2_irf_ce_41:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_41), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xd39c1011  ! 456: LDDFA_R	ldda	[%r16, %r17], %f9
	.word 0xba9c2fd7  ! 458: XORcc_I	xorcc 	%r16, 0x0fd7, %r29
	.word 0xba8c0011  ! 458: ANDcc_R	andcc 	%r16, %r17, %r29
	.word 0x8e442ce0  ! 458: ADDC_I	addc 	%r16, 0x0ce0, %r7
	.word 0xb8ac0011  ! 458: ANDNcc_R	andncc 	%r16, %r17, %r28
	.word 0x832c3001  ! 458: SLLX_I	sllx	%r16, 0x0001, %r1
thr2_dc_err_39:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_39), 16, 16),1,DC_DATA,61)
	.word 0xc31c2e57  ! 460: LDDF_I	ldd	[%r16, 0x0e57], %f1
	.word 0xd8cc1011  ! 462: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r12
	.word 0xb00420a2  ! 464: ADD_I	add 	%r16, 0x00a2, %r24
	.word 0x88ac22a8  ! 464: ANDNcc_I	andncc 	%r16, 0x02a8, %r4
	.word 0xb8bc0011  ! 464: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0x8e3c0011  ! 464: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x972c2001  ! 464: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x9a140011  ! 464: OR_R	or 	%r16, %r17, %r13
thr2_dc_err_40:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_40), 16, 16),1,DC_DATA,41)
	.word 0xda0c0000  ! 466: LDUB_R	ldub	[%r16 + %r0], %r13
thr2_irf_ce_42:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_42), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xfa04272d  ! 468: LDUW_I	lduw	[%r16 + 0x072d], %r29
	.word 0x8e2c2b05  ! 470: ANDN_I	andn 	%r16, 0x0b05, %r7
	.word 0xb49c2f9f  ! 470: XORcc_I	xorcc 	%r16, 0x0f9f, %r26
	.word 0xb6b40011  ! 470: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0xba142cf9  ! 470: OR_I	or 	%r16, 0x0cf9, %r29
	.word 0x837c2401  ! 470: MOVR_I	move	%r16, 0xfffffe34, %r1
	.word 0xb6c42593  ! 470: ADDCcc_I	addccc 	%r16, 0x0593, %r27
thr2_dc_err_41:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_41), 16, 16),1,DC_DATA,14)
	.word 0xcf1c2779  ! 472: LDDF_I	ldd	[%r16, 0x0779], %f7
!Illinst alu
	.word 0x84bc2242  ! 474: XNORcc_I	xnorcc 	%r16, 0x0242, %r2
	.word 0x9e142a29  ! 476: OR_I	or 	%r16, 0x0a29, %r15
	.word 0xb0440011  ! 476: ADDC_R	addc 	%r16, %r17, %r24
	.word 0x8d3c0011  ! 476: SRA_R	sra 	%r16, %r17, %r6
	.word 0xb02c29b8  ! 476: ANDN_I	andn 	%r16, 0x09b8, %r24
	.word 0x8e3c0011  ! 476: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x9e840011  ! 476: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xba340011  ! 476: ORN_R	orn 	%r16, %r17, %r29
	.word 0xf0941011  ! 477: LDUHA_R	lduha	[%r16, %r17] 0x80, %r24
thr2_irf_ce_43:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_43), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xd114281d  ! 479: LDQF_I	-	[%r16, 0x081d], %f8
	.word 0x89341011  ! 481: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x9e840011  ! 481: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x9e0c0011  ! 481: AND_R	and 	%r16, %r17, %r15
	.word 0x86440011  ! 481: ADDC_R	addc 	%r16, %r17, %r3
	.word 0xbb643801  ! 481: MOVcc_I	<illegal instruction>
	.word 0xb22c0011  ! 481: ANDN_R	andn 	%r16, %r17, %r25
	.word 0x94840011  ! 481: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0xb8bc0011  ! 481: XNORcc_R	xnorcc 	%r16, %r17, %r28
thr2_dc_err_42:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_42), 16, 16),1,DC_DATA,3)
	.word 0xfa142951  ! 483: LDUH_I	lduh	[%r16 + 0x0951], %r29
thr2_irf_ce_44:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_44), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xd51c0011  ! 485: LDDF_R	ldd	[%r16, %r17], %f10
	.word 0x98ac0011  ! 487: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xa62c0011  ! 487: ANDN_R	andn 	%r16, %r17, %r19
	.word 0xad3c2001  ! 487: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0x892c3001  ! 487: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0x82b42152  ! 487: ORNcc_I	orncc 	%r16, 0x0152, %r1
thr2_dc_err_43:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_43), 16, 16),1,DC_DATA,16)
	.word 0xc3042d68  ! 489: LDF_I	ld	[%r16, 0x0d68], %f1
thr2_irf_ce_45:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_45), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xdb841011  ! 491: LDFA_R	lda	[%r16, %r17], %f13
	.word 0x82ac2fc9  ! 493: ANDNcc_I	andncc 	%r16, 0x0fc9, %r1
	.word 0xbb7c0411  ! 493: MOVR_R	move	%r16, %r17, %r29
	.word 0x9e2c2ce8  ! 493: ANDN_I	andn 	%r16, 0x0ce8, %r15
	.word 0x8c942ac7  ! 493: ORcc_I	orcc 	%r16, 0x0ac7, %r6
	.word 0xb32c1011  ! 493: SLLX_R	sllx	%r16, %r17, %r25
	.word 0xbb2c1011  ! 493: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x8b643801  ! 493: MOVcc_I	<illegal instruction>
thr2_dc_err_44:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_44), 16, 16),1,DC_DATA,33)
	.word 0xde9c2007  ! 495: LDDA_I	ldda	[%r16, + 0x0007] %asi, %r15
	.word 0xaa540011  ! 497: UMUL_R	umul 	%r16, %r17, %r21
	.word 0xad2c0011  ! 499: SLL_R	sll 	%r16, %r17, %r22
	.word 0x8b2c2001  ! 499: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x852c1011  ! 499: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x85341011  ! 499: SRLX_R	srlx	%r16, %r17, %r2
	.word 0x8d2c0011  ! 499: SLL_R	sll 	%r16, %r17, %r6
thr2_dc_err_45:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_45), 16, 16),1,DC_DATA,42)
	.word 0xdf142007  ! 501: LDQF_I	-	[%r16, 0x0007], %f15
thr2_irf_ce_46:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_46), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xd8d41011  ! 503: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r12
	.word 0xbaac2113  ! 505: ANDNcc_I	andncc 	%r16, 0x0113, %r29
	.word 0x8a940011  ! 505: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x96b429fe  ! 505: ORNcc_I	orncc 	%r16, 0x09fe, %r11
	.word 0x82ac2d74  ! 505: ANDNcc_I	andncc 	%r16, 0x0d74, %r1
	.word 0xb6140011  ! 505: OR_R	or 	%r16, %r17, %r27
	.word 0x82bc0011  ! 505: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x87340011  ! 505: SRL_R	srl 	%r16, %r17, %r3
	.word 0xe8142c24  ! 506: LDUH_I	lduh	[%r16 + 0x0c24], %r20
	.word 0xfa440011  ! 508: LDSW_R	ldsw	[%r16 + %r17], %r29
	.word 0xac14254c  ! 510: OR_I	or 	%r16, 0x054c, %r22
	.word 0xb9643801  ! 510: MOVcc_I	<illegal instruction>
	.word 0x92b40011  ! 510: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xac440011  ! 510: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x861c0011  ! 510: XOR_R	xor 	%r16, %r17, %r3
	.word 0x98340011  ! 510: ORN_R	orn 	%r16, %r17, %r12
	.word 0xa8042e37  ! 510: ADD_I	add 	%r16, 0x0e37, %r20
	.word 0xf60c0011  ! 511: LDUB_R	ldub	[%r16 + %r17], %r27
	.word 0xd8d41011  ! 513: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r12
	.word 0x8e1c24c8  ! 515: XOR_I	xor 	%r16, 0x04c8, %r7
	.word 0x9f343001  ! 515: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x828c0011  ! 515: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x8a3c292a  ! 515: XNOR_I	xnor 	%r16, 0x092a, %r5
	.word 0x8c9c0011  ! 515: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0x95341011  ! 515: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x9f643801  ! 515: MOVcc_I	<illegal instruction>
	.word 0xce542376  ! 516: LDSH_I	ldsh	[%r16 + 0x0376], %r7
	.word 0xf1e41011  ! 518: CASA_I	casa	[%r16] 0x80, %r17, %r24
	.word 0xb77c0411  ! 520: MOVR_R	move	%r16, %r17, %r27
	.word 0x83340011  ! 520: SRL_R	srl 	%r16, %r17, %r1
	.word 0x9d3c2001  ! 520: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x9c3c2512  ! 520: XNOR_I	xnor 	%r16, 0x0512, %r14
	.word 0x8abc0011  ! 520: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0x861424cc  ! 520: OR_I	or 	%r16, 0x04cc, %r3
	.word 0x9c8c2894  ! 520: ANDcc_I	andcc 	%r16, 0x0894, %r14
thr2_dc_err_46:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_46), 16, 16),1,DC_DATA,55)
	.word 0xe8540000  ! 522: LDSH_R	ldsh	[%r16 + %r0], %r20
!Illinst store
	.word 0xd42c0011  ! 524: STB_R	stb	%r10, [%r16 + %r17]
	.word 0x90842aa1  ! 526: ADDcc_I	addcc 	%r16, 0x0aa1, %r8
	.word 0x85340011  ! 526: SRL_R	srl 	%r16, %r17, %r2
	.word 0x8b343001  ! 526: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0xaabc228c  ! 526: XNORcc_I	xnorcc 	%r16, 0x028c, %r21
	.word 0x94142d5e  ! 526: OR_I	or 	%r16, 0x0d5e, %r10
	.word 0xa73c0011  ! 526: SRA_R	sra 	%r16, %r17, %r19
	.word 0x8b342001  ! 526: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x8c1c27c9  ! 526: XOR_I	xor 	%r16, 0x07c9, %r6
	.word 0xc2542227  ! 527: LDSH_I	ldsh	[%r16 + 0x0227], %r1
thr2_irf_ce_47:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_47), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xf51c2021  ! 529: LDDF_I	ldd	[%r16, 0x0021], %f26
	.word 0x973c0011  ! 531: SRA_R	sra 	%r16, %r17, %r11
	.word 0xb92c2001  ! 531: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0xaf341011  ! 531: SRLX_R	srlx	%r16, %r17, %r23
	.word 0x84ac0011  ! 531: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0xac1c0011  ! 531: XOR_R	xor 	%r16, %r17, %r22
	.word 0x940420a7  ! 531: ADD_I	add 	%r16, 0x00a7, %r10
	.word 0xe65c0011  ! 532: LDX_R	ldx	[%r16 + %r17], %r19
!Illinst alu
	.word 0x91340011  ! 534: SRL_R	srl 	%r16, %r17, %r8
	.word 0x96bc22fc  ! 536: XNORcc_I	xnorcc 	%r16, 0x02fc, %r11
	.word 0x8e340011  ! 536: ORN_R	orn 	%r16, %r17, %r7
	.word 0xb61c2ef1  ! 536: XOR_I	xor 	%r16, 0x0ef1, %r27
	.word 0xa7641811  ! 536: MOVcc_R	<illegal instruction>
	.word 0x98b40011  ! 536: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0xd304279c  ! 537: LDF_I	ld	[%r16, 0x079c], %f9
	.word 0xd0941011  ! 539: LDUHA_R	lduha	[%r16, %r17] 0x80, %r8
	.word 0x9a842dae  ! 541: ADDcc_I	addcc 	%r16, 0x0dae, %r13
	.word 0x833c1011  ! 541: SRAX_R	srax	%r16, %r17, %r1
	.word 0x97340011  ! 541: SRL_R	srl 	%r16, %r17, %r11
	.word 0x84c40011  ! 541: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xaa3c236d  ! 541: XNOR_I	xnor 	%r16, 0x036d, %r21
	.word 0xa89c23a7  ! 541: XORcc_I	xorcc 	%r16, 0x03a7, %r20
thr2_dc_err_47:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_47), 16, 16),1,DC_DATA,40)
	.word 0xd8d41000  ! 543: LDSHA_R	ldsha	[%r16, %r0] 0x80, %r12
thr2_irf_ce_48:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_48), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xd6040011  ! 545: LDUW_R	lduw	[%r16 + %r17], %r11
	.word 0x9e040011  ! 547: ADD_R	add 	%r16, %r17, %r15
	.word 0xb00c0011  ! 547: AND_R	and 	%r16, %r17, %r24
	.word 0x973c1011  ! 547: SRAX_R	srax	%r16, %r17, %r11
	.word 0x9e940011  ! 547: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0xab2c3001  ! 547: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x9a8c0011  ! 547: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x8a442cae  ! 547: ADDC_I	addc 	%r16, 0x0cae, %r5
	.word 0x9d643801  ! 548: MOVcc_I	<illegal instruction>
	.word 0x8a8c0011  ! 548: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0xae140011  ! 548: OR_R	or 	%r16, %r17, %r23
	.word 0x8a1c22b6  ! 548: XOR_I	xor 	%r16, 0x02b6, %r5
	.word 0xac1c0011  ! 548: XOR_R	xor 	%r16, %r17, %r22
	rd      %pc, %r18
	set     0x20, %r17
thr2_dc_err_48:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_48), 16, 16),1,DC_DATA,61)
	.word 0xcf9c1000  ! 549: LDDFA_R	ldda	[%r16, %r0], %f7
	return     %r18 + 0x20
	.word 0x842c0011  ! 552: ANDN_R	andn 	%r16, %r17, %r2
	.word 0xb8342c82  ! 552: ORN_I	orn 	%r16, 0x0c82, %r28
	.word 0x969c23a8  ! 552: XORcc_I	xorcc 	%r16, 0x03a8, %r11
	.word 0x997c2401  ! 552: MOVR_I	move	%r16, 0xfffffe34, %r12
	.word 0xacbc2a6c  ! 552: XNORcc_I	xnorcc 	%r16, 0x0a6c, %r22
	.word 0x968c0011  ! 552: ANDcc_R	andcc 	%r16, %r17, %r11
thr2_dc_err_49:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_49), 16, 16),1,DC_DATA,8)
	.word 0xd3140000  ! 554: LDQF_R	-	[%r16, %r0], %f9
	.word 0xea4c20df  ! 556: LDSB_I	ldsb	[%r16 + 0x00df], %r21
	.word 0x908c0011  ! 558: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0xb8040011  ! 558: ADD_R	add 	%r16, %r17, %r28
	.word 0x843c2a02  ! 558: XNOR_I	xnor 	%r16, 0x0a02, %r2
	.word 0x95342001  ! 558: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x91341011  ! 558: SRLX_R	srlx	%r16, %r17, %r8
	.word 0xb03c2c62  ! 558: XNOR_I	xnor 	%r16, 0x0c62, %r24
	.word 0x8ab40011  ! 558: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xce4c2b90  ! 559: LDSB_I	ldsb	[%r16 + 0x0b90], %r7
	.word 0xfa8424a3  ! 561: LDUWA_I	lduwa	[%r16, + 0x04a3] %asi, %r29
	.word 0x832c0011  ! 563: SLL_R	sll 	%r16, %r17, %r1
	.word 0xac0c286d  ! 563: AND_I	and 	%r16, 0x086d, %r22
	.word 0x852c3001  ! 563: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0x85643801  ! 563: MOVcc_I	<illegal instruction>
	.word 0xb82c0011  ! 563: ANDN_R	andn 	%r16, %r17, %r28
	.word 0xb20c2604  ! 563: AND_I	and 	%r16, 0x0604, %r25
thr2_dc_err_50:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_50), 16, 16),1,DC_DATA,27)
	.word 0xc7941000  ! 565: LDQFA_R	-	[%r16, %r0], %f3
	.word 0xca1c0011  ! 567: LDD_R	ldd	[%r16 + %r17], %r5
	.word 0x99641811  ! 569: MOVcc_R	<illegal instruction>
	.word 0x88342dc1  ! 569: ORN_I	orn 	%r16, 0x0dc1, %r4
	.word 0xb0342b24  ! 569: ORN_I	orn 	%r16, 0x0b24, %r24
	.word 0x9c2c239b  ! 569: ANDN_I	andn 	%r16, 0x039b, %r14
	.word 0x8d3c0011  ! 569: SRA_R	sra 	%r16, %r17, %r6
	.word 0x901c0011  ! 569: XOR_R	xor 	%r16, %r17, %r8
	.word 0x9c840011  ! 569: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0xf3140011  ! 570: LDQF_R	-	[%r16, %r17], %f25
	.word 0xd4042fa2  ! 572: LDUW_I	lduw	[%r16 + 0x0fa2], %r10
	.word 0x86840011  ! 574: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0xb21c0011  ! 574: XOR_R	xor 	%r16, %r17, %r25
	.word 0x84ac0011  ! 574: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0xae1c0011  ! 574: XOR_R	xor 	%r16, %r17, %r23
	.word 0xb64421c8  ! 574: ADDC_I	addc 	%r16, 0x01c8, %r27
	.word 0x881c2289  ! 574: XOR_I	xor 	%r16, 0x0289, %r4
	.word 0x92042e75  ! 574: ADD_I	add 	%r16, 0x0e75, %r9
	.word 0xca8c2eaa  ! 575: LDUBA_I	lduba	[%r16, + 0x0eaa] %asi, %r5
thr2_irf_ce_49:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_49), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xf47c0011  ! 577: SWAP_R	swap	%r26, [%r16 + %r17]
	.word 0xaa94208b  ! 579: ORcc_I	orcc 	%r16, 0x008b, %r21
	.word 0xacc429ef  ! 579: ADDCcc_I	addccc 	%r16, 0x09ef, %r22
	.word 0x933c0011  ! 579: SRA_R	sra 	%r16, %r17, %r9
	.word 0x823c2939  ! 579: XNOR_I	xnor 	%r16, 0x0939, %r1
	.word 0xaa940011  ! 579: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0xd51c26a4  ! 580: LDDF_I	ldd	[%r16, 0x06a4], %f10
	.word 0xe6442fa3  ! 582: LDSW_I	ldsw	[%r16 + 0x0fa3], %r19
	.word 0x96c40011  ! 584: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x9cb40011  ! 584: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0xb12c2001  ! 584: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0xb6340011  ! 584: ORN_R	orn 	%r16, %r17, %r27
	.word 0xb83c0011  ! 584: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0x9ac40011  ! 584: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x8a9c0011  ! 584: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0xed941011  ! 585: LDQFA_R	-	[%r16, %r17], %f22
thr2_irf_ce_50:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_50), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xd46c0011  ! 587: LDSTUB_R	ldstub	%r10, [%r16 + %r17]
	.word 0x9cc40011  ! 589: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0xaf343001  ! 589: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0xaa1c0011  ! 589: XOR_R	xor 	%r16, %r17, %r21
	.word 0x94440011  ! 589: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x90840011  ! 589: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x8a2c0011  ! 589: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xf4540011  ! 590: LDSH_R	ldsh	[%r16 + %r17], %r26
	.word 0x81dc2299  ! 592: FLUSH_I	flush
	.word 0x853c0011  ! 594: SRA_R	sra 	%r16, %r17, %r2
	.word 0x9a3c0011  ! 594: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x98b40011  ! 594: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x857c0411  ! 594: MOVR_R	move	%r16, %r17, %r2
	.word 0x8f7c0411  ! 594: MOVR_R	move	%r16, %r17, %r7
	.word 0x96b40011  ! 594: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0x92140011  ! 594: OR_R	or 	%r16, %r17, %r9
	.word 0xd2c42b27  ! 595: LDSWA_I	ldswa	[%r16, + 0x0b27] %asi, %r9
thr2_irf_ce_51:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_51), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xea0427ab  ! 597: LDUW_I	lduw	[%r16 + 0x07ab], %r21
	.word 0xaeac249e  ! 599: ANDNcc_I	andncc 	%r16, 0x049e, %r23
	.word 0x9c940011  ! 599: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0x99343001  ! 599: SRLX_I	srlx	%r16, 0x0001, %r12
	.word 0x8ec42498  ! 599: ADDCcc_I	addccc 	%r16, 0x0498, %r7
	.word 0xab3c2001  ! 599: SRA_I	sra 	%r16, 0x0001, %r21
thr2_dc_err_51:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_51), 16, 16),1,DC_DATA,31)
	.word 0xec5c23bf  ! 601: LDX_I	ldx	[%r16 + 0x03bf], %r22
thr2_irf_ce_52:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_52), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xd2d4219f  ! 603: LDSHA_I	ldsha	[%r16, + 0x019f] %asi, %r9
	.word 0x99341011  ! 605: SRLX_R	srlx	%r16, %r17, %r12
	.word 0xa8c42526  ! 605: ADDCcc_I	addccc 	%r16, 0x0526, %r20
	.word 0x933c0011  ! 605: SRA_R	sra 	%r16, %r17, %r9
	.word 0xbb343001  ! 605: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0x829c2cf7  ! 605: XORcc_I	xorcc 	%r16, 0x0cf7, %r1
	.word 0xaa042517  ! 605: ADD_I	add 	%r16, 0x0517, %r21
	.word 0xa97c2401  ! 605: MOVR_I	move	%r16, 0xfffffe34, %r20
	.word 0x90c4225b  ! 605: ADDCcc_I	addccc 	%r16, 0x025b, %r8
thr2_dc_err_52:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_52), 16, 16),1,DC_DATA,63)
	.word 0xf8542733  ! 607: LDSH_I	ldsh	[%r16 + 0x0733], %r28
thr2_irf_ce_53:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_53), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xc36c2f19  ! 609: PREFETCH_I	prefetch	[%r16 + 0x0f19], #one_read
	.word 0xad343001  ! 611: SRLX_I	srlx	%r16, 0x0001, %r22
	.word 0x8c9c284c  ! 611: XORcc_I	xorcc 	%r16, 0x084c, %r6
	.word 0x9e2c0011  ! 611: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x9a1c0011  ! 611: XOR_R	xor 	%r16, %r17, %r13
	.word 0x8aac2baa  ! 611: ANDNcc_I	andncc 	%r16, 0x0baa, %r5
	.word 0x952c0011  ! 611: SLL_R	sll 	%r16, %r17, %r10
	.word 0xf48c1011  ! 612: LDUBA_R	lduba	[%r16, %r17] 0x80, %r26
!Illinst alu
	.word 0xa83c0011  ! 614: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0x9d343001  ! 616: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0xaabc0011  ! 616: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0x84ac0011  ! 616: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x94340011  ! 616: ORN_R	orn 	%r16, %r17, %r10
	.word 0x8c842928  ! 616: ADDcc_I	addcc 	%r16, 0x0928, %r6
	.word 0x93641811  ! 616: MOVcc_R	<illegal instruction>
	.word 0x94bc2b03  ! 616: XNORcc_I	xnorcc 	%r16, 0x0b03, %r10
	.word 0x8c8c0011  ! 616: ANDcc_R	andcc 	%r16, %r17, %r6
thr2_dc_err_53:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_53), 16, 16),1,DC_DATA,58)
	.word 0xf28c1000  ! 618: LDUBA_R	lduba	[%r16, %r0] 0x80, %r25
!Illinst alu
	.word 0xa73c2001  ! 620: SRA_I	sra 	%r16, 0x0001, %r19
	.word 0xb23c273a  ! 622: XNOR_I	xnor 	%r16, 0x073a, %r25
	.word 0xac140011  ! 622: OR_R	or 	%r16, %r17, %r22
	.word 0x84b40011  ! 622: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0x98bc257c  ! 622: XNORcc_I	xnorcc 	%r16, 0x057c, %r12
	.word 0xb294267a  ! 622: ORcc_I	orcc 	%r16, 0x067a, %r25
	.word 0x9c84247c  ! 622: ADDcc_I	addcc 	%r16, 0x047c, %r14
	.word 0x9f7c0411  ! 622: MOVR_R	move	%r16, %r17, %r15
	.word 0xb40c0011  ! 622: AND_R	and 	%r16, %r17, %r26
	.word 0xd7941011  ! 623: LDQFA_R	-	[%r16, %r17], %f11
thr2_irf_ce_54:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_54), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
thr2_resum_intr_1507:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_1507), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x0, %asr26
	.word 0x929c28b8  ! 627: XORcc_I	xorcc 	%r16, 0x08b8, %r9
	.word 0xb00c2a57  ! 627: AND_I	and 	%r16, 0x0a57, %r24
	.word 0xb0840011  ! 627: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0x9c8c0011  ! 627: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0xa8940011  ! 627: ORcc_R	orcc 	%r16, %r17, %r20
	.word 0x989426f8  ! 627: ORcc_I	orcc 	%r16, 0x06f8, %r12
thr2_dc_err_54:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_54), 16, 16),1,DC_DATA,3)
	.word 0xc85c0000  ! 629: LDX_R	ldx	[%r16 + %r0], %r4
	.word 0xce0c0011  ! 631: LDUB_R	ldub	[%r16 + %r17], %r7
	.word 0x8e0425c9  ! 633: ADD_I	add 	%r16, 0x05c9, %r7
	.word 0xae040011  ! 633: ADD_R	add 	%r16, %r17, %r23
	.word 0x848c2bd7  ! 633: ANDcc_I	andcc 	%r16, 0x0bd7, %r2
	.word 0xaeac0011  ! 633: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0x82040011  ! 633: ADD_R	add 	%r16, %r17, %r1
	.word 0xb21c25da  ! 633: XOR_I	xor 	%r16, 0x05da, %r25
	.word 0x8ec42299  ! 633: ADDCcc_I	addccc 	%r16, 0x0299, %r7
	.word 0xb4c42346  ! 633: ADDCcc_I	addccc 	%r16, 0x0346, %r26
	.word 0xee1c25e3  ! 634: LDD_I	ldd	[%r16 + 0x05e3], %r23
thr2_irf_ce_55:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_55), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xd02c2891  ! 638: STB_I	stb	%r8, [%r16 + 0x0891]
	.word 0x989c0011  ! 640: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x8e1c0011  ! 640: XOR_R	xor 	%r16, %r17, %r7
	.word 0xa83c0011  ! 640: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0xba2c0011  ! 640: ANDN_R	andn 	%r16, %r17, %r29
	.word 0x9c3c2a4f  ! 640: XNOR_I	xnor 	%r16, 0x0a4f, %r14
	.word 0x8c2c2e86  ! 640: ANDN_I	andn 	%r16, 0x0e86, %r6
	.word 0x94340011  ! 640: ORN_R	orn 	%r16, %r17, %r10
	.word 0xca5c2c3e  ! 641: LDX_I	ldx	[%r16 + 0x0c3e], %r5
thr2_irf_ce_56:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_56), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xd0140011  ! 643: LDUH_R	lduh	[%r16 + %r17], %r8
	.word 0x87342001  ! 645: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0x8b641811  ! 645: MOVcc_R	<illegal instruction>
	.word 0x8f340011  ! 645: SRL_R	srl 	%r16, %r17, %r7
	.word 0xb4bc0011  ! 645: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0x823c2618  ! 645: XNOR_I	xnor 	%r16, 0x0618, %r1
thr2_dc_err_55:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_55), 16, 16),1,DC_DATA,52)
	.word 0xd4c41000  ! 647: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r10
thr2_irf_ce_57:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_57), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xc4941011  ! 649: LDUHA_R	lduha	[%r16, %r17] 0x80, %r2
	.word 0xb77c2401  ! 651: MOVR_I	move	%r16, 0xfffffe34, %r27
	.word 0x84942bf8  ! 651: ORcc_I	orcc 	%r16, 0x0bf8, %r2
	.word 0xac440011  ! 651: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x943c2135  ! 651: XNOR_I	xnor 	%r16, 0x0135, %r10
	.word 0x83643801  ! 651: MOVcc_I	<illegal instruction>
	.word 0x9a0c0011  ! 651: AND_R	and 	%r16, %r17, %r13
	.word 0x95643801  ! 651: MOVcc_I	<illegal instruction>
thr2_dc_err_56:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_56), 16, 16),1,DC_DATA,51)
	.word 0xd6442259  ! 653: LDSW_I	ldsw	[%r16 + 0x0259], %r11
thr2_irf_ce_58:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_58), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xce4c0011  ! 655: LDSB_R	ldsb	[%r16 + %r17], %r7
	.word 0x843c2633  ! 657: XNOR_I	xnor 	%r16, 0x0633, %r2
	.word 0xbaac0011  ! 657: ANDNcc_R	andncc 	%r16, %r17, %r29
	.word 0x98140011  ! 657: OR_R	or 	%r16, %r17, %r12
	.word 0xaa9423ee  ! 657: ORcc_I	orcc 	%r16, 0x03ee, %r21
	.word 0xb6442825  ! 657: ADDC_I	addc 	%r16, 0x0825, %r27
	.word 0x953c2001  ! 657: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0xaeb40011  ! 657: ORNcc_R	orncc 	%r16, %r17, %r23
	.word 0xc4dc1011  ! 658: LDXA_R	ldxa	[%r16, %r17] 0x80, %r2
thr2_irf_ce_59:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_59), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xda5c2742  ! 660: LDX_I	ldx	[%r16 + 0x0742], %r13
	.word 0xb6442f79  ! 662: ADDC_I	addc 	%r16, 0x0f79, %r27
	.word 0x9c940011  ! 662: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0x942c0011  ! 662: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x8614236f  ! 662: OR_I	or 	%r16, 0x036f, %r3
	.word 0x962c0011  ! 662: ANDN_R	andn 	%r16, %r17, %r11
	.word 0xbb643801  ! 662: MOVcc_I	<illegal instruction>
	.word 0x86c40011  ! 663: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x8f2c3001  ! 663: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x992c1011  ! 663: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x92c40011  ! 663: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x9844296c  ! 663: ADDC_I	addc 	%r16, 0x096c, %r12
	rd      %pc, %r18
	set     0x20, %r17
thr2_dc_err_57:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_57), 16, 16),1,DC_DATA,21)
	.word 0xc5142f83  ! 664: LDQF_I	-	[%r16, 0x0f83], %f2
	return     %r18 + %r17
	.word 0x828c0011  ! 667: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x943c0011  ! 667: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0xab341011  ! 667: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x86940011  ! 667: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0xad343001  ! 667: SRLX_I	srlx	%r16, 0x0001, %r22
	.word 0xda8c1011  ! 668: LDUBA_R	lduba	[%r16, %r17] 0x80, %r13
!Illinst store
	.word 0xee240011  ! 670: STW_R	stw	%r23, [%r16 + %r17]
	.word 0x888c0011  ! 672: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0x99641811  ! 672: MOVcc_R	<illegal instruction>
	.word 0x8ebc0011  ! 672: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x8d343001  ! 672: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0x83641811  ! 672: MOVcc_R	<illegal instruction>
	.word 0x92442a19  ! 672: ADDC_I	addc 	%r16, 0x0a19, %r9
	.word 0x98c40011  ! 672: ADDCcc_R	addccc 	%r16, %r17, %r12
thr2_dc_err_58:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_58), 16, 16),1,DC_DATA,64)
	.word 0xd0542576  ! 674: LDSH_I	ldsh	[%r16 + 0x0576], %r8
	.word 0xd86c0011  ! 676: LDSTUB_R	ldstub	%r12, [%r16 + %r17]
	.word 0xaa8c0011  ! 678: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0xa97c2401  ! 678: MOVR_I	move	%r16, 0xfffffe34, %r20
	.word 0x840c0011  ! 678: AND_R	and 	%r16, %r17, %r2
	.word 0xb4ac0011  ! 678: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0xb09c0011  ! 678: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x993c1011  ! 678: SRAX_R	srax	%r16, %r17, %r12
	.word 0xea841011  ! 679: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r21
thr2_irf_ce_60:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_60), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xf0242d40  ! 683: STW_I	stw	%r24, [%r16 + 0x0d40]
	.word 0xa8042e27  ! 685: ADD_I	add 	%r16, 0x0e27, %r20
	.word 0xae140011  ! 685: OR_R	or 	%r16, %r17, %r23
	.word 0xacb40011  ! 685: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0x9d2c1011  ! 685: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x92b42d02  ! 685: ORNcc_I	orncc 	%r16, 0x0d02, %r9
thr2_dc_err_59:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_59), 16, 16),1,DC_DATA,46)
	.word 0xf2442d66  ! 687: LDSW_I	ldsw	[%r16 + 0x0d66], %r25
	.word 0xc36c2829  ! 689: PREFETCH_I	prefetch	[%r16 + 0x0829], #one_read
	.word 0x83340011  ! 691: SRL_R	srl 	%r16, %r17, %r1
	.word 0x8aac22a2  ! 691: ANDNcc_I	andncc 	%r16, 0x02a2, %r5
	.word 0x8b341011  ! 691: SRLX_R	srlx	%r16, %r17, %r5
	.word 0x8a040011  ! 691: ADD_R	add 	%r16, %r17, %r5
	.word 0x84440011  ! 691: ADDC_R	addc 	%r16, %r17, %r2
thr2_dc_err_60:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_60), 16, 16),1,DC_DATA,14)
	.word 0xdecc1000  ! 693: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r15
thr2_irf_ce_61:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_61), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xc3140011  ! 695: LDQF_R	-	[%r16, %r17], %f1
	.word 0xb6942616  ! 697: ORcc_I	orcc 	%r16, 0x0616, %r27
	.word 0x88bc2cca  ! 697: XNORcc_I	xnorcc 	%r16, 0x0cca, %r4
	.word 0x863c0011  ! 697: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0xba142f00  ! 697: OR_I	or 	%r16, 0x0f00, %r29
	.word 0x9c340011  ! 697: ORN_R	orn 	%r16, %r17, %r14
	.word 0x8b7c2401  ! 697: MOVR_I	move	%r16, 0xfffffe34, %r5
	.word 0x84ac2396  ! 697: ANDNcc_I	andncc 	%r16, 0x0396, %r2
	.word 0xd5941011  ! 698: LDQFA_R	-	[%r16, %r17], %f10
thr2_irf_ce_62:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_62), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xf8d41011  ! 700: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r28
	.word 0x8d7c2401  ! 702: MOVR_I	move	%r16, 0xfffffe34, %r6
	.word 0x844428b0  ! 702: ADDC_I	addc 	%r16, 0x08b0, %r2
	.word 0x9a3c2d08  ! 702: XNOR_I	xnor 	%r16, 0x0d08, %r13
	.word 0xae9c245e  ! 702: XORcc_I	xorcc 	%r16, 0x045e, %r23
	.word 0xa614235a  ! 702: OR_I	or 	%r16, 0x035a, %r19
	.word 0x87343001  ! 702: SRLX_I	srlx	%r16, 0x0001, %r3
thr2_dc_err_61:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_61), 16, 16),1,DC_DATA,4)
	.word 0xc5941000  ! 704: LDQFA_R	-	[%r16, %r0], %f2
	.word 0xc4442a03  ! 706: LDSW_I	ldsw	[%r16 + 0x0a03], %r2
	.word 0x8d342001  ! 708: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x82340011  ! 708: ORN_R	orn 	%r16, %r17, %r1
	.word 0x9c2c0011  ! 708: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x8e34204c  ! 708: ORN_I	orn 	%r16, 0x004c, %r7
	.word 0xba2c0011  ! 708: ANDN_R	andn 	%r16, %r17, %r29
	.word 0xb3341011  ! 708: SRLX_R	srlx	%r16, %r17, %r25
	.word 0xc2942335  ! 709: LDUHA_I	lduha	[%r16, + 0x0335] %asi, %r1
thr2_irf_ce_63:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_63), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xf5140011  ! 711: LDQF_R	-	[%r16, %r17], %f26
	.word 0x9b2c3001  ! 713: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x8c440011  ! 713: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x9ac40011  ! 713: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x90bc0011  ! 713: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x8eb428e2  ! 713: ORNcc_I	orncc 	%r16, 0x08e2, %r7
	.word 0x872c0011  ! 713: SLL_R	sll 	%r16, %r17, %r3
	.word 0x8b342001  ! 713: SRL_I	srl 	%r16, 0x0001, %r5
thr2_dc_err_62:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_62), 16, 16),1,DC_DATA,38)
	.word 0xf0442eb0  ! 715: LDSW_I	ldsw	[%r16 + 0x0eb0], %r24
	.word 0x81880000  ! 717: SAVED	saved
	.word 0x882c0011  ! 719: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xbabc0011  ! 719: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0x8b7c2401  ! 719: MOVR_I	move	%r16, 0xfffffe34, %r5
	.word 0x99340011  ! 719: SRL_R	srl 	%r16, %r17, %r12
	.word 0xaf3c2001  ! 719: SRA_I	sra 	%r16, 0x0001, %r23
	.word 0xc7140011  ! 720: LDQF_R	-	[%r16, %r17], %f3
!Illinst alu
	.word 0x8f3c3001  ! 722: SRAX_I	srax	%r16, 0x0001, %r7
	.word 0xb2bc29a3  ! 724: XNORcc_I	xnorcc 	%r16, 0x09a3, %r25
	.word 0x9a140011  ! 724: OR_R	or 	%r16, %r17, %r13
	.word 0x97643801  ! 724: MOVcc_I	<illegal instruction>
	.word 0x84040011  ! 724: ADD_R	add 	%r16, %r17, %r2
	.word 0xb4140011  ! 724: OR_R	or 	%r16, %r17, %r26
thr2_dc_err_63:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_63), 16, 16),1,DC_DATA,25)
	.word 0xf5140000  ! 726: LDQF_R	-	[%r16, %r0], %f26
thr2_irf_ce_64:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_64), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xca742020  ! 730: STX_I	stx	%r5, [%r16 + 0x0020]
	.word 0x9f7c2401  ! 732: MOVR_I	move	%r16, 0xfffffe34, %r15
	.word 0xbab42c5f  ! 732: ORNcc_I	orncc 	%r16, 0x0c5f, %r29
	.word 0x88142342  ! 732: OR_I	or 	%r16, 0x0342, %r4
	.word 0x8c342951  ! 732: ORN_I	orn 	%r16, 0x0951, %r6
	.word 0xac0c223d  ! 732: AND_I	and 	%r16, 0x023d, %r22
	.word 0xc91c214a  ! 733: LDDF_I	ldd	[%r16, 0x014a], %f4
thr2_irf_ce_65:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_65), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xd87c0011  ! 735: SWAP_R	swap	%r12, [%r16 + %r17]
	.word 0x8c8c2da3  ! 737: ANDcc_I	andcc 	%r16, 0x0da3, %r6
	.word 0xab2c3001  ! 737: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x8e0c21b1  ! 737: AND_I	and 	%r16, 0x01b1, %r7
	.word 0x9aac0011  ! 737: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x88140011  ! 737: OR_R	or 	%r16, %r17, %r4
	.word 0xfb140011  ! 738: LDQF_R	-	[%r16, %r17], %f29
	.word 0xf8cc2466  ! 740: LDSBA_I	ldsba	[%r16, + 0x0466] %asi, %r28
	.word 0x9e1c2cf9  ! 742: XOR_I	xor 	%r16, 0x0cf9, %r15
	.word 0x821c2f95  ! 742: XOR_I	xor 	%r16, 0x0f95, %r1
	.word 0xb97c0411  ! 742: MOVR_R	move	%r16, %r17, %r28
	.word 0x95342001  ! 742: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x9a142fb7  ! 742: OR_I	or 	%r16, 0x0fb7, %r13
	.word 0x8a8c2946  ! 742: ANDcc_I	andcc 	%r16, 0x0946, %r5
	.word 0x94940011  ! 742: ORcc_R	orcc 	%r16, %r17, %r10
thr2_dc_err_64:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_64), 16, 16),1,DC_DATA,11)
	.word 0xca9c1000  ! 744: LDDA_R	ldda	[%r16, %r0] 0x80, %r5
thr2_irf_ce_66:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_66), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xf40c0011  ! 746: LDUB_R	ldub	[%r16 + %r17], %r26
	.word 0x897c0411  ! 748: MOVR_R	move	%r16, %r17, %r4
	.word 0x929c2091  ! 748: XORcc_I	xorcc 	%r16, 0x0091, %r9
	.word 0x94bc0011  ! 748: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x88b4268e  ! 748: ORNcc_I	orncc 	%r16, 0x068e, %r4
	.word 0xbab40011  ! 748: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0xd5941011  ! 749: LDQFA_R	-	[%r16, %r17], %f10
thr2_irf_ce_67:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_67), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xfa0c0011  ! 751: LDUB_R	ldub	[%r16 + %r17], %r29
	.word 0x961c0011  ! 753: XOR_R	xor 	%r16, %r17, %r11
	.word 0x9a3c2d68  ! 753: XNOR_I	xnor 	%r16, 0x0d68, %r13
	.word 0x9434241b  ! 753: ORN_I	orn 	%r16, 0x041b, %r10
	.word 0x8c342e5d  ! 753: ORN_I	orn 	%r16, 0x0e5d, %r6
	.word 0xb72c0011  ! 753: SLL_R	sll 	%r16, %r17, %r27
	.word 0x84342b2f  ! 753: ORN_I	orn 	%r16, 0x0b2f, %r2
	.word 0x842c2759  ! 753: ANDN_I	andn 	%r16, 0x0759, %r2
thr2_dc_err_65:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_65), 16, 16),1,DC_DATA,46)
	.word 0xd6cc20a0  ! 755: LDSBA_I	ldsba	[%r16, + 0x00a0] %asi, %r11
thr2_irf_ce_68:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_68), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xeb0426d6  ! 757: LDF_I	ld	[%r16, 0x06d6], %f21
	.word 0x8b3c1011  ! 759: SRAX_R	srax	%r16, %r17, %r5
	.word 0x940c2175  ! 759: AND_I	and 	%r16, 0x0175, %r10
	.word 0x8c042e0d  ! 759: ADD_I	add 	%r16, 0x0e0d, %r6
	.word 0x9a840011  ! 759: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x92bc26a5  ! 759: XNORcc_I	xnorcc 	%r16, 0x06a5, %r9
thr2_dc_err_66:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_66), 16, 16),1,DC_DATA,25)
	.word 0xdf142e9a  ! 761: LDQF_I	-	[%r16, 0x0e9a], %f15
	.word 0xc2cc1011  ! 763: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r1
	.word 0xba3c2e32  ! 765: XNOR_I	xnor 	%r16, 0x0e32, %r29
	.word 0x85641811  ! 765: MOVcc_R	<illegal instruction>
	.word 0x90c40011  ! 765: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0xbb3c1011  ! 765: SRAX_R	srax	%r16, %r17, %r29
	.word 0x9b643801  ! 765: MOVcc_I	<illegal instruction>
	.word 0xac3c0011  ! 765: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x9604284d  ! 765: ADD_I	add 	%r16, 0x084d, %r11
	.word 0xa83c0011  ! 765: XNOR_R	xnor 	%r16, %r17, %r20
thr2_dc_err_67:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_67), 16, 16),1,DC_DATA,41)
	.word 0xdc042a53  ! 767: LDUW_I	lduw	[%r16 + 0x0a53], %r14
thr2_irf_ce_69:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_69), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0x8143e07c  ! 769: MEMBAR	membar	#LoadStore | #StoreStore | #Lookaside | #MemIssue | #Sync 
	.word 0x952c3001  ! 771: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x96bc2986  ! 771: XNORcc_I	xnorcc 	%r16, 0x0986, %r11
	.word 0x882c0011  ! 771: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x8f2c2001  ! 771: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x9e940011  ! 771: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x8c9c0011  ! 771: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0xcadc2444  ! 772: LDXA_I	ldxa	[%r16, + 0x0444] %asi, %r5
thr2_irf_ce_70:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_70), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xd20c2e9d  ! 774: LDUB_I	ldub	[%r16 + 0x0e9d], %r9
	.word 0xb4b40011  ! 776: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0x9b7c2401  ! 776: MOVR_I	move	%r16, 0xfffffe34, %r13
	.word 0x9c440011  ! 776: ADDC_R	addc 	%r16, %r17, %r14
	.word 0x9d341011  ! 776: SRLX_R	srlx	%r16, %r17, %r14
	.word 0xba1c28b5  ! 776: XOR_I	xor 	%r16, 0x08b5, %r29
	.word 0xb6140011  ! 776: OR_R	or 	%r16, %r17, %r27
	.word 0x86940011  ! 776: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x882c22ee  ! 776: ANDN_I	andn 	%r16, 0x02ee, %r4
thr2_dc_err_68:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_68), 16, 16),1,DC_DATA,66)
	.word 0xd19c1000  ! 778: LDDFA_R	ldda	[%r16, %r0], %f8
thr2_irf_ce_71:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_71), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xc40424c4  ! 780: LDUW_I	lduw	[%r16 + 0x04c4], %r2
	.word 0x9e342017  ! 782: ORN_I	orn 	%r16, 0x0017, %r15
	.word 0x823420e5  ! 782: ORN_I	orn 	%r16, 0x00e5, %r1
	.word 0x8a1c0011  ! 782: XOR_R	xor 	%r16, %r17, %r5
	.word 0xb93c0011  ! 782: SRA_R	sra 	%r16, %r17, %r28
	.word 0xac2c2843  ! 782: ANDN_I	andn 	%r16, 0x0843, %r22
	.word 0x9d3c2001  ! 782: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x88c40011  ! 782: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x86840011  ! 782: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0xdb9c1011  ! 783: LDDFA_R	ldda	[%r16, %r17], %f13
	.word 0xdb941011  ! 785: LDQFA_R	-	[%r16, %r17], %f13
	.word 0xae8c2d8e  ! 787: ANDcc_I	andcc 	%r16, 0x0d8e, %r23
	.word 0xb77c0411  ! 787: MOVR_R	move	%r16, %r17, %r27
	.word 0x82942e5d  ! 787: ORcc_I	orcc 	%r16, 0x0e5d, %r1
	.word 0x8d340011  ! 787: SRL_R	srl 	%r16, %r17, %r6
	.word 0x92c40011  ! 787: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xae9c2770  ! 787: XORcc_I	xorcc 	%r16, 0x0770, %r23
	.word 0x881c0011  ! 787: XOR_R	xor 	%r16, %r17, %r4
	.word 0x94042c0c  ! 787: ADD_I	add 	%r16, 0x0c0c, %r10
	.word 0x82c40011  ! 788: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0xbb342001  ! 788: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0xad2c1011  ! 788: SLLX_R	sllx	%r16, %r17, %r22
	.word 0x961c0011  ! 788: XOR_R	xor 	%r16, %r17, %r11
	.word 0x88840011  ! 788: ADDcc_R	addcc 	%r16, %r17, %r4
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd2cc2341  ! 788: LDSBA_I	ldsba	[%r16, + 0x0341] %asi, %r9
thr2_irf_ce_72:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_72), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0xaa040011  ! 791: ADD_R	add 	%r16, %r17, %r21
	.word 0x9c940011  ! 791: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0x91643801  ! 791: MOVcc_I	<illegal instruction>
	.word 0x9c440011  ! 791: ADDC_R	addc 	%r16, %r17, %r14
	.word 0x88440011  ! 791: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x988c2fd1  ! 791: ANDcc_I	andcc 	%r16, 0x0fd1, %r12
	.word 0x9c1c26dd  ! 791: XOR_I	xor 	%r16, 0x06dd, %r14
	.word 0x88442741  ! 791: ADDC_I	addc 	%r16, 0x0741, %r4
	.word 0xed142cd8  ! 792: LDQF_I	-	[%r16, 0x0cd8], %f22
	.word 0xed140011  ! 794: LDQF_R	-	[%r16, %r17], %f22
	.word 0x937c2401  ! 796: MOVR_I	move	%r16, 0xfffffe34, %r9
	.word 0xba3c0011  ! 796: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x9d2c0011  ! 796: SLL_R	sll 	%r16, %r17, %r14
	.word 0x98940011  ! 796: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x92942282  ! 796: ORcc_I	orcc 	%r16, 0x0282, %r9
	.word 0xac2c0011  ! 796: ANDN_R	andn 	%r16, %r17, %r22
	.word 0x8e8c2ec2  ! 796: ANDcc_I	andcc 	%r16, 0x0ec2, %r7
	.word 0x8b2c1011  ! 796: SLLX_R	sllx	%r16, %r17, %r5
thr2_dc_err_69:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_69), 16, 16),1,DC_DATA,2)
	.word 0xdb140000  ! 798: LDQF_R	-	[%r16, %r0], %f13
	.word 0xc9941011  ! 800: LDQFA_R	-	[%r16, %r17], %f4
	.word 0x9c3c2989  ! 802: XNOR_I	xnor 	%r16, 0x0989, %r14
	.word 0x8e84283e  ! 802: ADDcc_I	addcc 	%r16, 0x083e, %r7
	.word 0x83343001  ! 802: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x9b2c3001  ! 802: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x84140011  ! 802: OR_R	or 	%r16, %r17, %r2
	.word 0x9d2c3001  ! 802: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0x8b641811  ! 802: MOVcc_R	<illegal instruction>
	.word 0x91340011  ! 802: SRL_R	srl 	%r16, %r17, %r8
thr2_dc_err_70:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_70), 16, 16),1,DC_DATA,49)
	.word 0xd68c23cd  ! 804: LDUBA_I	lduba	[%r16, + 0x03cd] %asi, %r11
thr2_irf_ce_73:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_73), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xeb1c2ec7  ! 806: LDDF_I	ldd	[%r16, 0x0ec7], %f21
	.word 0xb4ac0011  ! 808: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0x84ac236c  ! 808: ANDNcc_I	andncc 	%r16, 0x036c, %r2
	.word 0x85341011  ! 808: SRLX_R	srlx	%r16, %r17, %r2
	.word 0x833c0011  ! 808: SRA_R	sra 	%r16, %r17, %r1
	.word 0x869424a9  ! 808: ORcc_I	orcc 	%r16, 0x04a9, %r3
	.word 0x9d3c0011  ! 808: SRA_R	sra 	%r16, %r17, %r14
	.word 0x9a940011  ! 808: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0xb53c1011  ! 808: SRAX_R	srax	%r16, %r17, %r26
thr2_dc_err_71:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_71), 16, 16),1,DC_DATA,15)
	.word 0xcd841000  ! 810: LDFA_R	lda	[%r16, %r0], %f6
thr2_irf_ce_74:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_74), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xd8d41011  ! 812: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r12
	.word 0x96342388  ! 814: ORN_I	orn 	%r16, 0x0388, %r11
	.word 0x9e8c2c8f  ! 814: ANDcc_I	andcc 	%r16, 0x0c8f, %r15
	.word 0x989c2450  ! 814: XORcc_I	xorcc 	%r16, 0x0450, %r12
	.word 0x9e3c29b7  ! 814: XNOR_I	xnor 	%r16, 0x09b7, %r15
	.word 0x8b3c2001  ! 814: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x9b643801  ! 814: MOVcc_I	<illegal instruction>
	.word 0xb8b40011  ! 814: ORNcc_R	orncc 	%r16, %r17, %r28
	.word 0xfa8c1011  ! 815: LDUBA_R	lduba	[%r16, %r17] 0x80, %r29
thr2_irf_ce_75:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_75), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xd64c2de2  ! 817: LDSB_I	ldsb	[%r16 + 0x0de2], %r11
	.word 0x83643801  ! 819: MOVcc_I	<illegal instruction>
	.word 0xb81c0011  ! 819: XOR_R	xor 	%r16, %r17, %r28
	.word 0xaa840011  ! 819: ADDcc_R	addcc 	%r16, %r17, %r21
	.word 0x92340011  ! 819: ORN_R	orn 	%r16, %r17, %r9
	.word 0x9e8c2b19  ! 819: ANDcc_I	andcc 	%r16, 0x0b19, %r15
	.word 0x8c3c22e2  ! 820: XNOR_I	xnor 	%r16, 0x02e2, %r6
	.word 0xb0440011  ! 820: ADDC_R	addc 	%r16, %r17, %r24
	.word 0x88440011  ! 820: ADDC_R	addc 	%r16, %r17, %r4
	.word 0xb3342001  ! 820: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x857c0411  ! 820: MOVR_R	move	%r16, %r17, %r2
	.word 0x99343001  ! 820: SRLX_I	srlx	%r16, 0x0001, %r12
	rd      %pc, %r18
	set     0x20, %r17
thr2_dc_err_72:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_72), 16, 16),1,DC_DATA,36)
	.word 0xec941000  ! 821: LDUHA_R	lduha	[%r16, %r0] 0x80, %r22
thr2_irf_ce_76:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_76), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	return     %r18 + %r17
	.word 0x84ac2ceb  ! 824: ANDNcc_I	andncc 	%r16, 0x0ceb, %r2
	.word 0x841c2f57  ! 824: XOR_I	xor 	%r16, 0x0f57, %r2
	.word 0x9604288f  ! 824: ADD_I	add 	%r16, 0x088f, %r11
	.word 0x86340011  ! 824: ORN_R	orn 	%r16, %r17, %r3
	.word 0x90842ac0  ! 824: ADDcc_I	addcc 	%r16, 0x0ac0, %r8
	.word 0x9c2c24d1  ! 824: ANDN_I	andn 	%r16, 0x04d1, %r14
	.word 0xb0340011  ! 824: ORN_R	orn 	%r16, %r17, %r24
thr2_dc_err_73:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_73), 16, 16),1,DC_DATA,47)
	.word 0xde442ea8  ! 826: LDSW_I	ldsw	[%r16 + 0x0ea8], %r15
thr2_irf_ce_77:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_77), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xfa2c257d  ! 830: STB_I	stb	%r29, [%r16 + 0x057d]
	.word 0xbabc0011  ! 832: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0x95643801  ! 832: MOVcc_I	<illegal instruction>
	.word 0x8d3c0011  ! 832: SRA_R	sra 	%r16, %r17, %r6
	.word 0xa8c40011  ! 832: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x877c2401  ! 832: MOVR_I	move	%r16, 0xfffffe34, %r3
thr2_dc_err_74:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_74), 16, 16),1,DC_DATA,57)
	.word 0xd41c2135  ! 834: LDD_I	ldd	[%r16 + 0x0135], %r10
thr2_irf_ce_78:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_78), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xc65c0011  ! 836: LDX_R	ldx	[%r16 + %r17], %r3
	.word 0xb43c0011  ! 838: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x98842170  ! 838: ADDcc_I	addcc 	%r16, 0x0170, %r12
	.word 0xbabc0011  ! 838: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0x883c2832  ! 838: XNOR_I	xnor 	%r16, 0x0832, %r4
	.word 0xb9643801  ! 838: MOVcc_I	<illegal instruction>
	.word 0x92842427  ! 838: ADDcc_I	addcc 	%r16, 0x0427, %r9
	.word 0x87643801  ! 838: MOVcc_I	<illegal instruction>
	.word 0x8c842fbe  ! 838: ADDcc_I	addcc 	%r16, 0x0fbe, %r6
thr2_dc_err_75:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_75), 16, 16),1,DC_DATA,60)
	.word 0xc29c1000  ! 840: LDDA_R	ldda	[%r16, %r0] 0x80, %r1
	.word 0xcaec1011  ! 842: LDSTUBA_R	ldstuba	%r5, [%r16 + %r17] 0x80
	.word 0x9ac40011  ! 844: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x9c942345  ! 844: ORcc_I	orcc 	%r16, 0x0345, %r14
	.word 0x87343001  ! 844: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0xab3c0011  ! 844: SRA_R	sra 	%r16, %r17, %r21
	.word 0xa6ac0011  ! 844: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0xa68c0011  ! 844: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0x92440011  ! 844: ADDC_R	addc 	%r16, %r17, %r9
	.word 0xb61c0011  ! 845: XOR_R	xor 	%r16, %r17, %r27
	.word 0x9cac2441  ! 845: ANDNcc_I	andncc 	%r16, 0x0441, %r14
	.word 0x8f2c2001  ! 845: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x96042707  ! 845: ADD_I	add 	%r16, 0x0707, %r11
	.word 0x82bc2719  ! 845: XNORcc_I	xnorcc 	%r16, 0x0719, %r1
	.word 0x83341011  ! 845: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x98ac2f20  ! 845: ANDNcc_I	andncc 	%r16, 0x0f20, %r12
	rd      %pc, %r18
	set     0x20, %r17
thr2_dc_err_76:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_76), 16, 16),1,DC_DATA,41)
	.word 0xc4040000  ! 846: LDUW_R	lduw	[%r16 + %r0], %r2
	return     %r18 + 0x20
	.word 0xb1340011  ! 849: SRL_R	srl 	%r16, %r17, %r24
	.word 0x85342001  ! 849: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x968c2b87  ! 849: ANDcc_I	andcc 	%r16, 0x0b87, %r11
	.word 0x9a440011  ! 849: ADDC_R	addc 	%r16, %r17, %r13
	.word 0xaa140011  ! 849: OR_R	or 	%r16, %r17, %r21
	.word 0x8b3c0011  ! 849: SRA_R	sra 	%r16, %r17, %r5
	.word 0x8c8c0011  ! 849: ANDcc_R	andcc 	%r16, %r17, %r6
thr2_dc_err_77:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_77), 16, 16),1,DC_DATA,61)
	.word 0xf65421b3  ! 851: LDSH_I	ldsh	[%r16 + 0x01b3], %r27
	.word 0xd05c0011  ! 853: LDX_R	ldx	[%r16 + %r17], %r8
	.word 0x9a940011  ! 855: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x9e842b82  ! 855: ADDcc_I	addcc 	%r16, 0x0b82, %r15
	.word 0x9f2c3001  ! 855: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x943c2d45  ! 855: XNOR_I	xnor 	%r16, 0x0d45, %r10
	.word 0x992c0011  ! 855: SLL_R	sll 	%r16, %r17, %r12
	.word 0x8b3c0011  ! 855: SRA_R	sra 	%r16, %r17, %r5
	.word 0xac1c2b87  ! 855: XOR_I	xor 	%r16, 0x0b87, %r22
	.word 0x992c1011  ! 855: SLLX_R	sllx	%r16, %r17, %r12
thr2_dc_err_78:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_78), 16, 16),1,DC_DATA,42)
	.word 0xf7040000  ! 857: LDF_R	ld	[%r16, %r0], %f27
!Illinst alu
	.word 0x8c8c249f  ! 859: ANDcc_I	andcc 	%r16, 0x049f, %r6
	.word 0x94840011  ! 861: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0x8d641811  ! 861: MOVcc_R	<illegal instruction>
	.word 0x823c0011  ! 861: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x99341011  ! 861: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x86940011  ! 861: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0xb0940011  ! 861: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0x963c2500  ! 861: XNOR_I	xnor 	%r16, 0x0500, %r11
	.word 0xfadc1011  ! 862: LDXA_R	ldxa	[%r16, %r17] 0x80, %r29
	.word 0xea941011  ! 864: LDUHA_R	lduha	[%r16, %r17] 0x80, %r21
	.word 0x853c2001  ! 866: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0x9b3c0011  ! 866: SRA_R	sra 	%r16, %r17, %r13
	.word 0x9d342001  ! 866: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x8e8c0011  ! 866: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x9b3c1011  ! 866: SRAX_R	srax	%r16, %r17, %r13
	.word 0x961c0011  ! 866: XOR_R	xor 	%r16, %r17, %r11
	.word 0x837c0411  ! 866: MOVR_R	move	%r16, %r17, %r1
	.word 0x88b40011  ! 866: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0xb0bc0011  ! 867: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0x8a940011  ! 867: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x983c20fd  ! 867: XNOR_I	xnor 	%r16, 0x00fd, %r12
	.word 0xb00c0011  ! 867: AND_R	and 	%r16, %r17, %r24
	.word 0xaf341011  ! 867: SRLX_R	srlx	%r16, %r17, %r23
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xed841011  ! 867: LDFA_R	lda	[%r16, %r17], %f22
	return     %r18 + %r17
	.word 0x8cc40011  ! 870: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x8d641811  ! 870: MOVcc_R	<illegal instruction>
	.word 0x8a842f40  ! 870: ADDcc_I	addcc 	%r16, 0x0f40, %r5
	.word 0x98b42588  ! 870: ORNcc_I	orncc 	%r16, 0x0588, %r12
	.word 0x9a840011  ! 870: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0xae3c0011  ! 870: XNOR_R	xnor 	%r16, %r17, %r23
thr2_dc_err_79:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_79), 16, 16),1,DC_DATA,35)
	.word 0xf9140000  ! 872: LDQF_R	-	[%r16, %r0], %f28
	.word 0xc81c287f  ! 874: LDD_I	ldd	[%r16 + 0x087f], %r4
	.word 0x8c3c0011  ! 876: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0xb48c238b  ! 876: ANDcc_I	andcc 	%r16, 0x038b, %r26
	.word 0xa72c0011  ! 876: SLL_R	sll 	%r16, %r17, %r19
	.word 0xb7343001  ! 876: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0x9f2c0011  ! 876: SLL_R	sll 	%r16, %r17, %r15
thr2_dc_err_80:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_80), 16, 16),1,DC_DATA,68)
	.word 0xd28c2e58  ! 878: LDUBA_I	lduba	[%r16, + 0x0e58] %asi, %r9
thr2_irf_ce_79:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_79), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xf5140011  ! 880: LDQF_R	-	[%r16, %r17], %f26
	.word 0x9d3c2001  ! 882: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x94142d12  ! 882: OR_I	or 	%r16, 0x0d12, %r10
	.word 0x821c211d  ! 882: XOR_I	xor 	%r16, 0x011d, %r1
	.word 0xa6b422b4  ! 882: ORNcc_I	orncc 	%r16, 0x02b4, %r19
	.word 0x8eb40011  ! 882: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0x872c3001  ! 882: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x88140011  ! 882: OR_R	or 	%r16, %r17, %r4
	.word 0xb72c2001  ! 882: SLL_I	sll 	%r16, 0x0001, %r27
thr2_dc_err_81:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_81), 16, 16),1,DC_DATA,1)
	.word 0xe85c0000  ! 884: LDX_R	ldx	[%r16 + %r0], %r20
thr2_irf_ce_80:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_80), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xd2dc1011  ! 886: LDXA_R	ldxa	[%r16, %r17] 0x80, %r9
	.word 0x8cac0011  ! 888: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0xacc42326  ! 888: ADDCcc_I	addccc 	%r16, 0x0326, %r22
	.word 0x933c0011  ! 888: SRA_R	sra 	%r16, %r17, %r9
	.word 0x9e9c0011  ! 888: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x85643801  ! 888: MOVcc_I	<illegal instruction>
	.word 0x8604221e  ! 888: ADD_I	add 	%r16, 0x021e, %r3
	.word 0xb09c0011  ! 888: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x848c28a4  ! 888: ANDcc_I	andcc 	%r16, 0x08a4, %r2
thr2_dc_err_82:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_82), 16, 16),1,DC_DATA,13)
	.word 0xe89422f1  ! 890: LDUHA_I	lduha	[%r16, + 0x02f1] %asi, %r20
thr2_irf_ce_81:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_81), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xda9c1011  ! 892: LDDA_R	ldda	[%r16, %r17] 0x80, %r13
	.word 0x8e94235f  ! 894: ORcc_I	orcc 	%r16, 0x035f, %r7
	.word 0x93341011  ! 894: SRLX_R	srlx	%r16, %r17, %r9
	.word 0xad2c1011  ! 894: SLLX_R	sllx	%r16, %r17, %r22
	.word 0x937c2401  ! 894: MOVR_I	move	%r16, 0xfffffe34, %r9
	.word 0x9e9c0011  ! 894: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0xb6ac0011  ! 894: ANDNcc_R	andncc 	%r16, %r17, %r27
	.word 0xce8c1011  ! 895: LDUBA_R	lduba	[%r16, %r17] 0x80, %r7
thr2_irf_ce_82:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_82), 16, 16),1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xd7841011  ! 897: LDFA_R	lda	[%r16, %r17], %f11
	.word 0x92840011  ! 899: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0xa92c1011  ! 899: SLLX_R	sllx	%r16, %r17, %r20
	.word 0xb6c40011  ! 899: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x832c3001  ! 899: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0xb20c0011  ! 899: AND_R	and 	%r16, %r17, %r25
	.word 0xd5941011  ! 900: LDQFA_R	-	[%r16, %r17], %f10
thr2_irf_ce_83:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_83), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xeadc1011  ! 902: LDXA_R	ldxa	[%r16, %r17] 0x80, %r21
	.word 0xaf2c0011  ! 904: SLL_R	sll 	%r16, %r17, %r23
	.word 0xa9343001  ! 904: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0x91341011  ! 904: SRLX_R	srlx	%r16, %r17, %r8
	.word 0xa81c2f74  ! 904: XOR_I	xor 	%r16, 0x0f74, %r20
	.word 0x912c2001  ! 904: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0xb82c0011  ! 904: ANDN_R	andn 	%r16, %r17, %r28
	.word 0xf1841011  ! 905: LDFA_R	lda	[%r16, %r17], %f24
thr2_irf_ce_84:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_84), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xc874226f  ! 909: STX_I	stx	%r4, [%r16 + 0x026f]
	.word 0x9e2c0011  ! 911: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x9d342001  ! 911: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0x841c27db  ! 911: XOR_I	xor 	%r16, 0x07db, %r2
	.word 0x94c40011  ! 911: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x8a940011  ! 911: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x912c1011  ! 911: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x88340011  ! 911: ORN_R	orn 	%r16, %r17, %r4
	.word 0x98140011  ! 911: OR_R	or 	%r16, %r17, %r12
	.word 0xc69c1011  ! 912: LDDA_R	ldda	[%r16, %r17] 0x80, %r3
	.word 0xd8942833  ! 914: LDUHA_I	lduha	[%r16, + 0x0833] %asi, %r12
	.word 0x9e2c2caa  ! 916: ANDN_I	andn 	%r16, 0x0caa, %r15
	.word 0x92bc0011  ! 916: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0xacb40011  ! 916: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0x8f2c2001  ! 916: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x960c2d05  ! 916: AND_I	and 	%r16, 0x0d05, %r11
	.word 0xcacc1011  ! 917: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r5
	.word 0xc4dc1011  ! 919: LDXA_R	ldxa	[%r16, %r17] 0x80, %r2
	.word 0xba2c0011  ! 921: ANDN_R	andn 	%r16, %r17, %r29
	.word 0x98842cd1  ! 921: ADDcc_I	addcc 	%r16, 0x0cd1, %r12
	.word 0x88b40011  ! 921: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0x8eac2d6d  ! 921: ANDNcc_I	andncc 	%r16, 0x0d6d, %r7
	.word 0x9d340011  ! 921: SRL_R	srl 	%r16, %r17, %r14
thr2_dc_err_83:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_83), 16, 16),1,DC_DATA,64)
	.word 0xc31c0000  ! 923: LDDF_R	ldd	[%r16, %r0], %f1
	.word 0xe71c0011  ! 925: LDDF_R	ldd	[%r16, %r17], %f19
	.word 0x923c0011  ! 927: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x8f7c2401  ! 927: MOVR_I	move	%r16, 0xfffffe34, %r7
	.word 0x962c2434  ! 927: ANDN_I	andn 	%r16, 0x0434, %r11
	.word 0x90bc2a64  ! 927: XNORcc_I	xnorcc 	%r16, 0x0a64, %r8
	.word 0x8e0c0011  ! 927: AND_R	and 	%r16, %r17, %r7
	.word 0xc4dc1011  ! 928: LDXA_R	ldxa	[%r16, %r17] 0x80, %r2
thr2_irf_ce_85:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_85), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	ta	T_CHANGE_HPRIV	! macro
	.word 0x96c40011  ! 932: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0xa6342187  ! 932: ORN_I	orn 	%r16, 0x0187, %r19
	.word 0xaabc2494  ! 932: XNORcc_I	xnorcc 	%r16, 0x0494, %r21
	.word 0x829c200a  ! 932: XORcc_I	xorcc 	%r16, 0x000a, %r1
	.word 0xad2c0011  ! 932: SLL_R	sll 	%r16, %r17, %r22
	.word 0x8e0c0011  ! 932: AND_R	and 	%r16, %r17, %r7
	.word 0x9cc42e1d  ! 932: ADDCcc_I	addccc 	%r16, 0x0e1d, %r14
	.word 0xe79c1011  ! 933: LDDFA_R	ldda	[%r16, %r17], %f19
thr2_irf_ce_86:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_86), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xef9c1011  ! 935: LDDFA_R	ldda	[%r16, %r17], %f23
	.word 0x9f2c1011  ! 937: SLLX_R	sllx	%r16, %r17, %r15
	.word 0xb0440011  ! 937: ADDC_R	addc 	%r16, %r17, %r24
	.word 0xac942e54  ! 937: ORcc_I	orcc 	%r16, 0x0e54, %r22
	.word 0x8a140011  ! 937: OR_R	or 	%r16, %r17, %r5
	.word 0x9d343001  ! 937: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x932c3001  ! 937: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0xdecc2629  ! 938: LDSBA_I	ldsba	[%r16, + 0x0629] %asi, %r15
thr2_irf_ce_87:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_87), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xd504211e  ! 940: LDF_I	ld	[%r16, 0x011e], %f10
	.word 0x95643801  ! 942: MOVcc_I	<illegal instruction>
	.word 0xb8b42a6c  ! 942: ORNcc_I	orncc 	%r16, 0x0a6c, %r28
	.word 0x9b643801  ! 942: MOVcc_I	<illegal instruction>
	.word 0xa93c2001  ! 942: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x8e940011  ! 942: ORcc_R	orcc 	%r16, %r17, %r7
thr2_dc_err_84:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_84), 16, 16),1,DC_DATA,68)
	.word 0xd8040000  ! 944: LDUW_R	lduw	[%r16 + %r0], %r12
	wr      %r0, 0x1, %asr26
	.word 0x832c0011  ! 948: SLL_R	sll 	%r16, %r17, %r1
	.word 0x88342d9d  ! 948: ORN_I	orn 	%r16, 0x0d9d, %r4
	.word 0xa61c0011  ! 948: XOR_R	xor 	%r16, %r17, %r19
	.word 0x933c2001  ! 948: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0xbac424d7  ! 948: ADDCcc_I	addccc 	%r16, 0x04d7, %r29
	.word 0x8ab40011  ! 948: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xcc140011  ! 949: LDUH_R	lduh	[%r16 + %r17], %r6
	.word 0xcb1c228c  ! 951: LDDF_I	ldd	[%r16, 0x028c], %f5
	.word 0x861c2f97  ! 953: XOR_I	xor 	%r16, 0x0f97, %r3
	.word 0x9e3c0011  ! 953: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0x873c1011  ! 953: SRAX_R	srax	%r16, %r17, %r3
	.word 0xb17c0411  ! 953: MOVR_R	move	%r16, %r17, %r24
	.word 0x88440011  ! 953: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x94042598  ! 953: ADD_I	add 	%r16, 0x0598, %r10
thr2_dc_err_85:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_85), 16, 16),1,DC_DATA,41)
	.word 0xdd841000  ! 955: LDFA_R	lda	[%r16, %r0], %f14
	.word 0xed042ef5  ! 957: LDF_I	ld	[%r16, 0x0ef5], %f22
	.word 0x96342429  ! 959: ORN_I	orn 	%r16, 0x0429, %r11
	.word 0x8f340011  ! 959: SRL_R	srl 	%r16, %r17, %r7
	.word 0x82140011  ! 959: OR_R	or 	%r16, %r17, %r1
	.word 0xad3c0011  ! 959: SRA_R	sra 	%r16, %r17, %r22
	.word 0x8e942756  ! 959: ORcc_I	orcc 	%r16, 0x0756, %r7
thr2_dc_err_86:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_86), 16, 16),1,DC_DATA,48)
	.word 0xd3841000  ! 961: LDFA_R	lda	[%r16, %r0], %f9
thr2_irf_ce_88:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_88), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xf0ec1011  ! 963: LDSTUBA_R	ldstuba	%r24, [%r16 + %r17] 0x80
	.word 0xb69c2ae9  ! 965: XORcc_I	xorcc 	%r16, 0x0ae9, %r27
	.word 0x973c2001  ! 965: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x90b40011  ! 965: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x902c0011  ! 965: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x8b2c0011  ! 965: SLL_R	sll 	%r16, %r17, %r5
thr2_dc_err_87:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_87), 16, 16),1,DC_DATA,29)
	.word 0xd3841000  ! 967: LDFA_R	lda	[%r16, %r0], %f9
thr2_irf_ce_89:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_89), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xc3ec2153  ! 969: PREFETCHA_I	prefetcha	[%r16, + 0x0153] %asi, #one_read
	.word 0x8b643801  ! 971: MOVcc_I	<illegal instruction>
	.word 0xb6442aa8  ! 971: ADDC_I	addc 	%r16, 0x0aa8, %r27
	.word 0x8c040011  ! 971: ADD_R	add 	%r16, %r17, %r6
	.word 0xb20c0011  ! 971: AND_R	and 	%r16, %r17, %r25
	.word 0x99643801  ! 971: MOVcc_I	<illegal instruction>
	.word 0x8a142b4c  ! 971: OR_I	or 	%r16, 0x0b4c, %r5
	.word 0xaf2c2001  ! 971: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0xdc040011  ! 972: LDUW_R	lduw	[%r16 + %r17], %r14
!Illinst store
	.word 0xf8740011  ! 974: STX_R	stx	%r28, [%r16 + %r17]
	.word 0xb62c24b1  ! 976: ANDN_I	andn 	%r16, 0x04b1, %r27
	.word 0x921c27b1  ! 976: XOR_I	xor 	%r16, 0x07b1, %r9
	.word 0x9a840011  ! 976: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x86c42b0e  ! 976: ADDCcc_I	addccc 	%r16, 0x0b0e, %r3
	.word 0xac2c26a6  ! 976: ANDN_I	andn 	%r16, 0x06a6, %r22
	.word 0x9a2c0011  ! 976: ANDN_R	andn 	%r16, %r17, %r13
	.word 0xe6cc24af  ! 977: LDSBA_I	ldsba	[%r16, + 0x04af] %asi, %r19
	.word 0xe9941011  ! 979: LDQFA_R	-	[%r16, %r17], %f20
	.word 0x892c3001  ! 981: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0xaf3c0011  ! 981: SRA_R	sra 	%r16, %r17, %r23
	.word 0x9b3c2001  ! 981: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0xae140011  ! 981: OR_R	or 	%r16, %r17, %r23
	.word 0x83343001  ! 981: SRLX_I	srlx	%r16, 0x0001, %r1
thr2_dc_err_88:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_88), 16, 16),1,DC_DATA,62)
	.word 0xf8cc26ad  ! 983: LDSBA_I	ldsba	[%r16, + 0x06ad] %asi, %r28
thr2_irf_ce_90:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_90), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xc5140011  ! 985: LDQF_R	-	[%r16, %r17], %f2
	.word 0xb22c0011  ! 987: ANDN_R	andn 	%r16, %r17, %r25
	.word 0xa83428c7  ! 987: ORN_I	orn 	%r16, 0x08c7, %r20
	.word 0x8c9c0011  ! 987: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0xb0340011  ! 987: ORN_R	orn 	%r16, %r17, %r24
	.word 0x862c275f  ! 987: ANDN_I	andn 	%r16, 0x075f, %r3
thr2_dc_err_89:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_89), 16, 16),1,DC_DATA,5)
	.word 0xc7140000  ! 989: LDQF_R	-	[%r16, %r0], %f3
thr2_irf_ce_91:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_91), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xf79c1011  ! 991: LDDFA_R	ldda	[%r16, %r17], %f27
	.word 0x8d342001  ! 993: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x8484259b  ! 993: ADDcc_I	addcc 	%r16, 0x059b, %r2
	.word 0xb53c0011  ! 993: SRA_R	sra 	%r16, %r17, %r26
	.word 0x8e0c27d1  ! 993: AND_I	and 	%r16, 0x07d1, %r7
	.word 0xb1340011  ! 993: SRL_R	srl 	%r16, %r17, %r24
	.word 0xb12c2001  ! 993: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0x8ec420e7  ! 993: ADDCcc_I	addccc 	%r16, 0x00e7, %r7
	.word 0xb83c0011  ! 993: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xc29c29b5  ! 994: LDDA_I	ldda	[%r16, + 0x09b5] %asi, %r1
thr2_irf_ce_92:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_92), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xd2dc219e  ! 996: LDXA_I	ldxa	[%r16, + 0x019e] %asi, %r9
	.word 0x901c21c1  ! 998: XOR_I	xor 	%r16, 0x01c1, %r8
	.word 0x8e440011  ! 998: ADDC_R	addc 	%r16, %r17, %r7
	.word 0x99340011  ! 998: SRL_R	srl 	%r16, %r17, %r12
	.word 0x8b2c1011  ! 998: SLLX_R	sllx	%r16, %r17, %r5
	.word 0x9f2c3001  ! 998: SLLX_I	sllx	%r16, 0x0001, %r15
thr2_dc_err_90:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_90), 16, 16),1,DC_DATA,14)
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
        setx  0x0000000000000d90, %g1, %r17
        setx  0x4ba5f1bf7b6859f3, %g1, %r0
        setx  0xaef0cdc9717e6777, %g1, %r1
        setx  0x5aa467a42f51a2ac, %g1, %r2
        setx  0xc06ac548b9cc8557, %g1, %r3
        setx  0xc17e5e268ed2b5e4, %g1, %r4
        setx  0xe1c3ace5efe00bc7, %g1, %r5
        setx  0x9bb3e3efd71b0a1b, %g1, %r6
        setx  0xc13ca65e4cb7137b, %g1, %r7
        setx  0xb6203f43e1831bae, %g1, %r8
        setx  0x7865093f8ef77943, %g1, %r9
        setx  0xbfeb1d10313c20f5, %g1, %r10
        setx  0xff0c54cadb12e41f, %g1, %r11
        setx  0x99094fd7e7e5771e, %g1, %r12
        setx  0xa8b0015e6a18d785, %g1, %r13
        setx  0xcab0f57febee7caa, %g1, %r14
        setx  0x9900a9c3ca782692, %g1, %r15
        setx  0x00112e93ddf6ed1f, %g1, %r18
        setx  0x524c03c33a0223bc, %g1, %r19
        setx  0xa8f15577258392ba, %g1, %r20
        setx  0xa5024c08d56b7071, %g1, %r21
        setx  0xd01fc303f6a3baf8, %g1, %r22
        setx  0x28b2209d26f19f2a, %g1, %r23
        setx  0x89806a8f141fe6b0, %g1, %r24
        setx  0xb8b913d9f041bf2b, %g1, %r25
        setx  0x70ed5311f90b8383, %g1, %r26
        setx  0x6dc0add4f15c5d97, %g1, %r27
        setx  0x26d478bd537a187c, %g1, %r28
        setx  0xfeec92c31dead4c1, %g1, %r29
        setx  0x0734e771cf0e0cd2, %g1, %r30
        setx  0x13b74e9a6bb4110f, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d70, %g1, %r17
        setx  0xecbe5dc24a3c5645, %g1, %r0
        setx  0xc6f21454c119b74c, %g1, %r1
        setx  0x0e4b31cc84a9833d, %g1, %r2
        setx  0x27628d940424cd5b, %g1, %r3
        setx  0x967085827452a86b, %g1, %r4
        setx  0xfc2eac2a136a1aac, %g1, %r5
        setx  0x021fc176d8c93c4c, %g1, %r6
        setx  0xa6d0c0424012e401, %g1, %r7
        setx  0x69a843c2c68a4692, %g1, %r8
        setx  0x92751a497517136c, %g1, %r9
        setx  0xb2edd3fd016f9e7b, %g1, %r10
        setx  0x11cdc713cdb7939a, %g1, %r11
        setx  0xccea274f8284566c, %g1, %r12
        setx  0x20966e4f1e04c60e, %g1, %r13
        setx  0xf360bf000700a436, %g1, %r14
        setx  0x0b07fcb603ee1daf, %g1, %r15
        setx  0x87f51e6645b5e12a, %g1, %r18
        setx  0x623365a39d45dade, %g1, %r19
        setx  0xe1dd91f89545ba22, %g1, %r20
        setx  0x56b5f911844c16df, %g1, %r21
        setx  0xa4daf63497365793, %g1, %r22
        setx  0xecb2332f46b5878e, %g1, %r23
        setx  0x1366199af0abeb86, %g1, %r24
        setx  0x35bacaaf3be06003, %g1, %r25
        setx  0x5356d818530331cc, %g1, %r26
        setx  0xd7258ef6b30b5e3c, %g1, %r27
        setx  0x09581c0ca28f738b, %g1, %r28
        setx  0x4898ac02b2577f18, %g1, %r29
        setx  0x5770a5d7a54fd711, %g1, %r30
        setx  0x877ad221ec6b18d5, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000880, %g1, %r17
        setx  0x853b0ff104b24e14, %g1, %r0
        setx  0x997fb0344d781100, %g1, %r1
        setx  0xfb041a81a44375a0, %g1, %r2
        setx  0x0564520c5cfa1554, %g1, %r3
        setx  0xdf357746e6be7bd5, %g1, %r4
        setx  0x09665e9e33a8d52a, %g1, %r5
        setx  0xd656329b3e8658e6, %g1, %r6
        setx  0xd4be81bc9969cee9, %g1, %r7
        setx  0x25e7a41b74aebd66, %g1, %r8
        setx  0xe77a0eeeeed7c93b, %g1, %r9
        setx  0x5a0b2991ac7a5964, %g1, %r10
        setx  0x2617f732f908f5ad, %g1, %r11
        setx  0xb5d0766957f4f8c0, %g1, %r12
        setx  0xfed3919969645d03, %g1, %r13
        setx  0xebccd1d05edb1334, %g1, %r14
        setx  0x5f5c601dac8eb2bd, %g1, %r15
        setx  0x71cc0b03a9a8b632, %g1, %r18
        setx  0xdf9882e92bd332a3, %g1, %r19
        setx  0x965614b1a8e02c81, %g1, %r20
        setx  0xf8a8c7033b74f0d7, %g1, %r21
        setx  0xfd620a2da346d0d4, %g1, %r22
        setx  0x52bc8e1e6bfa5104, %g1, %r23
        setx  0x430345aec56e8c2c, %g1, %r24
        setx  0x96c76888eb781ab3, %g1, %r25
        setx  0x69b22dc387435b4c, %g1, %r26
        setx  0x4f3bb33947f1c701, %g1, %r27
        setx  0x2e33f17da742a8b5, %g1, %r28
        setx  0x890c46121a47fa65, %g1, %r29
        setx  0x61633c70a781812d, %g1, %r30
        setx  0x69fb495aedef3975, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000dc0, %g1, %r17
        setx  0xb613da5d74092c56, %g1, %r0
        setx  0xdc0569a61472681d, %g1, %r1
        setx  0xa0223da16d4a74e0, %g1, %r2
        setx  0xabb1107043db0391, %g1, %r3
        setx  0xc93f35c2f5c85b79, %g1, %r4
        setx  0xd172e5d5c20fb1b8, %g1, %r5
        setx  0x8e6f7633e32dbde2, %g1, %r6
        setx  0x32dd83d68b5575d8, %g1, %r7
        setx  0xd42afe648ba6c003, %g1, %r8
        setx  0xe7336e909a4f3e0b, %g1, %r9
        setx  0xd072923cf88fcecf, %g1, %r10
        setx  0x8e8d3f5b682f6aef, %g1, %r11
        setx  0x98af985118d69d77, %g1, %r12
        setx  0x61ace1275d837321, %g1, %r13
        setx  0x160cd820fbf0b8da, %g1, %r14
        setx  0x58d357827fd5fc72, %g1, %r15
        setx  0xb984942f3f05967a, %g1, %r18
        setx  0xfd34a176b34cb62d, %g1, %r19
        setx  0x6e9a581889337a25, %g1, %r20
        setx  0xa4dd3fed15623522, %g1, %r21
        setx  0xf3ba1e6fb9d7a163, %g1, %r22
        setx  0x827ec5b1335af473, %g1, %r23
        setx  0xa2b66a2a556a77ea, %g1, %r24
        setx  0x94a8bb1a8165a600, %g1, %r25
        setx  0xc8b7d4ec73133604, %g1, %r26
        setx  0x04fcda5987b2fe8d, %g1, %r27
        setx  0x41e5c40b9e322728, %g1, %r28
        setx  0xe0879c7147e1714c, %g1, %r29
        setx  0x748e0755d0be39ad, %g1, %r30
        setx  0x444f112679a6af58, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000a90, %g1, %r17
        setx  0x06083579df19d8fd, %g1, %r0
        setx  0x8dd0ba7b7165e4b6, %g1, %r1
        setx  0xcbe5e307997fd1aa, %g1, %r2
        setx  0xae2f82fffa664fb6, %g1, %r3
        setx  0x66d92acb3bd4f4ac, %g1, %r4
        setx  0x5fda93528ada90f0, %g1, %r5
        setx  0x576a032f825f599b, %g1, %r6
        setx  0xb12b1d814dcbed38, %g1, %r7
        setx  0xd447848168cae819, %g1, %r8
        setx  0x8d4870f295097416, %g1, %r9
        setx  0x2fefd5afe84cc3fb, %g1, %r10
        setx  0xaf245df64de150bc, %g1, %r11
        setx  0x8b9f7d13fa83e797, %g1, %r12
        setx  0x965fcdcecc8ea006, %g1, %r13
        setx  0x2e38fcd2591b11d9, %g1, %r14
        setx  0x04d7521ae16945ab, %g1, %r15
        setx  0xaecfabfa7dcea8a2, %g1, %r18
        setx  0x2f2e4140b6687987, %g1, %r19
        setx  0xea3de19f9e7ea7a8, %g1, %r20
        setx  0x11d373fb7dcc2456, %g1, %r21
        setx  0xadbee9ff6c57aa41, %g1, %r22
        setx  0xffcec74d6c12ffbc, %g1, %r23
        setx  0xd02fce674904d08c, %g1, %r24
        setx  0x01d9d82c18ef5a55, %g1, %r25
        setx  0x9d83e5b4dfd5cc56, %g1, %r26
        setx  0x0eec3c4408a5f735, %g1, %r27
        setx  0xfca2c1325a5948c0, %g1, %r28
        setx  0xda0d0c10a50f3540, %g1, %r29
        setx  0xb98c54fe509c5814, %g1, %r30
        setx  0x4dbc2ff3a24f5d4b, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000130, %g1, %r17
        setx  0xb9f2c31d49deda72, %g1, %r0
        setx  0xc95daf87d6752a1b, %g1, %r1
        setx  0x28f64d489c56032a, %g1, %r2
        setx  0x58bbfcef14f25f0e, %g1, %r3
        setx  0x0e39ffa37b1c7245, %g1, %r4
        setx  0x529f63bd5137bb3b, %g1, %r5
        setx  0x8f382c41d8d1ade7, %g1, %r6
        setx  0x1d1c264caee9f23c, %g1, %r7
        setx  0x044d88ad395280a1, %g1, %r8
        setx  0x5cefa0d196c0db86, %g1, %r9
        setx  0x70184d374a2dc496, %g1, %r10
        setx  0xb3d4213fad7673ad, %g1, %r11
        setx  0x05b5cbc8e7f9c8ca, %g1, %r12
        setx  0xdf72ad2738be495b, %g1, %r13
        setx  0x87df14a735948040, %g1, %r14
        setx  0x14d9491914ec2bf6, %g1, %r15
        setx  0x7f2d84a8502d8fd5, %g1, %r18
        setx  0x1e40603f263398e2, %g1, %r19
        setx  0xe1e7fdd84cf14532, %g1, %r20
        setx  0x4f293ffc59b21f96, %g1, %r21
        setx  0x906d0899073d342b, %g1, %r22
        setx  0x1829be868d6ae380, %g1, %r23
        setx  0x5f8c944631e1dd59, %g1, %r24
        setx  0x9ff338d5697e9f25, %g1, %r25
        setx  0xcd8af6e246b8e3b9, %g1, %r26
        setx  0x982beec03276402c, %g1, %r27
        setx  0xb882d78c2258fcee, %g1, %r28
        setx  0x2bd3e7443e2c60d1, %g1, %r29
        setx  0xd7f377fed392be70, %g1, %r30
        setx  0x00fc1133eae58614, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000f90, %g1, %r17
        setx  0xb4c3201369414bdc, %g1, %r0
        setx  0x6bd6deb860a203cb, %g1, %r1
        setx  0xa414c576ebe21fff, %g1, %r2
        setx  0xd2fb24717438834a, %g1, %r3
        setx  0xb8a430c16c4ad835, %g1, %r4
        setx  0xd9caa1a47113feed, %g1, %r5
        setx  0x0e73ba585b5a4df1, %g1, %r6
        setx  0x043b2d9ed7c0d022, %g1, %r7
        setx  0x4ab0e10fbddea8f9, %g1, %r8
        setx  0x83f3970e0dd2eb8c, %g1, %r9
        setx  0xfd10d1962c296a38, %g1, %r10
        setx  0x178f35f650c3f055, %g1, %r11
        setx  0xc42ac20414fbe569, %g1, %r12
        setx  0xcf292c22ca2900bc, %g1, %r13
        setx  0x1de4cb734f360c8e, %g1, %r14
        setx  0x90017c5aed0ebcb7, %g1, %r15
        setx  0x5105dbf8804149e4, %g1, %r18
        setx  0x5651b703cec74c7a, %g1, %r19
        setx  0x69bc1387a1e516d1, %g1, %r20
        setx  0xb66262c757116295, %g1, %r21
        setx  0x6448b1ebd38484d7, %g1, %r22
        setx  0xec1ba0f83a238e7c, %g1, %r23
        setx  0xfc0162ceafaffd30, %g1, %r24
        setx  0xd8a25907fda5e886, %g1, %r25
        setx  0xfbf22bda3359f26e, %g1, %r26
        setx  0x4320e68a5513d03d, %g1, %r27
        setx  0xf006140f1ee55fdd, %g1, %r28
        setx  0x8e7cea7962c793db, %g1, %r29
        setx  0xcf07f5b130f4aac1, %g1, %r30
        setx  0x6f81670700a3865c, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000006b0, %g1, %r17
        setx  0xfe5f6f5bbb74fdb4, %g1, %r0
        setx  0x52aa18234edfb055, %g1, %r1
        setx  0x786ea23dfdfa2779, %g1, %r2
        setx  0x0670297367b724c0, %g1, %r3
        setx  0xc37f918b7c5d3cb2, %g1, %r4
        setx  0xcd06bea1c91c933e, %g1, %r5
        setx  0xa0ed0285b4fe05d2, %g1, %r6
        setx  0x0f33ece5054b3c1b, %g1, %r7
        setx  0x0985819f8c8acbd9, %g1, %r8
        setx  0x3f6d3386c0519edd, %g1, %r9
        setx  0x4ed62a46700ca0f3, %g1, %r10
        setx  0x09f826037c1a2c3b, %g1, %r11
        setx  0xf113820dab217dbd, %g1, %r12
        setx  0xe2ad22b411027f29, %g1, %r13
        setx  0x4962dd72ba396fd4, %g1, %r14
        setx  0x1070b7ee6224037f, %g1, %r15
        setx  0x961cb2b73bbeae0b, %g1, %r18
        setx  0xa33f1a13d8516fa3, %g1, %r19
        setx  0xc10b4ddd1104e97a, %g1, %r20
        setx  0xaf9d1f576e39d586, %g1, %r21
        setx  0x23053b99039713c1, %g1, %r22
        setx  0xeb69d433b92432b8, %g1, %r23
        setx  0xad6e15f05b34e19e, %g1, %r24
        setx  0x551c52ee7cce78fb, %g1, %r25
        setx  0x0e306be3e7e18c7c, %g1, %r26
        setx  0xb21788dc8396330b, %g1, %r27
        setx  0x4dc87fd96ec8063e, %g1, %r28
        setx  0x8b45d4639c50c6a3, %g1, %r29
        setx  0x033d9893b8b71a9a, %g1, %r30
        setx  0x6fcf2db1a05dde6f, %g1, %r31
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
	.word 0xd3042535  ! 2: LDF_I	ld	[%r16, 0x0535], %f9
	.word 0xf3841011  ! 4: LDFA_R	lda	[%r16, %r17], %f25
	.word 0xa81c2f88  ! 6: XOR_I	xor 	%r16, 0x0f88, %r20
	.word 0x8ac40011  ! 6: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x98bc0011  ! 6: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x917c2401  ! 6: MOVR_I	move	%r16, 0xfffffe34, %r8
	.word 0x95343001  ! 6: SRLX_I	srlx	%r16, 0x0001, %r10
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,55)
	.word 0xe90427b9  ! 8: LDF_I	ld	[%r16, 0x07b9], %f20
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd4442703  ! 10: LDSW_I	ldsw	[%r16 + 0x0703], %r10
	.word 0x8b2c0011  ! 12: SLL_R	sll 	%r16, %r17, %r5
	.word 0x9c840011  ! 12: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0xb84424a7  ! 12: ADDC_I	addc 	%r16, 0x04a7, %r28
	.word 0x9c9c26e5  ! 12: XORcc_I	xorcc 	%r16, 0x06e5, %r14
	.word 0x9f2c3001  ! 12: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x933c1011  ! 12: SRAX_R	srax	%r16, %r17, %r9
	.word 0xa6b40011  ! 12: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0x949c2192  ! 12: XORcc_I	xorcc 	%r16, 0x0192, %r10
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,48)
	.word 0xf21c296e  ! 14: LDD_I	ldd	[%r16 + 0x096e], %r25
!Illinst alu
	.word 0xaea42987  ! 16: SUBcc_I	subcc 	%r16, 0x0987, %r23
	.word 0x8ab42dd0  ! 18: ORNcc_I	orncc 	%r16, 0x0dd0, %r5
	.word 0xb8140011  ! 18: OR_R	or 	%r16, %r17, %r28
	.word 0x862c2be8  ! 18: ANDN_I	andn 	%r16, 0x0be8, %r3
	.word 0x8f643801  ! 18: MOVcc_I	<illegal instruction>
	.word 0x8e9c0011  ! 18: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x8a440011  ! 18: ADDC_R	addc 	%r16, %r17, %r5
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,67)
	.word 0xd3140000  ! 20: LDQF_R	-	[%r16, %r0], %f9
	.word 0x8152c000  ! 22: RDPR_CANRESTORE	rdpr	%canrestore, %r0
	.word 0xaab42be6  ! 24: ORNcc_I	orncc 	%r16, 0x0be6, %r21
	.word 0xb49c0011  ! 24: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xbb3c0011  ! 24: SRA_R	sra 	%r16, %r17, %r29
	.word 0xaa8c0011  ! 24: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0x937c2401  ! 24: MOVR_I	move	%r16, 0xfffffe34, %r9
	.word 0x82440011  ! 24: ADDC_R	addc 	%r16, %r17, %r1
	.word 0xdccc2c08  ! 25: LDSBA_I	ldsba	[%r16, + 0x0c08] %asi, %r14
	.word 0xee8429e3  ! 27: LDUWA_I	lduwa	[%r16, + 0x09e3] %asi, %r23
	.word 0x9c84258b  ! 29: ADDcc_I	addcc 	%r16, 0x058b, %r14
	.word 0xab343001  ! 29: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0x90440011  ! 29: ADDC_R	addc 	%r16, %r17, %r8
	.word 0xb28c2670  ! 29: ANDcc_I	andcc 	%r16, 0x0670, %r25
	.word 0x84bc28be  ! 29: XNORcc_I	xnorcc 	%r16, 0x08be, %r2
	.word 0x983c0011  ! 29: XNOR_R	xnor 	%r16, %r17, %r12
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,65)
	.word 0xe89c2125  ! 31: LDDA_I	ldda	[%r16, + 0x0125] %asi, %r20
	.word 0x81580000  ! 33: FLUSHW	flushw
	.word 0x8f643801  ! 35: MOVcc_I	<illegal instruction>
	.word 0xa8142b81  ! 35: OR_I	or 	%r16, 0x0b81, %r20
	.word 0x903c23da  ! 35: XNOR_I	xnor 	%r16, 0x03da, %r8
	.word 0x8e040011  ! 35: ADD_R	add 	%r16, %r17, %r7
	.word 0x912c2001  ! 35: SLL_I	sll 	%r16, 0x0001, %r8
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,38)
	.word 0xcf040000  ! 37: LDF_R	ld	[%r16, %r0], %f7
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0x81494000  ! 39: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0x88ac0011  ! 41: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x9d2c1011  ! 41: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x8e140011  ! 41: OR_R	or 	%r16, %r17, %r7
	.word 0x9c3c0011  ! 41: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x84b423bb  ! 41: ORNcc_I	orncc 	%r16, 0x03bb, %r2
	.word 0xf20c0011  ! 42: LDUB_R	ldub	[%r16 + %r17], %r25
	.word 0xf1841011  ! 44: LDFA_R	lda	[%r16, %r17], %f24
	.word 0x92942ebc  ! 46: ORcc_I	orcc 	%r16, 0x0ebc, %r9
	.word 0xb4840011  ! 46: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0xa89c0011  ! 46: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0x85643801  ! 46: MOVcc_I	<illegal instruction>
	.word 0x853c2001  ! 46: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0xa7341011  ! 46: SRLX_R	srlx	%r16, %r17, %r19
	.word 0xa61c2ec2  ! 46: XOR_I	xor 	%r16, 0x0ec2, %r19
	.word 0x941c2a01  ! 46: XOR_I	xor 	%r16, 0x0a01, %r10
	.word 0xf8d42d78  ! 47: LDSHA_I	ldsha	[%r16, + 0x0d78] %asi, %r28
!Illinst alu
	.word 0x997c0411  ! 49: MOVR_R	move	%r16, %r17, %r12
	.word 0xb1341011  ! 51: SRLX_R	srlx	%r16, %r17, %r24
	.word 0x88840011  ! 51: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0xa77c2401  ! 51: MOVR_I	move	%r16, 0xfffffe34, %r19
	.word 0xbac42aa2  ! 51: ADDCcc_I	addccc 	%r16, 0x0aa2, %r29
	.word 0x8d3c0011  ! 51: SRA_R	sra 	%r16, %r17, %r6
	.word 0xb3641811  ! 51: MOVcc_R	<illegal instruction>
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,32)
	.word 0xeb9c1000  ! 53: LDDFA_R	ldda	[%r16, %r0], %f21
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xeec42b0b  ! 55: LDSWA_I	ldswa	[%r16, + 0x0b0b] %asi, %r23
	.word 0x828c0011  ! 57: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x9e840011  ! 57: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xae8c0011  ! 57: ANDcc_R	andcc 	%r16, %r17, %r23
	.word 0xac3420f5  ! 57: ORN_I	orn 	%r16, 0x00f5, %r22
	.word 0x94ac0011  ! 57: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xef040011  ! 58: LDF_R	ld	[%r16, %r17], %f23
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xcc8c2e4b  ! 60: LDUBA_I	lduba	[%r16, + 0x0e4b] %asi, %r6
	.word 0xb97c0411  ! 62: MOVR_R	move	%r16, %r17, %r28
	.word 0x840c23ea  ! 62: AND_I	and 	%r16, 0x03ea, %r2
	.word 0xb4842d5f  ! 62: ADDcc_I	addcc 	%r16, 0x0d5f, %r26
	.word 0xb53c2001  ! 62: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0xaa940011  ! 62: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x88040011  ! 62: ADD_R	add 	%r16, %r17, %r4
	.word 0xb12c3001  ! 62: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x98940011  ! 62: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0xdadc1011  ! 63: LDXA_R	ldxa	[%r16, %r17] 0x80, %r13
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xd21423a3  ! 65: LDUH_I	lduh	[%r16 + 0x03a3], %r9
	.word 0x93343001  ! 67: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x901429b5  ! 67: OR_I	or 	%r16, 0x09b5, %r8
	.word 0x9e940011  ! 67: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x99340011  ! 67: SRL_R	srl 	%r16, %r17, %r12
	.word 0x882c2ff6  ! 67: ANDN_I	andn 	%r16, 0x0ff6, %r4
	.word 0x8f342001  ! 67: SRL_I	srl 	%r16, 0x0001, %r7
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,12)
	.word 0xc85c2679  ! 69: LDX_I	ldx	[%r16 + 0x0679], %r4
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xd64c2353  ! 71: LDSB_I	ldsb	[%r16 + 0x0353], %r11
	.word 0x9c1c2226  ! 73: XOR_I	xor 	%r16, 0x0226, %r14
	.word 0x8a0c2759  ! 73: AND_I	and 	%r16, 0x0759, %r5
	.word 0x9b3c2001  ! 73: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x98040011  ! 73: ADD_R	add 	%r16, %r17, %r12
	.word 0x8ec42ffd  ! 73: ADDCcc_I	addccc 	%r16, 0x0ffd, %r7
	.word 0xb28c2312  ! 73: ANDcc_I	andcc 	%r16, 0x0312, %r25
	.word 0x96b40011  ! 73: ORNcc_R	orncc 	%r16, %r17, %r11
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,53)
	.word 0xca4c2867  ! 75: LDSB_I	ldsb	[%r16 + 0x0867], %r5
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xd0342d6a  ! 79: STH_I	sth	%r8, [%r16 + 0x0d6a]
	.word 0xb17c0411  ! 81: MOVR_R	move	%r16, %r17, %r24
	.word 0x84c40011  ! 81: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xb4ac0011  ! 81: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0x981c21f1  ! 81: XOR_I	xor 	%r16, 0x01f1, %r12
	.word 0x90840011  ! 81: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x940420e8  ! 81: ADD_I	add 	%r16, 0x00e8, %r10
	.word 0x8c942c4e  ! 81: ORcc_I	orcc 	%r16, 0x0c4e, %r6
	.word 0xd2d42f04  ! 82: LDSHA_I	ldsha	[%r16, + 0x0f04] %asi, %r9
	wr      %r0, 0x5, %asr26
	.word 0x85341011  ! 86: SRLX_R	srlx	%r16, %r17, %r2
	.word 0x8a942cf2  ! 86: ORcc_I	orcc 	%r16, 0x0cf2, %r5
	.word 0x84142b3d  ! 86: OR_I	or 	%r16, 0x0b3d, %r2
	.word 0xbab421d9  ! 86: ORNcc_I	orncc 	%r16, 0x01d9, %r29
	.word 0x92442062  ! 86: ADDC_I	addc 	%r16, 0x0062, %r9
	.word 0xc2cc2b21  ! 87: LDSBA_I	ldsba	[%r16, + 0x0b21] %asi, %r1
	.word 0xd6dc1011  ! 89: LDXA_R	ldxa	[%r16, %r17] 0x80, %r11
	.word 0x92340011  ! 91: ORN_R	orn 	%r16, %r17, %r9
	.word 0x90340011  ! 91: ORN_R	orn 	%r16, %r17, %r8
	.word 0x98040011  ! 91: ADD_R	add 	%r16, %r17, %r12
	.word 0x88940011  ! 91: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0xaaac206f  ! 91: ANDNcc_I	andncc 	%r16, 0x006f, %r21
	.word 0x82c42016  ! 91: ADDCcc_I	addccc 	%r16, 0x0016, %r1
	.word 0x893c0011  ! 91: SRA_R	sra 	%r16, %r17, %r4
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,42)
	.word 0xd8942647  ! 93: LDUHA_I	lduha	[%r16, + 0x0647] %asi, %r12
	.word 0xea841011  ! 95: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r21
	.word 0xb68c0011  ! 97: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x93341011  ! 97: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x848c0011  ! 97: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x84942866  ! 97: ORcc_I	orcc 	%r16, 0x0866, %r2
	.word 0x8a1c2414  ! 97: XOR_I	xor 	%r16, 0x0414, %r5
thr1_dc_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_9), 16, 16),1,DC_DATA,69)
	.word 0xca5c0000  ! 99: LDX_R	ldx	[%r16 + %r0], %r5
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xee140011  ! 101: LDUH_R	lduh	[%r16 + %r17], %r23
	.word 0xaaac2ba4  ! 103: ANDNcc_I	andncc 	%r16, 0x0ba4, %r21
	.word 0xac9c2ecb  ! 103: XORcc_I	xorcc 	%r16, 0x0ecb, %r22
	.word 0xa8c40011  ! 103: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x9b7c2401  ! 103: MOVR_I	move	%r16, 0xfffffe34, %r13
	.word 0x91643801  ! 103: MOVcc_I	<illegal instruction>
	.word 0xd81c0011  ! 104: LDD_R	ldd	[%r16 + %r17], %r12
	.word 0xe61c273e  ! 106: LDD_I	ldd	[%r16 + 0x073e], %r19
	.word 0xacb40011  ! 108: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0xa81c247d  ! 108: XOR_I	xor 	%r16, 0x047d, %r20
	.word 0xb6040011  ! 108: ADD_R	add 	%r16, %r17, %r27
	.word 0xacc42af1  ! 108: ADDCcc_I	addccc 	%r16, 0x0af1, %r22
	.word 0x98940011  ! 108: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x829c0011  ! 108: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0xb12c1011  ! 108: SLLX_R	sllx	%r16, %r17, %r24
thr1_dc_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_10), 16, 16),1,DC_DATA,40)
	.word 0xcc5c2dc6  ! 110: LDX_I	ldx	[%r16 + 0x0dc6], %r6
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xe8540011  ! 112: LDSH_R	ldsh	[%r16 + %r17], %r20
	.word 0x92042411  ! 114: ADD_I	add 	%r16, 0x0411, %r9
	.word 0x8b641811  ! 114: MOVcc_R	<illegal instruction>
	.word 0x98c40011  ! 114: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x903c0011  ! 114: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x82440011  ! 114: ADDC_R	addc 	%r16, %r17, %r1
	.word 0xf4842f3d  ! 115: LDUWA_I	lduwa	[%r16, + 0x0f3d] %asi, %r26
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xc91c0011  ! 117: LDDF_R	ldd	[%r16, %r17], %f4
	.word 0x98340011  ! 119: ORN_R	orn 	%r16, %r17, %r12
	.word 0x823c0011  ! 119: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x84940011  ! 119: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x8f2c1011  ! 119: SLLX_R	sllx	%r16, %r17, %r7
	.word 0x9c3c2f83  ! 119: XNOR_I	xnor 	%r16, 0x0f83, %r14
	.word 0xfa8c1011  ! 120: LDUBA_R	lduba	[%r16, %r17] 0x80, %r29
        wr  %g0, 0x80, %asi
	.word 0x92c42683  ! 124: ADDCcc_I	addccc 	%r16, 0x0683, %r9
	.word 0xb12c0011  ! 124: SLL_R	sll 	%r16, %r17, %r24
	.word 0x8c1c26ae  ! 124: XOR_I	xor 	%r16, 0x06ae, %r6
	.word 0x90440011  ! 124: ADDC_R	addc 	%r16, %r17, %r8
	.word 0x9f340011  ! 124: SRL_R	srl 	%r16, %r17, %r15
	.word 0xb0c42806  ! 124: ADDCcc_I	addccc 	%r16, 0x0806, %r24
	.word 0xd71c2b83  ! 125: LDDF_I	ldd	[%r16, 0x0b83], %f11
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xd8dc1011  ! 127: LDXA_R	ldxa	[%r16, %r17] 0x80, %r12
	.word 0x949c2a4d  ! 129: XORcc_I	xorcc 	%r16, 0x0a4d, %r10
	.word 0xab2c0011  ! 129: SLL_R	sll 	%r16, %r17, %r21
	.word 0x99342001  ! 129: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x977c0411  ! 129: MOVR_R	move	%r16, %r17, %r11
	.word 0xb37c2401  ! 129: MOVR_I	move	%r16, 0xfffffe34, %r25
	.word 0x98c425cd  ! 129: ADDCcc_I	addccc 	%r16, 0x05cd, %r12
	.word 0xe9040011  ! 130: LDF_R	ld	[%r16, %r17], %f20
	.word 0x81dc2102  ! 132: FLUSH_I	flush
	.word 0x96bc23e6  ! 134: XNORcc_I	xnorcc 	%r16, 0x03e6, %r11
	.word 0xaa842b49  ! 134: ADDcc_I	addcc 	%r16, 0x0b49, %r21
	.word 0x9284224d  ! 134: ADDcc_I	addcc 	%r16, 0x024d, %r9
	.word 0x8e2c2391  ! 134: ANDN_I	andn 	%r16, 0x0391, %r7
	.word 0x8e140011  ! 134: OR_R	or 	%r16, %r17, %r7
	.word 0x8a1c0011  ! 134: XOR_R	xor 	%r16, %r17, %r5
	.word 0x95341011  ! 134: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x8a042c8b  ! 134: ADD_I	add 	%r16, 0x0c8b, %r5
thr1_dc_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_11), 16, 16),1,DC_DATA,58)
	.word 0xd6440000  ! 136: LDSW_R	ldsw	[%r16 + %r0], %r11
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xe71c0011  ! 138: LDDF_R	ldd	[%r16, %r17], %f19
	.word 0x96942efa  ! 140: ORcc_I	orcc 	%r16, 0x0efa, %r11
	.word 0xb72c0011  ! 140: SLL_R	sll 	%r16, %r17, %r27
	.word 0x9ebc2874  ! 140: XNORcc_I	xnorcc 	%r16, 0x0874, %r15
	.word 0xb73c0011  ! 140: SRA_R	sra 	%r16, %r17, %r27
	.word 0xa804210e  ! 140: ADD_I	add 	%r16, 0x010e, %r20
thr1_dc_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_12), 16, 16),1,DC_DATA,71)
	.word 0xd2540000  ! 142: LDSH_R	ldsh	[%r16 + %r0], %r9
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xf2542268  ! 144: LDSH_I	ldsh	[%r16 + 0x0268], %r25
	.word 0xa894226f  ! 146: ORcc_I	orcc 	%r16, 0x026f, %r20
	.word 0x893c1011  ! 146: SRAX_R	srax	%r16, %r17, %r4
	.word 0x932c1011  ! 146: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x92140011  ! 146: OR_R	or 	%r16, %r17, %r9
	.word 0x86bc2195  ! 146: XNORcc_I	xnorcc 	%r16, 0x0195, %r3
	.word 0x880c26f8  ! 146: AND_I	and 	%r16, 0x06f8, %r4
thr1_dc_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_13), 16, 16),1,DC_DATA,56)
	.word 0xe71c0000  ! 148: LDDF_R	ldd	[%r16, %r0], %f19
thr1_resum_intr_1504:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1504), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x0, %asr26
	.word 0x9ebc21cd  ! 152: XNORcc_I	xnorcc 	%r16, 0x01cd, %r15
	.word 0x94bc0011  ! 152: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x9f643801  ! 152: MOVcc_I	<illegal instruction>
	.word 0x85643801  ! 152: MOVcc_I	<illegal instruction>
	.word 0x8e8c0011  ! 152: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x84940011  ! 152: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0xd08c2ffb  ! 153: LDUBA_I	lduba	[%r16, + 0x0ffb] %asi, %r8
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xeadc2319  ! 155: LDXA_I	ldxa	[%r16, + 0x0319] %asi, %r21
	.word 0x932c3001  ! 157: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0xad641811  ! 157: MOVcc_R	<illegal instruction>
	.word 0x92342b40  ! 157: ORN_I	orn 	%r16, 0x0b40, %r9
	.word 0xab3c0011  ! 157: SRA_R	sra 	%r16, %r17, %r21
	.word 0x9c840011  ! 157: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0x87341011  ! 157: SRLX_R	srlx	%r16, %r17, %r3
thr1_dc_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_14), 16, 16),1,DC_DATA,23)
	.word 0xdf1c0000  ! 159: LDDF_R	ldd	[%r16, %r0], %f15
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xc84c0011  ! 161: LDSB_R	ldsb	[%r16 + %r17], %r4
	.word 0x842c0011  ! 163: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x90c40011  ! 163: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0xb4840011  ! 163: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0xb53c1011  ! 163: SRAX_R	srax	%r16, %r17, %r26
	.word 0x943c2cc5  ! 163: XNOR_I	xnor 	%r16, 0x0cc5, %r10
	.word 0x882c0011  ! 163: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xf2dc1011  ! 164: LDXA_R	ldxa	[%r16, %r17] 0x80, %r25
	.word 0xc3ec1011  ! 166: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0xb57c0411  ! 168: MOVR_R	move	%r16, %r17, %r26
	.word 0xb81c26d3  ! 168: XOR_I	xor 	%r16, 0x06d3, %r28
	.word 0xaf2c1011  ! 168: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x8c1c0011  ! 168: XOR_R	xor 	%r16, %r17, %r6
	.word 0xb444211f  ! 168: ADDC_I	addc 	%r16, 0x011f, %r26
	.word 0x82bc0011  ! 168: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x9a340011  ! 168: ORN_R	orn 	%r16, %r17, %r13
	.word 0x8ebc2335  ! 168: XNORcc_I	xnorcc 	%r16, 0x0335, %r7
	.word 0xed142477  ! 169: LDQF_I	-	[%r16, 0x0477], %f22
	wr      %r0, 0x1, %asr26
	.word 0x94040011  ! 173: ADD_R	add 	%r16, %r17, %r10
	.word 0xb68c2de1  ! 173: ANDcc_I	andcc 	%r16, 0x0de1, %r27
	.word 0x99643801  ! 173: MOVcc_I	<illegal instruction>
	.word 0x8d643801  ! 173: MOVcc_I	<illegal instruction>
	.word 0x972c1011  ! 173: SLLX_R	sllx	%r16, %r17, %r11
thr1_dc_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_15), 16, 16),1,DC_DATA,32)
	.word 0xe8841000  ! 175: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r20
	.word 0xaadc0011  ! 177: SMULcc_R	smulcc 	%r16, %r17, %r21
	.word 0x88142c8e  ! 179: OR_I	or 	%r16, 0x0c8e, %r4
	.word 0x892c3001  ! 179: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0x8d3c2001  ! 179: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0xb28c0011  ! 179: ANDcc_R	andcc 	%r16, %r17, %r25
	.word 0x9d7c2401  ! 179: MOVR_I	move	%r16, 0xfffffe34, %r14
	.word 0x903c0011  ! 179: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x8834299e  ! 179: ORN_I	orn 	%r16, 0x099e, %r4
	.word 0x8b343001  ! 179: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0xd5142eb2  ! 180: LDQF_I	-	[%r16, 0x0eb2], %f10
	.word 0xcd040011  ! 182: LDF_R	ld	[%r16, %r17], %f6
	.word 0x9e040011  ! 184: ADD_R	add 	%r16, %r17, %r15
	.word 0x8b2c3001  ! 184: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x90042b3b  ! 184: ADD_I	add 	%r16, 0x0b3b, %r8
	.word 0x968420a4  ! 184: ADDcc_I	addcc 	%r16, 0x00a4, %r11
	.word 0x93643801  ! 184: MOVcc_I	<illegal instruction>
	.word 0x9ec42e5a  ! 184: ADDCcc_I	addccc 	%r16, 0x0e5a, %r15
thr1_dc_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_16), 16, 16),1,DC_DATA,67)
	.word 0xf48c1000  ! 186: LDUBA_R	lduba	[%r16, %r0] 0x80, %r26
	.word 0x9cdc0011  ! 188: SMULcc_R	smulcc 	%r16, %r17, %r14
	.word 0xba842bd7  ! 190: ADDcc_I	addcc 	%r16, 0x0bd7, %r29
	.word 0x94142bfe  ! 190: OR_I	or 	%r16, 0x0bfe, %r10
	.word 0x84040011  ! 190: ADD_R	add 	%r16, %r17, %r2
	.word 0x93340011  ! 190: SRL_R	srl 	%r16, %r17, %r9
	.word 0x94342a91  ! 190: ORN_I	orn 	%r16, 0x0a91, %r10
thr1_dc_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_17), 16, 16),1,DC_DATA,13)
	.word 0xd6841000  ! 192: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r11
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xe6540011  ! 194: LDSH_R	ldsh	[%r16 + %r17], %r19
	.word 0x9e2c21b1  ! 196: ANDN_I	andn 	%r16, 0x01b1, %r15
	.word 0x88140011  ! 196: OR_R	or 	%r16, %r17, %r4
	.word 0x922c2e0a  ! 196: ANDN_I	andn 	%r16, 0x0e0a, %r9
	.word 0xb0c42b96  ! 196: ADDCcc_I	addccc 	%r16, 0x0b96, %r24
	.word 0x9a1428a4  ! 196: OR_I	or 	%r16, 0x08a4, %r13
	.word 0x8e340011  ! 196: ORN_R	orn 	%r16, %r17, %r7
thr1_dc_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_18), 16, 16),1,DC_DATA,45)
	.word 0xd684237d  ! 198: LDUWA_I	lduwa	[%r16, + 0x037d] %asi, %r11
	.word 0xf00c0011  ! 200: LDUB_R	ldub	[%r16 + %r17], %r24
	.word 0x921c21b4  ! 202: XOR_I	xor 	%r16, 0x01b4, %r9
	.word 0xae0c0011  ! 202: AND_R	and 	%r16, %r17, %r23
	.word 0xb0840011  ! 202: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0x9f641811  ! 202: MOVcc_R	<illegal instruction>
	.word 0x92ac0011  ! 202: ANDNcc_R	andncc 	%r16, %r17, %r9
thr1_dc_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_19), 16, 16),1,DC_DATA,29)
	.word 0xd9941000  ! 204: LDQFA_R	-	[%r16, %r0], %f12
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xc42c28d4  ! 208: STB_I	stb	%r2, [%r16 + 0x08d4]
	.word 0xb2b4219f  ! 210: ORNcc_I	orncc 	%r16, 0x019f, %r25
	.word 0x84b40011  ! 210: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0x94440011  ! 210: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x968c2e00  ! 210: ANDcc_I	andcc 	%r16, 0x0e00, %r11
	.word 0xab342001  ! 210: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x9b3c2001  ! 210: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x9e840011  ! 210: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x82840011  ! 210: ADDcc_R	addcc 	%r16, %r17, %r1
thr1_dc_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_20), 16, 16),1,DC_DATA,48)
	.word 0xf9941000  ! 212: LDQFA_R	-	[%r16, %r0], %f28
!Illinst store
	.word 0xf82c0011  ! 214: STB_R	stb	%r28, [%r16 + %r17]
	.word 0xba1c208f  ! 216: XOR_I	xor 	%r16, 0x008f, %r29
	.word 0x9aac0011  ! 216: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0x8214288c  ! 216: OR_I	or 	%r16, 0x088c, %r1
	.word 0x9b2c2001  ! 216: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0x909c2144  ! 216: XORcc_I	xorcc 	%r16, 0x0144, %r8
	.word 0x8a440011  ! 216: ADDC_R	addc 	%r16, %r17, %r5
	.word 0xac8c2aba  ! 216: ANDcc_I	andcc 	%r16, 0x0aba, %r22
	.word 0xc2cc1011  ! 217: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r1
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xd0d41011  ! 219: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r8
	.word 0x9ac40011  ! 221: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xb9341011  ! 221: SRLX_R	srlx	%r16, %r17, %r28
	.word 0xae840011  ! 221: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0xab2c0011  ! 221: SLL_R	sll 	%r16, %r17, %r21
	.word 0x883c0011  ! 221: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x893c0011  ! 221: SRA_R	sra 	%r16, %r17, %r4
	.word 0xfa1c289a  ! 222: LDD_I	ldd	[%r16 + 0x089a], %r29
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xce9c1011  ! 224: LDDA_R	ldda	[%r16, %r17] 0x80, %r7
	.word 0x8aac2822  ! 226: ANDNcc_I	andncc 	%r16, 0x0822, %r5
	.word 0xb12c0011  ! 226: SLL_R	sll 	%r16, %r17, %r24
	.word 0x9e3c2d7e  ! 226: XNOR_I	xnor 	%r16, 0x0d7e, %r15
	.word 0xb6840011  ! 226: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0x980c2767  ! 226: AND_I	and 	%r16, 0x0767, %r12
	.word 0x9c940011  ! 226: ORcc_R	orcc 	%r16, %r17, %r14
thr1_dc_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_21), 16, 16),1,DC_DATA,0)
	.word 0xce1c2be7  ! 228: LDD_I	ldd	[%r16 + 0x0be7], %r7
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0x8143e038  ! 230: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
	.word 0x853c1011  ! 232: SRAX_R	srax	%r16, %r17, %r2
	.word 0xa8b42ef5  ! 232: ORNcc_I	orncc 	%r16, 0x0ef5, %r20
	.word 0xb404251e  ! 232: ADD_I	add 	%r16, 0x051e, %r26
	.word 0x8f2c1011  ! 232: SLLX_R	sllx	%r16, %r17, %r7
	.word 0x949c2f58  ! 232: XORcc_I	xorcc 	%r16, 0x0f58, %r10
	.word 0x91343001  ! 232: SRLX_I	srlx	%r16, 0x0001, %r8
thr1_dc_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_22), 16, 16),1,DC_DATA,42)
	.word 0xf39c1000  ! 234: LDDFA_R	ldda	[%r16, %r0], %f25
thr1_irf_ce_20:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_20), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xdb040011  ! 236: LDF_R	ld	[%r16, %r17], %f13
	.word 0xb01c0011  ! 238: XOR_R	xor 	%r16, %r17, %r24
	.word 0xb00c248d  ! 238: AND_I	and 	%r16, 0x048d, %r24
	.word 0x9f342001  ! 238: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xb4840011  ! 238: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0xac8c0011  ! 238: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0x8a0c0011  ! 238: AND_R	and 	%r16, %r17, %r5
	.word 0x843c2905  ! 238: XNOR_I	xnor 	%r16, 0x0905, %r2
	.word 0x96040011  ! 238: ADD_R	add 	%r16, %r17, %r11
	.word 0xd0c42862  ! 239: LDSWA_I	ldswa	[%r16, + 0x0862] %asi, %r8
thr1_irf_ce_21:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_21), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	wr      %r0, 0x5, %asr26
	.word 0xb42c0011  ! 243: ANDN_R	andn 	%r16, %r17, %r26
	.word 0x881c0011  ! 243: XOR_R	xor 	%r16, %r17, %r4
	.word 0xae340011  ! 243: ORN_R	orn 	%r16, %r17, %r23
	.word 0xb4840011  ! 243: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0x92040011  ! 243: ADD_R	add 	%r16, %r17, %r9
	.word 0xacac20d2  ! 243: ANDNcc_I	andncc 	%r16, 0x00d2, %r22
	.word 0x9d2c2001  ! 243: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0x8ab42d3e  ! 243: ORNcc_I	orncc 	%r16, 0x0d3e, %r5
thr1_dc_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_23), 16, 16),1,DC_DATA,31)
	.word 0xc80c2cb8  ! 245: LDUB_I	ldub	[%r16 + 0x0cb8], %r4
!Illinst alu
	.word 0x828c2021  ! 247: ANDcc_I	andcc 	%r16, 0x0021, %r1
	.word 0x98c426a5  ! 249: ADDCcc_I	addccc 	%r16, 0x06a5, %r12
	.word 0xbac42f17  ! 249: ADDCcc_I	addccc 	%r16, 0x0f17, %r29
	.word 0x863c29bc  ! 249: XNOR_I	xnor 	%r16, 0x09bc, %r3
	.word 0x9e3c2f5a  ! 249: XNOR_I	xnor 	%r16, 0x0f5a, %r15
	.word 0x98142ae5  ! 249: OR_I	or 	%r16, 0x0ae5, %r12
	.word 0xd6dc1011  ! 250: LDXA_R	ldxa	[%r16, %r17] 0x80, %r11
!Illinst store
	.word 0xd6240011  ! 252: STW_R	stw	%r11, [%r16 + %r17]
	.word 0x8f2c2001  ! 254: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0xb0440011  ! 254: ADDC_R	addc 	%r16, %r17, %r24
	.word 0x820c0011  ! 254: AND_R	and 	%r16, %r17, %r1
	.word 0x8a342364  ! 254: ORN_I	orn 	%r16, 0x0364, %r5
	.word 0x9a140011  ! 254: OR_R	or 	%r16, %r17, %r13
	.word 0xdb040011  ! 255: LDF_R	ld	[%r16, %r17], %f13
!Illinst store
	.word 0xfa340011  ! 257: STH_R	sth	%r29, [%r16 + %r17]
	.word 0x969c2a65  ! 259: XORcc_I	xorcc 	%r16, 0x0a65, %r11
	.word 0x96940011  ! 259: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0xb6ac2e89  ! 259: ANDNcc_I	andncc 	%r16, 0x0e89, %r27
	.word 0xb03c2725  ! 259: XNOR_I	xnor 	%r16, 0x0725, %r24
	.word 0x9cc42133  ! 259: ADDCcc_I	addccc 	%r16, 0x0133, %r14
	.word 0x9f7c2401  ! 259: MOVR_I	move	%r16, 0xfffffe34, %r15
	.word 0xd2140011  ! 260: LDUH_R	lduh	[%r16 + %r17], %r9
	.word 0xf6c41011  ! 262: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r27
	.word 0x9c8c0011  ! 264: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0xae3c0011  ! 264: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x9c442697  ! 264: ADDC_I	addc 	%r16, 0x0697, %r14
	.word 0x973c2001  ! 264: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x8c940011  ! 264: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0xa8c40011  ! 264: ADDCcc_R	addccc 	%r16, %r17, %r20
thr1_dc_err_24:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_24), 16, 16),1,DC_DATA,29)
	.word 0xf71c2733  ! 266: LDDF_I	ldd	[%r16, 0x0733], %f27
thr1_irf_ce_22:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_22), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xcd042627  ! 268: LDF_I	ld	[%r16, 0x0627], %f6
	.word 0x9e3428b3  ! 270: ORN_I	orn 	%r16, 0x08b3, %r15
	.word 0xb9343001  ! 270: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x8e2c0011  ! 270: ANDN_R	andn 	%r16, %r17, %r7
	.word 0x8a1c2834  ! 270: XOR_I	xor 	%r16, 0x0834, %r5
	.word 0x9694221c  ! 270: ORcc_I	orcc 	%r16, 0x021c, %r11
	.word 0x9c842535  ! 270: ADDcc_I	addcc 	%r16, 0x0535, %r14
	.word 0x8b343001  ! 270: SRLX_I	srlx	%r16, 0x0001, %r5
thr1_dc_err_25:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_25), 16, 16),1,DC_DATA,15)
	.word 0xce1c0000  ! 272: LDD_R	ldd	[%r16 + %r0], %r7
thr1_irf_ce_23:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_23), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xec540011  ! 274: LDSH_R	ldsh	[%r16 + %r17], %r22
	.word 0xb28c2272  ! 276: ANDcc_I	andcc 	%r16, 0x0272, %r25
	.word 0x9abc28a4  ! 276: XNORcc_I	xnorcc 	%r16, 0x08a4, %r13
	.word 0x9b2c3001  ! 276: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x88bc0011  ! 276: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0xac340011  ! 276: ORN_R	orn 	%r16, %r17, %r22
	.word 0x94940011  ! 276: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x92c40011  ! 276: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x829c2a40  ! 276: XORcc_I	xorcc 	%r16, 0x0a40, %r1
thr1_dc_err_26:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_26), 16, 16),1,DC_DATA,63)
	.word 0xe71c0000  ! 278: LDDF_R	ldd	[%r16, %r0], %f19
thr1_irf_ce_24:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_24), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xd4841011  ! 280: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r10
	.word 0xb8942ec4  ! 282: ORcc_I	orcc 	%r16, 0x0ec4, %r28
	.word 0x863c29e2  ! 282: XNOR_I	xnor 	%r16, 0x09e2, %r3
	.word 0x94340011  ! 282: ORN_R	orn 	%r16, %r17, %r10
	.word 0x98ac0011  ! 282: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x9ebc0011  ! 282: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0xb6040011  ! 282: ADD_R	add 	%r16, %r17, %r27
	.word 0x8e4422fd  ! 282: ADDC_I	addc 	%r16, 0x02fd, %r7
	.word 0xd65c0011  ! 283: LDX_R	ldx	[%r16 + %r17], %r11
	.word 0xf24c0011  ! 285: LDSB_R	ldsb	[%r16 + %r17], %r25
	.word 0x8e3c20c3  ! 287: XNOR_I	xnor 	%r16, 0x00c3, %r7
	.word 0x95342001  ! 287: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0xb2ac282d  ! 287: ANDNcc_I	andncc 	%r16, 0x082d, %r25
	.word 0x9a340011  ! 287: ORN_R	orn 	%r16, %r17, %r13
	.word 0xb3342001  ! 287: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x8d3c2001  ! 287: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0xaa440011  ! 287: ADDC_R	addc 	%r16, %r17, %r21
thr1_dc_err_27:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_27), 16, 16),1,DC_DATA,56)
	.word 0xd7841000  ! 289: LDFA_R	lda	[%r16, %r0], %f11
thr1_irf_ce_25:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_25), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xca8c1011  ! 291: LDUBA_R	lduba	[%r16, %r17] 0x80, %r5
	.word 0x86c4262f  ! 293: ADDCcc_I	addccc 	%r16, 0x062f, %r3
	.word 0x82840011  ! 293: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xac1c0011  ! 293: XOR_R	xor 	%r16, %r17, %r22
	.word 0x877c0411  ! 293: MOVR_R	move	%r16, %r17, %r3
	.word 0x9e940011  ! 293: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x908c20d3  ! 293: ANDcc_I	andcc 	%r16, 0x00d3, %r8
	.word 0xb8ac2da0  ! 293: ANDNcc_I	andncc 	%r16, 0x0da0, %r28
	.word 0xab2c2001  ! 293: SLL_I	sll 	%r16, 0x0001, %r21
thr1_dc_err_28:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_28), 16, 16),1,DC_DATA,70)
	.word 0xf01c0000  ! 295: LDD_R	ldd	[%r16 + %r0], %r24
thr1_irf_ce_26:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_26), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
        wr  %g0, 0x80, %asi
	.word 0x9c1422f2  ! 299: OR_I	or 	%r16, 0x02f2, %r14
	.word 0x92c40011  ! 299: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x932c0011  ! 299: SLL_R	sll 	%r16, %r17, %r9
	.word 0x8a942073  ! 299: ORcc_I	orcc 	%r16, 0x0073, %r5
	.word 0x960c0011  ! 299: AND_R	and 	%r16, %r17, %r11
	.word 0xb4c42291  ! 299: ADDCcc_I	addccc 	%r16, 0x0291, %r26
	.word 0x98c40011  ! 299: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0xd8842095  ! 300: LDUWA_I	lduwa	[%r16, + 0x0095] %asi, %r12
!Illinst alu
	.word 0x92ac0011  ! 302: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x88b40011  ! 304: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0x9c3c238a  ! 304: XNOR_I	xnor 	%r16, 0x038a, %r14
	.word 0x932c2001  ! 304: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x9c9c2448  ! 304: XORcc_I	xorcc 	%r16, 0x0448, %r14
	.word 0x89343001  ! 304: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x94c42c62  ! 304: ADDCcc_I	addccc 	%r16, 0x0c62, %r10
	.word 0xdcdc2703  ! 305: LDXA_I	ldxa	[%r16, + 0x0703] %asi, %r14
	wr      %r0, 0x1, %asr26
	.word 0xb20c0011  ! 309: AND_R	and 	%r16, %r17, %r25
	.word 0x8b7c0411  ! 309: MOVR_R	move	%r16, %r17, %r5
	.word 0xba2c0011  ! 309: ANDN_R	andn 	%r16, %r17, %r29
	.word 0x88340011  ! 309: ORN_R	orn 	%r16, %r17, %r4
	.word 0xa88c2ee9  ! 309: ANDcc_I	andcc 	%r16, 0x0ee9, %r20
	.word 0xa83421cb  ! 309: ORN_I	orn 	%r16, 0x01cb, %r20
	.word 0x8e842eb4  ! 309: ADDcc_I	addcc 	%r16, 0x0eb4, %r7
	.word 0x8a140011  ! 309: OR_R	or 	%r16, %r17, %r5
	.word 0xf64c0011  ! 310: LDSB_R	ldsb	[%r16 + %r17], %r27
thr1_irf_ce_27:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_27), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xc7040011  ! 312: LDF_R	ld	[%r16, %r17], %f3
	.word 0x82842806  ! 314: ADDcc_I	addcc 	%r16, 0x0806, %r1
	.word 0x84bc0011  ! 314: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x912c3001  ! 314: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x82340011  ! 314: ORN_R	orn 	%r16, %r17, %r1
	.word 0x923c22bf  ! 314: XNOR_I	xnor 	%r16, 0x02bf, %r9
thr1_dc_err_29:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_29), 16, 16),1,DC_DATA,53)
	.word 0xcb140000  ! 316: LDQF_R	-	[%r16, %r0], %f5
	.word 0x81dc0011  ! 318: FLUSH_R	flush
	.word 0x840c0011  ! 320: AND_R	and 	%r16, %r17, %r2
	.word 0x9d2c3001  ! 320: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0xa6140011  ! 320: OR_R	or 	%r16, %r17, %r19
	.word 0x941420e2  ! 320: OR_I	or 	%r16, 0x00e2, %r10
	.word 0xb0ac0011  ! 320: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0xaac42132  ! 320: ADDCcc_I	addccc 	%r16, 0x0132, %r21
	.word 0xdedc1011  ! 321: LDXA_R	ldxa	[%r16, %r17] 0x80, %r15
	.word 0xfb040011  ! 323: LDF_R	ld	[%r16, %r17], %f29
	.word 0x96ac0011  ! 325: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x89341011  ! 325: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x9a44206a  ! 325: ADDC_I	addc 	%r16, 0x006a, %r13
	.word 0x9e9c20ff  ! 325: XORcc_I	xorcc 	%r16, 0x00ff, %r15
	.word 0x96042f14  ! 325: ADD_I	add 	%r16, 0x0f14, %r11
	.word 0x9a3c0011  ! 325: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0xb2940011  ! 325: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0xeb1424d4  ! 326: LDQF_I	-	[%r16, 0x04d4], %f21
thr1_irf_ce_28:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_28), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xd71c2a1c  ! 328: LDDF_I	ldd	[%r16, 0x0a1c], %f11
	.word 0x8c142da6  ! 330: OR_I	or 	%r16, 0x0da6, %r6
	.word 0x8ebc2d0c  ! 330: XNORcc_I	xnorcc 	%r16, 0x0d0c, %r7
	.word 0x917c0411  ! 330: MOVR_R	move	%r16, %r17, %r8
	.word 0x968c2c7c  ! 330: ANDcc_I	andcc 	%r16, 0x0c7c, %r11
	.word 0xb3641811  ! 330: MOVcc_R	<illegal instruction>
thr1_dc_err_30:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_30), 16, 16),1,DC_DATA,62)
	.word 0xdccc1000  ! 332: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r14
	.word 0x81880000  ! 334: SAVED	saved
	.word 0xb2440011  ! 336: ADDC_R	addc 	%r16, %r17, %r25
	.word 0xb3641811  ! 336: MOVcc_R	<illegal instruction>
	.word 0x90842270  ! 336: ADDcc_I	addcc 	%r16, 0x0270, %r8
	.word 0x9b342001  ! 336: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0xac9c0011  ! 336: XORcc_R	xorcc 	%r16, %r17, %r22
thr1_dc_err_31:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_31), 16, 16),1,DC_DATA,61)
	.word 0xd31c25bf  ! 338: LDDF_I	ldd	[%r16, 0x05bf], %f9
thr1_irf_ce_29:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_29), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xf62c282a  ! 342: STB_I	stb	%r27, [%r16 + 0x082a]
	.word 0x928c0011  ! 344: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0x900c2d2a  ! 344: AND_I	and 	%r16, 0x0d2a, %r8
	.word 0x87641811  ! 344: MOVcc_R	<illegal instruction>
	.word 0xba2c0011  ! 344: ANDN_R	andn 	%r16, %r17, %r29
	.word 0xa8ac0011  ! 344: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0xec9c1011  ! 345: LDDA_R	ldda	[%r16, %r17] 0x80, %r22
	.word 0xdc2c26a3  ! 349: STB_I	stb	%r14, [%r16 + 0x06a3]
	.word 0x94c42c09  ! 351: ADDCcc_I	addccc 	%r16, 0x0c09, %r10
	.word 0xaec4232d  ! 351: ADDCcc_I	addccc 	%r16, 0x032d, %r23
	.word 0x9e040011  ! 351: ADD_R	add 	%r16, %r17, %r15
	.word 0x9b343001  ! 351: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0x82840011  ! 351: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xb52c3001  ! 351: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xf454226b  ! 352: LDSH_I	ldsh	[%r16 + 0x026b], %r26
thr1_irf_ce_30:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_30), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xec242d27  ! 356: STW_I	stw	%r22, [%r16 + 0x0d27]
	.word 0x8b7c0411  ! 358: MOVR_R	move	%r16, %r17, %r5
	.word 0x8cb40011  ! 358: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x842c0011  ! 358: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x9a34236b  ! 358: ORN_I	orn 	%r16, 0x036b, %r13
	.word 0x97340011  ! 358: SRL_R	srl 	%r16, %r17, %r11
	.word 0xf61c23c6  ! 359: LDD_I	ldd	[%r16 + 0x03c6], %r27
thr1_irf_ce_31:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_31), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xf81c0011  ! 361: LDD_R	ldd	[%r16 + %r17], %r28
	.word 0x9ec40011  ! 363: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0xaa3c2624  ! 363: XNOR_I	xnor 	%r16, 0x0624, %r21
	.word 0xb13c0011  ! 363: SRA_R	sra 	%r16, %r17, %r24
	.word 0xbab40011  ! 363: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x92142f93  ! 363: OR_I	or 	%r16, 0x0f93, %r9
	.word 0xa72c1011  ! 363: SLLX_R	sllx	%r16, %r17, %r19
	.word 0xb49c0011  ! 363: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xbabc0011  ! 363: XNORcc_R	xnorcc 	%r16, %r17, %r29
thr1_dc_err_32:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_32), 16, 16),1,DC_DATA,36)
	.word 0xf64c0000  ! 365: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xef3c0011  ! 367: STDF_R	std	%f23, [%r17, %r16]
	.word 0xa88c2fcb  ! 369: ANDcc_I	andcc 	%r16, 0x0fcb, %r20
	.word 0xac3c0011  ! 369: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x96c420ee  ! 369: ADDCcc_I	addccc 	%r16, 0x00ee, %r11
	.word 0x9c340011  ! 369: ORN_R	orn 	%r16, %r17, %r14
	.word 0x9b2c1011  ! 369: SLLX_R	sllx	%r16, %r17, %r13
	.word 0xeed421a6  ! 370: LDSHA_I	ldsha	[%r16, + 0x01a6] %asi, %r23
thr1_irf_ce_32:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_32), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
thr1_resum_intr_1505:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1505), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x88c4247e  ! 374: ADDCcc_I	addccc 	%r16, 0x047e, %r4
	.word 0x8e2c2f6d  ! 374: ANDN_I	andn 	%r16, 0x0f6d, %r7
	.word 0xa6c42873  ! 374: ADDCcc_I	addccc 	%r16, 0x0873, %r19
	.word 0x952c0011  ! 374: SLL_R	sll 	%r16, %r17, %r10
	.word 0xb37c2401  ! 374: MOVR_I	move	%r16, 0xfffffe34, %r25
	.word 0xba3c2a34  ! 374: XNOR_I	xnor 	%r16, 0x0a34, %r29
	.word 0xbb342001  ! 374: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0xae942d68  ! 375: ORcc_I	orcc 	%r16, 0x0d68, %r23
	.word 0xb0140011  ! 375: OR_R	or 	%r16, %r17, %r24
	.word 0xa8940011  ! 375: ORcc_R	orcc 	%r16, %r17, %r20
	.word 0xb61c0011  ! 375: XOR_R	xor 	%r16, %r17, %r27
	.word 0x9a442dc3  ! 375: ADDC_I	addc 	%r16, 0x0dc3, %r13
	.word 0xae940011  ! 375: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0x9c8c213d  ! 375: ANDcc_I	andcc 	%r16, 0x013d, %r14
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xf7941011  ! 375: LDQFA_R	-	[%r16, %r17], %f27
	return     %r18 + 0x20
	.word 0xb22c2fd8  ! 378: ANDN_I	andn 	%r16, 0x0fd8, %r25
	.word 0xb6b40011  ! 378: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0x99641811  ! 378: MOVcc_R	<illegal instruction>
	.word 0xa8942dda  ! 378: ORcc_I	orcc 	%r16, 0x0dda, %r20
	.word 0xa69421b0  ! 378: ORcc_I	orcc 	%r16, 0x01b0, %r19
	.word 0x90342534  ! 378: ORN_I	orn 	%r16, 0x0534, %r8
	.word 0xdcdc298a  ! 379: LDXA_I	ldxa	[%r16, + 0x098a] %asi, %r14
thr1_irf_ce_33:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_33), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xf304247c  ! 381: LDF_I	ld	[%r16, 0x047c], %f25
	.word 0x94040011  ! 383: ADD_R	add 	%r16, %r17, %r10
	.word 0xb0bc251e  ! 383: XNORcc_I	xnorcc 	%r16, 0x051e, %r24
	.word 0x9a2c2c4d  ! 383: ANDN_I	andn 	%r16, 0x0c4d, %r13
	.word 0xaac42486  ! 383: ADDCcc_I	addccc 	%r16, 0x0486, %r21
	.word 0x9e142044  ! 383: OR_I	or 	%r16, 0x0044, %r15
	.word 0x93340011  ! 383: SRL_R	srl 	%r16, %r17, %r9
	.word 0xb32c1011  ! 383: SLLX_R	sllx	%r16, %r17, %r25
	.word 0x889c0011  ! 383: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0xc7941011  ! 384: LDQFA_R	-	[%r16, %r17], %f3
thr1_irf_ce_34:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_34), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xdb1c0011  ! 386: LDDF_R	ldd	[%r16, %r17], %f13
	.word 0x9a0c2f56  ! 388: AND_I	and 	%r16, 0x0f56, %r13
	.word 0x8f641811  ! 388: MOVcc_R	<illegal instruction>
	.word 0x857c0411  ! 388: MOVR_R	move	%r16, %r17, %r2
	.word 0x909427ba  ! 388: ORcc_I	orcc 	%r16, 0x07ba, %r8
	.word 0x9c342926  ! 388: ORN_I	orn 	%r16, 0x0926, %r14
	.word 0x88840011  ! 388: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0xac040011  ! 388: ADD_R	add 	%r16, %r17, %r22
	.word 0x8e0c27a2  ! 388: AND_I	and 	%r16, 0x07a2, %r7
thr1_dc_err_33:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_33), 16, 16),1,DC_DATA,40)
	.word 0xcb1c0000  ! 390: LDDF_R	ldd	[%r16, %r0], %f5
thr1_irf_ce_35:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_35), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
thr1_resum_intr_1506:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1506), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x94c42231  ! 394: ADDCcc_I	addccc 	%r16, 0x0231, %r10
	.word 0x84ac0011  ! 394: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x9a840011  ! 394: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0xb1641811  ! 394: MOVcc_R	<illegal instruction>
	.word 0x8d7c0411  ! 394: MOVR_R	move	%r16, %r17, %r6
	.word 0xf39c1011  ! 395: LDDFA_R	ldda	[%r16, %r17], %f25
thr1_irf_ce_36:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_36), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xd84c2f5a  ! 397: LDSB_I	ldsb	[%r16 + 0x0f5a], %r12
	.word 0xa6140011  ! 399: OR_R	or 	%r16, %r17, %r19
	.word 0xb68c0011  ! 399: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x87641811  ! 399: MOVcc_R	<illegal instruction>
	.word 0x90ac0011  ! 399: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x9aac0011  ! 399: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0xad3c1011  ! 399: SRAX_R	srax	%r16, %r17, %r22
	.word 0xc9040011  ! 400: LDF_R	ld	[%r16, %r17], %f4
	.word 0xc36c286c  ! 402: PREFETCH_I	prefetch	[%r16 + 0x086c], #one_read
	.word 0x88340011  ! 404: ORN_R	orn 	%r16, %r17, %r4
	.word 0x9014286e  ! 404: OR_I	or 	%r16, 0x086e, %r8
	.word 0x8f7c0411  ! 404: MOVR_R	move	%r16, %r17, %r7
	.word 0x9e9427bd  ! 404: ORcc_I	orcc 	%r16, 0x07bd, %r15
	.word 0x9d2c2001  ! 404: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0xb2bc2b21  ! 404: XNORcc_I	xnorcc 	%r16, 0x0b21, %r25
	.word 0xb77c2401  ! 404: MOVR_I	move	%r16, 0xfffffe34, %r27
thr1_dc_err_34:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_34), 16, 16),1,DC_DATA,67)
	.word 0xcecc2841  ! 406: LDSBA_I	ldsba	[%r16, + 0x0841] %asi, %r7
thr1_irf_ce_37:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_37), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xd71c0011  ! 408: LDDF_R	ldd	[%r16, %r17], %f11
	.word 0xb63c0011  ! 410: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0x993c2001  ! 410: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0xba8c2f8a  ! 410: ANDcc_I	andcc 	%r16, 0x0f8a, %r29
	.word 0x86c428a6  ! 410: ADDCcc_I	addccc 	%r16, 0x08a6, %r3
	.word 0x9234235a  ! 410: ORN_I	orn 	%r16, 0x035a, %r9
thr1_dc_err_35:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_35), 16, 16),1,DC_DATA,56)
	.word 0xd1142ac7  ! 412: LDQF_I	-	[%r16, 0x0ac7], %f8
thr1_irf_ce_38:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_38), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xd40c0011  ! 414: LDUB_R	ldub	[%r16 + %r17], %r10
	.word 0x992c3001  ! 416: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0xa80c0011  ! 416: AND_R	and 	%r16, %r17, %r20
	.word 0xb2140011  ! 416: OR_R	or 	%r16, %r17, %r25
	.word 0x94b40011  ! 416: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0x9eac0011  ! 416: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xb2942b07  ! 416: ORcc_I	orcc 	%r16, 0x0b07, %r25
thr1_dc_err_36:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_36), 16, 16),1,DC_DATA,64)
	.word 0xf8cc1000  ! 418: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r28
	.word 0x867c29bd  ! 420: SDIV_I	sdiv 	%r16, 0x09bd, %r3
	.word 0x9e2c0011  ! 422: ANDN_R	andn 	%r16, %r17, %r15
	.word 0xb43c0011  ! 422: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x9a9c0011  ! 422: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x8c9422fb  ! 422: ORcc_I	orcc 	%r16, 0x02fb, %r6
	.word 0xba942452  ! 422: ORcc_I	orcc 	%r16, 0x0452, %r29
	.word 0x86bc0011  ! 422: XNORcc_R	xnorcc 	%r16, %r17, %r3
thr1_dc_err_37:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_37), 16, 16),1,DC_DATA,32)
	.word 0xd2942a31  ! 424: LDUHA_I	lduha	[%r16, + 0x0a31] %asi, %r9
thr1_irf_ce_39:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_39), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xd0342300  ! 428: STH_I	sth	%r8, [%r16 + 0x0300]
	.word 0xb4340011  ! 430: ORN_R	orn 	%r16, %r17, %r26
	.word 0x903c2697  ! 430: XNOR_I	xnor 	%r16, 0x0697, %r8
	.word 0xaabc2802  ! 430: XNORcc_I	xnorcc 	%r16, 0x0802, %r21
	.word 0x989c2a71  ! 430: XORcc_I	xorcc 	%r16, 0x0a71, %r12
	.word 0x90940011  ! 430: ORcc_R	orcc 	%r16, %r17, %r8
thr1_dc_err_38:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_38), 16, 16),1,DC_DATA,44)
	.word 0xde8c25dd  ! 432: LDUBA_I	lduba	[%r16, + 0x05dd] %asi, %r15
	.word 0xf2c42f7d  ! 434: LDSWA_I	ldswa	[%r16, + 0x0f7d] %asi, %r25
	.word 0x98c40011  ! 436: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x86040011  ! 436: ADD_R	add 	%r16, %r17, %r3
	.word 0x8f341011  ! 436: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x8a8c2f15  ! 436: ANDcc_I	andcc 	%r16, 0x0f15, %r5
	.word 0xa7340011  ! 436: SRL_R	srl 	%r16, %r17, %r19
	.word 0x9f343001  ! 436: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0xed9c1011  ! 437: LDDFA_R	ldda	[%r16, %r17], %f22
	.word 0xf09c1011  ! 439: LDDA_R	ldda	[%r16, %r17] 0x80, %r24
	.word 0x948c220e  ! 441: ANDcc_I	andcc 	%r16, 0x020e, %r10
	.word 0xb4140011  ! 441: OR_R	or 	%r16, %r17, %r26
	.word 0xb03c2081  ! 441: XNOR_I	xnor 	%r16, 0x0081, %r24
	.word 0xaf2c0011  ! 441: SLL_R	sll 	%r16, %r17, %r23
	.word 0x822c2979  ! 441: ANDN_I	andn 	%r16, 0x0979, %r1
	.word 0x98c42be7  ! 441: ADDCcc_I	addccc 	%r16, 0x0be7, %r12
	.word 0x9d2c1011  ! 441: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x9e840011  ! 441: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xce1c2de1  ! 442: LDD_I	ldd	[%r16 + 0x0de1], %r7
	.word 0x81580000  ! 444: FLUSHW	flushw
	.word 0x9b3c0011  ! 446: SRA_R	sra 	%r16, %r17, %r13
	.word 0x8e0c2228  ! 446: AND_I	and 	%r16, 0x0228, %r7
	.word 0x8a3c0011  ! 446: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x93641811  ! 446: MOVcc_R	<illegal instruction>
	.word 0xb89c0011  ! 446: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0x9f641811  ! 446: MOVcc_R	<illegal instruction>
	.word 0xd31c28f4  ! 447: LDDF_I	ldd	[%r16, 0x08f4], %f9
thr1_irf_ce_40:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_40), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xce2421a8  ! 451: STW_I	stw	%r7, [%r16 + 0x01a8]
	.word 0x9a34291c  ! 453: ORN_I	orn 	%r16, 0x091c, %r13
	.word 0x8a9c2a70  ! 453: XORcc_I	xorcc 	%r16, 0x0a70, %r5
	.word 0x909421a7  ! 453: ORcc_I	orcc 	%r16, 0x01a7, %r8
	.word 0x923424a5  ! 453: ORN_I	orn 	%r16, 0x04a5, %r9
	.word 0x820c0011  ! 453: AND_R	and 	%r16, %r17, %r1
	.word 0xd1941011  ! 454: LDQFA_R	-	[%r16, %r17], %f8
thr1_irf_ce_41:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_41), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xe99c1011  ! 456: LDDFA_R	ldda	[%r16, %r17], %f20
	.word 0x989c2eb1  ! 458: XORcc_I	xorcc 	%r16, 0x0eb1, %r12
	.word 0x968c0011  ! 458: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x98442bd2  ! 458: ADDC_I	addc 	%r16, 0x0bd2, %r12
	.word 0x98ac0011  ! 458: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xb92c3001  ! 458: SLLX_I	sllx	%r16, 0x0001, %r28
thr1_dc_err_39:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_39), 16, 16),1,DC_DATA,61)
	.word 0xc31c2e57  ! 460: LDDF_I	ldd	[%r16, 0x0e57], %f1
	.word 0xdccc1011  ! 462: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r14
	.word 0x84042832  ! 464: ADD_I	add 	%r16, 0x0832, %r2
	.word 0x86ac2d6d  ! 464: ANDNcc_I	andncc 	%r16, 0x0d6d, %r3
	.word 0x8cbc0011  ! 464: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0xa83c0011  ! 464: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0x892c2001  ! 464: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0x90140011  ! 464: OR_R	or 	%r16, %r17, %r8
thr1_dc_err_40:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_40), 16, 16),1,DC_DATA,41)
	.word 0xda0c0000  ! 466: LDUB_R	ldub	[%r16 + %r0], %r13
thr1_irf_ce_42:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_42), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xea042bf3  ! 468: LDUW_I	lduw	[%r16 + 0x0bf3], %r21
	.word 0x9c2c294f  ! 470: ANDN_I	andn 	%r16, 0x094f, %r14
	.word 0x8a9c257a  ! 470: XORcc_I	xorcc 	%r16, 0x057a, %r5
	.word 0xb0b40011  ! 470: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0xb614258a  ! 470: OR_I	or 	%r16, 0x058a, %r27
	.word 0x8d7c2401  ! 470: MOVR_I	move	%r16, 0xfffffe34, %r6
	.word 0xa6c4228a  ! 470: ADDCcc_I	addccc 	%r16, 0x028a, %r19
thr1_dc_err_41:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_41), 16, 16),1,DC_DATA,14)
	.word 0xcf1c2779  ! 472: LDDF_I	ldd	[%r16, 0x0779], %f7
!Illinst alu
	.word 0x9abc2b2b  ! 474: XNORcc_I	xnorcc 	%r16, 0x0b2b, %r13
	.word 0xaa142097  ! 476: OR_I	or 	%r16, 0x0097, %r21
	.word 0x82440011  ! 476: ADDC_R	addc 	%r16, %r17, %r1
	.word 0xa73c0011  ! 476: SRA_R	sra 	%r16, %r17, %r19
	.word 0xb42c2337  ! 476: ANDN_I	andn 	%r16, 0x0337, %r26
	.word 0x943c0011  ! 476: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0xa6840011  ! 476: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x9c340011  ! 476: ORN_R	orn 	%r16, %r17, %r14
	.word 0xd6941011  ! 477: LDUHA_R	lduha	[%r16, %r17] 0x80, %r11
thr1_irf_ce_43:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_43), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xd3142d8f  ! 479: LDQF_I	-	[%r16, 0x0d8f], %f9
	.word 0x89341011  ! 481: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x90840011  ! 481: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x8c0c0011  ! 481: AND_R	and 	%r16, %r17, %r6
	.word 0x88440011  ! 481: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x93643801  ! 481: MOVcc_I	<illegal instruction>
	.word 0x8a2c0011  ! 481: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xae840011  ! 481: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0xbabc0011  ! 481: XNORcc_R	xnorcc 	%r16, %r17, %r29
thr1_dc_err_42:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_42), 16, 16),1,DC_DATA,3)
	.word 0xfa142951  ! 483: LDUH_I	lduh	[%r16 + 0x0951], %r29
thr1_irf_ce_44:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_44), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xf31c0011  ! 485: LDDF_R	ldd	[%r16, %r17], %f25
	.word 0x92ac0011  ! 487: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x9c2c0011  ! 487: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x993c2001  ! 487: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x912c3001  ! 487: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x86b42f14  ! 487: ORNcc_I	orncc 	%r16, 0x0f14, %r3
thr1_dc_err_43:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_43), 16, 16),1,DC_DATA,16)
	.word 0xc3042d68  ! 489: LDF_I	ld	[%r16, 0x0d68], %f1
thr1_irf_ce_45:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_45), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xdf841011  ! 491: LDFA_R	lda	[%r16, %r17], %f15
	.word 0x84ac2c01  ! 493: ANDNcc_I	andncc 	%r16, 0x0c01, %r2
	.word 0xb57c0411  ! 493: MOVR_R	move	%r16, %r17, %r26
	.word 0xb62c29e3  ! 493: ANDN_I	andn 	%r16, 0x09e3, %r27
	.word 0x96942ab2  ! 493: ORcc_I	orcc 	%r16, 0x0ab2, %r11
	.word 0x832c1011  ! 493: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x9f2c1011  ! 493: SLLX_R	sllx	%r16, %r17, %r15
	.word 0xb5643801  ! 493: MOVcc_I	<illegal instruction>
thr1_dc_err_44:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_44), 16, 16),1,DC_DATA,33)
	.word 0xde9c2007  ! 495: LDDA_I	ldda	[%r16, + 0x0007] %asi, %r15
	.word 0x8e540011  ! 497: UMUL_R	umul 	%r16, %r17, %r7
	.word 0xb52c0011  ! 499: SLL_R	sll 	%r16, %r17, %r26
	.word 0xb12c2001  ! 499: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0x9f2c1011  ! 499: SLLX_R	sllx	%r16, %r17, %r15
	.word 0xaf341011  ! 499: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xb12c0011  ! 499: SLL_R	sll 	%r16, %r17, %r24
thr1_dc_err_45:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_45), 16, 16),1,DC_DATA,42)
	.word 0xdf142007  ! 501: LDQF_I	-	[%r16, 0x0007], %f15
thr1_irf_ce_46:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_46), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xecd41011  ! 503: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r22
	.word 0xa6ac2293  ! 505: ANDNcc_I	andncc 	%r16, 0x0293, %r19
	.word 0xb6940011  ! 505: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x84b42d65  ! 505: ORNcc_I	orncc 	%r16, 0x0d65, %r2
	.word 0x8cac2d36  ! 505: ANDNcc_I	andncc 	%r16, 0x0d36, %r6
	.word 0x8e140011  ! 505: OR_R	or 	%r16, %r17, %r7
	.word 0xacbc0011  ! 505: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0x95340011  ! 505: SRL_R	srl 	%r16, %r17, %r10
	.word 0xd01428bf  ! 506: LDUH_I	lduh	[%r16 + 0x08bf], %r8
	.word 0xc6440011  ! 508: LDSW_R	ldsw	[%r16 + %r17], %r3
	.word 0x98142a25  ! 510: OR_I	or 	%r16, 0x0a25, %r12
	.word 0x99643801  ! 510: MOVcc_I	<illegal instruction>
	.word 0xb4b40011  ! 510: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0x84440011  ! 510: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x821c0011  ! 510: XOR_R	xor 	%r16, %r17, %r1
	.word 0x9e340011  ! 510: ORN_R	orn 	%r16, %r17, %r15
	.word 0x8c042d0b  ! 510: ADD_I	add 	%r16, 0x0d0b, %r6
	.word 0xf00c0011  ! 511: LDUB_R	ldub	[%r16 + %r17], %r24
	.word 0xe8d41011  ! 513: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r20
	.word 0x881c2317  ! 515: XOR_I	xor 	%r16, 0x0317, %r4
	.word 0x9b343001  ! 515: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xb08c0011  ! 515: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0x923c2423  ! 515: XNOR_I	xnor 	%r16, 0x0423, %r9
	.word 0xac9c0011  ! 515: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0x89341011  ! 515: SRLX_R	srlx	%r16, %r17, %r4
	.word 0xa9643801  ! 515: MOVcc_I	<illegal instruction>
	.word 0xc25426c0  ! 516: LDSH_I	ldsh	[%r16 + 0x06c0], %r1
	.word 0xd5e41011  ! 518: CASA_I	casa	[%r16] 0x80, %r17, %r10
	.word 0x937c0411  ! 520: MOVR_R	move	%r16, %r17, %r9
	.word 0xb3340011  ! 520: SRL_R	srl 	%r16, %r17, %r25
	.word 0xad3c2001  ! 520: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0x943c2f91  ! 520: XNOR_I	xnor 	%r16, 0x0f91, %r10
	.word 0xaebc0011  ! 520: XNORcc_R	xnorcc 	%r16, %r17, %r23
	.word 0x8c1423a4  ! 520: OR_I	or 	%r16, 0x03a4, %r6
	.word 0x908c231c  ! 520: ANDcc_I	andcc 	%r16, 0x031c, %r8
thr1_dc_err_46:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_46), 16, 16),1,DC_DATA,55)
	.word 0xe8540000  ! 522: LDSH_R	ldsh	[%r16 + %r0], %r20
!Illinst store
	.word 0xc82c0011  ! 524: STB_R	stb	%r4, [%r16 + %r17]
	.word 0x92842009  ! 526: ADDcc_I	addcc 	%r16, 0x0009, %r9
	.word 0xb3340011  ! 526: SRL_R	srl 	%r16, %r17, %r25
	.word 0x85343001  ! 526: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0x96bc2422  ! 526: XNORcc_I	xnorcc 	%r16, 0x0422, %r11
	.word 0x82142bdd  ! 526: OR_I	or 	%r16, 0x0bdd, %r1
	.word 0x893c0011  ! 526: SRA_R	sra 	%r16, %r17, %r4
	.word 0x8b342001  ! 526: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x881c296c  ! 526: XOR_I	xor 	%r16, 0x096c, %r4
	.word 0xc25424f4  ! 527: LDSH_I	ldsh	[%r16 + 0x04f4], %r1
thr1_irf_ce_47:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_47), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xd71c26c0  ! 529: LDDF_I	ldd	[%r16, 0x06c0], %f11
	.word 0x973c0011  ! 531: SRA_R	sra 	%r16, %r17, %r11
	.word 0x872c2001  ! 531: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0xb3341011  ! 531: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x96ac0011  ! 531: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x9a1c0011  ! 531: XOR_R	xor 	%r16, %r17, %r13
	.word 0x9e042c09  ! 531: ADD_I	add 	%r16, 0x0c09, %r15
	.word 0xda5c0011  ! 532: LDX_R	ldx	[%r16 + %r17], %r13
!Illinst alu
	.word 0x91340011  ! 534: SRL_R	srl 	%r16, %r17, %r8
	.word 0x92bc26bd  ! 536: XNORcc_I	xnorcc 	%r16, 0x06bd, %r9
	.word 0x9c340011  ! 536: ORN_R	orn 	%r16, %r17, %r14
	.word 0x9c1c2d52  ! 536: XOR_I	xor 	%r16, 0x0d52, %r14
	.word 0x8d641811  ! 536: MOVcc_R	<illegal instruction>
	.word 0xaab40011  ! 536: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0xcd0425a0  ! 537: LDF_I	ld	[%r16, 0x05a0], %f6
	.word 0xf2941011  ! 539: LDUHA_R	lduha	[%r16, %r17] 0x80, %r25
	.word 0xae8424a4  ! 541: ADDcc_I	addcc 	%r16, 0x04a4, %r23
	.word 0xad3c1011  ! 541: SRAX_R	srax	%r16, %r17, %r22
	.word 0xb1340011  ! 541: SRL_R	srl 	%r16, %r17, %r24
	.word 0x9ec40011  ! 541: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x943c2fa1  ! 541: XNOR_I	xnor 	%r16, 0x0fa1, %r10
	.word 0x8e9c2c3f  ! 541: XORcc_I	xorcc 	%r16, 0x0c3f, %r7
thr1_dc_err_47:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_47), 16, 16),1,DC_DATA,40)
	.word 0xd8d41000  ! 543: LDSHA_R	ldsha	[%r16, %r0] 0x80, %r12
thr1_irf_ce_48:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_48), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xd4040011  ! 545: LDUW_R	lduw	[%r16 + %r17], %r10
	.word 0x90040011  ! 547: ADD_R	add 	%r16, %r17, %r8
	.word 0x820c0011  ! 547: AND_R	and 	%r16, %r17, %r1
	.word 0x8b3c1011  ! 547: SRAX_R	srax	%r16, %r17, %r5
	.word 0x90940011  ! 547: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x8b2c3001  ! 547: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x868c0011  ! 547: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xb0442d87  ! 547: ADDC_I	addc 	%r16, 0x0d87, %r24
	.word 0x9b643801  ! 548: MOVcc_I	<illegal instruction>
	.word 0x9a8c0011  ! 548: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x96140011  ! 548: OR_R	or 	%r16, %r17, %r11
	.word 0x961c2619  ! 548: XOR_I	xor 	%r16, 0x0619, %r11
	.word 0xb21c0011  ! 548: XOR_R	xor 	%r16, %r17, %r25
	rd      %pc, %r18
	set     0x20, %r17
thr1_dc_err_48:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_48), 16, 16),1,DC_DATA,61)
	.word 0xcf9c1000  ! 549: LDDFA_R	ldda	[%r16, %r0], %f7
	return     %r18 + 0x20
	.word 0x8a2c0011  ! 552: ANDN_R	andn 	%r16, %r17, %r5
	.word 0xba342697  ! 552: ORN_I	orn 	%r16, 0x0697, %r29
	.word 0xac9c2dfc  ! 552: XORcc_I	xorcc 	%r16, 0x0dfc, %r22
	.word 0x837c2401  ! 552: MOVR_I	move	%r16, 0xfffffe34, %r1
	.word 0x9cbc2fa3  ! 552: XNORcc_I	xnorcc 	%r16, 0x0fa3, %r14
	.word 0x848c0011  ! 552: ANDcc_R	andcc 	%r16, %r17, %r2
thr1_dc_err_49:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_49), 16, 16),1,DC_DATA,8)
	.word 0xd3140000  ! 554: LDQF_R	-	[%r16, %r0], %f9
	.word 0xea4c2ab0  ! 556: LDSB_I	ldsb	[%r16 + 0x0ab0], %r21
	.word 0x868c0011  ! 558: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xb0040011  ! 558: ADD_R	add 	%r16, %r17, %r24
	.word 0xb83c21b1  ! 558: XNOR_I	xnor 	%r16, 0x01b1, %r28
	.word 0x8d342001  ! 558: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x9f341011  ! 558: SRLX_R	srlx	%r16, %r17, %r15
	.word 0x963c278d  ! 558: XNOR_I	xnor 	%r16, 0x078d, %r11
	.word 0xb2b40011  ! 558: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0xfa4c202f  ! 559: LDSB_I	ldsb	[%r16 + 0x002f], %r29
	.word 0xe88428c3  ! 561: LDUWA_I	lduwa	[%r16, + 0x08c3] %asi, %r20
	.word 0x9b2c0011  ! 563: SLL_R	sll 	%r16, %r17, %r13
	.word 0xae0c2c72  ! 563: AND_I	and 	%r16, 0x0c72, %r23
	.word 0xb32c3001  ! 563: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0xb5643801  ! 563: MOVcc_I	<illegal instruction>
	.word 0xa82c0011  ! 563: ANDN_R	andn 	%r16, %r17, %r20
	.word 0x8a0c2953  ! 563: AND_I	and 	%r16, 0x0953, %r5
thr1_dc_err_50:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_50), 16, 16),1,DC_DATA,27)
	.word 0xc7941000  ! 565: LDQFA_R	-	[%r16, %r0], %f3
	.word 0xd61c0011  ! 567: LDD_R	ldd	[%r16 + %r17], %r11
	.word 0x97641811  ! 569: MOVcc_R	<illegal instruction>
	.word 0x84342cba  ! 569: ORN_I	orn 	%r16, 0x0cba, %r2
	.word 0x9a34294b  ! 569: ORN_I	orn 	%r16, 0x094b, %r13
	.word 0x842c2925  ! 569: ANDN_I	andn 	%r16, 0x0925, %r2
	.word 0x953c0011  ! 569: SRA_R	sra 	%r16, %r17, %r10
	.word 0xae1c0011  ! 569: XOR_R	xor 	%r16, %r17, %r23
	.word 0xac840011  ! 569: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0xdd140011  ! 570: LDQF_R	-	[%r16, %r17], %f14
	.word 0xf4042225  ! 572: LDUW_I	lduw	[%r16 + 0x0225], %r26
	.word 0x98840011  ! 574: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x961c0011  ! 574: XOR_R	xor 	%r16, %r17, %r11
	.word 0x9aac0011  ! 574: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0xaa1c0011  ! 574: XOR_R	xor 	%r16, %r17, %r21
	.word 0xaa442f41  ! 574: ADDC_I	addc 	%r16, 0x0f41, %r21
	.word 0x9e1c227f  ! 574: XOR_I	xor 	%r16, 0x027f, %r15
	.word 0xb6042caf  ! 574: ADD_I	add 	%r16, 0x0caf, %r27
	.word 0xd08c2622  ! 575: LDUBA_I	lduba	[%r16, + 0x0622] %asi, %r8
thr1_irf_ce_49:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_49), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xda7c0011  ! 577: SWAP_R	swap	%r13, [%r16 + %r17]
	.word 0x9e9421eb  ! 579: ORcc_I	orcc 	%r16, 0x01eb, %r15
	.word 0x98c429cf  ! 579: ADDCcc_I	addccc 	%r16, 0x09cf, %r12
	.word 0xb73c0011  ! 579: SRA_R	sra 	%r16, %r17, %r27
	.word 0x923c24ed  ! 579: XNOR_I	xnor 	%r16, 0x04ed, %r9
	.word 0x9c940011  ! 579: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0xc31c29d6  ! 580: LDDF_I	ldd	[%r16, 0x09d6], %f1
	.word 0xf44429d9  ! 582: LDSW_I	ldsw	[%r16 + 0x09d9], %r26
	.word 0xa6c40011  ! 584: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x8cb40011  ! 584: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x8d2c2001  ! 584: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0xba340011  ! 584: ORN_R	orn 	%r16, %r17, %r29
	.word 0x9a3c0011  ! 584: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x8cc40011  ! 584: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x8c9c0011  ! 584: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0xd1941011  ! 585: LDQFA_R	-	[%r16, %r17], %f8
thr1_irf_ce_50:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_50), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xc66c0011  ! 587: LDSTUB_R	ldstub	%r3, [%r16 + %r17]
	.word 0x8ec40011  ! 589: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0x99343001  ! 589: SRLX_I	srlx	%r16, 0x0001, %r12
	.word 0x9e1c0011  ! 589: XOR_R	xor 	%r16, %r17, %r15
	.word 0x86440011  ! 589: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x9c840011  ! 589: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0xae2c0011  ! 589: ANDN_R	andn 	%r16, %r17, %r23
	.word 0xd0540011  ! 590: LDSH_R	ldsh	[%r16 + %r17], %r8
	.word 0x81dc2a84  ! 592: FLUSH_I	flush
	.word 0x893c0011  ! 594: SRA_R	sra 	%r16, %r17, %r4
	.word 0x8c3c0011  ! 594: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x9eb40011  ! 594: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0xb17c0411  ! 594: MOVR_R	move	%r16, %r17, %r24
	.word 0x837c0411  ! 594: MOVR_R	move	%r16, %r17, %r1
	.word 0x88b40011  ! 594: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0x94140011  ! 594: OR_R	or 	%r16, %r17, %r10
	.word 0xd2c420d1  ! 595: LDSWA_I	ldswa	[%r16, + 0x00d1] %asi, %r9
thr1_irf_ce_51:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_51), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xda042aec  ! 597: LDUW_I	lduw	[%r16 + 0x0aec], %r13
	.word 0x8eac243d  ! 599: ANDNcc_I	andncc 	%r16, 0x043d, %r7
	.word 0x8e940011  ! 599: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0xb9343001  ! 599: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x82c421f9  ! 599: ADDCcc_I	addccc 	%r16, 0x01f9, %r1
	.word 0x8b3c2001  ! 599: SRA_I	sra 	%r16, 0x0001, %r5
thr1_dc_err_51:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_51), 16, 16),1,DC_DATA,31)
	.word 0xec5c23bf  ! 601: LDX_I	ldx	[%r16 + 0x03bf], %r22
thr1_irf_ce_52:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_52), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xcad4256a  ! 603: LDSHA_I	ldsha	[%r16, + 0x056a] %asi, %r5
	.word 0x93341011  ! 605: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x86c4274d  ! 605: ADDCcc_I	addccc 	%r16, 0x074d, %r3
	.word 0x993c0011  ! 605: SRA_R	sra 	%r16, %r17, %r12
	.word 0xb7343001  ! 605: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0x8e9c2a01  ! 605: XORcc_I	xorcc 	%r16, 0x0a01, %r7
	.word 0x84042c03  ! 605: ADD_I	add 	%r16, 0x0c03, %r2
	.word 0x957c2401  ! 605: MOVR_I	move	%r16, 0xfffffe34, %r10
	.word 0x84c42bad  ! 605: ADDCcc_I	addccc 	%r16, 0x0bad, %r2
thr1_dc_err_52:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_52), 16, 16),1,DC_DATA,63)
	.word 0xf8542733  ! 607: LDSH_I	ldsh	[%r16 + 0x0733], %r28
thr1_irf_ce_53:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_53), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xc36c28d1  ! 609: PREFETCH_I	prefetch	[%r16 + 0x08d1], #one_read
	.word 0x9f343001  ! 611: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x969c2093  ! 611: XORcc_I	xorcc 	%r16, 0x0093, %r11
	.word 0x822c0011  ! 611: ANDN_R	andn 	%r16, %r17, %r1
	.word 0xa81c0011  ! 611: XOR_R	xor 	%r16, %r17, %r20
	.word 0x86ac2b4f  ! 611: ANDNcc_I	andncc 	%r16, 0x0b4f, %r3
	.word 0x972c0011  ! 611: SLL_R	sll 	%r16, %r17, %r11
	.word 0xd68c1011  ! 612: LDUBA_R	lduba	[%r16, %r17] 0x80, %r11
!Illinst alu
	.word 0xba3c0011  ! 614: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x8f343001  ! 616: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0xb6bc0011  ! 616: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0x84ac0011  ! 616: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0xb2340011  ! 616: ORN_R	orn 	%r16, %r17, %r25
	.word 0x8a842d55  ! 616: ADDcc_I	addcc 	%r16, 0x0d55, %r5
	.word 0xb5641811  ! 616: MOVcc_R	<illegal instruction>
	.word 0x8cbc2d01  ! 616: XNORcc_I	xnorcc 	%r16, 0x0d01, %r6
	.word 0xba8c0011  ! 616: ANDcc_R	andcc 	%r16, %r17, %r29
thr1_dc_err_53:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_53), 16, 16),1,DC_DATA,58)
	.word 0xf28c1000  ! 618: LDUBA_R	lduba	[%r16, %r0] 0x80, %r25
!Illinst alu
	.word 0xb73c2001  ! 620: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0xa83c243a  ! 622: XNOR_I	xnor 	%r16, 0x043a, %r20
	.word 0x8a140011  ! 622: OR_R	or 	%r16, %r17, %r5
	.word 0xacb40011  ! 622: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0x9ebc29de  ! 622: XNORcc_I	xnorcc 	%r16, 0x09de, %r15
	.word 0x98942ace  ! 622: ORcc_I	orcc 	%r16, 0x0ace, %r12
	.word 0x8a842c91  ! 622: ADDcc_I	addcc 	%r16, 0x0c91, %r5
	.word 0x957c0411  ! 622: MOVR_R	move	%r16, %r17, %r10
	.word 0x8c0c0011  ! 622: AND_R	and 	%r16, %r17, %r6
	.word 0xcb941011  ! 623: LDQFA_R	-	[%r16, %r17], %f5
thr1_irf_ce_54:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_54), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
thr1_resum_intr_1507:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1507), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x0, %asr26
	.word 0x8c9c26f7  ! 627: XORcc_I	xorcc 	%r16, 0x06f7, %r6
	.word 0x880c2c3d  ! 627: AND_I	and 	%r16, 0x0c3d, %r4
	.word 0xb2840011  ! 627: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0x8e8c0011  ! 627: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0xb8940011  ! 627: ORcc_R	orcc 	%r16, %r17, %r28
	.word 0x98942141  ! 627: ORcc_I	orcc 	%r16, 0x0141, %r12
thr1_dc_err_54:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_54), 16, 16),1,DC_DATA,3)
	.word 0xc85c0000  ! 629: LDX_R	ldx	[%r16 + %r0], %r4
	.word 0xc80c0011  ! 631: LDUB_R	ldub	[%r16 + %r17], %r4
	.word 0x9c042635  ! 633: ADD_I	add 	%r16, 0x0635, %r14
	.word 0x86040011  ! 633: ADD_R	add 	%r16, %r17, %r3
	.word 0x9a8c248a  ! 633: ANDcc_I	andcc 	%r16, 0x048a, %r13
	.word 0xb4ac0011  ! 633: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0x86040011  ! 633: ADD_R	add 	%r16, %r17, %r3
	.word 0x941c224b  ! 633: XOR_I	xor 	%r16, 0x024b, %r10
	.word 0x86c42bee  ! 633: ADDCcc_I	addccc 	%r16, 0x0bee, %r3
	.word 0x8ac42eaa  ! 633: ADDCcc_I	addccc 	%r16, 0x0eaa, %r5
	.word 0xcc1c2ff9  ! 634: LDD_I	ldd	[%r16 + 0x0ff9], %r6
thr1_irf_ce_55:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_55), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xdc2c2bc1  ! 638: STB_I	stb	%r14, [%r16 + 0x0bc1]
	.word 0x929c0011  ! 640: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0x8c1c0011  ! 640: XOR_R	xor 	%r16, %r17, %r6
	.word 0x963c0011  ! 640: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x9e2c0011  ! 640: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x9e3c229f  ! 640: XNOR_I	xnor 	%r16, 0x029f, %r15
	.word 0xaa2c2f2a  ! 640: ANDN_I	andn 	%r16, 0x0f2a, %r21
	.word 0xa6340011  ! 640: ORN_R	orn 	%r16, %r17, %r19
	.word 0xca5c2921  ! 641: LDX_I	ldx	[%r16 + 0x0921], %r5
thr1_irf_ce_56:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_56), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xd4140011  ! 643: LDUH_R	lduh	[%r16 + %r17], %r10
	.word 0x89342001  ! 645: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x91641811  ! 645: MOVcc_R	<illegal instruction>
	.word 0xb1340011  ! 645: SRL_R	srl 	%r16, %r17, %r24
	.word 0x8abc0011  ! 645: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0xb03c2ae9  ! 645: XNOR_I	xnor 	%r16, 0x0ae9, %r24
thr1_dc_err_55:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_55), 16, 16),1,DC_DATA,52)
	.word 0xd4c41000  ! 647: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r10
thr1_irf_ce_57:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_57), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xc8941011  ! 649: LDUHA_R	lduha	[%r16, %r17] 0x80, %r4
	.word 0x9b7c2401  ! 651: MOVR_I	move	%r16, 0xfffffe34, %r13
	.word 0xa69423f8  ! 651: ORcc_I	orcc 	%r16, 0x03f8, %r19
	.word 0xae440011  ! 651: ADDC_R	addc 	%r16, %r17, %r23
	.word 0x863c2835  ! 651: XNOR_I	xnor 	%r16, 0x0835, %r3
	.word 0x99643801  ! 651: MOVcc_I	<illegal instruction>
	.word 0x860c0011  ! 651: AND_R	and 	%r16, %r17, %r3
	.word 0x9b643801  ! 651: MOVcc_I	<illegal instruction>
thr1_dc_err_56:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_56), 16, 16),1,DC_DATA,51)
	.word 0xd6442259  ! 653: LDSW_I	ldsw	[%r16 + 0x0259], %r11
thr1_irf_ce_58:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_58), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xd04c0011  ! 655: LDSB_R	ldsb	[%r16 + %r17], %r8
	.word 0x9a3c2744  ! 657: XNOR_I	xnor 	%r16, 0x0744, %r13
	.word 0x8aac0011  ! 657: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0xb2140011  ! 657: OR_R	or 	%r16, %r17, %r25
	.word 0x8e942411  ! 657: ORcc_I	orcc 	%r16, 0x0411, %r7
	.word 0x90442b26  ! 657: ADDC_I	addc 	%r16, 0x0b26, %r8
	.word 0xb93c2001  ! 657: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xb2b40011  ! 657: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0xf2dc1011  ! 658: LDXA_R	ldxa	[%r16, %r17] 0x80, %r25
thr1_irf_ce_59:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_59), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xd25c203c  ! 660: LDX_I	ldx	[%r16 + 0x003c], %r9
	.word 0x94442e25  ! 662: ADDC_I	addc 	%r16, 0x0e25, %r10
	.word 0x86940011  ! 662: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x962c0011  ! 662: ANDN_R	andn 	%r16, %r17, %r11
	.word 0xb214270b  ! 662: OR_I	or 	%r16, 0x070b, %r25
	.word 0xae2c0011  ! 662: ANDN_R	andn 	%r16, %r17, %r23
	.word 0x8b643801  ! 662: MOVcc_I	<illegal instruction>
	.word 0x90c40011  ! 663: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x9f2c3001  ! 663: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x892c1011  ! 663: SLLX_R	sllx	%r16, %r17, %r4
	.word 0x90c40011  ! 663: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0xaa44266b  ! 663: ADDC_I	addc 	%r16, 0x066b, %r21
	rd      %pc, %r18
	set     0x20, %r17
thr1_dc_err_57:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_57), 16, 16),1,DC_DATA,21)
	.word 0xc5142f83  ! 664: LDQF_I	-	[%r16, 0x0f83], %f2
	return     %r18 + %r17
	.word 0x968c0011  ! 667: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x963c0011  ! 667: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x97341011  ! 667: SRLX_R	srlx	%r16, %r17, %r11
	.word 0x9c940011  ! 667: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0xaf343001  ! 667: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0xcc8c1011  ! 668: LDUBA_R	lduba	[%r16, %r17] 0x80, %r6
!Illinst store
	.word 0xf6240011  ! 670: STW_R	stw	%r27, [%r16 + %r17]
	.word 0x8e8c0011  ! 672: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x93641811  ! 672: MOVcc_R	<illegal instruction>
	.word 0xacbc0011  ! 672: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0x9b343001  ! 672: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xaf641811  ! 672: MOVcc_R	<illegal instruction>
	.word 0x88442d8e  ! 672: ADDC_I	addc 	%r16, 0x0d8e, %r4
	.word 0xb4c40011  ! 672: ADDCcc_R	addccc 	%r16, %r17, %r26
thr1_dc_err_58:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_58), 16, 16),1,DC_DATA,64)
	.word 0xd0542576  ! 674: LDSH_I	ldsh	[%r16 + 0x0576], %r8
	.word 0xd26c0011  ! 676: LDSTUB_R	ldstub	%r9, [%r16 + %r17]
	.word 0x928c0011  ! 678: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0x897c2401  ! 678: MOVR_I	move	%r16, 0xfffffe34, %r4
	.word 0x8a0c0011  ! 678: AND_R	and 	%r16, %r17, %r5
	.word 0x98ac0011  ! 678: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x829c0011  ! 678: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0xb73c1011  ! 678: SRAX_R	srax	%r16, %r17, %r27
	.word 0xce841011  ! 679: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r7
thr1_irf_ce_60:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_60), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xee242257  ! 683: STW_I	stw	%r23, [%r16 + 0x0257]
	.word 0x96042cdf  ! 685: ADD_I	add 	%r16, 0x0cdf, %r11
	.word 0x8c140011  ! 685: OR_R	or 	%r16, %r17, %r6
	.word 0xb0b40011  ! 685: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0x9f2c1011  ! 685: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x98b4228b  ! 685: ORNcc_I	orncc 	%r16, 0x028b, %r12
thr1_dc_err_59:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_59), 16, 16),1,DC_DATA,46)
	.word 0xf2442d66  ! 687: LDSW_I	ldsw	[%r16 + 0x0d66], %r25
	.word 0xc36c23b8  ! 689: PREFETCH_I	prefetch	[%r16 + 0x03b8], #one_read
	.word 0xb9340011  ! 691: SRL_R	srl 	%r16, %r17, %r28
	.word 0x96ac2ae8  ! 691: ANDNcc_I	andncc 	%r16, 0x0ae8, %r11
	.word 0x99341011  ! 691: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x8e040011  ! 691: ADD_R	add 	%r16, %r17, %r7
	.word 0xa8440011  ! 691: ADDC_R	addc 	%r16, %r17, %r20
thr1_dc_err_60:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_60), 16, 16),1,DC_DATA,14)
	.word 0xdecc1000  ! 693: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r15
thr1_irf_ce_61:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_61), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xc9140011  ! 695: LDQF_R	-	[%r16, %r17], %f4
	.word 0x88942aca  ! 697: ORcc_I	orcc 	%r16, 0x0aca, %r4
	.word 0xa8bc2a34  ! 697: XNORcc_I	xnorcc 	%r16, 0x0a34, %r20
	.word 0xac3c0011  ! 697: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x9a142bc7  ! 697: OR_I	or 	%r16, 0x0bc7, %r13
	.word 0xb4340011  ! 697: ORN_R	orn 	%r16, %r17, %r26
	.word 0x977c2401  ! 697: MOVR_I	move	%r16, 0xfffffe34, %r11
	.word 0x88ac2f8e  ! 697: ANDNcc_I	andncc 	%r16, 0x0f8e, %r4
	.word 0xe7941011  ! 698: LDQFA_R	-	[%r16, %r17], %f19
thr1_irf_ce_62:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_62), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xd4d41011  ! 700: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r10
	.word 0x857c2401  ! 702: MOVR_I	move	%r16, 0xfffffe34, %r2
	.word 0x8e442b09  ! 702: ADDC_I	addc 	%r16, 0x0b09, %r7
	.word 0x943c2309  ! 702: XNOR_I	xnor 	%r16, 0x0309, %r10
	.word 0xb09c2aed  ! 702: XORcc_I	xorcc 	%r16, 0x0aed, %r24
	.word 0x88142533  ! 702: OR_I	or 	%r16, 0x0533, %r4
	.word 0xb9343001  ! 702: SRLX_I	srlx	%r16, 0x0001, %r28
thr1_dc_err_61:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_61), 16, 16),1,DC_DATA,4)
	.word 0xc5941000  ! 704: LDQFA_R	-	[%r16, %r0], %f2
	.word 0xea442352  ! 706: LDSW_I	ldsw	[%r16 + 0x0352], %r21
	.word 0x8d342001  ! 708: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0xae340011  ! 708: ORN_R	orn 	%r16, %r17, %r23
	.word 0x902c0011  ! 708: ANDN_R	andn 	%r16, %r17, %r8
	.word 0xb8342022  ! 708: ORN_I	orn 	%r16, 0x0022, %r28
	.word 0x982c0011  ! 708: ANDN_R	andn 	%r16, %r17, %r12
	.word 0x9b341011  ! 708: SRLX_R	srlx	%r16, %r17, %r13
	.word 0xfa942e8a  ! 709: LDUHA_I	lduha	[%r16, + 0x0e8a] %asi, %r29
thr1_irf_ce_63:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_63), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xc3140011  ! 711: LDQF_R	-	[%r16, %r17], %f1
	.word 0x972c3001  ! 713: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x88440011  ! 713: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x8ac40011  ! 713: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x88bc0011  ! 713: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0x96b42a44  ! 713: ORNcc_I	orncc 	%r16, 0x0a44, %r11
	.word 0x912c0011  ! 713: SLL_R	sll 	%r16, %r17, %r8
	.word 0x93342001  ! 713: SRL_I	srl 	%r16, 0x0001, %r9
thr1_dc_err_62:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_62), 16, 16),1,DC_DATA,38)
	.word 0xf0442eb0  ! 715: LDSW_I	ldsw	[%r16 + 0x0eb0], %r24
	.word 0x81880000  ! 717: SAVED	saved
	.word 0x9e2c0011  ! 719: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x86bc0011  ! 719: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0xa77c2401  ! 719: MOVR_I	move	%r16, 0xfffffe34, %r19
	.word 0xb5340011  ! 719: SRL_R	srl 	%r16, %r17, %r26
	.word 0x9b3c2001  ! 719: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0xdd140011  ! 720: LDQF_R	-	[%r16, %r17], %f14
!Illinst alu
	.word 0xb53c3001  ! 722: SRAX_I	srax	%r16, 0x0001, %r26
	.word 0x92bc22ac  ! 724: XNORcc_I	xnorcc 	%r16, 0x02ac, %r9
	.word 0xae140011  ! 724: OR_R	or 	%r16, %r17, %r23
	.word 0x85643801  ! 724: MOVcc_I	<illegal instruction>
	.word 0x86040011  ! 724: ADD_R	add 	%r16, %r17, %r3
	.word 0xae140011  ! 724: OR_R	or 	%r16, %r17, %r23
thr1_dc_err_63:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_63), 16, 16),1,DC_DATA,25)
	.word 0xf5140000  ! 726: LDQF_R	-	[%r16, %r0], %f26
thr1_irf_ce_64:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_64), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xc67421fa  ! 730: STX_I	stx	%r3, [%r16 + 0x01fa]
	.word 0x897c2401  ! 732: MOVR_I	move	%r16, 0xfffffe34, %r4
	.word 0x8cb42833  ! 732: ORNcc_I	orncc 	%r16, 0x0833, %r6
	.word 0x9c1429fc  ! 732: OR_I	or 	%r16, 0x09fc, %r14
	.word 0xaa342db3  ! 732: ORN_I	orn 	%r16, 0x0db3, %r21
	.word 0xb20c2ae9  ! 732: AND_I	and 	%r16, 0x0ae9, %r25
	.word 0xd91c2e5a  ! 733: LDDF_I	ldd	[%r16, 0x0e5a], %f12
thr1_irf_ce_65:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_65), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xd87c0011  ! 735: SWAP_R	swap	%r12, [%r16 + %r17]
	.word 0x968c2e52  ! 737: ANDcc_I	andcc 	%r16, 0x0e52, %r11
	.word 0xa72c3001  ! 737: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0xae0c217b  ! 737: AND_I	and 	%r16, 0x017b, %r23
	.word 0x96ac0011  ! 737: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x94140011  ! 737: OR_R	or 	%r16, %r17, %r10
	.word 0xd7140011  ! 738: LDQF_R	-	[%r16, %r17], %f11
	.word 0xc4cc25a1  ! 740: LDSBA_I	ldsba	[%r16, + 0x05a1] %asi, %r2
	.word 0x861c274d  ! 742: XOR_I	xor 	%r16, 0x074d, %r3
	.word 0x841c24ad  ! 742: XOR_I	xor 	%r16, 0x04ad, %r2
	.word 0x857c0411  ! 742: MOVR_R	move	%r16, %r17, %r2
	.word 0x93342001  ! 742: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x90142396  ! 742: OR_I	or 	%r16, 0x0396, %r8
	.word 0x988c2c95  ! 742: ANDcc_I	andcc 	%r16, 0x0c95, %r12
	.word 0x86940011  ! 742: ORcc_R	orcc 	%r16, %r17, %r3
thr1_dc_err_64:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_64), 16, 16),1,DC_DATA,11)
	.word 0xca9c1000  ! 744: LDDA_R	ldda	[%r16, %r0] 0x80, %r5
thr1_irf_ce_66:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_66), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xc60c0011  ! 746: LDUB_R	ldub	[%r16 + %r17], %r3
	.word 0x837c0411  ! 748: MOVR_R	move	%r16, %r17, %r1
	.word 0xa89c2312  ! 748: XORcc_I	xorcc 	%r16, 0x0312, %r20
	.word 0x9cbc0011  ! 748: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0xb0b42fcf  ! 748: ORNcc_I	orncc 	%r16, 0x0fcf, %r24
	.word 0x94b40011  ! 748: ORNcc_R	orncc 	%r16, %r17, %r10
	.word 0xd1941011  ! 749: LDQFA_R	-	[%r16, %r17], %f8
thr1_irf_ce_67:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_67), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xdc0c0011  ! 751: LDUB_R	ldub	[%r16 + %r17], %r14
	.word 0xb21c0011  ! 753: XOR_R	xor 	%r16, %r17, %r25
	.word 0x863c2322  ! 753: XNOR_I	xnor 	%r16, 0x0322, %r3
	.word 0x8a342a58  ! 753: ORN_I	orn 	%r16, 0x0a58, %r5
	.word 0x9a342f62  ! 753: ORN_I	orn 	%r16, 0x0f62, %r13
	.word 0x832c0011  ! 753: SLL_R	sll 	%r16, %r17, %r1
	.word 0x923427fa  ! 753: ORN_I	orn 	%r16, 0x07fa, %r9
	.word 0x9e2c26cb  ! 753: ANDN_I	andn 	%r16, 0x06cb, %r15
thr1_dc_err_65:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_65), 16, 16),1,DC_DATA,46)
	.word 0xd6cc20a0  ! 755: LDSBA_I	ldsba	[%r16, + 0x00a0] %asi, %r11
thr1_irf_ce_68:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_68), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xf704262e  ! 757: LDF_I	ld	[%r16, 0x062e], %f27
	.word 0x9f3c1011  ! 759: SRAX_R	srax	%r16, %r17, %r15
	.word 0x920c2b68  ! 759: AND_I	and 	%r16, 0x0b68, %r9
	.word 0x86042b66  ! 759: ADD_I	add 	%r16, 0x0b66, %r3
	.word 0x9a840011  ! 759: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x94bc27f3  ! 759: XNORcc_I	xnorcc 	%r16, 0x07f3, %r10
thr1_dc_err_66:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_66), 16, 16),1,DC_DATA,25)
	.word 0xdf142e9a  ! 761: LDQF_I	-	[%r16, 0x0e9a], %f15
	.word 0xd8cc1011  ! 763: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r12
	.word 0xb83c2969  ! 765: XNOR_I	xnor 	%r16, 0x0969, %r28
	.word 0xa7641811  ! 765: MOVcc_R	<illegal instruction>
	.word 0x92c40011  ! 765: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xab3c1011  ! 765: SRAX_R	srax	%r16, %r17, %r21
	.word 0x9b643801  ! 765: MOVcc_I	<illegal instruction>
	.word 0xb43c0011  ! 765: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x94042969  ! 765: ADD_I	add 	%r16, 0x0969, %r10
	.word 0xba3c0011  ! 765: XNOR_R	xnor 	%r16, %r17, %r29
thr1_dc_err_67:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_67), 16, 16),1,DC_DATA,41)
	.word 0xdc042a53  ! 767: LDUW_I	lduw	[%r16 + 0x0a53], %r14
thr1_irf_ce_69:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_69), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0x8143e004  ! 769: MEMBAR	membar	#LoadStore 
	.word 0x832c3001  ! 771: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x96bc2b1e  ! 771: XNORcc_I	xnorcc 	%r16, 0x0b1e, %r11
	.word 0x962c0011  ! 771: ANDN_R	andn 	%r16, %r17, %r11
	.word 0x9f2c2001  ! 771: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0x9c940011  ! 771: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0x909c0011  ! 771: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0xf6dc209d  ! 772: LDXA_I	ldxa	[%r16, + 0x009d] %asi, %r27
thr1_irf_ce_70:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_70), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xde0c237f  ! 774: LDUB_I	ldub	[%r16 + 0x037f], %r15
	.word 0x86b40011  ! 776: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0xa77c2401  ! 776: MOVR_I	move	%r16, 0xfffffe34, %r19
	.word 0x8a440011  ! 776: ADDC_R	addc 	%r16, %r17, %r5
	.word 0xb3341011  ! 776: SRLX_R	srlx	%r16, %r17, %r25
	.word 0xb01c2b2a  ! 776: XOR_I	xor 	%r16, 0x0b2a, %r24
	.word 0xba140011  ! 776: OR_R	or 	%r16, %r17, %r29
	.word 0xb4940011  ! 776: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0xac2c2d3e  ! 776: ANDN_I	andn 	%r16, 0x0d3e, %r22
thr1_dc_err_68:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_68), 16, 16),1,DC_DATA,66)
	.word 0xd19c1000  ! 778: LDDFA_R	ldda	[%r16, %r0], %f8
thr1_irf_ce_71:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_71), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xe60422a8  ! 780: LDUW_I	lduw	[%r16 + 0x02a8], %r19
	.word 0xb6342e31  ! 782: ORN_I	orn 	%r16, 0x0e31, %r27
	.word 0xac342d50  ! 782: ORN_I	orn 	%r16, 0x0d50, %r22
	.word 0x981c0011  ! 782: XOR_R	xor 	%r16, %r17, %r12
	.word 0x873c0011  ! 782: SRA_R	sra 	%r16, %r17, %r3
	.word 0xba2c24c2  ! 782: ANDN_I	andn 	%r16, 0x04c2, %r29
	.word 0xa73c2001  ! 782: SRA_I	sra 	%r16, 0x0001, %r19
	.word 0x82c40011  ! 782: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x90840011  ! 782: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0xd39c1011  ! 783: LDDFA_R	ldda	[%r16, %r17], %f9
	.word 0xeb941011  ! 785: LDQFA_R	-	[%r16, %r17], %f21
	.word 0xb28c23e5  ! 787: ANDcc_I	andcc 	%r16, 0x03e5, %r25
	.word 0x9b7c0411  ! 787: MOVR_R	move	%r16, %r17, %r13
	.word 0xaa942f75  ! 787: ORcc_I	orcc 	%r16, 0x0f75, %r21
	.word 0x8f340011  ! 787: SRL_R	srl 	%r16, %r17, %r7
	.word 0x92c40011  ! 787: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x849c2d59  ! 787: XORcc_I	xorcc 	%r16, 0x0d59, %r2
	.word 0x841c0011  ! 787: XOR_R	xor 	%r16, %r17, %r2
	.word 0xb6042d13  ! 787: ADD_I	add 	%r16, 0x0d13, %r27
	.word 0x96c40011  ! 788: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0xad342001  ! 788: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0x9b2c1011  ! 788: SLLX_R	sllx	%r16, %r17, %r13
	.word 0x9c1c0011  ! 788: XOR_R	xor 	%r16, %r17, %r14
	.word 0x8e840011  ! 788: ADDcc_R	addcc 	%r16, %r17, %r7
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xcacc2b0e  ! 788: LDSBA_I	ldsba	[%r16, + 0x0b0e] %asi, %r5
thr1_irf_ce_72:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_72), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0x8a040011  ! 791: ADD_R	add 	%r16, %r17, %r5
	.word 0x82940011  ! 791: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x8f643801  ! 791: MOVcc_I	<illegal instruction>
	.word 0xa6440011  ! 791: ADDC_R	addc 	%r16, %r17, %r19
	.word 0x8c440011  ! 791: ADDC_R	addc 	%r16, %r17, %r6
	.word 0xa88c2e57  ! 791: ANDcc_I	andcc 	%r16, 0x0e57, %r20
	.word 0xba1c29b6  ! 791: XOR_I	xor 	%r16, 0x09b6, %r29
	.word 0x9c44245b  ! 791: ADDC_I	addc 	%r16, 0x045b, %r14
	.word 0xf9142871  ! 792: LDQF_I	-	[%r16, 0x0871], %f28
	.word 0xed140011  ! 794: LDQF_R	-	[%r16, %r17], %f22
	.word 0x877c2401  ! 796: MOVR_I	move	%r16, 0xfffffe34, %r3
	.word 0xb03c0011  ! 796: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0xb72c0011  ! 796: SLL_R	sll 	%r16, %r17, %r27
	.word 0xae940011  ! 796: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0x94942dca  ! 796: ORcc_I	orcc 	%r16, 0x0dca, %r10
	.word 0x942c0011  ! 796: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x8e8c280e  ! 796: ANDcc_I	andcc 	%r16, 0x080e, %r7
	.word 0x8d2c1011  ! 796: SLLX_R	sllx	%r16, %r17, %r6
thr1_dc_err_69:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_69), 16, 16),1,DC_DATA,2)
	.word 0xdb140000  ! 798: LDQF_R	-	[%r16, %r0], %f13
	.word 0xd9941011  ! 800: LDQFA_R	-	[%r16, %r17], %f12
	.word 0x8e3c28b9  ! 802: XNOR_I	xnor 	%r16, 0x08b9, %r7
	.word 0xb0842536  ! 802: ADDcc_I	addcc 	%r16, 0x0536, %r24
	.word 0x97343001  ! 802: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0x852c3001  ! 802: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0x90140011  ! 802: OR_R	or 	%r16, %r17, %r8
	.word 0x8d2c3001  ! 802: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0x93641811  ! 802: MOVcc_R	<illegal instruction>
	.word 0x9d340011  ! 802: SRL_R	srl 	%r16, %r17, %r14
thr1_dc_err_70:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_70), 16, 16),1,DC_DATA,49)
	.word 0xd68c23cd  ! 804: LDUBA_I	lduba	[%r16, + 0x03cd] %asi, %r11
thr1_irf_ce_73:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_73), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xdd1c2fef  ! 806: LDDF_I	ldd	[%r16, 0x0fef], %f14
	.word 0xb4ac0011  ! 808: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0x9aac2d1d  ! 808: ANDNcc_I	andncc 	%r16, 0x0d1d, %r13
	.word 0x8b341011  ! 808: SRLX_R	srlx	%r16, %r17, %r5
	.word 0xbb3c0011  ! 808: SRA_R	sra 	%r16, %r17, %r29
	.word 0x84942b8f  ! 808: ORcc_I	orcc 	%r16, 0x0b8f, %r2
	.word 0xab3c0011  ! 808: SRA_R	sra 	%r16, %r17, %r21
	.word 0x86940011  ! 808: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x9b3c1011  ! 808: SRAX_R	srax	%r16, %r17, %r13
thr1_dc_err_71:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_71), 16, 16),1,DC_DATA,15)
	.word 0xcd841000  ! 810: LDFA_R	lda	[%r16, %r0], %f6
thr1_irf_ce_74:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_74), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xf8d41011  ! 812: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r28
	.word 0xb83424a3  ! 814: ORN_I	orn 	%r16, 0x04a3, %r28
	.word 0x948c2571  ! 814: ANDcc_I	andcc 	%r16, 0x0571, %r10
	.word 0x869c2492  ! 814: XORcc_I	xorcc 	%r16, 0x0492, %r3
	.word 0x863c2ea4  ! 814: XNOR_I	xnor 	%r16, 0x0ea4, %r3
	.word 0xad3c2001  ! 814: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0x89643801  ! 814: MOVcc_I	<illegal instruction>
	.word 0x86b40011  ! 814: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0xc68c1011  ! 815: LDUBA_R	lduba	[%r16, %r17] 0x80, %r3
thr1_irf_ce_75:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_75), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xee4c25f0  ! 817: LDSB_I	ldsb	[%r16 + 0x05f0], %r23
	.word 0x8d643801  ! 819: MOVcc_I	<illegal instruction>
	.word 0x981c0011  ! 819: XOR_R	xor 	%r16, %r17, %r12
	.word 0x8c840011  ! 819: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x8c340011  ! 819: ORN_R	orn 	%r16, %r17, %r6
	.word 0xaa8c2019  ! 819: ANDcc_I	andcc 	%r16, 0x0019, %r21
	.word 0x923c2d06  ! 820: XNOR_I	xnor 	%r16, 0x0d06, %r9
	.word 0x96440011  ! 820: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x84440011  ! 820: ADDC_R	addc 	%r16, %r17, %r2
	.word 0xb1342001  ! 820: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0xa77c0411  ! 820: MOVR_R	move	%r16, %r17, %r19
	.word 0xad343001  ! 820: SRLX_I	srlx	%r16, 0x0001, %r22
	rd      %pc, %r18
	set     0x20, %r17
thr1_dc_err_72:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_72), 16, 16),1,DC_DATA,36)
	.word 0xec941000  ! 821: LDUHA_R	lduha	[%r16, %r0] 0x80, %r22
thr1_irf_ce_76:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_76), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	return     %r18 + %r17
	.word 0x9cac24f2  ! 824: ANDNcc_I	andncc 	%r16, 0x04f2, %r14
	.word 0x961c205b  ! 824: XOR_I	xor 	%r16, 0x005b, %r11
	.word 0x88042a4c  ! 824: ADD_I	add 	%r16, 0x0a4c, %r4
	.word 0x94340011  ! 824: ORN_R	orn 	%r16, %r17, %r10
	.word 0x8c842026  ! 824: ADDcc_I	addcc 	%r16, 0x0026, %r6
	.word 0x8a2c2bd5  ! 824: ANDN_I	andn 	%r16, 0x0bd5, %r5
	.word 0x88340011  ! 824: ORN_R	orn 	%r16, %r17, %r4
thr1_dc_err_73:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_73), 16, 16),1,DC_DATA,47)
	.word 0xde442ea8  ! 826: LDSW_I	ldsw	[%r16 + 0x0ea8], %r15
thr1_irf_ce_77:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_77), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xf82c2ff4  ! 830: STB_I	stb	%r28, [%r16 + 0x0ff4]
	.word 0x8cbc0011  ! 832: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0xb5643801  ! 832: MOVcc_I	<illegal instruction>
	.word 0x893c0011  ! 832: SRA_R	sra 	%r16, %r17, %r4
	.word 0xb6c40011  ! 832: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x837c2401  ! 832: MOVR_I	move	%r16, 0xfffffe34, %r1
thr1_dc_err_74:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_74), 16, 16),1,DC_DATA,57)
	.word 0xd41c2135  ! 834: LDD_I	ldd	[%r16 + 0x0135], %r10
thr1_irf_ce_78:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_78), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xdc5c0011  ! 836: LDX_R	ldx	[%r16 + %r17], %r14
	.word 0xae3c0011  ! 838: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x9e842801  ! 838: ADDcc_I	addcc 	%r16, 0x0801, %r15
	.word 0x84bc0011  ! 838: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x9e3c2151  ! 838: XNOR_I	xnor 	%r16, 0x0151, %r15
	.word 0xad643801  ! 838: MOVcc_I	<illegal instruction>
	.word 0x96842218  ! 838: ADDcc_I	addcc 	%r16, 0x0218, %r11
	.word 0x89643801  ! 838: MOVcc_I	<illegal instruction>
	.word 0xb4842b19  ! 838: ADDcc_I	addcc 	%r16, 0x0b19, %r26
thr1_dc_err_75:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_75), 16, 16),1,DC_DATA,60)
	.word 0xc29c1000  ! 840: LDDA_R	ldda	[%r16, %r0] 0x80, %r1
	.word 0xf8ec1011  ! 842: LDSTUBA_R	ldstuba	%r28, [%r16 + %r17] 0x80
	.word 0x84c40011  ! 844: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x92942315  ! 844: ORcc_I	orcc 	%r16, 0x0315, %r9
	.word 0x87343001  ! 844: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0xab3c0011  ! 844: SRA_R	sra 	%r16, %r17, %r21
	.word 0x90ac0011  ! 844: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x9c8c0011  ! 844: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x96440011  ! 844: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x8a1c0011  ! 845: XOR_R	xor 	%r16, %r17, %r5
	.word 0x8aac2483  ! 845: ANDNcc_I	andncc 	%r16, 0x0483, %r5
	.word 0xaf2c2001  ! 845: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0x92042f60  ! 845: ADD_I	add 	%r16, 0x0f60, %r9
	.word 0x96bc2041  ! 845: XNORcc_I	xnorcc 	%r16, 0x0041, %r11
	.word 0x89341011  ! 845: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x96ac25f5  ! 845: ANDNcc_I	andncc 	%r16, 0x05f5, %r11
	rd      %pc, %r18
	set     0x20, %r17
thr1_dc_err_76:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_76), 16, 16),1,DC_DATA,41)
	.word 0xc4040000  ! 846: LDUW_R	lduw	[%r16 + %r0], %r2
	return     %r18 + 0x20
	.word 0x9d340011  ! 849: SRL_R	srl 	%r16, %r17, %r14
	.word 0x9f342001  ! 849: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x828c207a  ! 849: ANDcc_I	andcc 	%r16, 0x007a, %r1
	.word 0x92440011  ! 849: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x82140011  ! 849: OR_R	or 	%r16, %r17, %r1
	.word 0xaf3c0011  ! 849: SRA_R	sra 	%r16, %r17, %r23
	.word 0xb68c0011  ! 849: ANDcc_R	andcc 	%r16, %r17, %r27
thr1_dc_err_77:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_77), 16, 16),1,DC_DATA,61)
	.word 0xf65421b3  ! 851: LDSH_I	ldsh	[%r16 + 0x01b3], %r27
	.word 0xfa5c0011  ! 853: LDX_R	ldx	[%r16 + %r17], %r29
	.word 0x90940011  ! 855: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x9c8428f7  ! 855: ADDcc_I	addcc 	%r16, 0x08f7, %r14
	.word 0x972c3001  ! 855: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x823c2df5  ! 855: XNOR_I	xnor 	%r16, 0x0df5, %r1
	.word 0xbb2c0011  ! 855: SLL_R	sll 	%r16, %r17, %r29
	.word 0x873c0011  ! 855: SRA_R	sra 	%r16, %r17, %r3
	.word 0x9c1c219e  ! 855: XOR_I	xor 	%r16, 0x019e, %r14
	.word 0x952c1011  ! 855: SLLX_R	sllx	%r16, %r17, %r10
thr1_dc_err_78:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_78), 16, 16),1,DC_DATA,42)
	.word 0xf7040000  ! 857: LDF_R	ld	[%r16, %r0], %f27
!Illinst alu
	.word 0x9a8c2b3f  ! 859: ANDcc_I	andcc 	%r16, 0x0b3f, %r13
	.word 0x8c840011  ! 861: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x8f641811  ! 861: MOVcc_R	<illegal instruction>
	.word 0x8a3c0011  ! 861: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x89341011  ! 861: SRLX_R	srlx	%r16, %r17, %r4
	.word 0xb4940011  ! 861: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0x90940011  ! 861: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0xb83c2648  ! 861: XNOR_I	xnor 	%r16, 0x0648, %r28
	.word 0xd2dc1011  ! 862: LDXA_R	ldxa	[%r16, %r17] 0x80, %r9
	.word 0xea941011  ! 864: LDUHA_R	lduha	[%r16, %r17] 0x80, %r21
	.word 0x913c2001  ! 866: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x8f3c0011  ! 866: SRA_R	sra 	%r16, %r17, %r7
	.word 0xad342001  ! 866: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0x888c0011  ! 866: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0x8d3c1011  ! 866: SRAX_R	srax	%r16, %r17, %r6
	.word 0x9c1c0011  ! 866: XOR_R	xor 	%r16, %r17, %r14
	.word 0x997c0411  ! 866: MOVR_R	move	%r16, %r17, %r12
	.word 0xa6b40011  ! 866: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0xbabc0011  ! 867: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0x90940011  ! 867: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x823c2ae6  ! 867: XNOR_I	xnor 	%r16, 0x0ae6, %r1
	.word 0x880c0011  ! 867: AND_R	and 	%r16, %r17, %r4
	.word 0x8b341011  ! 867: SRLX_R	srlx	%r16, %r17, %r5
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xcf841011  ! 867: LDFA_R	lda	[%r16, %r17], %f7
	return     %r18 + %r17
	.word 0xacc40011  ! 870: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0x95641811  ! 870: MOVcc_R	<illegal instruction>
	.word 0x98842122  ! 870: ADDcc_I	addcc 	%r16, 0x0122, %r12
	.word 0x90b42044  ! 870: ORNcc_I	orncc 	%r16, 0x0044, %r8
	.word 0x88840011  ! 870: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x9e3c0011  ! 870: XNOR_R	xnor 	%r16, %r17, %r15
thr1_dc_err_79:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_79), 16, 16),1,DC_DATA,35)
	.word 0xf9140000  ! 872: LDQF_R	-	[%r16, %r0], %f28
	.word 0xe81c2e8b  ! 874: LDD_I	ldd	[%r16 + 0x0e8b], %r20
	.word 0xb43c0011  ! 876: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0xb88c2b10  ! 876: ANDcc_I	andcc 	%r16, 0x0b10, %r28
	.word 0x9b2c0011  ! 876: SLL_R	sll 	%r16, %r17, %r13
	.word 0x93343001  ! 876: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x972c0011  ! 876: SLL_R	sll 	%r16, %r17, %r11
thr1_dc_err_80:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_80), 16, 16),1,DC_DATA,68)
	.word 0xd28c2e58  ! 878: LDUBA_I	lduba	[%r16, + 0x0e58] %asi, %r9
thr1_irf_ce_79:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_79), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xd3140011  ! 880: LDQF_R	-	[%r16, %r17], %f9
	.word 0xb13c2001  ! 882: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0x92142375  ! 882: OR_I	or 	%r16, 0x0375, %r9
	.word 0xae1c2953  ! 882: XOR_I	xor 	%r16, 0x0953, %r23
	.word 0x8cb42603  ! 882: ORNcc_I	orncc 	%r16, 0x0603, %r6
	.word 0x9eb40011  ! 882: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0xaf2c3001  ! 882: SLLX_I	sllx	%r16, 0x0001, %r23
	.word 0x88140011  ! 882: OR_R	or 	%r16, %r17, %r4
	.word 0x992c2001  ! 882: SLL_I	sll 	%r16, 0x0001, %r12
thr1_dc_err_81:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_81), 16, 16),1,DC_DATA,1)
	.word 0xe85c0000  ! 884: LDX_R	ldx	[%r16 + %r0], %r20
thr1_irf_ce_80:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_80), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xd4dc1011  ! 886: LDXA_R	ldxa	[%r16, %r17] 0x80, %r10
	.word 0x82ac0011  ! 888: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x82c425ec  ! 888: ADDCcc_I	addccc 	%r16, 0x05ec, %r1
	.word 0xab3c0011  ! 888: SRA_R	sra 	%r16, %r17, %r21
	.word 0xb69c0011  ! 888: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0xa7643801  ! 888: MOVcc_I	<illegal instruction>
	.word 0x840429f6  ! 888: ADD_I	add 	%r16, 0x09f6, %r2
	.word 0x8a9c0011  ! 888: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0xb48c29df  ! 888: ANDcc_I	andcc 	%r16, 0x09df, %r26
thr1_dc_err_82:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_82), 16, 16),1,DC_DATA,13)
	.word 0xe89422f1  ! 890: LDUHA_I	lduha	[%r16, + 0x02f1] %asi, %r20
thr1_irf_ce_81:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_81), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xca9c1011  ! 892: LDDA_R	ldda	[%r16, %r17] 0x80, %r5
	.word 0x9a94263f  ! 894: ORcc_I	orcc 	%r16, 0x063f, %r13
	.word 0xab341011  ! 894: SRLX_R	srlx	%r16, %r17, %r21
	.word 0xb92c1011  ! 894: SLLX_R	sllx	%r16, %r17, %r28
	.word 0x897c2401  ! 894: MOVR_I	move	%r16, 0xfffffe34, %r4
	.word 0x889c0011  ! 894: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x8aac0011  ! 894: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0xd48c1011  ! 895: LDUBA_R	lduba	[%r16, %r17] 0x80, %r10
thr1_irf_ce_82:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_82), 16, 16),1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xe7841011  ! 897: LDFA_R	lda	[%r16, %r17], %f19
	.word 0xba840011  ! 899: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0x892c1011  ! 899: SLLX_R	sllx	%r16, %r17, %r4
	.word 0x8ec40011  ! 899: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0xab2c3001  ! 899: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x9a0c0011  ! 899: AND_R	and 	%r16, %r17, %r13
	.word 0xe9941011  ! 900: LDQFA_R	-	[%r16, %r17], %f20
thr1_irf_ce_83:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_83), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xecdc1011  ! 902: LDXA_R	ldxa	[%r16, %r17] 0x80, %r22
	.word 0x972c0011  ! 904: SLL_R	sll 	%r16, %r17, %r11
	.word 0x9d343001  ! 904: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x83341011  ! 904: SRLX_R	srlx	%r16, %r17, %r1
	.word 0xb81c26df  ! 904: XOR_I	xor 	%r16, 0x06df, %r28
	.word 0x972c2001  ! 904: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x962c0011  ! 904: ANDN_R	andn 	%r16, %r17, %r11
	.word 0xdf841011  ! 905: LDFA_R	lda	[%r16, %r17], %f15
thr1_irf_ce_84:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_84), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xf074234c  ! 909: STX_I	stx	%r24, [%r16 + 0x034c]
	.word 0x822c0011  ! 911: ANDN_R	andn 	%r16, %r17, %r1
	.word 0xb3342001  ! 911: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x981c2025  ! 911: XOR_I	xor 	%r16, 0x0025, %r12
	.word 0xaec40011  ! 911: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0x90940011  ! 911: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x832c1011  ! 911: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x8a340011  ! 911: ORN_R	orn 	%r16, %r17, %r5
	.word 0x8c140011  ! 911: OR_R	or 	%r16, %r17, %r6
	.word 0xde9c1011  ! 912: LDDA_R	ldda	[%r16, %r17] 0x80, %r15
	.word 0xc894210e  ! 914: LDUHA_I	lduha	[%r16, + 0x010e] %asi, %r4
	.word 0x822c24f1  ! 916: ANDN_I	andn 	%r16, 0x04f1, %r1
	.word 0xb2bc0011  ! 916: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0x9cb40011  ! 916: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x892c2001  ! 916: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0x8a0c2b0d  ! 916: AND_I	and 	%r16, 0x0b0d, %r5
	.word 0xf6cc1011  ! 917: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r27
	.word 0xc8dc1011  ! 919: LDXA_R	ldxa	[%r16, %r17] 0x80, %r4
	.word 0x8c2c0011  ! 921: ANDN_R	andn 	%r16, %r17, %r6
	.word 0xb0842c75  ! 921: ADDcc_I	addcc 	%r16, 0x0c75, %r24
	.word 0xaab40011  ! 921: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0xacac20d5  ! 921: ANDNcc_I	andncc 	%r16, 0x00d5, %r22
	.word 0xb7340011  ! 921: SRL_R	srl 	%r16, %r17, %r27
thr1_dc_err_83:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_83), 16, 16),1,DC_DATA,64)
	.word 0xc31c0000  ! 923: LDDF_R	ldd	[%r16, %r0], %f1
	.word 0xc31c0011  ! 925: LDDF_R	ldd	[%r16, %r17], %f1
	.word 0x8a3c0011  ! 927: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x877c2401  ! 927: MOVR_I	move	%r16, 0xfffffe34, %r3
	.word 0xa82c2c78  ! 927: ANDN_I	andn 	%r16, 0x0c78, %r20
	.word 0xaabc204b  ! 927: XNORcc_I	xnorcc 	%r16, 0x004b, %r21
	.word 0x820c0011  ! 927: AND_R	and 	%r16, %r17, %r1
	.word 0xcadc1011  ! 928: LDXA_R	ldxa	[%r16, %r17] 0x80, %r5
thr1_irf_ce_85:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_85), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	ta	T_CHANGE_HPRIV	! macro
	.word 0xb8c40011  ! 932: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0x96342d76  ! 932: ORN_I	orn 	%r16, 0x0d76, %r11
	.word 0xb0bc2562  ! 932: XNORcc_I	xnorcc 	%r16, 0x0562, %r24
	.word 0x8c9c2b9a  ! 932: XORcc_I	xorcc 	%r16, 0x0b9a, %r6
	.word 0x852c0011  ! 932: SLL_R	sll 	%r16, %r17, %r2
	.word 0x920c0011  ! 932: AND_R	and 	%r16, %r17, %r9
	.word 0xb2c42e72  ! 932: ADDCcc_I	addccc 	%r16, 0x0e72, %r25
	.word 0xf99c1011  ! 933: LDDFA_R	ldda	[%r16, %r17], %f28
thr1_irf_ce_86:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_86), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xd59c1011  ! 935: LDDFA_R	ldda	[%r16, %r17], %f10
	.word 0xb92c1011  ! 937: SLLX_R	sllx	%r16, %r17, %r28
	.word 0x82440011  ! 937: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x909429a5  ! 937: ORcc_I	orcc 	%r16, 0x09a5, %r8
	.word 0x92140011  ! 937: OR_R	or 	%r16, %r17, %r9
	.word 0x85343001  ! 937: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0x972c3001  ! 937: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0xdacc2e47  ! 938: LDSBA_I	ldsba	[%r16, + 0x0e47] %asi, %r13
thr1_irf_ce_87:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_87), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xe7042d84  ! 940: LDF_I	ld	[%r16, 0x0d84], %f19
	.word 0xbb643801  ! 942: MOVcc_I	<illegal instruction>
	.word 0x82b423f3  ! 942: ORNcc_I	orncc 	%r16, 0x03f3, %r1
	.word 0x8f643801  ! 942: MOVcc_I	<illegal instruction>
	.word 0x8b3c2001  ! 942: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x96940011  ! 942: ORcc_R	orcc 	%r16, %r17, %r11
thr1_dc_err_84:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_84), 16, 16),1,DC_DATA,68)
	.word 0xd8040000  ! 944: LDUW_R	lduw	[%r16 + %r0], %r12
	wr      %r0, 0x1, %asr26
	.word 0x852c0011  ! 948: SLL_R	sll 	%r16, %r17, %r2
	.word 0xa83424ad  ! 948: ORN_I	orn 	%r16, 0x04ad, %r20
	.word 0x821c0011  ! 948: XOR_R	xor 	%r16, %r17, %r1
	.word 0xb53c2001  ! 948: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0x8ec4242b  ! 948: ADDCcc_I	addccc 	%r16, 0x042b, %r7
	.word 0x92b40011  ! 948: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xc8140011  ! 949: LDUH_R	lduh	[%r16 + %r17], %r4
	.word 0xd31c2923  ! 951: LDDF_I	ldd	[%r16, 0x0923], %f9
	.word 0x841c2610  ! 953: XOR_I	xor 	%r16, 0x0610, %r2
	.word 0xaa3c0011  ! 953: XNOR_R	xnor 	%r16, %r17, %r21
	.word 0xb93c1011  ! 953: SRAX_R	srax	%r16, %r17, %r28
	.word 0x857c0411  ! 953: MOVR_R	move	%r16, %r17, %r2
	.word 0x84440011  ! 953: ADDC_R	addc 	%r16, %r17, %r2
	.word 0xa6042ace  ! 953: ADD_I	add 	%r16, 0x0ace, %r19
thr1_dc_err_85:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_85), 16, 16),1,DC_DATA,41)
	.word 0xdd841000  ! 955: LDFA_R	lda	[%r16, %r0], %f14
	.word 0xe904292b  ! 957: LDF_I	ld	[%r16, 0x092b], %f20
	.word 0x843421e9  ! 959: ORN_I	orn 	%r16, 0x01e9, %r2
	.word 0xbb340011  ! 959: SRL_R	srl 	%r16, %r17, %r29
	.word 0xac140011  ! 959: OR_R	or 	%r16, %r17, %r22
	.word 0x893c0011  ! 959: SRA_R	sra 	%r16, %r17, %r4
	.word 0x8e942ae1  ! 959: ORcc_I	orcc 	%r16, 0x0ae1, %r7
thr1_dc_err_86:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_86), 16, 16),1,DC_DATA,48)
	.word 0xd3841000  ! 961: LDFA_R	lda	[%r16, %r0], %f9
thr1_irf_ce_88:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_88), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xe8ec1011  ! 963: LDSTUBA_R	ldstuba	%r20, [%r16 + %r17] 0x80
	.word 0x9a9c2b1e  ! 965: XORcc_I	xorcc 	%r16, 0x0b1e, %r13
	.word 0x9f3c2001  ! 965: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x8eb40011  ! 965: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0xb62c0011  ! 965: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x932c0011  ! 965: SLL_R	sll 	%r16, %r17, %r9
thr1_dc_err_87:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_87), 16, 16),1,DC_DATA,29)
	.word 0xd3841000  ! 967: LDFA_R	lda	[%r16, %r0], %f9
thr1_irf_ce_89:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_89), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xc3ec2286  ! 969: PREFETCHA_I	prefetcha	[%r16, + 0x0286] %asi, #one_read
	.word 0xb3643801  ! 971: MOVcc_I	<illegal instruction>
	.word 0x8e442a69  ! 971: ADDC_I	addc 	%r16, 0x0a69, %r7
	.word 0x90040011  ! 971: ADD_R	add 	%r16, %r17, %r8
	.word 0x820c0011  ! 971: AND_R	and 	%r16, %r17, %r1
	.word 0x8b643801  ! 971: MOVcc_I	<illegal instruction>
	.word 0x82142aec  ! 971: OR_I	or 	%r16, 0x0aec, %r1
	.word 0x9b2c2001  ! 971: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0xc6040011  ! 972: LDUW_R	lduw	[%r16 + %r17], %r3
!Illinst store
	.word 0xea740011  ! 974: STX_R	stx	%r21, [%r16 + %r17]
	.word 0x982c2ff6  ! 976: ANDN_I	andn 	%r16, 0x0ff6, %r12
	.word 0x941c2bb7  ! 976: XOR_I	xor 	%r16, 0x0bb7, %r10
	.word 0x90840011  ! 976: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0xa6c42d66  ! 976: ADDCcc_I	addccc 	%r16, 0x0d66, %r19
	.word 0xb02c21b4  ! 976: ANDN_I	andn 	%r16, 0x01b4, %r24
	.word 0xb42c0011  ! 976: ANDN_R	andn 	%r16, %r17, %r26
	.word 0xc2cc22e6  ! 977: LDSBA_I	ldsba	[%r16, + 0x02e6] %asi, %r1
	.word 0xfb941011  ! 979: LDQFA_R	-	[%r16, %r17], %f29
	.word 0xb52c3001  ! 981: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0x993c0011  ! 981: SRA_R	sra 	%r16, %r17, %r12
	.word 0xa93c2001  ! 981: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x8a140011  ! 981: OR_R	or 	%r16, %r17, %r5
	.word 0xad343001  ! 981: SRLX_I	srlx	%r16, 0x0001, %r22
thr1_dc_err_88:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_88), 16, 16),1,DC_DATA,62)
	.word 0xf8cc26ad  ! 983: LDSBA_I	ldsba	[%r16, + 0x06ad] %asi, %r28
thr1_irf_ce_90:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_90), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xdb140011  ! 985: LDQF_R	-	[%r16, %r17], %f13
	.word 0xb22c0011  ! 987: ANDN_R	andn 	%r16, %r17, %r25
	.word 0x92342d2f  ! 987: ORN_I	orn 	%r16, 0x0d2f, %r9
	.word 0xb49c0011  ! 987: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xb2340011  ! 987: ORN_R	orn 	%r16, %r17, %r25
	.word 0x9c2c2313  ! 987: ANDN_I	andn 	%r16, 0x0313, %r14
thr1_dc_err_89:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_89), 16, 16),1,DC_DATA,5)
	.word 0xc7140000  ! 989: LDQF_R	-	[%r16, %r0], %f3
thr1_irf_ce_91:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_91), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xd39c1011  ! 991: LDDFA_R	ldda	[%r16, %r17], %f9
	.word 0xaf342001  ! 993: SRL_I	srl 	%r16, 0x0001, %r23
	.word 0x92842a48  ! 993: ADDcc_I	addcc 	%r16, 0x0a48, %r9
	.word 0xb73c0011  ! 993: SRA_R	sra 	%r16, %r17, %r27
	.word 0xb60c219c  ! 993: AND_I	and 	%r16, 0x019c, %r27
	.word 0xad340011  ! 993: SRL_R	srl 	%r16, %r17, %r22
	.word 0x952c2001  ! 993: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0x8ec426a0  ! 993: ADDCcc_I	addccc 	%r16, 0x06a0, %r7
	.word 0x903c0011  ! 993: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0xda9c2a19  ! 994: LDDA_I	ldda	[%r16, + 0x0a19] %asi, %r13
thr1_irf_ce_92:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_92), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xecdc2897  ! 996: LDXA_I	ldxa	[%r16, + 0x0897] %asi, %r22
	.word 0xb41c29b9  ! 998: XOR_I	xor 	%r16, 0x09b9, %r26
	.word 0x82440011  ! 998: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x9d340011  ! 998: SRL_R	srl 	%r16, %r17, %r14
	.word 0x9d2c1011  ! 998: SLLX_R	sllx	%r16, %r17, %r14
	.word 0xad2c3001  ! 998: SLLX_I	sllx	%r16, 0x0001, %r22
thr1_dc_err_90:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_90), 16, 16),1,DC_DATA,14)
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
        setx  0x00000000000009b0, %g1, %r17
        setx  0x122e62d0b4914c1e, %g1, %r0
        setx  0x8db906b73f40e58e, %g1, %r1
        setx  0x0a98e4d842774933, %g1, %r2
        setx  0x827d947d260588f2, %g1, %r3
        setx  0x6e8715db0aa351ab, %g1, %r4
        setx  0x871eb7cca069c0a4, %g1, %r5
        setx  0x06da5b044c5e16eb, %g1, %r6
        setx  0xa23bf7a9451cef6c, %g1, %r7
        setx  0x53329c8d0b03acd2, %g1, %r8
        setx  0x16ab64762dee0da6, %g1, %r9
        setx  0x8ea3b0b6e7a762e0, %g1, %r10
        setx  0xd613fd118fc41667, %g1, %r11
        setx  0x5568b663361c3774, %g1, %r12
        setx  0x3ea408b389b58514, %g1, %r13
        setx  0x69e3f60caa17ed2a, %g1, %r14
        setx  0x1395261641afe2ba, %g1, %r15
        setx  0xa2fee2d57513807c, %g1, %r18
        setx  0xd9f8c2a0b95979b0, %g1, %r19
        setx  0x8c5ebd32408d19c6, %g1, %r20
        setx  0xa9342c6244c7d745, %g1, %r21
        setx  0xade4fe465ceeda66, %g1, %r22
        setx  0xcd09937d4f1f1ff6, %g1, %r23
        setx  0xb30457b1264df937, %g1, %r24
        setx  0xdf67b1facfc32487, %g1, %r25
        setx  0xcde954873ec4ca56, %g1, %r26
        setx  0x7cf24fbffedd234b, %g1, %r27
        setx  0x9c85502f4ea14b03, %g1, %r28
        setx  0x49d37beefc688ddd, %g1, %r29
        setx  0xbdfedbaf1cdfe0bd, %g1, %r30
        setx  0x5321cf8b71330491, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000710, %g1, %r17
        setx  0xe34e7dc244a1d321, %g1, %r0
        setx  0x97c6857d0c44b181, %g1, %r1
        setx  0x2def403c608327b6, %g1, %r2
        setx  0x7efdb93615393d09, %g1, %r3
        setx  0x7bdb43bf9c947190, %g1, %r4
        setx  0x984fbba521e09297, %g1, %r5
        setx  0x6979fd6ef014888d, %g1, %r6
        setx  0x4f23e8588231b1f1, %g1, %r7
        setx  0x0922e84dd579d2ed, %g1, %r8
        setx  0xcc13dc2f5a131f81, %g1, %r9
        setx  0x912260559b648b6c, %g1, %r10
        setx  0x78a9f526dff554e0, %g1, %r11
        setx  0xe6fd56fe53ba73c9, %g1, %r12
        setx  0x5ad9737f3ef73cea, %g1, %r13
        setx  0xd112cd270f13546f, %g1, %r14
        setx  0x092ca3f314a8b611, %g1, %r15
        setx  0x353da0e9b4619c68, %g1, %r18
        setx  0x35d954764c82c842, %g1, %r19
        setx  0x5df8ce5cd0c65d16, %g1, %r20
        setx  0x33ff6d4a24808760, %g1, %r21
        setx  0xdcefd9f43d056e2b, %g1, %r22
        setx  0x7815e74265ba2b3c, %g1, %r23
        setx  0xb022559b03cee43e, %g1, %r24
        setx  0xdd066079fd08cf65, %g1, %r25
        setx  0xfc5f41cf8ac3b229, %g1, %r26
        setx  0xcdd04b7eea153a51, %g1, %r27
        setx  0x9558ec29fd20a543, %g1, %r28
        setx  0xaa24b1297c30a730, %g1, %r29
        setx  0xb69fc96b161f7105, %g1, %r30
        setx  0x0a2cbf72bb558231, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000120, %g1, %r17
        setx  0xafbee5e82f6be15b, %g1, %r0
        setx  0x858e97b89d4b84d0, %g1, %r1
        setx  0x20db61bf29d47de0, %g1, %r2
        setx  0xe559724c371f1295, %g1, %r3
        setx  0x4e01756a5ed185f3, %g1, %r4
        setx  0x300ba4f534c85696, %g1, %r5
        setx  0x736e6045b97a5307, %g1, %r6
        setx  0x8521e0f7b3d3d4dd, %g1, %r7
        setx  0x1de43bdbda22ffed, %g1, %r8
        setx  0x4e90a5d0f618a77f, %g1, %r9
        setx  0x5b53d4bd07e90af2, %g1, %r10
        setx  0x1cffead238c270b7, %g1, %r11
        setx  0x0f828cb1837fabeb, %g1, %r12
        setx  0x40b666530817b8bc, %g1, %r13
        setx  0x48feb0baaa6dd787, %g1, %r14
        setx  0xb1e447b25970109f, %g1, %r15
        setx  0x73fd42b013dd5779, %g1, %r18
        setx  0x8a52e55ea4f7ec7c, %g1, %r19
        setx  0x064c808c8a4f9699, %g1, %r20
        setx  0x5eab0e89e8965941, %g1, %r21
        setx  0xcab1537473deb848, %g1, %r22
        setx  0x0e17f5f50ed322a4, %g1, %r23
        setx  0x2cac855a0133dfb1, %g1, %r24
        setx  0xd3ee512e5175f85f, %g1, %r25
        setx  0x110d320233f990ef, %g1, %r26
        setx  0x0f6715b9f5b0990b, %g1, %r27
        setx  0xfb4f7c9d90449fa5, %g1, %r28
        setx  0x0e3d64ca7042fd53, %g1, %r29
        setx  0x4534d121bd0a263d, %g1, %r30
        setx  0xea7a386aa781ef8e, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000090, %g1, %r17
        setx  0xe23dabae9edb065e, %g1, %r0
        setx  0x1d914ae30c6ece34, %g1, %r1
        setx  0x27f8ff19e96940ca, %g1, %r2
        setx  0x289ae70344952bc9, %g1, %r3
        setx  0x5f9afc712bf1a74f, %g1, %r4
        setx  0x64917f283dcbaa8c, %g1, %r5
        setx  0xba527723f8d665e9, %g1, %r6
        setx  0x99fa7d5079365501, %g1, %r7
        setx  0x13c7956cc780d3da, %g1, %r8
        setx  0x38ead0bb7bf331cd, %g1, %r9
        setx  0x400c3b94f1f6cbce, %g1, %r10
        setx  0x3ad68cb9e6c98d04, %g1, %r11
        setx  0x318c3e718fff0fbe, %g1, %r12
        setx  0x4e6cb3fec1fdb0c7, %g1, %r13
        setx  0xdbc21ce0c9a73717, %g1, %r14
        setx  0xa6de730844660c3b, %g1, %r15
        setx  0xbdbad12662bc9012, %g1, %r18
        setx  0xae3e8607dd1386f1, %g1, %r19
        setx  0xe85f9bf878fc1df5, %g1, %r20
        setx  0x21cb4d63095690bf, %g1, %r21
        setx  0xe68437ad08571021, %g1, %r22
        setx  0xd64bbb95aa421259, %g1, %r23
        setx  0x49d67959c073aa0c, %g1, %r24
        setx  0xc7266af5a83fe015, %g1, %r25
        setx  0xbb437220adc110f6, %g1, %r26
        setx  0x02a24e9d4b529d91, %g1, %r27
        setx  0x966c3fddc407b9b8, %g1, %r28
        setx  0xbe1164255dd01be9, %g1, %r29
        setx  0xb585e22868685171, %g1, %r30
        setx  0x42bd2c4adb946fe4, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000630, %g1, %r17
        setx  0x08c2b12abf8cf339, %g1, %r0
        setx  0x8c40576b67a98c78, %g1, %r1
        setx  0xb4c4545fa96b4429, %g1, %r2
        setx  0x96ce62b12428b005, %g1, %r3
        setx  0x24ff5e43f465cc7f, %g1, %r4
        setx  0xadef94dd6ff20e21, %g1, %r5
        setx  0xe3cdc24e09f2bee3, %g1, %r6
        setx  0x45b63f4b4afcfdf9, %g1, %r7
        setx  0x5102d6fd86d8bde5, %g1, %r8
        setx  0x02b285e165d5c89d, %g1, %r9
        setx  0xc74684cdb6026218, %g1, %r10
        setx  0xc822b6f151fe4bd6, %g1, %r11
        setx  0x2352ae1bddaf2b2e, %g1, %r12
        setx  0x3759639e6a0f2b18, %g1, %r13
        setx  0xf5e2af56a4a39c27, %g1, %r14
        setx  0xf1abc636aab434d8, %g1, %r15
        setx  0xbc441fd00184b385, %g1, %r18
        setx  0xdca6a794677069da, %g1, %r19
        setx  0x974f2cb55df46dec, %g1, %r20
        setx  0x1467b39c633628fd, %g1, %r21
        setx  0x87d41b03fa4e9099, %g1, %r22
        setx  0xbde9cadff8e82bd9, %g1, %r23
        setx  0x53b3db295127e670, %g1, %r24
        setx  0x5667db322ac80155, %g1, %r25
        setx  0xe79b461893447cc4, %g1, %r26
        setx  0x54182731fc86c6c7, %g1, %r27
        setx  0xf4a17c7b2c34a630, %g1, %r28
        setx  0x46227d407cc33a30, %g1, %r29
        setx  0xf0dc50cf220fcef5, %g1, %r30
        setx  0x64612008aa4c3eca, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000b50, %g1, %r17
        setx  0x8bd70b6e7ed3f10a, %g1, %r0
        setx  0xfbbcc24a7fc8b941, %g1, %r1
        setx  0x2f972bc6f4ebe950, %g1, %r2
        setx  0x9f2e5af50c5f8f07, %g1, %r3
        setx  0xc6f932fbcfd50924, %g1, %r4
        setx  0x17584c34dfc5231d, %g1, %r5
        setx  0xe9e34d788bd3b8ca, %g1, %r6
        setx  0x3ee4d12a9db8dbf2, %g1, %r7
        setx  0xfc1c32112977ecb2, %g1, %r8
        setx  0x206a0becd7613a26, %g1, %r9
        setx  0x864a063a47d0a8ce, %g1, %r10
        setx  0x023367a282519f5b, %g1, %r11
        setx  0x2f44311d6ba9bcec, %g1, %r12
        setx  0xea49c118aee04b13, %g1, %r13
        setx  0xe88a893268ec50ec, %g1, %r14
        setx  0xbb511866756d87b9, %g1, %r15
        setx  0x83e0b46ba01c06c9, %g1, %r18
        setx  0xdde0267e8193f9e6, %g1, %r19
        setx  0x235a22a9bd2af98d, %g1, %r20
        setx  0x6d41011e203d7543, %g1, %r21
        setx  0x2226f5fd6b33203a, %g1, %r22
        setx  0xb2f3024d7965d28a, %g1, %r23
        setx  0xa25ee5883b50460a, %g1, %r24
        setx  0x305bc1ea9b073d56, %g1, %r25
        setx  0x23e09e02e627ae63, %g1, %r26
        setx  0xee6d0ef58b9ef7ad, %g1, %r27
        setx  0xe5b2b7de9ce3f3fc, %g1, %r28
        setx  0x9ccefb56da35598a, %g1, %r29
        setx  0x2e9171b037736e60, %g1, %r30
        setx  0x830b01d63bb2a5f6, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000890, %g1, %r17
        setx  0xf3a50d893cc4e169, %g1, %r0
        setx  0x5ce92c856ce65d51, %g1, %r1
        setx  0xacd3aa868b2040a7, %g1, %r2
        setx  0x46190208c34aee2f, %g1, %r3
        setx  0xb566cd38554e7dd4, %g1, %r4
        setx  0x85c8b138604c0959, %g1, %r5
        setx  0xe7277de5a45c4143, %g1, %r6
        setx  0x6fad2689c13af6b0, %g1, %r7
        setx  0x39348fee7473ae71, %g1, %r8
        setx  0xaf976d93ddbbf479, %g1, %r9
        setx  0xbfc311d6baf36126, %g1, %r10
        setx  0x6c0ff9121ad68d7d, %g1, %r11
        setx  0x488a9bbe81f06f05, %g1, %r12
        setx  0x72cd311ce79de52b, %g1, %r13
        setx  0x02b36dc9f41f3e82, %g1, %r14
        setx  0xcfc157590d3011d8, %g1, %r15
        setx  0x1d16f49bcfe1acb0, %g1, %r18
        setx  0x2a22c4d5302b8f5e, %g1, %r19
        setx  0x67a4e49bf93f0fb6, %g1, %r20
        setx  0x04d5a96e6116edf2, %g1, %r21
        setx  0xb694c4344a56386a, %g1, %r22
        setx  0x73689bc762ce7e2e, %g1, %r23
        setx  0xaa49d508f548eeef, %g1, %r24
        setx  0xe279e4047ffd37d2, %g1, %r25
        setx  0x6b9c73e2eb450e45, %g1, %r26
        setx  0x7d5b9a842d87cb2d, %g1, %r27
        setx  0x7eb215cb03b44d1a, %g1, %r28
        setx  0xc1ea2a1a4c3d6db3, %g1, %r29
        setx  0x59ea2de4dfd83b84, %g1, %r30
        setx  0x7db4634af23cc0cd, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000b20, %g1, %r17
        setx  0x8f15a2435380424a, %g1, %r0
        setx  0x9dd5561d0e59fa0f, %g1, %r1
        setx  0xd0b130a7c19a1b24, %g1, %r2
        setx  0xd0e87ecc53b647cf, %g1, %r3
        setx  0x9af1a7c4c2320941, %g1, %r4
        setx  0xf7cba0365699972d, %g1, %r5
        setx  0x20e5163781dbd86c, %g1, %r6
        setx  0x2a5b37af93e626d9, %g1, %r7
        setx  0x5f826a2af44f297d, %g1, %r8
        setx  0xb9e7e5e0dd84c4e4, %g1, %r9
        setx  0x2f8a70f21f66f337, %g1, %r10
        setx  0xe6fb3a9ff4ab94aa, %g1, %r11
        setx  0x71ac889eab75db9a, %g1, %r12
        setx  0x2d8a2af73cdf13f6, %g1, %r13
        setx  0x30c8ca2a809cd303, %g1, %r14
        setx  0xdecfd55cfdfd9424, %g1, %r15
        setx  0x811de6e01aa13973, %g1, %r18
        setx  0xf85710d34a0fe21a, %g1, %r19
        setx  0xaa57eec0008fbab5, %g1, %r20
        setx  0xeee4da6348b56cdd, %g1, %r21
        setx  0x7b0d3668e23e18a7, %g1, %r22
        setx  0x5810fc4524aa3d07, %g1, %r23
        setx  0x75bd1340a4eddadf, %g1, %r24
        setx  0x7eeb6ff4a354010b, %g1, %r25
        setx  0x248fcb6645500817, %g1, %r26
        setx  0x3d77c60b9217b8de, %g1, %r27
        setx  0x4d9ddde843e5aae0, %g1, %r28
        setx  0x2f6cf5a46a52bead, %g1, %r29
        setx  0x136e94f7aaf3c88f, %g1, %r30
        setx  0x8dc18d78eaebc6c3, %g1, %r31
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
	.word 0xcf042da5  ! 2: LDF_I	ld	[%r16, 0x0da5], %f7
	.word 0xdd841011  ! 4: LDFA_R	lda	[%r16, %r17], %f14
	.word 0x8c1c27b9  ! 6: XOR_I	xor 	%r16, 0x07b9, %r6
	.word 0xaec40011  ! 6: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0x90bc0011  ! 6: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x8d7c2401  ! 6: MOVR_I	move	%r16, 0xfffffe34, %r6
	.word 0xa9343001  ! 6: SRLX_I	srlx	%r16, 0x0001, %r20
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,55)
	.word 0xe90427b9  ! 8: LDF_I	ld	[%r16, 0x07b9], %f20
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xee442870  ! 10: LDSW_I	ldsw	[%r16 + 0x0870], %r23
	.word 0x8f2c0011  ! 12: SLL_R	sll 	%r16, %r17, %r7
	.word 0x9a840011  ! 12: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x9444212d  ! 12: ADDC_I	addc 	%r16, 0x012d, %r10
	.word 0x849c2514  ! 12: XORcc_I	xorcc 	%r16, 0x0514, %r2
	.word 0x832c3001  ! 12: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x933c1011  ! 12: SRAX_R	srax	%r16, %r17, %r9
	.word 0xb2b40011  ! 12: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0xb29c296e  ! 12: XORcc_I	xorcc 	%r16, 0x096e, %r25
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,48)
	.word 0xf21c296e  ! 14: LDD_I	ldd	[%r16 + 0x096e], %r25
!Illinst alu
	.word 0xa8a42745  ! 16: SUBcc_I	subcc 	%r16, 0x0745, %r20
	.word 0xb6b42285  ! 18: ORNcc_I	orncc 	%r16, 0x0285, %r27
	.word 0x9e140011  ! 18: OR_R	or 	%r16, %r17, %r15
	.word 0xb42c2a10  ! 18: ANDN_I	andn 	%r16, 0x0a10, %r26
	.word 0x9f643801  ! 18: MOVcc_I	<illegal instruction>
	.word 0xb29c0011  ! 18: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0x92440011  ! 18: ADDC_R	addc 	%r16, %r17, %r9
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,67)
	.word 0xd3140000  ! 20: LDQF_R	-	[%r16, %r0], %f9
	.word 0x8152c000  ! 22: RDPR_CANRESTORE	rdpr	%canrestore, %r0
	.word 0xacb4240c  ! 24: ORNcc_I	orncc 	%r16, 0x040c, %r22
	.word 0x889c0011  ! 24: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x9d3c0011  ! 24: SRA_R	sra 	%r16, %r17, %r14
	.word 0xb68c0011  ! 24: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0xbb7c2401  ! 24: MOVR_I	move	%r16, 0xfffffe34, %r29
	.word 0x8c440011  ! 24: ADDC_R	addc 	%r16, %r17, %r6
	.word 0xd8cc25b7  ! 25: LDSBA_I	ldsba	[%r16, + 0x05b7] %asi, %r12
	.word 0xfa84250f  ! 27: LDUWA_I	lduwa	[%r16, + 0x050f] %asi, %r29
	.word 0x9e8425d4  ! 29: ADDcc_I	addcc 	%r16, 0x05d4, %r15
	.word 0xa9343001  ! 29: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0xb2440011  ! 29: ADDC_R	addc 	%r16, %r17, %r25
	.word 0x9e8c245a  ! 29: ANDcc_I	andcc 	%r16, 0x045a, %r15
	.word 0x8abc2125  ! 29: XNORcc_I	xnorcc 	%r16, 0x0125, %r5
	.word 0xa83c0011  ! 29: XNOR_R	xnor 	%r16, %r17, %r20
thr0_dc_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_3), 16, 16),1,DC_DATA,65)
	.word 0xe89c2125  ! 31: LDDA_I	ldda	[%r16, + 0x0125] %asi, %r20
	.word 0x81580000  ! 33: FLUSHW	flushw
	.word 0x9b643801  ! 35: MOVcc_I	<illegal instruction>
	.word 0x8c142fd1  ! 35: OR_I	or 	%r16, 0x0fd1, %r6
	.word 0xaa3c2a11  ! 35: XNOR_I	xnor 	%r16, 0x0a11, %r21
	.word 0x8e040011  ! 35: ADD_R	add 	%r16, %r17, %r7
	.word 0x8f2c2001  ! 35: SLL_I	sll 	%r16, 0x0001, %r7
thr0_dc_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_4), 16, 16),1,DC_DATA,38)
	.word 0xcf040000  ! 37: LDF_R	ld	[%r16, %r0], %f7
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0x81494000  ! 39: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0xb2ac0011  ! 41: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0x8f2c1011  ! 41: SLLX_R	sllx	%r16, %r17, %r7
	.word 0x90140011  ! 41: OR_R	or 	%r16, %r17, %r8
	.word 0xb63c0011  ! 41: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0x92b42826  ! 41: ORNcc_I	orncc 	%r16, 0x0826, %r9
	.word 0xc80c0011  ! 42: LDUB_R	ldub	[%r16 + %r17], %r4
	.word 0xfb841011  ! 44: LDFA_R	lda	[%r16, %r17], %f29
	.word 0x9c942b68  ! 46: ORcc_I	orcc 	%r16, 0x0b68, %r14
	.word 0xb8840011  ! 46: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0xaa9c0011  ! 46: XORcc_R	xorcc 	%r16, %r17, %r21
	.word 0x89643801  ! 46: MOVcc_I	<illegal instruction>
	.word 0x9f3c2001  ! 46: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0xb9341011  ! 46: SRLX_R	srlx	%r16, %r17, %r28
	.word 0x861c2eeb  ! 46: XOR_I	xor 	%r16, 0x0eeb, %r3
	.word 0x821c28cf  ! 46: XOR_I	xor 	%r16, 0x08cf, %r1
	.word 0xc4d4287c  ! 47: LDSHA_I	ldsha	[%r16, + 0x087c] %asi, %r2
!Illinst alu
	.word 0x8b7c0411  ! 49: MOVR_R	move	%r16, %r17, %r5
	.word 0x9f341011  ! 51: SRLX_R	srlx	%r16, %r17, %r15
	.word 0x84840011  ! 51: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0xb97c2401  ! 51: MOVR_I	move	%r16, 0xfffffe34, %r28
	.word 0x88c4272e  ! 51: ADDCcc_I	addccc 	%r16, 0x072e, %r4
	.word 0xb13c0011  ! 51: SRA_R	sra 	%r16, %r17, %r24
	.word 0xab641811  ! 51: MOVcc_R	<illegal instruction>
thr0_dc_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_5), 16, 16),1,DC_DATA,32)
	.word 0xeb9c1000  ! 53: LDDFA_R	ldda	[%r16, %r0], %f21
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xc8c42955  ! 55: LDSWA_I	ldswa	[%r16, + 0x0955] %asi, %r4
	.word 0x968c0011  ! 57: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x90840011  ! 57: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x9a8c0011  ! 57: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0xb0342e6b  ! 57: ORN_I	orn 	%r16, 0x0e6b, %r24
	.word 0x92ac0011  ! 57: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xf7040011  ! 58: LDF_R	ld	[%r16, %r17], %f27
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xca8c2c0d  ! 60: LDUBA_I	lduba	[%r16, + 0x0c0d] %asi, %r5
	.word 0x837c0411  ! 62: MOVR_R	move	%r16, %r17, %r1
	.word 0x980c273b  ! 62: AND_I	and 	%r16, 0x073b, %r12
	.word 0x9a8423c0  ! 62: ADDcc_I	addcc 	%r16, 0x03c0, %r13
	.word 0x953c2001  ! 62: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x84940011  ! 62: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0xb0040011  ! 62: ADD_R	add 	%r16, %r17, %r24
	.word 0x9b2c3001  ! 62: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x9a940011  ! 62: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0xcedc1011  ! 63: LDXA_R	ldxa	[%r16, %r17] 0x80, %r7
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xd0142f15  ! 65: LDUH_I	lduh	[%r16 + 0x0f15], %r8
	.word 0x8b343001  ! 67: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0x921427a2  ! 67: OR_I	or 	%r16, 0x07a2, %r9
	.word 0x86940011  ! 67: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x8d340011  ! 67: SRL_R	srl 	%r16, %r17, %r6
	.word 0xba2c2679  ! 67: ANDN_I	andn 	%r16, 0x0679, %r29
	.word 0x89342001  ! 67: SRL_I	srl 	%r16, 0x0001, %r4
thr0_dc_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_6), 16, 16),1,DC_DATA,12)
	.word 0xc85c2679  ! 69: LDX_I	ldx	[%r16 + 0x0679], %r4
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xd44c20cb  ! 71: LDSB_I	ldsb	[%r16 + 0x00cb], %r10
	.word 0x8e1c2009  ! 73: XOR_I	xor 	%r16, 0x0009, %r7
	.word 0xb20c2ad8  ! 73: AND_I	and 	%r16, 0x0ad8, %r25
	.word 0x993c2001  ! 73: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x9e040011  ! 73: ADD_R	add 	%r16, %r17, %r15
	.word 0x90c42780  ! 73: ADDCcc_I	addccc 	%r16, 0x0780, %r8
	.word 0xa68c2867  ! 73: ANDcc_I	andcc 	%r16, 0x0867, %r19
	.word 0x8ab40011  ! 73: ORNcc_R	orncc 	%r16, %r17, %r5
thr0_dc_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_7), 16, 16),1,DC_DATA,53)
	.word 0xca4c2867  ! 75: LDSB_I	ldsb	[%r16 + 0x0867], %r5
thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xee34288d  ! 79: STH_I	sth	%r23, [%r16 + 0x088d]
	.word 0x877c0411  ! 81: MOVR_R	move	%r16, %r17, %r3
	.word 0x88c40011  ! 81: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xbaac0011  ! 81: ANDNcc_R	andncc 	%r16, %r17, %r29
	.word 0x861c2f41  ! 81: XOR_I	xor 	%r16, 0x0f41, %r3
	.word 0xb4840011  ! 81: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0x96042ee5  ! 81: ADD_I	add 	%r16, 0x0ee5, %r11
	.word 0xb0942d34  ! 81: ORcc_I	orcc 	%r16, 0x0d34, %r24
	.word 0xd2d42bfa  ! 82: LDSHA_I	ldsha	[%r16, + 0x0bfa] %asi, %r9
	wr      %r0, 0x5, %asr26
	.word 0x8b341011  ! 86: SRLX_R	srlx	%r16, %r17, %r5
	.word 0x989428c4  ! 86: ORcc_I	orcc 	%r16, 0x08c4, %r12
	.word 0x9a14224a  ! 86: OR_I	or 	%r16, 0x024a, %r13
	.word 0xaab42f5f  ! 86: ORNcc_I	orncc 	%r16, 0x0f5f, %r21
	.word 0x8a44242c  ! 86: ADDC_I	addc 	%r16, 0x042c, %r5
	.word 0xdecc2f6b  ! 87: LDSBA_I	ldsba	[%r16, + 0x0f6b] %asi, %r15
	.word 0xf6dc1011  ! 89: LDXA_R	ldxa	[%r16, %r17] 0x80, %r27
	.word 0x94340011  ! 91: ORN_R	orn 	%r16, %r17, %r10
	.word 0x96340011  ! 91: ORN_R	orn 	%r16, %r17, %r11
	.word 0xb2040011  ! 91: ADD_R	add 	%r16, %r17, %r25
	.word 0x9c940011  ! 91: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0xa6ac267f  ! 91: ANDNcc_I	andncc 	%r16, 0x067f, %r19
	.word 0x9cc42647  ! 91: ADDCcc_I	addccc 	%r16, 0x0647, %r14
	.word 0x993c0011  ! 91: SRA_R	sra 	%r16, %r17, %r12
thr0_dc_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_8), 16, 16),1,DC_DATA,42)
	.word 0xd8942647  ! 93: LDUHA_I	lduha	[%r16, + 0x0647] %asi, %r12
	.word 0xca841011  ! 95: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r5
	.word 0x948c0011  ! 97: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x9d341011  ! 97: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x888c0011  ! 97: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0x9e94296a  ! 97: ORcc_I	orcc 	%r16, 0x096a, %r15
	.word 0x8a1c2ba7  ! 97: XOR_I	xor 	%r16, 0x0ba7, %r5
thr0_dc_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_9), 16, 16),1,DC_DATA,69)
	.word 0xca5c0000  ! 99: LDX_R	ldx	[%r16 + %r0], %r5
thr0_irf_ce_7:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_7), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xd0140011  ! 101: LDUH_R	lduh	[%r16 + %r17], %r8
	.word 0x88ac2f70  ! 103: ANDNcc_I	andncc 	%r16, 0x0f70, %r4
	.word 0x849c2fcf  ! 103: XORcc_I	xorcc 	%r16, 0x0fcf, %r2
	.word 0xacc40011  ! 103: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0xa77c2401  ! 103: MOVR_I	move	%r16, 0xfffffe34, %r19
	.word 0x93643801  ! 103: MOVcc_I	<illegal instruction>
	.word 0xf41c0011  ! 104: LDD_R	ldd	[%r16 + %r17], %r26
	.word 0xc81c2dc7  ! 106: LDD_I	ldd	[%r16 + 0x0dc7], %r4
	.word 0x84b40011  ! 108: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xa61c29b0  ! 108: XOR_I	xor 	%r16, 0x09b0, %r19
	.word 0xb6040011  ! 108: ADD_R	add 	%r16, %r17, %r27
	.word 0xa8c42dc6  ! 108: ADDCcc_I	addccc 	%r16, 0x0dc6, %r20
	.word 0xb2940011  ! 108: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0x8a9c0011  ! 108: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0x8d2c1011  ! 108: SLLX_R	sllx	%r16, %r17, %r6
thr0_dc_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_10), 16, 16),1,DC_DATA,40)
	.word 0xcc5c2dc6  ! 110: LDX_I	ldx	[%r16 + 0x0dc6], %r6
thr0_irf_ce_8:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_8), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xe8540011  ! 112: LDSH_R	ldsh	[%r16 + %r17], %r20
	.word 0xb004241b  ! 114: ADD_I	add 	%r16, 0x041b, %r24
	.word 0xb1641811  ! 114: MOVcc_R	<illegal instruction>
	.word 0xb4c40011  ! 114: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0xba3c0011  ! 114: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x90440011  ! 114: ADDC_R	addc 	%r16, %r17, %r8
	.word 0xde842fa9  ! 115: LDUWA_I	lduwa	[%r16, + 0x0fa9] %asi, %r15
thr0_irf_ce_9:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_9), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xdb1c0011  ! 117: LDDF_R	ldd	[%r16, %r17], %f13
	.word 0x9a340011  ! 119: ORN_R	orn 	%r16, %r17, %r13
	.word 0x863c0011  ! 119: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0xa8940011  ! 119: ORcc_R	orcc 	%r16, %r17, %r20
	.word 0x932c1011  ! 119: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x9c3c2af6  ! 119: XNOR_I	xnor 	%r16, 0x0af6, %r14
	.word 0xd68c1011  ! 120: LDUBA_R	lduba	[%r16, %r17] 0x80, %r11
        wr  %g0, 0x80, %asi
	.word 0x9ec42136  ! 124: ADDCcc_I	addccc 	%r16, 0x0136, %r15
	.word 0xa72c0011  ! 124: SLL_R	sll 	%r16, %r17, %r19
	.word 0x961c2236  ! 124: XOR_I	xor 	%r16, 0x0236, %r11
	.word 0x82440011  ! 124: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x9d340011  ! 124: SRL_R	srl 	%r16, %r17, %r14
	.word 0xacc42dcd  ! 124: ADDCcc_I	addccc 	%r16, 0x0dcd, %r22
	.word 0xc51c20d7  ! 125: LDDF_I	ldd	[%r16, 0x00d7], %f2
thr0_irf_ce_10:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_10), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xc2dc1011  ! 127: LDXA_R	ldxa	[%r16, %r17] 0x80, %r1
	.word 0x889c299c  ! 129: XORcc_I	xorcc 	%r16, 0x099c, %r4
	.word 0xb92c0011  ! 129: SLL_R	sll 	%r16, %r17, %r28
	.word 0xb7342001  ! 129: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0x997c0411  ! 129: MOVR_R	move	%r16, %r17, %r12
	.word 0x8b7c2401  ! 129: MOVR_I	move	%r16, 0xfffffe34, %r5
	.word 0x9ac42752  ! 129: ADDCcc_I	addccc 	%r16, 0x0752, %r13
	.word 0xcf040011  ! 130: LDF_R	ld	[%r16, %r17], %f7
	.word 0x81dc2e2f  ! 132: FLUSH_I	flush
	.word 0x9ebc2ce7  ! 134: XNORcc_I	xnorcc 	%r16, 0x0ce7, %r15
	.word 0x8a8420e8  ! 134: ADDcc_I	addcc 	%r16, 0x00e8, %r5
	.word 0x8a8422e1  ! 134: ADDcc_I	addcc 	%r16, 0x02e1, %r5
	.word 0x922c22d5  ! 134: ANDN_I	andn 	%r16, 0x02d5, %r9
	.word 0x98140011  ! 134: OR_R	or 	%r16, %r17, %r12
	.word 0x9e1c0011  ! 134: XOR_R	xor 	%r16, %r17, %r15
	.word 0x87341011  ! 134: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x960428d0  ! 134: ADD_I	add 	%r16, 0x08d0, %r11
thr0_dc_err_11:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_11), 16, 16),1,DC_DATA,58)
	.word 0xd6440000  ! 136: LDSW_R	ldsw	[%r16 + %r0], %r11
thr0_irf_ce_11:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_11), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xd71c0011  ! 138: LDDF_R	ldd	[%r16, %r17], %f11
	.word 0x90942ddd  ! 140: ORcc_I	orcc 	%r16, 0x0ddd, %r8
	.word 0x912c0011  ! 140: SLL_R	sll 	%r16, %r17, %r8
	.word 0x8abc2d05  ! 140: XNORcc_I	xnorcc 	%r16, 0x0d05, %r5
	.word 0x833c0011  ! 140: SRA_R	sra 	%r16, %r17, %r1
	.word 0x92042f69  ! 140: ADD_I	add 	%r16, 0x0f69, %r9
thr0_dc_err_12:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_12), 16, 16),1,DC_DATA,71)
	.word 0xd2540000  ! 142: LDSH_R	ldsh	[%r16 + %r0], %r9
thr0_irf_ce_12:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_12), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xf2542568  ! 144: LDSH_I	ldsh	[%r16 + 0x0568], %r25
	.word 0xae942564  ! 146: ORcc_I	orcc 	%r16, 0x0564, %r23
	.word 0x8b3c1011  ! 146: SRAX_R	srax	%r16, %r17, %r5
	.word 0x852c1011  ! 146: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x8e140011  ! 146: OR_R	or 	%r16, %r17, %r7
	.word 0x84bc2acd  ! 146: XNORcc_I	xnorcc 	%r16, 0x0acd, %r2
	.word 0xa60c2994  ! 146: AND_I	and 	%r16, 0x0994, %r19
thr0_dc_err_13:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_13), 16, 16),1,DC_DATA,56)
	.word 0xe71c0000  ! 148: LDDF_R	ldd	[%r16, %r0], %f19
thr0_resum_intr_1504:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1504), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x0, %asr26
	.word 0xacbc2586  ! 152: XNORcc_I	xnorcc 	%r16, 0x0586, %r22
	.word 0x8ebc0011  ! 152: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x8d643801  ! 152: MOVcc_I	<illegal instruction>
	.word 0xb5643801  ! 152: MOVcc_I	<illegal instruction>
	.word 0x828c0011  ! 152: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x82940011  ! 152: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0xd88c28a5  ! 153: LDUBA_I	lduba	[%r16, + 0x08a5] %asi, %r12
thr0_irf_ce_13:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_13), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xecdc2616  ! 155: LDXA_I	ldxa	[%r16, + 0x0616] %asi, %r22
	.word 0x932c3001  ! 157: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x87641811  ! 157: MOVcc_R	<illegal instruction>
	.word 0x88342bbd  ! 157: ORN_I	orn 	%r16, 0x0bbd, %r4
	.word 0x993c0011  ! 157: SRA_R	sra 	%r16, %r17, %r12
	.word 0xb0840011  ! 157: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0x9f341011  ! 157: SRLX_R	srlx	%r16, %r17, %r15
thr0_dc_err_14:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_14), 16, 16),1,DC_DATA,23)
	.word 0xdf1c0000  ! 159: LDDF_R	ldd	[%r16, %r0], %f15
thr0_irf_ce_14:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_14), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xf84c0011  ! 161: LDSB_R	ldsb	[%r16 + %r17], %r28
	.word 0x8a2c0011  ! 163: ANDN_R	andn 	%r16, %r17, %r5
	.word 0x8cc40011  ! 163: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x96840011  ! 163: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0x9d3c1011  ! 163: SRAX_R	srax	%r16, %r17, %r14
	.word 0xb83c2c18  ! 163: XNOR_I	xnor 	%r16, 0x0c18, %r28
	.word 0xa82c0011  ! 163: ANDN_R	andn 	%r16, %r17, %r20
	.word 0xc4dc1011  ! 164: LDXA_R	ldxa	[%r16, %r17] 0x80, %r2
	.word 0xc3ec1011  ! 166: PREFETCHA_R	prefetcha	[%r16, %r17] 0x80, #one_read
	.word 0x9d7c0411  ! 168: MOVR_R	move	%r16, %r17, %r14
	.word 0xae1c25c6  ! 168: XOR_I	xor 	%r16, 0x05c6, %r23
	.word 0x872c1011  ! 168: SLLX_R	sllx	%r16, %r17, %r3
	.word 0x841c0011  ! 168: XOR_R	xor 	%r16, %r17, %r2
	.word 0x9e442463  ! 168: ADDC_I	addc 	%r16, 0x0463, %r15
	.word 0xb8bc0011  ! 168: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0x84340011  ! 168: ORN_R	orn 	%r16, %r17, %r2
	.word 0xa6bc25bc  ! 168: XNORcc_I	xnorcc 	%r16, 0x05bc, %r19
	.word 0xf71427ea  ! 169: LDQF_I	-	[%r16, 0x07ea], %f27
	wr      %r0, 0x1, %asr26
	.word 0xaa040011  ! 173: ADD_R	add 	%r16, %r17, %r21
	.word 0x848c2e52  ! 173: ANDcc_I	andcc 	%r16, 0x0e52, %r2
	.word 0x89643801  ! 173: MOVcc_I	<illegal instruction>
	.word 0x89643801  ! 173: MOVcc_I	<illegal instruction>
	.word 0xa92c1011  ! 173: SLLX_R	sllx	%r16, %r17, %r20
thr0_dc_err_15:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_15), 16, 16),1,DC_DATA,32)
	.word 0xe8841000  ! 175: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r20
	.word 0x98dc0011  ! 177: SMULcc_R	smulcc 	%r16, %r17, %r12
	.word 0x8e1428b9  ! 179: OR_I	or 	%r16, 0x08b9, %r7
	.word 0xbb2c3001  ! 179: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xa93c2001  ! 179: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x848c0011  ! 179: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x8d7c2401  ! 179: MOVR_I	move	%r16, 0xfffffe34, %r6
	.word 0x8e3c0011  ! 179: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xb83421cc  ! 179: ORN_I	orn 	%r16, 0x01cc, %r28
	.word 0x8f343001  ! 179: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0xcf14282e  ! 180: LDQF_I	-	[%r16, 0x082e], %f7
	.word 0xdb040011  ! 182: LDF_R	ld	[%r16, %r17], %f13
	.word 0xb4040011  ! 184: ADD_R	add 	%r16, %r17, %r26
	.word 0x9d2c3001  ! 184: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0xb0042607  ! 184: ADD_I	add 	%r16, 0x0607, %r24
	.word 0x98842251  ! 184: ADDcc_I	addcc 	%r16, 0x0251, %r12
	.word 0xa7643801  ! 184: MOVcc_I	<illegal instruction>
	.word 0xb4c42a64  ! 184: ADDCcc_I	addccc 	%r16, 0x0a64, %r26
thr0_dc_err_16:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_16), 16, 16),1,DC_DATA,67)
	.word 0xf48c1000  ! 186: LDUBA_R	lduba	[%r16, %r0] 0x80, %r26
	.word 0x92dc0011  ! 188: SMULcc_R	smulcc 	%r16, %r17, %r9
	.word 0x88842d1b  ! 190: ADDcc_I	addcc 	%r16, 0x0d1b, %r4
	.word 0x94142dba  ! 190: OR_I	or 	%r16, 0x0dba, %r10
	.word 0x9c040011  ! 190: ADD_R	add 	%r16, %r17, %r14
	.word 0x9b340011  ! 190: SRL_R	srl 	%r16, %r17, %r13
	.word 0x963422fb  ! 190: ORN_I	orn 	%r16, 0x02fb, %r11
thr0_dc_err_17:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_17), 16, 16),1,DC_DATA,13)
	.word 0xd6841000  ! 192: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r11
thr0_irf_ce_15:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_15), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xca540011  ! 194: LDSH_R	ldsh	[%r16 + %r17], %r5
	.word 0x902c2b62  ! 196: ANDN_I	andn 	%r16, 0x0b62, %r8
	.word 0x86140011  ! 196: OR_R	or 	%r16, %r17, %r3
	.word 0x902c2acf  ! 196: ANDN_I	andn 	%r16, 0x0acf, %r8
	.word 0x98c42cf3  ! 196: ADDCcc_I	addccc 	%r16, 0x0cf3, %r12
	.word 0x9614237d  ! 196: OR_I	or 	%r16, 0x037d, %r11
	.word 0x96340011  ! 196: ORN_R	orn 	%r16, %r17, %r11
thr0_dc_err_18:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_18), 16, 16),1,DC_DATA,45)
	.word 0xd684237d  ! 198: LDUWA_I	lduwa	[%r16, + 0x037d] %asi, %r11
	.word 0xc20c0011  ! 200: LDUB_R	ldub	[%r16 + %r17], %r1
	.word 0x921c239f  ! 202: XOR_I	xor 	%r16, 0x039f, %r9
	.word 0x920c0011  ! 202: AND_R	and 	%r16, %r17, %r9
	.word 0x8c840011  ! 202: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xb3641811  ! 202: MOVcc_R	<illegal instruction>
	.word 0x98ac0011  ! 202: ANDNcc_R	andncc 	%r16, %r17, %r12
thr0_dc_err_19:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_19), 16, 16),1,DC_DATA,29)
	.word 0xd9941000  ! 204: LDQFA_R	-	[%r16, %r0], %f12
thr0_irf_ce_16:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_16), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xec2c21ea  ! 208: STB_I	stb	%r22, [%r16 + 0x01ea]
	.word 0x8cb4248f  ! 210: ORNcc_I	orncc 	%r16, 0x048f, %r6
	.word 0x9ab40011  ! 210: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0xac440011  ! 210: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x968c2eab  ! 210: ANDcc_I	andcc 	%r16, 0x0eab, %r11
	.word 0xa9342001  ! 210: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0x9f3c2001  ! 210: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x9a840011  ! 210: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0xb8840011  ! 210: ADDcc_R	addcc 	%r16, %r17, %r28
thr0_dc_err_20:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_20), 16, 16),1,DC_DATA,48)
	.word 0xf9941000  ! 212: LDQFA_R	-	[%r16, %r0], %f28
!Illinst store
	.word 0xde2c0011  ! 214: STB_R	stb	%r15, [%r16 + %r17]
	.word 0xb81c2eff  ! 216: XOR_I	xor 	%r16, 0x0eff, %r28
	.word 0xbaac0011  ! 216: ANDNcc_R	andncc 	%r16, %r17, %r29
	.word 0x90142429  ! 216: OR_I	or 	%r16, 0x0429, %r8
	.word 0xb32c2001  ! 216: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0x8c9c25e7  ! 216: XORcc_I	xorcc 	%r16, 0x05e7, %r6
	.word 0x8c440011  ! 216: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x868c20ec  ! 216: ANDcc_I	andcc 	%r16, 0x00ec, %r3
	.word 0xf8cc1011  ! 217: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r28
thr0_irf_ce_17:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_17), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xc8d41011  ! 219: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r4
	.word 0x86c40011  ! 221: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0xaf341011  ! 221: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xa6840011  ! 221: ADDcc_R	addcc 	%r16, %r17, %r19
	.word 0x912c0011  ! 221: SLL_R	sll 	%r16, %r17, %r8
	.word 0xb63c0011  ! 221: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0x993c0011  ! 221: SRA_R	sra 	%r16, %r17, %r12
	.word 0xda1c2c00  ! 222: LDD_I	ldd	[%r16 + 0x0c00], %r13
thr0_irf_ce_18:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_18), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xd49c1011  ! 224: LDDA_R	ldda	[%r16, %r17] 0x80, %r10
	.word 0xb6ac2949  ! 226: ANDNcc_I	andncc 	%r16, 0x0949, %r27
	.word 0xad2c0011  ! 226: SLL_R	sll 	%r16, %r17, %r22
	.word 0xae3c290a  ! 226: XNOR_I	xnor 	%r16, 0x090a, %r23
	.word 0x82840011  ! 226: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x8c0c2be7  ! 226: AND_I	and 	%r16, 0x0be7, %r6
	.word 0x8e940011  ! 226: ORcc_R	orcc 	%r16, %r17, %r7
thr0_dc_err_21:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_21), 16, 16),1,DC_DATA,0)
	.word 0xce1c2be7  ! 228: LDD_I	ldd	[%r16 + 0x0be7], %r7
thr0_irf_ce_19:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_19), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0x8143e03d  ! 230: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #MemIssue 
	.word 0x9f3c1011  ! 232: SRAX_R	srax	%r16, %r17, %r15
	.word 0x92b4288b  ! 232: ORNcc_I	orncc 	%r16, 0x088b, %r9
	.word 0x9e042a95  ! 232: ADD_I	add 	%r16, 0x0a95, %r15
	.word 0x8b2c1011  ! 232: SLLX_R	sllx	%r16, %r17, %r5
	.word 0xaa9c2370  ! 232: XORcc_I	xorcc 	%r16, 0x0370, %r21
	.word 0xb3343001  ! 232: SRLX_I	srlx	%r16, 0x0001, %r25
thr0_dc_err_22:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_22), 16, 16),1,DC_DATA,42)
	.word 0xf39c1000  ! 234: LDDFA_R	ldda	[%r16, %r0], %f25
thr0_irf_ce_20:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_20), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xf7040011  ! 236: LDF_R	ld	[%r16, %r17], %f27
	.word 0x8e1c0011  ! 238: XOR_R	xor 	%r16, %r17, %r7
	.word 0xa80c2723  ! 238: AND_I	and 	%r16, 0x0723, %r20
	.word 0x89342001  ! 238: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x84840011  ! 238: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x9c8c0011  ! 238: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0xb00c0011  ! 238: AND_R	and 	%r16, %r17, %r24
	.word 0x8c3c2217  ! 238: XNOR_I	xnor 	%r16, 0x0217, %r6
	.word 0xba040011  ! 238: ADD_R	add 	%r16, %r17, %r29
	.word 0xf0c427c2  ! 239: LDSWA_I	ldswa	[%r16, + 0x07c2] %asi, %r24
thr0_irf_ce_21:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_21), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	wr      %r0, 0x5, %asr26
	.word 0x8c2c0011  ! 243: ANDN_R	andn 	%r16, %r17, %r6
	.word 0xac1c0011  ! 243: XOR_R	xor 	%r16, %r17, %r22
	.word 0x88340011  ! 243: ORN_R	orn 	%r16, %r17, %r4
	.word 0x96840011  ! 243: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0x84040011  ! 243: ADD_R	add 	%r16, %r17, %r2
	.word 0xb8ac2c2a  ! 243: ANDNcc_I	andncc 	%r16, 0x0c2a, %r28
	.word 0x8f2c2001  ! 243: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x88b42cb8  ! 243: ORNcc_I	orncc 	%r16, 0x0cb8, %r4
thr0_dc_err_23:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_23), 16, 16),1,DC_DATA,31)
	.word 0xc80c2cb8  ! 245: LDUB_I	ldub	[%r16 + 0x0cb8], %r4
!Illinst alu
	.word 0x8c8c2e0f  ! 247: ANDcc_I	andcc 	%r16, 0x0e0f, %r6
	.word 0xaec421ff  ! 249: ADDCcc_I	addccc 	%r16, 0x01ff, %r23
	.word 0x8ac42ccc  ! 249: ADDCcc_I	addccc 	%r16, 0x0ccc, %r5
	.word 0x963c2787  ! 249: XNOR_I	xnor 	%r16, 0x0787, %r11
	.word 0xa83c2204  ! 249: XNOR_I	xnor 	%r16, 0x0204, %r20
	.word 0x9c142677  ! 249: OR_I	or 	%r16, 0x0677, %r14
	.word 0xd6dc1011  ! 250: LDXA_R	ldxa	[%r16, %r17] 0x80, %r11
!Illinst store
	.word 0xd0240011  ! 252: STW_R	stw	%r8, [%r16 + %r17]
	.word 0x8f2c2001  ! 254: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x98440011  ! 254: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x8e0c0011  ! 254: AND_R	and 	%r16, %r17, %r7
	.word 0xba34297b  ! 254: ORN_I	orn 	%r16, 0x097b, %r29
	.word 0xaa140011  ! 254: OR_R	or 	%r16, %r17, %r21
	.word 0xcf040011  ! 255: LDF_R	ld	[%r16, %r17], %f7
!Illinst store
	.word 0xc6340011  ! 257: STH_R	sth	%r3, [%r16 + %r17]
	.word 0x8e9c268f  ! 259: XORcc_I	xorcc 	%r16, 0x068f, %r7
	.word 0xb6940011  ! 259: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x8cac2436  ! 259: ANDNcc_I	andncc 	%r16, 0x0436, %r6
	.word 0x863c2de8  ! 259: XNOR_I	xnor 	%r16, 0x0de8, %r3
	.word 0x82c42605  ! 259: ADDCcc_I	addccc 	%r16, 0x0605, %r1
	.word 0x997c2401  ! 259: MOVR_I	move	%r16, 0xfffffe34, %r12
	.word 0xd4140011  ! 260: LDUH_R	lduh	[%r16 + %r17], %r10
	.word 0xc2c41011  ! 262: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r1
	.word 0xb08c0011  ! 264: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0x963c0011  ! 264: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x8c442733  ! 264: ADDC_I	addc 	%r16, 0x0733, %r6
	.word 0x973c2001  ! 264: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x90940011  ! 264: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0xb6c40011  ! 264: ADDCcc_R	addccc 	%r16, %r17, %r27
thr0_dc_err_24:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_24), 16, 16),1,DC_DATA,29)
	.word 0xf71c2733  ! 266: LDDF_I	ldd	[%r16, 0x0733], %f27
thr0_irf_ce_22:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_22), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xcf042b9d  ! 268: LDF_I	ld	[%r16, 0x0b9d], %f7
	.word 0x8a342249  ! 270: ORN_I	orn 	%r16, 0x0249, %r5
	.word 0x87343001  ! 270: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x9a2c0011  ! 270: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x8e1c2f41  ! 270: XOR_I	xor 	%r16, 0x0f41, %r7
	.word 0x8494207c  ! 270: ORcc_I	orcc 	%r16, 0x007c, %r2
	.word 0xac84239d  ! 270: ADDcc_I	addcc 	%r16, 0x039d, %r22
	.word 0x8f343001  ! 270: SRLX_I	srlx	%r16, 0x0001, %r7
thr0_dc_err_25:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_25), 16, 16),1,DC_DATA,15)
	.word 0xce1c0000  ! 272: LDD_R	ldd	[%r16 + %r0], %r7
thr0_irf_ce_23:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_23), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xf2540011  ! 274: LDSH_R	ldsh	[%r16 + %r17], %r25
	.word 0x8a8c22bc  ! 276: ANDcc_I	andcc 	%r16, 0x02bc, %r5
	.word 0xb4bc2295  ! 276: XNORcc_I	xnorcc 	%r16, 0x0295, %r26
	.word 0x9d2c3001  ! 276: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0xb2bc0011  ! 276: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0xb0340011  ! 276: ORN_R	orn 	%r16, %r17, %r24
	.word 0x84940011  ! 276: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x86c40011  ! 276: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0xa69c2e23  ! 276: XORcc_I	xorcc 	%r16, 0x0e23, %r19
thr0_dc_err_26:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_26), 16, 16),1,DC_DATA,63)
	.word 0xe71c0000  ! 278: LDDF_R	ldd	[%r16, %r0], %f19
thr0_irf_ce_24:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_24), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xd4841011  ! 280: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r10
	.word 0x8c94284a  ! 282: ORcc_I	orcc 	%r16, 0x084a, %r6
	.word 0xb43c29ea  ! 282: XNOR_I	xnor 	%r16, 0x09ea, %r26
	.word 0xa8340011  ! 282: ORN_R	orn 	%r16, %r17, %r20
	.word 0xacac0011  ! 282: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0xacbc0011  ! 282: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0x88040011  ! 282: ADD_R	add 	%r16, %r17, %r4
	.word 0x98442478  ! 282: ADDC_I	addc 	%r16, 0x0478, %r12
	.word 0xde5c0011  ! 283: LDX_R	ldx	[%r16 + %r17], %r15
	.word 0xde4c0011  ! 285: LDSB_R	ldsb	[%r16 + %r17], %r15
	.word 0x843c2855  ! 287: XNOR_I	xnor 	%r16, 0x0855, %r2
	.word 0x99342001  ! 287: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x92ac2aaa  ! 287: ANDNcc_I	andncc 	%r16, 0x0aaa, %r9
	.word 0x84340011  ! 287: ORN_R	orn 	%r16, %r17, %r2
	.word 0x85342001  ! 287: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x973c2001  ! 287: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x96440011  ! 287: ADDC_R	addc 	%r16, %r17, %r11
thr0_dc_err_27:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_27), 16, 16),1,DC_DATA,56)
	.word 0xd7841000  ! 289: LDFA_R	lda	[%r16, %r0], %f11
thr0_irf_ce_25:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_25), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xd88c1011  ! 291: LDUBA_R	lduba	[%r16, %r17] 0x80, %r12
	.word 0xb0c42119  ! 293: ADDCcc_I	addccc 	%r16, 0x0119, %r24
	.word 0x82840011  ! 293: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xb81c0011  ! 293: XOR_R	xor 	%r16, %r17, %r28
	.word 0x9d7c0411  ! 293: MOVR_R	move	%r16, %r17, %r14
	.word 0xb4940011  ! 293: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0xae8c2287  ! 293: ANDcc_I	andcc 	%r16, 0x0287, %r23
	.word 0x98ac2de9  ! 293: ANDNcc_I	andncc 	%r16, 0x0de9, %r12
	.word 0xb12c2001  ! 293: SLL_I	sll 	%r16, 0x0001, %r24
thr0_dc_err_28:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_28), 16, 16),1,DC_DATA,70)
	.word 0xf01c0000  ! 295: LDD_R	ldd	[%r16 + %r0], %r24
thr0_irf_ce_26:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_26), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
        wr  %g0, 0x80, %asi
	.word 0x9e142c6a  ! 299: OR_I	or 	%r16, 0x0c6a, %r15
	.word 0xaec40011  ! 299: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0x8f2c0011  ! 299: SLL_R	sll 	%r16, %r17, %r7
	.word 0x8a942806  ! 299: ORcc_I	orcc 	%r16, 0x0806, %r5
	.word 0x920c0011  ! 299: AND_R	and 	%r16, %r17, %r9
	.word 0x9ec42a57  ! 299: ADDCcc_I	addccc 	%r16, 0x0a57, %r15
	.word 0x98c40011  ! 299: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0xee842053  ! 300: LDUWA_I	lduwa	[%r16, + 0x0053] %asi, %r23
!Illinst alu
	.word 0x90ac0011  ! 302: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x9ab40011  ! 304: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x903c2d2f  ! 304: XNOR_I	xnor 	%r16, 0x0d2f, %r8
	.word 0xab2c2001  ! 304: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0x849c2468  ! 304: XORcc_I	xorcc 	%r16, 0x0468, %r2
	.word 0x87343001  ! 304: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x86c42f5c  ! 304: ADDCcc_I	addccc 	%r16, 0x0f5c, %r3
	.word 0xcedc2283  ! 305: LDXA_I	ldxa	[%r16, + 0x0283] %asi, %r7
	wr      %r0, 0x1, %asr26
	.word 0xa80c0011  ! 309: AND_R	and 	%r16, %r17, %r20
	.word 0x9d7c0411  ! 309: MOVR_R	move	%r16, %r17, %r14
	.word 0x862c0011  ! 309: ANDN_R	andn 	%r16, %r17, %r3
	.word 0xb4340011  ! 309: ORN_R	orn 	%r16, %r17, %r26
	.word 0x868c214a  ! 309: ANDcc_I	andcc 	%r16, 0x014a, %r3
	.word 0xba3421c2  ! 309: ORN_I	orn 	%r16, 0x01c2, %r29
	.word 0x8c842e52  ! 309: ADDcc_I	addcc 	%r16, 0x0e52, %r6
	.word 0x90140011  ! 309: OR_R	or 	%r16, %r17, %r8
	.word 0xc64c0011  ! 310: LDSB_R	ldsb	[%r16 + %r17], %r3
thr0_irf_ce_27:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_27), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xd3040011  ! 312: LDF_R	ld	[%r16, %r17], %f9
	.word 0xb284258e  ! 314: ADDcc_I	addcc 	%r16, 0x058e, %r25
	.word 0xaebc0011  ! 314: XNORcc_R	xnorcc 	%r16, %r17, %r23
	.word 0x972c3001  ! 314: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x82340011  ! 314: ORN_R	orn 	%r16, %r17, %r1
	.word 0x8a3c229e  ! 314: XNOR_I	xnor 	%r16, 0x029e, %r5
thr0_dc_err_29:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_29), 16, 16),1,DC_DATA,53)
	.word 0xcb140000  ! 316: LDQF_R	-	[%r16, %r0], %f5
	.word 0x81dc0011  ! 318: FLUSH_R	flush
	.word 0x8c0c0011  ! 320: AND_R	and 	%r16, %r17, %r6
	.word 0x832c3001  ! 320: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x82140011  ! 320: OR_R	or 	%r16, %r17, %r1
	.word 0x96142584  ! 320: OR_I	or 	%r16, 0x0584, %r11
	.word 0x88ac0011  ! 320: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0xbac42ba6  ! 320: ADDCcc_I	addccc 	%r16, 0x0ba6, %r29
	.word 0xf4dc1011  ! 321: LDXA_R	ldxa	[%r16, %r17] 0x80, %r26
	.word 0xdb040011  ! 323: LDF_R	ld	[%r16, %r17], %f13
	.word 0x8aac0011  ! 325: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x8b341011  ! 325: SRLX_R	srlx	%r16, %r17, %r5
	.word 0xa64429e8  ! 325: ADDC_I	addc 	%r16, 0x09e8, %r19
	.word 0x9c9c26d3  ! 325: XORcc_I	xorcc 	%r16, 0x06d3, %r14
	.word 0x900428b6  ! 325: ADD_I	add 	%r16, 0x08b6, %r8
	.word 0xb63c0011  ! 325: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0x9c940011  ! 325: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0xf31426f8  ! 326: LDQF_I	-	[%r16, 0x06f8], %f25
thr0_irf_ce_28:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_28), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xcd1c223d  ! 328: LDDF_I	ldd	[%r16, 0x023d], %f6
	.word 0x8a1420f3  ! 330: OR_I	or 	%r16, 0x00f3, %r5
	.word 0x84bc2c49  ! 330: XNORcc_I	xnorcc 	%r16, 0x0c49, %r2
	.word 0x8f7c0411  ! 330: MOVR_R	move	%r16, %r17, %r7
	.word 0x988c21b7  ! 330: ANDcc_I	andcc 	%r16, 0x01b7, %r12
	.word 0x9d641811  ! 330: MOVcc_R	<illegal instruction>
thr0_dc_err_30:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_30), 16, 16),1,DC_DATA,62)
	.word 0xdccc1000  ! 332: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r14
	.word 0x81880000  ! 334: SAVED	saved
	.word 0x96440011  ! 336: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x83641811  ! 336: MOVcc_R	<illegal instruction>
	.word 0xa68425bf  ! 336: ADDcc_I	addcc 	%r16, 0x05bf, %r19
	.word 0x8f342001  ! 336: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x929c0011  ! 336: XORcc_R	xorcc 	%r16, %r17, %r9
thr0_dc_err_31:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_31), 16, 16),1,DC_DATA,61)
	.word 0xd31c25bf  ! 338: LDDF_I	ldd	[%r16, 0x05bf], %f9
thr0_irf_ce_29:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_29), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xd42c2048  ! 342: STB_I	stb	%r10, [%r16 + 0x0048]
	.word 0x8e8c0011  ! 344: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0xba0c2805  ! 344: AND_I	and 	%r16, 0x0805, %r29
	.word 0x95641811  ! 344: MOVcc_R	<illegal instruction>
	.word 0x9e2c0011  ! 344: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x88ac0011  ! 344: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0xdc9c1011  ! 345: LDDA_R	ldda	[%r16, %r17] 0x80, %r14
	.word 0xdc2c26a3  ! 349: STB_I	stb	%r14, [%r16 + 0x06a3]
	.word 0x8cc426a7  ! 351: ADDCcc_I	addccc 	%r16, 0x06a7, %r6
	.word 0xacc4258b  ! 351: ADDCcc_I	addccc 	%r16, 0x058b, %r22
	.word 0x9a040011  ! 351: ADD_R	add 	%r16, %r17, %r13
	.word 0xa9343001  ! 351: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0xac840011  ! 351: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0x872c3001  ! 351: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0xc854205a  ! 352: LDSH_I	ldsh	[%r16 + 0x005a], %r4
thr0_irf_ce_30:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_30), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xd024238a  ! 356: STW_I	stw	%r8, [%r16 + 0x038a]
	.word 0x9f7c0411  ! 358: MOVR_R	move	%r16, %r17, %r15
	.word 0xa6b40011  ! 358: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0x982c0011  ! 358: ANDN_R	andn 	%r16, %r17, %r12
	.word 0xae342b78  ! 358: ORN_I	orn 	%r16, 0x0b78, %r23
	.word 0x93340011  ! 358: SRL_R	srl 	%r16, %r17, %r9
	.word 0xf41c2905  ! 359: LDD_I	ldd	[%r16 + 0x0905], %r26
thr0_irf_ce_31:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_31), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xca1c0011  ! 361: LDD_R	ldd	[%r16 + %r17], %r5
	.word 0xacc40011  ! 363: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0x9e3c2f07  ! 363: XNOR_I	xnor 	%r16, 0x0f07, %r15
	.word 0xb53c0011  ! 363: SRA_R	sra 	%r16, %r17, %r26
	.word 0xb0b40011  ! 363: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0x92142772  ! 363: OR_I	or 	%r16, 0x0772, %r9
	.word 0x952c1011  ! 363: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x9c9c0011  ! 363: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0xb6bc0011  ! 363: XNORcc_R	xnorcc 	%r16, %r17, %r27
thr0_dc_err_32:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_32), 16, 16),1,DC_DATA,36)
	.word 0xf64c0000  ! 365: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xf33c0011  ! 367: STDF_R	std	%f25, [%r17, %r16]
	.word 0x9c8c2073  ! 369: ANDcc_I	andcc 	%r16, 0x0073, %r14
	.word 0x983c0011  ! 369: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0x86c424b5  ! 369: ADDCcc_I	addccc 	%r16, 0x04b5, %r3
	.word 0xae340011  ! 369: ORN_R	orn 	%r16, %r17, %r23
	.word 0xb72c1011  ! 369: SLLX_R	sllx	%r16, %r17, %r27
	.word 0xcad42b1b  ! 370: LDSHA_I	ldsha	[%r16, + 0x0b1b] %asi, %r5
thr0_irf_ce_32:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_32), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
thr0_resum_intr_1505:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1505), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0xb0c423bc  ! 374: ADDCcc_I	addccc 	%r16, 0x03bc, %r24
	.word 0x942c2473  ! 374: ANDN_I	andn 	%r16, 0x0473, %r10
	.word 0xb2c426fd  ! 374: ADDCcc_I	addccc 	%r16, 0x06fd, %r25
	.word 0x8f2c0011  ! 374: SLL_R	sll 	%r16, %r17, %r7
	.word 0x897c2401  ! 374: MOVR_I	move	%r16, 0xfffffe34, %r4
	.word 0x903c2f24  ! 374: XNOR_I	xnor 	%r16, 0x0f24, %r8
	.word 0xb1342001  ! 374: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0x8694283c  ! 375: ORcc_I	orcc 	%r16, 0x083c, %r3
	.word 0x88140011  ! 375: OR_R	or 	%r16, %r17, %r4
	.word 0x94940011  ! 375: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x901c0011  ! 375: XOR_R	xor 	%r16, %r17, %r8
	.word 0x904420f6  ! 375: ADDC_I	addc 	%r16, 0x00f6, %r8
	.word 0x94940011  ! 375: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x908c221f  ! 375: ANDcc_I	andcc 	%r16, 0x021f, %r8
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xcf941011  ! 375: LDQFA_R	-	[%r16, %r17], %f7
	return     %r18 + 0x20
	.word 0xac2c2f84  ! 378: ANDN_I	andn 	%r16, 0x0f84, %r22
	.word 0xaeb40011  ! 378: ORNcc_R	orncc 	%r16, %r17, %r23
	.word 0x99641811  ! 378: MOVcc_R	<illegal instruction>
	.word 0x9c942f16  ! 378: ORcc_I	orcc 	%r16, 0x0f16, %r14
	.word 0xae9429e0  ! 378: ORcc_I	orcc 	%r16, 0x09e0, %r23
	.word 0x86342ede  ! 378: ORN_I	orn 	%r16, 0x0ede, %r3
	.word 0xc8dc26bd  ! 379: LDXA_I	ldxa	[%r16, + 0x06bd] %asi, %r4
thr0_irf_ce_33:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_33), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xf1042aa4  ! 381: LDF_I	ld	[%r16, 0x0aa4], %f24
	.word 0x86040011  ! 383: ADD_R	add 	%r16, %r17, %r3
	.word 0x92bc2ef9  ! 383: XNORcc_I	xnorcc 	%r16, 0x0ef9, %r9
	.word 0x8c2c23de  ! 383: ANDN_I	andn 	%r16, 0x03de, %r6
	.word 0x88c4238e  ! 383: ADDCcc_I	addccc 	%r16, 0x038e, %r4
	.word 0x8c1427df  ! 383: OR_I	or 	%r16, 0x07df, %r6
	.word 0x8d340011  ! 383: SRL_R	srl 	%r16, %r17, %r6
	.word 0xa92c1011  ! 383: SLLX_R	sllx	%r16, %r17, %r20
	.word 0xb69c0011  ! 383: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0xd7941011  ! 384: LDQFA_R	-	[%r16, %r17], %f11
thr0_irf_ce_34:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_34), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xd91c0011  ! 386: LDDF_R	ldd	[%r16, %r17], %f12
	.word 0x880c228c  ! 388: AND_I	and 	%r16, 0x028c, %r4
	.word 0xb9641811  ! 388: MOVcc_R	<illegal instruction>
	.word 0x8f7c0411  ! 388: MOVR_R	move	%r16, %r17, %r7
	.word 0xa8942d09  ! 388: ORcc_I	orcc 	%r16, 0x0d09, %r20
	.word 0x86342bd5  ! 388: ORN_I	orn 	%r16, 0x0bd5, %r3
	.word 0x82840011  ! 388: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x96040011  ! 388: ADD_R	add 	%r16, %r17, %r11
	.word 0x8a0c2cd7  ! 388: AND_I	and 	%r16, 0x0cd7, %r5
thr0_dc_err_33:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_33), 16, 16),1,DC_DATA,40)
	.word 0xcb1c0000  ! 390: LDDF_R	ldd	[%r16, %r0], %f5
thr0_irf_ce_35:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_35), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
thr0_resum_intr_1506:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1506), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0xa6c42aa2  ! 394: ADDCcc_I	addccc 	%r16, 0x0aa2, %r19
	.word 0xb8ac0011  ! 394: ANDNcc_R	andncc 	%r16, %r17, %r28
	.word 0x90840011  ! 394: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x9f641811  ! 394: MOVcc_R	<illegal instruction>
	.word 0x8d7c0411  ! 394: MOVR_R	move	%r16, %r17, %r6
	.word 0xf59c1011  ! 395: LDDFA_R	ldda	[%r16, %r17], %f26
thr0_irf_ce_36:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_36), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xc64c250e  ! 397: LDSB_I	ldsb	[%r16 + 0x050e], %r3
	.word 0xb4140011  ! 399: OR_R	or 	%r16, %r17, %r26
	.word 0x908c0011  ! 399: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0xa9641811  ! 399: MOVcc_R	<illegal instruction>
	.word 0x94ac0011  ! 399: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x94ac0011  ! 399: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x913c1011  ! 399: SRAX_R	srax	%r16, %r17, %r8
	.word 0xc5040011  ! 400: LDF_R	ld	[%r16, %r17], %f2
	.word 0xc36c2d4c  ! 402: PREFETCH_I	prefetch	[%r16 + 0x0d4c], #one_read
	.word 0xb0340011  ! 404: ORN_R	orn 	%r16, %r17, %r24
	.word 0x8e142238  ! 404: OR_I	or 	%r16, 0x0238, %r7
	.word 0x9b7c0411  ! 404: MOVR_R	move	%r16, %r17, %r13
	.word 0xaa942d9b  ! 404: ORcc_I	orcc 	%r16, 0x0d9b, %r21
	.word 0xb52c2001  ! 404: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0x88bc2841  ! 404: XNORcc_I	xnorcc 	%r16, 0x0841, %r4
	.word 0x8f7c2401  ! 404: MOVR_I	move	%r16, 0xfffffe34, %r7
thr0_dc_err_34:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_34), 16, 16),1,DC_DATA,67)
	.word 0xcecc2841  ! 406: LDSBA_I	ldsba	[%r16, + 0x0841] %asi, %r7
thr0_irf_ce_37:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_37), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xd51c0011  ! 408: LDDF_R	ldd	[%r16, %r17], %f10
	.word 0x8a3c0011  ! 410: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x873c2001  ! 410: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x988c27e6  ! 410: ANDcc_I	andcc 	%r16, 0x07e6, %r12
	.word 0x9cc42e1b  ! 410: ADDCcc_I	addccc 	%r16, 0x0e1b, %r14
	.word 0x90342ac7  ! 410: ORN_I	orn 	%r16, 0x0ac7, %r8
thr0_dc_err_35:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_35), 16, 16),1,DC_DATA,56)
	.word 0xd1142ac7  ! 412: LDQF_I	-	[%r16, 0x0ac7], %f8
thr0_irf_ce_38:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_38), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xcc0c0011  ! 414: LDUB_R	ldub	[%r16 + %r17], %r6
	.word 0x9b2c3001  ! 416: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0x920c0011  ! 416: AND_R	and 	%r16, %r17, %r9
	.word 0x88140011  ! 416: OR_R	or 	%r16, %r17, %r4
	.word 0x88b40011  ! 416: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0xacac0011  ! 416: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0xb894201c  ! 416: ORcc_I	orcc 	%r16, 0x001c, %r28
thr0_dc_err_36:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_36), 16, 16),1,DC_DATA,64)
	.word 0xf8cc1000  ! 418: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r28
	.word 0x9a7c25f8  ! 420: SDIV_I	sdiv 	%r16, 0x05f8, %r13
	.word 0x822c0011  ! 422: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x8a3c0011  ! 422: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xa69c0011  ! 422: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0xb0942e55  ! 422: ORcc_I	orcc 	%r16, 0x0e55, %r24
	.word 0x98942a31  ! 422: ORcc_I	orcc 	%r16, 0x0a31, %r12
	.word 0x92bc0011  ! 422: XNORcc_R	xnorcc 	%r16, %r17, %r9
thr0_dc_err_37:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_37), 16, 16),1,DC_DATA,32)
	.word 0xd2942a31  ! 424: LDUHA_I	lduha	[%r16, + 0x0a31] %asi, %r9
thr0_irf_ce_39:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_39), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xd834259c  ! 428: STH_I	sth	%r12, [%r16 + 0x059c]
	.word 0xac340011  ! 430: ORN_R	orn 	%r16, %r17, %r22
	.word 0x823c2f68  ! 430: XNOR_I	xnor 	%r16, 0x0f68, %r1
	.word 0x86bc2f15  ! 430: XNORcc_I	xnorcc 	%r16, 0x0f15, %r3
	.word 0x8c9c25dd  ! 430: XORcc_I	xorcc 	%r16, 0x05dd, %r6
	.word 0x9e940011  ! 430: ORcc_R	orcc 	%r16, %r17, %r15
thr0_dc_err_38:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_38), 16, 16),1,DC_DATA,44)
	.word 0xde8c25dd  ! 432: LDUBA_I	lduba	[%r16, + 0x05dd] %asi, %r15
	.word 0xc6c4212c  ! 434: LDSWA_I	ldswa	[%r16, + 0x012c] %asi, %r3
	.word 0x8ac40011  ! 436: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0xb8040011  ! 436: ADD_R	add 	%r16, %r17, %r28
	.word 0xab341011  ! 436: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x988c241f  ! 436: ANDcc_I	andcc 	%r16, 0x041f, %r12
	.word 0xb3340011  ! 436: SRL_R	srl 	%r16, %r17, %r25
	.word 0x99343001  ! 436: SRLX_I	srlx	%r16, 0x0001, %r12
	.word 0xef9c1011  ! 437: LDDFA_R	ldda	[%r16, %r17], %f23
	.word 0xe89c1011  ! 439: LDDA_R	ldda	[%r16, %r17] 0x80, %r20
	.word 0x948c2cb9  ! 441: ANDcc_I	andcc 	%r16, 0x0cb9, %r10
	.word 0x82140011  ! 441: OR_R	or 	%r16, %r17, %r1
	.word 0x863c25a3  ! 441: XNOR_I	xnor 	%r16, 0x05a3, %r3
	.word 0xb92c0011  ! 441: SLL_R	sll 	%r16, %r17, %r28
	.word 0xb62c23e3  ! 441: ANDN_I	andn 	%r16, 0x03e3, %r27
	.word 0x9ec4237b  ! 441: ADDCcc_I	addccc 	%r16, 0x037b, %r15
	.word 0x8b2c1011  ! 441: SLLX_R	sllx	%r16, %r17, %r5
	.word 0xba840011  ! 441: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0xc21c21ec  ! 442: LDD_I	ldd	[%r16 + 0x01ec], %r1
	.word 0x81580000  ! 444: FLUSHW	flushw
	.word 0xaf3c0011  ! 446: SRA_R	sra 	%r16, %r17, %r23
	.word 0x920c265c  ! 446: AND_I	and 	%r16, 0x065c, %r9
	.word 0x903c0011  ! 446: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0xad641811  ! 446: MOVcc_R	<illegal instruction>
	.word 0x9c9c0011  ! 446: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x9f641811  ! 446: MOVcc_R	<illegal instruction>
	.word 0xc31c2fe6  ! 447: LDDF_I	ldd	[%r16, 0x0fe6], %f1
thr0_irf_ce_40:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_40), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xd6242039  ! 451: STW_I	stw	%r11, [%r16 + 0x0039]
	.word 0x8e342cf2  ! 453: ORN_I	orn 	%r16, 0x0cf2, %r7
	.word 0xaa9c2b0d  ! 453: XORcc_I	xorcc 	%r16, 0x0b0d, %r21
	.word 0xae9427cd  ! 453: ORcc_I	orcc 	%r16, 0x07cd, %r23
	.word 0x8c3423d9  ! 453: ORN_I	orn 	%r16, 0x03d9, %r6
	.word 0xb80c0011  ! 453: AND_R	and 	%r16, %r17, %r28
	.word 0xd5941011  ! 454: LDQFA_R	-	[%r16, %r17], %f10
thr0_irf_ce_41:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_41), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xef9c1011  ! 456: LDDFA_R	ldda	[%r16, %r17], %f23
	.word 0xa69c2c87  ! 458: XORcc_I	xorcc 	%r16, 0x0c87, %r19
	.word 0x908c0011  ! 458: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x90442e57  ! 458: ADDC_I	addc 	%r16, 0x0e57, %r8
	.word 0xa6ac0011  ! 458: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0x832c3001  ! 458: SLLX_I	sllx	%r16, 0x0001, %r1
thr0_dc_err_39:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_39), 16, 16),1,DC_DATA,61)
	.word 0xc31c2e57  ! 460: LDDF_I	ldd	[%r16, 0x0e57], %f1
	.word 0xf8cc1011  ! 462: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r28
	.word 0x82042ff1  ! 464: ADD_I	add 	%r16, 0x0ff1, %r1
	.word 0x98ac2423  ! 464: ANDNcc_I	andncc 	%r16, 0x0423, %r12
	.word 0x98bc0011  ! 464: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x8a3c0011  ! 464: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xb12c2001  ! 464: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0x9a140011  ! 464: OR_R	or 	%r16, %r17, %r13
thr0_dc_err_40:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_40), 16, 16),1,DC_DATA,41)
	.word 0xda0c0000  ! 466: LDUB_R	ldub	[%r16 + %r0], %r13
thr0_irf_ce_42:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_42), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xe8042226  ! 468: LDUW_I	lduw	[%r16 + 0x0226], %r20
	.word 0xb02c29a0  ! 470: ANDN_I	andn 	%r16, 0x09a0, %r24
	.word 0x9c9c2db1  ! 470: XORcc_I	xorcc 	%r16, 0x0db1, %r14
	.word 0x92b40011  ! 470: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xac142bb0  ! 470: OR_I	or 	%r16, 0x0bb0, %r22
	.word 0x9d7c2401  ! 470: MOVR_I	move	%r16, 0xfffffe34, %r14
	.word 0x8ec42779  ! 470: ADDCcc_I	addccc 	%r16, 0x0779, %r7
thr0_dc_err_41:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_41), 16, 16),1,DC_DATA,14)
	.word 0xcf1c2779  ! 472: LDDF_I	ldd	[%r16, 0x0779], %f7
!Illinst alu
	.word 0xb2bc234b  ! 474: XNORcc_I	xnorcc 	%r16, 0x034b, %r25
	.word 0x8e142aae  ! 476: OR_I	or 	%r16, 0x0aae, %r7
	.word 0xaa440011  ! 476: ADDC_R	addc 	%r16, %r17, %r21
	.word 0x933c0011  ! 476: SRA_R	sra 	%r16, %r17, %r9
	.word 0xac2c204d  ! 476: ANDN_I	andn 	%r16, 0x004d, %r22
	.word 0x9a3c0011  ! 476: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x84840011  ! 476: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x9e340011  ! 476: ORN_R	orn 	%r16, %r17, %r15
	.word 0xf2941011  ! 477: LDUHA_R	lduha	[%r16, %r17] 0x80, %r25
thr0_irf_ce_43:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_43), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xcf142951  ! 479: LDQF_I	-	[%r16, 0x0951], %f7
	.word 0x9b341011  ! 481: SRLX_R	srlx	%r16, %r17, %r13
	.word 0x9a840011  ! 481: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0xb00c0011  ! 481: AND_R	and 	%r16, %r17, %r24
	.word 0xb8440011  ! 481: ADDC_R	addc 	%r16, %r17, %r28
	.word 0xb3643801  ! 481: MOVcc_I	<illegal instruction>
	.word 0x9e2c0011  ! 481: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x9e840011  ! 481: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xbabc0011  ! 481: XNORcc_R	xnorcc 	%r16, %r17, %r29
thr0_dc_err_42:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_42), 16, 16),1,DC_DATA,3)
	.word 0xfa142951  ! 483: LDUH_I	lduh	[%r16 + 0x0951], %r29
thr0_irf_ce_44:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_44), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xdf1c0011  ! 485: LDDF_R	ldd	[%r16, %r17], %f15
	.word 0x8eac0011  ! 487: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x822c0011  ! 487: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x993c2001  ! 487: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x952c3001  ! 487: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x82b42d68  ! 487: ORNcc_I	orncc 	%r16, 0x0d68, %r1
thr0_dc_err_43:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_43), 16, 16),1,DC_DATA,16)
	.word 0xc3042d68  ! 489: LDF_I	ld	[%r16, 0x0d68], %f1
thr0_irf_ce_45:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_45), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xcb841011  ! 491: LDFA_R	lda	[%r16, %r17], %f5
	.word 0xa8ac2064  ! 493: ANDNcc_I	andncc 	%r16, 0x0064, %r20
	.word 0x837c0411  ! 493: MOVR_R	move	%r16, %r17, %r1
	.word 0xac2c2662  ! 493: ANDN_I	andn 	%r16, 0x0662, %r22
	.word 0x90942007  ! 493: ORcc_I	orcc 	%r16, 0x0007, %r8
	.word 0x8f2c1011  ! 493: SLLX_R	sllx	%r16, %r17, %r7
	.word 0x832c1011  ! 493: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x9f643801  ! 493: MOVcc_I	<illegal instruction>
thr0_dc_err_44:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_44), 16, 16),1,DC_DATA,33)
	.word 0xde9c2007  ! 495: LDDA_I	ldda	[%r16, + 0x0007] %asi, %r15
	.word 0x90540011  ! 497: UMUL_R	umul 	%r16, %r17, %r8
	.word 0xb52c0011  ! 499: SLL_R	sll 	%r16, %r17, %r26
	.word 0x892c2001  ! 499: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0x992c1011  ! 499: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x87341011  ! 499: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x9f2c0011  ! 499: SLL_R	sll 	%r16, %r17, %r15
thr0_dc_err_45:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_45), 16, 16),1,DC_DATA,42)
	.word 0xdf142007  ! 501: LDQF_I	-	[%r16, 0x0007], %f15
thr0_irf_ce_46:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_46), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xdad41011  ! 503: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r13
	.word 0x96ac202e  ! 505: ANDNcc_I	andncc 	%r16, 0x002e, %r11
	.word 0xb6940011  ! 505: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x92b42055  ! 505: ORNcc_I	orncc 	%r16, 0x0055, %r9
	.word 0xbaac2f77  ! 505: ANDNcc_I	andncc 	%r16, 0x0f77, %r29
	.word 0xa8140011  ! 505: OR_R	or 	%r16, %r17, %r20
	.word 0xb0bc0011  ! 505: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0xa7340011  ! 505: SRL_R	srl 	%r16, %r17, %r19
	.word 0xee142c8f  ! 506: LDUH_I	lduh	[%r16 + 0x0c8f], %r23
	.word 0xdc440011  ! 508: LDSW_R	ldsw	[%r16 + %r17], %r14
	.word 0x90142318  ! 510: OR_I	or 	%r16, 0x0318, %r8
	.word 0x97643801  ! 510: MOVcc_I	<illegal instruction>
	.word 0xb6b40011  ! 510: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0x92440011  ! 510: ADDC_R	addc 	%r16, %r17, %r9
	.word 0xa61c0011  ! 510: XOR_R	xor 	%r16, %r17, %r19
	.word 0x9a340011  ! 510: ORN_R	orn 	%r16, %r17, %r13
	.word 0xb20425b7  ! 510: ADD_I	add 	%r16, 0x05b7, %r25
	.word 0xf00c0011  ! 511: LDUB_R	ldub	[%r16 + %r17], %r24
	.word 0xc8d41011  ! 513: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r4
	.word 0x881c2821  ! 515: XOR_I	xor 	%r16, 0x0821, %r4
	.word 0xaf343001  ! 515: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0xac8c0011  ! 515: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0x903c2674  ! 515: XNOR_I	xnor 	%r16, 0x0674, %r8
	.word 0x8c9c0011  ! 515: XORcc_R	xorcc 	%r16, %r17, %r6
	.word 0xad341011  ! 515: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x87643801  ! 515: MOVcc_I	<illegal instruction>
	.word 0xca5427ab  ! 516: LDSH_I	ldsh	[%r16 + 0x07ab], %r5
	.word 0xc7e41011  ! 518: CASA_I	casa	[%r16] 0x80, %r17, %r3
	.word 0x9b7c0411  ! 520: MOVR_R	move	%r16, %r17, %r13
	.word 0x83340011  ! 520: SRL_R	srl 	%r16, %r17, %r1
	.word 0x893c2001  ! 520: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0xb63c2cb3  ! 520: XNOR_I	xnor 	%r16, 0x0cb3, %r27
	.word 0xa8bc0011  ! 520: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0x9a142a88  ! 520: OR_I	or 	%r16, 0x0a88, %r13
	.word 0xa88c26ea  ! 520: ANDcc_I	andcc 	%r16, 0x06ea, %r20
thr0_dc_err_46:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_46), 16, 16),1,DC_DATA,55)
	.word 0xe8540000  ! 522: LDSH_R	ldsh	[%r16 + %r0], %r20
!Illinst store
	.word 0xd82c0011  ! 524: STB_R	stb	%r12, [%r16 + %r17]
	.word 0xb28421ce  ! 526: ADDcc_I	addcc 	%r16, 0x01ce, %r25
	.word 0x89340011  ! 526: SRL_R	srl 	%r16, %r17, %r4
	.word 0xaf343001  ! 526: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0xa8bc2356  ! 526: XNORcc_I	xnorcc 	%r16, 0x0356, %r20
	.word 0xb2142896  ! 526: OR_I	or 	%r16, 0x0896, %r25
	.word 0xb93c0011  ! 526: SRA_R	sra 	%r16, %r17, %r28
	.word 0x9f342001  ! 526: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x921c2c35  ! 526: XOR_I	xor 	%r16, 0x0c35, %r9
	.word 0xfa542421  ! 527: LDSH_I	ldsh	[%r16 + 0x0421], %r29
thr0_irf_ce_47:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_47), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xf31c2553  ! 529: LDDF_I	ldd	[%r16, 0x0553], %f25
	.word 0x993c0011  ! 531: SRA_R	sra 	%r16, %r17, %r12
	.word 0xa92c2001  ! 531: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0xb3341011  ! 531: SRLX_R	srlx	%r16, %r17, %r25
	.word 0xb0ac0011  ! 531: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0x9e1c0011  ! 531: XOR_R	xor 	%r16, %r17, %r15
	.word 0x8e042a10  ! 531: ADD_I	add 	%r16, 0x0a10, %r7
	.word 0xe85c0011  ! 532: LDX_R	ldx	[%r16 + %r17], %r20
!Illinst alu
	.word 0x8d340011  ! 534: SRL_R	srl 	%r16, %r17, %r6
	.word 0x9cbc2a49  ! 536: XNORcc_I	xnorcc 	%r16, 0x0a49, %r14
	.word 0xb6340011  ! 536: ORN_R	orn 	%r16, %r17, %r27
	.word 0x901c25dd  ! 536: XOR_I	xor 	%r16, 0x05dd, %r8
	.word 0x89641811  ! 536: MOVcc_R	<illegal instruction>
	.word 0x82b40011  ! 536: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0xc5042ff3  ! 537: LDF_I	ld	[%r16, 0x0ff3], %f2
	.word 0xce941011  ! 539: LDUHA_R	lduha	[%r16, %r17] 0x80, %r7
	.word 0xb2842dbf  ! 541: ADDcc_I	addcc 	%r16, 0x0dbf, %r25
	.word 0xab3c1011  ! 541: SRAX_R	srax	%r16, %r17, %r21
	.word 0xb1340011  ! 541: SRL_R	srl 	%r16, %r17, %r24
	.word 0x8cc40011  ! 541: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0xaa3c24a0  ! 541: XNOR_I	xnor 	%r16, 0x04a0, %r21
	.word 0x989c2ff5  ! 541: XORcc_I	xorcc 	%r16, 0x0ff5, %r12
thr0_dc_err_47:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_47), 16, 16),1,DC_DATA,40)
	.word 0xd8d41000  ! 543: LDSHA_R	ldsha	[%r16, %r0] 0x80, %r12
thr0_irf_ce_48:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_48), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xe8040011  ! 545: LDUW_R	lduw	[%r16 + %r17], %r20
	.word 0xb6040011  ! 547: ADD_R	add 	%r16, %r17, %r27
	.word 0x940c0011  ! 547: AND_R	and 	%r16, %r17, %r10
	.word 0x8b3c1011  ! 547: SRAX_R	srax	%r16, %r17, %r5
	.word 0x82940011  ! 547: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x932c3001  ! 547: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x828c0011  ! 547: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x924429e4  ! 547: ADDC_I	addc 	%r16, 0x09e4, %r9
	.word 0x9b643801  ! 548: MOVcc_I	<illegal instruction>
	.word 0x988c0011  ! 548: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x9c140011  ! 548: OR_R	or 	%r16, %r17, %r14
	.word 0xba1c264c  ! 548: XOR_I	xor 	%r16, 0x064c, %r29
	.word 0x8e1c0011  ! 548: XOR_R	xor 	%r16, %r17, %r7
	rd      %pc, %r18
	set     0x20, %r17
thr0_dc_err_48:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_48), 16, 16),1,DC_DATA,61)
	.word 0xcf9c1000  ! 549: LDDFA_R	ldda	[%r16, %r0], %f7
	return     %r18 + 0x20
	.word 0x862c0011  ! 552: ANDN_R	andn 	%r16, %r17, %r3
	.word 0xac34243b  ! 552: ORN_I	orn 	%r16, 0x043b, %r22
	.word 0x989c26cd  ! 552: XORcc_I	xorcc 	%r16, 0x06cd, %r12
	.word 0x957c2401  ! 552: MOVR_I	move	%r16, 0xfffffe34, %r10
	.word 0x86bc273f  ! 552: XNORcc_I	xnorcc 	%r16, 0x073f, %r3
	.word 0x928c0011  ! 552: ANDcc_R	andcc 	%r16, %r17, %r9
thr0_dc_err_49:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_49), 16, 16),1,DC_DATA,8)
	.word 0xd3140000  ! 554: LDQF_R	-	[%r16, %r0], %f9
	.word 0xf04c2c07  ! 556: LDSB_I	ldsb	[%r16 + 0x0c07], %r24
	.word 0x9a8c0011  ! 558: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x84040011  ! 558: ADD_R	add 	%r16, %r17, %r2
	.word 0x963c25ea  ! 558: XNOR_I	xnor 	%r16, 0x05ea, %r11
	.word 0xaf342001  ! 558: SRL_I	srl 	%r16, 0x0001, %r23
	.word 0x9f341011  ! 558: SRLX_R	srlx	%r16, %r17, %r15
	.word 0xaa3c29a2  ! 558: XNOR_I	xnor 	%r16, 0x09a2, %r21
	.word 0x98b40011  ! 558: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0xec4c20fb  ! 559: LDSB_I	ldsb	[%r16 + 0x00fb], %r22
	.word 0xdc8421dd  ! 561: LDUWA_I	lduwa	[%r16, + 0x01dd] %asi, %r14
	.word 0x852c0011  ! 563: SLL_R	sll 	%r16, %r17, %r2
	.word 0xa80c2d33  ! 563: AND_I	and 	%r16, 0x0d33, %r20
	.word 0x932c3001  ! 563: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0xa9643801  ! 563: MOVcc_I	<illegal instruction>
	.word 0xb82c0011  ! 563: ANDN_R	andn 	%r16, %r17, %r28
	.word 0x860c2305  ! 563: AND_I	and 	%r16, 0x0305, %r3
thr0_dc_err_50:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_50), 16, 16),1,DC_DATA,27)
	.word 0xc7941000  ! 565: LDQFA_R	-	[%r16, %r0], %f3
	.word 0xee1c0011  ! 567: LDD_R	ldd	[%r16 + %r17], %r23
	.word 0x95641811  ! 569: MOVcc_R	<illegal instruction>
	.word 0x983420dd  ! 569: ORN_I	orn 	%r16, 0x00dd, %r12
	.word 0xb6342d60  ! 569: ORN_I	orn 	%r16, 0x0d60, %r27
	.word 0xae2c2f48  ! 569: ANDN_I	andn 	%r16, 0x0f48, %r23
	.word 0xb53c0011  ! 569: SRA_R	sra 	%r16, %r17, %r26
	.word 0x8e1c0011  ! 569: XOR_R	xor 	%r16, %r17, %r7
	.word 0x82840011  ! 569: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xf1140011  ! 570: LDQF_R	-	[%r16, %r17], %f24
	.word 0xd60428eb  ! 572: LDUW_I	lduw	[%r16 + 0x08eb], %r11
	.word 0xa8840011  ! 574: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0x8a1c0011  ! 574: XOR_R	xor 	%r16, %r17, %r5
	.word 0x94ac0011  ! 574: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xac1c0011  ! 574: XOR_R	xor 	%r16, %r17, %r22
	.word 0x9e442662  ! 574: ADDC_I	addc 	%r16, 0x0662, %r15
	.word 0x861c2bbd  ! 574: XOR_I	xor 	%r16, 0x0bbd, %r3
	.word 0xaa0421af  ! 574: ADD_I	add 	%r16, 0x01af, %r21
	.word 0xd68c2c70  ! 575: LDUBA_I	lduba	[%r16, + 0x0c70] %asi, %r11
thr0_irf_ce_49:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_49), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xfa7c0011  ! 577: SWAP_R	swap	%r29, [%r16 + %r17]
	.word 0x9a942ceb  ! 579: ORcc_I	orcc 	%r16, 0x0ceb, %r13
	.word 0xb6c42efc  ! 579: ADDCcc_I	addccc 	%r16, 0x0efc, %r27
	.word 0x8f3c0011  ! 579: SRA_R	sra 	%r16, %r17, %r7
	.word 0x8c3c2aa1  ! 579: XNOR_I	xnor 	%r16, 0x0aa1, %r6
	.word 0x8c940011  ! 579: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0xcf1c2380  ! 580: LDDF_I	ldd	[%r16, 0x0380], %f7
	.word 0xcc4429f5  ! 582: LDSW_I	ldsw	[%r16 + 0x09f5], %r6
	.word 0x86c40011  ! 584: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0xb6b40011  ! 584: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0x932c2001  ! 584: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x88340011  ! 584: ORN_R	orn 	%r16, %r17, %r4
	.word 0x923c0011  ! 584: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x8cc40011  ! 584: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x9c9c0011  ! 584: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0xe9941011  ! 585: LDQFA_R	-	[%r16, %r17], %f20
thr0_irf_ce_50:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_50), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xc46c0011  ! 587: LDSTUB_R	ldstub	%r2, [%r16 + %r17]
	.word 0xaac40011  ! 589: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0xad343001  ! 589: SRLX_I	srlx	%r16, 0x0001, %r22
	.word 0x941c0011  ! 589: XOR_R	xor 	%r16, %r17, %r10
	.word 0x9c440011  ! 589: ADDC_R	addc 	%r16, %r17, %r14
	.word 0xb2840011  ! 589: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0x9a2c0011  ! 589: ANDN_R	andn 	%r16, %r17, %r13
	.word 0xf0540011  ! 590: LDSH_R	ldsh	[%r16 + %r17], %r24
	.word 0x81dc2274  ! 592: FLUSH_I	flush
	.word 0x8f3c0011  ! 594: SRA_R	sra 	%r16, %r17, %r7
	.word 0x8a3c0011  ! 594: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x96b40011  ! 594: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0xb77c0411  ! 594: MOVR_R	move	%r16, %r17, %r27
	.word 0x937c0411  ! 594: MOVR_R	move	%r16, %r17, %r9
	.word 0x88b40011  ! 594: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0x84140011  ! 594: OR_R	or 	%r16, %r17, %r2
	.word 0xeec423f8  ! 595: LDSWA_I	ldswa	[%r16, + 0x03f8] %asi, %r23
thr0_irf_ce_51:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_51), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xda042703  ! 597: LDUW_I	lduw	[%r16 + 0x0703], %r13
	.word 0x84ac29ba  ! 599: ANDNcc_I	andncc 	%r16, 0x09ba, %r2
	.word 0x82940011  ! 599: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x89343001  ! 599: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x94c423bf  ! 599: ADDCcc_I	addccc 	%r16, 0x03bf, %r10
	.word 0xad3c2001  ! 599: SRA_I	sra 	%r16, 0x0001, %r22
thr0_dc_err_51:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_51), 16, 16),1,DC_DATA,31)
	.word 0xec5c23bf  ! 601: LDX_I	ldx	[%r16 + 0x03bf], %r22
thr0_irf_ce_52:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_52), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xced4233f  ! 603: LDSHA_I	ldsha	[%r16, + 0x033f] %asi, %r7
	.word 0x97341011  ! 605: SRLX_R	srlx	%r16, %r17, %r11
	.word 0xa8c42453  ! 605: ADDCcc_I	addccc 	%r16, 0x0453, %r20
	.word 0x9b3c0011  ! 605: SRA_R	sra 	%r16, %r17, %r13
	.word 0x91343001  ! 605: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0xb29c2ac0  ! 605: XORcc_I	xorcc 	%r16, 0x0ac0, %r25
	.word 0x88042196  ! 605: ADD_I	add 	%r16, 0x0196, %r4
	.word 0xb57c2401  ! 605: MOVR_I	move	%r16, 0xfffffe34, %r26
	.word 0xb8c42733  ! 605: ADDCcc_I	addccc 	%r16, 0x0733, %r28
thr0_dc_err_52:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_52), 16, 16),1,DC_DATA,63)
	.word 0xf8542733  ! 607: LDSH_I	ldsh	[%r16 + 0x0733], %r28
thr0_irf_ce_53:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_53), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xc36c2668  ! 609: PREFETCH_I	prefetch	[%r16 + 0x0668], #one_read
	.word 0x8d343001  ! 611: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0x9c9c282e  ! 611: XORcc_I	xorcc 	%r16, 0x082e, %r14
	.word 0x8e2c0011  ! 611: ANDN_R	andn 	%r16, %r17, %r7
	.word 0x901c0011  ! 611: XOR_R	xor 	%r16, %r17, %r8
	.word 0xaeac2034  ! 611: ANDNcc_I	andncc 	%r16, 0x0034, %r23
	.word 0x8f2c0011  ! 611: SLL_R	sll 	%r16, %r17, %r7
	.word 0xd48c1011  ! 612: LDUBA_R	lduba	[%r16, %r17] 0x80, %r10
!Illinst alu
	.word 0x903c0011  ! 614: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0xb7343001  ! 616: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0xb8bc0011  ! 616: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0xb0ac0011  ! 616: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0x90340011  ! 616: ORN_R	orn 	%r16, %r17, %r8
	.word 0x8e8429d3  ! 616: ADDcc_I	addcc 	%r16, 0x09d3, %r7
	.word 0xa7641811  ! 616: MOVcc_R	<illegal instruction>
	.word 0xaabc2a5c  ! 616: XNORcc_I	xnorcc 	%r16, 0x0a5c, %r21
	.word 0xb28c0011  ! 616: ANDcc_R	andcc 	%r16, %r17, %r25
thr0_dc_err_53:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_53), 16, 16),1,DC_DATA,58)
	.word 0xf28c1000  ! 618: LDUBA_R	lduba	[%r16, %r0] 0x80, %r25
!Illinst alu
	.word 0x933c2001  ! 620: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0xaa3c25b6  ! 622: XNOR_I	xnor 	%r16, 0x05b6, %r21
	.word 0x94140011  ! 622: OR_R	or 	%r16, %r17, %r10
	.word 0xb6b40011  ! 622: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0xb4bc23aa  ! 622: XNORcc_I	xnorcc 	%r16, 0x03aa, %r26
	.word 0x82942b33  ! 622: ORcc_I	orcc 	%r16, 0x0b33, %r1
	.word 0x90842d95  ! 622: ADDcc_I	addcc 	%r16, 0x0d95, %r8
	.word 0xb17c0411  ! 622: MOVR_R	move	%r16, %r17, %r24
	.word 0xae0c0011  ! 622: AND_R	and 	%r16, %r17, %r23
	.word 0xc3941011  ! 623: LDQFA_R	-	[%r16, %r17], %f1
thr0_irf_ce_54:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_54), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
thr0_resum_intr_1507:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1507), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x0, %asr26
	.word 0x969c23c9  ! 627: XORcc_I	xorcc 	%r16, 0x03c9, %r11
	.word 0xba0c2d51  ! 627: AND_I	and 	%r16, 0x0d51, %r29
	.word 0x84840011  ! 627: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x888c0011  ! 627: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0xba940011  ! 627: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x8894207d  ! 627: ORcc_I	orcc 	%r16, 0x007d, %r4
thr0_dc_err_54:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_54), 16, 16),1,DC_DATA,3)
	.word 0xc85c0000  ! 629: LDX_R	ldx	[%r16 + %r0], %r4
	.word 0xca0c0011  ! 631: LDUB_R	ldub	[%r16 + %r17], %r5
	.word 0xac0420a5  ! 633: ADD_I	add 	%r16, 0x00a5, %r22
	.word 0x9e040011  ! 633: ADD_R	add 	%r16, %r17, %r15
	.word 0x8a8c2d95  ! 633: ANDcc_I	andcc 	%r16, 0x0d95, %r5
	.word 0x92ac0011  ! 633: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x86040011  ! 633: ADD_R	add 	%r16, %r17, %r3
	.word 0x961c262b  ! 633: XOR_I	xor 	%r16, 0x062b, %r11
	.word 0x84c424dd  ! 633: ADDCcc_I	addccc 	%r16, 0x04dd, %r2
	.word 0x8ec429e3  ! 633: ADDCcc_I	addccc 	%r16, 0x09e3, %r7
	.word 0xf61c2f2b  ! 634: LDD_I	ldd	[%r16 + 0x0f2b], %r27
thr0_irf_ce_55:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_55), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xca2c26d2  ! 638: STB_I	stb	%r5, [%r16 + 0x06d2]
	.word 0x849c0011  ! 640: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x941c0011  ! 640: XOR_R	xor 	%r16, %r17, %r10
	.word 0xb83c0011  ! 640: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xae2c0011  ! 640: ANDN_R	andn 	%r16, %r17, %r23
	.word 0x923c25d7  ! 640: XNOR_I	xnor 	%r16, 0x05d7, %r9
	.word 0x982c2024  ! 640: ANDN_I	andn 	%r16, 0x0024, %r12
	.word 0x9a340011  ! 640: ORN_R	orn 	%r16, %r17, %r13
	.word 0xf05c2cbb  ! 641: LDX_I	ldx	[%r16 + 0x0cbb], %r24
thr0_irf_ce_56:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_56), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xc4140011  ! 643: LDUH_R	lduh	[%r16 + %r17], %r2
	.word 0x8b342001  ! 645: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0xad641811  ! 645: MOVcc_R	<illegal instruction>
	.word 0x9b340011  ! 645: SRL_R	srl 	%r16, %r17, %r13
	.word 0x98bc0011  ! 645: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x943c28ee  ! 645: XNOR_I	xnor 	%r16, 0x08ee, %r10
thr0_dc_err_55:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_55), 16, 16),1,DC_DATA,52)
	.word 0xd4c41000  ! 647: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r10
thr0_irf_ce_57:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_57), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf4941011  ! 649: LDUHA_R	lduha	[%r16, %r17] 0x80, %r26
	.word 0x877c2401  ! 651: MOVR_I	move	%r16, 0xfffffe34, %r3
	.word 0x92942cce  ! 651: ORcc_I	orcc 	%r16, 0x0cce, %r9
	.word 0x98440011  ! 651: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x843c2259  ! 651: XNOR_I	xnor 	%r16, 0x0259, %r2
	.word 0x9b643801  ! 651: MOVcc_I	<illegal instruction>
	.word 0xb00c0011  ! 651: AND_R	and 	%r16, %r17, %r24
	.word 0x97643801  ! 651: MOVcc_I	<illegal instruction>
thr0_dc_err_56:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_56), 16, 16),1,DC_DATA,51)
	.word 0xd6442259  ! 653: LDSW_I	ldsw	[%r16 + 0x0259], %r11
thr0_irf_ce_58:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_58), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xd24c0011  ! 655: LDSB_R	ldsb	[%r16 + %r17], %r9
	.word 0xb03c23b2  ! 657: XNOR_I	xnor 	%r16, 0x03b2, %r24
	.word 0x90ac0011  ! 657: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0xa6140011  ! 657: OR_R	or 	%r16, %r17, %r19
	.word 0xa8942141  ! 657: ORcc_I	orcc 	%r16, 0x0141, %r20
	.word 0x9044219c  ! 657: ADDC_I	addc 	%r16, 0x019c, %r8
	.word 0xb13c2001  ! 657: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0x82b40011  ! 657: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0xdedc1011  ! 658: LDXA_R	ldxa	[%r16, %r17] 0x80, %r15
thr0_irf_ce_59:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_59), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xd05c2c33  ! 660: LDX_I	ldx	[%r16 + 0x0c33], %r8
	.word 0x844424d1  ! 662: ADDC_I	addc 	%r16, 0x04d1, %r2
	.word 0xaa940011  ! 662: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x9c2c0011  ! 662: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x8214202f  ! 662: OR_I	or 	%r16, 0x002f, %r1
	.word 0x862c0011  ! 662: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x99643801  ! 662: MOVcc_I	<illegal instruction>
	.word 0xb0c40011  ! 663: ADDCcc_R	addccc 	%r16, %r17, %r24
	.word 0x8f2c3001  ! 663: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x932c1011  ! 663: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x90c40011  ! 663: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x84442f83  ! 663: ADDC_I	addc 	%r16, 0x0f83, %r2
	rd      %pc, %r18
	set     0x20, %r17
thr0_dc_err_57:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_57), 16, 16),1,DC_DATA,21)
	.word 0xc5142f83  ! 664: LDQF_I	-	[%r16, 0x0f83], %f2
	return     %r18 + %r17
	.word 0x988c0011  ! 667: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0xb23c0011  ! 667: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0xad341011  ! 667: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x9c940011  ! 667: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0x85343001  ! 667: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0xe68c1011  ! 668: LDUBA_R	lduba	[%r16, %r17] 0x80, %r19
!Illinst store
	.word 0xf8240011  ! 670: STW_R	stw	%r28, [%r16 + %r17]
	.word 0x948c0011  ! 672: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x8b641811  ! 672: MOVcc_R	<illegal instruction>
	.word 0x8ebc0011  ! 672: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0xaf343001  ! 672: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0xaf641811  ! 672: MOVcc_R	<illegal instruction>
	.word 0xb0442576  ! 672: ADDC_I	addc 	%r16, 0x0576, %r24
	.word 0x90c40011  ! 672: ADDCcc_R	addccc 	%r16, %r17, %r8
thr0_dc_err_58:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_58), 16, 16),1,DC_DATA,64)
	.word 0xd0542576  ! 674: LDSH_I	ldsh	[%r16 + 0x0576], %r8
	.word 0xd26c0011  ! 676: LDSTUB_R	ldstub	%r9, [%r16 + %r17]
	.word 0x868c0011  ! 678: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xa97c2401  ! 678: MOVR_I	move	%r16, 0xfffffe34, %r20
	.word 0xa60c0011  ! 678: AND_R	and 	%r16, %r17, %r19
	.word 0x8eac0011  ! 678: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x969c0011  ! 678: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0x853c1011  ! 678: SRAX_R	srax	%r16, %r17, %r2
	.word 0xf0841011  ! 679: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r24
thr0_irf_ce_60:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_60), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xce242f2e  ! 683: STW_I	stw	%r7, [%r16 + 0x0f2e]
	.word 0xba042a1f  ! 685: ADD_I	add 	%r16, 0x0a1f, %r29
	.word 0x86140011  ! 685: OR_R	or 	%r16, %r17, %r3
	.word 0x8ab40011  ! 685: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0x9d2c1011  ! 685: SLLX_R	sllx	%r16, %r17, %r14
	.word 0xb2b42d66  ! 685: ORNcc_I	orncc 	%r16, 0x0d66, %r25
thr0_dc_err_59:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_59), 16, 16),1,DC_DATA,46)
	.word 0xf2442d66  ! 687: LDSW_I	ldsw	[%r16 + 0x0d66], %r25
	.word 0xc36c2554  ! 689: PREFETCH_I	prefetch	[%r16 + 0x0554], #one_read
	.word 0x97340011  ! 691: SRL_R	srl 	%r16, %r17, %r11
	.word 0x94ac29ea  ! 691: ANDNcc_I	andncc 	%r16, 0x09ea, %r10
	.word 0x8f341011  ! 691: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x86040011  ! 691: ADD_R	add 	%r16, %r17, %r3
	.word 0x9e440011  ! 691: ADDC_R	addc 	%r16, %r17, %r15
thr0_dc_err_60:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_60), 16, 16),1,DC_DATA,14)
	.word 0xdecc1000  ! 693: LDSBA_R	ldsba	[%r16, %r0] 0x80, %r15
thr0_irf_ce_61:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_61), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xdf140011  ! 695: LDQF_R	-	[%r16, %r17], %f15
	.word 0x86942658  ! 697: ORcc_I	orcc 	%r16, 0x0658, %r3
	.word 0x8ebc28d2  ! 697: XNORcc_I	xnorcc 	%r16, 0x08d2, %r7
	.word 0x9a3c0011  ! 697: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x9a142be8  ! 697: OR_I	or 	%r16, 0x0be8, %r13
	.word 0x98340011  ! 697: ORN_R	orn 	%r16, %r17, %r12
	.word 0x8d7c2401  ! 697: MOVR_I	move	%r16, 0xfffffe34, %r6
	.word 0x92ac2c1d  ! 697: ANDNcc_I	andncc 	%r16, 0x0c1d, %r9
	.word 0xdf941011  ! 698: LDQFA_R	-	[%r16, %r17], %f15
thr0_irf_ce_62:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_62), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xe6d41011  ! 700: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r19
	.word 0x837c2401  ! 702: MOVR_I	move	%r16, 0xfffffe34, %r1
	.word 0x8c4425ae  ! 702: ADDC_I	addc 	%r16, 0x05ae, %r6
	.word 0x8e3c204a  ! 702: XNOR_I	xnor 	%r16, 0x004a, %r7
	.word 0xac9c214a  ! 702: XORcc_I	xorcc 	%r16, 0x014a, %r22
	.word 0x84142d99  ! 702: OR_I	or 	%r16, 0x0d99, %r2
	.word 0x85343001  ! 702: SRLX_I	srlx	%r16, 0x0001, %r2
thr0_dc_err_61:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_61), 16, 16),1,DC_DATA,4)
	.word 0xc5941000  ! 704: LDQFA_R	-	[%r16, %r0], %f2
	.word 0xdc44232a  ! 706: LDSW_I	ldsw	[%r16 + 0x032a], %r14
	.word 0x85342001  ! 708: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0x86340011  ! 708: ORN_R	orn 	%r16, %r17, %r3
	.word 0x902c0011  ! 708: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x9a34297a  ! 708: ORN_I	orn 	%r16, 0x097a, %r13
	.word 0xb22c0011  ! 708: ANDN_R	andn 	%r16, %r17, %r25
	.word 0x97341011  ! 708: SRLX_R	srlx	%r16, %r17, %r11
	.word 0xee942abf  ! 709: LDUHA_I	lduha	[%r16, + 0x0abf] %asi, %r23
thr0_irf_ce_63:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_63), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xd1140011  ! 711: LDQF_R	-	[%r16, %r17], %f8
	.word 0x952c3001  ! 713: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0xb4440011  ! 713: ADDC_R	addc 	%r16, %r17, %r26
	.word 0x84c40011  ! 713: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xb0bc0011  ! 713: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0xb6b42eb0  ! 713: ORNcc_I	orncc 	%r16, 0x0eb0, %r27
	.word 0x832c0011  ! 713: SLL_R	sll 	%r16, %r17, %r1
	.word 0xb1342001  ! 713: SRL_I	srl 	%r16, 0x0001, %r24
thr0_dc_err_62:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_62), 16, 16),1,DC_DATA,38)
	.word 0xf0442eb0  ! 715: LDSW_I	ldsw	[%r16 + 0x0eb0], %r24
	.word 0x81880000  ! 717: SAVED	saved
	.word 0x922c0011  ! 719: ANDN_R	andn 	%r16, %r17, %r9
	.word 0x9abc0011  ! 719: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x837c2401  ! 719: MOVR_I	move	%r16, 0xfffffe34, %r1
	.word 0xab340011  ! 719: SRL_R	srl 	%r16, %r17, %r21
	.word 0xb13c2001  ! 719: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0xfb140011  ! 720: LDQF_R	-	[%r16, %r17], %f29
!Illinst alu
	.word 0x9b3c3001  ! 722: SRAX_I	srax	%r16, 0x0001, %r13
	.word 0x84bc2c3d  ! 724: XNORcc_I	xnorcc 	%r16, 0x0c3d, %r2
	.word 0xac140011  ! 724: OR_R	or 	%r16, %r17, %r22
	.word 0x89643801  ! 724: MOVcc_I	<illegal instruction>
	.word 0x84040011  ! 724: ADD_R	add 	%r16, %r17, %r2
	.word 0xb4140011  ! 724: OR_R	or 	%r16, %r17, %r26
thr0_dc_err_63:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_63), 16, 16),1,DC_DATA,25)
	.word 0xf5140000  ! 726: LDQF_R	-	[%r16, %r0], %f26
thr0_irf_ce_64:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_64), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xc6742894  ! 730: STX_I	stx	%r3, [%r16 + 0x0894]
	.word 0xb17c2401  ! 732: MOVR_I	move	%r16, 0xfffffe34, %r24
	.word 0xb4b42e4d  ! 732: ORNcc_I	orncc 	%r16, 0x0e4d, %r26
	.word 0x96142032  ! 732: OR_I	or 	%r16, 0x0032, %r11
	.word 0x8e342d55  ! 732: ORN_I	orn 	%r16, 0x0d55, %r7
	.word 0x9e0c2b8b  ! 732: AND_I	and 	%r16, 0x0b8b, %r15
	.word 0xf11c2d9b  ! 733: LDDF_I	ldd	[%r16, 0x0d9b], %f24
thr0_irf_ce_65:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_65), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xea7c0011  ! 735: SWAP_R	swap	%r21, [%r16 + %r17]
	.word 0x888c25a7  ! 737: ANDcc_I	andcc 	%r16, 0x05a7, %r4
	.word 0xb52c3001  ! 737: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xb60c29cd  ! 737: AND_I	and 	%r16, 0x09cd, %r27
	.word 0xb8ac0011  ! 737: ANDNcc_R	andncc 	%r16, %r17, %r28
	.word 0x9c140011  ! 737: OR_R	or 	%r16, %r17, %r14
	.word 0xf9140011  ! 738: LDQF_R	-	[%r16, %r17], %f28
	.word 0xd0cc2ee4  ! 740: LDSBA_I	ldsba	[%r16, + 0x0ee4] %asi, %r8
	.word 0x8e1c2fca  ! 742: XOR_I	xor 	%r16, 0x0fca, %r7
	.word 0x9c1c2594  ! 742: XOR_I	xor 	%r16, 0x0594, %r14
	.word 0x917c0411  ! 742: MOVR_R	move	%r16, %r17, %r8
	.word 0x99342001  ! 742: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0xa6142d96  ! 742: OR_I	or 	%r16, 0x0d96, %r19
	.word 0x8a8c2733  ! 742: ANDcc_I	andcc 	%r16, 0x0733, %r5
	.word 0x8a940011  ! 742: ORcc_R	orcc 	%r16, %r17, %r5
thr0_dc_err_64:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_64), 16, 16),1,DC_DATA,11)
	.word 0xca9c1000  ! 744: LDDA_R	ldda	[%r16, %r0] 0x80, %r5
thr0_irf_ce_66:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_66), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xd40c0011  ! 746: LDUB_R	ldub	[%r16 + %r17], %r10
	.word 0x917c0411  ! 748: MOVR_R	move	%r16, %r17, %r8
	.word 0xb09c259c  ! 748: XORcc_I	xorcc 	%r16, 0x059c, %r24
	.word 0xaebc0011  ! 748: XNORcc_R	xnorcc 	%r16, %r17, %r23
	.word 0x92b422e0  ! 748: ORNcc_I	orncc 	%r16, 0x02e0, %r9
	.word 0x82b40011  ! 748: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0xc5941011  ! 749: LDQFA_R	-	[%r16, %r17], %f2
thr0_irf_ce_67:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_67), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xf60c0011  ! 751: LDUB_R	ldub	[%r16 + %r17], %r27
	.word 0xb21c0011  ! 753: XOR_R	xor 	%r16, %r17, %r25
	.word 0xb23c25ce  ! 753: XNOR_I	xnor 	%r16, 0x05ce, %r25
	.word 0x9634207f  ! 753: ORN_I	orn 	%r16, 0x007f, %r11
	.word 0x8834254d  ! 753: ORN_I	orn 	%r16, 0x054d, %r4
	.word 0x9d2c0011  ! 753: SLL_R	sll 	%r16, %r17, %r14
	.word 0x9e342f56  ! 753: ORN_I	orn 	%r16, 0x0f56, %r15
	.word 0x962c20a0  ! 753: ANDN_I	andn 	%r16, 0x00a0, %r11
thr0_dc_err_65:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_65), 16, 16),1,DC_DATA,46)
	.word 0xd6cc20a0  ! 755: LDSBA_I	ldsba	[%r16, + 0x00a0] %asi, %r11
thr0_irf_ce_68:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_68), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xf504216c  ! 757: LDF_I	ld	[%r16, 0x016c], %f26
	.word 0xb13c1011  ! 759: SRAX_R	srax	%r16, %r17, %r24
	.word 0x840c2ee0  ! 759: AND_I	and 	%r16, 0x0ee0, %r2
	.word 0x880423f9  ! 759: ADD_I	add 	%r16, 0x03f9, %r4
	.word 0xae840011  ! 759: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x9ebc2e9a  ! 759: XNORcc_I	xnorcc 	%r16, 0x0e9a, %r15
thr0_dc_err_66:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_66), 16, 16),1,DC_DATA,25)
	.word 0xdf142e9a  ! 761: LDQF_I	-	[%r16, 0x0e9a], %f15
	.word 0xd8cc1011  ! 763: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r12
	.word 0x863c29df  ! 765: XNOR_I	xnor 	%r16, 0x09df, %r3
	.word 0x95641811  ! 765: MOVcc_R	<illegal instruction>
	.word 0xaac40011  ! 765: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0x9d3c1011  ! 765: SRAX_R	srax	%r16, %r17, %r14
	.word 0xb3643801  ! 765: MOVcc_I	<illegal instruction>
	.word 0xae3c0011  ! 765: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0xb0042a53  ! 765: ADD_I	add 	%r16, 0x0a53, %r24
	.word 0x9c3c0011  ! 765: XNOR_R	xnor 	%r16, %r17, %r14
thr0_dc_err_67:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_67), 16, 16),1,DC_DATA,41)
	.word 0xdc042a53  ! 767: LDUW_I	lduw	[%r16 + 0x0a53], %r14
thr0_irf_ce_69:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_69), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0x8143e030  ! 769: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xb52c3001  ! 771: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xb6bc224d  ! 771: XNORcc_I	xnorcc 	%r16, 0x024d, %r27
	.word 0xa82c0011  ! 771: ANDN_R	andn 	%r16, %r17, %r20
	.word 0x992c2001  ! 771: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x8a940011  ! 771: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x8e9c0011  ! 771: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0xfadc2610  ! 772: LDXA_I	ldxa	[%r16, + 0x0610] %asi, %r29
thr0_irf_ce_70:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_70), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xea0c288c  ! 774: LDUB_I	ldub	[%r16 + 0x088c], %r21
	.word 0x90b40011  ! 776: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x9d7c2401  ! 776: MOVR_I	move	%r16, 0xfffffe34, %r14
	.word 0x90440011  ! 776: ADDC_R	addc 	%r16, %r17, %r8
	.word 0x8f341011  ! 776: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x981c249e  ! 776: XOR_I	xor 	%r16, 0x049e, %r12
	.word 0x8c140011  ! 776: OR_R	or 	%r16, %r17, %r6
	.word 0x92940011  ! 776: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x902c2c5c  ! 776: ANDN_I	andn 	%r16, 0x0c5c, %r8
thr0_dc_err_68:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_68), 16, 16),1,DC_DATA,66)
	.word 0xd19c1000  ! 778: LDDFA_R	ldda	[%r16, %r0], %f8
thr0_irf_ce_71:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_71), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xfa0425e8  ! 780: LDUW_I	lduw	[%r16 + 0x05e8], %r29
	.word 0xb6342e55  ! 782: ORN_I	orn 	%r16, 0x0e55, %r27
	.word 0x90342249  ! 782: ORN_I	orn 	%r16, 0x0249, %r8
	.word 0x9e1c0011  ! 782: XOR_R	xor 	%r16, %r17, %r15
	.word 0x973c0011  ! 782: SRA_R	sra 	%r16, %r17, %r11
	.word 0x9c2c2284  ! 782: ANDN_I	andn 	%r16, 0x0284, %r14
	.word 0x853c2001  ! 782: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0xb6c40011  ! 782: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x88840011  ! 782: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0xe99c1011  ! 783: LDDFA_R	ldda	[%r16, %r17], %f20
	.word 0xc9941011  ! 785: LDQFA_R	-	[%r16, %r17], %f4
	.word 0x8a8c2a19  ! 787: ANDcc_I	andcc 	%r16, 0x0a19, %r5
	.word 0xb57c0411  ! 787: MOVR_R	move	%r16, %r17, %r26
	.word 0x8a942a4e  ! 787: ORcc_I	orcc 	%r16, 0x0a4e, %r5
	.word 0x85340011  ! 787: SRL_R	srl 	%r16, %r17, %r2
	.word 0xa6c40011  ! 787: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0xa69c2ac8  ! 787: XORcc_I	xorcc 	%r16, 0x0ac8, %r19
	.word 0x841c0011  ! 787: XOR_R	xor 	%r16, %r17, %r2
	.word 0xb8042954  ! 787: ADD_I	add 	%r16, 0x0954, %r28
	.word 0xaac40011  ! 788: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0xad342001  ! 788: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0xad2c1011  ! 788: SLLX_R	sllx	%r16, %r17, %r22
	.word 0x8c1c0011  ! 788: XOR_R	xor 	%r16, %r17, %r6
	.word 0xac840011  ! 788: ADDcc_R	addcc 	%r16, %r17, %r22
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xeecc2b55  ! 788: LDSBA_I	ldsba	[%r16, + 0x0b55] %asi, %r23
thr0_irf_ce_72:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_72), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	jmpl     %r18 + %r17, %r31
	.word 0x96040011  ! 791: ADD_R	add 	%r16, %r17, %r11
	.word 0xb6940011  ! 791: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0xb7643801  ! 791: MOVcc_I	<illegal instruction>
	.word 0x9e440011  ! 791: ADDC_R	addc 	%r16, %r17, %r15
	.word 0xb6440011  ! 791: ADDC_R	addc 	%r16, %r17, %r27
	.word 0x8e8c20c0  ! 791: ANDcc_I	andcc 	%r16, 0x00c0, %r7
	.word 0x8e1c23fe  ! 791: XOR_I	xor 	%r16, 0x03fe, %r7
	.word 0x88442d99  ! 791: ADDC_I	addc 	%r16, 0x0d99, %r4
	.word 0xf314240f  ! 792: LDQF_I	-	[%r16, 0x040f], %f25
	.word 0xed140011  ! 794: LDQF_R	-	[%r16, %r17], %f22
	.word 0xb77c2401  ! 796: MOVR_I	move	%r16, 0xfffffe34, %r27
	.word 0x943c0011  ! 796: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x8b2c0011  ! 796: SLL_R	sll 	%r16, %r17, %r5
	.word 0x9a940011  ! 796: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x84942faa  ! 796: ORcc_I	orcc 	%r16, 0x0faa, %r2
	.word 0x842c0011  ! 796: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x988c2f9a  ! 796: ANDcc_I	andcc 	%r16, 0x0f9a, %r12
	.word 0x9b2c1011  ! 796: SLLX_R	sllx	%r16, %r17, %r13
thr0_dc_err_69:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_69), 16, 16),1,DC_DATA,2)
	.word 0xdb140000  ! 798: LDQF_R	-	[%r16, %r0], %f13
	.word 0xdf941011  ! 800: LDQFA_R	-	[%r16, %r17], %f15
	.word 0x983c2607  ! 802: XNOR_I	xnor 	%r16, 0x0607, %r12
	.word 0x9e8423cd  ! 802: ADDcc_I	addcc 	%r16, 0x03cd, %r15
	.word 0x93343001  ! 802: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x932c3001  ! 802: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x9a140011  ! 802: OR_R	or 	%r16, %r17, %r13
	.word 0x892c3001  ! 802: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0x9b641811  ! 802: MOVcc_R	<illegal instruction>
	.word 0x97340011  ! 802: SRL_R	srl 	%r16, %r17, %r11
thr0_dc_err_70:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_70), 16, 16),1,DC_DATA,49)
	.word 0xd68c23cd  ! 804: LDUBA_I	lduba	[%r16, + 0x03cd] %asi, %r11
thr0_irf_ce_73:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_73), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xcd1c23ea  ! 806: LDDF_I	ldd	[%r16, 0x03ea], %f6
	.word 0xb6ac0011  ! 808: ANDNcc_R	andncc 	%r16, %r17, %r27
	.word 0x86ac2730  ! 808: ANDNcc_I	andncc 	%r16, 0x0730, %r3
	.word 0xaf341011  ! 808: SRLX_R	srlx	%r16, %r17, %r23
	.word 0x833c0011  ! 808: SRA_R	sra 	%r16, %r17, %r1
	.word 0x92942a45  ! 808: ORcc_I	orcc 	%r16, 0x0a45, %r9
	.word 0xb73c0011  ! 808: SRA_R	sra 	%r16, %r17, %r27
	.word 0x96940011  ! 808: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0x8d3c1011  ! 808: SRAX_R	srax	%r16, %r17, %r6
thr0_dc_err_71:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_71), 16, 16),1,DC_DATA,15)
	.word 0xcd841000  ! 810: LDFA_R	lda	[%r16, %r0], %f6
thr0_irf_ce_74:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_74), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xcad41011  ! 812: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r5
	.word 0x843420fa  ! 814: ORN_I	orn 	%r16, 0x00fa, %r2
	.word 0x928c28d2  ! 814: ANDcc_I	andcc 	%r16, 0x08d2, %r9
	.word 0x889c2f06  ! 814: XORcc_I	xorcc 	%r16, 0x0f06, %r4
	.word 0x9e3c25c2  ! 814: XNOR_I	xnor 	%r16, 0x05c2, %r15
	.word 0xb33c2001  ! 814: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0x8f643801  ! 814: MOVcc_I	<illegal instruction>
	.word 0xaab40011  ! 814: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0xd88c1011  ! 815: LDUBA_R	lduba	[%r16, %r17] 0x80, %r12
thr0_irf_ce_75:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_75), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xd64c2103  ! 817: LDSB_I	ldsb	[%r16 + 0x0103], %r11
	.word 0x9d643801  ! 819: MOVcc_I	<illegal instruction>
	.word 0x8c1c0011  ! 819: XOR_R	xor 	%r16, %r17, %r6
	.word 0x82840011  ! 819: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x94340011  ! 819: ORN_R	orn 	%r16, %r17, %r10
	.word 0x888c2315  ! 819: ANDcc_I	andcc 	%r16, 0x0315, %r4
	.word 0x923c2e5f  ! 820: XNOR_I	xnor 	%r16, 0x0e5f, %r9
	.word 0xaa440011  ! 820: ADDC_R	addc 	%r16, %r17, %r21
	.word 0x82440011  ! 820: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x83342001  ! 820: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x897c0411  ! 820: MOVR_R	move	%r16, %r17, %r4
	.word 0xad343001  ! 820: SRLX_I	srlx	%r16, 0x0001, %r22
	rd      %pc, %r18
	set     0x20, %r17
thr0_dc_err_72:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_72), 16, 16),1,DC_DATA,36)
	.word 0xec941000  ! 821: LDUHA_R	lduha	[%r16, %r0] 0x80, %r22
thr0_irf_ce_76:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_76), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	return     %r18 + %r17
	.word 0xa6ac2a7d  ! 824: ANDNcc_I	andncc 	%r16, 0x0a7d, %r19
	.word 0x8c1c21a3  ! 824: XOR_I	xor 	%r16, 0x01a3, %r6
	.word 0x98042596  ! 824: ADD_I	add 	%r16, 0x0596, %r12
	.word 0x96340011  ! 824: ORN_R	orn 	%r16, %r17, %r11
	.word 0x86842925  ! 824: ADDcc_I	addcc 	%r16, 0x0925, %r3
	.word 0x982c2ea8  ! 824: ANDN_I	andn 	%r16, 0x0ea8, %r12
	.word 0x9e340011  ! 824: ORN_R	orn 	%r16, %r17, %r15
thr0_dc_err_73:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_73), 16, 16),1,DC_DATA,47)
	.word 0xde442ea8  ! 826: LDSW_I	ldsw	[%r16 + 0x0ea8], %r15
thr0_irf_ce_77:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_77), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xf22c2135  ! 830: STB_I	stb	%r25, [%r16 + 0x0135]
	.word 0x8abc0011  ! 832: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0x85643801  ! 832: MOVcc_I	<illegal instruction>
	.word 0x9b3c0011  ! 832: SRA_R	sra 	%r16, %r17, %r13
	.word 0x90c40011  ! 832: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x957c2401  ! 832: MOVR_I	move	%r16, 0xfffffe34, %r10
thr0_dc_err_74:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_74), 16, 16),1,DC_DATA,57)
	.word 0xd41c2135  ! 834: LDD_I	ldd	[%r16 + 0x0135], %r10
thr0_irf_ce_78:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_78), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xdc5c0011  ! 836: LDX_R	ldx	[%r16 + %r17], %r14
	.word 0x8e3c0011  ! 838: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x9e8423fd  ! 838: ADDcc_I	addcc 	%r16, 0x03fd, %r15
	.word 0x9ebc0011  ! 838: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0x843c2e87  ! 838: XNOR_I	xnor 	%r16, 0x0e87, %r2
	.word 0xa7643801  ! 838: MOVcc_I	<illegal instruction>
	.word 0x948426bd  ! 838: ADDcc_I	addcc 	%r16, 0x06bd, %r10
	.word 0xb5643801  ! 838: MOVcc_I	<illegal instruction>
	.word 0x82842f8b  ! 838: ADDcc_I	addcc 	%r16, 0x0f8b, %r1
thr0_dc_err_75:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_75), 16, 16),1,DC_DATA,60)
	.word 0xc29c1000  ! 840: LDDA_R	ldda	[%r16, %r0] 0x80, %r1
	.word 0xf8ec1011  ! 842: LDSTUBA_R	ldstuba	%r28, [%r16 + %r17] 0x80
	.word 0xb8c40011  ! 844: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0x9e942772  ! 844: ORcc_I	orcc 	%r16, 0x0772, %r15
	.word 0x9f343001  ! 844: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0x993c0011  ! 844: SRA_R	sra 	%r16, %r17, %r12
	.word 0x88ac0011  ! 844: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0xb68c0011  ! 844: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0xba440011  ! 844: ADDC_R	addc 	%r16, %r17, %r29
	.word 0x8c1c0011  ! 845: XOR_R	xor 	%r16, %r17, %r6
	.word 0xbaac2904  ! 845: ANDNcc_I	andncc 	%r16, 0x0904, %r29
	.word 0x8d2c2001  ! 845: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0x92042680  ! 845: ADD_I	add 	%r16, 0x0680, %r9
	.word 0x8abc2dda  ! 845: XNORcc_I	xnorcc 	%r16, 0x0dda, %r5
	.word 0x91341011  ! 845: SRLX_R	srlx	%r16, %r17, %r8
	.word 0x84ac2b03  ! 845: ANDNcc_I	andncc 	%r16, 0x0b03, %r2
	rd      %pc, %r18
	set     0x20, %r17
thr0_dc_err_76:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_76), 16, 16),1,DC_DATA,41)
	.word 0xc4040000  ! 846: LDUW_R	lduw	[%r16 + %r0], %r2
	return     %r18 + 0x20
	.word 0x8b340011  ! 849: SRL_R	srl 	%r16, %r17, %r5
	.word 0xbb342001  ! 849: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0x9c8c21b3  ! 849: ANDcc_I	andcc 	%r16, 0x01b3, %r14
	.word 0x84440011  ! 849: ADDC_R	addc 	%r16, %r17, %r2
	.word 0xba140011  ! 849: OR_R	or 	%r16, %r17, %r29
	.word 0x9b3c0011  ! 849: SRA_R	sra 	%r16, %r17, %r13
	.word 0xb68c0011  ! 849: ANDcc_R	andcc 	%r16, %r17, %r27
thr0_dc_err_77:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_77), 16, 16),1,DC_DATA,61)
	.word 0xf65421b3  ! 851: LDSH_I	ldsh	[%r16 + 0x01b3], %r27
	.word 0xd85c0011  ! 853: LDX_R	ldx	[%r16 + %r17], %r12
	.word 0xb0940011  ! 855: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0xb2842886  ! 855: ADDcc_I	addcc 	%r16, 0x0886, %r25
	.word 0xbb2c3001  ! 855: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xa83c2ba3  ! 855: XNOR_I	xnor 	%r16, 0x0ba3, %r20
	.word 0xaf2c0011  ! 855: SLL_R	sll 	%r16, %r17, %r23
	.word 0x993c0011  ! 855: SRA_R	sra 	%r16, %r17, %r12
	.word 0x841c2694  ! 855: XOR_I	xor 	%r16, 0x0694, %r2
	.word 0xb72c1011  ! 855: SLLX_R	sllx	%r16, %r17, %r27
thr0_dc_err_78:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_78), 16, 16),1,DC_DATA,42)
	.word 0xf7040000  ! 857: LDF_R	ld	[%r16, %r0], %f27
!Illinst alu
	.word 0x908c2062  ! 859: ANDcc_I	andcc 	%r16, 0x0062, %r8
	.word 0xb0840011  ! 861: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0x85641811  ! 861: MOVcc_R	<illegal instruction>
	.word 0xb63c0011  ! 861: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0xb5341011  ! 861: SRLX_R	srlx	%r16, %r17, %r26
	.word 0x86940011  ! 861: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0xac940011  ! 861: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0xb63c2551  ! 861: XNOR_I	xnor 	%r16, 0x0551, %r27
	.word 0xcedc1011  ! 862: LDXA_R	ldxa	[%r16, %r17] 0x80, %r7
	.word 0xc2941011  ! 864: LDUHA_R	lduha	[%r16, %r17] 0x80, %r1
	.word 0x9f3c2001  ! 866: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x9f3c0011  ! 866: SRA_R	sra 	%r16, %r17, %r15
	.word 0xbb342001  ! 866: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0x848c0011  ! 866: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0xa73c1011  ! 866: SRAX_R	srax	%r16, %r17, %r19
	.word 0xae1c0011  ! 866: XOR_R	xor 	%r16, %r17, %r23
	.word 0x877c0411  ! 866: MOVR_R	move	%r16, %r17, %r3
	.word 0x8cb40011  ! 866: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x98bc0011  ! 867: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0xaa940011  ! 867: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x8a3c2b47  ! 867: XNOR_I	xnor 	%r16, 0x0b47, %r5
	.word 0x9a0c0011  ! 867: AND_R	and 	%r16, %r17, %r13
	.word 0xb1341011  ! 867: SRLX_R	srlx	%r16, %r17, %r24
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xf5841011  ! 867: LDFA_R	lda	[%r16, %r17], %f26
	return     %r18 + %r17
	.word 0xacc40011  ! 870: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0x85641811  ! 870: MOVcc_R	<illegal instruction>
	.word 0x968424fe  ! 870: ADDcc_I	addcc 	%r16, 0x04fe, %r11
	.word 0x90b42eae  ! 870: ORNcc_I	orncc 	%r16, 0x0eae, %r8
	.word 0x82840011  ! 870: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xb83c0011  ! 870: XNOR_R	xnor 	%r16, %r17, %r28
thr0_dc_err_79:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_79), 16, 16),1,DC_DATA,35)
	.word 0xf9140000  ! 872: LDQF_R	-	[%r16, %r0], %f28
	.word 0xee1c23e2  ! 874: LDD_I	ldd	[%r16 + 0x03e2], %r23
	.word 0x923c0011  ! 876: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x928c2e58  ! 876: ANDcc_I	andcc 	%r16, 0x0e58, %r9
	.word 0x8d2c0011  ! 876: SLL_R	sll 	%r16, %r17, %r6
	.word 0x89343001  ! 876: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x932c0011  ! 876: SLL_R	sll 	%r16, %r17, %r9
thr0_dc_err_80:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_80), 16, 16),1,DC_DATA,68)
	.word 0xd28c2e58  ! 878: LDUBA_I	lduba	[%r16, + 0x0e58] %asi, %r9
thr0_irf_ce_79:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_79), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xcd140011  ! 880: LDQF_R	-	[%r16, %r17], %f6
	.word 0x953c2001  ! 882: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x9e142cd4  ! 882: OR_I	or 	%r16, 0x0cd4, %r15
	.word 0x8c1c2012  ! 882: XOR_I	xor 	%r16, 0x0012, %r6
	.word 0x8ab42167  ! 882: ORNcc_I	orncc 	%r16, 0x0167, %r5
	.word 0x88b40011  ! 882: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0x872c3001  ! 882: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x86140011  ! 882: OR_R	or 	%r16, %r17, %r3
	.word 0xa92c2001  ! 882: SLL_I	sll 	%r16, 0x0001, %r20
thr0_dc_err_81:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_81), 16, 16),1,DC_DATA,1)
	.word 0xe85c0000  ! 884: LDX_R	ldx	[%r16 + %r0], %r20
thr0_irf_ce_80:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_80), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xccdc1011  ! 886: LDXA_R	ldxa	[%r16, %r17] 0x80, %r6
	.word 0x8cac0011  ! 888: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0x90c429b6  ! 888: ADDCcc_I	addccc 	%r16, 0x09b6, %r8
	.word 0x893c0011  ! 888: SRA_R	sra 	%r16, %r17, %r4
	.word 0x9a9c0011  ! 888: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x9f643801  ! 888: MOVcc_I	<illegal instruction>
	.word 0x8c042105  ! 888: ADD_I	add 	%r16, 0x0105, %r6
	.word 0x989c0011  ! 888: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0xa88c22f1  ! 888: ANDcc_I	andcc 	%r16, 0x02f1, %r20
thr0_dc_err_82:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_82), 16, 16),1,DC_DATA,13)
	.word 0xe89422f1  ! 890: LDUHA_I	lduha	[%r16, + 0x02f1] %asi, %r20
thr0_irf_ce_81:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_81), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xdc9c1011  ! 892: LDDA_R	ldda	[%r16, %r17] 0x80, %r14
	.word 0x8a94296e  ! 894: ORcc_I	orcc 	%r16, 0x096e, %r5
	.word 0x8d341011  ! 894: SRLX_R	srlx	%r16, %r17, %r6
	.word 0xbb2c1011  ! 894: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x877c2401  ! 894: MOVR_I	move	%r16, 0xfffffe34, %r3
	.word 0xa89c0011  ! 894: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0x96ac0011  ! 894: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0xf08c1011  ! 895: LDUBA_R	lduba	[%r16, %r17] 0x80, %r24
thr0_irf_ce_82:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_82), 16, 16),1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xd1841011  ! 897: LDFA_R	lda	[%r16, %r17], %f8
	.word 0xb0840011  ! 899: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0x852c1011  ! 899: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x86c40011  ! 899: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x8b2c3001  ! 899: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0xa80c0011  ! 899: AND_R	and 	%r16, %r17, %r20
	.word 0xc7941011  ! 900: LDQFA_R	-	[%r16, %r17], %f3
thr0_irf_ce_83:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_83), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xdadc1011  ! 902: LDXA_R	ldxa	[%r16, %r17] 0x80, %r13
	.word 0x9b2c0011  ! 904: SLL_R	sll 	%r16, %r17, %r13
	.word 0xb3343001  ! 904: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0x99341011  ! 904: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x921c2510  ! 904: XOR_I	xor 	%r16, 0x0510, %r9
	.word 0x832c2001  ! 904: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0x882c0011  ! 904: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xeb841011  ! 905: LDFA_R	lda	[%r16, %r17], %f21
thr0_irf_ce_84:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_84), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xda742af2  ! 909: STX_I	stx	%r13, [%r16 + 0x0af2]
	.word 0x942c0011  ! 911: ANDN_R	andn 	%r16, %r17, %r10
	.word 0xbb342001  ! 911: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0x841c2c41  ! 911: XOR_I	xor 	%r16, 0x0c41, %r2
	.word 0xbac40011  ! 911: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0xae940011  ! 911: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0xaf2c1011  ! 911: SLLX_R	sllx	%r16, %r17, %r23
	.word 0xb0340011  ! 911: ORN_R	orn 	%r16, %r17, %r24
	.word 0xa6140011  ! 911: OR_R	or 	%r16, %r17, %r19
	.word 0xd89c1011  ! 912: LDDA_R	ldda	[%r16, %r17] 0x80, %r12
	.word 0xde9420bb  ! 914: LDUHA_I	lduha	[%r16, + 0x00bb] %asi, %r15
	.word 0xaa2c2aca  ! 916: ANDN_I	andn 	%r16, 0x0aca, %r21
	.word 0x96bc0011  ! 916: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0xb6b40011  ! 916: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0x952c2001  ! 916: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0xb00c287f  ! 916: AND_I	and 	%r16, 0x087f, %r24
	.word 0xf4cc1011  ! 917: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r26
	.word 0xe6dc1011  ! 919: LDXA_R	ldxa	[%r16, %r17] 0x80, %r19
	.word 0x822c0011  ! 921: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x8e8424b4  ! 921: ADDcc_I	addcc 	%r16, 0x04b4, %r7
	.word 0xb0b40011  ! 921: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0x84ac2066  ! 921: ANDNcc_I	andncc 	%r16, 0x0066, %r2
	.word 0x83340011  ! 921: SRL_R	srl 	%r16, %r17, %r1
thr0_dc_err_83:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_83), 16, 16),1,DC_DATA,64)
	.word 0xc31c0000  ! 923: LDDF_R	ldd	[%r16, %r0], %f1
	.word 0xd31c0011  ! 925: LDDF_R	ldd	[%r16, %r17], %f9
	.word 0x843c0011  ! 927: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0xa97c2401  ! 927: MOVR_I	move	%r16, 0xfffffe34, %r20
	.word 0xba2c2bc9  ! 927: ANDN_I	andn 	%r16, 0x0bc9, %r29
	.word 0xacbc2942  ! 927: XNORcc_I	xnorcc 	%r16, 0x0942, %r22
	.word 0x960c0011  ! 927: AND_R	and 	%r16, %r17, %r11
	.word 0xc6dc1011  ! 928: LDXA_R	ldxa	[%r16, %r17] 0x80, %r3
thr0_irf_ce_85:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_85), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	ta	T_CHANGE_HPRIV	! macro
	.word 0xbac40011  ! 932: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0x82342b43  ! 932: ORN_I	orn 	%r16, 0x0b43, %r1
	.word 0xa8bc279c  ! 932: XNORcc_I	xnorcc 	%r16, 0x079c, %r20
	.word 0x909c2b46  ! 932: XORcc_I	xorcc 	%r16, 0x0b46, %r8
	.word 0x8d2c0011  ! 932: SLL_R	sll 	%r16, %r17, %r6
	.word 0xb60c0011  ! 932: AND_R	and 	%r16, %r17, %r27
	.word 0x88c42c60  ! 932: ADDCcc_I	addccc 	%r16, 0x0c60, %r4
	.word 0xfb9c1011  ! 933: LDDFA_R	ldda	[%r16, %r17], %f29
thr0_irf_ce_86:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_86), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xcb9c1011  ! 935: LDDFA_R	ldda	[%r16, %r17], %f5
	.word 0x952c1011  ! 937: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x96440011  ! 937: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x8e942de1  ! 937: ORcc_I	orcc 	%r16, 0x0de1, %r7
	.word 0xb4140011  ! 937: OR_R	or 	%r16, %r17, %r26
	.word 0x97343001  ! 937: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0x872c3001  ! 937: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0xd8cc255d  ! 938: LDSBA_I	ldsba	[%r16, + 0x055d] %asi, %r12
thr0_irf_ce_87:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_87), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xc904239b  ! 940: LDF_I	ld	[%r16, 0x039b], %f4
	.word 0x8d643801  ! 942: MOVcc_I	<illegal instruction>
	.word 0x94b42501  ! 942: ORNcc_I	orncc 	%r16, 0x0501, %r10
	.word 0xb1643801  ! 942: MOVcc_I	<illegal instruction>
	.word 0x953c2001  ! 942: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x98940011  ! 942: ORcc_R	orcc 	%r16, %r17, %r12
thr0_dc_err_84:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_84), 16, 16),1,DC_DATA,68)
	.word 0xd8040000  ! 944: LDUW_R	lduw	[%r16 + %r0], %r12
	wr      %r0, 0x1, %asr26
	.word 0x872c0011  ! 948: SLL_R	sll 	%r16, %r17, %r3
	.word 0xb2342498  ! 948: ORN_I	orn 	%r16, 0x0498, %r25
	.word 0xa81c0011  ! 948: XOR_R	xor 	%r16, %r17, %r20
	.word 0x853c2001  ! 948: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0xb8c42586  ! 948: ADDCcc_I	addccc 	%r16, 0x0586, %r28
	.word 0x9cb40011  ! 948: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0xc2140011  ! 949: LDUH_R	lduh	[%r16 + %r17], %r1
	.word 0xf91c26b7  ! 951: LDDF_I	ldd	[%r16, 0x06b7], %f28
	.word 0x841c21e6  ! 953: XOR_I	xor 	%r16, 0x01e6, %r2
	.word 0xba3c0011  ! 953: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x9f3c1011  ! 953: SRAX_R	srax	%r16, %r17, %r15
	.word 0x977c0411  ! 953: MOVR_R	move	%r16, %r17, %r11
	.word 0xa6440011  ! 953: ADDC_R	addc 	%r16, %r17, %r19
	.word 0x9c042f68  ! 953: ADD_I	add 	%r16, 0x0f68, %r14
thr0_dc_err_85:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_85), 16, 16),1,DC_DATA,41)
	.word 0xdd841000  ! 955: LDFA_R	lda	[%r16, %r0], %f14
	.word 0xc704245c  ! 957: LDF_I	ld	[%r16, 0x045c], %f3
	.word 0xaa3429ee  ! 959: ORN_I	orn 	%r16, 0x09ee, %r21
	.word 0xaf340011  ! 959: SRL_R	srl 	%r16, %r17, %r23
	.word 0x94140011  ! 959: OR_R	or 	%r16, %r17, %r10
	.word 0x873c0011  ! 959: SRA_R	sra 	%r16, %r17, %r3
	.word 0x92942420  ! 959: ORcc_I	orcc 	%r16, 0x0420, %r9
thr0_dc_err_86:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_86), 16, 16),1,DC_DATA,48)
	.word 0xd3841000  ! 961: LDFA_R	lda	[%r16, %r0], %f9
thr0_irf_ce_88:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_88), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xd8ec1011  ! 963: LDSTUBA_R	ldstuba	%r12, [%r16 + %r17] 0x80
	.word 0x929c22ab  ! 965: XORcc_I	xorcc 	%r16, 0x02ab, %r9
	.word 0x913c2001  ! 965: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x8eb40011  ! 965: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0x862c0011  ! 965: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x932c0011  ! 965: SLL_R	sll 	%r16, %r17, %r9
thr0_dc_err_87:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_87), 16, 16),1,DC_DATA,29)
	.word 0xd3841000  ! 967: LDFA_R	lda	[%r16, %r0], %f9
thr0_irf_ce_89:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_89), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xc3ec2431  ! 969: PREFETCHA_I	prefetcha	[%r16, + 0x0431] %asi, #one_read
	.word 0xad643801  ! 971: MOVcc_I	<illegal instruction>
	.word 0xa64426db  ! 971: ADDC_I	addc 	%r16, 0x06db, %r19
	.word 0xb8040011  ! 971: ADD_R	add 	%r16, %r17, %r28
	.word 0x920c0011  ! 971: AND_R	and 	%r16, %r17, %r9
	.word 0xb1643801  ! 971: MOVcc_I	<illegal instruction>
	.word 0x98142b14  ! 971: OR_I	or 	%r16, 0x0b14, %r12
	.word 0x9d2c2001  ! 971: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0xf6040011  ! 972: LDUW_R	lduw	[%r16 + %r17], %r27
!Illinst store
	.word 0xc4740011  ! 974: STX_R	stx	%r2, [%r16 + %r17]
	.word 0xb42c23c7  ! 976: ANDN_I	andn 	%r16, 0x03c7, %r26
	.word 0x821c27ea  ! 976: XOR_I	xor 	%r16, 0x07ea, %r1
	.word 0x92840011  ! 976: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0xaac4208e  ! 976: ADDCcc_I	addccc 	%r16, 0x008e, %r21
	.word 0x9e2c2ee3  ! 976: ANDN_I	andn 	%r16, 0x0ee3, %r15
	.word 0x922c0011  ! 976: ANDN_R	andn 	%r16, %r17, %r9
	.word 0xc2cc26ad  ! 977: LDSBA_I	ldsba	[%r16, + 0x06ad] %asi, %r1
	.word 0xd9941011  ! 979: LDQFA_R	-	[%r16, %r17], %f12
	.word 0x8b2c3001  ! 981: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x853c0011  ! 981: SRA_R	sra 	%r16, %r17, %r2
	.word 0x8d3c2001  ! 981: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0x88140011  ! 981: OR_R	or 	%r16, %r17, %r4
	.word 0xb9343001  ! 981: SRLX_I	srlx	%r16, 0x0001, %r28
thr0_dc_err_88:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_88), 16, 16),1,DC_DATA,62)
	.word 0xf8cc26ad  ! 983: LDSBA_I	ldsba	[%r16, + 0x06ad] %asi, %r28
thr0_irf_ce_90:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_90), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xcd140011  ! 985: LDQF_R	-	[%r16, %r17], %f6
	.word 0x982c0011  ! 987: ANDN_R	andn 	%r16, %r17, %r12
	.word 0x863420d3  ! 987: ORN_I	orn 	%r16, 0x00d3, %r3
	.word 0x8e9c0011  ! 987: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x86340011  ! 987: ORN_R	orn 	%r16, %r17, %r3
	.word 0x862c27fa  ! 987: ANDN_I	andn 	%r16, 0x07fa, %r3
thr0_dc_err_89:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_89), 16, 16),1,DC_DATA,5)
	.word 0xc7140000  ! 989: LDQF_R	-	[%r16, %r0], %f3
thr0_irf_ce_91:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_91), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xcd9c1011  ! 991: LDDFA_R	ldda	[%r16, %r17], %f6
	.word 0xaf342001  ! 993: SRL_I	srl 	%r16, 0x0001, %r23
	.word 0xb8842808  ! 993: ADDcc_I	addcc 	%r16, 0x0808, %r28
	.word 0x9b3c0011  ! 993: SRA_R	sra 	%r16, %r17, %r13
	.word 0xb20c2896  ! 993: AND_I	and 	%r16, 0x0896, %r25
	.word 0x9b340011  ! 993: SRL_R	srl 	%r16, %r17, %r13
	.word 0x9f2c2001  ! 993: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0xb4c42764  ! 993: ADDCcc_I	addccc 	%r16, 0x0764, %r26
	.word 0xae3c0011  ! 993: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0xd89c2538  ! 994: LDDA_I	ldda	[%r16, + 0x0538] %asi, %r12
thr0_irf_ce_92:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_92), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xf0dc2a1a  ! 996: LDXA_I	ldxa	[%r16, + 0x0a1a] %asi, %r24
	.word 0x8e1c2a53  ! 998: XOR_I	xor 	%r16, 0x0a53, %r7
	.word 0x86440011  ! 998: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x97340011  ! 998: SRL_R	srl 	%r16, %r17, %r11
	.word 0x932c1011  ! 998: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x992c3001  ! 998: SLLX_I	sllx	%r16, 0x0001, %r12
thr0_dc_err_90:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_90), 16, 16),1,DC_DATA,14)
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
	.word  0x1d85e297,0x5bf942a3,0xfbedee5f,0x74c0afbf
	.word  0xea5e6d83,0x7b6328a3,0xb7a1ee08,0xbb1a248d
	.word  0x18c21a6e,0xdb5dc09f,0x58cd98dd,0x57f5cd91
	.word  0xa6c2b110,0x8bcf9eab,0xc774e76c,0x2941f881
	.word  0x82517f4f,0x7d3c61c3,0x4b3b4739,0x6551f62b
	.word  0x79eaca1b,0x46753c0f,0x8c8c4374,0x57ab2af7
	.word  0x39bebf61,0xf4f05db5,0x67c4fd5f,0xef1bffaa
	.word  0xd3cc0fa6,0xf158b558,0x4a06b834,0x228521da
	.word  0xcbffe360,0xb772a39a,0x2ecd2cc8,0x2748b708
	.word  0xb6abe43f,0x5a8f6e56,0x5804857c,0x4866455f
	.word  0xa3f4928d,0x175ea2e8,0xa5af0ba9,0xb6f9451f
	.word  0x4ed11a2b,0x54d8f93b,0x85b99a90,0xa407f037
	.word  0x6e734313,0xba86531f,0xd684e472,0xe3273788
	.word  0xb35866a1,0x9f782a6f,0xac281211,0xa77cb090
	.word  0x6d410c13,0xb58f2795,0xf48fca29,0x7bee3960
	.word  0x4eaa6e2d,0xb971abda,0x01356b21,0xe8e18acb
	.word  0xbf0e7b08,0x378ffe9f,0x46b542cf,0x3e8bee36
	.word  0xf56255f9,0x78b464cf,0x359f4b0a,0x4acea1a2
	.word  0xaf22583b,0xfbe77d0d,0x776aec0c,0x4a12e3eb
	.word  0xbdf280bd,0xd344ec14,0x011036d9,0x42eeae36
	.word  0xf6de6f59,0xeda29b5e,0xe32da7aa,0x2e9e6a4f
	.word  0x1065a95a,0x254da4d9,0x3ed4b846,0x997272a5
	.word  0x38abb3c6,0xfde024a8,0xbbe9c778,0x7352af10
	.word  0x941303e5,0x68ed0164,0x76a355d3,0xff559eb7
	.word  0xc7fa0a30,0x4abf8473,0x6f7f5a5e,0x697beaf6
	.word  0x611e44a4,0xb5a4acb6,0x04e2d7ce,0xc675c8b2
	.word  0xfc68b273,0x5d276294,0x19fd402a,0x94690adc
	.word  0xa5f1b81b,0xfa84cb34,0x57f34899,0x6b0cebe5
	.word  0xd984c22d,0x79693251,0xd8b1c6c6,0xc4cd5a1f
	.word  0x8c295d9f,0xc88efe4a,0x3fcc50a4,0x46d8dd97
	.word  0x95f894e9,0xfa98eb43,0xb3b1c26f,0x09bea668
	.word  0xa5c43d8c,0x2073be0b,0xe977cce0,0xab616d77
	.word  0x7f7dca9d,0xad72e64c,0xd775dfd0,0x1d7ca547
	.word  0x75534196,0x168d25cf,0xa78b0b0b,0xdeca3396
	.word  0x7236ce76,0x625fe5ed,0xb40416f7,0xe147d54a
	.word  0x033bc9b3,0x9d6bc14c,0x61c859be,0x7a2691ed
	.word  0x58cf463c,0xba38712c,0x1325b65d,0x5b7ada54
	.word  0x805cfa7c,0x2d3c75be,0x6dbfca13,0xb986072a
	.word  0x3c909015,0xe0208b7f,0x74bc2355,0x0d026b27
	.word  0x66d64515,0x6b4f1814,0x2117bd28,0x30e018e9
	.word  0xef9e7906,0x236f7441,0x5c14f72a,0xf451c4b1
	.word  0xfd927c6a,0x17569efe,0xad687759,0xfbf17ba9
	.word  0x21f78c89,0x15e6a1d7,0x20e5f14e,0xb12ca321
	.word  0x0a26153a,0x87719437,0x36f7facc,0xf2c8f9a7
	.word  0x3a3e64b6,0x6d1cc234,0xac27151d,0x4ea73cdb
	.word  0x442c44c6,0xc2581dc2,0x044f0b53,0x2871ddc4
	.word  0x122f3d67,0x8ed836a1,0x614a8b07,0xc3acc9d9
	.word  0xedee250a,0x28539b32,0x8e3c401a,0x29ce44cc
	.word  0xbde9186f,0xc043dd55,0xd502d26e,0x44b46773
	.word  0x76aec06d,0x8e1959de,0x88b4e998,0x0f13dace
	.word  0x190af81f,0xaa1fe022,0x1ace57fb,0x4f083516
	.word  0x4ee12831,0x498dfa0e,0x6894a6ac,0x74c6a80e
	.word  0x429671b7,0xc116d326,0x716b7521,0xf2cfeaff
	.word  0xea1002a4,0x0f6546a6,0xa552f517,0x8dc896d5
	.word  0x3ea36c5f,0x20521647,0x9dc86fd1,0xb8789563
	.word  0xa5f416ca,0x67c2d64a,0x92dbd796,0x5c0ed889
	.word  0x16b1e630,0x3becdf5c,0x4f82fc3b,0x8523fc6c
	.word  0xa9a0e7d1,0x0347f003,0xbabf31ce,0x7aafc081
	.word  0xc8a53afa,0x8b3e3681,0xccb4233a,0x753fea11
	.word  0x369a6d82,0xba6b69d1,0x97ad1b83,0x00e63102
	.word  0xb7813232,0xb93e6bd9,0xaa422d49,0xbf490d9d
	.word  0xdbde881d,0xc74d9379,0xf96d0ceb,0xd7b4981a
	.word  0x10494c27,0xc73bcb44,0x2a64c339,0x903adff6
	.word  0xe7a8ddf1,0x21633261,0xe3ad66a4,0xc4ac84b0
	.word  0xb7e369d0,0x5e024ce7,0x04607efb,0x8901713e
	.word  0x65fae7b9,0xa6e858a5,0x927bd21a,0xafc752d3
	.word  0xbe9bacca,0x35abb2f7,0x8c398d72,0x3b3b52b8
	.word  0x83d5147f,0x8892ca1c,0x25435fc0,0x17c79dc7
	.word  0xeed3a4fe,0x43191058,0xe1b99401,0xe7959a86
	.word  0xd6827196,0x813af896,0x559a9e2d,0x3ea6afde
	.word  0xc14ba7c0,0xd61dea0f,0xeda3a9a7,0xaa6c0afa
	.word  0xc574d398,0xe3ac92f3,0xe447e6e7,0x956b7260
	.word  0xa108b2a3,0x98bf511f,0xdf48720b,0x258d2860
	.word  0xd1a460a2,0x420f36d5,0xeeb743db,0x0cb3f4a5
	.word  0x1f83dc1a,0x908fa0ff,0x8ff7cbda,0x18203dea
	.word  0x4eb5ec4f,0xaee57715,0xd3005b74,0x309979aa
	.word  0x1b31c2ca,0x968c1719,0x77784fe0,0x114d3f9a
	.word  0xc617da39,0x624aa982,0xa1675493,0x19b05591
	.word  0x3492e57b,0xe4f3465b,0xc1e9766c,0x21ab4544
	.word  0xe4394864,0x454db9bc,0x75c08805,0x1104c28b
	.word  0x0c15e3dd,0x32b41dde,0x42b624c7,0x7aec85f3
	.word  0x825b459d,0x119878de,0xaf17c476,0x138216e4
	.word  0xde2f3550,0xc648c2b7,0xab9f1a54,0x29736eda
	.word  0x9fa0b8b7,0x0a4698b9,0x5c408400,0x8dbd8b0d
	.word  0xc9256eef,0x2cc8472c,0x8ba90a2d,0x71309f33
	.word  0x2b182d17,0xe1edcfa9,0x25f3f7db,0x6f5ed1fd
	.word  0xf452b1c3,0xa2f3a0a4,0x8452af5a,0x463c3fc1
	.word  0x77a98ff6,0xea75c4c1,0x25e6ebab,0x129afd4b
	.word  0x5ecb1e6b,0x9cff0544,0x9026aac6,0xd87ec61f
	.word  0xdb17698d,0xc2bb5b11,0x0af9a5c4,0x38dfb62c
	.word  0xf5a2e395,0x86596e6a,0xacc8ef10,0x315b4789
	.word  0x5090f66f,0x0131f336,0xfd8b1823,0xb4d7b2be
	.word  0x9775d624,0x1769c127,0x88954f39,0xde78332e
	.word  0xa3ee97c5,0x6d24d052,0x14b8c91e,0x675dd659
	.word  0x4ffb793d,0x33b947a1,0x5076e932,0x84ca4f80
	.word  0x9bb62b18,0x2a51ed19,0x11eafc28,0x50dba252
	.word  0xf33cb99f,0x35b01f47,0xccff32b4,0x93f5e051
	.word  0x3b51f0f7,0x9617e811,0x7fb0ae38,0xb7a7588d
	.word  0x55bdbb96,0xe15f80de,0x4e75e4a1,0x20bcf82c
	.word  0x8adf8ecb,0xbc69ea63,0xe68521b6,0xcb3bed69
	.word  0xbad90dfd,0xb4150b54,0x6e5c15d7,0xabe60017
	.word  0x43cfe365,0x70995318,0x4e06f153,0xcc52b368
	.word  0xa13dcd0d,0x2dfd06ad,0xacbd4057,0x5281d344
	.word  0x1bb2374b,0xdac7ffa3,0xce95c30d,0xaabf3ed5
	.word  0x2e39bb27,0x86803ffc,0x4184f0fb,0x82c081e1
	.word  0x2d525af2,0x4efbe47f,0xf30f9396,0x9202cbdc
	.word  0x30783957,0x717bf33e,0x033ff1e4,0x240beb2c
	.word  0xdfe591cc,0x95e9bef3,0xbde9414e,0x2bb05a94
	.word  0x5d15c676,0xe9336bca,0xf775ddc0,0x6a36c189
	.word  0x07fc3db6,0xa628ded0,0x9e380621,0x3e64170b
	.word  0x1218e57f,0xc7c08a77,0xb2e1a4bd,0x4b4d25fe
	.word  0xcf81dff1,0x67a6ce17,0x2a53e5e9,0x715a95f1
	.word  0xa09dad7f,0x0e20b133,0x034699aa,0x33996185
	.word  0x66edb411,0xcae6760c,0x31659262,0x69e4f28d
	.word  0xe178e13d,0x65e5c70c,0x3ba51147,0x3065a4ca
	.word  0x2d6c45b7,0x924a5174,0x63945f32,0xb0f28611
	.word  0xe2a928ba,0x4d028e63,0xe00315d7,0xbd8f1dd8
	.word  0x6cc1ff34,0x3ac14862,0x7e13f86b,0x3579b2f6
	.word  0x33fe4981,0x3e7c71cb,0xd4553eff,0x9c65be4e
	.word  0x9f85fabe,0x881436d2,0xfad09d81,0x2408a7fa
	.word  0xb197c702,0x4b402471,0xb7adce54,0xb4a09a63
	.word  0x78dc9447,0x927ffdb8,0x4c7907b2,0xc0d81f2a
	.word  0x43f3f777,0xb689cff5,0xc2f5394f,0x5b336d41
	.word  0x9a084dd0,0x04398100,0xab98fc3d,0x5fb35ead
	.word  0x21e6134b,0xefe9a499,0x1ace1fe8,0xe10cb8a5
	.word  0xd7cd9157,0x334422fe,0x97dab974,0x139ffd0c
	.word  0xc5f2d2a6,0x16e65268,0x22884a56,0x4ed4b0e2
	.word  0x9f99084e,0x912d0400,0x1d394150,0xa31475e4
	.word  0xf724b29d,0xfead918d,0xf3ef1094,0x79521689
	.word  0x60400ea1,0x8e2ad28a,0x796f0a9a,0xd507cb97
	.word  0x636be267,0x94d45753,0xdbd35d8e,0xdf8073ba
	.word  0xdaef8b70,0xc298dcd0,0x81ae133d,0x9bf6d748
	.word  0x93c8a7e2,0xe3aaece2,0xe13fae67,0x8b9f926a
	.word  0x8fd6eb29,0xaff331fb,0xf04c18e7,0xea9c9b5d
	.word  0xe78d97c9,0x27fb3b92,0xe250aa2b,0xf4f671ea
	.word  0x4777bdf1,0x858e614e,0xd46e841d,0x816bd19a
	.word  0x725a2c18,0xc15a729d,0x86fa07d0,0x13477877
	.word  0xe3bf7102,0x8fc7de4a,0x5da7c63f,0x5c7ff38d
	.word  0xde2fcd77,0xe8f95b18,0x5db9a395,0x17eece1a
	.word  0x6a439689,0x23ab1177,0x664419ca,0xf6c5e155
	.word  0x2125b4ba,0x134a87f4,0xa5af363a,0x87608a8d
	.word  0xd0a4f6c7,0xe488b88d,0x8cd127fe,0xb2576af3
	.word  0xf648ae2c,0x599018cd,0xa27bb208,0x5de9babc
	.word  0x0b3c8ab7,0x6ee2fe97,0xd2cdbcfd,0x350c9e39
	.word  0x68a08dc7,0x9452a479,0xfc7ba941,0x3a87c5d3
	.word  0x725f44f7,0x30360eb9,0x9b17c8d6,0x2e079f84
	.word  0x49f34c52,0xfdc4275c,0xa8772163,0xced7cc76
	.word  0xa485764e,0x2870155a,0x2f769d9c,0x2afdaf98
	.word  0x267f0081,0x637361d6,0xede63bb7,0xa20ae7c3
	.word  0x79d368bf,0x5963c7d7,0x0a3bb828,0xc5bf1881
	.word  0xe1fd2bba,0x2b722134,0x10a54572,0x3a87ad0a
	.word  0x2be4c3ea,0xefd2cec3,0xb203f69a,0x72bb9db8
	.word  0x2c610cb8,0x3a43b437,0xaa2fd838,0x3b4ff293
	.word  0x36df3f92,0x74937dde,0xf151e48d,0xede16134
	.word  0x95c7ab6c,0xa67a412b,0x00d45f3e,0x1cf80110
	.word  0x0d3ec121,0x7b36b2d2,0xa5ebee06,0x15f088ca
	.word  0x6828e989,0xb02ee32d,0x703d9ec4,0x8fcd81e0
	.word  0x845bda2a,0x2058be3a,0x4f164a73,0x55e8b71d
	.word  0x59973b10,0x52e0f718,0x697abef1,0x6886c1d3
	.word  0xff56ec5a,0xacfbfafc,0xd9d7cc46,0xcd4c21b1
	.word  0x7ba502a0,0xbbc2c697,0x87c4163f,0x97e8a810
	.word  0xf8fb8a6f,0x6884aa71,0x8f869c42,0xb418dcf8
	.word  0x173c9a38,0x3c810d6a,0xdd2ea5dc,0x43f8cccd
	.word  0xc3b712e7,0x705f0bc7,0x00a8ec7a,0xa6c08d8d
	.word  0x30b11b12,0x6c388c81,0xc4d1476e,0xc887f0df
	.word  0x3a8ed4e5,0xba21b8c4,0x1a5bb298,0x1ec9d211
	.word  0x7366dba6,0xed20d37b,0xe581c03a,0x353a4ee1
	.word  0xc1584eee,0xaa806d4d,0x35d5572a,0x51b26e5a
	.word  0xad90bb52,0x26c6d6e8,0x269d80ed,0x6eb1dd38
	.word  0xfd0c5479,0xd2890860,0xe1e79338,0xef183f29
	.word  0x72d28ba6,0x74af4dd8,0xee05f5ba,0x14a0f2c5
	.word  0x8b36a091,0xec36b1a8,0xedcb9764,0x85575048
	.word  0xbc83c7b1,0x62e9aea1,0xdaf79297,0xfbf1e48d
	.word  0xb7759b17,0xa21633af,0xd9c78a70,0xe5701fa9
	.word  0x40fa8a6c,0x5ade8f7e,0x95a93937,0xedbbedcf
	.word  0x3374aa5c,0xd3c45272,0xd9fcd99a,0x1a22f989
	.word  0x1ebbc5b2,0x6c9bbcf6,0x6e8c0fb4,0xe8c29763
	.word  0xff71cddb,0xd81247e7,0xa1dcb4d8,0x5372080b
	.word  0x7c074b87,0x6bae2c57,0x4044a1bb,0x59b98db3
	.word  0x556f4309,0x4a2601f1,0xfdca4088,0x725bbc2d
	.word  0x1314fc9e,0x29f47664,0x3fae3449,0xb51e0178
	.word  0x13699ed4,0x07d6fb36,0x92e7e33f,0xb9c654ff
	.word  0xd22259e5,0x80b9c6ae,0xeb96de62,0x02b30e63
	.word  0x5e46eef8,0x68f36e46,0x89ac79c9,0x1c1aa5f3
	.word  0xd1a10ac5,0xb89a867c,0x66dbe812,0xfd11a55e
	.word  0xa10440b6,0x046e5ab7,0xb62be310,0x4c8d20f5
	.word  0xb63ad6f9,0x152f2ef9,0x6b5a3538,0xd33988b4
	.word  0x8b64ddb6,0xd54e5e92,0x2f878cdb,0x2c689579
	.word  0xe350ade0,0x555764f2,0x9c62703a,0x83781f80
	.word  0x85a77b3f,0x19883848,0xab347b1d,0xa700f2bc
	.word  0x3e2e6089,0xae1619ee,0x516dc52d,0x4fe44925
	.word  0xaa6fd2de,0x3625ae4e,0x9d6417a6,0x3af3b44e
	.word  0xbbc4ed8d,0x5f1b6f4e,0x9c49eea2,0x9b8086f9
	.word  0x6d3ad448,0xd140afaf,0xf31574b7,0x4cadd0de
	.word  0xe518658b,0x142f03fc,0x98a26af5,0x16403f3c
	.word  0xf0754955,0x752a136d,0x68cf7270,0x08247fe7
	.word  0x1cc60ec9,0x01282c5a,0xd074b30e,0x98d555ca
	.word  0x85dae239,0x26be6568,0x50d6de0f,0x0cb08e3c
	.word  0xb1d2982e,0x0076dc34,0x7bc1d4b6,0xda17d0d9
	.word  0x89a7e307,0x5e938a43,0x9d3af5f8,0x30d13efc
	.word  0x3c1757b6,0xed156d22,0x51062440,0xc7989296
	.word  0x3dfde6de,0x0b1a5307,0x317de6d2,0xe3b0e84d
	.word  0x0457b784,0xfc19c868,0xe5a4ab65,0xaf8ee941
	.word  0xef39a930,0xc531b44c,0x0cfb1281,0x044b6c1a
	.word  0x5084d735,0xd78a839b,0xb4ddc99b,0xac951dc4
	.word  0x7f861fec,0x3c439ab3,0x162edc5c,0xf9c8c1fb
	.word  0xace9f1f5,0x2921f8dc,0x522d667b,0x9565dd30
	.word  0x85db2660,0xe21828e0,0x50c067cf,0x3b9e5f10
	.word  0x829a7910,0x7d3e528d,0x2062b461,0x4a7c404c
	.word  0x583cb15a,0xc509d45d,0x7f9b2894,0x70941731
	.word  0x3c4b242b,0x31623065,0xdf34ff8d,0x7a7d6284
	.word  0xf1b10838,0xba9ed42f,0x07aebee8,0x56b6bbfb
	.word  0x6b5c9c83,0x98791f2c,0x7d7f5f27,0x607a25dd
	.word  0xb6d79c30,0x6ed5e8e0,0xf55d0318,0x66646d70
	.word  0x13df8be4,0x5d692207,0x46357083,0xbae51478
	.word  0x4711be35,0x59c8c411,0xcdbdf717,0x594cbada
	.word  0x41d47c8f,0x0b570a23,0xbe899209,0x9fb5f1f4
	.word  0x5641cfb2,0xaadcf2bb,0xb172262b,0x1a101ac1
	.word  0x1a6e769d,0x865ce09e,0x0a82527e,0xc595420e
	.word  0x8c6f3681,0x5d543d19,0x84c7da8b,0x103a4e00
	.word  0x3642b891,0x1f4f6861,0x608faf94,0x2d733d4f
	.word  0x3c43c91a,0x961b3418,0xb95f6c18,0x9b1ed1d0
	.word  0x6871f580,0xa7168e88,0xa1897996,0x3e103721
	.word  0x31afe20a,0x84e23f22,0xa07927d9,0xa9b37772
	.word  0x6a79a8dc,0x533f6763,0xf7d62b37,0x577b5213
	.word  0x9305d0da,0x334deb2c,0x37e45e0d,0x5dee7f14
	.word  0x20c39316,0xc7fc2009,0x2a7a0b24,0x370b1a57
	.word  0x335b25c3,0xe28f82ac,0xc168a2b0,0x56a0473d
	.word  0x2e9be2de,0xfc1acd2d,0x8fd14692,0x0705439f
	.word  0xc92d0973,0x6bc151ce,0xf7a8e829,0x4ad4347b
	.word  0xf3a256a0,0x1aee5ae7,0x723948f9,0x7820ead6
	.word  0x6243a7f7,0x3f6a93e2,0x1e1ce5e5,0x17ece1f0
	.word  0x6600b985,0xd3427832,0x87857245,0x1e8ef4a7
	.word  0x557339cb,0x175e77f1,0x267e6490,0x7fab9b1a
	.word  0xb42531cb,0x64f85dbb,0xedb6ccab,0xdd32cbac
	.word  0xe9f81e9e,0xec00e03b,0x307e7cfc,0xd5158b5c
	.word  0x2ec57d3a,0x2e223354,0x5f7b918a,0x12fec502
	.word  0x355fe6d5,0xf4ae3353,0x25c076ef,0x9018c323
	.word  0x1130288f,0x3f2e0224,0x324df39c,0x10d608e6
	.word  0x40a57d47,0xa37fd851,0x5f5365df,0x503b67cd
	.word  0x824ebb96,0x4fa717df,0xd8057d79,0x93265dd2
	.word  0x689069d6,0xe3ad626f,0x67d3dfdd,0x0aa51014
	.word  0x0c9d2f97,0x1c06c33b,0x3991d49d,0xb429f336
	.word  0x5748d9a5,0x2ac6d98a,0x12729bd3,0x2963a927
	.word  0x0715977e,0xbfb2b616,0x5c5175a6,0x09db4acf
	.word  0x7ec795aa,0xde5b68bc,0xd303ac51,0xe4a40c73
	.word  0x42190ea2,0xd7918424,0x29b7a0ba,0xefb0f2dc
	.word  0xc85e602f,0xd9942a14,0x6d8fc6b1,0xa6e4c77e
	.word  0xafe0d130,0xe6e7d30b,0x823cd352,0x8bd58e86
	.word  0x79b5c185,0x33fe3ae3,0x16817e90,0x8de7ddc0
	.word  0x32766a71,0x951c8309,0x449b038a,0x9b017aed
	.word  0x3997ca6d,0xeb312e43,0x1a8a1937,0xe85433be
	.word  0x943f0665,0x72df9121,0x8030367d,0xeec6ee54
	.word  0xe74d12b8,0x89452fa2,0x5ff42dc7,0x1d2c6510
	.word  0x3cd678c6,0xf0374c0e,0x0623a215,0xfb1e7b2f
	.word  0x86dd124a,0xa32bca27,0x4ec73084,0x77d413e0



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

