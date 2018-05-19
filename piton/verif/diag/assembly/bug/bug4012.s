// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug4012.s
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
   random seed:	628540039
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
        setx  0x0000000000000eb0, %g1, %r17
        setx  0xa130e1f9e856c3d5, %g1, %r0
        setx  0x58dc7ec1ff8b34f2, %g1, %r1
        setx  0x0df233ee668eaeb8, %g1, %r2
        setx  0xcfe0f5dfdba3686d, %g1, %r3
        setx  0x5ea4bc940d2e0996, %g1, %r4
        setx  0xf2fbcd612cc4ba07, %g1, %r5
        setx  0xcb1ea8ca420dedb6, %g1, %r6
        setx  0x97dc27a2b9b2a9b2, %g1, %r7
        setx  0xd640ac1dc5dc1a3c, %g1, %r8
        setx  0x37514d23dad8c5e4, %g1, %r9
        setx  0x5981c8ac1f546daf, %g1, %r10
        setx  0xe9c2b483db29f3ac, %g1, %r11
        setx  0xa9d9d10ebd970341, %g1, %r12
        setx  0x5ea9c9e0a6a2ea6f, %g1, %r13
        setx  0xbcbd275ef65bb348, %g1, %r14
        setx  0x7c6413de1ab38c2c, %g1, %r15
        setx  0xf39accedc6a3e6c5, %g1, %r18
        setx  0x8172d69994cea4c9, %g1, %r19
        setx  0xd422f8ae6a910c74, %g1, %r20
        setx  0x4c2bb40c327b73cd, %g1, %r21
        setx  0x2e3f2795960a7ed6, %g1, %r22
        setx  0x52aa1cd95b51e2db, %g1, %r23
        setx  0x429cf370c372652d, %g1, %r24
        setx  0x035cac8f854f7986, %g1, %r25
        setx  0x180b362a1ba90744, %g1, %r26
        setx  0xaa051e700b0454d0, %g1, %r27
        setx  0x9123cf60aff0248b, %g1, %r28
        setx  0x3af789e457353678, %g1, %r29
        setx  0x6f4e50c20154826c, %g1, %r30
        setx  0x85d58dbd5dea5bb0, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000af0, %g1, %r17
        setx  0x83c9197f6c1bb6f4, %g1, %r0
        setx  0x5e94811f27a69612, %g1, %r1
        setx  0x433e288d12496496, %g1, %r2
        setx  0xf93aa6905843a689, %g1, %r3
        setx  0x204f39e107b9e22a, %g1, %r4
        setx  0x52409178adfcaa38, %g1, %r5
        setx  0x1b40e624c894e180, %g1, %r6
        setx  0xc9292f88553a2299, %g1, %r7
        setx  0x3a8d496bd983441f, %g1, %r8
        setx  0xe252250eabd105c6, %g1, %r9
        setx  0x4dbd010c5e5d5f90, %g1, %r10
        setx  0x65a1ade139b362f3, %g1, %r11
        setx  0x8fde66c7405739a9, %g1, %r12
        setx  0x39039480b37cf91d, %g1, %r13
        setx  0x224491762a3aa67d, %g1, %r14
        setx  0x72351246d83f5852, %g1, %r15
        setx  0x6c47b60633275d3b, %g1, %r18
        setx  0x2b4ca3993b02c5b9, %g1, %r19
        setx  0x9b69f4d9f394a819, %g1, %r20
        setx  0x068b78f38a9e4986, %g1, %r21
        setx  0xe5f93c3672ff94fb, %g1, %r22
        setx  0x65fd1650558318bf, %g1, %r23
        setx  0x8a65c077e0adead9, %g1, %r24
        setx  0x39eca7e560913e94, %g1, %r25
        setx  0x87b8b578839e7277, %g1, %r26
        setx  0xf95dc0a87ac0c493, %g1, %r27
        setx  0xaa7df8a67007299f, %g1, %r28
        setx  0x75667b6d6e7beafc, %g1, %r29
        setx  0xd8e01e96bb121849, %g1, %r30
        setx  0xedd21a2793ce74e8, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000010, %g1, %r17
        setx  0x3b8e2301f872f319, %g1, %r0
        setx  0xf14a1436267fec8a, %g1, %r1
        setx  0x2f4c3036c2dbe7f3, %g1, %r2
        setx  0xe51e0e9fdf5f5d59, %g1, %r3
        setx  0x487a7dc5f3bd2e8a, %g1, %r4
        setx  0x5f956804a2f674b5, %g1, %r5
        setx  0x288907971998f23c, %g1, %r6
        setx  0x9e25281ad54b7526, %g1, %r7
        setx  0x424cfb899398c208, %g1, %r8
        setx  0xea0ecb7172528bdd, %g1, %r9
        setx  0xe586e649dc4e81c8, %g1, %r10
        setx  0x4343400878589c82, %g1, %r11
        setx  0x1db327f4d1fcae79, %g1, %r12
        setx  0x77bae85220628d89, %g1, %r13
        setx  0xa09890d05eec5d8b, %g1, %r14
        setx  0xb23b875ed9716c1e, %g1, %r15
        setx  0x76e4be4e6d148cb4, %g1, %r18
        setx  0x3362fa754321d228, %g1, %r19
        setx  0x34d9040e135c96f2, %g1, %r20
        setx  0x168bc34096161c54, %g1, %r21
        setx  0x8227af4afabd32e2, %g1, %r22
        setx  0x6a8176fc52c5190b, %g1, %r23
        setx  0x6c692a92183bf40f, %g1, %r24
        setx  0x904df2fc29932ea3, %g1, %r25
        setx  0x36bdb2529c110d61, %g1, %r26
        setx  0x51d2e50528c58a44, %g1, %r27
        setx  0xbdc3fb0c10fbc31a, %g1, %r28
        setx  0x3093f9acd7eb8a10, %g1, %r29
        setx  0x6b06864151544ad3, %g1, %r30
        setx  0xc05e6d5951ea4b3b, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000820, %g1, %r17
        setx  0xc4270835062ef74a, %g1, %r0
        setx  0x807a0bd6a7ba3cd4, %g1, %r1
        setx  0xf6d4710859833f1d, %g1, %r2
        setx  0x941980bf6f5c2f93, %g1, %r3
        setx  0x4fcc7a882a17025a, %g1, %r4
        setx  0xa5444cdb81365c39, %g1, %r5
        setx  0x6a5042067e0bbbe8, %g1, %r6
        setx  0xae08aff23900bddd, %g1, %r7
        setx  0xb3854a7516dfbc5d, %g1, %r8
        setx  0x70f14125e0d90927, %g1, %r9
        setx  0x3c9be4ab715431d8, %g1, %r10
        setx  0x2c24003c734368ae, %g1, %r11
        setx  0x2132372161a883fe, %g1, %r12
        setx  0x5090777f47e0584e, %g1, %r13
        setx  0x71abf1ca6cd437e6, %g1, %r14
        setx  0x7a6933f7fd7b668d, %g1, %r15
        setx  0x8ee861d5f219deb4, %g1, %r18
        setx  0x613d9f4762c82010, %g1, %r19
        setx  0xb50dcf99d812b281, %g1, %r20
        setx  0x2b712eac61ad9249, %g1, %r21
        setx  0x522616bcbfabd29f, %g1, %r22
        setx  0xaeaa56ffd526b9df, %g1, %r23
        setx  0x53fbe946671a9300, %g1, %r24
        setx  0xa44d4f12c3469692, %g1, %r25
        setx  0xc98b6db4f79cac59, %g1, %r26
        setx  0xd2f8d9122633cb0a, %g1, %r27
        setx  0xdb3c012f17f7352d, %g1, %r28
        setx  0x81a9f5f892f270bd, %g1, %r29
        setx  0x49ee3e0f6ce61b1d, %g1, %r30
        setx  0xae4856881b124ddd, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000c00, %g1, %r17
        setx  0x2df18d9eb0f489c7, %g1, %r0
        setx  0x084d3f1d24316de2, %g1, %r1
        setx  0x8f451180b3dc99ae, %g1, %r2
        setx  0x50610312a04c8a0e, %g1, %r3
        setx  0x5948e90a623be40a, %g1, %r4
        setx  0xd8e00c7c2872e802, %g1, %r5
        setx  0xbf258e6f2a9802aa, %g1, %r6
        setx  0x1d6e96b0ad775251, %g1, %r7
        setx  0x4ffd4a0775b83ad9, %g1, %r8
        setx  0xf495c55abee081cf, %g1, %r9
        setx  0xe172fc9f47bd284a, %g1, %r10
        setx  0xfed9744bf630674e, %g1, %r11
        setx  0x616006828324ac86, %g1, %r12
        setx  0xe095f954a7e59f4f, %g1, %r13
        setx  0x73084e18bc073300, %g1, %r14
        setx  0xf6a17b0dcd4fa091, %g1, %r15
        setx  0x70402e24ecb3ab96, %g1, %r18
        setx  0xc0f6716a166ba722, %g1, %r19
        setx  0x72a027ceaa57c949, %g1, %r20
        setx  0x2008dc5fb33ce54b, %g1, %r21
        setx  0xd3778b395e9df809, %g1, %r22
        setx  0xaebd4c0584251a99, %g1, %r23
        setx  0xd17e364aee2df998, %g1, %r24
        setx  0xfef90aa5c0f1eddd, %g1, %r25
        setx  0xd68244b81dfae8d6, %g1, %r26
        setx  0xcc4e4706e125e68f, %g1, %r27
        setx  0x1c5b9d2db82bfa96, %g1, %r28
        setx  0xa35a945ce1fc0e9b, %g1, %r29
        setx  0x8a24810c315e187c, %g1, %r30
        setx  0x587e10022989a223, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000c90, %g1, %r17
        setx  0x45b9db15e2748b3d, %g1, %r0
        setx  0xfcd580272ac681b8, %g1, %r1
        setx  0xddc91cd9cc7e4aeb, %g1, %r2
        setx  0x0ba4404b04a9ad29, %g1, %r3
        setx  0x8b6ab7741d674f63, %g1, %r4
        setx  0x9df272be68cc906c, %g1, %r5
        setx  0x81b63b8deafb3bd2, %g1, %r6
        setx  0xf314c56331a2a763, %g1, %r7
        setx  0x8e7f165834245d84, %g1, %r8
        setx  0x96c0763fe878e812, %g1, %r9
        setx  0x3eb04b8ecf73c246, %g1, %r10
        setx  0x6c8ca0b1f34ed226, %g1, %r11
        setx  0x11a6449a9fd862bc, %g1, %r12
        setx  0xfd8cd989818c4297, %g1, %r13
        setx  0xc59f716bfa0e5c6e, %g1, %r14
        setx  0x828903b603407011, %g1, %r15
        setx  0x9e44ccadd2597336, %g1, %r18
        setx  0x6c0448781d94203b, %g1, %r19
        setx  0x7d29af9a7840c4ca, %g1, %r20
        setx  0xd03213bd2d43c9aa, %g1, %r21
        setx  0x65fcfc665eb60920, %g1, %r22
        setx  0xad055740ee4a9f38, %g1, %r23
        setx  0x546edba0d9e7039f, %g1, %r24
        setx  0xd67ed9b81ca0c4d0, %g1, %r25
        setx  0x5479537c8dd08699, %g1, %r26
        setx  0x5f0b36103b4aa4ca, %g1, %r27
        setx  0x4c2107ab3ba49005, %g1, %r28
        setx  0xdb35d11cfb8d345e, %g1, %r29
        setx  0x28c6c56f2a587965, %g1, %r30
        setx  0x315170f0e2ef9924, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000310, %g1, %r17
        setx  0x00de3342cc8c0b93, %g1, %r0
        setx  0xc4e724685575cb4c, %g1, %r1
        setx  0x6e15885cd5378fd4, %g1, %r2
        setx  0x0bbe901e2565d7fe, %g1, %r3
        setx  0x09d402c8631c228f, %g1, %r4
        setx  0xaf52f2c7a1640c57, %g1, %r5
        setx  0x4e42dffb621be712, %g1, %r6
        setx  0x8b9c666cccdae339, %g1, %r7
        setx  0x49a9fafe1c6069e5, %g1, %r8
        setx  0x7c0bd7a1b04a3818, %g1, %r9
        setx  0xd9a24e90b690122f, %g1, %r10
        setx  0x0ee6cff93d9bd700, %g1, %r11
        setx  0x825e00aece8c65c5, %g1, %r12
        setx  0x1ce6c54227cb6eff, %g1, %r13
        setx  0xf7ab34db29f2c3bf, %g1, %r14
        setx  0xacb2962acba662e8, %g1, %r15
        setx  0x8ad73b65237b4a39, %g1, %r18
        setx  0x46d48b09eb622a3f, %g1, %r19
        setx  0x4f35ab5a76c62330, %g1, %r20
        setx  0xc86994dfb2244cf7, %g1, %r21
        setx  0xb0404edc60eaa852, %g1, %r22
        setx  0x97506f8f9dd42fd6, %g1, %r23
        setx  0xf7c6caf97a86f322, %g1, %r24
        setx  0x5eca428b8a738d34, %g1, %r25
        setx  0x61f5240f1bffa14e, %g1, %r26
        setx  0xe800a6add805d1ce, %g1, %r27
        setx  0x589bcae068f99419, %g1, %r28
        setx  0x781bd50a3f0bb6f4, %g1, %r29
        setx  0x96d67cb08fcee2a5, %g1, %r30
        setx  0xbfd239ec8d070452, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000750, %g1, %r17
        setx  0x07c49ab1fee725ef, %g1, %r0
        setx  0xf86c3eaf2f962769, %g1, %r1
        setx  0x4fe535795bf74e32, %g1, %r2
        setx  0xbfef3392be02b0c7, %g1, %r3
        setx  0x06edd0252ae59e68, %g1, %r4
        setx  0xd809c4845d62968d, %g1, %r5
        setx  0x57df78444552e512, %g1, %r6
        setx  0x7e7b39804fd56b2b, %g1, %r7
        setx  0x8ec6277b58722613, %g1, %r8
        setx  0x4236343c9754d3c8, %g1, %r9
        setx  0x5828db679bde6fb8, %g1, %r10
        setx  0xd2e8e333d2b10212, %g1, %r11
        setx  0xc622c60e7fefc296, %g1, %r12
        setx  0x61be4531b37af99c, %g1, %r13
        setx  0xc6364ca6adf2ca67, %g1, %r14
        setx  0xec736ea9ad021197, %g1, %r15
        setx  0x428145704f1e4f94, %g1, %r18
        setx  0xc0072ec9b5a0997f, %g1, %r19
        setx  0xeca8bb4b1d4dfbfb, %g1, %r20
        setx  0x1338fde782baf4a6, %g1, %r21
        setx  0xa8c99e081ea2ca4a, %g1, %r22
        setx  0x57514a8c4c36e018, %g1, %r23
        setx  0xef2299adc175cd20, %g1, %r24
        setx  0x21489a46ad26d5dc, %g1, %r25
        setx  0xbdfa3aaa41f7d326, %g1, %r26
        setx  0x575b83f6066ff6b6, %g1, %r27
        setx  0xffd0038e6b7078b2, %g1, %r28
        setx  0x0b97eb751b5d82b8, %g1, %r29
        setx  0x1bbc3f17195deaa1, %g1, %r30
        setx  0xc941b17dc6d4d1fb, %g1, %r31
	save %r0, %r0, %r31
thr3_nuke_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_0), 16, 16)) -> intp(1, 2, 1)
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
	.word 0x8abc228d  ! 1: XNORcc_I	xnorcc 	%r16, 0x028d, %r5
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c040011  ! 1: ADD_R	add 	%r16, %r17, %r6
	.word 0x9c1c263a  ! 1: XOR_I	xor 	%r16, 0x063a, %r14
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
thr3_hw_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_2), 16, 16)) -> intp(0, 0, 1)
	.word 0xb8c42494  ! 1: ADDCcc_I	addccc 	%r16, 0x0494, %r28
	.word 0x9cc42e9c  ! 1: ADDCcc_I	addccc 	%r16, 0x0e9c, %r14
	.word 0xb17c0411  ! 1: MOVR_R	move	%r16, %r17, %r24
thr3_nuke_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_3), 16, 16)) -> intp(0, 2, 1)
	.word 0xad343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r22
thr3_resum_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_4), 16, 16)) -> intp(0, 3, 1)
	.word 0x84b42441  ! 1: ORNcc_I	orncc 	%r16, 0x0441, %r2
thr3_hw_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_5), 16, 16)) -> intp(1, 0, 1)
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x8f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x841c0011  ! 1: XOR_R	xor 	%r16, %r17, %r2
thr3_hw_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_6), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x8cac2599  ! 1: ANDNcc_I	andncc 	%r16, 0x0599, %r6
thr3_nuke_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_7), 16, 16)) -> intp(0, 2, 1)
	.word 0xaec4266c  ! 1: ADDCcc_I	addccc 	%r16, 0x066c, %r23
	.word 0xab7c2401  ! 1: MOVR_I	move	%r16, 0xfffffe6c, %r21
	.word 0xa88424a4  ! 1: ADDcc_I	addcc 	%r16, 0x04a4, %r20
thr3_resum_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_8), 16, 16)) -> intp(0, 3, 1)
	.word 0xb0b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0xaa1c2188  ! 1: XOR_I	xor 	%r16, 0x0188, %r21
	.word 0x82440011  ! 1: ADDC_R	addc 	%r16, %r17, %r1
thr3_nuke_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_9), 16, 16)) -> intp(2, 2, 1)
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
thr3_resum_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_10), 16, 16)) -> intp(2, 3, 1)
	.word 0x829428a9  ! 1: ORcc_I	orcc 	%r16, 0x08a9, %r1
thr3_nuke_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_11), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
	.word 0xa97c2401  ! 1: MOVR_I	move	%r16, 0x11, %r20
	.word 0x889c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0xab343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r21
thr3_resum_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_12), 16, 16)) -> intp(2, 3, 1)
	.word 0xb68c28b1  ! 1: ANDcc_I	andcc 	%r16, 0x08b1, %r27
	.word 0xb29c2546  ! 1: XORcc_I	xorcc 	%r16, 0x0546, %r25
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x969c21f2  ! 1: XORcc_I	xorcc 	%r16, 0x01f2, %r11
thr3_hw_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_13), 16, 16)) -> intp(2, 0, 1)
	.word 0x90c42bd9  ! 1: ADDCcc_I	addccc 	%r16, 0x0bd9, %r8
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x922c22c0  ! 1: ANDN_I	andn 	%r16, 0x02c0, %r9
	.word 0xad643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_14), 16, 16)) -> intp(2, 0, 1)
	.word 0xbaac26ef  ! 1: ANDNcc_I	andncc 	%r16, 0x06ef, %r29
	.word 0x8c8420f6  ! 1: ADDcc_I	addcc 	%r16, 0x00f6, %r6
	.word 0x8a342b96  ! 1: ORN_I	orn 	%r16, 0x0b96, %r5
thr3_nuke_intr_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_15), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0xaa1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r21
	.word 0xb92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r28
	.word 0x8a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r5
thr3_resum_intr_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_16), 16, 16)) -> intp(0, 3, 1)
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
	.word 0x84bc2900  ! 1: XNORcc_I	xnorcc 	%r16, 0x0900, %r2
	.word 0xb7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x96440011  ! 1: ADDC_R	addc 	%r16, %r17, %r11
thr3_nuke_intr_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_17), 16, 16)) -> intp(1, 2, 1)
	.word 0x857c2401  ! 1: MOVR_I	move	%r16, 0x11, %r2
thr3_resum_intr_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_18), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c84298b  ! 1: ADDcc_I	addcc 	%r16, 0x098b, %r6
thr3_nuke_intr_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_19), 16, 16)) -> intp(2, 2, 1)
	.word 0xb83c23e8  ! 1: XNOR_I	xnor 	%r16, 0x03e8, %r28
	.word 0x8c3c2097  ! 1: XNOR_I	xnor 	%r16, 0x0097, %r6
	.word 0x94ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r10
thr3_resum_intr_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_20), 16, 16)) -> intp(2, 3, 1)
	.word 0x82342491  ! 1: ORN_I	orn 	%r16, 0x0491, %r1
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
	.word 0xb32c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r25
thr3_hw_intr_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_21), 16, 16)) -> intp(2, 0, 1)
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
	.word 0x8ab42d9a  ! 1: ORNcc_I	orncc 	%r16, 0x0d9a, %r5
	.word 0xad2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r22
thr3_hw_intr_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_22), 16, 16)) -> intp(1, 0, 1)
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x952c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r10
	.word 0xba040011  ! 1: ADD_R	add 	%r16, %r17, %r29
thr3_hw_intr_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_23), 16, 16)) -> intp(1, 0, 1)
	.word 0xae9c2202  ! 1: XORcc_I	xorcc 	%r16, 0x0202, %r23
thr3_hw_intr_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_24), 16, 16)) -> intp(0, 0, 1)
	.word 0xaac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r21
thr3_nuke_intr_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_25), 16, 16)) -> intp(2, 2, 1)
	.word 0xb22c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r25
	.word 0x8eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r7
thr3_resum_intr_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_26), 16, 16)) -> intp(2, 3, 1)
	.word 0x9f340011  ! 1: SRL_R	srl 	%r16, %r17, %r15
	.word 0x8894230a  ! 1: ORcc_I	orcc 	%r16, 0x030a, %r4
thr3_nuke_intr_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_27), 16, 16)) -> intp(2, 2, 1)
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x9b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r13
thr3_resum_intr_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_28), 16, 16)) -> intp(2, 3, 1)
	.word 0x8ab429c0  ! 1: ORNcc_I	orncc 	%r16, 0x09c0, %r5
	.word 0xb0040011  ! 1: ADD_R	add 	%r16, %r17, %r24
thr3_nuke_intr_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_29), 16, 16)) -> intp(2, 2, 1)
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
	.word 0x8c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r6
	.word 0xb2b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_30), 16, 16)) -> intp(2, 3, 1)
	.word 0xb8140011  ! 1: OR_R	or 	%r16, %r17, %r28
	.word 0x8a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x9e040011  ! 1: ADD_R	add 	%r16, %r17, %r15
thr3_hw_intr_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_31), 16, 16)) -> intp(1, 0, 1)
	.word 0x889c24e3  ! 1: XORcc_I	xorcc 	%r16, 0x04e3, %r4
thr3_hw_intr_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_32), 16, 16)) -> intp(1, 0, 1)
	.word 0xb644238b  ! 1: ADDC_I	addc 	%r16, 0x038b, %r27
	.word 0x8c04258b  ! 1: ADD_I	add 	%r16, 0x058b, %r6
thr3_hw_intr_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_33), 16, 16)) -> intp(2, 0, 1)
	.word 0x993c0011  ! 1: SRA_R	sra 	%r16, %r17, %r12
	.word 0x952c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0xb81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r28
thr3_nuke_intr_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_34), 16, 16)) -> intp(1, 2, 1)
	.word 0x837c0411  ! 1: MOVR_R	move	%r16, %r17, %r1
	.word 0x8c0c2b64  ! 1: AND_I	and 	%r16, 0x0b64, %r6
	.word 0xb3342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x8c0c0011  ! 1: AND_R	and 	%r16, %r17, %r6
thr3_resum_intr_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_35), 16, 16)) -> intp(1, 3, 1)
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x8894273a  ! 1: ORcc_I	orcc 	%r16, 0x073a, %r4
	.word 0x8e0c2810  ! 1: AND_I	and 	%r16, 0x0810, %r7
thr3_hw_intr_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_36), 16, 16)) -> intp(2, 0, 1)
	.word 0x9eb42e20  ! 1: ORNcc_I	orncc 	%r16, 0x0e20, %r15
thr3_nuke_intr_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_37), 16, 16)) -> intp(1, 2, 1)
	.word 0x863c2622  ! 1: XNOR_I	xnor 	%r16, 0x0622, %r3
	.word 0xae8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r23
	.word 0xb5341011  ! 1: SRLX_R	srlx	%r16, %r17, %r26
thr3_resum_intr_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_38), 16, 16)) -> intp(1, 3, 1)
	.word 0x82bc22fc  ! 1: XNORcc_I	xnorcc 	%r16, 0x02fc, %r1
	.word 0x96c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x992c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r12
thr3_hw_intr_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_39), 16, 16)) -> intp(0, 0, 1)
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0xacb42cd8  ! 1: ORNcc_I	orncc 	%r16, 0x0cd8, %r22
	.word 0x823c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x983c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r12
thr3_hw_intr_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_40), 16, 16)) -> intp(2, 0, 1)
	.word 0x87340011  ! 1: SRL_R	srl 	%r16, %r17, %r3
	.word 0x840c2c48  ! 1: AND_I	and 	%r16, 0x0c48, %r2
	.word 0x9f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r15
	.word 0xb08c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r24
thr3_nuke_intr_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_41), 16, 16)) -> intp(0, 2, 1)
	.word 0xb7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0xb834277d  ! 1: ORN_I	orn 	%r16, 0x077d, %r28
	.word 0xaa2c2357  ! 1: ANDN_I	andn 	%r16, 0x0357, %r21
thr3_resum_intr_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_42), 16, 16)) -> intp(0, 3, 1)
	.word 0x9c340011  ! 1: ORN_R	orn 	%r16, %r17, %r14
	.word 0xaa940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x9e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r15
thr3_nuke_intr_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_43), 16, 16)) -> intp(1, 2, 1)
	.word 0x8d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r6
thr3_resum_intr_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_44), 16, 16)) -> intp(1, 3, 1)
	.word 0xa77c2401  ! 1: MOVR_I	move	%r16, 0x11, %r19
thr3_hw_intr_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_45), 16, 16)) -> intp(1, 0, 1)
	.word 0x84840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r2
thr3_hw_intr_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_46), 16, 16)) -> intp(2, 0, 1)
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
thr3_nuke_intr_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_47), 16, 16)) -> intp(0, 2, 1)
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
thr3_resum_intr_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_48), 16, 16)) -> intp(0, 3, 1)
	.word 0x960c2456  ! 1: AND_I	and 	%r16, 0x0456, %r11
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
thr3_hw_intr_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_49), 16, 16)) -> intp(0, 0, 1)
	.word 0xab2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r21
thr3_hw_intr_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_50), 16, 16)) -> intp(2, 0, 1)
	.word 0xb49c214c  ! 1: XORcc_I	xorcc 	%r16, 0x014c, %r26
thr3_nuke_intr_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_51), 16, 16)) -> intp(2, 2, 1)
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
	.word 0x8a84261b  ! 1: ADDcc_I	addcc 	%r16, 0x061b, %r5
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
thr3_resum_intr_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_52), 16, 16)) -> intp(2, 3, 1)
	.word 0xb83c27ad  ! 1: XNOR_I	xnor 	%r16, 0x07ad, %r28
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
	.word 0x877c0411  ! 1: MOVR_R	move	%r16, %r17, %r3
	.word 0x8d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r6
thr3_nuke_intr_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_53), 16, 16)) -> intp(2, 2, 1)
	.word 0xb4140011  ! 1: OR_R	or 	%r16, %r17, %r26
thr3_resum_intr_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_54), 16, 16)) -> intp(2, 3, 1)
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
thr3_hw_intr_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_55), 16, 16)) -> intp(0, 0, 1)
	.word 0xae040011  ! 1: ADD_R	add 	%r16, %r17, %r23
	.word 0x86b42ee7  ! 1: ORNcc_I	orncc 	%r16, 0x0ee7, %r3
	.word 0x933c1011  ! 1: SRAX_R	srax	%r16, %r17, %r9
	.word 0xaa0c0011  ! 1: AND_R	and 	%r16, %r17, %r21
thr3_nuke_intr_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_56), 16, 16)) -> intp(1, 2, 1)
	.word 0x90bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x9f641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_57), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r27
thr3_hw_intr_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_58), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
thr3_nuke_intr_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_59), 16, 16)) -> intp(1, 2, 1)
	.word 0x9d3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x9f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r15
	.word 0xa73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r19
thr3_resum_intr_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_60), 16, 16)) -> intp(1, 3, 1)
	.word 0xab641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa9641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x969c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r11
thr3_nuke_intr_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_61), 16, 16)) -> intp(0, 2, 1)
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
thr3_resum_intr_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_62), 16, 16)) -> intp(0, 3, 1)
	.word 0x97343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r11
thr3_hw_intr_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_63), 16, 16)) -> intp(1, 0, 1)
	.word 0x833c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r1
thr3_nuke_intr_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_64), 16, 16)) -> intp(0, 2, 1)
	.word 0x88440011  ! 1: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x86840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r3
thr3_resum_intr_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_65), 16, 16)) -> intp(0, 3, 1)
	.word 0xa92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r20
	.word 0x94942ba9  ! 1: ORcc_I	orcc 	%r16, 0x0ba9, %r10
thr3_nuke_intr_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_66), 16, 16)) -> intp(0, 2, 1)
	.word 0x9f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r15
	.word 0x8b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r5
	.word 0x9b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r13
thr3_resum_intr_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_67), 16, 16)) -> intp(0, 3, 1)
	.word 0xb33c0011  ! 1: SRA_R	sra 	%r16, %r17, %r25
	.word 0x9e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x820424d1  ! 1: ADD_I	add 	%r16, 0x04d1, %r1
thr3_hw_intr_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_68), 16, 16)) -> intp(2, 0, 1)
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
thr3_hw_intr_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_69), 16, 16)) -> intp(0, 0, 1)
	.word 0x9cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0x9ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r13
thr3_nuke_intr_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_70), 16, 16)) -> intp(2, 2, 1)
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
	.word 0x9c0c2f77  ! 1: AND_I	and 	%r16, 0x0f77, %r14
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
thr3_resum_intr_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_71), 16, 16)) -> intp(2, 3, 1)
	.word 0xb13c0011  ! 1: SRA_R	sra 	%r16, %r17, %r24
	.word 0x8e842768  ! 1: ADDcc_I	addcc 	%r16, 0x0768, %r7
	.word 0x9b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r13
thr3_nuke_intr_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_72), 16, 16)) -> intp(0, 2, 1)
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0xb92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r28
thr3_resum_intr_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_73), 16, 16)) -> intp(0, 3, 1)
	.word 0xa8040011  ! 1: ADD_R	add 	%r16, %r17, %r20
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
thr3_hw_intr_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_74), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x85641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_75), 16, 16)) -> intp(1, 2, 1)
	.word 0x93342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x900c2794  ! 1: AND_I	and 	%r16, 0x0794, %r8
thr3_resum_intr_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_76), 16, 16)) -> intp(1, 3, 1)
	.word 0x89641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
thr3_hw_intr_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_77), 16, 16)) -> intp(2, 0, 1)
	.word 0x98140011  ! 1: OR_R	or 	%r16, %r17, %r12
	.word 0xb60c0011  ! 1: AND_R	and 	%r16, %r17, %r27
	.word 0xb4c426a3  ! 1: ADDCcc_I	addccc 	%r16, 0x06a3, %r26
	.word 0x9e340011  ! 1: ORN_R	orn 	%r16, %r17, %r15
thr3_hw_intr_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_78), 16, 16)) -> intp(0, 0, 1)
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
	.word 0x973c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0xb23c2d7e  ! 1: XNOR_I	xnor 	%r16, 0x0d7e, %r25
thr3_nuke_intr_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_79), 16, 16)) -> intp(2, 2, 1)
	.word 0xaa142efe  ! 1: OR_I	or 	%r16, 0x0efe, %r21
thr3_resum_intr_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_80), 16, 16)) -> intp(2, 3, 1)
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
thr3_hw_intr_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_81), 16, 16)) -> intp(1, 0, 1)
	.word 0xa80c0011  ! 1: AND_R	and 	%r16, %r17, %r20
	.word 0x9e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
thr3_hw_intr_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_82), 16, 16)) -> intp(1, 0, 1)
	.word 0x8b7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r5
	.word 0xac9c2a77  ! 1: XORcc_I	xorcc 	%r16, 0x0a77, %r22
	.word 0x9c142ba4  ! 1: OR_I	or 	%r16, 0x0ba4, %r14
thr3_nuke_intr_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_83), 16, 16)) -> intp(1, 2, 1)
	.word 0x988c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0xb44427ab  ! 1: ADDC_I	addc 	%r16, 0x07ab, %r26
	.word 0x86442adf  ! 1: ADDC_I	addc 	%r16, 0x0adf, %r3
thr3_resum_intr_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_84), 16, 16)) -> intp(1, 3, 1)
	.word 0x8c442193  ! 1: ADDC_I	addc 	%r16, 0x0193, %r6
	.word 0xbb641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xaa1c2968  ! 1: XOR_I	xor 	%r16, 0x0968, %r21
thr3_hw_intr_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_85), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c142673  ! 1: OR_I	or 	%r16, 0x0673, %r6
	.word 0x87643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0x920c2b0c  ! 1: AND_I	and 	%r16, 0x0b0c, %r9
thr3_hw_intr_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_86), 16, 16)) -> intp(0, 0, 1)
	.word 0xb43c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x9e042e9f  ! 1: ADD_I	add 	%r16, 0x0e9f, %r15
	.word 0x863c21e6  ! 1: XNOR_I	xnor 	%r16, 0x01e6, %r3
thr3_nuke_intr_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_87), 16, 16)) -> intp(0, 2, 1)
	.word 0x82b42e3f  ! 1: ORNcc_I	orncc 	%r16, 0x0e3f, %r1
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
	.word 0x8b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r5
	.word 0x952c0011  ! 1: SLL_R	sll 	%r16, %r17, %r10
thr3_resum_intr_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_88), 16, 16)) -> intp(0, 3, 1)
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
	.word 0x9c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r14
	.word 0xa8040011  ! 1: ADD_R	add 	%r16, %r17, %r20
	.word 0x88142835  ! 1: OR_I	or 	%r16, 0x0835, %r4
thr3_hw_intr_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_89), 16, 16)) -> intp(2, 0, 1)
	.word 0x897c2401  ! 1: MOVR_I	move	%r16, 0x835, %r4
thr3_hw_intr_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_90), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e34286d  ! 1: ORN_I	orn 	%r16, 0x086d, %r7
	.word 0xae0c0011  ! 1: AND_R	and 	%r16, %r17, %r23
	.word 0x9404240a  ! 1: ADD_I	add 	%r16, 0x040a, %r10
thr3_nuke_intr_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_91), 16, 16)) -> intp(2, 2, 1)
	.word 0x869c2cf1  ! 1: XORcc_I	xorcc 	%r16, 0x0cf1, %r3
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
	.word 0x820c298c  ! 1: AND_I	and 	%r16, 0x098c, %r1
thr3_resum_intr_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_92), 16, 16)) -> intp(2, 3, 1)
	.word 0xb9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x868c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x88b42e98  ! 1: ORNcc_I	orncc 	%r16, 0x0e98, %r4
thr3_nuke_intr_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_93), 16, 16)) -> intp(1, 2, 1)
	.word 0xb9641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_94), 16, 16)) -> intp(1, 3, 1)
	.word 0x9e1428f0  ! 1: OR_I	or 	%r16, 0x08f0, %r15
thr3_nuke_intr_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_95), 16, 16)) -> intp(1, 2, 1)
	.word 0xb40424d4  ! 1: ADD_I	add 	%r16, 0x04d4, %r26
thr3_resum_intr_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_96), 16, 16)) -> intp(1, 3, 1)
	.word 0xa63c2c9c  ! 1: XNOR_I	xnor 	%r16, 0x0c9c, %r19
thr3_nuke_intr_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_97), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c2c2c32  ! 1: ANDN_I	andn 	%r16, 0x0c32, %r6
	.word 0xaa340011  ! 1: ORN_R	orn 	%r16, %r17, %r21
	.word 0x9d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r14
thr3_resum_intr_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_98), 16, 16)) -> intp(2, 3, 1)
	.word 0x92c42002  ! 1: ADDCcc_I	addccc 	%r16, 0x0002, %r9
	.word 0xb6340011  ! 1: ORN_R	orn 	%r16, %r17, %r27
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
thr3_nuke_intr_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_99), 16, 16)) -> intp(2, 2, 1)
	.word 0x9eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x96ac2960  ! 1: ANDNcc_I	andncc 	%r16, 0x0960, %r11
	.word 0xbabc2ef8  ! 1: XNORcc_I	xnorcc 	%r16, 0x0ef8, %r29
thr3_resum_intr_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_100), 16, 16)) -> intp(2, 3, 1)
	.word 0x829c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x89341011  ! 1: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x92340011  ! 1: ORN_R	orn 	%r16, %r17, %r9
	.word 0x983c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r12
thr3_hw_intr_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_101), 16, 16)) -> intp(2, 0, 1)
	.word 0xac040011  ! 1: ADD_R	add 	%r16, %r17, %r22
	.word 0x820c0011  ! 1: AND_R	and 	%r16, %r17, %r1
	.word 0x88140011  ! 1: OR_R	or 	%r16, %r17, %r4
	.word 0xaa0c2181  ! 1: AND_I	and 	%r16, 0x0181, %r21
thr3_nuke_intr_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_102), 16, 16)) -> intp(2, 2, 1)
	.word 0x9d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r14
	.word 0x9ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x8e340011  ! 1: ORN_R	orn 	%r16, %r17, %r7
	.word 0xa7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r19
thr3_resum_intr_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_103), 16, 16)) -> intp(2, 3, 1)
	.word 0x8d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x8e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r7
	.word 0xb69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0xaf7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r23
thr3_nuke_intr_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_104), 16, 16)) -> intp(0, 2, 1)
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
	.word 0xbb341011  ! 1: SRLX_R	srlx	%r16, %r17, %r29
thr3_resum_intr_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_105), 16, 16)) -> intp(0, 3, 1)
	.word 0xae940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0xb17c2401  ! 1: MOVR_I	move	%r16, 0x11, %r24
thr3_hw_intr_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_106), 16, 16)) -> intp(1, 0, 1)
	.word 0x893c1011  ! 1: SRAX_R	srax	%r16, %r17, %r4
	.word 0x96b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r11
thr3_nuke_intr_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_107), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8842db7  ! 1: ADDcc_I	addcc 	%r16, 0x0db7, %r20
thr3_resum_intr_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_108), 16, 16)) -> intp(1, 3, 1)
	.word 0xb41c0011  ! 1: XOR_R	xor 	%r16, %r17, %r26
thr3_nuke_intr_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_109), 16, 16)) -> intp(0, 2, 1)
	.word 0xb8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r28
thr3_resum_intr_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_110), 16, 16)) -> intp(0, 3, 1)
	.word 0xa6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r19
thr3_hw_intr_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_111), 16, 16)) -> intp(2, 0, 1)
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
	.word 0xaac42aab  ! 1: ADDCcc_I	addccc 	%r16, 0x0aab, %r21
thr3_nuke_intr_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_112), 16, 16)) -> intp(2, 2, 1)
	.word 0xb3340011  ! 1: SRL_R	srl 	%r16, %r17, %r25
	.word 0x902c2e45  ! 1: ANDN_I	andn 	%r16, 0x0e45, %r8
	.word 0x9f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r15
thr3_resum_intr_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_113), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e8c287d  ! 1: ANDcc_I	andcc 	%r16, 0x087d, %r15
	.word 0x8cc42d2d  ! 1: ADDCcc_I	addccc 	%r16, 0x0d2d, %r6
	.word 0xa83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r20
thr3_hw_intr_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_114), 16, 16)) -> intp(1, 0, 1)
	.word 0xaeb42dce  ! 1: ORNcc_I	orncc 	%r16, 0x0dce, %r23
thr3_hw_intr_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_115), 16, 16)) -> intp(0, 0, 1)
	.word 0xb52c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xb77c2401  ! 1: MOVR_I	move	%r16, 0x1, %r27
	.word 0x8c0c0011  ! 1: AND_R	and 	%r16, %r17, %r6
thr3_hw_intr_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_116), 16, 16)) -> intp(2, 0, 1)
	.word 0xacac28c9  ! 1: ANDNcc_I	andncc 	%r16, 0x08c9, %r22
	.word 0x8c040011  ! 1: ADD_R	add 	%r16, %r17, %r6
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
	.word 0x964424c9  ! 1: ADDC_I	addc 	%r16, 0x04c9, %r11
thr3_hw_intr_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_117), 16, 16)) -> intp(1, 0, 1)
	.word 0xb0ac2e99  ! 1: ANDNcc_I	andncc 	%r16, 0x0e99, %r24
	.word 0x9e9424af  ! 1: ORcc_I	orcc 	%r16, 0x04af, %r15
thr3_hw_intr_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_118), 16, 16)) -> intp(0, 0, 1)
	.word 0x828c2ca8  ! 1: ANDcc_I	andcc 	%r16, 0x0ca8, %r1
	.word 0x853c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r2
thr3_hw_intr_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_119), 16, 16)) -> intp(0, 0, 1)
	.word 0x9804289d  ! 1: ADD_I	add 	%r16, 0x089d, %r12
	.word 0x93343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0xb2140011  ! 1: OR_R	or 	%r16, %r17, %r25
	.word 0xb13c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r24
thr3_nuke_intr_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_120), 16, 16)) -> intp(2, 2, 1)
	.word 0xac0c24c2  ! 1: AND_I	and 	%r16, 0x04c2, %r22
	.word 0x9c9427c7  ! 1: ORcc_I	orcc 	%r16, 0x07c7, %r14
thr3_resum_intr_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_121), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c3420f7  ! 1: ORN_I	orn 	%r16, 0x00f7, %r6
	.word 0x841c0011  ! 1: XOR_R	xor 	%r16, %r17, %r2
thr3_hw_intr_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_122), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r29
thr3_nuke_intr_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_123), 16, 16)) -> intp(0, 2, 1)
	.word 0x9f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0xb6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r27
thr3_resum_intr_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_124), 16, 16)) -> intp(0, 3, 1)
	.word 0xa8c4206e  ! 1: ADDCcc_I	addccc 	%r16, 0x006e, %r20
	.word 0xb81c0011  ! 1: XOR_R	xor 	%r16, %r17, %r28
thr3_nuke_intr_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_125), 16, 16)) -> intp(2, 2, 1)
	.word 0xb52c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xaa9c24de  ! 1: XORcc_I	xorcc 	%r16, 0x04de, %r21
	.word 0x8cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
thr3_resum_intr_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_126), 16, 16)) -> intp(2, 3, 1)
	.word 0x842c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x857c0411  ! 1: MOVR_R	move	%r16, %r17, %r2
	.word 0xac0c2050  ! 1: AND_I	and 	%r16, 0x0050, %r22
	.word 0x9c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r14
thr3_hw_intr_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_127), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x9abc24b9  ! 1: XNORcc_I	xnorcc 	%r16, 0x04b9, %r13
	.word 0x8a0c0011  ! 1: AND_R	and 	%r16, %r17, %r5
thr3_nuke_intr_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_128), 16, 16)) -> intp(2, 2, 1)
	.word 0xb20c2a3b  ! 1: AND_I	and 	%r16, 0x0a3b, %r25
	.word 0x9b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r13
thr3_resum_intr_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_129), 16, 16)) -> intp(2, 3, 1)
	.word 0xa63c2aaa  ! 1: XNOR_I	xnor 	%r16, 0x0aaa, %r19
	.word 0x972c0011  ! 1: SLL_R	sll 	%r16, %r17, %r11
thr3_nuke_intr_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_130), 16, 16)) -> intp(0, 2, 1)
	.word 0x9c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r14
thr3_resum_intr_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_131), 16, 16)) -> intp(0, 3, 1)
	.word 0x9cc42400  ! 1: ADDCcc_I	addccc 	%r16, 0x0400, %r14
thr3_hw_intr_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_132), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x85641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_133), 16, 16)) -> intp(0, 2, 1)
	.word 0xad3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x84340011  ! 1: ORN_R	orn 	%r16, %r17, %r2
thr3_resum_intr_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_134), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb340011  ! 1: SRL_R	srl 	%r16, %r17, %r29
	.word 0x8f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r7
	.word 0xb83c2572  ! 1: XNOR_I	xnor 	%r16, 0x0572, %r28
	.word 0x98140011  ! 1: OR_R	or 	%r16, %r17, %r12
thr3_nuke_intr_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_135), 16, 16)) -> intp(2, 2, 1)
	.word 0x909c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r8
thr3_resum_intr_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_136), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r15
thr3_nuke_intr_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_137), 16, 16)) -> intp(0, 2, 1)
	.word 0x977c2401  ! 1: MOVR_I	move	%r16, 0x11, %r11
	.word 0x9e142fca  ! 1: OR_I	or 	%r16, 0x0fca, %r15
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
thr3_resum_intr_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_138), 16, 16)) -> intp(0, 3, 1)
	.word 0x8a142faa  ! 1: OR_I	or 	%r16, 0x0faa, %r5
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xac040011  ! 1: ADD_R	add 	%r16, %r17, %r22
thr3_hw_intr_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_139), 16, 16)) -> intp(2, 0, 1)
	.word 0x92bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r9
thr3_hw_intr_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_140), 16, 16)) -> intp(1, 0, 1)
	.word 0x93643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa814207a  ! 1: OR_I	or 	%r16, 0x007a, %r20
thr3_hw_intr_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_141), 16, 16)) -> intp(1, 0, 1)
	.word 0x91340011  ! 1: SRL_R	srl 	%r16, %r17, %r8
	.word 0xb23c2920  ! 1: XNOR_I	xnor 	%r16, 0x0920, %r25
	.word 0x9ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
thr3_hw_intr_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_142), 16, 16)) -> intp(2, 0, 1)
	.word 0x94bc2418  ! 1: XNORcc_I	xnorcc 	%r16, 0x0418, %r10
thr3_nuke_intr_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_143), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r5
	.word 0x8d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
	.word 0x8e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r7
thr3_resum_intr_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_144), 16, 16)) -> intp(0, 3, 1)
	.word 0xa72c0011  ! 1: SLL_R	sll 	%r16, %r17, %r19
	.word 0xab7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r21
	.word 0x983c26d5  ! 1: XNOR_I	xnor 	%r16, 0x06d5, %r12
	.word 0x8b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r5
thr3_hw_intr_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_145), 16, 16)) -> intp(0, 0, 1)
	.word 0x822c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x82c42318  ! 1: ADDCcc_I	addccc 	%r16, 0x0318, %r1
thr3_hw_intr_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_146), 16, 16)) -> intp(2, 0, 1)
	.word 0xb0940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
thr3_nuke_intr_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_147), 16, 16)) -> intp(2, 2, 1)
	.word 0x82b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
thr3_resum_intr_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_148), 16, 16)) -> intp(2, 3, 1)
	.word 0x8f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
thr3_hw_intr_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_149), 16, 16)) -> intp(2, 0, 1)
	.word 0x90042d26  ! 1: ADD_I	add 	%r16, 0x0d26, %r8
	.word 0xb8bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0x8a0c0011  ! 1: AND_R	and 	%r16, %r17, %r5
thr3_hw_intr_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_150), 16, 16)) -> intp(1, 0, 1)
	.word 0xb6ac2007  ! 1: ANDNcc_I	andncc 	%r16, 0x0007, %r27
	.word 0x820c2ced  ! 1: AND_I	and 	%r16, 0x0ced, %r1
thr3_hw_intr_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_151), 16, 16)) -> intp(2, 0, 1)
	.word 0xb6840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0x8f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r7
thr3_nuke_intr_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_152), 16, 16)) -> intp(2, 2, 1)
	.word 0x948c2386  ! 1: ANDcc_I	andcc 	%r16, 0x0386, %r10
	.word 0x953c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x8d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r6
	.word 0x8d643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_153), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
	.word 0x86b42739  ! 1: ORNcc_I	orncc 	%r16, 0x0739, %r3
	.word 0x941c0011  ! 1: XOR_R	xor 	%r16, %r17, %r10
	.word 0x83643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_154), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r29
	.word 0xb0140011  ! 1: OR_R	or 	%r16, %r17, %r24
thr3_nuke_intr_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_155), 16, 16)) -> intp(2, 2, 1)
	.word 0xb8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r28
thr3_resum_intr_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_156), 16, 16)) -> intp(2, 3, 1)
	.word 0x864423a7  ! 1: ADDC_I	addc 	%r16, 0x03a7, %r3
thr3_nuke_intr_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_157), 16, 16)) -> intp(1, 2, 1)
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
thr3_resum_intr_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_158), 16, 16)) -> intp(1, 3, 1)
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
thr3_nuke_intr_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_159), 16, 16)) -> intp(1, 2, 1)
	.word 0x872c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x9c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r14
thr3_resum_intr_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_160), 16, 16)) -> intp(1, 3, 1)
	.word 0x943c2e93  ! 1: XNOR_I	xnor 	%r16, 0x0e93, %r10
	.word 0xb6842f5d  ! 1: ADDcc_I	addcc 	%r16, 0x0f5d, %r27
	.word 0x8e942364  ! 1: ORcc_I	orcc 	%r16, 0x0364, %r7
thr3_hw_intr_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_161), 16, 16)) -> intp(1, 0, 1)
	.word 0xac440011  ! 1: ADDC_R	addc 	%r16, %r17, %r22
thr3_nuke_intr_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_162), 16, 16)) -> intp(1, 2, 1)
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
thr3_resum_intr_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_163), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_164), 16, 16)) -> intp(1, 0, 1)
	.word 0x9e8c2a0c  ! 1: ANDcc_I	andcc 	%r16, 0x0a0c, %r15
	.word 0x9cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0xa89c2825  ! 1: XORcc_I	xorcc 	%r16, 0x0825, %r20
	.word 0x8abc2beb  ! 1: XNORcc_I	xnorcc 	%r16, 0x0beb, %r5
thr3_nuke_intr_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_165), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e0c2251  ! 1: AND_I	and 	%r16, 0x0251, %r15
thr3_resum_intr_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_166), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e9423d0  ! 1: ORcc_I	orcc 	%r16, 0x03d0, %r7
thr3_hw_intr_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_167), 16, 16)) -> intp(1, 0, 1)
	.word 0x943c2b44  ! 1: XNOR_I	xnor 	%r16, 0x0b44, %r10
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
thr3_hw_intr_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_168), 16, 16)) -> intp(1, 0, 1)
	.word 0x833c1011  ! 1: SRAX_R	srax	%r16, %r17, %r1
thr3_nuke_intr_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_169), 16, 16)) -> intp(1, 2, 1)
	.word 0x9ebc23c1  ! 1: XNORcc_I	xnorcc 	%r16, 0x03c1, %r15
	.word 0xb41c0011  ! 1: XOR_R	xor 	%r16, %r17, %r26
	.word 0xb4940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r26
thr3_resum_intr_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_170), 16, 16)) -> intp(1, 3, 1)
	.word 0x957c0411  ! 1: MOVR_R	move	%r16, %r17, %r10
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xb6042c61  ! 1: ADD_I	add 	%r16, 0x0c61, %r27
thr3_hw_intr_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_171), 16, 16)) -> intp(2, 0, 1)
	.word 0xb48c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
thr3_nuke_intr_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_172), 16, 16)) -> intp(1, 2, 1)
	.word 0xb52c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0x8ac4295f  ! 1: ADDCcc_I	addccc 	%r16, 0x095f, %r5
thr3_resum_intr_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_173), 16, 16)) -> intp(1, 3, 1)
	.word 0xaeac240f  ! 1: ANDNcc_I	andncc 	%r16, 0x040f, %r23
	.word 0x8e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r7
thr3_nuke_intr_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_174), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e842244  ! 1: ADDcc_I	addcc 	%r16, 0x0244, %r7
	.word 0xaec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r23
thr3_resum_intr_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_175), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r7
	.word 0x853c1011  ! 1: SRAX_R	srax	%r16, %r17, %r2
thr3_hw_intr_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_176), 16, 16)) -> intp(0, 0, 1)
	.word 0x9cbc2a79  ! 1: XNORcc_I	xnorcc 	%r16, 0x0a79, %r14
thr3_nuke_intr_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_177), 16, 16)) -> intp(0, 2, 1)
	.word 0x92c42776  ! 1: ADDCcc_I	addccc 	%r16, 0x0776, %r9
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
thr3_resum_intr_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_178), 16, 16)) -> intp(0, 3, 1)
	.word 0x8c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r6
	.word 0x94442928  ! 1: ADDC_I	addc 	%r16, 0x0928, %r10
thr3_nuke_intr_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_179), 16, 16)) -> intp(2, 2, 1)
	.word 0xb6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r27
	.word 0xb2140011  ! 1: OR_R	or 	%r16, %r17, %r25
thr3_resum_intr_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_180), 16, 16)) -> intp(2, 3, 1)
	.word 0xaa142d5a  ! 1: OR_I	or 	%r16, 0x0d5a, %r21
	.word 0x833c0011  ! 1: SRA_R	sra 	%r16, %r17, %r1
thr3_hw_intr_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_181), 16, 16)) -> intp(1, 0, 1)
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x989c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r12
thr3_nuke_intr_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_182), 16, 16)) -> intp(2, 2, 1)
	.word 0x9034297f  ! 1: ORN_I	orn 	%r16, 0x097f, %r8
	.word 0x98ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r12
thr3_resum_intr_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_183), 16, 16)) -> intp(2, 3, 1)
	.word 0x92842d35  ! 1: ADDcc_I	addcc 	%r16, 0x0d35, %r9
	.word 0x91340011  ! 1: SRL_R	srl 	%r16, %r17, %r8
thr3_nuke_intr_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_184), 16, 16)) -> intp(0, 2, 1)
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x91340011  ! 1: SRL_R	srl 	%r16, %r17, %r8
	.word 0xb4b426b6  ! 1: ORNcc_I	orncc 	%r16, 0x06b6, %r26
thr3_resum_intr_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_185), 16, 16)) -> intp(0, 3, 1)
	.word 0xb61c2fbb  ! 1: XOR_I	xor 	%r16, 0x0fbb, %r27
	.word 0x86bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x8ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r5
thr3_hw_intr_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_186), 16, 16)) -> intp(1, 0, 1)
	.word 0xb53c1011  ! 1: SRAX_R	srax	%r16, %r17, %r26
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r13
thr3_nuke_intr_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_187), 16, 16)) -> intp(2, 2, 1)
	.word 0xb52c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r26
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0xb22c234e  ! 1: ANDN_I	andn 	%r16, 0x034e, %r25
thr3_resum_intr_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_188), 16, 16)) -> intp(2, 3, 1)
	.word 0x8f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r7
	.word 0xaa8c2241  ! 1: ANDcc_I	andcc 	%r16, 0x0241, %r21
	.word 0xac9c2f1e  ! 1: XORcc_I	xorcc 	%r16, 0x0f1e, %r22
thr3_nuke_intr_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_189), 16, 16)) -> intp(2, 2, 1)
	.word 0x988c25f5  ! 1: ANDcc_I	andcc 	%r16, 0x05f5, %r12
	.word 0x96bc2e5d  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e5d, %r11
	.word 0x9ac4287a  ! 1: ADDCcc_I	addccc 	%r16, 0x087a, %r13
	.word 0xa8ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r20
thr3_resum_intr_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_190), 16, 16)) -> intp(2, 3, 1)
	.word 0xb0bc27c4  ! 1: XNORcc_I	xnorcc 	%r16, 0x07c4, %r24
	.word 0x8d340011  ! 1: SRL_R	srl 	%r16, %r17, %r6
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0xa6040011  ! 1: ADD_R	add 	%r16, %r17, %r19
thr3_nuke_intr_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_191), 16, 16)) -> intp(0, 2, 1)
	.word 0xb83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0x9a8c2784  ! 1: ANDcc_I	andcc 	%r16, 0x0784, %r13
thr3_resum_intr_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_192), 16, 16)) -> intp(0, 3, 1)
	.word 0x88bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0x9a3c2d87  ! 1: XNOR_I	xnor 	%r16, 0x0d87, %r13
thr3_nuke_intr_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_193), 16, 16)) -> intp(2, 2, 1)
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xb4ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0x862c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r3
thr3_resum_intr_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_194), 16, 16)) -> intp(2, 3, 1)
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
	.word 0x88140011  ! 1: OR_R	or 	%r16, %r17, %r4
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
thr3_nuke_intr_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_195), 16, 16)) -> intp(2, 2, 1)
	.word 0xb72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r27
	.word 0xba9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r29
	.word 0x96b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0x8ebc238c  ! 1: XNORcc_I	xnorcc 	%r16, 0x038c, %r7
thr3_resum_intr_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_196), 16, 16)) -> intp(2, 3, 1)
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xab2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x923420c9  ! 1: ORN_I	orn 	%r16, 0x00c9, %r9
	.word 0x9aac2d72  ! 1: ANDNcc_I	andncc 	%r16, 0x0d72, %r13
thr3_nuke_intr_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_197), 16, 16)) -> intp(0, 2, 1)
	.word 0x9d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r14
	.word 0x86340011  ! 1: ORN_R	orn 	%r16, %r17, %r3
thr3_resum_intr_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_198), 16, 16)) -> intp(0, 3, 1)
	.word 0x992c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x9ec42c80  ! 1: ADDCcc_I	addccc 	%r16, 0x0c80, %r15
thr3_hw_intr_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_199), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
	.word 0xb20c0011  ! 1: AND_R	and 	%r16, %r17, %r25
thr3_nuke_intr_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_200), 16, 16)) -> intp(1, 2, 1)
	.word 0x989427ee  ! 1: ORcc_I	orcc 	%r16, 0x07ee, %r12
thr3_resum_intr_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_201), 16, 16)) -> intp(1, 3, 1)
	.word 0xa8140011  ! 1: OR_R	or 	%r16, %r17, %r20
thr3_hw_intr_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_202), 16, 16)) -> intp(0, 0, 1)
	.word 0xa6ac28e9  ! 1: ANDNcc_I	andncc 	%r16, 0x08e9, %r19
	.word 0x95641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_203), 16, 16)) -> intp(2, 2, 1)
	.word 0x8d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x8c2c27c5  ! 1: ANDN_I	andn 	%r16, 0x07c5, %r6
	.word 0x85343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0xac0c2e7e  ! 1: AND_I	and 	%r16, 0x0e7e, %r22
thr3_resum_intr_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_204), 16, 16)) -> intp(2, 3, 1)
	.word 0xa92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0x957c2401  ! 1: MOVR_I	move	%r16, 0x1, %r10
	.word 0x8a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x8b641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_205), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c8c253e  ! 1: ANDcc_I	andcc 	%r16, 0x053e, %r6
	.word 0x8b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r5
	.word 0xa93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r20
thr3_resum_intr_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_206), 16, 16)) -> intp(1, 3, 1)
	.word 0x88ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
	.word 0x91643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_207), 16, 16)) -> intp(1, 0, 1)
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
	.word 0x8f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r7
thr3_nuke_intr_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_208), 16, 16)) -> intp(0, 2, 1)
	.word 0x952c0011  ! 1: SLL_R	sll 	%r16, %r17, %r10
	.word 0x8e140011  ! 1: OR_R	or 	%r16, %r17, %r7
	.word 0xba0c2b79  ! 1: AND_I	and 	%r16, 0x0b79, %r29
thr3_resum_intr_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_209), 16, 16)) -> intp(0, 3, 1)
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
	.word 0x94942f73  ! 1: ORcc_I	orcc 	%r16, 0x0f73, %r10
	.word 0xae940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r23
thr3_nuke_intr_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_210), 16, 16)) -> intp(2, 2, 1)
	.word 0xad7c0411  ! 1: MOVR_R	move	%r16, %r17, %r22
	.word 0xa92c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r20
thr3_resum_intr_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_211), 16, 16)) -> intp(2, 3, 1)
	.word 0x91641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xbab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r29
thr3_hw_intr_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_212), 16, 16)) -> intp(0, 0, 1)
	.word 0x917c0411  ! 1: MOVR_R	move	%r16, %r17, %r8
	.word 0x8d643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_213), 16, 16)) -> intp(0, 0, 1)
	.word 0xab7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r21
	.word 0xb32c0011  ! 1: SLL_R	sll 	%r16, %r17, %r25
	.word 0x9e4421a3  ! 1: ADDC_I	addc 	%r16, 0x01a3, %r15
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
thr3_hw_intr_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_214), 16, 16)) -> intp(1, 0, 1)
	.word 0xaf2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r23
	.word 0x8d3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r6
	.word 0x8a14222c  ! 1: OR_I	or 	%r16, 0x022c, %r5
	.word 0xa6340011  ! 1: ORN_R	orn 	%r16, %r17, %r19
thr3_hw_intr_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_215), 16, 16)) -> intp(0, 0, 1)
	.word 0x88040011  ! 1: ADD_R	add 	%r16, %r17, %r4
	.word 0x9c140011  ! 1: OR_R	or 	%r16, %r17, %r14
thr3_nuke_intr_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_216), 16, 16)) -> intp(0, 2, 1)
	.word 0xb21c0011  ! 1: XOR_R	xor 	%r16, %r17, %r25
thr3_resum_intr_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_217), 16, 16)) -> intp(0, 3, 1)
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
thr3_hw_intr_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_218), 16, 16)) -> intp(2, 0, 1)
	.word 0x9e942c2c  ! 1: ORcc_I	orcc 	%r16, 0x0c2c, %r15
	.word 0x86c4299b  ! 1: ADDCcc_I	addccc 	%r16, 0x099b, %r3
	.word 0xa7340011  ! 1: SRL_R	srl 	%r16, %r17, %r19
	.word 0x962c2e83  ! 1: ANDN_I	andn 	%r16, 0x0e83, %r11
thr3_nuke_intr_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_219), 16, 16)) -> intp(0, 2, 1)
	.word 0x860428bc  ! 1: ADD_I	add 	%r16, 0x08bc, %r3
	.word 0x8e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r7
thr3_resum_intr_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_220), 16, 16)) -> intp(0, 3, 1)
	.word 0x86342c4d  ! 1: ORN_I	orn 	%r16, 0x0c4d, %r3
	.word 0xb2940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r25
thr3_nuke_intr_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_221), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
thr3_resum_intr_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_222), 16, 16)) -> intp(1, 3, 1)
	.word 0x93341011  ! 1: SRLX_R	srlx	%r16, %r17, %r9
thr3_nuke_intr_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_223), 16, 16)) -> intp(1, 2, 1)
	.word 0x9c9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x873c1011  ! 1: SRAX_R	srax	%r16, %r17, %r3
	.word 0x8e140011  ! 1: OR_R	or 	%r16, %r17, %r7
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
thr3_resum_intr_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_224), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r7
	.word 0x85341011  ! 1: SRLX_R	srlx	%r16, %r17, %r2
	.word 0xad2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r22
	.word 0x820c0011  ! 1: AND_R	and 	%r16, %r17, %r1
thr3_nuke_intr_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_225), 16, 16)) -> intp(0, 2, 1)
	.word 0xba340011  ! 1: ORN_R	orn 	%r16, %r17, %r29
	.word 0x8b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r5
thr3_resum_intr_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_226), 16, 16)) -> intp(0, 3, 1)
	.word 0xaec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
thr3_nuke_intr_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_227), 16, 16)) -> intp(1, 2, 1)
	.word 0x942c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x997c2401  ! 1: MOVR_I	move	%r16, 0x11, %r12
thr3_resum_intr_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_228), 16, 16)) -> intp(1, 3, 1)
	.word 0xb89425ba  ! 1: ORcc_I	orcc 	%r16, 0x05ba, %r28
	.word 0xb6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r27
thr3_hw_intr_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_229), 16, 16)) -> intp(0, 0, 1)
	.word 0x98842616  ! 1: ADDcc_I	addcc 	%r16, 0x0616, %r12
thr3_hw_intr_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_230), 16, 16)) -> intp(2, 0, 1)
	.word 0xb02c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r24
	.word 0xac142bd1  ! 1: OR_I	or 	%r16, 0x0bd1, %r22
	.word 0x908c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r8
thr3_nuke_intr_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_231), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0x8f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r7
	.word 0x9d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r14
	.word 0xa62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r19
thr3_resum_intr_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_232), 16, 16)) -> intp(0, 3, 1)
	.word 0x9a9c2bbc  ! 1: XORcc_I	xorcc 	%r16, 0x0bbc, %r13
	.word 0xb0042cc0  ! 1: ADD_I	add 	%r16, 0x0cc0, %r24
	.word 0x963c2ec0  ! 1: XNOR_I	xnor 	%r16, 0x0ec0, %r11
	.word 0x852c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r2
thr3_hw_intr_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_233), 16, 16)) -> intp(1, 0, 1)
	.word 0x969c262f  ! 1: XORcc_I	xorcc 	%r16, 0x062f, %r11
	.word 0x8b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r5
thr3_hw_intr_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_234), 16, 16)) -> intp(1, 0, 1)
	.word 0x98bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x8e140011  ! 1: OR_R	or 	%r16, %r17, %r7
thr3_nuke_intr_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_235), 16, 16)) -> intp(2, 2, 1)
	.word 0xae1c2b84  ! 1: XOR_I	xor 	%r16, 0x0b84, %r23
	.word 0xbb641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_236), 16, 16)) -> intp(2, 3, 1)
	.word 0x857c0411  ! 1: MOVR_R	move	%r16, %r17, %r2
	.word 0x908c2f32  ! 1: ANDcc_I	andcc 	%r16, 0x0f32, %r8
thr3_hw_intr_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_237), 16, 16)) -> intp(2, 0, 1)
	.word 0xaa44225c  ! 1: ADDC_I	addc 	%r16, 0x025c, %r21
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
thr3_nuke_intr_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_238), 16, 16)) -> intp(0, 2, 1)
	.word 0x87343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x9d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r14
thr3_resum_intr_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_239), 16, 16)) -> intp(0, 3, 1)
	.word 0x962c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r11
	.word 0x9f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r15
thr3_nuke_intr_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_240), 16, 16)) -> intp(2, 2, 1)
	.word 0x8d3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r6
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
thr3_resum_intr_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_241), 16, 16)) -> intp(2, 3, 1)
	.word 0x8a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x9ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r13
thr3_nuke_intr_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_242), 16, 16)) -> intp(1, 2, 1)
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0xa62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r19
	.word 0x872c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r3
	.word 0xa60c0011  ! 1: AND_R	and 	%r16, %r17, %r19
thr3_resum_intr_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_243), 16, 16)) -> intp(1, 3, 1)
	.word 0xac042fb5  ! 1: ADD_I	add 	%r16, 0x0fb5, %r22
	.word 0x853c1011  ! 1: SRAX_R	srax	%r16, %r17, %r2
	.word 0xa80c212e  ! 1: AND_I	and 	%r16, 0x012e, %r20
	.word 0xae2c2841  ! 1: ANDN_I	andn 	%r16, 0x0841, %r23
thr3_nuke_intr_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_244), 16, 16)) -> intp(0, 2, 1)
	.word 0x94bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x8a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
thr3_resum_intr_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_245), 16, 16)) -> intp(0, 3, 1)
	.word 0x84840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0xbb341011  ! 1: SRLX_R	srlx	%r16, %r17, %r29
	.word 0x881c0011  ! 1: XOR_R	xor 	%r16, %r17, %r4
thr3_hw_intr_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_246), 16, 16)) -> intp(2, 0, 1)
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
thr3_nuke_intr_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_247), 16, 16)) -> intp(2, 2, 1)
	.word 0x86940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r3
	.word 0x888c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
thr3_resum_intr_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_248), 16, 16)) -> intp(2, 3, 1)
	.word 0xb48c231c  ! 1: ANDcc_I	andcc 	%r16, 0x031c, %r26
	.word 0xb62c206a  ! 1: ANDN_I	andn 	%r16, 0x006a, %r27
	.word 0x9e3c211e  ! 1: XNOR_I	xnor 	%r16, 0x011e, %r15
thr3_hw_intr_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_249), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0x92c429d6  ! 1: ADDCcc_I	addccc 	%r16, 0x09d6, %r9
thr3_nuke_intr_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_250), 16, 16)) -> intp(2, 2, 1)
	.word 0x8abc25f5  ! 1: XNORcc_I	xnorcc 	%r16, 0x05f5, %r5
thr3_resum_intr_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_251), 16, 16)) -> intp(2, 3, 1)
	.word 0x98340011  ! 1: ORN_R	orn 	%r16, %r17, %r12
thr3_hw_intr_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_252), 16, 16)) -> intp(2, 0, 1)
	.word 0x882c2bcf  ! 1: ANDN_I	andn 	%r16, 0x0bcf, %r4
thr3_nuke_intr_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_253), 16, 16)) -> intp(0, 2, 1)
	.word 0x82c42e1e  ! 1: ADDCcc_I	addccc 	%r16, 0x0e1e, %r1
thr3_resum_intr_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_254), 16, 16)) -> intp(0, 3, 1)
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
thr3_hw_intr_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_255), 16, 16)) -> intp(1, 0, 1)
	.word 0xa8940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r20
	.word 0x942c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r10
thr3_hw_intr_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_256), 16, 16)) -> intp(2, 0, 1)
	.word 0xac8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0xb6840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
thr3_hw_intr_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_257), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c2c28d2  ! 1: ANDN_I	andn 	%r16, 0x08d2, %r14
	.word 0xaa0c2f34  ! 1: AND_I	and 	%r16, 0x0f34, %r21
thr3_nuke_intr_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_258), 16, 16)) -> intp(2, 2, 1)
	.word 0x88bc2151  ! 1: XNORcc_I	xnorcc 	%r16, 0x0151, %r4
	.word 0x8a9c25b7  ! 1: XORcc_I	xorcc 	%r16, 0x05b7, %r5
thr3_resum_intr_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_259), 16, 16)) -> intp(2, 3, 1)
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
	.word 0xbb7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r29
thr3_nuke_intr_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_260), 16, 16)) -> intp(2, 2, 1)
	.word 0x860c0011  ! 1: AND_R	and 	%r16, %r17, %r3
	.word 0x9e2c2d4e  ! 1: ANDN_I	andn 	%r16, 0x0d4e, %r15
thr3_resum_intr_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_261), 16, 16)) -> intp(2, 3, 1)
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x9c1c2b62  ! 1: XOR_I	xor 	%r16, 0x0b62, %r14
thr3_hw_intr_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_262), 16, 16)) -> intp(0, 0, 1)
	.word 0x95342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0xac0c29fe  ! 1: AND_I	and 	%r16, 0x09fe, %r22
thr3_hw_intr_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_263), 16, 16)) -> intp(0, 0, 1)
	.word 0x90842ebe  ! 1: ADDcc_I	addcc 	%r16, 0x0ebe, %r8
thr3_nuke_intr_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_264), 16, 16)) -> intp(0, 2, 1)
	.word 0x953c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r10
thr3_resum_intr_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_265), 16, 16)) -> intp(0, 3, 1)
	.word 0xac1421b5  ! 1: OR_I	or 	%r16, 0x01b5, %r22
thr3_nuke_intr_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_266), 16, 16)) -> intp(2, 2, 1)
	.word 0x94842a17  ! 1: ADDcc_I	addcc 	%r16, 0x0a17, %r10
thr3_resum_intr_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_267), 16, 16)) -> intp(2, 3, 1)
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
thr3_nuke_intr_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_268), 16, 16)) -> intp(2, 2, 1)
	.word 0x99340011  ! 1: SRL_R	srl 	%r16, %r17, %r12
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
thr3_resum_intr_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_269), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c94292f  ! 1: ORcc_I	orcc 	%r16, 0x092f, %r6
	.word 0x9044287d  ! 1: ADDC_I	addc 	%r16, 0x087d, %r8
	.word 0xa83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r20
thr3_hw_intr_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_270), 16, 16)) -> intp(1, 0, 1)
	.word 0xb00c0011  ! 1: AND_R	and 	%r16, %r17, %r24
	.word 0x82c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
thr3_nuke_intr_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_271), 16, 16)) -> intp(2, 2, 1)
	.word 0xae1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r23
thr3_resum_intr_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_272), 16, 16)) -> intp(2, 3, 1)
	.word 0x98ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r12
thr3_nuke_intr_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_273), 16, 16)) -> intp(2, 2, 1)
	.word 0x993c0011  ! 1: SRA_R	sra 	%r16, %r17, %r12
	.word 0xba3c2135  ! 1: XNOR_I	xnor 	%r16, 0x0135, %r29
	.word 0x8b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r5
thr3_resum_intr_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_274), 16, 16)) -> intp(2, 3, 1)
	.word 0x957c2401  ! 1: MOVR_I	move	%r16, 0x1, %r10
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x96340011  ! 1: ORN_R	orn 	%r16, %r17, %r11
thr3_hw_intr_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_275), 16, 16)) -> intp(2, 0, 1)
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r6
	.word 0x8e942f51  ! 1: ORcc_I	orcc 	%r16, 0x0f51, %r7
thr3_nuke_intr_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_276), 16, 16)) -> intp(0, 2, 1)
	.word 0x9e1c2802  ! 1: XOR_I	xor 	%r16, 0x0802, %r15
	.word 0xb93c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xac8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0x883c26fb  ! 1: XNOR_I	xnor 	%r16, 0x06fb, %r4
thr3_resum_intr_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_277), 16, 16)) -> intp(0, 3, 1)
	.word 0xa9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0x9c0c0011  ! 1: AND_R	and 	%r16, %r17, %r14
	.word 0x929424f4  ! 1: ORcc_I	orcc 	%r16, 0x04f4, %r9
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
thr3_hw_intr_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_278), 16, 16)) -> intp(0, 0, 1)
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
	.word 0x85341011  ! 1: SRLX_R	srlx	%r16, %r17, %r2
	.word 0x9b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r13
thr3_nuke_intr_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_279), 16, 16)) -> intp(1, 2, 1)
	.word 0xb40c0011  ! 1: AND_R	and 	%r16, %r17, %r26
	.word 0xaf2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r23
thr3_resum_intr_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_280), 16, 16)) -> intp(1, 3, 1)
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
thr3_hw_intr_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_281), 16, 16)) -> intp(1, 0, 1)
	.word 0x96042f1b  ! 1: ADD_I	add 	%r16, 0x0f1b, %r11
	.word 0xae8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r23
thr3_nuke_intr_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_282), 16, 16)) -> intp(2, 2, 1)
	.word 0xa9340011  ! 1: SRL_R	srl 	%r16, %r17, %r20
	.word 0xaf342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r23
	.word 0xb8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0xaa440011  ! 1: ADDC_R	addc 	%r16, %r17, %r21
thr3_resum_intr_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_283), 16, 16)) -> intp(2, 3, 1)
	.word 0x893c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0xb8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r28
	.word 0xb53c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
thr3_nuke_intr_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_284), 16, 16)) -> intp(0, 2, 1)
	.word 0x8c840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xacac23f4  ! 1: ANDNcc_I	andncc 	%r16, 0x03f4, %r22
	.word 0x83643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_285), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6040011  ! 1: ADD_R	add 	%r16, %r17, %r27
	.word 0x9e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x944426a8  ! 1: ADDC_I	addc 	%r16, 0x06a8, %r10
thr3_nuke_intr_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_286), 16, 16)) -> intp(2, 2, 1)
	.word 0x961c2093  ! 1: XOR_I	xor 	%r16, 0x0093, %r11
	.word 0x9c3c2cab  ! 1: XNOR_I	xnor 	%r16, 0x0cab, %r14
	.word 0x89342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r4
thr3_resum_intr_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_287), 16, 16)) -> intp(2, 3, 1)
	.word 0x92b42ab7  ! 1: ORNcc_I	orncc 	%r16, 0x0ab7, %r9
	.word 0x96b4249c  ! 1: ORNcc_I	orncc 	%r16, 0x049c, %r11
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_288), 16, 16)) -> intp(0, 2, 1)
	.word 0x87641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa82c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r20
	.word 0x872c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r3
thr3_resum_intr_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_289), 16, 16)) -> intp(0, 3, 1)
	.word 0x8204215f  ! 1: ADD_I	add 	%r16, 0x015f, %r1
	.word 0x8c0421e4  ! 1: ADD_I	add 	%r16, 0x01e4, %r6
	.word 0xaf2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r23
thr3_hw_intr_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_290), 16, 16)) -> intp(1, 0, 1)
	.word 0x92042a91  ! 1: ADD_I	add 	%r16, 0x0a91, %r9
	.word 0x932c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r9
thr3_nuke_intr_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_291), 16, 16)) -> intp(1, 2, 1)
	.word 0xb62c2442  ! 1: ANDN_I	andn 	%r16, 0x0442, %r27
	.word 0x96ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x90bc2342  ! 1: XNORcc_I	xnorcc 	%r16, 0x0342, %r8
thr3_resum_intr_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_292), 16, 16)) -> intp(1, 3, 1)
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x8c8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0xb0942117  ! 1: ORcc_I	orcc 	%r16, 0x0117, %r24
thr3_nuke_intr_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_293), 16, 16)) -> intp(1, 2, 1)
	.word 0x842c28b5  ! 1: ANDN_I	andn 	%r16, 0x08b5, %r2
	.word 0x9a3c2512  ! 1: XNOR_I	xnor 	%r16, 0x0512, %r13
thr3_resum_intr_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_294), 16, 16)) -> intp(1, 3, 1)
	.word 0x99643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb4c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r26
thr3_nuke_intr_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_295), 16, 16)) -> intp(1, 2, 1)
	.word 0x983c2d17  ! 1: XNOR_I	xnor 	%r16, 0x0d17, %r12
	.word 0x8a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r5
	.word 0xa72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r19
thr3_resum_intr_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_296), 16, 16)) -> intp(1, 3, 1)
	.word 0xb1643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x94842de9  ! 1: ADDcc_I	addcc 	%r16, 0x0de9, %r10
thr3_nuke_intr_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_297), 16, 16)) -> intp(1, 2, 1)
	.word 0x9f7c2401  ! 1: MOVR_I	move	%r16, 0xfffffeff, %r15
	.word 0xb9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r28
thr3_resum_intr_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_298), 16, 16)) -> intp(1, 3, 1)
	.word 0x98440011  ! 1: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x823c2e5c  ! 1: XNOR_I	xnor 	%r16, 0x0e5c, %r1
thr3_nuke_intr_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_299), 16, 16)) -> intp(2, 2, 1)
	.word 0x988c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r12
thr3_resum_intr_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_300), 16, 16)) -> intp(2, 3, 1)
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
thr3_hw_intr_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_301), 16, 16)) -> intp(0, 0, 1)
	.word 0xae2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r23
thr3_nuke_intr_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_302), 16, 16)) -> intp(2, 2, 1)
	.word 0x903c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x90442982  ! 1: ADDC_I	addc 	%r16, 0x0982, %r8
thr3_resum_intr_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_303), 16, 16)) -> intp(2, 3, 1)
	.word 0x923c2b34  ! 1: XNOR_I	xnor 	%r16, 0x0b34, %r9
	.word 0xae3c2721  ! 1: XNOR_I	xnor 	%r16, 0x0721, %r23
thr3_nuke_intr_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_304), 16, 16)) -> intp(2, 2, 1)
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
thr3_resum_intr_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_305), 16, 16)) -> intp(2, 3, 1)
	.word 0x94b42531  ! 1: ORNcc_I	orncc 	%r16, 0x0531, %r10
thr3_hw_intr_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_306), 16, 16)) -> intp(1, 0, 1)
	.word 0x9d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r14
	.word 0xa6942531  ! 1: ORcc_I	orcc 	%r16, 0x0531, %r19
	.word 0x8b3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r5
thr3_hw_intr_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_307), 16, 16)) -> intp(2, 0, 1)
	.word 0x92440011  ! 1: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x820c0011  ! 1: AND_R	and 	%r16, %r17, %r1
	.word 0x82942b07  ! 1: ORcc_I	orcc 	%r16, 0x0b07, %r1
	.word 0x888c2e0e  ! 1: ANDcc_I	andcc 	%r16, 0x0e0e, %r4
thr3_nuke_intr_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_308), 16, 16)) -> intp(0, 2, 1)
	.word 0x92940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r9
thr3_resum_intr_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_309), 16, 16)) -> intp(0, 3, 1)
	.word 0x880c21e4  ! 1: AND_I	and 	%r16, 0x01e4, %r4
thr3_nuke_intr_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_310), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8042244  ! 1: ADD_I	add 	%r16, 0x0244, %r20
	.word 0xb8bc22b7  ! 1: XNORcc_I	xnorcc 	%r16, 0x02b7, %r28
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
	.word 0xa61c0011  ! 1: XOR_R	xor 	%r16, %r17, %r19
thr3_resum_intr_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_311), 16, 16)) -> intp(0, 3, 1)
	.word 0x9f340011  ! 1: SRL_R	srl 	%r16, %r17, %r15
	.word 0x848c228f  ! 1: ANDcc_I	andcc 	%r16, 0x028f, %r2
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0xb8140011  ! 1: OR_R	or 	%r16, %r17, %r28
thr3_hw_intr_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_312), 16, 16)) -> intp(2, 0, 1)
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
thr3_nuke_intr_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_313), 16, 16)) -> intp(2, 2, 1)
	.word 0x93643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x92142332  ! 1: OR_I	or 	%r16, 0x0332, %r9
thr3_resum_intr_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_314), 16, 16)) -> intp(2, 3, 1)
	.word 0x949c2ee2  ! 1: XORcc_I	xorcc 	%r16, 0x0ee2, %r10
	.word 0xb72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r27
	.word 0x892c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r4
thr3_hw_intr_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_315), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7341011  ! 1: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x8a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x94940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r10
thr3_hw_intr_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_316), 16, 16)) -> intp(2, 0, 1)
	.word 0x848c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r2
thr3_nuke_intr_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_317), 16, 16)) -> intp(2, 2, 1)
	.word 0xb09c2fb6  ! 1: XORcc_I	xorcc 	%r16, 0x0fb6, %r24
thr3_resum_intr_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_318), 16, 16)) -> intp(2, 3, 1)
	.word 0x8484270f  ! 1: ADDcc_I	addcc 	%r16, 0x070f, %r2
thr3_hw_intr_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_319), 16, 16)) -> intp(0, 0, 1)
	.word 0x882c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x90040011  ! 1: ADD_R	add 	%r16, %r17, %r8
thr3_hw_intr_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_320), 16, 16)) -> intp(1, 0, 1)
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x8d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r6
	.word 0x840c2041  ! 1: AND_I	and 	%r16, 0x0041, %r2
thr3_hw_intr_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_321), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e340011  ! 1: ORN_R	orn 	%r16, %r17, %r15
	.word 0xba9c21d1  ! 1: XORcc_I	xorcc 	%r16, 0x01d1, %r29
	.word 0xb8040011  ! 1: ADD_R	add 	%r16, %r17, %r28
thr3_nuke_intr_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_322), 16, 16)) -> intp(2, 2, 1)
	.word 0x880c0011  ! 1: AND_R	and 	%r16, %r17, %r4
	.word 0x988428d3  ! 1: ADDcc_I	addcc 	%r16, 0x08d3, %r12
	.word 0x8b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xab2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r21
thr3_resum_intr_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_323), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c842232  ! 1: ADDcc_I	addcc 	%r16, 0x0232, %r6
	.word 0xb8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r28
	.word 0xb4840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0xac142a95  ! 1: OR_I	or 	%r16, 0x0a95, %r22
thr3_hw_intr_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_324), 16, 16)) -> intp(1, 0, 1)
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
	.word 0x8eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r7
	.word 0x992c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x972c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r11
thr3_nuke_intr_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_325), 16, 16)) -> intp(1, 2, 1)
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
thr3_resum_intr_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_326), 16, 16)) -> intp(1, 3, 1)
	.word 0x912c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r8
thr3_hw_intr_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_327), 16, 16)) -> intp(2, 0, 1)
	.word 0x8c0424f2  ! 1: ADD_I	add 	%r16, 0x04f2, %r6
	.word 0xbb7c0411  ! 1: MOVR_R	move	%r16, %r17, %r29
	.word 0xac940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r22
thr3_hw_intr_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_328), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c042cc3  ! 1: ADD_I	add 	%r16, 0x0cc3, %r14
thr3_hw_intr_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_329), 16, 16)) -> intp(0, 0, 1)
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x8e1c23dd  ! 1: XOR_I	xor 	%r16, 0x03dd, %r7
	.word 0xa83c2d31  ! 1: XNOR_I	xnor 	%r16, 0x0d31, %r20
	.word 0x9c342d9b  ! 1: ORN_I	orn 	%r16, 0x0d9b, %r14
thr3_nuke_intr_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_330), 16, 16)) -> intp(0, 2, 1)
	.word 0x94b42e4f  ! 1: ORNcc_I	orncc 	%r16, 0x0e4f, %r10
	.word 0x853c1011  ! 1: SRAX_R	srax	%r16, %r17, %r2
thr3_resum_intr_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_331), 16, 16)) -> intp(0, 3, 1)
	.word 0xb22c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r25
	.word 0x90c4251a  ! 1: ADDCcc_I	addccc 	%r16, 0x051a, %r8
thr3_hw_intr_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_332), 16, 16)) -> intp(1, 0, 1)
	.word 0x988c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r12
thr3_hw_intr_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_333), 16, 16)) -> intp(0, 0, 1)
	.word 0xb12c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r24
	.word 0x913c1011  ! 1: SRAX_R	srax	%r16, %r17, %r8
thr3_hw_intr_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_334), 16, 16)) -> intp(2, 0, 1)
	.word 0xa7342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0xb69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0x84c42845  ! 1: ADDCcc_I	addccc 	%r16, 0x0845, %r2
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
thr3_nuke_intr_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_335), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
	.word 0x9b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x880c2222  ! 1: AND_I	and 	%r16, 0x0222, %r4
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
thr3_resum_intr_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_336), 16, 16)) -> intp(1, 3, 1)
	.word 0xb2c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0xb92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r28
	.word 0xaa1c2ca9  ! 1: XOR_I	xor 	%r16, 0x0ca9, %r21
	.word 0xb69c24dc  ! 1: XORcc_I	xorcc 	%r16, 0x04dc, %r27
thr3_hw_intr_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_337), 16, 16)) -> intp(0, 0, 1)
	.word 0xb8b42f42  ! 1: ORNcc_I	orncc 	%r16, 0x0f42, %r28
	.word 0xb81c2397  ! 1: XOR_I	xor 	%r16, 0x0397, %r28
thr3_hw_intr_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_338), 16, 16)) -> intp(2, 0, 1)
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
thr3_hw_intr_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_339), 16, 16)) -> intp(1, 0, 1)
	.word 0x9c040011  ! 1: ADD_R	add 	%r16, %r17, %r14
	.word 0x932c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r9
thr3_hw_intr_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_340), 16, 16)) -> intp(1, 0, 1)
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0xb694292f  ! 1: ORcc_I	orcc 	%r16, 0x092f, %r27
	.word 0x9ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r15
thr3_hw_intr_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_341), 16, 16)) -> intp(1, 0, 1)
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x8c842d1d  ! 1: ADDcc_I	addcc 	%r16, 0x0d1d, %r6
	.word 0x85340011  ! 1: SRL_R	srl 	%r16, %r17, %r2
	.word 0x917c2401  ! 1: MOVR_I	move	%r16, 0x11, %r8
thr3_hw_intr_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_342), 16, 16)) -> intp(2, 0, 1)
	.word 0x981c2780  ! 1: XOR_I	xor 	%r16, 0x0780, %r12
	.word 0x877c2401  ! 1: MOVR_I	move	%r16, 0xffffff80, %r3
	.word 0x897c2401  ! 1: MOVR_I	move	%r16, 0xffffff80, %r4
	.word 0x9b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r13
thr3_nuke_intr_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_343), 16, 16)) -> intp(1, 2, 1)
	.word 0xaebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r23
	.word 0x9a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x95340011  ! 1: SRL_R	srl 	%r16, %r17, %r10
thr3_resum_intr_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_344), 16, 16)) -> intp(1, 3, 1)
	.word 0x829c2976  ! 1: XORcc_I	xorcc 	%r16, 0x0976, %r1
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
	.word 0xb4bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r26
thr3_hw_intr_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_345), 16, 16)) -> intp(1, 0, 1)
	.word 0xba0c0011  ! 1: AND_R	and 	%r16, %r17, %r29
thr3_hw_intr_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_346), 16, 16)) -> intp(2, 0, 1)
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
thr3_hw_intr_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_347), 16, 16)) -> intp(2, 0, 1)
	.word 0x8414226d  ! 1: OR_I	or 	%r16, 0x026d, %r2
	.word 0x8cbc2e07  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e07, %r6
	.word 0x9eb42609  ! 1: ORNcc_I	orncc 	%r16, 0x0609, %r15
	.word 0x9a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r13
thr3_hw_intr_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_348), 16, 16)) -> intp(2, 0, 1)
	.word 0x99343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r12
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0x9ac4254b  ! 1: ADDCcc_I	addccc 	%r16, 0x054b, %r13
thr3_nuke_intr_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_349), 16, 16)) -> intp(2, 2, 1)
	.word 0x960c0011  ! 1: AND_R	and 	%r16, %r17, %r11
	.word 0xae142c6d  ! 1: OR_I	or 	%r16, 0x0c6d, %r23
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
thr3_resum_intr_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_350), 16, 16)) -> intp(2, 3, 1)
	.word 0xaf3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r23
	.word 0xb32c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0xb9641811  ! 1: MOVcc_R	<illegal instruction>
thr3_nuke_intr_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_351), 16, 16)) -> intp(0, 2, 1)
	.word 0x9c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r14
thr3_resum_intr_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_352), 16, 16)) -> intp(0, 3, 1)
	.word 0x97340011  ! 1: SRL_R	srl 	%r16, %r17, %r11
thr3_nuke_intr_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_353), 16, 16)) -> intp(2, 2, 1)
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x981c264a  ! 1: XOR_I	xor 	%r16, 0x064a, %r12
	.word 0x9f340011  ! 1: SRL_R	srl 	%r16, %r17, %r15
thr3_resum_intr_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_354), 16, 16)) -> intp(2, 3, 1)
	.word 0xb2140011  ! 1: OR_R	or 	%r16, %r17, %r25
	.word 0xa7641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
thr3_hw_intr_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_355), 16, 16)) -> intp(2, 0, 1)
	.word 0xb49c25a6  ! 1: XORcc_I	xorcc 	%r16, 0x05a6, %r26
	.word 0xb8b4210c  ! 1: ORNcc_I	orncc 	%r16, 0x010c, %r28
	.word 0x8e2c2fa9  ! 1: ANDN_I	andn 	%r16, 0x0fa9, %r7
thr3_hw_intr_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_356), 16, 16)) -> intp(1, 0, 1)
	.word 0x9eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xb9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x82bc2547  ! 1: XNORcc_I	xnorcc 	%r16, 0x0547, %r1
thr3_hw_intr_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_357), 16, 16)) -> intp(2, 0, 1)
	.word 0x96bc2ceb  ! 1: XNORcc_I	xnorcc 	%r16, 0x0ceb, %r11
	.word 0x9284242e  ! 1: ADDcc_I	addcc 	%r16, 0x042e, %r9
	.word 0xb8040011  ! 1: ADD_R	add 	%r16, %r17, %r28
	.word 0x92142353  ! 1: OR_I	or 	%r16, 0x0353, %r9
thr3_nuke_intr_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_358), 16, 16)) -> intp(2, 2, 1)
	.word 0x942c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x9a340011  ! 1: ORN_R	orn 	%r16, %r17, %r13
thr3_resum_intr_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_359), 16, 16)) -> intp(2, 3, 1)
	.word 0xb93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r28
	.word 0x829c2da5  ! 1: XORcc_I	xorcc 	%r16, 0x0da5, %r1
thr3_hw_intr_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_360), 16, 16)) -> intp(1, 0, 1)
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
	.word 0x9f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r15
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x9ebc22a1  ! 1: XNORcc_I	xnorcc 	%r16, 0x02a1, %r15
thr3_nuke_intr_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_361), 16, 16)) -> intp(0, 2, 1)
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
thr3_resum_intr_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_362), 16, 16)) -> intp(0, 3, 1)
	.word 0x8b7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r5
thr3_nuke_intr_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_363), 16, 16)) -> intp(0, 2, 1)
	.word 0x963c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x9e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r15
thr3_resum_intr_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_364), 16, 16)) -> intp(0, 3, 1)
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
	.word 0xb1340011  ! 1: SRL_R	srl 	%r16, %r17, %r24
thr3_hw_intr_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_365), 16, 16)) -> intp(1, 0, 1)
	.word 0x8a3425ac  ! 1: ORN_I	orn 	%r16, 0x05ac, %r5
thr3_hw_intr_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_366), 16, 16)) -> intp(0, 0, 1)
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0xb53c0011  ! 1: SRA_R	sra 	%r16, %r17, %r26
thr3_hw_intr_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_367), 16, 16)) -> intp(1, 0, 1)
	.word 0x8e442ff6  ! 1: ADDC_I	addc 	%r16, 0x0ff6, %r7
	.word 0xb644207f  ! 1: ADDC_I	addc 	%r16, 0x007f, %r27
	.word 0x9c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0xb2940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r25
thr3_hw_intr_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_368), 16, 16)) -> intp(1, 0, 1)
	.word 0x923c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0xa614236a  ! 1: OR_I	or 	%r16, 0x036a, %r19
	.word 0x983c2aa2  ! 1: XNOR_I	xnor 	%r16, 0x0aa2, %r12
	.word 0x96840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r11
thr3_hw_intr_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_369), 16, 16)) -> intp(2, 0, 1)
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
thr3_hw_intr_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_370), 16, 16)) -> intp(2, 0, 1)
	.word 0x9b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r13
	.word 0xae0c237a  ! 1: AND_I	and 	%r16, 0x037a, %r23
	.word 0x852c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r2
thr3_nuke_intr_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_371), 16, 16)) -> intp(2, 2, 1)
	.word 0x90340011  ! 1: ORN_R	orn 	%r16, %r17, %r8
	.word 0x828428c8  ! 1: ADDcc_I	addcc 	%r16, 0x08c8, %r1
	.word 0x83341011  ! 1: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x82ac2198  ! 1: ANDNcc_I	andncc 	%r16, 0x0198, %r1
thr3_resum_intr_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_372), 16, 16)) -> intp(2, 3, 1)
	.word 0x952c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0xb4342537  ! 1: ORN_I	orn 	%r16, 0x0537, %r26
	.word 0x8cb425f1  ! 1: ORNcc_I	orncc 	%r16, 0x05f1, %r6
	.word 0x989c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r12
thr3_hw_intr_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_373), 16, 16)) -> intp(2, 0, 1)
	.word 0x883c24ca  ! 1: XNOR_I	xnor 	%r16, 0x04ca, %r4
thr3_hw_intr_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_374), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e842fac  ! 1: ADDcc_I	addcc 	%r16, 0x0fac, %r7
	.word 0xb3341011  ! 1: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x93342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r9
thr3_nuke_intr_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_375), 16, 16)) -> intp(2, 2, 1)
	.word 0x9c8c23ad  ! 1: ANDcc_I	andcc 	%r16, 0x03ad, %r14
thr3_resum_intr_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_376), 16, 16)) -> intp(2, 3, 1)
	.word 0x82040011  ! 1: ADD_R	add 	%r16, %r17, %r1
thr3_nuke_intr_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_377), 16, 16)) -> intp(0, 2, 1)
	.word 0x89342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r4
thr3_resum_intr_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_378), 16, 16)) -> intp(0, 3, 1)
	.word 0xb69c22bc  ! 1: XORcc_I	xorcc 	%r16, 0x02bc, %r27
thr3_hw_intr_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_379), 16, 16)) -> intp(0, 0, 1)
	.word 0x92842697  ! 1: ADDcc_I	addcc 	%r16, 0x0697, %r9
	.word 0xba040011  ! 1: ADD_R	add 	%r16, %r17, %r29
thr3_nuke_intr_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_380), 16, 16)) -> intp(2, 2, 1)
	.word 0xb6c42c91  ! 1: ADDCcc_I	addccc 	%r16, 0x0c91, %r27
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
	.word 0x8404293c  ! 1: ADD_I	add 	%r16, 0x093c, %r2
thr3_resum_intr_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_381), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c1c2ae5  ! 1: XOR_I	xor 	%r16, 0x0ae5, %r6
	.word 0x96142f31  ! 1: OR_I	or 	%r16, 0x0f31, %r11
	.word 0xb37c2401  ! 1: MOVR_I	move	%r16, 0xffffff31, %r25
thr3_hw_intr_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_382), 16, 16)) -> intp(1, 0, 1)
	.word 0xb8042f49  ! 1: ADD_I	add 	%r16, 0x0f49, %r28
	.word 0x98142d86  ! 1: OR_I	or 	%r16, 0x0d86, %r12
	.word 0xa80c0011  ! 1: AND_R	and 	%r16, %r17, %r20
thr3_nuke_intr_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_383), 16, 16)) -> intp(1, 2, 1)
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
thr3_resum_intr_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_384), 16, 16)) -> intp(1, 3, 1)
	.word 0xb63c2283  ! 1: XNOR_I	xnor 	%r16, 0x0283, %r27
thr3_hw_intr_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_385), 16, 16)) -> intp(2, 0, 1)
	.word 0x968c2ed6  ! 1: ANDcc_I	andcc 	%r16, 0x0ed6, %r11
	.word 0x9a442f69  ! 1: ADDC_I	addc 	%r16, 0x0f69, %r13
	.word 0xaa440011  ! 1: ADDC_R	addc 	%r16, %r17, %r21
	.word 0xa6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r19
thr3_hw_intr_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_386), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa894276c  ! 1: ORcc_I	orcc 	%r16, 0x076c, %r20
	.word 0x821c0011  ! 1: XOR_R	xor 	%r16, %r17, %r1
	.word 0x888c20cf  ! 1: ANDcc_I	andcc 	%r16, 0x00cf, %r4
thr3_nuke_intr_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_387), 16, 16)) -> intp(2, 2, 1)
	.word 0x9f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r15
	.word 0xaa940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x9a2c292b  ! 1: ANDN_I	andn 	%r16, 0x092b, %r13
thr3_resum_intr_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_388), 16, 16)) -> intp(2, 3, 1)
	.word 0x989c2006  ! 1: XORcc_I	xorcc 	%r16, 0x0006, %r12
	.word 0xa8942f47  ! 1: ORcc_I	orcc 	%r16, 0x0f47, %r20
	.word 0x89643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_389), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a3c2db9  ! 1: XNOR_I	xnor 	%r16, 0x0db9, %r5
	.word 0xb82c221c  ! 1: ANDN_I	andn 	%r16, 0x021c, %r28
thr3_resum_intr_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_390), 16, 16)) -> intp(1, 3, 1)
	.word 0xb57c0411  ! 1: MOVR_R	move	%r16, %r17, %r26
	.word 0xb77c2401  ! 1: MOVR_I	move	%r16, 0xfffffe1c, %r27
thr3_hw_intr_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_391), 16, 16)) -> intp(0, 0, 1)
	.word 0x82b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0xacc42e10  ! 1: ADDCcc_I	addccc 	%r16, 0x0e10, %r22
thr3_hw_intr_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_392), 16, 16)) -> intp(1, 0, 1)
	.word 0xb6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r27
thr3_hw_intr_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_393), 16, 16)) -> intp(0, 0, 1)
	.word 0x9ac4212c  ! 1: ADDCcc_I	addccc 	%r16, 0x012c, %r13
	.word 0x8e140011  ! 1: OR_R	or 	%r16, %r17, %r7
	.word 0x822c2075  ! 1: ANDN_I	andn 	%r16, 0x0075, %r1
thr3_nuke_intr_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_394), 16, 16)) -> intp(0, 2, 1)
	.word 0x9a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x93643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x909429d5  ! 1: ORcc_I	orcc 	%r16, 0x09d5, %r8
thr3_resum_intr_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_395), 16, 16)) -> intp(0, 3, 1)
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xb9341011  ! 1: SRLX_R	srlx	%r16, %r17, %r28
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
thr3_hw_intr_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_396), 16, 16)) -> intp(0, 0, 1)
	.word 0xb92c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r28
	.word 0x900c0011  ! 1: AND_R	and 	%r16, %r17, %r8
	.word 0x9a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r13
thr3_nuke_intr_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_397), 16, 16)) -> intp(2, 2, 1)
	.word 0xbb341011  ! 1: SRLX_R	srlx	%r16, %r17, %r29
	.word 0xaa0c0011  ! 1: AND_R	and 	%r16, %r17, %r21
	.word 0x863c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0xb8040011  ! 1: ADD_R	add 	%r16, %r17, %r28
thr3_resum_intr_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_398), 16, 16)) -> intp(2, 3, 1)
	.word 0xaaac237f  ! 1: ANDNcc_I	andncc 	%r16, 0x037f, %r21
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
	.word 0x94440011  ! 1: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x8d3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r6
thr3_nuke_intr_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_399), 16, 16)) -> intp(1, 2, 1)
	.word 0x824427a7  ! 1: ADDC_I	addc 	%r16, 0x07a7, %r1
	.word 0x8a8429b2  ! 1: ADDcc_I	addcc 	%r16, 0x09b2, %r5
	.word 0xb02c2505  ! 1: ANDN_I	andn 	%r16, 0x0505, %r24
	.word 0x9f2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r15
thr3_resum_intr_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_400), 16, 16)) -> intp(1, 3, 1)
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
	.word 0xb8140011  ! 1: OR_R	or 	%r16, %r17, %r28
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
	.word 0xa69c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r19
thr3_hw_intr_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_401), 16, 16)) -> intp(0, 0, 1)
	.word 0x89641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xac442cd8  ! 1: ADDC_I	addc 	%r16, 0x0cd8, %r22
	.word 0x8e04204b  ! 1: ADD_I	add 	%r16, 0x004b, %r7
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
thr3_hw_intr_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_402), 16, 16)) -> intp(0, 0, 1)
	.word 0x9e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0xb4142d82  ! 1: OR_I	or 	%r16, 0x0d82, %r26
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0x909c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r8
thr3_nuke_intr_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_403), 16, 16)) -> intp(0, 2, 1)
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x9b3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r13
	.word 0x8ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0x981423ea  ! 1: OR_I	or 	%r16, 0x03ea, %r12
thr3_resum_intr_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_404), 16, 16)) -> intp(0, 3, 1)
	.word 0xb4942a36  ! 1: ORcc_I	orcc 	%r16, 0x0a36, %r26
	.word 0x952c0011  ! 1: SLL_R	sll 	%r16, %r17, %r10
	.word 0x9cac2e84  ! 1: ANDNcc_I	andncc 	%r16, 0x0e84, %r14
	.word 0xba040011  ! 1: ADD_R	add 	%r16, %r17, %r29
thr3_hw_intr_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_405), 16, 16)) -> intp(1, 0, 1)
	.word 0x8b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0x8c8c2a30  ! 1: ANDcc_I	andcc 	%r16, 0x0a30, %r6
	.word 0x97641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
thr3_hw_intr_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_406), 16, 16)) -> intp(2, 0, 1)
	.word 0x962c2b2a  ! 1: ANDN_I	andn 	%r16, 0x0b2a, %r11
	.word 0x9cbc2176  ! 1: XNORcc_I	xnorcc 	%r16, 0x0176, %r14
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
thr3_nuke_intr_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_407), 16, 16)) -> intp(1, 2, 1)
	.word 0x88142cd3  ! 1: OR_I	or 	%r16, 0x0cd3, %r4
	.word 0x85341011  ! 1: SRLX_R	srlx	%r16, %r17, %r2
thr3_resum_intr_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_408), 16, 16)) -> intp(1, 3, 1)
	.word 0xa6b4205f  ! 1: ORNcc_I	orncc 	%r16, 0x005f, %r19
	.word 0xb7643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_409), 16, 16)) -> intp(1, 2, 1)
	.word 0x88840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x8c1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r6
	.word 0x837c0411  ! 1: MOVR_R	move	%r16, %r17, %r1
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
thr3_resum_intr_410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_410), 16, 16)) -> intp(1, 3, 1)
	.word 0xb6c42dbd  ! 1: ADDCcc_I	addccc 	%r16, 0x0dbd, %r27
	.word 0xa92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r20
	.word 0x8a3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0x8a1c2324  ! 1: XOR_I	xor 	%r16, 0x0324, %r5
thr3_nuke_intr_411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_411), 16, 16)) -> intp(0, 2, 1)
	.word 0x868c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0x8abc2de1  ! 1: XNORcc_I	xnorcc 	%r16, 0x0de1, %r5
	.word 0x9a040011  ! 1: ADD_R	add 	%r16, %r17, %r13
	.word 0x82840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r1
thr3_resum_intr_412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_412), 16, 16)) -> intp(0, 3, 1)
	.word 0xa6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0x84040011  ! 1: ADD_R	add 	%r16, %r17, %r2
	.word 0xb6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
thr3_hw_intr_413:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_413), 16, 16)) -> intp(1, 0, 1)
	.word 0x9cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0xaa942b67  ! 1: ORcc_I	orcc 	%r16, 0x0b67, %r21
	.word 0x94c42c05  ! 1: ADDCcc_I	addccc 	%r16, 0x0c05, %r10
	.word 0x8ac40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r5
thr3_nuke_intr_414:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_414), 16, 16)) -> intp(2, 2, 1)
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
thr3_resum_intr_415:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_415), 16, 16)) -> intp(2, 3, 1)
	.word 0x9e1c28fb  ! 1: XOR_I	xor 	%r16, 0x08fb, %r15
thr3_nuke_intr_416:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_416), 16, 16)) -> intp(0, 2, 1)
	.word 0x87341011  ! 1: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x8d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r6
	.word 0x84140011  ! 1: OR_R	or 	%r16, %r17, %r2
	.word 0x837c2401  ! 1: MOVR_I	move	%r16, 0x11, %r1
thr3_resum_intr_417:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_417), 16, 16)) -> intp(0, 3, 1)
	.word 0xb02c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r24
	.word 0xb28c2f49  ! 1: ANDcc_I	andcc 	%r16, 0x0f49, %r25
	.word 0xacc42b5d  ! 1: ADDCcc_I	addccc 	%r16, 0x0b5d, %r22
	.word 0x86bc259e  ! 1: XNORcc_I	xnorcc 	%r16, 0x059e, %r3
thr3_nuke_intr_418:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_418), 16, 16)) -> intp(0, 2, 1)
	.word 0x9e1423ba  ! 1: OR_I	or 	%r16, 0x03ba, %r15
	.word 0x921c0011  ! 1: XOR_R	xor 	%r16, %r17, %r9
thr3_resum_intr_419:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_419), 16, 16)) -> intp(0, 3, 1)
	.word 0x981c0011  ! 1: XOR_R	xor 	%r16, %r17, %r12
	.word 0xacb42396  ! 1: ORNcc_I	orncc 	%r16, 0x0396, %r22
thr3_nuke_intr_420:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_420), 16, 16)) -> intp(1, 2, 1)
	.word 0xaab4256b  ! 1: ORNcc_I	orncc 	%r16, 0x056b, %r21
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0x9d643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_421:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_421), 16, 16)) -> intp(1, 3, 1)
	.word 0x9d641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9c9c2533  ! 1: XORcc_I	xorcc 	%r16, 0x0533, %r14
	.word 0xaa3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r21
thr3_hw_intr_422:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_422), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e3c245e  ! 1: XNOR_I	xnor 	%r16, 0x045e, %r7
	.word 0x82842cb2  ! 1: ADDcc_I	addcc 	%r16, 0x0cb2, %r1
	.word 0xb8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r28
thr3_hw_intr_423:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_423), 16, 16)) -> intp(0, 0, 1)
	.word 0x901c21de  ! 1: XOR_I	xor 	%r16, 0x01de, %r8
	.word 0xb9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x9b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r13
thr3_nuke_intr_424:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_424), 16, 16)) -> intp(0, 2, 1)
	.word 0xa60c27f5  ! 1: AND_I	and 	%r16, 0x07f5, %r19
thr3_resum_intr_425:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_425), 16, 16)) -> intp(0, 3, 1)
	.word 0xaf7c0411  ! 1: MOVR_R	move	%r16, %r17, %r23
thr3_nuke_intr_426:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_426), 16, 16)) -> intp(0, 2, 1)
	.word 0xb48c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r26
thr3_resum_intr_427:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_427), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
thr3_hw_intr_428:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_428), 16, 16)) -> intp(0, 0, 1)
	.word 0x9d340011  ! 1: SRL_R	srl 	%r16, %r17, %r14
	.word 0xac142fd3  ! 1: OR_I	or 	%r16, 0x0fd3, %r22
	.word 0xba440011  ! 1: ADDC_R	addc 	%r16, %r17, %r29
thr3_nuke_intr_429:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_429), 16, 16)) -> intp(0, 2, 1)
	.word 0x862c205c  ! 1: ANDN_I	andn 	%r16, 0x005c, %r3
	.word 0xb6842435  ! 1: ADDcc_I	addcc 	%r16, 0x0435, %r27
	.word 0x901c2fdd  ! 1: XOR_I	xor 	%r16, 0x0fdd, %r8
thr3_resum_intr_430:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_430), 16, 16)) -> intp(0, 3, 1)
	.word 0xba9422d0  ! 1: ORcc_I	orcc 	%r16, 0x02d0, %r29
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0xb80c2424  ! 1: AND_I	and 	%r16, 0x0424, %r28
thr3_nuke_intr_431:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_431), 16, 16)) -> intp(0, 2, 1)
	.word 0xacb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r22
thr3_resum_intr_432:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_432), 16, 16)) -> intp(0, 3, 1)
	.word 0x86840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r3
thr3_hw_intr_433:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_433), 16, 16)) -> intp(1, 0, 1)
	.word 0x8aac27f4  ! 1: ANDNcc_I	andncc 	%r16, 0x07f4, %r5
	.word 0x8c0c0011  ! 1: AND_R	and 	%r16, %r17, %r6
	.word 0xb9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x9d2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r14
thr3_nuke_intr_434:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_434), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r23
thr3_resum_intr_435:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_435), 16, 16)) -> intp(0, 3, 1)
	.word 0x832c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r1
thr3_hw_intr_436:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_436), 16, 16)) -> intp(1, 0, 1)
	.word 0x9b7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r13
	.word 0x9a440011  ! 1: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x9a342691  ! 1: ORN_I	orn 	%r16, 0x0691, %r13
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
thr3_nuke_intr_437:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_437), 16, 16)) -> intp(2, 2, 1)
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0xb2b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r25
thr3_resum_intr_438:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_438), 16, 16)) -> intp(2, 3, 1)
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
thr3_nuke_intr_439:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_439), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c442b9d  ! 1: ADDC_I	addc 	%r16, 0x0b9d, %r6
	.word 0x9eac203e  ! 1: ANDNcc_I	andncc 	%r16, 0x003e, %r15
	.word 0xb8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0x892c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r4
thr3_resum_intr_440:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_440), 16, 16)) -> intp(2, 3, 1)
	.word 0x9b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r13
	.word 0x82b428a9  ! 1: ORNcc_I	orncc 	%r16, 0x08a9, %r1
	.word 0xa68c2ae2  ! 1: ANDcc_I	andcc 	%r16, 0x0ae2, %r19
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
thr3_nuke_intr_441:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_441), 16, 16)) -> intp(0, 2, 1)
	.word 0x8c142dec  ! 1: OR_I	or 	%r16, 0x0dec, %r6
thr3_resum_intr_442:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_442), 16, 16)) -> intp(0, 3, 1)
	.word 0x8b7c2401  ! 1: MOVR_I	move	%r16, 0xdec, %r5
thr3_nuke_intr_443:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_443), 16, 16)) -> intp(0, 2, 1)
	.word 0x96142a1b  ! 1: OR_I	or 	%r16, 0x0a1b, %r11
	.word 0xb82c2dca  ! 1: ANDN_I	andn 	%r16, 0x0dca, %r28
thr3_resum_intr_444:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_444), 16, 16)) -> intp(0, 3, 1)
	.word 0xba9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r29
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
thr3_nuke_intr_445:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_445), 16, 16)) -> intp(0, 2, 1)
	.word 0x9c1429d0  ! 1: OR_I	or 	%r16, 0x09d0, %r14
	.word 0x8cac2987  ! 1: ANDNcc_I	andncc 	%r16, 0x0987, %r6
	.word 0x92040011  ! 1: ADD_R	add 	%r16, %r17, %r9
thr3_resum_intr_446:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_446), 16, 16)) -> intp(0, 3, 1)
	.word 0x943c2718  ! 1: XNOR_I	xnor 	%r16, 0x0718, %r10
	.word 0x8a8c2059  ! 1: ANDcc_I	andcc 	%r16, 0x0059, %r5
	.word 0x973c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r11
thr3_hw_intr_447:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_447), 16, 16)) -> intp(1, 0, 1)
	.word 0xb72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r27
thr3_hw_intr_448:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_448), 16, 16)) -> intp(1, 0, 1)
	.word 0xb92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r28
	.word 0x98bc22f0  ! 1: XNORcc_I	xnorcc 	%r16, 0x02f0, %r12
	.word 0xb6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x9b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r13
thr3_nuke_intr_449:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_449), 16, 16)) -> intp(0, 2, 1)
	.word 0xad643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x86b42e36  ! 1: ORNcc_I	orncc 	%r16, 0x0e36, %r3
	.word 0x8cb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x84942d69  ! 1: ORcc_I	orcc 	%r16, 0x0d69, %r2
thr3_resum_intr_450:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_450), 16, 16)) -> intp(0, 3, 1)
	.word 0xacac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0xa93c0011  ! 1: SRA_R	sra 	%r16, %r17, %r20
	.word 0xb83c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0x873c0011  ! 1: SRA_R	sra 	%r16, %r17, %r3
thr3_nuke_intr_451:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_451), 16, 16)) -> intp(0, 2, 1)
	.word 0xa6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r19
	.word 0x8e3c2568  ! 1: XNOR_I	xnor 	%r16, 0x0568, %r7
thr3_resum_intr_452:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_452), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e2c2c08  ! 1: ANDN_I	andn 	%r16, 0x0c08, %r7
	.word 0xae8c24b9  ! 1: ANDcc_I	andcc 	%r16, 0x04b9, %r23
thr3_hw_intr_453:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_453), 16, 16)) -> intp(0, 0, 1)
	.word 0x9c140011  ! 1: OR_R	or 	%r16, %r17, %r14
	.word 0x98342ef0  ! 1: ORN_I	orn 	%r16, 0x0ef0, %r12
	.word 0xaec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r23
thr3_nuke_intr_454:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_454), 16, 16)) -> intp(1, 2, 1)
	.word 0x980c0011  ! 1: AND_R	and 	%r16, %r17, %r12
	.word 0x94b428c9  ! 1: ORNcc_I	orncc 	%r16, 0x08c9, %r10
	.word 0xb694256b  ! 1: ORcc_I	orcc 	%r16, 0x056b, %r27
	.word 0x9c1c22c6  ! 1: XOR_I	xor 	%r16, 0x02c6, %r14
thr3_resum_intr_455:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_455), 16, 16)) -> intp(1, 3, 1)
	.word 0x863c2bda  ! 1: XNOR_I	xnor 	%r16, 0x0bda, %r3
	.word 0x9a3c2ac2  ! 1: XNOR_I	xnor 	%r16, 0x0ac2, %r13
	.word 0xb42c221e  ! 1: ANDN_I	andn 	%r16, 0x021e, %r26
	.word 0xb0ac29ad  ! 1: ANDNcc_I	andncc 	%r16, 0x09ad, %r24
thr3_nuke_intr_456:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_456), 16, 16)) -> intp(2, 2, 1)
	.word 0x980423cb  ! 1: ADD_I	add 	%r16, 0x03cb, %r12
	.word 0x89341011  ! 1: SRLX_R	srlx	%r16, %r17, %r4
thr3_resum_intr_457:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_457), 16, 16)) -> intp(2, 3, 1)
	.word 0x96842347  ! 1: ADDcc_I	addcc 	%r16, 0x0347, %r11
	.word 0x97341011  ! 1: SRLX_R	srlx	%r16, %r17, %r11
thr3_nuke_intr_458:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_458), 16, 16)) -> intp(2, 2, 1)
	.word 0xb62c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r27
	.word 0xb33c0011  ! 1: SRA_R	sra 	%r16, %r17, %r25
	.word 0x9ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r15
thr3_resum_intr_459:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_459), 16, 16)) -> intp(2, 3, 1)
	.word 0xab7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r21
	.word 0x863425bd  ! 1: ORN_I	orn 	%r16, 0x05bd, %r3
	.word 0x85343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r2
thr3_nuke_intr_460:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_460), 16, 16)) -> intp(0, 2, 1)
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
thr3_resum_intr_461:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_461), 16, 16)) -> intp(0, 3, 1)
	.word 0xaf643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_462:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_462), 16, 16)) -> intp(2, 0, 1)
	.word 0x93340011  ! 1: SRL_R	srl 	%r16, %r17, %r9
	.word 0xb2b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0xb2940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r25
thr3_nuke_intr_463:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_463), 16, 16)) -> intp(2, 2, 1)
	.word 0x8abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0xbb3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r29
thr3_resum_intr_464:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_464), 16, 16)) -> intp(2, 3, 1)
	.word 0x8f3c0011  ! 1: SRA_R	sra 	%r16, %r17, %r7
	.word 0xbb343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r29
thr3_hw_intr_465:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_465), 16, 16)) -> intp(2, 0, 1)
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x952c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x912c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r8
	.word 0x8d643801  ! 1: MOVcc_I	<illegal instruction>
thr3_hw_intr_466:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_466), 16, 16)) -> intp(0, 0, 1)
	.word 0x84140011  ! 1: OR_R	or 	%r16, %r17, %r2
	.word 0xaa8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r21
thr3_nuke_intr_467:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_467), 16, 16)) -> intp(1, 2, 1)
	.word 0xb8142572  ! 1: OR_I	or 	%r16, 0x0572, %r28
	.word 0xab340011  ! 1: SRL_R	srl 	%r16, %r17, %r21
	.word 0x837c2401  ! 1: MOVR_I	move	%r16, 0x11, %r1
	.word 0x91340011  ! 1: SRL_R	srl 	%r16, %r17, %r8
thr3_resum_intr_468:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_468), 16, 16)) -> intp(1, 3, 1)
	.word 0xa6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x843c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0xba8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r29
	.word 0xb68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r27
thr3_hw_intr_469:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_469), 16, 16)) -> intp(0, 0, 1)
	.word 0xaeac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r23
thr3_nuke_intr_470:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_470), 16, 16)) -> intp(0, 2, 1)
	.word 0xa64428cc  ! 1: ADDC_I	addc 	%r16, 0x08cc, %r19
	.word 0xb6c42fd3  ! 1: ADDCcc_I	addccc 	%r16, 0x0fd3, %r27
	.word 0x9a842e80  ! 1: ADDcc_I	addcc 	%r16, 0x0e80, %r13
	.word 0xb37c0411  ! 1: MOVR_R	move	%r16, %r17, %r25
thr3_resum_intr_471:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_471), 16, 16)) -> intp(0, 3, 1)
	.word 0x862c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r3
	.word 0xa6042a26  ! 1: ADD_I	add 	%r16, 0x0a26, %r19
	.word 0x860c2368  ! 1: AND_I	and 	%r16, 0x0368, %r3
	.word 0xba1c23c9  ! 1: XOR_I	xor 	%r16, 0x03c9, %r29
thr3_hw_intr_472:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_472), 16, 16)) -> intp(0, 0, 1)
	.word 0x96440011  ! 1: ADDC_R	addc 	%r16, %r17, %r11
thr3_nuke_intr_473:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_473), 16, 16)) -> intp(0, 2, 1)
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x85342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r2
thr3_resum_intr_474:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_474), 16, 16)) -> intp(0, 3, 1)
	.word 0xb1340011  ! 1: SRL_R	srl 	%r16, %r17, %r24
	.word 0x892c0011  ! 1: SLL_R	sll 	%r16, %r17, %r4
thr3_hw_intr_475:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_475), 16, 16)) -> intp(1, 0, 1)
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
	.word 0xb1342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0xb6c423ab  ! 1: ADDCcc_I	addccc 	%r16, 0x03ab, %r27
thr3_nuke_intr_476:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_476), 16, 16)) -> intp(2, 2, 1)
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
thr3_resum_intr_477:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_477), 16, 16)) -> intp(2, 3, 1)
	.word 0xa89c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r20
thr3_nuke_intr_478:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_478), 16, 16)) -> intp(2, 2, 1)
	.word 0xac840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
	.word 0xa60c25df  ! 1: AND_I	and 	%r16, 0x05df, %r19
	.word 0xb40c220f  ! 1: AND_I	and 	%r16, 0x020f, %r26
thr3_resum_intr_479:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_479), 16, 16)) -> intp(2, 3, 1)
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
	.word 0xaa8c2720  ! 1: ANDcc_I	andcc 	%r16, 0x0720, %r21
	.word 0x8d340011  ! 1: SRL_R	srl 	%r16, %r17, %r6
thr3_hw_intr_480:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_480), 16, 16)) -> intp(2, 0, 1)
	.word 0x94042279  ! 1: ADD_I	add 	%r16, 0x0279, %r10
thr3_nuke_intr_481:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_481), 16, 16)) -> intp(1, 2, 1)
	.word 0x9e44228c  ! 1: ADDC_I	addc 	%r16, 0x028c, %r15
thr3_resum_intr_482:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_482), 16, 16)) -> intp(1, 3, 1)
	.word 0xb5341011  ! 1: SRLX_R	srlx	%r16, %r17, %r26
thr3_nuke_intr_483:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_483), 16, 16)) -> intp(2, 2, 1)
	.word 0xae3c2ddc  ! 1: XNOR_I	xnor 	%r16, 0x0ddc, %r23
thr3_resum_intr_484:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_484), 16, 16)) -> intp(2, 3, 1)
	.word 0x920c0011  ! 1: AND_R	and 	%r16, %r17, %r9
thr3_nuke_intr_485:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_485), 16, 16)) -> intp(1, 2, 1)
	.word 0xb5341011  ! 1: SRLX_R	srlx	%r16, %r17, %r26
	.word 0x8f7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r7
thr3_resum_intr_486:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_486), 16, 16)) -> intp(1, 3, 1)
	.word 0xb49c257a  ! 1: XORcc_I	xorcc 	%r16, 0x057a, %r26
	.word 0xb6140011  ! 1: OR_R	or 	%r16, %r17, %r27
thr3_hw_intr_487:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_487), 16, 16)) -> intp(1, 0, 1)
	.word 0x8aac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x87343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r3
thr3_nuke_intr_488:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_488), 16, 16)) -> intp(1, 2, 1)
	.word 0x888c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0x90b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x9e142a4f  ! 1: OR_I	or 	%r16, 0x0a4f, %r15
thr3_resum_intr_489:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_489), 16, 16)) -> intp(1, 3, 1)
	.word 0xba2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r29
	.word 0x961c2d2d  ! 1: XOR_I	xor 	%r16, 0x0d2d, %r11
	.word 0x86940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r3
thr3_hw_intr_490:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_490), 16, 16)) -> intp(0, 0, 1)
	.word 0x87341011  ! 1: SRLX_R	srlx	%r16, %r17, %r3
	.word 0xac8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r22
thr3_hw_intr_491:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_491), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r7
	.word 0xbb340011  ! 1: SRL_R	srl 	%r16, %r17, %r29
thr3_nuke_intr_492:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_492), 16, 16)) -> intp(2, 2, 1)
	.word 0xa8c422b5  ! 1: ADDCcc_I	addccc 	%r16, 0x02b5, %r20
	.word 0x90340011  ! 1: ORN_R	orn 	%r16, %r17, %r8
	.word 0xb49c239c  ! 1: XORcc_I	xorcc 	%r16, 0x039c, %r26
thr3_resum_intr_493:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_493), 16, 16)) -> intp(2, 3, 1)
	.word 0x94840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0x9f643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x8e2c2e83  ! 1: ANDN_I	andn 	%r16, 0x0e83, %r7
thr3_nuke_intr_494:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_494), 16, 16)) -> intp(1, 2, 1)
	.word 0xa6842427  ! 1: ADDcc_I	addcc 	%r16, 0x0427, %r19
	.word 0x88940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x961c2cca  ! 1: XOR_I	xor 	%r16, 0x0cca, %r11
	.word 0x960c0011  ! 1: AND_R	and 	%r16, %r17, %r11
thr3_resum_intr_495:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_495), 16, 16)) -> intp(1, 3, 1)
	.word 0xa68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0xb6140011  ! 1: OR_R	or 	%r16, %r17, %r27
	.word 0x90b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0xbabc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r29
thr3_hw_intr_496:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_496), 16, 16)) -> intp(2, 0, 1)
	.word 0xb08c275a  ! 1: ANDcc_I	andcc 	%r16, 0x075a, %r24
	.word 0xb92c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r28
thr3_nuke_intr_497:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_497), 16, 16)) -> intp(2, 2, 1)
	.word 0x928c20b6  ! 1: ANDcc_I	andcc 	%r16, 0x00b6, %r9
	.word 0x8b340011  ! 1: SRL_R	srl 	%r16, %r17, %r5
	.word 0x9eb42e8e  ! 1: ORNcc_I	orncc 	%r16, 0x0e8e, %r15
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
thr3_resum_intr_498:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_498), 16, 16)) -> intp(2, 3, 1)
	.word 0x9a442f9c  ! 1: ADDC_I	addc 	%r16, 0x0f9c, %r13
	.word 0xba840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x92042a03  ! 1: ADD_I	add 	%r16, 0x0a03, %r9
thr3_nuke_intr_499:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_499), 16, 16)) -> intp(1, 2, 1)
	.word 0x9c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x95643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_500:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_500), 16, 16)) -> intp(1, 3, 1)
	.word 0x99641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x962c2cb4  ! 1: ANDN_I	andn 	%r16, 0x0cb4, %r11
thr3_hw_intr_501:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_501), 16, 16)) -> intp(0, 0, 1)
	.word 0x997c0411  ! 1: MOVR_R	move	%r16, %r17, %r12
	.word 0x8ebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r7
thr3_hw_intr_502:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_502), 16, 16)) -> intp(0, 0, 1)
	.word 0x8c1c2ac7  ! 1: XOR_I	xor 	%r16, 0x0ac7, %r6
thr3_nuke_intr_503:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_503), 16, 16)) -> intp(0, 2, 1)
	.word 0x877c0411  ! 1: MOVR_R	move	%r16, %r17, %r3
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
thr3_resum_intr_504:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_504), 16, 16)) -> intp(0, 3, 1)
	.word 0x92342f23  ! 1: ORN_I	orn 	%r16, 0x0f23, %r9
	.word 0x8f643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb02c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r24
thr3_nuke_intr_505:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_505), 16, 16)) -> intp(2, 2, 1)
	.word 0xac440011  ! 1: ADDC_R	addc 	%r16, %r17, %r22
	.word 0xb2140011  ! 1: OR_R	or 	%r16, %r17, %r25
thr3_resum_intr_506:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_506), 16, 16)) -> intp(2, 3, 1)
	.word 0x94bc2a9a  ! 1: XNORcc_I	xnorcc 	%r16, 0x0a9a, %r10
	.word 0xb6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r27
thr3_hw_intr_507:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_507), 16, 16)) -> intp(0, 0, 1)
	.word 0x90ac2b46  ! 1: ANDNcc_I	andncc 	%r16, 0x0b46, %r8
	.word 0x843c2cc1  ! 1: XNOR_I	xnor 	%r16, 0x0cc1, %r2
	.word 0xa6140011  ! 1: OR_R	or 	%r16, %r17, %r19
	.word 0xa72c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r19
thr3_hw_intr_508:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_508), 16, 16)) -> intp(1, 0, 1)
	.word 0xa73c1011  ! 1: SRAX_R	srax	%r16, %r17, %r19
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0xb0ac240a  ! 1: ANDNcc_I	andncc 	%r16, 0x040a, %r24
thr3_hw_intr_509:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_509), 16, 16)) -> intp(1, 0, 1)
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
	.word 0x820c22c9  ! 1: AND_I	and 	%r16, 0x02c9, %r1
	.word 0x9a342bd8  ! 1: ORN_I	orn 	%r16, 0x0bd8, %r13
thr3_nuke_intr_510:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_510), 16, 16)) -> intp(2, 2, 1)
	.word 0xaeb4205d  ! 1: ORNcc_I	orncc 	%r16, 0x005d, %r23
	.word 0xaa442487  ! 1: ADDC_I	addc 	%r16, 0x0487, %r21
thr3_resum_intr_511:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_511), 16, 16)) -> intp(2, 3, 1)
	.word 0xa8840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0xb2942f92  ! 1: ORcc_I	orcc 	%r16, 0x0f92, %r25
thr3_nuke_intr_512:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_512), 16, 16)) -> intp(0, 2, 1)
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
	.word 0x92442a26  ! 1: ADDC_I	addc 	%r16, 0x0a26, %r9
	.word 0x952c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r10
thr3_resum_intr_513:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_513), 16, 16)) -> intp(0, 3, 1)
	.word 0x8a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0x9c1423c9  ! 1: OR_I	or 	%r16, 0x03c9, %r14
	.word 0x8e840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r7
thr3_hw_intr_514:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_514), 16, 16)) -> intp(2, 0, 1)
	.word 0xb4b422cc  ! 1: ORNcc_I	orncc 	%r16, 0x02cc, %r26
	.word 0x892c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0x872c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0xb53c0011  ! 1: SRA_R	sra 	%r16, %r17, %r26
thr3_nuke_intr_515:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_515), 16, 16)) -> intp(1, 2, 1)
	.word 0x9ab42454  ! 1: ORNcc_I	orncc 	%r16, 0x0454, %r13
	.word 0x932c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x872c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r3
	.word 0x8d643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_516:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_516), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r15
	.word 0xae840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0xac8c23c3  ! 1: ANDcc_I	andcc 	%r16, 0x03c3, %r22
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
thr3_nuke_intr_517:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_517), 16, 16)) -> intp(0, 2, 1)
	.word 0xb21c0011  ! 1: XOR_R	xor 	%r16, %r17, %r25
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
	.word 0xb3340011  ! 1: SRL_R	srl 	%r16, %r17, %r25
	.word 0x880c2636  ! 1: AND_I	and 	%r16, 0x0636, %r4
thr3_resum_intr_518:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_518), 16, 16)) -> intp(0, 3, 1)
	.word 0x884428a2  ! 1: ADDC_I	addc 	%r16, 0x08a2, %r4
	.word 0xb2c42b4c  ! 1: ADDCcc_I	addccc 	%r16, 0x0b4c, %r25
	.word 0x9e9423c6  ! 1: ORcc_I	orcc 	%r16, 0x03c6, %r15
	.word 0x8e2c22de  ! 1: ANDN_I	andn 	%r16, 0x02de, %r7
thr3_nuke_intr_519:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_519), 16, 16)) -> intp(1, 2, 1)
	.word 0x82042d88  ! 1: ADD_I	add 	%r16, 0x0d88, %r1
	.word 0xa92c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r20
	.word 0x9f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r15
thr3_resum_intr_520:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_520), 16, 16)) -> intp(1, 3, 1)
	.word 0x8cac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0xa97c2401  ! 1: MOVR_I	move	%r16, 0x11, %r20
	.word 0x82c42ff5  ! 1: ADDCcc_I	addccc 	%r16, 0x0ff5, %r1
thr3_nuke_intr_521:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_521), 16, 16)) -> intp(2, 2, 1)
	.word 0x9a0c0011  ! 1: AND_R	and 	%r16, %r17, %r13
	.word 0x980c2614  ! 1: AND_I	and 	%r16, 0x0614, %r12
thr3_resum_intr_522:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_522), 16, 16)) -> intp(2, 3, 1)
	.word 0x90c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x90342360  ! 1: ORN_I	orn 	%r16, 0x0360, %r8
thr3_nuke_intr_523:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_523), 16, 16)) -> intp(1, 2, 1)
	.word 0xa88c2f88  ! 1: ANDcc_I	andcc 	%r16, 0x0f88, %r20
	.word 0xb33c0011  ! 1: SRA_R	sra 	%r16, %r17, %r25
	.word 0xacac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0x993c0011  ! 1: SRA_R	sra 	%r16, %r17, %r12
thr3_resum_intr_524:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_524), 16, 16)) -> intp(1, 3, 1)
	.word 0x8f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r7
	.word 0xb8ac297a  ! 1: ANDNcc_I	andncc 	%r16, 0x097a, %r28
	.word 0x961c0011  ! 1: XOR_R	xor 	%r16, %r17, %r11
	.word 0xb2140011  ! 1: OR_R	or 	%r16, %r17, %r25
thr3_nuke_intr_525:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_525), 16, 16)) -> intp(2, 2, 1)
	.word 0x862c22e3  ! 1: ANDN_I	andn 	%r16, 0x02e3, %r3
	.word 0xab3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r21
thr3_resum_intr_526:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_526), 16, 16)) -> intp(2, 3, 1)
	.word 0x8f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r7
	.word 0xa92c0011  ! 1: SLL_R	sll 	%r16, %r17, %r20
thr3_nuke_intr_527:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_527), 16, 16)) -> intp(2, 2, 1)
	.word 0x940c0011  ! 1: AND_R	and 	%r16, %r17, %r10
	.word 0x922c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r9
	.word 0xac140011  ! 1: OR_R	or 	%r16, %r17, %r22
thr3_resum_intr_528:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_528), 16, 16)) -> intp(2, 3, 1)
	.word 0x96842add  ! 1: ADDcc_I	addcc 	%r16, 0x0add, %r11
	.word 0x86140011  ! 1: OR_R	or 	%r16, %r17, %r3
	.word 0xa97c0411  ! 1: MOVR_R	move	%r16, %r17, %r20
thr3_nuke_intr_529:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_529), 16, 16)) -> intp(1, 2, 1)
	.word 0xb9340011  ! 1: SRL_R	srl 	%r16, %r17, %r28
	.word 0xb8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r28
	.word 0x94342f97  ! 1: ORN_I	orn 	%r16, 0x0f97, %r10
thr3_resum_intr_530:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_530), 16, 16)) -> intp(1, 3, 1)
	.word 0x8844212a  ! 1: ADDC_I	addc 	%r16, 0x012a, %r4
	.word 0xa6140011  ! 1: OR_R	or 	%r16, %r17, %r19
	.word 0x872c0011  ! 1: SLL_R	sll 	%r16, %r17, %r3
thr3_hw_intr_531:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_531), 16, 16)) -> intp(0, 0, 1)
	.word 0x9a942d0d  ! 1: ORcc_I	orcc 	%r16, 0x0d0d, %r13
	.word 0x872c0011  ! 1: SLL_R	sll 	%r16, %r17, %r3
	.word 0xa83c2edd  ! 1: XNOR_I	xnor 	%r16, 0x0edd, %r20
thr3_hw_intr_532:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_532), 16, 16)) -> intp(0, 0, 1)
	.word 0x893c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r4
thr3_nuke_intr_533:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_533), 16, 16)) -> intp(2, 2, 1)
	.word 0xb6ac2e86  ! 1: ANDNcc_I	andncc 	%r16, 0x0e86, %r27
	.word 0xaa440011  ! 1: ADDC_R	addc 	%r16, %r17, %r21
	.word 0xa6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r19
thr3_resum_intr_534:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_534), 16, 16)) -> intp(2, 3, 1)
	.word 0xa8c425bf  ! 1: ADDCcc_I	addccc 	%r16, 0x05bf, %r20
	.word 0x883c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x888c2a04  ! 1: ANDcc_I	andcc 	%r16, 0x0a04, %r4
thr3_nuke_intr_535:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_535), 16, 16)) -> intp(1, 2, 1)
	.word 0x94942828  ! 1: ORcc_I	orcc 	%r16, 0x0828, %r10
	.word 0xab341011  ! 1: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x849c2241  ! 1: XORcc_I	xorcc 	%r16, 0x0241, %r2
thr3_resum_intr_536:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_536), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e0c2b8c  ! 1: AND_I	and 	%r16, 0x0b8c, %r7
	.word 0x989c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x90840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r8
thr3_nuke_intr_537:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_537), 16, 16)) -> intp(0, 2, 1)
	.word 0x96bc2e88  ! 1: XNORcc_I	xnorcc 	%r16, 0x0e88, %r11
	.word 0x98940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0xa6842315  ! 1: ADDcc_I	addcc 	%r16, 0x0315, %r19
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
thr3_resum_intr_538:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_538), 16, 16)) -> intp(0, 3, 1)
	.word 0x8f2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x8e842217  ! 1: ADDcc_I	addcc 	%r16, 0x0217, %r7
	.word 0xb82c291f  ! 1: ANDN_I	andn 	%r16, 0x091f, %r28
	.word 0xac8c252e  ! 1: ANDcc_I	andcc 	%r16, 0x052e, %r22
thr3_nuke_intr_539:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_539), 16, 16)) -> intp(1, 2, 1)
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
	.word 0xae840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r23
thr3_resum_intr_540:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_540), 16, 16)) -> intp(1, 3, 1)
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
	.word 0xa9343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r20
thr3_nuke_intr_541:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_541), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r27
	.word 0x82b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0xb6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r27
thr3_resum_intr_542:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_542), 16, 16)) -> intp(0, 3, 1)
	.word 0x83643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa6ac293b  ! 1: ANDNcc_I	andncc 	%r16, 0x093b, %r19
	.word 0x9e2c2d29  ! 1: ANDN_I	andn 	%r16, 0x0d29, %r15
thr3_hw_intr_543:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_543), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9340011  ! 1: SRL_R	srl 	%r16, %r17, %r28
	.word 0x922c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r9
thr3_hw_intr_544:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_544), 16, 16)) -> intp(0, 0, 1)
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x98840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0x89641811  ! 1: MOVcc_R	<illegal instruction>
thr3_hw_intr_545:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_545), 16, 16)) -> intp(1, 0, 1)
	.word 0x86ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r3
thr3_nuke_intr_546:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_546), 16, 16)) -> intp(2, 2, 1)
	.word 0x82940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x963c291d  ! 1: XNOR_I	xnor 	%r16, 0x091d, %r11
thr3_resum_intr_547:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_547), 16, 16)) -> intp(2, 3, 1)
	.word 0x92942959  ! 1: ORcc_I	orcc 	%r16, 0x0959, %r9
	.word 0xa82c23bc  ! 1: ANDN_I	andn 	%r16, 0x03bc, %r20
thr3_hw_intr_548:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_548), 16, 16)) -> intp(0, 0, 1)
	.word 0x8e040011  ! 1: ADD_R	add 	%r16, %r17, %r7
	.word 0x8234254c  ! 1: ORN_I	orn 	%r16, 0x054c, %r1
	.word 0x9ebc207b  ! 1: XNORcc_I	xnorcc 	%r16, 0x007b, %r15
thr3_hw_intr_549:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_549), 16, 16)) -> intp(2, 0, 1)
	.word 0x84ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r2
thr3_nuke_intr_550:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_550), 16, 16)) -> intp(1, 2, 1)
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
thr3_resum_intr_551:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_551), 16, 16)) -> intp(1, 3, 1)
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
thr3_hw_intr_552:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_552), 16, 16)) -> intp(1, 0, 1)
	.word 0x96042c8b  ! 1: ADD_I	add 	%r16, 0x0c8b, %r11
thr3_hw_intr_553:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_553), 16, 16)) -> intp(1, 0, 1)
	.word 0x997c0411  ! 1: MOVR_R	move	%r16, %r17, %r12
	.word 0xb4b4255f  ! 1: ORNcc_I	orncc 	%r16, 0x055f, %r26
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
thr3_hw_intr_554:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_554), 16, 16)) -> intp(0, 0, 1)
	.word 0x99342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x89343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0xaebc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r23
thr3_nuke_intr_555:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_555), 16, 16)) -> intp(0, 2, 1)
	.word 0x88ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x8ab4206b  ! 1: ORNcc_I	orncc 	%r16, 0x006b, %r5
	.word 0xb2042574  ! 1: ADD_I	add 	%r16, 0x0574, %r25
thr3_resum_intr_556:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_556), 16, 16)) -> intp(0, 3, 1)
	.word 0x8e2c27b0  ! 1: ANDN_I	andn 	%r16, 0x07b0, %r7
	.word 0xb6c42e71  ! 1: ADDCcc_I	addccc 	%r16, 0x0e71, %r27
	.word 0x9c142aa2  ! 1: OR_I	or 	%r16, 0x0aa2, %r14
thr3_nuke_intr_557:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_557), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r27
thr3_resum_intr_558:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_558), 16, 16)) -> intp(0, 3, 1)
	.word 0x90942ab0  ! 1: ORcc_I	orcc 	%r16, 0x0ab0, %r8
thr3_hw_intr_559:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_559), 16, 16)) -> intp(1, 0, 1)
	.word 0xb97c2401  ! 1: MOVR_I	move	%r16, 0xfffffeb0, %r28
	.word 0x98ac2b75  ! 1: ANDNcc_I	andncc 	%r16, 0x0b75, %r12
	.word 0xb68c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x85643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_560:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_560), 16, 16)) -> intp(2, 2, 1)
	.word 0x857c0411  ! 1: MOVR_R	move	%r16, %r17, %r2
	.word 0x841c2821  ! 1: XOR_I	xor 	%r16, 0x0821, %r2
	.word 0xb6bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r27
thr3_resum_intr_561:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_561), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c9c2a5d  ! 1: XORcc_I	xorcc 	%r16, 0x0a5d, %r6
	.word 0x95342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x973c0011  ! 1: SRA_R	sra 	%r16, %r17, %r11
thr3_hw_intr_562:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_562), 16, 16)) -> intp(2, 0, 1)
	.word 0xb0ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r24
thr3_hw_intr_563:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_563), 16, 16)) -> intp(0, 0, 1)
	.word 0x863c27d0  ! 1: XNOR_I	xnor 	%r16, 0x07d0, %r3
thr3_nuke_intr_564:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_564), 16, 16)) -> intp(1, 2, 1)
	.word 0x9f343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0xb0042005  ! 1: ADD_I	add 	%r16, 0x0005, %r24
	.word 0xb09c2a27  ! 1: XORcc_I	xorcc 	%r16, 0x0a27, %r24
thr3_resum_intr_565:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_565), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r15
	.word 0x82bc2cac  ! 1: XNORcc_I	xnorcc 	%r16, 0x0cac, %r1
	.word 0xa9342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r20
thr3_nuke_intr_566:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_566), 16, 16)) -> intp(1, 2, 1)
	.word 0x953c1011  ! 1: SRAX_R	srax	%r16, %r17, %r10
	.word 0xb6bc242a  ! 1: XNORcc_I	xnorcc 	%r16, 0x042a, %r27
	.word 0x84b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0x9c140011  ! 1: OR_R	or 	%r16, %r17, %r14
thr3_resum_intr_567:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_567), 16, 16)) -> intp(1, 3, 1)
	.word 0x94b42403  ! 1: ORNcc_I	orncc 	%r16, 0x0403, %r10
	.word 0xa6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r19
	.word 0xae940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0x943c229d  ! 1: XNOR_I	xnor 	%r16, 0x029d, %r10
thr3_nuke_intr_568:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_568), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c340011  ! 1: ORN_R	orn 	%r16, %r17, %r6
	.word 0x8a842a11  ! 1: ADDcc_I	addcc 	%r16, 0x0a11, %r5
	.word 0xbb2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x9f643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_569:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_569), 16, 16)) -> intp(2, 3, 1)
	.word 0xac042379  ! 1: ADD_I	add 	%r16, 0x0379, %r22
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x85641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
thr3_nuke_intr_570:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_570), 16, 16)) -> intp(2, 2, 1)
	.word 0xaa442ffa  ! 1: ADDC_I	addc 	%r16, 0x0ffa, %r21
	.word 0x9b3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r13
thr3_resum_intr_571:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_571), 16, 16)) -> intp(2, 3, 1)
	.word 0x96c42860  ! 1: ADDCcc_I	addccc 	%r16, 0x0860, %r11
	.word 0xa64421fb  ! 1: ADDC_I	addc 	%r16, 0x01fb, %r19
thr3_hw_intr_572:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_572), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0xb004252c  ! 1: ADD_I	add 	%r16, 0x052c, %r24
thr3_hw_intr_573:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_573), 16, 16)) -> intp(2, 0, 1)
	.word 0xb63c2385  ! 1: XNOR_I	xnor 	%r16, 0x0385, %r27
	.word 0x90440011  ! 1: ADDC_R	addc 	%r16, %r17, %r8
	.word 0x9c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r14
thr3_nuke_intr_574:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_574), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6c42498  ! 1: ADDCcc_I	addccc 	%r16, 0x0498, %r27
	.word 0x9c942b8b  ! 1: ORcc_I	orcc 	%r16, 0x0b8b, %r14
	.word 0x9a340011  ! 1: ORN_R	orn 	%r16, %r17, %r13
thr3_resum_intr_575:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_575), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x902c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r8
	.word 0xa6940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r19
thr3_hw_intr_576:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_576), 16, 16)) -> intp(2, 0, 1)
	.word 0x957c0411  ! 1: MOVR_R	move	%r16, %r17, %r10
	.word 0x8b2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x8a442a69  ! 1: ADDC_I	addc 	%r16, 0x0a69, %r5
thr3_nuke_intr_577:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_577), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6440011  ! 1: ADDC_R	addc 	%r16, %r17, %r27
	.word 0xba8c286d  ! 1: ANDcc_I	andcc 	%r16, 0x086d, %r29
	.word 0x9c042fdf  ! 1: ADD_I	add 	%r16, 0x0fdf, %r14
	.word 0x924426ab  ! 1: ADDC_I	addc 	%r16, 0x06ab, %r9
thr3_resum_intr_578:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_578), 16, 16)) -> intp(0, 3, 1)
	.word 0x91641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x932c0011  ! 1: SLL_R	sll 	%r16, %r17, %r9
	.word 0x928c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r9
	.word 0x852c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r2
thr3_hw_intr_579:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_579), 16, 16)) -> intp(0, 0, 1)
	.word 0x82942364  ! 1: ORcc_I	orcc 	%r16, 0x0364, %r1
thr3_hw_intr_580:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_580), 16, 16)) -> intp(2, 0, 1)
	.word 0xad2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r22
thr3_hw_intr_581:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_581), 16, 16)) -> intp(2, 0, 1)
	.word 0xba1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r29
	.word 0xbb342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r29
thr3_nuke_intr_582:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_582), 16, 16)) -> intp(1, 2, 1)
	.word 0xaf7c0411  ! 1: MOVR_R	move	%r16, %r17, %r23
	.word 0x903c2f5d  ! 1: XNOR_I	xnor 	%r16, 0x0f5d, %r8
	.word 0xa6c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r19
thr3_resum_intr_583:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_583), 16, 16)) -> intp(1, 3, 1)
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x981c2f32  ! 1: XOR_I	xor 	%r16, 0x0f32, %r12
	.word 0xa6ac2718  ! 1: ANDNcc_I	andncc 	%r16, 0x0718, %r19
thr3_hw_intr_584:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_584), 16, 16)) -> intp(2, 0, 1)
	.word 0xb2940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0x8e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r7
thr3_hw_intr_585:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_585), 16, 16)) -> intp(1, 0, 1)
	.word 0xac9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r22
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
thr3_hw_intr_586:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_586), 16, 16)) -> intp(2, 0, 1)
	.word 0x9e3c2dca  ! 1: XNOR_I	xnor 	%r16, 0x0dca, %r15
	.word 0x8c8c2297  ! 1: ANDcc_I	andcc 	%r16, 0x0297, %r6
thr3_hw_intr_587:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_587), 16, 16)) -> intp(1, 0, 1)
	.word 0x86ac2d59  ! 1: ANDNcc_I	andncc 	%r16, 0x0d59, %r3
	.word 0xa60c2d85  ! 1: AND_I	and 	%r16, 0x0d85, %r19
thr3_nuke_intr_588:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_588), 16, 16)) -> intp(0, 2, 1)
	.word 0x977c2401  ! 1: MOVR_I	move	%r16, 0xd85, %r11
	.word 0x8e842f19  ! 1: ADDcc_I	addcc 	%r16, 0x0f19, %r7
thr3_resum_intr_589:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_589), 16, 16)) -> intp(0, 3, 1)
	.word 0x957c2401  ! 1: MOVR_I	move	%r16, 0xffffff19, %r10
	.word 0xb6ac2927  ! 1: ANDNcc_I	andncc 	%r16, 0x0927, %r27
thr3_nuke_intr_590:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_590), 16, 16)) -> intp(2, 2, 1)
	.word 0x821c29fd  ! 1: XOR_I	xor 	%r16, 0x09fd, %r1
	.word 0xaf7c0411  ! 1: MOVR_R	move	%r16, %r17, %r23
	.word 0x86c42e4e  ! 1: ADDCcc_I	addccc 	%r16, 0x0e4e, %r3
thr3_resum_intr_591:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_591), 16, 16)) -> intp(2, 3, 1)
	.word 0x901c0011  ! 1: XOR_R	xor 	%r16, %r17, %r8
	.word 0x923c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x912c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r8
thr3_nuke_intr_592:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_592), 16, 16)) -> intp(1, 2, 1)
	.word 0x9ab421cf  ! 1: ORNcc_I	orncc 	%r16, 0x01cf, %r13
	.word 0x8e8c2a6d  ! 1: ANDcc_I	andcc 	%r16, 0x0a6d, %r7
thr3_resum_intr_593:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_593), 16, 16)) -> intp(1, 3, 1)
	.word 0xad2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r22
	.word 0x9e8c253f  ! 1: ANDcc_I	andcc 	%r16, 0x053f, %r15
thr3_nuke_intr_594:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_594), 16, 16)) -> intp(1, 2, 1)
	.word 0xa6340011  ! 1: ORN_R	orn 	%r16, %r17, %r19
	.word 0x94440011  ! 1: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x95641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xac9c282a  ! 1: XORcc_I	xorcc 	%r16, 0x082a, %r22
thr3_resum_intr_595:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_595), 16, 16)) -> intp(1, 3, 1)
	.word 0x832c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r1
	.word 0xb2140011  ! 1: OR_R	or 	%r16, %r17, %r25
	.word 0xba3c23bd  ! 1: XNOR_I	xnor 	%r16, 0x03bd, %r29
	.word 0x9e3424c9  ! 1: ORN_I	orn 	%r16, 0x04c9, %r15
thr3_hw_intr_596:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_596), 16, 16)) -> intp(1, 0, 1)
	.word 0xab7c2401  ! 1: MOVR_I	move	%r16, 0x4c9, %r21
	.word 0x90b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0x87340011  ! 1: SRL_R	srl 	%r16, %r17, %r3
	.word 0x8b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r5
thr3_nuke_intr_597:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_597), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8442158  ! 1: ADDC_I	addc 	%r16, 0x0158, %r20
	.word 0xb88c2d0a  ! 1: ANDcc_I	andcc 	%r16, 0x0d0a, %r28
thr3_resum_intr_598:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_598), 16, 16)) -> intp(1, 3, 1)
	.word 0xba3c2216  ! 1: XNOR_I	xnor 	%r16, 0x0216, %r29
	.word 0x90140011  ! 1: OR_R	or 	%r16, %r17, %r8
thr3_hw_intr_599:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_599), 16, 16)) -> intp(0, 0, 1)
	.word 0x96440011  ! 1: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
	.word 0x9e9422d0  ! 1: ORcc_I	orcc 	%r16, 0x02d0, %r15
	.word 0x9b643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_600:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_600), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6842d2d  ! 1: ADDcc_I	addcc 	%r16, 0x0d2d, %r27
thr3_resum_intr_601:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_601), 16, 16)) -> intp(0, 3, 1)
	.word 0x98140011  ! 1: OR_R	or 	%r16, %r17, %r12
thr3_nuke_intr_602:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_602), 16, 16)) -> intp(2, 2, 1)
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
	.word 0xb8bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0x98140011  ! 1: OR_R	or 	%r16, %r17, %r12
	.word 0x94142ef5  ! 1: OR_I	or 	%r16, 0x0ef5, %r10
thr3_resum_intr_603:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_603), 16, 16)) -> intp(2, 3, 1)
	.word 0x8ac42036  ! 1: ADDCcc_I	addccc 	%r16, 0x0036, %r5
	.word 0x96140011  ! 1: OR_R	or 	%r16, %r17, %r11
	.word 0x853c0011  ! 1: SRA_R	sra 	%r16, %r17, %r2
	.word 0x952c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r10
thr3_nuke_intr_604:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_604), 16, 16)) -> intp(0, 2, 1)
	.word 0x94040011  ! 1: ADD_R	add 	%r16, %r17, %r10
	.word 0x8d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0xaeac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r23
thr3_resum_intr_605:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_605), 16, 16)) -> intp(0, 3, 1)
	.word 0x99341011  ! 1: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x972c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r11
	.word 0x9a1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r13
thr3_nuke_intr_606:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_606), 16, 16)) -> intp(2, 2, 1)
	.word 0x9e440011  ! 1: ADDC_R	addc 	%r16, %r17, %r15
	.word 0x85340011  ! 1: SRL_R	srl 	%r16, %r17, %r2
thr3_resum_intr_607:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_607), 16, 16)) -> intp(2, 3, 1)
	.word 0x8f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r7
	.word 0xb49c2cfa  ! 1: XORcc_I	xorcc 	%r16, 0x0cfa, %r26
thr3_hw_intr_608:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_608), 16, 16)) -> intp(2, 0, 1)
	.word 0xb9641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb294266e  ! 1: ORcc_I	orcc 	%r16, 0x066e, %r25
	.word 0xaebc205d  ! 1: XNORcc_I	xnorcc 	%r16, 0x005d, %r23
thr3_hw_intr_609:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_609), 16, 16)) -> intp(2, 0, 1)
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
	.word 0x9a9421c1  ! 1: ORcc_I	orcc 	%r16, 0x01c1, %r13
	.word 0x82340011  ! 1: ORN_R	orn 	%r16, %r17, %r1
thr3_nuke_intr_610:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_610), 16, 16)) -> intp(0, 2, 1)
	.word 0x8a0c2f48  ! 1: AND_I	and 	%r16, 0x0f48, %r5
	.word 0xb8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0xb13c1011  ! 1: SRAX_R	srax	%r16, %r17, %r24
thr3_resum_intr_611:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_611), 16, 16)) -> intp(0, 3, 1)
	.word 0x94440011  ! 1: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x929c296e  ! 1: XORcc_I	xorcc 	%r16, 0x096e, %r9
	.word 0x8ab423e9  ! 1: ORNcc_I	orncc 	%r16, 0x03e9, %r5
thr3_hw_intr_612:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_612), 16, 16)) -> intp(1, 0, 1)
	.word 0x963428af  ! 1: ORN_I	orn 	%r16, 0x08af, %r11
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
	.word 0x8a8c2dcb  ! 1: ANDcc_I	andcc 	%r16, 0x0dcb, %r5
thr3_hw_intr_613:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_613), 16, 16)) -> intp(1, 0, 1)
	.word 0xa6842085  ! 1: ADDcc_I	addcc 	%r16, 0x0085, %r19
	.word 0x852c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r2
thr3_nuke_intr_614:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_614), 16, 16)) -> intp(1, 2, 1)
	.word 0xa6bc25d3  ! 1: XNORcc_I	xnorcc 	%r16, 0x05d3, %r19
	.word 0x84840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0xaabc2d78  ! 1: XNORcc_I	xnorcc 	%r16, 0x0d78, %r21
	.word 0x95343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r10
thr3_resum_intr_615:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_615), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r15
	.word 0xa69c2505  ! 1: XORcc_I	xorcc 	%r16, 0x0505, %r19
	.word 0x900c2749  ! 1: AND_I	and 	%r16, 0x0749, %r8
	.word 0x8c940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r6
thr3_hw_intr_616:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_616), 16, 16)) -> intp(2, 0, 1)
	.word 0xa8942f2c  ! 1: ORcc_I	orcc 	%r16, 0x0f2c, %r20
	.word 0x8d343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0xaf3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r23
	.word 0x8f342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r7
thr3_nuke_intr_617:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_617), 16, 16)) -> intp(1, 2, 1)
	.word 0x860c288f  ! 1: AND_I	and 	%r16, 0x088f, %r3
	.word 0x8abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0x9abc2474  ! 1: XNORcc_I	xnorcc 	%r16, 0x0474, %r13
	.word 0x86c42771  ! 1: ADDCcc_I	addccc 	%r16, 0x0771, %r3
thr3_resum_intr_618:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_618), 16, 16)) -> intp(1, 3, 1)
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0x900c0011  ! 1: AND_R	and 	%r16, %r17, %r8
	.word 0xad2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r22
thr3_nuke_intr_619:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_619), 16, 16)) -> intp(2, 2, 1)
	.word 0xb43c2b3d  ! 1: XNOR_I	xnor 	%r16, 0x0b3d, %r26
thr3_resum_intr_620:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_620), 16, 16)) -> intp(2, 3, 1)
	.word 0xb1340011  ! 1: SRL_R	srl 	%r16, %r17, %r24
thr3_nuke_intr_621:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_621), 16, 16)) -> intp(1, 2, 1)
	.word 0x8a0c0011  ! 1: AND_R	and 	%r16, %r17, %r5
	.word 0x8f641811  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_622:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_622), 16, 16)) -> intp(1, 3, 1)
	.word 0xb7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0x869c21b9  ! 1: XORcc_I	xorcc 	%r16, 0x01b9, %r3
thr3_hw_intr_623:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_623), 16, 16)) -> intp(1, 0, 1)
	.word 0x92bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0xb73c0011  ! 1: SRA_R	sra 	%r16, %r17, %r27
	.word 0x892c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r4
thr3_hw_intr_624:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_624), 16, 16)) -> intp(1, 0, 1)
	.word 0x86ac23c7  ! 1: ANDNcc_I	andncc 	%r16, 0x03c7, %r3
thr3_hw_intr_625:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_625), 16, 16)) -> intp(1, 0, 1)
	.word 0x929c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0xae140011  ! 1: OR_R	or 	%r16, %r17, %r23
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
	.word 0xb2840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r25
thr3_hw_intr_626:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_626), 16, 16)) -> intp(0, 0, 1)
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0xba3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r29
thr3_hw_intr_627:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_627), 16, 16)) -> intp(2, 0, 1)
	.word 0xb48c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0x968424a5  ! 1: ADDcc_I	addcc 	%r16, 0x04a5, %r11
	.word 0xac340011  ! 1: ORN_R	orn 	%r16, %r17, %r22
thr3_hw_intr_628:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_628), 16, 16)) -> intp(1, 0, 1)
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
thr3_nuke_intr_629:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_629), 16, 16)) -> intp(1, 2, 1)
	.word 0xbabc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r29
thr3_resum_intr_630:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_630), 16, 16)) -> intp(1, 3, 1)
	.word 0x9c1c2ede  ! 1: XOR_I	xor 	%r16, 0x0ede, %r14
thr3_nuke_intr_631:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_631), 16, 16)) -> intp(1, 2, 1)
	.word 0x8b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r5
thr3_resum_intr_632:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_632), 16, 16)) -> intp(1, 3, 1)
	.word 0xa8ac2030  ! 1: ANDNcc_I	andncc 	%r16, 0x0030, %r20
thr3_hw_intr_633:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_633), 16, 16)) -> intp(0, 0, 1)
	.word 0xb0440011  ! 1: ADDC_R	addc 	%r16, %r17, %r24
thr3_nuke_intr_634:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_634), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0x823c2f4c  ! 1: XNOR_I	xnor 	%r16, 0x0f4c, %r1
	.word 0x82b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r1
thr3_resum_intr_635:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_635), 16, 16)) -> intp(0, 3, 1)
	.word 0x9d7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r14
	.word 0xb8942be4  ! 1: ORcc_I	orcc 	%r16, 0x0be4, %r28
	.word 0x86340011  ! 1: ORN_R	orn 	%r16, %r17, %r3
thr3_nuke_intr_636:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_636), 16, 16)) -> intp(2, 2, 1)
	.word 0x8c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r6
	.word 0xb12c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r24
thr3_resum_intr_637:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_637), 16, 16)) -> intp(2, 3, 1)
	.word 0xaf341011  ! 1: SRLX_R	srlx	%r16, %r17, %r23
	.word 0x8e9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r7
thr3_nuke_intr_638:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_638), 16, 16)) -> intp(1, 2, 1)
	.word 0x948c2320  ! 1: ANDcc_I	andcc 	%r16, 0x0320, %r10
thr3_resum_intr_639:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_639), 16, 16)) -> intp(1, 3, 1)
	.word 0x9ab42623  ! 1: ORNcc_I	orncc 	%r16, 0x0623, %r13
thr3_nuke_intr_640:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_640), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r26
thr3_resum_intr_641:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_641), 16, 16)) -> intp(0, 3, 1)
	.word 0xa6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r19
thr3_nuke_intr_642:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_642), 16, 16)) -> intp(2, 2, 1)
	.word 0xa8b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r20
	.word 0x820c220c  ! 1: AND_I	and 	%r16, 0x020c, %r1
	.word 0xbb2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r29
thr3_resum_intr_643:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_643), 16, 16)) -> intp(2, 3, 1)
	.word 0x832c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0xa8342680  ! 1: ORN_I	orn 	%r16, 0x0680, %r20
	.word 0x9d2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r14
thr3_hw_intr_644:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_644), 16, 16)) -> intp(2, 0, 1)
	.word 0x869427bb  ! 1: ORcc_I	orcc 	%r16, 0x07bb, %r3
	.word 0x86b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r3
thr3_hw_intr_645:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_645), 16, 16)) -> intp(2, 0, 1)
	.word 0x9a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x8c140011  ! 1: OR_R	or 	%r16, %r17, %r6
	.word 0xba2c2ae0  ! 1: ANDN_I	andn 	%r16, 0x0ae0, %r29
thr3_nuke_intr_646:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_646), 16, 16)) -> intp(0, 2, 1)
	.word 0x89343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r4
thr3_resum_intr_647:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_647), 16, 16)) -> intp(0, 3, 1)
	.word 0x83341011  ! 1: SRLX_R	srlx	%r16, %r17, %r1
thr3_hw_intr_648:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_648), 16, 16)) -> intp(2, 0, 1)
	.word 0xb2340011  ! 1: ORN_R	orn 	%r16, %r17, %r25
thr3_hw_intr_649:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_649), 16, 16)) -> intp(1, 0, 1)
	.word 0xb1341011  ! 1: SRLX_R	srlx	%r16, %r17, %r24
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0xb4bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r26
thr3_nuke_intr_650:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_650), 16, 16)) -> intp(1, 2, 1)
	.word 0x8c3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
thr3_resum_intr_651:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_651), 16, 16)) -> intp(1, 3, 1)
	.word 0x9e8c2aa1  ! 1: ANDcc_I	andcc 	%r16, 0x0aa1, %r15
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
thr3_hw_intr_652:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_652), 16, 16)) -> intp(2, 0, 1)
	.word 0xb33c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0x9c140011  ! 1: OR_R	or 	%r16, %r17, %r14
	.word 0x86340011  ! 1: ORN_R	orn 	%r16, %r17, %r3
	.word 0x8f3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r7
thr3_hw_intr_653:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_653), 16, 16)) -> intp(1, 0, 1)
	.word 0x869c24f7  ! 1: XORcc_I	xorcc 	%r16, 0x04f7, %r3
	.word 0xb6142f08  ! 1: OR_I	or 	%r16, 0x0f08, %r27
thr3_hw_intr_654:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_654), 16, 16)) -> intp(1, 0, 1)
	.word 0x9a840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x82340011  ! 1: ORN_R	orn 	%r16, %r17, %r1
thr3_nuke_intr_655:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_655), 16, 16)) -> intp(2, 2, 1)
	.word 0xaa8426d8  ! 1: ADDcc_I	addcc 	%r16, 0x06d8, %r21
	.word 0x968c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r11
	.word 0x921c2423  ! 1: XOR_I	xor 	%r16, 0x0423, %r9
thr3_resum_intr_656:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_656), 16, 16)) -> intp(2, 3, 1)
	.word 0x9eac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x861c0011  ! 1: XOR_R	xor 	%r16, %r17, %r3
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
thr3_hw_intr_657:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_657), 16, 16)) -> intp(2, 0, 1)
	.word 0x9c440011  ! 1: ADDC_R	addc 	%r16, %r17, %r14
thr3_nuke_intr_658:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_658), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf7c0411  ! 1: MOVR_R	move	%r16, %r17, %r23
thr3_resum_intr_659:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_659), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa942f4a  ! 1: ORcc_I	orcc 	%r16, 0x0f4a, %r21
thr3_nuke_intr_660:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_660), 16, 16)) -> intp(0, 2, 1)
	.word 0x888c20e7  ! 1: ANDcc_I	andcc 	%r16, 0x00e7, %r4
	.word 0xb2940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0xb43424e2  ! 1: ORN_I	orn 	%r16, 0x04e2, %r26
thr3_resum_intr_661:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_661), 16, 16)) -> intp(0, 3, 1)
	.word 0x94940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0xbb3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r29
	.word 0x920c2278  ! 1: AND_I	and 	%r16, 0x0278, %r9
thr3_nuke_intr_662:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_662), 16, 16)) -> intp(1, 2, 1)
	.word 0xac140011  ! 1: OR_R	or 	%r16, %r17, %r22
thr3_resum_intr_663:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_663), 16, 16)) -> intp(1, 3, 1)
	.word 0x917c2401  ! 1: MOVR_I	move	%r16, 0x11, %r8
thr3_nuke_intr_664:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_664), 16, 16)) -> intp(2, 2, 1)
	.word 0x933c0011  ! 1: SRA_R	sra 	%r16, %r17, %r9
	.word 0x8f2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r7
	.word 0xa6b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0x9e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r15
thr3_resum_intr_665:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_665), 16, 16)) -> intp(2, 3, 1)
	.word 0x8c040011  ! 1: ADD_R	add 	%r16, %r17, %r6
	.word 0x82ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0xab2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r21
	.word 0x8a8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r5
thr3_hw_intr_666:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_666), 16, 16)) -> intp(2, 0, 1)
	.word 0x91341011  ! 1: SRLX_R	srlx	%r16, %r17, %r8
thr3_nuke_intr_667:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_667), 16, 16)) -> intp(2, 2, 1)
	.word 0x8b2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r5
	.word 0xb0ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r24
thr3_resum_intr_668:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_668), 16, 16)) -> intp(2, 3, 1)
	.word 0x9abc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x8f340011  ! 1: SRL_R	srl 	%r16, %r17, %r7
thr3_hw_intr_669:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_669), 16, 16)) -> intp(0, 0, 1)
	.word 0x94140011  ! 1: OR_R	or 	%r16, %r17, %r10
	.word 0x957c2401  ! 1: MOVR_I	move	%r16, 0x11, %r10
	.word 0x9a8425dd  ! 1: ADDcc_I	addcc 	%r16, 0x05dd, %r13
thr3_hw_intr_670:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_670), 16, 16)) -> intp(2, 0, 1)
	.word 0xa77c0411  ! 1: MOVR_R	move	%r16, %r17, %r19
thr3_nuke_intr_671:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_671), 16, 16)) -> intp(2, 2, 1)
	.word 0x981c25dd  ! 1: XOR_I	xor 	%r16, 0x05dd, %r12
	.word 0x90ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x893c1011  ! 1: SRAX_R	srax	%r16, %r17, %r4
thr3_resum_intr_672:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_672), 16, 16)) -> intp(2, 3, 1)
	.word 0xae942df8  ! 1: ORcc_I	orcc 	%r16, 0x0df8, %r23
	.word 0xb37c0411  ! 1: MOVR_R	move	%r16, %r17, %r25
	.word 0xb2940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r25
thr3_hw_intr_673:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_673), 16, 16)) -> intp(0, 0, 1)
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
thr3_nuke_intr_674:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_674), 16, 16)) -> intp(2, 2, 1)
	.word 0x88c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x91340011  ! 1: SRL_R	srl 	%r16, %r17, %r8
	.word 0xa8940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r20
	.word 0x903c2654  ! 1: XNOR_I	xnor 	%r16, 0x0654, %r8
thr3_resum_intr_675:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_675), 16, 16)) -> intp(2, 3, 1)
	.word 0x8b7c2401  ! 1: MOVR_I	move	%r16, 0xfffffe54, %r5
	.word 0x9d341011  ! 1: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x86942fc8  ! 1: ORcc_I	orcc 	%r16, 0x0fc8, %r3
	.word 0x8a3c27c6  ! 1: XNOR_I	xnor 	%r16, 0x07c6, %r5
thr3_hw_intr_676:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_676), 16, 16)) -> intp(1, 0, 1)
	.word 0x98b42228  ! 1: ORNcc_I	orncc 	%r16, 0x0228, %r12
	.word 0x94c427f4  ! 1: ADDCcc_I	addccc 	%r16, 0x07f4, %r10
	.word 0x88ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r4
thr3_hw_intr_677:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_677), 16, 16)) -> intp(1, 0, 1)
	.word 0x8cbc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x912c0011  ! 1: SLL_R	sll 	%r16, %r17, %r8
thr3_nuke_intr_678:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_678), 16, 16)) -> intp(2, 2, 1)
	.word 0x9d643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xaebc2b07  ! 1: XNORcc_I	xnorcc 	%r16, 0x0b07, %r23
	.word 0x8b7c2401  ! 1: MOVR_I	move	%r16, 0xffffff07, %r5
	.word 0xb63c29b7  ! 1: XNOR_I	xnor 	%r16, 0x09b7, %r27
thr3_resum_intr_679:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_679), 16, 16)) -> intp(2, 3, 1)
	.word 0xb33c0011  ! 1: SRA_R	sra 	%r16, %r17, %r25
	.word 0x9e0c0011  ! 1: AND_R	and 	%r16, %r17, %r15
	.word 0x8d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r6
	.word 0xb1340011  ! 1: SRL_R	srl 	%r16, %r17, %r24
thr3_hw_intr_680:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_680), 16, 16)) -> intp(1, 0, 1)
	.word 0x983c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0x98ac2889  ! 1: ANDNcc_I	andncc 	%r16, 0x0889, %r12
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
	.word 0x82140011  ! 1: OR_R	or 	%r16, %r17, %r1
thr3_hw_intr_681:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_681), 16, 16)) -> intp(1, 0, 1)
	.word 0xa7340011  ! 1: SRL_R	srl 	%r16, %r17, %r19
	.word 0xaf2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r23
thr3_nuke_intr_682:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_682), 16, 16)) -> intp(2, 2, 1)
	.word 0x992c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r12
	.word 0xaf3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r23
thr3_resum_intr_683:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_683), 16, 16)) -> intp(2, 3, 1)
	.word 0xb5342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0x9eb40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r15
thr3_nuke_intr_684:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_684), 16, 16)) -> intp(1, 2, 1)
	.word 0xb2b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0x8d7c2401  ! 1: MOVR_I	move	%r16, 0x11, %r6
	.word 0x95343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0x8ec40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r7
thr3_resum_intr_685:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_685), 16, 16)) -> intp(1, 3, 1)
	.word 0xa8440011  ! 1: ADDC_R	addc 	%r16, %r17, %r20
	.word 0x98ac26ec  ! 1: ANDNcc_I	andncc 	%r16, 0x06ec, %r12
	.word 0x97641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x86bc25e5  ! 1: XNORcc_I	xnorcc 	%r16, 0x05e5, %r3
thr3_nuke_intr_686:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_686), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa140011  ! 1: OR_R	or 	%r16, %r17, %r21
	.word 0x9aac2e8c  ! 1: ANDNcc_I	andncc 	%r16, 0x0e8c, %r13
thr3_resum_intr_687:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_687), 16, 16)) -> intp(1, 3, 1)
	.word 0x961c2f28  ! 1: XOR_I	xor 	%r16, 0x0f28, %r11
	.word 0x9a2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r13
thr3_hw_intr_688:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_688), 16, 16)) -> intp(1, 0, 1)
	.word 0x961c2595  ! 1: XOR_I	xor 	%r16, 0x0595, %r11
	.word 0x8c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r6
	.word 0xb97c2401  ! 1: MOVR_I	move	%r16, 0x11, %r28
	.word 0x90042872  ! 1: ADD_I	add 	%r16, 0x0872, %r8
thr3_hw_intr_689:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_689), 16, 16)) -> intp(1, 0, 1)
	.word 0xae1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r23
	.word 0x963c24eb  ! 1: XNOR_I	xnor 	%r16, 0x04eb, %r11
thr3_hw_intr_690:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_690), 16, 16)) -> intp(2, 0, 1)
	.word 0x8e8c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r7
thr3_nuke_intr_691:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_691), 16, 16)) -> intp(2, 2, 1)
	.word 0x8b341011  ! 1: SRLX_R	srlx	%r16, %r17, %r5
thr3_resum_intr_692:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_692), 16, 16)) -> intp(2, 3, 1)
	.word 0xb0b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r24
thr3_hw_intr_693:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_693), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb7c0411  ! 1: MOVR_R	move	%r16, %r17, %r29
	.word 0xb6ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r27
thr3_hw_intr_694:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_694), 16, 16)) -> intp(0, 0, 1)
	.word 0x82c424cc  ! 1: ADDCcc_I	addccc 	%r16, 0x04cc, %r1
	.word 0x9a8c25b6  ! 1: ANDcc_I	andcc 	%r16, 0x05b6, %r13
	.word 0x948c2673  ! 1: ANDcc_I	andcc 	%r16, 0x0673, %r10
thr3_hw_intr_695:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_695), 16, 16)) -> intp(1, 0, 1)
	.word 0x9cb42354  ! 1: ORNcc_I	orncc 	%r16, 0x0354, %r14
	.word 0xa88420f1  ! 1: ADDcc_I	addcc 	%r16, 0x00f1, %r20
	.word 0xba3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x8c342cca  ! 1: ORN_I	orn 	%r16, 0x0cca, %r6
thr3_hw_intr_696:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_696), 16, 16)) -> intp(1, 0, 1)
	.word 0x9b7c0411  ! 1: MOVR_R	move	%r16, %r17, %r13
	.word 0xae040011  ! 1: ADD_R	add 	%r16, %r17, %r23
	.word 0x88ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r4
thr3_hw_intr_697:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_697), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4442e75  ! 1: ADDC_I	addc 	%r16, 0x0e75, %r26
	.word 0x86ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0x9d342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r14
thr3_hw_intr_698:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_698), 16, 16)) -> intp(0, 0, 1)
	.word 0x943427b4  ! 1: ORN_I	orn 	%r16, 0x07b4, %r10
thr3_nuke_intr_699:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_699), 16, 16)) -> intp(0, 2, 1)
	.word 0xaec425b8  ! 1: ADDCcc_I	addccc 	%r16, 0x05b8, %r23
	.word 0x8cac2972  ! 1: ANDNcc_I	andncc 	%r16, 0x0972, %r6
thr3_resum_intr_700:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_700), 16, 16)) -> intp(0, 3, 1)
	.word 0xac94232b  ! 1: ORcc_I	orcc 	%r16, 0x032b, %r22
	.word 0xb40c2ef6  ! 1: AND_I	and 	%r16, 0x0ef6, %r26
thr3_nuke_intr_701:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_701), 16, 16)) -> intp(1, 2, 1)
	.word 0x9f341011  ! 1: SRLX_R	srlx	%r16, %r17, %r15
thr3_resum_intr_702:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_702), 16, 16)) -> intp(1, 3, 1)
	.word 0x9f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r15
thr3_nuke_intr_703:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_703), 16, 16)) -> intp(0, 2, 1)
	.word 0x8e142f4c  ! 1: OR_I	or 	%r16, 0x0f4c, %r7
	.word 0xb6b42e2e  ! 1: ORNcc_I	orncc 	%r16, 0x0e2e, %r27
	.word 0x98442940  ! 1: ADDC_I	addc 	%r16, 0x0940, %r12
thr3_resum_intr_704:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_704), 16, 16)) -> intp(0, 3, 1)
	.word 0x917c0411  ! 1: MOVR_R	move	%r16, %r17, %r8
	.word 0x82b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x977c0411  ! 1: MOVR_R	move	%r16, %r17, %r11
thr3_nuke_intr_705:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_705), 16, 16)) -> intp(2, 2, 1)
	.word 0x8b641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x913c0011  ! 1: SRA_R	sra 	%r16, %r17, %r8
	.word 0x86ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r3
thr3_resum_intr_706:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_706), 16, 16)) -> intp(2, 3, 1)
	.word 0xb6bc26e6  ! 1: XNORcc_I	xnorcc 	%r16, 0x06e6, %r27
	.word 0xb32c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0x93343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r9
thr3_hw_intr_707:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_707), 16, 16)) -> intp(0, 0, 1)
	.word 0x92bc2118  ! 1: XNORcc_I	xnorcc 	%r16, 0x0118, %r9
	.word 0x957c2401  ! 1: MOVR_I	move	%r16, 0x118, %r10
	.word 0xaa1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r21
thr3_hw_intr_708:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_708), 16, 16)) -> intp(0, 0, 1)
	.word 0x893c0011  ! 1: SRA_R	sra 	%r16, %r17, %r4
	.word 0x9c340011  ! 1: ORN_R	orn 	%r16, %r17, %r14
thr3_nuke_intr_709:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_709), 16, 16)) -> intp(1, 2, 1)
	.word 0x9a940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r13
thr3_resum_intr_710:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_710), 16, 16)) -> intp(1, 3, 1)
	.word 0xb00c2ec9  ! 1: AND_I	and 	%r16, 0x0ec9, %r24
thr3_hw_intr_711:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_711), 16, 16)) -> intp(0, 0, 1)
	.word 0x83340011  ! 1: SRL_R	srl 	%r16, %r17, %r1
	.word 0x849c2661  ! 1: XORcc_I	xorcc 	%r16, 0x0661, %r2
	.word 0xb88c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r28
thr3_hw_intr_712:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_712), 16, 16)) -> intp(0, 0, 1)
	.word 0x99641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb83c23fe  ! 1: XNOR_I	xnor 	%r16, 0x03fe, %r28
	.word 0xa60c268a  ! 1: AND_I	and 	%r16, 0x068a, %r19
thr3_nuke_intr_713:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_713), 16, 16)) -> intp(2, 2, 1)
	.word 0xab2c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0x85340011  ! 1: SRL_R	srl 	%r16, %r17, %r2
thr3_resum_intr_714:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_714), 16, 16)) -> intp(2, 3, 1)
	.word 0xab641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x8b343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r5
thr3_nuke_intr_715:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_715), 16, 16)) -> intp(0, 2, 1)
	.word 0x94940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x8a040011  ! 1: ADD_R	add 	%r16, %r17, %r5
	.word 0x9b2c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r13
	.word 0x83342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r1
thr3_resum_intr_716:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_716), 16, 16)) -> intp(0, 3, 1)
	.word 0xb2b42e68  ! 1: ORNcc_I	orncc 	%r16, 0x0e68, %r25
	.word 0xb03c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r24
	.word 0x877c2401  ! 1: MOVR_I	move	%r16, 0x11, %r3
	.word 0x8ab40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r5
thr3_hw_intr_717:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_717), 16, 16)) -> intp(1, 0, 1)
	.word 0x84b426a2  ! 1: ORNcc_I	orncc 	%r16, 0x06a2, %r2
	.word 0xb49c2d58  ! 1: XORcc_I	xorcc 	%r16, 0x0d58, %r26
	.word 0x849c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x913c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r8
thr3_nuke_intr_718:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_718), 16, 16)) -> intp(2, 2, 1)
	.word 0x9eac2fe1  ! 1: ANDNcc_I	andncc 	%r16, 0x0fe1, %r15
	.word 0x889428fd  ! 1: ORcc_I	orcc 	%r16, 0x08fd, %r4
	.word 0x9e1c0011  ! 1: XOR_R	xor 	%r16, %r17, %r15
thr3_resum_intr_719:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_719), 16, 16)) -> intp(2, 3, 1)
	.word 0x9f3c1011  ! 1: SRAX_R	srax	%r16, %r17, %r15
	.word 0x8c040011  ! 1: ADD_R	add 	%r16, %r17, %r6
	.word 0x89343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r4
thr3_hw_intr_720:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_720), 16, 16)) -> intp(0, 0, 1)
	.word 0x932c0011  ! 1: SLL_R	sll 	%r16, %r17, %r9
	.word 0xb1641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x9ebc2c31  ! 1: XNORcc_I	xnorcc 	%r16, 0x0c31, %r15
thr3_hw_intr_721:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_721), 16, 16)) -> intp(2, 0, 1)
	.word 0xae142ea0  ! 1: OR_I	or 	%r16, 0x0ea0, %r23
	.word 0x941c0011  ! 1: XOR_R	xor 	%r16, %r17, %r10
	.word 0x92142f89  ! 1: OR_I	or 	%r16, 0x0f89, %r9
thr3_hw_intr_722:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_722), 16, 16)) -> intp(1, 0, 1)
	.word 0xa72c1011  ! 1: SLLX_R	sllx	%r16, %r17, %r19
thr3_nuke_intr_723:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_723), 16, 16)) -> intp(0, 2, 1)
	.word 0xba4425e9  ! 1: ADDC_I	addc 	%r16, 0x05e9, %r29
thr3_resum_intr_724:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_724), 16, 16)) -> intp(0, 3, 1)
	.word 0x83643801  ! 1: MOVcc_I	<illegal instruction>
thr3_nuke_intr_725:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_725), 16, 16)) -> intp(1, 2, 1)
	.word 0x94140011  ! 1: OR_R	or 	%r16, %r17, %r10
thr3_resum_intr_726:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_726), 16, 16)) -> intp(1, 3, 1)
	.word 0x84440011  ! 1: ADDC_R	addc 	%r16, %r17, %r2
thr3_nuke_intr_727:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_727), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6b42d4f  ! 1: ORNcc_I	orncc 	%r16, 0x0d4f, %r27
	.word 0x828c0011  ! 1: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x98c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x9e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r15
thr3_resum_intr_728:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_728), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e0c0011  ! 1: AND_R	and 	%r16, %r17, %r7
	.word 0xa8340011  ! 1: ORN_R	orn 	%r16, %r17, %r20
	.word 0xb13c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0x82b420b0  ! 1: ORNcc_I	orncc 	%r16, 0x00b0, %r1
thr3_hw_intr_729:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_729), 16, 16)) -> intp(2, 0, 1)
	.word 0x84ac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x92ac2f81  ! 1: ANDNcc_I	andncc 	%r16, 0x0f81, %r9
thr3_hw_intr_730:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_730), 16, 16)) -> intp(2, 0, 1)
	.word 0x9b342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r13
thr3_nuke_intr_731:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_731), 16, 16)) -> intp(0, 2, 1)
	.word 0x86440011  ! 1: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x97342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r11
thr3_resum_intr_732:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_732), 16, 16)) -> intp(0, 3, 1)
	.word 0x88342bd5  ! 1: ORN_I	orn 	%r16, 0x0bd5, %r4
	.word 0xb8c40011  ! 1: ADDCcc_R	addccc 	%r16, %r17, %r28
thr3_nuke_intr_733:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_733), 16, 16)) -> intp(1, 2, 1)
	.word 0x972c3001  ! 1: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x961420e7  ! 1: OR_I	or 	%r16, 0x00e7, %r11
thr3_resum_intr_734:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_734), 16, 16)) -> intp(1, 3, 1)
	.word 0x869c2778  ! 1: XORcc_I	xorcc 	%r16, 0x0778, %r3
	.word 0x992c0011  ! 1: SLL_R	sll 	%r16, %r17, %r12
thr3_nuke_intr_735:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_735), 16, 16)) -> intp(1, 2, 1)
	.word 0x832c0011  ! 1: SLL_R	sll 	%r16, %r17, %r1
	.word 0x988c21ad  ! 1: ANDcc_I	andcc 	%r16, 0x01ad, %r12
	.word 0x90940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0xaeac0011  ! 1: ANDNcc_R	andncc 	%r16, %r17, %r23
thr3_resum_intr_736:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_736), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0xa62c202f  ! 1: ANDN_I	andn 	%r16, 0x002f, %r19
	.word 0x84bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x8c9c2c5c  ! 1: XORcc_I	xorcc 	%r16, 0x0c5c, %r6
thr3_hw_intr_737:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_737), 16, 16)) -> intp(0, 0, 1)
	.word 0x937c2401  ! 1: MOVR_I	move	%r16, 0xc5c, %r9
	.word 0xb0140011  ! 1: OR_R	or 	%r16, %r17, %r24
thr3_nuke_intr_738:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_738), 16, 16)) -> intp(1, 2, 1)
	.word 0xb93c1011  ! 1: SRAX_R	srax	%r16, %r17, %r28
thr3_resum_intr_739:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_739), 16, 16)) -> intp(1, 3, 1)
	.word 0xb81c2a45  ! 1: XOR_I	xor 	%r16, 0x0a45, %r28
thr3_hw_intr_740:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_740), 16, 16)) -> intp(0, 0, 1)
	.word 0x973c1011  ! 1: SRAX_R	srax	%r16, %r17, %r11
thr3_hw_intr_741:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_741), 16, 16)) -> intp(1, 0, 1)
	.word 0xb09c25b5  ! 1: XORcc_I	xorcc 	%r16, 0x05b5, %r24
	.word 0x90942781  ! 1: ORcc_I	orcc 	%r16, 0x0781, %r8
	.word 0x88840011  ! 1: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x84940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r2
thr3_hw_intr_742:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_742), 16, 16)) -> intp(0, 0, 1)
	.word 0x83641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0x882c28fc  ! 1: ANDN_I	andn 	%r16, 0x08fc, %r4
	.word 0x9a142f42  ! 1: OR_I	or 	%r16, 0x0f42, %r13
	.word 0xb9342001  ! 1: SRL_I	srl 	%r16, 0x0001, %r28
thr3_nuke_intr_743:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_743), 16, 16)) -> intp(2, 2, 1)
	.word 0xb22c2c1f  ! 1: ANDN_I	andn 	%r16, 0x0c1f, %r25
	.word 0xb7343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0x93341011  ! 1: SRLX_R	srlx	%r16, %r17, %r9
thr3_resum_intr_744:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_744), 16, 16)) -> intp(2, 3, 1)
	.word 0x98940011  ! 1: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x8a340011  ! 1: ORN_R	orn 	%r16, %r17, %r5
	.word 0x993c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r12
thr3_nuke_intr_745:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_745), 16, 16)) -> intp(1, 2, 1)
	.word 0xad641811  ! 1: MOVcc_R	<illegal instruction>
	.word 0xae140011  ! 1: OR_R	or 	%r16, %r17, %r23
	.word 0x9a9c0011  ! 1: XORcc_R	xorcc 	%r16, %r17, %r13
thr3_resum_intr_746:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_746), 16, 16)) -> intp(1, 3, 1)
	.word 0x8e3c0011  ! 1: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x9e2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x9d7c0411  ! 1: MOVR_R	move	%r16, %r17, %r14
thr3_hw_intr_747:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_747), 16, 16)) -> intp(0, 0, 1)
	.word 0x9d2c0011  ! 1: SLL_R	sll 	%r16, %r17, %r14
thr3_nuke_intr_748:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_748), 16, 16)) -> intp(2, 2, 1)
	.word 0x94bc2557  ! 1: XNORcc_I	xnorcc 	%r16, 0x0557, %r10
	.word 0x9c2c0011  ! 1: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x8d3c2001  ! 1: SRA_I	sra 	%r16, 0x0001, %r6
thr3_resum_intr_749:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_749), 16, 16)) -> intp(2, 3, 1)
	.word 0x9c1426da  ! 1: OR_I	or 	%r16, 0x06da, %r14
	.word 0x9e042032  ! 1: ADD_I	add 	%r16, 0x0032, %r15
	.word 0x98440011  ! 1: ADDC_R	addc 	%r16, %r17, %r12
thr3_hw_intr_750:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_750), 16, 16)) -> intp(0, 0, 1)
	.word 0xae4429f1  ! 1: ADDC_I	addc 	%r16, 0x09f1, %r23
	.word 0x88b40011  ! 1: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0x9f7c0411  ! 1: MOVR_R	move	%r16, %r17, %r15
	.word 0x852c0011  ! 1: SLL_R	sll 	%r16, %r17, %r2
thr3_hw_intr_751:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_751), 16, 16)) -> intp(1, 0, 1)
	.word 0x8c042652  ! 1: ADD_I	add 	%r16, 0x0652, %r6
	.word 0xb01c2162  ! 1: XOR_I	xor 	%r16, 0x0162, %r24
	.word 0xb4c42795  ! 1: ADDCcc_I	addccc 	%r16, 0x0795, %r26
thr3_nuke_intr_752:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_752), 16, 16)) -> intp(1, 2, 1)
	.word 0x99341011  ! 1: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x82bc0011  ! 1: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x91343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0x8b2c2001  ! 1: SLL_I	sll 	%r16, 0x0001, %r5
thr3_resum_intr_753:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_753), 16, 16)) -> intp(1, 3, 1)
	.word 0x83343001  ! 1: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x9a3c25e1  ! 1: XNOR_I	xnor 	%r16, 0x05e1, %r13
	.word 0x849c2f17  ! 1: XORcc_I	xorcc 	%r16, 0x0f17, %r2
	.word 0x9f7c2401  ! 1: MOVR_I	move	%r16, 0xffffff17, %r15
thr3_nuke_intr_754:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_754), 16, 16)) -> intp(0, 2, 1)
	.word 0x917c2401  ! 1: MOVR_I	move	%r16, 0xffffff17, %r8
thr3_resum_intr_755:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_755), 16, 16)) -> intp(0, 3, 1)
	.word 0x86442d1a  ! 1: ADDC_I	addc 	%r16, 0x0d1a, %r3
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
        setx  0x0000000000000370, %g1, %r17
        setx  0xcabc30eefc5a4161, %g1, %r0
        setx  0x261653f851073353, %g1, %r1
        setx  0x2468eaa0de9e1707, %g1, %r2
        setx  0x44aa1a6e269805e2, %g1, %r3
        setx  0xd8bc0ea66e36315b, %g1, %r4
        setx  0xd330124713981e09, %g1, %r5
        setx  0x92e571c77c2a818d, %g1, %r6
        setx  0x643aeb84f4e838f1, %g1, %r7
        setx  0x24ea2a87a65c7a17, %g1, %r8
        setx  0x564d5787ca501fdb, %g1, %r9
        setx  0xbb97f0d3206aa0f9, %g1, %r10
        setx  0x1328abe87a91b078, %g1, %r11
        setx  0xadcab6182151af7d, %g1, %r12
        setx  0x4a02cb48b154c8dd, %g1, %r13
        setx  0x08ada0bb6c28fe8a, %g1, %r14
        setx  0x404934ee57ea23c5, %g1, %r15
        setx  0x0bd0e623000efa07, %g1, %r18
        setx  0xddafd5cd3d7e98b3, %g1, %r19
        setx  0x90b8cc5a5553073a, %g1, %r20
        setx  0x82b49806e0f4b1f5, %g1, %r21
        setx  0xf1e67d4179667069, %g1, %r22
        setx  0x440cbc3d93227fa6, %g1, %r23
        setx  0x2ba7b82d5da1897b, %g1, %r24
        setx  0x0dc37469531c1cd8, %g1, %r25
        setx  0x7e7ffd9c8cfdbec2, %g1, %r26
        setx  0xe8b5159b7611ebd5, %g1, %r27
        setx  0x324e193936641ec5, %g1, %r28
        setx  0xbdae13555b6e5995, %g1, %r29
        setx  0x7e5484bf8b972ef6, %g1, %r30
        setx  0x8be050b46335d0da, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000880, %g1, %r17
        setx  0xbdcd2d88d45921e9, %g1, %r0
        setx  0x83131689e1570b7f, %g1, %r1
        setx  0x98fe26a530752182, %g1, %r2
        setx  0x7c4c869da961c5d4, %g1, %r3
        setx  0x7362487e2fc77a1c, %g1, %r4
        setx  0xd11c084a55e57be7, %g1, %r5
        setx  0x98c51005e4a11628, %g1, %r6
        setx  0x3f9527c2a0844651, %g1, %r7
        setx  0x656c23ad55721e83, %g1, %r8
        setx  0x8300af9cc500d834, %g1, %r9
        setx  0xa6cc60eb82aef8ba, %g1, %r10
        setx  0x10c1e542bde73094, %g1, %r11
        setx  0x2bed3ad2d9b1071b, %g1, %r12
        setx  0xfc2d5b26c3e18658, %g1, %r13
        setx  0x1ea5b5c9aa0f1c92, %g1, %r14
        setx  0x70c2f71126f44009, %g1, %r15
        setx  0x8eabe42df7e87625, %g1, %r18
        setx  0xfffafc1782f7cebd, %g1, %r19
        setx  0xf998905d2e140cae, %g1, %r20
        setx  0xb15548c004f00607, %g1, %r21
        setx  0xcef472802ce7fa5c, %g1, %r22
        setx  0xe891cb0f3b758149, %g1, %r23
        setx  0xb71d14fbde97315d, %g1, %r24
        setx  0xc057a7633ca6211a, %g1, %r25
        setx  0x63aa99808af8552e, %g1, %r26
        setx  0x26ca631c85e16e7f, %g1, %r27
        setx  0xe7e5da9617260539, %g1, %r28
        setx  0x2f0d4b9cf54c6708, %g1, %r29
        setx  0x0dfa56e359c4b982, %g1, %r30
        setx  0x94e3c472719e9e6a, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000002d0, %g1, %r17
        setx  0x4fea921fdb9e0d0c, %g1, %r0
        setx  0xf2ab0b654910e2d6, %g1, %r1
        setx  0x381d1a710a73a709, %g1, %r2
        setx  0x1b01cbe8d722e9ac, %g1, %r3
        setx  0x5939802177ebc105, %g1, %r4
        setx  0x1c8b18ab5ac5961c, %g1, %r5
        setx  0xb4b7be5c21324821, %g1, %r6
        setx  0xcc1abd45822b6e7c, %g1, %r7
        setx  0x227a5f060612d88c, %g1, %r8
        setx  0x200665184ff89008, %g1, %r9
        setx  0x0771daf6590e634f, %g1, %r10
        setx  0x53766dd8272c56d8, %g1, %r11
        setx  0xdafd311abcba9dc1, %g1, %r12
        setx  0x552fcf734ca6875f, %g1, %r13
        setx  0x58e930a61b579fc4, %g1, %r14
        setx  0xf110b1946668df4c, %g1, %r15
        setx  0xea35b1461c0e64e3, %g1, %r18
        setx  0xb9987eac7f5c033e, %g1, %r19
        setx  0x6dd7e7a593056243, %g1, %r20
        setx  0xf4f6496704c5e98a, %g1, %r21
        setx  0xed9d3d2cb3baedef, %g1, %r22
        setx  0xebc4fbcbbdca4c55, %g1, %r23
        setx  0x02c444113319a9b0, %g1, %r24
        setx  0x176cb60c62c75af3, %g1, %r25
        setx  0xe067d8995ac6eb96, %g1, %r26
        setx  0x01a8f4a43381eb0b, %g1, %r27
        setx  0xb73b5e19970acd4e, %g1, %r28
        setx  0xe87c2f0f9e4f67ca, %g1, %r29
        setx  0x876e0e6bf5a59fd5, %g1, %r30
        setx  0xfe2e20972cb3260c, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000c80, %g1, %r17
        setx  0x719dce93a73d4ca7, %g1, %r0
        setx  0xbf1e8a9558496c1f, %g1, %r1
        setx  0x3955f5b03c292af4, %g1, %r2
        setx  0x7d7a14571867d103, %g1, %r3
        setx  0xbe86adfbfae510cc, %g1, %r4
        setx  0xbd5284cf94bbf5f3, %g1, %r5
        setx  0x2bc5a74cc4b95426, %g1, %r6
        setx  0x842ae424ab570800, %g1, %r7
        setx  0xa3852a43a157bbe9, %g1, %r8
        setx  0xf36dd951c4f899fb, %g1, %r9
        setx  0x7992c8e8383657b6, %g1, %r10
        setx  0xa8fc493c14014435, %g1, %r11
        setx  0xf9477967cbc813cf, %g1, %r12
        setx  0x5263dc0c3858c635, %g1, %r13
        setx  0x7609570ebd381ba7, %g1, %r14
        setx  0xf2596cbc3d202c16, %g1, %r15
        setx  0xd8a179cc9d4d51ea, %g1, %r18
        setx  0xaddbaa85e6ffe427, %g1, %r19
        setx  0x834dc88f486356e7, %g1, %r20
        setx  0x9b7f25bf4cea94f4, %g1, %r21
        setx  0x00a312af2b3794c7, %g1, %r22
        setx  0x49b046a063272343, %g1, %r23
        setx  0xce25fd85f78111fb, %g1, %r24
        setx  0xb2fd47171ed5fdb2, %g1, %r25
        setx  0x2c07b1b8b97ec379, %g1, %r26
        setx  0x559597fe09d258bd, %g1, %r27
        setx  0xcc240fe0bee00cb1, %g1, %r28
        setx  0x14cbb6f51871aad7, %g1, %r29
        setx  0x11ad1ef477fe2425, %g1, %r30
        setx  0x71b8043235d79dc5, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d20, %g1, %r17
        setx  0x4a1c0970ba103fe0, %g1, %r0
        setx  0xc3f6f7761147539f, %g1, %r1
        setx  0x662905f7ffc3395e, %g1, %r2
        setx  0xc184b6213dcd24b7, %g1, %r3
        setx  0x7ba7a44489154ad1, %g1, %r4
        setx  0x91a85f6e21b589c7, %g1, %r5
        setx  0xb7ba0c6654a91fb1, %g1, %r6
        setx  0x3888cd36e4186d6c, %g1, %r7
        setx  0x29bb43852bd26cb5, %g1, %r8
        setx  0x74a4317e3430f17b, %g1, %r9
        setx  0x430fc4833da99646, %g1, %r10
        setx  0xc2418f468bdb1ef7, %g1, %r11
        setx  0xc757d960a1a1277c, %g1, %r12
        setx  0xc2118870e80e0491, %g1, %r13
        setx  0x20d881dcf9fd01b0, %g1, %r14
        setx  0x157f2579ee3de1e6, %g1, %r15
        setx  0xb36e9741876e3ad4, %g1, %r18
        setx  0xcc0a9ab2ef61ec18, %g1, %r19
        setx  0xd866e50219581b54, %g1, %r20
        setx  0x43a4f25b5b6d1999, %g1, %r21
        setx  0xcb31b806dba573b3, %g1, %r22
        setx  0x1915985294a16939, %g1, %r23
        setx  0xc279940fdcfc2445, %g1, %r24
        setx  0xf472901ed97cd1c0, %g1, %r25
        setx  0xb68db919155100ff, %g1, %r26
        setx  0x7996bac5d352ce9b, %g1, %r27
        setx  0x3a4c6471ba22ca72, %g1, %r28
        setx  0xacb7dfc818ba7032, %g1, %r29
        setx  0xf7452e0123934d61, %g1, %r30
        setx  0x680df9d8daf9a246, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000320, %g1, %r17
        setx  0x13021fa41bc47e61, %g1, %r0
        setx  0x482f83effa51f101, %g1, %r1
        setx  0xebe5d2aad645c22b, %g1, %r2
        setx  0x8e3f4139f7d5ba3f, %g1, %r3
        setx  0x8ad35b4dd81216c7, %g1, %r4
        setx  0x90d649df46db7c8c, %g1, %r5
        setx  0x3160608d771e8503, %g1, %r6
        setx  0x9175c330c2b6cede, %g1, %r7
        setx  0x72e84e89a5a2df14, %g1, %r8
        setx  0x9e05df0d87be94a0, %g1, %r9
        setx  0xa62deb93f4aa571b, %g1, %r10
        setx  0x93cdacecd2ca5012, %g1, %r11
        setx  0x37ba492991a65d05, %g1, %r12
        setx  0x435beeba01cbe450, %g1, %r13
        setx  0xab60f7ce371b4ff3, %g1, %r14
        setx  0xd814685fab2fbed3, %g1, %r15
        setx  0xa7d4ad6aae04bfe9, %g1, %r18
        setx  0xb47f3309792f7ef9, %g1, %r19
        setx  0x71d027c13bf27037, %g1, %r20
        setx  0xc93dd8c042a6bb1f, %g1, %r21
        setx  0x98ad051881b13cc6, %g1, %r22
        setx  0x76e6c2abb948ca3f, %g1, %r23
        setx  0xb6306bfde25f2c7b, %g1, %r24
        setx  0xc9a2440e47c3bffa, %g1, %r25
        setx  0xec8f3e69dab5a24e, %g1, %r26
        setx  0x801c078cfe513078, %g1, %r27
        setx  0xb1094cf9d4d6d5b4, %g1, %r28
        setx  0x055b7b3b7ddf52b5, %g1, %r29
        setx  0xda10da8f570dc840, %g1, %r30
        setx  0x859cb90d448df7dd, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000180, %g1, %r17
        setx  0x437cc6b17f266b21, %g1, %r0
        setx  0x7c71e1cad7f6c987, %g1, %r1
        setx  0x97d7d334f6ff8b10, %g1, %r2
        setx  0xbd40adc19ac94a2f, %g1, %r3
        setx  0x76fbc20a137ef50e, %g1, %r4
        setx  0x7e7ee1c21bc73b83, %g1, %r5
        setx  0xda5c5c98a3123c3f, %g1, %r6
        setx  0x1ba5b3484247d6a7, %g1, %r7
        setx  0x388e6ec300b04ee8, %g1, %r8
        setx  0x5a4bc34b7e3bccb2, %g1, %r9
        setx  0x5bddc610acf8ca71, %g1, %r10
        setx  0x4590ac55ef12307f, %g1, %r11
        setx  0xc3864f3af863ab9a, %g1, %r12
        setx  0xab218de3bc68286c, %g1, %r13
        setx  0x337c2ad08273009c, %g1, %r14
        setx  0xde7c48e5ba251336, %g1, %r15
        setx  0xdbc80a80f75f73d3, %g1, %r18
        setx  0x435598590c9cf57d, %g1, %r19
        setx  0x2e8828588dc5702c, %g1, %r20
        setx  0x4b7404bcfaf09912, %g1, %r21
        setx  0xe5b39fbce2278dfb, %g1, %r22
        setx  0x961eb851007e13fa, %g1, %r23
        setx  0x492e67c654140f2b, %g1, %r24
        setx  0x8d3db2ed2aa7d4c8, %g1, %r25
        setx  0xf1a0ff2013a86fc1, %g1, %r26
        setx  0xc51e44565d73cb72, %g1, %r27
        setx  0xda03805b28cb43c3, %g1, %r28
        setx  0x81e516e6f2be3254, %g1, %r29
        setx  0x524fba038812a49d, %g1, %r30
        setx  0x3450e2e196b13b48, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d50, %g1, %r17
        setx  0x2f3efa26b91932d7, %g1, %r0
        setx  0x9f2ddc266db0f458, %g1, %r1
        setx  0x678979633b60bbba, %g1, %r2
        setx  0xc47dffd79aa89c37, %g1, %r3
        setx  0x0647653d58f77ccb, %g1, %r4
        setx  0xc25e6ddf824bd656, %g1, %r5
        setx  0x1f9954b9ab8e85f5, %g1, %r6
        setx  0x440e7fc1ff110dbd, %g1, %r7
        setx  0xa25a9ec9694fe8c9, %g1, %r8
        setx  0x7b1ec0f6228f8406, %g1, %r9
        setx  0xee893b4e94758a71, %g1, %r10
        setx  0xbf61e06a14f0bdb7, %g1, %r11
        setx  0x754e33d2cd8e9cab, %g1, %r12
        setx  0x4db20810a0873682, %g1, %r13
        setx  0xefd53b8baf6a953d, %g1, %r14
        setx  0xeec671e41c615f0b, %g1, %r15
        setx  0x2145e530de26d4cc, %g1, %r18
        setx  0x46365363e6b99bab, %g1, %r19
        setx  0xe7c7cc0ed7d77746, %g1, %r20
        setx  0xb0e58401eec6ef7c, %g1, %r21
        setx  0xb6b528c830f03d0c, %g1, %r22
        setx  0xe19658e91d1226b7, %g1, %r23
        setx  0xac170f2ed9923b6a, %g1, %r24
        setx  0x081c1a62d51acb2a, %g1, %r25
        setx  0x092bb1e72b2bd6a0, %g1, %r26
        setx  0xf0e4abbb2d80c11e, %g1, %r27
        setx  0x94fa4a8b96a42dab, %g1, %r28
        setx  0x609dd6240cbc3c96, %g1, %r29
        setx  0xf1c9988d3c355a8c, %g1, %r30
        setx  0x39abd7d0902c5810, %g1, %r31
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
	.word 0xd0dc1011  ! 2: LDXA_R	ldxa	[%r16, %r17] 0x80, %r8
	.word 0xc9142bf9  ! 4: LDQF_I	-	[%r16, 0x0bf9], %f4
	.word 0x86042d0a  ! 6: ADD_I	add 	%r16, 0x0d0a, %r3
	.word 0xaa340011  ! 6: ORN_R	orn 	%r16, %r17, %r21
	.word 0x893c0011  ! 6: SRA_R	sra 	%r16, %r17, %r4
	.word 0x9a8c0011  ! 6: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x822c0011  ! 6: ANDN_R	andn 	%r16, %r17, %r1
	.word 0xaa9c26ac  ! 6: XORcc_I	xorcc 	%r16, 0x06ac, %r21
	.word 0xba8c2a2a  ! 6: ANDcc_I	andcc 	%r16, 0x0a2a, %r29
	.word 0x85341011  ! 6: SRLX_R	srlx	%r16, %r17, %r2
thr2_dc_err_0:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_0), 16, 16),1,DC_DATA,29)
	.word 0xf9841000  ! 8: LDFA_R	lda	[%r16, %r0], %f28
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0x8e3c0011  ! 12: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x880c0011  ! 12: AND_R	and 	%r16, %r17, %r4
	.word 0x9eac0011  ! 12: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x96ac0011  ! 12: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x848c294d  ! 12: ANDcc_I	andcc 	%r16, 0x094d, %r2
	.word 0x84340011  ! 12: ORN_R	orn 	%r16, %r17, %r2
	.word 0x89341011  ! 12: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x8d643801  ! 12: MOVcc_I	<illegal instruction>
	.word 0xcf142b09  ! 13: LDQF_I	-	[%r16, 0x0b09], %f7
thr2_irf_ce_0:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_0), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	ta	T_CHANGE_PRIV	! macro
	.word 0xa8b42f2a  ! 17: ORNcc_I	orncc 	%r16, 0x0f2a, %r20
	.word 0xa72c0011  ! 17: SLL_R	sll 	%r16, %r17, %r19
	.word 0x88340011  ! 17: ORN_R	orn 	%r16, %r17, %r4
	.word 0xb5342001  ! 17: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0x98042c5f  ! 17: ADD_I	add 	%r16, 0x0c5f, %r12
	.word 0x92840011  ! 17: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0xb214268c  ! 17: OR_I	or 	%r16, 0x068c, %r25
	.word 0xc91c0011  ! 18: LDDF_R	ldd	[%r16, %r17], %f4
thr2_irf_ce_1:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_1), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xc31c2760  ! 20: LDDF_I	ldd	[%r16, 0x0760], %f1
	.word 0x932c3001  ! 22: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0xae040011  ! 22: ADD_R	add 	%r16, %r17, %r23
	.word 0x921c2f3a  ! 22: XOR_I	xor 	%r16, 0x0f3a, %r9
	.word 0x9e9c0011  ! 22: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x9004234d  ! 22: ADD_I	add 	%r16, 0x034d, %r8
	.word 0x8a042d5e  ! 22: ADD_I	add 	%r16, 0x0d5e, %r5
	.word 0x981c2407  ! 22: XOR_I	xor 	%r16, 0x0407, %r12
	.word 0x98942dc7  ! 22: ORcc_I	orcc 	%r16, 0x0dc7, %r12
	.word 0xf4142d2b  ! 23: LDUH_I	lduh	[%r16 + 0x0d2b], %r26
thr2_resum_intr_756:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_756), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x9cc428c2  ! 27: ADDCcc_I	addccc 	%r16, 0x08c2, %r14
	.word 0x8e0c0011  ! 27: AND_R	and 	%r16, %r17, %r7
	.word 0xb2842260  ! 27: ADDcc_I	addcc 	%r16, 0x0260, %r25
	.word 0xb9340011  ! 27: SRL_R	srl 	%r16, %r17, %r28
	.word 0x884426a5  ! 27: ADDC_I	addc 	%r16, 0x06a5, %r4
	.word 0xb5342001  ! 27: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0x90ac23a5  ! 27: ANDNcc_I	andncc 	%r16, 0x03a5, %r8
thr2_dc_err_1:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_1), 16, 16),1,DC_DATA,33)
	.word 0xf6841000  ! 29: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r27
	.word 0xc9042c15  ! 31: LDF_I	ld	[%r16, 0x0c15], %f4
	.word 0x88040011  ! 33: ADD_R	add 	%r16, %r17, %r4
	.word 0x821c0011  ! 33: XOR_R	xor 	%r16, %r17, %r1
	.word 0x9b2c1011  ! 33: SLLX_R	sllx	%r16, %r17, %r13
	.word 0x902c0011  ! 33: ANDN_R	andn 	%r16, %r17, %r8
	.word 0xb4140011  ! 33: OR_R	or 	%r16, %r17, %r26
	.word 0x992c3001  ! 33: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0xc71c2702  ! 34: LDDF_I	ldd	[%r16, 0x0702], %f3
thr2_irf_ce_2:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_2), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xea1c0011  ! 36: LDD_R	ldd	[%r16 + %r17], %r21
	.word 0xad3c2001  ! 38: SRA_I	sra 	%r16, 0x0001, %r22
	.word 0xae8c28bf  ! 38: ANDcc_I	andcc 	%r16, 0x08bf, %r23
	.word 0x88bc0011  ! 38: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0xae0423b8  ! 38: ADD_I	add 	%r16, 0x03b8, %r23
	.word 0xb73c0011  ! 38: SRA_R	sra 	%r16, %r17, %r27
	.word 0xacb42cfd  ! 38: ORNcc_I	orncc 	%r16, 0x0cfd, %r22
	.word 0x8e1c2c06  ! 38: XOR_I	xor 	%r16, 0x0c06, %r7
thr2_dc_err_2:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_2), 16, 16),1,DC_DATA,22)
	.word 0xfa8c2ccf  ! 40: LDUBA_I	lduba	[%r16, + 0x0ccf] %asi, %r29
	.word 0xdccc22a6  ! 42: LDSBA_I	ldsba	[%r16, + 0x02a6] %asi, %r14
	.word 0x83341011  ! 44: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x900c24ef  ! 44: AND_I	and 	%r16, 0x04ef, %r8
	.word 0x8f643801  ! 44: MOVcc_I	<illegal instruction>
	.word 0x9cc40011  ! 44: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0xb53c1011  ! 44: SRAX_R	srax	%r16, %r17, %r26
	.word 0x963426e5  ! 44: ORN_I	orn 	%r16, 0x06e5, %r11
thr2_dc_err_3:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_3), 16, 16),1,DC_DATA,44)
	.word 0xc3941000  ! 46: LDQFA_R	-	[%r16, %r0], %f1
thr2_irf_ce_3:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_3), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xec2c2879  ! 50: STB_I	stb	%r22, [%r16 + 0x0879]
	.word 0x92c4218a  ! 52: ADDCcc_I	addccc 	%r16, 0x018a, %r9
	.word 0xb3340011  ! 52: SRL_R	srl 	%r16, %r17, %r25
	.word 0x9e9c2334  ! 52: XORcc_I	xorcc 	%r16, 0x0334, %r15
	.word 0xb4b40011  ! 52: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0xb42c0011  ! 52: ANDN_R	andn 	%r16, %r17, %r26
thr2_dc_err_4:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_4), 16, 16),1,DC_DATA,18)
	.word 0xf6cc2e1c  ! 54: LDSBA_I	ldsba	[%r16, + 0x0e1c] %asi, %r27
	.word 0xd0140011  ! 56: LDUH_R	lduh	[%r16 + %r17], %r8
	.word 0xb5343001  ! 58: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0x82340011  ! 58: ORN_R	orn 	%r16, %r17, %r1
	.word 0x9c8c2d05  ! 58: ANDcc_I	andcc 	%r16, 0x0d05, %r14
	.word 0x95643801  ! 58: MOVcc_I	<illegal instruction>
	.word 0x92c42cf5  ! 58: ADDCcc_I	addccc 	%r16, 0x0cf5, %r9
	.word 0x9f2c0011  ! 58: SLL_R	sll 	%r16, %r17, %r15
	.word 0x8f3c2001  ! 58: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0xcc0c2adb  ! 59: LDUB_I	ldub	[%r16 + 0x0adb], %r6
!Illinst store
	.word 0xc2240011  ! 61: STW_R	stw	%r1, [%r16 + %r17]
	.word 0x9ab420e4  ! 63: ORNcc_I	orncc 	%r16, 0x00e4, %r13
	.word 0xb4440011  ! 63: ADDC_R	addc 	%r16, %r17, %r26
	.word 0xb8142423  ! 63: OR_I	or 	%r16, 0x0423, %r28
	.word 0x873c1011  ! 63: SRAX_R	srax	%r16, %r17, %r3
	.word 0x963c0011  ! 63: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0xba842a12  ! 63: ADDcc_I	addcc 	%r16, 0x0a12, %r29
	.word 0x87343001  ! 63: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x9abc0011  ! 63: XNORcc_R	xnorcc 	%r16, %r17, %r13
thr2_dc_err_5:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_5), 16, 16),1,DC_DATA,49)
	.word 0xd4c41000  ! 65: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r10
	.word 0xf8b41011  ! 67: STHA_R	stha	%r28, [%r16 + %r17] 0x80
	.word 0x982c0011  ! 69: ANDN_R	andn 	%r16, %r17, %r12
	.word 0xaa842d71  ! 69: ADDcc_I	addcc 	%r16, 0x0d71, %r21
	.word 0x932c3001  ! 69: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x98b42c92  ! 69: ORNcc_I	orncc 	%r16, 0x0c92, %r12
	.word 0xb0bc0011  ! 69: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0x853c1011  ! 69: SRAX_R	srax	%r16, %r17, %r2
	.word 0x86c40011  ! 69: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0xaa8c0011  ! 69: ANDcc_R	andcc 	%r16, %r17, %r21
thr2_dc_err_6:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_6), 16, 16),1,DC_DATA,41)
	.word 0xc41c214e  ! 71: LDD_I	ldd	[%r16 + 0x014e], %r2
!Illinst alu
	.word 0xb8440011  ! 73: ADDC_R	addc 	%r16, %r17, %r28
	.word 0xb4ac2d3f  ! 75: ANDNcc_I	andncc 	%r16, 0x0d3f, %r26
	.word 0xaf7c2401  ! 75: MOVR_I	move	%r16, 0xfffffe54, %r23
	.word 0x8a0c0011  ! 75: AND_R	and 	%r16, %r17, %r5
	.word 0x9c442e33  ! 75: ADDC_I	addc 	%r16, 0x0e33, %r14
	.word 0x92ac286f  ! 75: ANDNcc_I	andncc 	%r16, 0x086f, %r9
	.word 0x8e94267c  ! 75: ORcc_I	orcc 	%r16, 0x067c, %r7
	.word 0xb2ac273f  ! 75: ANDNcc_I	andncc 	%r16, 0x073f, %r25
	.word 0xccc42ba7  ! 76: LDSWA_I	ldswa	[%r16, + 0x0ba7] %asi, %r6
	.word 0xf0742215  ! 80: STX_I	stx	%r24, [%r16 + 0x0215]
	.word 0xa8842006  ! 82: ADDcc_I	addcc 	%r16, 0x0006, %r20
	.word 0x88ac2b10  ! 82: ANDNcc_I	andncc 	%r16, 0x0b10, %r4
	.word 0xaa8c2419  ! 82: ANDcc_I	andcc 	%r16, 0x0419, %r21
	.word 0x943c276f  ! 82: XNOR_I	xnor 	%r16, 0x076f, %r10
	.word 0xb2940011  ! 82: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0xaebc2add  ! 83: XNORcc_I	xnorcc 	%r16, 0x0add, %r23
	.word 0x9ac40011  ! 83: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x96442216  ! 83: ADDC_I	addc 	%r16, 0x0216, %r11
	.word 0x9b342001  ! 83: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0xa6340011  ! 83: ORN_R	orn 	%r16, %r17, %r19
	.word 0x872c2001  ! 83: SLL_I	sll 	%r16, 0x0001, %r3
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xc2042a39  ! 83: LDUW_I	lduw	[%r16 + 0x0a39], %r1
	jmpl     %r18 + 0x28, %r31
	.word 0xa72c3001  ! 86: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0x872c3001  ! 86: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x8e3c0011  ! 86: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xaa442c07  ! 86: ADDC_I	addc 	%r16, 0x0c07, %r21
	.word 0x9b343001  ! 86: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xf19c1011  ! 87: LDDFA_R	ldda	[%r16, %r17], %f24
	.word 0xd1941011  ! 89: LDQFA_R	-	[%r16, %r17], %f8
	.word 0xa61c0011  ! 91: XOR_R	xor 	%r16, %r17, %r19
	.word 0x96442425  ! 91: ADDC_I	addc 	%r16, 0x0425, %r11
	.word 0x8d342001  ! 91: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x97342001  ! 91: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0x9b2c2001  ! 91: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0x928c2cfc  ! 91: ANDcc_I	andcc 	%r16, 0x0cfc, %r9
	.word 0xf0542fca  ! 92: LDSH_I	ldsh	[%r16 + 0x0fca], %r24
thr2_irf_ce_4:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_4), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xcd042d0e  ! 94: LDF_I	ld	[%r16, 0x0d0e], %f6
	.word 0x82ac0011  ! 96: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x8c2c2466  ! 96: ANDN_I	andn 	%r16, 0x0466, %r6
	.word 0x8c0c0011  ! 96: AND_R	and 	%r16, %r17, %r6
	.word 0x89641811  ! 96: MOVcc_R	<illegal instruction>
	.word 0x8d641811  ! 96: MOVcc_R	<illegal instruction>
	.word 0x9f2c3001  ! 96: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0x88bc2f0c  ! 96: XNORcc_I	xnorcc 	%r16, 0x0f0c, %r4
	.word 0x982c0011  ! 96: ANDN_R	andn 	%r16, %r17, %r12
	.word 0xd3042009  ! 97: LDF_I	ld	[%r16, 0x0009], %f9
thr2_irf_ce_5:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_5), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xd71c2421  ! 99: LDDF_I	ldd	[%r16, 0x0421], %f11
	.word 0x92342295  ! 101: ORN_I	orn 	%r16, 0x0295, %r9
	.word 0x900c0011  ! 101: AND_R	and 	%r16, %r17, %r8
	.word 0x93643801  ! 101: MOVcc_I	<illegal instruction>
	.word 0x933c2001  ! 101: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x8c840011  ! 101: ADDcc_R	addcc 	%r16, %r17, %r6
thr2_dc_err_7:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_7), 16, 16),1,DC_DATA,46)
	.word 0xf3140000  ! 103: LDQF_R	-	[%r16, %r0], %f25
thr2_irf_ce_6:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_6), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xd91c205b  ! 105: LDDF_I	ldd	[%r16, 0x005b], %f12
	.word 0x863c246e  ! 107: XNOR_I	xnor 	%r16, 0x046e, %r3
	.word 0xacb42485  ! 107: ORNcc_I	orncc 	%r16, 0x0485, %r22
	.word 0x917c0411  ! 107: MOVR_R	move	%r16, %r17, %r8
	.word 0xb72c2001  ! 107: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0x8ebc0011  ! 107: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x82ac0011  ! 107: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0xfa54270b  ! 108: LDSH_I	ldsh	[%r16 + 0x070b], %r29
thr2_irf_ce_7:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_7), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xfaa42fd9  ! 110: STWA_I	stwa	%r29, [%r16 + 0x0fd9] %asi
	.word 0xab2c1011  ! 112: SLLX_R	sllx	%r16, %r17, %r21
	.word 0x8aac292e  ! 112: ANDNcc_I	andncc 	%r16, 0x092e, %r5
	.word 0x90ac0011  ! 112: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x8b2c3001  ! 112: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x9f641811  ! 112: MOVcc_R	<illegal instruction>
	.word 0x873c2001  ! 112: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x8e3c0011  ! 112: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xf81c0011  ! 113: LDD_R	ldd	[%r16 + %r17], %r28
	.word 0xd0f4238d  ! 115: STXA_I	stxa	%r8, [%r16 + 0x038d] %asi
	.word 0x86040011  ! 117: ADD_R	add 	%r16, %r17, %r3
	.word 0x952c2001  ! 117: SLL_I	sll 	%r16, 0x0001, %r10
	.word 0x89342001  ! 117: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x8d3c0011  ! 117: SRA_R	sra 	%r16, %r17, %r6
	.word 0x94c42b16  ! 117: ADDCcc_I	addccc 	%r16, 0x0b16, %r10
thr2_dc_err_8:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_8), 16, 16),1,DC_DATA,23)
	.word 0xe6540000  ! 119: LDSH_R	ldsh	[%r16 + %r0], %r19
	return     %r18 + %r17
	.word 0x908c0011  ! 122: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x8f343001  ! 122: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x8e8c0011  ! 122: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0xb28c0011  ! 122: ANDcc_R	andcc 	%r16, %r17, %r25
	.word 0x82c4210b  ! 122: ADDCcc_I	addccc 	%r16, 0x010b, %r1
	.word 0x880c0011  ! 122: AND_R	and 	%r16, %r17, %r4
	.word 0x8a2c2a7c  ! 122: ANDN_I	andn 	%r16, 0x0a7c, %r5
	.word 0xb72c3001  ! 122: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0xc51c0011  ! 123: LDDF_R	ldd	[%r16, %r17], %f2
thr2_irf_ce_8:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_8), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xc45c0011  ! 125: LDX_R	ldx	[%r16 + %r17], %r2
	.word 0x94140011  ! 127: OR_R	or 	%r16, %r17, %r10
	.word 0x90b40011  ! 127: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0xa8842ecc  ! 127: ADDcc_I	addcc 	%r16, 0x0ecc, %r20
	.word 0xaf7c2401  ! 127: MOVR_I	move	%r16, 0xfffffe54, %r23
	.word 0xa73c1011  ! 127: SRAX_R	srax	%r16, %r17, %r19
	.word 0x94342d38  ! 127: ORN_I	orn 	%r16, 0x0d38, %r10
	.word 0xc2cc1011  ! 128: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r1
	.word 0xea1c0011  ! 130: LDD_R	ldd	[%r16 + %r17], %r21
	.word 0x8b2c1011  ! 132: SLLX_R	sllx	%r16, %r17, %r5
	.word 0x837c0411  ! 132: MOVR_R	move	%r16, %r17, %r1
	.word 0x9e1c0011  ! 132: XOR_R	xor 	%r16, %r17, %r15
	.word 0x98bc28f1  ! 132: XNORcc_I	xnorcc 	%r16, 0x08f1, %r12
	.word 0x85343001  ! 132: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0xd8540011  ! 133: LDSH_R	ldsh	[%r16 + %r17], %r12
	.word 0xd2dc2829  ! 135: LDXA_I	ldxa	[%r16, + 0x0829] %asi, %r9
	.word 0xb22c0011  ! 137: ANDN_R	andn 	%r16, %r17, %r25
	.word 0x82940011  ! 137: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0xa8b426cf  ! 137: ORNcc_I	orncc 	%r16, 0x06cf, %r20
	.word 0xb1340011  ! 137: SRL_R	srl 	%r16, %r17, %r24
	.word 0xba940011  ! 137: ORcc_R	orcc 	%r16, %r17, %r29
thr2_dc_err_9:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_9), 16, 16),1,DC_DATA,23)
	.word 0xd8542d50  ! 139: LDSH_I	ldsh	[%r16 + 0x0d50], %r12
thr2_irf_ce_9:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_9), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xd00c27c1  ! 141: LDUB_I	ldub	[%r16 + 0x07c1], %r8
	.word 0x9d2c2001  ! 143: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0xb6b40011  ! 143: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0x9e9c0011  ! 143: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0xaa940011  ! 143: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x9a042a6e  ! 143: ADD_I	add 	%r16, 0x0a6e, %r13
	.word 0x89340011  ! 143: SRL_R	srl 	%r16, %r17, %r4
thr2_dc_err_10:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_10), 16, 16),1,DC_DATA,9)
	.word 0xd2c42aa7  ! 145: LDSWA_I	ldswa	[%r16, + 0x0aa7] %asi, %r9
	.word 0xd05c24a3  ! 147: LDX_I	ldx	[%r16 + 0x04a3], %r8
	.word 0x9e2c2ef7  ! 149: ANDN_I	andn 	%r16, 0x0ef7, %r15
	.word 0x984427a5  ! 149: ADDC_I	addc 	%r16, 0x07a5, %r12
	.word 0x9d341011  ! 149: SRLX_R	srlx	%r16, %r17, %r14
	.word 0x972c2001  ! 149: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x8ac40011  ! 149: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0x9d7c2401  ! 149: MOVR_I	move	%r16, 0xfffffe54, %r14
	.word 0xca1c2dd5  ! 150: LDD_I	ldd	[%r16 + 0x0dd5], %r5
	.word 0xc5140011  ! 152: LDQF_R	-	[%r16, %r17], %f2
	.word 0xa6ac0011  ! 154: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0x9a440011  ! 154: ADDC_R	addc 	%r16, %r17, %r13
	.word 0xb09c0011  ! 154: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x90c42c56  ! 154: ADDCcc_I	addccc 	%r16, 0x0c56, %r8
	.word 0xa63c27ba  ! 154: XNOR_I	xnor 	%r16, 0x07ba, %r19
	.word 0x9c9c0011  ! 154: XORcc_R	xorcc 	%r16, %r17, %r14
thr2_dc_err_11:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_11), 16, 16),1,DC_DATA,64)
	.word 0xd08c1000  ! 156: LDUBA_R	lduba	[%r16, %r0] 0x80, %r8
thr2_irf_ce_10:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_10), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xce140011  ! 158: LDUH_R	lduh	[%r16 + %r17], %r7
	.word 0x9b341011  ! 160: SRLX_R	srlx	%r16, %r17, %r13
	.word 0xab643801  ! 160: MOVcc_I	<illegal instruction>
	.word 0x8b341011  ! 160: SRLX_R	srlx	%r16, %r17, %r5
	.word 0x96c40011  ! 160: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0xaf341011  ! 160: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xbb3c1011  ! 160: SRAX_R	srax	%r16, %r17, %r29
	.word 0x8d643801  ! 160: MOVcc_I	<illegal instruction>
	.word 0xb72c0011  ! 160: SLL_R	sll 	%r16, %r17, %r27
thr2_dc_err_12:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_12), 16, 16),1,DC_DATA,33)
	.word 0xda942d41  ! 162: LDUHA_I	lduha	[%r16, + 0x0d41] %asi, %r13
thr2_irf_ce_11:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_11), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xf4ec2336  ! 164: LDSTUBA_I	ldstuba	%r26, [%r16 + 0x0336] %asi
	.word 0x8c2c28fa  ! 166: ANDN_I	andn 	%r16, 0x08fa, %r6
	.word 0xaf2c3001  ! 166: SLLX_I	sllx	%r16, 0x0001, %r23
	.word 0xb7641811  ! 166: MOVcc_R	<illegal instruction>
	.word 0x840c2f4c  ! 166: AND_I	and 	%r16, 0x0f4c, %r2
	.word 0xa8bc0011  ! 166: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0x8cac0011  ! 166: ANDNcc_R	andncc 	%r16, %r17, %r6
thr2_dc_err_13:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_13), 16, 16),1,DC_DATA,58)
	.word 0xec1c0000  ! 168: LDD_R	ldd	[%r16 + %r0], %r22
thr2_irf_ce_12:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_12), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xa76c2fca  ! 170: SDIVX_I	sdivx	%r16, 0x0fca, %r19
	.word 0x8a442ce8  ! 172: ADDC_I	addc 	%r16, 0x0ce8, %r5
	.word 0xba340011  ! 172: ORN_R	orn 	%r16, %r17, %r29
	.word 0x882c2431  ! 172: ANDN_I	andn 	%r16, 0x0431, %r4
	.word 0x8d342001  ! 172: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0xaebc0011  ! 172: XNORcc_R	xnorcc 	%r16, %r17, %r23
	.word 0x8b643801  ! 172: MOVcc_I	<illegal instruction>
	.word 0x941426bc  ! 172: OR_I	or 	%r16, 0x06bc, %r10
	.word 0xc51c2e55  ! 173: LDDF_I	ldd	[%r16, 0x0e55], %f2
thr2_irf_ce_13:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_13), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xc3040011  ! 175: LDF_R	ld	[%r16, %r17], %f1
	.word 0x98940011  ! 177: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x9e840011  ! 177: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xaf3c2001  ! 177: SRA_I	sra 	%r16, 0x0001, %r23
	.word 0x8b342001  ! 177: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0xb8340011  ! 177: ORN_R	orn 	%r16, %r17, %r28
thr2_dc_err_14:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_14), 16, 16),1,DC_DATA,43)
	.word 0xda0c0000  ! 179: LDUB_R	ldub	[%r16 + %r0], %r13
thr2_irf_ce_14:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_14), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
thr2_resum_intr_757:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_757), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x0, %asr26
	.word 0x98ac0011  ! 183: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x992c1011  ! 183: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x8cc40011  ! 183: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x9b643801  ! 183: MOVcc_I	<illegal instruction>
	.word 0x98c42bf8  ! 183: ADDCcc_I	addccc 	%r16, 0x0bf8, %r12
	.word 0xaf2c1011  ! 183: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x97342001  ! 183: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0xe894224b  ! 184: LDUHA_I	lduha	[%r16, + 0x024b] %asi, %r20
thr2_irf_ce_15:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_15), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xc6dc24c7  ! 186: LDXA_I	ldxa	[%r16, + 0x04c7] %asi, %r3
	.word 0xb09c262c  ! 188: XORcc_I	xorcc 	%r16, 0x062c, %r24
	.word 0x929420f4  ! 188: ORcc_I	orcc 	%r16, 0x00f4, %r9
	.word 0x8eac0011  ! 188: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0xb8042b55  ! 188: ADD_I	add 	%r16, 0x0b55, %r28
	.word 0xa7641811  ! 188: MOVcc_R	<illegal instruction>
	.word 0xb8c40011  ! 188: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0xd68c1011  ! 189: LDUBA_R	lduba	[%r16, %r17] 0x80, %r11
	.word 0xe8c41011  ! 191: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r20
	.word 0x8cbc28c0  ! 193: XNORcc_I	xnorcc 	%r16, 0x08c0, %r6
	.word 0x829c0011  ! 193: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x8cc40011  ! 193: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x96c40011  ! 193: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x8c1c0011  ! 193: XOR_R	xor 	%r16, %r17, %r6
thr2_dc_err_15:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_15), 16, 16),1,DC_DATA,6)
	.word 0xe8842552  ! 195: LDUWA_I	lduwa	[%r16, + 0x0552] %asi, %r20
	.word 0xc4cc1011  ! 197: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r2
	.word 0x92440011  ! 199: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x96c40011  ! 199: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0xa6c40011  ! 199: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0xb6140011  ! 199: OR_R	or 	%r16, %r17, %r27
	.word 0xb82c2d8a  ! 199: ANDN_I	andn 	%r16, 0x0d8a, %r28
thr2_dc_err_16:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_16), 16, 16),1,DC_DATA,27)
	.word 0xeb1c0000  ! 201: LDDF_R	ldd	[%r16, %r0], %f21
thr2_irf_ce_16:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_16), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xdb841011  ! 203: LDFA_R	lda	[%r16, %r17], %f13
	.word 0xa69c0011  ! 205: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0x94042a35  ! 205: ADD_I	add 	%r16, 0x0a35, %r10
	.word 0x8f3c2001  ! 205: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x8a84243e  ! 205: ADDcc_I	addcc 	%r16, 0x043e, %r5
	.word 0xab342001  ! 205: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0x96ac0011  ! 205: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x8d2c2001  ! 205: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0xf1140011  ! 206: LDQF_R	-	[%r16, %r17], %f24
thr2_irf_ce_17:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_17), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xe91420ba  ! 208: LDQF_I	-	[%r16, 0x00ba], %f20
	.word 0x98c42707  ! 210: ADDCcc_I	addccc 	%r16, 0x0707, %r12
	.word 0xb23c2326  ! 210: XNOR_I	xnor 	%r16, 0x0326, %r25
	.word 0x9ac40011  ! 210: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x8f2c3001  ! 210: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0xb8142cf7  ! 210: OR_I	or 	%r16, 0x0cf7, %r28
	.word 0x98140011  ! 210: OR_R	or 	%r16, %r17, %r12
	.word 0x972c3001  ! 210: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0x8f340011  ! 210: SRL_R	srl 	%r16, %r17, %r7
	.word 0xf00c0011  ! 211: LDUB_R	ldub	[%r16 + %r17], %r24
	.word 0x8143e047  ! 213: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xa8440011  ! 215: ADDC_R	addc 	%r16, %r17, %r20
	.word 0x84bc0011  ! 215: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0xb6040011  ! 215: ADD_R	add 	%r16, %r17, %r27
	.word 0x821c2e58  ! 215: XOR_I	xor 	%r16, 0x0e58, %r1
	.word 0x961c2d50  ! 215: XOR_I	xor 	%r16, 0x0d50, %r11
thr2_dc_err_17:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_17), 16, 16),1,DC_DATA,56)
	.word 0xd91c2250  ! 217: LDDF_I	ldd	[%r16, 0x0250], %f12
thr2_irf_ce_18:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_18), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xd60c2d63  ! 219: LDUB_I	ldub	[%r16 + 0x0d63], %r11
	.word 0x8f7c2401  ! 221: MOVR_I	move	%r16, 0xfffffe54, %r7
	.word 0xaa940011  ! 221: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x9ec428b6  ! 221: ADDCcc_I	addccc 	%r16, 0x08b6, %r15
	.word 0x9b343001  ! 221: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0x8aac2e15  ! 221: ANDNcc_I	andncc 	%r16, 0x0e15, %r5
	.word 0x892c2001  ! 221: SLL_I	sll 	%r16, 0x0001, %r4
thr2_dc_err_18:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_18), 16, 16),1,DC_DATA,20)
	.word 0xe8941000  ! 223: LDUHA_R	lduha	[%r16, %r0] 0x80, %r20
thr2_irf_ce_19:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_19), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xc6140011  ! 225: LDUH_R	lduh	[%r16 + %r17], %r3
	.word 0x841c2091  ! 227: XOR_I	xor 	%r16, 0x0091, %r2
	.word 0xaf3c0011  ! 227: SRA_R	sra 	%r16, %r17, %r23
	.word 0x82042812  ! 227: ADD_I	add 	%r16, 0x0812, %r1
	.word 0xa884254c  ! 227: ADDcc_I	addcc 	%r16, 0x054c, %r20
	.word 0xb48c2227  ! 227: ANDcc_I	andcc 	%r16, 0x0227, %r26
	.word 0x88940011  ! 227: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0xb4042875  ! 227: ADD_I	add 	%r16, 0x0875, %r26
	.word 0x973c2001  ! 227: SRA_I	sra 	%r16, 0x0001, %r11
thr2_dc_err_19:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_19), 16, 16),1,DC_DATA,43)
	.word 0xf6841000  ! 229: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r27
thr2_irf_ce_20:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_20), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xd6440011  ! 231: LDSW_R	ldsw	[%r16 + %r17], %r11
	.word 0x90140011  ! 233: OR_R	or 	%r16, %r17, %r8
	.word 0x903c2d85  ! 233: XNOR_I	xnor 	%r16, 0x0d85, %r8
	.word 0x8a840011  ! 233: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0xac842af9  ! 233: ADDcc_I	addcc 	%r16, 0x0af9, %r22
	.word 0x9b2c0011  ! 233: SLL_R	sll 	%r16, %r17, %r13
	.word 0xeb1c0011  ! 234: LDDF_R	ldd	[%r16, %r17], %f21
thr2_irf_ce_21:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_21), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xeedc2365  ! 236: LDXA_I	ldxa	[%r16, + 0x0365] %asi, %r23
	.word 0x8c842f0f  ! 238: ADDcc_I	addcc 	%r16, 0x0f0f, %r6
	.word 0x9e942b47  ! 238: ORcc_I	orcc 	%r16, 0x0b47, %r15
	.word 0xb8140011  ! 238: OR_R	or 	%r16, %r17, %r28
	.word 0xb8ac0011  ! 238: ANDNcc_R	andncc 	%r16, %r17, %r28
	.word 0x902c0011  ! 238: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x9a342009  ! 238: ORN_I	orn 	%r16, 0x0009, %r13
	.word 0xd4442fec  ! 239: LDSW_I	ldsw	[%r16 + 0x0fec], %r10
thr2_irf_ce_22:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_22), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xca9c2cd5  ! 241: LDDA_I	ldda	[%r16, + 0x0cd5] %asi, %r5
	.word 0x8a142b30  ! 243: OR_I	or 	%r16, 0x0b30, %r5
	.word 0x882c2589  ! 243: ANDN_I	andn 	%r16, 0x0589, %r4
	.word 0x9e842a7a  ! 243: ADDcc_I	addcc 	%r16, 0x0a7a, %r15
	.word 0xa6b428c4  ! 243: ORNcc_I	orncc 	%r16, 0x08c4, %r19
	.word 0xb2bc0011  ! 243: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0xf6942672  ! 244: LDUHA_I	lduha	[%r16, + 0x0672] %asi, %r27
	.word 0xd28c1011  ! 246: LDUBA_R	lduba	[%r16, %r17] 0x80, %r9
	.word 0x8ebc22f2  ! 248: XNORcc_I	xnorcc 	%r16, 0x02f2, %r7
	.word 0x90840011  ! 248: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x84942d7b  ! 248: ORcc_I	orcc 	%r16, 0x0d7b, %r2
	.word 0xb01c0011  ! 248: XOR_R	xor 	%r16, %r17, %r24
	.word 0x88042325  ! 248: ADD_I	add 	%r16, 0x0325, %r4
	.word 0x9f2c2001  ! 248: SLL_I	sll 	%r16, 0x0001, %r15
thr2_dc_err_20:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_20), 16, 16),1,DC_DATA,24)
	.word 0xc85c0000  ! 250: LDX_R	ldx	[%r16 + %r0], %r4
	.word 0x8e7427bc  ! 252: UDIV_I	udiv 	%r16, 0x07bc, %r7
	.word 0x92c40011  ! 254: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x9e840011  ! 254: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x86440011  ! 254: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x88c40011  ! 254: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x95643801  ! 254: MOVcc_I	<illegal instruction>
	.word 0xc89c1011  ! 255: LDDA_R	ldda	[%r16, %r17] 0x80, %r4
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0xb83c0011  ! 259: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0x82942065  ! 259: ORcc_I	orcc 	%r16, 0x0065, %r1
	.word 0x997c0411  ! 259: MOVR_R	move	%r16, %r17, %r12
	.word 0x8b3c1011  ! 259: SRAX_R	srax	%r16, %r17, %r5
	.word 0x9e9c2b01  ! 259: XORcc_I	xorcc 	%r16, 0x0b01, %r15
	.word 0xb2b40011  ! 259: ORNcc_R	orncc 	%r16, %r17, %r25
thr2_dc_err_21:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_21), 16, 16),1,DC_DATA,48)
	.word 0xf1040000  ! 261: LDF_R	ld	[%r16, %r0], %f24
	.word 0xda1c0011  ! 263: LDD_R	ldd	[%r16 + %r17], %r13
	.word 0xba440011  ! 265: ADDC_R	addc 	%r16, %r17, %r29
	.word 0xb1343001  ! 265: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0x9a040011  ! 265: ADD_R	add 	%r16, %r17, %r13
	.word 0x9d641811  ! 265: MOVcc_R	<illegal instruction>
	.word 0xa6942eae  ! 265: ORcc_I	orcc 	%r16, 0x0eae, %r19
	.word 0x9a942e55  ! 265: ORcc_I	orcc 	%r16, 0x0e55, %r13
	.word 0xa62c0011  ! 265: ANDN_R	andn 	%r16, %r17, %r19
	.word 0xd9140011  ! 266: LDQF_R	-	[%r16, %r17], %f12
thr2_irf_ce_23:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_23), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xf6d41011  ! 268: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r27
	.word 0x883c2433  ! 270: XNOR_I	xnor 	%r16, 0x0433, %r4
	.word 0x83643801  ! 270: MOVcc_I	<illegal instruction>
	.word 0x92c42b18  ! 270: ADDCcc_I	addccc 	%r16, 0x0b18, %r9
	.word 0x8aac2342  ! 270: ANDNcc_I	andncc 	%r16, 0x0342, %r5
	.word 0xba442c6d  ! 270: ADDC_I	addc 	%r16, 0x0c6d, %r29
	.word 0x94c428f1  ! 270: ADDCcc_I	addccc 	%r16, 0x08f1, %r10
	.word 0xac142784  ! 270: OR_I	or 	%r16, 0x0784, %r22
	.word 0xd8542fbb  ! 271: LDSH_I	ldsh	[%r16 + 0x0fbb], %r12
        wr %g0, 0x4, %fprs
	.word 0x832c1011  ! 275: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x98440011  ! 275: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x9cac2ee3  ! 275: ANDNcc_I	andncc 	%r16, 0x0ee3, %r14
	.word 0xae0c2466  ! 275: AND_I	and 	%r16, 0x0466, %r23
	.word 0x85641811  ! 275: MOVcc_R	<illegal instruction>
	.word 0x993c2001  ! 275: SRA_I	sra 	%r16, 0x0001, %r12
	.word 0x993c1011  ! 275: SRAX_R	srax	%r16, %r17, %r12
	.word 0xaa04281b  ! 275: ADD_I	add 	%r16, 0x081b, %r21
	.word 0xc88c1011  ! 276: LDUBA_R	lduba	[%r16, %r17] 0x80, %r4
	.word 0xc9040011  ! 278: LDF_R	ld	[%r16, %r17], %f4
	.word 0x84942992  ! 280: ORcc_I	orcc 	%r16, 0x0992, %r2
	.word 0xb49c2c5c  ! 280: XORcc_I	xorcc 	%r16, 0x0c5c, %r26
	.word 0xb92c0011  ! 280: SLL_R	sll 	%r16, %r17, %r28
	.word 0xae142754  ! 280: OR_I	or 	%r16, 0x0754, %r23
	.word 0x961c2ce8  ! 280: XOR_I	xor 	%r16, 0x0ce8, %r11
	.word 0xaa840011  ! 280: ADDcc_R	addcc 	%r16, %r17, %r21
	.word 0x87341011  ! 280: SRLX_R	srlx	%r16, %r17, %r3
thr2_dc_err_22:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_22), 16, 16),1,DC_DATA,40)
	.word 0xcf1c2e2d  ! 282: LDDF_I	ldd	[%r16, 0x0e2d], %f7
	return     %r18 + 0x28
	.word 0x9f3c0011  ! 285: SRA_R	sra 	%r16, %r17, %r15
	.word 0x89342001  ! 285: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x84442a7d  ! 285: ADDC_I	addc 	%r16, 0x0a7d, %r2
	.word 0xaeb4231f  ! 285: ORNcc_I	orncc 	%r16, 0x031f, %r23
	.word 0x860c0011  ! 285: AND_R	and 	%r16, %r17, %r3
	.word 0xf51c0011  ! 286: LDDF_R	ldd	[%r16, %r17], %f26
thr2_irf_ce_24:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_24), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xce2c272f  ! 291: STB_I	stb	%r7, [%r16 + 0x072f]
	.word 0xb01c2cd4  ! 293: XOR_I	xor 	%r16, 0x0cd4, %r24
	.word 0x9f3c2001  ! 293: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0x9f2c0011  ! 293: SLL_R	sll 	%r16, %r17, %r15
	.word 0xa83c0011  ! 293: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0xb08425a3  ! 293: ADDcc_I	addcc 	%r16, 0x05a3, %r24
	.word 0xb4bc0011  ! 293: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0xf4d425e1  ! 294: LDSHA_I	ldsha	[%r16, + 0x05e1] %asi, %r26
thr2_irf_ce_25:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_25), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xce4c0011  ! 296: LDSB_R	ldsb	[%r16 + %r17], %r7
	.word 0xac842923  ! 298: ADDcc_I	addcc 	%r16, 0x0923, %r22
	.word 0xa8840011  ! 298: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0x8f641811  ! 298: MOVcc_R	<illegal instruction>
	.word 0xb2b4279f  ! 298: ORNcc_I	orncc 	%r16, 0x079f, %r25
	.word 0x9f343001  ! 298: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0xb53c0011  ! 298: SRA_R	sra 	%r16, %r17, %r26
	.word 0x96bc0011  ! 298: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0xae8c0011  ! 298: ANDcc_R	andcc 	%r16, %r17, %r23
	.word 0xeed41011  ! 299: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r23
thr2_irf_ce_26:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_26), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xd60428af  ! 301: LDUW_I	lduw	[%r16 + 0x08af], %r11
	.word 0xb93c2001  ! 303: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xa80c2c62  ! 303: AND_I	and 	%r16, 0x0c62, %r20
	.word 0x860c0011  ! 303: AND_R	and 	%r16, %r17, %r3
	.word 0xa6c40011  ! 303: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x8b342001  ! 303: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0x940c2537  ! 303: AND_I	and 	%r16, 0x0537, %r10
	.word 0xb0942d60  ! 303: ORcc_I	orcc 	%r16, 0x0d60, %r24
	.word 0xdb941011  ! 304: LDQFA_R	-	[%r16, %r17], %f13
	.word 0x93ec0011  ! 306: RESTORE_R	restore	%r16, %r17, %r9
	.word 0x94bc0011  ! 308: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0xb6940011  ! 308: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x9a8c2006  ! 308: ANDcc_I	andcc 	%r16, 0x0006, %r13
	.word 0x8c0c0011  ! 308: AND_R	and 	%r16, %r17, %r6
	.word 0x98c40011  ! 308: ADDCcc_R	addccc 	%r16, %r17, %r12
thr2_dc_err_23:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_23), 16, 16),1,DC_DATA,60)
	.word 0xc3142753  ! 310: LDQF_I	-	[%r16, 0x0753], %f1
	.word 0xdb941011  ! 312: LDQFA_R	-	[%r16, %r17], %f13
	.word 0xbac40011  ! 314: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0x8ac42799  ! 314: ADDCcc_I	addccc 	%r16, 0x0799, %r5
	.word 0x8f342001  ! 314: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0xb0340011  ! 314: ORN_R	orn 	%r16, %r17, %r24
	.word 0x9cbc2d9c  ! 314: XNORcc_I	xnorcc 	%r16, 0x0d9c, %r14
	.word 0x9f3c1011  ! 314: SRAX_R	srax	%r16, %r17, %r15
	.word 0xb48c207b  ! 314: ANDcc_I	andcc 	%r16, 0x007b, %r26
	.word 0xc91c2d9e  ! 315: LDDF_I	ldd	[%r16, 0x0d9e], %f4
thr2_irf_ce_27:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_27), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xc36c2c8a  ! 317: PREFETCH_I	prefetch	[%r16 + 0x0c8a], #one_read
	.word 0x8aac0011  ! 319: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x90bc0011  ! 319: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x9f2c0011  ! 319: SLL_R	sll 	%r16, %r17, %r15
	.word 0x9a9426a1  ! 319: ORcc_I	orcc 	%r16, 0x06a1, %r13
	.word 0x8e9c2dc0  ! 319: XORcc_I	xorcc 	%r16, 0x0dc0, %r7
thr2_dc_err_24:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_24), 16, 16),1,DC_DATA,46)
	.word 0xe88c2955  ! 321: LDUBA_I	lduba	[%r16, + 0x0955] %asi, %r20
thr2_irf_ce_28:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_28), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xd5140011  ! 323: LDQF_R	-	[%r16, %r17], %f10
	.word 0xb8bc0011  ! 325: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0x90940011  ! 325: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x888c0011  ! 325: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0x82b42c96  ! 325: ORNcc_I	orncc 	%r16, 0x0c96, %r1
	.word 0xab7c2401  ! 325: MOVR_I	move	%r16, 0xfffffe54, %r21
thr2_dc_err_25:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_25), 16, 16),1,DC_DATA,71)
	.word 0xe84c2e64  ! 327: LDSB_I	ldsb	[%r16 + 0x0e64], %r20
	.word 0xc2dc1011  ! 329: LDXA_R	ldxa	[%r16, %r17] 0x80, %r1
	.word 0x932c2001  ! 331: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0xaf643801  ! 331: MOVcc_I	<illegal instruction>
	.word 0xb21c0011  ! 331: XOR_R	xor 	%r16, %r17, %r25
	.word 0xba3c0011  ! 331: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0x93641811  ! 331: MOVcc_R	<illegal instruction>
	.word 0x9e040011  ! 331: ADD_R	add 	%r16, %r17, %r15
	.word 0x823c2a93  ! 331: XNOR_I	xnor 	%r16, 0x0a93, %r1
	.word 0x9d2c3001  ! 331: SLLX_I	sllx	%r16, 0x0001, %r14
thr2_dc_err_26:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_26), 16, 16),1,DC_DATA,37)
	.word 0xc51c268f  ! 333: LDDF_I	ldd	[%r16, 0x068f], %f2
thr2_irf_ce_29:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_29), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xea34296b  ! 337: STH_I	sth	%r21, [%r16 + 0x096b]
	.word 0x8ec4282b  ! 339: ADDCcc_I	addccc 	%r16, 0x082b, %r7
	.word 0x9e040011  ! 339: ADD_R	add 	%r16, %r17, %r15
	.word 0x99340011  ! 339: SRL_R	srl 	%r16, %r17, %r12
	.word 0x917c0411  ! 339: MOVR_R	move	%r16, %r17, %r8
	.word 0x8f641811  ! 339: MOVcc_R	<illegal instruction>
	.word 0xb8340011  ! 339: ORN_R	orn 	%r16, %r17, %r28
	.word 0xb8340011  ! 339: ORN_R	orn 	%r16, %r17, %r28
thr2_dc_err_27:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_27), 16, 16),1,DC_DATA,45)
	.word 0xc71426ff  ! 341: LDQF_I	-	[%r16, 0x06ff], %f3
	.word 0x81dc0011  ! 343: FLUSH_R	dis not found

	.word 0x929c21c7  ! 345: XORcc_I	xorcc 	%r16, 0x01c7, %r9
	.word 0x8b7c0411  ! 345: MOVR_R	move	%r16, %r17, %r5
	.word 0x840c0011  ! 345: AND_R	and 	%r16, %r17, %r2
	.word 0x82842353  ! 345: ADDcc_I	addcc 	%r16, 0x0353, %r1
	.word 0x9b643801  ! 345: MOVcc_I	<illegal instruction>
	.word 0xb0b40011  ! 345: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0x9abc0011  ! 345: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0xc51c0011  ! 346: LDDF_R	ldd	[%r16, %r17], %f2
	.word 0xce040011  ! 348: LDUW_R	lduw	[%r16 + %r17], %r7
	.word 0x8a042fdc  ! 350: ADD_I	add 	%r16, 0x0fdc, %r5
	.word 0xb6942a37  ! 350: ORcc_I	orcc 	%r16, 0x0a37, %r27
	.word 0xa88c2267  ! 350: ANDcc_I	andcc 	%r16, 0x0267, %r20
	.word 0x88140011  ! 350: OR_R	or 	%r16, %r17, %r4
	.word 0x8c440011  ! 350: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x9b342001  ! 350: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0xcccc22eb  ! 351: LDSBA_I	ldsba	[%r16, + 0x02eb] %asi, %r6
	.word 0xced426d3  ! 353: LDSHA_I	ldsha	[%r16, + 0x06d3] %asi, %r7
	.word 0x8aac0011  ! 355: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x880c0011  ! 355: AND_R	and 	%r16, %r17, %r4
	.word 0xad2c1011  ! 355: SLLX_R	sllx	%r16, %r17, %r22
	.word 0x9f3c2001  ! 355: SRA_I	sra 	%r16, 0x0001, %r15
	.word 0xb92c0011  ! 355: SLL_R	sll 	%r16, %r17, %r28
	.word 0x96b42e03  ! 355: ORNcc_I	orncc 	%r16, 0x0e03, %r11
thr2_dc_err_28:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_28), 16, 16),1,DC_DATA,54)
	.word 0xe88c2f6c  ! 357: LDUBA_I	lduba	[%r16, + 0x0f6c] %asi, %r20
thr2_irf_ce_30:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_30), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xc31c0011  ! 359: LDDF_R	ldd	[%r16, %r17], %f1
	.word 0x8eac0011  ! 361: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x84140011  ! 361: OR_R	or 	%r16, %r17, %r2
	.word 0x921c0011  ! 361: XOR_R	xor 	%r16, %r17, %r9
	.word 0xab643801  ! 361: MOVcc_I	<illegal instruction>
	.word 0x94bc0011  ! 361: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0xb4140011  ! 361: OR_R	or 	%r16, %r17, %r26
	.word 0x8cc42936  ! 361: ADDCcc_I	addccc 	%r16, 0x0936, %r6
	.word 0x842c0011  ! 361: ANDN_R	andn 	%r16, %r17, %r2
	.word 0xe6942c28  ! 362: LDUHA_I	lduha	[%r16, + 0x0c28] %asi, %r19
thr2_irf_ce_31:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_31), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xd4cc1011  ! 364: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r10
	.word 0x942c0011  ! 366: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x8a942062  ! 366: ORcc_I	orcc 	%r16, 0x0062, %r5
	.word 0xb72c2001  ! 366: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0x93340011  ! 366: SRL_R	srl 	%r16, %r17, %r9
	.word 0x912c1011  ! 366: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x82c42686  ! 366: ADDCcc_I	addccc 	%r16, 0x0686, %r1
	.word 0xb29c24b1  ! 366: XORcc_I	xorcc 	%r16, 0x04b1, %r25
thr2_dc_err_29:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_29), 16, 16),1,DC_DATA,26)
	.word 0xc91c2d0c  ! 368: LDDF_I	ldd	[%r16, 0x0d0c], %f4
	.word 0x9ad42253  ! 370: UMULcc_I	umulcc 	%r16, 0x0253, %r13
	.word 0x9e8c28a9  ! 372: ANDcc_I	andcc 	%r16, 0x08a9, %r15
	.word 0xba2c0011  ! 372: ANDN_R	andn 	%r16, %r17, %r29
	.word 0x8a440011  ! 372: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x84340011  ! 372: ORN_R	orn 	%r16, %r17, %r2
	.word 0x869421d4  ! 372: ORcc_I	orcc 	%r16, 0x01d4, %r3
	.word 0x8604221b  ! 372: ADD_I	add 	%r16, 0x021b, %r3
	.word 0xa8bc0011  ! 372: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0xc31c2cbf  ! 373: LDDF_I	ldd	[%r16, 0x0cbf], %f1
thr2_irf_ce_32:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_32), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
        wr  %g0, 0x80, %asi
	.word 0x94842721  ! 377: ADDcc_I	addcc 	%r16, 0x0721, %r10
	.word 0x96342632  ! 377: ORN_I	orn 	%r16, 0x0632, %r11
	.word 0x96bc0011  ! 377: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x9abc0011  ! 377: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x9e1c0011  ! 377: XOR_R	xor 	%r16, %r17, %r15
thr2_dc_err_30:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_30), 16, 16),1,DC_DATA,61)
	.word 0xce542484  ! 379: LDSH_I	ldsh	[%r16 + 0x0484], %r7
thr2_irf_ce_33:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_33), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xdf9c1011  ! 381: LDDFA_R	ldda	[%r16, %r17], %f15
	.word 0x9a1c26c1  ! 383: XOR_I	xor 	%r16, 0x06c1, %r13
	.word 0xba940011  ! 383: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x9e14229a  ! 383: OR_I	or 	%r16, 0x029a, %r15
	.word 0xb0940011  ! 383: ORcc_R	orcc 	%r16, %r17, %r24
	.word 0xba840011  ! 383: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0xaac40011  ! 383: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0x82042c98  ! 383: ADD_I	add 	%r16, 0x0c98, %r1
thr2_dc_err_31:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_31), 16, 16),1,DC_DATA,47)
	.word 0xf6d42004  ! 385: LDSHA_I	ldsha	[%r16, + 0x0004] %asi, %r27
	.word 0xee4c2da7  ! 387: LDSB_I	ldsb	[%r16 + 0x0da7], %r23
	.word 0x8f342001  ! 389: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x82bc21c9  ! 389: XNORcc_I	xnorcc 	%r16, 0x01c9, %r1
	.word 0xac840011  ! 389: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0xaf7c0411  ! 389: MOVR_R	move	%r16, %r17, %r23
	.word 0x9c1c2554  ! 389: XOR_I	xor 	%r16, 0x0554, %r14
	.word 0xe61c0011  ! 390: LDD_R	ldd	[%r16 + %r17], %r19
thr2_irf_ce_34:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_34), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xc5941011  ! 392: LDQFA_R	-	[%r16, %r17], %f2
	.word 0xa81c0011  ! 394: XOR_R	xor 	%r16, %r17, %r20
	.word 0xad641811  ! 394: MOVcc_R	<illegal instruction>
	.word 0xacbc0011  ! 394: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0x92142acf  ! 394: OR_I	or 	%r16, 0x0acf, %r9
	.word 0x9a0422bf  ! 394: ADD_I	add 	%r16, 0x02bf, %r13
	.word 0x9b7c2401  ! 394: MOVR_I	move	%r16, 0xfffffe54, %r13
	.word 0xd51c0011  ! 395: LDDF_R	ldd	[%r16, %r17], %f10
thr2_irf_ce_35:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_35), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd0941011  ! 397: LDUHA_R	lduha	[%r16, %r17] 0x80, %r8
	.word 0x86840011  ! 399: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0xba2c2c2c  ! 399: ANDN_I	andn 	%r16, 0x0c2c, %r29
	.word 0x922c20ed  ! 399: ANDN_I	andn 	%r16, 0x00ed, %r9
	.word 0x8a9c0011  ! 399: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0x909c0011  ! 399: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0xba84226b  ! 399: ADDcc_I	addcc 	%r16, 0x026b, %r29
	.word 0x94040011  ! 399: ADD_R	add 	%r16, %r17, %r10
	.word 0x9c1c0011  ! 399: XOR_R	xor 	%r16, %r17, %r14
thr2_dc_err_32:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_32), 16, 16),1,DC_DATA,9)
	.word 0xec9420f1  ! 401: LDUHA_I	lduha	[%r16, + 0x00f1] %asi, %r22
thr2_irf_ce_36:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_36), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
thr2_resum_intr_758:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_758), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x94840011  ! 405: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0xb4b42185  ! 405: ORNcc_I	orncc 	%r16, 0x0185, %r26
	.word 0x94940011  ! 405: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x9b643801  ! 405: MOVcc_I	<illegal instruction>
	.word 0x849c2b19  ! 405: XORcc_I	xorcc 	%r16, 0x0b19, %r2
	.word 0x862c0011  ! 405: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x83641811  ! 405: MOVcc_R	<illegal instruction>
thr2_dc_err_33:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_33), 16, 16),1,DC_DATA,12)
	.word 0xec4c0000  ! 407: LDSB_R	ldsb	[%r16 + %r0], %r22
	.word 0xef9c1011  ! 409: LDDFA_R	ldda	[%r16, %r17], %f23
	.word 0xb23c0011  ! 411: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0x82940011  ! 411: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x8ebc22d0  ! 411: XNORcc_I	xnorcc 	%r16, 0x02d0, %r7
	.word 0x942c0011  ! 411: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x821c2d31  ! 411: XOR_I	xor 	%r16, 0x0d31, %r1
	.word 0x84142183  ! 411: OR_I	or 	%r16, 0x0183, %r2
	.word 0x929c2c66  ! 411: XORcc_I	xorcc 	%r16, 0x0c66, %r9
	.word 0xa8bc0011  ! 411: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0xc4cc1011  ! 412: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r2
thr2_irf_ce_37:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_37), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xce8c2cbc  ! 414: LDUBA_I	lduba	[%r16, + 0x0cbc] %asi, %r7
	.word 0x9ab40011  ! 416: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0xb5641811  ! 416: MOVcc_R	<illegal instruction>
	.word 0x9a8c0011  ! 416: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0x8a040011  ! 416: ADD_R	add 	%r16, %r17, %r5
	.word 0x91342001  ! 416: SRL_I	srl 	%r16, 0x0001, %r8
thr2_dc_err_34:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_34), 16, 16),1,DC_DATA,64)
	.word 0xf2941000  ! 418: LDUHA_R	lduha	[%r16, %r0] 0x80, %r25
	ta	T_CHANGE_HPRIV	! macro
	.word 0x941c260a  ! 422: XOR_I	xor 	%r16, 0x060a, %r10
	.word 0x94842647  ! 422: ADDcc_I	addcc 	%r16, 0x0647, %r10
	.word 0x83343001  ! 422: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x8a840011  ! 422: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x9f641811  ! 422: MOVcc_R	<illegal instruction>
	.word 0xad643801  ! 422: MOVcc_I	<illegal instruction>
	.word 0xdb040011  ! 423: LDF_R	ld	[%r16, %r17], %f13
	.word 0xe9841011  ! 425: LDFA_R	lda	[%r16, %r17], %f20
	.word 0x9b2c0011  ! 427: SLL_R	sll 	%r16, %r17, %r13
	.word 0xb22c2a21  ! 427: ANDN_I	andn 	%r16, 0x0a21, %r25
	.word 0x8e34214f  ! 427: ORN_I	orn 	%r16, 0x014f, %r7
	.word 0x8aac0011  ! 427: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x9e140011  ! 427: OR_R	or 	%r16, %r17, %r15
	.word 0x897c2401  ! 427: MOVR_I	move	%r16, 0xfffffe54, %r4
thr2_dc_err_35:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_35), 16, 16),1,DC_DATA,54)
	.word 0xda040000  ! 429: LDUW_R	lduw	[%r16 + %r0], %r13
thr2_irf_ce_38:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_38), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xea942797  ! 431: LDUHA_I	lduha	[%r16, + 0x0797] %asi, %r21
	.word 0xb32c2001  ! 433: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0xaabc0011  ! 433: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0x9c440011  ! 433: ADDC_R	addc 	%r16, %r17, %r14
	.word 0xb6340011  ! 433: ORN_R	orn 	%r16, %r17, %r27
	.word 0x983c2dbc  ! 433: XNOR_I	xnor 	%r16, 0x0dbc, %r12
	.word 0xb89c0011  ! 433: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0xad7c2401  ! 433: MOVR_I	move	%r16, 0xfffffe54, %r22
thr2_dc_err_36:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_36), 16, 16),1,DC_DATA,26)
	.word 0xd2440000  ! 435: LDSW_R	ldsw	[%r16 + %r0], %r9
thr2_irf_ce_39:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_39), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xfadc2f26  ! 437: LDXA_I	ldxa	[%r16, + 0x0f26] %asi, %r29
	.word 0x9d7c2401  ! 439: MOVR_I	move	%r16, 0xfffffe54, %r14
	.word 0xad340011  ! 439: SRL_R	srl 	%r16, %r17, %r22
	.word 0x9a9c0011  ! 439: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x829c2730  ! 439: XORcc_I	xorcc 	%r16, 0x0730, %r1
	.word 0x94c40011  ! 439: ADDCcc_R	addccc 	%r16, %r17, %r10
	.word 0x8ec40011  ! 439: ADDCcc_R	addccc 	%r16, %r17, %r7
thr2_dc_err_37:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_37), 16, 16),1,DC_DATA,5)
	.word 0xca5c2e5e  ! 441: LDX_I	ldx	[%r16 + 0x0e5e], %r5
	.word 0xe6442420  ! 443: LDSW_I	ldsw	[%r16 + 0x0420], %r19
	.word 0x9a8423b6  ! 445: ADDcc_I	addcc 	%r16, 0x03b6, %r13
	.word 0x8c0c230a  ! 445: AND_I	and 	%r16, 0x030a, %r6
	.word 0x921c0011  ! 445: XOR_R	xor 	%r16, %r17, %r9
	.word 0x9d3c2001  ! 445: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x90b42b80  ! 445: ORNcc_I	orncc 	%r16, 0x0b80, %r8
	.word 0xb57c2401  ! 445: MOVR_I	move	%r16, 0xfffffe54, %r26
	.word 0x8f341011  ! 445: SRLX_R	srlx	%r16, %r17, %r7
thr2_dc_err_38:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_38), 16, 16),1,DC_DATA,67)
	.word 0xeed42761  ! 447: LDSHA_I	ldsha	[%r16, + 0x0761] %asi, %r23
	return     %r18 + 0x28
	.word 0x969c222a  ! 450: XORcc_I	xorcc 	%r16, 0x022a, %r11
	.word 0x953c2001  ! 450: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x96940011  ! 450: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0xb12c3001  ! 450: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x909c29d4  ! 450: XORcc_I	xorcc 	%r16, 0x09d4, %r8
	.word 0xb68c0011  ! 450: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x88842151  ! 450: ADDcc_I	addcc 	%r16, 0x0151, %r4
	.word 0x91340011  ! 450: SRL_R	srl 	%r16, %r17, %r8
thr2_dc_err_39:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_39), 16, 16),1,DC_DATA,39)
	.word 0xe79c1000  ! 452: LDDFA_R	ldda	[%r16, %r0], %f19
thr2_irf_ce_40:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_40), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xf1841011  ! 454: LDFA_R	lda	[%r16, %r17], %f24
	.word 0xb21c28f9  ! 456: XOR_I	xor 	%r16, 0x08f9, %r25
	.word 0x8d7c2401  ! 456: MOVR_I	move	%r16, 0xfffffe54, %r6
	.word 0x8f641811  ! 456: MOVcc_R	<illegal instruction>
	.word 0x9ec40011  ! 456: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x848c2c4d  ! 456: ANDcc_I	andcc 	%r16, 0x0c4d, %r2
	.word 0x8cac2dcc  ! 456: ANDNcc_I	andncc 	%r16, 0x0dcc, %r6
	.word 0x889c215b  ! 456: XORcc_I	xorcc 	%r16, 0x015b, %r4
	.word 0xec0c2c56  ! 457: LDUB_I	ldub	[%r16 + 0x0c56], %r22
	.word 0xc9941011  ! 459: LDQFA_R	-	[%r16, %r17], %f4
	.word 0x963425b7  ! 461: ORN_I	orn 	%r16, 0x05b7, %r11
	.word 0xa63c2093  ! 461: XNOR_I	xnor 	%r16, 0x0093, %r19
	.word 0xa614233b  ! 461: OR_I	or 	%r16, 0x033b, %r19
	.word 0x90140011  ! 461: OR_R	or 	%r16, %r17, %r8
	.word 0x942c0011  ! 461: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x9f2c1011  ! 461: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x8d641811  ! 461: MOVcc_R	<illegal instruction>
	.word 0x94942a44  ! 461: ORcc_I	orcc 	%r16, 0x0a44, %r10
thr2_dc_err_40:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_40), 16, 16),1,DC_DATA,56)
	.word 0xd71c0000  ! 463: LDDF_R	ldd	[%r16, %r0], %f11
thr2_irf_ce_41:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_41), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xc2842330  ! 465: LDUWA_I	lduwa	[%r16, + 0x0330] %asi, %r1
	.word 0x900c0011  ! 467: AND_R	and 	%r16, %r17, %r8
	.word 0x883429b9  ! 467: ORN_I	orn 	%r16, 0x09b9, %r4
	.word 0x8eb42f81  ! 467: ORNcc_I	orncc 	%r16, 0x0f81, %r7
	.word 0x89342001  ! 467: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x9d641811  ! 467: MOVcc_R	<illegal instruction>
	.word 0xae0c26bd  ! 467: AND_I	and 	%r16, 0x06bd, %r23
	.word 0x8f341011  ! 467: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x9d3c1011  ! 467: SRAX_R	srax	%r16, %r17, %r14
	.word 0xdc9c251f  ! 468: LDDA_I	ldda	[%r16, + 0x051f] %asi, %r14
!Illinst store
	.word 0xda240011  ! 470: STW_R	stw	%r13, [%r16 + %r17]
	.word 0x95342001  ! 472: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0xb2bc0011  ! 472: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0x972c0011  ! 472: SLL_R	sll 	%r16, %r17, %r11
	.word 0x92c40011  ! 472: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0x8c342573  ! 472: ORN_I	orn 	%r16, 0x0573, %r6
	.word 0xaa442944  ! 472: ADDC_I	addc 	%r16, 0x0944, %r21
	.word 0xde14223d  ! 473: LDUH_I	lduh	[%r16 + 0x023d], %r15
thr2_irf_ce_42:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_42), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xb2d40011  ! 475: UMULcc_R	umulcc 	%r16, %r17, %r25
	.word 0x897c0411  ! 477: MOVR_R	move	%r16, %r17, %r4
	.word 0x852c3001  ! 477: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0x860c0011  ! 477: AND_R	and 	%r16, %r17, %r3
	.word 0x903c0011  ! 477: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x88042e76  ! 477: ADD_I	add 	%r16, 0x0e76, %r4
	.word 0x9f340011  ! 477: SRL_R	srl 	%r16, %r17, %r15
	.word 0xa8ac27aa  ! 477: ANDNcc_I	andncc 	%r16, 0x07aa, %r20
	.word 0xf01c2b87  ! 478: LDD_I	ldd	[%r16 + 0x0b87], %r24
	.word 0xde04257b  ! 480: LDUW_I	lduw	[%r16 + 0x057b], %r15
	.word 0x91342001  ! 482: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0xab3c0011  ! 482: SRA_R	sra 	%r16, %r17, %r21
	.word 0xa604272e  ! 482: ADD_I	add 	%r16, 0x072e, %r19
	.word 0x93341011  ! 482: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x903c0011  ! 482: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0xd7841011  ! 483: LDFA_R	lda	[%r16, %r17], %f11
	.word 0xde4c207e  ! 485: LDSB_I	ldsb	[%r16 + 0x007e], %r15
	.word 0x8a142373  ! 487: OR_I	or 	%r16, 0x0373, %r5
	.word 0xb69c0011  ! 487: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0xb4bc2e19  ! 487: XNORcc_I	xnorcc 	%r16, 0x0e19, %r26
	.word 0x86bc0011  ! 487: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x862c223e  ! 487: ANDN_I	andn 	%r16, 0x023e, %r3
	.word 0x948c0011  ! 487: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x857c2401  ! 488: MOVR_I	move	%r16, 0xfffffe54, %r2
	.word 0x84b42217  ! 488: ORNcc_I	orncc 	%r16, 0x0217, %r2
	.word 0xb52c1011  ! 488: SLLX_R	sllx	%r16, %r17, %r26
	.word 0xb4bc0011  ! 488: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0x82940011  ! 488: ORcc_R	orcc 	%r16, %r17, %r1
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xd7841011  ! 488: LDFA_R	lda	[%r16, %r17], %f11
thr2_irf_ce_43:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_43), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	jmpl     %r18 + 0x28, %r31
	.word 0x873c1011  ! 491: SRAX_R	srax	%r16, %r17, %r3
	.word 0x86ac0011  ! 491: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0x84ac2400  ! 491: ANDNcc_I	andncc 	%r16, 0x0400, %r2
	.word 0x92140011  ! 491: OR_R	or 	%r16, %r17, %r9
	.word 0x84140011  ! 491: OR_R	or 	%r16, %r17, %r2
	.word 0xb12c3001  ! 491: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x82bc2a93  ! 491: XNORcc_I	xnorcc 	%r16, 0x0a93, %r1
thr2_dc_err_41:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_41), 16, 16),1,DC_DATA,4)
	.word 0xd0841000  ! 493: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r8
	.word 0x8de40011  ! 495: SAVE_R	save	%r16, %r17, %r6
	.word 0x942c0011  ! 497: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x862c0011  ! 497: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x9c342789  ! 497: ORN_I	orn 	%r16, 0x0789, %r14
	.word 0x883c2366  ! 497: XNOR_I	xnor 	%r16, 0x0366, %r4
	.word 0x9c040011  ! 497: ADD_R	add 	%r16, %r17, %r14
	.word 0xee941011  ! 498: LDUHA_R	lduha	[%r16, %r17] 0x80, %r23
	.word 0xc8dc1011  ! 500: LDXA_R	ldxa	[%r16, %r17] 0x80, %r4
	.word 0x8b641811  ! 502: MOVcc_R	<illegal instruction>
	.word 0x921c0011  ! 502: XOR_R	xor 	%r16, %r17, %r9
	.word 0xb4042a6e  ! 502: ADD_I	add 	%r16, 0x0a6e, %r26
	.word 0xb2c40011  ! 502: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0x9c1428a5  ! 502: OR_I	or 	%r16, 0x08a5, %r14
	.word 0xa83c0011  ! 502: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0x977c0411  ! 502: MOVR_R	move	%r16, %r17, %r11
thr2_dc_err_42:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_42), 16, 16),1,DC_DATA,55)
	.word 0xd25421ff  ! 504: LDSH_I	ldsh	[%r16 + 0x01ff], %r9
	.word 0xe68c1011  ! 506: LDUBA_R	lduba	[%r16, %r17] 0x80, %r19
	.word 0xb0b40011  ! 508: ORNcc_R	orncc 	%r16, %r17, %r24
	.word 0x853c1011  ! 508: SRAX_R	srax	%r16, %r17, %r2
	.word 0x857c2401  ! 508: MOVR_I	move	%r16, 0xfffffe54, %r2
	.word 0x892c2001  ! 508: SLL_I	sll 	%r16, 0x0001, %r4
	.word 0x86bc0011  ! 508: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x93643801  ! 508: MOVcc_I	<illegal instruction>
	.word 0xb2bc2ea9  ! 508: XNORcc_I	xnorcc 	%r16, 0x0ea9, %r25
	.word 0x963c0011  ! 508: XNOR_R	xnor 	%r16, %r17, %r11
thr2_dc_err_43:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_43), 16, 16),1,DC_DATA,3)
	.word 0xd51c2aad  ! 510: LDDF_I	ldd	[%r16, 0x0aad], %f10
thr2_irf_ce_44:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_44), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xcf1c0011  ! 512: LDDF_R	ldd	[%r16, %r17], %f7
	.word 0x9c0c27a6  ! 514: AND_I	and 	%r16, 0x07a6, %r14
	.word 0x95643801  ! 514: MOVcc_I	<illegal instruction>
	.word 0xba2c0011  ! 514: ANDN_R	andn 	%r16, %r17, %r29
	.word 0x9e1c27f6  ! 514: XOR_I	xor 	%r16, 0x07f6, %r15
	.word 0x88940011  ! 514: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x897c0411  ! 514: MOVR_R	move	%r16, %r17, %r4
	.word 0xac3c0011  ! 514: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x98b40011  ! 514: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0xf0dc2b03  ! 515: LDXA_I	ldxa	[%r16, + 0x0b03] %asi, %r24
	.word 0xcd140011  ! 517: LDQF_R	-	[%r16, %r17], %f6
	.word 0x92840011  ! 519: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0x9d3c2001  ! 519: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x849c0011  ! 519: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x982c0011  ! 519: ANDN_R	andn 	%r16, %r17, %r12
	.word 0x91340011  ! 519: SRL_R	srl 	%r16, %r17, %r8
	.word 0xb2c40011  ! 519: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0x9d2c1011  ! 519: SLLX_R	sllx	%r16, %r17, %r14
	.word 0xaa0c0011  ! 519: AND_R	and 	%r16, %r17, %r21
	.word 0xe6dc1011  ! 520: LDXA_R	ldxa	[%r16, %r17] 0x80, %r19
thr2_irf_ce_45:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_45), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xc3941011  ! 522: LDQFA_R	-	[%r16, %r17], %f1
	.word 0xb814202d  ! 524: OR_I	or 	%r16, 0x002d, %r28
	.word 0x868c2930  ! 524: ANDcc_I	andcc 	%r16, 0x0930, %r3
	.word 0xb60c216c  ! 524: AND_I	and 	%r16, 0x016c, %r27
	.word 0x940c260f  ! 524: AND_I	and 	%r16, 0x060f, %r10
	.word 0xae9420cb  ! 524: ORcc_I	orcc 	%r16, 0x00cb, %r23
thr2_dc_err_44:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_44), 16, 16),1,DC_DATA,9)
	.word 0xf6140000  ! 526: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xd7040011  ! 528: LDF_R	ld	[%r16, %r17], %f11
	.word 0xb83c0011  ! 530: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xb8c421b3  ! 530: ADDCcc_I	addccc 	%r16, 0x01b3, %r28
	.word 0x9c8c0011  ! 530: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x9c0422c8  ! 530: ADD_I	add 	%r16, 0x02c8, %r14
	.word 0x8b643801  ! 530: MOVcc_I	<illegal instruction>
thr2_dc_err_45:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_45), 16, 16),1,DC_DATA,1)
	.word 0xe9040000  ! 532: LDF_R	ld	[%r16, %r0], %f20
	.word 0xeedc1011  ! 534: LDXA_R	ldxa	[%r16, %r17] 0x80, %r23
	.word 0xbb643801  ! 536: MOVcc_I	<illegal instruction>
	.word 0x8d3c0011  ! 536: SRA_R	sra 	%r16, %r17, %r6
	.word 0xb8ac0011  ! 536: ANDNcc_R	andncc 	%r16, %r17, %r28
	.word 0x868c0011  ! 536: ANDcc_R	andcc 	%r16, %r17, %r3
	.word 0xa92c0011  ! 536: SLL_R	sll 	%r16, %r17, %r20
	.word 0x988c0011  ! 536: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x8a3c0011  ! 536: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xcc9c1011  ! 537: LDDA_R	ldda	[%r16, %r17] 0x80, %r6
thr2_irf_ce_46:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_46), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xdb841011  ! 539: LDFA_R	lda	[%r16, %r17], %f13
	.word 0x8a940011  ! 541: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x8a842554  ! 541: ADDcc_I	addcc 	%r16, 0x0554, %r5
	.word 0xae1c2351  ! 541: XOR_I	xor 	%r16, 0x0351, %r23
	.word 0x9a340011  ! 541: ORN_R	orn 	%r16, %r17, %r13
	.word 0x9f340011  ! 541: SRL_R	srl 	%r16, %r17, %r15
	.word 0xae2c2faa  ! 541: ANDN_I	andn 	%r16, 0x0faa, %r23
	.word 0xb4440011  ! 541: ADDC_R	addc 	%r16, %r17, %r26
	.word 0x912c3001  ! 541: SLLX_I	sllx	%r16, 0x0001, %r8
thr2_dc_err_46:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_46), 16, 16),1,DC_DATA,64)
	.word 0xd09c2fb7  ! 543: LDDA_I	ldda	[%r16, + 0x0fb7] %asi, %r8
!Illinst store
	.word 0xda340011  ! 545: STH_R	sth	%r13, [%r16 + %r17]
	.word 0x973c1011  ! 547: SRAX_R	srax	%r16, %r17, %r11
	.word 0x8cc40011  ! 547: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0xa8842dc2  ! 547: ADDcc_I	addcc 	%r16, 0x0dc2, %r20
	.word 0x86340011  ! 547: ORN_R	orn 	%r16, %r17, %r3
	.word 0x8a942f14  ! 547: ORcc_I	orcc 	%r16, 0x0f14, %r5
	.word 0x8a9c21dc  ! 547: XORcc_I	xorcc 	%r16, 0x01dc, %r5
thr2_dc_err_47:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_47), 16, 16),1,DC_DATA,20)
	.word 0xd2440000  ! 549: LDSW_R	ldsw	[%r16 + %r0], %r9
thr2_irf_ce_47:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_47), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xd7042a79  ! 551: LDF_I	ld	[%r16, 0x0a79], %f11
	.word 0x98442f6c  ! 553: ADDC_I	addc 	%r16, 0x0f6c, %r12
	.word 0xad343001  ! 553: SRLX_I	srlx	%r16, 0x0001, %r22
	.word 0x983c2aca  ! 553: XNOR_I	xnor 	%r16, 0x0aca, %r12
	.word 0xae840011  ! 553: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x9f2c1011  ! 553: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x908c0011  ! 553: ANDcc_R	andcc 	%r16, %r17, %r8
	.word 0x8b341011  ! 553: SRLX_R	srlx	%r16, %r17, %r5
thr2_dc_err_48:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_48), 16, 16),1,DC_DATA,17)
	.word 0xd61c22c3  ! 555: LDD_I	ldd	[%r16 + 0x02c3], %r11
	.word 0xd31c0011  ! 557: LDDF_R	ldd	[%r16, %r17], %f9
	.word 0x9eb42405  ! 559: ORNcc_I	orncc 	%r16, 0x0405, %r15
	.word 0xb29c2e99  ! 559: XORcc_I	xorcc 	%r16, 0x0e99, %r25
	.word 0x83641811  ! 559: MOVcc_R	<illegal instruction>
	.word 0xaeb40011  ! 559: ORNcc_R	orncc 	%r16, %r17, %r23
	.word 0x98ac28f7  ! 559: ANDNcc_I	andncc 	%r16, 0x08f7, %r12
	.word 0xab2c0011  ! 559: SLL_R	sll 	%r16, %r17, %r21
	.word 0xa9641811  ! 559: MOVcc_R	<illegal instruction>
	.word 0x82b40011  ! 559: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0xcf841011  ! 560: LDFA_R	lda	[%r16, %r17], %f7
thr2_irf_ce_48:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_48), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xfa1c2daf  ! 562: LDD_I	ldd	[%r16 + 0x0daf], %r29
	.word 0xb69c23d1  ! 564: XORcc_I	xorcc 	%r16, 0x03d1, %r27
	.word 0xa83427fc  ! 564: ORN_I	orn 	%r16, 0x07fc, %r20
	.word 0x98940011  ! 564: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x9ebc28db  ! 564: XNORcc_I	xnorcc 	%r16, 0x08db, %r15
	.word 0x8a3c0011  ! 564: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xbaac2d3a  ! 564: ANDNcc_I	andncc 	%r16, 0x0d3a, %r29
	.word 0x920c0011  ! 564: AND_R	and 	%r16, %r17, %r9
	.word 0x90bc0011  ! 564: XNORcc_R	xnorcc 	%r16, %r17, %r8
thr2_dc_err_49:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_49), 16, 16),1,DC_DATA,58)
	.word 0xeacc27c8  ! 566: LDSBA_I	ldsba	[%r16, + 0x07c8] %asi, %r21
	.word 0x8143c000  ! 568: STBAR	stbar
	.word 0x86bc0011  ! 570: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0x9d343001  ! 570: SRLX_I	srlx	%r16, 0x0001, %r14
	.word 0x9a4427d9  ! 570: ADDC_I	addc 	%r16, 0x07d9, %r13
	.word 0x9cb40011  ! 570: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0xab2c1011  ! 570: SLLX_R	sllx	%r16, %r17, %r21
	.word 0x853c0011  ! 570: SRA_R	sra 	%r16, %r17, %r2
thr2_dc_err_50:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_50), 16, 16),1,DC_DATA,12)
	.word 0xdf1c0000  ! 572: LDDF_R	ldd	[%r16, %r0], %f15
thr2_irf_ce_49:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_49), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xa7ec0011  ! 574: RESTORE_R	restore	%r16, %r17, %r19
	.word 0xb0042c66  ! 576: ADD_I	add 	%r16, 0x0c66, %r24
	.word 0x8e140011  ! 576: OR_R	or 	%r16, %r17, %r7
	.word 0x9cb421fc  ! 576: ORNcc_I	orncc 	%r16, 0x01fc, %r14
	.word 0xa7641811  ! 576: MOVcc_R	<illegal instruction>
	.word 0x8e8c0011  ! 576: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0x86440011  ! 576: ADDC_R	addc 	%r16, %r17, %r3
	.word 0x98bc2515  ! 576: XNORcc_I	xnorcc 	%r16, 0x0515, %r12
thr2_dc_err_51:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_51), 16, 16),1,DC_DATA,68)
	.word 0xd6cc25d5  ! 578: LDSBA_I	ldsba	[%r16, + 0x05d5] %asi, %r11
	.word 0xc31c0011  ! 580: LDDF_R	ldd	[%r16, %r17], %f1
	.word 0xb7342001  ! 582: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0x8f2c3001  ! 582: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x8e042fff  ! 582: ADD_I	add 	%r16, 0x0fff, %r7
	.word 0xb17c2401  ! 582: MOVR_I	move	%r16, 0xfffffe54, %r24
	.word 0x82440011  ! 582: ADDC_R	addc 	%r16, %r17, %r1
	.word 0x9e8c0011  ! 582: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0xa9343001  ! 582: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0xc7140011  ! 583: LDQF_R	-	[%r16, %r17], %f3
thr2_irf_ce_50:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_50), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xc7140011  ! 585: LDQF_R	-	[%r16, %r17], %f3
	.word 0xa6c40011  ! 587: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0x93342001  ! 587: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x962c0011  ! 587: ANDN_R	andn 	%r16, %r17, %r11
	.word 0x9abc22ce  ! 587: XNORcc_I	xnorcc 	%r16, 0x02ce, %r13
	.word 0x93341011  ! 587: SRLX_R	srlx	%r16, %r17, %r9
thr2_dc_err_52:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_52), 16, 16),1,DC_DATA,66)
	.word 0xd70425a2  ! 589: LDF_I	ld	[%r16, 0x05a2], %f11
	ta	T_CHANGE_PRIV	! macro
	.word 0xa7341011  ! 593: SRLX_R	srlx	%r16, %r17, %r19
	.word 0x9abc0011  ! 593: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x882c2897  ! 593: ANDN_I	andn 	%r16, 0x0897, %r4
	.word 0x988c0011  ! 593: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0x88ac23b2  ! 593: ANDNcc_I	andncc 	%r16, 0x03b2, %r4
thr2_dc_err_53:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_53), 16, 16),1,DC_DATA,47)
	.word 0xecd42f8b  ! 595: LDSHA_I	ldsha	[%r16, + 0x0f8b] %asi, %r22
thr2_irf_ce_51:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_51), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xd9841011  ! 597: LDFA_R	lda	[%r16, %r17], %f12
	.word 0x892c1011  ! 599: SLLX_R	sllx	%r16, %r17, %r4
	.word 0x923c0011  ! 599: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0xa62c223c  ! 599: ANDN_I	andn 	%r16, 0x023c, %r19
	.word 0x92b40011  ! 599: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0xb00c0011  ! 599: AND_R	and 	%r16, %r17, %r24
	.word 0xae1c2c78  ! 599: XOR_I	xor 	%r16, 0x0c78, %r23
thr2_dc_err_54:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_54), 16, 16),1,DC_DATA,21)
	.word 0xd2942c5c  ! 601: LDUHA_I	lduha	[%r16, + 0x0c5c] %asi, %r9
	.word 0xdec42006  ! 603: LDSWA_I	ldswa	[%r16, + 0x0006] %asi, %r15
	.word 0x822c0011  ! 605: ANDN_R	andn 	%r16, %r17, %r1
	.word 0xac3423ea  ! 605: ORN_I	orn 	%r16, 0x03ea, %r22
	.word 0x8ab40011  ! 605: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xbb7c2401  ! 605: MOVR_I	move	%r16, 0xfffffe54, %r29
	.word 0xaf342001  ! 605: SRL_I	srl 	%r16, 0x0001, %r23
	.word 0xae0c0011  ! 605: AND_R	and 	%r16, %r17, %r23
	.word 0x932c2001  ! 605: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0xb2c42049  ! 605: ADDCcc_I	addccc 	%r16, 0x0049, %r25
thr2_dc_err_55:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_55), 16, 16),1,DC_DATA,49)
	.word 0xc3841000  ! 607: LDFA_R	lda	[%r16, %r0], %f1
thr2_irf_ce_52:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_52), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xd634259f  ! 611: STH_I	sth	%r11, [%r16 + 0x059f]
	.word 0x9c9c26aa  ! 613: XORcc_I	xorcc 	%r16, 0x06aa, %r14
	.word 0x98340011  ! 613: ORN_R	orn 	%r16, %r17, %r12
	.word 0x9c8c2f66  ! 613: ANDcc_I	andcc 	%r16, 0x0f66, %r14
	.word 0x840c2f3f  ! 613: AND_I	and 	%r16, 0x0f3f, %r2
	.word 0x8f7c2401  ! 613: MOVR_I	move	%r16, 0xfffffe54, %r7
	.word 0xac8425e7  ! 613: ADDcc_I	addcc 	%r16, 0x05e7, %r22
	.word 0xeed41011  ! 614: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r23
	.word 0xd1040011  ! 616: LDF_R	ld	[%r16, %r17], %f8
	.word 0xa6940011  ! 618: ORcc_R	orcc 	%r16, %r17, %r19
	.word 0x87643801  ! 618: MOVcc_I	<illegal instruction>
	.word 0xaac40011  ! 618: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0x87341011  ! 618: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x823c0011  ! 618: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x83342001  ! 618: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x9f643801  ! 618: MOVcc_I	<illegal instruction>
	.word 0xa8842249  ! 618: ADDcc_I	addcc 	%r16, 0x0249, %r20
thr2_dc_err_56:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_56), 16, 16),1,DC_DATA,71)
	.word 0xf88c2af0  ! 620: LDUBA_I	lduba	[%r16, + 0x0af0] %asi, %r28
	.word 0x985c2edb  ! 622: SMUL_I	smul 	%r16, 0x0edb, %r12
	.word 0x95342001  ! 624: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x88042492  ! 624: ADD_I	add 	%r16, 0x0492, %r4
	.word 0x95641811  ! 624: MOVcc_R	<illegal instruction>
	.word 0x9a9c0011  ! 624: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x968c23e5  ! 624: ANDcc_I	andcc 	%r16, 0x03e5, %r11
	.word 0x9f2c2001  ! 624: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0x9eb40011  ! 624: ORNcc_R	orncc 	%r16, %r17, %r15
	.word 0x833c1011  ! 624: SRAX_R	srax	%r16, %r17, %r1
	.word 0xe9941011  ! 625: LDQFA_R	-	[%r16, %r17], %f20
thr2_irf_ce_53:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_53), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
        wr %g0, 0x4, %fprs
	.word 0xac8c0011  ! 629: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0x989c2a11  ! 629: XORcc_I	xorcc 	%r16, 0x0a11, %r12
	.word 0xb44426c7  ! 629: ADDC_I	addc 	%r16, 0x06c7, %r26
	.word 0x8b2c3001  ! 629: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x98ac0011  ! 629: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xb63c21ad  ! 629: XNOR_I	xnor 	%r16, 0x01ad, %r27
	.word 0x9f2c2001  ! 629: SLL_I	sll 	%r16, 0x0001, %r15
thr2_dc_err_57:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_57), 16, 16),1,DC_DATA,55)
	.word 0xdec41000  ! 631: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r15
thr2_irf_ce_54:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_54), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xd4042ed9  ! 633: LDUW_I	lduw	[%r16 + 0x0ed9], %r10
	.word 0x8c8c2eb6  ! 635: ANDcc_I	andcc 	%r16, 0x0eb6, %r6
	.word 0x82ac2b30  ! 635: ANDNcc_I	andncc 	%r16, 0x0b30, %r1
	.word 0x8eac253a  ! 635: ANDNcc_I	andncc 	%r16, 0x053a, %r7
	.word 0xa81c0011  ! 635: XOR_R	xor 	%r16, %r17, %r20
	.word 0x9a9c2d9d  ! 635: XORcc_I	xorcc 	%r16, 0x0d9d, %r13
	.word 0xb4bc2c33  ! 635: XNORcc_I	xnorcc 	%r16, 0x0c33, %r26
	.word 0x952c0011  ! 635: SLL_R	sll 	%r16, %r17, %r10
	.word 0xcc540011  ! 636: LDSH_R	ldsh	[%r16 + %r17], %r6
thr2_irf_ce_55:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_55), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0x8140c000  ! 638: RDASI	stbar
	.word 0xb8042171  ! 640: ADD_I	add 	%r16, 0x0171, %r28
	.word 0xbb2c0011  ! 640: SLL_R	sll 	%r16, %r17, %r29
	.word 0x82c40011  ! 640: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x822c0011  ! 640: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x97342001  ! 640: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0x9e8c2d1a  ! 640: ANDcc_I	andcc 	%r16, 0x0d1a, %r15
thr2_dc_err_58:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_58), 16, 16),1,DC_DATA,15)
	.word 0xcc8c22b4  ! 642: LDUBA_I	lduba	[%r16, + 0x02b4] %asi, %r6
	.word 0xc8dc1011  ! 644: LDXA_R	ldxa	[%r16, %r17] 0x80, %r4
	.word 0x9d3c0011  ! 646: SRA_R	sra 	%r16, %r17, %r14
	.word 0xaa3c0011  ! 646: XNOR_R	xnor 	%r16, %r17, %r21
	.word 0xb73c1011  ! 646: SRAX_R	srax	%r16, %r17, %r27
	.word 0xaf340011  ! 646: SRL_R	srl 	%r16, %r17, %r23
	.word 0xac2c2667  ! 646: ANDN_I	andn 	%r16, 0x0667, %r22
	.word 0x82c425cb  ! 646: ADDCcc_I	addccc 	%r16, 0x05cb, %r1
	.word 0xa72c2001  ! 646: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0x8c2c2f25  ! 646: ANDN_I	andn 	%r16, 0x0f25, %r6
	.word 0xd84c0011  ! 647: LDSB_R	ldsb	[%r16 + %r17], %r12
        wr %g0, 0x4, %fprs
	.word 0x97343001  ! 651: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0x9a0428d9  ! 651: ADD_I	add 	%r16, 0x08d9, %r13
	.word 0x96ac282f  ! 651: ANDNcc_I	andncc 	%r16, 0x082f, %r11
	.word 0x8e040011  ! 651: ADD_R	add 	%r16, %r17, %r7
	.word 0x88940011  ! 651: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x823c0011  ! 651: XNOR_R	xnor 	%r16, %r17, %r1
thr2_dc_err_59:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_59), 16, 16),1,DC_DATA,3)
	.word 0xcb941000  ! 653: LDQFA_R	-	[%r16, %r0], %f5
	.word 0x28800004  ! 655: BLEU	bleu,a	<label_0x4>
	.word 0x8c442d81  ! 657: ADDC_I	addc 	%r16, 0x0d81, %r6
	.word 0xb7340011  ! 657: SRL_R	srl 	%r16, %r17, %r27
	.word 0x897c2401  ! 657: MOVR_I	move	%r16, 0xfffffe54, %r4
	.word 0xac1c2753  ! 657: XOR_I	xor 	%r16, 0x0753, %r22
	.word 0x83342001  ! 657: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x943c2235  ! 657: XNOR_I	xnor 	%r16, 0x0235, %r10
	.word 0xac1420f0  ! 658: OR_I	or 	%r16, 0x00f0, %r22
	.word 0x82942de5  ! 658: ORcc_I	orcc 	%r16, 0x0de5, %r1
	.word 0x932c1011  ! 658: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x86ac0011  ! 658: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0x940c0011  ! 658: AND_R	and 	%r16, %r17, %r10
	.word 0x92440011  ! 658: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x8f3c1011  ! 658: SRAX_R	srax	%r16, %r17, %r7
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xccd41011  ! 658: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r6
thr2_irf_ce_56:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_56), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	return     %r18 + %r17
	.word 0x9a8c28bd  ! 661: ANDcc_I	andcc 	%r16, 0x08bd, %r13
	.word 0x96140011  ! 661: OR_R	or 	%r16, %r17, %r11
	.word 0xb29c29f3  ! 661: XORcc_I	xorcc 	%r16, 0x09f3, %r25
	.word 0x9f342001  ! 661: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x9e042805  ! 661: ADD_I	add 	%r16, 0x0805, %r15
	.word 0xae9c21d2  ! 661: XORcc_I	xorcc 	%r16, 0x01d2, %r23
	.word 0x9e8c2015  ! 661: ANDcc_I	andcc 	%r16, 0x0015, %r15
	.word 0xb0c40011  ! 661: ADDCcc_R	addccc 	%r16, %r17, %r24
	.word 0xd1941011  ! 662: LDQFA_R	-	[%r16, %r17], %f8
thr2_irf_ce_57:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_57), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xcf1c2e69  ! 664: LDDF_I	ldd	[%r16, 0x0e69], %f7
	.word 0x87341011  ! 666: SRLX_R	srlx	%r16, %r17, %r3
	.word 0xa6142f8a  ! 666: OR_I	or 	%r16, 0x0f8a, %r19
	.word 0xaf7c0411  ! 666: MOVR_R	move	%r16, %r17, %r23
	.word 0x9e940011  ! 666: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0xae940011  ! 666: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0x83343001  ! 666: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0xec140011  ! 667: LDUH_R	lduh	[%r16 + %r17], %r22
thr2_irf_ce_58:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_58), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xca742c08  ! 671: STX_I	stx	%r5, [%r16 + 0x0c08]
	.word 0x83643801  ! 673: MOVcc_I	<illegal instruction>
	.word 0x98040011  ! 673: ADD_R	add 	%r16, %r17, %r12
	.word 0xa73c0011  ! 673: SRA_R	sra 	%r16, %r17, %r19
	.word 0x84b40011  ! 673: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xaf341011  ! 673: SRLX_R	srlx	%r16, %r17, %r23
	.word 0x8ec424a9  ! 673: ADDCcc_I	addccc 	%r16, 0x04a9, %r7
	.word 0x912c1011  ! 673: SLLX_R	sllx	%r16, %r17, %r8
	.word 0xdd1c27fd  ! 674: LDDF_I	ldd	[%r16, 0x07fd], %f14
	.word 0xc24c2293  ! 676: LDSB_I	ldsb	[%r16 + 0x0293], %r1
	.word 0x92040011  ! 678: ADD_R	add 	%r16, %r17, %r9
	.word 0x8a142ed5  ! 678: OR_I	or 	%r16, 0x0ed5, %r5
	.word 0xb0bc0011  ! 678: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0x969c0011  ! 678: XORcc_R	xorcc 	%r16, %r17, %r11
	.word 0xb83c0011  ! 678: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xb0842f05  ! 678: ADDcc_I	addcc 	%r16, 0x0f05, %r24
	.word 0x923c0011  ! 678: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0xc2d41011  ! 679: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r1
thr2_irf_ce_59:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_59), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xc3ec29a8  ! 681: PREFETCHA_I	prefetcha	[%r16, + 0x09a8] %asi, #one_read
	.word 0xb01c0011  ! 683: XOR_R	xor 	%r16, %r17, %r24
	.word 0xb32c3001  ! 683: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0x90ac0011  ! 683: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x88340011  ! 683: ORN_R	orn 	%r16, %r17, %r4
	.word 0xa93c0011  ! 683: SRA_R	sra 	%r16, %r17, %r20
thr2_dc_err_60:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_60), 16, 16),1,DC_DATA,2)
	.word 0xfa5c0000  ! 685: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xe91c2bbb  ! 687: LDDF_I	ldd	[%r16, 0x0bbb], %f20
	.word 0x96b40011  ! 689: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0x90ac22d0  ! 689: ANDNcc_I	andncc 	%r16, 0x02d0, %r8
	.word 0x9cb40011  ! 689: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x9c2c0011  ! 689: ANDN_R	andn 	%r16, %r17, %r14
	.word 0xb8c40011  ! 689: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0xa6940011  ! 689: ORcc_R	orcc 	%r16, %r17, %r19
	.word 0xb52c1011  ! 689: SLLX_R	sllx	%r16, %r17, %r26
	.word 0xa6b40011  ! 689: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0xd2d41011  ! 690: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r9
        wr  %g0, 0x80, %asi
	.word 0xb0342669  ! 694: ORN_I	orn 	%r16, 0x0669, %r24
	.word 0x90c40011  ! 694: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x948c206b  ! 694: ANDcc_I	andcc 	%r16, 0x006b, %r10
	.word 0x88c40011  ! 694: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x83341011  ! 694: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x943c2477  ! 694: XNOR_I	xnor 	%r16, 0x0477, %r10
	.word 0x91643801  ! 694: MOVcc_I	<illegal instruction>
	.word 0x8a0c0011  ! 694: AND_R	and 	%r16, %r17, %r5
thr2_dc_err_61:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_61), 16, 16),1,DC_DATA,71)
	.word 0xca4c2167  ! 696: LDSB_I	ldsb	[%r16 + 0x0167], %r5
	.word 0xc91421fb  ! 698: LDQF_I	-	[%r16, 0x01fb], %f4
	.word 0x8c442dc3  ! 700: ADDC_I	addc 	%r16, 0x0dc3, %r6
	.word 0x820c0011  ! 700: AND_R	and 	%r16, %r17, %r1
	.word 0x882c0011  ! 700: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xab2c2001  ! 700: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0x9c040011  ! 700: ADD_R	add 	%r16, %r17, %r14
	.word 0x961c2d9b  ! 700: XOR_I	xor 	%r16, 0x0d9b, %r11
thr2_dc_err_62:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_62), 16, 16),1,DC_DATA,49)
	.word 0xcc040000  ! 702: LDUW_R	lduw	[%r16 + %r0], %r6
!Illinst alu
	.word 0x84ac0011  ! 704: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0x93343001  ! 706: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0xb9343001  ! 706: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x8f641811  ! 706: MOVcc_R	<illegal instruction>
	.word 0x9e142b36  ! 706: OR_I	or 	%r16, 0x0b36, %r15
	.word 0x83343001  ! 706: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0xba2c22d0  ! 706: ANDN_I	andn 	%r16, 0x02d0, %r29
thr2_dc_err_63:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_63), 16, 16),1,DC_DATA,55)
	.word 0xde140000  ! 708: LDUH_R	lduh	[%r16 + %r0], %r15
	.word 0xd3941011  ! 710: LDQFA_R	-	[%r16, %r17], %f9
	.word 0x933c2001  ! 712: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x8e2c2395  ! 712: ANDN_I	andn 	%r16, 0x0395, %r7
	.word 0x9c140011  ! 712: OR_R	or 	%r16, %r17, %r14
	.word 0x9c0c0011  ! 712: AND_R	and 	%r16, %r17, %r14
	.word 0x9f343001  ! 712: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0xb6ac2fb8  ! 712: ANDNcc_I	andncc 	%r16, 0x0fb8, %r27
	.word 0xa60c0011  ! 712: AND_R	and 	%r16, %r17, %r19
thr2_dc_err_64:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_64), 16, 16),1,DC_DATA,31)
	.word 0xdf941000  ! 714: LDQFA_R	-	[%r16, %r0], %f15
	.word 0xdb9c1011  ! 716: LDDFA_R	ldda	[%r16, %r17], %f13
	.word 0x948c0011  ! 718: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0xb8c40011  ! 718: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0x96b426a9  ! 718: ORNcc_I	orncc 	%r16, 0x06a9, %r11
	.word 0x9b343001  ! 718: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0x9ac40011  ! 718: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x8c2c0011  ! 718: ANDN_R	andn 	%r16, %r17, %r6
thr2_dc_err_65:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_65), 16, 16),1,DC_DATA,4)
	.word 0xd7941000  ! 720: LDQFA_R	-	[%r16, %r0], %f11
	.word 0xea0c27ab  ! 722: LDUB_I	ldub	[%r16 + 0x07ab], %r21
	.word 0x9e0c0011  ! 724: AND_R	and 	%r16, %r17, %r15
	.word 0x86b40011  ! 724: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0xb12c1011  ! 724: SLLX_R	sllx	%r16, %r17, %r24
	.word 0x8cbc2eb8  ! 724: XNORcc_I	xnorcc 	%r16, 0x0eb8, %r6
	.word 0x888c277f  ! 724: ANDcc_I	andcc 	%r16, 0x077f, %r4
	.word 0x88ac0011  ! 724: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0xb48c21ab  ! 724: ANDcc_I	andcc 	%r16, 0x01ab, %r26
	.word 0x9f7c0411  ! 724: MOVR_R	move	%r16, %r17, %r15
thr2_dc_err_66:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_66), 16, 16),1,DC_DATA,14)
	.word 0xf8140000  ! 726: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xf79c1011  ! 728: LDDFA_R	ldda	[%r16, %r17], %f27
	.word 0x96842f6b  ! 730: ADDcc_I	addcc 	%r16, 0x0f6b, %r11
	.word 0x9eac0011  ! 730: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xb83c0011  ! 730: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0x8cac2683  ! 730: ANDNcc_I	andncc 	%r16, 0x0683, %r6
	.word 0x942c0011  ! 730: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x8cbc0011  ! 730: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0xd5040011  ! 731: LDF_R	ld	[%r16, %r17], %f10
!Illinst store
	.word 0xf4340011  ! 733: STH_R	sth	%r26, [%r16 + %r17]
	.word 0xb32c0011  ! 735: SLL_R	sll 	%r16, %r17, %r25
	.word 0x82140011  ! 735: OR_R	or 	%r16, %r17, %r1
	.word 0x94bc0011  ! 735: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0xb72c3001  ! 735: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0x9ebc0011  ! 735: XNORcc_R	xnorcc 	%r16, %r17, %r15
	.word 0xb80c2ece  ! 735: AND_I	and 	%r16, 0x0ece, %r28
	.word 0xb0142e13  ! 735: OR_I	or 	%r16, 0x0e13, %r24
	.word 0x94040011  ! 735: ADD_R	add 	%r16, %r17, %r10
	.word 0xc85c0011  ! 736: LDX_R	ldx	[%r16 + %r17], %r4
	.word 0xce540011  ! 738: LDSH_R	ldsh	[%r16 + %r17], %r7
	.word 0x8f340011  ! 740: SRL_R	srl 	%r16, %r17, %r7
	.word 0x882c2dbf  ! 740: ANDN_I	andn 	%r16, 0x0dbf, %r4
	.word 0x9a842c53  ! 740: ADDcc_I	addcc 	%r16, 0x0c53, %r13
	.word 0x9a142345  ! 740: OR_I	or 	%r16, 0x0345, %r13
	.word 0xa6b421ad  ! 740: ORNcc_I	orncc 	%r16, 0x01ad, %r19
	.word 0xdcc41011  ! 741: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r14
thr2_irf_ce_60:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_60), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	wr      %r0, 0x1, %asr26
	.word 0xa6140011  ! 745: OR_R	or 	%r16, %r17, %r19
	.word 0x917c2401  ! 745: MOVR_I	move	%r16, 0xfffffe54, %r8
	.word 0x9e940011  ! 745: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x8e04214a  ! 745: ADD_I	add 	%r16, 0x014a, %r7
	.word 0x8c040011  ! 745: ADD_R	add 	%r16, %r17, %r6
	.word 0xed841011  ! 746: LDFA_R	lda	[%r16, %r17], %f22
thr2_irf_ce_61:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_61), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xf71c0011  ! 748: LDDF_R	ldd	[%r16, %r17], %f27
	.word 0x8e842738  ! 750: ADDcc_I	addcc 	%r16, 0x0738, %r7
	.word 0xb4c40011  ! 750: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0xac440011  ! 750: ADDC_R	addc 	%r16, %r17, %r22
	.word 0xaa940011  ! 750: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x84340011  ! 750: ORN_R	orn 	%r16, %r17, %r2
	.word 0x922c24bc  ! 750: ANDN_I	andn 	%r16, 0x04bc, %r9
	.word 0x94b422d7  ! 750: ORNcc_I	orncc 	%r16, 0x02d7, %r10
	.word 0xd0d41011  ! 751: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r8
	.word 0xc5140011  ! 753: LDQF_R	-	[%r16, %r17], %f2
	.word 0x94840011  ! 755: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0x882c252c  ! 755: ANDN_I	andn 	%r16, 0x052c, %r4
	.word 0xb0040011  ! 755: ADD_R	add 	%r16, %r17, %r24
	.word 0x98bc2de2  ! 755: XNORcc_I	xnorcc 	%r16, 0x0de2, %r12
	.word 0xb53c1011  ! 755: SRAX_R	srax	%r16, %r17, %r26
	.word 0x8a9c2aec  ! 755: XORcc_I	xorcc 	%r16, 0x0aec, %r5
	.word 0x96ac2a92  ! 755: ANDNcc_I	andncc 	%r16, 0x0a92, %r11
	.word 0xb4140011  ! 755: OR_R	or 	%r16, %r17, %r26
thr2_dc_err_67:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_67), 16, 16),1,DC_DATA,54)
	.word 0xc8d42145  ! 757: LDSHA_I	ldsha	[%r16, + 0x0145] %asi, %r4
	.word 0xdac420d9  ! 759: LDSWA_I	ldswa	[%r16, + 0x00d9] %asi, %r13
	.word 0x86440011  ! 761: ADDC_R	addc 	%r16, %r17, %r3
	.word 0xb2842893  ! 761: ADDcc_I	addcc 	%r16, 0x0893, %r25
	.word 0x929c247b  ! 761: XORcc_I	xorcc 	%r16, 0x047b, %r9
	.word 0xb12c2001  ! 761: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0x973c0011  ! 761: SRA_R	sra 	%r16, %r17, %r11
	.word 0xf25c0011  ! 762: LDX_R	ldx	[%r16 + %r17], %r25
	.word 0xca9c1011  ! 764: LDDA_R	ldda	[%r16, %r17] 0x80, %r5
	.word 0x8f340011  ! 766: SRL_R	srl 	%r16, %r17, %r7
	.word 0xb834287e  ! 766: ORN_I	orn 	%r16, 0x087e, %r28
	.word 0xbb2c1011  ! 766: SLLX_R	sllx	%r16, %r17, %r29
	.word 0xac4425b1  ! 766: ADDC_I	addc 	%r16, 0x05b1, %r22
	.word 0xb8c40011  ! 766: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0xa8042127  ! 766: ADD_I	add 	%r16, 0x0127, %r20
	.word 0xa8942f5b  ! 766: ORcc_I	orcc 	%r16, 0x0f5b, %r20
thr2_dc_err_68:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_68), 16, 16),1,DC_DATA,55)
	.word 0xdd841000  ! 768: LDFA_R	lda	[%r16, %r0], %f14
thr2_irf_ce_62:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_62), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xcc742908  ! 772: STX_I	stx	%r6, [%r16 + 0x0908]
	.word 0x872c3001  ! 774: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x9cac0011  ! 774: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0x8a840011  ! 774: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x842c0011  ! 774: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x862c0011  ! 774: ANDN_R	andn 	%r16, %r17, %r3
	.word 0xb92c3001  ! 774: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0x84bc2774  ! 774: XNORcc_I	xnorcc 	%r16, 0x0774, %r2
	.word 0x941c2680  ! 774: XOR_I	xor 	%r16, 0x0680, %r10
thr2_dc_err_69:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_69), 16, 16),1,DC_DATA,63)
	.word 0xc69c2d6e  ! 776: LDDA_I	ldda	[%r16, + 0x0d6e] %asi, %r3
	.word 0xe8142e6c  ! 778: LDUH_I	lduh	[%r16 + 0x0e6c], %r20
	.word 0x96ac0011  ! 780: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x82c42f94  ! 780: ADDCcc_I	addccc 	%r16, 0x0f94, %r1
	.word 0x909c2ffc  ! 780: XORcc_I	xorcc 	%r16, 0x0ffc, %r8
	.word 0x9a9427ba  ! 780: ORcc_I	orcc 	%r16, 0x07ba, %r13
	.word 0x8e040011  ! 780: ADD_R	add 	%r16, %r17, %r7
	.word 0xb83c2b95  ! 780: XNOR_I	xnor 	%r16, 0x0b95, %r28
	.word 0xd68c26dd  ! 781: LDUBA_I	lduba	[%r16, + 0x06dd] %asi, %r11
thr2_irf_ce_63:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_63), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xd3941011  ! 783: LDQFA_R	-	[%r16, %r17], %f9
	.word 0xb6840011  ! 785: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0x8c2c0011  ! 785: ANDN_R	andn 	%r16, %r17, %r6
	.word 0xbabc0011  ! 785: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0x909c0011  ! 785: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0x9d340011  ! 785: SRL_R	srl 	%r16, %r17, %r14
	.word 0x929c0011  ! 785: XORcc_R	xorcc 	%r16, %r17, %r9
	.word 0xcadc1011  ! 786: LDXA_R	ldxa	[%r16, %r17] 0x80, %r5
thr2_irf_ce_64:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_64), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xdd040011  ! 788: LDF_R	ld	[%r16, %r17], %f14
	.word 0x85341011  ! 790: SRLX_R	srlx	%r16, %r17, %r2
	.word 0x881c0011  ! 790: XOR_R	xor 	%r16, %r17, %r4
	.word 0xb4c40011  ! 790: ADDCcc_R	addccc 	%r16, %r17, %r26
	.word 0xb6bc0011  ! 790: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0xab2c1011  ! 790: SLLX_R	sllx	%r16, %r17, %r21
	.word 0x8cc40011  ! 790: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x98bc0011  ! 790: XNORcc_R	xnorcc 	%r16, %r17, %r12
thr2_dc_err_70:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_70), 16, 16),1,DC_DATA,48)
	.word 0xe79c1000  ! 792: LDDFA_R	ldda	[%r16, %r0], %f19
thr2_irf_ce_65:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_65), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9e0c0011  ! 796: AND_R	and 	%r16, %r17, %r15
	.word 0x953c2001  ! 796: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x82940011  ! 796: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x84142719  ! 796: OR_I	or 	%r16, 0x0719, %r2
	.word 0x8f7c0411  ! 796: MOVR_R	move	%r16, %r17, %r7
	.word 0x90b42b1f  ! 796: ORNcc_I	orncc 	%r16, 0x0b1f, %r8
	.word 0x9c8c2c5d  ! 796: ANDcc_I	andcc 	%r16, 0x0c5d, %r14
	.word 0xb01c28ce  ! 796: XOR_I	xor 	%r16, 0x08ce, %r24
	.word 0xc8841011  ! 797: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r4
thr2_irf_ce_66:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_66), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xf1140011  ! 799: LDQF_R	-	[%r16, %r17], %f24
	.word 0xa73c0011  ! 801: SRA_R	sra 	%r16, %r17, %r19
	.word 0xb2ac0011  ! 801: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0x96b40011  ! 801: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0x8c840011  ! 801: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xb21c0011  ! 801: XOR_R	xor 	%r16, %r17, %r25
	.word 0x8e2c0011  ! 801: ANDN_R	andn 	%r16, %r17, %r7
thr2_dc_err_71:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_71), 16, 16),1,DC_DATA,17)
	.word 0xf25c0000  ! 803: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xc8941011  ! 805: LDUHA_R	lduha	[%r16, %r17] 0x80, %r4
	.word 0x8f3c2001  ! 807: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x9abc0011  ! 807: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x9e8c0011  ! 807: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0xbac42429  ! 807: ADDCcc_I	addccc 	%r16, 0x0429, %r29
	.word 0xa8bc20b5  ! 807: XNORcc_I	xnorcc 	%r16, 0x00b5, %r20
	.word 0x98bc268c  ! 807: XNORcc_I	xnorcc 	%r16, 0x068c, %r12
	.word 0xed1c2e6d  ! 808: LDDF_I	ldd	[%r16, 0x0e6d], %f22
thr2_irf_ce_67:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_67), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xf1841011  ! 810: LDFA_R	lda	[%r16, %r17], %f24
	.word 0x96840011  ! 812: ADDcc_R	addcc 	%r16, %r17, %r11
	.word 0xa61c0011  ! 812: XOR_R	xor 	%r16, %r17, %r19
	.word 0x84840011  ! 812: ADDcc_R	addcc 	%r16, %r17, %r2
	.word 0x8c2c24bf  ! 812: ANDN_I	andn 	%r16, 0x04bf, %r6
	.word 0x9f643801  ! 812: MOVcc_I	<illegal instruction>
	.word 0xf88c1011  ! 813: LDUBA_R	lduba	[%r16, %r17] 0x80, %r28
	.word 0xdc7c2a82  ! 815: SWAP_I	swap	%r14, [%r16 + 0x0a82]
	.word 0xa72c0011  ! 817: SLL_R	sll 	%r16, %r17, %r19
	.word 0x832c3001  ! 817: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0xaf2c0011  ! 817: SLL_R	sll 	%r16, %r17, %r23
	.word 0x873c1011  ! 817: SRAX_R	srax	%r16, %r17, %r3
	.word 0x8a040011  ! 817: ADD_R	add 	%r16, %r17, %r5
	.word 0xb29c2417  ! 817: XORcc_I	xorcc 	%r16, 0x0417, %r25
	.word 0x843427e0  ! 817: ORN_I	orn 	%r16, 0x07e0, %r2
	.word 0xb5342001  ! 817: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0xc2c42b13  ! 818: LDSWA_I	ldswa	[%r16, + 0x0b13] %asi, %r1
	.word 0xc9941011  ! 820: LDQFA_R	-	[%r16, %r17], %f4
	.word 0x9d2c1011  ! 822: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x91342001  ! 822: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0x90c40011  ! 822: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x90940011  ! 822: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0xba9c0011  ! 822: XORcc_R	xorcc 	%r16, %r17, %r29
thr2_dc_err_72:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_72), 16, 16),1,DC_DATA,57)
	.word 0xdb04247e  ! 824: LDF_I	ld	[%r16, 0x047e], %f13
	.word 0xc36c2c94  ! 826: PREFETCH_I	prefetch	[%r16 + 0x0c94], #one_read
	.word 0x92b40011  ! 828: ORNcc_R	orncc 	%r16, %r17, %r9
	.word 0x968c2fc9  ! 828: ANDcc_I	andcc 	%r16, 0x0fc9, %r11
	.word 0x98c42c0a  ! 828: ADDCcc_I	addccc 	%r16, 0x0c0a, %r12
	.word 0x9ab42b42  ! 828: ORNcc_I	orncc 	%r16, 0x0b42, %r13
	.word 0x93643801  ! 828: MOVcc_I	<illegal instruction>
thr2_dc_err_73:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_73), 16, 16),1,DC_DATA,8)
	.word 0xf79c1000  ! 830: LDDFA_R	ldda	[%r16, %r0], %f27
thr2_irf_ce_68:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_68), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xcedc1011  ! 832: LDXA_R	ldxa	[%r16, %r17] 0x80, %r7
	.word 0x86b42d99  ! 834: ORNcc_I	orncc 	%r16, 0x0d99, %r3
	.word 0x9e0c0011  ! 834: AND_R	and 	%r16, %r17, %r15
	.word 0x8e842641  ! 834: ADDcc_I	addcc 	%r16, 0x0641, %r7
	.word 0x98140011  ! 834: OR_R	or 	%r16, %r17, %r12
	.word 0x96442db4  ! 834: ADDC_I	addc 	%r16, 0x0db4, %r11
	.word 0x8ab42525  ! 834: ORNcc_I	orncc 	%r16, 0x0525, %r5
	.word 0x8d641811  ! 834: MOVcc_R	<illegal instruction>
	.word 0x8b7c2401  ! 834: MOVR_I	move	%r16, 0xfffffe54, %r5
	.word 0xd3040011  ! 835: LDF_R	ld	[%r16, %r17], %f9
	.word 0xd0d41011  ! 837: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r8
	.word 0xa63c2062  ! 839: XNOR_I	xnor 	%r16, 0x0062, %r19
	.word 0x921c291b  ! 839: XOR_I	xor 	%r16, 0x091b, %r9
	.word 0x849c0011  ! 839: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x9b343001  ! 839: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0xb81c0011  ! 839: XOR_R	xor 	%r16, %r17, %r28
	.word 0x960c2058  ! 839: AND_I	and 	%r16, 0x0058, %r11
	.word 0x8c0c209a  ! 839: AND_I	and 	%r16, 0x009a, %r6
	.word 0xc3040011  ! 840: LDF_R	ld	[%r16, %r17], %f1
thr2_irf_ce_69:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_69), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xecc41011  ! 842: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r22
	.word 0x84340011  ! 844: ORN_R	orn 	%r16, %r17, %r2
	.word 0x88840011  ! 844: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x933c2001  ! 844: SRA_I	sra 	%r16, 0x0001, %r9
	.word 0x8eac2695  ! 844: ANDNcc_I	andncc 	%r16, 0x0695, %r7
	.word 0xa614220d  ! 844: OR_I	or 	%r16, 0x020d, %r19
	.word 0x8b643801  ! 844: MOVcc_I	<illegal instruction>
	.word 0xa88c0011  ! 844: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0xec4c0011  ! 845: LDSB_R	ldsb	[%r16 + %r17], %r22
thr2_irf_ce_70:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_70), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xdf9c1011  ! 847: LDDFA_R	ldda	[%r16, %r17], %f15
	.word 0x82340011  ! 849: ORN_R	orn 	%r16, %r17, %r1
	.word 0x9f2c0011  ! 849: SLL_R	sll 	%r16, %r17, %r15
	.word 0xb6ac2d22  ! 849: ANDNcc_I	andncc 	%r16, 0x0d22, %r27
	.word 0x9c9c0011  ! 849: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x8c8c0011  ! 849: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0x8f3c1011  ! 849: SRAX_R	srax	%r16, %r17, %r7
	.word 0xc3142a14  ! 850: LDQF_I	-	[%r16, 0x0a14], %f1
thr2_irf_ce_71:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_71), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xf99c1011  ! 852: LDDFA_R	ldda	[%r16, %r17], %f28
	.word 0xb6ac2efb  ! 854: ANDNcc_I	andncc 	%r16, 0x0efb, %r27
	.word 0x94bc0011  ! 854: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x880428cc  ! 854: ADD_I	add 	%r16, 0x08cc, %r4
	.word 0xa61c0011  ! 854: XOR_R	xor 	%r16, %r17, %r19
	.word 0x822c0011  ! 854: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x961420f4  ! 854: OR_I	or 	%r16, 0x00f4, %r11
	.word 0x882c0011  ! 854: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x99643801  ! 854: MOVcc_I	<illegal instruction>
	.word 0xec540011  ! 855: LDSH_R	ldsh	[%r16 + %r17], %r22
	.word 0xf4c41011  ! 857: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r26
	.word 0x9404247e  ! 859: ADD_I	add 	%r16, 0x047e, %r10
	.word 0x8e3c2fc2  ! 859: XNOR_I	xnor 	%r16, 0x0fc2, %r7
	.word 0x981c0011  ! 859: XOR_R	xor 	%r16, %r17, %r12
	.word 0xb5341011  ! 859: SRLX_R	srlx	%r16, %r17, %r26
	.word 0x9a340011  ! 859: ORN_R	orn 	%r16, %r17, %r13
	.word 0x8c9c0011  ! 859: XORcc_R	xorcc 	%r16, %r17, %r6
thr2_dc_err_74:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_74), 16, 16),1,DC_DATA,70)
	.word 0xc39c1000  ! 861: LDDFA_R	ldda	[%r16, %r0], %f1
	.word 0xf01c20e9  ! 863: LDD_I	ldd	[%r16 + 0x00e9], %r24
	.word 0x920c0011  ! 865: AND_R	and 	%r16, %r17, %r9
	.word 0x98140011  ! 865: OR_R	or 	%r16, %r17, %r12
	.word 0x8e440011  ! 865: ADDC_R	addc 	%r16, %r17, %r7
	.word 0xa97c0411  ! 865: MOVR_R	move	%r16, %r17, %r20
	.word 0xa82c0011  ! 865: ANDN_R	andn 	%r16, %r17, %r20
	.word 0x840c0011  ! 865: AND_R	and 	%r16, %r17, %r2
	.word 0xce142fa1  ! 866: LDUH_I	lduh	[%r16 + 0x0fa1], %r7
thr2_irf_ce_72:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_72), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xe8540011  ! 868: LDSH_R	ldsh	[%r16 + %r17], %r20
	.word 0xb40c0011  ! 870: AND_R	and 	%r16, %r17, %r26
	.word 0xba9c2276  ! 870: XORcc_I	xorcc 	%r16, 0x0276, %r29
	.word 0x9644287b  ! 870: ADDC_I	addc 	%r16, 0x087b, %r11
	.word 0x92942216  ! 870: ORcc_I	orcc 	%r16, 0x0216, %r9
	.word 0xa7342001  ! 870: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0x922c0011  ! 870: ANDN_R	andn 	%r16, %r17, %r9
thr2_dc_err_75:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_75), 16, 16),1,DC_DATA,47)
	.word 0xcedc1000  ! 872: LDXA_R	ldxa	[%r16, %r0] 0x80, %r7
	.word 0xf9142418  ! 874: LDQF_I	-	[%r16, 0x0418], %f28
	.word 0xba9c0011  ! 876: XORcc_R	xorcc 	%r16, %r17, %r29
	.word 0x973c2001  ! 876: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0xae940011  ! 876: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0x9c340011  ! 876: ORN_R	orn 	%r16, %r17, %r14
	.word 0x9804226d  ! 876: ADD_I	add 	%r16, 0x026d, %r12
thr2_dc_err_76:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_76), 16, 16),1,DC_DATA,18)
	.word 0xda1c2b78  ! 878: LDD_I	ldd	[%r16 + 0x0b78], %r13
	.word 0xd0cc1011  ! 880: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r8
	.word 0xac9c2d51  ! 882: XORcc_I	xorcc 	%r16, 0x0d51, %r22
	.word 0xb22c24b9  ! 882: ANDN_I	andn 	%r16, 0x04b9, %r25
	.word 0x95641811  ! 882: MOVcc_R	<illegal instruction>
	.word 0x84040011  ! 882: ADD_R	add 	%r16, %r17, %r2
	.word 0x9b641811  ! 882: MOVcc_R	<illegal instruction>
	.word 0xaebc2465  ! 882: XNORcc_I	xnorcc 	%r16, 0x0465, %r23
	.word 0xb9343001  ! 882: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0xb434243a  ! 882: ORN_I	orn 	%r16, 0x043a, %r26
	.word 0xfb941011  ! 883: LDQFA_R	-	[%r16, %r17], %f29
	.word 0x8143e005  ! 885: MEMBAR	membar	#LoadLoad | #LoadStore 
	.word 0xae3c25ab  ! 887: XNOR_I	xnor 	%r16, 0x05ab, %r23
	.word 0x94440011  ! 887: ADDC_R	addc 	%r16, %r17, %r10
	.word 0xacbc281d  ! 887: XNORcc_I	xnorcc 	%r16, 0x081d, %r22
	.word 0xaa440011  ! 887: ADDC_R	addc 	%r16, %r17, %r21
	.word 0x9a2c0011  ! 887: ANDN_R	andn 	%r16, %r17, %r13
	.word 0xf69c25a1  ! 888: LDDA_I	ldda	[%r16, + 0x05a1] %asi, %r27
thr2_irf_ce_73:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_73), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xea4c2ecd  ! 890: LDSB_I	ldsb	[%r16 + 0x0ecd], %r21
	.word 0x82ac0011  ! 892: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x96940011  ! 892: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0x872c0011  ! 892: SLL_R	sll 	%r16, %r17, %r3
	.word 0x823c29bd  ! 892: XNOR_I	xnor 	%r16, 0x09bd, %r1
	.word 0x9f340011  ! 892: SRL_R	srl 	%r16, %r17, %r15
	.word 0x84ac0011  ! 892: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0xb32c1011  ! 892: SLLX_R	sllx	%r16, %r17, %r25
	.word 0xcedc1011  ! 893: LDXA_R	ldxa	[%r16, %r17] 0x80, %r7
	.word 0xca8c1011  ! 895: LDUBA_R	lduba	[%r16, %r17] 0x80, %r5
	.word 0x86942027  ! 897: ORcc_I	orcc 	%r16, 0x0027, %r3
	.word 0xb83c0011  ! 897: XNOR_R	xnor 	%r16, %r17, %r28
	.word 0xba8c0011  ! 897: ANDcc_R	andcc 	%r16, %r17, %r29
	.word 0x8a042ad5  ! 897: ADD_I	add 	%r16, 0x0ad5, %r5
	.word 0xba142b91  ! 897: OR_I	or 	%r16, 0x0b91, %r29
	.word 0x8d3c0011  ! 897: SRA_R	sra 	%r16, %r17, %r6
	.word 0x96b40011  ! 897: ORNcc_R	orncc 	%r16, %r17, %r11
thr2_dc_err_77:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_77), 16, 16),1,DC_DATA,12)
	.word 0xcb142626  ! 899: LDQF_I	-	[%r16, 0x0626], %f5
thr2_irf_ce_74:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_74), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xf3841011  ! 901: LDFA_R	lda	[%r16, %r17], %f25
	.word 0x9a440011  ! 903: ADDC_R	addc 	%r16, %r17, %r13
	.word 0xb6340011  ! 903: ORN_R	orn 	%r16, %r17, %r27
	.word 0xb92c1011  ! 903: SLLX_R	sllx	%r16, %r17, %r28
	.word 0x9ac42535  ! 903: ADDCcc_I	addccc 	%r16, 0x0535, %r13
	.word 0xaec4218d  ! 903: ADDCcc_I	addccc 	%r16, 0x018d, %r23
	.word 0x82840011  ! 903: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0xec4c2b21  ! 904: LDSB_I	ldsb	[%r16 + 0x0b21], %r22
thr2_irf_ce_75:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_75), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xc90423e0  ! 906: LDF_I	ld	[%r16, 0x03e0], %f4
	.word 0x92bc21ee  ! 908: XNORcc_I	xnorcc 	%r16, 0x01ee, %r9
	.word 0xb6440011  ! 908: ADDC_R	addc 	%r16, %r17, %r27
	.word 0x9b2c0011  ! 908: SLL_R	sll 	%r16, %r17, %r13
	.word 0xae942f08  ! 908: ORcc_I	orcc 	%r16, 0x0f08, %r23
	.word 0xab342001  ! 908: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0xbb2c2001  ! 908: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0xba3c0011  ! 908: XNOR_R	xnor 	%r16, %r17, %r29
thr2_dc_err_78:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_78), 16, 16),1,DC_DATA,0)
	.word 0xeb1c22d3  ! 910: LDDF_I	ldd	[%r16, 0x02d3], %f21
thr2_irf_ce_76:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_76), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xf6c41011  ! 912: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r27
	.word 0xae042f99  ! 914: ADD_I	add 	%r16, 0x0f99, %r23
	.word 0xa9643801  ! 914: MOVcc_I	<illegal instruction>
	.word 0x88340011  ! 914: ORN_R	orn 	%r16, %r17, %r4
	.word 0xb81c0011  ! 914: XOR_R	xor 	%r16, %r17, %r28
	.word 0x93341011  ! 914: SRLX_R	srlx	%r16, %r17, %r9
	.word 0xa62c0011  ! 914: ANDN_R	andn 	%r16, %r17, %r19
	.word 0xb32c3001  ! 914: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0x9c940011  ! 914: ORcc_R	orcc 	%r16, %r17, %r14
thr2_dc_err_79:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_79), 16, 16),1,DC_DATA,50)
	.word 0xdc042569  ! 916: LDUW_I	lduw	[%r16 + 0x0569], %r14
	.word 0xe71c20fc  ! 918: LDDF_I	ldd	[%r16, 0x00fc], %f19
	.word 0x8a2c0011  ! 920: ANDN_R	andn 	%r16, %r17, %r5
	.word 0x98840011  ! 920: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0xb1341011  ! 920: SRLX_R	srlx	%r16, %r17, %r24
	.word 0x96440011  ! 920: ADDC_R	addc 	%r16, %r17, %r11
	.word 0xb644259f  ! 920: ADDC_I	addc 	%r16, 0x059f, %r27
	.word 0xad3c0011  ! 920: SRA_R	sra 	%r16, %r17, %r22
	.word 0xaa140011  ! 920: OR_R	or 	%r16, %r17, %r21
thr2_dc_err_80:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_80), 16, 16),1,DC_DATA,12)
	.word 0xdb841000  ! 922: LDFA_R	lda	[%r16, %r0], %f13
	.word 0xd1140011  ! 924: LDQF_R	-	[%r16, %r17], %f8
	.word 0xb01c217a  ! 926: XOR_I	xor 	%r16, 0x017a, %r24
	.word 0x833c1011  ! 926: SRAX_R	srax	%r16, %r17, %r1
	.word 0x9e040011  ! 926: ADD_R	add 	%r16, %r17, %r15
	.word 0x9e3c2c15  ! 926: XNOR_I	xnor 	%r16, 0x0c15, %r15
	.word 0x9f2c0011  ! 926: SLL_R	sll 	%r16, %r17, %r15
thr2_dc_err_81:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_81), 16, 16),1,DC_DATA,27)
	.word 0xc49424b0  ! 928: LDUHA_I	lduha	[%r16, + 0x04b0] %asi, %r2
	.word 0xf7841011  ! 930: LDFA_R	lda	[%r16, %r17], %f27
	.word 0x8c3c2b59  ! 932: XNOR_I	xnor 	%r16, 0x0b59, %r6
	.word 0x8b3c1011  ! 932: SRAX_R	srax	%r16, %r17, %r5
	.word 0x88440011  ! 932: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x84ac0011  ! 932: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0xab341011  ! 932: SRLX_R	srlx	%r16, %r17, %r21
	.word 0x988c203f  ! 932: ANDcc_I	andcc 	%r16, 0x003f, %r12
	.word 0xb4442903  ! 932: ADDC_I	addc 	%r16, 0x0903, %r26
	.word 0x9aac2000  ! 932: ANDNcc_I	andncc 	%r16, 0x0000, %r13
thr2_dc_err_82:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_82), 16, 16),1,DC_DATA,18)
	.word 0xda8c1000  ! 934: LDUBA_R	lduba	[%r16, %r0] 0x80, %r13
thr2_irf_ce_77:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_77), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
        wr  %g0, 0x80, %asi
	.word 0xab7c0411  ! 938: MOVR_R	move	%r16, %r17, %r21
	.word 0x8f643801  ! 938: MOVcc_I	<illegal instruction>
	.word 0x8b641811  ! 938: MOVcc_R	<illegal instruction>
	.word 0xa8bc0011  ! 938: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0x917c2401  ! 938: MOVR_I	move	%r16, 0xfffffe54, %r8
	.word 0xac0c2790  ! 938: AND_I	and 	%r16, 0x0790, %r22
	.word 0xdb1c0011  ! 939: LDDF_R	ldd	[%r16, %r17], %f13
!Illinst store
	.word 0xea340011  ! 941: STH_R	sth	%r21, [%r16 + %r17]
	.word 0x9e0c2317  ! 943: AND_I	and 	%r16, 0x0317, %r15
	.word 0x857c2401  ! 943: MOVR_I	move	%r16, 0xfffffe54, %r2
	.word 0x968c21c5  ! 943: ANDcc_I	andcc 	%r16, 0x01c5, %r11
	.word 0xa6042353  ! 943: ADD_I	add 	%r16, 0x0353, %r19
	.word 0x848c2287  ! 943: ANDcc_I	andcc 	%r16, 0x0287, %r2
	.word 0xab340011  ! 943: SRL_R	srl 	%r16, %r17, %r21
	.word 0xaa042ef6  ! 943: ADD_I	add 	%r16, 0x0ef6, %r21
thr2_dc_err_83:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_83), 16, 16),1,DC_DATA,26)
	.word 0xc7841000  ! 945: LDFA_R	lda	[%r16, %r0], %f3
thr2_irf_ce_78:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_78), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xd1841011  ! 947: LDFA_R	lda	[%r16, %r17], %f8
	.word 0x897c0411  ! 949: MOVR_R	move	%r16, %r17, %r4
	.word 0x829c0011  ! 949: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x9a040011  ! 949: ADD_R	add 	%r16, %r17, %r13
	.word 0x9d2c3001  ! 949: SLLX_I	sllx	%r16, 0x0001, %r14
	.word 0xac842122  ! 949: ADDcc_I	addcc 	%r16, 0x0122, %r22
	.word 0x953c0011  ! 949: SRA_R	sra 	%r16, %r17, %r10
	.word 0x952c1011  ! 949: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x8d341011  ! 949: SRLX_R	srlx	%r16, %r17, %r6
thr2_dc_err_84:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_84), 16, 16),1,DC_DATA,48)
	.word 0xd0142d59  ! 951: LDUH_I	lduh	[%r16 + 0x0d59], %r8
	.word 0xd51c21e5  ! 953: LDDF_I	ldd	[%r16, 0x01e5], %f10
	.word 0xb6c40011  ! 955: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x822c2c0f  ! 955: ANDN_I	andn 	%r16, 0x0c0f, %r1
	.word 0x88440011  ! 955: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x932c2001  ! 955: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0xb77c0411  ! 955: MOVR_R	move	%r16, %r17, %r27
	.word 0x9a2c0011  ! 955: ANDN_R	andn 	%r16, %r17, %r13
	.word 0xc40c29db  ! 956: LDUB_I	ldub	[%r16 + 0x09db], %r2
	.word 0xd59c1011  ! 958: LDDFA_R	ldda	[%r16, %r17], %f10
	.word 0x963c25a1  ! 960: XNOR_I	xnor 	%r16, 0x05a1, %r11
	.word 0x9b342001  ! 960: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x972c1011  ! 960: SLLX_R	sllx	%r16, %r17, %r11
	.word 0xb7341011  ! 960: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x821c2c97  ! 960: XOR_I	xor 	%r16, 0x0c97, %r1
	.word 0x849c2d84  ! 960: XORcc_I	xorcc 	%r16, 0x0d84, %r2
	.word 0x83641811  ! 960: MOVcc_R	<illegal instruction>
thr2_dc_err_85:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_85), 16, 16),1,DC_DATA,1)
	.word 0xdb1425d4  ! 962: LDQF_I	-	[%r16, 0x05d4], %f13
	.word 0xc604227b  ! 964: LDUW_I	lduw	[%r16 + 0x027b], %r3
	.word 0xaa0421a9  ! 966: ADD_I	add 	%r16, 0x01a9, %r21
	.word 0x84ac2a1c  ! 966: ANDNcc_I	andncc 	%r16, 0x0a1c, %r2
	.word 0x95342001  ! 966: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x921c21ff  ! 966: XOR_I	xor 	%r16, 0x01ff, %r9
	.word 0x99641811  ! 966: MOVcc_R	<illegal instruction>
	.word 0xaa9c2994  ! 966: XORcc_I	xorcc 	%r16, 0x0994, %r21
	.word 0x89641811  ! 966: MOVcc_R	<illegal instruction>
	.word 0x96940011  ! 966: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0xd2c41011  ! 967: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r9
	.word 0xcccc1011  ! 969: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r6
	.word 0xb49c0011  ! 971: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xa8c420c1  ! 971: ADDCcc_I	addccc 	%r16, 0x00c1, %r20
	.word 0xb5340011  ! 971: SRL_R	srl 	%r16, %r17, %r26
	.word 0x9f340011  ! 971: SRL_R	srl 	%r16, %r17, %r15
	.word 0x892c1011  ! 971: SLLX_R	sllx	%r16, %r17, %r4
	.word 0x881428fe  ! 971: OR_I	or 	%r16, 0x08fe, %r4
	.word 0x997c2401  ! 971: MOVR_I	move	%r16, 0xfffffe54, %r12
	.word 0xb2042447  ! 971: ADD_I	add 	%r16, 0x0447, %r25
thr2_dc_err_86:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_86), 16, 16),1,DC_DATA,65)
	.word 0xd05c0000  ! 973: LDX_R	ldx	[%r16 + %r0], %r8
	.word 0xd6941011  ! 975: LDUHA_R	lduha	[%r16, %r17] 0x80, %r11
	.word 0x92ac0011  ! 977: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x848427f7  ! 977: ADDcc_I	addcc 	%r16, 0x07f7, %r2
	.word 0x84442be4  ! 977: ADDC_I	addc 	%r16, 0x0be4, %r2
	.word 0x9b343001  ! 977: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0x9eac0011  ! 977: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xb49c2c66  ! 977: XORcc_I	xorcc 	%r16, 0x0c66, %r26
	.word 0x9c8c2673  ! 977: ANDcc_I	andcc 	%r16, 0x0673, %r14
	.word 0xd8540011  ! 978: LDSH_R	ldsh	[%r16 + %r17], %r12
	.word 0xce1c26d0  ! 980: LDD_I	ldd	[%r16 + 0x06d0], %r7
	.word 0x9a040011  ! 982: ADD_R	add 	%r16, %r17, %r13
	.word 0x840c0011  ! 982: AND_R	and 	%r16, %r17, %r2
	.word 0xb3641811  ! 982: MOVcc_R	<illegal instruction>
	.word 0x8c340011  ! 982: ORN_R	orn 	%r16, %r17, %r6
	.word 0x860c25b1  ! 982: AND_I	and 	%r16, 0x05b1, %r3
	.word 0x848c2bce  ! 982: ANDcc_I	andcc 	%r16, 0x0bce, %r2
thr2_dc_err_87:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_87), 16, 16),1,DC_DATA,10)
	.word 0xd61c0000  ! 984: LDD_R	ldd	[%r16 + %r0], %r11
thr2_irf_ce_79:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_79), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xd8242712  ! 988: STW_I	stw	%r12, [%r16 + 0x0712]
	.word 0x9d2c0011  ! 990: SLL_R	sll 	%r16, %r17, %r14
	.word 0x9cbc0011  ! 990: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0x94bc21fd  ! 990: XNORcc_I	xnorcc 	%r16, 0x01fd, %r10
	.word 0xba840011  ! 990: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0xba3c0011  ! 990: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0xba3c2fdb  ! 990: XNOR_I	xnor 	%r16, 0x0fdb, %r29
	.word 0x853c0011  ! 990: SRA_R	sra 	%r16, %r17, %r2
	.word 0xc6842884  ! 991: LDUWA_I	lduwa	[%r16, + 0x0884] %asi, %r3
thr2_irf_ce_80:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_80), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
thr2_resum_intr_759:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_759), 16, 16)) -> intp(2, 3, 1)
	wr      %r0, 0x0, %asr26
	.word 0xa6c4251a  ! 995: ADDCcc_I	addccc 	%r16, 0x051a, %r19
	.word 0xaa440011  ! 995: ADDC_R	addc 	%r16, %r17, %r21
	.word 0xa73c0011  ! 995: SRA_R	sra 	%r16, %r17, %r19
	.word 0x860421e6  ! 995: ADD_I	add 	%r16, 0x01e6, %r3
	.word 0x9e9c0011  ! 995: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0x912c0011  ! 995: SLL_R	sll 	%r16, %r17, %r8
	.word 0x86c40011  ! 995: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0x913c2001  ! 995: SRA_I	sra 	%r16, 0x0001, %r8
thr2_dc_err_88:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_88), 16, 16),1,DC_DATA,40)
	.word 0xf51c0000  ! 997: LDDF_R	ldd	[%r16, %r0], %f26
thr2_irf_ce_81:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_81), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
        setx  0x00000000000009c0, %g1, %r17
        setx  0xbbaead03c072e3b1, %g1, %r0
        setx  0x086fd0c1b066c47a, %g1, %r1
        setx  0x2684047d9d88df60, %g1, %r2
        setx  0x585dd1fae4718c7e, %g1, %r3
        setx  0xee17de13889081e2, %g1, %r4
        setx  0x9d824ffe8f26fe69, %g1, %r5
        setx  0x5184c55aa9b6273c, %g1, %r6
        setx  0xce1b1ae380d93fdd, %g1, %r7
        setx  0x96bc1621d01eb094, %g1, %r8
        setx  0xc9b2a6b4589e4450, %g1, %r9
        setx  0x4be937088c62cc22, %g1, %r10
        setx  0x074e4ffa31618f46, %g1, %r11
        setx  0x6f62d1aeda8997cf, %g1, %r12
        setx  0x48b0883bee262671, %g1, %r13
        setx  0x0c9fa36089510467, %g1, %r14
        setx  0x01769df669fa4862, %g1, %r15
        setx  0x64ea25a213be29c7, %g1, %r18
        setx  0x33a1a1f020d14327, %g1, %r19
        setx  0x050af7d8ff29f90a, %g1, %r20
        setx  0x1ff325652ce5eca4, %g1, %r21
        setx  0x7e98a7de6993aef3, %g1, %r22
        setx  0xbc6284def6f586c0, %g1, %r23
        setx  0x05f33e80590145c3, %g1, %r24
        setx  0xddbfdd0643225587, %g1, %r25
        setx  0xbb1011afe3d76df5, %g1, %r26
        setx  0xc796f55b838bace5, %g1, %r27
        setx  0xc995c362939a34ab, %g1, %r28
        setx  0x2d6c4b521ff41357, %g1, %r29
        setx  0x1e10288da853aa45, %g1, %r30
        setx  0xe1d42e9d751d969a, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000008d0, %g1, %r17
        setx  0xaf87ce5d4ba06366, %g1, %r0
        setx  0x5a823aa05470f64c, %g1, %r1
        setx  0x164973b6428da6d1, %g1, %r2
        setx  0x7157360969e45fe6, %g1, %r3
        setx  0x1f9c75318a125c2d, %g1, %r4
        setx  0x276136be2b736cda, %g1, %r5
        setx  0xe8b571a93b353956, %g1, %r6
        setx  0x405505240d7f73c0, %g1, %r7
        setx  0x2aea60c631e704b9, %g1, %r8
        setx  0xb95c67949f6553e9, %g1, %r9
        setx  0x46c9e5c9ccc30606, %g1, %r10
        setx  0x01f02296b628d857, %g1, %r11
        setx  0x3ef70e0b0a60f646, %g1, %r12
        setx  0x0bb92800b16d21f7, %g1, %r13
        setx  0x4e8396916183613b, %g1, %r14
        setx  0x63f13c68c3aafa36, %g1, %r15
        setx  0xe2818bbf8d2f408e, %g1, %r18
        setx  0x4d34d07b471f02bd, %g1, %r19
        setx  0x3ee36d9dda04b69f, %g1, %r20
        setx  0x40abd5925fcd227c, %g1, %r21
        setx  0x8e9a17a6444abb3b, %g1, %r22
        setx  0x4e638ea14d6d2ac5, %g1, %r23
        setx  0x9d9572707da9d2a1, %g1, %r24
        setx  0x4ae699ed39c610ae, %g1, %r25
        setx  0xd85267f3ab577c21, %g1, %r26
        setx  0x017c216b945a8578, %g1, %r27
        setx  0xcd12e97265d8e5c0, %g1, %r28
        setx  0xe09d0dd5b80b666f, %g1, %r29
        setx  0xa4e37d08659676fd, %g1, %r30
        setx  0x7df29dfa0e5c7c6a, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000330, %g1, %r17
        setx  0x8d13714e4baea218, %g1, %r0
        setx  0xeb2804443e238ab2, %g1, %r1
        setx  0x725a4bb76ad61335, %g1, %r2
        setx  0xe65262cbc8125f1c, %g1, %r3
        setx  0x7223a93b9329c233, %g1, %r4
        setx  0xc253826bf6185e5b, %g1, %r5
        setx  0x3555fd9aa7688166, %g1, %r6
        setx  0x8e01ccfb98d843da, %g1, %r7
        setx  0x4367e4aac82ebd52, %g1, %r8
        setx  0x2862c6ab446ca6e1, %g1, %r9
        setx  0x3efd883a372e508f, %g1, %r10
        setx  0x17298c697bacae69, %g1, %r11
        setx  0x17d2eb1e5fd1ea87, %g1, %r12
        setx  0xf165535dd224a5e8, %g1, %r13
        setx  0x0d789ea2be6ecd63, %g1, %r14
        setx  0xa46697717e7886a0, %g1, %r15
        setx  0x8b9a6d9e0186cb4e, %g1, %r18
        setx  0x53dfef3c2387d039, %g1, %r19
        setx  0x982161600bd02edd, %g1, %r20
        setx  0x37a519208491709c, %g1, %r21
        setx  0xeaa8eddc6d2990b7, %g1, %r22
        setx  0xcbed80867644d3ea, %g1, %r23
        setx  0xa4857e033f7c079a, %g1, %r24
        setx  0x27b7af5e61584d9a, %g1, %r25
        setx  0xc5cc1c05042d302a, %g1, %r26
        setx  0xc74623f4fa1015f9, %g1, %r27
        setx  0xeb5dcfcad9849bde, %g1, %r28
        setx  0x0ef827a379f268f7, %g1, %r29
        setx  0x06e52a5c1fb75473, %g1, %r30
        setx  0xc8ca8e526cfb8b2f, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000002c0, %g1, %r17
        setx  0x8e6f349ca2718877, %g1, %r0
        setx  0x79b4f002223b4006, %g1, %r1
        setx  0x2755eadf7a09bcc6, %g1, %r2
        setx  0x162586cf530f5a78, %g1, %r3
        setx  0xca56e691e203df3a, %g1, %r4
        setx  0x3a2a2de9aaf81c55, %g1, %r5
        setx  0xc2e96937135c1a12, %g1, %r6
        setx  0x4a36735c12c3c113, %g1, %r7
        setx  0xc50c96eb77c586c6, %g1, %r8
        setx  0x78ed64434a8b31d8, %g1, %r9
        setx  0x078310f9a381cdd3, %g1, %r10
        setx  0x99cf3e4212971ec6, %g1, %r11
        setx  0xe441a9bfc9a5cbca, %g1, %r12
        setx  0xe6e01141f5fa10c7, %g1, %r13
        setx  0x79b298f4b1d17400, %g1, %r14
        setx  0xc96297a472893185, %g1, %r15
        setx  0x02059587c3ab1830, %g1, %r18
        setx  0x492a7a69aa4d1e6f, %g1, %r19
        setx  0xa5a7655e66394415, %g1, %r20
        setx  0x32157339f5f23715, %g1, %r21
        setx  0x564383a07bb891c1, %g1, %r22
        setx  0xb1534368d86a8520, %g1, %r23
        setx  0xb9c86784f16303d1, %g1, %r24
        setx  0x4820f7aee7d3680c, %g1, %r25
        setx  0x66487702eb44e0c6, %g1, %r26
        setx  0x734441645ae12a8d, %g1, %r27
        setx  0xc797a185411e5c09, %g1, %r28
        setx  0xdde5432cb7d267f0, %g1, %r29
        setx  0xccfb3fb52183b306, %g1, %r30
        setx  0x8c3d621befa7cca2, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000003e0, %g1, %r17
        setx  0x1440d8e7d6ef7d44, %g1, %r0
        setx  0x08ebe2990ad7f605, %g1, %r1
        setx  0x3e8451f0366c535b, %g1, %r2
        setx  0x07fc4c8d653b017c, %g1, %r3
        setx  0xccd2bbf7de144019, %g1, %r4
        setx  0x7479206a20d570a4, %g1, %r5
        setx  0xfac3d74d021ecd36, %g1, %r6
        setx  0xdc21a8698bb5c852, %g1, %r7
        setx  0xf2723c14bd7b1b7d, %g1, %r8
        setx  0xb6b280e91a7a75f6, %g1, %r9
        setx  0x0acd510e2bee45c4, %g1, %r10
        setx  0x5cbcc6ebf147770c, %g1, %r11
        setx  0x581d92146ece3254, %g1, %r12
        setx  0x543b79d3815a9546, %g1, %r13
        setx  0x3917da37e454d974, %g1, %r14
        setx  0x79673750db9bf6ab, %g1, %r15
        setx  0x7b0e5fae3c41c851, %g1, %r18
        setx  0x7fd67e0617e6dca2, %g1, %r19
        setx  0x20713e52e184bdfe, %g1, %r20
        setx  0xf299654bb236c384, %g1, %r21
        setx  0xd31c159ab1619837, %g1, %r22
        setx  0x4fd7ed3e5924e48f, %g1, %r23
        setx  0x9c777df16b41b7fd, %g1, %r24
        setx  0x1b5cbb49c450144b, %g1, %r25
        setx  0x83e8013da5c510de, %g1, %r26
        setx  0x83ecf3a7bc74d18f, %g1, %r27
        setx  0xe8da79d2763f79f0, %g1, %r28
        setx  0x21324bb5af4b3baf, %g1, %r29
        setx  0x5c2d89af6066a451, %g1, %r30
        setx  0x2bcc290bf02abdbc, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000dc0, %g1, %r17
        setx  0x217ee14400f54076, %g1, %r0
        setx  0x7b42b52db580ff1e, %g1, %r1
        setx  0xbc97f477adc81e41, %g1, %r2
        setx  0x9a7418f817cfedee, %g1, %r3
        setx  0x5acb56ded6c1c9bd, %g1, %r4
        setx  0x191154e5ab377868, %g1, %r5
        setx  0xd4c7f412ba839018, %g1, %r6
        setx  0x0953dc8e21f1ec3e, %g1, %r7
        setx  0x55ec0ed80719b712, %g1, %r8
        setx  0x3bd0909c574da96b, %g1, %r9
        setx  0xe3b401fd982b6903, %g1, %r10
        setx  0xe7879e54552af885, %g1, %r11
        setx  0x33581e154f35ec07, %g1, %r12
        setx  0xf7040f28e2b5c884, %g1, %r13
        setx  0x92033b98433cd147, %g1, %r14
        setx  0x6b1ddb19b9dd9621, %g1, %r15
        setx  0x03efe25c031fc478, %g1, %r18
        setx  0x3b3bba547d0fe72d, %g1, %r19
        setx  0x6643e6fed0a7dc5c, %g1, %r20
        setx  0x917bf03965f7d324, %g1, %r21
        setx  0x7df83251a020f631, %g1, %r22
        setx  0xe7e5f8225aa21c3d, %g1, %r23
        setx  0xc0495ce1360f0046, %g1, %r24
        setx  0xf9bc248cbac1f806, %g1, %r25
        setx  0x07cc65b0ceb89281, %g1, %r26
        setx  0xa1ae873a93677aed, %g1, %r27
        setx  0xf2f8b62d9c075eba, %g1, %r28
        setx  0x0484d3bbc2529689, %g1, %r29
        setx  0xe032b7c9ae62e438, %g1, %r30
        setx  0x16121d3d093738a0, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d30, %g1, %r17
        setx  0x09632626f71dcf08, %g1, %r0
        setx  0x21a025515d6e9451, %g1, %r1
        setx  0x8530d18762807bd0, %g1, %r2
        setx  0x80a948f3ca900bde, %g1, %r3
        setx  0xd3c58e146dd8f68d, %g1, %r4
        setx  0xb691df4ac352778c, %g1, %r5
        setx  0x6a3f7a129ecbd033, %g1, %r6
        setx  0x56bf1f6fa3661d03, %g1, %r7
        setx  0xe3bfeb2605f5a9b0, %g1, %r8
        setx  0x33b39808b3d92a49, %g1, %r9
        setx  0xb77e7cc78d8866d1, %g1, %r10
        setx  0x3bcc2013fc0c40b3, %g1, %r11
        setx  0x4956061acf3bd606, %g1, %r12
        setx  0x0faf6d943193561f, %g1, %r13
        setx  0x220981898f0e37c5, %g1, %r14
        setx  0x789a30fb6e36f4dc, %g1, %r15
        setx  0xb1a7691a1fae49b1, %g1, %r18
        setx  0x0b6fc5f1f642f70a, %g1, %r19
        setx  0x2ac6596b03308223, %g1, %r20
        setx  0xd3d8922e2d10a3bb, %g1, %r21
        setx  0x969d77c401eb9167, %g1, %r22
        setx  0x66f9b81109d1cad6, %g1, %r23
        setx  0xa81ec659c11b5b25, %g1, %r24
        setx  0xe8464ad709efb7d4, %g1, %r25
        setx  0x3305d0f2e6c870d5, %g1, %r26
        setx  0x951ff051cbee423f, %g1, %r27
        setx  0x5c3230b4932f9305, %g1, %r28
        setx  0x677c3ebcb4f16d95, %g1, %r29
        setx  0xe457c0ff931ed9fa, %g1, %r30
        setx  0x165c054bf948e91b, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000490, %g1, %r17
        setx  0x7d19d0ff694474c9, %g1, %r0
        setx  0x614db1fc100eec21, %g1, %r1
        setx  0x413c9f9b078e3701, %g1, %r2
        setx  0x82671cb857f07327, %g1, %r3
        setx  0x422b3871de9e82f0, %g1, %r4
        setx  0x24bab71806f71709, %g1, %r5
        setx  0x3db37c33bc0c3abe, %g1, %r6
        setx  0xa3213877af516939, %g1, %r7
        setx  0x1bd6f105110550c3, %g1, %r8
        setx  0x065228fdccca821f, %g1, %r9
        setx  0x39901892935da4dc, %g1, %r10
        setx  0xb65f5e5d4b0e67cf, %g1, %r11
        setx  0x0ec372dc3bfc751e, %g1, %r12
        setx  0x90f6e661aedf97bd, %g1, %r13
        setx  0x9cf8121843467ecf, %g1, %r14
        setx  0x3482e4c24d3069c2, %g1, %r15
        setx  0xfc61e76fca87a757, %g1, %r18
        setx  0x91263f5d3ed1d715, %g1, %r19
        setx  0x7767ddfe19fed1d3, %g1, %r20
        setx  0xeb6b6392a1561ef8, %g1, %r21
        setx  0x62c82784c8f30329, %g1, %r22
        setx  0x0abd6b4f0c1ba266, %g1, %r23
        setx  0x9dedfe0b01bb8caf, %g1, %r24
        setx  0x09a1147d8a53c1cc, %g1, %r25
        setx  0xe9e4b060b57e031a, %g1, %r26
        setx  0xe5d7eb14b196890e, %g1, %r27
        setx  0x4d0053981289d1e5, %g1, %r28
        setx  0x68e973921e2b7b9a, %g1, %r29
        setx  0x64209630a753d909, %g1, %r30
        setx  0x53779b93949e1484, %g1, %r31
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
	.word 0xeedc1011  ! 2: LDXA_R	ldxa	[%r16, %r17] 0x80, %r23
	.word 0xf11428c7  ! 4: LDQF_I	-	[%r16, 0x08c7], %f24
	.word 0x8e042041  ! 6: ADD_I	add 	%r16, 0x0041, %r7
	.word 0x88340011  ! 6: ORN_R	orn 	%r16, %r17, %r4
	.word 0xb33c0011  ! 6: SRA_R	sra 	%r16, %r17, %r25
	.word 0x9a8c0011  ! 6: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0xb42c0011  ! 6: ANDN_R	andn 	%r16, %r17, %r26
	.word 0x909c26d5  ! 6: XORcc_I	xorcc 	%r16, 0x06d5, %r8
	.word 0xb08c2f04  ! 6: ANDcc_I	andcc 	%r16, 0x0f04, %r24
	.word 0x85341011  ! 6: SRLX_R	srlx	%r16, %r17, %r2
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,29)
	.word 0xf9841000  ! 8: LDFA_R	lda	[%r16, %r0], %f28
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0x903c0011  ! 12: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x960c0011  ! 12: AND_R	and 	%r16, %r17, %r11
	.word 0x9cac0011  ! 12: ANDNcc_R	andncc 	%r16, %r17, %r14
	.word 0xb6ac0011  ! 12: ANDNcc_R	andncc 	%r16, %r17, %r27
	.word 0x928c240f  ! 12: ANDcc_I	andcc 	%r16, 0x040f, %r9
	.word 0x86340011  ! 12: ORN_R	orn 	%r16, %r17, %r3
	.word 0x89341011  ! 12: SRLX_R	srlx	%r16, %r17, %r4
	.word 0xbb643801  ! 12: MOVcc_I	<illegal instruction>
	.word 0xcf14255f  ! 13: LDQF_I	-	[%r16, 0x055f], %f7
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	ta	T_CHANGE_PRIV	! macro
	.word 0x9ab42b05  ! 17: ORNcc_I	orncc 	%r16, 0x0b05, %r13
	.word 0x8b2c0011  ! 17: SLL_R	sll 	%r16, %r17, %r5
	.word 0x90340011  ! 17: ORN_R	orn 	%r16, %r17, %r8
	.word 0x91342001  ! 17: SRL_I	srl 	%r16, 0x0001, %r8
	.word 0x9c0424f3  ! 17: ADD_I	add 	%r16, 0x04f3, %r14
	.word 0x86840011  ! 17: ADDcc_R	addcc 	%r16, %r17, %r3
	.word 0x9c142413  ! 17: OR_I	or 	%r16, 0x0413, %r14
	.word 0xe71c0011  ! 18: LDDF_R	ldd	[%r16, %r17], %f19
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xcd1c2ca1  ! 20: LDDF_I	ldd	[%r16, 0x0ca1], %f6
	.word 0xa72c3001  ! 22: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0x98040011  ! 22: ADD_R	add 	%r16, %r17, %r12
	.word 0x841c22c6  ! 22: XOR_I	xor 	%r16, 0x02c6, %r2
	.word 0x9a9c0011  ! 22: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0xb6042316  ! 22: ADD_I	add 	%r16, 0x0316, %r27
	.word 0xaa04245c  ! 22: ADD_I	add 	%r16, 0x045c, %r21
	.word 0x941c2d07  ! 22: XOR_I	xor 	%r16, 0x0d07, %r10
	.word 0xba942dfd  ! 22: ORcc_I	orcc 	%r16, 0x0dfd, %r29
	.word 0xc2142a38  ! 23: LDUH_I	lduh	[%r16 + 0x0a38], %r1
thr1_resum_intr_756:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_756), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x9cc42f23  ! 27: ADDCcc_I	addccc 	%r16, 0x0f23, %r14
	.word 0xa80c0011  ! 27: AND_R	and 	%r16, %r17, %r20
	.word 0xba842541  ! 27: ADDcc_I	addcc 	%r16, 0x0541, %r29
	.word 0x87340011  ! 27: SRL_R	srl 	%r16, %r17, %r3
	.word 0x8e442475  ! 27: ADDC_I	addc 	%r16, 0x0475, %r7
	.word 0x8d342001  ! 27: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x92ac2ec4  ! 27: ANDNcc_I	andncc 	%r16, 0x0ec4, %r9
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,33)
	.word 0xf6841000  ! 29: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r27
	.word 0xc7042e17  ! 31: LDF_I	ld	[%r16, 0x0e17], %f3
	.word 0xaa040011  ! 33: ADD_R	add 	%r16, %r17, %r21
	.word 0xb21c0011  ! 33: XOR_R	xor 	%r16, %r17, %r25
	.word 0xb12c1011  ! 33: SLLX_R	sllx	%r16, %r17, %r24
	.word 0x982c0011  ! 33: ANDN_R	andn 	%r16, %r17, %r12
	.word 0xb4140011  ! 33: OR_R	or 	%r16, %r17, %r26
	.word 0x952c3001  ! 33: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0xcf1c2b2d  ! 34: LDDF_I	ldd	[%r16, 0x0b2d], %f7
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xd61c0011  ! 36: LDD_R	ldd	[%r16 + %r17], %r11
	.word 0x9d3c2001  ! 38: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0xb08c273e  ! 38: ANDcc_I	andcc 	%r16, 0x073e, %r24
	.word 0x98bc0011  ! 38: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0x940427de  ! 38: ADD_I	add 	%r16, 0x07de, %r10
	.word 0x973c0011  ! 38: SRA_R	sra 	%r16, %r17, %r11
	.word 0x98b42bbe  ! 38: ORNcc_I	orncc 	%r16, 0x0bbe, %r12
	.word 0x8a1c2842  ! 38: XOR_I	xor 	%r16, 0x0842, %r5
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,22)
	.word 0xfa8c2ccf  ! 40: LDUBA_I	lduba	[%r16, + 0x0ccf] %asi, %r29
	.word 0xc8cc2c9d  ! 42: LDSBA_I	ldsba	[%r16, + 0x0c9d] %asi, %r4
	.word 0xbb341011  ! 44: SRLX_R	srlx	%r16, %r17, %r29
	.word 0x880c2366  ! 44: AND_I	and 	%r16, 0x0366, %r4
	.word 0x95643801  ! 44: MOVcc_I	<illegal instruction>
	.word 0x84c40011  ! 44: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xbb3c1011  ! 44: SRAX_R	srax	%r16, %r17, %r29
	.word 0x9e342d48  ! 44: ORN_I	orn 	%r16, 0x0d48, %r15
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,44)
	.word 0xc3941000  ! 46: LDQFA_R	-	[%r16, %r0], %f1
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xd02c2076  ! 50: STB_I	stb	%r8, [%r16 + 0x0076]
	.word 0x92c42a7d  ! 52: ADDCcc_I	addccc 	%r16, 0x0a7d, %r9
	.word 0x89340011  ! 52: SRL_R	srl 	%r16, %r17, %r4
	.word 0x949c2bba  ! 52: XORcc_I	xorcc 	%r16, 0x0bba, %r10
	.word 0x96b40011  ! 52: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0xa62c0011  ! 52: ANDN_R	andn 	%r16, %r17, %r19
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,18)
	.word 0xf6cc2e1c  ! 54: LDSBA_I	ldsba	[%r16, + 0x0e1c] %asi, %r27
	.word 0xd6140011  ! 56: LDUH_R	lduh	[%r16 + %r17], %r11
	.word 0x93343001  ! 58: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x8c340011  ! 58: ORN_R	orn 	%r16, %r17, %r6
	.word 0x888c210e  ! 58: ANDcc_I	andcc 	%r16, 0x010e, %r4
	.word 0xa7643801  ! 58: MOVcc_I	<illegal instruction>
	.word 0xaac42feb  ! 58: ADDCcc_I	addccc 	%r16, 0x0feb, %r21
	.word 0x932c0011  ! 58: SLL_R	sll 	%r16, %r17, %r9
	.word 0x953c2001  ! 58: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0xd20c2de8  ! 59: LDUB_I	ldub	[%r16 + 0x0de8], %r9
!Illinst store
	.word 0xc4240011  ! 61: STW_R	stw	%r2, [%r16 + %r17]
	.word 0xb0b420ca  ! 63: ORNcc_I	orncc 	%r16, 0x00ca, %r24
	.word 0xaa440011  ! 63: ADDC_R	addc 	%r16, %r17, %r21
	.word 0x84142cd7  ! 63: OR_I	or 	%r16, 0x0cd7, %r2
	.word 0xad3c1011  ! 63: SRAX_R	srax	%r16, %r17, %r22
	.word 0x883c0011  ! 63: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0xb084230a  ! 63: ADDcc_I	addcc 	%r16, 0x030a, %r24
	.word 0x91343001  ! 63: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0x9ebc0011  ! 63: XNORcc_R	xnorcc 	%r16, %r17, %r15
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,49)
	.word 0xd4c41000  ! 65: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r10
	.word 0xf8b41011  ! 67: STHA_R	stha	%r28, [%r16 + %r17] 0x80
	.word 0x942c0011  ! 69: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x9284253e  ! 69: ADDcc_I	addcc 	%r16, 0x053e, %r9
	.word 0x8d2c3001  ! 69: SLLX_I	sllx	%r16, 0x0001, %r6
	.word 0xb0b42b79  ! 69: ORNcc_I	orncc 	%r16, 0x0b79, %r24
	.word 0x94bc0011  ! 69: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x873c1011  ! 69: SRAX_R	srax	%r16, %r17, %r3
	.word 0xa8c40011  ! 69: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0xb48c0011  ! 69: ANDcc_R	andcc 	%r16, %r17, %r26
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,41)
	.word 0xc41c214e  ! 71: LDD_I	ldd	[%r16 + 0x014e], %r2
!Illinst alu
	.word 0x8c440011  ! 73: ADDC_R	addc 	%r16, %r17, %r6
	.word 0x86ac24ba  ! 75: ANDNcc_I	andncc 	%r16, 0x04ba, %r3
	.word 0x977c2401  ! 75: MOVR_I	move	%r16, 0xfffffe54, %r11
	.word 0xae0c0011  ! 75: AND_R	and 	%r16, %r17, %r23
	.word 0x964422aa  ! 75: ADDC_I	addc 	%r16, 0x02aa, %r11
	.word 0x98ac28dd  ! 75: ANDNcc_I	andncc 	%r16, 0x08dd, %r12
	.word 0xae9427f0  ! 75: ORcc_I	orcc 	%r16, 0x07f0, %r23
	.word 0xb0ac250b  ! 75: ANDNcc_I	andncc 	%r16, 0x050b, %r24
	.word 0xdec42962  ! 76: LDSWA_I	ldswa	[%r16, + 0x0962] %asi, %r15
	.word 0xf074226b  ! 80: STX_I	stx	%r24, [%r16 + 0x026b]
	.word 0x8c842a8c  ! 82: ADDcc_I	addcc 	%r16, 0x0a8c, %r6
	.word 0x9eac2cdb  ! 82: ANDNcc_I	andncc 	%r16, 0x0cdb, %r15
	.word 0x968c2e30  ! 82: ANDcc_I	andcc 	%r16, 0x0e30, %r11
	.word 0xaa3c2e91  ! 82: XNOR_I	xnor 	%r16, 0x0e91, %r21
	.word 0xb8940011  ! 82: ORcc_R	orcc 	%r16, %r17, %r28
	.word 0x86bc2741  ! 83: XNORcc_I	xnorcc 	%r16, 0x0741, %r3
	.word 0x92c40011  ! 83: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xa8442f7a  ! 83: ADDC_I	addc 	%r16, 0x0f7a, %r20
	.word 0xb1342001  ! 83: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0xae340011  ! 83: ORN_R	orn 	%r16, %r17, %r23
	.word 0x972c2001  ! 83: SLL_I	sll 	%r16, 0x0001, %r11
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xde042254  ! 83: LDUW_I	lduw	[%r16 + 0x0254], %r15
	jmpl     %r18 + 0x28, %r31
	.word 0x852c3001  ! 86: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0xb12c3001  ! 86: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x823c0011  ! 86: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x88442c53  ! 86: ADDC_I	addc 	%r16, 0x0c53, %r4
	.word 0xa7343001  ! 86: SRLX_I	srlx	%r16, 0x0001, %r19
	.word 0xc59c1011  ! 87: LDDFA_R	ldda	[%r16, %r17], %f2
	.word 0xc9941011  ! 89: LDQFA_R	-	[%r16, %r17], %f4
	.word 0x821c0011  ! 91: XOR_R	xor 	%r16, %r17, %r1
	.word 0xb04429dc  ! 91: ADDC_I	addc 	%r16, 0x09dc, %r24
	.word 0x9b342001  ! 91: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x9f342001  ! 91: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x972c2001  ! 91: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x988c2caf  ! 91: ANDcc_I	andcc 	%r16, 0x0caf, %r12
	.word 0xf8542654  ! 92: LDSH_I	ldsh	[%r16 + 0x0654], %r28
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xf1042a16  ! 94: LDF_I	ld	[%r16, 0x0a16], %f24
	.word 0x88ac0011  ! 96: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0xb02c2109  ! 96: ANDN_I	andn 	%r16, 0x0109, %r24
	.word 0x8c0c0011  ! 96: AND_R	and 	%r16, %r17, %r6
	.word 0x99641811  ! 96: MOVcc_R	<illegal instruction>
	.word 0x89641811  ! 96: MOVcc_R	<illegal instruction>
	.word 0xb32c3001  ! 96: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0x92bc2479  ! 96: XNORcc_I	xnorcc 	%r16, 0x0479, %r9
	.word 0x922c0011  ! 96: ANDN_R	andn 	%r16, %r17, %r9
	.word 0xfb042a2c  ! 97: LDF_I	ld	[%r16, 0x0a2c], %f29
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xdf1c2ecf  ! 99: LDDF_I	ldd	[%r16, 0x0ecf], %f15
	.word 0xac34228f  ! 101: ORN_I	orn 	%r16, 0x028f, %r22
	.word 0x8e0c0011  ! 101: AND_R	and 	%r16, %r17, %r7
	.word 0x87643801  ! 101: MOVcc_I	<illegal instruction>
	.word 0x953c2001  ! 101: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x88840011  ! 101: ADDcc_R	addcc 	%r16, %r17, %r4
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,46)
	.word 0xf3140000  ! 103: LDQF_R	-	[%r16, %r0], %f25
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xcd1c2690  ! 105: LDDF_I	ldd	[%r16, 0x0690], %f6
	.word 0x863c2a4a  ! 107: XNOR_I	xnor 	%r16, 0x0a4a, %r3
	.word 0x88b42b95  ! 107: ORNcc_I	orncc 	%r16, 0x0b95, %r4
	.word 0xbb7c0411  ! 107: MOVR_R	move	%r16, %r17, %r29
	.word 0xad2c2001  ! 107: SLL_I	sll 	%r16, 0x0001, %r22
	.word 0x86bc0011  ! 107: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0xb0ac0011  ! 107: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0xf2542434  ! 108: LDSH_I	ldsh	[%r16 + 0x0434], %r25
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xd2a42071  ! 110: STWA_I	stwa	%r9, [%r16 + 0x0071] %asi
	.word 0x8b2c1011  ! 112: SLLX_R	sllx	%r16, %r17, %r5
	.word 0x94ac2fc2  ! 112: ANDNcc_I	andncc 	%r16, 0x0fc2, %r10
	.word 0xa8ac0011  ! 112: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0x8b2c3001  ! 112: SLLX_I	sllx	%r16, 0x0001, %r5
	.word 0x9d641811  ! 112: MOVcc_R	<illegal instruction>
	.word 0x8d3c2001  ! 112: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0x8c3c0011  ! 112: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0xd61c0011  ! 113: LDD_R	ldd	[%r16 + %r17], %r11
	.word 0xf4f423e3  ! 115: STXA_I	stxa	%r26, [%r16 + 0x03e3] %asi
	.word 0x82040011  ! 117: ADD_R	add 	%r16, %r17, %r1
	.word 0x8f2c2001  ! 117: SLL_I	sll 	%r16, 0x0001, %r7
	.word 0x99342001  ! 117: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0xb13c0011  ! 117: SRA_R	sra 	%r16, %r17, %r24
	.word 0xb2c42cac  ! 117: ADDCcc_I	addccc 	%r16, 0x0cac, %r25
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,23)
	.word 0xe6540000  ! 119: LDSH_R	ldsh	[%r16 + %r0], %r19
	return     %r18 + %r17
	.word 0x828c0011  ! 122: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0x85343001  ! 122: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0x8c8c0011  ! 122: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0xa88c0011  ! 122: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0x98c42597  ! 122: ADDCcc_I	addccc 	%r16, 0x0597, %r12
	.word 0x880c0011  ! 122: AND_R	and 	%r16, %r17, %r4
	.word 0x882c2e32  ! 122: ANDN_I	andn 	%r16, 0x0e32, %r4
	.word 0xb52c3001  ! 122: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xd71c0011  ! 123: LDDF_R	ldd	[%r16, %r17], %f11
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xd65c0011  ! 125: LDX_R	ldx	[%r16 + %r17], %r11
	.word 0xa6140011  ! 127: OR_R	or 	%r16, %r17, %r19
	.word 0x84b40011  ! 127: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0x8e842c9d  ! 127: ADDcc_I	addcc 	%r16, 0x0c9d, %r7
	.word 0x957c2401  ! 127: MOVR_I	move	%r16, 0xfffffe54, %r10
	.word 0x953c1011  ! 127: SRAX_R	srax	%r16, %r17, %r10
	.word 0x8c342381  ! 127: ORN_I	orn 	%r16, 0x0381, %r6
	.word 0xdecc1011  ! 128: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r15
	.word 0xcc1c0011  ! 130: LDD_R	ldd	[%r16 + %r17], %r6
	.word 0x932c1011  ! 132: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x857c0411  ! 132: MOVR_R	move	%r16, %r17, %r2
	.word 0xae1c0011  ! 132: XOR_R	xor 	%r16, %r17, %r23
	.word 0x82bc293e  ! 132: XNORcc_I	xnorcc 	%r16, 0x093e, %r1
	.word 0x91343001  ! 132: SRLX_I	srlx	%r16, 0x0001, %r8
	.word 0xc6540011  ! 133: LDSH_R	ldsh	[%r16 + %r17], %r3
	.word 0xccdc2b8e  ! 135: LDXA_I	ldxa	[%r16, + 0x0b8e] %asi, %r6
	.word 0x9a2c0011  ! 137: ANDN_R	andn 	%r16, %r17, %r13
	.word 0x98940011  ! 137: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x8ab4221c  ! 137: ORNcc_I	orncc 	%r16, 0x021c, %r5
	.word 0x9b340011  ! 137: SRL_R	srl 	%r16, %r17, %r13
	.word 0x92940011  ! 137: ORcc_R	orcc 	%r16, %r17, %r9
thr1_dc_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_9), 16, 16),1,DC_DATA,23)
	.word 0xd8542d50  ! 139: LDSH_I	ldsh	[%r16 + 0x0d50], %r12
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xec0c2540  ! 141: LDUB_I	ldub	[%r16 + 0x0540], %r22
	.word 0xa72c2001  ! 143: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0xb6b40011  ! 143: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0xb69c0011  ! 143: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0x92940011  ! 143: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x8204226e  ! 143: ADD_I	add 	%r16, 0x026e, %r1
	.word 0x99340011  ! 143: SRL_R	srl 	%r16, %r17, %r12
thr1_dc_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_10), 16, 16),1,DC_DATA,9)
	.word 0xd2c42aa7  ! 145: LDSWA_I	ldswa	[%r16, + 0x0aa7] %asi, %r9
	.word 0xf85c2827  ! 147: LDX_I	ldx	[%r16 + 0x0827], %r28
	.word 0xae2c2efd  ! 149: ANDN_I	andn 	%r16, 0x0efd, %r23
	.word 0x8e442d69  ! 149: ADDC_I	addc 	%r16, 0x0d69, %r7
	.word 0xb3341011  ! 149: SRLX_R	srlx	%r16, %r17, %r25
	.word 0x852c2001  ! 149: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x96c40011  ! 149: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x917c2401  ! 149: MOVR_I	move	%r16, 0xfffffe54, %r8
	.word 0xea1c28e9  ! 150: LDD_I	ldd	[%r16 + 0x08e9], %r21
	.word 0xcb140011  ! 152: LDQF_R	-	[%r16, %r17], %f5
	.word 0x98ac0011  ! 154: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x8a440011  ! 154: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x889c0011  ! 154: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0xa8c4258e  ! 154: ADDCcc_I	addccc 	%r16, 0x058e, %r20
	.word 0xa63c2eef  ! 154: XNOR_I	xnor 	%r16, 0x0eef, %r19
	.word 0xba9c0011  ! 154: XORcc_R	xorcc 	%r16, %r17, %r29
thr1_dc_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_11), 16, 16),1,DC_DATA,64)
	.word 0xd08c1000  ! 156: LDUBA_R	lduba	[%r16, %r0] 0x80, %r8
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xc8140011  ! 158: LDUH_R	lduh	[%r16 + %r17], %r4
	.word 0x83341011  ! 160: SRLX_R	srlx	%r16, %r17, %r1
	.word 0x89643801  ! 160: MOVcc_I	<illegal instruction>
	.word 0x8d341011  ! 160: SRLX_R	srlx	%r16, %r17, %r6
	.word 0xbac40011  ! 160: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0x8f341011  ! 160: SRLX_R	srlx	%r16, %r17, %r7
	.word 0xb53c1011  ! 160: SRAX_R	srax	%r16, %r17, %r26
	.word 0x91643801  ! 160: MOVcc_I	<illegal instruction>
	.word 0xaf2c0011  ! 160: SLL_R	sll 	%r16, %r17, %r23
thr1_dc_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_12), 16, 16),1,DC_DATA,33)
	.word 0xda942d41  ! 162: LDUHA_I	lduha	[%r16, + 0x0d41] %asi, %r13
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xccec2377  ! 164: LDSTUBA_I	ldstuba	%r6, [%r16 + 0x0377] %asi
	.word 0x982c2514  ! 166: ANDN_I	andn 	%r16, 0x0514, %r12
	.word 0x932c3001  ! 166: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x8d641811  ! 166: MOVcc_R	<illegal instruction>
	.word 0x920c2cee  ! 166: AND_I	and 	%r16, 0x0cee, %r9
	.word 0x9abc0011  ! 166: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x8cac0011  ! 166: ANDNcc_R	andncc 	%r16, %r17, %r6
thr1_dc_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_13), 16, 16),1,DC_DATA,58)
	.word 0xec1c0000  ! 168: LDD_R	ldd	[%r16 + %r0], %r22
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0x9b6c2904  ! 170: SDIVX_I	sdivx	%r16, 0x0904, %r13
	.word 0xae442998  ! 172: ADDC_I	addc 	%r16, 0x0998, %r23
	.word 0x82340011  ! 172: ORN_R	orn 	%r16, %r17, %r1
	.word 0x8a2c2af4  ! 172: ANDN_I	andn 	%r16, 0x0af4, %r5
	.word 0x99342001  ! 172: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0xbabc0011  ! 172: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0x9f643801  ! 172: MOVcc_I	<illegal instruction>
	.word 0x8814243c  ! 172: OR_I	or 	%r16, 0x043c, %r4
	.word 0xdb1c2abe  ! 173: LDDF_I	ldd	[%r16, 0x0abe], %f13
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xcd040011  ! 175: LDF_R	ld	[%r16, %r17], %f6
	.word 0x9e940011  ! 177: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x98840011  ! 177: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x833c2001  ! 177: SRA_I	sra 	%r16, 0x0001, %r1
	.word 0x8f342001  ! 177: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0xba340011  ! 177: ORN_R	orn 	%r16, %r17, %r29
thr1_dc_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_14), 16, 16),1,DC_DATA,43)
	.word 0xda0c0000  ! 179: LDUB_R	ldub	[%r16 + %r0], %r13
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
thr1_resum_intr_757:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_757), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x0, %asr26
	.word 0x88ac0011  ! 183: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x892c1011  ! 183: SLLX_R	sllx	%r16, %r17, %r4
	.word 0xb0c40011  ! 183: ADDCcc_R	addccc 	%r16, %r17, %r24
	.word 0x8d643801  ! 183: MOVcc_I	<illegal instruction>
	.word 0x8ac42451  ! 183: ADDCcc_I	addccc 	%r16, 0x0451, %r5
	.word 0x8b2c1011  ! 183: SLLX_R	sllx	%r16, %r17, %r5
	.word 0xb7342001  ! 183: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xf4942619  ! 184: LDUHA_I	lduha	[%r16, + 0x0619] %asi, %r26
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xd6dc26a6  ! 186: LDXA_I	ldxa	[%r16, + 0x06a6] %asi, %r11
	.word 0xae9c2dd7  ! 188: XORcc_I	xorcc 	%r16, 0x0dd7, %r23
	.word 0x9a942465  ! 188: ORcc_I	orcc 	%r16, 0x0465, %r13
	.word 0x8eac0011  ! 188: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x860423a1  ! 188: ADD_I	add 	%r16, 0x03a1, %r3
	.word 0x95641811  ! 188: MOVcc_R	<illegal instruction>
	.word 0xaec40011  ! 188: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0xde8c1011  ! 189: LDUBA_R	lduba	[%r16, %r17] 0x80, %r15
	.word 0xcec41011  ! 191: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r7
	.word 0x9ebc2a69  ! 193: XNORcc_I	xnorcc 	%r16, 0x0a69, %r15
	.word 0xba9c0011  ! 193: XORcc_R	xorcc 	%r16, %r17, %r29
	.word 0x88c40011  ! 193: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xacc40011  ! 193: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0xae1c0011  ! 193: XOR_R	xor 	%r16, %r17, %r23
thr1_dc_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_15), 16, 16),1,DC_DATA,6)
	.word 0xe8842552  ! 195: LDUWA_I	lduwa	[%r16, + 0x0552] %asi, %r20
	.word 0xcacc1011  ! 197: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r5
	.word 0x8e440011  ! 199: ADDC_R	addc 	%r16, %r17, %r7
	.word 0xbac40011  ! 199: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0x9ac40011  ! 199: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x92140011  ! 199: OR_R	or 	%r16, %r17, %r9
	.word 0x9e2c222a  ! 199: ANDN_I	andn 	%r16, 0x022a, %r15
thr1_dc_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_16), 16, 16),1,DC_DATA,27)
	.word 0xeb1c0000  ! 201: LDDF_R	ldd	[%r16, %r0], %f21
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xed841011  ! 203: LDFA_R	lda	[%r16, %r17], %f22
	.word 0x849c0011  ! 205: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x8c0424eb  ! 205: ADD_I	add 	%r16, 0x04eb, %r6
	.word 0xa93c2001  ! 205: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x8e842c87  ! 205: ADDcc_I	addcc 	%r16, 0x0c87, %r7
	.word 0x8d342001  ! 205: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0xb8ac0011  ! 205: ANDNcc_R	andncc 	%r16, %r17, %r28
	.word 0xab2c2001  ! 205: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0xcb140011  ! 206: LDQF_R	-	[%r16, %r17], %f5
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xcb14285a  ! 208: LDQF_I	-	[%r16, 0x085a], %f5
	.word 0xacc427a5  ! 210: ADDCcc_I	addccc 	%r16, 0x07a5, %r22
	.word 0x903c2163  ! 210: XNOR_I	xnor 	%r16, 0x0163, %r8
	.word 0xaac40011  ! 210: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0xad2c3001  ! 210: SLLX_I	sllx	%r16, 0x0001, %r22
	.word 0x84142eb4  ! 210: OR_I	or 	%r16, 0x0eb4, %r2
	.word 0x92140011  ! 210: OR_R	or 	%r16, %r17, %r9
	.word 0xb72c3001  ! 210: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0xb1340011  ! 210: SRL_R	srl 	%r16, %r17, %r24
	.word 0xc60c0011  ! 211: LDUB_R	ldub	[%r16 + %r17], %r3
	.word 0x8143e061  ! 213: MEMBAR	membar	#LoadLoad | #MemIssue | #Sync 
	.word 0xa6440011  ! 215: ADDC_R	addc 	%r16, %r17, %r19
	.word 0xb4bc0011  ! 215: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0xac040011  ! 215: ADD_R	add 	%r16, %r17, %r22
	.word 0xb61c244d  ! 215: XOR_I	xor 	%r16, 0x044d, %r27
	.word 0xac1c2cae  ! 215: XOR_I	xor 	%r16, 0x0cae, %r22
thr1_dc_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_17), 16, 16),1,DC_DATA,56)
	.word 0xd91c2250  ! 217: LDDF_I	ldd	[%r16, 0x0250], %f12
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xc60c232a  ! 219: LDUB_I	ldub	[%r16 + 0x032a], %r3
	.word 0xad7c2401  ! 221: MOVR_I	move	%r16, 0xfffffe54, %r22
	.word 0x98940011  ! 221: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0x8ac42885  ! 221: ADDCcc_I	addccc 	%r16, 0x0885, %r5
	.word 0x83343001  ! 221: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x9cac2cef  ! 221: ANDNcc_I	andncc 	%r16, 0x0cef, %r14
	.word 0x912c2001  ! 221: SLL_I	sll 	%r16, 0x0001, %r8
thr1_dc_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_18), 16, 16),1,DC_DATA,20)
	.word 0xe8941000  ! 223: LDUHA_R	lduha	[%r16, %r0] 0x80, %r20
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xc4140011  ! 225: LDUH_R	lduh	[%r16 + %r17], %r2
	.word 0x8c1c233d  ! 227: XOR_I	xor 	%r16, 0x033d, %r6
	.word 0x853c0011  ! 227: SRA_R	sra 	%r16, %r17, %r2
	.word 0x9004229b  ! 227: ADD_I	add 	%r16, 0x029b, %r8
	.word 0xb4842869  ! 227: ADDcc_I	addcc 	%r16, 0x0869, %r26
	.word 0xb08c2171  ! 227: ANDcc_I	andcc 	%r16, 0x0171, %r24
	.word 0xb2940011  ! 227: ORcc_R	orcc 	%r16, %r17, %r25
	.word 0xac042f18  ! 227: ADD_I	add 	%r16, 0x0f18, %r22
	.word 0x9f3c2001  ! 227: SRA_I	sra 	%r16, 0x0001, %r15
thr1_dc_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_19), 16, 16),1,DC_DATA,43)
	.word 0xf6841000  ! 229: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r27
thr1_irf_ce_20:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_20), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xf4440011  ! 231: LDSW_R	ldsw	[%r16 + %r17], %r26
	.word 0x94140011  ! 233: OR_R	or 	%r16, %r17, %r10
	.word 0x8c3c2dc7  ! 233: XNOR_I	xnor 	%r16, 0x0dc7, %r6
	.word 0xa8840011  ! 233: ADDcc_R	addcc 	%r16, %r17, %r20
	.word 0xaa842113  ! 233: ADDcc_I	addcc 	%r16, 0x0113, %r21
	.word 0x992c0011  ! 233: SLL_R	sll 	%r16, %r17, %r12
	.word 0xcd1c0011  ! 234: LDDF_R	ldd	[%r16, %r17], %f6
thr1_irf_ce_21:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_21), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xf6dc2c0d  ! 236: LDXA_I	ldxa	[%r16, + 0x0c0d] %asi, %r27
	.word 0x96842f28  ! 238: ADDcc_I	addcc 	%r16, 0x0f28, %r11
	.word 0x9a942bd1  ! 238: ORcc_I	orcc 	%r16, 0x0bd1, %r13
	.word 0x86140011  ! 238: OR_R	or 	%r16, %r17, %r3
	.word 0x94ac0011  ! 238: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x902c0011  ! 238: ANDN_R	andn 	%r16, %r17, %r8
	.word 0xb8342a6c  ! 238: ORN_I	orn 	%r16, 0x0a6c, %r28
	.word 0xd8442161  ! 239: LDSW_I	ldsw	[%r16 + 0x0161], %r12
thr1_irf_ce_22:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_22), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xd89c2d71  ! 241: LDDA_I	ldda	[%r16, + 0x0d71] %asi, %r12
	.word 0xa6142fca  ! 243: OR_I	or 	%r16, 0x0fca, %r19
	.word 0x902c2d00  ! 243: ANDN_I	andn 	%r16, 0x0d00, %r8
	.word 0xa8842f9c  ! 243: ADDcc_I	addcc 	%r16, 0x0f9c, %r20
	.word 0x9eb428b1  ! 243: ORNcc_I	orncc 	%r16, 0x08b1, %r15
	.word 0x86bc0011  ! 243: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0xe6942bd9  ! 244: LDUHA_I	lduha	[%r16, + 0x0bd9] %asi, %r19
	.word 0xe88c1011  ! 246: LDUBA_R	lduba	[%r16, %r17] 0x80, %r20
	.word 0x82bc29f9  ! 248: XNORcc_I	xnorcc 	%r16, 0x09f9, %r1
	.word 0xb8840011  ! 248: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0xaa942fa6  ! 248: ORcc_I	orcc 	%r16, 0x0fa6, %r21
	.word 0xb81c0011  ! 248: XOR_R	xor 	%r16, %r17, %r28
	.word 0x8e042d8c  ! 248: ADD_I	add 	%r16, 0x0d8c, %r7
	.word 0x9f2c2001  ! 248: SLL_I	sll 	%r16, 0x0001, %r15
thr1_dc_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_20), 16, 16),1,DC_DATA,24)
	.word 0xc85c0000  ! 250: LDX_R	ldx	[%r16 + %r0], %r4
	.word 0xa67425bd  ! 252: UDIV_I	udiv 	%r16, 0x05bd, %r19
	.word 0x88c40011  ! 254: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xb8840011  ! 254: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0x88440011  ! 254: ADDC_R	addc 	%r16, %r17, %r4
	.word 0x82c40011  ! 254: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0x8d643801  ! 254: MOVcc_I	<illegal instruction>
	.word 0xe69c1011  ! 255: LDDA_R	ldda	[%r16, %r17] 0x80, %r19
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0x8e3c0011  ! 259: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0x9e942040  ! 259: ORcc_I	orcc 	%r16, 0x0040, %r15
	.word 0xb57c0411  ! 259: MOVR_R	move	%r16, %r17, %r26
	.word 0xa73c1011  ! 259: SRAX_R	srax	%r16, %r17, %r19
	.word 0xac9c280f  ! 259: XORcc_I	xorcc 	%r16, 0x080f, %r22
	.word 0x86b40011  ! 259: ORNcc_R	orncc 	%r16, %r17, %r3
thr1_dc_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_21), 16, 16),1,DC_DATA,48)
	.word 0xf1040000  ! 261: LDF_R	ld	[%r16, %r0], %f24
	.word 0xc21c0011  ! 263: LDD_R	ldd	[%r16 + %r17], %r1
	.word 0x94440011  ! 265: ADDC_R	addc 	%r16, %r17, %r10
	.word 0x83343001  ! 265: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0x90040011  ! 265: ADD_R	add 	%r16, %r17, %r8
	.word 0xb3641811  ! 265: MOVcc_R	<illegal instruction>
	.word 0x8c942c6f  ! 265: ORcc_I	orcc 	%r16, 0x0c6f, %r6
	.word 0xb2942df0  ! 265: ORcc_I	orcc 	%r16, 0x0df0, %r25
	.word 0x942c0011  ! 265: ANDN_R	andn 	%r16, %r17, %r10
	.word 0xfb140011  ! 266: LDQF_R	-	[%r16, %r17], %f29
thr1_irf_ce_23:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_23), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xccd41011  ! 268: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r6
	.word 0x823c2ad3  ! 270: XNOR_I	xnor 	%r16, 0x0ad3, %r1
	.word 0x93643801  ! 270: MOVcc_I	<illegal instruction>
	.word 0x96c42b7e  ! 270: ADDCcc_I	addccc 	%r16, 0x0b7e, %r11
	.word 0x8cac2068  ! 270: ANDNcc_I	andncc 	%r16, 0x0068, %r6
	.word 0xa8442a79  ! 270: ADDC_I	addc 	%r16, 0x0a79, %r20
	.word 0x8ac4256d  ! 270: ADDCcc_I	addccc 	%r16, 0x056d, %r5
	.word 0x8e142902  ! 270: OR_I	or 	%r16, 0x0902, %r7
	.word 0xc854218e  ! 271: LDSH_I	ldsh	[%r16 + 0x018e], %r4
        wr %g0, 0x4, %fprs
	.word 0xaf2c1011  ! 275: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x96440011  ! 275: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x8cac25d3  ! 275: ANDNcc_I	andncc 	%r16, 0x05d3, %r6
	.word 0x880c2cd1  ! 275: AND_I	and 	%r16, 0x0cd1, %r4
	.word 0x89641811  ! 275: MOVcc_R	<illegal instruction>
	.word 0x8b3c2001  ! 275: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0x8d3c1011  ! 275: SRAX_R	srax	%r16, %r17, %r6
	.word 0xa604286b  ! 275: ADD_I	add 	%r16, 0x086b, %r19
	.word 0xf08c1011  ! 276: LDUBA_R	lduba	[%r16, %r17] 0x80, %r24
	.word 0xc3040011  ! 278: LDF_R	ld	[%r16, %r17], %f1
	.word 0x8e942373  ! 280: ORcc_I	orcc 	%r16, 0x0373, %r7
	.word 0x9a9c27e5  ! 280: XORcc_I	xorcc 	%r16, 0x07e5, %r13
	.word 0x9b2c0011  ! 280: SLL_R	sll 	%r16, %r17, %r13
	.word 0x88142fdf  ! 280: OR_I	or 	%r16, 0x0fdf, %r4
	.word 0x9e1c2f7e  ! 280: XOR_I	xor 	%r16, 0x0f7e, %r15
	.word 0xae840011  ! 280: ADDcc_R	addcc 	%r16, %r17, %r23
	.word 0x8d341011  ! 280: SRLX_R	srlx	%r16, %r17, %r6
thr1_dc_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_22), 16, 16),1,DC_DATA,40)
	.word 0xcf1c2e2d  ! 282: LDDF_I	ldd	[%r16, 0x0e2d], %f7
	return     %r18 + 0x28
	.word 0x933c0011  ! 285: SRA_R	sra 	%r16, %r17, %r9
	.word 0x8f342001  ! 285: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x86442d96  ! 285: ADDC_I	addc 	%r16, 0x0d96, %r3
	.word 0xb4b4258f  ! 285: ORNcc_I	orncc 	%r16, 0x058f, %r26
	.word 0x980c0011  ! 285: AND_R	and 	%r16, %r17, %r12
	.word 0xd71c0011  ! 286: LDDF_R	ldd	[%r16, %r17], %f11
thr1_irf_ce_24:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_24), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xce2c214d  ! 291: STB_I	stb	%r7, [%r16 + 0x014d]
	.word 0x8c1c2c37  ! 293: XOR_I	xor 	%r16, 0x0c37, %r6
	.word 0x8d3c2001  ! 293: SRA_I	sra 	%r16, 0x0001, %r6
	.word 0x832c0011  ! 293: SLL_R	sll 	%r16, %r17, %r1
	.word 0x9c3c0011  ! 293: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x9e8426d1  ! 293: ADDcc_I	addcc 	%r16, 0x06d1, %r15
	.word 0xb6bc0011  ! 293: XNORcc_R	xnorcc 	%r16, %r17, %r27
	.word 0xced42e26  ! 294: LDSHA_I	ldsha	[%r16, + 0x0e26] %asi, %r7
thr1_irf_ce_25:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_25), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xf84c0011  ! 296: LDSB_R	ldsb	[%r16 + %r17], %r28
	.word 0x8884218e  ! 298: ADDcc_I	addcc 	%r16, 0x018e, %r4
	.word 0x82840011  ! 298: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x8f641811  ! 298: MOVcc_R	<illegal instruction>
	.word 0x82b4298e  ! 298: ORNcc_I	orncc 	%r16, 0x098e, %r1
	.word 0xb9343001  ! 298: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x933c0011  ! 298: SRA_R	sra 	%r16, %r17, %r9
	.word 0x84bc0011  ! 298: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x888c0011  ! 298: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0xdcd41011  ! 299: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r14
thr1_irf_ce_26:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_26), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xda042a84  ! 301: LDUW_I	lduw	[%r16 + 0x0a84], %r13
	.word 0x8b3c2001  ! 303: SRA_I	sra 	%r16, 0x0001, %r5
	.word 0xaa0c2274  ! 303: AND_I	and 	%r16, 0x0274, %r21
	.word 0xb20c0011  ! 303: AND_R	and 	%r16, %r17, %r25
	.word 0xb8c40011  ! 303: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0xb5342001  ! 303: SRL_I	srl 	%r16, 0x0001, %r26
	.word 0xb60c27b8  ! 303: AND_I	and 	%r16, 0x07b8, %r27
	.word 0x8e942ccb  ! 303: ORcc_I	orcc 	%r16, 0x0ccb, %r7
	.word 0xd7941011  ! 304: LDQFA_R	-	[%r16, %r17], %f11
	.word 0x9dec0011  ! 306: RESTORE_R	restore	%r16, %r17, %r14
	.word 0x8cbc0011  ! 308: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0x88940011  ! 308: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0xaa8c2f61  ! 308: ANDcc_I	andcc 	%r16, 0x0f61, %r21
	.word 0xa60c0011  ! 308: AND_R	and 	%r16, %r17, %r19
	.word 0x8ec40011  ! 308: ADDCcc_R	addccc 	%r16, %r17, %r7
thr1_dc_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_23), 16, 16),1,DC_DATA,60)
	.word 0xc3142753  ! 310: LDQF_I	-	[%r16, 0x0753], %f1
	.word 0xf9941011  ! 312: LDQFA_R	-	[%r16, %r17], %f28
	.word 0x9ac40011  ! 314: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x84c426e1  ! 314: ADDCcc_I	addccc 	%r16, 0x06e1, %r2
	.word 0xa9342001  ! 314: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0xb6340011  ! 314: ORN_R	orn 	%r16, %r17, %r27
	.word 0x98bc2c67  ! 314: XNORcc_I	xnorcc 	%r16, 0x0c67, %r12
	.word 0x913c1011  ! 314: SRAX_R	srax	%r16, %r17, %r8
	.word 0x888c2e94  ! 314: ANDcc_I	andcc 	%r16, 0x0e94, %r4
	.word 0xc71c214c  ! 315: LDDF_I	ldd	[%r16, 0x014c], %f3
thr1_irf_ce_27:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_27), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xc36c212f  ! 317: PREFETCH_I	prefetch	[%r16 + 0x012f], #one_read
	.word 0xa6ac0011  ! 319: ANDNcc_R	andncc 	%r16, %r17, %r19
	.word 0x92bc0011  ! 319: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x9d2c0011  ! 319: SLL_R	sll 	%r16, %r17, %r14
	.word 0xac942fcf  ! 319: ORcc_I	orcc 	%r16, 0x0fcf, %r22
	.word 0x889c2e32  ! 319: XORcc_I	xorcc 	%r16, 0x0e32, %r4
thr1_dc_err_24:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_24), 16, 16),1,DC_DATA,46)
	.word 0xe88c2955  ! 321: LDUBA_I	lduba	[%r16, + 0x0955] %asi, %r20
thr1_irf_ce_28:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_28), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xdd140011  ! 323: LDQF_R	-	[%r16, %r17], %f14
	.word 0xacbc0011  ! 325: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0x8e940011  ! 325: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0x948c0011  ! 325: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0xa6b42abf  ! 325: ORNcc_I	orncc 	%r16, 0x0abf, %r19
	.word 0xb57c2401  ! 325: MOVR_I	move	%r16, 0xfffffe54, %r26
thr1_dc_err_25:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_25), 16, 16),1,DC_DATA,71)
	.word 0xe84c2e64  ! 327: LDSB_I	ldsb	[%r16 + 0x0e64], %r20
	.word 0xcadc1011  ! 329: LDXA_R	ldxa	[%r16, %r17] 0x80, %r5
	.word 0x9b2c2001  ! 331: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0x83643801  ! 331: MOVcc_I	<illegal instruction>
	.word 0xba1c0011  ! 331: XOR_R	xor 	%r16, %r17, %r29
	.word 0x843c0011  ! 331: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0xab641811  ! 331: MOVcc_R	<illegal instruction>
	.word 0xba040011  ! 331: ADD_R	add 	%r16, %r17, %r29
	.word 0x823c24cc  ! 331: XNOR_I	xnor 	%r16, 0x04cc, %r1
	.word 0x932c3001  ! 331: SLLX_I	sllx	%r16, 0x0001, %r9
thr1_dc_err_26:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_26), 16, 16),1,DC_DATA,37)
	.word 0xc51c268f  ! 333: LDDF_I	ldd	[%r16, 0x068f], %f2
thr1_irf_ce_29:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_29), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xda342a12  ! 337: STH_I	sth	%r13, [%r16 + 0x0a12]
	.word 0xb0c42b7b  ! 339: ADDCcc_I	addccc 	%r16, 0x0b7b, %r24
	.word 0x9e040011  ! 339: ADD_R	add 	%r16, %r17, %r15
	.word 0x91340011  ! 339: SRL_R	srl 	%r16, %r17, %r8
	.word 0x9b7c0411  ! 339: MOVR_R	move	%r16, %r17, %r13
	.word 0xb5641811  ! 339: MOVcc_R	<illegal instruction>
	.word 0x8e340011  ! 339: ORN_R	orn 	%r16, %r17, %r7
	.word 0x96340011  ! 339: ORN_R	orn 	%r16, %r17, %r11
thr1_dc_err_27:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_27), 16, 16),1,DC_DATA,45)
	.word 0xc71426ff  ! 341: LDQF_I	-	[%r16, 0x06ff], %f3
	.word 0x81dc0011  ! 343: FLUSH_R	dis not found

	.word 0xac9c26a0  ! 345: XORcc_I	xorcc 	%r16, 0x06a0, %r22
	.word 0xb37c0411  ! 345: MOVR_R	move	%r16, %r17, %r25
	.word 0x960c0011  ! 345: AND_R	and 	%r16, %r17, %r11
	.word 0x8a8426cb  ! 345: ADDcc_I	addcc 	%r16, 0x06cb, %r5
	.word 0x85643801  ! 345: MOVcc_I	<illegal instruction>
	.word 0xa8b40011  ! 345: ORNcc_R	orncc 	%r16, %r17, %r20
	.word 0xaabc0011  ! 345: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0xd51c0011  ! 346: LDDF_R	ldd	[%r16, %r17], %f10
	.word 0xc6040011  ! 348: LDUW_R	lduw	[%r16 + %r17], %r3
	.word 0x92042741  ! 350: ADD_I	add 	%r16, 0x0741, %r9
	.word 0x8894222e  ! 350: ORcc_I	orcc 	%r16, 0x022e, %r4
	.word 0x848c2eb4  ! 350: ANDcc_I	andcc 	%r16, 0x0eb4, %r2
	.word 0x86140011  ! 350: OR_R	or 	%r16, %r17, %r3
	.word 0x9c440011  ! 350: ADDC_R	addc 	%r16, %r17, %r14
	.word 0x85342001  ! 350: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0xc8cc2650  ! 351: LDSBA_I	ldsba	[%r16, + 0x0650] %asi, %r4
	.word 0xd0d4229c  ! 353: LDSHA_I	ldsha	[%r16, + 0x029c] %asi, %r8
	.word 0xaeac0011  ! 355: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0x8a0c0011  ! 355: AND_R	and 	%r16, %r17, %r5
	.word 0x892c1011  ! 355: SLLX_R	sllx	%r16, %r17, %r4
	.word 0x973c2001  ! 355: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x972c0011  ! 355: SLL_R	sll 	%r16, %r17, %r11
	.word 0xaeb426b5  ! 355: ORNcc_I	orncc 	%r16, 0x06b5, %r23
thr1_dc_err_28:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_28), 16, 16),1,DC_DATA,54)
	.word 0xe88c2f6c  ! 357: LDUBA_I	lduba	[%r16, + 0x0f6c] %asi, %r20
thr1_irf_ce_30:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_30), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xdd1c0011  ! 359: LDDF_R	ldd	[%r16, %r17], %f14
	.word 0x82ac0011  ! 361: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x98140011  ! 361: OR_R	or 	%r16, %r17, %r12
	.word 0xaa1c0011  ! 361: XOR_R	xor 	%r16, %r17, %r21
	.word 0x87643801  ! 361: MOVcc_I	<illegal instruction>
	.word 0xb0bc0011  ! 361: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0x9e140011  ! 361: OR_R	or 	%r16, %r17, %r15
	.word 0x86c42977  ! 361: ADDCcc_I	addccc 	%r16, 0x0977, %r3
	.word 0xae2c0011  ! 361: ANDN_R	andn 	%r16, %r17, %r23
	.word 0xca942180  ! 362: LDUHA_I	lduha	[%r16, + 0x0180] %asi, %r5
thr1_irf_ce_31:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_31), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xcccc1011  ! 364: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r6
	.word 0x902c0011  ! 366: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x98942011  ! 366: ORcc_I	orcc 	%r16, 0x0011, %r12
	.word 0x852c2001  ! 366: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0x91340011  ! 366: SRL_R	srl 	%r16, %r17, %r8
	.word 0xb52c1011  ! 366: SLLX_R	sllx	%r16, %r17, %r26
	.word 0x96c42533  ! 366: ADDCcc_I	addccc 	%r16, 0x0533, %r11
	.word 0x8e9c246d  ! 366: XORcc_I	xorcc 	%r16, 0x046d, %r7
thr1_dc_err_29:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_29), 16, 16),1,DC_DATA,26)
	.word 0xc91c2d0c  ! 368: LDDF_I	ldd	[%r16, 0x0d0c], %f4
	.word 0x8ed42339  ! 370: UMULcc_I	umulcc 	%r16, 0x0339, %r7
	.word 0x988c26d8  ! 372: ANDcc_I	andcc 	%r16, 0x06d8, %r12
	.word 0x9c2c0011  ! 372: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x92440011  ! 372: ADDC_R	addc 	%r16, %r17, %r9
	.word 0x90340011  ! 372: ORN_R	orn 	%r16, %r17, %r8
	.word 0x88942c47  ! 372: ORcc_I	orcc 	%r16, 0x0c47, %r4
	.word 0xb6042ce0  ! 372: ADD_I	add 	%r16, 0x0ce0, %r27
	.word 0xbabc0011  ! 372: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0xc51c231e  ! 373: LDDF_I	ldd	[%r16, 0x031e], %f2
thr1_irf_ce_32:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_32), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
        wr  %g0, 0x80, %asi
	.word 0x9284287d  ! 377: ADDcc_I	addcc 	%r16, 0x087d, %r9
	.word 0xb43429c4  ! 377: ORN_I	orn 	%r16, 0x09c4, %r26
	.word 0x8cbc0011  ! 377: XNORcc_R	xnorcc 	%r16, %r17, %r6
	.word 0xb0bc0011  ! 377: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0xb21c0011  ! 377: XOR_R	xor 	%r16, %r17, %r25
thr1_dc_err_30:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_30), 16, 16),1,DC_DATA,61)
	.word 0xce542484  ! 379: LDSH_I	ldsh	[%r16 + 0x0484], %r7
thr1_irf_ce_33:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_33), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xd59c1011  ! 381: LDDFA_R	ldda	[%r16, %r17], %f10
	.word 0xb41c27c9  ! 383: XOR_I	xor 	%r16, 0x07c9, %r26
	.word 0x88940011  ! 383: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x8614206f  ! 383: OR_I	or 	%r16, 0x006f, %r3
	.word 0x8c940011  ! 383: ORcc_R	orcc 	%r16, %r17, %r6
	.word 0xaa840011  ! 383: ADDcc_R	addcc 	%r16, %r17, %r21
	.word 0xa8c40011  ! 383: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0x9e042579  ! 383: ADD_I	add 	%r16, 0x0579, %r15
thr1_dc_err_31:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_31), 16, 16),1,DC_DATA,47)
	.word 0xf6d42004  ! 385: LDSHA_I	ldsha	[%r16, + 0x0004] %asi, %r27
	.word 0xf04c262d  ! 387: LDSB_I	ldsb	[%r16 + 0x062d], %r24
	.word 0x8d342001  ! 389: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x84bc24bc  ! 389: XNORcc_I	xnorcc 	%r16, 0x04bc, %r2
	.word 0x9a840011  ! 389: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x977c0411  ! 389: MOVR_R	move	%r16, %r17, %r11
	.word 0x861c29cc  ! 389: XOR_I	xor 	%r16, 0x09cc, %r3
	.word 0xf21c0011  ! 390: LDD_R	ldd	[%r16 + %r17], %r25
thr1_irf_ce_34:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_34), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xcf941011  ! 392: LDQFA_R	-	[%r16, %r17], %f7
	.word 0x861c0011  ! 394: XOR_R	xor 	%r16, %r17, %r3
	.word 0x95641811  ! 394: MOVcc_R	<illegal instruction>
	.word 0x8ebc0011  ! 394: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0xb6142221  ! 394: OR_I	or 	%r16, 0x0221, %r27
	.word 0x84042ba0  ! 394: ADD_I	add 	%r16, 0x0ba0, %r2
	.word 0xaf7c2401  ! 394: MOVR_I	move	%r16, 0xfffffe54, %r23
	.word 0xdb1c0011  ! 395: LDDF_R	ldd	[%r16, %r17], %f13
thr1_irf_ce_35:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_35), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xd2941011  ! 397: LDUHA_R	lduha	[%r16, %r17] 0x80, %r9
	.word 0x88840011  ! 399: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0xae2c21ef  ! 399: ANDN_I	andn 	%r16, 0x01ef, %r23
	.word 0x942c2860  ! 399: ANDN_I	andn 	%r16, 0x0860, %r10
	.word 0xb49c0011  ! 399: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0x869c0011  ! 399: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0x98842923  ! 399: ADDcc_I	addcc 	%r16, 0x0923, %r12
	.word 0x84040011  ! 399: ADD_R	add 	%r16, %r17, %r2
	.word 0xb81c0011  ! 399: XOR_R	xor 	%r16, %r17, %r28
thr1_dc_err_32:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_32), 16, 16),1,DC_DATA,9)
	.word 0xec9420f1  ! 401: LDUHA_I	lduha	[%r16, + 0x00f1] %asi, %r22
thr1_irf_ce_36:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_36), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
thr1_resum_intr_758:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_758), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x9e840011  ! 405: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0xbab42859  ! 405: ORNcc_I	orncc 	%r16, 0x0859, %r29
	.word 0xaa940011  ! 405: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x85643801  ! 405: MOVcc_I	<illegal instruction>
	.word 0xb89c2255  ! 405: XORcc_I	xorcc 	%r16, 0x0255, %r28
	.word 0x862c0011  ! 405: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x85641811  ! 405: MOVcc_R	<illegal instruction>
thr1_dc_err_33:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_33), 16, 16),1,DC_DATA,12)
	.word 0xec4c0000  ! 407: LDSB_R	ldsb	[%r16 + %r0], %r22
	.word 0xdd9c1011  ! 409: LDDFA_R	ldda	[%r16, %r17], %f14
	.word 0x943c0011  ! 411: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x96940011  ! 411: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0x88bc2e7e  ! 411: XNORcc_I	xnorcc 	%r16, 0x0e7e, %r4
	.word 0xb42c0011  ! 411: ANDN_R	andn 	%r16, %r17, %r26
	.word 0x981c2b85  ! 411: XOR_I	xor 	%r16, 0x0b85, %r12
	.word 0x941426d3  ! 411: OR_I	or 	%r16, 0x06d3, %r10
	.word 0x869c26fb  ! 411: XORcc_I	xorcc 	%r16, 0x06fb, %r3
	.word 0x84bc0011  ! 411: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0xf2cc1011  ! 412: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r25
thr1_irf_ce_37:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_37), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xec8c2c9c  ! 414: LDUBA_I	lduba	[%r16, + 0x0c9c] %asi, %r22
	.word 0xacb40011  ! 416: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0x89641811  ! 416: MOVcc_R	<illegal instruction>
	.word 0xaa8c0011  ! 416: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0x9a040011  ! 416: ADD_R	add 	%r16, %r17, %r13
	.word 0xab342001  ! 416: SRL_I	srl 	%r16, 0x0001, %r21
thr1_dc_err_34:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_34), 16, 16),1,DC_DATA,64)
	.word 0xf2941000  ! 418: LDUHA_R	lduha	[%r16, %r0] 0x80, %r25
	ta	T_CHANGE_HPRIV	! macro
	.word 0x981c288d  ! 422: XOR_I	xor 	%r16, 0x088d, %r12
	.word 0x8c8424cf  ! 422: ADDcc_I	addcc 	%r16, 0x04cf, %r6
	.word 0x87343001  ! 422: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x9a840011  ! 422: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0xb9641811  ! 422: MOVcc_R	<illegal instruction>
	.word 0x8f643801  ! 422: MOVcc_I	<illegal instruction>
	.word 0xd5040011  ! 423: LDF_R	ld	[%r16, %r17], %f10
	.word 0xc3841011  ! 425: LDFA_R	lda	[%r16, %r17], %f1
	.word 0x832c0011  ! 427: SLL_R	sll 	%r16, %r17, %r1
	.word 0x982c21bf  ! 427: ANDN_I	andn 	%r16, 0x01bf, %r12
	.word 0xac342c8c  ! 427: ORN_I	orn 	%r16, 0x0c8c, %r22
	.word 0x96ac0011  ! 427: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0xb0140011  ! 427: OR_R	or 	%r16, %r17, %r24
	.word 0xb37c2401  ! 427: MOVR_I	move	%r16, 0xfffffe54, %r25
thr1_dc_err_35:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_35), 16, 16),1,DC_DATA,54)
	.word 0xda040000  ! 429: LDUW_R	lduw	[%r16 + %r0], %r13
thr1_irf_ce_38:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_38), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xec94201e  ! 431: LDUHA_I	lduha	[%r16, + 0x001e] %asi, %r22
	.word 0x852c2001  ! 433: SLL_I	sll 	%r16, 0x0001, %r2
	.word 0xaebc0011  ! 433: XNORcc_R	xnorcc 	%r16, %r17, %r23
	.word 0x9e440011  ! 433: ADDC_R	addc 	%r16, %r17, %r15
	.word 0xb8340011  ! 433: ORN_R	orn 	%r16, %r17, %r28
	.word 0xba3c24e8  ! 433: XNOR_I	xnor 	%r16, 0x04e8, %r29
	.word 0xb89c0011  ! 433: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0xbb7c2401  ! 433: MOVR_I	move	%r16, 0xfffffe54, %r29
thr1_dc_err_36:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_36), 16, 16),1,DC_DATA,26)
	.word 0xd2440000  ! 435: LDSW_R	ldsw	[%r16 + %r0], %r9
thr1_irf_ce_39:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_39), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xd2dc29ec  ! 437: LDXA_I	ldxa	[%r16, + 0x09ec] %asi, %r9
	.word 0x9d7c2401  ! 439: MOVR_I	move	%r16, 0xfffffe54, %r14
	.word 0xaf340011  ! 439: SRL_R	srl 	%r16, %r17, %r23
	.word 0x849c0011  ! 439: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0x929c2104  ! 439: XORcc_I	xorcc 	%r16, 0x0104, %r9
	.word 0x8cc40011  ! 439: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x94c40011  ! 439: ADDCcc_R	addccc 	%r16, %r17, %r10
thr1_dc_err_37:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_37), 16, 16),1,DC_DATA,5)
	.word 0xca5c2e5e  ! 441: LDX_I	ldx	[%r16 + 0x0e5e], %r5
	.word 0xe8442e1f  ! 443: LDSW_I	ldsw	[%r16 + 0x0e1f], %r20
	.word 0xb8842b05  ! 445: ADDcc_I	addcc 	%r16, 0x0b05, %r28
	.word 0xa80c241e  ! 445: AND_I	and 	%r16, 0x041e, %r20
	.word 0xb61c0011  ! 445: XOR_R	xor 	%r16, %r17, %r27
	.word 0x853c2001  ! 445: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0x96b423a2  ! 445: ORNcc_I	orncc 	%r16, 0x03a2, %r11
	.word 0x837c2401  ! 445: MOVR_I	move	%r16, 0xfffffe54, %r1
	.word 0x99341011  ! 445: SRLX_R	srlx	%r16, %r17, %r12
thr1_dc_err_38:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_38), 16, 16),1,DC_DATA,67)
	.word 0xeed42761  ! 447: LDSHA_I	ldsha	[%r16, + 0x0761] %asi, %r23
	return     %r18 + 0x28
	.word 0xba9c2a19  ! 450: XORcc_I	xorcc 	%r16, 0x0a19, %r29
	.word 0x853c2001  ! 450: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0xb4940011  ! 450: ORcc_R	orcc 	%r16, %r17, %r26
	.word 0x992c3001  ! 450: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x8e9c2b41  ! 450: XORcc_I	xorcc 	%r16, 0x0b41, %r7
	.word 0xae8c0011  ! 450: ANDcc_R	andcc 	%r16, %r17, %r23
	.word 0x848421a0  ! 450: ADDcc_I	addcc 	%r16, 0x01a0, %r2
	.word 0x97340011  ! 450: SRL_R	srl 	%r16, %r17, %r11
thr1_dc_err_39:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_39), 16, 16),1,DC_DATA,39)
	.word 0xe79c1000  ! 452: LDDFA_R	ldda	[%r16, %r0], %f19
thr1_irf_ce_40:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_40), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xd9841011  ! 454: LDFA_R	lda	[%r16, %r17], %f12
	.word 0x8e1c2418  ! 456: XOR_I	xor 	%r16, 0x0418, %r7
	.word 0xb97c2401  ! 456: MOVR_I	move	%r16, 0xfffffe54, %r28
	.word 0x97641811  ! 456: MOVcc_R	<illegal instruction>
	.word 0x84c40011  ! 456: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x988c28f2  ! 456: ANDcc_I	andcc 	%r16, 0x08f2, %r12
	.word 0x84ac269c  ! 456: ANDNcc_I	andncc 	%r16, 0x069c, %r2
	.word 0x869c2d9a  ! 456: XORcc_I	xorcc 	%r16, 0x0d9a, %r3
	.word 0xd40c2dd7  ! 457: LDUB_I	ldub	[%r16 + 0x0dd7], %r10
	.word 0xc7941011  ! 459: LDQFA_R	-	[%r16, %r17], %f3
	.word 0x86342408  ! 461: ORN_I	orn 	%r16, 0x0408, %r3
	.word 0x8c3c2ebb  ! 461: XNOR_I	xnor 	%r16, 0x0ebb, %r6
	.word 0x94142ae8  ! 461: OR_I	or 	%r16, 0x0ae8, %r10
	.word 0xb8140011  ! 461: OR_R	or 	%r16, %r17, %r28
	.word 0xb62c0011  ! 461: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x9d2c1011  ! 461: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x8f641811  ! 461: MOVcc_R	<illegal instruction>
	.word 0x9e9424b8  ! 461: ORcc_I	orcc 	%r16, 0x04b8, %r15
thr1_dc_err_40:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_40), 16, 16),1,DC_DATA,56)
	.word 0xd71c0000  ! 463: LDDF_R	ldd	[%r16, %r0], %f11
thr1_irf_ce_41:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_41), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xc2842f5d  ! 465: LDUWA_I	lduwa	[%r16, + 0x0f5d] %asi, %r1
	.word 0xb40c0011  ! 467: AND_R	and 	%r16, %r17, %r26
	.word 0xb6342b40  ! 467: ORN_I	orn 	%r16, 0x0b40, %r27
	.word 0x92b42afe  ! 467: ORNcc_I	orncc 	%r16, 0x0afe, %r9
	.word 0xb3342001  ! 467: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x97641811  ! 467: MOVcc_R	<illegal instruction>
	.word 0x960c2c3f  ! 467: AND_I	and 	%r16, 0x0c3f, %r11
	.word 0xbb341011  ! 467: SRLX_R	srlx	%r16, %r17, %r29
	.word 0x8b3c1011  ! 467: SRAX_R	srax	%r16, %r17, %r5
	.word 0xd09c2adc  ! 468: LDDA_I	ldda	[%r16, + 0x0adc] %asi, %r8
!Illinst store
	.word 0xf6240011  ! 470: STW_R	stw	%r27, [%r16 + %r17]
	.word 0x9f342001  ! 472: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x82bc0011  ! 472: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0xab2c0011  ! 472: SLL_R	sll 	%r16, %r17, %r21
	.word 0x98c40011  ! 472: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x9c34297e  ! 472: ORN_I	orn 	%r16, 0x097e, %r14
	.word 0x96442340  ! 472: ADDC_I	addc 	%r16, 0x0340, %r11
	.word 0xd6142057  ! 473: LDUH_I	lduh	[%r16 + 0x0057], %r11
thr1_irf_ce_42:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_42), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0x84d40011  ! 475: UMULcc_R	umulcc 	%r16, %r17, %r2
	.word 0x957c0411  ! 477: MOVR_R	move	%r16, %r17, %r10
	.word 0x8f2c3001  ! 477: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x900c0011  ! 477: AND_R	and 	%r16, %r17, %r8
	.word 0x9c3c0011  ! 477: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x8c0428aa  ! 477: ADD_I	add 	%r16, 0x08aa, %r6
	.word 0xa9340011  ! 477: SRL_R	srl 	%r16, %r17, %r20
	.word 0x92ac2f67  ! 477: ANDNcc_I	andncc 	%r16, 0x0f67, %r9
	.word 0xde1c246b  ! 478: LDD_I	ldd	[%r16 + 0x046b], %r15
	.word 0xd2042b7b  ! 480: LDUW_I	lduw	[%r16 + 0x0b7b], %r9
	.word 0x99342001  ! 482: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x873c0011  ! 482: SRA_R	sra 	%r16, %r17, %r3
	.word 0x8a042b02  ! 482: ADD_I	add 	%r16, 0x0b02, %r5
	.word 0x87341011  ! 482: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x863c0011  ! 482: XNOR_R	xnor 	%r16, %r17, %r3
	.word 0xcf841011  ! 483: LDFA_R	lda	[%r16, %r17], %f7
	.word 0xf24c287f  ! 485: LDSB_I	ldsb	[%r16 + 0x087f], %r25
	.word 0x9c1427f5  ! 487: OR_I	or 	%r16, 0x07f5, %r14
	.word 0xb69c0011  ! 487: XORcc_R	xorcc 	%r16, %r17, %r27
	.word 0xb8bc2c4a  ! 487: XNORcc_I	xnorcc 	%r16, 0x0c4a, %r28
	.word 0x90bc0011  ! 487: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0xae2c2af8  ! 487: ANDN_I	andn 	%r16, 0x0af8, %r23
	.word 0x8c8c0011  ! 487: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0x957c2401  ! 488: MOVR_I	move	%r16, 0xfffffe54, %r10
	.word 0x8eb423ea  ! 488: ORNcc_I	orncc 	%r16, 0x03ea, %r7
	.word 0x892c1011  ! 488: SLLX_R	sllx	%r16, %r17, %r4
	.word 0x8abc0011  ! 488: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0xb0940011  ! 488: ORcc_R	orcc 	%r16, %r17, %r24
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xcb841011  ! 488: LDFA_R	lda	[%r16, %r17], %f5
thr1_irf_ce_43:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_43), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	jmpl     %r18 + 0x28, %r31
	.word 0xb73c1011  ! 491: SRAX_R	srax	%r16, %r17, %r27
	.word 0x88ac0011  ! 491: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0xb6ac266b  ! 491: ANDNcc_I	andncc 	%r16, 0x066b, %r27
	.word 0x88140011  ! 491: OR_R	or 	%r16, %r17, %r4
	.word 0x9e140011  ! 491: OR_R	or 	%r16, %r17, %r15
	.word 0x912c3001  ! 491: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x90bc2a0b  ! 491: XNORcc_I	xnorcc 	%r16, 0x0a0b, %r8
thr1_dc_err_41:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_41), 16, 16),1,DC_DATA,4)
	.word 0xd0841000  ! 493: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r8
	.word 0xa9e40011  ! 495: SAVE_R	save	%r16, %r17, %r20
	.word 0xb62c0011  ! 497: ANDN_R	andn 	%r16, %r17, %r27
	.word 0xa62c0011  ! 497: ANDN_R	andn 	%r16, %r17, %r19
	.word 0x983421d4  ! 497: ORN_I	orn 	%r16, 0x01d4, %r12
	.word 0x923c26d7  ! 497: XNOR_I	xnor 	%r16, 0x06d7, %r9
	.word 0xae040011  ! 497: ADD_R	add 	%r16, %r17, %r23
	.word 0xda941011  ! 498: LDUHA_R	lduha	[%r16, %r17] 0x80, %r13
	.word 0xc8dc1011  ! 500: LDXA_R	ldxa	[%r16, %r17] 0x80, %r4
	.word 0xb1641811  ! 502: MOVcc_R	<illegal instruction>
	.word 0x8a1c0011  ! 502: XOR_R	xor 	%r16, %r17, %r5
	.word 0xb004292b  ! 502: ADD_I	add 	%r16, 0x092b, %r24
	.word 0xaec40011  ! 502: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0x92142c00  ! 502: OR_I	or 	%r16, 0x0c00, %r9
	.word 0xac3c0011  ! 502: XNOR_R	xnor 	%r16, %r17, %r22
	.word 0x877c0411  ! 502: MOVR_R	move	%r16, %r17, %r3
thr1_dc_err_42:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_42), 16, 16),1,DC_DATA,55)
	.word 0xd25421ff  ! 504: LDSH_I	ldsh	[%r16 + 0x01ff], %r9
	.word 0xc28c1011  ! 506: LDUBA_R	lduba	[%r16, %r17] 0x80, %r1
	.word 0x82b40011  ! 508: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x973c1011  ! 508: SRAX_R	srax	%r16, %r17, %r11
	.word 0x877c2401  ! 508: MOVR_I	move	%r16, 0xfffffe54, %r3
	.word 0xad2c2001  ! 508: SLL_I	sll 	%r16, 0x0001, %r22
	.word 0xb8bc0011  ! 508: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0xb7643801  ! 508: MOVcc_I	<illegal instruction>
	.word 0x9cbc2615  ! 508: XNORcc_I	xnorcc 	%r16, 0x0615, %r14
	.word 0x943c0011  ! 508: XNOR_R	xnor 	%r16, %r17, %r10
thr1_dc_err_43:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_43), 16, 16),1,DC_DATA,3)
	.word 0xd51c2aad  ! 510: LDDF_I	ldd	[%r16, 0x0aad], %f10
thr1_irf_ce_44:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_44), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xef1c0011  ! 512: LDDF_R	ldd	[%r16, %r17], %f23
	.word 0x9e0c2053  ! 514: AND_I	and 	%r16, 0x0053, %r15
	.word 0xaf643801  ! 514: MOVcc_I	<illegal instruction>
	.word 0xb82c0011  ! 514: ANDN_R	andn 	%r16, %r17, %r28
	.word 0xa61c2dc9  ! 514: XOR_I	xor 	%r16, 0x0dc9, %r19
	.word 0x9c940011  ! 514: ORcc_R	orcc 	%r16, %r17, %r14
	.word 0x957c0411  ! 514: MOVR_R	move	%r16, %r17, %r10
	.word 0x823c0011  ! 514: XNOR_R	xnor 	%r16, %r17, %r1
	.word 0x8cb40011  ! 514: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0xc6dc2947  ! 515: LDXA_I	ldxa	[%r16, + 0x0947] %asi, %r3
	.word 0xcf140011  ! 517: LDQF_R	-	[%r16, %r17], %f7
	.word 0xb8840011  ! 519: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0xaf3c2001  ! 519: SRA_I	sra 	%r16, 0x0001, %r23
	.word 0x949c0011  ! 519: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0xb02c0011  ! 519: ANDN_R	andn 	%r16, %r17, %r24
	.word 0xb1340011  ! 519: SRL_R	srl 	%r16, %r17, %r24
	.word 0xacc40011  ! 519: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0x852c1011  ! 519: SLLX_R	sllx	%r16, %r17, %r2
	.word 0xa80c0011  ! 519: AND_R	and 	%r16, %r17, %r20
	.word 0xccdc1011  ! 520: LDXA_R	ldxa	[%r16, %r17] 0x80, %r6
thr1_irf_ce_45:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_45), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xd5941011  ! 522: LDQFA_R	-	[%r16, %r17], %f10
	.word 0x9414212f  ! 524: OR_I	or 	%r16, 0x012f, %r10
	.word 0x8c8c23dd  ! 524: ANDcc_I	andcc 	%r16, 0x03dd, %r6
	.word 0x8e0c2860  ! 524: AND_I	and 	%r16, 0x0860, %r7
	.word 0x920c2bce  ! 524: AND_I	and 	%r16, 0x0bce, %r9
	.word 0xba942c50  ! 524: ORcc_I	orcc 	%r16, 0x0c50, %r29
thr1_dc_err_44:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_44), 16, 16),1,DC_DATA,9)
	.word 0xf6140000  ! 526: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xd5040011  ! 528: LDF_R	ld	[%r16, %r17], %f10
	.word 0x883c0011  ! 530: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0xacc42785  ! 530: ADDCcc_I	addccc 	%r16, 0x0785, %r22
	.word 0xb88c0011  ! 530: ANDcc_R	andcc 	%r16, %r17, %r28
	.word 0x8a04291e  ! 530: ADD_I	add 	%r16, 0x091e, %r5
	.word 0xb5643801  ! 530: MOVcc_I	<illegal instruction>
thr1_dc_err_45:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_45), 16, 16),1,DC_DATA,1)
	.word 0xe9040000  ! 532: LDF_R	ld	[%r16, %r0], %f20
	.word 0xcedc1011  ! 534: LDXA_R	ldxa	[%r16, %r17] 0x80, %r7
	.word 0x97643801  ! 536: MOVcc_I	<illegal instruction>
	.word 0x913c0011  ! 536: SRA_R	sra 	%r16, %r17, %r8
	.word 0xaaac0011  ! 536: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0x8a8c0011  ! 536: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0x9d2c0011  ! 536: SLL_R	sll 	%r16, %r17, %r14
	.word 0x948c0011  ! 536: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0xb63c0011  ! 536: XNOR_R	xnor 	%r16, %r17, %r27
	.word 0xe89c1011  ! 537: LDDA_R	ldda	[%r16, %r17] 0x80, %r20
thr1_irf_ce_46:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_46), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xe9841011  ! 539: LDFA_R	lda	[%r16, %r17], %f20
	.word 0x88940011  ! 541: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0x9e842d8b  ! 541: ADDcc_I	addcc 	%r16, 0x0d8b, %r15
	.word 0xb61c26cf  ! 541: XOR_I	xor 	%r16, 0x06cf, %r27
	.word 0x86340011  ! 541: ORN_R	orn 	%r16, %r17, %r3
	.word 0x83340011  ! 541: SRL_R	srl 	%r16, %r17, %r1
	.word 0x8e2c24e3  ! 541: ANDN_I	andn 	%r16, 0x04e3, %r7
	.word 0xba440011  ! 541: ADDC_R	addc 	%r16, %r17, %r29
	.word 0x9b2c3001  ! 541: SLLX_I	sllx	%r16, 0x0001, %r13
thr1_dc_err_46:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_46), 16, 16),1,DC_DATA,64)
	.word 0xd09c2fb7  ! 543: LDDA_I	ldda	[%r16, + 0x0fb7] %asi, %r8
!Illinst store
	.word 0xc6340011  ! 545: STH_R	sth	%r3, [%r16 + %r17]
	.word 0x9d3c1011  ! 547: SRAX_R	srax	%r16, %r17, %r14
	.word 0x82c40011  ! 547: ADDCcc_R	addccc 	%r16, %r17, %r1
	.word 0xb684222c  ! 547: ADDcc_I	addcc 	%r16, 0x022c, %r27
	.word 0x92340011  ! 547: ORN_R	orn 	%r16, %r17, %r9
	.word 0x8c942eeb  ! 547: ORcc_I	orcc 	%r16, 0x0eeb, %r6
	.word 0x9a9c2080  ! 547: XORcc_I	xorcc 	%r16, 0x0080, %r13
thr1_dc_err_47:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_47), 16, 16),1,DC_DATA,20)
	.word 0xd2440000  ! 549: LDSW_R	ldsw	[%r16 + %r0], %r9
thr1_irf_ce_47:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_47), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xed042d92  ! 551: LDF_I	ld	[%r16, 0x0d92], %f22
	.word 0x9a442f48  ! 553: ADDC_I	addc 	%r16, 0x0f48, %r13
	.word 0xb9343001  ! 553: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0x9c3c20cc  ! 553: XNOR_I	xnor 	%r16, 0x00cc, %r14
	.word 0xb0840011  ! 553: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0x852c1011  ! 553: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x828c0011  ! 553: ANDcc_R	andcc 	%r16, %r17, %r1
	.word 0xb1341011  ! 553: SRLX_R	srlx	%r16, %r17, %r24
thr1_dc_err_48:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_48), 16, 16),1,DC_DATA,17)
	.word 0xd61c22c3  ! 555: LDD_I	ldd	[%r16 + 0x02c3], %r11
	.word 0xd51c0011  ! 557: LDDF_R	ldd	[%r16, %r17], %f10
	.word 0x9ab42d7d  ! 559: ORNcc_I	orncc 	%r16, 0x0d7d, %r13
	.word 0xb29c23b6  ! 559: XORcc_I	xorcc 	%r16, 0x03b6, %r25
	.word 0x87641811  ! 559: MOVcc_R	<illegal instruction>
	.word 0xa8b40011  ! 559: ORNcc_R	orncc 	%r16, %r17, %r20
	.word 0x90ac25c4  ! 559: ANDNcc_I	andncc 	%r16, 0x05c4, %r8
	.word 0x872c0011  ! 559: SLL_R	sll 	%r16, %r17, %r3
	.word 0x9b641811  ! 559: MOVcc_R	<illegal instruction>
	.word 0xb4b40011  ! 559: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0xd1841011  ! 560: LDFA_R	lda	[%r16, %r17], %f8
thr1_irf_ce_48:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_48), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xd21c2e7e  ! 562: LDD_I	ldd	[%r16 + 0x0e7e], %r9
	.word 0x989c225e  ! 564: XORcc_I	xorcc 	%r16, 0x025e, %r12
	.word 0x98342356  ! 564: ORN_I	orn 	%r16, 0x0356, %r12
	.word 0xb6940011  ! 564: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x9abc2692  ! 564: XNORcc_I	xnorcc 	%r16, 0x0692, %r13
	.word 0x8e3c0011  ! 564: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xb6ac2b4f  ! 564: ANDNcc_I	andncc 	%r16, 0x0b4f, %r27
	.word 0x9c0c0011  ! 564: AND_R	and 	%r16, %r17, %r14
	.word 0xa6bc0011  ! 564: XNORcc_R	xnorcc 	%r16, %r17, %r19
thr1_dc_err_49:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_49), 16, 16),1,DC_DATA,58)
	.word 0xeacc27c8  ! 566: LDSBA_I	ldsba	[%r16, + 0x07c8] %asi, %r21
	.word 0x8143c000  ! 568: STBAR	stbar
	.word 0x92bc0011  ! 570: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x8f343001  ! 570: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x8c442fea  ! 570: ADDC_I	addc 	%r16, 0x0fea, %r6
	.word 0xb2b40011  ! 570: ORNcc_R	orncc 	%r16, %r17, %r25
	.word 0xb72c1011  ! 570: SLLX_R	sllx	%r16, %r17, %r27
	.word 0x893c0011  ! 570: SRA_R	sra 	%r16, %r17, %r4
thr1_dc_err_50:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_50), 16, 16),1,DC_DATA,12)
	.word 0xdf1c0000  ! 572: LDDF_R	ldd	[%r16, %r0], %f15
thr1_irf_ce_49:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_49), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0x83ec0011  ! 574: RESTORE_R	restore	%r16, %r17, %r1
	.word 0xb4042f6a  ! 576: ADD_I	add 	%r16, 0x0f6a, %r26
	.word 0xb4140011  ! 576: OR_R	or 	%r16, %r17, %r26
	.word 0x8eb42df6  ! 576: ORNcc_I	orncc 	%r16, 0x0df6, %r7
	.word 0xaf641811  ! 576: MOVcc_R	<illegal instruction>
	.word 0x8c8c0011  ! 576: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0x9c440011  ! 576: ADDC_R	addc 	%r16, %r17, %r14
	.word 0xb6bc2fc4  ! 576: XNORcc_I	xnorcc 	%r16, 0x0fc4, %r27
thr1_dc_err_51:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_51), 16, 16),1,DC_DATA,68)
	.word 0xd6cc25d5  ! 578: LDSBA_I	ldsba	[%r16, + 0x05d5] %asi, %r11
	.word 0xf51c0011  ! 580: LDDF_R	ldd	[%r16, %r17], %f26
	.word 0xb7342001  ! 582: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xb12c3001  ! 582: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0x9a042f31  ! 582: ADD_I	add 	%r16, 0x0f31, %r13
	.word 0xbb7c2401  ! 582: MOVR_I	move	%r16, 0xfffffe54, %r29
	.word 0x8a440011  ! 582: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x9a8c0011  ! 582: ANDcc_R	andcc 	%r16, %r17, %r13
	.word 0xb5343001  ! 582: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0xf9140011  ! 583: LDQF_R	-	[%r16, %r17], %f28
thr1_irf_ce_50:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_50), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xc3140011  ! 585: LDQF_R	-	[%r16, %r17], %f1
	.word 0xbac40011  ! 587: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0xad342001  ! 587: SRL_I	srl 	%r16, 0x0001, %r22
	.word 0xb62c0011  ! 587: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x92bc2792  ! 587: XNORcc_I	xnorcc 	%r16, 0x0792, %r9
	.word 0x89341011  ! 587: SRLX_R	srlx	%r16, %r17, %r4
thr1_dc_err_52:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_52), 16, 16),1,DC_DATA,66)
	.word 0xd70425a2  ! 589: LDF_I	ld	[%r16, 0x05a2], %f11
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d341011  ! 593: SRLX_R	srlx	%r16, %r17, %r6
	.word 0x82bc0011  ! 593: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0xb42c214e  ! 593: ANDN_I	andn 	%r16, 0x014e, %r26
	.word 0x8c8c0011  ! 593: ANDcc_R	andcc 	%r16, %r17, %r6
	.word 0x96ac2884  ! 593: ANDNcc_I	andncc 	%r16, 0x0884, %r11
thr1_dc_err_53:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_53), 16, 16),1,DC_DATA,47)
	.word 0xecd42f8b  ! 595: LDSHA_I	ldsha	[%r16, + 0x0f8b] %asi, %r22
thr1_irf_ce_51:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_51), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xc5841011  ! 597: LDFA_R	lda	[%r16, %r17], %f2
	.word 0x9b2c1011  ! 599: SLLX_R	sllx	%r16, %r17, %r13
	.word 0x923c0011  ! 599: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0xba2c24eb  ! 599: ANDN_I	andn 	%r16, 0x04eb, %r29
	.word 0x88b40011  ! 599: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0xaa0c0011  ! 599: AND_R	and 	%r16, %r17, %r21
	.word 0x841c2205  ! 599: XOR_I	xor 	%r16, 0x0205, %r2
thr1_dc_err_54:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_54), 16, 16),1,DC_DATA,21)
	.word 0xd2942c5c  ! 601: LDUHA_I	lduha	[%r16, + 0x0c5c] %asi, %r9
	.word 0xdcc424ee  ! 603: LDSWA_I	ldswa	[%r16, + 0x04ee] %asi, %r14
	.word 0x942c0011  ! 605: ANDN_R	andn 	%r16, %r17, %r10
	.word 0x9834208c  ! 605: ORN_I	orn 	%r16, 0x008c, %r12
	.word 0xaab40011  ! 605: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0xab7c2401  ! 605: MOVR_I	move	%r16, 0xfffffe54, %r21
	.word 0x99342001  ! 605: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x840c0011  ! 605: AND_R	and 	%r16, %r17, %r2
	.word 0xad2c2001  ! 605: SLL_I	sll 	%r16, 0x0001, %r22
	.word 0x82c423e0  ! 605: ADDCcc_I	addccc 	%r16, 0x03e0, %r1
thr1_dc_err_55:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_55), 16, 16),1,DC_DATA,49)
	.word 0xc3841000  ! 607: LDFA_R	lda	[%r16, %r0], %f1
thr1_irf_ce_52:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_52), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xc23421f9  ! 611: STH_I	sth	%r1, [%r16 + 0x01f9]
	.word 0x869c2f4e  ! 613: XORcc_I	xorcc 	%r16, 0x0f4e, %r3
	.word 0xb2340011  ! 613: ORN_R	orn 	%r16, %r17, %r25
	.word 0x8a8c2823  ! 613: ANDcc_I	andcc 	%r16, 0x0823, %r5
	.word 0x840c2ba0  ! 613: AND_I	and 	%r16, 0x0ba0, %r2
	.word 0x957c2401  ! 613: MOVR_I	move	%r16, 0xfffffe54, %r10
	.word 0x90842221  ! 613: ADDcc_I	addcc 	%r16, 0x0221, %r8
	.word 0xf4d41011  ! 614: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r26
	.word 0xeb040011  ! 616: LDF_R	ld	[%r16, %r17], %f21
	.word 0xb8940011  ! 618: ORcc_R	orcc 	%r16, %r17, %r28
	.word 0xbb643801  ! 618: MOVcc_I	<illegal instruction>
	.word 0xaec40011  ! 618: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0xb5341011  ! 618: SRLX_R	srlx	%r16, %r17, %r26
	.word 0x9a3c0011  ! 618: XNOR_R	xnor 	%r16, %r17, %r13
	.word 0x95342001  ! 618: SRL_I	srl 	%r16, 0x0001, %r10
	.word 0x99643801  ! 618: MOVcc_I	<illegal instruction>
	.word 0x9484251f  ! 618: ADDcc_I	addcc 	%r16, 0x051f, %r10
thr1_dc_err_56:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_56), 16, 16),1,DC_DATA,71)
	.word 0xf88c2af0  ! 620: LDUBA_I	lduba	[%r16, + 0x0af0] %asi, %r28
	.word 0xb05c2357  ! 622: SMUL_I	smul 	%r16, 0x0357, %r24
	.word 0x8f342001  ! 624: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0x8e042560  ! 624: ADD_I	add 	%r16, 0x0560, %r7
	.word 0xb9641811  ! 624: MOVcc_R	<illegal instruction>
	.word 0xb89c0011  ! 624: XORcc_R	xorcc 	%r16, %r17, %r28
	.word 0xac8c2ea2  ! 624: ANDcc_I	andcc 	%r16, 0x0ea2, %r22
	.word 0xa92c2001  ! 624: SLL_I	sll 	%r16, 0x0001, %r20
	.word 0xa8b40011  ! 624: ORNcc_R	orncc 	%r16, %r17, %r20
	.word 0x8f3c1011  ! 624: SRAX_R	srax	%r16, %r17, %r7
	.word 0xeb941011  ! 625: LDQFA_R	-	[%r16, %r17], %f21
thr1_irf_ce_53:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_53), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
        wr %g0, 0x4, %fprs
	.word 0x8a8c0011  ! 629: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0xa89c2162  ! 629: XORcc_I	xorcc 	%r16, 0x0162, %r20
	.word 0xa84424d1  ! 629: ADDC_I	addc 	%r16, 0x04d1, %r20
	.word 0x952c3001  ! 629: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x90ac0011  ! 629: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x9e3c25a8  ! 629: XNOR_I	xnor 	%r16, 0x05a8, %r15
	.word 0x992c2001  ! 629: SLL_I	sll 	%r16, 0x0001, %r12
thr1_dc_err_57:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_57), 16, 16),1,DC_DATA,55)
	.word 0xdec41000  ! 631: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r15
thr1_irf_ce_54:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_54), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xe8042dca  ! 633: LDUW_I	lduw	[%r16 + 0x0dca], %r20
	.word 0xa68c24a4  ! 635: ANDcc_I	andcc 	%r16, 0x04a4, %r19
	.word 0x82ac28c3  ! 635: ANDNcc_I	andncc 	%r16, 0x08c3, %r1
	.word 0xb8ac2a8c  ! 635: ANDNcc_I	andncc 	%r16, 0x0a8c, %r28
	.word 0xba1c0011  ! 635: XOR_R	xor 	%r16, %r17, %r29
	.word 0x969c2731  ! 635: XORcc_I	xorcc 	%r16, 0x0731, %r11
	.word 0x84bc241b  ! 635: XNORcc_I	xnorcc 	%r16, 0x041b, %r2
	.word 0xbb2c0011  ! 635: SLL_R	sll 	%r16, %r17, %r29
	.word 0xc8540011  ! 636: LDSH_R	ldsh	[%r16 + %r17], %r4
thr1_irf_ce_55:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_55), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0x8140c000  ! 638: RDASI	stbar
	.word 0xae042d75  ! 640: ADD_I	add 	%r16, 0x0d75, %r23
	.word 0x8f2c0011  ! 640: SLL_R	sll 	%r16, %r17, %r7
	.word 0xaac40011  ! 640: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0x902c0011  ! 640: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x89342001  ! 640: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x868c275a  ! 640: ANDcc_I	andcc 	%r16, 0x075a, %r3
thr1_dc_err_58:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_58), 16, 16),1,DC_DATA,15)
	.word 0xcc8c22b4  ! 642: LDUBA_I	lduba	[%r16, + 0x02b4] %asi, %r6
	.word 0xeadc1011  ! 644: LDXA_R	ldxa	[%r16, %r17] 0x80, %r21
	.word 0x873c0011  ! 646: SRA_R	sra 	%r16, %r17, %r3
	.word 0xa83c0011  ! 646: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0x9d3c1011  ! 646: SRAX_R	srax	%r16, %r17, %r14
	.word 0x93340011  ! 646: SRL_R	srl 	%r16, %r17, %r9
	.word 0x8c2c2615  ! 646: ANDN_I	andn 	%r16, 0x0615, %r6
	.word 0x96c42787  ! 646: ADDCcc_I	addccc 	%r16, 0x0787, %r11
	.word 0x8b2c2001  ! 646: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0xb62c2e79  ! 646: ANDN_I	andn 	%r16, 0x0e79, %r27
	.word 0xd44c0011  ! 647: LDSB_R	ldsb	[%r16 + %r17], %r10
        wr %g0, 0x4, %fprs
	.word 0x8d343001  ! 651: SRLX_I	srlx	%r16, 0x0001, %r6
	.word 0x9c042fff  ! 651: ADD_I	add 	%r16, 0x0fff, %r14
	.word 0x9cac25d5  ! 651: ANDNcc_I	andncc 	%r16, 0x05d5, %r14
	.word 0x96040011  ! 651: ADD_R	add 	%r16, %r17, %r11
	.word 0x90940011  ! 651: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0xb43c0011  ! 651: XNOR_R	xnor 	%r16, %r17, %r26
thr1_dc_err_59:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_59), 16, 16),1,DC_DATA,3)
	.word 0xcb941000  ! 653: LDQFA_R	-	[%r16, %r0], %f5
	.word 0x28800004  ! 655: BLEU	bleu,a	<label_0x4>
	.word 0x86442c9e  ! 657: ADDC_I	addc 	%r16, 0x0c9e, %r3
	.word 0x97340011  ! 657: SRL_R	srl 	%r16, %r17, %r11
	.word 0xaf7c2401  ! 657: MOVR_I	move	%r16, 0xfffffe54, %r23
	.word 0x8e1c2de3  ! 657: XOR_I	xor 	%r16, 0x0de3, %r7
	.word 0xb3342001  ! 657: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x883c27ee  ! 657: XNOR_I	xnor 	%r16, 0x07ee, %r4
	.word 0xb0142b43  ! 658: OR_I	or 	%r16, 0x0b43, %r24
	.word 0x949425e3  ! 658: ORcc_I	orcc 	%r16, 0x05e3, %r10
	.word 0x8d2c1011  ! 658: SLLX_R	sllx	%r16, %r17, %r6
	.word 0xb2ac0011  ! 658: ANDNcc_R	andncc 	%r16, %r17, %r25
	.word 0xb80c0011  ! 658: AND_R	and 	%r16, %r17, %r28
	.word 0xa8440011  ! 658: ADDC_R	addc 	%r16, %r17, %r20
	.word 0xb93c1011  ! 658: SRAX_R	srax	%r16, %r17, %r28
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xf8d41011  ! 658: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r28
thr1_irf_ce_56:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_56), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	return     %r18 + %r17
	.word 0x8c8c20b7  ! 661: ANDcc_I	andcc 	%r16, 0x00b7, %r6
	.word 0x8e140011  ! 661: OR_R	or 	%r16, %r17, %r7
	.word 0x949c2b4d  ! 661: XORcc_I	xorcc 	%r16, 0x0b4d, %r10
	.word 0x83342001  ! 661: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x8a0421e3  ! 661: ADD_I	add 	%r16, 0x01e3, %r5
	.word 0x989c2ff3  ! 661: XORcc_I	xorcc 	%r16, 0x0ff3, %r12
	.word 0x928c2ef9  ! 661: ANDcc_I	andcc 	%r16, 0x0ef9, %r9
	.word 0x86c40011  ! 661: ADDCcc_R	addccc 	%r16, %r17, %r3
	.word 0xf3941011  ! 662: LDQFA_R	-	[%r16, %r17], %f25
thr1_irf_ce_57:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_57), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xcd1c2704  ! 664: LDDF_I	ldd	[%r16, 0x0704], %f6
	.word 0x89341011  ! 666: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x90142de5  ! 666: OR_I	or 	%r16, 0x0de5, %r8
	.word 0x9d7c0411  ! 666: MOVR_R	move	%r16, %r17, %r14
	.word 0x90940011  ! 666: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x8e940011  ! 666: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0xb7343001  ! 666: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0xcc140011  ! 667: LDUH_R	lduh	[%r16 + %r17], %r6
thr1_irf_ce_58:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_58), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xca742e01  ! 671: STX_I	stx	%r5, [%r16 + 0x0e01]
	.word 0x8d643801  ! 673: MOVcc_I	<illegal instruction>
	.word 0x82040011  ! 673: ADD_R	add 	%r16, %r17, %r1
	.word 0xa93c0011  ! 673: SRA_R	sra 	%r16, %r17, %r20
	.word 0x88b40011  ! 673: ORNcc_R	orncc 	%r16, %r17, %r4
	.word 0x9b341011  ! 673: SRLX_R	srlx	%r16, %r17, %r13
	.word 0xb0c42ad4  ! 673: ADDCcc_I	addccc 	%r16, 0x0ad4, %r24
	.word 0x8b2c1011  ! 673: SLLX_R	sllx	%r16, %r17, %r5
	.word 0xe71c2dae  ! 674: LDDF_I	ldd	[%r16, 0x0dae], %f19
	.word 0xce4c2d76  ! 676: LDSB_I	ldsb	[%r16 + 0x0d76], %r7
	.word 0xb4040011  ! 678: ADD_R	add 	%r16, %r17, %r26
	.word 0xaa1425ef  ! 678: OR_I	or 	%r16, 0x05ef, %r21
	.word 0x82bc0011  ! 678: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x849c0011  ! 678: XORcc_R	xorcc 	%r16, %r17, %r2
	.word 0xae3c0011  ! 678: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0xae842133  ! 678: ADDcc_I	addcc 	%r16, 0x0133, %r23
	.word 0xa83c0011  ! 678: XNOR_R	xnor 	%r16, %r17, %r20
	.word 0xdcd41011  ! 679: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r14
thr1_irf_ce_59:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_59), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xc3ec2827  ! 681: PREFETCHA_I	prefetcha	[%r16, + 0x0827] %asi, #one_read
	.word 0xb61c0011  ! 683: XOR_R	xor 	%r16, %r17, %r27
	.word 0x912c3001  ! 683: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0xbaac0011  ! 683: ANDNcc_R	andncc 	%r16, %r17, %r29
	.word 0x8a340011  ! 683: ORN_R	orn 	%r16, %r17, %r5
	.word 0xaf3c0011  ! 683: SRA_R	sra 	%r16, %r17, %r23
thr1_dc_err_60:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_60), 16, 16),1,DC_DATA,2)
	.word 0xfa5c0000  ! 685: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xf91c2dd5  ! 687: LDDF_I	ldd	[%r16, 0x0dd5], %f28
	.word 0x82b40011  ! 689: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x9eac2123  ! 689: ANDNcc_I	andncc 	%r16, 0x0123, %r15
	.word 0xacb40011  ! 689: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0x962c0011  ! 689: ANDN_R	andn 	%r16, %r17, %r11
	.word 0x9ec40011  ! 689: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0xaa940011  ! 689: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x8d2c1011  ! 689: SLLX_R	sllx	%r16, %r17, %r6
	.word 0x90b40011  ! 689: ORNcc_R	orncc 	%r16, %r17, %r8
	.word 0xc2d41011  ! 690: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r1
        wr  %g0, 0x80, %asi
	.word 0x903421d8  ! 694: ORN_I	orn 	%r16, 0x01d8, %r8
	.word 0xbac40011  ! 694: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0x8c8c2f06  ! 694: ANDcc_I	andcc 	%r16, 0x0f06, %r6
	.word 0xa6c40011  ! 694: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0xad341011  ! 694: SRLX_R	srlx	%r16, %r17, %r22
	.word 0x843c2a31  ! 694: XNOR_I	xnor 	%r16, 0x0a31, %r2
	.word 0x99643801  ! 694: MOVcc_I	<illegal instruction>
	.word 0xb40c0011  ! 694: AND_R	and 	%r16, %r17, %r26
thr1_dc_err_61:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_61), 16, 16),1,DC_DATA,71)
	.word 0xca4c2167  ! 696: LDSB_I	ldsb	[%r16 + 0x0167], %r5
	.word 0xcb1429e4  ! 698: LDQF_I	-	[%r16, 0x09e4], %f5
	.word 0x924425cf  ! 700: ADDC_I	addc 	%r16, 0x05cf, %r9
	.word 0xb80c0011  ! 700: AND_R	and 	%r16, %r17, %r28
	.word 0x8e2c0011  ! 700: ANDN_R	andn 	%r16, %r17, %r7
	.word 0x9b2c2001  ! 700: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0x88040011  ! 700: ADD_R	add 	%r16, %r17, %r4
	.word 0xb41c2b85  ! 700: XOR_I	xor 	%r16, 0x0b85, %r26
thr1_dc_err_62:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_62), 16, 16),1,DC_DATA,49)
	.word 0xcc040000  ! 702: LDUW_R	lduw	[%r16 + %r0], %r6
!Illinst alu
	.word 0x86ac0011  ! 704: ANDNcc_R	andncc 	%r16, %r17, %r3
	.word 0x93343001  ! 706: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x93343001  ! 706: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x87641811  ! 706: MOVcc_R	<illegal instruction>
	.word 0x8a142998  ! 706: OR_I	or 	%r16, 0x0998, %r5
	.word 0xab343001  ! 706: SRLX_I	srlx	%r16, 0x0001, %r21
	.word 0x9c2c2008  ! 706: ANDN_I	andn 	%r16, 0x0008, %r14
thr1_dc_err_63:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_63), 16, 16),1,DC_DATA,55)
	.word 0xde140000  ! 708: LDUH_R	lduh	[%r16 + %r0], %r15
	.word 0xd3941011  ! 710: LDQFA_R	-	[%r16, %r17], %f9
	.word 0xb33c2001  ! 712: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0x842c293b  ! 712: ANDN_I	andn 	%r16, 0x093b, %r2
	.word 0xb0140011  ! 712: OR_R	or 	%r16, %r17, %r24
	.word 0xb20c0011  ! 712: AND_R	and 	%r16, %r17, %r25
	.word 0x93343001  ! 712: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x94ac2c3c  ! 712: ANDNcc_I	andncc 	%r16, 0x0c3c, %r10
	.word 0x960c0011  ! 712: AND_R	and 	%r16, %r17, %r11
thr1_dc_err_64:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_64), 16, 16),1,DC_DATA,31)
	.word 0xdf941000  ! 714: LDQFA_R	-	[%r16, %r0], %f15
	.word 0xdb9c1011  ! 716: LDDFA_R	ldda	[%r16, %r17], %f13
	.word 0x9c8c0011  ! 718: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0xbac40011  ! 718: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0xbab42e14  ! 718: ORNcc_I	orncc 	%r16, 0x0e14, %r29
	.word 0xaf343001  ! 718: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0xa6c40011  ! 718: ADDCcc_R	addccc 	%r16, %r17, %r19
	.word 0xb02c0011  ! 718: ANDN_R	andn 	%r16, %r17, %r24
thr1_dc_err_65:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_65), 16, 16),1,DC_DATA,4)
	.word 0xd7941000  ! 720: LDQFA_R	-	[%r16, %r0], %f11
	.word 0xd20c2b27  ! 722: LDUB_I	ldub	[%r16 + 0x0b27], %r9
	.word 0x880c0011  ! 724: AND_R	and 	%r16, %r17, %r4
	.word 0xaeb40011  ! 724: ORNcc_R	orncc 	%r16, %r17, %r23
	.word 0x8d2c1011  ! 724: SLLX_R	sllx	%r16, %r17, %r6
	.word 0xb4bc2a4c  ! 724: XNORcc_I	xnorcc 	%r16, 0x0a4c, %r26
	.word 0x928c2906  ! 724: ANDcc_I	andcc 	%r16, 0x0906, %r9
	.word 0x92ac0011  ! 724: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x888c2337  ! 724: ANDcc_I	andcc 	%r16, 0x0337, %r4
	.word 0x9d7c0411  ! 724: MOVR_R	move	%r16, %r17, %r14
thr1_dc_err_66:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_66), 16, 16),1,DC_DATA,14)
	.word 0xf8140000  ! 726: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xc59c1011  ! 728: LDDFA_R	ldda	[%r16, %r17], %f2
	.word 0xb88425e2  ! 730: ADDcc_I	addcc 	%r16, 0x05e2, %r28
	.word 0xb4ac0011  ! 730: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0x843c0011  ! 730: XNOR_R	xnor 	%r16, %r17, %r2
	.word 0x9eac2ab4  ! 730: ANDNcc_I	andncc 	%r16, 0x0ab4, %r15
	.word 0x922c0011  ! 730: ANDN_R	andn 	%r16, %r17, %r9
	.word 0xa6bc0011  ! 730: XNORcc_R	xnorcc 	%r16, %r17, %r19
	.word 0xcf040011  ! 731: LDF_R	ld	[%r16, %r17], %f7
!Illinst store
	.word 0xd4340011  ! 733: STH_R	sth	%r10, [%r16 + %r17]
	.word 0x992c0011  ! 735: SLL_R	sll 	%r16, %r17, %r12
	.word 0x86140011  ! 735: OR_R	or 	%r16, %r17, %r3
	.word 0xaebc0011  ! 735: XNORcc_R	xnorcc 	%r16, %r17, %r23
	.word 0xad2c3001  ! 735: SLLX_I	sllx	%r16, 0x0001, %r22
	.word 0xaabc0011  ! 735: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0x940c2f01  ! 735: AND_I	and 	%r16, 0x0f01, %r10
	.word 0xac142832  ! 735: OR_I	or 	%r16, 0x0832, %r22
	.word 0xa8040011  ! 735: ADD_R	add 	%r16, %r17, %r20
	.word 0xd85c0011  ! 736: LDX_R	ldx	[%r16 + %r17], %r12
	.word 0xea540011  ! 738: LDSH_R	ldsh	[%r16 + %r17], %r21
	.word 0x93340011  ! 740: SRL_R	srl 	%r16, %r17, %r9
	.word 0x862c26f2  ! 740: ANDN_I	andn 	%r16, 0x06f2, %r3
	.word 0xba8426d1  ! 740: ADDcc_I	addcc 	%r16, 0x06d1, %r29
	.word 0x92142331  ! 740: OR_I	or 	%r16, 0x0331, %r9
	.word 0xb8b42904  ! 740: ORNcc_I	orncc 	%r16, 0x0904, %r28
	.word 0xecc41011  ! 741: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r22
thr1_irf_ce_60:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_60), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	wr      %r0, 0x1, %asr26
	.word 0x84140011  ! 745: OR_R	or 	%r16, %r17, %r2
	.word 0xb17c2401  ! 745: MOVR_I	move	%r16, 0xfffffe54, %r24
	.word 0xb6940011  ! 745: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0xb4042dc6  ! 745: ADD_I	add 	%r16, 0x0dc6, %r26
	.word 0xb4040011  ! 745: ADD_R	add 	%r16, %r17, %r26
	.word 0xd9841011  ! 746: LDFA_R	lda	[%r16, %r17], %f12
thr1_irf_ce_61:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_61), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xf91c0011  ! 748: LDDF_R	ldd	[%r16, %r17], %f28
	.word 0x968424b0  ! 750: ADDcc_I	addcc 	%r16, 0x04b0, %r11
	.word 0x9ac40011  ! 750: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x98440011  ! 750: ADDC_R	addc 	%r16, %r17, %r12
	.word 0xaa940011  ! 750: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0xaa340011  ! 750: ORN_R	orn 	%r16, %r17, %r21
	.word 0x8a2c28d1  ! 750: ANDN_I	andn 	%r16, 0x08d1, %r5
	.word 0xb8b42674  ! 750: ORNcc_I	orncc 	%r16, 0x0674, %r28
	.word 0xeed41011  ! 751: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r23
	.word 0xef140011  ! 753: LDQF_R	-	[%r16, %r17], %f23
	.word 0x88840011  ! 755: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0xa62c21fa  ! 755: ANDN_I	andn 	%r16, 0x01fa, %r19
	.word 0xb6040011  ! 755: ADD_R	add 	%r16, %r17, %r27
	.word 0xaabc2ba7  ! 755: XNORcc_I	xnorcc 	%r16, 0x0ba7, %r21
	.word 0xb13c1011  ! 755: SRAX_R	srax	%r16, %r17, %r24
	.word 0xb29c2d36  ! 755: XORcc_I	xorcc 	%r16, 0x0d36, %r25
	.word 0x98ac24d8  ! 755: ANDNcc_I	andncc 	%r16, 0x04d8, %r12
	.word 0x94140011  ! 755: OR_R	or 	%r16, %r17, %r10
thr1_dc_err_67:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_67), 16, 16),1,DC_DATA,54)
	.word 0xc8d42145  ! 757: LDSHA_I	ldsha	[%r16, + 0x0145] %asi, %r4
	.word 0xfac422b4  ! 759: LDSWA_I	ldswa	[%r16, + 0x02b4] %asi, %r29
	.word 0x9e440011  ! 761: ADDC_R	addc 	%r16, %r17, %r15
	.word 0xaa842d4a  ! 761: ADDcc_I	addcc 	%r16, 0x0d4a, %r21
	.word 0xb89c21e4  ! 761: XORcc_I	xorcc 	%r16, 0x01e4, %r28
	.word 0x932c2001  ! 761: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0x9d3c0011  ! 761: SRA_R	sra 	%r16, %r17, %r14
	.word 0xe85c0011  ! 762: LDX_R	ldx	[%r16 + %r17], %r20
	.word 0xe89c1011  ! 764: LDDA_R	ldda	[%r16, %r17] 0x80, %r20
	.word 0x99340011  ! 766: SRL_R	srl 	%r16, %r17, %r12
	.word 0x9c3428df  ! 766: ORN_I	orn 	%r16, 0x08df, %r14
	.word 0x8b2c1011  ! 766: SLLX_R	sllx	%r16, %r17, %r5
	.word 0xb84427ad  ! 766: ADDC_I	addc 	%r16, 0x07ad, %r28
	.word 0x9ac40011  ! 766: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xb6042f59  ! 766: ADD_I	add 	%r16, 0x0f59, %r27
	.word 0x9a9423d2  ! 766: ORcc_I	orcc 	%r16, 0x03d2, %r13
thr1_dc_err_68:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_68), 16, 16),1,DC_DATA,55)
	.word 0xdd841000  ! 768: LDFA_R	lda	[%r16, %r0], %f14
thr1_irf_ce_62:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_62), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xc27428f1  ! 772: STX_I	stx	%r1, [%r16 + 0x08f1]
	.word 0x972c3001  ! 774: SLLX_I	sllx	%r16, 0x0001, %r11
	.word 0xb8ac0011  ! 774: ANDNcc_R	andncc 	%r16, %r17, %r28
	.word 0x98840011  ! 774: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0xaa2c0011  ! 774: ANDN_R	andn 	%r16, %r17, %r21
	.word 0x882c0011  ! 774: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x892c3001  ! 774: SLLX_I	sllx	%r16, 0x0001, %r4
	.word 0xb6bc25a1  ! 774: XNORcc_I	xnorcc 	%r16, 0x05a1, %r27
	.word 0x941c2a6c  ! 774: XOR_I	xor 	%r16, 0x0a6c, %r10
thr1_dc_err_69:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_69), 16, 16),1,DC_DATA,63)
	.word 0xc69c2d6e  ! 776: LDDA_I	ldda	[%r16, + 0x0d6e] %asi, %r3
	.word 0xf414227b  ! 778: LDUH_I	lduh	[%r16 + 0x027b], %r26
	.word 0xacac0011  ! 780: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0xaec4220c  ! 780: ADDCcc_I	addccc 	%r16, 0x020c, %r23
	.word 0x949c2509  ! 780: XORcc_I	xorcc 	%r16, 0x0509, %r10
	.word 0x8a942280  ! 780: ORcc_I	orcc 	%r16, 0x0280, %r5
	.word 0x9a040011  ! 780: ADD_R	add 	%r16, %r17, %r13
	.word 0x963c286b  ! 780: XNOR_I	xnor 	%r16, 0x086b, %r11
	.word 0xee8c2ea9  ! 781: LDUBA_I	lduba	[%r16, + 0x0ea9] %asi, %r23
thr1_irf_ce_63:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_63), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xdd941011  ! 783: LDQFA_R	-	[%r16, %r17], %f14
	.word 0xb6840011  ! 785: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0xb02c0011  ! 785: ANDN_R	andn 	%r16, %r17, %r24
	.word 0x92bc0011  ! 785: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0xb09c0011  ! 785: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x99340011  ! 785: SRL_R	srl 	%r16, %r17, %r12
	.word 0x949c0011  ! 785: XORcc_R	xorcc 	%r16, %r17, %r10
	.word 0xf0dc1011  ! 786: LDXA_R	ldxa	[%r16, %r17] 0x80, %r24
thr1_irf_ce_64:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_64), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xe7040011  ! 788: LDF_R	ld	[%r16, %r17], %f19
	.word 0x9b341011  ! 790: SRLX_R	srlx	%r16, %r17, %r13
	.word 0xb41c0011  ! 790: XOR_R	xor 	%r16, %r17, %r26
	.word 0x88c40011  ! 790: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0xb4bc0011  ! 790: XNORcc_R	xnorcc 	%r16, %r17, %r26
	.word 0x9d2c1011  ! 790: SLLX_R	sllx	%r16, %r17, %r14
	.word 0x84c40011  ! 790: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0x8abc0011  ! 790: XNORcc_R	xnorcc 	%r16, %r17, %r5
thr1_dc_err_70:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_70), 16, 16),1,DC_DATA,48)
	.word 0xe79c1000  ! 792: LDDFA_R	ldda	[%r16, %r0], %f19
thr1_irf_ce_65:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_65), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	ta	T_CHANGE_HPRIV	! macro
	.word 0xb20c0011  ! 796: AND_R	and 	%r16, %r17, %r25
	.word 0x8f3c2001  ! 796: SRA_I	sra 	%r16, 0x0001, %r7
	.word 0x8e940011  ! 796: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0xac1424da  ! 796: OR_I	or 	%r16, 0x04da, %r22
	.word 0x917c0411  ! 796: MOVR_R	move	%r16, %r17, %r8
	.word 0x9cb42990  ! 796: ORNcc_I	orncc 	%r16, 0x0990, %r14
	.word 0xb68c2227  ! 796: ANDcc_I	andcc 	%r16, 0x0227, %r27
	.word 0xb41c2473  ! 796: XOR_I	xor 	%r16, 0x0473, %r26
	.word 0xcc841011  ! 797: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r6
thr1_irf_ce_66:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_66), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xdf140011  ! 799: LDQF_R	-	[%r16, %r17], %f15
	.word 0x9f3c0011  ! 801: SRA_R	sra 	%r16, %r17, %r15
	.word 0x96ac0011  ! 801: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x9ab40011  ! 801: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x92840011  ! 801: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0x961c0011  ! 801: XOR_R	xor 	%r16, %r17, %r11
	.word 0x8a2c0011  ! 801: ANDN_R	andn 	%r16, %r17, %r5
thr1_dc_err_71:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_71), 16, 16),1,DC_DATA,17)
	.word 0xf25c0000  ! 803: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xc8941011  ! 805: LDUHA_R	lduha	[%r16, %r17] 0x80, %r4
	.word 0x973c2001  ! 807: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x90bc0011  ! 807: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x9e8c0011  ! 807: ANDcc_R	andcc 	%r16, %r17, %r15
	.word 0x9cc42c4c  ! 807: ADDCcc_I	addccc 	%r16, 0x0c4c, %r14
	.word 0xa6bc276e  ! 807: XNORcc_I	xnorcc 	%r16, 0x076e, %r19
	.word 0x8abc228f  ! 807: XNORcc_I	xnorcc 	%r16, 0x028f, %r5
	.word 0xd91c2293  ! 808: LDDF_I	ldd	[%r16, 0x0293], %f12
thr1_irf_ce_67:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_67), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xd7841011  ! 810: LDFA_R	lda	[%r16, %r17], %f11
	.word 0x88840011  ! 812: ADDcc_R	addcc 	%r16, %r17, %r4
	.word 0x921c0011  ! 812: XOR_R	xor 	%r16, %r17, %r9
	.word 0xb0840011  ! 812: ADDcc_R	addcc 	%r16, %r17, %r24
	.word 0x8a2c2c14  ! 812: ANDN_I	andn 	%r16, 0x0c14, %r5
	.word 0xb9643801  ! 812: MOVcc_I	<illegal instruction>
	.word 0xec8c1011  ! 813: LDUBA_R	lduba	[%r16, %r17] 0x80, %r22
	.word 0xdc7c26c6  ! 815: SWAP_I	swap	%r14, [%r16 + 0x06c6]
	.word 0x9f2c0011  ! 817: SLL_R	sll 	%r16, %r17, %r15
	.word 0x932c3001  ! 817: SLLX_I	sllx	%r16, 0x0001, %r9
	.word 0x952c0011  ! 817: SLL_R	sll 	%r16, %r17, %r10
	.word 0x8b3c1011  ! 817: SRAX_R	srax	%r16, %r17, %r5
	.word 0xa6040011  ! 817: ADD_R	add 	%r16, %r17, %r19
	.word 0xac9c2154  ! 817: XORcc_I	xorcc 	%r16, 0x0154, %r22
	.word 0x9e34274e  ! 817: ORN_I	orn 	%r16, 0x074e, %r15
	.word 0x93342001  ! 817: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0xd0c42cc8  ! 818: LDSWA_I	ldswa	[%r16, + 0x0cc8] %asi, %r8
	.word 0xed941011  ! 820: LDQFA_R	-	[%r16, %r17], %f22
	.word 0x832c1011  ! 822: SLLX_R	sllx	%r16, %r17, %r1
	.word 0x93342001  ! 822: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0xaac40011  ! 822: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0x94940011  ! 822: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0xa89c0011  ! 822: XORcc_R	xorcc 	%r16, %r17, %r20
thr1_dc_err_72:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_72), 16, 16),1,DC_DATA,57)
	.word 0xdb04247e  ! 824: LDF_I	ld	[%r16, 0x047e], %f13
	.word 0xc36c2179  ! 826: PREFETCH_I	prefetch	[%r16 + 0x0179], #one_read
	.word 0x8cb40011  ! 828: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x908c2f61  ! 828: ANDcc_I	andcc 	%r16, 0x0f61, %r8
	.word 0x9cc42ee8  ! 828: ADDCcc_I	addccc 	%r16, 0x0ee8, %r14
	.word 0xbab425f7  ! 828: ORNcc_I	orncc 	%r16, 0x05f7, %r29
	.word 0xa9643801  ! 828: MOVcc_I	<illegal instruction>
thr1_dc_err_73:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_73), 16, 16),1,DC_DATA,8)
	.word 0xf79c1000  ! 830: LDDFA_R	ldda	[%r16, %r0], %f27
thr1_irf_ce_68:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_68), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xc4dc1011  ! 832: LDXA_R	ldxa	[%r16, %r17] 0x80, %r2
	.word 0x94b420c9  ! 834: ORNcc_I	orncc 	%r16, 0x00c9, %r10
	.word 0x9a0c0011  ! 834: AND_R	and 	%r16, %r17, %r13
	.word 0xa6842274  ! 834: ADDcc_I	addcc 	%r16, 0x0274, %r19
	.word 0xb8140011  ! 834: OR_R	or 	%r16, %r17, %r28
	.word 0x96442f5c  ! 834: ADDC_I	addc 	%r16, 0x0f5c, %r11
	.word 0x92b42269  ! 834: ORNcc_I	orncc 	%r16, 0x0269, %r9
	.word 0x8f641811  ! 834: MOVcc_R	<illegal instruction>
	.word 0x957c2401  ! 834: MOVR_I	move	%r16, 0xfffffe54, %r10
	.word 0xf1040011  ! 835: LDF_R	ld	[%r16, %r17], %f24
	.word 0xded41011  ! 837: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r15
	.word 0x8c3c215a  ! 839: XNOR_I	xnor 	%r16, 0x015a, %r6
	.word 0x881c2583  ! 839: XOR_I	xor 	%r16, 0x0583, %r4
	.word 0x9a9c0011  ! 839: XORcc_R	xorcc 	%r16, %r17, %r13
	.word 0x95343001  ! 839: SRLX_I	srlx	%r16, 0x0001, %r10
	.word 0x9c1c0011  ! 839: XOR_R	xor 	%r16, %r17, %r14
	.word 0x9a0c247d  ! 839: AND_I	and 	%r16, 0x047d, %r13
	.word 0xa60c2184  ! 839: AND_I	and 	%r16, 0x0184, %r19
	.word 0xcd040011  ! 840: LDF_R	ld	[%r16, %r17], %f6
thr1_irf_ce_69:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_69), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xd0c41011  ! 842: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r8
	.word 0x9c340011  ! 844: ORN_R	orn 	%r16, %r17, %r14
	.word 0xba840011  ! 844: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0x953c2001  ! 844: SRA_I	sra 	%r16, 0x0001, %r10
	.word 0x86ac2911  ! 844: ANDNcc_I	andncc 	%r16, 0x0911, %r3
	.word 0xac1425a7  ! 844: OR_I	or 	%r16, 0x05a7, %r22
	.word 0x9d643801  ! 844: MOVcc_I	<illegal instruction>
	.word 0x8e8c0011  ! 844: ANDcc_R	andcc 	%r16, %r17, %r7
	.word 0xc24c0011  ! 845: LDSB_R	ldsb	[%r16 + %r17], %r1
thr1_irf_ce_70:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_70), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xd19c1011  ! 847: LDDFA_R	ldda	[%r16, %r17], %f8
	.word 0x9a340011  ! 849: ORN_R	orn 	%r16, %r17, %r13
	.word 0x8b2c0011  ! 849: SLL_R	sll 	%r16, %r17, %r5
	.word 0x96ac29c4  ! 849: ANDNcc_I	andncc 	%r16, 0x09c4, %r11
	.word 0x829c0011  ! 849: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x8a8c0011  ! 849: ANDcc_R	andcc 	%r16, %r17, %r5
	.word 0x913c1011  ! 849: SRAX_R	srax	%r16, %r17, %r8
	.word 0xed142160  ! 850: LDQF_I	-	[%r16, 0x0160], %f22
thr1_irf_ce_71:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_71), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xd59c1011  ! 852: LDDFA_R	ldda	[%r16, %r17], %f10
	.word 0x92ac2440  ! 854: ANDNcc_I	andncc 	%r16, 0x0440, %r9
	.word 0x90bc0011  ! 854: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x840420e7  ! 854: ADD_I	add 	%r16, 0x00e7, %r2
	.word 0x8c1c0011  ! 854: XOR_R	xor 	%r16, %r17, %r6
	.word 0x9a2c0011  ! 854: ANDN_R	andn 	%r16, %r17, %r13
	.word 0xac142f5f  ! 854: OR_I	or 	%r16, 0x0f5f, %r22
	.word 0xac2c0011  ! 854: ANDN_R	andn 	%r16, %r17, %r22
	.word 0xb3643801  ! 854: MOVcc_I	<illegal instruction>
	.word 0xfa540011  ! 855: LDSH_R	ldsh	[%r16 + %r17], %r29
	.word 0xd2c41011  ! 857: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r9
	.word 0x8404250a  ! 859: ADD_I	add 	%r16, 0x050a, %r2
	.word 0xba3c2a4d  ! 859: XNOR_I	xnor 	%r16, 0x0a4d, %r29
	.word 0x841c0011  ! 859: XOR_R	xor 	%r16, %r17, %r2
	.word 0x8d341011  ! 859: SRLX_R	srlx	%r16, %r17, %r6
	.word 0x90340011  ! 859: ORN_R	orn 	%r16, %r17, %r8
	.word 0xb49c0011  ! 859: XORcc_R	xorcc 	%r16, %r17, %r26
thr1_dc_err_74:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_74), 16, 16),1,DC_DATA,70)
	.word 0xc39c1000  ! 861: LDDFA_R	ldda	[%r16, %r0], %f1
	.word 0xd61c274c  ! 863: LDD_I	ldd	[%r16 + 0x074c], %r11
	.word 0x8a0c0011  ! 865: AND_R	and 	%r16, %r17, %r5
	.word 0x84140011  ! 865: OR_R	or 	%r16, %r17, %r2
	.word 0x98440011  ! 865: ADDC_R	addc 	%r16, %r17, %r12
	.word 0xaf7c0411  ! 865: MOVR_R	move	%r16, %r17, %r23
	.word 0xa82c0011  ! 865: ANDN_R	andn 	%r16, %r17, %r20
	.word 0xa80c0011  ! 865: AND_R	and 	%r16, %r17, %r20
	.word 0xd4142be9  ! 866: LDUH_I	lduh	[%r16 + 0x0be9], %r10
thr1_irf_ce_72:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_72), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xdc540011  ! 868: LDSH_R	ldsh	[%r16 + %r17], %r14
	.word 0x9e0c0011  ! 870: AND_R	and 	%r16, %r17, %r15
	.word 0x8e9c2e14  ! 870: XORcc_I	xorcc 	%r16, 0x0e14, %r7
	.word 0x8c442e9a  ! 870: ADDC_I	addc 	%r16, 0x0e9a, %r6
	.word 0x969422ef  ! 870: ORcc_I	orcc 	%r16, 0x02ef, %r11
	.word 0x8d342001  ! 870: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0xba2c0011  ! 870: ANDN_R	andn 	%r16, %r17, %r29
thr1_dc_err_75:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_75), 16, 16),1,DC_DATA,47)
	.word 0xcedc1000  ! 872: LDXA_R	ldxa	[%r16, %r0] 0x80, %r7
	.word 0xdb142081  ! 874: LDQF_I	-	[%r16, 0x0081], %f13
	.word 0x8a9c0011  ! 876: XORcc_R	xorcc 	%r16, %r17, %r5
	.word 0x9d3c2001  ! 876: SRA_I	sra 	%r16, 0x0001, %r14
	.word 0x9e940011  ! 876: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0xb8340011  ! 876: ORN_R	orn 	%r16, %r17, %r28
	.word 0x82042a7e  ! 876: ADD_I	add 	%r16, 0x0a7e, %r1
thr1_dc_err_76:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_76), 16, 16),1,DC_DATA,18)
	.word 0xda1c2b78  ! 878: LDD_I	ldd	[%r16 + 0x0b78], %r13
	.word 0xc4cc1011  ! 880: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r2
	.word 0xb89c295e  ! 882: XORcc_I	xorcc 	%r16, 0x095e, %r28
	.word 0xb02c2920  ! 882: ANDN_I	andn 	%r16, 0x0920, %r24
	.word 0xad641811  ! 882: MOVcc_R	<illegal instruction>
	.word 0x90040011  ! 882: ADD_R	add 	%r16, %r17, %r8
	.word 0x9d641811  ! 882: MOVcc_R	<illegal instruction>
	.word 0x88bc2bef  ! 882: XNORcc_I	xnorcc 	%r16, 0x0bef, %r4
	.word 0xb7343001  ! 882: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0x9e342570  ! 882: ORN_I	orn 	%r16, 0x0570, %r15
	.word 0xf3941011  ! 883: LDQFA_R	-	[%r16, %r17], %f25
	.word 0x8143e028  ! 885: MEMBAR	membar	#StoreStore | #MemIssue 
	.word 0x9e3c26e7  ! 887: XNOR_I	xnor 	%r16, 0x06e7, %r15
	.word 0x8a440011  ! 887: ADDC_R	addc 	%r16, %r17, %r5
	.word 0x90bc2611  ! 887: XNORcc_I	xnorcc 	%r16, 0x0611, %r8
	.word 0xaa440011  ! 887: ADDC_R	addc 	%r16, %r17, %r21
	.word 0x8e2c0011  ! 887: ANDN_R	andn 	%r16, %r17, %r7
	.word 0xea9c24e1  ! 888: LDDA_I	ldda	[%r16, + 0x04e1] %asi, %r21
thr1_irf_ce_73:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_73), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xd44c27d5  ! 890: LDSB_I	ldsb	[%r16 + 0x07d5], %r10
	.word 0xb8ac0011  ! 892: ANDNcc_R	andncc 	%r16, %r17, %r28
	.word 0x98940011  ! 892: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0xa72c0011  ! 892: SLL_R	sll 	%r16, %r17, %r19
	.word 0x9a3c2f63  ! 892: XNOR_I	xnor 	%r16, 0x0f63, %r13
	.word 0x9d340011  ! 892: SRL_R	srl 	%r16, %r17, %r14
	.word 0x92ac0011  ! 892: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xb32c1011  ! 892: SLLX_R	sllx	%r16, %r17, %r25
	.word 0xd8dc1011  ! 893: LDXA_R	ldxa	[%r16, %r17] 0x80, %r12
	.word 0xcc8c1011  ! 895: LDUBA_R	lduba	[%r16, %r17] 0x80, %r6
	.word 0xb8942b57  ! 897: ORcc_I	orcc 	%r16, 0x0b57, %r28
	.word 0x8e3c0011  ! 897: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xaa8c0011  ! 897: ANDcc_R	andcc 	%r16, %r17, %r21
	.word 0x9e042e6e  ! 897: ADD_I	add 	%r16, 0x0e6e, %r15
	.word 0x8e142c16  ! 897: OR_I	or 	%r16, 0x0c16, %r7
	.word 0x893c0011  ! 897: SRA_R	sra 	%r16, %r17, %r4
	.word 0xaab40011  ! 897: ORNcc_R	orncc 	%r16, %r17, %r21
thr1_dc_err_77:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_77), 16, 16),1,DC_DATA,12)
	.word 0xcb142626  ! 899: LDQF_I	-	[%r16, 0x0626], %f5
thr1_irf_ce_74:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_74), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xf7841011  ! 901: LDFA_R	lda	[%r16, %r17], %f27
	.word 0x9c440011  ! 903: ADDC_R	addc 	%r16, %r17, %r14
	.word 0x9e340011  ! 903: ORN_R	orn 	%r16, %r17, %r15
	.word 0x952c1011  ! 903: SLLX_R	sllx	%r16, %r17, %r10
	.word 0x9ec42516  ! 903: ADDCcc_I	addccc 	%r16, 0x0516, %r15
	.word 0x88c4297f  ! 903: ADDCcc_I	addccc 	%r16, 0x097f, %r4
	.word 0xac840011  ! 903: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0xc24c2312  ! 904: LDSB_I	ldsb	[%r16 + 0x0312], %r1
thr1_irf_ce_75:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_75), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xc70424ad  ! 906: LDF_I	ld	[%r16, 0x04ad], %f3
	.word 0x88bc2817  ! 908: XNORcc_I	xnorcc 	%r16, 0x0817, %r4
	.word 0x84440011  ! 908: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x912c0011  ! 908: SLL_R	sll 	%r16, %r17, %r8
	.word 0x9e94251e  ! 908: ORcc_I	orcc 	%r16, 0x051e, %r15
	.word 0xa9342001  ! 908: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0xab2c2001  ! 908: SLL_I	sll 	%r16, 0x0001, %r21
	.word 0xb43c0011  ! 908: XNOR_R	xnor 	%r16, %r17, %r26
thr1_dc_err_78:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_78), 16, 16),1,DC_DATA,0)
	.word 0xeb1c22d3  ! 910: LDDF_I	ldd	[%r16, 0x02d3], %f21
thr1_irf_ce_76:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_76), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xe6c41011  ! 912: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r19
	.word 0x9c042df3  ! 914: ADD_I	add 	%r16, 0x0df3, %r14
	.word 0xbb643801  ! 914: MOVcc_I	<illegal instruction>
	.word 0xb8340011  ! 914: ORN_R	orn 	%r16, %r17, %r28
	.word 0xb21c0011  ! 914: XOR_R	xor 	%r16, %r17, %r25
	.word 0xaf341011  ! 914: SRLX_R	srlx	%r16, %r17, %r23
	.word 0xac2c0011  ! 914: ANDN_R	andn 	%r16, %r17, %r22
	.word 0x852c3001  ! 914: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0x8e940011  ! 914: ORcc_R	orcc 	%r16, %r17, %r7
thr1_dc_err_79:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_79), 16, 16),1,DC_DATA,50)
	.word 0xdc042569  ! 916: LDUW_I	lduw	[%r16 + 0x0569], %r14
	.word 0xd11c2b00  ! 918: LDDF_I	ldd	[%r16, 0x0b00], %f8
	.word 0x862c0011  ! 920: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x9a840011  ! 920: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x91341011  ! 920: SRLX_R	srlx	%r16, %r17, %r8
	.word 0x90440011  ! 920: ADDC_R	addc 	%r16, %r17, %r8
	.word 0x92442a56  ! 920: ADDC_I	addc 	%r16, 0x0a56, %r9
	.word 0x993c0011  ! 920: SRA_R	sra 	%r16, %r17, %r12
	.word 0x88140011  ! 920: OR_R	or 	%r16, %r17, %r4
thr1_dc_err_80:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_80), 16, 16),1,DC_DATA,12)
	.word 0xdb841000  ! 922: LDFA_R	lda	[%r16, %r0], %f13
	.word 0xd5140011  ! 924: LDQF_R	-	[%r16, %r17], %f10
	.word 0x8e1c2032  ! 926: XOR_I	xor 	%r16, 0x0032, %r7
	.word 0x9f3c1011  ! 926: SRAX_R	srax	%r16, %r17, %r15
	.word 0x8a040011  ! 926: ADD_R	add 	%r16, %r17, %r5
	.word 0x8e3c210b  ! 926: XNOR_I	xnor 	%r16, 0x010b, %r7
	.word 0x912c0011  ! 926: SLL_R	sll 	%r16, %r17, %r8
thr1_dc_err_81:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_81), 16, 16),1,DC_DATA,27)
	.word 0xc49424b0  ! 928: LDUHA_I	lduha	[%r16, + 0x04b0] %asi, %r2
	.word 0xf9841011  ! 930: LDFA_R	lda	[%r16, %r17], %f28
	.word 0x863c2187  ! 932: XNOR_I	xnor 	%r16, 0x0187, %r3
	.word 0xbb3c1011  ! 932: SRAX_R	srax	%r16, %r17, %r29
	.word 0xb8440011  ! 932: ADDC_R	addc 	%r16, %r17, %r28
	.word 0x82ac0011  ! 932: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x8d341011  ! 932: SRLX_R	srlx	%r16, %r17, %r6
	.word 0x988c2f4b  ! 932: ANDcc_I	andcc 	%r16, 0x0f4b, %r12
	.word 0x8c442591  ! 932: ADDC_I	addc 	%r16, 0x0591, %r6
	.word 0xb0ac2658  ! 932: ANDNcc_I	andncc 	%r16, 0x0658, %r24
thr1_dc_err_82:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_82), 16, 16),1,DC_DATA,18)
	.word 0xda8c1000  ! 934: LDUBA_R	lduba	[%r16, %r0] 0x80, %r13
thr1_irf_ce_77:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_77), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
        wr  %g0, 0x80, %asi
	.word 0x8f7c0411  ! 938: MOVR_R	move	%r16, %r17, %r7
	.word 0x9f643801  ! 938: MOVcc_I	<illegal instruction>
	.word 0xab641811  ! 938: MOVcc_R	<illegal instruction>
	.word 0x8abc0011  ! 938: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0x877c2401  ! 938: MOVR_I	move	%r16, 0xfffffe54, %r3
	.word 0xba0c282a  ! 938: AND_I	and 	%r16, 0x082a, %r29
	.word 0xf91c0011  ! 939: LDDF_R	ldd	[%r16, %r17], %f28
!Illinst store
	.word 0xc2340011  ! 941: STH_R	sth	%r1, [%r16 + %r17]
	.word 0x880c2083  ! 943: AND_I	and 	%r16, 0x0083, %r4
	.word 0x9b7c2401  ! 943: MOVR_I	move	%r16, 0xfffffe54, %r13
	.word 0x908c2222  ! 943: ANDcc_I	andcc 	%r16, 0x0222, %r8
	.word 0x9c042e5a  ! 943: ADD_I	add 	%r16, 0x0e5a, %r14
	.word 0x868c274f  ! 943: ANDcc_I	andcc 	%r16, 0x074f, %r3
	.word 0x83340011  ! 943: SRL_R	srl 	%r16, %r17, %r1
	.word 0x88042f75  ! 943: ADD_I	add 	%r16, 0x0f75, %r4
thr1_dc_err_83:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_83), 16, 16),1,DC_DATA,26)
	.word 0xc7841000  ! 945: LDFA_R	lda	[%r16, %r0], %f3
thr1_irf_ce_78:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_78), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xd9841011  ! 947: LDFA_R	lda	[%r16, %r17], %f12
	.word 0xaf7c0411  ! 949: MOVR_R	move	%r16, %r17, %r23
	.word 0xb29c0011  ! 949: XORcc_R	xorcc 	%r16, %r17, %r25
	.word 0x86040011  ! 949: ADD_R	add 	%r16, %r17, %r3
	.word 0xa72c3001  ! 949: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0x88842b87  ! 949: ADDcc_I	addcc 	%r16, 0x0b87, %r4
	.word 0x8b3c0011  ! 949: SRA_R	sra 	%r16, %r17, %r5
	.word 0x9f2c1011  ! 949: SLLX_R	sllx	%r16, %r17, %r15
	.word 0x91341011  ! 949: SRLX_R	srlx	%r16, %r17, %r8
thr1_dc_err_84:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_84), 16, 16),1,DC_DATA,48)
	.word 0xd0142d59  ! 951: LDUH_I	lduh	[%r16 + 0x0d59], %r8
	.word 0xd31c254c  ! 953: LDDF_I	ldd	[%r16, 0x054c], %f9
	.word 0xb6c40011  ! 955: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0xaa2c2350  ! 955: ANDN_I	andn 	%r16, 0x0350, %r21
	.word 0xb2440011  ! 955: ADDC_R	addc 	%r16, %r17, %r25
	.word 0x9f2c2001  ! 955: SLL_I	sll 	%r16, 0x0001, %r15
	.word 0xb97c0411  ! 955: MOVR_R	move	%r16, %r17, %r28
	.word 0x9e2c0011  ! 955: ANDN_R	andn 	%r16, %r17, %r15
	.word 0xf40c20d1  ! 956: LDUB_I	ldub	[%r16 + 0x00d1], %r26
	.word 0xc39c1011  ! 958: LDDFA_R	ldda	[%r16, %r17], %f1
	.word 0x983c25e3  ! 960: XNOR_I	xnor 	%r16, 0x05e3, %r12
	.word 0x87342001  ! 960: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0x912c1011  ! 960: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x9b341011  ! 960: SRLX_R	srlx	%r16, %r17, %r13
	.word 0xb61c2902  ! 960: XOR_I	xor 	%r16, 0x0902, %r27
	.word 0x889c274f  ! 960: XORcc_I	xorcc 	%r16, 0x074f, %r4
	.word 0xaf641811  ! 960: MOVcc_R	<illegal instruction>
thr1_dc_err_85:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_85), 16, 16),1,DC_DATA,1)
	.word 0xdb1425d4  ! 962: LDQF_I	-	[%r16, 0x05d4], %f13
	.word 0xf8042d39  ! 964: LDUW_I	lduw	[%r16 + 0x0d39], %r28
	.word 0x92042249  ! 966: ADD_I	add 	%r16, 0x0249, %r9
	.word 0x9eac2098  ! 966: ANDNcc_I	andncc 	%r16, 0x0098, %r15
	.word 0x89342001  ! 966: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0xb41c2a5e  ! 966: XOR_I	xor 	%r16, 0x0a5e, %r26
	.word 0x83641811  ! 966: MOVcc_R	<illegal instruction>
	.word 0x989c2855  ! 966: XORcc_I	xorcc 	%r16, 0x0855, %r12
	.word 0x95641811  ! 966: MOVcc_R	<illegal instruction>
	.word 0x98940011  ! 966: ORcc_R	orcc 	%r16, %r17, %r12
	.word 0xd0c41011  ! 967: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r8
	.word 0xdacc1011  ! 969: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r13
	.word 0x9c9c0011  ! 971: XORcc_R	xorcc 	%r16, %r17, %r14
	.word 0x8cc42218  ! 971: ADDCcc_I	addccc 	%r16, 0x0218, %r6
	.word 0xa9340011  ! 971: SRL_R	srl 	%r16, %r17, %r20
	.word 0x83340011  ! 971: SRL_R	srl 	%r16, %r17, %r1
	.word 0x852c1011  ! 971: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x8e142f58  ! 971: OR_I	or 	%r16, 0x0f58, %r7
	.word 0xb97c2401  ! 971: MOVR_I	move	%r16, 0xfffffe54, %r28
	.word 0xae042a5f  ! 971: ADD_I	add 	%r16, 0x0a5f, %r23
thr1_dc_err_86:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_86), 16, 16),1,DC_DATA,65)
	.word 0xd05c0000  ! 973: LDX_R	ldx	[%r16 + %r0], %r8
	.word 0xde941011  ! 975: LDUHA_R	lduha	[%r16, %r17] 0x80, %r15
	.word 0x8eac0011  ! 977: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x8a842d30  ! 977: ADDcc_I	addcc 	%r16, 0x0d30, %r5
	.word 0xae4422b6  ! 977: ADDC_I	addc 	%r16, 0x02b6, %r23
	.word 0xbb343001  ! 977: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0x98ac0011  ! 977: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0xb89c2512  ! 977: XORcc_I	xorcc 	%r16, 0x0512, %r28
	.word 0xb28c29ba  ! 977: ANDcc_I	andcc 	%r16, 0x09ba, %r25
	.word 0xe8540011  ! 978: LDSH_R	ldsh	[%r16 + %r17], %r20
	.word 0xcc1c2be7  ! 980: LDD_I	ldd	[%r16 + 0x0be7], %r6
	.word 0x9c040011  ! 982: ADD_R	add 	%r16, %r17, %r14
	.word 0x940c0011  ! 982: AND_R	and 	%r16, %r17, %r10
	.word 0x91641811  ! 982: MOVcc_R	<illegal instruction>
	.word 0xb4340011  ! 982: ORN_R	orn 	%r16, %r17, %r26
	.word 0x8e0c270e  ! 982: AND_I	and 	%r16, 0x070e, %r7
	.word 0x828c2824  ! 982: ANDcc_I	andcc 	%r16, 0x0824, %r1
thr1_dc_err_87:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_87), 16, 16),1,DC_DATA,10)
	.word 0xd61c0000  ! 984: LDD_R	ldd	[%r16 + %r0], %r11
thr1_irf_ce_79:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_79), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xcc242605  ! 988: STW_I	stw	%r6, [%r16 + 0x0605]
	.word 0x952c0011  ! 990: SLL_R	sll 	%r16, %r17, %r10
	.word 0x98bc0011  ! 990: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0xaabc2e38  ! 990: XNORcc_I	xnorcc 	%r16, 0x0e38, %r21
	.word 0xb6840011  ! 990: ADDcc_R	addcc 	%r16, %r17, %r27
	.word 0x8e3c0011  ! 990: XNOR_R	xnor 	%r16, %r17, %r7
	.word 0xba3c2c94  ! 990: XNOR_I	xnor 	%r16, 0x0c94, %r29
	.word 0xb53c0011  ! 990: SRA_R	sra 	%r16, %r17, %r26
	.word 0xde842985  ! 991: LDUWA_I	lduwa	[%r16, + 0x0985] %asi, %r15
thr1_irf_ce_80:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_80), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
thr1_resum_intr_759:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_759), 16, 16)) -> intp(1, 3, 1)
	wr      %r0, 0x0, %asr26
	.word 0x88c42220  ! 995: ADDCcc_I	addccc 	%r16, 0x0220, %r4
	.word 0x94440011  ! 995: ADDC_R	addc 	%r16, %r17, %r10
	.word 0xab3c0011  ! 995: SRA_R	sra 	%r16, %r17, %r21
	.word 0xac04252c  ! 995: ADD_I	add 	%r16, 0x052c, %r22
	.word 0x8e9c0011  ! 995: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0xbb2c0011  ! 995: SLL_R	sll 	%r16, %r17, %r29
	.word 0x9ec40011  ! 995: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x8f3c2001  ! 995: SRA_I	sra 	%r16, 0x0001, %r7
thr1_dc_err_88:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_88), 16, 16),1,DC_DATA,40)
	.word 0xf51c0000  ! 997: LDDF_R	ldd	[%r16, %r0], %f26
thr1_irf_ce_81:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_81), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
        setx  0x00000000000007d0, %g1, %r17
        setx  0x04a609ffb80ec7aa, %g1, %r0
        setx  0xefb0c660a7a82b94, %g1, %r1
        setx  0x6b996908df8d1e53, %g1, %r2
        setx  0x23fb1971e693ed97, %g1, %r3
        setx  0xf6d0d6451266c25b, %g1, %r4
        setx  0xd703c4815e1cd2cd, %g1, %r5
        setx  0xd3de31adc8252f67, %g1, %r6
        setx  0x47161f926b478b63, %g1, %r7
        setx  0xe5a2e0d1fb33f16c, %g1, %r8
        setx  0xa6ba3eebb73d30da, %g1, %r9
        setx  0xe878c2f05358cc78, %g1, %r10
        setx  0xf64375b3bbb8942b, %g1, %r11
        setx  0x8dc089ccdb137db1, %g1, %r12
        setx  0xa5451e20095e0c2b, %g1, %r13
        setx  0xcd2a35130bbae28a, %g1, %r14
        setx  0xc471b069f1e5ed5f, %g1, %r15
        setx  0xa211b0a3a83f9200, %g1, %r18
        setx  0x2d194e68b5831b2d, %g1, %r19
        setx  0xddceb2316519e169, %g1, %r20
        setx  0x5452178b2a4a7a5b, %g1, %r21
        setx  0xc7c15f94113574a2, %g1, %r22
        setx  0x5036df7f3dee2d0e, %g1, %r23
        setx  0xa8c339b34b77a3fe, %g1, %r24
        setx  0x053860be676a4755, %g1, %r25
        setx  0xa67a348273b1bcbb, %g1, %r26
        setx  0x43c01c98d23eb969, %g1, %r27
        setx  0x7b78285d227d8e9a, %g1, %r28
        setx  0x50d526c276c09b6f, %g1, %r29
        setx  0x3fe73f41c62eab24, %g1, %r30
        setx  0xf9d47d4273ddc77f, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000400, %g1, %r17
        setx  0x0b26efe9cfec0774, %g1, %r0
        setx  0x4ce056f21742c319, %g1, %r1
        setx  0xf38209f9a99c6e5a, %g1, %r2
        setx  0xaf2e56868ac1597e, %g1, %r3
        setx  0x787e25fb8f3ec115, %g1, %r4
        setx  0xc3234880c259a4ae, %g1, %r5
        setx  0x716a7b49486c3439, %g1, %r6
        setx  0x65694fe3a0b5892e, %g1, %r7
        setx  0x9accc56c600646bb, %g1, %r8
        setx  0xefa617430af16e77, %g1, %r9
        setx  0x4c11aca072c5d693, %g1, %r10
        setx  0xc5afc34bfddad08d, %g1, %r11
        setx  0x6017891da72db826, %g1, %r12
        setx  0xb7025ace500de66a, %g1, %r13
        setx  0xf8381c58dcd42992, %g1, %r14
        setx  0xb00018b5478400b6, %g1, %r15
        setx  0x1a6324ef92b5c6b0, %g1, %r18
        setx  0x9f020718fda0b7e8, %g1, %r19
        setx  0xa30c243ceedb98c4, %g1, %r20
        setx  0xf5ae27d4dc88cdff, %g1, %r21
        setx  0xa4a1c9c2e758c262, %g1, %r22
        setx  0xbabafb643d87effc, %g1, %r23
        setx  0xc00c856ffdb10f30, %g1, %r24
        setx  0x320a0356da930ba0, %g1, %r25
        setx  0xc561d7022f6f37b9, %g1, %r26
        setx  0x9aaa36ee6aaf280f, %g1, %r27
        setx  0x13120ffa93565090, %g1, %r28
        setx  0x276d539e27f9f4cd, %g1, %r29
        setx  0xfc8c0cf7c8764cc5, %g1, %r30
        setx  0xa6ac8e106911d36c, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000002e0, %g1, %r17
        setx  0x1bb18cb5e6694776, %g1, %r0
        setx  0x4ab4b26467e10504, %g1, %r1
        setx  0x33e67ca11986e674, %g1, %r2
        setx  0x6371369be6646f08, %g1, %r3
        setx  0x55cfc9f9f9bd2904, %g1, %r4
        setx  0xc5929be1620e70b7, %g1, %r5
        setx  0xdcbace4ae89ccbc5, %g1, %r6
        setx  0xed25406646077af0, %g1, %r7
        setx  0xae06589764c5dc42, %g1, %r8
        setx  0x6cb6f47bb78cf6ab, %g1, %r9
        setx  0x1d68cf527e22f52b, %g1, %r10
        setx  0x32005e2bd8c136d6, %g1, %r11
        setx  0x4c2d0b161375bd34, %g1, %r12
        setx  0x9b61de5ecde4fb18, %g1, %r13
        setx  0x8fea3641dab4d000, %g1, %r14
        setx  0x46b7a247a01bd06d, %g1, %r15
        setx  0xf9dc0e774a844af8, %g1, %r18
        setx  0x8a58bf90c0420854, %g1, %r19
        setx  0x40e9cb93d76fcf5a, %g1, %r20
        setx  0xe77fb02c79c650e3, %g1, %r21
        setx  0x0e5427b68bc41431, %g1, %r22
        setx  0x254ca9f938257c80, %g1, %r23
        setx  0xab0b25b786c66ed2, %g1, %r24
        setx  0xfa96279727d8e4a6, %g1, %r25
        setx  0x5bb89298ac0f00b8, %g1, %r26
        setx  0xf1edd2d98d311358, %g1, %r27
        setx  0xcaa92c312c957473, %g1, %r28
        setx  0x1d37bb17720e44b4, %g1, %r29
        setx  0xb01d9b9debfb9a2f, %g1, %r30
        setx  0xd6d66fadae060817, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000d20, %g1, %r17
        setx  0x93f83a122f3ae4fb, %g1, %r0
        setx  0x143d6de76e0aaa29, %g1, %r1
        setx  0xc15d4e49eb96de75, %g1, %r2
        setx  0xdf5cbe2e971745b5, %g1, %r3
        setx  0x575edeb77424a986, %g1, %r4
        setx  0xb83dfc9c1430920e, %g1, %r5
        setx  0x7aeb142f35274ecb, %g1, %r6
        setx  0x8fd43532c5687d91, %g1, %r7
        setx  0x347b05ef2271e9ae, %g1, %r8
        setx  0xc3e92b914129e75c, %g1, %r9
        setx  0x61cf14e4232d9278, %g1, %r10
        setx  0x8d8ae08a86a0005a, %g1, %r11
        setx  0x921239c82abf5dcc, %g1, %r12
        setx  0x67fffd10427831b2, %g1, %r13
        setx  0x0258f949e1692205, %g1, %r14
        setx  0x05107606e8254153, %g1, %r15
        setx  0xb64b7a6c7ed4286a, %g1, %r18
        setx  0xb28beff3a93e94bd, %g1, %r19
        setx  0x5b4317a59d9c4aec, %g1, %r20
        setx  0xb2389ddc76d66d09, %g1, %r21
        setx  0x68317035649b461a, %g1, %r22
        setx  0x4135b27736c067fb, %g1, %r23
        setx  0x4d1c9ec3e7789c62, %g1, %r24
        setx  0x501da759492ada07, %g1, %r25
        setx  0x2ec2c76c3993faee, %g1, %r26
        setx  0xd7ab037ad9ae56f3, %g1, %r27
        setx  0x74e4e0067f386c3a, %g1, %r28
        setx  0xd2d265413f557ade, %g1, %r29
        setx  0xc6d22d2fbb5c6b74, %g1, %r30
        setx  0xc5d507dee4c17f55, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000160, %g1, %r17
        setx  0x5e50a5ab27915e28, %g1, %r0
        setx  0xaadf89c793e9affb, %g1, %r1
        setx  0xe4cecafe97a3deff, %g1, %r2
        setx  0x5aaf325948d14936, %g1, %r3
        setx  0xd5491d1175fa8cf9, %g1, %r4
        setx  0x29992799db1bafe0, %g1, %r5
        setx  0xd46b12821947ff0b, %g1, %r6
        setx  0xb51bf8fa0c744668, %g1, %r7
        setx  0x6f0d678a64cdd82c, %g1, %r8
        setx  0x75fa2ba891f6c4a7, %g1, %r9
        setx  0x0f5e3fc945734d56, %g1, %r10
        setx  0x78719ab36dad2ffe, %g1, %r11
        setx  0x04e87e7159496827, %g1, %r12
        setx  0x6081a45f16408781, %g1, %r13
        setx  0x53d272defcedea6a, %g1, %r14
        setx  0xc060d541227d02c9, %g1, %r15
        setx  0xb8cf9d3495d77fd4, %g1, %r18
        setx  0xe65840985fca3cdf, %g1, %r19
        setx  0x83ba96b1055a465a, %g1, %r20
        setx  0x1c2b25575881a582, %g1, %r21
        setx  0x2c187b5eefc4cb41, %g1, %r22
        setx  0xbcf8204f42ac156c, %g1, %r23
        setx  0xde6e62e64dd7fbea, %g1, %r24
        setx  0xe52e8eea851834ac, %g1, %r25
        setx  0x7d95fc78a0dfe80e, %g1, %r26
        setx  0xe803fce0696ac229, %g1, %r27
        setx  0x2b319c3897f9a894, %g1, %r28
        setx  0x8dc5affdeb34535c, %g1, %r29
        setx  0xb257f6f77d631298, %g1, %r30
        setx  0x667bbd9615323d43, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x0000000000000430, %g1, %r17
        setx  0x71154a28705ca61f, %g1, %r0
        setx  0x35883b3487f9c650, %g1, %r1
        setx  0xd4a75dd6afd0c949, %g1, %r2
        setx  0xf9f4fe5f03f79c2e, %g1, %r3
        setx  0x4c17c538b91657d9, %g1, %r4
        setx  0x9fe0c9c23ae6a170, %g1, %r5
        setx  0x0f09675386852b89, %g1, %r6
        setx  0xb242f9bdc98f9654, %g1, %r7
        setx  0xaca6f86e997d37c9, %g1, %r8
        setx  0x15e584cc65111a6f, %g1, %r9
        setx  0xd98f48f13b1770e0, %g1, %r10
        setx  0x5f5aecda485f1dfb, %g1, %r11
        setx  0xd87e8573a99b06a9, %g1, %r12
        setx  0xeaefd86539ac6507, %g1, %r13
        setx  0xf8ce70d249223795, %g1, %r14
        setx  0xaad6bb840b9e517c, %g1, %r15
        setx  0xc8ff01dc0274ff59, %g1, %r18
        setx  0x833a58d9305d2c72, %g1, %r19
        setx  0xffa5e5e004517a9c, %g1, %r20
        setx  0x0673488ba2408f63, %g1, %r21
        setx  0xa38a26fd4451f420, %g1, %r22
        setx  0x82b8474e14ab09e7, %g1, %r23
        setx  0x16c58ef1b0387934, %g1, %r24
        setx  0x3506b435b17b82f5, %g1, %r25
        setx  0xabc3a26a8b661bb1, %g1, %r26
        setx  0xdf6ac6d093921967, %g1, %r27
        setx  0x46ed255cf4ff5db6, %g1, %r28
        setx  0x12edf3898d4962b5, %g1, %r29
        setx  0x689ccf5e20797d2f, %g1, %r30
        setx  0x5ee41c839a3bcbc0, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000009a0, %g1, %r17
        setx  0x609bb464963c9e6f, %g1, %r0
        setx  0x98a43adba64ff6f3, %g1, %r1
        setx  0x2cf469a4601396ae, %g1, %r2
        setx  0xfd6ab91ac1d9bc32, %g1, %r3
        setx  0x719a128ebc47fa23, %g1, %r4
        setx  0xd380a44016174618, %g1, %r5
        setx  0xc8191ffdefb60c27, %g1, %r6
        setx  0x4f402d832b930f9d, %g1, %r7
        setx  0xc559e7fe8d40efb8, %g1, %r8
        setx  0xc5352b47cd8846ad, %g1, %r9
        setx  0xafe71d894e54c5ef, %g1, %r10
        setx  0xbe52a52ef8078581, %g1, %r11
        setx  0x8b330bdaeafda776, %g1, %r12
        setx  0x8b957e9e2819d06e, %g1, %r13
        setx  0x2ce7e3e7d09e0152, %g1, %r14
        setx  0x67ea4c897042bace, %g1, %r15
        setx  0xce97bd99f1baf5fc, %g1, %r18
        setx  0x3a4177527302d757, %g1, %r19
        setx  0x8b2398a7b89f4880, %g1, %r20
        setx  0x85655feffbddcc66, %g1, %r21
        setx  0xce03665049c54fe5, %g1, %r22
        setx  0x3524aec874f0626a, %g1, %r23
        setx  0xc1db3c4bb3e04ff1, %g1, %r24
        setx  0x4ec959454cfc49fc, %g1, %r25
        setx  0x7a60a699f47c0cd5, %g1, %r26
        setx  0xf97272299d8a1cd2, %g1, %r27
        setx  0xddbf0e81fe552ca7, %g1, %r28
        setx  0x080cb46404cc751c, %g1, %r29
        setx  0x1e641c611301602d, %g1, %r30
        setx  0xd5bc3dfd18ae3c47, %g1, %r31
	save %r0, %r0, %r31
        setx  MAIN_BASE_DATA_VA, %r1, %r16
        setx  0x00000000000009c0, %g1, %r17
        setx  0xc3e4d1756b9ef697, %g1, %r0
        setx  0xa3383341099c98d9, %g1, %r1
        setx  0x6dce2d2c1e27d7fd, %g1, %r2
        setx  0xad2931bf9dc0c089, %g1, %r3
        setx  0x1232e3b7cb67c262, %g1, %r4
        setx  0x40ea41358edb551d, %g1, %r5
        setx  0x2185ccb80b515161, %g1, %r6
        setx  0x643b45f3e64b2653, %g1, %r7
        setx  0x110712dc45613138, %g1, %r8
        setx  0x7a86217b37e60f74, %g1, %r9
        setx  0x8531094b927ab813, %g1, %r10
        setx  0x11ba7cd7da7d6a87, %g1, %r11
        setx  0xbb648a61c552af65, %g1, %r12
        setx  0x9b3ba3c55da27cd4, %g1, %r13
        setx  0x0652e929b4990ae7, %g1, %r14
        setx  0x60d628467772134b, %g1, %r15
        setx  0x3b1ddf984e44015a, %g1, %r18
        setx  0x3a4484209f049179, %g1, %r19
        setx  0x0b93f13416b3d43e, %g1, %r20
        setx  0xf927f224ced26169, %g1, %r21
        setx  0x31ce387dd1bde1dd, %g1, %r22
        setx  0x0055bbf054cf532d, %g1, %r23
        setx  0x4d76cdb676ef5fc0, %g1, %r24
        setx  0x836f148865e30111, %g1, %r25
        setx  0xca7edb5716da4695, %g1, %r26
        setx  0x528aebca32e5067e, %g1, %r27
        setx  0xef238ecae4eb2646, %g1, %r28
        setx  0x417a8ef0f34c901d, %g1, %r29
        setx  0xdf1a8efc72acfcb6, %g1, %r30
        setx  0xafe6a41b826c1b57, %g1, %r31
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
	.word 0xdadc1011  ! 2: LDXA_R	ldxa	[%r16, %r17] 0x80, %r13
	.word 0xcf142cbf  ! 4: LDQF_I	-	[%r16, 0x0cbf], %f7
	.word 0x8604206d  ! 6: ADD_I	add 	%r16, 0x006d, %r3
	.word 0x9e340011  ! 6: ORN_R	orn 	%r16, %r17, %r15
	.word 0x893c0011  ! 6: SRA_R	sra 	%r16, %r17, %r4
	.word 0x948c0011  ! 6: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0xb02c0011  ! 6: ANDN_R	andn 	%r16, %r17, %r24
	.word 0x8c9c28da  ! 6: XORcc_I	xorcc 	%r16, 0x08da, %r6
	.word 0x9c8c2391  ! 6: ANDcc_I	andcc 	%r16, 0x0391, %r14
	.word 0xb9341011  ! 6: SRLX_R	srlx	%r16, %r17, %r28
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,29)
	.word 0xf9841000  ! 8: LDFA_R	lda	[%r16, %r0], %f28
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0xaa3c0011  ! 12: XNOR_R	xnor 	%r16, %r17, %r21
	.word 0xa60c0011  ! 12: AND_R	and 	%r16, %r17, %r19
	.word 0x8eac0011  ! 12: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x88ac0011  ! 12: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x9e8c2b1c  ! 12: ANDcc_I	andcc 	%r16, 0x0b1c, %r15
	.word 0x9e340011  ! 12: ORN_R	orn 	%r16, %r17, %r15
	.word 0xb9341011  ! 12: SRLX_R	srlx	%r16, %r17, %r28
	.word 0xab643801  ! 12: MOVcc_I	<illegal instruction>
	.word 0xf3142a03  ! 13: LDQF_I	-	[%r16, 0x0a03], %f25
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	ta	T_CHANGE_PRIV	! macro
	.word 0x8cb42cd0  ! 17: ORNcc_I	orncc 	%r16, 0x0cd0, %r6
	.word 0x852c0011  ! 17: SLL_R	sll 	%r16, %r17, %r2
	.word 0xae340011  ! 17: ORN_R	orn 	%r16, %r17, %r23
	.word 0x8d342001  ! 17: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0x9a042ed9  ! 17: ADD_I	add 	%r16, 0x0ed9, %r13
	.word 0x92840011  ! 17: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0x8a142bf5  ! 17: OR_I	or 	%r16, 0x0bf5, %r5
	.word 0xf71c0011  ! 18: LDDF_R	ldd	[%r16, %r17], %f27
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xed1c2d5a  ! 20: LDDF_I	ldd	[%r16, 0x0d5a], %f22
	.word 0xab2c3001  ! 22: SLLX_I	sllx	%r16, 0x0001, %r21
	.word 0xae040011  ! 22: ADD_R	add 	%r16, %r17, %r23
	.word 0x8a1c2c86  ! 22: XOR_I	xor 	%r16, 0x0c86, %r5
	.word 0xae9c0011  ! 22: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x98042652  ! 22: ADD_I	add 	%r16, 0x0652, %r12
	.word 0x8c0423f6  ! 22: ADD_I	add 	%r16, 0x03f6, %r6
	.word 0xb21c2cda  ! 22: XOR_I	xor 	%r16, 0x0cda, %r25
	.word 0x9e9420a7  ! 22: ORcc_I	orcc 	%r16, 0x00a7, %r15
	.word 0xe6142556  ! 23: LDUH_I	lduh	[%r16 + 0x0556], %r19
thr0_resum_intr_756:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_756), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x9ac42fc2  ! 27: ADDCcc_I	addccc 	%r16, 0x0fc2, %r13
	.word 0x8a0c0011  ! 27: AND_R	and 	%r16, %r17, %r5
	.word 0x96842a6e  ! 27: ADDcc_I	addcc 	%r16, 0x0a6e, %r11
	.word 0x91340011  ! 27: SRL_R	srl 	%r16, %r17, %r8
	.word 0x944428d4  ! 27: ADDC_I	addc 	%r16, 0x08d4, %r10
	.word 0x85342001  ! 27: SRL_I	srl 	%r16, 0x0001, %r2
	.word 0xb6ac2ea9  ! 27: ANDNcc_I	andncc 	%r16, 0x0ea9, %r27
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,33)
	.word 0xf6841000  ! 29: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r27
	.word 0xed042c20  ! 31: LDF_I	ld	[%r16, 0x0c20], %f22
	.word 0x94040011  ! 33: ADD_R	add 	%r16, %r17, %r10
	.word 0x8e1c0011  ! 33: XOR_R	xor 	%r16, %r17, %r7
	.word 0x8d2c1011  ! 33: SLLX_R	sllx	%r16, %r17, %r6
	.word 0x9e2c0011  ! 33: ANDN_R	andn 	%r16, %r17, %r15
	.word 0x9a140011  ! 33: OR_R	or 	%r16, %r17, %r13
	.word 0x852c3001  ! 33: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0xe91c2739  ! 34: LDDF_I	ldd	[%r16, 0x0739], %f20
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xf81c0011  ! 36: LDD_R	ldd	[%r16 + %r17], %r28
	.word 0x853c2001  ! 38: SRA_I	sra 	%r16, 0x0001, %r2
	.word 0x868c2dae  ! 38: ANDcc_I	andcc 	%r16, 0x0dae, %r3
	.word 0x98bc0011  ! 38: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0xba042296  ! 38: ADD_I	add 	%r16, 0x0296, %r29
	.word 0xa73c0011  ! 38: SRA_R	sra 	%r16, %r17, %r19
	.word 0x9ab42990  ! 38: ORNcc_I	orncc 	%r16, 0x0990, %r13
	.word 0xba1c2ccf  ! 38: XOR_I	xor 	%r16, 0x0ccf, %r29
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,22)
	.word 0xfa8c2ccf  ! 40: LDUBA_I	lduba	[%r16, + 0x0ccf] %asi, %r29
	.word 0xf2cc2c60  ! 42: LDSBA_I	ldsba	[%r16, + 0x0c60] %asi, %r25
	.word 0x8d341011  ! 44: SRLX_R	srlx	%r16, %r17, %r6
	.word 0xac0c2f5c  ! 44: AND_I	and 	%r16, 0x0f5c, %r22
	.word 0x8d643801  ! 44: MOVcc_I	<illegal instruction>
	.word 0xacc40011  ! 44: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0x853c1011  ! 44: SRAX_R	srax	%r16, %r17, %r2
	.word 0x823429b9  ! 44: ORN_I	orn 	%r16, 0x09b9, %r1
thr0_dc_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_3), 16, 16),1,DC_DATA,44)
	.word 0xc3941000  ! 46: LDQFA_R	-	[%r16, %r0], %f1
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xf22c2592  ! 50: STB_I	stb	%r25, [%r16 + 0x0592]
	.word 0xb0c428d5  ! 52: ADDCcc_I	addccc 	%r16, 0x08d5, %r24
	.word 0x95340011  ! 52: SRL_R	srl 	%r16, %r17, %r10
	.word 0x869c2e1c  ! 52: XORcc_I	xorcc 	%r16, 0x0e1c, %r3
	.word 0x8ab40011  ! 52: ORNcc_R	orncc 	%r16, %r17, %r5
	.word 0xb62c0011  ! 52: ANDN_R	andn 	%r16, %r17, %r27
thr0_dc_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_4), 16, 16),1,DC_DATA,18)
	.word 0xf6cc2e1c  ! 54: LDSBA_I	ldsba	[%r16, + 0x0e1c] %asi, %r27
	.word 0xfa140011  ! 56: LDUH_R	lduh	[%r16 + %r17], %r29
	.word 0x93343001  ! 58: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x86340011  ! 58: ORN_R	orn 	%r16, %r17, %r3
	.word 0x828c2089  ! 58: ANDcc_I	andcc 	%r16, 0x0089, %r1
	.word 0xb3643801  ! 58: MOVcc_I	<illegal instruction>
	.word 0x94c42b0c  ! 58: ADDCcc_I	addccc 	%r16, 0x0b0c, %r10
	.word 0xb52c0011  ! 58: SLL_R	sll 	%r16, %r17, %r26
	.word 0x9b3c2001  ! 58: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0xd80c2ab7  ! 59: LDUB_I	ldub	[%r16 + 0x0ab7], %r12
!Illinst store
	.word 0xc4240011  ! 61: STW_R	stw	%r2, [%r16 + %r17]
	.word 0xaeb42ca9  ! 63: ORNcc_I	orncc 	%r16, 0x0ca9, %r23
	.word 0x98440011  ! 63: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x9414261c  ! 63: OR_I	or 	%r16, 0x061c, %r10
	.word 0xb13c1011  ! 63: SRAX_R	srax	%r16, %r17, %r24
	.word 0xaa3c0011  ! 63: XNOR_R	xnor 	%r16, %r17, %r21
	.word 0xb4842ed1  ! 63: ADDcc_I	addcc 	%r16, 0x0ed1, %r26
	.word 0xad343001  ! 63: SRLX_I	srlx	%r16, 0x0001, %r22
	.word 0x94bc0011  ! 63: XNORcc_R	xnorcc 	%r16, %r17, %r10
thr0_dc_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_5), 16, 16),1,DC_DATA,49)
	.word 0xd4c41000  ! 65: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r10
	.word 0xccb41011  ! 67: STHA_R	stha	%r6, [%r16 + %r17] 0x80
	.word 0x8c2c0011  ! 69: ANDN_R	andn 	%r16, %r17, %r6
	.word 0xb28426fe  ! 69: ADDcc_I	addcc 	%r16, 0x06fe, %r25
	.word 0x9b2c3001  ! 69: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0xb8b4214e  ! 69: ORNcc_I	orncc 	%r16, 0x014e, %r28
	.word 0x84bc0011  ! 69: XNORcc_R	xnorcc 	%r16, %r17, %r2
	.word 0x993c1011  ! 69: SRAX_R	srax	%r16, %r17, %r12
	.word 0xb2c40011  ! 69: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0x848c0011  ! 69: ANDcc_R	andcc 	%r16, %r17, %r2
thr0_dc_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_6), 16, 16),1,DC_DATA,41)
	.word 0xc41c214e  ! 71: LDD_I	ldd	[%r16 + 0x014e], %r2
!Illinst alu
	.word 0xae440011  ! 73: ADDC_R	addc 	%r16, %r17, %r23
	.word 0x8eac29e7  ! 75: ANDNcc_I	andncc 	%r16, 0x09e7, %r7
	.word 0xb77c2401  ! 75: MOVR_I	move	%r16, 0xfffffe54, %r27
	.word 0xb40c0011  ! 75: AND_R	and 	%r16, %r17, %r26
	.word 0x8c442fd4  ! 75: ADDC_I	addc 	%r16, 0x0fd4, %r6
	.word 0xb0ac247d  ! 75: ANDNcc_I	andncc 	%r16, 0x047d, %r24
	.word 0xba9424fc  ! 75: ORcc_I	orcc 	%r16, 0x04fc, %r29
	.word 0xacac2ff5  ! 75: ANDNcc_I	andncc 	%r16, 0x0ff5, %r22
	.word 0xf0c4224c  ! 76: LDSWA_I	ldswa	[%r16, + 0x024c] %asi, %r24
	.word 0xf07427ab  ! 80: STX_I	stx	%r24, [%r16 + 0x07ab]
	.word 0x86842eb7  ! 82: ADDcc_I	addcc 	%r16, 0x0eb7, %r3
	.word 0xa6ac223f  ! 82: ANDNcc_I	andncc 	%r16, 0x023f, %r19
	.word 0x8e8c2107  ! 82: ANDcc_I	andcc 	%r16, 0x0107, %r7
	.word 0xaa3c2085  ! 82: XNOR_I	xnor 	%r16, 0x0085, %r21
	.word 0x82940011  ! 82: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x9abc29f3  ! 83: XNORcc_I	xnorcc 	%r16, 0x09f3, %r13
	.word 0x9ac40011  ! 83: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xaa442986  ! 83: ADDC_I	addc 	%r16, 0x0986, %r21
	.word 0xa9342001  ! 83: SRL_I	srl 	%r16, 0x0001, %r20
	.word 0x8e340011  ! 83: ORN_R	orn 	%r16, %r17, %r7
	.word 0x972c2001  ! 83: SLL_I	sll 	%r16, 0x0001, %r11
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xde042ea4  ! 83: LDUW_I	lduw	[%r16 + 0x0ea4], %r15
	jmpl     %r18 + 0x28, %r31
	.word 0xb32c3001  ! 86: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0x852c3001  ! 86: SLLX_I	sllx	%r16, 0x0001, %r2
	.word 0xae3c0011  ! 86: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x9c442186  ! 86: ADDC_I	addc 	%r16, 0x0186, %r14
	.word 0x89343001  ! 86: SRLX_I	srlx	%r16, 0x0001, %r4
	.word 0xc59c1011  ! 87: LDDFA_R	ldda	[%r16, %r17], %f2
	.word 0xdd941011  ! 89: LDQFA_R	-	[%r16, %r17], %f14
	.word 0x941c0011  ! 91: XOR_R	xor 	%r16, %r17, %r10
	.word 0x88442b99  ! 91: ADDC_I	addc 	%r16, 0x0b99, %r4
	.word 0x93342001  ! 91: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x83342001  ! 91: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x8b2c2001  ! 91: SLL_I	sll 	%r16, 0x0001, %r5
	.word 0x908c298f  ! 91: ANDcc_I	andcc 	%r16, 0x098f, %r8
	.word 0xf25420e4  ! 92: LDSH_I	ldsh	[%r16 + 0x00e4], %r25
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xcd042a44  ! 94: LDF_I	ld	[%r16, 0x0a44], %f6
	.word 0xaaac0011  ! 96: ANDNcc_R	andncc 	%r16, %r17, %r21
	.word 0x882c230f  ! 96: ANDN_I	andn 	%r16, 0x030f, %r4
	.word 0x8c0c0011  ! 96: AND_R	and 	%r16, %r17, %r6
	.word 0x9b641811  ! 96: MOVcc_R	<illegal instruction>
	.word 0xb5641811  ! 96: MOVcc_R	<illegal instruction>
	.word 0x912c3001  ! 96: SLLX_I	sllx	%r16, 0x0001, %r8
	.word 0x9abc223e  ! 96: XNORcc_I	xnorcc 	%r16, 0x023e, %r13
	.word 0x942c0011  ! 96: ANDN_R	andn 	%r16, %r17, %r10
	.word 0xc504265c  ! 97: LDF_I	ld	[%r16, 0x065c], %f2
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xfb1c2b6a  ! 99: LDDF_I	ldd	[%r16, 0x0b6a], %f29
	.word 0x9e342bd3  ! 101: ORN_I	orn 	%r16, 0x0bd3, %r15
	.word 0x940c0011  ! 101: AND_R	and 	%r16, %r17, %r10
	.word 0x95643801  ! 101: MOVcc_I	<illegal instruction>
	.word 0x873c2001  ! 101: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0xb2840011  ! 101: ADDcc_R	addcc 	%r16, %r17, %r25
thr0_dc_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_7), 16, 16),1,DC_DATA,46)
	.word 0xf3140000  ! 103: LDQF_R	-	[%r16, %r0], %f25
thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xfb1c2f65  ! 105: LDDF_I	ldd	[%r16, 0x0f65], %f29
	.word 0x863c2329  ! 107: XNOR_I	xnor 	%r16, 0x0329, %r3
	.word 0x8cb42e94  ! 107: ORNcc_I	orncc 	%r16, 0x0e94, %r6
	.word 0x877c0411  ! 107: MOVR_R	move	%r16, %r17, %r3
	.word 0x872c2001  ! 107: SLL_I	sll 	%r16, 0x0001, %r3
	.word 0x8abc0011  ! 107: XNORcc_R	xnorcc 	%r16, %r17, %r5
	.word 0xacac0011  ! 107: ANDNcc_R	andncc 	%r16, %r17, %r22
	.word 0xc85428d4  ! 108: LDSH_I	ldsh	[%r16 + 0x08d4], %r4
thr0_irf_ce_7:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_7), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xcaa42737  ! 110: STWA_I	stwa	%r5, [%r16 + 0x0737] %asi
	.word 0xb92c1011  ! 112: SLLX_R	sllx	%r16, %r17, %r28
	.word 0xb2ac2c9a  ! 112: ANDNcc_I	andncc 	%r16, 0x0c9a, %r25
	.word 0xa8ac0011  ! 112: ANDNcc_R	andncc 	%r16, %r17, %r20
	.word 0xb32c3001  ! 112: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0x87641811  ! 112: MOVcc_R	<illegal instruction>
	.word 0xab3c2001  ! 112: SRA_I	sra 	%r16, 0x0001, %r21
	.word 0x943c0011  ! 112: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0xda1c0011  ! 113: LDD_R	ldd	[%r16 + %r17], %r13
	.word 0xd2f421f5  ! 115: STXA_I	stxa	%r9, [%r16 + 0x01f5] %asi
	.word 0x90040011  ! 117: ADD_R	add 	%r16, %r17, %r8
	.word 0x832c2001  ! 117: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0xb7342001  ! 117: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0x973c0011  ! 117: SRA_R	sra 	%r16, %r17, %r11
	.word 0xa6c42b3c  ! 117: ADDCcc_I	addccc 	%r16, 0x0b3c, %r19
thr0_dc_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_8), 16, 16),1,DC_DATA,23)
	.word 0xe6540000  ! 119: LDSH_R	ldsh	[%r16 + %r0], %r19
	return     %r18 + %r17
	.word 0xa68c0011  ! 122: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0xa9343001  ! 122: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0xb68c0011  ! 122: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x848c0011  ! 122: ANDcc_R	andcc 	%r16, %r17, %r2
	.word 0x88c421e4  ! 122: ADDCcc_I	addccc 	%r16, 0x01e4, %r4
	.word 0x880c0011  ! 122: AND_R	and 	%r16, %r17, %r4
	.word 0xb62c2e81  ! 122: ANDN_I	andn 	%r16, 0x0e81, %r27
	.word 0x832c3001  ! 122: SLLX_I	sllx	%r16, 0x0001, %r1
	.word 0xe71c0011  ! 123: LDDF_R	ldd	[%r16, %r17], %f19
thr0_irf_ce_8:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_8), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xce5c0011  ! 125: LDX_R	ldx	[%r16 + %r17], %r7
	.word 0x9a140011  ! 127: OR_R	or 	%r16, %r17, %r13
	.word 0xbab40011  ! 127: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x98842cc0  ! 127: ADDcc_I	addcc 	%r16, 0x0cc0, %r12
	.word 0x897c2401  ! 127: MOVR_I	move	%r16, 0xfffffe54, %r4
	.word 0x913c1011  ! 127: SRAX_R	srax	%r16, %r17, %r8
	.word 0x98342a7f  ! 127: ORN_I	orn 	%r16, 0x0a7f, %r12
	.word 0xf8cc1011  ! 128: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r28
	.word 0xc81c0011  ! 130: LDD_R	ldd	[%r16 + %r17], %r4
	.word 0x992c1011  ! 132: SLLX_R	sllx	%r16, %r17, %r12
	.word 0xaf7c0411  ! 132: MOVR_R	move	%r16, %r17, %r23
	.word 0xaa1c0011  ! 132: XOR_R	xor 	%r16, %r17, %r21
	.word 0x98bc2358  ! 132: XNORcc_I	xnorcc 	%r16, 0x0358, %r12
	.word 0xb7343001  ! 132: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0xd8540011  ! 133: LDSH_R	ldsh	[%r16 + %r17], %r12
	.word 0xc2dc2f0e  ! 135: LDXA_I	ldxa	[%r16, + 0x0f0e] %asi, %r1
	.word 0x842c0011  ! 137: ANDN_R	andn 	%r16, %r17, %r2
	.word 0xaa940011  ! 137: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0xa8b42d50  ! 137: ORNcc_I	orncc 	%r16, 0x0d50, %r20
	.word 0xa7340011  ! 137: SRL_R	srl 	%r16, %r17, %r19
	.word 0x98940011  ! 137: ORcc_R	orcc 	%r16, %r17, %r12
thr0_dc_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_9), 16, 16),1,DC_DATA,23)
	.word 0xd8542d50  ! 139: LDSH_I	ldsh	[%r16 + 0x0d50], %r12
thr0_irf_ce_9:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_9), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xf40c29ed  ! 141: LDUB_I	ldub	[%r16 + 0x09ed], %r26
	.word 0xb92c2001  ! 143: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0x9cb40011  ! 143: ORNcc_R	orncc 	%r16, %r17, %r14
	.word 0x909c0011  ! 143: XORcc_R	xorcc 	%r16, %r17, %r8
	.word 0x9a940011  ! 143: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0xb8042aa7  ! 143: ADD_I	add 	%r16, 0x0aa7, %r28
	.word 0x93340011  ! 143: SRL_R	srl 	%r16, %r17, %r9
thr0_dc_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_10), 16, 16),1,DC_DATA,9)
	.word 0xd2c42aa7  ! 145: LDSWA_I	ldswa	[%r16, + 0x0aa7] %asi, %r9
	.word 0xd05c21f8  ! 147: LDX_I	ldx	[%r16 + 0x01f8], %r8
	.word 0xb42c2f7f  ! 149: ANDN_I	andn 	%r16, 0x0f7f, %r26
	.word 0x94442158  ! 149: ADDC_I	addc 	%r16, 0x0158, %r10
	.word 0x9d341011  ! 149: SRLX_R	srlx	%r16, %r17, %r14
	.word 0xad2c2001  ! 149: SLL_I	sll 	%r16, 0x0001, %r22
	.word 0x8cc40011  ! 149: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x897c2401  ! 149: MOVR_I	move	%r16, 0xfffffe54, %r4
	.word 0xd01c2e57  ! 150: LDD_I	ldd	[%r16 + 0x0e57], %r8
	.word 0xd7140011  ! 152: LDQF_R	-	[%r16, %r17], %f11
	.word 0x92ac0011  ! 154: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x9a440011  ! 154: ADDC_R	addc 	%r16, %r17, %r13
	.word 0xae9c0011  ! 154: XORcc_R	xorcc 	%r16, %r17, %r23
	.word 0x82c42892  ! 154: ADDCcc_I	addccc 	%r16, 0x0892, %r1
	.word 0x9e3c2d41  ! 154: XNOR_I	xnor 	%r16, 0x0d41, %r15
	.word 0x909c0011  ! 154: XORcc_R	xorcc 	%r16, %r17, %r8
thr0_dc_err_11:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_11), 16, 16),1,DC_DATA,64)
	.word 0xd08c1000  ! 156: LDUBA_R	lduba	[%r16, %r0] 0x80, %r8
thr0_irf_ce_10:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_10), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xca140011  ! 158: LDUH_R	lduh	[%r16 + %r17], %r5
	.word 0x89341011  ! 160: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x9f643801  ! 160: MOVcc_I	<illegal instruction>
	.word 0xb5341011  ! 160: SRLX_R	srlx	%r16, %r17, %r26
	.word 0x8ac40011  ! 160: ADDCcc_R	addccc 	%r16, %r17, %r5
	.word 0xa7341011  ! 160: SRLX_R	srlx	%r16, %r17, %r19
	.word 0x933c1011  ! 160: SRAX_R	srax	%r16, %r17, %r9
	.word 0x87643801  ! 160: MOVcc_I	<illegal instruction>
	.word 0x9b2c0011  ! 160: SLL_R	sll 	%r16, %r17, %r13
thr0_dc_err_12:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_12), 16, 16),1,DC_DATA,33)
	.word 0xda942d41  ! 162: LDUHA_I	lduha	[%r16, + 0x0d41] %asi, %r13
thr0_irf_ce_11:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_11), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xccec2bc1  ! 164: LDSTUBA_I	ldstuba	%r6, [%r16 + 0x0bc1] %asi
	.word 0xb22c253a  ! 166: ANDN_I	andn 	%r16, 0x053a, %r25
	.word 0xb52c3001  ! 166: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0x83641811  ! 166: MOVcc_R	<illegal instruction>
	.word 0x960c286c  ! 166: AND_I	and 	%r16, 0x086c, %r11
	.word 0xb8bc0011  ! 166: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0xacac0011  ! 166: ANDNcc_R	andncc 	%r16, %r17, %r22
thr0_dc_err_13:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_13), 16, 16),1,DC_DATA,58)
	.word 0xec1c0000  ! 168: LDD_R	ldd	[%r16 + %r0], %r22
thr0_irf_ce_12:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_12), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0x9b6c2496  ! 170: SDIVX_I	sdivx	%r16, 0x0496, %r13
	.word 0xb24423c6  ! 172: ADDC_I	addc 	%r16, 0x03c6, %r25
	.word 0x9a340011  ! 172: ORN_R	orn 	%r16, %r17, %r13
	.word 0xaa2c26b4  ! 172: ANDN_I	andn 	%r16, 0x06b4, %r21
	.word 0x9b342001  ! 172: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x90bc0011  ! 172: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0x8d643801  ! 172: MOVcc_I	<illegal instruction>
	.word 0x86142ba9  ! 172: OR_I	or 	%r16, 0x0ba9, %r3
	.word 0xdd1c2901  ! 173: LDDF_I	ldd	[%r16, 0x0901], %f14
thr0_irf_ce_13:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_13), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xdd040011  ! 175: LDF_R	ld	[%r16, %r17], %f14
	.word 0x8e940011  ! 177: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0xaa840011  ! 177: ADDcc_R	addcc 	%r16, %r17, %r21
	.word 0xa93c2001  ! 177: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x89342001  ! 177: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x9a340011  ! 177: ORN_R	orn 	%r16, %r17, %r13
thr0_dc_err_14:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_14), 16, 16),1,DC_DATA,43)
	.word 0xda0c0000  ! 179: LDUB_R	ldub	[%r16 + %r0], %r13
thr0_irf_ce_14:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_14), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
thr0_resum_intr_757:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_757), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x0, %asr26
	.word 0xb0ac0011  ! 183: ANDNcc_R	andncc 	%r16, %r17, %r24
	.word 0x992c1011  ! 183: SLLX_R	sllx	%r16, %r17, %r12
	.word 0x8ec40011  ! 183: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0x8b643801  ! 183: MOVcc_I	<illegal instruction>
	.word 0x9ac42367  ! 183: ADDCcc_I	addccc 	%r16, 0x0367, %r13
	.word 0x912c1011  ! 183: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x89342001  ! 183: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0xc4942525  ! 184: LDUHA_I	lduha	[%r16, + 0x0525] %asi, %r2
thr0_irf_ce_15:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_15), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xf6dc2210  ! 186: LDXA_I	ldxa	[%r16, + 0x0210] %asi, %r27
	.word 0xb89c2917  ! 188: XORcc_I	xorcc 	%r16, 0x0917, %r28
	.word 0xb69425fb  ! 188: ORcc_I	orcc 	%r16, 0x05fb, %r27
	.word 0x88ac0011  ! 188: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x96042bf0  ! 188: ADD_I	add 	%r16, 0x0bf0, %r11
	.word 0x83641811  ! 188: MOVcc_R	<illegal instruction>
	.word 0xb2c40011  ! 188: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0xd28c1011  ! 189: LDUBA_R	lduba	[%r16, %r17] 0x80, %r9
	.word 0xd6c41011  ! 191: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r11
	.word 0x98bc2552  ! 193: XNORcc_I	xnorcc 	%r16, 0x0552, %r12
	.word 0xb49c0011  ! 193: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0xb6c40011  ! 193: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0xaac40011  ! 193: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0xa81c0011  ! 193: XOR_R	xor 	%r16, %r17, %r20
thr0_dc_err_15:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_15), 16, 16),1,DC_DATA,6)
	.word 0xe8842552  ! 195: LDUWA_I	lduwa	[%r16, + 0x0552] %asi, %r20
	.word 0xdecc1011  ! 197: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r15
	.word 0xb6440011  ! 199: ADDC_R	addc 	%r16, %r17, %r27
	.word 0x9ec40011  ! 199: ADDCcc_R	addccc 	%r16, %r17, %r15
	.word 0x90c40011  ! 199: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0x90140011  ! 199: OR_R	or 	%r16, %r17, %r8
	.word 0xaa2c2a1a  ! 199: ANDN_I	andn 	%r16, 0x0a1a, %r21
thr0_dc_err_16:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_16), 16, 16),1,DC_DATA,27)
	.word 0xeb1c0000  ! 201: LDDF_R	ldd	[%r16, %r0], %f21
thr0_irf_ce_16:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_16), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xdd841011  ! 203: LDFA_R	lda	[%r16, %r17], %f14
	.word 0x889c0011  ! 205: XORcc_R	xorcc 	%r16, %r17, %r4
	.word 0x820429dc  ! 205: ADD_I	add 	%r16, 0x09dc, %r1
	.word 0x913c2001  ! 205: SRA_I	sra 	%r16, 0x0001, %r8
	.word 0x8c842ae5  ! 205: ADDcc_I	addcc 	%r16, 0x0ae5, %r6
	.word 0xb3342001  ! 205: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0x98ac0011  ! 205: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x8d2c2001  ! 205: SLL_I	sll 	%r16, 0x0001, %r6
	.word 0xe7140011  ! 206: LDQF_R	-	[%r16, %r17], %f19
thr0_irf_ce_17:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_17), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xeb14227d  ! 208: LDQF_I	-	[%r16, 0x027d], %f21
	.word 0x8ac42343  ! 210: ADDCcc_I	addccc 	%r16, 0x0343, %r5
	.word 0xaa3c2185  ! 210: XNOR_I	xnor 	%r16, 0x0185, %r21
	.word 0x98c40011  ! 210: ADDCcc_R	addccc 	%r16, %r17, %r12
	.word 0x8f2c3001  ! 210: SLLX_I	sllx	%r16, 0x0001, %r7
	.word 0x8a142044  ! 210: OR_I	or 	%r16, 0x0044, %r5
	.word 0xae140011  ! 210: OR_R	or 	%r16, %r17, %r23
	.word 0x992c3001  ! 210: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x85340011  ! 210: SRL_R	srl 	%r16, %r17, %r2
	.word 0xc60c0011  ! 211: LDUB_R	ldub	[%r16 + %r17], %r3
	.word 0x8143e031  ! 213: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue 
	.word 0xb0440011  ! 215: ADDC_R	addc 	%r16, %r17, %r24
	.word 0xaabc0011  ! 215: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0xb8040011  ! 215: ADD_R	add 	%r16, %r17, %r28
	.word 0x961c24c9  ! 215: XOR_I	xor 	%r16, 0x04c9, %r11
	.word 0x981c2250  ! 215: XOR_I	xor 	%r16, 0x0250, %r12
thr0_dc_err_17:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_17), 16, 16),1,DC_DATA,56)
	.word 0xd91c2250  ! 217: LDDF_I	ldd	[%r16, 0x0250], %f12
thr0_irf_ce_18:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_18), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xfa0c2146  ! 219: LDUB_I	ldub	[%r16 + 0x0146], %r29
	.word 0xad7c2401  ! 221: MOVR_I	move	%r16, 0xfffffe54, %r22
	.word 0x9e940011  ! 221: ORcc_R	orcc 	%r16, %r17, %r15
	.word 0x82c42825  ! 221: ADDCcc_I	addccc 	%r16, 0x0825, %r1
	.word 0x93343001  ! 221: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x94ac2fd1  ! 221: ANDNcc_I	andncc 	%r16, 0x0fd1, %r10
	.word 0xa92c2001  ! 221: SLL_I	sll 	%r16, 0x0001, %r20
thr0_dc_err_18:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_18), 16, 16),1,DC_DATA,20)
	.word 0xe8941000  ! 223: LDUHA_R	lduha	[%r16, %r0] 0x80, %r20
thr0_irf_ce_19:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_19), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xc6140011  ! 225: LDUH_R	lduh	[%r16 + %r17], %r3
	.word 0x901c2734  ! 227: XOR_I	xor 	%r16, 0x0734, %r8
	.word 0x853c0011  ! 227: SRA_R	sra 	%r16, %r17, %r2
	.word 0xa6042874  ! 227: ADD_I	add 	%r16, 0x0874, %r19
	.word 0x94842a25  ! 227: ADDcc_I	addcc 	%r16, 0x0a25, %r10
	.word 0x8a8c2905  ! 227: ANDcc_I	andcc 	%r16, 0x0905, %r5
	.word 0x8e940011  ! 227: ORcc_R	orcc 	%r16, %r17, %r7
	.word 0xb4042aa2  ! 227: ADD_I	add 	%r16, 0x0aa2, %r26
	.word 0xb73c2001  ! 227: SRA_I	sra 	%r16, 0x0001, %r27
thr0_dc_err_19:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_19), 16, 16),1,DC_DATA,43)
	.word 0xf6841000  ! 229: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r27
thr0_irf_ce_20:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_20), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xd0440011  ! 231: LDSW_R	ldsw	[%r16 + %r17], %r8
	.word 0x88140011  ! 233: OR_R	or 	%r16, %r17, %r4
	.word 0xb03c2479  ! 233: XNOR_I	xnor 	%r16, 0x0479, %r24
	.word 0xb2840011  ! 233: ADDcc_R	addcc 	%r16, %r17, %r25
	.word 0x868423c8  ! 233: ADDcc_I	addcc 	%r16, 0x03c8, %r3
	.word 0xab2c0011  ! 233: SLL_R	sll 	%r16, %r17, %r21
	.word 0xc71c0011  ! 234: LDDF_R	ldd	[%r16, %r17], %f3
thr0_irf_ce_21:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_21), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xd4dc2645  ! 236: LDXA_I	ldxa	[%r16, + 0x0645] %asi, %r10
	.word 0x9e842129  ! 238: ADDcc_I	addcc 	%r16, 0x0129, %r15
	.word 0xb0942400  ! 238: ORcc_I	orcc 	%r16, 0x0400, %r24
	.word 0x96140011  ! 238: OR_R	or 	%r16, %r17, %r11
	.word 0x92ac0011  ! 238: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xb02c0011  ! 238: ANDN_R	andn 	%r16, %r17, %r24
	.word 0xae342ad2  ! 238: ORN_I	orn 	%r16, 0x0ad2, %r23
	.word 0xec44268a  ! 239: LDSW_I	ldsw	[%r16 + 0x068a], %r22
thr0_irf_ce_22:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_22), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xdc9c2918  ! 241: LDDA_I	ldda	[%r16, + 0x0918] %asi, %r14
	.word 0x90142aa7  ! 243: OR_I	or 	%r16, 0x0aa7, %r8
	.word 0xaa2c2720  ! 243: ANDN_I	andn 	%r16, 0x0720, %r21
	.word 0xb4842b20  ! 243: ADDcc_I	addcc 	%r16, 0x0b20, %r26
	.word 0xb2b421a0  ! 243: ORNcc_I	orncc 	%r16, 0x01a0, %r25
	.word 0x8ebc0011  ! 243: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0xf0942885  ! 244: LDUHA_I	lduha	[%r16, + 0x0885] %asi, %r24
	.word 0xf68c1011  ! 246: LDUBA_R	lduba	[%r16, %r17] 0x80, %r27
	.word 0x90bc2040  ! 248: XNORcc_I	xnorcc 	%r16, 0x0040, %r8
	.word 0x92840011  ! 248: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0x9c942f7e  ! 248: ORcc_I	orcc 	%r16, 0x0f7e, %r14
	.word 0x841c0011  ! 248: XOR_R	xor 	%r16, %r17, %r2
	.word 0xb0042d76  ! 248: ADD_I	add 	%r16, 0x0d76, %r24
	.word 0x892c2001  ! 248: SLL_I	sll 	%r16, 0x0001, %r4
thr0_dc_err_20:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_20), 16, 16),1,DC_DATA,24)
	.word 0xc85c0000  ! 250: LDX_R	ldx	[%r16 + %r0], %r4
	.word 0xb0742474  ! 252: UDIV_I	udiv 	%r16, 0x0474, %r24
	.word 0xaac40011  ! 254: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0x94840011  ! 254: ADDcc_R	addcc 	%r16, %r17, %r10
	.word 0x96440011  ! 254: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x8cc40011  ! 254: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0x8f643801  ! 254: MOVcc_I	<illegal instruction>
	.word 0xe69c1011  ! 255: LDDA_R	ldda	[%r16, %r17] 0x80, %r19
	rd      %asr26, %r31
	set     0x01f05, %r30
	and     %r31, %r30, %r31
	.word 0x8a3c0011  ! 259: XNOR_R	xnor 	%r16, %r17, %r5
	.word 0xa8942ee8  ! 259: ORcc_I	orcc 	%r16, 0x0ee8, %r20
	.word 0x977c0411  ! 259: MOVR_R	move	%r16, %r17, %r11
	.word 0x853c1011  ! 259: SRAX_R	srax	%r16, %r17, %r2
	.word 0x8e9c27e6  ! 259: XORcc_I	xorcc 	%r16, 0x07e6, %r7
	.word 0xb0b40011  ! 259: ORNcc_R	orncc 	%r16, %r17, %r24
thr0_dc_err_21:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_21), 16, 16),1,DC_DATA,48)
	.word 0xf1040000  ! 261: LDF_R	ld	[%r16, %r0], %f24
	.word 0xec1c0011  ! 263: LDD_R	ldd	[%r16 + %r17], %r22
	.word 0xa8440011  ! 265: ADDC_R	addc 	%r16, %r17, %r20
	.word 0x87343001  ! 265: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x94040011  ! 265: ADD_R	add 	%r16, %r17, %r10
	.word 0x93641811  ! 265: MOVcc_R	<illegal instruction>
	.word 0x94942c39  ! 265: ORcc_I	orcc 	%r16, 0x0c39, %r10
	.word 0x9c94268b  ! 265: ORcc_I	orcc 	%r16, 0x068b, %r14
	.word 0xa82c0011  ! 265: ANDN_R	andn 	%r16, %r17, %r20
	.word 0xe9140011  ! 266: LDQF_R	-	[%r16, %r17], %f20
thr0_irf_ce_23:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_23), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xded41011  ! 268: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r15
	.word 0x963c26d7  ! 270: XNOR_I	xnor 	%r16, 0x06d7, %r11
	.word 0xaf643801  ! 270: MOVcc_I	<illegal instruction>
	.word 0xaac42516  ! 270: ADDCcc_I	addccc 	%r16, 0x0516, %r21
	.word 0x9aac2429  ! 270: ANDNcc_I	andncc 	%r16, 0x0429, %r13
	.word 0x92442cde  ! 270: ADDC_I	addc 	%r16, 0x0cde, %r9
	.word 0xa6c42bcb  ! 270: ADDCcc_I	addccc 	%r16, 0x0bcb, %r19
	.word 0x901423e5  ! 270: OR_I	or 	%r16, 0x03e5, %r8
	.word 0xfa542edc  ! 271: LDSH_I	ldsh	[%r16 + 0x0edc], %r29
        wr %g0, 0x4, %fprs
	.word 0x852c1011  ! 275: SLLX_R	sllx	%r16, %r17, %r2
	.word 0x84440011  ! 275: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x96ac2685  ! 275: ANDNcc_I	andncc 	%r16, 0x0685, %r11
	.word 0xb60c227b  ! 275: AND_I	and 	%r16, 0x027b, %r27
	.word 0x93641811  ! 275: MOVcc_R	<illegal instruction>
	.word 0xb13c2001  ! 275: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0xb13c1011  ! 275: SRAX_R	srax	%r16, %r17, %r24
	.word 0x9804246c  ! 275: ADD_I	add 	%r16, 0x046c, %r12
	.word 0xea8c1011  ! 276: LDUBA_R	lduba	[%r16, %r17] 0x80, %r21
	.word 0xd7040011  ! 278: LDF_R	ld	[%r16, %r17], %f11
	.word 0x98942e70  ! 280: ORcc_I	orcc 	%r16, 0x0e70, %r12
	.word 0xaa9c2ccd  ! 280: XORcc_I	xorcc 	%r16, 0x0ccd, %r21
	.word 0x852c0011  ! 280: SLL_R	sll 	%r16, %r17, %r2
	.word 0x9814239d  ! 280: OR_I	or 	%r16, 0x039d, %r12
	.word 0x921c2e2d  ! 280: XOR_I	xor 	%r16, 0x0e2d, %r9
	.word 0x82840011  ! 280: ADDcc_R	addcc 	%r16, %r17, %r1
	.word 0x8f341011  ! 280: SRLX_R	srlx	%r16, %r17, %r7
thr0_dc_err_22:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_22), 16, 16),1,DC_DATA,40)
	.word 0xcf1c2e2d  ! 282: LDDF_I	ldd	[%r16, 0x0e2d], %f7
	return     %r18 + 0x28
	.word 0x853c0011  ! 285: SRA_R	sra 	%r16, %r17, %r2
	.word 0x8d342001  ! 285: SRL_I	srl 	%r16, 0x0001, %r6
	.word 0xb4442e64  ! 285: ADDC_I	addc 	%r16, 0x0e64, %r26
	.word 0x88b427ff  ! 285: ORNcc_I	orncc 	%r16, 0x07ff, %r4
	.word 0x8a0c0011  ! 285: AND_R	and 	%r16, %r17, %r5
	.word 0xcf1c0011  ! 286: LDDF_R	ldd	[%r16, %r17], %f7
thr0_irf_ce_24:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_24), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xce2c2ec1  ! 291: STB_I	stb	%r7, [%r16 + 0x0ec1]
	.word 0xb81c2a9e  ! 293: XOR_I	xor 	%r16, 0x0a9e, %r28
	.word 0x9b3c2001  ! 293: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0xb12c0011  ! 293: SLL_R	sll 	%r16, %r17, %r24
	.word 0x883c0011  ! 293: XNOR_R	xnor 	%r16, %r17, %r4
	.word 0x84842507  ! 293: ADDcc_I	addcc 	%r16, 0x0507, %r2
	.word 0x9cbc0011  ! 293: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0xccd42f2d  ! 294: LDSHA_I	ldsha	[%r16, + 0x0f2d] %asi, %r6
thr0_irf_ce_25:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_25), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xd84c0011  ! 296: LDSB_R	ldsb	[%r16 + %r17], %r12
	.word 0x848427d3  ! 298: ADDcc_I	addcc 	%r16, 0x07d3, %r2
	.word 0x9a840011  ! 298: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x99641811  ! 298: MOVcc_R	<illegal instruction>
	.word 0x9eb42694  ! 298: ORNcc_I	orncc 	%r16, 0x0694, %r15
	.word 0xaf343001  ! 298: SRLX_I	srlx	%r16, 0x0001, %r23
	.word 0x973c0011  ! 298: SRA_R	sra 	%r16, %r17, %r11
	.word 0x9abc0011  ! 298: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0xb48c0011  ! 298: ANDcc_R	andcc 	%r16, %r17, %r26
	.word 0xead41011  ! 299: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r21
thr0_irf_ce_26:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_26), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xf8042e59  ! 301: LDUW_I	lduw	[%r16 + 0x0e59], %r28
	.word 0xb73c2001  ! 303: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0x940c21fd  ! 303: AND_I	and 	%r16, 0x01fd, %r10
	.word 0xb60c0011  ! 303: AND_R	and 	%r16, %r17, %r27
	.word 0x96c40011  ! 303: ADDCcc_R	addccc 	%r16, %r17, %r11
	.word 0x93342001  ! 303: SRL_I	srl 	%r16, 0x0001, %r9
	.word 0x920c20f5  ! 303: AND_I	and 	%r16, 0x00f5, %r9
	.word 0xaa942eb3  ! 303: ORcc_I	orcc 	%r16, 0x0eb3, %r21
	.word 0xcf941011  ! 304: LDQFA_R	-	[%r16, %r17], %f7
	.word 0x8dec0011  ! 306: RESTORE_R	restore	%r16, %r17, %r6
	.word 0x92bc0011  ! 308: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0xaa940011  ! 308: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x8a8c2753  ! 308: ANDcc_I	andcc 	%r16, 0x0753, %r5
	.word 0xa60c0011  ! 308: AND_R	and 	%r16, %r17, %r19
	.word 0x82c40011  ! 308: ADDCcc_R	addccc 	%r16, %r17, %r1
thr0_dc_err_23:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_23), 16, 16),1,DC_DATA,60)
	.word 0xc3142753  ! 310: LDQF_I	-	[%r16, 0x0753], %f1
	.word 0xd1941011  ! 312: LDQFA_R	-	[%r16, %r17], %f8
	.word 0xb2c40011  ! 314: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0xb2c4297a  ! 314: ADDCcc_I	addccc 	%r16, 0x097a, %r25
	.word 0x97342001  ! 314: SRL_I	srl 	%r16, 0x0001, %r11
	.word 0xa6340011  ! 314: ORN_R	orn 	%r16, %r17, %r19
	.word 0xaebc2d26  ! 314: XNORcc_I	xnorcc 	%r16, 0x0d26, %r23
	.word 0x993c1011  ! 314: SRAX_R	srax	%r16, %r17, %r12
	.word 0xa88c20d5  ! 314: ANDcc_I	andcc 	%r16, 0x00d5, %r20
	.word 0xc51c2b63  ! 315: LDDF_I	ldd	[%r16, 0x0b63], %f2
thr0_irf_ce_27:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_27), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xc36c209d  ! 317: PREFETCH_I	prefetch	[%r16 + 0x009d], #one_read
	.word 0x92ac0011  ! 319: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0xaabc0011  ! 319: XNORcc_R	xnorcc 	%r16, %r17, %r21
	.word 0x8b2c0011  ! 319: SLL_R	sll 	%r16, %r17, %r5
	.word 0x8e942bf0  ! 319: ORcc_I	orcc 	%r16, 0x0bf0, %r7
	.word 0xa89c2955  ! 319: XORcc_I	xorcc 	%r16, 0x0955, %r20
thr0_dc_err_24:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_24), 16, 16),1,DC_DATA,46)
	.word 0xe88c2955  ! 321: LDUBA_I	lduba	[%r16, + 0x0955] %asi, %r20
thr0_irf_ce_28:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_28), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xd9140011  ! 323: LDQF_R	-	[%r16, %r17], %f12
	.word 0x9abc0011  ! 325: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0xaa940011  ! 325: ORcc_R	orcc 	%r16, %r17, %r21
	.word 0x988c0011  ! 325: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0xaab42e64  ! 325: ORNcc_I	orncc 	%r16, 0x0e64, %r21
	.word 0xa97c2401  ! 325: MOVR_I	move	%r16, 0xfffffe54, %r20
thr0_dc_err_25:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_25), 16, 16),1,DC_DATA,71)
	.word 0xe84c2e64  ! 327: LDSB_I	ldsb	[%r16 + 0x0e64], %r20
	.word 0xdedc1011  ! 329: LDXA_R	ldxa	[%r16, %r17] 0x80, %r15
	.word 0x9b2c2001  ! 331: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0x95643801  ! 331: MOVcc_I	<illegal instruction>
	.word 0x8e1c0011  ! 331: XOR_R	xor 	%r16, %r17, %r7
	.word 0x903c0011  ! 331: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x91641811  ! 331: MOVcc_R	<illegal instruction>
	.word 0x98040011  ! 331: ADD_R	add 	%r16, %r17, %r12
	.word 0x863c268f  ! 331: XNOR_I	xnor 	%r16, 0x068f, %r3
	.word 0x852c3001  ! 331: SLLX_I	sllx	%r16, 0x0001, %r2
thr0_dc_err_26:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_26), 16, 16),1,DC_DATA,37)
	.word 0xc51c268f  ! 333: LDDF_I	ldd	[%r16, 0x068f], %f2
thr0_irf_ce_29:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_29), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xdc342ee4  ! 337: STH_I	sth	%r14, [%r16 + 0x0ee4]
	.word 0x8ac426ff  ! 339: ADDCcc_I	addccc 	%r16, 0x06ff, %r5
	.word 0x8c040011  ! 339: ADD_R	add 	%r16, %r17, %r6
	.word 0x99340011  ! 339: SRL_R	srl 	%r16, %r17, %r12
	.word 0xa97c0411  ! 339: MOVR_R	move	%r16, %r17, %r20
	.word 0xa9641811  ! 339: MOVcc_R	<illegal instruction>
	.word 0x82340011  ! 339: ORN_R	orn 	%r16, %r17, %r1
	.word 0x86340011  ! 339: ORN_R	orn 	%r16, %r17, %r3
thr0_dc_err_27:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_27), 16, 16),1,DC_DATA,45)
	.word 0xc71426ff  ! 341: LDQF_I	-	[%r16, 0x06ff], %f3
	.word 0x81dc0011  ! 343: FLUSH_R	dis not found

	.word 0x869c28e7  ! 345: XORcc_I	xorcc 	%r16, 0x08e7, %r3
	.word 0x8d7c0411  ! 345: MOVR_R	move	%r16, %r17, %r6
	.word 0x9c0c0011  ! 345: AND_R	and 	%r16, %r17, %r14
	.word 0x8a84294d  ! 345: ADDcc_I	addcc 	%r16, 0x094d, %r5
	.word 0x89643801  ! 345: MOVcc_I	<illegal instruction>
	.word 0x96b40011  ! 345: ORNcc_R	orncc 	%r16, %r17, %r11
	.word 0x9cbc0011  ! 345: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0xeb1c0011  ! 346: LDDF_R	ldd	[%r16, %r17], %f21
	.word 0xce040011  ! 348: LDUW_R	lduw	[%r16 + %r17], %r7
	.word 0x9e0426ee  ! 350: ADD_I	add 	%r16, 0x06ee, %r15
	.word 0x90942652  ! 350: ORcc_I	orcc 	%r16, 0x0652, %r8
	.word 0x828c2782  ! 350: ANDcc_I	andcc 	%r16, 0x0782, %r1
	.word 0xba140011  ! 350: OR_R	or 	%r16, %r17, %r29
	.word 0x98440011  ! 350: ADDC_R	addc 	%r16, %r17, %r12
	.word 0x99342001  ! 350: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0xc6cc256f  ! 351: LDSBA_I	ldsba	[%r16, + 0x056f] %asi, %r3
	.word 0xfad42592  ! 353: LDSHA_I	ldsha	[%r16, + 0x0592] %asi, %r29
	.word 0x92ac0011  ! 355: ANDNcc_R	andncc 	%r16, %r17, %r9
	.word 0x9e0c0011  ! 355: AND_R	and 	%r16, %r17, %r15
	.word 0x9b2c1011  ! 355: SLLX_R	sllx	%r16, %r17, %r13
	.word 0x973c2001  ! 355: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x9b2c0011  ! 355: SLL_R	sll 	%r16, %r17, %r13
	.word 0xa8b42f6c  ! 355: ORNcc_I	orncc 	%r16, 0x0f6c, %r20
thr0_dc_err_28:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_28), 16, 16),1,DC_DATA,54)
	.word 0xe88c2f6c  ! 357: LDUBA_I	lduba	[%r16, + 0x0f6c] %asi, %r20
thr0_irf_ce_30:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_30), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xdf1c0011  ! 359: LDDF_R	ldd	[%r16, %r17], %f15
	.word 0x9eac0011  ! 361: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0x98140011  ! 361: OR_R	or 	%r16, %r17, %r12
	.word 0x8c1c0011  ! 361: XOR_R	xor 	%r16, %r17, %r6
	.word 0xa7643801  ! 361: MOVcc_I	<illegal instruction>
	.word 0xa8bc0011  ! 361: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0x90140011  ! 361: OR_R	or 	%r16, %r17, %r8
	.word 0xb4c429fd  ! 361: ADDCcc_I	addccc 	%r16, 0x09fd, %r26
	.word 0x9c2c0011  ! 361: ANDN_R	andn 	%r16, %r17, %r14
	.word 0xd894296b  ! 362: LDUHA_I	lduha	[%r16, + 0x096b] %asi, %r12
thr0_irf_ce_31:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_31), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xd0cc1011  ! 364: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r8
	.word 0xae2c0011  ! 366: ANDN_R	andn 	%r16, %r17, %r23
	.word 0xb2942e15  ! 366: ORcc_I	orcc 	%r16, 0x0e15, %r25
	.word 0x972c2001  ! 366: SLL_I	sll 	%r16, 0x0001, %r11
	.word 0x9f340011  ! 366: SRL_R	srl 	%r16, %r17, %r15
	.word 0xbb2c1011  ! 366: SLLX_R	sllx	%r16, %r17, %r29
	.word 0x98c426f3  ! 366: ADDCcc_I	addccc 	%r16, 0x06f3, %r12
	.word 0x889c2d0c  ! 366: XORcc_I	xorcc 	%r16, 0x0d0c, %r4
thr0_dc_err_29:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_29), 16, 16),1,DC_DATA,26)
	.word 0xc91c2d0c  ! 368: LDDF_I	ldd	[%r16, 0x0d0c], %f4
	.word 0x8ad42f82  ! 370: UMULcc_I	umulcc 	%r16, 0x0f82, %r5
	.word 0x8a8c2c0b  ! 372: ANDcc_I	andcc 	%r16, 0x0c0b, %r5
	.word 0x842c0011  ! 372: ANDN_R	andn 	%r16, %r17, %r2
	.word 0xb0440011  ! 372: ADDC_R	addc 	%r16, %r17, %r24
	.word 0x94340011  ! 372: ORN_R	orn 	%r16, %r17, %r10
	.word 0x94942a28  ! 372: ORcc_I	orcc 	%r16, 0x0a28, %r10
	.word 0x920420c0  ! 372: ADD_I	add 	%r16, 0x00c0, %r9
	.word 0x96bc0011  ! 372: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0xd11c27ee  ! 373: LDDF_I	ldd	[%r16, 0x07ee], %f8
thr0_irf_ce_32:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_32), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
        wr  %g0, 0x80, %asi
	.word 0xae842909  ! 377: ADDcc_I	addcc 	%r16, 0x0909, %r23
	.word 0xac342484  ! 377: ORN_I	orn 	%r16, 0x0484, %r22
	.word 0x9cbc0011  ! 377: XNORcc_R	xnorcc 	%r16, %r17, %r14
	.word 0x96bc0011  ! 377: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0x8e1c0011  ! 377: XOR_R	xor 	%r16, %r17, %r7
thr0_dc_err_30:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_30), 16, 16),1,DC_DATA,61)
	.word 0xce542484  ! 379: LDSH_I	ldsh	[%r16 + 0x0484], %r7
thr0_irf_ce_33:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_33), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xf79c1011  ! 381: LDDFA_R	ldda	[%r16, %r17], %f27
	.word 0x981c2b41  ! 383: XOR_I	xor 	%r16, 0x0b41, %r12
	.word 0x96940011  ! 383: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0x8c142665  ! 383: OR_I	or 	%r16, 0x0665, %r6
	.word 0x88940011  ! 383: ORcc_R	orcc 	%r16, %r17, %r4
	.word 0xac840011  ! 383: ADDcc_R	addcc 	%r16, %r17, %r22
	.word 0x92c40011  ! 383: ADDCcc_R	addccc 	%r16, %r17, %r9
	.word 0xb6042004  ! 383: ADD_I	add 	%r16, 0x0004, %r27
thr0_dc_err_31:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_31), 16, 16),1,DC_DATA,47)
	.word 0xf6d42004  ! 385: LDSHA_I	ldsha	[%r16, + 0x0004] %asi, %r27
	.word 0xde4c2330  ! 387: LDSB_I	ldsb	[%r16 + 0x0330], %r15
	.word 0x8b342001  ! 389: SRL_I	srl 	%r16, 0x0001, %r5
	.word 0xacbc21c9  ! 389: XNORcc_I	xnorcc 	%r16, 0x01c9, %r22
	.word 0x90840011  ! 389: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0x937c0411  ! 389: MOVR_R	move	%r16, %r17, %r9
	.word 0x9e1c266c  ! 389: XOR_I	xor 	%r16, 0x066c, %r15
	.word 0xc81c0011  ! 390: LDD_R	ldd	[%r16 + %r17], %r4
thr0_irf_ce_34:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_34), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xd5941011  ! 392: LDQFA_R	-	[%r16, %r17], %f10
	.word 0x881c0011  ! 394: XOR_R	xor 	%r16, %r17, %r4
	.word 0x9b641811  ! 394: MOVcc_R	<illegal instruction>
	.word 0x9abc0011  ! 394: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x96142511  ! 394: OR_I	or 	%r16, 0x0511, %r11
	.word 0x8e042f94  ! 394: ADD_I	add 	%r16, 0x0f94, %r7
	.word 0x917c2401  ! 394: MOVR_I	move	%r16, 0xfffffe54, %r8
	.word 0xd91c0011  ! 395: LDDF_R	ldd	[%r16, %r17], %f12
thr0_irf_ce_35:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_35), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xdc941011  ! 397: LDUHA_R	lduha	[%r16, %r17] 0x80, %r14
	.word 0xba840011  ! 399: ADDcc_R	addcc 	%r16, %r17, %r29
	.word 0xae2c2cea  ! 399: ANDN_I	andn 	%r16, 0x0cea, %r23
	.word 0xae2c2dbe  ! 399: ANDN_I	andn 	%r16, 0x0dbe, %r23
	.word 0xb09c0011  ! 399: XORcc_R	xorcc 	%r16, %r17, %r24
	.word 0x9e9c0011  ! 399: XORcc_R	xorcc 	%r16, %r17, %r15
	.word 0xaa8420f1  ! 399: ADDcc_I	addcc 	%r16, 0x00f1, %r21
	.word 0x8c040011  ! 399: ADD_R	add 	%r16, %r17, %r6
	.word 0xac1c0011  ! 399: XOR_R	xor 	%r16, %r17, %r22
thr0_dc_err_32:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_32), 16, 16),1,DC_DATA,9)
	.word 0xec9420f1  ! 401: LDUHA_I	lduha	[%r16, + 0x00f1] %asi, %r22
thr0_irf_ce_36:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_36), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
thr0_resum_intr_758:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_758), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x4, %asr26
	.word 0x8a840011  ! 405: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0xbab42f93  ! 405: ORNcc_I	orncc 	%r16, 0x0f93, %r29
	.word 0xa6940011  ! 405: ORcc_R	orcc 	%r16, %r17, %r19
	.word 0x91643801  ! 405: MOVcc_I	<illegal instruction>
	.word 0xaa9c23f8  ! 405: XORcc_I	xorcc 	%r16, 0x03f8, %r21
	.word 0x982c0011  ! 405: ANDN_R	andn 	%r16, %r17, %r12
	.word 0xad641811  ! 405: MOVcc_R	<illegal instruction>
thr0_dc_err_33:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_33), 16, 16),1,DC_DATA,12)
	.word 0xec4c0000  ! 407: LDSB_R	ldsb	[%r16 + %r0], %r22
	.word 0xdb9c1011  ! 409: LDDFA_R	ldda	[%r16, %r17], %f13
	.word 0xa63c0011  ! 411: XNOR_R	xnor 	%r16, %r17, %r19
	.word 0x92940011  ! 411: ORcc_R	orcc 	%r16, %r17, %r9
	.word 0x9ebc2694  ! 411: XNORcc_I	xnorcc 	%r16, 0x0694, %r15
	.word 0x862c0011  ! 411: ANDN_R	andn 	%r16, %r17, %r3
	.word 0x961c2629  ! 411: XOR_I	xor 	%r16, 0x0629, %r11
	.word 0xae142ea0  ! 411: OR_I	or 	%r16, 0x0ea0, %r23
	.word 0x869c2bc4  ! 411: XORcc_I	xorcc 	%r16, 0x0bc4, %r3
	.word 0xacbc0011  ! 411: XNORcc_R	xnorcc 	%r16, %r17, %r22
	.word 0xe8cc1011  ! 412: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r20
thr0_irf_ce_37:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_37), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xea8c24ab  ! 414: LDUBA_I	lduba	[%r16, + 0x04ab] %asi, %r21
	.word 0xaeb40011  ! 416: ORNcc_R	orncc 	%r16, %r17, %r23
	.word 0x95641811  ! 416: MOVcc_R	<illegal instruction>
	.word 0x948c0011  ! 416: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x94040011  ! 416: ADD_R	add 	%r16, %r17, %r10
	.word 0xb3342001  ! 416: SRL_I	srl 	%r16, 0x0001, %r25
thr0_dc_err_34:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_34), 16, 16),1,DC_DATA,64)
	.word 0xf2941000  ! 418: LDUHA_R	lduha	[%r16, %r0] 0x80, %r25
	ta	T_CHANGE_HPRIV	! macro
	.word 0x961c2456  ! 422: XOR_I	xor 	%r16, 0x0456, %r11
	.word 0x9c842c9a  ! 422: ADDcc_I	addcc 	%r16, 0x0c9a, %r14
	.word 0x9b343001  ! 422: SRLX_I	srlx	%r16, 0x0001, %r13
	.word 0x9e840011  ! 422: ADDcc_R	addcc 	%r16, %r17, %r15
	.word 0x89641811  ! 422: MOVcc_R	<illegal instruction>
	.word 0xaf643801  ! 422: MOVcc_I	<illegal instruction>
	.word 0xe7040011  ! 423: LDF_R	ld	[%r16, %r17], %f19
	.word 0xdb841011  ! 425: LDFA_R	lda	[%r16, %r17], %f13
	.word 0x912c0011  ! 427: SLL_R	sll 	%r16, %r17, %r8
	.word 0xaa2c2f63  ! 427: ANDN_I	andn 	%r16, 0x0f63, %r21
	.word 0xb8342d80  ! 427: ORN_I	orn 	%r16, 0x0d80, %r28
	.word 0xb8ac0011  ! 427: ANDNcc_R	andncc 	%r16, %r17, %r28
	.word 0x88140011  ! 427: OR_R	or 	%r16, %r17, %r4
	.word 0x9b7c2401  ! 427: MOVR_I	move	%r16, 0xfffffe54, %r13
thr0_dc_err_35:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_35), 16, 16),1,DC_DATA,54)
	.word 0xda040000  ! 429: LDUW_R	lduw	[%r16 + %r0], %r13
thr0_irf_ce_38:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_38), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xd4942d31  ! 431: LDUHA_I	lduha	[%r16, + 0x0d31] %asi, %r10
	.word 0x832c2001  ! 433: SLL_I	sll 	%r16, 0x0001, %r1
	.word 0x98bc0011  ! 433: XNORcc_R	xnorcc 	%r16, %r17, %r12
	.word 0xa8440011  ! 433: ADDC_R	addc 	%r16, %r17, %r20
	.word 0xb4340011  ! 433: ORN_R	orn 	%r16, %r17, %r26
	.word 0x9a3c2f15  ! 433: XNOR_I	xnor 	%r16, 0x0f15, %r13
	.word 0x869c0011  ! 433: XORcc_R	xorcc 	%r16, %r17, %r3
	.word 0x937c2401  ! 433: MOVR_I	move	%r16, 0xfffffe54, %r9
thr0_dc_err_36:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_36), 16, 16),1,DC_DATA,26)
	.word 0xd2440000  ! 435: LDSW_R	ldsw	[%r16 + %r0], %r9
thr0_irf_ce_39:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_39), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xd6dc2615  ! 437: LDXA_I	ldxa	[%r16, + 0x0615] %asi, %r11
	.word 0xad7c2401  ! 439: MOVR_I	move	%r16, 0xfffffe54, %r22
	.word 0x9b340011  ! 439: SRL_R	srl 	%r16, %r17, %r13
	.word 0xb49c0011  ! 439: XORcc_R	xorcc 	%r16, %r17, %r26
	.word 0x949c2e5e  ! 439: XORcc_I	xorcc 	%r16, 0x0e5e, %r10
	.word 0x88c40011  ! 439: ADDCcc_R	addccc 	%r16, %r17, %r4
	.word 0x8ac40011  ! 439: ADDCcc_R	addccc 	%r16, %r17, %r5
thr0_dc_err_37:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_37), 16, 16),1,DC_DATA,5)
	.word 0xca5c2e5e  ! 441: LDX_I	ldx	[%r16 + 0x0e5e], %r5
	.word 0xdc44218c  ! 443: LDSW_I	ldsw	[%r16 + 0x018c], %r14
	.word 0x9084253f  ! 445: ADDcc_I	addcc 	%r16, 0x053f, %r8
	.word 0xb20c27b2  ! 445: AND_I	and 	%r16, 0x07b2, %r25
	.word 0x901c0011  ! 445: XOR_R	xor 	%r16, %r17, %r8
	.word 0xab3c2001  ! 445: SRA_I	sra 	%r16, 0x0001, %r21
	.word 0xacb42761  ! 445: ORNcc_I	orncc 	%r16, 0x0761, %r22
	.word 0x8d7c2401  ! 445: MOVR_I	move	%r16, 0xfffffe54, %r6
	.word 0xaf341011  ! 445: SRLX_R	srlx	%r16, %r17, %r23
thr0_dc_err_38:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_38), 16, 16),1,DC_DATA,67)
	.word 0xeed42761  ! 447: LDSHA_I	ldsha	[%r16, + 0x0761] %asi, %r23
	return     %r18 + 0x28
	.word 0xac9c20e7  ! 450: XORcc_I	xorcc 	%r16, 0x00e7, %r22
	.word 0x893c2001  ! 450: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0x9a940011  ! 450: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x992c3001  ! 450: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x9a9c2287  ! 450: XORcc_I	xorcc 	%r16, 0x0287, %r13
	.word 0xa88c0011  ! 450: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0xaa842f86  ! 450: ADDcc_I	addcc 	%r16, 0x0f86, %r21
	.word 0xa7340011  ! 450: SRL_R	srl 	%r16, %r17, %r19
thr0_dc_err_39:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_39), 16, 16),1,DC_DATA,39)
	.word 0xe79c1000  ! 452: LDDFA_R	ldda	[%r16, %r0], %f19
thr0_irf_ce_40:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_40), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xc5841011  ! 454: LDFA_R	lda	[%r16, %r17], %f2
	.word 0xae1c2cd1  ! 456: XOR_I	xor 	%r16, 0x0cd1, %r23
	.word 0x917c2401  ! 456: MOVR_I	move	%r16, 0xfffffe54, %r8
	.word 0xad641811  ! 456: MOVcc_R	<illegal instruction>
	.word 0xb0c40011  ! 456: ADDCcc_R	addccc 	%r16, %r17, %r24
	.word 0x888c2f76  ! 456: ANDcc_I	andcc 	%r16, 0x0f76, %r4
	.word 0x84ac2c42  ! 456: ANDNcc_I	andncc 	%r16, 0x0c42, %r2
	.word 0x889c2251  ! 456: XORcc_I	xorcc 	%r16, 0x0251, %r4
	.word 0xfa0c2fd4  ! 457: LDUB_I	ldub	[%r16 + 0x0fd4], %r29
	.word 0xc9941011  ! 459: LDQFA_R	-	[%r16, %r17], %f4
	.word 0xb234292d  ! 461: ORN_I	orn 	%r16, 0x092d, %r25
	.word 0x8c3c26c2  ! 461: XNOR_I	xnor 	%r16, 0x06c2, %r6
	.word 0x9a142a6b  ! 461: OR_I	or 	%r16, 0x0a6b, %r13
	.word 0x8a140011  ! 461: OR_R	or 	%r16, %r17, %r5
	.word 0x842c0011  ! 461: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x9b2c1011  ! 461: SLLX_R	sllx	%r16, %r17, %r13
	.word 0x91641811  ! 461: MOVcc_R	<illegal instruction>
	.word 0x9694254b  ! 461: ORcc_I	orcc 	%r16, 0x054b, %r11
thr0_dc_err_40:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_40), 16, 16),1,DC_DATA,56)
	.word 0xd71c0000  ! 463: LDDF_R	ldd	[%r16, %r0], %f11
thr0_irf_ce_41:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_41), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xdc842a95  ! 465: LDUWA_I	lduwa	[%r16, + 0x0a95] %asi, %r14
	.word 0xac0c0011  ! 467: AND_R	and 	%r16, %r17, %r22
	.word 0xb6342b7c  ! 467: ORN_I	orn 	%r16, 0x0b7c, %r27
	.word 0xaeb42be7  ! 467: ORNcc_I	orncc 	%r16, 0x0be7, %r23
	.word 0x8f342001  ! 467: SRL_I	srl 	%r16, 0x0001, %r7
	.word 0xad641811  ! 467: MOVcc_R	<illegal instruction>
	.word 0xaa0c2146  ! 467: AND_I	and 	%r16, 0x0146, %r21
	.word 0x87341011  ! 467: SRLX_R	srlx	%r16, %r17, %r3
	.word 0x973c1011  ! 467: SRAX_R	srax	%r16, %r17, %r11
	.word 0xf89c274a  ! 468: LDDA_I	ldda	[%r16, + 0x074a] %asi, %r28
!Illinst store
	.word 0xde240011  ! 470: STW_R	stw	%r15, [%r16 + %r17]
	.word 0xa7342001  ! 472: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0x82bc0011  ! 472: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x992c0011  ! 472: SLL_R	sll 	%r16, %r17, %r12
	.word 0xaac40011  ! 472: ADDCcc_R	addccc 	%r16, %r17, %r21
	.word 0x84342d21  ! 472: ORN_I	orn 	%r16, 0x0d21, %r2
	.word 0x9a442f3e  ! 472: ADDC_I	addc 	%r16, 0x0f3e, %r13
	.word 0xc4142116  ! 473: LDUH_I	lduh	[%r16 + 0x0116], %r2
thr0_irf_ce_42:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_42), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xa6d40011  ! 475: UMULcc_R	umulcc 	%r16, %r17, %r19
	.word 0x957c0411  ! 477: MOVR_R	move	%r16, %r17, %r10
	.word 0x9f2c3001  ! 477: SLLX_I	sllx	%r16, 0x0001, %r15
	.word 0xa80c0011  ! 477: AND_R	and 	%r16, %r17, %r20
	.word 0x923c0011  ! 477: XNOR_R	xnor 	%r16, %r17, %r9
	.word 0x8c04292f  ! 477: ADD_I	add 	%r16, 0x092f, %r6
	.word 0x85340011  ! 477: SRL_R	srl 	%r16, %r17, %r2
	.word 0x9eac25d0  ! 477: ANDNcc_I	andncc 	%r16, 0x05d0, %r15
	.word 0xfa1c2e79  ! 478: LDD_I	ldd	[%r16 + 0x0e79], %r29
	.word 0xec0421d8  ! 480: LDUW_I	lduw	[%r16 + 0x01d8], %r22
	.word 0x99342001  ! 482: SRL_I	srl 	%r16, 0x0001, %r12
	.word 0x953c0011  ! 482: SRA_R	sra 	%r16, %r17, %r10
	.word 0x9a042a67  ! 482: ADD_I	add 	%r16, 0x0a67, %r13
	.word 0xbb341011  ! 482: SRLX_R	srlx	%r16, %r17, %r29
	.word 0x943c0011  ! 482: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0xd5841011  ! 483: LDFA_R	lda	[%r16, %r17], %f10
	.word 0xf24c2a4b  ! 485: LDSB_I	ldsb	[%r16 + 0x0a4b], %r25
	.word 0x92142d55  ! 487: OR_I	or 	%r16, 0x0d55, %r9
	.word 0xa89c0011  ! 487: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0x82bc2462  ! 487: XNORcc_I	xnorcc 	%r16, 0x0462, %r1
	.word 0x96bc0011  ! 487: XNORcc_R	xnorcc 	%r16, %r17, %r11
	.word 0xba2c28da  ! 487: ANDN_I	andn 	%r16, 0x08da, %r29
	.word 0xb08c0011  ! 487: ANDcc_R	andcc 	%r16, %r17, %r24
	.word 0x877c2401  ! 488: MOVR_I	move	%r16, 0xfffffe54, %r3
	.word 0xa8b42aba  ! 488: ORNcc_I	orncc 	%r16, 0x0aba, %r20
	.word 0xab2c1011  ! 488: SLLX_R	sllx	%r16, %r17, %r21
	.word 0x88bc0011  ! 488: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0x82940011  ! 488: ORcc_R	orcc 	%r16, %r17, %r1
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xcb841011  ! 488: LDFA_R	lda	[%r16, %r17], %f5
thr0_irf_ce_43:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_43), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	jmpl     %r18 + 0x28, %r31
	.word 0x853c1011  ! 491: SRAX_R	srax	%r16, %r17, %r2
	.word 0x8eac0011  ! 491: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0x88ac2384  ! 491: ANDNcc_I	andncc 	%r16, 0x0384, %r4
	.word 0x90140011  ! 491: OR_R	or 	%r16, %r17, %r8
	.word 0xb8140011  ! 491: OR_R	or 	%r16, %r17, %r28
	.word 0x992c3001  ! 491: SLLX_I	sllx	%r16, 0x0001, %r12
	.word 0x90bc2aaa  ! 491: XNORcc_I	xnorcc 	%r16, 0x0aaa, %r8
thr0_dc_err_41:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_41), 16, 16),1,DC_DATA,4)
	.word 0xd0841000  ! 493: LDUWA_R	lduwa	[%r16, %r0] 0x80, %r8
	.word 0x89e40011  ! 495: SAVE_R	save	%r16, %r17, %r4
	.word 0x942c0011  ! 497: ANDN_R	andn 	%r16, %r17, %r10
	.word 0xb02c0011  ! 497: ANDN_R	andn 	%r16, %r17, %r24
	.word 0xac342cb4  ! 497: ORN_I	orn 	%r16, 0x0cb4, %r22
	.word 0xb23c2c0a  ! 497: XNOR_I	xnor 	%r16, 0x0c0a, %r25
	.word 0x88040011  ! 497: ADD_R	add 	%r16, %r17, %r4
	.word 0xda941011  ! 498: LDUHA_R	lduha	[%r16, %r17] 0x80, %r13
	.word 0xe6dc1011  ! 500: LDXA_R	ldxa	[%r16, %r17] 0x80, %r19
	.word 0x9b641811  ! 502: MOVcc_R	<illegal instruction>
	.word 0xb61c0011  ! 502: XOR_R	xor 	%r16, %r17, %r27
	.word 0xa8042617  ! 502: ADD_I	add 	%r16, 0x0617, %r20
	.word 0x8cc40011  ! 502: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0xb41421ff  ! 502: OR_I	or 	%r16, 0x01ff, %r26
	.word 0x943c0011  ! 502: XNOR_R	xnor 	%r16, %r17, %r10
	.word 0x937c0411  ! 502: MOVR_R	move	%r16, %r17, %r9
thr0_dc_err_42:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_42), 16, 16),1,DC_DATA,55)
	.word 0xd25421ff  ! 504: LDSH_I	ldsh	[%r16 + 0x01ff], %r9
	.word 0xd88c1011  ! 506: LDUBA_R	lduba	[%r16, %r17] 0x80, %r12
	.word 0xa8b40011  ! 508: ORNcc_R	orncc 	%r16, %r17, %r20
	.word 0xbb3c1011  ! 508: SRAX_R	srax	%r16, %r17, %r29
	.word 0x8d7c2401  ! 508: MOVR_I	move	%r16, 0xfffffe54, %r6
	.word 0xb72c2001  ! 508: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xb8bc0011  ! 508: XNORcc_R	xnorcc 	%r16, %r17, %r28
	.word 0x9f643801  ! 508: MOVcc_I	<illegal instruction>
	.word 0x9ebc2aad  ! 508: XNORcc_I	xnorcc 	%r16, 0x0aad, %r15
	.word 0x943c0011  ! 508: XNOR_R	xnor 	%r16, %r17, %r10
thr0_dc_err_43:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_43), 16, 16),1,DC_DATA,3)
	.word 0xd51c2aad  ! 510: LDDF_I	ldd	[%r16, 0x0aad], %f10
thr0_irf_ce_44:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_44), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xdf1c0011  ! 512: LDDF_R	ldd	[%r16, %r17], %f15
	.word 0xb80c26ac  ! 514: AND_I	and 	%r16, 0x06ac, %r28
	.word 0xb7643801  ! 514: MOVcc_I	<illegal instruction>
	.word 0xba2c0011  ! 514: ANDN_R	andn 	%r16, %r17, %r29
	.word 0xa81c2714  ! 514: XOR_I	xor 	%r16, 0x0714, %r20
	.word 0xa6940011  ! 514: ORcc_R	orcc 	%r16, %r17, %r19
	.word 0x877c0411  ! 514: MOVR_R	move	%r16, %r17, %r3
	.word 0xae3c0011  ! 514: XNOR_R	xnor 	%r16, %r17, %r23
	.word 0x84b40011  ! 514: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xd4dc2380  ! 515: LDXA_I	ldxa	[%r16, + 0x0380] %asi, %r10
	.word 0xf5140011  ! 517: LDQF_R	-	[%r16, %r17], %f26
	.word 0x9a840011  ! 519: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0xab3c2001  ! 519: SRA_I	sra 	%r16, 0x0001, %r21
	.word 0x829c0011  ! 519: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x882c0011  ! 519: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x8f340011  ! 519: SRL_R	srl 	%r16, %r17, %r7
	.word 0xacc40011  ! 519: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0x972c1011  ! 519: SLLX_R	sllx	%r16, %r17, %r11
	.word 0x840c0011  ! 519: AND_R	and 	%r16, %r17, %r2
	.word 0xdcdc1011  ! 520: LDXA_R	ldxa	[%r16, %r17] 0x80, %r14
thr0_irf_ce_45:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_45), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xcf941011  ! 522: LDQFA_R	-	[%r16, %r17], %f7
	.word 0x8e14293e  ! 524: OR_I	or 	%r16, 0x093e, %r7
	.word 0xb08c2c51  ! 524: ANDcc_I	andcc 	%r16, 0x0c51, %r24
	.word 0xa80c25ab  ! 524: AND_I	and 	%r16, 0x05ab, %r20
	.word 0x900c29f1  ! 524: AND_I	and 	%r16, 0x09f1, %r8
	.word 0xb6942dac  ! 524: ORcc_I	orcc 	%r16, 0x0dac, %r27
thr0_dc_err_44:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_44), 16, 16),1,DC_DATA,9)
	.word 0xf6140000  ! 526: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xcb040011  ! 528: LDF_R	ld	[%r16, %r17], %f5
	.word 0xb43c0011  ! 530: XNOR_R	xnor 	%r16, %r17, %r26
	.word 0x9cc42e28  ! 530: ADDCcc_I	addccc 	%r16, 0x0e28, %r14
	.word 0x988c0011  ! 530: ANDcc_R	andcc 	%r16, %r17, %r12
	.word 0xac042d74  ! 530: ADD_I	add 	%r16, 0x0d74, %r22
	.word 0xa9643801  ! 530: MOVcc_I	<illegal instruction>
thr0_dc_err_45:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_45), 16, 16),1,DC_DATA,1)
	.word 0xe9040000  ! 532: LDF_R	ld	[%r16, %r0], %f20
	.word 0xc8dc1011  ! 534: LDXA_R	ldxa	[%r16, %r17] 0x80, %r4
	.word 0xa9643801  ! 536: MOVcc_I	<illegal instruction>
	.word 0x8f3c0011  ! 536: SRA_R	sra 	%r16, %r17, %r7
	.word 0x98ac0011  ! 536: ANDNcc_R	andncc 	%r16, %r17, %r12
	.word 0x9c8c0011  ! 536: ANDcc_R	andcc 	%r16, %r17, %r14
	.word 0x832c0011  ! 536: SLL_R	sll 	%r16, %r17, %r1
	.word 0xa68c0011  ! 536: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0xb23c0011  ! 536: XNOR_R	xnor 	%r16, %r17, %r25
	.word 0xce9c1011  ! 537: LDDA_R	ldda	[%r16, %r17] 0x80, %r7
thr0_irf_ce_46:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_46), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xd1841011  ! 539: LDFA_R	lda	[%r16, %r17], %f8
	.word 0xba940011  ! 541: ORcc_R	orcc 	%r16, %r17, %r29
	.word 0x9e842361  ! 541: ADDcc_I	addcc 	%r16, 0x0361, %r15
	.word 0x921c2eef  ! 541: XOR_I	xor 	%r16, 0x0eef, %r9
	.word 0x92340011  ! 541: ORN_R	orn 	%r16, %r17, %r9
	.word 0x9b340011  ! 541: SRL_R	srl 	%r16, %r17, %r13
	.word 0x962c2fb7  ! 541: ANDN_I	andn 	%r16, 0x0fb7, %r11
	.word 0x84440011  ! 541: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x912c3001  ! 541: SLLX_I	sllx	%r16, 0x0001, %r8
thr0_dc_err_46:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_46), 16, 16),1,DC_DATA,64)
	.word 0xd09c2fb7  ! 543: LDDA_I	ldda	[%r16, + 0x0fb7] %asi, %r8
!Illinst store
	.word 0xd6340011  ! 545: STH_R	sth	%r11, [%r16 + %r17]
	.word 0x9b3c1011  ! 547: SRAX_R	srax	%r16, %r17, %r13
	.word 0xacc40011  ! 547: ADDCcc_R	addccc 	%r16, %r17, %r22
	.word 0x9c8423db  ! 547: ADDcc_I	addcc 	%r16, 0x03db, %r14
	.word 0x84340011  ! 547: ORN_R	orn 	%r16, %r17, %r2
	.word 0xb8942a84  ! 547: ORcc_I	orcc 	%r16, 0x0a84, %r28
	.word 0x929c246c  ! 547: XORcc_I	xorcc 	%r16, 0x046c, %r9
thr0_dc_err_47:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_47), 16, 16),1,DC_DATA,20)
	.word 0xd2440000  ! 549: LDSW_R	ldsw	[%r16 + %r0], %r9
thr0_irf_ce_47:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_47), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf7042ded  ! 551: LDF_I	ld	[%r16, 0x0ded], %f27
	.word 0x9a442816  ! 553: ADDC_I	addc 	%r16, 0x0816, %r13
	.word 0x87343001  ! 553: SRLX_I	srlx	%r16, 0x0001, %r3
	.word 0x923c22c3  ! 553: XNOR_I	xnor 	%r16, 0x02c3, %r9
	.word 0x98840011  ! 553: ADDcc_R	addcc 	%r16, %r17, %r12
	.word 0x892c1011  ! 553: SLLX_R	sllx	%r16, %r17, %r4
	.word 0xb88c0011  ! 553: ANDcc_R	andcc 	%r16, %r17, %r28
	.word 0x97341011  ! 553: SRLX_R	srlx	%r16, %r17, %r11
thr0_dc_err_48:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_48), 16, 16),1,DC_DATA,17)
	.word 0xd61c22c3  ! 555: LDD_I	ldd	[%r16 + 0x02c3], %r11
	.word 0xd31c0011  ! 557: LDDF_R	ldd	[%r16, %r17], %f9
	.word 0x9ab42698  ! 559: ORNcc_I	orncc 	%r16, 0x0698, %r13
	.word 0x9c9c2532  ! 559: XORcc_I	xorcc 	%r16, 0x0532, %r14
	.word 0xb3641811  ! 559: MOVcc_R	<illegal instruction>
	.word 0x9ab40011  ! 559: ORNcc_R	orncc 	%r16, %r17, %r13
	.word 0x8aac2ad4  ! 559: ANDNcc_I	andncc 	%r16, 0x0ad4, %r5
	.word 0xad2c0011  ! 559: SLL_R	sll 	%r16, %r17, %r22
	.word 0xbb641811  ! 559: MOVcc_R	<illegal instruction>
	.word 0xacb40011  ! 559: ORNcc_R	orncc 	%r16, %r17, %r22
	.word 0xc9841011  ! 560: LDFA_R	lda	[%r16, %r17], %f4
thr0_irf_ce_48:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_48), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xc41c2b9e  ! 562: LDD_I	ldd	[%r16 + 0x0b9e], %r2
	.word 0x9e9c2ece  ! 564: XORcc_I	xorcc 	%r16, 0x0ece, %r15
	.word 0xb6342923  ! 564: ORN_I	orn 	%r16, 0x0923, %r27
	.word 0x8a940011  ! 564: ORcc_R	orcc 	%r16, %r17, %r5
	.word 0x90bc23a7  ! 564: XNORcc_I	xnorcc 	%r16, 0x03a7, %r8
	.word 0x9c3c0011  ! 564: XNOR_R	xnor 	%r16, %r17, %r14
	.word 0x8eac27c8  ! 564: ANDNcc_I	andncc 	%r16, 0x07c8, %r7
	.word 0x960c0011  ! 564: AND_R	and 	%r16, %r17, %r11
	.word 0xaabc0011  ! 564: XNORcc_R	xnorcc 	%r16, %r17, %r21
thr0_dc_err_49:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_49), 16, 16),1,DC_DATA,58)
	.word 0xeacc27c8  ! 566: LDSBA_I	ldsba	[%r16, + 0x07c8] %asi, %r21
	.word 0x8143c000  ! 568: STBAR	stbar
	.word 0xa8bc0011  ! 570: XNORcc_R	xnorcc 	%r16, %r17, %r20
	.word 0xa7343001  ! 570: SRLX_I	srlx	%r16, 0x0001, %r19
	.word 0x98442d98  ! 570: ADDC_I	addc 	%r16, 0x0d98, %r12
	.word 0x98b40011  ! 570: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0xb92c1011  ! 570: SLLX_R	sllx	%r16, %r17, %r28
	.word 0x9f3c0011  ! 570: SRA_R	sra 	%r16, %r17, %r15
thr0_dc_err_50:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_50), 16, 16),1,DC_DATA,12)
	.word 0xdf1c0000  ! 572: LDDF_R	ldd	[%r16, %r0], %f15
thr0_irf_ce_49:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_49), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0x9fec0011  ! 574: RESTORE_R	restore	%r16, %r17, %r15
	.word 0x9e042428  ! 576: ADD_I	add 	%r16, 0x0428, %r15
	.word 0x90140011  ! 576: OR_R	or 	%r16, %r17, %r8
	.word 0xaeb42327  ! 576: ORNcc_I	orncc 	%r16, 0x0327, %r23
	.word 0xb9641811  ! 576: MOVcc_R	<illegal instruction>
	.word 0xa88c0011  ! 576: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0xba440011  ! 576: ADDC_R	addc 	%r16, %r17, %r29
	.word 0x96bc25d5  ! 576: XNORcc_I	xnorcc 	%r16, 0x05d5, %r11
thr0_dc_err_51:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_51), 16, 16),1,DC_DATA,68)
	.word 0xd6cc25d5  ! 578: LDSBA_I	ldsba	[%r16, + 0x05d5] %asi, %r11
	.word 0xd71c0011  ! 580: LDDF_R	ldd	[%r16, %r17], %f11
	.word 0x83342001  ! 582: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0xb72c3001  ! 582: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0x9a04273b  ! 582: ADD_I	add 	%r16, 0x073b, %r13
	.word 0x997c2401  ! 582: MOVR_I	move	%r16, 0xfffffe54, %r12
	.word 0xa6440011  ! 582: ADDC_R	addc 	%r16, %r17, %r19
	.word 0xb68c0011  ! 582: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0xa9343001  ! 582: SRLX_I	srlx	%r16, 0x0001, %r20
	.word 0xdd140011  ! 583: LDQF_R	-	[%r16, %r17], %f14
thr0_irf_ce_50:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_50), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xc7140011  ! 585: LDQF_R	-	[%r16, %r17], %f3
	.word 0x84c40011  ! 587: ADDCcc_R	addccc 	%r16, %r17, %r2
	.word 0xab342001  ! 587: SRL_I	srl 	%r16, 0x0001, %r21
	.word 0xa62c0011  ! 587: ANDN_R	andn 	%r16, %r17, %r19
	.word 0xbabc25a2  ! 587: XNORcc_I	xnorcc 	%r16, 0x05a2, %r29
	.word 0x97341011  ! 587: SRLX_R	srlx	%r16, %r17, %r11
thr0_dc_err_52:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_52), 16, 16),1,DC_DATA,66)
	.word 0xd70425a2  ! 589: LDF_I	ld	[%r16, 0x05a2], %f11
	ta	T_CHANGE_PRIV	! macro
	.word 0xa7341011  ! 593: SRLX_R	srlx	%r16, %r17, %r19
	.word 0x82bc0011  ! 593: XNORcc_R	xnorcc 	%r16, %r17, %r1
	.word 0x8c2c2658  ! 593: ANDN_I	andn 	%r16, 0x0658, %r6
	.word 0xac8c0011  ! 593: ANDcc_R	andcc 	%r16, %r17, %r22
	.word 0xacac2f8b  ! 593: ANDNcc_I	andncc 	%r16, 0x0f8b, %r22
thr0_dc_err_53:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_53), 16, 16),1,DC_DATA,47)
	.word 0xecd42f8b  ! 595: LDSHA_I	ldsha	[%r16, + 0x0f8b] %asi, %r22
thr0_irf_ce_51:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_51), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xcd841011  ! 597: LDFA_R	lda	[%r16, %r17], %f6
	.word 0x912c1011  ! 599: SLLX_R	sllx	%r16, %r17, %r8
	.word 0x983c0011  ! 599: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0xb02c2005  ! 599: ANDN_I	andn 	%r16, 0x0005, %r24
	.word 0xbab40011  ! 599: ORNcc_R	orncc 	%r16, %r17, %r29
	.word 0x980c0011  ! 599: AND_R	and 	%r16, %r17, %r12
	.word 0x921c2c5c  ! 599: XOR_I	xor 	%r16, 0x0c5c, %r9
thr0_dc_err_54:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_54), 16, 16),1,DC_DATA,21)
	.word 0xd2942c5c  ! 601: LDUHA_I	lduha	[%r16, + 0x0c5c] %asi, %r9
	.word 0xcec427f3  ! 603: LDSWA_I	ldswa	[%r16, + 0x07f3] %asi, %r7
	.word 0x882c0011  ! 605: ANDN_R	andn 	%r16, %r17, %r4
	.word 0xa63427e1  ! 605: ORN_I	orn 	%r16, 0x07e1, %r19
	.word 0x84b40011  ! 605: ORNcc_R	orncc 	%r16, %r17, %r2
	.word 0xad7c2401  ! 605: MOVR_I	move	%r16, 0xfffffe54, %r22
	.word 0x83342001  ! 605: SRL_I	srl 	%r16, 0x0001, %r1
	.word 0x840c0011  ! 605: AND_R	and 	%r16, %r17, %r2
	.word 0x992c2001  ! 605: SLL_I	sll 	%r16, 0x0001, %r12
	.word 0x82c4243d  ! 605: ADDCcc_I	addccc 	%r16, 0x043d, %r1
thr0_dc_err_55:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_55), 16, 16),1,DC_DATA,49)
	.word 0xc3841000  ! 607: LDFA_R	lda	[%r16, %r0], %f1
thr0_irf_ce_52:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_52), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xea3427e7  ! 611: STH_I	sth	%r21, [%r16 + 0x07e7]
	.word 0x8a9c27a3  ! 613: XORcc_I	xorcc 	%r16, 0x07a3, %r5
	.word 0xb0340011  ! 613: ORN_R	orn 	%r16, %r17, %r24
	.word 0x988c21a1  ! 613: ANDcc_I	andcc 	%r16, 0x01a1, %r12
	.word 0xb00c216d  ! 613: AND_I	and 	%r16, 0x016d, %r24
	.word 0x977c2401  ! 613: MOVR_I	move	%r16, 0xfffffe54, %r11
	.word 0x828420b9  ! 613: ADDcc_I	addcc 	%r16, 0x00b9, %r1
	.word 0xd0d41011  ! 614: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r8
	.word 0xd9040011  ! 616: LDF_R	ld	[%r16, %r17], %f12
	.word 0xac940011  ! 618: ORcc_R	orcc 	%r16, %r17, %r22
	.word 0x89643801  ! 618: MOVcc_I	<illegal instruction>
	.word 0x9ac40011  ! 618: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x89341011  ! 618: SRLX_R	srlx	%r16, %r17, %r4
	.word 0x983c0011  ! 618: XNOR_R	xnor 	%r16, %r17, %r12
	.word 0x9b342001  ! 618: SRL_I	srl 	%r16, 0x0001, %r13
	.word 0x8d643801  ! 618: MOVcc_I	<illegal instruction>
	.word 0xb8842af0  ! 618: ADDcc_I	addcc 	%r16, 0x0af0, %r28
thr0_dc_err_56:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_56), 16, 16),1,DC_DATA,71)
	.word 0xf88c2af0  ! 620: LDUBA_I	lduba	[%r16, + 0x0af0] %asi, %r28
	.word 0x865c2613  ! 622: SMUL_I	smul 	%r16, 0x0613, %r3
	.word 0x89342001  ! 624: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0x94042f2c  ! 624: ADD_I	add 	%r16, 0x0f2c, %r10
	.word 0xad641811  ! 624: MOVcc_R	<illegal instruction>
	.word 0xa89c0011  ! 624: XORcc_R	xorcc 	%r16, %r17, %r20
	.word 0xae8c2835  ! 624: ANDcc_I	andcc 	%r16, 0x0835, %r23
	.word 0x9b2c2001  ! 624: SLL_I	sll 	%r16, 0x0001, %r13
	.word 0xb4b40011  ! 624: ORNcc_R	orncc 	%r16, %r17, %r26
	.word 0x933c1011  ! 624: SRAX_R	srax	%r16, %r17, %r9
	.word 0xe7941011  ! 625: LDQFA_R	-	[%r16, %r17], %f19
thr0_irf_ce_53:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_53), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
        wr %g0, 0x4, %fprs
	.word 0x888c0011  ! 629: ANDcc_R	andcc 	%r16, %r17, %r4
	.word 0x8e9c26f1  ! 629: XORcc_I	xorcc 	%r16, 0x06f1, %r7
	.word 0x86442eee  ! 629: ADDC_I	addc 	%r16, 0x0eee, %r3
	.word 0xa72c3001  ! 629: SLLX_I	sllx	%r16, 0x0001, %r19
	.word 0x88ac0011  ! 629: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x9a3c276e  ! 629: XNOR_I	xnor 	%r16, 0x076e, %r13
	.word 0x9f2c2001  ! 629: SLL_I	sll 	%r16, 0x0001, %r15
thr0_dc_err_57:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_57), 16, 16),1,DC_DATA,55)
	.word 0xdec41000  ! 631: LDSWA_R	ldswa	[%r16, %r0] 0x80, %r15
thr0_irf_ce_54:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_54), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xf20429bf  ! 633: LDUW_I	lduw	[%r16 + 0x09bf], %r25
	.word 0xba8c2e5c  ! 635: ANDcc_I	andcc 	%r16, 0x0e5c, %r29
	.word 0xaaac2555  ! 635: ANDNcc_I	andncc 	%r16, 0x0555, %r21
	.word 0x90ac2ebe  ! 635: ANDNcc_I	andncc 	%r16, 0x0ebe, %r8
	.word 0xb41c0011  ! 635: XOR_R	xor 	%r16, %r17, %r26
	.word 0x8a9c20b0  ! 635: XORcc_I	xorcc 	%r16, 0x00b0, %r5
	.word 0x92bc20b7  ! 635: XNORcc_I	xnorcc 	%r16, 0x00b7, %r9
	.word 0x9b2c0011  ! 635: SLL_R	sll 	%r16, %r17, %r13
	.word 0xdc540011  ! 636: LDSH_R	ldsh	[%r16 + %r17], %r14
thr0_irf_ce_55:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_55), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0x8140c000  ! 638: RDASI	stbar
	.word 0x8e042784  ! 640: ADD_I	add 	%r16, 0x0784, %r7
	.word 0xb52c0011  ! 640: SLL_R	sll 	%r16, %r17, %r26
	.word 0xb6c40011  ! 640: ADDCcc_R	addccc 	%r16, %r17, %r27
	.word 0x8e2c0011  ! 640: ANDN_R	andn 	%r16, %r17, %r7
	.word 0x9f342001  ! 640: SRL_I	srl 	%r16, 0x0001, %r15
	.word 0x8c8c22b4  ! 640: ANDcc_I	andcc 	%r16, 0x02b4, %r6
thr0_dc_err_58:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_58), 16, 16),1,DC_DATA,15)
	.word 0xcc8c22b4  ! 642: LDUBA_I	lduba	[%r16, + 0x02b4] %asi, %r6
	.word 0xccdc1011  ! 644: LDXA_R	ldxa	[%r16, %r17] 0x80, %r6
	.word 0xb13c0011  ! 646: SRA_R	sra 	%r16, %r17, %r24
	.word 0x963c0011  ! 646: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0xb53c1011  ! 646: SRAX_R	srax	%r16, %r17, %r26
	.word 0xb7340011  ! 646: SRL_R	srl 	%r16, %r17, %r27
	.word 0xac2c2e80  ! 646: ANDN_I	andn 	%r16, 0x0e80, %r22
	.word 0x84c42752  ! 646: ADDCcc_I	addccc 	%r16, 0x0752, %r2
	.word 0x932c2001  ! 646: SLL_I	sll 	%r16, 0x0001, %r9
	.word 0xb42c21a0  ! 646: ANDN_I	andn 	%r16, 0x01a0, %r26
	.word 0xf44c0011  ! 647: LDSB_R	ldsb	[%r16 + %r17], %r26
        wr %g0, 0x4, %fprs
	.word 0x93343001  ! 651: SRLX_I	srlx	%r16, 0x0001, %r9
	.word 0x880426a8  ! 651: ADD_I	add 	%r16, 0x06a8, %r4
	.word 0x8eac28ec  ! 651: ANDNcc_I	andncc 	%r16, 0x08ec, %r7
	.word 0xaa040011  ! 651: ADD_R	add 	%r16, %r17, %r21
	.word 0x90940011  ! 651: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x8a3c0011  ! 651: XNOR_R	xnor 	%r16, %r17, %r5
thr0_dc_err_59:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_59), 16, 16),1,DC_DATA,3)
	.word 0xcb941000  ! 653: LDQFA_R	-	[%r16, %r0], %f5
	.word 0x08800003  ! 655: BLEU	bleu  	<label_0x3>
	.word 0x8a44270a  ! 657: ADDC_I	addc 	%r16, 0x070a, %r5
	.word 0x8f340011  ! 657: SRL_R	srl 	%r16, %r17, %r7
	.word 0x997c2401  ! 657: MOVR_I	move	%r16, 0xfffffe54, %r12
	.word 0xba1c2ba6  ! 657: XOR_I	xor 	%r16, 0x0ba6, %r29
	.word 0xb9342001  ! 657: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0x863c21ff  ! 657: XNOR_I	xnor 	%r16, 0x01ff, %r3
	.word 0xac142fbf  ! 658: OR_I	or 	%r16, 0x0fbf, %r22
	.word 0x8294243c  ! 658: ORcc_I	orcc 	%r16, 0x043c, %r1
	.word 0xaf2c1011  ! 658: SLLX_R	sllx	%r16, %r17, %r23
	.word 0x82ac0011  ! 658: ANDNcc_R	andncc 	%r16, %r17, %r1
	.word 0x880c0011  ! 658: AND_R	and 	%r16, %r17, %r4
	.word 0x9a440011  ! 658: ADDC_R	addc 	%r16, %r17, %r13
	.word 0x8b3c1011  ! 658: SRAX_R	srax	%r16, %r17, %r5
	rd      %pc, %r18
	set     0x20, %r17
	.word 0xc4d41011  ! 658: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r2
thr0_irf_ce_56:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_56), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	return     %r18 + %r17
	.word 0x848c2b0d  ! 661: ANDcc_I	andcc 	%r16, 0x0b0d, %r2
	.word 0x9e140011  ! 661: OR_R	or 	%r16, %r17, %r15
	.word 0x909c2d3d  ! 661: XORcc_I	xorcc 	%r16, 0x0d3d, %r8
	.word 0x87342001  ! 661: SRL_I	srl 	%r16, 0x0001, %r3
	.word 0x9c0422fb  ! 661: ADD_I	add 	%r16, 0x02fb, %r14
	.word 0x8a9c24e0  ! 661: XORcc_I	xorcc 	%r16, 0x04e0, %r5
	.word 0xae8c2458  ! 661: ANDcc_I	andcc 	%r16, 0x0458, %r23
	.word 0x9ac40011  ! 661: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0xdb941011  ! 662: LDQFA_R	-	[%r16, %r17], %f13
thr0_irf_ce_57:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_57), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xd91c28b8  ! 664: LDDF_I	ldd	[%r16, 0x08b8], %f12
	.word 0x8b341011  ! 666: SRLX_R	srlx	%r16, %r17, %r5
	.word 0x98142429  ! 666: OR_I	or 	%r16, 0x0429, %r12
	.word 0xaf7c0411  ! 666: MOVR_R	move	%r16, %r17, %r23
	.word 0x94940011  ! 666: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x94940011  ! 666: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x83343001  ! 666: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0xf0140011  ! 667: LDUH_R	lduh	[%r16 + %r17], %r24
thr0_irf_ce_58:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_58), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xe87429b1  ! 671: STX_I	stx	%r20, [%r16 + 0x09b1]
	.word 0x89643801  ! 673: MOVcc_I	<illegal instruction>
	.word 0xb2040011  ! 673: ADD_R	add 	%r16, %r17, %r25
	.word 0x9d3c0011  ! 673: SRA_R	sra 	%r16, %r17, %r14
	.word 0x98b40011  ! 673: ORNcc_R	orncc 	%r16, %r17, %r12
	.word 0x8f341011  ! 673: SRLX_R	srlx	%r16, %r17, %r7
	.word 0x9ac42fc8  ! 673: ADDCcc_I	addccc 	%r16, 0x0fc8, %r13
	.word 0xb32c1011  ! 673: SLLX_R	sllx	%r16, %r17, %r25
	.word 0xdf1c2ae6  ! 674: LDDF_I	ldd	[%r16, 0x0ae6], %f15
	.word 0xf04c2b72  ! 676: LDSB_I	ldsb	[%r16 + 0x0b72], %r24
	.word 0x96040011  ! 678: ADD_R	add 	%r16, %r17, %r11
	.word 0x90142758  ! 678: OR_I	or 	%r16, 0x0758, %r8
	.word 0x8ebc0011  ! 678: XNORcc_R	xnorcc 	%r16, %r17, %r7
	.word 0x829c0011  ! 678: XORcc_R	xorcc 	%r16, %r17, %r1
	.word 0x903c0011  ! 678: XNOR_R	xnor 	%r16, %r17, %r8
	.word 0x828422fd  ! 678: ADDcc_I	addcc 	%r16, 0x02fd, %r1
	.word 0x8c3c0011  ! 678: XNOR_R	xnor 	%r16, %r17, %r6
	.word 0xfad41011  ! 679: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r29
thr0_irf_ce_59:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_59), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xc3ec2e2a  ! 681: PREFETCHA_I	prefetcha	[%r16, + 0x0e2a] %asi, #one_read
	.word 0x981c0011  ! 683: XOR_R	xor 	%r16, %r17, %r12
	.word 0x872c3001  ! 683: SLLX_I	sllx	%r16, 0x0001, %r3
	.word 0x8eac0011  ! 683: ANDNcc_R	andncc 	%r16, %r17, %r7
	.word 0xb2340011  ! 683: ORN_R	orn 	%r16, %r17, %r25
	.word 0xbb3c0011  ! 683: SRA_R	sra 	%r16, %r17, %r29
thr0_dc_err_60:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_60), 16, 16),1,DC_DATA,2)
	.word 0xfa5c0000  ! 685: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xcb1c2a76  ! 687: LDDF_I	ldd	[%r16, 0x0a76], %f5
	.word 0xaab40011  ! 689: ORNcc_R	orncc 	%r16, %r17, %r21
	.word 0xb2ac2df3  ! 689: ANDNcc_I	andncc 	%r16, 0x0df3, %r25
	.word 0x82b40011  ! 689: ORNcc_R	orncc 	%r16, %r17, %r1
	.word 0x842c0011  ! 689: ANDN_R	andn 	%r16, %r17, %r2
	.word 0x8ec40011  ! 689: ADDCcc_R	addccc 	%r16, %r17, %r7
	.word 0xb6940011  ! 689: ORcc_R	orcc 	%r16, %r17, %r27
	.word 0x9d2c1011  ! 689: SLLX_R	sllx	%r16, %r17, %r14
	.word 0xa6b40011  ! 689: ORNcc_R	orncc 	%r16, %r17, %r19
	.word 0xead41011  ! 690: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r21
        wr  %g0, 0x80, %asi
	.word 0xb23428d9  ! 694: ORN_I	orn 	%r16, 0x08d9, %r25
	.word 0x8cc40011  ! 694: ADDCcc_R	addccc 	%r16, %r17, %r6
	.word 0xb88c283b  ! 694: ANDcc_I	andcc 	%r16, 0x083b, %r28
	.word 0xb8c40011  ! 694: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0x95341011  ! 694: SRLX_R	srlx	%r16, %r17, %r10
	.word 0x823c2167  ! 694: XNOR_I	xnor 	%r16, 0x0167, %r1
	.word 0x91643801  ! 694: MOVcc_I	<illegal instruction>
	.word 0x8a0c0011  ! 694: AND_R	and 	%r16, %r17, %r5
thr0_dc_err_61:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_61), 16, 16),1,DC_DATA,71)
	.word 0xca4c2167  ! 696: LDSB_I	ldsb	[%r16 + 0x0167], %r5
	.word 0xf5142a79  ! 698: LDQF_I	-	[%r16, 0x0a79], %f26
	.word 0x8c442beb  ! 700: ADDC_I	addc 	%r16, 0x0beb, %r6
	.word 0x900c0011  ! 700: AND_R	and 	%r16, %r17, %r8
	.word 0xba2c0011  ! 700: ANDN_R	andn 	%r16, %r17, %r29
	.word 0xb52c2001  ! 700: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xba040011  ! 700: ADD_R	add 	%r16, %r17, %r29
	.word 0x8c1c2e8c  ! 700: XOR_I	xor 	%r16, 0x0e8c, %r6
thr0_dc_err_62:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_62), 16, 16),1,DC_DATA,49)
	.word 0xcc040000  ! 702: LDUW_R	lduw	[%r16 + %r0], %r6
!Illinst alu
	.word 0x8aac0011  ! 704: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0x97343001  ! 706: SRLX_I	srlx	%r16, 0x0001, %r11
	.word 0xb3343001  ! 706: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xb3641811  ! 706: MOVcc_R	<illegal instruction>
	.word 0x98142ea3  ! 706: OR_I	or 	%r16, 0x0ea3, %r12
	.word 0x8f343001  ! 706: SRLX_I	srlx	%r16, 0x0001, %r7
	.word 0x9e2c2701  ! 706: ANDN_I	andn 	%r16, 0x0701, %r15
thr0_dc_err_63:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_63), 16, 16),1,DC_DATA,55)
	.word 0xde140000  ! 708: LDUH_R	lduh	[%r16 + %r0], %r15
	.word 0xc5941011  ! 710: LDQFA_R	-	[%r16, %r17], %f2
	.word 0x973c2001  ! 712: SRA_I	sra 	%r16, 0x0001, %r11
	.word 0x922c2090  ! 712: ANDN_I	andn 	%r16, 0x0090, %r9
	.word 0x92140011  ! 712: OR_R	or 	%r16, %r17, %r9
	.word 0x880c0011  ! 712: AND_R	and 	%r16, %r17, %r4
	.word 0x83343001  ! 712: SRLX_I	srlx	%r16, 0x0001, %r1
	.word 0xaaac2ad1  ! 712: ANDNcc_I	andncc 	%r16, 0x0ad1, %r21
	.word 0x9e0c0011  ! 712: AND_R	and 	%r16, %r17, %r15
thr0_dc_err_64:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_64), 16, 16),1,DC_DATA,31)
	.word 0xdf941000  ! 714: LDQFA_R	-	[%r16, %r0], %f15
	.word 0xd99c1011  ! 716: LDDFA_R	ldda	[%r16, %r17], %f12
	.word 0xb28c0011  ! 718: ANDcc_R	andcc 	%r16, %r17, %r25
	.word 0xb2c40011  ! 718: ADDCcc_R	addccc 	%r16, %r17, %r25
	.word 0x9eb425c0  ! 718: ORNcc_I	orncc 	%r16, 0x05c0, %r15
	.word 0x85343001  ! 718: SRLX_I	srlx	%r16, 0x0001, %r2
	.word 0xb8c40011  ! 718: ADDCcc_R	addccc 	%r16, %r17, %r28
	.word 0x962c0011  ! 718: ANDN_R	andn 	%r16, %r17, %r11
thr0_dc_err_65:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_65), 16, 16),1,DC_DATA,4)
	.word 0xd7941000  ! 720: LDQFA_R	-	[%r16, %r0], %f11
	.word 0xf00c2d3d  ! 722: LDUB_I	ldub	[%r16 + 0x0d3d], %r24
	.word 0x940c0011  ! 724: AND_R	and 	%r16, %r17, %r10
	.word 0x8cb40011  ! 724: ORNcc_R	orncc 	%r16, %r17, %r6
	.word 0x8d2c1011  ! 724: SLLX_R	sllx	%r16, %r17, %r6
	.word 0x98bc2c2e  ! 724: XNORcc_I	xnorcc 	%r16, 0x0c2e, %r12
	.word 0x9a8c2345  ! 724: ANDcc_I	andcc 	%r16, 0x0345, %r13
	.word 0x8aac0011  ! 724: ANDNcc_R	andncc 	%r16, %r17, %r5
	.word 0xb08c25d1  ! 724: ANDcc_I	andcc 	%r16, 0x05d1, %r24
	.word 0xb97c0411  ! 724: MOVR_R	move	%r16, %r17, %r28
thr0_dc_err_66:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_66), 16, 16),1,DC_DATA,14)
	.word 0xf8140000  ! 726: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xd39c1011  ! 728: LDDFA_R	ldda	[%r16, %r17], %f9
	.word 0x88842dec  ! 730: ADDcc_I	addcc 	%r16, 0x0dec, %r4
	.word 0x9eac0011  ! 730: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xba3c0011  ! 730: XNOR_R	xnor 	%r16, %r17, %r29
	.word 0xa6ac21f5  ! 730: ANDNcc_I	andncc 	%r16, 0x01f5, %r19
	.word 0x982c0011  ! 730: ANDN_R	andn 	%r16, %r17, %r12
	.word 0x86bc0011  ! 730: XNORcc_R	xnorcc 	%r16, %r17, %r3
	.word 0xd7040011  ! 731: LDF_R	ld	[%r16, %r17], %f11
!Illinst store
	.word 0xdc340011  ! 733: STH_R	sth	%r14, [%r16 + %r17]
	.word 0x9b2c0011  ! 735: SLL_R	sll 	%r16, %r17, %r13
	.word 0x92140011  ! 735: OR_R	or 	%r16, %r17, %r9
	.word 0xb0bc0011  ! 735: XNORcc_R	xnorcc 	%r16, %r17, %r24
	.word 0xb72c3001  ! 735: SLLX_I	sllx	%r16, 0x0001, %r27
	.word 0x88bc0011  ! 735: XNORcc_R	xnorcc 	%r16, %r17, %r4
	.word 0x980c2ef5  ! 735: AND_I	and 	%r16, 0x0ef5, %r12
	.word 0xac142fbe  ! 735: OR_I	or 	%r16, 0x0fbe, %r22
	.word 0x9e040011  ! 735: ADD_R	add 	%r16, %r17, %r15
	.word 0xec5c0011  ! 736: LDX_R	ldx	[%r16 + %r17], %r22
	.word 0xde540011  ! 738: LDSH_R	ldsh	[%r16 + %r17], %r15
	.word 0xb1340011  ! 740: SRL_R	srl 	%r16, %r17, %r24
	.word 0x8c2c2b4a  ! 740: ANDN_I	andn 	%r16, 0x0b4a, %r6
	.word 0xae842787  ! 740: ADDcc_I	addcc 	%r16, 0x0787, %r23
	.word 0x90142275  ! 740: OR_I	or 	%r16, 0x0275, %r8
	.word 0x9eb4220b  ! 740: ORNcc_I	orncc 	%r16, 0x020b, %r15
	.word 0xd2c41011  ! 741: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r9
thr0_irf_ce_60:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_60), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	wr      %r0, 0x1, %asr26
	.word 0x90140011  ! 745: OR_R	or 	%r16, %r17, %r8
	.word 0x917c2401  ! 745: MOVR_I	move	%r16, 0xfffffe54, %r8
	.word 0x96940011  ! 745: ORcc_R	orcc 	%r16, %r17, %r11
	.word 0x8c042d83  ! 745: ADD_I	add 	%r16, 0x0d83, %r6
	.word 0x9c040011  ! 745: ADD_R	add 	%r16, %r17, %r14
	.word 0xc7841011  ! 746: LDFA_R	lda	[%r16, %r17], %f3
thr0_irf_ce_61:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_61), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xdb1c0011  ! 748: LDDF_R	ldd	[%r16, %r17], %f13
	.word 0x8a84214b  ! 750: ADDcc_I	addcc 	%r16, 0x014b, %r5
	.word 0xbac40011  ! 750: ADDCcc_R	addccc 	%r16, %r17, %r29
	.word 0xac440011  ! 750: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x9a940011  ! 750: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0xb2340011  ! 750: ORN_R	orn 	%r16, %r17, %r25
	.word 0x902c29df  ! 750: ANDN_I	andn 	%r16, 0x09df, %r8
	.word 0x84b42448  ! 750: ORNcc_I	orncc 	%r16, 0x0448, %r2
	.word 0xc4d41011  ! 751: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r2
	.word 0xdf140011  ! 753: LDQF_R	-	[%r16, %r17], %f15
	.word 0x9a840011  ! 755: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x9a2c26da  ! 755: ANDN_I	andn 	%r16, 0x06da, %r13
	.word 0x94040011  ! 755: ADD_R	add 	%r16, %r17, %r10
	.word 0x94bc2090  ! 755: XNORcc_I	xnorcc 	%r16, 0x0090, %r10
	.word 0x853c1011  ! 755: SRAX_R	srax	%r16, %r17, %r2
	.word 0x949c2cb7  ! 755: XORcc_I	xorcc 	%r16, 0x0cb7, %r10
	.word 0xa8ac2145  ! 755: ANDNcc_I	andncc 	%r16, 0x0145, %r20
	.word 0x88140011  ! 755: OR_R	or 	%r16, %r17, %r4
thr0_dc_err_67:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_67), 16, 16),1,DC_DATA,54)
	.word 0xc8d42145  ! 757: LDSHA_I	ldsha	[%r16, + 0x0145] %asi, %r4
	.word 0xd6c42ed7  ! 759: LDSWA_I	ldswa	[%r16, + 0x0ed7] %asi, %r11
	.word 0xa8440011  ! 761: ADDC_R	addc 	%r16, %r17, %r20
	.word 0x9084225c  ! 761: ADDcc_I	addcc 	%r16, 0x025c, %r8
	.word 0xa89c2e49  ! 761: XORcc_I	xorcc 	%r16, 0x0e49, %r20
	.word 0x9d2c2001  ! 761: SLL_I	sll 	%r16, 0x0001, %r14
	.word 0xa73c0011  ! 761: SRA_R	sra 	%r16, %r17, %r19
	.word 0xf45c0011  ! 762: LDX_R	ldx	[%r16 + %r17], %r26
	.word 0xcc9c1011  ! 764: LDDA_R	ldda	[%r16, %r17] 0x80, %r6
	.word 0x9b340011  ! 766: SRL_R	srl 	%r16, %r17, %r13
	.word 0x8c34254e  ! 766: ORN_I	orn 	%r16, 0x054e, %r6
	.word 0xb92c1011  ! 766: SLLX_R	sllx	%r16, %r17, %r28
	.word 0x9a4420a1  ! 766: ADDC_I	addc 	%r16, 0x00a1, %r13
	.word 0x9cc40011  ! 766: ADDCcc_R	addccc 	%r16, %r17, %r14
	.word 0x88042532  ! 766: ADD_I	add 	%r16, 0x0532, %r4
	.word 0x9c94264d  ! 766: ORcc_I	orcc 	%r16, 0x064d, %r14
thr0_dc_err_68:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_68), 16, 16),1,DC_DATA,55)
	.word 0xdd841000  ! 768: LDFA_R	lda	[%r16, %r0], %f14
thr0_irf_ce_62:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_62), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xde742408  ! 772: STX_I	stx	%r15, [%r16 + 0x0408]
	.word 0x9b2c3001  ! 774: SLLX_I	sllx	%r16, 0x0001, %r13
	.word 0xaeac0011  ! 774: ANDNcc_R	andncc 	%r16, %r17, %r23
	.word 0xb4840011  ! 774: ADDcc_R	addcc 	%r16, %r17, %r26
	.word 0x822c0011  ! 774: ANDN_R	andn 	%r16, %r17, %r1
	.word 0x9a2c0011  ! 774: ANDN_R	andn 	%r16, %r17, %r13
	.word 0xa92c3001  ! 774: SLLX_I	sllx	%r16, 0x0001, %r20
	.word 0x90bc2a54  ! 774: XNORcc_I	xnorcc 	%r16, 0x0a54, %r8
	.word 0x861c2d6e  ! 774: XOR_I	xor 	%r16, 0x0d6e, %r3
thr0_dc_err_69:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_69), 16, 16),1,DC_DATA,63)
	.word 0xc69c2d6e  ! 776: LDDA_I	ldda	[%r16, + 0x0d6e] %asi, %r3
	.word 0xd8142bd7  ! 778: LDUH_I	lduh	[%r16 + 0x0bd7], %r12
	.word 0x90ac0011  ! 780: ANDNcc_R	andncc 	%r16, %r17, %r8
	.word 0x84c42290  ! 780: ADDCcc_I	addccc 	%r16, 0x0290, %r2
	.word 0xac9c2629  ! 780: XORcc_I	xorcc 	%r16, 0x0629, %r22
	.word 0x8294279d  ! 780: ORcc_I	orcc 	%r16, 0x079d, %r1
	.word 0x8e040011  ! 780: ADD_R	add 	%r16, %r17, %r7
	.word 0xa83c2287  ! 780: XNOR_I	xnor 	%r16, 0x0287, %r20
	.word 0xcc8c2c19  ! 781: LDUBA_I	lduba	[%r16, + 0x0c19] %asi, %r6
thr0_irf_ce_63:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_63), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xef941011  ! 783: LDQFA_R	-	[%r16, %r17], %f23
	.word 0x92840011  ! 785: ADDcc_R	addcc 	%r16, %r17, %r9
	.word 0xaa2c0011  ! 785: ANDN_R	andn 	%r16, %r17, %r21
	.word 0xb2bc0011  ! 785: XNORcc_R	xnorcc 	%r16, %r17, %r25
	.word 0x989c0011  ! 785: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x99340011  ! 785: SRL_R	srl 	%r16, %r17, %r12
	.word 0x989c0011  ! 785: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0xdcdc1011  ! 786: LDXA_R	ldxa	[%r16, %r17] 0x80, %r14
thr0_irf_ce_64:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_64), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xc7040011  ! 788: LDF_R	ld	[%r16, %r17], %f3
	.word 0x8d341011  ! 790: SRLX_R	srlx	%r16, %r17, %r6
	.word 0x821c0011  ! 790: XOR_R	xor 	%r16, %r17, %r1
	.word 0xa8c40011  ! 790: ADDCcc_R	addccc 	%r16, %r17, %r20
	.word 0xbabc0011  ! 790: XNORcc_R	xnorcc 	%r16, %r17, %r29
	.word 0xb32c1011  ! 790: SLLX_R	sllx	%r16, %r17, %r25
	.word 0xaec40011  ! 790: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0xa6bc0011  ! 790: XNORcc_R	xnorcc 	%r16, %r17, %r19
thr0_dc_err_70:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_70), 16, 16),1,DC_DATA,48)
	.word 0xe79c1000  ! 792: LDDFA_R	ldda	[%r16, %r0], %f19
thr0_irf_ce_65:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_65), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	ta	T_CHANGE_HPRIV	! macro
	.word 0x920c0011  ! 796: AND_R	and 	%r16, %r17, %r9
	.word 0x873c2001  ! 796: SRA_I	sra 	%r16, 0x0001, %r3
	.word 0x82940011  ! 796: ORcc_R	orcc 	%r16, %r17, %r1
	.word 0x9e142966  ! 796: OR_I	or 	%r16, 0x0966, %r15
	.word 0xad7c0411  ! 796: MOVR_R	move	%r16, %r17, %r22
	.word 0xb2b4238c  ! 796: ORNcc_I	orncc 	%r16, 0x038c, %r25
	.word 0x9c8c26c2  ! 796: ANDcc_I	andcc 	%r16, 0x06c2, %r14
	.word 0xb01c2b98  ! 796: XOR_I	xor 	%r16, 0x0b98, %r24
	.word 0xc4841011  ! 797: LDUWA_R	lduwa	[%r16, %r17] 0x80, %r2
thr0_irf_ce_66:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_66), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xd1140011  ! 799: LDQF_R	-	[%r16, %r17], %f8
	.word 0x873c0011  ! 801: SRA_R	sra 	%r16, %r17, %r3
	.word 0x88ac0011  ! 801: ANDNcc_R	andncc 	%r16, %r17, %r4
	.word 0x86b40011  ! 801: ORNcc_R	orncc 	%r16, %r17, %r3
	.word 0x8a840011  ! 801: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0x9a1c0011  ! 801: XOR_R	xor 	%r16, %r17, %r13
	.word 0xb22c0011  ! 801: ANDN_R	andn 	%r16, %r17, %r25
thr0_dc_err_71:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_71), 16, 16),1,DC_DATA,17)
	.word 0xf25c0000  ! 803: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xf2941011  ! 805: LDUHA_R	lduha	[%r16, %r17] 0x80, %r25
	.word 0x9b3c2001  ! 807: SRA_I	sra 	%r16, 0x0001, %r13
	.word 0x90bc0011  ! 807: XNORcc_R	xnorcc 	%r16, %r17, %r8
	.word 0xb68c0011  ! 807: ANDcc_R	andcc 	%r16, %r17, %r27
	.word 0x88c425cb  ! 807: ADDCcc_I	addccc 	%r16, 0x05cb, %r4
	.word 0x8ebc202a  ! 807: XNORcc_I	xnorcc 	%r16, 0x002a, %r7
	.word 0x90bc2c46  ! 807: XNORcc_I	xnorcc 	%r16, 0x0c46, %r8
	.word 0xdf1c22d9  ! 808: LDDF_I	ldd	[%r16, 0x02d9], %f15
thr0_irf_ce_67:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_67), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xc9841011  ! 810: LDFA_R	lda	[%r16, %r17], %f4
	.word 0x8a840011  ! 812: ADDcc_R	addcc 	%r16, %r17, %r5
	.word 0xb81c0011  ! 812: XOR_R	xor 	%r16, %r17, %r28
	.word 0x8c840011  ! 812: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0x9c2c23cb  ! 812: ANDN_I	andn 	%r16, 0x03cb, %r14
	.word 0xaf643801  ! 812: MOVcc_I	<illegal instruction>
	.word 0xce8c1011  ! 813: LDUBA_R	lduba	[%r16, %r17] 0x80, %r7
	.word 0xda7c2abc  ! 815: SWAP_I	swap	%r13, [%r16 + 0x0abc]
	.word 0x8b2c0011  ! 817: SLL_R	sll 	%r16, %r17, %r5
	.word 0xb92c3001  ! 817: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0x932c0011  ! 817: SLL_R	sll 	%r16, %r17, %r9
	.word 0x833c1011  ! 817: SRAX_R	srax	%r16, %r17, %r1
	.word 0xae040011  ! 817: ADD_R	add 	%r16, %r17, %r23
	.word 0x8c9c2005  ! 817: XORcc_I	xorcc 	%r16, 0x0005, %r6
	.word 0x90342066  ! 817: ORN_I	orn 	%r16, 0x0066, %r8
	.word 0xa7342001  ! 817: SRL_I	srl 	%r16, 0x0001, %r19
	.word 0xcac4247e  ! 818: LDSWA_I	ldswa	[%r16, + 0x047e] %asi, %r5
	.word 0xf1941011  ! 820: LDQFA_R	-	[%r16, %r17], %f24
	.word 0xb12c1011  ! 822: SLLX_R	sllx	%r16, %r17, %r24
	.word 0x89342001  ! 822: SRL_I	srl 	%r16, 0x0001, %r4
	.word 0xaec40011  ! 822: ADDCcc_R	addccc 	%r16, %r17, %r23
	.word 0x9a940011  ! 822: ORcc_R	orcc 	%r16, %r17, %r13
	.word 0x9a9c0011  ! 822: XORcc_R	xorcc 	%r16, %r17, %r13
thr0_dc_err_72:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_72), 16, 16),1,DC_DATA,57)
	.word 0xdb04247e  ! 824: LDF_I	ld	[%r16, 0x047e], %f13
	.word 0xc36c20b8  ! 826: PREFETCH_I	prefetch	[%r16 + 0x00b8], #one_read
	.word 0xb6b40011  ! 828: ORNcc_R	orncc 	%r16, %r17, %r27
	.word 0xb08c2ef2  ! 828: ANDcc_I	andcc 	%r16, 0x0ef2, %r24
	.word 0x86c425a4  ! 828: ADDCcc_I	addccc 	%r16, 0x05a4, %r3
	.word 0x8ab42576  ! 828: ORNcc_I	orncc 	%r16, 0x0576, %r5
	.word 0xb7643801  ! 828: MOVcc_I	<illegal instruction>
thr0_dc_err_73:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_73), 16, 16),1,DC_DATA,8)
	.word 0xf79c1000  ! 830: LDDFA_R	ldda	[%r16, %r0], %f27
thr0_irf_ce_68:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_68), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf0dc1011  ! 832: LDXA_R	ldxa	[%r16, %r17] 0x80, %r24
	.word 0x88b42a36  ! 834: ORNcc_I	orncc 	%r16, 0x0a36, %r4
	.word 0x9a0c0011  ! 834: AND_R	and 	%r16, %r17, %r13
	.word 0x8e842cdc  ! 834: ADDcc_I	addcc 	%r16, 0x0cdc, %r7
	.word 0x86140011  ! 834: OR_R	or 	%r16, %r17, %r3
	.word 0xb2442597  ! 834: ADDC_I	addc 	%r16, 0x0597, %r25
	.word 0x82b42cae  ! 834: ORNcc_I	orncc 	%r16, 0x0cae, %r1
	.word 0x8f641811  ! 834: MOVcc_R	<illegal instruction>
	.word 0xa77c2401  ! 834: MOVR_I	move	%r16, 0xfffffe54, %r19
	.word 0xcb040011  ! 835: LDF_R	ld	[%r16, %r17], %f5
	.word 0xd8d41011  ! 837: LDSHA_R	ldsha	[%r16, %r17] 0x80, %r12
	.word 0xac3c21e9  ! 839: XNOR_I	xnor 	%r16, 0x01e9, %r22
	.word 0x8c1c24d9  ! 839: XOR_I	xor 	%r16, 0x04d9, %r6
	.word 0x989c0011  ! 839: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x9f343001  ! 839: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0xa61c0011  ! 839: XOR_R	xor 	%r16, %r17, %r19
	.word 0xb00c2608  ! 839: AND_I	and 	%r16, 0x0608, %r24
	.word 0xa60c2359  ! 839: AND_I	and 	%r16, 0x0359, %r19
	.word 0xed040011  ! 840: LDF_R	ld	[%r16, %r17], %f22
thr0_irf_ce_69:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_69), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xd6c41011  ! 842: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r11
	.word 0x94340011  ! 844: ORN_R	orn 	%r16, %r17, %r10
	.word 0xb8840011  ! 844: ADDcc_R	addcc 	%r16, %r17, %r28
	.word 0xa93c2001  ! 844: SRA_I	sra 	%r16, 0x0001, %r20
	.word 0x90ac2103  ! 844: ANDNcc_I	andncc 	%r16, 0x0103, %r8
	.word 0xaa142d84  ! 844: OR_I	or 	%r16, 0x0d84, %r21
	.word 0x83643801  ! 844: MOVcc_I	<illegal instruction>
	.word 0xa88c0011  ! 844: ANDcc_R	andcc 	%r16, %r17, %r20
	.word 0xce4c0011  ! 845: LDSB_R	ldsb	[%r16 + %r17], %r7
thr0_irf_ce_70:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_70), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xd59c1011  ! 847: LDDFA_R	ldda	[%r16, %r17], %f10
	.word 0x82340011  ! 849: ORN_R	orn 	%r16, %r17, %r1
	.word 0x912c0011  ! 849: SLL_R	sll 	%r16, %r17, %r8
	.word 0x94ac2f01  ! 849: ANDNcc_I	andncc 	%r16, 0x0f01, %r10
	.word 0xa69c0011  ! 849: XORcc_R	xorcc 	%r16, %r17, %r19
	.word 0xa68c0011  ! 849: ANDcc_R	andcc 	%r16, %r17, %r19
	.word 0x893c1011  ! 849: SRAX_R	srax	%r16, %r17, %r4
	.word 0xc314223d  ! 850: LDQF_I	-	[%r16, 0x023d], %f1
thr0_irf_ce_71:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_71), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xc59c1011  ! 852: LDDFA_R	ldda	[%r16, %r17], %f2
	.word 0x84ac2a43  ! 854: ANDNcc_I	andncc 	%r16, 0x0a43, %r2
	.word 0x9abc0011  ! 854: XNORcc_R	xnorcc 	%r16, %r17, %r13
	.word 0x8a042148  ! 854: ADD_I	add 	%r16, 0x0148, %r5
	.word 0x9c1c0011  ! 854: XOR_R	xor 	%r16, %r17, %r14
	.word 0xb62c0011  ! 854: ANDN_R	andn 	%r16, %r17, %r27
	.word 0x86142220  ! 854: OR_I	or 	%r16, 0x0220, %r3
	.word 0xb02c0011  ! 854: ANDN_R	andn 	%r16, %r17, %r24
	.word 0x91643801  ! 854: MOVcc_I	<illegal instruction>
	.word 0xdc540011  ! 855: LDSH_R	ldsh	[%r16 + %r17], %r14
	.word 0xdac41011  ! 857: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r13
	.word 0x820422e7  ! 859: ADD_I	add 	%r16, 0x02e7, %r1
	.word 0xae3c2419  ! 859: XNOR_I	xnor 	%r16, 0x0419, %r23
	.word 0xaa1c0011  ! 859: XOR_R	xor 	%r16, %r17, %r21
	.word 0x93341011  ! 859: SRLX_R	srlx	%r16, %r17, %r9
	.word 0x8c340011  ! 859: ORN_R	orn 	%r16, %r17, %r6
	.word 0x829c0011  ! 859: XORcc_R	xorcc 	%r16, %r17, %r1
thr0_dc_err_74:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_74), 16, 16),1,DC_DATA,70)
	.word 0xc39c1000  ! 861: LDDFA_R	ldda	[%r16, %r0], %f1
	.word 0xd61c2607  ! 863: LDD_I	ldd	[%r16 + 0x0607], %r11
	.word 0x9a0c0011  ! 865: AND_R	and 	%r16, %r17, %r13
	.word 0xac140011  ! 865: OR_R	or 	%r16, %r17, %r22
	.word 0x94440011  ! 865: ADDC_R	addc 	%r16, %r17, %r10
	.word 0xb37c0411  ! 865: MOVR_R	move	%r16, %r17, %r25
	.word 0x882c0011  ! 865: ANDN_R	andn 	%r16, %r17, %r4
	.word 0x860c0011  ! 865: AND_R	and 	%r16, %r17, %r3
	.word 0xd0142ff3  ! 866: LDUH_I	lduh	[%r16 + 0x0ff3], %r8
thr0_irf_ce_72:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_72), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xd4540011  ! 868: LDSH_R	ldsh	[%r16 + %r17], %r10
	.word 0xb00c0011  ! 870: AND_R	and 	%r16, %r17, %r24
	.word 0x889c22d4  ! 870: XORcc_I	xorcc 	%r16, 0x02d4, %r4
	.word 0x864422d1  ! 870: ADDC_I	addc 	%r16, 0x02d1, %r3
	.word 0x90942fcb  ! 870: ORcc_I	orcc 	%r16, 0x0fcb, %r8
	.word 0xb1342001  ! 870: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0x8e2c0011  ! 870: ANDN_R	andn 	%r16, %r17, %r7
thr0_dc_err_75:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_75), 16, 16),1,DC_DATA,47)
	.word 0xcedc1000  ! 872: LDXA_R	ldxa	[%r16, %r0] 0x80, %r7
	.word 0xeb142fce  ! 874: LDQF_I	-	[%r16, 0x0fce], %f21
	.word 0x989c0011  ! 876: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x893c2001  ! 876: SRA_I	sra 	%r16, 0x0001, %r4
	.word 0x90940011  ! 876: ORcc_R	orcc 	%r16, %r17, %r8
	.word 0x9a340011  ! 876: ORN_R	orn 	%r16, %r17, %r13
	.word 0x9a042b78  ! 876: ADD_I	add 	%r16, 0x0b78, %r13
thr0_dc_err_76:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_76), 16, 16),1,DC_DATA,18)
	.word 0xda1c2b78  ! 878: LDD_I	ldd	[%r16 + 0x0b78], %r13
	.word 0xdecc1011  ! 880: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r15
	.word 0xb09c27bd  ! 882: XORcc_I	xorcc 	%r16, 0x07bd, %r24
	.word 0x8a2c2fc6  ! 882: ANDN_I	andn 	%r16, 0x0fc6, %r5
	.word 0x93641811  ! 882: MOVcc_R	<illegal instruction>
	.word 0x8c040011  ! 882: ADD_R	add 	%r16, %r17, %r6
	.word 0x8f641811  ! 882: MOVcc_R	<illegal instruction>
	.word 0x9cbc2333  ! 882: XNORcc_I	xnorcc 	%r16, 0x0333, %r14
	.word 0x9f343001  ! 882: SRLX_I	srlx	%r16, 0x0001, %r15
	.word 0xa6342ffb  ! 882: ORN_I	orn 	%r16, 0x0ffb, %r19
	.word 0xc9941011  ! 883: LDQFA_R	-	[%r16, %r17], %f4
	.word 0x8143e05d  ! 885: MEMBAR	membar	#LoadLoad | #LoadStore | #StoreStore | #Lookaside | #Sync 
	.word 0x8a3c22b5  ! 887: XNOR_I	xnor 	%r16, 0x02b5, %r5
	.word 0x96440011  ! 887: ADDC_R	addc 	%r16, %r17, %r11
	.word 0x96bc2ac1  ! 887: XNORcc_I	xnorcc 	%r16, 0x0ac1, %r11
	.word 0x84440011  ! 887: ADDC_R	addc 	%r16, %r17, %r2
	.word 0x902c0011  ! 887: ANDN_R	andn 	%r16, %r17, %r8
	.word 0xc29c2d40  ! 888: LDDA_I	ldda	[%r16, + 0x0d40] %asi, %r1
thr0_irf_ce_73:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_73), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xc44c2675  ! 890: LDSB_I	ldsb	[%r16 + 0x0675], %r2
	.word 0x96ac0011  ! 892: ANDNcc_R	andncc 	%r16, %r17, %r11
	.word 0x94940011  ! 892: ORcc_R	orcc 	%r16, %r17, %r10
	.word 0x952c0011  ! 892: SLL_R	sll 	%r16, %r17, %r10
	.word 0x8e3c21d0  ! 892: XNOR_I	xnor 	%r16, 0x01d0, %r7
	.word 0x95340011  ! 892: SRL_R	srl 	%r16, %r17, %r10
	.word 0xb4ac0011  ! 892: ANDNcc_R	andncc 	%r16, %r17, %r26
	.word 0xa92c1011  ! 892: SLLX_R	sllx	%r16, %r17, %r20
	.word 0xd8dc1011  ! 893: LDXA_R	ldxa	[%r16, %r17] 0x80, %r12
	.word 0xec8c1011  ! 895: LDUBA_R	lduba	[%r16, %r17] 0x80, %r22
	.word 0x889420c3  ! 897: ORcc_I	orcc 	%r16, 0x00c3, %r4
	.word 0x9e3c0011  ! 897: XNOR_R	xnor 	%r16, %r17, %r15
	.word 0x948c0011  ! 897: ANDcc_R	andcc 	%r16, %r17, %r10
	.word 0x82042e06  ! 897: ADD_I	add 	%r16, 0x0e06, %r1
	.word 0xb6142626  ! 897: OR_I	or 	%r16, 0x0626, %r27
	.word 0x973c0011  ! 897: SRA_R	sra 	%r16, %r17, %r11
	.word 0x8ab40011  ! 897: ORNcc_R	orncc 	%r16, %r17, %r5
thr0_dc_err_77:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_77), 16, 16),1,DC_DATA,12)
	.word 0xcb142626  ! 899: LDQF_I	-	[%r16, 0x0626], %f5
thr0_irf_ce_74:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_74), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xcd841011  ! 901: LDFA_R	lda	[%r16, %r17], %f6
	.word 0xa6440011  ! 903: ADDC_R	addc 	%r16, %r17, %r19
	.word 0x90340011  ! 903: ORN_R	orn 	%r16, %r17, %r8
	.word 0xab2c1011  ! 903: SLLX_R	sllx	%r16, %r17, %r21
	.word 0x90c4269e  ! 903: ADDCcc_I	addccc 	%r16, 0x069e, %r8
	.word 0x98c4229d  ! 903: ADDCcc_I	addccc 	%r16, 0x029d, %r12
	.word 0x8c840011  ! 903: ADDcc_R	addcc 	%r16, %r17, %r6
	.word 0xcc4c2d2e  ! 904: LDSB_I	ldsb	[%r16 + 0x0d2e], %r6
thr0_irf_ce_75:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_75), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xdf0420a7  ! 906: LDF_I	ld	[%r16, 0x00a7], %f15
	.word 0x96bc22db  ! 908: XNORcc_I	xnorcc 	%r16, 0x02db, %r11
	.word 0x92440011  ! 908: ADDC_R	addc 	%r16, %r17, %r9
	.word 0xb52c0011  ! 908: SLL_R	sll 	%r16, %r17, %r26
	.word 0x8c9422d3  ! 908: ORcc_I	orcc 	%r16, 0x02d3, %r6
	.word 0xb3342001  ! 908: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0xa72c2001  ! 908: SLL_I	sll 	%r16, 0x0001, %r19
	.word 0xaa3c0011  ! 908: XNOR_R	xnor 	%r16, %r17, %r21
thr0_dc_err_78:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_78), 16, 16),1,DC_DATA,0)
	.word 0xeb1c22d3  ! 910: LDDF_I	ldd	[%r16, 0x02d3], %f21
thr0_irf_ce_76:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_76), 16, 16),1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xf4c41011  ! 912: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r26
	.word 0x8c042569  ! 914: ADD_I	add 	%r16, 0x0569, %r6
	.word 0x99643801  ! 914: MOVcc_I	<illegal instruction>
	.word 0x9a340011  ! 914: ORN_R	orn 	%r16, %r17, %r13
	.word 0x961c0011  ! 914: XOR_R	xor 	%r16, %r17, %r11
	.word 0x99341011  ! 914: SRLX_R	srlx	%r16, %r17, %r12
	.word 0x9c2c0011  ! 914: ANDN_R	andn 	%r16, %r17, %r14
	.word 0x952c3001  ! 914: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0x9c940011  ! 914: ORcc_R	orcc 	%r16, %r17, %r14
thr0_dc_err_79:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_79), 16, 16),1,DC_DATA,50)
	.word 0xdc042569  ! 916: LDUW_I	lduw	[%r16 + 0x0569], %r14
	.word 0xdb1c283d  ! 918: LDDF_I	ldd	[%r16, 0x083d], %f13
	.word 0x902c0011  ! 920: ANDN_R	andn 	%r16, %r17, %r8
	.word 0x90840011  ! 920: ADDcc_R	addcc 	%r16, %r17, %r8
	.word 0xa7341011  ! 920: SRLX_R	srlx	%r16, %r17, %r19
	.word 0x9c440011  ! 920: ADDC_R	addc 	%r16, %r17, %r14
	.word 0x86442e18  ! 920: ADDC_I	addc 	%r16, 0x0e18, %r3
	.word 0x8f3c0011  ! 920: SRA_R	sra 	%r16, %r17, %r7
	.word 0x9a140011  ! 920: OR_R	or 	%r16, %r17, %r13
thr0_dc_err_80:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_80), 16, 16),1,DC_DATA,12)
	.word 0xdb841000  ! 922: LDFA_R	lda	[%r16, %r0], %f13
	.word 0xc3140011  ! 924: LDQF_R	-	[%r16, %r17], %f1
	.word 0x981c2e26  ! 926: XOR_I	xor 	%r16, 0x0e26, %r12
	.word 0x933c1011  ! 926: SRAX_R	srax	%r16, %r17, %r9
	.word 0xba040011  ! 926: ADD_R	add 	%r16, %r17, %r29
	.word 0x9e3c24b0  ! 926: XNOR_I	xnor 	%r16, 0x04b0, %r15
	.word 0x852c0011  ! 926: SLL_R	sll 	%r16, %r17, %r2
thr0_dc_err_81:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_81), 16, 16),1,DC_DATA,27)
	.word 0xc49424b0  ! 928: LDUHA_I	lduha	[%r16, + 0x04b0] %asi, %r2
	.word 0xf5841011  ! 930: LDFA_R	lda	[%r16, %r17], %f26
	.word 0xac3c291b  ! 932: XNOR_I	xnor 	%r16, 0x091b, %r22
	.word 0x993c1011  ! 932: SRAX_R	srax	%r16, %r17, %r12
	.word 0xac440011  ! 932: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x84ac0011  ! 932: ANDNcc_R	andncc 	%r16, %r17, %r2
	.word 0xbb341011  ! 932: SRLX_R	srlx	%r16, %r17, %r29
	.word 0xb08c2028  ! 932: ANDcc_I	andcc 	%r16, 0x0028, %r24
	.word 0x96442dc0  ! 932: ADDC_I	addc 	%r16, 0x0dc0, %r11
	.word 0x9aac21f2  ! 932: ANDNcc_I	andncc 	%r16, 0x01f2, %r13
thr0_dc_err_82:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_82), 16, 16),1,DC_DATA,18)
	.word 0xda8c1000  ! 934: LDUBA_R	lduba	[%r16, %r0] 0x80, %r13
thr0_irf_ce_77:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_77), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
        wr  %g0, 0x80, %asi
	.word 0x937c0411  ! 938: MOVR_R	move	%r16, %r17, %r9
	.word 0x8d643801  ! 938: MOVcc_I	<illegal instruction>
	.word 0x91641811  ! 938: MOVcc_R	<illegal instruction>
	.word 0x94bc0011  ! 938: XNORcc_R	xnorcc 	%r16, %r17, %r10
	.word 0x957c2401  ! 938: MOVR_I	move	%r16, 0xfffffe54, %r10
	.word 0xb40c207f  ! 938: AND_I	and 	%r16, 0x007f, %r26
	.word 0xd51c0011  ! 939: LDDF_R	ldd	[%r16, %r17], %f10
!Illinst store
	.word 0xea340011  ! 941: STH_R	sth	%r21, [%r16 + %r17]
	.word 0xb20c21f9  ! 943: AND_I	and 	%r16, 0x01f9, %r25
	.word 0xb17c2401  ! 943: MOVR_I	move	%r16, 0xfffffe54, %r24
	.word 0xac8c2874  ! 943: ANDcc_I	andcc 	%r16, 0x0874, %r22
	.word 0x8a042f6a  ! 943: ADD_I	add 	%r16, 0x0f6a, %r5
	.word 0xa68c2b4e  ! 943: ANDcc_I	andcc 	%r16, 0x0b4e, %r19
	.word 0xab340011  ! 943: SRL_R	srl 	%r16, %r17, %r21
	.word 0x860422e6  ! 943: ADD_I	add 	%r16, 0x02e6, %r3
thr0_dc_err_83:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_83), 16, 16),1,DC_DATA,26)
	.word 0xc7841000  ! 945: LDFA_R	lda	[%r16, %r0], %f3
thr0_irf_ce_78:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_78), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xcf841011  ! 947: LDFA_R	lda	[%r16, %r17], %f7
	.word 0x877c0411  ! 949: MOVR_R	move	%r16, %r17, %r3
	.word 0x989c0011  ! 949: XORcc_R	xorcc 	%r16, %r17, %r12
	.word 0x8c040011  ! 949: ADD_R	add 	%r16, %r17, %r6
	.word 0x952c3001  ! 949: SLLX_I	sllx	%r16, 0x0001, %r10
	.word 0xae842d59  ! 949: ADDcc_I	addcc 	%r16, 0x0d59, %r23
	.word 0xa93c0011  ! 949: SRA_R	sra 	%r16, %r17, %r20
	.word 0x932c1011  ! 949: SLLX_R	sllx	%r16, %r17, %r9
	.word 0x91341011  ! 949: SRLX_R	srlx	%r16, %r17, %r8
thr0_dc_err_84:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_84), 16, 16),1,DC_DATA,48)
	.word 0xd0142d59  ! 951: LDUH_I	lduh	[%r16 + 0x0d59], %r8
	.word 0xd91c2202  ! 953: LDDF_I	ldd	[%r16, 0x0202], %f12
	.word 0x9ac40011  ! 955: ADDCcc_R	addccc 	%r16, %r17, %r13
	.word 0x942c2ace  ! 955: ANDN_I	andn 	%r16, 0x0ace, %r10
	.word 0x90440011  ! 955: ADDC_R	addc 	%r16, %r17, %r8
	.word 0xaf2c2001  ! 955: SLL_I	sll 	%r16, 0x0001, %r23
	.word 0xb77c0411  ! 955: MOVR_R	move	%r16, %r17, %r27
	.word 0x822c0011  ! 955: ANDN_R	andn 	%r16, %r17, %r1
	.word 0xc20c2c13  ! 956: LDUB_I	ldub	[%r16 + 0x0c13], %r1
	.word 0xd99c1011  ! 958: LDDFA_R	ldda	[%r16, %r17], %f12
	.word 0xb63c2c86  ! 960: XNOR_I	xnor 	%r16, 0x0c86, %r27
	.word 0xb7342001  ! 960: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0x852c1011  ! 960: SLLX_R	sllx	%r16, %r17, %r2
	.word 0xb7341011  ! 960: SRLX_R	srlx	%r16, %r17, %r27
	.word 0x861c2949  ! 960: XOR_I	xor 	%r16, 0x0949, %r3
	.word 0xb69c25d4  ! 960: XORcc_I	xorcc 	%r16, 0x05d4, %r27
	.word 0x9b641811  ! 960: MOVcc_R	<illegal instruction>
thr0_dc_err_85:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_85), 16, 16),1,DC_DATA,1)
	.word 0xdb1425d4  ! 962: LDQF_I	-	[%r16, 0x05d4], %f13
	.word 0xca042698  ! 964: LDUW_I	lduw	[%r16 + 0x0698], %r5
	.word 0x8a042404  ! 966: ADD_I	add 	%r16, 0x0404, %r5
	.word 0xb4ac2a5d  ! 966: ANDNcc_I	andncc 	%r16, 0x0a5d, %r26
	.word 0xb1342001  ! 966: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0xba1c239b  ! 966: XOR_I	xor 	%r16, 0x039b, %r29
	.word 0x8d641811  ! 966: MOVcc_R	<illegal instruction>
	.word 0x969c2841  ! 966: XORcc_I	xorcc 	%r16, 0x0841, %r11
	.word 0x9f641811  ! 966: MOVcc_R	<illegal instruction>
	.word 0xae940011  ! 966: ORcc_R	orcc 	%r16, %r17, %r23
	.word 0xcac41011  ! 967: LDSWA_R	ldswa	[%r16, %r17] 0x80, %r5
	.word 0xd6cc1011  ! 969: LDSBA_R	ldsba	[%r16, %r17] 0x80, %r11
	.word 0x8e9c0011  ! 971: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x8ac4271b  ! 971: ADDCcc_I	addccc 	%r16, 0x071b, %r5
	.word 0x87340011  ! 971: SRL_R	srl 	%r16, %r17, %r3
	.word 0x9b340011  ! 971: SRL_R	srl 	%r16, %r17, %r13
	.word 0xa92c1011  ! 971: SLLX_R	sllx	%r16, %r17, %r20
	.word 0x9a1421b9  ! 971: OR_I	or 	%r16, 0x01b9, %r13
	.word 0x897c2401  ! 971: MOVR_I	move	%r16, 0xfffffe54, %r4
	.word 0x9004286f  ! 971: ADD_I	add 	%r16, 0x086f, %r8
thr0_dc_err_86:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_86), 16, 16),1,DC_DATA,65)
	.word 0xd05c0000  ! 973: LDX_R	ldx	[%r16 + %r0], %r8
	.word 0xd0941011  ! 975: LDUHA_R	lduha	[%r16, %r17] 0x80, %r8
	.word 0x9eac0011  ! 977: ANDNcc_R	andncc 	%r16, %r17, %r15
	.word 0xb8842bca  ! 977: ADDcc_I	addcc 	%r16, 0x0bca, %r28
	.word 0x9e442416  ! 977: ADDC_I	addc 	%r16, 0x0416, %r15
	.word 0x8b343001  ! 977: SRLX_I	srlx	%r16, 0x0001, %r5
	.word 0x94ac0011  ! 977: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0x949c2134  ! 977: XORcc_I	xorcc 	%r16, 0x0134, %r10
	.word 0x9e8c209d  ! 977: ANDcc_I	andcc 	%r16, 0x009d, %r15
	.word 0xf6540011  ! 978: LDSH_R	ldsh	[%r16 + %r17], %r27
	.word 0xc81c2242  ! 980: LDD_I	ldd	[%r16 + 0x0242], %r4
	.word 0x9c040011  ! 982: ADD_R	add 	%r16, %r17, %r14
	.word 0x840c0011  ! 982: AND_R	and 	%r16, %r17, %r2
	.word 0x9f641811  ! 982: MOVcc_R	<illegal instruction>
	.word 0x90340011  ! 982: ORN_R	orn 	%r16, %r17, %r8
	.word 0x920c26ab  ! 982: AND_I	and 	%r16, 0x06ab, %r9
	.word 0x968c232a  ! 982: ANDcc_I	andcc 	%r16, 0x032a, %r11
thr0_dc_err_87:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_87), 16, 16),1,DC_DATA,10)
	.word 0xd61c0000  ! 984: LDD_R	ldd	[%r16 + %r0], %r11
thr0_irf_ce_79:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_79), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xf8242043  ! 988: STW_I	stw	%r28, [%r16 + 0x0043]
	.word 0x9b2c0011  ! 990: SLL_R	sll 	%r16, %r17, %r13
	.word 0x92bc0011  ! 990: XNORcc_R	xnorcc 	%r16, %r17, %r9
	.word 0x9abc2f10  ! 990: XNORcc_I	xnorcc 	%r16, 0x0f10, %r13
	.word 0x9a840011  ! 990: ADDcc_R	addcc 	%r16, %r17, %r13
	.word 0x963c0011  ! 990: XNOR_R	xnor 	%r16, %r17, %r11
	.word 0x903c2b67  ! 990: XNOR_I	xnor 	%r16, 0x0b67, %r8
	.word 0x993c0011  ! 990: SRA_R	sra 	%r16, %r17, %r12
	.word 0xce842c92  ! 991: LDUWA_I	lduwa	[%r16, + 0x0c92] %asi, %r7
thr0_irf_ce_80:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_80), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
thr0_resum_intr_759:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_759), 16, 16)) -> intp(0, 3, 1)
	wr      %r0, 0x0, %asr26
	.word 0x86c427d6  ! 995: ADDCcc_I	addccc 	%r16, 0x07d6, %r3
	.word 0xac440011  ! 995: ADDC_R	addc 	%r16, %r17, %r22
	.word 0x8b3c0011  ! 995: SRA_R	sra 	%r16, %r17, %r5
	.word 0xb00429db  ! 995: ADD_I	add 	%r16, 0x09db, %r24
	.word 0x8e9c0011  ! 995: XORcc_R	xorcc 	%r16, %r17, %r7
	.word 0x9d2c0011  ! 995: SLL_R	sll 	%r16, %r17, %r14
	.word 0x90c40011  ! 995: ADDCcc_R	addccc 	%r16, %r17, %r8
	.word 0xb53c2001  ! 995: SRA_I	sra 	%r16, 0x0001, %r26
thr0_dc_err_88:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_88), 16, 16),1,DC_DATA,40)
	.word 0xf51c0000  ! 997: LDDF_R	ldd	[%r16, %r0], %f26
thr0_irf_ce_81:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_81), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
	.word  0xe5a612fd,0xe3883454,0x798480e8,0xf540d21f
	.word  0xda0feaf9,0xc8182a42,0x6ad07494,0xee3374bc
	.word  0xf773bd49,0x5ba3ce2d,0xec27e759,0x5743b10f
	.word  0xd1411a76,0x4d2039bc,0xc583a049,0xd9c3fe64
	.word  0xfd45bb8a,0xf028e000,0x354db7c6,0xfe69b878
	.word  0x293f21d0,0xf5f758a4,0x5172c444,0xbd727ed1
	.word  0x5d373f3a,0x8e3afeb0,0xccb116bb,0xa035e979
	.word  0x22fd2689,0xf2389d9c,0x32ad740b,0x67387a8e
	.word  0x7ee86e61,0xdce71e7c,0x76e34bec,0x1cd50f7f
	.word  0xf4aec6f3,0xe996a937,0x4f5a4fb0,0xc5491c69
	.word  0xb38104f5,0xf66d13bf,0xc5be78d7,0xb285eb1f
	.word  0x03affcf3,0x4ab74d37,0xc9f595cc,0x5ac01265
	.word  0x489ed7c6,0xa2d4b8ee,0x3c32e0c8,0x03d36750
	.word  0x8860da7f,0xd3efbeac,0x2ad8c258,0x7a6028bf
	.word  0x1e4544d9,0xc4588cb7,0x5d68842d,0x83e3af13
	.word  0xe80185f9,0xddc726eb,0xbe0355d7,0x5c2f5c1a
	.word  0x0edba7aa,0xaba37271,0x0e112f02,0xa063ee95
	.word  0x5df0264d,0xa36570c4,0x388737af,0x7b27c0b4
	.word  0xa04b1d34,0x428d85a3,0xc9583685,0x14888f7d
	.word  0x490e6012,0x5a207670,0xe732066d,0xe2e5e6a3
	.word  0x5732b6f2,0x2a509bff,0x2fc32ce1,0xbef98c0a
	.word  0xf468bcd6,0x6379595e,0xd97389cc,0xc16eddd8
	.word  0x9578c0ee,0x52b46735,0xb4fb2752,0xc958bc9a
	.word  0x496fa91b,0xa1948373,0xfc31db1e,0xe91ac680
	.word  0xe8544579,0x7bd3f2ac,0x746d2660,0x72c0fac7
	.word  0x3e732851,0x47a182b0,0x4f8ecfc3,0xb6f56e87
	.word  0x4ad7b396,0x58d1302d,0xe8ab45fc,0x0022b672
	.word  0x6f3556e6,0xa8322473,0x6091c4ab,0x8aef3a6e
	.word  0xa9fc3b9b,0x023ee745,0xdc765807,0x84ea07b2
	.word  0x3d5c3e7d,0x846f1fdd,0xdb662f6d,0xfe9dec6e
	.word  0x6de635a0,0x5993c442,0x63312cf7,0x90b34689
	.word  0x9607ea93,0xbcd42386,0x8abf009f,0xb9d1c304
	.word  0xe6dd8847,0xf2581b53,0x5045b710,0x5e5bcf67
	.word  0x19f52fd8,0xe9dfb9f4,0x1cd720ab,0xf8abae8e
	.word  0x91d13f34,0x2daef8b1,0x1cf4535b,0x2d8887bb
	.word  0x6965aed0,0xa0769260,0x911bab41,0x22d9aa94
	.word  0x18f7737d,0x3239db2a,0x2237f847,0xf920b743
	.word  0xda54f240,0x2ca1f908,0x91cdf76a,0x42791ff6
	.word  0x45f9d035,0xea8c879a,0xdb65530b,0x1807cd24
	.word  0x4e9f8a7e,0x97132988,0x34cd3ce8,0x6ce10ce9
	.word  0x9d568a72,0x8efbb6e5,0x6efbc800,0xdbfb621a
	.word  0xeec86a17,0x4793671f,0xdc607ab9,0x9416c38f
	.word  0x7a0afe0a,0xb9e95b71,0x3ccc4d7f,0xf025b36c
	.word  0x7b30a2cd,0x74601391,0x95eb3dab,0x941a9d2f
	.word  0x6aac471b,0x56b1ac27,0x6bd96564,0x6deb1b15
	.word  0x3e790cb4,0xfe36e7dd,0x3ba4c6bb,0x7ed2d71a
	.word  0x3c2273ea,0x5260fbe2,0xe01f21d7,0x059962ba
	.word  0x225c3200,0xfabd3ab0,0x3165cd52,0xf10c7eba
	.word  0x5d83c2b3,0xdf91d446,0x3aac04d5,0x4865c54a
	.word  0x87d81035,0x4d53cf29,0x1bdc679a,0xf9462b5d
	.word  0xd310f10f,0x392af58b,0xa690d2b1,0x156a96b2
	.word  0x455e7f04,0x2c7928bf,0xd4d31b91,0x003107fc
	.word  0xbd53ba25,0x764f9823,0xe4eb098d,0xfb89a2a2
	.word  0xdfde3786,0xff1e7330,0x78ed0daf,0xac2a3ea5
	.word  0xa6140f32,0xd1d9230a,0xa76d77ee,0x60deb011
	.word  0x4c9f6063,0x68273339,0xc97cb49a,0x3d0fcad5
	.word  0xd923a834,0x3ac2917f,0x63f63af3,0x0016fafe
	.word  0x20c82d62,0x21d82d23,0x2509c7e2,0xe31b9f44
	.word  0xdbadd609,0x256a8ce6,0x13f37d2b,0xe86fec0c
	.word  0x52effe5f,0x20f42bec,0xca00ed74,0xf7a94352
	.word  0xc015f642,0xbfb1c194,0x33d7fbe0,0x64c05e26
	.word  0x72758e44,0xa9c13e9f,0x5df95966,0xbe72cc79
	.word  0x9e87b4d4,0x229a7413,0xd21ad954,0xd0fe0384
	.word  0x0d27cf2c,0xc7bed453,0x0e6f325c,0xcf564f69
	.word  0x68b015ff,0x7ddc21ea,0x4d2cca0d,0x675cc2ad
	.word  0xd2c930c2,0x232db5ac,0xfcd76670,0x6389c108
	.word  0xc4312b52,0x8fee96f8,0xcd41a3f4,0xc5b7438b
	.word  0x8384f2d5,0xb0a73c05,0x15c326e4,0x142be943
	.word  0xf6901881,0xa29b131f,0x4fe372ce,0x7fb60a65
	.word  0x63ac3c81,0x9643552d,0xb5aebeda,0x3b00d280
	.word  0xd523e811,0x35337750,0x4033172d,0x0ccb41ea
	.word  0x87ac89ba,0x0acf091d,0x9031d6b9,0xc3bd61da
	.word  0xce6d795e,0x8503011e,0x55ebf399,0xe641cd64
	.word  0xe3b37a33,0x0a139461,0x1abc66e8,0xa5cc9cf6
	.word  0xe9c82e06,0xd8238059,0xda338425,0x9157b589
	.word  0x04a806d9,0x4c0572d0,0xbf38b402,0x01eeb539
	.word  0x67b5f5f1,0xb7b4f610,0x9c0ed7b2,0xb2ede41b
	.word  0x7fab5547,0x9aa2c869,0x171d361e,0x6ccec900
	.word  0x49b4fa23,0x23ad91df,0x3d9a0d6e,0xbee57eef
	.word  0x229b21d8,0x02945102,0x304a5915,0x99044015
	.word  0x0104011a,0x68c845fd,0x6acfc36c,0xd05dbb09
	.word  0x97e06c21,0xc406545c,0x08070903,0x4c70611b
	.word  0x0343f2d3,0x17a36e00,0xc8ec01fe,0x0c9ee382
	.word  0xfdf76f0b,0xbd7731ec,0x3df876b7,0x949e2a11
	.word  0xfccce423,0x5711f6dd,0x60f13ade,0x15b767b3
	.word  0xbf07b077,0xcb2962c6,0x15347e30,0x131300f2
	.word  0x80071ccb,0x5b50aa68,0xd74a1c10,0x4c60f991
	.word  0xf9708ab8,0xb4f14df5,0xc0289dcb,0xa88d2412
	.word  0x56d6f7e6,0x92ce4994,0xd32718ef,0xcf7ab47a
	.word  0x40ef742e,0x75772e17,0xa20c3cd8,0x4eccf14e
	.word  0x31d162b0,0xbf9af007,0xeb75df98,0xff868b57
	.word  0xe9762aa9,0x2e4d02e3,0xcb209055,0xc5c94659
	.word  0xaa957a1c,0x27fe52c7,0x111915e6,0x484c9e34
	.word  0xc53148ec,0x82df1e71,0x89988ed6,0x37c6246f
	.word  0x763cb2c1,0x7ee0c3bd,0x0dc43eeb,0x5cd0688f
	.word  0xca22fb01,0xc50d9f1d,0x14ff9e57,0x6c8cb669
	.word  0xd9157ae1,0x94b3af18,0xb7f031e1,0xa82f4aa5
	.word  0x399fac4d,0x06185a1d,0xf4ef77b9,0x718feb39
	.word  0xa767172a,0x0936d9b7,0x93d1acdb,0x497d2bec
	.word  0x9cb37bac,0x9a541195,0x0d7a287f,0x92d9bf32
	.word  0xd6a8e91a,0x8f2c7685,0x95eb55f1,0x12919fd8
	.word  0x49ab356a,0x93c2b99b,0xadbd6061,0xa85f219b
	.word  0xbce07e93,0x74a357c5,0x1ce9b224,0xe80f2543
	.word  0x91c71c17,0xe2520fc7,0x5aae34b9,0x32f8c599
	.word  0x064e96f9,0x419a7b31,0x33e1ec2a,0x5291bcc7
	.word  0x17d3f8fe,0x615c6ec1,0xdee4f0f2,0x12a46053
	.word  0x772da8a8,0xdfa0766e,0x5a2b62bc,0x25fd16c2
	.word  0xb6eb8ba5,0xc812ecf5,0x3ce3b31c,0xc49a2036
	.word  0x5fa4a179,0x8fb5d148,0xe21e8927,0x4be26f33
	.word  0x72d002d1,0x144652e3,0x5da7a4de,0x1b720bea
	.word  0x648c31c0,0xca9e9280,0xd3e7cc1f,0xde3ab9c3
	.word  0x6fe90a69,0xe96a239b,0x4e906436,0x9467c663
	.word  0x21edc22b,0xc16d74fb,0x19864a61,0xbe85677d
	.word  0x4b55a375,0x097983d9,0xe5c10388,0xb7585cba
	.word  0x8e1f25d6,0xb3508b56,0x329a5f47,0x272be7d5
	.word  0x558f74a7,0x796c379e,0xac62d830,0x424f2057
	.word  0x64021a4d,0x8c3415f5,0x491b74f8,0xec40e7ab
	.word  0xbc8af41d,0xbbd0a6b9,0xe89092c4,0x1594b3f6
	.word  0x55840df5,0x228e2c57,0x70d9f617,0x5437fa65
	.word  0x45c2ca46,0x36cab5ba,0xa9a6d565,0x54b41e91
	.word  0x75ed7f5e,0x1b37e347,0xfe1b64ff,0xa30c3ac4
	.word  0xee790adc,0xfe57e6c5,0x8d0816d1,0xfc668bf4
	.word  0x881e540c,0x3c1a8ea1,0x927a6fed,0x657128f8
	.word  0x00595a10,0x15bde5aa,0x02013230,0x3b171a3e
	.word  0x4a69dea2,0xc168522b,0xf5df7f53,0x177db5a3
	.word  0xcaa281ba,0x1d142edd,0x71ed9f42,0xda895f16
	.word  0x9fccf1a6,0xd77922cb,0x4d08dc96,0x7bec2f06
	.word  0xbc193858,0xe6d36bf0,0x1e371d64,0x111158aa
	.word  0x78d8b4aa,0x532c4c6d,0x399ee54c,0x966d171a
	.word  0x8b295c2e,0x7bee7b6f,0xef2d988c,0x61760b46
	.word  0xb40d34ef,0x9c9730e3,0xc8ebc7d8,0xc4584253
	.word  0x6dd62db0,0x1426d184,0x8cbc8d39,0x6d4d7bc0
	.word  0x703b68a6,0x2c3fa39f,0x5284b415,0xcd314e32
	.word  0x2181724a,0xe3dc913e,0x1f8a3672,0x462435d4
	.word  0x0b84f2ab,0x3be20376,0x8a4e3019,0x6e0e4b8c
	.word  0x30dc84da,0xe7715121,0x27ad32ac,0x9f7b027c
	.word  0xf81d0644,0x61d3fbdd,0x7cd71973,0x3d1e3838
	.word  0x67a5c40c,0x09410cc2,0x5867fe21,0x350ec88e
	.word  0xc5da909a,0xe3ec363f,0x388c77cd,0xa05a11ae
	.word  0x5651a626,0x5ad133ae,0xc461f540,0x0f41bc41
	.word  0x493b0b1c,0xb20e0301,0xd8c51f02,0xe2ac487a
	.word  0x0382c92f,0xf03e72bd,0x772da347,0x5b30f83d
	.word  0xb742423d,0x9f147789,0x441ef5c4,0x8b964e9d
	.word  0x3f23fcfb,0x0406d559,0xa9da902f,0xe7881b42
	.word  0x283ecc04,0x22bf27a0,0x39b7385c,0x55ec299d
	.word  0x8659a5d8,0x7de3fdf3,0x9dc9c88c,0x508fbe18
	.word  0xb0bce643,0x1a6cc157,0xb2a0e289,0x27ade7da
	.word  0xe049779f,0x2515c689,0xc6641f71,0xffcef69d
	.word  0xcaf3843f,0xc7fc0874,0x38d22635,0x69f6c658
	.word  0x3a548c13,0x8918826b,0x462898b7,0x9d9cea89
	.word  0xd2e6274b,0xef5e51c4,0x4c4604b1,0xc6bdaa13
	.word  0x1e83db3f,0xb328dd5e,0x9240ae8c,0x79bcdf07
	.word  0x1b443a56,0x2f425799,0x588d1e6e,0x895db5c4
	.word  0xf478b9a3,0x4c4f1ba2,0xfc760671,0x0cf7fb9d
	.word  0xe13ca570,0xb353224b,0x40c42dfb,0x4c66d2bf
	.word  0x21ac3a71,0xd446ad96,0x8b66190a,0x2887fad6
	.word  0x49cb2719,0xf61c7267,0xb382a20d,0xb43bcacd
	.word  0x8ae45ef5,0x794c1ffd,0x5a6704c7,0xfe66a39f
	.word  0xf971f50f,0x3338d7b9,0x5f54f563,0xf2469b8e
	.word  0xcfca8683,0x622817c3,0x64ff6fc5,0x55c6a13d
	.word  0xcd197301,0x3bd9b4f4,0x49cd0054,0xc3252c24
	.word  0x5240f827,0x3e51a1a6,0xdc4f0455,0xc7e27ee7
	.word  0x78df9078,0x51b3b76c,0x1abe4cf7,0xa7a0ca21
	.word  0x34c8590c,0x82c1fcdc,0xe78ea0b2,0xcb82b43e
	.word  0x62737546,0x8aa49139,0x5dcf3ba2,0x5fc0fa3e
	.word  0xdbc4e1bd,0xcf040045,0xa2e3bc3c,0x42c45825
	.word  0x144440b7,0xd009ea2c,0x1f121578,0xd61356de
	.word  0xfc658eec,0x3e390c8a,0x9ea5bbf0,0x9bfa236b
	.word  0x1c12ba29,0x9dbaa691,0x147433e2,0xb63228c4
	.word  0x0d6c70ce,0x7853aedf,0x1a11a154,0x296aeb35
	.word  0x76d17096,0xfd27dbfa,0x0c231c60,0xd262aac0
	.word  0xfd76dac7,0x310cfaa3,0x00769008,0xe71000e2
	.word  0xb8cdc51f,0x9065ffeb,0x41a81351,0x7cc840aa
	.word  0xf9f30bcd,0x5ef9d4ce,0xcd5edc9a,0x5ef52e16
	.word  0x1464a9b1,0x5f9f3e46,0x933ad767,0x41d186ec
	.word  0x103f50b1,0x509ccfd8,0x702582ad,0x17924819
	.word  0xc8e26368,0xb8a8d1dd,0xb8964055,0xffcb8519
	.word  0xdd074463,0xb0b66733,0xadc6bd19,0x27e05d5f
	.word  0x5bcefcb7,0x15123802,0xf59fdfbb,0x47c6b0c9
	.word  0xe8ae56b7,0x0c1cd4ca,0x87e9c1df,0xae2b932f
	.word  0xed61e3c5,0xc2c694e8,0xfabcf574,0xda31834b
	.word  0x65bf1a73,0x2870fbe4,0xd337a0a9,0x27d19ff8
	.word  0x19124e74,0xda21264c,0xe7479bac,0xa0523680
	.word  0x8ebb9a96,0x04b2fb20,0xae4313d8,0x3c16c4c8
	.word  0x03bd0ad7,0x279ba459,0x2d74a6bf,0x44dea018
	.word  0xb927113f,0xcbcb8466,0xd007cbd7,0x4992fb98
	.word  0x56453d63,0xdea62aeb,0x3d5eeb1a,0xc58c3d87
	.word  0x1573a5d2,0xbf1d1f53,0xa9b19d88,0x5d9ea727
	.word  0xd5785af9,0xaedbfa8d,0x90ba2928,0x5200eaf7
	.word  0x6360ae88,0x8bc47c4c,0xa5259bf2,0xc26f2f95
	.word  0x4e5a681c,0x20c02d74,0xe239a4ea,0x8a460789
	.word  0x3a7655b1,0x01974ea7,0xa8d2b1a3,0x500097bf
	.word  0x2ab27742,0x68cbd6ab,0xb15506a3,0x5f5c2de3
	.word  0xcac7ca1d,0x37eda94f,0x7d62fe6c,0x54164b8a
	.word  0xd692b91d,0xa0ae2873,0x2601f3a5,0x169ffa04
	.word  0x7eb09b6d,0xed559d12,0x85245768,0x87b76c5f
	.word  0xda84e9de,0x23bf9e87,0xcd090486,0x54f02cbb
	.word  0x06714840,0xfb56c637,0xf325d82f,0x1d118c0d
	.word  0x8c485211,0xde3247f2,0x4ff222fe,0x31e2ff2d
	.word  0x5d3a3710,0xfe13222a,0x42bfb0db,0x9a60d2e8
	.word  0x2f1987b3,0xb809ae25,0xf0451a84,0x7537432e
	.word  0x5e72dcc4,0x9683dd2f,0x8ee80aa5,0x95b5ef43
	.word  0x217b0d96,0xefac1a24,0x7ae39e9a,0x358c2d2a
	.word  0xd8b87b49,0xfebad73a,0xd0fbcea5,0x1f4cf5f9
	.word  0xa2d7c990,0xeea69673,0xfb1612f4,0x92044c41
	.word  0x57d518a9,0xa8de18df,0x6b8dd378,0xe0f50276
	.word  0xd118afa3,0x80a73555,0x00346a4f,0xede7ef35
	.word  0x4b68b25f,0x50c57702,0x0dacc896,0x647625c8
	.word  0x98cdb35a,0xed725335,0xe1a1d2ee,0x4f3cc226
	.word  0x09d98e2f,0x0b670d5b,0xc9f871a3,0x6aa78c88
	.word  0x120bb01d,0x6eb4306e,0xeb8c3c9c,0x14117a8f
	.word  0xd6064ce9,0xfb04e35f,0xd5afe877,0x97dcde91
	.word  0x25d1a9bc,0x2577ea11,0x1e1471d6,0xb7cf47fb
	.word  0xb86a8f72,0xeddb1e91,0xa14e3a0f,0x7d0c50c5
	.word  0x3b3f1431,0xa39531c8,0x5859ddcb,0xb3f4e827
	.word  0x0432c16b,0x26ccb6df,0xe51ef240,0xb118b7ba
	.word  0x4d7886bd,0x9c014ab8,0x3dd70c2e,0x3f7b661f
	.word  0x9d637e85,0x94f0c6d9,0xdcfb7daa,0xc7d4459e
	.word  0x093c2ccc,0xf073ddbe,0x63221a3e,0x36a2a843
	.word  0x2a66ce8c,0x25d33159,0x348e64af,0x374ea178
	.word  0x199e6539,0x526bccb0,0xbedb58e1,0x75811438
	.word  0x417bce4f,0xa67681d8,0x9a6078fb,0xc140e7f0
	.word  0x74933d26,0xd3b188c1,0x86b9747b,0xb898b3e1
	.word  0xe12c42dd,0xa096c7df,0xf1aee5dd,0xf40b7eec
	.word  0xd7674c45,0xbae0250c,0xfc02638d,0xa5d59182
	.word  0x9e16d689,0xd0aa19c1,0x83b6a400,0x22d7b9d3
	.word  0x72855619,0xa8ab9847,0xbb453d05,0x4fac1a2e
	.word  0xdab272bd,0x8f4c870a,0xd9cf1bd0,0xce757279
	.word  0x0ab5e04f,0x8687c661,0x932da26e,0xc19b7e11
	.word  0xfc71e7cd,0x7ac37055,0xc205af51,0xd5e7876e
	.word  0x8fecfe01,0xb0f91b89,0x55f0be9b,0x8e0924da
	.word  0x6feea71d,0x75812263,0x8ae79069,0xc875ece9
	.word  0x87dac590,0xed8dc0e4,0xff14e66e,0x11471ade
	.word  0x0cb1b892,0x1397b5f1,0xb5dd7228,0xab0ebec6
	.word  0x6ff5a97c,0x32999220,0xd8b3b365,0xadc59976
	.word  0xc516d367,0x41c6be31,0xbbbd1fc4,0x79eed788
	.word  0x9dfab4f1,0xcc0d2ec1,0xe2ea06b3,0x82a529be
	.word  0x961a30d2,0xb8415cbb,0xf6abd224,0xd13e2131
	.word  0x0763142d,0x1fc8958c,0x6e1ccdda,0x8ca7df14
	.word  0xde8a9d5c,0x70d98aae,0x44042102,0x3c434bcf
	.word  0x709bc428,0x4723888c,0x02bb9efd,0x2ae1b0f6
	.word  0x7bb1e3cc,0x15ff67ad,0x0b0b3e26,0xdc058adf
	.word  0x590e4d61,0x9c43a20e,0x9a48733a,0x46ac8df4
	.word  0xc4ab49ba,0xc116c431,0x6b6da0b7,0xd37b0ce2
	.word  0x4c20f4dd,0x6b57dbe8,0xe533c95c,0x27ef736b
	.word  0x5725c665,0xf0ae1375,0x92626e7e,0xf33d974a
	.word  0xbc9d1a5c,0x0ed6c2ed,0xe065ed9f,0xe1dc64a1
	.word  0xd5303ce6,0xee316970,0xb7113755,0x4f281dbf
	.word  0x8864024a,0x045fdca6,0x58ffc712,0x9511d794
	.word  0x49f4283b,0xb33e5bd0,0x74dd498b,0xb3ef15ac
	.word  0xf0b2d339,0x95547c0e,0xcd910749,0xbe015192
	.word  0xd0c5b0f3,0xbbe1495d,0xe2bd562b,0x87e5c42e
	.word  0xb9a7ee7d,0xab4e699b,0xfc8a5fef,0x2221b2dd
	.word  0x3fed214a,0x071d5ba9,0x56232aff,0x6d3492f8
	.word  0x64b85017,0xd1c648c7,0x825f153d,0x43430b46
	.word  0x6e7198cb,0xcbb1abe0,0x8efb7e87,0x6f943b60



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
!!# 	   | d30 loads_err jmpl alu_burst %rvar  low_wt
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
!!# 	   IJ_printf ("diag.j", 291, th_evnt, "\tjmpl     %%r18 + 0x28, %%r31\n");
!!# 	 } else {
!!# 	   IJ_printf ("diag.j", 293, th_evnt, "\treturn     %%r18 + 0x28\n");	   
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

